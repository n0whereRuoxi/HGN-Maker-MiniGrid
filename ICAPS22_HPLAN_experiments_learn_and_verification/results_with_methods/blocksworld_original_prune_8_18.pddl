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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_184406 - BLOCK
      ?auto_184407 - BLOCK
      ?auto_184408 - BLOCK
      ?auto_184409 - BLOCK
      ?auto_184410 - BLOCK
      ?auto_184411 - BLOCK
      ?auto_184412 - BLOCK
      ?auto_184413 - BLOCK
    )
    :vars
    (
      ?auto_184414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184414 ?auto_184413 ) ( CLEAR ?auto_184414 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184406 ) ( ON ?auto_184407 ?auto_184406 ) ( ON ?auto_184408 ?auto_184407 ) ( ON ?auto_184409 ?auto_184408 ) ( ON ?auto_184410 ?auto_184409 ) ( ON ?auto_184411 ?auto_184410 ) ( ON ?auto_184412 ?auto_184411 ) ( ON ?auto_184413 ?auto_184412 ) ( not ( = ?auto_184406 ?auto_184407 ) ) ( not ( = ?auto_184406 ?auto_184408 ) ) ( not ( = ?auto_184406 ?auto_184409 ) ) ( not ( = ?auto_184406 ?auto_184410 ) ) ( not ( = ?auto_184406 ?auto_184411 ) ) ( not ( = ?auto_184406 ?auto_184412 ) ) ( not ( = ?auto_184406 ?auto_184413 ) ) ( not ( = ?auto_184406 ?auto_184414 ) ) ( not ( = ?auto_184407 ?auto_184408 ) ) ( not ( = ?auto_184407 ?auto_184409 ) ) ( not ( = ?auto_184407 ?auto_184410 ) ) ( not ( = ?auto_184407 ?auto_184411 ) ) ( not ( = ?auto_184407 ?auto_184412 ) ) ( not ( = ?auto_184407 ?auto_184413 ) ) ( not ( = ?auto_184407 ?auto_184414 ) ) ( not ( = ?auto_184408 ?auto_184409 ) ) ( not ( = ?auto_184408 ?auto_184410 ) ) ( not ( = ?auto_184408 ?auto_184411 ) ) ( not ( = ?auto_184408 ?auto_184412 ) ) ( not ( = ?auto_184408 ?auto_184413 ) ) ( not ( = ?auto_184408 ?auto_184414 ) ) ( not ( = ?auto_184409 ?auto_184410 ) ) ( not ( = ?auto_184409 ?auto_184411 ) ) ( not ( = ?auto_184409 ?auto_184412 ) ) ( not ( = ?auto_184409 ?auto_184413 ) ) ( not ( = ?auto_184409 ?auto_184414 ) ) ( not ( = ?auto_184410 ?auto_184411 ) ) ( not ( = ?auto_184410 ?auto_184412 ) ) ( not ( = ?auto_184410 ?auto_184413 ) ) ( not ( = ?auto_184410 ?auto_184414 ) ) ( not ( = ?auto_184411 ?auto_184412 ) ) ( not ( = ?auto_184411 ?auto_184413 ) ) ( not ( = ?auto_184411 ?auto_184414 ) ) ( not ( = ?auto_184412 ?auto_184413 ) ) ( not ( = ?auto_184412 ?auto_184414 ) ) ( not ( = ?auto_184413 ?auto_184414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184414 ?auto_184413 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184416 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_184416 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_184416 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_184417 - BLOCK
    )
    :vars
    (
      ?auto_184418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184417 ?auto_184418 ) ( CLEAR ?auto_184417 ) ( HAND-EMPTY ) ( not ( = ?auto_184417 ?auto_184418 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184417 ?auto_184418 )
      ( MAKE-1PILE ?auto_184417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184426 - BLOCK
      ?auto_184427 - BLOCK
      ?auto_184428 - BLOCK
      ?auto_184429 - BLOCK
      ?auto_184430 - BLOCK
      ?auto_184431 - BLOCK
      ?auto_184432 - BLOCK
    )
    :vars
    (
      ?auto_184433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184433 ?auto_184432 ) ( CLEAR ?auto_184433 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184426 ) ( ON ?auto_184427 ?auto_184426 ) ( ON ?auto_184428 ?auto_184427 ) ( ON ?auto_184429 ?auto_184428 ) ( ON ?auto_184430 ?auto_184429 ) ( ON ?auto_184431 ?auto_184430 ) ( ON ?auto_184432 ?auto_184431 ) ( not ( = ?auto_184426 ?auto_184427 ) ) ( not ( = ?auto_184426 ?auto_184428 ) ) ( not ( = ?auto_184426 ?auto_184429 ) ) ( not ( = ?auto_184426 ?auto_184430 ) ) ( not ( = ?auto_184426 ?auto_184431 ) ) ( not ( = ?auto_184426 ?auto_184432 ) ) ( not ( = ?auto_184426 ?auto_184433 ) ) ( not ( = ?auto_184427 ?auto_184428 ) ) ( not ( = ?auto_184427 ?auto_184429 ) ) ( not ( = ?auto_184427 ?auto_184430 ) ) ( not ( = ?auto_184427 ?auto_184431 ) ) ( not ( = ?auto_184427 ?auto_184432 ) ) ( not ( = ?auto_184427 ?auto_184433 ) ) ( not ( = ?auto_184428 ?auto_184429 ) ) ( not ( = ?auto_184428 ?auto_184430 ) ) ( not ( = ?auto_184428 ?auto_184431 ) ) ( not ( = ?auto_184428 ?auto_184432 ) ) ( not ( = ?auto_184428 ?auto_184433 ) ) ( not ( = ?auto_184429 ?auto_184430 ) ) ( not ( = ?auto_184429 ?auto_184431 ) ) ( not ( = ?auto_184429 ?auto_184432 ) ) ( not ( = ?auto_184429 ?auto_184433 ) ) ( not ( = ?auto_184430 ?auto_184431 ) ) ( not ( = ?auto_184430 ?auto_184432 ) ) ( not ( = ?auto_184430 ?auto_184433 ) ) ( not ( = ?auto_184431 ?auto_184432 ) ) ( not ( = ?auto_184431 ?auto_184433 ) ) ( not ( = ?auto_184432 ?auto_184433 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184433 ?auto_184432 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184434 - BLOCK
      ?auto_184435 - BLOCK
      ?auto_184436 - BLOCK
      ?auto_184437 - BLOCK
      ?auto_184438 - BLOCK
      ?auto_184439 - BLOCK
      ?auto_184440 - BLOCK
    )
    :vars
    (
      ?auto_184441 - BLOCK
      ?auto_184442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184441 ?auto_184440 ) ( CLEAR ?auto_184441 ) ( ON-TABLE ?auto_184434 ) ( ON ?auto_184435 ?auto_184434 ) ( ON ?auto_184436 ?auto_184435 ) ( ON ?auto_184437 ?auto_184436 ) ( ON ?auto_184438 ?auto_184437 ) ( ON ?auto_184439 ?auto_184438 ) ( ON ?auto_184440 ?auto_184439 ) ( not ( = ?auto_184434 ?auto_184435 ) ) ( not ( = ?auto_184434 ?auto_184436 ) ) ( not ( = ?auto_184434 ?auto_184437 ) ) ( not ( = ?auto_184434 ?auto_184438 ) ) ( not ( = ?auto_184434 ?auto_184439 ) ) ( not ( = ?auto_184434 ?auto_184440 ) ) ( not ( = ?auto_184434 ?auto_184441 ) ) ( not ( = ?auto_184435 ?auto_184436 ) ) ( not ( = ?auto_184435 ?auto_184437 ) ) ( not ( = ?auto_184435 ?auto_184438 ) ) ( not ( = ?auto_184435 ?auto_184439 ) ) ( not ( = ?auto_184435 ?auto_184440 ) ) ( not ( = ?auto_184435 ?auto_184441 ) ) ( not ( = ?auto_184436 ?auto_184437 ) ) ( not ( = ?auto_184436 ?auto_184438 ) ) ( not ( = ?auto_184436 ?auto_184439 ) ) ( not ( = ?auto_184436 ?auto_184440 ) ) ( not ( = ?auto_184436 ?auto_184441 ) ) ( not ( = ?auto_184437 ?auto_184438 ) ) ( not ( = ?auto_184437 ?auto_184439 ) ) ( not ( = ?auto_184437 ?auto_184440 ) ) ( not ( = ?auto_184437 ?auto_184441 ) ) ( not ( = ?auto_184438 ?auto_184439 ) ) ( not ( = ?auto_184438 ?auto_184440 ) ) ( not ( = ?auto_184438 ?auto_184441 ) ) ( not ( = ?auto_184439 ?auto_184440 ) ) ( not ( = ?auto_184439 ?auto_184441 ) ) ( not ( = ?auto_184440 ?auto_184441 ) ) ( HOLDING ?auto_184442 ) ( not ( = ?auto_184434 ?auto_184442 ) ) ( not ( = ?auto_184435 ?auto_184442 ) ) ( not ( = ?auto_184436 ?auto_184442 ) ) ( not ( = ?auto_184437 ?auto_184442 ) ) ( not ( = ?auto_184438 ?auto_184442 ) ) ( not ( = ?auto_184439 ?auto_184442 ) ) ( not ( = ?auto_184440 ?auto_184442 ) ) ( not ( = ?auto_184441 ?auto_184442 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_184442 )
      ( MAKE-7PILE ?auto_184434 ?auto_184435 ?auto_184436 ?auto_184437 ?auto_184438 ?auto_184439 ?auto_184440 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_184443 - BLOCK
      ?auto_184444 - BLOCK
      ?auto_184445 - BLOCK
      ?auto_184446 - BLOCK
      ?auto_184447 - BLOCK
      ?auto_184448 - BLOCK
      ?auto_184449 - BLOCK
    )
    :vars
    (
      ?auto_184450 - BLOCK
      ?auto_184451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184450 ?auto_184449 ) ( ON-TABLE ?auto_184443 ) ( ON ?auto_184444 ?auto_184443 ) ( ON ?auto_184445 ?auto_184444 ) ( ON ?auto_184446 ?auto_184445 ) ( ON ?auto_184447 ?auto_184446 ) ( ON ?auto_184448 ?auto_184447 ) ( ON ?auto_184449 ?auto_184448 ) ( not ( = ?auto_184443 ?auto_184444 ) ) ( not ( = ?auto_184443 ?auto_184445 ) ) ( not ( = ?auto_184443 ?auto_184446 ) ) ( not ( = ?auto_184443 ?auto_184447 ) ) ( not ( = ?auto_184443 ?auto_184448 ) ) ( not ( = ?auto_184443 ?auto_184449 ) ) ( not ( = ?auto_184443 ?auto_184450 ) ) ( not ( = ?auto_184444 ?auto_184445 ) ) ( not ( = ?auto_184444 ?auto_184446 ) ) ( not ( = ?auto_184444 ?auto_184447 ) ) ( not ( = ?auto_184444 ?auto_184448 ) ) ( not ( = ?auto_184444 ?auto_184449 ) ) ( not ( = ?auto_184444 ?auto_184450 ) ) ( not ( = ?auto_184445 ?auto_184446 ) ) ( not ( = ?auto_184445 ?auto_184447 ) ) ( not ( = ?auto_184445 ?auto_184448 ) ) ( not ( = ?auto_184445 ?auto_184449 ) ) ( not ( = ?auto_184445 ?auto_184450 ) ) ( not ( = ?auto_184446 ?auto_184447 ) ) ( not ( = ?auto_184446 ?auto_184448 ) ) ( not ( = ?auto_184446 ?auto_184449 ) ) ( not ( = ?auto_184446 ?auto_184450 ) ) ( not ( = ?auto_184447 ?auto_184448 ) ) ( not ( = ?auto_184447 ?auto_184449 ) ) ( not ( = ?auto_184447 ?auto_184450 ) ) ( not ( = ?auto_184448 ?auto_184449 ) ) ( not ( = ?auto_184448 ?auto_184450 ) ) ( not ( = ?auto_184449 ?auto_184450 ) ) ( not ( = ?auto_184443 ?auto_184451 ) ) ( not ( = ?auto_184444 ?auto_184451 ) ) ( not ( = ?auto_184445 ?auto_184451 ) ) ( not ( = ?auto_184446 ?auto_184451 ) ) ( not ( = ?auto_184447 ?auto_184451 ) ) ( not ( = ?auto_184448 ?auto_184451 ) ) ( not ( = ?auto_184449 ?auto_184451 ) ) ( not ( = ?auto_184450 ?auto_184451 ) ) ( ON ?auto_184451 ?auto_184450 ) ( CLEAR ?auto_184451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184443 ?auto_184444 ?auto_184445 ?auto_184446 ?auto_184447 ?auto_184448 ?auto_184449 ?auto_184450 )
      ( MAKE-7PILE ?auto_184443 ?auto_184444 ?auto_184445 ?auto_184446 ?auto_184447 ?auto_184448 ?auto_184449 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184454 - BLOCK
      ?auto_184455 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_184455 ) ( CLEAR ?auto_184454 ) ( ON-TABLE ?auto_184454 ) ( not ( = ?auto_184454 ?auto_184455 ) ) )
    :subtasks
    ( ( !STACK ?auto_184455 ?auto_184454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184456 - BLOCK
      ?auto_184457 - BLOCK
    )
    :vars
    (
      ?auto_184458 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184456 ) ( ON-TABLE ?auto_184456 ) ( not ( = ?auto_184456 ?auto_184457 ) ) ( ON ?auto_184457 ?auto_184458 ) ( CLEAR ?auto_184457 ) ( HAND-EMPTY ) ( not ( = ?auto_184456 ?auto_184458 ) ) ( not ( = ?auto_184457 ?auto_184458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184457 ?auto_184458 )
      ( MAKE-2PILE ?auto_184456 ?auto_184457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184459 - BLOCK
      ?auto_184460 - BLOCK
    )
    :vars
    (
      ?auto_184461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184459 ?auto_184460 ) ) ( ON ?auto_184460 ?auto_184461 ) ( CLEAR ?auto_184460 ) ( not ( = ?auto_184459 ?auto_184461 ) ) ( not ( = ?auto_184460 ?auto_184461 ) ) ( HOLDING ?auto_184459 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184459 )
      ( MAKE-2PILE ?auto_184459 ?auto_184460 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184462 - BLOCK
      ?auto_184463 - BLOCK
    )
    :vars
    (
      ?auto_184464 - BLOCK
      ?auto_184465 - BLOCK
      ?auto_184468 - BLOCK
      ?auto_184466 - BLOCK
      ?auto_184469 - BLOCK
      ?auto_184470 - BLOCK
      ?auto_184467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184462 ?auto_184463 ) ) ( ON ?auto_184463 ?auto_184464 ) ( not ( = ?auto_184462 ?auto_184464 ) ) ( not ( = ?auto_184463 ?auto_184464 ) ) ( ON ?auto_184462 ?auto_184463 ) ( CLEAR ?auto_184462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184465 ) ( ON ?auto_184468 ?auto_184465 ) ( ON ?auto_184466 ?auto_184468 ) ( ON ?auto_184469 ?auto_184466 ) ( ON ?auto_184470 ?auto_184469 ) ( ON ?auto_184467 ?auto_184470 ) ( ON ?auto_184464 ?auto_184467 ) ( not ( = ?auto_184465 ?auto_184468 ) ) ( not ( = ?auto_184465 ?auto_184466 ) ) ( not ( = ?auto_184465 ?auto_184469 ) ) ( not ( = ?auto_184465 ?auto_184470 ) ) ( not ( = ?auto_184465 ?auto_184467 ) ) ( not ( = ?auto_184465 ?auto_184464 ) ) ( not ( = ?auto_184465 ?auto_184463 ) ) ( not ( = ?auto_184465 ?auto_184462 ) ) ( not ( = ?auto_184468 ?auto_184466 ) ) ( not ( = ?auto_184468 ?auto_184469 ) ) ( not ( = ?auto_184468 ?auto_184470 ) ) ( not ( = ?auto_184468 ?auto_184467 ) ) ( not ( = ?auto_184468 ?auto_184464 ) ) ( not ( = ?auto_184468 ?auto_184463 ) ) ( not ( = ?auto_184468 ?auto_184462 ) ) ( not ( = ?auto_184466 ?auto_184469 ) ) ( not ( = ?auto_184466 ?auto_184470 ) ) ( not ( = ?auto_184466 ?auto_184467 ) ) ( not ( = ?auto_184466 ?auto_184464 ) ) ( not ( = ?auto_184466 ?auto_184463 ) ) ( not ( = ?auto_184466 ?auto_184462 ) ) ( not ( = ?auto_184469 ?auto_184470 ) ) ( not ( = ?auto_184469 ?auto_184467 ) ) ( not ( = ?auto_184469 ?auto_184464 ) ) ( not ( = ?auto_184469 ?auto_184463 ) ) ( not ( = ?auto_184469 ?auto_184462 ) ) ( not ( = ?auto_184470 ?auto_184467 ) ) ( not ( = ?auto_184470 ?auto_184464 ) ) ( not ( = ?auto_184470 ?auto_184463 ) ) ( not ( = ?auto_184470 ?auto_184462 ) ) ( not ( = ?auto_184467 ?auto_184464 ) ) ( not ( = ?auto_184467 ?auto_184463 ) ) ( not ( = ?auto_184467 ?auto_184462 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184465 ?auto_184468 ?auto_184466 ?auto_184469 ?auto_184470 ?auto_184467 ?auto_184464 ?auto_184463 )
      ( MAKE-2PILE ?auto_184462 ?auto_184463 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184477 - BLOCK
      ?auto_184478 - BLOCK
      ?auto_184479 - BLOCK
      ?auto_184480 - BLOCK
      ?auto_184481 - BLOCK
      ?auto_184482 - BLOCK
    )
    :vars
    (
      ?auto_184483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184483 ?auto_184482 ) ( CLEAR ?auto_184483 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184477 ) ( ON ?auto_184478 ?auto_184477 ) ( ON ?auto_184479 ?auto_184478 ) ( ON ?auto_184480 ?auto_184479 ) ( ON ?auto_184481 ?auto_184480 ) ( ON ?auto_184482 ?auto_184481 ) ( not ( = ?auto_184477 ?auto_184478 ) ) ( not ( = ?auto_184477 ?auto_184479 ) ) ( not ( = ?auto_184477 ?auto_184480 ) ) ( not ( = ?auto_184477 ?auto_184481 ) ) ( not ( = ?auto_184477 ?auto_184482 ) ) ( not ( = ?auto_184477 ?auto_184483 ) ) ( not ( = ?auto_184478 ?auto_184479 ) ) ( not ( = ?auto_184478 ?auto_184480 ) ) ( not ( = ?auto_184478 ?auto_184481 ) ) ( not ( = ?auto_184478 ?auto_184482 ) ) ( not ( = ?auto_184478 ?auto_184483 ) ) ( not ( = ?auto_184479 ?auto_184480 ) ) ( not ( = ?auto_184479 ?auto_184481 ) ) ( not ( = ?auto_184479 ?auto_184482 ) ) ( not ( = ?auto_184479 ?auto_184483 ) ) ( not ( = ?auto_184480 ?auto_184481 ) ) ( not ( = ?auto_184480 ?auto_184482 ) ) ( not ( = ?auto_184480 ?auto_184483 ) ) ( not ( = ?auto_184481 ?auto_184482 ) ) ( not ( = ?auto_184481 ?auto_184483 ) ) ( not ( = ?auto_184482 ?auto_184483 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184483 ?auto_184482 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184484 - BLOCK
      ?auto_184485 - BLOCK
      ?auto_184486 - BLOCK
      ?auto_184487 - BLOCK
      ?auto_184488 - BLOCK
      ?auto_184489 - BLOCK
    )
    :vars
    (
      ?auto_184490 - BLOCK
      ?auto_184491 - BLOCK
      ?auto_184492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184490 ?auto_184489 ) ( CLEAR ?auto_184490 ) ( ON-TABLE ?auto_184484 ) ( ON ?auto_184485 ?auto_184484 ) ( ON ?auto_184486 ?auto_184485 ) ( ON ?auto_184487 ?auto_184486 ) ( ON ?auto_184488 ?auto_184487 ) ( ON ?auto_184489 ?auto_184488 ) ( not ( = ?auto_184484 ?auto_184485 ) ) ( not ( = ?auto_184484 ?auto_184486 ) ) ( not ( = ?auto_184484 ?auto_184487 ) ) ( not ( = ?auto_184484 ?auto_184488 ) ) ( not ( = ?auto_184484 ?auto_184489 ) ) ( not ( = ?auto_184484 ?auto_184490 ) ) ( not ( = ?auto_184485 ?auto_184486 ) ) ( not ( = ?auto_184485 ?auto_184487 ) ) ( not ( = ?auto_184485 ?auto_184488 ) ) ( not ( = ?auto_184485 ?auto_184489 ) ) ( not ( = ?auto_184485 ?auto_184490 ) ) ( not ( = ?auto_184486 ?auto_184487 ) ) ( not ( = ?auto_184486 ?auto_184488 ) ) ( not ( = ?auto_184486 ?auto_184489 ) ) ( not ( = ?auto_184486 ?auto_184490 ) ) ( not ( = ?auto_184487 ?auto_184488 ) ) ( not ( = ?auto_184487 ?auto_184489 ) ) ( not ( = ?auto_184487 ?auto_184490 ) ) ( not ( = ?auto_184488 ?auto_184489 ) ) ( not ( = ?auto_184488 ?auto_184490 ) ) ( not ( = ?auto_184489 ?auto_184490 ) ) ( HOLDING ?auto_184491 ) ( CLEAR ?auto_184492 ) ( not ( = ?auto_184484 ?auto_184491 ) ) ( not ( = ?auto_184484 ?auto_184492 ) ) ( not ( = ?auto_184485 ?auto_184491 ) ) ( not ( = ?auto_184485 ?auto_184492 ) ) ( not ( = ?auto_184486 ?auto_184491 ) ) ( not ( = ?auto_184486 ?auto_184492 ) ) ( not ( = ?auto_184487 ?auto_184491 ) ) ( not ( = ?auto_184487 ?auto_184492 ) ) ( not ( = ?auto_184488 ?auto_184491 ) ) ( not ( = ?auto_184488 ?auto_184492 ) ) ( not ( = ?auto_184489 ?auto_184491 ) ) ( not ( = ?auto_184489 ?auto_184492 ) ) ( not ( = ?auto_184490 ?auto_184491 ) ) ( not ( = ?auto_184490 ?auto_184492 ) ) ( not ( = ?auto_184491 ?auto_184492 ) ) )
    :subtasks
    ( ( !STACK ?auto_184491 ?auto_184492 )
      ( MAKE-6PILE ?auto_184484 ?auto_184485 ?auto_184486 ?auto_184487 ?auto_184488 ?auto_184489 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185824 - BLOCK
      ?auto_185825 - BLOCK
      ?auto_185826 - BLOCK
      ?auto_185827 - BLOCK
      ?auto_185828 - BLOCK
      ?auto_185829 - BLOCK
    )
    :vars
    (
      ?auto_185831 - BLOCK
      ?auto_185830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185831 ?auto_185829 ) ( ON-TABLE ?auto_185824 ) ( ON ?auto_185825 ?auto_185824 ) ( ON ?auto_185826 ?auto_185825 ) ( ON ?auto_185827 ?auto_185826 ) ( ON ?auto_185828 ?auto_185827 ) ( ON ?auto_185829 ?auto_185828 ) ( not ( = ?auto_185824 ?auto_185825 ) ) ( not ( = ?auto_185824 ?auto_185826 ) ) ( not ( = ?auto_185824 ?auto_185827 ) ) ( not ( = ?auto_185824 ?auto_185828 ) ) ( not ( = ?auto_185824 ?auto_185829 ) ) ( not ( = ?auto_185824 ?auto_185831 ) ) ( not ( = ?auto_185825 ?auto_185826 ) ) ( not ( = ?auto_185825 ?auto_185827 ) ) ( not ( = ?auto_185825 ?auto_185828 ) ) ( not ( = ?auto_185825 ?auto_185829 ) ) ( not ( = ?auto_185825 ?auto_185831 ) ) ( not ( = ?auto_185826 ?auto_185827 ) ) ( not ( = ?auto_185826 ?auto_185828 ) ) ( not ( = ?auto_185826 ?auto_185829 ) ) ( not ( = ?auto_185826 ?auto_185831 ) ) ( not ( = ?auto_185827 ?auto_185828 ) ) ( not ( = ?auto_185827 ?auto_185829 ) ) ( not ( = ?auto_185827 ?auto_185831 ) ) ( not ( = ?auto_185828 ?auto_185829 ) ) ( not ( = ?auto_185828 ?auto_185831 ) ) ( not ( = ?auto_185829 ?auto_185831 ) ) ( not ( = ?auto_185824 ?auto_185830 ) ) ( not ( = ?auto_185825 ?auto_185830 ) ) ( not ( = ?auto_185826 ?auto_185830 ) ) ( not ( = ?auto_185827 ?auto_185830 ) ) ( not ( = ?auto_185828 ?auto_185830 ) ) ( not ( = ?auto_185829 ?auto_185830 ) ) ( not ( = ?auto_185831 ?auto_185830 ) ) ( ON ?auto_185830 ?auto_185831 ) ( CLEAR ?auto_185830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185824 ?auto_185825 ?auto_185826 ?auto_185827 ?auto_185828 ?auto_185829 ?auto_185831 )
      ( MAKE-6PILE ?auto_185824 ?auto_185825 ?auto_185826 ?auto_185827 ?auto_185828 ?auto_185829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184502 - BLOCK
      ?auto_184503 - BLOCK
      ?auto_184504 - BLOCK
      ?auto_184505 - BLOCK
      ?auto_184506 - BLOCK
      ?auto_184507 - BLOCK
    )
    :vars
    (
      ?auto_184510 - BLOCK
      ?auto_184508 - BLOCK
      ?auto_184509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184510 ?auto_184507 ) ( ON-TABLE ?auto_184502 ) ( ON ?auto_184503 ?auto_184502 ) ( ON ?auto_184504 ?auto_184503 ) ( ON ?auto_184505 ?auto_184504 ) ( ON ?auto_184506 ?auto_184505 ) ( ON ?auto_184507 ?auto_184506 ) ( not ( = ?auto_184502 ?auto_184503 ) ) ( not ( = ?auto_184502 ?auto_184504 ) ) ( not ( = ?auto_184502 ?auto_184505 ) ) ( not ( = ?auto_184502 ?auto_184506 ) ) ( not ( = ?auto_184502 ?auto_184507 ) ) ( not ( = ?auto_184502 ?auto_184510 ) ) ( not ( = ?auto_184503 ?auto_184504 ) ) ( not ( = ?auto_184503 ?auto_184505 ) ) ( not ( = ?auto_184503 ?auto_184506 ) ) ( not ( = ?auto_184503 ?auto_184507 ) ) ( not ( = ?auto_184503 ?auto_184510 ) ) ( not ( = ?auto_184504 ?auto_184505 ) ) ( not ( = ?auto_184504 ?auto_184506 ) ) ( not ( = ?auto_184504 ?auto_184507 ) ) ( not ( = ?auto_184504 ?auto_184510 ) ) ( not ( = ?auto_184505 ?auto_184506 ) ) ( not ( = ?auto_184505 ?auto_184507 ) ) ( not ( = ?auto_184505 ?auto_184510 ) ) ( not ( = ?auto_184506 ?auto_184507 ) ) ( not ( = ?auto_184506 ?auto_184510 ) ) ( not ( = ?auto_184507 ?auto_184510 ) ) ( not ( = ?auto_184502 ?auto_184508 ) ) ( not ( = ?auto_184502 ?auto_184509 ) ) ( not ( = ?auto_184503 ?auto_184508 ) ) ( not ( = ?auto_184503 ?auto_184509 ) ) ( not ( = ?auto_184504 ?auto_184508 ) ) ( not ( = ?auto_184504 ?auto_184509 ) ) ( not ( = ?auto_184505 ?auto_184508 ) ) ( not ( = ?auto_184505 ?auto_184509 ) ) ( not ( = ?auto_184506 ?auto_184508 ) ) ( not ( = ?auto_184506 ?auto_184509 ) ) ( not ( = ?auto_184507 ?auto_184508 ) ) ( not ( = ?auto_184507 ?auto_184509 ) ) ( not ( = ?auto_184510 ?auto_184508 ) ) ( not ( = ?auto_184510 ?auto_184509 ) ) ( not ( = ?auto_184508 ?auto_184509 ) ) ( ON ?auto_184508 ?auto_184510 ) ( CLEAR ?auto_184508 ) ( HOLDING ?auto_184509 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184509 )
      ( MAKE-6PILE ?auto_184502 ?auto_184503 ?auto_184504 ?auto_184505 ?auto_184506 ?auto_184507 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184511 - BLOCK
      ?auto_184512 - BLOCK
      ?auto_184513 - BLOCK
      ?auto_184514 - BLOCK
      ?auto_184515 - BLOCK
      ?auto_184516 - BLOCK
    )
    :vars
    (
      ?auto_184519 - BLOCK
      ?auto_184517 - BLOCK
      ?auto_184518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184519 ?auto_184516 ) ( ON-TABLE ?auto_184511 ) ( ON ?auto_184512 ?auto_184511 ) ( ON ?auto_184513 ?auto_184512 ) ( ON ?auto_184514 ?auto_184513 ) ( ON ?auto_184515 ?auto_184514 ) ( ON ?auto_184516 ?auto_184515 ) ( not ( = ?auto_184511 ?auto_184512 ) ) ( not ( = ?auto_184511 ?auto_184513 ) ) ( not ( = ?auto_184511 ?auto_184514 ) ) ( not ( = ?auto_184511 ?auto_184515 ) ) ( not ( = ?auto_184511 ?auto_184516 ) ) ( not ( = ?auto_184511 ?auto_184519 ) ) ( not ( = ?auto_184512 ?auto_184513 ) ) ( not ( = ?auto_184512 ?auto_184514 ) ) ( not ( = ?auto_184512 ?auto_184515 ) ) ( not ( = ?auto_184512 ?auto_184516 ) ) ( not ( = ?auto_184512 ?auto_184519 ) ) ( not ( = ?auto_184513 ?auto_184514 ) ) ( not ( = ?auto_184513 ?auto_184515 ) ) ( not ( = ?auto_184513 ?auto_184516 ) ) ( not ( = ?auto_184513 ?auto_184519 ) ) ( not ( = ?auto_184514 ?auto_184515 ) ) ( not ( = ?auto_184514 ?auto_184516 ) ) ( not ( = ?auto_184514 ?auto_184519 ) ) ( not ( = ?auto_184515 ?auto_184516 ) ) ( not ( = ?auto_184515 ?auto_184519 ) ) ( not ( = ?auto_184516 ?auto_184519 ) ) ( not ( = ?auto_184511 ?auto_184517 ) ) ( not ( = ?auto_184511 ?auto_184518 ) ) ( not ( = ?auto_184512 ?auto_184517 ) ) ( not ( = ?auto_184512 ?auto_184518 ) ) ( not ( = ?auto_184513 ?auto_184517 ) ) ( not ( = ?auto_184513 ?auto_184518 ) ) ( not ( = ?auto_184514 ?auto_184517 ) ) ( not ( = ?auto_184514 ?auto_184518 ) ) ( not ( = ?auto_184515 ?auto_184517 ) ) ( not ( = ?auto_184515 ?auto_184518 ) ) ( not ( = ?auto_184516 ?auto_184517 ) ) ( not ( = ?auto_184516 ?auto_184518 ) ) ( not ( = ?auto_184519 ?auto_184517 ) ) ( not ( = ?auto_184519 ?auto_184518 ) ) ( not ( = ?auto_184517 ?auto_184518 ) ) ( ON ?auto_184517 ?auto_184519 ) ( ON ?auto_184518 ?auto_184517 ) ( CLEAR ?auto_184518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184511 ?auto_184512 ?auto_184513 ?auto_184514 ?auto_184515 ?auto_184516 ?auto_184519 ?auto_184517 )
      ( MAKE-6PILE ?auto_184511 ?auto_184512 ?auto_184513 ?auto_184514 ?auto_184515 ?auto_184516 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184523 - BLOCK
      ?auto_184524 - BLOCK
      ?auto_184525 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_184525 ) ( CLEAR ?auto_184524 ) ( ON-TABLE ?auto_184523 ) ( ON ?auto_184524 ?auto_184523 ) ( not ( = ?auto_184523 ?auto_184524 ) ) ( not ( = ?auto_184523 ?auto_184525 ) ) ( not ( = ?auto_184524 ?auto_184525 ) ) )
    :subtasks
    ( ( !STACK ?auto_184525 ?auto_184524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184526 - BLOCK
      ?auto_184527 - BLOCK
      ?auto_184528 - BLOCK
    )
    :vars
    (
      ?auto_184529 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184527 ) ( ON-TABLE ?auto_184526 ) ( ON ?auto_184527 ?auto_184526 ) ( not ( = ?auto_184526 ?auto_184527 ) ) ( not ( = ?auto_184526 ?auto_184528 ) ) ( not ( = ?auto_184527 ?auto_184528 ) ) ( ON ?auto_184528 ?auto_184529 ) ( CLEAR ?auto_184528 ) ( HAND-EMPTY ) ( not ( = ?auto_184526 ?auto_184529 ) ) ( not ( = ?auto_184527 ?auto_184529 ) ) ( not ( = ?auto_184528 ?auto_184529 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184528 ?auto_184529 )
      ( MAKE-3PILE ?auto_184526 ?auto_184527 ?auto_184528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184530 - BLOCK
      ?auto_184531 - BLOCK
      ?auto_184532 - BLOCK
    )
    :vars
    (
      ?auto_184533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184530 ) ( not ( = ?auto_184530 ?auto_184531 ) ) ( not ( = ?auto_184530 ?auto_184532 ) ) ( not ( = ?auto_184531 ?auto_184532 ) ) ( ON ?auto_184532 ?auto_184533 ) ( CLEAR ?auto_184532 ) ( not ( = ?auto_184530 ?auto_184533 ) ) ( not ( = ?auto_184531 ?auto_184533 ) ) ( not ( = ?auto_184532 ?auto_184533 ) ) ( HOLDING ?auto_184531 ) ( CLEAR ?auto_184530 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184530 ?auto_184531 )
      ( MAKE-3PILE ?auto_184530 ?auto_184531 ?auto_184532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184534 - BLOCK
      ?auto_184535 - BLOCK
      ?auto_184536 - BLOCK
    )
    :vars
    (
      ?auto_184537 - BLOCK
      ?auto_184539 - BLOCK
      ?auto_184538 - BLOCK
      ?auto_184541 - BLOCK
      ?auto_184542 - BLOCK
      ?auto_184540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184534 ) ( not ( = ?auto_184534 ?auto_184535 ) ) ( not ( = ?auto_184534 ?auto_184536 ) ) ( not ( = ?auto_184535 ?auto_184536 ) ) ( ON ?auto_184536 ?auto_184537 ) ( not ( = ?auto_184534 ?auto_184537 ) ) ( not ( = ?auto_184535 ?auto_184537 ) ) ( not ( = ?auto_184536 ?auto_184537 ) ) ( CLEAR ?auto_184534 ) ( ON ?auto_184535 ?auto_184536 ) ( CLEAR ?auto_184535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184539 ) ( ON ?auto_184538 ?auto_184539 ) ( ON ?auto_184541 ?auto_184538 ) ( ON ?auto_184542 ?auto_184541 ) ( ON ?auto_184540 ?auto_184542 ) ( ON ?auto_184537 ?auto_184540 ) ( not ( = ?auto_184539 ?auto_184538 ) ) ( not ( = ?auto_184539 ?auto_184541 ) ) ( not ( = ?auto_184539 ?auto_184542 ) ) ( not ( = ?auto_184539 ?auto_184540 ) ) ( not ( = ?auto_184539 ?auto_184537 ) ) ( not ( = ?auto_184539 ?auto_184536 ) ) ( not ( = ?auto_184539 ?auto_184535 ) ) ( not ( = ?auto_184538 ?auto_184541 ) ) ( not ( = ?auto_184538 ?auto_184542 ) ) ( not ( = ?auto_184538 ?auto_184540 ) ) ( not ( = ?auto_184538 ?auto_184537 ) ) ( not ( = ?auto_184538 ?auto_184536 ) ) ( not ( = ?auto_184538 ?auto_184535 ) ) ( not ( = ?auto_184541 ?auto_184542 ) ) ( not ( = ?auto_184541 ?auto_184540 ) ) ( not ( = ?auto_184541 ?auto_184537 ) ) ( not ( = ?auto_184541 ?auto_184536 ) ) ( not ( = ?auto_184541 ?auto_184535 ) ) ( not ( = ?auto_184542 ?auto_184540 ) ) ( not ( = ?auto_184542 ?auto_184537 ) ) ( not ( = ?auto_184542 ?auto_184536 ) ) ( not ( = ?auto_184542 ?auto_184535 ) ) ( not ( = ?auto_184540 ?auto_184537 ) ) ( not ( = ?auto_184540 ?auto_184536 ) ) ( not ( = ?auto_184540 ?auto_184535 ) ) ( not ( = ?auto_184534 ?auto_184539 ) ) ( not ( = ?auto_184534 ?auto_184538 ) ) ( not ( = ?auto_184534 ?auto_184541 ) ) ( not ( = ?auto_184534 ?auto_184542 ) ) ( not ( = ?auto_184534 ?auto_184540 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184539 ?auto_184538 ?auto_184541 ?auto_184542 ?auto_184540 ?auto_184537 ?auto_184536 )
      ( MAKE-3PILE ?auto_184534 ?auto_184535 ?auto_184536 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184543 - BLOCK
      ?auto_184544 - BLOCK
      ?auto_184545 - BLOCK
    )
    :vars
    (
      ?auto_184548 - BLOCK
      ?auto_184547 - BLOCK
      ?auto_184550 - BLOCK
      ?auto_184551 - BLOCK
      ?auto_184549 - BLOCK
      ?auto_184546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184543 ?auto_184544 ) ) ( not ( = ?auto_184543 ?auto_184545 ) ) ( not ( = ?auto_184544 ?auto_184545 ) ) ( ON ?auto_184545 ?auto_184548 ) ( not ( = ?auto_184543 ?auto_184548 ) ) ( not ( = ?auto_184544 ?auto_184548 ) ) ( not ( = ?auto_184545 ?auto_184548 ) ) ( ON ?auto_184544 ?auto_184545 ) ( CLEAR ?auto_184544 ) ( ON-TABLE ?auto_184547 ) ( ON ?auto_184550 ?auto_184547 ) ( ON ?auto_184551 ?auto_184550 ) ( ON ?auto_184549 ?auto_184551 ) ( ON ?auto_184546 ?auto_184549 ) ( ON ?auto_184548 ?auto_184546 ) ( not ( = ?auto_184547 ?auto_184550 ) ) ( not ( = ?auto_184547 ?auto_184551 ) ) ( not ( = ?auto_184547 ?auto_184549 ) ) ( not ( = ?auto_184547 ?auto_184546 ) ) ( not ( = ?auto_184547 ?auto_184548 ) ) ( not ( = ?auto_184547 ?auto_184545 ) ) ( not ( = ?auto_184547 ?auto_184544 ) ) ( not ( = ?auto_184550 ?auto_184551 ) ) ( not ( = ?auto_184550 ?auto_184549 ) ) ( not ( = ?auto_184550 ?auto_184546 ) ) ( not ( = ?auto_184550 ?auto_184548 ) ) ( not ( = ?auto_184550 ?auto_184545 ) ) ( not ( = ?auto_184550 ?auto_184544 ) ) ( not ( = ?auto_184551 ?auto_184549 ) ) ( not ( = ?auto_184551 ?auto_184546 ) ) ( not ( = ?auto_184551 ?auto_184548 ) ) ( not ( = ?auto_184551 ?auto_184545 ) ) ( not ( = ?auto_184551 ?auto_184544 ) ) ( not ( = ?auto_184549 ?auto_184546 ) ) ( not ( = ?auto_184549 ?auto_184548 ) ) ( not ( = ?auto_184549 ?auto_184545 ) ) ( not ( = ?auto_184549 ?auto_184544 ) ) ( not ( = ?auto_184546 ?auto_184548 ) ) ( not ( = ?auto_184546 ?auto_184545 ) ) ( not ( = ?auto_184546 ?auto_184544 ) ) ( not ( = ?auto_184543 ?auto_184547 ) ) ( not ( = ?auto_184543 ?auto_184550 ) ) ( not ( = ?auto_184543 ?auto_184551 ) ) ( not ( = ?auto_184543 ?auto_184549 ) ) ( not ( = ?auto_184543 ?auto_184546 ) ) ( HOLDING ?auto_184543 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184543 )
      ( MAKE-3PILE ?auto_184543 ?auto_184544 ?auto_184545 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184552 - BLOCK
      ?auto_184553 - BLOCK
      ?auto_184554 - BLOCK
    )
    :vars
    (
      ?auto_184558 - BLOCK
      ?auto_184555 - BLOCK
      ?auto_184557 - BLOCK
      ?auto_184560 - BLOCK
      ?auto_184556 - BLOCK
      ?auto_184559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184552 ?auto_184553 ) ) ( not ( = ?auto_184552 ?auto_184554 ) ) ( not ( = ?auto_184553 ?auto_184554 ) ) ( ON ?auto_184554 ?auto_184558 ) ( not ( = ?auto_184552 ?auto_184558 ) ) ( not ( = ?auto_184553 ?auto_184558 ) ) ( not ( = ?auto_184554 ?auto_184558 ) ) ( ON ?auto_184553 ?auto_184554 ) ( ON-TABLE ?auto_184555 ) ( ON ?auto_184557 ?auto_184555 ) ( ON ?auto_184560 ?auto_184557 ) ( ON ?auto_184556 ?auto_184560 ) ( ON ?auto_184559 ?auto_184556 ) ( ON ?auto_184558 ?auto_184559 ) ( not ( = ?auto_184555 ?auto_184557 ) ) ( not ( = ?auto_184555 ?auto_184560 ) ) ( not ( = ?auto_184555 ?auto_184556 ) ) ( not ( = ?auto_184555 ?auto_184559 ) ) ( not ( = ?auto_184555 ?auto_184558 ) ) ( not ( = ?auto_184555 ?auto_184554 ) ) ( not ( = ?auto_184555 ?auto_184553 ) ) ( not ( = ?auto_184557 ?auto_184560 ) ) ( not ( = ?auto_184557 ?auto_184556 ) ) ( not ( = ?auto_184557 ?auto_184559 ) ) ( not ( = ?auto_184557 ?auto_184558 ) ) ( not ( = ?auto_184557 ?auto_184554 ) ) ( not ( = ?auto_184557 ?auto_184553 ) ) ( not ( = ?auto_184560 ?auto_184556 ) ) ( not ( = ?auto_184560 ?auto_184559 ) ) ( not ( = ?auto_184560 ?auto_184558 ) ) ( not ( = ?auto_184560 ?auto_184554 ) ) ( not ( = ?auto_184560 ?auto_184553 ) ) ( not ( = ?auto_184556 ?auto_184559 ) ) ( not ( = ?auto_184556 ?auto_184558 ) ) ( not ( = ?auto_184556 ?auto_184554 ) ) ( not ( = ?auto_184556 ?auto_184553 ) ) ( not ( = ?auto_184559 ?auto_184558 ) ) ( not ( = ?auto_184559 ?auto_184554 ) ) ( not ( = ?auto_184559 ?auto_184553 ) ) ( not ( = ?auto_184552 ?auto_184555 ) ) ( not ( = ?auto_184552 ?auto_184557 ) ) ( not ( = ?auto_184552 ?auto_184560 ) ) ( not ( = ?auto_184552 ?auto_184556 ) ) ( not ( = ?auto_184552 ?auto_184559 ) ) ( ON ?auto_184552 ?auto_184553 ) ( CLEAR ?auto_184552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184555 ?auto_184557 ?auto_184560 ?auto_184556 ?auto_184559 ?auto_184558 ?auto_184554 ?auto_184553 )
      ( MAKE-3PILE ?auto_184552 ?auto_184553 ?auto_184554 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184566 - BLOCK
      ?auto_184567 - BLOCK
      ?auto_184568 - BLOCK
      ?auto_184569 - BLOCK
      ?auto_184570 - BLOCK
    )
    :vars
    (
      ?auto_184571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184571 ?auto_184570 ) ( CLEAR ?auto_184571 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184566 ) ( ON ?auto_184567 ?auto_184566 ) ( ON ?auto_184568 ?auto_184567 ) ( ON ?auto_184569 ?auto_184568 ) ( ON ?auto_184570 ?auto_184569 ) ( not ( = ?auto_184566 ?auto_184567 ) ) ( not ( = ?auto_184566 ?auto_184568 ) ) ( not ( = ?auto_184566 ?auto_184569 ) ) ( not ( = ?auto_184566 ?auto_184570 ) ) ( not ( = ?auto_184566 ?auto_184571 ) ) ( not ( = ?auto_184567 ?auto_184568 ) ) ( not ( = ?auto_184567 ?auto_184569 ) ) ( not ( = ?auto_184567 ?auto_184570 ) ) ( not ( = ?auto_184567 ?auto_184571 ) ) ( not ( = ?auto_184568 ?auto_184569 ) ) ( not ( = ?auto_184568 ?auto_184570 ) ) ( not ( = ?auto_184568 ?auto_184571 ) ) ( not ( = ?auto_184569 ?auto_184570 ) ) ( not ( = ?auto_184569 ?auto_184571 ) ) ( not ( = ?auto_184570 ?auto_184571 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184571 ?auto_184570 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184572 - BLOCK
      ?auto_184573 - BLOCK
      ?auto_184574 - BLOCK
      ?auto_184575 - BLOCK
      ?auto_184576 - BLOCK
    )
    :vars
    (
      ?auto_184577 - BLOCK
      ?auto_184578 - BLOCK
      ?auto_184579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184577 ?auto_184576 ) ( CLEAR ?auto_184577 ) ( ON-TABLE ?auto_184572 ) ( ON ?auto_184573 ?auto_184572 ) ( ON ?auto_184574 ?auto_184573 ) ( ON ?auto_184575 ?auto_184574 ) ( ON ?auto_184576 ?auto_184575 ) ( not ( = ?auto_184572 ?auto_184573 ) ) ( not ( = ?auto_184572 ?auto_184574 ) ) ( not ( = ?auto_184572 ?auto_184575 ) ) ( not ( = ?auto_184572 ?auto_184576 ) ) ( not ( = ?auto_184572 ?auto_184577 ) ) ( not ( = ?auto_184573 ?auto_184574 ) ) ( not ( = ?auto_184573 ?auto_184575 ) ) ( not ( = ?auto_184573 ?auto_184576 ) ) ( not ( = ?auto_184573 ?auto_184577 ) ) ( not ( = ?auto_184574 ?auto_184575 ) ) ( not ( = ?auto_184574 ?auto_184576 ) ) ( not ( = ?auto_184574 ?auto_184577 ) ) ( not ( = ?auto_184575 ?auto_184576 ) ) ( not ( = ?auto_184575 ?auto_184577 ) ) ( not ( = ?auto_184576 ?auto_184577 ) ) ( HOLDING ?auto_184578 ) ( CLEAR ?auto_184579 ) ( not ( = ?auto_184572 ?auto_184578 ) ) ( not ( = ?auto_184572 ?auto_184579 ) ) ( not ( = ?auto_184573 ?auto_184578 ) ) ( not ( = ?auto_184573 ?auto_184579 ) ) ( not ( = ?auto_184574 ?auto_184578 ) ) ( not ( = ?auto_184574 ?auto_184579 ) ) ( not ( = ?auto_184575 ?auto_184578 ) ) ( not ( = ?auto_184575 ?auto_184579 ) ) ( not ( = ?auto_184576 ?auto_184578 ) ) ( not ( = ?auto_184576 ?auto_184579 ) ) ( not ( = ?auto_184577 ?auto_184578 ) ) ( not ( = ?auto_184577 ?auto_184579 ) ) ( not ( = ?auto_184578 ?auto_184579 ) ) )
    :subtasks
    ( ( !STACK ?auto_184578 ?auto_184579 )
      ( MAKE-5PILE ?auto_184572 ?auto_184573 ?auto_184574 ?auto_184575 ?auto_184576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184580 - BLOCK
      ?auto_184581 - BLOCK
      ?auto_184582 - BLOCK
      ?auto_184583 - BLOCK
      ?auto_184584 - BLOCK
    )
    :vars
    (
      ?auto_184585 - BLOCK
      ?auto_184587 - BLOCK
      ?auto_184586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184585 ?auto_184584 ) ( ON-TABLE ?auto_184580 ) ( ON ?auto_184581 ?auto_184580 ) ( ON ?auto_184582 ?auto_184581 ) ( ON ?auto_184583 ?auto_184582 ) ( ON ?auto_184584 ?auto_184583 ) ( not ( = ?auto_184580 ?auto_184581 ) ) ( not ( = ?auto_184580 ?auto_184582 ) ) ( not ( = ?auto_184580 ?auto_184583 ) ) ( not ( = ?auto_184580 ?auto_184584 ) ) ( not ( = ?auto_184580 ?auto_184585 ) ) ( not ( = ?auto_184581 ?auto_184582 ) ) ( not ( = ?auto_184581 ?auto_184583 ) ) ( not ( = ?auto_184581 ?auto_184584 ) ) ( not ( = ?auto_184581 ?auto_184585 ) ) ( not ( = ?auto_184582 ?auto_184583 ) ) ( not ( = ?auto_184582 ?auto_184584 ) ) ( not ( = ?auto_184582 ?auto_184585 ) ) ( not ( = ?auto_184583 ?auto_184584 ) ) ( not ( = ?auto_184583 ?auto_184585 ) ) ( not ( = ?auto_184584 ?auto_184585 ) ) ( CLEAR ?auto_184587 ) ( not ( = ?auto_184580 ?auto_184586 ) ) ( not ( = ?auto_184580 ?auto_184587 ) ) ( not ( = ?auto_184581 ?auto_184586 ) ) ( not ( = ?auto_184581 ?auto_184587 ) ) ( not ( = ?auto_184582 ?auto_184586 ) ) ( not ( = ?auto_184582 ?auto_184587 ) ) ( not ( = ?auto_184583 ?auto_184586 ) ) ( not ( = ?auto_184583 ?auto_184587 ) ) ( not ( = ?auto_184584 ?auto_184586 ) ) ( not ( = ?auto_184584 ?auto_184587 ) ) ( not ( = ?auto_184585 ?auto_184586 ) ) ( not ( = ?auto_184585 ?auto_184587 ) ) ( not ( = ?auto_184586 ?auto_184587 ) ) ( ON ?auto_184586 ?auto_184585 ) ( CLEAR ?auto_184586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184580 ?auto_184581 ?auto_184582 ?auto_184583 ?auto_184584 ?auto_184585 )
      ( MAKE-5PILE ?auto_184580 ?auto_184581 ?auto_184582 ?auto_184583 ?auto_184584 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184588 - BLOCK
      ?auto_184589 - BLOCK
      ?auto_184590 - BLOCK
      ?auto_184591 - BLOCK
      ?auto_184592 - BLOCK
    )
    :vars
    (
      ?auto_184593 - BLOCK
      ?auto_184594 - BLOCK
      ?auto_184595 - BLOCK
      ?auto_184596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184593 ?auto_184592 ) ( ON-TABLE ?auto_184588 ) ( ON ?auto_184589 ?auto_184588 ) ( ON ?auto_184590 ?auto_184589 ) ( ON ?auto_184591 ?auto_184590 ) ( ON ?auto_184592 ?auto_184591 ) ( not ( = ?auto_184588 ?auto_184589 ) ) ( not ( = ?auto_184588 ?auto_184590 ) ) ( not ( = ?auto_184588 ?auto_184591 ) ) ( not ( = ?auto_184588 ?auto_184592 ) ) ( not ( = ?auto_184588 ?auto_184593 ) ) ( not ( = ?auto_184589 ?auto_184590 ) ) ( not ( = ?auto_184589 ?auto_184591 ) ) ( not ( = ?auto_184589 ?auto_184592 ) ) ( not ( = ?auto_184589 ?auto_184593 ) ) ( not ( = ?auto_184590 ?auto_184591 ) ) ( not ( = ?auto_184590 ?auto_184592 ) ) ( not ( = ?auto_184590 ?auto_184593 ) ) ( not ( = ?auto_184591 ?auto_184592 ) ) ( not ( = ?auto_184591 ?auto_184593 ) ) ( not ( = ?auto_184592 ?auto_184593 ) ) ( not ( = ?auto_184588 ?auto_184594 ) ) ( not ( = ?auto_184588 ?auto_184595 ) ) ( not ( = ?auto_184589 ?auto_184594 ) ) ( not ( = ?auto_184589 ?auto_184595 ) ) ( not ( = ?auto_184590 ?auto_184594 ) ) ( not ( = ?auto_184590 ?auto_184595 ) ) ( not ( = ?auto_184591 ?auto_184594 ) ) ( not ( = ?auto_184591 ?auto_184595 ) ) ( not ( = ?auto_184592 ?auto_184594 ) ) ( not ( = ?auto_184592 ?auto_184595 ) ) ( not ( = ?auto_184593 ?auto_184594 ) ) ( not ( = ?auto_184593 ?auto_184595 ) ) ( not ( = ?auto_184594 ?auto_184595 ) ) ( ON ?auto_184594 ?auto_184593 ) ( CLEAR ?auto_184594 ) ( HOLDING ?auto_184595 ) ( CLEAR ?auto_184596 ) ( ON-TABLE ?auto_184596 ) ( not ( = ?auto_184596 ?auto_184595 ) ) ( not ( = ?auto_184588 ?auto_184596 ) ) ( not ( = ?auto_184589 ?auto_184596 ) ) ( not ( = ?auto_184590 ?auto_184596 ) ) ( not ( = ?auto_184591 ?auto_184596 ) ) ( not ( = ?auto_184592 ?auto_184596 ) ) ( not ( = ?auto_184593 ?auto_184596 ) ) ( not ( = ?auto_184594 ?auto_184596 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184596 ?auto_184595 )
      ( MAKE-5PILE ?auto_184588 ?auto_184589 ?auto_184590 ?auto_184591 ?auto_184592 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186116 - BLOCK
      ?auto_186117 - BLOCK
      ?auto_186118 - BLOCK
      ?auto_186119 - BLOCK
      ?auto_186120 - BLOCK
    )
    :vars
    (
      ?auto_186122 - BLOCK
      ?auto_186123 - BLOCK
      ?auto_186121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186122 ?auto_186120 ) ( ON-TABLE ?auto_186116 ) ( ON ?auto_186117 ?auto_186116 ) ( ON ?auto_186118 ?auto_186117 ) ( ON ?auto_186119 ?auto_186118 ) ( ON ?auto_186120 ?auto_186119 ) ( not ( = ?auto_186116 ?auto_186117 ) ) ( not ( = ?auto_186116 ?auto_186118 ) ) ( not ( = ?auto_186116 ?auto_186119 ) ) ( not ( = ?auto_186116 ?auto_186120 ) ) ( not ( = ?auto_186116 ?auto_186122 ) ) ( not ( = ?auto_186117 ?auto_186118 ) ) ( not ( = ?auto_186117 ?auto_186119 ) ) ( not ( = ?auto_186117 ?auto_186120 ) ) ( not ( = ?auto_186117 ?auto_186122 ) ) ( not ( = ?auto_186118 ?auto_186119 ) ) ( not ( = ?auto_186118 ?auto_186120 ) ) ( not ( = ?auto_186118 ?auto_186122 ) ) ( not ( = ?auto_186119 ?auto_186120 ) ) ( not ( = ?auto_186119 ?auto_186122 ) ) ( not ( = ?auto_186120 ?auto_186122 ) ) ( not ( = ?auto_186116 ?auto_186123 ) ) ( not ( = ?auto_186116 ?auto_186121 ) ) ( not ( = ?auto_186117 ?auto_186123 ) ) ( not ( = ?auto_186117 ?auto_186121 ) ) ( not ( = ?auto_186118 ?auto_186123 ) ) ( not ( = ?auto_186118 ?auto_186121 ) ) ( not ( = ?auto_186119 ?auto_186123 ) ) ( not ( = ?auto_186119 ?auto_186121 ) ) ( not ( = ?auto_186120 ?auto_186123 ) ) ( not ( = ?auto_186120 ?auto_186121 ) ) ( not ( = ?auto_186122 ?auto_186123 ) ) ( not ( = ?auto_186122 ?auto_186121 ) ) ( not ( = ?auto_186123 ?auto_186121 ) ) ( ON ?auto_186123 ?auto_186122 ) ( ON ?auto_186121 ?auto_186123 ) ( CLEAR ?auto_186121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186116 ?auto_186117 ?auto_186118 ?auto_186119 ?auto_186120 ?auto_186122 ?auto_186123 )
      ( MAKE-5PILE ?auto_186116 ?auto_186117 ?auto_186118 ?auto_186119 ?auto_186120 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184606 - BLOCK
      ?auto_184607 - BLOCK
      ?auto_184608 - BLOCK
      ?auto_184609 - BLOCK
      ?auto_184610 - BLOCK
    )
    :vars
    (
      ?auto_184614 - BLOCK
      ?auto_184613 - BLOCK
      ?auto_184612 - BLOCK
      ?auto_184611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184614 ?auto_184610 ) ( ON-TABLE ?auto_184606 ) ( ON ?auto_184607 ?auto_184606 ) ( ON ?auto_184608 ?auto_184607 ) ( ON ?auto_184609 ?auto_184608 ) ( ON ?auto_184610 ?auto_184609 ) ( not ( = ?auto_184606 ?auto_184607 ) ) ( not ( = ?auto_184606 ?auto_184608 ) ) ( not ( = ?auto_184606 ?auto_184609 ) ) ( not ( = ?auto_184606 ?auto_184610 ) ) ( not ( = ?auto_184606 ?auto_184614 ) ) ( not ( = ?auto_184607 ?auto_184608 ) ) ( not ( = ?auto_184607 ?auto_184609 ) ) ( not ( = ?auto_184607 ?auto_184610 ) ) ( not ( = ?auto_184607 ?auto_184614 ) ) ( not ( = ?auto_184608 ?auto_184609 ) ) ( not ( = ?auto_184608 ?auto_184610 ) ) ( not ( = ?auto_184608 ?auto_184614 ) ) ( not ( = ?auto_184609 ?auto_184610 ) ) ( not ( = ?auto_184609 ?auto_184614 ) ) ( not ( = ?auto_184610 ?auto_184614 ) ) ( not ( = ?auto_184606 ?auto_184613 ) ) ( not ( = ?auto_184606 ?auto_184612 ) ) ( not ( = ?auto_184607 ?auto_184613 ) ) ( not ( = ?auto_184607 ?auto_184612 ) ) ( not ( = ?auto_184608 ?auto_184613 ) ) ( not ( = ?auto_184608 ?auto_184612 ) ) ( not ( = ?auto_184609 ?auto_184613 ) ) ( not ( = ?auto_184609 ?auto_184612 ) ) ( not ( = ?auto_184610 ?auto_184613 ) ) ( not ( = ?auto_184610 ?auto_184612 ) ) ( not ( = ?auto_184614 ?auto_184613 ) ) ( not ( = ?auto_184614 ?auto_184612 ) ) ( not ( = ?auto_184613 ?auto_184612 ) ) ( ON ?auto_184613 ?auto_184614 ) ( not ( = ?auto_184611 ?auto_184612 ) ) ( not ( = ?auto_184606 ?auto_184611 ) ) ( not ( = ?auto_184607 ?auto_184611 ) ) ( not ( = ?auto_184608 ?auto_184611 ) ) ( not ( = ?auto_184609 ?auto_184611 ) ) ( not ( = ?auto_184610 ?auto_184611 ) ) ( not ( = ?auto_184614 ?auto_184611 ) ) ( not ( = ?auto_184613 ?auto_184611 ) ) ( ON ?auto_184612 ?auto_184613 ) ( CLEAR ?auto_184612 ) ( HOLDING ?auto_184611 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184611 )
      ( MAKE-5PILE ?auto_184606 ?auto_184607 ?auto_184608 ?auto_184609 ?auto_184610 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184615 - BLOCK
      ?auto_184616 - BLOCK
      ?auto_184617 - BLOCK
      ?auto_184618 - BLOCK
      ?auto_184619 - BLOCK
    )
    :vars
    (
      ?auto_184622 - BLOCK
      ?auto_184620 - BLOCK
      ?auto_184623 - BLOCK
      ?auto_184621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184622 ?auto_184619 ) ( ON-TABLE ?auto_184615 ) ( ON ?auto_184616 ?auto_184615 ) ( ON ?auto_184617 ?auto_184616 ) ( ON ?auto_184618 ?auto_184617 ) ( ON ?auto_184619 ?auto_184618 ) ( not ( = ?auto_184615 ?auto_184616 ) ) ( not ( = ?auto_184615 ?auto_184617 ) ) ( not ( = ?auto_184615 ?auto_184618 ) ) ( not ( = ?auto_184615 ?auto_184619 ) ) ( not ( = ?auto_184615 ?auto_184622 ) ) ( not ( = ?auto_184616 ?auto_184617 ) ) ( not ( = ?auto_184616 ?auto_184618 ) ) ( not ( = ?auto_184616 ?auto_184619 ) ) ( not ( = ?auto_184616 ?auto_184622 ) ) ( not ( = ?auto_184617 ?auto_184618 ) ) ( not ( = ?auto_184617 ?auto_184619 ) ) ( not ( = ?auto_184617 ?auto_184622 ) ) ( not ( = ?auto_184618 ?auto_184619 ) ) ( not ( = ?auto_184618 ?auto_184622 ) ) ( not ( = ?auto_184619 ?auto_184622 ) ) ( not ( = ?auto_184615 ?auto_184620 ) ) ( not ( = ?auto_184615 ?auto_184623 ) ) ( not ( = ?auto_184616 ?auto_184620 ) ) ( not ( = ?auto_184616 ?auto_184623 ) ) ( not ( = ?auto_184617 ?auto_184620 ) ) ( not ( = ?auto_184617 ?auto_184623 ) ) ( not ( = ?auto_184618 ?auto_184620 ) ) ( not ( = ?auto_184618 ?auto_184623 ) ) ( not ( = ?auto_184619 ?auto_184620 ) ) ( not ( = ?auto_184619 ?auto_184623 ) ) ( not ( = ?auto_184622 ?auto_184620 ) ) ( not ( = ?auto_184622 ?auto_184623 ) ) ( not ( = ?auto_184620 ?auto_184623 ) ) ( ON ?auto_184620 ?auto_184622 ) ( not ( = ?auto_184621 ?auto_184623 ) ) ( not ( = ?auto_184615 ?auto_184621 ) ) ( not ( = ?auto_184616 ?auto_184621 ) ) ( not ( = ?auto_184617 ?auto_184621 ) ) ( not ( = ?auto_184618 ?auto_184621 ) ) ( not ( = ?auto_184619 ?auto_184621 ) ) ( not ( = ?auto_184622 ?auto_184621 ) ) ( not ( = ?auto_184620 ?auto_184621 ) ) ( ON ?auto_184623 ?auto_184620 ) ( ON ?auto_184621 ?auto_184623 ) ( CLEAR ?auto_184621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184615 ?auto_184616 ?auto_184617 ?auto_184618 ?auto_184619 ?auto_184622 ?auto_184620 ?auto_184623 )
      ( MAKE-5PILE ?auto_184615 ?auto_184616 ?auto_184617 ?auto_184618 ?auto_184619 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184628 - BLOCK
      ?auto_184629 - BLOCK
      ?auto_184630 - BLOCK
      ?auto_184631 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_184631 ) ( CLEAR ?auto_184630 ) ( ON-TABLE ?auto_184628 ) ( ON ?auto_184629 ?auto_184628 ) ( ON ?auto_184630 ?auto_184629 ) ( not ( = ?auto_184628 ?auto_184629 ) ) ( not ( = ?auto_184628 ?auto_184630 ) ) ( not ( = ?auto_184628 ?auto_184631 ) ) ( not ( = ?auto_184629 ?auto_184630 ) ) ( not ( = ?auto_184629 ?auto_184631 ) ) ( not ( = ?auto_184630 ?auto_184631 ) ) )
    :subtasks
    ( ( !STACK ?auto_184631 ?auto_184630 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184632 - BLOCK
      ?auto_184633 - BLOCK
      ?auto_184634 - BLOCK
      ?auto_184635 - BLOCK
    )
    :vars
    (
      ?auto_184636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184634 ) ( ON-TABLE ?auto_184632 ) ( ON ?auto_184633 ?auto_184632 ) ( ON ?auto_184634 ?auto_184633 ) ( not ( = ?auto_184632 ?auto_184633 ) ) ( not ( = ?auto_184632 ?auto_184634 ) ) ( not ( = ?auto_184632 ?auto_184635 ) ) ( not ( = ?auto_184633 ?auto_184634 ) ) ( not ( = ?auto_184633 ?auto_184635 ) ) ( not ( = ?auto_184634 ?auto_184635 ) ) ( ON ?auto_184635 ?auto_184636 ) ( CLEAR ?auto_184635 ) ( HAND-EMPTY ) ( not ( = ?auto_184632 ?auto_184636 ) ) ( not ( = ?auto_184633 ?auto_184636 ) ) ( not ( = ?auto_184634 ?auto_184636 ) ) ( not ( = ?auto_184635 ?auto_184636 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184635 ?auto_184636 )
      ( MAKE-4PILE ?auto_184632 ?auto_184633 ?auto_184634 ?auto_184635 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184637 - BLOCK
      ?auto_184638 - BLOCK
      ?auto_184639 - BLOCK
      ?auto_184640 - BLOCK
    )
    :vars
    (
      ?auto_184641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184637 ) ( ON ?auto_184638 ?auto_184637 ) ( not ( = ?auto_184637 ?auto_184638 ) ) ( not ( = ?auto_184637 ?auto_184639 ) ) ( not ( = ?auto_184637 ?auto_184640 ) ) ( not ( = ?auto_184638 ?auto_184639 ) ) ( not ( = ?auto_184638 ?auto_184640 ) ) ( not ( = ?auto_184639 ?auto_184640 ) ) ( ON ?auto_184640 ?auto_184641 ) ( CLEAR ?auto_184640 ) ( not ( = ?auto_184637 ?auto_184641 ) ) ( not ( = ?auto_184638 ?auto_184641 ) ) ( not ( = ?auto_184639 ?auto_184641 ) ) ( not ( = ?auto_184640 ?auto_184641 ) ) ( HOLDING ?auto_184639 ) ( CLEAR ?auto_184638 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184637 ?auto_184638 ?auto_184639 )
      ( MAKE-4PILE ?auto_184637 ?auto_184638 ?auto_184639 ?auto_184640 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184642 - BLOCK
      ?auto_184643 - BLOCK
      ?auto_184644 - BLOCK
      ?auto_184645 - BLOCK
    )
    :vars
    (
      ?auto_184646 - BLOCK
      ?auto_184647 - BLOCK
      ?auto_184649 - BLOCK
      ?auto_184650 - BLOCK
      ?auto_184648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184642 ) ( ON ?auto_184643 ?auto_184642 ) ( not ( = ?auto_184642 ?auto_184643 ) ) ( not ( = ?auto_184642 ?auto_184644 ) ) ( not ( = ?auto_184642 ?auto_184645 ) ) ( not ( = ?auto_184643 ?auto_184644 ) ) ( not ( = ?auto_184643 ?auto_184645 ) ) ( not ( = ?auto_184644 ?auto_184645 ) ) ( ON ?auto_184645 ?auto_184646 ) ( not ( = ?auto_184642 ?auto_184646 ) ) ( not ( = ?auto_184643 ?auto_184646 ) ) ( not ( = ?auto_184644 ?auto_184646 ) ) ( not ( = ?auto_184645 ?auto_184646 ) ) ( CLEAR ?auto_184643 ) ( ON ?auto_184644 ?auto_184645 ) ( CLEAR ?auto_184644 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184647 ) ( ON ?auto_184649 ?auto_184647 ) ( ON ?auto_184650 ?auto_184649 ) ( ON ?auto_184648 ?auto_184650 ) ( ON ?auto_184646 ?auto_184648 ) ( not ( = ?auto_184647 ?auto_184649 ) ) ( not ( = ?auto_184647 ?auto_184650 ) ) ( not ( = ?auto_184647 ?auto_184648 ) ) ( not ( = ?auto_184647 ?auto_184646 ) ) ( not ( = ?auto_184647 ?auto_184645 ) ) ( not ( = ?auto_184647 ?auto_184644 ) ) ( not ( = ?auto_184649 ?auto_184650 ) ) ( not ( = ?auto_184649 ?auto_184648 ) ) ( not ( = ?auto_184649 ?auto_184646 ) ) ( not ( = ?auto_184649 ?auto_184645 ) ) ( not ( = ?auto_184649 ?auto_184644 ) ) ( not ( = ?auto_184650 ?auto_184648 ) ) ( not ( = ?auto_184650 ?auto_184646 ) ) ( not ( = ?auto_184650 ?auto_184645 ) ) ( not ( = ?auto_184650 ?auto_184644 ) ) ( not ( = ?auto_184648 ?auto_184646 ) ) ( not ( = ?auto_184648 ?auto_184645 ) ) ( not ( = ?auto_184648 ?auto_184644 ) ) ( not ( = ?auto_184642 ?auto_184647 ) ) ( not ( = ?auto_184642 ?auto_184649 ) ) ( not ( = ?auto_184642 ?auto_184650 ) ) ( not ( = ?auto_184642 ?auto_184648 ) ) ( not ( = ?auto_184643 ?auto_184647 ) ) ( not ( = ?auto_184643 ?auto_184649 ) ) ( not ( = ?auto_184643 ?auto_184650 ) ) ( not ( = ?auto_184643 ?auto_184648 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184647 ?auto_184649 ?auto_184650 ?auto_184648 ?auto_184646 ?auto_184645 )
      ( MAKE-4PILE ?auto_184642 ?auto_184643 ?auto_184644 ?auto_184645 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184651 - BLOCK
      ?auto_184652 - BLOCK
      ?auto_184653 - BLOCK
      ?auto_184654 - BLOCK
    )
    :vars
    (
      ?auto_184656 - BLOCK
      ?auto_184655 - BLOCK
      ?auto_184657 - BLOCK
      ?auto_184658 - BLOCK
      ?auto_184659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184651 ) ( not ( = ?auto_184651 ?auto_184652 ) ) ( not ( = ?auto_184651 ?auto_184653 ) ) ( not ( = ?auto_184651 ?auto_184654 ) ) ( not ( = ?auto_184652 ?auto_184653 ) ) ( not ( = ?auto_184652 ?auto_184654 ) ) ( not ( = ?auto_184653 ?auto_184654 ) ) ( ON ?auto_184654 ?auto_184656 ) ( not ( = ?auto_184651 ?auto_184656 ) ) ( not ( = ?auto_184652 ?auto_184656 ) ) ( not ( = ?auto_184653 ?auto_184656 ) ) ( not ( = ?auto_184654 ?auto_184656 ) ) ( ON ?auto_184653 ?auto_184654 ) ( CLEAR ?auto_184653 ) ( ON-TABLE ?auto_184655 ) ( ON ?auto_184657 ?auto_184655 ) ( ON ?auto_184658 ?auto_184657 ) ( ON ?auto_184659 ?auto_184658 ) ( ON ?auto_184656 ?auto_184659 ) ( not ( = ?auto_184655 ?auto_184657 ) ) ( not ( = ?auto_184655 ?auto_184658 ) ) ( not ( = ?auto_184655 ?auto_184659 ) ) ( not ( = ?auto_184655 ?auto_184656 ) ) ( not ( = ?auto_184655 ?auto_184654 ) ) ( not ( = ?auto_184655 ?auto_184653 ) ) ( not ( = ?auto_184657 ?auto_184658 ) ) ( not ( = ?auto_184657 ?auto_184659 ) ) ( not ( = ?auto_184657 ?auto_184656 ) ) ( not ( = ?auto_184657 ?auto_184654 ) ) ( not ( = ?auto_184657 ?auto_184653 ) ) ( not ( = ?auto_184658 ?auto_184659 ) ) ( not ( = ?auto_184658 ?auto_184656 ) ) ( not ( = ?auto_184658 ?auto_184654 ) ) ( not ( = ?auto_184658 ?auto_184653 ) ) ( not ( = ?auto_184659 ?auto_184656 ) ) ( not ( = ?auto_184659 ?auto_184654 ) ) ( not ( = ?auto_184659 ?auto_184653 ) ) ( not ( = ?auto_184651 ?auto_184655 ) ) ( not ( = ?auto_184651 ?auto_184657 ) ) ( not ( = ?auto_184651 ?auto_184658 ) ) ( not ( = ?auto_184651 ?auto_184659 ) ) ( not ( = ?auto_184652 ?auto_184655 ) ) ( not ( = ?auto_184652 ?auto_184657 ) ) ( not ( = ?auto_184652 ?auto_184658 ) ) ( not ( = ?auto_184652 ?auto_184659 ) ) ( HOLDING ?auto_184652 ) ( CLEAR ?auto_184651 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184651 ?auto_184652 )
      ( MAKE-4PILE ?auto_184651 ?auto_184652 ?auto_184653 ?auto_184654 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184660 - BLOCK
      ?auto_184661 - BLOCK
      ?auto_184662 - BLOCK
      ?auto_184663 - BLOCK
    )
    :vars
    (
      ?auto_184666 - BLOCK
      ?auto_184667 - BLOCK
      ?auto_184668 - BLOCK
      ?auto_184665 - BLOCK
      ?auto_184664 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184660 ) ( not ( = ?auto_184660 ?auto_184661 ) ) ( not ( = ?auto_184660 ?auto_184662 ) ) ( not ( = ?auto_184660 ?auto_184663 ) ) ( not ( = ?auto_184661 ?auto_184662 ) ) ( not ( = ?auto_184661 ?auto_184663 ) ) ( not ( = ?auto_184662 ?auto_184663 ) ) ( ON ?auto_184663 ?auto_184666 ) ( not ( = ?auto_184660 ?auto_184666 ) ) ( not ( = ?auto_184661 ?auto_184666 ) ) ( not ( = ?auto_184662 ?auto_184666 ) ) ( not ( = ?auto_184663 ?auto_184666 ) ) ( ON ?auto_184662 ?auto_184663 ) ( ON-TABLE ?auto_184667 ) ( ON ?auto_184668 ?auto_184667 ) ( ON ?auto_184665 ?auto_184668 ) ( ON ?auto_184664 ?auto_184665 ) ( ON ?auto_184666 ?auto_184664 ) ( not ( = ?auto_184667 ?auto_184668 ) ) ( not ( = ?auto_184667 ?auto_184665 ) ) ( not ( = ?auto_184667 ?auto_184664 ) ) ( not ( = ?auto_184667 ?auto_184666 ) ) ( not ( = ?auto_184667 ?auto_184663 ) ) ( not ( = ?auto_184667 ?auto_184662 ) ) ( not ( = ?auto_184668 ?auto_184665 ) ) ( not ( = ?auto_184668 ?auto_184664 ) ) ( not ( = ?auto_184668 ?auto_184666 ) ) ( not ( = ?auto_184668 ?auto_184663 ) ) ( not ( = ?auto_184668 ?auto_184662 ) ) ( not ( = ?auto_184665 ?auto_184664 ) ) ( not ( = ?auto_184665 ?auto_184666 ) ) ( not ( = ?auto_184665 ?auto_184663 ) ) ( not ( = ?auto_184665 ?auto_184662 ) ) ( not ( = ?auto_184664 ?auto_184666 ) ) ( not ( = ?auto_184664 ?auto_184663 ) ) ( not ( = ?auto_184664 ?auto_184662 ) ) ( not ( = ?auto_184660 ?auto_184667 ) ) ( not ( = ?auto_184660 ?auto_184668 ) ) ( not ( = ?auto_184660 ?auto_184665 ) ) ( not ( = ?auto_184660 ?auto_184664 ) ) ( not ( = ?auto_184661 ?auto_184667 ) ) ( not ( = ?auto_184661 ?auto_184668 ) ) ( not ( = ?auto_184661 ?auto_184665 ) ) ( not ( = ?auto_184661 ?auto_184664 ) ) ( CLEAR ?auto_184660 ) ( ON ?auto_184661 ?auto_184662 ) ( CLEAR ?auto_184661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184667 ?auto_184668 ?auto_184665 ?auto_184664 ?auto_184666 ?auto_184663 ?auto_184662 )
      ( MAKE-4PILE ?auto_184660 ?auto_184661 ?auto_184662 ?auto_184663 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184669 - BLOCK
      ?auto_184670 - BLOCK
      ?auto_184671 - BLOCK
      ?auto_184672 - BLOCK
    )
    :vars
    (
      ?auto_184677 - BLOCK
      ?auto_184675 - BLOCK
      ?auto_184676 - BLOCK
      ?auto_184674 - BLOCK
      ?auto_184673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184669 ?auto_184670 ) ) ( not ( = ?auto_184669 ?auto_184671 ) ) ( not ( = ?auto_184669 ?auto_184672 ) ) ( not ( = ?auto_184670 ?auto_184671 ) ) ( not ( = ?auto_184670 ?auto_184672 ) ) ( not ( = ?auto_184671 ?auto_184672 ) ) ( ON ?auto_184672 ?auto_184677 ) ( not ( = ?auto_184669 ?auto_184677 ) ) ( not ( = ?auto_184670 ?auto_184677 ) ) ( not ( = ?auto_184671 ?auto_184677 ) ) ( not ( = ?auto_184672 ?auto_184677 ) ) ( ON ?auto_184671 ?auto_184672 ) ( ON-TABLE ?auto_184675 ) ( ON ?auto_184676 ?auto_184675 ) ( ON ?auto_184674 ?auto_184676 ) ( ON ?auto_184673 ?auto_184674 ) ( ON ?auto_184677 ?auto_184673 ) ( not ( = ?auto_184675 ?auto_184676 ) ) ( not ( = ?auto_184675 ?auto_184674 ) ) ( not ( = ?auto_184675 ?auto_184673 ) ) ( not ( = ?auto_184675 ?auto_184677 ) ) ( not ( = ?auto_184675 ?auto_184672 ) ) ( not ( = ?auto_184675 ?auto_184671 ) ) ( not ( = ?auto_184676 ?auto_184674 ) ) ( not ( = ?auto_184676 ?auto_184673 ) ) ( not ( = ?auto_184676 ?auto_184677 ) ) ( not ( = ?auto_184676 ?auto_184672 ) ) ( not ( = ?auto_184676 ?auto_184671 ) ) ( not ( = ?auto_184674 ?auto_184673 ) ) ( not ( = ?auto_184674 ?auto_184677 ) ) ( not ( = ?auto_184674 ?auto_184672 ) ) ( not ( = ?auto_184674 ?auto_184671 ) ) ( not ( = ?auto_184673 ?auto_184677 ) ) ( not ( = ?auto_184673 ?auto_184672 ) ) ( not ( = ?auto_184673 ?auto_184671 ) ) ( not ( = ?auto_184669 ?auto_184675 ) ) ( not ( = ?auto_184669 ?auto_184676 ) ) ( not ( = ?auto_184669 ?auto_184674 ) ) ( not ( = ?auto_184669 ?auto_184673 ) ) ( not ( = ?auto_184670 ?auto_184675 ) ) ( not ( = ?auto_184670 ?auto_184676 ) ) ( not ( = ?auto_184670 ?auto_184674 ) ) ( not ( = ?auto_184670 ?auto_184673 ) ) ( ON ?auto_184670 ?auto_184671 ) ( CLEAR ?auto_184670 ) ( HOLDING ?auto_184669 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184669 )
      ( MAKE-4PILE ?auto_184669 ?auto_184670 ?auto_184671 ?auto_184672 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184678 - BLOCK
      ?auto_184679 - BLOCK
      ?auto_184680 - BLOCK
      ?auto_184681 - BLOCK
    )
    :vars
    (
      ?auto_184683 - BLOCK
      ?auto_184682 - BLOCK
      ?auto_184685 - BLOCK
      ?auto_184686 - BLOCK
      ?auto_184684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184678 ?auto_184679 ) ) ( not ( = ?auto_184678 ?auto_184680 ) ) ( not ( = ?auto_184678 ?auto_184681 ) ) ( not ( = ?auto_184679 ?auto_184680 ) ) ( not ( = ?auto_184679 ?auto_184681 ) ) ( not ( = ?auto_184680 ?auto_184681 ) ) ( ON ?auto_184681 ?auto_184683 ) ( not ( = ?auto_184678 ?auto_184683 ) ) ( not ( = ?auto_184679 ?auto_184683 ) ) ( not ( = ?auto_184680 ?auto_184683 ) ) ( not ( = ?auto_184681 ?auto_184683 ) ) ( ON ?auto_184680 ?auto_184681 ) ( ON-TABLE ?auto_184682 ) ( ON ?auto_184685 ?auto_184682 ) ( ON ?auto_184686 ?auto_184685 ) ( ON ?auto_184684 ?auto_184686 ) ( ON ?auto_184683 ?auto_184684 ) ( not ( = ?auto_184682 ?auto_184685 ) ) ( not ( = ?auto_184682 ?auto_184686 ) ) ( not ( = ?auto_184682 ?auto_184684 ) ) ( not ( = ?auto_184682 ?auto_184683 ) ) ( not ( = ?auto_184682 ?auto_184681 ) ) ( not ( = ?auto_184682 ?auto_184680 ) ) ( not ( = ?auto_184685 ?auto_184686 ) ) ( not ( = ?auto_184685 ?auto_184684 ) ) ( not ( = ?auto_184685 ?auto_184683 ) ) ( not ( = ?auto_184685 ?auto_184681 ) ) ( not ( = ?auto_184685 ?auto_184680 ) ) ( not ( = ?auto_184686 ?auto_184684 ) ) ( not ( = ?auto_184686 ?auto_184683 ) ) ( not ( = ?auto_184686 ?auto_184681 ) ) ( not ( = ?auto_184686 ?auto_184680 ) ) ( not ( = ?auto_184684 ?auto_184683 ) ) ( not ( = ?auto_184684 ?auto_184681 ) ) ( not ( = ?auto_184684 ?auto_184680 ) ) ( not ( = ?auto_184678 ?auto_184682 ) ) ( not ( = ?auto_184678 ?auto_184685 ) ) ( not ( = ?auto_184678 ?auto_184686 ) ) ( not ( = ?auto_184678 ?auto_184684 ) ) ( not ( = ?auto_184679 ?auto_184682 ) ) ( not ( = ?auto_184679 ?auto_184685 ) ) ( not ( = ?auto_184679 ?auto_184686 ) ) ( not ( = ?auto_184679 ?auto_184684 ) ) ( ON ?auto_184679 ?auto_184680 ) ( ON ?auto_184678 ?auto_184679 ) ( CLEAR ?auto_184678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184682 ?auto_184685 ?auto_184686 ?auto_184684 ?auto_184683 ?auto_184681 ?auto_184680 ?auto_184679 )
      ( MAKE-4PILE ?auto_184678 ?auto_184679 ?auto_184680 ?auto_184681 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184691 - BLOCK
      ?auto_184692 - BLOCK
      ?auto_184693 - BLOCK
      ?auto_184694 - BLOCK
    )
    :vars
    (
      ?auto_184695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184695 ?auto_184694 ) ( CLEAR ?auto_184695 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184691 ) ( ON ?auto_184692 ?auto_184691 ) ( ON ?auto_184693 ?auto_184692 ) ( ON ?auto_184694 ?auto_184693 ) ( not ( = ?auto_184691 ?auto_184692 ) ) ( not ( = ?auto_184691 ?auto_184693 ) ) ( not ( = ?auto_184691 ?auto_184694 ) ) ( not ( = ?auto_184691 ?auto_184695 ) ) ( not ( = ?auto_184692 ?auto_184693 ) ) ( not ( = ?auto_184692 ?auto_184694 ) ) ( not ( = ?auto_184692 ?auto_184695 ) ) ( not ( = ?auto_184693 ?auto_184694 ) ) ( not ( = ?auto_184693 ?auto_184695 ) ) ( not ( = ?auto_184694 ?auto_184695 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184695 ?auto_184694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184696 - BLOCK
      ?auto_184697 - BLOCK
      ?auto_184698 - BLOCK
      ?auto_184699 - BLOCK
    )
    :vars
    (
      ?auto_184700 - BLOCK
      ?auto_184701 - BLOCK
      ?auto_184702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184700 ?auto_184699 ) ( CLEAR ?auto_184700 ) ( ON-TABLE ?auto_184696 ) ( ON ?auto_184697 ?auto_184696 ) ( ON ?auto_184698 ?auto_184697 ) ( ON ?auto_184699 ?auto_184698 ) ( not ( = ?auto_184696 ?auto_184697 ) ) ( not ( = ?auto_184696 ?auto_184698 ) ) ( not ( = ?auto_184696 ?auto_184699 ) ) ( not ( = ?auto_184696 ?auto_184700 ) ) ( not ( = ?auto_184697 ?auto_184698 ) ) ( not ( = ?auto_184697 ?auto_184699 ) ) ( not ( = ?auto_184697 ?auto_184700 ) ) ( not ( = ?auto_184698 ?auto_184699 ) ) ( not ( = ?auto_184698 ?auto_184700 ) ) ( not ( = ?auto_184699 ?auto_184700 ) ) ( HOLDING ?auto_184701 ) ( CLEAR ?auto_184702 ) ( not ( = ?auto_184696 ?auto_184701 ) ) ( not ( = ?auto_184696 ?auto_184702 ) ) ( not ( = ?auto_184697 ?auto_184701 ) ) ( not ( = ?auto_184697 ?auto_184702 ) ) ( not ( = ?auto_184698 ?auto_184701 ) ) ( not ( = ?auto_184698 ?auto_184702 ) ) ( not ( = ?auto_184699 ?auto_184701 ) ) ( not ( = ?auto_184699 ?auto_184702 ) ) ( not ( = ?auto_184700 ?auto_184701 ) ) ( not ( = ?auto_184700 ?auto_184702 ) ) ( not ( = ?auto_184701 ?auto_184702 ) ) )
    :subtasks
    ( ( !STACK ?auto_184701 ?auto_184702 )
      ( MAKE-4PILE ?auto_184696 ?auto_184697 ?auto_184698 ?auto_184699 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184703 - BLOCK
      ?auto_184704 - BLOCK
      ?auto_184705 - BLOCK
      ?auto_184706 - BLOCK
    )
    :vars
    (
      ?auto_184708 - BLOCK
      ?auto_184709 - BLOCK
      ?auto_184707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184708 ?auto_184706 ) ( ON-TABLE ?auto_184703 ) ( ON ?auto_184704 ?auto_184703 ) ( ON ?auto_184705 ?auto_184704 ) ( ON ?auto_184706 ?auto_184705 ) ( not ( = ?auto_184703 ?auto_184704 ) ) ( not ( = ?auto_184703 ?auto_184705 ) ) ( not ( = ?auto_184703 ?auto_184706 ) ) ( not ( = ?auto_184703 ?auto_184708 ) ) ( not ( = ?auto_184704 ?auto_184705 ) ) ( not ( = ?auto_184704 ?auto_184706 ) ) ( not ( = ?auto_184704 ?auto_184708 ) ) ( not ( = ?auto_184705 ?auto_184706 ) ) ( not ( = ?auto_184705 ?auto_184708 ) ) ( not ( = ?auto_184706 ?auto_184708 ) ) ( CLEAR ?auto_184709 ) ( not ( = ?auto_184703 ?auto_184707 ) ) ( not ( = ?auto_184703 ?auto_184709 ) ) ( not ( = ?auto_184704 ?auto_184707 ) ) ( not ( = ?auto_184704 ?auto_184709 ) ) ( not ( = ?auto_184705 ?auto_184707 ) ) ( not ( = ?auto_184705 ?auto_184709 ) ) ( not ( = ?auto_184706 ?auto_184707 ) ) ( not ( = ?auto_184706 ?auto_184709 ) ) ( not ( = ?auto_184708 ?auto_184707 ) ) ( not ( = ?auto_184708 ?auto_184709 ) ) ( not ( = ?auto_184707 ?auto_184709 ) ) ( ON ?auto_184707 ?auto_184708 ) ( CLEAR ?auto_184707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184703 ?auto_184704 ?auto_184705 ?auto_184706 ?auto_184708 )
      ( MAKE-4PILE ?auto_184703 ?auto_184704 ?auto_184705 ?auto_184706 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184710 - BLOCK
      ?auto_184711 - BLOCK
      ?auto_184712 - BLOCK
      ?auto_184713 - BLOCK
    )
    :vars
    (
      ?auto_184714 - BLOCK
      ?auto_184715 - BLOCK
      ?auto_184716 - BLOCK
      ?auto_184717 - BLOCK
      ?auto_184718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184714 ?auto_184713 ) ( ON-TABLE ?auto_184710 ) ( ON ?auto_184711 ?auto_184710 ) ( ON ?auto_184712 ?auto_184711 ) ( ON ?auto_184713 ?auto_184712 ) ( not ( = ?auto_184710 ?auto_184711 ) ) ( not ( = ?auto_184710 ?auto_184712 ) ) ( not ( = ?auto_184710 ?auto_184713 ) ) ( not ( = ?auto_184710 ?auto_184714 ) ) ( not ( = ?auto_184711 ?auto_184712 ) ) ( not ( = ?auto_184711 ?auto_184713 ) ) ( not ( = ?auto_184711 ?auto_184714 ) ) ( not ( = ?auto_184712 ?auto_184713 ) ) ( not ( = ?auto_184712 ?auto_184714 ) ) ( not ( = ?auto_184713 ?auto_184714 ) ) ( not ( = ?auto_184710 ?auto_184715 ) ) ( not ( = ?auto_184710 ?auto_184716 ) ) ( not ( = ?auto_184711 ?auto_184715 ) ) ( not ( = ?auto_184711 ?auto_184716 ) ) ( not ( = ?auto_184712 ?auto_184715 ) ) ( not ( = ?auto_184712 ?auto_184716 ) ) ( not ( = ?auto_184713 ?auto_184715 ) ) ( not ( = ?auto_184713 ?auto_184716 ) ) ( not ( = ?auto_184714 ?auto_184715 ) ) ( not ( = ?auto_184714 ?auto_184716 ) ) ( not ( = ?auto_184715 ?auto_184716 ) ) ( ON ?auto_184715 ?auto_184714 ) ( CLEAR ?auto_184715 ) ( HOLDING ?auto_184716 ) ( CLEAR ?auto_184717 ) ( ON-TABLE ?auto_184718 ) ( ON ?auto_184717 ?auto_184718 ) ( not ( = ?auto_184718 ?auto_184717 ) ) ( not ( = ?auto_184718 ?auto_184716 ) ) ( not ( = ?auto_184717 ?auto_184716 ) ) ( not ( = ?auto_184710 ?auto_184717 ) ) ( not ( = ?auto_184710 ?auto_184718 ) ) ( not ( = ?auto_184711 ?auto_184717 ) ) ( not ( = ?auto_184711 ?auto_184718 ) ) ( not ( = ?auto_184712 ?auto_184717 ) ) ( not ( = ?auto_184712 ?auto_184718 ) ) ( not ( = ?auto_184713 ?auto_184717 ) ) ( not ( = ?auto_184713 ?auto_184718 ) ) ( not ( = ?auto_184714 ?auto_184717 ) ) ( not ( = ?auto_184714 ?auto_184718 ) ) ( not ( = ?auto_184715 ?auto_184717 ) ) ( not ( = ?auto_184715 ?auto_184718 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184718 ?auto_184717 ?auto_184716 )
      ( MAKE-4PILE ?auto_184710 ?auto_184711 ?auto_184712 ?auto_184713 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184719 - BLOCK
      ?auto_184720 - BLOCK
      ?auto_184721 - BLOCK
      ?auto_184722 - BLOCK
    )
    :vars
    (
      ?auto_184724 - BLOCK
      ?auto_184726 - BLOCK
      ?auto_184725 - BLOCK
      ?auto_184723 - BLOCK
      ?auto_184727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184724 ?auto_184722 ) ( ON-TABLE ?auto_184719 ) ( ON ?auto_184720 ?auto_184719 ) ( ON ?auto_184721 ?auto_184720 ) ( ON ?auto_184722 ?auto_184721 ) ( not ( = ?auto_184719 ?auto_184720 ) ) ( not ( = ?auto_184719 ?auto_184721 ) ) ( not ( = ?auto_184719 ?auto_184722 ) ) ( not ( = ?auto_184719 ?auto_184724 ) ) ( not ( = ?auto_184720 ?auto_184721 ) ) ( not ( = ?auto_184720 ?auto_184722 ) ) ( not ( = ?auto_184720 ?auto_184724 ) ) ( not ( = ?auto_184721 ?auto_184722 ) ) ( not ( = ?auto_184721 ?auto_184724 ) ) ( not ( = ?auto_184722 ?auto_184724 ) ) ( not ( = ?auto_184719 ?auto_184726 ) ) ( not ( = ?auto_184719 ?auto_184725 ) ) ( not ( = ?auto_184720 ?auto_184726 ) ) ( not ( = ?auto_184720 ?auto_184725 ) ) ( not ( = ?auto_184721 ?auto_184726 ) ) ( not ( = ?auto_184721 ?auto_184725 ) ) ( not ( = ?auto_184722 ?auto_184726 ) ) ( not ( = ?auto_184722 ?auto_184725 ) ) ( not ( = ?auto_184724 ?auto_184726 ) ) ( not ( = ?auto_184724 ?auto_184725 ) ) ( not ( = ?auto_184726 ?auto_184725 ) ) ( ON ?auto_184726 ?auto_184724 ) ( CLEAR ?auto_184723 ) ( ON-TABLE ?auto_184727 ) ( ON ?auto_184723 ?auto_184727 ) ( not ( = ?auto_184727 ?auto_184723 ) ) ( not ( = ?auto_184727 ?auto_184725 ) ) ( not ( = ?auto_184723 ?auto_184725 ) ) ( not ( = ?auto_184719 ?auto_184723 ) ) ( not ( = ?auto_184719 ?auto_184727 ) ) ( not ( = ?auto_184720 ?auto_184723 ) ) ( not ( = ?auto_184720 ?auto_184727 ) ) ( not ( = ?auto_184721 ?auto_184723 ) ) ( not ( = ?auto_184721 ?auto_184727 ) ) ( not ( = ?auto_184722 ?auto_184723 ) ) ( not ( = ?auto_184722 ?auto_184727 ) ) ( not ( = ?auto_184724 ?auto_184723 ) ) ( not ( = ?auto_184724 ?auto_184727 ) ) ( not ( = ?auto_184726 ?auto_184723 ) ) ( not ( = ?auto_184726 ?auto_184727 ) ) ( ON ?auto_184725 ?auto_184726 ) ( CLEAR ?auto_184725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184719 ?auto_184720 ?auto_184721 ?auto_184722 ?auto_184724 ?auto_184726 )
      ( MAKE-4PILE ?auto_184719 ?auto_184720 ?auto_184721 ?auto_184722 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184728 - BLOCK
      ?auto_184729 - BLOCK
      ?auto_184730 - BLOCK
      ?auto_184731 - BLOCK
    )
    :vars
    (
      ?auto_184734 - BLOCK
      ?auto_184735 - BLOCK
      ?auto_184732 - BLOCK
      ?auto_184736 - BLOCK
      ?auto_184733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184734 ?auto_184731 ) ( ON-TABLE ?auto_184728 ) ( ON ?auto_184729 ?auto_184728 ) ( ON ?auto_184730 ?auto_184729 ) ( ON ?auto_184731 ?auto_184730 ) ( not ( = ?auto_184728 ?auto_184729 ) ) ( not ( = ?auto_184728 ?auto_184730 ) ) ( not ( = ?auto_184728 ?auto_184731 ) ) ( not ( = ?auto_184728 ?auto_184734 ) ) ( not ( = ?auto_184729 ?auto_184730 ) ) ( not ( = ?auto_184729 ?auto_184731 ) ) ( not ( = ?auto_184729 ?auto_184734 ) ) ( not ( = ?auto_184730 ?auto_184731 ) ) ( not ( = ?auto_184730 ?auto_184734 ) ) ( not ( = ?auto_184731 ?auto_184734 ) ) ( not ( = ?auto_184728 ?auto_184735 ) ) ( not ( = ?auto_184728 ?auto_184732 ) ) ( not ( = ?auto_184729 ?auto_184735 ) ) ( not ( = ?auto_184729 ?auto_184732 ) ) ( not ( = ?auto_184730 ?auto_184735 ) ) ( not ( = ?auto_184730 ?auto_184732 ) ) ( not ( = ?auto_184731 ?auto_184735 ) ) ( not ( = ?auto_184731 ?auto_184732 ) ) ( not ( = ?auto_184734 ?auto_184735 ) ) ( not ( = ?auto_184734 ?auto_184732 ) ) ( not ( = ?auto_184735 ?auto_184732 ) ) ( ON ?auto_184735 ?auto_184734 ) ( ON-TABLE ?auto_184736 ) ( not ( = ?auto_184736 ?auto_184733 ) ) ( not ( = ?auto_184736 ?auto_184732 ) ) ( not ( = ?auto_184733 ?auto_184732 ) ) ( not ( = ?auto_184728 ?auto_184733 ) ) ( not ( = ?auto_184728 ?auto_184736 ) ) ( not ( = ?auto_184729 ?auto_184733 ) ) ( not ( = ?auto_184729 ?auto_184736 ) ) ( not ( = ?auto_184730 ?auto_184733 ) ) ( not ( = ?auto_184730 ?auto_184736 ) ) ( not ( = ?auto_184731 ?auto_184733 ) ) ( not ( = ?auto_184731 ?auto_184736 ) ) ( not ( = ?auto_184734 ?auto_184733 ) ) ( not ( = ?auto_184734 ?auto_184736 ) ) ( not ( = ?auto_184735 ?auto_184733 ) ) ( not ( = ?auto_184735 ?auto_184736 ) ) ( ON ?auto_184732 ?auto_184735 ) ( CLEAR ?auto_184732 ) ( HOLDING ?auto_184733 ) ( CLEAR ?auto_184736 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184736 ?auto_184733 )
      ( MAKE-4PILE ?auto_184728 ?auto_184729 ?auto_184730 ?auto_184731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186430 - BLOCK
      ?auto_186431 - BLOCK
      ?auto_186432 - BLOCK
      ?auto_186433 - BLOCK
    )
    :vars
    (
      ?auto_186435 - BLOCK
      ?auto_186436 - BLOCK
      ?auto_186437 - BLOCK
      ?auto_186434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186435 ?auto_186433 ) ( ON-TABLE ?auto_186430 ) ( ON ?auto_186431 ?auto_186430 ) ( ON ?auto_186432 ?auto_186431 ) ( ON ?auto_186433 ?auto_186432 ) ( not ( = ?auto_186430 ?auto_186431 ) ) ( not ( = ?auto_186430 ?auto_186432 ) ) ( not ( = ?auto_186430 ?auto_186433 ) ) ( not ( = ?auto_186430 ?auto_186435 ) ) ( not ( = ?auto_186431 ?auto_186432 ) ) ( not ( = ?auto_186431 ?auto_186433 ) ) ( not ( = ?auto_186431 ?auto_186435 ) ) ( not ( = ?auto_186432 ?auto_186433 ) ) ( not ( = ?auto_186432 ?auto_186435 ) ) ( not ( = ?auto_186433 ?auto_186435 ) ) ( not ( = ?auto_186430 ?auto_186436 ) ) ( not ( = ?auto_186430 ?auto_186437 ) ) ( not ( = ?auto_186431 ?auto_186436 ) ) ( not ( = ?auto_186431 ?auto_186437 ) ) ( not ( = ?auto_186432 ?auto_186436 ) ) ( not ( = ?auto_186432 ?auto_186437 ) ) ( not ( = ?auto_186433 ?auto_186436 ) ) ( not ( = ?auto_186433 ?auto_186437 ) ) ( not ( = ?auto_186435 ?auto_186436 ) ) ( not ( = ?auto_186435 ?auto_186437 ) ) ( not ( = ?auto_186436 ?auto_186437 ) ) ( ON ?auto_186436 ?auto_186435 ) ( not ( = ?auto_186434 ?auto_186437 ) ) ( not ( = ?auto_186430 ?auto_186434 ) ) ( not ( = ?auto_186431 ?auto_186434 ) ) ( not ( = ?auto_186432 ?auto_186434 ) ) ( not ( = ?auto_186433 ?auto_186434 ) ) ( not ( = ?auto_186435 ?auto_186434 ) ) ( not ( = ?auto_186436 ?auto_186434 ) ) ( ON ?auto_186437 ?auto_186436 ) ( ON ?auto_186434 ?auto_186437 ) ( CLEAR ?auto_186434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186430 ?auto_186431 ?auto_186432 ?auto_186433 ?auto_186435 ?auto_186436 ?auto_186437 )
      ( MAKE-4PILE ?auto_186430 ?auto_186431 ?auto_186432 ?auto_186433 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184746 - BLOCK
      ?auto_184747 - BLOCK
      ?auto_184748 - BLOCK
      ?auto_184749 - BLOCK
    )
    :vars
    (
      ?auto_184750 - BLOCK
      ?auto_184754 - BLOCK
      ?auto_184753 - BLOCK
      ?auto_184751 - BLOCK
      ?auto_184752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184750 ?auto_184749 ) ( ON-TABLE ?auto_184746 ) ( ON ?auto_184747 ?auto_184746 ) ( ON ?auto_184748 ?auto_184747 ) ( ON ?auto_184749 ?auto_184748 ) ( not ( = ?auto_184746 ?auto_184747 ) ) ( not ( = ?auto_184746 ?auto_184748 ) ) ( not ( = ?auto_184746 ?auto_184749 ) ) ( not ( = ?auto_184746 ?auto_184750 ) ) ( not ( = ?auto_184747 ?auto_184748 ) ) ( not ( = ?auto_184747 ?auto_184749 ) ) ( not ( = ?auto_184747 ?auto_184750 ) ) ( not ( = ?auto_184748 ?auto_184749 ) ) ( not ( = ?auto_184748 ?auto_184750 ) ) ( not ( = ?auto_184749 ?auto_184750 ) ) ( not ( = ?auto_184746 ?auto_184754 ) ) ( not ( = ?auto_184746 ?auto_184753 ) ) ( not ( = ?auto_184747 ?auto_184754 ) ) ( not ( = ?auto_184747 ?auto_184753 ) ) ( not ( = ?auto_184748 ?auto_184754 ) ) ( not ( = ?auto_184748 ?auto_184753 ) ) ( not ( = ?auto_184749 ?auto_184754 ) ) ( not ( = ?auto_184749 ?auto_184753 ) ) ( not ( = ?auto_184750 ?auto_184754 ) ) ( not ( = ?auto_184750 ?auto_184753 ) ) ( not ( = ?auto_184754 ?auto_184753 ) ) ( ON ?auto_184754 ?auto_184750 ) ( not ( = ?auto_184751 ?auto_184752 ) ) ( not ( = ?auto_184751 ?auto_184753 ) ) ( not ( = ?auto_184752 ?auto_184753 ) ) ( not ( = ?auto_184746 ?auto_184752 ) ) ( not ( = ?auto_184746 ?auto_184751 ) ) ( not ( = ?auto_184747 ?auto_184752 ) ) ( not ( = ?auto_184747 ?auto_184751 ) ) ( not ( = ?auto_184748 ?auto_184752 ) ) ( not ( = ?auto_184748 ?auto_184751 ) ) ( not ( = ?auto_184749 ?auto_184752 ) ) ( not ( = ?auto_184749 ?auto_184751 ) ) ( not ( = ?auto_184750 ?auto_184752 ) ) ( not ( = ?auto_184750 ?auto_184751 ) ) ( not ( = ?auto_184754 ?auto_184752 ) ) ( not ( = ?auto_184754 ?auto_184751 ) ) ( ON ?auto_184753 ?auto_184754 ) ( ON ?auto_184752 ?auto_184753 ) ( CLEAR ?auto_184752 ) ( HOLDING ?auto_184751 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184751 )
      ( MAKE-4PILE ?auto_184746 ?auto_184747 ?auto_184748 ?auto_184749 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_184755 - BLOCK
      ?auto_184756 - BLOCK
      ?auto_184757 - BLOCK
      ?auto_184758 - BLOCK
    )
    :vars
    (
      ?auto_184761 - BLOCK
      ?auto_184763 - BLOCK
      ?auto_184762 - BLOCK
      ?auto_184760 - BLOCK
      ?auto_184759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184761 ?auto_184758 ) ( ON-TABLE ?auto_184755 ) ( ON ?auto_184756 ?auto_184755 ) ( ON ?auto_184757 ?auto_184756 ) ( ON ?auto_184758 ?auto_184757 ) ( not ( = ?auto_184755 ?auto_184756 ) ) ( not ( = ?auto_184755 ?auto_184757 ) ) ( not ( = ?auto_184755 ?auto_184758 ) ) ( not ( = ?auto_184755 ?auto_184761 ) ) ( not ( = ?auto_184756 ?auto_184757 ) ) ( not ( = ?auto_184756 ?auto_184758 ) ) ( not ( = ?auto_184756 ?auto_184761 ) ) ( not ( = ?auto_184757 ?auto_184758 ) ) ( not ( = ?auto_184757 ?auto_184761 ) ) ( not ( = ?auto_184758 ?auto_184761 ) ) ( not ( = ?auto_184755 ?auto_184763 ) ) ( not ( = ?auto_184755 ?auto_184762 ) ) ( not ( = ?auto_184756 ?auto_184763 ) ) ( not ( = ?auto_184756 ?auto_184762 ) ) ( not ( = ?auto_184757 ?auto_184763 ) ) ( not ( = ?auto_184757 ?auto_184762 ) ) ( not ( = ?auto_184758 ?auto_184763 ) ) ( not ( = ?auto_184758 ?auto_184762 ) ) ( not ( = ?auto_184761 ?auto_184763 ) ) ( not ( = ?auto_184761 ?auto_184762 ) ) ( not ( = ?auto_184763 ?auto_184762 ) ) ( ON ?auto_184763 ?auto_184761 ) ( not ( = ?auto_184760 ?auto_184759 ) ) ( not ( = ?auto_184760 ?auto_184762 ) ) ( not ( = ?auto_184759 ?auto_184762 ) ) ( not ( = ?auto_184755 ?auto_184759 ) ) ( not ( = ?auto_184755 ?auto_184760 ) ) ( not ( = ?auto_184756 ?auto_184759 ) ) ( not ( = ?auto_184756 ?auto_184760 ) ) ( not ( = ?auto_184757 ?auto_184759 ) ) ( not ( = ?auto_184757 ?auto_184760 ) ) ( not ( = ?auto_184758 ?auto_184759 ) ) ( not ( = ?auto_184758 ?auto_184760 ) ) ( not ( = ?auto_184761 ?auto_184759 ) ) ( not ( = ?auto_184761 ?auto_184760 ) ) ( not ( = ?auto_184763 ?auto_184759 ) ) ( not ( = ?auto_184763 ?auto_184760 ) ) ( ON ?auto_184762 ?auto_184763 ) ( ON ?auto_184759 ?auto_184762 ) ( ON ?auto_184760 ?auto_184759 ) ( CLEAR ?auto_184760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184755 ?auto_184756 ?auto_184757 ?auto_184758 ?auto_184761 ?auto_184763 ?auto_184762 ?auto_184759 )
      ( MAKE-4PILE ?auto_184755 ?auto_184756 ?auto_184757 ?auto_184758 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184769 - BLOCK
      ?auto_184770 - BLOCK
      ?auto_184771 - BLOCK
      ?auto_184772 - BLOCK
      ?auto_184773 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_184773 ) ( CLEAR ?auto_184772 ) ( ON-TABLE ?auto_184769 ) ( ON ?auto_184770 ?auto_184769 ) ( ON ?auto_184771 ?auto_184770 ) ( ON ?auto_184772 ?auto_184771 ) ( not ( = ?auto_184769 ?auto_184770 ) ) ( not ( = ?auto_184769 ?auto_184771 ) ) ( not ( = ?auto_184769 ?auto_184772 ) ) ( not ( = ?auto_184769 ?auto_184773 ) ) ( not ( = ?auto_184770 ?auto_184771 ) ) ( not ( = ?auto_184770 ?auto_184772 ) ) ( not ( = ?auto_184770 ?auto_184773 ) ) ( not ( = ?auto_184771 ?auto_184772 ) ) ( not ( = ?auto_184771 ?auto_184773 ) ) ( not ( = ?auto_184772 ?auto_184773 ) ) )
    :subtasks
    ( ( !STACK ?auto_184773 ?auto_184772 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184774 - BLOCK
      ?auto_184775 - BLOCK
      ?auto_184776 - BLOCK
      ?auto_184777 - BLOCK
      ?auto_184778 - BLOCK
    )
    :vars
    (
      ?auto_184779 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184777 ) ( ON-TABLE ?auto_184774 ) ( ON ?auto_184775 ?auto_184774 ) ( ON ?auto_184776 ?auto_184775 ) ( ON ?auto_184777 ?auto_184776 ) ( not ( = ?auto_184774 ?auto_184775 ) ) ( not ( = ?auto_184774 ?auto_184776 ) ) ( not ( = ?auto_184774 ?auto_184777 ) ) ( not ( = ?auto_184774 ?auto_184778 ) ) ( not ( = ?auto_184775 ?auto_184776 ) ) ( not ( = ?auto_184775 ?auto_184777 ) ) ( not ( = ?auto_184775 ?auto_184778 ) ) ( not ( = ?auto_184776 ?auto_184777 ) ) ( not ( = ?auto_184776 ?auto_184778 ) ) ( not ( = ?auto_184777 ?auto_184778 ) ) ( ON ?auto_184778 ?auto_184779 ) ( CLEAR ?auto_184778 ) ( HAND-EMPTY ) ( not ( = ?auto_184774 ?auto_184779 ) ) ( not ( = ?auto_184775 ?auto_184779 ) ) ( not ( = ?auto_184776 ?auto_184779 ) ) ( not ( = ?auto_184777 ?auto_184779 ) ) ( not ( = ?auto_184778 ?auto_184779 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184778 ?auto_184779 )
      ( MAKE-5PILE ?auto_184774 ?auto_184775 ?auto_184776 ?auto_184777 ?auto_184778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184780 - BLOCK
      ?auto_184781 - BLOCK
      ?auto_184782 - BLOCK
      ?auto_184783 - BLOCK
      ?auto_184784 - BLOCK
    )
    :vars
    (
      ?auto_184785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184780 ) ( ON ?auto_184781 ?auto_184780 ) ( ON ?auto_184782 ?auto_184781 ) ( not ( = ?auto_184780 ?auto_184781 ) ) ( not ( = ?auto_184780 ?auto_184782 ) ) ( not ( = ?auto_184780 ?auto_184783 ) ) ( not ( = ?auto_184780 ?auto_184784 ) ) ( not ( = ?auto_184781 ?auto_184782 ) ) ( not ( = ?auto_184781 ?auto_184783 ) ) ( not ( = ?auto_184781 ?auto_184784 ) ) ( not ( = ?auto_184782 ?auto_184783 ) ) ( not ( = ?auto_184782 ?auto_184784 ) ) ( not ( = ?auto_184783 ?auto_184784 ) ) ( ON ?auto_184784 ?auto_184785 ) ( CLEAR ?auto_184784 ) ( not ( = ?auto_184780 ?auto_184785 ) ) ( not ( = ?auto_184781 ?auto_184785 ) ) ( not ( = ?auto_184782 ?auto_184785 ) ) ( not ( = ?auto_184783 ?auto_184785 ) ) ( not ( = ?auto_184784 ?auto_184785 ) ) ( HOLDING ?auto_184783 ) ( CLEAR ?auto_184782 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184780 ?auto_184781 ?auto_184782 ?auto_184783 )
      ( MAKE-5PILE ?auto_184780 ?auto_184781 ?auto_184782 ?auto_184783 ?auto_184784 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184786 - BLOCK
      ?auto_184787 - BLOCK
      ?auto_184788 - BLOCK
      ?auto_184789 - BLOCK
      ?auto_184790 - BLOCK
    )
    :vars
    (
      ?auto_184791 - BLOCK
      ?auto_184794 - BLOCK
      ?auto_184793 - BLOCK
      ?auto_184792 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184786 ) ( ON ?auto_184787 ?auto_184786 ) ( ON ?auto_184788 ?auto_184787 ) ( not ( = ?auto_184786 ?auto_184787 ) ) ( not ( = ?auto_184786 ?auto_184788 ) ) ( not ( = ?auto_184786 ?auto_184789 ) ) ( not ( = ?auto_184786 ?auto_184790 ) ) ( not ( = ?auto_184787 ?auto_184788 ) ) ( not ( = ?auto_184787 ?auto_184789 ) ) ( not ( = ?auto_184787 ?auto_184790 ) ) ( not ( = ?auto_184788 ?auto_184789 ) ) ( not ( = ?auto_184788 ?auto_184790 ) ) ( not ( = ?auto_184789 ?auto_184790 ) ) ( ON ?auto_184790 ?auto_184791 ) ( not ( = ?auto_184786 ?auto_184791 ) ) ( not ( = ?auto_184787 ?auto_184791 ) ) ( not ( = ?auto_184788 ?auto_184791 ) ) ( not ( = ?auto_184789 ?auto_184791 ) ) ( not ( = ?auto_184790 ?auto_184791 ) ) ( CLEAR ?auto_184788 ) ( ON ?auto_184789 ?auto_184790 ) ( CLEAR ?auto_184789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184794 ) ( ON ?auto_184793 ?auto_184794 ) ( ON ?auto_184792 ?auto_184793 ) ( ON ?auto_184791 ?auto_184792 ) ( not ( = ?auto_184794 ?auto_184793 ) ) ( not ( = ?auto_184794 ?auto_184792 ) ) ( not ( = ?auto_184794 ?auto_184791 ) ) ( not ( = ?auto_184794 ?auto_184790 ) ) ( not ( = ?auto_184794 ?auto_184789 ) ) ( not ( = ?auto_184793 ?auto_184792 ) ) ( not ( = ?auto_184793 ?auto_184791 ) ) ( not ( = ?auto_184793 ?auto_184790 ) ) ( not ( = ?auto_184793 ?auto_184789 ) ) ( not ( = ?auto_184792 ?auto_184791 ) ) ( not ( = ?auto_184792 ?auto_184790 ) ) ( not ( = ?auto_184792 ?auto_184789 ) ) ( not ( = ?auto_184786 ?auto_184794 ) ) ( not ( = ?auto_184786 ?auto_184793 ) ) ( not ( = ?auto_184786 ?auto_184792 ) ) ( not ( = ?auto_184787 ?auto_184794 ) ) ( not ( = ?auto_184787 ?auto_184793 ) ) ( not ( = ?auto_184787 ?auto_184792 ) ) ( not ( = ?auto_184788 ?auto_184794 ) ) ( not ( = ?auto_184788 ?auto_184793 ) ) ( not ( = ?auto_184788 ?auto_184792 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184794 ?auto_184793 ?auto_184792 ?auto_184791 ?auto_184790 )
      ( MAKE-5PILE ?auto_184786 ?auto_184787 ?auto_184788 ?auto_184789 ?auto_184790 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184795 - BLOCK
      ?auto_184796 - BLOCK
      ?auto_184797 - BLOCK
      ?auto_184798 - BLOCK
      ?auto_184799 - BLOCK
    )
    :vars
    (
      ?auto_184803 - BLOCK
      ?auto_184802 - BLOCK
      ?auto_184801 - BLOCK
      ?auto_184800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184795 ) ( ON ?auto_184796 ?auto_184795 ) ( not ( = ?auto_184795 ?auto_184796 ) ) ( not ( = ?auto_184795 ?auto_184797 ) ) ( not ( = ?auto_184795 ?auto_184798 ) ) ( not ( = ?auto_184795 ?auto_184799 ) ) ( not ( = ?auto_184796 ?auto_184797 ) ) ( not ( = ?auto_184796 ?auto_184798 ) ) ( not ( = ?auto_184796 ?auto_184799 ) ) ( not ( = ?auto_184797 ?auto_184798 ) ) ( not ( = ?auto_184797 ?auto_184799 ) ) ( not ( = ?auto_184798 ?auto_184799 ) ) ( ON ?auto_184799 ?auto_184803 ) ( not ( = ?auto_184795 ?auto_184803 ) ) ( not ( = ?auto_184796 ?auto_184803 ) ) ( not ( = ?auto_184797 ?auto_184803 ) ) ( not ( = ?auto_184798 ?auto_184803 ) ) ( not ( = ?auto_184799 ?auto_184803 ) ) ( ON ?auto_184798 ?auto_184799 ) ( CLEAR ?auto_184798 ) ( ON-TABLE ?auto_184802 ) ( ON ?auto_184801 ?auto_184802 ) ( ON ?auto_184800 ?auto_184801 ) ( ON ?auto_184803 ?auto_184800 ) ( not ( = ?auto_184802 ?auto_184801 ) ) ( not ( = ?auto_184802 ?auto_184800 ) ) ( not ( = ?auto_184802 ?auto_184803 ) ) ( not ( = ?auto_184802 ?auto_184799 ) ) ( not ( = ?auto_184802 ?auto_184798 ) ) ( not ( = ?auto_184801 ?auto_184800 ) ) ( not ( = ?auto_184801 ?auto_184803 ) ) ( not ( = ?auto_184801 ?auto_184799 ) ) ( not ( = ?auto_184801 ?auto_184798 ) ) ( not ( = ?auto_184800 ?auto_184803 ) ) ( not ( = ?auto_184800 ?auto_184799 ) ) ( not ( = ?auto_184800 ?auto_184798 ) ) ( not ( = ?auto_184795 ?auto_184802 ) ) ( not ( = ?auto_184795 ?auto_184801 ) ) ( not ( = ?auto_184795 ?auto_184800 ) ) ( not ( = ?auto_184796 ?auto_184802 ) ) ( not ( = ?auto_184796 ?auto_184801 ) ) ( not ( = ?auto_184796 ?auto_184800 ) ) ( not ( = ?auto_184797 ?auto_184802 ) ) ( not ( = ?auto_184797 ?auto_184801 ) ) ( not ( = ?auto_184797 ?auto_184800 ) ) ( HOLDING ?auto_184797 ) ( CLEAR ?auto_184796 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184795 ?auto_184796 ?auto_184797 )
      ( MAKE-5PILE ?auto_184795 ?auto_184796 ?auto_184797 ?auto_184798 ?auto_184799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184804 - BLOCK
      ?auto_184805 - BLOCK
      ?auto_184806 - BLOCK
      ?auto_184807 - BLOCK
      ?auto_184808 - BLOCK
    )
    :vars
    (
      ?auto_184812 - BLOCK
      ?auto_184809 - BLOCK
      ?auto_184811 - BLOCK
      ?auto_184810 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184804 ) ( ON ?auto_184805 ?auto_184804 ) ( not ( = ?auto_184804 ?auto_184805 ) ) ( not ( = ?auto_184804 ?auto_184806 ) ) ( not ( = ?auto_184804 ?auto_184807 ) ) ( not ( = ?auto_184804 ?auto_184808 ) ) ( not ( = ?auto_184805 ?auto_184806 ) ) ( not ( = ?auto_184805 ?auto_184807 ) ) ( not ( = ?auto_184805 ?auto_184808 ) ) ( not ( = ?auto_184806 ?auto_184807 ) ) ( not ( = ?auto_184806 ?auto_184808 ) ) ( not ( = ?auto_184807 ?auto_184808 ) ) ( ON ?auto_184808 ?auto_184812 ) ( not ( = ?auto_184804 ?auto_184812 ) ) ( not ( = ?auto_184805 ?auto_184812 ) ) ( not ( = ?auto_184806 ?auto_184812 ) ) ( not ( = ?auto_184807 ?auto_184812 ) ) ( not ( = ?auto_184808 ?auto_184812 ) ) ( ON ?auto_184807 ?auto_184808 ) ( ON-TABLE ?auto_184809 ) ( ON ?auto_184811 ?auto_184809 ) ( ON ?auto_184810 ?auto_184811 ) ( ON ?auto_184812 ?auto_184810 ) ( not ( = ?auto_184809 ?auto_184811 ) ) ( not ( = ?auto_184809 ?auto_184810 ) ) ( not ( = ?auto_184809 ?auto_184812 ) ) ( not ( = ?auto_184809 ?auto_184808 ) ) ( not ( = ?auto_184809 ?auto_184807 ) ) ( not ( = ?auto_184811 ?auto_184810 ) ) ( not ( = ?auto_184811 ?auto_184812 ) ) ( not ( = ?auto_184811 ?auto_184808 ) ) ( not ( = ?auto_184811 ?auto_184807 ) ) ( not ( = ?auto_184810 ?auto_184812 ) ) ( not ( = ?auto_184810 ?auto_184808 ) ) ( not ( = ?auto_184810 ?auto_184807 ) ) ( not ( = ?auto_184804 ?auto_184809 ) ) ( not ( = ?auto_184804 ?auto_184811 ) ) ( not ( = ?auto_184804 ?auto_184810 ) ) ( not ( = ?auto_184805 ?auto_184809 ) ) ( not ( = ?auto_184805 ?auto_184811 ) ) ( not ( = ?auto_184805 ?auto_184810 ) ) ( not ( = ?auto_184806 ?auto_184809 ) ) ( not ( = ?auto_184806 ?auto_184811 ) ) ( not ( = ?auto_184806 ?auto_184810 ) ) ( CLEAR ?auto_184805 ) ( ON ?auto_184806 ?auto_184807 ) ( CLEAR ?auto_184806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184809 ?auto_184811 ?auto_184810 ?auto_184812 ?auto_184808 ?auto_184807 )
      ( MAKE-5PILE ?auto_184804 ?auto_184805 ?auto_184806 ?auto_184807 ?auto_184808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184813 - BLOCK
      ?auto_184814 - BLOCK
      ?auto_184815 - BLOCK
      ?auto_184816 - BLOCK
      ?auto_184817 - BLOCK
    )
    :vars
    (
      ?auto_184820 - BLOCK
      ?auto_184821 - BLOCK
      ?auto_184819 - BLOCK
      ?auto_184818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184813 ) ( not ( = ?auto_184813 ?auto_184814 ) ) ( not ( = ?auto_184813 ?auto_184815 ) ) ( not ( = ?auto_184813 ?auto_184816 ) ) ( not ( = ?auto_184813 ?auto_184817 ) ) ( not ( = ?auto_184814 ?auto_184815 ) ) ( not ( = ?auto_184814 ?auto_184816 ) ) ( not ( = ?auto_184814 ?auto_184817 ) ) ( not ( = ?auto_184815 ?auto_184816 ) ) ( not ( = ?auto_184815 ?auto_184817 ) ) ( not ( = ?auto_184816 ?auto_184817 ) ) ( ON ?auto_184817 ?auto_184820 ) ( not ( = ?auto_184813 ?auto_184820 ) ) ( not ( = ?auto_184814 ?auto_184820 ) ) ( not ( = ?auto_184815 ?auto_184820 ) ) ( not ( = ?auto_184816 ?auto_184820 ) ) ( not ( = ?auto_184817 ?auto_184820 ) ) ( ON ?auto_184816 ?auto_184817 ) ( ON-TABLE ?auto_184821 ) ( ON ?auto_184819 ?auto_184821 ) ( ON ?auto_184818 ?auto_184819 ) ( ON ?auto_184820 ?auto_184818 ) ( not ( = ?auto_184821 ?auto_184819 ) ) ( not ( = ?auto_184821 ?auto_184818 ) ) ( not ( = ?auto_184821 ?auto_184820 ) ) ( not ( = ?auto_184821 ?auto_184817 ) ) ( not ( = ?auto_184821 ?auto_184816 ) ) ( not ( = ?auto_184819 ?auto_184818 ) ) ( not ( = ?auto_184819 ?auto_184820 ) ) ( not ( = ?auto_184819 ?auto_184817 ) ) ( not ( = ?auto_184819 ?auto_184816 ) ) ( not ( = ?auto_184818 ?auto_184820 ) ) ( not ( = ?auto_184818 ?auto_184817 ) ) ( not ( = ?auto_184818 ?auto_184816 ) ) ( not ( = ?auto_184813 ?auto_184821 ) ) ( not ( = ?auto_184813 ?auto_184819 ) ) ( not ( = ?auto_184813 ?auto_184818 ) ) ( not ( = ?auto_184814 ?auto_184821 ) ) ( not ( = ?auto_184814 ?auto_184819 ) ) ( not ( = ?auto_184814 ?auto_184818 ) ) ( not ( = ?auto_184815 ?auto_184821 ) ) ( not ( = ?auto_184815 ?auto_184819 ) ) ( not ( = ?auto_184815 ?auto_184818 ) ) ( ON ?auto_184815 ?auto_184816 ) ( CLEAR ?auto_184815 ) ( HOLDING ?auto_184814 ) ( CLEAR ?auto_184813 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184813 ?auto_184814 )
      ( MAKE-5PILE ?auto_184813 ?auto_184814 ?auto_184815 ?auto_184816 ?auto_184817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184822 - BLOCK
      ?auto_184823 - BLOCK
      ?auto_184824 - BLOCK
      ?auto_184825 - BLOCK
      ?auto_184826 - BLOCK
    )
    :vars
    (
      ?auto_184827 - BLOCK
      ?auto_184828 - BLOCK
      ?auto_184830 - BLOCK
      ?auto_184829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184822 ) ( not ( = ?auto_184822 ?auto_184823 ) ) ( not ( = ?auto_184822 ?auto_184824 ) ) ( not ( = ?auto_184822 ?auto_184825 ) ) ( not ( = ?auto_184822 ?auto_184826 ) ) ( not ( = ?auto_184823 ?auto_184824 ) ) ( not ( = ?auto_184823 ?auto_184825 ) ) ( not ( = ?auto_184823 ?auto_184826 ) ) ( not ( = ?auto_184824 ?auto_184825 ) ) ( not ( = ?auto_184824 ?auto_184826 ) ) ( not ( = ?auto_184825 ?auto_184826 ) ) ( ON ?auto_184826 ?auto_184827 ) ( not ( = ?auto_184822 ?auto_184827 ) ) ( not ( = ?auto_184823 ?auto_184827 ) ) ( not ( = ?auto_184824 ?auto_184827 ) ) ( not ( = ?auto_184825 ?auto_184827 ) ) ( not ( = ?auto_184826 ?auto_184827 ) ) ( ON ?auto_184825 ?auto_184826 ) ( ON-TABLE ?auto_184828 ) ( ON ?auto_184830 ?auto_184828 ) ( ON ?auto_184829 ?auto_184830 ) ( ON ?auto_184827 ?auto_184829 ) ( not ( = ?auto_184828 ?auto_184830 ) ) ( not ( = ?auto_184828 ?auto_184829 ) ) ( not ( = ?auto_184828 ?auto_184827 ) ) ( not ( = ?auto_184828 ?auto_184826 ) ) ( not ( = ?auto_184828 ?auto_184825 ) ) ( not ( = ?auto_184830 ?auto_184829 ) ) ( not ( = ?auto_184830 ?auto_184827 ) ) ( not ( = ?auto_184830 ?auto_184826 ) ) ( not ( = ?auto_184830 ?auto_184825 ) ) ( not ( = ?auto_184829 ?auto_184827 ) ) ( not ( = ?auto_184829 ?auto_184826 ) ) ( not ( = ?auto_184829 ?auto_184825 ) ) ( not ( = ?auto_184822 ?auto_184828 ) ) ( not ( = ?auto_184822 ?auto_184830 ) ) ( not ( = ?auto_184822 ?auto_184829 ) ) ( not ( = ?auto_184823 ?auto_184828 ) ) ( not ( = ?auto_184823 ?auto_184830 ) ) ( not ( = ?auto_184823 ?auto_184829 ) ) ( not ( = ?auto_184824 ?auto_184828 ) ) ( not ( = ?auto_184824 ?auto_184830 ) ) ( not ( = ?auto_184824 ?auto_184829 ) ) ( ON ?auto_184824 ?auto_184825 ) ( CLEAR ?auto_184822 ) ( ON ?auto_184823 ?auto_184824 ) ( CLEAR ?auto_184823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_184828 ?auto_184830 ?auto_184829 ?auto_184827 ?auto_184826 ?auto_184825 ?auto_184824 )
      ( MAKE-5PILE ?auto_184822 ?auto_184823 ?auto_184824 ?auto_184825 ?auto_184826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184831 - BLOCK
      ?auto_184832 - BLOCK
      ?auto_184833 - BLOCK
      ?auto_184834 - BLOCK
      ?auto_184835 - BLOCK
    )
    :vars
    (
      ?auto_184839 - BLOCK
      ?auto_184838 - BLOCK
      ?auto_184836 - BLOCK
      ?auto_184837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184831 ?auto_184832 ) ) ( not ( = ?auto_184831 ?auto_184833 ) ) ( not ( = ?auto_184831 ?auto_184834 ) ) ( not ( = ?auto_184831 ?auto_184835 ) ) ( not ( = ?auto_184832 ?auto_184833 ) ) ( not ( = ?auto_184832 ?auto_184834 ) ) ( not ( = ?auto_184832 ?auto_184835 ) ) ( not ( = ?auto_184833 ?auto_184834 ) ) ( not ( = ?auto_184833 ?auto_184835 ) ) ( not ( = ?auto_184834 ?auto_184835 ) ) ( ON ?auto_184835 ?auto_184839 ) ( not ( = ?auto_184831 ?auto_184839 ) ) ( not ( = ?auto_184832 ?auto_184839 ) ) ( not ( = ?auto_184833 ?auto_184839 ) ) ( not ( = ?auto_184834 ?auto_184839 ) ) ( not ( = ?auto_184835 ?auto_184839 ) ) ( ON ?auto_184834 ?auto_184835 ) ( ON-TABLE ?auto_184838 ) ( ON ?auto_184836 ?auto_184838 ) ( ON ?auto_184837 ?auto_184836 ) ( ON ?auto_184839 ?auto_184837 ) ( not ( = ?auto_184838 ?auto_184836 ) ) ( not ( = ?auto_184838 ?auto_184837 ) ) ( not ( = ?auto_184838 ?auto_184839 ) ) ( not ( = ?auto_184838 ?auto_184835 ) ) ( not ( = ?auto_184838 ?auto_184834 ) ) ( not ( = ?auto_184836 ?auto_184837 ) ) ( not ( = ?auto_184836 ?auto_184839 ) ) ( not ( = ?auto_184836 ?auto_184835 ) ) ( not ( = ?auto_184836 ?auto_184834 ) ) ( not ( = ?auto_184837 ?auto_184839 ) ) ( not ( = ?auto_184837 ?auto_184835 ) ) ( not ( = ?auto_184837 ?auto_184834 ) ) ( not ( = ?auto_184831 ?auto_184838 ) ) ( not ( = ?auto_184831 ?auto_184836 ) ) ( not ( = ?auto_184831 ?auto_184837 ) ) ( not ( = ?auto_184832 ?auto_184838 ) ) ( not ( = ?auto_184832 ?auto_184836 ) ) ( not ( = ?auto_184832 ?auto_184837 ) ) ( not ( = ?auto_184833 ?auto_184838 ) ) ( not ( = ?auto_184833 ?auto_184836 ) ) ( not ( = ?auto_184833 ?auto_184837 ) ) ( ON ?auto_184833 ?auto_184834 ) ( ON ?auto_184832 ?auto_184833 ) ( CLEAR ?auto_184832 ) ( HOLDING ?auto_184831 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184831 )
      ( MAKE-5PILE ?auto_184831 ?auto_184832 ?auto_184833 ?auto_184834 ?auto_184835 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_184840 - BLOCK
      ?auto_184841 - BLOCK
      ?auto_184842 - BLOCK
      ?auto_184843 - BLOCK
      ?auto_184844 - BLOCK
    )
    :vars
    (
      ?auto_184847 - BLOCK
      ?auto_184845 - BLOCK
      ?auto_184848 - BLOCK
      ?auto_184846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_184840 ?auto_184841 ) ) ( not ( = ?auto_184840 ?auto_184842 ) ) ( not ( = ?auto_184840 ?auto_184843 ) ) ( not ( = ?auto_184840 ?auto_184844 ) ) ( not ( = ?auto_184841 ?auto_184842 ) ) ( not ( = ?auto_184841 ?auto_184843 ) ) ( not ( = ?auto_184841 ?auto_184844 ) ) ( not ( = ?auto_184842 ?auto_184843 ) ) ( not ( = ?auto_184842 ?auto_184844 ) ) ( not ( = ?auto_184843 ?auto_184844 ) ) ( ON ?auto_184844 ?auto_184847 ) ( not ( = ?auto_184840 ?auto_184847 ) ) ( not ( = ?auto_184841 ?auto_184847 ) ) ( not ( = ?auto_184842 ?auto_184847 ) ) ( not ( = ?auto_184843 ?auto_184847 ) ) ( not ( = ?auto_184844 ?auto_184847 ) ) ( ON ?auto_184843 ?auto_184844 ) ( ON-TABLE ?auto_184845 ) ( ON ?auto_184848 ?auto_184845 ) ( ON ?auto_184846 ?auto_184848 ) ( ON ?auto_184847 ?auto_184846 ) ( not ( = ?auto_184845 ?auto_184848 ) ) ( not ( = ?auto_184845 ?auto_184846 ) ) ( not ( = ?auto_184845 ?auto_184847 ) ) ( not ( = ?auto_184845 ?auto_184844 ) ) ( not ( = ?auto_184845 ?auto_184843 ) ) ( not ( = ?auto_184848 ?auto_184846 ) ) ( not ( = ?auto_184848 ?auto_184847 ) ) ( not ( = ?auto_184848 ?auto_184844 ) ) ( not ( = ?auto_184848 ?auto_184843 ) ) ( not ( = ?auto_184846 ?auto_184847 ) ) ( not ( = ?auto_184846 ?auto_184844 ) ) ( not ( = ?auto_184846 ?auto_184843 ) ) ( not ( = ?auto_184840 ?auto_184845 ) ) ( not ( = ?auto_184840 ?auto_184848 ) ) ( not ( = ?auto_184840 ?auto_184846 ) ) ( not ( = ?auto_184841 ?auto_184845 ) ) ( not ( = ?auto_184841 ?auto_184848 ) ) ( not ( = ?auto_184841 ?auto_184846 ) ) ( not ( = ?auto_184842 ?auto_184845 ) ) ( not ( = ?auto_184842 ?auto_184848 ) ) ( not ( = ?auto_184842 ?auto_184846 ) ) ( ON ?auto_184842 ?auto_184843 ) ( ON ?auto_184841 ?auto_184842 ) ( ON ?auto_184840 ?auto_184841 ) ( CLEAR ?auto_184840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184845 ?auto_184848 ?auto_184846 ?auto_184847 ?auto_184844 ?auto_184843 ?auto_184842 ?auto_184841 )
      ( MAKE-5PILE ?auto_184840 ?auto_184841 ?auto_184842 ?auto_184843 ?auto_184844 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184852 - BLOCK
      ?auto_184853 - BLOCK
      ?auto_184854 - BLOCK
    )
    :vars
    (
      ?auto_184855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184855 ?auto_184854 ) ( CLEAR ?auto_184855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184852 ) ( ON ?auto_184853 ?auto_184852 ) ( ON ?auto_184854 ?auto_184853 ) ( not ( = ?auto_184852 ?auto_184853 ) ) ( not ( = ?auto_184852 ?auto_184854 ) ) ( not ( = ?auto_184852 ?auto_184855 ) ) ( not ( = ?auto_184853 ?auto_184854 ) ) ( not ( = ?auto_184853 ?auto_184855 ) ) ( not ( = ?auto_184854 ?auto_184855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184855 ?auto_184854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184856 - BLOCK
      ?auto_184857 - BLOCK
      ?auto_184858 - BLOCK
    )
    :vars
    (
      ?auto_184859 - BLOCK
      ?auto_184860 - BLOCK
      ?auto_184861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184859 ?auto_184858 ) ( CLEAR ?auto_184859 ) ( ON-TABLE ?auto_184856 ) ( ON ?auto_184857 ?auto_184856 ) ( ON ?auto_184858 ?auto_184857 ) ( not ( = ?auto_184856 ?auto_184857 ) ) ( not ( = ?auto_184856 ?auto_184858 ) ) ( not ( = ?auto_184856 ?auto_184859 ) ) ( not ( = ?auto_184857 ?auto_184858 ) ) ( not ( = ?auto_184857 ?auto_184859 ) ) ( not ( = ?auto_184858 ?auto_184859 ) ) ( HOLDING ?auto_184860 ) ( CLEAR ?auto_184861 ) ( not ( = ?auto_184856 ?auto_184860 ) ) ( not ( = ?auto_184856 ?auto_184861 ) ) ( not ( = ?auto_184857 ?auto_184860 ) ) ( not ( = ?auto_184857 ?auto_184861 ) ) ( not ( = ?auto_184858 ?auto_184860 ) ) ( not ( = ?auto_184858 ?auto_184861 ) ) ( not ( = ?auto_184859 ?auto_184860 ) ) ( not ( = ?auto_184859 ?auto_184861 ) ) ( not ( = ?auto_184860 ?auto_184861 ) ) )
    :subtasks
    ( ( !STACK ?auto_184860 ?auto_184861 )
      ( MAKE-3PILE ?auto_184856 ?auto_184857 ?auto_184858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184862 - BLOCK
      ?auto_184863 - BLOCK
      ?auto_184864 - BLOCK
    )
    :vars
    (
      ?auto_184865 - BLOCK
      ?auto_184867 - BLOCK
      ?auto_184866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184865 ?auto_184864 ) ( ON-TABLE ?auto_184862 ) ( ON ?auto_184863 ?auto_184862 ) ( ON ?auto_184864 ?auto_184863 ) ( not ( = ?auto_184862 ?auto_184863 ) ) ( not ( = ?auto_184862 ?auto_184864 ) ) ( not ( = ?auto_184862 ?auto_184865 ) ) ( not ( = ?auto_184863 ?auto_184864 ) ) ( not ( = ?auto_184863 ?auto_184865 ) ) ( not ( = ?auto_184864 ?auto_184865 ) ) ( CLEAR ?auto_184867 ) ( not ( = ?auto_184862 ?auto_184866 ) ) ( not ( = ?auto_184862 ?auto_184867 ) ) ( not ( = ?auto_184863 ?auto_184866 ) ) ( not ( = ?auto_184863 ?auto_184867 ) ) ( not ( = ?auto_184864 ?auto_184866 ) ) ( not ( = ?auto_184864 ?auto_184867 ) ) ( not ( = ?auto_184865 ?auto_184866 ) ) ( not ( = ?auto_184865 ?auto_184867 ) ) ( not ( = ?auto_184866 ?auto_184867 ) ) ( ON ?auto_184866 ?auto_184865 ) ( CLEAR ?auto_184866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184862 ?auto_184863 ?auto_184864 ?auto_184865 )
      ( MAKE-3PILE ?auto_184862 ?auto_184863 ?auto_184864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184868 - BLOCK
      ?auto_184869 - BLOCK
      ?auto_184870 - BLOCK
    )
    :vars
    (
      ?auto_184873 - BLOCK
      ?auto_184871 - BLOCK
      ?auto_184872 - BLOCK
      ?auto_184876 - BLOCK
      ?auto_184875 - BLOCK
      ?auto_184874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184873 ?auto_184870 ) ( ON-TABLE ?auto_184868 ) ( ON ?auto_184869 ?auto_184868 ) ( ON ?auto_184870 ?auto_184869 ) ( not ( = ?auto_184868 ?auto_184869 ) ) ( not ( = ?auto_184868 ?auto_184870 ) ) ( not ( = ?auto_184868 ?auto_184873 ) ) ( not ( = ?auto_184869 ?auto_184870 ) ) ( not ( = ?auto_184869 ?auto_184873 ) ) ( not ( = ?auto_184870 ?auto_184873 ) ) ( not ( = ?auto_184868 ?auto_184871 ) ) ( not ( = ?auto_184868 ?auto_184872 ) ) ( not ( = ?auto_184869 ?auto_184871 ) ) ( not ( = ?auto_184869 ?auto_184872 ) ) ( not ( = ?auto_184870 ?auto_184871 ) ) ( not ( = ?auto_184870 ?auto_184872 ) ) ( not ( = ?auto_184873 ?auto_184871 ) ) ( not ( = ?auto_184873 ?auto_184872 ) ) ( not ( = ?auto_184871 ?auto_184872 ) ) ( ON ?auto_184871 ?auto_184873 ) ( CLEAR ?auto_184871 ) ( HOLDING ?auto_184872 ) ( CLEAR ?auto_184876 ) ( ON-TABLE ?auto_184875 ) ( ON ?auto_184874 ?auto_184875 ) ( ON ?auto_184876 ?auto_184874 ) ( not ( = ?auto_184875 ?auto_184874 ) ) ( not ( = ?auto_184875 ?auto_184876 ) ) ( not ( = ?auto_184875 ?auto_184872 ) ) ( not ( = ?auto_184874 ?auto_184876 ) ) ( not ( = ?auto_184874 ?auto_184872 ) ) ( not ( = ?auto_184876 ?auto_184872 ) ) ( not ( = ?auto_184868 ?auto_184876 ) ) ( not ( = ?auto_184868 ?auto_184875 ) ) ( not ( = ?auto_184868 ?auto_184874 ) ) ( not ( = ?auto_184869 ?auto_184876 ) ) ( not ( = ?auto_184869 ?auto_184875 ) ) ( not ( = ?auto_184869 ?auto_184874 ) ) ( not ( = ?auto_184870 ?auto_184876 ) ) ( not ( = ?auto_184870 ?auto_184875 ) ) ( not ( = ?auto_184870 ?auto_184874 ) ) ( not ( = ?auto_184873 ?auto_184876 ) ) ( not ( = ?auto_184873 ?auto_184875 ) ) ( not ( = ?auto_184873 ?auto_184874 ) ) ( not ( = ?auto_184871 ?auto_184876 ) ) ( not ( = ?auto_184871 ?auto_184875 ) ) ( not ( = ?auto_184871 ?auto_184874 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184875 ?auto_184874 ?auto_184876 ?auto_184872 )
      ( MAKE-3PILE ?auto_184868 ?auto_184869 ?auto_184870 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184877 - BLOCK
      ?auto_184878 - BLOCK
      ?auto_184879 - BLOCK
    )
    :vars
    (
      ?auto_184884 - BLOCK
      ?auto_184885 - BLOCK
      ?auto_184883 - BLOCK
      ?auto_184881 - BLOCK
      ?auto_184882 - BLOCK
      ?auto_184880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184884 ?auto_184879 ) ( ON-TABLE ?auto_184877 ) ( ON ?auto_184878 ?auto_184877 ) ( ON ?auto_184879 ?auto_184878 ) ( not ( = ?auto_184877 ?auto_184878 ) ) ( not ( = ?auto_184877 ?auto_184879 ) ) ( not ( = ?auto_184877 ?auto_184884 ) ) ( not ( = ?auto_184878 ?auto_184879 ) ) ( not ( = ?auto_184878 ?auto_184884 ) ) ( not ( = ?auto_184879 ?auto_184884 ) ) ( not ( = ?auto_184877 ?auto_184885 ) ) ( not ( = ?auto_184877 ?auto_184883 ) ) ( not ( = ?auto_184878 ?auto_184885 ) ) ( not ( = ?auto_184878 ?auto_184883 ) ) ( not ( = ?auto_184879 ?auto_184885 ) ) ( not ( = ?auto_184879 ?auto_184883 ) ) ( not ( = ?auto_184884 ?auto_184885 ) ) ( not ( = ?auto_184884 ?auto_184883 ) ) ( not ( = ?auto_184885 ?auto_184883 ) ) ( ON ?auto_184885 ?auto_184884 ) ( CLEAR ?auto_184881 ) ( ON-TABLE ?auto_184882 ) ( ON ?auto_184880 ?auto_184882 ) ( ON ?auto_184881 ?auto_184880 ) ( not ( = ?auto_184882 ?auto_184880 ) ) ( not ( = ?auto_184882 ?auto_184881 ) ) ( not ( = ?auto_184882 ?auto_184883 ) ) ( not ( = ?auto_184880 ?auto_184881 ) ) ( not ( = ?auto_184880 ?auto_184883 ) ) ( not ( = ?auto_184881 ?auto_184883 ) ) ( not ( = ?auto_184877 ?auto_184881 ) ) ( not ( = ?auto_184877 ?auto_184882 ) ) ( not ( = ?auto_184877 ?auto_184880 ) ) ( not ( = ?auto_184878 ?auto_184881 ) ) ( not ( = ?auto_184878 ?auto_184882 ) ) ( not ( = ?auto_184878 ?auto_184880 ) ) ( not ( = ?auto_184879 ?auto_184881 ) ) ( not ( = ?auto_184879 ?auto_184882 ) ) ( not ( = ?auto_184879 ?auto_184880 ) ) ( not ( = ?auto_184884 ?auto_184881 ) ) ( not ( = ?auto_184884 ?auto_184882 ) ) ( not ( = ?auto_184884 ?auto_184880 ) ) ( not ( = ?auto_184885 ?auto_184881 ) ) ( not ( = ?auto_184885 ?auto_184882 ) ) ( not ( = ?auto_184885 ?auto_184880 ) ) ( ON ?auto_184883 ?auto_184885 ) ( CLEAR ?auto_184883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184877 ?auto_184878 ?auto_184879 ?auto_184884 ?auto_184885 )
      ( MAKE-3PILE ?auto_184877 ?auto_184878 ?auto_184879 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184886 - BLOCK
      ?auto_184887 - BLOCK
      ?auto_184888 - BLOCK
    )
    :vars
    (
      ?auto_184893 - BLOCK
      ?auto_184892 - BLOCK
      ?auto_184889 - BLOCK
      ?auto_184891 - BLOCK
      ?auto_184890 - BLOCK
      ?auto_184894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184893 ?auto_184888 ) ( ON-TABLE ?auto_184886 ) ( ON ?auto_184887 ?auto_184886 ) ( ON ?auto_184888 ?auto_184887 ) ( not ( = ?auto_184886 ?auto_184887 ) ) ( not ( = ?auto_184886 ?auto_184888 ) ) ( not ( = ?auto_184886 ?auto_184893 ) ) ( not ( = ?auto_184887 ?auto_184888 ) ) ( not ( = ?auto_184887 ?auto_184893 ) ) ( not ( = ?auto_184888 ?auto_184893 ) ) ( not ( = ?auto_184886 ?auto_184892 ) ) ( not ( = ?auto_184886 ?auto_184889 ) ) ( not ( = ?auto_184887 ?auto_184892 ) ) ( not ( = ?auto_184887 ?auto_184889 ) ) ( not ( = ?auto_184888 ?auto_184892 ) ) ( not ( = ?auto_184888 ?auto_184889 ) ) ( not ( = ?auto_184893 ?auto_184892 ) ) ( not ( = ?auto_184893 ?auto_184889 ) ) ( not ( = ?auto_184892 ?auto_184889 ) ) ( ON ?auto_184892 ?auto_184893 ) ( ON-TABLE ?auto_184891 ) ( ON ?auto_184890 ?auto_184891 ) ( not ( = ?auto_184891 ?auto_184890 ) ) ( not ( = ?auto_184891 ?auto_184894 ) ) ( not ( = ?auto_184891 ?auto_184889 ) ) ( not ( = ?auto_184890 ?auto_184894 ) ) ( not ( = ?auto_184890 ?auto_184889 ) ) ( not ( = ?auto_184894 ?auto_184889 ) ) ( not ( = ?auto_184886 ?auto_184894 ) ) ( not ( = ?auto_184886 ?auto_184891 ) ) ( not ( = ?auto_184886 ?auto_184890 ) ) ( not ( = ?auto_184887 ?auto_184894 ) ) ( not ( = ?auto_184887 ?auto_184891 ) ) ( not ( = ?auto_184887 ?auto_184890 ) ) ( not ( = ?auto_184888 ?auto_184894 ) ) ( not ( = ?auto_184888 ?auto_184891 ) ) ( not ( = ?auto_184888 ?auto_184890 ) ) ( not ( = ?auto_184893 ?auto_184894 ) ) ( not ( = ?auto_184893 ?auto_184891 ) ) ( not ( = ?auto_184893 ?auto_184890 ) ) ( not ( = ?auto_184892 ?auto_184894 ) ) ( not ( = ?auto_184892 ?auto_184891 ) ) ( not ( = ?auto_184892 ?auto_184890 ) ) ( ON ?auto_184889 ?auto_184892 ) ( CLEAR ?auto_184889 ) ( HOLDING ?auto_184894 ) ( CLEAR ?auto_184890 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184891 ?auto_184890 ?auto_184894 )
      ( MAKE-3PILE ?auto_184886 ?auto_184887 ?auto_184888 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184895 - BLOCK
      ?auto_184896 - BLOCK
      ?auto_184897 - BLOCK
    )
    :vars
    (
      ?auto_184902 - BLOCK
      ?auto_184903 - BLOCK
      ?auto_184898 - BLOCK
      ?auto_184899 - BLOCK
      ?auto_184901 - BLOCK
      ?auto_184900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184902 ?auto_184897 ) ( ON-TABLE ?auto_184895 ) ( ON ?auto_184896 ?auto_184895 ) ( ON ?auto_184897 ?auto_184896 ) ( not ( = ?auto_184895 ?auto_184896 ) ) ( not ( = ?auto_184895 ?auto_184897 ) ) ( not ( = ?auto_184895 ?auto_184902 ) ) ( not ( = ?auto_184896 ?auto_184897 ) ) ( not ( = ?auto_184896 ?auto_184902 ) ) ( not ( = ?auto_184897 ?auto_184902 ) ) ( not ( = ?auto_184895 ?auto_184903 ) ) ( not ( = ?auto_184895 ?auto_184898 ) ) ( not ( = ?auto_184896 ?auto_184903 ) ) ( not ( = ?auto_184896 ?auto_184898 ) ) ( not ( = ?auto_184897 ?auto_184903 ) ) ( not ( = ?auto_184897 ?auto_184898 ) ) ( not ( = ?auto_184902 ?auto_184903 ) ) ( not ( = ?auto_184902 ?auto_184898 ) ) ( not ( = ?auto_184903 ?auto_184898 ) ) ( ON ?auto_184903 ?auto_184902 ) ( ON-TABLE ?auto_184899 ) ( ON ?auto_184901 ?auto_184899 ) ( not ( = ?auto_184899 ?auto_184901 ) ) ( not ( = ?auto_184899 ?auto_184900 ) ) ( not ( = ?auto_184899 ?auto_184898 ) ) ( not ( = ?auto_184901 ?auto_184900 ) ) ( not ( = ?auto_184901 ?auto_184898 ) ) ( not ( = ?auto_184900 ?auto_184898 ) ) ( not ( = ?auto_184895 ?auto_184900 ) ) ( not ( = ?auto_184895 ?auto_184899 ) ) ( not ( = ?auto_184895 ?auto_184901 ) ) ( not ( = ?auto_184896 ?auto_184900 ) ) ( not ( = ?auto_184896 ?auto_184899 ) ) ( not ( = ?auto_184896 ?auto_184901 ) ) ( not ( = ?auto_184897 ?auto_184900 ) ) ( not ( = ?auto_184897 ?auto_184899 ) ) ( not ( = ?auto_184897 ?auto_184901 ) ) ( not ( = ?auto_184902 ?auto_184900 ) ) ( not ( = ?auto_184902 ?auto_184899 ) ) ( not ( = ?auto_184902 ?auto_184901 ) ) ( not ( = ?auto_184903 ?auto_184900 ) ) ( not ( = ?auto_184903 ?auto_184899 ) ) ( not ( = ?auto_184903 ?auto_184901 ) ) ( ON ?auto_184898 ?auto_184903 ) ( CLEAR ?auto_184901 ) ( ON ?auto_184900 ?auto_184898 ) ( CLEAR ?auto_184900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_184895 ?auto_184896 ?auto_184897 ?auto_184902 ?auto_184903 ?auto_184898 )
      ( MAKE-3PILE ?auto_184895 ?auto_184896 ?auto_184897 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184904 - BLOCK
      ?auto_184905 - BLOCK
      ?auto_184906 - BLOCK
    )
    :vars
    (
      ?auto_184909 - BLOCK
      ?auto_184908 - BLOCK
      ?auto_184910 - BLOCK
      ?auto_184911 - BLOCK
      ?auto_184907 - BLOCK
      ?auto_184912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184909 ?auto_184906 ) ( ON-TABLE ?auto_184904 ) ( ON ?auto_184905 ?auto_184904 ) ( ON ?auto_184906 ?auto_184905 ) ( not ( = ?auto_184904 ?auto_184905 ) ) ( not ( = ?auto_184904 ?auto_184906 ) ) ( not ( = ?auto_184904 ?auto_184909 ) ) ( not ( = ?auto_184905 ?auto_184906 ) ) ( not ( = ?auto_184905 ?auto_184909 ) ) ( not ( = ?auto_184906 ?auto_184909 ) ) ( not ( = ?auto_184904 ?auto_184908 ) ) ( not ( = ?auto_184904 ?auto_184910 ) ) ( not ( = ?auto_184905 ?auto_184908 ) ) ( not ( = ?auto_184905 ?auto_184910 ) ) ( not ( = ?auto_184906 ?auto_184908 ) ) ( not ( = ?auto_184906 ?auto_184910 ) ) ( not ( = ?auto_184909 ?auto_184908 ) ) ( not ( = ?auto_184909 ?auto_184910 ) ) ( not ( = ?auto_184908 ?auto_184910 ) ) ( ON ?auto_184908 ?auto_184909 ) ( ON-TABLE ?auto_184911 ) ( not ( = ?auto_184911 ?auto_184907 ) ) ( not ( = ?auto_184911 ?auto_184912 ) ) ( not ( = ?auto_184911 ?auto_184910 ) ) ( not ( = ?auto_184907 ?auto_184912 ) ) ( not ( = ?auto_184907 ?auto_184910 ) ) ( not ( = ?auto_184912 ?auto_184910 ) ) ( not ( = ?auto_184904 ?auto_184912 ) ) ( not ( = ?auto_184904 ?auto_184911 ) ) ( not ( = ?auto_184904 ?auto_184907 ) ) ( not ( = ?auto_184905 ?auto_184912 ) ) ( not ( = ?auto_184905 ?auto_184911 ) ) ( not ( = ?auto_184905 ?auto_184907 ) ) ( not ( = ?auto_184906 ?auto_184912 ) ) ( not ( = ?auto_184906 ?auto_184911 ) ) ( not ( = ?auto_184906 ?auto_184907 ) ) ( not ( = ?auto_184909 ?auto_184912 ) ) ( not ( = ?auto_184909 ?auto_184911 ) ) ( not ( = ?auto_184909 ?auto_184907 ) ) ( not ( = ?auto_184908 ?auto_184912 ) ) ( not ( = ?auto_184908 ?auto_184911 ) ) ( not ( = ?auto_184908 ?auto_184907 ) ) ( ON ?auto_184910 ?auto_184908 ) ( ON ?auto_184912 ?auto_184910 ) ( CLEAR ?auto_184912 ) ( HOLDING ?auto_184907 ) ( CLEAR ?auto_184911 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_184911 ?auto_184907 )
      ( MAKE-3PILE ?auto_184904 ?auto_184905 ?auto_184906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186771 - BLOCK
      ?auto_186772 - BLOCK
      ?auto_186773 - BLOCK
    )
    :vars
    (
      ?auto_186777 - BLOCK
      ?auto_186776 - BLOCK
      ?auto_186778 - BLOCK
      ?auto_186774 - BLOCK
      ?auto_186775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186777 ?auto_186773 ) ( ON-TABLE ?auto_186771 ) ( ON ?auto_186772 ?auto_186771 ) ( ON ?auto_186773 ?auto_186772 ) ( not ( = ?auto_186771 ?auto_186772 ) ) ( not ( = ?auto_186771 ?auto_186773 ) ) ( not ( = ?auto_186771 ?auto_186777 ) ) ( not ( = ?auto_186772 ?auto_186773 ) ) ( not ( = ?auto_186772 ?auto_186777 ) ) ( not ( = ?auto_186773 ?auto_186777 ) ) ( not ( = ?auto_186771 ?auto_186776 ) ) ( not ( = ?auto_186771 ?auto_186778 ) ) ( not ( = ?auto_186772 ?auto_186776 ) ) ( not ( = ?auto_186772 ?auto_186778 ) ) ( not ( = ?auto_186773 ?auto_186776 ) ) ( not ( = ?auto_186773 ?auto_186778 ) ) ( not ( = ?auto_186777 ?auto_186776 ) ) ( not ( = ?auto_186777 ?auto_186778 ) ) ( not ( = ?auto_186776 ?auto_186778 ) ) ( ON ?auto_186776 ?auto_186777 ) ( not ( = ?auto_186774 ?auto_186775 ) ) ( not ( = ?auto_186774 ?auto_186778 ) ) ( not ( = ?auto_186775 ?auto_186778 ) ) ( not ( = ?auto_186771 ?auto_186775 ) ) ( not ( = ?auto_186771 ?auto_186774 ) ) ( not ( = ?auto_186772 ?auto_186775 ) ) ( not ( = ?auto_186772 ?auto_186774 ) ) ( not ( = ?auto_186773 ?auto_186775 ) ) ( not ( = ?auto_186773 ?auto_186774 ) ) ( not ( = ?auto_186777 ?auto_186775 ) ) ( not ( = ?auto_186777 ?auto_186774 ) ) ( not ( = ?auto_186776 ?auto_186775 ) ) ( not ( = ?auto_186776 ?auto_186774 ) ) ( ON ?auto_186778 ?auto_186776 ) ( ON ?auto_186775 ?auto_186778 ) ( ON ?auto_186774 ?auto_186775 ) ( CLEAR ?auto_186774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186771 ?auto_186772 ?auto_186773 ?auto_186777 ?auto_186776 ?auto_186778 ?auto_186775 )
      ( MAKE-3PILE ?auto_186771 ?auto_186772 ?auto_186773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184922 - BLOCK
      ?auto_184923 - BLOCK
      ?auto_184924 - BLOCK
    )
    :vars
    (
      ?auto_184926 - BLOCK
      ?auto_184929 - BLOCK
      ?auto_184930 - BLOCK
      ?auto_184927 - BLOCK
      ?auto_184925 - BLOCK
      ?auto_184928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184926 ?auto_184924 ) ( ON-TABLE ?auto_184922 ) ( ON ?auto_184923 ?auto_184922 ) ( ON ?auto_184924 ?auto_184923 ) ( not ( = ?auto_184922 ?auto_184923 ) ) ( not ( = ?auto_184922 ?auto_184924 ) ) ( not ( = ?auto_184922 ?auto_184926 ) ) ( not ( = ?auto_184923 ?auto_184924 ) ) ( not ( = ?auto_184923 ?auto_184926 ) ) ( not ( = ?auto_184924 ?auto_184926 ) ) ( not ( = ?auto_184922 ?auto_184929 ) ) ( not ( = ?auto_184922 ?auto_184930 ) ) ( not ( = ?auto_184923 ?auto_184929 ) ) ( not ( = ?auto_184923 ?auto_184930 ) ) ( not ( = ?auto_184924 ?auto_184929 ) ) ( not ( = ?auto_184924 ?auto_184930 ) ) ( not ( = ?auto_184926 ?auto_184929 ) ) ( not ( = ?auto_184926 ?auto_184930 ) ) ( not ( = ?auto_184929 ?auto_184930 ) ) ( ON ?auto_184929 ?auto_184926 ) ( not ( = ?auto_184927 ?auto_184925 ) ) ( not ( = ?auto_184927 ?auto_184928 ) ) ( not ( = ?auto_184927 ?auto_184930 ) ) ( not ( = ?auto_184925 ?auto_184928 ) ) ( not ( = ?auto_184925 ?auto_184930 ) ) ( not ( = ?auto_184928 ?auto_184930 ) ) ( not ( = ?auto_184922 ?auto_184928 ) ) ( not ( = ?auto_184922 ?auto_184927 ) ) ( not ( = ?auto_184922 ?auto_184925 ) ) ( not ( = ?auto_184923 ?auto_184928 ) ) ( not ( = ?auto_184923 ?auto_184927 ) ) ( not ( = ?auto_184923 ?auto_184925 ) ) ( not ( = ?auto_184924 ?auto_184928 ) ) ( not ( = ?auto_184924 ?auto_184927 ) ) ( not ( = ?auto_184924 ?auto_184925 ) ) ( not ( = ?auto_184926 ?auto_184928 ) ) ( not ( = ?auto_184926 ?auto_184927 ) ) ( not ( = ?auto_184926 ?auto_184925 ) ) ( not ( = ?auto_184929 ?auto_184928 ) ) ( not ( = ?auto_184929 ?auto_184927 ) ) ( not ( = ?auto_184929 ?auto_184925 ) ) ( ON ?auto_184930 ?auto_184929 ) ( ON ?auto_184928 ?auto_184930 ) ( ON ?auto_184925 ?auto_184928 ) ( CLEAR ?auto_184925 ) ( HOLDING ?auto_184927 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_184927 )
      ( MAKE-3PILE ?auto_184922 ?auto_184923 ?auto_184924 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_184931 - BLOCK
      ?auto_184932 - BLOCK
      ?auto_184933 - BLOCK
    )
    :vars
    (
      ?auto_184939 - BLOCK
      ?auto_184935 - BLOCK
      ?auto_184937 - BLOCK
      ?auto_184934 - BLOCK
      ?auto_184936 - BLOCK
      ?auto_184938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_184939 ?auto_184933 ) ( ON-TABLE ?auto_184931 ) ( ON ?auto_184932 ?auto_184931 ) ( ON ?auto_184933 ?auto_184932 ) ( not ( = ?auto_184931 ?auto_184932 ) ) ( not ( = ?auto_184931 ?auto_184933 ) ) ( not ( = ?auto_184931 ?auto_184939 ) ) ( not ( = ?auto_184932 ?auto_184933 ) ) ( not ( = ?auto_184932 ?auto_184939 ) ) ( not ( = ?auto_184933 ?auto_184939 ) ) ( not ( = ?auto_184931 ?auto_184935 ) ) ( not ( = ?auto_184931 ?auto_184937 ) ) ( not ( = ?auto_184932 ?auto_184935 ) ) ( not ( = ?auto_184932 ?auto_184937 ) ) ( not ( = ?auto_184933 ?auto_184935 ) ) ( not ( = ?auto_184933 ?auto_184937 ) ) ( not ( = ?auto_184939 ?auto_184935 ) ) ( not ( = ?auto_184939 ?auto_184937 ) ) ( not ( = ?auto_184935 ?auto_184937 ) ) ( ON ?auto_184935 ?auto_184939 ) ( not ( = ?auto_184934 ?auto_184936 ) ) ( not ( = ?auto_184934 ?auto_184938 ) ) ( not ( = ?auto_184934 ?auto_184937 ) ) ( not ( = ?auto_184936 ?auto_184938 ) ) ( not ( = ?auto_184936 ?auto_184937 ) ) ( not ( = ?auto_184938 ?auto_184937 ) ) ( not ( = ?auto_184931 ?auto_184938 ) ) ( not ( = ?auto_184931 ?auto_184934 ) ) ( not ( = ?auto_184931 ?auto_184936 ) ) ( not ( = ?auto_184932 ?auto_184938 ) ) ( not ( = ?auto_184932 ?auto_184934 ) ) ( not ( = ?auto_184932 ?auto_184936 ) ) ( not ( = ?auto_184933 ?auto_184938 ) ) ( not ( = ?auto_184933 ?auto_184934 ) ) ( not ( = ?auto_184933 ?auto_184936 ) ) ( not ( = ?auto_184939 ?auto_184938 ) ) ( not ( = ?auto_184939 ?auto_184934 ) ) ( not ( = ?auto_184939 ?auto_184936 ) ) ( not ( = ?auto_184935 ?auto_184938 ) ) ( not ( = ?auto_184935 ?auto_184934 ) ) ( not ( = ?auto_184935 ?auto_184936 ) ) ( ON ?auto_184937 ?auto_184935 ) ( ON ?auto_184938 ?auto_184937 ) ( ON ?auto_184936 ?auto_184938 ) ( ON ?auto_184934 ?auto_184936 ) ( CLEAR ?auto_184934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_184931 ?auto_184932 ?auto_184933 ?auto_184939 ?auto_184935 ?auto_184937 ?auto_184938 ?auto_184936 )
      ( MAKE-3PILE ?auto_184931 ?auto_184932 ?auto_184933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184946 - BLOCK
      ?auto_184947 - BLOCK
      ?auto_184948 - BLOCK
      ?auto_184949 - BLOCK
      ?auto_184950 - BLOCK
      ?auto_184951 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_184951 ) ( CLEAR ?auto_184950 ) ( ON-TABLE ?auto_184946 ) ( ON ?auto_184947 ?auto_184946 ) ( ON ?auto_184948 ?auto_184947 ) ( ON ?auto_184949 ?auto_184948 ) ( ON ?auto_184950 ?auto_184949 ) ( not ( = ?auto_184946 ?auto_184947 ) ) ( not ( = ?auto_184946 ?auto_184948 ) ) ( not ( = ?auto_184946 ?auto_184949 ) ) ( not ( = ?auto_184946 ?auto_184950 ) ) ( not ( = ?auto_184946 ?auto_184951 ) ) ( not ( = ?auto_184947 ?auto_184948 ) ) ( not ( = ?auto_184947 ?auto_184949 ) ) ( not ( = ?auto_184947 ?auto_184950 ) ) ( not ( = ?auto_184947 ?auto_184951 ) ) ( not ( = ?auto_184948 ?auto_184949 ) ) ( not ( = ?auto_184948 ?auto_184950 ) ) ( not ( = ?auto_184948 ?auto_184951 ) ) ( not ( = ?auto_184949 ?auto_184950 ) ) ( not ( = ?auto_184949 ?auto_184951 ) ) ( not ( = ?auto_184950 ?auto_184951 ) ) )
    :subtasks
    ( ( !STACK ?auto_184951 ?auto_184950 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184952 - BLOCK
      ?auto_184953 - BLOCK
      ?auto_184954 - BLOCK
      ?auto_184955 - BLOCK
      ?auto_184956 - BLOCK
      ?auto_184957 - BLOCK
    )
    :vars
    (
      ?auto_184958 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184956 ) ( ON-TABLE ?auto_184952 ) ( ON ?auto_184953 ?auto_184952 ) ( ON ?auto_184954 ?auto_184953 ) ( ON ?auto_184955 ?auto_184954 ) ( ON ?auto_184956 ?auto_184955 ) ( not ( = ?auto_184952 ?auto_184953 ) ) ( not ( = ?auto_184952 ?auto_184954 ) ) ( not ( = ?auto_184952 ?auto_184955 ) ) ( not ( = ?auto_184952 ?auto_184956 ) ) ( not ( = ?auto_184952 ?auto_184957 ) ) ( not ( = ?auto_184953 ?auto_184954 ) ) ( not ( = ?auto_184953 ?auto_184955 ) ) ( not ( = ?auto_184953 ?auto_184956 ) ) ( not ( = ?auto_184953 ?auto_184957 ) ) ( not ( = ?auto_184954 ?auto_184955 ) ) ( not ( = ?auto_184954 ?auto_184956 ) ) ( not ( = ?auto_184954 ?auto_184957 ) ) ( not ( = ?auto_184955 ?auto_184956 ) ) ( not ( = ?auto_184955 ?auto_184957 ) ) ( not ( = ?auto_184956 ?auto_184957 ) ) ( ON ?auto_184957 ?auto_184958 ) ( CLEAR ?auto_184957 ) ( HAND-EMPTY ) ( not ( = ?auto_184952 ?auto_184958 ) ) ( not ( = ?auto_184953 ?auto_184958 ) ) ( not ( = ?auto_184954 ?auto_184958 ) ) ( not ( = ?auto_184955 ?auto_184958 ) ) ( not ( = ?auto_184956 ?auto_184958 ) ) ( not ( = ?auto_184957 ?auto_184958 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_184957 ?auto_184958 )
      ( MAKE-6PILE ?auto_184952 ?auto_184953 ?auto_184954 ?auto_184955 ?auto_184956 ?auto_184957 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184959 - BLOCK
      ?auto_184960 - BLOCK
      ?auto_184961 - BLOCK
      ?auto_184962 - BLOCK
      ?auto_184963 - BLOCK
      ?auto_184964 - BLOCK
    )
    :vars
    (
      ?auto_184965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184959 ) ( ON ?auto_184960 ?auto_184959 ) ( ON ?auto_184961 ?auto_184960 ) ( ON ?auto_184962 ?auto_184961 ) ( not ( = ?auto_184959 ?auto_184960 ) ) ( not ( = ?auto_184959 ?auto_184961 ) ) ( not ( = ?auto_184959 ?auto_184962 ) ) ( not ( = ?auto_184959 ?auto_184963 ) ) ( not ( = ?auto_184959 ?auto_184964 ) ) ( not ( = ?auto_184960 ?auto_184961 ) ) ( not ( = ?auto_184960 ?auto_184962 ) ) ( not ( = ?auto_184960 ?auto_184963 ) ) ( not ( = ?auto_184960 ?auto_184964 ) ) ( not ( = ?auto_184961 ?auto_184962 ) ) ( not ( = ?auto_184961 ?auto_184963 ) ) ( not ( = ?auto_184961 ?auto_184964 ) ) ( not ( = ?auto_184962 ?auto_184963 ) ) ( not ( = ?auto_184962 ?auto_184964 ) ) ( not ( = ?auto_184963 ?auto_184964 ) ) ( ON ?auto_184964 ?auto_184965 ) ( CLEAR ?auto_184964 ) ( not ( = ?auto_184959 ?auto_184965 ) ) ( not ( = ?auto_184960 ?auto_184965 ) ) ( not ( = ?auto_184961 ?auto_184965 ) ) ( not ( = ?auto_184962 ?auto_184965 ) ) ( not ( = ?auto_184963 ?auto_184965 ) ) ( not ( = ?auto_184964 ?auto_184965 ) ) ( HOLDING ?auto_184963 ) ( CLEAR ?auto_184962 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184959 ?auto_184960 ?auto_184961 ?auto_184962 ?auto_184963 )
      ( MAKE-6PILE ?auto_184959 ?auto_184960 ?auto_184961 ?auto_184962 ?auto_184963 ?auto_184964 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184966 - BLOCK
      ?auto_184967 - BLOCK
      ?auto_184968 - BLOCK
      ?auto_184969 - BLOCK
      ?auto_184970 - BLOCK
      ?auto_184971 - BLOCK
    )
    :vars
    (
      ?auto_184972 - BLOCK
      ?auto_184974 - BLOCK
      ?auto_184973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184966 ) ( ON ?auto_184967 ?auto_184966 ) ( ON ?auto_184968 ?auto_184967 ) ( ON ?auto_184969 ?auto_184968 ) ( not ( = ?auto_184966 ?auto_184967 ) ) ( not ( = ?auto_184966 ?auto_184968 ) ) ( not ( = ?auto_184966 ?auto_184969 ) ) ( not ( = ?auto_184966 ?auto_184970 ) ) ( not ( = ?auto_184966 ?auto_184971 ) ) ( not ( = ?auto_184967 ?auto_184968 ) ) ( not ( = ?auto_184967 ?auto_184969 ) ) ( not ( = ?auto_184967 ?auto_184970 ) ) ( not ( = ?auto_184967 ?auto_184971 ) ) ( not ( = ?auto_184968 ?auto_184969 ) ) ( not ( = ?auto_184968 ?auto_184970 ) ) ( not ( = ?auto_184968 ?auto_184971 ) ) ( not ( = ?auto_184969 ?auto_184970 ) ) ( not ( = ?auto_184969 ?auto_184971 ) ) ( not ( = ?auto_184970 ?auto_184971 ) ) ( ON ?auto_184971 ?auto_184972 ) ( not ( = ?auto_184966 ?auto_184972 ) ) ( not ( = ?auto_184967 ?auto_184972 ) ) ( not ( = ?auto_184968 ?auto_184972 ) ) ( not ( = ?auto_184969 ?auto_184972 ) ) ( not ( = ?auto_184970 ?auto_184972 ) ) ( not ( = ?auto_184971 ?auto_184972 ) ) ( CLEAR ?auto_184969 ) ( ON ?auto_184970 ?auto_184971 ) ( CLEAR ?auto_184970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_184974 ) ( ON ?auto_184973 ?auto_184974 ) ( ON ?auto_184972 ?auto_184973 ) ( not ( = ?auto_184974 ?auto_184973 ) ) ( not ( = ?auto_184974 ?auto_184972 ) ) ( not ( = ?auto_184974 ?auto_184971 ) ) ( not ( = ?auto_184974 ?auto_184970 ) ) ( not ( = ?auto_184973 ?auto_184972 ) ) ( not ( = ?auto_184973 ?auto_184971 ) ) ( not ( = ?auto_184973 ?auto_184970 ) ) ( not ( = ?auto_184966 ?auto_184974 ) ) ( not ( = ?auto_184966 ?auto_184973 ) ) ( not ( = ?auto_184967 ?auto_184974 ) ) ( not ( = ?auto_184967 ?auto_184973 ) ) ( not ( = ?auto_184968 ?auto_184974 ) ) ( not ( = ?auto_184968 ?auto_184973 ) ) ( not ( = ?auto_184969 ?auto_184974 ) ) ( not ( = ?auto_184969 ?auto_184973 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184974 ?auto_184973 ?auto_184972 ?auto_184971 )
      ( MAKE-6PILE ?auto_184966 ?auto_184967 ?auto_184968 ?auto_184969 ?auto_184970 ?auto_184971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184975 - BLOCK
      ?auto_184976 - BLOCK
      ?auto_184977 - BLOCK
      ?auto_184978 - BLOCK
      ?auto_184979 - BLOCK
      ?auto_184980 - BLOCK
    )
    :vars
    (
      ?auto_184981 - BLOCK
      ?auto_184983 - BLOCK
      ?auto_184982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184975 ) ( ON ?auto_184976 ?auto_184975 ) ( ON ?auto_184977 ?auto_184976 ) ( not ( = ?auto_184975 ?auto_184976 ) ) ( not ( = ?auto_184975 ?auto_184977 ) ) ( not ( = ?auto_184975 ?auto_184978 ) ) ( not ( = ?auto_184975 ?auto_184979 ) ) ( not ( = ?auto_184975 ?auto_184980 ) ) ( not ( = ?auto_184976 ?auto_184977 ) ) ( not ( = ?auto_184976 ?auto_184978 ) ) ( not ( = ?auto_184976 ?auto_184979 ) ) ( not ( = ?auto_184976 ?auto_184980 ) ) ( not ( = ?auto_184977 ?auto_184978 ) ) ( not ( = ?auto_184977 ?auto_184979 ) ) ( not ( = ?auto_184977 ?auto_184980 ) ) ( not ( = ?auto_184978 ?auto_184979 ) ) ( not ( = ?auto_184978 ?auto_184980 ) ) ( not ( = ?auto_184979 ?auto_184980 ) ) ( ON ?auto_184980 ?auto_184981 ) ( not ( = ?auto_184975 ?auto_184981 ) ) ( not ( = ?auto_184976 ?auto_184981 ) ) ( not ( = ?auto_184977 ?auto_184981 ) ) ( not ( = ?auto_184978 ?auto_184981 ) ) ( not ( = ?auto_184979 ?auto_184981 ) ) ( not ( = ?auto_184980 ?auto_184981 ) ) ( ON ?auto_184979 ?auto_184980 ) ( CLEAR ?auto_184979 ) ( ON-TABLE ?auto_184983 ) ( ON ?auto_184982 ?auto_184983 ) ( ON ?auto_184981 ?auto_184982 ) ( not ( = ?auto_184983 ?auto_184982 ) ) ( not ( = ?auto_184983 ?auto_184981 ) ) ( not ( = ?auto_184983 ?auto_184980 ) ) ( not ( = ?auto_184983 ?auto_184979 ) ) ( not ( = ?auto_184982 ?auto_184981 ) ) ( not ( = ?auto_184982 ?auto_184980 ) ) ( not ( = ?auto_184982 ?auto_184979 ) ) ( not ( = ?auto_184975 ?auto_184983 ) ) ( not ( = ?auto_184975 ?auto_184982 ) ) ( not ( = ?auto_184976 ?auto_184983 ) ) ( not ( = ?auto_184976 ?auto_184982 ) ) ( not ( = ?auto_184977 ?auto_184983 ) ) ( not ( = ?auto_184977 ?auto_184982 ) ) ( not ( = ?auto_184978 ?auto_184983 ) ) ( not ( = ?auto_184978 ?auto_184982 ) ) ( HOLDING ?auto_184978 ) ( CLEAR ?auto_184977 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_184975 ?auto_184976 ?auto_184977 ?auto_184978 )
      ( MAKE-6PILE ?auto_184975 ?auto_184976 ?auto_184977 ?auto_184978 ?auto_184979 ?auto_184980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184984 - BLOCK
      ?auto_184985 - BLOCK
      ?auto_184986 - BLOCK
      ?auto_184987 - BLOCK
      ?auto_184988 - BLOCK
      ?auto_184989 - BLOCK
    )
    :vars
    (
      ?auto_184990 - BLOCK
      ?auto_184991 - BLOCK
      ?auto_184992 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184984 ) ( ON ?auto_184985 ?auto_184984 ) ( ON ?auto_184986 ?auto_184985 ) ( not ( = ?auto_184984 ?auto_184985 ) ) ( not ( = ?auto_184984 ?auto_184986 ) ) ( not ( = ?auto_184984 ?auto_184987 ) ) ( not ( = ?auto_184984 ?auto_184988 ) ) ( not ( = ?auto_184984 ?auto_184989 ) ) ( not ( = ?auto_184985 ?auto_184986 ) ) ( not ( = ?auto_184985 ?auto_184987 ) ) ( not ( = ?auto_184985 ?auto_184988 ) ) ( not ( = ?auto_184985 ?auto_184989 ) ) ( not ( = ?auto_184986 ?auto_184987 ) ) ( not ( = ?auto_184986 ?auto_184988 ) ) ( not ( = ?auto_184986 ?auto_184989 ) ) ( not ( = ?auto_184987 ?auto_184988 ) ) ( not ( = ?auto_184987 ?auto_184989 ) ) ( not ( = ?auto_184988 ?auto_184989 ) ) ( ON ?auto_184989 ?auto_184990 ) ( not ( = ?auto_184984 ?auto_184990 ) ) ( not ( = ?auto_184985 ?auto_184990 ) ) ( not ( = ?auto_184986 ?auto_184990 ) ) ( not ( = ?auto_184987 ?auto_184990 ) ) ( not ( = ?auto_184988 ?auto_184990 ) ) ( not ( = ?auto_184989 ?auto_184990 ) ) ( ON ?auto_184988 ?auto_184989 ) ( ON-TABLE ?auto_184991 ) ( ON ?auto_184992 ?auto_184991 ) ( ON ?auto_184990 ?auto_184992 ) ( not ( = ?auto_184991 ?auto_184992 ) ) ( not ( = ?auto_184991 ?auto_184990 ) ) ( not ( = ?auto_184991 ?auto_184989 ) ) ( not ( = ?auto_184991 ?auto_184988 ) ) ( not ( = ?auto_184992 ?auto_184990 ) ) ( not ( = ?auto_184992 ?auto_184989 ) ) ( not ( = ?auto_184992 ?auto_184988 ) ) ( not ( = ?auto_184984 ?auto_184991 ) ) ( not ( = ?auto_184984 ?auto_184992 ) ) ( not ( = ?auto_184985 ?auto_184991 ) ) ( not ( = ?auto_184985 ?auto_184992 ) ) ( not ( = ?auto_184986 ?auto_184991 ) ) ( not ( = ?auto_184986 ?auto_184992 ) ) ( not ( = ?auto_184987 ?auto_184991 ) ) ( not ( = ?auto_184987 ?auto_184992 ) ) ( CLEAR ?auto_184986 ) ( ON ?auto_184987 ?auto_184988 ) ( CLEAR ?auto_184987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_184991 ?auto_184992 ?auto_184990 ?auto_184989 ?auto_184988 )
      ( MAKE-6PILE ?auto_184984 ?auto_184985 ?auto_184986 ?auto_184987 ?auto_184988 ?auto_184989 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_184993 - BLOCK
      ?auto_184994 - BLOCK
      ?auto_184995 - BLOCK
      ?auto_184996 - BLOCK
      ?auto_184997 - BLOCK
      ?auto_184998 - BLOCK
    )
    :vars
    (
      ?auto_184999 - BLOCK
      ?auto_185000 - BLOCK
      ?auto_185001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_184993 ) ( ON ?auto_184994 ?auto_184993 ) ( not ( = ?auto_184993 ?auto_184994 ) ) ( not ( = ?auto_184993 ?auto_184995 ) ) ( not ( = ?auto_184993 ?auto_184996 ) ) ( not ( = ?auto_184993 ?auto_184997 ) ) ( not ( = ?auto_184993 ?auto_184998 ) ) ( not ( = ?auto_184994 ?auto_184995 ) ) ( not ( = ?auto_184994 ?auto_184996 ) ) ( not ( = ?auto_184994 ?auto_184997 ) ) ( not ( = ?auto_184994 ?auto_184998 ) ) ( not ( = ?auto_184995 ?auto_184996 ) ) ( not ( = ?auto_184995 ?auto_184997 ) ) ( not ( = ?auto_184995 ?auto_184998 ) ) ( not ( = ?auto_184996 ?auto_184997 ) ) ( not ( = ?auto_184996 ?auto_184998 ) ) ( not ( = ?auto_184997 ?auto_184998 ) ) ( ON ?auto_184998 ?auto_184999 ) ( not ( = ?auto_184993 ?auto_184999 ) ) ( not ( = ?auto_184994 ?auto_184999 ) ) ( not ( = ?auto_184995 ?auto_184999 ) ) ( not ( = ?auto_184996 ?auto_184999 ) ) ( not ( = ?auto_184997 ?auto_184999 ) ) ( not ( = ?auto_184998 ?auto_184999 ) ) ( ON ?auto_184997 ?auto_184998 ) ( ON-TABLE ?auto_185000 ) ( ON ?auto_185001 ?auto_185000 ) ( ON ?auto_184999 ?auto_185001 ) ( not ( = ?auto_185000 ?auto_185001 ) ) ( not ( = ?auto_185000 ?auto_184999 ) ) ( not ( = ?auto_185000 ?auto_184998 ) ) ( not ( = ?auto_185000 ?auto_184997 ) ) ( not ( = ?auto_185001 ?auto_184999 ) ) ( not ( = ?auto_185001 ?auto_184998 ) ) ( not ( = ?auto_185001 ?auto_184997 ) ) ( not ( = ?auto_184993 ?auto_185000 ) ) ( not ( = ?auto_184993 ?auto_185001 ) ) ( not ( = ?auto_184994 ?auto_185000 ) ) ( not ( = ?auto_184994 ?auto_185001 ) ) ( not ( = ?auto_184995 ?auto_185000 ) ) ( not ( = ?auto_184995 ?auto_185001 ) ) ( not ( = ?auto_184996 ?auto_185000 ) ) ( not ( = ?auto_184996 ?auto_185001 ) ) ( ON ?auto_184996 ?auto_184997 ) ( CLEAR ?auto_184996 ) ( HOLDING ?auto_184995 ) ( CLEAR ?auto_184994 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_184993 ?auto_184994 ?auto_184995 )
      ( MAKE-6PILE ?auto_184993 ?auto_184994 ?auto_184995 ?auto_184996 ?auto_184997 ?auto_184998 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185002 - BLOCK
      ?auto_185003 - BLOCK
      ?auto_185004 - BLOCK
      ?auto_185005 - BLOCK
      ?auto_185006 - BLOCK
      ?auto_185007 - BLOCK
    )
    :vars
    (
      ?auto_185010 - BLOCK
      ?auto_185009 - BLOCK
      ?auto_185008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185002 ) ( ON ?auto_185003 ?auto_185002 ) ( not ( = ?auto_185002 ?auto_185003 ) ) ( not ( = ?auto_185002 ?auto_185004 ) ) ( not ( = ?auto_185002 ?auto_185005 ) ) ( not ( = ?auto_185002 ?auto_185006 ) ) ( not ( = ?auto_185002 ?auto_185007 ) ) ( not ( = ?auto_185003 ?auto_185004 ) ) ( not ( = ?auto_185003 ?auto_185005 ) ) ( not ( = ?auto_185003 ?auto_185006 ) ) ( not ( = ?auto_185003 ?auto_185007 ) ) ( not ( = ?auto_185004 ?auto_185005 ) ) ( not ( = ?auto_185004 ?auto_185006 ) ) ( not ( = ?auto_185004 ?auto_185007 ) ) ( not ( = ?auto_185005 ?auto_185006 ) ) ( not ( = ?auto_185005 ?auto_185007 ) ) ( not ( = ?auto_185006 ?auto_185007 ) ) ( ON ?auto_185007 ?auto_185010 ) ( not ( = ?auto_185002 ?auto_185010 ) ) ( not ( = ?auto_185003 ?auto_185010 ) ) ( not ( = ?auto_185004 ?auto_185010 ) ) ( not ( = ?auto_185005 ?auto_185010 ) ) ( not ( = ?auto_185006 ?auto_185010 ) ) ( not ( = ?auto_185007 ?auto_185010 ) ) ( ON ?auto_185006 ?auto_185007 ) ( ON-TABLE ?auto_185009 ) ( ON ?auto_185008 ?auto_185009 ) ( ON ?auto_185010 ?auto_185008 ) ( not ( = ?auto_185009 ?auto_185008 ) ) ( not ( = ?auto_185009 ?auto_185010 ) ) ( not ( = ?auto_185009 ?auto_185007 ) ) ( not ( = ?auto_185009 ?auto_185006 ) ) ( not ( = ?auto_185008 ?auto_185010 ) ) ( not ( = ?auto_185008 ?auto_185007 ) ) ( not ( = ?auto_185008 ?auto_185006 ) ) ( not ( = ?auto_185002 ?auto_185009 ) ) ( not ( = ?auto_185002 ?auto_185008 ) ) ( not ( = ?auto_185003 ?auto_185009 ) ) ( not ( = ?auto_185003 ?auto_185008 ) ) ( not ( = ?auto_185004 ?auto_185009 ) ) ( not ( = ?auto_185004 ?auto_185008 ) ) ( not ( = ?auto_185005 ?auto_185009 ) ) ( not ( = ?auto_185005 ?auto_185008 ) ) ( ON ?auto_185005 ?auto_185006 ) ( CLEAR ?auto_185003 ) ( ON ?auto_185004 ?auto_185005 ) ( CLEAR ?auto_185004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185009 ?auto_185008 ?auto_185010 ?auto_185007 ?auto_185006 ?auto_185005 )
      ( MAKE-6PILE ?auto_185002 ?auto_185003 ?auto_185004 ?auto_185005 ?auto_185006 ?auto_185007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185011 - BLOCK
      ?auto_185012 - BLOCK
      ?auto_185013 - BLOCK
      ?auto_185014 - BLOCK
      ?auto_185015 - BLOCK
      ?auto_185016 - BLOCK
    )
    :vars
    (
      ?auto_185019 - BLOCK
      ?auto_185018 - BLOCK
      ?auto_185017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185011 ) ( not ( = ?auto_185011 ?auto_185012 ) ) ( not ( = ?auto_185011 ?auto_185013 ) ) ( not ( = ?auto_185011 ?auto_185014 ) ) ( not ( = ?auto_185011 ?auto_185015 ) ) ( not ( = ?auto_185011 ?auto_185016 ) ) ( not ( = ?auto_185012 ?auto_185013 ) ) ( not ( = ?auto_185012 ?auto_185014 ) ) ( not ( = ?auto_185012 ?auto_185015 ) ) ( not ( = ?auto_185012 ?auto_185016 ) ) ( not ( = ?auto_185013 ?auto_185014 ) ) ( not ( = ?auto_185013 ?auto_185015 ) ) ( not ( = ?auto_185013 ?auto_185016 ) ) ( not ( = ?auto_185014 ?auto_185015 ) ) ( not ( = ?auto_185014 ?auto_185016 ) ) ( not ( = ?auto_185015 ?auto_185016 ) ) ( ON ?auto_185016 ?auto_185019 ) ( not ( = ?auto_185011 ?auto_185019 ) ) ( not ( = ?auto_185012 ?auto_185019 ) ) ( not ( = ?auto_185013 ?auto_185019 ) ) ( not ( = ?auto_185014 ?auto_185019 ) ) ( not ( = ?auto_185015 ?auto_185019 ) ) ( not ( = ?auto_185016 ?auto_185019 ) ) ( ON ?auto_185015 ?auto_185016 ) ( ON-TABLE ?auto_185018 ) ( ON ?auto_185017 ?auto_185018 ) ( ON ?auto_185019 ?auto_185017 ) ( not ( = ?auto_185018 ?auto_185017 ) ) ( not ( = ?auto_185018 ?auto_185019 ) ) ( not ( = ?auto_185018 ?auto_185016 ) ) ( not ( = ?auto_185018 ?auto_185015 ) ) ( not ( = ?auto_185017 ?auto_185019 ) ) ( not ( = ?auto_185017 ?auto_185016 ) ) ( not ( = ?auto_185017 ?auto_185015 ) ) ( not ( = ?auto_185011 ?auto_185018 ) ) ( not ( = ?auto_185011 ?auto_185017 ) ) ( not ( = ?auto_185012 ?auto_185018 ) ) ( not ( = ?auto_185012 ?auto_185017 ) ) ( not ( = ?auto_185013 ?auto_185018 ) ) ( not ( = ?auto_185013 ?auto_185017 ) ) ( not ( = ?auto_185014 ?auto_185018 ) ) ( not ( = ?auto_185014 ?auto_185017 ) ) ( ON ?auto_185014 ?auto_185015 ) ( ON ?auto_185013 ?auto_185014 ) ( CLEAR ?auto_185013 ) ( HOLDING ?auto_185012 ) ( CLEAR ?auto_185011 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185011 ?auto_185012 )
      ( MAKE-6PILE ?auto_185011 ?auto_185012 ?auto_185013 ?auto_185014 ?auto_185015 ?auto_185016 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185020 - BLOCK
      ?auto_185021 - BLOCK
      ?auto_185022 - BLOCK
      ?auto_185023 - BLOCK
      ?auto_185024 - BLOCK
      ?auto_185025 - BLOCK
    )
    :vars
    (
      ?auto_185027 - BLOCK
      ?auto_185028 - BLOCK
      ?auto_185026 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185020 ) ( not ( = ?auto_185020 ?auto_185021 ) ) ( not ( = ?auto_185020 ?auto_185022 ) ) ( not ( = ?auto_185020 ?auto_185023 ) ) ( not ( = ?auto_185020 ?auto_185024 ) ) ( not ( = ?auto_185020 ?auto_185025 ) ) ( not ( = ?auto_185021 ?auto_185022 ) ) ( not ( = ?auto_185021 ?auto_185023 ) ) ( not ( = ?auto_185021 ?auto_185024 ) ) ( not ( = ?auto_185021 ?auto_185025 ) ) ( not ( = ?auto_185022 ?auto_185023 ) ) ( not ( = ?auto_185022 ?auto_185024 ) ) ( not ( = ?auto_185022 ?auto_185025 ) ) ( not ( = ?auto_185023 ?auto_185024 ) ) ( not ( = ?auto_185023 ?auto_185025 ) ) ( not ( = ?auto_185024 ?auto_185025 ) ) ( ON ?auto_185025 ?auto_185027 ) ( not ( = ?auto_185020 ?auto_185027 ) ) ( not ( = ?auto_185021 ?auto_185027 ) ) ( not ( = ?auto_185022 ?auto_185027 ) ) ( not ( = ?auto_185023 ?auto_185027 ) ) ( not ( = ?auto_185024 ?auto_185027 ) ) ( not ( = ?auto_185025 ?auto_185027 ) ) ( ON ?auto_185024 ?auto_185025 ) ( ON-TABLE ?auto_185028 ) ( ON ?auto_185026 ?auto_185028 ) ( ON ?auto_185027 ?auto_185026 ) ( not ( = ?auto_185028 ?auto_185026 ) ) ( not ( = ?auto_185028 ?auto_185027 ) ) ( not ( = ?auto_185028 ?auto_185025 ) ) ( not ( = ?auto_185028 ?auto_185024 ) ) ( not ( = ?auto_185026 ?auto_185027 ) ) ( not ( = ?auto_185026 ?auto_185025 ) ) ( not ( = ?auto_185026 ?auto_185024 ) ) ( not ( = ?auto_185020 ?auto_185028 ) ) ( not ( = ?auto_185020 ?auto_185026 ) ) ( not ( = ?auto_185021 ?auto_185028 ) ) ( not ( = ?auto_185021 ?auto_185026 ) ) ( not ( = ?auto_185022 ?auto_185028 ) ) ( not ( = ?auto_185022 ?auto_185026 ) ) ( not ( = ?auto_185023 ?auto_185028 ) ) ( not ( = ?auto_185023 ?auto_185026 ) ) ( ON ?auto_185023 ?auto_185024 ) ( ON ?auto_185022 ?auto_185023 ) ( CLEAR ?auto_185020 ) ( ON ?auto_185021 ?auto_185022 ) ( CLEAR ?auto_185021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185028 ?auto_185026 ?auto_185027 ?auto_185025 ?auto_185024 ?auto_185023 ?auto_185022 )
      ( MAKE-6PILE ?auto_185020 ?auto_185021 ?auto_185022 ?auto_185023 ?auto_185024 ?auto_185025 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185029 - BLOCK
      ?auto_185030 - BLOCK
      ?auto_185031 - BLOCK
      ?auto_185032 - BLOCK
      ?auto_185033 - BLOCK
      ?auto_185034 - BLOCK
    )
    :vars
    (
      ?auto_185036 - BLOCK
      ?auto_185035 - BLOCK
      ?auto_185037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185029 ?auto_185030 ) ) ( not ( = ?auto_185029 ?auto_185031 ) ) ( not ( = ?auto_185029 ?auto_185032 ) ) ( not ( = ?auto_185029 ?auto_185033 ) ) ( not ( = ?auto_185029 ?auto_185034 ) ) ( not ( = ?auto_185030 ?auto_185031 ) ) ( not ( = ?auto_185030 ?auto_185032 ) ) ( not ( = ?auto_185030 ?auto_185033 ) ) ( not ( = ?auto_185030 ?auto_185034 ) ) ( not ( = ?auto_185031 ?auto_185032 ) ) ( not ( = ?auto_185031 ?auto_185033 ) ) ( not ( = ?auto_185031 ?auto_185034 ) ) ( not ( = ?auto_185032 ?auto_185033 ) ) ( not ( = ?auto_185032 ?auto_185034 ) ) ( not ( = ?auto_185033 ?auto_185034 ) ) ( ON ?auto_185034 ?auto_185036 ) ( not ( = ?auto_185029 ?auto_185036 ) ) ( not ( = ?auto_185030 ?auto_185036 ) ) ( not ( = ?auto_185031 ?auto_185036 ) ) ( not ( = ?auto_185032 ?auto_185036 ) ) ( not ( = ?auto_185033 ?auto_185036 ) ) ( not ( = ?auto_185034 ?auto_185036 ) ) ( ON ?auto_185033 ?auto_185034 ) ( ON-TABLE ?auto_185035 ) ( ON ?auto_185037 ?auto_185035 ) ( ON ?auto_185036 ?auto_185037 ) ( not ( = ?auto_185035 ?auto_185037 ) ) ( not ( = ?auto_185035 ?auto_185036 ) ) ( not ( = ?auto_185035 ?auto_185034 ) ) ( not ( = ?auto_185035 ?auto_185033 ) ) ( not ( = ?auto_185037 ?auto_185036 ) ) ( not ( = ?auto_185037 ?auto_185034 ) ) ( not ( = ?auto_185037 ?auto_185033 ) ) ( not ( = ?auto_185029 ?auto_185035 ) ) ( not ( = ?auto_185029 ?auto_185037 ) ) ( not ( = ?auto_185030 ?auto_185035 ) ) ( not ( = ?auto_185030 ?auto_185037 ) ) ( not ( = ?auto_185031 ?auto_185035 ) ) ( not ( = ?auto_185031 ?auto_185037 ) ) ( not ( = ?auto_185032 ?auto_185035 ) ) ( not ( = ?auto_185032 ?auto_185037 ) ) ( ON ?auto_185032 ?auto_185033 ) ( ON ?auto_185031 ?auto_185032 ) ( ON ?auto_185030 ?auto_185031 ) ( CLEAR ?auto_185030 ) ( HOLDING ?auto_185029 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185029 )
      ( MAKE-6PILE ?auto_185029 ?auto_185030 ?auto_185031 ?auto_185032 ?auto_185033 ?auto_185034 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185038 - BLOCK
      ?auto_185039 - BLOCK
      ?auto_185040 - BLOCK
      ?auto_185041 - BLOCK
      ?auto_185042 - BLOCK
      ?auto_185043 - BLOCK
    )
    :vars
    (
      ?auto_185044 - BLOCK
      ?auto_185046 - BLOCK
      ?auto_185045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185038 ?auto_185039 ) ) ( not ( = ?auto_185038 ?auto_185040 ) ) ( not ( = ?auto_185038 ?auto_185041 ) ) ( not ( = ?auto_185038 ?auto_185042 ) ) ( not ( = ?auto_185038 ?auto_185043 ) ) ( not ( = ?auto_185039 ?auto_185040 ) ) ( not ( = ?auto_185039 ?auto_185041 ) ) ( not ( = ?auto_185039 ?auto_185042 ) ) ( not ( = ?auto_185039 ?auto_185043 ) ) ( not ( = ?auto_185040 ?auto_185041 ) ) ( not ( = ?auto_185040 ?auto_185042 ) ) ( not ( = ?auto_185040 ?auto_185043 ) ) ( not ( = ?auto_185041 ?auto_185042 ) ) ( not ( = ?auto_185041 ?auto_185043 ) ) ( not ( = ?auto_185042 ?auto_185043 ) ) ( ON ?auto_185043 ?auto_185044 ) ( not ( = ?auto_185038 ?auto_185044 ) ) ( not ( = ?auto_185039 ?auto_185044 ) ) ( not ( = ?auto_185040 ?auto_185044 ) ) ( not ( = ?auto_185041 ?auto_185044 ) ) ( not ( = ?auto_185042 ?auto_185044 ) ) ( not ( = ?auto_185043 ?auto_185044 ) ) ( ON ?auto_185042 ?auto_185043 ) ( ON-TABLE ?auto_185046 ) ( ON ?auto_185045 ?auto_185046 ) ( ON ?auto_185044 ?auto_185045 ) ( not ( = ?auto_185046 ?auto_185045 ) ) ( not ( = ?auto_185046 ?auto_185044 ) ) ( not ( = ?auto_185046 ?auto_185043 ) ) ( not ( = ?auto_185046 ?auto_185042 ) ) ( not ( = ?auto_185045 ?auto_185044 ) ) ( not ( = ?auto_185045 ?auto_185043 ) ) ( not ( = ?auto_185045 ?auto_185042 ) ) ( not ( = ?auto_185038 ?auto_185046 ) ) ( not ( = ?auto_185038 ?auto_185045 ) ) ( not ( = ?auto_185039 ?auto_185046 ) ) ( not ( = ?auto_185039 ?auto_185045 ) ) ( not ( = ?auto_185040 ?auto_185046 ) ) ( not ( = ?auto_185040 ?auto_185045 ) ) ( not ( = ?auto_185041 ?auto_185046 ) ) ( not ( = ?auto_185041 ?auto_185045 ) ) ( ON ?auto_185041 ?auto_185042 ) ( ON ?auto_185040 ?auto_185041 ) ( ON ?auto_185039 ?auto_185040 ) ( ON ?auto_185038 ?auto_185039 ) ( CLEAR ?auto_185038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185046 ?auto_185045 ?auto_185044 ?auto_185043 ?auto_185042 ?auto_185041 ?auto_185040 ?auto_185039 )
      ( MAKE-6PILE ?auto_185038 ?auto_185039 ?auto_185040 ?auto_185041 ?auto_185042 ?auto_185043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185049 - BLOCK
      ?auto_185050 - BLOCK
    )
    :vars
    (
      ?auto_185051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185051 ?auto_185050 ) ( CLEAR ?auto_185051 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185049 ) ( ON ?auto_185050 ?auto_185049 ) ( not ( = ?auto_185049 ?auto_185050 ) ) ( not ( = ?auto_185049 ?auto_185051 ) ) ( not ( = ?auto_185050 ?auto_185051 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185051 ?auto_185050 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185052 - BLOCK
      ?auto_185053 - BLOCK
    )
    :vars
    (
      ?auto_185054 - BLOCK
      ?auto_185055 - BLOCK
      ?auto_185056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185054 ?auto_185053 ) ( CLEAR ?auto_185054 ) ( ON-TABLE ?auto_185052 ) ( ON ?auto_185053 ?auto_185052 ) ( not ( = ?auto_185052 ?auto_185053 ) ) ( not ( = ?auto_185052 ?auto_185054 ) ) ( not ( = ?auto_185053 ?auto_185054 ) ) ( HOLDING ?auto_185055 ) ( CLEAR ?auto_185056 ) ( not ( = ?auto_185052 ?auto_185055 ) ) ( not ( = ?auto_185052 ?auto_185056 ) ) ( not ( = ?auto_185053 ?auto_185055 ) ) ( not ( = ?auto_185053 ?auto_185056 ) ) ( not ( = ?auto_185054 ?auto_185055 ) ) ( not ( = ?auto_185054 ?auto_185056 ) ) ( not ( = ?auto_185055 ?auto_185056 ) ) )
    :subtasks
    ( ( !STACK ?auto_185055 ?auto_185056 )
      ( MAKE-2PILE ?auto_185052 ?auto_185053 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185057 - BLOCK
      ?auto_185058 - BLOCK
    )
    :vars
    (
      ?auto_185060 - BLOCK
      ?auto_185059 - BLOCK
      ?auto_185061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185060 ?auto_185058 ) ( ON-TABLE ?auto_185057 ) ( ON ?auto_185058 ?auto_185057 ) ( not ( = ?auto_185057 ?auto_185058 ) ) ( not ( = ?auto_185057 ?auto_185060 ) ) ( not ( = ?auto_185058 ?auto_185060 ) ) ( CLEAR ?auto_185059 ) ( not ( = ?auto_185057 ?auto_185061 ) ) ( not ( = ?auto_185057 ?auto_185059 ) ) ( not ( = ?auto_185058 ?auto_185061 ) ) ( not ( = ?auto_185058 ?auto_185059 ) ) ( not ( = ?auto_185060 ?auto_185061 ) ) ( not ( = ?auto_185060 ?auto_185059 ) ) ( not ( = ?auto_185061 ?auto_185059 ) ) ( ON ?auto_185061 ?auto_185060 ) ( CLEAR ?auto_185061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185057 ?auto_185058 ?auto_185060 )
      ( MAKE-2PILE ?auto_185057 ?auto_185058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185062 - BLOCK
      ?auto_185063 - BLOCK
    )
    :vars
    (
      ?auto_185065 - BLOCK
      ?auto_185066 - BLOCK
      ?auto_185064 - BLOCK
      ?auto_185070 - BLOCK
      ?auto_185069 - BLOCK
      ?auto_185068 - BLOCK
      ?auto_185067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185065 ?auto_185063 ) ( ON-TABLE ?auto_185062 ) ( ON ?auto_185063 ?auto_185062 ) ( not ( = ?auto_185062 ?auto_185063 ) ) ( not ( = ?auto_185062 ?auto_185065 ) ) ( not ( = ?auto_185063 ?auto_185065 ) ) ( not ( = ?auto_185062 ?auto_185066 ) ) ( not ( = ?auto_185062 ?auto_185064 ) ) ( not ( = ?auto_185063 ?auto_185066 ) ) ( not ( = ?auto_185063 ?auto_185064 ) ) ( not ( = ?auto_185065 ?auto_185066 ) ) ( not ( = ?auto_185065 ?auto_185064 ) ) ( not ( = ?auto_185066 ?auto_185064 ) ) ( ON ?auto_185066 ?auto_185065 ) ( CLEAR ?auto_185066 ) ( HOLDING ?auto_185064 ) ( CLEAR ?auto_185070 ) ( ON-TABLE ?auto_185069 ) ( ON ?auto_185068 ?auto_185069 ) ( ON ?auto_185067 ?auto_185068 ) ( ON ?auto_185070 ?auto_185067 ) ( not ( = ?auto_185069 ?auto_185068 ) ) ( not ( = ?auto_185069 ?auto_185067 ) ) ( not ( = ?auto_185069 ?auto_185070 ) ) ( not ( = ?auto_185069 ?auto_185064 ) ) ( not ( = ?auto_185068 ?auto_185067 ) ) ( not ( = ?auto_185068 ?auto_185070 ) ) ( not ( = ?auto_185068 ?auto_185064 ) ) ( not ( = ?auto_185067 ?auto_185070 ) ) ( not ( = ?auto_185067 ?auto_185064 ) ) ( not ( = ?auto_185070 ?auto_185064 ) ) ( not ( = ?auto_185062 ?auto_185070 ) ) ( not ( = ?auto_185062 ?auto_185069 ) ) ( not ( = ?auto_185062 ?auto_185068 ) ) ( not ( = ?auto_185062 ?auto_185067 ) ) ( not ( = ?auto_185063 ?auto_185070 ) ) ( not ( = ?auto_185063 ?auto_185069 ) ) ( not ( = ?auto_185063 ?auto_185068 ) ) ( not ( = ?auto_185063 ?auto_185067 ) ) ( not ( = ?auto_185065 ?auto_185070 ) ) ( not ( = ?auto_185065 ?auto_185069 ) ) ( not ( = ?auto_185065 ?auto_185068 ) ) ( not ( = ?auto_185065 ?auto_185067 ) ) ( not ( = ?auto_185066 ?auto_185070 ) ) ( not ( = ?auto_185066 ?auto_185069 ) ) ( not ( = ?auto_185066 ?auto_185068 ) ) ( not ( = ?auto_185066 ?auto_185067 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185069 ?auto_185068 ?auto_185067 ?auto_185070 ?auto_185064 )
      ( MAKE-2PILE ?auto_185062 ?auto_185063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185071 - BLOCK
      ?auto_185072 - BLOCK
    )
    :vars
    (
      ?auto_185076 - BLOCK
      ?auto_185079 - BLOCK
      ?auto_185078 - BLOCK
      ?auto_185077 - BLOCK
      ?auto_185074 - BLOCK
      ?auto_185073 - BLOCK
      ?auto_185075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185076 ?auto_185072 ) ( ON-TABLE ?auto_185071 ) ( ON ?auto_185072 ?auto_185071 ) ( not ( = ?auto_185071 ?auto_185072 ) ) ( not ( = ?auto_185071 ?auto_185076 ) ) ( not ( = ?auto_185072 ?auto_185076 ) ) ( not ( = ?auto_185071 ?auto_185079 ) ) ( not ( = ?auto_185071 ?auto_185078 ) ) ( not ( = ?auto_185072 ?auto_185079 ) ) ( not ( = ?auto_185072 ?auto_185078 ) ) ( not ( = ?auto_185076 ?auto_185079 ) ) ( not ( = ?auto_185076 ?auto_185078 ) ) ( not ( = ?auto_185079 ?auto_185078 ) ) ( ON ?auto_185079 ?auto_185076 ) ( CLEAR ?auto_185077 ) ( ON-TABLE ?auto_185074 ) ( ON ?auto_185073 ?auto_185074 ) ( ON ?auto_185075 ?auto_185073 ) ( ON ?auto_185077 ?auto_185075 ) ( not ( = ?auto_185074 ?auto_185073 ) ) ( not ( = ?auto_185074 ?auto_185075 ) ) ( not ( = ?auto_185074 ?auto_185077 ) ) ( not ( = ?auto_185074 ?auto_185078 ) ) ( not ( = ?auto_185073 ?auto_185075 ) ) ( not ( = ?auto_185073 ?auto_185077 ) ) ( not ( = ?auto_185073 ?auto_185078 ) ) ( not ( = ?auto_185075 ?auto_185077 ) ) ( not ( = ?auto_185075 ?auto_185078 ) ) ( not ( = ?auto_185077 ?auto_185078 ) ) ( not ( = ?auto_185071 ?auto_185077 ) ) ( not ( = ?auto_185071 ?auto_185074 ) ) ( not ( = ?auto_185071 ?auto_185073 ) ) ( not ( = ?auto_185071 ?auto_185075 ) ) ( not ( = ?auto_185072 ?auto_185077 ) ) ( not ( = ?auto_185072 ?auto_185074 ) ) ( not ( = ?auto_185072 ?auto_185073 ) ) ( not ( = ?auto_185072 ?auto_185075 ) ) ( not ( = ?auto_185076 ?auto_185077 ) ) ( not ( = ?auto_185076 ?auto_185074 ) ) ( not ( = ?auto_185076 ?auto_185073 ) ) ( not ( = ?auto_185076 ?auto_185075 ) ) ( not ( = ?auto_185079 ?auto_185077 ) ) ( not ( = ?auto_185079 ?auto_185074 ) ) ( not ( = ?auto_185079 ?auto_185073 ) ) ( not ( = ?auto_185079 ?auto_185075 ) ) ( ON ?auto_185078 ?auto_185079 ) ( CLEAR ?auto_185078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185071 ?auto_185072 ?auto_185076 ?auto_185079 )
      ( MAKE-2PILE ?auto_185071 ?auto_185072 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185080 - BLOCK
      ?auto_185081 - BLOCK
    )
    :vars
    (
      ?auto_185088 - BLOCK
      ?auto_185082 - BLOCK
      ?auto_185083 - BLOCK
      ?auto_185086 - BLOCK
      ?auto_185087 - BLOCK
      ?auto_185085 - BLOCK
      ?auto_185084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185088 ?auto_185081 ) ( ON-TABLE ?auto_185080 ) ( ON ?auto_185081 ?auto_185080 ) ( not ( = ?auto_185080 ?auto_185081 ) ) ( not ( = ?auto_185080 ?auto_185088 ) ) ( not ( = ?auto_185081 ?auto_185088 ) ) ( not ( = ?auto_185080 ?auto_185082 ) ) ( not ( = ?auto_185080 ?auto_185083 ) ) ( not ( = ?auto_185081 ?auto_185082 ) ) ( not ( = ?auto_185081 ?auto_185083 ) ) ( not ( = ?auto_185088 ?auto_185082 ) ) ( not ( = ?auto_185088 ?auto_185083 ) ) ( not ( = ?auto_185082 ?auto_185083 ) ) ( ON ?auto_185082 ?auto_185088 ) ( ON-TABLE ?auto_185086 ) ( ON ?auto_185087 ?auto_185086 ) ( ON ?auto_185085 ?auto_185087 ) ( not ( = ?auto_185086 ?auto_185087 ) ) ( not ( = ?auto_185086 ?auto_185085 ) ) ( not ( = ?auto_185086 ?auto_185084 ) ) ( not ( = ?auto_185086 ?auto_185083 ) ) ( not ( = ?auto_185087 ?auto_185085 ) ) ( not ( = ?auto_185087 ?auto_185084 ) ) ( not ( = ?auto_185087 ?auto_185083 ) ) ( not ( = ?auto_185085 ?auto_185084 ) ) ( not ( = ?auto_185085 ?auto_185083 ) ) ( not ( = ?auto_185084 ?auto_185083 ) ) ( not ( = ?auto_185080 ?auto_185084 ) ) ( not ( = ?auto_185080 ?auto_185086 ) ) ( not ( = ?auto_185080 ?auto_185087 ) ) ( not ( = ?auto_185080 ?auto_185085 ) ) ( not ( = ?auto_185081 ?auto_185084 ) ) ( not ( = ?auto_185081 ?auto_185086 ) ) ( not ( = ?auto_185081 ?auto_185087 ) ) ( not ( = ?auto_185081 ?auto_185085 ) ) ( not ( = ?auto_185088 ?auto_185084 ) ) ( not ( = ?auto_185088 ?auto_185086 ) ) ( not ( = ?auto_185088 ?auto_185087 ) ) ( not ( = ?auto_185088 ?auto_185085 ) ) ( not ( = ?auto_185082 ?auto_185084 ) ) ( not ( = ?auto_185082 ?auto_185086 ) ) ( not ( = ?auto_185082 ?auto_185087 ) ) ( not ( = ?auto_185082 ?auto_185085 ) ) ( ON ?auto_185083 ?auto_185082 ) ( CLEAR ?auto_185083 ) ( HOLDING ?auto_185084 ) ( CLEAR ?auto_185085 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185086 ?auto_185087 ?auto_185085 ?auto_185084 )
      ( MAKE-2PILE ?auto_185080 ?auto_185081 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185089 - BLOCK
      ?auto_185090 - BLOCK
    )
    :vars
    (
      ?auto_185091 - BLOCK
      ?auto_185094 - BLOCK
      ?auto_185097 - BLOCK
      ?auto_185096 - BLOCK
      ?auto_185095 - BLOCK
      ?auto_185092 - BLOCK
      ?auto_185093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185091 ?auto_185090 ) ( ON-TABLE ?auto_185089 ) ( ON ?auto_185090 ?auto_185089 ) ( not ( = ?auto_185089 ?auto_185090 ) ) ( not ( = ?auto_185089 ?auto_185091 ) ) ( not ( = ?auto_185090 ?auto_185091 ) ) ( not ( = ?auto_185089 ?auto_185094 ) ) ( not ( = ?auto_185089 ?auto_185097 ) ) ( not ( = ?auto_185090 ?auto_185094 ) ) ( not ( = ?auto_185090 ?auto_185097 ) ) ( not ( = ?auto_185091 ?auto_185094 ) ) ( not ( = ?auto_185091 ?auto_185097 ) ) ( not ( = ?auto_185094 ?auto_185097 ) ) ( ON ?auto_185094 ?auto_185091 ) ( ON-TABLE ?auto_185096 ) ( ON ?auto_185095 ?auto_185096 ) ( ON ?auto_185092 ?auto_185095 ) ( not ( = ?auto_185096 ?auto_185095 ) ) ( not ( = ?auto_185096 ?auto_185092 ) ) ( not ( = ?auto_185096 ?auto_185093 ) ) ( not ( = ?auto_185096 ?auto_185097 ) ) ( not ( = ?auto_185095 ?auto_185092 ) ) ( not ( = ?auto_185095 ?auto_185093 ) ) ( not ( = ?auto_185095 ?auto_185097 ) ) ( not ( = ?auto_185092 ?auto_185093 ) ) ( not ( = ?auto_185092 ?auto_185097 ) ) ( not ( = ?auto_185093 ?auto_185097 ) ) ( not ( = ?auto_185089 ?auto_185093 ) ) ( not ( = ?auto_185089 ?auto_185096 ) ) ( not ( = ?auto_185089 ?auto_185095 ) ) ( not ( = ?auto_185089 ?auto_185092 ) ) ( not ( = ?auto_185090 ?auto_185093 ) ) ( not ( = ?auto_185090 ?auto_185096 ) ) ( not ( = ?auto_185090 ?auto_185095 ) ) ( not ( = ?auto_185090 ?auto_185092 ) ) ( not ( = ?auto_185091 ?auto_185093 ) ) ( not ( = ?auto_185091 ?auto_185096 ) ) ( not ( = ?auto_185091 ?auto_185095 ) ) ( not ( = ?auto_185091 ?auto_185092 ) ) ( not ( = ?auto_185094 ?auto_185093 ) ) ( not ( = ?auto_185094 ?auto_185096 ) ) ( not ( = ?auto_185094 ?auto_185095 ) ) ( not ( = ?auto_185094 ?auto_185092 ) ) ( ON ?auto_185097 ?auto_185094 ) ( CLEAR ?auto_185092 ) ( ON ?auto_185093 ?auto_185097 ) ( CLEAR ?auto_185093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185089 ?auto_185090 ?auto_185091 ?auto_185094 ?auto_185097 )
      ( MAKE-2PILE ?auto_185089 ?auto_185090 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185098 - BLOCK
      ?auto_185099 - BLOCK
    )
    :vars
    (
      ?auto_185101 - BLOCK
      ?auto_185102 - BLOCK
      ?auto_185106 - BLOCK
      ?auto_185103 - BLOCK
      ?auto_185105 - BLOCK
      ?auto_185104 - BLOCK
      ?auto_185100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185101 ?auto_185099 ) ( ON-TABLE ?auto_185098 ) ( ON ?auto_185099 ?auto_185098 ) ( not ( = ?auto_185098 ?auto_185099 ) ) ( not ( = ?auto_185098 ?auto_185101 ) ) ( not ( = ?auto_185099 ?auto_185101 ) ) ( not ( = ?auto_185098 ?auto_185102 ) ) ( not ( = ?auto_185098 ?auto_185106 ) ) ( not ( = ?auto_185099 ?auto_185102 ) ) ( not ( = ?auto_185099 ?auto_185106 ) ) ( not ( = ?auto_185101 ?auto_185102 ) ) ( not ( = ?auto_185101 ?auto_185106 ) ) ( not ( = ?auto_185102 ?auto_185106 ) ) ( ON ?auto_185102 ?auto_185101 ) ( ON-TABLE ?auto_185103 ) ( ON ?auto_185105 ?auto_185103 ) ( not ( = ?auto_185103 ?auto_185105 ) ) ( not ( = ?auto_185103 ?auto_185104 ) ) ( not ( = ?auto_185103 ?auto_185100 ) ) ( not ( = ?auto_185103 ?auto_185106 ) ) ( not ( = ?auto_185105 ?auto_185104 ) ) ( not ( = ?auto_185105 ?auto_185100 ) ) ( not ( = ?auto_185105 ?auto_185106 ) ) ( not ( = ?auto_185104 ?auto_185100 ) ) ( not ( = ?auto_185104 ?auto_185106 ) ) ( not ( = ?auto_185100 ?auto_185106 ) ) ( not ( = ?auto_185098 ?auto_185100 ) ) ( not ( = ?auto_185098 ?auto_185103 ) ) ( not ( = ?auto_185098 ?auto_185105 ) ) ( not ( = ?auto_185098 ?auto_185104 ) ) ( not ( = ?auto_185099 ?auto_185100 ) ) ( not ( = ?auto_185099 ?auto_185103 ) ) ( not ( = ?auto_185099 ?auto_185105 ) ) ( not ( = ?auto_185099 ?auto_185104 ) ) ( not ( = ?auto_185101 ?auto_185100 ) ) ( not ( = ?auto_185101 ?auto_185103 ) ) ( not ( = ?auto_185101 ?auto_185105 ) ) ( not ( = ?auto_185101 ?auto_185104 ) ) ( not ( = ?auto_185102 ?auto_185100 ) ) ( not ( = ?auto_185102 ?auto_185103 ) ) ( not ( = ?auto_185102 ?auto_185105 ) ) ( not ( = ?auto_185102 ?auto_185104 ) ) ( ON ?auto_185106 ?auto_185102 ) ( ON ?auto_185100 ?auto_185106 ) ( CLEAR ?auto_185100 ) ( HOLDING ?auto_185104 ) ( CLEAR ?auto_185105 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185103 ?auto_185105 ?auto_185104 )
      ( MAKE-2PILE ?auto_185098 ?auto_185099 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185107 - BLOCK
      ?auto_185108 - BLOCK
    )
    :vars
    (
      ?auto_185109 - BLOCK
      ?auto_185113 - BLOCK
      ?auto_185115 - BLOCK
      ?auto_185111 - BLOCK
      ?auto_185114 - BLOCK
      ?auto_185110 - BLOCK
      ?auto_185112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185109 ?auto_185108 ) ( ON-TABLE ?auto_185107 ) ( ON ?auto_185108 ?auto_185107 ) ( not ( = ?auto_185107 ?auto_185108 ) ) ( not ( = ?auto_185107 ?auto_185109 ) ) ( not ( = ?auto_185108 ?auto_185109 ) ) ( not ( = ?auto_185107 ?auto_185113 ) ) ( not ( = ?auto_185107 ?auto_185115 ) ) ( not ( = ?auto_185108 ?auto_185113 ) ) ( not ( = ?auto_185108 ?auto_185115 ) ) ( not ( = ?auto_185109 ?auto_185113 ) ) ( not ( = ?auto_185109 ?auto_185115 ) ) ( not ( = ?auto_185113 ?auto_185115 ) ) ( ON ?auto_185113 ?auto_185109 ) ( ON-TABLE ?auto_185111 ) ( ON ?auto_185114 ?auto_185111 ) ( not ( = ?auto_185111 ?auto_185114 ) ) ( not ( = ?auto_185111 ?auto_185110 ) ) ( not ( = ?auto_185111 ?auto_185112 ) ) ( not ( = ?auto_185111 ?auto_185115 ) ) ( not ( = ?auto_185114 ?auto_185110 ) ) ( not ( = ?auto_185114 ?auto_185112 ) ) ( not ( = ?auto_185114 ?auto_185115 ) ) ( not ( = ?auto_185110 ?auto_185112 ) ) ( not ( = ?auto_185110 ?auto_185115 ) ) ( not ( = ?auto_185112 ?auto_185115 ) ) ( not ( = ?auto_185107 ?auto_185112 ) ) ( not ( = ?auto_185107 ?auto_185111 ) ) ( not ( = ?auto_185107 ?auto_185114 ) ) ( not ( = ?auto_185107 ?auto_185110 ) ) ( not ( = ?auto_185108 ?auto_185112 ) ) ( not ( = ?auto_185108 ?auto_185111 ) ) ( not ( = ?auto_185108 ?auto_185114 ) ) ( not ( = ?auto_185108 ?auto_185110 ) ) ( not ( = ?auto_185109 ?auto_185112 ) ) ( not ( = ?auto_185109 ?auto_185111 ) ) ( not ( = ?auto_185109 ?auto_185114 ) ) ( not ( = ?auto_185109 ?auto_185110 ) ) ( not ( = ?auto_185113 ?auto_185112 ) ) ( not ( = ?auto_185113 ?auto_185111 ) ) ( not ( = ?auto_185113 ?auto_185114 ) ) ( not ( = ?auto_185113 ?auto_185110 ) ) ( ON ?auto_185115 ?auto_185113 ) ( ON ?auto_185112 ?auto_185115 ) ( CLEAR ?auto_185114 ) ( ON ?auto_185110 ?auto_185112 ) ( CLEAR ?auto_185110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185107 ?auto_185108 ?auto_185109 ?auto_185113 ?auto_185115 ?auto_185112 )
      ( MAKE-2PILE ?auto_185107 ?auto_185108 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185116 - BLOCK
      ?auto_185117 - BLOCK
    )
    :vars
    (
      ?auto_185123 - BLOCK
      ?auto_185122 - BLOCK
      ?auto_185124 - BLOCK
      ?auto_185118 - BLOCK
      ?auto_185120 - BLOCK
      ?auto_185119 - BLOCK
      ?auto_185121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185123 ?auto_185117 ) ( ON-TABLE ?auto_185116 ) ( ON ?auto_185117 ?auto_185116 ) ( not ( = ?auto_185116 ?auto_185117 ) ) ( not ( = ?auto_185116 ?auto_185123 ) ) ( not ( = ?auto_185117 ?auto_185123 ) ) ( not ( = ?auto_185116 ?auto_185122 ) ) ( not ( = ?auto_185116 ?auto_185124 ) ) ( not ( = ?auto_185117 ?auto_185122 ) ) ( not ( = ?auto_185117 ?auto_185124 ) ) ( not ( = ?auto_185123 ?auto_185122 ) ) ( not ( = ?auto_185123 ?auto_185124 ) ) ( not ( = ?auto_185122 ?auto_185124 ) ) ( ON ?auto_185122 ?auto_185123 ) ( ON-TABLE ?auto_185118 ) ( not ( = ?auto_185118 ?auto_185120 ) ) ( not ( = ?auto_185118 ?auto_185119 ) ) ( not ( = ?auto_185118 ?auto_185121 ) ) ( not ( = ?auto_185118 ?auto_185124 ) ) ( not ( = ?auto_185120 ?auto_185119 ) ) ( not ( = ?auto_185120 ?auto_185121 ) ) ( not ( = ?auto_185120 ?auto_185124 ) ) ( not ( = ?auto_185119 ?auto_185121 ) ) ( not ( = ?auto_185119 ?auto_185124 ) ) ( not ( = ?auto_185121 ?auto_185124 ) ) ( not ( = ?auto_185116 ?auto_185121 ) ) ( not ( = ?auto_185116 ?auto_185118 ) ) ( not ( = ?auto_185116 ?auto_185120 ) ) ( not ( = ?auto_185116 ?auto_185119 ) ) ( not ( = ?auto_185117 ?auto_185121 ) ) ( not ( = ?auto_185117 ?auto_185118 ) ) ( not ( = ?auto_185117 ?auto_185120 ) ) ( not ( = ?auto_185117 ?auto_185119 ) ) ( not ( = ?auto_185123 ?auto_185121 ) ) ( not ( = ?auto_185123 ?auto_185118 ) ) ( not ( = ?auto_185123 ?auto_185120 ) ) ( not ( = ?auto_185123 ?auto_185119 ) ) ( not ( = ?auto_185122 ?auto_185121 ) ) ( not ( = ?auto_185122 ?auto_185118 ) ) ( not ( = ?auto_185122 ?auto_185120 ) ) ( not ( = ?auto_185122 ?auto_185119 ) ) ( ON ?auto_185124 ?auto_185122 ) ( ON ?auto_185121 ?auto_185124 ) ( ON ?auto_185119 ?auto_185121 ) ( CLEAR ?auto_185119 ) ( HOLDING ?auto_185120 ) ( CLEAR ?auto_185118 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185118 ?auto_185120 )
      ( MAKE-2PILE ?auto_185116 ?auto_185117 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187143 - BLOCK
      ?auto_187144 - BLOCK
    )
    :vars
    (
      ?auto_187145 - BLOCK
      ?auto_187147 - BLOCK
      ?auto_187146 - BLOCK
      ?auto_187149 - BLOCK
      ?auto_187148 - BLOCK
      ?auto_187150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187145 ?auto_187144 ) ( ON-TABLE ?auto_187143 ) ( ON ?auto_187144 ?auto_187143 ) ( not ( = ?auto_187143 ?auto_187144 ) ) ( not ( = ?auto_187143 ?auto_187145 ) ) ( not ( = ?auto_187144 ?auto_187145 ) ) ( not ( = ?auto_187143 ?auto_187147 ) ) ( not ( = ?auto_187143 ?auto_187146 ) ) ( not ( = ?auto_187144 ?auto_187147 ) ) ( not ( = ?auto_187144 ?auto_187146 ) ) ( not ( = ?auto_187145 ?auto_187147 ) ) ( not ( = ?auto_187145 ?auto_187146 ) ) ( not ( = ?auto_187147 ?auto_187146 ) ) ( ON ?auto_187147 ?auto_187145 ) ( not ( = ?auto_187149 ?auto_187148 ) ) ( not ( = ?auto_187149 ?auto_187150 ) ) ( not ( = ?auto_187149 ?auto_187146 ) ) ( not ( = ?auto_187148 ?auto_187150 ) ) ( not ( = ?auto_187148 ?auto_187146 ) ) ( not ( = ?auto_187150 ?auto_187146 ) ) ( not ( = ?auto_187143 ?auto_187150 ) ) ( not ( = ?auto_187143 ?auto_187149 ) ) ( not ( = ?auto_187143 ?auto_187148 ) ) ( not ( = ?auto_187144 ?auto_187150 ) ) ( not ( = ?auto_187144 ?auto_187149 ) ) ( not ( = ?auto_187144 ?auto_187148 ) ) ( not ( = ?auto_187145 ?auto_187150 ) ) ( not ( = ?auto_187145 ?auto_187149 ) ) ( not ( = ?auto_187145 ?auto_187148 ) ) ( not ( = ?auto_187147 ?auto_187150 ) ) ( not ( = ?auto_187147 ?auto_187149 ) ) ( not ( = ?auto_187147 ?auto_187148 ) ) ( ON ?auto_187146 ?auto_187147 ) ( ON ?auto_187150 ?auto_187146 ) ( ON ?auto_187148 ?auto_187150 ) ( ON ?auto_187149 ?auto_187148 ) ( CLEAR ?auto_187149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187143 ?auto_187144 ?auto_187145 ?auto_187147 ?auto_187146 ?auto_187150 ?auto_187148 )
      ( MAKE-2PILE ?auto_187143 ?auto_187144 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185134 - BLOCK
      ?auto_185135 - BLOCK
    )
    :vars
    (
      ?auto_185141 - BLOCK
      ?auto_185140 - BLOCK
      ?auto_185136 - BLOCK
      ?auto_185139 - BLOCK
      ?auto_185142 - BLOCK
      ?auto_185138 - BLOCK
      ?auto_185137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185141 ?auto_185135 ) ( ON-TABLE ?auto_185134 ) ( ON ?auto_185135 ?auto_185134 ) ( not ( = ?auto_185134 ?auto_185135 ) ) ( not ( = ?auto_185134 ?auto_185141 ) ) ( not ( = ?auto_185135 ?auto_185141 ) ) ( not ( = ?auto_185134 ?auto_185140 ) ) ( not ( = ?auto_185134 ?auto_185136 ) ) ( not ( = ?auto_185135 ?auto_185140 ) ) ( not ( = ?auto_185135 ?auto_185136 ) ) ( not ( = ?auto_185141 ?auto_185140 ) ) ( not ( = ?auto_185141 ?auto_185136 ) ) ( not ( = ?auto_185140 ?auto_185136 ) ) ( ON ?auto_185140 ?auto_185141 ) ( not ( = ?auto_185139 ?auto_185142 ) ) ( not ( = ?auto_185139 ?auto_185138 ) ) ( not ( = ?auto_185139 ?auto_185137 ) ) ( not ( = ?auto_185139 ?auto_185136 ) ) ( not ( = ?auto_185142 ?auto_185138 ) ) ( not ( = ?auto_185142 ?auto_185137 ) ) ( not ( = ?auto_185142 ?auto_185136 ) ) ( not ( = ?auto_185138 ?auto_185137 ) ) ( not ( = ?auto_185138 ?auto_185136 ) ) ( not ( = ?auto_185137 ?auto_185136 ) ) ( not ( = ?auto_185134 ?auto_185137 ) ) ( not ( = ?auto_185134 ?auto_185139 ) ) ( not ( = ?auto_185134 ?auto_185142 ) ) ( not ( = ?auto_185134 ?auto_185138 ) ) ( not ( = ?auto_185135 ?auto_185137 ) ) ( not ( = ?auto_185135 ?auto_185139 ) ) ( not ( = ?auto_185135 ?auto_185142 ) ) ( not ( = ?auto_185135 ?auto_185138 ) ) ( not ( = ?auto_185141 ?auto_185137 ) ) ( not ( = ?auto_185141 ?auto_185139 ) ) ( not ( = ?auto_185141 ?auto_185142 ) ) ( not ( = ?auto_185141 ?auto_185138 ) ) ( not ( = ?auto_185140 ?auto_185137 ) ) ( not ( = ?auto_185140 ?auto_185139 ) ) ( not ( = ?auto_185140 ?auto_185142 ) ) ( not ( = ?auto_185140 ?auto_185138 ) ) ( ON ?auto_185136 ?auto_185140 ) ( ON ?auto_185137 ?auto_185136 ) ( ON ?auto_185138 ?auto_185137 ) ( ON ?auto_185142 ?auto_185138 ) ( CLEAR ?auto_185142 ) ( HOLDING ?auto_185139 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185139 )
      ( MAKE-2PILE ?auto_185134 ?auto_185135 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185143 - BLOCK
      ?auto_185144 - BLOCK
    )
    :vars
    (
      ?auto_185145 - BLOCK
      ?auto_185149 - BLOCK
      ?auto_185151 - BLOCK
      ?auto_185150 - BLOCK
      ?auto_185148 - BLOCK
      ?auto_185146 - BLOCK
      ?auto_185147 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185145 ?auto_185144 ) ( ON-TABLE ?auto_185143 ) ( ON ?auto_185144 ?auto_185143 ) ( not ( = ?auto_185143 ?auto_185144 ) ) ( not ( = ?auto_185143 ?auto_185145 ) ) ( not ( = ?auto_185144 ?auto_185145 ) ) ( not ( = ?auto_185143 ?auto_185149 ) ) ( not ( = ?auto_185143 ?auto_185151 ) ) ( not ( = ?auto_185144 ?auto_185149 ) ) ( not ( = ?auto_185144 ?auto_185151 ) ) ( not ( = ?auto_185145 ?auto_185149 ) ) ( not ( = ?auto_185145 ?auto_185151 ) ) ( not ( = ?auto_185149 ?auto_185151 ) ) ( ON ?auto_185149 ?auto_185145 ) ( not ( = ?auto_185150 ?auto_185148 ) ) ( not ( = ?auto_185150 ?auto_185146 ) ) ( not ( = ?auto_185150 ?auto_185147 ) ) ( not ( = ?auto_185150 ?auto_185151 ) ) ( not ( = ?auto_185148 ?auto_185146 ) ) ( not ( = ?auto_185148 ?auto_185147 ) ) ( not ( = ?auto_185148 ?auto_185151 ) ) ( not ( = ?auto_185146 ?auto_185147 ) ) ( not ( = ?auto_185146 ?auto_185151 ) ) ( not ( = ?auto_185147 ?auto_185151 ) ) ( not ( = ?auto_185143 ?auto_185147 ) ) ( not ( = ?auto_185143 ?auto_185150 ) ) ( not ( = ?auto_185143 ?auto_185148 ) ) ( not ( = ?auto_185143 ?auto_185146 ) ) ( not ( = ?auto_185144 ?auto_185147 ) ) ( not ( = ?auto_185144 ?auto_185150 ) ) ( not ( = ?auto_185144 ?auto_185148 ) ) ( not ( = ?auto_185144 ?auto_185146 ) ) ( not ( = ?auto_185145 ?auto_185147 ) ) ( not ( = ?auto_185145 ?auto_185150 ) ) ( not ( = ?auto_185145 ?auto_185148 ) ) ( not ( = ?auto_185145 ?auto_185146 ) ) ( not ( = ?auto_185149 ?auto_185147 ) ) ( not ( = ?auto_185149 ?auto_185150 ) ) ( not ( = ?auto_185149 ?auto_185148 ) ) ( not ( = ?auto_185149 ?auto_185146 ) ) ( ON ?auto_185151 ?auto_185149 ) ( ON ?auto_185147 ?auto_185151 ) ( ON ?auto_185146 ?auto_185147 ) ( ON ?auto_185148 ?auto_185146 ) ( ON ?auto_185150 ?auto_185148 ) ( CLEAR ?auto_185150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185143 ?auto_185144 ?auto_185145 ?auto_185149 ?auto_185151 ?auto_185147 ?auto_185146 ?auto_185148 )
      ( MAKE-2PILE ?auto_185143 ?auto_185144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185159 - BLOCK
      ?auto_185160 - BLOCK
      ?auto_185161 - BLOCK
      ?auto_185162 - BLOCK
      ?auto_185163 - BLOCK
      ?auto_185164 - BLOCK
      ?auto_185165 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_185165 ) ( CLEAR ?auto_185164 ) ( ON-TABLE ?auto_185159 ) ( ON ?auto_185160 ?auto_185159 ) ( ON ?auto_185161 ?auto_185160 ) ( ON ?auto_185162 ?auto_185161 ) ( ON ?auto_185163 ?auto_185162 ) ( ON ?auto_185164 ?auto_185163 ) ( not ( = ?auto_185159 ?auto_185160 ) ) ( not ( = ?auto_185159 ?auto_185161 ) ) ( not ( = ?auto_185159 ?auto_185162 ) ) ( not ( = ?auto_185159 ?auto_185163 ) ) ( not ( = ?auto_185159 ?auto_185164 ) ) ( not ( = ?auto_185159 ?auto_185165 ) ) ( not ( = ?auto_185160 ?auto_185161 ) ) ( not ( = ?auto_185160 ?auto_185162 ) ) ( not ( = ?auto_185160 ?auto_185163 ) ) ( not ( = ?auto_185160 ?auto_185164 ) ) ( not ( = ?auto_185160 ?auto_185165 ) ) ( not ( = ?auto_185161 ?auto_185162 ) ) ( not ( = ?auto_185161 ?auto_185163 ) ) ( not ( = ?auto_185161 ?auto_185164 ) ) ( not ( = ?auto_185161 ?auto_185165 ) ) ( not ( = ?auto_185162 ?auto_185163 ) ) ( not ( = ?auto_185162 ?auto_185164 ) ) ( not ( = ?auto_185162 ?auto_185165 ) ) ( not ( = ?auto_185163 ?auto_185164 ) ) ( not ( = ?auto_185163 ?auto_185165 ) ) ( not ( = ?auto_185164 ?auto_185165 ) ) )
    :subtasks
    ( ( !STACK ?auto_185165 ?auto_185164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185166 - BLOCK
      ?auto_185167 - BLOCK
      ?auto_185168 - BLOCK
      ?auto_185169 - BLOCK
      ?auto_185170 - BLOCK
      ?auto_185171 - BLOCK
      ?auto_185172 - BLOCK
    )
    :vars
    (
      ?auto_185173 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_185171 ) ( ON-TABLE ?auto_185166 ) ( ON ?auto_185167 ?auto_185166 ) ( ON ?auto_185168 ?auto_185167 ) ( ON ?auto_185169 ?auto_185168 ) ( ON ?auto_185170 ?auto_185169 ) ( ON ?auto_185171 ?auto_185170 ) ( not ( = ?auto_185166 ?auto_185167 ) ) ( not ( = ?auto_185166 ?auto_185168 ) ) ( not ( = ?auto_185166 ?auto_185169 ) ) ( not ( = ?auto_185166 ?auto_185170 ) ) ( not ( = ?auto_185166 ?auto_185171 ) ) ( not ( = ?auto_185166 ?auto_185172 ) ) ( not ( = ?auto_185167 ?auto_185168 ) ) ( not ( = ?auto_185167 ?auto_185169 ) ) ( not ( = ?auto_185167 ?auto_185170 ) ) ( not ( = ?auto_185167 ?auto_185171 ) ) ( not ( = ?auto_185167 ?auto_185172 ) ) ( not ( = ?auto_185168 ?auto_185169 ) ) ( not ( = ?auto_185168 ?auto_185170 ) ) ( not ( = ?auto_185168 ?auto_185171 ) ) ( not ( = ?auto_185168 ?auto_185172 ) ) ( not ( = ?auto_185169 ?auto_185170 ) ) ( not ( = ?auto_185169 ?auto_185171 ) ) ( not ( = ?auto_185169 ?auto_185172 ) ) ( not ( = ?auto_185170 ?auto_185171 ) ) ( not ( = ?auto_185170 ?auto_185172 ) ) ( not ( = ?auto_185171 ?auto_185172 ) ) ( ON ?auto_185172 ?auto_185173 ) ( CLEAR ?auto_185172 ) ( HAND-EMPTY ) ( not ( = ?auto_185166 ?auto_185173 ) ) ( not ( = ?auto_185167 ?auto_185173 ) ) ( not ( = ?auto_185168 ?auto_185173 ) ) ( not ( = ?auto_185169 ?auto_185173 ) ) ( not ( = ?auto_185170 ?auto_185173 ) ) ( not ( = ?auto_185171 ?auto_185173 ) ) ( not ( = ?auto_185172 ?auto_185173 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185172 ?auto_185173 )
      ( MAKE-7PILE ?auto_185166 ?auto_185167 ?auto_185168 ?auto_185169 ?auto_185170 ?auto_185171 ?auto_185172 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185174 - BLOCK
      ?auto_185175 - BLOCK
      ?auto_185176 - BLOCK
      ?auto_185177 - BLOCK
      ?auto_185178 - BLOCK
      ?auto_185179 - BLOCK
      ?auto_185180 - BLOCK
    )
    :vars
    (
      ?auto_185181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185174 ) ( ON ?auto_185175 ?auto_185174 ) ( ON ?auto_185176 ?auto_185175 ) ( ON ?auto_185177 ?auto_185176 ) ( ON ?auto_185178 ?auto_185177 ) ( not ( = ?auto_185174 ?auto_185175 ) ) ( not ( = ?auto_185174 ?auto_185176 ) ) ( not ( = ?auto_185174 ?auto_185177 ) ) ( not ( = ?auto_185174 ?auto_185178 ) ) ( not ( = ?auto_185174 ?auto_185179 ) ) ( not ( = ?auto_185174 ?auto_185180 ) ) ( not ( = ?auto_185175 ?auto_185176 ) ) ( not ( = ?auto_185175 ?auto_185177 ) ) ( not ( = ?auto_185175 ?auto_185178 ) ) ( not ( = ?auto_185175 ?auto_185179 ) ) ( not ( = ?auto_185175 ?auto_185180 ) ) ( not ( = ?auto_185176 ?auto_185177 ) ) ( not ( = ?auto_185176 ?auto_185178 ) ) ( not ( = ?auto_185176 ?auto_185179 ) ) ( not ( = ?auto_185176 ?auto_185180 ) ) ( not ( = ?auto_185177 ?auto_185178 ) ) ( not ( = ?auto_185177 ?auto_185179 ) ) ( not ( = ?auto_185177 ?auto_185180 ) ) ( not ( = ?auto_185178 ?auto_185179 ) ) ( not ( = ?auto_185178 ?auto_185180 ) ) ( not ( = ?auto_185179 ?auto_185180 ) ) ( ON ?auto_185180 ?auto_185181 ) ( CLEAR ?auto_185180 ) ( not ( = ?auto_185174 ?auto_185181 ) ) ( not ( = ?auto_185175 ?auto_185181 ) ) ( not ( = ?auto_185176 ?auto_185181 ) ) ( not ( = ?auto_185177 ?auto_185181 ) ) ( not ( = ?auto_185178 ?auto_185181 ) ) ( not ( = ?auto_185179 ?auto_185181 ) ) ( not ( = ?auto_185180 ?auto_185181 ) ) ( HOLDING ?auto_185179 ) ( CLEAR ?auto_185178 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185174 ?auto_185175 ?auto_185176 ?auto_185177 ?auto_185178 ?auto_185179 )
      ( MAKE-7PILE ?auto_185174 ?auto_185175 ?auto_185176 ?auto_185177 ?auto_185178 ?auto_185179 ?auto_185180 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185182 - BLOCK
      ?auto_185183 - BLOCK
      ?auto_185184 - BLOCK
      ?auto_185185 - BLOCK
      ?auto_185186 - BLOCK
      ?auto_185187 - BLOCK
      ?auto_185188 - BLOCK
    )
    :vars
    (
      ?auto_185189 - BLOCK
      ?auto_185190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185182 ) ( ON ?auto_185183 ?auto_185182 ) ( ON ?auto_185184 ?auto_185183 ) ( ON ?auto_185185 ?auto_185184 ) ( ON ?auto_185186 ?auto_185185 ) ( not ( = ?auto_185182 ?auto_185183 ) ) ( not ( = ?auto_185182 ?auto_185184 ) ) ( not ( = ?auto_185182 ?auto_185185 ) ) ( not ( = ?auto_185182 ?auto_185186 ) ) ( not ( = ?auto_185182 ?auto_185187 ) ) ( not ( = ?auto_185182 ?auto_185188 ) ) ( not ( = ?auto_185183 ?auto_185184 ) ) ( not ( = ?auto_185183 ?auto_185185 ) ) ( not ( = ?auto_185183 ?auto_185186 ) ) ( not ( = ?auto_185183 ?auto_185187 ) ) ( not ( = ?auto_185183 ?auto_185188 ) ) ( not ( = ?auto_185184 ?auto_185185 ) ) ( not ( = ?auto_185184 ?auto_185186 ) ) ( not ( = ?auto_185184 ?auto_185187 ) ) ( not ( = ?auto_185184 ?auto_185188 ) ) ( not ( = ?auto_185185 ?auto_185186 ) ) ( not ( = ?auto_185185 ?auto_185187 ) ) ( not ( = ?auto_185185 ?auto_185188 ) ) ( not ( = ?auto_185186 ?auto_185187 ) ) ( not ( = ?auto_185186 ?auto_185188 ) ) ( not ( = ?auto_185187 ?auto_185188 ) ) ( ON ?auto_185188 ?auto_185189 ) ( not ( = ?auto_185182 ?auto_185189 ) ) ( not ( = ?auto_185183 ?auto_185189 ) ) ( not ( = ?auto_185184 ?auto_185189 ) ) ( not ( = ?auto_185185 ?auto_185189 ) ) ( not ( = ?auto_185186 ?auto_185189 ) ) ( not ( = ?auto_185187 ?auto_185189 ) ) ( not ( = ?auto_185188 ?auto_185189 ) ) ( CLEAR ?auto_185186 ) ( ON ?auto_185187 ?auto_185188 ) ( CLEAR ?auto_185187 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185190 ) ( ON ?auto_185189 ?auto_185190 ) ( not ( = ?auto_185190 ?auto_185189 ) ) ( not ( = ?auto_185190 ?auto_185188 ) ) ( not ( = ?auto_185190 ?auto_185187 ) ) ( not ( = ?auto_185182 ?auto_185190 ) ) ( not ( = ?auto_185183 ?auto_185190 ) ) ( not ( = ?auto_185184 ?auto_185190 ) ) ( not ( = ?auto_185185 ?auto_185190 ) ) ( not ( = ?auto_185186 ?auto_185190 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185190 ?auto_185189 ?auto_185188 )
      ( MAKE-7PILE ?auto_185182 ?auto_185183 ?auto_185184 ?auto_185185 ?auto_185186 ?auto_185187 ?auto_185188 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185191 - BLOCK
      ?auto_185192 - BLOCK
      ?auto_185193 - BLOCK
      ?auto_185194 - BLOCK
      ?auto_185195 - BLOCK
      ?auto_185196 - BLOCK
      ?auto_185197 - BLOCK
    )
    :vars
    (
      ?auto_185199 - BLOCK
      ?auto_185198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185191 ) ( ON ?auto_185192 ?auto_185191 ) ( ON ?auto_185193 ?auto_185192 ) ( ON ?auto_185194 ?auto_185193 ) ( not ( = ?auto_185191 ?auto_185192 ) ) ( not ( = ?auto_185191 ?auto_185193 ) ) ( not ( = ?auto_185191 ?auto_185194 ) ) ( not ( = ?auto_185191 ?auto_185195 ) ) ( not ( = ?auto_185191 ?auto_185196 ) ) ( not ( = ?auto_185191 ?auto_185197 ) ) ( not ( = ?auto_185192 ?auto_185193 ) ) ( not ( = ?auto_185192 ?auto_185194 ) ) ( not ( = ?auto_185192 ?auto_185195 ) ) ( not ( = ?auto_185192 ?auto_185196 ) ) ( not ( = ?auto_185192 ?auto_185197 ) ) ( not ( = ?auto_185193 ?auto_185194 ) ) ( not ( = ?auto_185193 ?auto_185195 ) ) ( not ( = ?auto_185193 ?auto_185196 ) ) ( not ( = ?auto_185193 ?auto_185197 ) ) ( not ( = ?auto_185194 ?auto_185195 ) ) ( not ( = ?auto_185194 ?auto_185196 ) ) ( not ( = ?auto_185194 ?auto_185197 ) ) ( not ( = ?auto_185195 ?auto_185196 ) ) ( not ( = ?auto_185195 ?auto_185197 ) ) ( not ( = ?auto_185196 ?auto_185197 ) ) ( ON ?auto_185197 ?auto_185199 ) ( not ( = ?auto_185191 ?auto_185199 ) ) ( not ( = ?auto_185192 ?auto_185199 ) ) ( not ( = ?auto_185193 ?auto_185199 ) ) ( not ( = ?auto_185194 ?auto_185199 ) ) ( not ( = ?auto_185195 ?auto_185199 ) ) ( not ( = ?auto_185196 ?auto_185199 ) ) ( not ( = ?auto_185197 ?auto_185199 ) ) ( ON ?auto_185196 ?auto_185197 ) ( CLEAR ?auto_185196 ) ( ON-TABLE ?auto_185198 ) ( ON ?auto_185199 ?auto_185198 ) ( not ( = ?auto_185198 ?auto_185199 ) ) ( not ( = ?auto_185198 ?auto_185197 ) ) ( not ( = ?auto_185198 ?auto_185196 ) ) ( not ( = ?auto_185191 ?auto_185198 ) ) ( not ( = ?auto_185192 ?auto_185198 ) ) ( not ( = ?auto_185193 ?auto_185198 ) ) ( not ( = ?auto_185194 ?auto_185198 ) ) ( not ( = ?auto_185195 ?auto_185198 ) ) ( HOLDING ?auto_185195 ) ( CLEAR ?auto_185194 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185191 ?auto_185192 ?auto_185193 ?auto_185194 ?auto_185195 )
      ( MAKE-7PILE ?auto_185191 ?auto_185192 ?auto_185193 ?auto_185194 ?auto_185195 ?auto_185196 ?auto_185197 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185200 - BLOCK
      ?auto_185201 - BLOCK
      ?auto_185202 - BLOCK
      ?auto_185203 - BLOCK
      ?auto_185204 - BLOCK
      ?auto_185205 - BLOCK
      ?auto_185206 - BLOCK
    )
    :vars
    (
      ?auto_185208 - BLOCK
      ?auto_185207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185200 ) ( ON ?auto_185201 ?auto_185200 ) ( ON ?auto_185202 ?auto_185201 ) ( ON ?auto_185203 ?auto_185202 ) ( not ( = ?auto_185200 ?auto_185201 ) ) ( not ( = ?auto_185200 ?auto_185202 ) ) ( not ( = ?auto_185200 ?auto_185203 ) ) ( not ( = ?auto_185200 ?auto_185204 ) ) ( not ( = ?auto_185200 ?auto_185205 ) ) ( not ( = ?auto_185200 ?auto_185206 ) ) ( not ( = ?auto_185201 ?auto_185202 ) ) ( not ( = ?auto_185201 ?auto_185203 ) ) ( not ( = ?auto_185201 ?auto_185204 ) ) ( not ( = ?auto_185201 ?auto_185205 ) ) ( not ( = ?auto_185201 ?auto_185206 ) ) ( not ( = ?auto_185202 ?auto_185203 ) ) ( not ( = ?auto_185202 ?auto_185204 ) ) ( not ( = ?auto_185202 ?auto_185205 ) ) ( not ( = ?auto_185202 ?auto_185206 ) ) ( not ( = ?auto_185203 ?auto_185204 ) ) ( not ( = ?auto_185203 ?auto_185205 ) ) ( not ( = ?auto_185203 ?auto_185206 ) ) ( not ( = ?auto_185204 ?auto_185205 ) ) ( not ( = ?auto_185204 ?auto_185206 ) ) ( not ( = ?auto_185205 ?auto_185206 ) ) ( ON ?auto_185206 ?auto_185208 ) ( not ( = ?auto_185200 ?auto_185208 ) ) ( not ( = ?auto_185201 ?auto_185208 ) ) ( not ( = ?auto_185202 ?auto_185208 ) ) ( not ( = ?auto_185203 ?auto_185208 ) ) ( not ( = ?auto_185204 ?auto_185208 ) ) ( not ( = ?auto_185205 ?auto_185208 ) ) ( not ( = ?auto_185206 ?auto_185208 ) ) ( ON ?auto_185205 ?auto_185206 ) ( ON-TABLE ?auto_185207 ) ( ON ?auto_185208 ?auto_185207 ) ( not ( = ?auto_185207 ?auto_185208 ) ) ( not ( = ?auto_185207 ?auto_185206 ) ) ( not ( = ?auto_185207 ?auto_185205 ) ) ( not ( = ?auto_185200 ?auto_185207 ) ) ( not ( = ?auto_185201 ?auto_185207 ) ) ( not ( = ?auto_185202 ?auto_185207 ) ) ( not ( = ?auto_185203 ?auto_185207 ) ) ( not ( = ?auto_185204 ?auto_185207 ) ) ( CLEAR ?auto_185203 ) ( ON ?auto_185204 ?auto_185205 ) ( CLEAR ?auto_185204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185207 ?auto_185208 ?auto_185206 ?auto_185205 )
      ( MAKE-7PILE ?auto_185200 ?auto_185201 ?auto_185202 ?auto_185203 ?auto_185204 ?auto_185205 ?auto_185206 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185209 - BLOCK
      ?auto_185210 - BLOCK
      ?auto_185211 - BLOCK
      ?auto_185212 - BLOCK
      ?auto_185213 - BLOCK
      ?auto_185214 - BLOCK
      ?auto_185215 - BLOCK
    )
    :vars
    (
      ?auto_185217 - BLOCK
      ?auto_185216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185209 ) ( ON ?auto_185210 ?auto_185209 ) ( ON ?auto_185211 ?auto_185210 ) ( not ( = ?auto_185209 ?auto_185210 ) ) ( not ( = ?auto_185209 ?auto_185211 ) ) ( not ( = ?auto_185209 ?auto_185212 ) ) ( not ( = ?auto_185209 ?auto_185213 ) ) ( not ( = ?auto_185209 ?auto_185214 ) ) ( not ( = ?auto_185209 ?auto_185215 ) ) ( not ( = ?auto_185210 ?auto_185211 ) ) ( not ( = ?auto_185210 ?auto_185212 ) ) ( not ( = ?auto_185210 ?auto_185213 ) ) ( not ( = ?auto_185210 ?auto_185214 ) ) ( not ( = ?auto_185210 ?auto_185215 ) ) ( not ( = ?auto_185211 ?auto_185212 ) ) ( not ( = ?auto_185211 ?auto_185213 ) ) ( not ( = ?auto_185211 ?auto_185214 ) ) ( not ( = ?auto_185211 ?auto_185215 ) ) ( not ( = ?auto_185212 ?auto_185213 ) ) ( not ( = ?auto_185212 ?auto_185214 ) ) ( not ( = ?auto_185212 ?auto_185215 ) ) ( not ( = ?auto_185213 ?auto_185214 ) ) ( not ( = ?auto_185213 ?auto_185215 ) ) ( not ( = ?auto_185214 ?auto_185215 ) ) ( ON ?auto_185215 ?auto_185217 ) ( not ( = ?auto_185209 ?auto_185217 ) ) ( not ( = ?auto_185210 ?auto_185217 ) ) ( not ( = ?auto_185211 ?auto_185217 ) ) ( not ( = ?auto_185212 ?auto_185217 ) ) ( not ( = ?auto_185213 ?auto_185217 ) ) ( not ( = ?auto_185214 ?auto_185217 ) ) ( not ( = ?auto_185215 ?auto_185217 ) ) ( ON ?auto_185214 ?auto_185215 ) ( ON-TABLE ?auto_185216 ) ( ON ?auto_185217 ?auto_185216 ) ( not ( = ?auto_185216 ?auto_185217 ) ) ( not ( = ?auto_185216 ?auto_185215 ) ) ( not ( = ?auto_185216 ?auto_185214 ) ) ( not ( = ?auto_185209 ?auto_185216 ) ) ( not ( = ?auto_185210 ?auto_185216 ) ) ( not ( = ?auto_185211 ?auto_185216 ) ) ( not ( = ?auto_185212 ?auto_185216 ) ) ( not ( = ?auto_185213 ?auto_185216 ) ) ( ON ?auto_185213 ?auto_185214 ) ( CLEAR ?auto_185213 ) ( HOLDING ?auto_185212 ) ( CLEAR ?auto_185211 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185209 ?auto_185210 ?auto_185211 ?auto_185212 )
      ( MAKE-7PILE ?auto_185209 ?auto_185210 ?auto_185211 ?auto_185212 ?auto_185213 ?auto_185214 ?auto_185215 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185218 - BLOCK
      ?auto_185219 - BLOCK
      ?auto_185220 - BLOCK
      ?auto_185221 - BLOCK
      ?auto_185222 - BLOCK
      ?auto_185223 - BLOCK
      ?auto_185224 - BLOCK
    )
    :vars
    (
      ?auto_185226 - BLOCK
      ?auto_185225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185218 ) ( ON ?auto_185219 ?auto_185218 ) ( ON ?auto_185220 ?auto_185219 ) ( not ( = ?auto_185218 ?auto_185219 ) ) ( not ( = ?auto_185218 ?auto_185220 ) ) ( not ( = ?auto_185218 ?auto_185221 ) ) ( not ( = ?auto_185218 ?auto_185222 ) ) ( not ( = ?auto_185218 ?auto_185223 ) ) ( not ( = ?auto_185218 ?auto_185224 ) ) ( not ( = ?auto_185219 ?auto_185220 ) ) ( not ( = ?auto_185219 ?auto_185221 ) ) ( not ( = ?auto_185219 ?auto_185222 ) ) ( not ( = ?auto_185219 ?auto_185223 ) ) ( not ( = ?auto_185219 ?auto_185224 ) ) ( not ( = ?auto_185220 ?auto_185221 ) ) ( not ( = ?auto_185220 ?auto_185222 ) ) ( not ( = ?auto_185220 ?auto_185223 ) ) ( not ( = ?auto_185220 ?auto_185224 ) ) ( not ( = ?auto_185221 ?auto_185222 ) ) ( not ( = ?auto_185221 ?auto_185223 ) ) ( not ( = ?auto_185221 ?auto_185224 ) ) ( not ( = ?auto_185222 ?auto_185223 ) ) ( not ( = ?auto_185222 ?auto_185224 ) ) ( not ( = ?auto_185223 ?auto_185224 ) ) ( ON ?auto_185224 ?auto_185226 ) ( not ( = ?auto_185218 ?auto_185226 ) ) ( not ( = ?auto_185219 ?auto_185226 ) ) ( not ( = ?auto_185220 ?auto_185226 ) ) ( not ( = ?auto_185221 ?auto_185226 ) ) ( not ( = ?auto_185222 ?auto_185226 ) ) ( not ( = ?auto_185223 ?auto_185226 ) ) ( not ( = ?auto_185224 ?auto_185226 ) ) ( ON ?auto_185223 ?auto_185224 ) ( ON-TABLE ?auto_185225 ) ( ON ?auto_185226 ?auto_185225 ) ( not ( = ?auto_185225 ?auto_185226 ) ) ( not ( = ?auto_185225 ?auto_185224 ) ) ( not ( = ?auto_185225 ?auto_185223 ) ) ( not ( = ?auto_185218 ?auto_185225 ) ) ( not ( = ?auto_185219 ?auto_185225 ) ) ( not ( = ?auto_185220 ?auto_185225 ) ) ( not ( = ?auto_185221 ?auto_185225 ) ) ( not ( = ?auto_185222 ?auto_185225 ) ) ( ON ?auto_185222 ?auto_185223 ) ( CLEAR ?auto_185220 ) ( ON ?auto_185221 ?auto_185222 ) ( CLEAR ?auto_185221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185225 ?auto_185226 ?auto_185224 ?auto_185223 ?auto_185222 )
      ( MAKE-7PILE ?auto_185218 ?auto_185219 ?auto_185220 ?auto_185221 ?auto_185222 ?auto_185223 ?auto_185224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185227 - BLOCK
      ?auto_185228 - BLOCK
      ?auto_185229 - BLOCK
      ?auto_185230 - BLOCK
      ?auto_185231 - BLOCK
      ?auto_185232 - BLOCK
      ?auto_185233 - BLOCK
    )
    :vars
    (
      ?auto_185234 - BLOCK
      ?auto_185235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185227 ) ( ON ?auto_185228 ?auto_185227 ) ( not ( = ?auto_185227 ?auto_185228 ) ) ( not ( = ?auto_185227 ?auto_185229 ) ) ( not ( = ?auto_185227 ?auto_185230 ) ) ( not ( = ?auto_185227 ?auto_185231 ) ) ( not ( = ?auto_185227 ?auto_185232 ) ) ( not ( = ?auto_185227 ?auto_185233 ) ) ( not ( = ?auto_185228 ?auto_185229 ) ) ( not ( = ?auto_185228 ?auto_185230 ) ) ( not ( = ?auto_185228 ?auto_185231 ) ) ( not ( = ?auto_185228 ?auto_185232 ) ) ( not ( = ?auto_185228 ?auto_185233 ) ) ( not ( = ?auto_185229 ?auto_185230 ) ) ( not ( = ?auto_185229 ?auto_185231 ) ) ( not ( = ?auto_185229 ?auto_185232 ) ) ( not ( = ?auto_185229 ?auto_185233 ) ) ( not ( = ?auto_185230 ?auto_185231 ) ) ( not ( = ?auto_185230 ?auto_185232 ) ) ( not ( = ?auto_185230 ?auto_185233 ) ) ( not ( = ?auto_185231 ?auto_185232 ) ) ( not ( = ?auto_185231 ?auto_185233 ) ) ( not ( = ?auto_185232 ?auto_185233 ) ) ( ON ?auto_185233 ?auto_185234 ) ( not ( = ?auto_185227 ?auto_185234 ) ) ( not ( = ?auto_185228 ?auto_185234 ) ) ( not ( = ?auto_185229 ?auto_185234 ) ) ( not ( = ?auto_185230 ?auto_185234 ) ) ( not ( = ?auto_185231 ?auto_185234 ) ) ( not ( = ?auto_185232 ?auto_185234 ) ) ( not ( = ?auto_185233 ?auto_185234 ) ) ( ON ?auto_185232 ?auto_185233 ) ( ON-TABLE ?auto_185235 ) ( ON ?auto_185234 ?auto_185235 ) ( not ( = ?auto_185235 ?auto_185234 ) ) ( not ( = ?auto_185235 ?auto_185233 ) ) ( not ( = ?auto_185235 ?auto_185232 ) ) ( not ( = ?auto_185227 ?auto_185235 ) ) ( not ( = ?auto_185228 ?auto_185235 ) ) ( not ( = ?auto_185229 ?auto_185235 ) ) ( not ( = ?auto_185230 ?auto_185235 ) ) ( not ( = ?auto_185231 ?auto_185235 ) ) ( ON ?auto_185231 ?auto_185232 ) ( ON ?auto_185230 ?auto_185231 ) ( CLEAR ?auto_185230 ) ( HOLDING ?auto_185229 ) ( CLEAR ?auto_185228 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185227 ?auto_185228 ?auto_185229 )
      ( MAKE-7PILE ?auto_185227 ?auto_185228 ?auto_185229 ?auto_185230 ?auto_185231 ?auto_185232 ?auto_185233 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185236 - BLOCK
      ?auto_185237 - BLOCK
      ?auto_185238 - BLOCK
      ?auto_185239 - BLOCK
      ?auto_185240 - BLOCK
      ?auto_185241 - BLOCK
      ?auto_185242 - BLOCK
    )
    :vars
    (
      ?auto_185243 - BLOCK
      ?auto_185244 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185236 ) ( ON ?auto_185237 ?auto_185236 ) ( not ( = ?auto_185236 ?auto_185237 ) ) ( not ( = ?auto_185236 ?auto_185238 ) ) ( not ( = ?auto_185236 ?auto_185239 ) ) ( not ( = ?auto_185236 ?auto_185240 ) ) ( not ( = ?auto_185236 ?auto_185241 ) ) ( not ( = ?auto_185236 ?auto_185242 ) ) ( not ( = ?auto_185237 ?auto_185238 ) ) ( not ( = ?auto_185237 ?auto_185239 ) ) ( not ( = ?auto_185237 ?auto_185240 ) ) ( not ( = ?auto_185237 ?auto_185241 ) ) ( not ( = ?auto_185237 ?auto_185242 ) ) ( not ( = ?auto_185238 ?auto_185239 ) ) ( not ( = ?auto_185238 ?auto_185240 ) ) ( not ( = ?auto_185238 ?auto_185241 ) ) ( not ( = ?auto_185238 ?auto_185242 ) ) ( not ( = ?auto_185239 ?auto_185240 ) ) ( not ( = ?auto_185239 ?auto_185241 ) ) ( not ( = ?auto_185239 ?auto_185242 ) ) ( not ( = ?auto_185240 ?auto_185241 ) ) ( not ( = ?auto_185240 ?auto_185242 ) ) ( not ( = ?auto_185241 ?auto_185242 ) ) ( ON ?auto_185242 ?auto_185243 ) ( not ( = ?auto_185236 ?auto_185243 ) ) ( not ( = ?auto_185237 ?auto_185243 ) ) ( not ( = ?auto_185238 ?auto_185243 ) ) ( not ( = ?auto_185239 ?auto_185243 ) ) ( not ( = ?auto_185240 ?auto_185243 ) ) ( not ( = ?auto_185241 ?auto_185243 ) ) ( not ( = ?auto_185242 ?auto_185243 ) ) ( ON ?auto_185241 ?auto_185242 ) ( ON-TABLE ?auto_185244 ) ( ON ?auto_185243 ?auto_185244 ) ( not ( = ?auto_185244 ?auto_185243 ) ) ( not ( = ?auto_185244 ?auto_185242 ) ) ( not ( = ?auto_185244 ?auto_185241 ) ) ( not ( = ?auto_185236 ?auto_185244 ) ) ( not ( = ?auto_185237 ?auto_185244 ) ) ( not ( = ?auto_185238 ?auto_185244 ) ) ( not ( = ?auto_185239 ?auto_185244 ) ) ( not ( = ?auto_185240 ?auto_185244 ) ) ( ON ?auto_185240 ?auto_185241 ) ( ON ?auto_185239 ?auto_185240 ) ( CLEAR ?auto_185237 ) ( ON ?auto_185238 ?auto_185239 ) ( CLEAR ?auto_185238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185244 ?auto_185243 ?auto_185242 ?auto_185241 ?auto_185240 ?auto_185239 )
      ( MAKE-7PILE ?auto_185236 ?auto_185237 ?auto_185238 ?auto_185239 ?auto_185240 ?auto_185241 ?auto_185242 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185245 - BLOCK
      ?auto_185246 - BLOCK
      ?auto_185247 - BLOCK
      ?auto_185248 - BLOCK
      ?auto_185249 - BLOCK
      ?auto_185250 - BLOCK
      ?auto_185251 - BLOCK
    )
    :vars
    (
      ?auto_185252 - BLOCK
      ?auto_185253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185245 ) ( not ( = ?auto_185245 ?auto_185246 ) ) ( not ( = ?auto_185245 ?auto_185247 ) ) ( not ( = ?auto_185245 ?auto_185248 ) ) ( not ( = ?auto_185245 ?auto_185249 ) ) ( not ( = ?auto_185245 ?auto_185250 ) ) ( not ( = ?auto_185245 ?auto_185251 ) ) ( not ( = ?auto_185246 ?auto_185247 ) ) ( not ( = ?auto_185246 ?auto_185248 ) ) ( not ( = ?auto_185246 ?auto_185249 ) ) ( not ( = ?auto_185246 ?auto_185250 ) ) ( not ( = ?auto_185246 ?auto_185251 ) ) ( not ( = ?auto_185247 ?auto_185248 ) ) ( not ( = ?auto_185247 ?auto_185249 ) ) ( not ( = ?auto_185247 ?auto_185250 ) ) ( not ( = ?auto_185247 ?auto_185251 ) ) ( not ( = ?auto_185248 ?auto_185249 ) ) ( not ( = ?auto_185248 ?auto_185250 ) ) ( not ( = ?auto_185248 ?auto_185251 ) ) ( not ( = ?auto_185249 ?auto_185250 ) ) ( not ( = ?auto_185249 ?auto_185251 ) ) ( not ( = ?auto_185250 ?auto_185251 ) ) ( ON ?auto_185251 ?auto_185252 ) ( not ( = ?auto_185245 ?auto_185252 ) ) ( not ( = ?auto_185246 ?auto_185252 ) ) ( not ( = ?auto_185247 ?auto_185252 ) ) ( not ( = ?auto_185248 ?auto_185252 ) ) ( not ( = ?auto_185249 ?auto_185252 ) ) ( not ( = ?auto_185250 ?auto_185252 ) ) ( not ( = ?auto_185251 ?auto_185252 ) ) ( ON ?auto_185250 ?auto_185251 ) ( ON-TABLE ?auto_185253 ) ( ON ?auto_185252 ?auto_185253 ) ( not ( = ?auto_185253 ?auto_185252 ) ) ( not ( = ?auto_185253 ?auto_185251 ) ) ( not ( = ?auto_185253 ?auto_185250 ) ) ( not ( = ?auto_185245 ?auto_185253 ) ) ( not ( = ?auto_185246 ?auto_185253 ) ) ( not ( = ?auto_185247 ?auto_185253 ) ) ( not ( = ?auto_185248 ?auto_185253 ) ) ( not ( = ?auto_185249 ?auto_185253 ) ) ( ON ?auto_185249 ?auto_185250 ) ( ON ?auto_185248 ?auto_185249 ) ( ON ?auto_185247 ?auto_185248 ) ( CLEAR ?auto_185247 ) ( HOLDING ?auto_185246 ) ( CLEAR ?auto_185245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185245 ?auto_185246 )
      ( MAKE-7PILE ?auto_185245 ?auto_185246 ?auto_185247 ?auto_185248 ?auto_185249 ?auto_185250 ?auto_185251 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185254 - BLOCK
      ?auto_185255 - BLOCK
      ?auto_185256 - BLOCK
      ?auto_185257 - BLOCK
      ?auto_185258 - BLOCK
      ?auto_185259 - BLOCK
      ?auto_185260 - BLOCK
    )
    :vars
    (
      ?auto_185261 - BLOCK
      ?auto_185262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185254 ) ( not ( = ?auto_185254 ?auto_185255 ) ) ( not ( = ?auto_185254 ?auto_185256 ) ) ( not ( = ?auto_185254 ?auto_185257 ) ) ( not ( = ?auto_185254 ?auto_185258 ) ) ( not ( = ?auto_185254 ?auto_185259 ) ) ( not ( = ?auto_185254 ?auto_185260 ) ) ( not ( = ?auto_185255 ?auto_185256 ) ) ( not ( = ?auto_185255 ?auto_185257 ) ) ( not ( = ?auto_185255 ?auto_185258 ) ) ( not ( = ?auto_185255 ?auto_185259 ) ) ( not ( = ?auto_185255 ?auto_185260 ) ) ( not ( = ?auto_185256 ?auto_185257 ) ) ( not ( = ?auto_185256 ?auto_185258 ) ) ( not ( = ?auto_185256 ?auto_185259 ) ) ( not ( = ?auto_185256 ?auto_185260 ) ) ( not ( = ?auto_185257 ?auto_185258 ) ) ( not ( = ?auto_185257 ?auto_185259 ) ) ( not ( = ?auto_185257 ?auto_185260 ) ) ( not ( = ?auto_185258 ?auto_185259 ) ) ( not ( = ?auto_185258 ?auto_185260 ) ) ( not ( = ?auto_185259 ?auto_185260 ) ) ( ON ?auto_185260 ?auto_185261 ) ( not ( = ?auto_185254 ?auto_185261 ) ) ( not ( = ?auto_185255 ?auto_185261 ) ) ( not ( = ?auto_185256 ?auto_185261 ) ) ( not ( = ?auto_185257 ?auto_185261 ) ) ( not ( = ?auto_185258 ?auto_185261 ) ) ( not ( = ?auto_185259 ?auto_185261 ) ) ( not ( = ?auto_185260 ?auto_185261 ) ) ( ON ?auto_185259 ?auto_185260 ) ( ON-TABLE ?auto_185262 ) ( ON ?auto_185261 ?auto_185262 ) ( not ( = ?auto_185262 ?auto_185261 ) ) ( not ( = ?auto_185262 ?auto_185260 ) ) ( not ( = ?auto_185262 ?auto_185259 ) ) ( not ( = ?auto_185254 ?auto_185262 ) ) ( not ( = ?auto_185255 ?auto_185262 ) ) ( not ( = ?auto_185256 ?auto_185262 ) ) ( not ( = ?auto_185257 ?auto_185262 ) ) ( not ( = ?auto_185258 ?auto_185262 ) ) ( ON ?auto_185258 ?auto_185259 ) ( ON ?auto_185257 ?auto_185258 ) ( ON ?auto_185256 ?auto_185257 ) ( CLEAR ?auto_185254 ) ( ON ?auto_185255 ?auto_185256 ) ( CLEAR ?auto_185255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185262 ?auto_185261 ?auto_185260 ?auto_185259 ?auto_185258 ?auto_185257 ?auto_185256 )
      ( MAKE-7PILE ?auto_185254 ?auto_185255 ?auto_185256 ?auto_185257 ?auto_185258 ?auto_185259 ?auto_185260 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185263 - BLOCK
      ?auto_185264 - BLOCK
      ?auto_185265 - BLOCK
      ?auto_185266 - BLOCK
      ?auto_185267 - BLOCK
      ?auto_185268 - BLOCK
      ?auto_185269 - BLOCK
    )
    :vars
    (
      ?auto_185270 - BLOCK
      ?auto_185271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185263 ?auto_185264 ) ) ( not ( = ?auto_185263 ?auto_185265 ) ) ( not ( = ?auto_185263 ?auto_185266 ) ) ( not ( = ?auto_185263 ?auto_185267 ) ) ( not ( = ?auto_185263 ?auto_185268 ) ) ( not ( = ?auto_185263 ?auto_185269 ) ) ( not ( = ?auto_185264 ?auto_185265 ) ) ( not ( = ?auto_185264 ?auto_185266 ) ) ( not ( = ?auto_185264 ?auto_185267 ) ) ( not ( = ?auto_185264 ?auto_185268 ) ) ( not ( = ?auto_185264 ?auto_185269 ) ) ( not ( = ?auto_185265 ?auto_185266 ) ) ( not ( = ?auto_185265 ?auto_185267 ) ) ( not ( = ?auto_185265 ?auto_185268 ) ) ( not ( = ?auto_185265 ?auto_185269 ) ) ( not ( = ?auto_185266 ?auto_185267 ) ) ( not ( = ?auto_185266 ?auto_185268 ) ) ( not ( = ?auto_185266 ?auto_185269 ) ) ( not ( = ?auto_185267 ?auto_185268 ) ) ( not ( = ?auto_185267 ?auto_185269 ) ) ( not ( = ?auto_185268 ?auto_185269 ) ) ( ON ?auto_185269 ?auto_185270 ) ( not ( = ?auto_185263 ?auto_185270 ) ) ( not ( = ?auto_185264 ?auto_185270 ) ) ( not ( = ?auto_185265 ?auto_185270 ) ) ( not ( = ?auto_185266 ?auto_185270 ) ) ( not ( = ?auto_185267 ?auto_185270 ) ) ( not ( = ?auto_185268 ?auto_185270 ) ) ( not ( = ?auto_185269 ?auto_185270 ) ) ( ON ?auto_185268 ?auto_185269 ) ( ON-TABLE ?auto_185271 ) ( ON ?auto_185270 ?auto_185271 ) ( not ( = ?auto_185271 ?auto_185270 ) ) ( not ( = ?auto_185271 ?auto_185269 ) ) ( not ( = ?auto_185271 ?auto_185268 ) ) ( not ( = ?auto_185263 ?auto_185271 ) ) ( not ( = ?auto_185264 ?auto_185271 ) ) ( not ( = ?auto_185265 ?auto_185271 ) ) ( not ( = ?auto_185266 ?auto_185271 ) ) ( not ( = ?auto_185267 ?auto_185271 ) ) ( ON ?auto_185267 ?auto_185268 ) ( ON ?auto_185266 ?auto_185267 ) ( ON ?auto_185265 ?auto_185266 ) ( ON ?auto_185264 ?auto_185265 ) ( CLEAR ?auto_185264 ) ( HOLDING ?auto_185263 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185263 )
      ( MAKE-7PILE ?auto_185263 ?auto_185264 ?auto_185265 ?auto_185266 ?auto_185267 ?auto_185268 ?auto_185269 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_185272 - BLOCK
      ?auto_185273 - BLOCK
      ?auto_185274 - BLOCK
      ?auto_185275 - BLOCK
      ?auto_185276 - BLOCK
      ?auto_185277 - BLOCK
      ?auto_185278 - BLOCK
    )
    :vars
    (
      ?auto_185280 - BLOCK
      ?auto_185279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185272 ?auto_185273 ) ) ( not ( = ?auto_185272 ?auto_185274 ) ) ( not ( = ?auto_185272 ?auto_185275 ) ) ( not ( = ?auto_185272 ?auto_185276 ) ) ( not ( = ?auto_185272 ?auto_185277 ) ) ( not ( = ?auto_185272 ?auto_185278 ) ) ( not ( = ?auto_185273 ?auto_185274 ) ) ( not ( = ?auto_185273 ?auto_185275 ) ) ( not ( = ?auto_185273 ?auto_185276 ) ) ( not ( = ?auto_185273 ?auto_185277 ) ) ( not ( = ?auto_185273 ?auto_185278 ) ) ( not ( = ?auto_185274 ?auto_185275 ) ) ( not ( = ?auto_185274 ?auto_185276 ) ) ( not ( = ?auto_185274 ?auto_185277 ) ) ( not ( = ?auto_185274 ?auto_185278 ) ) ( not ( = ?auto_185275 ?auto_185276 ) ) ( not ( = ?auto_185275 ?auto_185277 ) ) ( not ( = ?auto_185275 ?auto_185278 ) ) ( not ( = ?auto_185276 ?auto_185277 ) ) ( not ( = ?auto_185276 ?auto_185278 ) ) ( not ( = ?auto_185277 ?auto_185278 ) ) ( ON ?auto_185278 ?auto_185280 ) ( not ( = ?auto_185272 ?auto_185280 ) ) ( not ( = ?auto_185273 ?auto_185280 ) ) ( not ( = ?auto_185274 ?auto_185280 ) ) ( not ( = ?auto_185275 ?auto_185280 ) ) ( not ( = ?auto_185276 ?auto_185280 ) ) ( not ( = ?auto_185277 ?auto_185280 ) ) ( not ( = ?auto_185278 ?auto_185280 ) ) ( ON ?auto_185277 ?auto_185278 ) ( ON-TABLE ?auto_185279 ) ( ON ?auto_185280 ?auto_185279 ) ( not ( = ?auto_185279 ?auto_185280 ) ) ( not ( = ?auto_185279 ?auto_185278 ) ) ( not ( = ?auto_185279 ?auto_185277 ) ) ( not ( = ?auto_185272 ?auto_185279 ) ) ( not ( = ?auto_185273 ?auto_185279 ) ) ( not ( = ?auto_185274 ?auto_185279 ) ) ( not ( = ?auto_185275 ?auto_185279 ) ) ( not ( = ?auto_185276 ?auto_185279 ) ) ( ON ?auto_185276 ?auto_185277 ) ( ON ?auto_185275 ?auto_185276 ) ( ON ?auto_185274 ?auto_185275 ) ( ON ?auto_185273 ?auto_185274 ) ( ON ?auto_185272 ?auto_185273 ) ( CLEAR ?auto_185272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185279 ?auto_185280 ?auto_185278 ?auto_185277 ?auto_185276 ?auto_185275 ?auto_185274 ?auto_185273 )
      ( MAKE-7PILE ?auto_185272 ?auto_185273 ?auto_185274 ?auto_185275 ?auto_185276 ?auto_185277 ?auto_185278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185282 - BLOCK
    )
    :vars
    (
      ?auto_185283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185283 ?auto_185282 ) ( CLEAR ?auto_185283 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185282 ) ( not ( = ?auto_185282 ?auto_185283 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185283 ?auto_185282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185284 - BLOCK
    )
    :vars
    (
      ?auto_185285 - BLOCK
      ?auto_185286 - BLOCK
      ?auto_185287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185285 ?auto_185284 ) ( CLEAR ?auto_185285 ) ( ON-TABLE ?auto_185284 ) ( not ( = ?auto_185284 ?auto_185285 ) ) ( HOLDING ?auto_185286 ) ( CLEAR ?auto_185287 ) ( not ( = ?auto_185284 ?auto_185286 ) ) ( not ( = ?auto_185284 ?auto_185287 ) ) ( not ( = ?auto_185285 ?auto_185286 ) ) ( not ( = ?auto_185285 ?auto_185287 ) ) ( not ( = ?auto_185286 ?auto_185287 ) ) )
    :subtasks
    ( ( !STACK ?auto_185286 ?auto_185287 )
      ( MAKE-1PILE ?auto_185284 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185288 - BLOCK
    )
    :vars
    (
      ?auto_185291 - BLOCK
      ?auto_185290 - BLOCK
      ?auto_185289 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185291 ?auto_185288 ) ( ON-TABLE ?auto_185288 ) ( not ( = ?auto_185288 ?auto_185291 ) ) ( CLEAR ?auto_185290 ) ( not ( = ?auto_185288 ?auto_185289 ) ) ( not ( = ?auto_185288 ?auto_185290 ) ) ( not ( = ?auto_185291 ?auto_185289 ) ) ( not ( = ?auto_185291 ?auto_185290 ) ) ( not ( = ?auto_185289 ?auto_185290 ) ) ( ON ?auto_185289 ?auto_185291 ) ( CLEAR ?auto_185289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185288 ?auto_185291 )
      ( MAKE-1PILE ?auto_185288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185292 - BLOCK
    )
    :vars
    (
      ?auto_185295 - BLOCK
      ?auto_185293 - BLOCK
      ?auto_185294 - BLOCK
      ?auto_185300 - BLOCK
      ?auto_185299 - BLOCK
      ?auto_185297 - BLOCK
      ?auto_185296 - BLOCK
      ?auto_185298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185295 ?auto_185292 ) ( ON-TABLE ?auto_185292 ) ( not ( = ?auto_185292 ?auto_185295 ) ) ( not ( = ?auto_185292 ?auto_185293 ) ) ( not ( = ?auto_185292 ?auto_185294 ) ) ( not ( = ?auto_185295 ?auto_185293 ) ) ( not ( = ?auto_185295 ?auto_185294 ) ) ( not ( = ?auto_185293 ?auto_185294 ) ) ( ON ?auto_185293 ?auto_185295 ) ( CLEAR ?auto_185293 ) ( HOLDING ?auto_185294 ) ( CLEAR ?auto_185300 ) ( ON-TABLE ?auto_185299 ) ( ON ?auto_185297 ?auto_185299 ) ( ON ?auto_185296 ?auto_185297 ) ( ON ?auto_185298 ?auto_185296 ) ( ON ?auto_185300 ?auto_185298 ) ( not ( = ?auto_185299 ?auto_185297 ) ) ( not ( = ?auto_185299 ?auto_185296 ) ) ( not ( = ?auto_185299 ?auto_185298 ) ) ( not ( = ?auto_185299 ?auto_185300 ) ) ( not ( = ?auto_185299 ?auto_185294 ) ) ( not ( = ?auto_185297 ?auto_185296 ) ) ( not ( = ?auto_185297 ?auto_185298 ) ) ( not ( = ?auto_185297 ?auto_185300 ) ) ( not ( = ?auto_185297 ?auto_185294 ) ) ( not ( = ?auto_185296 ?auto_185298 ) ) ( not ( = ?auto_185296 ?auto_185300 ) ) ( not ( = ?auto_185296 ?auto_185294 ) ) ( not ( = ?auto_185298 ?auto_185300 ) ) ( not ( = ?auto_185298 ?auto_185294 ) ) ( not ( = ?auto_185300 ?auto_185294 ) ) ( not ( = ?auto_185292 ?auto_185300 ) ) ( not ( = ?auto_185292 ?auto_185299 ) ) ( not ( = ?auto_185292 ?auto_185297 ) ) ( not ( = ?auto_185292 ?auto_185296 ) ) ( not ( = ?auto_185292 ?auto_185298 ) ) ( not ( = ?auto_185295 ?auto_185300 ) ) ( not ( = ?auto_185295 ?auto_185299 ) ) ( not ( = ?auto_185295 ?auto_185297 ) ) ( not ( = ?auto_185295 ?auto_185296 ) ) ( not ( = ?auto_185295 ?auto_185298 ) ) ( not ( = ?auto_185293 ?auto_185300 ) ) ( not ( = ?auto_185293 ?auto_185299 ) ) ( not ( = ?auto_185293 ?auto_185297 ) ) ( not ( = ?auto_185293 ?auto_185296 ) ) ( not ( = ?auto_185293 ?auto_185298 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185299 ?auto_185297 ?auto_185296 ?auto_185298 ?auto_185300 ?auto_185294 )
      ( MAKE-1PILE ?auto_185292 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185301 - BLOCK
    )
    :vars
    (
      ?auto_185303 - BLOCK
      ?auto_185302 - BLOCK
      ?auto_185307 - BLOCK
      ?auto_185309 - BLOCK
      ?auto_185305 - BLOCK
      ?auto_185308 - BLOCK
      ?auto_185304 - BLOCK
      ?auto_185306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185303 ?auto_185301 ) ( ON-TABLE ?auto_185301 ) ( not ( = ?auto_185301 ?auto_185303 ) ) ( not ( = ?auto_185301 ?auto_185302 ) ) ( not ( = ?auto_185301 ?auto_185307 ) ) ( not ( = ?auto_185303 ?auto_185302 ) ) ( not ( = ?auto_185303 ?auto_185307 ) ) ( not ( = ?auto_185302 ?auto_185307 ) ) ( ON ?auto_185302 ?auto_185303 ) ( CLEAR ?auto_185309 ) ( ON-TABLE ?auto_185305 ) ( ON ?auto_185308 ?auto_185305 ) ( ON ?auto_185304 ?auto_185308 ) ( ON ?auto_185306 ?auto_185304 ) ( ON ?auto_185309 ?auto_185306 ) ( not ( = ?auto_185305 ?auto_185308 ) ) ( not ( = ?auto_185305 ?auto_185304 ) ) ( not ( = ?auto_185305 ?auto_185306 ) ) ( not ( = ?auto_185305 ?auto_185309 ) ) ( not ( = ?auto_185305 ?auto_185307 ) ) ( not ( = ?auto_185308 ?auto_185304 ) ) ( not ( = ?auto_185308 ?auto_185306 ) ) ( not ( = ?auto_185308 ?auto_185309 ) ) ( not ( = ?auto_185308 ?auto_185307 ) ) ( not ( = ?auto_185304 ?auto_185306 ) ) ( not ( = ?auto_185304 ?auto_185309 ) ) ( not ( = ?auto_185304 ?auto_185307 ) ) ( not ( = ?auto_185306 ?auto_185309 ) ) ( not ( = ?auto_185306 ?auto_185307 ) ) ( not ( = ?auto_185309 ?auto_185307 ) ) ( not ( = ?auto_185301 ?auto_185309 ) ) ( not ( = ?auto_185301 ?auto_185305 ) ) ( not ( = ?auto_185301 ?auto_185308 ) ) ( not ( = ?auto_185301 ?auto_185304 ) ) ( not ( = ?auto_185301 ?auto_185306 ) ) ( not ( = ?auto_185303 ?auto_185309 ) ) ( not ( = ?auto_185303 ?auto_185305 ) ) ( not ( = ?auto_185303 ?auto_185308 ) ) ( not ( = ?auto_185303 ?auto_185304 ) ) ( not ( = ?auto_185303 ?auto_185306 ) ) ( not ( = ?auto_185302 ?auto_185309 ) ) ( not ( = ?auto_185302 ?auto_185305 ) ) ( not ( = ?auto_185302 ?auto_185308 ) ) ( not ( = ?auto_185302 ?auto_185304 ) ) ( not ( = ?auto_185302 ?auto_185306 ) ) ( ON ?auto_185307 ?auto_185302 ) ( CLEAR ?auto_185307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185301 ?auto_185303 ?auto_185302 )
      ( MAKE-1PILE ?auto_185301 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185310 - BLOCK
    )
    :vars
    (
      ?auto_185312 - BLOCK
      ?auto_185311 - BLOCK
      ?auto_185314 - BLOCK
      ?auto_185318 - BLOCK
      ?auto_185317 - BLOCK
      ?auto_185315 - BLOCK
      ?auto_185316 - BLOCK
      ?auto_185313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185312 ?auto_185310 ) ( ON-TABLE ?auto_185310 ) ( not ( = ?auto_185310 ?auto_185312 ) ) ( not ( = ?auto_185310 ?auto_185311 ) ) ( not ( = ?auto_185310 ?auto_185314 ) ) ( not ( = ?auto_185312 ?auto_185311 ) ) ( not ( = ?auto_185312 ?auto_185314 ) ) ( not ( = ?auto_185311 ?auto_185314 ) ) ( ON ?auto_185311 ?auto_185312 ) ( ON-TABLE ?auto_185318 ) ( ON ?auto_185317 ?auto_185318 ) ( ON ?auto_185315 ?auto_185317 ) ( ON ?auto_185316 ?auto_185315 ) ( not ( = ?auto_185318 ?auto_185317 ) ) ( not ( = ?auto_185318 ?auto_185315 ) ) ( not ( = ?auto_185318 ?auto_185316 ) ) ( not ( = ?auto_185318 ?auto_185313 ) ) ( not ( = ?auto_185318 ?auto_185314 ) ) ( not ( = ?auto_185317 ?auto_185315 ) ) ( not ( = ?auto_185317 ?auto_185316 ) ) ( not ( = ?auto_185317 ?auto_185313 ) ) ( not ( = ?auto_185317 ?auto_185314 ) ) ( not ( = ?auto_185315 ?auto_185316 ) ) ( not ( = ?auto_185315 ?auto_185313 ) ) ( not ( = ?auto_185315 ?auto_185314 ) ) ( not ( = ?auto_185316 ?auto_185313 ) ) ( not ( = ?auto_185316 ?auto_185314 ) ) ( not ( = ?auto_185313 ?auto_185314 ) ) ( not ( = ?auto_185310 ?auto_185313 ) ) ( not ( = ?auto_185310 ?auto_185318 ) ) ( not ( = ?auto_185310 ?auto_185317 ) ) ( not ( = ?auto_185310 ?auto_185315 ) ) ( not ( = ?auto_185310 ?auto_185316 ) ) ( not ( = ?auto_185312 ?auto_185313 ) ) ( not ( = ?auto_185312 ?auto_185318 ) ) ( not ( = ?auto_185312 ?auto_185317 ) ) ( not ( = ?auto_185312 ?auto_185315 ) ) ( not ( = ?auto_185312 ?auto_185316 ) ) ( not ( = ?auto_185311 ?auto_185313 ) ) ( not ( = ?auto_185311 ?auto_185318 ) ) ( not ( = ?auto_185311 ?auto_185317 ) ) ( not ( = ?auto_185311 ?auto_185315 ) ) ( not ( = ?auto_185311 ?auto_185316 ) ) ( ON ?auto_185314 ?auto_185311 ) ( CLEAR ?auto_185314 ) ( HOLDING ?auto_185313 ) ( CLEAR ?auto_185316 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185318 ?auto_185317 ?auto_185315 ?auto_185316 ?auto_185313 )
      ( MAKE-1PILE ?auto_185310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185319 - BLOCK
    )
    :vars
    (
      ?auto_185327 - BLOCK
      ?auto_185320 - BLOCK
      ?auto_185322 - BLOCK
      ?auto_185323 - BLOCK
      ?auto_185326 - BLOCK
      ?auto_185325 - BLOCK
      ?auto_185324 - BLOCK
      ?auto_185321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185327 ?auto_185319 ) ( ON-TABLE ?auto_185319 ) ( not ( = ?auto_185319 ?auto_185327 ) ) ( not ( = ?auto_185319 ?auto_185320 ) ) ( not ( = ?auto_185319 ?auto_185322 ) ) ( not ( = ?auto_185327 ?auto_185320 ) ) ( not ( = ?auto_185327 ?auto_185322 ) ) ( not ( = ?auto_185320 ?auto_185322 ) ) ( ON ?auto_185320 ?auto_185327 ) ( ON-TABLE ?auto_185323 ) ( ON ?auto_185326 ?auto_185323 ) ( ON ?auto_185325 ?auto_185326 ) ( ON ?auto_185324 ?auto_185325 ) ( not ( = ?auto_185323 ?auto_185326 ) ) ( not ( = ?auto_185323 ?auto_185325 ) ) ( not ( = ?auto_185323 ?auto_185324 ) ) ( not ( = ?auto_185323 ?auto_185321 ) ) ( not ( = ?auto_185323 ?auto_185322 ) ) ( not ( = ?auto_185326 ?auto_185325 ) ) ( not ( = ?auto_185326 ?auto_185324 ) ) ( not ( = ?auto_185326 ?auto_185321 ) ) ( not ( = ?auto_185326 ?auto_185322 ) ) ( not ( = ?auto_185325 ?auto_185324 ) ) ( not ( = ?auto_185325 ?auto_185321 ) ) ( not ( = ?auto_185325 ?auto_185322 ) ) ( not ( = ?auto_185324 ?auto_185321 ) ) ( not ( = ?auto_185324 ?auto_185322 ) ) ( not ( = ?auto_185321 ?auto_185322 ) ) ( not ( = ?auto_185319 ?auto_185321 ) ) ( not ( = ?auto_185319 ?auto_185323 ) ) ( not ( = ?auto_185319 ?auto_185326 ) ) ( not ( = ?auto_185319 ?auto_185325 ) ) ( not ( = ?auto_185319 ?auto_185324 ) ) ( not ( = ?auto_185327 ?auto_185321 ) ) ( not ( = ?auto_185327 ?auto_185323 ) ) ( not ( = ?auto_185327 ?auto_185326 ) ) ( not ( = ?auto_185327 ?auto_185325 ) ) ( not ( = ?auto_185327 ?auto_185324 ) ) ( not ( = ?auto_185320 ?auto_185321 ) ) ( not ( = ?auto_185320 ?auto_185323 ) ) ( not ( = ?auto_185320 ?auto_185326 ) ) ( not ( = ?auto_185320 ?auto_185325 ) ) ( not ( = ?auto_185320 ?auto_185324 ) ) ( ON ?auto_185322 ?auto_185320 ) ( CLEAR ?auto_185324 ) ( ON ?auto_185321 ?auto_185322 ) ( CLEAR ?auto_185321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185319 ?auto_185327 ?auto_185320 ?auto_185322 )
      ( MAKE-1PILE ?auto_185319 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185328 - BLOCK
    )
    :vars
    (
      ?auto_185332 - BLOCK
      ?auto_185329 - BLOCK
      ?auto_185334 - BLOCK
      ?auto_185336 - BLOCK
      ?auto_185335 - BLOCK
      ?auto_185333 - BLOCK
      ?auto_185331 - BLOCK
      ?auto_185330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185332 ?auto_185328 ) ( ON-TABLE ?auto_185328 ) ( not ( = ?auto_185328 ?auto_185332 ) ) ( not ( = ?auto_185328 ?auto_185329 ) ) ( not ( = ?auto_185328 ?auto_185334 ) ) ( not ( = ?auto_185332 ?auto_185329 ) ) ( not ( = ?auto_185332 ?auto_185334 ) ) ( not ( = ?auto_185329 ?auto_185334 ) ) ( ON ?auto_185329 ?auto_185332 ) ( ON-TABLE ?auto_185336 ) ( ON ?auto_185335 ?auto_185336 ) ( ON ?auto_185333 ?auto_185335 ) ( not ( = ?auto_185336 ?auto_185335 ) ) ( not ( = ?auto_185336 ?auto_185333 ) ) ( not ( = ?auto_185336 ?auto_185331 ) ) ( not ( = ?auto_185336 ?auto_185330 ) ) ( not ( = ?auto_185336 ?auto_185334 ) ) ( not ( = ?auto_185335 ?auto_185333 ) ) ( not ( = ?auto_185335 ?auto_185331 ) ) ( not ( = ?auto_185335 ?auto_185330 ) ) ( not ( = ?auto_185335 ?auto_185334 ) ) ( not ( = ?auto_185333 ?auto_185331 ) ) ( not ( = ?auto_185333 ?auto_185330 ) ) ( not ( = ?auto_185333 ?auto_185334 ) ) ( not ( = ?auto_185331 ?auto_185330 ) ) ( not ( = ?auto_185331 ?auto_185334 ) ) ( not ( = ?auto_185330 ?auto_185334 ) ) ( not ( = ?auto_185328 ?auto_185330 ) ) ( not ( = ?auto_185328 ?auto_185336 ) ) ( not ( = ?auto_185328 ?auto_185335 ) ) ( not ( = ?auto_185328 ?auto_185333 ) ) ( not ( = ?auto_185328 ?auto_185331 ) ) ( not ( = ?auto_185332 ?auto_185330 ) ) ( not ( = ?auto_185332 ?auto_185336 ) ) ( not ( = ?auto_185332 ?auto_185335 ) ) ( not ( = ?auto_185332 ?auto_185333 ) ) ( not ( = ?auto_185332 ?auto_185331 ) ) ( not ( = ?auto_185329 ?auto_185330 ) ) ( not ( = ?auto_185329 ?auto_185336 ) ) ( not ( = ?auto_185329 ?auto_185335 ) ) ( not ( = ?auto_185329 ?auto_185333 ) ) ( not ( = ?auto_185329 ?auto_185331 ) ) ( ON ?auto_185334 ?auto_185329 ) ( ON ?auto_185330 ?auto_185334 ) ( CLEAR ?auto_185330 ) ( HOLDING ?auto_185331 ) ( CLEAR ?auto_185333 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185336 ?auto_185335 ?auto_185333 ?auto_185331 )
      ( MAKE-1PILE ?auto_185328 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185337 - BLOCK
    )
    :vars
    (
      ?auto_185345 - BLOCK
      ?auto_185342 - BLOCK
      ?auto_185343 - BLOCK
      ?auto_185341 - BLOCK
      ?auto_185339 - BLOCK
      ?auto_185344 - BLOCK
      ?auto_185340 - BLOCK
      ?auto_185338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185345 ?auto_185337 ) ( ON-TABLE ?auto_185337 ) ( not ( = ?auto_185337 ?auto_185345 ) ) ( not ( = ?auto_185337 ?auto_185342 ) ) ( not ( = ?auto_185337 ?auto_185343 ) ) ( not ( = ?auto_185345 ?auto_185342 ) ) ( not ( = ?auto_185345 ?auto_185343 ) ) ( not ( = ?auto_185342 ?auto_185343 ) ) ( ON ?auto_185342 ?auto_185345 ) ( ON-TABLE ?auto_185341 ) ( ON ?auto_185339 ?auto_185341 ) ( ON ?auto_185344 ?auto_185339 ) ( not ( = ?auto_185341 ?auto_185339 ) ) ( not ( = ?auto_185341 ?auto_185344 ) ) ( not ( = ?auto_185341 ?auto_185340 ) ) ( not ( = ?auto_185341 ?auto_185338 ) ) ( not ( = ?auto_185341 ?auto_185343 ) ) ( not ( = ?auto_185339 ?auto_185344 ) ) ( not ( = ?auto_185339 ?auto_185340 ) ) ( not ( = ?auto_185339 ?auto_185338 ) ) ( not ( = ?auto_185339 ?auto_185343 ) ) ( not ( = ?auto_185344 ?auto_185340 ) ) ( not ( = ?auto_185344 ?auto_185338 ) ) ( not ( = ?auto_185344 ?auto_185343 ) ) ( not ( = ?auto_185340 ?auto_185338 ) ) ( not ( = ?auto_185340 ?auto_185343 ) ) ( not ( = ?auto_185338 ?auto_185343 ) ) ( not ( = ?auto_185337 ?auto_185338 ) ) ( not ( = ?auto_185337 ?auto_185341 ) ) ( not ( = ?auto_185337 ?auto_185339 ) ) ( not ( = ?auto_185337 ?auto_185344 ) ) ( not ( = ?auto_185337 ?auto_185340 ) ) ( not ( = ?auto_185345 ?auto_185338 ) ) ( not ( = ?auto_185345 ?auto_185341 ) ) ( not ( = ?auto_185345 ?auto_185339 ) ) ( not ( = ?auto_185345 ?auto_185344 ) ) ( not ( = ?auto_185345 ?auto_185340 ) ) ( not ( = ?auto_185342 ?auto_185338 ) ) ( not ( = ?auto_185342 ?auto_185341 ) ) ( not ( = ?auto_185342 ?auto_185339 ) ) ( not ( = ?auto_185342 ?auto_185344 ) ) ( not ( = ?auto_185342 ?auto_185340 ) ) ( ON ?auto_185343 ?auto_185342 ) ( ON ?auto_185338 ?auto_185343 ) ( CLEAR ?auto_185344 ) ( ON ?auto_185340 ?auto_185338 ) ( CLEAR ?auto_185340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185337 ?auto_185345 ?auto_185342 ?auto_185343 ?auto_185338 )
      ( MAKE-1PILE ?auto_185337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185346 - BLOCK
    )
    :vars
    (
      ?auto_185349 - BLOCK
      ?auto_185348 - BLOCK
      ?auto_185350 - BLOCK
      ?auto_185352 - BLOCK
      ?auto_185353 - BLOCK
      ?auto_185351 - BLOCK
      ?auto_185354 - BLOCK
      ?auto_185347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185349 ?auto_185346 ) ( ON-TABLE ?auto_185346 ) ( not ( = ?auto_185346 ?auto_185349 ) ) ( not ( = ?auto_185346 ?auto_185348 ) ) ( not ( = ?auto_185346 ?auto_185350 ) ) ( not ( = ?auto_185349 ?auto_185348 ) ) ( not ( = ?auto_185349 ?auto_185350 ) ) ( not ( = ?auto_185348 ?auto_185350 ) ) ( ON ?auto_185348 ?auto_185349 ) ( ON-TABLE ?auto_185352 ) ( ON ?auto_185353 ?auto_185352 ) ( not ( = ?auto_185352 ?auto_185353 ) ) ( not ( = ?auto_185352 ?auto_185351 ) ) ( not ( = ?auto_185352 ?auto_185354 ) ) ( not ( = ?auto_185352 ?auto_185347 ) ) ( not ( = ?auto_185352 ?auto_185350 ) ) ( not ( = ?auto_185353 ?auto_185351 ) ) ( not ( = ?auto_185353 ?auto_185354 ) ) ( not ( = ?auto_185353 ?auto_185347 ) ) ( not ( = ?auto_185353 ?auto_185350 ) ) ( not ( = ?auto_185351 ?auto_185354 ) ) ( not ( = ?auto_185351 ?auto_185347 ) ) ( not ( = ?auto_185351 ?auto_185350 ) ) ( not ( = ?auto_185354 ?auto_185347 ) ) ( not ( = ?auto_185354 ?auto_185350 ) ) ( not ( = ?auto_185347 ?auto_185350 ) ) ( not ( = ?auto_185346 ?auto_185347 ) ) ( not ( = ?auto_185346 ?auto_185352 ) ) ( not ( = ?auto_185346 ?auto_185353 ) ) ( not ( = ?auto_185346 ?auto_185351 ) ) ( not ( = ?auto_185346 ?auto_185354 ) ) ( not ( = ?auto_185349 ?auto_185347 ) ) ( not ( = ?auto_185349 ?auto_185352 ) ) ( not ( = ?auto_185349 ?auto_185353 ) ) ( not ( = ?auto_185349 ?auto_185351 ) ) ( not ( = ?auto_185349 ?auto_185354 ) ) ( not ( = ?auto_185348 ?auto_185347 ) ) ( not ( = ?auto_185348 ?auto_185352 ) ) ( not ( = ?auto_185348 ?auto_185353 ) ) ( not ( = ?auto_185348 ?auto_185351 ) ) ( not ( = ?auto_185348 ?auto_185354 ) ) ( ON ?auto_185350 ?auto_185348 ) ( ON ?auto_185347 ?auto_185350 ) ( ON ?auto_185354 ?auto_185347 ) ( CLEAR ?auto_185354 ) ( HOLDING ?auto_185351 ) ( CLEAR ?auto_185353 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185352 ?auto_185353 ?auto_185351 )
      ( MAKE-1PILE ?auto_185346 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185355 - BLOCK
    )
    :vars
    (
      ?auto_185362 - BLOCK
      ?auto_185356 - BLOCK
      ?auto_185361 - BLOCK
      ?auto_185357 - BLOCK
      ?auto_185360 - BLOCK
      ?auto_185358 - BLOCK
      ?auto_185363 - BLOCK
      ?auto_185359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185362 ?auto_185355 ) ( ON-TABLE ?auto_185355 ) ( not ( = ?auto_185355 ?auto_185362 ) ) ( not ( = ?auto_185355 ?auto_185356 ) ) ( not ( = ?auto_185355 ?auto_185361 ) ) ( not ( = ?auto_185362 ?auto_185356 ) ) ( not ( = ?auto_185362 ?auto_185361 ) ) ( not ( = ?auto_185356 ?auto_185361 ) ) ( ON ?auto_185356 ?auto_185362 ) ( ON-TABLE ?auto_185357 ) ( ON ?auto_185360 ?auto_185357 ) ( not ( = ?auto_185357 ?auto_185360 ) ) ( not ( = ?auto_185357 ?auto_185358 ) ) ( not ( = ?auto_185357 ?auto_185363 ) ) ( not ( = ?auto_185357 ?auto_185359 ) ) ( not ( = ?auto_185357 ?auto_185361 ) ) ( not ( = ?auto_185360 ?auto_185358 ) ) ( not ( = ?auto_185360 ?auto_185363 ) ) ( not ( = ?auto_185360 ?auto_185359 ) ) ( not ( = ?auto_185360 ?auto_185361 ) ) ( not ( = ?auto_185358 ?auto_185363 ) ) ( not ( = ?auto_185358 ?auto_185359 ) ) ( not ( = ?auto_185358 ?auto_185361 ) ) ( not ( = ?auto_185363 ?auto_185359 ) ) ( not ( = ?auto_185363 ?auto_185361 ) ) ( not ( = ?auto_185359 ?auto_185361 ) ) ( not ( = ?auto_185355 ?auto_185359 ) ) ( not ( = ?auto_185355 ?auto_185357 ) ) ( not ( = ?auto_185355 ?auto_185360 ) ) ( not ( = ?auto_185355 ?auto_185358 ) ) ( not ( = ?auto_185355 ?auto_185363 ) ) ( not ( = ?auto_185362 ?auto_185359 ) ) ( not ( = ?auto_185362 ?auto_185357 ) ) ( not ( = ?auto_185362 ?auto_185360 ) ) ( not ( = ?auto_185362 ?auto_185358 ) ) ( not ( = ?auto_185362 ?auto_185363 ) ) ( not ( = ?auto_185356 ?auto_185359 ) ) ( not ( = ?auto_185356 ?auto_185357 ) ) ( not ( = ?auto_185356 ?auto_185360 ) ) ( not ( = ?auto_185356 ?auto_185358 ) ) ( not ( = ?auto_185356 ?auto_185363 ) ) ( ON ?auto_185361 ?auto_185356 ) ( ON ?auto_185359 ?auto_185361 ) ( ON ?auto_185363 ?auto_185359 ) ( CLEAR ?auto_185360 ) ( ON ?auto_185358 ?auto_185363 ) ( CLEAR ?auto_185358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185355 ?auto_185362 ?auto_185356 ?auto_185361 ?auto_185359 ?auto_185363 )
      ( MAKE-1PILE ?auto_185355 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185364 - BLOCK
    )
    :vars
    (
      ?auto_185371 - BLOCK
      ?auto_185365 - BLOCK
      ?auto_185369 - BLOCK
      ?auto_185372 - BLOCK
      ?auto_185370 - BLOCK
      ?auto_185368 - BLOCK
      ?auto_185367 - BLOCK
      ?auto_185366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185371 ?auto_185364 ) ( ON-TABLE ?auto_185364 ) ( not ( = ?auto_185364 ?auto_185371 ) ) ( not ( = ?auto_185364 ?auto_185365 ) ) ( not ( = ?auto_185364 ?auto_185369 ) ) ( not ( = ?auto_185371 ?auto_185365 ) ) ( not ( = ?auto_185371 ?auto_185369 ) ) ( not ( = ?auto_185365 ?auto_185369 ) ) ( ON ?auto_185365 ?auto_185371 ) ( ON-TABLE ?auto_185372 ) ( not ( = ?auto_185372 ?auto_185370 ) ) ( not ( = ?auto_185372 ?auto_185368 ) ) ( not ( = ?auto_185372 ?auto_185367 ) ) ( not ( = ?auto_185372 ?auto_185366 ) ) ( not ( = ?auto_185372 ?auto_185369 ) ) ( not ( = ?auto_185370 ?auto_185368 ) ) ( not ( = ?auto_185370 ?auto_185367 ) ) ( not ( = ?auto_185370 ?auto_185366 ) ) ( not ( = ?auto_185370 ?auto_185369 ) ) ( not ( = ?auto_185368 ?auto_185367 ) ) ( not ( = ?auto_185368 ?auto_185366 ) ) ( not ( = ?auto_185368 ?auto_185369 ) ) ( not ( = ?auto_185367 ?auto_185366 ) ) ( not ( = ?auto_185367 ?auto_185369 ) ) ( not ( = ?auto_185366 ?auto_185369 ) ) ( not ( = ?auto_185364 ?auto_185366 ) ) ( not ( = ?auto_185364 ?auto_185372 ) ) ( not ( = ?auto_185364 ?auto_185370 ) ) ( not ( = ?auto_185364 ?auto_185368 ) ) ( not ( = ?auto_185364 ?auto_185367 ) ) ( not ( = ?auto_185371 ?auto_185366 ) ) ( not ( = ?auto_185371 ?auto_185372 ) ) ( not ( = ?auto_185371 ?auto_185370 ) ) ( not ( = ?auto_185371 ?auto_185368 ) ) ( not ( = ?auto_185371 ?auto_185367 ) ) ( not ( = ?auto_185365 ?auto_185366 ) ) ( not ( = ?auto_185365 ?auto_185372 ) ) ( not ( = ?auto_185365 ?auto_185370 ) ) ( not ( = ?auto_185365 ?auto_185368 ) ) ( not ( = ?auto_185365 ?auto_185367 ) ) ( ON ?auto_185369 ?auto_185365 ) ( ON ?auto_185366 ?auto_185369 ) ( ON ?auto_185367 ?auto_185366 ) ( ON ?auto_185368 ?auto_185367 ) ( CLEAR ?auto_185368 ) ( HOLDING ?auto_185370 ) ( CLEAR ?auto_185372 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185372 ?auto_185370 )
      ( MAKE-1PILE ?auto_185364 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187543 - BLOCK
    )
    :vars
    (
      ?auto_187545 - BLOCK
      ?auto_187550 - BLOCK
      ?auto_187544 - BLOCK
      ?auto_187549 - BLOCK
      ?auto_187548 - BLOCK
      ?auto_187547 - BLOCK
      ?auto_187546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187545 ?auto_187543 ) ( ON-TABLE ?auto_187543 ) ( not ( = ?auto_187543 ?auto_187545 ) ) ( not ( = ?auto_187543 ?auto_187550 ) ) ( not ( = ?auto_187543 ?auto_187544 ) ) ( not ( = ?auto_187545 ?auto_187550 ) ) ( not ( = ?auto_187545 ?auto_187544 ) ) ( not ( = ?auto_187550 ?auto_187544 ) ) ( ON ?auto_187550 ?auto_187545 ) ( not ( = ?auto_187549 ?auto_187548 ) ) ( not ( = ?auto_187549 ?auto_187547 ) ) ( not ( = ?auto_187549 ?auto_187546 ) ) ( not ( = ?auto_187549 ?auto_187544 ) ) ( not ( = ?auto_187548 ?auto_187547 ) ) ( not ( = ?auto_187548 ?auto_187546 ) ) ( not ( = ?auto_187548 ?auto_187544 ) ) ( not ( = ?auto_187547 ?auto_187546 ) ) ( not ( = ?auto_187547 ?auto_187544 ) ) ( not ( = ?auto_187546 ?auto_187544 ) ) ( not ( = ?auto_187543 ?auto_187546 ) ) ( not ( = ?auto_187543 ?auto_187549 ) ) ( not ( = ?auto_187543 ?auto_187548 ) ) ( not ( = ?auto_187543 ?auto_187547 ) ) ( not ( = ?auto_187545 ?auto_187546 ) ) ( not ( = ?auto_187545 ?auto_187549 ) ) ( not ( = ?auto_187545 ?auto_187548 ) ) ( not ( = ?auto_187545 ?auto_187547 ) ) ( not ( = ?auto_187550 ?auto_187546 ) ) ( not ( = ?auto_187550 ?auto_187549 ) ) ( not ( = ?auto_187550 ?auto_187548 ) ) ( not ( = ?auto_187550 ?auto_187547 ) ) ( ON ?auto_187544 ?auto_187550 ) ( ON ?auto_187546 ?auto_187544 ) ( ON ?auto_187547 ?auto_187546 ) ( ON ?auto_187548 ?auto_187547 ) ( ON ?auto_187549 ?auto_187548 ) ( CLEAR ?auto_187549 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187543 ?auto_187545 ?auto_187550 ?auto_187544 ?auto_187546 ?auto_187547 ?auto_187548 )
      ( MAKE-1PILE ?auto_187543 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185382 - BLOCK
    )
    :vars
    (
      ?auto_185386 - BLOCK
      ?auto_185384 - BLOCK
      ?auto_185383 - BLOCK
      ?auto_185390 - BLOCK
      ?auto_185387 - BLOCK
      ?auto_185388 - BLOCK
      ?auto_185389 - BLOCK
      ?auto_185385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185386 ?auto_185382 ) ( ON-TABLE ?auto_185382 ) ( not ( = ?auto_185382 ?auto_185386 ) ) ( not ( = ?auto_185382 ?auto_185384 ) ) ( not ( = ?auto_185382 ?auto_185383 ) ) ( not ( = ?auto_185386 ?auto_185384 ) ) ( not ( = ?auto_185386 ?auto_185383 ) ) ( not ( = ?auto_185384 ?auto_185383 ) ) ( ON ?auto_185384 ?auto_185386 ) ( not ( = ?auto_185390 ?auto_185387 ) ) ( not ( = ?auto_185390 ?auto_185388 ) ) ( not ( = ?auto_185390 ?auto_185389 ) ) ( not ( = ?auto_185390 ?auto_185385 ) ) ( not ( = ?auto_185390 ?auto_185383 ) ) ( not ( = ?auto_185387 ?auto_185388 ) ) ( not ( = ?auto_185387 ?auto_185389 ) ) ( not ( = ?auto_185387 ?auto_185385 ) ) ( not ( = ?auto_185387 ?auto_185383 ) ) ( not ( = ?auto_185388 ?auto_185389 ) ) ( not ( = ?auto_185388 ?auto_185385 ) ) ( not ( = ?auto_185388 ?auto_185383 ) ) ( not ( = ?auto_185389 ?auto_185385 ) ) ( not ( = ?auto_185389 ?auto_185383 ) ) ( not ( = ?auto_185385 ?auto_185383 ) ) ( not ( = ?auto_185382 ?auto_185385 ) ) ( not ( = ?auto_185382 ?auto_185390 ) ) ( not ( = ?auto_185382 ?auto_185387 ) ) ( not ( = ?auto_185382 ?auto_185388 ) ) ( not ( = ?auto_185382 ?auto_185389 ) ) ( not ( = ?auto_185386 ?auto_185385 ) ) ( not ( = ?auto_185386 ?auto_185390 ) ) ( not ( = ?auto_185386 ?auto_185387 ) ) ( not ( = ?auto_185386 ?auto_185388 ) ) ( not ( = ?auto_185386 ?auto_185389 ) ) ( not ( = ?auto_185384 ?auto_185385 ) ) ( not ( = ?auto_185384 ?auto_185390 ) ) ( not ( = ?auto_185384 ?auto_185387 ) ) ( not ( = ?auto_185384 ?auto_185388 ) ) ( not ( = ?auto_185384 ?auto_185389 ) ) ( ON ?auto_185383 ?auto_185384 ) ( ON ?auto_185385 ?auto_185383 ) ( ON ?auto_185389 ?auto_185385 ) ( ON ?auto_185388 ?auto_185389 ) ( ON ?auto_185387 ?auto_185388 ) ( CLEAR ?auto_185387 ) ( HOLDING ?auto_185390 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185390 )
      ( MAKE-1PILE ?auto_185382 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185391 - BLOCK
    )
    :vars
    (
      ?auto_185393 - BLOCK
      ?auto_185395 - BLOCK
      ?auto_185392 - BLOCK
      ?auto_185397 - BLOCK
      ?auto_185399 - BLOCK
      ?auto_185394 - BLOCK
      ?auto_185396 - BLOCK
      ?auto_185398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185393 ?auto_185391 ) ( ON-TABLE ?auto_185391 ) ( not ( = ?auto_185391 ?auto_185393 ) ) ( not ( = ?auto_185391 ?auto_185395 ) ) ( not ( = ?auto_185391 ?auto_185392 ) ) ( not ( = ?auto_185393 ?auto_185395 ) ) ( not ( = ?auto_185393 ?auto_185392 ) ) ( not ( = ?auto_185395 ?auto_185392 ) ) ( ON ?auto_185395 ?auto_185393 ) ( not ( = ?auto_185397 ?auto_185399 ) ) ( not ( = ?auto_185397 ?auto_185394 ) ) ( not ( = ?auto_185397 ?auto_185396 ) ) ( not ( = ?auto_185397 ?auto_185398 ) ) ( not ( = ?auto_185397 ?auto_185392 ) ) ( not ( = ?auto_185399 ?auto_185394 ) ) ( not ( = ?auto_185399 ?auto_185396 ) ) ( not ( = ?auto_185399 ?auto_185398 ) ) ( not ( = ?auto_185399 ?auto_185392 ) ) ( not ( = ?auto_185394 ?auto_185396 ) ) ( not ( = ?auto_185394 ?auto_185398 ) ) ( not ( = ?auto_185394 ?auto_185392 ) ) ( not ( = ?auto_185396 ?auto_185398 ) ) ( not ( = ?auto_185396 ?auto_185392 ) ) ( not ( = ?auto_185398 ?auto_185392 ) ) ( not ( = ?auto_185391 ?auto_185398 ) ) ( not ( = ?auto_185391 ?auto_185397 ) ) ( not ( = ?auto_185391 ?auto_185399 ) ) ( not ( = ?auto_185391 ?auto_185394 ) ) ( not ( = ?auto_185391 ?auto_185396 ) ) ( not ( = ?auto_185393 ?auto_185398 ) ) ( not ( = ?auto_185393 ?auto_185397 ) ) ( not ( = ?auto_185393 ?auto_185399 ) ) ( not ( = ?auto_185393 ?auto_185394 ) ) ( not ( = ?auto_185393 ?auto_185396 ) ) ( not ( = ?auto_185395 ?auto_185398 ) ) ( not ( = ?auto_185395 ?auto_185397 ) ) ( not ( = ?auto_185395 ?auto_185399 ) ) ( not ( = ?auto_185395 ?auto_185394 ) ) ( not ( = ?auto_185395 ?auto_185396 ) ) ( ON ?auto_185392 ?auto_185395 ) ( ON ?auto_185398 ?auto_185392 ) ( ON ?auto_185396 ?auto_185398 ) ( ON ?auto_185394 ?auto_185396 ) ( ON ?auto_185399 ?auto_185394 ) ( ON ?auto_185397 ?auto_185399 ) ( CLEAR ?auto_185397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185391 ?auto_185393 ?auto_185395 ?auto_185392 ?auto_185398 ?auto_185396 ?auto_185394 ?auto_185399 )
      ( MAKE-1PILE ?auto_185391 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185408 - BLOCK
      ?auto_185409 - BLOCK
      ?auto_185410 - BLOCK
      ?auto_185411 - BLOCK
      ?auto_185412 - BLOCK
      ?auto_185413 - BLOCK
      ?auto_185414 - BLOCK
      ?auto_185415 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_185415 ) ( CLEAR ?auto_185414 ) ( ON-TABLE ?auto_185408 ) ( ON ?auto_185409 ?auto_185408 ) ( ON ?auto_185410 ?auto_185409 ) ( ON ?auto_185411 ?auto_185410 ) ( ON ?auto_185412 ?auto_185411 ) ( ON ?auto_185413 ?auto_185412 ) ( ON ?auto_185414 ?auto_185413 ) ( not ( = ?auto_185408 ?auto_185409 ) ) ( not ( = ?auto_185408 ?auto_185410 ) ) ( not ( = ?auto_185408 ?auto_185411 ) ) ( not ( = ?auto_185408 ?auto_185412 ) ) ( not ( = ?auto_185408 ?auto_185413 ) ) ( not ( = ?auto_185408 ?auto_185414 ) ) ( not ( = ?auto_185408 ?auto_185415 ) ) ( not ( = ?auto_185409 ?auto_185410 ) ) ( not ( = ?auto_185409 ?auto_185411 ) ) ( not ( = ?auto_185409 ?auto_185412 ) ) ( not ( = ?auto_185409 ?auto_185413 ) ) ( not ( = ?auto_185409 ?auto_185414 ) ) ( not ( = ?auto_185409 ?auto_185415 ) ) ( not ( = ?auto_185410 ?auto_185411 ) ) ( not ( = ?auto_185410 ?auto_185412 ) ) ( not ( = ?auto_185410 ?auto_185413 ) ) ( not ( = ?auto_185410 ?auto_185414 ) ) ( not ( = ?auto_185410 ?auto_185415 ) ) ( not ( = ?auto_185411 ?auto_185412 ) ) ( not ( = ?auto_185411 ?auto_185413 ) ) ( not ( = ?auto_185411 ?auto_185414 ) ) ( not ( = ?auto_185411 ?auto_185415 ) ) ( not ( = ?auto_185412 ?auto_185413 ) ) ( not ( = ?auto_185412 ?auto_185414 ) ) ( not ( = ?auto_185412 ?auto_185415 ) ) ( not ( = ?auto_185413 ?auto_185414 ) ) ( not ( = ?auto_185413 ?auto_185415 ) ) ( not ( = ?auto_185414 ?auto_185415 ) ) )
    :subtasks
    ( ( !STACK ?auto_185415 ?auto_185414 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185416 - BLOCK
      ?auto_185417 - BLOCK
      ?auto_185418 - BLOCK
      ?auto_185419 - BLOCK
      ?auto_185420 - BLOCK
      ?auto_185421 - BLOCK
      ?auto_185422 - BLOCK
      ?auto_185423 - BLOCK
    )
    :vars
    (
      ?auto_185424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_185422 ) ( ON-TABLE ?auto_185416 ) ( ON ?auto_185417 ?auto_185416 ) ( ON ?auto_185418 ?auto_185417 ) ( ON ?auto_185419 ?auto_185418 ) ( ON ?auto_185420 ?auto_185419 ) ( ON ?auto_185421 ?auto_185420 ) ( ON ?auto_185422 ?auto_185421 ) ( not ( = ?auto_185416 ?auto_185417 ) ) ( not ( = ?auto_185416 ?auto_185418 ) ) ( not ( = ?auto_185416 ?auto_185419 ) ) ( not ( = ?auto_185416 ?auto_185420 ) ) ( not ( = ?auto_185416 ?auto_185421 ) ) ( not ( = ?auto_185416 ?auto_185422 ) ) ( not ( = ?auto_185416 ?auto_185423 ) ) ( not ( = ?auto_185417 ?auto_185418 ) ) ( not ( = ?auto_185417 ?auto_185419 ) ) ( not ( = ?auto_185417 ?auto_185420 ) ) ( not ( = ?auto_185417 ?auto_185421 ) ) ( not ( = ?auto_185417 ?auto_185422 ) ) ( not ( = ?auto_185417 ?auto_185423 ) ) ( not ( = ?auto_185418 ?auto_185419 ) ) ( not ( = ?auto_185418 ?auto_185420 ) ) ( not ( = ?auto_185418 ?auto_185421 ) ) ( not ( = ?auto_185418 ?auto_185422 ) ) ( not ( = ?auto_185418 ?auto_185423 ) ) ( not ( = ?auto_185419 ?auto_185420 ) ) ( not ( = ?auto_185419 ?auto_185421 ) ) ( not ( = ?auto_185419 ?auto_185422 ) ) ( not ( = ?auto_185419 ?auto_185423 ) ) ( not ( = ?auto_185420 ?auto_185421 ) ) ( not ( = ?auto_185420 ?auto_185422 ) ) ( not ( = ?auto_185420 ?auto_185423 ) ) ( not ( = ?auto_185421 ?auto_185422 ) ) ( not ( = ?auto_185421 ?auto_185423 ) ) ( not ( = ?auto_185422 ?auto_185423 ) ) ( ON ?auto_185423 ?auto_185424 ) ( CLEAR ?auto_185423 ) ( HAND-EMPTY ) ( not ( = ?auto_185416 ?auto_185424 ) ) ( not ( = ?auto_185417 ?auto_185424 ) ) ( not ( = ?auto_185418 ?auto_185424 ) ) ( not ( = ?auto_185419 ?auto_185424 ) ) ( not ( = ?auto_185420 ?auto_185424 ) ) ( not ( = ?auto_185421 ?auto_185424 ) ) ( not ( = ?auto_185422 ?auto_185424 ) ) ( not ( = ?auto_185423 ?auto_185424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185423 ?auto_185424 )
      ( MAKE-8PILE ?auto_185416 ?auto_185417 ?auto_185418 ?auto_185419 ?auto_185420 ?auto_185421 ?auto_185422 ?auto_185423 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185425 - BLOCK
      ?auto_185426 - BLOCK
      ?auto_185427 - BLOCK
      ?auto_185428 - BLOCK
      ?auto_185429 - BLOCK
      ?auto_185430 - BLOCK
      ?auto_185431 - BLOCK
      ?auto_185432 - BLOCK
    )
    :vars
    (
      ?auto_185433 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185425 ) ( ON ?auto_185426 ?auto_185425 ) ( ON ?auto_185427 ?auto_185426 ) ( ON ?auto_185428 ?auto_185427 ) ( ON ?auto_185429 ?auto_185428 ) ( ON ?auto_185430 ?auto_185429 ) ( not ( = ?auto_185425 ?auto_185426 ) ) ( not ( = ?auto_185425 ?auto_185427 ) ) ( not ( = ?auto_185425 ?auto_185428 ) ) ( not ( = ?auto_185425 ?auto_185429 ) ) ( not ( = ?auto_185425 ?auto_185430 ) ) ( not ( = ?auto_185425 ?auto_185431 ) ) ( not ( = ?auto_185425 ?auto_185432 ) ) ( not ( = ?auto_185426 ?auto_185427 ) ) ( not ( = ?auto_185426 ?auto_185428 ) ) ( not ( = ?auto_185426 ?auto_185429 ) ) ( not ( = ?auto_185426 ?auto_185430 ) ) ( not ( = ?auto_185426 ?auto_185431 ) ) ( not ( = ?auto_185426 ?auto_185432 ) ) ( not ( = ?auto_185427 ?auto_185428 ) ) ( not ( = ?auto_185427 ?auto_185429 ) ) ( not ( = ?auto_185427 ?auto_185430 ) ) ( not ( = ?auto_185427 ?auto_185431 ) ) ( not ( = ?auto_185427 ?auto_185432 ) ) ( not ( = ?auto_185428 ?auto_185429 ) ) ( not ( = ?auto_185428 ?auto_185430 ) ) ( not ( = ?auto_185428 ?auto_185431 ) ) ( not ( = ?auto_185428 ?auto_185432 ) ) ( not ( = ?auto_185429 ?auto_185430 ) ) ( not ( = ?auto_185429 ?auto_185431 ) ) ( not ( = ?auto_185429 ?auto_185432 ) ) ( not ( = ?auto_185430 ?auto_185431 ) ) ( not ( = ?auto_185430 ?auto_185432 ) ) ( not ( = ?auto_185431 ?auto_185432 ) ) ( ON ?auto_185432 ?auto_185433 ) ( CLEAR ?auto_185432 ) ( not ( = ?auto_185425 ?auto_185433 ) ) ( not ( = ?auto_185426 ?auto_185433 ) ) ( not ( = ?auto_185427 ?auto_185433 ) ) ( not ( = ?auto_185428 ?auto_185433 ) ) ( not ( = ?auto_185429 ?auto_185433 ) ) ( not ( = ?auto_185430 ?auto_185433 ) ) ( not ( = ?auto_185431 ?auto_185433 ) ) ( not ( = ?auto_185432 ?auto_185433 ) ) ( HOLDING ?auto_185431 ) ( CLEAR ?auto_185430 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185425 ?auto_185426 ?auto_185427 ?auto_185428 ?auto_185429 ?auto_185430 ?auto_185431 )
      ( MAKE-8PILE ?auto_185425 ?auto_185426 ?auto_185427 ?auto_185428 ?auto_185429 ?auto_185430 ?auto_185431 ?auto_185432 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185434 - BLOCK
      ?auto_185435 - BLOCK
      ?auto_185436 - BLOCK
      ?auto_185437 - BLOCK
      ?auto_185438 - BLOCK
      ?auto_185439 - BLOCK
      ?auto_185440 - BLOCK
      ?auto_185441 - BLOCK
    )
    :vars
    (
      ?auto_185442 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185434 ) ( ON ?auto_185435 ?auto_185434 ) ( ON ?auto_185436 ?auto_185435 ) ( ON ?auto_185437 ?auto_185436 ) ( ON ?auto_185438 ?auto_185437 ) ( ON ?auto_185439 ?auto_185438 ) ( not ( = ?auto_185434 ?auto_185435 ) ) ( not ( = ?auto_185434 ?auto_185436 ) ) ( not ( = ?auto_185434 ?auto_185437 ) ) ( not ( = ?auto_185434 ?auto_185438 ) ) ( not ( = ?auto_185434 ?auto_185439 ) ) ( not ( = ?auto_185434 ?auto_185440 ) ) ( not ( = ?auto_185434 ?auto_185441 ) ) ( not ( = ?auto_185435 ?auto_185436 ) ) ( not ( = ?auto_185435 ?auto_185437 ) ) ( not ( = ?auto_185435 ?auto_185438 ) ) ( not ( = ?auto_185435 ?auto_185439 ) ) ( not ( = ?auto_185435 ?auto_185440 ) ) ( not ( = ?auto_185435 ?auto_185441 ) ) ( not ( = ?auto_185436 ?auto_185437 ) ) ( not ( = ?auto_185436 ?auto_185438 ) ) ( not ( = ?auto_185436 ?auto_185439 ) ) ( not ( = ?auto_185436 ?auto_185440 ) ) ( not ( = ?auto_185436 ?auto_185441 ) ) ( not ( = ?auto_185437 ?auto_185438 ) ) ( not ( = ?auto_185437 ?auto_185439 ) ) ( not ( = ?auto_185437 ?auto_185440 ) ) ( not ( = ?auto_185437 ?auto_185441 ) ) ( not ( = ?auto_185438 ?auto_185439 ) ) ( not ( = ?auto_185438 ?auto_185440 ) ) ( not ( = ?auto_185438 ?auto_185441 ) ) ( not ( = ?auto_185439 ?auto_185440 ) ) ( not ( = ?auto_185439 ?auto_185441 ) ) ( not ( = ?auto_185440 ?auto_185441 ) ) ( ON ?auto_185441 ?auto_185442 ) ( not ( = ?auto_185434 ?auto_185442 ) ) ( not ( = ?auto_185435 ?auto_185442 ) ) ( not ( = ?auto_185436 ?auto_185442 ) ) ( not ( = ?auto_185437 ?auto_185442 ) ) ( not ( = ?auto_185438 ?auto_185442 ) ) ( not ( = ?auto_185439 ?auto_185442 ) ) ( not ( = ?auto_185440 ?auto_185442 ) ) ( not ( = ?auto_185441 ?auto_185442 ) ) ( CLEAR ?auto_185439 ) ( ON ?auto_185440 ?auto_185441 ) ( CLEAR ?auto_185440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185442 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185442 ?auto_185441 )
      ( MAKE-8PILE ?auto_185434 ?auto_185435 ?auto_185436 ?auto_185437 ?auto_185438 ?auto_185439 ?auto_185440 ?auto_185441 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185443 - BLOCK
      ?auto_185444 - BLOCK
      ?auto_185445 - BLOCK
      ?auto_185446 - BLOCK
      ?auto_185447 - BLOCK
      ?auto_185448 - BLOCK
      ?auto_185449 - BLOCK
      ?auto_185450 - BLOCK
    )
    :vars
    (
      ?auto_185451 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185443 ) ( ON ?auto_185444 ?auto_185443 ) ( ON ?auto_185445 ?auto_185444 ) ( ON ?auto_185446 ?auto_185445 ) ( ON ?auto_185447 ?auto_185446 ) ( not ( = ?auto_185443 ?auto_185444 ) ) ( not ( = ?auto_185443 ?auto_185445 ) ) ( not ( = ?auto_185443 ?auto_185446 ) ) ( not ( = ?auto_185443 ?auto_185447 ) ) ( not ( = ?auto_185443 ?auto_185448 ) ) ( not ( = ?auto_185443 ?auto_185449 ) ) ( not ( = ?auto_185443 ?auto_185450 ) ) ( not ( = ?auto_185444 ?auto_185445 ) ) ( not ( = ?auto_185444 ?auto_185446 ) ) ( not ( = ?auto_185444 ?auto_185447 ) ) ( not ( = ?auto_185444 ?auto_185448 ) ) ( not ( = ?auto_185444 ?auto_185449 ) ) ( not ( = ?auto_185444 ?auto_185450 ) ) ( not ( = ?auto_185445 ?auto_185446 ) ) ( not ( = ?auto_185445 ?auto_185447 ) ) ( not ( = ?auto_185445 ?auto_185448 ) ) ( not ( = ?auto_185445 ?auto_185449 ) ) ( not ( = ?auto_185445 ?auto_185450 ) ) ( not ( = ?auto_185446 ?auto_185447 ) ) ( not ( = ?auto_185446 ?auto_185448 ) ) ( not ( = ?auto_185446 ?auto_185449 ) ) ( not ( = ?auto_185446 ?auto_185450 ) ) ( not ( = ?auto_185447 ?auto_185448 ) ) ( not ( = ?auto_185447 ?auto_185449 ) ) ( not ( = ?auto_185447 ?auto_185450 ) ) ( not ( = ?auto_185448 ?auto_185449 ) ) ( not ( = ?auto_185448 ?auto_185450 ) ) ( not ( = ?auto_185449 ?auto_185450 ) ) ( ON ?auto_185450 ?auto_185451 ) ( not ( = ?auto_185443 ?auto_185451 ) ) ( not ( = ?auto_185444 ?auto_185451 ) ) ( not ( = ?auto_185445 ?auto_185451 ) ) ( not ( = ?auto_185446 ?auto_185451 ) ) ( not ( = ?auto_185447 ?auto_185451 ) ) ( not ( = ?auto_185448 ?auto_185451 ) ) ( not ( = ?auto_185449 ?auto_185451 ) ) ( not ( = ?auto_185450 ?auto_185451 ) ) ( ON ?auto_185449 ?auto_185450 ) ( CLEAR ?auto_185449 ) ( ON-TABLE ?auto_185451 ) ( HOLDING ?auto_185448 ) ( CLEAR ?auto_185447 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185443 ?auto_185444 ?auto_185445 ?auto_185446 ?auto_185447 ?auto_185448 )
      ( MAKE-8PILE ?auto_185443 ?auto_185444 ?auto_185445 ?auto_185446 ?auto_185447 ?auto_185448 ?auto_185449 ?auto_185450 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185452 - BLOCK
      ?auto_185453 - BLOCK
      ?auto_185454 - BLOCK
      ?auto_185455 - BLOCK
      ?auto_185456 - BLOCK
      ?auto_185457 - BLOCK
      ?auto_185458 - BLOCK
      ?auto_185459 - BLOCK
    )
    :vars
    (
      ?auto_185460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185452 ) ( ON ?auto_185453 ?auto_185452 ) ( ON ?auto_185454 ?auto_185453 ) ( ON ?auto_185455 ?auto_185454 ) ( ON ?auto_185456 ?auto_185455 ) ( not ( = ?auto_185452 ?auto_185453 ) ) ( not ( = ?auto_185452 ?auto_185454 ) ) ( not ( = ?auto_185452 ?auto_185455 ) ) ( not ( = ?auto_185452 ?auto_185456 ) ) ( not ( = ?auto_185452 ?auto_185457 ) ) ( not ( = ?auto_185452 ?auto_185458 ) ) ( not ( = ?auto_185452 ?auto_185459 ) ) ( not ( = ?auto_185453 ?auto_185454 ) ) ( not ( = ?auto_185453 ?auto_185455 ) ) ( not ( = ?auto_185453 ?auto_185456 ) ) ( not ( = ?auto_185453 ?auto_185457 ) ) ( not ( = ?auto_185453 ?auto_185458 ) ) ( not ( = ?auto_185453 ?auto_185459 ) ) ( not ( = ?auto_185454 ?auto_185455 ) ) ( not ( = ?auto_185454 ?auto_185456 ) ) ( not ( = ?auto_185454 ?auto_185457 ) ) ( not ( = ?auto_185454 ?auto_185458 ) ) ( not ( = ?auto_185454 ?auto_185459 ) ) ( not ( = ?auto_185455 ?auto_185456 ) ) ( not ( = ?auto_185455 ?auto_185457 ) ) ( not ( = ?auto_185455 ?auto_185458 ) ) ( not ( = ?auto_185455 ?auto_185459 ) ) ( not ( = ?auto_185456 ?auto_185457 ) ) ( not ( = ?auto_185456 ?auto_185458 ) ) ( not ( = ?auto_185456 ?auto_185459 ) ) ( not ( = ?auto_185457 ?auto_185458 ) ) ( not ( = ?auto_185457 ?auto_185459 ) ) ( not ( = ?auto_185458 ?auto_185459 ) ) ( ON ?auto_185459 ?auto_185460 ) ( not ( = ?auto_185452 ?auto_185460 ) ) ( not ( = ?auto_185453 ?auto_185460 ) ) ( not ( = ?auto_185454 ?auto_185460 ) ) ( not ( = ?auto_185455 ?auto_185460 ) ) ( not ( = ?auto_185456 ?auto_185460 ) ) ( not ( = ?auto_185457 ?auto_185460 ) ) ( not ( = ?auto_185458 ?auto_185460 ) ) ( not ( = ?auto_185459 ?auto_185460 ) ) ( ON ?auto_185458 ?auto_185459 ) ( ON-TABLE ?auto_185460 ) ( CLEAR ?auto_185456 ) ( ON ?auto_185457 ?auto_185458 ) ( CLEAR ?auto_185457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185460 ?auto_185459 ?auto_185458 )
      ( MAKE-8PILE ?auto_185452 ?auto_185453 ?auto_185454 ?auto_185455 ?auto_185456 ?auto_185457 ?auto_185458 ?auto_185459 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185461 - BLOCK
      ?auto_185462 - BLOCK
      ?auto_185463 - BLOCK
      ?auto_185464 - BLOCK
      ?auto_185465 - BLOCK
      ?auto_185466 - BLOCK
      ?auto_185467 - BLOCK
      ?auto_185468 - BLOCK
    )
    :vars
    (
      ?auto_185469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185461 ) ( ON ?auto_185462 ?auto_185461 ) ( ON ?auto_185463 ?auto_185462 ) ( ON ?auto_185464 ?auto_185463 ) ( not ( = ?auto_185461 ?auto_185462 ) ) ( not ( = ?auto_185461 ?auto_185463 ) ) ( not ( = ?auto_185461 ?auto_185464 ) ) ( not ( = ?auto_185461 ?auto_185465 ) ) ( not ( = ?auto_185461 ?auto_185466 ) ) ( not ( = ?auto_185461 ?auto_185467 ) ) ( not ( = ?auto_185461 ?auto_185468 ) ) ( not ( = ?auto_185462 ?auto_185463 ) ) ( not ( = ?auto_185462 ?auto_185464 ) ) ( not ( = ?auto_185462 ?auto_185465 ) ) ( not ( = ?auto_185462 ?auto_185466 ) ) ( not ( = ?auto_185462 ?auto_185467 ) ) ( not ( = ?auto_185462 ?auto_185468 ) ) ( not ( = ?auto_185463 ?auto_185464 ) ) ( not ( = ?auto_185463 ?auto_185465 ) ) ( not ( = ?auto_185463 ?auto_185466 ) ) ( not ( = ?auto_185463 ?auto_185467 ) ) ( not ( = ?auto_185463 ?auto_185468 ) ) ( not ( = ?auto_185464 ?auto_185465 ) ) ( not ( = ?auto_185464 ?auto_185466 ) ) ( not ( = ?auto_185464 ?auto_185467 ) ) ( not ( = ?auto_185464 ?auto_185468 ) ) ( not ( = ?auto_185465 ?auto_185466 ) ) ( not ( = ?auto_185465 ?auto_185467 ) ) ( not ( = ?auto_185465 ?auto_185468 ) ) ( not ( = ?auto_185466 ?auto_185467 ) ) ( not ( = ?auto_185466 ?auto_185468 ) ) ( not ( = ?auto_185467 ?auto_185468 ) ) ( ON ?auto_185468 ?auto_185469 ) ( not ( = ?auto_185461 ?auto_185469 ) ) ( not ( = ?auto_185462 ?auto_185469 ) ) ( not ( = ?auto_185463 ?auto_185469 ) ) ( not ( = ?auto_185464 ?auto_185469 ) ) ( not ( = ?auto_185465 ?auto_185469 ) ) ( not ( = ?auto_185466 ?auto_185469 ) ) ( not ( = ?auto_185467 ?auto_185469 ) ) ( not ( = ?auto_185468 ?auto_185469 ) ) ( ON ?auto_185467 ?auto_185468 ) ( ON-TABLE ?auto_185469 ) ( ON ?auto_185466 ?auto_185467 ) ( CLEAR ?auto_185466 ) ( HOLDING ?auto_185465 ) ( CLEAR ?auto_185464 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185461 ?auto_185462 ?auto_185463 ?auto_185464 ?auto_185465 )
      ( MAKE-8PILE ?auto_185461 ?auto_185462 ?auto_185463 ?auto_185464 ?auto_185465 ?auto_185466 ?auto_185467 ?auto_185468 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185470 - BLOCK
      ?auto_185471 - BLOCK
      ?auto_185472 - BLOCK
      ?auto_185473 - BLOCK
      ?auto_185474 - BLOCK
      ?auto_185475 - BLOCK
      ?auto_185476 - BLOCK
      ?auto_185477 - BLOCK
    )
    :vars
    (
      ?auto_185478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185470 ) ( ON ?auto_185471 ?auto_185470 ) ( ON ?auto_185472 ?auto_185471 ) ( ON ?auto_185473 ?auto_185472 ) ( not ( = ?auto_185470 ?auto_185471 ) ) ( not ( = ?auto_185470 ?auto_185472 ) ) ( not ( = ?auto_185470 ?auto_185473 ) ) ( not ( = ?auto_185470 ?auto_185474 ) ) ( not ( = ?auto_185470 ?auto_185475 ) ) ( not ( = ?auto_185470 ?auto_185476 ) ) ( not ( = ?auto_185470 ?auto_185477 ) ) ( not ( = ?auto_185471 ?auto_185472 ) ) ( not ( = ?auto_185471 ?auto_185473 ) ) ( not ( = ?auto_185471 ?auto_185474 ) ) ( not ( = ?auto_185471 ?auto_185475 ) ) ( not ( = ?auto_185471 ?auto_185476 ) ) ( not ( = ?auto_185471 ?auto_185477 ) ) ( not ( = ?auto_185472 ?auto_185473 ) ) ( not ( = ?auto_185472 ?auto_185474 ) ) ( not ( = ?auto_185472 ?auto_185475 ) ) ( not ( = ?auto_185472 ?auto_185476 ) ) ( not ( = ?auto_185472 ?auto_185477 ) ) ( not ( = ?auto_185473 ?auto_185474 ) ) ( not ( = ?auto_185473 ?auto_185475 ) ) ( not ( = ?auto_185473 ?auto_185476 ) ) ( not ( = ?auto_185473 ?auto_185477 ) ) ( not ( = ?auto_185474 ?auto_185475 ) ) ( not ( = ?auto_185474 ?auto_185476 ) ) ( not ( = ?auto_185474 ?auto_185477 ) ) ( not ( = ?auto_185475 ?auto_185476 ) ) ( not ( = ?auto_185475 ?auto_185477 ) ) ( not ( = ?auto_185476 ?auto_185477 ) ) ( ON ?auto_185477 ?auto_185478 ) ( not ( = ?auto_185470 ?auto_185478 ) ) ( not ( = ?auto_185471 ?auto_185478 ) ) ( not ( = ?auto_185472 ?auto_185478 ) ) ( not ( = ?auto_185473 ?auto_185478 ) ) ( not ( = ?auto_185474 ?auto_185478 ) ) ( not ( = ?auto_185475 ?auto_185478 ) ) ( not ( = ?auto_185476 ?auto_185478 ) ) ( not ( = ?auto_185477 ?auto_185478 ) ) ( ON ?auto_185476 ?auto_185477 ) ( ON-TABLE ?auto_185478 ) ( ON ?auto_185475 ?auto_185476 ) ( CLEAR ?auto_185473 ) ( ON ?auto_185474 ?auto_185475 ) ( CLEAR ?auto_185474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185478 ?auto_185477 ?auto_185476 ?auto_185475 )
      ( MAKE-8PILE ?auto_185470 ?auto_185471 ?auto_185472 ?auto_185473 ?auto_185474 ?auto_185475 ?auto_185476 ?auto_185477 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185479 - BLOCK
      ?auto_185480 - BLOCK
      ?auto_185481 - BLOCK
      ?auto_185482 - BLOCK
      ?auto_185483 - BLOCK
      ?auto_185484 - BLOCK
      ?auto_185485 - BLOCK
      ?auto_185486 - BLOCK
    )
    :vars
    (
      ?auto_185487 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185479 ) ( ON ?auto_185480 ?auto_185479 ) ( ON ?auto_185481 ?auto_185480 ) ( not ( = ?auto_185479 ?auto_185480 ) ) ( not ( = ?auto_185479 ?auto_185481 ) ) ( not ( = ?auto_185479 ?auto_185482 ) ) ( not ( = ?auto_185479 ?auto_185483 ) ) ( not ( = ?auto_185479 ?auto_185484 ) ) ( not ( = ?auto_185479 ?auto_185485 ) ) ( not ( = ?auto_185479 ?auto_185486 ) ) ( not ( = ?auto_185480 ?auto_185481 ) ) ( not ( = ?auto_185480 ?auto_185482 ) ) ( not ( = ?auto_185480 ?auto_185483 ) ) ( not ( = ?auto_185480 ?auto_185484 ) ) ( not ( = ?auto_185480 ?auto_185485 ) ) ( not ( = ?auto_185480 ?auto_185486 ) ) ( not ( = ?auto_185481 ?auto_185482 ) ) ( not ( = ?auto_185481 ?auto_185483 ) ) ( not ( = ?auto_185481 ?auto_185484 ) ) ( not ( = ?auto_185481 ?auto_185485 ) ) ( not ( = ?auto_185481 ?auto_185486 ) ) ( not ( = ?auto_185482 ?auto_185483 ) ) ( not ( = ?auto_185482 ?auto_185484 ) ) ( not ( = ?auto_185482 ?auto_185485 ) ) ( not ( = ?auto_185482 ?auto_185486 ) ) ( not ( = ?auto_185483 ?auto_185484 ) ) ( not ( = ?auto_185483 ?auto_185485 ) ) ( not ( = ?auto_185483 ?auto_185486 ) ) ( not ( = ?auto_185484 ?auto_185485 ) ) ( not ( = ?auto_185484 ?auto_185486 ) ) ( not ( = ?auto_185485 ?auto_185486 ) ) ( ON ?auto_185486 ?auto_185487 ) ( not ( = ?auto_185479 ?auto_185487 ) ) ( not ( = ?auto_185480 ?auto_185487 ) ) ( not ( = ?auto_185481 ?auto_185487 ) ) ( not ( = ?auto_185482 ?auto_185487 ) ) ( not ( = ?auto_185483 ?auto_185487 ) ) ( not ( = ?auto_185484 ?auto_185487 ) ) ( not ( = ?auto_185485 ?auto_185487 ) ) ( not ( = ?auto_185486 ?auto_185487 ) ) ( ON ?auto_185485 ?auto_185486 ) ( ON-TABLE ?auto_185487 ) ( ON ?auto_185484 ?auto_185485 ) ( ON ?auto_185483 ?auto_185484 ) ( CLEAR ?auto_185483 ) ( HOLDING ?auto_185482 ) ( CLEAR ?auto_185481 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185479 ?auto_185480 ?auto_185481 ?auto_185482 )
      ( MAKE-8PILE ?auto_185479 ?auto_185480 ?auto_185481 ?auto_185482 ?auto_185483 ?auto_185484 ?auto_185485 ?auto_185486 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185488 - BLOCK
      ?auto_185489 - BLOCK
      ?auto_185490 - BLOCK
      ?auto_185491 - BLOCK
      ?auto_185492 - BLOCK
      ?auto_185493 - BLOCK
      ?auto_185494 - BLOCK
      ?auto_185495 - BLOCK
    )
    :vars
    (
      ?auto_185496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185488 ) ( ON ?auto_185489 ?auto_185488 ) ( ON ?auto_185490 ?auto_185489 ) ( not ( = ?auto_185488 ?auto_185489 ) ) ( not ( = ?auto_185488 ?auto_185490 ) ) ( not ( = ?auto_185488 ?auto_185491 ) ) ( not ( = ?auto_185488 ?auto_185492 ) ) ( not ( = ?auto_185488 ?auto_185493 ) ) ( not ( = ?auto_185488 ?auto_185494 ) ) ( not ( = ?auto_185488 ?auto_185495 ) ) ( not ( = ?auto_185489 ?auto_185490 ) ) ( not ( = ?auto_185489 ?auto_185491 ) ) ( not ( = ?auto_185489 ?auto_185492 ) ) ( not ( = ?auto_185489 ?auto_185493 ) ) ( not ( = ?auto_185489 ?auto_185494 ) ) ( not ( = ?auto_185489 ?auto_185495 ) ) ( not ( = ?auto_185490 ?auto_185491 ) ) ( not ( = ?auto_185490 ?auto_185492 ) ) ( not ( = ?auto_185490 ?auto_185493 ) ) ( not ( = ?auto_185490 ?auto_185494 ) ) ( not ( = ?auto_185490 ?auto_185495 ) ) ( not ( = ?auto_185491 ?auto_185492 ) ) ( not ( = ?auto_185491 ?auto_185493 ) ) ( not ( = ?auto_185491 ?auto_185494 ) ) ( not ( = ?auto_185491 ?auto_185495 ) ) ( not ( = ?auto_185492 ?auto_185493 ) ) ( not ( = ?auto_185492 ?auto_185494 ) ) ( not ( = ?auto_185492 ?auto_185495 ) ) ( not ( = ?auto_185493 ?auto_185494 ) ) ( not ( = ?auto_185493 ?auto_185495 ) ) ( not ( = ?auto_185494 ?auto_185495 ) ) ( ON ?auto_185495 ?auto_185496 ) ( not ( = ?auto_185488 ?auto_185496 ) ) ( not ( = ?auto_185489 ?auto_185496 ) ) ( not ( = ?auto_185490 ?auto_185496 ) ) ( not ( = ?auto_185491 ?auto_185496 ) ) ( not ( = ?auto_185492 ?auto_185496 ) ) ( not ( = ?auto_185493 ?auto_185496 ) ) ( not ( = ?auto_185494 ?auto_185496 ) ) ( not ( = ?auto_185495 ?auto_185496 ) ) ( ON ?auto_185494 ?auto_185495 ) ( ON-TABLE ?auto_185496 ) ( ON ?auto_185493 ?auto_185494 ) ( ON ?auto_185492 ?auto_185493 ) ( CLEAR ?auto_185490 ) ( ON ?auto_185491 ?auto_185492 ) ( CLEAR ?auto_185491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185496 ?auto_185495 ?auto_185494 ?auto_185493 ?auto_185492 )
      ( MAKE-8PILE ?auto_185488 ?auto_185489 ?auto_185490 ?auto_185491 ?auto_185492 ?auto_185493 ?auto_185494 ?auto_185495 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185497 - BLOCK
      ?auto_185498 - BLOCK
      ?auto_185499 - BLOCK
      ?auto_185500 - BLOCK
      ?auto_185501 - BLOCK
      ?auto_185502 - BLOCK
      ?auto_185503 - BLOCK
      ?auto_185504 - BLOCK
    )
    :vars
    (
      ?auto_185505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185497 ) ( ON ?auto_185498 ?auto_185497 ) ( not ( = ?auto_185497 ?auto_185498 ) ) ( not ( = ?auto_185497 ?auto_185499 ) ) ( not ( = ?auto_185497 ?auto_185500 ) ) ( not ( = ?auto_185497 ?auto_185501 ) ) ( not ( = ?auto_185497 ?auto_185502 ) ) ( not ( = ?auto_185497 ?auto_185503 ) ) ( not ( = ?auto_185497 ?auto_185504 ) ) ( not ( = ?auto_185498 ?auto_185499 ) ) ( not ( = ?auto_185498 ?auto_185500 ) ) ( not ( = ?auto_185498 ?auto_185501 ) ) ( not ( = ?auto_185498 ?auto_185502 ) ) ( not ( = ?auto_185498 ?auto_185503 ) ) ( not ( = ?auto_185498 ?auto_185504 ) ) ( not ( = ?auto_185499 ?auto_185500 ) ) ( not ( = ?auto_185499 ?auto_185501 ) ) ( not ( = ?auto_185499 ?auto_185502 ) ) ( not ( = ?auto_185499 ?auto_185503 ) ) ( not ( = ?auto_185499 ?auto_185504 ) ) ( not ( = ?auto_185500 ?auto_185501 ) ) ( not ( = ?auto_185500 ?auto_185502 ) ) ( not ( = ?auto_185500 ?auto_185503 ) ) ( not ( = ?auto_185500 ?auto_185504 ) ) ( not ( = ?auto_185501 ?auto_185502 ) ) ( not ( = ?auto_185501 ?auto_185503 ) ) ( not ( = ?auto_185501 ?auto_185504 ) ) ( not ( = ?auto_185502 ?auto_185503 ) ) ( not ( = ?auto_185502 ?auto_185504 ) ) ( not ( = ?auto_185503 ?auto_185504 ) ) ( ON ?auto_185504 ?auto_185505 ) ( not ( = ?auto_185497 ?auto_185505 ) ) ( not ( = ?auto_185498 ?auto_185505 ) ) ( not ( = ?auto_185499 ?auto_185505 ) ) ( not ( = ?auto_185500 ?auto_185505 ) ) ( not ( = ?auto_185501 ?auto_185505 ) ) ( not ( = ?auto_185502 ?auto_185505 ) ) ( not ( = ?auto_185503 ?auto_185505 ) ) ( not ( = ?auto_185504 ?auto_185505 ) ) ( ON ?auto_185503 ?auto_185504 ) ( ON-TABLE ?auto_185505 ) ( ON ?auto_185502 ?auto_185503 ) ( ON ?auto_185501 ?auto_185502 ) ( ON ?auto_185500 ?auto_185501 ) ( CLEAR ?auto_185500 ) ( HOLDING ?auto_185499 ) ( CLEAR ?auto_185498 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185497 ?auto_185498 ?auto_185499 )
      ( MAKE-8PILE ?auto_185497 ?auto_185498 ?auto_185499 ?auto_185500 ?auto_185501 ?auto_185502 ?auto_185503 ?auto_185504 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185506 - BLOCK
      ?auto_185507 - BLOCK
      ?auto_185508 - BLOCK
      ?auto_185509 - BLOCK
      ?auto_185510 - BLOCK
      ?auto_185511 - BLOCK
      ?auto_185512 - BLOCK
      ?auto_185513 - BLOCK
    )
    :vars
    (
      ?auto_185514 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185506 ) ( ON ?auto_185507 ?auto_185506 ) ( not ( = ?auto_185506 ?auto_185507 ) ) ( not ( = ?auto_185506 ?auto_185508 ) ) ( not ( = ?auto_185506 ?auto_185509 ) ) ( not ( = ?auto_185506 ?auto_185510 ) ) ( not ( = ?auto_185506 ?auto_185511 ) ) ( not ( = ?auto_185506 ?auto_185512 ) ) ( not ( = ?auto_185506 ?auto_185513 ) ) ( not ( = ?auto_185507 ?auto_185508 ) ) ( not ( = ?auto_185507 ?auto_185509 ) ) ( not ( = ?auto_185507 ?auto_185510 ) ) ( not ( = ?auto_185507 ?auto_185511 ) ) ( not ( = ?auto_185507 ?auto_185512 ) ) ( not ( = ?auto_185507 ?auto_185513 ) ) ( not ( = ?auto_185508 ?auto_185509 ) ) ( not ( = ?auto_185508 ?auto_185510 ) ) ( not ( = ?auto_185508 ?auto_185511 ) ) ( not ( = ?auto_185508 ?auto_185512 ) ) ( not ( = ?auto_185508 ?auto_185513 ) ) ( not ( = ?auto_185509 ?auto_185510 ) ) ( not ( = ?auto_185509 ?auto_185511 ) ) ( not ( = ?auto_185509 ?auto_185512 ) ) ( not ( = ?auto_185509 ?auto_185513 ) ) ( not ( = ?auto_185510 ?auto_185511 ) ) ( not ( = ?auto_185510 ?auto_185512 ) ) ( not ( = ?auto_185510 ?auto_185513 ) ) ( not ( = ?auto_185511 ?auto_185512 ) ) ( not ( = ?auto_185511 ?auto_185513 ) ) ( not ( = ?auto_185512 ?auto_185513 ) ) ( ON ?auto_185513 ?auto_185514 ) ( not ( = ?auto_185506 ?auto_185514 ) ) ( not ( = ?auto_185507 ?auto_185514 ) ) ( not ( = ?auto_185508 ?auto_185514 ) ) ( not ( = ?auto_185509 ?auto_185514 ) ) ( not ( = ?auto_185510 ?auto_185514 ) ) ( not ( = ?auto_185511 ?auto_185514 ) ) ( not ( = ?auto_185512 ?auto_185514 ) ) ( not ( = ?auto_185513 ?auto_185514 ) ) ( ON ?auto_185512 ?auto_185513 ) ( ON-TABLE ?auto_185514 ) ( ON ?auto_185511 ?auto_185512 ) ( ON ?auto_185510 ?auto_185511 ) ( ON ?auto_185509 ?auto_185510 ) ( CLEAR ?auto_185507 ) ( ON ?auto_185508 ?auto_185509 ) ( CLEAR ?auto_185508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185514 ?auto_185513 ?auto_185512 ?auto_185511 ?auto_185510 ?auto_185509 )
      ( MAKE-8PILE ?auto_185506 ?auto_185507 ?auto_185508 ?auto_185509 ?auto_185510 ?auto_185511 ?auto_185512 ?auto_185513 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185515 - BLOCK
      ?auto_185516 - BLOCK
      ?auto_185517 - BLOCK
      ?auto_185518 - BLOCK
      ?auto_185519 - BLOCK
      ?auto_185520 - BLOCK
      ?auto_185521 - BLOCK
      ?auto_185522 - BLOCK
    )
    :vars
    (
      ?auto_185523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185515 ) ( not ( = ?auto_185515 ?auto_185516 ) ) ( not ( = ?auto_185515 ?auto_185517 ) ) ( not ( = ?auto_185515 ?auto_185518 ) ) ( not ( = ?auto_185515 ?auto_185519 ) ) ( not ( = ?auto_185515 ?auto_185520 ) ) ( not ( = ?auto_185515 ?auto_185521 ) ) ( not ( = ?auto_185515 ?auto_185522 ) ) ( not ( = ?auto_185516 ?auto_185517 ) ) ( not ( = ?auto_185516 ?auto_185518 ) ) ( not ( = ?auto_185516 ?auto_185519 ) ) ( not ( = ?auto_185516 ?auto_185520 ) ) ( not ( = ?auto_185516 ?auto_185521 ) ) ( not ( = ?auto_185516 ?auto_185522 ) ) ( not ( = ?auto_185517 ?auto_185518 ) ) ( not ( = ?auto_185517 ?auto_185519 ) ) ( not ( = ?auto_185517 ?auto_185520 ) ) ( not ( = ?auto_185517 ?auto_185521 ) ) ( not ( = ?auto_185517 ?auto_185522 ) ) ( not ( = ?auto_185518 ?auto_185519 ) ) ( not ( = ?auto_185518 ?auto_185520 ) ) ( not ( = ?auto_185518 ?auto_185521 ) ) ( not ( = ?auto_185518 ?auto_185522 ) ) ( not ( = ?auto_185519 ?auto_185520 ) ) ( not ( = ?auto_185519 ?auto_185521 ) ) ( not ( = ?auto_185519 ?auto_185522 ) ) ( not ( = ?auto_185520 ?auto_185521 ) ) ( not ( = ?auto_185520 ?auto_185522 ) ) ( not ( = ?auto_185521 ?auto_185522 ) ) ( ON ?auto_185522 ?auto_185523 ) ( not ( = ?auto_185515 ?auto_185523 ) ) ( not ( = ?auto_185516 ?auto_185523 ) ) ( not ( = ?auto_185517 ?auto_185523 ) ) ( not ( = ?auto_185518 ?auto_185523 ) ) ( not ( = ?auto_185519 ?auto_185523 ) ) ( not ( = ?auto_185520 ?auto_185523 ) ) ( not ( = ?auto_185521 ?auto_185523 ) ) ( not ( = ?auto_185522 ?auto_185523 ) ) ( ON ?auto_185521 ?auto_185522 ) ( ON-TABLE ?auto_185523 ) ( ON ?auto_185520 ?auto_185521 ) ( ON ?auto_185519 ?auto_185520 ) ( ON ?auto_185518 ?auto_185519 ) ( ON ?auto_185517 ?auto_185518 ) ( CLEAR ?auto_185517 ) ( HOLDING ?auto_185516 ) ( CLEAR ?auto_185515 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185515 ?auto_185516 )
      ( MAKE-8PILE ?auto_185515 ?auto_185516 ?auto_185517 ?auto_185518 ?auto_185519 ?auto_185520 ?auto_185521 ?auto_185522 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185524 - BLOCK
      ?auto_185525 - BLOCK
      ?auto_185526 - BLOCK
      ?auto_185527 - BLOCK
      ?auto_185528 - BLOCK
      ?auto_185529 - BLOCK
      ?auto_185530 - BLOCK
      ?auto_185531 - BLOCK
    )
    :vars
    (
      ?auto_185532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_185524 ) ( not ( = ?auto_185524 ?auto_185525 ) ) ( not ( = ?auto_185524 ?auto_185526 ) ) ( not ( = ?auto_185524 ?auto_185527 ) ) ( not ( = ?auto_185524 ?auto_185528 ) ) ( not ( = ?auto_185524 ?auto_185529 ) ) ( not ( = ?auto_185524 ?auto_185530 ) ) ( not ( = ?auto_185524 ?auto_185531 ) ) ( not ( = ?auto_185525 ?auto_185526 ) ) ( not ( = ?auto_185525 ?auto_185527 ) ) ( not ( = ?auto_185525 ?auto_185528 ) ) ( not ( = ?auto_185525 ?auto_185529 ) ) ( not ( = ?auto_185525 ?auto_185530 ) ) ( not ( = ?auto_185525 ?auto_185531 ) ) ( not ( = ?auto_185526 ?auto_185527 ) ) ( not ( = ?auto_185526 ?auto_185528 ) ) ( not ( = ?auto_185526 ?auto_185529 ) ) ( not ( = ?auto_185526 ?auto_185530 ) ) ( not ( = ?auto_185526 ?auto_185531 ) ) ( not ( = ?auto_185527 ?auto_185528 ) ) ( not ( = ?auto_185527 ?auto_185529 ) ) ( not ( = ?auto_185527 ?auto_185530 ) ) ( not ( = ?auto_185527 ?auto_185531 ) ) ( not ( = ?auto_185528 ?auto_185529 ) ) ( not ( = ?auto_185528 ?auto_185530 ) ) ( not ( = ?auto_185528 ?auto_185531 ) ) ( not ( = ?auto_185529 ?auto_185530 ) ) ( not ( = ?auto_185529 ?auto_185531 ) ) ( not ( = ?auto_185530 ?auto_185531 ) ) ( ON ?auto_185531 ?auto_185532 ) ( not ( = ?auto_185524 ?auto_185532 ) ) ( not ( = ?auto_185525 ?auto_185532 ) ) ( not ( = ?auto_185526 ?auto_185532 ) ) ( not ( = ?auto_185527 ?auto_185532 ) ) ( not ( = ?auto_185528 ?auto_185532 ) ) ( not ( = ?auto_185529 ?auto_185532 ) ) ( not ( = ?auto_185530 ?auto_185532 ) ) ( not ( = ?auto_185531 ?auto_185532 ) ) ( ON ?auto_185530 ?auto_185531 ) ( ON-TABLE ?auto_185532 ) ( ON ?auto_185529 ?auto_185530 ) ( ON ?auto_185528 ?auto_185529 ) ( ON ?auto_185527 ?auto_185528 ) ( ON ?auto_185526 ?auto_185527 ) ( CLEAR ?auto_185524 ) ( ON ?auto_185525 ?auto_185526 ) ( CLEAR ?auto_185525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185532 ?auto_185531 ?auto_185530 ?auto_185529 ?auto_185528 ?auto_185527 ?auto_185526 )
      ( MAKE-8PILE ?auto_185524 ?auto_185525 ?auto_185526 ?auto_185527 ?auto_185528 ?auto_185529 ?auto_185530 ?auto_185531 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185533 - BLOCK
      ?auto_185534 - BLOCK
      ?auto_185535 - BLOCK
      ?auto_185536 - BLOCK
      ?auto_185537 - BLOCK
      ?auto_185538 - BLOCK
      ?auto_185539 - BLOCK
      ?auto_185540 - BLOCK
    )
    :vars
    (
      ?auto_185541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185533 ?auto_185534 ) ) ( not ( = ?auto_185533 ?auto_185535 ) ) ( not ( = ?auto_185533 ?auto_185536 ) ) ( not ( = ?auto_185533 ?auto_185537 ) ) ( not ( = ?auto_185533 ?auto_185538 ) ) ( not ( = ?auto_185533 ?auto_185539 ) ) ( not ( = ?auto_185533 ?auto_185540 ) ) ( not ( = ?auto_185534 ?auto_185535 ) ) ( not ( = ?auto_185534 ?auto_185536 ) ) ( not ( = ?auto_185534 ?auto_185537 ) ) ( not ( = ?auto_185534 ?auto_185538 ) ) ( not ( = ?auto_185534 ?auto_185539 ) ) ( not ( = ?auto_185534 ?auto_185540 ) ) ( not ( = ?auto_185535 ?auto_185536 ) ) ( not ( = ?auto_185535 ?auto_185537 ) ) ( not ( = ?auto_185535 ?auto_185538 ) ) ( not ( = ?auto_185535 ?auto_185539 ) ) ( not ( = ?auto_185535 ?auto_185540 ) ) ( not ( = ?auto_185536 ?auto_185537 ) ) ( not ( = ?auto_185536 ?auto_185538 ) ) ( not ( = ?auto_185536 ?auto_185539 ) ) ( not ( = ?auto_185536 ?auto_185540 ) ) ( not ( = ?auto_185537 ?auto_185538 ) ) ( not ( = ?auto_185537 ?auto_185539 ) ) ( not ( = ?auto_185537 ?auto_185540 ) ) ( not ( = ?auto_185538 ?auto_185539 ) ) ( not ( = ?auto_185538 ?auto_185540 ) ) ( not ( = ?auto_185539 ?auto_185540 ) ) ( ON ?auto_185540 ?auto_185541 ) ( not ( = ?auto_185533 ?auto_185541 ) ) ( not ( = ?auto_185534 ?auto_185541 ) ) ( not ( = ?auto_185535 ?auto_185541 ) ) ( not ( = ?auto_185536 ?auto_185541 ) ) ( not ( = ?auto_185537 ?auto_185541 ) ) ( not ( = ?auto_185538 ?auto_185541 ) ) ( not ( = ?auto_185539 ?auto_185541 ) ) ( not ( = ?auto_185540 ?auto_185541 ) ) ( ON ?auto_185539 ?auto_185540 ) ( ON-TABLE ?auto_185541 ) ( ON ?auto_185538 ?auto_185539 ) ( ON ?auto_185537 ?auto_185538 ) ( ON ?auto_185536 ?auto_185537 ) ( ON ?auto_185535 ?auto_185536 ) ( ON ?auto_185534 ?auto_185535 ) ( CLEAR ?auto_185534 ) ( HOLDING ?auto_185533 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185533 )
      ( MAKE-8PILE ?auto_185533 ?auto_185534 ?auto_185535 ?auto_185536 ?auto_185537 ?auto_185538 ?auto_185539 ?auto_185540 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_185542 - BLOCK
      ?auto_185543 - BLOCK
      ?auto_185544 - BLOCK
      ?auto_185545 - BLOCK
      ?auto_185546 - BLOCK
      ?auto_185547 - BLOCK
      ?auto_185548 - BLOCK
      ?auto_185549 - BLOCK
    )
    :vars
    (
      ?auto_185550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185542 ?auto_185543 ) ) ( not ( = ?auto_185542 ?auto_185544 ) ) ( not ( = ?auto_185542 ?auto_185545 ) ) ( not ( = ?auto_185542 ?auto_185546 ) ) ( not ( = ?auto_185542 ?auto_185547 ) ) ( not ( = ?auto_185542 ?auto_185548 ) ) ( not ( = ?auto_185542 ?auto_185549 ) ) ( not ( = ?auto_185543 ?auto_185544 ) ) ( not ( = ?auto_185543 ?auto_185545 ) ) ( not ( = ?auto_185543 ?auto_185546 ) ) ( not ( = ?auto_185543 ?auto_185547 ) ) ( not ( = ?auto_185543 ?auto_185548 ) ) ( not ( = ?auto_185543 ?auto_185549 ) ) ( not ( = ?auto_185544 ?auto_185545 ) ) ( not ( = ?auto_185544 ?auto_185546 ) ) ( not ( = ?auto_185544 ?auto_185547 ) ) ( not ( = ?auto_185544 ?auto_185548 ) ) ( not ( = ?auto_185544 ?auto_185549 ) ) ( not ( = ?auto_185545 ?auto_185546 ) ) ( not ( = ?auto_185545 ?auto_185547 ) ) ( not ( = ?auto_185545 ?auto_185548 ) ) ( not ( = ?auto_185545 ?auto_185549 ) ) ( not ( = ?auto_185546 ?auto_185547 ) ) ( not ( = ?auto_185546 ?auto_185548 ) ) ( not ( = ?auto_185546 ?auto_185549 ) ) ( not ( = ?auto_185547 ?auto_185548 ) ) ( not ( = ?auto_185547 ?auto_185549 ) ) ( not ( = ?auto_185548 ?auto_185549 ) ) ( ON ?auto_185549 ?auto_185550 ) ( not ( = ?auto_185542 ?auto_185550 ) ) ( not ( = ?auto_185543 ?auto_185550 ) ) ( not ( = ?auto_185544 ?auto_185550 ) ) ( not ( = ?auto_185545 ?auto_185550 ) ) ( not ( = ?auto_185546 ?auto_185550 ) ) ( not ( = ?auto_185547 ?auto_185550 ) ) ( not ( = ?auto_185548 ?auto_185550 ) ) ( not ( = ?auto_185549 ?auto_185550 ) ) ( ON ?auto_185548 ?auto_185549 ) ( ON-TABLE ?auto_185550 ) ( ON ?auto_185547 ?auto_185548 ) ( ON ?auto_185546 ?auto_185547 ) ( ON ?auto_185545 ?auto_185546 ) ( ON ?auto_185544 ?auto_185545 ) ( ON ?auto_185543 ?auto_185544 ) ( ON ?auto_185542 ?auto_185543 ) ( CLEAR ?auto_185542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185550 ?auto_185549 ?auto_185548 ?auto_185547 ?auto_185546 ?auto_185545 ?auto_185544 ?auto_185543 )
      ( MAKE-8PILE ?auto_185542 ?auto_185543 ?auto_185544 ?auto_185545 ?auto_185546 ?auto_185547 ?auto_185548 ?auto_185549 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185687 - BLOCK
    )
    :vars
    (
      ?auto_185688 - BLOCK
      ?auto_185689 - BLOCK
      ?auto_185690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185687 ?auto_185688 ) ( CLEAR ?auto_185687 ) ( not ( = ?auto_185687 ?auto_185688 ) ) ( HOLDING ?auto_185689 ) ( CLEAR ?auto_185690 ) ( not ( = ?auto_185687 ?auto_185689 ) ) ( not ( = ?auto_185687 ?auto_185690 ) ) ( not ( = ?auto_185688 ?auto_185689 ) ) ( not ( = ?auto_185688 ?auto_185690 ) ) ( not ( = ?auto_185689 ?auto_185690 ) ) )
    :subtasks
    ( ( !STACK ?auto_185689 ?auto_185690 )
      ( MAKE-1PILE ?auto_185687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185691 - BLOCK
    )
    :vars
    (
      ?auto_185692 - BLOCK
      ?auto_185693 - BLOCK
      ?auto_185694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185691 ?auto_185692 ) ( not ( = ?auto_185691 ?auto_185692 ) ) ( CLEAR ?auto_185693 ) ( not ( = ?auto_185691 ?auto_185694 ) ) ( not ( = ?auto_185691 ?auto_185693 ) ) ( not ( = ?auto_185692 ?auto_185694 ) ) ( not ( = ?auto_185692 ?auto_185693 ) ) ( not ( = ?auto_185694 ?auto_185693 ) ) ( ON ?auto_185694 ?auto_185691 ) ( CLEAR ?auto_185694 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185692 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185692 ?auto_185691 )
      ( MAKE-1PILE ?auto_185691 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185695 - BLOCK
    )
    :vars
    (
      ?auto_185697 - BLOCK
      ?auto_185696 - BLOCK
      ?auto_185698 - BLOCK
      ?auto_185703 - BLOCK
      ?auto_185702 - BLOCK
      ?auto_185700 - BLOCK
      ?auto_185699 - BLOCK
      ?auto_185701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185695 ?auto_185697 ) ( not ( = ?auto_185695 ?auto_185697 ) ) ( not ( = ?auto_185695 ?auto_185696 ) ) ( not ( = ?auto_185695 ?auto_185698 ) ) ( not ( = ?auto_185697 ?auto_185696 ) ) ( not ( = ?auto_185697 ?auto_185698 ) ) ( not ( = ?auto_185696 ?auto_185698 ) ) ( ON ?auto_185696 ?auto_185695 ) ( CLEAR ?auto_185696 ) ( ON-TABLE ?auto_185697 ) ( HOLDING ?auto_185698 ) ( CLEAR ?auto_185703 ) ( ON-TABLE ?auto_185702 ) ( ON ?auto_185700 ?auto_185702 ) ( ON ?auto_185699 ?auto_185700 ) ( ON ?auto_185701 ?auto_185699 ) ( ON ?auto_185703 ?auto_185701 ) ( not ( = ?auto_185702 ?auto_185700 ) ) ( not ( = ?auto_185702 ?auto_185699 ) ) ( not ( = ?auto_185702 ?auto_185701 ) ) ( not ( = ?auto_185702 ?auto_185703 ) ) ( not ( = ?auto_185702 ?auto_185698 ) ) ( not ( = ?auto_185700 ?auto_185699 ) ) ( not ( = ?auto_185700 ?auto_185701 ) ) ( not ( = ?auto_185700 ?auto_185703 ) ) ( not ( = ?auto_185700 ?auto_185698 ) ) ( not ( = ?auto_185699 ?auto_185701 ) ) ( not ( = ?auto_185699 ?auto_185703 ) ) ( not ( = ?auto_185699 ?auto_185698 ) ) ( not ( = ?auto_185701 ?auto_185703 ) ) ( not ( = ?auto_185701 ?auto_185698 ) ) ( not ( = ?auto_185703 ?auto_185698 ) ) ( not ( = ?auto_185695 ?auto_185703 ) ) ( not ( = ?auto_185695 ?auto_185702 ) ) ( not ( = ?auto_185695 ?auto_185700 ) ) ( not ( = ?auto_185695 ?auto_185699 ) ) ( not ( = ?auto_185695 ?auto_185701 ) ) ( not ( = ?auto_185697 ?auto_185703 ) ) ( not ( = ?auto_185697 ?auto_185702 ) ) ( not ( = ?auto_185697 ?auto_185700 ) ) ( not ( = ?auto_185697 ?auto_185699 ) ) ( not ( = ?auto_185697 ?auto_185701 ) ) ( not ( = ?auto_185696 ?auto_185703 ) ) ( not ( = ?auto_185696 ?auto_185702 ) ) ( not ( = ?auto_185696 ?auto_185700 ) ) ( not ( = ?auto_185696 ?auto_185699 ) ) ( not ( = ?auto_185696 ?auto_185701 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185702 ?auto_185700 ?auto_185699 ?auto_185701 ?auto_185703 ?auto_185698 )
      ( MAKE-1PILE ?auto_185695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185704 - BLOCK
    )
    :vars
    (
      ?auto_185708 - BLOCK
      ?auto_185707 - BLOCK
      ?auto_185706 - BLOCK
      ?auto_185710 - BLOCK
      ?auto_185711 - BLOCK
      ?auto_185705 - BLOCK
      ?auto_185709 - BLOCK
      ?auto_185712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185704 ?auto_185708 ) ( not ( = ?auto_185704 ?auto_185708 ) ) ( not ( = ?auto_185704 ?auto_185707 ) ) ( not ( = ?auto_185704 ?auto_185706 ) ) ( not ( = ?auto_185708 ?auto_185707 ) ) ( not ( = ?auto_185708 ?auto_185706 ) ) ( not ( = ?auto_185707 ?auto_185706 ) ) ( ON ?auto_185707 ?auto_185704 ) ( ON-TABLE ?auto_185708 ) ( CLEAR ?auto_185710 ) ( ON-TABLE ?auto_185711 ) ( ON ?auto_185705 ?auto_185711 ) ( ON ?auto_185709 ?auto_185705 ) ( ON ?auto_185712 ?auto_185709 ) ( ON ?auto_185710 ?auto_185712 ) ( not ( = ?auto_185711 ?auto_185705 ) ) ( not ( = ?auto_185711 ?auto_185709 ) ) ( not ( = ?auto_185711 ?auto_185712 ) ) ( not ( = ?auto_185711 ?auto_185710 ) ) ( not ( = ?auto_185711 ?auto_185706 ) ) ( not ( = ?auto_185705 ?auto_185709 ) ) ( not ( = ?auto_185705 ?auto_185712 ) ) ( not ( = ?auto_185705 ?auto_185710 ) ) ( not ( = ?auto_185705 ?auto_185706 ) ) ( not ( = ?auto_185709 ?auto_185712 ) ) ( not ( = ?auto_185709 ?auto_185710 ) ) ( not ( = ?auto_185709 ?auto_185706 ) ) ( not ( = ?auto_185712 ?auto_185710 ) ) ( not ( = ?auto_185712 ?auto_185706 ) ) ( not ( = ?auto_185710 ?auto_185706 ) ) ( not ( = ?auto_185704 ?auto_185710 ) ) ( not ( = ?auto_185704 ?auto_185711 ) ) ( not ( = ?auto_185704 ?auto_185705 ) ) ( not ( = ?auto_185704 ?auto_185709 ) ) ( not ( = ?auto_185704 ?auto_185712 ) ) ( not ( = ?auto_185708 ?auto_185710 ) ) ( not ( = ?auto_185708 ?auto_185711 ) ) ( not ( = ?auto_185708 ?auto_185705 ) ) ( not ( = ?auto_185708 ?auto_185709 ) ) ( not ( = ?auto_185708 ?auto_185712 ) ) ( not ( = ?auto_185707 ?auto_185710 ) ) ( not ( = ?auto_185707 ?auto_185711 ) ) ( not ( = ?auto_185707 ?auto_185705 ) ) ( not ( = ?auto_185707 ?auto_185709 ) ) ( not ( = ?auto_185707 ?auto_185712 ) ) ( ON ?auto_185706 ?auto_185707 ) ( CLEAR ?auto_185706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185708 ?auto_185704 ?auto_185707 )
      ( MAKE-1PILE ?auto_185704 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185713 - BLOCK
    )
    :vars
    (
      ?auto_185717 - BLOCK
      ?auto_185718 - BLOCK
      ?auto_185716 - BLOCK
      ?auto_185720 - BLOCK
      ?auto_185721 - BLOCK
      ?auto_185714 - BLOCK
      ?auto_185715 - BLOCK
      ?auto_185719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185713 ?auto_185717 ) ( not ( = ?auto_185713 ?auto_185717 ) ) ( not ( = ?auto_185713 ?auto_185718 ) ) ( not ( = ?auto_185713 ?auto_185716 ) ) ( not ( = ?auto_185717 ?auto_185718 ) ) ( not ( = ?auto_185717 ?auto_185716 ) ) ( not ( = ?auto_185718 ?auto_185716 ) ) ( ON ?auto_185718 ?auto_185713 ) ( ON-TABLE ?auto_185717 ) ( ON-TABLE ?auto_185720 ) ( ON ?auto_185721 ?auto_185720 ) ( ON ?auto_185714 ?auto_185721 ) ( ON ?auto_185715 ?auto_185714 ) ( not ( = ?auto_185720 ?auto_185721 ) ) ( not ( = ?auto_185720 ?auto_185714 ) ) ( not ( = ?auto_185720 ?auto_185715 ) ) ( not ( = ?auto_185720 ?auto_185719 ) ) ( not ( = ?auto_185720 ?auto_185716 ) ) ( not ( = ?auto_185721 ?auto_185714 ) ) ( not ( = ?auto_185721 ?auto_185715 ) ) ( not ( = ?auto_185721 ?auto_185719 ) ) ( not ( = ?auto_185721 ?auto_185716 ) ) ( not ( = ?auto_185714 ?auto_185715 ) ) ( not ( = ?auto_185714 ?auto_185719 ) ) ( not ( = ?auto_185714 ?auto_185716 ) ) ( not ( = ?auto_185715 ?auto_185719 ) ) ( not ( = ?auto_185715 ?auto_185716 ) ) ( not ( = ?auto_185719 ?auto_185716 ) ) ( not ( = ?auto_185713 ?auto_185719 ) ) ( not ( = ?auto_185713 ?auto_185720 ) ) ( not ( = ?auto_185713 ?auto_185721 ) ) ( not ( = ?auto_185713 ?auto_185714 ) ) ( not ( = ?auto_185713 ?auto_185715 ) ) ( not ( = ?auto_185717 ?auto_185719 ) ) ( not ( = ?auto_185717 ?auto_185720 ) ) ( not ( = ?auto_185717 ?auto_185721 ) ) ( not ( = ?auto_185717 ?auto_185714 ) ) ( not ( = ?auto_185717 ?auto_185715 ) ) ( not ( = ?auto_185718 ?auto_185719 ) ) ( not ( = ?auto_185718 ?auto_185720 ) ) ( not ( = ?auto_185718 ?auto_185721 ) ) ( not ( = ?auto_185718 ?auto_185714 ) ) ( not ( = ?auto_185718 ?auto_185715 ) ) ( ON ?auto_185716 ?auto_185718 ) ( CLEAR ?auto_185716 ) ( HOLDING ?auto_185719 ) ( CLEAR ?auto_185715 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185720 ?auto_185721 ?auto_185714 ?auto_185715 ?auto_185719 )
      ( MAKE-1PILE ?auto_185713 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185722 - BLOCK
    )
    :vars
    (
      ?auto_185727 - BLOCK
      ?auto_185729 - BLOCK
      ?auto_185728 - BLOCK
      ?auto_185725 - BLOCK
      ?auto_185723 - BLOCK
      ?auto_185730 - BLOCK
      ?auto_185724 - BLOCK
      ?auto_185726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185722 ?auto_185727 ) ( not ( = ?auto_185722 ?auto_185727 ) ) ( not ( = ?auto_185722 ?auto_185729 ) ) ( not ( = ?auto_185722 ?auto_185728 ) ) ( not ( = ?auto_185727 ?auto_185729 ) ) ( not ( = ?auto_185727 ?auto_185728 ) ) ( not ( = ?auto_185729 ?auto_185728 ) ) ( ON ?auto_185729 ?auto_185722 ) ( ON-TABLE ?auto_185727 ) ( ON-TABLE ?auto_185725 ) ( ON ?auto_185723 ?auto_185725 ) ( ON ?auto_185730 ?auto_185723 ) ( ON ?auto_185724 ?auto_185730 ) ( not ( = ?auto_185725 ?auto_185723 ) ) ( not ( = ?auto_185725 ?auto_185730 ) ) ( not ( = ?auto_185725 ?auto_185724 ) ) ( not ( = ?auto_185725 ?auto_185726 ) ) ( not ( = ?auto_185725 ?auto_185728 ) ) ( not ( = ?auto_185723 ?auto_185730 ) ) ( not ( = ?auto_185723 ?auto_185724 ) ) ( not ( = ?auto_185723 ?auto_185726 ) ) ( not ( = ?auto_185723 ?auto_185728 ) ) ( not ( = ?auto_185730 ?auto_185724 ) ) ( not ( = ?auto_185730 ?auto_185726 ) ) ( not ( = ?auto_185730 ?auto_185728 ) ) ( not ( = ?auto_185724 ?auto_185726 ) ) ( not ( = ?auto_185724 ?auto_185728 ) ) ( not ( = ?auto_185726 ?auto_185728 ) ) ( not ( = ?auto_185722 ?auto_185726 ) ) ( not ( = ?auto_185722 ?auto_185725 ) ) ( not ( = ?auto_185722 ?auto_185723 ) ) ( not ( = ?auto_185722 ?auto_185730 ) ) ( not ( = ?auto_185722 ?auto_185724 ) ) ( not ( = ?auto_185727 ?auto_185726 ) ) ( not ( = ?auto_185727 ?auto_185725 ) ) ( not ( = ?auto_185727 ?auto_185723 ) ) ( not ( = ?auto_185727 ?auto_185730 ) ) ( not ( = ?auto_185727 ?auto_185724 ) ) ( not ( = ?auto_185729 ?auto_185726 ) ) ( not ( = ?auto_185729 ?auto_185725 ) ) ( not ( = ?auto_185729 ?auto_185723 ) ) ( not ( = ?auto_185729 ?auto_185730 ) ) ( not ( = ?auto_185729 ?auto_185724 ) ) ( ON ?auto_185728 ?auto_185729 ) ( CLEAR ?auto_185724 ) ( ON ?auto_185726 ?auto_185728 ) ( CLEAR ?auto_185726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185727 ?auto_185722 ?auto_185729 ?auto_185728 )
      ( MAKE-1PILE ?auto_185722 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185731 - BLOCK
    )
    :vars
    (
      ?auto_185734 - BLOCK
      ?auto_185735 - BLOCK
      ?auto_185738 - BLOCK
      ?auto_185733 - BLOCK
      ?auto_185737 - BLOCK
      ?auto_185732 - BLOCK
      ?auto_185736 - BLOCK
      ?auto_185739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185731 ?auto_185734 ) ( not ( = ?auto_185731 ?auto_185734 ) ) ( not ( = ?auto_185731 ?auto_185735 ) ) ( not ( = ?auto_185731 ?auto_185738 ) ) ( not ( = ?auto_185734 ?auto_185735 ) ) ( not ( = ?auto_185734 ?auto_185738 ) ) ( not ( = ?auto_185735 ?auto_185738 ) ) ( ON ?auto_185735 ?auto_185731 ) ( ON-TABLE ?auto_185734 ) ( ON-TABLE ?auto_185733 ) ( ON ?auto_185737 ?auto_185733 ) ( ON ?auto_185732 ?auto_185737 ) ( not ( = ?auto_185733 ?auto_185737 ) ) ( not ( = ?auto_185733 ?auto_185732 ) ) ( not ( = ?auto_185733 ?auto_185736 ) ) ( not ( = ?auto_185733 ?auto_185739 ) ) ( not ( = ?auto_185733 ?auto_185738 ) ) ( not ( = ?auto_185737 ?auto_185732 ) ) ( not ( = ?auto_185737 ?auto_185736 ) ) ( not ( = ?auto_185737 ?auto_185739 ) ) ( not ( = ?auto_185737 ?auto_185738 ) ) ( not ( = ?auto_185732 ?auto_185736 ) ) ( not ( = ?auto_185732 ?auto_185739 ) ) ( not ( = ?auto_185732 ?auto_185738 ) ) ( not ( = ?auto_185736 ?auto_185739 ) ) ( not ( = ?auto_185736 ?auto_185738 ) ) ( not ( = ?auto_185739 ?auto_185738 ) ) ( not ( = ?auto_185731 ?auto_185739 ) ) ( not ( = ?auto_185731 ?auto_185733 ) ) ( not ( = ?auto_185731 ?auto_185737 ) ) ( not ( = ?auto_185731 ?auto_185732 ) ) ( not ( = ?auto_185731 ?auto_185736 ) ) ( not ( = ?auto_185734 ?auto_185739 ) ) ( not ( = ?auto_185734 ?auto_185733 ) ) ( not ( = ?auto_185734 ?auto_185737 ) ) ( not ( = ?auto_185734 ?auto_185732 ) ) ( not ( = ?auto_185734 ?auto_185736 ) ) ( not ( = ?auto_185735 ?auto_185739 ) ) ( not ( = ?auto_185735 ?auto_185733 ) ) ( not ( = ?auto_185735 ?auto_185737 ) ) ( not ( = ?auto_185735 ?auto_185732 ) ) ( not ( = ?auto_185735 ?auto_185736 ) ) ( ON ?auto_185738 ?auto_185735 ) ( ON ?auto_185739 ?auto_185738 ) ( CLEAR ?auto_185739 ) ( HOLDING ?auto_185736 ) ( CLEAR ?auto_185732 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_185733 ?auto_185737 ?auto_185732 ?auto_185736 )
      ( MAKE-1PILE ?auto_185731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185740 - BLOCK
    )
    :vars
    (
      ?auto_185741 - BLOCK
      ?auto_185745 - BLOCK
      ?auto_185744 - BLOCK
      ?auto_185742 - BLOCK
      ?auto_185743 - BLOCK
      ?auto_185747 - BLOCK
      ?auto_185748 - BLOCK
      ?auto_185746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185740 ?auto_185741 ) ( not ( = ?auto_185740 ?auto_185741 ) ) ( not ( = ?auto_185740 ?auto_185745 ) ) ( not ( = ?auto_185740 ?auto_185744 ) ) ( not ( = ?auto_185741 ?auto_185745 ) ) ( not ( = ?auto_185741 ?auto_185744 ) ) ( not ( = ?auto_185745 ?auto_185744 ) ) ( ON ?auto_185745 ?auto_185740 ) ( ON-TABLE ?auto_185741 ) ( ON-TABLE ?auto_185742 ) ( ON ?auto_185743 ?auto_185742 ) ( ON ?auto_185747 ?auto_185743 ) ( not ( = ?auto_185742 ?auto_185743 ) ) ( not ( = ?auto_185742 ?auto_185747 ) ) ( not ( = ?auto_185742 ?auto_185748 ) ) ( not ( = ?auto_185742 ?auto_185746 ) ) ( not ( = ?auto_185742 ?auto_185744 ) ) ( not ( = ?auto_185743 ?auto_185747 ) ) ( not ( = ?auto_185743 ?auto_185748 ) ) ( not ( = ?auto_185743 ?auto_185746 ) ) ( not ( = ?auto_185743 ?auto_185744 ) ) ( not ( = ?auto_185747 ?auto_185748 ) ) ( not ( = ?auto_185747 ?auto_185746 ) ) ( not ( = ?auto_185747 ?auto_185744 ) ) ( not ( = ?auto_185748 ?auto_185746 ) ) ( not ( = ?auto_185748 ?auto_185744 ) ) ( not ( = ?auto_185746 ?auto_185744 ) ) ( not ( = ?auto_185740 ?auto_185746 ) ) ( not ( = ?auto_185740 ?auto_185742 ) ) ( not ( = ?auto_185740 ?auto_185743 ) ) ( not ( = ?auto_185740 ?auto_185747 ) ) ( not ( = ?auto_185740 ?auto_185748 ) ) ( not ( = ?auto_185741 ?auto_185746 ) ) ( not ( = ?auto_185741 ?auto_185742 ) ) ( not ( = ?auto_185741 ?auto_185743 ) ) ( not ( = ?auto_185741 ?auto_185747 ) ) ( not ( = ?auto_185741 ?auto_185748 ) ) ( not ( = ?auto_185745 ?auto_185746 ) ) ( not ( = ?auto_185745 ?auto_185742 ) ) ( not ( = ?auto_185745 ?auto_185743 ) ) ( not ( = ?auto_185745 ?auto_185747 ) ) ( not ( = ?auto_185745 ?auto_185748 ) ) ( ON ?auto_185744 ?auto_185745 ) ( ON ?auto_185746 ?auto_185744 ) ( CLEAR ?auto_185747 ) ( ON ?auto_185748 ?auto_185746 ) ( CLEAR ?auto_185748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185741 ?auto_185740 ?auto_185745 ?auto_185744 ?auto_185746 )
      ( MAKE-1PILE ?auto_185740 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185749 - BLOCK
    )
    :vars
    (
      ?auto_185754 - BLOCK
      ?auto_185752 - BLOCK
      ?auto_185750 - BLOCK
      ?auto_185757 - BLOCK
      ?auto_185756 - BLOCK
      ?auto_185753 - BLOCK
      ?auto_185755 - BLOCK
      ?auto_185751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185749 ?auto_185754 ) ( not ( = ?auto_185749 ?auto_185754 ) ) ( not ( = ?auto_185749 ?auto_185752 ) ) ( not ( = ?auto_185749 ?auto_185750 ) ) ( not ( = ?auto_185754 ?auto_185752 ) ) ( not ( = ?auto_185754 ?auto_185750 ) ) ( not ( = ?auto_185752 ?auto_185750 ) ) ( ON ?auto_185752 ?auto_185749 ) ( ON-TABLE ?auto_185754 ) ( ON-TABLE ?auto_185757 ) ( ON ?auto_185756 ?auto_185757 ) ( not ( = ?auto_185757 ?auto_185756 ) ) ( not ( = ?auto_185757 ?auto_185753 ) ) ( not ( = ?auto_185757 ?auto_185755 ) ) ( not ( = ?auto_185757 ?auto_185751 ) ) ( not ( = ?auto_185757 ?auto_185750 ) ) ( not ( = ?auto_185756 ?auto_185753 ) ) ( not ( = ?auto_185756 ?auto_185755 ) ) ( not ( = ?auto_185756 ?auto_185751 ) ) ( not ( = ?auto_185756 ?auto_185750 ) ) ( not ( = ?auto_185753 ?auto_185755 ) ) ( not ( = ?auto_185753 ?auto_185751 ) ) ( not ( = ?auto_185753 ?auto_185750 ) ) ( not ( = ?auto_185755 ?auto_185751 ) ) ( not ( = ?auto_185755 ?auto_185750 ) ) ( not ( = ?auto_185751 ?auto_185750 ) ) ( not ( = ?auto_185749 ?auto_185751 ) ) ( not ( = ?auto_185749 ?auto_185757 ) ) ( not ( = ?auto_185749 ?auto_185756 ) ) ( not ( = ?auto_185749 ?auto_185753 ) ) ( not ( = ?auto_185749 ?auto_185755 ) ) ( not ( = ?auto_185754 ?auto_185751 ) ) ( not ( = ?auto_185754 ?auto_185757 ) ) ( not ( = ?auto_185754 ?auto_185756 ) ) ( not ( = ?auto_185754 ?auto_185753 ) ) ( not ( = ?auto_185754 ?auto_185755 ) ) ( not ( = ?auto_185752 ?auto_185751 ) ) ( not ( = ?auto_185752 ?auto_185757 ) ) ( not ( = ?auto_185752 ?auto_185756 ) ) ( not ( = ?auto_185752 ?auto_185753 ) ) ( not ( = ?auto_185752 ?auto_185755 ) ) ( ON ?auto_185750 ?auto_185752 ) ( ON ?auto_185751 ?auto_185750 ) ( ON ?auto_185755 ?auto_185751 ) ( CLEAR ?auto_185755 ) ( HOLDING ?auto_185753 ) ( CLEAR ?auto_185756 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185757 ?auto_185756 ?auto_185753 )
      ( MAKE-1PILE ?auto_185749 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185758 - BLOCK
    )
    :vars
    (
      ?auto_185762 - BLOCK
      ?auto_185765 - BLOCK
      ?auto_185763 - BLOCK
      ?auto_185761 - BLOCK
      ?auto_185766 - BLOCK
      ?auto_185764 - BLOCK
      ?auto_185760 - BLOCK
      ?auto_185759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185758 ?auto_185762 ) ( not ( = ?auto_185758 ?auto_185762 ) ) ( not ( = ?auto_185758 ?auto_185765 ) ) ( not ( = ?auto_185758 ?auto_185763 ) ) ( not ( = ?auto_185762 ?auto_185765 ) ) ( not ( = ?auto_185762 ?auto_185763 ) ) ( not ( = ?auto_185765 ?auto_185763 ) ) ( ON ?auto_185765 ?auto_185758 ) ( ON-TABLE ?auto_185762 ) ( ON-TABLE ?auto_185761 ) ( ON ?auto_185766 ?auto_185761 ) ( not ( = ?auto_185761 ?auto_185766 ) ) ( not ( = ?auto_185761 ?auto_185764 ) ) ( not ( = ?auto_185761 ?auto_185760 ) ) ( not ( = ?auto_185761 ?auto_185759 ) ) ( not ( = ?auto_185761 ?auto_185763 ) ) ( not ( = ?auto_185766 ?auto_185764 ) ) ( not ( = ?auto_185766 ?auto_185760 ) ) ( not ( = ?auto_185766 ?auto_185759 ) ) ( not ( = ?auto_185766 ?auto_185763 ) ) ( not ( = ?auto_185764 ?auto_185760 ) ) ( not ( = ?auto_185764 ?auto_185759 ) ) ( not ( = ?auto_185764 ?auto_185763 ) ) ( not ( = ?auto_185760 ?auto_185759 ) ) ( not ( = ?auto_185760 ?auto_185763 ) ) ( not ( = ?auto_185759 ?auto_185763 ) ) ( not ( = ?auto_185758 ?auto_185759 ) ) ( not ( = ?auto_185758 ?auto_185761 ) ) ( not ( = ?auto_185758 ?auto_185766 ) ) ( not ( = ?auto_185758 ?auto_185764 ) ) ( not ( = ?auto_185758 ?auto_185760 ) ) ( not ( = ?auto_185762 ?auto_185759 ) ) ( not ( = ?auto_185762 ?auto_185761 ) ) ( not ( = ?auto_185762 ?auto_185766 ) ) ( not ( = ?auto_185762 ?auto_185764 ) ) ( not ( = ?auto_185762 ?auto_185760 ) ) ( not ( = ?auto_185765 ?auto_185759 ) ) ( not ( = ?auto_185765 ?auto_185761 ) ) ( not ( = ?auto_185765 ?auto_185766 ) ) ( not ( = ?auto_185765 ?auto_185764 ) ) ( not ( = ?auto_185765 ?auto_185760 ) ) ( ON ?auto_185763 ?auto_185765 ) ( ON ?auto_185759 ?auto_185763 ) ( ON ?auto_185760 ?auto_185759 ) ( CLEAR ?auto_185766 ) ( ON ?auto_185764 ?auto_185760 ) ( CLEAR ?auto_185764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185762 ?auto_185758 ?auto_185765 ?auto_185763 ?auto_185759 ?auto_185760 )
      ( MAKE-1PILE ?auto_185758 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185767 - BLOCK
    )
    :vars
    (
      ?auto_185770 - BLOCK
      ?auto_185768 - BLOCK
      ?auto_185769 - BLOCK
      ?auto_185771 - BLOCK
      ?auto_185775 - BLOCK
      ?auto_185774 - BLOCK
      ?auto_185773 - BLOCK
      ?auto_185772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185767 ?auto_185770 ) ( not ( = ?auto_185767 ?auto_185770 ) ) ( not ( = ?auto_185767 ?auto_185768 ) ) ( not ( = ?auto_185767 ?auto_185769 ) ) ( not ( = ?auto_185770 ?auto_185768 ) ) ( not ( = ?auto_185770 ?auto_185769 ) ) ( not ( = ?auto_185768 ?auto_185769 ) ) ( ON ?auto_185768 ?auto_185767 ) ( ON-TABLE ?auto_185770 ) ( ON-TABLE ?auto_185771 ) ( not ( = ?auto_185771 ?auto_185775 ) ) ( not ( = ?auto_185771 ?auto_185774 ) ) ( not ( = ?auto_185771 ?auto_185773 ) ) ( not ( = ?auto_185771 ?auto_185772 ) ) ( not ( = ?auto_185771 ?auto_185769 ) ) ( not ( = ?auto_185775 ?auto_185774 ) ) ( not ( = ?auto_185775 ?auto_185773 ) ) ( not ( = ?auto_185775 ?auto_185772 ) ) ( not ( = ?auto_185775 ?auto_185769 ) ) ( not ( = ?auto_185774 ?auto_185773 ) ) ( not ( = ?auto_185774 ?auto_185772 ) ) ( not ( = ?auto_185774 ?auto_185769 ) ) ( not ( = ?auto_185773 ?auto_185772 ) ) ( not ( = ?auto_185773 ?auto_185769 ) ) ( not ( = ?auto_185772 ?auto_185769 ) ) ( not ( = ?auto_185767 ?auto_185772 ) ) ( not ( = ?auto_185767 ?auto_185771 ) ) ( not ( = ?auto_185767 ?auto_185775 ) ) ( not ( = ?auto_185767 ?auto_185774 ) ) ( not ( = ?auto_185767 ?auto_185773 ) ) ( not ( = ?auto_185770 ?auto_185772 ) ) ( not ( = ?auto_185770 ?auto_185771 ) ) ( not ( = ?auto_185770 ?auto_185775 ) ) ( not ( = ?auto_185770 ?auto_185774 ) ) ( not ( = ?auto_185770 ?auto_185773 ) ) ( not ( = ?auto_185768 ?auto_185772 ) ) ( not ( = ?auto_185768 ?auto_185771 ) ) ( not ( = ?auto_185768 ?auto_185775 ) ) ( not ( = ?auto_185768 ?auto_185774 ) ) ( not ( = ?auto_185768 ?auto_185773 ) ) ( ON ?auto_185769 ?auto_185768 ) ( ON ?auto_185772 ?auto_185769 ) ( ON ?auto_185773 ?auto_185772 ) ( ON ?auto_185774 ?auto_185773 ) ( CLEAR ?auto_185774 ) ( HOLDING ?auto_185775 ) ( CLEAR ?auto_185771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185771 ?auto_185775 )
      ( MAKE-1PILE ?auto_185767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185776 - BLOCK
    )
    :vars
    (
      ?auto_185778 - BLOCK
      ?auto_185781 - BLOCK
      ?auto_185777 - BLOCK
      ?auto_185784 - BLOCK
      ?auto_185780 - BLOCK
      ?auto_185782 - BLOCK
      ?auto_185783 - BLOCK
      ?auto_185779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185776 ?auto_185778 ) ( not ( = ?auto_185776 ?auto_185778 ) ) ( not ( = ?auto_185776 ?auto_185781 ) ) ( not ( = ?auto_185776 ?auto_185777 ) ) ( not ( = ?auto_185778 ?auto_185781 ) ) ( not ( = ?auto_185778 ?auto_185777 ) ) ( not ( = ?auto_185781 ?auto_185777 ) ) ( ON ?auto_185781 ?auto_185776 ) ( ON-TABLE ?auto_185778 ) ( ON-TABLE ?auto_185784 ) ( not ( = ?auto_185784 ?auto_185780 ) ) ( not ( = ?auto_185784 ?auto_185782 ) ) ( not ( = ?auto_185784 ?auto_185783 ) ) ( not ( = ?auto_185784 ?auto_185779 ) ) ( not ( = ?auto_185784 ?auto_185777 ) ) ( not ( = ?auto_185780 ?auto_185782 ) ) ( not ( = ?auto_185780 ?auto_185783 ) ) ( not ( = ?auto_185780 ?auto_185779 ) ) ( not ( = ?auto_185780 ?auto_185777 ) ) ( not ( = ?auto_185782 ?auto_185783 ) ) ( not ( = ?auto_185782 ?auto_185779 ) ) ( not ( = ?auto_185782 ?auto_185777 ) ) ( not ( = ?auto_185783 ?auto_185779 ) ) ( not ( = ?auto_185783 ?auto_185777 ) ) ( not ( = ?auto_185779 ?auto_185777 ) ) ( not ( = ?auto_185776 ?auto_185779 ) ) ( not ( = ?auto_185776 ?auto_185784 ) ) ( not ( = ?auto_185776 ?auto_185780 ) ) ( not ( = ?auto_185776 ?auto_185782 ) ) ( not ( = ?auto_185776 ?auto_185783 ) ) ( not ( = ?auto_185778 ?auto_185779 ) ) ( not ( = ?auto_185778 ?auto_185784 ) ) ( not ( = ?auto_185778 ?auto_185780 ) ) ( not ( = ?auto_185778 ?auto_185782 ) ) ( not ( = ?auto_185778 ?auto_185783 ) ) ( not ( = ?auto_185781 ?auto_185779 ) ) ( not ( = ?auto_185781 ?auto_185784 ) ) ( not ( = ?auto_185781 ?auto_185780 ) ) ( not ( = ?auto_185781 ?auto_185782 ) ) ( not ( = ?auto_185781 ?auto_185783 ) ) ( ON ?auto_185777 ?auto_185781 ) ( ON ?auto_185779 ?auto_185777 ) ( ON ?auto_185783 ?auto_185779 ) ( ON ?auto_185782 ?auto_185783 ) ( CLEAR ?auto_185784 ) ( ON ?auto_185780 ?auto_185782 ) ( CLEAR ?auto_185780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185778 ?auto_185776 ?auto_185781 ?auto_185777 ?auto_185779 ?auto_185783 ?auto_185782 )
      ( MAKE-1PILE ?auto_185776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185785 - BLOCK
    )
    :vars
    (
      ?auto_185790 - BLOCK
      ?auto_185788 - BLOCK
      ?auto_185789 - BLOCK
      ?auto_185786 - BLOCK
      ?auto_185792 - BLOCK
      ?auto_185791 - BLOCK
      ?auto_185787 - BLOCK
      ?auto_185793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185785 ?auto_185790 ) ( not ( = ?auto_185785 ?auto_185790 ) ) ( not ( = ?auto_185785 ?auto_185788 ) ) ( not ( = ?auto_185785 ?auto_185789 ) ) ( not ( = ?auto_185790 ?auto_185788 ) ) ( not ( = ?auto_185790 ?auto_185789 ) ) ( not ( = ?auto_185788 ?auto_185789 ) ) ( ON ?auto_185788 ?auto_185785 ) ( ON-TABLE ?auto_185790 ) ( not ( = ?auto_185786 ?auto_185792 ) ) ( not ( = ?auto_185786 ?auto_185791 ) ) ( not ( = ?auto_185786 ?auto_185787 ) ) ( not ( = ?auto_185786 ?auto_185793 ) ) ( not ( = ?auto_185786 ?auto_185789 ) ) ( not ( = ?auto_185792 ?auto_185791 ) ) ( not ( = ?auto_185792 ?auto_185787 ) ) ( not ( = ?auto_185792 ?auto_185793 ) ) ( not ( = ?auto_185792 ?auto_185789 ) ) ( not ( = ?auto_185791 ?auto_185787 ) ) ( not ( = ?auto_185791 ?auto_185793 ) ) ( not ( = ?auto_185791 ?auto_185789 ) ) ( not ( = ?auto_185787 ?auto_185793 ) ) ( not ( = ?auto_185787 ?auto_185789 ) ) ( not ( = ?auto_185793 ?auto_185789 ) ) ( not ( = ?auto_185785 ?auto_185793 ) ) ( not ( = ?auto_185785 ?auto_185786 ) ) ( not ( = ?auto_185785 ?auto_185792 ) ) ( not ( = ?auto_185785 ?auto_185791 ) ) ( not ( = ?auto_185785 ?auto_185787 ) ) ( not ( = ?auto_185790 ?auto_185793 ) ) ( not ( = ?auto_185790 ?auto_185786 ) ) ( not ( = ?auto_185790 ?auto_185792 ) ) ( not ( = ?auto_185790 ?auto_185791 ) ) ( not ( = ?auto_185790 ?auto_185787 ) ) ( not ( = ?auto_185788 ?auto_185793 ) ) ( not ( = ?auto_185788 ?auto_185786 ) ) ( not ( = ?auto_185788 ?auto_185792 ) ) ( not ( = ?auto_185788 ?auto_185791 ) ) ( not ( = ?auto_185788 ?auto_185787 ) ) ( ON ?auto_185789 ?auto_185788 ) ( ON ?auto_185793 ?auto_185789 ) ( ON ?auto_185787 ?auto_185793 ) ( ON ?auto_185791 ?auto_185787 ) ( ON ?auto_185792 ?auto_185791 ) ( CLEAR ?auto_185792 ) ( HOLDING ?auto_185786 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_185786 )
      ( MAKE-1PILE ?auto_185785 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_185794 - BLOCK
    )
    :vars
    (
      ?auto_185798 - BLOCK
      ?auto_185801 - BLOCK
      ?auto_185795 - BLOCK
      ?auto_185799 - BLOCK
      ?auto_185796 - BLOCK
      ?auto_185800 - BLOCK
      ?auto_185797 - BLOCK
      ?auto_185802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185794 ?auto_185798 ) ( not ( = ?auto_185794 ?auto_185798 ) ) ( not ( = ?auto_185794 ?auto_185801 ) ) ( not ( = ?auto_185794 ?auto_185795 ) ) ( not ( = ?auto_185798 ?auto_185801 ) ) ( not ( = ?auto_185798 ?auto_185795 ) ) ( not ( = ?auto_185801 ?auto_185795 ) ) ( ON ?auto_185801 ?auto_185794 ) ( ON-TABLE ?auto_185798 ) ( not ( = ?auto_185799 ?auto_185796 ) ) ( not ( = ?auto_185799 ?auto_185800 ) ) ( not ( = ?auto_185799 ?auto_185797 ) ) ( not ( = ?auto_185799 ?auto_185802 ) ) ( not ( = ?auto_185799 ?auto_185795 ) ) ( not ( = ?auto_185796 ?auto_185800 ) ) ( not ( = ?auto_185796 ?auto_185797 ) ) ( not ( = ?auto_185796 ?auto_185802 ) ) ( not ( = ?auto_185796 ?auto_185795 ) ) ( not ( = ?auto_185800 ?auto_185797 ) ) ( not ( = ?auto_185800 ?auto_185802 ) ) ( not ( = ?auto_185800 ?auto_185795 ) ) ( not ( = ?auto_185797 ?auto_185802 ) ) ( not ( = ?auto_185797 ?auto_185795 ) ) ( not ( = ?auto_185802 ?auto_185795 ) ) ( not ( = ?auto_185794 ?auto_185802 ) ) ( not ( = ?auto_185794 ?auto_185799 ) ) ( not ( = ?auto_185794 ?auto_185796 ) ) ( not ( = ?auto_185794 ?auto_185800 ) ) ( not ( = ?auto_185794 ?auto_185797 ) ) ( not ( = ?auto_185798 ?auto_185802 ) ) ( not ( = ?auto_185798 ?auto_185799 ) ) ( not ( = ?auto_185798 ?auto_185796 ) ) ( not ( = ?auto_185798 ?auto_185800 ) ) ( not ( = ?auto_185798 ?auto_185797 ) ) ( not ( = ?auto_185801 ?auto_185802 ) ) ( not ( = ?auto_185801 ?auto_185799 ) ) ( not ( = ?auto_185801 ?auto_185796 ) ) ( not ( = ?auto_185801 ?auto_185800 ) ) ( not ( = ?auto_185801 ?auto_185797 ) ) ( ON ?auto_185795 ?auto_185801 ) ( ON ?auto_185802 ?auto_185795 ) ( ON ?auto_185797 ?auto_185802 ) ( ON ?auto_185800 ?auto_185797 ) ( ON ?auto_185796 ?auto_185800 ) ( ON ?auto_185799 ?auto_185796 ) ( CLEAR ?auto_185799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_185798 ?auto_185794 ?auto_185801 ?auto_185795 ?auto_185802 ?auto_185797 ?auto_185800 ?auto_185796 )
      ( MAKE-1PILE ?auto_185794 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_185816 - BLOCK
      ?auto_185817 - BLOCK
      ?auto_185818 - BLOCK
      ?auto_185819 - BLOCK
      ?auto_185820 - BLOCK
      ?auto_185821 - BLOCK
    )
    :vars
    (
      ?auto_185822 - BLOCK
      ?auto_185823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_185822 ?auto_185821 ) ( CLEAR ?auto_185822 ) ( ON-TABLE ?auto_185816 ) ( ON ?auto_185817 ?auto_185816 ) ( ON ?auto_185818 ?auto_185817 ) ( ON ?auto_185819 ?auto_185818 ) ( ON ?auto_185820 ?auto_185819 ) ( ON ?auto_185821 ?auto_185820 ) ( not ( = ?auto_185816 ?auto_185817 ) ) ( not ( = ?auto_185816 ?auto_185818 ) ) ( not ( = ?auto_185816 ?auto_185819 ) ) ( not ( = ?auto_185816 ?auto_185820 ) ) ( not ( = ?auto_185816 ?auto_185821 ) ) ( not ( = ?auto_185816 ?auto_185822 ) ) ( not ( = ?auto_185817 ?auto_185818 ) ) ( not ( = ?auto_185817 ?auto_185819 ) ) ( not ( = ?auto_185817 ?auto_185820 ) ) ( not ( = ?auto_185817 ?auto_185821 ) ) ( not ( = ?auto_185817 ?auto_185822 ) ) ( not ( = ?auto_185818 ?auto_185819 ) ) ( not ( = ?auto_185818 ?auto_185820 ) ) ( not ( = ?auto_185818 ?auto_185821 ) ) ( not ( = ?auto_185818 ?auto_185822 ) ) ( not ( = ?auto_185819 ?auto_185820 ) ) ( not ( = ?auto_185819 ?auto_185821 ) ) ( not ( = ?auto_185819 ?auto_185822 ) ) ( not ( = ?auto_185820 ?auto_185821 ) ) ( not ( = ?auto_185820 ?auto_185822 ) ) ( not ( = ?auto_185821 ?auto_185822 ) ) ( HOLDING ?auto_185823 ) ( not ( = ?auto_185816 ?auto_185823 ) ) ( not ( = ?auto_185817 ?auto_185823 ) ) ( not ( = ?auto_185818 ?auto_185823 ) ) ( not ( = ?auto_185819 ?auto_185823 ) ) ( not ( = ?auto_185820 ?auto_185823 ) ) ( not ( = ?auto_185821 ?auto_185823 ) ) ( not ( = ?auto_185822 ?auto_185823 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_185823 )
      ( MAKE-6PILE ?auto_185816 ?auto_185817 ?auto_185818 ?auto_185819 ?auto_185820 ?auto_185821 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185941 - BLOCK
      ?auto_185942 - BLOCK
    )
    :vars
    (
      ?auto_185943 - BLOCK
      ?auto_185946 - BLOCK
      ?auto_185947 - BLOCK
      ?auto_185948 - BLOCK
      ?auto_185944 - BLOCK
      ?auto_185945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185941 ?auto_185942 ) ) ( ON ?auto_185942 ?auto_185943 ) ( not ( = ?auto_185941 ?auto_185943 ) ) ( not ( = ?auto_185942 ?auto_185943 ) ) ( ON ?auto_185941 ?auto_185942 ) ( CLEAR ?auto_185941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185946 ) ( ON ?auto_185947 ?auto_185946 ) ( ON ?auto_185948 ?auto_185947 ) ( ON ?auto_185944 ?auto_185948 ) ( ON ?auto_185945 ?auto_185944 ) ( ON ?auto_185943 ?auto_185945 ) ( not ( = ?auto_185946 ?auto_185947 ) ) ( not ( = ?auto_185946 ?auto_185948 ) ) ( not ( = ?auto_185946 ?auto_185944 ) ) ( not ( = ?auto_185946 ?auto_185945 ) ) ( not ( = ?auto_185946 ?auto_185943 ) ) ( not ( = ?auto_185946 ?auto_185942 ) ) ( not ( = ?auto_185946 ?auto_185941 ) ) ( not ( = ?auto_185947 ?auto_185948 ) ) ( not ( = ?auto_185947 ?auto_185944 ) ) ( not ( = ?auto_185947 ?auto_185945 ) ) ( not ( = ?auto_185947 ?auto_185943 ) ) ( not ( = ?auto_185947 ?auto_185942 ) ) ( not ( = ?auto_185947 ?auto_185941 ) ) ( not ( = ?auto_185948 ?auto_185944 ) ) ( not ( = ?auto_185948 ?auto_185945 ) ) ( not ( = ?auto_185948 ?auto_185943 ) ) ( not ( = ?auto_185948 ?auto_185942 ) ) ( not ( = ?auto_185948 ?auto_185941 ) ) ( not ( = ?auto_185944 ?auto_185945 ) ) ( not ( = ?auto_185944 ?auto_185943 ) ) ( not ( = ?auto_185944 ?auto_185942 ) ) ( not ( = ?auto_185944 ?auto_185941 ) ) ( not ( = ?auto_185945 ?auto_185943 ) ) ( not ( = ?auto_185945 ?auto_185942 ) ) ( not ( = ?auto_185945 ?auto_185941 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185946 ?auto_185947 ?auto_185948 ?auto_185944 ?auto_185945 ?auto_185943 ?auto_185942 )
      ( MAKE-2PILE ?auto_185941 ?auto_185942 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185951 - BLOCK
      ?auto_185952 - BLOCK
    )
    :vars
    (
      ?auto_185953 - BLOCK
      ?auto_185954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185951 ?auto_185952 ) ) ( ON ?auto_185952 ?auto_185953 ) ( CLEAR ?auto_185952 ) ( not ( = ?auto_185951 ?auto_185953 ) ) ( not ( = ?auto_185952 ?auto_185953 ) ) ( ON ?auto_185951 ?auto_185954 ) ( CLEAR ?auto_185951 ) ( HAND-EMPTY ) ( not ( = ?auto_185951 ?auto_185954 ) ) ( not ( = ?auto_185952 ?auto_185954 ) ) ( not ( = ?auto_185953 ?auto_185954 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185951 ?auto_185954 )
      ( MAKE-2PILE ?auto_185951 ?auto_185952 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185955 - BLOCK
      ?auto_185956 - BLOCK
    )
    :vars
    (
      ?auto_185958 - BLOCK
      ?auto_185957 - BLOCK
      ?auto_185963 - BLOCK
      ?auto_185961 - BLOCK
      ?auto_185959 - BLOCK
      ?auto_185962 - BLOCK
      ?auto_185960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185955 ?auto_185956 ) ) ( not ( = ?auto_185955 ?auto_185958 ) ) ( not ( = ?auto_185956 ?auto_185958 ) ) ( ON ?auto_185955 ?auto_185957 ) ( CLEAR ?auto_185955 ) ( not ( = ?auto_185955 ?auto_185957 ) ) ( not ( = ?auto_185956 ?auto_185957 ) ) ( not ( = ?auto_185958 ?auto_185957 ) ) ( HOLDING ?auto_185956 ) ( CLEAR ?auto_185958 ) ( ON-TABLE ?auto_185963 ) ( ON ?auto_185961 ?auto_185963 ) ( ON ?auto_185959 ?auto_185961 ) ( ON ?auto_185962 ?auto_185959 ) ( ON ?auto_185960 ?auto_185962 ) ( ON ?auto_185958 ?auto_185960 ) ( not ( = ?auto_185963 ?auto_185961 ) ) ( not ( = ?auto_185963 ?auto_185959 ) ) ( not ( = ?auto_185963 ?auto_185962 ) ) ( not ( = ?auto_185963 ?auto_185960 ) ) ( not ( = ?auto_185963 ?auto_185958 ) ) ( not ( = ?auto_185963 ?auto_185956 ) ) ( not ( = ?auto_185961 ?auto_185959 ) ) ( not ( = ?auto_185961 ?auto_185962 ) ) ( not ( = ?auto_185961 ?auto_185960 ) ) ( not ( = ?auto_185961 ?auto_185958 ) ) ( not ( = ?auto_185961 ?auto_185956 ) ) ( not ( = ?auto_185959 ?auto_185962 ) ) ( not ( = ?auto_185959 ?auto_185960 ) ) ( not ( = ?auto_185959 ?auto_185958 ) ) ( not ( = ?auto_185959 ?auto_185956 ) ) ( not ( = ?auto_185962 ?auto_185960 ) ) ( not ( = ?auto_185962 ?auto_185958 ) ) ( not ( = ?auto_185962 ?auto_185956 ) ) ( not ( = ?auto_185960 ?auto_185958 ) ) ( not ( = ?auto_185960 ?auto_185956 ) ) ( not ( = ?auto_185955 ?auto_185963 ) ) ( not ( = ?auto_185955 ?auto_185961 ) ) ( not ( = ?auto_185955 ?auto_185959 ) ) ( not ( = ?auto_185955 ?auto_185962 ) ) ( not ( = ?auto_185955 ?auto_185960 ) ) ( not ( = ?auto_185957 ?auto_185963 ) ) ( not ( = ?auto_185957 ?auto_185961 ) ) ( not ( = ?auto_185957 ?auto_185959 ) ) ( not ( = ?auto_185957 ?auto_185962 ) ) ( not ( = ?auto_185957 ?auto_185960 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_185963 ?auto_185961 ?auto_185959 ?auto_185962 ?auto_185960 ?auto_185958 ?auto_185956 )
      ( MAKE-2PILE ?auto_185955 ?auto_185956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185964 - BLOCK
      ?auto_185965 - BLOCK
    )
    :vars
    (
      ?auto_185972 - BLOCK
      ?auto_185968 - BLOCK
      ?auto_185966 - BLOCK
      ?auto_185970 - BLOCK
      ?auto_185967 - BLOCK
      ?auto_185971 - BLOCK
      ?auto_185969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185964 ?auto_185965 ) ) ( not ( = ?auto_185964 ?auto_185972 ) ) ( not ( = ?auto_185965 ?auto_185972 ) ) ( ON ?auto_185964 ?auto_185968 ) ( not ( = ?auto_185964 ?auto_185968 ) ) ( not ( = ?auto_185965 ?auto_185968 ) ) ( not ( = ?auto_185972 ?auto_185968 ) ) ( CLEAR ?auto_185972 ) ( ON-TABLE ?auto_185966 ) ( ON ?auto_185970 ?auto_185966 ) ( ON ?auto_185967 ?auto_185970 ) ( ON ?auto_185971 ?auto_185967 ) ( ON ?auto_185969 ?auto_185971 ) ( ON ?auto_185972 ?auto_185969 ) ( not ( = ?auto_185966 ?auto_185970 ) ) ( not ( = ?auto_185966 ?auto_185967 ) ) ( not ( = ?auto_185966 ?auto_185971 ) ) ( not ( = ?auto_185966 ?auto_185969 ) ) ( not ( = ?auto_185966 ?auto_185972 ) ) ( not ( = ?auto_185966 ?auto_185965 ) ) ( not ( = ?auto_185970 ?auto_185967 ) ) ( not ( = ?auto_185970 ?auto_185971 ) ) ( not ( = ?auto_185970 ?auto_185969 ) ) ( not ( = ?auto_185970 ?auto_185972 ) ) ( not ( = ?auto_185970 ?auto_185965 ) ) ( not ( = ?auto_185967 ?auto_185971 ) ) ( not ( = ?auto_185967 ?auto_185969 ) ) ( not ( = ?auto_185967 ?auto_185972 ) ) ( not ( = ?auto_185967 ?auto_185965 ) ) ( not ( = ?auto_185971 ?auto_185969 ) ) ( not ( = ?auto_185971 ?auto_185972 ) ) ( not ( = ?auto_185971 ?auto_185965 ) ) ( not ( = ?auto_185969 ?auto_185972 ) ) ( not ( = ?auto_185969 ?auto_185965 ) ) ( not ( = ?auto_185964 ?auto_185966 ) ) ( not ( = ?auto_185964 ?auto_185970 ) ) ( not ( = ?auto_185964 ?auto_185967 ) ) ( not ( = ?auto_185964 ?auto_185971 ) ) ( not ( = ?auto_185964 ?auto_185969 ) ) ( not ( = ?auto_185968 ?auto_185966 ) ) ( not ( = ?auto_185968 ?auto_185970 ) ) ( not ( = ?auto_185968 ?auto_185967 ) ) ( not ( = ?auto_185968 ?auto_185971 ) ) ( not ( = ?auto_185968 ?auto_185969 ) ) ( ON ?auto_185965 ?auto_185964 ) ( CLEAR ?auto_185965 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_185968 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_185968 ?auto_185964 )
      ( MAKE-2PILE ?auto_185964 ?auto_185965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185973 - BLOCK
      ?auto_185974 - BLOCK
    )
    :vars
    (
      ?auto_185976 - BLOCK
      ?auto_185979 - BLOCK
      ?auto_185978 - BLOCK
      ?auto_185981 - BLOCK
      ?auto_185980 - BLOCK
      ?auto_185977 - BLOCK
      ?auto_185975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185973 ?auto_185974 ) ) ( not ( = ?auto_185973 ?auto_185976 ) ) ( not ( = ?auto_185974 ?auto_185976 ) ) ( ON ?auto_185973 ?auto_185979 ) ( not ( = ?auto_185973 ?auto_185979 ) ) ( not ( = ?auto_185974 ?auto_185979 ) ) ( not ( = ?auto_185976 ?auto_185979 ) ) ( ON-TABLE ?auto_185978 ) ( ON ?auto_185981 ?auto_185978 ) ( ON ?auto_185980 ?auto_185981 ) ( ON ?auto_185977 ?auto_185980 ) ( ON ?auto_185975 ?auto_185977 ) ( not ( = ?auto_185978 ?auto_185981 ) ) ( not ( = ?auto_185978 ?auto_185980 ) ) ( not ( = ?auto_185978 ?auto_185977 ) ) ( not ( = ?auto_185978 ?auto_185975 ) ) ( not ( = ?auto_185978 ?auto_185976 ) ) ( not ( = ?auto_185978 ?auto_185974 ) ) ( not ( = ?auto_185981 ?auto_185980 ) ) ( not ( = ?auto_185981 ?auto_185977 ) ) ( not ( = ?auto_185981 ?auto_185975 ) ) ( not ( = ?auto_185981 ?auto_185976 ) ) ( not ( = ?auto_185981 ?auto_185974 ) ) ( not ( = ?auto_185980 ?auto_185977 ) ) ( not ( = ?auto_185980 ?auto_185975 ) ) ( not ( = ?auto_185980 ?auto_185976 ) ) ( not ( = ?auto_185980 ?auto_185974 ) ) ( not ( = ?auto_185977 ?auto_185975 ) ) ( not ( = ?auto_185977 ?auto_185976 ) ) ( not ( = ?auto_185977 ?auto_185974 ) ) ( not ( = ?auto_185975 ?auto_185976 ) ) ( not ( = ?auto_185975 ?auto_185974 ) ) ( not ( = ?auto_185973 ?auto_185978 ) ) ( not ( = ?auto_185973 ?auto_185981 ) ) ( not ( = ?auto_185973 ?auto_185980 ) ) ( not ( = ?auto_185973 ?auto_185977 ) ) ( not ( = ?auto_185973 ?auto_185975 ) ) ( not ( = ?auto_185979 ?auto_185978 ) ) ( not ( = ?auto_185979 ?auto_185981 ) ) ( not ( = ?auto_185979 ?auto_185980 ) ) ( not ( = ?auto_185979 ?auto_185977 ) ) ( not ( = ?auto_185979 ?auto_185975 ) ) ( ON ?auto_185974 ?auto_185973 ) ( CLEAR ?auto_185974 ) ( ON-TABLE ?auto_185979 ) ( HOLDING ?auto_185976 ) ( CLEAR ?auto_185975 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_185978 ?auto_185981 ?auto_185980 ?auto_185977 ?auto_185975 ?auto_185976 )
      ( MAKE-2PILE ?auto_185973 ?auto_185974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185982 - BLOCK
      ?auto_185983 - BLOCK
    )
    :vars
    (
      ?auto_185989 - BLOCK
      ?auto_185988 - BLOCK
      ?auto_185990 - BLOCK
      ?auto_185985 - BLOCK
      ?auto_185986 - BLOCK
      ?auto_185984 - BLOCK
      ?auto_185987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185982 ?auto_185983 ) ) ( not ( = ?auto_185982 ?auto_185989 ) ) ( not ( = ?auto_185983 ?auto_185989 ) ) ( ON ?auto_185982 ?auto_185988 ) ( not ( = ?auto_185982 ?auto_185988 ) ) ( not ( = ?auto_185983 ?auto_185988 ) ) ( not ( = ?auto_185989 ?auto_185988 ) ) ( ON-TABLE ?auto_185990 ) ( ON ?auto_185985 ?auto_185990 ) ( ON ?auto_185986 ?auto_185985 ) ( ON ?auto_185984 ?auto_185986 ) ( ON ?auto_185987 ?auto_185984 ) ( not ( = ?auto_185990 ?auto_185985 ) ) ( not ( = ?auto_185990 ?auto_185986 ) ) ( not ( = ?auto_185990 ?auto_185984 ) ) ( not ( = ?auto_185990 ?auto_185987 ) ) ( not ( = ?auto_185990 ?auto_185989 ) ) ( not ( = ?auto_185990 ?auto_185983 ) ) ( not ( = ?auto_185985 ?auto_185986 ) ) ( not ( = ?auto_185985 ?auto_185984 ) ) ( not ( = ?auto_185985 ?auto_185987 ) ) ( not ( = ?auto_185985 ?auto_185989 ) ) ( not ( = ?auto_185985 ?auto_185983 ) ) ( not ( = ?auto_185986 ?auto_185984 ) ) ( not ( = ?auto_185986 ?auto_185987 ) ) ( not ( = ?auto_185986 ?auto_185989 ) ) ( not ( = ?auto_185986 ?auto_185983 ) ) ( not ( = ?auto_185984 ?auto_185987 ) ) ( not ( = ?auto_185984 ?auto_185989 ) ) ( not ( = ?auto_185984 ?auto_185983 ) ) ( not ( = ?auto_185987 ?auto_185989 ) ) ( not ( = ?auto_185987 ?auto_185983 ) ) ( not ( = ?auto_185982 ?auto_185990 ) ) ( not ( = ?auto_185982 ?auto_185985 ) ) ( not ( = ?auto_185982 ?auto_185986 ) ) ( not ( = ?auto_185982 ?auto_185984 ) ) ( not ( = ?auto_185982 ?auto_185987 ) ) ( not ( = ?auto_185988 ?auto_185990 ) ) ( not ( = ?auto_185988 ?auto_185985 ) ) ( not ( = ?auto_185988 ?auto_185986 ) ) ( not ( = ?auto_185988 ?auto_185984 ) ) ( not ( = ?auto_185988 ?auto_185987 ) ) ( ON ?auto_185983 ?auto_185982 ) ( ON-TABLE ?auto_185988 ) ( CLEAR ?auto_185987 ) ( ON ?auto_185989 ?auto_185983 ) ( CLEAR ?auto_185989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_185988 ?auto_185982 ?auto_185983 )
      ( MAKE-2PILE ?auto_185982 ?auto_185983 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_185991 - BLOCK
      ?auto_185992 - BLOCK
    )
    :vars
    (
      ?auto_185995 - BLOCK
      ?auto_185996 - BLOCK
      ?auto_185993 - BLOCK
      ?auto_185998 - BLOCK
      ?auto_185994 - BLOCK
      ?auto_185999 - BLOCK
      ?auto_185997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_185991 ?auto_185992 ) ) ( not ( = ?auto_185991 ?auto_185995 ) ) ( not ( = ?auto_185992 ?auto_185995 ) ) ( ON ?auto_185991 ?auto_185996 ) ( not ( = ?auto_185991 ?auto_185996 ) ) ( not ( = ?auto_185992 ?auto_185996 ) ) ( not ( = ?auto_185995 ?auto_185996 ) ) ( ON-TABLE ?auto_185993 ) ( ON ?auto_185998 ?auto_185993 ) ( ON ?auto_185994 ?auto_185998 ) ( ON ?auto_185999 ?auto_185994 ) ( not ( = ?auto_185993 ?auto_185998 ) ) ( not ( = ?auto_185993 ?auto_185994 ) ) ( not ( = ?auto_185993 ?auto_185999 ) ) ( not ( = ?auto_185993 ?auto_185997 ) ) ( not ( = ?auto_185993 ?auto_185995 ) ) ( not ( = ?auto_185993 ?auto_185992 ) ) ( not ( = ?auto_185998 ?auto_185994 ) ) ( not ( = ?auto_185998 ?auto_185999 ) ) ( not ( = ?auto_185998 ?auto_185997 ) ) ( not ( = ?auto_185998 ?auto_185995 ) ) ( not ( = ?auto_185998 ?auto_185992 ) ) ( not ( = ?auto_185994 ?auto_185999 ) ) ( not ( = ?auto_185994 ?auto_185997 ) ) ( not ( = ?auto_185994 ?auto_185995 ) ) ( not ( = ?auto_185994 ?auto_185992 ) ) ( not ( = ?auto_185999 ?auto_185997 ) ) ( not ( = ?auto_185999 ?auto_185995 ) ) ( not ( = ?auto_185999 ?auto_185992 ) ) ( not ( = ?auto_185997 ?auto_185995 ) ) ( not ( = ?auto_185997 ?auto_185992 ) ) ( not ( = ?auto_185991 ?auto_185993 ) ) ( not ( = ?auto_185991 ?auto_185998 ) ) ( not ( = ?auto_185991 ?auto_185994 ) ) ( not ( = ?auto_185991 ?auto_185999 ) ) ( not ( = ?auto_185991 ?auto_185997 ) ) ( not ( = ?auto_185996 ?auto_185993 ) ) ( not ( = ?auto_185996 ?auto_185998 ) ) ( not ( = ?auto_185996 ?auto_185994 ) ) ( not ( = ?auto_185996 ?auto_185999 ) ) ( not ( = ?auto_185996 ?auto_185997 ) ) ( ON ?auto_185992 ?auto_185991 ) ( ON-TABLE ?auto_185996 ) ( ON ?auto_185995 ?auto_185992 ) ( CLEAR ?auto_185995 ) ( HOLDING ?auto_185997 ) ( CLEAR ?auto_185999 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_185993 ?auto_185998 ?auto_185994 ?auto_185999 ?auto_185997 )
      ( MAKE-2PILE ?auto_185991 ?auto_185992 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186000 - BLOCK
      ?auto_186001 - BLOCK
    )
    :vars
    (
      ?auto_186003 - BLOCK
      ?auto_186007 - BLOCK
      ?auto_186005 - BLOCK
      ?auto_186008 - BLOCK
      ?auto_186002 - BLOCK
      ?auto_186006 - BLOCK
      ?auto_186004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186000 ?auto_186001 ) ) ( not ( = ?auto_186000 ?auto_186003 ) ) ( not ( = ?auto_186001 ?auto_186003 ) ) ( ON ?auto_186000 ?auto_186007 ) ( not ( = ?auto_186000 ?auto_186007 ) ) ( not ( = ?auto_186001 ?auto_186007 ) ) ( not ( = ?auto_186003 ?auto_186007 ) ) ( ON-TABLE ?auto_186005 ) ( ON ?auto_186008 ?auto_186005 ) ( ON ?auto_186002 ?auto_186008 ) ( ON ?auto_186006 ?auto_186002 ) ( not ( = ?auto_186005 ?auto_186008 ) ) ( not ( = ?auto_186005 ?auto_186002 ) ) ( not ( = ?auto_186005 ?auto_186006 ) ) ( not ( = ?auto_186005 ?auto_186004 ) ) ( not ( = ?auto_186005 ?auto_186003 ) ) ( not ( = ?auto_186005 ?auto_186001 ) ) ( not ( = ?auto_186008 ?auto_186002 ) ) ( not ( = ?auto_186008 ?auto_186006 ) ) ( not ( = ?auto_186008 ?auto_186004 ) ) ( not ( = ?auto_186008 ?auto_186003 ) ) ( not ( = ?auto_186008 ?auto_186001 ) ) ( not ( = ?auto_186002 ?auto_186006 ) ) ( not ( = ?auto_186002 ?auto_186004 ) ) ( not ( = ?auto_186002 ?auto_186003 ) ) ( not ( = ?auto_186002 ?auto_186001 ) ) ( not ( = ?auto_186006 ?auto_186004 ) ) ( not ( = ?auto_186006 ?auto_186003 ) ) ( not ( = ?auto_186006 ?auto_186001 ) ) ( not ( = ?auto_186004 ?auto_186003 ) ) ( not ( = ?auto_186004 ?auto_186001 ) ) ( not ( = ?auto_186000 ?auto_186005 ) ) ( not ( = ?auto_186000 ?auto_186008 ) ) ( not ( = ?auto_186000 ?auto_186002 ) ) ( not ( = ?auto_186000 ?auto_186006 ) ) ( not ( = ?auto_186000 ?auto_186004 ) ) ( not ( = ?auto_186007 ?auto_186005 ) ) ( not ( = ?auto_186007 ?auto_186008 ) ) ( not ( = ?auto_186007 ?auto_186002 ) ) ( not ( = ?auto_186007 ?auto_186006 ) ) ( not ( = ?auto_186007 ?auto_186004 ) ) ( ON ?auto_186001 ?auto_186000 ) ( ON-TABLE ?auto_186007 ) ( ON ?auto_186003 ?auto_186001 ) ( CLEAR ?auto_186006 ) ( ON ?auto_186004 ?auto_186003 ) ( CLEAR ?auto_186004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186007 ?auto_186000 ?auto_186001 ?auto_186003 )
      ( MAKE-2PILE ?auto_186000 ?auto_186001 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186009 - BLOCK
      ?auto_186010 - BLOCK
    )
    :vars
    (
      ?auto_186017 - BLOCK
      ?auto_186015 - BLOCK
      ?auto_186014 - BLOCK
      ?auto_186011 - BLOCK
      ?auto_186013 - BLOCK
      ?auto_186012 - BLOCK
      ?auto_186016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186009 ?auto_186010 ) ) ( not ( = ?auto_186009 ?auto_186017 ) ) ( not ( = ?auto_186010 ?auto_186017 ) ) ( ON ?auto_186009 ?auto_186015 ) ( not ( = ?auto_186009 ?auto_186015 ) ) ( not ( = ?auto_186010 ?auto_186015 ) ) ( not ( = ?auto_186017 ?auto_186015 ) ) ( ON-TABLE ?auto_186014 ) ( ON ?auto_186011 ?auto_186014 ) ( ON ?auto_186013 ?auto_186011 ) ( not ( = ?auto_186014 ?auto_186011 ) ) ( not ( = ?auto_186014 ?auto_186013 ) ) ( not ( = ?auto_186014 ?auto_186012 ) ) ( not ( = ?auto_186014 ?auto_186016 ) ) ( not ( = ?auto_186014 ?auto_186017 ) ) ( not ( = ?auto_186014 ?auto_186010 ) ) ( not ( = ?auto_186011 ?auto_186013 ) ) ( not ( = ?auto_186011 ?auto_186012 ) ) ( not ( = ?auto_186011 ?auto_186016 ) ) ( not ( = ?auto_186011 ?auto_186017 ) ) ( not ( = ?auto_186011 ?auto_186010 ) ) ( not ( = ?auto_186013 ?auto_186012 ) ) ( not ( = ?auto_186013 ?auto_186016 ) ) ( not ( = ?auto_186013 ?auto_186017 ) ) ( not ( = ?auto_186013 ?auto_186010 ) ) ( not ( = ?auto_186012 ?auto_186016 ) ) ( not ( = ?auto_186012 ?auto_186017 ) ) ( not ( = ?auto_186012 ?auto_186010 ) ) ( not ( = ?auto_186016 ?auto_186017 ) ) ( not ( = ?auto_186016 ?auto_186010 ) ) ( not ( = ?auto_186009 ?auto_186014 ) ) ( not ( = ?auto_186009 ?auto_186011 ) ) ( not ( = ?auto_186009 ?auto_186013 ) ) ( not ( = ?auto_186009 ?auto_186012 ) ) ( not ( = ?auto_186009 ?auto_186016 ) ) ( not ( = ?auto_186015 ?auto_186014 ) ) ( not ( = ?auto_186015 ?auto_186011 ) ) ( not ( = ?auto_186015 ?auto_186013 ) ) ( not ( = ?auto_186015 ?auto_186012 ) ) ( not ( = ?auto_186015 ?auto_186016 ) ) ( ON ?auto_186010 ?auto_186009 ) ( ON-TABLE ?auto_186015 ) ( ON ?auto_186017 ?auto_186010 ) ( ON ?auto_186016 ?auto_186017 ) ( CLEAR ?auto_186016 ) ( HOLDING ?auto_186012 ) ( CLEAR ?auto_186013 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186014 ?auto_186011 ?auto_186013 ?auto_186012 )
      ( MAKE-2PILE ?auto_186009 ?auto_186010 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186018 - BLOCK
      ?auto_186019 - BLOCK
    )
    :vars
    (
      ?auto_186022 - BLOCK
      ?auto_186024 - BLOCK
      ?auto_186026 - BLOCK
      ?auto_186023 - BLOCK
      ?auto_186025 - BLOCK
      ?auto_186021 - BLOCK
      ?auto_186020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186018 ?auto_186019 ) ) ( not ( = ?auto_186018 ?auto_186022 ) ) ( not ( = ?auto_186019 ?auto_186022 ) ) ( ON ?auto_186018 ?auto_186024 ) ( not ( = ?auto_186018 ?auto_186024 ) ) ( not ( = ?auto_186019 ?auto_186024 ) ) ( not ( = ?auto_186022 ?auto_186024 ) ) ( ON-TABLE ?auto_186026 ) ( ON ?auto_186023 ?auto_186026 ) ( ON ?auto_186025 ?auto_186023 ) ( not ( = ?auto_186026 ?auto_186023 ) ) ( not ( = ?auto_186026 ?auto_186025 ) ) ( not ( = ?auto_186026 ?auto_186021 ) ) ( not ( = ?auto_186026 ?auto_186020 ) ) ( not ( = ?auto_186026 ?auto_186022 ) ) ( not ( = ?auto_186026 ?auto_186019 ) ) ( not ( = ?auto_186023 ?auto_186025 ) ) ( not ( = ?auto_186023 ?auto_186021 ) ) ( not ( = ?auto_186023 ?auto_186020 ) ) ( not ( = ?auto_186023 ?auto_186022 ) ) ( not ( = ?auto_186023 ?auto_186019 ) ) ( not ( = ?auto_186025 ?auto_186021 ) ) ( not ( = ?auto_186025 ?auto_186020 ) ) ( not ( = ?auto_186025 ?auto_186022 ) ) ( not ( = ?auto_186025 ?auto_186019 ) ) ( not ( = ?auto_186021 ?auto_186020 ) ) ( not ( = ?auto_186021 ?auto_186022 ) ) ( not ( = ?auto_186021 ?auto_186019 ) ) ( not ( = ?auto_186020 ?auto_186022 ) ) ( not ( = ?auto_186020 ?auto_186019 ) ) ( not ( = ?auto_186018 ?auto_186026 ) ) ( not ( = ?auto_186018 ?auto_186023 ) ) ( not ( = ?auto_186018 ?auto_186025 ) ) ( not ( = ?auto_186018 ?auto_186021 ) ) ( not ( = ?auto_186018 ?auto_186020 ) ) ( not ( = ?auto_186024 ?auto_186026 ) ) ( not ( = ?auto_186024 ?auto_186023 ) ) ( not ( = ?auto_186024 ?auto_186025 ) ) ( not ( = ?auto_186024 ?auto_186021 ) ) ( not ( = ?auto_186024 ?auto_186020 ) ) ( ON ?auto_186019 ?auto_186018 ) ( ON-TABLE ?auto_186024 ) ( ON ?auto_186022 ?auto_186019 ) ( ON ?auto_186020 ?auto_186022 ) ( CLEAR ?auto_186025 ) ( ON ?auto_186021 ?auto_186020 ) ( CLEAR ?auto_186021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186024 ?auto_186018 ?auto_186019 ?auto_186022 ?auto_186020 )
      ( MAKE-2PILE ?auto_186018 ?auto_186019 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186027 - BLOCK
      ?auto_186028 - BLOCK
    )
    :vars
    (
      ?auto_186032 - BLOCK
      ?auto_186031 - BLOCK
      ?auto_186035 - BLOCK
      ?auto_186030 - BLOCK
      ?auto_186029 - BLOCK
      ?auto_186034 - BLOCK
      ?auto_186033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186027 ?auto_186028 ) ) ( not ( = ?auto_186027 ?auto_186032 ) ) ( not ( = ?auto_186028 ?auto_186032 ) ) ( ON ?auto_186027 ?auto_186031 ) ( not ( = ?auto_186027 ?auto_186031 ) ) ( not ( = ?auto_186028 ?auto_186031 ) ) ( not ( = ?auto_186032 ?auto_186031 ) ) ( ON-TABLE ?auto_186035 ) ( ON ?auto_186030 ?auto_186035 ) ( not ( = ?auto_186035 ?auto_186030 ) ) ( not ( = ?auto_186035 ?auto_186029 ) ) ( not ( = ?auto_186035 ?auto_186034 ) ) ( not ( = ?auto_186035 ?auto_186033 ) ) ( not ( = ?auto_186035 ?auto_186032 ) ) ( not ( = ?auto_186035 ?auto_186028 ) ) ( not ( = ?auto_186030 ?auto_186029 ) ) ( not ( = ?auto_186030 ?auto_186034 ) ) ( not ( = ?auto_186030 ?auto_186033 ) ) ( not ( = ?auto_186030 ?auto_186032 ) ) ( not ( = ?auto_186030 ?auto_186028 ) ) ( not ( = ?auto_186029 ?auto_186034 ) ) ( not ( = ?auto_186029 ?auto_186033 ) ) ( not ( = ?auto_186029 ?auto_186032 ) ) ( not ( = ?auto_186029 ?auto_186028 ) ) ( not ( = ?auto_186034 ?auto_186033 ) ) ( not ( = ?auto_186034 ?auto_186032 ) ) ( not ( = ?auto_186034 ?auto_186028 ) ) ( not ( = ?auto_186033 ?auto_186032 ) ) ( not ( = ?auto_186033 ?auto_186028 ) ) ( not ( = ?auto_186027 ?auto_186035 ) ) ( not ( = ?auto_186027 ?auto_186030 ) ) ( not ( = ?auto_186027 ?auto_186029 ) ) ( not ( = ?auto_186027 ?auto_186034 ) ) ( not ( = ?auto_186027 ?auto_186033 ) ) ( not ( = ?auto_186031 ?auto_186035 ) ) ( not ( = ?auto_186031 ?auto_186030 ) ) ( not ( = ?auto_186031 ?auto_186029 ) ) ( not ( = ?auto_186031 ?auto_186034 ) ) ( not ( = ?auto_186031 ?auto_186033 ) ) ( ON ?auto_186028 ?auto_186027 ) ( ON-TABLE ?auto_186031 ) ( ON ?auto_186032 ?auto_186028 ) ( ON ?auto_186033 ?auto_186032 ) ( ON ?auto_186034 ?auto_186033 ) ( CLEAR ?auto_186034 ) ( HOLDING ?auto_186029 ) ( CLEAR ?auto_186030 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186035 ?auto_186030 ?auto_186029 )
      ( MAKE-2PILE ?auto_186027 ?auto_186028 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186036 - BLOCK
      ?auto_186037 - BLOCK
    )
    :vars
    (
      ?auto_186042 - BLOCK
      ?auto_186039 - BLOCK
      ?auto_186044 - BLOCK
      ?auto_186043 - BLOCK
      ?auto_186038 - BLOCK
      ?auto_186040 - BLOCK
      ?auto_186041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186036 ?auto_186037 ) ) ( not ( = ?auto_186036 ?auto_186042 ) ) ( not ( = ?auto_186037 ?auto_186042 ) ) ( ON ?auto_186036 ?auto_186039 ) ( not ( = ?auto_186036 ?auto_186039 ) ) ( not ( = ?auto_186037 ?auto_186039 ) ) ( not ( = ?auto_186042 ?auto_186039 ) ) ( ON-TABLE ?auto_186044 ) ( ON ?auto_186043 ?auto_186044 ) ( not ( = ?auto_186044 ?auto_186043 ) ) ( not ( = ?auto_186044 ?auto_186038 ) ) ( not ( = ?auto_186044 ?auto_186040 ) ) ( not ( = ?auto_186044 ?auto_186041 ) ) ( not ( = ?auto_186044 ?auto_186042 ) ) ( not ( = ?auto_186044 ?auto_186037 ) ) ( not ( = ?auto_186043 ?auto_186038 ) ) ( not ( = ?auto_186043 ?auto_186040 ) ) ( not ( = ?auto_186043 ?auto_186041 ) ) ( not ( = ?auto_186043 ?auto_186042 ) ) ( not ( = ?auto_186043 ?auto_186037 ) ) ( not ( = ?auto_186038 ?auto_186040 ) ) ( not ( = ?auto_186038 ?auto_186041 ) ) ( not ( = ?auto_186038 ?auto_186042 ) ) ( not ( = ?auto_186038 ?auto_186037 ) ) ( not ( = ?auto_186040 ?auto_186041 ) ) ( not ( = ?auto_186040 ?auto_186042 ) ) ( not ( = ?auto_186040 ?auto_186037 ) ) ( not ( = ?auto_186041 ?auto_186042 ) ) ( not ( = ?auto_186041 ?auto_186037 ) ) ( not ( = ?auto_186036 ?auto_186044 ) ) ( not ( = ?auto_186036 ?auto_186043 ) ) ( not ( = ?auto_186036 ?auto_186038 ) ) ( not ( = ?auto_186036 ?auto_186040 ) ) ( not ( = ?auto_186036 ?auto_186041 ) ) ( not ( = ?auto_186039 ?auto_186044 ) ) ( not ( = ?auto_186039 ?auto_186043 ) ) ( not ( = ?auto_186039 ?auto_186038 ) ) ( not ( = ?auto_186039 ?auto_186040 ) ) ( not ( = ?auto_186039 ?auto_186041 ) ) ( ON ?auto_186037 ?auto_186036 ) ( ON-TABLE ?auto_186039 ) ( ON ?auto_186042 ?auto_186037 ) ( ON ?auto_186041 ?auto_186042 ) ( ON ?auto_186040 ?auto_186041 ) ( CLEAR ?auto_186043 ) ( ON ?auto_186038 ?auto_186040 ) ( CLEAR ?auto_186038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186039 ?auto_186036 ?auto_186037 ?auto_186042 ?auto_186041 ?auto_186040 )
      ( MAKE-2PILE ?auto_186036 ?auto_186037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186045 - BLOCK
      ?auto_186046 - BLOCK
    )
    :vars
    (
      ?auto_186050 - BLOCK
      ?auto_186051 - BLOCK
      ?auto_186048 - BLOCK
      ?auto_186052 - BLOCK
      ?auto_186049 - BLOCK
      ?auto_186047 - BLOCK
      ?auto_186053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186045 ?auto_186046 ) ) ( not ( = ?auto_186045 ?auto_186050 ) ) ( not ( = ?auto_186046 ?auto_186050 ) ) ( ON ?auto_186045 ?auto_186051 ) ( not ( = ?auto_186045 ?auto_186051 ) ) ( not ( = ?auto_186046 ?auto_186051 ) ) ( not ( = ?auto_186050 ?auto_186051 ) ) ( ON-TABLE ?auto_186048 ) ( not ( = ?auto_186048 ?auto_186052 ) ) ( not ( = ?auto_186048 ?auto_186049 ) ) ( not ( = ?auto_186048 ?auto_186047 ) ) ( not ( = ?auto_186048 ?auto_186053 ) ) ( not ( = ?auto_186048 ?auto_186050 ) ) ( not ( = ?auto_186048 ?auto_186046 ) ) ( not ( = ?auto_186052 ?auto_186049 ) ) ( not ( = ?auto_186052 ?auto_186047 ) ) ( not ( = ?auto_186052 ?auto_186053 ) ) ( not ( = ?auto_186052 ?auto_186050 ) ) ( not ( = ?auto_186052 ?auto_186046 ) ) ( not ( = ?auto_186049 ?auto_186047 ) ) ( not ( = ?auto_186049 ?auto_186053 ) ) ( not ( = ?auto_186049 ?auto_186050 ) ) ( not ( = ?auto_186049 ?auto_186046 ) ) ( not ( = ?auto_186047 ?auto_186053 ) ) ( not ( = ?auto_186047 ?auto_186050 ) ) ( not ( = ?auto_186047 ?auto_186046 ) ) ( not ( = ?auto_186053 ?auto_186050 ) ) ( not ( = ?auto_186053 ?auto_186046 ) ) ( not ( = ?auto_186045 ?auto_186048 ) ) ( not ( = ?auto_186045 ?auto_186052 ) ) ( not ( = ?auto_186045 ?auto_186049 ) ) ( not ( = ?auto_186045 ?auto_186047 ) ) ( not ( = ?auto_186045 ?auto_186053 ) ) ( not ( = ?auto_186051 ?auto_186048 ) ) ( not ( = ?auto_186051 ?auto_186052 ) ) ( not ( = ?auto_186051 ?auto_186049 ) ) ( not ( = ?auto_186051 ?auto_186047 ) ) ( not ( = ?auto_186051 ?auto_186053 ) ) ( ON ?auto_186046 ?auto_186045 ) ( ON-TABLE ?auto_186051 ) ( ON ?auto_186050 ?auto_186046 ) ( ON ?auto_186053 ?auto_186050 ) ( ON ?auto_186047 ?auto_186053 ) ( ON ?auto_186049 ?auto_186047 ) ( CLEAR ?auto_186049 ) ( HOLDING ?auto_186052 ) ( CLEAR ?auto_186048 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186048 ?auto_186052 )
      ( MAKE-2PILE ?auto_186045 ?auto_186046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186054 - BLOCK
      ?auto_186055 - BLOCK
    )
    :vars
    (
      ?auto_186061 - BLOCK
      ?auto_186057 - BLOCK
      ?auto_186062 - BLOCK
      ?auto_186056 - BLOCK
      ?auto_186060 - BLOCK
      ?auto_186058 - BLOCK
      ?auto_186059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186054 ?auto_186055 ) ) ( not ( = ?auto_186054 ?auto_186061 ) ) ( not ( = ?auto_186055 ?auto_186061 ) ) ( ON ?auto_186054 ?auto_186057 ) ( not ( = ?auto_186054 ?auto_186057 ) ) ( not ( = ?auto_186055 ?auto_186057 ) ) ( not ( = ?auto_186061 ?auto_186057 ) ) ( ON-TABLE ?auto_186062 ) ( not ( = ?auto_186062 ?auto_186056 ) ) ( not ( = ?auto_186062 ?auto_186060 ) ) ( not ( = ?auto_186062 ?auto_186058 ) ) ( not ( = ?auto_186062 ?auto_186059 ) ) ( not ( = ?auto_186062 ?auto_186061 ) ) ( not ( = ?auto_186062 ?auto_186055 ) ) ( not ( = ?auto_186056 ?auto_186060 ) ) ( not ( = ?auto_186056 ?auto_186058 ) ) ( not ( = ?auto_186056 ?auto_186059 ) ) ( not ( = ?auto_186056 ?auto_186061 ) ) ( not ( = ?auto_186056 ?auto_186055 ) ) ( not ( = ?auto_186060 ?auto_186058 ) ) ( not ( = ?auto_186060 ?auto_186059 ) ) ( not ( = ?auto_186060 ?auto_186061 ) ) ( not ( = ?auto_186060 ?auto_186055 ) ) ( not ( = ?auto_186058 ?auto_186059 ) ) ( not ( = ?auto_186058 ?auto_186061 ) ) ( not ( = ?auto_186058 ?auto_186055 ) ) ( not ( = ?auto_186059 ?auto_186061 ) ) ( not ( = ?auto_186059 ?auto_186055 ) ) ( not ( = ?auto_186054 ?auto_186062 ) ) ( not ( = ?auto_186054 ?auto_186056 ) ) ( not ( = ?auto_186054 ?auto_186060 ) ) ( not ( = ?auto_186054 ?auto_186058 ) ) ( not ( = ?auto_186054 ?auto_186059 ) ) ( not ( = ?auto_186057 ?auto_186062 ) ) ( not ( = ?auto_186057 ?auto_186056 ) ) ( not ( = ?auto_186057 ?auto_186060 ) ) ( not ( = ?auto_186057 ?auto_186058 ) ) ( not ( = ?auto_186057 ?auto_186059 ) ) ( ON ?auto_186055 ?auto_186054 ) ( ON-TABLE ?auto_186057 ) ( ON ?auto_186061 ?auto_186055 ) ( ON ?auto_186059 ?auto_186061 ) ( ON ?auto_186058 ?auto_186059 ) ( ON ?auto_186060 ?auto_186058 ) ( CLEAR ?auto_186062 ) ( ON ?auto_186056 ?auto_186060 ) ( CLEAR ?auto_186056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186057 ?auto_186054 ?auto_186055 ?auto_186061 ?auto_186059 ?auto_186058 ?auto_186060 )
      ( MAKE-2PILE ?auto_186054 ?auto_186055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186063 - BLOCK
      ?auto_186064 - BLOCK
    )
    :vars
    (
      ?auto_186067 - BLOCK
      ?auto_186071 - BLOCK
      ?auto_186070 - BLOCK
      ?auto_186069 - BLOCK
      ?auto_186068 - BLOCK
      ?auto_186065 - BLOCK
      ?auto_186066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186063 ?auto_186064 ) ) ( not ( = ?auto_186063 ?auto_186067 ) ) ( not ( = ?auto_186064 ?auto_186067 ) ) ( ON ?auto_186063 ?auto_186071 ) ( not ( = ?auto_186063 ?auto_186071 ) ) ( not ( = ?auto_186064 ?auto_186071 ) ) ( not ( = ?auto_186067 ?auto_186071 ) ) ( not ( = ?auto_186070 ?auto_186069 ) ) ( not ( = ?auto_186070 ?auto_186068 ) ) ( not ( = ?auto_186070 ?auto_186065 ) ) ( not ( = ?auto_186070 ?auto_186066 ) ) ( not ( = ?auto_186070 ?auto_186067 ) ) ( not ( = ?auto_186070 ?auto_186064 ) ) ( not ( = ?auto_186069 ?auto_186068 ) ) ( not ( = ?auto_186069 ?auto_186065 ) ) ( not ( = ?auto_186069 ?auto_186066 ) ) ( not ( = ?auto_186069 ?auto_186067 ) ) ( not ( = ?auto_186069 ?auto_186064 ) ) ( not ( = ?auto_186068 ?auto_186065 ) ) ( not ( = ?auto_186068 ?auto_186066 ) ) ( not ( = ?auto_186068 ?auto_186067 ) ) ( not ( = ?auto_186068 ?auto_186064 ) ) ( not ( = ?auto_186065 ?auto_186066 ) ) ( not ( = ?auto_186065 ?auto_186067 ) ) ( not ( = ?auto_186065 ?auto_186064 ) ) ( not ( = ?auto_186066 ?auto_186067 ) ) ( not ( = ?auto_186066 ?auto_186064 ) ) ( not ( = ?auto_186063 ?auto_186070 ) ) ( not ( = ?auto_186063 ?auto_186069 ) ) ( not ( = ?auto_186063 ?auto_186068 ) ) ( not ( = ?auto_186063 ?auto_186065 ) ) ( not ( = ?auto_186063 ?auto_186066 ) ) ( not ( = ?auto_186071 ?auto_186070 ) ) ( not ( = ?auto_186071 ?auto_186069 ) ) ( not ( = ?auto_186071 ?auto_186068 ) ) ( not ( = ?auto_186071 ?auto_186065 ) ) ( not ( = ?auto_186071 ?auto_186066 ) ) ( ON ?auto_186064 ?auto_186063 ) ( ON-TABLE ?auto_186071 ) ( ON ?auto_186067 ?auto_186064 ) ( ON ?auto_186066 ?auto_186067 ) ( ON ?auto_186065 ?auto_186066 ) ( ON ?auto_186068 ?auto_186065 ) ( ON ?auto_186069 ?auto_186068 ) ( CLEAR ?auto_186069 ) ( HOLDING ?auto_186070 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186070 )
      ( MAKE-2PILE ?auto_186063 ?auto_186064 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_186072 - BLOCK
      ?auto_186073 - BLOCK
    )
    :vars
    (
      ?auto_186080 - BLOCK
      ?auto_186074 - BLOCK
      ?auto_186075 - BLOCK
      ?auto_186079 - BLOCK
      ?auto_186078 - BLOCK
      ?auto_186076 - BLOCK
      ?auto_186077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186072 ?auto_186073 ) ) ( not ( = ?auto_186072 ?auto_186080 ) ) ( not ( = ?auto_186073 ?auto_186080 ) ) ( ON ?auto_186072 ?auto_186074 ) ( not ( = ?auto_186072 ?auto_186074 ) ) ( not ( = ?auto_186073 ?auto_186074 ) ) ( not ( = ?auto_186080 ?auto_186074 ) ) ( not ( = ?auto_186075 ?auto_186079 ) ) ( not ( = ?auto_186075 ?auto_186078 ) ) ( not ( = ?auto_186075 ?auto_186076 ) ) ( not ( = ?auto_186075 ?auto_186077 ) ) ( not ( = ?auto_186075 ?auto_186080 ) ) ( not ( = ?auto_186075 ?auto_186073 ) ) ( not ( = ?auto_186079 ?auto_186078 ) ) ( not ( = ?auto_186079 ?auto_186076 ) ) ( not ( = ?auto_186079 ?auto_186077 ) ) ( not ( = ?auto_186079 ?auto_186080 ) ) ( not ( = ?auto_186079 ?auto_186073 ) ) ( not ( = ?auto_186078 ?auto_186076 ) ) ( not ( = ?auto_186078 ?auto_186077 ) ) ( not ( = ?auto_186078 ?auto_186080 ) ) ( not ( = ?auto_186078 ?auto_186073 ) ) ( not ( = ?auto_186076 ?auto_186077 ) ) ( not ( = ?auto_186076 ?auto_186080 ) ) ( not ( = ?auto_186076 ?auto_186073 ) ) ( not ( = ?auto_186077 ?auto_186080 ) ) ( not ( = ?auto_186077 ?auto_186073 ) ) ( not ( = ?auto_186072 ?auto_186075 ) ) ( not ( = ?auto_186072 ?auto_186079 ) ) ( not ( = ?auto_186072 ?auto_186078 ) ) ( not ( = ?auto_186072 ?auto_186076 ) ) ( not ( = ?auto_186072 ?auto_186077 ) ) ( not ( = ?auto_186074 ?auto_186075 ) ) ( not ( = ?auto_186074 ?auto_186079 ) ) ( not ( = ?auto_186074 ?auto_186078 ) ) ( not ( = ?auto_186074 ?auto_186076 ) ) ( not ( = ?auto_186074 ?auto_186077 ) ) ( ON ?auto_186073 ?auto_186072 ) ( ON-TABLE ?auto_186074 ) ( ON ?auto_186080 ?auto_186073 ) ( ON ?auto_186077 ?auto_186080 ) ( ON ?auto_186076 ?auto_186077 ) ( ON ?auto_186078 ?auto_186076 ) ( ON ?auto_186079 ?auto_186078 ) ( ON ?auto_186075 ?auto_186079 ) ( CLEAR ?auto_186075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186074 ?auto_186072 ?auto_186073 ?auto_186080 ?auto_186077 ?auto_186076 ?auto_186078 ?auto_186079 )
      ( MAKE-2PILE ?auto_186072 ?auto_186073 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186108 - BLOCK
      ?auto_186109 - BLOCK
      ?auto_186110 - BLOCK
      ?auto_186111 - BLOCK
      ?auto_186112 - BLOCK
    )
    :vars
    (
      ?auto_186113 - BLOCK
      ?auto_186114 - BLOCK
      ?auto_186115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186113 ?auto_186112 ) ( ON-TABLE ?auto_186108 ) ( ON ?auto_186109 ?auto_186108 ) ( ON ?auto_186110 ?auto_186109 ) ( ON ?auto_186111 ?auto_186110 ) ( ON ?auto_186112 ?auto_186111 ) ( not ( = ?auto_186108 ?auto_186109 ) ) ( not ( = ?auto_186108 ?auto_186110 ) ) ( not ( = ?auto_186108 ?auto_186111 ) ) ( not ( = ?auto_186108 ?auto_186112 ) ) ( not ( = ?auto_186108 ?auto_186113 ) ) ( not ( = ?auto_186109 ?auto_186110 ) ) ( not ( = ?auto_186109 ?auto_186111 ) ) ( not ( = ?auto_186109 ?auto_186112 ) ) ( not ( = ?auto_186109 ?auto_186113 ) ) ( not ( = ?auto_186110 ?auto_186111 ) ) ( not ( = ?auto_186110 ?auto_186112 ) ) ( not ( = ?auto_186110 ?auto_186113 ) ) ( not ( = ?auto_186111 ?auto_186112 ) ) ( not ( = ?auto_186111 ?auto_186113 ) ) ( not ( = ?auto_186112 ?auto_186113 ) ) ( not ( = ?auto_186108 ?auto_186114 ) ) ( not ( = ?auto_186108 ?auto_186115 ) ) ( not ( = ?auto_186109 ?auto_186114 ) ) ( not ( = ?auto_186109 ?auto_186115 ) ) ( not ( = ?auto_186110 ?auto_186114 ) ) ( not ( = ?auto_186110 ?auto_186115 ) ) ( not ( = ?auto_186111 ?auto_186114 ) ) ( not ( = ?auto_186111 ?auto_186115 ) ) ( not ( = ?auto_186112 ?auto_186114 ) ) ( not ( = ?auto_186112 ?auto_186115 ) ) ( not ( = ?auto_186113 ?auto_186114 ) ) ( not ( = ?auto_186113 ?auto_186115 ) ) ( not ( = ?auto_186114 ?auto_186115 ) ) ( ON ?auto_186114 ?auto_186113 ) ( CLEAR ?auto_186114 ) ( HOLDING ?auto_186115 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186115 )
      ( MAKE-5PILE ?auto_186108 ?auto_186109 ?auto_186110 ?auto_186111 ?auto_186112 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186221 - BLOCK
      ?auto_186222 - BLOCK
      ?auto_186223 - BLOCK
    )
    :vars
    (
      ?auto_186224 - BLOCK
      ?auto_186228 - BLOCK
      ?auto_186225 - BLOCK
      ?auto_186226 - BLOCK
      ?auto_186227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186221 ) ( not ( = ?auto_186221 ?auto_186222 ) ) ( not ( = ?auto_186221 ?auto_186223 ) ) ( not ( = ?auto_186222 ?auto_186223 ) ) ( ON ?auto_186223 ?auto_186224 ) ( not ( = ?auto_186221 ?auto_186224 ) ) ( not ( = ?auto_186222 ?auto_186224 ) ) ( not ( = ?auto_186223 ?auto_186224 ) ) ( CLEAR ?auto_186221 ) ( ON ?auto_186222 ?auto_186223 ) ( CLEAR ?auto_186222 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186228 ) ( ON ?auto_186225 ?auto_186228 ) ( ON ?auto_186226 ?auto_186225 ) ( ON ?auto_186227 ?auto_186226 ) ( ON ?auto_186224 ?auto_186227 ) ( not ( = ?auto_186228 ?auto_186225 ) ) ( not ( = ?auto_186228 ?auto_186226 ) ) ( not ( = ?auto_186228 ?auto_186227 ) ) ( not ( = ?auto_186228 ?auto_186224 ) ) ( not ( = ?auto_186228 ?auto_186223 ) ) ( not ( = ?auto_186228 ?auto_186222 ) ) ( not ( = ?auto_186225 ?auto_186226 ) ) ( not ( = ?auto_186225 ?auto_186227 ) ) ( not ( = ?auto_186225 ?auto_186224 ) ) ( not ( = ?auto_186225 ?auto_186223 ) ) ( not ( = ?auto_186225 ?auto_186222 ) ) ( not ( = ?auto_186226 ?auto_186227 ) ) ( not ( = ?auto_186226 ?auto_186224 ) ) ( not ( = ?auto_186226 ?auto_186223 ) ) ( not ( = ?auto_186226 ?auto_186222 ) ) ( not ( = ?auto_186227 ?auto_186224 ) ) ( not ( = ?auto_186227 ?auto_186223 ) ) ( not ( = ?auto_186227 ?auto_186222 ) ) ( not ( = ?auto_186221 ?auto_186228 ) ) ( not ( = ?auto_186221 ?auto_186225 ) ) ( not ( = ?auto_186221 ?auto_186226 ) ) ( not ( = ?auto_186221 ?auto_186227 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186228 ?auto_186225 ?auto_186226 ?auto_186227 ?auto_186224 ?auto_186223 )
      ( MAKE-3PILE ?auto_186221 ?auto_186222 ?auto_186223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186229 - BLOCK
      ?auto_186230 - BLOCK
      ?auto_186231 - BLOCK
    )
    :vars
    (
      ?auto_186235 - BLOCK
      ?auto_186234 - BLOCK
      ?auto_186232 - BLOCK
      ?auto_186236 - BLOCK
      ?auto_186233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186229 ?auto_186230 ) ) ( not ( = ?auto_186229 ?auto_186231 ) ) ( not ( = ?auto_186230 ?auto_186231 ) ) ( ON ?auto_186231 ?auto_186235 ) ( not ( = ?auto_186229 ?auto_186235 ) ) ( not ( = ?auto_186230 ?auto_186235 ) ) ( not ( = ?auto_186231 ?auto_186235 ) ) ( ON ?auto_186230 ?auto_186231 ) ( CLEAR ?auto_186230 ) ( ON-TABLE ?auto_186234 ) ( ON ?auto_186232 ?auto_186234 ) ( ON ?auto_186236 ?auto_186232 ) ( ON ?auto_186233 ?auto_186236 ) ( ON ?auto_186235 ?auto_186233 ) ( not ( = ?auto_186234 ?auto_186232 ) ) ( not ( = ?auto_186234 ?auto_186236 ) ) ( not ( = ?auto_186234 ?auto_186233 ) ) ( not ( = ?auto_186234 ?auto_186235 ) ) ( not ( = ?auto_186234 ?auto_186231 ) ) ( not ( = ?auto_186234 ?auto_186230 ) ) ( not ( = ?auto_186232 ?auto_186236 ) ) ( not ( = ?auto_186232 ?auto_186233 ) ) ( not ( = ?auto_186232 ?auto_186235 ) ) ( not ( = ?auto_186232 ?auto_186231 ) ) ( not ( = ?auto_186232 ?auto_186230 ) ) ( not ( = ?auto_186236 ?auto_186233 ) ) ( not ( = ?auto_186236 ?auto_186235 ) ) ( not ( = ?auto_186236 ?auto_186231 ) ) ( not ( = ?auto_186236 ?auto_186230 ) ) ( not ( = ?auto_186233 ?auto_186235 ) ) ( not ( = ?auto_186233 ?auto_186231 ) ) ( not ( = ?auto_186233 ?auto_186230 ) ) ( not ( = ?auto_186229 ?auto_186234 ) ) ( not ( = ?auto_186229 ?auto_186232 ) ) ( not ( = ?auto_186229 ?auto_186236 ) ) ( not ( = ?auto_186229 ?auto_186233 ) ) ( HOLDING ?auto_186229 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186229 )
      ( MAKE-3PILE ?auto_186229 ?auto_186230 ?auto_186231 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186237 - BLOCK
      ?auto_186238 - BLOCK
      ?auto_186239 - BLOCK
    )
    :vars
    (
      ?auto_186241 - BLOCK
      ?auto_186243 - BLOCK
      ?auto_186240 - BLOCK
      ?auto_186242 - BLOCK
      ?auto_186244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186237 ?auto_186238 ) ) ( not ( = ?auto_186237 ?auto_186239 ) ) ( not ( = ?auto_186238 ?auto_186239 ) ) ( ON ?auto_186239 ?auto_186241 ) ( not ( = ?auto_186237 ?auto_186241 ) ) ( not ( = ?auto_186238 ?auto_186241 ) ) ( not ( = ?auto_186239 ?auto_186241 ) ) ( ON ?auto_186238 ?auto_186239 ) ( ON-TABLE ?auto_186243 ) ( ON ?auto_186240 ?auto_186243 ) ( ON ?auto_186242 ?auto_186240 ) ( ON ?auto_186244 ?auto_186242 ) ( ON ?auto_186241 ?auto_186244 ) ( not ( = ?auto_186243 ?auto_186240 ) ) ( not ( = ?auto_186243 ?auto_186242 ) ) ( not ( = ?auto_186243 ?auto_186244 ) ) ( not ( = ?auto_186243 ?auto_186241 ) ) ( not ( = ?auto_186243 ?auto_186239 ) ) ( not ( = ?auto_186243 ?auto_186238 ) ) ( not ( = ?auto_186240 ?auto_186242 ) ) ( not ( = ?auto_186240 ?auto_186244 ) ) ( not ( = ?auto_186240 ?auto_186241 ) ) ( not ( = ?auto_186240 ?auto_186239 ) ) ( not ( = ?auto_186240 ?auto_186238 ) ) ( not ( = ?auto_186242 ?auto_186244 ) ) ( not ( = ?auto_186242 ?auto_186241 ) ) ( not ( = ?auto_186242 ?auto_186239 ) ) ( not ( = ?auto_186242 ?auto_186238 ) ) ( not ( = ?auto_186244 ?auto_186241 ) ) ( not ( = ?auto_186244 ?auto_186239 ) ) ( not ( = ?auto_186244 ?auto_186238 ) ) ( not ( = ?auto_186237 ?auto_186243 ) ) ( not ( = ?auto_186237 ?auto_186240 ) ) ( not ( = ?auto_186237 ?auto_186242 ) ) ( not ( = ?auto_186237 ?auto_186244 ) ) ( ON ?auto_186237 ?auto_186238 ) ( CLEAR ?auto_186237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186243 ?auto_186240 ?auto_186242 ?auto_186244 ?auto_186241 ?auto_186239 ?auto_186238 )
      ( MAKE-3PILE ?auto_186237 ?auto_186238 ?auto_186239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186248 - BLOCK
      ?auto_186249 - BLOCK
      ?auto_186250 - BLOCK
    )
    :vars
    (
      ?auto_186251 - BLOCK
      ?auto_186254 - BLOCK
      ?auto_186252 - BLOCK
      ?auto_186253 - BLOCK
      ?auto_186255 - BLOCK
      ?auto_186256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186248 ?auto_186249 ) ) ( not ( = ?auto_186248 ?auto_186250 ) ) ( not ( = ?auto_186249 ?auto_186250 ) ) ( ON ?auto_186250 ?auto_186251 ) ( not ( = ?auto_186248 ?auto_186251 ) ) ( not ( = ?auto_186249 ?auto_186251 ) ) ( not ( = ?auto_186250 ?auto_186251 ) ) ( ON ?auto_186249 ?auto_186250 ) ( CLEAR ?auto_186249 ) ( ON-TABLE ?auto_186254 ) ( ON ?auto_186252 ?auto_186254 ) ( ON ?auto_186253 ?auto_186252 ) ( ON ?auto_186255 ?auto_186253 ) ( ON ?auto_186251 ?auto_186255 ) ( not ( = ?auto_186254 ?auto_186252 ) ) ( not ( = ?auto_186254 ?auto_186253 ) ) ( not ( = ?auto_186254 ?auto_186255 ) ) ( not ( = ?auto_186254 ?auto_186251 ) ) ( not ( = ?auto_186254 ?auto_186250 ) ) ( not ( = ?auto_186254 ?auto_186249 ) ) ( not ( = ?auto_186252 ?auto_186253 ) ) ( not ( = ?auto_186252 ?auto_186255 ) ) ( not ( = ?auto_186252 ?auto_186251 ) ) ( not ( = ?auto_186252 ?auto_186250 ) ) ( not ( = ?auto_186252 ?auto_186249 ) ) ( not ( = ?auto_186253 ?auto_186255 ) ) ( not ( = ?auto_186253 ?auto_186251 ) ) ( not ( = ?auto_186253 ?auto_186250 ) ) ( not ( = ?auto_186253 ?auto_186249 ) ) ( not ( = ?auto_186255 ?auto_186251 ) ) ( not ( = ?auto_186255 ?auto_186250 ) ) ( not ( = ?auto_186255 ?auto_186249 ) ) ( not ( = ?auto_186248 ?auto_186254 ) ) ( not ( = ?auto_186248 ?auto_186252 ) ) ( not ( = ?auto_186248 ?auto_186253 ) ) ( not ( = ?auto_186248 ?auto_186255 ) ) ( ON ?auto_186248 ?auto_186256 ) ( CLEAR ?auto_186248 ) ( HAND-EMPTY ) ( not ( = ?auto_186248 ?auto_186256 ) ) ( not ( = ?auto_186249 ?auto_186256 ) ) ( not ( = ?auto_186250 ?auto_186256 ) ) ( not ( = ?auto_186251 ?auto_186256 ) ) ( not ( = ?auto_186254 ?auto_186256 ) ) ( not ( = ?auto_186252 ?auto_186256 ) ) ( not ( = ?auto_186253 ?auto_186256 ) ) ( not ( = ?auto_186255 ?auto_186256 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186248 ?auto_186256 )
      ( MAKE-3PILE ?auto_186248 ?auto_186249 ?auto_186250 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186257 - BLOCK
      ?auto_186258 - BLOCK
      ?auto_186259 - BLOCK
    )
    :vars
    (
      ?auto_186262 - BLOCK
      ?auto_186264 - BLOCK
      ?auto_186263 - BLOCK
      ?auto_186260 - BLOCK
      ?auto_186261 - BLOCK
      ?auto_186265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186257 ?auto_186258 ) ) ( not ( = ?auto_186257 ?auto_186259 ) ) ( not ( = ?auto_186258 ?auto_186259 ) ) ( ON ?auto_186259 ?auto_186262 ) ( not ( = ?auto_186257 ?auto_186262 ) ) ( not ( = ?auto_186258 ?auto_186262 ) ) ( not ( = ?auto_186259 ?auto_186262 ) ) ( ON-TABLE ?auto_186264 ) ( ON ?auto_186263 ?auto_186264 ) ( ON ?auto_186260 ?auto_186263 ) ( ON ?auto_186261 ?auto_186260 ) ( ON ?auto_186262 ?auto_186261 ) ( not ( = ?auto_186264 ?auto_186263 ) ) ( not ( = ?auto_186264 ?auto_186260 ) ) ( not ( = ?auto_186264 ?auto_186261 ) ) ( not ( = ?auto_186264 ?auto_186262 ) ) ( not ( = ?auto_186264 ?auto_186259 ) ) ( not ( = ?auto_186264 ?auto_186258 ) ) ( not ( = ?auto_186263 ?auto_186260 ) ) ( not ( = ?auto_186263 ?auto_186261 ) ) ( not ( = ?auto_186263 ?auto_186262 ) ) ( not ( = ?auto_186263 ?auto_186259 ) ) ( not ( = ?auto_186263 ?auto_186258 ) ) ( not ( = ?auto_186260 ?auto_186261 ) ) ( not ( = ?auto_186260 ?auto_186262 ) ) ( not ( = ?auto_186260 ?auto_186259 ) ) ( not ( = ?auto_186260 ?auto_186258 ) ) ( not ( = ?auto_186261 ?auto_186262 ) ) ( not ( = ?auto_186261 ?auto_186259 ) ) ( not ( = ?auto_186261 ?auto_186258 ) ) ( not ( = ?auto_186257 ?auto_186264 ) ) ( not ( = ?auto_186257 ?auto_186263 ) ) ( not ( = ?auto_186257 ?auto_186260 ) ) ( not ( = ?auto_186257 ?auto_186261 ) ) ( ON ?auto_186257 ?auto_186265 ) ( CLEAR ?auto_186257 ) ( not ( = ?auto_186257 ?auto_186265 ) ) ( not ( = ?auto_186258 ?auto_186265 ) ) ( not ( = ?auto_186259 ?auto_186265 ) ) ( not ( = ?auto_186262 ?auto_186265 ) ) ( not ( = ?auto_186264 ?auto_186265 ) ) ( not ( = ?auto_186263 ?auto_186265 ) ) ( not ( = ?auto_186260 ?auto_186265 ) ) ( not ( = ?auto_186261 ?auto_186265 ) ) ( HOLDING ?auto_186258 ) ( CLEAR ?auto_186259 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186264 ?auto_186263 ?auto_186260 ?auto_186261 ?auto_186262 ?auto_186259 ?auto_186258 )
      ( MAKE-3PILE ?auto_186257 ?auto_186258 ?auto_186259 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186266 - BLOCK
      ?auto_186267 - BLOCK
      ?auto_186268 - BLOCK
    )
    :vars
    (
      ?auto_186272 - BLOCK
      ?auto_186273 - BLOCK
      ?auto_186271 - BLOCK
      ?auto_186274 - BLOCK
      ?auto_186270 - BLOCK
      ?auto_186269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186266 ?auto_186267 ) ) ( not ( = ?auto_186266 ?auto_186268 ) ) ( not ( = ?auto_186267 ?auto_186268 ) ) ( ON ?auto_186268 ?auto_186272 ) ( not ( = ?auto_186266 ?auto_186272 ) ) ( not ( = ?auto_186267 ?auto_186272 ) ) ( not ( = ?auto_186268 ?auto_186272 ) ) ( ON-TABLE ?auto_186273 ) ( ON ?auto_186271 ?auto_186273 ) ( ON ?auto_186274 ?auto_186271 ) ( ON ?auto_186270 ?auto_186274 ) ( ON ?auto_186272 ?auto_186270 ) ( not ( = ?auto_186273 ?auto_186271 ) ) ( not ( = ?auto_186273 ?auto_186274 ) ) ( not ( = ?auto_186273 ?auto_186270 ) ) ( not ( = ?auto_186273 ?auto_186272 ) ) ( not ( = ?auto_186273 ?auto_186268 ) ) ( not ( = ?auto_186273 ?auto_186267 ) ) ( not ( = ?auto_186271 ?auto_186274 ) ) ( not ( = ?auto_186271 ?auto_186270 ) ) ( not ( = ?auto_186271 ?auto_186272 ) ) ( not ( = ?auto_186271 ?auto_186268 ) ) ( not ( = ?auto_186271 ?auto_186267 ) ) ( not ( = ?auto_186274 ?auto_186270 ) ) ( not ( = ?auto_186274 ?auto_186272 ) ) ( not ( = ?auto_186274 ?auto_186268 ) ) ( not ( = ?auto_186274 ?auto_186267 ) ) ( not ( = ?auto_186270 ?auto_186272 ) ) ( not ( = ?auto_186270 ?auto_186268 ) ) ( not ( = ?auto_186270 ?auto_186267 ) ) ( not ( = ?auto_186266 ?auto_186273 ) ) ( not ( = ?auto_186266 ?auto_186271 ) ) ( not ( = ?auto_186266 ?auto_186274 ) ) ( not ( = ?auto_186266 ?auto_186270 ) ) ( ON ?auto_186266 ?auto_186269 ) ( not ( = ?auto_186266 ?auto_186269 ) ) ( not ( = ?auto_186267 ?auto_186269 ) ) ( not ( = ?auto_186268 ?auto_186269 ) ) ( not ( = ?auto_186272 ?auto_186269 ) ) ( not ( = ?auto_186273 ?auto_186269 ) ) ( not ( = ?auto_186271 ?auto_186269 ) ) ( not ( = ?auto_186274 ?auto_186269 ) ) ( not ( = ?auto_186270 ?auto_186269 ) ) ( CLEAR ?auto_186268 ) ( ON ?auto_186267 ?auto_186266 ) ( CLEAR ?auto_186267 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186269 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186269 ?auto_186266 )
      ( MAKE-3PILE ?auto_186266 ?auto_186267 ?auto_186268 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186275 - BLOCK
      ?auto_186276 - BLOCK
      ?auto_186277 - BLOCK
    )
    :vars
    (
      ?auto_186281 - BLOCK
      ?auto_186280 - BLOCK
      ?auto_186278 - BLOCK
      ?auto_186282 - BLOCK
      ?auto_186283 - BLOCK
      ?auto_186279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186275 ?auto_186276 ) ) ( not ( = ?auto_186275 ?auto_186277 ) ) ( not ( = ?auto_186276 ?auto_186277 ) ) ( not ( = ?auto_186275 ?auto_186281 ) ) ( not ( = ?auto_186276 ?auto_186281 ) ) ( not ( = ?auto_186277 ?auto_186281 ) ) ( ON-TABLE ?auto_186280 ) ( ON ?auto_186278 ?auto_186280 ) ( ON ?auto_186282 ?auto_186278 ) ( ON ?auto_186283 ?auto_186282 ) ( ON ?auto_186281 ?auto_186283 ) ( not ( = ?auto_186280 ?auto_186278 ) ) ( not ( = ?auto_186280 ?auto_186282 ) ) ( not ( = ?auto_186280 ?auto_186283 ) ) ( not ( = ?auto_186280 ?auto_186281 ) ) ( not ( = ?auto_186280 ?auto_186277 ) ) ( not ( = ?auto_186280 ?auto_186276 ) ) ( not ( = ?auto_186278 ?auto_186282 ) ) ( not ( = ?auto_186278 ?auto_186283 ) ) ( not ( = ?auto_186278 ?auto_186281 ) ) ( not ( = ?auto_186278 ?auto_186277 ) ) ( not ( = ?auto_186278 ?auto_186276 ) ) ( not ( = ?auto_186282 ?auto_186283 ) ) ( not ( = ?auto_186282 ?auto_186281 ) ) ( not ( = ?auto_186282 ?auto_186277 ) ) ( not ( = ?auto_186282 ?auto_186276 ) ) ( not ( = ?auto_186283 ?auto_186281 ) ) ( not ( = ?auto_186283 ?auto_186277 ) ) ( not ( = ?auto_186283 ?auto_186276 ) ) ( not ( = ?auto_186275 ?auto_186280 ) ) ( not ( = ?auto_186275 ?auto_186278 ) ) ( not ( = ?auto_186275 ?auto_186282 ) ) ( not ( = ?auto_186275 ?auto_186283 ) ) ( ON ?auto_186275 ?auto_186279 ) ( not ( = ?auto_186275 ?auto_186279 ) ) ( not ( = ?auto_186276 ?auto_186279 ) ) ( not ( = ?auto_186277 ?auto_186279 ) ) ( not ( = ?auto_186281 ?auto_186279 ) ) ( not ( = ?auto_186280 ?auto_186279 ) ) ( not ( = ?auto_186278 ?auto_186279 ) ) ( not ( = ?auto_186282 ?auto_186279 ) ) ( not ( = ?auto_186283 ?auto_186279 ) ) ( ON ?auto_186276 ?auto_186275 ) ( CLEAR ?auto_186276 ) ( ON-TABLE ?auto_186279 ) ( HOLDING ?auto_186277 ) ( CLEAR ?auto_186281 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186280 ?auto_186278 ?auto_186282 ?auto_186283 ?auto_186281 ?auto_186277 )
      ( MAKE-3PILE ?auto_186275 ?auto_186276 ?auto_186277 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186284 - BLOCK
      ?auto_186285 - BLOCK
      ?auto_186286 - BLOCK
    )
    :vars
    (
      ?auto_186289 - BLOCK
      ?auto_186287 - BLOCK
      ?auto_186291 - BLOCK
      ?auto_186292 - BLOCK
      ?auto_186290 - BLOCK
      ?auto_186288 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186284 ?auto_186285 ) ) ( not ( = ?auto_186284 ?auto_186286 ) ) ( not ( = ?auto_186285 ?auto_186286 ) ) ( not ( = ?auto_186284 ?auto_186289 ) ) ( not ( = ?auto_186285 ?auto_186289 ) ) ( not ( = ?auto_186286 ?auto_186289 ) ) ( ON-TABLE ?auto_186287 ) ( ON ?auto_186291 ?auto_186287 ) ( ON ?auto_186292 ?auto_186291 ) ( ON ?auto_186290 ?auto_186292 ) ( ON ?auto_186289 ?auto_186290 ) ( not ( = ?auto_186287 ?auto_186291 ) ) ( not ( = ?auto_186287 ?auto_186292 ) ) ( not ( = ?auto_186287 ?auto_186290 ) ) ( not ( = ?auto_186287 ?auto_186289 ) ) ( not ( = ?auto_186287 ?auto_186286 ) ) ( not ( = ?auto_186287 ?auto_186285 ) ) ( not ( = ?auto_186291 ?auto_186292 ) ) ( not ( = ?auto_186291 ?auto_186290 ) ) ( not ( = ?auto_186291 ?auto_186289 ) ) ( not ( = ?auto_186291 ?auto_186286 ) ) ( not ( = ?auto_186291 ?auto_186285 ) ) ( not ( = ?auto_186292 ?auto_186290 ) ) ( not ( = ?auto_186292 ?auto_186289 ) ) ( not ( = ?auto_186292 ?auto_186286 ) ) ( not ( = ?auto_186292 ?auto_186285 ) ) ( not ( = ?auto_186290 ?auto_186289 ) ) ( not ( = ?auto_186290 ?auto_186286 ) ) ( not ( = ?auto_186290 ?auto_186285 ) ) ( not ( = ?auto_186284 ?auto_186287 ) ) ( not ( = ?auto_186284 ?auto_186291 ) ) ( not ( = ?auto_186284 ?auto_186292 ) ) ( not ( = ?auto_186284 ?auto_186290 ) ) ( ON ?auto_186284 ?auto_186288 ) ( not ( = ?auto_186284 ?auto_186288 ) ) ( not ( = ?auto_186285 ?auto_186288 ) ) ( not ( = ?auto_186286 ?auto_186288 ) ) ( not ( = ?auto_186289 ?auto_186288 ) ) ( not ( = ?auto_186287 ?auto_186288 ) ) ( not ( = ?auto_186291 ?auto_186288 ) ) ( not ( = ?auto_186292 ?auto_186288 ) ) ( not ( = ?auto_186290 ?auto_186288 ) ) ( ON ?auto_186285 ?auto_186284 ) ( ON-TABLE ?auto_186288 ) ( CLEAR ?auto_186289 ) ( ON ?auto_186286 ?auto_186285 ) ( CLEAR ?auto_186286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186288 ?auto_186284 ?auto_186285 )
      ( MAKE-3PILE ?auto_186284 ?auto_186285 ?auto_186286 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186293 - BLOCK
      ?auto_186294 - BLOCK
      ?auto_186295 - BLOCK
    )
    :vars
    (
      ?auto_186297 - BLOCK
      ?auto_186298 - BLOCK
      ?auto_186300 - BLOCK
      ?auto_186296 - BLOCK
      ?auto_186301 - BLOCK
      ?auto_186299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186293 ?auto_186294 ) ) ( not ( = ?auto_186293 ?auto_186295 ) ) ( not ( = ?auto_186294 ?auto_186295 ) ) ( not ( = ?auto_186293 ?auto_186297 ) ) ( not ( = ?auto_186294 ?auto_186297 ) ) ( not ( = ?auto_186295 ?auto_186297 ) ) ( ON-TABLE ?auto_186298 ) ( ON ?auto_186300 ?auto_186298 ) ( ON ?auto_186296 ?auto_186300 ) ( ON ?auto_186301 ?auto_186296 ) ( not ( = ?auto_186298 ?auto_186300 ) ) ( not ( = ?auto_186298 ?auto_186296 ) ) ( not ( = ?auto_186298 ?auto_186301 ) ) ( not ( = ?auto_186298 ?auto_186297 ) ) ( not ( = ?auto_186298 ?auto_186295 ) ) ( not ( = ?auto_186298 ?auto_186294 ) ) ( not ( = ?auto_186300 ?auto_186296 ) ) ( not ( = ?auto_186300 ?auto_186301 ) ) ( not ( = ?auto_186300 ?auto_186297 ) ) ( not ( = ?auto_186300 ?auto_186295 ) ) ( not ( = ?auto_186300 ?auto_186294 ) ) ( not ( = ?auto_186296 ?auto_186301 ) ) ( not ( = ?auto_186296 ?auto_186297 ) ) ( not ( = ?auto_186296 ?auto_186295 ) ) ( not ( = ?auto_186296 ?auto_186294 ) ) ( not ( = ?auto_186301 ?auto_186297 ) ) ( not ( = ?auto_186301 ?auto_186295 ) ) ( not ( = ?auto_186301 ?auto_186294 ) ) ( not ( = ?auto_186293 ?auto_186298 ) ) ( not ( = ?auto_186293 ?auto_186300 ) ) ( not ( = ?auto_186293 ?auto_186296 ) ) ( not ( = ?auto_186293 ?auto_186301 ) ) ( ON ?auto_186293 ?auto_186299 ) ( not ( = ?auto_186293 ?auto_186299 ) ) ( not ( = ?auto_186294 ?auto_186299 ) ) ( not ( = ?auto_186295 ?auto_186299 ) ) ( not ( = ?auto_186297 ?auto_186299 ) ) ( not ( = ?auto_186298 ?auto_186299 ) ) ( not ( = ?auto_186300 ?auto_186299 ) ) ( not ( = ?auto_186296 ?auto_186299 ) ) ( not ( = ?auto_186301 ?auto_186299 ) ) ( ON ?auto_186294 ?auto_186293 ) ( ON-TABLE ?auto_186299 ) ( ON ?auto_186295 ?auto_186294 ) ( CLEAR ?auto_186295 ) ( HOLDING ?auto_186297 ) ( CLEAR ?auto_186301 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186298 ?auto_186300 ?auto_186296 ?auto_186301 ?auto_186297 )
      ( MAKE-3PILE ?auto_186293 ?auto_186294 ?auto_186295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186302 - BLOCK
      ?auto_186303 - BLOCK
      ?auto_186304 - BLOCK
    )
    :vars
    (
      ?auto_186310 - BLOCK
      ?auto_186307 - BLOCK
      ?auto_186305 - BLOCK
      ?auto_186309 - BLOCK
      ?auto_186306 - BLOCK
      ?auto_186308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186302 ?auto_186303 ) ) ( not ( = ?auto_186302 ?auto_186304 ) ) ( not ( = ?auto_186303 ?auto_186304 ) ) ( not ( = ?auto_186302 ?auto_186310 ) ) ( not ( = ?auto_186303 ?auto_186310 ) ) ( not ( = ?auto_186304 ?auto_186310 ) ) ( ON-TABLE ?auto_186307 ) ( ON ?auto_186305 ?auto_186307 ) ( ON ?auto_186309 ?auto_186305 ) ( ON ?auto_186306 ?auto_186309 ) ( not ( = ?auto_186307 ?auto_186305 ) ) ( not ( = ?auto_186307 ?auto_186309 ) ) ( not ( = ?auto_186307 ?auto_186306 ) ) ( not ( = ?auto_186307 ?auto_186310 ) ) ( not ( = ?auto_186307 ?auto_186304 ) ) ( not ( = ?auto_186307 ?auto_186303 ) ) ( not ( = ?auto_186305 ?auto_186309 ) ) ( not ( = ?auto_186305 ?auto_186306 ) ) ( not ( = ?auto_186305 ?auto_186310 ) ) ( not ( = ?auto_186305 ?auto_186304 ) ) ( not ( = ?auto_186305 ?auto_186303 ) ) ( not ( = ?auto_186309 ?auto_186306 ) ) ( not ( = ?auto_186309 ?auto_186310 ) ) ( not ( = ?auto_186309 ?auto_186304 ) ) ( not ( = ?auto_186309 ?auto_186303 ) ) ( not ( = ?auto_186306 ?auto_186310 ) ) ( not ( = ?auto_186306 ?auto_186304 ) ) ( not ( = ?auto_186306 ?auto_186303 ) ) ( not ( = ?auto_186302 ?auto_186307 ) ) ( not ( = ?auto_186302 ?auto_186305 ) ) ( not ( = ?auto_186302 ?auto_186309 ) ) ( not ( = ?auto_186302 ?auto_186306 ) ) ( ON ?auto_186302 ?auto_186308 ) ( not ( = ?auto_186302 ?auto_186308 ) ) ( not ( = ?auto_186303 ?auto_186308 ) ) ( not ( = ?auto_186304 ?auto_186308 ) ) ( not ( = ?auto_186310 ?auto_186308 ) ) ( not ( = ?auto_186307 ?auto_186308 ) ) ( not ( = ?auto_186305 ?auto_186308 ) ) ( not ( = ?auto_186309 ?auto_186308 ) ) ( not ( = ?auto_186306 ?auto_186308 ) ) ( ON ?auto_186303 ?auto_186302 ) ( ON-TABLE ?auto_186308 ) ( ON ?auto_186304 ?auto_186303 ) ( CLEAR ?auto_186306 ) ( ON ?auto_186310 ?auto_186304 ) ( CLEAR ?auto_186310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186308 ?auto_186302 ?auto_186303 ?auto_186304 )
      ( MAKE-3PILE ?auto_186302 ?auto_186303 ?auto_186304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186311 - BLOCK
      ?auto_186312 - BLOCK
      ?auto_186313 - BLOCK
    )
    :vars
    (
      ?auto_186314 - BLOCK
      ?auto_186318 - BLOCK
      ?auto_186316 - BLOCK
      ?auto_186315 - BLOCK
      ?auto_186319 - BLOCK
      ?auto_186317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186311 ?auto_186312 ) ) ( not ( = ?auto_186311 ?auto_186313 ) ) ( not ( = ?auto_186312 ?auto_186313 ) ) ( not ( = ?auto_186311 ?auto_186314 ) ) ( not ( = ?auto_186312 ?auto_186314 ) ) ( not ( = ?auto_186313 ?auto_186314 ) ) ( ON-TABLE ?auto_186318 ) ( ON ?auto_186316 ?auto_186318 ) ( ON ?auto_186315 ?auto_186316 ) ( not ( = ?auto_186318 ?auto_186316 ) ) ( not ( = ?auto_186318 ?auto_186315 ) ) ( not ( = ?auto_186318 ?auto_186319 ) ) ( not ( = ?auto_186318 ?auto_186314 ) ) ( not ( = ?auto_186318 ?auto_186313 ) ) ( not ( = ?auto_186318 ?auto_186312 ) ) ( not ( = ?auto_186316 ?auto_186315 ) ) ( not ( = ?auto_186316 ?auto_186319 ) ) ( not ( = ?auto_186316 ?auto_186314 ) ) ( not ( = ?auto_186316 ?auto_186313 ) ) ( not ( = ?auto_186316 ?auto_186312 ) ) ( not ( = ?auto_186315 ?auto_186319 ) ) ( not ( = ?auto_186315 ?auto_186314 ) ) ( not ( = ?auto_186315 ?auto_186313 ) ) ( not ( = ?auto_186315 ?auto_186312 ) ) ( not ( = ?auto_186319 ?auto_186314 ) ) ( not ( = ?auto_186319 ?auto_186313 ) ) ( not ( = ?auto_186319 ?auto_186312 ) ) ( not ( = ?auto_186311 ?auto_186318 ) ) ( not ( = ?auto_186311 ?auto_186316 ) ) ( not ( = ?auto_186311 ?auto_186315 ) ) ( not ( = ?auto_186311 ?auto_186319 ) ) ( ON ?auto_186311 ?auto_186317 ) ( not ( = ?auto_186311 ?auto_186317 ) ) ( not ( = ?auto_186312 ?auto_186317 ) ) ( not ( = ?auto_186313 ?auto_186317 ) ) ( not ( = ?auto_186314 ?auto_186317 ) ) ( not ( = ?auto_186318 ?auto_186317 ) ) ( not ( = ?auto_186316 ?auto_186317 ) ) ( not ( = ?auto_186315 ?auto_186317 ) ) ( not ( = ?auto_186319 ?auto_186317 ) ) ( ON ?auto_186312 ?auto_186311 ) ( ON-TABLE ?auto_186317 ) ( ON ?auto_186313 ?auto_186312 ) ( ON ?auto_186314 ?auto_186313 ) ( CLEAR ?auto_186314 ) ( HOLDING ?auto_186319 ) ( CLEAR ?auto_186315 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186318 ?auto_186316 ?auto_186315 ?auto_186319 )
      ( MAKE-3PILE ?auto_186311 ?auto_186312 ?auto_186313 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186320 - BLOCK
      ?auto_186321 - BLOCK
      ?auto_186322 - BLOCK
    )
    :vars
    (
      ?auto_186326 - BLOCK
      ?auto_186324 - BLOCK
      ?auto_186328 - BLOCK
      ?auto_186325 - BLOCK
      ?auto_186323 - BLOCK
      ?auto_186327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186320 ?auto_186321 ) ) ( not ( = ?auto_186320 ?auto_186322 ) ) ( not ( = ?auto_186321 ?auto_186322 ) ) ( not ( = ?auto_186320 ?auto_186326 ) ) ( not ( = ?auto_186321 ?auto_186326 ) ) ( not ( = ?auto_186322 ?auto_186326 ) ) ( ON-TABLE ?auto_186324 ) ( ON ?auto_186328 ?auto_186324 ) ( ON ?auto_186325 ?auto_186328 ) ( not ( = ?auto_186324 ?auto_186328 ) ) ( not ( = ?auto_186324 ?auto_186325 ) ) ( not ( = ?auto_186324 ?auto_186323 ) ) ( not ( = ?auto_186324 ?auto_186326 ) ) ( not ( = ?auto_186324 ?auto_186322 ) ) ( not ( = ?auto_186324 ?auto_186321 ) ) ( not ( = ?auto_186328 ?auto_186325 ) ) ( not ( = ?auto_186328 ?auto_186323 ) ) ( not ( = ?auto_186328 ?auto_186326 ) ) ( not ( = ?auto_186328 ?auto_186322 ) ) ( not ( = ?auto_186328 ?auto_186321 ) ) ( not ( = ?auto_186325 ?auto_186323 ) ) ( not ( = ?auto_186325 ?auto_186326 ) ) ( not ( = ?auto_186325 ?auto_186322 ) ) ( not ( = ?auto_186325 ?auto_186321 ) ) ( not ( = ?auto_186323 ?auto_186326 ) ) ( not ( = ?auto_186323 ?auto_186322 ) ) ( not ( = ?auto_186323 ?auto_186321 ) ) ( not ( = ?auto_186320 ?auto_186324 ) ) ( not ( = ?auto_186320 ?auto_186328 ) ) ( not ( = ?auto_186320 ?auto_186325 ) ) ( not ( = ?auto_186320 ?auto_186323 ) ) ( ON ?auto_186320 ?auto_186327 ) ( not ( = ?auto_186320 ?auto_186327 ) ) ( not ( = ?auto_186321 ?auto_186327 ) ) ( not ( = ?auto_186322 ?auto_186327 ) ) ( not ( = ?auto_186326 ?auto_186327 ) ) ( not ( = ?auto_186324 ?auto_186327 ) ) ( not ( = ?auto_186328 ?auto_186327 ) ) ( not ( = ?auto_186325 ?auto_186327 ) ) ( not ( = ?auto_186323 ?auto_186327 ) ) ( ON ?auto_186321 ?auto_186320 ) ( ON-TABLE ?auto_186327 ) ( ON ?auto_186322 ?auto_186321 ) ( ON ?auto_186326 ?auto_186322 ) ( CLEAR ?auto_186325 ) ( ON ?auto_186323 ?auto_186326 ) ( CLEAR ?auto_186323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186327 ?auto_186320 ?auto_186321 ?auto_186322 ?auto_186326 )
      ( MAKE-3PILE ?auto_186320 ?auto_186321 ?auto_186322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186329 - BLOCK
      ?auto_186330 - BLOCK
      ?auto_186331 - BLOCK
    )
    :vars
    (
      ?auto_186332 - BLOCK
      ?auto_186333 - BLOCK
      ?auto_186337 - BLOCK
      ?auto_186335 - BLOCK
      ?auto_186334 - BLOCK
      ?auto_186336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186329 ?auto_186330 ) ) ( not ( = ?auto_186329 ?auto_186331 ) ) ( not ( = ?auto_186330 ?auto_186331 ) ) ( not ( = ?auto_186329 ?auto_186332 ) ) ( not ( = ?auto_186330 ?auto_186332 ) ) ( not ( = ?auto_186331 ?auto_186332 ) ) ( ON-TABLE ?auto_186333 ) ( ON ?auto_186337 ?auto_186333 ) ( not ( = ?auto_186333 ?auto_186337 ) ) ( not ( = ?auto_186333 ?auto_186335 ) ) ( not ( = ?auto_186333 ?auto_186334 ) ) ( not ( = ?auto_186333 ?auto_186332 ) ) ( not ( = ?auto_186333 ?auto_186331 ) ) ( not ( = ?auto_186333 ?auto_186330 ) ) ( not ( = ?auto_186337 ?auto_186335 ) ) ( not ( = ?auto_186337 ?auto_186334 ) ) ( not ( = ?auto_186337 ?auto_186332 ) ) ( not ( = ?auto_186337 ?auto_186331 ) ) ( not ( = ?auto_186337 ?auto_186330 ) ) ( not ( = ?auto_186335 ?auto_186334 ) ) ( not ( = ?auto_186335 ?auto_186332 ) ) ( not ( = ?auto_186335 ?auto_186331 ) ) ( not ( = ?auto_186335 ?auto_186330 ) ) ( not ( = ?auto_186334 ?auto_186332 ) ) ( not ( = ?auto_186334 ?auto_186331 ) ) ( not ( = ?auto_186334 ?auto_186330 ) ) ( not ( = ?auto_186329 ?auto_186333 ) ) ( not ( = ?auto_186329 ?auto_186337 ) ) ( not ( = ?auto_186329 ?auto_186335 ) ) ( not ( = ?auto_186329 ?auto_186334 ) ) ( ON ?auto_186329 ?auto_186336 ) ( not ( = ?auto_186329 ?auto_186336 ) ) ( not ( = ?auto_186330 ?auto_186336 ) ) ( not ( = ?auto_186331 ?auto_186336 ) ) ( not ( = ?auto_186332 ?auto_186336 ) ) ( not ( = ?auto_186333 ?auto_186336 ) ) ( not ( = ?auto_186337 ?auto_186336 ) ) ( not ( = ?auto_186335 ?auto_186336 ) ) ( not ( = ?auto_186334 ?auto_186336 ) ) ( ON ?auto_186330 ?auto_186329 ) ( ON-TABLE ?auto_186336 ) ( ON ?auto_186331 ?auto_186330 ) ( ON ?auto_186332 ?auto_186331 ) ( ON ?auto_186334 ?auto_186332 ) ( CLEAR ?auto_186334 ) ( HOLDING ?auto_186335 ) ( CLEAR ?auto_186337 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186333 ?auto_186337 ?auto_186335 )
      ( MAKE-3PILE ?auto_186329 ?auto_186330 ?auto_186331 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186338 - BLOCK
      ?auto_186339 - BLOCK
      ?auto_186340 - BLOCK
    )
    :vars
    (
      ?auto_186346 - BLOCK
      ?auto_186341 - BLOCK
      ?auto_186345 - BLOCK
      ?auto_186343 - BLOCK
      ?auto_186342 - BLOCK
      ?auto_186344 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186338 ?auto_186339 ) ) ( not ( = ?auto_186338 ?auto_186340 ) ) ( not ( = ?auto_186339 ?auto_186340 ) ) ( not ( = ?auto_186338 ?auto_186346 ) ) ( not ( = ?auto_186339 ?auto_186346 ) ) ( not ( = ?auto_186340 ?auto_186346 ) ) ( ON-TABLE ?auto_186341 ) ( ON ?auto_186345 ?auto_186341 ) ( not ( = ?auto_186341 ?auto_186345 ) ) ( not ( = ?auto_186341 ?auto_186343 ) ) ( not ( = ?auto_186341 ?auto_186342 ) ) ( not ( = ?auto_186341 ?auto_186346 ) ) ( not ( = ?auto_186341 ?auto_186340 ) ) ( not ( = ?auto_186341 ?auto_186339 ) ) ( not ( = ?auto_186345 ?auto_186343 ) ) ( not ( = ?auto_186345 ?auto_186342 ) ) ( not ( = ?auto_186345 ?auto_186346 ) ) ( not ( = ?auto_186345 ?auto_186340 ) ) ( not ( = ?auto_186345 ?auto_186339 ) ) ( not ( = ?auto_186343 ?auto_186342 ) ) ( not ( = ?auto_186343 ?auto_186346 ) ) ( not ( = ?auto_186343 ?auto_186340 ) ) ( not ( = ?auto_186343 ?auto_186339 ) ) ( not ( = ?auto_186342 ?auto_186346 ) ) ( not ( = ?auto_186342 ?auto_186340 ) ) ( not ( = ?auto_186342 ?auto_186339 ) ) ( not ( = ?auto_186338 ?auto_186341 ) ) ( not ( = ?auto_186338 ?auto_186345 ) ) ( not ( = ?auto_186338 ?auto_186343 ) ) ( not ( = ?auto_186338 ?auto_186342 ) ) ( ON ?auto_186338 ?auto_186344 ) ( not ( = ?auto_186338 ?auto_186344 ) ) ( not ( = ?auto_186339 ?auto_186344 ) ) ( not ( = ?auto_186340 ?auto_186344 ) ) ( not ( = ?auto_186346 ?auto_186344 ) ) ( not ( = ?auto_186341 ?auto_186344 ) ) ( not ( = ?auto_186345 ?auto_186344 ) ) ( not ( = ?auto_186343 ?auto_186344 ) ) ( not ( = ?auto_186342 ?auto_186344 ) ) ( ON ?auto_186339 ?auto_186338 ) ( ON-TABLE ?auto_186344 ) ( ON ?auto_186340 ?auto_186339 ) ( ON ?auto_186346 ?auto_186340 ) ( ON ?auto_186342 ?auto_186346 ) ( CLEAR ?auto_186345 ) ( ON ?auto_186343 ?auto_186342 ) ( CLEAR ?auto_186343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186344 ?auto_186338 ?auto_186339 ?auto_186340 ?auto_186346 ?auto_186342 )
      ( MAKE-3PILE ?auto_186338 ?auto_186339 ?auto_186340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186347 - BLOCK
      ?auto_186348 - BLOCK
      ?auto_186349 - BLOCK
    )
    :vars
    (
      ?auto_186350 - BLOCK
      ?auto_186351 - BLOCK
      ?auto_186353 - BLOCK
      ?auto_186352 - BLOCK
      ?auto_186355 - BLOCK
      ?auto_186354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186347 ?auto_186348 ) ) ( not ( = ?auto_186347 ?auto_186349 ) ) ( not ( = ?auto_186348 ?auto_186349 ) ) ( not ( = ?auto_186347 ?auto_186350 ) ) ( not ( = ?auto_186348 ?auto_186350 ) ) ( not ( = ?auto_186349 ?auto_186350 ) ) ( ON-TABLE ?auto_186351 ) ( not ( = ?auto_186351 ?auto_186353 ) ) ( not ( = ?auto_186351 ?auto_186352 ) ) ( not ( = ?auto_186351 ?auto_186355 ) ) ( not ( = ?auto_186351 ?auto_186350 ) ) ( not ( = ?auto_186351 ?auto_186349 ) ) ( not ( = ?auto_186351 ?auto_186348 ) ) ( not ( = ?auto_186353 ?auto_186352 ) ) ( not ( = ?auto_186353 ?auto_186355 ) ) ( not ( = ?auto_186353 ?auto_186350 ) ) ( not ( = ?auto_186353 ?auto_186349 ) ) ( not ( = ?auto_186353 ?auto_186348 ) ) ( not ( = ?auto_186352 ?auto_186355 ) ) ( not ( = ?auto_186352 ?auto_186350 ) ) ( not ( = ?auto_186352 ?auto_186349 ) ) ( not ( = ?auto_186352 ?auto_186348 ) ) ( not ( = ?auto_186355 ?auto_186350 ) ) ( not ( = ?auto_186355 ?auto_186349 ) ) ( not ( = ?auto_186355 ?auto_186348 ) ) ( not ( = ?auto_186347 ?auto_186351 ) ) ( not ( = ?auto_186347 ?auto_186353 ) ) ( not ( = ?auto_186347 ?auto_186352 ) ) ( not ( = ?auto_186347 ?auto_186355 ) ) ( ON ?auto_186347 ?auto_186354 ) ( not ( = ?auto_186347 ?auto_186354 ) ) ( not ( = ?auto_186348 ?auto_186354 ) ) ( not ( = ?auto_186349 ?auto_186354 ) ) ( not ( = ?auto_186350 ?auto_186354 ) ) ( not ( = ?auto_186351 ?auto_186354 ) ) ( not ( = ?auto_186353 ?auto_186354 ) ) ( not ( = ?auto_186352 ?auto_186354 ) ) ( not ( = ?auto_186355 ?auto_186354 ) ) ( ON ?auto_186348 ?auto_186347 ) ( ON-TABLE ?auto_186354 ) ( ON ?auto_186349 ?auto_186348 ) ( ON ?auto_186350 ?auto_186349 ) ( ON ?auto_186355 ?auto_186350 ) ( ON ?auto_186352 ?auto_186355 ) ( CLEAR ?auto_186352 ) ( HOLDING ?auto_186353 ) ( CLEAR ?auto_186351 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186351 ?auto_186353 )
      ( MAKE-3PILE ?auto_186347 ?auto_186348 ?auto_186349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186356 - BLOCK
      ?auto_186357 - BLOCK
      ?auto_186358 - BLOCK
    )
    :vars
    (
      ?auto_186359 - BLOCK
      ?auto_186363 - BLOCK
      ?auto_186362 - BLOCK
      ?auto_186364 - BLOCK
      ?auto_186360 - BLOCK
      ?auto_186361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186356 ?auto_186357 ) ) ( not ( = ?auto_186356 ?auto_186358 ) ) ( not ( = ?auto_186357 ?auto_186358 ) ) ( not ( = ?auto_186356 ?auto_186359 ) ) ( not ( = ?auto_186357 ?auto_186359 ) ) ( not ( = ?auto_186358 ?auto_186359 ) ) ( ON-TABLE ?auto_186363 ) ( not ( = ?auto_186363 ?auto_186362 ) ) ( not ( = ?auto_186363 ?auto_186364 ) ) ( not ( = ?auto_186363 ?auto_186360 ) ) ( not ( = ?auto_186363 ?auto_186359 ) ) ( not ( = ?auto_186363 ?auto_186358 ) ) ( not ( = ?auto_186363 ?auto_186357 ) ) ( not ( = ?auto_186362 ?auto_186364 ) ) ( not ( = ?auto_186362 ?auto_186360 ) ) ( not ( = ?auto_186362 ?auto_186359 ) ) ( not ( = ?auto_186362 ?auto_186358 ) ) ( not ( = ?auto_186362 ?auto_186357 ) ) ( not ( = ?auto_186364 ?auto_186360 ) ) ( not ( = ?auto_186364 ?auto_186359 ) ) ( not ( = ?auto_186364 ?auto_186358 ) ) ( not ( = ?auto_186364 ?auto_186357 ) ) ( not ( = ?auto_186360 ?auto_186359 ) ) ( not ( = ?auto_186360 ?auto_186358 ) ) ( not ( = ?auto_186360 ?auto_186357 ) ) ( not ( = ?auto_186356 ?auto_186363 ) ) ( not ( = ?auto_186356 ?auto_186362 ) ) ( not ( = ?auto_186356 ?auto_186364 ) ) ( not ( = ?auto_186356 ?auto_186360 ) ) ( ON ?auto_186356 ?auto_186361 ) ( not ( = ?auto_186356 ?auto_186361 ) ) ( not ( = ?auto_186357 ?auto_186361 ) ) ( not ( = ?auto_186358 ?auto_186361 ) ) ( not ( = ?auto_186359 ?auto_186361 ) ) ( not ( = ?auto_186363 ?auto_186361 ) ) ( not ( = ?auto_186362 ?auto_186361 ) ) ( not ( = ?auto_186364 ?auto_186361 ) ) ( not ( = ?auto_186360 ?auto_186361 ) ) ( ON ?auto_186357 ?auto_186356 ) ( ON-TABLE ?auto_186361 ) ( ON ?auto_186358 ?auto_186357 ) ( ON ?auto_186359 ?auto_186358 ) ( ON ?auto_186360 ?auto_186359 ) ( ON ?auto_186364 ?auto_186360 ) ( CLEAR ?auto_186363 ) ( ON ?auto_186362 ?auto_186364 ) ( CLEAR ?auto_186362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186361 ?auto_186356 ?auto_186357 ?auto_186358 ?auto_186359 ?auto_186360 ?auto_186364 )
      ( MAKE-3PILE ?auto_186356 ?auto_186357 ?auto_186358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186365 - BLOCK
      ?auto_186366 - BLOCK
      ?auto_186367 - BLOCK
    )
    :vars
    (
      ?auto_186371 - BLOCK
      ?auto_186368 - BLOCK
      ?auto_186370 - BLOCK
      ?auto_186369 - BLOCK
      ?auto_186372 - BLOCK
      ?auto_186373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186365 ?auto_186366 ) ) ( not ( = ?auto_186365 ?auto_186367 ) ) ( not ( = ?auto_186366 ?auto_186367 ) ) ( not ( = ?auto_186365 ?auto_186371 ) ) ( not ( = ?auto_186366 ?auto_186371 ) ) ( not ( = ?auto_186367 ?auto_186371 ) ) ( not ( = ?auto_186368 ?auto_186370 ) ) ( not ( = ?auto_186368 ?auto_186369 ) ) ( not ( = ?auto_186368 ?auto_186372 ) ) ( not ( = ?auto_186368 ?auto_186371 ) ) ( not ( = ?auto_186368 ?auto_186367 ) ) ( not ( = ?auto_186368 ?auto_186366 ) ) ( not ( = ?auto_186370 ?auto_186369 ) ) ( not ( = ?auto_186370 ?auto_186372 ) ) ( not ( = ?auto_186370 ?auto_186371 ) ) ( not ( = ?auto_186370 ?auto_186367 ) ) ( not ( = ?auto_186370 ?auto_186366 ) ) ( not ( = ?auto_186369 ?auto_186372 ) ) ( not ( = ?auto_186369 ?auto_186371 ) ) ( not ( = ?auto_186369 ?auto_186367 ) ) ( not ( = ?auto_186369 ?auto_186366 ) ) ( not ( = ?auto_186372 ?auto_186371 ) ) ( not ( = ?auto_186372 ?auto_186367 ) ) ( not ( = ?auto_186372 ?auto_186366 ) ) ( not ( = ?auto_186365 ?auto_186368 ) ) ( not ( = ?auto_186365 ?auto_186370 ) ) ( not ( = ?auto_186365 ?auto_186369 ) ) ( not ( = ?auto_186365 ?auto_186372 ) ) ( ON ?auto_186365 ?auto_186373 ) ( not ( = ?auto_186365 ?auto_186373 ) ) ( not ( = ?auto_186366 ?auto_186373 ) ) ( not ( = ?auto_186367 ?auto_186373 ) ) ( not ( = ?auto_186371 ?auto_186373 ) ) ( not ( = ?auto_186368 ?auto_186373 ) ) ( not ( = ?auto_186370 ?auto_186373 ) ) ( not ( = ?auto_186369 ?auto_186373 ) ) ( not ( = ?auto_186372 ?auto_186373 ) ) ( ON ?auto_186366 ?auto_186365 ) ( ON-TABLE ?auto_186373 ) ( ON ?auto_186367 ?auto_186366 ) ( ON ?auto_186371 ?auto_186367 ) ( ON ?auto_186372 ?auto_186371 ) ( ON ?auto_186369 ?auto_186372 ) ( ON ?auto_186370 ?auto_186369 ) ( CLEAR ?auto_186370 ) ( HOLDING ?auto_186368 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186368 )
      ( MAKE-3PILE ?auto_186365 ?auto_186366 ?auto_186367 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186374 - BLOCK
      ?auto_186375 - BLOCK
      ?auto_186376 - BLOCK
    )
    :vars
    (
      ?auto_186379 - BLOCK
      ?auto_186381 - BLOCK
      ?auto_186380 - BLOCK
      ?auto_186382 - BLOCK
      ?auto_186377 - BLOCK
      ?auto_186378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186374 ?auto_186375 ) ) ( not ( = ?auto_186374 ?auto_186376 ) ) ( not ( = ?auto_186375 ?auto_186376 ) ) ( not ( = ?auto_186374 ?auto_186379 ) ) ( not ( = ?auto_186375 ?auto_186379 ) ) ( not ( = ?auto_186376 ?auto_186379 ) ) ( not ( = ?auto_186381 ?auto_186380 ) ) ( not ( = ?auto_186381 ?auto_186382 ) ) ( not ( = ?auto_186381 ?auto_186377 ) ) ( not ( = ?auto_186381 ?auto_186379 ) ) ( not ( = ?auto_186381 ?auto_186376 ) ) ( not ( = ?auto_186381 ?auto_186375 ) ) ( not ( = ?auto_186380 ?auto_186382 ) ) ( not ( = ?auto_186380 ?auto_186377 ) ) ( not ( = ?auto_186380 ?auto_186379 ) ) ( not ( = ?auto_186380 ?auto_186376 ) ) ( not ( = ?auto_186380 ?auto_186375 ) ) ( not ( = ?auto_186382 ?auto_186377 ) ) ( not ( = ?auto_186382 ?auto_186379 ) ) ( not ( = ?auto_186382 ?auto_186376 ) ) ( not ( = ?auto_186382 ?auto_186375 ) ) ( not ( = ?auto_186377 ?auto_186379 ) ) ( not ( = ?auto_186377 ?auto_186376 ) ) ( not ( = ?auto_186377 ?auto_186375 ) ) ( not ( = ?auto_186374 ?auto_186381 ) ) ( not ( = ?auto_186374 ?auto_186380 ) ) ( not ( = ?auto_186374 ?auto_186382 ) ) ( not ( = ?auto_186374 ?auto_186377 ) ) ( ON ?auto_186374 ?auto_186378 ) ( not ( = ?auto_186374 ?auto_186378 ) ) ( not ( = ?auto_186375 ?auto_186378 ) ) ( not ( = ?auto_186376 ?auto_186378 ) ) ( not ( = ?auto_186379 ?auto_186378 ) ) ( not ( = ?auto_186381 ?auto_186378 ) ) ( not ( = ?auto_186380 ?auto_186378 ) ) ( not ( = ?auto_186382 ?auto_186378 ) ) ( not ( = ?auto_186377 ?auto_186378 ) ) ( ON ?auto_186375 ?auto_186374 ) ( ON-TABLE ?auto_186378 ) ( ON ?auto_186376 ?auto_186375 ) ( ON ?auto_186379 ?auto_186376 ) ( ON ?auto_186377 ?auto_186379 ) ( ON ?auto_186382 ?auto_186377 ) ( ON ?auto_186380 ?auto_186382 ) ( ON ?auto_186381 ?auto_186380 ) ( CLEAR ?auto_186381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186378 ?auto_186374 ?auto_186375 ?auto_186376 ?auto_186379 ?auto_186377 ?auto_186382 ?auto_186380 )
      ( MAKE-3PILE ?auto_186374 ?auto_186375 ?auto_186376 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186406 - BLOCK
      ?auto_186407 - BLOCK
      ?auto_186408 - BLOCK
      ?auto_186409 - BLOCK
    )
    :vars
    (
      ?auto_186410 - BLOCK
      ?auto_186412 - BLOCK
      ?auto_186411 - BLOCK
      ?auto_186413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186410 ?auto_186409 ) ( ON-TABLE ?auto_186406 ) ( ON ?auto_186407 ?auto_186406 ) ( ON ?auto_186408 ?auto_186407 ) ( ON ?auto_186409 ?auto_186408 ) ( not ( = ?auto_186406 ?auto_186407 ) ) ( not ( = ?auto_186406 ?auto_186408 ) ) ( not ( = ?auto_186406 ?auto_186409 ) ) ( not ( = ?auto_186406 ?auto_186410 ) ) ( not ( = ?auto_186407 ?auto_186408 ) ) ( not ( = ?auto_186407 ?auto_186409 ) ) ( not ( = ?auto_186407 ?auto_186410 ) ) ( not ( = ?auto_186408 ?auto_186409 ) ) ( not ( = ?auto_186408 ?auto_186410 ) ) ( not ( = ?auto_186409 ?auto_186410 ) ) ( not ( = ?auto_186406 ?auto_186412 ) ) ( not ( = ?auto_186406 ?auto_186411 ) ) ( not ( = ?auto_186407 ?auto_186412 ) ) ( not ( = ?auto_186407 ?auto_186411 ) ) ( not ( = ?auto_186408 ?auto_186412 ) ) ( not ( = ?auto_186408 ?auto_186411 ) ) ( not ( = ?auto_186409 ?auto_186412 ) ) ( not ( = ?auto_186409 ?auto_186411 ) ) ( not ( = ?auto_186410 ?auto_186412 ) ) ( not ( = ?auto_186410 ?auto_186411 ) ) ( not ( = ?auto_186412 ?auto_186411 ) ) ( ON ?auto_186412 ?auto_186410 ) ( CLEAR ?auto_186412 ) ( HOLDING ?auto_186411 ) ( CLEAR ?auto_186413 ) ( ON-TABLE ?auto_186413 ) ( not ( = ?auto_186413 ?auto_186411 ) ) ( not ( = ?auto_186406 ?auto_186413 ) ) ( not ( = ?auto_186407 ?auto_186413 ) ) ( not ( = ?auto_186408 ?auto_186413 ) ) ( not ( = ?auto_186409 ?auto_186413 ) ) ( not ( = ?auto_186410 ?auto_186413 ) ) ( not ( = ?auto_186412 ?auto_186413 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186413 ?auto_186411 )
      ( MAKE-4PILE ?auto_186406 ?auto_186407 ?auto_186408 ?auto_186409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186414 - BLOCK
      ?auto_186415 - BLOCK
      ?auto_186416 - BLOCK
      ?auto_186417 - BLOCK
    )
    :vars
    (
      ?auto_186418 - BLOCK
      ?auto_186420 - BLOCK
      ?auto_186421 - BLOCK
      ?auto_186419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186418 ?auto_186417 ) ( ON-TABLE ?auto_186414 ) ( ON ?auto_186415 ?auto_186414 ) ( ON ?auto_186416 ?auto_186415 ) ( ON ?auto_186417 ?auto_186416 ) ( not ( = ?auto_186414 ?auto_186415 ) ) ( not ( = ?auto_186414 ?auto_186416 ) ) ( not ( = ?auto_186414 ?auto_186417 ) ) ( not ( = ?auto_186414 ?auto_186418 ) ) ( not ( = ?auto_186415 ?auto_186416 ) ) ( not ( = ?auto_186415 ?auto_186417 ) ) ( not ( = ?auto_186415 ?auto_186418 ) ) ( not ( = ?auto_186416 ?auto_186417 ) ) ( not ( = ?auto_186416 ?auto_186418 ) ) ( not ( = ?auto_186417 ?auto_186418 ) ) ( not ( = ?auto_186414 ?auto_186420 ) ) ( not ( = ?auto_186414 ?auto_186421 ) ) ( not ( = ?auto_186415 ?auto_186420 ) ) ( not ( = ?auto_186415 ?auto_186421 ) ) ( not ( = ?auto_186416 ?auto_186420 ) ) ( not ( = ?auto_186416 ?auto_186421 ) ) ( not ( = ?auto_186417 ?auto_186420 ) ) ( not ( = ?auto_186417 ?auto_186421 ) ) ( not ( = ?auto_186418 ?auto_186420 ) ) ( not ( = ?auto_186418 ?auto_186421 ) ) ( not ( = ?auto_186420 ?auto_186421 ) ) ( ON ?auto_186420 ?auto_186418 ) ( CLEAR ?auto_186419 ) ( ON-TABLE ?auto_186419 ) ( not ( = ?auto_186419 ?auto_186421 ) ) ( not ( = ?auto_186414 ?auto_186419 ) ) ( not ( = ?auto_186415 ?auto_186419 ) ) ( not ( = ?auto_186416 ?auto_186419 ) ) ( not ( = ?auto_186417 ?auto_186419 ) ) ( not ( = ?auto_186418 ?auto_186419 ) ) ( not ( = ?auto_186420 ?auto_186419 ) ) ( ON ?auto_186421 ?auto_186420 ) ( CLEAR ?auto_186421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186414 ?auto_186415 ?auto_186416 ?auto_186417 ?auto_186418 ?auto_186420 )
      ( MAKE-4PILE ?auto_186414 ?auto_186415 ?auto_186416 ?auto_186417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186422 - BLOCK
      ?auto_186423 - BLOCK
      ?auto_186424 - BLOCK
      ?auto_186425 - BLOCK
    )
    :vars
    (
      ?auto_186429 - BLOCK
      ?auto_186428 - BLOCK
      ?auto_186427 - BLOCK
      ?auto_186426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186429 ?auto_186425 ) ( ON-TABLE ?auto_186422 ) ( ON ?auto_186423 ?auto_186422 ) ( ON ?auto_186424 ?auto_186423 ) ( ON ?auto_186425 ?auto_186424 ) ( not ( = ?auto_186422 ?auto_186423 ) ) ( not ( = ?auto_186422 ?auto_186424 ) ) ( not ( = ?auto_186422 ?auto_186425 ) ) ( not ( = ?auto_186422 ?auto_186429 ) ) ( not ( = ?auto_186423 ?auto_186424 ) ) ( not ( = ?auto_186423 ?auto_186425 ) ) ( not ( = ?auto_186423 ?auto_186429 ) ) ( not ( = ?auto_186424 ?auto_186425 ) ) ( not ( = ?auto_186424 ?auto_186429 ) ) ( not ( = ?auto_186425 ?auto_186429 ) ) ( not ( = ?auto_186422 ?auto_186428 ) ) ( not ( = ?auto_186422 ?auto_186427 ) ) ( not ( = ?auto_186423 ?auto_186428 ) ) ( not ( = ?auto_186423 ?auto_186427 ) ) ( not ( = ?auto_186424 ?auto_186428 ) ) ( not ( = ?auto_186424 ?auto_186427 ) ) ( not ( = ?auto_186425 ?auto_186428 ) ) ( not ( = ?auto_186425 ?auto_186427 ) ) ( not ( = ?auto_186429 ?auto_186428 ) ) ( not ( = ?auto_186429 ?auto_186427 ) ) ( not ( = ?auto_186428 ?auto_186427 ) ) ( ON ?auto_186428 ?auto_186429 ) ( not ( = ?auto_186426 ?auto_186427 ) ) ( not ( = ?auto_186422 ?auto_186426 ) ) ( not ( = ?auto_186423 ?auto_186426 ) ) ( not ( = ?auto_186424 ?auto_186426 ) ) ( not ( = ?auto_186425 ?auto_186426 ) ) ( not ( = ?auto_186429 ?auto_186426 ) ) ( not ( = ?auto_186428 ?auto_186426 ) ) ( ON ?auto_186427 ?auto_186428 ) ( CLEAR ?auto_186427 ) ( HOLDING ?auto_186426 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186426 )
      ( MAKE-4PILE ?auto_186422 ?auto_186423 ?auto_186424 ?auto_186425 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186442 - BLOCK
      ?auto_186443 - BLOCK
      ?auto_186444 - BLOCK
      ?auto_186445 - BLOCK
    )
    :vars
    (
      ?auto_186447 - BLOCK
      ?auto_186446 - BLOCK
      ?auto_186449 - BLOCK
      ?auto_186448 - BLOCK
      ?auto_186450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186447 ?auto_186445 ) ( ON-TABLE ?auto_186442 ) ( ON ?auto_186443 ?auto_186442 ) ( ON ?auto_186444 ?auto_186443 ) ( ON ?auto_186445 ?auto_186444 ) ( not ( = ?auto_186442 ?auto_186443 ) ) ( not ( = ?auto_186442 ?auto_186444 ) ) ( not ( = ?auto_186442 ?auto_186445 ) ) ( not ( = ?auto_186442 ?auto_186447 ) ) ( not ( = ?auto_186443 ?auto_186444 ) ) ( not ( = ?auto_186443 ?auto_186445 ) ) ( not ( = ?auto_186443 ?auto_186447 ) ) ( not ( = ?auto_186444 ?auto_186445 ) ) ( not ( = ?auto_186444 ?auto_186447 ) ) ( not ( = ?auto_186445 ?auto_186447 ) ) ( not ( = ?auto_186442 ?auto_186446 ) ) ( not ( = ?auto_186442 ?auto_186449 ) ) ( not ( = ?auto_186443 ?auto_186446 ) ) ( not ( = ?auto_186443 ?auto_186449 ) ) ( not ( = ?auto_186444 ?auto_186446 ) ) ( not ( = ?auto_186444 ?auto_186449 ) ) ( not ( = ?auto_186445 ?auto_186446 ) ) ( not ( = ?auto_186445 ?auto_186449 ) ) ( not ( = ?auto_186447 ?auto_186446 ) ) ( not ( = ?auto_186447 ?auto_186449 ) ) ( not ( = ?auto_186446 ?auto_186449 ) ) ( ON ?auto_186446 ?auto_186447 ) ( not ( = ?auto_186448 ?auto_186449 ) ) ( not ( = ?auto_186442 ?auto_186448 ) ) ( not ( = ?auto_186443 ?auto_186448 ) ) ( not ( = ?auto_186444 ?auto_186448 ) ) ( not ( = ?auto_186445 ?auto_186448 ) ) ( not ( = ?auto_186447 ?auto_186448 ) ) ( not ( = ?auto_186446 ?auto_186448 ) ) ( ON ?auto_186449 ?auto_186446 ) ( CLEAR ?auto_186449 ) ( ON ?auto_186448 ?auto_186450 ) ( CLEAR ?auto_186448 ) ( HAND-EMPTY ) ( not ( = ?auto_186442 ?auto_186450 ) ) ( not ( = ?auto_186443 ?auto_186450 ) ) ( not ( = ?auto_186444 ?auto_186450 ) ) ( not ( = ?auto_186445 ?auto_186450 ) ) ( not ( = ?auto_186447 ?auto_186450 ) ) ( not ( = ?auto_186446 ?auto_186450 ) ) ( not ( = ?auto_186449 ?auto_186450 ) ) ( not ( = ?auto_186448 ?auto_186450 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186448 ?auto_186450 )
      ( MAKE-4PILE ?auto_186442 ?auto_186443 ?auto_186444 ?auto_186445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186451 - BLOCK
      ?auto_186452 - BLOCK
      ?auto_186453 - BLOCK
      ?auto_186454 - BLOCK
    )
    :vars
    (
      ?auto_186455 - BLOCK
      ?auto_186458 - BLOCK
      ?auto_186456 - BLOCK
      ?auto_186457 - BLOCK
      ?auto_186459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186455 ?auto_186454 ) ( ON-TABLE ?auto_186451 ) ( ON ?auto_186452 ?auto_186451 ) ( ON ?auto_186453 ?auto_186452 ) ( ON ?auto_186454 ?auto_186453 ) ( not ( = ?auto_186451 ?auto_186452 ) ) ( not ( = ?auto_186451 ?auto_186453 ) ) ( not ( = ?auto_186451 ?auto_186454 ) ) ( not ( = ?auto_186451 ?auto_186455 ) ) ( not ( = ?auto_186452 ?auto_186453 ) ) ( not ( = ?auto_186452 ?auto_186454 ) ) ( not ( = ?auto_186452 ?auto_186455 ) ) ( not ( = ?auto_186453 ?auto_186454 ) ) ( not ( = ?auto_186453 ?auto_186455 ) ) ( not ( = ?auto_186454 ?auto_186455 ) ) ( not ( = ?auto_186451 ?auto_186458 ) ) ( not ( = ?auto_186451 ?auto_186456 ) ) ( not ( = ?auto_186452 ?auto_186458 ) ) ( not ( = ?auto_186452 ?auto_186456 ) ) ( not ( = ?auto_186453 ?auto_186458 ) ) ( not ( = ?auto_186453 ?auto_186456 ) ) ( not ( = ?auto_186454 ?auto_186458 ) ) ( not ( = ?auto_186454 ?auto_186456 ) ) ( not ( = ?auto_186455 ?auto_186458 ) ) ( not ( = ?auto_186455 ?auto_186456 ) ) ( not ( = ?auto_186458 ?auto_186456 ) ) ( ON ?auto_186458 ?auto_186455 ) ( not ( = ?auto_186457 ?auto_186456 ) ) ( not ( = ?auto_186451 ?auto_186457 ) ) ( not ( = ?auto_186452 ?auto_186457 ) ) ( not ( = ?auto_186453 ?auto_186457 ) ) ( not ( = ?auto_186454 ?auto_186457 ) ) ( not ( = ?auto_186455 ?auto_186457 ) ) ( not ( = ?auto_186458 ?auto_186457 ) ) ( ON ?auto_186457 ?auto_186459 ) ( CLEAR ?auto_186457 ) ( not ( = ?auto_186451 ?auto_186459 ) ) ( not ( = ?auto_186452 ?auto_186459 ) ) ( not ( = ?auto_186453 ?auto_186459 ) ) ( not ( = ?auto_186454 ?auto_186459 ) ) ( not ( = ?auto_186455 ?auto_186459 ) ) ( not ( = ?auto_186458 ?auto_186459 ) ) ( not ( = ?auto_186456 ?auto_186459 ) ) ( not ( = ?auto_186457 ?auto_186459 ) ) ( HOLDING ?auto_186456 ) ( CLEAR ?auto_186458 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186451 ?auto_186452 ?auto_186453 ?auto_186454 ?auto_186455 ?auto_186458 ?auto_186456 )
      ( MAKE-4PILE ?auto_186451 ?auto_186452 ?auto_186453 ?auto_186454 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186533 - BLOCK
      ?auto_186534 - BLOCK
      ?auto_186535 - BLOCK
      ?auto_186536 - BLOCK
    )
    :vars
    (
      ?auto_186537 - BLOCK
      ?auto_186539 - BLOCK
      ?auto_186538 - BLOCK
      ?auto_186540 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186533 ) ( ON ?auto_186534 ?auto_186533 ) ( not ( = ?auto_186533 ?auto_186534 ) ) ( not ( = ?auto_186533 ?auto_186535 ) ) ( not ( = ?auto_186533 ?auto_186536 ) ) ( not ( = ?auto_186534 ?auto_186535 ) ) ( not ( = ?auto_186534 ?auto_186536 ) ) ( not ( = ?auto_186535 ?auto_186536 ) ) ( ON ?auto_186536 ?auto_186537 ) ( not ( = ?auto_186533 ?auto_186537 ) ) ( not ( = ?auto_186534 ?auto_186537 ) ) ( not ( = ?auto_186535 ?auto_186537 ) ) ( not ( = ?auto_186536 ?auto_186537 ) ) ( CLEAR ?auto_186534 ) ( ON ?auto_186535 ?auto_186536 ) ( CLEAR ?auto_186535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186539 ) ( ON ?auto_186538 ?auto_186539 ) ( ON ?auto_186540 ?auto_186538 ) ( ON ?auto_186537 ?auto_186540 ) ( not ( = ?auto_186539 ?auto_186538 ) ) ( not ( = ?auto_186539 ?auto_186540 ) ) ( not ( = ?auto_186539 ?auto_186537 ) ) ( not ( = ?auto_186539 ?auto_186536 ) ) ( not ( = ?auto_186539 ?auto_186535 ) ) ( not ( = ?auto_186538 ?auto_186540 ) ) ( not ( = ?auto_186538 ?auto_186537 ) ) ( not ( = ?auto_186538 ?auto_186536 ) ) ( not ( = ?auto_186538 ?auto_186535 ) ) ( not ( = ?auto_186540 ?auto_186537 ) ) ( not ( = ?auto_186540 ?auto_186536 ) ) ( not ( = ?auto_186540 ?auto_186535 ) ) ( not ( = ?auto_186533 ?auto_186539 ) ) ( not ( = ?auto_186533 ?auto_186538 ) ) ( not ( = ?auto_186533 ?auto_186540 ) ) ( not ( = ?auto_186534 ?auto_186539 ) ) ( not ( = ?auto_186534 ?auto_186538 ) ) ( not ( = ?auto_186534 ?auto_186540 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186539 ?auto_186538 ?auto_186540 ?auto_186537 ?auto_186536 )
      ( MAKE-4PILE ?auto_186533 ?auto_186534 ?auto_186535 ?auto_186536 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186541 - BLOCK
      ?auto_186542 - BLOCK
      ?auto_186543 - BLOCK
      ?auto_186544 - BLOCK
    )
    :vars
    (
      ?auto_186547 - BLOCK
      ?auto_186546 - BLOCK
      ?auto_186545 - BLOCK
      ?auto_186548 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186541 ) ( not ( = ?auto_186541 ?auto_186542 ) ) ( not ( = ?auto_186541 ?auto_186543 ) ) ( not ( = ?auto_186541 ?auto_186544 ) ) ( not ( = ?auto_186542 ?auto_186543 ) ) ( not ( = ?auto_186542 ?auto_186544 ) ) ( not ( = ?auto_186543 ?auto_186544 ) ) ( ON ?auto_186544 ?auto_186547 ) ( not ( = ?auto_186541 ?auto_186547 ) ) ( not ( = ?auto_186542 ?auto_186547 ) ) ( not ( = ?auto_186543 ?auto_186547 ) ) ( not ( = ?auto_186544 ?auto_186547 ) ) ( ON ?auto_186543 ?auto_186544 ) ( CLEAR ?auto_186543 ) ( ON-TABLE ?auto_186546 ) ( ON ?auto_186545 ?auto_186546 ) ( ON ?auto_186548 ?auto_186545 ) ( ON ?auto_186547 ?auto_186548 ) ( not ( = ?auto_186546 ?auto_186545 ) ) ( not ( = ?auto_186546 ?auto_186548 ) ) ( not ( = ?auto_186546 ?auto_186547 ) ) ( not ( = ?auto_186546 ?auto_186544 ) ) ( not ( = ?auto_186546 ?auto_186543 ) ) ( not ( = ?auto_186545 ?auto_186548 ) ) ( not ( = ?auto_186545 ?auto_186547 ) ) ( not ( = ?auto_186545 ?auto_186544 ) ) ( not ( = ?auto_186545 ?auto_186543 ) ) ( not ( = ?auto_186548 ?auto_186547 ) ) ( not ( = ?auto_186548 ?auto_186544 ) ) ( not ( = ?auto_186548 ?auto_186543 ) ) ( not ( = ?auto_186541 ?auto_186546 ) ) ( not ( = ?auto_186541 ?auto_186545 ) ) ( not ( = ?auto_186541 ?auto_186548 ) ) ( not ( = ?auto_186542 ?auto_186546 ) ) ( not ( = ?auto_186542 ?auto_186545 ) ) ( not ( = ?auto_186542 ?auto_186548 ) ) ( HOLDING ?auto_186542 ) ( CLEAR ?auto_186541 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186541 ?auto_186542 )
      ( MAKE-4PILE ?auto_186541 ?auto_186542 ?auto_186543 ?auto_186544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186549 - BLOCK
      ?auto_186550 - BLOCK
      ?auto_186551 - BLOCK
      ?auto_186552 - BLOCK
    )
    :vars
    (
      ?auto_186554 - BLOCK
      ?auto_186553 - BLOCK
      ?auto_186556 - BLOCK
      ?auto_186555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186549 ) ( not ( = ?auto_186549 ?auto_186550 ) ) ( not ( = ?auto_186549 ?auto_186551 ) ) ( not ( = ?auto_186549 ?auto_186552 ) ) ( not ( = ?auto_186550 ?auto_186551 ) ) ( not ( = ?auto_186550 ?auto_186552 ) ) ( not ( = ?auto_186551 ?auto_186552 ) ) ( ON ?auto_186552 ?auto_186554 ) ( not ( = ?auto_186549 ?auto_186554 ) ) ( not ( = ?auto_186550 ?auto_186554 ) ) ( not ( = ?auto_186551 ?auto_186554 ) ) ( not ( = ?auto_186552 ?auto_186554 ) ) ( ON ?auto_186551 ?auto_186552 ) ( ON-TABLE ?auto_186553 ) ( ON ?auto_186556 ?auto_186553 ) ( ON ?auto_186555 ?auto_186556 ) ( ON ?auto_186554 ?auto_186555 ) ( not ( = ?auto_186553 ?auto_186556 ) ) ( not ( = ?auto_186553 ?auto_186555 ) ) ( not ( = ?auto_186553 ?auto_186554 ) ) ( not ( = ?auto_186553 ?auto_186552 ) ) ( not ( = ?auto_186553 ?auto_186551 ) ) ( not ( = ?auto_186556 ?auto_186555 ) ) ( not ( = ?auto_186556 ?auto_186554 ) ) ( not ( = ?auto_186556 ?auto_186552 ) ) ( not ( = ?auto_186556 ?auto_186551 ) ) ( not ( = ?auto_186555 ?auto_186554 ) ) ( not ( = ?auto_186555 ?auto_186552 ) ) ( not ( = ?auto_186555 ?auto_186551 ) ) ( not ( = ?auto_186549 ?auto_186553 ) ) ( not ( = ?auto_186549 ?auto_186556 ) ) ( not ( = ?auto_186549 ?auto_186555 ) ) ( not ( = ?auto_186550 ?auto_186553 ) ) ( not ( = ?auto_186550 ?auto_186556 ) ) ( not ( = ?auto_186550 ?auto_186555 ) ) ( CLEAR ?auto_186549 ) ( ON ?auto_186550 ?auto_186551 ) ( CLEAR ?auto_186550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186553 ?auto_186556 ?auto_186555 ?auto_186554 ?auto_186552 ?auto_186551 )
      ( MAKE-4PILE ?auto_186549 ?auto_186550 ?auto_186551 ?auto_186552 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186557 - BLOCK
      ?auto_186558 - BLOCK
      ?auto_186559 - BLOCK
      ?auto_186560 - BLOCK
    )
    :vars
    (
      ?auto_186562 - BLOCK
      ?auto_186564 - BLOCK
      ?auto_186563 - BLOCK
      ?auto_186561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186557 ?auto_186558 ) ) ( not ( = ?auto_186557 ?auto_186559 ) ) ( not ( = ?auto_186557 ?auto_186560 ) ) ( not ( = ?auto_186558 ?auto_186559 ) ) ( not ( = ?auto_186558 ?auto_186560 ) ) ( not ( = ?auto_186559 ?auto_186560 ) ) ( ON ?auto_186560 ?auto_186562 ) ( not ( = ?auto_186557 ?auto_186562 ) ) ( not ( = ?auto_186558 ?auto_186562 ) ) ( not ( = ?auto_186559 ?auto_186562 ) ) ( not ( = ?auto_186560 ?auto_186562 ) ) ( ON ?auto_186559 ?auto_186560 ) ( ON-TABLE ?auto_186564 ) ( ON ?auto_186563 ?auto_186564 ) ( ON ?auto_186561 ?auto_186563 ) ( ON ?auto_186562 ?auto_186561 ) ( not ( = ?auto_186564 ?auto_186563 ) ) ( not ( = ?auto_186564 ?auto_186561 ) ) ( not ( = ?auto_186564 ?auto_186562 ) ) ( not ( = ?auto_186564 ?auto_186560 ) ) ( not ( = ?auto_186564 ?auto_186559 ) ) ( not ( = ?auto_186563 ?auto_186561 ) ) ( not ( = ?auto_186563 ?auto_186562 ) ) ( not ( = ?auto_186563 ?auto_186560 ) ) ( not ( = ?auto_186563 ?auto_186559 ) ) ( not ( = ?auto_186561 ?auto_186562 ) ) ( not ( = ?auto_186561 ?auto_186560 ) ) ( not ( = ?auto_186561 ?auto_186559 ) ) ( not ( = ?auto_186557 ?auto_186564 ) ) ( not ( = ?auto_186557 ?auto_186563 ) ) ( not ( = ?auto_186557 ?auto_186561 ) ) ( not ( = ?auto_186558 ?auto_186564 ) ) ( not ( = ?auto_186558 ?auto_186563 ) ) ( not ( = ?auto_186558 ?auto_186561 ) ) ( ON ?auto_186558 ?auto_186559 ) ( CLEAR ?auto_186558 ) ( HOLDING ?auto_186557 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186557 )
      ( MAKE-4PILE ?auto_186557 ?auto_186558 ?auto_186559 ?auto_186560 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186565 - BLOCK
      ?auto_186566 - BLOCK
      ?auto_186567 - BLOCK
      ?auto_186568 - BLOCK
    )
    :vars
    (
      ?auto_186569 - BLOCK
      ?auto_186571 - BLOCK
      ?auto_186572 - BLOCK
      ?auto_186570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186565 ?auto_186566 ) ) ( not ( = ?auto_186565 ?auto_186567 ) ) ( not ( = ?auto_186565 ?auto_186568 ) ) ( not ( = ?auto_186566 ?auto_186567 ) ) ( not ( = ?auto_186566 ?auto_186568 ) ) ( not ( = ?auto_186567 ?auto_186568 ) ) ( ON ?auto_186568 ?auto_186569 ) ( not ( = ?auto_186565 ?auto_186569 ) ) ( not ( = ?auto_186566 ?auto_186569 ) ) ( not ( = ?auto_186567 ?auto_186569 ) ) ( not ( = ?auto_186568 ?auto_186569 ) ) ( ON ?auto_186567 ?auto_186568 ) ( ON-TABLE ?auto_186571 ) ( ON ?auto_186572 ?auto_186571 ) ( ON ?auto_186570 ?auto_186572 ) ( ON ?auto_186569 ?auto_186570 ) ( not ( = ?auto_186571 ?auto_186572 ) ) ( not ( = ?auto_186571 ?auto_186570 ) ) ( not ( = ?auto_186571 ?auto_186569 ) ) ( not ( = ?auto_186571 ?auto_186568 ) ) ( not ( = ?auto_186571 ?auto_186567 ) ) ( not ( = ?auto_186572 ?auto_186570 ) ) ( not ( = ?auto_186572 ?auto_186569 ) ) ( not ( = ?auto_186572 ?auto_186568 ) ) ( not ( = ?auto_186572 ?auto_186567 ) ) ( not ( = ?auto_186570 ?auto_186569 ) ) ( not ( = ?auto_186570 ?auto_186568 ) ) ( not ( = ?auto_186570 ?auto_186567 ) ) ( not ( = ?auto_186565 ?auto_186571 ) ) ( not ( = ?auto_186565 ?auto_186572 ) ) ( not ( = ?auto_186565 ?auto_186570 ) ) ( not ( = ?auto_186566 ?auto_186571 ) ) ( not ( = ?auto_186566 ?auto_186572 ) ) ( not ( = ?auto_186566 ?auto_186570 ) ) ( ON ?auto_186566 ?auto_186567 ) ( ON ?auto_186565 ?auto_186566 ) ( CLEAR ?auto_186565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186571 ?auto_186572 ?auto_186570 ?auto_186569 ?auto_186568 ?auto_186567 ?auto_186566 )
      ( MAKE-4PILE ?auto_186565 ?auto_186566 ?auto_186567 ?auto_186568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186577 - BLOCK
      ?auto_186578 - BLOCK
      ?auto_186579 - BLOCK
      ?auto_186580 - BLOCK
    )
    :vars
    (
      ?auto_186581 - BLOCK
      ?auto_186583 - BLOCK
      ?auto_186584 - BLOCK
      ?auto_186582 - BLOCK
      ?auto_186585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186577 ?auto_186578 ) ) ( not ( = ?auto_186577 ?auto_186579 ) ) ( not ( = ?auto_186577 ?auto_186580 ) ) ( not ( = ?auto_186578 ?auto_186579 ) ) ( not ( = ?auto_186578 ?auto_186580 ) ) ( not ( = ?auto_186579 ?auto_186580 ) ) ( ON ?auto_186580 ?auto_186581 ) ( not ( = ?auto_186577 ?auto_186581 ) ) ( not ( = ?auto_186578 ?auto_186581 ) ) ( not ( = ?auto_186579 ?auto_186581 ) ) ( not ( = ?auto_186580 ?auto_186581 ) ) ( ON ?auto_186579 ?auto_186580 ) ( ON-TABLE ?auto_186583 ) ( ON ?auto_186584 ?auto_186583 ) ( ON ?auto_186582 ?auto_186584 ) ( ON ?auto_186581 ?auto_186582 ) ( not ( = ?auto_186583 ?auto_186584 ) ) ( not ( = ?auto_186583 ?auto_186582 ) ) ( not ( = ?auto_186583 ?auto_186581 ) ) ( not ( = ?auto_186583 ?auto_186580 ) ) ( not ( = ?auto_186583 ?auto_186579 ) ) ( not ( = ?auto_186584 ?auto_186582 ) ) ( not ( = ?auto_186584 ?auto_186581 ) ) ( not ( = ?auto_186584 ?auto_186580 ) ) ( not ( = ?auto_186584 ?auto_186579 ) ) ( not ( = ?auto_186582 ?auto_186581 ) ) ( not ( = ?auto_186582 ?auto_186580 ) ) ( not ( = ?auto_186582 ?auto_186579 ) ) ( not ( = ?auto_186577 ?auto_186583 ) ) ( not ( = ?auto_186577 ?auto_186584 ) ) ( not ( = ?auto_186577 ?auto_186582 ) ) ( not ( = ?auto_186578 ?auto_186583 ) ) ( not ( = ?auto_186578 ?auto_186584 ) ) ( not ( = ?auto_186578 ?auto_186582 ) ) ( ON ?auto_186578 ?auto_186579 ) ( CLEAR ?auto_186578 ) ( ON ?auto_186577 ?auto_186585 ) ( CLEAR ?auto_186577 ) ( HAND-EMPTY ) ( not ( = ?auto_186577 ?auto_186585 ) ) ( not ( = ?auto_186578 ?auto_186585 ) ) ( not ( = ?auto_186579 ?auto_186585 ) ) ( not ( = ?auto_186580 ?auto_186585 ) ) ( not ( = ?auto_186581 ?auto_186585 ) ) ( not ( = ?auto_186583 ?auto_186585 ) ) ( not ( = ?auto_186584 ?auto_186585 ) ) ( not ( = ?auto_186582 ?auto_186585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186577 ?auto_186585 )
      ( MAKE-4PILE ?auto_186577 ?auto_186578 ?auto_186579 ?auto_186580 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186586 - BLOCK
      ?auto_186587 - BLOCK
      ?auto_186588 - BLOCK
      ?auto_186589 - BLOCK
    )
    :vars
    (
      ?auto_186594 - BLOCK
      ?auto_186590 - BLOCK
      ?auto_186591 - BLOCK
      ?auto_186592 - BLOCK
      ?auto_186593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186586 ?auto_186587 ) ) ( not ( = ?auto_186586 ?auto_186588 ) ) ( not ( = ?auto_186586 ?auto_186589 ) ) ( not ( = ?auto_186587 ?auto_186588 ) ) ( not ( = ?auto_186587 ?auto_186589 ) ) ( not ( = ?auto_186588 ?auto_186589 ) ) ( ON ?auto_186589 ?auto_186594 ) ( not ( = ?auto_186586 ?auto_186594 ) ) ( not ( = ?auto_186587 ?auto_186594 ) ) ( not ( = ?auto_186588 ?auto_186594 ) ) ( not ( = ?auto_186589 ?auto_186594 ) ) ( ON ?auto_186588 ?auto_186589 ) ( ON-TABLE ?auto_186590 ) ( ON ?auto_186591 ?auto_186590 ) ( ON ?auto_186592 ?auto_186591 ) ( ON ?auto_186594 ?auto_186592 ) ( not ( = ?auto_186590 ?auto_186591 ) ) ( not ( = ?auto_186590 ?auto_186592 ) ) ( not ( = ?auto_186590 ?auto_186594 ) ) ( not ( = ?auto_186590 ?auto_186589 ) ) ( not ( = ?auto_186590 ?auto_186588 ) ) ( not ( = ?auto_186591 ?auto_186592 ) ) ( not ( = ?auto_186591 ?auto_186594 ) ) ( not ( = ?auto_186591 ?auto_186589 ) ) ( not ( = ?auto_186591 ?auto_186588 ) ) ( not ( = ?auto_186592 ?auto_186594 ) ) ( not ( = ?auto_186592 ?auto_186589 ) ) ( not ( = ?auto_186592 ?auto_186588 ) ) ( not ( = ?auto_186586 ?auto_186590 ) ) ( not ( = ?auto_186586 ?auto_186591 ) ) ( not ( = ?auto_186586 ?auto_186592 ) ) ( not ( = ?auto_186587 ?auto_186590 ) ) ( not ( = ?auto_186587 ?auto_186591 ) ) ( not ( = ?auto_186587 ?auto_186592 ) ) ( ON ?auto_186586 ?auto_186593 ) ( CLEAR ?auto_186586 ) ( not ( = ?auto_186586 ?auto_186593 ) ) ( not ( = ?auto_186587 ?auto_186593 ) ) ( not ( = ?auto_186588 ?auto_186593 ) ) ( not ( = ?auto_186589 ?auto_186593 ) ) ( not ( = ?auto_186594 ?auto_186593 ) ) ( not ( = ?auto_186590 ?auto_186593 ) ) ( not ( = ?auto_186591 ?auto_186593 ) ) ( not ( = ?auto_186592 ?auto_186593 ) ) ( HOLDING ?auto_186587 ) ( CLEAR ?auto_186588 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186590 ?auto_186591 ?auto_186592 ?auto_186594 ?auto_186589 ?auto_186588 ?auto_186587 )
      ( MAKE-4PILE ?auto_186586 ?auto_186587 ?auto_186588 ?auto_186589 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186595 - BLOCK
      ?auto_186596 - BLOCK
      ?auto_186597 - BLOCK
      ?auto_186598 - BLOCK
    )
    :vars
    (
      ?auto_186600 - BLOCK
      ?auto_186601 - BLOCK
      ?auto_186602 - BLOCK
      ?auto_186599 - BLOCK
      ?auto_186603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186595 ?auto_186596 ) ) ( not ( = ?auto_186595 ?auto_186597 ) ) ( not ( = ?auto_186595 ?auto_186598 ) ) ( not ( = ?auto_186596 ?auto_186597 ) ) ( not ( = ?auto_186596 ?auto_186598 ) ) ( not ( = ?auto_186597 ?auto_186598 ) ) ( ON ?auto_186598 ?auto_186600 ) ( not ( = ?auto_186595 ?auto_186600 ) ) ( not ( = ?auto_186596 ?auto_186600 ) ) ( not ( = ?auto_186597 ?auto_186600 ) ) ( not ( = ?auto_186598 ?auto_186600 ) ) ( ON ?auto_186597 ?auto_186598 ) ( ON-TABLE ?auto_186601 ) ( ON ?auto_186602 ?auto_186601 ) ( ON ?auto_186599 ?auto_186602 ) ( ON ?auto_186600 ?auto_186599 ) ( not ( = ?auto_186601 ?auto_186602 ) ) ( not ( = ?auto_186601 ?auto_186599 ) ) ( not ( = ?auto_186601 ?auto_186600 ) ) ( not ( = ?auto_186601 ?auto_186598 ) ) ( not ( = ?auto_186601 ?auto_186597 ) ) ( not ( = ?auto_186602 ?auto_186599 ) ) ( not ( = ?auto_186602 ?auto_186600 ) ) ( not ( = ?auto_186602 ?auto_186598 ) ) ( not ( = ?auto_186602 ?auto_186597 ) ) ( not ( = ?auto_186599 ?auto_186600 ) ) ( not ( = ?auto_186599 ?auto_186598 ) ) ( not ( = ?auto_186599 ?auto_186597 ) ) ( not ( = ?auto_186595 ?auto_186601 ) ) ( not ( = ?auto_186595 ?auto_186602 ) ) ( not ( = ?auto_186595 ?auto_186599 ) ) ( not ( = ?auto_186596 ?auto_186601 ) ) ( not ( = ?auto_186596 ?auto_186602 ) ) ( not ( = ?auto_186596 ?auto_186599 ) ) ( ON ?auto_186595 ?auto_186603 ) ( not ( = ?auto_186595 ?auto_186603 ) ) ( not ( = ?auto_186596 ?auto_186603 ) ) ( not ( = ?auto_186597 ?auto_186603 ) ) ( not ( = ?auto_186598 ?auto_186603 ) ) ( not ( = ?auto_186600 ?auto_186603 ) ) ( not ( = ?auto_186601 ?auto_186603 ) ) ( not ( = ?auto_186602 ?auto_186603 ) ) ( not ( = ?auto_186599 ?auto_186603 ) ) ( CLEAR ?auto_186597 ) ( ON ?auto_186596 ?auto_186595 ) ( CLEAR ?auto_186596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186603 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186603 ?auto_186595 )
      ( MAKE-4PILE ?auto_186595 ?auto_186596 ?auto_186597 ?auto_186598 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186604 - BLOCK
      ?auto_186605 - BLOCK
      ?auto_186606 - BLOCK
      ?auto_186607 - BLOCK
    )
    :vars
    (
      ?auto_186612 - BLOCK
      ?auto_186610 - BLOCK
      ?auto_186609 - BLOCK
      ?auto_186608 - BLOCK
      ?auto_186611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186604 ?auto_186605 ) ) ( not ( = ?auto_186604 ?auto_186606 ) ) ( not ( = ?auto_186604 ?auto_186607 ) ) ( not ( = ?auto_186605 ?auto_186606 ) ) ( not ( = ?auto_186605 ?auto_186607 ) ) ( not ( = ?auto_186606 ?auto_186607 ) ) ( ON ?auto_186607 ?auto_186612 ) ( not ( = ?auto_186604 ?auto_186612 ) ) ( not ( = ?auto_186605 ?auto_186612 ) ) ( not ( = ?auto_186606 ?auto_186612 ) ) ( not ( = ?auto_186607 ?auto_186612 ) ) ( ON-TABLE ?auto_186610 ) ( ON ?auto_186609 ?auto_186610 ) ( ON ?auto_186608 ?auto_186609 ) ( ON ?auto_186612 ?auto_186608 ) ( not ( = ?auto_186610 ?auto_186609 ) ) ( not ( = ?auto_186610 ?auto_186608 ) ) ( not ( = ?auto_186610 ?auto_186612 ) ) ( not ( = ?auto_186610 ?auto_186607 ) ) ( not ( = ?auto_186610 ?auto_186606 ) ) ( not ( = ?auto_186609 ?auto_186608 ) ) ( not ( = ?auto_186609 ?auto_186612 ) ) ( not ( = ?auto_186609 ?auto_186607 ) ) ( not ( = ?auto_186609 ?auto_186606 ) ) ( not ( = ?auto_186608 ?auto_186612 ) ) ( not ( = ?auto_186608 ?auto_186607 ) ) ( not ( = ?auto_186608 ?auto_186606 ) ) ( not ( = ?auto_186604 ?auto_186610 ) ) ( not ( = ?auto_186604 ?auto_186609 ) ) ( not ( = ?auto_186604 ?auto_186608 ) ) ( not ( = ?auto_186605 ?auto_186610 ) ) ( not ( = ?auto_186605 ?auto_186609 ) ) ( not ( = ?auto_186605 ?auto_186608 ) ) ( ON ?auto_186604 ?auto_186611 ) ( not ( = ?auto_186604 ?auto_186611 ) ) ( not ( = ?auto_186605 ?auto_186611 ) ) ( not ( = ?auto_186606 ?auto_186611 ) ) ( not ( = ?auto_186607 ?auto_186611 ) ) ( not ( = ?auto_186612 ?auto_186611 ) ) ( not ( = ?auto_186610 ?auto_186611 ) ) ( not ( = ?auto_186609 ?auto_186611 ) ) ( not ( = ?auto_186608 ?auto_186611 ) ) ( ON ?auto_186605 ?auto_186604 ) ( CLEAR ?auto_186605 ) ( ON-TABLE ?auto_186611 ) ( HOLDING ?auto_186606 ) ( CLEAR ?auto_186607 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186610 ?auto_186609 ?auto_186608 ?auto_186612 ?auto_186607 ?auto_186606 )
      ( MAKE-4PILE ?auto_186604 ?auto_186605 ?auto_186606 ?auto_186607 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186613 - BLOCK
      ?auto_186614 - BLOCK
      ?auto_186615 - BLOCK
      ?auto_186616 - BLOCK
    )
    :vars
    (
      ?auto_186621 - BLOCK
      ?auto_186620 - BLOCK
      ?auto_186619 - BLOCK
      ?auto_186618 - BLOCK
      ?auto_186617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186613 ?auto_186614 ) ) ( not ( = ?auto_186613 ?auto_186615 ) ) ( not ( = ?auto_186613 ?auto_186616 ) ) ( not ( = ?auto_186614 ?auto_186615 ) ) ( not ( = ?auto_186614 ?auto_186616 ) ) ( not ( = ?auto_186615 ?auto_186616 ) ) ( ON ?auto_186616 ?auto_186621 ) ( not ( = ?auto_186613 ?auto_186621 ) ) ( not ( = ?auto_186614 ?auto_186621 ) ) ( not ( = ?auto_186615 ?auto_186621 ) ) ( not ( = ?auto_186616 ?auto_186621 ) ) ( ON-TABLE ?auto_186620 ) ( ON ?auto_186619 ?auto_186620 ) ( ON ?auto_186618 ?auto_186619 ) ( ON ?auto_186621 ?auto_186618 ) ( not ( = ?auto_186620 ?auto_186619 ) ) ( not ( = ?auto_186620 ?auto_186618 ) ) ( not ( = ?auto_186620 ?auto_186621 ) ) ( not ( = ?auto_186620 ?auto_186616 ) ) ( not ( = ?auto_186620 ?auto_186615 ) ) ( not ( = ?auto_186619 ?auto_186618 ) ) ( not ( = ?auto_186619 ?auto_186621 ) ) ( not ( = ?auto_186619 ?auto_186616 ) ) ( not ( = ?auto_186619 ?auto_186615 ) ) ( not ( = ?auto_186618 ?auto_186621 ) ) ( not ( = ?auto_186618 ?auto_186616 ) ) ( not ( = ?auto_186618 ?auto_186615 ) ) ( not ( = ?auto_186613 ?auto_186620 ) ) ( not ( = ?auto_186613 ?auto_186619 ) ) ( not ( = ?auto_186613 ?auto_186618 ) ) ( not ( = ?auto_186614 ?auto_186620 ) ) ( not ( = ?auto_186614 ?auto_186619 ) ) ( not ( = ?auto_186614 ?auto_186618 ) ) ( ON ?auto_186613 ?auto_186617 ) ( not ( = ?auto_186613 ?auto_186617 ) ) ( not ( = ?auto_186614 ?auto_186617 ) ) ( not ( = ?auto_186615 ?auto_186617 ) ) ( not ( = ?auto_186616 ?auto_186617 ) ) ( not ( = ?auto_186621 ?auto_186617 ) ) ( not ( = ?auto_186620 ?auto_186617 ) ) ( not ( = ?auto_186619 ?auto_186617 ) ) ( not ( = ?auto_186618 ?auto_186617 ) ) ( ON ?auto_186614 ?auto_186613 ) ( ON-TABLE ?auto_186617 ) ( CLEAR ?auto_186616 ) ( ON ?auto_186615 ?auto_186614 ) ( CLEAR ?auto_186615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186617 ?auto_186613 ?auto_186614 )
      ( MAKE-4PILE ?auto_186613 ?auto_186614 ?auto_186615 ?auto_186616 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186622 - BLOCK
      ?auto_186623 - BLOCK
      ?auto_186624 - BLOCK
      ?auto_186625 - BLOCK
    )
    :vars
    (
      ?auto_186629 - BLOCK
      ?auto_186630 - BLOCK
      ?auto_186627 - BLOCK
      ?auto_186628 - BLOCK
      ?auto_186626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186622 ?auto_186623 ) ) ( not ( = ?auto_186622 ?auto_186624 ) ) ( not ( = ?auto_186622 ?auto_186625 ) ) ( not ( = ?auto_186623 ?auto_186624 ) ) ( not ( = ?auto_186623 ?auto_186625 ) ) ( not ( = ?auto_186624 ?auto_186625 ) ) ( not ( = ?auto_186622 ?auto_186629 ) ) ( not ( = ?auto_186623 ?auto_186629 ) ) ( not ( = ?auto_186624 ?auto_186629 ) ) ( not ( = ?auto_186625 ?auto_186629 ) ) ( ON-TABLE ?auto_186630 ) ( ON ?auto_186627 ?auto_186630 ) ( ON ?auto_186628 ?auto_186627 ) ( ON ?auto_186629 ?auto_186628 ) ( not ( = ?auto_186630 ?auto_186627 ) ) ( not ( = ?auto_186630 ?auto_186628 ) ) ( not ( = ?auto_186630 ?auto_186629 ) ) ( not ( = ?auto_186630 ?auto_186625 ) ) ( not ( = ?auto_186630 ?auto_186624 ) ) ( not ( = ?auto_186627 ?auto_186628 ) ) ( not ( = ?auto_186627 ?auto_186629 ) ) ( not ( = ?auto_186627 ?auto_186625 ) ) ( not ( = ?auto_186627 ?auto_186624 ) ) ( not ( = ?auto_186628 ?auto_186629 ) ) ( not ( = ?auto_186628 ?auto_186625 ) ) ( not ( = ?auto_186628 ?auto_186624 ) ) ( not ( = ?auto_186622 ?auto_186630 ) ) ( not ( = ?auto_186622 ?auto_186627 ) ) ( not ( = ?auto_186622 ?auto_186628 ) ) ( not ( = ?auto_186623 ?auto_186630 ) ) ( not ( = ?auto_186623 ?auto_186627 ) ) ( not ( = ?auto_186623 ?auto_186628 ) ) ( ON ?auto_186622 ?auto_186626 ) ( not ( = ?auto_186622 ?auto_186626 ) ) ( not ( = ?auto_186623 ?auto_186626 ) ) ( not ( = ?auto_186624 ?auto_186626 ) ) ( not ( = ?auto_186625 ?auto_186626 ) ) ( not ( = ?auto_186629 ?auto_186626 ) ) ( not ( = ?auto_186630 ?auto_186626 ) ) ( not ( = ?auto_186627 ?auto_186626 ) ) ( not ( = ?auto_186628 ?auto_186626 ) ) ( ON ?auto_186623 ?auto_186622 ) ( ON-TABLE ?auto_186626 ) ( ON ?auto_186624 ?auto_186623 ) ( CLEAR ?auto_186624 ) ( HOLDING ?auto_186625 ) ( CLEAR ?auto_186629 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186630 ?auto_186627 ?auto_186628 ?auto_186629 ?auto_186625 )
      ( MAKE-4PILE ?auto_186622 ?auto_186623 ?auto_186624 ?auto_186625 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186631 - BLOCK
      ?auto_186632 - BLOCK
      ?auto_186633 - BLOCK
      ?auto_186634 - BLOCK
    )
    :vars
    (
      ?auto_186635 - BLOCK
      ?auto_186636 - BLOCK
      ?auto_186637 - BLOCK
      ?auto_186639 - BLOCK
      ?auto_186638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186631 ?auto_186632 ) ) ( not ( = ?auto_186631 ?auto_186633 ) ) ( not ( = ?auto_186631 ?auto_186634 ) ) ( not ( = ?auto_186632 ?auto_186633 ) ) ( not ( = ?auto_186632 ?auto_186634 ) ) ( not ( = ?auto_186633 ?auto_186634 ) ) ( not ( = ?auto_186631 ?auto_186635 ) ) ( not ( = ?auto_186632 ?auto_186635 ) ) ( not ( = ?auto_186633 ?auto_186635 ) ) ( not ( = ?auto_186634 ?auto_186635 ) ) ( ON-TABLE ?auto_186636 ) ( ON ?auto_186637 ?auto_186636 ) ( ON ?auto_186639 ?auto_186637 ) ( ON ?auto_186635 ?auto_186639 ) ( not ( = ?auto_186636 ?auto_186637 ) ) ( not ( = ?auto_186636 ?auto_186639 ) ) ( not ( = ?auto_186636 ?auto_186635 ) ) ( not ( = ?auto_186636 ?auto_186634 ) ) ( not ( = ?auto_186636 ?auto_186633 ) ) ( not ( = ?auto_186637 ?auto_186639 ) ) ( not ( = ?auto_186637 ?auto_186635 ) ) ( not ( = ?auto_186637 ?auto_186634 ) ) ( not ( = ?auto_186637 ?auto_186633 ) ) ( not ( = ?auto_186639 ?auto_186635 ) ) ( not ( = ?auto_186639 ?auto_186634 ) ) ( not ( = ?auto_186639 ?auto_186633 ) ) ( not ( = ?auto_186631 ?auto_186636 ) ) ( not ( = ?auto_186631 ?auto_186637 ) ) ( not ( = ?auto_186631 ?auto_186639 ) ) ( not ( = ?auto_186632 ?auto_186636 ) ) ( not ( = ?auto_186632 ?auto_186637 ) ) ( not ( = ?auto_186632 ?auto_186639 ) ) ( ON ?auto_186631 ?auto_186638 ) ( not ( = ?auto_186631 ?auto_186638 ) ) ( not ( = ?auto_186632 ?auto_186638 ) ) ( not ( = ?auto_186633 ?auto_186638 ) ) ( not ( = ?auto_186634 ?auto_186638 ) ) ( not ( = ?auto_186635 ?auto_186638 ) ) ( not ( = ?auto_186636 ?auto_186638 ) ) ( not ( = ?auto_186637 ?auto_186638 ) ) ( not ( = ?auto_186639 ?auto_186638 ) ) ( ON ?auto_186632 ?auto_186631 ) ( ON-TABLE ?auto_186638 ) ( ON ?auto_186633 ?auto_186632 ) ( CLEAR ?auto_186635 ) ( ON ?auto_186634 ?auto_186633 ) ( CLEAR ?auto_186634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186638 ?auto_186631 ?auto_186632 ?auto_186633 )
      ( MAKE-4PILE ?auto_186631 ?auto_186632 ?auto_186633 ?auto_186634 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186640 - BLOCK
      ?auto_186641 - BLOCK
      ?auto_186642 - BLOCK
      ?auto_186643 - BLOCK
    )
    :vars
    (
      ?auto_186647 - BLOCK
      ?auto_186644 - BLOCK
      ?auto_186645 - BLOCK
      ?auto_186648 - BLOCK
      ?auto_186646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186640 ?auto_186641 ) ) ( not ( = ?auto_186640 ?auto_186642 ) ) ( not ( = ?auto_186640 ?auto_186643 ) ) ( not ( = ?auto_186641 ?auto_186642 ) ) ( not ( = ?auto_186641 ?auto_186643 ) ) ( not ( = ?auto_186642 ?auto_186643 ) ) ( not ( = ?auto_186640 ?auto_186647 ) ) ( not ( = ?auto_186641 ?auto_186647 ) ) ( not ( = ?auto_186642 ?auto_186647 ) ) ( not ( = ?auto_186643 ?auto_186647 ) ) ( ON-TABLE ?auto_186644 ) ( ON ?auto_186645 ?auto_186644 ) ( ON ?auto_186648 ?auto_186645 ) ( not ( = ?auto_186644 ?auto_186645 ) ) ( not ( = ?auto_186644 ?auto_186648 ) ) ( not ( = ?auto_186644 ?auto_186647 ) ) ( not ( = ?auto_186644 ?auto_186643 ) ) ( not ( = ?auto_186644 ?auto_186642 ) ) ( not ( = ?auto_186645 ?auto_186648 ) ) ( not ( = ?auto_186645 ?auto_186647 ) ) ( not ( = ?auto_186645 ?auto_186643 ) ) ( not ( = ?auto_186645 ?auto_186642 ) ) ( not ( = ?auto_186648 ?auto_186647 ) ) ( not ( = ?auto_186648 ?auto_186643 ) ) ( not ( = ?auto_186648 ?auto_186642 ) ) ( not ( = ?auto_186640 ?auto_186644 ) ) ( not ( = ?auto_186640 ?auto_186645 ) ) ( not ( = ?auto_186640 ?auto_186648 ) ) ( not ( = ?auto_186641 ?auto_186644 ) ) ( not ( = ?auto_186641 ?auto_186645 ) ) ( not ( = ?auto_186641 ?auto_186648 ) ) ( ON ?auto_186640 ?auto_186646 ) ( not ( = ?auto_186640 ?auto_186646 ) ) ( not ( = ?auto_186641 ?auto_186646 ) ) ( not ( = ?auto_186642 ?auto_186646 ) ) ( not ( = ?auto_186643 ?auto_186646 ) ) ( not ( = ?auto_186647 ?auto_186646 ) ) ( not ( = ?auto_186644 ?auto_186646 ) ) ( not ( = ?auto_186645 ?auto_186646 ) ) ( not ( = ?auto_186648 ?auto_186646 ) ) ( ON ?auto_186641 ?auto_186640 ) ( ON-TABLE ?auto_186646 ) ( ON ?auto_186642 ?auto_186641 ) ( ON ?auto_186643 ?auto_186642 ) ( CLEAR ?auto_186643 ) ( HOLDING ?auto_186647 ) ( CLEAR ?auto_186648 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186644 ?auto_186645 ?auto_186648 ?auto_186647 )
      ( MAKE-4PILE ?auto_186640 ?auto_186641 ?auto_186642 ?auto_186643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186649 - BLOCK
      ?auto_186650 - BLOCK
      ?auto_186651 - BLOCK
      ?auto_186652 - BLOCK
    )
    :vars
    (
      ?auto_186656 - BLOCK
      ?auto_186653 - BLOCK
      ?auto_186657 - BLOCK
      ?auto_186654 - BLOCK
      ?auto_186655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186649 ?auto_186650 ) ) ( not ( = ?auto_186649 ?auto_186651 ) ) ( not ( = ?auto_186649 ?auto_186652 ) ) ( not ( = ?auto_186650 ?auto_186651 ) ) ( not ( = ?auto_186650 ?auto_186652 ) ) ( not ( = ?auto_186651 ?auto_186652 ) ) ( not ( = ?auto_186649 ?auto_186656 ) ) ( not ( = ?auto_186650 ?auto_186656 ) ) ( not ( = ?auto_186651 ?auto_186656 ) ) ( not ( = ?auto_186652 ?auto_186656 ) ) ( ON-TABLE ?auto_186653 ) ( ON ?auto_186657 ?auto_186653 ) ( ON ?auto_186654 ?auto_186657 ) ( not ( = ?auto_186653 ?auto_186657 ) ) ( not ( = ?auto_186653 ?auto_186654 ) ) ( not ( = ?auto_186653 ?auto_186656 ) ) ( not ( = ?auto_186653 ?auto_186652 ) ) ( not ( = ?auto_186653 ?auto_186651 ) ) ( not ( = ?auto_186657 ?auto_186654 ) ) ( not ( = ?auto_186657 ?auto_186656 ) ) ( not ( = ?auto_186657 ?auto_186652 ) ) ( not ( = ?auto_186657 ?auto_186651 ) ) ( not ( = ?auto_186654 ?auto_186656 ) ) ( not ( = ?auto_186654 ?auto_186652 ) ) ( not ( = ?auto_186654 ?auto_186651 ) ) ( not ( = ?auto_186649 ?auto_186653 ) ) ( not ( = ?auto_186649 ?auto_186657 ) ) ( not ( = ?auto_186649 ?auto_186654 ) ) ( not ( = ?auto_186650 ?auto_186653 ) ) ( not ( = ?auto_186650 ?auto_186657 ) ) ( not ( = ?auto_186650 ?auto_186654 ) ) ( ON ?auto_186649 ?auto_186655 ) ( not ( = ?auto_186649 ?auto_186655 ) ) ( not ( = ?auto_186650 ?auto_186655 ) ) ( not ( = ?auto_186651 ?auto_186655 ) ) ( not ( = ?auto_186652 ?auto_186655 ) ) ( not ( = ?auto_186656 ?auto_186655 ) ) ( not ( = ?auto_186653 ?auto_186655 ) ) ( not ( = ?auto_186657 ?auto_186655 ) ) ( not ( = ?auto_186654 ?auto_186655 ) ) ( ON ?auto_186650 ?auto_186649 ) ( ON-TABLE ?auto_186655 ) ( ON ?auto_186651 ?auto_186650 ) ( ON ?auto_186652 ?auto_186651 ) ( CLEAR ?auto_186654 ) ( ON ?auto_186656 ?auto_186652 ) ( CLEAR ?auto_186656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186655 ?auto_186649 ?auto_186650 ?auto_186651 ?auto_186652 )
      ( MAKE-4PILE ?auto_186649 ?auto_186650 ?auto_186651 ?auto_186652 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186658 - BLOCK
      ?auto_186659 - BLOCK
      ?auto_186660 - BLOCK
      ?auto_186661 - BLOCK
    )
    :vars
    (
      ?auto_186665 - BLOCK
      ?auto_186666 - BLOCK
      ?auto_186664 - BLOCK
      ?auto_186662 - BLOCK
      ?auto_186663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186658 ?auto_186659 ) ) ( not ( = ?auto_186658 ?auto_186660 ) ) ( not ( = ?auto_186658 ?auto_186661 ) ) ( not ( = ?auto_186659 ?auto_186660 ) ) ( not ( = ?auto_186659 ?auto_186661 ) ) ( not ( = ?auto_186660 ?auto_186661 ) ) ( not ( = ?auto_186658 ?auto_186665 ) ) ( not ( = ?auto_186659 ?auto_186665 ) ) ( not ( = ?auto_186660 ?auto_186665 ) ) ( not ( = ?auto_186661 ?auto_186665 ) ) ( ON-TABLE ?auto_186666 ) ( ON ?auto_186664 ?auto_186666 ) ( not ( = ?auto_186666 ?auto_186664 ) ) ( not ( = ?auto_186666 ?auto_186662 ) ) ( not ( = ?auto_186666 ?auto_186665 ) ) ( not ( = ?auto_186666 ?auto_186661 ) ) ( not ( = ?auto_186666 ?auto_186660 ) ) ( not ( = ?auto_186664 ?auto_186662 ) ) ( not ( = ?auto_186664 ?auto_186665 ) ) ( not ( = ?auto_186664 ?auto_186661 ) ) ( not ( = ?auto_186664 ?auto_186660 ) ) ( not ( = ?auto_186662 ?auto_186665 ) ) ( not ( = ?auto_186662 ?auto_186661 ) ) ( not ( = ?auto_186662 ?auto_186660 ) ) ( not ( = ?auto_186658 ?auto_186666 ) ) ( not ( = ?auto_186658 ?auto_186664 ) ) ( not ( = ?auto_186658 ?auto_186662 ) ) ( not ( = ?auto_186659 ?auto_186666 ) ) ( not ( = ?auto_186659 ?auto_186664 ) ) ( not ( = ?auto_186659 ?auto_186662 ) ) ( ON ?auto_186658 ?auto_186663 ) ( not ( = ?auto_186658 ?auto_186663 ) ) ( not ( = ?auto_186659 ?auto_186663 ) ) ( not ( = ?auto_186660 ?auto_186663 ) ) ( not ( = ?auto_186661 ?auto_186663 ) ) ( not ( = ?auto_186665 ?auto_186663 ) ) ( not ( = ?auto_186666 ?auto_186663 ) ) ( not ( = ?auto_186664 ?auto_186663 ) ) ( not ( = ?auto_186662 ?auto_186663 ) ) ( ON ?auto_186659 ?auto_186658 ) ( ON-TABLE ?auto_186663 ) ( ON ?auto_186660 ?auto_186659 ) ( ON ?auto_186661 ?auto_186660 ) ( ON ?auto_186665 ?auto_186661 ) ( CLEAR ?auto_186665 ) ( HOLDING ?auto_186662 ) ( CLEAR ?auto_186664 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186666 ?auto_186664 ?auto_186662 )
      ( MAKE-4PILE ?auto_186658 ?auto_186659 ?auto_186660 ?auto_186661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186667 - BLOCK
      ?auto_186668 - BLOCK
      ?auto_186669 - BLOCK
      ?auto_186670 - BLOCK
    )
    :vars
    (
      ?auto_186673 - BLOCK
      ?auto_186675 - BLOCK
      ?auto_186671 - BLOCK
      ?auto_186672 - BLOCK
      ?auto_186674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186667 ?auto_186668 ) ) ( not ( = ?auto_186667 ?auto_186669 ) ) ( not ( = ?auto_186667 ?auto_186670 ) ) ( not ( = ?auto_186668 ?auto_186669 ) ) ( not ( = ?auto_186668 ?auto_186670 ) ) ( not ( = ?auto_186669 ?auto_186670 ) ) ( not ( = ?auto_186667 ?auto_186673 ) ) ( not ( = ?auto_186668 ?auto_186673 ) ) ( not ( = ?auto_186669 ?auto_186673 ) ) ( not ( = ?auto_186670 ?auto_186673 ) ) ( ON-TABLE ?auto_186675 ) ( ON ?auto_186671 ?auto_186675 ) ( not ( = ?auto_186675 ?auto_186671 ) ) ( not ( = ?auto_186675 ?auto_186672 ) ) ( not ( = ?auto_186675 ?auto_186673 ) ) ( not ( = ?auto_186675 ?auto_186670 ) ) ( not ( = ?auto_186675 ?auto_186669 ) ) ( not ( = ?auto_186671 ?auto_186672 ) ) ( not ( = ?auto_186671 ?auto_186673 ) ) ( not ( = ?auto_186671 ?auto_186670 ) ) ( not ( = ?auto_186671 ?auto_186669 ) ) ( not ( = ?auto_186672 ?auto_186673 ) ) ( not ( = ?auto_186672 ?auto_186670 ) ) ( not ( = ?auto_186672 ?auto_186669 ) ) ( not ( = ?auto_186667 ?auto_186675 ) ) ( not ( = ?auto_186667 ?auto_186671 ) ) ( not ( = ?auto_186667 ?auto_186672 ) ) ( not ( = ?auto_186668 ?auto_186675 ) ) ( not ( = ?auto_186668 ?auto_186671 ) ) ( not ( = ?auto_186668 ?auto_186672 ) ) ( ON ?auto_186667 ?auto_186674 ) ( not ( = ?auto_186667 ?auto_186674 ) ) ( not ( = ?auto_186668 ?auto_186674 ) ) ( not ( = ?auto_186669 ?auto_186674 ) ) ( not ( = ?auto_186670 ?auto_186674 ) ) ( not ( = ?auto_186673 ?auto_186674 ) ) ( not ( = ?auto_186675 ?auto_186674 ) ) ( not ( = ?auto_186671 ?auto_186674 ) ) ( not ( = ?auto_186672 ?auto_186674 ) ) ( ON ?auto_186668 ?auto_186667 ) ( ON-TABLE ?auto_186674 ) ( ON ?auto_186669 ?auto_186668 ) ( ON ?auto_186670 ?auto_186669 ) ( ON ?auto_186673 ?auto_186670 ) ( CLEAR ?auto_186671 ) ( ON ?auto_186672 ?auto_186673 ) ( CLEAR ?auto_186672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186674 ?auto_186667 ?auto_186668 ?auto_186669 ?auto_186670 ?auto_186673 )
      ( MAKE-4PILE ?auto_186667 ?auto_186668 ?auto_186669 ?auto_186670 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186676 - BLOCK
      ?auto_186677 - BLOCK
      ?auto_186678 - BLOCK
      ?auto_186679 - BLOCK
    )
    :vars
    (
      ?auto_186683 - BLOCK
      ?auto_186681 - BLOCK
      ?auto_186682 - BLOCK
      ?auto_186684 - BLOCK
      ?auto_186680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186676 ?auto_186677 ) ) ( not ( = ?auto_186676 ?auto_186678 ) ) ( not ( = ?auto_186676 ?auto_186679 ) ) ( not ( = ?auto_186677 ?auto_186678 ) ) ( not ( = ?auto_186677 ?auto_186679 ) ) ( not ( = ?auto_186678 ?auto_186679 ) ) ( not ( = ?auto_186676 ?auto_186683 ) ) ( not ( = ?auto_186677 ?auto_186683 ) ) ( not ( = ?auto_186678 ?auto_186683 ) ) ( not ( = ?auto_186679 ?auto_186683 ) ) ( ON-TABLE ?auto_186681 ) ( not ( = ?auto_186681 ?auto_186682 ) ) ( not ( = ?auto_186681 ?auto_186684 ) ) ( not ( = ?auto_186681 ?auto_186683 ) ) ( not ( = ?auto_186681 ?auto_186679 ) ) ( not ( = ?auto_186681 ?auto_186678 ) ) ( not ( = ?auto_186682 ?auto_186684 ) ) ( not ( = ?auto_186682 ?auto_186683 ) ) ( not ( = ?auto_186682 ?auto_186679 ) ) ( not ( = ?auto_186682 ?auto_186678 ) ) ( not ( = ?auto_186684 ?auto_186683 ) ) ( not ( = ?auto_186684 ?auto_186679 ) ) ( not ( = ?auto_186684 ?auto_186678 ) ) ( not ( = ?auto_186676 ?auto_186681 ) ) ( not ( = ?auto_186676 ?auto_186682 ) ) ( not ( = ?auto_186676 ?auto_186684 ) ) ( not ( = ?auto_186677 ?auto_186681 ) ) ( not ( = ?auto_186677 ?auto_186682 ) ) ( not ( = ?auto_186677 ?auto_186684 ) ) ( ON ?auto_186676 ?auto_186680 ) ( not ( = ?auto_186676 ?auto_186680 ) ) ( not ( = ?auto_186677 ?auto_186680 ) ) ( not ( = ?auto_186678 ?auto_186680 ) ) ( not ( = ?auto_186679 ?auto_186680 ) ) ( not ( = ?auto_186683 ?auto_186680 ) ) ( not ( = ?auto_186681 ?auto_186680 ) ) ( not ( = ?auto_186682 ?auto_186680 ) ) ( not ( = ?auto_186684 ?auto_186680 ) ) ( ON ?auto_186677 ?auto_186676 ) ( ON-TABLE ?auto_186680 ) ( ON ?auto_186678 ?auto_186677 ) ( ON ?auto_186679 ?auto_186678 ) ( ON ?auto_186683 ?auto_186679 ) ( ON ?auto_186684 ?auto_186683 ) ( CLEAR ?auto_186684 ) ( HOLDING ?auto_186682 ) ( CLEAR ?auto_186681 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186681 ?auto_186682 )
      ( MAKE-4PILE ?auto_186676 ?auto_186677 ?auto_186678 ?auto_186679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186685 - BLOCK
      ?auto_186686 - BLOCK
      ?auto_186687 - BLOCK
      ?auto_186688 - BLOCK
    )
    :vars
    (
      ?auto_186689 - BLOCK
      ?auto_186693 - BLOCK
      ?auto_186691 - BLOCK
      ?auto_186690 - BLOCK
      ?auto_186692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186685 ?auto_186686 ) ) ( not ( = ?auto_186685 ?auto_186687 ) ) ( not ( = ?auto_186685 ?auto_186688 ) ) ( not ( = ?auto_186686 ?auto_186687 ) ) ( not ( = ?auto_186686 ?auto_186688 ) ) ( not ( = ?auto_186687 ?auto_186688 ) ) ( not ( = ?auto_186685 ?auto_186689 ) ) ( not ( = ?auto_186686 ?auto_186689 ) ) ( not ( = ?auto_186687 ?auto_186689 ) ) ( not ( = ?auto_186688 ?auto_186689 ) ) ( ON-TABLE ?auto_186693 ) ( not ( = ?auto_186693 ?auto_186691 ) ) ( not ( = ?auto_186693 ?auto_186690 ) ) ( not ( = ?auto_186693 ?auto_186689 ) ) ( not ( = ?auto_186693 ?auto_186688 ) ) ( not ( = ?auto_186693 ?auto_186687 ) ) ( not ( = ?auto_186691 ?auto_186690 ) ) ( not ( = ?auto_186691 ?auto_186689 ) ) ( not ( = ?auto_186691 ?auto_186688 ) ) ( not ( = ?auto_186691 ?auto_186687 ) ) ( not ( = ?auto_186690 ?auto_186689 ) ) ( not ( = ?auto_186690 ?auto_186688 ) ) ( not ( = ?auto_186690 ?auto_186687 ) ) ( not ( = ?auto_186685 ?auto_186693 ) ) ( not ( = ?auto_186685 ?auto_186691 ) ) ( not ( = ?auto_186685 ?auto_186690 ) ) ( not ( = ?auto_186686 ?auto_186693 ) ) ( not ( = ?auto_186686 ?auto_186691 ) ) ( not ( = ?auto_186686 ?auto_186690 ) ) ( ON ?auto_186685 ?auto_186692 ) ( not ( = ?auto_186685 ?auto_186692 ) ) ( not ( = ?auto_186686 ?auto_186692 ) ) ( not ( = ?auto_186687 ?auto_186692 ) ) ( not ( = ?auto_186688 ?auto_186692 ) ) ( not ( = ?auto_186689 ?auto_186692 ) ) ( not ( = ?auto_186693 ?auto_186692 ) ) ( not ( = ?auto_186691 ?auto_186692 ) ) ( not ( = ?auto_186690 ?auto_186692 ) ) ( ON ?auto_186686 ?auto_186685 ) ( ON-TABLE ?auto_186692 ) ( ON ?auto_186687 ?auto_186686 ) ( ON ?auto_186688 ?auto_186687 ) ( ON ?auto_186689 ?auto_186688 ) ( ON ?auto_186690 ?auto_186689 ) ( CLEAR ?auto_186693 ) ( ON ?auto_186691 ?auto_186690 ) ( CLEAR ?auto_186691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186692 ?auto_186685 ?auto_186686 ?auto_186687 ?auto_186688 ?auto_186689 ?auto_186690 )
      ( MAKE-4PILE ?auto_186685 ?auto_186686 ?auto_186687 ?auto_186688 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186694 - BLOCK
      ?auto_186695 - BLOCK
      ?auto_186696 - BLOCK
      ?auto_186697 - BLOCK
    )
    :vars
    (
      ?auto_186700 - BLOCK
      ?auto_186702 - BLOCK
      ?auto_186698 - BLOCK
      ?auto_186701 - BLOCK
      ?auto_186699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186694 ?auto_186695 ) ) ( not ( = ?auto_186694 ?auto_186696 ) ) ( not ( = ?auto_186694 ?auto_186697 ) ) ( not ( = ?auto_186695 ?auto_186696 ) ) ( not ( = ?auto_186695 ?auto_186697 ) ) ( not ( = ?auto_186696 ?auto_186697 ) ) ( not ( = ?auto_186694 ?auto_186700 ) ) ( not ( = ?auto_186695 ?auto_186700 ) ) ( not ( = ?auto_186696 ?auto_186700 ) ) ( not ( = ?auto_186697 ?auto_186700 ) ) ( not ( = ?auto_186702 ?auto_186698 ) ) ( not ( = ?auto_186702 ?auto_186701 ) ) ( not ( = ?auto_186702 ?auto_186700 ) ) ( not ( = ?auto_186702 ?auto_186697 ) ) ( not ( = ?auto_186702 ?auto_186696 ) ) ( not ( = ?auto_186698 ?auto_186701 ) ) ( not ( = ?auto_186698 ?auto_186700 ) ) ( not ( = ?auto_186698 ?auto_186697 ) ) ( not ( = ?auto_186698 ?auto_186696 ) ) ( not ( = ?auto_186701 ?auto_186700 ) ) ( not ( = ?auto_186701 ?auto_186697 ) ) ( not ( = ?auto_186701 ?auto_186696 ) ) ( not ( = ?auto_186694 ?auto_186702 ) ) ( not ( = ?auto_186694 ?auto_186698 ) ) ( not ( = ?auto_186694 ?auto_186701 ) ) ( not ( = ?auto_186695 ?auto_186702 ) ) ( not ( = ?auto_186695 ?auto_186698 ) ) ( not ( = ?auto_186695 ?auto_186701 ) ) ( ON ?auto_186694 ?auto_186699 ) ( not ( = ?auto_186694 ?auto_186699 ) ) ( not ( = ?auto_186695 ?auto_186699 ) ) ( not ( = ?auto_186696 ?auto_186699 ) ) ( not ( = ?auto_186697 ?auto_186699 ) ) ( not ( = ?auto_186700 ?auto_186699 ) ) ( not ( = ?auto_186702 ?auto_186699 ) ) ( not ( = ?auto_186698 ?auto_186699 ) ) ( not ( = ?auto_186701 ?auto_186699 ) ) ( ON ?auto_186695 ?auto_186694 ) ( ON-TABLE ?auto_186699 ) ( ON ?auto_186696 ?auto_186695 ) ( ON ?auto_186697 ?auto_186696 ) ( ON ?auto_186700 ?auto_186697 ) ( ON ?auto_186701 ?auto_186700 ) ( ON ?auto_186698 ?auto_186701 ) ( CLEAR ?auto_186698 ) ( HOLDING ?auto_186702 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186702 )
      ( MAKE-4PILE ?auto_186694 ?auto_186695 ?auto_186696 ?auto_186697 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_186703 - BLOCK
      ?auto_186704 - BLOCK
      ?auto_186705 - BLOCK
      ?auto_186706 - BLOCK
    )
    :vars
    (
      ?auto_186710 - BLOCK
      ?auto_186708 - BLOCK
      ?auto_186707 - BLOCK
      ?auto_186711 - BLOCK
      ?auto_186709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186703 ?auto_186704 ) ) ( not ( = ?auto_186703 ?auto_186705 ) ) ( not ( = ?auto_186703 ?auto_186706 ) ) ( not ( = ?auto_186704 ?auto_186705 ) ) ( not ( = ?auto_186704 ?auto_186706 ) ) ( not ( = ?auto_186705 ?auto_186706 ) ) ( not ( = ?auto_186703 ?auto_186710 ) ) ( not ( = ?auto_186704 ?auto_186710 ) ) ( not ( = ?auto_186705 ?auto_186710 ) ) ( not ( = ?auto_186706 ?auto_186710 ) ) ( not ( = ?auto_186708 ?auto_186707 ) ) ( not ( = ?auto_186708 ?auto_186711 ) ) ( not ( = ?auto_186708 ?auto_186710 ) ) ( not ( = ?auto_186708 ?auto_186706 ) ) ( not ( = ?auto_186708 ?auto_186705 ) ) ( not ( = ?auto_186707 ?auto_186711 ) ) ( not ( = ?auto_186707 ?auto_186710 ) ) ( not ( = ?auto_186707 ?auto_186706 ) ) ( not ( = ?auto_186707 ?auto_186705 ) ) ( not ( = ?auto_186711 ?auto_186710 ) ) ( not ( = ?auto_186711 ?auto_186706 ) ) ( not ( = ?auto_186711 ?auto_186705 ) ) ( not ( = ?auto_186703 ?auto_186708 ) ) ( not ( = ?auto_186703 ?auto_186707 ) ) ( not ( = ?auto_186703 ?auto_186711 ) ) ( not ( = ?auto_186704 ?auto_186708 ) ) ( not ( = ?auto_186704 ?auto_186707 ) ) ( not ( = ?auto_186704 ?auto_186711 ) ) ( ON ?auto_186703 ?auto_186709 ) ( not ( = ?auto_186703 ?auto_186709 ) ) ( not ( = ?auto_186704 ?auto_186709 ) ) ( not ( = ?auto_186705 ?auto_186709 ) ) ( not ( = ?auto_186706 ?auto_186709 ) ) ( not ( = ?auto_186710 ?auto_186709 ) ) ( not ( = ?auto_186708 ?auto_186709 ) ) ( not ( = ?auto_186707 ?auto_186709 ) ) ( not ( = ?auto_186711 ?auto_186709 ) ) ( ON ?auto_186704 ?auto_186703 ) ( ON-TABLE ?auto_186709 ) ( ON ?auto_186705 ?auto_186704 ) ( ON ?auto_186706 ?auto_186705 ) ( ON ?auto_186710 ?auto_186706 ) ( ON ?auto_186711 ?auto_186710 ) ( ON ?auto_186707 ?auto_186711 ) ( ON ?auto_186708 ?auto_186707 ) ( CLEAR ?auto_186708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_186709 ?auto_186703 ?auto_186704 ?auto_186705 ?auto_186706 ?auto_186710 ?auto_186711 ?auto_186707 )
      ( MAKE-4PILE ?auto_186703 ?auto_186704 ?auto_186705 ?auto_186706 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186731 - BLOCK
      ?auto_186732 - BLOCK
      ?auto_186733 - BLOCK
    )
    :vars
    (
      ?auto_186734 - BLOCK
      ?auto_186735 - BLOCK
      ?auto_186736 - BLOCK
      ?auto_186737 - BLOCK
      ?auto_186738 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186734 ?auto_186733 ) ( ON-TABLE ?auto_186731 ) ( ON ?auto_186732 ?auto_186731 ) ( ON ?auto_186733 ?auto_186732 ) ( not ( = ?auto_186731 ?auto_186732 ) ) ( not ( = ?auto_186731 ?auto_186733 ) ) ( not ( = ?auto_186731 ?auto_186734 ) ) ( not ( = ?auto_186732 ?auto_186733 ) ) ( not ( = ?auto_186732 ?auto_186734 ) ) ( not ( = ?auto_186733 ?auto_186734 ) ) ( not ( = ?auto_186731 ?auto_186735 ) ) ( not ( = ?auto_186731 ?auto_186736 ) ) ( not ( = ?auto_186732 ?auto_186735 ) ) ( not ( = ?auto_186732 ?auto_186736 ) ) ( not ( = ?auto_186733 ?auto_186735 ) ) ( not ( = ?auto_186733 ?auto_186736 ) ) ( not ( = ?auto_186734 ?auto_186735 ) ) ( not ( = ?auto_186734 ?auto_186736 ) ) ( not ( = ?auto_186735 ?auto_186736 ) ) ( ON ?auto_186735 ?auto_186734 ) ( CLEAR ?auto_186735 ) ( HOLDING ?auto_186736 ) ( CLEAR ?auto_186737 ) ( ON-TABLE ?auto_186738 ) ( ON ?auto_186737 ?auto_186738 ) ( not ( = ?auto_186738 ?auto_186737 ) ) ( not ( = ?auto_186738 ?auto_186736 ) ) ( not ( = ?auto_186737 ?auto_186736 ) ) ( not ( = ?auto_186731 ?auto_186737 ) ) ( not ( = ?auto_186731 ?auto_186738 ) ) ( not ( = ?auto_186732 ?auto_186737 ) ) ( not ( = ?auto_186732 ?auto_186738 ) ) ( not ( = ?auto_186733 ?auto_186737 ) ) ( not ( = ?auto_186733 ?auto_186738 ) ) ( not ( = ?auto_186734 ?auto_186737 ) ) ( not ( = ?auto_186734 ?auto_186738 ) ) ( not ( = ?auto_186735 ?auto_186737 ) ) ( not ( = ?auto_186735 ?auto_186738 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186738 ?auto_186737 ?auto_186736 )
      ( MAKE-3PILE ?auto_186731 ?auto_186732 ?auto_186733 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186739 - BLOCK
      ?auto_186740 - BLOCK
      ?auto_186741 - BLOCK
    )
    :vars
    (
      ?auto_186742 - BLOCK
      ?auto_186745 - BLOCK
      ?auto_186744 - BLOCK
      ?auto_186743 - BLOCK
      ?auto_186746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186742 ?auto_186741 ) ( ON-TABLE ?auto_186739 ) ( ON ?auto_186740 ?auto_186739 ) ( ON ?auto_186741 ?auto_186740 ) ( not ( = ?auto_186739 ?auto_186740 ) ) ( not ( = ?auto_186739 ?auto_186741 ) ) ( not ( = ?auto_186739 ?auto_186742 ) ) ( not ( = ?auto_186740 ?auto_186741 ) ) ( not ( = ?auto_186740 ?auto_186742 ) ) ( not ( = ?auto_186741 ?auto_186742 ) ) ( not ( = ?auto_186739 ?auto_186745 ) ) ( not ( = ?auto_186739 ?auto_186744 ) ) ( not ( = ?auto_186740 ?auto_186745 ) ) ( not ( = ?auto_186740 ?auto_186744 ) ) ( not ( = ?auto_186741 ?auto_186745 ) ) ( not ( = ?auto_186741 ?auto_186744 ) ) ( not ( = ?auto_186742 ?auto_186745 ) ) ( not ( = ?auto_186742 ?auto_186744 ) ) ( not ( = ?auto_186745 ?auto_186744 ) ) ( ON ?auto_186745 ?auto_186742 ) ( CLEAR ?auto_186743 ) ( ON-TABLE ?auto_186746 ) ( ON ?auto_186743 ?auto_186746 ) ( not ( = ?auto_186746 ?auto_186743 ) ) ( not ( = ?auto_186746 ?auto_186744 ) ) ( not ( = ?auto_186743 ?auto_186744 ) ) ( not ( = ?auto_186739 ?auto_186743 ) ) ( not ( = ?auto_186739 ?auto_186746 ) ) ( not ( = ?auto_186740 ?auto_186743 ) ) ( not ( = ?auto_186740 ?auto_186746 ) ) ( not ( = ?auto_186741 ?auto_186743 ) ) ( not ( = ?auto_186741 ?auto_186746 ) ) ( not ( = ?auto_186742 ?auto_186743 ) ) ( not ( = ?auto_186742 ?auto_186746 ) ) ( not ( = ?auto_186745 ?auto_186743 ) ) ( not ( = ?auto_186745 ?auto_186746 ) ) ( ON ?auto_186744 ?auto_186745 ) ( CLEAR ?auto_186744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186739 ?auto_186740 ?auto_186741 ?auto_186742 ?auto_186745 )
      ( MAKE-3PILE ?auto_186739 ?auto_186740 ?auto_186741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186747 - BLOCK
      ?auto_186748 - BLOCK
      ?auto_186749 - BLOCK
    )
    :vars
    (
      ?auto_186751 - BLOCK
      ?auto_186753 - BLOCK
      ?auto_186754 - BLOCK
      ?auto_186750 - BLOCK
      ?auto_186752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186751 ?auto_186749 ) ( ON-TABLE ?auto_186747 ) ( ON ?auto_186748 ?auto_186747 ) ( ON ?auto_186749 ?auto_186748 ) ( not ( = ?auto_186747 ?auto_186748 ) ) ( not ( = ?auto_186747 ?auto_186749 ) ) ( not ( = ?auto_186747 ?auto_186751 ) ) ( not ( = ?auto_186748 ?auto_186749 ) ) ( not ( = ?auto_186748 ?auto_186751 ) ) ( not ( = ?auto_186749 ?auto_186751 ) ) ( not ( = ?auto_186747 ?auto_186753 ) ) ( not ( = ?auto_186747 ?auto_186754 ) ) ( not ( = ?auto_186748 ?auto_186753 ) ) ( not ( = ?auto_186748 ?auto_186754 ) ) ( not ( = ?auto_186749 ?auto_186753 ) ) ( not ( = ?auto_186749 ?auto_186754 ) ) ( not ( = ?auto_186751 ?auto_186753 ) ) ( not ( = ?auto_186751 ?auto_186754 ) ) ( not ( = ?auto_186753 ?auto_186754 ) ) ( ON ?auto_186753 ?auto_186751 ) ( ON-TABLE ?auto_186750 ) ( not ( = ?auto_186750 ?auto_186752 ) ) ( not ( = ?auto_186750 ?auto_186754 ) ) ( not ( = ?auto_186752 ?auto_186754 ) ) ( not ( = ?auto_186747 ?auto_186752 ) ) ( not ( = ?auto_186747 ?auto_186750 ) ) ( not ( = ?auto_186748 ?auto_186752 ) ) ( not ( = ?auto_186748 ?auto_186750 ) ) ( not ( = ?auto_186749 ?auto_186752 ) ) ( not ( = ?auto_186749 ?auto_186750 ) ) ( not ( = ?auto_186751 ?auto_186752 ) ) ( not ( = ?auto_186751 ?auto_186750 ) ) ( not ( = ?auto_186753 ?auto_186752 ) ) ( not ( = ?auto_186753 ?auto_186750 ) ) ( ON ?auto_186754 ?auto_186753 ) ( CLEAR ?auto_186754 ) ( HOLDING ?auto_186752 ) ( CLEAR ?auto_186750 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186750 ?auto_186752 )
      ( MAKE-3PILE ?auto_186747 ?auto_186748 ?auto_186749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186755 - BLOCK
      ?auto_186756 - BLOCK
      ?auto_186757 - BLOCK
    )
    :vars
    (
      ?auto_186760 - BLOCK
      ?auto_186761 - BLOCK
      ?auto_186758 - BLOCK
      ?auto_186762 - BLOCK
      ?auto_186759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186760 ?auto_186757 ) ( ON-TABLE ?auto_186755 ) ( ON ?auto_186756 ?auto_186755 ) ( ON ?auto_186757 ?auto_186756 ) ( not ( = ?auto_186755 ?auto_186756 ) ) ( not ( = ?auto_186755 ?auto_186757 ) ) ( not ( = ?auto_186755 ?auto_186760 ) ) ( not ( = ?auto_186756 ?auto_186757 ) ) ( not ( = ?auto_186756 ?auto_186760 ) ) ( not ( = ?auto_186757 ?auto_186760 ) ) ( not ( = ?auto_186755 ?auto_186761 ) ) ( not ( = ?auto_186755 ?auto_186758 ) ) ( not ( = ?auto_186756 ?auto_186761 ) ) ( not ( = ?auto_186756 ?auto_186758 ) ) ( not ( = ?auto_186757 ?auto_186761 ) ) ( not ( = ?auto_186757 ?auto_186758 ) ) ( not ( = ?auto_186760 ?auto_186761 ) ) ( not ( = ?auto_186760 ?auto_186758 ) ) ( not ( = ?auto_186761 ?auto_186758 ) ) ( ON ?auto_186761 ?auto_186760 ) ( ON-TABLE ?auto_186762 ) ( not ( = ?auto_186762 ?auto_186759 ) ) ( not ( = ?auto_186762 ?auto_186758 ) ) ( not ( = ?auto_186759 ?auto_186758 ) ) ( not ( = ?auto_186755 ?auto_186759 ) ) ( not ( = ?auto_186755 ?auto_186762 ) ) ( not ( = ?auto_186756 ?auto_186759 ) ) ( not ( = ?auto_186756 ?auto_186762 ) ) ( not ( = ?auto_186757 ?auto_186759 ) ) ( not ( = ?auto_186757 ?auto_186762 ) ) ( not ( = ?auto_186760 ?auto_186759 ) ) ( not ( = ?auto_186760 ?auto_186762 ) ) ( not ( = ?auto_186761 ?auto_186759 ) ) ( not ( = ?auto_186761 ?auto_186762 ) ) ( ON ?auto_186758 ?auto_186761 ) ( CLEAR ?auto_186762 ) ( ON ?auto_186759 ?auto_186758 ) ( CLEAR ?auto_186759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186755 ?auto_186756 ?auto_186757 ?auto_186760 ?auto_186761 ?auto_186758 )
      ( MAKE-3PILE ?auto_186755 ?auto_186756 ?auto_186757 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186763 - BLOCK
      ?auto_186764 - BLOCK
      ?auto_186765 - BLOCK
    )
    :vars
    (
      ?auto_186768 - BLOCK
      ?auto_186766 - BLOCK
      ?auto_186769 - BLOCK
      ?auto_186767 - BLOCK
      ?auto_186770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186768 ?auto_186765 ) ( ON-TABLE ?auto_186763 ) ( ON ?auto_186764 ?auto_186763 ) ( ON ?auto_186765 ?auto_186764 ) ( not ( = ?auto_186763 ?auto_186764 ) ) ( not ( = ?auto_186763 ?auto_186765 ) ) ( not ( = ?auto_186763 ?auto_186768 ) ) ( not ( = ?auto_186764 ?auto_186765 ) ) ( not ( = ?auto_186764 ?auto_186768 ) ) ( not ( = ?auto_186765 ?auto_186768 ) ) ( not ( = ?auto_186763 ?auto_186766 ) ) ( not ( = ?auto_186763 ?auto_186769 ) ) ( not ( = ?auto_186764 ?auto_186766 ) ) ( not ( = ?auto_186764 ?auto_186769 ) ) ( not ( = ?auto_186765 ?auto_186766 ) ) ( not ( = ?auto_186765 ?auto_186769 ) ) ( not ( = ?auto_186768 ?auto_186766 ) ) ( not ( = ?auto_186768 ?auto_186769 ) ) ( not ( = ?auto_186766 ?auto_186769 ) ) ( ON ?auto_186766 ?auto_186768 ) ( not ( = ?auto_186767 ?auto_186770 ) ) ( not ( = ?auto_186767 ?auto_186769 ) ) ( not ( = ?auto_186770 ?auto_186769 ) ) ( not ( = ?auto_186763 ?auto_186770 ) ) ( not ( = ?auto_186763 ?auto_186767 ) ) ( not ( = ?auto_186764 ?auto_186770 ) ) ( not ( = ?auto_186764 ?auto_186767 ) ) ( not ( = ?auto_186765 ?auto_186770 ) ) ( not ( = ?auto_186765 ?auto_186767 ) ) ( not ( = ?auto_186768 ?auto_186770 ) ) ( not ( = ?auto_186768 ?auto_186767 ) ) ( not ( = ?auto_186766 ?auto_186770 ) ) ( not ( = ?auto_186766 ?auto_186767 ) ) ( ON ?auto_186769 ?auto_186766 ) ( ON ?auto_186770 ?auto_186769 ) ( CLEAR ?auto_186770 ) ( HOLDING ?auto_186767 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186767 )
      ( MAKE-3PILE ?auto_186763 ?auto_186764 ?auto_186765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186782 - BLOCK
      ?auto_186783 - BLOCK
      ?auto_186784 - BLOCK
    )
    :vars
    (
      ?auto_186787 - BLOCK
      ?auto_186786 - BLOCK
      ?auto_186789 - BLOCK
      ?auto_186785 - BLOCK
      ?auto_186788 - BLOCK
      ?auto_186790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186787 ?auto_186784 ) ( ON-TABLE ?auto_186782 ) ( ON ?auto_186783 ?auto_186782 ) ( ON ?auto_186784 ?auto_186783 ) ( not ( = ?auto_186782 ?auto_186783 ) ) ( not ( = ?auto_186782 ?auto_186784 ) ) ( not ( = ?auto_186782 ?auto_186787 ) ) ( not ( = ?auto_186783 ?auto_186784 ) ) ( not ( = ?auto_186783 ?auto_186787 ) ) ( not ( = ?auto_186784 ?auto_186787 ) ) ( not ( = ?auto_186782 ?auto_186786 ) ) ( not ( = ?auto_186782 ?auto_186789 ) ) ( not ( = ?auto_186783 ?auto_186786 ) ) ( not ( = ?auto_186783 ?auto_186789 ) ) ( not ( = ?auto_186784 ?auto_186786 ) ) ( not ( = ?auto_186784 ?auto_186789 ) ) ( not ( = ?auto_186787 ?auto_186786 ) ) ( not ( = ?auto_186787 ?auto_186789 ) ) ( not ( = ?auto_186786 ?auto_186789 ) ) ( ON ?auto_186786 ?auto_186787 ) ( not ( = ?auto_186785 ?auto_186788 ) ) ( not ( = ?auto_186785 ?auto_186789 ) ) ( not ( = ?auto_186788 ?auto_186789 ) ) ( not ( = ?auto_186782 ?auto_186788 ) ) ( not ( = ?auto_186782 ?auto_186785 ) ) ( not ( = ?auto_186783 ?auto_186788 ) ) ( not ( = ?auto_186783 ?auto_186785 ) ) ( not ( = ?auto_186784 ?auto_186788 ) ) ( not ( = ?auto_186784 ?auto_186785 ) ) ( not ( = ?auto_186787 ?auto_186788 ) ) ( not ( = ?auto_186787 ?auto_186785 ) ) ( not ( = ?auto_186786 ?auto_186788 ) ) ( not ( = ?auto_186786 ?auto_186785 ) ) ( ON ?auto_186789 ?auto_186786 ) ( ON ?auto_186788 ?auto_186789 ) ( CLEAR ?auto_186788 ) ( ON ?auto_186785 ?auto_186790 ) ( CLEAR ?auto_186785 ) ( HAND-EMPTY ) ( not ( = ?auto_186782 ?auto_186790 ) ) ( not ( = ?auto_186783 ?auto_186790 ) ) ( not ( = ?auto_186784 ?auto_186790 ) ) ( not ( = ?auto_186787 ?auto_186790 ) ) ( not ( = ?auto_186786 ?auto_186790 ) ) ( not ( = ?auto_186789 ?auto_186790 ) ) ( not ( = ?auto_186785 ?auto_186790 ) ) ( not ( = ?auto_186788 ?auto_186790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186785 ?auto_186790 )
      ( MAKE-3PILE ?auto_186782 ?auto_186783 ?auto_186784 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186791 - BLOCK
      ?auto_186792 - BLOCK
      ?auto_186793 - BLOCK
    )
    :vars
    (
      ?auto_186799 - BLOCK
      ?auto_186797 - BLOCK
      ?auto_186798 - BLOCK
      ?auto_186794 - BLOCK
      ?auto_186795 - BLOCK
      ?auto_186796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186799 ?auto_186793 ) ( ON-TABLE ?auto_186791 ) ( ON ?auto_186792 ?auto_186791 ) ( ON ?auto_186793 ?auto_186792 ) ( not ( = ?auto_186791 ?auto_186792 ) ) ( not ( = ?auto_186791 ?auto_186793 ) ) ( not ( = ?auto_186791 ?auto_186799 ) ) ( not ( = ?auto_186792 ?auto_186793 ) ) ( not ( = ?auto_186792 ?auto_186799 ) ) ( not ( = ?auto_186793 ?auto_186799 ) ) ( not ( = ?auto_186791 ?auto_186797 ) ) ( not ( = ?auto_186791 ?auto_186798 ) ) ( not ( = ?auto_186792 ?auto_186797 ) ) ( not ( = ?auto_186792 ?auto_186798 ) ) ( not ( = ?auto_186793 ?auto_186797 ) ) ( not ( = ?auto_186793 ?auto_186798 ) ) ( not ( = ?auto_186799 ?auto_186797 ) ) ( not ( = ?auto_186799 ?auto_186798 ) ) ( not ( = ?auto_186797 ?auto_186798 ) ) ( ON ?auto_186797 ?auto_186799 ) ( not ( = ?auto_186794 ?auto_186795 ) ) ( not ( = ?auto_186794 ?auto_186798 ) ) ( not ( = ?auto_186795 ?auto_186798 ) ) ( not ( = ?auto_186791 ?auto_186795 ) ) ( not ( = ?auto_186791 ?auto_186794 ) ) ( not ( = ?auto_186792 ?auto_186795 ) ) ( not ( = ?auto_186792 ?auto_186794 ) ) ( not ( = ?auto_186793 ?auto_186795 ) ) ( not ( = ?auto_186793 ?auto_186794 ) ) ( not ( = ?auto_186799 ?auto_186795 ) ) ( not ( = ?auto_186799 ?auto_186794 ) ) ( not ( = ?auto_186797 ?auto_186795 ) ) ( not ( = ?auto_186797 ?auto_186794 ) ) ( ON ?auto_186798 ?auto_186797 ) ( ON ?auto_186794 ?auto_186796 ) ( CLEAR ?auto_186794 ) ( not ( = ?auto_186791 ?auto_186796 ) ) ( not ( = ?auto_186792 ?auto_186796 ) ) ( not ( = ?auto_186793 ?auto_186796 ) ) ( not ( = ?auto_186799 ?auto_186796 ) ) ( not ( = ?auto_186797 ?auto_186796 ) ) ( not ( = ?auto_186798 ?auto_186796 ) ) ( not ( = ?auto_186794 ?auto_186796 ) ) ( not ( = ?auto_186795 ?auto_186796 ) ) ( HOLDING ?auto_186795 ) ( CLEAR ?auto_186798 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186791 ?auto_186792 ?auto_186793 ?auto_186799 ?auto_186797 ?auto_186798 ?auto_186795 )
      ( MAKE-3PILE ?auto_186791 ?auto_186792 ?auto_186793 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186800 - BLOCK
      ?auto_186801 - BLOCK
      ?auto_186802 - BLOCK
    )
    :vars
    (
      ?auto_186803 - BLOCK
      ?auto_186807 - BLOCK
      ?auto_186804 - BLOCK
      ?auto_186806 - BLOCK
      ?auto_186808 - BLOCK
      ?auto_186805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186803 ?auto_186802 ) ( ON-TABLE ?auto_186800 ) ( ON ?auto_186801 ?auto_186800 ) ( ON ?auto_186802 ?auto_186801 ) ( not ( = ?auto_186800 ?auto_186801 ) ) ( not ( = ?auto_186800 ?auto_186802 ) ) ( not ( = ?auto_186800 ?auto_186803 ) ) ( not ( = ?auto_186801 ?auto_186802 ) ) ( not ( = ?auto_186801 ?auto_186803 ) ) ( not ( = ?auto_186802 ?auto_186803 ) ) ( not ( = ?auto_186800 ?auto_186807 ) ) ( not ( = ?auto_186800 ?auto_186804 ) ) ( not ( = ?auto_186801 ?auto_186807 ) ) ( not ( = ?auto_186801 ?auto_186804 ) ) ( not ( = ?auto_186802 ?auto_186807 ) ) ( not ( = ?auto_186802 ?auto_186804 ) ) ( not ( = ?auto_186803 ?auto_186807 ) ) ( not ( = ?auto_186803 ?auto_186804 ) ) ( not ( = ?auto_186807 ?auto_186804 ) ) ( ON ?auto_186807 ?auto_186803 ) ( not ( = ?auto_186806 ?auto_186808 ) ) ( not ( = ?auto_186806 ?auto_186804 ) ) ( not ( = ?auto_186808 ?auto_186804 ) ) ( not ( = ?auto_186800 ?auto_186808 ) ) ( not ( = ?auto_186800 ?auto_186806 ) ) ( not ( = ?auto_186801 ?auto_186808 ) ) ( not ( = ?auto_186801 ?auto_186806 ) ) ( not ( = ?auto_186802 ?auto_186808 ) ) ( not ( = ?auto_186802 ?auto_186806 ) ) ( not ( = ?auto_186803 ?auto_186808 ) ) ( not ( = ?auto_186803 ?auto_186806 ) ) ( not ( = ?auto_186807 ?auto_186808 ) ) ( not ( = ?auto_186807 ?auto_186806 ) ) ( ON ?auto_186804 ?auto_186807 ) ( ON ?auto_186806 ?auto_186805 ) ( not ( = ?auto_186800 ?auto_186805 ) ) ( not ( = ?auto_186801 ?auto_186805 ) ) ( not ( = ?auto_186802 ?auto_186805 ) ) ( not ( = ?auto_186803 ?auto_186805 ) ) ( not ( = ?auto_186807 ?auto_186805 ) ) ( not ( = ?auto_186804 ?auto_186805 ) ) ( not ( = ?auto_186806 ?auto_186805 ) ) ( not ( = ?auto_186808 ?auto_186805 ) ) ( CLEAR ?auto_186804 ) ( ON ?auto_186808 ?auto_186806 ) ( CLEAR ?auto_186808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186805 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186805 ?auto_186806 )
      ( MAKE-3PILE ?auto_186800 ?auto_186801 ?auto_186802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_186809 - BLOCK
      ?auto_186810 - BLOCK
      ?auto_186811 - BLOCK
    )
    :vars
    (
      ?auto_186816 - BLOCK
      ?auto_186812 - BLOCK
      ?auto_186817 - BLOCK
      ?auto_186813 - BLOCK
      ?auto_186815 - BLOCK
      ?auto_186814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_186816 ?auto_186811 ) ( ON-TABLE ?auto_186809 ) ( ON ?auto_186810 ?auto_186809 ) ( ON ?auto_186811 ?auto_186810 ) ( not ( = ?auto_186809 ?auto_186810 ) ) ( not ( = ?auto_186809 ?auto_186811 ) ) ( not ( = ?auto_186809 ?auto_186816 ) ) ( not ( = ?auto_186810 ?auto_186811 ) ) ( not ( = ?auto_186810 ?auto_186816 ) ) ( not ( = ?auto_186811 ?auto_186816 ) ) ( not ( = ?auto_186809 ?auto_186812 ) ) ( not ( = ?auto_186809 ?auto_186817 ) ) ( not ( = ?auto_186810 ?auto_186812 ) ) ( not ( = ?auto_186810 ?auto_186817 ) ) ( not ( = ?auto_186811 ?auto_186812 ) ) ( not ( = ?auto_186811 ?auto_186817 ) ) ( not ( = ?auto_186816 ?auto_186812 ) ) ( not ( = ?auto_186816 ?auto_186817 ) ) ( not ( = ?auto_186812 ?auto_186817 ) ) ( ON ?auto_186812 ?auto_186816 ) ( not ( = ?auto_186813 ?auto_186815 ) ) ( not ( = ?auto_186813 ?auto_186817 ) ) ( not ( = ?auto_186815 ?auto_186817 ) ) ( not ( = ?auto_186809 ?auto_186815 ) ) ( not ( = ?auto_186809 ?auto_186813 ) ) ( not ( = ?auto_186810 ?auto_186815 ) ) ( not ( = ?auto_186810 ?auto_186813 ) ) ( not ( = ?auto_186811 ?auto_186815 ) ) ( not ( = ?auto_186811 ?auto_186813 ) ) ( not ( = ?auto_186816 ?auto_186815 ) ) ( not ( = ?auto_186816 ?auto_186813 ) ) ( not ( = ?auto_186812 ?auto_186815 ) ) ( not ( = ?auto_186812 ?auto_186813 ) ) ( ON ?auto_186813 ?auto_186814 ) ( not ( = ?auto_186809 ?auto_186814 ) ) ( not ( = ?auto_186810 ?auto_186814 ) ) ( not ( = ?auto_186811 ?auto_186814 ) ) ( not ( = ?auto_186816 ?auto_186814 ) ) ( not ( = ?auto_186812 ?auto_186814 ) ) ( not ( = ?auto_186817 ?auto_186814 ) ) ( not ( = ?auto_186813 ?auto_186814 ) ) ( not ( = ?auto_186815 ?auto_186814 ) ) ( ON ?auto_186815 ?auto_186813 ) ( CLEAR ?auto_186815 ) ( ON-TABLE ?auto_186814 ) ( HOLDING ?auto_186817 ) ( CLEAR ?auto_186812 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186809 ?auto_186810 ?auto_186811 ?auto_186816 ?auto_186812 ?auto_186817 )
      ( MAKE-3PILE ?auto_186809 ?auto_186810 ?auto_186811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186876 - BLOCK
      ?auto_186877 - BLOCK
      ?auto_186878 - BLOCK
      ?auto_186879 - BLOCK
      ?auto_186880 - BLOCK
    )
    :vars
    (
      ?auto_186881 - BLOCK
      ?auto_186882 - BLOCK
      ?auto_186883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186876 ) ( ON ?auto_186877 ?auto_186876 ) ( ON ?auto_186878 ?auto_186877 ) ( not ( = ?auto_186876 ?auto_186877 ) ) ( not ( = ?auto_186876 ?auto_186878 ) ) ( not ( = ?auto_186876 ?auto_186879 ) ) ( not ( = ?auto_186876 ?auto_186880 ) ) ( not ( = ?auto_186877 ?auto_186878 ) ) ( not ( = ?auto_186877 ?auto_186879 ) ) ( not ( = ?auto_186877 ?auto_186880 ) ) ( not ( = ?auto_186878 ?auto_186879 ) ) ( not ( = ?auto_186878 ?auto_186880 ) ) ( not ( = ?auto_186879 ?auto_186880 ) ) ( ON ?auto_186880 ?auto_186881 ) ( not ( = ?auto_186876 ?auto_186881 ) ) ( not ( = ?auto_186877 ?auto_186881 ) ) ( not ( = ?auto_186878 ?auto_186881 ) ) ( not ( = ?auto_186879 ?auto_186881 ) ) ( not ( = ?auto_186880 ?auto_186881 ) ) ( CLEAR ?auto_186878 ) ( ON ?auto_186879 ?auto_186880 ) ( CLEAR ?auto_186879 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186882 ) ( ON ?auto_186883 ?auto_186882 ) ( ON ?auto_186881 ?auto_186883 ) ( not ( = ?auto_186882 ?auto_186883 ) ) ( not ( = ?auto_186882 ?auto_186881 ) ) ( not ( = ?auto_186882 ?auto_186880 ) ) ( not ( = ?auto_186882 ?auto_186879 ) ) ( not ( = ?auto_186883 ?auto_186881 ) ) ( not ( = ?auto_186883 ?auto_186880 ) ) ( not ( = ?auto_186883 ?auto_186879 ) ) ( not ( = ?auto_186876 ?auto_186882 ) ) ( not ( = ?auto_186876 ?auto_186883 ) ) ( not ( = ?auto_186877 ?auto_186882 ) ) ( not ( = ?auto_186877 ?auto_186883 ) ) ( not ( = ?auto_186878 ?auto_186882 ) ) ( not ( = ?auto_186878 ?auto_186883 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186882 ?auto_186883 ?auto_186881 ?auto_186880 )
      ( MAKE-5PILE ?auto_186876 ?auto_186877 ?auto_186878 ?auto_186879 ?auto_186880 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186884 - BLOCK
      ?auto_186885 - BLOCK
      ?auto_186886 - BLOCK
      ?auto_186887 - BLOCK
      ?auto_186888 - BLOCK
    )
    :vars
    (
      ?auto_186891 - BLOCK
      ?auto_186889 - BLOCK
      ?auto_186890 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186884 ) ( ON ?auto_186885 ?auto_186884 ) ( not ( = ?auto_186884 ?auto_186885 ) ) ( not ( = ?auto_186884 ?auto_186886 ) ) ( not ( = ?auto_186884 ?auto_186887 ) ) ( not ( = ?auto_186884 ?auto_186888 ) ) ( not ( = ?auto_186885 ?auto_186886 ) ) ( not ( = ?auto_186885 ?auto_186887 ) ) ( not ( = ?auto_186885 ?auto_186888 ) ) ( not ( = ?auto_186886 ?auto_186887 ) ) ( not ( = ?auto_186886 ?auto_186888 ) ) ( not ( = ?auto_186887 ?auto_186888 ) ) ( ON ?auto_186888 ?auto_186891 ) ( not ( = ?auto_186884 ?auto_186891 ) ) ( not ( = ?auto_186885 ?auto_186891 ) ) ( not ( = ?auto_186886 ?auto_186891 ) ) ( not ( = ?auto_186887 ?auto_186891 ) ) ( not ( = ?auto_186888 ?auto_186891 ) ) ( ON ?auto_186887 ?auto_186888 ) ( CLEAR ?auto_186887 ) ( ON-TABLE ?auto_186889 ) ( ON ?auto_186890 ?auto_186889 ) ( ON ?auto_186891 ?auto_186890 ) ( not ( = ?auto_186889 ?auto_186890 ) ) ( not ( = ?auto_186889 ?auto_186891 ) ) ( not ( = ?auto_186889 ?auto_186888 ) ) ( not ( = ?auto_186889 ?auto_186887 ) ) ( not ( = ?auto_186890 ?auto_186891 ) ) ( not ( = ?auto_186890 ?auto_186888 ) ) ( not ( = ?auto_186890 ?auto_186887 ) ) ( not ( = ?auto_186884 ?auto_186889 ) ) ( not ( = ?auto_186884 ?auto_186890 ) ) ( not ( = ?auto_186885 ?auto_186889 ) ) ( not ( = ?auto_186885 ?auto_186890 ) ) ( not ( = ?auto_186886 ?auto_186889 ) ) ( not ( = ?auto_186886 ?auto_186890 ) ) ( HOLDING ?auto_186886 ) ( CLEAR ?auto_186885 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186884 ?auto_186885 ?auto_186886 )
      ( MAKE-5PILE ?auto_186884 ?auto_186885 ?auto_186886 ?auto_186887 ?auto_186888 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186892 - BLOCK
      ?auto_186893 - BLOCK
      ?auto_186894 - BLOCK
      ?auto_186895 - BLOCK
      ?auto_186896 - BLOCK
    )
    :vars
    (
      ?auto_186897 - BLOCK
      ?auto_186898 - BLOCK
      ?auto_186899 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186892 ) ( ON ?auto_186893 ?auto_186892 ) ( not ( = ?auto_186892 ?auto_186893 ) ) ( not ( = ?auto_186892 ?auto_186894 ) ) ( not ( = ?auto_186892 ?auto_186895 ) ) ( not ( = ?auto_186892 ?auto_186896 ) ) ( not ( = ?auto_186893 ?auto_186894 ) ) ( not ( = ?auto_186893 ?auto_186895 ) ) ( not ( = ?auto_186893 ?auto_186896 ) ) ( not ( = ?auto_186894 ?auto_186895 ) ) ( not ( = ?auto_186894 ?auto_186896 ) ) ( not ( = ?auto_186895 ?auto_186896 ) ) ( ON ?auto_186896 ?auto_186897 ) ( not ( = ?auto_186892 ?auto_186897 ) ) ( not ( = ?auto_186893 ?auto_186897 ) ) ( not ( = ?auto_186894 ?auto_186897 ) ) ( not ( = ?auto_186895 ?auto_186897 ) ) ( not ( = ?auto_186896 ?auto_186897 ) ) ( ON ?auto_186895 ?auto_186896 ) ( ON-TABLE ?auto_186898 ) ( ON ?auto_186899 ?auto_186898 ) ( ON ?auto_186897 ?auto_186899 ) ( not ( = ?auto_186898 ?auto_186899 ) ) ( not ( = ?auto_186898 ?auto_186897 ) ) ( not ( = ?auto_186898 ?auto_186896 ) ) ( not ( = ?auto_186898 ?auto_186895 ) ) ( not ( = ?auto_186899 ?auto_186897 ) ) ( not ( = ?auto_186899 ?auto_186896 ) ) ( not ( = ?auto_186899 ?auto_186895 ) ) ( not ( = ?auto_186892 ?auto_186898 ) ) ( not ( = ?auto_186892 ?auto_186899 ) ) ( not ( = ?auto_186893 ?auto_186898 ) ) ( not ( = ?auto_186893 ?auto_186899 ) ) ( not ( = ?auto_186894 ?auto_186898 ) ) ( not ( = ?auto_186894 ?auto_186899 ) ) ( CLEAR ?auto_186893 ) ( ON ?auto_186894 ?auto_186895 ) ( CLEAR ?auto_186894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186898 ?auto_186899 ?auto_186897 ?auto_186896 ?auto_186895 )
      ( MAKE-5PILE ?auto_186892 ?auto_186893 ?auto_186894 ?auto_186895 ?auto_186896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186900 - BLOCK
      ?auto_186901 - BLOCK
      ?auto_186902 - BLOCK
      ?auto_186903 - BLOCK
      ?auto_186904 - BLOCK
    )
    :vars
    (
      ?auto_186907 - BLOCK
      ?auto_186905 - BLOCK
      ?auto_186906 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186900 ) ( not ( = ?auto_186900 ?auto_186901 ) ) ( not ( = ?auto_186900 ?auto_186902 ) ) ( not ( = ?auto_186900 ?auto_186903 ) ) ( not ( = ?auto_186900 ?auto_186904 ) ) ( not ( = ?auto_186901 ?auto_186902 ) ) ( not ( = ?auto_186901 ?auto_186903 ) ) ( not ( = ?auto_186901 ?auto_186904 ) ) ( not ( = ?auto_186902 ?auto_186903 ) ) ( not ( = ?auto_186902 ?auto_186904 ) ) ( not ( = ?auto_186903 ?auto_186904 ) ) ( ON ?auto_186904 ?auto_186907 ) ( not ( = ?auto_186900 ?auto_186907 ) ) ( not ( = ?auto_186901 ?auto_186907 ) ) ( not ( = ?auto_186902 ?auto_186907 ) ) ( not ( = ?auto_186903 ?auto_186907 ) ) ( not ( = ?auto_186904 ?auto_186907 ) ) ( ON ?auto_186903 ?auto_186904 ) ( ON-TABLE ?auto_186905 ) ( ON ?auto_186906 ?auto_186905 ) ( ON ?auto_186907 ?auto_186906 ) ( not ( = ?auto_186905 ?auto_186906 ) ) ( not ( = ?auto_186905 ?auto_186907 ) ) ( not ( = ?auto_186905 ?auto_186904 ) ) ( not ( = ?auto_186905 ?auto_186903 ) ) ( not ( = ?auto_186906 ?auto_186907 ) ) ( not ( = ?auto_186906 ?auto_186904 ) ) ( not ( = ?auto_186906 ?auto_186903 ) ) ( not ( = ?auto_186900 ?auto_186905 ) ) ( not ( = ?auto_186900 ?auto_186906 ) ) ( not ( = ?auto_186901 ?auto_186905 ) ) ( not ( = ?auto_186901 ?auto_186906 ) ) ( not ( = ?auto_186902 ?auto_186905 ) ) ( not ( = ?auto_186902 ?auto_186906 ) ) ( ON ?auto_186902 ?auto_186903 ) ( CLEAR ?auto_186902 ) ( HOLDING ?auto_186901 ) ( CLEAR ?auto_186900 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186900 ?auto_186901 )
      ( MAKE-5PILE ?auto_186900 ?auto_186901 ?auto_186902 ?auto_186903 ?auto_186904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186908 - BLOCK
      ?auto_186909 - BLOCK
      ?auto_186910 - BLOCK
      ?auto_186911 - BLOCK
      ?auto_186912 - BLOCK
    )
    :vars
    (
      ?auto_186913 - BLOCK
      ?auto_186914 - BLOCK
      ?auto_186915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_186908 ) ( not ( = ?auto_186908 ?auto_186909 ) ) ( not ( = ?auto_186908 ?auto_186910 ) ) ( not ( = ?auto_186908 ?auto_186911 ) ) ( not ( = ?auto_186908 ?auto_186912 ) ) ( not ( = ?auto_186909 ?auto_186910 ) ) ( not ( = ?auto_186909 ?auto_186911 ) ) ( not ( = ?auto_186909 ?auto_186912 ) ) ( not ( = ?auto_186910 ?auto_186911 ) ) ( not ( = ?auto_186910 ?auto_186912 ) ) ( not ( = ?auto_186911 ?auto_186912 ) ) ( ON ?auto_186912 ?auto_186913 ) ( not ( = ?auto_186908 ?auto_186913 ) ) ( not ( = ?auto_186909 ?auto_186913 ) ) ( not ( = ?auto_186910 ?auto_186913 ) ) ( not ( = ?auto_186911 ?auto_186913 ) ) ( not ( = ?auto_186912 ?auto_186913 ) ) ( ON ?auto_186911 ?auto_186912 ) ( ON-TABLE ?auto_186914 ) ( ON ?auto_186915 ?auto_186914 ) ( ON ?auto_186913 ?auto_186915 ) ( not ( = ?auto_186914 ?auto_186915 ) ) ( not ( = ?auto_186914 ?auto_186913 ) ) ( not ( = ?auto_186914 ?auto_186912 ) ) ( not ( = ?auto_186914 ?auto_186911 ) ) ( not ( = ?auto_186915 ?auto_186913 ) ) ( not ( = ?auto_186915 ?auto_186912 ) ) ( not ( = ?auto_186915 ?auto_186911 ) ) ( not ( = ?auto_186908 ?auto_186914 ) ) ( not ( = ?auto_186908 ?auto_186915 ) ) ( not ( = ?auto_186909 ?auto_186914 ) ) ( not ( = ?auto_186909 ?auto_186915 ) ) ( not ( = ?auto_186910 ?auto_186914 ) ) ( not ( = ?auto_186910 ?auto_186915 ) ) ( ON ?auto_186910 ?auto_186911 ) ( CLEAR ?auto_186908 ) ( ON ?auto_186909 ?auto_186910 ) ( CLEAR ?auto_186909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186914 ?auto_186915 ?auto_186913 ?auto_186912 ?auto_186911 ?auto_186910 )
      ( MAKE-5PILE ?auto_186908 ?auto_186909 ?auto_186910 ?auto_186911 ?auto_186912 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186916 - BLOCK
      ?auto_186917 - BLOCK
      ?auto_186918 - BLOCK
      ?auto_186919 - BLOCK
      ?auto_186920 - BLOCK
    )
    :vars
    (
      ?auto_186922 - BLOCK
      ?auto_186921 - BLOCK
      ?auto_186923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186916 ?auto_186917 ) ) ( not ( = ?auto_186916 ?auto_186918 ) ) ( not ( = ?auto_186916 ?auto_186919 ) ) ( not ( = ?auto_186916 ?auto_186920 ) ) ( not ( = ?auto_186917 ?auto_186918 ) ) ( not ( = ?auto_186917 ?auto_186919 ) ) ( not ( = ?auto_186917 ?auto_186920 ) ) ( not ( = ?auto_186918 ?auto_186919 ) ) ( not ( = ?auto_186918 ?auto_186920 ) ) ( not ( = ?auto_186919 ?auto_186920 ) ) ( ON ?auto_186920 ?auto_186922 ) ( not ( = ?auto_186916 ?auto_186922 ) ) ( not ( = ?auto_186917 ?auto_186922 ) ) ( not ( = ?auto_186918 ?auto_186922 ) ) ( not ( = ?auto_186919 ?auto_186922 ) ) ( not ( = ?auto_186920 ?auto_186922 ) ) ( ON ?auto_186919 ?auto_186920 ) ( ON-TABLE ?auto_186921 ) ( ON ?auto_186923 ?auto_186921 ) ( ON ?auto_186922 ?auto_186923 ) ( not ( = ?auto_186921 ?auto_186923 ) ) ( not ( = ?auto_186921 ?auto_186922 ) ) ( not ( = ?auto_186921 ?auto_186920 ) ) ( not ( = ?auto_186921 ?auto_186919 ) ) ( not ( = ?auto_186923 ?auto_186922 ) ) ( not ( = ?auto_186923 ?auto_186920 ) ) ( not ( = ?auto_186923 ?auto_186919 ) ) ( not ( = ?auto_186916 ?auto_186921 ) ) ( not ( = ?auto_186916 ?auto_186923 ) ) ( not ( = ?auto_186917 ?auto_186921 ) ) ( not ( = ?auto_186917 ?auto_186923 ) ) ( not ( = ?auto_186918 ?auto_186921 ) ) ( not ( = ?auto_186918 ?auto_186923 ) ) ( ON ?auto_186918 ?auto_186919 ) ( ON ?auto_186917 ?auto_186918 ) ( CLEAR ?auto_186917 ) ( HOLDING ?auto_186916 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_186916 )
      ( MAKE-5PILE ?auto_186916 ?auto_186917 ?auto_186918 ?auto_186919 ?auto_186920 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186924 - BLOCK
      ?auto_186925 - BLOCK
      ?auto_186926 - BLOCK
      ?auto_186927 - BLOCK
      ?auto_186928 - BLOCK
    )
    :vars
    (
      ?auto_186930 - BLOCK
      ?auto_186929 - BLOCK
      ?auto_186931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186924 ?auto_186925 ) ) ( not ( = ?auto_186924 ?auto_186926 ) ) ( not ( = ?auto_186924 ?auto_186927 ) ) ( not ( = ?auto_186924 ?auto_186928 ) ) ( not ( = ?auto_186925 ?auto_186926 ) ) ( not ( = ?auto_186925 ?auto_186927 ) ) ( not ( = ?auto_186925 ?auto_186928 ) ) ( not ( = ?auto_186926 ?auto_186927 ) ) ( not ( = ?auto_186926 ?auto_186928 ) ) ( not ( = ?auto_186927 ?auto_186928 ) ) ( ON ?auto_186928 ?auto_186930 ) ( not ( = ?auto_186924 ?auto_186930 ) ) ( not ( = ?auto_186925 ?auto_186930 ) ) ( not ( = ?auto_186926 ?auto_186930 ) ) ( not ( = ?auto_186927 ?auto_186930 ) ) ( not ( = ?auto_186928 ?auto_186930 ) ) ( ON ?auto_186927 ?auto_186928 ) ( ON-TABLE ?auto_186929 ) ( ON ?auto_186931 ?auto_186929 ) ( ON ?auto_186930 ?auto_186931 ) ( not ( = ?auto_186929 ?auto_186931 ) ) ( not ( = ?auto_186929 ?auto_186930 ) ) ( not ( = ?auto_186929 ?auto_186928 ) ) ( not ( = ?auto_186929 ?auto_186927 ) ) ( not ( = ?auto_186931 ?auto_186930 ) ) ( not ( = ?auto_186931 ?auto_186928 ) ) ( not ( = ?auto_186931 ?auto_186927 ) ) ( not ( = ?auto_186924 ?auto_186929 ) ) ( not ( = ?auto_186924 ?auto_186931 ) ) ( not ( = ?auto_186925 ?auto_186929 ) ) ( not ( = ?auto_186925 ?auto_186931 ) ) ( not ( = ?auto_186926 ?auto_186929 ) ) ( not ( = ?auto_186926 ?auto_186931 ) ) ( ON ?auto_186926 ?auto_186927 ) ( ON ?auto_186925 ?auto_186926 ) ( ON ?auto_186924 ?auto_186925 ) ( CLEAR ?auto_186924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186929 ?auto_186931 ?auto_186930 ?auto_186928 ?auto_186927 ?auto_186926 ?auto_186925 )
      ( MAKE-5PILE ?auto_186924 ?auto_186925 ?auto_186926 ?auto_186927 ?auto_186928 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186937 - BLOCK
      ?auto_186938 - BLOCK
      ?auto_186939 - BLOCK
      ?auto_186940 - BLOCK
      ?auto_186941 - BLOCK
    )
    :vars
    (
      ?auto_186944 - BLOCK
      ?auto_186943 - BLOCK
      ?auto_186942 - BLOCK
      ?auto_186945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186937 ?auto_186938 ) ) ( not ( = ?auto_186937 ?auto_186939 ) ) ( not ( = ?auto_186937 ?auto_186940 ) ) ( not ( = ?auto_186937 ?auto_186941 ) ) ( not ( = ?auto_186938 ?auto_186939 ) ) ( not ( = ?auto_186938 ?auto_186940 ) ) ( not ( = ?auto_186938 ?auto_186941 ) ) ( not ( = ?auto_186939 ?auto_186940 ) ) ( not ( = ?auto_186939 ?auto_186941 ) ) ( not ( = ?auto_186940 ?auto_186941 ) ) ( ON ?auto_186941 ?auto_186944 ) ( not ( = ?auto_186937 ?auto_186944 ) ) ( not ( = ?auto_186938 ?auto_186944 ) ) ( not ( = ?auto_186939 ?auto_186944 ) ) ( not ( = ?auto_186940 ?auto_186944 ) ) ( not ( = ?auto_186941 ?auto_186944 ) ) ( ON ?auto_186940 ?auto_186941 ) ( ON-TABLE ?auto_186943 ) ( ON ?auto_186942 ?auto_186943 ) ( ON ?auto_186944 ?auto_186942 ) ( not ( = ?auto_186943 ?auto_186942 ) ) ( not ( = ?auto_186943 ?auto_186944 ) ) ( not ( = ?auto_186943 ?auto_186941 ) ) ( not ( = ?auto_186943 ?auto_186940 ) ) ( not ( = ?auto_186942 ?auto_186944 ) ) ( not ( = ?auto_186942 ?auto_186941 ) ) ( not ( = ?auto_186942 ?auto_186940 ) ) ( not ( = ?auto_186937 ?auto_186943 ) ) ( not ( = ?auto_186937 ?auto_186942 ) ) ( not ( = ?auto_186938 ?auto_186943 ) ) ( not ( = ?auto_186938 ?auto_186942 ) ) ( not ( = ?auto_186939 ?auto_186943 ) ) ( not ( = ?auto_186939 ?auto_186942 ) ) ( ON ?auto_186939 ?auto_186940 ) ( ON ?auto_186938 ?auto_186939 ) ( CLEAR ?auto_186938 ) ( ON ?auto_186937 ?auto_186945 ) ( CLEAR ?auto_186937 ) ( HAND-EMPTY ) ( not ( = ?auto_186937 ?auto_186945 ) ) ( not ( = ?auto_186938 ?auto_186945 ) ) ( not ( = ?auto_186939 ?auto_186945 ) ) ( not ( = ?auto_186940 ?auto_186945 ) ) ( not ( = ?auto_186941 ?auto_186945 ) ) ( not ( = ?auto_186944 ?auto_186945 ) ) ( not ( = ?auto_186943 ?auto_186945 ) ) ( not ( = ?auto_186942 ?auto_186945 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_186937 ?auto_186945 )
      ( MAKE-5PILE ?auto_186937 ?auto_186938 ?auto_186939 ?auto_186940 ?auto_186941 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186946 - BLOCK
      ?auto_186947 - BLOCK
      ?auto_186948 - BLOCK
      ?auto_186949 - BLOCK
      ?auto_186950 - BLOCK
    )
    :vars
    (
      ?auto_186952 - BLOCK
      ?auto_186951 - BLOCK
      ?auto_186953 - BLOCK
      ?auto_186954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186946 ?auto_186947 ) ) ( not ( = ?auto_186946 ?auto_186948 ) ) ( not ( = ?auto_186946 ?auto_186949 ) ) ( not ( = ?auto_186946 ?auto_186950 ) ) ( not ( = ?auto_186947 ?auto_186948 ) ) ( not ( = ?auto_186947 ?auto_186949 ) ) ( not ( = ?auto_186947 ?auto_186950 ) ) ( not ( = ?auto_186948 ?auto_186949 ) ) ( not ( = ?auto_186948 ?auto_186950 ) ) ( not ( = ?auto_186949 ?auto_186950 ) ) ( ON ?auto_186950 ?auto_186952 ) ( not ( = ?auto_186946 ?auto_186952 ) ) ( not ( = ?auto_186947 ?auto_186952 ) ) ( not ( = ?auto_186948 ?auto_186952 ) ) ( not ( = ?auto_186949 ?auto_186952 ) ) ( not ( = ?auto_186950 ?auto_186952 ) ) ( ON ?auto_186949 ?auto_186950 ) ( ON-TABLE ?auto_186951 ) ( ON ?auto_186953 ?auto_186951 ) ( ON ?auto_186952 ?auto_186953 ) ( not ( = ?auto_186951 ?auto_186953 ) ) ( not ( = ?auto_186951 ?auto_186952 ) ) ( not ( = ?auto_186951 ?auto_186950 ) ) ( not ( = ?auto_186951 ?auto_186949 ) ) ( not ( = ?auto_186953 ?auto_186952 ) ) ( not ( = ?auto_186953 ?auto_186950 ) ) ( not ( = ?auto_186953 ?auto_186949 ) ) ( not ( = ?auto_186946 ?auto_186951 ) ) ( not ( = ?auto_186946 ?auto_186953 ) ) ( not ( = ?auto_186947 ?auto_186951 ) ) ( not ( = ?auto_186947 ?auto_186953 ) ) ( not ( = ?auto_186948 ?auto_186951 ) ) ( not ( = ?auto_186948 ?auto_186953 ) ) ( ON ?auto_186948 ?auto_186949 ) ( ON ?auto_186946 ?auto_186954 ) ( CLEAR ?auto_186946 ) ( not ( = ?auto_186946 ?auto_186954 ) ) ( not ( = ?auto_186947 ?auto_186954 ) ) ( not ( = ?auto_186948 ?auto_186954 ) ) ( not ( = ?auto_186949 ?auto_186954 ) ) ( not ( = ?auto_186950 ?auto_186954 ) ) ( not ( = ?auto_186952 ?auto_186954 ) ) ( not ( = ?auto_186951 ?auto_186954 ) ) ( not ( = ?auto_186953 ?auto_186954 ) ) ( HOLDING ?auto_186947 ) ( CLEAR ?auto_186948 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_186951 ?auto_186953 ?auto_186952 ?auto_186950 ?auto_186949 ?auto_186948 ?auto_186947 )
      ( MAKE-5PILE ?auto_186946 ?auto_186947 ?auto_186948 ?auto_186949 ?auto_186950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186955 - BLOCK
      ?auto_186956 - BLOCK
      ?auto_186957 - BLOCK
      ?auto_186958 - BLOCK
      ?auto_186959 - BLOCK
    )
    :vars
    (
      ?auto_186962 - BLOCK
      ?auto_186961 - BLOCK
      ?auto_186960 - BLOCK
      ?auto_186963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186955 ?auto_186956 ) ) ( not ( = ?auto_186955 ?auto_186957 ) ) ( not ( = ?auto_186955 ?auto_186958 ) ) ( not ( = ?auto_186955 ?auto_186959 ) ) ( not ( = ?auto_186956 ?auto_186957 ) ) ( not ( = ?auto_186956 ?auto_186958 ) ) ( not ( = ?auto_186956 ?auto_186959 ) ) ( not ( = ?auto_186957 ?auto_186958 ) ) ( not ( = ?auto_186957 ?auto_186959 ) ) ( not ( = ?auto_186958 ?auto_186959 ) ) ( ON ?auto_186959 ?auto_186962 ) ( not ( = ?auto_186955 ?auto_186962 ) ) ( not ( = ?auto_186956 ?auto_186962 ) ) ( not ( = ?auto_186957 ?auto_186962 ) ) ( not ( = ?auto_186958 ?auto_186962 ) ) ( not ( = ?auto_186959 ?auto_186962 ) ) ( ON ?auto_186958 ?auto_186959 ) ( ON-TABLE ?auto_186961 ) ( ON ?auto_186960 ?auto_186961 ) ( ON ?auto_186962 ?auto_186960 ) ( not ( = ?auto_186961 ?auto_186960 ) ) ( not ( = ?auto_186961 ?auto_186962 ) ) ( not ( = ?auto_186961 ?auto_186959 ) ) ( not ( = ?auto_186961 ?auto_186958 ) ) ( not ( = ?auto_186960 ?auto_186962 ) ) ( not ( = ?auto_186960 ?auto_186959 ) ) ( not ( = ?auto_186960 ?auto_186958 ) ) ( not ( = ?auto_186955 ?auto_186961 ) ) ( not ( = ?auto_186955 ?auto_186960 ) ) ( not ( = ?auto_186956 ?auto_186961 ) ) ( not ( = ?auto_186956 ?auto_186960 ) ) ( not ( = ?auto_186957 ?auto_186961 ) ) ( not ( = ?auto_186957 ?auto_186960 ) ) ( ON ?auto_186957 ?auto_186958 ) ( ON ?auto_186955 ?auto_186963 ) ( not ( = ?auto_186955 ?auto_186963 ) ) ( not ( = ?auto_186956 ?auto_186963 ) ) ( not ( = ?auto_186957 ?auto_186963 ) ) ( not ( = ?auto_186958 ?auto_186963 ) ) ( not ( = ?auto_186959 ?auto_186963 ) ) ( not ( = ?auto_186962 ?auto_186963 ) ) ( not ( = ?auto_186961 ?auto_186963 ) ) ( not ( = ?auto_186960 ?auto_186963 ) ) ( CLEAR ?auto_186957 ) ( ON ?auto_186956 ?auto_186955 ) ( CLEAR ?auto_186956 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_186963 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_186963 ?auto_186955 )
      ( MAKE-5PILE ?auto_186955 ?auto_186956 ?auto_186957 ?auto_186958 ?auto_186959 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186964 - BLOCK
      ?auto_186965 - BLOCK
      ?auto_186966 - BLOCK
      ?auto_186967 - BLOCK
      ?auto_186968 - BLOCK
    )
    :vars
    (
      ?auto_186970 - BLOCK
      ?auto_186972 - BLOCK
      ?auto_186969 - BLOCK
      ?auto_186971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186964 ?auto_186965 ) ) ( not ( = ?auto_186964 ?auto_186966 ) ) ( not ( = ?auto_186964 ?auto_186967 ) ) ( not ( = ?auto_186964 ?auto_186968 ) ) ( not ( = ?auto_186965 ?auto_186966 ) ) ( not ( = ?auto_186965 ?auto_186967 ) ) ( not ( = ?auto_186965 ?auto_186968 ) ) ( not ( = ?auto_186966 ?auto_186967 ) ) ( not ( = ?auto_186966 ?auto_186968 ) ) ( not ( = ?auto_186967 ?auto_186968 ) ) ( ON ?auto_186968 ?auto_186970 ) ( not ( = ?auto_186964 ?auto_186970 ) ) ( not ( = ?auto_186965 ?auto_186970 ) ) ( not ( = ?auto_186966 ?auto_186970 ) ) ( not ( = ?auto_186967 ?auto_186970 ) ) ( not ( = ?auto_186968 ?auto_186970 ) ) ( ON ?auto_186967 ?auto_186968 ) ( ON-TABLE ?auto_186972 ) ( ON ?auto_186969 ?auto_186972 ) ( ON ?auto_186970 ?auto_186969 ) ( not ( = ?auto_186972 ?auto_186969 ) ) ( not ( = ?auto_186972 ?auto_186970 ) ) ( not ( = ?auto_186972 ?auto_186968 ) ) ( not ( = ?auto_186972 ?auto_186967 ) ) ( not ( = ?auto_186969 ?auto_186970 ) ) ( not ( = ?auto_186969 ?auto_186968 ) ) ( not ( = ?auto_186969 ?auto_186967 ) ) ( not ( = ?auto_186964 ?auto_186972 ) ) ( not ( = ?auto_186964 ?auto_186969 ) ) ( not ( = ?auto_186965 ?auto_186972 ) ) ( not ( = ?auto_186965 ?auto_186969 ) ) ( not ( = ?auto_186966 ?auto_186972 ) ) ( not ( = ?auto_186966 ?auto_186969 ) ) ( ON ?auto_186964 ?auto_186971 ) ( not ( = ?auto_186964 ?auto_186971 ) ) ( not ( = ?auto_186965 ?auto_186971 ) ) ( not ( = ?auto_186966 ?auto_186971 ) ) ( not ( = ?auto_186967 ?auto_186971 ) ) ( not ( = ?auto_186968 ?auto_186971 ) ) ( not ( = ?auto_186970 ?auto_186971 ) ) ( not ( = ?auto_186972 ?auto_186971 ) ) ( not ( = ?auto_186969 ?auto_186971 ) ) ( ON ?auto_186965 ?auto_186964 ) ( CLEAR ?auto_186965 ) ( ON-TABLE ?auto_186971 ) ( HOLDING ?auto_186966 ) ( CLEAR ?auto_186967 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_186972 ?auto_186969 ?auto_186970 ?auto_186968 ?auto_186967 ?auto_186966 )
      ( MAKE-5PILE ?auto_186964 ?auto_186965 ?auto_186966 ?auto_186967 ?auto_186968 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186973 - BLOCK
      ?auto_186974 - BLOCK
      ?auto_186975 - BLOCK
      ?auto_186976 - BLOCK
      ?auto_186977 - BLOCK
    )
    :vars
    (
      ?auto_186980 - BLOCK
      ?auto_186978 - BLOCK
      ?auto_186979 - BLOCK
      ?auto_186981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186973 ?auto_186974 ) ) ( not ( = ?auto_186973 ?auto_186975 ) ) ( not ( = ?auto_186973 ?auto_186976 ) ) ( not ( = ?auto_186973 ?auto_186977 ) ) ( not ( = ?auto_186974 ?auto_186975 ) ) ( not ( = ?auto_186974 ?auto_186976 ) ) ( not ( = ?auto_186974 ?auto_186977 ) ) ( not ( = ?auto_186975 ?auto_186976 ) ) ( not ( = ?auto_186975 ?auto_186977 ) ) ( not ( = ?auto_186976 ?auto_186977 ) ) ( ON ?auto_186977 ?auto_186980 ) ( not ( = ?auto_186973 ?auto_186980 ) ) ( not ( = ?auto_186974 ?auto_186980 ) ) ( not ( = ?auto_186975 ?auto_186980 ) ) ( not ( = ?auto_186976 ?auto_186980 ) ) ( not ( = ?auto_186977 ?auto_186980 ) ) ( ON ?auto_186976 ?auto_186977 ) ( ON-TABLE ?auto_186978 ) ( ON ?auto_186979 ?auto_186978 ) ( ON ?auto_186980 ?auto_186979 ) ( not ( = ?auto_186978 ?auto_186979 ) ) ( not ( = ?auto_186978 ?auto_186980 ) ) ( not ( = ?auto_186978 ?auto_186977 ) ) ( not ( = ?auto_186978 ?auto_186976 ) ) ( not ( = ?auto_186979 ?auto_186980 ) ) ( not ( = ?auto_186979 ?auto_186977 ) ) ( not ( = ?auto_186979 ?auto_186976 ) ) ( not ( = ?auto_186973 ?auto_186978 ) ) ( not ( = ?auto_186973 ?auto_186979 ) ) ( not ( = ?auto_186974 ?auto_186978 ) ) ( not ( = ?auto_186974 ?auto_186979 ) ) ( not ( = ?auto_186975 ?auto_186978 ) ) ( not ( = ?auto_186975 ?auto_186979 ) ) ( ON ?auto_186973 ?auto_186981 ) ( not ( = ?auto_186973 ?auto_186981 ) ) ( not ( = ?auto_186974 ?auto_186981 ) ) ( not ( = ?auto_186975 ?auto_186981 ) ) ( not ( = ?auto_186976 ?auto_186981 ) ) ( not ( = ?auto_186977 ?auto_186981 ) ) ( not ( = ?auto_186980 ?auto_186981 ) ) ( not ( = ?auto_186978 ?auto_186981 ) ) ( not ( = ?auto_186979 ?auto_186981 ) ) ( ON ?auto_186974 ?auto_186973 ) ( ON-TABLE ?auto_186981 ) ( CLEAR ?auto_186976 ) ( ON ?auto_186975 ?auto_186974 ) ( CLEAR ?auto_186975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_186981 ?auto_186973 ?auto_186974 )
      ( MAKE-5PILE ?auto_186973 ?auto_186974 ?auto_186975 ?auto_186976 ?auto_186977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186982 - BLOCK
      ?auto_186983 - BLOCK
      ?auto_186984 - BLOCK
      ?auto_186985 - BLOCK
      ?auto_186986 - BLOCK
    )
    :vars
    (
      ?auto_186988 - BLOCK
      ?auto_186989 - BLOCK
      ?auto_186990 - BLOCK
      ?auto_186987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186982 ?auto_186983 ) ) ( not ( = ?auto_186982 ?auto_186984 ) ) ( not ( = ?auto_186982 ?auto_186985 ) ) ( not ( = ?auto_186982 ?auto_186986 ) ) ( not ( = ?auto_186983 ?auto_186984 ) ) ( not ( = ?auto_186983 ?auto_186985 ) ) ( not ( = ?auto_186983 ?auto_186986 ) ) ( not ( = ?auto_186984 ?auto_186985 ) ) ( not ( = ?auto_186984 ?auto_186986 ) ) ( not ( = ?auto_186985 ?auto_186986 ) ) ( ON ?auto_186986 ?auto_186988 ) ( not ( = ?auto_186982 ?auto_186988 ) ) ( not ( = ?auto_186983 ?auto_186988 ) ) ( not ( = ?auto_186984 ?auto_186988 ) ) ( not ( = ?auto_186985 ?auto_186988 ) ) ( not ( = ?auto_186986 ?auto_186988 ) ) ( ON-TABLE ?auto_186989 ) ( ON ?auto_186990 ?auto_186989 ) ( ON ?auto_186988 ?auto_186990 ) ( not ( = ?auto_186989 ?auto_186990 ) ) ( not ( = ?auto_186989 ?auto_186988 ) ) ( not ( = ?auto_186989 ?auto_186986 ) ) ( not ( = ?auto_186989 ?auto_186985 ) ) ( not ( = ?auto_186990 ?auto_186988 ) ) ( not ( = ?auto_186990 ?auto_186986 ) ) ( not ( = ?auto_186990 ?auto_186985 ) ) ( not ( = ?auto_186982 ?auto_186989 ) ) ( not ( = ?auto_186982 ?auto_186990 ) ) ( not ( = ?auto_186983 ?auto_186989 ) ) ( not ( = ?auto_186983 ?auto_186990 ) ) ( not ( = ?auto_186984 ?auto_186989 ) ) ( not ( = ?auto_186984 ?auto_186990 ) ) ( ON ?auto_186982 ?auto_186987 ) ( not ( = ?auto_186982 ?auto_186987 ) ) ( not ( = ?auto_186983 ?auto_186987 ) ) ( not ( = ?auto_186984 ?auto_186987 ) ) ( not ( = ?auto_186985 ?auto_186987 ) ) ( not ( = ?auto_186986 ?auto_186987 ) ) ( not ( = ?auto_186988 ?auto_186987 ) ) ( not ( = ?auto_186989 ?auto_186987 ) ) ( not ( = ?auto_186990 ?auto_186987 ) ) ( ON ?auto_186983 ?auto_186982 ) ( ON-TABLE ?auto_186987 ) ( ON ?auto_186984 ?auto_186983 ) ( CLEAR ?auto_186984 ) ( HOLDING ?auto_186985 ) ( CLEAR ?auto_186986 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_186989 ?auto_186990 ?auto_186988 ?auto_186986 ?auto_186985 )
      ( MAKE-5PILE ?auto_186982 ?auto_186983 ?auto_186984 ?auto_186985 ?auto_186986 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_186991 - BLOCK
      ?auto_186992 - BLOCK
      ?auto_186993 - BLOCK
      ?auto_186994 - BLOCK
      ?auto_186995 - BLOCK
    )
    :vars
    (
      ?auto_186996 - BLOCK
      ?auto_186998 - BLOCK
      ?auto_186997 - BLOCK
      ?auto_186999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_186991 ?auto_186992 ) ) ( not ( = ?auto_186991 ?auto_186993 ) ) ( not ( = ?auto_186991 ?auto_186994 ) ) ( not ( = ?auto_186991 ?auto_186995 ) ) ( not ( = ?auto_186992 ?auto_186993 ) ) ( not ( = ?auto_186992 ?auto_186994 ) ) ( not ( = ?auto_186992 ?auto_186995 ) ) ( not ( = ?auto_186993 ?auto_186994 ) ) ( not ( = ?auto_186993 ?auto_186995 ) ) ( not ( = ?auto_186994 ?auto_186995 ) ) ( ON ?auto_186995 ?auto_186996 ) ( not ( = ?auto_186991 ?auto_186996 ) ) ( not ( = ?auto_186992 ?auto_186996 ) ) ( not ( = ?auto_186993 ?auto_186996 ) ) ( not ( = ?auto_186994 ?auto_186996 ) ) ( not ( = ?auto_186995 ?auto_186996 ) ) ( ON-TABLE ?auto_186998 ) ( ON ?auto_186997 ?auto_186998 ) ( ON ?auto_186996 ?auto_186997 ) ( not ( = ?auto_186998 ?auto_186997 ) ) ( not ( = ?auto_186998 ?auto_186996 ) ) ( not ( = ?auto_186998 ?auto_186995 ) ) ( not ( = ?auto_186998 ?auto_186994 ) ) ( not ( = ?auto_186997 ?auto_186996 ) ) ( not ( = ?auto_186997 ?auto_186995 ) ) ( not ( = ?auto_186997 ?auto_186994 ) ) ( not ( = ?auto_186991 ?auto_186998 ) ) ( not ( = ?auto_186991 ?auto_186997 ) ) ( not ( = ?auto_186992 ?auto_186998 ) ) ( not ( = ?auto_186992 ?auto_186997 ) ) ( not ( = ?auto_186993 ?auto_186998 ) ) ( not ( = ?auto_186993 ?auto_186997 ) ) ( ON ?auto_186991 ?auto_186999 ) ( not ( = ?auto_186991 ?auto_186999 ) ) ( not ( = ?auto_186992 ?auto_186999 ) ) ( not ( = ?auto_186993 ?auto_186999 ) ) ( not ( = ?auto_186994 ?auto_186999 ) ) ( not ( = ?auto_186995 ?auto_186999 ) ) ( not ( = ?auto_186996 ?auto_186999 ) ) ( not ( = ?auto_186998 ?auto_186999 ) ) ( not ( = ?auto_186997 ?auto_186999 ) ) ( ON ?auto_186992 ?auto_186991 ) ( ON-TABLE ?auto_186999 ) ( ON ?auto_186993 ?auto_186992 ) ( CLEAR ?auto_186995 ) ( ON ?auto_186994 ?auto_186993 ) ( CLEAR ?auto_186994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_186999 ?auto_186991 ?auto_186992 ?auto_186993 )
      ( MAKE-5PILE ?auto_186991 ?auto_186992 ?auto_186993 ?auto_186994 ?auto_186995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187000 - BLOCK
      ?auto_187001 - BLOCK
      ?auto_187002 - BLOCK
      ?auto_187003 - BLOCK
      ?auto_187004 - BLOCK
    )
    :vars
    (
      ?auto_187007 - BLOCK
      ?auto_187006 - BLOCK
      ?auto_187005 - BLOCK
      ?auto_187008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187000 ?auto_187001 ) ) ( not ( = ?auto_187000 ?auto_187002 ) ) ( not ( = ?auto_187000 ?auto_187003 ) ) ( not ( = ?auto_187000 ?auto_187004 ) ) ( not ( = ?auto_187001 ?auto_187002 ) ) ( not ( = ?auto_187001 ?auto_187003 ) ) ( not ( = ?auto_187001 ?auto_187004 ) ) ( not ( = ?auto_187002 ?auto_187003 ) ) ( not ( = ?auto_187002 ?auto_187004 ) ) ( not ( = ?auto_187003 ?auto_187004 ) ) ( not ( = ?auto_187000 ?auto_187007 ) ) ( not ( = ?auto_187001 ?auto_187007 ) ) ( not ( = ?auto_187002 ?auto_187007 ) ) ( not ( = ?auto_187003 ?auto_187007 ) ) ( not ( = ?auto_187004 ?auto_187007 ) ) ( ON-TABLE ?auto_187006 ) ( ON ?auto_187005 ?auto_187006 ) ( ON ?auto_187007 ?auto_187005 ) ( not ( = ?auto_187006 ?auto_187005 ) ) ( not ( = ?auto_187006 ?auto_187007 ) ) ( not ( = ?auto_187006 ?auto_187004 ) ) ( not ( = ?auto_187006 ?auto_187003 ) ) ( not ( = ?auto_187005 ?auto_187007 ) ) ( not ( = ?auto_187005 ?auto_187004 ) ) ( not ( = ?auto_187005 ?auto_187003 ) ) ( not ( = ?auto_187000 ?auto_187006 ) ) ( not ( = ?auto_187000 ?auto_187005 ) ) ( not ( = ?auto_187001 ?auto_187006 ) ) ( not ( = ?auto_187001 ?auto_187005 ) ) ( not ( = ?auto_187002 ?auto_187006 ) ) ( not ( = ?auto_187002 ?auto_187005 ) ) ( ON ?auto_187000 ?auto_187008 ) ( not ( = ?auto_187000 ?auto_187008 ) ) ( not ( = ?auto_187001 ?auto_187008 ) ) ( not ( = ?auto_187002 ?auto_187008 ) ) ( not ( = ?auto_187003 ?auto_187008 ) ) ( not ( = ?auto_187004 ?auto_187008 ) ) ( not ( = ?auto_187007 ?auto_187008 ) ) ( not ( = ?auto_187006 ?auto_187008 ) ) ( not ( = ?auto_187005 ?auto_187008 ) ) ( ON ?auto_187001 ?auto_187000 ) ( ON-TABLE ?auto_187008 ) ( ON ?auto_187002 ?auto_187001 ) ( ON ?auto_187003 ?auto_187002 ) ( CLEAR ?auto_187003 ) ( HOLDING ?auto_187004 ) ( CLEAR ?auto_187007 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187006 ?auto_187005 ?auto_187007 ?auto_187004 )
      ( MAKE-5PILE ?auto_187000 ?auto_187001 ?auto_187002 ?auto_187003 ?auto_187004 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187009 - BLOCK
      ?auto_187010 - BLOCK
      ?auto_187011 - BLOCK
      ?auto_187012 - BLOCK
      ?auto_187013 - BLOCK
    )
    :vars
    (
      ?auto_187016 - BLOCK
      ?auto_187015 - BLOCK
      ?auto_187017 - BLOCK
      ?auto_187014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187009 ?auto_187010 ) ) ( not ( = ?auto_187009 ?auto_187011 ) ) ( not ( = ?auto_187009 ?auto_187012 ) ) ( not ( = ?auto_187009 ?auto_187013 ) ) ( not ( = ?auto_187010 ?auto_187011 ) ) ( not ( = ?auto_187010 ?auto_187012 ) ) ( not ( = ?auto_187010 ?auto_187013 ) ) ( not ( = ?auto_187011 ?auto_187012 ) ) ( not ( = ?auto_187011 ?auto_187013 ) ) ( not ( = ?auto_187012 ?auto_187013 ) ) ( not ( = ?auto_187009 ?auto_187016 ) ) ( not ( = ?auto_187010 ?auto_187016 ) ) ( not ( = ?auto_187011 ?auto_187016 ) ) ( not ( = ?auto_187012 ?auto_187016 ) ) ( not ( = ?auto_187013 ?auto_187016 ) ) ( ON-TABLE ?auto_187015 ) ( ON ?auto_187017 ?auto_187015 ) ( ON ?auto_187016 ?auto_187017 ) ( not ( = ?auto_187015 ?auto_187017 ) ) ( not ( = ?auto_187015 ?auto_187016 ) ) ( not ( = ?auto_187015 ?auto_187013 ) ) ( not ( = ?auto_187015 ?auto_187012 ) ) ( not ( = ?auto_187017 ?auto_187016 ) ) ( not ( = ?auto_187017 ?auto_187013 ) ) ( not ( = ?auto_187017 ?auto_187012 ) ) ( not ( = ?auto_187009 ?auto_187015 ) ) ( not ( = ?auto_187009 ?auto_187017 ) ) ( not ( = ?auto_187010 ?auto_187015 ) ) ( not ( = ?auto_187010 ?auto_187017 ) ) ( not ( = ?auto_187011 ?auto_187015 ) ) ( not ( = ?auto_187011 ?auto_187017 ) ) ( ON ?auto_187009 ?auto_187014 ) ( not ( = ?auto_187009 ?auto_187014 ) ) ( not ( = ?auto_187010 ?auto_187014 ) ) ( not ( = ?auto_187011 ?auto_187014 ) ) ( not ( = ?auto_187012 ?auto_187014 ) ) ( not ( = ?auto_187013 ?auto_187014 ) ) ( not ( = ?auto_187016 ?auto_187014 ) ) ( not ( = ?auto_187015 ?auto_187014 ) ) ( not ( = ?auto_187017 ?auto_187014 ) ) ( ON ?auto_187010 ?auto_187009 ) ( ON-TABLE ?auto_187014 ) ( ON ?auto_187011 ?auto_187010 ) ( ON ?auto_187012 ?auto_187011 ) ( CLEAR ?auto_187016 ) ( ON ?auto_187013 ?auto_187012 ) ( CLEAR ?auto_187013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187014 ?auto_187009 ?auto_187010 ?auto_187011 ?auto_187012 )
      ( MAKE-5PILE ?auto_187009 ?auto_187010 ?auto_187011 ?auto_187012 ?auto_187013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187018 - BLOCK
      ?auto_187019 - BLOCK
      ?auto_187020 - BLOCK
      ?auto_187021 - BLOCK
      ?auto_187022 - BLOCK
    )
    :vars
    (
      ?auto_187025 - BLOCK
      ?auto_187026 - BLOCK
      ?auto_187024 - BLOCK
      ?auto_187023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187018 ?auto_187019 ) ) ( not ( = ?auto_187018 ?auto_187020 ) ) ( not ( = ?auto_187018 ?auto_187021 ) ) ( not ( = ?auto_187018 ?auto_187022 ) ) ( not ( = ?auto_187019 ?auto_187020 ) ) ( not ( = ?auto_187019 ?auto_187021 ) ) ( not ( = ?auto_187019 ?auto_187022 ) ) ( not ( = ?auto_187020 ?auto_187021 ) ) ( not ( = ?auto_187020 ?auto_187022 ) ) ( not ( = ?auto_187021 ?auto_187022 ) ) ( not ( = ?auto_187018 ?auto_187025 ) ) ( not ( = ?auto_187019 ?auto_187025 ) ) ( not ( = ?auto_187020 ?auto_187025 ) ) ( not ( = ?auto_187021 ?auto_187025 ) ) ( not ( = ?auto_187022 ?auto_187025 ) ) ( ON-TABLE ?auto_187026 ) ( ON ?auto_187024 ?auto_187026 ) ( not ( = ?auto_187026 ?auto_187024 ) ) ( not ( = ?auto_187026 ?auto_187025 ) ) ( not ( = ?auto_187026 ?auto_187022 ) ) ( not ( = ?auto_187026 ?auto_187021 ) ) ( not ( = ?auto_187024 ?auto_187025 ) ) ( not ( = ?auto_187024 ?auto_187022 ) ) ( not ( = ?auto_187024 ?auto_187021 ) ) ( not ( = ?auto_187018 ?auto_187026 ) ) ( not ( = ?auto_187018 ?auto_187024 ) ) ( not ( = ?auto_187019 ?auto_187026 ) ) ( not ( = ?auto_187019 ?auto_187024 ) ) ( not ( = ?auto_187020 ?auto_187026 ) ) ( not ( = ?auto_187020 ?auto_187024 ) ) ( ON ?auto_187018 ?auto_187023 ) ( not ( = ?auto_187018 ?auto_187023 ) ) ( not ( = ?auto_187019 ?auto_187023 ) ) ( not ( = ?auto_187020 ?auto_187023 ) ) ( not ( = ?auto_187021 ?auto_187023 ) ) ( not ( = ?auto_187022 ?auto_187023 ) ) ( not ( = ?auto_187025 ?auto_187023 ) ) ( not ( = ?auto_187026 ?auto_187023 ) ) ( not ( = ?auto_187024 ?auto_187023 ) ) ( ON ?auto_187019 ?auto_187018 ) ( ON-TABLE ?auto_187023 ) ( ON ?auto_187020 ?auto_187019 ) ( ON ?auto_187021 ?auto_187020 ) ( ON ?auto_187022 ?auto_187021 ) ( CLEAR ?auto_187022 ) ( HOLDING ?auto_187025 ) ( CLEAR ?auto_187024 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187026 ?auto_187024 ?auto_187025 )
      ( MAKE-5PILE ?auto_187018 ?auto_187019 ?auto_187020 ?auto_187021 ?auto_187022 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187027 - BLOCK
      ?auto_187028 - BLOCK
      ?auto_187029 - BLOCK
      ?auto_187030 - BLOCK
      ?auto_187031 - BLOCK
    )
    :vars
    (
      ?auto_187035 - BLOCK
      ?auto_187033 - BLOCK
      ?auto_187034 - BLOCK
      ?auto_187032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187027 ?auto_187028 ) ) ( not ( = ?auto_187027 ?auto_187029 ) ) ( not ( = ?auto_187027 ?auto_187030 ) ) ( not ( = ?auto_187027 ?auto_187031 ) ) ( not ( = ?auto_187028 ?auto_187029 ) ) ( not ( = ?auto_187028 ?auto_187030 ) ) ( not ( = ?auto_187028 ?auto_187031 ) ) ( not ( = ?auto_187029 ?auto_187030 ) ) ( not ( = ?auto_187029 ?auto_187031 ) ) ( not ( = ?auto_187030 ?auto_187031 ) ) ( not ( = ?auto_187027 ?auto_187035 ) ) ( not ( = ?auto_187028 ?auto_187035 ) ) ( not ( = ?auto_187029 ?auto_187035 ) ) ( not ( = ?auto_187030 ?auto_187035 ) ) ( not ( = ?auto_187031 ?auto_187035 ) ) ( ON-TABLE ?auto_187033 ) ( ON ?auto_187034 ?auto_187033 ) ( not ( = ?auto_187033 ?auto_187034 ) ) ( not ( = ?auto_187033 ?auto_187035 ) ) ( not ( = ?auto_187033 ?auto_187031 ) ) ( not ( = ?auto_187033 ?auto_187030 ) ) ( not ( = ?auto_187034 ?auto_187035 ) ) ( not ( = ?auto_187034 ?auto_187031 ) ) ( not ( = ?auto_187034 ?auto_187030 ) ) ( not ( = ?auto_187027 ?auto_187033 ) ) ( not ( = ?auto_187027 ?auto_187034 ) ) ( not ( = ?auto_187028 ?auto_187033 ) ) ( not ( = ?auto_187028 ?auto_187034 ) ) ( not ( = ?auto_187029 ?auto_187033 ) ) ( not ( = ?auto_187029 ?auto_187034 ) ) ( ON ?auto_187027 ?auto_187032 ) ( not ( = ?auto_187027 ?auto_187032 ) ) ( not ( = ?auto_187028 ?auto_187032 ) ) ( not ( = ?auto_187029 ?auto_187032 ) ) ( not ( = ?auto_187030 ?auto_187032 ) ) ( not ( = ?auto_187031 ?auto_187032 ) ) ( not ( = ?auto_187035 ?auto_187032 ) ) ( not ( = ?auto_187033 ?auto_187032 ) ) ( not ( = ?auto_187034 ?auto_187032 ) ) ( ON ?auto_187028 ?auto_187027 ) ( ON-TABLE ?auto_187032 ) ( ON ?auto_187029 ?auto_187028 ) ( ON ?auto_187030 ?auto_187029 ) ( ON ?auto_187031 ?auto_187030 ) ( CLEAR ?auto_187034 ) ( ON ?auto_187035 ?auto_187031 ) ( CLEAR ?auto_187035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187032 ?auto_187027 ?auto_187028 ?auto_187029 ?auto_187030 ?auto_187031 )
      ( MAKE-5PILE ?auto_187027 ?auto_187028 ?auto_187029 ?auto_187030 ?auto_187031 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187036 - BLOCK
      ?auto_187037 - BLOCK
      ?auto_187038 - BLOCK
      ?auto_187039 - BLOCK
      ?auto_187040 - BLOCK
    )
    :vars
    (
      ?auto_187043 - BLOCK
      ?auto_187044 - BLOCK
      ?auto_187041 - BLOCK
      ?auto_187042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187036 ?auto_187037 ) ) ( not ( = ?auto_187036 ?auto_187038 ) ) ( not ( = ?auto_187036 ?auto_187039 ) ) ( not ( = ?auto_187036 ?auto_187040 ) ) ( not ( = ?auto_187037 ?auto_187038 ) ) ( not ( = ?auto_187037 ?auto_187039 ) ) ( not ( = ?auto_187037 ?auto_187040 ) ) ( not ( = ?auto_187038 ?auto_187039 ) ) ( not ( = ?auto_187038 ?auto_187040 ) ) ( not ( = ?auto_187039 ?auto_187040 ) ) ( not ( = ?auto_187036 ?auto_187043 ) ) ( not ( = ?auto_187037 ?auto_187043 ) ) ( not ( = ?auto_187038 ?auto_187043 ) ) ( not ( = ?auto_187039 ?auto_187043 ) ) ( not ( = ?auto_187040 ?auto_187043 ) ) ( ON-TABLE ?auto_187044 ) ( not ( = ?auto_187044 ?auto_187041 ) ) ( not ( = ?auto_187044 ?auto_187043 ) ) ( not ( = ?auto_187044 ?auto_187040 ) ) ( not ( = ?auto_187044 ?auto_187039 ) ) ( not ( = ?auto_187041 ?auto_187043 ) ) ( not ( = ?auto_187041 ?auto_187040 ) ) ( not ( = ?auto_187041 ?auto_187039 ) ) ( not ( = ?auto_187036 ?auto_187044 ) ) ( not ( = ?auto_187036 ?auto_187041 ) ) ( not ( = ?auto_187037 ?auto_187044 ) ) ( not ( = ?auto_187037 ?auto_187041 ) ) ( not ( = ?auto_187038 ?auto_187044 ) ) ( not ( = ?auto_187038 ?auto_187041 ) ) ( ON ?auto_187036 ?auto_187042 ) ( not ( = ?auto_187036 ?auto_187042 ) ) ( not ( = ?auto_187037 ?auto_187042 ) ) ( not ( = ?auto_187038 ?auto_187042 ) ) ( not ( = ?auto_187039 ?auto_187042 ) ) ( not ( = ?auto_187040 ?auto_187042 ) ) ( not ( = ?auto_187043 ?auto_187042 ) ) ( not ( = ?auto_187044 ?auto_187042 ) ) ( not ( = ?auto_187041 ?auto_187042 ) ) ( ON ?auto_187037 ?auto_187036 ) ( ON-TABLE ?auto_187042 ) ( ON ?auto_187038 ?auto_187037 ) ( ON ?auto_187039 ?auto_187038 ) ( ON ?auto_187040 ?auto_187039 ) ( ON ?auto_187043 ?auto_187040 ) ( CLEAR ?auto_187043 ) ( HOLDING ?auto_187041 ) ( CLEAR ?auto_187044 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187044 ?auto_187041 )
      ( MAKE-5PILE ?auto_187036 ?auto_187037 ?auto_187038 ?auto_187039 ?auto_187040 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187045 - BLOCK
      ?auto_187046 - BLOCK
      ?auto_187047 - BLOCK
      ?auto_187048 - BLOCK
      ?auto_187049 - BLOCK
    )
    :vars
    (
      ?auto_187050 - BLOCK
      ?auto_187051 - BLOCK
      ?auto_187052 - BLOCK
      ?auto_187053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187045 ?auto_187046 ) ) ( not ( = ?auto_187045 ?auto_187047 ) ) ( not ( = ?auto_187045 ?auto_187048 ) ) ( not ( = ?auto_187045 ?auto_187049 ) ) ( not ( = ?auto_187046 ?auto_187047 ) ) ( not ( = ?auto_187046 ?auto_187048 ) ) ( not ( = ?auto_187046 ?auto_187049 ) ) ( not ( = ?auto_187047 ?auto_187048 ) ) ( not ( = ?auto_187047 ?auto_187049 ) ) ( not ( = ?auto_187048 ?auto_187049 ) ) ( not ( = ?auto_187045 ?auto_187050 ) ) ( not ( = ?auto_187046 ?auto_187050 ) ) ( not ( = ?auto_187047 ?auto_187050 ) ) ( not ( = ?auto_187048 ?auto_187050 ) ) ( not ( = ?auto_187049 ?auto_187050 ) ) ( ON-TABLE ?auto_187051 ) ( not ( = ?auto_187051 ?auto_187052 ) ) ( not ( = ?auto_187051 ?auto_187050 ) ) ( not ( = ?auto_187051 ?auto_187049 ) ) ( not ( = ?auto_187051 ?auto_187048 ) ) ( not ( = ?auto_187052 ?auto_187050 ) ) ( not ( = ?auto_187052 ?auto_187049 ) ) ( not ( = ?auto_187052 ?auto_187048 ) ) ( not ( = ?auto_187045 ?auto_187051 ) ) ( not ( = ?auto_187045 ?auto_187052 ) ) ( not ( = ?auto_187046 ?auto_187051 ) ) ( not ( = ?auto_187046 ?auto_187052 ) ) ( not ( = ?auto_187047 ?auto_187051 ) ) ( not ( = ?auto_187047 ?auto_187052 ) ) ( ON ?auto_187045 ?auto_187053 ) ( not ( = ?auto_187045 ?auto_187053 ) ) ( not ( = ?auto_187046 ?auto_187053 ) ) ( not ( = ?auto_187047 ?auto_187053 ) ) ( not ( = ?auto_187048 ?auto_187053 ) ) ( not ( = ?auto_187049 ?auto_187053 ) ) ( not ( = ?auto_187050 ?auto_187053 ) ) ( not ( = ?auto_187051 ?auto_187053 ) ) ( not ( = ?auto_187052 ?auto_187053 ) ) ( ON ?auto_187046 ?auto_187045 ) ( ON-TABLE ?auto_187053 ) ( ON ?auto_187047 ?auto_187046 ) ( ON ?auto_187048 ?auto_187047 ) ( ON ?auto_187049 ?auto_187048 ) ( ON ?auto_187050 ?auto_187049 ) ( CLEAR ?auto_187051 ) ( ON ?auto_187052 ?auto_187050 ) ( CLEAR ?auto_187052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187053 ?auto_187045 ?auto_187046 ?auto_187047 ?auto_187048 ?auto_187049 ?auto_187050 )
      ( MAKE-5PILE ?auto_187045 ?auto_187046 ?auto_187047 ?auto_187048 ?auto_187049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187054 - BLOCK
      ?auto_187055 - BLOCK
      ?auto_187056 - BLOCK
      ?auto_187057 - BLOCK
      ?auto_187058 - BLOCK
    )
    :vars
    (
      ?auto_187062 - BLOCK
      ?auto_187060 - BLOCK
      ?auto_187059 - BLOCK
      ?auto_187061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187054 ?auto_187055 ) ) ( not ( = ?auto_187054 ?auto_187056 ) ) ( not ( = ?auto_187054 ?auto_187057 ) ) ( not ( = ?auto_187054 ?auto_187058 ) ) ( not ( = ?auto_187055 ?auto_187056 ) ) ( not ( = ?auto_187055 ?auto_187057 ) ) ( not ( = ?auto_187055 ?auto_187058 ) ) ( not ( = ?auto_187056 ?auto_187057 ) ) ( not ( = ?auto_187056 ?auto_187058 ) ) ( not ( = ?auto_187057 ?auto_187058 ) ) ( not ( = ?auto_187054 ?auto_187062 ) ) ( not ( = ?auto_187055 ?auto_187062 ) ) ( not ( = ?auto_187056 ?auto_187062 ) ) ( not ( = ?auto_187057 ?auto_187062 ) ) ( not ( = ?auto_187058 ?auto_187062 ) ) ( not ( = ?auto_187060 ?auto_187059 ) ) ( not ( = ?auto_187060 ?auto_187062 ) ) ( not ( = ?auto_187060 ?auto_187058 ) ) ( not ( = ?auto_187060 ?auto_187057 ) ) ( not ( = ?auto_187059 ?auto_187062 ) ) ( not ( = ?auto_187059 ?auto_187058 ) ) ( not ( = ?auto_187059 ?auto_187057 ) ) ( not ( = ?auto_187054 ?auto_187060 ) ) ( not ( = ?auto_187054 ?auto_187059 ) ) ( not ( = ?auto_187055 ?auto_187060 ) ) ( not ( = ?auto_187055 ?auto_187059 ) ) ( not ( = ?auto_187056 ?auto_187060 ) ) ( not ( = ?auto_187056 ?auto_187059 ) ) ( ON ?auto_187054 ?auto_187061 ) ( not ( = ?auto_187054 ?auto_187061 ) ) ( not ( = ?auto_187055 ?auto_187061 ) ) ( not ( = ?auto_187056 ?auto_187061 ) ) ( not ( = ?auto_187057 ?auto_187061 ) ) ( not ( = ?auto_187058 ?auto_187061 ) ) ( not ( = ?auto_187062 ?auto_187061 ) ) ( not ( = ?auto_187060 ?auto_187061 ) ) ( not ( = ?auto_187059 ?auto_187061 ) ) ( ON ?auto_187055 ?auto_187054 ) ( ON-TABLE ?auto_187061 ) ( ON ?auto_187056 ?auto_187055 ) ( ON ?auto_187057 ?auto_187056 ) ( ON ?auto_187058 ?auto_187057 ) ( ON ?auto_187062 ?auto_187058 ) ( ON ?auto_187059 ?auto_187062 ) ( CLEAR ?auto_187059 ) ( HOLDING ?auto_187060 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187060 )
      ( MAKE-5PILE ?auto_187054 ?auto_187055 ?auto_187056 ?auto_187057 ?auto_187058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_187063 - BLOCK
      ?auto_187064 - BLOCK
      ?auto_187065 - BLOCK
      ?auto_187066 - BLOCK
      ?auto_187067 - BLOCK
    )
    :vars
    (
      ?auto_187071 - BLOCK
      ?auto_187069 - BLOCK
      ?auto_187068 - BLOCK
      ?auto_187070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187063 ?auto_187064 ) ) ( not ( = ?auto_187063 ?auto_187065 ) ) ( not ( = ?auto_187063 ?auto_187066 ) ) ( not ( = ?auto_187063 ?auto_187067 ) ) ( not ( = ?auto_187064 ?auto_187065 ) ) ( not ( = ?auto_187064 ?auto_187066 ) ) ( not ( = ?auto_187064 ?auto_187067 ) ) ( not ( = ?auto_187065 ?auto_187066 ) ) ( not ( = ?auto_187065 ?auto_187067 ) ) ( not ( = ?auto_187066 ?auto_187067 ) ) ( not ( = ?auto_187063 ?auto_187071 ) ) ( not ( = ?auto_187064 ?auto_187071 ) ) ( not ( = ?auto_187065 ?auto_187071 ) ) ( not ( = ?auto_187066 ?auto_187071 ) ) ( not ( = ?auto_187067 ?auto_187071 ) ) ( not ( = ?auto_187069 ?auto_187068 ) ) ( not ( = ?auto_187069 ?auto_187071 ) ) ( not ( = ?auto_187069 ?auto_187067 ) ) ( not ( = ?auto_187069 ?auto_187066 ) ) ( not ( = ?auto_187068 ?auto_187071 ) ) ( not ( = ?auto_187068 ?auto_187067 ) ) ( not ( = ?auto_187068 ?auto_187066 ) ) ( not ( = ?auto_187063 ?auto_187069 ) ) ( not ( = ?auto_187063 ?auto_187068 ) ) ( not ( = ?auto_187064 ?auto_187069 ) ) ( not ( = ?auto_187064 ?auto_187068 ) ) ( not ( = ?auto_187065 ?auto_187069 ) ) ( not ( = ?auto_187065 ?auto_187068 ) ) ( ON ?auto_187063 ?auto_187070 ) ( not ( = ?auto_187063 ?auto_187070 ) ) ( not ( = ?auto_187064 ?auto_187070 ) ) ( not ( = ?auto_187065 ?auto_187070 ) ) ( not ( = ?auto_187066 ?auto_187070 ) ) ( not ( = ?auto_187067 ?auto_187070 ) ) ( not ( = ?auto_187071 ?auto_187070 ) ) ( not ( = ?auto_187069 ?auto_187070 ) ) ( not ( = ?auto_187068 ?auto_187070 ) ) ( ON ?auto_187064 ?auto_187063 ) ( ON-TABLE ?auto_187070 ) ( ON ?auto_187065 ?auto_187064 ) ( ON ?auto_187066 ?auto_187065 ) ( ON ?auto_187067 ?auto_187066 ) ( ON ?auto_187071 ?auto_187067 ) ( ON ?auto_187068 ?auto_187071 ) ( ON ?auto_187069 ?auto_187068 ) ( CLEAR ?auto_187069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187070 ?auto_187063 ?auto_187064 ?auto_187065 ?auto_187066 ?auto_187067 ?auto_187071 ?auto_187068 )
      ( MAKE-5PILE ?auto_187063 ?auto_187064 ?auto_187065 ?auto_187066 ?auto_187067 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187087 - BLOCK
      ?auto_187088 - BLOCK
    )
    :vars
    (
      ?auto_187090 - BLOCK
      ?auto_187089 - BLOCK
      ?auto_187091 - BLOCK
      ?auto_187094 - BLOCK
      ?auto_187092 - BLOCK
      ?auto_187093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187090 ?auto_187088 ) ( ON-TABLE ?auto_187087 ) ( ON ?auto_187088 ?auto_187087 ) ( not ( = ?auto_187087 ?auto_187088 ) ) ( not ( = ?auto_187087 ?auto_187090 ) ) ( not ( = ?auto_187088 ?auto_187090 ) ) ( not ( = ?auto_187087 ?auto_187089 ) ) ( not ( = ?auto_187087 ?auto_187091 ) ) ( not ( = ?auto_187088 ?auto_187089 ) ) ( not ( = ?auto_187088 ?auto_187091 ) ) ( not ( = ?auto_187090 ?auto_187089 ) ) ( not ( = ?auto_187090 ?auto_187091 ) ) ( not ( = ?auto_187089 ?auto_187091 ) ) ( ON ?auto_187089 ?auto_187090 ) ( CLEAR ?auto_187089 ) ( HOLDING ?auto_187091 ) ( CLEAR ?auto_187094 ) ( ON-TABLE ?auto_187092 ) ( ON ?auto_187093 ?auto_187092 ) ( ON ?auto_187094 ?auto_187093 ) ( not ( = ?auto_187092 ?auto_187093 ) ) ( not ( = ?auto_187092 ?auto_187094 ) ) ( not ( = ?auto_187092 ?auto_187091 ) ) ( not ( = ?auto_187093 ?auto_187094 ) ) ( not ( = ?auto_187093 ?auto_187091 ) ) ( not ( = ?auto_187094 ?auto_187091 ) ) ( not ( = ?auto_187087 ?auto_187094 ) ) ( not ( = ?auto_187087 ?auto_187092 ) ) ( not ( = ?auto_187087 ?auto_187093 ) ) ( not ( = ?auto_187088 ?auto_187094 ) ) ( not ( = ?auto_187088 ?auto_187092 ) ) ( not ( = ?auto_187088 ?auto_187093 ) ) ( not ( = ?auto_187090 ?auto_187094 ) ) ( not ( = ?auto_187090 ?auto_187092 ) ) ( not ( = ?auto_187090 ?auto_187093 ) ) ( not ( = ?auto_187089 ?auto_187094 ) ) ( not ( = ?auto_187089 ?auto_187092 ) ) ( not ( = ?auto_187089 ?auto_187093 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187092 ?auto_187093 ?auto_187094 ?auto_187091 )
      ( MAKE-2PILE ?auto_187087 ?auto_187088 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187095 - BLOCK
      ?auto_187096 - BLOCK
    )
    :vars
    (
      ?auto_187098 - BLOCK
      ?auto_187099 - BLOCK
      ?auto_187101 - BLOCK
      ?auto_187102 - BLOCK
      ?auto_187097 - BLOCK
      ?auto_187100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187098 ?auto_187096 ) ( ON-TABLE ?auto_187095 ) ( ON ?auto_187096 ?auto_187095 ) ( not ( = ?auto_187095 ?auto_187096 ) ) ( not ( = ?auto_187095 ?auto_187098 ) ) ( not ( = ?auto_187096 ?auto_187098 ) ) ( not ( = ?auto_187095 ?auto_187099 ) ) ( not ( = ?auto_187095 ?auto_187101 ) ) ( not ( = ?auto_187096 ?auto_187099 ) ) ( not ( = ?auto_187096 ?auto_187101 ) ) ( not ( = ?auto_187098 ?auto_187099 ) ) ( not ( = ?auto_187098 ?auto_187101 ) ) ( not ( = ?auto_187099 ?auto_187101 ) ) ( ON ?auto_187099 ?auto_187098 ) ( CLEAR ?auto_187102 ) ( ON-TABLE ?auto_187097 ) ( ON ?auto_187100 ?auto_187097 ) ( ON ?auto_187102 ?auto_187100 ) ( not ( = ?auto_187097 ?auto_187100 ) ) ( not ( = ?auto_187097 ?auto_187102 ) ) ( not ( = ?auto_187097 ?auto_187101 ) ) ( not ( = ?auto_187100 ?auto_187102 ) ) ( not ( = ?auto_187100 ?auto_187101 ) ) ( not ( = ?auto_187102 ?auto_187101 ) ) ( not ( = ?auto_187095 ?auto_187102 ) ) ( not ( = ?auto_187095 ?auto_187097 ) ) ( not ( = ?auto_187095 ?auto_187100 ) ) ( not ( = ?auto_187096 ?auto_187102 ) ) ( not ( = ?auto_187096 ?auto_187097 ) ) ( not ( = ?auto_187096 ?auto_187100 ) ) ( not ( = ?auto_187098 ?auto_187102 ) ) ( not ( = ?auto_187098 ?auto_187097 ) ) ( not ( = ?auto_187098 ?auto_187100 ) ) ( not ( = ?auto_187099 ?auto_187102 ) ) ( not ( = ?auto_187099 ?auto_187097 ) ) ( not ( = ?auto_187099 ?auto_187100 ) ) ( ON ?auto_187101 ?auto_187099 ) ( CLEAR ?auto_187101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187095 ?auto_187096 ?auto_187098 ?auto_187099 )
      ( MAKE-2PILE ?auto_187095 ?auto_187096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187103 - BLOCK
      ?auto_187104 - BLOCK
    )
    :vars
    (
      ?auto_187106 - BLOCK
      ?auto_187110 - BLOCK
      ?auto_187109 - BLOCK
      ?auto_187108 - BLOCK
      ?auto_187107 - BLOCK
      ?auto_187105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187106 ?auto_187104 ) ( ON-TABLE ?auto_187103 ) ( ON ?auto_187104 ?auto_187103 ) ( not ( = ?auto_187103 ?auto_187104 ) ) ( not ( = ?auto_187103 ?auto_187106 ) ) ( not ( = ?auto_187104 ?auto_187106 ) ) ( not ( = ?auto_187103 ?auto_187110 ) ) ( not ( = ?auto_187103 ?auto_187109 ) ) ( not ( = ?auto_187104 ?auto_187110 ) ) ( not ( = ?auto_187104 ?auto_187109 ) ) ( not ( = ?auto_187106 ?auto_187110 ) ) ( not ( = ?auto_187106 ?auto_187109 ) ) ( not ( = ?auto_187110 ?auto_187109 ) ) ( ON ?auto_187110 ?auto_187106 ) ( ON-TABLE ?auto_187108 ) ( ON ?auto_187107 ?auto_187108 ) ( not ( = ?auto_187108 ?auto_187107 ) ) ( not ( = ?auto_187108 ?auto_187105 ) ) ( not ( = ?auto_187108 ?auto_187109 ) ) ( not ( = ?auto_187107 ?auto_187105 ) ) ( not ( = ?auto_187107 ?auto_187109 ) ) ( not ( = ?auto_187105 ?auto_187109 ) ) ( not ( = ?auto_187103 ?auto_187105 ) ) ( not ( = ?auto_187103 ?auto_187108 ) ) ( not ( = ?auto_187103 ?auto_187107 ) ) ( not ( = ?auto_187104 ?auto_187105 ) ) ( not ( = ?auto_187104 ?auto_187108 ) ) ( not ( = ?auto_187104 ?auto_187107 ) ) ( not ( = ?auto_187106 ?auto_187105 ) ) ( not ( = ?auto_187106 ?auto_187108 ) ) ( not ( = ?auto_187106 ?auto_187107 ) ) ( not ( = ?auto_187110 ?auto_187105 ) ) ( not ( = ?auto_187110 ?auto_187108 ) ) ( not ( = ?auto_187110 ?auto_187107 ) ) ( ON ?auto_187109 ?auto_187110 ) ( CLEAR ?auto_187109 ) ( HOLDING ?auto_187105 ) ( CLEAR ?auto_187107 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187108 ?auto_187107 ?auto_187105 )
      ( MAKE-2PILE ?auto_187103 ?auto_187104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187111 - BLOCK
      ?auto_187112 - BLOCK
    )
    :vars
    (
      ?auto_187117 - BLOCK
      ?auto_187115 - BLOCK
      ?auto_187116 - BLOCK
      ?auto_187114 - BLOCK
      ?auto_187113 - BLOCK
      ?auto_187118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187117 ?auto_187112 ) ( ON-TABLE ?auto_187111 ) ( ON ?auto_187112 ?auto_187111 ) ( not ( = ?auto_187111 ?auto_187112 ) ) ( not ( = ?auto_187111 ?auto_187117 ) ) ( not ( = ?auto_187112 ?auto_187117 ) ) ( not ( = ?auto_187111 ?auto_187115 ) ) ( not ( = ?auto_187111 ?auto_187116 ) ) ( not ( = ?auto_187112 ?auto_187115 ) ) ( not ( = ?auto_187112 ?auto_187116 ) ) ( not ( = ?auto_187117 ?auto_187115 ) ) ( not ( = ?auto_187117 ?auto_187116 ) ) ( not ( = ?auto_187115 ?auto_187116 ) ) ( ON ?auto_187115 ?auto_187117 ) ( ON-TABLE ?auto_187114 ) ( ON ?auto_187113 ?auto_187114 ) ( not ( = ?auto_187114 ?auto_187113 ) ) ( not ( = ?auto_187114 ?auto_187118 ) ) ( not ( = ?auto_187114 ?auto_187116 ) ) ( not ( = ?auto_187113 ?auto_187118 ) ) ( not ( = ?auto_187113 ?auto_187116 ) ) ( not ( = ?auto_187118 ?auto_187116 ) ) ( not ( = ?auto_187111 ?auto_187118 ) ) ( not ( = ?auto_187111 ?auto_187114 ) ) ( not ( = ?auto_187111 ?auto_187113 ) ) ( not ( = ?auto_187112 ?auto_187118 ) ) ( not ( = ?auto_187112 ?auto_187114 ) ) ( not ( = ?auto_187112 ?auto_187113 ) ) ( not ( = ?auto_187117 ?auto_187118 ) ) ( not ( = ?auto_187117 ?auto_187114 ) ) ( not ( = ?auto_187117 ?auto_187113 ) ) ( not ( = ?auto_187115 ?auto_187118 ) ) ( not ( = ?auto_187115 ?auto_187114 ) ) ( not ( = ?auto_187115 ?auto_187113 ) ) ( ON ?auto_187116 ?auto_187115 ) ( CLEAR ?auto_187113 ) ( ON ?auto_187118 ?auto_187116 ) ( CLEAR ?auto_187118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187111 ?auto_187112 ?auto_187117 ?auto_187115 ?auto_187116 )
      ( MAKE-2PILE ?auto_187111 ?auto_187112 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187119 - BLOCK
      ?auto_187120 - BLOCK
    )
    :vars
    (
      ?auto_187125 - BLOCK
      ?auto_187121 - BLOCK
      ?auto_187123 - BLOCK
      ?auto_187122 - BLOCK
      ?auto_187124 - BLOCK
      ?auto_187126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187125 ?auto_187120 ) ( ON-TABLE ?auto_187119 ) ( ON ?auto_187120 ?auto_187119 ) ( not ( = ?auto_187119 ?auto_187120 ) ) ( not ( = ?auto_187119 ?auto_187125 ) ) ( not ( = ?auto_187120 ?auto_187125 ) ) ( not ( = ?auto_187119 ?auto_187121 ) ) ( not ( = ?auto_187119 ?auto_187123 ) ) ( not ( = ?auto_187120 ?auto_187121 ) ) ( not ( = ?auto_187120 ?auto_187123 ) ) ( not ( = ?auto_187125 ?auto_187121 ) ) ( not ( = ?auto_187125 ?auto_187123 ) ) ( not ( = ?auto_187121 ?auto_187123 ) ) ( ON ?auto_187121 ?auto_187125 ) ( ON-TABLE ?auto_187122 ) ( not ( = ?auto_187122 ?auto_187124 ) ) ( not ( = ?auto_187122 ?auto_187126 ) ) ( not ( = ?auto_187122 ?auto_187123 ) ) ( not ( = ?auto_187124 ?auto_187126 ) ) ( not ( = ?auto_187124 ?auto_187123 ) ) ( not ( = ?auto_187126 ?auto_187123 ) ) ( not ( = ?auto_187119 ?auto_187126 ) ) ( not ( = ?auto_187119 ?auto_187122 ) ) ( not ( = ?auto_187119 ?auto_187124 ) ) ( not ( = ?auto_187120 ?auto_187126 ) ) ( not ( = ?auto_187120 ?auto_187122 ) ) ( not ( = ?auto_187120 ?auto_187124 ) ) ( not ( = ?auto_187125 ?auto_187126 ) ) ( not ( = ?auto_187125 ?auto_187122 ) ) ( not ( = ?auto_187125 ?auto_187124 ) ) ( not ( = ?auto_187121 ?auto_187126 ) ) ( not ( = ?auto_187121 ?auto_187122 ) ) ( not ( = ?auto_187121 ?auto_187124 ) ) ( ON ?auto_187123 ?auto_187121 ) ( ON ?auto_187126 ?auto_187123 ) ( CLEAR ?auto_187126 ) ( HOLDING ?auto_187124 ) ( CLEAR ?auto_187122 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187122 ?auto_187124 )
      ( MAKE-2PILE ?auto_187119 ?auto_187120 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187127 - BLOCK
      ?auto_187128 - BLOCK
    )
    :vars
    (
      ?auto_187134 - BLOCK
      ?auto_187132 - BLOCK
      ?auto_187129 - BLOCK
      ?auto_187131 - BLOCK
      ?auto_187133 - BLOCK
      ?auto_187130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187134 ?auto_187128 ) ( ON-TABLE ?auto_187127 ) ( ON ?auto_187128 ?auto_187127 ) ( not ( = ?auto_187127 ?auto_187128 ) ) ( not ( = ?auto_187127 ?auto_187134 ) ) ( not ( = ?auto_187128 ?auto_187134 ) ) ( not ( = ?auto_187127 ?auto_187132 ) ) ( not ( = ?auto_187127 ?auto_187129 ) ) ( not ( = ?auto_187128 ?auto_187132 ) ) ( not ( = ?auto_187128 ?auto_187129 ) ) ( not ( = ?auto_187134 ?auto_187132 ) ) ( not ( = ?auto_187134 ?auto_187129 ) ) ( not ( = ?auto_187132 ?auto_187129 ) ) ( ON ?auto_187132 ?auto_187134 ) ( ON-TABLE ?auto_187131 ) ( not ( = ?auto_187131 ?auto_187133 ) ) ( not ( = ?auto_187131 ?auto_187130 ) ) ( not ( = ?auto_187131 ?auto_187129 ) ) ( not ( = ?auto_187133 ?auto_187130 ) ) ( not ( = ?auto_187133 ?auto_187129 ) ) ( not ( = ?auto_187130 ?auto_187129 ) ) ( not ( = ?auto_187127 ?auto_187130 ) ) ( not ( = ?auto_187127 ?auto_187131 ) ) ( not ( = ?auto_187127 ?auto_187133 ) ) ( not ( = ?auto_187128 ?auto_187130 ) ) ( not ( = ?auto_187128 ?auto_187131 ) ) ( not ( = ?auto_187128 ?auto_187133 ) ) ( not ( = ?auto_187134 ?auto_187130 ) ) ( not ( = ?auto_187134 ?auto_187131 ) ) ( not ( = ?auto_187134 ?auto_187133 ) ) ( not ( = ?auto_187132 ?auto_187130 ) ) ( not ( = ?auto_187132 ?auto_187131 ) ) ( not ( = ?auto_187132 ?auto_187133 ) ) ( ON ?auto_187129 ?auto_187132 ) ( ON ?auto_187130 ?auto_187129 ) ( CLEAR ?auto_187131 ) ( ON ?auto_187133 ?auto_187130 ) ( CLEAR ?auto_187133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187127 ?auto_187128 ?auto_187134 ?auto_187132 ?auto_187129 ?auto_187130 )
      ( MAKE-2PILE ?auto_187127 ?auto_187128 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187135 - BLOCK
      ?auto_187136 - BLOCK
    )
    :vars
    (
      ?auto_187140 - BLOCK
      ?auto_187138 - BLOCK
      ?auto_187139 - BLOCK
      ?auto_187142 - BLOCK
      ?auto_187137 - BLOCK
      ?auto_187141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187140 ?auto_187136 ) ( ON-TABLE ?auto_187135 ) ( ON ?auto_187136 ?auto_187135 ) ( not ( = ?auto_187135 ?auto_187136 ) ) ( not ( = ?auto_187135 ?auto_187140 ) ) ( not ( = ?auto_187136 ?auto_187140 ) ) ( not ( = ?auto_187135 ?auto_187138 ) ) ( not ( = ?auto_187135 ?auto_187139 ) ) ( not ( = ?auto_187136 ?auto_187138 ) ) ( not ( = ?auto_187136 ?auto_187139 ) ) ( not ( = ?auto_187140 ?auto_187138 ) ) ( not ( = ?auto_187140 ?auto_187139 ) ) ( not ( = ?auto_187138 ?auto_187139 ) ) ( ON ?auto_187138 ?auto_187140 ) ( not ( = ?auto_187142 ?auto_187137 ) ) ( not ( = ?auto_187142 ?auto_187141 ) ) ( not ( = ?auto_187142 ?auto_187139 ) ) ( not ( = ?auto_187137 ?auto_187141 ) ) ( not ( = ?auto_187137 ?auto_187139 ) ) ( not ( = ?auto_187141 ?auto_187139 ) ) ( not ( = ?auto_187135 ?auto_187141 ) ) ( not ( = ?auto_187135 ?auto_187142 ) ) ( not ( = ?auto_187135 ?auto_187137 ) ) ( not ( = ?auto_187136 ?auto_187141 ) ) ( not ( = ?auto_187136 ?auto_187142 ) ) ( not ( = ?auto_187136 ?auto_187137 ) ) ( not ( = ?auto_187140 ?auto_187141 ) ) ( not ( = ?auto_187140 ?auto_187142 ) ) ( not ( = ?auto_187140 ?auto_187137 ) ) ( not ( = ?auto_187138 ?auto_187141 ) ) ( not ( = ?auto_187138 ?auto_187142 ) ) ( not ( = ?auto_187138 ?auto_187137 ) ) ( ON ?auto_187139 ?auto_187138 ) ( ON ?auto_187141 ?auto_187139 ) ( ON ?auto_187137 ?auto_187141 ) ( CLEAR ?auto_187137 ) ( HOLDING ?auto_187142 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187142 )
      ( MAKE-2PILE ?auto_187135 ?auto_187136 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187153 - BLOCK
      ?auto_187154 - BLOCK
    )
    :vars
    (
      ?auto_187160 - BLOCK
      ?auto_187157 - BLOCK
      ?auto_187156 - BLOCK
      ?auto_187159 - BLOCK
      ?auto_187158 - BLOCK
      ?auto_187155 - BLOCK
      ?auto_187161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187160 ?auto_187154 ) ( ON-TABLE ?auto_187153 ) ( ON ?auto_187154 ?auto_187153 ) ( not ( = ?auto_187153 ?auto_187154 ) ) ( not ( = ?auto_187153 ?auto_187160 ) ) ( not ( = ?auto_187154 ?auto_187160 ) ) ( not ( = ?auto_187153 ?auto_187157 ) ) ( not ( = ?auto_187153 ?auto_187156 ) ) ( not ( = ?auto_187154 ?auto_187157 ) ) ( not ( = ?auto_187154 ?auto_187156 ) ) ( not ( = ?auto_187160 ?auto_187157 ) ) ( not ( = ?auto_187160 ?auto_187156 ) ) ( not ( = ?auto_187157 ?auto_187156 ) ) ( ON ?auto_187157 ?auto_187160 ) ( not ( = ?auto_187159 ?auto_187158 ) ) ( not ( = ?auto_187159 ?auto_187155 ) ) ( not ( = ?auto_187159 ?auto_187156 ) ) ( not ( = ?auto_187158 ?auto_187155 ) ) ( not ( = ?auto_187158 ?auto_187156 ) ) ( not ( = ?auto_187155 ?auto_187156 ) ) ( not ( = ?auto_187153 ?auto_187155 ) ) ( not ( = ?auto_187153 ?auto_187159 ) ) ( not ( = ?auto_187153 ?auto_187158 ) ) ( not ( = ?auto_187154 ?auto_187155 ) ) ( not ( = ?auto_187154 ?auto_187159 ) ) ( not ( = ?auto_187154 ?auto_187158 ) ) ( not ( = ?auto_187160 ?auto_187155 ) ) ( not ( = ?auto_187160 ?auto_187159 ) ) ( not ( = ?auto_187160 ?auto_187158 ) ) ( not ( = ?auto_187157 ?auto_187155 ) ) ( not ( = ?auto_187157 ?auto_187159 ) ) ( not ( = ?auto_187157 ?auto_187158 ) ) ( ON ?auto_187156 ?auto_187157 ) ( ON ?auto_187155 ?auto_187156 ) ( ON ?auto_187158 ?auto_187155 ) ( CLEAR ?auto_187158 ) ( ON ?auto_187159 ?auto_187161 ) ( CLEAR ?auto_187159 ) ( HAND-EMPTY ) ( not ( = ?auto_187153 ?auto_187161 ) ) ( not ( = ?auto_187154 ?auto_187161 ) ) ( not ( = ?auto_187160 ?auto_187161 ) ) ( not ( = ?auto_187157 ?auto_187161 ) ) ( not ( = ?auto_187156 ?auto_187161 ) ) ( not ( = ?auto_187159 ?auto_187161 ) ) ( not ( = ?auto_187158 ?auto_187161 ) ) ( not ( = ?auto_187155 ?auto_187161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187159 ?auto_187161 )
      ( MAKE-2PILE ?auto_187153 ?auto_187154 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187162 - BLOCK
      ?auto_187163 - BLOCK
    )
    :vars
    (
      ?auto_187169 - BLOCK
      ?auto_187164 - BLOCK
      ?auto_187166 - BLOCK
      ?auto_187170 - BLOCK
      ?auto_187167 - BLOCK
      ?auto_187165 - BLOCK
      ?auto_187168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187169 ?auto_187163 ) ( ON-TABLE ?auto_187162 ) ( ON ?auto_187163 ?auto_187162 ) ( not ( = ?auto_187162 ?auto_187163 ) ) ( not ( = ?auto_187162 ?auto_187169 ) ) ( not ( = ?auto_187163 ?auto_187169 ) ) ( not ( = ?auto_187162 ?auto_187164 ) ) ( not ( = ?auto_187162 ?auto_187166 ) ) ( not ( = ?auto_187163 ?auto_187164 ) ) ( not ( = ?auto_187163 ?auto_187166 ) ) ( not ( = ?auto_187169 ?auto_187164 ) ) ( not ( = ?auto_187169 ?auto_187166 ) ) ( not ( = ?auto_187164 ?auto_187166 ) ) ( ON ?auto_187164 ?auto_187169 ) ( not ( = ?auto_187170 ?auto_187167 ) ) ( not ( = ?auto_187170 ?auto_187165 ) ) ( not ( = ?auto_187170 ?auto_187166 ) ) ( not ( = ?auto_187167 ?auto_187165 ) ) ( not ( = ?auto_187167 ?auto_187166 ) ) ( not ( = ?auto_187165 ?auto_187166 ) ) ( not ( = ?auto_187162 ?auto_187165 ) ) ( not ( = ?auto_187162 ?auto_187170 ) ) ( not ( = ?auto_187162 ?auto_187167 ) ) ( not ( = ?auto_187163 ?auto_187165 ) ) ( not ( = ?auto_187163 ?auto_187170 ) ) ( not ( = ?auto_187163 ?auto_187167 ) ) ( not ( = ?auto_187169 ?auto_187165 ) ) ( not ( = ?auto_187169 ?auto_187170 ) ) ( not ( = ?auto_187169 ?auto_187167 ) ) ( not ( = ?auto_187164 ?auto_187165 ) ) ( not ( = ?auto_187164 ?auto_187170 ) ) ( not ( = ?auto_187164 ?auto_187167 ) ) ( ON ?auto_187166 ?auto_187164 ) ( ON ?auto_187165 ?auto_187166 ) ( ON ?auto_187170 ?auto_187168 ) ( CLEAR ?auto_187170 ) ( not ( = ?auto_187162 ?auto_187168 ) ) ( not ( = ?auto_187163 ?auto_187168 ) ) ( not ( = ?auto_187169 ?auto_187168 ) ) ( not ( = ?auto_187164 ?auto_187168 ) ) ( not ( = ?auto_187166 ?auto_187168 ) ) ( not ( = ?auto_187170 ?auto_187168 ) ) ( not ( = ?auto_187167 ?auto_187168 ) ) ( not ( = ?auto_187165 ?auto_187168 ) ) ( HOLDING ?auto_187167 ) ( CLEAR ?auto_187165 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187162 ?auto_187163 ?auto_187169 ?auto_187164 ?auto_187166 ?auto_187165 ?auto_187167 )
      ( MAKE-2PILE ?auto_187162 ?auto_187163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187171 - BLOCK
      ?auto_187172 - BLOCK
    )
    :vars
    (
      ?auto_187178 - BLOCK
      ?auto_187179 - BLOCK
      ?auto_187177 - BLOCK
      ?auto_187173 - BLOCK
      ?auto_187175 - BLOCK
      ?auto_187174 - BLOCK
      ?auto_187176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187178 ?auto_187172 ) ( ON-TABLE ?auto_187171 ) ( ON ?auto_187172 ?auto_187171 ) ( not ( = ?auto_187171 ?auto_187172 ) ) ( not ( = ?auto_187171 ?auto_187178 ) ) ( not ( = ?auto_187172 ?auto_187178 ) ) ( not ( = ?auto_187171 ?auto_187179 ) ) ( not ( = ?auto_187171 ?auto_187177 ) ) ( not ( = ?auto_187172 ?auto_187179 ) ) ( not ( = ?auto_187172 ?auto_187177 ) ) ( not ( = ?auto_187178 ?auto_187179 ) ) ( not ( = ?auto_187178 ?auto_187177 ) ) ( not ( = ?auto_187179 ?auto_187177 ) ) ( ON ?auto_187179 ?auto_187178 ) ( not ( = ?auto_187173 ?auto_187175 ) ) ( not ( = ?auto_187173 ?auto_187174 ) ) ( not ( = ?auto_187173 ?auto_187177 ) ) ( not ( = ?auto_187175 ?auto_187174 ) ) ( not ( = ?auto_187175 ?auto_187177 ) ) ( not ( = ?auto_187174 ?auto_187177 ) ) ( not ( = ?auto_187171 ?auto_187174 ) ) ( not ( = ?auto_187171 ?auto_187173 ) ) ( not ( = ?auto_187171 ?auto_187175 ) ) ( not ( = ?auto_187172 ?auto_187174 ) ) ( not ( = ?auto_187172 ?auto_187173 ) ) ( not ( = ?auto_187172 ?auto_187175 ) ) ( not ( = ?auto_187178 ?auto_187174 ) ) ( not ( = ?auto_187178 ?auto_187173 ) ) ( not ( = ?auto_187178 ?auto_187175 ) ) ( not ( = ?auto_187179 ?auto_187174 ) ) ( not ( = ?auto_187179 ?auto_187173 ) ) ( not ( = ?auto_187179 ?auto_187175 ) ) ( ON ?auto_187177 ?auto_187179 ) ( ON ?auto_187174 ?auto_187177 ) ( ON ?auto_187173 ?auto_187176 ) ( not ( = ?auto_187171 ?auto_187176 ) ) ( not ( = ?auto_187172 ?auto_187176 ) ) ( not ( = ?auto_187178 ?auto_187176 ) ) ( not ( = ?auto_187179 ?auto_187176 ) ) ( not ( = ?auto_187177 ?auto_187176 ) ) ( not ( = ?auto_187173 ?auto_187176 ) ) ( not ( = ?auto_187175 ?auto_187176 ) ) ( not ( = ?auto_187174 ?auto_187176 ) ) ( CLEAR ?auto_187174 ) ( ON ?auto_187175 ?auto_187173 ) ( CLEAR ?auto_187175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187176 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187176 ?auto_187173 )
      ( MAKE-2PILE ?auto_187171 ?auto_187172 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187180 - BLOCK
      ?auto_187181 - BLOCK
    )
    :vars
    (
      ?auto_187183 - BLOCK
      ?auto_187186 - BLOCK
      ?auto_187187 - BLOCK
      ?auto_187185 - BLOCK
      ?auto_187184 - BLOCK
      ?auto_187188 - BLOCK
      ?auto_187182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187183 ?auto_187181 ) ( ON-TABLE ?auto_187180 ) ( ON ?auto_187181 ?auto_187180 ) ( not ( = ?auto_187180 ?auto_187181 ) ) ( not ( = ?auto_187180 ?auto_187183 ) ) ( not ( = ?auto_187181 ?auto_187183 ) ) ( not ( = ?auto_187180 ?auto_187186 ) ) ( not ( = ?auto_187180 ?auto_187187 ) ) ( not ( = ?auto_187181 ?auto_187186 ) ) ( not ( = ?auto_187181 ?auto_187187 ) ) ( not ( = ?auto_187183 ?auto_187186 ) ) ( not ( = ?auto_187183 ?auto_187187 ) ) ( not ( = ?auto_187186 ?auto_187187 ) ) ( ON ?auto_187186 ?auto_187183 ) ( not ( = ?auto_187185 ?auto_187184 ) ) ( not ( = ?auto_187185 ?auto_187188 ) ) ( not ( = ?auto_187185 ?auto_187187 ) ) ( not ( = ?auto_187184 ?auto_187188 ) ) ( not ( = ?auto_187184 ?auto_187187 ) ) ( not ( = ?auto_187188 ?auto_187187 ) ) ( not ( = ?auto_187180 ?auto_187188 ) ) ( not ( = ?auto_187180 ?auto_187185 ) ) ( not ( = ?auto_187180 ?auto_187184 ) ) ( not ( = ?auto_187181 ?auto_187188 ) ) ( not ( = ?auto_187181 ?auto_187185 ) ) ( not ( = ?auto_187181 ?auto_187184 ) ) ( not ( = ?auto_187183 ?auto_187188 ) ) ( not ( = ?auto_187183 ?auto_187185 ) ) ( not ( = ?auto_187183 ?auto_187184 ) ) ( not ( = ?auto_187186 ?auto_187188 ) ) ( not ( = ?auto_187186 ?auto_187185 ) ) ( not ( = ?auto_187186 ?auto_187184 ) ) ( ON ?auto_187187 ?auto_187186 ) ( ON ?auto_187185 ?auto_187182 ) ( not ( = ?auto_187180 ?auto_187182 ) ) ( not ( = ?auto_187181 ?auto_187182 ) ) ( not ( = ?auto_187183 ?auto_187182 ) ) ( not ( = ?auto_187186 ?auto_187182 ) ) ( not ( = ?auto_187187 ?auto_187182 ) ) ( not ( = ?auto_187185 ?auto_187182 ) ) ( not ( = ?auto_187184 ?auto_187182 ) ) ( not ( = ?auto_187188 ?auto_187182 ) ) ( ON ?auto_187184 ?auto_187185 ) ( CLEAR ?auto_187184 ) ( ON-TABLE ?auto_187182 ) ( HOLDING ?auto_187188 ) ( CLEAR ?auto_187187 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187180 ?auto_187181 ?auto_187183 ?auto_187186 ?auto_187187 ?auto_187188 )
      ( MAKE-2PILE ?auto_187180 ?auto_187181 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187189 - BLOCK
      ?auto_187190 - BLOCK
    )
    :vars
    (
      ?auto_187196 - BLOCK
      ?auto_187197 - BLOCK
      ?auto_187193 - BLOCK
      ?auto_187195 - BLOCK
      ?auto_187194 - BLOCK
      ?auto_187192 - BLOCK
      ?auto_187191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187196 ?auto_187190 ) ( ON-TABLE ?auto_187189 ) ( ON ?auto_187190 ?auto_187189 ) ( not ( = ?auto_187189 ?auto_187190 ) ) ( not ( = ?auto_187189 ?auto_187196 ) ) ( not ( = ?auto_187190 ?auto_187196 ) ) ( not ( = ?auto_187189 ?auto_187197 ) ) ( not ( = ?auto_187189 ?auto_187193 ) ) ( not ( = ?auto_187190 ?auto_187197 ) ) ( not ( = ?auto_187190 ?auto_187193 ) ) ( not ( = ?auto_187196 ?auto_187197 ) ) ( not ( = ?auto_187196 ?auto_187193 ) ) ( not ( = ?auto_187197 ?auto_187193 ) ) ( ON ?auto_187197 ?auto_187196 ) ( not ( = ?auto_187195 ?auto_187194 ) ) ( not ( = ?auto_187195 ?auto_187192 ) ) ( not ( = ?auto_187195 ?auto_187193 ) ) ( not ( = ?auto_187194 ?auto_187192 ) ) ( not ( = ?auto_187194 ?auto_187193 ) ) ( not ( = ?auto_187192 ?auto_187193 ) ) ( not ( = ?auto_187189 ?auto_187192 ) ) ( not ( = ?auto_187189 ?auto_187195 ) ) ( not ( = ?auto_187189 ?auto_187194 ) ) ( not ( = ?auto_187190 ?auto_187192 ) ) ( not ( = ?auto_187190 ?auto_187195 ) ) ( not ( = ?auto_187190 ?auto_187194 ) ) ( not ( = ?auto_187196 ?auto_187192 ) ) ( not ( = ?auto_187196 ?auto_187195 ) ) ( not ( = ?auto_187196 ?auto_187194 ) ) ( not ( = ?auto_187197 ?auto_187192 ) ) ( not ( = ?auto_187197 ?auto_187195 ) ) ( not ( = ?auto_187197 ?auto_187194 ) ) ( ON ?auto_187193 ?auto_187197 ) ( ON ?auto_187195 ?auto_187191 ) ( not ( = ?auto_187189 ?auto_187191 ) ) ( not ( = ?auto_187190 ?auto_187191 ) ) ( not ( = ?auto_187196 ?auto_187191 ) ) ( not ( = ?auto_187197 ?auto_187191 ) ) ( not ( = ?auto_187193 ?auto_187191 ) ) ( not ( = ?auto_187195 ?auto_187191 ) ) ( not ( = ?auto_187194 ?auto_187191 ) ) ( not ( = ?auto_187192 ?auto_187191 ) ) ( ON ?auto_187194 ?auto_187195 ) ( ON-TABLE ?auto_187191 ) ( CLEAR ?auto_187193 ) ( ON ?auto_187192 ?auto_187194 ) ( CLEAR ?auto_187192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187191 ?auto_187195 ?auto_187194 )
      ( MAKE-2PILE ?auto_187189 ?auto_187190 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187247 - BLOCK
      ?auto_187248 - BLOCK
      ?auto_187249 - BLOCK
      ?auto_187250 - BLOCK
      ?auto_187251 - BLOCK
      ?auto_187252 - BLOCK
    )
    :vars
    (
      ?auto_187253 - BLOCK
      ?auto_187254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187247 ) ( ON ?auto_187248 ?auto_187247 ) ( ON ?auto_187249 ?auto_187248 ) ( ON ?auto_187250 ?auto_187249 ) ( not ( = ?auto_187247 ?auto_187248 ) ) ( not ( = ?auto_187247 ?auto_187249 ) ) ( not ( = ?auto_187247 ?auto_187250 ) ) ( not ( = ?auto_187247 ?auto_187251 ) ) ( not ( = ?auto_187247 ?auto_187252 ) ) ( not ( = ?auto_187248 ?auto_187249 ) ) ( not ( = ?auto_187248 ?auto_187250 ) ) ( not ( = ?auto_187248 ?auto_187251 ) ) ( not ( = ?auto_187248 ?auto_187252 ) ) ( not ( = ?auto_187249 ?auto_187250 ) ) ( not ( = ?auto_187249 ?auto_187251 ) ) ( not ( = ?auto_187249 ?auto_187252 ) ) ( not ( = ?auto_187250 ?auto_187251 ) ) ( not ( = ?auto_187250 ?auto_187252 ) ) ( not ( = ?auto_187251 ?auto_187252 ) ) ( ON ?auto_187252 ?auto_187253 ) ( not ( = ?auto_187247 ?auto_187253 ) ) ( not ( = ?auto_187248 ?auto_187253 ) ) ( not ( = ?auto_187249 ?auto_187253 ) ) ( not ( = ?auto_187250 ?auto_187253 ) ) ( not ( = ?auto_187251 ?auto_187253 ) ) ( not ( = ?auto_187252 ?auto_187253 ) ) ( CLEAR ?auto_187250 ) ( ON ?auto_187251 ?auto_187252 ) ( CLEAR ?auto_187251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187254 ) ( ON ?auto_187253 ?auto_187254 ) ( not ( = ?auto_187254 ?auto_187253 ) ) ( not ( = ?auto_187254 ?auto_187252 ) ) ( not ( = ?auto_187254 ?auto_187251 ) ) ( not ( = ?auto_187247 ?auto_187254 ) ) ( not ( = ?auto_187248 ?auto_187254 ) ) ( not ( = ?auto_187249 ?auto_187254 ) ) ( not ( = ?auto_187250 ?auto_187254 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187254 ?auto_187253 ?auto_187252 )
      ( MAKE-6PILE ?auto_187247 ?auto_187248 ?auto_187249 ?auto_187250 ?auto_187251 ?auto_187252 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187255 - BLOCK
      ?auto_187256 - BLOCK
      ?auto_187257 - BLOCK
      ?auto_187258 - BLOCK
      ?auto_187259 - BLOCK
      ?auto_187260 - BLOCK
    )
    :vars
    (
      ?auto_187262 - BLOCK
      ?auto_187261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187255 ) ( ON ?auto_187256 ?auto_187255 ) ( ON ?auto_187257 ?auto_187256 ) ( not ( = ?auto_187255 ?auto_187256 ) ) ( not ( = ?auto_187255 ?auto_187257 ) ) ( not ( = ?auto_187255 ?auto_187258 ) ) ( not ( = ?auto_187255 ?auto_187259 ) ) ( not ( = ?auto_187255 ?auto_187260 ) ) ( not ( = ?auto_187256 ?auto_187257 ) ) ( not ( = ?auto_187256 ?auto_187258 ) ) ( not ( = ?auto_187256 ?auto_187259 ) ) ( not ( = ?auto_187256 ?auto_187260 ) ) ( not ( = ?auto_187257 ?auto_187258 ) ) ( not ( = ?auto_187257 ?auto_187259 ) ) ( not ( = ?auto_187257 ?auto_187260 ) ) ( not ( = ?auto_187258 ?auto_187259 ) ) ( not ( = ?auto_187258 ?auto_187260 ) ) ( not ( = ?auto_187259 ?auto_187260 ) ) ( ON ?auto_187260 ?auto_187262 ) ( not ( = ?auto_187255 ?auto_187262 ) ) ( not ( = ?auto_187256 ?auto_187262 ) ) ( not ( = ?auto_187257 ?auto_187262 ) ) ( not ( = ?auto_187258 ?auto_187262 ) ) ( not ( = ?auto_187259 ?auto_187262 ) ) ( not ( = ?auto_187260 ?auto_187262 ) ) ( ON ?auto_187259 ?auto_187260 ) ( CLEAR ?auto_187259 ) ( ON-TABLE ?auto_187261 ) ( ON ?auto_187262 ?auto_187261 ) ( not ( = ?auto_187261 ?auto_187262 ) ) ( not ( = ?auto_187261 ?auto_187260 ) ) ( not ( = ?auto_187261 ?auto_187259 ) ) ( not ( = ?auto_187255 ?auto_187261 ) ) ( not ( = ?auto_187256 ?auto_187261 ) ) ( not ( = ?auto_187257 ?auto_187261 ) ) ( not ( = ?auto_187258 ?auto_187261 ) ) ( HOLDING ?auto_187258 ) ( CLEAR ?auto_187257 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187255 ?auto_187256 ?auto_187257 ?auto_187258 )
      ( MAKE-6PILE ?auto_187255 ?auto_187256 ?auto_187257 ?auto_187258 ?auto_187259 ?auto_187260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187263 - BLOCK
      ?auto_187264 - BLOCK
      ?auto_187265 - BLOCK
      ?auto_187266 - BLOCK
      ?auto_187267 - BLOCK
      ?auto_187268 - BLOCK
    )
    :vars
    (
      ?auto_187270 - BLOCK
      ?auto_187269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187263 ) ( ON ?auto_187264 ?auto_187263 ) ( ON ?auto_187265 ?auto_187264 ) ( not ( = ?auto_187263 ?auto_187264 ) ) ( not ( = ?auto_187263 ?auto_187265 ) ) ( not ( = ?auto_187263 ?auto_187266 ) ) ( not ( = ?auto_187263 ?auto_187267 ) ) ( not ( = ?auto_187263 ?auto_187268 ) ) ( not ( = ?auto_187264 ?auto_187265 ) ) ( not ( = ?auto_187264 ?auto_187266 ) ) ( not ( = ?auto_187264 ?auto_187267 ) ) ( not ( = ?auto_187264 ?auto_187268 ) ) ( not ( = ?auto_187265 ?auto_187266 ) ) ( not ( = ?auto_187265 ?auto_187267 ) ) ( not ( = ?auto_187265 ?auto_187268 ) ) ( not ( = ?auto_187266 ?auto_187267 ) ) ( not ( = ?auto_187266 ?auto_187268 ) ) ( not ( = ?auto_187267 ?auto_187268 ) ) ( ON ?auto_187268 ?auto_187270 ) ( not ( = ?auto_187263 ?auto_187270 ) ) ( not ( = ?auto_187264 ?auto_187270 ) ) ( not ( = ?auto_187265 ?auto_187270 ) ) ( not ( = ?auto_187266 ?auto_187270 ) ) ( not ( = ?auto_187267 ?auto_187270 ) ) ( not ( = ?auto_187268 ?auto_187270 ) ) ( ON ?auto_187267 ?auto_187268 ) ( ON-TABLE ?auto_187269 ) ( ON ?auto_187270 ?auto_187269 ) ( not ( = ?auto_187269 ?auto_187270 ) ) ( not ( = ?auto_187269 ?auto_187268 ) ) ( not ( = ?auto_187269 ?auto_187267 ) ) ( not ( = ?auto_187263 ?auto_187269 ) ) ( not ( = ?auto_187264 ?auto_187269 ) ) ( not ( = ?auto_187265 ?auto_187269 ) ) ( not ( = ?auto_187266 ?auto_187269 ) ) ( CLEAR ?auto_187265 ) ( ON ?auto_187266 ?auto_187267 ) ( CLEAR ?auto_187266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187269 ?auto_187270 ?auto_187268 ?auto_187267 )
      ( MAKE-6PILE ?auto_187263 ?auto_187264 ?auto_187265 ?auto_187266 ?auto_187267 ?auto_187268 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187271 - BLOCK
      ?auto_187272 - BLOCK
      ?auto_187273 - BLOCK
      ?auto_187274 - BLOCK
      ?auto_187275 - BLOCK
      ?auto_187276 - BLOCK
    )
    :vars
    (
      ?auto_187277 - BLOCK
      ?auto_187278 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187271 ) ( ON ?auto_187272 ?auto_187271 ) ( not ( = ?auto_187271 ?auto_187272 ) ) ( not ( = ?auto_187271 ?auto_187273 ) ) ( not ( = ?auto_187271 ?auto_187274 ) ) ( not ( = ?auto_187271 ?auto_187275 ) ) ( not ( = ?auto_187271 ?auto_187276 ) ) ( not ( = ?auto_187272 ?auto_187273 ) ) ( not ( = ?auto_187272 ?auto_187274 ) ) ( not ( = ?auto_187272 ?auto_187275 ) ) ( not ( = ?auto_187272 ?auto_187276 ) ) ( not ( = ?auto_187273 ?auto_187274 ) ) ( not ( = ?auto_187273 ?auto_187275 ) ) ( not ( = ?auto_187273 ?auto_187276 ) ) ( not ( = ?auto_187274 ?auto_187275 ) ) ( not ( = ?auto_187274 ?auto_187276 ) ) ( not ( = ?auto_187275 ?auto_187276 ) ) ( ON ?auto_187276 ?auto_187277 ) ( not ( = ?auto_187271 ?auto_187277 ) ) ( not ( = ?auto_187272 ?auto_187277 ) ) ( not ( = ?auto_187273 ?auto_187277 ) ) ( not ( = ?auto_187274 ?auto_187277 ) ) ( not ( = ?auto_187275 ?auto_187277 ) ) ( not ( = ?auto_187276 ?auto_187277 ) ) ( ON ?auto_187275 ?auto_187276 ) ( ON-TABLE ?auto_187278 ) ( ON ?auto_187277 ?auto_187278 ) ( not ( = ?auto_187278 ?auto_187277 ) ) ( not ( = ?auto_187278 ?auto_187276 ) ) ( not ( = ?auto_187278 ?auto_187275 ) ) ( not ( = ?auto_187271 ?auto_187278 ) ) ( not ( = ?auto_187272 ?auto_187278 ) ) ( not ( = ?auto_187273 ?auto_187278 ) ) ( not ( = ?auto_187274 ?auto_187278 ) ) ( ON ?auto_187274 ?auto_187275 ) ( CLEAR ?auto_187274 ) ( HOLDING ?auto_187273 ) ( CLEAR ?auto_187272 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187271 ?auto_187272 ?auto_187273 )
      ( MAKE-6PILE ?auto_187271 ?auto_187272 ?auto_187273 ?auto_187274 ?auto_187275 ?auto_187276 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187279 - BLOCK
      ?auto_187280 - BLOCK
      ?auto_187281 - BLOCK
      ?auto_187282 - BLOCK
      ?auto_187283 - BLOCK
      ?auto_187284 - BLOCK
    )
    :vars
    (
      ?auto_187285 - BLOCK
      ?auto_187286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187279 ) ( ON ?auto_187280 ?auto_187279 ) ( not ( = ?auto_187279 ?auto_187280 ) ) ( not ( = ?auto_187279 ?auto_187281 ) ) ( not ( = ?auto_187279 ?auto_187282 ) ) ( not ( = ?auto_187279 ?auto_187283 ) ) ( not ( = ?auto_187279 ?auto_187284 ) ) ( not ( = ?auto_187280 ?auto_187281 ) ) ( not ( = ?auto_187280 ?auto_187282 ) ) ( not ( = ?auto_187280 ?auto_187283 ) ) ( not ( = ?auto_187280 ?auto_187284 ) ) ( not ( = ?auto_187281 ?auto_187282 ) ) ( not ( = ?auto_187281 ?auto_187283 ) ) ( not ( = ?auto_187281 ?auto_187284 ) ) ( not ( = ?auto_187282 ?auto_187283 ) ) ( not ( = ?auto_187282 ?auto_187284 ) ) ( not ( = ?auto_187283 ?auto_187284 ) ) ( ON ?auto_187284 ?auto_187285 ) ( not ( = ?auto_187279 ?auto_187285 ) ) ( not ( = ?auto_187280 ?auto_187285 ) ) ( not ( = ?auto_187281 ?auto_187285 ) ) ( not ( = ?auto_187282 ?auto_187285 ) ) ( not ( = ?auto_187283 ?auto_187285 ) ) ( not ( = ?auto_187284 ?auto_187285 ) ) ( ON ?auto_187283 ?auto_187284 ) ( ON-TABLE ?auto_187286 ) ( ON ?auto_187285 ?auto_187286 ) ( not ( = ?auto_187286 ?auto_187285 ) ) ( not ( = ?auto_187286 ?auto_187284 ) ) ( not ( = ?auto_187286 ?auto_187283 ) ) ( not ( = ?auto_187279 ?auto_187286 ) ) ( not ( = ?auto_187280 ?auto_187286 ) ) ( not ( = ?auto_187281 ?auto_187286 ) ) ( not ( = ?auto_187282 ?auto_187286 ) ) ( ON ?auto_187282 ?auto_187283 ) ( CLEAR ?auto_187280 ) ( ON ?auto_187281 ?auto_187282 ) ( CLEAR ?auto_187281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187286 ?auto_187285 ?auto_187284 ?auto_187283 ?auto_187282 )
      ( MAKE-6PILE ?auto_187279 ?auto_187280 ?auto_187281 ?auto_187282 ?auto_187283 ?auto_187284 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187287 - BLOCK
      ?auto_187288 - BLOCK
      ?auto_187289 - BLOCK
      ?auto_187290 - BLOCK
      ?auto_187291 - BLOCK
      ?auto_187292 - BLOCK
    )
    :vars
    (
      ?auto_187294 - BLOCK
      ?auto_187293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187287 ) ( not ( = ?auto_187287 ?auto_187288 ) ) ( not ( = ?auto_187287 ?auto_187289 ) ) ( not ( = ?auto_187287 ?auto_187290 ) ) ( not ( = ?auto_187287 ?auto_187291 ) ) ( not ( = ?auto_187287 ?auto_187292 ) ) ( not ( = ?auto_187288 ?auto_187289 ) ) ( not ( = ?auto_187288 ?auto_187290 ) ) ( not ( = ?auto_187288 ?auto_187291 ) ) ( not ( = ?auto_187288 ?auto_187292 ) ) ( not ( = ?auto_187289 ?auto_187290 ) ) ( not ( = ?auto_187289 ?auto_187291 ) ) ( not ( = ?auto_187289 ?auto_187292 ) ) ( not ( = ?auto_187290 ?auto_187291 ) ) ( not ( = ?auto_187290 ?auto_187292 ) ) ( not ( = ?auto_187291 ?auto_187292 ) ) ( ON ?auto_187292 ?auto_187294 ) ( not ( = ?auto_187287 ?auto_187294 ) ) ( not ( = ?auto_187288 ?auto_187294 ) ) ( not ( = ?auto_187289 ?auto_187294 ) ) ( not ( = ?auto_187290 ?auto_187294 ) ) ( not ( = ?auto_187291 ?auto_187294 ) ) ( not ( = ?auto_187292 ?auto_187294 ) ) ( ON ?auto_187291 ?auto_187292 ) ( ON-TABLE ?auto_187293 ) ( ON ?auto_187294 ?auto_187293 ) ( not ( = ?auto_187293 ?auto_187294 ) ) ( not ( = ?auto_187293 ?auto_187292 ) ) ( not ( = ?auto_187293 ?auto_187291 ) ) ( not ( = ?auto_187287 ?auto_187293 ) ) ( not ( = ?auto_187288 ?auto_187293 ) ) ( not ( = ?auto_187289 ?auto_187293 ) ) ( not ( = ?auto_187290 ?auto_187293 ) ) ( ON ?auto_187290 ?auto_187291 ) ( ON ?auto_187289 ?auto_187290 ) ( CLEAR ?auto_187289 ) ( HOLDING ?auto_187288 ) ( CLEAR ?auto_187287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187287 ?auto_187288 )
      ( MAKE-6PILE ?auto_187287 ?auto_187288 ?auto_187289 ?auto_187290 ?auto_187291 ?auto_187292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187295 - BLOCK
      ?auto_187296 - BLOCK
      ?auto_187297 - BLOCK
      ?auto_187298 - BLOCK
      ?auto_187299 - BLOCK
      ?auto_187300 - BLOCK
    )
    :vars
    (
      ?auto_187302 - BLOCK
      ?auto_187301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187295 ) ( not ( = ?auto_187295 ?auto_187296 ) ) ( not ( = ?auto_187295 ?auto_187297 ) ) ( not ( = ?auto_187295 ?auto_187298 ) ) ( not ( = ?auto_187295 ?auto_187299 ) ) ( not ( = ?auto_187295 ?auto_187300 ) ) ( not ( = ?auto_187296 ?auto_187297 ) ) ( not ( = ?auto_187296 ?auto_187298 ) ) ( not ( = ?auto_187296 ?auto_187299 ) ) ( not ( = ?auto_187296 ?auto_187300 ) ) ( not ( = ?auto_187297 ?auto_187298 ) ) ( not ( = ?auto_187297 ?auto_187299 ) ) ( not ( = ?auto_187297 ?auto_187300 ) ) ( not ( = ?auto_187298 ?auto_187299 ) ) ( not ( = ?auto_187298 ?auto_187300 ) ) ( not ( = ?auto_187299 ?auto_187300 ) ) ( ON ?auto_187300 ?auto_187302 ) ( not ( = ?auto_187295 ?auto_187302 ) ) ( not ( = ?auto_187296 ?auto_187302 ) ) ( not ( = ?auto_187297 ?auto_187302 ) ) ( not ( = ?auto_187298 ?auto_187302 ) ) ( not ( = ?auto_187299 ?auto_187302 ) ) ( not ( = ?auto_187300 ?auto_187302 ) ) ( ON ?auto_187299 ?auto_187300 ) ( ON-TABLE ?auto_187301 ) ( ON ?auto_187302 ?auto_187301 ) ( not ( = ?auto_187301 ?auto_187302 ) ) ( not ( = ?auto_187301 ?auto_187300 ) ) ( not ( = ?auto_187301 ?auto_187299 ) ) ( not ( = ?auto_187295 ?auto_187301 ) ) ( not ( = ?auto_187296 ?auto_187301 ) ) ( not ( = ?auto_187297 ?auto_187301 ) ) ( not ( = ?auto_187298 ?auto_187301 ) ) ( ON ?auto_187298 ?auto_187299 ) ( ON ?auto_187297 ?auto_187298 ) ( CLEAR ?auto_187295 ) ( ON ?auto_187296 ?auto_187297 ) ( CLEAR ?auto_187296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187301 ?auto_187302 ?auto_187300 ?auto_187299 ?auto_187298 ?auto_187297 )
      ( MAKE-6PILE ?auto_187295 ?auto_187296 ?auto_187297 ?auto_187298 ?auto_187299 ?auto_187300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187303 - BLOCK
      ?auto_187304 - BLOCK
      ?auto_187305 - BLOCK
      ?auto_187306 - BLOCK
      ?auto_187307 - BLOCK
      ?auto_187308 - BLOCK
    )
    :vars
    (
      ?auto_187310 - BLOCK
      ?auto_187309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187303 ?auto_187304 ) ) ( not ( = ?auto_187303 ?auto_187305 ) ) ( not ( = ?auto_187303 ?auto_187306 ) ) ( not ( = ?auto_187303 ?auto_187307 ) ) ( not ( = ?auto_187303 ?auto_187308 ) ) ( not ( = ?auto_187304 ?auto_187305 ) ) ( not ( = ?auto_187304 ?auto_187306 ) ) ( not ( = ?auto_187304 ?auto_187307 ) ) ( not ( = ?auto_187304 ?auto_187308 ) ) ( not ( = ?auto_187305 ?auto_187306 ) ) ( not ( = ?auto_187305 ?auto_187307 ) ) ( not ( = ?auto_187305 ?auto_187308 ) ) ( not ( = ?auto_187306 ?auto_187307 ) ) ( not ( = ?auto_187306 ?auto_187308 ) ) ( not ( = ?auto_187307 ?auto_187308 ) ) ( ON ?auto_187308 ?auto_187310 ) ( not ( = ?auto_187303 ?auto_187310 ) ) ( not ( = ?auto_187304 ?auto_187310 ) ) ( not ( = ?auto_187305 ?auto_187310 ) ) ( not ( = ?auto_187306 ?auto_187310 ) ) ( not ( = ?auto_187307 ?auto_187310 ) ) ( not ( = ?auto_187308 ?auto_187310 ) ) ( ON ?auto_187307 ?auto_187308 ) ( ON-TABLE ?auto_187309 ) ( ON ?auto_187310 ?auto_187309 ) ( not ( = ?auto_187309 ?auto_187310 ) ) ( not ( = ?auto_187309 ?auto_187308 ) ) ( not ( = ?auto_187309 ?auto_187307 ) ) ( not ( = ?auto_187303 ?auto_187309 ) ) ( not ( = ?auto_187304 ?auto_187309 ) ) ( not ( = ?auto_187305 ?auto_187309 ) ) ( not ( = ?auto_187306 ?auto_187309 ) ) ( ON ?auto_187306 ?auto_187307 ) ( ON ?auto_187305 ?auto_187306 ) ( ON ?auto_187304 ?auto_187305 ) ( CLEAR ?auto_187304 ) ( HOLDING ?auto_187303 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187303 )
      ( MAKE-6PILE ?auto_187303 ?auto_187304 ?auto_187305 ?auto_187306 ?auto_187307 ?auto_187308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187311 - BLOCK
      ?auto_187312 - BLOCK
      ?auto_187313 - BLOCK
      ?auto_187314 - BLOCK
      ?auto_187315 - BLOCK
      ?auto_187316 - BLOCK
    )
    :vars
    (
      ?auto_187318 - BLOCK
      ?auto_187317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187311 ?auto_187312 ) ) ( not ( = ?auto_187311 ?auto_187313 ) ) ( not ( = ?auto_187311 ?auto_187314 ) ) ( not ( = ?auto_187311 ?auto_187315 ) ) ( not ( = ?auto_187311 ?auto_187316 ) ) ( not ( = ?auto_187312 ?auto_187313 ) ) ( not ( = ?auto_187312 ?auto_187314 ) ) ( not ( = ?auto_187312 ?auto_187315 ) ) ( not ( = ?auto_187312 ?auto_187316 ) ) ( not ( = ?auto_187313 ?auto_187314 ) ) ( not ( = ?auto_187313 ?auto_187315 ) ) ( not ( = ?auto_187313 ?auto_187316 ) ) ( not ( = ?auto_187314 ?auto_187315 ) ) ( not ( = ?auto_187314 ?auto_187316 ) ) ( not ( = ?auto_187315 ?auto_187316 ) ) ( ON ?auto_187316 ?auto_187318 ) ( not ( = ?auto_187311 ?auto_187318 ) ) ( not ( = ?auto_187312 ?auto_187318 ) ) ( not ( = ?auto_187313 ?auto_187318 ) ) ( not ( = ?auto_187314 ?auto_187318 ) ) ( not ( = ?auto_187315 ?auto_187318 ) ) ( not ( = ?auto_187316 ?auto_187318 ) ) ( ON ?auto_187315 ?auto_187316 ) ( ON-TABLE ?auto_187317 ) ( ON ?auto_187318 ?auto_187317 ) ( not ( = ?auto_187317 ?auto_187318 ) ) ( not ( = ?auto_187317 ?auto_187316 ) ) ( not ( = ?auto_187317 ?auto_187315 ) ) ( not ( = ?auto_187311 ?auto_187317 ) ) ( not ( = ?auto_187312 ?auto_187317 ) ) ( not ( = ?auto_187313 ?auto_187317 ) ) ( not ( = ?auto_187314 ?auto_187317 ) ) ( ON ?auto_187314 ?auto_187315 ) ( ON ?auto_187313 ?auto_187314 ) ( ON ?auto_187312 ?auto_187313 ) ( ON ?auto_187311 ?auto_187312 ) ( CLEAR ?auto_187311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187317 ?auto_187318 ?auto_187316 ?auto_187315 ?auto_187314 ?auto_187313 ?auto_187312 )
      ( MAKE-6PILE ?auto_187311 ?auto_187312 ?auto_187313 ?auto_187314 ?auto_187315 ?auto_187316 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187325 - BLOCK
      ?auto_187326 - BLOCK
      ?auto_187327 - BLOCK
      ?auto_187328 - BLOCK
      ?auto_187329 - BLOCK
      ?auto_187330 - BLOCK
    )
    :vars
    (
      ?auto_187332 - BLOCK
      ?auto_187331 - BLOCK
      ?auto_187333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187325 ?auto_187326 ) ) ( not ( = ?auto_187325 ?auto_187327 ) ) ( not ( = ?auto_187325 ?auto_187328 ) ) ( not ( = ?auto_187325 ?auto_187329 ) ) ( not ( = ?auto_187325 ?auto_187330 ) ) ( not ( = ?auto_187326 ?auto_187327 ) ) ( not ( = ?auto_187326 ?auto_187328 ) ) ( not ( = ?auto_187326 ?auto_187329 ) ) ( not ( = ?auto_187326 ?auto_187330 ) ) ( not ( = ?auto_187327 ?auto_187328 ) ) ( not ( = ?auto_187327 ?auto_187329 ) ) ( not ( = ?auto_187327 ?auto_187330 ) ) ( not ( = ?auto_187328 ?auto_187329 ) ) ( not ( = ?auto_187328 ?auto_187330 ) ) ( not ( = ?auto_187329 ?auto_187330 ) ) ( ON ?auto_187330 ?auto_187332 ) ( not ( = ?auto_187325 ?auto_187332 ) ) ( not ( = ?auto_187326 ?auto_187332 ) ) ( not ( = ?auto_187327 ?auto_187332 ) ) ( not ( = ?auto_187328 ?auto_187332 ) ) ( not ( = ?auto_187329 ?auto_187332 ) ) ( not ( = ?auto_187330 ?auto_187332 ) ) ( ON ?auto_187329 ?auto_187330 ) ( ON-TABLE ?auto_187331 ) ( ON ?auto_187332 ?auto_187331 ) ( not ( = ?auto_187331 ?auto_187332 ) ) ( not ( = ?auto_187331 ?auto_187330 ) ) ( not ( = ?auto_187331 ?auto_187329 ) ) ( not ( = ?auto_187325 ?auto_187331 ) ) ( not ( = ?auto_187326 ?auto_187331 ) ) ( not ( = ?auto_187327 ?auto_187331 ) ) ( not ( = ?auto_187328 ?auto_187331 ) ) ( ON ?auto_187328 ?auto_187329 ) ( ON ?auto_187327 ?auto_187328 ) ( ON ?auto_187326 ?auto_187327 ) ( CLEAR ?auto_187326 ) ( ON ?auto_187325 ?auto_187333 ) ( CLEAR ?auto_187325 ) ( HAND-EMPTY ) ( not ( = ?auto_187325 ?auto_187333 ) ) ( not ( = ?auto_187326 ?auto_187333 ) ) ( not ( = ?auto_187327 ?auto_187333 ) ) ( not ( = ?auto_187328 ?auto_187333 ) ) ( not ( = ?auto_187329 ?auto_187333 ) ) ( not ( = ?auto_187330 ?auto_187333 ) ) ( not ( = ?auto_187332 ?auto_187333 ) ) ( not ( = ?auto_187331 ?auto_187333 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187325 ?auto_187333 )
      ( MAKE-6PILE ?auto_187325 ?auto_187326 ?auto_187327 ?auto_187328 ?auto_187329 ?auto_187330 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187334 - BLOCK
      ?auto_187335 - BLOCK
      ?auto_187336 - BLOCK
      ?auto_187337 - BLOCK
      ?auto_187338 - BLOCK
      ?auto_187339 - BLOCK
    )
    :vars
    (
      ?auto_187341 - BLOCK
      ?auto_187340 - BLOCK
      ?auto_187342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187334 ?auto_187335 ) ) ( not ( = ?auto_187334 ?auto_187336 ) ) ( not ( = ?auto_187334 ?auto_187337 ) ) ( not ( = ?auto_187334 ?auto_187338 ) ) ( not ( = ?auto_187334 ?auto_187339 ) ) ( not ( = ?auto_187335 ?auto_187336 ) ) ( not ( = ?auto_187335 ?auto_187337 ) ) ( not ( = ?auto_187335 ?auto_187338 ) ) ( not ( = ?auto_187335 ?auto_187339 ) ) ( not ( = ?auto_187336 ?auto_187337 ) ) ( not ( = ?auto_187336 ?auto_187338 ) ) ( not ( = ?auto_187336 ?auto_187339 ) ) ( not ( = ?auto_187337 ?auto_187338 ) ) ( not ( = ?auto_187337 ?auto_187339 ) ) ( not ( = ?auto_187338 ?auto_187339 ) ) ( ON ?auto_187339 ?auto_187341 ) ( not ( = ?auto_187334 ?auto_187341 ) ) ( not ( = ?auto_187335 ?auto_187341 ) ) ( not ( = ?auto_187336 ?auto_187341 ) ) ( not ( = ?auto_187337 ?auto_187341 ) ) ( not ( = ?auto_187338 ?auto_187341 ) ) ( not ( = ?auto_187339 ?auto_187341 ) ) ( ON ?auto_187338 ?auto_187339 ) ( ON-TABLE ?auto_187340 ) ( ON ?auto_187341 ?auto_187340 ) ( not ( = ?auto_187340 ?auto_187341 ) ) ( not ( = ?auto_187340 ?auto_187339 ) ) ( not ( = ?auto_187340 ?auto_187338 ) ) ( not ( = ?auto_187334 ?auto_187340 ) ) ( not ( = ?auto_187335 ?auto_187340 ) ) ( not ( = ?auto_187336 ?auto_187340 ) ) ( not ( = ?auto_187337 ?auto_187340 ) ) ( ON ?auto_187337 ?auto_187338 ) ( ON ?auto_187336 ?auto_187337 ) ( ON ?auto_187334 ?auto_187342 ) ( CLEAR ?auto_187334 ) ( not ( = ?auto_187334 ?auto_187342 ) ) ( not ( = ?auto_187335 ?auto_187342 ) ) ( not ( = ?auto_187336 ?auto_187342 ) ) ( not ( = ?auto_187337 ?auto_187342 ) ) ( not ( = ?auto_187338 ?auto_187342 ) ) ( not ( = ?auto_187339 ?auto_187342 ) ) ( not ( = ?auto_187341 ?auto_187342 ) ) ( not ( = ?auto_187340 ?auto_187342 ) ) ( HOLDING ?auto_187335 ) ( CLEAR ?auto_187336 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187340 ?auto_187341 ?auto_187339 ?auto_187338 ?auto_187337 ?auto_187336 ?auto_187335 )
      ( MAKE-6PILE ?auto_187334 ?auto_187335 ?auto_187336 ?auto_187337 ?auto_187338 ?auto_187339 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187343 - BLOCK
      ?auto_187344 - BLOCK
      ?auto_187345 - BLOCK
      ?auto_187346 - BLOCK
      ?auto_187347 - BLOCK
      ?auto_187348 - BLOCK
    )
    :vars
    (
      ?auto_187350 - BLOCK
      ?auto_187351 - BLOCK
      ?auto_187349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187343 ?auto_187344 ) ) ( not ( = ?auto_187343 ?auto_187345 ) ) ( not ( = ?auto_187343 ?auto_187346 ) ) ( not ( = ?auto_187343 ?auto_187347 ) ) ( not ( = ?auto_187343 ?auto_187348 ) ) ( not ( = ?auto_187344 ?auto_187345 ) ) ( not ( = ?auto_187344 ?auto_187346 ) ) ( not ( = ?auto_187344 ?auto_187347 ) ) ( not ( = ?auto_187344 ?auto_187348 ) ) ( not ( = ?auto_187345 ?auto_187346 ) ) ( not ( = ?auto_187345 ?auto_187347 ) ) ( not ( = ?auto_187345 ?auto_187348 ) ) ( not ( = ?auto_187346 ?auto_187347 ) ) ( not ( = ?auto_187346 ?auto_187348 ) ) ( not ( = ?auto_187347 ?auto_187348 ) ) ( ON ?auto_187348 ?auto_187350 ) ( not ( = ?auto_187343 ?auto_187350 ) ) ( not ( = ?auto_187344 ?auto_187350 ) ) ( not ( = ?auto_187345 ?auto_187350 ) ) ( not ( = ?auto_187346 ?auto_187350 ) ) ( not ( = ?auto_187347 ?auto_187350 ) ) ( not ( = ?auto_187348 ?auto_187350 ) ) ( ON ?auto_187347 ?auto_187348 ) ( ON-TABLE ?auto_187351 ) ( ON ?auto_187350 ?auto_187351 ) ( not ( = ?auto_187351 ?auto_187350 ) ) ( not ( = ?auto_187351 ?auto_187348 ) ) ( not ( = ?auto_187351 ?auto_187347 ) ) ( not ( = ?auto_187343 ?auto_187351 ) ) ( not ( = ?auto_187344 ?auto_187351 ) ) ( not ( = ?auto_187345 ?auto_187351 ) ) ( not ( = ?auto_187346 ?auto_187351 ) ) ( ON ?auto_187346 ?auto_187347 ) ( ON ?auto_187345 ?auto_187346 ) ( ON ?auto_187343 ?auto_187349 ) ( not ( = ?auto_187343 ?auto_187349 ) ) ( not ( = ?auto_187344 ?auto_187349 ) ) ( not ( = ?auto_187345 ?auto_187349 ) ) ( not ( = ?auto_187346 ?auto_187349 ) ) ( not ( = ?auto_187347 ?auto_187349 ) ) ( not ( = ?auto_187348 ?auto_187349 ) ) ( not ( = ?auto_187350 ?auto_187349 ) ) ( not ( = ?auto_187351 ?auto_187349 ) ) ( CLEAR ?auto_187345 ) ( ON ?auto_187344 ?auto_187343 ) ( CLEAR ?auto_187344 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187349 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187349 ?auto_187343 )
      ( MAKE-6PILE ?auto_187343 ?auto_187344 ?auto_187345 ?auto_187346 ?auto_187347 ?auto_187348 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187352 - BLOCK
      ?auto_187353 - BLOCK
      ?auto_187354 - BLOCK
      ?auto_187355 - BLOCK
      ?auto_187356 - BLOCK
      ?auto_187357 - BLOCK
    )
    :vars
    (
      ?auto_187360 - BLOCK
      ?auto_187358 - BLOCK
      ?auto_187359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187352 ?auto_187353 ) ) ( not ( = ?auto_187352 ?auto_187354 ) ) ( not ( = ?auto_187352 ?auto_187355 ) ) ( not ( = ?auto_187352 ?auto_187356 ) ) ( not ( = ?auto_187352 ?auto_187357 ) ) ( not ( = ?auto_187353 ?auto_187354 ) ) ( not ( = ?auto_187353 ?auto_187355 ) ) ( not ( = ?auto_187353 ?auto_187356 ) ) ( not ( = ?auto_187353 ?auto_187357 ) ) ( not ( = ?auto_187354 ?auto_187355 ) ) ( not ( = ?auto_187354 ?auto_187356 ) ) ( not ( = ?auto_187354 ?auto_187357 ) ) ( not ( = ?auto_187355 ?auto_187356 ) ) ( not ( = ?auto_187355 ?auto_187357 ) ) ( not ( = ?auto_187356 ?auto_187357 ) ) ( ON ?auto_187357 ?auto_187360 ) ( not ( = ?auto_187352 ?auto_187360 ) ) ( not ( = ?auto_187353 ?auto_187360 ) ) ( not ( = ?auto_187354 ?auto_187360 ) ) ( not ( = ?auto_187355 ?auto_187360 ) ) ( not ( = ?auto_187356 ?auto_187360 ) ) ( not ( = ?auto_187357 ?auto_187360 ) ) ( ON ?auto_187356 ?auto_187357 ) ( ON-TABLE ?auto_187358 ) ( ON ?auto_187360 ?auto_187358 ) ( not ( = ?auto_187358 ?auto_187360 ) ) ( not ( = ?auto_187358 ?auto_187357 ) ) ( not ( = ?auto_187358 ?auto_187356 ) ) ( not ( = ?auto_187352 ?auto_187358 ) ) ( not ( = ?auto_187353 ?auto_187358 ) ) ( not ( = ?auto_187354 ?auto_187358 ) ) ( not ( = ?auto_187355 ?auto_187358 ) ) ( ON ?auto_187355 ?auto_187356 ) ( ON ?auto_187352 ?auto_187359 ) ( not ( = ?auto_187352 ?auto_187359 ) ) ( not ( = ?auto_187353 ?auto_187359 ) ) ( not ( = ?auto_187354 ?auto_187359 ) ) ( not ( = ?auto_187355 ?auto_187359 ) ) ( not ( = ?auto_187356 ?auto_187359 ) ) ( not ( = ?auto_187357 ?auto_187359 ) ) ( not ( = ?auto_187360 ?auto_187359 ) ) ( not ( = ?auto_187358 ?auto_187359 ) ) ( ON ?auto_187353 ?auto_187352 ) ( CLEAR ?auto_187353 ) ( ON-TABLE ?auto_187359 ) ( HOLDING ?auto_187354 ) ( CLEAR ?auto_187355 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187358 ?auto_187360 ?auto_187357 ?auto_187356 ?auto_187355 ?auto_187354 )
      ( MAKE-6PILE ?auto_187352 ?auto_187353 ?auto_187354 ?auto_187355 ?auto_187356 ?auto_187357 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187361 - BLOCK
      ?auto_187362 - BLOCK
      ?auto_187363 - BLOCK
      ?auto_187364 - BLOCK
      ?auto_187365 - BLOCK
      ?auto_187366 - BLOCK
    )
    :vars
    (
      ?auto_187367 - BLOCK
      ?auto_187369 - BLOCK
      ?auto_187368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187361 ?auto_187362 ) ) ( not ( = ?auto_187361 ?auto_187363 ) ) ( not ( = ?auto_187361 ?auto_187364 ) ) ( not ( = ?auto_187361 ?auto_187365 ) ) ( not ( = ?auto_187361 ?auto_187366 ) ) ( not ( = ?auto_187362 ?auto_187363 ) ) ( not ( = ?auto_187362 ?auto_187364 ) ) ( not ( = ?auto_187362 ?auto_187365 ) ) ( not ( = ?auto_187362 ?auto_187366 ) ) ( not ( = ?auto_187363 ?auto_187364 ) ) ( not ( = ?auto_187363 ?auto_187365 ) ) ( not ( = ?auto_187363 ?auto_187366 ) ) ( not ( = ?auto_187364 ?auto_187365 ) ) ( not ( = ?auto_187364 ?auto_187366 ) ) ( not ( = ?auto_187365 ?auto_187366 ) ) ( ON ?auto_187366 ?auto_187367 ) ( not ( = ?auto_187361 ?auto_187367 ) ) ( not ( = ?auto_187362 ?auto_187367 ) ) ( not ( = ?auto_187363 ?auto_187367 ) ) ( not ( = ?auto_187364 ?auto_187367 ) ) ( not ( = ?auto_187365 ?auto_187367 ) ) ( not ( = ?auto_187366 ?auto_187367 ) ) ( ON ?auto_187365 ?auto_187366 ) ( ON-TABLE ?auto_187369 ) ( ON ?auto_187367 ?auto_187369 ) ( not ( = ?auto_187369 ?auto_187367 ) ) ( not ( = ?auto_187369 ?auto_187366 ) ) ( not ( = ?auto_187369 ?auto_187365 ) ) ( not ( = ?auto_187361 ?auto_187369 ) ) ( not ( = ?auto_187362 ?auto_187369 ) ) ( not ( = ?auto_187363 ?auto_187369 ) ) ( not ( = ?auto_187364 ?auto_187369 ) ) ( ON ?auto_187364 ?auto_187365 ) ( ON ?auto_187361 ?auto_187368 ) ( not ( = ?auto_187361 ?auto_187368 ) ) ( not ( = ?auto_187362 ?auto_187368 ) ) ( not ( = ?auto_187363 ?auto_187368 ) ) ( not ( = ?auto_187364 ?auto_187368 ) ) ( not ( = ?auto_187365 ?auto_187368 ) ) ( not ( = ?auto_187366 ?auto_187368 ) ) ( not ( = ?auto_187367 ?auto_187368 ) ) ( not ( = ?auto_187369 ?auto_187368 ) ) ( ON ?auto_187362 ?auto_187361 ) ( ON-TABLE ?auto_187368 ) ( CLEAR ?auto_187364 ) ( ON ?auto_187363 ?auto_187362 ) ( CLEAR ?auto_187363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187368 ?auto_187361 ?auto_187362 )
      ( MAKE-6PILE ?auto_187361 ?auto_187362 ?auto_187363 ?auto_187364 ?auto_187365 ?auto_187366 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187370 - BLOCK
      ?auto_187371 - BLOCK
      ?auto_187372 - BLOCK
      ?auto_187373 - BLOCK
      ?auto_187374 - BLOCK
      ?auto_187375 - BLOCK
    )
    :vars
    (
      ?auto_187378 - BLOCK
      ?auto_187377 - BLOCK
      ?auto_187376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187370 ?auto_187371 ) ) ( not ( = ?auto_187370 ?auto_187372 ) ) ( not ( = ?auto_187370 ?auto_187373 ) ) ( not ( = ?auto_187370 ?auto_187374 ) ) ( not ( = ?auto_187370 ?auto_187375 ) ) ( not ( = ?auto_187371 ?auto_187372 ) ) ( not ( = ?auto_187371 ?auto_187373 ) ) ( not ( = ?auto_187371 ?auto_187374 ) ) ( not ( = ?auto_187371 ?auto_187375 ) ) ( not ( = ?auto_187372 ?auto_187373 ) ) ( not ( = ?auto_187372 ?auto_187374 ) ) ( not ( = ?auto_187372 ?auto_187375 ) ) ( not ( = ?auto_187373 ?auto_187374 ) ) ( not ( = ?auto_187373 ?auto_187375 ) ) ( not ( = ?auto_187374 ?auto_187375 ) ) ( ON ?auto_187375 ?auto_187378 ) ( not ( = ?auto_187370 ?auto_187378 ) ) ( not ( = ?auto_187371 ?auto_187378 ) ) ( not ( = ?auto_187372 ?auto_187378 ) ) ( not ( = ?auto_187373 ?auto_187378 ) ) ( not ( = ?auto_187374 ?auto_187378 ) ) ( not ( = ?auto_187375 ?auto_187378 ) ) ( ON ?auto_187374 ?auto_187375 ) ( ON-TABLE ?auto_187377 ) ( ON ?auto_187378 ?auto_187377 ) ( not ( = ?auto_187377 ?auto_187378 ) ) ( not ( = ?auto_187377 ?auto_187375 ) ) ( not ( = ?auto_187377 ?auto_187374 ) ) ( not ( = ?auto_187370 ?auto_187377 ) ) ( not ( = ?auto_187371 ?auto_187377 ) ) ( not ( = ?auto_187372 ?auto_187377 ) ) ( not ( = ?auto_187373 ?auto_187377 ) ) ( ON ?auto_187370 ?auto_187376 ) ( not ( = ?auto_187370 ?auto_187376 ) ) ( not ( = ?auto_187371 ?auto_187376 ) ) ( not ( = ?auto_187372 ?auto_187376 ) ) ( not ( = ?auto_187373 ?auto_187376 ) ) ( not ( = ?auto_187374 ?auto_187376 ) ) ( not ( = ?auto_187375 ?auto_187376 ) ) ( not ( = ?auto_187378 ?auto_187376 ) ) ( not ( = ?auto_187377 ?auto_187376 ) ) ( ON ?auto_187371 ?auto_187370 ) ( ON-TABLE ?auto_187376 ) ( ON ?auto_187372 ?auto_187371 ) ( CLEAR ?auto_187372 ) ( HOLDING ?auto_187373 ) ( CLEAR ?auto_187374 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187377 ?auto_187378 ?auto_187375 ?auto_187374 ?auto_187373 )
      ( MAKE-6PILE ?auto_187370 ?auto_187371 ?auto_187372 ?auto_187373 ?auto_187374 ?auto_187375 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187379 - BLOCK
      ?auto_187380 - BLOCK
      ?auto_187381 - BLOCK
      ?auto_187382 - BLOCK
      ?auto_187383 - BLOCK
      ?auto_187384 - BLOCK
    )
    :vars
    (
      ?auto_187386 - BLOCK
      ?auto_187387 - BLOCK
      ?auto_187385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187379 ?auto_187380 ) ) ( not ( = ?auto_187379 ?auto_187381 ) ) ( not ( = ?auto_187379 ?auto_187382 ) ) ( not ( = ?auto_187379 ?auto_187383 ) ) ( not ( = ?auto_187379 ?auto_187384 ) ) ( not ( = ?auto_187380 ?auto_187381 ) ) ( not ( = ?auto_187380 ?auto_187382 ) ) ( not ( = ?auto_187380 ?auto_187383 ) ) ( not ( = ?auto_187380 ?auto_187384 ) ) ( not ( = ?auto_187381 ?auto_187382 ) ) ( not ( = ?auto_187381 ?auto_187383 ) ) ( not ( = ?auto_187381 ?auto_187384 ) ) ( not ( = ?auto_187382 ?auto_187383 ) ) ( not ( = ?auto_187382 ?auto_187384 ) ) ( not ( = ?auto_187383 ?auto_187384 ) ) ( ON ?auto_187384 ?auto_187386 ) ( not ( = ?auto_187379 ?auto_187386 ) ) ( not ( = ?auto_187380 ?auto_187386 ) ) ( not ( = ?auto_187381 ?auto_187386 ) ) ( not ( = ?auto_187382 ?auto_187386 ) ) ( not ( = ?auto_187383 ?auto_187386 ) ) ( not ( = ?auto_187384 ?auto_187386 ) ) ( ON ?auto_187383 ?auto_187384 ) ( ON-TABLE ?auto_187387 ) ( ON ?auto_187386 ?auto_187387 ) ( not ( = ?auto_187387 ?auto_187386 ) ) ( not ( = ?auto_187387 ?auto_187384 ) ) ( not ( = ?auto_187387 ?auto_187383 ) ) ( not ( = ?auto_187379 ?auto_187387 ) ) ( not ( = ?auto_187380 ?auto_187387 ) ) ( not ( = ?auto_187381 ?auto_187387 ) ) ( not ( = ?auto_187382 ?auto_187387 ) ) ( ON ?auto_187379 ?auto_187385 ) ( not ( = ?auto_187379 ?auto_187385 ) ) ( not ( = ?auto_187380 ?auto_187385 ) ) ( not ( = ?auto_187381 ?auto_187385 ) ) ( not ( = ?auto_187382 ?auto_187385 ) ) ( not ( = ?auto_187383 ?auto_187385 ) ) ( not ( = ?auto_187384 ?auto_187385 ) ) ( not ( = ?auto_187386 ?auto_187385 ) ) ( not ( = ?auto_187387 ?auto_187385 ) ) ( ON ?auto_187380 ?auto_187379 ) ( ON-TABLE ?auto_187385 ) ( ON ?auto_187381 ?auto_187380 ) ( CLEAR ?auto_187383 ) ( ON ?auto_187382 ?auto_187381 ) ( CLEAR ?auto_187382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187385 ?auto_187379 ?auto_187380 ?auto_187381 )
      ( MAKE-6PILE ?auto_187379 ?auto_187380 ?auto_187381 ?auto_187382 ?auto_187383 ?auto_187384 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187388 - BLOCK
      ?auto_187389 - BLOCK
      ?auto_187390 - BLOCK
      ?auto_187391 - BLOCK
      ?auto_187392 - BLOCK
      ?auto_187393 - BLOCK
    )
    :vars
    (
      ?auto_187396 - BLOCK
      ?auto_187394 - BLOCK
      ?auto_187395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187388 ?auto_187389 ) ) ( not ( = ?auto_187388 ?auto_187390 ) ) ( not ( = ?auto_187388 ?auto_187391 ) ) ( not ( = ?auto_187388 ?auto_187392 ) ) ( not ( = ?auto_187388 ?auto_187393 ) ) ( not ( = ?auto_187389 ?auto_187390 ) ) ( not ( = ?auto_187389 ?auto_187391 ) ) ( not ( = ?auto_187389 ?auto_187392 ) ) ( not ( = ?auto_187389 ?auto_187393 ) ) ( not ( = ?auto_187390 ?auto_187391 ) ) ( not ( = ?auto_187390 ?auto_187392 ) ) ( not ( = ?auto_187390 ?auto_187393 ) ) ( not ( = ?auto_187391 ?auto_187392 ) ) ( not ( = ?auto_187391 ?auto_187393 ) ) ( not ( = ?auto_187392 ?auto_187393 ) ) ( ON ?auto_187393 ?auto_187396 ) ( not ( = ?auto_187388 ?auto_187396 ) ) ( not ( = ?auto_187389 ?auto_187396 ) ) ( not ( = ?auto_187390 ?auto_187396 ) ) ( not ( = ?auto_187391 ?auto_187396 ) ) ( not ( = ?auto_187392 ?auto_187396 ) ) ( not ( = ?auto_187393 ?auto_187396 ) ) ( ON-TABLE ?auto_187394 ) ( ON ?auto_187396 ?auto_187394 ) ( not ( = ?auto_187394 ?auto_187396 ) ) ( not ( = ?auto_187394 ?auto_187393 ) ) ( not ( = ?auto_187394 ?auto_187392 ) ) ( not ( = ?auto_187388 ?auto_187394 ) ) ( not ( = ?auto_187389 ?auto_187394 ) ) ( not ( = ?auto_187390 ?auto_187394 ) ) ( not ( = ?auto_187391 ?auto_187394 ) ) ( ON ?auto_187388 ?auto_187395 ) ( not ( = ?auto_187388 ?auto_187395 ) ) ( not ( = ?auto_187389 ?auto_187395 ) ) ( not ( = ?auto_187390 ?auto_187395 ) ) ( not ( = ?auto_187391 ?auto_187395 ) ) ( not ( = ?auto_187392 ?auto_187395 ) ) ( not ( = ?auto_187393 ?auto_187395 ) ) ( not ( = ?auto_187396 ?auto_187395 ) ) ( not ( = ?auto_187394 ?auto_187395 ) ) ( ON ?auto_187389 ?auto_187388 ) ( ON-TABLE ?auto_187395 ) ( ON ?auto_187390 ?auto_187389 ) ( ON ?auto_187391 ?auto_187390 ) ( CLEAR ?auto_187391 ) ( HOLDING ?auto_187392 ) ( CLEAR ?auto_187393 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187394 ?auto_187396 ?auto_187393 ?auto_187392 )
      ( MAKE-6PILE ?auto_187388 ?auto_187389 ?auto_187390 ?auto_187391 ?auto_187392 ?auto_187393 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187397 - BLOCK
      ?auto_187398 - BLOCK
      ?auto_187399 - BLOCK
      ?auto_187400 - BLOCK
      ?auto_187401 - BLOCK
      ?auto_187402 - BLOCK
    )
    :vars
    (
      ?auto_187405 - BLOCK
      ?auto_187403 - BLOCK
      ?auto_187404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187397 ?auto_187398 ) ) ( not ( = ?auto_187397 ?auto_187399 ) ) ( not ( = ?auto_187397 ?auto_187400 ) ) ( not ( = ?auto_187397 ?auto_187401 ) ) ( not ( = ?auto_187397 ?auto_187402 ) ) ( not ( = ?auto_187398 ?auto_187399 ) ) ( not ( = ?auto_187398 ?auto_187400 ) ) ( not ( = ?auto_187398 ?auto_187401 ) ) ( not ( = ?auto_187398 ?auto_187402 ) ) ( not ( = ?auto_187399 ?auto_187400 ) ) ( not ( = ?auto_187399 ?auto_187401 ) ) ( not ( = ?auto_187399 ?auto_187402 ) ) ( not ( = ?auto_187400 ?auto_187401 ) ) ( not ( = ?auto_187400 ?auto_187402 ) ) ( not ( = ?auto_187401 ?auto_187402 ) ) ( ON ?auto_187402 ?auto_187405 ) ( not ( = ?auto_187397 ?auto_187405 ) ) ( not ( = ?auto_187398 ?auto_187405 ) ) ( not ( = ?auto_187399 ?auto_187405 ) ) ( not ( = ?auto_187400 ?auto_187405 ) ) ( not ( = ?auto_187401 ?auto_187405 ) ) ( not ( = ?auto_187402 ?auto_187405 ) ) ( ON-TABLE ?auto_187403 ) ( ON ?auto_187405 ?auto_187403 ) ( not ( = ?auto_187403 ?auto_187405 ) ) ( not ( = ?auto_187403 ?auto_187402 ) ) ( not ( = ?auto_187403 ?auto_187401 ) ) ( not ( = ?auto_187397 ?auto_187403 ) ) ( not ( = ?auto_187398 ?auto_187403 ) ) ( not ( = ?auto_187399 ?auto_187403 ) ) ( not ( = ?auto_187400 ?auto_187403 ) ) ( ON ?auto_187397 ?auto_187404 ) ( not ( = ?auto_187397 ?auto_187404 ) ) ( not ( = ?auto_187398 ?auto_187404 ) ) ( not ( = ?auto_187399 ?auto_187404 ) ) ( not ( = ?auto_187400 ?auto_187404 ) ) ( not ( = ?auto_187401 ?auto_187404 ) ) ( not ( = ?auto_187402 ?auto_187404 ) ) ( not ( = ?auto_187405 ?auto_187404 ) ) ( not ( = ?auto_187403 ?auto_187404 ) ) ( ON ?auto_187398 ?auto_187397 ) ( ON-TABLE ?auto_187404 ) ( ON ?auto_187399 ?auto_187398 ) ( ON ?auto_187400 ?auto_187399 ) ( CLEAR ?auto_187402 ) ( ON ?auto_187401 ?auto_187400 ) ( CLEAR ?auto_187401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187404 ?auto_187397 ?auto_187398 ?auto_187399 ?auto_187400 )
      ( MAKE-6PILE ?auto_187397 ?auto_187398 ?auto_187399 ?auto_187400 ?auto_187401 ?auto_187402 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187406 - BLOCK
      ?auto_187407 - BLOCK
      ?auto_187408 - BLOCK
      ?auto_187409 - BLOCK
      ?auto_187410 - BLOCK
      ?auto_187411 - BLOCK
    )
    :vars
    (
      ?auto_187413 - BLOCK
      ?auto_187414 - BLOCK
      ?auto_187412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187406 ?auto_187407 ) ) ( not ( = ?auto_187406 ?auto_187408 ) ) ( not ( = ?auto_187406 ?auto_187409 ) ) ( not ( = ?auto_187406 ?auto_187410 ) ) ( not ( = ?auto_187406 ?auto_187411 ) ) ( not ( = ?auto_187407 ?auto_187408 ) ) ( not ( = ?auto_187407 ?auto_187409 ) ) ( not ( = ?auto_187407 ?auto_187410 ) ) ( not ( = ?auto_187407 ?auto_187411 ) ) ( not ( = ?auto_187408 ?auto_187409 ) ) ( not ( = ?auto_187408 ?auto_187410 ) ) ( not ( = ?auto_187408 ?auto_187411 ) ) ( not ( = ?auto_187409 ?auto_187410 ) ) ( not ( = ?auto_187409 ?auto_187411 ) ) ( not ( = ?auto_187410 ?auto_187411 ) ) ( not ( = ?auto_187406 ?auto_187413 ) ) ( not ( = ?auto_187407 ?auto_187413 ) ) ( not ( = ?auto_187408 ?auto_187413 ) ) ( not ( = ?auto_187409 ?auto_187413 ) ) ( not ( = ?auto_187410 ?auto_187413 ) ) ( not ( = ?auto_187411 ?auto_187413 ) ) ( ON-TABLE ?auto_187414 ) ( ON ?auto_187413 ?auto_187414 ) ( not ( = ?auto_187414 ?auto_187413 ) ) ( not ( = ?auto_187414 ?auto_187411 ) ) ( not ( = ?auto_187414 ?auto_187410 ) ) ( not ( = ?auto_187406 ?auto_187414 ) ) ( not ( = ?auto_187407 ?auto_187414 ) ) ( not ( = ?auto_187408 ?auto_187414 ) ) ( not ( = ?auto_187409 ?auto_187414 ) ) ( ON ?auto_187406 ?auto_187412 ) ( not ( = ?auto_187406 ?auto_187412 ) ) ( not ( = ?auto_187407 ?auto_187412 ) ) ( not ( = ?auto_187408 ?auto_187412 ) ) ( not ( = ?auto_187409 ?auto_187412 ) ) ( not ( = ?auto_187410 ?auto_187412 ) ) ( not ( = ?auto_187411 ?auto_187412 ) ) ( not ( = ?auto_187413 ?auto_187412 ) ) ( not ( = ?auto_187414 ?auto_187412 ) ) ( ON ?auto_187407 ?auto_187406 ) ( ON-TABLE ?auto_187412 ) ( ON ?auto_187408 ?auto_187407 ) ( ON ?auto_187409 ?auto_187408 ) ( ON ?auto_187410 ?auto_187409 ) ( CLEAR ?auto_187410 ) ( HOLDING ?auto_187411 ) ( CLEAR ?auto_187413 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187414 ?auto_187413 ?auto_187411 )
      ( MAKE-6PILE ?auto_187406 ?auto_187407 ?auto_187408 ?auto_187409 ?auto_187410 ?auto_187411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187415 - BLOCK
      ?auto_187416 - BLOCK
      ?auto_187417 - BLOCK
      ?auto_187418 - BLOCK
      ?auto_187419 - BLOCK
      ?auto_187420 - BLOCK
    )
    :vars
    (
      ?auto_187423 - BLOCK
      ?auto_187421 - BLOCK
      ?auto_187422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187415 ?auto_187416 ) ) ( not ( = ?auto_187415 ?auto_187417 ) ) ( not ( = ?auto_187415 ?auto_187418 ) ) ( not ( = ?auto_187415 ?auto_187419 ) ) ( not ( = ?auto_187415 ?auto_187420 ) ) ( not ( = ?auto_187416 ?auto_187417 ) ) ( not ( = ?auto_187416 ?auto_187418 ) ) ( not ( = ?auto_187416 ?auto_187419 ) ) ( not ( = ?auto_187416 ?auto_187420 ) ) ( not ( = ?auto_187417 ?auto_187418 ) ) ( not ( = ?auto_187417 ?auto_187419 ) ) ( not ( = ?auto_187417 ?auto_187420 ) ) ( not ( = ?auto_187418 ?auto_187419 ) ) ( not ( = ?auto_187418 ?auto_187420 ) ) ( not ( = ?auto_187419 ?auto_187420 ) ) ( not ( = ?auto_187415 ?auto_187423 ) ) ( not ( = ?auto_187416 ?auto_187423 ) ) ( not ( = ?auto_187417 ?auto_187423 ) ) ( not ( = ?auto_187418 ?auto_187423 ) ) ( not ( = ?auto_187419 ?auto_187423 ) ) ( not ( = ?auto_187420 ?auto_187423 ) ) ( ON-TABLE ?auto_187421 ) ( ON ?auto_187423 ?auto_187421 ) ( not ( = ?auto_187421 ?auto_187423 ) ) ( not ( = ?auto_187421 ?auto_187420 ) ) ( not ( = ?auto_187421 ?auto_187419 ) ) ( not ( = ?auto_187415 ?auto_187421 ) ) ( not ( = ?auto_187416 ?auto_187421 ) ) ( not ( = ?auto_187417 ?auto_187421 ) ) ( not ( = ?auto_187418 ?auto_187421 ) ) ( ON ?auto_187415 ?auto_187422 ) ( not ( = ?auto_187415 ?auto_187422 ) ) ( not ( = ?auto_187416 ?auto_187422 ) ) ( not ( = ?auto_187417 ?auto_187422 ) ) ( not ( = ?auto_187418 ?auto_187422 ) ) ( not ( = ?auto_187419 ?auto_187422 ) ) ( not ( = ?auto_187420 ?auto_187422 ) ) ( not ( = ?auto_187423 ?auto_187422 ) ) ( not ( = ?auto_187421 ?auto_187422 ) ) ( ON ?auto_187416 ?auto_187415 ) ( ON-TABLE ?auto_187422 ) ( ON ?auto_187417 ?auto_187416 ) ( ON ?auto_187418 ?auto_187417 ) ( ON ?auto_187419 ?auto_187418 ) ( CLEAR ?auto_187423 ) ( ON ?auto_187420 ?auto_187419 ) ( CLEAR ?auto_187420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187422 ?auto_187415 ?auto_187416 ?auto_187417 ?auto_187418 ?auto_187419 )
      ( MAKE-6PILE ?auto_187415 ?auto_187416 ?auto_187417 ?auto_187418 ?auto_187419 ?auto_187420 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187424 - BLOCK
      ?auto_187425 - BLOCK
      ?auto_187426 - BLOCK
      ?auto_187427 - BLOCK
      ?auto_187428 - BLOCK
      ?auto_187429 - BLOCK
    )
    :vars
    (
      ?auto_187432 - BLOCK
      ?auto_187431 - BLOCK
      ?auto_187430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187424 ?auto_187425 ) ) ( not ( = ?auto_187424 ?auto_187426 ) ) ( not ( = ?auto_187424 ?auto_187427 ) ) ( not ( = ?auto_187424 ?auto_187428 ) ) ( not ( = ?auto_187424 ?auto_187429 ) ) ( not ( = ?auto_187425 ?auto_187426 ) ) ( not ( = ?auto_187425 ?auto_187427 ) ) ( not ( = ?auto_187425 ?auto_187428 ) ) ( not ( = ?auto_187425 ?auto_187429 ) ) ( not ( = ?auto_187426 ?auto_187427 ) ) ( not ( = ?auto_187426 ?auto_187428 ) ) ( not ( = ?auto_187426 ?auto_187429 ) ) ( not ( = ?auto_187427 ?auto_187428 ) ) ( not ( = ?auto_187427 ?auto_187429 ) ) ( not ( = ?auto_187428 ?auto_187429 ) ) ( not ( = ?auto_187424 ?auto_187432 ) ) ( not ( = ?auto_187425 ?auto_187432 ) ) ( not ( = ?auto_187426 ?auto_187432 ) ) ( not ( = ?auto_187427 ?auto_187432 ) ) ( not ( = ?auto_187428 ?auto_187432 ) ) ( not ( = ?auto_187429 ?auto_187432 ) ) ( ON-TABLE ?auto_187431 ) ( not ( = ?auto_187431 ?auto_187432 ) ) ( not ( = ?auto_187431 ?auto_187429 ) ) ( not ( = ?auto_187431 ?auto_187428 ) ) ( not ( = ?auto_187424 ?auto_187431 ) ) ( not ( = ?auto_187425 ?auto_187431 ) ) ( not ( = ?auto_187426 ?auto_187431 ) ) ( not ( = ?auto_187427 ?auto_187431 ) ) ( ON ?auto_187424 ?auto_187430 ) ( not ( = ?auto_187424 ?auto_187430 ) ) ( not ( = ?auto_187425 ?auto_187430 ) ) ( not ( = ?auto_187426 ?auto_187430 ) ) ( not ( = ?auto_187427 ?auto_187430 ) ) ( not ( = ?auto_187428 ?auto_187430 ) ) ( not ( = ?auto_187429 ?auto_187430 ) ) ( not ( = ?auto_187432 ?auto_187430 ) ) ( not ( = ?auto_187431 ?auto_187430 ) ) ( ON ?auto_187425 ?auto_187424 ) ( ON-TABLE ?auto_187430 ) ( ON ?auto_187426 ?auto_187425 ) ( ON ?auto_187427 ?auto_187426 ) ( ON ?auto_187428 ?auto_187427 ) ( ON ?auto_187429 ?auto_187428 ) ( CLEAR ?auto_187429 ) ( HOLDING ?auto_187432 ) ( CLEAR ?auto_187431 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187431 ?auto_187432 )
      ( MAKE-6PILE ?auto_187424 ?auto_187425 ?auto_187426 ?auto_187427 ?auto_187428 ?auto_187429 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187433 - BLOCK
      ?auto_187434 - BLOCK
      ?auto_187435 - BLOCK
      ?auto_187436 - BLOCK
      ?auto_187437 - BLOCK
      ?auto_187438 - BLOCK
    )
    :vars
    (
      ?auto_187440 - BLOCK
      ?auto_187441 - BLOCK
      ?auto_187439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187433 ?auto_187434 ) ) ( not ( = ?auto_187433 ?auto_187435 ) ) ( not ( = ?auto_187433 ?auto_187436 ) ) ( not ( = ?auto_187433 ?auto_187437 ) ) ( not ( = ?auto_187433 ?auto_187438 ) ) ( not ( = ?auto_187434 ?auto_187435 ) ) ( not ( = ?auto_187434 ?auto_187436 ) ) ( not ( = ?auto_187434 ?auto_187437 ) ) ( not ( = ?auto_187434 ?auto_187438 ) ) ( not ( = ?auto_187435 ?auto_187436 ) ) ( not ( = ?auto_187435 ?auto_187437 ) ) ( not ( = ?auto_187435 ?auto_187438 ) ) ( not ( = ?auto_187436 ?auto_187437 ) ) ( not ( = ?auto_187436 ?auto_187438 ) ) ( not ( = ?auto_187437 ?auto_187438 ) ) ( not ( = ?auto_187433 ?auto_187440 ) ) ( not ( = ?auto_187434 ?auto_187440 ) ) ( not ( = ?auto_187435 ?auto_187440 ) ) ( not ( = ?auto_187436 ?auto_187440 ) ) ( not ( = ?auto_187437 ?auto_187440 ) ) ( not ( = ?auto_187438 ?auto_187440 ) ) ( ON-TABLE ?auto_187441 ) ( not ( = ?auto_187441 ?auto_187440 ) ) ( not ( = ?auto_187441 ?auto_187438 ) ) ( not ( = ?auto_187441 ?auto_187437 ) ) ( not ( = ?auto_187433 ?auto_187441 ) ) ( not ( = ?auto_187434 ?auto_187441 ) ) ( not ( = ?auto_187435 ?auto_187441 ) ) ( not ( = ?auto_187436 ?auto_187441 ) ) ( ON ?auto_187433 ?auto_187439 ) ( not ( = ?auto_187433 ?auto_187439 ) ) ( not ( = ?auto_187434 ?auto_187439 ) ) ( not ( = ?auto_187435 ?auto_187439 ) ) ( not ( = ?auto_187436 ?auto_187439 ) ) ( not ( = ?auto_187437 ?auto_187439 ) ) ( not ( = ?auto_187438 ?auto_187439 ) ) ( not ( = ?auto_187440 ?auto_187439 ) ) ( not ( = ?auto_187441 ?auto_187439 ) ) ( ON ?auto_187434 ?auto_187433 ) ( ON-TABLE ?auto_187439 ) ( ON ?auto_187435 ?auto_187434 ) ( ON ?auto_187436 ?auto_187435 ) ( ON ?auto_187437 ?auto_187436 ) ( ON ?auto_187438 ?auto_187437 ) ( CLEAR ?auto_187441 ) ( ON ?auto_187440 ?auto_187438 ) ( CLEAR ?auto_187440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187439 ?auto_187433 ?auto_187434 ?auto_187435 ?auto_187436 ?auto_187437 ?auto_187438 )
      ( MAKE-6PILE ?auto_187433 ?auto_187434 ?auto_187435 ?auto_187436 ?auto_187437 ?auto_187438 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187442 - BLOCK
      ?auto_187443 - BLOCK
      ?auto_187444 - BLOCK
      ?auto_187445 - BLOCK
      ?auto_187446 - BLOCK
      ?auto_187447 - BLOCK
    )
    :vars
    (
      ?auto_187449 - BLOCK
      ?auto_187448 - BLOCK
      ?auto_187450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187442 ?auto_187443 ) ) ( not ( = ?auto_187442 ?auto_187444 ) ) ( not ( = ?auto_187442 ?auto_187445 ) ) ( not ( = ?auto_187442 ?auto_187446 ) ) ( not ( = ?auto_187442 ?auto_187447 ) ) ( not ( = ?auto_187443 ?auto_187444 ) ) ( not ( = ?auto_187443 ?auto_187445 ) ) ( not ( = ?auto_187443 ?auto_187446 ) ) ( not ( = ?auto_187443 ?auto_187447 ) ) ( not ( = ?auto_187444 ?auto_187445 ) ) ( not ( = ?auto_187444 ?auto_187446 ) ) ( not ( = ?auto_187444 ?auto_187447 ) ) ( not ( = ?auto_187445 ?auto_187446 ) ) ( not ( = ?auto_187445 ?auto_187447 ) ) ( not ( = ?auto_187446 ?auto_187447 ) ) ( not ( = ?auto_187442 ?auto_187449 ) ) ( not ( = ?auto_187443 ?auto_187449 ) ) ( not ( = ?auto_187444 ?auto_187449 ) ) ( not ( = ?auto_187445 ?auto_187449 ) ) ( not ( = ?auto_187446 ?auto_187449 ) ) ( not ( = ?auto_187447 ?auto_187449 ) ) ( not ( = ?auto_187448 ?auto_187449 ) ) ( not ( = ?auto_187448 ?auto_187447 ) ) ( not ( = ?auto_187448 ?auto_187446 ) ) ( not ( = ?auto_187442 ?auto_187448 ) ) ( not ( = ?auto_187443 ?auto_187448 ) ) ( not ( = ?auto_187444 ?auto_187448 ) ) ( not ( = ?auto_187445 ?auto_187448 ) ) ( ON ?auto_187442 ?auto_187450 ) ( not ( = ?auto_187442 ?auto_187450 ) ) ( not ( = ?auto_187443 ?auto_187450 ) ) ( not ( = ?auto_187444 ?auto_187450 ) ) ( not ( = ?auto_187445 ?auto_187450 ) ) ( not ( = ?auto_187446 ?auto_187450 ) ) ( not ( = ?auto_187447 ?auto_187450 ) ) ( not ( = ?auto_187449 ?auto_187450 ) ) ( not ( = ?auto_187448 ?auto_187450 ) ) ( ON ?auto_187443 ?auto_187442 ) ( ON-TABLE ?auto_187450 ) ( ON ?auto_187444 ?auto_187443 ) ( ON ?auto_187445 ?auto_187444 ) ( ON ?auto_187446 ?auto_187445 ) ( ON ?auto_187447 ?auto_187446 ) ( ON ?auto_187449 ?auto_187447 ) ( CLEAR ?auto_187449 ) ( HOLDING ?auto_187448 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187448 )
      ( MAKE-6PILE ?auto_187442 ?auto_187443 ?auto_187444 ?auto_187445 ?auto_187446 ?auto_187447 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_187451 - BLOCK
      ?auto_187452 - BLOCK
      ?auto_187453 - BLOCK
      ?auto_187454 - BLOCK
      ?auto_187455 - BLOCK
      ?auto_187456 - BLOCK
    )
    :vars
    (
      ?auto_187459 - BLOCK
      ?auto_187457 - BLOCK
      ?auto_187458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187451 ?auto_187452 ) ) ( not ( = ?auto_187451 ?auto_187453 ) ) ( not ( = ?auto_187451 ?auto_187454 ) ) ( not ( = ?auto_187451 ?auto_187455 ) ) ( not ( = ?auto_187451 ?auto_187456 ) ) ( not ( = ?auto_187452 ?auto_187453 ) ) ( not ( = ?auto_187452 ?auto_187454 ) ) ( not ( = ?auto_187452 ?auto_187455 ) ) ( not ( = ?auto_187452 ?auto_187456 ) ) ( not ( = ?auto_187453 ?auto_187454 ) ) ( not ( = ?auto_187453 ?auto_187455 ) ) ( not ( = ?auto_187453 ?auto_187456 ) ) ( not ( = ?auto_187454 ?auto_187455 ) ) ( not ( = ?auto_187454 ?auto_187456 ) ) ( not ( = ?auto_187455 ?auto_187456 ) ) ( not ( = ?auto_187451 ?auto_187459 ) ) ( not ( = ?auto_187452 ?auto_187459 ) ) ( not ( = ?auto_187453 ?auto_187459 ) ) ( not ( = ?auto_187454 ?auto_187459 ) ) ( not ( = ?auto_187455 ?auto_187459 ) ) ( not ( = ?auto_187456 ?auto_187459 ) ) ( not ( = ?auto_187457 ?auto_187459 ) ) ( not ( = ?auto_187457 ?auto_187456 ) ) ( not ( = ?auto_187457 ?auto_187455 ) ) ( not ( = ?auto_187451 ?auto_187457 ) ) ( not ( = ?auto_187452 ?auto_187457 ) ) ( not ( = ?auto_187453 ?auto_187457 ) ) ( not ( = ?auto_187454 ?auto_187457 ) ) ( ON ?auto_187451 ?auto_187458 ) ( not ( = ?auto_187451 ?auto_187458 ) ) ( not ( = ?auto_187452 ?auto_187458 ) ) ( not ( = ?auto_187453 ?auto_187458 ) ) ( not ( = ?auto_187454 ?auto_187458 ) ) ( not ( = ?auto_187455 ?auto_187458 ) ) ( not ( = ?auto_187456 ?auto_187458 ) ) ( not ( = ?auto_187459 ?auto_187458 ) ) ( not ( = ?auto_187457 ?auto_187458 ) ) ( ON ?auto_187452 ?auto_187451 ) ( ON-TABLE ?auto_187458 ) ( ON ?auto_187453 ?auto_187452 ) ( ON ?auto_187454 ?auto_187453 ) ( ON ?auto_187455 ?auto_187454 ) ( ON ?auto_187456 ?auto_187455 ) ( ON ?auto_187459 ?auto_187456 ) ( ON ?auto_187457 ?auto_187459 ) ( CLEAR ?auto_187457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187458 ?auto_187451 ?auto_187452 ?auto_187453 ?auto_187454 ?auto_187455 ?auto_187456 ?auto_187459 )
      ( MAKE-6PILE ?auto_187451 ?auto_187452 ?auto_187453 ?auto_187454 ?auto_187455 ?auto_187456 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187471 - BLOCK
    )
    :vars
    (
      ?auto_187472 - BLOCK
      ?auto_187473 - BLOCK
      ?auto_187474 - BLOCK
      ?auto_187478 - BLOCK
      ?auto_187477 - BLOCK
      ?auto_187476 - BLOCK
      ?auto_187475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187472 ?auto_187471 ) ( ON-TABLE ?auto_187471 ) ( not ( = ?auto_187471 ?auto_187472 ) ) ( not ( = ?auto_187471 ?auto_187473 ) ) ( not ( = ?auto_187471 ?auto_187474 ) ) ( not ( = ?auto_187472 ?auto_187473 ) ) ( not ( = ?auto_187472 ?auto_187474 ) ) ( not ( = ?auto_187473 ?auto_187474 ) ) ( ON ?auto_187473 ?auto_187472 ) ( CLEAR ?auto_187473 ) ( HOLDING ?auto_187474 ) ( CLEAR ?auto_187478 ) ( ON-TABLE ?auto_187477 ) ( ON ?auto_187476 ?auto_187477 ) ( ON ?auto_187475 ?auto_187476 ) ( ON ?auto_187478 ?auto_187475 ) ( not ( = ?auto_187477 ?auto_187476 ) ) ( not ( = ?auto_187477 ?auto_187475 ) ) ( not ( = ?auto_187477 ?auto_187478 ) ) ( not ( = ?auto_187477 ?auto_187474 ) ) ( not ( = ?auto_187476 ?auto_187475 ) ) ( not ( = ?auto_187476 ?auto_187478 ) ) ( not ( = ?auto_187476 ?auto_187474 ) ) ( not ( = ?auto_187475 ?auto_187478 ) ) ( not ( = ?auto_187475 ?auto_187474 ) ) ( not ( = ?auto_187478 ?auto_187474 ) ) ( not ( = ?auto_187471 ?auto_187478 ) ) ( not ( = ?auto_187471 ?auto_187477 ) ) ( not ( = ?auto_187471 ?auto_187476 ) ) ( not ( = ?auto_187471 ?auto_187475 ) ) ( not ( = ?auto_187472 ?auto_187478 ) ) ( not ( = ?auto_187472 ?auto_187477 ) ) ( not ( = ?auto_187472 ?auto_187476 ) ) ( not ( = ?auto_187472 ?auto_187475 ) ) ( not ( = ?auto_187473 ?auto_187478 ) ) ( not ( = ?auto_187473 ?auto_187477 ) ) ( not ( = ?auto_187473 ?auto_187476 ) ) ( not ( = ?auto_187473 ?auto_187475 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187477 ?auto_187476 ?auto_187475 ?auto_187478 ?auto_187474 )
      ( MAKE-1PILE ?auto_187471 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187479 - BLOCK
    )
    :vars
    (
      ?auto_187481 - BLOCK
      ?auto_187484 - BLOCK
      ?auto_187482 - BLOCK
      ?auto_187483 - BLOCK
      ?auto_187480 - BLOCK
      ?auto_187486 - BLOCK
      ?auto_187485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187481 ?auto_187479 ) ( ON-TABLE ?auto_187479 ) ( not ( = ?auto_187479 ?auto_187481 ) ) ( not ( = ?auto_187479 ?auto_187484 ) ) ( not ( = ?auto_187479 ?auto_187482 ) ) ( not ( = ?auto_187481 ?auto_187484 ) ) ( not ( = ?auto_187481 ?auto_187482 ) ) ( not ( = ?auto_187484 ?auto_187482 ) ) ( ON ?auto_187484 ?auto_187481 ) ( CLEAR ?auto_187483 ) ( ON-TABLE ?auto_187480 ) ( ON ?auto_187486 ?auto_187480 ) ( ON ?auto_187485 ?auto_187486 ) ( ON ?auto_187483 ?auto_187485 ) ( not ( = ?auto_187480 ?auto_187486 ) ) ( not ( = ?auto_187480 ?auto_187485 ) ) ( not ( = ?auto_187480 ?auto_187483 ) ) ( not ( = ?auto_187480 ?auto_187482 ) ) ( not ( = ?auto_187486 ?auto_187485 ) ) ( not ( = ?auto_187486 ?auto_187483 ) ) ( not ( = ?auto_187486 ?auto_187482 ) ) ( not ( = ?auto_187485 ?auto_187483 ) ) ( not ( = ?auto_187485 ?auto_187482 ) ) ( not ( = ?auto_187483 ?auto_187482 ) ) ( not ( = ?auto_187479 ?auto_187483 ) ) ( not ( = ?auto_187479 ?auto_187480 ) ) ( not ( = ?auto_187479 ?auto_187486 ) ) ( not ( = ?auto_187479 ?auto_187485 ) ) ( not ( = ?auto_187481 ?auto_187483 ) ) ( not ( = ?auto_187481 ?auto_187480 ) ) ( not ( = ?auto_187481 ?auto_187486 ) ) ( not ( = ?auto_187481 ?auto_187485 ) ) ( not ( = ?auto_187484 ?auto_187483 ) ) ( not ( = ?auto_187484 ?auto_187480 ) ) ( not ( = ?auto_187484 ?auto_187486 ) ) ( not ( = ?auto_187484 ?auto_187485 ) ) ( ON ?auto_187482 ?auto_187484 ) ( CLEAR ?auto_187482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187479 ?auto_187481 ?auto_187484 )
      ( MAKE-1PILE ?auto_187479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187487 - BLOCK
    )
    :vars
    (
      ?auto_187494 - BLOCK
      ?auto_187491 - BLOCK
      ?auto_187489 - BLOCK
      ?auto_187492 - BLOCK
      ?auto_187490 - BLOCK
      ?auto_187493 - BLOCK
      ?auto_187488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187494 ?auto_187487 ) ( ON-TABLE ?auto_187487 ) ( not ( = ?auto_187487 ?auto_187494 ) ) ( not ( = ?auto_187487 ?auto_187491 ) ) ( not ( = ?auto_187487 ?auto_187489 ) ) ( not ( = ?auto_187494 ?auto_187491 ) ) ( not ( = ?auto_187494 ?auto_187489 ) ) ( not ( = ?auto_187491 ?auto_187489 ) ) ( ON ?auto_187491 ?auto_187494 ) ( ON-TABLE ?auto_187492 ) ( ON ?auto_187490 ?auto_187492 ) ( ON ?auto_187493 ?auto_187490 ) ( not ( = ?auto_187492 ?auto_187490 ) ) ( not ( = ?auto_187492 ?auto_187493 ) ) ( not ( = ?auto_187492 ?auto_187488 ) ) ( not ( = ?auto_187492 ?auto_187489 ) ) ( not ( = ?auto_187490 ?auto_187493 ) ) ( not ( = ?auto_187490 ?auto_187488 ) ) ( not ( = ?auto_187490 ?auto_187489 ) ) ( not ( = ?auto_187493 ?auto_187488 ) ) ( not ( = ?auto_187493 ?auto_187489 ) ) ( not ( = ?auto_187488 ?auto_187489 ) ) ( not ( = ?auto_187487 ?auto_187488 ) ) ( not ( = ?auto_187487 ?auto_187492 ) ) ( not ( = ?auto_187487 ?auto_187490 ) ) ( not ( = ?auto_187487 ?auto_187493 ) ) ( not ( = ?auto_187494 ?auto_187488 ) ) ( not ( = ?auto_187494 ?auto_187492 ) ) ( not ( = ?auto_187494 ?auto_187490 ) ) ( not ( = ?auto_187494 ?auto_187493 ) ) ( not ( = ?auto_187491 ?auto_187488 ) ) ( not ( = ?auto_187491 ?auto_187492 ) ) ( not ( = ?auto_187491 ?auto_187490 ) ) ( not ( = ?auto_187491 ?auto_187493 ) ) ( ON ?auto_187489 ?auto_187491 ) ( CLEAR ?auto_187489 ) ( HOLDING ?auto_187488 ) ( CLEAR ?auto_187493 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187492 ?auto_187490 ?auto_187493 ?auto_187488 )
      ( MAKE-1PILE ?auto_187487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187495 - BLOCK
    )
    :vars
    (
      ?auto_187499 - BLOCK
      ?auto_187500 - BLOCK
      ?auto_187497 - BLOCK
      ?auto_187502 - BLOCK
      ?auto_187496 - BLOCK
      ?auto_187501 - BLOCK
      ?auto_187498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187499 ?auto_187495 ) ( ON-TABLE ?auto_187495 ) ( not ( = ?auto_187495 ?auto_187499 ) ) ( not ( = ?auto_187495 ?auto_187500 ) ) ( not ( = ?auto_187495 ?auto_187497 ) ) ( not ( = ?auto_187499 ?auto_187500 ) ) ( not ( = ?auto_187499 ?auto_187497 ) ) ( not ( = ?auto_187500 ?auto_187497 ) ) ( ON ?auto_187500 ?auto_187499 ) ( ON-TABLE ?auto_187502 ) ( ON ?auto_187496 ?auto_187502 ) ( ON ?auto_187501 ?auto_187496 ) ( not ( = ?auto_187502 ?auto_187496 ) ) ( not ( = ?auto_187502 ?auto_187501 ) ) ( not ( = ?auto_187502 ?auto_187498 ) ) ( not ( = ?auto_187502 ?auto_187497 ) ) ( not ( = ?auto_187496 ?auto_187501 ) ) ( not ( = ?auto_187496 ?auto_187498 ) ) ( not ( = ?auto_187496 ?auto_187497 ) ) ( not ( = ?auto_187501 ?auto_187498 ) ) ( not ( = ?auto_187501 ?auto_187497 ) ) ( not ( = ?auto_187498 ?auto_187497 ) ) ( not ( = ?auto_187495 ?auto_187498 ) ) ( not ( = ?auto_187495 ?auto_187502 ) ) ( not ( = ?auto_187495 ?auto_187496 ) ) ( not ( = ?auto_187495 ?auto_187501 ) ) ( not ( = ?auto_187499 ?auto_187498 ) ) ( not ( = ?auto_187499 ?auto_187502 ) ) ( not ( = ?auto_187499 ?auto_187496 ) ) ( not ( = ?auto_187499 ?auto_187501 ) ) ( not ( = ?auto_187500 ?auto_187498 ) ) ( not ( = ?auto_187500 ?auto_187502 ) ) ( not ( = ?auto_187500 ?auto_187496 ) ) ( not ( = ?auto_187500 ?auto_187501 ) ) ( ON ?auto_187497 ?auto_187500 ) ( CLEAR ?auto_187501 ) ( ON ?auto_187498 ?auto_187497 ) ( CLEAR ?auto_187498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187495 ?auto_187499 ?auto_187500 ?auto_187497 )
      ( MAKE-1PILE ?auto_187495 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187503 - BLOCK
    )
    :vars
    (
      ?auto_187507 - BLOCK
      ?auto_187510 - BLOCK
      ?auto_187506 - BLOCK
      ?auto_187504 - BLOCK
      ?auto_187505 - BLOCK
      ?auto_187509 - BLOCK
      ?auto_187508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187507 ?auto_187503 ) ( ON-TABLE ?auto_187503 ) ( not ( = ?auto_187503 ?auto_187507 ) ) ( not ( = ?auto_187503 ?auto_187510 ) ) ( not ( = ?auto_187503 ?auto_187506 ) ) ( not ( = ?auto_187507 ?auto_187510 ) ) ( not ( = ?auto_187507 ?auto_187506 ) ) ( not ( = ?auto_187510 ?auto_187506 ) ) ( ON ?auto_187510 ?auto_187507 ) ( ON-TABLE ?auto_187504 ) ( ON ?auto_187505 ?auto_187504 ) ( not ( = ?auto_187504 ?auto_187505 ) ) ( not ( = ?auto_187504 ?auto_187509 ) ) ( not ( = ?auto_187504 ?auto_187508 ) ) ( not ( = ?auto_187504 ?auto_187506 ) ) ( not ( = ?auto_187505 ?auto_187509 ) ) ( not ( = ?auto_187505 ?auto_187508 ) ) ( not ( = ?auto_187505 ?auto_187506 ) ) ( not ( = ?auto_187509 ?auto_187508 ) ) ( not ( = ?auto_187509 ?auto_187506 ) ) ( not ( = ?auto_187508 ?auto_187506 ) ) ( not ( = ?auto_187503 ?auto_187508 ) ) ( not ( = ?auto_187503 ?auto_187504 ) ) ( not ( = ?auto_187503 ?auto_187505 ) ) ( not ( = ?auto_187503 ?auto_187509 ) ) ( not ( = ?auto_187507 ?auto_187508 ) ) ( not ( = ?auto_187507 ?auto_187504 ) ) ( not ( = ?auto_187507 ?auto_187505 ) ) ( not ( = ?auto_187507 ?auto_187509 ) ) ( not ( = ?auto_187510 ?auto_187508 ) ) ( not ( = ?auto_187510 ?auto_187504 ) ) ( not ( = ?auto_187510 ?auto_187505 ) ) ( not ( = ?auto_187510 ?auto_187509 ) ) ( ON ?auto_187506 ?auto_187510 ) ( ON ?auto_187508 ?auto_187506 ) ( CLEAR ?auto_187508 ) ( HOLDING ?auto_187509 ) ( CLEAR ?auto_187505 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187504 ?auto_187505 ?auto_187509 )
      ( MAKE-1PILE ?auto_187503 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187511 - BLOCK
    )
    :vars
    (
      ?auto_187517 - BLOCK
      ?auto_187513 - BLOCK
      ?auto_187514 - BLOCK
      ?auto_187515 - BLOCK
      ?auto_187512 - BLOCK
      ?auto_187518 - BLOCK
      ?auto_187516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187517 ?auto_187511 ) ( ON-TABLE ?auto_187511 ) ( not ( = ?auto_187511 ?auto_187517 ) ) ( not ( = ?auto_187511 ?auto_187513 ) ) ( not ( = ?auto_187511 ?auto_187514 ) ) ( not ( = ?auto_187517 ?auto_187513 ) ) ( not ( = ?auto_187517 ?auto_187514 ) ) ( not ( = ?auto_187513 ?auto_187514 ) ) ( ON ?auto_187513 ?auto_187517 ) ( ON-TABLE ?auto_187515 ) ( ON ?auto_187512 ?auto_187515 ) ( not ( = ?auto_187515 ?auto_187512 ) ) ( not ( = ?auto_187515 ?auto_187518 ) ) ( not ( = ?auto_187515 ?auto_187516 ) ) ( not ( = ?auto_187515 ?auto_187514 ) ) ( not ( = ?auto_187512 ?auto_187518 ) ) ( not ( = ?auto_187512 ?auto_187516 ) ) ( not ( = ?auto_187512 ?auto_187514 ) ) ( not ( = ?auto_187518 ?auto_187516 ) ) ( not ( = ?auto_187518 ?auto_187514 ) ) ( not ( = ?auto_187516 ?auto_187514 ) ) ( not ( = ?auto_187511 ?auto_187516 ) ) ( not ( = ?auto_187511 ?auto_187515 ) ) ( not ( = ?auto_187511 ?auto_187512 ) ) ( not ( = ?auto_187511 ?auto_187518 ) ) ( not ( = ?auto_187517 ?auto_187516 ) ) ( not ( = ?auto_187517 ?auto_187515 ) ) ( not ( = ?auto_187517 ?auto_187512 ) ) ( not ( = ?auto_187517 ?auto_187518 ) ) ( not ( = ?auto_187513 ?auto_187516 ) ) ( not ( = ?auto_187513 ?auto_187515 ) ) ( not ( = ?auto_187513 ?auto_187512 ) ) ( not ( = ?auto_187513 ?auto_187518 ) ) ( ON ?auto_187514 ?auto_187513 ) ( ON ?auto_187516 ?auto_187514 ) ( CLEAR ?auto_187512 ) ( ON ?auto_187518 ?auto_187516 ) ( CLEAR ?auto_187518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187511 ?auto_187517 ?auto_187513 ?auto_187514 ?auto_187516 )
      ( MAKE-1PILE ?auto_187511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187519 - BLOCK
    )
    :vars
    (
      ?auto_187524 - BLOCK
      ?auto_187526 - BLOCK
      ?auto_187520 - BLOCK
      ?auto_187521 - BLOCK
      ?auto_187525 - BLOCK
      ?auto_187523 - BLOCK
      ?auto_187522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187524 ?auto_187519 ) ( ON-TABLE ?auto_187519 ) ( not ( = ?auto_187519 ?auto_187524 ) ) ( not ( = ?auto_187519 ?auto_187526 ) ) ( not ( = ?auto_187519 ?auto_187520 ) ) ( not ( = ?auto_187524 ?auto_187526 ) ) ( not ( = ?auto_187524 ?auto_187520 ) ) ( not ( = ?auto_187526 ?auto_187520 ) ) ( ON ?auto_187526 ?auto_187524 ) ( ON-TABLE ?auto_187521 ) ( not ( = ?auto_187521 ?auto_187525 ) ) ( not ( = ?auto_187521 ?auto_187523 ) ) ( not ( = ?auto_187521 ?auto_187522 ) ) ( not ( = ?auto_187521 ?auto_187520 ) ) ( not ( = ?auto_187525 ?auto_187523 ) ) ( not ( = ?auto_187525 ?auto_187522 ) ) ( not ( = ?auto_187525 ?auto_187520 ) ) ( not ( = ?auto_187523 ?auto_187522 ) ) ( not ( = ?auto_187523 ?auto_187520 ) ) ( not ( = ?auto_187522 ?auto_187520 ) ) ( not ( = ?auto_187519 ?auto_187522 ) ) ( not ( = ?auto_187519 ?auto_187521 ) ) ( not ( = ?auto_187519 ?auto_187525 ) ) ( not ( = ?auto_187519 ?auto_187523 ) ) ( not ( = ?auto_187524 ?auto_187522 ) ) ( not ( = ?auto_187524 ?auto_187521 ) ) ( not ( = ?auto_187524 ?auto_187525 ) ) ( not ( = ?auto_187524 ?auto_187523 ) ) ( not ( = ?auto_187526 ?auto_187522 ) ) ( not ( = ?auto_187526 ?auto_187521 ) ) ( not ( = ?auto_187526 ?auto_187525 ) ) ( not ( = ?auto_187526 ?auto_187523 ) ) ( ON ?auto_187520 ?auto_187526 ) ( ON ?auto_187522 ?auto_187520 ) ( ON ?auto_187523 ?auto_187522 ) ( CLEAR ?auto_187523 ) ( HOLDING ?auto_187525 ) ( CLEAR ?auto_187521 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187521 ?auto_187525 )
      ( MAKE-1PILE ?auto_187519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187527 - BLOCK
    )
    :vars
    (
      ?auto_187533 - BLOCK
      ?auto_187529 - BLOCK
      ?auto_187534 - BLOCK
      ?auto_187531 - BLOCK
      ?auto_187530 - BLOCK
      ?auto_187532 - BLOCK
      ?auto_187528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187533 ?auto_187527 ) ( ON-TABLE ?auto_187527 ) ( not ( = ?auto_187527 ?auto_187533 ) ) ( not ( = ?auto_187527 ?auto_187529 ) ) ( not ( = ?auto_187527 ?auto_187534 ) ) ( not ( = ?auto_187533 ?auto_187529 ) ) ( not ( = ?auto_187533 ?auto_187534 ) ) ( not ( = ?auto_187529 ?auto_187534 ) ) ( ON ?auto_187529 ?auto_187533 ) ( ON-TABLE ?auto_187531 ) ( not ( = ?auto_187531 ?auto_187530 ) ) ( not ( = ?auto_187531 ?auto_187532 ) ) ( not ( = ?auto_187531 ?auto_187528 ) ) ( not ( = ?auto_187531 ?auto_187534 ) ) ( not ( = ?auto_187530 ?auto_187532 ) ) ( not ( = ?auto_187530 ?auto_187528 ) ) ( not ( = ?auto_187530 ?auto_187534 ) ) ( not ( = ?auto_187532 ?auto_187528 ) ) ( not ( = ?auto_187532 ?auto_187534 ) ) ( not ( = ?auto_187528 ?auto_187534 ) ) ( not ( = ?auto_187527 ?auto_187528 ) ) ( not ( = ?auto_187527 ?auto_187531 ) ) ( not ( = ?auto_187527 ?auto_187530 ) ) ( not ( = ?auto_187527 ?auto_187532 ) ) ( not ( = ?auto_187533 ?auto_187528 ) ) ( not ( = ?auto_187533 ?auto_187531 ) ) ( not ( = ?auto_187533 ?auto_187530 ) ) ( not ( = ?auto_187533 ?auto_187532 ) ) ( not ( = ?auto_187529 ?auto_187528 ) ) ( not ( = ?auto_187529 ?auto_187531 ) ) ( not ( = ?auto_187529 ?auto_187530 ) ) ( not ( = ?auto_187529 ?auto_187532 ) ) ( ON ?auto_187534 ?auto_187529 ) ( ON ?auto_187528 ?auto_187534 ) ( ON ?auto_187532 ?auto_187528 ) ( CLEAR ?auto_187531 ) ( ON ?auto_187530 ?auto_187532 ) ( CLEAR ?auto_187530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187527 ?auto_187533 ?auto_187529 ?auto_187534 ?auto_187528 ?auto_187532 )
      ( MAKE-1PILE ?auto_187527 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187535 - BLOCK
    )
    :vars
    (
      ?auto_187538 - BLOCK
      ?auto_187537 - BLOCK
      ?auto_187542 - BLOCK
      ?auto_187536 - BLOCK
      ?auto_187541 - BLOCK
      ?auto_187540 - BLOCK
      ?auto_187539 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187538 ?auto_187535 ) ( ON-TABLE ?auto_187535 ) ( not ( = ?auto_187535 ?auto_187538 ) ) ( not ( = ?auto_187535 ?auto_187537 ) ) ( not ( = ?auto_187535 ?auto_187542 ) ) ( not ( = ?auto_187538 ?auto_187537 ) ) ( not ( = ?auto_187538 ?auto_187542 ) ) ( not ( = ?auto_187537 ?auto_187542 ) ) ( ON ?auto_187537 ?auto_187538 ) ( not ( = ?auto_187536 ?auto_187541 ) ) ( not ( = ?auto_187536 ?auto_187540 ) ) ( not ( = ?auto_187536 ?auto_187539 ) ) ( not ( = ?auto_187536 ?auto_187542 ) ) ( not ( = ?auto_187541 ?auto_187540 ) ) ( not ( = ?auto_187541 ?auto_187539 ) ) ( not ( = ?auto_187541 ?auto_187542 ) ) ( not ( = ?auto_187540 ?auto_187539 ) ) ( not ( = ?auto_187540 ?auto_187542 ) ) ( not ( = ?auto_187539 ?auto_187542 ) ) ( not ( = ?auto_187535 ?auto_187539 ) ) ( not ( = ?auto_187535 ?auto_187536 ) ) ( not ( = ?auto_187535 ?auto_187541 ) ) ( not ( = ?auto_187535 ?auto_187540 ) ) ( not ( = ?auto_187538 ?auto_187539 ) ) ( not ( = ?auto_187538 ?auto_187536 ) ) ( not ( = ?auto_187538 ?auto_187541 ) ) ( not ( = ?auto_187538 ?auto_187540 ) ) ( not ( = ?auto_187537 ?auto_187539 ) ) ( not ( = ?auto_187537 ?auto_187536 ) ) ( not ( = ?auto_187537 ?auto_187541 ) ) ( not ( = ?auto_187537 ?auto_187540 ) ) ( ON ?auto_187542 ?auto_187537 ) ( ON ?auto_187539 ?auto_187542 ) ( ON ?auto_187540 ?auto_187539 ) ( ON ?auto_187541 ?auto_187540 ) ( CLEAR ?auto_187541 ) ( HOLDING ?auto_187536 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187536 )
      ( MAKE-1PILE ?auto_187535 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187552 - BLOCK
    )
    :vars
    (
      ?auto_187554 - BLOCK
      ?auto_187553 - BLOCK
      ?auto_187557 - BLOCK
      ?auto_187559 - BLOCK
      ?auto_187558 - BLOCK
      ?auto_187556 - BLOCK
      ?auto_187555 - BLOCK
      ?auto_187560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187554 ?auto_187552 ) ( ON-TABLE ?auto_187552 ) ( not ( = ?auto_187552 ?auto_187554 ) ) ( not ( = ?auto_187552 ?auto_187553 ) ) ( not ( = ?auto_187552 ?auto_187557 ) ) ( not ( = ?auto_187554 ?auto_187553 ) ) ( not ( = ?auto_187554 ?auto_187557 ) ) ( not ( = ?auto_187553 ?auto_187557 ) ) ( ON ?auto_187553 ?auto_187554 ) ( not ( = ?auto_187559 ?auto_187558 ) ) ( not ( = ?auto_187559 ?auto_187556 ) ) ( not ( = ?auto_187559 ?auto_187555 ) ) ( not ( = ?auto_187559 ?auto_187557 ) ) ( not ( = ?auto_187558 ?auto_187556 ) ) ( not ( = ?auto_187558 ?auto_187555 ) ) ( not ( = ?auto_187558 ?auto_187557 ) ) ( not ( = ?auto_187556 ?auto_187555 ) ) ( not ( = ?auto_187556 ?auto_187557 ) ) ( not ( = ?auto_187555 ?auto_187557 ) ) ( not ( = ?auto_187552 ?auto_187555 ) ) ( not ( = ?auto_187552 ?auto_187559 ) ) ( not ( = ?auto_187552 ?auto_187558 ) ) ( not ( = ?auto_187552 ?auto_187556 ) ) ( not ( = ?auto_187554 ?auto_187555 ) ) ( not ( = ?auto_187554 ?auto_187559 ) ) ( not ( = ?auto_187554 ?auto_187558 ) ) ( not ( = ?auto_187554 ?auto_187556 ) ) ( not ( = ?auto_187553 ?auto_187555 ) ) ( not ( = ?auto_187553 ?auto_187559 ) ) ( not ( = ?auto_187553 ?auto_187558 ) ) ( not ( = ?auto_187553 ?auto_187556 ) ) ( ON ?auto_187557 ?auto_187553 ) ( ON ?auto_187555 ?auto_187557 ) ( ON ?auto_187556 ?auto_187555 ) ( ON ?auto_187558 ?auto_187556 ) ( CLEAR ?auto_187558 ) ( ON ?auto_187559 ?auto_187560 ) ( CLEAR ?auto_187559 ) ( HAND-EMPTY ) ( not ( = ?auto_187552 ?auto_187560 ) ) ( not ( = ?auto_187554 ?auto_187560 ) ) ( not ( = ?auto_187553 ?auto_187560 ) ) ( not ( = ?auto_187557 ?auto_187560 ) ) ( not ( = ?auto_187559 ?auto_187560 ) ) ( not ( = ?auto_187558 ?auto_187560 ) ) ( not ( = ?auto_187556 ?auto_187560 ) ) ( not ( = ?auto_187555 ?auto_187560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187559 ?auto_187560 )
      ( MAKE-1PILE ?auto_187552 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187561 - BLOCK
    )
    :vars
    (
      ?auto_187566 - BLOCK
      ?auto_187564 - BLOCK
      ?auto_187569 - BLOCK
      ?auto_187565 - BLOCK
      ?auto_187568 - BLOCK
      ?auto_187563 - BLOCK
      ?auto_187567 - BLOCK
      ?auto_187562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187566 ?auto_187561 ) ( ON-TABLE ?auto_187561 ) ( not ( = ?auto_187561 ?auto_187566 ) ) ( not ( = ?auto_187561 ?auto_187564 ) ) ( not ( = ?auto_187561 ?auto_187569 ) ) ( not ( = ?auto_187566 ?auto_187564 ) ) ( not ( = ?auto_187566 ?auto_187569 ) ) ( not ( = ?auto_187564 ?auto_187569 ) ) ( ON ?auto_187564 ?auto_187566 ) ( not ( = ?auto_187565 ?auto_187568 ) ) ( not ( = ?auto_187565 ?auto_187563 ) ) ( not ( = ?auto_187565 ?auto_187567 ) ) ( not ( = ?auto_187565 ?auto_187569 ) ) ( not ( = ?auto_187568 ?auto_187563 ) ) ( not ( = ?auto_187568 ?auto_187567 ) ) ( not ( = ?auto_187568 ?auto_187569 ) ) ( not ( = ?auto_187563 ?auto_187567 ) ) ( not ( = ?auto_187563 ?auto_187569 ) ) ( not ( = ?auto_187567 ?auto_187569 ) ) ( not ( = ?auto_187561 ?auto_187567 ) ) ( not ( = ?auto_187561 ?auto_187565 ) ) ( not ( = ?auto_187561 ?auto_187568 ) ) ( not ( = ?auto_187561 ?auto_187563 ) ) ( not ( = ?auto_187566 ?auto_187567 ) ) ( not ( = ?auto_187566 ?auto_187565 ) ) ( not ( = ?auto_187566 ?auto_187568 ) ) ( not ( = ?auto_187566 ?auto_187563 ) ) ( not ( = ?auto_187564 ?auto_187567 ) ) ( not ( = ?auto_187564 ?auto_187565 ) ) ( not ( = ?auto_187564 ?auto_187568 ) ) ( not ( = ?auto_187564 ?auto_187563 ) ) ( ON ?auto_187569 ?auto_187564 ) ( ON ?auto_187567 ?auto_187569 ) ( ON ?auto_187563 ?auto_187567 ) ( ON ?auto_187565 ?auto_187562 ) ( CLEAR ?auto_187565 ) ( not ( = ?auto_187561 ?auto_187562 ) ) ( not ( = ?auto_187566 ?auto_187562 ) ) ( not ( = ?auto_187564 ?auto_187562 ) ) ( not ( = ?auto_187569 ?auto_187562 ) ) ( not ( = ?auto_187565 ?auto_187562 ) ) ( not ( = ?auto_187568 ?auto_187562 ) ) ( not ( = ?auto_187563 ?auto_187562 ) ) ( not ( = ?auto_187567 ?auto_187562 ) ) ( HOLDING ?auto_187568 ) ( CLEAR ?auto_187563 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187561 ?auto_187566 ?auto_187564 ?auto_187569 ?auto_187567 ?auto_187563 ?auto_187568 )
      ( MAKE-1PILE ?auto_187561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187570 - BLOCK
    )
    :vars
    (
      ?auto_187572 - BLOCK
      ?auto_187578 - BLOCK
      ?auto_187574 - BLOCK
      ?auto_187577 - BLOCK
      ?auto_187571 - BLOCK
      ?auto_187575 - BLOCK
      ?auto_187576 - BLOCK
      ?auto_187573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187572 ?auto_187570 ) ( ON-TABLE ?auto_187570 ) ( not ( = ?auto_187570 ?auto_187572 ) ) ( not ( = ?auto_187570 ?auto_187578 ) ) ( not ( = ?auto_187570 ?auto_187574 ) ) ( not ( = ?auto_187572 ?auto_187578 ) ) ( not ( = ?auto_187572 ?auto_187574 ) ) ( not ( = ?auto_187578 ?auto_187574 ) ) ( ON ?auto_187578 ?auto_187572 ) ( not ( = ?auto_187577 ?auto_187571 ) ) ( not ( = ?auto_187577 ?auto_187575 ) ) ( not ( = ?auto_187577 ?auto_187576 ) ) ( not ( = ?auto_187577 ?auto_187574 ) ) ( not ( = ?auto_187571 ?auto_187575 ) ) ( not ( = ?auto_187571 ?auto_187576 ) ) ( not ( = ?auto_187571 ?auto_187574 ) ) ( not ( = ?auto_187575 ?auto_187576 ) ) ( not ( = ?auto_187575 ?auto_187574 ) ) ( not ( = ?auto_187576 ?auto_187574 ) ) ( not ( = ?auto_187570 ?auto_187576 ) ) ( not ( = ?auto_187570 ?auto_187577 ) ) ( not ( = ?auto_187570 ?auto_187571 ) ) ( not ( = ?auto_187570 ?auto_187575 ) ) ( not ( = ?auto_187572 ?auto_187576 ) ) ( not ( = ?auto_187572 ?auto_187577 ) ) ( not ( = ?auto_187572 ?auto_187571 ) ) ( not ( = ?auto_187572 ?auto_187575 ) ) ( not ( = ?auto_187578 ?auto_187576 ) ) ( not ( = ?auto_187578 ?auto_187577 ) ) ( not ( = ?auto_187578 ?auto_187571 ) ) ( not ( = ?auto_187578 ?auto_187575 ) ) ( ON ?auto_187574 ?auto_187578 ) ( ON ?auto_187576 ?auto_187574 ) ( ON ?auto_187575 ?auto_187576 ) ( ON ?auto_187577 ?auto_187573 ) ( not ( = ?auto_187570 ?auto_187573 ) ) ( not ( = ?auto_187572 ?auto_187573 ) ) ( not ( = ?auto_187578 ?auto_187573 ) ) ( not ( = ?auto_187574 ?auto_187573 ) ) ( not ( = ?auto_187577 ?auto_187573 ) ) ( not ( = ?auto_187571 ?auto_187573 ) ) ( not ( = ?auto_187575 ?auto_187573 ) ) ( not ( = ?auto_187576 ?auto_187573 ) ) ( CLEAR ?auto_187575 ) ( ON ?auto_187571 ?auto_187577 ) ( CLEAR ?auto_187571 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187573 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187573 ?auto_187577 )
      ( MAKE-1PILE ?auto_187570 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187579 - BLOCK
    )
    :vars
    (
      ?auto_187583 - BLOCK
      ?auto_187586 - BLOCK
      ?auto_187581 - BLOCK
      ?auto_187582 - BLOCK
      ?auto_187584 - BLOCK
      ?auto_187580 - BLOCK
      ?auto_187587 - BLOCK
      ?auto_187585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187583 ?auto_187579 ) ( ON-TABLE ?auto_187579 ) ( not ( = ?auto_187579 ?auto_187583 ) ) ( not ( = ?auto_187579 ?auto_187586 ) ) ( not ( = ?auto_187579 ?auto_187581 ) ) ( not ( = ?auto_187583 ?auto_187586 ) ) ( not ( = ?auto_187583 ?auto_187581 ) ) ( not ( = ?auto_187586 ?auto_187581 ) ) ( ON ?auto_187586 ?auto_187583 ) ( not ( = ?auto_187582 ?auto_187584 ) ) ( not ( = ?auto_187582 ?auto_187580 ) ) ( not ( = ?auto_187582 ?auto_187587 ) ) ( not ( = ?auto_187582 ?auto_187581 ) ) ( not ( = ?auto_187584 ?auto_187580 ) ) ( not ( = ?auto_187584 ?auto_187587 ) ) ( not ( = ?auto_187584 ?auto_187581 ) ) ( not ( = ?auto_187580 ?auto_187587 ) ) ( not ( = ?auto_187580 ?auto_187581 ) ) ( not ( = ?auto_187587 ?auto_187581 ) ) ( not ( = ?auto_187579 ?auto_187587 ) ) ( not ( = ?auto_187579 ?auto_187582 ) ) ( not ( = ?auto_187579 ?auto_187584 ) ) ( not ( = ?auto_187579 ?auto_187580 ) ) ( not ( = ?auto_187583 ?auto_187587 ) ) ( not ( = ?auto_187583 ?auto_187582 ) ) ( not ( = ?auto_187583 ?auto_187584 ) ) ( not ( = ?auto_187583 ?auto_187580 ) ) ( not ( = ?auto_187586 ?auto_187587 ) ) ( not ( = ?auto_187586 ?auto_187582 ) ) ( not ( = ?auto_187586 ?auto_187584 ) ) ( not ( = ?auto_187586 ?auto_187580 ) ) ( ON ?auto_187581 ?auto_187586 ) ( ON ?auto_187587 ?auto_187581 ) ( ON ?auto_187582 ?auto_187585 ) ( not ( = ?auto_187579 ?auto_187585 ) ) ( not ( = ?auto_187583 ?auto_187585 ) ) ( not ( = ?auto_187586 ?auto_187585 ) ) ( not ( = ?auto_187581 ?auto_187585 ) ) ( not ( = ?auto_187582 ?auto_187585 ) ) ( not ( = ?auto_187584 ?auto_187585 ) ) ( not ( = ?auto_187580 ?auto_187585 ) ) ( not ( = ?auto_187587 ?auto_187585 ) ) ( ON ?auto_187584 ?auto_187582 ) ( CLEAR ?auto_187584 ) ( ON-TABLE ?auto_187585 ) ( HOLDING ?auto_187580 ) ( CLEAR ?auto_187587 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187579 ?auto_187583 ?auto_187586 ?auto_187581 ?auto_187587 ?auto_187580 )
      ( MAKE-1PILE ?auto_187579 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_187588 - BLOCK
    )
    :vars
    (
      ?auto_187596 - BLOCK
      ?auto_187594 - BLOCK
      ?auto_187595 - BLOCK
      ?auto_187591 - BLOCK
      ?auto_187590 - BLOCK
      ?auto_187592 - BLOCK
      ?auto_187593 - BLOCK
      ?auto_187589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_187596 ?auto_187588 ) ( ON-TABLE ?auto_187588 ) ( not ( = ?auto_187588 ?auto_187596 ) ) ( not ( = ?auto_187588 ?auto_187594 ) ) ( not ( = ?auto_187588 ?auto_187595 ) ) ( not ( = ?auto_187596 ?auto_187594 ) ) ( not ( = ?auto_187596 ?auto_187595 ) ) ( not ( = ?auto_187594 ?auto_187595 ) ) ( ON ?auto_187594 ?auto_187596 ) ( not ( = ?auto_187591 ?auto_187590 ) ) ( not ( = ?auto_187591 ?auto_187592 ) ) ( not ( = ?auto_187591 ?auto_187593 ) ) ( not ( = ?auto_187591 ?auto_187595 ) ) ( not ( = ?auto_187590 ?auto_187592 ) ) ( not ( = ?auto_187590 ?auto_187593 ) ) ( not ( = ?auto_187590 ?auto_187595 ) ) ( not ( = ?auto_187592 ?auto_187593 ) ) ( not ( = ?auto_187592 ?auto_187595 ) ) ( not ( = ?auto_187593 ?auto_187595 ) ) ( not ( = ?auto_187588 ?auto_187593 ) ) ( not ( = ?auto_187588 ?auto_187591 ) ) ( not ( = ?auto_187588 ?auto_187590 ) ) ( not ( = ?auto_187588 ?auto_187592 ) ) ( not ( = ?auto_187596 ?auto_187593 ) ) ( not ( = ?auto_187596 ?auto_187591 ) ) ( not ( = ?auto_187596 ?auto_187590 ) ) ( not ( = ?auto_187596 ?auto_187592 ) ) ( not ( = ?auto_187594 ?auto_187593 ) ) ( not ( = ?auto_187594 ?auto_187591 ) ) ( not ( = ?auto_187594 ?auto_187590 ) ) ( not ( = ?auto_187594 ?auto_187592 ) ) ( ON ?auto_187595 ?auto_187594 ) ( ON ?auto_187593 ?auto_187595 ) ( ON ?auto_187591 ?auto_187589 ) ( not ( = ?auto_187588 ?auto_187589 ) ) ( not ( = ?auto_187596 ?auto_187589 ) ) ( not ( = ?auto_187594 ?auto_187589 ) ) ( not ( = ?auto_187595 ?auto_187589 ) ) ( not ( = ?auto_187591 ?auto_187589 ) ) ( not ( = ?auto_187590 ?auto_187589 ) ) ( not ( = ?auto_187592 ?auto_187589 ) ) ( not ( = ?auto_187593 ?auto_187589 ) ) ( ON ?auto_187590 ?auto_187591 ) ( ON-TABLE ?auto_187589 ) ( CLEAR ?auto_187593 ) ( ON ?auto_187592 ?auto_187590 ) ( CLEAR ?auto_187592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187589 ?auto_187591 ?auto_187590 )
      ( MAKE-1PILE ?auto_187588 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187640 - BLOCK
      ?auto_187641 - BLOCK
      ?auto_187642 - BLOCK
      ?auto_187643 - BLOCK
      ?auto_187644 - BLOCK
      ?auto_187645 - BLOCK
      ?auto_187646 - BLOCK
    )
    :vars
    (
      ?auto_187647 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187640 ) ( ON ?auto_187641 ?auto_187640 ) ( ON ?auto_187642 ?auto_187641 ) ( ON ?auto_187643 ?auto_187642 ) ( ON ?auto_187644 ?auto_187643 ) ( not ( = ?auto_187640 ?auto_187641 ) ) ( not ( = ?auto_187640 ?auto_187642 ) ) ( not ( = ?auto_187640 ?auto_187643 ) ) ( not ( = ?auto_187640 ?auto_187644 ) ) ( not ( = ?auto_187640 ?auto_187645 ) ) ( not ( = ?auto_187640 ?auto_187646 ) ) ( not ( = ?auto_187641 ?auto_187642 ) ) ( not ( = ?auto_187641 ?auto_187643 ) ) ( not ( = ?auto_187641 ?auto_187644 ) ) ( not ( = ?auto_187641 ?auto_187645 ) ) ( not ( = ?auto_187641 ?auto_187646 ) ) ( not ( = ?auto_187642 ?auto_187643 ) ) ( not ( = ?auto_187642 ?auto_187644 ) ) ( not ( = ?auto_187642 ?auto_187645 ) ) ( not ( = ?auto_187642 ?auto_187646 ) ) ( not ( = ?auto_187643 ?auto_187644 ) ) ( not ( = ?auto_187643 ?auto_187645 ) ) ( not ( = ?auto_187643 ?auto_187646 ) ) ( not ( = ?auto_187644 ?auto_187645 ) ) ( not ( = ?auto_187644 ?auto_187646 ) ) ( not ( = ?auto_187645 ?auto_187646 ) ) ( ON ?auto_187646 ?auto_187647 ) ( not ( = ?auto_187640 ?auto_187647 ) ) ( not ( = ?auto_187641 ?auto_187647 ) ) ( not ( = ?auto_187642 ?auto_187647 ) ) ( not ( = ?auto_187643 ?auto_187647 ) ) ( not ( = ?auto_187644 ?auto_187647 ) ) ( not ( = ?auto_187645 ?auto_187647 ) ) ( not ( = ?auto_187646 ?auto_187647 ) ) ( CLEAR ?auto_187644 ) ( ON ?auto_187645 ?auto_187646 ) ( CLEAR ?auto_187645 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187647 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187647 ?auto_187646 )
      ( MAKE-7PILE ?auto_187640 ?auto_187641 ?auto_187642 ?auto_187643 ?auto_187644 ?auto_187645 ?auto_187646 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187648 - BLOCK
      ?auto_187649 - BLOCK
      ?auto_187650 - BLOCK
      ?auto_187651 - BLOCK
      ?auto_187652 - BLOCK
      ?auto_187653 - BLOCK
      ?auto_187654 - BLOCK
    )
    :vars
    (
      ?auto_187655 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187648 ) ( ON ?auto_187649 ?auto_187648 ) ( ON ?auto_187650 ?auto_187649 ) ( ON ?auto_187651 ?auto_187650 ) ( not ( = ?auto_187648 ?auto_187649 ) ) ( not ( = ?auto_187648 ?auto_187650 ) ) ( not ( = ?auto_187648 ?auto_187651 ) ) ( not ( = ?auto_187648 ?auto_187652 ) ) ( not ( = ?auto_187648 ?auto_187653 ) ) ( not ( = ?auto_187648 ?auto_187654 ) ) ( not ( = ?auto_187649 ?auto_187650 ) ) ( not ( = ?auto_187649 ?auto_187651 ) ) ( not ( = ?auto_187649 ?auto_187652 ) ) ( not ( = ?auto_187649 ?auto_187653 ) ) ( not ( = ?auto_187649 ?auto_187654 ) ) ( not ( = ?auto_187650 ?auto_187651 ) ) ( not ( = ?auto_187650 ?auto_187652 ) ) ( not ( = ?auto_187650 ?auto_187653 ) ) ( not ( = ?auto_187650 ?auto_187654 ) ) ( not ( = ?auto_187651 ?auto_187652 ) ) ( not ( = ?auto_187651 ?auto_187653 ) ) ( not ( = ?auto_187651 ?auto_187654 ) ) ( not ( = ?auto_187652 ?auto_187653 ) ) ( not ( = ?auto_187652 ?auto_187654 ) ) ( not ( = ?auto_187653 ?auto_187654 ) ) ( ON ?auto_187654 ?auto_187655 ) ( not ( = ?auto_187648 ?auto_187655 ) ) ( not ( = ?auto_187649 ?auto_187655 ) ) ( not ( = ?auto_187650 ?auto_187655 ) ) ( not ( = ?auto_187651 ?auto_187655 ) ) ( not ( = ?auto_187652 ?auto_187655 ) ) ( not ( = ?auto_187653 ?auto_187655 ) ) ( not ( = ?auto_187654 ?auto_187655 ) ) ( ON ?auto_187653 ?auto_187654 ) ( CLEAR ?auto_187653 ) ( ON-TABLE ?auto_187655 ) ( HOLDING ?auto_187652 ) ( CLEAR ?auto_187651 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187648 ?auto_187649 ?auto_187650 ?auto_187651 ?auto_187652 )
      ( MAKE-7PILE ?auto_187648 ?auto_187649 ?auto_187650 ?auto_187651 ?auto_187652 ?auto_187653 ?auto_187654 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187656 - BLOCK
      ?auto_187657 - BLOCK
      ?auto_187658 - BLOCK
      ?auto_187659 - BLOCK
      ?auto_187660 - BLOCK
      ?auto_187661 - BLOCK
      ?auto_187662 - BLOCK
    )
    :vars
    (
      ?auto_187663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187656 ) ( ON ?auto_187657 ?auto_187656 ) ( ON ?auto_187658 ?auto_187657 ) ( ON ?auto_187659 ?auto_187658 ) ( not ( = ?auto_187656 ?auto_187657 ) ) ( not ( = ?auto_187656 ?auto_187658 ) ) ( not ( = ?auto_187656 ?auto_187659 ) ) ( not ( = ?auto_187656 ?auto_187660 ) ) ( not ( = ?auto_187656 ?auto_187661 ) ) ( not ( = ?auto_187656 ?auto_187662 ) ) ( not ( = ?auto_187657 ?auto_187658 ) ) ( not ( = ?auto_187657 ?auto_187659 ) ) ( not ( = ?auto_187657 ?auto_187660 ) ) ( not ( = ?auto_187657 ?auto_187661 ) ) ( not ( = ?auto_187657 ?auto_187662 ) ) ( not ( = ?auto_187658 ?auto_187659 ) ) ( not ( = ?auto_187658 ?auto_187660 ) ) ( not ( = ?auto_187658 ?auto_187661 ) ) ( not ( = ?auto_187658 ?auto_187662 ) ) ( not ( = ?auto_187659 ?auto_187660 ) ) ( not ( = ?auto_187659 ?auto_187661 ) ) ( not ( = ?auto_187659 ?auto_187662 ) ) ( not ( = ?auto_187660 ?auto_187661 ) ) ( not ( = ?auto_187660 ?auto_187662 ) ) ( not ( = ?auto_187661 ?auto_187662 ) ) ( ON ?auto_187662 ?auto_187663 ) ( not ( = ?auto_187656 ?auto_187663 ) ) ( not ( = ?auto_187657 ?auto_187663 ) ) ( not ( = ?auto_187658 ?auto_187663 ) ) ( not ( = ?auto_187659 ?auto_187663 ) ) ( not ( = ?auto_187660 ?auto_187663 ) ) ( not ( = ?auto_187661 ?auto_187663 ) ) ( not ( = ?auto_187662 ?auto_187663 ) ) ( ON ?auto_187661 ?auto_187662 ) ( ON-TABLE ?auto_187663 ) ( CLEAR ?auto_187659 ) ( ON ?auto_187660 ?auto_187661 ) ( CLEAR ?auto_187660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187663 ?auto_187662 ?auto_187661 )
      ( MAKE-7PILE ?auto_187656 ?auto_187657 ?auto_187658 ?auto_187659 ?auto_187660 ?auto_187661 ?auto_187662 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187664 - BLOCK
      ?auto_187665 - BLOCK
      ?auto_187666 - BLOCK
      ?auto_187667 - BLOCK
      ?auto_187668 - BLOCK
      ?auto_187669 - BLOCK
      ?auto_187670 - BLOCK
    )
    :vars
    (
      ?auto_187671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187664 ) ( ON ?auto_187665 ?auto_187664 ) ( ON ?auto_187666 ?auto_187665 ) ( not ( = ?auto_187664 ?auto_187665 ) ) ( not ( = ?auto_187664 ?auto_187666 ) ) ( not ( = ?auto_187664 ?auto_187667 ) ) ( not ( = ?auto_187664 ?auto_187668 ) ) ( not ( = ?auto_187664 ?auto_187669 ) ) ( not ( = ?auto_187664 ?auto_187670 ) ) ( not ( = ?auto_187665 ?auto_187666 ) ) ( not ( = ?auto_187665 ?auto_187667 ) ) ( not ( = ?auto_187665 ?auto_187668 ) ) ( not ( = ?auto_187665 ?auto_187669 ) ) ( not ( = ?auto_187665 ?auto_187670 ) ) ( not ( = ?auto_187666 ?auto_187667 ) ) ( not ( = ?auto_187666 ?auto_187668 ) ) ( not ( = ?auto_187666 ?auto_187669 ) ) ( not ( = ?auto_187666 ?auto_187670 ) ) ( not ( = ?auto_187667 ?auto_187668 ) ) ( not ( = ?auto_187667 ?auto_187669 ) ) ( not ( = ?auto_187667 ?auto_187670 ) ) ( not ( = ?auto_187668 ?auto_187669 ) ) ( not ( = ?auto_187668 ?auto_187670 ) ) ( not ( = ?auto_187669 ?auto_187670 ) ) ( ON ?auto_187670 ?auto_187671 ) ( not ( = ?auto_187664 ?auto_187671 ) ) ( not ( = ?auto_187665 ?auto_187671 ) ) ( not ( = ?auto_187666 ?auto_187671 ) ) ( not ( = ?auto_187667 ?auto_187671 ) ) ( not ( = ?auto_187668 ?auto_187671 ) ) ( not ( = ?auto_187669 ?auto_187671 ) ) ( not ( = ?auto_187670 ?auto_187671 ) ) ( ON ?auto_187669 ?auto_187670 ) ( ON-TABLE ?auto_187671 ) ( ON ?auto_187668 ?auto_187669 ) ( CLEAR ?auto_187668 ) ( HOLDING ?auto_187667 ) ( CLEAR ?auto_187666 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187664 ?auto_187665 ?auto_187666 ?auto_187667 )
      ( MAKE-7PILE ?auto_187664 ?auto_187665 ?auto_187666 ?auto_187667 ?auto_187668 ?auto_187669 ?auto_187670 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187672 - BLOCK
      ?auto_187673 - BLOCK
      ?auto_187674 - BLOCK
      ?auto_187675 - BLOCK
      ?auto_187676 - BLOCK
      ?auto_187677 - BLOCK
      ?auto_187678 - BLOCK
    )
    :vars
    (
      ?auto_187679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187672 ) ( ON ?auto_187673 ?auto_187672 ) ( ON ?auto_187674 ?auto_187673 ) ( not ( = ?auto_187672 ?auto_187673 ) ) ( not ( = ?auto_187672 ?auto_187674 ) ) ( not ( = ?auto_187672 ?auto_187675 ) ) ( not ( = ?auto_187672 ?auto_187676 ) ) ( not ( = ?auto_187672 ?auto_187677 ) ) ( not ( = ?auto_187672 ?auto_187678 ) ) ( not ( = ?auto_187673 ?auto_187674 ) ) ( not ( = ?auto_187673 ?auto_187675 ) ) ( not ( = ?auto_187673 ?auto_187676 ) ) ( not ( = ?auto_187673 ?auto_187677 ) ) ( not ( = ?auto_187673 ?auto_187678 ) ) ( not ( = ?auto_187674 ?auto_187675 ) ) ( not ( = ?auto_187674 ?auto_187676 ) ) ( not ( = ?auto_187674 ?auto_187677 ) ) ( not ( = ?auto_187674 ?auto_187678 ) ) ( not ( = ?auto_187675 ?auto_187676 ) ) ( not ( = ?auto_187675 ?auto_187677 ) ) ( not ( = ?auto_187675 ?auto_187678 ) ) ( not ( = ?auto_187676 ?auto_187677 ) ) ( not ( = ?auto_187676 ?auto_187678 ) ) ( not ( = ?auto_187677 ?auto_187678 ) ) ( ON ?auto_187678 ?auto_187679 ) ( not ( = ?auto_187672 ?auto_187679 ) ) ( not ( = ?auto_187673 ?auto_187679 ) ) ( not ( = ?auto_187674 ?auto_187679 ) ) ( not ( = ?auto_187675 ?auto_187679 ) ) ( not ( = ?auto_187676 ?auto_187679 ) ) ( not ( = ?auto_187677 ?auto_187679 ) ) ( not ( = ?auto_187678 ?auto_187679 ) ) ( ON ?auto_187677 ?auto_187678 ) ( ON-TABLE ?auto_187679 ) ( ON ?auto_187676 ?auto_187677 ) ( CLEAR ?auto_187674 ) ( ON ?auto_187675 ?auto_187676 ) ( CLEAR ?auto_187675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187679 ?auto_187678 ?auto_187677 ?auto_187676 )
      ( MAKE-7PILE ?auto_187672 ?auto_187673 ?auto_187674 ?auto_187675 ?auto_187676 ?auto_187677 ?auto_187678 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187680 - BLOCK
      ?auto_187681 - BLOCK
      ?auto_187682 - BLOCK
      ?auto_187683 - BLOCK
      ?auto_187684 - BLOCK
      ?auto_187685 - BLOCK
      ?auto_187686 - BLOCK
    )
    :vars
    (
      ?auto_187687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187680 ) ( ON ?auto_187681 ?auto_187680 ) ( not ( = ?auto_187680 ?auto_187681 ) ) ( not ( = ?auto_187680 ?auto_187682 ) ) ( not ( = ?auto_187680 ?auto_187683 ) ) ( not ( = ?auto_187680 ?auto_187684 ) ) ( not ( = ?auto_187680 ?auto_187685 ) ) ( not ( = ?auto_187680 ?auto_187686 ) ) ( not ( = ?auto_187681 ?auto_187682 ) ) ( not ( = ?auto_187681 ?auto_187683 ) ) ( not ( = ?auto_187681 ?auto_187684 ) ) ( not ( = ?auto_187681 ?auto_187685 ) ) ( not ( = ?auto_187681 ?auto_187686 ) ) ( not ( = ?auto_187682 ?auto_187683 ) ) ( not ( = ?auto_187682 ?auto_187684 ) ) ( not ( = ?auto_187682 ?auto_187685 ) ) ( not ( = ?auto_187682 ?auto_187686 ) ) ( not ( = ?auto_187683 ?auto_187684 ) ) ( not ( = ?auto_187683 ?auto_187685 ) ) ( not ( = ?auto_187683 ?auto_187686 ) ) ( not ( = ?auto_187684 ?auto_187685 ) ) ( not ( = ?auto_187684 ?auto_187686 ) ) ( not ( = ?auto_187685 ?auto_187686 ) ) ( ON ?auto_187686 ?auto_187687 ) ( not ( = ?auto_187680 ?auto_187687 ) ) ( not ( = ?auto_187681 ?auto_187687 ) ) ( not ( = ?auto_187682 ?auto_187687 ) ) ( not ( = ?auto_187683 ?auto_187687 ) ) ( not ( = ?auto_187684 ?auto_187687 ) ) ( not ( = ?auto_187685 ?auto_187687 ) ) ( not ( = ?auto_187686 ?auto_187687 ) ) ( ON ?auto_187685 ?auto_187686 ) ( ON-TABLE ?auto_187687 ) ( ON ?auto_187684 ?auto_187685 ) ( ON ?auto_187683 ?auto_187684 ) ( CLEAR ?auto_187683 ) ( HOLDING ?auto_187682 ) ( CLEAR ?auto_187681 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187680 ?auto_187681 ?auto_187682 )
      ( MAKE-7PILE ?auto_187680 ?auto_187681 ?auto_187682 ?auto_187683 ?auto_187684 ?auto_187685 ?auto_187686 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187688 - BLOCK
      ?auto_187689 - BLOCK
      ?auto_187690 - BLOCK
      ?auto_187691 - BLOCK
      ?auto_187692 - BLOCK
      ?auto_187693 - BLOCK
      ?auto_187694 - BLOCK
    )
    :vars
    (
      ?auto_187695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187688 ) ( ON ?auto_187689 ?auto_187688 ) ( not ( = ?auto_187688 ?auto_187689 ) ) ( not ( = ?auto_187688 ?auto_187690 ) ) ( not ( = ?auto_187688 ?auto_187691 ) ) ( not ( = ?auto_187688 ?auto_187692 ) ) ( not ( = ?auto_187688 ?auto_187693 ) ) ( not ( = ?auto_187688 ?auto_187694 ) ) ( not ( = ?auto_187689 ?auto_187690 ) ) ( not ( = ?auto_187689 ?auto_187691 ) ) ( not ( = ?auto_187689 ?auto_187692 ) ) ( not ( = ?auto_187689 ?auto_187693 ) ) ( not ( = ?auto_187689 ?auto_187694 ) ) ( not ( = ?auto_187690 ?auto_187691 ) ) ( not ( = ?auto_187690 ?auto_187692 ) ) ( not ( = ?auto_187690 ?auto_187693 ) ) ( not ( = ?auto_187690 ?auto_187694 ) ) ( not ( = ?auto_187691 ?auto_187692 ) ) ( not ( = ?auto_187691 ?auto_187693 ) ) ( not ( = ?auto_187691 ?auto_187694 ) ) ( not ( = ?auto_187692 ?auto_187693 ) ) ( not ( = ?auto_187692 ?auto_187694 ) ) ( not ( = ?auto_187693 ?auto_187694 ) ) ( ON ?auto_187694 ?auto_187695 ) ( not ( = ?auto_187688 ?auto_187695 ) ) ( not ( = ?auto_187689 ?auto_187695 ) ) ( not ( = ?auto_187690 ?auto_187695 ) ) ( not ( = ?auto_187691 ?auto_187695 ) ) ( not ( = ?auto_187692 ?auto_187695 ) ) ( not ( = ?auto_187693 ?auto_187695 ) ) ( not ( = ?auto_187694 ?auto_187695 ) ) ( ON ?auto_187693 ?auto_187694 ) ( ON-TABLE ?auto_187695 ) ( ON ?auto_187692 ?auto_187693 ) ( ON ?auto_187691 ?auto_187692 ) ( CLEAR ?auto_187689 ) ( ON ?auto_187690 ?auto_187691 ) ( CLEAR ?auto_187690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187695 ?auto_187694 ?auto_187693 ?auto_187692 ?auto_187691 )
      ( MAKE-7PILE ?auto_187688 ?auto_187689 ?auto_187690 ?auto_187691 ?auto_187692 ?auto_187693 ?auto_187694 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187696 - BLOCK
      ?auto_187697 - BLOCK
      ?auto_187698 - BLOCK
      ?auto_187699 - BLOCK
      ?auto_187700 - BLOCK
      ?auto_187701 - BLOCK
      ?auto_187702 - BLOCK
    )
    :vars
    (
      ?auto_187703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187696 ) ( not ( = ?auto_187696 ?auto_187697 ) ) ( not ( = ?auto_187696 ?auto_187698 ) ) ( not ( = ?auto_187696 ?auto_187699 ) ) ( not ( = ?auto_187696 ?auto_187700 ) ) ( not ( = ?auto_187696 ?auto_187701 ) ) ( not ( = ?auto_187696 ?auto_187702 ) ) ( not ( = ?auto_187697 ?auto_187698 ) ) ( not ( = ?auto_187697 ?auto_187699 ) ) ( not ( = ?auto_187697 ?auto_187700 ) ) ( not ( = ?auto_187697 ?auto_187701 ) ) ( not ( = ?auto_187697 ?auto_187702 ) ) ( not ( = ?auto_187698 ?auto_187699 ) ) ( not ( = ?auto_187698 ?auto_187700 ) ) ( not ( = ?auto_187698 ?auto_187701 ) ) ( not ( = ?auto_187698 ?auto_187702 ) ) ( not ( = ?auto_187699 ?auto_187700 ) ) ( not ( = ?auto_187699 ?auto_187701 ) ) ( not ( = ?auto_187699 ?auto_187702 ) ) ( not ( = ?auto_187700 ?auto_187701 ) ) ( not ( = ?auto_187700 ?auto_187702 ) ) ( not ( = ?auto_187701 ?auto_187702 ) ) ( ON ?auto_187702 ?auto_187703 ) ( not ( = ?auto_187696 ?auto_187703 ) ) ( not ( = ?auto_187697 ?auto_187703 ) ) ( not ( = ?auto_187698 ?auto_187703 ) ) ( not ( = ?auto_187699 ?auto_187703 ) ) ( not ( = ?auto_187700 ?auto_187703 ) ) ( not ( = ?auto_187701 ?auto_187703 ) ) ( not ( = ?auto_187702 ?auto_187703 ) ) ( ON ?auto_187701 ?auto_187702 ) ( ON-TABLE ?auto_187703 ) ( ON ?auto_187700 ?auto_187701 ) ( ON ?auto_187699 ?auto_187700 ) ( ON ?auto_187698 ?auto_187699 ) ( CLEAR ?auto_187698 ) ( HOLDING ?auto_187697 ) ( CLEAR ?auto_187696 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187696 ?auto_187697 )
      ( MAKE-7PILE ?auto_187696 ?auto_187697 ?auto_187698 ?auto_187699 ?auto_187700 ?auto_187701 ?auto_187702 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187704 - BLOCK
      ?auto_187705 - BLOCK
      ?auto_187706 - BLOCK
      ?auto_187707 - BLOCK
      ?auto_187708 - BLOCK
      ?auto_187709 - BLOCK
      ?auto_187710 - BLOCK
    )
    :vars
    (
      ?auto_187711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187704 ) ( not ( = ?auto_187704 ?auto_187705 ) ) ( not ( = ?auto_187704 ?auto_187706 ) ) ( not ( = ?auto_187704 ?auto_187707 ) ) ( not ( = ?auto_187704 ?auto_187708 ) ) ( not ( = ?auto_187704 ?auto_187709 ) ) ( not ( = ?auto_187704 ?auto_187710 ) ) ( not ( = ?auto_187705 ?auto_187706 ) ) ( not ( = ?auto_187705 ?auto_187707 ) ) ( not ( = ?auto_187705 ?auto_187708 ) ) ( not ( = ?auto_187705 ?auto_187709 ) ) ( not ( = ?auto_187705 ?auto_187710 ) ) ( not ( = ?auto_187706 ?auto_187707 ) ) ( not ( = ?auto_187706 ?auto_187708 ) ) ( not ( = ?auto_187706 ?auto_187709 ) ) ( not ( = ?auto_187706 ?auto_187710 ) ) ( not ( = ?auto_187707 ?auto_187708 ) ) ( not ( = ?auto_187707 ?auto_187709 ) ) ( not ( = ?auto_187707 ?auto_187710 ) ) ( not ( = ?auto_187708 ?auto_187709 ) ) ( not ( = ?auto_187708 ?auto_187710 ) ) ( not ( = ?auto_187709 ?auto_187710 ) ) ( ON ?auto_187710 ?auto_187711 ) ( not ( = ?auto_187704 ?auto_187711 ) ) ( not ( = ?auto_187705 ?auto_187711 ) ) ( not ( = ?auto_187706 ?auto_187711 ) ) ( not ( = ?auto_187707 ?auto_187711 ) ) ( not ( = ?auto_187708 ?auto_187711 ) ) ( not ( = ?auto_187709 ?auto_187711 ) ) ( not ( = ?auto_187710 ?auto_187711 ) ) ( ON ?auto_187709 ?auto_187710 ) ( ON-TABLE ?auto_187711 ) ( ON ?auto_187708 ?auto_187709 ) ( ON ?auto_187707 ?auto_187708 ) ( ON ?auto_187706 ?auto_187707 ) ( CLEAR ?auto_187704 ) ( ON ?auto_187705 ?auto_187706 ) ( CLEAR ?auto_187705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187711 ?auto_187710 ?auto_187709 ?auto_187708 ?auto_187707 ?auto_187706 )
      ( MAKE-7PILE ?auto_187704 ?auto_187705 ?auto_187706 ?auto_187707 ?auto_187708 ?auto_187709 ?auto_187710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187712 - BLOCK
      ?auto_187713 - BLOCK
      ?auto_187714 - BLOCK
      ?auto_187715 - BLOCK
      ?auto_187716 - BLOCK
      ?auto_187717 - BLOCK
      ?auto_187718 - BLOCK
    )
    :vars
    (
      ?auto_187719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187712 ?auto_187713 ) ) ( not ( = ?auto_187712 ?auto_187714 ) ) ( not ( = ?auto_187712 ?auto_187715 ) ) ( not ( = ?auto_187712 ?auto_187716 ) ) ( not ( = ?auto_187712 ?auto_187717 ) ) ( not ( = ?auto_187712 ?auto_187718 ) ) ( not ( = ?auto_187713 ?auto_187714 ) ) ( not ( = ?auto_187713 ?auto_187715 ) ) ( not ( = ?auto_187713 ?auto_187716 ) ) ( not ( = ?auto_187713 ?auto_187717 ) ) ( not ( = ?auto_187713 ?auto_187718 ) ) ( not ( = ?auto_187714 ?auto_187715 ) ) ( not ( = ?auto_187714 ?auto_187716 ) ) ( not ( = ?auto_187714 ?auto_187717 ) ) ( not ( = ?auto_187714 ?auto_187718 ) ) ( not ( = ?auto_187715 ?auto_187716 ) ) ( not ( = ?auto_187715 ?auto_187717 ) ) ( not ( = ?auto_187715 ?auto_187718 ) ) ( not ( = ?auto_187716 ?auto_187717 ) ) ( not ( = ?auto_187716 ?auto_187718 ) ) ( not ( = ?auto_187717 ?auto_187718 ) ) ( ON ?auto_187718 ?auto_187719 ) ( not ( = ?auto_187712 ?auto_187719 ) ) ( not ( = ?auto_187713 ?auto_187719 ) ) ( not ( = ?auto_187714 ?auto_187719 ) ) ( not ( = ?auto_187715 ?auto_187719 ) ) ( not ( = ?auto_187716 ?auto_187719 ) ) ( not ( = ?auto_187717 ?auto_187719 ) ) ( not ( = ?auto_187718 ?auto_187719 ) ) ( ON ?auto_187717 ?auto_187718 ) ( ON-TABLE ?auto_187719 ) ( ON ?auto_187716 ?auto_187717 ) ( ON ?auto_187715 ?auto_187716 ) ( ON ?auto_187714 ?auto_187715 ) ( ON ?auto_187713 ?auto_187714 ) ( CLEAR ?auto_187713 ) ( HOLDING ?auto_187712 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187712 )
      ( MAKE-7PILE ?auto_187712 ?auto_187713 ?auto_187714 ?auto_187715 ?auto_187716 ?auto_187717 ?auto_187718 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187720 - BLOCK
      ?auto_187721 - BLOCK
      ?auto_187722 - BLOCK
      ?auto_187723 - BLOCK
      ?auto_187724 - BLOCK
      ?auto_187725 - BLOCK
      ?auto_187726 - BLOCK
    )
    :vars
    (
      ?auto_187727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187720 ?auto_187721 ) ) ( not ( = ?auto_187720 ?auto_187722 ) ) ( not ( = ?auto_187720 ?auto_187723 ) ) ( not ( = ?auto_187720 ?auto_187724 ) ) ( not ( = ?auto_187720 ?auto_187725 ) ) ( not ( = ?auto_187720 ?auto_187726 ) ) ( not ( = ?auto_187721 ?auto_187722 ) ) ( not ( = ?auto_187721 ?auto_187723 ) ) ( not ( = ?auto_187721 ?auto_187724 ) ) ( not ( = ?auto_187721 ?auto_187725 ) ) ( not ( = ?auto_187721 ?auto_187726 ) ) ( not ( = ?auto_187722 ?auto_187723 ) ) ( not ( = ?auto_187722 ?auto_187724 ) ) ( not ( = ?auto_187722 ?auto_187725 ) ) ( not ( = ?auto_187722 ?auto_187726 ) ) ( not ( = ?auto_187723 ?auto_187724 ) ) ( not ( = ?auto_187723 ?auto_187725 ) ) ( not ( = ?auto_187723 ?auto_187726 ) ) ( not ( = ?auto_187724 ?auto_187725 ) ) ( not ( = ?auto_187724 ?auto_187726 ) ) ( not ( = ?auto_187725 ?auto_187726 ) ) ( ON ?auto_187726 ?auto_187727 ) ( not ( = ?auto_187720 ?auto_187727 ) ) ( not ( = ?auto_187721 ?auto_187727 ) ) ( not ( = ?auto_187722 ?auto_187727 ) ) ( not ( = ?auto_187723 ?auto_187727 ) ) ( not ( = ?auto_187724 ?auto_187727 ) ) ( not ( = ?auto_187725 ?auto_187727 ) ) ( not ( = ?auto_187726 ?auto_187727 ) ) ( ON ?auto_187725 ?auto_187726 ) ( ON-TABLE ?auto_187727 ) ( ON ?auto_187724 ?auto_187725 ) ( ON ?auto_187723 ?auto_187724 ) ( ON ?auto_187722 ?auto_187723 ) ( ON ?auto_187721 ?auto_187722 ) ( ON ?auto_187720 ?auto_187721 ) ( CLEAR ?auto_187720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187727 ?auto_187726 ?auto_187725 ?auto_187724 ?auto_187723 ?auto_187722 ?auto_187721 )
      ( MAKE-7PILE ?auto_187720 ?auto_187721 ?auto_187722 ?auto_187723 ?auto_187724 ?auto_187725 ?auto_187726 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187735 - BLOCK
      ?auto_187736 - BLOCK
      ?auto_187737 - BLOCK
      ?auto_187738 - BLOCK
      ?auto_187739 - BLOCK
      ?auto_187740 - BLOCK
      ?auto_187741 - BLOCK
    )
    :vars
    (
      ?auto_187742 - BLOCK
      ?auto_187743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187735 ?auto_187736 ) ) ( not ( = ?auto_187735 ?auto_187737 ) ) ( not ( = ?auto_187735 ?auto_187738 ) ) ( not ( = ?auto_187735 ?auto_187739 ) ) ( not ( = ?auto_187735 ?auto_187740 ) ) ( not ( = ?auto_187735 ?auto_187741 ) ) ( not ( = ?auto_187736 ?auto_187737 ) ) ( not ( = ?auto_187736 ?auto_187738 ) ) ( not ( = ?auto_187736 ?auto_187739 ) ) ( not ( = ?auto_187736 ?auto_187740 ) ) ( not ( = ?auto_187736 ?auto_187741 ) ) ( not ( = ?auto_187737 ?auto_187738 ) ) ( not ( = ?auto_187737 ?auto_187739 ) ) ( not ( = ?auto_187737 ?auto_187740 ) ) ( not ( = ?auto_187737 ?auto_187741 ) ) ( not ( = ?auto_187738 ?auto_187739 ) ) ( not ( = ?auto_187738 ?auto_187740 ) ) ( not ( = ?auto_187738 ?auto_187741 ) ) ( not ( = ?auto_187739 ?auto_187740 ) ) ( not ( = ?auto_187739 ?auto_187741 ) ) ( not ( = ?auto_187740 ?auto_187741 ) ) ( ON ?auto_187741 ?auto_187742 ) ( not ( = ?auto_187735 ?auto_187742 ) ) ( not ( = ?auto_187736 ?auto_187742 ) ) ( not ( = ?auto_187737 ?auto_187742 ) ) ( not ( = ?auto_187738 ?auto_187742 ) ) ( not ( = ?auto_187739 ?auto_187742 ) ) ( not ( = ?auto_187740 ?auto_187742 ) ) ( not ( = ?auto_187741 ?auto_187742 ) ) ( ON ?auto_187740 ?auto_187741 ) ( ON-TABLE ?auto_187742 ) ( ON ?auto_187739 ?auto_187740 ) ( ON ?auto_187738 ?auto_187739 ) ( ON ?auto_187737 ?auto_187738 ) ( ON ?auto_187736 ?auto_187737 ) ( CLEAR ?auto_187736 ) ( ON ?auto_187735 ?auto_187743 ) ( CLEAR ?auto_187735 ) ( HAND-EMPTY ) ( not ( = ?auto_187735 ?auto_187743 ) ) ( not ( = ?auto_187736 ?auto_187743 ) ) ( not ( = ?auto_187737 ?auto_187743 ) ) ( not ( = ?auto_187738 ?auto_187743 ) ) ( not ( = ?auto_187739 ?auto_187743 ) ) ( not ( = ?auto_187740 ?auto_187743 ) ) ( not ( = ?auto_187741 ?auto_187743 ) ) ( not ( = ?auto_187742 ?auto_187743 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_187735 ?auto_187743 )
      ( MAKE-7PILE ?auto_187735 ?auto_187736 ?auto_187737 ?auto_187738 ?auto_187739 ?auto_187740 ?auto_187741 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187744 - BLOCK
      ?auto_187745 - BLOCK
      ?auto_187746 - BLOCK
      ?auto_187747 - BLOCK
      ?auto_187748 - BLOCK
      ?auto_187749 - BLOCK
      ?auto_187750 - BLOCK
    )
    :vars
    (
      ?auto_187751 - BLOCK
      ?auto_187752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187744 ?auto_187745 ) ) ( not ( = ?auto_187744 ?auto_187746 ) ) ( not ( = ?auto_187744 ?auto_187747 ) ) ( not ( = ?auto_187744 ?auto_187748 ) ) ( not ( = ?auto_187744 ?auto_187749 ) ) ( not ( = ?auto_187744 ?auto_187750 ) ) ( not ( = ?auto_187745 ?auto_187746 ) ) ( not ( = ?auto_187745 ?auto_187747 ) ) ( not ( = ?auto_187745 ?auto_187748 ) ) ( not ( = ?auto_187745 ?auto_187749 ) ) ( not ( = ?auto_187745 ?auto_187750 ) ) ( not ( = ?auto_187746 ?auto_187747 ) ) ( not ( = ?auto_187746 ?auto_187748 ) ) ( not ( = ?auto_187746 ?auto_187749 ) ) ( not ( = ?auto_187746 ?auto_187750 ) ) ( not ( = ?auto_187747 ?auto_187748 ) ) ( not ( = ?auto_187747 ?auto_187749 ) ) ( not ( = ?auto_187747 ?auto_187750 ) ) ( not ( = ?auto_187748 ?auto_187749 ) ) ( not ( = ?auto_187748 ?auto_187750 ) ) ( not ( = ?auto_187749 ?auto_187750 ) ) ( ON ?auto_187750 ?auto_187751 ) ( not ( = ?auto_187744 ?auto_187751 ) ) ( not ( = ?auto_187745 ?auto_187751 ) ) ( not ( = ?auto_187746 ?auto_187751 ) ) ( not ( = ?auto_187747 ?auto_187751 ) ) ( not ( = ?auto_187748 ?auto_187751 ) ) ( not ( = ?auto_187749 ?auto_187751 ) ) ( not ( = ?auto_187750 ?auto_187751 ) ) ( ON ?auto_187749 ?auto_187750 ) ( ON-TABLE ?auto_187751 ) ( ON ?auto_187748 ?auto_187749 ) ( ON ?auto_187747 ?auto_187748 ) ( ON ?auto_187746 ?auto_187747 ) ( ON ?auto_187744 ?auto_187752 ) ( CLEAR ?auto_187744 ) ( not ( = ?auto_187744 ?auto_187752 ) ) ( not ( = ?auto_187745 ?auto_187752 ) ) ( not ( = ?auto_187746 ?auto_187752 ) ) ( not ( = ?auto_187747 ?auto_187752 ) ) ( not ( = ?auto_187748 ?auto_187752 ) ) ( not ( = ?auto_187749 ?auto_187752 ) ) ( not ( = ?auto_187750 ?auto_187752 ) ) ( not ( = ?auto_187751 ?auto_187752 ) ) ( HOLDING ?auto_187745 ) ( CLEAR ?auto_187746 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187751 ?auto_187750 ?auto_187749 ?auto_187748 ?auto_187747 ?auto_187746 ?auto_187745 )
      ( MAKE-7PILE ?auto_187744 ?auto_187745 ?auto_187746 ?auto_187747 ?auto_187748 ?auto_187749 ?auto_187750 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187753 - BLOCK
      ?auto_187754 - BLOCK
      ?auto_187755 - BLOCK
      ?auto_187756 - BLOCK
      ?auto_187757 - BLOCK
      ?auto_187758 - BLOCK
      ?auto_187759 - BLOCK
    )
    :vars
    (
      ?auto_187760 - BLOCK
      ?auto_187761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187753 ?auto_187754 ) ) ( not ( = ?auto_187753 ?auto_187755 ) ) ( not ( = ?auto_187753 ?auto_187756 ) ) ( not ( = ?auto_187753 ?auto_187757 ) ) ( not ( = ?auto_187753 ?auto_187758 ) ) ( not ( = ?auto_187753 ?auto_187759 ) ) ( not ( = ?auto_187754 ?auto_187755 ) ) ( not ( = ?auto_187754 ?auto_187756 ) ) ( not ( = ?auto_187754 ?auto_187757 ) ) ( not ( = ?auto_187754 ?auto_187758 ) ) ( not ( = ?auto_187754 ?auto_187759 ) ) ( not ( = ?auto_187755 ?auto_187756 ) ) ( not ( = ?auto_187755 ?auto_187757 ) ) ( not ( = ?auto_187755 ?auto_187758 ) ) ( not ( = ?auto_187755 ?auto_187759 ) ) ( not ( = ?auto_187756 ?auto_187757 ) ) ( not ( = ?auto_187756 ?auto_187758 ) ) ( not ( = ?auto_187756 ?auto_187759 ) ) ( not ( = ?auto_187757 ?auto_187758 ) ) ( not ( = ?auto_187757 ?auto_187759 ) ) ( not ( = ?auto_187758 ?auto_187759 ) ) ( ON ?auto_187759 ?auto_187760 ) ( not ( = ?auto_187753 ?auto_187760 ) ) ( not ( = ?auto_187754 ?auto_187760 ) ) ( not ( = ?auto_187755 ?auto_187760 ) ) ( not ( = ?auto_187756 ?auto_187760 ) ) ( not ( = ?auto_187757 ?auto_187760 ) ) ( not ( = ?auto_187758 ?auto_187760 ) ) ( not ( = ?auto_187759 ?auto_187760 ) ) ( ON ?auto_187758 ?auto_187759 ) ( ON-TABLE ?auto_187760 ) ( ON ?auto_187757 ?auto_187758 ) ( ON ?auto_187756 ?auto_187757 ) ( ON ?auto_187755 ?auto_187756 ) ( ON ?auto_187753 ?auto_187761 ) ( not ( = ?auto_187753 ?auto_187761 ) ) ( not ( = ?auto_187754 ?auto_187761 ) ) ( not ( = ?auto_187755 ?auto_187761 ) ) ( not ( = ?auto_187756 ?auto_187761 ) ) ( not ( = ?auto_187757 ?auto_187761 ) ) ( not ( = ?auto_187758 ?auto_187761 ) ) ( not ( = ?auto_187759 ?auto_187761 ) ) ( not ( = ?auto_187760 ?auto_187761 ) ) ( CLEAR ?auto_187755 ) ( ON ?auto_187754 ?auto_187753 ) ( CLEAR ?auto_187754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_187761 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187761 ?auto_187753 )
      ( MAKE-7PILE ?auto_187753 ?auto_187754 ?auto_187755 ?auto_187756 ?auto_187757 ?auto_187758 ?auto_187759 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187762 - BLOCK
      ?auto_187763 - BLOCK
      ?auto_187764 - BLOCK
      ?auto_187765 - BLOCK
      ?auto_187766 - BLOCK
      ?auto_187767 - BLOCK
      ?auto_187768 - BLOCK
    )
    :vars
    (
      ?auto_187769 - BLOCK
      ?auto_187770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187762 ?auto_187763 ) ) ( not ( = ?auto_187762 ?auto_187764 ) ) ( not ( = ?auto_187762 ?auto_187765 ) ) ( not ( = ?auto_187762 ?auto_187766 ) ) ( not ( = ?auto_187762 ?auto_187767 ) ) ( not ( = ?auto_187762 ?auto_187768 ) ) ( not ( = ?auto_187763 ?auto_187764 ) ) ( not ( = ?auto_187763 ?auto_187765 ) ) ( not ( = ?auto_187763 ?auto_187766 ) ) ( not ( = ?auto_187763 ?auto_187767 ) ) ( not ( = ?auto_187763 ?auto_187768 ) ) ( not ( = ?auto_187764 ?auto_187765 ) ) ( not ( = ?auto_187764 ?auto_187766 ) ) ( not ( = ?auto_187764 ?auto_187767 ) ) ( not ( = ?auto_187764 ?auto_187768 ) ) ( not ( = ?auto_187765 ?auto_187766 ) ) ( not ( = ?auto_187765 ?auto_187767 ) ) ( not ( = ?auto_187765 ?auto_187768 ) ) ( not ( = ?auto_187766 ?auto_187767 ) ) ( not ( = ?auto_187766 ?auto_187768 ) ) ( not ( = ?auto_187767 ?auto_187768 ) ) ( ON ?auto_187768 ?auto_187769 ) ( not ( = ?auto_187762 ?auto_187769 ) ) ( not ( = ?auto_187763 ?auto_187769 ) ) ( not ( = ?auto_187764 ?auto_187769 ) ) ( not ( = ?auto_187765 ?auto_187769 ) ) ( not ( = ?auto_187766 ?auto_187769 ) ) ( not ( = ?auto_187767 ?auto_187769 ) ) ( not ( = ?auto_187768 ?auto_187769 ) ) ( ON ?auto_187767 ?auto_187768 ) ( ON-TABLE ?auto_187769 ) ( ON ?auto_187766 ?auto_187767 ) ( ON ?auto_187765 ?auto_187766 ) ( ON ?auto_187762 ?auto_187770 ) ( not ( = ?auto_187762 ?auto_187770 ) ) ( not ( = ?auto_187763 ?auto_187770 ) ) ( not ( = ?auto_187764 ?auto_187770 ) ) ( not ( = ?auto_187765 ?auto_187770 ) ) ( not ( = ?auto_187766 ?auto_187770 ) ) ( not ( = ?auto_187767 ?auto_187770 ) ) ( not ( = ?auto_187768 ?auto_187770 ) ) ( not ( = ?auto_187769 ?auto_187770 ) ) ( ON ?auto_187763 ?auto_187762 ) ( CLEAR ?auto_187763 ) ( ON-TABLE ?auto_187770 ) ( HOLDING ?auto_187764 ) ( CLEAR ?auto_187765 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187769 ?auto_187768 ?auto_187767 ?auto_187766 ?auto_187765 ?auto_187764 )
      ( MAKE-7PILE ?auto_187762 ?auto_187763 ?auto_187764 ?auto_187765 ?auto_187766 ?auto_187767 ?auto_187768 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187771 - BLOCK
      ?auto_187772 - BLOCK
      ?auto_187773 - BLOCK
      ?auto_187774 - BLOCK
      ?auto_187775 - BLOCK
      ?auto_187776 - BLOCK
      ?auto_187777 - BLOCK
    )
    :vars
    (
      ?auto_187778 - BLOCK
      ?auto_187779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187771 ?auto_187772 ) ) ( not ( = ?auto_187771 ?auto_187773 ) ) ( not ( = ?auto_187771 ?auto_187774 ) ) ( not ( = ?auto_187771 ?auto_187775 ) ) ( not ( = ?auto_187771 ?auto_187776 ) ) ( not ( = ?auto_187771 ?auto_187777 ) ) ( not ( = ?auto_187772 ?auto_187773 ) ) ( not ( = ?auto_187772 ?auto_187774 ) ) ( not ( = ?auto_187772 ?auto_187775 ) ) ( not ( = ?auto_187772 ?auto_187776 ) ) ( not ( = ?auto_187772 ?auto_187777 ) ) ( not ( = ?auto_187773 ?auto_187774 ) ) ( not ( = ?auto_187773 ?auto_187775 ) ) ( not ( = ?auto_187773 ?auto_187776 ) ) ( not ( = ?auto_187773 ?auto_187777 ) ) ( not ( = ?auto_187774 ?auto_187775 ) ) ( not ( = ?auto_187774 ?auto_187776 ) ) ( not ( = ?auto_187774 ?auto_187777 ) ) ( not ( = ?auto_187775 ?auto_187776 ) ) ( not ( = ?auto_187775 ?auto_187777 ) ) ( not ( = ?auto_187776 ?auto_187777 ) ) ( ON ?auto_187777 ?auto_187778 ) ( not ( = ?auto_187771 ?auto_187778 ) ) ( not ( = ?auto_187772 ?auto_187778 ) ) ( not ( = ?auto_187773 ?auto_187778 ) ) ( not ( = ?auto_187774 ?auto_187778 ) ) ( not ( = ?auto_187775 ?auto_187778 ) ) ( not ( = ?auto_187776 ?auto_187778 ) ) ( not ( = ?auto_187777 ?auto_187778 ) ) ( ON ?auto_187776 ?auto_187777 ) ( ON-TABLE ?auto_187778 ) ( ON ?auto_187775 ?auto_187776 ) ( ON ?auto_187774 ?auto_187775 ) ( ON ?auto_187771 ?auto_187779 ) ( not ( = ?auto_187771 ?auto_187779 ) ) ( not ( = ?auto_187772 ?auto_187779 ) ) ( not ( = ?auto_187773 ?auto_187779 ) ) ( not ( = ?auto_187774 ?auto_187779 ) ) ( not ( = ?auto_187775 ?auto_187779 ) ) ( not ( = ?auto_187776 ?auto_187779 ) ) ( not ( = ?auto_187777 ?auto_187779 ) ) ( not ( = ?auto_187778 ?auto_187779 ) ) ( ON ?auto_187772 ?auto_187771 ) ( ON-TABLE ?auto_187779 ) ( CLEAR ?auto_187774 ) ( ON ?auto_187773 ?auto_187772 ) ( CLEAR ?auto_187773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187779 ?auto_187771 ?auto_187772 )
      ( MAKE-7PILE ?auto_187771 ?auto_187772 ?auto_187773 ?auto_187774 ?auto_187775 ?auto_187776 ?auto_187777 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187780 - BLOCK
      ?auto_187781 - BLOCK
      ?auto_187782 - BLOCK
      ?auto_187783 - BLOCK
      ?auto_187784 - BLOCK
      ?auto_187785 - BLOCK
      ?auto_187786 - BLOCK
    )
    :vars
    (
      ?auto_187787 - BLOCK
      ?auto_187788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187780 ?auto_187781 ) ) ( not ( = ?auto_187780 ?auto_187782 ) ) ( not ( = ?auto_187780 ?auto_187783 ) ) ( not ( = ?auto_187780 ?auto_187784 ) ) ( not ( = ?auto_187780 ?auto_187785 ) ) ( not ( = ?auto_187780 ?auto_187786 ) ) ( not ( = ?auto_187781 ?auto_187782 ) ) ( not ( = ?auto_187781 ?auto_187783 ) ) ( not ( = ?auto_187781 ?auto_187784 ) ) ( not ( = ?auto_187781 ?auto_187785 ) ) ( not ( = ?auto_187781 ?auto_187786 ) ) ( not ( = ?auto_187782 ?auto_187783 ) ) ( not ( = ?auto_187782 ?auto_187784 ) ) ( not ( = ?auto_187782 ?auto_187785 ) ) ( not ( = ?auto_187782 ?auto_187786 ) ) ( not ( = ?auto_187783 ?auto_187784 ) ) ( not ( = ?auto_187783 ?auto_187785 ) ) ( not ( = ?auto_187783 ?auto_187786 ) ) ( not ( = ?auto_187784 ?auto_187785 ) ) ( not ( = ?auto_187784 ?auto_187786 ) ) ( not ( = ?auto_187785 ?auto_187786 ) ) ( ON ?auto_187786 ?auto_187787 ) ( not ( = ?auto_187780 ?auto_187787 ) ) ( not ( = ?auto_187781 ?auto_187787 ) ) ( not ( = ?auto_187782 ?auto_187787 ) ) ( not ( = ?auto_187783 ?auto_187787 ) ) ( not ( = ?auto_187784 ?auto_187787 ) ) ( not ( = ?auto_187785 ?auto_187787 ) ) ( not ( = ?auto_187786 ?auto_187787 ) ) ( ON ?auto_187785 ?auto_187786 ) ( ON-TABLE ?auto_187787 ) ( ON ?auto_187784 ?auto_187785 ) ( ON ?auto_187780 ?auto_187788 ) ( not ( = ?auto_187780 ?auto_187788 ) ) ( not ( = ?auto_187781 ?auto_187788 ) ) ( not ( = ?auto_187782 ?auto_187788 ) ) ( not ( = ?auto_187783 ?auto_187788 ) ) ( not ( = ?auto_187784 ?auto_187788 ) ) ( not ( = ?auto_187785 ?auto_187788 ) ) ( not ( = ?auto_187786 ?auto_187788 ) ) ( not ( = ?auto_187787 ?auto_187788 ) ) ( ON ?auto_187781 ?auto_187780 ) ( ON-TABLE ?auto_187788 ) ( ON ?auto_187782 ?auto_187781 ) ( CLEAR ?auto_187782 ) ( HOLDING ?auto_187783 ) ( CLEAR ?auto_187784 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187787 ?auto_187786 ?auto_187785 ?auto_187784 ?auto_187783 )
      ( MAKE-7PILE ?auto_187780 ?auto_187781 ?auto_187782 ?auto_187783 ?auto_187784 ?auto_187785 ?auto_187786 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187789 - BLOCK
      ?auto_187790 - BLOCK
      ?auto_187791 - BLOCK
      ?auto_187792 - BLOCK
      ?auto_187793 - BLOCK
      ?auto_187794 - BLOCK
      ?auto_187795 - BLOCK
    )
    :vars
    (
      ?auto_187796 - BLOCK
      ?auto_187797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187789 ?auto_187790 ) ) ( not ( = ?auto_187789 ?auto_187791 ) ) ( not ( = ?auto_187789 ?auto_187792 ) ) ( not ( = ?auto_187789 ?auto_187793 ) ) ( not ( = ?auto_187789 ?auto_187794 ) ) ( not ( = ?auto_187789 ?auto_187795 ) ) ( not ( = ?auto_187790 ?auto_187791 ) ) ( not ( = ?auto_187790 ?auto_187792 ) ) ( not ( = ?auto_187790 ?auto_187793 ) ) ( not ( = ?auto_187790 ?auto_187794 ) ) ( not ( = ?auto_187790 ?auto_187795 ) ) ( not ( = ?auto_187791 ?auto_187792 ) ) ( not ( = ?auto_187791 ?auto_187793 ) ) ( not ( = ?auto_187791 ?auto_187794 ) ) ( not ( = ?auto_187791 ?auto_187795 ) ) ( not ( = ?auto_187792 ?auto_187793 ) ) ( not ( = ?auto_187792 ?auto_187794 ) ) ( not ( = ?auto_187792 ?auto_187795 ) ) ( not ( = ?auto_187793 ?auto_187794 ) ) ( not ( = ?auto_187793 ?auto_187795 ) ) ( not ( = ?auto_187794 ?auto_187795 ) ) ( ON ?auto_187795 ?auto_187796 ) ( not ( = ?auto_187789 ?auto_187796 ) ) ( not ( = ?auto_187790 ?auto_187796 ) ) ( not ( = ?auto_187791 ?auto_187796 ) ) ( not ( = ?auto_187792 ?auto_187796 ) ) ( not ( = ?auto_187793 ?auto_187796 ) ) ( not ( = ?auto_187794 ?auto_187796 ) ) ( not ( = ?auto_187795 ?auto_187796 ) ) ( ON ?auto_187794 ?auto_187795 ) ( ON-TABLE ?auto_187796 ) ( ON ?auto_187793 ?auto_187794 ) ( ON ?auto_187789 ?auto_187797 ) ( not ( = ?auto_187789 ?auto_187797 ) ) ( not ( = ?auto_187790 ?auto_187797 ) ) ( not ( = ?auto_187791 ?auto_187797 ) ) ( not ( = ?auto_187792 ?auto_187797 ) ) ( not ( = ?auto_187793 ?auto_187797 ) ) ( not ( = ?auto_187794 ?auto_187797 ) ) ( not ( = ?auto_187795 ?auto_187797 ) ) ( not ( = ?auto_187796 ?auto_187797 ) ) ( ON ?auto_187790 ?auto_187789 ) ( ON-TABLE ?auto_187797 ) ( ON ?auto_187791 ?auto_187790 ) ( CLEAR ?auto_187793 ) ( ON ?auto_187792 ?auto_187791 ) ( CLEAR ?auto_187792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187797 ?auto_187789 ?auto_187790 ?auto_187791 )
      ( MAKE-7PILE ?auto_187789 ?auto_187790 ?auto_187791 ?auto_187792 ?auto_187793 ?auto_187794 ?auto_187795 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187798 - BLOCK
      ?auto_187799 - BLOCK
      ?auto_187800 - BLOCK
      ?auto_187801 - BLOCK
      ?auto_187802 - BLOCK
      ?auto_187803 - BLOCK
      ?auto_187804 - BLOCK
    )
    :vars
    (
      ?auto_187806 - BLOCK
      ?auto_187805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187798 ?auto_187799 ) ) ( not ( = ?auto_187798 ?auto_187800 ) ) ( not ( = ?auto_187798 ?auto_187801 ) ) ( not ( = ?auto_187798 ?auto_187802 ) ) ( not ( = ?auto_187798 ?auto_187803 ) ) ( not ( = ?auto_187798 ?auto_187804 ) ) ( not ( = ?auto_187799 ?auto_187800 ) ) ( not ( = ?auto_187799 ?auto_187801 ) ) ( not ( = ?auto_187799 ?auto_187802 ) ) ( not ( = ?auto_187799 ?auto_187803 ) ) ( not ( = ?auto_187799 ?auto_187804 ) ) ( not ( = ?auto_187800 ?auto_187801 ) ) ( not ( = ?auto_187800 ?auto_187802 ) ) ( not ( = ?auto_187800 ?auto_187803 ) ) ( not ( = ?auto_187800 ?auto_187804 ) ) ( not ( = ?auto_187801 ?auto_187802 ) ) ( not ( = ?auto_187801 ?auto_187803 ) ) ( not ( = ?auto_187801 ?auto_187804 ) ) ( not ( = ?auto_187802 ?auto_187803 ) ) ( not ( = ?auto_187802 ?auto_187804 ) ) ( not ( = ?auto_187803 ?auto_187804 ) ) ( ON ?auto_187804 ?auto_187806 ) ( not ( = ?auto_187798 ?auto_187806 ) ) ( not ( = ?auto_187799 ?auto_187806 ) ) ( not ( = ?auto_187800 ?auto_187806 ) ) ( not ( = ?auto_187801 ?auto_187806 ) ) ( not ( = ?auto_187802 ?auto_187806 ) ) ( not ( = ?auto_187803 ?auto_187806 ) ) ( not ( = ?auto_187804 ?auto_187806 ) ) ( ON ?auto_187803 ?auto_187804 ) ( ON-TABLE ?auto_187806 ) ( ON ?auto_187798 ?auto_187805 ) ( not ( = ?auto_187798 ?auto_187805 ) ) ( not ( = ?auto_187799 ?auto_187805 ) ) ( not ( = ?auto_187800 ?auto_187805 ) ) ( not ( = ?auto_187801 ?auto_187805 ) ) ( not ( = ?auto_187802 ?auto_187805 ) ) ( not ( = ?auto_187803 ?auto_187805 ) ) ( not ( = ?auto_187804 ?auto_187805 ) ) ( not ( = ?auto_187806 ?auto_187805 ) ) ( ON ?auto_187799 ?auto_187798 ) ( ON-TABLE ?auto_187805 ) ( ON ?auto_187800 ?auto_187799 ) ( ON ?auto_187801 ?auto_187800 ) ( CLEAR ?auto_187801 ) ( HOLDING ?auto_187802 ) ( CLEAR ?auto_187803 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187806 ?auto_187804 ?auto_187803 ?auto_187802 )
      ( MAKE-7PILE ?auto_187798 ?auto_187799 ?auto_187800 ?auto_187801 ?auto_187802 ?auto_187803 ?auto_187804 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187807 - BLOCK
      ?auto_187808 - BLOCK
      ?auto_187809 - BLOCK
      ?auto_187810 - BLOCK
      ?auto_187811 - BLOCK
      ?auto_187812 - BLOCK
      ?auto_187813 - BLOCK
    )
    :vars
    (
      ?auto_187814 - BLOCK
      ?auto_187815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187807 ?auto_187808 ) ) ( not ( = ?auto_187807 ?auto_187809 ) ) ( not ( = ?auto_187807 ?auto_187810 ) ) ( not ( = ?auto_187807 ?auto_187811 ) ) ( not ( = ?auto_187807 ?auto_187812 ) ) ( not ( = ?auto_187807 ?auto_187813 ) ) ( not ( = ?auto_187808 ?auto_187809 ) ) ( not ( = ?auto_187808 ?auto_187810 ) ) ( not ( = ?auto_187808 ?auto_187811 ) ) ( not ( = ?auto_187808 ?auto_187812 ) ) ( not ( = ?auto_187808 ?auto_187813 ) ) ( not ( = ?auto_187809 ?auto_187810 ) ) ( not ( = ?auto_187809 ?auto_187811 ) ) ( not ( = ?auto_187809 ?auto_187812 ) ) ( not ( = ?auto_187809 ?auto_187813 ) ) ( not ( = ?auto_187810 ?auto_187811 ) ) ( not ( = ?auto_187810 ?auto_187812 ) ) ( not ( = ?auto_187810 ?auto_187813 ) ) ( not ( = ?auto_187811 ?auto_187812 ) ) ( not ( = ?auto_187811 ?auto_187813 ) ) ( not ( = ?auto_187812 ?auto_187813 ) ) ( ON ?auto_187813 ?auto_187814 ) ( not ( = ?auto_187807 ?auto_187814 ) ) ( not ( = ?auto_187808 ?auto_187814 ) ) ( not ( = ?auto_187809 ?auto_187814 ) ) ( not ( = ?auto_187810 ?auto_187814 ) ) ( not ( = ?auto_187811 ?auto_187814 ) ) ( not ( = ?auto_187812 ?auto_187814 ) ) ( not ( = ?auto_187813 ?auto_187814 ) ) ( ON ?auto_187812 ?auto_187813 ) ( ON-TABLE ?auto_187814 ) ( ON ?auto_187807 ?auto_187815 ) ( not ( = ?auto_187807 ?auto_187815 ) ) ( not ( = ?auto_187808 ?auto_187815 ) ) ( not ( = ?auto_187809 ?auto_187815 ) ) ( not ( = ?auto_187810 ?auto_187815 ) ) ( not ( = ?auto_187811 ?auto_187815 ) ) ( not ( = ?auto_187812 ?auto_187815 ) ) ( not ( = ?auto_187813 ?auto_187815 ) ) ( not ( = ?auto_187814 ?auto_187815 ) ) ( ON ?auto_187808 ?auto_187807 ) ( ON-TABLE ?auto_187815 ) ( ON ?auto_187809 ?auto_187808 ) ( ON ?auto_187810 ?auto_187809 ) ( CLEAR ?auto_187812 ) ( ON ?auto_187811 ?auto_187810 ) ( CLEAR ?auto_187811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187815 ?auto_187807 ?auto_187808 ?auto_187809 ?auto_187810 )
      ( MAKE-7PILE ?auto_187807 ?auto_187808 ?auto_187809 ?auto_187810 ?auto_187811 ?auto_187812 ?auto_187813 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187816 - BLOCK
      ?auto_187817 - BLOCK
      ?auto_187818 - BLOCK
      ?auto_187819 - BLOCK
      ?auto_187820 - BLOCK
      ?auto_187821 - BLOCK
      ?auto_187822 - BLOCK
    )
    :vars
    (
      ?auto_187824 - BLOCK
      ?auto_187823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187816 ?auto_187817 ) ) ( not ( = ?auto_187816 ?auto_187818 ) ) ( not ( = ?auto_187816 ?auto_187819 ) ) ( not ( = ?auto_187816 ?auto_187820 ) ) ( not ( = ?auto_187816 ?auto_187821 ) ) ( not ( = ?auto_187816 ?auto_187822 ) ) ( not ( = ?auto_187817 ?auto_187818 ) ) ( not ( = ?auto_187817 ?auto_187819 ) ) ( not ( = ?auto_187817 ?auto_187820 ) ) ( not ( = ?auto_187817 ?auto_187821 ) ) ( not ( = ?auto_187817 ?auto_187822 ) ) ( not ( = ?auto_187818 ?auto_187819 ) ) ( not ( = ?auto_187818 ?auto_187820 ) ) ( not ( = ?auto_187818 ?auto_187821 ) ) ( not ( = ?auto_187818 ?auto_187822 ) ) ( not ( = ?auto_187819 ?auto_187820 ) ) ( not ( = ?auto_187819 ?auto_187821 ) ) ( not ( = ?auto_187819 ?auto_187822 ) ) ( not ( = ?auto_187820 ?auto_187821 ) ) ( not ( = ?auto_187820 ?auto_187822 ) ) ( not ( = ?auto_187821 ?auto_187822 ) ) ( ON ?auto_187822 ?auto_187824 ) ( not ( = ?auto_187816 ?auto_187824 ) ) ( not ( = ?auto_187817 ?auto_187824 ) ) ( not ( = ?auto_187818 ?auto_187824 ) ) ( not ( = ?auto_187819 ?auto_187824 ) ) ( not ( = ?auto_187820 ?auto_187824 ) ) ( not ( = ?auto_187821 ?auto_187824 ) ) ( not ( = ?auto_187822 ?auto_187824 ) ) ( ON-TABLE ?auto_187824 ) ( ON ?auto_187816 ?auto_187823 ) ( not ( = ?auto_187816 ?auto_187823 ) ) ( not ( = ?auto_187817 ?auto_187823 ) ) ( not ( = ?auto_187818 ?auto_187823 ) ) ( not ( = ?auto_187819 ?auto_187823 ) ) ( not ( = ?auto_187820 ?auto_187823 ) ) ( not ( = ?auto_187821 ?auto_187823 ) ) ( not ( = ?auto_187822 ?auto_187823 ) ) ( not ( = ?auto_187824 ?auto_187823 ) ) ( ON ?auto_187817 ?auto_187816 ) ( ON-TABLE ?auto_187823 ) ( ON ?auto_187818 ?auto_187817 ) ( ON ?auto_187819 ?auto_187818 ) ( ON ?auto_187820 ?auto_187819 ) ( CLEAR ?auto_187820 ) ( HOLDING ?auto_187821 ) ( CLEAR ?auto_187822 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187824 ?auto_187822 ?auto_187821 )
      ( MAKE-7PILE ?auto_187816 ?auto_187817 ?auto_187818 ?auto_187819 ?auto_187820 ?auto_187821 ?auto_187822 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187825 - BLOCK
      ?auto_187826 - BLOCK
      ?auto_187827 - BLOCK
      ?auto_187828 - BLOCK
      ?auto_187829 - BLOCK
      ?auto_187830 - BLOCK
      ?auto_187831 - BLOCK
    )
    :vars
    (
      ?auto_187832 - BLOCK
      ?auto_187833 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187825 ?auto_187826 ) ) ( not ( = ?auto_187825 ?auto_187827 ) ) ( not ( = ?auto_187825 ?auto_187828 ) ) ( not ( = ?auto_187825 ?auto_187829 ) ) ( not ( = ?auto_187825 ?auto_187830 ) ) ( not ( = ?auto_187825 ?auto_187831 ) ) ( not ( = ?auto_187826 ?auto_187827 ) ) ( not ( = ?auto_187826 ?auto_187828 ) ) ( not ( = ?auto_187826 ?auto_187829 ) ) ( not ( = ?auto_187826 ?auto_187830 ) ) ( not ( = ?auto_187826 ?auto_187831 ) ) ( not ( = ?auto_187827 ?auto_187828 ) ) ( not ( = ?auto_187827 ?auto_187829 ) ) ( not ( = ?auto_187827 ?auto_187830 ) ) ( not ( = ?auto_187827 ?auto_187831 ) ) ( not ( = ?auto_187828 ?auto_187829 ) ) ( not ( = ?auto_187828 ?auto_187830 ) ) ( not ( = ?auto_187828 ?auto_187831 ) ) ( not ( = ?auto_187829 ?auto_187830 ) ) ( not ( = ?auto_187829 ?auto_187831 ) ) ( not ( = ?auto_187830 ?auto_187831 ) ) ( ON ?auto_187831 ?auto_187832 ) ( not ( = ?auto_187825 ?auto_187832 ) ) ( not ( = ?auto_187826 ?auto_187832 ) ) ( not ( = ?auto_187827 ?auto_187832 ) ) ( not ( = ?auto_187828 ?auto_187832 ) ) ( not ( = ?auto_187829 ?auto_187832 ) ) ( not ( = ?auto_187830 ?auto_187832 ) ) ( not ( = ?auto_187831 ?auto_187832 ) ) ( ON-TABLE ?auto_187832 ) ( ON ?auto_187825 ?auto_187833 ) ( not ( = ?auto_187825 ?auto_187833 ) ) ( not ( = ?auto_187826 ?auto_187833 ) ) ( not ( = ?auto_187827 ?auto_187833 ) ) ( not ( = ?auto_187828 ?auto_187833 ) ) ( not ( = ?auto_187829 ?auto_187833 ) ) ( not ( = ?auto_187830 ?auto_187833 ) ) ( not ( = ?auto_187831 ?auto_187833 ) ) ( not ( = ?auto_187832 ?auto_187833 ) ) ( ON ?auto_187826 ?auto_187825 ) ( ON-TABLE ?auto_187833 ) ( ON ?auto_187827 ?auto_187826 ) ( ON ?auto_187828 ?auto_187827 ) ( ON ?auto_187829 ?auto_187828 ) ( CLEAR ?auto_187831 ) ( ON ?auto_187830 ?auto_187829 ) ( CLEAR ?auto_187830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187833 ?auto_187825 ?auto_187826 ?auto_187827 ?auto_187828 ?auto_187829 )
      ( MAKE-7PILE ?auto_187825 ?auto_187826 ?auto_187827 ?auto_187828 ?auto_187829 ?auto_187830 ?auto_187831 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187834 - BLOCK
      ?auto_187835 - BLOCK
      ?auto_187836 - BLOCK
      ?auto_187837 - BLOCK
      ?auto_187838 - BLOCK
      ?auto_187839 - BLOCK
      ?auto_187840 - BLOCK
    )
    :vars
    (
      ?auto_187841 - BLOCK
      ?auto_187842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187834 ?auto_187835 ) ) ( not ( = ?auto_187834 ?auto_187836 ) ) ( not ( = ?auto_187834 ?auto_187837 ) ) ( not ( = ?auto_187834 ?auto_187838 ) ) ( not ( = ?auto_187834 ?auto_187839 ) ) ( not ( = ?auto_187834 ?auto_187840 ) ) ( not ( = ?auto_187835 ?auto_187836 ) ) ( not ( = ?auto_187835 ?auto_187837 ) ) ( not ( = ?auto_187835 ?auto_187838 ) ) ( not ( = ?auto_187835 ?auto_187839 ) ) ( not ( = ?auto_187835 ?auto_187840 ) ) ( not ( = ?auto_187836 ?auto_187837 ) ) ( not ( = ?auto_187836 ?auto_187838 ) ) ( not ( = ?auto_187836 ?auto_187839 ) ) ( not ( = ?auto_187836 ?auto_187840 ) ) ( not ( = ?auto_187837 ?auto_187838 ) ) ( not ( = ?auto_187837 ?auto_187839 ) ) ( not ( = ?auto_187837 ?auto_187840 ) ) ( not ( = ?auto_187838 ?auto_187839 ) ) ( not ( = ?auto_187838 ?auto_187840 ) ) ( not ( = ?auto_187839 ?auto_187840 ) ) ( not ( = ?auto_187834 ?auto_187841 ) ) ( not ( = ?auto_187835 ?auto_187841 ) ) ( not ( = ?auto_187836 ?auto_187841 ) ) ( not ( = ?auto_187837 ?auto_187841 ) ) ( not ( = ?auto_187838 ?auto_187841 ) ) ( not ( = ?auto_187839 ?auto_187841 ) ) ( not ( = ?auto_187840 ?auto_187841 ) ) ( ON-TABLE ?auto_187841 ) ( ON ?auto_187834 ?auto_187842 ) ( not ( = ?auto_187834 ?auto_187842 ) ) ( not ( = ?auto_187835 ?auto_187842 ) ) ( not ( = ?auto_187836 ?auto_187842 ) ) ( not ( = ?auto_187837 ?auto_187842 ) ) ( not ( = ?auto_187838 ?auto_187842 ) ) ( not ( = ?auto_187839 ?auto_187842 ) ) ( not ( = ?auto_187840 ?auto_187842 ) ) ( not ( = ?auto_187841 ?auto_187842 ) ) ( ON ?auto_187835 ?auto_187834 ) ( ON-TABLE ?auto_187842 ) ( ON ?auto_187836 ?auto_187835 ) ( ON ?auto_187837 ?auto_187836 ) ( ON ?auto_187838 ?auto_187837 ) ( ON ?auto_187839 ?auto_187838 ) ( CLEAR ?auto_187839 ) ( HOLDING ?auto_187840 ) ( CLEAR ?auto_187841 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187841 ?auto_187840 )
      ( MAKE-7PILE ?auto_187834 ?auto_187835 ?auto_187836 ?auto_187837 ?auto_187838 ?auto_187839 ?auto_187840 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187843 - BLOCK
      ?auto_187844 - BLOCK
      ?auto_187845 - BLOCK
      ?auto_187846 - BLOCK
      ?auto_187847 - BLOCK
      ?auto_187848 - BLOCK
      ?auto_187849 - BLOCK
    )
    :vars
    (
      ?auto_187850 - BLOCK
      ?auto_187851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187843 ?auto_187844 ) ) ( not ( = ?auto_187843 ?auto_187845 ) ) ( not ( = ?auto_187843 ?auto_187846 ) ) ( not ( = ?auto_187843 ?auto_187847 ) ) ( not ( = ?auto_187843 ?auto_187848 ) ) ( not ( = ?auto_187843 ?auto_187849 ) ) ( not ( = ?auto_187844 ?auto_187845 ) ) ( not ( = ?auto_187844 ?auto_187846 ) ) ( not ( = ?auto_187844 ?auto_187847 ) ) ( not ( = ?auto_187844 ?auto_187848 ) ) ( not ( = ?auto_187844 ?auto_187849 ) ) ( not ( = ?auto_187845 ?auto_187846 ) ) ( not ( = ?auto_187845 ?auto_187847 ) ) ( not ( = ?auto_187845 ?auto_187848 ) ) ( not ( = ?auto_187845 ?auto_187849 ) ) ( not ( = ?auto_187846 ?auto_187847 ) ) ( not ( = ?auto_187846 ?auto_187848 ) ) ( not ( = ?auto_187846 ?auto_187849 ) ) ( not ( = ?auto_187847 ?auto_187848 ) ) ( not ( = ?auto_187847 ?auto_187849 ) ) ( not ( = ?auto_187848 ?auto_187849 ) ) ( not ( = ?auto_187843 ?auto_187850 ) ) ( not ( = ?auto_187844 ?auto_187850 ) ) ( not ( = ?auto_187845 ?auto_187850 ) ) ( not ( = ?auto_187846 ?auto_187850 ) ) ( not ( = ?auto_187847 ?auto_187850 ) ) ( not ( = ?auto_187848 ?auto_187850 ) ) ( not ( = ?auto_187849 ?auto_187850 ) ) ( ON-TABLE ?auto_187850 ) ( ON ?auto_187843 ?auto_187851 ) ( not ( = ?auto_187843 ?auto_187851 ) ) ( not ( = ?auto_187844 ?auto_187851 ) ) ( not ( = ?auto_187845 ?auto_187851 ) ) ( not ( = ?auto_187846 ?auto_187851 ) ) ( not ( = ?auto_187847 ?auto_187851 ) ) ( not ( = ?auto_187848 ?auto_187851 ) ) ( not ( = ?auto_187849 ?auto_187851 ) ) ( not ( = ?auto_187850 ?auto_187851 ) ) ( ON ?auto_187844 ?auto_187843 ) ( ON-TABLE ?auto_187851 ) ( ON ?auto_187845 ?auto_187844 ) ( ON ?auto_187846 ?auto_187845 ) ( ON ?auto_187847 ?auto_187846 ) ( ON ?auto_187848 ?auto_187847 ) ( CLEAR ?auto_187850 ) ( ON ?auto_187849 ?auto_187848 ) ( CLEAR ?auto_187849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187851 ?auto_187843 ?auto_187844 ?auto_187845 ?auto_187846 ?auto_187847 ?auto_187848 )
      ( MAKE-7PILE ?auto_187843 ?auto_187844 ?auto_187845 ?auto_187846 ?auto_187847 ?auto_187848 ?auto_187849 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187852 - BLOCK
      ?auto_187853 - BLOCK
      ?auto_187854 - BLOCK
      ?auto_187855 - BLOCK
      ?auto_187856 - BLOCK
      ?auto_187857 - BLOCK
      ?auto_187858 - BLOCK
    )
    :vars
    (
      ?auto_187860 - BLOCK
      ?auto_187859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187852 ?auto_187853 ) ) ( not ( = ?auto_187852 ?auto_187854 ) ) ( not ( = ?auto_187852 ?auto_187855 ) ) ( not ( = ?auto_187852 ?auto_187856 ) ) ( not ( = ?auto_187852 ?auto_187857 ) ) ( not ( = ?auto_187852 ?auto_187858 ) ) ( not ( = ?auto_187853 ?auto_187854 ) ) ( not ( = ?auto_187853 ?auto_187855 ) ) ( not ( = ?auto_187853 ?auto_187856 ) ) ( not ( = ?auto_187853 ?auto_187857 ) ) ( not ( = ?auto_187853 ?auto_187858 ) ) ( not ( = ?auto_187854 ?auto_187855 ) ) ( not ( = ?auto_187854 ?auto_187856 ) ) ( not ( = ?auto_187854 ?auto_187857 ) ) ( not ( = ?auto_187854 ?auto_187858 ) ) ( not ( = ?auto_187855 ?auto_187856 ) ) ( not ( = ?auto_187855 ?auto_187857 ) ) ( not ( = ?auto_187855 ?auto_187858 ) ) ( not ( = ?auto_187856 ?auto_187857 ) ) ( not ( = ?auto_187856 ?auto_187858 ) ) ( not ( = ?auto_187857 ?auto_187858 ) ) ( not ( = ?auto_187852 ?auto_187860 ) ) ( not ( = ?auto_187853 ?auto_187860 ) ) ( not ( = ?auto_187854 ?auto_187860 ) ) ( not ( = ?auto_187855 ?auto_187860 ) ) ( not ( = ?auto_187856 ?auto_187860 ) ) ( not ( = ?auto_187857 ?auto_187860 ) ) ( not ( = ?auto_187858 ?auto_187860 ) ) ( ON ?auto_187852 ?auto_187859 ) ( not ( = ?auto_187852 ?auto_187859 ) ) ( not ( = ?auto_187853 ?auto_187859 ) ) ( not ( = ?auto_187854 ?auto_187859 ) ) ( not ( = ?auto_187855 ?auto_187859 ) ) ( not ( = ?auto_187856 ?auto_187859 ) ) ( not ( = ?auto_187857 ?auto_187859 ) ) ( not ( = ?auto_187858 ?auto_187859 ) ) ( not ( = ?auto_187860 ?auto_187859 ) ) ( ON ?auto_187853 ?auto_187852 ) ( ON-TABLE ?auto_187859 ) ( ON ?auto_187854 ?auto_187853 ) ( ON ?auto_187855 ?auto_187854 ) ( ON ?auto_187856 ?auto_187855 ) ( ON ?auto_187857 ?auto_187856 ) ( ON ?auto_187858 ?auto_187857 ) ( CLEAR ?auto_187858 ) ( HOLDING ?auto_187860 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187860 )
      ( MAKE-7PILE ?auto_187852 ?auto_187853 ?auto_187854 ?auto_187855 ?auto_187856 ?auto_187857 ?auto_187858 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_187861 - BLOCK
      ?auto_187862 - BLOCK
      ?auto_187863 - BLOCK
      ?auto_187864 - BLOCK
      ?auto_187865 - BLOCK
      ?auto_187866 - BLOCK
      ?auto_187867 - BLOCK
    )
    :vars
    (
      ?auto_187869 - BLOCK
      ?auto_187868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187861 ?auto_187862 ) ) ( not ( = ?auto_187861 ?auto_187863 ) ) ( not ( = ?auto_187861 ?auto_187864 ) ) ( not ( = ?auto_187861 ?auto_187865 ) ) ( not ( = ?auto_187861 ?auto_187866 ) ) ( not ( = ?auto_187861 ?auto_187867 ) ) ( not ( = ?auto_187862 ?auto_187863 ) ) ( not ( = ?auto_187862 ?auto_187864 ) ) ( not ( = ?auto_187862 ?auto_187865 ) ) ( not ( = ?auto_187862 ?auto_187866 ) ) ( not ( = ?auto_187862 ?auto_187867 ) ) ( not ( = ?auto_187863 ?auto_187864 ) ) ( not ( = ?auto_187863 ?auto_187865 ) ) ( not ( = ?auto_187863 ?auto_187866 ) ) ( not ( = ?auto_187863 ?auto_187867 ) ) ( not ( = ?auto_187864 ?auto_187865 ) ) ( not ( = ?auto_187864 ?auto_187866 ) ) ( not ( = ?auto_187864 ?auto_187867 ) ) ( not ( = ?auto_187865 ?auto_187866 ) ) ( not ( = ?auto_187865 ?auto_187867 ) ) ( not ( = ?auto_187866 ?auto_187867 ) ) ( not ( = ?auto_187861 ?auto_187869 ) ) ( not ( = ?auto_187862 ?auto_187869 ) ) ( not ( = ?auto_187863 ?auto_187869 ) ) ( not ( = ?auto_187864 ?auto_187869 ) ) ( not ( = ?auto_187865 ?auto_187869 ) ) ( not ( = ?auto_187866 ?auto_187869 ) ) ( not ( = ?auto_187867 ?auto_187869 ) ) ( ON ?auto_187861 ?auto_187868 ) ( not ( = ?auto_187861 ?auto_187868 ) ) ( not ( = ?auto_187862 ?auto_187868 ) ) ( not ( = ?auto_187863 ?auto_187868 ) ) ( not ( = ?auto_187864 ?auto_187868 ) ) ( not ( = ?auto_187865 ?auto_187868 ) ) ( not ( = ?auto_187866 ?auto_187868 ) ) ( not ( = ?auto_187867 ?auto_187868 ) ) ( not ( = ?auto_187869 ?auto_187868 ) ) ( ON ?auto_187862 ?auto_187861 ) ( ON-TABLE ?auto_187868 ) ( ON ?auto_187863 ?auto_187862 ) ( ON ?auto_187864 ?auto_187863 ) ( ON ?auto_187865 ?auto_187864 ) ( ON ?auto_187866 ?auto_187865 ) ( ON ?auto_187867 ?auto_187866 ) ( ON ?auto_187869 ?auto_187867 ) ( CLEAR ?auto_187869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_187868 ?auto_187861 ?auto_187862 ?auto_187863 ?auto_187864 ?auto_187865 ?auto_187866 ?auto_187867 )
      ( MAKE-7PILE ?auto_187861 ?auto_187862 ?auto_187863 ?auto_187864 ?auto_187865 ?auto_187866 ?auto_187867 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187886 - BLOCK
      ?auto_187887 - BLOCK
      ?auto_187888 - BLOCK
      ?auto_187889 - BLOCK
      ?auto_187890 - BLOCK
      ?auto_187891 - BLOCK
      ?auto_187892 - BLOCK
      ?auto_187893 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_187892 ) ( ON-TABLE ?auto_187886 ) ( ON ?auto_187887 ?auto_187886 ) ( ON ?auto_187888 ?auto_187887 ) ( ON ?auto_187889 ?auto_187888 ) ( ON ?auto_187890 ?auto_187889 ) ( ON ?auto_187891 ?auto_187890 ) ( ON ?auto_187892 ?auto_187891 ) ( not ( = ?auto_187886 ?auto_187887 ) ) ( not ( = ?auto_187886 ?auto_187888 ) ) ( not ( = ?auto_187886 ?auto_187889 ) ) ( not ( = ?auto_187886 ?auto_187890 ) ) ( not ( = ?auto_187886 ?auto_187891 ) ) ( not ( = ?auto_187886 ?auto_187892 ) ) ( not ( = ?auto_187886 ?auto_187893 ) ) ( not ( = ?auto_187887 ?auto_187888 ) ) ( not ( = ?auto_187887 ?auto_187889 ) ) ( not ( = ?auto_187887 ?auto_187890 ) ) ( not ( = ?auto_187887 ?auto_187891 ) ) ( not ( = ?auto_187887 ?auto_187892 ) ) ( not ( = ?auto_187887 ?auto_187893 ) ) ( not ( = ?auto_187888 ?auto_187889 ) ) ( not ( = ?auto_187888 ?auto_187890 ) ) ( not ( = ?auto_187888 ?auto_187891 ) ) ( not ( = ?auto_187888 ?auto_187892 ) ) ( not ( = ?auto_187888 ?auto_187893 ) ) ( not ( = ?auto_187889 ?auto_187890 ) ) ( not ( = ?auto_187889 ?auto_187891 ) ) ( not ( = ?auto_187889 ?auto_187892 ) ) ( not ( = ?auto_187889 ?auto_187893 ) ) ( not ( = ?auto_187890 ?auto_187891 ) ) ( not ( = ?auto_187890 ?auto_187892 ) ) ( not ( = ?auto_187890 ?auto_187893 ) ) ( not ( = ?auto_187891 ?auto_187892 ) ) ( not ( = ?auto_187891 ?auto_187893 ) ) ( not ( = ?auto_187892 ?auto_187893 ) ) ( ON-TABLE ?auto_187893 ) ( CLEAR ?auto_187893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_187893 )
      ( MAKE-8PILE ?auto_187886 ?auto_187887 ?auto_187888 ?auto_187889 ?auto_187890 ?auto_187891 ?auto_187892 ?auto_187893 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187894 - BLOCK
      ?auto_187895 - BLOCK
      ?auto_187896 - BLOCK
      ?auto_187897 - BLOCK
      ?auto_187898 - BLOCK
      ?auto_187899 - BLOCK
      ?auto_187900 - BLOCK
      ?auto_187901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187894 ) ( ON ?auto_187895 ?auto_187894 ) ( ON ?auto_187896 ?auto_187895 ) ( ON ?auto_187897 ?auto_187896 ) ( ON ?auto_187898 ?auto_187897 ) ( ON ?auto_187899 ?auto_187898 ) ( not ( = ?auto_187894 ?auto_187895 ) ) ( not ( = ?auto_187894 ?auto_187896 ) ) ( not ( = ?auto_187894 ?auto_187897 ) ) ( not ( = ?auto_187894 ?auto_187898 ) ) ( not ( = ?auto_187894 ?auto_187899 ) ) ( not ( = ?auto_187894 ?auto_187900 ) ) ( not ( = ?auto_187894 ?auto_187901 ) ) ( not ( = ?auto_187895 ?auto_187896 ) ) ( not ( = ?auto_187895 ?auto_187897 ) ) ( not ( = ?auto_187895 ?auto_187898 ) ) ( not ( = ?auto_187895 ?auto_187899 ) ) ( not ( = ?auto_187895 ?auto_187900 ) ) ( not ( = ?auto_187895 ?auto_187901 ) ) ( not ( = ?auto_187896 ?auto_187897 ) ) ( not ( = ?auto_187896 ?auto_187898 ) ) ( not ( = ?auto_187896 ?auto_187899 ) ) ( not ( = ?auto_187896 ?auto_187900 ) ) ( not ( = ?auto_187896 ?auto_187901 ) ) ( not ( = ?auto_187897 ?auto_187898 ) ) ( not ( = ?auto_187897 ?auto_187899 ) ) ( not ( = ?auto_187897 ?auto_187900 ) ) ( not ( = ?auto_187897 ?auto_187901 ) ) ( not ( = ?auto_187898 ?auto_187899 ) ) ( not ( = ?auto_187898 ?auto_187900 ) ) ( not ( = ?auto_187898 ?auto_187901 ) ) ( not ( = ?auto_187899 ?auto_187900 ) ) ( not ( = ?auto_187899 ?auto_187901 ) ) ( not ( = ?auto_187900 ?auto_187901 ) ) ( ON-TABLE ?auto_187901 ) ( CLEAR ?auto_187901 ) ( HOLDING ?auto_187900 ) ( CLEAR ?auto_187899 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_187894 ?auto_187895 ?auto_187896 ?auto_187897 ?auto_187898 ?auto_187899 ?auto_187900 )
      ( MAKE-8PILE ?auto_187894 ?auto_187895 ?auto_187896 ?auto_187897 ?auto_187898 ?auto_187899 ?auto_187900 ?auto_187901 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187902 - BLOCK
      ?auto_187903 - BLOCK
      ?auto_187904 - BLOCK
      ?auto_187905 - BLOCK
      ?auto_187906 - BLOCK
      ?auto_187907 - BLOCK
      ?auto_187908 - BLOCK
      ?auto_187909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187902 ) ( ON ?auto_187903 ?auto_187902 ) ( ON ?auto_187904 ?auto_187903 ) ( ON ?auto_187905 ?auto_187904 ) ( ON ?auto_187906 ?auto_187905 ) ( ON ?auto_187907 ?auto_187906 ) ( not ( = ?auto_187902 ?auto_187903 ) ) ( not ( = ?auto_187902 ?auto_187904 ) ) ( not ( = ?auto_187902 ?auto_187905 ) ) ( not ( = ?auto_187902 ?auto_187906 ) ) ( not ( = ?auto_187902 ?auto_187907 ) ) ( not ( = ?auto_187902 ?auto_187908 ) ) ( not ( = ?auto_187902 ?auto_187909 ) ) ( not ( = ?auto_187903 ?auto_187904 ) ) ( not ( = ?auto_187903 ?auto_187905 ) ) ( not ( = ?auto_187903 ?auto_187906 ) ) ( not ( = ?auto_187903 ?auto_187907 ) ) ( not ( = ?auto_187903 ?auto_187908 ) ) ( not ( = ?auto_187903 ?auto_187909 ) ) ( not ( = ?auto_187904 ?auto_187905 ) ) ( not ( = ?auto_187904 ?auto_187906 ) ) ( not ( = ?auto_187904 ?auto_187907 ) ) ( not ( = ?auto_187904 ?auto_187908 ) ) ( not ( = ?auto_187904 ?auto_187909 ) ) ( not ( = ?auto_187905 ?auto_187906 ) ) ( not ( = ?auto_187905 ?auto_187907 ) ) ( not ( = ?auto_187905 ?auto_187908 ) ) ( not ( = ?auto_187905 ?auto_187909 ) ) ( not ( = ?auto_187906 ?auto_187907 ) ) ( not ( = ?auto_187906 ?auto_187908 ) ) ( not ( = ?auto_187906 ?auto_187909 ) ) ( not ( = ?auto_187907 ?auto_187908 ) ) ( not ( = ?auto_187907 ?auto_187909 ) ) ( not ( = ?auto_187908 ?auto_187909 ) ) ( ON-TABLE ?auto_187909 ) ( CLEAR ?auto_187907 ) ( ON ?auto_187908 ?auto_187909 ) ( CLEAR ?auto_187908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187909 )
      ( MAKE-8PILE ?auto_187902 ?auto_187903 ?auto_187904 ?auto_187905 ?auto_187906 ?auto_187907 ?auto_187908 ?auto_187909 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187910 - BLOCK
      ?auto_187911 - BLOCK
      ?auto_187912 - BLOCK
      ?auto_187913 - BLOCK
      ?auto_187914 - BLOCK
      ?auto_187915 - BLOCK
      ?auto_187916 - BLOCK
      ?auto_187917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187910 ) ( ON ?auto_187911 ?auto_187910 ) ( ON ?auto_187912 ?auto_187911 ) ( ON ?auto_187913 ?auto_187912 ) ( ON ?auto_187914 ?auto_187913 ) ( not ( = ?auto_187910 ?auto_187911 ) ) ( not ( = ?auto_187910 ?auto_187912 ) ) ( not ( = ?auto_187910 ?auto_187913 ) ) ( not ( = ?auto_187910 ?auto_187914 ) ) ( not ( = ?auto_187910 ?auto_187915 ) ) ( not ( = ?auto_187910 ?auto_187916 ) ) ( not ( = ?auto_187910 ?auto_187917 ) ) ( not ( = ?auto_187911 ?auto_187912 ) ) ( not ( = ?auto_187911 ?auto_187913 ) ) ( not ( = ?auto_187911 ?auto_187914 ) ) ( not ( = ?auto_187911 ?auto_187915 ) ) ( not ( = ?auto_187911 ?auto_187916 ) ) ( not ( = ?auto_187911 ?auto_187917 ) ) ( not ( = ?auto_187912 ?auto_187913 ) ) ( not ( = ?auto_187912 ?auto_187914 ) ) ( not ( = ?auto_187912 ?auto_187915 ) ) ( not ( = ?auto_187912 ?auto_187916 ) ) ( not ( = ?auto_187912 ?auto_187917 ) ) ( not ( = ?auto_187913 ?auto_187914 ) ) ( not ( = ?auto_187913 ?auto_187915 ) ) ( not ( = ?auto_187913 ?auto_187916 ) ) ( not ( = ?auto_187913 ?auto_187917 ) ) ( not ( = ?auto_187914 ?auto_187915 ) ) ( not ( = ?auto_187914 ?auto_187916 ) ) ( not ( = ?auto_187914 ?auto_187917 ) ) ( not ( = ?auto_187915 ?auto_187916 ) ) ( not ( = ?auto_187915 ?auto_187917 ) ) ( not ( = ?auto_187916 ?auto_187917 ) ) ( ON-TABLE ?auto_187917 ) ( ON ?auto_187916 ?auto_187917 ) ( CLEAR ?auto_187916 ) ( HOLDING ?auto_187915 ) ( CLEAR ?auto_187914 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187910 ?auto_187911 ?auto_187912 ?auto_187913 ?auto_187914 ?auto_187915 )
      ( MAKE-8PILE ?auto_187910 ?auto_187911 ?auto_187912 ?auto_187913 ?auto_187914 ?auto_187915 ?auto_187916 ?auto_187917 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187918 - BLOCK
      ?auto_187919 - BLOCK
      ?auto_187920 - BLOCK
      ?auto_187921 - BLOCK
      ?auto_187922 - BLOCK
      ?auto_187923 - BLOCK
      ?auto_187924 - BLOCK
      ?auto_187925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187918 ) ( ON ?auto_187919 ?auto_187918 ) ( ON ?auto_187920 ?auto_187919 ) ( ON ?auto_187921 ?auto_187920 ) ( ON ?auto_187922 ?auto_187921 ) ( not ( = ?auto_187918 ?auto_187919 ) ) ( not ( = ?auto_187918 ?auto_187920 ) ) ( not ( = ?auto_187918 ?auto_187921 ) ) ( not ( = ?auto_187918 ?auto_187922 ) ) ( not ( = ?auto_187918 ?auto_187923 ) ) ( not ( = ?auto_187918 ?auto_187924 ) ) ( not ( = ?auto_187918 ?auto_187925 ) ) ( not ( = ?auto_187919 ?auto_187920 ) ) ( not ( = ?auto_187919 ?auto_187921 ) ) ( not ( = ?auto_187919 ?auto_187922 ) ) ( not ( = ?auto_187919 ?auto_187923 ) ) ( not ( = ?auto_187919 ?auto_187924 ) ) ( not ( = ?auto_187919 ?auto_187925 ) ) ( not ( = ?auto_187920 ?auto_187921 ) ) ( not ( = ?auto_187920 ?auto_187922 ) ) ( not ( = ?auto_187920 ?auto_187923 ) ) ( not ( = ?auto_187920 ?auto_187924 ) ) ( not ( = ?auto_187920 ?auto_187925 ) ) ( not ( = ?auto_187921 ?auto_187922 ) ) ( not ( = ?auto_187921 ?auto_187923 ) ) ( not ( = ?auto_187921 ?auto_187924 ) ) ( not ( = ?auto_187921 ?auto_187925 ) ) ( not ( = ?auto_187922 ?auto_187923 ) ) ( not ( = ?auto_187922 ?auto_187924 ) ) ( not ( = ?auto_187922 ?auto_187925 ) ) ( not ( = ?auto_187923 ?auto_187924 ) ) ( not ( = ?auto_187923 ?auto_187925 ) ) ( not ( = ?auto_187924 ?auto_187925 ) ) ( ON-TABLE ?auto_187925 ) ( ON ?auto_187924 ?auto_187925 ) ( CLEAR ?auto_187922 ) ( ON ?auto_187923 ?auto_187924 ) ( CLEAR ?auto_187923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187925 ?auto_187924 )
      ( MAKE-8PILE ?auto_187918 ?auto_187919 ?auto_187920 ?auto_187921 ?auto_187922 ?auto_187923 ?auto_187924 ?auto_187925 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187926 - BLOCK
      ?auto_187927 - BLOCK
      ?auto_187928 - BLOCK
      ?auto_187929 - BLOCK
      ?auto_187930 - BLOCK
      ?auto_187931 - BLOCK
      ?auto_187932 - BLOCK
      ?auto_187933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187926 ) ( ON ?auto_187927 ?auto_187926 ) ( ON ?auto_187928 ?auto_187927 ) ( ON ?auto_187929 ?auto_187928 ) ( not ( = ?auto_187926 ?auto_187927 ) ) ( not ( = ?auto_187926 ?auto_187928 ) ) ( not ( = ?auto_187926 ?auto_187929 ) ) ( not ( = ?auto_187926 ?auto_187930 ) ) ( not ( = ?auto_187926 ?auto_187931 ) ) ( not ( = ?auto_187926 ?auto_187932 ) ) ( not ( = ?auto_187926 ?auto_187933 ) ) ( not ( = ?auto_187927 ?auto_187928 ) ) ( not ( = ?auto_187927 ?auto_187929 ) ) ( not ( = ?auto_187927 ?auto_187930 ) ) ( not ( = ?auto_187927 ?auto_187931 ) ) ( not ( = ?auto_187927 ?auto_187932 ) ) ( not ( = ?auto_187927 ?auto_187933 ) ) ( not ( = ?auto_187928 ?auto_187929 ) ) ( not ( = ?auto_187928 ?auto_187930 ) ) ( not ( = ?auto_187928 ?auto_187931 ) ) ( not ( = ?auto_187928 ?auto_187932 ) ) ( not ( = ?auto_187928 ?auto_187933 ) ) ( not ( = ?auto_187929 ?auto_187930 ) ) ( not ( = ?auto_187929 ?auto_187931 ) ) ( not ( = ?auto_187929 ?auto_187932 ) ) ( not ( = ?auto_187929 ?auto_187933 ) ) ( not ( = ?auto_187930 ?auto_187931 ) ) ( not ( = ?auto_187930 ?auto_187932 ) ) ( not ( = ?auto_187930 ?auto_187933 ) ) ( not ( = ?auto_187931 ?auto_187932 ) ) ( not ( = ?auto_187931 ?auto_187933 ) ) ( not ( = ?auto_187932 ?auto_187933 ) ) ( ON-TABLE ?auto_187933 ) ( ON ?auto_187932 ?auto_187933 ) ( ON ?auto_187931 ?auto_187932 ) ( CLEAR ?auto_187931 ) ( HOLDING ?auto_187930 ) ( CLEAR ?auto_187929 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187926 ?auto_187927 ?auto_187928 ?auto_187929 ?auto_187930 )
      ( MAKE-8PILE ?auto_187926 ?auto_187927 ?auto_187928 ?auto_187929 ?auto_187930 ?auto_187931 ?auto_187932 ?auto_187933 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187934 - BLOCK
      ?auto_187935 - BLOCK
      ?auto_187936 - BLOCK
      ?auto_187937 - BLOCK
      ?auto_187938 - BLOCK
      ?auto_187939 - BLOCK
      ?auto_187940 - BLOCK
      ?auto_187941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187934 ) ( ON ?auto_187935 ?auto_187934 ) ( ON ?auto_187936 ?auto_187935 ) ( ON ?auto_187937 ?auto_187936 ) ( not ( = ?auto_187934 ?auto_187935 ) ) ( not ( = ?auto_187934 ?auto_187936 ) ) ( not ( = ?auto_187934 ?auto_187937 ) ) ( not ( = ?auto_187934 ?auto_187938 ) ) ( not ( = ?auto_187934 ?auto_187939 ) ) ( not ( = ?auto_187934 ?auto_187940 ) ) ( not ( = ?auto_187934 ?auto_187941 ) ) ( not ( = ?auto_187935 ?auto_187936 ) ) ( not ( = ?auto_187935 ?auto_187937 ) ) ( not ( = ?auto_187935 ?auto_187938 ) ) ( not ( = ?auto_187935 ?auto_187939 ) ) ( not ( = ?auto_187935 ?auto_187940 ) ) ( not ( = ?auto_187935 ?auto_187941 ) ) ( not ( = ?auto_187936 ?auto_187937 ) ) ( not ( = ?auto_187936 ?auto_187938 ) ) ( not ( = ?auto_187936 ?auto_187939 ) ) ( not ( = ?auto_187936 ?auto_187940 ) ) ( not ( = ?auto_187936 ?auto_187941 ) ) ( not ( = ?auto_187937 ?auto_187938 ) ) ( not ( = ?auto_187937 ?auto_187939 ) ) ( not ( = ?auto_187937 ?auto_187940 ) ) ( not ( = ?auto_187937 ?auto_187941 ) ) ( not ( = ?auto_187938 ?auto_187939 ) ) ( not ( = ?auto_187938 ?auto_187940 ) ) ( not ( = ?auto_187938 ?auto_187941 ) ) ( not ( = ?auto_187939 ?auto_187940 ) ) ( not ( = ?auto_187939 ?auto_187941 ) ) ( not ( = ?auto_187940 ?auto_187941 ) ) ( ON-TABLE ?auto_187941 ) ( ON ?auto_187940 ?auto_187941 ) ( ON ?auto_187939 ?auto_187940 ) ( CLEAR ?auto_187937 ) ( ON ?auto_187938 ?auto_187939 ) ( CLEAR ?auto_187938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187941 ?auto_187940 ?auto_187939 )
      ( MAKE-8PILE ?auto_187934 ?auto_187935 ?auto_187936 ?auto_187937 ?auto_187938 ?auto_187939 ?auto_187940 ?auto_187941 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187942 - BLOCK
      ?auto_187943 - BLOCK
      ?auto_187944 - BLOCK
      ?auto_187945 - BLOCK
      ?auto_187946 - BLOCK
      ?auto_187947 - BLOCK
      ?auto_187948 - BLOCK
      ?auto_187949 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187942 ) ( ON ?auto_187943 ?auto_187942 ) ( ON ?auto_187944 ?auto_187943 ) ( not ( = ?auto_187942 ?auto_187943 ) ) ( not ( = ?auto_187942 ?auto_187944 ) ) ( not ( = ?auto_187942 ?auto_187945 ) ) ( not ( = ?auto_187942 ?auto_187946 ) ) ( not ( = ?auto_187942 ?auto_187947 ) ) ( not ( = ?auto_187942 ?auto_187948 ) ) ( not ( = ?auto_187942 ?auto_187949 ) ) ( not ( = ?auto_187943 ?auto_187944 ) ) ( not ( = ?auto_187943 ?auto_187945 ) ) ( not ( = ?auto_187943 ?auto_187946 ) ) ( not ( = ?auto_187943 ?auto_187947 ) ) ( not ( = ?auto_187943 ?auto_187948 ) ) ( not ( = ?auto_187943 ?auto_187949 ) ) ( not ( = ?auto_187944 ?auto_187945 ) ) ( not ( = ?auto_187944 ?auto_187946 ) ) ( not ( = ?auto_187944 ?auto_187947 ) ) ( not ( = ?auto_187944 ?auto_187948 ) ) ( not ( = ?auto_187944 ?auto_187949 ) ) ( not ( = ?auto_187945 ?auto_187946 ) ) ( not ( = ?auto_187945 ?auto_187947 ) ) ( not ( = ?auto_187945 ?auto_187948 ) ) ( not ( = ?auto_187945 ?auto_187949 ) ) ( not ( = ?auto_187946 ?auto_187947 ) ) ( not ( = ?auto_187946 ?auto_187948 ) ) ( not ( = ?auto_187946 ?auto_187949 ) ) ( not ( = ?auto_187947 ?auto_187948 ) ) ( not ( = ?auto_187947 ?auto_187949 ) ) ( not ( = ?auto_187948 ?auto_187949 ) ) ( ON-TABLE ?auto_187949 ) ( ON ?auto_187948 ?auto_187949 ) ( ON ?auto_187947 ?auto_187948 ) ( ON ?auto_187946 ?auto_187947 ) ( CLEAR ?auto_187946 ) ( HOLDING ?auto_187945 ) ( CLEAR ?auto_187944 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187942 ?auto_187943 ?auto_187944 ?auto_187945 )
      ( MAKE-8PILE ?auto_187942 ?auto_187943 ?auto_187944 ?auto_187945 ?auto_187946 ?auto_187947 ?auto_187948 ?auto_187949 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187950 - BLOCK
      ?auto_187951 - BLOCK
      ?auto_187952 - BLOCK
      ?auto_187953 - BLOCK
      ?auto_187954 - BLOCK
      ?auto_187955 - BLOCK
      ?auto_187956 - BLOCK
      ?auto_187957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187950 ) ( ON ?auto_187951 ?auto_187950 ) ( ON ?auto_187952 ?auto_187951 ) ( not ( = ?auto_187950 ?auto_187951 ) ) ( not ( = ?auto_187950 ?auto_187952 ) ) ( not ( = ?auto_187950 ?auto_187953 ) ) ( not ( = ?auto_187950 ?auto_187954 ) ) ( not ( = ?auto_187950 ?auto_187955 ) ) ( not ( = ?auto_187950 ?auto_187956 ) ) ( not ( = ?auto_187950 ?auto_187957 ) ) ( not ( = ?auto_187951 ?auto_187952 ) ) ( not ( = ?auto_187951 ?auto_187953 ) ) ( not ( = ?auto_187951 ?auto_187954 ) ) ( not ( = ?auto_187951 ?auto_187955 ) ) ( not ( = ?auto_187951 ?auto_187956 ) ) ( not ( = ?auto_187951 ?auto_187957 ) ) ( not ( = ?auto_187952 ?auto_187953 ) ) ( not ( = ?auto_187952 ?auto_187954 ) ) ( not ( = ?auto_187952 ?auto_187955 ) ) ( not ( = ?auto_187952 ?auto_187956 ) ) ( not ( = ?auto_187952 ?auto_187957 ) ) ( not ( = ?auto_187953 ?auto_187954 ) ) ( not ( = ?auto_187953 ?auto_187955 ) ) ( not ( = ?auto_187953 ?auto_187956 ) ) ( not ( = ?auto_187953 ?auto_187957 ) ) ( not ( = ?auto_187954 ?auto_187955 ) ) ( not ( = ?auto_187954 ?auto_187956 ) ) ( not ( = ?auto_187954 ?auto_187957 ) ) ( not ( = ?auto_187955 ?auto_187956 ) ) ( not ( = ?auto_187955 ?auto_187957 ) ) ( not ( = ?auto_187956 ?auto_187957 ) ) ( ON-TABLE ?auto_187957 ) ( ON ?auto_187956 ?auto_187957 ) ( ON ?auto_187955 ?auto_187956 ) ( ON ?auto_187954 ?auto_187955 ) ( CLEAR ?auto_187952 ) ( ON ?auto_187953 ?auto_187954 ) ( CLEAR ?auto_187953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_187957 ?auto_187956 ?auto_187955 ?auto_187954 )
      ( MAKE-8PILE ?auto_187950 ?auto_187951 ?auto_187952 ?auto_187953 ?auto_187954 ?auto_187955 ?auto_187956 ?auto_187957 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187958 - BLOCK
      ?auto_187959 - BLOCK
      ?auto_187960 - BLOCK
      ?auto_187961 - BLOCK
      ?auto_187962 - BLOCK
      ?auto_187963 - BLOCK
      ?auto_187964 - BLOCK
      ?auto_187965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187958 ) ( ON ?auto_187959 ?auto_187958 ) ( not ( = ?auto_187958 ?auto_187959 ) ) ( not ( = ?auto_187958 ?auto_187960 ) ) ( not ( = ?auto_187958 ?auto_187961 ) ) ( not ( = ?auto_187958 ?auto_187962 ) ) ( not ( = ?auto_187958 ?auto_187963 ) ) ( not ( = ?auto_187958 ?auto_187964 ) ) ( not ( = ?auto_187958 ?auto_187965 ) ) ( not ( = ?auto_187959 ?auto_187960 ) ) ( not ( = ?auto_187959 ?auto_187961 ) ) ( not ( = ?auto_187959 ?auto_187962 ) ) ( not ( = ?auto_187959 ?auto_187963 ) ) ( not ( = ?auto_187959 ?auto_187964 ) ) ( not ( = ?auto_187959 ?auto_187965 ) ) ( not ( = ?auto_187960 ?auto_187961 ) ) ( not ( = ?auto_187960 ?auto_187962 ) ) ( not ( = ?auto_187960 ?auto_187963 ) ) ( not ( = ?auto_187960 ?auto_187964 ) ) ( not ( = ?auto_187960 ?auto_187965 ) ) ( not ( = ?auto_187961 ?auto_187962 ) ) ( not ( = ?auto_187961 ?auto_187963 ) ) ( not ( = ?auto_187961 ?auto_187964 ) ) ( not ( = ?auto_187961 ?auto_187965 ) ) ( not ( = ?auto_187962 ?auto_187963 ) ) ( not ( = ?auto_187962 ?auto_187964 ) ) ( not ( = ?auto_187962 ?auto_187965 ) ) ( not ( = ?auto_187963 ?auto_187964 ) ) ( not ( = ?auto_187963 ?auto_187965 ) ) ( not ( = ?auto_187964 ?auto_187965 ) ) ( ON-TABLE ?auto_187965 ) ( ON ?auto_187964 ?auto_187965 ) ( ON ?auto_187963 ?auto_187964 ) ( ON ?auto_187962 ?auto_187963 ) ( ON ?auto_187961 ?auto_187962 ) ( CLEAR ?auto_187961 ) ( HOLDING ?auto_187960 ) ( CLEAR ?auto_187959 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_187958 ?auto_187959 ?auto_187960 )
      ( MAKE-8PILE ?auto_187958 ?auto_187959 ?auto_187960 ?auto_187961 ?auto_187962 ?auto_187963 ?auto_187964 ?auto_187965 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187966 - BLOCK
      ?auto_187967 - BLOCK
      ?auto_187968 - BLOCK
      ?auto_187969 - BLOCK
      ?auto_187970 - BLOCK
      ?auto_187971 - BLOCK
      ?auto_187972 - BLOCK
      ?auto_187973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187966 ) ( ON ?auto_187967 ?auto_187966 ) ( not ( = ?auto_187966 ?auto_187967 ) ) ( not ( = ?auto_187966 ?auto_187968 ) ) ( not ( = ?auto_187966 ?auto_187969 ) ) ( not ( = ?auto_187966 ?auto_187970 ) ) ( not ( = ?auto_187966 ?auto_187971 ) ) ( not ( = ?auto_187966 ?auto_187972 ) ) ( not ( = ?auto_187966 ?auto_187973 ) ) ( not ( = ?auto_187967 ?auto_187968 ) ) ( not ( = ?auto_187967 ?auto_187969 ) ) ( not ( = ?auto_187967 ?auto_187970 ) ) ( not ( = ?auto_187967 ?auto_187971 ) ) ( not ( = ?auto_187967 ?auto_187972 ) ) ( not ( = ?auto_187967 ?auto_187973 ) ) ( not ( = ?auto_187968 ?auto_187969 ) ) ( not ( = ?auto_187968 ?auto_187970 ) ) ( not ( = ?auto_187968 ?auto_187971 ) ) ( not ( = ?auto_187968 ?auto_187972 ) ) ( not ( = ?auto_187968 ?auto_187973 ) ) ( not ( = ?auto_187969 ?auto_187970 ) ) ( not ( = ?auto_187969 ?auto_187971 ) ) ( not ( = ?auto_187969 ?auto_187972 ) ) ( not ( = ?auto_187969 ?auto_187973 ) ) ( not ( = ?auto_187970 ?auto_187971 ) ) ( not ( = ?auto_187970 ?auto_187972 ) ) ( not ( = ?auto_187970 ?auto_187973 ) ) ( not ( = ?auto_187971 ?auto_187972 ) ) ( not ( = ?auto_187971 ?auto_187973 ) ) ( not ( = ?auto_187972 ?auto_187973 ) ) ( ON-TABLE ?auto_187973 ) ( ON ?auto_187972 ?auto_187973 ) ( ON ?auto_187971 ?auto_187972 ) ( ON ?auto_187970 ?auto_187971 ) ( ON ?auto_187969 ?auto_187970 ) ( CLEAR ?auto_187967 ) ( ON ?auto_187968 ?auto_187969 ) ( CLEAR ?auto_187968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_187973 ?auto_187972 ?auto_187971 ?auto_187970 ?auto_187969 )
      ( MAKE-8PILE ?auto_187966 ?auto_187967 ?auto_187968 ?auto_187969 ?auto_187970 ?auto_187971 ?auto_187972 ?auto_187973 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187974 - BLOCK
      ?auto_187975 - BLOCK
      ?auto_187976 - BLOCK
      ?auto_187977 - BLOCK
      ?auto_187978 - BLOCK
      ?auto_187979 - BLOCK
      ?auto_187980 - BLOCK
      ?auto_187981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187974 ) ( not ( = ?auto_187974 ?auto_187975 ) ) ( not ( = ?auto_187974 ?auto_187976 ) ) ( not ( = ?auto_187974 ?auto_187977 ) ) ( not ( = ?auto_187974 ?auto_187978 ) ) ( not ( = ?auto_187974 ?auto_187979 ) ) ( not ( = ?auto_187974 ?auto_187980 ) ) ( not ( = ?auto_187974 ?auto_187981 ) ) ( not ( = ?auto_187975 ?auto_187976 ) ) ( not ( = ?auto_187975 ?auto_187977 ) ) ( not ( = ?auto_187975 ?auto_187978 ) ) ( not ( = ?auto_187975 ?auto_187979 ) ) ( not ( = ?auto_187975 ?auto_187980 ) ) ( not ( = ?auto_187975 ?auto_187981 ) ) ( not ( = ?auto_187976 ?auto_187977 ) ) ( not ( = ?auto_187976 ?auto_187978 ) ) ( not ( = ?auto_187976 ?auto_187979 ) ) ( not ( = ?auto_187976 ?auto_187980 ) ) ( not ( = ?auto_187976 ?auto_187981 ) ) ( not ( = ?auto_187977 ?auto_187978 ) ) ( not ( = ?auto_187977 ?auto_187979 ) ) ( not ( = ?auto_187977 ?auto_187980 ) ) ( not ( = ?auto_187977 ?auto_187981 ) ) ( not ( = ?auto_187978 ?auto_187979 ) ) ( not ( = ?auto_187978 ?auto_187980 ) ) ( not ( = ?auto_187978 ?auto_187981 ) ) ( not ( = ?auto_187979 ?auto_187980 ) ) ( not ( = ?auto_187979 ?auto_187981 ) ) ( not ( = ?auto_187980 ?auto_187981 ) ) ( ON-TABLE ?auto_187981 ) ( ON ?auto_187980 ?auto_187981 ) ( ON ?auto_187979 ?auto_187980 ) ( ON ?auto_187978 ?auto_187979 ) ( ON ?auto_187977 ?auto_187978 ) ( ON ?auto_187976 ?auto_187977 ) ( CLEAR ?auto_187976 ) ( HOLDING ?auto_187975 ) ( CLEAR ?auto_187974 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_187974 ?auto_187975 )
      ( MAKE-8PILE ?auto_187974 ?auto_187975 ?auto_187976 ?auto_187977 ?auto_187978 ?auto_187979 ?auto_187980 ?auto_187981 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187982 - BLOCK
      ?auto_187983 - BLOCK
      ?auto_187984 - BLOCK
      ?auto_187985 - BLOCK
      ?auto_187986 - BLOCK
      ?auto_187987 - BLOCK
      ?auto_187988 - BLOCK
      ?auto_187989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_187982 ) ( not ( = ?auto_187982 ?auto_187983 ) ) ( not ( = ?auto_187982 ?auto_187984 ) ) ( not ( = ?auto_187982 ?auto_187985 ) ) ( not ( = ?auto_187982 ?auto_187986 ) ) ( not ( = ?auto_187982 ?auto_187987 ) ) ( not ( = ?auto_187982 ?auto_187988 ) ) ( not ( = ?auto_187982 ?auto_187989 ) ) ( not ( = ?auto_187983 ?auto_187984 ) ) ( not ( = ?auto_187983 ?auto_187985 ) ) ( not ( = ?auto_187983 ?auto_187986 ) ) ( not ( = ?auto_187983 ?auto_187987 ) ) ( not ( = ?auto_187983 ?auto_187988 ) ) ( not ( = ?auto_187983 ?auto_187989 ) ) ( not ( = ?auto_187984 ?auto_187985 ) ) ( not ( = ?auto_187984 ?auto_187986 ) ) ( not ( = ?auto_187984 ?auto_187987 ) ) ( not ( = ?auto_187984 ?auto_187988 ) ) ( not ( = ?auto_187984 ?auto_187989 ) ) ( not ( = ?auto_187985 ?auto_187986 ) ) ( not ( = ?auto_187985 ?auto_187987 ) ) ( not ( = ?auto_187985 ?auto_187988 ) ) ( not ( = ?auto_187985 ?auto_187989 ) ) ( not ( = ?auto_187986 ?auto_187987 ) ) ( not ( = ?auto_187986 ?auto_187988 ) ) ( not ( = ?auto_187986 ?auto_187989 ) ) ( not ( = ?auto_187987 ?auto_187988 ) ) ( not ( = ?auto_187987 ?auto_187989 ) ) ( not ( = ?auto_187988 ?auto_187989 ) ) ( ON-TABLE ?auto_187989 ) ( ON ?auto_187988 ?auto_187989 ) ( ON ?auto_187987 ?auto_187988 ) ( ON ?auto_187986 ?auto_187987 ) ( ON ?auto_187985 ?auto_187986 ) ( ON ?auto_187984 ?auto_187985 ) ( CLEAR ?auto_187982 ) ( ON ?auto_187983 ?auto_187984 ) ( CLEAR ?auto_187983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_187989 ?auto_187988 ?auto_187987 ?auto_187986 ?auto_187985 ?auto_187984 )
      ( MAKE-8PILE ?auto_187982 ?auto_187983 ?auto_187984 ?auto_187985 ?auto_187986 ?auto_187987 ?auto_187988 ?auto_187989 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187990 - BLOCK
      ?auto_187991 - BLOCK
      ?auto_187992 - BLOCK
      ?auto_187993 - BLOCK
      ?auto_187994 - BLOCK
      ?auto_187995 - BLOCK
      ?auto_187996 - BLOCK
      ?auto_187997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187990 ?auto_187991 ) ) ( not ( = ?auto_187990 ?auto_187992 ) ) ( not ( = ?auto_187990 ?auto_187993 ) ) ( not ( = ?auto_187990 ?auto_187994 ) ) ( not ( = ?auto_187990 ?auto_187995 ) ) ( not ( = ?auto_187990 ?auto_187996 ) ) ( not ( = ?auto_187990 ?auto_187997 ) ) ( not ( = ?auto_187991 ?auto_187992 ) ) ( not ( = ?auto_187991 ?auto_187993 ) ) ( not ( = ?auto_187991 ?auto_187994 ) ) ( not ( = ?auto_187991 ?auto_187995 ) ) ( not ( = ?auto_187991 ?auto_187996 ) ) ( not ( = ?auto_187991 ?auto_187997 ) ) ( not ( = ?auto_187992 ?auto_187993 ) ) ( not ( = ?auto_187992 ?auto_187994 ) ) ( not ( = ?auto_187992 ?auto_187995 ) ) ( not ( = ?auto_187992 ?auto_187996 ) ) ( not ( = ?auto_187992 ?auto_187997 ) ) ( not ( = ?auto_187993 ?auto_187994 ) ) ( not ( = ?auto_187993 ?auto_187995 ) ) ( not ( = ?auto_187993 ?auto_187996 ) ) ( not ( = ?auto_187993 ?auto_187997 ) ) ( not ( = ?auto_187994 ?auto_187995 ) ) ( not ( = ?auto_187994 ?auto_187996 ) ) ( not ( = ?auto_187994 ?auto_187997 ) ) ( not ( = ?auto_187995 ?auto_187996 ) ) ( not ( = ?auto_187995 ?auto_187997 ) ) ( not ( = ?auto_187996 ?auto_187997 ) ) ( ON-TABLE ?auto_187997 ) ( ON ?auto_187996 ?auto_187997 ) ( ON ?auto_187995 ?auto_187996 ) ( ON ?auto_187994 ?auto_187995 ) ( ON ?auto_187993 ?auto_187994 ) ( ON ?auto_187992 ?auto_187993 ) ( ON ?auto_187991 ?auto_187992 ) ( CLEAR ?auto_187991 ) ( HOLDING ?auto_187990 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187990 )
      ( MAKE-8PILE ?auto_187990 ?auto_187991 ?auto_187992 ?auto_187993 ?auto_187994 ?auto_187995 ?auto_187996 ?auto_187997 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_187998 - BLOCK
      ?auto_187999 - BLOCK
      ?auto_188000 - BLOCK
      ?auto_188001 - BLOCK
      ?auto_188002 - BLOCK
      ?auto_188003 - BLOCK
      ?auto_188004 - BLOCK
      ?auto_188005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187998 ?auto_187999 ) ) ( not ( = ?auto_187998 ?auto_188000 ) ) ( not ( = ?auto_187998 ?auto_188001 ) ) ( not ( = ?auto_187998 ?auto_188002 ) ) ( not ( = ?auto_187998 ?auto_188003 ) ) ( not ( = ?auto_187998 ?auto_188004 ) ) ( not ( = ?auto_187998 ?auto_188005 ) ) ( not ( = ?auto_187999 ?auto_188000 ) ) ( not ( = ?auto_187999 ?auto_188001 ) ) ( not ( = ?auto_187999 ?auto_188002 ) ) ( not ( = ?auto_187999 ?auto_188003 ) ) ( not ( = ?auto_187999 ?auto_188004 ) ) ( not ( = ?auto_187999 ?auto_188005 ) ) ( not ( = ?auto_188000 ?auto_188001 ) ) ( not ( = ?auto_188000 ?auto_188002 ) ) ( not ( = ?auto_188000 ?auto_188003 ) ) ( not ( = ?auto_188000 ?auto_188004 ) ) ( not ( = ?auto_188000 ?auto_188005 ) ) ( not ( = ?auto_188001 ?auto_188002 ) ) ( not ( = ?auto_188001 ?auto_188003 ) ) ( not ( = ?auto_188001 ?auto_188004 ) ) ( not ( = ?auto_188001 ?auto_188005 ) ) ( not ( = ?auto_188002 ?auto_188003 ) ) ( not ( = ?auto_188002 ?auto_188004 ) ) ( not ( = ?auto_188002 ?auto_188005 ) ) ( not ( = ?auto_188003 ?auto_188004 ) ) ( not ( = ?auto_188003 ?auto_188005 ) ) ( not ( = ?auto_188004 ?auto_188005 ) ) ( ON-TABLE ?auto_188005 ) ( ON ?auto_188004 ?auto_188005 ) ( ON ?auto_188003 ?auto_188004 ) ( ON ?auto_188002 ?auto_188003 ) ( ON ?auto_188001 ?auto_188002 ) ( ON ?auto_188000 ?auto_188001 ) ( ON ?auto_187999 ?auto_188000 ) ( ON ?auto_187998 ?auto_187999 ) ( CLEAR ?auto_187998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188005 ?auto_188004 ?auto_188003 ?auto_188002 ?auto_188001 ?auto_188000 ?auto_187999 )
      ( MAKE-8PILE ?auto_187998 ?auto_187999 ?auto_188000 ?auto_188001 ?auto_188002 ?auto_188003 ?auto_188004 ?auto_188005 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188014 - BLOCK
      ?auto_188015 - BLOCK
      ?auto_188016 - BLOCK
      ?auto_188017 - BLOCK
      ?auto_188018 - BLOCK
      ?auto_188019 - BLOCK
      ?auto_188020 - BLOCK
      ?auto_188021 - BLOCK
    )
    :vars
    (
      ?auto_188022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188014 ?auto_188015 ) ) ( not ( = ?auto_188014 ?auto_188016 ) ) ( not ( = ?auto_188014 ?auto_188017 ) ) ( not ( = ?auto_188014 ?auto_188018 ) ) ( not ( = ?auto_188014 ?auto_188019 ) ) ( not ( = ?auto_188014 ?auto_188020 ) ) ( not ( = ?auto_188014 ?auto_188021 ) ) ( not ( = ?auto_188015 ?auto_188016 ) ) ( not ( = ?auto_188015 ?auto_188017 ) ) ( not ( = ?auto_188015 ?auto_188018 ) ) ( not ( = ?auto_188015 ?auto_188019 ) ) ( not ( = ?auto_188015 ?auto_188020 ) ) ( not ( = ?auto_188015 ?auto_188021 ) ) ( not ( = ?auto_188016 ?auto_188017 ) ) ( not ( = ?auto_188016 ?auto_188018 ) ) ( not ( = ?auto_188016 ?auto_188019 ) ) ( not ( = ?auto_188016 ?auto_188020 ) ) ( not ( = ?auto_188016 ?auto_188021 ) ) ( not ( = ?auto_188017 ?auto_188018 ) ) ( not ( = ?auto_188017 ?auto_188019 ) ) ( not ( = ?auto_188017 ?auto_188020 ) ) ( not ( = ?auto_188017 ?auto_188021 ) ) ( not ( = ?auto_188018 ?auto_188019 ) ) ( not ( = ?auto_188018 ?auto_188020 ) ) ( not ( = ?auto_188018 ?auto_188021 ) ) ( not ( = ?auto_188019 ?auto_188020 ) ) ( not ( = ?auto_188019 ?auto_188021 ) ) ( not ( = ?auto_188020 ?auto_188021 ) ) ( ON-TABLE ?auto_188021 ) ( ON ?auto_188020 ?auto_188021 ) ( ON ?auto_188019 ?auto_188020 ) ( ON ?auto_188018 ?auto_188019 ) ( ON ?auto_188017 ?auto_188018 ) ( ON ?auto_188016 ?auto_188017 ) ( ON ?auto_188015 ?auto_188016 ) ( CLEAR ?auto_188015 ) ( ON ?auto_188014 ?auto_188022 ) ( CLEAR ?auto_188014 ) ( HAND-EMPTY ) ( not ( = ?auto_188014 ?auto_188022 ) ) ( not ( = ?auto_188015 ?auto_188022 ) ) ( not ( = ?auto_188016 ?auto_188022 ) ) ( not ( = ?auto_188017 ?auto_188022 ) ) ( not ( = ?auto_188018 ?auto_188022 ) ) ( not ( = ?auto_188019 ?auto_188022 ) ) ( not ( = ?auto_188020 ?auto_188022 ) ) ( not ( = ?auto_188021 ?auto_188022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_188014 ?auto_188022 )
      ( MAKE-8PILE ?auto_188014 ?auto_188015 ?auto_188016 ?auto_188017 ?auto_188018 ?auto_188019 ?auto_188020 ?auto_188021 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188023 - BLOCK
      ?auto_188024 - BLOCK
      ?auto_188025 - BLOCK
      ?auto_188026 - BLOCK
      ?auto_188027 - BLOCK
      ?auto_188028 - BLOCK
      ?auto_188029 - BLOCK
      ?auto_188030 - BLOCK
    )
    :vars
    (
      ?auto_188031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188023 ?auto_188024 ) ) ( not ( = ?auto_188023 ?auto_188025 ) ) ( not ( = ?auto_188023 ?auto_188026 ) ) ( not ( = ?auto_188023 ?auto_188027 ) ) ( not ( = ?auto_188023 ?auto_188028 ) ) ( not ( = ?auto_188023 ?auto_188029 ) ) ( not ( = ?auto_188023 ?auto_188030 ) ) ( not ( = ?auto_188024 ?auto_188025 ) ) ( not ( = ?auto_188024 ?auto_188026 ) ) ( not ( = ?auto_188024 ?auto_188027 ) ) ( not ( = ?auto_188024 ?auto_188028 ) ) ( not ( = ?auto_188024 ?auto_188029 ) ) ( not ( = ?auto_188024 ?auto_188030 ) ) ( not ( = ?auto_188025 ?auto_188026 ) ) ( not ( = ?auto_188025 ?auto_188027 ) ) ( not ( = ?auto_188025 ?auto_188028 ) ) ( not ( = ?auto_188025 ?auto_188029 ) ) ( not ( = ?auto_188025 ?auto_188030 ) ) ( not ( = ?auto_188026 ?auto_188027 ) ) ( not ( = ?auto_188026 ?auto_188028 ) ) ( not ( = ?auto_188026 ?auto_188029 ) ) ( not ( = ?auto_188026 ?auto_188030 ) ) ( not ( = ?auto_188027 ?auto_188028 ) ) ( not ( = ?auto_188027 ?auto_188029 ) ) ( not ( = ?auto_188027 ?auto_188030 ) ) ( not ( = ?auto_188028 ?auto_188029 ) ) ( not ( = ?auto_188028 ?auto_188030 ) ) ( not ( = ?auto_188029 ?auto_188030 ) ) ( ON-TABLE ?auto_188030 ) ( ON ?auto_188029 ?auto_188030 ) ( ON ?auto_188028 ?auto_188029 ) ( ON ?auto_188027 ?auto_188028 ) ( ON ?auto_188026 ?auto_188027 ) ( ON ?auto_188025 ?auto_188026 ) ( ON ?auto_188023 ?auto_188031 ) ( CLEAR ?auto_188023 ) ( not ( = ?auto_188023 ?auto_188031 ) ) ( not ( = ?auto_188024 ?auto_188031 ) ) ( not ( = ?auto_188025 ?auto_188031 ) ) ( not ( = ?auto_188026 ?auto_188031 ) ) ( not ( = ?auto_188027 ?auto_188031 ) ) ( not ( = ?auto_188028 ?auto_188031 ) ) ( not ( = ?auto_188029 ?auto_188031 ) ) ( not ( = ?auto_188030 ?auto_188031 ) ) ( HOLDING ?auto_188024 ) ( CLEAR ?auto_188025 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188030 ?auto_188029 ?auto_188028 ?auto_188027 ?auto_188026 ?auto_188025 ?auto_188024 )
      ( MAKE-8PILE ?auto_188023 ?auto_188024 ?auto_188025 ?auto_188026 ?auto_188027 ?auto_188028 ?auto_188029 ?auto_188030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188032 - BLOCK
      ?auto_188033 - BLOCK
      ?auto_188034 - BLOCK
      ?auto_188035 - BLOCK
      ?auto_188036 - BLOCK
      ?auto_188037 - BLOCK
      ?auto_188038 - BLOCK
      ?auto_188039 - BLOCK
    )
    :vars
    (
      ?auto_188040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188032 ?auto_188033 ) ) ( not ( = ?auto_188032 ?auto_188034 ) ) ( not ( = ?auto_188032 ?auto_188035 ) ) ( not ( = ?auto_188032 ?auto_188036 ) ) ( not ( = ?auto_188032 ?auto_188037 ) ) ( not ( = ?auto_188032 ?auto_188038 ) ) ( not ( = ?auto_188032 ?auto_188039 ) ) ( not ( = ?auto_188033 ?auto_188034 ) ) ( not ( = ?auto_188033 ?auto_188035 ) ) ( not ( = ?auto_188033 ?auto_188036 ) ) ( not ( = ?auto_188033 ?auto_188037 ) ) ( not ( = ?auto_188033 ?auto_188038 ) ) ( not ( = ?auto_188033 ?auto_188039 ) ) ( not ( = ?auto_188034 ?auto_188035 ) ) ( not ( = ?auto_188034 ?auto_188036 ) ) ( not ( = ?auto_188034 ?auto_188037 ) ) ( not ( = ?auto_188034 ?auto_188038 ) ) ( not ( = ?auto_188034 ?auto_188039 ) ) ( not ( = ?auto_188035 ?auto_188036 ) ) ( not ( = ?auto_188035 ?auto_188037 ) ) ( not ( = ?auto_188035 ?auto_188038 ) ) ( not ( = ?auto_188035 ?auto_188039 ) ) ( not ( = ?auto_188036 ?auto_188037 ) ) ( not ( = ?auto_188036 ?auto_188038 ) ) ( not ( = ?auto_188036 ?auto_188039 ) ) ( not ( = ?auto_188037 ?auto_188038 ) ) ( not ( = ?auto_188037 ?auto_188039 ) ) ( not ( = ?auto_188038 ?auto_188039 ) ) ( ON-TABLE ?auto_188039 ) ( ON ?auto_188038 ?auto_188039 ) ( ON ?auto_188037 ?auto_188038 ) ( ON ?auto_188036 ?auto_188037 ) ( ON ?auto_188035 ?auto_188036 ) ( ON ?auto_188034 ?auto_188035 ) ( ON ?auto_188032 ?auto_188040 ) ( not ( = ?auto_188032 ?auto_188040 ) ) ( not ( = ?auto_188033 ?auto_188040 ) ) ( not ( = ?auto_188034 ?auto_188040 ) ) ( not ( = ?auto_188035 ?auto_188040 ) ) ( not ( = ?auto_188036 ?auto_188040 ) ) ( not ( = ?auto_188037 ?auto_188040 ) ) ( not ( = ?auto_188038 ?auto_188040 ) ) ( not ( = ?auto_188039 ?auto_188040 ) ) ( CLEAR ?auto_188034 ) ( ON ?auto_188033 ?auto_188032 ) ( CLEAR ?auto_188033 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_188040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188040 ?auto_188032 )
      ( MAKE-8PILE ?auto_188032 ?auto_188033 ?auto_188034 ?auto_188035 ?auto_188036 ?auto_188037 ?auto_188038 ?auto_188039 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188041 - BLOCK
      ?auto_188042 - BLOCK
      ?auto_188043 - BLOCK
      ?auto_188044 - BLOCK
      ?auto_188045 - BLOCK
      ?auto_188046 - BLOCK
      ?auto_188047 - BLOCK
      ?auto_188048 - BLOCK
    )
    :vars
    (
      ?auto_188049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188041 ?auto_188042 ) ) ( not ( = ?auto_188041 ?auto_188043 ) ) ( not ( = ?auto_188041 ?auto_188044 ) ) ( not ( = ?auto_188041 ?auto_188045 ) ) ( not ( = ?auto_188041 ?auto_188046 ) ) ( not ( = ?auto_188041 ?auto_188047 ) ) ( not ( = ?auto_188041 ?auto_188048 ) ) ( not ( = ?auto_188042 ?auto_188043 ) ) ( not ( = ?auto_188042 ?auto_188044 ) ) ( not ( = ?auto_188042 ?auto_188045 ) ) ( not ( = ?auto_188042 ?auto_188046 ) ) ( not ( = ?auto_188042 ?auto_188047 ) ) ( not ( = ?auto_188042 ?auto_188048 ) ) ( not ( = ?auto_188043 ?auto_188044 ) ) ( not ( = ?auto_188043 ?auto_188045 ) ) ( not ( = ?auto_188043 ?auto_188046 ) ) ( not ( = ?auto_188043 ?auto_188047 ) ) ( not ( = ?auto_188043 ?auto_188048 ) ) ( not ( = ?auto_188044 ?auto_188045 ) ) ( not ( = ?auto_188044 ?auto_188046 ) ) ( not ( = ?auto_188044 ?auto_188047 ) ) ( not ( = ?auto_188044 ?auto_188048 ) ) ( not ( = ?auto_188045 ?auto_188046 ) ) ( not ( = ?auto_188045 ?auto_188047 ) ) ( not ( = ?auto_188045 ?auto_188048 ) ) ( not ( = ?auto_188046 ?auto_188047 ) ) ( not ( = ?auto_188046 ?auto_188048 ) ) ( not ( = ?auto_188047 ?auto_188048 ) ) ( ON-TABLE ?auto_188048 ) ( ON ?auto_188047 ?auto_188048 ) ( ON ?auto_188046 ?auto_188047 ) ( ON ?auto_188045 ?auto_188046 ) ( ON ?auto_188044 ?auto_188045 ) ( ON ?auto_188041 ?auto_188049 ) ( not ( = ?auto_188041 ?auto_188049 ) ) ( not ( = ?auto_188042 ?auto_188049 ) ) ( not ( = ?auto_188043 ?auto_188049 ) ) ( not ( = ?auto_188044 ?auto_188049 ) ) ( not ( = ?auto_188045 ?auto_188049 ) ) ( not ( = ?auto_188046 ?auto_188049 ) ) ( not ( = ?auto_188047 ?auto_188049 ) ) ( not ( = ?auto_188048 ?auto_188049 ) ) ( ON ?auto_188042 ?auto_188041 ) ( CLEAR ?auto_188042 ) ( ON-TABLE ?auto_188049 ) ( HOLDING ?auto_188043 ) ( CLEAR ?auto_188044 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188048 ?auto_188047 ?auto_188046 ?auto_188045 ?auto_188044 ?auto_188043 )
      ( MAKE-8PILE ?auto_188041 ?auto_188042 ?auto_188043 ?auto_188044 ?auto_188045 ?auto_188046 ?auto_188047 ?auto_188048 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188050 - BLOCK
      ?auto_188051 - BLOCK
      ?auto_188052 - BLOCK
      ?auto_188053 - BLOCK
      ?auto_188054 - BLOCK
      ?auto_188055 - BLOCK
      ?auto_188056 - BLOCK
      ?auto_188057 - BLOCK
    )
    :vars
    (
      ?auto_188058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188050 ?auto_188051 ) ) ( not ( = ?auto_188050 ?auto_188052 ) ) ( not ( = ?auto_188050 ?auto_188053 ) ) ( not ( = ?auto_188050 ?auto_188054 ) ) ( not ( = ?auto_188050 ?auto_188055 ) ) ( not ( = ?auto_188050 ?auto_188056 ) ) ( not ( = ?auto_188050 ?auto_188057 ) ) ( not ( = ?auto_188051 ?auto_188052 ) ) ( not ( = ?auto_188051 ?auto_188053 ) ) ( not ( = ?auto_188051 ?auto_188054 ) ) ( not ( = ?auto_188051 ?auto_188055 ) ) ( not ( = ?auto_188051 ?auto_188056 ) ) ( not ( = ?auto_188051 ?auto_188057 ) ) ( not ( = ?auto_188052 ?auto_188053 ) ) ( not ( = ?auto_188052 ?auto_188054 ) ) ( not ( = ?auto_188052 ?auto_188055 ) ) ( not ( = ?auto_188052 ?auto_188056 ) ) ( not ( = ?auto_188052 ?auto_188057 ) ) ( not ( = ?auto_188053 ?auto_188054 ) ) ( not ( = ?auto_188053 ?auto_188055 ) ) ( not ( = ?auto_188053 ?auto_188056 ) ) ( not ( = ?auto_188053 ?auto_188057 ) ) ( not ( = ?auto_188054 ?auto_188055 ) ) ( not ( = ?auto_188054 ?auto_188056 ) ) ( not ( = ?auto_188054 ?auto_188057 ) ) ( not ( = ?auto_188055 ?auto_188056 ) ) ( not ( = ?auto_188055 ?auto_188057 ) ) ( not ( = ?auto_188056 ?auto_188057 ) ) ( ON-TABLE ?auto_188057 ) ( ON ?auto_188056 ?auto_188057 ) ( ON ?auto_188055 ?auto_188056 ) ( ON ?auto_188054 ?auto_188055 ) ( ON ?auto_188053 ?auto_188054 ) ( ON ?auto_188050 ?auto_188058 ) ( not ( = ?auto_188050 ?auto_188058 ) ) ( not ( = ?auto_188051 ?auto_188058 ) ) ( not ( = ?auto_188052 ?auto_188058 ) ) ( not ( = ?auto_188053 ?auto_188058 ) ) ( not ( = ?auto_188054 ?auto_188058 ) ) ( not ( = ?auto_188055 ?auto_188058 ) ) ( not ( = ?auto_188056 ?auto_188058 ) ) ( not ( = ?auto_188057 ?auto_188058 ) ) ( ON ?auto_188051 ?auto_188050 ) ( ON-TABLE ?auto_188058 ) ( CLEAR ?auto_188053 ) ( ON ?auto_188052 ?auto_188051 ) ( CLEAR ?auto_188052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188058 ?auto_188050 ?auto_188051 )
      ( MAKE-8PILE ?auto_188050 ?auto_188051 ?auto_188052 ?auto_188053 ?auto_188054 ?auto_188055 ?auto_188056 ?auto_188057 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188059 - BLOCK
      ?auto_188060 - BLOCK
      ?auto_188061 - BLOCK
      ?auto_188062 - BLOCK
      ?auto_188063 - BLOCK
      ?auto_188064 - BLOCK
      ?auto_188065 - BLOCK
      ?auto_188066 - BLOCK
    )
    :vars
    (
      ?auto_188067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188059 ?auto_188060 ) ) ( not ( = ?auto_188059 ?auto_188061 ) ) ( not ( = ?auto_188059 ?auto_188062 ) ) ( not ( = ?auto_188059 ?auto_188063 ) ) ( not ( = ?auto_188059 ?auto_188064 ) ) ( not ( = ?auto_188059 ?auto_188065 ) ) ( not ( = ?auto_188059 ?auto_188066 ) ) ( not ( = ?auto_188060 ?auto_188061 ) ) ( not ( = ?auto_188060 ?auto_188062 ) ) ( not ( = ?auto_188060 ?auto_188063 ) ) ( not ( = ?auto_188060 ?auto_188064 ) ) ( not ( = ?auto_188060 ?auto_188065 ) ) ( not ( = ?auto_188060 ?auto_188066 ) ) ( not ( = ?auto_188061 ?auto_188062 ) ) ( not ( = ?auto_188061 ?auto_188063 ) ) ( not ( = ?auto_188061 ?auto_188064 ) ) ( not ( = ?auto_188061 ?auto_188065 ) ) ( not ( = ?auto_188061 ?auto_188066 ) ) ( not ( = ?auto_188062 ?auto_188063 ) ) ( not ( = ?auto_188062 ?auto_188064 ) ) ( not ( = ?auto_188062 ?auto_188065 ) ) ( not ( = ?auto_188062 ?auto_188066 ) ) ( not ( = ?auto_188063 ?auto_188064 ) ) ( not ( = ?auto_188063 ?auto_188065 ) ) ( not ( = ?auto_188063 ?auto_188066 ) ) ( not ( = ?auto_188064 ?auto_188065 ) ) ( not ( = ?auto_188064 ?auto_188066 ) ) ( not ( = ?auto_188065 ?auto_188066 ) ) ( ON-TABLE ?auto_188066 ) ( ON ?auto_188065 ?auto_188066 ) ( ON ?auto_188064 ?auto_188065 ) ( ON ?auto_188063 ?auto_188064 ) ( ON ?auto_188059 ?auto_188067 ) ( not ( = ?auto_188059 ?auto_188067 ) ) ( not ( = ?auto_188060 ?auto_188067 ) ) ( not ( = ?auto_188061 ?auto_188067 ) ) ( not ( = ?auto_188062 ?auto_188067 ) ) ( not ( = ?auto_188063 ?auto_188067 ) ) ( not ( = ?auto_188064 ?auto_188067 ) ) ( not ( = ?auto_188065 ?auto_188067 ) ) ( not ( = ?auto_188066 ?auto_188067 ) ) ( ON ?auto_188060 ?auto_188059 ) ( ON-TABLE ?auto_188067 ) ( ON ?auto_188061 ?auto_188060 ) ( CLEAR ?auto_188061 ) ( HOLDING ?auto_188062 ) ( CLEAR ?auto_188063 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188066 ?auto_188065 ?auto_188064 ?auto_188063 ?auto_188062 )
      ( MAKE-8PILE ?auto_188059 ?auto_188060 ?auto_188061 ?auto_188062 ?auto_188063 ?auto_188064 ?auto_188065 ?auto_188066 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188068 - BLOCK
      ?auto_188069 - BLOCK
      ?auto_188070 - BLOCK
      ?auto_188071 - BLOCK
      ?auto_188072 - BLOCK
      ?auto_188073 - BLOCK
      ?auto_188074 - BLOCK
      ?auto_188075 - BLOCK
    )
    :vars
    (
      ?auto_188076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188068 ?auto_188069 ) ) ( not ( = ?auto_188068 ?auto_188070 ) ) ( not ( = ?auto_188068 ?auto_188071 ) ) ( not ( = ?auto_188068 ?auto_188072 ) ) ( not ( = ?auto_188068 ?auto_188073 ) ) ( not ( = ?auto_188068 ?auto_188074 ) ) ( not ( = ?auto_188068 ?auto_188075 ) ) ( not ( = ?auto_188069 ?auto_188070 ) ) ( not ( = ?auto_188069 ?auto_188071 ) ) ( not ( = ?auto_188069 ?auto_188072 ) ) ( not ( = ?auto_188069 ?auto_188073 ) ) ( not ( = ?auto_188069 ?auto_188074 ) ) ( not ( = ?auto_188069 ?auto_188075 ) ) ( not ( = ?auto_188070 ?auto_188071 ) ) ( not ( = ?auto_188070 ?auto_188072 ) ) ( not ( = ?auto_188070 ?auto_188073 ) ) ( not ( = ?auto_188070 ?auto_188074 ) ) ( not ( = ?auto_188070 ?auto_188075 ) ) ( not ( = ?auto_188071 ?auto_188072 ) ) ( not ( = ?auto_188071 ?auto_188073 ) ) ( not ( = ?auto_188071 ?auto_188074 ) ) ( not ( = ?auto_188071 ?auto_188075 ) ) ( not ( = ?auto_188072 ?auto_188073 ) ) ( not ( = ?auto_188072 ?auto_188074 ) ) ( not ( = ?auto_188072 ?auto_188075 ) ) ( not ( = ?auto_188073 ?auto_188074 ) ) ( not ( = ?auto_188073 ?auto_188075 ) ) ( not ( = ?auto_188074 ?auto_188075 ) ) ( ON-TABLE ?auto_188075 ) ( ON ?auto_188074 ?auto_188075 ) ( ON ?auto_188073 ?auto_188074 ) ( ON ?auto_188072 ?auto_188073 ) ( ON ?auto_188068 ?auto_188076 ) ( not ( = ?auto_188068 ?auto_188076 ) ) ( not ( = ?auto_188069 ?auto_188076 ) ) ( not ( = ?auto_188070 ?auto_188076 ) ) ( not ( = ?auto_188071 ?auto_188076 ) ) ( not ( = ?auto_188072 ?auto_188076 ) ) ( not ( = ?auto_188073 ?auto_188076 ) ) ( not ( = ?auto_188074 ?auto_188076 ) ) ( not ( = ?auto_188075 ?auto_188076 ) ) ( ON ?auto_188069 ?auto_188068 ) ( ON-TABLE ?auto_188076 ) ( ON ?auto_188070 ?auto_188069 ) ( CLEAR ?auto_188072 ) ( ON ?auto_188071 ?auto_188070 ) ( CLEAR ?auto_188071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188076 ?auto_188068 ?auto_188069 ?auto_188070 )
      ( MAKE-8PILE ?auto_188068 ?auto_188069 ?auto_188070 ?auto_188071 ?auto_188072 ?auto_188073 ?auto_188074 ?auto_188075 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188077 - BLOCK
      ?auto_188078 - BLOCK
      ?auto_188079 - BLOCK
      ?auto_188080 - BLOCK
      ?auto_188081 - BLOCK
      ?auto_188082 - BLOCK
      ?auto_188083 - BLOCK
      ?auto_188084 - BLOCK
    )
    :vars
    (
      ?auto_188085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188077 ?auto_188078 ) ) ( not ( = ?auto_188077 ?auto_188079 ) ) ( not ( = ?auto_188077 ?auto_188080 ) ) ( not ( = ?auto_188077 ?auto_188081 ) ) ( not ( = ?auto_188077 ?auto_188082 ) ) ( not ( = ?auto_188077 ?auto_188083 ) ) ( not ( = ?auto_188077 ?auto_188084 ) ) ( not ( = ?auto_188078 ?auto_188079 ) ) ( not ( = ?auto_188078 ?auto_188080 ) ) ( not ( = ?auto_188078 ?auto_188081 ) ) ( not ( = ?auto_188078 ?auto_188082 ) ) ( not ( = ?auto_188078 ?auto_188083 ) ) ( not ( = ?auto_188078 ?auto_188084 ) ) ( not ( = ?auto_188079 ?auto_188080 ) ) ( not ( = ?auto_188079 ?auto_188081 ) ) ( not ( = ?auto_188079 ?auto_188082 ) ) ( not ( = ?auto_188079 ?auto_188083 ) ) ( not ( = ?auto_188079 ?auto_188084 ) ) ( not ( = ?auto_188080 ?auto_188081 ) ) ( not ( = ?auto_188080 ?auto_188082 ) ) ( not ( = ?auto_188080 ?auto_188083 ) ) ( not ( = ?auto_188080 ?auto_188084 ) ) ( not ( = ?auto_188081 ?auto_188082 ) ) ( not ( = ?auto_188081 ?auto_188083 ) ) ( not ( = ?auto_188081 ?auto_188084 ) ) ( not ( = ?auto_188082 ?auto_188083 ) ) ( not ( = ?auto_188082 ?auto_188084 ) ) ( not ( = ?auto_188083 ?auto_188084 ) ) ( ON-TABLE ?auto_188084 ) ( ON ?auto_188083 ?auto_188084 ) ( ON ?auto_188082 ?auto_188083 ) ( ON ?auto_188077 ?auto_188085 ) ( not ( = ?auto_188077 ?auto_188085 ) ) ( not ( = ?auto_188078 ?auto_188085 ) ) ( not ( = ?auto_188079 ?auto_188085 ) ) ( not ( = ?auto_188080 ?auto_188085 ) ) ( not ( = ?auto_188081 ?auto_188085 ) ) ( not ( = ?auto_188082 ?auto_188085 ) ) ( not ( = ?auto_188083 ?auto_188085 ) ) ( not ( = ?auto_188084 ?auto_188085 ) ) ( ON ?auto_188078 ?auto_188077 ) ( ON-TABLE ?auto_188085 ) ( ON ?auto_188079 ?auto_188078 ) ( ON ?auto_188080 ?auto_188079 ) ( CLEAR ?auto_188080 ) ( HOLDING ?auto_188081 ) ( CLEAR ?auto_188082 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_188084 ?auto_188083 ?auto_188082 ?auto_188081 )
      ( MAKE-8PILE ?auto_188077 ?auto_188078 ?auto_188079 ?auto_188080 ?auto_188081 ?auto_188082 ?auto_188083 ?auto_188084 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188086 - BLOCK
      ?auto_188087 - BLOCK
      ?auto_188088 - BLOCK
      ?auto_188089 - BLOCK
      ?auto_188090 - BLOCK
      ?auto_188091 - BLOCK
      ?auto_188092 - BLOCK
      ?auto_188093 - BLOCK
    )
    :vars
    (
      ?auto_188094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188086 ?auto_188087 ) ) ( not ( = ?auto_188086 ?auto_188088 ) ) ( not ( = ?auto_188086 ?auto_188089 ) ) ( not ( = ?auto_188086 ?auto_188090 ) ) ( not ( = ?auto_188086 ?auto_188091 ) ) ( not ( = ?auto_188086 ?auto_188092 ) ) ( not ( = ?auto_188086 ?auto_188093 ) ) ( not ( = ?auto_188087 ?auto_188088 ) ) ( not ( = ?auto_188087 ?auto_188089 ) ) ( not ( = ?auto_188087 ?auto_188090 ) ) ( not ( = ?auto_188087 ?auto_188091 ) ) ( not ( = ?auto_188087 ?auto_188092 ) ) ( not ( = ?auto_188087 ?auto_188093 ) ) ( not ( = ?auto_188088 ?auto_188089 ) ) ( not ( = ?auto_188088 ?auto_188090 ) ) ( not ( = ?auto_188088 ?auto_188091 ) ) ( not ( = ?auto_188088 ?auto_188092 ) ) ( not ( = ?auto_188088 ?auto_188093 ) ) ( not ( = ?auto_188089 ?auto_188090 ) ) ( not ( = ?auto_188089 ?auto_188091 ) ) ( not ( = ?auto_188089 ?auto_188092 ) ) ( not ( = ?auto_188089 ?auto_188093 ) ) ( not ( = ?auto_188090 ?auto_188091 ) ) ( not ( = ?auto_188090 ?auto_188092 ) ) ( not ( = ?auto_188090 ?auto_188093 ) ) ( not ( = ?auto_188091 ?auto_188092 ) ) ( not ( = ?auto_188091 ?auto_188093 ) ) ( not ( = ?auto_188092 ?auto_188093 ) ) ( ON-TABLE ?auto_188093 ) ( ON ?auto_188092 ?auto_188093 ) ( ON ?auto_188091 ?auto_188092 ) ( ON ?auto_188086 ?auto_188094 ) ( not ( = ?auto_188086 ?auto_188094 ) ) ( not ( = ?auto_188087 ?auto_188094 ) ) ( not ( = ?auto_188088 ?auto_188094 ) ) ( not ( = ?auto_188089 ?auto_188094 ) ) ( not ( = ?auto_188090 ?auto_188094 ) ) ( not ( = ?auto_188091 ?auto_188094 ) ) ( not ( = ?auto_188092 ?auto_188094 ) ) ( not ( = ?auto_188093 ?auto_188094 ) ) ( ON ?auto_188087 ?auto_188086 ) ( ON-TABLE ?auto_188094 ) ( ON ?auto_188088 ?auto_188087 ) ( ON ?auto_188089 ?auto_188088 ) ( CLEAR ?auto_188091 ) ( ON ?auto_188090 ?auto_188089 ) ( CLEAR ?auto_188090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_188094 ?auto_188086 ?auto_188087 ?auto_188088 ?auto_188089 )
      ( MAKE-8PILE ?auto_188086 ?auto_188087 ?auto_188088 ?auto_188089 ?auto_188090 ?auto_188091 ?auto_188092 ?auto_188093 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188095 - BLOCK
      ?auto_188096 - BLOCK
      ?auto_188097 - BLOCK
      ?auto_188098 - BLOCK
      ?auto_188099 - BLOCK
      ?auto_188100 - BLOCK
      ?auto_188101 - BLOCK
      ?auto_188102 - BLOCK
    )
    :vars
    (
      ?auto_188103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188095 ?auto_188096 ) ) ( not ( = ?auto_188095 ?auto_188097 ) ) ( not ( = ?auto_188095 ?auto_188098 ) ) ( not ( = ?auto_188095 ?auto_188099 ) ) ( not ( = ?auto_188095 ?auto_188100 ) ) ( not ( = ?auto_188095 ?auto_188101 ) ) ( not ( = ?auto_188095 ?auto_188102 ) ) ( not ( = ?auto_188096 ?auto_188097 ) ) ( not ( = ?auto_188096 ?auto_188098 ) ) ( not ( = ?auto_188096 ?auto_188099 ) ) ( not ( = ?auto_188096 ?auto_188100 ) ) ( not ( = ?auto_188096 ?auto_188101 ) ) ( not ( = ?auto_188096 ?auto_188102 ) ) ( not ( = ?auto_188097 ?auto_188098 ) ) ( not ( = ?auto_188097 ?auto_188099 ) ) ( not ( = ?auto_188097 ?auto_188100 ) ) ( not ( = ?auto_188097 ?auto_188101 ) ) ( not ( = ?auto_188097 ?auto_188102 ) ) ( not ( = ?auto_188098 ?auto_188099 ) ) ( not ( = ?auto_188098 ?auto_188100 ) ) ( not ( = ?auto_188098 ?auto_188101 ) ) ( not ( = ?auto_188098 ?auto_188102 ) ) ( not ( = ?auto_188099 ?auto_188100 ) ) ( not ( = ?auto_188099 ?auto_188101 ) ) ( not ( = ?auto_188099 ?auto_188102 ) ) ( not ( = ?auto_188100 ?auto_188101 ) ) ( not ( = ?auto_188100 ?auto_188102 ) ) ( not ( = ?auto_188101 ?auto_188102 ) ) ( ON-TABLE ?auto_188102 ) ( ON ?auto_188101 ?auto_188102 ) ( ON ?auto_188095 ?auto_188103 ) ( not ( = ?auto_188095 ?auto_188103 ) ) ( not ( = ?auto_188096 ?auto_188103 ) ) ( not ( = ?auto_188097 ?auto_188103 ) ) ( not ( = ?auto_188098 ?auto_188103 ) ) ( not ( = ?auto_188099 ?auto_188103 ) ) ( not ( = ?auto_188100 ?auto_188103 ) ) ( not ( = ?auto_188101 ?auto_188103 ) ) ( not ( = ?auto_188102 ?auto_188103 ) ) ( ON ?auto_188096 ?auto_188095 ) ( ON-TABLE ?auto_188103 ) ( ON ?auto_188097 ?auto_188096 ) ( ON ?auto_188098 ?auto_188097 ) ( ON ?auto_188099 ?auto_188098 ) ( CLEAR ?auto_188099 ) ( HOLDING ?auto_188100 ) ( CLEAR ?auto_188101 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_188102 ?auto_188101 ?auto_188100 )
      ( MAKE-8PILE ?auto_188095 ?auto_188096 ?auto_188097 ?auto_188098 ?auto_188099 ?auto_188100 ?auto_188101 ?auto_188102 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188104 - BLOCK
      ?auto_188105 - BLOCK
      ?auto_188106 - BLOCK
      ?auto_188107 - BLOCK
      ?auto_188108 - BLOCK
      ?auto_188109 - BLOCK
      ?auto_188110 - BLOCK
      ?auto_188111 - BLOCK
    )
    :vars
    (
      ?auto_188112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188104 ?auto_188105 ) ) ( not ( = ?auto_188104 ?auto_188106 ) ) ( not ( = ?auto_188104 ?auto_188107 ) ) ( not ( = ?auto_188104 ?auto_188108 ) ) ( not ( = ?auto_188104 ?auto_188109 ) ) ( not ( = ?auto_188104 ?auto_188110 ) ) ( not ( = ?auto_188104 ?auto_188111 ) ) ( not ( = ?auto_188105 ?auto_188106 ) ) ( not ( = ?auto_188105 ?auto_188107 ) ) ( not ( = ?auto_188105 ?auto_188108 ) ) ( not ( = ?auto_188105 ?auto_188109 ) ) ( not ( = ?auto_188105 ?auto_188110 ) ) ( not ( = ?auto_188105 ?auto_188111 ) ) ( not ( = ?auto_188106 ?auto_188107 ) ) ( not ( = ?auto_188106 ?auto_188108 ) ) ( not ( = ?auto_188106 ?auto_188109 ) ) ( not ( = ?auto_188106 ?auto_188110 ) ) ( not ( = ?auto_188106 ?auto_188111 ) ) ( not ( = ?auto_188107 ?auto_188108 ) ) ( not ( = ?auto_188107 ?auto_188109 ) ) ( not ( = ?auto_188107 ?auto_188110 ) ) ( not ( = ?auto_188107 ?auto_188111 ) ) ( not ( = ?auto_188108 ?auto_188109 ) ) ( not ( = ?auto_188108 ?auto_188110 ) ) ( not ( = ?auto_188108 ?auto_188111 ) ) ( not ( = ?auto_188109 ?auto_188110 ) ) ( not ( = ?auto_188109 ?auto_188111 ) ) ( not ( = ?auto_188110 ?auto_188111 ) ) ( ON-TABLE ?auto_188111 ) ( ON ?auto_188110 ?auto_188111 ) ( ON ?auto_188104 ?auto_188112 ) ( not ( = ?auto_188104 ?auto_188112 ) ) ( not ( = ?auto_188105 ?auto_188112 ) ) ( not ( = ?auto_188106 ?auto_188112 ) ) ( not ( = ?auto_188107 ?auto_188112 ) ) ( not ( = ?auto_188108 ?auto_188112 ) ) ( not ( = ?auto_188109 ?auto_188112 ) ) ( not ( = ?auto_188110 ?auto_188112 ) ) ( not ( = ?auto_188111 ?auto_188112 ) ) ( ON ?auto_188105 ?auto_188104 ) ( ON-TABLE ?auto_188112 ) ( ON ?auto_188106 ?auto_188105 ) ( ON ?auto_188107 ?auto_188106 ) ( ON ?auto_188108 ?auto_188107 ) ( CLEAR ?auto_188110 ) ( ON ?auto_188109 ?auto_188108 ) ( CLEAR ?auto_188109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_188112 ?auto_188104 ?auto_188105 ?auto_188106 ?auto_188107 ?auto_188108 )
      ( MAKE-8PILE ?auto_188104 ?auto_188105 ?auto_188106 ?auto_188107 ?auto_188108 ?auto_188109 ?auto_188110 ?auto_188111 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188113 - BLOCK
      ?auto_188114 - BLOCK
      ?auto_188115 - BLOCK
      ?auto_188116 - BLOCK
      ?auto_188117 - BLOCK
      ?auto_188118 - BLOCK
      ?auto_188119 - BLOCK
      ?auto_188120 - BLOCK
    )
    :vars
    (
      ?auto_188121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188113 ?auto_188114 ) ) ( not ( = ?auto_188113 ?auto_188115 ) ) ( not ( = ?auto_188113 ?auto_188116 ) ) ( not ( = ?auto_188113 ?auto_188117 ) ) ( not ( = ?auto_188113 ?auto_188118 ) ) ( not ( = ?auto_188113 ?auto_188119 ) ) ( not ( = ?auto_188113 ?auto_188120 ) ) ( not ( = ?auto_188114 ?auto_188115 ) ) ( not ( = ?auto_188114 ?auto_188116 ) ) ( not ( = ?auto_188114 ?auto_188117 ) ) ( not ( = ?auto_188114 ?auto_188118 ) ) ( not ( = ?auto_188114 ?auto_188119 ) ) ( not ( = ?auto_188114 ?auto_188120 ) ) ( not ( = ?auto_188115 ?auto_188116 ) ) ( not ( = ?auto_188115 ?auto_188117 ) ) ( not ( = ?auto_188115 ?auto_188118 ) ) ( not ( = ?auto_188115 ?auto_188119 ) ) ( not ( = ?auto_188115 ?auto_188120 ) ) ( not ( = ?auto_188116 ?auto_188117 ) ) ( not ( = ?auto_188116 ?auto_188118 ) ) ( not ( = ?auto_188116 ?auto_188119 ) ) ( not ( = ?auto_188116 ?auto_188120 ) ) ( not ( = ?auto_188117 ?auto_188118 ) ) ( not ( = ?auto_188117 ?auto_188119 ) ) ( not ( = ?auto_188117 ?auto_188120 ) ) ( not ( = ?auto_188118 ?auto_188119 ) ) ( not ( = ?auto_188118 ?auto_188120 ) ) ( not ( = ?auto_188119 ?auto_188120 ) ) ( ON-TABLE ?auto_188120 ) ( ON ?auto_188113 ?auto_188121 ) ( not ( = ?auto_188113 ?auto_188121 ) ) ( not ( = ?auto_188114 ?auto_188121 ) ) ( not ( = ?auto_188115 ?auto_188121 ) ) ( not ( = ?auto_188116 ?auto_188121 ) ) ( not ( = ?auto_188117 ?auto_188121 ) ) ( not ( = ?auto_188118 ?auto_188121 ) ) ( not ( = ?auto_188119 ?auto_188121 ) ) ( not ( = ?auto_188120 ?auto_188121 ) ) ( ON ?auto_188114 ?auto_188113 ) ( ON-TABLE ?auto_188121 ) ( ON ?auto_188115 ?auto_188114 ) ( ON ?auto_188116 ?auto_188115 ) ( ON ?auto_188117 ?auto_188116 ) ( ON ?auto_188118 ?auto_188117 ) ( CLEAR ?auto_188118 ) ( HOLDING ?auto_188119 ) ( CLEAR ?auto_188120 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_188120 ?auto_188119 )
      ( MAKE-8PILE ?auto_188113 ?auto_188114 ?auto_188115 ?auto_188116 ?auto_188117 ?auto_188118 ?auto_188119 ?auto_188120 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188122 - BLOCK
      ?auto_188123 - BLOCK
      ?auto_188124 - BLOCK
      ?auto_188125 - BLOCK
      ?auto_188126 - BLOCK
      ?auto_188127 - BLOCK
      ?auto_188128 - BLOCK
      ?auto_188129 - BLOCK
    )
    :vars
    (
      ?auto_188130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188122 ?auto_188123 ) ) ( not ( = ?auto_188122 ?auto_188124 ) ) ( not ( = ?auto_188122 ?auto_188125 ) ) ( not ( = ?auto_188122 ?auto_188126 ) ) ( not ( = ?auto_188122 ?auto_188127 ) ) ( not ( = ?auto_188122 ?auto_188128 ) ) ( not ( = ?auto_188122 ?auto_188129 ) ) ( not ( = ?auto_188123 ?auto_188124 ) ) ( not ( = ?auto_188123 ?auto_188125 ) ) ( not ( = ?auto_188123 ?auto_188126 ) ) ( not ( = ?auto_188123 ?auto_188127 ) ) ( not ( = ?auto_188123 ?auto_188128 ) ) ( not ( = ?auto_188123 ?auto_188129 ) ) ( not ( = ?auto_188124 ?auto_188125 ) ) ( not ( = ?auto_188124 ?auto_188126 ) ) ( not ( = ?auto_188124 ?auto_188127 ) ) ( not ( = ?auto_188124 ?auto_188128 ) ) ( not ( = ?auto_188124 ?auto_188129 ) ) ( not ( = ?auto_188125 ?auto_188126 ) ) ( not ( = ?auto_188125 ?auto_188127 ) ) ( not ( = ?auto_188125 ?auto_188128 ) ) ( not ( = ?auto_188125 ?auto_188129 ) ) ( not ( = ?auto_188126 ?auto_188127 ) ) ( not ( = ?auto_188126 ?auto_188128 ) ) ( not ( = ?auto_188126 ?auto_188129 ) ) ( not ( = ?auto_188127 ?auto_188128 ) ) ( not ( = ?auto_188127 ?auto_188129 ) ) ( not ( = ?auto_188128 ?auto_188129 ) ) ( ON-TABLE ?auto_188129 ) ( ON ?auto_188122 ?auto_188130 ) ( not ( = ?auto_188122 ?auto_188130 ) ) ( not ( = ?auto_188123 ?auto_188130 ) ) ( not ( = ?auto_188124 ?auto_188130 ) ) ( not ( = ?auto_188125 ?auto_188130 ) ) ( not ( = ?auto_188126 ?auto_188130 ) ) ( not ( = ?auto_188127 ?auto_188130 ) ) ( not ( = ?auto_188128 ?auto_188130 ) ) ( not ( = ?auto_188129 ?auto_188130 ) ) ( ON ?auto_188123 ?auto_188122 ) ( ON-TABLE ?auto_188130 ) ( ON ?auto_188124 ?auto_188123 ) ( ON ?auto_188125 ?auto_188124 ) ( ON ?auto_188126 ?auto_188125 ) ( ON ?auto_188127 ?auto_188126 ) ( CLEAR ?auto_188129 ) ( ON ?auto_188128 ?auto_188127 ) ( CLEAR ?auto_188128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_188130 ?auto_188122 ?auto_188123 ?auto_188124 ?auto_188125 ?auto_188126 ?auto_188127 )
      ( MAKE-8PILE ?auto_188122 ?auto_188123 ?auto_188124 ?auto_188125 ?auto_188126 ?auto_188127 ?auto_188128 ?auto_188129 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188131 - BLOCK
      ?auto_188132 - BLOCK
      ?auto_188133 - BLOCK
      ?auto_188134 - BLOCK
      ?auto_188135 - BLOCK
      ?auto_188136 - BLOCK
      ?auto_188137 - BLOCK
      ?auto_188138 - BLOCK
    )
    :vars
    (
      ?auto_188139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188131 ?auto_188132 ) ) ( not ( = ?auto_188131 ?auto_188133 ) ) ( not ( = ?auto_188131 ?auto_188134 ) ) ( not ( = ?auto_188131 ?auto_188135 ) ) ( not ( = ?auto_188131 ?auto_188136 ) ) ( not ( = ?auto_188131 ?auto_188137 ) ) ( not ( = ?auto_188131 ?auto_188138 ) ) ( not ( = ?auto_188132 ?auto_188133 ) ) ( not ( = ?auto_188132 ?auto_188134 ) ) ( not ( = ?auto_188132 ?auto_188135 ) ) ( not ( = ?auto_188132 ?auto_188136 ) ) ( not ( = ?auto_188132 ?auto_188137 ) ) ( not ( = ?auto_188132 ?auto_188138 ) ) ( not ( = ?auto_188133 ?auto_188134 ) ) ( not ( = ?auto_188133 ?auto_188135 ) ) ( not ( = ?auto_188133 ?auto_188136 ) ) ( not ( = ?auto_188133 ?auto_188137 ) ) ( not ( = ?auto_188133 ?auto_188138 ) ) ( not ( = ?auto_188134 ?auto_188135 ) ) ( not ( = ?auto_188134 ?auto_188136 ) ) ( not ( = ?auto_188134 ?auto_188137 ) ) ( not ( = ?auto_188134 ?auto_188138 ) ) ( not ( = ?auto_188135 ?auto_188136 ) ) ( not ( = ?auto_188135 ?auto_188137 ) ) ( not ( = ?auto_188135 ?auto_188138 ) ) ( not ( = ?auto_188136 ?auto_188137 ) ) ( not ( = ?auto_188136 ?auto_188138 ) ) ( not ( = ?auto_188137 ?auto_188138 ) ) ( ON ?auto_188131 ?auto_188139 ) ( not ( = ?auto_188131 ?auto_188139 ) ) ( not ( = ?auto_188132 ?auto_188139 ) ) ( not ( = ?auto_188133 ?auto_188139 ) ) ( not ( = ?auto_188134 ?auto_188139 ) ) ( not ( = ?auto_188135 ?auto_188139 ) ) ( not ( = ?auto_188136 ?auto_188139 ) ) ( not ( = ?auto_188137 ?auto_188139 ) ) ( not ( = ?auto_188138 ?auto_188139 ) ) ( ON ?auto_188132 ?auto_188131 ) ( ON-TABLE ?auto_188139 ) ( ON ?auto_188133 ?auto_188132 ) ( ON ?auto_188134 ?auto_188133 ) ( ON ?auto_188135 ?auto_188134 ) ( ON ?auto_188136 ?auto_188135 ) ( ON ?auto_188137 ?auto_188136 ) ( CLEAR ?auto_188137 ) ( HOLDING ?auto_188138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_188138 )
      ( MAKE-8PILE ?auto_188131 ?auto_188132 ?auto_188133 ?auto_188134 ?auto_188135 ?auto_188136 ?auto_188137 ?auto_188138 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_188140 - BLOCK
      ?auto_188141 - BLOCK
      ?auto_188142 - BLOCK
      ?auto_188143 - BLOCK
      ?auto_188144 - BLOCK
      ?auto_188145 - BLOCK
      ?auto_188146 - BLOCK
      ?auto_188147 - BLOCK
    )
    :vars
    (
      ?auto_188148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_188140 ?auto_188141 ) ) ( not ( = ?auto_188140 ?auto_188142 ) ) ( not ( = ?auto_188140 ?auto_188143 ) ) ( not ( = ?auto_188140 ?auto_188144 ) ) ( not ( = ?auto_188140 ?auto_188145 ) ) ( not ( = ?auto_188140 ?auto_188146 ) ) ( not ( = ?auto_188140 ?auto_188147 ) ) ( not ( = ?auto_188141 ?auto_188142 ) ) ( not ( = ?auto_188141 ?auto_188143 ) ) ( not ( = ?auto_188141 ?auto_188144 ) ) ( not ( = ?auto_188141 ?auto_188145 ) ) ( not ( = ?auto_188141 ?auto_188146 ) ) ( not ( = ?auto_188141 ?auto_188147 ) ) ( not ( = ?auto_188142 ?auto_188143 ) ) ( not ( = ?auto_188142 ?auto_188144 ) ) ( not ( = ?auto_188142 ?auto_188145 ) ) ( not ( = ?auto_188142 ?auto_188146 ) ) ( not ( = ?auto_188142 ?auto_188147 ) ) ( not ( = ?auto_188143 ?auto_188144 ) ) ( not ( = ?auto_188143 ?auto_188145 ) ) ( not ( = ?auto_188143 ?auto_188146 ) ) ( not ( = ?auto_188143 ?auto_188147 ) ) ( not ( = ?auto_188144 ?auto_188145 ) ) ( not ( = ?auto_188144 ?auto_188146 ) ) ( not ( = ?auto_188144 ?auto_188147 ) ) ( not ( = ?auto_188145 ?auto_188146 ) ) ( not ( = ?auto_188145 ?auto_188147 ) ) ( not ( = ?auto_188146 ?auto_188147 ) ) ( ON ?auto_188140 ?auto_188148 ) ( not ( = ?auto_188140 ?auto_188148 ) ) ( not ( = ?auto_188141 ?auto_188148 ) ) ( not ( = ?auto_188142 ?auto_188148 ) ) ( not ( = ?auto_188143 ?auto_188148 ) ) ( not ( = ?auto_188144 ?auto_188148 ) ) ( not ( = ?auto_188145 ?auto_188148 ) ) ( not ( = ?auto_188146 ?auto_188148 ) ) ( not ( = ?auto_188147 ?auto_188148 ) ) ( ON ?auto_188141 ?auto_188140 ) ( ON-TABLE ?auto_188148 ) ( ON ?auto_188142 ?auto_188141 ) ( ON ?auto_188143 ?auto_188142 ) ( ON ?auto_188144 ?auto_188143 ) ( ON ?auto_188145 ?auto_188144 ) ( ON ?auto_188146 ?auto_188145 ) ( ON ?auto_188147 ?auto_188146 ) ( CLEAR ?auto_188147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_188148 ?auto_188140 ?auto_188141 ?auto_188142 ?auto_188143 ?auto_188144 ?auto_188145 ?auto_188146 )
      ( MAKE-8PILE ?auto_188140 ?auto_188141 ?auto_188142 ?auto_188143 ?auto_188144 ?auto_188145 ?auto_188146 ?auto_188147 ) )
  )

)

