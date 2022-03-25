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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_121411 - BLOCK
      ?auto_121412 - BLOCK
      ?auto_121413 - BLOCK
      ?auto_121414 - BLOCK
      ?auto_121415 - BLOCK
      ?auto_121416 - BLOCK
      ?auto_121417 - BLOCK
    )
    :vars
    (
      ?auto_121418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121418 ?auto_121417 ) ( CLEAR ?auto_121418 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121411 ) ( ON ?auto_121412 ?auto_121411 ) ( ON ?auto_121413 ?auto_121412 ) ( ON ?auto_121414 ?auto_121413 ) ( ON ?auto_121415 ?auto_121414 ) ( ON ?auto_121416 ?auto_121415 ) ( ON ?auto_121417 ?auto_121416 ) ( not ( = ?auto_121411 ?auto_121412 ) ) ( not ( = ?auto_121411 ?auto_121413 ) ) ( not ( = ?auto_121411 ?auto_121414 ) ) ( not ( = ?auto_121411 ?auto_121415 ) ) ( not ( = ?auto_121411 ?auto_121416 ) ) ( not ( = ?auto_121411 ?auto_121417 ) ) ( not ( = ?auto_121411 ?auto_121418 ) ) ( not ( = ?auto_121412 ?auto_121413 ) ) ( not ( = ?auto_121412 ?auto_121414 ) ) ( not ( = ?auto_121412 ?auto_121415 ) ) ( not ( = ?auto_121412 ?auto_121416 ) ) ( not ( = ?auto_121412 ?auto_121417 ) ) ( not ( = ?auto_121412 ?auto_121418 ) ) ( not ( = ?auto_121413 ?auto_121414 ) ) ( not ( = ?auto_121413 ?auto_121415 ) ) ( not ( = ?auto_121413 ?auto_121416 ) ) ( not ( = ?auto_121413 ?auto_121417 ) ) ( not ( = ?auto_121413 ?auto_121418 ) ) ( not ( = ?auto_121414 ?auto_121415 ) ) ( not ( = ?auto_121414 ?auto_121416 ) ) ( not ( = ?auto_121414 ?auto_121417 ) ) ( not ( = ?auto_121414 ?auto_121418 ) ) ( not ( = ?auto_121415 ?auto_121416 ) ) ( not ( = ?auto_121415 ?auto_121417 ) ) ( not ( = ?auto_121415 ?auto_121418 ) ) ( not ( = ?auto_121416 ?auto_121417 ) ) ( not ( = ?auto_121416 ?auto_121418 ) ) ( not ( = ?auto_121417 ?auto_121418 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121418 ?auto_121417 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121420 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121420 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_121420 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121421 - BLOCK
    )
    :vars
    (
      ?auto_121422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121421 ?auto_121422 ) ( CLEAR ?auto_121421 ) ( HAND-EMPTY ) ( not ( = ?auto_121421 ?auto_121422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121421 ?auto_121422 )
      ( MAKE-1PILE ?auto_121421 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121429 - BLOCK
      ?auto_121430 - BLOCK
      ?auto_121431 - BLOCK
      ?auto_121432 - BLOCK
      ?auto_121433 - BLOCK
      ?auto_121434 - BLOCK
    )
    :vars
    (
      ?auto_121435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121435 ?auto_121434 ) ( CLEAR ?auto_121435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121429 ) ( ON ?auto_121430 ?auto_121429 ) ( ON ?auto_121431 ?auto_121430 ) ( ON ?auto_121432 ?auto_121431 ) ( ON ?auto_121433 ?auto_121432 ) ( ON ?auto_121434 ?auto_121433 ) ( not ( = ?auto_121429 ?auto_121430 ) ) ( not ( = ?auto_121429 ?auto_121431 ) ) ( not ( = ?auto_121429 ?auto_121432 ) ) ( not ( = ?auto_121429 ?auto_121433 ) ) ( not ( = ?auto_121429 ?auto_121434 ) ) ( not ( = ?auto_121429 ?auto_121435 ) ) ( not ( = ?auto_121430 ?auto_121431 ) ) ( not ( = ?auto_121430 ?auto_121432 ) ) ( not ( = ?auto_121430 ?auto_121433 ) ) ( not ( = ?auto_121430 ?auto_121434 ) ) ( not ( = ?auto_121430 ?auto_121435 ) ) ( not ( = ?auto_121431 ?auto_121432 ) ) ( not ( = ?auto_121431 ?auto_121433 ) ) ( not ( = ?auto_121431 ?auto_121434 ) ) ( not ( = ?auto_121431 ?auto_121435 ) ) ( not ( = ?auto_121432 ?auto_121433 ) ) ( not ( = ?auto_121432 ?auto_121434 ) ) ( not ( = ?auto_121432 ?auto_121435 ) ) ( not ( = ?auto_121433 ?auto_121434 ) ) ( not ( = ?auto_121433 ?auto_121435 ) ) ( not ( = ?auto_121434 ?auto_121435 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121435 ?auto_121434 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121436 - BLOCK
      ?auto_121437 - BLOCK
      ?auto_121438 - BLOCK
      ?auto_121439 - BLOCK
      ?auto_121440 - BLOCK
      ?auto_121441 - BLOCK
    )
    :vars
    (
      ?auto_121442 - BLOCK
      ?auto_121443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121442 ?auto_121441 ) ( CLEAR ?auto_121442 ) ( ON-TABLE ?auto_121436 ) ( ON ?auto_121437 ?auto_121436 ) ( ON ?auto_121438 ?auto_121437 ) ( ON ?auto_121439 ?auto_121438 ) ( ON ?auto_121440 ?auto_121439 ) ( ON ?auto_121441 ?auto_121440 ) ( not ( = ?auto_121436 ?auto_121437 ) ) ( not ( = ?auto_121436 ?auto_121438 ) ) ( not ( = ?auto_121436 ?auto_121439 ) ) ( not ( = ?auto_121436 ?auto_121440 ) ) ( not ( = ?auto_121436 ?auto_121441 ) ) ( not ( = ?auto_121436 ?auto_121442 ) ) ( not ( = ?auto_121437 ?auto_121438 ) ) ( not ( = ?auto_121437 ?auto_121439 ) ) ( not ( = ?auto_121437 ?auto_121440 ) ) ( not ( = ?auto_121437 ?auto_121441 ) ) ( not ( = ?auto_121437 ?auto_121442 ) ) ( not ( = ?auto_121438 ?auto_121439 ) ) ( not ( = ?auto_121438 ?auto_121440 ) ) ( not ( = ?auto_121438 ?auto_121441 ) ) ( not ( = ?auto_121438 ?auto_121442 ) ) ( not ( = ?auto_121439 ?auto_121440 ) ) ( not ( = ?auto_121439 ?auto_121441 ) ) ( not ( = ?auto_121439 ?auto_121442 ) ) ( not ( = ?auto_121440 ?auto_121441 ) ) ( not ( = ?auto_121440 ?auto_121442 ) ) ( not ( = ?auto_121441 ?auto_121442 ) ) ( HOLDING ?auto_121443 ) ( not ( = ?auto_121436 ?auto_121443 ) ) ( not ( = ?auto_121437 ?auto_121443 ) ) ( not ( = ?auto_121438 ?auto_121443 ) ) ( not ( = ?auto_121439 ?auto_121443 ) ) ( not ( = ?auto_121440 ?auto_121443 ) ) ( not ( = ?auto_121441 ?auto_121443 ) ) ( not ( = ?auto_121442 ?auto_121443 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_121443 )
      ( MAKE-6PILE ?auto_121436 ?auto_121437 ?auto_121438 ?auto_121439 ?auto_121440 ?auto_121441 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121444 - BLOCK
      ?auto_121445 - BLOCK
      ?auto_121446 - BLOCK
      ?auto_121447 - BLOCK
      ?auto_121448 - BLOCK
      ?auto_121449 - BLOCK
    )
    :vars
    (
      ?auto_121450 - BLOCK
      ?auto_121451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121450 ?auto_121449 ) ( ON-TABLE ?auto_121444 ) ( ON ?auto_121445 ?auto_121444 ) ( ON ?auto_121446 ?auto_121445 ) ( ON ?auto_121447 ?auto_121446 ) ( ON ?auto_121448 ?auto_121447 ) ( ON ?auto_121449 ?auto_121448 ) ( not ( = ?auto_121444 ?auto_121445 ) ) ( not ( = ?auto_121444 ?auto_121446 ) ) ( not ( = ?auto_121444 ?auto_121447 ) ) ( not ( = ?auto_121444 ?auto_121448 ) ) ( not ( = ?auto_121444 ?auto_121449 ) ) ( not ( = ?auto_121444 ?auto_121450 ) ) ( not ( = ?auto_121445 ?auto_121446 ) ) ( not ( = ?auto_121445 ?auto_121447 ) ) ( not ( = ?auto_121445 ?auto_121448 ) ) ( not ( = ?auto_121445 ?auto_121449 ) ) ( not ( = ?auto_121445 ?auto_121450 ) ) ( not ( = ?auto_121446 ?auto_121447 ) ) ( not ( = ?auto_121446 ?auto_121448 ) ) ( not ( = ?auto_121446 ?auto_121449 ) ) ( not ( = ?auto_121446 ?auto_121450 ) ) ( not ( = ?auto_121447 ?auto_121448 ) ) ( not ( = ?auto_121447 ?auto_121449 ) ) ( not ( = ?auto_121447 ?auto_121450 ) ) ( not ( = ?auto_121448 ?auto_121449 ) ) ( not ( = ?auto_121448 ?auto_121450 ) ) ( not ( = ?auto_121449 ?auto_121450 ) ) ( not ( = ?auto_121444 ?auto_121451 ) ) ( not ( = ?auto_121445 ?auto_121451 ) ) ( not ( = ?auto_121446 ?auto_121451 ) ) ( not ( = ?auto_121447 ?auto_121451 ) ) ( not ( = ?auto_121448 ?auto_121451 ) ) ( not ( = ?auto_121449 ?auto_121451 ) ) ( not ( = ?auto_121450 ?auto_121451 ) ) ( ON ?auto_121451 ?auto_121450 ) ( CLEAR ?auto_121451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121444 ?auto_121445 ?auto_121446 ?auto_121447 ?auto_121448 ?auto_121449 ?auto_121450 )
      ( MAKE-6PILE ?auto_121444 ?auto_121445 ?auto_121446 ?auto_121447 ?auto_121448 ?auto_121449 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121454 - BLOCK
      ?auto_121455 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121455 ) ( CLEAR ?auto_121454 ) ( ON-TABLE ?auto_121454 ) ( not ( = ?auto_121454 ?auto_121455 ) ) )
    :subtasks
    ( ( !STACK ?auto_121455 ?auto_121454 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121456 - BLOCK
      ?auto_121457 - BLOCK
    )
    :vars
    (
      ?auto_121458 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121456 ) ( ON-TABLE ?auto_121456 ) ( not ( = ?auto_121456 ?auto_121457 ) ) ( ON ?auto_121457 ?auto_121458 ) ( CLEAR ?auto_121457 ) ( HAND-EMPTY ) ( not ( = ?auto_121456 ?auto_121458 ) ) ( not ( = ?auto_121457 ?auto_121458 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121457 ?auto_121458 )
      ( MAKE-2PILE ?auto_121456 ?auto_121457 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121459 - BLOCK
      ?auto_121460 - BLOCK
    )
    :vars
    (
      ?auto_121461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121459 ?auto_121460 ) ) ( ON ?auto_121460 ?auto_121461 ) ( CLEAR ?auto_121460 ) ( not ( = ?auto_121459 ?auto_121461 ) ) ( not ( = ?auto_121460 ?auto_121461 ) ) ( HOLDING ?auto_121459 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121459 )
      ( MAKE-2PILE ?auto_121459 ?auto_121460 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121462 - BLOCK
      ?auto_121463 - BLOCK
    )
    :vars
    (
      ?auto_121464 - BLOCK
      ?auto_121467 - BLOCK
      ?auto_121469 - BLOCK
      ?auto_121465 - BLOCK
      ?auto_121468 - BLOCK
      ?auto_121466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121462 ?auto_121463 ) ) ( ON ?auto_121463 ?auto_121464 ) ( not ( = ?auto_121462 ?auto_121464 ) ) ( not ( = ?auto_121463 ?auto_121464 ) ) ( ON ?auto_121462 ?auto_121463 ) ( CLEAR ?auto_121462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121467 ) ( ON ?auto_121469 ?auto_121467 ) ( ON ?auto_121465 ?auto_121469 ) ( ON ?auto_121468 ?auto_121465 ) ( ON ?auto_121466 ?auto_121468 ) ( ON ?auto_121464 ?auto_121466 ) ( not ( = ?auto_121467 ?auto_121469 ) ) ( not ( = ?auto_121467 ?auto_121465 ) ) ( not ( = ?auto_121467 ?auto_121468 ) ) ( not ( = ?auto_121467 ?auto_121466 ) ) ( not ( = ?auto_121467 ?auto_121464 ) ) ( not ( = ?auto_121467 ?auto_121463 ) ) ( not ( = ?auto_121467 ?auto_121462 ) ) ( not ( = ?auto_121469 ?auto_121465 ) ) ( not ( = ?auto_121469 ?auto_121468 ) ) ( not ( = ?auto_121469 ?auto_121466 ) ) ( not ( = ?auto_121469 ?auto_121464 ) ) ( not ( = ?auto_121469 ?auto_121463 ) ) ( not ( = ?auto_121469 ?auto_121462 ) ) ( not ( = ?auto_121465 ?auto_121468 ) ) ( not ( = ?auto_121465 ?auto_121466 ) ) ( not ( = ?auto_121465 ?auto_121464 ) ) ( not ( = ?auto_121465 ?auto_121463 ) ) ( not ( = ?auto_121465 ?auto_121462 ) ) ( not ( = ?auto_121468 ?auto_121466 ) ) ( not ( = ?auto_121468 ?auto_121464 ) ) ( not ( = ?auto_121468 ?auto_121463 ) ) ( not ( = ?auto_121468 ?auto_121462 ) ) ( not ( = ?auto_121466 ?auto_121464 ) ) ( not ( = ?auto_121466 ?auto_121463 ) ) ( not ( = ?auto_121466 ?auto_121462 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121467 ?auto_121469 ?auto_121465 ?auto_121468 ?auto_121466 ?auto_121464 ?auto_121463 )
      ( MAKE-2PILE ?auto_121462 ?auto_121463 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121475 - BLOCK
      ?auto_121476 - BLOCK
      ?auto_121477 - BLOCK
      ?auto_121478 - BLOCK
      ?auto_121479 - BLOCK
    )
    :vars
    (
      ?auto_121480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121480 ?auto_121479 ) ( CLEAR ?auto_121480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121475 ) ( ON ?auto_121476 ?auto_121475 ) ( ON ?auto_121477 ?auto_121476 ) ( ON ?auto_121478 ?auto_121477 ) ( ON ?auto_121479 ?auto_121478 ) ( not ( = ?auto_121475 ?auto_121476 ) ) ( not ( = ?auto_121475 ?auto_121477 ) ) ( not ( = ?auto_121475 ?auto_121478 ) ) ( not ( = ?auto_121475 ?auto_121479 ) ) ( not ( = ?auto_121475 ?auto_121480 ) ) ( not ( = ?auto_121476 ?auto_121477 ) ) ( not ( = ?auto_121476 ?auto_121478 ) ) ( not ( = ?auto_121476 ?auto_121479 ) ) ( not ( = ?auto_121476 ?auto_121480 ) ) ( not ( = ?auto_121477 ?auto_121478 ) ) ( not ( = ?auto_121477 ?auto_121479 ) ) ( not ( = ?auto_121477 ?auto_121480 ) ) ( not ( = ?auto_121478 ?auto_121479 ) ) ( not ( = ?auto_121478 ?auto_121480 ) ) ( not ( = ?auto_121479 ?auto_121480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121480 ?auto_121479 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121481 - BLOCK
      ?auto_121482 - BLOCK
      ?auto_121483 - BLOCK
      ?auto_121484 - BLOCK
      ?auto_121485 - BLOCK
    )
    :vars
    (
      ?auto_121486 - BLOCK
      ?auto_121487 - BLOCK
      ?auto_121488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121486 ?auto_121485 ) ( CLEAR ?auto_121486 ) ( ON-TABLE ?auto_121481 ) ( ON ?auto_121482 ?auto_121481 ) ( ON ?auto_121483 ?auto_121482 ) ( ON ?auto_121484 ?auto_121483 ) ( ON ?auto_121485 ?auto_121484 ) ( not ( = ?auto_121481 ?auto_121482 ) ) ( not ( = ?auto_121481 ?auto_121483 ) ) ( not ( = ?auto_121481 ?auto_121484 ) ) ( not ( = ?auto_121481 ?auto_121485 ) ) ( not ( = ?auto_121481 ?auto_121486 ) ) ( not ( = ?auto_121482 ?auto_121483 ) ) ( not ( = ?auto_121482 ?auto_121484 ) ) ( not ( = ?auto_121482 ?auto_121485 ) ) ( not ( = ?auto_121482 ?auto_121486 ) ) ( not ( = ?auto_121483 ?auto_121484 ) ) ( not ( = ?auto_121483 ?auto_121485 ) ) ( not ( = ?auto_121483 ?auto_121486 ) ) ( not ( = ?auto_121484 ?auto_121485 ) ) ( not ( = ?auto_121484 ?auto_121486 ) ) ( not ( = ?auto_121485 ?auto_121486 ) ) ( HOLDING ?auto_121487 ) ( CLEAR ?auto_121488 ) ( not ( = ?auto_121481 ?auto_121487 ) ) ( not ( = ?auto_121481 ?auto_121488 ) ) ( not ( = ?auto_121482 ?auto_121487 ) ) ( not ( = ?auto_121482 ?auto_121488 ) ) ( not ( = ?auto_121483 ?auto_121487 ) ) ( not ( = ?auto_121483 ?auto_121488 ) ) ( not ( = ?auto_121484 ?auto_121487 ) ) ( not ( = ?auto_121484 ?auto_121488 ) ) ( not ( = ?auto_121485 ?auto_121487 ) ) ( not ( = ?auto_121485 ?auto_121488 ) ) ( not ( = ?auto_121486 ?auto_121487 ) ) ( not ( = ?auto_121486 ?auto_121488 ) ) ( not ( = ?auto_121487 ?auto_121488 ) ) )
    :subtasks
    ( ( !STACK ?auto_121487 ?auto_121488 )
      ( MAKE-5PILE ?auto_121481 ?auto_121482 ?auto_121483 ?auto_121484 ?auto_121485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121489 - BLOCK
      ?auto_121490 - BLOCK
      ?auto_121491 - BLOCK
      ?auto_121492 - BLOCK
      ?auto_121493 - BLOCK
    )
    :vars
    (
      ?auto_121494 - BLOCK
      ?auto_121495 - BLOCK
      ?auto_121496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121494 ?auto_121493 ) ( ON-TABLE ?auto_121489 ) ( ON ?auto_121490 ?auto_121489 ) ( ON ?auto_121491 ?auto_121490 ) ( ON ?auto_121492 ?auto_121491 ) ( ON ?auto_121493 ?auto_121492 ) ( not ( = ?auto_121489 ?auto_121490 ) ) ( not ( = ?auto_121489 ?auto_121491 ) ) ( not ( = ?auto_121489 ?auto_121492 ) ) ( not ( = ?auto_121489 ?auto_121493 ) ) ( not ( = ?auto_121489 ?auto_121494 ) ) ( not ( = ?auto_121490 ?auto_121491 ) ) ( not ( = ?auto_121490 ?auto_121492 ) ) ( not ( = ?auto_121490 ?auto_121493 ) ) ( not ( = ?auto_121490 ?auto_121494 ) ) ( not ( = ?auto_121491 ?auto_121492 ) ) ( not ( = ?auto_121491 ?auto_121493 ) ) ( not ( = ?auto_121491 ?auto_121494 ) ) ( not ( = ?auto_121492 ?auto_121493 ) ) ( not ( = ?auto_121492 ?auto_121494 ) ) ( not ( = ?auto_121493 ?auto_121494 ) ) ( CLEAR ?auto_121495 ) ( not ( = ?auto_121489 ?auto_121496 ) ) ( not ( = ?auto_121489 ?auto_121495 ) ) ( not ( = ?auto_121490 ?auto_121496 ) ) ( not ( = ?auto_121490 ?auto_121495 ) ) ( not ( = ?auto_121491 ?auto_121496 ) ) ( not ( = ?auto_121491 ?auto_121495 ) ) ( not ( = ?auto_121492 ?auto_121496 ) ) ( not ( = ?auto_121492 ?auto_121495 ) ) ( not ( = ?auto_121493 ?auto_121496 ) ) ( not ( = ?auto_121493 ?auto_121495 ) ) ( not ( = ?auto_121494 ?auto_121496 ) ) ( not ( = ?auto_121494 ?auto_121495 ) ) ( not ( = ?auto_121496 ?auto_121495 ) ) ( ON ?auto_121496 ?auto_121494 ) ( CLEAR ?auto_121496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121489 ?auto_121490 ?auto_121491 ?auto_121492 ?auto_121493 ?auto_121494 )
      ( MAKE-5PILE ?auto_121489 ?auto_121490 ?auto_121491 ?auto_121492 ?auto_121493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121497 - BLOCK
      ?auto_121498 - BLOCK
      ?auto_121499 - BLOCK
      ?auto_121500 - BLOCK
      ?auto_121501 - BLOCK
    )
    :vars
    (
      ?auto_121503 - BLOCK
      ?auto_121504 - BLOCK
      ?auto_121502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121503 ?auto_121501 ) ( ON-TABLE ?auto_121497 ) ( ON ?auto_121498 ?auto_121497 ) ( ON ?auto_121499 ?auto_121498 ) ( ON ?auto_121500 ?auto_121499 ) ( ON ?auto_121501 ?auto_121500 ) ( not ( = ?auto_121497 ?auto_121498 ) ) ( not ( = ?auto_121497 ?auto_121499 ) ) ( not ( = ?auto_121497 ?auto_121500 ) ) ( not ( = ?auto_121497 ?auto_121501 ) ) ( not ( = ?auto_121497 ?auto_121503 ) ) ( not ( = ?auto_121498 ?auto_121499 ) ) ( not ( = ?auto_121498 ?auto_121500 ) ) ( not ( = ?auto_121498 ?auto_121501 ) ) ( not ( = ?auto_121498 ?auto_121503 ) ) ( not ( = ?auto_121499 ?auto_121500 ) ) ( not ( = ?auto_121499 ?auto_121501 ) ) ( not ( = ?auto_121499 ?auto_121503 ) ) ( not ( = ?auto_121500 ?auto_121501 ) ) ( not ( = ?auto_121500 ?auto_121503 ) ) ( not ( = ?auto_121501 ?auto_121503 ) ) ( not ( = ?auto_121497 ?auto_121504 ) ) ( not ( = ?auto_121497 ?auto_121502 ) ) ( not ( = ?auto_121498 ?auto_121504 ) ) ( not ( = ?auto_121498 ?auto_121502 ) ) ( not ( = ?auto_121499 ?auto_121504 ) ) ( not ( = ?auto_121499 ?auto_121502 ) ) ( not ( = ?auto_121500 ?auto_121504 ) ) ( not ( = ?auto_121500 ?auto_121502 ) ) ( not ( = ?auto_121501 ?auto_121504 ) ) ( not ( = ?auto_121501 ?auto_121502 ) ) ( not ( = ?auto_121503 ?auto_121504 ) ) ( not ( = ?auto_121503 ?auto_121502 ) ) ( not ( = ?auto_121504 ?auto_121502 ) ) ( ON ?auto_121504 ?auto_121503 ) ( CLEAR ?auto_121504 ) ( HOLDING ?auto_121502 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121502 )
      ( MAKE-5PILE ?auto_121497 ?auto_121498 ?auto_121499 ?auto_121500 ?auto_121501 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121505 - BLOCK
      ?auto_121506 - BLOCK
      ?auto_121507 - BLOCK
      ?auto_121508 - BLOCK
      ?auto_121509 - BLOCK
    )
    :vars
    (
      ?auto_121511 - BLOCK
      ?auto_121510 - BLOCK
      ?auto_121512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121511 ?auto_121509 ) ( ON-TABLE ?auto_121505 ) ( ON ?auto_121506 ?auto_121505 ) ( ON ?auto_121507 ?auto_121506 ) ( ON ?auto_121508 ?auto_121507 ) ( ON ?auto_121509 ?auto_121508 ) ( not ( = ?auto_121505 ?auto_121506 ) ) ( not ( = ?auto_121505 ?auto_121507 ) ) ( not ( = ?auto_121505 ?auto_121508 ) ) ( not ( = ?auto_121505 ?auto_121509 ) ) ( not ( = ?auto_121505 ?auto_121511 ) ) ( not ( = ?auto_121506 ?auto_121507 ) ) ( not ( = ?auto_121506 ?auto_121508 ) ) ( not ( = ?auto_121506 ?auto_121509 ) ) ( not ( = ?auto_121506 ?auto_121511 ) ) ( not ( = ?auto_121507 ?auto_121508 ) ) ( not ( = ?auto_121507 ?auto_121509 ) ) ( not ( = ?auto_121507 ?auto_121511 ) ) ( not ( = ?auto_121508 ?auto_121509 ) ) ( not ( = ?auto_121508 ?auto_121511 ) ) ( not ( = ?auto_121509 ?auto_121511 ) ) ( not ( = ?auto_121505 ?auto_121510 ) ) ( not ( = ?auto_121505 ?auto_121512 ) ) ( not ( = ?auto_121506 ?auto_121510 ) ) ( not ( = ?auto_121506 ?auto_121512 ) ) ( not ( = ?auto_121507 ?auto_121510 ) ) ( not ( = ?auto_121507 ?auto_121512 ) ) ( not ( = ?auto_121508 ?auto_121510 ) ) ( not ( = ?auto_121508 ?auto_121512 ) ) ( not ( = ?auto_121509 ?auto_121510 ) ) ( not ( = ?auto_121509 ?auto_121512 ) ) ( not ( = ?auto_121511 ?auto_121510 ) ) ( not ( = ?auto_121511 ?auto_121512 ) ) ( not ( = ?auto_121510 ?auto_121512 ) ) ( ON ?auto_121510 ?auto_121511 ) ( ON ?auto_121512 ?auto_121510 ) ( CLEAR ?auto_121512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121505 ?auto_121506 ?auto_121507 ?auto_121508 ?auto_121509 ?auto_121511 ?auto_121510 )
      ( MAKE-5PILE ?auto_121505 ?auto_121506 ?auto_121507 ?auto_121508 ?auto_121509 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121516 - BLOCK
      ?auto_121517 - BLOCK
      ?auto_121518 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121518 ) ( CLEAR ?auto_121517 ) ( ON-TABLE ?auto_121516 ) ( ON ?auto_121517 ?auto_121516 ) ( not ( = ?auto_121516 ?auto_121517 ) ) ( not ( = ?auto_121516 ?auto_121518 ) ) ( not ( = ?auto_121517 ?auto_121518 ) ) )
    :subtasks
    ( ( !STACK ?auto_121518 ?auto_121517 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121519 - BLOCK
      ?auto_121520 - BLOCK
      ?auto_121521 - BLOCK
    )
    :vars
    (
      ?auto_121522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121520 ) ( ON-TABLE ?auto_121519 ) ( ON ?auto_121520 ?auto_121519 ) ( not ( = ?auto_121519 ?auto_121520 ) ) ( not ( = ?auto_121519 ?auto_121521 ) ) ( not ( = ?auto_121520 ?auto_121521 ) ) ( ON ?auto_121521 ?auto_121522 ) ( CLEAR ?auto_121521 ) ( HAND-EMPTY ) ( not ( = ?auto_121519 ?auto_121522 ) ) ( not ( = ?auto_121520 ?auto_121522 ) ) ( not ( = ?auto_121521 ?auto_121522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121521 ?auto_121522 )
      ( MAKE-3PILE ?auto_121519 ?auto_121520 ?auto_121521 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121523 - BLOCK
      ?auto_121524 - BLOCK
      ?auto_121525 - BLOCK
    )
    :vars
    (
      ?auto_121526 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121523 ) ( not ( = ?auto_121523 ?auto_121524 ) ) ( not ( = ?auto_121523 ?auto_121525 ) ) ( not ( = ?auto_121524 ?auto_121525 ) ) ( ON ?auto_121525 ?auto_121526 ) ( CLEAR ?auto_121525 ) ( not ( = ?auto_121523 ?auto_121526 ) ) ( not ( = ?auto_121524 ?auto_121526 ) ) ( not ( = ?auto_121525 ?auto_121526 ) ) ( HOLDING ?auto_121524 ) ( CLEAR ?auto_121523 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121523 ?auto_121524 )
      ( MAKE-3PILE ?auto_121523 ?auto_121524 ?auto_121525 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121527 - BLOCK
      ?auto_121528 - BLOCK
      ?auto_121529 - BLOCK
    )
    :vars
    (
      ?auto_121530 - BLOCK
      ?auto_121533 - BLOCK
      ?auto_121534 - BLOCK
      ?auto_121531 - BLOCK
      ?auto_121532 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121527 ) ( not ( = ?auto_121527 ?auto_121528 ) ) ( not ( = ?auto_121527 ?auto_121529 ) ) ( not ( = ?auto_121528 ?auto_121529 ) ) ( ON ?auto_121529 ?auto_121530 ) ( not ( = ?auto_121527 ?auto_121530 ) ) ( not ( = ?auto_121528 ?auto_121530 ) ) ( not ( = ?auto_121529 ?auto_121530 ) ) ( CLEAR ?auto_121527 ) ( ON ?auto_121528 ?auto_121529 ) ( CLEAR ?auto_121528 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121533 ) ( ON ?auto_121534 ?auto_121533 ) ( ON ?auto_121531 ?auto_121534 ) ( ON ?auto_121532 ?auto_121531 ) ( ON ?auto_121530 ?auto_121532 ) ( not ( = ?auto_121533 ?auto_121534 ) ) ( not ( = ?auto_121533 ?auto_121531 ) ) ( not ( = ?auto_121533 ?auto_121532 ) ) ( not ( = ?auto_121533 ?auto_121530 ) ) ( not ( = ?auto_121533 ?auto_121529 ) ) ( not ( = ?auto_121533 ?auto_121528 ) ) ( not ( = ?auto_121534 ?auto_121531 ) ) ( not ( = ?auto_121534 ?auto_121532 ) ) ( not ( = ?auto_121534 ?auto_121530 ) ) ( not ( = ?auto_121534 ?auto_121529 ) ) ( not ( = ?auto_121534 ?auto_121528 ) ) ( not ( = ?auto_121531 ?auto_121532 ) ) ( not ( = ?auto_121531 ?auto_121530 ) ) ( not ( = ?auto_121531 ?auto_121529 ) ) ( not ( = ?auto_121531 ?auto_121528 ) ) ( not ( = ?auto_121532 ?auto_121530 ) ) ( not ( = ?auto_121532 ?auto_121529 ) ) ( not ( = ?auto_121532 ?auto_121528 ) ) ( not ( = ?auto_121527 ?auto_121533 ) ) ( not ( = ?auto_121527 ?auto_121534 ) ) ( not ( = ?auto_121527 ?auto_121531 ) ) ( not ( = ?auto_121527 ?auto_121532 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121533 ?auto_121534 ?auto_121531 ?auto_121532 ?auto_121530 ?auto_121529 )
      ( MAKE-3PILE ?auto_121527 ?auto_121528 ?auto_121529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121535 - BLOCK
      ?auto_121536 - BLOCK
      ?auto_121537 - BLOCK
    )
    :vars
    (
      ?auto_121541 - BLOCK
      ?auto_121540 - BLOCK
      ?auto_121539 - BLOCK
      ?auto_121538 - BLOCK
      ?auto_121542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121535 ?auto_121536 ) ) ( not ( = ?auto_121535 ?auto_121537 ) ) ( not ( = ?auto_121536 ?auto_121537 ) ) ( ON ?auto_121537 ?auto_121541 ) ( not ( = ?auto_121535 ?auto_121541 ) ) ( not ( = ?auto_121536 ?auto_121541 ) ) ( not ( = ?auto_121537 ?auto_121541 ) ) ( ON ?auto_121536 ?auto_121537 ) ( CLEAR ?auto_121536 ) ( ON-TABLE ?auto_121540 ) ( ON ?auto_121539 ?auto_121540 ) ( ON ?auto_121538 ?auto_121539 ) ( ON ?auto_121542 ?auto_121538 ) ( ON ?auto_121541 ?auto_121542 ) ( not ( = ?auto_121540 ?auto_121539 ) ) ( not ( = ?auto_121540 ?auto_121538 ) ) ( not ( = ?auto_121540 ?auto_121542 ) ) ( not ( = ?auto_121540 ?auto_121541 ) ) ( not ( = ?auto_121540 ?auto_121537 ) ) ( not ( = ?auto_121540 ?auto_121536 ) ) ( not ( = ?auto_121539 ?auto_121538 ) ) ( not ( = ?auto_121539 ?auto_121542 ) ) ( not ( = ?auto_121539 ?auto_121541 ) ) ( not ( = ?auto_121539 ?auto_121537 ) ) ( not ( = ?auto_121539 ?auto_121536 ) ) ( not ( = ?auto_121538 ?auto_121542 ) ) ( not ( = ?auto_121538 ?auto_121541 ) ) ( not ( = ?auto_121538 ?auto_121537 ) ) ( not ( = ?auto_121538 ?auto_121536 ) ) ( not ( = ?auto_121542 ?auto_121541 ) ) ( not ( = ?auto_121542 ?auto_121537 ) ) ( not ( = ?auto_121542 ?auto_121536 ) ) ( not ( = ?auto_121535 ?auto_121540 ) ) ( not ( = ?auto_121535 ?auto_121539 ) ) ( not ( = ?auto_121535 ?auto_121538 ) ) ( not ( = ?auto_121535 ?auto_121542 ) ) ( HOLDING ?auto_121535 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121535 )
      ( MAKE-3PILE ?auto_121535 ?auto_121536 ?auto_121537 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121543 - BLOCK
      ?auto_121544 - BLOCK
      ?auto_121545 - BLOCK
    )
    :vars
    (
      ?auto_121546 - BLOCK
      ?auto_121550 - BLOCK
      ?auto_121548 - BLOCK
      ?auto_121547 - BLOCK
      ?auto_121549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121543 ?auto_121544 ) ) ( not ( = ?auto_121543 ?auto_121545 ) ) ( not ( = ?auto_121544 ?auto_121545 ) ) ( ON ?auto_121545 ?auto_121546 ) ( not ( = ?auto_121543 ?auto_121546 ) ) ( not ( = ?auto_121544 ?auto_121546 ) ) ( not ( = ?auto_121545 ?auto_121546 ) ) ( ON ?auto_121544 ?auto_121545 ) ( ON-TABLE ?auto_121550 ) ( ON ?auto_121548 ?auto_121550 ) ( ON ?auto_121547 ?auto_121548 ) ( ON ?auto_121549 ?auto_121547 ) ( ON ?auto_121546 ?auto_121549 ) ( not ( = ?auto_121550 ?auto_121548 ) ) ( not ( = ?auto_121550 ?auto_121547 ) ) ( not ( = ?auto_121550 ?auto_121549 ) ) ( not ( = ?auto_121550 ?auto_121546 ) ) ( not ( = ?auto_121550 ?auto_121545 ) ) ( not ( = ?auto_121550 ?auto_121544 ) ) ( not ( = ?auto_121548 ?auto_121547 ) ) ( not ( = ?auto_121548 ?auto_121549 ) ) ( not ( = ?auto_121548 ?auto_121546 ) ) ( not ( = ?auto_121548 ?auto_121545 ) ) ( not ( = ?auto_121548 ?auto_121544 ) ) ( not ( = ?auto_121547 ?auto_121549 ) ) ( not ( = ?auto_121547 ?auto_121546 ) ) ( not ( = ?auto_121547 ?auto_121545 ) ) ( not ( = ?auto_121547 ?auto_121544 ) ) ( not ( = ?auto_121549 ?auto_121546 ) ) ( not ( = ?auto_121549 ?auto_121545 ) ) ( not ( = ?auto_121549 ?auto_121544 ) ) ( not ( = ?auto_121543 ?auto_121550 ) ) ( not ( = ?auto_121543 ?auto_121548 ) ) ( not ( = ?auto_121543 ?auto_121547 ) ) ( not ( = ?auto_121543 ?auto_121549 ) ) ( ON ?auto_121543 ?auto_121544 ) ( CLEAR ?auto_121543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121550 ?auto_121548 ?auto_121547 ?auto_121549 ?auto_121546 ?auto_121545 ?auto_121544 )
      ( MAKE-3PILE ?auto_121543 ?auto_121544 ?auto_121545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121555 - BLOCK
      ?auto_121556 - BLOCK
      ?auto_121557 - BLOCK
      ?auto_121558 - BLOCK
    )
    :vars
    (
      ?auto_121559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121559 ?auto_121558 ) ( CLEAR ?auto_121559 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121555 ) ( ON ?auto_121556 ?auto_121555 ) ( ON ?auto_121557 ?auto_121556 ) ( ON ?auto_121558 ?auto_121557 ) ( not ( = ?auto_121555 ?auto_121556 ) ) ( not ( = ?auto_121555 ?auto_121557 ) ) ( not ( = ?auto_121555 ?auto_121558 ) ) ( not ( = ?auto_121555 ?auto_121559 ) ) ( not ( = ?auto_121556 ?auto_121557 ) ) ( not ( = ?auto_121556 ?auto_121558 ) ) ( not ( = ?auto_121556 ?auto_121559 ) ) ( not ( = ?auto_121557 ?auto_121558 ) ) ( not ( = ?auto_121557 ?auto_121559 ) ) ( not ( = ?auto_121558 ?auto_121559 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121559 ?auto_121558 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121560 - BLOCK
      ?auto_121561 - BLOCK
      ?auto_121562 - BLOCK
      ?auto_121563 - BLOCK
    )
    :vars
    (
      ?auto_121564 - BLOCK
      ?auto_121565 - BLOCK
      ?auto_121566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121564 ?auto_121563 ) ( CLEAR ?auto_121564 ) ( ON-TABLE ?auto_121560 ) ( ON ?auto_121561 ?auto_121560 ) ( ON ?auto_121562 ?auto_121561 ) ( ON ?auto_121563 ?auto_121562 ) ( not ( = ?auto_121560 ?auto_121561 ) ) ( not ( = ?auto_121560 ?auto_121562 ) ) ( not ( = ?auto_121560 ?auto_121563 ) ) ( not ( = ?auto_121560 ?auto_121564 ) ) ( not ( = ?auto_121561 ?auto_121562 ) ) ( not ( = ?auto_121561 ?auto_121563 ) ) ( not ( = ?auto_121561 ?auto_121564 ) ) ( not ( = ?auto_121562 ?auto_121563 ) ) ( not ( = ?auto_121562 ?auto_121564 ) ) ( not ( = ?auto_121563 ?auto_121564 ) ) ( HOLDING ?auto_121565 ) ( CLEAR ?auto_121566 ) ( not ( = ?auto_121560 ?auto_121565 ) ) ( not ( = ?auto_121560 ?auto_121566 ) ) ( not ( = ?auto_121561 ?auto_121565 ) ) ( not ( = ?auto_121561 ?auto_121566 ) ) ( not ( = ?auto_121562 ?auto_121565 ) ) ( not ( = ?auto_121562 ?auto_121566 ) ) ( not ( = ?auto_121563 ?auto_121565 ) ) ( not ( = ?auto_121563 ?auto_121566 ) ) ( not ( = ?auto_121564 ?auto_121565 ) ) ( not ( = ?auto_121564 ?auto_121566 ) ) ( not ( = ?auto_121565 ?auto_121566 ) ) )
    :subtasks
    ( ( !STACK ?auto_121565 ?auto_121566 )
      ( MAKE-4PILE ?auto_121560 ?auto_121561 ?auto_121562 ?auto_121563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121567 - BLOCK
      ?auto_121568 - BLOCK
      ?auto_121569 - BLOCK
      ?auto_121570 - BLOCK
    )
    :vars
    (
      ?auto_121572 - BLOCK
      ?auto_121573 - BLOCK
      ?auto_121571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121572 ?auto_121570 ) ( ON-TABLE ?auto_121567 ) ( ON ?auto_121568 ?auto_121567 ) ( ON ?auto_121569 ?auto_121568 ) ( ON ?auto_121570 ?auto_121569 ) ( not ( = ?auto_121567 ?auto_121568 ) ) ( not ( = ?auto_121567 ?auto_121569 ) ) ( not ( = ?auto_121567 ?auto_121570 ) ) ( not ( = ?auto_121567 ?auto_121572 ) ) ( not ( = ?auto_121568 ?auto_121569 ) ) ( not ( = ?auto_121568 ?auto_121570 ) ) ( not ( = ?auto_121568 ?auto_121572 ) ) ( not ( = ?auto_121569 ?auto_121570 ) ) ( not ( = ?auto_121569 ?auto_121572 ) ) ( not ( = ?auto_121570 ?auto_121572 ) ) ( CLEAR ?auto_121573 ) ( not ( = ?auto_121567 ?auto_121571 ) ) ( not ( = ?auto_121567 ?auto_121573 ) ) ( not ( = ?auto_121568 ?auto_121571 ) ) ( not ( = ?auto_121568 ?auto_121573 ) ) ( not ( = ?auto_121569 ?auto_121571 ) ) ( not ( = ?auto_121569 ?auto_121573 ) ) ( not ( = ?auto_121570 ?auto_121571 ) ) ( not ( = ?auto_121570 ?auto_121573 ) ) ( not ( = ?auto_121572 ?auto_121571 ) ) ( not ( = ?auto_121572 ?auto_121573 ) ) ( not ( = ?auto_121571 ?auto_121573 ) ) ( ON ?auto_121571 ?auto_121572 ) ( CLEAR ?auto_121571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121567 ?auto_121568 ?auto_121569 ?auto_121570 ?auto_121572 )
      ( MAKE-4PILE ?auto_121567 ?auto_121568 ?auto_121569 ?auto_121570 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121574 - BLOCK
      ?auto_121575 - BLOCK
      ?auto_121576 - BLOCK
      ?auto_121577 - BLOCK
    )
    :vars
    (
      ?auto_121580 - BLOCK
      ?auto_121579 - BLOCK
      ?auto_121578 - BLOCK
      ?auto_121581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121580 ?auto_121577 ) ( ON-TABLE ?auto_121574 ) ( ON ?auto_121575 ?auto_121574 ) ( ON ?auto_121576 ?auto_121575 ) ( ON ?auto_121577 ?auto_121576 ) ( not ( = ?auto_121574 ?auto_121575 ) ) ( not ( = ?auto_121574 ?auto_121576 ) ) ( not ( = ?auto_121574 ?auto_121577 ) ) ( not ( = ?auto_121574 ?auto_121580 ) ) ( not ( = ?auto_121575 ?auto_121576 ) ) ( not ( = ?auto_121575 ?auto_121577 ) ) ( not ( = ?auto_121575 ?auto_121580 ) ) ( not ( = ?auto_121576 ?auto_121577 ) ) ( not ( = ?auto_121576 ?auto_121580 ) ) ( not ( = ?auto_121577 ?auto_121580 ) ) ( not ( = ?auto_121574 ?auto_121579 ) ) ( not ( = ?auto_121574 ?auto_121578 ) ) ( not ( = ?auto_121575 ?auto_121579 ) ) ( not ( = ?auto_121575 ?auto_121578 ) ) ( not ( = ?auto_121576 ?auto_121579 ) ) ( not ( = ?auto_121576 ?auto_121578 ) ) ( not ( = ?auto_121577 ?auto_121579 ) ) ( not ( = ?auto_121577 ?auto_121578 ) ) ( not ( = ?auto_121580 ?auto_121579 ) ) ( not ( = ?auto_121580 ?auto_121578 ) ) ( not ( = ?auto_121579 ?auto_121578 ) ) ( ON ?auto_121579 ?auto_121580 ) ( CLEAR ?auto_121579 ) ( HOLDING ?auto_121578 ) ( CLEAR ?auto_121581 ) ( ON-TABLE ?auto_121581 ) ( not ( = ?auto_121581 ?auto_121578 ) ) ( not ( = ?auto_121574 ?auto_121581 ) ) ( not ( = ?auto_121575 ?auto_121581 ) ) ( not ( = ?auto_121576 ?auto_121581 ) ) ( not ( = ?auto_121577 ?auto_121581 ) ) ( not ( = ?auto_121580 ?auto_121581 ) ) ( not ( = ?auto_121579 ?auto_121581 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121581 ?auto_121578 )
      ( MAKE-4PILE ?auto_121574 ?auto_121575 ?auto_121576 ?auto_121577 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121582 - BLOCK
      ?auto_121583 - BLOCK
      ?auto_121584 - BLOCK
      ?auto_121585 - BLOCK
    )
    :vars
    (
      ?auto_121587 - BLOCK
      ?auto_121589 - BLOCK
      ?auto_121586 - BLOCK
      ?auto_121588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121587 ?auto_121585 ) ( ON-TABLE ?auto_121582 ) ( ON ?auto_121583 ?auto_121582 ) ( ON ?auto_121584 ?auto_121583 ) ( ON ?auto_121585 ?auto_121584 ) ( not ( = ?auto_121582 ?auto_121583 ) ) ( not ( = ?auto_121582 ?auto_121584 ) ) ( not ( = ?auto_121582 ?auto_121585 ) ) ( not ( = ?auto_121582 ?auto_121587 ) ) ( not ( = ?auto_121583 ?auto_121584 ) ) ( not ( = ?auto_121583 ?auto_121585 ) ) ( not ( = ?auto_121583 ?auto_121587 ) ) ( not ( = ?auto_121584 ?auto_121585 ) ) ( not ( = ?auto_121584 ?auto_121587 ) ) ( not ( = ?auto_121585 ?auto_121587 ) ) ( not ( = ?auto_121582 ?auto_121589 ) ) ( not ( = ?auto_121582 ?auto_121586 ) ) ( not ( = ?auto_121583 ?auto_121589 ) ) ( not ( = ?auto_121583 ?auto_121586 ) ) ( not ( = ?auto_121584 ?auto_121589 ) ) ( not ( = ?auto_121584 ?auto_121586 ) ) ( not ( = ?auto_121585 ?auto_121589 ) ) ( not ( = ?auto_121585 ?auto_121586 ) ) ( not ( = ?auto_121587 ?auto_121589 ) ) ( not ( = ?auto_121587 ?auto_121586 ) ) ( not ( = ?auto_121589 ?auto_121586 ) ) ( ON ?auto_121589 ?auto_121587 ) ( CLEAR ?auto_121588 ) ( ON-TABLE ?auto_121588 ) ( not ( = ?auto_121588 ?auto_121586 ) ) ( not ( = ?auto_121582 ?auto_121588 ) ) ( not ( = ?auto_121583 ?auto_121588 ) ) ( not ( = ?auto_121584 ?auto_121588 ) ) ( not ( = ?auto_121585 ?auto_121588 ) ) ( not ( = ?auto_121587 ?auto_121588 ) ) ( not ( = ?auto_121589 ?auto_121588 ) ) ( ON ?auto_121586 ?auto_121589 ) ( CLEAR ?auto_121586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121582 ?auto_121583 ?auto_121584 ?auto_121585 ?auto_121587 ?auto_121589 )
      ( MAKE-4PILE ?auto_121582 ?auto_121583 ?auto_121584 ?auto_121585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121590 - BLOCK
      ?auto_121591 - BLOCK
      ?auto_121592 - BLOCK
      ?auto_121593 - BLOCK
    )
    :vars
    (
      ?auto_121597 - BLOCK
      ?auto_121594 - BLOCK
      ?auto_121595 - BLOCK
      ?auto_121596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121597 ?auto_121593 ) ( ON-TABLE ?auto_121590 ) ( ON ?auto_121591 ?auto_121590 ) ( ON ?auto_121592 ?auto_121591 ) ( ON ?auto_121593 ?auto_121592 ) ( not ( = ?auto_121590 ?auto_121591 ) ) ( not ( = ?auto_121590 ?auto_121592 ) ) ( not ( = ?auto_121590 ?auto_121593 ) ) ( not ( = ?auto_121590 ?auto_121597 ) ) ( not ( = ?auto_121591 ?auto_121592 ) ) ( not ( = ?auto_121591 ?auto_121593 ) ) ( not ( = ?auto_121591 ?auto_121597 ) ) ( not ( = ?auto_121592 ?auto_121593 ) ) ( not ( = ?auto_121592 ?auto_121597 ) ) ( not ( = ?auto_121593 ?auto_121597 ) ) ( not ( = ?auto_121590 ?auto_121594 ) ) ( not ( = ?auto_121590 ?auto_121595 ) ) ( not ( = ?auto_121591 ?auto_121594 ) ) ( not ( = ?auto_121591 ?auto_121595 ) ) ( not ( = ?auto_121592 ?auto_121594 ) ) ( not ( = ?auto_121592 ?auto_121595 ) ) ( not ( = ?auto_121593 ?auto_121594 ) ) ( not ( = ?auto_121593 ?auto_121595 ) ) ( not ( = ?auto_121597 ?auto_121594 ) ) ( not ( = ?auto_121597 ?auto_121595 ) ) ( not ( = ?auto_121594 ?auto_121595 ) ) ( ON ?auto_121594 ?auto_121597 ) ( not ( = ?auto_121596 ?auto_121595 ) ) ( not ( = ?auto_121590 ?auto_121596 ) ) ( not ( = ?auto_121591 ?auto_121596 ) ) ( not ( = ?auto_121592 ?auto_121596 ) ) ( not ( = ?auto_121593 ?auto_121596 ) ) ( not ( = ?auto_121597 ?auto_121596 ) ) ( not ( = ?auto_121594 ?auto_121596 ) ) ( ON ?auto_121595 ?auto_121594 ) ( CLEAR ?auto_121595 ) ( HOLDING ?auto_121596 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121596 )
      ( MAKE-4PILE ?auto_121590 ?auto_121591 ?auto_121592 ?auto_121593 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121598 - BLOCK
      ?auto_121599 - BLOCK
      ?auto_121600 - BLOCK
      ?auto_121601 - BLOCK
    )
    :vars
    (
      ?auto_121604 - BLOCK
      ?auto_121602 - BLOCK
      ?auto_121603 - BLOCK
      ?auto_121605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121604 ?auto_121601 ) ( ON-TABLE ?auto_121598 ) ( ON ?auto_121599 ?auto_121598 ) ( ON ?auto_121600 ?auto_121599 ) ( ON ?auto_121601 ?auto_121600 ) ( not ( = ?auto_121598 ?auto_121599 ) ) ( not ( = ?auto_121598 ?auto_121600 ) ) ( not ( = ?auto_121598 ?auto_121601 ) ) ( not ( = ?auto_121598 ?auto_121604 ) ) ( not ( = ?auto_121599 ?auto_121600 ) ) ( not ( = ?auto_121599 ?auto_121601 ) ) ( not ( = ?auto_121599 ?auto_121604 ) ) ( not ( = ?auto_121600 ?auto_121601 ) ) ( not ( = ?auto_121600 ?auto_121604 ) ) ( not ( = ?auto_121601 ?auto_121604 ) ) ( not ( = ?auto_121598 ?auto_121602 ) ) ( not ( = ?auto_121598 ?auto_121603 ) ) ( not ( = ?auto_121599 ?auto_121602 ) ) ( not ( = ?auto_121599 ?auto_121603 ) ) ( not ( = ?auto_121600 ?auto_121602 ) ) ( not ( = ?auto_121600 ?auto_121603 ) ) ( not ( = ?auto_121601 ?auto_121602 ) ) ( not ( = ?auto_121601 ?auto_121603 ) ) ( not ( = ?auto_121604 ?auto_121602 ) ) ( not ( = ?auto_121604 ?auto_121603 ) ) ( not ( = ?auto_121602 ?auto_121603 ) ) ( ON ?auto_121602 ?auto_121604 ) ( not ( = ?auto_121605 ?auto_121603 ) ) ( not ( = ?auto_121598 ?auto_121605 ) ) ( not ( = ?auto_121599 ?auto_121605 ) ) ( not ( = ?auto_121600 ?auto_121605 ) ) ( not ( = ?auto_121601 ?auto_121605 ) ) ( not ( = ?auto_121604 ?auto_121605 ) ) ( not ( = ?auto_121602 ?auto_121605 ) ) ( ON ?auto_121603 ?auto_121602 ) ( ON ?auto_121605 ?auto_121603 ) ( CLEAR ?auto_121605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121598 ?auto_121599 ?auto_121600 ?auto_121601 ?auto_121604 ?auto_121602 ?auto_121603 )
      ( MAKE-4PILE ?auto_121598 ?auto_121599 ?auto_121600 ?auto_121601 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121610 - BLOCK
      ?auto_121611 - BLOCK
      ?auto_121612 - BLOCK
      ?auto_121613 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121613 ) ( CLEAR ?auto_121612 ) ( ON-TABLE ?auto_121610 ) ( ON ?auto_121611 ?auto_121610 ) ( ON ?auto_121612 ?auto_121611 ) ( not ( = ?auto_121610 ?auto_121611 ) ) ( not ( = ?auto_121610 ?auto_121612 ) ) ( not ( = ?auto_121610 ?auto_121613 ) ) ( not ( = ?auto_121611 ?auto_121612 ) ) ( not ( = ?auto_121611 ?auto_121613 ) ) ( not ( = ?auto_121612 ?auto_121613 ) ) )
    :subtasks
    ( ( !STACK ?auto_121613 ?auto_121612 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121614 - BLOCK
      ?auto_121615 - BLOCK
      ?auto_121616 - BLOCK
      ?auto_121617 - BLOCK
    )
    :vars
    (
      ?auto_121618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121616 ) ( ON-TABLE ?auto_121614 ) ( ON ?auto_121615 ?auto_121614 ) ( ON ?auto_121616 ?auto_121615 ) ( not ( = ?auto_121614 ?auto_121615 ) ) ( not ( = ?auto_121614 ?auto_121616 ) ) ( not ( = ?auto_121614 ?auto_121617 ) ) ( not ( = ?auto_121615 ?auto_121616 ) ) ( not ( = ?auto_121615 ?auto_121617 ) ) ( not ( = ?auto_121616 ?auto_121617 ) ) ( ON ?auto_121617 ?auto_121618 ) ( CLEAR ?auto_121617 ) ( HAND-EMPTY ) ( not ( = ?auto_121614 ?auto_121618 ) ) ( not ( = ?auto_121615 ?auto_121618 ) ) ( not ( = ?auto_121616 ?auto_121618 ) ) ( not ( = ?auto_121617 ?auto_121618 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121617 ?auto_121618 )
      ( MAKE-4PILE ?auto_121614 ?auto_121615 ?auto_121616 ?auto_121617 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121619 - BLOCK
      ?auto_121620 - BLOCK
      ?auto_121621 - BLOCK
      ?auto_121622 - BLOCK
    )
    :vars
    (
      ?auto_121623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121619 ) ( ON ?auto_121620 ?auto_121619 ) ( not ( = ?auto_121619 ?auto_121620 ) ) ( not ( = ?auto_121619 ?auto_121621 ) ) ( not ( = ?auto_121619 ?auto_121622 ) ) ( not ( = ?auto_121620 ?auto_121621 ) ) ( not ( = ?auto_121620 ?auto_121622 ) ) ( not ( = ?auto_121621 ?auto_121622 ) ) ( ON ?auto_121622 ?auto_121623 ) ( CLEAR ?auto_121622 ) ( not ( = ?auto_121619 ?auto_121623 ) ) ( not ( = ?auto_121620 ?auto_121623 ) ) ( not ( = ?auto_121621 ?auto_121623 ) ) ( not ( = ?auto_121622 ?auto_121623 ) ) ( HOLDING ?auto_121621 ) ( CLEAR ?auto_121620 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121619 ?auto_121620 ?auto_121621 )
      ( MAKE-4PILE ?auto_121619 ?auto_121620 ?auto_121621 ?auto_121622 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121624 - BLOCK
      ?auto_121625 - BLOCK
      ?auto_121626 - BLOCK
      ?auto_121627 - BLOCK
    )
    :vars
    (
      ?auto_121628 - BLOCK
      ?auto_121630 - BLOCK
      ?auto_121629 - BLOCK
      ?auto_121631 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121624 ) ( ON ?auto_121625 ?auto_121624 ) ( not ( = ?auto_121624 ?auto_121625 ) ) ( not ( = ?auto_121624 ?auto_121626 ) ) ( not ( = ?auto_121624 ?auto_121627 ) ) ( not ( = ?auto_121625 ?auto_121626 ) ) ( not ( = ?auto_121625 ?auto_121627 ) ) ( not ( = ?auto_121626 ?auto_121627 ) ) ( ON ?auto_121627 ?auto_121628 ) ( not ( = ?auto_121624 ?auto_121628 ) ) ( not ( = ?auto_121625 ?auto_121628 ) ) ( not ( = ?auto_121626 ?auto_121628 ) ) ( not ( = ?auto_121627 ?auto_121628 ) ) ( CLEAR ?auto_121625 ) ( ON ?auto_121626 ?auto_121627 ) ( CLEAR ?auto_121626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121630 ) ( ON ?auto_121629 ?auto_121630 ) ( ON ?auto_121631 ?auto_121629 ) ( ON ?auto_121628 ?auto_121631 ) ( not ( = ?auto_121630 ?auto_121629 ) ) ( not ( = ?auto_121630 ?auto_121631 ) ) ( not ( = ?auto_121630 ?auto_121628 ) ) ( not ( = ?auto_121630 ?auto_121627 ) ) ( not ( = ?auto_121630 ?auto_121626 ) ) ( not ( = ?auto_121629 ?auto_121631 ) ) ( not ( = ?auto_121629 ?auto_121628 ) ) ( not ( = ?auto_121629 ?auto_121627 ) ) ( not ( = ?auto_121629 ?auto_121626 ) ) ( not ( = ?auto_121631 ?auto_121628 ) ) ( not ( = ?auto_121631 ?auto_121627 ) ) ( not ( = ?auto_121631 ?auto_121626 ) ) ( not ( = ?auto_121624 ?auto_121630 ) ) ( not ( = ?auto_121624 ?auto_121629 ) ) ( not ( = ?auto_121624 ?auto_121631 ) ) ( not ( = ?auto_121625 ?auto_121630 ) ) ( not ( = ?auto_121625 ?auto_121629 ) ) ( not ( = ?auto_121625 ?auto_121631 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121630 ?auto_121629 ?auto_121631 ?auto_121628 ?auto_121627 )
      ( MAKE-4PILE ?auto_121624 ?auto_121625 ?auto_121626 ?auto_121627 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121632 - BLOCK
      ?auto_121633 - BLOCK
      ?auto_121634 - BLOCK
      ?auto_121635 - BLOCK
    )
    :vars
    (
      ?auto_121636 - BLOCK
      ?auto_121638 - BLOCK
      ?auto_121637 - BLOCK
      ?auto_121639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121632 ) ( not ( = ?auto_121632 ?auto_121633 ) ) ( not ( = ?auto_121632 ?auto_121634 ) ) ( not ( = ?auto_121632 ?auto_121635 ) ) ( not ( = ?auto_121633 ?auto_121634 ) ) ( not ( = ?auto_121633 ?auto_121635 ) ) ( not ( = ?auto_121634 ?auto_121635 ) ) ( ON ?auto_121635 ?auto_121636 ) ( not ( = ?auto_121632 ?auto_121636 ) ) ( not ( = ?auto_121633 ?auto_121636 ) ) ( not ( = ?auto_121634 ?auto_121636 ) ) ( not ( = ?auto_121635 ?auto_121636 ) ) ( ON ?auto_121634 ?auto_121635 ) ( CLEAR ?auto_121634 ) ( ON-TABLE ?auto_121638 ) ( ON ?auto_121637 ?auto_121638 ) ( ON ?auto_121639 ?auto_121637 ) ( ON ?auto_121636 ?auto_121639 ) ( not ( = ?auto_121638 ?auto_121637 ) ) ( not ( = ?auto_121638 ?auto_121639 ) ) ( not ( = ?auto_121638 ?auto_121636 ) ) ( not ( = ?auto_121638 ?auto_121635 ) ) ( not ( = ?auto_121638 ?auto_121634 ) ) ( not ( = ?auto_121637 ?auto_121639 ) ) ( not ( = ?auto_121637 ?auto_121636 ) ) ( not ( = ?auto_121637 ?auto_121635 ) ) ( not ( = ?auto_121637 ?auto_121634 ) ) ( not ( = ?auto_121639 ?auto_121636 ) ) ( not ( = ?auto_121639 ?auto_121635 ) ) ( not ( = ?auto_121639 ?auto_121634 ) ) ( not ( = ?auto_121632 ?auto_121638 ) ) ( not ( = ?auto_121632 ?auto_121637 ) ) ( not ( = ?auto_121632 ?auto_121639 ) ) ( not ( = ?auto_121633 ?auto_121638 ) ) ( not ( = ?auto_121633 ?auto_121637 ) ) ( not ( = ?auto_121633 ?auto_121639 ) ) ( HOLDING ?auto_121633 ) ( CLEAR ?auto_121632 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121632 ?auto_121633 )
      ( MAKE-4PILE ?auto_121632 ?auto_121633 ?auto_121634 ?auto_121635 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121640 - BLOCK
      ?auto_121641 - BLOCK
      ?auto_121642 - BLOCK
      ?auto_121643 - BLOCK
    )
    :vars
    (
      ?auto_121647 - BLOCK
      ?auto_121646 - BLOCK
      ?auto_121645 - BLOCK
      ?auto_121644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121640 ) ( not ( = ?auto_121640 ?auto_121641 ) ) ( not ( = ?auto_121640 ?auto_121642 ) ) ( not ( = ?auto_121640 ?auto_121643 ) ) ( not ( = ?auto_121641 ?auto_121642 ) ) ( not ( = ?auto_121641 ?auto_121643 ) ) ( not ( = ?auto_121642 ?auto_121643 ) ) ( ON ?auto_121643 ?auto_121647 ) ( not ( = ?auto_121640 ?auto_121647 ) ) ( not ( = ?auto_121641 ?auto_121647 ) ) ( not ( = ?auto_121642 ?auto_121647 ) ) ( not ( = ?auto_121643 ?auto_121647 ) ) ( ON ?auto_121642 ?auto_121643 ) ( ON-TABLE ?auto_121646 ) ( ON ?auto_121645 ?auto_121646 ) ( ON ?auto_121644 ?auto_121645 ) ( ON ?auto_121647 ?auto_121644 ) ( not ( = ?auto_121646 ?auto_121645 ) ) ( not ( = ?auto_121646 ?auto_121644 ) ) ( not ( = ?auto_121646 ?auto_121647 ) ) ( not ( = ?auto_121646 ?auto_121643 ) ) ( not ( = ?auto_121646 ?auto_121642 ) ) ( not ( = ?auto_121645 ?auto_121644 ) ) ( not ( = ?auto_121645 ?auto_121647 ) ) ( not ( = ?auto_121645 ?auto_121643 ) ) ( not ( = ?auto_121645 ?auto_121642 ) ) ( not ( = ?auto_121644 ?auto_121647 ) ) ( not ( = ?auto_121644 ?auto_121643 ) ) ( not ( = ?auto_121644 ?auto_121642 ) ) ( not ( = ?auto_121640 ?auto_121646 ) ) ( not ( = ?auto_121640 ?auto_121645 ) ) ( not ( = ?auto_121640 ?auto_121644 ) ) ( not ( = ?auto_121641 ?auto_121646 ) ) ( not ( = ?auto_121641 ?auto_121645 ) ) ( not ( = ?auto_121641 ?auto_121644 ) ) ( CLEAR ?auto_121640 ) ( ON ?auto_121641 ?auto_121642 ) ( CLEAR ?auto_121641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121646 ?auto_121645 ?auto_121644 ?auto_121647 ?auto_121643 ?auto_121642 )
      ( MAKE-4PILE ?auto_121640 ?auto_121641 ?auto_121642 ?auto_121643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121648 - BLOCK
      ?auto_121649 - BLOCK
      ?auto_121650 - BLOCK
      ?auto_121651 - BLOCK
    )
    :vars
    (
      ?auto_121654 - BLOCK
      ?auto_121655 - BLOCK
      ?auto_121653 - BLOCK
      ?auto_121652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121648 ?auto_121649 ) ) ( not ( = ?auto_121648 ?auto_121650 ) ) ( not ( = ?auto_121648 ?auto_121651 ) ) ( not ( = ?auto_121649 ?auto_121650 ) ) ( not ( = ?auto_121649 ?auto_121651 ) ) ( not ( = ?auto_121650 ?auto_121651 ) ) ( ON ?auto_121651 ?auto_121654 ) ( not ( = ?auto_121648 ?auto_121654 ) ) ( not ( = ?auto_121649 ?auto_121654 ) ) ( not ( = ?auto_121650 ?auto_121654 ) ) ( not ( = ?auto_121651 ?auto_121654 ) ) ( ON ?auto_121650 ?auto_121651 ) ( ON-TABLE ?auto_121655 ) ( ON ?auto_121653 ?auto_121655 ) ( ON ?auto_121652 ?auto_121653 ) ( ON ?auto_121654 ?auto_121652 ) ( not ( = ?auto_121655 ?auto_121653 ) ) ( not ( = ?auto_121655 ?auto_121652 ) ) ( not ( = ?auto_121655 ?auto_121654 ) ) ( not ( = ?auto_121655 ?auto_121651 ) ) ( not ( = ?auto_121655 ?auto_121650 ) ) ( not ( = ?auto_121653 ?auto_121652 ) ) ( not ( = ?auto_121653 ?auto_121654 ) ) ( not ( = ?auto_121653 ?auto_121651 ) ) ( not ( = ?auto_121653 ?auto_121650 ) ) ( not ( = ?auto_121652 ?auto_121654 ) ) ( not ( = ?auto_121652 ?auto_121651 ) ) ( not ( = ?auto_121652 ?auto_121650 ) ) ( not ( = ?auto_121648 ?auto_121655 ) ) ( not ( = ?auto_121648 ?auto_121653 ) ) ( not ( = ?auto_121648 ?auto_121652 ) ) ( not ( = ?auto_121649 ?auto_121655 ) ) ( not ( = ?auto_121649 ?auto_121653 ) ) ( not ( = ?auto_121649 ?auto_121652 ) ) ( ON ?auto_121649 ?auto_121650 ) ( CLEAR ?auto_121649 ) ( HOLDING ?auto_121648 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121648 )
      ( MAKE-4PILE ?auto_121648 ?auto_121649 ?auto_121650 ?auto_121651 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_121656 - BLOCK
      ?auto_121657 - BLOCK
      ?auto_121658 - BLOCK
      ?auto_121659 - BLOCK
    )
    :vars
    (
      ?auto_121663 - BLOCK
      ?auto_121661 - BLOCK
      ?auto_121662 - BLOCK
      ?auto_121660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121656 ?auto_121657 ) ) ( not ( = ?auto_121656 ?auto_121658 ) ) ( not ( = ?auto_121656 ?auto_121659 ) ) ( not ( = ?auto_121657 ?auto_121658 ) ) ( not ( = ?auto_121657 ?auto_121659 ) ) ( not ( = ?auto_121658 ?auto_121659 ) ) ( ON ?auto_121659 ?auto_121663 ) ( not ( = ?auto_121656 ?auto_121663 ) ) ( not ( = ?auto_121657 ?auto_121663 ) ) ( not ( = ?auto_121658 ?auto_121663 ) ) ( not ( = ?auto_121659 ?auto_121663 ) ) ( ON ?auto_121658 ?auto_121659 ) ( ON-TABLE ?auto_121661 ) ( ON ?auto_121662 ?auto_121661 ) ( ON ?auto_121660 ?auto_121662 ) ( ON ?auto_121663 ?auto_121660 ) ( not ( = ?auto_121661 ?auto_121662 ) ) ( not ( = ?auto_121661 ?auto_121660 ) ) ( not ( = ?auto_121661 ?auto_121663 ) ) ( not ( = ?auto_121661 ?auto_121659 ) ) ( not ( = ?auto_121661 ?auto_121658 ) ) ( not ( = ?auto_121662 ?auto_121660 ) ) ( not ( = ?auto_121662 ?auto_121663 ) ) ( not ( = ?auto_121662 ?auto_121659 ) ) ( not ( = ?auto_121662 ?auto_121658 ) ) ( not ( = ?auto_121660 ?auto_121663 ) ) ( not ( = ?auto_121660 ?auto_121659 ) ) ( not ( = ?auto_121660 ?auto_121658 ) ) ( not ( = ?auto_121656 ?auto_121661 ) ) ( not ( = ?auto_121656 ?auto_121662 ) ) ( not ( = ?auto_121656 ?auto_121660 ) ) ( not ( = ?auto_121657 ?auto_121661 ) ) ( not ( = ?auto_121657 ?auto_121662 ) ) ( not ( = ?auto_121657 ?auto_121660 ) ) ( ON ?auto_121657 ?auto_121658 ) ( ON ?auto_121656 ?auto_121657 ) ( CLEAR ?auto_121656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121661 ?auto_121662 ?auto_121660 ?auto_121663 ?auto_121659 ?auto_121658 ?auto_121657 )
      ( MAKE-4PILE ?auto_121656 ?auto_121657 ?auto_121658 ?auto_121659 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121667 - BLOCK
      ?auto_121668 - BLOCK
      ?auto_121669 - BLOCK
    )
    :vars
    (
      ?auto_121670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121670 ?auto_121669 ) ( CLEAR ?auto_121670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121667 ) ( ON ?auto_121668 ?auto_121667 ) ( ON ?auto_121669 ?auto_121668 ) ( not ( = ?auto_121667 ?auto_121668 ) ) ( not ( = ?auto_121667 ?auto_121669 ) ) ( not ( = ?auto_121667 ?auto_121670 ) ) ( not ( = ?auto_121668 ?auto_121669 ) ) ( not ( = ?auto_121668 ?auto_121670 ) ) ( not ( = ?auto_121669 ?auto_121670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121670 ?auto_121669 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121671 - BLOCK
      ?auto_121672 - BLOCK
      ?auto_121673 - BLOCK
    )
    :vars
    (
      ?auto_121674 - BLOCK
      ?auto_121675 - BLOCK
      ?auto_121676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121674 ?auto_121673 ) ( CLEAR ?auto_121674 ) ( ON-TABLE ?auto_121671 ) ( ON ?auto_121672 ?auto_121671 ) ( ON ?auto_121673 ?auto_121672 ) ( not ( = ?auto_121671 ?auto_121672 ) ) ( not ( = ?auto_121671 ?auto_121673 ) ) ( not ( = ?auto_121671 ?auto_121674 ) ) ( not ( = ?auto_121672 ?auto_121673 ) ) ( not ( = ?auto_121672 ?auto_121674 ) ) ( not ( = ?auto_121673 ?auto_121674 ) ) ( HOLDING ?auto_121675 ) ( CLEAR ?auto_121676 ) ( not ( = ?auto_121671 ?auto_121675 ) ) ( not ( = ?auto_121671 ?auto_121676 ) ) ( not ( = ?auto_121672 ?auto_121675 ) ) ( not ( = ?auto_121672 ?auto_121676 ) ) ( not ( = ?auto_121673 ?auto_121675 ) ) ( not ( = ?auto_121673 ?auto_121676 ) ) ( not ( = ?auto_121674 ?auto_121675 ) ) ( not ( = ?auto_121674 ?auto_121676 ) ) ( not ( = ?auto_121675 ?auto_121676 ) ) )
    :subtasks
    ( ( !STACK ?auto_121675 ?auto_121676 )
      ( MAKE-3PILE ?auto_121671 ?auto_121672 ?auto_121673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121677 - BLOCK
      ?auto_121678 - BLOCK
      ?auto_121679 - BLOCK
    )
    :vars
    (
      ?auto_121682 - BLOCK
      ?auto_121680 - BLOCK
      ?auto_121681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121682 ?auto_121679 ) ( ON-TABLE ?auto_121677 ) ( ON ?auto_121678 ?auto_121677 ) ( ON ?auto_121679 ?auto_121678 ) ( not ( = ?auto_121677 ?auto_121678 ) ) ( not ( = ?auto_121677 ?auto_121679 ) ) ( not ( = ?auto_121677 ?auto_121682 ) ) ( not ( = ?auto_121678 ?auto_121679 ) ) ( not ( = ?auto_121678 ?auto_121682 ) ) ( not ( = ?auto_121679 ?auto_121682 ) ) ( CLEAR ?auto_121680 ) ( not ( = ?auto_121677 ?auto_121681 ) ) ( not ( = ?auto_121677 ?auto_121680 ) ) ( not ( = ?auto_121678 ?auto_121681 ) ) ( not ( = ?auto_121678 ?auto_121680 ) ) ( not ( = ?auto_121679 ?auto_121681 ) ) ( not ( = ?auto_121679 ?auto_121680 ) ) ( not ( = ?auto_121682 ?auto_121681 ) ) ( not ( = ?auto_121682 ?auto_121680 ) ) ( not ( = ?auto_121681 ?auto_121680 ) ) ( ON ?auto_121681 ?auto_121682 ) ( CLEAR ?auto_121681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121677 ?auto_121678 ?auto_121679 ?auto_121682 )
      ( MAKE-3PILE ?auto_121677 ?auto_121678 ?auto_121679 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121683 - BLOCK
      ?auto_121684 - BLOCK
      ?auto_121685 - BLOCK
    )
    :vars
    (
      ?auto_121686 - BLOCK
      ?auto_121687 - BLOCK
      ?auto_121688 - BLOCK
      ?auto_121690 - BLOCK
      ?auto_121689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121686 ?auto_121685 ) ( ON-TABLE ?auto_121683 ) ( ON ?auto_121684 ?auto_121683 ) ( ON ?auto_121685 ?auto_121684 ) ( not ( = ?auto_121683 ?auto_121684 ) ) ( not ( = ?auto_121683 ?auto_121685 ) ) ( not ( = ?auto_121683 ?auto_121686 ) ) ( not ( = ?auto_121684 ?auto_121685 ) ) ( not ( = ?auto_121684 ?auto_121686 ) ) ( not ( = ?auto_121685 ?auto_121686 ) ) ( not ( = ?auto_121683 ?auto_121687 ) ) ( not ( = ?auto_121683 ?auto_121688 ) ) ( not ( = ?auto_121684 ?auto_121687 ) ) ( not ( = ?auto_121684 ?auto_121688 ) ) ( not ( = ?auto_121685 ?auto_121687 ) ) ( not ( = ?auto_121685 ?auto_121688 ) ) ( not ( = ?auto_121686 ?auto_121687 ) ) ( not ( = ?auto_121686 ?auto_121688 ) ) ( not ( = ?auto_121687 ?auto_121688 ) ) ( ON ?auto_121687 ?auto_121686 ) ( CLEAR ?auto_121687 ) ( HOLDING ?auto_121688 ) ( CLEAR ?auto_121690 ) ( ON-TABLE ?auto_121689 ) ( ON ?auto_121690 ?auto_121689 ) ( not ( = ?auto_121689 ?auto_121690 ) ) ( not ( = ?auto_121689 ?auto_121688 ) ) ( not ( = ?auto_121690 ?auto_121688 ) ) ( not ( = ?auto_121683 ?auto_121690 ) ) ( not ( = ?auto_121683 ?auto_121689 ) ) ( not ( = ?auto_121684 ?auto_121690 ) ) ( not ( = ?auto_121684 ?auto_121689 ) ) ( not ( = ?auto_121685 ?auto_121690 ) ) ( not ( = ?auto_121685 ?auto_121689 ) ) ( not ( = ?auto_121686 ?auto_121690 ) ) ( not ( = ?auto_121686 ?auto_121689 ) ) ( not ( = ?auto_121687 ?auto_121690 ) ) ( not ( = ?auto_121687 ?auto_121689 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121689 ?auto_121690 ?auto_121688 )
      ( MAKE-3PILE ?auto_121683 ?auto_121684 ?auto_121685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121691 - BLOCK
      ?auto_121692 - BLOCK
      ?auto_121693 - BLOCK
    )
    :vars
    (
      ?auto_121697 - BLOCK
      ?auto_121694 - BLOCK
      ?auto_121698 - BLOCK
      ?auto_121696 - BLOCK
      ?auto_121695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121697 ?auto_121693 ) ( ON-TABLE ?auto_121691 ) ( ON ?auto_121692 ?auto_121691 ) ( ON ?auto_121693 ?auto_121692 ) ( not ( = ?auto_121691 ?auto_121692 ) ) ( not ( = ?auto_121691 ?auto_121693 ) ) ( not ( = ?auto_121691 ?auto_121697 ) ) ( not ( = ?auto_121692 ?auto_121693 ) ) ( not ( = ?auto_121692 ?auto_121697 ) ) ( not ( = ?auto_121693 ?auto_121697 ) ) ( not ( = ?auto_121691 ?auto_121694 ) ) ( not ( = ?auto_121691 ?auto_121698 ) ) ( not ( = ?auto_121692 ?auto_121694 ) ) ( not ( = ?auto_121692 ?auto_121698 ) ) ( not ( = ?auto_121693 ?auto_121694 ) ) ( not ( = ?auto_121693 ?auto_121698 ) ) ( not ( = ?auto_121697 ?auto_121694 ) ) ( not ( = ?auto_121697 ?auto_121698 ) ) ( not ( = ?auto_121694 ?auto_121698 ) ) ( ON ?auto_121694 ?auto_121697 ) ( CLEAR ?auto_121696 ) ( ON-TABLE ?auto_121695 ) ( ON ?auto_121696 ?auto_121695 ) ( not ( = ?auto_121695 ?auto_121696 ) ) ( not ( = ?auto_121695 ?auto_121698 ) ) ( not ( = ?auto_121696 ?auto_121698 ) ) ( not ( = ?auto_121691 ?auto_121696 ) ) ( not ( = ?auto_121691 ?auto_121695 ) ) ( not ( = ?auto_121692 ?auto_121696 ) ) ( not ( = ?auto_121692 ?auto_121695 ) ) ( not ( = ?auto_121693 ?auto_121696 ) ) ( not ( = ?auto_121693 ?auto_121695 ) ) ( not ( = ?auto_121697 ?auto_121696 ) ) ( not ( = ?auto_121697 ?auto_121695 ) ) ( not ( = ?auto_121694 ?auto_121696 ) ) ( not ( = ?auto_121694 ?auto_121695 ) ) ( ON ?auto_121698 ?auto_121694 ) ( CLEAR ?auto_121698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121691 ?auto_121692 ?auto_121693 ?auto_121697 ?auto_121694 )
      ( MAKE-3PILE ?auto_121691 ?auto_121692 ?auto_121693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121699 - BLOCK
      ?auto_121700 - BLOCK
      ?auto_121701 - BLOCK
    )
    :vars
    (
      ?auto_121705 - BLOCK
      ?auto_121703 - BLOCK
      ?auto_121704 - BLOCK
      ?auto_121706 - BLOCK
      ?auto_121702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121705 ?auto_121701 ) ( ON-TABLE ?auto_121699 ) ( ON ?auto_121700 ?auto_121699 ) ( ON ?auto_121701 ?auto_121700 ) ( not ( = ?auto_121699 ?auto_121700 ) ) ( not ( = ?auto_121699 ?auto_121701 ) ) ( not ( = ?auto_121699 ?auto_121705 ) ) ( not ( = ?auto_121700 ?auto_121701 ) ) ( not ( = ?auto_121700 ?auto_121705 ) ) ( not ( = ?auto_121701 ?auto_121705 ) ) ( not ( = ?auto_121699 ?auto_121703 ) ) ( not ( = ?auto_121699 ?auto_121704 ) ) ( not ( = ?auto_121700 ?auto_121703 ) ) ( not ( = ?auto_121700 ?auto_121704 ) ) ( not ( = ?auto_121701 ?auto_121703 ) ) ( not ( = ?auto_121701 ?auto_121704 ) ) ( not ( = ?auto_121705 ?auto_121703 ) ) ( not ( = ?auto_121705 ?auto_121704 ) ) ( not ( = ?auto_121703 ?auto_121704 ) ) ( ON ?auto_121703 ?auto_121705 ) ( ON-TABLE ?auto_121706 ) ( not ( = ?auto_121706 ?auto_121702 ) ) ( not ( = ?auto_121706 ?auto_121704 ) ) ( not ( = ?auto_121702 ?auto_121704 ) ) ( not ( = ?auto_121699 ?auto_121702 ) ) ( not ( = ?auto_121699 ?auto_121706 ) ) ( not ( = ?auto_121700 ?auto_121702 ) ) ( not ( = ?auto_121700 ?auto_121706 ) ) ( not ( = ?auto_121701 ?auto_121702 ) ) ( not ( = ?auto_121701 ?auto_121706 ) ) ( not ( = ?auto_121705 ?auto_121702 ) ) ( not ( = ?auto_121705 ?auto_121706 ) ) ( not ( = ?auto_121703 ?auto_121702 ) ) ( not ( = ?auto_121703 ?auto_121706 ) ) ( ON ?auto_121704 ?auto_121703 ) ( CLEAR ?auto_121704 ) ( HOLDING ?auto_121702 ) ( CLEAR ?auto_121706 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121706 ?auto_121702 )
      ( MAKE-3PILE ?auto_121699 ?auto_121700 ?auto_121701 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121707 - BLOCK
      ?auto_121708 - BLOCK
      ?auto_121709 - BLOCK
    )
    :vars
    (
      ?auto_121713 - BLOCK
      ?auto_121712 - BLOCK
      ?auto_121714 - BLOCK
      ?auto_121710 - BLOCK
      ?auto_121711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121713 ?auto_121709 ) ( ON-TABLE ?auto_121707 ) ( ON ?auto_121708 ?auto_121707 ) ( ON ?auto_121709 ?auto_121708 ) ( not ( = ?auto_121707 ?auto_121708 ) ) ( not ( = ?auto_121707 ?auto_121709 ) ) ( not ( = ?auto_121707 ?auto_121713 ) ) ( not ( = ?auto_121708 ?auto_121709 ) ) ( not ( = ?auto_121708 ?auto_121713 ) ) ( not ( = ?auto_121709 ?auto_121713 ) ) ( not ( = ?auto_121707 ?auto_121712 ) ) ( not ( = ?auto_121707 ?auto_121714 ) ) ( not ( = ?auto_121708 ?auto_121712 ) ) ( not ( = ?auto_121708 ?auto_121714 ) ) ( not ( = ?auto_121709 ?auto_121712 ) ) ( not ( = ?auto_121709 ?auto_121714 ) ) ( not ( = ?auto_121713 ?auto_121712 ) ) ( not ( = ?auto_121713 ?auto_121714 ) ) ( not ( = ?auto_121712 ?auto_121714 ) ) ( ON ?auto_121712 ?auto_121713 ) ( ON-TABLE ?auto_121710 ) ( not ( = ?auto_121710 ?auto_121711 ) ) ( not ( = ?auto_121710 ?auto_121714 ) ) ( not ( = ?auto_121711 ?auto_121714 ) ) ( not ( = ?auto_121707 ?auto_121711 ) ) ( not ( = ?auto_121707 ?auto_121710 ) ) ( not ( = ?auto_121708 ?auto_121711 ) ) ( not ( = ?auto_121708 ?auto_121710 ) ) ( not ( = ?auto_121709 ?auto_121711 ) ) ( not ( = ?auto_121709 ?auto_121710 ) ) ( not ( = ?auto_121713 ?auto_121711 ) ) ( not ( = ?auto_121713 ?auto_121710 ) ) ( not ( = ?auto_121712 ?auto_121711 ) ) ( not ( = ?auto_121712 ?auto_121710 ) ) ( ON ?auto_121714 ?auto_121712 ) ( CLEAR ?auto_121710 ) ( ON ?auto_121711 ?auto_121714 ) ( CLEAR ?auto_121711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121707 ?auto_121708 ?auto_121709 ?auto_121713 ?auto_121712 ?auto_121714 )
      ( MAKE-3PILE ?auto_121707 ?auto_121708 ?auto_121709 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121715 - BLOCK
      ?auto_121716 - BLOCK
      ?auto_121717 - BLOCK
    )
    :vars
    (
      ?auto_121721 - BLOCK
      ?auto_121722 - BLOCK
      ?auto_121718 - BLOCK
      ?auto_121720 - BLOCK
      ?auto_121719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121721 ?auto_121717 ) ( ON-TABLE ?auto_121715 ) ( ON ?auto_121716 ?auto_121715 ) ( ON ?auto_121717 ?auto_121716 ) ( not ( = ?auto_121715 ?auto_121716 ) ) ( not ( = ?auto_121715 ?auto_121717 ) ) ( not ( = ?auto_121715 ?auto_121721 ) ) ( not ( = ?auto_121716 ?auto_121717 ) ) ( not ( = ?auto_121716 ?auto_121721 ) ) ( not ( = ?auto_121717 ?auto_121721 ) ) ( not ( = ?auto_121715 ?auto_121722 ) ) ( not ( = ?auto_121715 ?auto_121718 ) ) ( not ( = ?auto_121716 ?auto_121722 ) ) ( not ( = ?auto_121716 ?auto_121718 ) ) ( not ( = ?auto_121717 ?auto_121722 ) ) ( not ( = ?auto_121717 ?auto_121718 ) ) ( not ( = ?auto_121721 ?auto_121722 ) ) ( not ( = ?auto_121721 ?auto_121718 ) ) ( not ( = ?auto_121722 ?auto_121718 ) ) ( ON ?auto_121722 ?auto_121721 ) ( not ( = ?auto_121720 ?auto_121719 ) ) ( not ( = ?auto_121720 ?auto_121718 ) ) ( not ( = ?auto_121719 ?auto_121718 ) ) ( not ( = ?auto_121715 ?auto_121719 ) ) ( not ( = ?auto_121715 ?auto_121720 ) ) ( not ( = ?auto_121716 ?auto_121719 ) ) ( not ( = ?auto_121716 ?auto_121720 ) ) ( not ( = ?auto_121717 ?auto_121719 ) ) ( not ( = ?auto_121717 ?auto_121720 ) ) ( not ( = ?auto_121721 ?auto_121719 ) ) ( not ( = ?auto_121721 ?auto_121720 ) ) ( not ( = ?auto_121722 ?auto_121719 ) ) ( not ( = ?auto_121722 ?auto_121720 ) ) ( ON ?auto_121718 ?auto_121722 ) ( ON ?auto_121719 ?auto_121718 ) ( CLEAR ?auto_121719 ) ( HOLDING ?auto_121720 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121720 )
      ( MAKE-3PILE ?auto_121715 ?auto_121716 ?auto_121717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_121723 - BLOCK
      ?auto_121724 - BLOCK
      ?auto_121725 - BLOCK
    )
    :vars
    (
      ?auto_121729 - BLOCK
      ?auto_121726 - BLOCK
      ?auto_121730 - BLOCK
      ?auto_121728 - BLOCK
      ?auto_121727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121729 ?auto_121725 ) ( ON-TABLE ?auto_121723 ) ( ON ?auto_121724 ?auto_121723 ) ( ON ?auto_121725 ?auto_121724 ) ( not ( = ?auto_121723 ?auto_121724 ) ) ( not ( = ?auto_121723 ?auto_121725 ) ) ( not ( = ?auto_121723 ?auto_121729 ) ) ( not ( = ?auto_121724 ?auto_121725 ) ) ( not ( = ?auto_121724 ?auto_121729 ) ) ( not ( = ?auto_121725 ?auto_121729 ) ) ( not ( = ?auto_121723 ?auto_121726 ) ) ( not ( = ?auto_121723 ?auto_121730 ) ) ( not ( = ?auto_121724 ?auto_121726 ) ) ( not ( = ?auto_121724 ?auto_121730 ) ) ( not ( = ?auto_121725 ?auto_121726 ) ) ( not ( = ?auto_121725 ?auto_121730 ) ) ( not ( = ?auto_121729 ?auto_121726 ) ) ( not ( = ?auto_121729 ?auto_121730 ) ) ( not ( = ?auto_121726 ?auto_121730 ) ) ( ON ?auto_121726 ?auto_121729 ) ( not ( = ?auto_121728 ?auto_121727 ) ) ( not ( = ?auto_121728 ?auto_121730 ) ) ( not ( = ?auto_121727 ?auto_121730 ) ) ( not ( = ?auto_121723 ?auto_121727 ) ) ( not ( = ?auto_121723 ?auto_121728 ) ) ( not ( = ?auto_121724 ?auto_121727 ) ) ( not ( = ?auto_121724 ?auto_121728 ) ) ( not ( = ?auto_121725 ?auto_121727 ) ) ( not ( = ?auto_121725 ?auto_121728 ) ) ( not ( = ?auto_121729 ?auto_121727 ) ) ( not ( = ?auto_121729 ?auto_121728 ) ) ( not ( = ?auto_121726 ?auto_121727 ) ) ( not ( = ?auto_121726 ?auto_121728 ) ) ( ON ?auto_121730 ?auto_121726 ) ( ON ?auto_121727 ?auto_121730 ) ( ON ?auto_121728 ?auto_121727 ) ( CLEAR ?auto_121728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121723 ?auto_121724 ?auto_121725 ?auto_121729 ?auto_121726 ?auto_121730 ?auto_121727 )
      ( MAKE-3PILE ?auto_121723 ?auto_121724 ?auto_121725 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121736 - BLOCK
      ?auto_121737 - BLOCK
      ?auto_121738 - BLOCK
      ?auto_121739 - BLOCK
      ?auto_121740 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121740 ) ( CLEAR ?auto_121739 ) ( ON-TABLE ?auto_121736 ) ( ON ?auto_121737 ?auto_121736 ) ( ON ?auto_121738 ?auto_121737 ) ( ON ?auto_121739 ?auto_121738 ) ( not ( = ?auto_121736 ?auto_121737 ) ) ( not ( = ?auto_121736 ?auto_121738 ) ) ( not ( = ?auto_121736 ?auto_121739 ) ) ( not ( = ?auto_121736 ?auto_121740 ) ) ( not ( = ?auto_121737 ?auto_121738 ) ) ( not ( = ?auto_121737 ?auto_121739 ) ) ( not ( = ?auto_121737 ?auto_121740 ) ) ( not ( = ?auto_121738 ?auto_121739 ) ) ( not ( = ?auto_121738 ?auto_121740 ) ) ( not ( = ?auto_121739 ?auto_121740 ) ) )
    :subtasks
    ( ( !STACK ?auto_121740 ?auto_121739 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121741 - BLOCK
      ?auto_121742 - BLOCK
      ?auto_121743 - BLOCK
      ?auto_121744 - BLOCK
      ?auto_121745 - BLOCK
    )
    :vars
    (
      ?auto_121746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121744 ) ( ON-TABLE ?auto_121741 ) ( ON ?auto_121742 ?auto_121741 ) ( ON ?auto_121743 ?auto_121742 ) ( ON ?auto_121744 ?auto_121743 ) ( not ( = ?auto_121741 ?auto_121742 ) ) ( not ( = ?auto_121741 ?auto_121743 ) ) ( not ( = ?auto_121741 ?auto_121744 ) ) ( not ( = ?auto_121741 ?auto_121745 ) ) ( not ( = ?auto_121742 ?auto_121743 ) ) ( not ( = ?auto_121742 ?auto_121744 ) ) ( not ( = ?auto_121742 ?auto_121745 ) ) ( not ( = ?auto_121743 ?auto_121744 ) ) ( not ( = ?auto_121743 ?auto_121745 ) ) ( not ( = ?auto_121744 ?auto_121745 ) ) ( ON ?auto_121745 ?auto_121746 ) ( CLEAR ?auto_121745 ) ( HAND-EMPTY ) ( not ( = ?auto_121741 ?auto_121746 ) ) ( not ( = ?auto_121742 ?auto_121746 ) ) ( not ( = ?auto_121743 ?auto_121746 ) ) ( not ( = ?auto_121744 ?auto_121746 ) ) ( not ( = ?auto_121745 ?auto_121746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121745 ?auto_121746 )
      ( MAKE-5PILE ?auto_121741 ?auto_121742 ?auto_121743 ?auto_121744 ?auto_121745 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121747 - BLOCK
      ?auto_121748 - BLOCK
      ?auto_121749 - BLOCK
      ?auto_121750 - BLOCK
      ?auto_121751 - BLOCK
    )
    :vars
    (
      ?auto_121752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121747 ) ( ON ?auto_121748 ?auto_121747 ) ( ON ?auto_121749 ?auto_121748 ) ( not ( = ?auto_121747 ?auto_121748 ) ) ( not ( = ?auto_121747 ?auto_121749 ) ) ( not ( = ?auto_121747 ?auto_121750 ) ) ( not ( = ?auto_121747 ?auto_121751 ) ) ( not ( = ?auto_121748 ?auto_121749 ) ) ( not ( = ?auto_121748 ?auto_121750 ) ) ( not ( = ?auto_121748 ?auto_121751 ) ) ( not ( = ?auto_121749 ?auto_121750 ) ) ( not ( = ?auto_121749 ?auto_121751 ) ) ( not ( = ?auto_121750 ?auto_121751 ) ) ( ON ?auto_121751 ?auto_121752 ) ( CLEAR ?auto_121751 ) ( not ( = ?auto_121747 ?auto_121752 ) ) ( not ( = ?auto_121748 ?auto_121752 ) ) ( not ( = ?auto_121749 ?auto_121752 ) ) ( not ( = ?auto_121750 ?auto_121752 ) ) ( not ( = ?auto_121751 ?auto_121752 ) ) ( HOLDING ?auto_121750 ) ( CLEAR ?auto_121749 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121747 ?auto_121748 ?auto_121749 ?auto_121750 )
      ( MAKE-5PILE ?auto_121747 ?auto_121748 ?auto_121749 ?auto_121750 ?auto_121751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121753 - BLOCK
      ?auto_121754 - BLOCK
      ?auto_121755 - BLOCK
      ?auto_121756 - BLOCK
      ?auto_121757 - BLOCK
    )
    :vars
    (
      ?auto_121758 - BLOCK
      ?auto_121759 - BLOCK
      ?auto_121760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121753 ) ( ON ?auto_121754 ?auto_121753 ) ( ON ?auto_121755 ?auto_121754 ) ( not ( = ?auto_121753 ?auto_121754 ) ) ( not ( = ?auto_121753 ?auto_121755 ) ) ( not ( = ?auto_121753 ?auto_121756 ) ) ( not ( = ?auto_121753 ?auto_121757 ) ) ( not ( = ?auto_121754 ?auto_121755 ) ) ( not ( = ?auto_121754 ?auto_121756 ) ) ( not ( = ?auto_121754 ?auto_121757 ) ) ( not ( = ?auto_121755 ?auto_121756 ) ) ( not ( = ?auto_121755 ?auto_121757 ) ) ( not ( = ?auto_121756 ?auto_121757 ) ) ( ON ?auto_121757 ?auto_121758 ) ( not ( = ?auto_121753 ?auto_121758 ) ) ( not ( = ?auto_121754 ?auto_121758 ) ) ( not ( = ?auto_121755 ?auto_121758 ) ) ( not ( = ?auto_121756 ?auto_121758 ) ) ( not ( = ?auto_121757 ?auto_121758 ) ) ( CLEAR ?auto_121755 ) ( ON ?auto_121756 ?auto_121757 ) ( CLEAR ?auto_121756 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121759 ) ( ON ?auto_121760 ?auto_121759 ) ( ON ?auto_121758 ?auto_121760 ) ( not ( = ?auto_121759 ?auto_121760 ) ) ( not ( = ?auto_121759 ?auto_121758 ) ) ( not ( = ?auto_121759 ?auto_121757 ) ) ( not ( = ?auto_121759 ?auto_121756 ) ) ( not ( = ?auto_121760 ?auto_121758 ) ) ( not ( = ?auto_121760 ?auto_121757 ) ) ( not ( = ?auto_121760 ?auto_121756 ) ) ( not ( = ?auto_121753 ?auto_121759 ) ) ( not ( = ?auto_121753 ?auto_121760 ) ) ( not ( = ?auto_121754 ?auto_121759 ) ) ( not ( = ?auto_121754 ?auto_121760 ) ) ( not ( = ?auto_121755 ?auto_121759 ) ) ( not ( = ?auto_121755 ?auto_121760 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121759 ?auto_121760 ?auto_121758 ?auto_121757 )
      ( MAKE-5PILE ?auto_121753 ?auto_121754 ?auto_121755 ?auto_121756 ?auto_121757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121761 - BLOCK
      ?auto_121762 - BLOCK
      ?auto_121763 - BLOCK
      ?auto_121764 - BLOCK
      ?auto_121765 - BLOCK
    )
    :vars
    (
      ?auto_121768 - BLOCK
      ?auto_121767 - BLOCK
      ?auto_121766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121761 ) ( ON ?auto_121762 ?auto_121761 ) ( not ( = ?auto_121761 ?auto_121762 ) ) ( not ( = ?auto_121761 ?auto_121763 ) ) ( not ( = ?auto_121761 ?auto_121764 ) ) ( not ( = ?auto_121761 ?auto_121765 ) ) ( not ( = ?auto_121762 ?auto_121763 ) ) ( not ( = ?auto_121762 ?auto_121764 ) ) ( not ( = ?auto_121762 ?auto_121765 ) ) ( not ( = ?auto_121763 ?auto_121764 ) ) ( not ( = ?auto_121763 ?auto_121765 ) ) ( not ( = ?auto_121764 ?auto_121765 ) ) ( ON ?auto_121765 ?auto_121768 ) ( not ( = ?auto_121761 ?auto_121768 ) ) ( not ( = ?auto_121762 ?auto_121768 ) ) ( not ( = ?auto_121763 ?auto_121768 ) ) ( not ( = ?auto_121764 ?auto_121768 ) ) ( not ( = ?auto_121765 ?auto_121768 ) ) ( ON ?auto_121764 ?auto_121765 ) ( CLEAR ?auto_121764 ) ( ON-TABLE ?auto_121767 ) ( ON ?auto_121766 ?auto_121767 ) ( ON ?auto_121768 ?auto_121766 ) ( not ( = ?auto_121767 ?auto_121766 ) ) ( not ( = ?auto_121767 ?auto_121768 ) ) ( not ( = ?auto_121767 ?auto_121765 ) ) ( not ( = ?auto_121767 ?auto_121764 ) ) ( not ( = ?auto_121766 ?auto_121768 ) ) ( not ( = ?auto_121766 ?auto_121765 ) ) ( not ( = ?auto_121766 ?auto_121764 ) ) ( not ( = ?auto_121761 ?auto_121767 ) ) ( not ( = ?auto_121761 ?auto_121766 ) ) ( not ( = ?auto_121762 ?auto_121767 ) ) ( not ( = ?auto_121762 ?auto_121766 ) ) ( not ( = ?auto_121763 ?auto_121767 ) ) ( not ( = ?auto_121763 ?auto_121766 ) ) ( HOLDING ?auto_121763 ) ( CLEAR ?auto_121762 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121761 ?auto_121762 ?auto_121763 )
      ( MAKE-5PILE ?auto_121761 ?auto_121762 ?auto_121763 ?auto_121764 ?auto_121765 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121769 - BLOCK
      ?auto_121770 - BLOCK
      ?auto_121771 - BLOCK
      ?auto_121772 - BLOCK
      ?auto_121773 - BLOCK
    )
    :vars
    (
      ?auto_121774 - BLOCK
      ?auto_121775 - BLOCK
      ?auto_121776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121769 ) ( ON ?auto_121770 ?auto_121769 ) ( not ( = ?auto_121769 ?auto_121770 ) ) ( not ( = ?auto_121769 ?auto_121771 ) ) ( not ( = ?auto_121769 ?auto_121772 ) ) ( not ( = ?auto_121769 ?auto_121773 ) ) ( not ( = ?auto_121770 ?auto_121771 ) ) ( not ( = ?auto_121770 ?auto_121772 ) ) ( not ( = ?auto_121770 ?auto_121773 ) ) ( not ( = ?auto_121771 ?auto_121772 ) ) ( not ( = ?auto_121771 ?auto_121773 ) ) ( not ( = ?auto_121772 ?auto_121773 ) ) ( ON ?auto_121773 ?auto_121774 ) ( not ( = ?auto_121769 ?auto_121774 ) ) ( not ( = ?auto_121770 ?auto_121774 ) ) ( not ( = ?auto_121771 ?auto_121774 ) ) ( not ( = ?auto_121772 ?auto_121774 ) ) ( not ( = ?auto_121773 ?auto_121774 ) ) ( ON ?auto_121772 ?auto_121773 ) ( ON-TABLE ?auto_121775 ) ( ON ?auto_121776 ?auto_121775 ) ( ON ?auto_121774 ?auto_121776 ) ( not ( = ?auto_121775 ?auto_121776 ) ) ( not ( = ?auto_121775 ?auto_121774 ) ) ( not ( = ?auto_121775 ?auto_121773 ) ) ( not ( = ?auto_121775 ?auto_121772 ) ) ( not ( = ?auto_121776 ?auto_121774 ) ) ( not ( = ?auto_121776 ?auto_121773 ) ) ( not ( = ?auto_121776 ?auto_121772 ) ) ( not ( = ?auto_121769 ?auto_121775 ) ) ( not ( = ?auto_121769 ?auto_121776 ) ) ( not ( = ?auto_121770 ?auto_121775 ) ) ( not ( = ?auto_121770 ?auto_121776 ) ) ( not ( = ?auto_121771 ?auto_121775 ) ) ( not ( = ?auto_121771 ?auto_121776 ) ) ( CLEAR ?auto_121770 ) ( ON ?auto_121771 ?auto_121772 ) ( CLEAR ?auto_121771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121775 ?auto_121776 ?auto_121774 ?auto_121773 ?auto_121772 )
      ( MAKE-5PILE ?auto_121769 ?auto_121770 ?auto_121771 ?auto_121772 ?auto_121773 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121777 - BLOCK
      ?auto_121778 - BLOCK
      ?auto_121779 - BLOCK
      ?auto_121780 - BLOCK
      ?auto_121781 - BLOCK
    )
    :vars
    (
      ?auto_121783 - BLOCK
      ?auto_121784 - BLOCK
      ?auto_121782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121777 ) ( not ( = ?auto_121777 ?auto_121778 ) ) ( not ( = ?auto_121777 ?auto_121779 ) ) ( not ( = ?auto_121777 ?auto_121780 ) ) ( not ( = ?auto_121777 ?auto_121781 ) ) ( not ( = ?auto_121778 ?auto_121779 ) ) ( not ( = ?auto_121778 ?auto_121780 ) ) ( not ( = ?auto_121778 ?auto_121781 ) ) ( not ( = ?auto_121779 ?auto_121780 ) ) ( not ( = ?auto_121779 ?auto_121781 ) ) ( not ( = ?auto_121780 ?auto_121781 ) ) ( ON ?auto_121781 ?auto_121783 ) ( not ( = ?auto_121777 ?auto_121783 ) ) ( not ( = ?auto_121778 ?auto_121783 ) ) ( not ( = ?auto_121779 ?auto_121783 ) ) ( not ( = ?auto_121780 ?auto_121783 ) ) ( not ( = ?auto_121781 ?auto_121783 ) ) ( ON ?auto_121780 ?auto_121781 ) ( ON-TABLE ?auto_121784 ) ( ON ?auto_121782 ?auto_121784 ) ( ON ?auto_121783 ?auto_121782 ) ( not ( = ?auto_121784 ?auto_121782 ) ) ( not ( = ?auto_121784 ?auto_121783 ) ) ( not ( = ?auto_121784 ?auto_121781 ) ) ( not ( = ?auto_121784 ?auto_121780 ) ) ( not ( = ?auto_121782 ?auto_121783 ) ) ( not ( = ?auto_121782 ?auto_121781 ) ) ( not ( = ?auto_121782 ?auto_121780 ) ) ( not ( = ?auto_121777 ?auto_121784 ) ) ( not ( = ?auto_121777 ?auto_121782 ) ) ( not ( = ?auto_121778 ?auto_121784 ) ) ( not ( = ?auto_121778 ?auto_121782 ) ) ( not ( = ?auto_121779 ?auto_121784 ) ) ( not ( = ?auto_121779 ?auto_121782 ) ) ( ON ?auto_121779 ?auto_121780 ) ( CLEAR ?auto_121779 ) ( HOLDING ?auto_121778 ) ( CLEAR ?auto_121777 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121777 ?auto_121778 )
      ( MAKE-5PILE ?auto_121777 ?auto_121778 ?auto_121779 ?auto_121780 ?auto_121781 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121785 - BLOCK
      ?auto_121786 - BLOCK
      ?auto_121787 - BLOCK
      ?auto_121788 - BLOCK
      ?auto_121789 - BLOCK
    )
    :vars
    (
      ?auto_121792 - BLOCK
      ?auto_121791 - BLOCK
      ?auto_121790 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121785 ) ( not ( = ?auto_121785 ?auto_121786 ) ) ( not ( = ?auto_121785 ?auto_121787 ) ) ( not ( = ?auto_121785 ?auto_121788 ) ) ( not ( = ?auto_121785 ?auto_121789 ) ) ( not ( = ?auto_121786 ?auto_121787 ) ) ( not ( = ?auto_121786 ?auto_121788 ) ) ( not ( = ?auto_121786 ?auto_121789 ) ) ( not ( = ?auto_121787 ?auto_121788 ) ) ( not ( = ?auto_121787 ?auto_121789 ) ) ( not ( = ?auto_121788 ?auto_121789 ) ) ( ON ?auto_121789 ?auto_121792 ) ( not ( = ?auto_121785 ?auto_121792 ) ) ( not ( = ?auto_121786 ?auto_121792 ) ) ( not ( = ?auto_121787 ?auto_121792 ) ) ( not ( = ?auto_121788 ?auto_121792 ) ) ( not ( = ?auto_121789 ?auto_121792 ) ) ( ON ?auto_121788 ?auto_121789 ) ( ON-TABLE ?auto_121791 ) ( ON ?auto_121790 ?auto_121791 ) ( ON ?auto_121792 ?auto_121790 ) ( not ( = ?auto_121791 ?auto_121790 ) ) ( not ( = ?auto_121791 ?auto_121792 ) ) ( not ( = ?auto_121791 ?auto_121789 ) ) ( not ( = ?auto_121791 ?auto_121788 ) ) ( not ( = ?auto_121790 ?auto_121792 ) ) ( not ( = ?auto_121790 ?auto_121789 ) ) ( not ( = ?auto_121790 ?auto_121788 ) ) ( not ( = ?auto_121785 ?auto_121791 ) ) ( not ( = ?auto_121785 ?auto_121790 ) ) ( not ( = ?auto_121786 ?auto_121791 ) ) ( not ( = ?auto_121786 ?auto_121790 ) ) ( not ( = ?auto_121787 ?auto_121791 ) ) ( not ( = ?auto_121787 ?auto_121790 ) ) ( ON ?auto_121787 ?auto_121788 ) ( CLEAR ?auto_121785 ) ( ON ?auto_121786 ?auto_121787 ) ( CLEAR ?auto_121786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121791 ?auto_121790 ?auto_121792 ?auto_121789 ?auto_121788 ?auto_121787 )
      ( MAKE-5PILE ?auto_121785 ?auto_121786 ?auto_121787 ?auto_121788 ?auto_121789 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121793 - BLOCK
      ?auto_121794 - BLOCK
      ?auto_121795 - BLOCK
      ?auto_121796 - BLOCK
      ?auto_121797 - BLOCK
    )
    :vars
    (
      ?auto_121798 - BLOCK
      ?auto_121800 - BLOCK
      ?auto_121799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121793 ?auto_121794 ) ) ( not ( = ?auto_121793 ?auto_121795 ) ) ( not ( = ?auto_121793 ?auto_121796 ) ) ( not ( = ?auto_121793 ?auto_121797 ) ) ( not ( = ?auto_121794 ?auto_121795 ) ) ( not ( = ?auto_121794 ?auto_121796 ) ) ( not ( = ?auto_121794 ?auto_121797 ) ) ( not ( = ?auto_121795 ?auto_121796 ) ) ( not ( = ?auto_121795 ?auto_121797 ) ) ( not ( = ?auto_121796 ?auto_121797 ) ) ( ON ?auto_121797 ?auto_121798 ) ( not ( = ?auto_121793 ?auto_121798 ) ) ( not ( = ?auto_121794 ?auto_121798 ) ) ( not ( = ?auto_121795 ?auto_121798 ) ) ( not ( = ?auto_121796 ?auto_121798 ) ) ( not ( = ?auto_121797 ?auto_121798 ) ) ( ON ?auto_121796 ?auto_121797 ) ( ON-TABLE ?auto_121800 ) ( ON ?auto_121799 ?auto_121800 ) ( ON ?auto_121798 ?auto_121799 ) ( not ( = ?auto_121800 ?auto_121799 ) ) ( not ( = ?auto_121800 ?auto_121798 ) ) ( not ( = ?auto_121800 ?auto_121797 ) ) ( not ( = ?auto_121800 ?auto_121796 ) ) ( not ( = ?auto_121799 ?auto_121798 ) ) ( not ( = ?auto_121799 ?auto_121797 ) ) ( not ( = ?auto_121799 ?auto_121796 ) ) ( not ( = ?auto_121793 ?auto_121800 ) ) ( not ( = ?auto_121793 ?auto_121799 ) ) ( not ( = ?auto_121794 ?auto_121800 ) ) ( not ( = ?auto_121794 ?auto_121799 ) ) ( not ( = ?auto_121795 ?auto_121800 ) ) ( not ( = ?auto_121795 ?auto_121799 ) ) ( ON ?auto_121795 ?auto_121796 ) ( ON ?auto_121794 ?auto_121795 ) ( CLEAR ?auto_121794 ) ( HOLDING ?auto_121793 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121793 )
      ( MAKE-5PILE ?auto_121793 ?auto_121794 ?auto_121795 ?auto_121796 ?auto_121797 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_121801 - BLOCK
      ?auto_121802 - BLOCK
      ?auto_121803 - BLOCK
      ?auto_121804 - BLOCK
      ?auto_121805 - BLOCK
    )
    :vars
    (
      ?auto_121808 - BLOCK
      ?auto_121807 - BLOCK
      ?auto_121806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121801 ?auto_121802 ) ) ( not ( = ?auto_121801 ?auto_121803 ) ) ( not ( = ?auto_121801 ?auto_121804 ) ) ( not ( = ?auto_121801 ?auto_121805 ) ) ( not ( = ?auto_121802 ?auto_121803 ) ) ( not ( = ?auto_121802 ?auto_121804 ) ) ( not ( = ?auto_121802 ?auto_121805 ) ) ( not ( = ?auto_121803 ?auto_121804 ) ) ( not ( = ?auto_121803 ?auto_121805 ) ) ( not ( = ?auto_121804 ?auto_121805 ) ) ( ON ?auto_121805 ?auto_121808 ) ( not ( = ?auto_121801 ?auto_121808 ) ) ( not ( = ?auto_121802 ?auto_121808 ) ) ( not ( = ?auto_121803 ?auto_121808 ) ) ( not ( = ?auto_121804 ?auto_121808 ) ) ( not ( = ?auto_121805 ?auto_121808 ) ) ( ON ?auto_121804 ?auto_121805 ) ( ON-TABLE ?auto_121807 ) ( ON ?auto_121806 ?auto_121807 ) ( ON ?auto_121808 ?auto_121806 ) ( not ( = ?auto_121807 ?auto_121806 ) ) ( not ( = ?auto_121807 ?auto_121808 ) ) ( not ( = ?auto_121807 ?auto_121805 ) ) ( not ( = ?auto_121807 ?auto_121804 ) ) ( not ( = ?auto_121806 ?auto_121808 ) ) ( not ( = ?auto_121806 ?auto_121805 ) ) ( not ( = ?auto_121806 ?auto_121804 ) ) ( not ( = ?auto_121801 ?auto_121807 ) ) ( not ( = ?auto_121801 ?auto_121806 ) ) ( not ( = ?auto_121802 ?auto_121807 ) ) ( not ( = ?auto_121802 ?auto_121806 ) ) ( not ( = ?auto_121803 ?auto_121807 ) ) ( not ( = ?auto_121803 ?auto_121806 ) ) ( ON ?auto_121803 ?auto_121804 ) ( ON ?auto_121802 ?auto_121803 ) ( ON ?auto_121801 ?auto_121802 ) ( CLEAR ?auto_121801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121807 ?auto_121806 ?auto_121808 ?auto_121805 ?auto_121804 ?auto_121803 ?auto_121802 )
      ( MAKE-5PILE ?auto_121801 ?auto_121802 ?auto_121803 ?auto_121804 ?auto_121805 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121811 - BLOCK
      ?auto_121812 - BLOCK
    )
    :vars
    (
      ?auto_121813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121813 ?auto_121812 ) ( CLEAR ?auto_121813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121811 ) ( ON ?auto_121812 ?auto_121811 ) ( not ( = ?auto_121811 ?auto_121812 ) ) ( not ( = ?auto_121811 ?auto_121813 ) ) ( not ( = ?auto_121812 ?auto_121813 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121813 ?auto_121812 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121814 - BLOCK
      ?auto_121815 - BLOCK
    )
    :vars
    (
      ?auto_121816 - BLOCK
      ?auto_121817 - BLOCK
      ?auto_121818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121816 ?auto_121815 ) ( CLEAR ?auto_121816 ) ( ON-TABLE ?auto_121814 ) ( ON ?auto_121815 ?auto_121814 ) ( not ( = ?auto_121814 ?auto_121815 ) ) ( not ( = ?auto_121814 ?auto_121816 ) ) ( not ( = ?auto_121815 ?auto_121816 ) ) ( HOLDING ?auto_121817 ) ( CLEAR ?auto_121818 ) ( not ( = ?auto_121814 ?auto_121817 ) ) ( not ( = ?auto_121814 ?auto_121818 ) ) ( not ( = ?auto_121815 ?auto_121817 ) ) ( not ( = ?auto_121815 ?auto_121818 ) ) ( not ( = ?auto_121816 ?auto_121817 ) ) ( not ( = ?auto_121816 ?auto_121818 ) ) ( not ( = ?auto_121817 ?auto_121818 ) ) )
    :subtasks
    ( ( !STACK ?auto_121817 ?auto_121818 )
      ( MAKE-2PILE ?auto_121814 ?auto_121815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121819 - BLOCK
      ?auto_121820 - BLOCK
    )
    :vars
    (
      ?auto_121823 - BLOCK
      ?auto_121822 - BLOCK
      ?auto_121821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121823 ?auto_121820 ) ( ON-TABLE ?auto_121819 ) ( ON ?auto_121820 ?auto_121819 ) ( not ( = ?auto_121819 ?auto_121820 ) ) ( not ( = ?auto_121819 ?auto_121823 ) ) ( not ( = ?auto_121820 ?auto_121823 ) ) ( CLEAR ?auto_121822 ) ( not ( = ?auto_121819 ?auto_121821 ) ) ( not ( = ?auto_121819 ?auto_121822 ) ) ( not ( = ?auto_121820 ?auto_121821 ) ) ( not ( = ?auto_121820 ?auto_121822 ) ) ( not ( = ?auto_121823 ?auto_121821 ) ) ( not ( = ?auto_121823 ?auto_121822 ) ) ( not ( = ?auto_121821 ?auto_121822 ) ) ( ON ?auto_121821 ?auto_121823 ) ( CLEAR ?auto_121821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121819 ?auto_121820 ?auto_121823 )
      ( MAKE-2PILE ?auto_121819 ?auto_121820 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121824 - BLOCK
      ?auto_121825 - BLOCK
    )
    :vars
    (
      ?auto_121828 - BLOCK
      ?auto_121826 - BLOCK
      ?auto_121827 - BLOCK
      ?auto_121831 - BLOCK
      ?auto_121829 - BLOCK
      ?auto_121830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121828 ?auto_121825 ) ( ON-TABLE ?auto_121824 ) ( ON ?auto_121825 ?auto_121824 ) ( not ( = ?auto_121824 ?auto_121825 ) ) ( not ( = ?auto_121824 ?auto_121828 ) ) ( not ( = ?auto_121825 ?auto_121828 ) ) ( not ( = ?auto_121824 ?auto_121826 ) ) ( not ( = ?auto_121824 ?auto_121827 ) ) ( not ( = ?auto_121825 ?auto_121826 ) ) ( not ( = ?auto_121825 ?auto_121827 ) ) ( not ( = ?auto_121828 ?auto_121826 ) ) ( not ( = ?auto_121828 ?auto_121827 ) ) ( not ( = ?auto_121826 ?auto_121827 ) ) ( ON ?auto_121826 ?auto_121828 ) ( CLEAR ?auto_121826 ) ( HOLDING ?auto_121827 ) ( CLEAR ?auto_121831 ) ( ON-TABLE ?auto_121829 ) ( ON ?auto_121830 ?auto_121829 ) ( ON ?auto_121831 ?auto_121830 ) ( not ( = ?auto_121829 ?auto_121830 ) ) ( not ( = ?auto_121829 ?auto_121831 ) ) ( not ( = ?auto_121829 ?auto_121827 ) ) ( not ( = ?auto_121830 ?auto_121831 ) ) ( not ( = ?auto_121830 ?auto_121827 ) ) ( not ( = ?auto_121831 ?auto_121827 ) ) ( not ( = ?auto_121824 ?auto_121831 ) ) ( not ( = ?auto_121824 ?auto_121829 ) ) ( not ( = ?auto_121824 ?auto_121830 ) ) ( not ( = ?auto_121825 ?auto_121831 ) ) ( not ( = ?auto_121825 ?auto_121829 ) ) ( not ( = ?auto_121825 ?auto_121830 ) ) ( not ( = ?auto_121828 ?auto_121831 ) ) ( not ( = ?auto_121828 ?auto_121829 ) ) ( not ( = ?auto_121828 ?auto_121830 ) ) ( not ( = ?auto_121826 ?auto_121831 ) ) ( not ( = ?auto_121826 ?auto_121829 ) ) ( not ( = ?auto_121826 ?auto_121830 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121829 ?auto_121830 ?auto_121831 ?auto_121827 )
      ( MAKE-2PILE ?auto_121824 ?auto_121825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121832 - BLOCK
      ?auto_121833 - BLOCK
    )
    :vars
    (
      ?auto_121839 - BLOCK
      ?auto_121838 - BLOCK
      ?auto_121834 - BLOCK
      ?auto_121837 - BLOCK
      ?auto_121835 - BLOCK
      ?auto_121836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121839 ?auto_121833 ) ( ON-TABLE ?auto_121832 ) ( ON ?auto_121833 ?auto_121832 ) ( not ( = ?auto_121832 ?auto_121833 ) ) ( not ( = ?auto_121832 ?auto_121839 ) ) ( not ( = ?auto_121833 ?auto_121839 ) ) ( not ( = ?auto_121832 ?auto_121838 ) ) ( not ( = ?auto_121832 ?auto_121834 ) ) ( not ( = ?auto_121833 ?auto_121838 ) ) ( not ( = ?auto_121833 ?auto_121834 ) ) ( not ( = ?auto_121839 ?auto_121838 ) ) ( not ( = ?auto_121839 ?auto_121834 ) ) ( not ( = ?auto_121838 ?auto_121834 ) ) ( ON ?auto_121838 ?auto_121839 ) ( CLEAR ?auto_121837 ) ( ON-TABLE ?auto_121835 ) ( ON ?auto_121836 ?auto_121835 ) ( ON ?auto_121837 ?auto_121836 ) ( not ( = ?auto_121835 ?auto_121836 ) ) ( not ( = ?auto_121835 ?auto_121837 ) ) ( not ( = ?auto_121835 ?auto_121834 ) ) ( not ( = ?auto_121836 ?auto_121837 ) ) ( not ( = ?auto_121836 ?auto_121834 ) ) ( not ( = ?auto_121837 ?auto_121834 ) ) ( not ( = ?auto_121832 ?auto_121837 ) ) ( not ( = ?auto_121832 ?auto_121835 ) ) ( not ( = ?auto_121832 ?auto_121836 ) ) ( not ( = ?auto_121833 ?auto_121837 ) ) ( not ( = ?auto_121833 ?auto_121835 ) ) ( not ( = ?auto_121833 ?auto_121836 ) ) ( not ( = ?auto_121839 ?auto_121837 ) ) ( not ( = ?auto_121839 ?auto_121835 ) ) ( not ( = ?auto_121839 ?auto_121836 ) ) ( not ( = ?auto_121838 ?auto_121837 ) ) ( not ( = ?auto_121838 ?auto_121835 ) ) ( not ( = ?auto_121838 ?auto_121836 ) ) ( ON ?auto_121834 ?auto_121838 ) ( CLEAR ?auto_121834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121832 ?auto_121833 ?auto_121839 ?auto_121838 )
      ( MAKE-2PILE ?auto_121832 ?auto_121833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121840 - BLOCK
      ?auto_121841 - BLOCK
    )
    :vars
    (
      ?auto_121844 - BLOCK
      ?auto_121842 - BLOCK
      ?auto_121847 - BLOCK
      ?auto_121845 - BLOCK
      ?auto_121846 - BLOCK
      ?auto_121843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121844 ?auto_121841 ) ( ON-TABLE ?auto_121840 ) ( ON ?auto_121841 ?auto_121840 ) ( not ( = ?auto_121840 ?auto_121841 ) ) ( not ( = ?auto_121840 ?auto_121844 ) ) ( not ( = ?auto_121841 ?auto_121844 ) ) ( not ( = ?auto_121840 ?auto_121842 ) ) ( not ( = ?auto_121840 ?auto_121847 ) ) ( not ( = ?auto_121841 ?auto_121842 ) ) ( not ( = ?auto_121841 ?auto_121847 ) ) ( not ( = ?auto_121844 ?auto_121842 ) ) ( not ( = ?auto_121844 ?auto_121847 ) ) ( not ( = ?auto_121842 ?auto_121847 ) ) ( ON ?auto_121842 ?auto_121844 ) ( ON-TABLE ?auto_121845 ) ( ON ?auto_121846 ?auto_121845 ) ( not ( = ?auto_121845 ?auto_121846 ) ) ( not ( = ?auto_121845 ?auto_121843 ) ) ( not ( = ?auto_121845 ?auto_121847 ) ) ( not ( = ?auto_121846 ?auto_121843 ) ) ( not ( = ?auto_121846 ?auto_121847 ) ) ( not ( = ?auto_121843 ?auto_121847 ) ) ( not ( = ?auto_121840 ?auto_121843 ) ) ( not ( = ?auto_121840 ?auto_121845 ) ) ( not ( = ?auto_121840 ?auto_121846 ) ) ( not ( = ?auto_121841 ?auto_121843 ) ) ( not ( = ?auto_121841 ?auto_121845 ) ) ( not ( = ?auto_121841 ?auto_121846 ) ) ( not ( = ?auto_121844 ?auto_121843 ) ) ( not ( = ?auto_121844 ?auto_121845 ) ) ( not ( = ?auto_121844 ?auto_121846 ) ) ( not ( = ?auto_121842 ?auto_121843 ) ) ( not ( = ?auto_121842 ?auto_121845 ) ) ( not ( = ?auto_121842 ?auto_121846 ) ) ( ON ?auto_121847 ?auto_121842 ) ( CLEAR ?auto_121847 ) ( HOLDING ?auto_121843 ) ( CLEAR ?auto_121846 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121845 ?auto_121846 ?auto_121843 )
      ( MAKE-2PILE ?auto_121840 ?auto_121841 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121848 - BLOCK
      ?auto_121849 - BLOCK
    )
    :vars
    (
      ?auto_121854 - BLOCK
      ?auto_121850 - BLOCK
      ?auto_121853 - BLOCK
      ?auto_121855 - BLOCK
      ?auto_121851 - BLOCK
      ?auto_121852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121854 ?auto_121849 ) ( ON-TABLE ?auto_121848 ) ( ON ?auto_121849 ?auto_121848 ) ( not ( = ?auto_121848 ?auto_121849 ) ) ( not ( = ?auto_121848 ?auto_121854 ) ) ( not ( = ?auto_121849 ?auto_121854 ) ) ( not ( = ?auto_121848 ?auto_121850 ) ) ( not ( = ?auto_121848 ?auto_121853 ) ) ( not ( = ?auto_121849 ?auto_121850 ) ) ( not ( = ?auto_121849 ?auto_121853 ) ) ( not ( = ?auto_121854 ?auto_121850 ) ) ( not ( = ?auto_121854 ?auto_121853 ) ) ( not ( = ?auto_121850 ?auto_121853 ) ) ( ON ?auto_121850 ?auto_121854 ) ( ON-TABLE ?auto_121855 ) ( ON ?auto_121851 ?auto_121855 ) ( not ( = ?auto_121855 ?auto_121851 ) ) ( not ( = ?auto_121855 ?auto_121852 ) ) ( not ( = ?auto_121855 ?auto_121853 ) ) ( not ( = ?auto_121851 ?auto_121852 ) ) ( not ( = ?auto_121851 ?auto_121853 ) ) ( not ( = ?auto_121852 ?auto_121853 ) ) ( not ( = ?auto_121848 ?auto_121852 ) ) ( not ( = ?auto_121848 ?auto_121855 ) ) ( not ( = ?auto_121848 ?auto_121851 ) ) ( not ( = ?auto_121849 ?auto_121852 ) ) ( not ( = ?auto_121849 ?auto_121855 ) ) ( not ( = ?auto_121849 ?auto_121851 ) ) ( not ( = ?auto_121854 ?auto_121852 ) ) ( not ( = ?auto_121854 ?auto_121855 ) ) ( not ( = ?auto_121854 ?auto_121851 ) ) ( not ( = ?auto_121850 ?auto_121852 ) ) ( not ( = ?auto_121850 ?auto_121855 ) ) ( not ( = ?auto_121850 ?auto_121851 ) ) ( ON ?auto_121853 ?auto_121850 ) ( CLEAR ?auto_121851 ) ( ON ?auto_121852 ?auto_121853 ) ( CLEAR ?auto_121852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121848 ?auto_121849 ?auto_121854 ?auto_121850 ?auto_121853 )
      ( MAKE-2PILE ?auto_121848 ?auto_121849 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121856 - BLOCK
      ?auto_121857 - BLOCK
    )
    :vars
    (
      ?auto_121859 - BLOCK
      ?auto_121858 - BLOCK
      ?auto_121861 - BLOCK
      ?auto_121860 - BLOCK
      ?auto_121862 - BLOCK
      ?auto_121863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121859 ?auto_121857 ) ( ON-TABLE ?auto_121856 ) ( ON ?auto_121857 ?auto_121856 ) ( not ( = ?auto_121856 ?auto_121857 ) ) ( not ( = ?auto_121856 ?auto_121859 ) ) ( not ( = ?auto_121857 ?auto_121859 ) ) ( not ( = ?auto_121856 ?auto_121858 ) ) ( not ( = ?auto_121856 ?auto_121861 ) ) ( not ( = ?auto_121857 ?auto_121858 ) ) ( not ( = ?auto_121857 ?auto_121861 ) ) ( not ( = ?auto_121859 ?auto_121858 ) ) ( not ( = ?auto_121859 ?auto_121861 ) ) ( not ( = ?auto_121858 ?auto_121861 ) ) ( ON ?auto_121858 ?auto_121859 ) ( ON-TABLE ?auto_121860 ) ( not ( = ?auto_121860 ?auto_121862 ) ) ( not ( = ?auto_121860 ?auto_121863 ) ) ( not ( = ?auto_121860 ?auto_121861 ) ) ( not ( = ?auto_121862 ?auto_121863 ) ) ( not ( = ?auto_121862 ?auto_121861 ) ) ( not ( = ?auto_121863 ?auto_121861 ) ) ( not ( = ?auto_121856 ?auto_121863 ) ) ( not ( = ?auto_121856 ?auto_121860 ) ) ( not ( = ?auto_121856 ?auto_121862 ) ) ( not ( = ?auto_121857 ?auto_121863 ) ) ( not ( = ?auto_121857 ?auto_121860 ) ) ( not ( = ?auto_121857 ?auto_121862 ) ) ( not ( = ?auto_121859 ?auto_121863 ) ) ( not ( = ?auto_121859 ?auto_121860 ) ) ( not ( = ?auto_121859 ?auto_121862 ) ) ( not ( = ?auto_121858 ?auto_121863 ) ) ( not ( = ?auto_121858 ?auto_121860 ) ) ( not ( = ?auto_121858 ?auto_121862 ) ) ( ON ?auto_121861 ?auto_121858 ) ( ON ?auto_121863 ?auto_121861 ) ( CLEAR ?auto_121863 ) ( HOLDING ?auto_121862 ) ( CLEAR ?auto_121860 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121860 ?auto_121862 )
      ( MAKE-2PILE ?auto_121856 ?auto_121857 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121864 - BLOCK
      ?auto_121865 - BLOCK
    )
    :vars
    (
      ?auto_121868 - BLOCK
      ?auto_121867 - BLOCK
      ?auto_121870 - BLOCK
      ?auto_121871 - BLOCK
      ?auto_121869 - BLOCK
      ?auto_121866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121868 ?auto_121865 ) ( ON-TABLE ?auto_121864 ) ( ON ?auto_121865 ?auto_121864 ) ( not ( = ?auto_121864 ?auto_121865 ) ) ( not ( = ?auto_121864 ?auto_121868 ) ) ( not ( = ?auto_121865 ?auto_121868 ) ) ( not ( = ?auto_121864 ?auto_121867 ) ) ( not ( = ?auto_121864 ?auto_121870 ) ) ( not ( = ?auto_121865 ?auto_121867 ) ) ( not ( = ?auto_121865 ?auto_121870 ) ) ( not ( = ?auto_121868 ?auto_121867 ) ) ( not ( = ?auto_121868 ?auto_121870 ) ) ( not ( = ?auto_121867 ?auto_121870 ) ) ( ON ?auto_121867 ?auto_121868 ) ( ON-TABLE ?auto_121871 ) ( not ( = ?auto_121871 ?auto_121869 ) ) ( not ( = ?auto_121871 ?auto_121866 ) ) ( not ( = ?auto_121871 ?auto_121870 ) ) ( not ( = ?auto_121869 ?auto_121866 ) ) ( not ( = ?auto_121869 ?auto_121870 ) ) ( not ( = ?auto_121866 ?auto_121870 ) ) ( not ( = ?auto_121864 ?auto_121866 ) ) ( not ( = ?auto_121864 ?auto_121871 ) ) ( not ( = ?auto_121864 ?auto_121869 ) ) ( not ( = ?auto_121865 ?auto_121866 ) ) ( not ( = ?auto_121865 ?auto_121871 ) ) ( not ( = ?auto_121865 ?auto_121869 ) ) ( not ( = ?auto_121868 ?auto_121866 ) ) ( not ( = ?auto_121868 ?auto_121871 ) ) ( not ( = ?auto_121868 ?auto_121869 ) ) ( not ( = ?auto_121867 ?auto_121866 ) ) ( not ( = ?auto_121867 ?auto_121871 ) ) ( not ( = ?auto_121867 ?auto_121869 ) ) ( ON ?auto_121870 ?auto_121867 ) ( ON ?auto_121866 ?auto_121870 ) ( CLEAR ?auto_121871 ) ( ON ?auto_121869 ?auto_121866 ) ( CLEAR ?auto_121869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121864 ?auto_121865 ?auto_121868 ?auto_121867 ?auto_121870 ?auto_121866 )
      ( MAKE-2PILE ?auto_121864 ?auto_121865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121872 - BLOCK
      ?auto_121873 - BLOCK
    )
    :vars
    (
      ?auto_121874 - BLOCK
      ?auto_121876 - BLOCK
      ?auto_121878 - BLOCK
      ?auto_121879 - BLOCK
      ?auto_121877 - BLOCK
      ?auto_121875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121874 ?auto_121873 ) ( ON-TABLE ?auto_121872 ) ( ON ?auto_121873 ?auto_121872 ) ( not ( = ?auto_121872 ?auto_121873 ) ) ( not ( = ?auto_121872 ?auto_121874 ) ) ( not ( = ?auto_121873 ?auto_121874 ) ) ( not ( = ?auto_121872 ?auto_121876 ) ) ( not ( = ?auto_121872 ?auto_121878 ) ) ( not ( = ?auto_121873 ?auto_121876 ) ) ( not ( = ?auto_121873 ?auto_121878 ) ) ( not ( = ?auto_121874 ?auto_121876 ) ) ( not ( = ?auto_121874 ?auto_121878 ) ) ( not ( = ?auto_121876 ?auto_121878 ) ) ( ON ?auto_121876 ?auto_121874 ) ( not ( = ?auto_121879 ?auto_121877 ) ) ( not ( = ?auto_121879 ?auto_121875 ) ) ( not ( = ?auto_121879 ?auto_121878 ) ) ( not ( = ?auto_121877 ?auto_121875 ) ) ( not ( = ?auto_121877 ?auto_121878 ) ) ( not ( = ?auto_121875 ?auto_121878 ) ) ( not ( = ?auto_121872 ?auto_121875 ) ) ( not ( = ?auto_121872 ?auto_121879 ) ) ( not ( = ?auto_121872 ?auto_121877 ) ) ( not ( = ?auto_121873 ?auto_121875 ) ) ( not ( = ?auto_121873 ?auto_121879 ) ) ( not ( = ?auto_121873 ?auto_121877 ) ) ( not ( = ?auto_121874 ?auto_121875 ) ) ( not ( = ?auto_121874 ?auto_121879 ) ) ( not ( = ?auto_121874 ?auto_121877 ) ) ( not ( = ?auto_121876 ?auto_121875 ) ) ( not ( = ?auto_121876 ?auto_121879 ) ) ( not ( = ?auto_121876 ?auto_121877 ) ) ( ON ?auto_121878 ?auto_121876 ) ( ON ?auto_121875 ?auto_121878 ) ( ON ?auto_121877 ?auto_121875 ) ( CLEAR ?auto_121877 ) ( HOLDING ?auto_121879 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121879 )
      ( MAKE-2PILE ?auto_121872 ?auto_121873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_121880 - BLOCK
      ?auto_121881 - BLOCK
    )
    :vars
    (
      ?auto_121885 - BLOCK
      ?auto_121884 - BLOCK
      ?auto_121882 - BLOCK
      ?auto_121887 - BLOCK
      ?auto_121886 - BLOCK
      ?auto_121883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121885 ?auto_121881 ) ( ON-TABLE ?auto_121880 ) ( ON ?auto_121881 ?auto_121880 ) ( not ( = ?auto_121880 ?auto_121881 ) ) ( not ( = ?auto_121880 ?auto_121885 ) ) ( not ( = ?auto_121881 ?auto_121885 ) ) ( not ( = ?auto_121880 ?auto_121884 ) ) ( not ( = ?auto_121880 ?auto_121882 ) ) ( not ( = ?auto_121881 ?auto_121884 ) ) ( not ( = ?auto_121881 ?auto_121882 ) ) ( not ( = ?auto_121885 ?auto_121884 ) ) ( not ( = ?auto_121885 ?auto_121882 ) ) ( not ( = ?auto_121884 ?auto_121882 ) ) ( ON ?auto_121884 ?auto_121885 ) ( not ( = ?auto_121887 ?auto_121886 ) ) ( not ( = ?auto_121887 ?auto_121883 ) ) ( not ( = ?auto_121887 ?auto_121882 ) ) ( not ( = ?auto_121886 ?auto_121883 ) ) ( not ( = ?auto_121886 ?auto_121882 ) ) ( not ( = ?auto_121883 ?auto_121882 ) ) ( not ( = ?auto_121880 ?auto_121883 ) ) ( not ( = ?auto_121880 ?auto_121887 ) ) ( not ( = ?auto_121880 ?auto_121886 ) ) ( not ( = ?auto_121881 ?auto_121883 ) ) ( not ( = ?auto_121881 ?auto_121887 ) ) ( not ( = ?auto_121881 ?auto_121886 ) ) ( not ( = ?auto_121885 ?auto_121883 ) ) ( not ( = ?auto_121885 ?auto_121887 ) ) ( not ( = ?auto_121885 ?auto_121886 ) ) ( not ( = ?auto_121884 ?auto_121883 ) ) ( not ( = ?auto_121884 ?auto_121887 ) ) ( not ( = ?auto_121884 ?auto_121886 ) ) ( ON ?auto_121882 ?auto_121884 ) ( ON ?auto_121883 ?auto_121882 ) ( ON ?auto_121886 ?auto_121883 ) ( ON ?auto_121887 ?auto_121886 ) ( CLEAR ?auto_121887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121880 ?auto_121881 ?auto_121885 ?auto_121884 ?auto_121882 ?auto_121883 ?auto_121886 )
      ( MAKE-2PILE ?auto_121880 ?auto_121881 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121894 - BLOCK
      ?auto_121895 - BLOCK
      ?auto_121896 - BLOCK
      ?auto_121897 - BLOCK
      ?auto_121898 - BLOCK
      ?auto_121899 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_121899 ) ( CLEAR ?auto_121898 ) ( ON-TABLE ?auto_121894 ) ( ON ?auto_121895 ?auto_121894 ) ( ON ?auto_121896 ?auto_121895 ) ( ON ?auto_121897 ?auto_121896 ) ( ON ?auto_121898 ?auto_121897 ) ( not ( = ?auto_121894 ?auto_121895 ) ) ( not ( = ?auto_121894 ?auto_121896 ) ) ( not ( = ?auto_121894 ?auto_121897 ) ) ( not ( = ?auto_121894 ?auto_121898 ) ) ( not ( = ?auto_121894 ?auto_121899 ) ) ( not ( = ?auto_121895 ?auto_121896 ) ) ( not ( = ?auto_121895 ?auto_121897 ) ) ( not ( = ?auto_121895 ?auto_121898 ) ) ( not ( = ?auto_121895 ?auto_121899 ) ) ( not ( = ?auto_121896 ?auto_121897 ) ) ( not ( = ?auto_121896 ?auto_121898 ) ) ( not ( = ?auto_121896 ?auto_121899 ) ) ( not ( = ?auto_121897 ?auto_121898 ) ) ( not ( = ?auto_121897 ?auto_121899 ) ) ( not ( = ?auto_121898 ?auto_121899 ) ) )
    :subtasks
    ( ( !STACK ?auto_121899 ?auto_121898 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121900 - BLOCK
      ?auto_121901 - BLOCK
      ?auto_121902 - BLOCK
      ?auto_121903 - BLOCK
      ?auto_121904 - BLOCK
      ?auto_121905 - BLOCK
    )
    :vars
    (
      ?auto_121906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_121904 ) ( ON-TABLE ?auto_121900 ) ( ON ?auto_121901 ?auto_121900 ) ( ON ?auto_121902 ?auto_121901 ) ( ON ?auto_121903 ?auto_121902 ) ( ON ?auto_121904 ?auto_121903 ) ( not ( = ?auto_121900 ?auto_121901 ) ) ( not ( = ?auto_121900 ?auto_121902 ) ) ( not ( = ?auto_121900 ?auto_121903 ) ) ( not ( = ?auto_121900 ?auto_121904 ) ) ( not ( = ?auto_121900 ?auto_121905 ) ) ( not ( = ?auto_121901 ?auto_121902 ) ) ( not ( = ?auto_121901 ?auto_121903 ) ) ( not ( = ?auto_121901 ?auto_121904 ) ) ( not ( = ?auto_121901 ?auto_121905 ) ) ( not ( = ?auto_121902 ?auto_121903 ) ) ( not ( = ?auto_121902 ?auto_121904 ) ) ( not ( = ?auto_121902 ?auto_121905 ) ) ( not ( = ?auto_121903 ?auto_121904 ) ) ( not ( = ?auto_121903 ?auto_121905 ) ) ( not ( = ?auto_121904 ?auto_121905 ) ) ( ON ?auto_121905 ?auto_121906 ) ( CLEAR ?auto_121905 ) ( HAND-EMPTY ) ( not ( = ?auto_121900 ?auto_121906 ) ) ( not ( = ?auto_121901 ?auto_121906 ) ) ( not ( = ?auto_121902 ?auto_121906 ) ) ( not ( = ?auto_121903 ?auto_121906 ) ) ( not ( = ?auto_121904 ?auto_121906 ) ) ( not ( = ?auto_121905 ?auto_121906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121905 ?auto_121906 )
      ( MAKE-6PILE ?auto_121900 ?auto_121901 ?auto_121902 ?auto_121903 ?auto_121904 ?auto_121905 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121907 - BLOCK
      ?auto_121908 - BLOCK
      ?auto_121909 - BLOCK
      ?auto_121910 - BLOCK
      ?auto_121911 - BLOCK
      ?auto_121912 - BLOCK
    )
    :vars
    (
      ?auto_121913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121907 ) ( ON ?auto_121908 ?auto_121907 ) ( ON ?auto_121909 ?auto_121908 ) ( ON ?auto_121910 ?auto_121909 ) ( not ( = ?auto_121907 ?auto_121908 ) ) ( not ( = ?auto_121907 ?auto_121909 ) ) ( not ( = ?auto_121907 ?auto_121910 ) ) ( not ( = ?auto_121907 ?auto_121911 ) ) ( not ( = ?auto_121907 ?auto_121912 ) ) ( not ( = ?auto_121908 ?auto_121909 ) ) ( not ( = ?auto_121908 ?auto_121910 ) ) ( not ( = ?auto_121908 ?auto_121911 ) ) ( not ( = ?auto_121908 ?auto_121912 ) ) ( not ( = ?auto_121909 ?auto_121910 ) ) ( not ( = ?auto_121909 ?auto_121911 ) ) ( not ( = ?auto_121909 ?auto_121912 ) ) ( not ( = ?auto_121910 ?auto_121911 ) ) ( not ( = ?auto_121910 ?auto_121912 ) ) ( not ( = ?auto_121911 ?auto_121912 ) ) ( ON ?auto_121912 ?auto_121913 ) ( CLEAR ?auto_121912 ) ( not ( = ?auto_121907 ?auto_121913 ) ) ( not ( = ?auto_121908 ?auto_121913 ) ) ( not ( = ?auto_121909 ?auto_121913 ) ) ( not ( = ?auto_121910 ?auto_121913 ) ) ( not ( = ?auto_121911 ?auto_121913 ) ) ( not ( = ?auto_121912 ?auto_121913 ) ) ( HOLDING ?auto_121911 ) ( CLEAR ?auto_121910 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121907 ?auto_121908 ?auto_121909 ?auto_121910 ?auto_121911 )
      ( MAKE-6PILE ?auto_121907 ?auto_121908 ?auto_121909 ?auto_121910 ?auto_121911 ?auto_121912 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121914 - BLOCK
      ?auto_121915 - BLOCK
      ?auto_121916 - BLOCK
      ?auto_121917 - BLOCK
      ?auto_121918 - BLOCK
      ?auto_121919 - BLOCK
    )
    :vars
    (
      ?auto_121920 - BLOCK
      ?auto_121921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121914 ) ( ON ?auto_121915 ?auto_121914 ) ( ON ?auto_121916 ?auto_121915 ) ( ON ?auto_121917 ?auto_121916 ) ( not ( = ?auto_121914 ?auto_121915 ) ) ( not ( = ?auto_121914 ?auto_121916 ) ) ( not ( = ?auto_121914 ?auto_121917 ) ) ( not ( = ?auto_121914 ?auto_121918 ) ) ( not ( = ?auto_121914 ?auto_121919 ) ) ( not ( = ?auto_121915 ?auto_121916 ) ) ( not ( = ?auto_121915 ?auto_121917 ) ) ( not ( = ?auto_121915 ?auto_121918 ) ) ( not ( = ?auto_121915 ?auto_121919 ) ) ( not ( = ?auto_121916 ?auto_121917 ) ) ( not ( = ?auto_121916 ?auto_121918 ) ) ( not ( = ?auto_121916 ?auto_121919 ) ) ( not ( = ?auto_121917 ?auto_121918 ) ) ( not ( = ?auto_121917 ?auto_121919 ) ) ( not ( = ?auto_121918 ?auto_121919 ) ) ( ON ?auto_121919 ?auto_121920 ) ( not ( = ?auto_121914 ?auto_121920 ) ) ( not ( = ?auto_121915 ?auto_121920 ) ) ( not ( = ?auto_121916 ?auto_121920 ) ) ( not ( = ?auto_121917 ?auto_121920 ) ) ( not ( = ?auto_121918 ?auto_121920 ) ) ( not ( = ?auto_121919 ?auto_121920 ) ) ( CLEAR ?auto_121917 ) ( ON ?auto_121918 ?auto_121919 ) ( CLEAR ?auto_121918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121921 ) ( ON ?auto_121920 ?auto_121921 ) ( not ( = ?auto_121921 ?auto_121920 ) ) ( not ( = ?auto_121921 ?auto_121919 ) ) ( not ( = ?auto_121921 ?auto_121918 ) ) ( not ( = ?auto_121914 ?auto_121921 ) ) ( not ( = ?auto_121915 ?auto_121921 ) ) ( not ( = ?auto_121916 ?auto_121921 ) ) ( not ( = ?auto_121917 ?auto_121921 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121921 ?auto_121920 ?auto_121919 )
      ( MAKE-6PILE ?auto_121914 ?auto_121915 ?auto_121916 ?auto_121917 ?auto_121918 ?auto_121919 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121922 - BLOCK
      ?auto_121923 - BLOCK
      ?auto_121924 - BLOCK
      ?auto_121925 - BLOCK
      ?auto_121926 - BLOCK
      ?auto_121927 - BLOCK
    )
    :vars
    (
      ?auto_121928 - BLOCK
      ?auto_121929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121922 ) ( ON ?auto_121923 ?auto_121922 ) ( ON ?auto_121924 ?auto_121923 ) ( not ( = ?auto_121922 ?auto_121923 ) ) ( not ( = ?auto_121922 ?auto_121924 ) ) ( not ( = ?auto_121922 ?auto_121925 ) ) ( not ( = ?auto_121922 ?auto_121926 ) ) ( not ( = ?auto_121922 ?auto_121927 ) ) ( not ( = ?auto_121923 ?auto_121924 ) ) ( not ( = ?auto_121923 ?auto_121925 ) ) ( not ( = ?auto_121923 ?auto_121926 ) ) ( not ( = ?auto_121923 ?auto_121927 ) ) ( not ( = ?auto_121924 ?auto_121925 ) ) ( not ( = ?auto_121924 ?auto_121926 ) ) ( not ( = ?auto_121924 ?auto_121927 ) ) ( not ( = ?auto_121925 ?auto_121926 ) ) ( not ( = ?auto_121925 ?auto_121927 ) ) ( not ( = ?auto_121926 ?auto_121927 ) ) ( ON ?auto_121927 ?auto_121928 ) ( not ( = ?auto_121922 ?auto_121928 ) ) ( not ( = ?auto_121923 ?auto_121928 ) ) ( not ( = ?auto_121924 ?auto_121928 ) ) ( not ( = ?auto_121925 ?auto_121928 ) ) ( not ( = ?auto_121926 ?auto_121928 ) ) ( not ( = ?auto_121927 ?auto_121928 ) ) ( ON ?auto_121926 ?auto_121927 ) ( CLEAR ?auto_121926 ) ( ON-TABLE ?auto_121929 ) ( ON ?auto_121928 ?auto_121929 ) ( not ( = ?auto_121929 ?auto_121928 ) ) ( not ( = ?auto_121929 ?auto_121927 ) ) ( not ( = ?auto_121929 ?auto_121926 ) ) ( not ( = ?auto_121922 ?auto_121929 ) ) ( not ( = ?auto_121923 ?auto_121929 ) ) ( not ( = ?auto_121924 ?auto_121929 ) ) ( not ( = ?auto_121925 ?auto_121929 ) ) ( HOLDING ?auto_121925 ) ( CLEAR ?auto_121924 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121922 ?auto_121923 ?auto_121924 ?auto_121925 )
      ( MAKE-6PILE ?auto_121922 ?auto_121923 ?auto_121924 ?auto_121925 ?auto_121926 ?auto_121927 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121930 - BLOCK
      ?auto_121931 - BLOCK
      ?auto_121932 - BLOCK
      ?auto_121933 - BLOCK
      ?auto_121934 - BLOCK
      ?auto_121935 - BLOCK
    )
    :vars
    (
      ?auto_121937 - BLOCK
      ?auto_121936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121930 ) ( ON ?auto_121931 ?auto_121930 ) ( ON ?auto_121932 ?auto_121931 ) ( not ( = ?auto_121930 ?auto_121931 ) ) ( not ( = ?auto_121930 ?auto_121932 ) ) ( not ( = ?auto_121930 ?auto_121933 ) ) ( not ( = ?auto_121930 ?auto_121934 ) ) ( not ( = ?auto_121930 ?auto_121935 ) ) ( not ( = ?auto_121931 ?auto_121932 ) ) ( not ( = ?auto_121931 ?auto_121933 ) ) ( not ( = ?auto_121931 ?auto_121934 ) ) ( not ( = ?auto_121931 ?auto_121935 ) ) ( not ( = ?auto_121932 ?auto_121933 ) ) ( not ( = ?auto_121932 ?auto_121934 ) ) ( not ( = ?auto_121932 ?auto_121935 ) ) ( not ( = ?auto_121933 ?auto_121934 ) ) ( not ( = ?auto_121933 ?auto_121935 ) ) ( not ( = ?auto_121934 ?auto_121935 ) ) ( ON ?auto_121935 ?auto_121937 ) ( not ( = ?auto_121930 ?auto_121937 ) ) ( not ( = ?auto_121931 ?auto_121937 ) ) ( not ( = ?auto_121932 ?auto_121937 ) ) ( not ( = ?auto_121933 ?auto_121937 ) ) ( not ( = ?auto_121934 ?auto_121937 ) ) ( not ( = ?auto_121935 ?auto_121937 ) ) ( ON ?auto_121934 ?auto_121935 ) ( ON-TABLE ?auto_121936 ) ( ON ?auto_121937 ?auto_121936 ) ( not ( = ?auto_121936 ?auto_121937 ) ) ( not ( = ?auto_121936 ?auto_121935 ) ) ( not ( = ?auto_121936 ?auto_121934 ) ) ( not ( = ?auto_121930 ?auto_121936 ) ) ( not ( = ?auto_121931 ?auto_121936 ) ) ( not ( = ?auto_121932 ?auto_121936 ) ) ( not ( = ?auto_121933 ?auto_121936 ) ) ( CLEAR ?auto_121932 ) ( ON ?auto_121933 ?auto_121934 ) ( CLEAR ?auto_121933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_121936 ?auto_121937 ?auto_121935 ?auto_121934 )
      ( MAKE-6PILE ?auto_121930 ?auto_121931 ?auto_121932 ?auto_121933 ?auto_121934 ?auto_121935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121938 - BLOCK
      ?auto_121939 - BLOCK
      ?auto_121940 - BLOCK
      ?auto_121941 - BLOCK
      ?auto_121942 - BLOCK
      ?auto_121943 - BLOCK
    )
    :vars
    (
      ?auto_121944 - BLOCK
      ?auto_121945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121938 ) ( ON ?auto_121939 ?auto_121938 ) ( not ( = ?auto_121938 ?auto_121939 ) ) ( not ( = ?auto_121938 ?auto_121940 ) ) ( not ( = ?auto_121938 ?auto_121941 ) ) ( not ( = ?auto_121938 ?auto_121942 ) ) ( not ( = ?auto_121938 ?auto_121943 ) ) ( not ( = ?auto_121939 ?auto_121940 ) ) ( not ( = ?auto_121939 ?auto_121941 ) ) ( not ( = ?auto_121939 ?auto_121942 ) ) ( not ( = ?auto_121939 ?auto_121943 ) ) ( not ( = ?auto_121940 ?auto_121941 ) ) ( not ( = ?auto_121940 ?auto_121942 ) ) ( not ( = ?auto_121940 ?auto_121943 ) ) ( not ( = ?auto_121941 ?auto_121942 ) ) ( not ( = ?auto_121941 ?auto_121943 ) ) ( not ( = ?auto_121942 ?auto_121943 ) ) ( ON ?auto_121943 ?auto_121944 ) ( not ( = ?auto_121938 ?auto_121944 ) ) ( not ( = ?auto_121939 ?auto_121944 ) ) ( not ( = ?auto_121940 ?auto_121944 ) ) ( not ( = ?auto_121941 ?auto_121944 ) ) ( not ( = ?auto_121942 ?auto_121944 ) ) ( not ( = ?auto_121943 ?auto_121944 ) ) ( ON ?auto_121942 ?auto_121943 ) ( ON-TABLE ?auto_121945 ) ( ON ?auto_121944 ?auto_121945 ) ( not ( = ?auto_121945 ?auto_121944 ) ) ( not ( = ?auto_121945 ?auto_121943 ) ) ( not ( = ?auto_121945 ?auto_121942 ) ) ( not ( = ?auto_121938 ?auto_121945 ) ) ( not ( = ?auto_121939 ?auto_121945 ) ) ( not ( = ?auto_121940 ?auto_121945 ) ) ( not ( = ?auto_121941 ?auto_121945 ) ) ( ON ?auto_121941 ?auto_121942 ) ( CLEAR ?auto_121941 ) ( HOLDING ?auto_121940 ) ( CLEAR ?auto_121939 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_121938 ?auto_121939 ?auto_121940 )
      ( MAKE-6PILE ?auto_121938 ?auto_121939 ?auto_121940 ?auto_121941 ?auto_121942 ?auto_121943 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121946 - BLOCK
      ?auto_121947 - BLOCK
      ?auto_121948 - BLOCK
      ?auto_121949 - BLOCK
      ?auto_121950 - BLOCK
      ?auto_121951 - BLOCK
    )
    :vars
    (
      ?auto_121952 - BLOCK
      ?auto_121953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121946 ) ( ON ?auto_121947 ?auto_121946 ) ( not ( = ?auto_121946 ?auto_121947 ) ) ( not ( = ?auto_121946 ?auto_121948 ) ) ( not ( = ?auto_121946 ?auto_121949 ) ) ( not ( = ?auto_121946 ?auto_121950 ) ) ( not ( = ?auto_121946 ?auto_121951 ) ) ( not ( = ?auto_121947 ?auto_121948 ) ) ( not ( = ?auto_121947 ?auto_121949 ) ) ( not ( = ?auto_121947 ?auto_121950 ) ) ( not ( = ?auto_121947 ?auto_121951 ) ) ( not ( = ?auto_121948 ?auto_121949 ) ) ( not ( = ?auto_121948 ?auto_121950 ) ) ( not ( = ?auto_121948 ?auto_121951 ) ) ( not ( = ?auto_121949 ?auto_121950 ) ) ( not ( = ?auto_121949 ?auto_121951 ) ) ( not ( = ?auto_121950 ?auto_121951 ) ) ( ON ?auto_121951 ?auto_121952 ) ( not ( = ?auto_121946 ?auto_121952 ) ) ( not ( = ?auto_121947 ?auto_121952 ) ) ( not ( = ?auto_121948 ?auto_121952 ) ) ( not ( = ?auto_121949 ?auto_121952 ) ) ( not ( = ?auto_121950 ?auto_121952 ) ) ( not ( = ?auto_121951 ?auto_121952 ) ) ( ON ?auto_121950 ?auto_121951 ) ( ON-TABLE ?auto_121953 ) ( ON ?auto_121952 ?auto_121953 ) ( not ( = ?auto_121953 ?auto_121952 ) ) ( not ( = ?auto_121953 ?auto_121951 ) ) ( not ( = ?auto_121953 ?auto_121950 ) ) ( not ( = ?auto_121946 ?auto_121953 ) ) ( not ( = ?auto_121947 ?auto_121953 ) ) ( not ( = ?auto_121948 ?auto_121953 ) ) ( not ( = ?auto_121949 ?auto_121953 ) ) ( ON ?auto_121949 ?auto_121950 ) ( CLEAR ?auto_121947 ) ( ON ?auto_121948 ?auto_121949 ) ( CLEAR ?auto_121948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_121953 ?auto_121952 ?auto_121951 ?auto_121950 ?auto_121949 )
      ( MAKE-6PILE ?auto_121946 ?auto_121947 ?auto_121948 ?auto_121949 ?auto_121950 ?auto_121951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121954 - BLOCK
      ?auto_121955 - BLOCK
      ?auto_121956 - BLOCK
      ?auto_121957 - BLOCK
      ?auto_121958 - BLOCK
      ?auto_121959 - BLOCK
    )
    :vars
    (
      ?auto_121961 - BLOCK
      ?auto_121960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121954 ) ( not ( = ?auto_121954 ?auto_121955 ) ) ( not ( = ?auto_121954 ?auto_121956 ) ) ( not ( = ?auto_121954 ?auto_121957 ) ) ( not ( = ?auto_121954 ?auto_121958 ) ) ( not ( = ?auto_121954 ?auto_121959 ) ) ( not ( = ?auto_121955 ?auto_121956 ) ) ( not ( = ?auto_121955 ?auto_121957 ) ) ( not ( = ?auto_121955 ?auto_121958 ) ) ( not ( = ?auto_121955 ?auto_121959 ) ) ( not ( = ?auto_121956 ?auto_121957 ) ) ( not ( = ?auto_121956 ?auto_121958 ) ) ( not ( = ?auto_121956 ?auto_121959 ) ) ( not ( = ?auto_121957 ?auto_121958 ) ) ( not ( = ?auto_121957 ?auto_121959 ) ) ( not ( = ?auto_121958 ?auto_121959 ) ) ( ON ?auto_121959 ?auto_121961 ) ( not ( = ?auto_121954 ?auto_121961 ) ) ( not ( = ?auto_121955 ?auto_121961 ) ) ( not ( = ?auto_121956 ?auto_121961 ) ) ( not ( = ?auto_121957 ?auto_121961 ) ) ( not ( = ?auto_121958 ?auto_121961 ) ) ( not ( = ?auto_121959 ?auto_121961 ) ) ( ON ?auto_121958 ?auto_121959 ) ( ON-TABLE ?auto_121960 ) ( ON ?auto_121961 ?auto_121960 ) ( not ( = ?auto_121960 ?auto_121961 ) ) ( not ( = ?auto_121960 ?auto_121959 ) ) ( not ( = ?auto_121960 ?auto_121958 ) ) ( not ( = ?auto_121954 ?auto_121960 ) ) ( not ( = ?auto_121955 ?auto_121960 ) ) ( not ( = ?auto_121956 ?auto_121960 ) ) ( not ( = ?auto_121957 ?auto_121960 ) ) ( ON ?auto_121957 ?auto_121958 ) ( ON ?auto_121956 ?auto_121957 ) ( CLEAR ?auto_121956 ) ( HOLDING ?auto_121955 ) ( CLEAR ?auto_121954 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121954 ?auto_121955 )
      ( MAKE-6PILE ?auto_121954 ?auto_121955 ?auto_121956 ?auto_121957 ?auto_121958 ?auto_121959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121962 - BLOCK
      ?auto_121963 - BLOCK
      ?auto_121964 - BLOCK
      ?auto_121965 - BLOCK
      ?auto_121966 - BLOCK
      ?auto_121967 - BLOCK
    )
    :vars
    (
      ?auto_121968 - BLOCK
      ?auto_121969 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_121962 ) ( not ( = ?auto_121962 ?auto_121963 ) ) ( not ( = ?auto_121962 ?auto_121964 ) ) ( not ( = ?auto_121962 ?auto_121965 ) ) ( not ( = ?auto_121962 ?auto_121966 ) ) ( not ( = ?auto_121962 ?auto_121967 ) ) ( not ( = ?auto_121963 ?auto_121964 ) ) ( not ( = ?auto_121963 ?auto_121965 ) ) ( not ( = ?auto_121963 ?auto_121966 ) ) ( not ( = ?auto_121963 ?auto_121967 ) ) ( not ( = ?auto_121964 ?auto_121965 ) ) ( not ( = ?auto_121964 ?auto_121966 ) ) ( not ( = ?auto_121964 ?auto_121967 ) ) ( not ( = ?auto_121965 ?auto_121966 ) ) ( not ( = ?auto_121965 ?auto_121967 ) ) ( not ( = ?auto_121966 ?auto_121967 ) ) ( ON ?auto_121967 ?auto_121968 ) ( not ( = ?auto_121962 ?auto_121968 ) ) ( not ( = ?auto_121963 ?auto_121968 ) ) ( not ( = ?auto_121964 ?auto_121968 ) ) ( not ( = ?auto_121965 ?auto_121968 ) ) ( not ( = ?auto_121966 ?auto_121968 ) ) ( not ( = ?auto_121967 ?auto_121968 ) ) ( ON ?auto_121966 ?auto_121967 ) ( ON-TABLE ?auto_121969 ) ( ON ?auto_121968 ?auto_121969 ) ( not ( = ?auto_121969 ?auto_121968 ) ) ( not ( = ?auto_121969 ?auto_121967 ) ) ( not ( = ?auto_121969 ?auto_121966 ) ) ( not ( = ?auto_121962 ?auto_121969 ) ) ( not ( = ?auto_121963 ?auto_121969 ) ) ( not ( = ?auto_121964 ?auto_121969 ) ) ( not ( = ?auto_121965 ?auto_121969 ) ) ( ON ?auto_121965 ?auto_121966 ) ( ON ?auto_121964 ?auto_121965 ) ( CLEAR ?auto_121962 ) ( ON ?auto_121963 ?auto_121964 ) ( CLEAR ?auto_121963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_121969 ?auto_121968 ?auto_121967 ?auto_121966 ?auto_121965 ?auto_121964 )
      ( MAKE-6PILE ?auto_121962 ?auto_121963 ?auto_121964 ?auto_121965 ?auto_121966 ?auto_121967 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121970 - BLOCK
      ?auto_121971 - BLOCK
      ?auto_121972 - BLOCK
      ?auto_121973 - BLOCK
      ?auto_121974 - BLOCK
      ?auto_121975 - BLOCK
    )
    :vars
    (
      ?auto_121976 - BLOCK
      ?auto_121977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121970 ?auto_121971 ) ) ( not ( = ?auto_121970 ?auto_121972 ) ) ( not ( = ?auto_121970 ?auto_121973 ) ) ( not ( = ?auto_121970 ?auto_121974 ) ) ( not ( = ?auto_121970 ?auto_121975 ) ) ( not ( = ?auto_121971 ?auto_121972 ) ) ( not ( = ?auto_121971 ?auto_121973 ) ) ( not ( = ?auto_121971 ?auto_121974 ) ) ( not ( = ?auto_121971 ?auto_121975 ) ) ( not ( = ?auto_121972 ?auto_121973 ) ) ( not ( = ?auto_121972 ?auto_121974 ) ) ( not ( = ?auto_121972 ?auto_121975 ) ) ( not ( = ?auto_121973 ?auto_121974 ) ) ( not ( = ?auto_121973 ?auto_121975 ) ) ( not ( = ?auto_121974 ?auto_121975 ) ) ( ON ?auto_121975 ?auto_121976 ) ( not ( = ?auto_121970 ?auto_121976 ) ) ( not ( = ?auto_121971 ?auto_121976 ) ) ( not ( = ?auto_121972 ?auto_121976 ) ) ( not ( = ?auto_121973 ?auto_121976 ) ) ( not ( = ?auto_121974 ?auto_121976 ) ) ( not ( = ?auto_121975 ?auto_121976 ) ) ( ON ?auto_121974 ?auto_121975 ) ( ON-TABLE ?auto_121977 ) ( ON ?auto_121976 ?auto_121977 ) ( not ( = ?auto_121977 ?auto_121976 ) ) ( not ( = ?auto_121977 ?auto_121975 ) ) ( not ( = ?auto_121977 ?auto_121974 ) ) ( not ( = ?auto_121970 ?auto_121977 ) ) ( not ( = ?auto_121971 ?auto_121977 ) ) ( not ( = ?auto_121972 ?auto_121977 ) ) ( not ( = ?auto_121973 ?auto_121977 ) ) ( ON ?auto_121973 ?auto_121974 ) ( ON ?auto_121972 ?auto_121973 ) ( ON ?auto_121971 ?auto_121972 ) ( CLEAR ?auto_121971 ) ( HOLDING ?auto_121970 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_121970 )
      ( MAKE-6PILE ?auto_121970 ?auto_121971 ?auto_121972 ?auto_121973 ?auto_121974 ?auto_121975 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_121978 - BLOCK
      ?auto_121979 - BLOCK
      ?auto_121980 - BLOCK
      ?auto_121981 - BLOCK
      ?auto_121982 - BLOCK
      ?auto_121983 - BLOCK
    )
    :vars
    (
      ?auto_121985 - BLOCK
      ?auto_121984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_121978 ?auto_121979 ) ) ( not ( = ?auto_121978 ?auto_121980 ) ) ( not ( = ?auto_121978 ?auto_121981 ) ) ( not ( = ?auto_121978 ?auto_121982 ) ) ( not ( = ?auto_121978 ?auto_121983 ) ) ( not ( = ?auto_121979 ?auto_121980 ) ) ( not ( = ?auto_121979 ?auto_121981 ) ) ( not ( = ?auto_121979 ?auto_121982 ) ) ( not ( = ?auto_121979 ?auto_121983 ) ) ( not ( = ?auto_121980 ?auto_121981 ) ) ( not ( = ?auto_121980 ?auto_121982 ) ) ( not ( = ?auto_121980 ?auto_121983 ) ) ( not ( = ?auto_121981 ?auto_121982 ) ) ( not ( = ?auto_121981 ?auto_121983 ) ) ( not ( = ?auto_121982 ?auto_121983 ) ) ( ON ?auto_121983 ?auto_121985 ) ( not ( = ?auto_121978 ?auto_121985 ) ) ( not ( = ?auto_121979 ?auto_121985 ) ) ( not ( = ?auto_121980 ?auto_121985 ) ) ( not ( = ?auto_121981 ?auto_121985 ) ) ( not ( = ?auto_121982 ?auto_121985 ) ) ( not ( = ?auto_121983 ?auto_121985 ) ) ( ON ?auto_121982 ?auto_121983 ) ( ON-TABLE ?auto_121984 ) ( ON ?auto_121985 ?auto_121984 ) ( not ( = ?auto_121984 ?auto_121985 ) ) ( not ( = ?auto_121984 ?auto_121983 ) ) ( not ( = ?auto_121984 ?auto_121982 ) ) ( not ( = ?auto_121978 ?auto_121984 ) ) ( not ( = ?auto_121979 ?auto_121984 ) ) ( not ( = ?auto_121980 ?auto_121984 ) ) ( not ( = ?auto_121981 ?auto_121984 ) ) ( ON ?auto_121981 ?auto_121982 ) ( ON ?auto_121980 ?auto_121981 ) ( ON ?auto_121979 ?auto_121980 ) ( ON ?auto_121978 ?auto_121979 ) ( CLEAR ?auto_121978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_121984 ?auto_121985 ?auto_121983 ?auto_121982 ?auto_121981 ?auto_121980 ?auto_121979 )
      ( MAKE-6PILE ?auto_121978 ?auto_121979 ?auto_121980 ?auto_121981 ?auto_121982 ?auto_121983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121987 - BLOCK
    )
    :vars
    (
      ?auto_121988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121988 ?auto_121987 ) ( CLEAR ?auto_121988 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_121987 ) ( not ( = ?auto_121987 ?auto_121988 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_121988 ?auto_121987 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121989 - BLOCK
    )
    :vars
    (
      ?auto_121990 - BLOCK
      ?auto_121991 - BLOCK
      ?auto_121992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121990 ?auto_121989 ) ( CLEAR ?auto_121990 ) ( ON-TABLE ?auto_121989 ) ( not ( = ?auto_121989 ?auto_121990 ) ) ( HOLDING ?auto_121991 ) ( CLEAR ?auto_121992 ) ( not ( = ?auto_121989 ?auto_121991 ) ) ( not ( = ?auto_121989 ?auto_121992 ) ) ( not ( = ?auto_121990 ?auto_121991 ) ) ( not ( = ?auto_121990 ?auto_121992 ) ) ( not ( = ?auto_121991 ?auto_121992 ) ) )
    :subtasks
    ( ( !STACK ?auto_121991 ?auto_121992 )
      ( MAKE-1PILE ?auto_121989 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121993 - BLOCK
    )
    :vars
    (
      ?auto_121995 - BLOCK
      ?auto_121996 - BLOCK
      ?auto_121994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121995 ?auto_121993 ) ( ON-TABLE ?auto_121993 ) ( not ( = ?auto_121993 ?auto_121995 ) ) ( CLEAR ?auto_121996 ) ( not ( = ?auto_121993 ?auto_121994 ) ) ( not ( = ?auto_121993 ?auto_121996 ) ) ( not ( = ?auto_121995 ?auto_121994 ) ) ( not ( = ?auto_121995 ?auto_121996 ) ) ( not ( = ?auto_121994 ?auto_121996 ) ) ( ON ?auto_121994 ?auto_121995 ) ( CLEAR ?auto_121994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_121993 ?auto_121995 )
      ( MAKE-1PILE ?auto_121993 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_121997 - BLOCK
    )
    :vars
    (
      ?auto_121999 - BLOCK
      ?auto_122000 - BLOCK
      ?auto_121998 - BLOCK
      ?auto_122004 - BLOCK
      ?auto_122001 - BLOCK
      ?auto_122003 - BLOCK
      ?auto_122002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_121999 ?auto_121997 ) ( ON-TABLE ?auto_121997 ) ( not ( = ?auto_121997 ?auto_121999 ) ) ( not ( = ?auto_121997 ?auto_122000 ) ) ( not ( = ?auto_121997 ?auto_121998 ) ) ( not ( = ?auto_121999 ?auto_122000 ) ) ( not ( = ?auto_121999 ?auto_121998 ) ) ( not ( = ?auto_122000 ?auto_121998 ) ) ( ON ?auto_122000 ?auto_121999 ) ( CLEAR ?auto_122000 ) ( HOLDING ?auto_121998 ) ( CLEAR ?auto_122004 ) ( ON-TABLE ?auto_122001 ) ( ON ?auto_122003 ?auto_122001 ) ( ON ?auto_122002 ?auto_122003 ) ( ON ?auto_122004 ?auto_122002 ) ( not ( = ?auto_122001 ?auto_122003 ) ) ( not ( = ?auto_122001 ?auto_122002 ) ) ( not ( = ?auto_122001 ?auto_122004 ) ) ( not ( = ?auto_122001 ?auto_121998 ) ) ( not ( = ?auto_122003 ?auto_122002 ) ) ( not ( = ?auto_122003 ?auto_122004 ) ) ( not ( = ?auto_122003 ?auto_121998 ) ) ( not ( = ?auto_122002 ?auto_122004 ) ) ( not ( = ?auto_122002 ?auto_121998 ) ) ( not ( = ?auto_122004 ?auto_121998 ) ) ( not ( = ?auto_121997 ?auto_122004 ) ) ( not ( = ?auto_121997 ?auto_122001 ) ) ( not ( = ?auto_121997 ?auto_122003 ) ) ( not ( = ?auto_121997 ?auto_122002 ) ) ( not ( = ?auto_121999 ?auto_122004 ) ) ( not ( = ?auto_121999 ?auto_122001 ) ) ( not ( = ?auto_121999 ?auto_122003 ) ) ( not ( = ?auto_121999 ?auto_122002 ) ) ( not ( = ?auto_122000 ?auto_122004 ) ) ( not ( = ?auto_122000 ?auto_122001 ) ) ( not ( = ?auto_122000 ?auto_122003 ) ) ( not ( = ?auto_122000 ?auto_122002 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122001 ?auto_122003 ?auto_122002 ?auto_122004 ?auto_121998 )
      ( MAKE-1PILE ?auto_121997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122005 - BLOCK
    )
    :vars
    (
      ?auto_122007 - BLOCK
      ?auto_122012 - BLOCK
      ?auto_122008 - BLOCK
      ?auto_122011 - BLOCK
      ?auto_122010 - BLOCK
      ?auto_122009 - BLOCK
      ?auto_122006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122007 ?auto_122005 ) ( ON-TABLE ?auto_122005 ) ( not ( = ?auto_122005 ?auto_122007 ) ) ( not ( = ?auto_122005 ?auto_122012 ) ) ( not ( = ?auto_122005 ?auto_122008 ) ) ( not ( = ?auto_122007 ?auto_122012 ) ) ( not ( = ?auto_122007 ?auto_122008 ) ) ( not ( = ?auto_122012 ?auto_122008 ) ) ( ON ?auto_122012 ?auto_122007 ) ( CLEAR ?auto_122011 ) ( ON-TABLE ?auto_122010 ) ( ON ?auto_122009 ?auto_122010 ) ( ON ?auto_122006 ?auto_122009 ) ( ON ?auto_122011 ?auto_122006 ) ( not ( = ?auto_122010 ?auto_122009 ) ) ( not ( = ?auto_122010 ?auto_122006 ) ) ( not ( = ?auto_122010 ?auto_122011 ) ) ( not ( = ?auto_122010 ?auto_122008 ) ) ( not ( = ?auto_122009 ?auto_122006 ) ) ( not ( = ?auto_122009 ?auto_122011 ) ) ( not ( = ?auto_122009 ?auto_122008 ) ) ( not ( = ?auto_122006 ?auto_122011 ) ) ( not ( = ?auto_122006 ?auto_122008 ) ) ( not ( = ?auto_122011 ?auto_122008 ) ) ( not ( = ?auto_122005 ?auto_122011 ) ) ( not ( = ?auto_122005 ?auto_122010 ) ) ( not ( = ?auto_122005 ?auto_122009 ) ) ( not ( = ?auto_122005 ?auto_122006 ) ) ( not ( = ?auto_122007 ?auto_122011 ) ) ( not ( = ?auto_122007 ?auto_122010 ) ) ( not ( = ?auto_122007 ?auto_122009 ) ) ( not ( = ?auto_122007 ?auto_122006 ) ) ( not ( = ?auto_122012 ?auto_122011 ) ) ( not ( = ?auto_122012 ?auto_122010 ) ) ( not ( = ?auto_122012 ?auto_122009 ) ) ( not ( = ?auto_122012 ?auto_122006 ) ) ( ON ?auto_122008 ?auto_122012 ) ( CLEAR ?auto_122008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122005 ?auto_122007 ?auto_122012 )
      ( MAKE-1PILE ?auto_122005 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122013 - BLOCK
    )
    :vars
    (
      ?auto_122019 - BLOCK
      ?auto_122015 - BLOCK
      ?auto_122020 - BLOCK
      ?auto_122014 - BLOCK
      ?auto_122018 - BLOCK
      ?auto_122016 - BLOCK
      ?auto_122017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122019 ?auto_122013 ) ( ON-TABLE ?auto_122013 ) ( not ( = ?auto_122013 ?auto_122019 ) ) ( not ( = ?auto_122013 ?auto_122015 ) ) ( not ( = ?auto_122013 ?auto_122020 ) ) ( not ( = ?auto_122019 ?auto_122015 ) ) ( not ( = ?auto_122019 ?auto_122020 ) ) ( not ( = ?auto_122015 ?auto_122020 ) ) ( ON ?auto_122015 ?auto_122019 ) ( ON-TABLE ?auto_122014 ) ( ON ?auto_122018 ?auto_122014 ) ( ON ?auto_122016 ?auto_122018 ) ( not ( = ?auto_122014 ?auto_122018 ) ) ( not ( = ?auto_122014 ?auto_122016 ) ) ( not ( = ?auto_122014 ?auto_122017 ) ) ( not ( = ?auto_122014 ?auto_122020 ) ) ( not ( = ?auto_122018 ?auto_122016 ) ) ( not ( = ?auto_122018 ?auto_122017 ) ) ( not ( = ?auto_122018 ?auto_122020 ) ) ( not ( = ?auto_122016 ?auto_122017 ) ) ( not ( = ?auto_122016 ?auto_122020 ) ) ( not ( = ?auto_122017 ?auto_122020 ) ) ( not ( = ?auto_122013 ?auto_122017 ) ) ( not ( = ?auto_122013 ?auto_122014 ) ) ( not ( = ?auto_122013 ?auto_122018 ) ) ( not ( = ?auto_122013 ?auto_122016 ) ) ( not ( = ?auto_122019 ?auto_122017 ) ) ( not ( = ?auto_122019 ?auto_122014 ) ) ( not ( = ?auto_122019 ?auto_122018 ) ) ( not ( = ?auto_122019 ?auto_122016 ) ) ( not ( = ?auto_122015 ?auto_122017 ) ) ( not ( = ?auto_122015 ?auto_122014 ) ) ( not ( = ?auto_122015 ?auto_122018 ) ) ( not ( = ?auto_122015 ?auto_122016 ) ) ( ON ?auto_122020 ?auto_122015 ) ( CLEAR ?auto_122020 ) ( HOLDING ?auto_122017 ) ( CLEAR ?auto_122016 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122014 ?auto_122018 ?auto_122016 ?auto_122017 )
      ( MAKE-1PILE ?auto_122013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122021 - BLOCK
    )
    :vars
    (
      ?auto_122026 - BLOCK
      ?auto_122022 - BLOCK
      ?auto_122025 - BLOCK
      ?auto_122027 - BLOCK
      ?auto_122024 - BLOCK
      ?auto_122028 - BLOCK
      ?auto_122023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122026 ?auto_122021 ) ( ON-TABLE ?auto_122021 ) ( not ( = ?auto_122021 ?auto_122026 ) ) ( not ( = ?auto_122021 ?auto_122022 ) ) ( not ( = ?auto_122021 ?auto_122025 ) ) ( not ( = ?auto_122026 ?auto_122022 ) ) ( not ( = ?auto_122026 ?auto_122025 ) ) ( not ( = ?auto_122022 ?auto_122025 ) ) ( ON ?auto_122022 ?auto_122026 ) ( ON-TABLE ?auto_122027 ) ( ON ?auto_122024 ?auto_122027 ) ( ON ?auto_122028 ?auto_122024 ) ( not ( = ?auto_122027 ?auto_122024 ) ) ( not ( = ?auto_122027 ?auto_122028 ) ) ( not ( = ?auto_122027 ?auto_122023 ) ) ( not ( = ?auto_122027 ?auto_122025 ) ) ( not ( = ?auto_122024 ?auto_122028 ) ) ( not ( = ?auto_122024 ?auto_122023 ) ) ( not ( = ?auto_122024 ?auto_122025 ) ) ( not ( = ?auto_122028 ?auto_122023 ) ) ( not ( = ?auto_122028 ?auto_122025 ) ) ( not ( = ?auto_122023 ?auto_122025 ) ) ( not ( = ?auto_122021 ?auto_122023 ) ) ( not ( = ?auto_122021 ?auto_122027 ) ) ( not ( = ?auto_122021 ?auto_122024 ) ) ( not ( = ?auto_122021 ?auto_122028 ) ) ( not ( = ?auto_122026 ?auto_122023 ) ) ( not ( = ?auto_122026 ?auto_122027 ) ) ( not ( = ?auto_122026 ?auto_122024 ) ) ( not ( = ?auto_122026 ?auto_122028 ) ) ( not ( = ?auto_122022 ?auto_122023 ) ) ( not ( = ?auto_122022 ?auto_122027 ) ) ( not ( = ?auto_122022 ?auto_122024 ) ) ( not ( = ?auto_122022 ?auto_122028 ) ) ( ON ?auto_122025 ?auto_122022 ) ( CLEAR ?auto_122028 ) ( ON ?auto_122023 ?auto_122025 ) ( CLEAR ?auto_122023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122021 ?auto_122026 ?auto_122022 ?auto_122025 )
      ( MAKE-1PILE ?auto_122021 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122029 - BLOCK
    )
    :vars
    (
      ?auto_122035 - BLOCK
      ?auto_122031 - BLOCK
      ?auto_122036 - BLOCK
      ?auto_122034 - BLOCK
      ?auto_122033 - BLOCK
      ?auto_122030 - BLOCK
      ?auto_122032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122035 ?auto_122029 ) ( ON-TABLE ?auto_122029 ) ( not ( = ?auto_122029 ?auto_122035 ) ) ( not ( = ?auto_122029 ?auto_122031 ) ) ( not ( = ?auto_122029 ?auto_122036 ) ) ( not ( = ?auto_122035 ?auto_122031 ) ) ( not ( = ?auto_122035 ?auto_122036 ) ) ( not ( = ?auto_122031 ?auto_122036 ) ) ( ON ?auto_122031 ?auto_122035 ) ( ON-TABLE ?auto_122034 ) ( ON ?auto_122033 ?auto_122034 ) ( not ( = ?auto_122034 ?auto_122033 ) ) ( not ( = ?auto_122034 ?auto_122030 ) ) ( not ( = ?auto_122034 ?auto_122032 ) ) ( not ( = ?auto_122034 ?auto_122036 ) ) ( not ( = ?auto_122033 ?auto_122030 ) ) ( not ( = ?auto_122033 ?auto_122032 ) ) ( not ( = ?auto_122033 ?auto_122036 ) ) ( not ( = ?auto_122030 ?auto_122032 ) ) ( not ( = ?auto_122030 ?auto_122036 ) ) ( not ( = ?auto_122032 ?auto_122036 ) ) ( not ( = ?auto_122029 ?auto_122032 ) ) ( not ( = ?auto_122029 ?auto_122034 ) ) ( not ( = ?auto_122029 ?auto_122033 ) ) ( not ( = ?auto_122029 ?auto_122030 ) ) ( not ( = ?auto_122035 ?auto_122032 ) ) ( not ( = ?auto_122035 ?auto_122034 ) ) ( not ( = ?auto_122035 ?auto_122033 ) ) ( not ( = ?auto_122035 ?auto_122030 ) ) ( not ( = ?auto_122031 ?auto_122032 ) ) ( not ( = ?auto_122031 ?auto_122034 ) ) ( not ( = ?auto_122031 ?auto_122033 ) ) ( not ( = ?auto_122031 ?auto_122030 ) ) ( ON ?auto_122036 ?auto_122031 ) ( ON ?auto_122032 ?auto_122036 ) ( CLEAR ?auto_122032 ) ( HOLDING ?auto_122030 ) ( CLEAR ?auto_122033 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122034 ?auto_122033 ?auto_122030 )
      ( MAKE-1PILE ?auto_122029 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122037 - BLOCK
    )
    :vars
    (
      ?auto_122039 - BLOCK
      ?auto_122041 - BLOCK
      ?auto_122044 - BLOCK
      ?auto_122043 - BLOCK
      ?auto_122040 - BLOCK
      ?auto_122038 - BLOCK
      ?auto_122042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122039 ?auto_122037 ) ( ON-TABLE ?auto_122037 ) ( not ( = ?auto_122037 ?auto_122039 ) ) ( not ( = ?auto_122037 ?auto_122041 ) ) ( not ( = ?auto_122037 ?auto_122044 ) ) ( not ( = ?auto_122039 ?auto_122041 ) ) ( not ( = ?auto_122039 ?auto_122044 ) ) ( not ( = ?auto_122041 ?auto_122044 ) ) ( ON ?auto_122041 ?auto_122039 ) ( ON-TABLE ?auto_122043 ) ( ON ?auto_122040 ?auto_122043 ) ( not ( = ?auto_122043 ?auto_122040 ) ) ( not ( = ?auto_122043 ?auto_122038 ) ) ( not ( = ?auto_122043 ?auto_122042 ) ) ( not ( = ?auto_122043 ?auto_122044 ) ) ( not ( = ?auto_122040 ?auto_122038 ) ) ( not ( = ?auto_122040 ?auto_122042 ) ) ( not ( = ?auto_122040 ?auto_122044 ) ) ( not ( = ?auto_122038 ?auto_122042 ) ) ( not ( = ?auto_122038 ?auto_122044 ) ) ( not ( = ?auto_122042 ?auto_122044 ) ) ( not ( = ?auto_122037 ?auto_122042 ) ) ( not ( = ?auto_122037 ?auto_122043 ) ) ( not ( = ?auto_122037 ?auto_122040 ) ) ( not ( = ?auto_122037 ?auto_122038 ) ) ( not ( = ?auto_122039 ?auto_122042 ) ) ( not ( = ?auto_122039 ?auto_122043 ) ) ( not ( = ?auto_122039 ?auto_122040 ) ) ( not ( = ?auto_122039 ?auto_122038 ) ) ( not ( = ?auto_122041 ?auto_122042 ) ) ( not ( = ?auto_122041 ?auto_122043 ) ) ( not ( = ?auto_122041 ?auto_122040 ) ) ( not ( = ?auto_122041 ?auto_122038 ) ) ( ON ?auto_122044 ?auto_122041 ) ( ON ?auto_122042 ?auto_122044 ) ( CLEAR ?auto_122040 ) ( ON ?auto_122038 ?auto_122042 ) ( CLEAR ?auto_122038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122037 ?auto_122039 ?auto_122041 ?auto_122044 ?auto_122042 )
      ( MAKE-1PILE ?auto_122037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122045 - BLOCK
    )
    :vars
    (
      ?auto_122046 - BLOCK
      ?auto_122048 - BLOCK
      ?auto_122049 - BLOCK
      ?auto_122047 - BLOCK
      ?auto_122051 - BLOCK
      ?auto_122050 - BLOCK
      ?auto_122052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122046 ?auto_122045 ) ( ON-TABLE ?auto_122045 ) ( not ( = ?auto_122045 ?auto_122046 ) ) ( not ( = ?auto_122045 ?auto_122048 ) ) ( not ( = ?auto_122045 ?auto_122049 ) ) ( not ( = ?auto_122046 ?auto_122048 ) ) ( not ( = ?auto_122046 ?auto_122049 ) ) ( not ( = ?auto_122048 ?auto_122049 ) ) ( ON ?auto_122048 ?auto_122046 ) ( ON-TABLE ?auto_122047 ) ( not ( = ?auto_122047 ?auto_122051 ) ) ( not ( = ?auto_122047 ?auto_122050 ) ) ( not ( = ?auto_122047 ?auto_122052 ) ) ( not ( = ?auto_122047 ?auto_122049 ) ) ( not ( = ?auto_122051 ?auto_122050 ) ) ( not ( = ?auto_122051 ?auto_122052 ) ) ( not ( = ?auto_122051 ?auto_122049 ) ) ( not ( = ?auto_122050 ?auto_122052 ) ) ( not ( = ?auto_122050 ?auto_122049 ) ) ( not ( = ?auto_122052 ?auto_122049 ) ) ( not ( = ?auto_122045 ?auto_122052 ) ) ( not ( = ?auto_122045 ?auto_122047 ) ) ( not ( = ?auto_122045 ?auto_122051 ) ) ( not ( = ?auto_122045 ?auto_122050 ) ) ( not ( = ?auto_122046 ?auto_122052 ) ) ( not ( = ?auto_122046 ?auto_122047 ) ) ( not ( = ?auto_122046 ?auto_122051 ) ) ( not ( = ?auto_122046 ?auto_122050 ) ) ( not ( = ?auto_122048 ?auto_122052 ) ) ( not ( = ?auto_122048 ?auto_122047 ) ) ( not ( = ?auto_122048 ?auto_122051 ) ) ( not ( = ?auto_122048 ?auto_122050 ) ) ( ON ?auto_122049 ?auto_122048 ) ( ON ?auto_122052 ?auto_122049 ) ( ON ?auto_122050 ?auto_122052 ) ( CLEAR ?auto_122050 ) ( HOLDING ?auto_122051 ) ( CLEAR ?auto_122047 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122047 ?auto_122051 )
      ( MAKE-1PILE ?auto_122045 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122053 - BLOCK
    )
    :vars
    (
      ?auto_122057 - BLOCK
      ?auto_122055 - BLOCK
      ?auto_122054 - BLOCK
      ?auto_122059 - BLOCK
      ?auto_122058 - BLOCK
      ?auto_122056 - BLOCK
      ?auto_122060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122057 ?auto_122053 ) ( ON-TABLE ?auto_122053 ) ( not ( = ?auto_122053 ?auto_122057 ) ) ( not ( = ?auto_122053 ?auto_122055 ) ) ( not ( = ?auto_122053 ?auto_122054 ) ) ( not ( = ?auto_122057 ?auto_122055 ) ) ( not ( = ?auto_122057 ?auto_122054 ) ) ( not ( = ?auto_122055 ?auto_122054 ) ) ( ON ?auto_122055 ?auto_122057 ) ( ON-TABLE ?auto_122059 ) ( not ( = ?auto_122059 ?auto_122058 ) ) ( not ( = ?auto_122059 ?auto_122056 ) ) ( not ( = ?auto_122059 ?auto_122060 ) ) ( not ( = ?auto_122059 ?auto_122054 ) ) ( not ( = ?auto_122058 ?auto_122056 ) ) ( not ( = ?auto_122058 ?auto_122060 ) ) ( not ( = ?auto_122058 ?auto_122054 ) ) ( not ( = ?auto_122056 ?auto_122060 ) ) ( not ( = ?auto_122056 ?auto_122054 ) ) ( not ( = ?auto_122060 ?auto_122054 ) ) ( not ( = ?auto_122053 ?auto_122060 ) ) ( not ( = ?auto_122053 ?auto_122059 ) ) ( not ( = ?auto_122053 ?auto_122058 ) ) ( not ( = ?auto_122053 ?auto_122056 ) ) ( not ( = ?auto_122057 ?auto_122060 ) ) ( not ( = ?auto_122057 ?auto_122059 ) ) ( not ( = ?auto_122057 ?auto_122058 ) ) ( not ( = ?auto_122057 ?auto_122056 ) ) ( not ( = ?auto_122055 ?auto_122060 ) ) ( not ( = ?auto_122055 ?auto_122059 ) ) ( not ( = ?auto_122055 ?auto_122058 ) ) ( not ( = ?auto_122055 ?auto_122056 ) ) ( ON ?auto_122054 ?auto_122055 ) ( ON ?auto_122060 ?auto_122054 ) ( ON ?auto_122056 ?auto_122060 ) ( CLEAR ?auto_122059 ) ( ON ?auto_122058 ?auto_122056 ) ( CLEAR ?auto_122058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122053 ?auto_122057 ?auto_122055 ?auto_122054 ?auto_122060 ?auto_122056 )
      ( MAKE-1PILE ?auto_122053 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122061 - BLOCK
    )
    :vars
    (
      ?auto_122062 - BLOCK
      ?auto_122065 - BLOCK
      ?auto_122064 - BLOCK
      ?auto_122066 - BLOCK
      ?auto_122063 - BLOCK
      ?auto_122068 - BLOCK
      ?auto_122067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122062 ?auto_122061 ) ( ON-TABLE ?auto_122061 ) ( not ( = ?auto_122061 ?auto_122062 ) ) ( not ( = ?auto_122061 ?auto_122065 ) ) ( not ( = ?auto_122061 ?auto_122064 ) ) ( not ( = ?auto_122062 ?auto_122065 ) ) ( not ( = ?auto_122062 ?auto_122064 ) ) ( not ( = ?auto_122065 ?auto_122064 ) ) ( ON ?auto_122065 ?auto_122062 ) ( not ( = ?auto_122066 ?auto_122063 ) ) ( not ( = ?auto_122066 ?auto_122068 ) ) ( not ( = ?auto_122066 ?auto_122067 ) ) ( not ( = ?auto_122066 ?auto_122064 ) ) ( not ( = ?auto_122063 ?auto_122068 ) ) ( not ( = ?auto_122063 ?auto_122067 ) ) ( not ( = ?auto_122063 ?auto_122064 ) ) ( not ( = ?auto_122068 ?auto_122067 ) ) ( not ( = ?auto_122068 ?auto_122064 ) ) ( not ( = ?auto_122067 ?auto_122064 ) ) ( not ( = ?auto_122061 ?auto_122067 ) ) ( not ( = ?auto_122061 ?auto_122066 ) ) ( not ( = ?auto_122061 ?auto_122063 ) ) ( not ( = ?auto_122061 ?auto_122068 ) ) ( not ( = ?auto_122062 ?auto_122067 ) ) ( not ( = ?auto_122062 ?auto_122066 ) ) ( not ( = ?auto_122062 ?auto_122063 ) ) ( not ( = ?auto_122062 ?auto_122068 ) ) ( not ( = ?auto_122065 ?auto_122067 ) ) ( not ( = ?auto_122065 ?auto_122066 ) ) ( not ( = ?auto_122065 ?auto_122063 ) ) ( not ( = ?auto_122065 ?auto_122068 ) ) ( ON ?auto_122064 ?auto_122065 ) ( ON ?auto_122067 ?auto_122064 ) ( ON ?auto_122068 ?auto_122067 ) ( ON ?auto_122063 ?auto_122068 ) ( CLEAR ?auto_122063 ) ( HOLDING ?auto_122066 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122066 )
      ( MAKE-1PILE ?auto_122061 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122069 - BLOCK
    )
    :vars
    (
      ?auto_122074 - BLOCK
      ?auto_122073 - BLOCK
      ?auto_122075 - BLOCK
      ?auto_122071 - BLOCK
      ?auto_122072 - BLOCK
      ?auto_122070 - BLOCK
      ?auto_122076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122074 ?auto_122069 ) ( ON-TABLE ?auto_122069 ) ( not ( = ?auto_122069 ?auto_122074 ) ) ( not ( = ?auto_122069 ?auto_122073 ) ) ( not ( = ?auto_122069 ?auto_122075 ) ) ( not ( = ?auto_122074 ?auto_122073 ) ) ( not ( = ?auto_122074 ?auto_122075 ) ) ( not ( = ?auto_122073 ?auto_122075 ) ) ( ON ?auto_122073 ?auto_122074 ) ( not ( = ?auto_122071 ?auto_122072 ) ) ( not ( = ?auto_122071 ?auto_122070 ) ) ( not ( = ?auto_122071 ?auto_122076 ) ) ( not ( = ?auto_122071 ?auto_122075 ) ) ( not ( = ?auto_122072 ?auto_122070 ) ) ( not ( = ?auto_122072 ?auto_122076 ) ) ( not ( = ?auto_122072 ?auto_122075 ) ) ( not ( = ?auto_122070 ?auto_122076 ) ) ( not ( = ?auto_122070 ?auto_122075 ) ) ( not ( = ?auto_122076 ?auto_122075 ) ) ( not ( = ?auto_122069 ?auto_122076 ) ) ( not ( = ?auto_122069 ?auto_122071 ) ) ( not ( = ?auto_122069 ?auto_122072 ) ) ( not ( = ?auto_122069 ?auto_122070 ) ) ( not ( = ?auto_122074 ?auto_122076 ) ) ( not ( = ?auto_122074 ?auto_122071 ) ) ( not ( = ?auto_122074 ?auto_122072 ) ) ( not ( = ?auto_122074 ?auto_122070 ) ) ( not ( = ?auto_122073 ?auto_122076 ) ) ( not ( = ?auto_122073 ?auto_122071 ) ) ( not ( = ?auto_122073 ?auto_122072 ) ) ( not ( = ?auto_122073 ?auto_122070 ) ) ( ON ?auto_122075 ?auto_122073 ) ( ON ?auto_122076 ?auto_122075 ) ( ON ?auto_122070 ?auto_122076 ) ( ON ?auto_122072 ?auto_122070 ) ( ON ?auto_122071 ?auto_122072 ) ( CLEAR ?auto_122071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122069 ?auto_122074 ?auto_122073 ?auto_122075 ?auto_122076 ?auto_122070 ?auto_122072 )
      ( MAKE-1PILE ?auto_122069 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122084 - BLOCK
      ?auto_122085 - BLOCK
      ?auto_122086 - BLOCK
      ?auto_122087 - BLOCK
      ?auto_122088 - BLOCK
      ?auto_122089 - BLOCK
      ?auto_122090 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_122090 ) ( CLEAR ?auto_122089 ) ( ON-TABLE ?auto_122084 ) ( ON ?auto_122085 ?auto_122084 ) ( ON ?auto_122086 ?auto_122085 ) ( ON ?auto_122087 ?auto_122086 ) ( ON ?auto_122088 ?auto_122087 ) ( ON ?auto_122089 ?auto_122088 ) ( not ( = ?auto_122084 ?auto_122085 ) ) ( not ( = ?auto_122084 ?auto_122086 ) ) ( not ( = ?auto_122084 ?auto_122087 ) ) ( not ( = ?auto_122084 ?auto_122088 ) ) ( not ( = ?auto_122084 ?auto_122089 ) ) ( not ( = ?auto_122084 ?auto_122090 ) ) ( not ( = ?auto_122085 ?auto_122086 ) ) ( not ( = ?auto_122085 ?auto_122087 ) ) ( not ( = ?auto_122085 ?auto_122088 ) ) ( not ( = ?auto_122085 ?auto_122089 ) ) ( not ( = ?auto_122085 ?auto_122090 ) ) ( not ( = ?auto_122086 ?auto_122087 ) ) ( not ( = ?auto_122086 ?auto_122088 ) ) ( not ( = ?auto_122086 ?auto_122089 ) ) ( not ( = ?auto_122086 ?auto_122090 ) ) ( not ( = ?auto_122087 ?auto_122088 ) ) ( not ( = ?auto_122087 ?auto_122089 ) ) ( not ( = ?auto_122087 ?auto_122090 ) ) ( not ( = ?auto_122088 ?auto_122089 ) ) ( not ( = ?auto_122088 ?auto_122090 ) ) ( not ( = ?auto_122089 ?auto_122090 ) ) )
    :subtasks
    ( ( !STACK ?auto_122090 ?auto_122089 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122091 - BLOCK
      ?auto_122092 - BLOCK
      ?auto_122093 - BLOCK
      ?auto_122094 - BLOCK
      ?auto_122095 - BLOCK
      ?auto_122096 - BLOCK
      ?auto_122097 - BLOCK
    )
    :vars
    (
      ?auto_122098 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_122096 ) ( ON-TABLE ?auto_122091 ) ( ON ?auto_122092 ?auto_122091 ) ( ON ?auto_122093 ?auto_122092 ) ( ON ?auto_122094 ?auto_122093 ) ( ON ?auto_122095 ?auto_122094 ) ( ON ?auto_122096 ?auto_122095 ) ( not ( = ?auto_122091 ?auto_122092 ) ) ( not ( = ?auto_122091 ?auto_122093 ) ) ( not ( = ?auto_122091 ?auto_122094 ) ) ( not ( = ?auto_122091 ?auto_122095 ) ) ( not ( = ?auto_122091 ?auto_122096 ) ) ( not ( = ?auto_122091 ?auto_122097 ) ) ( not ( = ?auto_122092 ?auto_122093 ) ) ( not ( = ?auto_122092 ?auto_122094 ) ) ( not ( = ?auto_122092 ?auto_122095 ) ) ( not ( = ?auto_122092 ?auto_122096 ) ) ( not ( = ?auto_122092 ?auto_122097 ) ) ( not ( = ?auto_122093 ?auto_122094 ) ) ( not ( = ?auto_122093 ?auto_122095 ) ) ( not ( = ?auto_122093 ?auto_122096 ) ) ( not ( = ?auto_122093 ?auto_122097 ) ) ( not ( = ?auto_122094 ?auto_122095 ) ) ( not ( = ?auto_122094 ?auto_122096 ) ) ( not ( = ?auto_122094 ?auto_122097 ) ) ( not ( = ?auto_122095 ?auto_122096 ) ) ( not ( = ?auto_122095 ?auto_122097 ) ) ( not ( = ?auto_122096 ?auto_122097 ) ) ( ON ?auto_122097 ?auto_122098 ) ( CLEAR ?auto_122097 ) ( HAND-EMPTY ) ( not ( = ?auto_122091 ?auto_122098 ) ) ( not ( = ?auto_122092 ?auto_122098 ) ) ( not ( = ?auto_122093 ?auto_122098 ) ) ( not ( = ?auto_122094 ?auto_122098 ) ) ( not ( = ?auto_122095 ?auto_122098 ) ) ( not ( = ?auto_122096 ?auto_122098 ) ) ( not ( = ?auto_122097 ?auto_122098 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122097 ?auto_122098 )
      ( MAKE-7PILE ?auto_122091 ?auto_122092 ?auto_122093 ?auto_122094 ?auto_122095 ?auto_122096 ?auto_122097 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122099 - BLOCK
      ?auto_122100 - BLOCK
      ?auto_122101 - BLOCK
      ?auto_122102 - BLOCK
      ?auto_122103 - BLOCK
      ?auto_122104 - BLOCK
      ?auto_122105 - BLOCK
    )
    :vars
    (
      ?auto_122106 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122099 ) ( ON ?auto_122100 ?auto_122099 ) ( ON ?auto_122101 ?auto_122100 ) ( ON ?auto_122102 ?auto_122101 ) ( ON ?auto_122103 ?auto_122102 ) ( not ( = ?auto_122099 ?auto_122100 ) ) ( not ( = ?auto_122099 ?auto_122101 ) ) ( not ( = ?auto_122099 ?auto_122102 ) ) ( not ( = ?auto_122099 ?auto_122103 ) ) ( not ( = ?auto_122099 ?auto_122104 ) ) ( not ( = ?auto_122099 ?auto_122105 ) ) ( not ( = ?auto_122100 ?auto_122101 ) ) ( not ( = ?auto_122100 ?auto_122102 ) ) ( not ( = ?auto_122100 ?auto_122103 ) ) ( not ( = ?auto_122100 ?auto_122104 ) ) ( not ( = ?auto_122100 ?auto_122105 ) ) ( not ( = ?auto_122101 ?auto_122102 ) ) ( not ( = ?auto_122101 ?auto_122103 ) ) ( not ( = ?auto_122101 ?auto_122104 ) ) ( not ( = ?auto_122101 ?auto_122105 ) ) ( not ( = ?auto_122102 ?auto_122103 ) ) ( not ( = ?auto_122102 ?auto_122104 ) ) ( not ( = ?auto_122102 ?auto_122105 ) ) ( not ( = ?auto_122103 ?auto_122104 ) ) ( not ( = ?auto_122103 ?auto_122105 ) ) ( not ( = ?auto_122104 ?auto_122105 ) ) ( ON ?auto_122105 ?auto_122106 ) ( CLEAR ?auto_122105 ) ( not ( = ?auto_122099 ?auto_122106 ) ) ( not ( = ?auto_122100 ?auto_122106 ) ) ( not ( = ?auto_122101 ?auto_122106 ) ) ( not ( = ?auto_122102 ?auto_122106 ) ) ( not ( = ?auto_122103 ?auto_122106 ) ) ( not ( = ?auto_122104 ?auto_122106 ) ) ( not ( = ?auto_122105 ?auto_122106 ) ) ( HOLDING ?auto_122104 ) ( CLEAR ?auto_122103 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122099 ?auto_122100 ?auto_122101 ?auto_122102 ?auto_122103 ?auto_122104 )
      ( MAKE-7PILE ?auto_122099 ?auto_122100 ?auto_122101 ?auto_122102 ?auto_122103 ?auto_122104 ?auto_122105 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122107 - BLOCK
      ?auto_122108 - BLOCK
      ?auto_122109 - BLOCK
      ?auto_122110 - BLOCK
      ?auto_122111 - BLOCK
      ?auto_122112 - BLOCK
      ?auto_122113 - BLOCK
    )
    :vars
    (
      ?auto_122114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122107 ) ( ON ?auto_122108 ?auto_122107 ) ( ON ?auto_122109 ?auto_122108 ) ( ON ?auto_122110 ?auto_122109 ) ( ON ?auto_122111 ?auto_122110 ) ( not ( = ?auto_122107 ?auto_122108 ) ) ( not ( = ?auto_122107 ?auto_122109 ) ) ( not ( = ?auto_122107 ?auto_122110 ) ) ( not ( = ?auto_122107 ?auto_122111 ) ) ( not ( = ?auto_122107 ?auto_122112 ) ) ( not ( = ?auto_122107 ?auto_122113 ) ) ( not ( = ?auto_122108 ?auto_122109 ) ) ( not ( = ?auto_122108 ?auto_122110 ) ) ( not ( = ?auto_122108 ?auto_122111 ) ) ( not ( = ?auto_122108 ?auto_122112 ) ) ( not ( = ?auto_122108 ?auto_122113 ) ) ( not ( = ?auto_122109 ?auto_122110 ) ) ( not ( = ?auto_122109 ?auto_122111 ) ) ( not ( = ?auto_122109 ?auto_122112 ) ) ( not ( = ?auto_122109 ?auto_122113 ) ) ( not ( = ?auto_122110 ?auto_122111 ) ) ( not ( = ?auto_122110 ?auto_122112 ) ) ( not ( = ?auto_122110 ?auto_122113 ) ) ( not ( = ?auto_122111 ?auto_122112 ) ) ( not ( = ?auto_122111 ?auto_122113 ) ) ( not ( = ?auto_122112 ?auto_122113 ) ) ( ON ?auto_122113 ?auto_122114 ) ( not ( = ?auto_122107 ?auto_122114 ) ) ( not ( = ?auto_122108 ?auto_122114 ) ) ( not ( = ?auto_122109 ?auto_122114 ) ) ( not ( = ?auto_122110 ?auto_122114 ) ) ( not ( = ?auto_122111 ?auto_122114 ) ) ( not ( = ?auto_122112 ?auto_122114 ) ) ( not ( = ?auto_122113 ?auto_122114 ) ) ( CLEAR ?auto_122111 ) ( ON ?auto_122112 ?auto_122113 ) ( CLEAR ?auto_122112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122114 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122114 ?auto_122113 )
      ( MAKE-7PILE ?auto_122107 ?auto_122108 ?auto_122109 ?auto_122110 ?auto_122111 ?auto_122112 ?auto_122113 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122115 - BLOCK
      ?auto_122116 - BLOCK
      ?auto_122117 - BLOCK
      ?auto_122118 - BLOCK
      ?auto_122119 - BLOCK
      ?auto_122120 - BLOCK
      ?auto_122121 - BLOCK
    )
    :vars
    (
      ?auto_122122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122115 ) ( ON ?auto_122116 ?auto_122115 ) ( ON ?auto_122117 ?auto_122116 ) ( ON ?auto_122118 ?auto_122117 ) ( not ( = ?auto_122115 ?auto_122116 ) ) ( not ( = ?auto_122115 ?auto_122117 ) ) ( not ( = ?auto_122115 ?auto_122118 ) ) ( not ( = ?auto_122115 ?auto_122119 ) ) ( not ( = ?auto_122115 ?auto_122120 ) ) ( not ( = ?auto_122115 ?auto_122121 ) ) ( not ( = ?auto_122116 ?auto_122117 ) ) ( not ( = ?auto_122116 ?auto_122118 ) ) ( not ( = ?auto_122116 ?auto_122119 ) ) ( not ( = ?auto_122116 ?auto_122120 ) ) ( not ( = ?auto_122116 ?auto_122121 ) ) ( not ( = ?auto_122117 ?auto_122118 ) ) ( not ( = ?auto_122117 ?auto_122119 ) ) ( not ( = ?auto_122117 ?auto_122120 ) ) ( not ( = ?auto_122117 ?auto_122121 ) ) ( not ( = ?auto_122118 ?auto_122119 ) ) ( not ( = ?auto_122118 ?auto_122120 ) ) ( not ( = ?auto_122118 ?auto_122121 ) ) ( not ( = ?auto_122119 ?auto_122120 ) ) ( not ( = ?auto_122119 ?auto_122121 ) ) ( not ( = ?auto_122120 ?auto_122121 ) ) ( ON ?auto_122121 ?auto_122122 ) ( not ( = ?auto_122115 ?auto_122122 ) ) ( not ( = ?auto_122116 ?auto_122122 ) ) ( not ( = ?auto_122117 ?auto_122122 ) ) ( not ( = ?auto_122118 ?auto_122122 ) ) ( not ( = ?auto_122119 ?auto_122122 ) ) ( not ( = ?auto_122120 ?auto_122122 ) ) ( not ( = ?auto_122121 ?auto_122122 ) ) ( ON ?auto_122120 ?auto_122121 ) ( CLEAR ?auto_122120 ) ( ON-TABLE ?auto_122122 ) ( HOLDING ?auto_122119 ) ( CLEAR ?auto_122118 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122115 ?auto_122116 ?auto_122117 ?auto_122118 ?auto_122119 )
      ( MAKE-7PILE ?auto_122115 ?auto_122116 ?auto_122117 ?auto_122118 ?auto_122119 ?auto_122120 ?auto_122121 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122123 - BLOCK
      ?auto_122124 - BLOCK
      ?auto_122125 - BLOCK
      ?auto_122126 - BLOCK
      ?auto_122127 - BLOCK
      ?auto_122128 - BLOCK
      ?auto_122129 - BLOCK
    )
    :vars
    (
      ?auto_122130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122123 ) ( ON ?auto_122124 ?auto_122123 ) ( ON ?auto_122125 ?auto_122124 ) ( ON ?auto_122126 ?auto_122125 ) ( not ( = ?auto_122123 ?auto_122124 ) ) ( not ( = ?auto_122123 ?auto_122125 ) ) ( not ( = ?auto_122123 ?auto_122126 ) ) ( not ( = ?auto_122123 ?auto_122127 ) ) ( not ( = ?auto_122123 ?auto_122128 ) ) ( not ( = ?auto_122123 ?auto_122129 ) ) ( not ( = ?auto_122124 ?auto_122125 ) ) ( not ( = ?auto_122124 ?auto_122126 ) ) ( not ( = ?auto_122124 ?auto_122127 ) ) ( not ( = ?auto_122124 ?auto_122128 ) ) ( not ( = ?auto_122124 ?auto_122129 ) ) ( not ( = ?auto_122125 ?auto_122126 ) ) ( not ( = ?auto_122125 ?auto_122127 ) ) ( not ( = ?auto_122125 ?auto_122128 ) ) ( not ( = ?auto_122125 ?auto_122129 ) ) ( not ( = ?auto_122126 ?auto_122127 ) ) ( not ( = ?auto_122126 ?auto_122128 ) ) ( not ( = ?auto_122126 ?auto_122129 ) ) ( not ( = ?auto_122127 ?auto_122128 ) ) ( not ( = ?auto_122127 ?auto_122129 ) ) ( not ( = ?auto_122128 ?auto_122129 ) ) ( ON ?auto_122129 ?auto_122130 ) ( not ( = ?auto_122123 ?auto_122130 ) ) ( not ( = ?auto_122124 ?auto_122130 ) ) ( not ( = ?auto_122125 ?auto_122130 ) ) ( not ( = ?auto_122126 ?auto_122130 ) ) ( not ( = ?auto_122127 ?auto_122130 ) ) ( not ( = ?auto_122128 ?auto_122130 ) ) ( not ( = ?auto_122129 ?auto_122130 ) ) ( ON ?auto_122128 ?auto_122129 ) ( ON-TABLE ?auto_122130 ) ( CLEAR ?auto_122126 ) ( ON ?auto_122127 ?auto_122128 ) ( CLEAR ?auto_122127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122130 ?auto_122129 ?auto_122128 )
      ( MAKE-7PILE ?auto_122123 ?auto_122124 ?auto_122125 ?auto_122126 ?auto_122127 ?auto_122128 ?auto_122129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122131 - BLOCK
      ?auto_122132 - BLOCK
      ?auto_122133 - BLOCK
      ?auto_122134 - BLOCK
      ?auto_122135 - BLOCK
      ?auto_122136 - BLOCK
      ?auto_122137 - BLOCK
    )
    :vars
    (
      ?auto_122138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122131 ) ( ON ?auto_122132 ?auto_122131 ) ( ON ?auto_122133 ?auto_122132 ) ( not ( = ?auto_122131 ?auto_122132 ) ) ( not ( = ?auto_122131 ?auto_122133 ) ) ( not ( = ?auto_122131 ?auto_122134 ) ) ( not ( = ?auto_122131 ?auto_122135 ) ) ( not ( = ?auto_122131 ?auto_122136 ) ) ( not ( = ?auto_122131 ?auto_122137 ) ) ( not ( = ?auto_122132 ?auto_122133 ) ) ( not ( = ?auto_122132 ?auto_122134 ) ) ( not ( = ?auto_122132 ?auto_122135 ) ) ( not ( = ?auto_122132 ?auto_122136 ) ) ( not ( = ?auto_122132 ?auto_122137 ) ) ( not ( = ?auto_122133 ?auto_122134 ) ) ( not ( = ?auto_122133 ?auto_122135 ) ) ( not ( = ?auto_122133 ?auto_122136 ) ) ( not ( = ?auto_122133 ?auto_122137 ) ) ( not ( = ?auto_122134 ?auto_122135 ) ) ( not ( = ?auto_122134 ?auto_122136 ) ) ( not ( = ?auto_122134 ?auto_122137 ) ) ( not ( = ?auto_122135 ?auto_122136 ) ) ( not ( = ?auto_122135 ?auto_122137 ) ) ( not ( = ?auto_122136 ?auto_122137 ) ) ( ON ?auto_122137 ?auto_122138 ) ( not ( = ?auto_122131 ?auto_122138 ) ) ( not ( = ?auto_122132 ?auto_122138 ) ) ( not ( = ?auto_122133 ?auto_122138 ) ) ( not ( = ?auto_122134 ?auto_122138 ) ) ( not ( = ?auto_122135 ?auto_122138 ) ) ( not ( = ?auto_122136 ?auto_122138 ) ) ( not ( = ?auto_122137 ?auto_122138 ) ) ( ON ?auto_122136 ?auto_122137 ) ( ON-TABLE ?auto_122138 ) ( ON ?auto_122135 ?auto_122136 ) ( CLEAR ?auto_122135 ) ( HOLDING ?auto_122134 ) ( CLEAR ?auto_122133 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122131 ?auto_122132 ?auto_122133 ?auto_122134 )
      ( MAKE-7PILE ?auto_122131 ?auto_122132 ?auto_122133 ?auto_122134 ?auto_122135 ?auto_122136 ?auto_122137 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122139 - BLOCK
      ?auto_122140 - BLOCK
      ?auto_122141 - BLOCK
      ?auto_122142 - BLOCK
      ?auto_122143 - BLOCK
      ?auto_122144 - BLOCK
      ?auto_122145 - BLOCK
    )
    :vars
    (
      ?auto_122146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122139 ) ( ON ?auto_122140 ?auto_122139 ) ( ON ?auto_122141 ?auto_122140 ) ( not ( = ?auto_122139 ?auto_122140 ) ) ( not ( = ?auto_122139 ?auto_122141 ) ) ( not ( = ?auto_122139 ?auto_122142 ) ) ( not ( = ?auto_122139 ?auto_122143 ) ) ( not ( = ?auto_122139 ?auto_122144 ) ) ( not ( = ?auto_122139 ?auto_122145 ) ) ( not ( = ?auto_122140 ?auto_122141 ) ) ( not ( = ?auto_122140 ?auto_122142 ) ) ( not ( = ?auto_122140 ?auto_122143 ) ) ( not ( = ?auto_122140 ?auto_122144 ) ) ( not ( = ?auto_122140 ?auto_122145 ) ) ( not ( = ?auto_122141 ?auto_122142 ) ) ( not ( = ?auto_122141 ?auto_122143 ) ) ( not ( = ?auto_122141 ?auto_122144 ) ) ( not ( = ?auto_122141 ?auto_122145 ) ) ( not ( = ?auto_122142 ?auto_122143 ) ) ( not ( = ?auto_122142 ?auto_122144 ) ) ( not ( = ?auto_122142 ?auto_122145 ) ) ( not ( = ?auto_122143 ?auto_122144 ) ) ( not ( = ?auto_122143 ?auto_122145 ) ) ( not ( = ?auto_122144 ?auto_122145 ) ) ( ON ?auto_122145 ?auto_122146 ) ( not ( = ?auto_122139 ?auto_122146 ) ) ( not ( = ?auto_122140 ?auto_122146 ) ) ( not ( = ?auto_122141 ?auto_122146 ) ) ( not ( = ?auto_122142 ?auto_122146 ) ) ( not ( = ?auto_122143 ?auto_122146 ) ) ( not ( = ?auto_122144 ?auto_122146 ) ) ( not ( = ?auto_122145 ?auto_122146 ) ) ( ON ?auto_122144 ?auto_122145 ) ( ON-TABLE ?auto_122146 ) ( ON ?auto_122143 ?auto_122144 ) ( CLEAR ?auto_122141 ) ( ON ?auto_122142 ?auto_122143 ) ( CLEAR ?auto_122142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122146 ?auto_122145 ?auto_122144 ?auto_122143 )
      ( MAKE-7PILE ?auto_122139 ?auto_122140 ?auto_122141 ?auto_122142 ?auto_122143 ?auto_122144 ?auto_122145 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122147 - BLOCK
      ?auto_122148 - BLOCK
      ?auto_122149 - BLOCK
      ?auto_122150 - BLOCK
      ?auto_122151 - BLOCK
      ?auto_122152 - BLOCK
      ?auto_122153 - BLOCK
    )
    :vars
    (
      ?auto_122154 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122147 ) ( ON ?auto_122148 ?auto_122147 ) ( not ( = ?auto_122147 ?auto_122148 ) ) ( not ( = ?auto_122147 ?auto_122149 ) ) ( not ( = ?auto_122147 ?auto_122150 ) ) ( not ( = ?auto_122147 ?auto_122151 ) ) ( not ( = ?auto_122147 ?auto_122152 ) ) ( not ( = ?auto_122147 ?auto_122153 ) ) ( not ( = ?auto_122148 ?auto_122149 ) ) ( not ( = ?auto_122148 ?auto_122150 ) ) ( not ( = ?auto_122148 ?auto_122151 ) ) ( not ( = ?auto_122148 ?auto_122152 ) ) ( not ( = ?auto_122148 ?auto_122153 ) ) ( not ( = ?auto_122149 ?auto_122150 ) ) ( not ( = ?auto_122149 ?auto_122151 ) ) ( not ( = ?auto_122149 ?auto_122152 ) ) ( not ( = ?auto_122149 ?auto_122153 ) ) ( not ( = ?auto_122150 ?auto_122151 ) ) ( not ( = ?auto_122150 ?auto_122152 ) ) ( not ( = ?auto_122150 ?auto_122153 ) ) ( not ( = ?auto_122151 ?auto_122152 ) ) ( not ( = ?auto_122151 ?auto_122153 ) ) ( not ( = ?auto_122152 ?auto_122153 ) ) ( ON ?auto_122153 ?auto_122154 ) ( not ( = ?auto_122147 ?auto_122154 ) ) ( not ( = ?auto_122148 ?auto_122154 ) ) ( not ( = ?auto_122149 ?auto_122154 ) ) ( not ( = ?auto_122150 ?auto_122154 ) ) ( not ( = ?auto_122151 ?auto_122154 ) ) ( not ( = ?auto_122152 ?auto_122154 ) ) ( not ( = ?auto_122153 ?auto_122154 ) ) ( ON ?auto_122152 ?auto_122153 ) ( ON-TABLE ?auto_122154 ) ( ON ?auto_122151 ?auto_122152 ) ( ON ?auto_122150 ?auto_122151 ) ( CLEAR ?auto_122150 ) ( HOLDING ?auto_122149 ) ( CLEAR ?auto_122148 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122147 ?auto_122148 ?auto_122149 )
      ( MAKE-7PILE ?auto_122147 ?auto_122148 ?auto_122149 ?auto_122150 ?auto_122151 ?auto_122152 ?auto_122153 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122155 - BLOCK
      ?auto_122156 - BLOCK
      ?auto_122157 - BLOCK
      ?auto_122158 - BLOCK
      ?auto_122159 - BLOCK
      ?auto_122160 - BLOCK
      ?auto_122161 - BLOCK
    )
    :vars
    (
      ?auto_122162 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122155 ) ( ON ?auto_122156 ?auto_122155 ) ( not ( = ?auto_122155 ?auto_122156 ) ) ( not ( = ?auto_122155 ?auto_122157 ) ) ( not ( = ?auto_122155 ?auto_122158 ) ) ( not ( = ?auto_122155 ?auto_122159 ) ) ( not ( = ?auto_122155 ?auto_122160 ) ) ( not ( = ?auto_122155 ?auto_122161 ) ) ( not ( = ?auto_122156 ?auto_122157 ) ) ( not ( = ?auto_122156 ?auto_122158 ) ) ( not ( = ?auto_122156 ?auto_122159 ) ) ( not ( = ?auto_122156 ?auto_122160 ) ) ( not ( = ?auto_122156 ?auto_122161 ) ) ( not ( = ?auto_122157 ?auto_122158 ) ) ( not ( = ?auto_122157 ?auto_122159 ) ) ( not ( = ?auto_122157 ?auto_122160 ) ) ( not ( = ?auto_122157 ?auto_122161 ) ) ( not ( = ?auto_122158 ?auto_122159 ) ) ( not ( = ?auto_122158 ?auto_122160 ) ) ( not ( = ?auto_122158 ?auto_122161 ) ) ( not ( = ?auto_122159 ?auto_122160 ) ) ( not ( = ?auto_122159 ?auto_122161 ) ) ( not ( = ?auto_122160 ?auto_122161 ) ) ( ON ?auto_122161 ?auto_122162 ) ( not ( = ?auto_122155 ?auto_122162 ) ) ( not ( = ?auto_122156 ?auto_122162 ) ) ( not ( = ?auto_122157 ?auto_122162 ) ) ( not ( = ?auto_122158 ?auto_122162 ) ) ( not ( = ?auto_122159 ?auto_122162 ) ) ( not ( = ?auto_122160 ?auto_122162 ) ) ( not ( = ?auto_122161 ?auto_122162 ) ) ( ON ?auto_122160 ?auto_122161 ) ( ON-TABLE ?auto_122162 ) ( ON ?auto_122159 ?auto_122160 ) ( ON ?auto_122158 ?auto_122159 ) ( CLEAR ?auto_122156 ) ( ON ?auto_122157 ?auto_122158 ) ( CLEAR ?auto_122157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122162 ?auto_122161 ?auto_122160 ?auto_122159 ?auto_122158 )
      ( MAKE-7PILE ?auto_122155 ?auto_122156 ?auto_122157 ?auto_122158 ?auto_122159 ?auto_122160 ?auto_122161 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122163 - BLOCK
      ?auto_122164 - BLOCK
      ?auto_122165 - BLOCK
      ?auto_122166 - BLOCK
      ?auto_122167 - BLOCK
      ?auto_122168 - BLOCK
      ?auto_122169 - BLOCK
    )
    :vars
    (
      ?auto_122170 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122163 ) ( not ( = ?auto_122163 ?auto_122164 ) ) ( not ( = ?auto_122163 ?auto_122165 ) ) ( not ( = ?auto_122163 ?auto_122166 ) ) ( not ( = ?auto_122163 ?auto_122167 ) ) ( not ( = ?auto_122163 ?auto_122168 ) ) ( not ( = ?auto_122163 ?auto_122169 ) ) ( not ( = ?auto_122164 ?auto_122165 ) ) ( not ( = ?auto_122164 ?auto_122166 ) ) ( not ( = ?auto_122164 ?auto_122167 ) ) ( not ( = ?auto_122164 ?auto_122168 ) ) ( not ( = ?auto_122164 ?auto_122169 ) ) ( not ( = ?auto_122165 ?auto_122166 ) ) ( not ( = ?auto_122165 ?auto_122167 ) ) ( not ( = ?auto_122165 ?auto_122168 ) ) ( not ( = ?auto_122165 ?auto_122169 ) ) ( not ( = ?auto_122166 ?auto_122167 ) ) ( not ( = ?auto_122166 ?auto_122168 ) ) ( not ( = ?auto_122166 ?auto_122169 ) ) ( not ( = ?auto_122167 ?auto_122168 ) ) ( not ( = ?auto_122167 ?auto_122169 ) ) ( not ( = ?auto_122168 ?auto_122169 ) ) ( ON ?auto_122169 ?auto_122170 ) ( not ( = ?auto_122163 ?auto_122170 ) ) ( not ( = ?auto_122164 ?auto_122170 ) ) ( not ( = ?auto_122165 ?auto_122170 ) ) ( not ( = ?auto_122166 ?auto_122170 ) ) ( not ( = ?auto_122167 ?auto_122170 ) ) ( not ( = ?auto_122168 ?auto_122170 ) ) ( not ( = ?auto_122169 ?auto_122170 ) ) ( ON ?auto_122168 ?auto_122169 ) ( ON-TABLE ?auto_122170 ) ( ON ?auto_122167 ?auto_122168 ) ( ON ?auto_122166 ?auto_122167 ) ( ON ?auto_122165 ?auto_122166 ) ( CLEAR ?auto_122165 ) ( HOLDING ?auto_122164 ) ( CLEAR ?auto_122163 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122163 ?auto_122164 )
      ( MAKE-7PILE ?auto_122163 ?auto_122164 ?auto_122165 ?auto_122166 ?auto_122167 ?auto_122168 ?auto_122169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122171 - BLOCK
      ?auto_122172 - BLOCK
      ?auto_122173 - BLOCK
      ?auto_122174 - BLOCK
      ?auto_122175 - BLOCK
      ?auto_122176 - BLOCK
      ?auto_122177 - BLOCK
    )
    :vars
    (
      ?auto_122178 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122171 ) ( not ( = ?auto_122171 ?auto_122172 ) ) ( not ( = ?auto_122171 ?auto_122173 ) ) ( not ( = ?auto_122171 ?auto_122174 ) ) ( not ( = ?auto_122171 ?auto_122175 ) ) ( not ( = ?auto_122171 ?auto_122176 ) ) ( not ( = ?auto_122171 ?auto_122177 ) ) ( not ( = ?auto_122172 ?auto_122173 ) ) ( not ( = ?auto_122172 ?auto_122174 ) ) ( not ( = ?auto_122172 ?auto_122175 ) ) ( not ( = ?auto_122172 ?auto_122176 ) ) ( not ( = ?auto_122172 ?auto_122177 ) ) ( not ( = ?auto_122173 ?auto_122174 ) ) ( not ( = ?auto_122173 ?auto_122175 ) ) ( not ( = ?auto_122173 ?auto_122176 ) ) ( not ( = ?auto_122173 ?auto_122177 ) ) ( not ( = ?auto_122174 ?auto_122175 ) ) ( not ( = ?auto_122174 ?auto_122176 ) ) ( not ( = ?auto_122174 ?auto_122177 ) ) ( not ( = ?auto_122175 ?auto_122176 ) ) ( not ( = ?auto_122175 ?auto_122177 ) ) ( not ( = ?auto_122176 ?auto_122177 ) ) ( ON ?auto_122177 ?auto_122178 ) ( not ( = ?auto_122171 ?auto_122178 ) ) ( not ( = ?auto_122172 ?auto_122178 ) ) ( not ( = ?auto_122173 ?auto_122178 ) ) ( not ( = ?auto_122174 ?auto_122178 ) ) ( not ( = ?auto_122175 ?auto_122178 ) ) ( not ( = ?auto_122176 ?auto_122178 ) ) ( not ( = ?auto_122177 ?auto_122178 ) ) ( ON ?auto_122176 ?auto_122177 ) ( ON-TABLE ?auto_122178 ) ( ON ?auto_122175 ?auto_122176 ) ( ON ?auto_122174 ?auto_122175 ) ( ON ?auto_122173 ?auto_122174 ) ( CLEAR ?auto_122171 ) ( ON ?auto_122172 ?auto_122173 ) ( CLEAR ?auto_122172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122178 ?auto_122177 ?auto_122176 ?auto_122175 ?auto_122174 ?auto_122173 )
      ( MAKE-7PILE ?auto_122171 ?auto_122172 ?auto_122173 ?auto_122174 ?auto_122175 ?auto_122176 ?auto_122177 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122179 - BLOCK
      ?auto_122180 - BLOCK
      ?auto_122181 - BLOCK
      ?auto_122182 - BLOCK
      ?auto_122183 - BLOCK
      ?auto_122184 - BLOCK
      ?auto_122185 - BLOCK
    )
    :vars
    (
      ?auto_122186 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122179 ?auto_122180 ) ) ( not ( = ?auto_122179 ?auto_122181 ) ) ( not ( = ?auto_122179 ?auto_122182 ) ) ( not ( = ?auto_122179 ?auto_122183 ) ) ( not ( = ?auto_122179 ?auto_122184 ) ) ( not ( = ?auto_122179 ?auto_122185 ) ) ( not ( = ?auto_122180 ?auto_122181 ) ) ( not ( = ?auto_122180 ?auto_122182 ) ) ( not ( = ?auto_122180 ?auto_122183 ) ) ( not ( = ?auto_122180 ?auto_122184 ) ) ( not ( = ?auto_122180 ?auto_122185 ) ) ( not ( = ?auto_122181 ?auto_122182 ) ) ( not ( = ?auto_122181 ?auto_122183 ) ) ( not ( = ?auto_122181 ?auto_122184 ) ) ( not ( = ?auto_122181 ?auto_122185 ) ) ( not ( = ?auto_122182 ?auto_122183 ) ) ( not ( = ?auto_122182 ?auto_122184 ) ) ( not ( = ?auto_122182 ?auto_122185 ) ) ( not ( = ?auto_122183 ?auto_122184 ) ) ( not ( = ?auto_122183 ?auto_122185 ) ) ( not ( = ?auto_122184 ?auto_122185 ) ) ( ON ?auto_122185 ?auto_122186 ) ( not ( = ?auto_122179 ?auto_122186 ) ) ( not ( = ?auto_122180 ?auto_122186 ) ) ( not ( = ?auto_122181 ?auto_122186 ) ) ( not ( = ?auto_122182 ?auto_122186 ) ) ( not ( = ?auto_122183 ?auto_122186 ) ) ( not ( = ?auto_122184 ?auto_122186 ) ) ( not ( = ?auto_122185 ?auto_122186 ) ) ( ON ?auto_122184 ?auto_122185 ) ( ON-TABLE ?auto_122186 ) ( ON ?auto_122183 ?auto_122184 ) ( ON ?auto_122182 ?auto_122183 ) ( ON ?auto_122181 ?auto_122182 ) ( ON ?auto_122180 ?auto_122181 ) ( CLEAR ?auto_122180 ) ( HOLDING ?auto_122179 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122179 )
      ( MAKE-7PILE ?auto_122179 ?auto_122180 ?auto_122181 ?auto_122182 ?auto_122183 ?auto_122184 ?auto_122185 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_122187 - BLOCK
      ?auto_122188 - BLOCK
      ?auto_122189 - BLOCK
      ?auto_122190 - BLOCK
      ?auto_122191 - BLOCK
      ?auto_122192 - BLOCK
      ?auto_122193 - BLOCK
    )
    :vars
    (
      ?auto_122194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122187 ?auto_122188 ) ) ( not ( = ?auto_122187 ?auto_122189 ) ) ( not ( = ?auto_122187 ?auto_122190 ) ) ( not ( = ?auto_122187 ?auto_122191 ) ) ( not ( = ?auto_122187 ?auto_122192 ) ) ( not ( = ?auto_122187 ?auto_122193 ) ) ( not ( = ?auto_122188 ?auto_122189 ) ) ( not ( = ?auto_122188 ?auto_122190 ) ) ( not ( = ?auto_122188 ?auto_122191 ) ) ( not ( = ?auto_122188 ?auto_122192 ) ) ( not ( = ?auto_122188 ?auto_122193 ) ) ( not ( = ?auto_122189 ?auto_122190 ) ) ( not ( = ?auto_122189 ?auto_122191 ) ) ( not ( = ?auto_122189 ?auto_122192 ) ) ( not ( = ?auto_122189 ?auto_122193 ) ) ( not ( = ?auto_122190 ?auto_122191 ) ) ( not ( = ?auto_122190 ?auto_122192 ) ) ( not ( = ?auto_122190 ?auto_122193 ) ) ( not ( = ?auto_122191 ?auto_122192 ) ) ( not ( = ?auto_122191 ?auto_122193 ) ) ( not ( = ?auto_122192 ?auto_122193 ) ) ( ON ?auto_122193 ?auto_122194 ) ( not ( = ?auto_122187 ?auto_122194 ) ) ( not ( = ?auto_122188 ?auto_122194 ) ) ( not ( = ?auto_122189 ?auto_122194 ) ) ( not ( = ?auto_122190 ?auto_122194 ) ) ( not ( = ?auto_122191 ?auto_122194 ) ) ( not ( = ?auto_122192 ?auto_122194 ) ) ( not ( = ?auto_122193 ?auto_122194 ) ) ( ON ?auto_122192 ?auto_122193 ) ( ON-TABLE ?auto_122194 ) ( ON ?auto_122191 ?auto_122192 ) ( ON ?auto_122190 ?auto_122191 ) ( ON ?auto_122189 ?auto_122190 ) ( ON ?auto_122188 ?auto_122189 ) ( ON ?auto_122187 ?auto_122188 ) ( CLEAR ?auto_122187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122194 ?auto_122193 ?auto_122192 ?auto_122191 ?auto_122190 ?auto_122189 ?auto_122188 )
      ( MAKE-7PILE ?auto_122187 ?auto_122188 ?auto_122189 ?auto_122190 ?auto_122191 ?auto_122192 ?auto_122193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122201 - BLOCK
      ?auto_122202 - BLOCK
      ?auto_122203 - BLOCK
      ?auto_122204 - BLOCK
      ?auto_122205 - BLOCK
      ?auto_122206 - BLOCK
    )
    :vars
    (
      ?auto_122207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122207 ?auto_122206 ) ( CLEAR ?auto_122207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122201 ) ( ON ?auto_122202 ?auto_122201 ) ( ON ?auto_122203 ?auto_122202 ) ( ON ?auto_122204 ?auto_122203 ) ( ON ?auto_122205 ?auto_122204 ) ( ON ?auto_122206 ?auto_122205 ) ( not ( = ?auto_122201 ?auto_122202 ) ) ( not ( = ?auto_122201 ?auto_122203 ) ) ( not ( = ?auto_122201 ?auto_122204 ) ) ( not ( = ?auto_122201 ?auto_122205 ) ) ( not ( = ?auto_122201 ?auto_122206 ) ) ( not ( = ?auto_122201 ?auto_122207 ) ) ( not ( = ?auto_122202 ?auto_122203 ) ) ( not ( = ?auto_122202 ?auto_122204 ) ) ( not ( = ?auto_122202 ?auto_122205 ) ) ( not ( = ?auto_122202 ?auto_122206 ) ) ( not ( = ?auto_122202 ?auto_122207 ) ) ( not ( = ?auto_122203 ?auto_122204 ) ) ( not ( = ?auto_122203 ?auto_122205 ) ) ( not ( = ?auto_122203 ?auto_122206 ) ) ( not ( = ?auto_122203 ?auto_122207 ) ) ( not ( = ?auto_122204 ?auto_122205 ) ) ( not ( = ?auto_122204 ?auto_122206 ) ) ( not ( = ?auto_122204 ?auto_122207 ) ) ( not ( = ?auto_122205 ?auto_122206 ) ) ( not ( = ?auto_122205 ?auto_122207 ) ) ( not ( = ?auto_122206 ?auto_122207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122207 ?auto_122206 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122223 - BLOCK
      ?auto_122224 - BLOCK
      ?auto_122225 - BLOCK
      ?auto_122226 - BLOCK
      ?auto_122227 - BLOCK
      ?auto_122228 - BLOCK
    )
    :vars
    (
      ?auto_122229 - BLOCK
      ?auto_122230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122223 ) ( ON ?auto_122224 ?auto_122223 ) ( ON ?auto_122225 ?auto_122224 ) ( ON ?auto_122226 ?auto_122225 ) ( ON ?auto_122227 ?auto_122226 ) ( not ( = ?auto_122223 ?auto_122224 ) ) ( not ( = ?auto_122223 ?auto_122225 ) ) ( not ( = ?auto_122223 ?auto_122226 ) ) ( not ( = ?auto_122223 ?auto_122227 ) ) ( not ( = ?auto_122223 ?auto_122228 ) ) ( not ( = ?auto_122223 ?auto_122229 ) ) ( not ( = ?auto_122224 ?auto_122225 ) ) ( not ( = ?auto_122224 ?auto_122226 ) ) ( not ( = ?auto_122224 ?auto_122227 ) ) ( not ( = ?auto_122224 ?auto_122228 ) ) ( not ( = ?auto_122224 ?auto_122229 ) ) ( not ( = ?auto_122225 ?auto_122226 ) ) ( not ( = ?auto_122225 ?auto_122227 ) ) ( not ( = ?auto_122225 ?auto_122228 ) ) ( not ( = ?auto_122225 ?auto_122229 ) ) ( not ( = ?auto_122226 ?auto_122227 ) ) ( not ( = ?auto_122226 ?auto_122228 ) ) ( not ( = ?auto_122226 ?auto_122229 ) ) ( not ( = ?auto_122227 ?auto_122228 ) ) ( not ( = ?auto_122227 ?auto_122229 ) ) ( not ( = ?auto_122228 ?auto_122229 ) ) ( ON ?auto_122229 ?auto_122230 ) ( CLEAR ?auto_122229 ) ( not ( = ?auto_122223 ?auto_122230 ) ) ( not ( = ?auto_122224 ?auto_122230 ) ) ( not ( = ?auto_122225 ?auto_122230 ) ) ( not ( = ?auto_122226 ?auto_122230 ) ) ( not ( = ?auto_122227 ?auto_122230 ) ) ( not ( = ?auto_122228 ?auto_122230 ) ) ( not ( = ?auto_122229 ?auto_122230 ) ) ( HOLDING ?auto_122228 ) ( CLEAR ?auto_122227 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122223 ?auto_122224 ?auto_122225 ?auto_122226 ?auto_122227 ?auto_122228 ?auto_122229 )
      ( MAKE-6PILE ?auto_122223 ?auto_122224 ?auto_122225 ?auto_122226 ?auto_122227 ?auto_122228 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122231 - BLOCK
      ?auto_122232 - BLOCK
      ?auto_122233 - BLOCK
      ?auto_122234 - BLOCK
      ?auto_122235 - BLOCK
      ?auto_122236 - BLOCK
    )
    :vars
    (
      ?auto_122238 - BLOCK
      ?auto_122237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122231 ) ( ON ?auto_122232 ?auto_122231 ) ( ON ?auto_122233 ?auto_122232 ) ( ON ?auto_122234 ?auto_122233 ) ( ON ?auto_122235 ?auto_122234 ) ( not ( = ?auto_122231 ?auto_122232 ) ) ( not ( = ?auto_122231 ?auto_122233 ) ) ( not ( = ?auto_122231 ?auto_122234 ) ) ( not ( = ?auto_122231 ?auto_122235 ) ) ( not ( = ?auto_122231 ?auto_122236 ) ) ( not ( = ?auto_122231 ?auto_122238 ) ) ( not ( = ?auto_122232 ?auto_122233 ) ) ( not ( = ?auto_122232 ?auto_122234 ) ) ( not ( = ?auto_122232 ?auto_122235 ) ) ( not ( = ?auto_122232 ?auto_122236 ) ) ( not ( = ?auto_122232 ?auto_122238 ) ) ( not ( = ?auto_122233 ?auto_122234 ) ) ( not ( = ?auto_122233 ?auto_122235 ) ) ( not ( = ?auto_122233 ?auto_122236 ) ) ( not ( = ?auto_122233 ?auto_122238 ) ) ( not ( = ?auto_122234 ?auto_122235 ) ) ( not ( = ?auto_122234 ?auto_122236 ) ) ( not ( = ?auto_122234 ?auto_122238 ) ) ( not ( = ?auto_122235 ?auto_122236 ) ) ( not ( = ?auto_122235 ?auto_122238 ) ) ( not ( = ?auto_122236 ?auto_122238 ) ) ( ON ?auto_122238 ?auto_122237 ) ( not ( = ?auto_122231 ?auto_122237 ) ) ( not ( = ?auto_122232 ?auto_122237 ) ) ( not ( = ?auto_122233 ?auto_122237 ) ) ( not ( = ?auto_122234 ?auto_122237 ) ) ( not ( = ?auto_122235 ?auto_122237 ) ) ( not ( = ?auto_122236 ?auto_122237 ) ) ( not ( = ?auto_122238 ?auto_122237 ) ) ( CLEAR ?auto_122235 ) ( ON ?auto_122236 ?auto_122238 ) ( CLEAR ?auto_122236 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122237 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122237 ?auto_122238 )
      ( MAKE-6PILE ?auto_122231 ?auto_122232 ?auto_122233 ?auto_122234 ?auto_122235 ?auto_122236 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122239 - BLOCK
      ?auto_122240 - BLOCK
      ?auto_122241 - BLOCK
      ?auto_122242 - BLOCK
      ?auto_122243 - BLOCK
      ?auto_122244 - BLOCK
    )
    :vars
    (
      ?auto_122245 - BLOCK
      ?auto_122246 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122239 ) ( ON ?auto_122240 ?auto_122239 ) ( ON ?auto_122241 ?auto_122240 ) ( ON ?auto_122242 ?auto_122241 ) ( not ( = ?auto_122239 ?auto_122240 ) ) ( not ( = ?auto_122239 ?auto_122241 ) ) ( not ( = ?auto_122239 ?auto_122242 ) ) ( not ( = ?auto_122239 ?auto_122243 ) ) ( not ( = ?auto_122239 ?auto_122244 ) ) ( not ( = ?auto_122239 ?auto_122245 ) ) ( not ( = ?auto_122240 ?auto_122241 ) ) ( not ( = ?auto_122240 ?auto_122242 ) ) ( not ( = ?auto_122240 ?auto_122243 ) ) ( not ( = ?auto_122240 ?auto_122244 ) ) ( not ( = ?auto_122240 ?auto_122245 ) ) ( not ( = ?auto_122241 ?auto_122242 ) ) ( not ( = ?auto_122241 ?auto_122243 ) ) ( not ( = ?auto_122241 ?auto_122244 ) ) ( not ( = ?auto_122241 ?auto_122245 ) ) ( not ( = ?auto_122242 ?auto_122243 ) ) ( not ( = ?auto_122242 ?auto_122244 ) ) ( not ( = ?auto_122242 ?auto_122245 ) ) ( not ( = ?auto_122243 ?auto_122244 ) ) ( not ( = ?auto_122243 ?auto_122245 ) ) ( not ( = ?auto_122244 ?auto_122245 ) ) ( ON ?auto_122245 ?auto_122246 ) ( not ( = ?auto_122239 ?auto_122246 ) ) ( not ( = ?auto_122240 ?auto_122246 ) ) ( not ( = ?auto_122241 ?auto_122246 ) ) ( not ( = ?auto_122242 ?auto_122246 ) ) ( not ( = ?auto_122243 ?auto_122246 ) ) ( not ( = ?auto_122244 ?auto_122246 ) ) ( not ( = ?auto_122245 ?auto_122246 ) ) ( ON ?auto_122244 ?auto_122245 ) ( CLEAR ?auto_122244 ) ( ON-TABLE ?auto_122246 ) ( HOLDING ?auto_122243 ) ( CLEAR ?auto_122242 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122239 ?auto_122240 ?auto_122241 ?auto_122242 ?auto_122243 )
      ( MAKE-6PILE ?auto_122239 ?auto_122240 ?auto_122241 ?auto_122242 ?auto_122243 ?auto_122244 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122247 - BLOCK
      ?auto_122248 - BLOCK
      ?auto_122249 - BLOCK
      ?auto_122250 - BLOCK
      ?auto_122251 - BLOCK
      ?auto_122252 - BLOCK
    )
    :vars
    (
      ?auto_122254 - BLOCK
      ?auto_122253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122247 ) ( ON ?auto_122248 ?auto_122247 ) ( ON ?auto_122249 ?auto_122248 ) ( ON ?auto_122250 ?auto_122249 ) ( not ( = ?auto_122247 ?auto_122248 ) ) ( not ( = ?auto_122247 ?auto_122249 ) ) ( not ( = ?auto_122247 ?auto_122250 ) ) ( not ( = ?auto_122247 ?auto_122251 ) ) ( not ( = ?auto_122247 ?auto_122252 ) ) ( not ( = ?auto_122247 ?auto_122254 ) ) ( not ( = ?auto_122248 ?auto_122249 ) ) ( not ( = ?auto_122248 ?auto_122250 ) ) ( not ( = ?auto_122248 ?auto_122251 ) ) ( not ( = ?auto_122248 ?auto_122252 ) ) ( not ( = ?auto_122248 ?auto_122254 ) ) ( not ( = ?auto_122249 ?auto_122250 ) ) ( not ( = ?auto_122249 ?auto_122251 ) ) ( not ( = ?auto_122249 ?auto_122252 ) ) ( not ( = ?auto_122249 ?auto_122254 ) ) ( not ( = ?auto_122250 ?auto_122251 ) ) ( not ( = ?auto_122250 ?auto_122252 ) ) ( not ( = ?auto_122250 ?auto_122254 ) ) ( not ( = ?auto_122251 ?auto_122252 ) ) ( not ( = ?auto_122251 ?auto_122254 ) ) ( not ( = ?auto_122252 ?auto_122254 ) ) ( ON ?auto_122254 ?auto_122253 ) ( not ( = ?auto_122247 ?auto_122253 ) ) ( not ( = ?auto_122248 ?auto_122253 ) ) ( not ( = ?auto_122249 ?auto_122253 ) ) ( not ( = ?auto_122250 ?auto_122253 ) ) ( not ( = ?auto_122251 ?auto_122253 ) ) ( not ( = ?auto_122252 ?auto_122253 ) ) ( not ( = ?auto_122254 ?auto_122253 ) ) ( ON ?auto_122252 ?auto_122254 ) ( ON-TABLE ?auto_122253 ) ( CLEAR ?auto_122250 ) ( ON ?auto_122251 ?auto_122252 ) ( CLEAR ?auto_122251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122253 ?auto_122254 ?auto_122252 )
      ( MAKE-6PILE ?auto_122247 ?auto_122248 ?auto_122249 ?auto_122250 ?auto_122251 ?auto_122252 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122255 - BLOCK
      ?auto_122256 - BLOCK
      ?auto_122257 - BLOCK
      ?auto_122258 - BLOCK
      ?auto_122259 - BLOCK
      ?auto_122260 - BLOCK
    )
    :vars
    (
      ?auto_122261 - BLOCK
      ?auto_122262 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122255 ) ( ON ?auto_122256 ?auto_122255 ) ( ON ?auto_122257 ?auto_122256 ) ( not ( = ?auto_122255 ?auto_122256 ) ) ( not ( = ?auto_122255 ?auto_122257 ) ) ( not ( = ?auto_122255 ?auto_122258 ) ) ( not ( = ?auto_122255 ?auto_122259 ) ) ( not ( = ?auto_122255 ?auto_122260 ) ) ( not ( = ?auto_122255 ?auto_122261 ) ) ( not ( = ?auto_122256 ?auto_122257 ) ) ( not ( = ?auto_122256 ?auto_122258 ) ) ( not ( = ?auto_122256 ?auto_122259 ) ) ( not ( = ?auto_122256 ?auto_122260 ) ) ( not ( = ?auto_122256 ?auto_122261 ) ) ( not ( = ?auto_122257 ?auto_122258 ) ) ( not ( = ?auto_122257 ?auto_122259 ) ) ( not ( = ?auto_122257 ?auto_122260 ) ) ( not ( = ?auto_122257 ?auto_122261 ) ) ( not ( = ?auto_122258 ?auto_122259 ) ) ( not ( = ?auto_122258 ?auto_122260 ) ) ( not ( = ?auto_122258 ?auto_122261 ) ) ( not ( = ?auto_122259 ?auto_122260 ) ) ( not ( = ?auto_122259 ?auto_122261 ) ) ( not ( = ?auto_122260 ?auto_122261 ) ) ( ON ?auto_122261 ?auto_122262 ) ( not ( = ?auto_122255 ?auto_122262 ) ) ( not ( = ?auto_122256 ?auto_122262 ) ) ( not ( = ?auto_122257 ?auto_122262 ) ) ( not ( = ?auto_122258 ?auto_122262 ) ) ( not ( = ?auto_122259 ?auto_122262 ) ) ( not ( = ?auto_122260 ?auto_122262 ) ) ( not ( = ?auto_122261 ?auto_122262 ) ) ( ON ?auto_122260 ?auto_122261 ) ( ON-TABLE ?auto_122262 ) ( ON ?auto_122259 ?auto_122260 ) ( CLEAR ?auto_122259 ) ( HOLDING ?auto_122258 ) ( CLEAR ?auto_122257 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122255 ?auto_122256 ?auto_122257 ?auto_122258 )
      ( MAKE-6PILE ?auto_122255 ?auto_122256 ?auto_122257 ?auto_122258 ?auto_122259 ?auto_122260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122263 - BLOCK
      ?auto_122264 - BLOCK
      ?auto_122265 - BLOCK
      ?auto_122266 - BLOCK
      ?auto_122267 - BLOCK
      ?auto_122268 - BLOCK
    )
    :vars
    (
      ?auto_122270 - BLOCK
      ?auto_122269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122263 ) ( ON ?auto_122264 ?auto_122263 ) ( ON ?auto_122265 ?auto_122264 ) ( not ( = ?auto_122263 ?auto_122264 ) ) ( not ( = ?auto_122263 ?auto_122265 ) ) ( not ( = ?auto_122263 ?auto_122266 ) ) ( not ( = ?auto_122263 ?auto_122267 ) ) ( not ( = ?auto_122263 ?auto_122268 ) ) ( not ( = ?auto_122263 ?auto_122270 ) ) ( not ( = ?auto_122264 ?auto_122265 ) ) ( not ( = ?auto_122264 ?auto_122266 ) ) ( not ( = ?auto_122264 ?auto_122267 ) ) ( not ( = ?auto_122264 ?auto_122268 ) ) ( not ( = ?auto_122264 ?auto_122270 ) ) ( not ( = ?auto_122265 ?auto_122266 ) ) ( not ( = ?auto_122265 ?auto_122267 ) ) ( not ( = ?auto_122265 ?auto_122268 ) ) ( not ( = ?auto_122265 ?auto_122270 ) ) ( not ( = ?auto_122266 ?auto_122267 ) ) ( not ( = ?auto_122266 ?auto_122268 ) ) ( not ( = ?auto_122266 ?auto_122270 ) ) ( not ( = ?auto_122267 ?auto_122268 ) ) ( not ( = ?auto_122267 ?auto_122270 ) ) ( not ( = ?auto_122268 ?auto_122270 ) ) ( ON ?auto_122270 ?auto_122269 ) ( not ( = ?auto_122263 ?auto_122269 ) ) ( not ( = ?auto_122264 ?auto_122269 ) ) ( not ( = ?auto_122265 ?auto_122269 ) ) ( not ( = ?auto_122266 ?auto_122269 ) ) ( not ( = ?auto_122267 ?auto_122269 ) ) ( not ( = ?auto_122268 ?auto_122269 ) ) ( not ( = ?auto_122270 ?auto_122269 ) ) ( ON ?auto_122268 ?auto_122270 ) ( ON-TABLE ?auto_122269 ) ( ON ?auto_122267 ?auto_122268 ) ( CLEAR ?auto_122265 ) ( ON ?auto_122266 ?auto_122267 ) ( CLEAR ?auto_122266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122269 ?auto_122270 ?auto_122268 ?auto_122267 )
      ( MAKE-6PILE ?auto_122263 ?auto_122264 ?auto_122265 ?auto_122266 ?auto_122267 ?auto_122268 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122271 - BLOCK
      ?auto_122272 - BLOCK
      ?auto_122273 - BLOCK
      ?auto_122274 - BLOCK
      ?auto_122275 - BLOCK
      ?auto_122276 - BLOCK
    )
    :vars
    (
      ?auto_122278 - BLOCK
      ?auto_122277 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122271 ) ( ON ?auto_122272 ?auto_122271 ) ( not ( = ?auto_122271 ?auto_122272 ) ) ( not ( = ?auto_122271 ?auto_122273 ) ) ( not ( = ?auto_122271 ?auto_122274 ) ) ( not ( = ?auto_122271 ?auto_122275 ) ) ( not ( = ?auto_122271 ?auto_122276 ) ) ( not ( = ?auto_122271 ?auto_122278 ) ) ( not ( = ?auto_122272 ?auto_122273 ) ) ( not ( = ?auto_122272 ?auto_122274 ) ) ( not ( = ?auto_122272 ?auto_122275 ) ) ( not ( = ?auto_122272 ?auto_122276 ) ) ( not ( = ?auto_122272 ?auto_122278 ) ) ( not ( = ?auto_122273 ?auto_122274 ) ) ( not ( = ?auto_122273 ?auto_122275 ) ) ( not ( = ?auto_122273 ?auto_122276 ) ) ( not ( = ?auto_122273 ?auto_122278 ) ) ( not ( = ?auto_122274 ?auto_122275 ) ) ( not ( = ?auto_122274 ?auto_122276 ) ) ( not ( = ?auto_122274 ?auto_122278 ) ) ( not ( = ?auto_122275 ?auto_122276 ) ) ( not ( = ?auto_122275 ?auto_122278 ) ) ( not ( = ?auto_122276 ?auto_122278 ) ) ( ON ?auto_122278 ?auto_122277 ) ( not ( = ?auto_122271 ?auto_122277 ) ) ( not ( = ?auto_122272 ?auto_122277 ) ) ( not ( = ?auto_122273 ?auto_122277 ) ) ( not ( = ?auto_122274 ?auto_122277 ) ) ( not ( = ?auto_122275 ?auto_122277 ) ) ( not ( = ?auto_122276 ?auto_122277 ) ) ( not ( = ?auto_122278 ?auto_122277 ) ) ( ON ?auto_122276 ?auto_122278 ) ( ON-TABLE ?auto_122277 ) ( ON ?auto_122275 ?auto_122276 ) ( ON ?auto_122274 ?auto_122275 ) ( CLEAR ?auto_122274 ) ( HOLDING ?auto_122273 ) ( CLEAR ?auto_122272 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122271 ?auto_122272 ?auto_122273 )
      ( MAKE-6PILE ?auto_122271 ?auto_122272 ?auto_122273 ?auto_122274 ?auto_122275 ?auto_122276 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122279 - BLOCK
      ?auto_122280 - BLOCK
      ?auto_122281 - BLOCK
      ?auto_122282 - BLOCK
      ?auto_122283 - BLOCK
      ?auto_122284 - BLOCK
    )
    :vars
    (
      ?auto_122285 - BLOCK
      ?auto_122286 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122279 ) ( ON ?auto_122280 ?auto_122279 ) ( not ( = ?auto_122279 ?auto_122280 ) ) ( not ( = ?auto_122279 ?auto_122281 ) ) ( not ( = ?auto_122279 ?auto_122282 ) ) ( not ( = ?auto_122279 ?auto_122283 ) ) ( not ( = ?auto_122279 ?auto_122284 ) ) ( not ( = ?auto_122279 ?auto_122285 ) ) ( not ( = ?auto_122280 ?auto_122281 ) ) ( not ( = ?auto_122280 ?auto_122282 ) ) ( not ( = ?auto_122280 ?auto_122283 ) ) ( not ( = ?auto_122280 ?auto_122284 ) ) ( not ( = ?auto_122280 ?auto_122285 ) ) ( not ( = ?auto_122281 ?auto_122282 ) ) ( not ( = ?auto_122281 ?auto_122283 ) ) ( not ( = ?auto_122281 ?auto_122284 ) ) ( not ( = ?auto_122281 ?auto_122285 ) ) ( not ( = ?auto_122282 ?auto_122283 ) ) ( not ( = ?auto_122282 ?auto_122284 ) ) ( not ( = ?auto_122282 ?auto_122285 ) ) ( not ( = ?auto_122283 ?auto_122284 ) ) ( not ( = ?auto_122283 ?auto_122285 ) ) ( not ( = ?auto_122284 ?auto_122285 ) ) ( ON ?auto_122285 ?auto_122286 ) ( not ( = ?auto_122279 ?auto_122286 ) ) ( not ( = ?auto_122280 ?auto_122286 ) ) ( not ( = ?auto_122281 ?auto_122286 ) ) ( not ( = ?auto_122282 ?auto_122286 ) ) ( not ( = ?auto_122283 ?auto_122286 ) ) ( not ( = ?auto_122284 ?auto_122286 ) ) ( not ( = ?auto_122285 ?auto_122286 ) ) ( ON ?auto_122284 ?auto_122285 ) ( ON-TABLE ?auto_122286 ) ( ON ?auto_122283 ?auto_122284 ) ( ON ?auto_122282 ?auto_122283 ) ( CLEAR ?auto_122280 ) ( ON ?auto_122281 ?auto_122282 ) ( CLEAR ?auto_122281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122286 ?auto_122285 ?auto_122284 ?auto_122283 ?auto_122282 )
      ( MAKE-6PILE ?auto_122279 ?auto_122280 ?auto_122281 ?auto_122282 ?auto_122283 ?auto_122284 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122287 - BLOCK
      ?auto_122288 - BLOCK
      ?auto_122289 - BLOCK
      ?auto_122290 - BLOCK
      ?auto_122291 - BLOCK
      ?auto_122292 - BLOCK
    )
    :vars
    (
      ?auto_122293 - BLOCK
      ?auto_122294 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122287 ) ( not ( = ?auto_122287 ?auto_122288 ) ) ( not ( = ?auto_122287 ?auto_122289 ) ) ( not ( = ?auto_122287 ?auto_122290 ) ) ( not ( = ?auto_122287 ?auto_122291 ) ) ( not ( = ?auto_122287 ?auto_122292 ) ) ( not ( = ?auto_122287 ?auto_122293 ) ) ( not ( = ?auto_122288 ?auto_122289 ) ) ( not ( = ?auto_122288 ?auto_122290 ) ) ( not ( = ?auto_122288 ?auto_122291 ) ) ( not ( = ?auto_122288 ?auto_122292 ) ) ( not ( = ?auto_122288 ?auto_122293 ) ) ( not ( = ?auto_122289 ?auto_122290 ) ) ( not ( = ?auto_122289 ?auto_122291 ) ) ( not ( = ?auto_122289 ?auto_122292 ) ) ( not ( = ?auto_122289 ?auto_122293 ) ) ( not ( = ?auto_122290 ?auto_122291 ) ) ( not ( = ?auto_122290 ?auto_122292 ) ) ( not ( = ?auto_122290 ?auto_122293 ) ) ( not ( = ?auto_122291 ?auto_122292 ) ) ( not ( = ?auto_122291 ?auto_122293 ) ) ( not ( = ?auto_122292 ?auto_122293 ) ) ( ON ?auto_122293 ?auto_122294 ) ( not ( = ?auto_122287 ?auto_122294 ) ) ( not ( = ?auto_122288 ?auto_122294 ) ) ( not ( = ?auto_122289 ?auto_122294 ) ) ( not ( = ?auto_122290 ?auto_122294 ) ) ( not ( = ?auto_122291 ?auto_122294 ) ) ( not ( = ?auto_122292 ?auto_122294 ) ) ( not ( = ?auto_122293 ?auto_122294 ) ) ( ON ?auto_122292 ?auto_122293 ) ( ON-TABLE ?auto_122294 ) ( ON ?auto_122291 ?auto_122292 ) ( ON ?auto_122290 ?auto_122291 ) ( ON ?auto_122289 ?auto_122290 ) ( CLEAR ?auto_122289 ) ( HOLDING ?auto_122288 ) ( CLEAR ?auto_122287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122287 ?auto_122288 )
      ( MAKE-6PILE ?auto_122287 ?auto_122288 ?auto_122289 ?auto_122290 ?auto_122291 ?auto_122292 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122295 - BLOCK
      ?auto_122296 - BLOCK
      ?auto_122297 - BLOCK
      ?auto_122298 - BLOCK
      ?auto_122299 - BLOCK
      ?auto_122300 - BLOCK
    )
    :vars
    (
      ?auto_122301 - BLOCK
      ?auto_122302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122295 ) ( not ( = ?auto_122295 ?auto_122296 ) ) ( not ( = ?auto_122295 ?auto_122297 ) ) ( not ( = ?auto_122295 ?auto_122298 ) ) ( not ( = ?auto_122295 ?auto_122299 ) ) ( not ( = ?auto_122295 ?auto_122300 ) ) ( not ( = ?auto_122295 ?auto_122301 ) ) ( not ( = ?auto_122296 ?auto_122297 ) ) ( not ( = ?auto_122296 ?auto_122298 ) ) ( not ( = ?auto_122296 ?auto_122299 ) ) ( not ( = ?auto_122296 ?auto_122300 ) ) ( not ( = ?auto_122296 ?auto_122301 ) ) ( not ( = ?auto_122297 ?auto_122298 ) ) ( not ( = ?auto_122297 ?auto_122299 ) ) ( not ( = ?auto_122297 ?auto_122300 ) ) ( not ( = ?auto_122297 ?auto_122301 ) ) ( not ( = ?auto_122298 ?auto_122299 ) ) ( not ( = ?auto_122298 ?auto_122300 ) ) ( not ( = ?auto_122298 ?auto_122301 ) ) ( not ( = ?auto_122299 ?auto_122300 ) ) ( not ( = ?auto_122299 ?auto_122301 ) ) ( not ( = ?auto_122300 ?auto_122301 ) ) ( ON ?auto_122301 ?auto_122302 ) ( not ( = ?auto_122295 ?auto_122302 ) ) ( not ( = ?auto_122296 ?auto_122302 ) ) ( not ( = ?auto_122297 ?auto_122302 ) ) ( not ( = ?auto_122298 ?auto_122302 ) ) ( not ( = ?auto_122299 ?auto_122302 ) ) ( not ( = ?auto_122300 ?auto_122302 ) ) ( not ( = ?auto_122301 ?auto_122302 ) ) ( ON ?auto_122300 ?auto_122301 ) ( ON-TABLE ?auto_122302 ) ( ON ?auto_122299 ?auto_122300 ) ( ON ?auto_122298 ?auto_122299 ) ( ON ?auto_122297 ?auto_122298 ) ( CLEAR ?auto_122295 ) ( ON ?auto_122296 ?auto_122297 ) ( CLEAR ?auto_122296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122302 ?auto_122301 ?auto_122300 ?auto_122299 ?auto_122298 ?auto_122297 )
      ( MAKE-6PILE ?auto_122295 ?auto_122296 ?auto_122297 ?auto_122298 ?auto_122299 ?auto_122300 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122303 - BLOCK
      ?auto_122304 - BLOCK
      ?auto_122305 - BLOCK
      ?auto_122306 - BLOCK
      ?auto_122307 - BLOCK
      ?auto_122308 - BLOCK
    )
    :vars
    (
      ?auto_122309 - BLOCK
      ?auto_122310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122303 ?auto_122304 ) ) ( not ( = ?auto_122303 ?auto_122305 ) ) ( not ( = ?auto_122303 ?auto_122306 ) ) ( not ( = ?auto_122303 ?auto_122307 ) ) ( not ( = ?auto_122303 ?auto_122308 ) ) ( not ( = ?auto_122303 ?auto_122309 ) ) ( not ( = ?auto_122304 ?auto_122305 ) ) ( not ( = ?auto_122304 ?auto_122306 ) ) ( not ( = ?auto_122304 ?auto_122307 ) ) ( not ( = ?auto_122304 ?auto_122308 ) ) ( not ( = ?auto_122304 ?auto_122309 ) ) ( not ( = ?auto_122305 ?auto_122306 ) ) ( not ( = ?auto_122305 ?auto_122307 ) ) ( not ( = ?auto_122305 ?auto_122308 ) ) ( not ( = ?auto_122305 ?auto_122309 ) ) ( not ( = ?auto_122306 ?auto_122307 ) ) ( not ( = ?auto_122306 ?auto_122308 ) ) ( not ( = ?auto_122306 ?auto_122309 ) ) ( not ( = ?auto_122307 ?auto_122308 ) ) ( not ( = ?auto_122307 ?auto_122309 ) ) ( not ( = ?auto_122308 ?auto_122309 ) ) ( ON ?auto_122309 ?auto_122310 ) ( not ( = ?auto_122303 ?auto_122310 ) ) ( not ( = ?auto_122304 ?auto_122310 ) ) ( not ( = ?auto_122305 ?auto_122310 ) ) ( not ( = ?auto_122306 ?auto_122310 ) ) ( not ( = ?auto_122307 ?auto_122310 ) ) ( not ( = ?auto_122308 ?auto_122310 ) ) ( not ( = ?auto_122309 ?auto_122310 ) ) ( ON ?auto_122308 ?auto_122309 ) ( ON-TABLE ?auto_122310 ) ( ON ?auto_122307 ?auto_122308 ) ( ON ?auto_122306 ?auto_122307 ) ( ON ?auto_122305 ?auto_122306 ) ( ON ?auto_122304 ?auto_122305 ) ( CLEAR ?auto_122304 ) ( HOLDING ?auto_122303 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122303 )
      ( MAKE-6PILE ?auto_122303 ?auto_122304 ?auto_122305 ?auto_122306 ?auto_122307 ?auto_122308 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_122311 - BLOCK
      ?auto_122312 - BLOCK
      ?auto_122313 - BLOCK
      ?auto_122314 - BLOCK
      ?auto_122315 - BLOCK
      ?auto_122316 - BLOCK
    )
    :vars
    (
      ?auto_122317 - BLOCK
      ?auto_122318 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122311 ?auto_122312 ) ) ( not ( = ?auto_122311 ?auto_122313 ) ) ( not ( = ?auto_122311 ?auto_122314 ) ) ( not ( = ?auto_122311 ?auto_122315 ) ) ( not ( = ?auto_122311 ?auto_122316 ) ) ( not ( = ?auto_122311 ?auto_122317 ) ) ( not ( = ?auto_122312 ?auto_122313 ) ) ( not ( = ?auto_122312 ?auto_122314 ) ) ( not ( = ?auto_122312 ?auto_122315 ) ) ( not ( = ?auto_122312 ?auto_122316 ) ) ( not ( = ?auto_122312 ?auto_122317 ) ) ( not ( = ?auto_122313 ?auto_122314 ) ) ( not ( = ?auto_122313 ?auto_122315 ) ) ( not ( = ?auto_122313 ?auto_122316 ) ) ( not ( = ?auto_122313 ?auto_122317 ) ) ( not ( = ?auto_122314 ?auto_122315 ) ) ( not ( = ?auto_122314 ?auto_122316 ) ) ( not ( = ?auto_122314 ?auto_122317 ) ) ( not ( = ?auto_122315 ?auto_122316 ) ) ( not ( = ?auto_122315 ?auto_122317 ) ) ( not ( = ?auto_122316 ?auto_122317 ) ) ( ON ?auto_122317 ?auto_122318 ) ( not ( = ?auto_122311 ?auto_122318 ) ) ( not ( = ?auto_122312 ?auto_122318 ) ) ( not ( = ?auto_122313 ?auto_122318 ) ) ( not ( = ?auto_122314 ?auto_122318 ) ) ( not ( = ?auto_122315 ?auto_122318 ) ) ( not ( = ?auto_122316 ?auto_122318 ) ) ( not ( = ?auto_122317 ?auto_122318 ) ) ( ON ?auto_122316 ?auto_122317 ) ( ON-TABLE ?auto_122318 ) ( ON ?auto_122315 ?auto_122316 ) ( ON ?auto_122314 ?auto_122315 ) ( ON ?auto_122313 ?auto_122314 ) ( ON ?auto_122312 ?auto_122313 ) ( ON ?auto_122311 ?auto_122312 ) ( CLEAR ?auto_122311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122318 ?auto_122317 ?auto_122316 ?auto_122315 ?auto_122314 ?auto_122313 ?auto_122312 )
      ( MAKE-6PILE ?auto_122311 ?auto_122312 ?auto_122313 ?auto_122314 ?auto_122315 ?auto_122316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122320 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_122320 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_122320 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122321 - BLOCK
    )
    :vars
    (
      ?auto_122322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122321 ?auto_122322 ) ( CLEAR ?auto_122321 ) ( HAND-EMPTY ) ( not ( = ?auto_122321 ?auto_122322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122321 ?auto_122322 )
      ( MAKE-1PILE ?auto_122321 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122323 - BLOCK
    )
    :vars
    (
      ?auto_122324 - BLOCK
      ?auto_122327 - BLOCK
      ?auto_122328 - BLOCK
      ?auto_122329 - BLOCK
      ?auto_122325 - BLOCK
      ?auto_122326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122323 ?auto_122324 ) ) ( HOLDING ?auto_122323 ) ( CLEAR ?auto_122324 ) ( ON-TABLE ?auto_122327 ) ( ON ?auto_122328 ?auto_122327 ) ( ON ?auto_122329 ?auto_122328 ) ( ON ?auto_122325 ?auto_122329 ) ( ON ?auto_122326 ?auto_122325 ) ( ON ?auto_122324 ?auto_122326 ) ( not ( = ?auto_122327 ?auto_122328 ) ) ( not ( = ?auto_122327 ?auto_122329 ) ) ( not ( = ?auto_122327 ?auto_122325 ) ) ( not ( = ?auto_122327 ?auto_122326 ) ) ( not ( = ?auto_122327 ?auto_122324 ) ) ( not ( = ?auto_122327 ?auto_122323 ) ) ( not ( = ?auto_122328 ?auto_122329 ) ) ( not ( = ?auto_122328 ?auto_122325 ) ) ( not ( = ?auto_122328 ?auto_122326 ) ) ( not ( = ?auto_122328 ?auto_122324 ) ) ( not ( = ?auto_122328 ?auto_122323 ) ) ( not ( = ?auto_122329 ?auto_122325 ) ) ( not ( = ?auto_122329 ?auto_122326 ) ) ( not ( = ?auto_122329 ?auto_122324 ) ) ( not ( = ?auto_122329 ?auto_122323 ) ) ( not ( = ?auto_122325 ?auto_122326 ) ) ( not ( = ?auto_122325 ?auto_122324 ) ) ( not ( = ?auto_122325 ?auto_122323 ) ) ( not ( = ?auto_122326 ?auto_122324 ) ) ( not ( = ?auto_122326 ?auto_122323 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122327 ?auto_122328 ?auto_122329 ?auto_122325 ?auto_122326 ?auto_122324 ?auto_122323 )
      ( MAKE-1PILE ?auto_122323 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122330 - BLOCK
    )
    :vars
    (
      ?auto_122335 - BLOCK
      ?auto_122336 - BLOCK
      ?auto_122331 - BLOCK
      ?auto_122333 - BLOCK
      ?auto_122334 - BLOCK
      ?auto_122332 - BLOCK
      ?auto_122337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122330 ?auto_122335 ) ) ( CLEAR ?auto_122335 ) ( ON-TABLE ?auto_122336 ) ( ON ?auto_122331 ?auto_122336 ) ( ON ?auto_122333 ?auto_122331 ) ( ON ?auto_122334 ?auto_122333 ) ( ON ?auto_122332 ?auto_122334 ) ( ON ?auto_122335 ?auto_122332 ) ( not ( = ?auto_122336 ?auto_122331 ) ) ( not ( = ?auto_122336 ?auto_122333 ) ) ( not ( = ?auto_122336 ?auto_122334 ) ) ( not ( = ?auto_122336 ?auto_122332 ) ) ( not ( = ?auto_122336 ?auto_122335 ) ) ( not ( = ?auto_122336 ?auto_122330 ) ) ( not ( = ?auto_122331 ?auto_122333 ) ) ( not ( = ?auto_122331 ?auto_122334 ) ) ( not ( = ?auto_122331 ?auto_122332 ) ) ( not ( = ?auto_122331 ?auto_122335 ) ) ( not ( = ?auto_122331 ?auto_122330 ) ) ( not ( = ?auto_122333 ?auto_122334 ) ) ( not ( = ?auto_122333 ?auto_122332 ) ) ( not ( = ?auto_122333 ?auto_122335 ) ) ( not ( = ?auto_122333 ?auto_122330 ) ) ( not ( = ?auto_122334 ?auto_122332 ) ) ( not ( = ?auto_122334 ?auto_122335 ) ) ( not ( = ?auto_122334 ?auto_122330 ) ) ( not ( = ?auto_122332 ?auto_122335 ) ) ( not ( = ?auto_122332 ?auto_122330 ) ) ( ON ?auto_122330 ?auto_122337 ) ( CLEAR ?auto_122330 ) ( HAND-EMPTY ) ( not ( = ?auto_122330 ?auto_122337 ) ) ( not ( = ?auto_122335 ?auto_122337 ) ) ( not ( = ?auto_122336 ?auto_122337 ) ) ( not ( = ?auto_122331 ?auto_122337 ) ) ( not ( = ?auto_122333 ?auto_122337 ) ) ( not ( = ?auto_122334 ?auto_122337 ) ) ( not ( = ?auto_122332 ?auto_122337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122330 ?auto_122337 )
      ( MAKE-1PILE ?auto_122330 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122338 - BLOCK
    )
    :vars
    (
      ?auto_122339 - BLOCK
      ?auto_122340 - BLOCK
      ?auto_122341 - BLOCK
      ?auto_122345 - BLOCK
      ?auto_122344 - BLOCK
      ?auto_122343 - BLOCK
      ?auto_122342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122338 ?auto_122339 ) ) ( ON-TABLE ?auto_122340 ) ( ON ?auto_122341 ?auto_122340 ) ( ON ?auto_122345 ?auto_122341 ) ( ON ?auto_122344 ?auto_122345 ) ( ON ?auto_122343 ?auto_122344 ) ( not ( = ?auto_122340 ?auto_122341 ) ) ( not ( = ?auto_122340 ?auto_122345 ) ) ( not ( = ?auto_122340 ?auto_122344 ) ) ( not ( = ?auto_122340 ?auto_122343 ) ) ( not ( = ?auto_122340 ?auto_122339 ) ) ( not ( = ?auto_122340 ?auto_122338 ) ) ( not ( = ?auto_122341 ?auto_122345 ) ) ( not ( = ?auto_122341 ?auto_122344 ) ) ( not ( = ?auto_122341 ?auto_122343 ) ) ( not ( = ?auto_122341 ?auto_122339 ) ) ( not ( = ?auto_122341 ?auto_122338 ) ) ( not ( = ?auto_122345 ?auto_122344 ) ) ( not ( = ?auto_122345 ?auto_122343 ) ) ( not ( = ?auto_122345 ?auto_122339 ) ) ( not ( = ?auto_122345 ?auto_122338 ) ) ( not ( = ?auto_122344 ?auto_122343 ) ) ( not ( = ?auto_122344 ?auto_122339 ) ) ( not ( = ?auto_122344 ?auto_122338 ) ) ( not ( = ?auto_122343 ?auto_122339 ) ) ( not ( = ?auto_122343 ?auto_122338 ) ) ( ON ?auto_122338 ?auto_122342 ) ( CLEAR ?auto_122338 ) ( not ( = ?auto_122338 ?auto_122342 ) ) ( not ( = ?auto_122339 ?auto_122342 ) ) ( not ( = ?auto_122340 ?auto_122342 ) ) ( not ( = ?auto_122341 ?auto_122342 ) ) ( not ( = ?auto_122345 ?auto_122342 ) ) ( not ( = ?auto_122344 ?auto_122342 ) ) ( not ( = ?auto_122343 ?auto_122342 ) ) ( HOLDING ?auto_122339 ) ( CLEAR ?auto_122343 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122340 ?auto_122341 ?auto_122345 ?auto_122344 ?auto_122343 ?auto_122339 )
      ( MAKE-1PILE ?auto_122338 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122346 - BLOCK
    )
    :vars
    (
      ?auto_122352 - BLOCK
      ?auto_122349 - BLOCK
      ?auto_122350 - BLOCK
      ?auto_122348 - BLOCK
      ?auto_122351 - BLOCK
      ?auto_122347 - BLOCK
      ?auto_122353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122346 ?auto_122352 ) ) ( ON-TABLE ?auto_122349 ) ( ON ?auto_122350 ?auto_122349 ) ( ON ?auto_122348 ?auto_122350 ) ( ON ?auto_122351 ?auto_122348 ) ( ON ?auto_122347 ?auto_122351 ) ( not ( = ?auto_122349 ?auto_122350 ) ) ( not ( = ?auto_122349 ?auto_122348 ) ) ( not ( = ?auto_122349 ?auto_122351 ) ) ( not ( = ?auto_122349 ?auto_122347 ) ) ( not ( = ?auto_122349 ?auto_122352 ) ) ( not ( = ?auto_122349 ?auto_122346 ) ) ( not ( = ?auto_122350 ?auto_122348 ) ) ( not ( = ?auto_122350 ?auto_122351 ) ) ( not ( = ?auto_122350 ?auto_122347 ) ) ( not ( = ?auto_122350 ?auto_122352 ) ) ( not ( = ?auto_122350 ?auto_122346 ) ) ( not ( = ?auto_122348 ?auto_122351 ) ) ( not ( = ?auto_122348 ?auto_122347 ) ) ( not ( = ?auto_122348 ?auto_122352 ) ) ( not ( = ?auto_122348 ?auto_122346 ) ) ( not ( = ?auto_122351 ?auto_122347 ) ) ( not ( = ?auto_122351 ?auto_122352 ) ) ( not ( = ?auto_122351 ?auto_122346 ) ) ( not ( = ?auto_122347 ?auto_122352 ) ) ( not ( = ?auto_122347 ?auto_122346 ) ) ( ON ?auto_122346 ?auto_122353 ) ( not ( = ?auto_122346 ?auto_122353 ) ) ( not ( = ?auto_122352 ?auto_122353 ) ) ( not ( = ?auto_122349 ?auto_122353 ) ) ( not ( = ?auto_122350 ?auto_122353 ) ) ( not ( = ?auto_122348 ?auto_122353 ) ) ( not ( = ?auto_122351 ?auto_122353 ) ) ( not ( = ?auto_122347 ?auto_122353 ) ) ( CLEAR ?auto_122347 ) ( ON ?auto_122352 ?auto_122346 ) ( CLEAR ?auto_122352 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122353 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122353 ?auto_122346 )
      ( MAKE-1PILE ?auto_122346 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122354 - BLOCK
    )
    :vars
    (
      ?auto_122355 - BLOCK
      ?auto_122358 - BLOCK
      ?auto_122356 - BLOCK
      ?auto_122359 - BLOCK
      ?auto_122360 - BLOCK
      ?auto_122357 - BLOCK
      ?auto_122361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122354 ?auto_122355 ) ) ( ON-TABLE ?auto_122358 ) ( ON ?auto_122356 ?auto_122358 ) ( ON ?auto_122359 ?auto_122356 ) ( ON ?auto_122360 ?auto_122359 ) ( not ( = ?auto_122358 ?auto_122356 ) ) ( not ( = ?auto_122358 ?auto_122359 ) ) ( not ( = ?auto_122358 ?auto_122360 ) ) ( not ( = ?auto_122358 ?auto_122357 ) ) ( not ( = ?auto_122358 ?auto_122355 ) ) ( not ( = ?auto_122358 ?auto_122354 ) ) ( not ( = ?auto_122356 ?auto_122359 ) ) ( not ( = ?auto_122356 ?auto_122360 ) ) ( not ( = ?auto_122356 ?auto_122357 ) ) ( not ( = ?auto_122356 ?auto_122355 ) ) ( not ( = ?auto_122356 ?auto_122354 ) ) ( not ( = ?auto_122359 ?auto_122360 ) ) ( not ( = ?auto_122359 ?auto_122357 ) ) ( not ( = ?auto_122359 ?auto_122355 ) ) ( not ( = ?auto_122359 ?auto_122354 ) ) ( not ( = ?auto_122360 ?auto_122357 ) ) ( not ( = ?auto_122360 ?auto_122355 ) ) ( not ( = ?auto_122360 ?auto_122354 ) ) ( not ( = ?auto_122357 ?auto_122355 ) ) ( not ( = ?auto_122357 ?auto_122354 ) ) ( ON ?auto_122354 ?auto_122361 ) ( not ( = ?auto_122354 ?auto_122361 ) ) ( not ( = ?auto_122355 ?auto_122361 ) ) ( not ( = ?auto_122358 ?auto_122361 ) ) ( not ( = ?auto_122356 ?auto_122361 ) ) ( not ( = ?auto_122359 ?auto_122361 ) ) ( not ( = ?auto_122360 ?auto_122361 ) ) ( not ( = ?auto_122357 ?auto_122361 ) ) ( ON ?auto_122355 ?auto_122354 ) ( CLEAR ?auto_122355 ) ( ON-TABLE ?auto_122361 ) ( HOLDING ?auto_122357 ) ( CLEAR ?auto_122360 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122358 ?auto_122356 ?auto_122359 ?auto_122360 ?auto_122357 )
      ( MAKE-1PILE ?auto_122354 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122362 - BLOCK
    )
    :vars
    (
      ?auto_122364 - BLOCK
      ?auto_122366 - BLOCK
      ?auto_122369 - BLOCK
      ?auto_122368 - BLOCK
      ?auto_122365 - BLOCK
      ?auto_122367 - BLOCK
      ?auto_122363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122362 ?auto_122364 ) ) ( ON-TABLE ?auto_122366 ) ( ON ?auto_122369 ?auto_122366 ) ( ON ?auto_122368 ?auto_122369 ) ( ON ?auto_122365 ?auto_122368 ) ( not ( = ?auto_122366 ?auto_122369 ) ) ( not ( = ?auto_122366 ?auto_122368 ) ) ( not ( = ?auto_122366 ?auto_122365 ) ) ( not ( = ?auto_122366 ?auto_122367 ) ) ( not ( = ?auto_122366 ?auto_122364 ) ) ( not ( = ?auto_122366 ?auto_122362 ) ) ( not ( = ?auto_122369 ?auto_122368 ) ) ( not ( = ?auto_122369 ?auto_122365 ) ) ( not ( = ?auto_122369 ?auto_122367 ) ) ( not ( = ?auto_122369 ?auto_122364 ) ) ( not ( = ?auto_122369 ?auto_122362 ) ) ( not ( = ?auto_122368 ?auto_122365 ) ) ( not ( = ?auto_122368 ?auto_122367 ) ) ( not ( = ?auto_122368 ?auto_122364 ) ) ( not ( = ?auto_122368 ?auto_122362 ) ) ( not ( = ?auto_122365 ?auto_122367 ) ) ( not ( = ?auto_122365 ?auto_122364 ) ) ( not ( = ?auto_122365 ?auto_122362 ) ) ( not ( = ?auto_122367 ?auto_122364 ) ) ( not ( = ?auto_122367 ?auto_122362 ) ) ( ON ?auto_122362 ?auto_122363 ) ( not ( = ?auto_122362 ?auto_122363 ) ) ( not ( = ?auto_122364 ?auto_122363 ) ) ( not ( = ?auto_122366 ?auto_122363 ) ) ( not ( = ?auto_122369 ?auto_122363 ) ) ( not ( = ?auto_122368 ?auto_122363 ) ) ( not ( = ?auto_122365 ?auto_122363 ) ) ( not ( = ?auto_122367 ?auto_122363 ) ) ( ON ?auto_122364 ?auto_122362 ) ( ON-TABLE ?auto_122363 ) ( CLEAR ?auto_122365 ) ( ON ?auto_122367 ?auto_122364 ) ( CLEAR ?auto_122367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122363 ?auto_122362 ?auto_122364 )
      ( MAKE-1PILE ?auto_122362 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122370 - BLOCK
    )
    :vars
    (
      ?auto_122375 - BLOCK
      ?auto_122376 - BLOCK
      ?auto_122371 - BLOCK
      ?auto_122374 - BLOCK
      ?auto_122372 - BLOCK
      ?auto_122377 - BLOCK
      ?auto_122373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122370 ?auto_122375 ) ) ( ON-TABLE ?auto_122376 ) ( ON ?auto_122371 ?auto_122376 ) ( ON ?auto_122374 ?auto_122371 ) ( not ( = ?auto_122376 ?auto_122371 ) ) ( not ( = ?auto_122376 ?auto_122374 ) ) ( not ( = ?auto_122376 ?auto_122372 ) ) ( not ( = ?auto_122376 ?auto_122377 ) ) ( not ( = ?auto_122376 ?auto_122375 ) ) ( not ( = ?auto_122376 ?auto_122370 ) ) ( not ( = ?auto_122371 ?auto_122374 ) ) ( not ( = ?auto_122371 ?auto_122372 ) ) ( not ( = ?auto_122371 ?auto_122377 ) ) ( not ( = ?auto_122371 ?auto_122375 ) ) ( not ( = ?auto_122371 ?auto_122370 ) ) ( not ( = ?auto_122374 ?auto_122372 ) ) ( not ( = ?auto_122374 ?auto_122377 ) ) ( not ( = ?auto_122374 ?auto_122375 ) ) ( not ( = ?auto_122374 ?auto_122370 ) ) ( not ( = ?auto_122372 ?auto_122377 ) ) ( not ( = ?auto_122372 ?auto_122375 ) ) ( not ( = ?auto_122372 ?auto_122370 ) ) ( not ( = ?auto_122377 ?auto_122375 ) ) ( not ( = ?auto_122377 ?auto_122370 ) ) ( ON ?auto_122370 ?auto_122373 ) ( not ( = ?auto_122370 ?auto_122373 ) ) ( not ( = ?auto_122375 ?auto_122373 ) ) ( not ( = ?auto_122376 ?auto_122373 ) ) ( not ( = ?auto_122371 ?auto_122373 ) ) ( not ( = ?auto_122374 ?auto_122373 ) ) ( not ( = ?auto_122372 ?auto_122373 ) ) ( not ( = ?auto_122377 ?auto_122373 ) ) ( ON ?auto_122375 ?auto_122370 ) ( ON-TABLE ?auto_122373 ) ( ON ?auto_122377 ?auto_122375 ) ( CLEAR ?auto_122377 ) ( HOLDING ?auto_122372 ) ( CLEAR ?auto_122374 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122376 ?auto_122371 ?auto_122374 ?auto_122372 )
      ( MAKE-1PILE ?auto_122370 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122378 - BLOCK
    )
    :vars
    (
      ?auto_122381 - BLOCK
      ?auto_122379 - BLOCK
      ?auto_122384 - BLOCK
      ?auto_122383 - BLOCK
      ?auto_122382 - BLOCK
      ?auto_122380 - BLOCK
      ?auto_122385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122378 ?auto_122381 ) ) ( ON-TABLE ?auto_122379 ) ( ON ?auto_122384 ?auto_122379 ) ( ON ?auto_122383 ?auto_122384 ) ( not ( = ?auto_122379 ?auto_122384 ) ) ( not ( = ?auto_122379 ?auto_122383 ) ) ( not ( = ?auto_122379 ?auto_122382 ) ) ( not ( = ?auto_122379 ?auto_122380 ) ) ( not ( = ?auto_122379 ?auto_122381 ) ) ( not ( = ?auto_122379 ?auto_122378 ) ) ( not ( = ?auto_122384 ?auto_122383 ) ) ( not ( = ?auto_122384 ?auto_122382 ) ) ( not ( = ?auto_122384 ?auto_122380 ) ) ( not ( = ?auto_122384 ?auto_122381 ) ) ( not ( = ?auto_122384 ?auto_122378 ) ) ( not ( = ?auto_122383 ?auto_122382 ) ) ( not ( = ?auto_122383 ?auto_122380 ) ) ( not ( = ?auto_122383 ?auto_122381 ) ) ( not ( = ?auto_122383 ?auto_122378 ) ) ( not ( = ?auto_122382 ?auto_122380 ) ) ( not ( = ?auto_122382 ?auto_122381 ) ) ( not ( = ?auto_122382 ?auto_122378 ) ) ( not ( = ?auto_122380 ?auto_122381 ) ) ( not ( = ?auto_122380 ?auto_122378 ) ) ( ON ?auto_122378 ?auto_122385 ) ( not ( = ?auto_122378 ?auto_122385 ) ) ( not ( = ?auto_122381 ?auto_122385 ) ) ( not ( = ?auto_122379 ?auto_122385 ) ) ( not ( = ?auto_122384 ?auto_122385 ) ) ( not ( = ?auto_122383 ?auto_122385 ) ) ( not ( = ?auto_122382 ?auto_122385 ) ) ( not ( = ?auto_122380 ?auto_122385 ) ) ( ON ?auto_122381 ?auto_122378 ) ( ON-TABLE ?auto_122385 ) ( ON ?auto_122380 ?auto_122381 ) ( CLEAR ?auto_122383 ) ( ON ?auto_122382 ?auto_122380 ) ( CLEAR ?auto_122382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122385 ?auto_122378 ?auto_122381 ?auto_122380 )
      ( MAKE-1PILE ?auto_122378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122386 - BLOCK
    )
    :vars
    (
      ?auto_122389 - BLOCK
      ?auto_122393 - BLOCK
      ?auto_122387 - BLOCK
      ?auto_122392 - BLOCK
      ?auto_122390 - BLOCK
      ?auto_122388 - BLOCK
      ?auto_122391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122386 ?auto_122389 ) ) ( ON-TABLE ?auto_122393 ) ( ON ?auto_122387 ?auto_122393 ) ( not ( = ?auto_122393 ?auto_122387 ) ) ( not ( = ?auto_122393 ?auto_122392 ) ) ( not ( = ?auto_122393 ?auto_122390 ) ) ( not ( = ?auto_122393 ?auto_122388 ) ) ( not ( = ?auto_122393 ?auto_122389 ) ) ( not ( = ?auto_122393 ?auto_122386 ) ) ( not ( = ?auto_122387 ?auto_122392 ) ) ( not ( = ?auto_122387 ?auto_122390 ) ) ( not ( = ?auto_122387 ?auto_122388 ) ) ( not ( = ?auto_122387 ?auto_122389 ) ) ( not ( = ?auto_122387 ?auto_122386 ) ) ( not ( = ?auto_122392 ?auto_122390 ) ) ( not ( = ?auto_122392 ?auto_122388 ) ) ( not ( = ?auto_122392 ?auto_122389 ) ) ( not ( = ?auto_122392 ?auto_122386 ) ) ( not ( = ?auto_122390 ?auto_122388 ) ) ( not ( = ?auto_122390 ?auto_122389 ) ) ( not ( = ?auto_122390 ?auto_122386 ) ) ( not ( = ?auto_122388 ?auto_122389 ) ) ( not ( = ?auto_122388 ?auto_122386 ) ) ( ON ?auto_122386 ?auto_122391 ) ( not ( = ?auto_122386 ?auto_122391 ) ) ( not ( = ?auto_122389 ?auto_122391 ) ) ( not ( = ?auto_122393 ?auto_122391 ) ) ( not ( = ?auto_122387 ?auto_122391 ) ) ( not ( = ?auto_122392 ?auto_122391 ) ) ( not ( = ?auto_122390 ?auto_122391 ) ) ( not ( = ?auto_122388 ?auto_122391 ) ) ( ON ?auto_122389 ?auto_122386 ) ( ON-TABLE ?auto_122391 ) ( ON ?auto_122388 ?auto_122389 ) ( ON ?auto_122390 ?auto_122388 ) ( CLEAR ?auto_122390 ) ( HOLDING ?auto_122392 ) ( CLEAR ?auto_122387 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122393 ?auto_122387 ?auto_122392 )
      ( MAKE-1PILE ?auto_122386 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122394 - BLOCK
    )
    :vars
    (
      ?auto_122400 - BLOCK
      ?auto_122397 - BLOCK
      ?auto_122398 - BLOCK
      ?auto_122401 - BLOCK
      ?auto_122395 - BLOCK
      ?auto_122399 - BLOCK
      ?auto_122396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122394 ?auto_122400 ) ) ( ON-TABLE ?auto_122397 ) ( ON ?auto_122398 ?auto_122397 ) ( not ( = ?auto_122397 ?auto_122398 ) ) ( not ( = ?auto_122397 ?auto_122401 ) ) ( not ( = ?auto_122397 ?auto_122395 ) ) ( not ( = ?auto_122397 ?auto_122399 ) ) ( not ( = ?auto_122397 ?auto_122400 ) ) ( not ( = ?auto_122397 ?auto_122394 ) ) ( not ( = ?auto_122398 ?auto_122401 ) ) ( not ( = ?auto_122398 ?auto_122395 ) ) ( not ( = ?auto_122398 ?auto_122399 ) ) ( not ( = ?auto_122398 ?auto_122400 ) ) ( not ( = ?auto_122398 ?auto_122394 ) ) ( not ( = ?auto_122401 ?auto_122395 ) ) ( not ( = ?auto_122401 ?auto_122399 ) ) ( not ( = ?auto_122401 ?auto_122400 ) ) ( not ( = ?auto_122401 ?auto_122394 ) ) ( not ( = ?auto_122395 ?auto_122399 ) ) ( not ( = ?auto_122395 ?auto_122400 ) ) ( not ( = ?auto_122395 ?auto_122394 ) ) ( not ( = ?auto_122399 ?auto_122400 ) ) ( not ( = ?auto_122399 ?auto_122394 ) ) ( ON ?auto_122394 ?auto_122396 ) ( not ( = ?auto_122394 ?auto_122396 ) ) ( not ( = ?auto_122400 ?auto_122396 ) ) ( not ( = ?auto_122397 ?auto_122396 ) ) ( not ( = ?auto_122398 ?auto_122396 ) ) ( not ( = ?auto_122401 ?auto_122396 ) ) ( not ( = ?auto_122395 ?auto_122396 ) ) ( not ( = ?auto_122399 ?auto_122396 ) ) ( ON ?auto_122400 ?auto_122394 ) ( ON-TABLE ?auto_122396 ) ( ON ?auto_122399 ?auto_122400 ) ( ON ?auto_122395 ?auto_122399 ) ( CLEAR ?auto_122398 ) ( ON ?auto_122401 ?auto_122395 ) ( CLEAR ?auto_122401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122396 ?auto_122394 ?auto_122400 ?auto_122399 ?auto_122395 )
      ( MAKE-1PILE ?auto_122394 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122402 - BLOCK
    )
    :vars
    (
      ?auto_122405 - BLOCK
      ?auto_122409 - BLOCK
      ?auto_122408 - BLOCK
      ?auto_122404 - BLOCK
      ?auto_122406 - BLOCK
      ?auto_122403 - BLOCK
      ?auto_122407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122402 ?auto_122405 ) ) ( ON-TABLE ?auto_122409 ) ( not ( = ?auto_122409 ?auto_122408 ) ) ( not ( = ?auto_122409 ?auto_122404 ) ) ( not ( = ?auto_122409 ?auto_122406 ) ) ( not ( = ?auto_122409 ?auto_122403 ) ) ( not ( = ?auto_122409 ?auto_122405 ) ) ( not ( = ?auto_122409 ?auto_122402 ) ) ( not ( = ?auto_122408 ?auto_122404 ) ) ( not ( = ?auto_122408 ?auto_122406 ) ) ( not ( = ?auto_122408 ?auto_122403 ) ) ( not ( = ?auto_122408 ?auto_122405 ) ) ( not ( = ?auto_122408 ?auto_122402 ) ) ( not ( = ?auto_122404 ?auto_122406 ) ) ( not ( = ?auto_122404 ?auto_122403 ) ) ( not ( = ?auto_122404 ?auto_122405 ) ) ( not ( = ?auto_122404 ?auto_122402 ) ) ( not ( = ?auto_122406 ?auto_122403 ) ) ( not ( = ?auto_122406 ?auto_122405 ) ) ( not ( = ?auto_122406 ?auto_122402 ) ) ( not ( = ?auto_122403 ?auto_122405 ) ) ( not ( = ?auto_122403 ?auto_122402 ) ) ( ON ?auto_122402 ?auto_122407 ) ( not ( = ?auto_122402 ?auto_122407 ) ) ( not ( = ?auto_122405 ?auto_122407 ) ) ( not ( = ?auto_122409 ?auto_122407 ) ) ( not ( = ?auto_122408 ?auto_122407 ) ) ( not ( = ?auto_122404 ?auto_122407 ) ) ( not ( = ?auto_122406 ?auto_122407 ) ) ( not ( = ?auto_122403 ?auto_122407 ) ) ( ON ?auto_122405 ?auto_122402 ) ( ON-TABLE ?auto_122407 ) ( ON ?auto_122403 ?auto_122405 ) ( ON ?auto_122406 ?auto_122403 ) ( ON ?auto_122404 ?auto_122406 ) ( CLEAR ?auto_122404 ) ( HOLDING ?auto_122408 ) ( CLEAR ?auto_122409 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122409 ?auto_122408 )
      ( MAKE-1PILE ?auto_122402 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122410 - BLOCK
    )
    :vars
    (
      ?auto_122414 - BLOCK
      ?auto_122416 - BLOCK
      ?auto_122412 - BLOCK
      ?auto_122415 - BLOCK
      ?auto_122411 - BLOCK
      ?auto_122417 - BLOCK
      ?auto_122413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122410 ?auto_122414 ) ) ( ON-TABLE ?auto_122416 ) ( not ( = ?auto_122416 ?auto_122412 ) ) ( not ( = ?auto_122416 ?auto_122415 ) ) ( not ( = ?auto_122416 ?auto_122411 ) ) ( not ( = ?auto_122416 ?auto_122417 ) ) ( not ( = ?auto_122416 ?auto_122414 ) ) ( not ( = ?auto_122416 ?auto_122410 ) ) ( not ( = ?auto_122412 ?auto_122415 ) ) ( not ( = ?auto_122412 ?auto_122411 ) ) ( not ( = ?auto_122412 ?auto_122417 ) ) ( not ( = ?auto_122412 ?auto_122414 ) ) ( not ( = ?auto_122412 ?auto_122410 ) ) ( not ( = ?auto_122415 ?auto_122411 ) ) ( not ( = ?auto_122415 ?auto_122417 ) ) ( not ( = ?auto_122415 ?auto_122414 ) ) ( not ( = ?auto_122415 ?auto_122410 ) ) ( not ( = ?auto_122411 ?auto_122417 ) ) ( not ( = ?auto_122411 ?auto_122414 ) ) ( not ( = ?auto_122411 ?auto_122410 ) ) ( not ( = ?auto_122417 ?auto_122414 ) ) ( not ( = ?auto_122417 ?auto_122410 ) ) ( ON ?auto_122410 ?auto_122413 ) ( not ( = ?auto_122410 ?auto_122413 ) ) ( not ( = ?auto_122414 ?auto_122413 ) ) ( not ( = ?auto_122416 ?auto_122413 ) ) ( not ( = ?auto_122412 ?auto_122413 ) ) ( not ( = ?auto_122415 ?auto_122413 ) ) ( not ( = ?auto_122411 ?auto_122413 ) ) ( not ( = ?auto_122417 ?auto_122413 ) ) ( ON ?auto_122414 ?auto_122410 ) ( ON-TABLE ?auto_122413 ) ( ON ?auto_122417 ?auto_122414 ) ( ON ?auto_122411 ?auto_122417 ) ( ON ?auto_122415 ?auto_122411 ) ( CLEAR ?auto_122416 ) ( ON ?auto_122412 ?auto_122415 ) ( CLEAR ?auto_122412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122413 ?auto_122410 ?auto_122414 ?auto_122417 ?auto_122411 ?auto_122415 )
      ( MAKE-1PILE ?auto_122410 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122418 - BLOCK
    )
    :vars
    (
      ?auto_122423 - BLOCK
      ?auto_122424 - BLOCK
      ?auto_122421 - BLOCK
      ?auto_122425 - BLOCK
      ?auto_122419 - BLOCK
      ?auto_122422 - BLOCK
      ?auto_122420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122418 ?auto_122423 ) ) ( not ( = ?auto_122424 ?auto_122421 ) ) ( not ( = ?auto_122424 ?auto_122425 ) ) ( not ( = ?auto_122424 ?auto_122419 ) ) ( not ( = ?auto_122424 ?auto_122422 ) ) ( not ( = ?auto_122424 ?auto_122423 ) ) ( not ( = ?auto_122424 ?auto_122418 ) ) ( not ( = ?auto_122421 ?auto_122425 ) ) ( not ( = ?auto_122421 ?auto_122419 ) ) ( not ( = ?auto_122421 ?auto_122422 ) ) ( not ( = ?auto_122421 ?auto_122423 ) ) ( not ( = ?auto_122421 ?auto_122418 ) ) ( not ( = ?auto_122425 ?auto_122419 ) ) ( not ( = ?auto_122425 ?auto_122422 ) ) ( not ( = ?auto_122425 ?auto_122423 ) ) ( not ( = ?auto_122425 ?auto_122418 ) ) ( not ( = ?auto_122419 ?auto_122422 ) ) ( not ( = ?auto_122419 ?auto_122423 ) ) ( not ( = ?auto_122419 ?auto_122418 ) ) ( not ( = ?auto_122422 ?auto_122423 ) ) ( not ( = ?auto_122422 ?auto_122418 ) ) ( ON ?auto_122418 ?auto_122420 ) ( not ( = ?auto_122418 ?auto_122420 ) ) ( not ( = ?auto_122423 ?auto_122420 ) ) ( not ( = ?auto_122424 ?auto_122420 ) ) ( not ( = ?auto_122421 ?auto_122420 ) ) ( not ( = ?auto_122425 ?auto_122420 ) ) ( not ( = ?auto_122419 ?auto_122420 ) ) ( not ( = ?auto_122422 ?auto_122420 ) ) ( ON ?auto_122423 ?auto_122418 ) ( ON-TABLE ?auto_122420 ) ( ON ?auto_122422 ?auto_122423 ) ( ON ?auto_122419 ?auto_122422 ) ( ON ?auto_122425 ?auto_122419 ) ( ON ?auto_122421 ?auto_122425 ) ( CLEAR ?auto_122421 ) ( HOLDING ?auto_122424 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122424 )
      ( MAKE-1PILE ?auto_122418 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_122426 - BLOCK
    )
    :vars
    (
      ?auto_122432 - BLOCK
      ?auto_122431 - BLOCK
      ?auto_122433 - BLOCK
      ?auto_122430 - BLOCK
      ?auto_122429 - BLOCK
      ?auto_122427 - BLOCK
      ?auto_122428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122426 ?auto_122432 ) ) ( not ( = ?auto_122431 ?auto_122433 ) ) ( not ( = ?auto_122431 ?auto_122430 ) ) ( not ( = ?auto_122431 ?auto_122429 ) ) ( not ( = ?auto_122431 ?auto_122427 ) ) ( not ( = ?auto_122431 ?auto_122432 ) ) ( not ( = ?auto_122431 ?auto_122426 ) ) ( not ( = ?auto_122433 ?auto_122430 ) ) ( not ( = ?auto_122433 ?auto_122429 ) ) ( not ( = ?auto_122433 ?auto_122427 ) ) ( not ( = ?auto_122433 ?auto_122432 ) ) ( not ( = ?auto_122433 ?auto_122426 ) ) ( not ( = ?auto_122430 ?auto_122429 ) ) ( not ( = ?auto_122430 ?auto_122427 ) ) ( not ( = ?auto_122430 ?auto_122432 ) ) ( not ( = ?auto_122430 ?auto_122426 ) ) ( not ( = ?auto_122429 ?auto_122427 ) ) ( not ( = ?auto_122429 ?auto_122432 ) ) ( not ( = ?auto_122429 ?auto_122426 ) ) ( not ( = ?auto_122427 ?auto_122432 ) ) ( not ( = ?auto_122427 ?auto_122426 ) ) ( ON ?auto_122426 ?auto_122428 ) ( not ( = ?auto_122426 ?auto_122428 ) ) ( not ( = ?auto_122432 ?auto_122428 ) ) ( not ( = ?auto_122431 ?auto_122428 ) ) ( not ( = ?auto_122433 ?auto_122428 ) ) ( not ( = ?auto_122430 ?auto_122428 ) ) ( not ( = ?auto_122429 ?auto_122428 ) ) ( not ( = ?auto_122427 ?auto_122428 ) ) ( ON ?auto_122432 ?auto_122426 ) ( ON-TABLE ?auto_122428 ) ( ON ?auto_122427 ?auto_122432 ) ( ON ?auto_122429 ?auto_122427 ) ( ON ?auto_122430 ?auto_122429 ) ( ON ?auto_122433 ?auto_122430 ) ( ON ?auto_122431 ?auto_122433 ) ( CLEAR ?auto_122431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122428 ?auto_122426 ?auto_122432 ?auto_122427 ?auto_122429 ?auto_122430 ?auto_122433 )
      ( MAKE-1PILE ?auto_122426 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122439 - BLOCK
      ?auto_122440 - BLOCK
      ?auto_122441 - BLOCK
      ?auto_122442 - BLOCK
      ?auto_122443 - BLOCK
    )
    :vars
    (
      ?auto_122444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122444 ?auto_122443 ) ( CLEAR ?auto_122444 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122439 ) ( ON ?auto_122440 ?auto_122439 ) ( ON ?auto_122441 ?auto_122440 ) ( ON ?auto_122442 ?auto_122441 ) ( ON ?auto_122443 ?auto_122442 ) ( not ( = ?auto_122439 ?auto_122440 ) ) ( not ( = ?auto_122439 ?auto_122441 ) ) ( not ( = ?auto_122439 ?auto_122442 ) ) ( not ( = ?auto_122439 ?auto_122443 ) ) ( not ( = ?auto_122439 ?auto_122444 ) ) ( not ( = ?auto_122440 ?auto_122441 ) ) ( not ( = ?auto_122440 ?auto_122442 ) ) ( not ( = ?auto_122440 ?auto_122443 ) ) ( not ( = ?auto_122440 ?auto_122444 ) ) ( not ( = ?auto_122441 ?auto_122442 ) ) ( not ( = ?auto_122441 ?auto_122443 ) ) ( not ( = ?auto_122441 ?auto_122444 ) ) ( not ( = ?auto_122442 ?auto_122443 ) ) ( not ( = ?auto_122442 ?auto_122444 ) ) ( not ( = ?auto_122443 ?auto_122444 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122444 ?auto_122443 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122445 - BLOCK
      ?auto_122446 - BLOCK
      ?auto_122447 - BLOCK
      ?auto_122448 - BLOCK
      ?auto_122449 - BLOCK
    )
    :vars
    (
      ?auto_122450 - BLOCK
      ?auto_122451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122450 ?auto_122449 ) ( CLEAR ?auto_122450 ) ( ON-TABLE ?auto_122445 ) ( ON ?auto_122446 ?auto_122445 ) ( ON ?auto_122447 ?auto_122446 ) ( ON ?auto_122448 ?auto_122447 ) ( ON ?auto_122449 ?auto_122448 ) ( not ( = ?auto_122445 ?auto_122446 ) ) ( not ( = ?auto_122445 ?auto_122447 ) ) ( not ( = ?auto_122445 ?auto_122448 ) ) ( not ( = ?auto_122445 ?auto_122449 ) ) ( not ( = ?auto_122445 ?auto_122450 ) ) ( not ( = ?auto_122446 ?auto_122447 ) ) ( not ( = ?auto_122446 ?auto_122448 ) ) ( not ( = ?auto_122446 ?auto_122449 ) ) ( not ( = ?auto_122446 ?auto_122450 ) ) ( not ( = ?auto_122447 ?auto_122448 ) ) ( not ( = ?auto_122447 ?auto_122449 ) ) ( not ( = ?auto_122447 ?auto_122450 ) ) ( not ( = ?auto_122448 ?auto_122449 ) ) ( not ( = ?auto_122448 ?auto_122450 ) ) ( not ( = ?auto_122449 ?auto_122450 ) ) ( HOLDING ?auto_122451 ) ( not ( = ?auto_122445 ?auto_122451 ) ) ( not ( = ?auto_122446 ?auto_122451 ) ) ( not ( = ?auto_122447 ?auto_122451 ) ) ( not ( = ?auto_122448 ?auto_122451 ) ) ( not ( = ?auto_122449 ?auto_122451 ) ) ( not ( = ?auto_122450 ?auto_122451 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_122451 )
      ( MAKE-5PILE ?auto_122445 ?auto_122446 ?auto_122447 ?auto_122448 ?auto_122449 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122452 - BLOCK
      ?auto_122453 - BLOCK
      ?auto_122454 - BLOCK
      ?auto_122455 - BLOCK
      ?auto_122456 - BLOCK
    )
    :vars
    (
      ?auto_122457 - BLOCK
      ?auto_122458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122457 ?auto_122456 ) ( ON-TABLE ?auto_122452 ) ( ON ?auto_122453 ?auto_122452 ) ( ON ?auto_122454 ?auto_122453 ) ( ON ?auto_122455 ?auto_122454 ) ( ON ?auto_122456 ?auto_122455 ) ( not ( = ?auto_122452 ?auto_122453 ) ) ( not ( = ?auto_122452 ?auto_122454 ) ) ( not ( = ?auto_122452 ?auto_122455 ) ) ( not ( = ?auto_122452 ?auto_122456 ) ) ( not ( = ?auto_122452 ?auto_122457 ) ) ( not ( = ?auto_122453 ?auto_122454 ) ) ( not ( = ?auto_122453 ?auto_122455 ) ) ( not ( = ?auto_122453 ?auto_122456 ) ) ( not ( = ?auto_122453 ?auto_122457 ) ) ( not ( = ?auto_122454 ?auto_122455 ) ) ( not ( = ?auto_122454 ?auto_122456 ) ) ( not ( = ?auto_122454 ?auto_122457 ) ) ( not ( = ?auto_122455 ?auto_122456 ) ) ( not ( = ?auto_122455 ?auto_122457 ) ) ( not ( = ?auto_122456 ?auto_122457 ) ) ( not ( = ?auto_122452 ?auto_122458 ) ) ( not ( = ?auto_122453 ?auto_122458 ) ) ( not ( = ?auto_122454 ?auto_122458 ) ) ( not ( = ?auto_122455 ?auto_122458 ) ) ( not ( = ?auto_122456 ?auto_122458 ) ) ( not ( = ?auto_122457 ?auto_122458 ) ) ( ON ?auto_122458 ?auto_122457 ) ( CLEAR ?auto_122458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122452 ?auto_122453 ?auto_122454 ?auto_122455 ?auto_122456 ?auto_122457 )
      ( MAKE-5PILE ?auto_122452 ?auto_122453 ?auto_122454 ?auto_122455 ?auto_122456 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122459 - BLOCK
      ?auto_122460 - BLOCK
      ?auto_122461 - BLOCK
      ?auto_122462 - BLOCK
      ?auto_122463 - BLOCK
    )
    :vars
    (
      ?auto_122464 - BLOCK
      ?auto_122465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122464 ?auto_122463 ) ( ON-TABLE ?auto_122459 ) ( ON ?auto_122460 ?auto_122459 ) ( ON ?auto_122461 ?auto_122460 ) ( ON ?auto_122462 ?auto_122461 ) ( ON ?auto_122463 ?auto_122462 ) ( not ( = ?auto_122459 ?auto_122460 ) ) ( not ( = ?auto_122459 ?auto_122461 ) ) ( not ( = ?auto_122459 ?auto_122462 ) ) ( not ( = ?auto_122459 ?auto_122463 ) ) ( not ( = ?auto_122459 ?auto_122464 ) ) ( not ( = ?auto_122460 ?auto_122461 ) ) ( not ( = ?auto_122460 ?auto_122462 ) ) ( not ( = ?auto_122460 ?auto_122463 ) ) ( not ( = ?auto_122460 ?auto_122464 ) ) ( not ( = ?auto_122461 ?auto_122462 ) ) ( not ( = ?auto_122461 ?auto_122463 ) ) ( not ( = ?auto_122461 ?auto_122464 ) ) ( not ( = ?auto_122462 ?auto_122463 ) ) ( not ( = ?auto_122462 ?auto_122464 ) ) ( not ( = ?auto_122463 ?auto_122464 ) ) ( not ( = ?auto_122459 ?auto_122465 ) ) ( not ( = ?auto_122460 ?auto_122465 ) ) ( not ( = ?auto_122461 ?auto_122465 ) ) ( not ( = ?auto_122462 ?auto_122465 ) ) ( not ( = ?auto_122463 ?auto_122465 ) ) ( not ( = ?auto_122464 ?auto_122465 ) ) ( HOLDING ?auto_122465 ) ( CLEAR ?auto_122464 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122459 ?auto_122460 ?auto_122461 ?auto_122462 ?auto_122463 ?auto_122464 ?auto_122465 )
      ( MAKE-5PILE ?auto_122459 ?auto_122460 ?auto_122461 ?auto_122462 ?auto_122463 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122466 - BLOCK
      ?auto_122467 - BLOCK
      ?auto_122468 - BLOCK
      ?auto_122469 - BLOCK
      ?auto_122470 - BLOCK
    )
    :vars
    (
      ?auto_122472 - BLOCK
      ?auto_122471 - BLOCK
      ?auto_122473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122472 ?auto_122470 ) ( ON-TABLE ?auto_122466 ) ( ON ?auto_122467 ?auto_122466 ) ( ON ?auto_122468 ?auto_122467 ) ( ON ?auto_122469 ?auto_122468 ) ( ON ?auto_122470 ?auto_122469 ) ( not ( = ?auto_122466 ?auto_122467 ) ) ( not ( = ?auto_122466 ?auto_122468 ) ) ( not ( = ?auto_122466 ?auto_122469 ) ) ( not ( = ?auto_122466 ?auto_122470 ) ) ( not ( = ?auto_122466 ?auto_122472 ) ) ( not ( = ?auto_122467 ?auto_122468 ) ) ( not ( = ?auto_122467 ?auto_122469 ) ) ( not ( = ?auto_122467 ?auto_122470 ) ) ( not ( = ?auto_122467 ?auto_122472 ) ) ( not ( = ?auto_122468 ?auto_122469 ) ) ( not ( = ?auto_122468 ?auto_122470 ) ) ( not ( = ?auto_122468 ?auto_122472 ) ) ( not ( = ?auto_122469 ?auto_122470 ) ) ( not ( = ?auto_122469 ?auto_122472 ) ) ( not ( = ?auto_122470 ?auto_122472 ) ) ( not ( = ?auto_122466 ?auto_122471 ) ) ( not ( = ?auto_122467 ?auto_122471 ) ) ( not ( = ?auto_122468 ?auto_122471 ) ) ( not ( = ?auto_122469 ?auto_122471 ) ) ( not ( = ?auto_122470 ?auto_122471 ) ) ( not ( = ?auto_122472 ?auto_122471 ) ) ( CLEAR ?auto_122472 ) ( ON ?auto_122471 ?auto_122473 ) ( CLEAR ?auto_122471 ) ( HAND-EMPTY ) ( not ( = ?auto_122466 ?auto_122473 ) ) ( not ( = ?auto_122467 ?auto_122473 ) ) ( not ( = ?auto_122468 ?auto_122473 ) ) ( not ( = ?auto_122469 ?auto_122473 ) ) ( not ( = ?auto_122470 ?auto_122473 ) ) ( not ( = ?auto_122472 ?auto_122473 ) ) ( not ( = ?auto_122471 ?auto_122473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122471 ?auto_122473 )
      ( MAKE-5PILE ?auto_122466 ?auto_122467 ?auto_122468 ?auto_122469 ?auto_122470 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122490 - BLOCK
      ?auto_122491 - BLOCK
      ?auto_122492 - BLOCK
      ?auto_122493 - BLOCK
      ?auto_122494 - BLOCK
    )
    :vars
    (
      ?auto_122495 - BLOCK
      ?auto_122496 - BLOCK
      ?auto_122497 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122490 ) ( ON ?auto_122491 ?auto_122490 ) ( ON ?auto_122492 ?auto_122491 ) ( ON ?auto_122493 ?auto_122492 ) ( not ( = ?auto_122490 ?auto_122491 ) ) ( not ( = ?auto_122490 ?auto_122492 ) ) ( not ( = ?auto_122490 ?auto_122493 ) ) ( not ( = ?auto_122490 ?auto_122494 ) ) ( not ( = ?auto_122490 ?auto_122495 ) ) ( not ( = ?auto_122491 ?auto_122492 ) ) ( not ( = ?auto_122491 ?auto_122493 ) ) ( not ( = ?auto_122491 ?auto_122494 ) ) ( not ( = ?auto_122491 ?auto_122495 ) ) ( not ( = ?auto_122492 ?auto_122493 ) ) ( not ( = ?auto_122492 ?auto_122494 ) ) ( not ( = ?auto_122492 ?auto_122495 ) ) ( not ( = ?auto_122493 ?auto_122494 ) ) ( not ( = ?auto_122493 ?auto_122495 ) ) ( not ( = ?auto_122494 ?auto_122495 ) ) ( not ( = ?auto_122490 ?auto_122496 ) ) ( not ( = ?auto_122491 ?auto_122496 ) ) ( not ( = ?auto_122492 ?auto_122496 ) ) ( not ( = ?auto_122493 ?auto_122496 ) ) ( not ( = ?auto_122494 ?auto_122496 ) ) ( not ( = ?auto_122495 ?auto_122496 ) ) ( ON ?auto_122496 ?auto_122497 ) ( not ( = ?auto_122490 ?auto_122497 ) ) ( not ( = ?auto_122491 ?auto_122497 ) ) ( not ( = ?auto_122492 ?auto_122497 ) ) ( not ( = ?auto_122493 ?auto_122497 ) ) ( not ( = ?auto_122494 ?auto_122497 ) ) ( not ( = ?auto_122495 ?auto_122497 ) ) ( not ( = ?auto_122496 ?auto_122497 ) ) ( ON ?auto_122495 ?auto_122496 ) ( CLEAR ?auto_122495 ) ( HOLDING ?auto_122494 ) ( CLEAR ?auto_122493 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122490 ?auto_122491 ?auto_122492 ?auto_122493 ?auto_122494 ?auto_122495 )
      ( MAKE-5PILE ?auto_122490 ?auto_122491 ?auto_122492 ?auto_122493 ?auto_122494 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122498 - BLOCK
      ?auto_122499 - BLOCK
      ?auto_122500 - BLOCK
      ?auto_122501 - BLOCK
      ?auto_122502 - BLOCK
    )
    :vars
    (
      ?auto_122504 - BLOCK
      ?auto_122503 - BLOCK
      ?auto_122505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122498 ) ( ON ?auto_122499 ?auto_122498 ) ( ON ?auto_122500 ?auto_122499 ) ( ON ?auto_122501 ?auto_122500 ) ( not ( = ?auto_122498 ?auto_122499 ) ) ( not ( = ?auto_122498 ?auto_122500 ) ) ( not ( = ?auto_122498 ?auto_122501 ) ) ( not ( = ?auto_122498 ?auto_122502 ) ) ( not ( = ?auto_122498 ?auto_122504 ) ) ( not ( = ?auto_122499 ?auto_122500 ) ) ( not ( = ?auto_122499 ?auto_122501 ) ) ( not ( = ?auto_122499 ?auto_122502 ) ) ( not ( = ?auto_122499 ?auto_122504 ) ) ( not ( = ?auto_122500 ?auto_122501 ) ) ( not ( = ?auto_122500 ?auto_122502 ) ) ( not ( = ?auto_122500 ?auto_122504 ) ) ( not ( = ?auto_122501 ?auto_122502 ) ) ( not ( = ?auto_122501 ?auto_122504 ) ) ( not ( = ?auto_122502 ?auto_122504 ) ) ( not ( = ?auto_122498 ?auto_122503 ) ) ( not ( = ?auto_122499 ?auto_122503 ) ) ( not ( = ?auto_122500 ?auto_122503 ) ) ( not ( = ?auto_122501 ?auto_122503 ) ) ( not ( = ?auto_122502 ?auto_122503 ) ) ( not ( = ?auto_122504 ?auto_122503 ) ) ( ON ?auto_122503 ?auto_122505 ) ( not ( = ?auto_122498 ?auto_122505 ) ) ( not ( = ?auto_122499 ?auto_122505 ) ) ( not ( = ?auto_122500 ?auto_122505 ) ) ( not ( = ?auto_122501 ?auto_122505 ) ) ( not ( = ?auto_122502 ?auto_122505 ) ) ( not ( = ?auto_122504 ?auto_122505 ) ) ( not ( = ?auto_122503 ?auto_122505 ) ) ( ON ?auto_122504 ?auto_122503 ) ( CLEAR ?auto_122501 ) ( ON ?auto_122502 ?auto_122504 ) ( CLEAR ?auto_122502 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122505 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122505 ?auto_122503 ?auto_122504 )
      ( MAKE-5PILE ?auto_122498 ?auto_122499 ?auto_122500 ?auto_122501 ?auto_122502 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122506 - BLOCK
      ?auto_122507 - BLOCK
      ?auto_122508 - BLOCK
      ?auto_122509 - BLOCK
      ?auto_122510 - BLOCK
    )
    :vars
    (
      ?auto_122513 - BLOCK
      ?auto_122511 - BLOCK
      ?auto_122512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122506 ) ( ON ?auto_122507 ?auto_122506 ) ( ON ?auto_122508 ?auto_122507 ) ( not ( = ?auto_122506 ?auto_122507 ) ) ( not ( = ?auto_122506 ?auto_122508 ) ) ( not ( = ?auto_122506 ?auto_122509 ) ) ( not ( = ?auto_122506 ?auto_122510 ) ) ( not ( = ?auto_122506 ?auto_122513 ) ) ( not ( = ?auto_122507 ?auto_122508 ) ) ( not ( = ?auto_122507 ?auto_122509 ) ) ( not ( = ?auto_122507 ?auto_122510 ) ) ( not ( = ?auto_122507 ?auto_122513 ) ) ( not ( = ?auto_122508 ?auto_122509 ) ) ( not ( = ?auto_122508 ?auto_122510 ) ) ( not ( = ?auto_122508 ?auto_122513 ) ) ( not ( = ?auto_122509 ?auto_122510 ) ) ( not ( = ?auto_122509 ?auto_122513 ) ) ( not ( = ?auto_122510 ?auto_122513 ) ) ( not ( = ?auto_122506 ?auto_122511 ) ) ( not ( = ?auto_122507 ?auto_122511 ) ) ( not ( = ?auto_122508 ?auto_122511 ) ) ( not ( = ?auto_122509 ?auto_122511 ) ) ( not ( = ?auto_122510 ?auto_122511 ) ) ( not ( = ?auto_122513 ?auto_122511 ) ) ( ON ?auto_122511 ?auto_122512 ) ( not ( = ?auto_122506 ?auto_122512 ) ) ( not ( = ?auto_122507 ?auto_122512 ) ) ( not ( = ?auto_122508 ?auto_122512 ) ) ( not ( = ?auto_122509 ?auto_122512 ) ) ( not ( = ?auto_122510 ?auto_122512 ) ) ( not ( = ?auto_122513 ?auto_122512 ) ) ( not ( = ?auto_122511 ?auto_122512 ) ) ( ON ?auto_122513 ?auto_122511 ) ( ON ?auto_122510 ?auto_122513 ) ( CLEAR ?auto_122510 ) ( ON-TABLE ?auto_122512 ) ( HOLDING ?auto_122509 ) ( CLEAR ?auto_122508 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122506 ?auto_122507 ?auto_122508 ?auto_122509 )
      ( MAKE-5PILE ?auto_122506 ?auto_122507 ?auto_122508 ?auto_122509 ?auto_122510 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122514 - BLOCK
      ?auto_122515 - BLOCK
      ?auto_122516 - BLOCK
      ?auto_122517 - BLOCK
      ?auto_122518 - BLOCK
    )
    :vars
    (
      ?auto_122521 - BLOCK
      ?auto_122519 - BLOCK
      ?auto_122520 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122514 ) ( ON ?auto_122515 ?auto_122514 ) ( ON ?auto_122516 ?auto_122515 ) ( not ( = ?auto_122514 ?auto_122515 ) ) ( not ( = ?auto_122514 ?auto_122516 ) ) ( not ( = ?auto_122514 ?auto_122517 ) ) ( not ( = ?auto_122514 ?auto_122518 ) ) ( not ( = ?auto_122514 ?auto_122521 ) ) ( not ( = ?auto_122515 ?auto_122516 ) ) ( not ( = ?auto_122515 ?auto_122517 ) ) ( not ( = ?auto_122515 ?auto_122518 ) ) ( not ( = ?auto_122515 ?auto_122521 ) ) ( not ( = ?auto_122516 ?auto_122517 ) ) ( not ( = ?auto_122516 ?auto_122518 ) ) ( not ( = ?auto_122516 ?auto_122521 ) ) ( not ( = ?auto_122517 ?auto_122518 ) ) ( not ( = ?auto_122517 ?auto_122521 ) ) ( not ( = ?auto_122518 ?auto_122521 ) ) ( not ( = ?auto_122514 ?auto_122519 ) ) ( not ( = ?auto_122515 ?auto_122519 ) ) ( not ( = ?auto_122516 ?auto_122519 ) ) ( not ( = ?auto_122517 ?auto_122519 ) ) ( not ( = ?auto_122518 ?auto_122519 ) ) ( not ( = ?auto_122521 ?auto_122519 ) ) ( ON ?auto_122519 ?auto_122520 ) ( not ( = ?auto_122514 ?auto_122520 ) ) ( not ( = ?auto_122515 ?auto_122520 ) ) ( not ( = ?auto_122516 ?auto_122520 ) ) ( not ( = ?auto_122517 ?auto_122520 ) ) ( not ( = ?auto_122518 ?auto_122520 ) ) ( not ( = ?auto_122521 ?auto_122520 ) ) ( not ( = ?auto_122519 ?auto_122520 ) ) ( ON ?auto_122521 ?auto_122519 ) ( ON ?auto_122518 ?auto_122521 ) ( ON-TABLE ?auto_122520 ) ( CLEAR ?auto_122516 ) ( ON ?auto_122517 ?auto_122518 ) ( CLEAR ?auto_122517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122520 ?auto_122519 ?auto_122521 ?auto_122518 )
      ( MAKE-5PILE ?auto_122514 ?auto_122515 ?auto_122516 ?auto_122517 ?auto_122518 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122522 - BLOCK
      ?auto_122523 - BLOCK
      ?auto_122524 - BLOCK
      ?auto_122525 - BLOCK
      ?auto_122526 - BLOCK
    )
    :vars
    (
      ?auto_122528 - BLOCK
      ?auto_122527 - BLOCK
      ?auto_122529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122522 ) ( ON ?auto_122523 ?auto_122522 ) ( not ( = ?auto_122522 ?auto_122523 ) ) ( not ( = ?auto_122522 ?auto_122524 ) ) ( not ( = ?auto_122522 ?auto_122525 ) ) ( not ( = ?auto_122522 ?auto_122526 ) ) ( not ( = ?auto_122522 ?auto_122528 ) ) ( not ( = ?auto_122523 ?auto_122524 ) ) ( not ( = ?auto_122523 ?auto_122525 ) ) ( not ( = ?auto_122523 ?auto_122526 ) ) ( not ( = ?auto_122523 ?auto_122528 ) ) ( not ( = ?auto_122524 ?auto_122525 ) ) ( not ( = ?auto_122524 ?auto_122526 ) ) ( not ( = ?auto_122524 ?auto_122528 ) ) ( not ( = ?auto_122525 ?auto_122526 ) ) ( not ( = ?auto_122525 ?auto_122528 ) ) ( not ( = ?auto_122526 ?auto_122528 ) ) ( not ( = ?auto_122522 ?auto_122527 ) ) ( not ( = ?auto_122523 ?auto_122527 ) ) ( not ( = ?auto_122524 ?auto_122527 ) ) ( not ( = ?auto_122525 ?auto_122527 ) ) ( not ( = ?auto_122526 ?auto_122527 ) ) ( not ( = ?auto_122528 ?auto_122527 ) ) ( ON ?auto_122527 ?auto_122529 ) ( not ( = ?auto_122522 ?auto_122529 ) ) ( not ( = ?auto_122523 ?auto_122529 ) ) ( not ( = ?auto_122524 ?auto_122529 ) ) ( not ( = ?auto_122525 ?auto_122529 ) ) ( not ( = ?auto_122526 ?auto_122529 ) ) ( not ( = ?auto_122528 ?auto_122529 ) ) ( not ( = ?auto_122527 ?auto_122529 ) ) ( ON ?auto_122528 ?auto_122527 ) ( ON ?auto_122526 ?auto_122528 ) ( ON-TABLE ?auto_122529 ) ( ON ?auto_122525 ?auto_122526 ) ( CLEAR ?auto_122525 ) ( HOLDING ?auto_122524 ) ( CLEAR ?auto_122523 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122522 ?auto_122523 ?auto_122524 )
      ( MAKE-5PILE ?auto_122522 ?auto_122523 ?auto_122524 ?auto_122525 ?auto_122526 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122530 - BLOCK
      ?auto_122531 - BLOCK
      ?auto_122532 - BLOCK
      ?auto_122533 - BLOCK
      ?auto_122534 - BLOCK
    )
    :vars
    (
      ?auto_122536 - BLOCK
      ?auto_122537 - BLOCK
      ?auto_122535 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122530 ) ( ON ?auto_122531 ?auto_122530 ) ( not ( = ?auto_122530 ?auto_122531 ) ) ( not ( = ?auto_122530 ?auto_122532 ) ) ( not ( = ?auto_122530 ?auto_122533 ) ) ( not ( = ?auto_122530 ?auto_122534 ) ) ( not ( = ?auto_122530 ?auto_122536 ) ) ( not ( = ?auto_122531 ?auto_122532 ) ) ( not ( = ?auto_122531 ?auto_122533 ) ) ( not ( = ?auto_122531 ?auto_122534 ) ) ( not ( = ?auto_122531 ?auto_122536 ) ) ( not ( = ?auto_122532 ?auto_122533 ) ) ( not ( = ?auto_122532 ?auto_122534 ) ) ( not ( = ?auto_122532 ?auto_122536 ) ) ( not ( = ?auto_122533 ?auto_122534 ) ) ( not ( = ?auto_122533 ?auto_122536 ) ) ( not ( = ?auto_122534 ?auto_122536 ) ) ( not ( = ?auto_122530 ?auto_122537 ) ) ( not ( = ?auto_122531 ?auto_122537 ) ) ( not ( = ?auto_122532 ?auto_122537 ) ) ( not ( = ?auto_122533 ?auto_122537 ) ) ( not ( = ?auto_122534 ?auto_122537 ) ) ( not ( = ?auto_122536 ?auto_122537 ) ) ( ON ?auto_122537 ?auto_122535 ) ( not ( = ?auto_122530 ?auto_122535 ) ) ( not ( = ?auto_122531 ?auto_122535 ) ) ( not ( = ?auto_122532 ?auto_122535 ) ) ( not ( = ?auto_122533 ?auto_122535 ) ) ( not ( = ?auto_122534 ?auto_122535 ) ) ( not ( = ?auto_122536 ?auto_122535 ) ) ( not ( = ?auto_122537 ?auto_122535 ) ) ( ON ?auto_122536 ?auto_122537 ) ( ON ?auto_122534 ?auto_122536 ) ( ON-TABLE ?auto_122535 ) ( ON ?auto_122533 ?auto_122534 ) ( CLEAR ?auto_122531 ) ( ON ?auto_122532 ?auto_122533 ) ( CLEAR ?auto_122532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122535 ?auto_122537 ?auto_122536 ?auto_122534 ?auto_122533 )
      ( MAKE-5PILE ?auto_122530 ?auto_122531 ?auto_122532 ?auto_122533 ?auto_122534 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122538 - BLOCK
      ?auto_122539 - BLOCK
      ?auto_122540 - BLOCK
      ?auto_122541 - BLOCK
      ?auto_122542 - BLOCK
    )
    :vars
    (
      ?auto_122545 - BLOCK
      ?auto_122544 - BLOCK
      ?auto_122543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122538 ) ( not ( = ?auto_122538 ?auto_122539 ) ) ( not ( = ?auto_122538 ?auto_122540 ) ) ( not ( = ?auto_122538 ?auto_122541 ) ) ( not ( = ?auto_122538 ?auto_122542 ) ) ( not ( = ?auto_122538 ?auto_122545 ) ) ( not ( = ?auto_122539 ?auto_122540 ) ) ( not ( = ?auto_122539 ?auto_122541 ) ) ( not ( = ?auto_122539 ?auto_122542 ) ) ( not ( = ?auto_122539 ?auto_122545 ) ) ( not ( = ?auto_122540 ?auto_122541 ) ) ( not ( = ?auto_122540 ?auto_122542 ) ) ( not ( = ?auto_122540 ?auto_122545 ) ) ( not ( = ?auto_122541 ?auto_122542 ) ) ( not ( = ?auto_122541 ?auto_122545 ) ) ( not ( = ?auto_122542 ?auto_122545 ) ) ( not ( = ?auto_122538 ?auto_122544 ) ) ( not ( = ?auto_122539 ?auto_122544 ) ) ( not ( = ?auto_122540 ?auto_122544 ) ) ( not ( = ?auto_122541 ?auto_122544 ) ) ( not ( = ?auto_122542 ?auto_122544 ) ) ( not ( = ?auto_122545 ?auto_122544 ) ) ( ON ?auto_122544 ?auto_122543 ) ( not ( = ?auto_122538 ?auto_122543 ) ) ( not ( = ?auto_122539 ?auto_122543 ) ) ( not ( = ?auto_122540 ?auto_122543 ) ) ( not ( = ?auto_122541 ?auto_122543 ) ) ( not ( = ?auto_122542 ?auto_122543 ) ) ( not ( = ?auto_122545 ?auto_122543 ) ) ( not ( = ?auto_122544 ?auto_122543 ) ) ( ON ?auto_122545 ?auto_122544 ) ( ON ?auto_122542 ?auto_122545 ) ( ON-TABLE ?auto_122543 ) ( ON ?auto_122541 ?auto_122542 ) ( ON ?auto_122540 ?auto_122541 ) ( CLEAR ?auto_122540 ) ( HOLDING ?auto_122539 ) ( CLEAR ?auto_122538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122538 ?auto_122539 )
      ( MAKE-5PILE ?auto_122538 ?auto_122539 ?auto_122540 ?auto_122541 ?auto_122542 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122546 - BLOCK
      ?auto_122547 - BLOCK
      ?auto_122548 - BLOCK
      ?auto_122549 - BLOCK
      ?auto_122550 - BLOCK
    )
    :vars
    (
      ?auto_122551 - BLOCK
      ?auto_122552 - BLOCK
      ?auto_122553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122546 ) ( not ( = ?auto_122546 ?auto_122547 ) ) ( not ( = ?auto_122546 ?auto_122548 ) ) ( not ( = ?auto_122546 ?auto_122549 ) ) ( not ( = ?auto_122546 ?auto_122550 ) ) ( not ( = ?auto_122546 ?auto_122551 ) ) ( not ( = ?auto_122547 ?auto_122548 ) ) ( not ( = ?auto_122547 ?auto_122549 ) ) ( not ( = ?auto_122547 ?auto_122550 ) ) ( not ( = ?auto_122547 ?auto_122551 ) ) ( not ( = ?auto_122548 ?auto_122549 ) ) ( not ( = ?auto_122548 ?auto_122550 ) ) ( not ( = ?auto_122548 ?auto_122551 ) ) ( not ( = ?auto_122549 ?auto_122550 ) ) ( not ( = ?auto_122549 ?auto_122551 ) ) ( not ( = ?auto_122550 ?auto_122551 ) ) ( not ( = ?auto_122546 ?auto_122552 ) ) ( not ( = ?auto_122547 ?auto_122552 ) ) ( not ( = ?auto_122548 ?auto_122552 ) ) ( not ( = ?auto_122549 ?auto_122552 ) ) ( not ( = ?auto_122550 ?auto_122552 ) ) ( not ( = ?auto_122551 ?auto_122552 ) ) ( ON ?auto_122552 ?auto_122553 ) ( not ( = ?auto_122546 ?auto_122553 ) ) ( not ( = ?auto_122547 ?auto_122553 ) ) ( not ( = ?auto_122548 ?auto_122553 ) ) ( not ( = ?auto_122549 ?auto_122553 ) ) ( not ( = ?auto_122550 ?auto_122553 ) ) ( not ( = ?auto_122551 ?auto_122553 ) ) ( not ( = ?auto_122552 ?auto_122553 ) ) ( ON ?auto_122551 ?auto_122552 ) ( ON ?auto_122550 ?auto_122551 ) ( ON-TABLE ?auto_122553 ) ( ON ?auto_122549 ?auto_122550 ) ( ON ?auto_122548 ?auto_122549 ) ( CLEAR ?auto_122546 ) ( ON ?auto_122547 ?auto_122548 ) ( CLEAR ?auto_122547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122553 ?auto_122552 ?auto_122551 ?auto_122550 ?auto_122549 ?auto_122548 )
      ( MAKE-5PILE ?auto_122546 ?auto_122547 ?auto_122548 ?auto_122549 ?auto_122550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122554 - BLOCK
      ?auto_122555 - BLOCK
      ?auto_122556 - BLOCK
      ?auto_122557 - BLOCK
      ?auto_122558 - BLOCK
    )
    :vars
    (
      ?auto_122560 - BLOCK
      ?auto_122559 - BLOCK
      ?auto_122561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122554 ?auto_122555 ) ) ( not ( = ?auto_122554 ?auto_122556 ) ) ( not ( = ?auto_122554 ?auto_122557 ) ) ( not ( = ?auto_122554 ?auto_122558 ) ) ( not ( = ?auto_122554 ?auto_122560 ) ) ( not ( = ?auto_122555 ?auto_122556 ) ) ( not ( = ?auto_122555 ?auto_122557 ) ) ( not ( = ?auto_122555 ?auto_122558 ) ) ( not ( = ?auto_122555 ?auto_122560 ) ) ( not ( = ?auto_122556 ?auto_122557 ) ) ( not ( = ?auto_122556 ?auto_122558 ) ) ( not ( = ?auto_122556 ?auto_122560 ) ) ( not ( = ?auto_122557 ?auto_122558 ) ) ( not ( = ?auto_122557 ?auto_122560 ) ) ( not ( = ?auto_122558 ?auto_122560 ) ) ( not ( = ?auto_122554 ?auto_122559 ) ) ( not ( = ?auto_122555 ?auto_122559 ) ) ( not ( = ?auto_122556 ?auto_122559 ) ) ( not ( = ?auto_122557 ?auto_122559 ) ) ( not ( = ?auto_122558 ?auto_122559 ) ) ( not ( = ?auto_122560 ?auto_122559 ) ) ( ON ?auto_122559 ?auto_122561 ) ( not ( = ?auto_122554 ?auto_122561 ) ) ( not ( = ?auto_122555 ?auto_122561 ) ) ( not ( = ?auto_122556 ?auto_122561 ) ) ( not ( = ?auto_122557 ?auto_122561 ) ) ( not ( = ?auto_122558 ?auto_122561 ) ) ( not ( = ?auto_122560 ?auto_122561 ) ) ( not ( = ?auto_122559 ?auto_122561 ) ) ( ON ?auto_122560 ?auto_122559 ) ( ON ?auto_122558 ?auto_122560 ) ( ON-TABLE ?auto_122561 ) ( ON ?auto_122557 ?auto_122558 ) ( ON ?auto_122556 ?auto_122557 ) ( ON ?auto_122555 ?auto_122556 ) ( CLEAR ?auto_122555 ) ( HOLDING ?auto_122554 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122554 )
      ( MAKE-5PILE ?auto_122554 ?auto_122555 ?auto_122556 ?auto_122557 ?auto_122558 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_122562 - BLOCK
      ?auto_122563 - BLOCK
      ?auto_122564 - BLOCK
      ?auto_122565 - BLOCK
      ?auto_122566 - BLOCK
    )
    :vars
    (
      ?auto_122568 - BLOCK
      ?auto_122567 - BLOCK
      ?auto_122569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122562 ?auto_122563 ) ) ( not ( = ?auto_122562 ?auto_122564 ) ) ( not ( = ?auto_122562 ?auto_122565 ) ) ( not ( = ?auto_122562 ?auto_122566 ) ) ( not ( = ?auto_122562 ?auto_122568 ) ) ( not ( = ?auto_122563 ?auto_122564 ) ) ( not ( = ?auto_122563 ?auto_122565 ) ) ( not ( = ?auto_122563 ?auto_122566 ) ) ( not ( = ?auto_122563 ?auto_122568 ) ) ( not ( = ?auto_122564 ?auto_122565 ) ) ( not ( = ?auto_122564 ?auto_122566 ) ) ( not ( = ?auto_122564 ?auto_122568 ) ) ( not ( = ?auto_122565 ?auto_122566 ) ) ( not ( = ?auto_122565 ?auto_122568 ) ) ( not ( = ?auto_122566 ?auto_122568 ) ) ( not ( = ?auto_122562 ?auto_122567 ) ) ( not ( = ?auto_122563 ?auto_122567 ) ) ( not ( = ?auto_122564 ?auto_122567 ) ) ( not ( = ?auto_122565 ?auto_122567 ) ) ( not ( = ?auto_122566 ?auto_122567 ) ) ( not ( = ?auto_122568 ?auto_122567 ) ) ( ON ?auto_122567 ?auto_122569 ) ( not ( = ?auto_122562 ?auto_122569 ) ) ( not ( = ?auto_122563 ?auto_122569 ) ) ( not ( = ?auto_122564 ?auto_122569 ) ) ( not ( = ?auto_122565 ?auto_122569 ) ) ( not ( = ?auto_122566 ?auto_122569 ) ) ( not ( = ?auto_122568 ?auto_122569 ) ) ( not ( = ?auto_122567 ?auto_122569 ) ) ( ON ?auto_122568 ?auto_122567 ) ( ON ?auto_122566 ?auto_122568 ) ( ON-TABLE ?auto_122569 ) ( ON ?auto_122565 ?auto_122566 ) ( ON ?auto_122564 ?auto_122565 ) ( ON ?auto_122563 ?auto_122564 ) ( ON ?auto_122562 ?auto_122563 ) ( CLEAR ?auto_122562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122569 ?auto_122567 ?auto_122568 ?auto_122566 ?auto_122565 ?auto_122564 ?auto_122563 )
      ( MAKE-5PILE ?auto_122562 ?auto_122563 ?auto_122564 ?auto_122565 ?auto_122566 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122572 - BLOCK
      ?auto_122573 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_122573 ) ( CLEAR ?auto_122572 ) ( ON-TABLE ?auto_122572 ) ( not ( = ?auto_122572 ?auto_122573 ) ) )
    :subtasks
    ( ( !STACK ?auto_122573 ?auto_122572 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122574 - BLOCK
      ?auto_122575 - BLOCK
    )
    :vars
    (
      ?auto_122576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_122574 ) ( ON-TABLE ?auto_122574 ) ( not ( = ?auto_122574 ?auto_122575 ) ) ( ON ?auto_122575 ?auto_122576 ) ( CLEAR ?auto_122575 ) ( HAND-EMPTY ) ( not ( = ?auto_122574 ?auto_122576 ) ) ( not ( = ?auto_122575 ?auto_122576 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122575 ?auto_122576 )
      ( MAKE-2PILE ?auto_122574 ?auto_122575 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122577 - BLOCK
      ?auto_122578 - BLOCK
    )
    :vars
    (
      ?auto_122579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122577 ?auto_122578 ) ) ( ON ?auto_122578 ?auto_122579 ) ( CLEAR ?auto_122578 ) ( not ( = ?auto_122577 ?auto_122579 ) ) ( not ( = ?auto_122578 ?auto_122579 ) ) ( HOLDING ?auto_122577 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122577 )
      ( MAKE-2PILE ?auto_122577 ?auto_122578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122580 - BLOCK
      ?auto_122581 - BLOCK
    )
    :vars
    (
      ?auto_122582 - BLOCK
      ?auto_122585 - BLOCK
      ?auto_122586 - BLOCK
      ?auto_122584 - BLOCK
      ?auto_122583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122580 ?auto_122581 ) ) ( ON ?auto_122581 ?auto_122582 ) ( not ( = ?auto_122580 ?auto_122582 ) ) ( not ( = ?auto_122581 ?auto_122582 ) ) ( ON ?auto_122580 ?auto_122581 ) ( CLEAR ?auto_122580 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122585 ) ( ON ?auto_122586 ?auto_122585 ) ( ON ?auto_122584 ?auto_122586 ) ( ON ?auto_122583 ?auto_122584 ) ( ON ?auto_122582 ?auto_122583 ) ( not ( = ?auto_122585 ?auto_122586 ) ) ( not ( = ?auto_122585 ?auto_122584 ) ) ( not ( = ?auto_122585 ?auto_122583 ) ) ( not ( = ?auto_122585 ?auto_122582 ) ) ( not ( = ?auto_122585 ?auto_122581 ) ) ( not ( = ?auto_122585 ?auto_122580 ) ) ( not ( = ?auto_122586 ?auto_122584 ) ) ( not ( = ?auto_122586 ?auto_122583 ) ) ( not ( = ?auto_122586 ?auto_122582 ) ) ( not ( = ?auto_122586 ?auto_122581 ) ) ( not ( = ?auto_122586 ?auto_122580 ) ) ( not ( = ?auto_122584 ?auto_122583 ) ) ( not ( = ?auto_122584 ?auto_122582 ) ) ( not ( = ?auto_122584 ?auto_122581 ) ) ( not ( = ?auto_122584 ?auto_122580 ) ) ( not ( = ?auto_122583 ?auto_122582 ) ) ( not ( = ?auto_122583 ?auto_122581 ) ) ( not ( = ?auto_122583 ?auto_122580 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122585 ?auto_122586 ?auto_122584 ?auto_122583 ?auto_122582 ?auto_122581 )
      ( MAKE-2PILE ?auto_122580 ?auto_122581 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122587 - BLOCK
      ?auto_122588 - BLOCK
    )
    :vars
    (
      ?auto_122591 - BLOCK
      ?auto_122593 - BLOCK
      ?auto_122592 - BLOCK
      ?auto_122590 - BLOCK
      ?auto_122589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122587 ?auto_122588 ) ) ( ON ?auto_122588 ?auto_122591 ) ( not ( = ?auto_122587 ?auto_122591 ) ) ( not ( = ?auto_122588 ?auto_122591 ) ) ( ON-TABLE ?auto_122593 ) ( ON ?auto_122592 ?auto_122593 ) ( ON ?auto_122590 ?auto_122592 ) ( ON ?auto_122589 ?auto_122590 ) ( ON ?auto_122591 ?auto_122589 ) ( not ( = ?auto_122593 ?auto_122592 ) ) ( not ( = ?auto_122593 ?auto_122590 ) ) ( not ( = ?auto_122593 ?auto_122589 ) ) ( not ( = ?auto_122593 ?auto_122591 ) ) ( not ( = ?auto_122593 ?auto_122588 ) ) ( not ( = ?auto_122593 ?auto_122587 ) ) ( not ( = ?auto_122592 ?auto_122590 ) ) ( not ( = ?auto_122592 ?auto_122589 ) ) ( not ( = ?auto_122592 ?auto_122591 ) ) ( not ( = ?auto_122592 ?auto_122588 ) ) ( not ( = ?auto_122592 ?auto_122587 ) ) ( not ( = ?auto_122590 ?auto_122589 ) ) ( not ( = ?auto_122590 ?auto_122591 ) ) ( not ( = ?auto_122590 ?auto_122588 ) ) ( not ( = ?auto_122590 ?auto_122587 ) ) ( not ( = ?auto_122589 ?auto_122591 ) ) ( not ( = ?auto_122589 ?auto_122588 ) ) ( not ( = ?auto_122589 ?auto_122587 ) ) ( HOLDING ?auto_122587 ) ( CLEAR ?auto_122588 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122593 ?auto_122592 ?auto_122590 ?auto_122589 ?auto_122591 ?auto_122588 ?auto_122587 )
      ( MAKE-2PILE ?auto_122587 ?auto_122588 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122594 - BLOCK
      ?auto_122595 - BLOCK
    )
    :vars
    (
      ?auto_122599 - BLOCK
      ?auto_122597 - BLOCK
      ?auto_122600 - BLOCK
      ?auto_122598 - BLOCK
      ?auto_122596 - BLOCK
      ?auto_122601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122594 ?auto_122595 ) ) ( ON ?auto_122595 ?auto_122599 ) ( not ( = ?auto_122594 ?auto_122599 ) ) ( not ( = ?auto_122595 ?auto_122599 ) ) ( ON-TABLE ?auto_122597 ) ( ON ?auto_122600 ?auto_122597 ) ( ON ?auto_122598 ?auto_122600 ) ( ON ?auto_122596 ?auto_122598 ) ( ON ?auto_122599 ?auto_122596 ) ( not ( = ?auto_122597 ?auto_122600 ) ) ( not ( = ?auto_122597 ?auto_122598 ) ) ( not ( = ?auto_122597 ?auto_122596 ) ) ( not ( = ?auto_122597 ?auto_122599 ) ) ( not ( = ?auto_122597 ?auto_122595 ) ) ( not ( = ?auto_122597 ?auto_122594 ) ) ( not ( = ?auto_122600 ?auto_122598 ) ) ( not ( = ?auto_122600 ?auto_122596 ) ) ( not ( = ?auto_122600 ?auto_122599 ) ) ( not ( = ?auto_122600 ?auto_122595 ) ) ( not ( = ?auto_122600 ?auto_122594 ) ) ( not ( = ?auto_122598 ?auto_122596 ) ) ( not ( = ?auto_122598 ?auto_122599 ) ) ( not ( = ?auto_122598 ?auto_122595 ) ) ( not ( = ?auto_122598 ?auto_122594 ) ) ( not ( = ?auto_122596 ?auto_122599 ) ) ( not ( = ?auto_122596 ?auto_122595 ) ) ( not ( = ?auto_122596 ?auto_122594 ) ) ( CLEAR ?auto_122595 ) ( ON ?auto_122594 ?auto_122601 ) ( CLEAR ?auto_122594 ) ( HAND-EMPTY ) ( not ( = ?auto_122594 ?auto_122601 ) ) ( not ( = ?auto_122595 ?auto_122601 ) ) ( not ( = ?auto_122599 ?auto_122601 ) ) ( not ( = ?auto_122597 ?auto_122601 ) ) ( not ( = ?auto_122600 ?auto_122601 ) ) ( not ( = ?auto_122598 ?auto_122601 ) ) ( not ( = ?auto_122596 ?auto_122601 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122594 ?auto_122601 )
      ( MAKE-2PILE ?auto_122594 ?auto_122595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122602 - BLOCK
      ?auto_122603 - BLOCK
    )
    :vars
    (
      ?auto_122609 - BLOCK
      ?auto_122608 - BLOCK
      ?auto_122604 - BLOCK
      ?auto_122607 - BLOCK
      ?auto_122606 - BLOCK
      ?auto_122605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122602 ?auto_122603 ) ) ( not ( = ?auto_122602 ?auto_122609 ) ) ( not ( = ?auto_122603 ?auto_122609 ) ) ( ON-TABLE ?auto_122608 ) ( ON ?auto_122604 ?auto_122608 ) ( ON ?auto_122607 ?auto_122604 ) ( ON ?auto_122606 ?auto_122607 ) ( ON ?auto_122609 ?auto_122606 ) ( not ( = ?auto_122608 ?auto_122604 ) ) ( not ( = ?auto_122608 ?auto_122607 ) ) ( not ( = ?auto_122608 ?auto_122606 ) ) ( not ( = ?auto_122608 ?auto_122609 ) ) ( not ( = ?auto_122608 ?auto_122603 ) ) ( not ( = ?auto_122608 ?auto_122602 ) ) ( not ( = ?auto_122604 ?auto_122607 ) ) ( not ( = ?auto_122604 ?auto_122606 ) ) ( not ( = ?auto_122604 ?auto_122609 ) ) ( not ( = ?auto_122604 ?auto_122603 ) ) ( not ( = ?auto_122604 ?auto_122602 ) ) ( not ( = ?auto_122607 ?auto_122606 ) ) ( not ( = ?auto_122607 ?auto_122609 ) ) ( not ( = ?auto_122607 ?auto_122603 ) ) ( not ( = ?auto_122607 ?auto_122602 ) ) ( not ( = ?auto_122606 ?auto_122609 ) ) ( not ( = ?auto_122606 ?auto_122603 ) ) ( not ( = ?auto_122606 ?auto_122602 ) ) ( ON ?auto_122602 ?auto_122605 ) ( CLEAR ?auto_122602 ) ( not ( = ?auto_122602 ?auto_122605 ) ) ( not ( = ?auto_122603 ?auto_122605 ) ) ( not ( = ?auto_122609 ?auto_122605 ) ) ( not ( = ?auto_122608 ?auto_122605 ) ) ( not ( = ?auto_122604 ?auto_122605 ) ) ( not ( = ?auto_122607 ?auto_122605 ) ) ( not ( = ?auto_122606 ?auto_122605 ) ) ( HOLDING ?auto_122603 ) ( CLEAR ?auto_122609 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122608 ?auto_122604 ?auto_122607 ?auto_122606 ?auto_122609 ?auto_122603 )
      ( MAKE-2PILE ?auto_122602 ?auto_122603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122610 - BLOCK
      ?auto_122611 - BLOCK
    )
    :vars
    (
      ?auto_122615 - BLOCK
      ?auto_122614 - BLOCK
      ?auto_122612 - BLOCK
      ?auto_122613 - BLOCK
      ?auto_122616 - BLOCK
      ?auto_122617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122610 ?auto_122611 ) ) ( not ( = ?auto_122610 ?auto_122615 ) ) ( not ( = ?auto_122611 ?auto_122615 ) ) ( ON-TABLE ?auto_122614 ) ( ON ?auto_122612 ?auto_122614 ) ( ON ?auto_122613 ?auto_122612 ) ( ON ?auto_122616 ?auto_122613 ) ( ON ?auto_122615 ?auto_122616 ) ( not ( = ?auto_122614 ?auto_122612 ) ) ( not ( = ?auto_122614 ?auto_122613 ) ) ( not ( = ?auto_122614 ?auto_122616 ) ) ( not ( = ?auto_122614 ?auto_122615 ) ) ( not ( = ?auto_122614 ?auto_122611 ) ) ( not ( = ?auto_122614 ?auto_122610 ) ) ( not ( = ?auto_122612 ?auto_122613 ) ) ( not ( = ?auto_122612 ?auto_122616 ) ) ( not ( = ?auto_122612 ?auto_122615 ) ) ( not ( = ?auto_122612 ?auto_122611 ) ) ( not ( = ?auto_122612 ?auto_122610 ) ) ( not ( = ?auto_122613 ?auto_122616 ) ) ( not ( = ?auto_122613 ?auto_122615 ) ) ( not ( = ?auto_122613 ?auto_122611 ) ) ( not ( = ?auto_122613 ?auto_122610 ) ) ( not ( = ?auto_122616 ?auto_122615 ) ) ( not ( = ?auto_122616 ?auto_122611 ) ) ( not ( = ?auto_122616 ?auto_122610 ) ) ( ON ?auto_122610 ?auto_122617 ) ( not ( = ?auto_122610 ?auto_122617 ) ) ( not ( = ?auto_122611 ?auto_122617 ) ) ( not ( = ?auto_122615 ?auto_122617 ) ) ( not ( = ?auto_122614 ?auto_122617 ) ) ( not ( = ?auto_122612 ?auto_122617 ) ) ( not ( = ?auto_122613 ?auto_122617 ) ) ( not ( = ?auto_122616 ?auto_122617 ) ) ( CLEAR ?auto_122615 ) ( ON ?auto_122611 ?auto_122610 ) ( CLEAR ?auto_122611 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122617 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122617 ?auto_122610 )
      ( MAKE-2PILE ?auto_122610 ?auto_122611 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122618 - BLOCK
      ?auto_122619 - BLOCK
    )
    :vars
    (
      ?auto_122624 - BLOCK
      ?auto_122622 - BLOCK
      ?auto_122620 - BLOCK
      ?auto_122621 - BLOCK
      ?auto_122625 - BLOCK
      ?auto_122623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122618 ?auto_122619 ) ) ( not ( = ?auto_122618 ?auto_122624 ) ) ( not ( = ?auto_122619 ?auto_122624 ) ) ( ON-TABLE ?auto_122622 ) ( ON ?auto_122620 ?auto_122622 ) ( ON ?auto_122621 ?auto_122620 ) ( ON ?auto_122625 ?auto_122621 ) ( not ( = ?auto_122622 ?auto_122620 ) ) ( not ( = ?auto_122622 ?auto_122621 ) ) ( not ( = ?auto_122622 ?auto_122625 ) ) ( not ( = ?auto_122622 ?auto_122624 ) ) ( not ( = ?auto_122622 ?auto_122619 ) ) ( not ( = ?auto_122622 ?auto_122618 ) ) ( not ( = ?auto_122620 ?auto_122621 ) ) ( not ( = ?auto_122620 ?auto_122625 ) ) ( not ( = ?auto_122620 ?auto_122624 ) ) ( not ( = ?auto_122620 ?auto_122619 ) ) ( not ( = ?auto_122620 ?auto_122618 ) ) ( not ( = ?auto_122621 ?auto_122625 ) ) ( not ( = ?auto_122621 ?auto_122624 ) ) ( not ( = ?auto_122621 ?auto_122619 ) ) ( not ( = ?auto_122621 ?auto_122618 ) ) ( not ( = ?auto_122625 ?auto_122624 ) ) ( not ( = ?auto_122625 ?auto_122619 ) ) ( not ( = ?auto_122625 ?auto_122618 ) ) ( ON ?auto_122618 ?auto_122623 ) ( not ( = ?auto_122618 ?auto_122623 ) ) ( not ( = ?auto_122619 ?auto_122623 ) ) ( not ( = ?auto_122624 ?auto_122623 ) ) ( not ( = ?auto_122622 ?auto_122623 ) ) ( not ( = ?auto_122620 ?auto_122623 ) ) ( not ( = ?auto_122621 ?auto_122623 ) ) ( not ( = ?auto_122625 ?auto_122623 ) ) ( ON ?auto_122619 ?auto_122618 ) ( CLEAR ?auto_122619 ) ( ON-TABLE ?auto_122623 ) ( HOLDING ?auto_122624 ) ( CLEAR ?auto_122625 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122622 ?auto_122620 ?auto_122621 ?auto_122625 ?auto_122624 )
      ( MAKE-2PILE ?auto_122618 ?auto_122619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122626 - BLOCK
      ?auto_122627 - BLOCK
    )
    :vars
    (
      ?auto_122628 - BLOCK
      ?auto_122629 - BLOCK
      ?auto_122630 - BLOCK
      ?auto_122632 - BLOCK
      ?auto_122633 - BLOCK
      ?auto_122631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122626 ?auto_122627 ) ) ( not ( = ?auto_122626 ?auto_122628 ) ) ( not ( = ?auto_122627 ?auto_122628 ) ) ( ON-TABLE ?auto_122629 ) ( ON ?auto_122630 ?auto_122629 ) ( ON ?auto_122632 ?auto_122630 ) ( ON ?auto_122633 ?auto_122632 ) ( not ( = ?auto_122629 ?auto_122630 ) ) ( not ( = ?auto_122629 ?auto_122632 ) ) ( not ( = ?auto_122629 ?auto_122633 ) ) ( not ( = ?auto_122629 ?auto_122628 ) ) ( not ( = ?auto_122629 ?auto_122627 ) ) ( not ( = ?auto_122629 ?auto_122626 ) ) ( not ( = ?auto_122630 ?auto_122632 ) ) ( not ( = ?auto_122630 ?auto_122633 ) ) ( not ( = ?auto_122630 ?auto_122628 ) ) ( not ( = ?auto_122630 ?auto_122627 ) ) ( not ( = ?auto_122630 ?auto_122626 ) ) ( not ( = ?auto_122632 ?auto_122633 ) ) ( not ( = ?auto_122632 ?auto_122628 ) ) ( not ( = ?auto_122632 ?auto_122627 ) ) ( not ( = ?auto_122632 ?auto_122626 ) ) ( not ( = ?auto_122633 ?auto_122628 ) ) ( not ( = ?auto_122633 ?auto_122627 ) ) ( not ( = ?auto_122633 ?auto_122626 ) ) ( ON ?auto_122626 ?auto_122631 ) ( not ( = ?auto_122626 ?auto_122631 ) ) ( not ( = ?auto_122627 ?auto_122631 ) ) ( not ( = ?auto_122628 ?auto_122631 ) ) ( not ( = ?auto_122629 ?auto_122631 ) ) ( not ( = ?auto_122630 ?auto_122631 ) ) ( not ( = ?auto_122632 ?auto_122631 ) ) ( not ( = ?auto_122633 ?auto_122631 ) ) ( ON ?auto_122627 ?auto_122626 ) ( ON-TABLE ?auto_122631 ) ( CLEAR ?auto_122633 ) ( ON ?auto_122628 ?auto_122627 ) ( CLEAR ?auto_122628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122631 ?auto_122626 ?auto_122627 )
      ( MAKE-2PILE ?auto_122626 ?auto_122627 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122634 - BLOCK
      ?auto_122635 - BLOCK
    )
    :vars
    (
      ?auto_122638 - BLOCK
      ?auto_122640 - BLOCK
      ?auto_122637 - BLOCK
      ?auto_122636 - BLOCK
      ?auto_122639 - BLOCK
      ?auto_122641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122634 ?auto_122635 ) ) ( not ( = ?auto_122634 ?auto_122638 ) ) ( not ( = ?auto_122635 ?auto_122638 ) ) ( ON-TABLE ?auto_122640 ) ( ON ?auto_122637 ?auto_122640 ) ( ON ?auto_122636 ?auto_122637 ) ( not ( = ?auto_122640 ?auto_122637 ) ) ( not ( = ?auto_122640 ?auto_122636 ) ) ( not ( = ?auto_122640 ?auto_122639 ) ) ( not ( = ?auto_122640 ?auto_122638 ) ) ( not ( = ?auto_122640 ?auto_122635 ) ) ( not ( = ?auto_122640 ?auto_122634 ) ) ( not ( = ?auto_122637 ?auto_122636 ) ) ( not ( = ?auto_122637 ?auto_122639 ) ) ( not ( = ?auto_122637 ?auto_122638 ) ) ( not ( = ?auto_122637 ?auto_122635 ) ) ( not ( = ?auto_122637 ?auto_122634 ) ) ( not ( = ?auto_122636 ?auto_122639 ) ) ( not ( = ?auto_122636 ?auto_122638 ) ) ( not ( = ?auto_122636 ?auto_122635 ) ) ( not ( = ?auto_122636 ?auto_122634 ) ) ( not ( = ?auto_122639 ?auto_122638 ) ) ( not ( = ?auto_122639 ?auto_122635 ) ) ( not ( = ?auto_122639 ?auto_122634 ) ) ( ON ?auto_122634 ?auto_122641 ) ( not ( = ?auto_122634 ?auto_122641 ) ) ( not ( = ?auto_122635 ?auto_122641 ) ) ( not ( = ?auto_122638 ?auto_122641 ) ) ( not ( = ?auto_122640 ?auto_122641 ) ) ( not ( = ?auto_122637 ?auto_122641 ) ) ( not ( = ?auto_122636 ?auto_122641 ) ) ( not ( = ?auto_122639 ?auto_122641 ) ) ( ON ?auto_122635 ?auto_122634 ) ( ON-TABLE ?auto_122641 ) ( ON ?auto_122638 ?auto_122635 ) ( CLEAR ?auto_122638 ) ( HOLDING ?auto_122639 ) ( CLEAR ?auto_122636 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122640 ?auto_122637 ?auto_122636 ?auto_122639 )
      ( MAKE-2PILE ?auto_122634 ?auto_122635 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122642 - BLOCK
      ?auto_122643 - BLOCK
    )
    :vars
    (
      ?auto_122645 - BLOCK
      ?auto_122646 - BLOCK
      ?auto_122648 - BLOCK
      ?auto_122647 - BLOCK
      ?auto_122644 - BLOCK
      ?auto_122649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122642 ?auto_122643 ) ) ( not ( = ?auto_122642 ?auto_122645 ) ) ( not ( = ?auto_122643 ?auto_122645 ) ) ( ON-TABLE ?auto_122646 ) ( ON ?auto_122648 ?auto_122646 ) ( ON ?auto_122647 ?auto_122648 ) ( not ( = ?auto_122646 ?auto_122648 ) ) ( not ( = ?auto_122646 ?auto_122647 ) ) ( not ( = ?auto_122646 ?auto_122644 ) ) ( not ( = ?auto_122646 ?auto_122645 ) ) ( not ( = ?auto_122646 ?auto_122643 ) ) ( not ( = ?auto_122646 ?auto_122642 ) ) ( not ( = ?auto_122648 ?auto_122647 ) ) ( not ( = ?auto_122648 ?auto_122644 ) ) ( not ( = ?auto_122648 ?auto_122645 ) ) ( not ( = ?auto_122648 ?auto_122643 ) ) ( not ( = ?auto_122648 ?auto_122642 ) ) ( not ( = ?auto_122647 ?auto_122644 ) ) ( not ( = ?auto_122647 ?auto_122645 ) ) ( not ( = ?auto_122647 ?auto_122643 ) ) ( not ( = ?auto_122647 ?auto_122642 ) ) ( not ( = ?auto_122644 ?auto_122645 ) ) ( not ( = ?auto_122644 ?auto_122643 ) ) ( not ( = ?auto_122644 ?auto_122642 ) ) ( ON ?auto_122642 ?auto_122649 ) ( not ( = ?auto_122642 ?auto_122649 ) ) ( not ( = ?auto_122643 ?auto_122649 ) ) ( not ( = ?auto_122645 ?auto_122649 ) ) ( not ( = ?auto_122646 ?auto_122649 ) ) ( not ( = ?auto_122648 ?auto_122649 ) ) ( not ( = ?auto_122647 ?auto_122649 ) ) ( not ( = ?auto_122644 ?auto_122649 ) ) ( ON ?auto_122643 ?auto_122642 ) ( ON-TABLE ?auto_122649 ) ( ON ?auto_122645 ?auto_122643 ) ( CLEAR ?auto_122647 ) ( ON ?auto_122644 ?auto_122645 ) ( CLEAR ?auto_122644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122649 ?auto_122642 ?auto_122643 ?auto_122645 )
      ( MAKE-2PILE ?auto_122642 ?auto_122643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122650 - BLOCK
      ?auto_122651 - BLOCK
    )
    :vars
    (
      ?auto_122654 - BLOCK
      ?auto_122652 - BLOCK
      ?auto_122656 - BLOCK
      ?auto_122655 - BLOCK
      ?auto_122653 - BLOCK
      ?auto_122657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122650 ?auto_122651 ) ) ( not ( = ?auto_122650 ?auto_122654 ) ) ( not ( = ?auto_122651 ?auto_122654 ) ) ( ON-TABLE ?auto_122652 ) ( ON ?auto_122656 ?auto_122652 ) ( not ( = ?auto_122652 ?auto_122656 ) ) ( not ( = ?auto_122652 ?auto_122655 ) ) ( not ( = ?auto_122652 ?auto_122653 ) ) ( not ( = ?auto_122652 ?auto_122654 ) ) ( not ( = ?auto_122652 ?auto_122651 ) ) ( not ( = ?auto_122652 ?auto_122650 ) ) ( not ( = ?auto_122656 ?auto_122655 ) ) ( not ( = ?auto_122656 ?auto_122653 ) ) ( not ( = ?auto_122656 ?auto_122654 ) ) ( not ( = ?auto_122656 ?auto_122651 ) ) ( not ( = ?auto_122656 ?auto_122650 ) ) ( not ( = ?auto_122655 ?auto_122653 ) ) ( not ( = ?auto_122655 ?auto_122654 ) ) ( not ( = ?auto_122655 ?auto_122651 ) ) ( not ( = ?auto_122655 ?auto_122650 ) ) ( not ( = ?auto_122653 ?auto_122654 ) ) ( not ( = ?auto_122653 ?auto_122651 ) ) ( not ( = ?auto_122653 ?auto_122650 ) ) ( ON ?auto_122650 ?auto_122657 ) ( not ( = ?auto_122650 ?auto_122657 ) ) ( not ( = ?auto_122651 ?auto_122657 ) ) ( not ( = ?auto_122654 ?auto_122657 ) ) ( not ( = ?auto_122652 ?auto_122657 ) ) ( not ( = ?auto_122656 ?auto_122657 ) ) ( not ( = ?auto_122655 ?auto_122657 ) ) ( not ( = ?auto_122653 ?auto_122657 ) ) ( ON ?auto_122651 ?auto_122650 ) ( ON-TABLE ?auto_122657 ) ( ON ?auto_122654 ?auto_122651 ) ( ON ?auto_122653 ?auto_122654 ) ( CLEAR ?auto_122653 ) ( HOLDING ?auto_122655 ) ( CLEAR ?auto_122656 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122652 ?auto_122656 ?auto_122655 )
      ( MAKE-2PILE ?auto_122650 ?auto_122651 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122658 - BLOCK
      ?auto_122659 - BLOCK
    )
    :vars
    (
      ?auto_122665 - BLOCK
      ?auto_122663 - BLOCK
      ?auto_122664 - BLOCK
      ?auto_122660 - BLOCK
      ?auto_122662 - BLOCK
      ?auto_122661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122658 ?auto_122659 ) ) ( not ( = ?auto_122658 ?auto_122665 ) ) ( not ( = ?auto_122659 ?auto_122665 ) ) ( ON-TABLE ?auto_122663 ) ( ON ?auto_122664 ?auto_122663 ) ( not ( = ?auto_122663 ?auto_122664 ) ) ( not ( = ?auto_122663 ?auto_122660 ) ) ( not ( = ?auto_122663 ?auto_122662 ) ) ( not ( = ?auto_122663 ?auto_122665 ) ) ( not ( = ?auto_122663 ?auto_122659 ) ) ( not ( = ?auto_122663 ?auto_122658 ) ) ( not ( = ?auto_122664 ?auto_122660 ) ) ( not ( = ?auto_122664 ?auto_122662 ) ) ( not ( = ?auto_122664 ?auto_122665 ) ) ( not ( = ?auto_122664 ?auto_122659 ) ) ( not ( = ?auto_122664 ?auto_122658 ) ) ( not ( = ?auto_122660 ?auto_122662 ) ) ( not ( = ?auto_122660 ?auto_122665 ) ) ( not ( = ?auto_122660 ?auto_122659 ) ) ( not ( = ?auto_122660 ?auto_122658 ) ) ( not ( = ?auto_122662 ?auto_122665 ) ) ( not ( = ?auto_122662 ?auto_122659 ) ) ( not ( = ?auto_122662 ?auto_122658 ) ) ( ON ?auto_122658 ?auto_122661 ) ( not ( = ?auto_122658 ?auto_122661 ) ) ( not ( = ?auto_122659 ?auto_122661 ) ) ( not ( = ?auto_122665 ?auto_122661 ) ) ( not ( = ?auto_122663 ?auto_122661 ) ) ( not ( = ?auto_122664 ?auto_122661 ) ) ( not ( = ?auto_122660 ?auto_122661 ) ) ( not ( = ?auto_122662 ?auto_122661 ) ) ( ON ?auto_122659 ?auto_122658 ) ( ON-TABLE ?auto_122661 ) ( ON ?auto_122665 ?auto_122659 ) ( ON ?auto_122662 ?auto_122665 ) ( CLEAR ?auto_122664 ) ( ON ?auto_122660 ?auto_122662 ) ( CLEAR ?auto_122660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122661 ?auto_122658 ?auto_122659 ?auto_122665 ?auto_122662 )
      ( MAKE-2PILE ?auto_122658 ?auto_122659 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122666 - BLOCK
      ?auto_122667 - BLOCK
    )
    :vars
    (
      ?auto_122671 - BLOCK
      ?auto_122673 - BLOCK
      ?auto_122670 - BLOCK
      ?auto_122672 - BLOCK
      ?auto_122668 - BLOCK
      ?auto_122669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122666 ?auto_122667 ) ) ( not ( = ?auto_122666 ?auto_122671 ) ) ( not ( = ?auto_122667 ?auto_122671 ) ) ( ON-TABLE ?auto_122673 ) ( not ( = ?auto_122673 ?auto_122670 ) ) ( not ( = ?auto_122673 ?auto_122672 ) ) ( not ( = ?auto_122673 ?auto_122668 ) ) ( not ( = ?auto_122673 ?auto_122671 ) ) ( not ( = ?auto_122673 ?auto_122667 ) ) ( not ( = ?auto_122673 ?auto_122666 ) ) ( not ( = ?auto_122670 ?auto_122672 ) ) ( not ( = ?auto_122670 ?auto_122668 ) ) ( not ( = ?auto_122670 ?auto_122671 ) ) ( not ( = ?auto_122670 ?auto_122667 ) ) ( not ( = ?auto_122670 ?auto_122666 ) ) ( not ( = ?auto_122672 ?auto_122668 ) ) ( not ( = ?auto_122672 ?auto_122671 ) ) ( not ( = ?auto_122672 ?auto_122667 ) ) ( not ( = ?auto_122672 ?auto_122666 ) ) ( not ( = ?auto_122668 ?auto_122671 ) ) ( not ( = ?auto_122668 ?auto_122667 ) ) ( not ( = ?auto_122668 ?auto_122666 ) ) ( ON ?auto_122666 ?auto_122669 ) ( not ( = ?auto_122666 ?auto_122669 ) ) ( not ( = ?auto_122667 ?auto_122669 ) ) ( not ( = ?auto_122671 ?auto_122669 ) ) ( not ( = ?auto_122673 ?auto_122669 ) ) ( not ( = ?auto_122670 ?auto_122669 ) ) ( not ( = ?auto_122672 ?auto_122669 ) ) ( not ( = ?auto_122668 ?auto_122669 ) ) ( ON ?auto_122667 ?auto_122666 ) ( ON-TABLE ?auto_122669 ) ( ON ?auto_122671 ?auto_122667 ) ( ON ?auto_122668 ?auto_122671 ) ( ON ?auto_122672 ?auto_122668 ) ( CLEAR ?auto_122672 ) ( HOLDING ?auto_122670 ) ( CLEAR ?auto_122673 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122673 ?auto_122670 )
      ( MAKE-2PILE ?auto_122666 ?auto_122667 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122674 - BLOCK
      ?auto_122675 - BLOCK
    )
    :vars
    (
      ?auto_122681 - BLOCK
      ?auto_122676 - BLOCK
      ?auto_122680 - BLOCK
      ?auto_122677 - BLOCK
      ?auto_122678 - BLOCK
      ?auto_122679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122674 ?auto_122675 ) ) ( not ( = ?auto_122674 ?auto_122681 ) ) ( not ( = ?auto_122675 ?auto_122681 ) ) ( ON-TABLE ?auto_122676 ) ( not ( = ?auto_122676 ?auto_122680 ) ) ( not ( = ?auto_122676 ?auto_122677 ) ) ( not ( = ?auto_122676 ?auto_122678 ) ) ( not ( = ?auto_122676 ?auto_122681 ) ) ( not ( = ?auto_122676 ?auto_122675 ) ) ( not ( = ?auto_122676 ?auto_122674 ) ) ( not ( = ?auto_122680 ?auto_122677 ) ) ( not ( = ?auto_122680 ?auto_122678 ) ) ( not ( = ?auto_122680 ?auto_122681 ) ) ( not ( = ?auto_122680 ?auto_122675 ) ) ( not ( = ?auto_122680 ?auto_122674 ) ) ( not ( = ?auto_122677 ?auto_122678 ) ) ( not ( = ?auto_122677 ?auto_122681 ) ) ( not ( = ?auto_122677 ?auto_122675 ) ) ( not ( = ?auto_122677 ?auto_122674 ) ) ( not ( = ?auto_122678 ?auto_122681 ) ) ( not ( = ?auto_122678 ?auto_122675 ) ) ( not ( = ?auto_122678 ?auto_122674 ) ) ( ON ?auto_122674 ?auto_122679 ) ( not ( = ?auto_122674 ?auto_122679 ) ) ( not ( = ?auto_122675 ?auto_122679 ) ) ( not ( = ?auto_122681 ?auto_122679 ) ) ( not ( = ?auto_122676 ?auto_122679 ) ) ( not ( = ?auto_122680 ?auto_122679 ) ) ( not ( = ?auto_122677 ?auto_122679 ) ) ( not ( = ?auto_122678 ?auto_122679 ) ) ( ON ?auto_122675 ?auto_122674 ) ( ON-TABLE ?auto_122679 ) ( ON ?auto_122681 ?auto_122675 ) ( ON ?auto_122678 ?auto_122681 ) ( ON ?auto_122677 ?auto_122678 ) ( CLEAR ?auto_122676 ) ( ON ?auto_122680 ?auto_122677 ) ( CLEAR ?auto_122680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122679 ?auto_122674 ?auto_122675 ?auto_122681 ?auto_122678 ?auto_122677 )
      ( MAKE-2PILE ?auto_122674 ?auto_122675 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122682 - BLOCK
      ?auto_122683 - BLOCK
    )
    :vars
    (
      ?auto_122687 - BLOCK
      ?auto_122689 - BLOCK
      ?auto_122686 - BLOCK
      ?auto_122685 - BLOCK
      ?auto_122684 - BLOCK
      ?auto_122688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122682 ?auto_122683 ) ) ( not ( = ?auto_122682 ?auto_122687 ) ) ( not ( = ?auto_122683 ?auto_122687 ) ) ( not ( = ?auto_122689 ?auto_122686 ) ) ( not ( = ?auto_122689 ?auto_122685 ) ) ( not ( = ?auto_122689 ?auto_122684 ) ) ( not ( = ?auto_122689 ?auto_122687 ) ) ( not ( = ?auto_122689 ?auto_122683 ) ) ( not ( = ?auto_122689 ?auto_122682 ) ) ( not ( = ?auto_122686 ?auto_122685 ) ) ( not ( = ?auto_122686 ?auto_122684 ) ) ( not ( = ?auto_122686 ?auto_122687 ) ) ( not ( = ?auto_122686 ?auto_122683 ) ) ( not ( = ?auto_122686 ?auto_122682 ) ) ( not ( = ?auto_122685 ?auto_122684 ) ) ( not ( = ?auto_122685 ?auto_122687 ) ) ( not ( = ?auto_122685 ?auto_122683 ) ) ( not ( = ?auto_122685 ?auto_122682 ) ) ( not ( = ?auto_122684 ?auto_122687 ) ) ( not ( = ?auto_122684 ?auto_122683 ) ) ( not ( = ?auto_122684 ?auto_122682 ) ) ( ON ?auto_122682 ?auto_122688 ) ( not ( = ?auto_122682 ?auto_122688 ) ) ( not ( = ?auto_122683 ?auto_122688 ) ) ( not ( = ?auto_122687 ?auto_122688 ) ) ( not ( = ?auto_122689 ?auto_122688 ) ) ( not ( = ?auto_122686 ?auto_122688 ) ) ( not ( = ?auto_122685 ?auto_122688 ) ) ( not ( = ?auto_122684 ?auto_122688 ) ) ( ON ?auto_122683 ?auto_122682 ) ( ON-TABLE ?auto_122688 ) ( ON ?auto_122687 ?auto_122683 ) ( ON ?auto_122684 ?auto_122687 ) ( ON ?auto_122685 ?auto_122684 ) ( ON ?auto_122686 ?auto_122685 ) ( CLEAR ?auto_122686 ) ( HOLDING ?auto_122689 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122689 )
      ( MAKE-2PILE ?auto_122682 ?auto_122683 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_122690 - BLOCK
      ?auto_122691 - BLOCK
    )
    :vars
    (
      ?auto_122697 - BLOCK
      ?auto_122693 - BLOCK
      ?auto_122696 - BLOCK
      ?auto_122694 - BLOCK
      ?auto_122695 - BLOCK
      ?auto_122692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122690 ?auto_122691 ) ) ( not ( = ?auto_122690 ?auto_122697 ) ) ( not ( = ?auto_122691 ?auto_122697 ) ) ( not ( = ?auto_122693 ?auto_122696 ) ) ( not ( = ?auto_122693 ?auto_122694 ) ) ( not ( = ?auto_122693 ?auto_122695 ) ) ( not ( = ?auto_122693 ?auto_122697 ) ) ( not ( = ?auto_122693 ?auto_122691 ) ) ( not ( = ?auto_122693 ?auto_122690 ) ) ( not ( = ?auto_122696 ?auto_122694 ) ) ( not ( = ?auto_122696 ?auto_122695 ) ) ( not ( = ?auto_122696 ?auto_122697 ) ) ( not ( = ?auto_122696 ?auto_122691 ) ) ( not ( = ?auto_122696 ?auto_122690 ) ) ( not ( = ?auto_122694 ?auto_122695 ) ) ( not ( = ?auto_122694 ?auto_122697 ) ) ( not ( = ?auto_122694 ?auto_122691 ) ) ( not ( = ?auto_122694 ?auto_122690 ) ) ( not ( = ?auto_122695 ?auto_122697 ) ) ( not ( = ?auto_122695 ?auto_122691 ) ) ( not ( = ?auto_122695 ?auto_122690 ) ) ( ON ?auto_122690 ?auto_122692 ) ( not ( = ?auto_122690 ?auto_122692 ) ) ( not ( = ?auto_122691 ?auto_122692 ) ) ( not ( = ?auto_122697 ?auto_122692 ) ) ( not ( = ?auto_122693 ?auto_122692 ) ) ( not ( = ?auto_122696 ?auto_122692 ) ) ( not ( = ?auto_122694 ?auto_122692 ) ) ( not ( = ?auto_122695 ?auto_122692 ) ) ( ON ?auto_122691 ?auto_122690 ) ( ON-TABLE ?auto_122692 ) ( ON ?auto_122697 ?auto_122691 ) ( ON ?auto_122695 ?auto_122697 ) ( ON ?auto_122694 ?auto_122695 ) ( ON ?auto_122696 ?auto_122694 ) ( ON ?auto_122693 ?auto_122696 ) ( CLEAR ?auto_122693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122692 ?auto_122690 ?auto_122691 ?auto_122697 ?auto_122695 ?auto_122694 ?auto_122696 )
      ( MAKE-2PILE ?auto_122690 ?auto_122691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122702 - BLOCK
      ?auto_122703 - BLOCK
      ?auto_122704 - BLOCK
      ?auto_122705 - BLOCK
    )
    :vars
    (
      ?auto_122706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122706 ?auto_122705 ) ( CLEAR ?auto_122706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122702 ) ( ON ?auto_122703 ?auto_122702 ) ( ON ?auto_122704 ?auto_122703 ) ( ON ?auto_122705 ?auto_122704 ) ( not ( = ?auto_122702 ?auto_122703 ) ) ( not ( = ?auto_122702 ?auto_122704 ) ) ( not ( = ?auto_122702 ?auto_122705 ) ) ( not ( = ?auto_122702 ?auto_122706 ) ) ( not ( = ?auto_122703 ?auto_122704 ) ) ( not ( = ?auto_122703 ?auto_122705 ) ) ( not ( = ?auto_122703 ?auto_122706 ) ) ( not ( = ?auto_122704 ?auto_122705 ) ) ( not ( = ?auto_122704 ?auto_122706 ) ) ( not ( = ?auto_122705 ?auto_122706 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122706 ?auto_122705 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122707 - BLOCK
      ?auto_122708 - BLOCK
      ?auto_122709 - BLOCK
      ?auto_122710 - BLOCK
    )
    :vars
    (
      ?auto_122711 - BLOCK
      ?auto_122712 - BLOCK
      ?auto_122713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122711 ?auto_122710 ) ( CLEAR ?auto_122711 ) ( ON-TABLE ?auto_122707 ) ( ON ?auto_122708 ?auto_122707 ) ( ON ?auto_122709 ?auto_122708 ) ( ON ?auto_122710 ?auto_122709 ) ( not ( = ?auto_122707 ?auto_122708 ) ) ( not ( = ?auto_122707 ?auto_122709 ) ) ( not ( = ?auto_122707 ?auto_122710 ) ) ( not ( = ?auto_122707 ?auto_122711 ) ) ( not ( = ?auto_122708 ?auto_122709 ) ) ( not ( = ?auto_122708 ?auto_122710 ) ) ( not ( = ?auto_122708 ?auto_122711 ) ) ( not ( = ?auto_122709 ?auto_122710 ) ) ( not ( = ?auto_122709 ?auto_122711 ) ) ( not ( = ?auto_122710 ?auto_122711 ) ) ( HOLDING ?auto_122712 ) ( CLEAR ?auto_122713 ) ( not ( = ?auto_122707 ?auto_122712 ) ) ( not ( = ?auto_122707 ?auto_122713 ) ) ( not ( = ?auto_122708 ?auto_122712 ) ) ( not ( = ?auto_122708 ?auto_122713 ) ) ( not ( = ?auto_122709 ?auto_122712 ) ) ( not ( = ?auto_122709 ?auto_122713 ) ) ( not ( = ?auto_122710 ?auto_122712 ) ) ( not ( = ?auto_122710 ?auto_122713 ) ) ( not ( = ?auto_122711 ?auto_122712 ) ) ( not ( = ?auto_122711 ?auto_122713 ) ) ( not ( = ?auto_122712 ?auto_122713 ) ) )
    :subtasks
    ( ( !STACK ?auto_122712 ?auto_122713 )
      ( MAKE-4PILE ?auto_122707 ?auto_122708 ?auto_122709 ?auto_122710 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122714 - BLOCK
      ?auto_122715 - BLOCK
      ?auto_122716 - BLOCK
      ?auto_122717 - BLOCK
    )
    :vars
    (
      ?auto_122718 - BLOCK
      ?auto_122720 - BLOCK
      ?auto_122719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122718 ?auto_122717 ) ( ON-TABLE ?auto_122714 ) ( ON ?auto_122715 ?auto_122714 ) ( ON ?auto_122716 ?auto_122715 ) ( ON ?auto_122717 ?auto_122716 ) ( not ( = ?auto_122714 ?auto_122715 ) ) ( not ( = ?auto_122714 ?auto_122716 ) ) ( not ( = ?auto_122714 ?auto_122717 ) ) ( not ( = ?auto_122714 ?auto_122718 ) ) ( not ( = ?auto_122715 ?auto_122716 ) ) ( not ( = ?auto_122715 ?auto_122717 ) ) ( not ( = ?auto_122715 ?auto_122718 ) ) ( not ( = ?auto_122716 ?auto_122717 ) ) ( not ( = ?auto_122716 ?auto_122718 ) ) ( not ( = ?auto_122717 ?auto_122718 ) ) ( CLEAR ?auto_122720 ) ( not ( = ?auto_122714 ?auto_122719 ) ) ( not ( = ?auto_122714 ?auto_122720 ) ) ( not ( = ?auto_122715 ?auto_122719 ) ) ( not ( = ?auto_122715 ?auto_122720 ) ) ( not ( = ?auto_122716 ?auto_122719 ) ) ( not ( = ?auto_122716 ?auto_122720 ) ) ( not ( = ?auto_122717 ?auto_122719 ) ) ( not ( = ?auto_122717 ?auto_122720 ) ) ( not ( = ?auto_122718 ?auto_122719 ) ) ( not ( = ?auto_122718 ?auto_122720 ) ) ( not ( = ?auto_122719 ?auto_122720 ) ) ( ON ?auto_122719 ?auto_122718 ) ( CLEAR ?auto_122719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122714 ?auto_122715 ?auto_122716 ?auto_122717 ?auto_122718 )
      ( MAKE-4PILE ?auto_122714 ?auto_122715 ?auto_122716 ?auto_122717 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122721 - BLOCK
      ?auto_122722 - BLOCK
      ?auto_122723 - BLOCK
      ?auto_122724 - BLOCK
    )
    :vars
    (
      ?auto_122725 - BLOCK
      ?auto_122726 - BLOCK
      ?auto_122727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122725 ?auto_122724 ) ( ON-TABLE ?auto_122721 ) ( ON ?auto_122722 ?auto_122721 ) ( ON ?auto_122723 ?auto_122722 ) ( ON ?auto_122724 ?auto_122723 ) ( not ( = ?auto_122721 ?auto_122722 ) ) ( not ( = ?auto_122721 ?auto_122723 ) ) ( not ( = ?auto_122721 ?auto_122724 ) ) ( not ( = ?auto_122721 ?auto_122725 ) ) ( not ( = ?auto_122722 ?auto_122723 ) ) ( not ( = ?auto_122722 ?auto_122724 ) ) ( not ( = ?auto_122722 ?auto_122725 ) ) ( not ( = ?auto_122723 ?auto_122724 ) ) ( not ( = ?auto_122723 ?auto_122725 ) ) ( not ( = ?auto_122724 ?auto_122725 ) ) ( not ( = ?auto_122721 ?auto_122726 ) ) ( not ( = ?auto_122721 ?auto_122727 ) ) ( not ( = ?auto_122722 ?auto_122726 ) ) ( not ( = ?auto_122722 ?auto_122727 ) ) ( not ( = ?auto_122723 ?auto_122726 ) ) ( not ( = ?auto_122723 ?auto_122727 ) ) ( not ( = ?auto_122724 ?auto_122726 ) ) ( not ( = ?auto_122724 ?auto_122727 ) ) ( not ( = ?auto_122725 ?auto_122726 ) ) ( not ( = ?auto_122725 ?auto_122727 ) ) ( not ( = ?auto_122726 ?auto_122727 ) ) ( ON ?auto_122726 ?auto_122725 ) ( CLEAR ?auto_122726 ) ( HOLDING ?auto_122727 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122727 )
      ( MAKE-4PILE ?auto_122721 ?auto_122722 ?auto_122723 ?auto_122724 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122728 - BLOCK
      ?auto_122729 - BLOCK
      ?auto_122730 - BLOCK
      ?auto_122731 - BLOCK
    )
    :vars
    (
      ?auto_122734 - BLOCK
      ?auto_122733 - BLOCK
      ?auto_122732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122734 ?auto_122731 ) ( ON-TABLE ?auto_122728 ) ( ON ?auto_122729 ?auto_122728 ) ( ON ?auto_122730 ?auto_122729 ) ( ON ?auto_122731 ?auto_122730 ) ( not ( = ?auto_122728 ?auto_122729 ) ) ( not ( = ?auto_122728 ?auto_122730 ) ) ( not ( = ?auto_122728 ?auto_122731 ) ) ( not ( = ?auto_122728 ?auto_122734 ) ) ( not ( = ?auto_122729 ?auto_122730 ) ) ( not ( = ?auto_122729 ?auto_122731 ) ) ( not ( = ?auto_122729 ?auto_122734 ) ) ( not ( = ?auto_122730 ?auto_122731 ) ) ( not ( = ?auto_122730 ?auto_122734 ) ) ( not ( = ?auto_122731 ?auto_122734 ) ) ( not ( = ?auto_122728 ?auto_122733 ) ) ( not ( = ?auto_122728 ?auto_122732 ) ) ( not ( = ?auto_122729 ?auto_122733 ) ) ( not ( = ?auto_122729 ?auto_122732 ) ) ( not ( = ?auto_122730 ?auto_122733 ) ) ( not ( = ?auto_122730 ?auto_122732 ) ) ( not ( = ?auto_122731 ?auto_122733 ) ) ( not ( = ?auto_122731 ?auto_122732 ) ) ( not ( = ?auto_122734 ?auto_122733 ) ) ( not ( = ?auto_122734 ?auto_122732 ) ) ( not ( = ?auto_122733 ?auto_122732 ) ) ( ON ?auto_122733 ?auto_122734 ) ( ON ?auto_122732 ?auto_122733 ) ( CLEAR ?auto_122732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122728 ?auto_122729 ?auto_122730 ?auto_122731 ?auto_122734 ?auto_122733 )
      ( MAKE-4PILE ?auto_122728 ?auto_122729 ?auto_122730 ?auto_122731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122735 - BLOCK
      ?auto_122736 - BLOCK
      ?auto_122737 - BLOCK
      ?auto_122738 - BLOCK
    )
    :vars
    (
      ?auto_122739 - BLOCK
      ?auto_122741 - BLOCK
      ?auto_122740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122739 ?auto_122738 ) ( ON-TABLE ?auto_122735 ) ( ON ?auto_122736 ?auto_122735 ) ( ON ?auto_122737 ?auto_122736 ) ( ON ?auto_122738 ?auto_122737 ) ( not ( = ?auto_122735 ?auto_122736 ) ) ( not ( = ?auto_122735 ?auto_122737 ) ) ( not ( = ?auto_122735 ?auto_122738 ) ) ( not ( = ?auto_122735 ?auto_122739 ) ) ( not ( = ?auto_122736 ?auto_122737 ) ) ( not ( = ?auto_122736 ?auto_122738 ) ) ( not ( = ?auto_122736 ?auto_122739 ) ) ( not ( = ?auto_122737 ?auto_122738 ) ) ( not ( = ?auto_122737 ?auto_122739 ) ) ( not ( = ?auto_122738 ?auto_122739 ) ) ( not ( = ?auto_122735 ?auto_122741 ) ) ( not ( = ?auto_122735 ?auto_122740 ) ) ( not ( = ?auto_122736 ?auto_122741 ) ) ( not ( = ?auto_122736 ?auto_122740 ) ) ( not ( = ?auto_122737 ?auto_122741 ) ) ( not ( = ?auto_122737 ?auto_122740 ) ) ( not ( = ?auto_122738 ?auto_122741 ) ) ( not ( = ?auto_122738 ?auto_122740 ) ) ( not ( = ?auto_122739 ?auto_122741 ) ) ( not ( = ?auto_122739 ?auto_122740 ) ) ( not ( = ?auto_122741 ?auto_122740 ) ) ( ON ?auto_122741 ?auto_122739 ) ( HOLDING ?auto_122740 ) ( CLEAR ?auto_122741 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122735 ?auto_122736 ?auto_122737 ?auto_122738 ?auto_122739 ?auto_122741 ?auto_122740 )
      ( MAKE-4PILE ?auto_122735 ?auto_122736 ?auto_122737 ?auto_122738 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122742 - BLOCK
      ?auto_122743 - BLOCK
      ?auto_122744 - BLOCK
      ?auto_122745 - BLOCK
    )
    :vars
    (
      ?auto_122747 - BLOCK
      ?auto_122746 - BLOCK
      ?auto_122748 - BLOCK
      ?auto_122749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122747 ?auto_122745 ) ( ON-TABLE ?auto_122742 ) ( ON ?auto_122743 ?auto_122742 ) ( ON ?auto_122744 ?auto_122743 ) ( ON ?auto_122745 ?auto_122744 ) ( not ( = ?auto_122742 ?auto_122743 ) ) ( not ( = ?auto_122742 ?auto_122744 ) ) ( not ( = ?auto_122742 ?auto_122745 ) ) ( not ( = ?auto_122742 ?auto_122747 ) ) ( not ( = ?auto_122743 ?auto_122744 ) ) ( not ( = ?auto_122743 ?auto_122745 ) ) ( not ( = ?auto_122743 ?auto_122747 ) ) ( not ( = ?auto_122744 ?auto_122745 ) ) ( not ( = ?auto_122744 ?auto_122747 ) ) ( not ( = ?auto_122745 ?auto_122747 ) ) ( not ( = ?auto_122742 ?auto_122746 ) ) ( not ( = ?auto_122742 ?auto_122748 ) ) ( not ( = ?auto_122743 ?auto_122746 ) ) ( not ( = ?auto_122743 ?auto_122748 ) ) ( not ( = ?auto_122744 ?auto_122746 ) ) ( not ( = ?auto_122744 ?auto_122748 ) ) ( not ( = ?auto_122745 ?auto_122746 ) ) ( not ( = ?auto_122745 ?auto_122748 ) ) ( not ( = ?auto_122747 ?auto_122746 ) ) ( not ( = ?auto_122747 ?auto_122748 ) ) ( not ( = ?auto_122746 ?auto_122748 ) ) ( ON ?auto_122746 ?auto_122747 ) ( CLEAR ?auto_122746 ) ( ON ?auto_122748 ?auto_122749 ) ( CLEAR ?auto_122748 ) ( HAND-EMPTY ) ( not ( = ?auto_122742 ?auto_122749 ) ) ( not ( = ?auto_122743 ?auto_122749 ) ) ( not ( = ?auto_122744 ?auto_122749 ) ) ( not ( = ?auto_122745 ?auto_122749 ) ) ( not ( = ?auto_122747 ?auto_122749 ) ) ( not ( = ?auto_122746 ?auto_122749 ) ) ( not ( = ?auto_122748 ?auto_122749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122748 ?auto_122749 )
      ( MAKE-4PILE ?auto_122742 ?auto_122743 ?auto_122744 ?auto_122745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122750 - BLOCK
      ?auto_122751 - BLOCK
      ?auto_122752 - BLOCK
      ?auto_122753 - BLOCK
    )
    :vars
    (
      ?auto_122757 - BLOCK
      ?auto_122756 - BLOCK
      ?auto_122755 - BLOCK
      ?auto_122754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122757 ?auto_122753 ) ( ON-TABLE ?auto_122750 ) ( ON ?auto_122751 ?auto_122750 ) ( ON ?auto_122752 ?auto_122751 ) ( ON ?auto_122753 ?auto_122752 ) ( not ( = ?auto_122750 ?auto_122751 ) ) ( not ( = ?auto_122750 ?auto_122752 ) ) ( not ( = ?auto_122750 ?auto_122753 ) ) ( not ( = ?auto_122750 ?auto_122757 ) ) ( not ( = ?auto_122751 ?auto_122752 ) ) ( not ( = ?auto_122751 ?auto_122753 ) ) ( not ( = ?auto_122751 ?auto_122757 ) ) ( not ( = ?auto_122752 ?auto_122753 ) ) ( not ( = ?auto_122752 ?auto_122757 ) ) ( not ( = ?auto_122753 ?auto_122757 ) ) ( not ( = ?auto_122750 ?auto_122756 ) ) ( not ( = ?auto_122750 ?auto_122755 ) ) ( not ( = ?auto_122751 ?auto_122756 ) ) ( not ( = ?auto_122751 ?auto_122755 ) ) ( not ( = ?auto_122752 ?auto_122756 ) ) ( not ( = ?auto_122752 ?auto_122755 ) ) ( not ( = ?auto_122753 ?auto_122756 ) ) ( not ( = ?auto_122753 ?auto_122755 ) ) ( not ( = ?auto_122757 ?auto_122756 ) ) ( not ( = ?auto_122757 ?auto_122755 ) ) ( not ( = ?auto_122756 ?auto_122755 ) ) ( ON ?auto_122755 ?auto_122754 ) ( CLEAR ?auto_122755 ) ( not ( = ?auto_122750 ?auto_122754 ) ) ( not ( = ?auto_122751 ?auto_122754 ) ) ( not ( = ?auto_122752 ?auto_122754 ) ) ( not ( = ?auto_122753 ?auto_122754 ) ) ( not ( = ?auto_122757 ?auto_122754 ) ) ( not ( = ?auto_122756 ?auto_122754 ) ) ( not ( = ?auto_122755 ?auto_122754 ) ) ( HOLDING ?auto_122756 ) ( CLEAR ?auto_122757 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122750 ?auto_122751 ?auto_122752 ?auto_122753 ?auto_122757 ?auto_122756 )
      ( MAKE-4PILE ?auto_122750 ?auto_122751 ?auto_122752 ?auto_122753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122758 - BLOCK
      ?auto_122759 - BLOCK
      ?auto_122760 - BLOCK
      ?auto_122761 - BLOCK
    )
    :vars
    (
      ?auto_122765 - BLOCK
      ?auto_122762 - BLOCK
      ?auto_122764 - BLOCK
      ?auto_122763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122765 ?auto_122761 ) ( ON-TABLE ?auto_122758 ) ( ON ?auto_122759 ?auto_122758 ) ( ON ?auto_122760 ?auto_122759 ) ( ON ?auto_122761 ?auto_122760 ) ( not ( = ?auto_122758 ?auto_122759 ) ) ( not ( = ?auto_122758 ?auto_122760 ) ) ( not ( = ?auto_122758 ?auto_122761 ) ) ( not ( = ?auto_122758 ?auto_122765 ) ) ( not ( = ?auto_122759 ?auto_122760 ) ) ( not ( = ?auto_122759 ?auto_122761 ) ) ( not ( = ?auto_122759 ?auto_122765 ) ) ( not ( = ?auto_122760 ?auto_122761 ) ) ( not ( = ?auto_122760 ?auto_122765 ) ) ( not ( = ?auto_122761 ?auto_122765 ) ) ( not ( = ?auto_122758 ?auto_122762 ) ) ( not ( = ?auto_122758 ?auto_122764 ) ) ( not ( = ?auto_122759 ?auto_122762 ) ) ( not ( = ?auto_122759 ?auto_122764 ) ) ( not ( = ?auto_122760 ?auto_122762 ) ) ( not ( = ?auto_122760 ?auto_122764 ) ) ( not ( = ?auto_122761 ?auto_122762 ) ) ( not ( = ?auto_122761 ?auto_122764 ) ) ( not ( = ?auto_122765 ?auto_122762 ) ) ( not ( = ?auto_122765 ?auto_122764 ) ) ( not ( = ?auto_122762 ?auto_122764 ) ) ( ON ?auto_122764 ?auto_122763 ) ( not ( = ?auto_122758 ?auto_122763 ) ) ( not ( = ?auto_122759 ?auto_122763 ) ) ( not ( = ?auto_122760 ?auto_122763 ) ) ( not ( = ?auto_122761 ?auto_122763 ) ) ( not ( = ?auto_122765 ?auto_122763 ) ) ( not ( = ?auto_122762 ?auto_122763 ) ) ( not ( = ?auto_122764 ?auto_122763 ) ) ( CLEAR ?auto_122765 ) ( ON ?auto_122762 ?auto_122764 ) ( CLEAR ?auto_122762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122763 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122763 ?auto_122764 )
      ( MAKE-4PILE ?auto_122758 ?auto_122759 ?auto_122760 ?auto_122761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122782 - BLOCK
      ?auto_122783 - BLOCK
      ?auto_122784 - BLOCK
      ?auto_122785 - BLOCK
    )
    :vars
    (
      ?auto_122786 - BLOCK
      ?auto_122787 - BLOCK
      ?auto_122789 - BLOCK
      ?auto_122788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122782 ) ( ON ?auto_122783 ?auto_122782 ) ( ON ?auto_122784 ?auto_122783 ) ( not ( = ?auto_122782 ?auto_122783 ) ) ( not ( = ?auto_122782 ?auto_122784 ) ) ( not ( = ?auto_122782 ?auto_122785 ) ) ( not ( = ?auto_122782 ?auto_122786 ) ) ( not ( = ?auto_122783 ?auto_122784 ) ) ( not ( = ?auto_122783 ?auto_122785 ) ) ( not ( = ?auto_122783 ?auto_122786 ) ) ( not ( = ?auto_122784 ?auto_122785 ) ) ( not ( = ?auto_122784 ?auto_122786 ) ) ( not ( = ?auto_122785 ?auto_122786 ) ) ( not ( = ?auto_122782 ?auto_122787 ) ) ( not ( = ?auto_122782 ?auto_122789 ) ) ( not ( = ?auto_122783 ?auto_122787 ) ) ( not ( = ?auto_122783 ?auto_122789 ) ) ( not ( = ?auto_122784 ?auto_122787 ) ) ( not ( = ?auto_122784 ?auto_122789 ) ) ( not ( = ?auto_122785 ?auto_122787 ) ) ( not ( = ?auto_122785 ?auto_122789 ) ) ( not ( = ?auto_122786 ?auto_122787 ) ) ( not ( = ?auto_122786 ?auto_122789 ) ) ( not ( = ?auto_122787 ?auto_122789 ) ) ( ON ?auto_122789 ?auto_122788 ) ( not ( = ?auto_122782 ?auto_122788 ) ) ( not ( = ?auto_122783 ?auto_122788 ) ) ( not ( = ?auto_122784 ?auto_122788 ) ) ( not ( = ?auto_122785 ?auto_122788 ) ) ( not ( = ?auto_122786 ?auto_122788 ) ) ( not ( = ?auto_122787 ?auto_122788 ) ) ( not ( = ?auto_122789 ?auto_122788 ) ) ( ON ?auto_122787 ?auto_122789 ) ( ON-TABLE ?auto_122788 ) ( ON ?auto_122786 ?auto_122787 ) ( CLEAR ?auto_122786 ) ( HOLDING ?auto_122785 ) ( CLEAR ?auto_122784 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122782 ?auto_122783 ?auto_122784 ?auto_122785 ?auto_122786 )
      ( MAKE-4PILE ?auto_122782 ?auto_122783 ?auto_122784 ?auto_122785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122790 - BLOCK
      ?auto_122791 - BLOCK
      ?auto_122792 - BLOCK
      ?auto_122793 - BLOCK
    )
    :vars
    (
      ?auto_122795 - BLOCK
      ?auto_122794 - BLOCK
      ?auto_122796 - BLOCK
      ?auto_122797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122790 ) ( ON ?auto_122791 ?auto_122790 ) ( ON ?auto_122792 ?auto_122791 ) ( not ( = ?auto_122790 ?auto_122791 ) ) ( not ( = ?auto_122790 ?auto_122792 ) ) ( not ( = ?auto_122790 ?auto_122793 ) ) ( not ( = ?auto_122790 ?auto_122795 ) ) ( not ( = ?auto_122791 ?auto_122792 ) ) ( not ( = ?auto_122791 ?auto_122793 ) ) ( not ( = ?auto_122791 ?auto_122795 ) ) ( not ( = ?auto_122792 ?auto_122793 ) ) ( not ( = ?auto_122792 ?auto_122795 ) ) ( not ( = ?auto_122793 ?auto_122795 ) ) ( not ( = ?auto_122790 ?auto_122794 ) ) ( not ( = ?auto_122790 ?auto_122796 ) ) ( not ( = ?auto_122791 ?auto_122794 ) ) ( not ( = ?auto_122791 ?auto_122796 ) ) ( not ( = ?auto_122792 ?auto_122794 ) ) ( not ( = ?auto_122792 ?auto_122796 ) ) ( not ( = ?auto_122793 ?auto_122794 ) ) ( not ( = ?auto_122793 ?auto_122796 ) ) ( not ( = ?auto_122795 ?auto_122794 ) ) ( not ( = ?auto_122795 ?auto_122796 ) ) ( not ( = ?auto_122794 ?auto_122796 ) ) ( ON ?auto_122796 ?auto_122797 ) ( not ( = ?auto_122790 ?auto_122797 ) ) ( not ( = ?auto_122791 ?auto_122797 ) ) ( not ( = ?auto_122792 ?auto_122797 ) ) ( not ( = ?auto_122793 ?auto_122797 ) ) ( not ( = ?auto_122795 ?auto_122797 ) ) ( not ( = ?auto_122794 ?auto_122797 ) ) ( not ( = ?auto_122796 ?auto_122797 ) ) ( ON ?auto_122794 ?auto_122796 ) ( ON-TABLE ?auto_122797 ) ( ON ?auto_122795 ?auto_122794 ) ( CLEAR ?auto_122792 ) ( ON ?auto_122793 ?auto_122795 ) ( CLEAR ?auto_122793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122797 ?auto_122796 ?auto_122794 ?auto_122795 )
      ( MAKE-4PILE ?auto_122790 ?auto_122791 ?auto_122792 ?auto_122793 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122798 - BLOCK
      ?auto_122799 - BLOCK
      ?auto_122800 - BLOCK
      ?auto_122801 - BLOCK
    )
    :vars
    (
      ?auto_122802 - BLOCK
      ?auto_122804 - BLOCK
      ?auto_122805 - BLOCK
      ?auto_122803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122798 ) ( ON ?auto_122799 ?auto_122798 ) ( not ( = ?auto_122798 ?auto_122799 ) ) ( not ( = ?auto_122798 ?auto_122800 ) ) ( not ( = ?auto_122798 ?auto_122801 ) ) ( not ( = ?auto_122798 ?auto_122802 ) ) ( not ( = ?auto_122799 ?auto_122800 ) ) ( not ( = ?auto_122799 ?auto_122801 ) ) ( not ( = ?auto_122799 ?auto_122802 ) ) ( not ( = ?auto_122800 ?auto_122801 ) ) ( not ( = ?auto_122800 ?auto_122802 ) ) ( not ( = ?auto_122801 ?auto_122802 ) ) ( not ( = ?auto_122798 ?auto_122804 ) ) ( not ( = ?auto_122798 ?auto_122805 ) ) ( not ( = ?auto_122799 ?auto_122804 ) ) ( not ( = ?auto_122799 ?auto_122805 ) ) ( not ( = ?auto_122800 ?auto_122804 ) ) ( not ( = ?auto_122800 ?auto_122805 ) ) ( not ( = ?auto_122801 ?auto_122804 ) ) ( not ( = ?auto_122801 ?auto_122805 ) ) ( not ( = ?auto_122802 ?auto_122804 ) ) ( not ( = ?auto_122802 ?auto_122805 ) ) ( not ( = ?auto_122804 ?auto_122805 ) ) ( ON ?auto_122805 ?auto_122803 ) ( not ( = ?auto_122798 ?auto_122803 ) ) ( not ( = ?auto_122799 ?auto_122803 ) ) ( not ( = ?auto_122800 ?auto_122803 ) ) ( not ( = ?auto_122801 ?auto_122803 ) ) ( not ( = ?auto_122802 ?auto_122803 ) ) ( not ( = ?auto_122804 ?auto_122803 ) ) ( not ( = ?auto_122805 ?auto_122803 ) ) ( ON ?auto_122804 ?auto_122805 ) ( ON-TABLE ?auto_122803 ) ( ON ?auto_122802 ?auto_122804 ) ( ON ?auto_122801 ?auto_122802 ) ( CLEAR ?auto_122801 ) ( HOLDING ?auto_122800 ) ( CLEAR ?auto_122799 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122798 ?auto_122799 ?auto_122800 )
      ( MAKE-4PILE ?auto_122798 ?auto_122799 ?auto_122800 ?auto_122801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122806 - BLOCK
      ?auto_122807 - BLOCK
      ?auto_122808 - BLOCK
      ?auto_122809 - BLOCK
    )
    :vars
    (
      ?auto_122812 - BLOCK
      ?auto_122811 - BLOCK
      ?auto_122810 - BLOCK
      ?auto_122813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122806 ) ( ON ?auto_122807 ?auto_122806 ) ( not ( = ?auto_122806 ?auto_122807 ) ) ( not ( = ?auto_122806 ?auto_122808 ) ) ( not ( = ?auto_122806 ?auto_122809 ) ) ( not ( = ?auto_122806 ?auto_122812 ) ) ( not ( = ?auto_122807 ?auto_122808 ) ) ( not ( = ?auto_122807 ?auto_122809 ) ) ( not ( = ?auto_122807 ?auto_122812 ) ) ( not ( = ?auto_122808 ?auto_122809 ) ) ( not ( = ?auto_122808 ?auto_122812 ) ) ( not ( = ?auto_122809 ?auto_122812 ) ) ( not ( = ?auto_122806 ?auto_122811 ) ) ( not ( = ?auto_122806 ?auto_122810 ) ) ( not ( = ?auto_122807 ?auto_122811 ) ) ( not ( = ?auto_122807 ?auto_122810 ) ) ( not ( = ?auto_122808 ?auto_122811 ) ) ( not ( = ?auto_122808 ?auto_122810 ) ) ( not ( = ?auto_122809 ?auto_122811 ) ) ( not ( = ?auto_122809 ?auto_122810 ) ) ( not ( = ?auto_122812 ?auto_122811 ) ) ( not ( = ?auto_122812 ?auto_122810 ) ) ( not ( = ?auto_122811 ?auto_122810 ) ) ( ON ?auto_122810 ?auto_122813 ) ( not ( = ?auto_122806 ?auto_122813 ) ) ( not ( = ?auto_122807 ?auto_122813 ) ) ( not ( = ?auto_122808 ?auto_122813 ) ) ( not ( = ?auto_122809 ?auto_122813 ) ) ( not ( = ?auto_122812 ?auto_122813 ) ) ( not ( = ?auto_122811 ?auto_122813 ) ) ( not ( = ?auto_122810 ?auto_122813 ) ) ( ON ?auto_122811 ?auto_122810 ) ( ON-TABLE ?auto_122813 ) ( ON ?auto_122812 ?auto_122811 ) ( ON ?auto_122809 ?auto_122812 ) ( CLEAR ?auto_122807 ) ( ON ?auto_122808 ?auto_122809 ) ( CLEAR ?auto_122808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122813 ?auto_122810 ?auto_122811 ?auto_122812 ?auto_122809 )
      ( MAKE-4PILE ?auto_122806 ?auto_122807 ?auto_122808 ?auto_122809 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122814 - BLOCK
      ?auto_122815 - BLOCK
      ?auto_122816 - BLOCK
      ?auto_122817 - BLOCK
    )
    :vars
    (
      ?auto_122821 - BLOCK
      ?auto_122818 - BLOCK
      ?auto_122820 - BLOCK
      ?auto_122819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122814 ) ( not ( = ?auto_122814 ?auto_122815 ) ) ( not ( = ?auto_122814 ?auto_122816 ) ) ( not ( = ?auto_122814 ?auto_122817 ) ) ( not ( = ?auto_122814 ?auto_122821 ) ) ( not ( = ?auto_122815 ?auto_122816 ) ) ( not ( = ?auto_122815 ?auto_122817 ) ) ( not ( = ?auto_122815 ?auto_122821 ) ) ( not ( = ?auto_122816 ?auto_122817 ) ) ( not ( = ?auto_122816 ?auto_122821 ) ) ( not ( = ?auto_122817 ?auto_122821 ) ) ( not ( = ?auto_122814 ?auto_122818 ) ) ( not ( = ?auto_122814 ?auto_122820 ) ) ( not ( = ?auto_122815 ?auto_122818 ) ) ( not ( = ?auto_122815 ?auto_122820 ) ) ( not ( = ?auto_122816 ?auto_122818 ) ) ( not ( = ?auto_122816 ?auto_122820 ) ) ( not ( = ?auto_122817 ?auto_122818 ) ) ( not ( = ?auto_122817 ?auto_122820 ) ) ( not ( = ?auto_122821 ?auto_122818 ) ) ( not ( = ?auto_122821 ?auto_122820 ) ) ( not ( = ?auto_122818 ?auto_122820 ) ) ( ON ?auto_122820 ?auto_122819 ) ( not ( = ?auto_122814 ?auto_122819 ) ) ( not ( = ?auto_122815 ?auto_122819 ) ) ( not ( = ?auto_122816 ?auto_122819 ) ) ( not ( = ?auto_122817 ?auto_122819 ) ) ( not ( = ?auto_122821 ?auto_122819 ) ) ( not ( = ?auto_122818 ?auto_122819 ) ) ( not ( = ?auto_122820 ?auto_122819 ) ) ( ON ?auto_122818 ?auto_122820 ) ( ON-TABLE ?auto_122819 ) ( ON ?auto_122821 ?auto_122818 ) ( ON ?auto_122817 ?auto_122821 ) ( ON ?auto_122816 ?auto_122817 ) ( CLEAR ?auto_122816 ) ( HOLDING ?auto_122815 ) ( CLEAR ?auto_122814 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122814 ?auto_122815 )
      ( MAKE-4PILE ?auto_122814 ?auto_122815 ?auto_122816 ?auto_122817 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122822 - BLOCK
      ?auto_122823 - BLOCK
      ?auto_122824 - BLOCK
      ?auto_122825 - BLOCK
    )
    :vars
    (
      ?auto_122827 - BLOCK
      ?auto_122828 - BLOCK
      ?auto_122829 - BLOCK
      ?auto_122826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122822 ) ( not ( = ?auto_122822 ?auto_122823 ) ) ( not ( = ?auto_122822 ?auto_122824 ) ) ( not ( = ?auto_122822 ?auto_122825 ) ) ( not ( = ?auto_122822 ?auto_122827 ) ) ( not ( = ?auto_122823 ?auto_122824 ) ) ( not ( = ?auto_122823 ?auto_122825 ) ) ( not ( = ?auto_122823 ?auto_122827 ) ) ( not ( = ?auto_122824 ?auto_122825 ) ) ( not ( = ?auto_122824 ?auto_122827 ) ) ( not ( = ?auto_122825 ?auto_122827 ) ) ( not ( = ?auto_122822 ?auto_122828 ) ) ( not ( = ?auto_122822 ?auto_122829 ) ) ( not ( = ?auto_122823 ?auto_122828 ) ) ( not ( = ?auto_122823 ?auto_122829 ) ) ( not ( = ?auto_122824 ?auto_122828 ) ) ( not ( = ?auto_122824 ?auto_122829 ) ) ( not ( = ?auto_122825 ?auto_122828 ) ) ( not ( = ?auto_122825 ?auto_122829 ) ) ( not ( = ?auto_122827 ?auto_122828 ) ) ( not ( = ?auto_122827 ?auto_122829 ) ) ( not ( = ?auto_122828 ?auto_122829 ) ) ( ON ?auto_122829 ?auto_122826 ) ( not ( = ?auto_122822 ?auto_122826 ) ) ( not ( = ?auto_122823 ?auto_122826 ) ) ( not ( = ?auto_122824 ?auto_122826 ) ) ( not ( = ?auto_122825 ?auto_122826 ) ) ( not ( = ?auto_122827 ?auto_122826 ) ) ( not ( = ?auto_122828 ?auto_122826 ) ) ( not ( = ?auto_122829 ?auto_122826 ) ) ( ON ?auto_122828 ?auto_122829 ) ( ON-TABLE ?auto_122826 ) ( ON ?auto_122827 ?auto_122828 ) ( ON ?auto_122825 ?auto_122827 ) ( ON ?auto_122824 ?auto_122825 ) ( CLEAR ?auto_122822 ) ( ON ?auto_122823 ?auto_122824 ) ( CLEAR ?auto_122823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122826 ?auto_122829 ?auto_122828 ?auto_122827 ?auto_122825 ?auto_122824 )
      ( MAKE-4PILE ?auto_122822 ?auto_122823 ?auto_122824 ?auto_122825 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122830 - BLOCK
      ?auto_122831 - BLOCK
      ?auto_122832 - BLOCK
      ?auto_122833 - BLOCK
    )
    :vars
    (
      ?auto_122837 - BLOCK
      ?auto_122835 - BLOCK
      ?auto_122836 - BLOCK
      ?auto_122834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122830 ?auto_122831 ) ) ( not ( = ?auto_122830 ?auto_122832 ) ) ( not ( = ?auto_122830 ?auto_122833 ) ) ( not ( = ?auto_122830 ?auto_122837 ) ) ( not ( = ?auto_122831 ?auto_122832 ) ) ( not ( = ?auto_122831 ?auto_122833 ) ) ( not ( = ?auto_122831 ?auto_122837 ) ) ( not ( = ?auto_122832 ?auto_122833 ) ) ( not ( = ?auto_122832 ?auto_122837 ) ) ( not ( = ?auto_122833 ?auto_122837 ) ) ( not ( = ?auto_122830 ?auto_122835 ) ) ( not ( = ?auto_122830 ?auto_122836 ) ) ( not ( = ?auto_122831 ?auto_122835 ) ) ( not ( = ?auto_122831 ?auto_122836 ) ) ( not ( = ?auto_122832 ?auto_122835 ) ) ( not ( = ?auto_122832 ?auto_122836 ) ) ( not ( = ?auto_122833 ?auto_122835 ) ) ( not ( = ?auto_122833 ?auto_122836 ) ) ( not ( = ?auto_122837 ?auto_122835 ) ) ( not ( = ?auto_122837 ?auto_122836 ) ) ( not ( = ?auto_122835 ?auto_122836 ) ) ( ON ?auto_122836 ?auto_122834 ) ( not ( = ?auto_122830 ?auto_122834 ) ) ( not ( = ?auto_122831 ?auto_122834 ) ) ( not ( = ?auto_122832 ?auto_122834 ) ) ( not ( = ?auto_122833 ?auto_122834 ) ) ( not ( = ?auto_122837 ?auto_122834 ) ) ( not ( = ?auto_122835 ?auto_122834 ) ) ( not ( = ?auto_122836 ?auto_122834 ) ) ( ON ?auto_122835 ?auto_122836 ) ( ON-TABLE ?auto_122834 ) ( ON ?auto_122837 ?auto_122835 ) ( ON ?auto_122833 ?auto_122837 ) ( ON ?auto_122832 ?auto_122833 ) ( ON ?auto_122831 ?auto_122832 ) ( CLEAR ?auto_122831 ) ( HOLDING ?auto_122830 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122830 )
      ( MAKE-4PILE ?auto_122830 ?auto_122831 ?auto_122832 ?auto_122833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_122838 - BLOCK
      ?auto_122839 - BLOCK
      ?auto_122840 - BLOCK
      ?auto_122841 - BLOCK
    )
    :vars
    (
      ?auto_122843 - BLOCK
      ?auto_122845 - BLOCK
      ?auto_122842 - BLOCK
      ?auto_122844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122838 ?auto_122839 ) ) ( not ( = ?auto_122838 ?auto_122840 ) ) ( not ( = ?auto_122838 ?auto_122841 ) ) ( not ( = ?auto_122838 ?auto_122843 ) ) ( not ( = ?auto_122839 ?auto_122840 ) ) ( not ( = ?auto_122839 ?auto_122841 ) ) ( not ( = ?auto_122839 ?auto_122843 ) ) ( not ( = ?auto_122840 ?auto_122841 ) ) ( not ( = ?auto_122840 ?auto_122843 ) ) ( not ( = ?auto_122841 ?auto_122843 ) ) ( not ( = ?auto_122838 ?auto_122845 ) ) ( not ( = ?auto_122838 ?auto_122842 ) ) ( not ( = ?auto_122839 ?auto_122845 ) ) ( not ( = ?auto_122839 ?auto_122842 ) ) ( not ( = ?auto_122840 ?auto_122845 ) ) ( not ( = ?auto_122840 ?auto_122842 ) ) ( not ( = ?auto_122841 ?auto_122845 ) ) ( not ( = ?auto_122841 ?auto_122842 ) ) ( not ( = ?auto_122843 ?auto_122845 ) ) ( not ( = ?auto_122843 ?auto_122842 ) ) ( not ( = ?auto_122845 ?auto_122842 ) ) ( ON ?auto_122842 ?auto_122844 ) ( not ( = ?auto_122838 ?auto_122844 ) ) ( not ( = ?auto_122839 ?auto_122844 ) ) ( not ( = ?auto_122840 ?auto_122844 ) ) ( not ( = ?auto_122841 ?auto_122844 ) ) ( not ( = ?auto_122843 ?auto_122844 ) ) ( not ( = ?auto_122845 ?auto_122844 ) ) ( not ( = ?auto_122842 ?auto_122844 ) ) ( ON ?auto_122845 ?auto_122842 ) ( ON-TABLE ?auto_122844 ) ( ON ?auto_122843 ?auto_122845 ) ( ON ?auto_122841 ?auto_122843 ) ( ON ?auto_122840 ?auto_122841 ) ( ON ?auto_122839 ?auto_122840 ) ( ON ?auto_122838 ?auto_122839 ) ( CLEAR ?auto_122838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122844 ?auto_122842 ?auto_122845 ?auto_122843 ?auto_122841 ?auto_122840 ?auto_122839 )
      ( MAKE-4PILE ?auto_122838 ?auto_122839 ?auto_122840 ?auto_122841 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122849 - BLOCK
      ?auto_122850 - BLOCK
      ?auto_122851 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_122851 ) ( CLEAR ?auto_122850 ) ( ON-TABLE ?auto_122849 ) ( ON ?auto_122850 ?auto_122849 ) ( not ( = ?auto_122849 ?auto_122850 ) ) ( not ( = ?auto_122849 ?auto_122851 ) ) ( not ( = ?auto_122850 ?auto_122851 ) ) )
    :subtasks
    ( ( !STACK ?auto_122851 ?auto_122850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122852 - BLOCK
      ?auto_122853 - BLOCK
      ?auto_122854 - BLOCK
    )
    :vars
    (
      ?auto_122855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_122853 ) ( ON-TABLE ?auto_122852 ) ( ON ?auto_122853 ?auto_122852 ) ( not ( = ?auto_122852 ?auto_122853 ) ) ( not ( = ?auto_122852 ?auto_122854 ) ) ( not ( = ?auto_122853 ?auto_122854 ) ) ( ON ?auto_122854 ?auto_122855 ) ( CLEAR ?auto_122854 ) ( HAND-EMPTY ) ( not ( = ?auto_122852 ?auto_122855 ) ) ( not ( = ?auto_122853 ?auto_122855 ) ) ( not ( = ?auto_122854 ?auto_122855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122854 ?auto_122855 )
      ( MAKE-3PILE ?auto_122852 ?auto_122853 ?auto_122854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122856 - BLOCK
      ?auto_122857 - BLOCK
      ?auto_122858 - BLOCK
    )
    :vars
    (
      ?auto_122859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122856 ) ( not ( = ?auto_122856 ?auto_122857 ) ) ( not ( = ?auto_122856 ?auto_122858 ) ) ( not ( = ?auto_122857 ?auto_122858 ) ) ( ON ?auto_122858 ?auto_122859 ) ( CLEAR ?auto_122858 ) ( not ( = ?auto_122856 ?auto_122859 ) ) ( not ( = ?auto_122857 ?auto_122859 ) ) ( not ( = ?auto_122858 ?auto_122859 ) ) ( HOLDING ?auto_122857 ) ( CLEAR ?auto_122856 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122856 ?auto_122857 )
      ( MAKE-3PILE ?auto_122856 ?auto_122857 ?auto_122858 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122860 - BLOCK
      ?auto_122861 - BLOCK
      ?auto_122862 - BLOCK
    )
    :vars
    (
      ?auto_122863 - BLOCK
      ?auto_122865 - BLOCK
      ?auto_122866 - BLOCK
      ?auto_122864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_122860 ) ( not ( = ?auto_122860 ?auto_122861 ) ) ( not ( = ?auto_122860 ?auto_122862 ) ) ( not ( = ?auto_122861 ?auto_122862 ) ) ( ON ?auto_122862 ?auto_122863 ) ( not ( = ?auto_122860 ?auto_122863 ) ) ( not ( = ?auto_122861 ?auto_122863 ) ) ( not ( = ?auto_122862 ?auto_122863 ) ) ( CLEAR ?auto_122860 ) ( ON ?auto_122861 ?auto_122862 ) ( CLEAR ?auto_122861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122865 ) ( ON ?auto_122866 ?auto_122865 ) ( ON ?auto_122864 ?auto_122866 ) ( ON ?auto_122863 ?auto_122864 ) ( not ( = ?auto_122865 ?auto_122866 ) ) ( not ( = ?auto_122865 ?auto_122864 ) ) ( not ( = ?auto_122865 ?auto_122863 ) ) ( not ( = ?auto_122865 ?auto_122862 ) ) ( not ( = ?auto_122865 ?auto_122861 ) ) ( not ( = ?auto_122866 ?auto_122864 ) ) ( not ( = ?auto_122866 ?auto_122863 ) ) ( not ( = ?auto_122866 ?auto_122862 ) ) ( not ( = ?auto_122866 ?auto_122861 ) ) ( not ( = ?auto_122864 ?auto_122863 ) ) ( not ( = ?auto_122864 ?auto_122862 ) ) ( not ( = ?auto_122864 ?auto_122861 ) ) ( not ( = ?auto_122860 ?auto_122865 ) ) ( not ( = ?auto_122860 ?auto_122866 ) ) ( not ( = ?auto_122860 ?auto_122864 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122865 ?auto_122866 ?auto_122864 ?auto_122863 ?auto_122862 )
      ( MAKE-3PILE ?auto_122860 ?auto_122861 ?auto_122862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122867 - BLOCK
      ?auto_122868 - BLOCK
      ?auto_122869 - BLOCK
    )
    :vars
    (
      ?auto_122870 - BLOCK
      ?auto_122872 - BLOCK
      ?auto_122873 - BLOCK
      ?auto_122871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122867 ?auto_122868 ) ) ( not ( = ?auto_122867 ?auto_122869 ) ) ( not ( = ?auto_122868 ?auto_122869 ) ) ( ON ?auto_122869 ?auto_122870 ) ( not ( = ?auto_122867 ?auto_122870 ) ) ( not ( = ?auto_122868 ?auto_122870 ) ) ( not ( = ?auto_122869 ?auto_122870 ) ) ( ON ?auto_122868 ?auto_122869 ) ( CLEAR ?auto_122868 ) ( ON-TABLE ?auto_122872 ) ( ON ?auto_122873 ?auto_122872 ) ( ON ?auto_122871 ?auto_122873 ) ( ON ?auto_122870 ?auto_122871 ) ( not ( = ?auto_122872 ?auto_122873 ) ) ( not ( = ?auto_122872 ?auto_122871 ) ) ( not ( = ?auto_122872 ?auto_122870 ) ) ( not ( = ?auto_122872 ?auto_122869 ) ) ( not ( = ?auto_122872 ?auto_122868 ) ) ( not ( = ?auto_122873 ?auto_122871 ) ) ( not ( = ?auto_122873 ?auto_122870 ) ) ( not ( = ?auto_122873 ?auto_122869 ) ) ( not ( = ?auto_122873 ?auto_122868 ) ) ( not ( = ?auto_122871 ?auto_122870 ) ) ( not ( = ?auto_122871 ?auto_122869 ) ) ( not ( = ?auto_122871 ?auto_122868 ) ) ( not ( = ?auto_122867 ?auto_122872 ) ) ( not ( = ?auto_122867 ?auto_122873 ) ) ( not ( = ?auto_122867 ?auto_122871 ) ) ( HOLDING ?auto_122867 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122867 )
      ( MAKE-3PILE ?auto_122867 ?auto_122868 ?auto_122869 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122874 - BLOCK
      ?auto_122875 - BLOCK
      ?auto_122876 - BLOCK
    )
    :vars
    (
      ?auto_122877 - BLOCK
      ?auto_122880 - BLOCK
      ?auto_122878 - BLOCK
      ?auto_122879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122874 ?auto_122875 ) ) ( not ( = ?auto_122874 ?auto_122876 ) ) ( not ( = ?auto_122875 ?auto_122876 ) ) ( ON ?auto_122876 ?auto_122877 ) ( not ( = ?auto_122874 ?auto_122877 ) ) ( not ( = ?auto_122875 ?auto_122877 ) ) ( not ( = ?auto_122876 ?auto_122877 ) ) ( ON ?auto_122875 ?auto_122876 ) ( ON-TABLE ?auto_122880 ) ( ON ?auto_122878 ?auto_122880 ) ( ON ?auto_122879 ?auto_122878 ) ( ON ?auto_122877 ?auto_122879 ) ( not ( = ?auto_122880 ?auto_122878 ) ) ( not ( = ?auto_122880 ?auto_122879 ) ) ( not ( = ?auto_122880 ?auto_122877 ) ) ( not ( = ?auto_122880 ?auto_122876 ) ) ( not ( = ?auto_122880 ?auto_122875 ) ) ( not ( = ?auto_122878 ?auto_122879 ) ) ( not ( = ?auto_122878 ?auto_122877 ) ) ( not ( = ?auto_122878 ?auto_122876 ) ) ( not ( = ?auto_122878 ?auto_122875 ) ) ( not ( = ?auto_122879 ?auto_122877 ) ) ( not ( = ?auto_122879 ?auto_122876 ) ) ( not ( = ?auto_122879 ?auto_122875 ) ) ( not ( = ?auto_122874 ?auto_122880 ) ) ( not ( = ?auto_122874 ?auto_122878 ) ) ( not ( = ?auto_122874 ?auto_122879 ) ) ( ON ?auto_122874 ?auto_122875 ) ( CLEAR ?auto_122874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122880 ?auto_122878 ?auto_122879 ?auto_122877 ?auto_122876 ?auto_122875 )
      ( MAKE-3PILE ?auto_122874 ?auto_122875 ?auto_122876 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122881 - BLOCK
      ?auto_122882 - BLOCK
      ?auto_122883 - BLOCK
    )
    :vars
    (
      ?auto_122887 - BLOCK
      ?auto_122884 - BLOCK
      ?auto_122885 - BLOCK
      ?auto_122886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122881 ?auto_122882 ) ) ( not ( = ?auto_122881 ?auto_122883 ) ) ( not ( = ?auto_122882 ?auto_122883 ) ) ( ON ?auto_122883 ?auto_122887 ) ( not ( = ?auto_122881 ?auto_122887 ) ) ( not ( = ?auto_122882 ?auto_122887 ) ) ( not ( = ?auto_122883 ?auto_122887 ) ) ( ON ?auto_122882 ?auto_122883 ) ( ON-TABLE ?auto_122884 ) ( ON ?auto_122885 ?auto_122884 ) ( ON ?auto_122886 ?auto_122885 ) ( ON ?auto_122887 ?auto_122886 ) ( not ( = ?auto_122884 ?auto_122885 ) ) ( not ( = ?auto_122884 ?auto_122886 ) ) ( not ( = ?auto_122884 ?auto_122887 ) ) ( not ( = ?auto_122884 ?auto_122883 ) ) ( not ( = ?auto_122884 ?auto_122882 ) ) ( not ( = ?auto_122885 ?auto_122886 ) ) ( not ( = ?auto_122885 ?auto_122887 ) ) ( not ( = ?auto_122885 ?auto_122883 ) ) ( not ( = ?auto_122885 ?auto_122882 ) ) ( not ( = ?auto_122886 ?auto_122887 ) ) ( not ( = ?auto_122886 ?auto_122883 ) ) ( not ( = ?auto_122886 ?auto_122882 ) ) ( not ( = ?auto_122881 ?auto_122884 ) ) ( not ( = ?auto_122881 ?auto_122885 ) ) ( not ( = ?auto_122881 ?auto_122886 ) ) ( HOLDING ?auto_122881 ) ( CLEAR ?auto_122882 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122884 ?auto_122885 ?auto_122886 ?auto_122887 ?auto_122883 ?auto_122882 ?auto_122881 )
      ( MAKE-3PILE ?auto_122881 ?auto_122882 ?auto_122883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122888 - BLOCK
      ?auto_122889 - BLOCK
      ?auto_122890 - BLOCK
    )
    :vars
    (
      ?auto_122892 - BLOCK
      ?auto_122893 - BLOCK
      ?auto_122891 - BLOCK
      ?auto_122894 - BLOCK
      ?auto_122895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122888 ?auto_122889 ) ) ( not ( = ?auto_122888 ?auto_122890 ) ) ( not ( = ?auto_122889 ?auto_122890 ) ) ( ON ?auto_122890 ?auto_122892 ) ( not ( = ?auto_122888 ?auto_122892 ) ) ( not ( = ?auto_122889 ?auto_122892 ) ) ( not ( = ?auto_122890 ?auto_122892 ) ) ( ON ?auto_122889 ?auto_122890 ) ( ON-TABLE ?auto_122893 ) ( ON ?auto_122891 ?auto_122893 ) ( ON ?auto_122894 ?auto_122891 ) ( ON ?auto_122892 ?auto_122894 ) ( not ( = ?auto_122893 ?auto_122891 ) ) ( not ( = ?auto_122893 ?auto_122894 ) ) ( not ( = ?auto_122893 ?auto_122892 ) ) ( not ( = ?auto_122893 ?auto_122890 ) ) ( not ( = ?auto_122893 ?auto_122889 ) ) ( not ( = ?auto_122891 ?auto_122894 ) ) ( not ( = ?auto_122891 ?auto_122892 ) ) ( not ( = ?auto_122891 ?auto_122890 ) ) ( not ( = ?auto_122891 ?auto_122889 ) ) ( not ( = ?auto_122894 ?auto_122892 ) ) ( not ( = ?auto_122894 ?auto_122890 ) ) ( not ( = ?auto_122894 ?auto_122889 ) ) ( not ( = ?auto_122888 ?auto_122893 ) ) ( not ( = ?auto_122888 ?auto_122891 ) ) ( not ( = ?auto_122888 ?auto_122894 ) ) ( CLEAR ?auto_122889 ) ( ON ?auto_122888 ?auto_122895 ) ( CLEAR ?auto_122888 ) ( HAND-EMPTY ) ( not ( = ?auto_122888 ?auto_122895 ) ) ( not ( = ?auto_122889 ?auto_122895 ) ) ( not ( = ?auto_122890 ?auto_122895 ) ) ( not ( = ?auto_122892 ?auto_122895 ) ) ( not ( = ?auto_122893 ?auto_122895 ) ) ( not ( = ?auto_122891 ?auto_122895 ) ) ( not ( = ?auto_122894 ?auto_122895 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122888 ?auto_122895 )
      ( MAKE-3PILE ?auto_122888 ?auto_122889 ?auto_122890 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122896 - BLOCK
      ?auto_122897 - BLOCK
      ?auto_122898 - BLOCK
    )
    :vars
    (
      ?auto_122899 - BLOCK
      ?auto_122903 - BLOCK
      ?auto_122901 - BLOCK
      ?auto_122902 - BLOCK
      ?auto_122900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122896 ?auto_122897 ) ) ( not ( = ?auto_122896 ?auto_122898 ) ) ( not ( = ?auto_122897 ?auto_122898 ) ) ( ON ?auto_122898 ?auto_122899 ) ( not ( = ?auto_122896 ?auto_122899 ) ) ( not ( = ?auto_122897 ?auto_122899 ) ) ( not ( = ?auto_122898 ?auto_122899 ) ) ( ON-TABLE ?auto_122903 ) ( ON ?auto_122901 ?auto_122903 ) ( ON ?auto_122902 ?auto_122901 ) ( ON ?auto_122899 ?auto_122902 ) ( not ( = ?auto_122903 ?auto_122901 ) ) ( not ( = ?auto_122903 ?auto_122902 ) ) ( not ( = ?auto_122903 ?auto_122899 ) ) ( not ( = ?auto_122903 ?auto_122898 ) ) ( not ( = ?auto_122903 ?auto_122897 ) ) ( not ( = ?auto_122901 ?auto_122902 ) ) ( not ( = ?auto_122901 ?auto_122899 ) ) ( not ( = ?auto_122901 ?auto_122898 ) ) ( not ( = ?auto_122901 ?auto_122897 ) ) ( not ( = ?auto_122902 ?auto_122899 ) ) ( not ( = ?auto_122902 ?auto_122898 ) ) ( not ( = ?auto_122902 ?auto_122897 ) ) ( not ( = ?auto_122896 ?auto_122903 ) ) ( not ( = ?auto_122896 ?auto_122901 ) ) ( not ( = ?auto_122896 ?auto_122902 ) ) ( ON ?auto_122896 ?auto_122900 ) ( CLEAR ?auto_122896 ) ( not ( = ?auto_122896 ?auto_122900 ) ) ( not ( = ?auto_122897 ?auto_122900 ) ) ( not ( = ?auto_122898 ?auto_122900 ) ) ( not ( = ?auto_122899 ?auto_122900 ) ) ( not ( = ?auto_122903 ?auto_122900 ) ) ( not ( = ?auto_122901 ?auto_122900 ) ) ( not ( = ?auto_122902 ?auto_122900 ) ) ( HOLDING ?auto_122897 ) ( CLEAR ?auto_122898 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122903 ?auto_122901 ?auto_122902 ?auto_122899 ?auto_122898 ?auto_122897 )
      ( MAKE-3PILE ?auto_122896 ?auto_122897 ?auto_122898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122904 - BLOCK
      ?auto_122905 - BLOCK
      ?auto_122906 - BLOCK
    )
    :vars
    (
      ?auto_122907 - BLOCK
      ?auto_122910 - BLOCK
      ?auto_122909 - BLOCK
      ?auto_122908 - BLOCK
      ?auto_122911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122904 ?auto_122905 ) ) ( not ( = ?auto_122904 ?auto_122906 ) ) ( not ( = ?auto_122905 ?auto_122906 ) ) ( ON ?auto_122906 ?auto_122907 ) ( not ( = ?auto_122904 ?auto_122907 ) ) ( not ( = ?auto_122905 ?auto_122907 ) ) ( not ( = ?auto_122906 ?auto_122907 ) ) ( ON-TABLE ?auto_122910 ) ( ON ?auto_122909 ?auto_122910 ) ( ON ?auto_122908 ?auto_122909 ) ( ON ?auto_122907 ?auto_122908 ) ( not ( = ?auto_122910 ?auto_122909 ) ) ( not ( = ?auto_122910 ?auto_122908 ) ) ( not ( = ?auto_122910 ?auto_122907 ) ) ( not ( = ?auto_122910 ?auto_122906 ) ) ( not ( = ?auto_122910 ?auto_122905 ) ) ( not ( = ?auto_122909 ?auto_122908 ) ) ( not ( = ?auto_122909 ?auto_122907 ) ) ( not ( = ?auto_122909 ?auto_122906 ) ) ( not ( = ?auto_122909 ?auto_122905 ) ) ( not ( = ?auto_122908 ?auto_122907 ) ) ( not ( = ?auto_122908 ?auto_122906 ) ) ( not ( = ?auto_122908 ?auto_122905 ) ) ( not ( = ?auto_122904 ?auto_122910 ) ) ( not ( = ?auto_122904 ?auto_122909 ) ) ( not ( = ?auto_122904 ?auto_122908 ) ) ( ON ?auto_122904 ?auto_122911 ) ( not ( = ?auto_122904 ?auto_122911 ) ) ( not ( = ?auto_122905 ?auto_122911 ) ) ( not ( = ?auto_122906 ?auto_122911 ) ) ( not ( = ?auto_122907 ?auto_122911 ) ) ( not ( = ?auto_122910 ?auto_122911 ) ) ( not ( = ?auto_122909 ?auto_122911 ) ) ( not ( = ?auto_122908 ?auto_122911 ) ) ( CLEAR ?auto_122906 ) ( ON ?auto_122905 ?auto_122904 ) ( CLEAR ?auto_122905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122911 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122911 ?auto_122904 )
      ( MAKE-3PILE ?auto_122904 ?auto_122905 ?auto_122906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122912 - BLOCK
      ?auto_122913 - BLOCK
      ?auto_122914 - BLOCK
    )
    :vars
    (
      ?auto_122919 - BLOCK
      ?auto_122915 - BLOCK
      ?auto_122918 - BLOCK
      ?auto_122917 - BLOCK
      ?auto_122916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122912 ?auto_122913 ) ) ( not ( = ?auto_122912 ?auto_122914 ) ) ( not ( = ?auto_122913 ?auto_122914 ) ) ( not ( = ?auto_122912 ?auto_122919 ) ) ( not ( = ?auto_122913 ?auto_122919 ) ) ( not ( = ?auto_122914 ?auto_122919 ) ) ( ON-TABLE ?auto_122915 ) ( ON ?auto_122918 ?auto_122915 ) ( ON ?auto_122917 ?auto_122918 ) ( ON ?auto_122919 ?auto_122917 ) ( not ( = ?auto_122915 ?auto_122918 ) ) ( not ( = ?auto_122915 ?auto_122917 ) ) ( not ( = ?auto_122915 ?auto_122919 ) ) ( not ( = ?auto_122915 ?auto_122914 ) ) ( not ( = ?auto_122915 ?auto_122913 ) ) ( not ( = ?auto_122918 ?auto_122917 ) ) ( not ( = ?auto_122918 ?auto_122919 ) ) ( not ( = ?auto_122918 ?auto_122914 ) ) ( not ( = ?auto_122918 ?auto_122913 ) ) ( not ( = ?auto_122917 ?auto_122919 ) ) ( not ( = ?auto_122917 ?auto_122914 ) ) ( not ( = ?auto_122917 ?auto_122913 ) ) ( not ( = ?auto_122912 ?auto_122915 ) ) ( not ( = ?auto_122912 ?auto_122918 ) ) ( not ( = ?auto_122912 ?auto_122917 ) ) ( ON ?auto_122912 ?auto_122916 ) ( not ( = ?auto_122912 ?auto_122916 ) ) ( not ( = ?auto_122913 ?auto_122916 ) ) ( not ( = ?auto_122914 ?auto_122916 ) ) ( not ( = ?auto_122919 ?auto_122916 ) ) ( not ( = ?auto_122915 ?auto_122916 ) ) ( not ( = ?auto_122918 ?auto_122916 ) ) ( not ( = ?auto_122917 ?auto_122916 ) ) ( ON ?auto_122913 ?auto_122912 ) ( CLEAR ?auto_122913 ) ( ON-TABLE ?auto_122916 ) ( HOLDING ?auto_122914 ) ( CLEAR ?auto_122919 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122915 ?auto_122918 ?auto_122917 ?auto_122919 ?auto_122914 )
      ( MAKE-3PILE ?auto_122912 ?auto_122913 ?auto_122914 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122920 - BLOCK
      ?auto_122921 - BLOCK
      ?auto_122922 - BLOCK
    )
    :vars
    (
      ?auto_122924 - BLOCK
      ?auto_122923 - BLOCK
      ?auto_122926 - BLOCK
      ?auto_122927 - BLOCK
      ?auto_122925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122920 ?auto_122921 ) ) ( not ( = ?auto_122920 ?auto_122922 ) ) ( not ( = ?auto_122921 ?auto_122922 ) ) ( not ( = ?auto_122920 ?auto_122924 ) ) ( not ( = ?auto_122921 ?auto_122924 ) ) ( not ( = ?auto_122922 ?auto_122924 ) ) ( ON-TABLE ?auto_122923 ) ( ON ?auto_122926 ?auto_122923 ) ( ON ?auto_122927 ?auto_122926 ) ( ON ?auto_122924 ?auto_122927 ) ( not ( = ?auto_122923 ?auto_122926 ) ) ( not ( = ?auto_122923 ?auto_122927 ) ) ( not ( = ?auto_122923 ?auto_122924 ) ) ( not ( = ?auto_122923 ?auto_122922 ) ) ( not ( = ?auto_122923 ?auto_122921 ) ) ( not ( = ?auto_122926 ?auto_122927 ) ) ( not ( = ?auto_122926 ?auto_122924 ) ) ( not ( = ?auto_122926 ?auto_122922 ) ) ( not ( = ?auto_122926 ?auto_122921 ) ) ( not ( = ?auto_122927 ?auto_122924 ) ) ( not ( = ?auto_122927 ?auto_122922 ) ) ( not ( = ?auto_122927 ?auto_122921 ) ) ( not ( = ?auto_122920 ?auto_122923 ) ) ( not ( = ?auto_122920 ?auto_122926 ) ) ( not ( = ?auto_122920 ?auto_122927 ) ) ( ON ?auto_122920 ?auto_122925 ) ( not ( = ?auto_122920 ?auto_122925 ) ) ( not ( = ?auto_122921 ?auto_122925 ) ) ( not ( = ?auto_122922 ?auto_122925 ) ) ( not ( = ?auto_122924 ?auto_122925 ) ) ( not ( = ?auto_122923 ?auto_122925 ) ) ( not ( = ?auto_122926 ?auto_122925 ) ) ( not ( = ?auto_122927 ?auto_122925 ) ) ( ON ?auto_122921 ?auto_122920 ) ( ON-TABLE ?auto_122925 ) ( CLEAR ?auto_122924 ) ( ON ?auto_122922 ?auto_122921 ) ( CLEAR ?auto_122922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122925 ?auto_122920 ?auto_122921 )
      ( MAKE-3PILE ?auto_122920 ?auto_122921 ?auto_122922 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122928 - BLOCK
      ?auto_122929 - BLOCK
      ?auto_122930 - BLOCK
    )
    :vars
    (
      ?auto_122934 - BLOCK
      ?auto_122933 - BLOCK
      ?auto_122932 - BLOCK
      ?auto_122935 - BLOCK
      ?auto_122931 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122928 ?auto_122929 ) ) ( not ( = ?auto_122928 ?auto_122930 ) ) ( not ( = ?auto_122929 ?auto_122930 ) ) ( not ( = ?auto_122928 ?auto_122934 ) ) ( not ( = ?auto_122929 ?auto_122934 ) ) ( not ( = ?auto_122930 ?auto_122934 ) ) ( ON-TABLE ?auto_122933 ) ( ON ?auto_122932 ?auto_122933 ) ( ON ?auto_122935 ?auto_122932 ) ( not ( = ?auto_122933 ?auto_122932 ) ) ( not ( = ?auto_122933 ?auto_122935 ) ) ( not ( = ?auto_122933 ?auto_122934 ) ) ( not ( = ?auto_122933 ?auto_122930 ) ) ( not ( = ?auto_122933 ?auto_122929 ) ) ( not ( = ?auto_122932 ?auto_122935 ) ) ( not ( = ?auto_122932 ?auto_122934 ) ) ( not ( = ?auto_122932 ?auto_122930 ) ) ( not ( = ?auto_122932 ?auto_122929 ) ) ( not ( = ?auto_122935 ?auto_122934 ) ) ( not ( = ?auto_122935 ?auto_122930 ) ) ( not ( = ?auto_122935 ?auto_122929 ) ) ( not ( = ?auto_122928 ?auto_122933 ) ) ( not ( = ?auto_122928 ?auto_122932 ) ) ( not ( = ?auto_122928 ?auto_122935 ) ) ( ON ?auto_122928 ?auto_122931 ) ( not ( = ?auto_122928 ?auto_122931 ) ) ( not ( = ?auto_122929 ?auto_122931 ) ) ( not ( = ?auto_122930 ?auto_122931 ) ) ( not ( = ?auto_122934 ?auto_122931 ) ) ( not ( = ?auto_122933 ?auto_122931 ) ) ( not ( = ?auto_122932 ?auto_122931 ) ) ( not ( = ?auto_122935 ?auto_122931 ) ) ( ON ?auto_122929 ?auto_122928 ) ( ON-TABLE ?auto_122931 ) ( ON ?auto_122930 ?auto_122929 ) ( CLEAR ?auto_122930 ) ( HOLDING ?auto_122934 ) ( CLEAR ?auto_122935 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122933 ?auto_122932 ?auto_122935 ?auto_122934 )
      ( MAKE-3PILE ?auto_122928 ?auto_122929 ?auto_122930 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122936 - BLOCK
      ?auto_122937 - BLOCK
      ?auto_122938 - BLOCK
    )
    :vars
    (
      ?auto_122941 - BLOCK
      ?auto_122942 - BLOCK
      ?auto_122939 - BLOCK
      ?auto_122940 - BLOCK
      ?auto_122943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122936 ?auto_122937 ) ) ( not ( = ?auto_122936 ?auto_122938 ) ) ( not ( = ?auto_122937 ?auto_122938 ) ) ( not ( = ?auto_122936 ?auto_122941 ) ) ( not ( = ?auto_122937 ?auto_122941 ) ) ( not ( = ?auto_122938 ?auto_122941 ) ) ( ON-TABLE ?auto_122942 ) ( ON ?auto_122939 ?auto_122942 ) ( ON ?auto_122940 ?auto_122939 ) ( not ( = ?auto_122942 ?auto_122939 ) ) ( not ( = ?auto_122942 ?auto_122940 ) ) ( not ( = ?auto_122942 ?auto_122941 ) ) ( not ( = ?auto_122942 ?auto_122938 ) ) ( not ( = ?auto_122942 ?auto_122937 ) ) ( not ( = ?auto_122939 ?auto_122940 ) ) ( not ( = ?auto_122939 ?auto_122941 ) ) ( not ( = ?auto_122939 ?auto_122938 ) ) ( not ( = ?auto_122939 ?auto_122937 ) ) ( not ( = ?auto_122940 ?auto_122941 ) ) ( not ( = ?auto_122940 ?auto_122938 ) ) ( not ( = ?auto_122940 ?auto_122937 ) ) ( not ( = ?auto_122936 ?auto_122942 ) ) ( not ( = ?auto_122936 ?auto_122939 ) ) ( not ( = ?auto_122936 ?auto_122940 ) ) ( ON ?auto_122936 ?auto_122943 ) ( not ( = ?auto_122936 ?auto_122943 ) ) ( not ( = ?auto_122937 ?auto_122943 ) ) ( not ( = ?auto_122938 ?auto_122943 ) ) ( not ( = ?auto_122941 ?auto_122943 ) ) ( not ( = ?auto_122942 ?auto_122943 ) ) ( not ( = ?auto_122939 ?auto_122943 ) ) ( not ( = ?auto_122940 ?auto_122943 ) ) ( ON ?auto_122937 ?auto_122936 ) ( ON-TABLE ?auto_122943 ) ( ON ?auto_122938 ?auto_122937 ) ( CLEAR ?auto_122940 ) ( ON ?auto_122941 ?auto_122938 ) ( CLEAR ?auto_122941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_122943 ?auto_122936 ?auto_122937 ?auto_122938 )
      ( MAKE-3PILE ?auto_122936 ?auto_122937 ?auto_122938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122944 - BLOCK
      ?auto_122945 - BLOCK
      ?auto_122946 - BLOCK
    )
    :vars
    (
      ?auto_122950 - BLOCK
      ?auto_122949 - BLOCK
      ?auto_122951 - BLOCK
      ?auto_122947 - BLOCK
      ?auto_122948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122944 ?auto_122945 ) ) ( not ( = ?auto_122944 ?auto_122946 ) ) ( not ( = ?auto_122945 ?auto_122946 ) ) ( not ( = ?auto_122944 ?auto_122950 ) ) ( not ( = ?auto_122945 ?auto_122950 ) ) ( not ( = ?auto_122946 ?auto_122950 ) ) ( ON-TABLE ?auto_122949 ) ( ON ?auto_122951 ?auto_122949 ) ( not ( = ?auto_122949 ?auto_122951 ) ) ( not ( = ?auto_122949 ?auto_122947 ) ) ( not ( = ?auto_122949 ?auto_122950 ) ) ( not ( = ?auto_122949 ?auto_122946 ) ) ( not ( = ?auto_122949 ?auto_122945 ) ) ( not ( = ?auto_122951 ?auto_122947 ) ) ( not ( = ?auto_122951 ?auto_122950 ) ) ( not ( = ?auto_122951 ?auto_122946 ) ) ( not ( = ?auto_122951 ?auto_122945 ) ) ( not ( = ?auto_122947 ?auto_122950 ) ) ( not ( = ?auto_122947 ?auto_122946 ) ) ( not ( = ?auto_122947 ?auto_122945 ) ) ( not ( = ?auto_122944 ?auto_122949 ) ) ( not ( = ?auto_122944 ?auto_122951 ) ) ( not ( = ?auto_122944 ?auto_122947 ) ) ( ON ?auto_122944 ?auto_122948 ) ( not ( = ?auto_122944 ?auto_122948 ) ) ( not ( = ?auto_122945 ?auto_122948 ) ) ( not ( = ?auto_122946 ?auto_122948 ) ) ( not ( = ?auto_122950 ?auto_122948 ) ) ( not ( = ?auto_122949 ?auto_122948 ) ) ( not ( = ?auto_122951 ?auto_122948 ) ) ( not ( = ?auto_122947 ?auto_122948 ) ) ( ON ?auto_122945 ?auto_122944 ) ( ON-TABLE ?auto_122948 ) ( ON ?auto_122946 ?auto_122945 ) ( ON ?auto_122950 ?auto_122946 ) ( CLEAR ?auto_122950 ) ( HOLDING ?auto_122947 ) ( CLEAR ?auto_122951 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_122949 ?auto_122951 ?auto_122947 )
      ( MAKE-3PILE ?auto_122944 ?auto_122945 ?auto_122946 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122952 - BLOCK
      ?auto_122953 - BLOCK
      ?auto_122954 - BLOCK
    )
    :vars
    (
      ?auto_122957 - BLOCK
      ?auto_122958 - BLOCK
      ?auto_122956 - BLOCK
      ?auto_122955 - BLOCK
      ?auto_122959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122952 ?auto_122953 ) ) ( not ( = ?auto_122952 ?auto_122954 ) ) ( not ( = ?auto_122953 ?auto_122954 ) ) ( not ( = ?auto_122952 ?auto_122957 ) ) ( not ( = ?auto_122953 ?auto_122957 ) ) ( not ( = ?auto_122954 ?auto_122957 ) ) ( ON-TABLE ?auto_122958 ) ( ON ?auto_122956 ?auto_122958 ) ( not ( = ?auto_122958 ?auto_122956 ) ) ( not ( = ?auto_122958 ?auto_122955 ) ) ( not ( = ?auto_122958 ?auto_122957 ) ) ( not ( = ?auto_122958 ?auto_122954 ) ) ( not ( = ?auto_122958 ?auto_122953 ) ) ( not ( = ?auto_122956 ?auto_122955 ) ) ( not ( = ?auto_122956 ?auto_122957 ) ) ( not ( = ?auto_122956 ?auto_122954 ) ) ( not ( = ?auto_122956 ?auto_122953 ) ) ( not ( = ?auto_122955 ?auto_122957 ) ) ( not ( = ?auto_122955 ?auto_122954 ) ) ( not ( = ?auto_122955 ?auto_122953 ) ) ( not ( = ?auto_122952 ?auto_122958 ) ) ( not ( = ?auto_122952 ?auto_122956 ) ) ( not ( = ?auto_122952 ?auto_122955 ) ) ( ON ?auto_122952 ?auto_122959 ) ( not ( = ?auto_122952 ?auto_122959 ) ) ( not ( = ?auto_122953 ?auto_122959 ) ) ( not ( = ?auto_122954 ?auto_122959 ) ) ( not ( = ?auto_122957 ?auto_122959 ) ) ( not ( = ?auto_122958 ?auto_122959 ) ) ( not ( = ?auto_122956 ?auto_122959 ) ) ( not ( = ?auto_122955 ?auto_122959 ) ) ( ON ?auto_122953 ?auto_122952 ) ( ON-TABLE ?auto_122959 ) ( ON ?auto_122954 ?auto_122953 ) ( ON ?auto_122957 ?auto_122954 ) ( CLEAR ?auto_122956 ) ( ON ?auto_122955 ?auto_122957 ) ( CLEAR ?auto_122955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_122959 ?auto_122952 ?auto_122953 ?auto_122954 ?auto_122957 )
      ( MAKE-3PILE ?auto_122952 ?auto_122953 ?auto_122954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122960 - BLOCK
      ?auto_122961 - BLOCK
      ?auto_122962 - BLOCK
    )
    :vars
    (
      ?auto_122964 - BLOCK
      ?auto_122967 - BLOCK
      ?auto_122965 - BLOCK
      ?auto_122963 - BLOCK
      ?auto_122966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122960 ?auto_122961 ) ) ( not ( = ?auto_122960 ?auto_122962 ) ) ( not ( = ?auto_122961 ?auto_122962 ) ) ( not ( = ?auto_122960 ?auto_122964 ) ) ( not ( = ?auto_122961 ?auto_122964 ) ) ( not ( = ?auto_122962 ?auto_122964 ) ) ( ON-TABLE ?auto_122967 ) ( not ( = ?auto_122967 ?auto_122965 ) ) ( not ( = ?auto_122967 ?auto_122963 ) ) ( not ( = ?auto_122967 ?auto_122964 ) ) ( not ( = ?auto_122967 ?auto_122962 ) ) ( not ( = ?auto_122967 ?auto_122961 ) ) ( not ( = ?auto_122965 ?auto_122963 ) ) ( not ( = ?auto_122965 ?auto_122964 ) ) ( not ( = ?auto_122965 ?auto_122962 ) ) ( not ( = ?auto_122965 ?auto_122961 ) ) ( not ( = ?auto_122963 ?auto_122964 ) ) ( not ( = ?auto_122963 ?auto_122962 ) ) ( not ( = ?auto_122963 ?auto_122961 ) ) ( not ( = ?auto_122960 ?auto_122967 ) ) ( not ( = ?auto_122960 ?auto_122965 ) ) ( not ( = ?auto_122960 ?auto_122963 ) ) ( ON ?auto_122960 ?auto_122966 ) ( not ( = ?auto_122960 ?auto_122966 ) ) ( not ( = ?auto_122961 ?auto_122966 ) ) ( not ( = ?auto_122962 ?auto_122966 ) ) ( not ( = ?auto_122964 ?auto_122966 ) ) ( not ( = ?auto_122967 ?auto_122966 ) ) ( not ( = ?auto_122965 ?auto_122966 ) ) ( not ( = ?auto_122963 ?auto_122966 ) ) ( ON ?auto_122961 ?auto_122960 ) ( ON-TABLE ?auto_122966 ) ( ON ?auto_122962 ?auto_122961 ) ( ON ?auto_122964 ?auto_122962 ) ( ON ?auto_122963 ?auto_122964 ) ( CLEAR ?auto_122963 ) ( HOLDING ?auto_122965 ) ( CLEAR ?auto_122967 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_122967 ?auto_122965 )
      ( MAKE-3PILE ?auto_122960 ?auto_122961 ?auto_122962 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122968 - BLOCK
      ?auto_122969 - BLOCK
      ?auto_122970 - BLOCK
    )
    :vars
    (
      ?auto_122974 - BLOCK
      ?auto_122971 - BLOCK
      ?auto_122973 - BLOCK
      ?auto_122975 - BLOCK
      ?auto_122972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122968 ?auto_122969 ) ) ( not ( = ?auto_122968 ?auto_122970 ) ) ( not ( = ?auto_122969 ?auto_122970 ) ) ( not ( = ?auto_122968 ?auto_122974 ) ) ( not ( = ?auto_122969 ?auto_122974 ) ) ( not ( = ?auto_122970 ?auto_122974 ) ) ( ON-TABLE ?auto_122971 ) ( not ( = ?auto_122971 ?auto_122973 ) ) ( not ( = ?auto_122971 ?auto_122975 ) ) ( not ( = ?auto_122971 ?auto_122974 ) ) ( not ( = ?auto_122971 ?auto_122970 ) ) ( not ( = ?auto_122971 ?auto_122969 ) ) ( not ( = ?auto_122973 ?auto_122975 ) ) ( not ( = ?auto_122973 ?auto_122974 ) ) ( not ( = ?auto_122973 ?auto_122970 ) ) ( not ( = ?auto_122973 ?auto_122969 ) ) ( not ( = ?auto_122975 ?auto_122974 ) ) ( not ( = ?auto_122975 ?auto_122970 ) ) ( not ( = ?auto_122975 ?auto_122969 ) ) ( not ( = ?auto_122968 ?auto_122971 ) ) ( not ( = ?auto_122968 ?auto_122973 ) ) ( not ( = ?auto_122968 ?auto_122975 ) ) ( ON ?auto_122968 ?auto_122972 ) ( not ( = ?auto_122968 ?auto_122972 ) ) ( not ( = ?auto_122969 ?auto_122972 ) ) ( not ( = ?auto_122970 ?auto_122972 ) ) ( not ( = ?auto_122974 ?auto_122972 ) ) ( not ( = ?auto_122971 ?auto_122972 ) ) ( not ( = ?auto_122973 ?auto_122972 ) ) ( not ( = ?auto_122975 ?auto_122972 ) ) ( ON ?auto_122969 ?auto_122968 ) ( ON-TABLE ?auto_122972 ) ( ON ?auto_122970 ?auto_122969 ) ( ON ?auto_122974 ?auto_122970 ) ( ON ?auto_122975 ?auto_122974 ) ( CLEAR ?auto_122971 ) ( ON ?auto_122973 ?auto_122975 ) ( CLEAR ?auto_122973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_122972 ?auto_122968 ?auto_122969 ?auto_122970 ?auto_122974 ?auto_122975 )
      ( MAKE-3PILE ?auto_122968 ?auto_122969 ?auto_122970 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122976 - BLOCK
      ?auto_122977 - BLOCK
      ?auto_122978 - BLOCK
    )
    :vars
    (
      ?auto_122980 - BLOCK
      ?auto_122979 - BLOCK
      ?auto_122983 - BLOCK
      ?auto_122981 - BLOCK
      ?auto_122982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122976 ?auto_122977 ) ) ( not ( = ?auto_122976 ?auto_122978 ) ) ( not ( = ?auto_122977 ?auto_122978 ) ) ( not ( = ?auto_122976 ?auto_122980 ) ) ( not ( = ?auto_122977 ?auto_122980 ) ) ( not ( = ?auto_122978 ?auto_122980 ) ) ( not ( = ?auto_122979 ?auto_122983 ) ) ( not ( = ?auto_122979 ?auto_122981 ) ) ( not ( = ?auto_122979 ?auto_122980 ) ) ( not ( = ?auto_122979 ?auto_122978 ) ) ( not ( = ?auto_122979 ?auto_122977 ) ) ( not ( = ?auto_122983 ?auto_122981 ) ) ( not ( = ?auto_122983 ?auto_122980 ) ) ( not ( = ?auto_122983 ?auto_122978 ) ) ( not ( = ?auto_122983 ?auto_122977 ) ) ( not ( = ?auto_122981 ?auto_122980 ) ) ( not ( = ?auto_122981 ?auto_122978 ) ) ( not ( = ?auto_122981 ?auto_122977 ) ) ( not ( = ?auto_122976 ?auto_122979 ) ) ( not ( = ?auto_122976 ?auto_122983 ) ) ( not ( = ?auto_122976 ?auto_122981 ) ) ( ON ?auto_122976 ?auto_122982 ) ( not ( = ?auto_122976 ?auto_122982 ) ) ( not ( = ?auto_122977 ?auto_122982 ) ) ( not ( = ?auto_122978 ?auto_122982 ) ) ( not ( = ?auto_122980 ?auto_122982 ) ) ( not ( = ?auto_122979 ?auto_122982 ) ) ( not ( = ?auto_122983 ?auto_122982 ) ) ( not ( = ?auto_122981 ?auto_122982 ) ) ( ON ?auto_122977 ?auto_122976 ) ( ON-TABLE ?auto_122982 ) ( ON ?auto_122978 ?auto_122977 ) ( ON ?auto_122980 ?auto_122978 ) ( ON ?auto_122981 ?auto_122980 ) ( ON ?auto_122983 ?auto_122981 ) ( CLEAR ?auto_122983 ) ( HOLDING ?auto_122979 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_122979 )
      ( MAKE-3PILE ?auto_122976 ?auto_122977 ?auto_122978 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122984 - BLOCK
      ?auto_122985 - BLOCK
      ?auto_122986 - BLOCK
    )
    :vars
    (
      ?auto_122988 - BLOCK
      ?auto_122990 - BLOCK
      ?auto_122987 - BLOCK
      ?auto_122991 - BLOCK
      ?auto_122989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_122984 ?auto_122985 ) ) ( not ( = ?auto_122984 ?auto_122986 ) ) ( not ( = ?auto_122985 ?auto_122986 ) ) ( not ( = ?auto_122984 ?auto_122988 ) ) ( not ( = ?auto_122985 ?auto_122988 ) ) ( not ( = ?auto_122986 ?auto_122988 ) ) ( not ( = ?auto_122990 ?auto_122987 ) ) ( not ( = ?auto_122990 ?auto_122991 ) ) ( not ( = ?auto_122990 ?auto_122988 ) ) ( not ( = ?auto_122990 ?auto_122986 ) ) ( not ( = ?auto_122990 ?auto_122985 ) ) ( not ( = ?auto_122987 ?auto_122991 ) ) ( not ( = ?auto_122987 ?auto_122988 ) ) ( not ( = ?auto_122987 ?auto_122986 ) ) ( not ( = ?auto_122987 ?auto_122985 ) ) ( not ( = ?auto_122991 ?auto_122988 ) ) ( not ( = ?auto_122991 ?auto_122986 ) ) ( not ( = ?auto_122991 ?auto_122985 ) ) ( not ( = ?auto_122984 ?auto_122990 ) ) ( not ( = ?auto_122984 ?auto_122987 ) ) ( not ( = ?auto_122984 ?auto_122991 ) ) ( ON ?auto_122984 ?auto_122989 ) ( not ( = ?auto_122984 ?auto_122989 ) ) ( not ( = ?auto_122985 ?auto_122989 ) ) ( not ( = ?auto_122986 ?auto_122989 ) ) ( not ( = ?auto_122988 ?auto_122989 ) ) ( not ( = ?auto_122990 ?auto_122989 ) ) ( not ( = ?auto_122987 ?auto_122989 ) ) ( not ( = ?auto_122991 ?auto_122989 ) ) ( ON ?auto_122985 ?auto_122984 ) ( ON-TABLE ?auto_122989 ) ( ON ?auto_122986 ?auto_122985 ) ( ON ?auto_122988 ?auto_122986 ) ( ON ?auto_122991 ?auto_122988 ) ( ON ?auto_122987 ?auto_122991 ) ( ON ?auto_122990 ?auto_122987 ) ( CLEAR ?auto_122990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_122989 ?auto_122984 ?auto_122985 ?auto_122986 ?auto_122988 ?auto_122991 ?auto_122987 )
      ( MAKE-3PILE ?auto_122984 ?auto_122985 ?auto_122986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122995 - BLOCK
      ?auto_122996 - BLOCK
      ?auto_122997 - BLOCK
    )
    :vars
    (
      ?auto_122998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_122998 ?auto_122997 ) ( CLEAR ?auto_122998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_122995 ) ( ON ?auto_122996 ?auto_122995 ) ( ON ?auto_122997 ?auto_122996 ) ( not ( = ?auto_122995 ?auto_122996 ) ) ( not ( = ?auto_122995 ?auto_122997 ) ) ( not ( = ?auto_122995 ?auto_122998 ) ) ( not ( = ?auto_122996 ?auto_122997 ) ) ( not ( = ?auto_122996 ?auto_122998 ) ) ( not ( = ?auto_122997 ?auto_122998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_122998 ?auto_122997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_122999 - BLOCK
      ?auto_123000 - BLOCK
      ?auto_123001 - BLOCK
    )
    :vars
    (
      ?auto_123002 - BLOCK
      ?auto_123003 - BLOCK
      ?auto_123004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123002 ?auto_123001 ) ( CLEAR ?auto_123002 ) ( ON-TABLE ?auto_122999 ) ( ON ?auto_123000 ?auto_122999 ) ( ON ?auto_123001 ?auto_123000 ) ( not ( = ?auto_122999 ?auto_123000 ) ) ( not ( = ?auto_122999 ?auto_123001 ) ) ( not ( = ?auto_122999 ?auto_123002 ) ) ( not ( = ?auto_123000 ?auto_123001 ) ) ( not ( = ?auto_123000 ?auto_123002 ) ) ( not ( = ?auto_123001 ?auto_123002 ) ) ( HOLDING ?auto_123003 ) ( CLEAR ?auto_123004 ) ( not ( = ?auto_122999 ?auto_123003 ) ) ( not ( = ?auto_122999 ?auto_123004 ) ) ( not ( = ?auto_123000 ?auto_123003 ) ) ( not ( = ?auto_123000 ?auto_123004 ) ) ( not ( = ?auto_123001 ?auto_123003 ) ) ( not ( = ?auto_123001 ?auto_123004 ) ) ( not ( = ?auto_123002 ?auto_123003 ) ) ( not ( = ?auto_123002 ?auto_123004 ) ) ( not ( = ?auto_123003 ?auto_123004 ) ) )
    :subtasks
    ( ( !STACK ?auto_123003 ?auto_123004 )
      ( MAKE-3PILE ?auto_122999 ?auto_123000 ?auto_123001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123005 - BLOCK
      ?auto_123006 - BLOCK
      ?auto_123007 - BLOCK
    )
    :vars
    (
      ?auto_123009 - BLOCK
      ?auto_123010 - BLOCK
      ?auto_123008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123009 ?auto_123007 ) ( ON-TABLE ?auto_123005 ) ( ON ?auto_123006 ?auto_123005 ) ( ON ?auto_123007 ?auto_123006 ) ( not ( = ?auto_123005 ?auto_123006 ) ) ( not ( = ?auto_123005 ?auto_123007 ) ) ( not ( = ?auto_123005 ?auto_123009 ) ) ( not ( = ?auto_123006 ?auto_123007 ) ) ( not ( = ?auto_123006 ?auto_123009 ) ) ( not ( = ?auto_123007 ?auto_123009 ) ) ( CLEAR ?auto_123010 ) ( not ( = ?auto_123005 ?auto_123008 ) ) ( not ( = ?auto_123005 ?auto_123010 ) ) ( not ( = ?auto_123006 ?auto_123008 ) ) ( not ( = ?auto_123006 ?auto_123010 ) ) ( not ( = ?auto_123007 ?auto_123008 ) ) ( not ( = ?auto_123007 ?auto_123010 ) ) ( not ( = ?auto_123009 ?auto_123008 ) ) ( not ( = ?auto_123009 ?auto_123010 ) ) ( not ( = ?auto_123008 ?auto_123010 ) ) ( ON ?auto_123008 ?auto_123009 ) ( CLEAR ?auto_123008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123005 ?auto_123006 ?auto_123007 ?auto_123009 )
      ( MAKE-3PILE ?auto_123005 ?auto_123006 ?auto_123007 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123011 - BLOCK
      ?auto_123012 - BLOCK
      ?auto_123013 - BLOCK
    )
    :vars
    (
      ?auto_123014 - BLOCK
      ?auto_123016 - BLOCK
      ?auto_123015 - BLOCK
      ?auto_123017 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123014 ?auto_123013 ) ( ON-TABLE ?auto_123011 ) ( ON ?auto_123012 ?auto_123011 ) ( ON ?auto_123013 ?auto_123012 ) ( not ( = ?auto_123011 ?auto_123012 ) ) ( not ( = ?auto_123011 ?auto_123013 ) ) ( not ( = ?auto_123011 ?auto_123014 ) ) ( not ( = ?auto_123012 ?auto_123013 ) ) ( not ( = ?auto_123012 ?auto_123014 ) ) ( not ( = ?auto_123013 ?auto_123014 ) ) ( not ( = ?auto_123011 ?auto_123016 ) ) ( not ( = ?auto_123011 ?auto_123015 ) ) ( not ( = ?auto_123012 ?auto_123016 ) ) ( not ( = ?auto_123012 ?auto_123015 ) ) ( not ( = ?auto_123013 ?auto_123016 ) ) ( not ( = ?auto_123013 ?auto_123015 ) ) ( not ( = ?auto_123014 ?auto_123016 ) ) ( not ( = ?auto_123014 ?auto_123015 ) ) ( not ( = ?auto_123016 ?auto_123015 ) ) ( ON ?auto_123016 ?auto_123014 ) ( CLEAR ?auto_123016 ) ( HOLDING ?auto_123015 ) ( CLEAR ?auto_123017 ) ( ON-TABLE ?auto_123017 ) ( not ( = ?auto_123017 ?auto_123015 ) ) ( not ( = ?auto_123011 ?auto_123017 ) ) ( not ( = ?auto_123012 ?auto_123017 ) ) ( not ( = ?auto_123013 ?auto_123017 ) ) ( not ( = ?auto_123014 ?auto_123017 ) ) ( not ( = ?auto_123016 ?auto_123017 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123017 ?auto_123015 )
      ( MAKE-3PILE ?auto_123011 ?auto_123012 ?auto_123013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123018 - BLOCK
      ?auto_123019 - BLOCK
      ?auto_123020 - BLOCK
    )
    :vars
    (
      ?auto_123023 - BLOCK
      ?auto_123024 - BLOCK
      ?auto_123022 - BLOCK
      ?auto_123021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123023 ?auto_123020 ) ( ON-TABLE ?auto_123018 ) ( ON ?auto_123019 ?auto_123018 ) ( ON ?auto_123020 ?auto_123019 ) ( not ( = ?auto_123018 ?auto_123019 ) ) ( not ( = ?auto_123018 ?auto_123020 ) ) ( not ( = ?auto_123018 ?auto_123023 ) ) ( not ( = ?auto_123019 ?auto_123020 ) ) ( not ( = ?auto_123019 ?auto_123023 ) ) ( not ( = ?auto_123020 ?auto_123023 ) ) ( not ( = ?auto_123018 ?auto_123024 ) ) ( not ( = ?auto_123018 ?auto_123022 ) ) ( not ( = ?auto_123019 ?auto_123024 ) ) ( not ( = ?auto_123019 ?auto_123022 ) ) ( not ( = ?auto_123020 ?auto_123024 ) ) ( not ( = ?auto_123020 ?auto_123022 ) ) ( not ( = ?auto_123023 ?auto_123024 ) ) ( not ( = ?auto_123023 ?auto_123022 ) ) ( not ( = ?auto_123024 ?auto_123022 ) ) ( ON ?auto_123024 ?auto_123023 ) ( CLEAR ?auto_123021 ) ( ON-TABLE ?auto_123021 ) ( not ( = ?auto_123021 ?auto_123022 ) ) ( not ( = ?auto_123018 ?auto_123021 ) ) ( not ( = ?auto_123019 ?auto_123021 ) ) ( not ( = ?auto_123020 ?auto_123021 ) ) ( not ( = ?auto_123023 ?auto_123021 ) ) ( not ( = ?auto_123024 ?auto_123021 ) ) ( ON ?auto_123022 ?auto_123024 ) ( CLEAR ?auto_123022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123018 ?auto_123019 ?auto_123020 ?auto_123023 ?auto_123024 )
      ( MAKE-3PILE ?auto_123018 ?auto_123019 ?auto_123020 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123025 - BLOCK
      ?auto_123026 - BLOCK
      ?auto_123027 - BLOCK
    )
    :vars
    (
      ?auto_123028 - BLOCK
      ?auto_123031 - BLOCK
      ?auto_123029 - BLOCK
      ?auto_123030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123028 ?auto_123027 ) ( ON-TABLE ?auto_123025 ) ( ON ?auto_123026 ?auto_123025 ) ( ON ?auto_123027 ?auto_123026 ) ( not ( = ?auto_123025 ?auto_123026 ) ) ( not ( = ?auto_123025 ?auto_123027 ) ) ( not ( = ?auto_123025 ?auto_123028 ) ) ( not ( = ?auto_123026 ?auto_123027 ) ) ( not ( = ?auto_123026 ?auto_123028 ) ) ( not ( = ?auto_123027 ?auto_123028 ) ) ( not ( = ?auto_123025 ?auto_123031 ) ) ( not ( = ?auto_123025 ?auto_123029 ) ) ( not ( = ?auto_123026 ?auto_123031 ) ) ( not ( = ?auto_123026 ?auto_123029 ) ) ( not ( = ?auto_123027 ?auto_123031 ) ) ( not ( = ?auto_123027 ?auto_123029 ) ) ( not ( = ?auto_123028 ?auto_123031 ) ) ( not ( = ?auto_123028 ?auto_123029 ) ) ( not ( = ?auto_123031 ?auto_123029 ) ) ( ON ?auto_123031 ?auto_123028 ) ( not ( = ?auto_123030 ?auto_123029 ) ) ( not ( = ?auto_123025 ?auto_123030 ) ) ( not ( = ?auto_123026 ?auto_123030 ) ) ( not ( = ?auto_123027 ?auto_123030 ) ) ( not ( = ?auto_123028 ?auto_123030 ) ) ( not ( = ?auto_123031 ?auto_123030 ) ) ( ON ?auto_123029 ?auto_123031 ) ( CLEAR ?auto_123029 ) ( HOLDING ?auto_123030 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123030 )
      ( MAKE-3PILE ?auto_123025 ?auto_123026 ?auto_123027 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123032 - BLOCK
      ?auto_123033 - BLOCK
      ?auto_123034 - BLOCK
    )
    :vars
    (
      ?auto_123035 - BLOCK
      ?auto_123037 - BLOCK
      ?auto_123036 - BLOCK
      ?auto_123038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123035 ?auto_123034 ) ( ON-TABLE ?auto_123032 ) ( ON ?auto_123033 ?auto_123032 ) ( ON ?auto_123034 ?auto_123033 ) ( not ( = ?auto_123032 ?auto_123033 ) ) ( not ( = ?auto_123032 ?auto_123034 ) ) ( not ( = ?auto_123032 ?auto_123035 ) ) ( not ( = ?auto_123033 ?auto_123034 ) ) ( not ( = ?auto_123033 ?auto_123035 ) ) ( not ( = ?auto_123034 ?auto_123035 ) ) ( not ( = ?auto_123032 ?auto_123037 ) ) ( not ( = ?auto_123032 ?auto_123036 ) ) ( not ( = ?auto_123033 ?auto_123037 ) ) ( not ( = ?auto_123033 ?auto_123036 ) ) ( not ( = ?auto_123034 ?auto_123037 ) ) ( not ( = ?auto_123034 ?auto_123036 ) ) ( not ( = ?auto_123035 ?auto_123037 ) ) ( not ( = ?auto_123035 ?auto_123036 ) ) ( not ( = ?auto_123037 ?auto_123036 ) ) ( ON ?auto_123037 ?auto_123035 ) ( not ( = ?auto_123038 ?auto_123036 ) ) ( not ( = ?auto_123032 ?auto_123038 ) ) ( not ( = ?auto_123033 ?auto_123038 ) ) ( not ( = ?auto_123034 ?auto_123038 ) ) ( not ( = ?auto_123035 ?auto_123038 ) ) ( not ( = ?auto_123037 ?auto_123038 ) ) ( ON ?auto_123036 ?auto_123037 ) ( ON ?auto_123038 ?auto_123036 ) ( CLEAR ?auto_123038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123032 ?auto_123033 ?auto_123034 ?auto_123035 ?auto_123037 ?auto_123036 )
      ( MAKE-3PILE ?auto_123032 ?auto_123033 ?auto_123034 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123039 - BLOCK
      ?auto_123040 - BLOCK
      ?auto_123041 - BLOCK
    )
    :vars
    (
      ?auto_123043 - BLOCK
      ?auto_123042 - BLOCK
      ?auto_123044 - BLOCK
      ?auto_123045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123043 ?auto_123041 ) ( ON-TABLE ?auto_123039 ) ( ON ?auto_123040 ?auto_123039 ) ( ON ?auto_123041 ?auto_123040 ) ( not ( = ?auto_123039 ?auto_123040 ) ) ( not ( = ?auto_123039 ?auto_123041 ) ) ( not ( = ?auto_123039 ?auto_123043 ) ) ( not ( = ?auto_123040 ?auto_123041 ) ) ( not ( = ?auto_123040 ?auto_123043 ) ) ( not ( = ?auto_123041 ?auto_123043 ) ) ( not ( = ?auto_123039 ?auto_123042 ) ) ( not ( = ?auto_123039 ?auto_123044 ) ) ( not ( = ?auto_123040 ?auto_123042 ) ) ( not ( = ?auto_123040 ?auto_123044 ) ) ( not ( = ?auto_123041 ?auto_123042 ) ) ( not ( = ?auto_123041 ?auto_123044 ) ) ( not ( = ?auto_123043 ?auto_123042 ) ) ( not ( = ?auto_123043 ?auto_123044 ) ) ( not ( = ?auto_123042 ?auto_123044 ) ) ( ON ?auto_123042 ?auto_123043 ) ( not ( = ?auto_123045 ?auto_123044 ) ) ( not ( = ?auto_123039 ?auto_123045 ) ) ( not ( = ?auto_123040 ?auto_123045 ) ) ( not ( = ?auto_123041 ?auto_123045 ) ) ( not ( = ?auto_123043 ?auto_123045 ) ) ( not ( = ?auto_123042 ?auto_123045 ) ) ( ON ?auto_123044 ?auto_123042 ) ( HOLDING ?auto_123045 ) ( CLEAR ?auto_123044 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123039 ?auto_123040 ?auto_123041 ?auto_123043 ?auto_123042 ?auto_123044 ?auto_123045 )
      ( MAKE-3PILE ?auto_123039 ?auto_123040 ?auto_123041 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123046 - BLOCK
      ?auto_123047 - BLOCK
      ?auto_123048 - BLOCK
    )
    :vars
    (
      ?auto_123050 - BLOCK
      ?auto_123052 - BLOCK
      ?auto_123051 - BLOCK
      ?auto_123049 - BLOCK
      ?auto_123053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123050 ?auto_123048 ) ( ON-TABLE ?auto_123046 ) ( ON ?auto_123047 ?auto_123046 ) ( ON ?auto_123048 ?auto_123047 ) ( not ( = ?auto_123046 ?auto_123047 ) ) ( not ( = ?auto_123046 ?auto_123048 ) ) ( not ( = ?auto_123046 ?auto_123050 ) ) ( not ( = ?auto_123047 ?auto_123048 ) ) ( not ( = ?auto_123047 ?auto_123050 ) ) ( not ( = ?auto_123048 ?auto_123050 ) ) ( not ( = ?auto_123046 ?auto_123052 ) ) ( not ( = ?auto_123046 ?auto_123051 ) ) ( not ( = ?auto_123047 ?auto_123052 ) ) ( not ( = ?auto_123047 ?auto_123051 ) ) ( not ( = ?auto_123048 ?auto_123052 ) ) ( not ( = ?auto_123048 ?auto_123051 ) ) ( not ( = ?auto_123050 ?auto_123052 ) ) ( not ( = ?auto_123050 ?auto_123051 ) ) ( not ( = ?auto_123052 ?auto_123051 ) ) ( ON ?auto_123052 ?auto_123050 ) ( not ( = ?auto_123049 ?auto_123051 ) ) ( not ( = ?auto_123046 ?auto_123049 ) ) ( not ( = ?auto_123047 ?auto_123049 ) ) ( not ( = ?auto_123048 ?auto_123049 ) ) ( not ( = ?auto_123050 ?auto_123049 ) ) ( not ( = ?auto_123052 ?auto_123049 ) ) ( ON ?auto_123051 ?auto_123052 ) ( CLEAR ?auto_123051 ) ( ON ?auto_123049 ?auto_123053 ) ( CLEAR ?auto_123049 ) ( HAND-EMPTY ) ( not ( = ?auto_123046 ?auto_123053 ) ) ( not ( = ?auto_123047 ?auto_123053 ) ) ( not ( = ?auto_123048 ?auto_123053 ) ) ( not ( = ?auto_123050 ?auto_123053 ) ) ( not ( = ?auto_123052 ?auto_123053 ) ) ( not ( = ?auto_123051 ?auto_123053 ) ) ( not ( = ?auto_123049 ?auto_123053 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123049 ?auto_123053 )
      ( MAKE-3PILE ?auto_123046 ?auto_123047 ?auto_123048 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123054 - BLOCK
      ?auto_123055 - BLOCK
      ?auto_123056 - BLOCK
    )
    :vars
    (
      ?auto_123061 - BLOCK
      ?auto_123057 - BLOCK
      ?auto_123058 - BLOCK
      ?auto_123059 - BLOCK
      ?auto_123060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123061 ?auto_123056 ) ( ON-TABLE ?auto_123054 ) ( ON ?auto_123055 ?auto_123054 ) ( ON ?auto_123056 ?auto_123055 ) ( not ( = ?auto_123054 ?auto_123055 ) ) ( not ( = ?auto_123054 ?auto_123056 ) ) ( not ( = ?auto_123054 ?auto_123061 ) ) ( not ( = ?auto_123055 ?auto_123056 ) ) ( not ( = ?auto_123055 ?auto_123061 ) ) ( not ( = ?auto_123056 ?auto_123061 ) ) ( not ( = ?auto_123054 ?auto_123057 ) ) ( not ( = ?auto_123054 ?auto_123058 ) ) ( not ( = ?auto_123055 ?auto_123057 ) ) ( not ( = ?auto_123055 ?auto_123058 ) ) ( not ( = ?auto_123056 ?auto_123057 ) ) ( not ( = ?auto_123056 ?auto_123058 ) ) ( not ( = ?auto_123061 ?auto_123057 ) ) ( not ( = ?auto_123061 ?auto_123058 ) ) ( not ( = ?auto_123057 ?auto_123058 ) ) ( ON ?auto_123057 ?auto_123061 ) ( not ( = ?auto_123059 ?auto_123058 ) ) ( not ( = ?auto_123054 ?auto_123059 ) ) ( not ( = ?auto_123055 ?auto_123059 ) ) ( not ( = ?auto_123056 ?auto_123059 ) ) ( not ( = ?auto_123061 ?auto_123059 ) ) ( not ( = ?auto_123057 ?auto_123059 ) ) ( ON ?auto_123059 ?auto_123060 ) ( CLEAR ?auto_123059 ) ( not ( = ?auto_123054 ?auto_123060 ) ) ( not ( = ?auto_123055 ?auto_123060 ) ) ( not ( = ?auto_123056 ?auto_123060 ) ) ( not ( = ?auto_123061 ?auto_123060 ) ) ( not ( = ?auto_123057 ?auto_123060 ) ) ( not ( = ?auto_123058 ?auto_123060 ) ) ( not ( = ?auto_123059 ?auto_123060 ) ) ( HOLDING ?auto_123058 ) ( CLEAR ?auto_123057 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123054 ?auto_123055 ?auto_123056 ?auto_123061 ?auto_123057 ?auto_123058 )
      ( MAKE-3PILE ?auto_123054 ?auto_123055 ?auto_123056 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123062 - BLOCK
      ?auto_123063 - BLOCK
      ?auto_123064 - BLOCK
    )
    :vars
    (
      ?auto_123066 - BLOCK
      ?auto_123069 - BLOCK
      ?auto_123068 - BLOCK
      ?auto_123065 - BLOCK
      ?auto_123067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123066 ?auto_123064 ) ( ON-TABLE ?auto_123062 ) ( ON ?auto_123063 ?auto_123062 ) ( ON ?auto_123064 ?auto_123063 ) ( not ( = ?auto_123062 ?auto_123063 ) ) ( not ( = ?auto_123062 ?auto_123064 ) ) ( not ( = ?auto_123062 ?auto_123066 ) ) ( not ( = ?auto_123063 ?auto_123064 ) ) ( not ( = ?auto_123063 ?auto_123066 ) ) ( not ( = ?auto_123064 ?auto_123066 ) ) ( not ( = ?auto_123062 ?auto_123069 ) ) ( not ( = ?auto_123062 ?auto_123068 ) ) ( not ( = ?auto_123063 ?auto_123069 ) ) ( not ( = ?auto_123063 ?auto_123068 ) ) ( not ( = ?auto_123064 ?auto_123069 ) ) ( not ( = ?auto_123064 ?auto_123068 ) ) ( not ( = ?auto_123066 ?auto_123069 ) ) ( not ( = ?auto_123066 ?auto_123068 ) ) ( not ( = ?auto_123069 ?auto_123068 ) ) ( ON ?auto_123069 ?auto_123066 ) ( not ( = ?auto_123065 ?auto_123068 ) ) ( not ( = ?auto_123062 ?auto_123065 ) ) ( not ( = ?auto_123063 ?auto_123065 ) ) ( not ( = ?auto_123064 ?auto_123065 ) ) ( not ( = ?auto_123066 ?auto_123065 ) ) ( not ( = ?auto_123069 ?auto_123065 ) ) ( ON ?auto_123065 ?auto_123067 ) ( not ( = ?auto_123062 ?auto_123067 ) ) ( not ( = ?auto_123063 ?auto_123067 ) ) ( not ( = ?auto_123064 ?auto_123067 ) ) ( not ( = ?auto_123066 ?auto_123067 ) ) ( not ( = ?auto_123069 ?auto_123067 ) ) ( not ( = ?auto_123068 ?auto_123067 ) ) ( not ( = ?auto_123065 ?auto_123067 ) ) ( CLEAR ?auto_123069 ) ( ON ?auto_123068 ?auto_123065 ) ( CLEAR ?auto_123068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123067 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123067 ?auto_123065 )
      ( MAKE-3PILE ?auto_123062 ?auto_123063 ?auto_123064 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123070 - BLOCK
      ?auto_123071 - BLOCK
      ?auto_123072 - BLOCK
    )
    :vars
    (
      ?auto_123076 - BLOCK
      ?auto_123074 - BLOCK
      ?auto_123073 - BLOCK
      ?auto_123077 - BLOCK
      ?auto_123075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123076 ?auto_123072 ) ( ON-TABLE ?auto_123070 ) ( ON ?auto_123071 ?auto_123070 ) ( ON ?auto_123072 ?auto_123071 ) ( not ( = ?auto_123070 ?auto_123071 ) ) ( not ( = ?auto_123070 ?auto_123072 ) ) ( not ( = ?auto_123070 ?auto_123076 ) ) ( not ( = ?auto_123071 ?auto_123072 ) ) ( not ( = ?auto_123071 ?auto_123076 ) ) ( not ( = ?auto_123072 ?auto_123076 ) ) ( not ( = ?auto_123070 ?auto_123074 ) ) ( not ( = ?auto_123070 ?auto_123073 ) ) ( not ( = ?auto_123071 ?auto_123074 ) ) ( not ( = ?auto_123071 ?auto_123073 ) ) ( not ( = ?auto_123072 ?auto_123074 ) ) ( not ( = ?auto_123072 ?auto_123073 ) ) ( not ( = ?auto_123076 ?auto_123074 ) ) ( not ( = ?auto_123076 ?auto_123073 ) ) ( not ( = ?auto_123074 ?auto_123073 ) ) ( not ( = ?auto_123077 ?auto_123073 ) ) ( not ( = ?auto_123070 ?auto_123077 ) ) ( not ( = ?auto_123071 ?auto_123077 ) ) ( not ( = ?auto_123072 ?auto_123077 ) ) ( not ( = ?auto_123076 ?auto_123077 ) ) ( not ( = ?auto_123074 ?auto_123077 ) ) ( ON ?auto_123077 ?auto_123075 ) ( not ( = ?auto_123070 ?auto_123075 ) ) ( not ( = ?auto_123071 ?auto_123075 ) ) ( not ( = ?auto_123072 ?auto_123075 ) ) ( not ( = ?auto_123076 ?auto_123075 ) ) ( not ( = ?auto_123074 ?auto_123075 ) ) ( not ( = ?auto_123073 ?auto_123075 ) ) ( not ( = ?auto_123077 ?auto_123075 ) ) ( ON ?auto_123073 ?auto_123077 ) ( CLEAR ?auto_123073 ) ( ON-TABLE ?auto_123075 ) ( HOLDING ?auto_123074 ) ( CLEAR ?auto_123076 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123070 ?auto_123071 ?auto_123072 ?auto_123076 ?auto_123074 )
      ( MAKE-3PILE ?auto_123070 ?auto_123071 ?auto_123072 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123078 - BLOCK
      ?auto_123079 - BLOCK
      ?auto_123080 - BLOCK
    )
    :vars
    (
      ?auto_123081 - BLOCK
      ?auto_123085 - BLOCK
      ?auto_123084 - BLOCK
      ?auto_123082 - BLOCK
      ?auto_123083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123081 ?auto_123080 ) ( ON-TABLE ?auto_123078 ) ( ON ?auto_123079 ?auto_123078 ) ( ON ?auto_123080 ?auto_123079 ) ( not ( = ?auto_123078 ?auto_123079 ) ) ( not ( = ?auto_123078 ?auto_123080 ) ) ( not ( = ?auto_123078 ?auto_123081 ) ) ( not ( = ?auto_123079 ?auto_123080 ) ) ( not ( = ?auto_123079 ?auto_123081 ) ) ( not ( = ?auto_123080 ?auto_123081 ) ) ( not ( = ?auto_123078 ?auto_123085 ) ) ( not ( = ?auto_123078 ?auto_123084 ) ) ( not ( = ?auto_123079 ?auto_123085 ) ) ( not ( = ?auto_123079 ?auto_123084 ) ) ( not ( = ?auto_123080 ?auto_123085 ) ) ( not ( = ?auto_123080 ?auto_123084 ) ) ( not ( = ?auto_123081 ?auto_123085 ) ) ( not ( = ?auto_123081 ?auto_123084 ) ) ( not ( = ?auto_123085 ?auto_123084 ) ) ( not ( = ?auto_123082 ?auto_123084 ) ) ( not ( = ?auto_123078 ?auto_123082 ) ) ( not ( = ?auto_123079 ?auto_123082 ) ) ( not ( = ?auto_123080 ?auto_123082 ) ) ( not ( = ?auto_123081 ?auto_123082 ) ) ( not ( = ?auto_123085 ?auto_123082 ) ) ( ON ?auto_123082 ?auto_123083 ) ( not ( = ?auto_123078 ?auto_123083 ) ) ( not ( = ?auto_123079 ?auto_123083 ) ) ( not ( = ?auto_123080 ?auto_123083 ) ) ( not ( = ?auto_123081 ?auto_123083 ) ) ( not ( = ?auto_123085 ?auto_123083 ) ) ( not ( = ?auto_123084 ?auto_123083 ) ) ( not ( = ?auto_123082 ?auto_123083 ) ) ( ON ?auto_123084 ?auto_123082 ) ( ON-TABLE ?auto_123083 ) ( CLEAR ?auto_123081 ) ( ON ?auto_123085 ?auto_123084 ) ( CLEAR ?auto_123085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123083 ?auto_123082 ?auto_123084 )
      ( MAKE-3PILE ?auto_123078 ?auto_123079 ?auto_123080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123102 - BLOCK
      ?auto_123103 - BLOCK
      ?auto_123104 - BLOCK
    )
    :vars
    (
      ?auto_123108 - BLOCK
      ?auto_123107 - BLOCK
      ?auto_123109 - BLOCK
      ?auto_123106 - BLOCK
      ?auto_123105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123102 ) ( ON ?auto_123103 ?auto_123102 ) ( not ( = ?auto_123102 ?auto_123103 ) ) ( not ( = ?auto_123102 ?auto_123104 ) ) ( not ( = ?auto_123102 ?auto_123108 ) ) ( not ( = ?auto_123103 ?auto_123104 ) ) ( not ( = ?auto_123103 ?auto_123108 ) ) ( not ( = ?auto_123104 ?auto_123108 ) ) ( not ( = ?auto_123102 ?auto_123107 ) ) ( not ( = ?auto_123102 ?auto_123109 ) ) ( not ( = ?auto_123103 ?auto_123107 ) ) ( not ( = ?auto_123103 ?auto_123109 ) ) ( not ( = ?auto_123104 ?auto_123107 ) ) ( not ( = ?auto_123104 ?auto_123109 ) ) ( not ( = ?auto_123108 ?auto_123107 ) ) ( not ( = ?auto_123108 ?auto_123109 ) ) ( not ( = ?auto_123107 ?auto_123109 ) ) ( not ( = ?auto_123106 ?auto_123109 ) ) ( not ( = ?auto_123102 ?auto_123106 ) ) ( not ( = ?auto_123103 ?auto_123106 ) ) ( not ( = ?auto_123104 ?auto_123106 ) ) ( not ( = ?auto_123108 ?auto_123106 ) ) ( not ( = ?auto_123107 ?auto_123106 ) ) ( ON ?auto_123106 ?auto_123105 ) ( not ( = ?auto_123102 ?auto_123105 ) ) ( not ( = ?auto_123103 ?auto_123105 ) ) ( not ( = ?auto_123104 ?auto_123105 ) ) ( not ( = ?auto_123108 ?auto_123105 ) ) ( not ( = ?auto_123107 ?auto_123105 ) ) ( not ( = ?auto_123109 ?auto_123105 ) ) ( not ( = ?auto_123106 ?auto_123105 ) ) ( ON ?auto_123109 ?auto_123106 ) ( ON-TABLE ?auto_123105 ) ( ON ?auto_123107 ?auto_123109 ) ( ON ?auto_123108 ?auto_123107 ) ( CLEAR ?auto_123108 ) ( HOLDING ?auto_123104 ) ( CLEAR ?auto_123103 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123102 ?auto_123103 ?auto_123104 ?auto_123108 )
      ( MAKE-3PILE ?auto_123102 ?auto_123103 ?auto_123104 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123110 - BLOCK
      ?auto_123111 - BLOCK
      ?auto_123112 - BLOCK
    )
    :vars
    (
      ?auto_123115 - BLOCK
      ?auto_123116 - BLOCK
      ?auto_123117 - BLOCK
      ?auto_123113 - BLOCK
      ?auto_123114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123110 ) ( ON ?auto_123111 ?auto_123110 ) ( not ( = ?auto_123110 ?auto_123111 ) ) ( not ( = ?auto_123110 ?auto_123112 ) ) ( not ( = ?auto_123110 ?auto_123115 ) ) ( not ( = ?auto_123111 ?auto_123112 ) ) ( not ( = ?auto_123111 ?auto_123115 ) ) ( not ( = ?auto_123112 ?auto_123115 ) ) ( not ( = ?auto_123110 ?auto_123116 ) ) ( not ( = ?auto_123110 ?auto_123117 ) ) ( not ( = ?auto_123111 ?auto_123116 ) ) ( not ( = ?auto_123111 ?auto_123117 ) ) ( not ( = ?auto_123112 ?auto_123116 ) ) ( not ( = ?auto_123112 ?auto_123117 ) ) ( not ( = ?auto_123115 ?auto_123116 ) ) ( not ( = ?auto_123115 ?auto_123117 ) ) ( not ( = ?auto_123116 ?auto_123117 ) ) ( not ( = ?auto_123113 ?auto_123117 ) ) ( not ( = ?auto_123110 ?auto_123113 ) ) ( not ( = ?auto_123111 ?auto_123113 ) ) ( not ( = ?auto_123112 ?auto_123113 ) ) ( not ( = ?auto_123115 ?auto_123113 ) ) ( not ( = ?auto_123116 ?auto_123113 ) ) ( ON ?auto_123113 ?auto_123114 ) ( not ( = ?auto_123110 ?auto_123114 ) ) ( not ( = ?auto_123111 ?auto_123114 ) ) ( not ( = ?auto_123112 ?auto_123114 ) ) ( not ( = ?auto_123115 ?auto_123114 ) ) ( not ( = ?auto_123116 ?auto_123114 ) ) ( not ( = ?auto_123117 ?auto_123114 ) ) ( not ( = ?auto_123113 ?auto_123114 ) ) ( ON ?auto_123117 ?auto_123113 ) ( ON-TABLE ?auto_123114 ) ( ON ?auto_123116 ?auto_123117 ) ( ON ?auto_123115 ?auto_123116 ) ( CLEAR ?auto_123111 ) ( ON ?auto_123112 ?auto_123115 ) ( CLEAR ?auto_123112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123114 ?auto_123113 ?auto_123117 ?auto_123116 ?auto_123115 )
      ( MAKE-3PILE ?auto_123110 ?auto_123111 ?auto_123112 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123118 - BLOCK
      ?auto_123119 - BLOCK
      ?auto_123120 - BLOCK
    )
    :vars
    (
      ?auto_123123 - BLOCK
      ?auto_123122 - BLOCK
      ?auto_123124 - BLOCK
      ?auto_123121 - BLOCK
      ?auto_123125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123118 ) ( not ( = ?auto_123118 ?auto_123119 ) ) ( not ( = ?auto_123118 ?auto_123120 ) ) ( not ( = ?auto_123118 ?auto_123123 ) ) ( not ( = ?auto_123119 ?auto_123120 ) ) ( not ( = ?auto_123119 ?auto_123123 ) ) ( not ( = ?auto_123120 ?auto_123123 ) ) ( not ( = ?auto_123118 ?auto_123122 ) ) ( not ( = ?auto_123118 ?auto_123124 ) ) ( not ( = ?auto_123119 ?auto_123122 ) ) ( not ( = ?auto_123119 ?auto_123124 ) ) ( not ( = ?auto_123120 ?auto_123122 ) ) ( not ( = ?auto_123120 ?auto_123124 ) ) ( not ( = ?auto_123123 ?auto_123122 ) ) ( not ( = ?auto_123123 ?auto_123124 ) ) ( not ( = ?auto_123122 ?auto_123124 ) ) ( not ( = ?auto_123121 ?auto_123124 ) ) ( not ( = ?auto_123118 ?auto_123121 ) ) ( not ( = ?auto_123119 ?auto_123121 ) ) ( not ( = ?auto_123120 ?auto_123121 ) ) ( not ( = ?auto_123123 ?auto_123121 ) ) ( not ( = ?auto_123122 ?auto_123121 ) ) ( ON ?auto_123121 ?auto_123125 ) ( not ( = ?auto_123118 ?auto_123125 ) ) ( not ( = ?auto_123119 ?auto_123125 ) ) ( not ( = ?auto_123120 ?auto_123125 ) ) ( not ( = ?auto_123123 ?auto_123125 ) ) ( not ( = ?auto_123122 ?auto_123125 ) ) ( not ( = ?auto_123124 ?auto_123125 ) ) ( not ( = ?auto_123121 ?auto_123125 ) ) ( ON ?auto_123124 ?auto_123121 ) ( ON-TABLE ?auto_123125 ) ( ON ?auto_123122 ?auto_123124 ) ( ON ?auto_123123 ?auto_123122 ) ( ON ?auto_123120 ?auto_123123 ) ( CLEAR ?auto_123120 ) ( HOLDING ?auto_123119 ) ( CLEAR ?auto_123118 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123118 ?auto_123119 )
      ( MAKE-3PILE ?auto_123118 ?auto_123119 ?auto_123120 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123126 - BLOCK
      ?auto_123127 - BLOCK
      ?auto_123128 - BLOCK
    )
    :vars
    (
      ?auto_123129 - BLOCK
      ?auto_123131 - BLOCK
      ?auto_123132 - BLOCK
      ?auto_123130 - BLOCK
      ?auto_123133 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123126 ) ( not ( = ?auto_123126 ?auto_123127 ) ) ( not ( = ?auto_123126 ?auto_123128 ) ) ( not ( = ?auto_123126 ?auto_123129 ) ) ( not ( = ?auto_123127 ?auto_123128 ) ) ( not ( = ?auto_123127 ?auto_123129 ) ) ( not ( = ?auto_123128 ?auto_123129 ) ) ( not ( = ?auto_123126 ?auto_123131 ) ) ( not ( = ?auto_123126 ?auto_123132 ) ) ( not ( = ?auto_123127 ?auto_123131 ) ) ( not ( = ?auto_123127 ?auto_123132 ) ) ( not ( = ?auto_123128 ?auto_123131 ) ) ( not ( = ?auto_123128 ?auto_123132 ) ) ( not ( = ?auto_123129 ?auto_123131 ) ) ( not ( = ?auto_123129 ?auto_123132 ) ) ( not ( = ?auto_123131 ?auto_123132 ) ) ( not ( = ?auto_123130 ?auto_123132 ) ) ( not ( = ?auto_123126 ?auto_123130 ) ) ( not ( = ?auto_123127 ?auto_123130 ) ) ( not ( = ?auto_123128 ?auto_123130 ) ) ( not ( = ?auto_123129 ?auto_123130 ) ) ( not ( = ?auto_123131 ?auto_123130 ) ) ( ON ?auto_123130 ?auto_123133 ) ( not ( = ?auto_123126 ?auto_123133 ) ) ( not ( = ?auto_123127 ?auto_123133 ) ) ( not ( = ?auto_123128 ?auto_123133 ) ) ( not ( = ?auto_123129 ?auto_123133 ) ) ( not ( = ?auto_123131 ?auto_123133 ) ) ( not ( = ?auto_123132 ?auto_123133 ) ) ( not ( = ?auto_123130 ?auto_123133 ) ) ( ON ?auto_123132 ?auto_123130 ) ( ON-TABLE ?auto_123133 ) ( ON ?auto_123131 ?auto_123132 ) ( ON ?auto_123129 ?auto_123131 ) ( ON ?auto_123128 ?auto_123129 ) ( CLEAR ?auto_123126 ) ( ON ?auto_123127 ?auto_123128 ) ( CLEAR ?auto_123127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123133 ?auto_123130 ?auto_123132 ?auto_123131 ?auto_123129 ?auto_123128 )
      ( MAKE-3PILE ?auto_123126 ?auto_123127 ?auto_123128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123134 - BLOCK
      ?auto_123135 - BLOCK
      ?auto_123136 - BLOCK
    )
    :vars
    (
      ?auto_123139 - BLOCK
      ?auto_123137 - BLOCK
      ?auto_123138 - BLOCK
      ?auto_123140 - BLOCK
      ?auto_123141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123134 ?auto_123135 ) ) ( not ( = ?auto_123134 ?auto_123136 ) ) ( not ( = ?auto_123134 ?auto_123139 ) ) ( not ( = ?auto_123135 ?auto_123136 ) ) ( not ( = ?auto_123135 ?auto_123139 ) ) ( not ( = ?auto_123136 ?auto_123139 ) ) ( not ( = ?auto_123134 ?auto_123137 ) ) ( not ( = ?auto_123134 ?auto_123138 ) ) ( not ( = ?auto_123135 ?auto_123137 ) ) ( not ( = ?auto_123135 ?auto_123138 ) ) ( not ( = ?auto_123136 ?auto_123137 ) ) ( not ( = ?auto_123136 ?auto_123138 ) ) ( not ( = ?auto_123139 ?auto_123137 ) ) ( not ( = ?auto_123139 ?auto_123138 ) ) ( not ( = ?auto_123137 ?auto_123138 ) ) ( not ( = ?auto_123140 ?auto_123138 ) ) ( not ( = ?auto_123134 ?auto_123140 ) ) ( not ( = ?auto_123135 ?auto_123140 ) ) ( not ( = ?auto_123136 ?auto_123140 ) ) ( not ( = ?auto_123139 ?auto_123140 ) ) ( not ( = ?auto_123137 ?auto_123140 ) ) ( ON ?auto_123140 ?auto_123141 ) ( not ( = ?auto_123134 ?auto_123141 ) ) ( not ( = ?auto_123135 ?auto_123141 ) ) ( not ( = ?auto_123136 ?auto_123141 ) ) ( not ( = ?auto_123139 ?auto_123141 ) ) ( not ( = ?auto_123137 ?auto_123141 ) ) ( not ( = ?auto_123138 ?auto_123141 ) ) ( not ( = ?auto_123140 ?auto_123141 ) ) ( ON ?auto_123138 ?auto_123140 ) ( ON-TABLE ?auto_123141 ) ( ON ?auto_123137 ?auto_123138 ) ( ON ?auto_123139 ?auto_123137 ) ( ON ?auto_123136 ?auto_123139 ) ( ON ?auto_123135 ?auto_123136 ) ( CLEAR ?auto_123135 ) ( HOLDING ?auto_123134 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123134 )
      ( MAKE-3PILE ?auto_123134 ?auto_123135 ?auto_123136 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_123142 - BLOCK
      ?auto_123143 - BLOCK
      ?auto_123144 - BLOCK
    )
    :vars
    (
      ?auto_123149 - BLOCK
      ?auto_123145 - BLOCK
      ?auto_123147 - BLOCK
      ?auto_123148 - BLOCK
      ?auto_123146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123142 ?auto_123143 ) ) ( not ( = ?auto_123142 ?auto_123144 ) ) ( not ( = ?auto_123142 ?auto_123149 ) ) ( not ( = ?auto_123143 ?auto_123144 ) ) ( not ( = ?auto_123143 ?auto_123149 ) ) ( not ( = ?auto_123144 ?auto_123149 ) ) ( not ( = ?auto_123142 ?auto_123145 ) ) ( not ( = ?auto_123142 ?auto_123147 ) ) ( not ( = ?auto_123143 ?auto_123145 ) ) ( not ( = ?auto_123143 ?auto_123147 ) ) ( not ( = ?auto_123144 ?auto_123145 ) ) ( not ( = ?auto_123144 ?auto_123147 ) ) ( not ( = ?auto_123149 ?auto_123145 ) ) ( not ( = ?auto_123149 ?auto_123147 ) ) ( not ( = ?auto_123145 ?auto_123147 ) ) ( not ( = ?auto_123148 ?auto_123147 ) ) ( not ( = ?auto_123142 ?auto_123148 ) ) ( not ( = ?auto_123143 ?auto_123148 ) ) ( not ( = ?auto_123144 ?auto_123148 ) ) ( not ( = ?auto_123149 ?auto_123148 ) ) ( not ( = ?auto_123145 ?auto_123148 ) ) ( ON ?auto_123148 ?auto_123146 ) ( not ( = ?auto_123142 ?auto_123146 ) ) ( not ( = ?auto_123143 ?auto_123146 ) ) ( not ( = ?auto_123144 ?auto_123146 ) ) ( not ( = ?auto_123149 ?auto_123146 ) ) ( not ( = ?auto_123145 ?auto_123146 ) ) ( not ( = ?auto_123147 ?auto_123146 ) ) ( not ( = ?auto_123148 ?auto_123146 ) ) ( ON ?auto_123147 ?auto_123148 ) ( ON-TABLE ?auto_123146 ) ( ON ?auto_123145 ?auto_123147 ) ( ON ?auto_123149 ?auto_123145 ) ( ON ?auto_123144 ?auto_123149 ) ( ON ?auto_123143 ?auto_123144 ) ( ON ?auto_123142 ?auto_123143 ) ( CLEAR ?auto_123142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123146 ?auto_123148 ?auto_123147 ?auto_123145 ?auto_123149 ?auto_123144 ?auto_123143 )
      ( MAKE-3PILE ?auto_123142 ?auto_123143 ?auto_123144 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123154 - BLOCK
      ?auto_123155 - BLOCK
      ?auto_123156 - BLOCK
      ?auto_123157 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_123157 ) ( CLEAR ?auto_123156 ) ( ON-TABLE ?auto_123154 ) ( ON ?auto_123155 ?auto_123154 ) ( ON ?auto_123156 ?auto_123155 ) ( not ( = ?auto_123154 ?auto_123155 ) ) ( not ( = ?auto_123154 ?auto_123156 ) ) ( not ( = ?auto_123154 ?auto_123157 ) ) ( not ( = ?auto_123155 ?auto_123156 ) ) ( not ( = ?auto_123155 ?auto_123157 ) ) ( not ( = ?auto_123156 ?auto_123157 ) ) )
    :subtasks
    ( ( !STACK ?auto_123157 ?auto_123156 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123158 - BLOCK
      ?auto_123159 - BLOCK
      ?auto_123160 - BLOCK
      ?auto_123161 - BLOCK
    )
    :vars
    (
      ?auto_123162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_123160 ) ( ON-TABLE ?auto_123158 ) ( ON ?auto_123159 ?auto_123158 ) ( ON ?auto_123160 ?auto_123159 ) ( not ( = ?auto_123158 ?auto_123159 ) ) ( not ( = ?auto_123158 ?auto_123160 ) ) ( not ( = ?auto_123158 ?auto_123161 ) ) ( not ( = ?auto_123159 ?auto_123160 ) ) ( not ( = ?auto_123159 ?auto_123161 ) ) ( not ( = ?auto_123160 ?auto_123161 ) ) ( ON ?auto_123161 ?auto_123162 ) ( CLEAR ?auto_123161 ) ( HAND-EMPTY ) ( not ( = ?auto_123158 ?auto_123162 ) ) ( not ( = ?auto_123159 ?auto_123162 ) ) ( not ( = ?auto_123160 ?auto_123162 ) ) ( not ( = ?auto_123161 ?auto_123162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123161 ?auto_123162 )
      ( MAKE-4PILE ?auto_123158 ?auto_123159 ?auto_123160 ?auto_123161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123163 - BLOCK
      ?auto_123164 - BLOCK
      ?auto_123165 - BLOCK
      ?auto_123166 - BLOCK
    )
    :vars
    (
      ?auto_123167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123163 ) ( ON ?auto_123164 ?auto_123163 ) ( not ( = ?auto_123163 ?auto_123164 ) ) ( not ( = ?auto_123163 ?auto_123165 ) ) ( not ( = ?auto_123163 ?auto_123166 ) ) ( not ( = ?auto_123164 ?auto_123165 ) ) ( not ( = ?auto_123164 ?auto_123166 ) ) ( not ( = ?auto_123165 ?auto_123166 ) ) ( ON ?auto_123166 ?auto_123167 ) ( CLEAR ?auto_123166 ) ( not ( = ?auto_123163 ?auto_123167 ) ) ( not ( = ?auto_123164 ?auto_123167 ) ) ( not ( = ?auto_123165 ?auto_123167 ) ) ( not ( = ?auto_123166 ?auto_123167 ) ) ( HOLDING ?auto_123165 ) ( CLEAR ?auto_123164 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123163 ?auto_123164 ?auto_123165 )
      ( MAKE-4PILE ?auto_123163 ?auto_123164 ?auto_123165 ?auto_123166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123168 - BLOCK
      ?auto_123169 - BLOCK
      ?auto_123170 - BLOCK
      ?auto_123171 - BLOCK
    )
    :vars
    (
      ?auto_123172 - BLOCK
      ?auto_123173 - BLOCK
      ?auto_123174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123168 ) ( ON ?auto_123169 ?auto_123168 ) ( not ( = ?auto_123168 ?auto_123169 ) ) ( not ( = ?auto_123168 ?auto_123170 ) ) ( not ( = ?auto_123168 ?auto_123171 ) ) ( not ( = ?auto_123169 ?auto_123170 ) ) ( not ( = ?auto_123169 ?auto_123171 ) ) ( not ( = ?auto_123170 ?auto_123171 ) ) ( ON ?auto_123171 ?auto_123172 ) ( not ( = ?auto_123168 ?auto_123172 ) ) ( not ( = ?auto_123169 ?auto_123172 ) ) ( not ( = ?auto_123170 ?auto_123172 ) ) ( not ( = ?auto_123171 ?auto_123172 ) ) ( CLEAR ?auto_123169 ) ( ON ?auto_123170 ?auto_123171 ) ( CLEAR ?auto_123170 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123173 ) ( ON ?auto_123174 ?auto_123173 ) ( ON ?auto_123172 ?auto_123174 ) ( not ( = ?auto_123173 ?auto_123174 ) ) ( not ( = ?auto_123173 ?auto_123172 ) ) ( not ( = ?auto_123173 ?auto_123171 ) ) ( not ( = ?auto_123173 ?auto_123170 ) ) ( not ( = ?auto_123174 ?auto_123172 ) ) ( not ( = ?auto_123174 ?auto_123171 ) ) ( not ( = ?auto_123174 ?auto_123170 ) ) ( not ( = ?auto_123168 ?auto_123173 ) ) ( not ( = ?auto_123168 ?auto_123174 ) ) ( not ( = ?auto_123169 ?auto_123173 ) ) ( not ( = ?auto_123169 ?auto_123174 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123173 ?auto_123174 ?auto_123172 ?auto_123171 )
      ( MAKE-4PILE ?auto_123168 ?auto_123169 ?auto_123170 ?auto_123171 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123175 - BLOCK
      ?auto_123176 - BLOCK
      ?auto_123177 - BLOCK
      ?auto_123178 - BLOCK
    )
    :vars
    (
      ?auto_123179 - BLOCK
      ?auto_123181 - BLOCK
      ?auto_123180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123175 ) ( not ( = ?auto_123175 ?auto_123176 ) ) ( not ( = ?auto_123175 ?auto_123177 ) ) ( not ( = ?auto_123175 ?auto_123178 ) ) ( not ( = ?auto_123176 ?auto_123177 ) ) ( not ( = ?auto_123176 ?auto_123178 ) ) ( not ( = ?auto_123177 ?auto_123178 ) ) ( ON ?auto_123178 ?auto_123179 ) ( not ( = ?auto_123175 ?auto_123179 ) ) ( not ( = ?auto_123176 ?auto_123179 ) ) ( not ( = ?auto_123177 ?auto_123179 ) ) ( not ( = ?auto_123178 ?auto_123179 ) ) ( ON ?auto_123177 ?auto_123178 ) ( CLEAR ?auto_123177 ) ( ON-TABLE ?auto_123181 ) ( ON ?auto_123180 ?auto_123181 ) ( ON ?auto_123179 ?auto_123180 ) ( not ( = ?auto_123181 ?auto_123180 ) ) ( not ( = ?auto_123181 ?auto_123179 ) ) ( not ( = ?auto_123181 ?auto_123178 ) ) ( not ( = ?auto_123181 ?auto_123177 ) ) ( not ( = ?auto_123180 ?auto_123179 ) ) ( not ( = ?auto_123180 ?auto_123178 ) ) ( not ( = ?auto_123180 ?auto_123177 ) ) ( not ( = ?auto_123175 ?auto_123181 ) ) ( not ( = ?auto_123175 ?auto_123180 ) ) ( not ( = ?auto_123176 ?auto_123181 ) ) ( not ( = ?auto_123176 ?auto_123180 ) ) ( HOLDING ?auto_123176 ) ( CLEAR ?auto_123175 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123175 ?auto_123176 )
      ( MAKE-4PILE ?auto_123175 ?auto_123176 ?auto_123177 ?auto_123178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123182 - BLOCK
      ?auto_123183 - BLOCK
      ?auto_123184 - BLOCK
      ?auto_123185 - BLOCK
    )
    :vars
    (
      ?auto_123187 - BLOCK
      ?auto_123188 - BLOCK
      ?auto_123186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123182 ) ( not ( = ?auto_123182 ?auto_123183 ) ) ( not ( = ?auto_123182 ?auto_123184 ) ) ( not ( = ?auto_123182 ?auto_123185 ) ) ( not ( = ?auto_123183 ?auto_123184 ) ) ( not ( = ?auto_123183 ?auto_123185 ) ) ( not ( = ?auto_123184 ?auto_123185 ) ) ( ON ?auto_123185 ?auto_123187 ) ( not ( = ?auto_123182 ?auto_123187 ) ) ( not ( = ?auto_123183 ?auto_123187 ) ) ( not ( = ?auto_123184 ?auto_123187 ) ) ( not ( = ?auto_123185 ?auto_123187 ) ) ( ON ?auto_123184 ?auto_123185 ) ( ON-TABLE ?auto_123188 ) ( ON ?auto_123186 ?auto_123188 ) ( ON ?auto_123187 ?auto_123186 ) ( not ( = ?auto_123188 ?auto_123186 ) ) ( not ( = ?auto_123188 ?auto_123187 ) ) ( not ( = ?auto_123188 ?auto_123185 ) ) ( not ( = ?auto_123188 ?auto_123184 ) ) ( not ( = ?auto_123186 ?auto_123187 ) ) ( not ( = ?auto_123186 ?auto_123185 ) ) ( not ( = ?auto_123186 ?auto_123184 ) ) ( not ( = ?auto_123182 ?auto_123188 ) ) ( not ( = ?auto_123182 ?auto_123186 ) ) ( not ( = ?auto_123183 ?auto_123188 ) ) ( not ( = ?auto_123183 ?auto_123186 ) ) ( CLEAR ?auto_123182 ) ( ON ?auto_123183 ?auto_123184 ) ( CLEAR ?auto_123183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123188 ?auto_123186 ?auto_123187 ?auto_123185 ?auto_123184 )
      ( MAKE-4PILE ?auto_123182 ?auto_123183 ?auto_123184 ?auto_123185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123189 - BLOCK
      ?auto_123190 - BLOCK
      ?auto_123191 - BLOCK
      ?auto_123192 - BLOCK
    )
    :vars
    (
      ?auto_123193 - BLOCK
      ?auto_123195 - BLOCK
      ?auto_123194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123189 ?auto_123190 ) ) ( not ( = ?auto_123189 ?auto_123191 ) ) ( not ( = ?auto_123189 ?auto_123192 ) ) ( not ( = ?auto_123190 ?auto_123191 ) ) ( not ( = ?auto_123190 ?auto_123192 ) ) ( not ( = ?auto_123191 ?auto_123192 ) ) ( ON ?auto_123192 ?auto_123193 ) ( not ( = ?auto_123189 ?auto_123193 ) ) ( not ( = ?auto_123190 ?auto_123193 ) ) ( not ( = ?auto_123191 ?auto_123193 ) ) ( not ( = ?auto_123192 ?auto_123193 ) ) ( ON ?auto_123191 ?auto_123192 ) ( ON-TABLE ?auto_123195 ) ( ON ?auto_123194 ?auto_123195 ) ( ON ?auto_123193 ?auto_123194 ) ( not ( = ?auto_123195 ?auto_123194 ) ) ( not ( = ?auto_123195 ?auto_123193 ) ) ( not ( = ?auto_123195 ?auto_123192 ) ) ( not ( = ?auto_123195 ?auto_123191 ) ) ( not ( = ?auto_123194 ?auto_123193 ) ) ( not ( = ?auto_123194 ?auto_123192 ) ) ( not ( = ?auto_123194 ?auto_123191 ) ) ( not ( = ?auto_123189 ?auto_123195 ) ) ( not ( = ?auto_123189 ?auto_123194 ) ) ( not ( = ?auto_123190 ?auto_123195 ) ) ( not ( = ?auto_123190 ?auto_123194 ) ) ( ON ?auto_123190 ?auto_123191 ) ( CLEAR ?auto_123190 ) ( HOLDING ?auto_123189 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123189 )
      ( MAKE-4PILE ?auto_123189 ?auto_123190 ?auto_123191 ?auto_123192 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123196 - BLOCK
      ?auto_123197 - BLOCK
      ?auto_123198 - BLOCK
      ?auto_123199 - BLOCK
    )
    :vars
    (
      ?auto_123200 - BLOCK
      ?auto_123202 - BLOCK
      ?auto_123201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123196 ?auto_123197 ) ) ( not ( = ?auto_123196 ?auto_123198 ) ) ( not ( = ?auto_123196 ?auto_123199 ) ) ( not ( = ?auto_123197 ?auto_123198 ) ) ( not ( = ?auto_123197 ?auto_123199 ) ) ( not ( = ?auto_123198 ?auto_123199 ) ) ( ON ?auto_123199 ?auto_123200 ) ( not ( = ?auto_123196 ?auto_123200 ) ) ( not ( = ?auto_123197 ?auto_123200 ) ) ( not ( = ?auto_123198 ?auto_123200 ) ) ( not ( = ?auto_123199 ?auto_123200 ) ) ( ON ?auto_123198 ?auto_123199 ) ( ON-TABLE ?auto_123202 ) ( ON ?auto_123201 ?auto_123202 ) ( ON ?auto_123200 ?auto_123201 ) ( not ( = ?auto_123202 ?auto_123201 ) ) ( not ( = ?auto_123202 ?auto_123200 ) ) ( not ( = ?auto_123202 ?auto_123199 ) ) ( not ( = ?auto_123202 ?auto_123198 ) ) ( not ( = ?auto_123201 ?auto_123200 ) ) ( not ( = ?auto_123201 ?auto_123199 ) ) ( not ( = ?auto_123201 ?auto_123198 ) ) ( not ( = ?auto_123196 ?auto_123202 ) ) ( not ( = ?auto_123196 ?auto_123201 ) ) ( not ( = ?auto_123197 ?auto_123202 ) ) ( not ( = ?auto_123197 ?auto_123201 ) ) ( ON ?auto_123197 ?auto_123198 ) ( ON ?auto_123196 ?auto_123197 ) ( CLEAR ?auto_123196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123202 ?auto_123201 ?auto_123200 ?auto_123199 ?auto_123198 ?auto_123197 )
      ( MAKE-4PILE ?auto_123196 ?auto_123197 ?auto_123198 ?auto_123199 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123203 - BLOCK
      ?auto_123204 - BLOCK
      ?auto_123205 - BLOCK
      ?auto_123206 - BLOCK
    )
    :vars
    (
      ?auto_123207 - BLOCK
      ?auto_123208 - BLOCK
      ?auto_123209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123203 ?auto_123204 ) ) ( not ( = ?auto_123203 ?auto_123205 ) ) ( not ( = ?auto_123203 ?auto_123206 ) ) ( not ( = ?auto_123204 ?auto_123205 ) ) ( not ( = ?auto_123204 ?auto_123206 ) ) ( not ( = ?auto_123205 ?auto_123206 ) ) ( ON ?auto_123206 ?auto_123207 ) ( not ( = ?auto_123203 ?auto_123207 ) ) ( not ( = ?auto_123204 ?auto_123207 ) ) ( not ( = ?auto_123205 ?auto_123207 ) ) ( not ( = ?auto_123206 ?auto_123207 ) ) ( ON ?auto_123205 ?auto_123206 ) ( ON-TABLE ?auto_123208 ) ( ON ?auto_123209 ?auto_123208 ) ( ON ?auto_123207 ?auto_123209 ) ( not ( = ?auto_123208 ?auto_123209 ) ) ( not ( = ?auto_123208 ?auto_123207 ) ) ( not ( = ?auto_123208 ?auto_123206 ) ) ( not ( = ?auto_123208 ?auto_123205 ) ) ( not ( = ?auto_123209 ?auto_123207 ) ) ( not ( = ?auto_123209 ?auto_123206 ) ) ( not ( = ?auto_123209 ?auto_123205 ) ) ( not ( = ?auto_123203 ?auto_123208 ) ) ( not ( = ?auto_123203 ?auto_123209 ) ) ( not ( = ?auto_123204 ?auto_123208 ) ) ( not ( = ?auto_123204 ?auto_123209 ) ) ( ON ?auto_123204 ?auto_123205 ) ( HOLDING ?auto_123203 ) ( CLEAR ?auto_123204 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123208 ?auto_123209 ?auto_123207 ?auto_123206 ?auto_123205 ?auto_123204 ?auto_123203 )
      ( MAKE-4PILE ?auto_123203 ?auto_123204 ?auto_123205 ?auto_123206 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123210 - BLOCK
      ?auto_123211 - BLOCK
      ?auto_123212 - BLOCK
      ?auto_123213 - BLOCK
    )
    :vars
    (
      ?auto_123215 - BLOCK
      ?auto_123214 - BLOCK
      ?auto_123216 - BLOCK
      ?auto_123217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123210 ?auto_123211 ) ) ( not ( = ?auto_123210 ?auto_123212 ) ) ( not ( = ?auto_123210 ?auto_123213 ) ) ( not ( = ?auto_123211 ?auto_123212 ) ) ( not ( = ?auto_123211 ?auto_123213 ) ) ( not ( = ?auto_123212 ?auto_123213 ) ) ( ON ?auto_123213 ?auto_123215 ) ( not ( = ?auto_123210 ?auto_123215 ) ) ( not ( = ?auto_123211 ?auto_123215 ) ) ( not ( = ?auto_123212 ?auto_123215 ) ) ( not ( = ?auto_123213 ?auto_123215 ) ) ( ON ?auto_123212 ?auto_123213 ) ( ON-TABLE ?auto_123214 ) ( ON ?auto_123216 ?auto_123214 ) ( ON ?auto_123215 ?auto_123216 ) ( not ( = ?auto_123214 ?auto_123216 ) ) ( not ( = ?auto_123214 ?auto_123215 ) ) ( not ( = ?auto_123214 ?auto_123213 ) ) ( not ( = ?auto_123214 ?auto_123212 ) ) ( not ( = ?auto_123216 ?auto_123215 ) ) ( not ( = ?auto_123216 ?auto_123213 ) ) ( not ( = ?auto_123216 ?auto_123212 ) ) ( not ( = ?auto_123210 ?auto_123214 ) ) ( not ( = ?auto_123210 ?auto_123216 ) ) ( not ( = ?auto_123211 ?auto_123214 ) ) ( not ( = ?auto_123211 ?auto_123216 ) ) ( ON ?auto_123211 ?auto_123212 ) ( CLEAR ?auto_123211 ) ( ON ?auto_123210 ?auto_123217 ) ( CLEAR ?auto_123210 ) ( HAND-EMPTY ) ( not ( = ?auto_123210 ?auto_123217 ) ) ( not ( = ?auto_123211 ?auto_123217 ) ) ( not ( = ?auto_123212 ?auto_123217 ) ) ( not ( = ?auto_123213 ?auto_123217 ) ) ( not ( = ?auto_123215 ?auto_123217 ) ) ( not ( = ?auto_123214 ?auto_123217 ) ) ( not ( = ?auto_123216 ?auto_123217 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123210 ?auto_123217 )
      ( MAKE-4PILE ?auto_123210 ?auto_123211 ?auto_123212 ?auto_123213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123218 - BLOCK
      ?auto_123219 - BLOCK
      ?auto_123220 - BLOCK
      ?auto_123221 - BLOCK
    )
    :vars
    (
      ?auto_123222 - BLOCK
      ?auto_123225 - BLOCK
      ?auto_123224 - BLOCK
      ?auto_123223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123218 ?auto_123219 ) ) ( not ( = ?auto_123218 ?auto_123220 ) ) ( not ( = ?auto_123218 ?auto_123221 ) ) ( not ( = ?auto_123219 ?auto_123220 ) ) ( not ( = ?auto_123219 ?auto_123221 ) ) ( not ( = ?auto_123220 ?auto_123221 ) ) ( ON ?auto_123221 ?auto_123222 ) ( not ( = ?auto_123218 ?auto_123222 ) ) ( not ( = ?auto_123219 ?auto_123222 ) ) ( not ( = ?auto_123220 ?auto_123222 ) ) ( not ( = ?auto_123221 ?auto_123222 ) ) ( ON ?auto_123220 ?auto_123221 ) ( ON-TABLE ?auto_123225 ) ( ON ?auto_123224 ?auto_123225 ) ( ON ?auto_123222 ?auto_123224 ) ( not ( = ?auto_123225 ?auto_123224 ) ) ( not ( = ?auto_123225 ?auto_123222 ) ) ( not ( = ?auto_123225 ?auto_123221 ) ) ( not ( = ?auto_123225 ?auto_123220 ) ) ( not ( = ?auto_123224 ?auto_123222 ) ) ( not ( = ?auto_123224 ?auto_123221 ) ) ( not ( = ?auto_123224 ?auto_123220 ) ) ( not ( = ?auto_123218 ?auto_123225 ) ) ( not ( = ?auto_123218 ?auto_123224 ) ) ( not ( = ?auto_123219 ?auto_123225 ) ) ( not ( = ?auto_123219 ?auto_123224 ) ) ( ON ?auto_123218 ?auto_123223 ) ( CLEAR ?auto_123218 ) ( not ( = ?auto_123218 ?auto_123223 ) ) ( not ( = ?auto_123219 ?auto_123223 ) ) ( not ( = ?auto_123220 ?auto_123223 ) ) ( not ( = ?auto_123221 ?auto_123223 ) ) ( not ( = ?auto_123222 ?auto_123223 ) ) ( not ( = ?auto_123225 ?auto_123223 ) ) ( not ( = ?auto_123224 ?auto_123223 ) ) ( HOLDING ?auto_123219 ) ( CLEAR ?auto_123220 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123225 ?auto_123224 ?auto_123222 ?auto_123221 ?auto_123220 ?auto_123219 )
      ( MAKE-4PILE ?auto_123218 ?auto_123219 ?auto_123220 ?auto_123221 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123226 - BLOCK
      ?auto_123227 - BLOCK
      ?auto_123228 - BLOCK
      ?auto_123229 - BLOCK
    )
    :vars
    (
      ?auto_123233 - BLOCK
      ?auto_123230 - BLOCK
      ?auto_123231 - BLOCK
      ?auto_123232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123226 ?auto_123227 ) ) ( not ( = ?auto_123226 ?auto_123228 ) ) ( not ( = ?auto_123226 ?auto_123229 ) ) ( not ( = ?auto_123227 ?auto_123228 ) ) ( not ( = ?auto_123227 ?auto_123229 ) ) ( not ( = ?auto_123228 ?auto_123229 ) ) ( ON ?auto_123229 ?auto_123233 ) ( not ( = ?auto_123226 ?auto_123233 ) ) ( not ( = ?auto_123227 ?auto_123233 ) ) ( not ( = ?auto_123228 ?auto_123233 ) ) ( not ( = ?auto_123229 ?auto_123233 ) ) ( ON ?auto_123228 ?auto_123229 ) ( ON-TABLE ?auto_123230 ) ( ON ?auto_123231 ?auto_123230 ) ( ON ?auto_123233 ?auto_123231 ) ( not ( = ?auto_123230 ?auto_123231 ) ) ( not ( = ?auto_123230 ?auto_123233 ) ) ( not ( = ?auto_123230 ?auto_123229 ) ) ( not ( = ?auto_123230 ?auto_123228 ) ) ( not ( = ?auto_123231 ?auto_123233 ) ) ( not ( = ?auto_123231 ?auto_123229 ) ) ( not ( = ?auto_123231 ?auto_123228 ) ) ( not ( = ?auto_123226 ?auto_123230 ) ) ( not ( = ?auto_123226 ?auto_123231 ) ) ( not ( = ?auto_123227 ?auto_123230 ) ) ( not ( = ?auto_123227 ?auto_123231 ) ) ( ON ?auto_123226 ?auto_123232 ) ( not ( = ?auto_123226 ?auto_123232 ) ) ( not ( = ?auto_123227 ?auto_123232 ) ) ( not ( = ?auto_123228 ?auto_123232 ) ) ( not ( = ?auto_123229 ?auto_123232 ) ) ( not ( = ?auto_123233 ?auto_123232 ) ) ( not ( = ?auto_123230 ?auto_123232 ) ) ( not ( = ?auto_123231 ?auto_123232 ) ) ( CLEAR ?auto_123228 ) ( ON ?auto_123227 ?auto_123226 ) ( CLEAR ?auto_123227 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123232 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123232 ?auto_123226 )
      ( MAKE-4PILE ?auto_123226 ?auto_123227 ?auto_123228 ?auto_123229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123234 - BLOCK
      ?auto_123235 - BLOCK
      ?auto_123236 - BLOCK
      ?auto_123237 - BLOCK
    )
    :vars
    (
      ?auto_123239 - BLOCK
      ?auto_123241 - BLOCK
      ?auto_123240 - BLOCK
      ?auto_123238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123234 ?auto_123235 ) ) ( not ( = ?auto_123234 ?auto_123236 ) ) ( not ( = ?auto_123234 ?auto_123237 ) ) ( not ( = ?auto_123235 ?auto_123236 ) ) ( not ( = ?auto_123235 ?auto_123237 ) ) ( not ( = ?auto_123236 ?auto_123237 ) ) ( ON ?auto_123237 ?auto_123239 ) ( not ( = ?auto_123234 ?auto_123239 ) ) ( not ( = ?auto_123235 ?auto_123239 ) ) ( not ( = ?auto_123236 ?auto_123239 ) ) ( not ( = ?auto_123237 ?auto_123239 ) ) ( ON-TABLE ?auto_123241 ) ( ON ?auto_123240 ?auto_123241 ) ( ON ?auto_123239 ?auto_123240 ) ( not ( = ?auto_123241 ?auto_123240 ) ) ( not ( = ?auto_123241 ?auto_123239 ) ) ( not ( = ?auto_123241 ?auto_123237 ) ) ( not ( = ?auto_123241 ?auto_123236 ) ) ( not ( = ?auto_123240 ?auto_123239 ) ) ( not ( = ?auto_123240 ?auto_123237 ) ) ( not ( = ?auto_123240 ?auto_123236 ) ) ( not ( = ?auto_123234 ?auto_123241 ) ) ( not ( = ?auto_123234 ?auto_123240 ) ) ( not ( = ?auto_123235 ?auto_123241 ) ) ( not ( = ?auto_123235 ?auto_123240 ) ) ( ON ?auto_123234 ?auto_123238 ) ( not ( = ?auto_123234 ?auto_123238 ) ) ( not ( = ?auto_123235 ?auto_123238 ) ) ( not ( = ?auto_123236 ?auto_123238 ) ) ( not ( = ?auto_123237 ?auto_123238 ) ) ( not ( = ?auto_123239 ?auto_123238 ) ) ( not ( = ?auto_123241 ?auto_123238 ) ) ( not ( = ?auto_123240 ?auto_123238 ) ) ( ON ?auto_123235 ?auto_123234 ) ( CLEAR ?auto_123235 ) ( ON-TABLE ?auto_123238 ) ( HOLDING ?auto_123236 ) ( CLEAR ?auto_123237 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123241 ?auto_123240 ?auto_123239 ?auto_123237 ?auto_123236 )
      ( MAKE-4PILE ?auto_123234 ?auto_123235 ?auto_123236 ?auto_123237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123242 - BLOCK
      ?auto_123243 - BLOCK
      ?auto_123244 - BLOCK
      ?auto_123245 - BLOCK
    )
    :vars
    (
      ?auto_123246 - BLOCK
      ?auto_123248 - BLOCK
      ?auto_123247 - BLOCK
      ?auto_123249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123242 ?auto_123243 ) ) ( not ( = ?auto_123242 ?auto_123244 ) ) ( not ( = ?auto_123242 ?auto_123245 ) ) ( not ( = ?auto_123243 ?auto_123244 ) ) ( not ( = ?auto_123243 ?auto_123245 ) ) ( not ( = ?auto_123244 ?auto_123245 ) ) ( ON ?auto_123245 ?auto_123246 ) ( not ( = ?auto_123242 ?auto_123246 ) ) ( not ( = ?auto_123243 ?auto_123246 ) ) ( not ( = ?auto_123244 ?auto_123246 ) ) ( not ( = ?auto_123245 ?auto_123246 ) ) ( ON-TABLE ?auto_123248 ) ( ON ?auto_123247 ?auto_123248 ) ( ON ?auto_123246 ?auto_123247 ) ( not ( = ?auto_123248 ?auto_123247 ) ) ( not ( = ?auto_123248 ?auto_123246 ) ) ( not ( = ?auto_123248 ?auto_123245 ) ) ( not ( = ?auto_123248 ?auto_123244 ) ) ( not ( = ?auto_123247 ?auto_123246 ) ) ( not ( = ?auto_123247 ?auto_123245 ) ) ( not ( = ?auto_123247 ?auto_123244 ) ) ( not ( = ?auto_123242 ?auto_123248 ) ) ( not ( = ?auto_123242 ?auto_123247 ) ) ( not ( = ?auto_123243 ?auto_123248 ) ) ( not ( = ?auto_123243 ?auto_123247 ) ) ( ON ?auto_123242 ?auto_123249 ) ( not ( = ?auto_123242 ?auto_123249 ) ) ( not ( = ?auto_123243 ?auto_123249 ) ) ( not ( = ?auto_123244 ?auto_123249 ) ) ( not ( = ?auto_123245 ?auto_123249 ) ) ( not ( = ?auto_123246 ?auto_123249 ) ) ( not ( = ?auto_123248 ?auto_123249 ) ) ( not ( = ?auto_123247 ?auto_123249 ) ) ( ON ?auto_123243 ?auto_123242 ) ( ON-TABLE ?auto_123249 ) ( CLEAR ?auto_123245 ) ( ON ?auto_123244 ?auto_123243 ) ( CLEAR ?auto_123244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123249 ?auto_123242 ?auto_123243 )
      ( MAKE-4PILE ?auto_123242 ?auto_123243 ?auto_123244 ?auto_123245 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123250 - BLOCK
      ?auto_123251 - BLOCK
      ?auto_123252 - BLOCK
      ?auto_123253 - BLOCK
    )
    :vars
    (
      ?auto_123254 - BLOCK
      ?auto_123257 - BLOCK
      ?auto_123255 - BLOCK
      ?auto_123256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123250 ?auto_123251 ) ) ( not ( = ?auto_123250 ?auto_123252 ) ) ( not ( = ?auto_123250 ?auto_123253 ) ) ( not ( = ?auto_123251 ?auto_123252 ) ) ( not ( = ?auto_123251 ?auto_123253 ) ) ( not ( = ?auto_123252 ?auto_123253 ) ) ( not ( = ?auto_123250 ?auto_123254 ) ) ( not ( = ?auto_123251 ?auto_123254 ) ) ( not ( = ?auto_123252 ?auto_123254 ) ) ( not ( = ?auto_123253 ?auto_123254 ) ) ( ON-TABLE ?auto_123257 ) ( ON ?auto_123255 ?auto_123257 ) ( ON ?auto_123254 ?auto_123255 ) ( not ( = ?auto_123257 ?auto_123255 ) ) ( not ( = ?auto_123257 ?auto_123254 ) ) ( not ( = ?auto_123257 ?auto_123253 ) ) ( not ( = ?auto_123257 ?auto_123252 ) ) ( not ( = ?auto_123255 ?auto_123254 ) ) ( not ( = ?auto_123255 ?auto_123253 ) ) ( not ( = ?auto_123255 ?auto_123252 ) ) ( not ( = ?auto_123250 ?auto_123257 ) ) ( not ( = ?auto_123250 ?auto_123255 ) ) ( not ( = ?auto_123251 ?auto_123257 ) ) ( not ( = ?auto_123251 ?auto_123255 ) ) ( ON ?auto_123250 ?auto_123256 ) ( not ( = ?auto_123250 ?auto_123256 ) ) ( not ( = ?auto_123251 ?auto_123256 ) ) ( not ( = ?auto_123252 ?auto_123256 ) ) ( not ( = ?auto_123253 ?auto_123256 ) ) ( not ( = ?auto_123254 ?auto_123256 ) ) ( not ( = ?auto_123257 ?auto_123256 ) ) ( not ( = ?auto_123255 ?auto_123256 ) ) ( ON ?auto_123251 ?auto_123250 ) ( ON-TABLE ?auto_123256 ) ( ON ?auto_123252 ?auto_123251 ) ( CLEAR ?auto_123252 ) ( HOLDING ?auto_123253 ) ( CLEAR ?auto_123254 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123257 ?auto_123255 ?auto_123254 ?auto_123253 )
      ( MAKE-4PILE ?auto_123250 ?auto_123251 ?auto_123252 ?auto_123253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123258 - BLOCK
      ?auto_123259 - BLOCK
      ?auto_123260 - BLOCK
      ?auto_123261 - BLOCK
    )
    :vars
    (
      ?auto_123265 - BLOCK
      ?auto_123262 - BLOCK
      ?auto_123264 - BLOCK
      ?auto_123263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123258 ?auto_123259 ) ) ( not ( = ?auto_123258 ?auto_123260 ) ) ( not ( = ?auto_123258 ?auto_123261 ) ) ( not ( = ?auto_123259 ?auto_123260 ) ) ( not ( = ?auto_123259 ?auto_123261 ) ) ( not ( = ?auto_123260 ?auto_123261 ) ) ( not ( = ?auto_123258 ?auto_123265 ) ) ( not ( = ?auto_123259 ?auto_123265 ) ) ( not ( = ?auto_123260 ?auto_123265 ) ) ( not ( = ?auto_123261 ?auto_123265 ) ) ( ON-TABLE ?auto_123262 ) ( ON ?auto_123264 ?auto_123262 ) ( ON ?auto_123265 ?auto_123264 ) ( not ( = ?auto_123262 ?auto_123264 ) ) ( not ( = ?auto_123262 ?auto_123265 ) ) ( not ( = ?auto_123262 ?auto_123261 ) ) ( not ( = ?auto_123262 ?auto_123260 ) ) ( not ( = ?auto_123264 ?auto_123265 ) ) ( not ( = ?auto_123264 ?auto_123261 ) ) ( not ( = ?auto_123264 ?auto_123260 ) ) ( not ( = ?auto_123258 ?auto_123262 ) ) ( not ( = ?auto_123258 ?auto_123264 ) ) ( not ( = ?auto_123259 ?auto_123262 ) ) ( not ( = ?auto_123259 ?auto_123264 ) ) ( ON ?auto_123258 ?auto_123263 ) ( not ( = ?auto_123258 ?auto_123263 ) ) ( not ( = ?auto_123259 ?auto_123263 ) ) ( not ( = ?auto_123260 ?auto_123263 ) ) ( not ( = ?auto_123261 ?auto_123263 ) ) ( not ( = ?auto_123265 ?auto_123263 ) ) ( not ( = ?auto_123262 ?auto_123263 ) ) ( not ( = ?auto_123264 ?auto_123263 ) ) ( ON ?auto_123259 ?auto_123258 ) ( ON-TABLE ?auto_123263 ) ( ON ?auto_123260 ?auto_123259 ) ( CLEAR ?auto_123265 ) ( ON ?auto_123261 ?auto_123260 ) ( CLEAR ?auto_123261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123263 ?auto_123258 ?auto_123259 ?auto_123260 )
      ( MAKE-4PILE ?auto_123258 ?auto_123259 ?auto_123260 ?auto_123261 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123266 - BLOCK
      ?auto_123267 - BLOCK
      ?auto_123268 - BLOCK
      ?auto_123269 - BLOCK
    )
    :vars
    (
      ?auto_123273 - BLOCK
      ?auto_123270 - BLOCK
      ?auto_123271 - BLOCK
      ?auto_123272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123266 ?auto_123267 ) ) ( not ( = ?auto_123266 ?auto_123268 ) ) ( not ( = ?auto_123266 ?auto_123269 ) ) ( not ( = ?auto_123267 ?auto_123268 ) ) ( not ( = ?auto_123267 ?auto_123269 ) ) ( not ( = ?auto_123268 ?auto_123269 ) ) ( not ( = ?auto_123266 ?auto_123273 ) ) ( not ( = ?auto_123267 ?auto_123273 ) ) ( not ( = ?auto_123268 ?auto_123273 ) ) ( not ( = ?auto_123269 ?auto_123273 ) ) ( ON-TABLE ?auto_123270 ) ( ON ?auto_123271 ?auto_123270 ) ( not ( = ?auto_123270 ?auto_123271 ) ) ( not ( = ?auto_123270 ?auto_123273 ) ) ( not ( = ?auto_123270 ?auto_123269 ) ) ( not ( = ?auto_123270 ?auto_123268 ) ) ( not ( = ?auto_123271 ?auto_123273 ) ) ( not ( = ?auto_123271 ?auto_123269 ) ) ( not ( = ?auto_123271 ?auto_123268 ) ) ( not ( = ?auto_123266 ?auto_123270 ) ) ( not ( = ?auto_123266 ?auto_123271 ) ) ( not ( = ?auto_123267 ?auto_123270 ) ) ( not ( = ?auto_123267 ?auto_123271 ) ) ( ON ?auto_123266 ?auto_123272 ) ( not ( = ?auto_123266 ?auto_123272 ) ) ( not ( = ?auto_123267 ?auto_123272 ) ) ( not ( = ?auto_123268 ?auto_123272 ) ) ( not ( = ?auto_123269 ?auto_123272 ) ) ( not ( = ?auto_123273 ?auto_123272 ) ) ( not ( = ?auto_123270 ?auto_123272 ) ) ( not ( = ?auto_123271 ?auto_123272 ) ) ( ON ?auto_123267 ?auto_123266 ) ( ON-TABLE ?auto_123272 ) ( ON ?auto_123268 ?auto_123267 ) ( ON ?auto_123269 ?auto_123268 ) ( CLEAR ?auto_123269 ) ( HOLDING ?auto_123273 ) ( CLEAR ?auto_123271 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123270 ?auto_123271 ?auto_123273 )
      ( MAKE-4PILE ?auto_123266 ?auto_123267 ?auto_123268 ?auto_123269 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123274 - BLOCK
      ?auto_123275 - BLOCK
      ?auto_123276 - BLOCK
      ?auto_123277 - BLOCK
    )
    :vars
    (
      ?auto_123280 - BLOCK
      ?auto_123281 - BLOCK
      ?auto_123279 - BLOCK
      ?auto_123278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123274 ?auto_123275 ) ) ( not ( = ?auto_123274 ?auto_123276 ) ) ( not ( = ?auto_123274 ?auto_123277 ) ) ( not ( = ?auto_123275 ?auto_123276 ) ) ( not ( = ?auto_123275 ?auto_123277 ) ) ( not ( = ?auto_123276 ?auto_123277 ) ) ( not ( = ?auto_123274 ?auto_123280 ) ) ( not ( = ?auto_123275 ?auto_123280 ) ) ( not ( = ?auto_123276 ?auto_123280 ) ) ( not ( = ?auto_123277 ?auto_123280 ) ) ( ON-TABLE ?auto_123281 ) ( ON ?auto_123279 ?auto_123281 ) ( not ( = ?auto_123281 ?auto_123279 ) ) ( not ( = ?auto_123281 ?auto_123280 ) ) ( not ( = ?auto_123281 ?auto_123277 ) ) ( not ( = ?auto_123281 ?auto_123276 ) ) ( not ( = ?auto_123279 ?auto_123280 ) ) ( not ( = ?auto_123279 ?auto_123277 ) ) ( not ( = ?auto_123279 ?auto_123276 ) ) ( not ( = ?auto_123274 ?auto_123281 ) ) ( not ( = ?auto_123274 ?auto_123279 ) ) ( not ( = ?auto_123275 ?auto_123281 ) ) ( not ( = ?auto_123275 ?auto_123279 ) ) ( ON ?auto_123274 ?auto_123278 ) ( not ( = ?auto_123274 ?auto_123278 ) ) ( not ( = ?auto_123275 ?auto_123278 ) ) ( not ( = ?auto_123276 ?auto_123278 ) ) ( not ( = ?auto_123277 ?auto_123278 ) ) ( not ( = ?auto_123280 ?auto_123278 ) ) ( not ( = ?auto_123281 ?auto_123278 ) ) ( not ( = ?auto_123279 ?auto_123278 ) ) ( ON ?auto_123275 ?auto_123274 ) ( ON-TABLE ?auto_123278 ) ( ON ?auto_123276 ?auto_123275 ) ( ON ?auto_123277 ?auto_123276 ) ( CLEAR ?auto_123279 ) ( ON ?auto_123280 ?auto_123277 ) ( CLEAR ?auto_123280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123278 ?auto_123274 ?auto_123275 ?auto_123276 ?auto_123277 )
      ( MAKE-4PILE ?auto_123274 ?auto_123275 ?auto_123276 ?auto_123277 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123282 - BLOCK
      ?auto_123283 - BLOCK
      ?auto_123284 - BLOCK
      ?auto_123285 - BLOCK
    )
    :vars
    (
      ?auto_123288 - BLOCK
      ?auto_123287 - BLOCK
      ?auto_123289 - BLOCK
      ?auto_123286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123282 ?auto_123283 ) ) ( not ( = ?auto_123282 ?auto_123284 ) ) ( not ( = ?auto_123282 ?auto_123285 ) ) ( not ( = ?auto_123283 ?auto_123284 ) ) ( not ( = ?auto_123283 ?auto_123285 ) ) ( not ( = ?auto_123284 ?auto_123285 ) ) ( not ( = ?auto_123282 ?auto_123288 ) ) ( not ( = ?auto_123283 ?auto_123288 ) ) ( not ( = ?auto_123284 ?auto_123288 ) ) ( not ( = ?auto_123285 ?auto_123288 ) ) ( ON-TABLE ?auto_123287 ) ( not ( = ?auto_123287 ?auto_123289 ) ) ( not ( = ?auto_123287 ?auto_123288 ) ) ( not ( = ?auto_123287 ?auto_123285 ) ) ( not ( = ?auto_123287 ?auto_123284 ) ) ( not ( = ?auto_123289 ?auto_123288 ) ) ( not ( = ?auto_123289 ?auto_123285 ) ) ( not ( = ?auto_123289 ?auto_123284 ) ) ( not ( = ?auto_123282 ?auto_123287 ) ) ( not ( = ?auto_123282 ?auto_123289 ) ) ( not ( = ?auto_123283 ?auto_123287 ) ) ( not ( = ?auto_123283 ?auto_123289 ) ) ( ON ?auto_123282 ?auto_123286 ) ( not ( = ?auto_123282 ?auto_123286 ) ) ( not ( = ?auto_123283 ?auto_123286 ) ) ( not ( = ?auto_123284 ?auto_123286 ) ) ( not ( = ?auto_123285 ?auto_123286 ) ) ( not ( = ?auto_123288 ?auto_123286 ) ) ( not ( = ?auto_123287 ?auto_123286 ) ) ( not ( = ?auto_123289 ?auto_123286 ) ) ( ON ?auto_123283 ?auto_123282 ) ( ON-TABLE ?auto_123286 ) ( ON ?auto_123284 ?auto_123283 ) ( ON ?auto_123285 ?auto_123284 ) ( ON ?auto_123288 ?auto_123285 ) ( CLEAR ?auto_123288 ) ( HOLDING ?auto_123289 ) ( CLEAR ?auto_123287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123287 ?auto_123289 )
      ( MAKE-4PILE ?auto_123282 ?auto_123283 ?auto_123284 ?auto_123285 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123290 - BLOCK
      ?auto_123291 - BLOCK
      ?auto_123292 - BLOCK
      ?auto_123293 - BLOCK
    )
    :vars
    (
      ?auto_123296 - BLOCK
      ?auto_123294 - BLOCK
      ?auto_123295 - BLOCK
      ?auto_123297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123290 ?auto_123291 ) ) ( not ( = ?auto_123290 ?auto_123292 ) ) ( not ( = ?auto_123290 ?auto_123293 ) ) ( not ( = ?auto_123291 ?auto_123292 ) ) ( not ( = ?auto_123291 ?auto_123293 ) ) ( not ( = ?auto_123292 ?auto_123293 ) ) ( not ( = ?auto_123290 ?auto_123296 ) ) ( not ( = ?auto_123291 ?auto_123296 ) ) ( not ( = ?auto_123292 ?auto_123296 ) ) ( not ( = ?auto_123293 ?auto_123296 ) ) ( ON-TABLE ?auto_123294 ) ( not ( = ?auto_123294 ?auto_123295 ) ) ( not ( = ?auto_123294 ?auto_123296 ) ) ( not ( = ?auto_123294 ?auto_123293 ) ) ( not ( = ?auto_123294 ?auto_123292 ) ) ( not ( = ?auto_123295 ?auto_123296 ) ) ( not ( = ?auto_123295 ?auto_123293 ) ) ( not ( = ?auto_123295 ?auto_123292 ) ) ( not ( = ?auto_123290 ?auto_123294 ) ) ( not ( = ?auto_123290 ?auto_123295 ) ) ( not ( = ?auto_123291 ?auto_123294 ) ) ( not ( = ?auto_123291 ?auto_123295 ) ) ( ON ?auto_123290 ?auto_123297 ) ( not ( = ?auto_123290 ?auto_123297 ) ) ( not ( = ?auto_123291 ?auto_123297 ) ) ( not ( = ?auto_123292 ?auto_123297 ) ) ( not ( = ?auto_123293 ?auto_123297 ) ) ( not ( = ?auto_123296 ?auto_123297 ) ) ( not ( = ?auto_123294 ?auto_123297 ) ) ( not ( = ?auto_123295 ?auto_123297 ) ) ( ON ?auto_123291 ?auto_123290 ) ( ON-TABLE ?auto_123297 ) ( ON ?auto_123292 ?auto_123291 ) ( ON ?auto_123293 ?auto_123292 ) ( ON ?auto_123296 ?auto_123293 ) ( CLEAR ?auto_123294 ) ( ON ?auto_123295 ?auto_123296 ) ( CLEAR ?auto_123295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123297 ?auto_123290 ?auto_123291 ?auto_123292 ?auto_123293 ?auto_123296 )
      ( MAKE-4PILE ?auto_123290 ?auto_123291 ?auto_123292 ?auto_123293 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123298 - BLOCK
      ?auto_123299 - BLOCK
      ?auto_123300 - BLOCK
      ?auto_123301 - BLOCK
    )
    :vars
    (
      ?auto_123303 - BLOCK
      ?auto_123305 - BLOCK
      ?auto_123302 - BLOCK
      ?auto_123304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123298 ?auto_123299 ) ) ( not ( = ?auto_123298 ?auto_123300 ) ) ( not ( = ?auto_123298 ?auto_123301 ) ) ( not ( = ?auto_123299 ?auto_123300 ) ) ( not ( = ?auto_123299 ?auto_123301 ) ) ( not ( = ?auto_123300 ?auto_123301 ) ) ( not ( = ?auto_123298 ?auto_123303 ) ) ( not ( = ?auto_123299 ?auto_123303 ) ) ( not ( = ?auto_123300 ?auto_123303 ) ) ( not ( = ?auto_123301 ?auto_123303 ) ) ( not ( = ?auto_123305 ?auto_123302 ) ) ( not ( = ?auto_123305 ?auto_123303 ) ) ( not ( = ?auto_123305 ?auto_123301 ) ) ( not ( = ?auto_123305 ?auto_123300 ) ) ( not ( = ?auto_123302 ?auto_123303 ) ) ( not ( = ?auto_123302 ?auto_123301 ) ) ( not ( = ?auto_123302 ?auto_123300 ) ) ( not ( = ?auto_123298 ?auto_123305 ) ) ( not ( = ?auto_123298 ?auto_123302 ) ) ( not ( = ?auto_123299 ?auto_123305 ) ) ( not ( = ?auto_123299 ?auto_123302 ) ) ( ON ?auto_123298 ?auto_123304 ) ( not ( = ?auto_123298 ?auto_123304 ) ) ( not ( = ?auto_123299 ?auto_123304 ) ) ( not ( = ?auto_123300 ?auto_123304 ) ) ( not ( = ?auto_123301 ?auto_123304 ) ) ( not ( = ?auto_123303 ?auto_123304 ) ) ( not ( = ?auto_123305 ?auto_123304 ) ) ( not ( = ?auto_123302 ?auto_123304 ) ) ( ON ?auto_123299 ?auto_123298 ) ( ON-TABLE ?auto_123304 ) ( ON ?auto_123300 ?auto_123299 ) ( ON ?auto_123301 ?auto_123300 ) ( ON ?auto_123303 ?auto_123301 ) ( ON ?auto_123302 ?auto_123303 ) ( CLEAR ?auto_123302 ) ( HOLDING ?auto_123305 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123305 )
      ( MAKE-4PILE ?auto_123298 ?auto_123299 ?auto_123300 ?auto_123301 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_123306 - BLOCK
      ?auto_123307 - BLOCK
      ?auto_123308 - BLOCK
      ?auto_123309 - BLOCK
    )
    :vars
    (
      ?auto_123313 - BLOCK
      ?auto_123312 - BLOCK
      ?auto_123310 - BLOCK
      ?auto_123311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123306 ?auto_123307 ) ) ( not ( = ?auto_123306 ?auto_123308 ) ) ( not ( = ?auto_123306 ?auto_123309 ) ) ( not ( = ?auto_123307 ?auto_123308 ) ) ( not ( = ?auto_123307 ?auto_123309 ) ) ( not ( = ?auto_123308 ?auto_123309 ) ) ( not ( = ?auto_123306 ?auto_123313 ) ) ( not ( = ?auto_123307 ?auto_123313 ) ) ( not ( = ?auto_123308 ?auto_123313 ) ) ( not ( = ?auto_123309 ?auto_123313 ) ) ( not ( = ?auto_123312 ?auto_123310 ) ) ( not ( = ?auto_123312 ?auto_123313 ) ) ( not ( = ?auto_123312 ?auto_123309 ) ) ( not ( = ?auto_123312 ?auto_123308 ) ) ( not ( = ?auto_123310 ?auto_123313 ) ) ( not ( = ?auto_123310 ?auto_123309 ) ) ( not ( = ?auto_123310 ?auto_123308 ) ) ( not ( = ?auto_123306 ?auto_123312 ) ) ( not ( = ?auto_123306 ?auto_123310 ) ) ( not ( = ?auto_123307 ?auto_123312 ) ) ( not ( = ?auto_123307 ?auto_123310 ) ) ( ON ?auto_123306 ?auto_123311 ) ( not ( = ?auto_123306 ?auto_123311 ) ) ( not ( = ?auto_123307 ?auto_123311 ) ) ( not ( = ?auto_123308 ?auto_123311 ) ) ( not ( = ?auto_123309 ?auto_123311 ) ) ( not ( = ?auto_123313 ?auto_123311 ) ) ( not ( = ?auto_123312 ?auto_123311 ) ) ( not ( = ?auto_123310 ?auto_123311 ) ) ( ON ?auto_123307 ?auto_123306 ) ( ON-TABLE ?auto_123311 ) ( ON ?auto_123308 ?auto_123307 ) ( ON ?auto_123309 ?auto_123308 ) ( ON ?auto_123313 ?auto_123309 ) ( ON ?auto_123310 ?auto_123313 ) ( ON ?auto_123312 ?auto_123310 ) ( CLEAR ?auto_123312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123311 ?auto_123306 ?auto_123307 ?auto_123308 ?auto_123309 ?auto_123313 ?auto_123310 )
      ( MAKE-4PILE ?auto_123306 ?auto_123307 ?auto_123308 ?auto_123309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123316 - BLOCK
      ?auto_123317 - BLOCK
    )
    :vars
    (
      ?auto_123318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123318 ?auto_123317 ) ( CLEAR ?auto_123318 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123316 ) ( ON ?auto_123317 ?auto_123316 ) ( not ( = ?auto_123316 ?auto_123317 ) ) ( not ( = ?auto_123316 ?auto_123318 ) ) ( not ( = ?auto_123317 ?auto_123318 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123318 ?auto_123317 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123319 - BLOCK
      ?auto_123320 - BLOCK
    )
    :vars
    (
      ?auto_123321 - BLOCK
      ?auto_123322 - BLOCK
      ?auto_123323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123321 ?auto_123320 ) ( CLEAR ?auto_123321 ) ( ON-TABLE ?auto_123319 ) ( ON ?auto_123320 ?auto_123319 ) ( not ( = ?auto_123319 ?auto_123320 ) ) ( not ( = ?auto_123319 ?auto_123321 ) ) ( not ( = ?auto_123320 ?auto_123321 ) ) ( HOLDING ?auto_123322 ) ( CLEAR ?auto_123323 ) ( not ( = ?auto_123319 ?auto_123322 ) ) ( not ( = ?auto_123319 ?auto_123323 ) ) ( not ( = ?auto_123320 ?auto_123322 ) ) ( not ( = ?auto_123320 ?auto_123323 ) ) ( not ( = ?auto_123321 ?auto_123322 ) ) ( not ( = ?auto_123321 ?auto_123323 ) ) ( not ( = ?auto_123322 ?auto_123323 ) ) )
    :subtasks
    ( ( !STACK ?auto_123322 ?auto_123323 )
      ( MAKE-2PILE ?auto_123319 ?auto_123320 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123324 - BLOCK
      ?auto_123325 - BLOCK
    )
    :vars
    (
      ?auto_123328 - BLOCK
      ?auto_123326 - BLOCK
      ?auto_123327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123328 ?auto_123325 ) ( ON-TABLE ?auto_123324 ) ( ON ?auto_123325 ?auto_123324 ) ( not ( = ?auto_123324 ?auto_123325 ) ) ( not ( = ?auto_123324 ?auto_123328 ) ) ( not ( = ?auto_123325 ?auto_123328 ) ) ( CLEAR ?auto_123326 ) ( not ( = ?auto_123324 ?auto_123327 ) ) ( not ( = ?auto_123324 ?auto_123326 ) ) ( not ( = ?auto_123325 ?auto_123327 ) ) ( not ( = ?auto_123325 ?auto_123326 ) ) ( not ( = ?auto_123328 ?auto_123327 ) ) ( not ( = ?auto_123328 ?auto_123326 ) ) ( not ( = ?auto_123327 ?auto_123326 ) ) ( ON ?auto_123327 ?auto_123328 ) ( CLEAR ?auto_123327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123324 ?auto_123325 ?auto_123328 )
      ( MAKE-2PILE ?auto_123324 ?auto_123325 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123329 - BLOCK
      ?auto_123330 - BLOCK
    )
    :vars
    (
      ?auto_123331 - BLOCK
      ?auto_123332 - BLOCK
      ?auto_123333 - BLOCK
      ?auto_123334 - BLOCK
      ?auto_123335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123331 ?auto_123330 ) ( ON-TABLE ?auto_123329 ) ( ON ?auto_123330 ?auto_123329 ) ( not ( = ?auto_123329 ?auto_123330 ) ) ( not ( = ?auto_123329 ?auto_123331 ) ) ( not ( = ?auto_123330 ?auto_123331 ) ) ( not ( = ?auto_123329 ?auto_123332 ) ) ( not ( = ?auto_123329 ?auto_123333 ) ) ( not ( = ?auto_123330 ?auto_123332 ) ) ( not ( = ?auto_123330 ?auto_123333 ) ) ( not ( = ?auto_123331 ?auto_123332 ) ) ( not ( = ?auto_123331 ?auto_123333 ) ) ( not ( = ?auto_123332 ?auto_123333 ) ) ( ON ?auto_123332 ?auto_123331 ) ( CLEAR ?auto_123332 ) ( HOLDING ?auto_123333 ) ( CLEAR ?auto_123334 ) ( ON-TABLE ?auto_123335 ) ( ON ?auto_123334 ?auto_123335 ) ( not ( = ?auto_123335 ?auto_123334 ) ) ( not ( = ?auto_123335 ?auto_123333 ) ) ( not ( = ?auto_123334 ?auto_123333 ) ) ( not ( = ?auto_123329 ?auto_123334 ) ) ( not ( = ?auto_123329 ?auto_123335 ) ) ( not ( = ?auto_123330 ?auto_123334 ) ) ( not ( = ?auto_123330 ?auto_123335 ) ) ( not ( = ?auto_123331 ?auto_123334 ) ) ( not ( = ?auto_123331 ?auto_123335 ) ) ( not ( = ?auto_123332 ?auto_123334 ) ) ( not ( = ?auto_123332 ?auto_123335 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123335 ?auto_123334 ?auto_123333 )
      ( MAKE-2PILE ?auto_123329 ?auto_123330 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123336 - BLOCK
      ?auto_123337 - BLOCK
    )
    :vars
    (
      ?auto_123340 - BLOCK
      ?auto_123339 - BLOCK
      ?auto_123342 - BLOCK
      ?auto_123338 - BLOCK
      ?auto_123341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123340 ?auto_123337 ) ( ON-TABLE ?auto_123336 ) ( ON ?auto_123337 ?auto_123336 ) ( not ( = ?auto_123336 ?auto_123337 ) ) ( not ( = ?auto_123336 ?auto_123340 ) ) ( not ( = ?auto_123337 ?auto_123340 ) ) ( not ( = ?auto_123336 ?auto_123339 ) ) ( not ( = ?auto_123336 ?auto_123342 ) ) ( not ( = ?auto_123337 ?auto_123339 ) ) ( not ( = ?auto_123337 ?auto_123342 ) ) ( not ( = ?auto_123340 ?auto_123339 ) ) ( not ( = ?auto_123340 ?auto_123342 ) ) ( not ( = ?auto_123339 ?auto_123342 ) ) ( ON ?auto_123339 ?auto_123340 ) ( CLEAR ?auto_123338 ) ( ON-TABLE ?auto_123341 ) ( ON ?auto_123338 ?auto_123341 ) ( not ( = ?auto_123341 ?auto_123338 ) ) ( not ( = ?auto_123341 ?auto_123342 ) ) ( not ( = ?auto_123338 ?auto_123342 ) ) ( not ( = ?auto_123336 ?auto_123338 ) ) ( not ( = ?auto_123336 ?auto_123341 ) ) ( not ( = ?auto_123337 ?auto_123338 ) ) ( not ( = ?auto_123337 ?auto_123341 ) ) ( not ( = ?auto_123340 ?auto_123338 ) ) ( not ( = ?auto_123340 ?auto_123341 ) ) ( not ( = ?auto_123339 ?auto_123338 ) ) ( not ( = ?auto_123339 ?auto_123341 ) ) ( ON ?auto_123342 ?auto_123339 ) ( CLEAR ?auto_123342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123336 ?auto_123337 ?auto_123340 ?auto_123339 )
      ( MAKE-2PILE ?auto_123336 ?auto_123337 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123343 - BLOCK
      ?auto_123344 - BLOCK
    )
    :vars
    (
      ?auto_123345 - BLOCK
      ?auto_123348 - BLOCK
      ?auto_123346 - BLOCK
      ?auto_123349 - BLOCK
      ?auto_123347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123345 ?auto_123344 ) ( ON-TABLE ?auto_123343 ) ( ON ?auto_123344 ?auto_123343 ) ( not ( = ?auto_123343 ?auto_123344 ) ) ( not ( = ?auto_123343 ?auto_123345 ) ) ( not ( = ?auto_123344 ?auto_123345 ) ) ( not ( = ?auto_123343 ?auto_123348 ) ) ( not ( = ?auto_123343 ?auto_123346 ) ) ( not ( = ?auto_123344 ?auto_123348 ) ) ( not ( = ?auto_123344 ?auto_123346 ) ) ( not ( = ?auto_123345 ?auto_123348 ) ) ( not ( = ?auto_123345 ?auto_123346 ) ) ( not ( = ?auto_123348 ?auto_123346 ) ) ( ON ?auto_123348 ?auto_123345 ) ( ON-TABLE ?auto_123349 ) ( not ( = ?auto_123349 ?auto_123347 ) ) ( not ( = ?auto_123349 ?auto_123346 ) ) ( not ( = ?auto_123347 ?auto_123346 ) ) ( not ( = ?auto_123343 ?auto_123347 ) ) ( not ( = ?auto_123343 ?auto_123349 ) ) ( not ( = ?auto_123344 ?auto_123347 ) ) ( not ( = ?auto_123344 ?auto_123349 ) ) ( not ( = ?auto_123345 ?auto_123347 ) ) ( not ( = ?auto_123345 ?auto_123349 ) ) ( not ( = ?auto_123348 ?auto_123347 ) ) ( not ( = ?auto_123348 ?auto_123349 ) ) ( ON ?auto_123346 ?auto_123348 ) ( CLEAR ?auto_123346 ) ( HOLDING ?auto_123347 ) ( CLEAR ?auto_123349 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123349 ?auto_123347 )
      ( MAKE-2PILE ?auto_123343 ?auto_123344 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123350 - BLOCK
      ?auto_123351 - BLOCK
    )
    :vars
    (
      ?auto_123353 - BLOCK
      ?auto_123354 - BLOCK
      ?auto_123356 - BLOCK
      ?auto_123355 - BLOCK
      ?auto_123352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123353 ?auto_123351 ) ( ON-TABLE ?auto_123350 ) ( ON ?auto_123351 ?auto_123350 ) ( not ( = ?auto_123350 ?auto_123351 ) ) ( not ( = ?auto_123350 ?auto_123353 ) ) ( not ( = ?auto_123351 ?auto_123353 ) ) ( not ( = ?auto_123350 ?auto_123354 ) ) ( not ( = ?auto_123350 ?auto_123356 ) ) ( not ( = ?auto_123351 ?auto_123354 ) ) ( not ( = ?auto_123351 ?auto_123356 ) ) ( not ( = ?auto_123353 ?auto_123354 ) ) ( not ( = ?auto_123353 ?auto_123356 ) ) ( not ( = ?auto_123354 ?auto_123356 ) ) ( ON ?auto_123354 ?auto_123353 ) ( ON-TABLE ?auto_123355 ) ( not ( = ?auto_123355 ?auto_123352 ) ) ( not ( = ?auto_123355 ?auto_123356 ) ) ( not ( = ?auto_123352 ?auto_123356 ) ) ( not ( = ?auto_123350 ?auto_123352 ) ) ( not ( = ?auto_123350 ?auto_123355 ) ) ( not ( = ?auto_123351 ?auto_123352 ) ) ( not ( = ?auto_123351 ?auto_123355 ) ) ( not ( = ?auto_123353 ?auto_123352 ) ) ( not ( = ?auto_123353 ?auto_123355 ) ) ( not ( = ?auto_123354 ?auto_123352 ) ) ( not ( = ?auto_123354 ?auto_123355 ) ) ( ON ?auto_123356 ?auto_123354 ) ( CLEAR ?auto_123355 ) ( ON ?auto_123352 ?auto_123356 ) ( CLEAR ?auto_123352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123350 ?auto_123351 ?auto_123353 ?auto_123354 ?auto_123356 )
      ( MAKE-2PILE ?auto_123350 ?auto_123351 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123357 - BLOCK
      ?auto_123358 - BLOCK
    )
    :vars
    (
      ?auto_123359 - BLOCK
      ?auto_123363 - BLOCK
      ?auto_123362 - BLOCK
      ?auto_123360 - BLOCK
      ?auto_123361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123359 ?auto_123358 ) ( ON-TABLE ?auto_123357 ) ( ON ?auto_123358 ?auto_123357 ) ( not ( = ?auto_123357 ?auto_123358 ) ) ( not ( = ?auto_123357 ?auto_123359 ) ) ( not ( = ?auto_123358 ?auto_123359 ) ) ( not ( = ?auto_123357 ?auto_123363 ) ) ( not ( = ?auto_123357 ?auto_123362 ) ) ( not ( = ?auto_123358 ?auto_123363 ) ) ( not ( = ?auto_123358 ?auto_123362 ) ) ( not ( = ?auto_123359 ?auto_123363 ) ) ( not ( = ?auto_123359 ?auto_123362 ) ) ( not ( = ?auto_123363 ?auto_123362 ) ) ( ON ?auto_123363 ?auto_123359 ) ( not ( = ?auto_123360 ?auto_123361 ) ) ( not ( = ?auto_123360 ?auto_123362 ) ) ( not ( = ?auto_123361 ?auto_123362 ) ) ( not ( = ?auto_123357 ?auto_123361 ) ) ( not ( = ?auto_123357 ?auto_123360 ) ) ( not ( = ?auto_123358 ?auto_123361 ) ) ( not ( = ?auto_123358 ?auto_123360 ) ) ( not ( = ?auto_123359 ?auto_123361 ) ) ( not ( = ?auto_123359 ?auto_123360 ) ) ( not ( = ?auto_123363 ?auto_123361 ) ) ( not ( = ?auto_123363 ?auto_123360 ) ) ( ON ?auto_123362 ?auto_123363 ) ( ON ?auto_123361 ?auto_123362 ) ( CLEAR ?auto_123361 ) ( HOLDING ?auto_123360 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123360 )
      ( MAKE-2PILE ?auto_123357 ?auto_123358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123364 - BLOCK
      ?auto_123365 - BLOCK
    )
    :vars
    (
      ?auto_123370 - BLOCK
      ?auto_123368 - BLOCK
      ?auto_123367 - BLOCK
      ?auto_123369 - BLOCK
      ?auto_123366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123370 ?auto_123365 ) ( ON-TABLE ?auto_123364 ) ( ON ?auto_123365 ?auto_123364 ) ( not ( = ?auto_123364 ?auto_123365 ) ) ( not ( = ?auto_123364 ?auto_123370 ) ) ( not ( = ?auto_123365 ?auto_123370 ) ) ( not ( = ?auto_123364 ?auto_123368 ) ) ( not ( = ?auto_123364 ?auto_123367 ) ) ( not ( = ?auto_123365 ?auto_123368 ) ) ( not ( = ?auto_123365 ?auto_123367 ) ) ( not ( = ?auto_123370 ?auto_123368 ) ) ( not ( = ?auto_123370 ?auto_123367 ) ) ( not ( = ?auto_123368 ?auto_123367 ) ) ( ON ?auto_123368 ?auto_123370 ) ( not ( = ?auto_123369 ?auto_123366 ) ) ( not ( = ?auto_123369 ?auto_123367 ) ) ( not ( = ?auto_123366 ?auto_123367 ) ) ( not ( = ?auto_123364 ?auto_123366 ) ) ( not ( = ?auto_123364 ?auto_123369 ) ) ( not ( = ?auto_123365 ?auto_123366 ) ) ( not ( = ?auto_123365 ?auto_123369 ) ) ( not ( = ?auto_123370 ?auto_123366 ) ) ( not ( = ?auto_123370 ?auto_123369 ) ) ( not ( = ?auto_123368 ?auto_123366 ) ) ( not ( = ?auto_123368 ?auto_123369 ) ) ( ON ?auto_123367 ?auto_123368 ) ( ON ?auto_123366 ?auto_123367 ) ( ON ?auto_123369 ?auto_123366 ) ( CLEAR ?auto_123369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123364 ?auto_123365 ?auto_123370 ?auto_123368 ?auto_123367 ?auto_123366 )
      ( MAKE-2PILE ?auto_123364 ?auto_123365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123371 - BLOCK
      ?auto_123372 - BLOCK
    )
    :vars
    (
      ?auto_123375 - BLOCK
      ?auto_123374 - BLOCK
      ?auto_123376 - BLOCK
      ?auto_123377 - BLOCK
      ?auto_123373 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123375 ?auto_123372 ) ( ON-TABLE ?auto_123371 ) ( ON ?auto_123372 ?auto_123371 ) ( not ( = ?auto_123371 ?auto_123372 ) ) ( not ( = ?auto_123371 ?auto_123375 ) ) ( not ( = ?auto_123372 ?auto_123375 ) ) ( not ( = ?auto_123371 ?auto_123374 ) ) ( not ( = ?auto_123371 ?auto_123376 ) ) ( not ( = ?auto_123372 ?auto_123374 ) ) ( not ( = ?auto_123372 ?auto_123376 ) ) ( not ( = ?auto_123375 ?auto_123374 ) ) ( not ( = ?auto_123375 ?auto_123376 ) ) ( not ( = ?auto_123374 ?auto_123376 ) ) ( ON ?auto_123374 ?auto_123375 ) ( not ( = ?auto_123377 ?auto_123373 ) ) ( not ( = ?auto_123377 ?auto_123376 ) ) ( not ( = ?auto_123373 ?auto_123376 ) ) ( not ( = ?auto_123371 ?auto_123373 ) ) ( not ( = ?auto_123371 ?auto_123377 ) ) ( not ( = ?auto_123372 ?auto_123373 ) ) ( not ( = ?auto_123372 ?auto_123377 ) ) ( not ( = ?auto_123375 ?auto_123373 ) ) ( not ( = ?auto_123375 ?auto_123377 ) ) ( not ( = ?auto_123374 ?auto_123373 ) ) ( not ( = ?auto_123374 ?auto_123377 ) ) ( ON ?auto_123376 ?auto_123374 ) ( ON ?auto_123373 ?auto_123376 ) ( HOLDING ?auto_123377 ) ( CLEAR ?auto_123373 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123371 ?auto_123372 ?auto_123375 ?auto_123374 ?auto_123376 ?auto_123373 ?auto_123377 )
      ( MAKE-2PILE ?auto_123371 ?auto_123372 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123378 - BLOCK
      ?auto_123379 - BLOCK
    )
    :vars
    (
      ?auto_123380 - BLOCK
      ?auto_123381 - BLOCK
      ?auto_123384 - BLOCK
      ?auto_123382 - BLOCK
      ?auto_123383 - BLOCK
      ?auto_123385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123380 ?auto_123379 ) ( ON-TABLE ?auto_123378 ) ( ON ?auto_123379 ?auto_123378 ) ( not ( = ?auto_123378 ?auto_123379 ) ) ( not ( = ?auto_123378 ?auto_123380 ) ) ( not ( = ?auto_123379 ?auto_123380 ) ) ( not ( = ?auto_123378 ?auto_123381 ) ) ( not ( = ?auto_123378 ?auto_123384 ) ) ( not ( = ?auto_123379 ?auto_123381 ) ) ( not ( = ?auto_123379 ?auto_123384 ) ) ( not ( = ?auto_123380 ?auto_123381 ) ) ( not ( = ?auto_123380 ?auto_123384 ) ) ( not ( = ?auto_123381 ?auto_123384 ) ) ( ON ?auto_123381 ?auto_123380 ) ( not ( = ?auto_123382 ?auto_123383 ) ) ( not ( = ?auto_123382 ?auto_123384 ) ) ( not ( = ?auto_123383 ?auto_123384 ) ) ( not ( = ?auto_123378 ?auto_123383 ) ) ( not ( = ?auto_123378 ?auto_123382 ) ) ( not ( = ?auto_123379 ?auto_123383 ) ) ( not ( = ?auto_123379 ?auto_123382 ) ) ( not ( = ?auto_123380 ?auto_123383 ) ) ( not ( = ?auto_123380 ?auto_123382 ) ) ( not ( = ?auto_123381 ?auto_123383 ) ) ( not ( = ?auto_123381 ?auto_123382 ) ) ( ON ?auto_123384 ?auto_123381 ) ( ON ?auto_123383 ?auto_123384 ) ( CLEAR ?auto_123383 ) ( ON ?auto_123382 ?auto_123385 ) ( CLEAR ?auto_123382 ) ( HAND-EMPTY ) ( not ( = ?auto_123378 ?auto_123385 ) ) ( not ( = ?auto_123379 ?auto_123385 ) ) ( not ( = ?auto_123380 ?auto_123385 ) ) ( not ( = ?auto_123381 ?auto_123385 ) ) ( not ( = ?auto_123384 ?auto_123385 ) ) ( not ( = ?auto_123382 ?auto_123385 ) ) ( not ( = ?auto_123383 ?auto_123385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123382 ?auto_123385 )
      ( MAKE-2PILE ?auto_123378 ?auto_123379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123386 - BLOCK
      ?auto_123387 - BLOCK
    )
    :vars
    (
      ?auto_123389 - BLOCK
      ?auto_123391 - BLOCK
      ?auto_123393 - BLOCK
      ?auto_123392 - BLOCK
      ?auto_123388 - BLOCK
      ?auto_123390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123389 ?auto_123387 ) ( ON-TABLE ?auto_123386 ) ( ON ?auto_123387 ?auto_123386 ) ( not ( = ?auto_123386 ?auto_123387 ) ) ( not ( = ?auto_123386 ?auto_123389 ) ) ( not ( = ?auto_123387 ?auto_123389 ) ) ( not ( = ?auto_123386 ?auto_123391 ) ) ( not ( = ?auto_123386 ?auto_123393 ) ) ( not ( = ?auto_123387 ?auto_123391 ) ) ( not ( = ?auto_123387 ?auto_123393 ) ) ( not ( = ?auto_123389 ?auto_123391 ) ) ( not ( = ?auto_123389 ?auto_123393 ) ) ( not ( = ?auto_123391 ?auto_123393 ) ) ( ON ?auto_123391 ?auto_123389 ) ( not ( = ?auto_123392 ?auto_123388 ) ) ( not ( = ?auto_123392 ?auto_123393 ) ) ( not ( = ?auto_123388 ?auto_123393 ) ) ( not ( = ?auto_123386 ?auto_123388 ) ) ( not ( = ?auto_123386 ?auto_123392 ) ) ( not ( = ?auto_123387 ?auto_123388 ) ) ( not ( = ?auto_123387 ?auto_123392 ) ) ( not ( = ?auto_123389 ?auto_123388 ) ) ( not ( = ?auto_123389 ?auto_123392 ) ) ( not ( = ?auto_123391 ?auto_123388 ) ) ( not ( = ?auto_123391 ?auto_123392 ) ) ( ON ?auto_123393 ?auto_123391 ) ( ON ?auto_123392 ?auto_123390 ) ( CLEAR ?auto_123392 ) ( not ( = ?auto_123386 ?auto_123390 ) ) ( not ( = ?auto_123387 ?auto_123390 ) ) ( not ( = ?auto_123389 ?auto_123390 ) ) ( not ( = ?auto_123391 ?auto_123390 ) ) ( not ( = ?auto_123393 ?auto_123390 ) ) ( not ( = ?auto_123392 ?auto_123390 ) ) ( not ( = ?auto_123388 ?auto_123390 ) ) ( HOLDING ?auto_123388 ) ( CLEAR ?auto_123393 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123386 ?auto_123387 ?auto_123389 ?auto_123391 ?auto_123393 ?auto_123388 )
      ( MAKE-2PILE ?auto_123386 ?auto_123387 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123394 - BLOCK
      ?auto_123395 - BLOCK
    )
    :vars
    (
      ?auto_123401 - BLOCK
      ?auto_123396 - BLOCK
      ?auto_123398 - BLOCK
      ?auto_123400 - BLOCK
      ?auto_123397 - BLOCK
      ?auto_123399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123401 ?auto_123395 ) ( ON-TABLE ?auto_123394 ) ( ON ?auto_123395 ?auto_123394 ) ( not ( = ?auto_123394 ?auto_123395 ) ) ( not ( = ?auto_123394 ?auto_123401 ) ) ( not ( = ?auto_123395 ?auto_123401 ) ) ( not ( = ?auto_123394 ?auto_123396 ) ) ( not ( = ?auto_123394 ?auto_123398 ) ) ( not ( = ?auto_123395 ?auto_123396 ) ) ( not ( = ?auto_123395 ?auto_123398 ) ) ( not ( = ?auto_123401 ?auto_123396 ) ) ( not ( = ?auto_123401 ?auto_123398 ) ) ( not ( = ?auto_123396 ?auto_123398 ) ) ( ON ?auto_123396 ?auto_123401 ) ( not ( = ?auto_123400 ?auto_123397 ) ) ( not ( = ?auto_123400 ?auto_123398 ) ) ( not ( = ?auto_123397 ?auto_123398 ) ) ( not ( = ?auto_123394 ?auto_123397 ) ) ( not ( = ?auto_123394 ?auto_123400 ) ) ( not ( = ?auto_123395 ?auto_123397 ) ) ( not ( = ?auto_123395 ?auto_123400 ) ) ( not ( = ?auto_123401 ?auto_123397 ) ) ( not ( = ?auto_123401 ?auto_123400 ) ) ( not ( = ?auto_123396 ?auto_123397 ) ) ( not ( = ?auto_123396 ?auto_123400 ) ) ( ON ?auto_123398 ?auto_123396 ) ( ON ?auto_123400 ?auto_123399 ) ( not ( = ?auto_123394 ?auto_123399 ) ) ( not ( = ?auto_123395 ?auto_123399 ) ) ( not ( = ?auto_123401 ?auto_123399 ) ) ( not ( = ?auto_123396 ?auto_123399 ) ) ( not ( = ?auto_123398 ?auto_123399 ) ) ( not ( = ?auto_123400 ?auto_123399 ) ) ( not ( = ?auto_123397 ?auto_123399 ) ) ( CLEAR ?auto_123398 ) ( ON ?auto_123397 ?auto_123400 ) ( CLEAR ?auto_123397 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123399 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123399 ?auto_123400 )
      ( MAKE-2PILE ?auto_123394 ?auto_123395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123402 - BLOCK
      ?auto_123403 - BLOCK
    )
    :vars
    (
      ?auto_123406 - BLOCK
      ?auto_123404 - BLOCK
      ?auto_123408 - BLOCK
      ?auto_123405 - BLOCK
      ?auto_123407 - BLOCK
      ?auto_123409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123406 ?auto_123403 ) ( ON-TABLE ?auto_123402 ) ( ON ?auto_123403 ?auto_123402 ) ( not ( = ?auto_123402 ?auto_123403 ) ) ( not ( = ?auto_123402 ?auto_123406 ) ) ( not ( = ?auto_123403 ?auto_123406 ) ) ( not ( = ?auto_123402 ?auto_123404 ) ) ( not ( = ?auto_123402 ?auto_123408 ) ) ( not ( = ?auto_123403 ?auto_123404 ) ) ( not ( = ?auto_123403 ?auto_123408 ) ) ( not ( = ?auto_123406 ?auto_123404 ) ) ( not ( = ?auto_123406 ?auto_123408 ) ) ( not ( = ?auto_123404 ?auto_123408 ) ) ( ON ?auto_123404 ?auto_123406 ) ( not ( = ?auto_123405 ?auto_123407 ) ) ( not ( = ?auto_123405 ?auto_123408 ) ) ( not ( = ?auto_123407 ?auto_123408 ) ) ( not ( = ?auto_123402 ?auto_123407 ) ) ( not ( = ?auto_123402 ?auto_123405 ) ) ( not ( = ?auto_123403 ?auto_123407 ) ) ( not ( = ?auto_123403 ?auto_123405 ) ) ( not ( = ?auto_123406 ?auto_123407 ) ) ( not ( = ?auto_123406 ?auto_123405 ) ) ( not ( = ?auto_123404 ?auto_123407 ) ) ( not ( = ?auto_123404 ?auto_123405 ) ) ( ON ?auto_123405 ?auto_123409 ) ( not ( = ?auto_123402 ?auto_123409 ) ) ( not ( = ?auto_123403 ?auto_123409 ) ) ( not ( = ?auto_123406 ?auto_123409 ) ) ( not ( = ?auto_123404 ?auto_123409 ) ) ( not ( = ?auto_123408 ?auto_123409 ) ) ( not ( = ?auto_123405 ?auto_123409 ) ) ( not ( = ?auto_123407 ?auto_123409 ) ) ( ON ?auto_123407 ?auto_123405 ) ( CLEAR ?auto_123407 ) ( ON-TABLE ?auto_123409 ) ( HOLDING ?auto_123408 ) ( CLEAR ?auto_123404 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123402 ?auto_123403 ?auto_123406 ?auto_123404 ?auto_123408 )
      ( MAKE-2PILE ?auto_123402 ?auto_123403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123410 - BLOCK
      ?auto_123411 - BLOCK
    )
    :vars
    (
      ?auto_123413 - BLOCK
      ?auto_123412 - BLOCK
      ?auto_123416 - BLOCK
      ?auto_123417 - BLOCK
      ?auto_123415 - BLOCK
      ?auto_123414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123413 ?auto_123411 ) ( ON-TABLE ?auto_123410 ) ( ON ?auto_123411 ?auto_123410 ) ( not ( = ?auto_123410 ?auto_123411 ) ) ( not ( = ?auto_123410 ?auto_123413 ) ) ( not ( = ?auto_123411 ?auto_123413 ) ) ( not ( = ?auto_123410 ?auto_123412 ) ) ( not ( = ?auto_123410 ?auto_123416 ) ) ( not ( = ?auto_123411 ?auto_123412 ) ) ( not ( = ?auto_123411 ?auto_123416 ) ) ( not ( = ?auto_123413 ?auto_123412 ) ) ( not ( = ?auto_123413 ?auto_123416 ) ) ( not ( = ?auto_123412 ?auto_123416 ) ) ( ON ?auto_123412 ?auto_123413 ) ( not ( = ?auto_123417 ?auto_123415 ) ) ( not ( = ?auto_123417 ?auto_123416 ) ) ( not ( = ?auto_123415 ?auto_123416 ) ) ( not ( = ?auto_123410 ?auto_123415 ) ) ( not ( = ?auto_123410 ?auto_123417 ) ) ( not ( = ?auto_123411 ?auto_123415 ) ) ( not ( = ?auto_123411 ?auto_123417 ) ) ( not ( = ?auto_123413 ?auto_123415 ) ) ( not ( = ?auto_123413 ?auto_123417 ) ) ( not ( = ?auto_123412 ?auto_123415 ) ) ( not ( = ?auto_123412 ?auto_123417 ) ) ( ON ?auto_123417 ?auto_123414 ) ( not ( = ?auto_123410 ?auto_123414 ) ) ( not ( = ?auto_123411 ?auto_123414 ) ) ( not ( = ?auto_123413 ?auto_123414 ) ) ( not ( = ?auto_123412 ?auto_123414 ) ) ( not ( = ?auto_123416 ?auto_123414 ) ) ( not ( = ?auto_123417 ?auto_123414 ) ) ( not ( = ?auto_123415 ?auto_123414 ) ) ( ON ?auto_123415 ?auto_123417 ) ( ON-TABLE ?auto_123414 ) ( CLEAR ?auto_123412 ) ( ON ?auto_123416 ?auto_123415 ) ( CLEAR ?auto_123416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123414 ?auto_123417 ?auto_123415 )
      ( MAKE-2PILE ?auto_123410 ?auto_123411 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123418 - BLOCK
      ?auto_123419 - BLOCK
    )
    :vars
    (
      ?auto_123424 - BLOCK
      ?auto_123422 - BLOCK
      ?auto_123420 - BLOCK
      ?auto_123425 - BLOCK
      ?auto_123423 - BLOCK
      ?auto_123421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123424 ?auto_123419 ) ( ON-TABLE ?auto_123418 ) ( ON ?auto_123419 ?auto_123418 ) ( not ( = ?auto_123418 ?auto_123419 ) ) ( not ( = ?auto_123418 ?auto_123424 ) ) ( not ( = ?auto_123419 ?auto_123424 ) ) ( not ( = ?auto_123418 ?auto_123422 ) ) ( not ( = ?auto_123418 ?auto_123420 ) ) ( not ( = ?auto_123419 ?auto_123422 ) ) ( not ( = ?auto_123419 ?auto_123420 ) ) ( not ( = ?auto_123424 ?auto_123422 ) ) ( not ( = ?auto_123424 ?auto_123420 ) ) ( not ( = ?auto_123422 ?auto_123420 ) ) ( not ( = ?auto_123425 ?auto_123423 ) ) ( not ( = ?auto_123425 ?auto_123420 ) ) ( not ( = ?auto_123423 ?auto_123420 ) ) ( not ( = ?auto_123418 ?auto_123423 ) ) ( not ( = ?auto_123418 ?auto_123425 ) ) ( not ( = ?auto_123419 ?auto_123423 ) ) ( not ( = ?auto_123419 ?auto_123425 ) ) ( not ( = ?auto_123424 ?auto_123423 ) ) ( not ( = ?auto_123424 ?auto_123425 ) ) ( not ( = ?auto_123422 ?auto_123423 ) ) ( not ( = ?auto_123422 ?auto_123425 ) ) ( ON ?auto_123425 ?auto_123421 ) ( not ( = ?auto_123418 ?auto_123421 ) ) ( not ( = ?auto_123419 ?auto_123421 ) ) ( not ( = ?auto_123424 ?auto_123421 ) ) ( not ( = ?auto_123422 ?auto_123421 ) ) ( not ( = ?auto_123420 ?auto_123421 ) ) ( not ( = ?auto_123425 ?auto_123421 ) ) ( not ( = ?auto_123423 ?auto_123421 ) ) ( ON ?auto_123423 ?auto_123425 ) ( ON-TABLE ?auto_123421 ) ( ON ?auto_123420 ?auto_123423 ) ( CLEAR ?auto_123420 ) ( HOLDING ?auto_123422 ) ( CLEAR ?auto_123424 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123418 ?auto_123419 ?auto_123424 ?auto_123422 )
      ( MAKE-2PILE ?auto_123418 ?auto_123419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123426 - BLOCK
      ?auto_123427 - BLOCK
    )
    :vars
    (
      ?auto_123429 - BLOCK
      ?auto_123431 - BLOCK
      ?auto_123432 - BLOCK
      ?auto_123430 - BLOCK
      ?auto_123428 - BLOCK
      ?auto_123433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123429 ?auto_123427 ) ( ON-TABLE ?auto_123426 ) ( ON ?auto_123427 ?auto_123426 ) ( not ( = ?auto_123426 ?auto_123427 ) ) ( not ( = ?auto_123426 ?auto_123429 ) ) ( not ( = ?auto_123427 ?auto_123429 ) ) ( not ( = ?auto_123426 ?auto_123431 ) ) ( not ( = ?auto_123426 ?auto_123432 ) ) ( not ( = ?auto_123427 ?auto_123431 ) ) ( not ( = ?auto_123427 ?auto_123432 ) ) ( not ( = ?auto_123429 ?auto_123431 ) ) ( not ( = ?auto_123429 ?auto_123432 ) ) ( not ( = ?auto_123431 ?auto_123432 ) ) ( not ( = ?auto_123430 ?auto_123428 ) ) ( not ( = ?auto_123430 ?auto_123432 ) ) ( not ( = ?auto_123428 ?auto_123432 ) ) ( not ( = ?auto_123426 ?auto_123428 ) ) ( not ( = ?auto_123426 ?auto_123430 ) ) ( not ( = ?auto_123427 ?auto_123428 ) ) ( not ( = ?auto_123427 ?auto_123430 ) ) ( not ( = ?auto_123429 ?auto_123428 ) ) ( not ( = ?auto_123429 ?auto_123430 ) ) ( not ( = ?auto_123431 ?auto_123428 ) ) ( not ( = ?auto_123431 ?auto_123430 ) ) ( ON ?auto_123430 ?auto_123433 ) ( not ( = ?auto_123426 ?auto_123433 ) ) ( not ( = ?auto_123427 ?auto_123433 ) ) ( not ( = ?auto_123429 ?auto_123433 ) ) ( not ( = ?auto_123431 ?auto_123433 ) ) ( not ( = ?auto_123432 ?auto_123433 ) ) ( not ( = ?auto_123430 ?auto_123433 ) ) ( not ( = ?auto_123428 ?auto_123433 ) ) ( ON ?auto_123428 ?auto_123430 ) ( ON-TABLE ?auto_123433 ) ( ON ?auto_123432 ?auto_123428 ) ( CLEAR ?auto_123429 ) ( ON ?auto_123431 ?auto_123432 ) ( CLEAR ?auto_123431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123433 ?auto_123430 ?auto_123428 ?auto_123432 )
      ( MAKE-2PILE ?auto_123426 ?auto_123427 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123450 - BLOCK
      ?auto_123451 - BLOCK
    )
    :vars
    (
      ?auto_123452 - BLOCK
      ?auto_123453 - BLOCK
      ?auto_123455 - BLOCK
      ?auto_123454 - BLOCK
      ?auto_123457 - BLOCK
      ?auto_123456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123450 ) ( not ( = ?auto_123450 ?auto_123451 ) ) ( not ( = ?auto_123450 ?auto_123452 ) ) ( not ( = ?auto_123451 ?auto_123452 ) ) ( not ( = ?auto_123450 ?auto_123453 ) ) ( not ( = ?auto_123450 ?auto_123455 ) ) ( not ( = ?auto_123451 ?auto_123453 ) ) ( not ( = ?auto_123451 ?auto_123455 ) ) ( not ( = ?auto_123452 ?auto_123453 ) ) ( not ( = ?auto_123452 ?auto_123455 ) ) ( not ( = ?auto_123453 ?auto_123455 ) ) ( not ( = ?auto_123454 ?auto_123457 ) ) ( not ( = ?auto_123454 ?auto_123455 ) ) ( not ( = ?auto_123457 ?auto_123455 ) ) ( not ( = ?auto_123450 ?auto_123457 ) ) ( not ( = ?auto_123450 ?auto_123454 ) ) ( not ( = ?auto_123451 ?auto_123457 ) ) ( not ( = ?auto_123451 ?auto_123454 ) ) ( not ( = ?auto_123452 ?auto_123457 ) ) ( not ( = ?auto_123452 ?auto_123454 ) ) ( not ( = ?auto_123453 ?auto_123457 ) ) ( not ( = ?auto_123453 ?auto_123454 ) ) ( ON ?auto_123454 ?auto_123456 ) ( not ( = ?auto_123450 ?auto_123456 ) ) ( not ( = ?auto_123451 ?auto_123456 ) ) ( not ( = ?auto_123452 ?auto_123456 ) ) ( not ( = ?auto_123453 ?auto_123456 ) ) ( not ( = ?auto_123455 ?auto_123456 ) ) ( not ( = ?auto_123454 ?auto_123456 ) ) ( not ( = ?auto_123457 ?auto_123456 ) ) ( ON ?auto_123457 ?auto_123454 ) ( ON-TABLE ?auto_123456 ) ( ON ?auto_123455 ?auto_123457 ) ( ON ?auto_123453 ?auto_123455 ) ( ON ?auto_123452 ?auto_123453 ) ( CLEAR ?auto_123452 ) ( HOLDING ?auto_123451 ) ( CLEAR ?auto_123450 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123450 ?auto_123451 ?auto_123452 )
      ( MAKE-2PILE ?auto_123450 ?auto_123451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123458 - BLOCK
      ?auto_123459 - BLOCK
    )
    :vars
    (
      ?auto_123461 - BLOCK
      ?auto_123465 - BLOCK
      ?auto_123460 - BLOCK
      ?auto_123462 - BLOCK
      ?auto_123464 - BLOCK
      ?auto_123463 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123458 ) ( not ( = ?auto_123458 ?auto_123459 ) ) ( not ( = ?auto_123458 ?auto_123461 ) ) ( not ( = ?auto_123459 ?auto_123461 ) ) ( not ( = ?auto_123458 ?auto_123465 ) ) ( not ( = ?auto_123458 ?auto_123460 ) ) ( not ( = ?auto_123459 ?auto_123465 ) ) ( not ( = ?auto_123459 ?auto_123460 ) ) ( not ( = ?auto_123461 ?auto_123465 ) ) ( not ( = ?auto_123461 ?auto_123460 ) ) ( not ( = ?auto_123465 ?auto_123460 ) ) ( not ( = ?auto_123462 ?auto_123464 ) ) ( not ( = ?auto_123462 ?auto_123460 ) ) ( not ( = ?auto_123464 ?auto_123460 ) ) ( not ( = ?auto_123458 ?auto_123464 ) ) ( not ( = ?auto_123458 ?auto_123462 ) ) ( not ( = ?auto_123459 ?auto_123464 ) ) ( not ( = ?auto_123459 ?auto_123462 ) ) ( not ( = ?auto_123461 ?auto_123464 ) ) ( not ( = ?auto_123461 ?auto_123462 ) ) ( not ( = ?auto_123465 ?auto_123464 ) ) ( not ( = ?auto_123465 ?auto_123462 ) ) ( ON ?auto_123462 ?auto_123463 ) ( not ( = ?auto_123458 ?auto_123463 ) ) ( not ( = ?auto_123459 ?auto_123463 ) ) ( not ( = ?auto_123461 ?auto_123463 ) ) ( not ( = ?auto_123465 ?auto_123463 ) ) ( not ( = ?auto_123460 ?auto_123463 ) ) ( not ( = ?auto_123462 ?auto_123463 ) ) ( not ( = ?auto_123464 ?auto_123463 ) ) ( ON ?auto_123464 ?auto_123462 ) ( ON-TABLE ?auto_123463 ) ( ON ?auto_123460 ?auto_123464 ) ( ON ?auto_123465 ?auto_123460 ) ( ON ?auto_123461 ?auto_123465 ) ( CLEAR ?auto_123458 ) ( ON ?auto_123459 ?auto_123461 ) ( CLEAR ?auto_123459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123463 ?auto_123462 ?auto_123464 ?auto_123460 ?auto_123465 ?auto_123461 )
      ( MAKE-2PILE ?auto_123458 ?auto_123459 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123466 - BLOCK
      ?auto_123467 - BLOCK
    )
    :vars
    (
      ?auto_123473 - BLOCK
      ?auto_123472 - BLOCK
      ?auto_123470 - BLOCK
      ?auto_123471 - BLOCK
      ?auto_123468 - BLOCK
      ?auto_123469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123466 ?auto_123467 ) ) ( not ( = ?auto_123466 ?auto_123473 ) ) ( not ( = ?auto_123467 ?auto_123473 ) ) ( not ( = ?auto_123466 ?auto_123472 ) ) ( not ( = ?auto_123466 ?auto_123470 ) ) ( not ( = ?auto_123467 ?auto_123472 ) ) ( not ( = ?auto_123467 ?auto_123470 ) ) ( not ( = ?auto_123473 ?auto_123472 ) ) ( not ( = ?auto_123473 ?auto_123470 ) ) ( not ( = ?auto_123472 ?auto_123470 ) ) ( not ( = ?auto_123471 ?auto_123468 ) ) ( not ( = ?auto_123471 ?auto_123470 ) ) ( not ( = ?auto_123468 ?auto_123470 ) ) ( not ( = ?auto_123466 ?auto_123468 ) ) ( not ( = ?auto_123466 ?auto_123471 ) ) ( not ( = ?auto_123467 ?auto_123468 ) ) ( not ( = ?auto_123467 ?auto_123471 ) ) ( not ( = ?auto_123473 ?auto_123468 ) ) ( not ( = ?auto_123473 ?auto_123471 ) ) ( not ( = ?auto_123472 ?auto_123468 ) ) ( not ( = ?auto_123472 ?auto_123471 ) ) ( ON ?auto_123471 ?auto_123469 ) ( not ( = ?auto_123466 ?auto_123469 ) ) ( not ( = ?auto_123467 ?auto_123469 ) ) ( not ( = ?auto_123473 ?auto_123469 ) ) ( not ( = ?auto_123472 ?auto_123469 ) ) ( not ( = ?auto_123470 ?auto_123469 ) ) ( not ( = ?auto_123471 ?auto_123469 ) ) ( not ( = ?auto_123468 ?auto_123469 ) ) ( ON ?auto_123468 ?auto_123471 ) ( ON-TABLE ?auto_123469 ) ( ON ?auto_123470 ?auto_123468 ) ( ON ?auto_123472 ?auto_123470 ) ( ON ?auto_123473 ?auto_123472 ) ( ON ?auto_123467 ?auto_123473 ) ( CLEAR ?auto_123467 ) ( HOLDING ?auto_123466 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123466 )
      ( MAKE-2PILE ?auto_123466 ?auto_123467 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_123474 - BLOCK
      ?auto_123475 - BLOCK
    )
    :vars
    (
      ?auto_123476 - BLOCK
      ?auto_123477 - BLOCK
      ?auto_123478 - BLOCK
      ?auto_123479 - BLOCK
      ?auto_123480 - BLOCK
      ?auto_123481 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123474 ?auto_123475 ) ) ( not ( = ?auto_123474 ?auto_123476 ) ) ( not ( = ?auto_123475 ?auto_123476 ) ) ( not ( = ?auto_123474 ?auto_123477 ) ) ( not ( = ?auto_123474 ?auto_123478 ) ) ( not ( = ?auto_123475 ?auto_123477 ) ) ( not ( = ?auto_123475 ?auto_123478 ) ) ( not ( = ?auto_123476 ?auto_123477 ) ) ( not ( = ?auto_123476 ?auto_123478 ) ) ( not ( = ?auto_123477 ?auto_123478 ) ) ( not ( = ?auto_123479 ?auto_123480 ) ) ( not ( = ?auto_123479 ?auto_123478 ) ) ( not ( = ?auto_123480 ?auto_123478 ) ) ( not ( = ?auto_123474 ?auto_123480 ) ) ( not ( = ?auto_123474 ?auto_123479 ) ) ( not ( = ?auto_123475 ?auto_123480 ) ) ( not ( = ?auto_123475 ?auto_123479 ) ) ( not ( = ?auto_123476 ?auto_123480 ) ) ( not ( = ?auto_123476 ?auto_123479 ) ) ( not ( = ?auto_123477 ?auto_123480 ) ) ( not ( = ?auto_123477 ?auto_123479 ) ) ( ON ?auto_123479 ?auto_123481 ) ( not ( = ?auto_123474 ?auto_123481 ) ) ( not ( = ?auto_123475 ?auto_123481 ) ) ( not ( = ?auto_123476 ?auto_123481 ) ) ( not ( = ?auto_123477 ?auto_123481 ) ) ( not ( = ?auto_123478 ?auto_123481 ) ) ( not ( = ?auto_123479 ?auto_123481 ) ) ( not ( = ?auto_123480 ?auto_123481 ) ) ( ON ?auto_123480 ?auto_123479 ) ( ON-TABLE ?auto_123481 ) ( ON ?auto_123478 ?auto_123480 ) ( ON ?auto_123477 ?auto_123478 ) ( ON ?auto_123476 ?auto_123477 ) ( ON ?auto_123475 ?auto_123476 ) ( ON ?auto_123474 ?auto_123475 ) ( CLEAR ?auto_123474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123481 ?auto_123479 ?auto_123480 ?auto_123478 ?auto_123477 ?auto_123476 ?auto_123475 )
      ( MAKE-2PILE ?auto_123474 ?auto_123475 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123487 - BLOCK
      ?auto_123488 - BLOCK
      ?auto_123489 - BLOCK
      ?auto_123490 - BLOCK
      ?auto_123491 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_123491 ) ( CLEAR ?auto_123490 ) ( ON-TABLE ?auto_123487 ) ( ON ?auto_123488 ?auto_123487 ) ( ON ?auto_123489 ?auto_123488 ) ( ON ?auto_123490 ?auto_123489 ) ( not ( = ?auto_123487 ?auto_123488 ) ) ( not ( = ?auto_123487 ?auto_123489 ) ) ( not ( = ?auto_123487 ?auto_123490 ) ) ( not ( = ?auto_123487 ?auto_123491 ) ) ( not ( = ?auto_123488 ?auto_123489 ) ) ( not ( = ?auto_123488 ?auto_123490 ) ) ( not ( = ?auto_123488 ?auto_123491 ) ) ( not ( = ?auto_123489 ?auto_123490 ) ) ( not ( = ?auto_123489 ?auto_123491 ) ) ( not ( = ?auto_123490 ?auto_123491 ) ) )
    :subtasks
    ( ( !STACK ?auto_123491 ?auto_123490 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123492 - BLOCK
      ?auto_123493 - BLOCK
      ?auto_123494 - BLOCK
      ?auto_123495 - BLOCK
      ?auto_123496 - BLOCK
    )
    :vars
    (
      ?auto_123497 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_123495 ) ( ON-TABLE ?auto_123492 ) ( ON ?auto_123493 ?auto_123492 ) ( ON ?auto_123494 ?auto_123493 ) ( ON ?auto_123495 ?auto_123494 ) ( not ( = ?auto_123492 ?auto_123493 ) ) ( not ( = ?auto_123492 ?auto_123494 ) ) ( not ( = ?auto_123492 ?auto_123495 ) ) ( not ( = ?auto_123492 ?auto_123496 ) ) ( not ( = ?auto_123493 ?auto_123494 ) ) ( not ( = ?auto_123493 ?auto_123495 ) ) ( not ( = ?auto_123493 ?auto_123496 ) ) ( not ( = ?auto_123494 ?auto_123495 ) ) ( not ( = ?auto_123494 ?auto_123496 ) ) ( not ( = ?auto_123495 ?auto_123496 ) ) ( ON ?auto_123496 ?auto_123497 ) ( CLEAR ?auto_123496 ) ( HAND-EMPTY ) ( not ( = ?auto_123492 ?auto_123497 ) ) ( not ( = ?auto_123493 ?auto_123497 ) ) ( not ( = ?auto_123494 ?auto_123497 ) ) ( not ( = ?auto_123495 ?auto_123497 ) ) ( not ( = ?auto_123496 ?auto_123497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123496 ?auto_123497 )
      ( MAKE-5PILE ?auto_123492 ?auto_123493 ?auto_123494 ?auto_123495 ?auto_123496 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123498 - BLOCK
      ?auto_123499 - BLOCK
      ?auto_123500 - BLOCK
      ?auto_123501 - BLOCK
      ?auto_123502 - BLOCK
    )
    :vars
    (
      ?auto_123503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123498 ) ( ON ?auto_123499 ?auto_123498 ) ( ON ?auto_123500 ?auto_123499 ) ( not ( = ?auto_123498 ?auto_123499 ) ) ( not ( = ?auto_123498 ?auto_123500 ) ) ( not ( = ?auto_123498 ?auto_123501 ) ) ( not ( = ?auto_123498 ?auto_123502 ) ) ( not ( = ?auto_123499 ?auto_123500 ) ) ( not ( = ?auto_123499 ?auto_123501 ) ) ( not ( = ?auto_123499 ?auto_123502 ) ) ( not ( = ?auto_123500 ?auto_123501 ) ) ( not ( = ?auto_123500 ?auto_123502 ) ) ( not ( = ?auto_123501 ?auto_123502 ) ) ( ON ?auto_123502 ?auto_123503 ) ( CLEAR ?auto_123502 ) ( not ( = ?auto_123498 ?auto_123503 ) ) ( not ( = ?auto_123499 ?auto_123503 ) ) ( not ( = ?auto_123500 ?auto_123503 ) ) ( not ( = ?auto_123501 ?auto_123503 ) ) ( not ( = ?auto_123502 ?auto_123503 ) ) ( HOLDING ?auto_123501 ) ( CLEAR ?auto_123500 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123498 ?auto_123499 ?auto_123500 ?auto_123501 )
      ( MAKE-5PILE ?auto_123498 ?auto_123499 ?auto_123500 ?auto_123501 ?auto_123502 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123504 - BLOCK
      ?auto_123505 - BLOCK
      ?auto_123506 - BLOCK
      ?auto_123507 - BLOCK
      ?auto_123508 - BLOCK
    )
    :vars
    (
      ?auto_123509 - BLOCK
      ?auto_123510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123504 ) ( ON ?auto_123505 ?auto_123504 ) ( ON ?auto_123506 ?auto_123505 ) ( not ( = ?auto_123504 ?auto_123505 ) ) ( not ( = ?auto_123504 ?auto_123506 ) ) ( not ( = ?auto_123504 ?auto_123507 ) ) ( not ( = ?auto_123504 ?auto_123508 ) ) ( not ( = ?auto_123505 ?auto_123506 ) ) ( not ( = ?auto_123505 ?auto_123507 ) ) ( not ( = ?auto_123505 ?auto_123508 ) ) ( not ( = ?auto_123506 ?auto_123507 ) ) ( not ( = ?auto_123506 ?auto_123508 ) ) ( not ( = ?auto_123507 ?auto_123508 ) ) ( ON ?auto_123508 ?auto_123509 ) ( not ( = ?auto_123504 ?auto_123509 ) ) ( not ( = ?auto_123505 ?auto_123509 ) ) ( not ( = ?auto_123506 ?auto_123509 ) ) ( not ( = ?auto_123507 ?auto_123509 ) ) ( not ( = ?auto_123508 ?auto_123509 ) ) ( CLEAR ?auto_123506 ) ( ON ?auto_123507 ?auto_123508 ) ( CLEAR ?auto_123507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123510 ) ( ON ?auto_123509 ?auto_123510 ) ( not ( = ?auto_123510 ?auto_123509 ) ) ( not ( = ?auto_123510 ?auto_123508 ) ) ( not ( = ?auto_123510 ?auto_123507 ) ) ( not ( = ?auto_123504 ?auto_123510 ) ) ( not ( = ?auto_123505 ?auto_123510 ) ) ( not ( = ?auto_123506 ?auto_123510 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123510 ?auto_123509 ?auto_123508 )
      ( MAKE-5PILE ?auto_123504 ?auto_123505 ?auto_123506 ?auto_123507 ?auto_123508 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123511 - BLOCK
      ?auto_123512 - BLOCK
      ?auto_123513 - BLOCK
      ?auto_123514 - BLOCK
      ?auto_123515 - BLOCK
    )
    :vars
    (
      ?auto_123517 - BLOCK
      ?auto_123516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123511 ) ( ON ?auto_123512 ?auto_123511 ) ( not ( = ?auto_123511 ?auto_123512 ) ) ( not ( = ?auto_123511 ?auto_123513 ) ) ( not ( = ?auto_123511 ?auto_123514 ) ) ( not ( = ?auto_123511 ?auto_123515 ) ) ( not ( = ?auto_123512 ?auto_123513 ) ) ( not ( = ?auto_123512 ?auto_123514 ) ) ( not ( = ?auto_123512 ?auto_123515 ) ) ( not ( = ?auto_123513 ?auto_123514 ) ) ( not ( = ?auto_123513 ?auto_123515 ) ) ( not ( = ?auto_123514 ?auto_123515 ) ) ( ON ?auto_123515 ?auto_123517 ) ( not ( = ?auto_123511 ?auto_123517 ) ) ( not ( = ?auto_123512 ?auto_123517 ) ) ( not ( = ?auto_123513 ?auto_123517 ) ) ( not ( = ?auto_123514 ?auto_123517 ) ) ( not ( = ?auto_123515 ?auto_123517 ) ) ( ON ?auto_123514 ?auto_123515 ) ( CLEAR ?auto_123514 ) ( ON-TABLE ?auto_123516 ) ( ON ?auto_123517 ?auto_123516 ) ( not ( = ?auto_123516 ?auto_123517 ) ) ( not ( = ?auto_123516 ?auto_123515 ) ) ( not ( = ?auto_123516 ?auto_123514 ) ) ( not ( = ?auto_123511 ?auto_123516 ) ) ( not ( = ?auto_123512 ?auto_123516 ) ) ( not ( = ?auto_123513 ?auto_123516 ) ) ( HOLDING ?auto_123513 ) ( CLEAR ?auto_123512 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123511 ?auto_123512 ?auto_123513 )
      ( MAKE-5PILE ?auto_123511 ?auto_123512 ?auto_123513 ?auto_123514 ?auto_123515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123518 - BLOCK
      ?auto_123519 - BLOCK
      ?auto_123520 - BLOCK
      ?auto_123521 - BLOCK
      ?auto_123522 - BLOCK
    )
    :vars
    (
      ?auto_123523 - BLOCK
      ?auto_123524 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123518 ) ( ON ?auto_123519 ?auto_123518 ) ( not ( = ?auto_123518 ?auto_123519 ) ) ( not ( = ?auto_123518 ?auto_123520 ) ) ( not ( = ?auto_123518 ?auto_123521 ) ) ( not ( = ?auto_123518 ?auto_123522 ) ) ( not ( = ?auto_123519 ?auto_123520 ) ) ( not ( = ?auto_123519 ?auto_123521 ) ) ( not ( = ?auto_123519 ?auto_123522 ) ) ( not ( = ?auto_123520 ?auto_123521 ) ) ( not ( = ?auto_123520 ?auto_123522 ) ) ( not ( = ?auto_123521 ?auto_123522 ) ) ( ON ?auto_123522 ?auto_123523 ) ( not ( = ?auto_123518 ?auto_123523 ) ) ( not ( = ?auto_123519 ?auto_123523 ) ) ( not ( = ?auto_123520 ?auto_123523 ) ) ( not ( = ?auto_123521 ?auto_123523 ) ) ( not ( = ?auto_123522 ?auto_123523 ) ) ( ON ?auto_123521 ?auto_123522 ) ( ON-TABLE ?auto_123524 ) ( ON ?auto_123523 ?auto_123524 ) ( not ( = ?auto_123524 ?auto_123523 ) ) ( not ( = ?auto_123524 ?auto_123522 ) ) ( not ( = ?auto_123524 ?auto_123521 ) ) ( not ( = ?auto_123518 ?auto_123524 ) ) ( not ( = ?auto_123519 ?auto_123524 ) ) ( not ( = ?auto_123520 ?auto_123524 ) ) ( CLEAR ?auto_123519 ) ( ON ?auto_123520 ?auto_123521 ) ( CLEAR ?auto_123520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123524 ?auto_123523 ?auto_123522 ?auto_123521 )
      ( MAKE-5PILE ?auto_123518 ?auto_123519 ?auto_123520 ?auto_123521 ?auto_123522 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123525 - BLOCK
      ?auto_123526 - BLOCK
      ?auto_123527 - BLOCK
      ?auto_123528 - BLOCK
      ?auto_123529 - BLOCK
    )
    :vars
    (
      ?auto_123531 - BLOCK
      ?auto_123530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123525 ) ( not ( = ?auto_123525 ?auto_123526 ) ) ( not ( = ?auto_123525 ?auto_123527 ) ) ( not ( = ?auto_123525 ?auto_123528 ) ) ( not ( = ?auto_123525 ?auto_123529 ) ) ( not ( = ?auto_123526 ?auto_123527 ) ) ( not ( = ?auto_123526 ?auto_123528 ) ) ( not ( = ?auto_123526 ?auto_123529 ) ) ( not ( = ?auto_123527 ?auto_123528 ) ) ( not ( = ?auto_123527 ?auto_123529 ) ) ( not ( = ?auto_123528 ?auto_123529 ) ) ( ON ?auto_123529 ?auto_123531 ) ( not ( = ?auto_123525 ?auto_123531 ) ) ( not ( = ?auto_123526 ?auto_123531 ) ) ( not ( = ?auto_123527 ?auto_123531 ) ) ( not ( = ?auto_123528 ?auto_123531 ) ) ( not ( = ?auto_123529 ?auto_123531 ) ) ( ON ?auto_123528 ?auto_123529 ) ( ON-TABLE ?auto_123530 ) ( ON ?auto_123531 ?auto_123530 ) ( not ( = ?auto_123530 ?auto_123531 ) ) ( not ( = ?auto_123530 ?auto_123529 ) ) ( not ( = ?auto_123530 ?auto_123528 ) ) ( not ( = ?auto_123525 ?auto_123530 ) ) ( not ( = ?auto_123526 ?auto_123530 ) ) ( not ( = ?auto_123527 ?auto_123530 ) ) ( ON ?auto_123527 ?auto_123528 ) ( CLEAR ?auto_123527 ) ( HOLDING ?auto_123526 ) ( CLEAR ?auto_123525 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123525 ?auto_123526 )
      ( MAKE-5PILE ?auto_123525 ?auto_123526 ?auto_123527 ?auto_123528 ?auto_123529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123532 - BLOCK
      ?auto_123533 - BLOCK
      ?auto_123534 - BLOCK
      ?auto_123535 - BLOCK
      ?auto_123536 - BLOCK
    )
    :vars
    (
      ?auto_123538 - BLOCK
      ?auto_123537 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123532 ) ( not ( = ?auto_123532 ?auto_123533 ) ) ( not ( = ?auto_123532 ?auto_123534 ) ) ( not ( = ?auto_123532 ?auto_123535 ) ) ( not ( = ?auto_123532 ?auto_123536 ) ) ( not ( = ?auto_123533 ?auto_123534 ) ) ( not ( = ?auto_123533 ?auto_123535 ) ) ( not ( = ?auto_123533 ?auto_123536 ) ) ( not ( = ?auto_123534 ?auto_123535 ) ) ( not ( = ?auto_123534 ?auto_123536 ) ) ( not ( = ?auto_123535 ?auto_123536 ) ) ( ON ?auto_123536 ?auto_123538 ) ( not ( = ?auto_123532 ?auto_123538 ) ) ( not ( = ?auto_123533 ?auto_123538 ) ) ( not ( = ?auto_123534 ?auto_123538 ) ) ( not ( = ?auto_123535 ?auto_123538 ) ) ( not ( = ?auto_123536 ?auto_123538 ) ) ( ON ?auto_123535 ?auto_123536 ) ( ON-TABLE ?auto_123537 ) ( ON ?auto_123538 ?auto_123537 ) ( not ( = ?auto_123537 ?auto_123538 ) ) ( not ( = ?auto_123537 ?auto_123536 ) ) ( not ( = ?auto_123537 ?auto_123535 ) ) ( not ( = ?auto_123532 ?auto_123537 ) ) ( not ( = ?auto_123533 ?auto_123537 ) ) ( not ( = ?auto_123534 ?auto_123537 ) ) ( ON ?auto_123534 ?auto_123535 ) ( CLEAR ?auto_123532 ) ( ON ?auto_123533 ?auto_123534 ) ( CLEAR ?auto_123533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123537 ?auto_123538 ?auto_123536 ?auto_123535 ?auto_123534 )
      ( MAKE-5PILE ?auto_123532 ?auto_123533 ?auto_123534 ?auto_123535 ?auto_123536 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123539 - BLOCK
      ?auto_123540 - BLOCK
      ?auto_123541 - BLOCK
      ?auto_123542 - BLOCK
      ?auto_123543 - BLOCK
    )
    :vars
    (
      ?auto_123544 - BLOCK
      ?auto_123545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123539 ?auto_123540 ) ) ( not ( = ?auto_123539 ?auto_123541 ) ) ( not ( = ?auto_123539 ?auto_123542 ) ) ( not ( = ?auto_123539 ?auto_123543 ) ) ( not ( = ?auto_123540 ?auto_123541 ) ) ( not ( = ?auto_123540 ?auto_123542 ) ) ( not ( = ?auto_123540 ?auto_123543 ) ) ( not ( = ?auto_123541 ?auto_123542 ) ) ( not ( = ?auto_123541 ?auto_123543 ) ) ( not ( = ?auto_123542 ?auto_123543 ) ) ( ON ?auto_123543 ?auto_123544 ) ( not ( = ?auto_123539 ?auto_123544 ) ) ( not ( = ?auto_123540 ?auto_123544 ) ) ( not ( = ?auto_123541 ?auto_123544 ) ) ( not ( = ?auto_123542 ?auto_123544 ) ) ( not ( = ?auto_123543 ?auto_123544 ) ) ( ON ?auto_123542 ?auto_123543 ) ( ON-TABLE ?auto_123545 ) ( ON ?auto_123544 ?auto_123545 ) ( not ( = ?auto_123545 ?auto_123544 ) ) ( not ( = ?auto_123545 ?auto_123543 ) ) ( not ( = ?auto_123545 ?auto_123542 ) ) ( not ( = ?auto_123539 ?auto_123545 ) ) ( not ( = ?auto_123540 ?auto_123545 ) ) ( not ( = ?auto_123541 ?auto_123545 ) ) ( ON ?auto_123541 ?auto_123542 ) ( ON ?auto_123540 ?auto_123541 ) ( CLEAR ?auto_123540 ) ( HOLDING ?auto_123539 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123539 )
      ( MAKE-5PILE ?auto_123539 ?auto_123540 ?auto_123541 ?auto_123542 ?auto_123543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123546 - BLOCK
      ?auto_123547 - BLOCK
      ?auto_123548 - BLOCK
      ?auto_123549 - BLOCK
      ?auto_123550 - BLOCK
    )
    :vars
    (
      ?auto_123552 - BLOCK
      ?auto_123551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123546 ?auto_123547 ) ) ( not ( = ?auto_123546 ?auto_123548 ) ) ( not ( = ?auto_123546 ?auto_123549 ) ) ( not ( = ?auto_123546 ?auto_123550 ) ) ( not ( = ?auto_123547 ?auto_123548 ) ) ( not ( = ?auto_123547 ?auto_123549 ) ) ( not ( = ?auto_123547 ?auto_123550 ) ) ( not ( = ?auto_123548 ?auto_123549 ) ) ( not ( = ?auto_123548 ?auto_123550 ) ) ( not ( = ?auto_123549 ?auto_123550 ) ) ( ON ?auto_123550 ?auto_123552 ) ( not ( = ?auto_123546 ?auto_123552 ) ) ( not ( = ?auto_123547 ?auto_123552 ) ) ( not ( = ?auto_123548 ?auto_123552 ) ) ( not ( = ?auto_123549 ?auto_123552 ) ) ( not ( = ?auto_123550 ?auto_123552 ) ) ( ON ?auto_123549 ?auto_123550 ) ( ON-TABLE ?auto_123551 ) ( ON ?auto_123552 ?auto_123551 ) ( not ( = ?auto_123551 ?auto_123552 ) ) ( not ( = ?auto_123551 ?auto_123550 ) ) ( not ( = ?auto_123551 ?auto_123549 ) ) ( not ( = ?auto_123546 ?auto_123551 ) ) ( not ( = ?auto_123547 ?auto_123551 ) ) ( not ( = ?auto_123548 ?auto_123551 ) ) ( ON ?auto_123548 ?auto_123549 ) ( ON ?auto_123547 ?auto_123548 ) ( ON ?auto_123546 ?auto_123547 ) ( CLEAR ?auto_123546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123551 ?auto_123552 ?auto_123550 ?auto_123549 ?auto_123548 ?auto_123547 )
      ( MAKE-5PILE ?auto_123546 ?auto_123547 ?auto_123548 ?auto_123549 ?auto_123550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123553 - BLOCK
      ?auto_123554 - BLOCK
      ?auto_123555 - BLOCK
      ?auto_123556 - BLOCK
      ?auto_123557 - BLOCK
    )
    :vars
    (
      ?auto_123559 - BLOCK
      ?auto_123558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123553 ?auto_123554 ) ) ( not ( = ?auto_123553 ?auto_123555 ) ) ( not ( = ?auto_123553 ?auto_123556 ) ) ( not ( = ?auto_123553 ?auto_123557 ) ) ( not ( = ?auto_123554 ?auto_123555 ) ) ( not ( = ?auto_123554 ?auto_123556 ) ) ( not ( = ?auto_123554 ?auto_123557 ) ) ( not ( = ?auto_123555 ?auto_123556 ) ) ( not ( = ?auto_123555 ?auto_123557 ) ) ( not ( = ?auto_123556 ?auto_123557 ) ) ( ON ?auto_123557 ?auto_123559 ) ( not ( = ?auto_123553 ?auto_123559 ) ) ( not ( = ?auto_123554 ?auto_123559 ) ) ( not ( = ?auto_123555 ?auto_123559 ) ) ( not ( = ?auto_123556 ?auto_123559 ) ) ( not ( = ?auto_123557 ?auto_123559 ) ) ( ON ?auto_123556 ?auto_123557 ) ( ON-TABLE ?auto_123558 ) ( ON ?auto_123559 ?auto_123558 ) ( not ( = ?auto_123558 ?auto_123559 ) ) ( not ( = ?auto_123558 ?auto_123557 ) ) ( not ( = ?auto_123558 ?auto_123556 ) ) ( not ( = ?auto_123553 ?auto_123558 ) ) ( not ( = ?auto_123554 ?auto_123558 ) ) ( not ( = ?auto_123555 ?auto_123558 ) ) ( ON ?auto_123555 ?auto_123556 ) ( ON ?auto_123554 ?auto_123555 ) ( HOLDING ?auto_123553 ) ( CLEAR ?auto_123554 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123558 ?auto_123559 ?auto_123557 ?auto_123556 ?auto_123555 ?auto_123554 ?auto_123553 )
      ( MAKE-5PILE ?auto_123553 ?auto_123554 ?auto_123555 ?auto_123556 ?auto_123557 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123560 - BLOCK
      ?auto_123561 - BLOCK
      ?auto_123562 - BLOCK
      ?auto_123563 - BLOCK
      ?auto_123564 - BLOCK
    )
    :vars
    (
      ?auto_123565 - BLOCK
      ?auto_123566 - BLOCK
      ?auto_123567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123560 ?auto_123561 ) ) ( not ( = ?auto_123560 ?auto_123562 ) ) ( not ( = ?auto_123560 ?auto_123563 ) ) ( not ( = ?auto_123560 ?auto_123564 ) ) ( not ( = ?auto_123561 ?auto_123562 ) ) ( not ( = ?auto_123561 ?auto_123563 ) ) ( not ( = ?auto_123561 ?auto_123564 ) ) ( not ( = ?auto_123562 ?auto_123563 ) ) ( not ( = ?auto_123562 ?auto_123564 ) ) ( not ( = ?auto_123563 ?auto_123564 ) ) ( ON ?auto_123564 ?auto_123565 ) ( not ( = ?auto_123560 ?auto_123565 ) ) ( not ( = ?auto_123561 ?auto_123565 ) ) ( not ( = ?auto_123562 ?auto_123565 ) ) ( not ( = ?auto_123563 ?auto_123565 ) ) ( not ( = ?auto_123564 ?auto_123565 ) ) ( ON ?auto_123563 ?auto_123564 ) ( ON-TABLE ?auto_123566 ) ( ON ?auto_123565 ?auto_123566 ) ( not ( = ?auto_123566 ?auto_123565 ) ) ( not ( = ?auto_123566 ?auto_123564 ) ) ( not ( = ?auto_123566 ?auto_123563 ) ) ( not ( = ?auto_123560 ?auto_123566 ) ) ( not ( = ?auto_123561 ?auto_123566 ) ) ( not ( = ?auto_123562 ?auto_123566 ) ) ( ON ?auto_123562 ?auto_123563 ) ( ON ?auto_123561 ?auto_123562 ) ( CLEAR ?auto_123561 ) ( ON ?auto_123560 ?auto_123567 ) ( CLEAR ?auto_123560 ) ( HAND-EMPTY ) ( not ( = ?auto_123560 ?auto_123567 ) ) ( not ( = ?auto_123561 ?auto_123567 ) ) ( not ( = ?auto_123562 ?auto_123567 ) ) ( not ( = ?auto_123563 ?auto_123567 ) ) ( not ( = ?auto_123564 ?auto_123567 ) ) ( not ( = ?auto_123565 ?auto_123567 ) ) ( not ( = ?auto_123566 ?auto_123567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123560 ?auto_123567 )
      ( MAKE-5PILE ?auto_123560 ?auto_123561 ?auto_123562 ?auto_123563 ?auto_123564 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123568 - BLOCK
      ?auto_123569 - BLOCK
      ?auto_123570 - BLOCK
      ?auto_123571 - BLOCK
      ?auto_123572 - BLOCK
    )
    :vars
    (
      ?auto_123575 - BLOCK
      ?auto_123574 - BLOCK
      ?auto_123573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123568 ?auto_123569 ) ) ( not ( = ?auto_123568 ?auto_123570 ) ) ( not ( = ?auto_123568 ?auto_123571 ) ) ( not ( = ?auto_123568 ?auto_123572 ) ) ( not ( = ?auto_123569 ?auto_123570 ) ) ( not ( = ?auto_123569 ?auto_123571 ) ) ( not ( = ?auto_123569 ?auto_123572 ) ) ( not ( = ?auto_123570 ?auto_123571 ) ) ( not ( = ?auto_123570 ?auto_123572 ) ) ( not ( = ?auto_123571 ?auto_123572 ) ) ( ON ?auto_123572 ?auto_123575 ) ( not ( = ?auto_123568 ?auto_123575 ) ) ( not ( = ?auto_123569 ?auto_123575 ) ) ( not ( = ?auto_123570 ?auto_123575 ) ) ( not ( = ?auto_123571 ?auto_123575 ) ) ( not ( = ?auto_123572 ?auto_123575 ) ) ( ON ?auto_123571 ?auto_123572 ) ( ON-TABLE ?auto_123574 ) ( ON ?auto_123575 ?auto_123574 ) ( not ( = ?auto_123574 ?auto_123575 ) ) ( not ( = ?auto_123574 ?auto_123572 ) ) ( not ( = ?auto_123574 ?auto_123571 ) ) ( not ( = ?auto_123568 ?auto_123574 ) ) ( not ( = ?auto_123569 ?auto_123574 ) ) ( not ( = ?auto_123570 ?auto_123574 ) ) ( ON ?auto_123570 ?auto_123571 ) ( ON ?auto_123568 ?auto_123573 ) ( CLEAR ?auto_123568 ) ( not ( = ?auto_123568 ?auto_123573 ) ) ( not ( = ?auto_123569 ?auto_123573 ) ) ( not ( = ?auto_123570 ?auto_123573 ) ) ( not ( = ?auto_123571 ?auto_123573 ) ) ( not ( = ?auto_123572 ?auto_123573 ) ) ( not ( = ?auto_123575 ?auto_123573 ) ) ( not ( = ?auto_123574 ?auto_123573 ) ) ( HOLDING ?auto_123569 ) ( CLEAR ?auto_123570 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123574 ?auto_123575 ?auto_123572 ?auto_123571 ?auto_123570 ?auto_123569 )
      ( MAKE-5PILE ?auto_123568 ?auto_123569 ?auto_123570 ?auto_123571 ?auto_123572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123576 - BLOCK
      ?auto_123577 - BLOCK
      ?auto_123578 - BLOCK
      ?auto_123579 - BLOCK
      ?auto_123580 - BLOCK
    )
    :vars
    (
      ?auto_123581 - BLOCK
      ?auto_123582 - BLOCK
      ?auto_123583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123576 ?auto_123577 ) ) ( not ( = ?auto_123576 ?auto_123578 ) ) ( not ( = ?auto_123576 ?auto_123579 ) ) ( not ( = ?auto_123576 ?auto_123580 ) ) ( not ( = ?auto_123577 ?auto_123578 ) ) ( not ( = ?auto_123577 ?auto_123579 ) ) ( not ( = ?auto_123577 ?auto_123580 ) ) ( not ( = ?auto_123578 ?auto_123579 ) ) ( not ( = ?auto_123578 ?auto_123580 ) ) ( not ( = ?auto_123579 ?auto_123580 ) ) ( ON ?auto_123580 ?auto_123581 ) ( not ( = ?auto_123576 ?auto_123581 ) ) ( not ( = ?auto_123577 ?auto_123581 ) ) ( not ( = ?auto_123578 ?auto_123581 ) ) ( not ( = ?auto_123579 ?auto_123581 ) ) ( not ( = ?auto_123580 ?auto_123581 ) ) ( ON ?auto_123579 ?auto_123580 ) ( ON-TABLE ?auto_123582 ) ( ON ?auto_123581 ?auto_123582 ) ( not ( = ?auto_123582 ?auto_123581 ) ) ( not ( = ?auto_123582 ?auto_123580 ) ) ( not ( = ?auto_123582 ?auto_123579 ) ) ( not ( = ?auto_123576 ?auto_123582 ) ) ( not ( = ?auto_123577 ?auto_123582 ) ) ( not ( = ?auto_123578 ?auto_123582 ) ) ( ON ?auto_123578 ?auto_123579 ) ( ON ?auto_123576 ?auto_123583 ) ( not ( = ?auto_123576 ?auto_123583 ) ) ( not ( = ?auto_123577 ?auto_123583 ) ) ( not ( = ?auto_123578 ?auto_123583 ) ) ( not ( = ?auto_123579 ?auto_123583 ) ) ( not ( = ?auto_123580 ?auto_123583 ) ) ( not ( = ?auto_123581 ?auto_123583 ) ) ( not ( = ?auto_123582 ?auto_123583 ) ) ( CLEAR ?auto_123578 ) ( ON ?auto_123577 ?auto_123576 ) ( CLEAR ?auto_123577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123583 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123583 ?auto_123576 )
      ( MAKE-5PILE ?auto_123576 ?auto_123577 ?auto_123578 ?auto_123579 ?auto_123580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123584 - BLOCK
      ?auto_123585 - BLOCK
      ?auto_123586 - BLOCK
      ?auto_123587 - BLOCK
      ?auto_123588 - BLOCK
    )
    :vars
    (
      ?auto_123589 - BLOCK
      ?auto_123590 - BLOCK
      ?auto_123591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123584 ?auto_123585 ) ) ( not ( = ?auto_123584 ?auto_123586 ) ) ( not ( = ?auto_123584 ?auto_123587 ) ) ( not ( = ?auto_123584 ?auto_123588 ) ) ( not ( = ?auto_123585 ?auto_123586 ) ) ( not ( = ?auto_123585 ?auto_123587 ) ) ( not ( = ?auto_123585 ?auto_123588 ) ) ( not ( = ?auto_123586 ?auto_123587 ) ) ( not ( = ?auto_123586 ?auto_123588 ) ) ( not ( = ?auto_123587 ?auto_123588 ) ) ( ON ?auto_123588 ?auto_123589 ) ( not ( = ?auto_123584 ?auto_123589 ) ) ( not ( = ?auto_123585 ?auto_123589 ) ) ( not ( = ?auto_123586 ?auto_123589 ) ) ( not ( = ?auto_123587 ?auto_123589 ) ) ( not ( = ?auto_123588 ?auto_123589 ) ) ( ON ?auto_123587 ?auto_123588 ) ( ON-TABLE ?auto_123590 ) ( ON ?auto_123589 ?auto_123590 ) ( not ( = ?auto_123590 ?auto_123589 ) ) ( not ( = ?auto_123590 ?auto_123588 ) ) ( not ( = ?auto_123590 ?auto_123587 ) ) ( not ( = ?auto_123584 ?auto_123590 ) ) ( not ( = ?auto_123585 ?auto_123590 ) ) ( not ( = ?auto_123586 ?auto_123590 ) ) ( ON ?auto_123584 ?auto_123591 ) ( not ( = ?auto_123584 ?auto_123591 ) ) ( not ( = ?auto_123585 ?auto_123591 ) ) ( not ( = ?auto_123586 ?auto_123591 ) ) ( not ( = ?auto_123587 ?auto_123591 ) ) ( not ( = ?auto_123588 ?auto_123591 ) ) ( not ( = ?auto_123589 ?auto_123591 ) ) ( not ( = ?auto_123590 ?auto_123591 ) ) ( ON ?auto_123585 ?auto_123584 ) ( CLEAR ?auto_123585 ) ( ON-TABLE ?auto_123591 ) ( HOLDING ?auto_123586 ) ( CLEAR ?auto_123587 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123590 ?auto_123589 ?auto_123588 ?auto_123587 ?auto_123586 )
      ( MAKE-5PILE ?auto_123584 ?auto_123585 ?auto_123586 ?auto_123587 ?auto_123588 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123592 - BLOCK
      ?auto_123593 - BLOCK
      ?auto_123594 - BLOCK
      ?auto_123595 - BLOCK
      ?auto_123596 - BLOCK
    )
    :vars
    (
      ?auto_123599 - BLOCK
      ?auto_123598 - BLOCK
      ?auto_123597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123592 ?auto_123593 ) ) ( not ( = ?auto_123592 ?auto_123594 ) ) ( not ( = ?auto_123592 ?auto_123595 ) ) ( not ( = ?auto_123592 ?auto_123596 ) ) ( not ( = ?auto_123593 ?auto_123594 ) ) ( not ( = ?auto_123593 ?auto_123595 ) ) ( not ( = ?auto_123593 ?auto_123596 ) ) ( not ( = ?auto_123594 ?auto_123595 ) ) ( not ( = ?auto_123594 ?auto_123596 ) ) ( not ( = ?auto_123595 ?auto_123596 ) ) ( ON ?auto_123596 ?auto_123599 ) ( not ( = ?auto_123592 ?auto_123599 ) ) ( not ( = ?auto_123593 ?auto_123599 ) ) ( not ( = ?auto_123594 ?auto_123599 ) ) ( not ( = ?auto_123595 ?auto_123599 ) ) ( not ( = ?auto_123596 ?auto_123599 ) ) ( ON ?auto_123595 ?auto_123596 ) ( ON-TABLE ?auto_123598 ) ( ON ?auto_123599 ?auto_123598 ) ( not ( = ?auto_123598 ?auto_123599 ) ) ( not ( = ?auto_123598 ?auto_123596 ) ) ( not ( = ?auto_123598 ?auto_123595 ) ) ( not ( = ?auto_123592 ?auto_123598 ) ) ( not ( = ?auto_123593 ?auto_123598 ) ) ( not ( = ?auto_123594 ?auto_123598 ) ) ( ON ?auto_123592 ?auto_123597 ) ( not ( = ?auto_123592 ?auto_123597 ) ) ( not ( = ?auto_123593 ?auto_123597 ) ) ( not ( = ?auto_123594 ?auto_123597 ) ) ( not ( = ?auto_123595 ?auto_123597 ) ) ( not ( = ?auto_123596 ?auto_123597 ) ) ( not ( = ?auto_123599 ?auto_123597 ) ) ( not ( = ?auto_123598 ?auto_123597 ) ) ( ON ?auto_123593 ?auto_123592 ) ( ON-TABLE ?auto_123597 ) ( CLEAR ?auto_123595 ) ( ON ?auto_123594 ?auto_123593 ) ( CLEAR ?auto_123594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123597 ?auto_123592 ?auto_123593 )
      ( MAKE-5PILE ?auto_123592 ?auto_123593 ?auto_123594 ?auto_123595 ?auto_123596 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123600 - BLOCK
      ?auto_123601 - BLOCK
      ?auto_123602 - BLOCK
      ?auto_123603 - BLOCK
      ?auto_123604 - BLOCK
    )
    :vars
    (
      ?auto_123607 - BLOCK
      ?auto_123606 - BLOCK
      ?auto_123605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123600 ?auto_123601 ) ) ( not ( = ?auto_123600 ?auto_123602 ) ) ( not ( = ?auto_123600 ?auto_123603 ) ) ( not ( = ?auto_123600 ?auto_123604 ) ) ( not ( = ?auto_123601 ?auto_123602 ) ) ( not ( = ?auto_123601 ?auto_123603 ) ) ( not ( = ?auto_123601 ?auto_123604 ) ) ( not ( = ?auto_123602 ?auto_123603 ) ) ( not ( = ?auto_123602 ?auto_123604 ) ) ( not ( = ?auto_123603 ?auto_123604 ) ) ( ON ?auto_123604 ?auto_123607 ) ( not ( = ?auto_123600 ?auto_123607 ) ) ( not ( = ?auto_123601 ?auto_123607 ) ) ( not ( = ?auto_123602 ?auto_123607 ) ) ( not ( = ?auto_123603 ?auto_123607 ) ) ( not ( = ?auto_123604 ?auto_123607 ) ) ( ON-TABLE ?auto_123606 ) ( ON ?auto_123607 ?auto_123606 ) ( not ( = ?auto_123606 ?auto_123607 ) ) ( not ( = ?auto_123606 ?auto_123604 ) ) ( not ( = ?auto_123606 ?auto_123603 ) ) ( not ( = ?auto_123600 ?auto_123606 ) ) ( not ( = ?auto_123601 ?auto_123606 ) ) ( not ( = ?auto_123602 ?auto_123606 ) ) ( ON ?auto_123600 ?auto_123605 ) ( not ( = ?auto_123600 ?auto_123605 ) ) ( not ( = ?auto_123601 ?auto_123605 ) ) ( not ( = ?auto_123602 ?auto_123605 ) ) ( not ( = ?auto_123603 ?auto_123605 ) ) ( not ( = ?auto_123604 ?auto_123605 ) ) ( not ( = ?auto_123607 ?auto_123605 ) ) ( not ( = ?auto_123606 ?auto_123605 ) ) ( ON ?auto_123601 ?auto_123600 ) ( ON-TABLE ?auto_123605 ) ( ON ?auto_123602 ?auto_123601 ) ( CLEAR ?auto_123602 ) ( HOLDING ?auto_123603 ) ( CLEAR ?auto_123604 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123606 ?auto_123607 ?auto_123604 ?auto_123603 )
      ( MAKE-5PILE ?auto_123600 ?auto_123601 ?auto_123602 ?auto_123603 ?auto_123604 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123608 - BLOCK
      ?auto_123609 - BLOCK
      ?auto_123610 - BLOCK
      ?auto_123611 - BLOCK
      ?auto_123612 - BLOCK
    )
    :vars
    (
      ?auto_123615 - BLOCK
      ?auto_123613 - BLOCK
      ?auto_123614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123608 ?auto_123609 ) ) ( not ( = ?auto_123608 ?auto_123610 ) ) ( not ( = ?auto_123608 ?auto_123611 ) ) ( not ( = ?auto_123608 ?auto_123612 ) ) ( not ( = ?auto_123609 ?auto_123610 ) ) ( not ( = ?auto_123609 ?auto_123611 ) ) ( not ( = ?auto_123609 ?auto_123612 ) ) ( not ( = ?auto_123610 ?auto_123611 ) ) ( not ( = ?auto_123610 ?auto_123612 ) ) ( not ( = ?auto_123611 ?auto_123612 ) ) ( ON ?auto_123612 ?auto_123615 ) ( not ( = ?auto_123608 ?auto_123615 ) ) ( not ( = ?auto_123609 ?auto_123615 ) ) ( not ( = ?auto_123610 ?auto_123615 ) ) ( not ( = ?auto_123611 ?auto_123615 ) ) ( not ( = ?auto_123612 ?auto_123615 ) ) ( ON-TABLE ?auto_123613 ) ( ON ?auto_123615 ?auto_123613 ) ( not ( = ?auto_123613 ?auto_123615 ) ) ( not ( = ?auto_123613 ?auto_123612 ) ) ( not ( = ?auto_123613 ?auto_123611 ) ) ( not ( = ?auto_123608 ?auto_123613 ) ) ( not ( = ?auto_123609 ?auto_123613 ) ) ( not ( = ?auto_123610 ?auto_123613 ) ) ( ON ?auto_123608 ?auto_123614 ) ( not ( = ?auto_123608 ?auto_123614 ) ) ( not ( = ?auto_123609 ?auto_123614 ) ) ( not ( = ?auto_123610 ?auto_123614 ) ) ( not ( = ?auto_123611 ?auto_123614 ) ) ( not ( = ?auto_123612 ?auto_123614 ) ) ( not ( = ?auto_123615 ?auto_123614 ) ) ( not ( = ?auto_123613 ?auto_123614 ) ) ( ON ?auto_123609 ?auto_123608 ) ( ON-TABLE ?auto_123614 ) ( ON ?auto_123610 ?auto_123609 ) ( CLEAR ?auto_123612 ) ( ON ?auto_123611 ?auto_123610 ) ( CLEAR ?auto_123611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123614 ?auto_123608 ?auto_123609 ?auto_123610 )
      ( MAKE-5PILE ?auto_123608 ?auto_123609 ?auto_123610 ?auto_123611 ?auto_123612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123616 - BLOCK
      ?auto_123617 - BLOCK
      ?auto_123618 - BLOCK
      ?auto_123619 - BLOCK
      ?auto_123620 - BLOCK
    )
    :vars
    (
      ?auto_123622 - BLOCK
      ?auto_123623 - BLOCK
      ?auto_123621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123616 ?auto_123617 ) ) ( not ( = ?auto_123616 ?auto_123618 ) ) ( not ( = ?auto_123616 ?auto_123619 ) ) ( not ( = ?auto_123616 ?auto_123620 ) ) ( not ( = ?auto_123617 ?auto_123618 ) ) ( not ( = ?auto_123617 ?auto_123619 ) ) ( not ( = ?auto_123617 ?auto_123620 ) ) ( not ( = ?auto_123618 ?auto_123619 ) ) ( not ( = ?auto_123618 ?auto_123620 ) ) ( not ( = ?auto_123619 ?auto_123620 ) ) ( not ( = ?auto_123616 ?auto_123622 ) ) ( not ( = ?auto_123617 ?auto_123622 ) ) ( not ( = ?auto_123618 ?auto_123622 ) ) ( not ( = ?auto_123619 ?auto_123622 ) ) ( not ( = ?auto_123620 ?auto_123622 ) ) ( ON-TABLE ?auto_123623 ) ( ON ?auto_123622 ?auto_123623 ) ( not ( = ?auto_123623 ?auto_123622 ) ) ( not ( = ?auto_123623 ?auto_123620 ) ) ( not ( = ?auto_123623 ?auto_123619 ) ) ( not ( = ?auto_123616 ?auto_123623 ) ) ( not ( = ?auto_123617 ?auto_123623 ) ) ( not ( = ?auto_123618 ?auto_123623 ) ) ( ON ?auto_123616 ?auto_123621 ) ( not ( = ?auto_123616 ?auto_123621 ) ) ( not ( = ?auto_123617 ?auto_123621 ) ) ( not ( = ?auto_123618 ?auto_123621 ) ) ( not ( = ?auto_123619 ?auto_123621 ) ) ( not ( = ?auto_123620 ?auto_123621 ) ) ( not ( = ?auto_123622 ?auto_123621 ) ) ( not ( = ?auto_123623 ?auto_123621 ) ) ( ON ?auto_123617 ?auto_123616 ) ( ON-TABLE ?auto_123621 ) ( ON ?auto_123618 ?auto_123617 ) ( ON ?auto_123619 ?auto_123618 ) ( CLEAR ?auto_123619 ) ( HOLDING ?auto_123620 ) ( CLEAR ?auto_123622 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123623 ?auto_123622 ?auto_123620 )
      ( MAKE-5PILE ?auto_123616 ?auto_123617 ?auto_123618 ?auto_123619 ?auto_123620 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123624 - BLOCK
      ?auto_123625 - BLOCK
      ?auto_123626 - BLOCK
      ?auto_123627 - BLOCK
      ?auto_123628 - BLOCK
    )
    :vars
    (
      ?auto_123629 - BLOCK
      ?auto_123631 - BLOCK
      ?auto_123630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123624 ?auto_123625 ) ) ( not ( = ?auto_123624 ?auto_123626 ) ) ( not ( = ?auto_123624 ?auto_123627 ) ) ( not ( = ?auto_123624 ?auto_123628 ) ) ( not ( = ?auto_123625 ?auto_123626 ) ) ( not ( = ?auto_123625 ?auto_123627 ) ) ( not ( = ?auto_123625 ?auto_123628 ) ) ( not ( = ?auto_123626 ?auto_123627 ) ) ( not ( = ?auto_123626 ?auto_123628 ) ) ( not ( = ?auto_123627 ?auto_123628 ) ) ( not ( = ?auto_123624 ?auto_123629 ) ) ( not ( = ?auto_123625 ?auto_123629 ) ) ( not ( = ?auto_123626 ?auto_123629 ) ) ( not ( = ?auto_123627 ?auto_123629 ) ) ( not ( = ?auto_123628 ?auto_123629 ) ) ( ON-TABLE ?auto_123631 ) ( ON ?auto_123629 ?auto_123631 ) ( not ( = ?auto_123631 ?auto_123629 ) ) ( not ( = ?auto_123631 ?auto_123628 ) ) ( not ( = ?auto_123631 ?auto_123627 ) ) ( not ( = ?auto_123624 ?auto_123631 ) ) ( not ( = ?auto_123625 ?auto_123631 ) ) ( not ( = ?auto_123626 ?auto_123631 ) ) ( ON ?auto_123624 ?auto_123630 ) ( not ( = ?auto_123624 ?auto_123630 ) ) ( not ( = ?auto_123625 ?auto_123630 ) ) ( not ( = ?auto_123626 ?auto_123630 ) ) ( not ( = ?auto_123627 ?auto_123630 ) ) ( not ( = ?auto_123628 ?auto_123630 ) ) ( not ( = ?auto_123629 ?auto_123630 ) ) ( not ( = ?auto_123631 ?auto_123630 ) ) ( ON ?auto_123625 ?auto_123624 ) ( ON-TABLE ?auto_123630 ) ( ON ?auto_123626 ?auto_123625 ) ( ON ?auto_123627 ?auto_123626 ) ( CLEAR ?auto_123629 ) ( ON ?auto_123628 ?auto_123627 ) ( CLEAR ?auto_123628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123630 ?auto_123624 ?auto_123625 ?auto_123626 ?auto_123627 )
      ( MAKE-5PILE ?auto_123624 ?auto_123625 ?auto_123626 ?auto_123627 ?auto_123628 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123632 - BLOCK
      ?auto_123633 - BLOCK
      ?auto_123634 - BLOCK
      ?auto_123635 - BLOCK
      ?auto_123636 - BLOCK
    )
    :vars
    (
      ?auto_123639 - BLOCK
      ?auto_123637 - BLOCK
      ?auto_123638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123632 ?auto_123633 ) ) ( not ( = ?auto_123632 ?auto_123634 ) ) ( not ( = ?auto_123632 ?auto_123635 ) ) ( not ( = ?auto_123632 ?auto_123636 ) ) ( not ( = ?auto_123633 ?auto_123634 ) ) ( not ( = ?auto_123633 ?auto_123635 ) ) ( not ( = ?auto_123633 ?auto_123636 ) ) ( not ( = ?auto_123634 ?auto_123635 ) ) ( not ( = ?auto_123634 ?auto_123636 ) ) ( not ( = ?auto_123635 ?auto_123636 ) ) ( not ( = ?auto_123632 ?auto_123639 ) ) ( not ( = ?auto_123633 ?auto_123639 ) ) ( not ( = ?auto_123634 ?auto_123639 ) ) ( not ( = ?auto_123635 ?auto_123639 ) ) ( not ( = ?auto_123636 ?auto_123639 ) ) ( ON-TABLE ?auto_123637 ) ( not ( = ?auto_123637 ?auto_123639 ) ) ( not ( = ?auto_123637 ?auto_123636 ) ) ( not ( = ?auto_123637 ?auto_123635 ) ) ( not ( = ?auto_123632 ?auto_123637 ) ) ( not ( = ?auto_123633 ?auto_123637 ) ) ( not ( = ?auto_123634 ?auto_123637 ) ) ( ON ?auto_123632 ?auto_123638 ) ( not ( = ?auto_123632 ?auto_123638 ) ) ( not ( = ?auto_123633 ?auto_123638 ) ) ( not ( = ?auto_123634 ?auto_123638 ) ) ( not ( = ?auto_123635 ?auto_123638 ) ) ( not ( = ?auto_123636 ?auto_123638 ) ) ( not ( = ?auto_123639 ?auto_123638 ) ) ( not ( = ?auto_123637 ?auto_123638 ) ) ( ON ?auto_123633 ?auto_123632 ) ( ON-TABLE ?auto_123638 ) ( ON ?auto_123634 ?auto_123633 ) ( ON ?auto_123635 ?auto_123634 ) ( ON ?auto_123636 ?auto_123635 ) ( CLEAR ?auto_123636 ) ( HOLDING ?auto_123639 ) ( CLEAR ?auto_123637 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123637 ?auto_123639 )
      ( MAKE-5PILE ?auto_123632 ?auto_123633 ?auto_123634 ?auto_123635 ?auto_123636 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123640 - BLOCK
      ?auto_123641 - BLOCK
      ?auto_123642 - BLOCK
      ?auto_123643 - BLOCK
      ?auto_123644 - BLOCK
    )
    :vars
    (
      ?auto_123646 - BLOCK
      ?auto_123645 - BLOCK
      ?auto_123647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123640 ?auto_123641 ) ) ( not ( = ?auto_123640 ?auto_123642 ) ) ( not ( = ?auto_123640 ?auto_123643 ) ) ( not ( = ?auto_123640 ?auto_123644 ) ) ( not ( = ?auto_123641 ?auto_123642 ) ) ( not ( = ?auto_123641 ?auto_123643 ) ) ( not ( = ?auto_123641 ?auto_123644 ) ) ( not ( = ?auto_123642 ?auto_123643 ) ) ( not ( = ?auto_123642 ?auto_123644 ) ) ( not ( = ?auto_123643 ?auto_123644 ) ) ( not ( = ?auto_123640 ?auto_123646 ) ) ( not ( = ?auto_123641 ?auto_123646 ) ) ( not ( = ?auto_123642 ?auto_123646 ) ) ( not ( = ?auto_123643 ?auto_123646 ) ) ( not ( = ?auto_123644 ?auto_123646 ) ) ( ON-TABLE ?auto_123645 ) ( not ( = ?auto_123645 ?auto_123646 ) ) ( not ( = ?auto_123645 ?auto_123644 ) ) ( not ( = ?auto_123645 ?auto_123643 ) ) ( not ( = ?auto_123640 ?auto_123645 ) ) ( not ( = ?auto_123641 ?auto_123645 ) ) ( not ( = ?auto_123642 ?auto_123645 ) ) ( ON ?auto_123640 ?auto_123647 ) ( not ( = ?auto_123640 ?auto_123647 ) ) ( not ( = ?auto_123641 ?auto_123647 ) ) ( not ( = ?auto_123642 ?auto_123647 ) ) ( not ( = ?auto_123643 ?auto_123647 ) ) ( not ( = ?auto_123644 ?auto_123647 ) ) ( not ( = ?auto_123646 ?auto_123647 ) ) ( not ( = ?auto_123645 ?auto_123647 ) ) ( ON ?auto_123641 ?auto_123640 ) ( ON-TABLE ?auto_123647 ) ( ON ?auto_123642 ?auto_123641 ) ( ON ?auto_123643 ?auto_123642 ) ( ON ?auto_123644 ?auto_123643 ) ( CLEAR ?auto_123645 ) ( ON ?auto_123646 ?auto_123644 ) ( CLEAR ?auto_123646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123647 ?auto_123640 ?auto_123641 ?auto_123642 ?auto_123643 ?auto_123644 )
      ( MAKE-5PILE ?auto_123640 ?auto_123641 ?auto_123642 ?auto_123643 ?auto_123644 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123648 - BLOCK
      ?auto_123649 - BLOCK
      ?auto_123650 - BLOCK
      ?auto_123651 - BLOCK
      ?auto_123652 - BLOCK
    )
    :vars
    (
      ?auto_123655 - BLOCK
      ?auto_123654 - BLOCK
      ?auto_123653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123648 ?auto_123649 ) ) ( not ( = ?auto_123648 ?auto_123650 ) ) ( not ( = ?auto_123648 ?auto_123651 ) ) ( not ( = ?auto_123648 ?auto_123652 ) ) ( not ( = ?auto_123649 ?auto_123650 ) ) ( not ( = ?auto_123649 ?auto_123651 ) ) ( not ( = ?auto_123649 ?auto_123652 ) ) ( not ( = ?auto_123650 ?auto_123651 ) ) ( not ( = ?auto_123650 ?auto_123652 ) ) ( not ( = ?auto_123651 ?auto_123652 ) ) ( not ( = ?auto_123648 ?auto_123655 ) ) ( not ( = ?auto_123649 ?auto_123655 ) ) ( not ( = ?auto_123650 ?auto_123655 ) ) ( not ( = ?auto_123651 ?auto_123655 ) ) ( not ( = ?auto_123652 ?auto_123655 ) ) ( not ( = ?auto_123654 ?auto_123655 ) ) ( not ( = ?auto_123654 ?auto_123652 ) ) ( not ( = ?auto_123654 ?auto_123651 ) ) ( not ( = ?auto_123648 ?auto_123654 ) ) ( not ( = ?auto_123649 ?auto_123654 ) ) ( not ( = ?auto_123650 ?auto_123654 ) ) ( ON ?auto_123648 ?auto_123653 ) ( not ( = ?auto_123648 ?auto_123653 ) ) ( not ( = ?auto_123649 ?auto_123653 ) ) ( not ( = ?auto_123650 ?auto_123653 ) ) ( not ( = ?auto_123651 ?auto_123653 ) ) ( not ( = ?auto_123652 ?auto_123653 ) ) ( not ( = ?auto_123655 ?auto_123653 ) ) ( not ( = ?auto_123654 ?auto_123653 ) ) ( ON ?auto_123649 ?auto_123648 ) ( ON-TABLE ?auto_123653 ) ( ON ?auto_123650 ?auto_123649 ) ( ON ?auto_123651 ?auto_123650 ) ( ON ?auto_123652 ?auto_123651 ) ( ON ?auto_123655 ?auto_123652 ) ( CLEAR ?auto_123655 ) ( HOLDING ?auto_123654 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123654 )
      ( MAKE-5PILE ?auto_123648 ?auto_123649 ?auto_123650 ?auto_123651 ?auto_123652 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_123656 - BLOCK
      ?auto_123657 - BLOCK
      ?auto_123658 - BLOCK
      ?auto_123659 - BLOCK
      ?auto_123660 - BLOCK
    )
    :vars
    (
      ?auto_123663 - BLOCK
      ?auto_123662 - BLOCK
      ?auto_123661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123656 ?auto_123657 ) ) ( not ( = ?auto_123656 ?auto_123658 ) ) ( not ( = ?auto_123656 ?auto_123659 ) ) ( not ( = ?auto_123656 ?auto_123660 ) ) ( not ( = ?auto_123657 ?auto_123658 ) ) ( not ( = ?auto_123657 ?auto_123659 ) ) ( not ( = ?auto_123657 ?auto_123660 ) ) ( not ( = ?auto_123658 ?auto_123659 ) ) ( not ( = ?auto_123658 ?auto_123660 ) ) ( not ( = ?auto_123659 ?auto_123660 ) ) ( not ( = ?auto_123656 ?auto_123663 ) ) ( not ( = ?auto_123657 ?auto_123663 ) ) ( not ( = ?auto_123658 ?auto_123663 ) ) ( not ( = ?auto_123659 ?auto_123663 ) ) ( not ( = ?auto_123660 ?auto_123663 ) ) ( not ( = ?auto_123662 ?auto_123663 ) ) ( not ( = ?auto_123662 ?auto_123660 ) ) ( not ( = ?auto_123662 ?auto_123659 ) ) ( not ( = ?auto_123656 ?auto_123662 ) ) ( not ( = ?auto_123657 ?auto_123662 ) ) ( not ( = ?auto_123658 ?auto_123662 ) ) ( ON ?auto_123656 ?auto_123661 ) ( not ( = ?auto_123656 ?auto_123661 ) ) ( not ( = ?auto_123657 ?auto_123661 ) ) ( not ( = ?auto_123658 ?auto_123661 ) ) ( not ( = ?auto_123659 ?auto_123661 ) ) ( not ( = ?auto_123660 ?auto_123661 ) ) ( not ( = ?auto_123663 ?auto_123661 ) ) ( not ( = ?auto_123662 ?auto_123661 ) ) ( ON ?auto_123657 ?auto_123656 ) ( ON-TABLE ?auto_123661 ) ( ON ?auto_123658 ?auto_123657 ) ( ON ?auto_123659 ?auto_123658 ) ( ON ?auto_123660 ?auto_123659 ) ( ON ?auto_123663 ?auto_123660 ) ( ON ?auto_123662 ?auto_123663 ) ( CLEAR ?auto_123662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123661 ?auto_123656 ?auto_123657 ?auto_123658 ?auto_123659 ?auto_123660 ?auto_123663 )
      ( MAKE-5PILE ?auto_123656 ?auto_123657 ?auto_123658 ?auto_123659 ?auto_123660 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123665 - BLOCK
    )
    :vars
    (
      ?auto_123666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123666 ?auto_123665 ) ( CLEAR ?auto_123666 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123665 ) ( not ( = ?auto_123665 ?auto_123666 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123666 ?auto_123665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123667 - BLOCK
    )
    :vars
    (
      ?auto_123668 - BLOCK
      ?auto_123669 - BLOCK
      ?auto_123670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123668 ?auto_123667 ) ( CLEAR ?auto_123668 ) ( ON-TABLE ?auto_123667 ) ( not ( = ?auto_123667 ?auto_123668 ) ) ( HOLDING ?auto_123669 ) ( CLEAR ?auto_123670 ) ( not ( = ?auto_123667 ?auto_123669 ) ) ( not ( = ?auto_123667 ?auto_123670 ) ) ( not ( = ?auto_123668 ?auto_123669 ) ) ( not ( = ?auto_123668 ?auto_123670 ) ) ( not ( = ?auto_123669 ?auto_123670 ) ) )
    :subtasks
    ( ( !STACK ?auto_123669 ?auto_123670 )
      ( MAKE-1PILE ?auto_123667 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123671 - BLOCK
    )
    :vars
    (
      ?auto_123672 - BLOCK
      ?auto_123673 - BLOCK
      ?auto_123674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123672 ?auto_123671 ) ( ON-TABLE ?auto_123671 ) ( not ( = ?auto_123671 ?auto_123672 ) ) ( CLEAR ?auto_123673 ) ( not ( = ?auto_123671 ?auto_123674 ) ) ( not ( = ?auto_123671 ?auto_123673 ) ) ( not ( = ?auto_123672 ?auto_123674 ) ) ( not ( = ?auto_123672 ?auto_123673 ) ) ( not ( = ?auto_123674 ?auto_123673 ) ) ( ON ?auto_123674 ?auto_123672 ) ( CLEAR ?auto_123674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123671 ?auto_123672 )
      ( MAKE-1PILE ?auto_123671 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123675 - BLOCK
    )
    :vars
    (
      ?auto_123677 - BLOCK
      ?auto_123678 - BLOCK
      ?auto_123676 - BLOCK
      ?auto_123679 - BLOCK
      ?auto_123680 - BLOCK
      ?auto_123681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123677 ?auto_123675 ) ( ON-TABLE ?auto_123675 ) ( not ( = ?auto_123675 ?auto_123677 ) ) ( not ( = ?auto_123675 ?auto_123678 ) ) ( not ( = ?auto_123675 ?auto_123676 ) ) ( not ( = ?auto_123677 ?auto_123678 ) ) ( not ( = ?auto_123677 ?auto_123676 ) ) ( not ( = ?auto_123678 ?auto_123676 ) ) ( ON ?auto_123678 ?auto_123677 ) ( CLEAR ?auto_123678 ) ( HOLDING ?auto_123676 ) ( CLEAR ?auto_123679 ) ( ON-TABLE ?auto_123680 ) ( ON ?auto_123681 ?auto_123680 ) ( ON ?auto_123679 ?auto_123681 ) ( not ( = ?auto_123680 ?auto_123681 ) ) ( not ( = ?auto_123680 ?auto_123679 ) ) ( not ( = ?auto_123680 ?auto_123676 ) ) ( not ( = ?auto_123681 ?auto_123679 ) ) ( not ( = ?auto_123681 ?auto_123676 ) ) ( not ( = ?auto_123679 ?auto_123676 ) ) ( not ( = ?auto_123675 ?auto_123679 ) ) ( not ( = ?auto_123675 ?auto_123680 ) ) ( not ( = ?auto_123675 ?auto_123681 ) ) ( not ( = ?auto_123677 ?auto_123679 ) ) ( not ( = ?auto_123677 ?auto_123680 ) ) ( not ( = ?auto_123677 ?auto_123681 ) ) ( not ( = ?auto_123678 ?auto_123679 ) ) ( not ( = ?auto_123678 ?auto_123680 ) ) ( not ( = ?auto_123678 ?auto_123681 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123680 ?auto_123681 ?auto_123679 ?auto_123676 )
      ( MAKE-1PILE ?auto_123675 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123682 - BLOCK
    )
    :vars
    (
      ?auto_123686 - BLOCK
      ?auto_123685 - BLOCK
      ?auto_123684 - BLOCK
      ?auto_123683 - BLOCK
      ?auto_123688 - BLOCK
      ?auto_123687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123686 ?auto_123682 ) ( ON-TABLE ?auto_123682 ) ( not ( = ?auto_123682 ?auto_123686 ) ) ( not ( = ?auto_123682 ?auto_123685 ) ) ( not ( = ?auto_123682 ?auto_123684 ) ) ( not ( = ?auto_123686 ?auto_123685 ) ) ( not ( = ?auto_123686 ?auto_123684 ) ) ( not ( = ?auto_123685 ?auto_123684 ) ) ( ON ?auto_123685 ?auto_123686 ) ( CLEAR ?auto_123683 ) ( ON-TABLE ?auto_123688 ) ( ON ?auto_123687 ?auto_123688 ) ( ON ?auto_123683 ?auto_123687 ) ( not ( = ?auto_123688 ?auto_123687 ) ) ( not ( = ?auto_123688 ?auto_123683 ) ) ( not ( = ?auto_123688 ?auto_123684 ) ) ( not ( = ?auto_123687 ?auto_123683 ) ) ( not ( = ?auto_123687 ?auto_123684 ) ) ( not ( = ?auto_123683 ?auto_123684 ) ) ( not ( = ?auto_123682 ?auto_123683 ) ) ( not ( = ?auto_123682 ?auto_123688 ) ) ( not ( = ?auto_123682 ?auto_123687 ) ) ( not ( = ?auto_123686 ?auto_123683 ) ) ( not ( = ?auto_123686 ?auto_123688 ) ) ( not ( = ?auto_123686 ?auto_123687 ) ) ( not ( = ?auto_123685 ?auto_123683 ) ) ( not ( = ?auto_123685 ?auto_123688 ) ) ( not ( = ?auto_123685 ?auto_123687 ) ) ( ON ?auto_123684 ?auto_123685 ) ( CLEAR ?auto_123684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123682 ?auto_123686 ?auto_123685 )
      ( MAKE-1PILE ?auto_123682 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123689 - BLOCK
    )
    :vars
    (
      ?auto_123690 - BLOCK
      ?auto_123694 - BLOCK
      ?auto_123695 - BLOCK
      ?auto_123692 - BLOCK
      ?auto_123693 - BLOCK
      ?auto_123691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123690 ?auto_123689 ) ( ON-TABLE ?auto_123689 ) ( not ( = ?auto_123689 ?auto_123690 ) ) ( not ( = ?auto_123689 ?auto_123694 ) ) ( not ( = ?auto_123689 ?auto_123695 ) ) ( not ( = ?auto_123690 ?auto_123694 ) ) ( not ( = ?auto_123690 ?auto_123695 ) ) ( not ( = ?auto_123694 ?auto_123695 ) ) ( ON ?auto_123694 ?auto_123690 ) ( ON-TABLE ?auto_123692 ) ( ON ?auto_123693 ?auto_123692 ) ( not ( = ?auto_123692 ?auto_123693 ) ) ( not ( = ?auto_123692 ?auto_123691 ) ) ( not ( = ?auto_123692 ?auto_123695 ) ) ( not ( = ?auto_123693 ?auto_123691 ) ) ( not ( = ?auto_123693 ?auto_123695 ) ) ( not ( = ?auto_123691 ?auto_123695 ) ) ( not ( = ?auto_123689 ?auto_123691 ) ) ( not ( = ?auto_123689 ?auto_123692 ) ) ( not ( = ?auto_123689 ?auto_123693 ) ) ( not ( = ?auto_123690 ?auto_123691 ) ) ( not ( = ?auto_123690 ?auto_123692 ) ) ( not ( = ?auto_123690 ?auto_123693 ) ) ( not ( = ?auto_123694 ?auto_123691 ) ) ( not ( = ?auto_123694 ?auto_123692 ) ) ( not ( = ?auto_123694 ?auto_123693 ) ) ( ON ?auto_123695 ?auto_123694 ) ( CLEAR ?auto_123695 ) ( HOLDING ?auto_123691 ) ( CLEAR ?auto_123693 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123692 ?auto_123693 ?auto_123691 )
      ( MAKE-1PILE ?auto_123689 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123696 - BLOCK
    )
    :vars
    (
      ?auto_123697 - BLOCK
      ?auto_123701 - BLOCK
      ?auto_123702 - BLOCK
      ?auto_123698 - BLOCK
      ?auto_123699 - BLOCK
      ?auto_123700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123697 ?auto_123696 ) ( ON-TABLE ?auto_123696 ) ( not ( = ?auto_123696 ?auto_123697 ) ) ( not ( = ?auto_123696 ?auto_123701 ) ) ( not ( = ?auto_123696 ?auto_123702 ) ) ( not ( = ?auto_123697 ?auto_123701 ) ) ( not ( = ?auto_123697 ?auto_123702 ) ) ( not ( = ?auto_123701 ?auto_123702 ) ) ( ON ?auto_123701 ?auto_123697 ) ( ON-TABLE ?auto_123698 ) ( ON ?auto_123699 ?auto_123698 ) ( not ( = ?auto_123698 ?auto_123699 ) ) ( not ( = ?auto_123698 ?auto_123700 ) ) ( not ( = ?auto_123698 ?auto_123702 ) ) ( not ( = ?auto_123699 ?auto_123700 ) ) ( not ( = ?auto_123699 ?auto_123702 ) ) ( not ( = ?auto_123700 ?auto_123702 ) ) ( not ( = ?auto_123696 ?auto_123700 ) ) ( not ( = ?auto_123696 ?auto_123698 ) ) ( not ( = ?auto_123696 ?auto_123699 ) ) ( not ( = ?auto_123697 ?auto_123700 ) ) ( not ( = ?auto_123697 ?auto_123698 ) ) ( not ( = ?auto_123697 ?auto_123699 ) ) ( not ( = ?auto_123701 ?auto_123700 ) ) ( not ( = ?auto_123701 ?auto_123698 ) ) ( not ( = ?auto_123701 ?auto_123699 ) ) ( ON ?auto_123702 ?auto_123701 ) ( CLEAR ?auto_123699 ) ( ON ?auto_123700 ?auto_123702 ) ( CLEAR ?auto_123700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123696 ?auto_123697 ?auto_123701 ?auto_123702 )
      ( MAKE-1PILE ?auto_123696 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123703 - BLOCK
    )
    :vars
    (
      ?auto_123709 - BLOCK
      ?auto_123707 - BLOCK
      ?auto_123708 - BLOCK
      ?auto_123704 - BLOCK
      ?auto_123706 - BLOCK
      ?auto_123705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123709 ?auto_123703 ) ( ON-TABLE ?auto_123703 ) ( not ( = ?auto_123703 ?auto_123709 ) ) ( not ( = ?auto_123703 ?auto_123707 ) ) ( not ( = ?auto_123703 ?auto_123708 ) ) ( not ( = ?auto_123709 ?auto_123707 ) ) ( not ( = ?auto_123709 ?auto_123708 ) ) ( not ( = ?auto_123707 ?auto_123708 ) ) ( ON ?auto_123707 ?auto_123709 ) ( ON-TABLE ?auto_123704 ) ( not ( = ?auto_123704 ?auto_123706 ) ) ( not ( = ?auto_123704 ?auto_123705 ) ) ( not ( = ?auto_123704 ?auto_123708 ) ) ( not ( = ?auto_123706 ?auto_123705 ) ) ( not ( = ?auto_123706 ?auto_123708 ) ) ( not ( = ?auto_123705 ?auto_123708 ) ) ( not ( = ?auto_123703 ?auto_123705 ) ) ( not ( = ?auto_123703 ?auto_123704 ) ) ( not ( = ?auto_123703 ?auto_123706 ) ) ( not ( = ?auto_123709 ?auto_123705 ) ) ( not ( = ?auto_123709 ?auto_123704 ) ) ( not ( = ?auto_123709 ?auto_123706 ) ) ( not ( = ?auto_123707 ?auto_123705 ) ) ( not ( = ?auto_123707 ?auto_123704 ) ) ( not ( = ?auto_123707 ?auto_123706 ) ) ( ON ?auto_123708 ?auto_123707 ) ( ON ?auto_123705 ?auto_123708 ) ( CLEAR ?auto_123705 ) ( HOLDING ?auto_123706 ) ( CLEAR ?auto_123704 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123704 ?auto_123706 )
      ( MAKE-1PILE ?auto_123703 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123710 - BLOCK
    )
    :vars
    (
      ?auto_123715 - BLOCK
      ?auto_123712 - BLOCK
      ?auto_123714 - BLOCK
      ?auto_123713 - BLOCK
      ?auto_123711 - BLOCK
      ?auto_123716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123715 ?auto_123710 ) ( ON-TABLE ?auto_123710 ) ( not ( = ?auto_123710 ?auto_123715 ) ) ( not ( = ?auto_123710 ?auto_123712 ) ) ( not ( = ?auto_123710 ?auto_123714 ) ) ( not ( = ?auto_123715 ?auto_123712 ) ) ( not ( = ?auto_123715 ?auto_123714 ) ) ( not ( = ?auto_123712 ?auto_123714 ) ) ( ON ?auto_123712 ?auto_123715 ) ( ON-TABLE ?auto_123713 ) ( not ( = ?auto_123713 ?auto_123711 ) ) ( not ( = ?auto_123713 ?auto_123716 ) ) ( not ( = ?auto_123713 ?auto_123714 ) ) ( not ( = ?auto_123711 ?auto_123716 ) ) ( not ( = ?auto_123711 ?auto_123714 ) ) ( not ( = ?auto_123716 ?auto_123714 ) ) ( not ( = ?auto_123710 ?auto_123716 ) ) ( not ( = ?auto_123710 ?auto_123713 ) ) ( not ( = ?auto_123710 ?auto_123711 ) ) ( not ( = ?auto_123715 ?auto_123716 ) ) ( not ( = ?auto_123715 ?auto_123713 ) ) ( not ( = ?auto_123715 ?auto_123711 ) ) ( not ( = ?auto_123712 ?auto_123716 ) ) ( not ( = ?auto_123712 ?auto_123713 ) ) ( not ( = ?auto_123712 ?auto_123711 ) ) ( ON ?auto_123714 ?auto_123712 ) ( ON ?auto_123716 ?auto_123714 ) ( CLEAR ?auto_123713 ) ( ON ?auto_123711 ?auto_123716 ) ( CLEAR ?auto_123711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123710 ?auto_123715 ?auto_123712 ?auto_123714 ?auto_123716 )
      ( MAKE-1PILE ?auto_123710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123717 - BLOCK
    )
    :vars
    (
      ?auto_123720 - BLOCK
      ?auto_123718 - BLOCK
      ?auto_123719 - BLOCK
      ?auto_123723 - BLOCK
      ?auto_123722 - BLOCK
      ?auto_123721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123720 ?auto_123717 ) ( ON-TABLE ?auto_123717 ) ( not ( = ?auto_123717 ?auto_123720 ) ) ( not ( = ?auto_123717 ?auto_123718 ) ) ( not ( = ?auto_123717 ?auto_123719 ) ) ( not ( = ?auto_123720 ?auto_123718 ) ) ( not ( = ?auto_123720 ?auto_123719 ) ) ( not ( = ?auto_123718 ?auto_123719 ) ) ( ON ?auto_123718 ?auto_123720 ) ( not ( = ?auto_123723 ?auto_123722 ) ) ( not ( = ?auto_123723 ?auto_123721 ) ) ( not ( = ?auto_123723 ?auto_123719 ) ) ( not ( = ?auto_123722 ?auto_123721 ) ) ( not ( = ?auto_123722 ?auto_123719 ) ) ( not ( = ?auto_123721 ?auto_123719 ) ) ( not ( = ?auto_123717 ?auto_123721 ) ) ( not ( = ?auto_123717 ?auto_123723 ) ) ( not ( = ?auto_123717 ?auto_123722 ) ) ( not ( = ?auto_123720 ?auto_123721 ) ) ( not ( = ?auto_123720 ?auto_123723 ) ) ( not ( = ?auto_123720 ?auto_123722 ) ) ( not ( = ?auto_123718 ?auto_123721 ) ) ( not ( = ?auto_123718 ?auto_123723 ) ) ( not ( = ?auto_123718 ?auto_123722 ) ) ( ON ?auto_123719 ?auto_123718 ) ( ON ?auto_123721 ?auto_123719 ) ( ON ?auto_123722 ?auto_123721 ) ( CLEAR ?auto_123722 ) ( HOLDING ?auto_123723 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123723 )
      ( MAKE-1PILE ?auto_123717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123724 - BLOCK
    )
    :vars
    (
      ?auto_123727 - BLOCK
      ?auto_123725 - BLOCK
      ?auto_123726 - BLOCK
      ?auto_123730 - BLOCK
      ?auto_123728 - BLOCK
      ?auto_123729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123727 ?auto_123724 ) ( ON-TABLE ?auto_123724 ) ( not ( = ?auto_123724 ?auto_123727 ) ) ( not ( = ?auto_123724 ?auto_123725 ) ) ( not ( = ?auto_123724 ?auto_123726 ) ) ( not ( = ?auto_123727 ?auto_123725 ) ) ( not ( = ?auto_123727 ?auto_123726 ) ) ( not ( = ?auto_123725 ?auto_123726 ) ) ( ON ?auto_123725 ?auto_123727 ) ( not ( = ?auto_123730 ?auto_123728 ) ) ( not ( = ?auto_123730 ?auto_123729 ) ) ( not ( = ?auto_123730 ?auto_123726 ) ) ( not ( = ?auto_123728 ?auto_123729 ) ) ( not ( = ?auto_123728 ?auto_123726 ) ) ( not ( = ?auto_123729 ?auto_123726 ) ) ( not ( = ?auto_123724 ?auto_123729 ) ) ( not ( = ?auto_123724 ?auto_123730 ) ) ( not ( = ?auto_123724 ?auto_123728 ) ) ( not ( = ?auto_123727 ?auto_123729 ) ) ( not ( = ?auto_123727 ?auto_123730 ) ) ( not ( = ?auto_123727 ?auto_123728 ) ) ( not ( = ?auto_123725 ?auto_123729 ) ) ( not ( = ?auto_123725 ?auto_123730 ) ) ( not ( = ?auto_123725 ?auto_123728 ) ) ( ON ?auto_123726 ?auto_123725 ) ( ON ?auto_123729 ?auto_123726 ) ( ON ?auto_123728 ?auto_123729 ) ( ON ?auto_123730 ?auto_123728 ) ( CLEAR ?auto_123730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123724 ?auto_123727 ?auto_123725 ?auto_123726 ?auto_123729 ?auto_123728 )
      ( MAKE-1PILE ?auto_123724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123731 - BLOCK
    )
    :vars
    (
      ?auto_123735 - BLOCK
      ?auto_123737 - BLOCK
      ?auto_123732 - BLOCK
      ?auto_123733 - BLOCK
      ?auto_123736 - BLOCK
      ?auto_123734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123735 ?auto_123731 ) ( ON-TABLE ?auto_123731 ) ( not ( = ?auto_123731 ?auto_123735 ) ) ( not ( = ?auto_123731 ?auto_123737 ) ) ( not ( = ?auto_123731 ?auto_123732 ) ) ( not ( = ?auto_123735 ?auto_123737 ) ) ( not ( = ?auto_123735 ?auto_123732 ) ) ( not ( = ?auto_123737 ?auto_123732 ) ) ( ON ?auto_123737 ?auto_123735 ) ( not ( = ?auto_123733 ?auto_123736 ) ) ( not ( = ?auto_123733 ?auto_123734 ) ) ( not ( = ?auto_123733 ?auto_123732 ) ) ( not ( = ?auto_123736 ?auto_123734 ) ) ( not ( = ?auto_123736 ?auto_123732 ) ) ( not ( = ?auto_123734 ?auto_123732 ) ) ( not ( = ?auto_123731 ?auto_123734 ) ) ( not ( = ?auto_123731 ?auto_123733 ) ) ( not ( = ?auto_123731 ?auto_123736 ) ) ( not ( = ?auto_123735 ?auto_123734 ) ) ( not ( = ?auto_123735 ?auto_123733 ) ) ( not ( = ?auto_123735 ?auto_123736 ) ) ( not ( = ?auto_123737 ?auto_123734 ) ) ( not ( = ?auto_123737 ?auto_123733 ) ) ( not ( = ?auto_123737 ?auto_123736 ) ) ( ON ?auto_123732 ?auto_123737 ) ( ON ?auto_123734 ?auto_123732 ) ( ON ?auto_123736 ?auto_123734 ) ( HOLDING ?auto_123733 ) ( CLEAR ?auto_123736 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123731 ?auto_123735 ?auto_123737 ?auto_123732 ?auto_123734 ?auto_123736 ?auto_123733 )
      ( MAKE-1PILE ?auto_123731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123738 - BLOCK
    )
    :vars
    (
      ?auto_123743 - BLOCK
      ?auto_123744 - BLOCK
      ?auto_123742 - BLOCK
      ?auto_123739 - BLOCK
      ?auto_123741 - BLOCK
      ?auto_123740 - BLOCK
      ?auto_123745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123743 ?auto_123738 ) ( ON-TABLE ?auto_123738 ) ( not ( = ?auto_123738 ?auto_123743 ) ) ( not ( = ?auto_123738 ?auto_123744 ) ) ( not ( = ?auto_123738 ?auto_123742 ) ) ( not ( = ?auto_123743 ?auto_123744 ) ) ( not ( = ?auto_123743 ?auto_123742 ) ) ( not ( = ?auto_123744 ?auto_123742 ) ) ( ON ?auto_123744 ?auto_123743 ) ( not ( = ?auto_123739 ?auto_123741 ) ) ( not ( = ?auto_123739 ?auto_123740 ) ) ( not ( = ?auto_123739 ?auto_123742 ) ) ( not ( = ?auto_123741 ?auto_123740 ) ) ( not ( = ?auto_123741 ?auto_123742 ) ) ( not ( = ?auto_123740 ?auto_123742 ) ) ( not ( = ?auto_123738 ?auto_123740 ) ) ( not ( = ?auto_123738 ?auto_123739 ) ) ( not ( = ?auto_123738 ?auto_123741 ) ) ( not ( = ?auto_123743 ?auto_123740 ) ) ( not ( = ?auto_123743 ?auto_123739 ) ) ( not ( = ?auto_123743 ?auto_123741 ) ) ( not ( = ?auto_123744 ?auto_123740 ) ) ( not ( = ?auto_123744 ?auto_123739 ) ) ( not ( = ?auto_123744 ?auto_123741 ) ) ( ON ?auto_123742 ?auto_123744 ) ( ON ?auto_123740 ?auto_123742 ) ( ON ?auto_123741 ?auto_123740 ) ( CLEAR ?auto_123741 ) ( ON ?auto_123739 ?auto_123745 ) ( CLEAR ?auto_123739 ) ( HAND-EMPTY ) ( not ( = ?auto_123738 ?auto_123745 ) ) ( not ( = ?auto_123743 ?auto_123745 ) ) ( not ( = ?auto_123744 ?auto_123745 ) ) ( not ( = ?auto_123742 ?auto_123745 ) ) ( not ( = ?auto_123739 ?auto_123745 ) ) ( not ( = ?auto_123741 ?auto_123745 ) ) ( not ( = ?auto_123740 ?auto_123745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123739 ?auto_123745 )
      ( MAKE-1PILE ?auto_123738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123746 - BLOCK
    )
    :vars
    (
      ?auto_123753 - BLOCK
      ?auto_123749 - BLOCK
      ?auto_123748 - BLOCK
      ?auto_123747 - BLOCK
      ?auto_123750 - BLOCK
      ?auto_123751 - BLOCK
      ?auto_123752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123753 ?auto_123746 ) ( ON-TABLE ?auto_123746 ) ( not ( = ?auto_123746 ?auto_123753 ) ) ( not ( = ?auto_123746 ?auto_123749 ) ) ( not ( = ?auto_123746 ?auto_123748 ) ) ( not ( = ?auto_123753 ?auto_123749 ) ) ( not ( = ?auto_123753 ?auto_123748 ) ) ( not ( = ?auto_123749 ?auto_123748 ) ) ( ON ?auto_123749 ?auto_123753 ) ( not ( = ?auto_123747 ?auto_123750 ) ) ( not ( = ?auto_123747 ?auto_123751 ) ) ( not ( = ?auto_123747 ?auto_123748 ) ) ( not ( = ?auto_123750 ?auto_123751 ) ) ( not ( = ?auto_123750 ?auto_123748 ) ) ( not ( = ?auto_123751 ?auto_123748 ) ) ( not ( = ?auto_123746 ?auto_123751 ) ) ( not ( = ?auto_123746 ?auto_123747 ) ) ( not ( = ?auto_123746 ?auto_123750 ) ) ( not ( = ?auto_123753 ?auto_123751 ) ) ( not ( = ?auto_123753 ?auto_123747 ) ) ( not ( = ?auto_123753 ?auto_123750 ) ) ( not ( = ?auto_123749 ?auto_123751 ) ) ( not ( = ?auto_123749 ?auto_123747 ) ) ( not ( = ?auto_123749 ?auto_123750 ) ) ( ON ?auto_123748 ?auto_123749 ) ( ON ?auto_123751 ?auto_123748 ) ( ON ?auto_123747 ?auto_123752 ) ( CLEAR ?auto_123747 ) ( not ( = ?auto_123746 ?auto_123752 ) ) ( not ( = ?auto_123753 ?auto_123752 ) ) ( not ( = ?auto_123749 ?auto_123752 ) ) ( not ( = ?auto_123748 ?auto_123752 ) ) ( not ( = ?auto_123747 ?auto_123752 ) ) ( not ( = ?auto_123750 ?auto_123752 ) ) ( not ( = ?auto_123751 ?auto_123752 ) ) ( HOLDING ?auto_123750 ) ( CLEAR ?auto_123751 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123746 ?auto_123753 ?auto_123749 ?auto_123748 ?auto_123751 ?auto_123750 )
      ( MAKE-1PILE ?auto_123746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123754 - BLOCK
    )
    :vars
    (
      ?auto_123760 - BLOCK
      ?auto_123756 - BLOCK
      ?auto_123757 - BLOCK
      ?auto_123755 - BLOCK
      ?auto_123758 - BLOCK
      ?auto_123759 - BLOCK
      ?auto_123761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123760 ?auto_123754 ) ( ON-TABLE ?auto_123754 ) ( not ( = ?auto_123754 ?auto_123760 ) ) ( not ( = ?auto_123754 ?auto_123756 ) ) ( not ( = ?auto_123754 ?auto_123757 ) ) ( not ( = ?auto_123760 ?auto_123756 ) ) ( not ( = ?auto_123760 ?auto_123757 ) ) ( not ( = ?auto_123756 ?auto_123757 ) ) ( ON ?auto_123756 ?auto_123760 ) ( not ( = ?auto_123755 ?auto_123758 ) ) ( not ( = ?auto_123755 ?auto_123759 ) ) ( not ( = ?auto_123755 ?auto_123757 ) ) ( not ( = ?auto_123758 ?auto_123759 ) ) ( not ( = ?auto_123758 ?auto_123757 ) ) ( not ( = ?auto_123759 ?auto_123757 ) ) ( not ( = ?auto_123754 ?auto_123759 ) ) ( not ( = ?auto_123754 ?auto_123755 ) ) ( not ( = ?auto_123754 ?auto_123758 ) ) ( not ( = ?auto_123760 ?auto_123759 ) ) ( not ( = ?auto_123760 ?auto_123755 ) ) ( not ( = ?auto_123760 ?auto_123758 ) ) ( not ( = ?auto_123756 ?auto_123759 ) ) ( not ( = ?auto_123756 ?auto_123755 ) ) ( not ( = ?auto_123756 ?auto_123758 ) ) ( ON ?auto_123757 ?auto_123756 ) ( ON ?auto_123759 ?auto_123757 ) ( ON ?auto_123755 ?auto_123761 ) ( not ( = ?auto_123754 ?auto_123761 ) ) ( not ( = ?auto_123760 ?auto_123761 ) ) ( not ( = ?auto_123756 ?auto_123761 ) ) ( not ( = ?auto_123757 ?auto_123761 ) ) ( not ( = ?auto_123755 ?auto_123761 ) ) ( not ( = ?auto_123758 ?auto_123761 ) ) ( not ( = ?auto_123759 ?auto_123761 ) ) ( CLEAR ?auto_123759 ) ( ON ?auto_123758 ?auto_123755 ) ( CLEAR ?auto_123758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123761 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123761 ?auto_123755 )
      ( MAKE-1PILE ?auto_123754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123762 - BLOCK
    )
    :vars
    (
      ?auto_123767 - BLOCK
      ?auto_123768 - BLOCK
      ?auto_123764 - BLOCK
      ?auto_123765 - BLOCK
      ?auto_123763 - BLOCK
      ?auto_123769 - BLOCK
      ?auto_123766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123767 ?auto_123762 ) ( ON-TABLE ?auto_123762 ) ( not ( = ?auto_123762 ?auto_123767 ) ) ( not ( = ?auto_123762 ?auto_123768 ) ) ( not ( = ?auto_123762 ?auto_123764 ) ) ( not ( = ?auto_123767 ?auto_123768 ) ) ( not ( = ?auto_123767 ?auto_123764 ) ) ( not ( = ?auto_123768 ?auto_123764 ) ) ( ON ?auto_123768 ?auto_123767 ) ( not ( = ?auto_123765 ?auto_123763 ) ) ( not ( = ?auto_123765 ?auto_123769 ) ) ( not ( = ?auto_123765 ?auto_123764 ) ) ( not ( = ?auto_123763 ?auto_123769 ) ) ( not ( = ?auto_123763 ?auto_123764 ) ) ( not ( = ?auto_123769 ?auto_123764 ) ) ( not ( = ?auto_123762 ?auto_123769 ) ) ( not ( = ?auto_123762 ?auto_123765 ) ) ( not ( = ?auto_123762 ?auto_123763 ) ) ( not ( = ?auto_123767 ?auto_123769 ) ) ( not ( = ?auto_123767 ?auto_123765 ) ) ( not ( = ?auto_123767 ?auto_123763 ) ) ( not ( = ?auto_123768 ?auto_123769 ) ) ( not ( = ?auto_123768 ?auto_123765 ) ) ( not ( = ?auto_123768 ?auto_123763 ) ) ( ON ?auto_123764 ?auto_123768 ) ( ON ?auto_123765 ?auto_123766 ) ( not ( = ?auto_123762 ?auto_123766 ) ) ( not ( = ?auto_123767 ?auto_123766 ) ) ( not ( = ?auto_123768 ?auto_123766 ) ) ( not ( = ?auto_123764 ?auto_123766 ) ) ( not ( = ?auto_123765 ?auto_123766 ) ) ( not ( = ?auto_123763 ?auto_123766 ) ) ( not ( = ?auto_123769 ?auto_123766 ) ) ( ON ?auto_123763 ?auto_123765 ) ( CLEAR ?auto_123763 ) ( ON-TABLE ?auto_123766 ) ( HOLDING ?auto_123769 ) ( CLEAR ?auto_123764 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123762 ?auto_123767 ?auto_123768 ?auto_123764 ?auto_123769 )
      ( MAKE-1PILE ?auto_123762 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123770 - BLOCK
    )
    :vars
    (
      ?auto_123777 - BLOCK
      ?auto_123772 - BLOCK
      ?auto_123774 - BLOCK
      ?auto_123773 - BLOCK
      ?auto_123776 - BLOCK
      ?auto_123775 - BLOCK
      ?auto_123771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123777 ?auto_123770 ) ( ON-TABLE ?auto_123770 ) ( not ( = ?auto_123770 ?auto_123777 ) ) ( not ( = ?auto_123770 ?auto_123772 ) ) ( not ( = ?auto_123770 ?auto_123774 ) ) ( not ( = ?auto_123777 ?auto_123772 ) ) ( not ( = ?auto_123777 ?auto_123774 ) ) ( not ( = ?auto_123772 ?auto_123774 ) ) ( ON ?auto_123772 ?auto_123777 ) ( not ( = ?auto_123773 ?auto_123776 ) ) ( not ( = ?auto_123773 ?auto_123775 ) ) ( not ( = ?auto_123773 ?auto_123774 ) ) ( not ( = ?auto_123776 ?auto_123775 ) ) ( not ( = ?auto_123776 ?auto_123774 ) ) ( not ( = ?auto_123775 ?auto_123774 ) ) ( not ( = ?auto_123770 ?auto_123775 ) ) ( not ( = ?auto_123770 ?auto_123773 ) ) ( not ( = ?auto_123770 ?auto_123776 ) ) ( not ( = ?auto_123777 ?auto_123775 ) ) ( not ( = ?auto_123777 ?auto_123773 ) ) ( not ( = ?auto_123777 ?auto_123776 ) ) ( not ( = ?auto_123772 ?auto_123775 ) ) ( not ( = ?auto_123772 ?auto_123773 ) ) ( not ( = ?auto_123772 ?auto_123776 ) ) ( ON ?auto_123774 ?auto_123772 ) ( ON ?auto_123773 ?auto_123771 ) ( not ( = ?auto_123770 ?auto_123771 ) ) ( not ( = ?auto_123777 ?auto_123771 ) ) ( not ( = ?auto_123772 ?auto_123771 ) ) ( not ( = ?auto_123774 ?auto_123771 ) ) ( not ( = ?auto_123773 ?auto_123771 ) ) ( not ( = ?auto_123776 ?auto_123771 ) ) ( not ( = ?auto_123775 ?auto_123771 ) ) ( ON ?auto_123776 ?auto_123773 ) ( ON-TABLE ?auto_123771 ) ( CLEAR ?auto_123774 ) ( ON ?auto_123775 ?auto_123776 ) ( CLEAR ?auto_123775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123771 ?auto_123773 ?auto_123776 )
      ( MAKE-1PILE ?auto_123770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123778 - BLOCK
    )
    :vars
    (
      ?auto_123782 - BLOCK
      ?auto_123780 - BLOCK
      ?auto_123781 - BLOCK
      ?auto_123783 - BLOCK
      ?auto_123779 - BLOCK
      ?auto_123785 - BLOCK
      ?auto_123784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123782 ?auto_123778 ) ( ON-TABLE ?auto_123778 ) ( not ( = ?auto_123778 ?auto_123782 ) ) ( not ( = ?auto_123778 ?auto_123780 ) ) ( not ( = ?auto_123778 ?auto_123781 ) ) ( not ( = ?auto_123782 ?auto_123780 ) ) ( not ( = ?auto_123782 ?auto_123781 ) ) ( not ( = ?auto_123780 ?auto_123781 ) ) ( ON ?auto_123780 ?auto_123782 ) ( not ( = ?auto_123783 ?auto_123779 ) ) ( not ( = ?auto_123783 ?auto_123785 ) ) ( not ( = ?auto_123783 ?auto_123781 ) ) ( not ( = ?auto_123779 ?auto_123785 ) ) ( not ( = ?auto_123779 ?auto_123781 ) ) ( not ( = ?auto_123785 ?auto_123781 ) ) ( not ( = ?auto_123778 ?auto_123785 ) ) ( not ( = ?auto_123778 ?auto_123783 ) ) ( not ( = ?auto_123778 ?auto_123779 ) ) ( not ( = ?auto_123782 ?auto_123785 ) ) ( not ( = ?auto_123782 ?auto_123783 ) ) ( not ( = ?auto_123782 ?auto_123779 ) ) ( not ( = ?auto_123780 ?auto_123785 ) ) ( not ( = ?auto_123780 ?auto_123783 ) ) ( not ( = ?auto_123780 ?auto_123779 ) ) ( ON ?auto_123783 ?auto_123784 ) ( not ( = ?auto_123778 ?auto_123784 ) ) ( not ( = ?auto_123782 ?auto_123784 ) ) ( not ( = ?auto_123780 ?auto_123784 ) ) ( not ( = ?auto_123781 ?auto_123784 ) ) ( not ( = ?auto_123783 ?auto_123784 ) ) ( not ( = ?auto_123779 ?auto_123784 ) ) ( not ( = ?auto_123785 ?auto_123784 ) ) ( ON ?auto_123779 ?auto_123783 ) ( ON-TABLE ?auto_123784 ) ( ON ?auto_123785 ?auto_123779 ) ( CLEAR ?auto_123785 ) ( HOLDING ?auto_123781 ) ( CLEAR ?auto_123780 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123778 ?auto_123782 ?auto_123780 ?auto_123781 )
      ( MAKE-1PILE ?auto_123778 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123786 - BLOCK
    )
    :vars
    (
      ?auto_123792 - BLOCK
      ?auto_123790 - BLOCK
      ?auto_123791 - BLOCK
      ?auto_123787 - BLOCK
      ?auto_123789 - BLOCK
      ?auto_123788 - BLOCK
      ?auto_123793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123792 ?auto_123786 ) ( ON-TABLE ?auto_123786 ) ( not ( = ?auto_123786 ?auto_123792 ) ) ( not ( = ?auto_123786 ?auto_123790 ) ) ( not ( = ?auto_123786 ?auto_123791 ) ) ( not ( = ?auto_123792 ?auto_123790 ) ) ( not ( = ?auto_123792 ?auto_123791 ) ) ( not ( = ?auto_123790 ?auto_123791 ) ) ( ON ?auto_123790 ?auto_123792 ) ( not ( = ?auto_123787 ?auto_123789 ) ) ( not ( = ?auto_123787 ?auto_123788 ) ) ( not ( = ?auto_123787 ?auto_123791 ) ) ( not ( = ?auto_123789 ?auto_123788 ) ) ( not ( = ?auto_123789 ?auto_123791 ) ) ( not ( = ?auto_123788 ?auto_123791 ) ) ( not ( = ?auto_123786 ?auto_123788 ) ) ( not ( = ?auto_123786 ?auto_123787 ) ) ( not ( = ?auto_123786 ?auto_123789 ) ) ( not ( = ?auto_123792 ?auto_123788 ) ) ( not ( = ?auto_123792 ?auto_123787 ) ) ( not ( = ?auto_123792 ?auto_123789 ) ) ( not ( = ?auto_123790 ?auto_123788 ) ) ( not ( = ?auto_123790 ?auto_123787 ) ) ( not ( = ?auto_123790 ?auto_123789 ) ) ( ON ?auto_123787 ?auto_123793 ) ( not ( = ?auto_123786 ?auto_123793 ) ) ( not ( = ?auto_123792 ?auto_123793 ) ) ( not ( = ?auto_123790 ?auto_123793 ) ) ( not ( = ?auto_123791 ?auto_123793 ) ) ( not ( = ?auto_123787 ?auto_123793 ) ) ( not ( = ?auto_123789 ?auto_123793 ) ) ( not ( = ?auto_123788 ?auto_123793 ) ) ( ON ?auto_123789 ?auto_123787 ) ( ON-TABLE ?auto_123793 ) ( ON ?auto_123788 ?auto_123789 ) ( CLEAR ?auto_123790 ) ( ON ?auto_123791 ?auto_123788 ) ( CLEAR ?auto_123791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123793 ?auto_123787 ?auto_123789 ?auto_123788 )
      ( MAKE-1PILE ?auto_123786 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123794 - BLOCK
    )
    :vars
    (
      ?auto_123795 - BLOCK
      ?auto_123796 - BLOCK
      ?auto_123800 - BLOCK
      ?auto_123799 - BLOCK
      ?auto_123801 - BLOCK
      ?auto_123797 - BLOCK
      ?auto_123798 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123795 ?auto_123794 ) ( ON-TABLE ?auto_123794 ) ( not ( = ?auto_123794 ?auto_123795 ) ) ( not ( = ?auto_123794 ?auto_123796 ) ) ( not ( = ?auto_123794 ?auto_123800 ) ) ( not ( = ?auto_123795 ?auto_123796 ) ) ( not ( = ?auto_123795 ?auto_123800 ) ) ( not ( = ?auto_123796 ?auto_123800 ) ) ( not ( = ?auto_123799 ?auto_123801 ) ) ( not ( = ?auto_123799 ?auto_123797 ) ) ( not ( = ?auto_123799 ?auto_123800 ) ) ( not ( = ?auto_123801 ?auto_123797 ) ) ( not ( = ?auto_123801 ?auto_123800 ) ) ( not ( = ?auto_123797 ?auto_123800 ) ) ( not ( = ?auto_123794 ?auto_123797 ) ) ( not ( = ?auto_123794 ?auto_123799 ) ) ( not ( = ?auto_123794 ?auto_123801 ) ) ( not ( = ?auto_123795 ?auto_123797 ) ) ( not ( = ?auto_123795 ?auto_123799 ) ) ( not ( = ?auto_123795 ?auto_123801 ) ) ( not ( = ?auto_123796 ?auto_123797 ) ) ( not ( = ?auto_123796 ?auto_123799 ) ) ( not ( = ?auto_123796 ?auto_123801 ) ) ( ON ?auto_123799 ?auto_123798 ) ( not ( = ?auto_123794 ?auto_123798 ) ) ( not ( = ?auto_123795 ?auto_123798 ) ) ( not ( = ?auto_123796 ?auto_123798 ) ) ( not ( = ?auto_123800 ?auto_123798 ) ) ( not ( = ?auto_123799 ?auto_123798 ) ) ( not ( = ?auto_123801 ?auto_123798 ) ) ( not ( = ?auto_123797 ?auto_123798 ) ) ( ON ?auto_123801 ?auto_123799 ) ( ON-TABLE ?auto_123798 ) ( ON ?auto_123797 ?auto_123801 ) ( ON ?auto_123800 ?auto_123797 ) ( CLEAR ?auto_123800 ) ( HOLDING ?auto_123796 ) ( CLEAR ?auto_123795 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123794 ?auto_123795 ?auto_123796 )
      ( MAKE-1PILE ?auto_123794 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123802 - BLOCK
    )
    :vars
    (
      ?auto_123808 - BLOCK
      ?auto_123805 - BLOCK
      ?auto_123804 - BLOCK
      ?auto_123809 - BLOCK
      ?auto_123803 - BLOCK
      ?auto_123806 - BLOCK
      ?auto_123807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_123808 ?auto_123802 ) ( ON-TABLE ?auto_123802 ) ( not ( = ?auto_123802 ?auto_123808 ) ) ( not ( = ?auto_123802 ?auto_123805 ) ) ( not ( = ?auto_123802 ?auto_123804 ) ) ( not ( = ?auto_123808 ?auto_123805 ) ) ( not ( = ?auto_123808 ?auto_123804 ) ) ( not ( = ?auto_123805 ?auto_123804 ) ) ( not ( = ?auto_123809 ?auto_123803 ) ) ( not ( = ?auto_123809 ?auto_123806 ) ) ( not ( = ?auto_123809 ?auto_123804 ) ) ( not ( = ?auto_123803 ?auto_123806 ) ) ( not ( = ?auto_123803 ?auto_123804 ) ) ( not ( = ?auto_123806 ?auto_123804 ) ) ( not ( = ?auto_123802 ?auto_123806 ) ) ( not ( = ?auto_123802 ?auto_123809 ) ) ( not ( = ?auto_123802 ?auto_123803 ) ) ( not ( = ?auto_123808 ?auto_123806 ) ) ( not ( = ?auto_123808 ?auto_123809 ) ) ( not ( = ?auto_123808 ?auto_123803 ) ) ( not ( = ?auto_123805 ?auto_123806 ) ) ( not ( = ?auto_123805 ?auto_123809 ) ) ( not ( = ?auto_123805 ?auto_123803 ) ) ( ON ?auto_123809 ?auto_123807 ) ( not ( = ?auto_123802 ?auto_123807 ) ) ( not ( = ?auto_123808 ?auto_123807 ) ) ( not ( = ?auto_123805 ?auto_123807 ) ) ( not ( = ?auto_123804 ?auto_123807 ) ) ( not ( = ?auto_123809 ?auto_123807 ) ) ( not ( = ?auto_123803 ?auto_123807 ) ) ( not ( = ?auto_123806 ?auto_123807 ) ) ( ON ?auto_123803 ?auto_123809 ) ( ON-TABLE ?auto_123807 ) ( ON ?auto_123806 ?auto_123803 ) ( ON ?auto_123804 ?auto_123806 ) ( CLEAR ?auto_123808 ) ( ON ?auto_123805 ?auto_123804 ) ( CLEAR ?auto_123805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123807 ?auto_123809 ?auto_123803 ?auto_123806 ?auto_123804 )
      ( MAKE-1PILE ?auto_123802 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123826 - BLOCK
    )
    :vars
    (
      ?auto_123831 - BLOCK
      ?auto_123830 - BLOCK
      ?auto_123832 - BLOCK
      ?auto_123827 - BLOCK
      ?auto_123829 - BLOCK
      ?auto_123833 - BLOCK
      ?auto_123828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123826 ?auto_123831 ) ) ( not ( = ?auto_123826 ?auto_123830 ) ) ( not ( = ?auto_123826 ?auto_123832 ) ) ( not ( = ?auto_123831 ?auto_123830 ) ) ( not ( = ?auto_123831 ?auto_123832 ) ) ( not ( = ?auto_123830 ?auto_123832 ) ) ( not ( = ?auto_123827 ?auto_123829 ) ) ( not ( = ?auto_123827 ?auto_123833 ) ) ( not ( = ?auto_123827 ?auto_123832 ) ) ( not ( = ?auto_123829 ?auto_123833 ) ) ( not ( = ?auto_123829 ?auto_123832 ) ) ( not ( = ?auto_123833 ?auto_123832 ) ) ( not ( = ?auto_123826 ?auto_123833 ) ) ( not ( = ?auto_123826 ?auto_123827 ) ) ( not ( = ?auto_123826 ?auto_123829 ) ) ( not ( = ?auto_123831 ?auto_123833 ) ) ( not ( = ?auto_123831 ?auto_123827 ) ) ( not ( = ?auto_123831 ?auto_123829 ) ) ( not ( = ?auto_123830 ?auto_123833 ) ) ( not ( = ?auto_123830 ?auto_123827 ) ) ( not ( = ?auto_123830 ?auto_123829 ) ) ( ON ?auto_123827 ?auto_123828 ) ( not ( = ?auto_123826 ?auto_123828 ) ) ( not ( = ?auto_123831 ?auto_123828 ) ) ( not ( = ?auto_123830 ?auto_123828 ) ) ( not ( = ?auto_123832 ?auto_123828 ) ) ( not ( = ?auto_123827 ?auto_123828 ) ) ( not ( = ?auto_123829 ?auto_123828 ) ) ( not ( = ?auto_123833 ?auto_123828 ) ) ( ON ?auto_123829 ?auto_123827 ) ( ON-TABLE ?auto_123828 ) ( ON ?auto_123833 ?auto_123829 ) ( ON ?auto_123832 ?auto_123833 ) ( ON ?auto_123830 ?auto_123832 ) ( ON ?auto_123831 ?auto_123830 ) ( CLEAR ?auto_123831 ) ( HOLDING ?auto_123826 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123826 ?auto_123831 )
      ( MAKE-1PILE ?auto_123826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_123834 - BLOCK
    )
    :vars
    (
      ?auto_123839 - BLOCK
      ?auto_123841 - BLOCK
      ?auto_123837 - BLOCK
      ?auto_123840 - BLOCK
      ?auto_123836 - BLOCK
      ?auto_123835 - BLOCK
      ?auto_123838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123834 ?auto_123839 ) ) ( not ( = ?auto_123834 ?auto_123841 ) ) ( not ( = ?auto_123834 ?auto_123837 ) ) ( not ( = ?auto_123839 ?auto_123841 ) ) ( not ( = ?auto_123839 ?auto_123837 ) ) ( not ( = ?auto_123841 ?auto_123837 ) ) ( not ( = ?auto_123840 ?auto_123836 ) ) ( not ( = ?auto_123840 ?auto_123835 ) ) ( not ( = ?auto_123840 ?auto_123837 ) ) ( not ( = ?auto_123836 ?auto_123835 ) ) ( not ( = ?auto_123836 ?auto_123837 ) ) ( not ( = ?auto_123835 ?auto_123837 ) ) ( not ( = ?auto_123834 ?auto_123835 ) ) ( not ( = ?auto_123834 ?auto_123840 ) ) ( not ( = ?auto_123834 ?auto_123836 ) ) ( not ( = ?auto_123839 ?auto_123835 ) ) ( not ( = ?auto_123839 ?auto_123840 ) ) ( not ( = ?auto_123839 ?auto_123836 ) ) ( not ( = ?auto_123841 ?auto_123835 ) ) ( not ( = ?auto_123841 ?auto_123840 ) ) ( not ( = ?auto_123841 ?auto_123836 ) ) ( ON ?auto_123840 ?auto_123838 ) ( not ( = ?auto_123834 ?auto_123838 ) ) ( not ( = ?auto_123839 ?auto_123838 ) ) ( not ( = ?auto_123841 ?auto_123838 ) ) ( not ( = ?auto_123837 ?auto_123838 ) ) ( not ( = ?auto_123840 ?auto_123838 ) ) ( not ( = ?auto_123836 ?auto_123838 ) ) ( not ( = ?auto_123835 ?auto_123838 ) ) ( ON ?auto_123836 ?auto_123840 ) ( ON-TABLE ?auto_123838 ) ( ON ?auto_123835 ?auto_123836 ) ( ON ?auto_123837 ?auto_123835 ) ( ON ?auto_123841 ?auto_123837 ) ( ON ?auto_123839 ?auto_123841 ) ( ON ?auto_123834 ?auto_123839 ) ( CLEAR ?auto_123834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123838 ?auto_123840 ?auto_123836 ?auto_123835 ?auto_123837 ?auto_123841 ?auto_123839 )
      ( MAKE-1PILE ?auto_123834 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123848 - BLOCK
      ?auto_123849 - BLOCK
      ?auto_123850 - BLOCK
      ?auto_123851 - BLOCK
      ?auto_123852 - BLOCK
      ?auto_123853 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_123853 ) ( CLEAR ?auto_123852 ) ( ON-TABLE ?auto_123848 ) ( ON ?auto_123849 ?auto_123848 ) ( ON ?auto_123850 ?auto_123849 ) ( ON ?auto_123851 ?auto_123850 ) ( ON ?auto_123852 ?auto_123851 ) ( not ( = ?auto_123848 ?auto_123849 ) ) ( not ( = ?auto_123848 ?auto_123850 ) ) ( not ( = ?auto_123848 ?auto_123851 ) ) ( not ( = ?auto_123848 ?auto_123852 ) ) ( not ( = ?auto_123848 ?auto_123853 ) ) ( not ( = ?auto_123849 ?auto_123850 ) ) ( not ( = ?auto_123849 ?auto_123851 ) ) ( not ( = ?auto_123849 ?auto_123852 ) ) ( not ( = ?auto_123849 ?auto_123853 ) ) ( not ( = ?auto_123850 ?auto_123851 ) ) ( not ( = ?auto_123850 ?auto_123852 ) ) ( not ( = ?auto_123850 ?auto_123853 ) ) ( not ( = ?auto_123851 ?auto_123852 ) ) ( not ( = ?auto_123851 ?auto_123853 ) ) ( not ( = ?auto_123852 ?auto_123853 ) ) )
    :subtasks
    ( ( !STACK ?auto_123853 ?auto_123852 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123854 - BLOCK
      ?auto_123855 - BLOCK
      ?auto_123856 - BLOCK
      ?auto_123857 - BLOCK
      ?auto_123858 - BLOCK
      ?auto_123859 - BLOCK
    )
    :vars
    (
      ?auto_123860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_123858 ) ( ON-TABLE ?auto_123854 ) ( ON ?auto_123855 ?auto_123854 ) ( ON ?auto_123856 ?auto_123855 ) ( ON ?auto_123857 ?auto_123856 ) ( ON ?auto_123858 ?auto_123857 ) ( not ( = ?auto_123854 ?auto_123855 ) ) ( not ( = ?auto_123854 ?auto_123856 ) ) ( not ( = ?auto_123854 ?auto_123857 ) ) ( not ( = ?auto_123854 ?auto_123858 ) ) ( not ( = ?auto_123854 ?auto_123859 ) ) ( not ( = ?auto_123855 ?auto_123856 ) ) ( not ( = ?auto_123855 ?auto_123857 ) ) ( not ( = ?auto_123855 ?auto_123858 ) ) ( not ( = ?auto_123855 ?auto_123859 ) ) ( not ( = ?auto_123856 ?auto_123857 ) ) ( not ( = ?auto_123856 ?auto_123858 ) ) ( not ( = ?auto_123856 ?auto_123859 ) ) ( not ( = ?auto_123857 ?auto_123858 ) ) ( not ( = ?auto_123857 ?auto_123859 ) ) ( not ( = ?auto_123858 ?auto_123859 ) ) ( ON ?auto_123859 ?auto_123860 ) ( CLEAR ?auto_123859 ) ( HAND-EMPTY ) ( not ( = ?auto_123854 ?auto_123860 ) ) ( not ( = ?auto_123855 ?auto_123860 ) ) ( not ( = ?auto_123856 ?auto_123860 ) ) ( not ( = ?auto_123857 ?auto_123860 ) ) ( not ( = ?auto_123858 ?auto_123860 ) ) ( not ( = ?auto_123859 ?auto_123860 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123859 ?auto_123860 )
      ( MAKE-6PILE ?auto_123854 ?auto_123855 ?auto_123856 ?auto_123857 ?auto_123858 ?auto_123859 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123861 - BLOCK
      ?auto_123862 - BLOCK
      ?auto_123863 - BLOCK
      ?auto_123864 - BLOCK
      ?auto_123865 - BLOCK
      ?auto_123866 - BLOCK
    )
    :vars
    (
      ?auto_123867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123861 ) ( ON ?auto_123862 ?auto_123861 ) ( ON ?auto_123863 ?auto_123862 ) ( ON ?auto_123864 ?auto_123863 ) ( not ( = ?auto_123861 ?auto_123862 ) ) ( not ( = ?auto_123861 ?auto_123863 ) ) ( not ( = ?auto_123861 ?auto_123864 ) ) ( not ( = ?auto_123861 ?auto_123865 ) ) ( not ( = ?auto_123861 ?auto_123866 ) ) ( not ( = ?auto_123862 ?auto_123863 ) ) ( not ( = ?auto_123862 ?auto_123864 ) ) ( not ( = ?auto_123862 ?auto_123865 ) ) ( not ( = ?auto_123862 ?auto_123866 ) ) ( not ( = ?auto_123863 ?auto_123864 ) ) ( not ( = ?auto_123863 ?auto_123865 ) ) ( not ( = ?auto_123863 ?auto_123866 ) ) ( not ( = ?auto_123864 ?auto_123865 ) ) ( not ( = ?auto_123864 ?auto_123866 ) ) ( not ( = ?auto_123865 ?auto_123866 ) ) ( ON ?auto_123866 ?auto_123867 ) ( CLEAR ?auto_123866 ) ( not ( = ?auto_123861 ?auto_123867 ) ) ( not ( = ?auto_123862 ?auto_123867 ) ) ( not ( = ?auto_123863 ?auto_123867 ) ) ( not ( = ?auto_123864 ?auto_123867 ) ) ( not ( = ?auto_123865 ?auto_123867 ) ) ( not ( = ?auto_123866 ?auto_123867 ) ) ( HOLDING ?auto_123865 ) ( CLEAR ?auto_123864 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123861 ?auto_123862 ?auto_123863 ?auto_123864 ?auto_123865 )
      ( MAKE-6PILE ?auto_123861 ?auto_123862 ?auto_123863 ?auto_123864 ?auto_123865 ?auto_123866 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123868 - BLOCK
      ?auto_123869 - BLOCK
      ?auto_123870 - BLOCK
      ?auto_123871 - BLOCK
      ?auto_123872 - BLOCK
      ?auto_123873 - BLOCK
    )
    :vars
    (
      ?auto_123874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123868 ) ( ON ?auto_123869 ?auto_123868 ) ( ON ?auto_123870 ?auto_123869 ) ( ON ?auto_123871 ?auto_123870 ) ( not ( = ?auto_123868 ?auto_123869 ) ) ( not ( = ?auto_123868 ?auto_123870 ) ) ( not ( = ?auto_123868 ?auto_123871 ) ) ( not ( = ?auto_123868 ?auto_123872 ) ) ( not ( = ?auto_123868 ?auto_123873 ) ) ( not ( = ?auto_123869 ?auto_123870 ) ) ( not ( = ?auto_123869 ?auto_123871 ) ) ( not ( = ?auto_123869 ?auto_123872 ) ) ( not ( = ?auto_123869 ?auto_123873 ) ) ( not ( = ?auto_123870 ?auto_123871 ) ) ( not ( = ?auto_123870 ?auto_123872 ) ) ( not ( = ?auto_123870 ?auto_123873 ) ) ( not ( = ?auto_123871 ?auto_123872 ) ) ( not ( = ?auto_123871 ?auto_123873 ) ) ( not ( = ?auto_123872 ?auto_123873 ) ) ( ON ?auto_123873 ?auto_123874 ) ( not ( = ?auto_123868 ?auto_123874 ) ) ( not ( = ?auto_123869 ?auto_123874 ) ) ( not ( = ?auto_123870 ?auto_123874 ) ) ( not ( = ?auto_123871 ?auto_123874 ) ) ( not ( = ?auto_123872 ?auto_123874 ) ) ( not ( = ?auto_123873 ?auto_123874 ) ) ( CLEAR ?auto_123871 ) ( ON ?auto_123872 ?auto_123873 ) ( CLEAR ?auto_123872 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123874 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123874 ?auto_123873 )
      ( MAKE-6PILE ?auto_123868 ?auto_123869 ?auto_123870 ?auto_123871 ?auto_123872 ?auto_123873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123875 - BLOCK
      ?auto_123876 - BLOCK
      ?auto_123877 - BLOCK
      ?auto_123878 - BLOCK
      ?auto_123879 - BLOCK
      ?auto_123880 - BLOCK
    )
    :vars
    (
      ?auto_123881 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123875 ) ( ON ?auto_123876 ?auto_123875 ) ( ON ?auto_123877 ?auto_123876 ) ( not ( = ?auto_123875 ?auto_123876 ) ) ( not ( = ?auto_123875 ?auto_123877 ) ) ( not ( = ?auto_123875 ?auto_123878 ) ) ( not ( = ?auto_123875 ?auto_123879 ) ) ( not ( = ?auto_123875 ?auto_123880 ) ) ( not ( = ?auto_123876 ?auto_123877 ) ) ( not ( = ?auto_123876 ?auto_123878 ) ) ( not ( = ?auto_123876 ?auto_123879 ) ) ( not ( = ?auto_123876 ?auto_123880 ) ) ( not ( = ?auto_123877 ?auto_123878 ) ) ( not ( = ?auto_123877 ?auto_123879 ) ) ( not ( = ?auto_123877 ?auto_123880 ) ) ( not ( = ?auto_123878 ?auto_123879 ) ) ( not ( = ?auto_123878 ?auto_123880 ) ) ( not ( = ?auto_123879 ?auto_123880 ) ) ( ON ?auto_123880 ?auto_123881 ) ( not ( = ?auto_123875 ?auto_123881 ) ) ( not ( = ?auto_123876 ?auto_123881 ) ) ( not ( = ?auto_123877 ?auto_123881 ) ) ( not ( = ?auto_123878 ?auto_123881 ) ) ( not ( = ?auto_123879 ?auto_123881 ) ) ( not ( = ?auto_123880 ?auto_123881 ) ) ( ON ?auto_123879 ?auto_123880 ) ( CLEAR ?auto_123879 ) ( ON-TABLE ?auto_123881 ) ( HOLDING ?auto_123878 ) ( CLEAR ?auto_123877 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123875 ?auto_123876 ?auto_123877 ?auto_123878 )
      ( MAKE-6PILE ?auto_123875 ?auto_123876 ?auto_123877 ?auto_123878 ?auto_123879 ?auto_123880 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123882 - BLOCK
      ?auto_123883 - BLOCK
      ?auto_123884 - BLOCK
      ?auto_123885 - BLOCK
      ?auto_123886 - BLOCK
      ?auto_123887 - BLOCK
    )
    :vars
    (
      ?auto_123888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123882 ) ( ON ?auto_123883 ?auto_123882 ) ( ON ?auto_123884 ?auto_123883 ) ( not ( = ?auto_123882 ?auto_123883 ) ) ( not ( = ?auto_123882 ?auto_123884 ) ) ( not ( = ?auto_123882 ?auto_123885 ) ) ( not ( = ?auto_123882 ?auto_123886 ) ) ( not ( = ?auto_123882 ?auto_123887 ) ) ( not ( = ?auto_123883 ?auto_123884 ) ) ( not ( = ?auto_123883 ?auto_123885 ) ) ( not ( = ?auto_123883 ?auto_123886 ) ) ( not ( = ?auto_123883 ?auto_123887 ) ) ( not ( = ?auto_123884 ?auto_123885 ) ) ( not ( = ?auto_123884 ?auto_123886 ) ) ( not ( = ?auto_123884 ?auto_123887 ) ) ( not ( = ?auto_123885 ?auto_123886 ) ) ( not ( = ?auto_123885 ?auto_123887 ) ) ( not ( = ?auto_123886 ?auto_123887 ) ) ( ON ?auto_123887 ?auto_123888 ) ( not ( = ?auto_123882 ?auto_123888 ) ) ( not ( = ?auto_123883 ?auto_123888 ) ) ( not ( = ?auto_123884 ?auto_123888 ) ) ( not ( = ?auto_123885 ?auto_123888 ) ) ( not ( = ?auto_123886 ?auto_123888 ) ) ( not ( = ?auto_123887 ?auto_123888 ) ) ( ON ?auto_123886 ?auto_123887 ) ( ON-TABLE ?auto_123888 ) ( CLEAR ?auto_123884 ) ( ON ?auto_123885 ?auto_123886 ) ( CLEAR ?auto_123885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123888 ?auto_123887 ?auto_123886 )
      ( MAKE-6PILE ?auto_123882 ?auto_123883 ?auto_123884 ?auto_123885 ?auto_123886 ?auto_123887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123889 - BLOCK
      ?auto_123890 - BLOCK
      ?auto_123891 - BLOCK
      ?auto_123892 - BLOCK
      ?auto_123893 - BLOCK
      ?auto_123894 - BLOCK
    )
    :vars
    (
      ?auto_123895 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123889 ) ( ON ?auto_123890 ?auto_123889 ) ( not ( = ?auto_123889 ?auto_123890 ) ) ( not ( = ?auto_123889 ?auto_123891 ) ) ( not ( = ?auto_123889 ?auto_123892 ) ) ( not ( = ?auto_123889 ?auto_123893 ) ) ( not ( = ?auto_123889 ?auto_123894 ) ) ( not ( = ?auto_123890 ?auto_123891 ) ) ( not ( = ?auto_123890 ?auto_123892 ) ) ( not ( = ?auto_123890 ?auto_123893 ) ) ( not ( = ?auto_123890 ?auto_123894 ) ) ( not ( = ?auto_123891 ?auto_123892 ) ) ( not ( = ?auto_123891 ?auto_123893 ) ) ( not ( = ?auto_123891 ?auto_123894 ) ) ( not ( = ?auto_123892 ?auto_123893 ) ) ( not ( = ?auto_123892 ?auto_123894 ) ) ( not ( = ?auto_123893 ?auto_123894 ) ) ( ON ?auto_123894 ?auto_123895 ) ( not ( = ?auto_123889 ?auto_123895 ) ) ( not ( = ?auto_123890 ?auto_123895 ) ) ( not ( = ?auto_123891 ?auto_123895 ) ) ( not ( = ?auto_123892 ?auto_123895 ) ) ( not ( = ?auto_123893 ?auto_123895 ) ) ( not ( = ?auto_123894 ?auto_123895 ) ) ( ON ?auto_123893 ?auto_123894 ) ( ON-TABLE ?auto_123895 ) ( ON ?auto_123892 ?auto_123893 ) ( CLEAR ?auto_123892 ) ( HOLDING ?auto_123891 ) ( CLEAR ?auto_123890 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123889 ?auto_123890 ?auto_123891 )
      ( MAKE-6PILE ?auto_123889 ?auto_123890 ?auto_123891 ?auto_123892 ?auto_123893 ?auto_123894 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123896 - BLOCK
      ?auto_123897 - BLOCK
      ?auto_123898 - BLOCK
      ?auto_123899 - BLOCK
      ?auto_123900 - BLOCK
      ?auto_123901 - BLOCK
    )
    :vars
    (
      ?auto_123902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123896 ) ( ON ?auto_123897 ?auto_123896 ) ( not ( = ?auto_123896 ?auto_123897 ) ) ( not ( = ?auto_123896 ?auto_123898 ) ) ( not ( = ?auto_123896 ?auto_123899 ) ) ( not ( = ?auto_123896 ?auto_123900 ) ) ( not ( = ?auto_123896 ?auto_123901 ) ) ( not ( = ?auto_123897 ?auto_123898 ) ) ( not ( = ?auto_123897 ?auto_123899 ) ) ( not ( = ?auto_123897 ?auto_123900 ) ) ( not ( = ?auto_123897 ?auto_123901 ) ) ( not ( = ?auto_123898 ?auto_123899 ) ) ( not ( = ?auto_123898 ?auto_123900 ) ) ( not ( = ?auto_123898 ?auto_123901 ) ) ( not ( = ?auto_123899 ?auto_123900 ) ) ( not ( = ?auto_123899 ?auto_123901 ) ) ( not ( = ?auto_123900 ?auto_123901 ) ) ( ON ?auto_123901 ?auto_123902 ) ( not ( = ?auto_123896 ?auto_123902 ) ) ( not ( = ?auto_123897 ?auto_123902 ) ) ( not ( = ?auto_123898 ?auto_123902 ) ) ( not ( = ?auto_123899 ?auto_123902 ) ) ( not ( = ?auto_123900 ?auto_123902 ) ) ( not ( = ?auto_123901 ?auto_123902 ) ) ( ON ?auto_123900 ?auto_123901 ) ( ON-TABLE ?auto_123902 ) ( ON ?auto_123899 ?auto_123900 ) ( CLEAR ?auto_123897 ) ( ON ?auto_123898 ?auto_123899 ) ( CLEAR ?auto_123898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123902 ?auto_123901 ?auto_123900 ?auto_123899 )
      ( MAKE-6PILE ?auto_123896 ?auto_123897 ?auto_123898 ?auto_123899 ?auto_123900 ?auto_123901 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123903 - BLOCK
      ?auto_123904 - BLOCK
      ?auto_123905 - BLOCK
      ?auto_123906 - BLOCK
      ?auto_123907 - BLOCK
      ?auto_123908 - BLOCK
    )
    :vars
    (
      ?auto_123909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123903 ) ( not ( = ?auto_123903 ?auto_123904 ) ) ( not ( = ?auto_123903 ?auto_123905 ) ) ( not ( = ?auto_123903 ?auto_123906 ) ) ( not ( = ?auto_123903 ?auto_123907 ) ) ( not ( = ?auto_123903 ?auto_123908 ) ) ( not ( = ?auto_123904 ?auto_123905 ) ) ( not ( = ?auto_123904 ?auto_123906 ) ) ( not ( = ?auto_123904 ?auto_123907 ) ) ( not ( = ?auto_123904 ?auto_123908 ) ) ( not ( = ?auto_123905 ?auto_123906 ) ) ( not ( = ?auto_123905 ?auto_123907 ) ) ( not ( = ?auto_123905 ?auto_123908 ) ) ( not ( = ?auto_123906 ?auto_123907 ) ) ( not ( = ?auto_123906 ?auto_123908 ) ) ( not ( = ?auto_123907 ?auto_123908 ) ) ( ON ?auto_123908 ?auto_123909 ) ( not ( = ?auto_123903 ?auto_123909 ) ) ( not ( = ?auto_123904 ?auto_123909 ) ) ( not ( = ?auto_123905 ?auto_123909 ) ) ( not ( = ?auto_123906 ?auto_123909 ) ) ( not ( = ?auto_123907 ?auto_123909 ) ) ( not ( = ?auto_123908 ?auto_123909 ) ) ( ON ?auto_123907 ?auto_123908 ) ( ON-TABLE ?auto_123909 ) ( ON ?auto_123906 ?auto_123907 ) ( ON ?auto_123905 ?auto_123906 ) ( CLEAR ?auto_123905 ) ( HOLDING ?auto_123904 ) ( CLEAR ?auto_123903 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123903 ?auto_123904 )
      ( MAKE-6PILE ?auto_123903 ?auto_123904 ?auto_123905 ?auto_123906 ?auto_123907 ?auto_123908 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123910 - BLOCK
      ?auto_123911 - BLOCK
      ?auto_123912 - BLOCK
      ?auto_123913 - BLOCK
      ?auto_123914 - BLOCK
      ?auto_123915 - BLOCK
    )
    :vars
    (
      ?auto_123916 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_123910 ) ( not ( = ?auto_123910 ?auto_123911 ) ) ( not ( = ?auto_123910 ?auto_123912 ) ) ( not ( = ?auto_123910 ?auto_123913 ) ) ( not ( = ?auto_123910 ?auto_123914 ) ) ( not ( = ?auto_123910 ?auto_123915 ) ) ( not ( = ?auto_123911 ?auto_123912 ) ) ( not ( = ?auto_123911 ?auto_123913 ) ) ( not ( = ?auto_123911 ?auto_123914 ) ) ( not ( = ?auto_123911 ?auto_123915 ) ) ( not ( = ?auto_123912 ?auto_123913 ) ) ( not ( = ?auto_123912 ?auto_123914 ) ) ( not ( = ?auto_123912 ?auto_123915 ) ) ( not ( = ?auto_123913 ?auto_123914 ) ) ( not ( = ?auto_123913 ?auto_123915 ) ) ( not ( = ?auto_123914 ?auto_123915 ) ) ( ON ?auto_123915 ?auto_123916 ) ( not ( = ?auto_123910 ?auto_123916 ) ) ( not ( = ?auto_123911 ?auto_123916 ) ) ( not ( = ?auto_123912 ?auto_123916 ) ) ( not ( = ?auto_123913 ?auto_123916 ) ) ( not ( = ?auto_123914 ?auto_123916 ) ) ( not ( = ?auto_123915 ?auto_123916 ) ) ( ON ?auto_123914 ?auto_123915 ) ( ON-TABLE ?auto_123916 ) ( ON ?auto_123913 ?auto_123914 ) ( ON ?auto_123912 ?auto_123913 ) ( CLEAR ?auto_123910 ) ( ON ?auto_123911 ?auto_123912 ) ( CLEAR ?auto_123911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123916 ?auto_123915 ?auto_123914 ?auto_123913 ?auto_123912 )
      ( MAKE-6PILE ?auto_123910 ?auto_123911 ?auto_123912 ?auto_123913 ?auto_123914 ?auto_123915 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123917 - BLOCK
      ?auto_123918 - BLOCK
      ?auto_123919 - BLOCK
      ?auto_123920 - BLOCK
      ?auto_123921 - BLOCK
      ?auto_123922 - BLOCK
    )
    :vars
    (
      ?auto_123923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123917 ?auto_123918 ) ) ( not ( = ?auto_123917 ?auto_123919 ) ) ( not ( = ?auto_123917 ?auto_123920 ) ) ( not ( = ?auto_123917 ?auto_123921 ) ) ( not ( = ?auto_123917 ?auto_123922 ) ) ( not ( = ?auto_123918 ?auto_123919 ) ) ( not ( = ?auto_123918 ?auto_123920 ) ) ( not ( = ?auto_123918 ?auto_123921 ) ) ( not ( = ?auto_123918 ?auto_123922 ) ) ( not ( = ?auto_123919 ?auto_123920 ) ) ( not ( = ?auto_123919 ?auto_123921 ) ) ( not ( = ?auto_123919 ?auto_123922 ) ) ( not ( = ?auto_123920 ?auto_123921 ) ) ( not ( = ?auto_123920 ?auto_123922 ) ) ( not ( = ?auto_123921 ?auto_123922 ) ) ( ON ?auto_123922 ?auto_123923 ) ( not ( = ?auto_123917 ?auto_123923 ) ) ( not ( = ?auto_123918 ?auto_123923 ) ) ( not ( = ?auto_123919 ?auto_123923 ) ) ( not ( = ?auto_123920 ?auto_123923 ) ) ( not ( = ?auto_123921 ?auto_123923 ) ) ( not ( = ?auto_123922 ?auto_123923 ) ) ( ON ?auto_123921 ?auto_123922 ) ( ON-TABLE ?auto_123923 ) ( ON ?auto_123920 ?auto_123921 ) ( ON ?auto_123919 ?auto_123920 ) ( ON ?auto_123918 ?auto_123919 ) ( CLEAR ?auto_123918 ) ( HOLDING ?auto_123917 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_123917 )
      ( MAKE-6PILE ?auto_123917 ?auto_123918 ?auto_123919 ?auto_123920 ?auto_123921 ?auto_123922 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123924 - BLOCK
      ?auto_123925 - BLOCK
      ?auto_123926 - BLOCK
      ?auto_123927 - BLOCK
      ?auto_123928 - BLOCK
      ?auto_123929 - BLOCK
    )
    :vars
    (
      ?auto_123930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123924 ?auto_123925 ) ) ( not ( = ?auto_123924 ?auto_123926 ) ) ( not ( = ?auto_123924 ?auto_123927 ) ) ( not ( = ?auto_123924 ?auto_123928 ) ) ( not ( = ?auto_123924 ?auto_123929 ) ) ( not ( = ?auto_123925 ?auto_123926 ) ) ( not ( = ?auto_123925 ?auto_123927 ) ) ( not ( = ?auto_123925 ?auto_123928 ) ) ( not ( = ?auto_123925 ?auto_123929 ) ) ( not ( = ?auto_123926 ?auto_123927 ) ) ( not ( = ?auto_123926 ?auto_123928 ) ) ( not ( = ?auto_123926 ?auto_123929 ) ) ( not ( = ?auto_123927 ?auto_123928 ) ) ( not ( = ?auto_123927 ?auto_123929 ) ) ( not ( = ?auto_123928 ?auto_123929 ) ) ( ON ?auto_123929 ?auto_123930 ) ( not ( = ?auto_123924 ?auto_123930 ) ) ( not ( = ?auto_123925 ?auto_123930 ) ) ( not ( = ?auto_123926 ?auto_123930 ) ) ( not ( = ?auto_123927 ?auto_123930 ) ) ( not ( = ?auto_123928 ?auto_123930 ) ) ( not ( = ?auto_123929 ?auto_123930 ) ) ( ON ?auto_123928 ?auto_123929 ) ( ON-TABLE ?auto_123930 ) ( ON ?auto_123927 ?auto_123928 ) ( ON ?auto_123926 ?auto_123927 ) ( ON ?auto_123925 ?auto_123926 ) ( ON ?auto_123924 ?auto_123925 ) ( CLEAR ?auto_123924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123930 ?auto_123929 ?auto_123928 ?auto_123927 ?auto_123926 ?auto_123925 )
      ( MAKE-6PILE ?auto_123924 ?auto_123925 ?auto_123926 ?auto_123927 ?auto_123928 ?auto_123929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123931 - BLOCK
      ?auto_123932 - BLOCK
      ?auto_123933 - BLOCK
      ?auto_123934 - BLOCK
      ?auto_123935 - BLOCK
      ?auto_123936 - BLOCK
    )
    :vars
    (
      ?auto_123937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123931 ?auto_123932 ) ) ( not ( = ?auto_123931 ?auto_123933 ) ) ( not ( = ?auto_123931 ?auto_123934 ) ) ( not ( = ?auto_123931 ?auto_123935 ) ) ( not ( = ?auto_123931 ?auto_123936 ) ) ( not ( = ?auto_123932 ?auto_123933 ) ) ( not ( = ?auto_123932 ?auto_123934 ) ) ( not ( = ?auto_123932 ?auto_123935 ) ) ( not ( = ?auto_123932 ?auto_123936 ) ) ( not ( = ?auto_123933 ?auto_123934 ) ) ( not ( = ?auto_123933 ?auto_123935 ) ) ( not ( = ?auto_123933 ?auto_123936 ) ) ( not ( = ?auto_123934 ?auto_123935 ) ) ( not ( = ?auto_123934 ?auto_123936 ) ) ( not ( = ?auto_123935 ?auto_123936 ) ) ( ON ?auto_123936 ?auto_123937 ) ( not ( = ?auto_123931 ?auto_123937 ) ) ( not ( = ?auto_123932 ?auto_123937 ) ) ( not ( = ?auto_123933 ?auto_123937 ) ) ( not ( = ?auto_123934 ?auto_123937 ) ) ( not ( = ?auto_123935 ?auto_123937 ) ) ( not ( = ?auto_123936 ?auto_123937 ) ) ( ON ?auto_123935 ?auto_123936 ) ( ON-TABLE ?auto_123937 ) ( ON ?auto_123934 ?auto_123935 ) ( ON ?auto_123933 ?auto_123934 ) ( ON ?auto_123932 ?auto_123933 ) ( HOLDING ?auto_123931 ) ( CLEAR ?auto_123932 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_123937 ?auto_123936 ?auto_123935 ?auto_123934 ?auto_123933 ?auto_123932 ?auto_123931 )
      ( MAKE-6PILE ?auto_123931 ?auto_123932 ?auto_123933 ?auto_123934 ?auto_123935 ?auto_123936 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123938 - BLOCK
      ?auto_123939 - BLOCK
      ?auto_123940 - BLOCK
      ?auto_123941 - BLOCK
      ?auto_123942 - BLOCK
      ?auto_123943 - BLOCK
    )
    :vars
    (
      ?auto_123944 - BLOCK
      ?auto_123945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123938 ?auto_123939 ) ) ( not ( = ?auto_123938 ?auto_123940 ) ) ( not ( = ?auto_123938 ?auto_123941 ) ) ( not ( = ?auto_123938 ?auto_123942 ) ) ( not ( = ?auto_123938 ?auto_123943 ) ) ( not ( = ?auto_123939 ?auto_123940 ) ) ( not ( = ?auto_123939 ?auto_123941 ) ) ( not ( = ?auto_123939 ?auto_123942 ) ) ( not ( = ?auto_123939 ?auto_123943 ) ) ( not ( = ?auto_123940 ?auto_123941 ) ) ( not ( = ?auto_123940 ?auto_123942 ) ) ( not ( = ?auto_123940 ?auto_123943 ) ) ( not ( = ?auto_123941 ?auto_123942 ) ) ( not ( = ?auto_123941 ?auto_123943 ) ) ( not ( = ?auto_123942 ?auto_123943 ) ) ( ON ?auto_123943 ?auto_123944 ) ( not ( = ?auto_123938 ?auto_123944 ) ) ( not ( = ?auto_123939 ?auto_123944 ) ) ( not ( = ?auto_123940 ?auto_123944 ) ) ( not ( = ?auto_123941 ?auto_123944 ) ) ( not ( = ?auto_123942 ?auto_123944 ) ) ( not ( = ?auto_123943 ?auto_123944 ) ) ( ON ?auto_123942 ?auto_123943 ) ( ON-TABLE ?auto_123944 ) ( ON ?auto_123941 ?auto_123942 ) ( ON ?auto_123940 ?auto_123941 ) ( ON ?auto_123939 ?auto_123940 ) ( CLEAR ?auto_123939 ) ( ON ?auto_123938 ?auto_123945 ) ( CLEAR ?auto_123938 ) ( HAND-EMPTY ) ( not ( = ?auto_123938 ?auto_123945 ) ) ( not ( = ?auto_123939 ?auto_123945 ) ) ( not ( = ?auto_123940 ?auto_123945 ) ) ( not ( = ?auto_123941 ?auto_123945 ) ) ( not ( = ?auto_123942 ?auto_123945 ) ) ( not ( = ?auto_123943 ?auto_123945 ) ) ( not ( = ?auto_123944 ?auto_123945 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_123938 ?auto_123945 )
      ( MAKE-6PILE ?auto_123938 ?auto_123939 ?auto_123940 ?auto_123941 ?auto_123942 ?auto_123943 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123946 - BLOCK
      ?auto_123947 - BLOCK
      ?auto_123948 - BLOCK
      ?auto_123949 - BLOCK
      ?auto_123950 - BLOCK
      ?auto_123951 - BLOCK
    )
    :vars
    (
      ?auto_123953 - BLOCK
      ?auto_123952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123946 ?auto_123947 ) ) ( not ( = ?auto_123946 ?auto_123948 ) ) ( not ( = ?auto_123946 ?auto_123949 ) ) ( not ( = ?auto_123946 ?auto_123950 ) ) ( not ( = ?auto_123946 ?auto_123951 ) ) ( not ( = ?auto_123947 ?auto_123948 ) ) ( not ( = ?auto_123947 ?auto_123949 ) ) ( not ( = ?auto_123947 ?auto_123950 ) ) ( not ( = ?auto_123947 ?auto_123951 ) ) ( not ( = ?auto_123948 ?auto_123949 ) ) ( not ( = ?auto_123948 ?auto_123950 ) ) ( not ( = ?auto_123948 ?auto_123951 ) ) ( not ( = ?auto_123949 ?auto_123950 ) ) ( not ( = ?auto_123949 ?auto_123951 ) ) ( not ( = ?auto_123950 ?auto_123951 ) ) ( ON ?auto_123951 ?auto_123953 ) ( not ( = ?auto_123946 ?auto_123953 ) ) ( not ( = ?auto_123947 ?auto_123953 ) ) ( not ( = ?auto_123948 ?auto_123953 ) ) ( not ( = ?auto_123949 ?auto_123953 ) ) ( not ( = ?auto_123950 ?auto_123953 ) ) ( not ( = ?auto_123951 ?auto_123953 ) ) ( ON ?auto_123950 ?auto_123951 ) ( ON-TABLE ?auto_123953 ) ( ON ?auto_123949 ?auto_123950 ) ( ON ?auto_123948 ?auto_123949 ) ( ON ?auto_123946 ?auto_123952 ) ( CLEAR ?auto_123946 ) ( not ( = ?auto_123946 ?auto_123952 ) ) ( not ( = ?auto_123947 ?auto_123952 ) ) ( not ( = ?auto_123948 ?auto_123952 ) ) ( not ( = ?auto_123949 ?auto_123952 ) ) ( not ( = ?auto_123950 ?auto_123952 ) ) ( not ( = ?auto_123951 ?auto_123952 ) ) ( not ( = ?auto_123953 ?auto_123952 ) ) ( HOLDING ?auto_123947 ) ( CLEAR ?auto_123948 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_123953 ?auto_123951 ?auto_123950 ?auto_123949 ?auto_123948 ?auto_123947 )
      ( MAKE-6PILE ?auto_123946 ?auto_123947 ?auto_123948 ?auto_123949 ?auto_123950 ?auto_123951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123954 - BLOCK
      ?auto_123955 - BLOCK
      ?auto_123956 - BLOCK
      ?auto_123957 - BLOCK
      ?auto_123958 - BLOCK
      ?auto_123959 - BLOCK
    )
    :vars
    (
      ?auto_123961 - BLOCK
      ?auto_123960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123954 ?auto_123955 ) ) ( not ( = ?auto_123954 ?auto_123956 ) ) ( not ( = ?auto_123954 ?auto_123957 ) ) ( not ( = ?auto_123954 ?auto_123958 ) ) ( not ( = ?auto_123954 ?auto_123959 ) ) ( not ( = ?auto_123955 ?auto_123956 ) ) ( not ( = ?auto_123955 ?auto_123957 ) ) ( not ( = ?auto_123955 ?auto_123958 ) ) ( not ( = ?auto_123955 ?auto_123959 ) ) ( not ( = ?auto_123956 ?auto_123957 ) ) ( not ( = ?auto_123956 ?auto_123958 ) ) ( not ( = ?auto_123956 ?auto_123959 ) ) ( not ( = ?auto_123957 ?auto_123958 ) ) ( not ( = ?auto_123957 ?auto_123959 ) ) ( not ( = ?auto_123958 ?auto_123959 ) ) ( ON ?auto_123959 ?auto_123961 ) ( not ( = ?auto_123954 ?auto_123961 ) ) ( not ( = ?auto_123955 ?auto_123961 ) ) ( not ( = ?auto_123956 ?auto_123961 ) ) ( not ( = ?auto_123957 ?auto_123961 ) ) ( not ( = ?auto_123958 ?auto_123961 ) ) ( not ( = ?auto_123959 ?auto_123961 ) ) ( ON ?auto_123958 ?auto_123959 ) ( ON-TABLE ?auto_123961 ) ( ON ?auto_123957 ?auto_123958 ) ( ON ?auto_123956 ?auto_123957 ) ( ON ?auto_123954 ?auto_123960 ) ( not ( = ?auto_123954 ?auto_123960 ) ) ( not ( = ?auto_123955 ?auto_123960 ) ) ( not ( = ?auto_123956 ?auto_123960 ) ) ( not ( = ?auto_123957 ?auto_123960 ) ) ( not ( = ?auto_123958 ?auto_123960 ) ) ( not ( = ?auto_123959 ?auto_123960 ) ) ( not ( = ?auto_123961 ?auto_123960 ) ) ( CLEAR ?auto_123956 ) ( ON ?auto_123955 ?auto_123954 ) ( CLEAR ?auto_123955 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_123960 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_123960 ?auto_123954 )
      ( MAKE-6PILE ?auto_123954 ?auto_123955 ?auto_123956 ?auto_123957 ?auto_123958 ?auto_123959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123962 - BLOCK
      ?auto_123963 - BLOCK
      ?auto_123964 - BLOCK
      ?auto_123965 - BLOCK
      ?auto_123966 - BLOCK
      ?auto_123967 - BLOCK
    )
    :vars
    (
      ?auto_123968 - BLOCK
      ?auto_123969 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123962 ?auto_123963 ) ) ( not ( = ?auto_123962 ?auto_123964 ) ) ( not ( = ?auto_123962 ?auto_123965 ) ) ( not ( = ?auto_123962 ?auto_123966 ) ) ( not ( = ?auto_123962 ?auto_123967 ) ) ( not ( = ?auto_123963 ?auto_123964 ) ) ( not ( = ?auto_123963 ?auto_123965 ) ) ( not ( = ?auto_123963 ?auto_123966 ) ) ( not ( = ?auto_123963 ?auto_123967 ) ) ( not ( = ?auto_123964 ?auto_123965 ) ) ( not ( = ?auto_123964 ?auto_123966 ) ) ( not ( = ?auto_123964 ?auto_123967 ) ) ( not ( = ?auto_123965 ?auto_123966 ) ) ( not ( = ?auto_123965 ?auto_123967 ) ) ( not ( = ?auto_123966 ?auto_123967 ) ) ( ON ?auto_123967 ?auto_123968 ) ( not ( = ?auto_123962 ?auto_123968 ) ) ( not ( = ?auto_123963 ?auto_123968 ) ) ( not ( = ?auto_123964 ?auto_123968 ) ) ( not ( = ?auto_123965 ?auto_123968 ) ) ( not ( = ?auto_123966 ?auto_123968 ) ) ( not ( = ?auto_123967 ?auto_123968 ) ) ( ON ?auto_123966 ?auto_123967 ) ( ON-TABLE ?auto_123968 ) ( ON ?auto_123965 ?auto_123966 ) ( ON ?auto_123962 ?auto_123969 ) ( not ( = ?auto_123962 ?auto_123969 ) ) ( not ( = ?auto_123963 ?auto_123969 ) ) ( not ( = ?auto_123964 ?auto_123969 ) ) ( not ( = ?auto_123965 ?auto_123969 ) ) ( not ( = ?auto_123966 ?auto_123969 ) ) ( not ( = ?auto_123967 ?auto_123969 ) ) ( not ( = ?auto_123968 ?auto_123969 ) ) ( ON ?auto_123963 ?auto_123962 ) ( CLEAR ?auto_123963 ) ( ON-TABLE ?auto_123969 ) ( HOLDING ?auto_123964 ) ( CLEAR ?auto_123965 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_123968 ?auto_123967 ?auto_123966 ?auto_123965 ?auto_123964 )
      ( MAKE-6PILE ?auto_123962 ?auto_123963 ?auto_123964 ?auto_123965 ?auto_123966 ?auto_123967 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123970 - BLOCK
      ?auto_123971 - BLOCK
      ?auto_123972 - BLOCK
      ?auto_123973 - BLOCK
      ?auto_123974 - BLOCK
      ?auto_123975 - BLOCK
    )
    :vars
    (
      ?auto_123976 - BLOCK
      ?auto_123977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123970 ?auto_123971 ) ) ( not ( = ?auto_123970 ?auto_123972 ) ) ( not ( = ?auto_123970 ?auto_123973 ) ) ( not ( = ?auto_123970 ?auto_123974 ) ) ( not ( = ?auto_123970 ?auto_123975 ) ) ( not ( = ?auto_123971 ?auto_123972 ) ) ( not ( = ?auto_123971 ?auto_123973 ) ) ( not ( = ?auto_123971 ?auto_123974 ) ) ( not ( = ?auto_123971 ?auto_123975 ) ) ( not ( = ?auto_123972 ?auto_123973 ) ) ( not ( = ?auto_123972 ?auto_123974 ) ) ( not ( = ?auto_123972 ?auto_123975 ) ) ( not ( = ?auto_123973 ?auto_123974 ) ) ( not ( = ?auto_123973 ?auto_123975 ) ) ( not ( = ?auto_123974 ?auto_123975 ) ) ( ON ?auto_123975 ?auto_123976 ) ( not ( = ?auto_123970 ?auto_123976 ) ) ( not ( = ?auto_123971 ?auto_123976 ) ) ( not ( = ?auto_123972 ?auto_123976 ) ) ( not ( = ?auto_123973 ?auto_123976 ) ) ( not ( = ?auto_123974 ?auto_123976 ) ) ( not ( = ?auto_123975 ?auto_123976 ) ) ( ON ?auto_123974 ?auto_123975 ) ( ON-TABLE ?auto_123976 ) ( ON ?auto_123973 ?auto_123974 ) ( ON ?auto_123970 ?auto_123977 ) ( not ( = ?auto_123970 ?auto_123977 ) ) ( not ( = ?auto_123971 ?auto_123977 ) ) ( not ( = ?auto_123972 ?auto_123977 ) ) ( not ( = ?auto_123973 ?auto_123977 ) ) ( not ( = ?auto_123974 ?auto_123977 ) ) ( not ( = ?auto_123975 ?auto_123977 ) ) ( not ( = ?auto_123976 ?auto_123977 ) ) ( ON ?auto_123971 ?auto_123970 ) ( ON-TABLE ?auto_123977 ) ( CLEAR ?auto_123973 ) ( ON ?auto_123972 ?auto_123971 ) ( CLEAR ?auto_123972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_123977 ?auto_123970 ?auto_123971 )
      ( MAKE-6PILE ?auto_123970 ?auto_123971 ?auto_123972 ?auto_123973 ?auto_123974 ?auto_123975 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123978 - BLOCK
      ?auto_123979 - BLOCK
      ?auto_123980 - BLOCK
      ?auto_123981 - BLOCK
      ?auto_123982 - BLOCK
      ?auto_123983 - BLOCK
    )
    :vars
    (
      ?auto_123985 - BLOCK
      ?auto_123984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123978 ?auto_123979 ) ) ( not ( = ?auto_123978 ?auto_123980 ) ) ( not ( = ?auto_123978 ?auto_123981 ) ) ( not ( = ?auto_123978 ?auto_123982 ) ) ( not ( = ?auto_123978 ?auto_123983 ) ) ( not ( = ?auto_123979 ?auto_123980 ) ) ( not ( = ?auto_123979 ?auto_123981 ) ) ( not ( = ?auto_123979 ?auto_123982 ) ) ( not ( = ?auto_123979 ?auto_123983 ) ) ( not ( = ?auto_123980 ?auto_123981 ) ) ( not ( = ?auto_123980 ?auto_123982 ) ) ( not ( = ?auto_123980 ?auto_123983 ) ) ( not ( = ?auto_123981 ?auto_123982 ) ) ( not ( = ?auto_123981 ?auto_123983 ) ) ( not ( = ?auto_123982 ?auto_123983 ) ) ( ON ?auto_123983 ?auto_123985 ) ( not ( = ?auto_123978 ?auto_123985 ) ) ( not ( = ?auto_123979 ?auto_123985 ) ) ( not ( = ?auto_123980 ?auto_123985 ) ) ( not ( = ?auto_123981 ?auto_123985 ) ) ( not ( = ?auto_123982 ?auto_123985 ) ) ( not ( = ?auto_123983 ?auto_123985 ) ) ( ON ?auto_123982 ?auto_123983 ) ( ON-TABLE ?auto_123985 ) ( ON ?auto_123978 ?auto_123984 ) ( not ( = ?auto_123978 ?auto_123984 ) ) ( not ( = ?auto_123979 ?auto_123984 ) ) ( not ( = ?auto_123980 ?auto_123984 ) ) ( not ( = ?auto_123981 ?auto_123984 ) ) ( not ( = ?auto_123982 ?auto_123984 ) ) ( not ( = ?auto_123983 ?auto_123984 ) ) ( not ( = ?auto_123985 ?auto_123984 ) ) ( ON ?auto_123979 ?auto_123978 ) ( ON-TABLE ?auto_123984 ) ( ON ?auto_123980 ?auto_123979 ) ( CLEAR ?auto_123980 ) ( HOLDING ?auto_123981 ) ( CLEAR ?auto_123982 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123985 ?auto_123983 ?auto_123982 ?auto_123981 )
      ( MAKE-6PILE ?auto_123978 ?auto_123979 ?auto_123980 ?auto_123981 ?auto_123982 ?auto_123983 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123986 - BLOCK
      ?auto_123987 - BLOCK
      ?auto_123988 - BLOCK
      ?auto_123989 - BLOCK
      ?auto_123990 - BLOCK
      ?auto_123991 - BLOCK
    )
    :vars
    (
      ?auto_123992 - BLOCK
      ?auto_123993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123986 ?auto_123987 ) ) ( not ( = ?auto_123986 ?auto_123988 ) ) ( not ( = ?auto_123986 ?auto_123989 ) ) ( not ( = ?auto_123986 ?auto_123990 ) ) ( not ( = ?auto_123986 ?auto_123991 ) ) ( not ( = ?auto_123987 ?auto_123988 ) ) ( not ( = ?auto_123987 ?auto_123989 ) ) ( not ( = ?auto_123987 ?auto_123990 ) ) ( not ( = ?auto_123987 ?auto_123991 ) ) ( not ( = ?auto_123988 ?auto_123989 ) ) ( not ( = ?auto_123988 ?auto_123990 ) ) ( not ( = ?auto_123988 ?auto_123991 ) ) ( not ( = ?auto_123989 ?auto_123990 ) ) ( not ( = ?auto_123989 ?auto_123991 ) ) ( not ( = ?auto_123990 ?auto_123991 ) ) ( ON ?auto_123991 ?auto_123992 ) ( not ( = ?auto_123986 ?auto_123992 ) ) ( not ( = ?auto_123987 ?auto_123992 ) ) ( not ( = ?auto_123988 ?auto_123992 ) ) ( not ( = ?auto_123989 ?auto_123992 ) ) ( not ( = ?auto_123990 ?auto_123992 ) ) ( not ( = ?auto_123991 ?auto_123992 ) ) ( ON ?auto_123990 ?auto_123991 ) ( ON-TABLE ?auto_123992 ) ( ON ?auto_123986 ?auto_123993 ) ( not ( = ?auto_123986 ?auto_123993 ) ) ( not ( = ?auto_123987 ?auto_123993 ) ) ( not ( = ?auto_123988 ?auto_123993 ) ) ( not ( = ?auto_123989 ?auto_123993 ) ) ( not ( = ?auto_123990 ?auto_123993 ) ) ( not ( = ?auto_123991 ?auto_123993 ) ) ( not ( = ?auto_123992 ?auto_123993 ) ) ( ON ?auto_123987 ?auto_123986 ) ( ON-TABLE ?auto_123993 ) ( ON ?auto_123988 ?auto_123987 ) ( CLEAR ?auto_123990 ) ( ON ?auto_123989 ?auto_123988 ) ( CLEAR ?auto_123989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_123993 ?auto_123986 ?auto_123987 ?auto_123988 )
      ( MAKE-6PILE ?auto_123986 ?auto_123987 ?auto_123988 ?auto_123989 ?auto_123990 ?auto_123991 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_123994 - BLOCK
      ?auto_123995 - BLOCK
      ?auto_123996 - BLOCK
      ?auto_123997 - BLOCK
      ?auto_123998 - BLOCK
      ?auto_123999 - BLOCK
    )
    :vars
    (
      ?auto_124000 - BLOCK
      ?auto_124001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_123994 ?auto_123995 ) ) ( not ( = ?auto_123994 ?auto_123996 ) ) ( not ( = ?auto_123994 ?auto_123997 ) ) ( not ( = ?auto_123994 ?auto_123998 ) ) ( not ( = ?auto_123994 ?auto_123999 ) ) ( not ( = ?auto_123995 ?auto_123996 ) ) ( not ( = ?auto_123995 ?auto_123997 ) ) ( not ( = ?auto_123995 ?auto_123998 ) ) ( not ( = ?auto_123995 ?auto_123999 ) ) ( not ( = ?auto_123996 ?auto_123997 ) ) ( not ( = ?auto_123996 ?auto_123998 ) ) ( not ( = ?auto_123996 ?auto_123999 ) ) ( not ( = ?auto_123997 ?auto_123998 ) ) ( not ( = ?auto_123997 ?auto_123999 ) ) ( not ( = ?auto_123998 ?auto_123999 ) ) ( ON ?auto_123999 ?auto_124000 ) ( not ( = ?auto_123994 ?auto_124000 ) ) ( not ( = ?auto_123995 ?auto_124000 ) ) ( not ( = ?auto_123996 ?auto_124000 ) ) ( not ( = ?auto_123997 ?auto_124000 ) ) ( not ( = ?auto_123998 ?auto_124000 ) ) ( not ( = ?auto_123999 ?auto_124000 ) ) ( ON-TABLE ?auto_124000 ) ( ON ?auto_123994 ?auto_124001 ) ( not ( = ?auto_123994 ?auto_124001 ) ) ( not ( = ?auto_123995 ?auto_124001 ) ) ( not ( = ?auto_123996 ?auto_124001 ) ) ( not ( = ?auto_123997 ?auto_124001 ) ) ( not ( = ?auto_123998 ?auto_124001 ) ) ( not ( = ?auto_123999 ?auto_124001 ) ) ( not ( = ?auto_124000 ?auto_124001 ) ) ( ON ?auto_123995 ?auto_123994 ) ( ON-TABLE ?auto_124001 ) ( ON ?auto_123996 ?auto_123995 ) ( ON ?auto_123997 ?auto_123996 ) ( CLEAR ?auto_123997 ) ( HOLDING ?auto_123998 ) ( CLEAR ?auto_123999 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124000 ?auto_123999 ?auto_123998 )
      ( MAKE-6PILE ?auto_123994 ?auto_123995 ?auto_123996 ?auto_123997 ?auto_123998 ?auto_123999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124002 - BLOCK
      ?auto_124003 - BLOCK
      ?auto_124004 - BLOCK
      ?auto_124005 - BLOCK
      ?auto_124006 - BLOCK
      ?auto_124007 - BLOCK
    )
    :vars
    (
      ?auto_124008 - BLOCK
      ?auto_124009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124002 ?auto_124003 ) ) ( not ( = ?auto_124002 ?auto_124004 ) ) ( not ( = ?auto_124002 ?auto_124005 ) ) ( not ( = ?auto_124002 ?auto_124006 ) ) ( not ( = ?auto_124002 ?auto_124007 ) ) ( not ( = ?auto_124003 ?auto_124004 ) ) ( not ( = ?auto_124003 ?auto_124005 ) ) ( not ( = ?auto_124003 ?auto_124006 ) ) ( not ( = ?auto_124003 ?auto_124007 ) ) ( not ( = ?auto_124004 ?auto_124005 ) ) ( not ( = ?auto_124004 ?auto_124006 ) ) ( not ( = ?auto_124004 ?auto_124007 ) ) ( not ( = ?auto_124005 ?auto_124006 ) ) ( not ( = ?auto_124005 ?auto_124007 ) ) ( not ( = ?auto_124006 ?auto_124007 ) ) ( ON ?auto_124007 ?auto_124008 ) ( not ( = ?auto_124002 ?auto_124008 ) ) ( not ( = ?auto_124003 ?auto_124008 ) ) ( not ( = ?auto_124004 ?auto_124008 ) ) ( not ( = ?auto_124005 ?auto_124008 ) ) ( not ( = ?auto_124006 ?auto_124008 ) ) ( not ( = ?auto_124007 ?auto_124008 ) ) ( ON-TABLE ?auto_124008 ) ( ON ?auto_124002 ?auto_124009 ) ( not ( = ?auto_124002 ?auto_124009 ) ) ( not ( = ?auto_124003 ?auto_124009 ) ) ( not ( = ?auto_124004 ?auto_124009 ) ) ( not ( = ?auto_124005 ?auto_124009 ) ) ( not ( = ?auto_124006 ?auto_124009 ) ) ( not ( = ?auto_124007 ?auto_124009 ) ) ( not ( = ?auto_124008 ?auto_124009 ) ) ( ON ?auto_124003 ?auto_124002 ) ( ON-TABLE ?auto_124009 ) ( ON ?auto_124004 ?auto_124003 ) ( ON ?auto_124005 ?auto_124004 ) ( CLEAR ?auto_124007 ) ( ON ?auto_124006 ?auto_124005 ) ( CLEAR ?auto_124006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124009 ?auto_124002 ?auto_124003 ?auto_124004 ?auto_124005 )
      ( MAKE-6PILE ?auto_124002 ?auto_124003 ?auto_124004 ?auto_124005 ?auto_124006 ?auto_124007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124010 - BLOCK
      ?auto_124011 - BLOCK
      ?auto_124012 - BLOCK
      ?auto_124013 - BLOCK
      ?auto_124014 - BLOCK
      ?auto_124015 - BLOCK
    )
    :vars
    (
      ?auto_124016 - BLOCK
      ?auto_124017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124010 ?auto_124011 ) ) ( not ( = ?auto_124010 ?auto_124012 ) ) ( not ( = ?auto_124010 ?auto_124013 ) ) ( not ( = ?auto_124010 ?auto_124014 ) ) ( not ( = ?auto_124010 ?auto_124015 ) ) ( not ( = ?auto_124011 ?auto_124012 ) ) ( not ( = ?auto_124011 ?auto_124013 ) ) ( not ( = ?auto_124011 ?auto_124014 ) ) ( not ( = ?auto_124011 ?auto_124015 ) ) ( not ( = ?auto_124012 ?auto_124013 ) ) ( not ( = ?auto_124012 ?auto_124014 ) ) ( not ( = ?auto_124012 ?auto_124015 ) ) ( not ( = ?auto_124013 ?auto_124014 ) ) ( not ( = ?auto_124013 ?auto_124015 ) ) ( not ( = ?auto_124014 ?auto_124015 ) ) ( not ( = ?auto_124010 ?auto_124016 ) ) ( not ( = ?auto_124011 ?auto_124016 ) ) ( not ( = ?auto_124012 ?auto_124016 ) ) ( not ( = ?auto_124013 ?auto_124016 ) ) ( not ( = ?auto_124014 ?auto_124016 ) ) ( not ( = ?auto_124015 ?auto_124016 ) ) ( ON-TABLE ?auto_124016 ) ( ON ?auto_124010 ?auto_124017 ) ( not ( = ?auto_124010 ?auto_124017 ) ) ( not ( = ?auto_124011 ?auto_124017 ) ) ( not ( = ?auto_124012 ?auto_124017 ) ) ( not ( = ?auto_124013 ?auto_124017 ) ) ( not ( = ?auto_124014 ?auto_124017 ) ) ( not ( = ?auto_124015 ?auto_124017 ) ) ( not ( = ?auto_124016 ?auto_124017 ) ) ( ON ?auto_124011 ?auto_124010 ) ( ON-TABLE ?auto_124017 ) ( ON ?auto_124012 ?auto_124011 ) ( ON ?auto_124013 ?auto_124012 ) ( ON ?auto_124014 ?auto_124013 ) ( CLEAR ?auto_124014 ) ( HOLDING ?auto_124015 ) ( CLEAR ?auto_124016 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124016 ?auto_124015 )
      ( MAKE-6PILE ?auto_124010 ?auto_124011 ?auto_124012 ?auto_124013 ?auto_124014 ?auto_124015 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124018 - BLOCK
      ?auto_124019 - BLOCK
      ?auto_124020 - BLOCK
      ?auto_124021 - BLOCK
      ?auto_124022 - BLOCK
      ?auto_124023 - BLOCK
    )
    :vars
    (
      ?auto_124024 - BLOCK
      ?auto_124025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124018 ?auto_124019 ) ) ( not ( = ?auto_124018 ?auto_124020 ) ) ( not ( = ?auto_124018 ?auto_124021 ) ) ( not ( = ?auto_124018 ?auto_124022 ) ) ( not ( = ?auto_124018 ?auto_124023 ) ) ( not ( = ?auto_124019 ?auto_124020 ) ) ( not ( = ?auto_124019 ?auto_124021 ) ) ( not ( = ?auto_124019 ?auto_124022 ) ) ( not ( = ?auto_124019 ?auto_124023 ) ) ( not ( = ?auto_124020 ?auto_124021 ) ) ( not ( = ?auto_124020 ?auto_124022 ) ) ( not ( = ?auto_124020 ?auto_124023 ) ) ( not ( = ?auto_124021 ?auto_124022 ) ) ( not ( = ?auto_124021 ?auto_124023 ) ) ( not ( = ?auto_124022 ?auto_124023 ) ) ( not ( = ?auto_124018 ?auto_124024 ) ) ( not ( = ?auto_124019 ?auto_124024 ) ) ( not ( = ?auto_124020 ?auto_124024 ) ) ( not ( = ?auto_124021 ?auto_124024 ) ) ( not ( = ?auto_124022 ?auto_124024 ) ) ( not ( = ?auto_124023 ?auto_124024 ) ) ( ON-TABLE ?auto_124024 ) ( ON ?auto_124018 ?auto_124025 ) ( not ( = ?auto_124018 ?auto_124025 ) ) ( not ( = ?auto_124019 ?auto_124025 ) ) ( not ( = ?auto_124020 ?auto_124025 ) ) ( not ( = ?auto_124021 ?auto_124025 ) ) ( not ( = ?auto_124022 ?auto_124025 ) ) ( not ( = ?auto_124023 ?auto_124025 ) ) ( not ( = ?auto_124024 ?auto_124025 ) ) ( ON ?auto_124019 ?auto_124018 ) ( ON-TABLE ?auto_124025 ) ( ON ?auto_124020 ?auto_124019 ) ( ON ?auto_124021 ?auto_124020 ) ( ON ?auto_124022 ?auto_124021 ) ( CLEAR ?auto_124024 ) ( ON ?auto_124023 ?auto_124022 ) ( CLEAR ?auto_124023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124025 ?auto_124018 ?auto_124019 ?auto_124020 ?auto_124021 ?auto_124022 )
      ( MAKE-6PILE ?auto_124018 ?auto_124019 ?auto_124020 ?auto_124021 ?auto_124022 ?auto_124023 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124026 - BLOCK
      ?auto_124027 - BLOCK
      ?auto_124028 - BLOCK
      ?auto_124029 - BLOCK
      ?auto_124030 - BLOCK
      ?auto_124031 - BLOCK
    )
    :vars
    (
      ?auto_124032 - BLOCK
      ?auto_124033 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124026 ?auto_124027 ) ) ( not ( = ?auto_124026 ?auto_124028 ) ) ( not ( = ?auto_124026 ?auto_124029 ) ) ( not ( = ?auto_124026 ?auto_124030 ) ) ( not ( = ?auto_124026 ?auto_124031 ) ) ( not ( = ?auto_124027 ?auto_124028 ) ) ( not ( = ?auto_124027 ?auto_124029 ) ) ( not ( = ?auto_124027 ?auto_124030 ) ) ( not ( = ?auto_124027 ?auto_124031 ) ) ( not ( = ?auto_124028 ?auto_124029 ) ) ( not ( = ?auto_124028 ?auto_124030 ) ) ( not ( = ?auto_124028 ?auto_124031 ) ) ( not ( = ?auto_124029 ?auto_124030 ) ) ( not ( = ?auto_124029 ?auto_124031 ) ) ( not ( = ?auto_124030 ?auto_124031 ) ) ( not ( = ?auto_124026 ?auto_124032 ) ) ( not ( = ?auto_124027 ?auto_124032 ) ) ( not ( = ?auto_124028 ?auto_124032 ) ) ( not ( = ?auto_124029 ?auto_124032 ) ) ( not ( = ?auto_124030 ?auto_124032 ) ) ( not ( = ?auto_124031 ?auto_124032 ) ) ( ON ?auto_124026 ?auto_124033 ) ( not ( = ?auto_124026 ?auto_124033 ) ) ( not ( = ?auto_124027 ?auto_124033 ) ) ( not ( = ?auto_124028 ?auto_124033 ) ) ( not ( = ?auto_124029 ?auto_124033 ) ) ( not ( = ?auto_124030 ?auto_124033 ) ) ( not ( = ?auto_124031 ?auto_124033 ) ) ( not ( = ?auto_124032 ?auto_124033 ) ) ( ON ?auto_124027 ?auto_124026 ) ( ON-TABLE ?auto_124033 ) ( ON ?auto_124028 ?auto_124027 ) ( ON ?auto_124029 ?auto_124028 ) ( ON ?auto_124030 ?auto_124029 ) ( ON ?auto_124031 ?auto_124030 ) ( CLEAR ?auto_124031 ) ( HOLDING ?auto_124032 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124032 )
      ( MAKE-6PILE ?auto_124026 ?auto_124027 ?auto_124028 ?auto_124029 ?auto_124030 ?auto_124031 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_124034 - BLOCK
      ?auto_124035 - BLOCK
      ?auto_124036 - BLOCK
      ?auto_124037 - BLOCK
      ?auto_124038 - BLOCK
      ?auto_124039 - BLOCK
    )
    :vars
    (
      ?auto_124040 - BLOCK
      ?auto_124041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124034 ?auto_124035 ) ) ( not ( = ?auto_124034 ?auto_124036 ) ) ( not ( = ?auto_124034 ?auto_124037 ) ) ( not ( = ?auto_124034 ?auto_124038 ) ) ( not ( = ?auto_124034 ?auto_124039 ) ) ( not ( = ?auto_124035 ?auto_124036 ) ) ( not ( = ?auto_124035 ?auto_124037 ) ) ( not ( = ?auto_124035 ?auto_124038 ) ) ( not ( = ?auto_124035 ?auto_124039 ) ) ( not ( = ?auto_124036 ?auto_124037 ) ) ( not ( = ?auto_124036 ?auto_124038 ) ) ( not ( = ?auto_124036 ?auto_124039 ) ) ( not ( = ?auto_124037 ?auto_124038 ) ) ( not ( = ?auto_124037 ?auto_124039 ) ) ( not ( = ?auto_124038 ?auto_124039 ) ) ( not ( = ?auto_124034 ?auto_124040 ) ) ( not ( = ?auto_124035 ?auto_124040 ) ) ( not ( = ?auto_124036 ?auto_124040 ) ) ( not ( = ?auto_124037 ?auto_124040 ) ) ( not ( = ?auto_124038 ?auto_124040 ) ) ( not ( = ?auto_124039 ?auto_124040 ) ) ( ON ?auto_124034 ?auto_124041 ) ( not ( = ?auto_124034 ?auto_124041 ) ) ( not ( = ?auto_124035 ?auto_124041 ) ) ( not ( = ?auto_124036 ?auto_124041 ) ) ( not ( = ?auto_124037 ?auto_124041 ) ) ( not ( = ?auto_124038 ?auto_124041 ) ) ( not ( = ?auto_124039 ?auto_124041 ) ) ( not ( = ?auto_124040 ?auto_124041 ) ) ( ON ?auto_124035 ?auto_124034 ) ( ON-TABLE ?auto_124041 ) ( ON ?auto_124036 ?auto_124035 ) ( ON ?auto_124037 ?auto_124036 ) ( ON ?auto_124038 ?auto_124037 ) ( ON ?auto_124039 ?auto_124038 ) ( ON ?auto_124040 ?auto_124039 ) ( CLEAR ?auto_124040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124041 ?auto_124034 ?auto_124035 ?auto_124036 ?auto_124037 ?auto_124038 ?auto_124039 )
      ( MAKE-6PILE ?auto_124034 ?auto_124035 ?auto_124036 ?auto_124037 ?auto_124038 ?auto_124039 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124049 - BLOCK
      ?auto_124050 - BLOCK
      ?auto_124051 - BLOCK
      ?auto_124052 - BLOCK
      ?auto_124053 - BLOCK
      ?auto_124054 - BLOCK
      ?auto_124055 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_124055 ) ( CLEAR ?auto_124054 ) ( ON-TABLE ?auto_124049 ) ( ON ?auto_124050 ?auto_124049 ) ( ON ?auto_124051 ?auto_124050 ) ( ON ?auto_124052 ?auto_124051 ) ( ON ?auto_124053 ?auto_124052 ) ( ON ?auto_124054 ?auto_124053 ) ( not ( = ?auto_124049 ?auto_124050 ) ) ( not ( = ?auto_124049 ?auto_124051 ) ) ( not ( = ?auto_124049 ?auto_124052 ) ) ( not ( = ?auto_124049 ?auto_124053 ) ) ( not ( = ?auto_124049 ?auto_124054 ) ) ( not ( = ?auto_124049 ?auto_124055 ) ) ( not ( = ?auto_124050 ?auto_124051 ) ) ( not ( = ?auto_124050 ?auto_124052 ) ) ( not ( = ?auto_124050 ?auto_124053 ) ) ( not ( = ?auto_124050 ?auto_124054 ) ) ( not ( = ?auto_124050 ?auto_124055 ) ) ( not ( = ?auto_124051 ?auto_124052 ) ) ( not ( = ?auto_124051 ?auto_124053 ) ) ( not ( = ?auto_124051 ?auto_124054 ) ) ( not ( = ?auto_124051 ?auto_124055 ) ) ( not ( = ?auto_124052 ?auto_124053 ) ) ( not ( = ?auto_124052 ?auto_124054 ) ) ( not ( = ?auto_124052 ?auto_124055 ) ) ( not ( = ?auto_124053 ?auto_124054 ) ) ( not ( = ?auto_124053 ?auto_124055 ) ) ( not ( = ?auto_124054 ?auto_124055 ) ) )
    :subtasks
    ( ( !STACK ?auto_124055 ?auto_124054 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124056 - BLOCK
      ?auto_124057 - BLOCK
      ?auto_124058 - BLOCK
      ?auto_124059 - BLOCK
      ?auto_124060 - BLOCK
      ?auto_124061 - BLOCK
      ?auto_124062 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_124061 ) ( ON-TABLE ?auto_124056 ) ( ON ?auto_124057 ?auto_124056 ) ( ON ?auto_124058 ?auto_124057 ) ( ON ?auto_124059 ?auto_124058 ) ( ON ?auto_124060 ?auto_124059 ) ( ON ?auto_124061 ?auto_124060 ) ( not ( = ?auto_124056 ?auto_124057 ) ) ( not ( = ?auto_124056 ?auto_124058 ) ) ( not ( = ?auto_124056 ?auto_124059 ) ) ( not ( = ?auto_124056 ?auto_124060 ) ) ( not ( = ?auto_124056 ?auto_124061 ) ) ( not ( = ?auto_124056 ?auto_124062 ) ) ( not ( = ?auto_124057 ?auto_124058 ) ) ( not ( = ?auto_124057 ?auto_124059 ) ) ( not ( = ?auto_124057 ?auto_124060 ) ) ( not ( = ?auto_124057 ?auto_124061 ) ) ( not ( = ?auto_124057 ?auto_124062 ) ) ( not ( = ?auto_124058 ?auto_124059 ) ) ( not ( = ?auto_124058 ?auto_124060 ) ) ( not ( = ?auto_124058 ?auto_124061 ) ) ( not ( = ?auto_124058 ?auto_124062 ) ) ( not ( = ?auto_124059 ?auto_124060 ) ) ( not ( = ?auto_124059 ?auto_124061 ) ) ( not ( = ?auto_124059 ?auto_124062 ) ) ( not ( = ?auto_124060 ?auto_124061 ) ) ( not ( = ?auto_124060 ?auto_124062 ) ) ( not ( = ?auto_124061 ?auto_124062 ) ) ( ON-TABLE ?auto_124062 ) ( CLEAR ?auto_124062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_124062 )
      ( MAKE-7PILE ?auto_124056 ?auto_124057 ?auto_124058 ?auto_124059 ?auto_124060 ?auto_124061 ?auto_124062 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124063 - BLOCK
      ?auto_124064 - BLOCK
      ?auto_124065 - BLOCK
      ?auto_124066 - BLOCK
      ?auto_124067 - BLOCK
      ?auto_124068 - BLOCK
      ?auto_124069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124063 ) ( ON ?auto_124064 ?auto_124063 ) ( ON ?auto_124065 ?auto_124064 ) ( ON ?auto_124066 ?auto_124065 ) ( ON ?auto_124067 ?auto_124066 ) ( not ( = ?auto_124063 ?auto_124064 ) ) ( not ( = ?auto_124063 ?auto_124065 ) ) ( not ( = ?auto_124063 ?auto_124066 ) ) ( not ( = ?auto_124063 ?auto_124067 ) ) ( not ( = ?auto_124063 ?auto_124068 ) ) ( not ( = ?auto_124063 ?auto_124069 ) ) ( not ( = ?auto_124064 ?auto_124065 ) ) ( not ( = ?auto_124064 ?auto_124066 ) ) ( not ( = ?auto_124064 ?auto_124067 ) ) ( not ( = ?auto_124064 ?auto_124068 ) ) ( not ( = ?auto_124064 ?auto_124069 ) ) ( not ( = ?auto_124065 ?auto_124066 ) ) ( not ( = ?auto_124065 ?auto_124067 ) ) ( not ( = ?auto_124065 ?auto_124068 ) ) ( not ( = ?auto_124065 ?auto_124069 ) ) ( not ( = ?auto_124066 ?auto_124067 ) ) ( not ( = ?auto_124066 ?auto_124068 ) ) ( not ( = ?auto_124066 ?auto_124069 ) ) ( not ( = ?auto_124067 ?auto_124068 ) ) ( not ( = ?auto_124067 ?auto_124069 ) ) ( not ( = ?auto_124068 ?auto_124069 ) ) ( ON-TABLE ?auto_124069 ) ( CLEAR ?auto_124069 ) ( HOLDING ?auto_124068 ) ( CLEAR ?auto_124067 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124063 ?auto_124064 ?auto_124065 ?auto_124066 ?auto_124067 ?auto_124068 )
      ( MAKE-7PILE ?auto_124063 ?auto_124064 ?auto_124065 ?auto_124066 ?auto_124067 ?auto_124068 ?auto_124069 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124070 - BLOCK
      ?auto_124071 - BLOCK
      ?auto_124072 - BLOCK
      ?auto_124073 - BLOCK
      ?auto_124074 - BLOCK
      ?auto_124075 - BLOCK
      ?auto_124076 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124070 ) ( ON ?auto_124071 ?auto_124070 ) ( ON ?auto_124072 ?auto_124071 ) ( ON ?auto_124073 ?auto_124072 ) ( ON ?auto_124074 ?auto_124073 ) ( not ( = ?auto_124070 ?auto_124071 ) ) ( not ( = ?auto_124070 ?auto_124072 ) ) ( not ( = ?auto_124070 ?auto_124073 ) ) ( not ( = ?auto_124070 ?auto_124074 ) ) ( not ( = ?auto_124070 ?auto_124075 ) ) ( not ( = ?auto_124070 ?auto_124076 ) ) ( not ( = ?auto_124071 ?auto_124072 ) ) ( not ( = ?auto_124071 ?auto_124073 ) ) ( not ( = ?auto_124071 ?auto_124074 ) ) ( not ( = ?auto_124071 ?auto_124075 ) ) ( not ( = ?auto_124071 ?auto_124076 ) ) ( not ( = ?auto_124072 ?auto_124073 ) ) ( not ( = ?auto_124072 ?auto_124074 ) ) ( not ( = ?auto_124072 ?auto_124075 ) ) ( not ( = ?auto_124072 ?auto_124076 ) ) ( not ( = ?auto_124073 ?auto_124074 ) ) ( not ( = ?auto_124073 ?auto_124075 ) ) ( not ( = ?auto_124073 ?auto_124076 ) ) ( not ( = ?auto_124074 ?auto_124075 ) ) ( not ( = ?auto_124074 ?auto_124076 ) ) ( not ( = ?auto_124075 ?auto_124076 ) ) ( ON-TABLE ?auto_124076 ) ( CLEAR ?auto_124074 ) ( ON ?auto_124075 ?auto_124076 ) ( CLEAR ?auto_124075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124076 )
      ( MAKE-7PILE ?auto_124070 ?auto_124071 ?auto_124072 ?auto_124073 ?auto_124074 ?auto_124075 ?auto_124076 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124077 - BLOCK
      ?auto_124078 - BLOCK
      ?auto_124079 - BLOCK
      ?auto_124080 - BLOCK
      ?auto_124081 - BLOCK
      ?auto_124082 - BLOCK
      ?auto_124083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124077 ) ( ON ?auto_124078 ?auto_124077 ) ( ON ?auto_124079 ?auto_124078 ) ( ON ?auto_124080 ?auto_124079 ) ( not ( = ?auto_124077 ?auto_124078 ) ) ( not ( = ?auto_124077 ?auto_124079 ) ) ( not ( = ?auto_124077 ?auto_124080 ) ) ( not ( = ?auto_124077 ?auto_124081 ) ) ( not ( = ?auto_124077 ?auto_124082 ) ) ( not ( = ?auto_124077 ?auto_124083 ) ) ( not ( = ?auto_124078 ?auto_124079 ) ) ( not ( = ?auto_124078 ?auto_124080 ) ) ( not ( = ?auto_124078 ?auto_124081 ) ) ( not ( = ?auto_124078 ?auto_124082 ) ) ( not ( = ?auto_124078 ?auto_124083 ) ) ( not ( = ?auto_124079 ?auto_124080 ) ) ( not ( = ?auto_124079 ?auto_124081 ) ) ( not ( = ?auto_124079 ?auto_124082 ) ) ( not ( = ?auto_124079 ?auto_124083 ) ) ( not ( = ?auto_124080 ?auto_124081 ) ) ( not ( = ?auto_124080 ?auto_124082 ) ) ( not ( = ?auto_124080 ?auto_124083 ) ) ( not ( = ?auto_124081 ?auto_124082 ) ) ( not ( = ?auto_124081 ?auto_124083 ) ) ( not ( = ?auto_124082 ?auto_124083 ) ) ( ON-TABLE ?auto_124083 ) ( ON ?auto_124082 ?auto_124083 ) ( CLEAR ?auto_124082 ) ( HOLDING ?auto_124081 ) ( CLEAR ?auto_124080 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124077 ?auto_124078 ?auto_124079 ?auto_124080 ?auto_124081 )
      ( MAKE-7PILE ?auto_124077 ?auto_124078 ?auto_124079 ?auto_124080 ?auto_124081 ?auto_124082 ?auto_124083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124084 - BLOCK
      ?auto_124085 - BLOCK
      ?auto_124086 - BLOCK
      ?auto_124087 - BLOCK
      ?auto_124088 - BLOCK
      ?auto_124089 - BLOCK
      ?auto_124090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124084 ) ( ON ?auto_124085 ?auto_124084 ) ( ON ?auto_124086 ?auto_124085 ) ( ON ?auto_124087 ?auto_124086 ) ( not ( = ?auto_124084 ?auto_124085 ) ) ( not ( = ?auto_124084 ?auto_124086 ) ) ( not ( = ?auto_124084 ?auto_124087 ) ) ( not ( = ?auto_124084 ?auto_124088 ) ) ( not ( = ?auto_124084 ?auto_124089 ) ) ( not ( = ?auto_124084 ?auto_124090 ) ) ( not ( = ?auto_124085 ?auto_124086 ) ) ( not ( = ?auto_124085 ?auto_124087 ) ) ( not ( = ?auto_124085 ?auto_124088 ) ) ( not ( = ?auto_124085 ?auto_124089 ) ) ( not ( = ?auto_124085 ?auto_124090 ) ) ( not ( = ?auto_124086 ?auto_124087 ) ) ( not ( = ?auto_124086 ?auto_124088 ) ) ( not ( = ?auto_124086 ?auto_124089 ) ) ( not ( = ?auto_124086 ?auto_124090 ) ) ( not ( = ?auto_124087 ?auto_124088 ) ) ( not ( = ?auto_124087 ?auto_124089 ) ) ( not ( = ?auto_124087 ?auto_124090 ) ) ( not ( = ?auto_124088 ?auto_124089 ) ) ( not ( = ?auto_124088 ?auto_124090 ) ) ( not ( = ?auto_124089 ?auto_124090 ) ) ( ON-TABLE ?auto_124090 ) ( ON ?auto_124089 ?auto_124090 ) ( CLEAR ?auto_124087 ) ( ON ?auto_124088 ?auto_124089 ) ( CLEAR ?auto_124088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124090 ?auto_124089 )
      ( MAKE-7PILE ?auto_124084 ?auto_124085 ?auto_124086 ?auto_124087 ?auto_124088 ?auto_124089 ?auto_124090 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124091 - BLOCK
      ?auto_124092 - BLOCK
      ?auto_124093 - BLOCK
      ?auto_124094 - BLOCK
      ?auto_124095 - BLOCK
      ?auto_124096 - BLOCK
      ?auto_124097 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124091 ) ( ON ?auto_124092 ?auto_124091 ) ( ON ?auto_124093 ?auto_124092 ) ( not ( = ?auto_124091 ?auto_124092 ) ) ( not ( = ?auto_124091 ?auto_124093 ) ) ( not ( = ?auto_124091 ?auto_124094 ) ) ( not ( = ?auto_124091 ?auto_124095 ) ) ( not ( = ?auto_124091 ?auto_124096 ) ) ( not ( = ?auto_124091 ?auto_124097 ) ) ( not ( = ?auto_124092 ?auto_124093 ) ) ( not ( = ?auto_124092 ?auto_124094 ) ) ( not ( = ?auto_124092 ?auto_124095 ) ) ( not ( = ?auto_124092 ?auto_124096 ) ) ( not ( = ?auto_124092 ?auto_124097 ) ) ( not ( = ?auto_124093 ?auto_124094 ) ) ( not ( = ?auto_124093 ?auto_124095 ) ) ( not ( = ?auto_124093 ?auto_124096 ) ) ( not ( = ?auto_124093 ?auto_124097 ) ) ( not ( = ?auto_124094 ?auto_124095 ) ) ( not ( = ?auto_124094 ?auto_124096 ) ) ( not ( = ?auto_124094 ?auto_124097 ) ) ( not ( = ?auto_124095 ?auto_124096 ) ) ( not ( = ?auto_124095 ?auto_124097 ) ) ( not ( = ?auto_124096 ?auto_124097 ) ) ( ON-TABLE ?auto_124097 ) ( ON ?auto_124096 ?auto_124097 ) ( ON ?auto_124095 ?auto_124096 ) ( CLEAR ?auto_124095 ) ( HOLDING ?auto_124094 ) ( CLEAR ?auto_124093 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124091 ?auto_124092 ?auto_124093 ?auto_124094 )
      ( MAKE-7PILE ?auto_124091 ?auto_124092 ?auto_124093 ?auto_124094 ?auto_124095 ?auto_124096 ?auto_124097 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124098 - BLOCK
      ?auto_124099 - BLOCK
      ?auto_124100 - BLOCK
      ?auto_124101 - BLOCK
      ?auto_124102 - BLOCK
      ?auto_124103 - BLOCK
      ?auto_124104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124098 ) ( ON ?auto_124099 ?auto_124098 ) ( ON ?auto_124100 ?auto_124099 ) ( not ( = ?auto_124098 ?auto_124099 ) ) ( not ( = ?auto_124098 ?auto_124100 ) ) ( not ( = ?auto_124098 ?auto_124101 ) ) ( not ( = ?auto_124098 ?auto_124102 ) ) ( not ( = ?auto_124098 ?auto_124103 ) ) ( not ( = ?auto_124098 ?auto_124104 ) ) ( not ( = ?auto_124099 ?auto_124100 ) ) ( not ( = ?auto_124099 ?auto_124101 ) ) ( not ( = ?auto_124099 ?auto_124102 ) ) ( not ( = ?auto_124099 ?auto_124103 ) ) ( not ( = ?auto_124099 ?auto_124104 ) ) ( not ( = ?auto_124100 ?auto_124101 ) ) ( not ( = ?auto_124100 ?auto_124102 ) ) ( not ( = ?auto_124100 ?auto_124103 ) ) ( not ( = ?auto_124100 ?auto_124104 ) ) ( not ( = ?auto_124101 ?auto_124102 ) ) ( not ( = ?auto_124101 ?auto_124103 ) ) ( not ( = ?auto_124101 ?auto_124104 ) ) ( not ( = ?auto_124102 ?auto_124103 ) ) ( not ( = ?auto_124102 ?auto_124104 ) ) ( not ( = ?auto_124103 ?auto_124104 ) ) ( ON-TABLE ?auto_124104 ) ( ON ?auto_124103 ?auto_124104 ) ( ON ?auto_124102 ?auto_124103 ) ( CLEAR ?auto_124100 ) ( ON ?auto_124101 ?auto_124102 ) ( CLEAR ?auto_124101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124104 ?auto_124103 ?auto_124102 )
      ( MAKE-7PILE ?auto_124098 ?auto_124099 ?auto_124100 ?auto_124101 ?auto_124102 ?auto_124103 ?auto_124104 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124105 - BLOCK
      ?auto_124106 - BLOCK
      ?auto_124107 - BLOCK
      ?auto_124108 - BLOCK
      ?auto_124109 - BLOCK
      ?auto_124110 - BLOCK
      ?auto_124111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124105 ) ( ON ?auto_124106 ?auto_124105 ) ( not ( = ?auto_124105 ?auto_124106 ) ) ( not ( = ?auto_124105 ?auto_124107 ) ) ( not ( = ?auto_124105 ?auto_124108 ) ) ( not ( = ?auto_124105 ?auto_124109 ) ) ( not ( = ?auto_124105 ?auto_124110 ) ) ( not ( = ?auto_124105 ?auto_124111 ) ) ( not ( = ?auto_124106 ?auto_124107 ) ) ( not ( = ?auto_124106 ?auto_124108 ) ) ( not ( = ?auto_124106 ?auto_124109 ) ) ( not ( = ?auto_124106 ?auto_124110 ) ) ( not ( = ?auto_124106 ?auto_124111 ) ) ( not ( = ?auto_124107 ?auto_124108 ) ) ( not ( = ?auto_124107 ?auto_124109 ) ) ( not ( = ?auto_124107 ?auto_124110 ) ) ( not ( = ?auto_124107 ?auto_124111 ) ) ( not ( = ?auto_124108 ?auto_124109 ) ) ( not ( = ?auto_124108 ?auto_124110 ) ) ( not ( = ?auto_124108 ?auto_124111 ) ) ( not ( = ?auto_124109 ?auto_124110 ) ) ( not ( = ?auto_124109 ?auto_124111 ) ) ( not ( = ?auto_124110 ?auto_124111 ) ) ( ON-TABLE ?auto_124111 ) ( ON ?auto_124110 ?auto_124111 ) ( ON ?auto_124109 ?auto_124110 ) ( ON ?auto_124108 ?auto_124109 ) ( CLEAR ?auto_124108 ) ( HOLDING ?auto_124107 ) ( CLEAR ?auto_124106 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124105 ?auto_124106 ?auto_124107 )
      ( MAKE-7PILE ?auto_124105 ?auto_124106 ?auto_124107 ?auto_124108 ?auto_124109 ?auto_124110 ?auto_124111 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124112 - BLOCK
      ?auto_124113 - BLOCK
      ?auto_124114 - BLOCK
      ?auto_124115 - BLOCK
      ?auto_124116 - BLOCK
      ?auto_124117 - BLOCK
      ?auto_124118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124112 ) ( ON ?auto_124113 ?auto_124112 ) ( not ( = ?auto_124112 ?auto_124113 ) ) ( not ( = ?auto_124112 ?auto_124114 ) ) ( not ( = ?auto_124112 ?auto_124115 ) ) ( not ( = ?auto_124112 ?auto_124116 ) ) ( not ( = ?auto_124112 ?auto_124117 ) ) ( not ( = ?auto_124112 ?auto_124118 ) ) ( not ( = ?auto_124113 ?auto_124114 ) ) ( not ( = ?auto_124113 ?auto_124115 ) ) ( not ( = ?auto_124113 ?auto_124116 ) ) ( not ( = ?auto_124113 ?auto_124117 ) ) ( not ( = ?auto_124113 ?auto_124118 ) ) ( not ( = ?auto_124114 ?auto_124115 ) ) ( not ( = ?auto_124114 ?auto_124116 ) ) ( not ( = ?auto_124114 ?auto_124117 ) ) ( not ( = ?auto_124114 ?auto_124118 ) ) ( not ( = ?auto_124115 ?auto_124116 ) ) ( not ( = ?auto_124115 ?auto_124117 ) ) ( not ( = ?auto_124115 ?auto_124118 ) ) ( not ( = ?auto_124116 ?auto_124117 ) ) ( not ( = ?auto_124116 ?auto_124118 ) ) ( not ( = ?auto_124117 ?auto_124118 ) ) ( ON-TABLE ?auto_124118 ) ( ON ?auto_124117 ?auto_124118 ) ( ON ?auto_124116 ?auto_124117 ) ( ON ?auto_124115 ?auto_124116 ) ( CLEAR ?auto_124113 ) ( ON ?auto_124114 ?auto_124115 ) ( CLEAR ?auto_124114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124118 ?auto_124117 ?auto_124116 ?auto_124115 )
      ( MAKE-7PILE ?auto_124112 ?auto_124113 ?auto_124114 ?auto_124115 ?auto_124116 ?auto_124117 ?auto_124118 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124119 - BLOCK
      ?auto_124120 - BLOCK
      ?auto_124121 - BLOCK
      ?auto_124122 - BLOCK
      ?auto_124123 - BLOCK
      ?auto_124124 - BLOCK
      ?auto_124125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124119 ) ( not ( = ?auto_124119 ?auto_124120 ) ) ( not ( = ?auto_124119 ?auto_124121 ) ) ( not ( = ?auto_124119 ?auto_124122 ) ) ( not ( = ?auto_124119 ?auto_124123 ) ) ( not ( = ?auto_124119 ?auto_124124 ) ) ( not ( = ?auto_124119 ?auto_124125 ) ) ( not ( = ?auto_124120 ?auto_124121 ) ) ( not ( = ?auto_124120 ?auto_124122 ) ) ( not ( = ?auto_124120 ?auto_124123 ) ) ( not ( = ?auto_124120 ?auto_124124 ) ) ( not ( = ?auto_124120 ?auto_124125 ) ) ( not ( = ?auto_124121 ?auto_124122 ) ) ( not ( = ?auto_124121 ?auto_124123 ) ) ( not ( = ?auto_124121 ?auto_124124 ) ) ( not ( = ?auto_124121 ?auto_124125 ) ) ( not ( = ?auto_124122 ?auto_124123 ) ) ( not ( = ?auto_124122 ?auto_124124 ) ) ( not ( = ?auto_124122 ?auto_124125 ) ) ( not ( = ?auto_124123 ?auto_124124 ) ) ( not ( = ?auto_124123 ?auto_124125 ) ) ( not ( = ?auto_124124 ?auto_124125 ) ) ( ON-TABLE ?auto_124125 ) ( ON ?auto_124124 ?auto_124125 ) ( ON ?auto_124123 ?auto_124124 ) ( ON ?auto_124122 ?auto_124123 ) ( ON ?auto_124121 ?auto_124122 ) ( CLEAR ?auto_124121 ) ( HOLDING ?auto_124120 ) ( CLEAR ?auto_124119 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124119 ?auto_124120 )
      ( MAKE-7PILE ?auto_124119 ?auto_124120 ?auto_124121 ?auto_124122 ?auto_124123 ?auto_124124 ?auto_124125 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124126 - BLOCK
      ?auto_124127 - BLOCK
      ?auto_124128 - BLOCK
      ?auto_124129 - BLOCK
      ?auto_124130 - BLOCK
      ?auto_124131 - BLOCK
      ?auto_124132 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_124126 ) ( not ( = ?auto_124126 ?auto_124127 ) ) ( not ( = ?auto_124126 ?auto_124128 ) ) ( not ( = ?auto_124126 ?auto_124129 ) ) ( not ( = ?auto_124126 ?auto_124130 ) ) ( not ( = ?auto_124126 ?auto_124131 ) ) ( not ( = ?auto_124126 ?auto_124132 ) ) ( not ( = ?auto_124127 ?auto_124128 ) ) ( not ( = ?auto_124127 ?auto_124129 ) ) ( not ( = ?auto_124127 ?auto_124130 ) ) ( not ( = ?auto_124127 ?auto_124131 ) ) ( not ( = ?auto_124127 ?auto_124132 ) ) ( not ( = ?auto_124128 ?auto_124129 ) ) ( not ( = ?auto_124128 ?auto_124130 ) ) ( not ( = ?auto_124128 ?auto_124131 ) ) ( not ( = ?auto_124128 ?auto_124132 ) ) ( not ( = ?auto_124129 ?auto_124130 ) ) ( not ( = ?auto_124129 ?auto_124131 ) ) ( not ( = ?auto_124129 ?auto_124132 ) ) ( not ( = ?auto_124130 ?auto_124131 ) ) ( not ( = ?auto_124130 ?auto_124132 ) ) ( not ( = ?auto_124131 ?auto_124132 ) ) ( ON-TABLE ?auto_124132 ) ( ON ?auto_124131 ?auto_124132 ) ( ON ?auto_124130 ?auto_124131 ) ( ON ?auto_124129 ?auto_124130 ) ( ON ?auto_124128 ?auto_124129 ) ( CLEAR ?auto_124126 ) ( ON ?auto_124127 ?auto_124128 ) ( CLEAR ?auto_124127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124132 ?auto_124131 ?auto_124130 ?auto_124129 ?auto_124128 )
      ( MAKE-7PILE ?auto_124126 ?auto_124127 ?auto_124128 ?auto_124129 ?auto_124130 ?auto_124131 ?auto_124132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124133 - BLOCK
      ?auto_124134 - BLOCK
      ?auto_124135 - BLOCK
      ?auto_124136 - BLOCK
      ?auto_124137 - BLOCK
      ?auto_124138 - BLOCK
      ?auto_124139 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124133 ?auto_124134 ) ) ( not ( = ?auto_124133 ?auto_124135 ) ) ( not ( = ?auto_124133 ?auto_124136 ) ) ( not ( = ?auto_124133 ?auto_124137 ) ) ( not ( = ?auto_124133 ?auto_124138 ) ) ( not ( = ?auto_124133 ?auto_124139 ) ) ( not ( = ?auto_124134 ?auto_124135 ) ) ( not ( = ?auto_124134 ?auto_124136 ) ) ( not ( = ?auto_124134 ?auto_124137 ) ) ( not ( = ?auto_124134 ?auto_124138 ) ) ( not ( = ?auto_124134 ?auto_124139 ) ) ( not ( = ?auto_124135 ?auto_124136 ) ) ( not ( = ?auto_124135 ?auto_124137 ) ) ( not ( = ?auto_124135 ?auto_124138 ) ) ( not ( = ?auto_124135 ?auto_124139 ) ) ( not ( = ?auto_124136 ?auto_124137 ) ) ( not ( = ?auto_124136 ?auto_124138 ) ) ( not ( = ?auto_124136 ?auto_124139 ) ) ( not ( = ?auto_124137 ?auto_124138 ) ) ( not ( = ?auto_124137 ?auto_124139 ) ) ( not ( = ?auto_124138 ?auto_124139 ) ) ( ON-TABLE ?auto_124139 ) ( ON ?auto_124138 ?auto_124139 ) ( ON ?auto_124137 ?auto_124138 ) ( ON ?auto_124136 ?auto_124137 ) ( ON ?auto_124135 ?auto_124136 ) ( ON ?auto_124134 ?auto_124135 ) ( CLEAR ?auto_124134 ) ( HOLDING ?auto_124133 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124133 )
      ( MAKE-7PILE ?auto_124133 ?auto_124134 ?auto_124135 ?auto_124136 ?auto_124137 ?auto_124138 ?auto_124139 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124140 - BLOCK
      ?auto_124141 - BLOCK
      ?auto_124142 - BLOCK
      ?auto_124143 - BLOCK
      ?auto_124144 - BLOCK
      ?auto_124145 - BLOCK
      ?auto_124146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124140 ?auto_124141 ) ) ( not ( = ?auto_124140 ?auto_124142 ) ) ( not ( = ?auto_124140 ?auto_124143 ) ) ( not ( = ?auto_124140 ?auto_124144 ) ) ( not ( = ?auto_124140 ?auto_124145 ) ) ( not ( = ?auto_124140 ?auto_124146 ) ) ( not ( = ?auto_124141 ?auto_124142 ) ) ( not ( = ?auto_124141 ?auto_124143 ) ) ( not ( = ?auto_124141 ?auto_124144 ) ) ( not ( = ?auto_124141 ?auto_124145 ) ) ( not ( = ?auto_124141 ?auto_124146 ) ) ( not ( = ?auto_124142 ?auto_124143 ) ) ( not ( = ?auto_124142 ?auto_124144 ) ) ( not ( = ?auto_124142 ?auto_124145 ) ) ( not ( = ?auto_124142 ?auto_124146 ) ) ( not ( = ?auto_124143 ?auto_124144 ) ) ( not ( = ?auto_124143 ?auto_124145 ) ) ( not ( = ?auto_124143 ?auto_124146 ) ) ( not ( = ?auto_124144 ?auto_124145 ) ) ( not ( = ?auto_124144 ?auto_124146 ) ) ( not ( = ?auto_124145 ?auto_124146 ) ) ( ON-TABLE ?auto_124146 ) ( ON ?auto_124145 ?auto_124146 ) ( ON ?auto_124144 ?auto_124145 ) ( ON ?auto_124143 ?auto_124144 ) ( ON ?auto_124142 ?auto_124143 ) ( ON ?auto_124141 ?auto_124142 ) ( ON ?auto_124140 ?auto_124141 ) ( CLEAR ?auto_124140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124146 ?auto_124145 ?auto_124144 ?auto_124143 ?auto_124142 ?auto_124141 )
      ( MAKE-7PILE ?auto_124140 ?auto_124141 ?auto_124142 ?auto_124143 ?auto_124144 ?auto_124145 ?auto_124146 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124147 - BLOCK
      ?auto_124148 - BLOCK
      ?auto_124149 - BLOCK
      ?auto_124150 - BLOCK
      ?auto_124151 - BLOCK
      ?auto_124152 - BLOCK
      ?auto_124153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124147 ?auto_124148 ) ) ( not ( = ?auto_124147 ?auto_124149 ) ) ( not ( = ?auto_124147 ?auto_124150 ) ) ( not ( = ?auto_124147 ?auto_124151 ) ) ( not ( = ?auto_124147 ?auto_124152 ) ) ( not ( = ?auto_124147 ?auto_124153 ) ) ( not ( = ?auto_124148 ?auto_124149 ) ) ( not ( = ?auto_124148 ?auto_124150 ) ) ( not ( = ?auto_124148 ?auto_124151 ) ) ( not ( = ?auto_124148 ?auto_124152 ) ) ( not ( = ?auto_124148 ?auto_124153 ) ) ( not ( = ?auto_124149 ?auto_124150 ) ) ( not ( = ?auto_124149 ?auto_124151 ) ) ( not ( = ?auto_124149 ?auto_124152 ) ) ( not ( = ?auto_124149 ?auto_124153 ) ) ( not ( = ?auto_124150 ?auto_124151 ) ) ( not ( = ?auto_124150 ?auto_124152 ) ) ( not ( = ?auto_124150 ?auto_124153 ) ) ( not ( = ?auto_124151 ?auto_124152 ) ) ( not ( = ?auto_124151 ?auto_124153 ) ) ( not ( = ?auto_124152 ?auto_124153 ) ) ( ON-TABLE ?auto_124153 ) ( ON ?auto_124152 ?auto_124153 ) ( ON ?auto_124151 ?auto_124152 ) ( ON ?auto_124150 ?auto_124151 ) ( ON ?auto_124149 ?auto_124150 ) ( ON ?auto_124148 ?auto_124149 ) ( HOLDING ?auto_124147 ) ( CLEAR ?auto_124148 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124153 ?auto_124152 ?auto_124151 ?auto_124150 ?auto_124149 ?auto_124148 ?auto_124147 )
      ( MAKE-7PILE ?auto_124147 ?auto_124148 ?auto_124149 ?auto_124150 ?auto_124151 ?auto_124152 ?auto_124153 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124154 - BLOCK
      ?auto_124155 - BLOCK
      ?auto_124156 - BLOCK
      ?auto_124157 - BLOCK
      ?auto_124158 - BLOCK
      ?auto_124159 - BLOCK
      ?auto_124160 - BLOCK
    )
    :vars
    (
      ?auto_124161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124154 ?auto_124155 ) ) ( not ( = ?auto_124154 ?auto_124156 ) ) ( not ( = ?auto_124154 ?auto_124157 ) ) ( not ( = ?auto_124154 ?auto_124158 ) ) ( not ( = ?auto_124154 ?auto_124159 ) ) ( not ( = ?auto_124154 ?auto_124160 ) ) ( not ( = ?auto_124155 ?auto_124156 ) ) ( not ( = ?auto_124155 ?auto_124157 ) ) ( not ( = ?auto_124155 ?auto_124158 ) ) ( not ( = ?auto_124155 ?auto_124159 ) ) ( not ( = ?auto_124155 ?auto_124160 ) ) ( not ( = ?auto_124156 ?auto_124157 ) ) ( not ( = ?auto_124156 ?auto_124158 ) ) ( not ( = ?auto_124156 ?auto_124159 ) ) ( not ( = ?auto_124156 ?auto_124160 ) ) ( not ( = ?auto_124157 ?auto_124158 ) ) ( not ( = ?auto_124157 ?auto_124159 ) ) ( not ( = ?auto_124157 ?auto_124160 ) ) ( not ( = ?auto_124158 ?auto_124159 ) ) ( not ( = ?auto_124158 ?auto_124160 ) ) ( not ( = ?auto_124159 ?auto_124160 ) ) ( ON-TABLE ?auto_124160 ) ( ON ?auto_124159 ?auto_124160 ) ( ON ?auto_124158 ?auto_124159 ) ( ON ?auto_124157 ?auto_124158 ) ( ON ?auto_124156 ?auto_124157 ) ( ON ?auto_124155 ?auto_124156 ) ( CLEAR ?auto_124155 ) ( ON ?auto_124154 ?auto_124161 ) ( CLEAR ?auto_124154 ) ( HAND-EMPTY ) ( not ( = ?auto_124154 ?auto_124161 ) ) ( not ( = ?auto_124155 ?auto_124161 ) ) ( not ( = ?auto_124156 ?auto_124161 ) ) ( not ( = ?auto_124157 ?auto_124161 ) ) ( not ( = ?auto_124158 ?auto_124161 ) ) ( not ( = ?auto_124159 ?auto_124161 ) ) ( not ( = ?auto_124160 ?auto_124161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_124154 ?auto_124161 )
      ( MAKE-7PILE ?auto_124154 ?auto_124155 ?auto_124156 ?auto_124157 ?auto_124158 ?auto_124159 ?auto_124160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124162 - BLOCK
      ?auto_124163 - BLOCK
      ?auto_124164 - BLOCK
      ?auto_124165 - BLOCK
      ?auto_124166 - BLOCK
      ?auto_124167 - BLOCK
      ?auto_124168 - BLOCK
    )
    :vars
    (
      ?auto_124169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124162 ?auto_124163 ) ) ( not ( = ?auto_124162 ?auto_124164 ) ) ( not ( = ?auto_124162 ?auto_124165 ) ) ( not ( = ?auto_124162 ?auto_124166 ) ) ( not ( = ?auto_124162 ?auto_124167 ) ) ( not ( = ?auto_124162 ?auto_124168 ) ) ( not ( = ?auto_124163 ?auto_124164 ) ) ( not ( = ?auto_124163 ?auto_124165 ) ) ( not ( = ?auto_124163 ?auto_124166 ) ) ( not ( = ?auto_124163 ?auto_124167 ) ) ( not ( = ?auto_124163 ?auto_124168 ) ) ( not ( = ?auto_124164 ?auto_124165 ) ) ( not ( = ?auto_124164 ?auto_124166 ) ) ( not ( = ?auto_124164 ?auto_124167 ) ) ( not ( = ?auto_124164 ?auto_124168 ) ) ( not ( = ?auto_124165 ?auto_124166 ) ) ( not ( = ?auto_124165 ?auto_124167 ) ) ( not ( = ?auto_124165 ?auto_124168 ) ) ( not ( = ?auto_124166 ?auto_124167 ) ) ( not ( = ?auto_124166 ?auto_124168 ) ) ( not ( = ?auto_124167 ?auto_124168 ) ) ( ON-TABLE ?auto_124168 ) ( ON ?auto_124167 ?auto_124168 ) ( ON ?auto_124166 ?auto_124167 ) ( ON ?auto_124165 ?auto_124166 ) ( ON ?auto_124164 ?auto_124165 ) ( ON ?auto_124162 ?auto_124169 ) ( CLEAR ?auto_124162 ) ( not ( = ?auto_124162 ?auto_124169 ) ) ( not ( = ?auto_124163 ?auto_124169 ) ) ( not ( = ?auto_124164 ?auto_124169 ) ) ( not ( = ?auto_124165 ?auto_124169 ) ) ( not ( = ?auto_124166 ?auto_124169 ) ) ( not ( = ?auto_124167 ?auto_124169 ) ) ( not ( = ?auto_124168 ?auto_124169 ) ) ( HOLDING ?auto_124163 ) ( CLEAR ?auto_124164 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124168 ?auto_124167 ?auto_124166 ?auto_124165 ?auto_124164 ?auto_124163 )
      ( MAKE-7PILE ?auto_124162 ?auto_124163 ?auto_124164 ?auto_124165 ?auto_124166 ?auto_124167 ?auto_124168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124170 - BLOCK
      ?auto_124171 - BLOCK
      ?auto_124172 - BLOCK
      ?auto_124173 - BLOCK
      ?auto_124174 - BLOCK
      ?auto_124175 - BLOCK
      ?auto_124176 - BLOCK
    )
    :vars
    (
      ?auto_124177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124170 ?auto_124171 ) ) ( not ( = ?auto_124170 ?auto_124172 ) ) ( not ( = ?auto_124170 ?auto_124173 ) ) ( not ( = ?auto_124170 ?auto_124174 ) ) ( not ( = ?auto_124170 ?auto_124175 ) ) ( not ( = ?auto_124170 ?auto_124176 ) ) ( not ( = ?auto_124171 ?auto_124172 ) ) ( not ( = ?auto_124171 ?auto_124173 ) ) ( not ( = ?auto_124171 ?auto_124174 ) ) ( not ( = ?auto_124171 ?auto_124175 ) ) ( not ( = ?auto_124171 ?auto_124176 ) ) ( not ( = ?auto_124172 ?auto_124173 ) ) ( not ( = ?auto_124172 ?auto_124174 ) ) ( not ( = ?auto_124172 ?auto_124175 ) ) ( not ( = ?auto_124172 ?auto_124176 ) ) ( not ( = ?auto_124173 ?auto_124174 ) ) ( not ( = ?auto_124173 ?auto_124175 ) ) ( not ( = ?auto_124173 ?auto_124176 ) ) ( not ( = ?auto_124174 ?auto_124175 ) ) ( not ( = ?auto_124174 ?auto_124176 ) ) ( not ( = ?auto_124175 ?auto_124176 ) ) ( ON-TABLE ?auto_124176 ) ( ON ?auto_124175 ?auto_124176 ) ( ON ?auto_124174 ?auto_124175 ) ( ON ?auto_124173 ?auto_124174 ) ( ON ?auto_124172 ?auto_124173 ) ( ON ?auto_124170 ?auto_124177 ) ( not ( = ?auto_124170 ?auto_124177 ) ) ( not ( = ?auto_124171 ?auto_124177 ) ) ( not ( = ?auto_124172 ?auto_124177 ) ) ( not ( = ?auto_124173 ?auto_124177 ) ) ( not ( = ?auto_124174 ?auto_124177 ) ) ( not ( = ?auto_124175 ?auto_124177 ) ) ( not ( = ?auto_124176 ?auto_124177 ) ) ( CLEAR ?auto_124172 ) ( ON ?auto_124171 ?auto_124170 ) ( CLEAR ?auto_124171 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_124177 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124177 ?auto_124170 )
      ( MAKE-7PILE ?auto_124170 ?auto_124171 ?auto_124172 ?auto_124173 ?auto_124174 ?auto_124175 ?auto_124176 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124178 - BLOCK
      ?auto_124179 - BLOCK
      ?auto_124180 - BLOCK
      ?auto_124181 - BLOCK
      ?auto_124182 - BLOCK
      ?auto_124183 - BLOCK
      ?auto_124184 - BLOCK
    )
    :vars
    (
      ?auto_124185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124178 ?auto_124179 ) ) ( not ( = ?auto_124178 ?auto_124180 ) ) ( not ( = ?auto_124178 ?auto_124181 ) ) ( not ( = ?auto_124178 ?auto_124182 ) ) ( not ( = ?auto_124178 ?auto_124183 ) ) ( not ( = ?auto_124178 ?auto_124184 ) ) ( not ( = ?auto_124179 ?auto_124180 ) ) ( not ( = ?auto_124179 ?auto_124181 ) ) ( not ( = ?auto_124179 ?auto_124182 ) ) ( not ( = ?auto_124179 ?auto_124183 ) ) ( not ( = ?auto_124179 ?auto_124184 ) ) ( not ( = ?auto_124180 ?auto_124181 ) ) ( not ( = ?auto_124180 ?auto_124182 ) ) ( not ( = ?auto_124180 ?auto_124183 ) ) ( not ( = ?auto_124180 ?auto_124184 ) ) ( not ( = ?auto_124181 ?auto_124182 ) ) ( not ( = ?auto_124181 ?auto_124183 ) ) ( not ( = ?auto_124181 ?auto_124184 ) ) ( not ( = ?auto_124182 ?auto_124183 ) ) ( not ( = ?auto_124182 ?auto_124184 ) ) ( not ( = ?auto_124183 ?auto_124184 ) ) ( ON-TABLE ?auto_124184 ) ( ON ?auto_124183 ?auto_124184 ) ( ON ?auto_124182 ?auto_124183 ) ( ON ?auto_124181 ?auto_124182 ) ( ON ?auto_124178 ?auto_124185 ) ( not ( = ?auto_124178 ?auto_124185 ) ) ( not ( = ?auto_124179 ?auto_124185 ) ) ( not ( = ?auto_124180 ?auto_124185 ) ) ( not ( = ?auto_124181 ?auto_124185 ) ) ( not ( = ?auto_124182 ?auto_124185 ) ) ( not ( = ?auto_124183 ?auto_124185 ) ) ( not ( = ?auto_124184 ?auto_124185 ) ) ( ON ?auto_124179 ?auto_124178 ) ( CLEAR ?auto_124179 ) ( ON-TABLE ?auto_124185 ) ( HOLDING ?auto_124180 ) ( CLEAR ?auto_124181 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124184 ?auto_124183 ?auto_124182 ?auto_124181 ?auto_124180 )
      ( MAKE-7PILE ?auto_124178 ?auto_124179 ?auto_124180 ?auto_124181 ?auto_124182 ?auto_124183 ?auto_124184 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124186 - BLOCK
      ?auto_124187 - BLOCK
      ?auto_124188 - BLOCK
      ?auto_124189 - BLOCK
      ?auto_124190 - BLOCK
      ?auto_124191 - BLOCK
      ?auto_124192 - BLOCK
    )
    :vars
    (
      ?auto_124193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124186 ?auto_124187 ) ) ( not ( = ?auto_124186 ?auto_124188 ) ) ( not ( = ?auto_124186 ?auto_124189 ) ) ( not ( = ?auto_124186 ?auto_124190 ) ) ( not ( = ?auto_124186 ?auto_124191 ) ) ( not ( = ?auto_124186 ?auto_124192 ) ) ( not ( = ?auto_124187 ?auto_124188 ) ) ( not ( = ?auto_124187 ?auto_124189 ) ) ( not ( = ?auto_124187 ?auto_124190 ) ) ( not ( = ?auto_124187 ?auto_124191 ) ) ( not ( = ?auto_124187 ?auto_124192 ) ) ( not ( = ?auto_124188 ?auto_124189 ) ) ( not ( = ?auto_124188 ?auto_124190 ) ) ( not ( = ?auto_124188 ?auto_124191 ) ) ( not ( = ?auto_124188 ?auto_124192 ) ) ( not ( = ?auto_124189 ?auto_124190 ) ) ( not ( = ?auto_124189 ?auto_124191 ) ) ( not ( = ?auto_124189 ?auto_124192 ) ) ( not ( = ?auto_124190 ?auto_124191 ) ) ( not ( = ?auto_124190 ?auto_124192 ) ) ( not ( = ?auto_124191 ?auto_124192 ) ) ( ON-TABLE ?auto_124192 ) ( ON ?auto_124191 ?auto_124192 ) ( ON ?auto_124190 ?auto_124191 ) ( ON ?auto_124189 ?auto_124190 ) ( ON ?auto_124186 ?auto_124193 ) ( not ( = ?auto_124186 ?auto_124193 ) ) ( not ( = ?auto_124187 ?auto_124193 ) ) ( not ( = ?auto_124188 ?auto_124193 ) ) ( not ( = ?auto_124189 ?auto_124193 ) ) ( not ( = ?auto_124190 ?auto_124193 ) ) ( not ( = ?auto_124191 ?auto_124193 ) ) ( not ( = ?auto_124192 ?auto_124193 ) ) ( ON ?auto_124187 ?auto_124186 ) ( ON-TABLE ?auto_124193 ) ( CLEAR ?auto_124189 ) ( ON ?auto_124188 ?auto_124187 ) ( CLEAR ?auto_124188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124193 ?auto_124186 ?auto_124187 )
      ( MAKE-7PILE ?auto_124186 ?auto_124187 ?auto_124188 ?auto_124189 ?auto_124190 ?auto_124191 ?auto_124192 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124194 - BLOCK
      ?auto_124195 - BLOCK
      ?auto_124196 - BLOCK
      ?auto_124197 - BLOCK
      ?auto_124198 - BLOCK
      ?auto_124199 - BLOCK
      ?auto_124200 - BLOCK
    )
    :vars
    (
      ?auto_124201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124194 ?auto_124195 ) ) ( not ( = ?auto_124194 ?auto_124196 ) ) ( not ( = ?auto_124194 ?auto_124197 ) ) ( not ( = ?auto_124194 ?auto_124198 ) ) ( not ( = ?auto_124194 ?auto_124199 ) ) ( not ( = ?auto_124194 ?auto_124200 ) ) ( not ( = ?auto_124195 ?auto_124196 ) ) ( not ( = ?auto_124195 ?auto_124197 ) ) ( not ( = ?auto_124195 ?auto_124198 ) ) ( not ( = ?auto_124195 ?auto_124199 ) ) ( not ( = ?auto_124195 ?auto_124200 ) ) ( not ( = ?auto_124196 ?auto_124197 ) ) ( not ( = ?auto_124196 ?auto_124198 ) ) ( not ( = ?auto_124196 ?auto_124199 ) ) ( not ( = ?auto_124196 ?auto_124200 ) ) ( not ( = ?auto_124197 ?auto_124198 ) ) ( not ( = ?auto_124197 ?auto_124199 ) ) ( not ( = ?auto_124197 ?auto_124200 ) ) ( not ( = ?auto_124198 ?auto_124199 ) ) ( not ( = ?auto_124198 ?auto_124200 ) ) ( not ( = ?auto_124199 ?auto_124200 ) ) ( ON-TABLE ?auto_124200 ) ( ON ?auto_124199 ?auto_124200 ) ( ON ?auto_124198 ?auto_124199 ) ( ON ?auto_124194 ?auto_124201 ) ( not ( = ?auto_124194 ?auto_124201 ) ) ( not ( = ?auto_124195 ?auto_124201 ) ) ( not ( = ?auto_124196 ?auto_124201 ) ) ( not ( = ?auto_124197 ?auto_124201 ) ) ( not ( = ?auto_124198 ?auto_124201 ) ) ( not ( = ?auto_124199 ?auto_124201 ) ) ( not ( = ?auto_124200 ?auto_124201 ) ) ( ON ?auto_124195 ?auto_124194 ) ( ON-TABLE ?auto_124201 ) ( ON ?auto_124196 ?auto_124195 ) ( CLEAR ?auto_124196 ) ( HOLDING ?auto_124197 ) ( CLEAR ?auto_124198 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124200 ?auto_124199 ?auto_124198 ?auto_124197 )
      ( MAKE-7PILE ?auto_124194 ?auto_124195 ?auto_124196 ?auto_124197 ?auto_124198 ?auto_124199 ?auto_124200 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124202 - BLOCK
      ?auto_124203 - BLOCK
      ?auto_124204 - BLOCK
      ?auto_124205 - BLOCK
      ?auto_124206 - BLOCK
      ?auto_124207 - BLOCK
      ?auto_124208 - BLOCK
    )
    :vars
    (
      ?auto_124209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124202 ?auto_124203 ) ) ( not ( = ?auto_124202 ?auto_124204 ) ) ( not ( = ?auto_124202 ?auto_124205 ) ) ( not ( = ?auto_124202 ?auto_124206 ) ) ( not ( = ?auto_124202 ?auto_124207 ) ) ( not ( = ?auto_124202 ?auto_124208 ) ) ( not ( = ?auto_124203 ?auto_124204 ) ) ( not ( = ?auto_124203 ?auto_124205 ) ) ( not ( = ?auto_124203 ?auto_124206 ) ) ( not ( = ?auto_124203 ?auto_124207 ) ) ( not ( = ?auto_124203 ?auto_124208 ) ) ( not ( = ?auto_124204 ?auto_124205 ) ) ( not ( = ?auto_124204 ?auto_124206 ) ) ( not ( = ?auto_124204 ?auto_124207 ) ) ( not ( = ?auto_124204 ?auto_124208 ) ) ( not ( = ?auto_124205 ?auto_124206 ) ) ( not ( = ?auto_124205 ?auto_124207 ) ) ( not ( = ?auto_124205 ?auto_124208 ) ) ( not ( = ?auto_124206 ?auto_124207 ) ) ( not ( = ?auto_124206 ?auto_124208 ) ) ( not ( = ?auto_124207 ?auto_124208 ) ) ( ON-TABLE ?auto_124208 ) ( ON ?auto_124207 ?auto_124208 ) ( ON ?auto_124206 ?auto_124207 ) ( ON ?auto_124202 ?auto_124209 ) ( not ( = ?auto_124202 ?auto_124209 ) ) ( not ( = ?auto_124203 ?auto_124209 ) ) ( not ( = ?auto_124204 ?auto_124209 ) ) ( not ( = ?auto_124205 ?auto_124209 ) ) ( not ( = ?auto_124206 ?auto_124209 ) ) ( not ( = ?auto_124207 ?auto_124209 ) ) ( not ( = ?auto_124208 ?auto_124209 ) ) ( ON ?auto_124203 ?auto_124202 ) ( ON-TABLE ?auto_124209 ) ( ON ?auto_124204 ?auto_124203 ) ( CLEAR ?auto_124206 ) ( ON ?auto_124205 ?auto_124204 ) ( CLEAR ?auto_124205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_124209 ?auto_124202 ?auto_124203 ?auto_124204 )
      ( MAKE-7PILE ?auto_124202 ?auto_124203 ?auto_124204 ?auto_124205 ?auto_124206 ?auto_124207 ?auto_124208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124210 - BLOCK
      ?auto_124211 - BLOCK
      ?auto_124212 - BLOCK
      ?auto_124213 - BLOCK
      ?auto_124214 - BLOCK
      ?auto_124215 - BLOCK
      ?auto_124216 - BLOCK
    )
    :vars
    (
      ?auto_124217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124210 ?auto_124211 ) ) ( not ( = ?auto_124210 ?auto_124212 ) ) ( not ( = ?auto_124210 ?auto_124213 ) ) ( not ( = ?auto_124210 ?auto_124214 ) ) ( not ( = ?auto_124210 ?auto_124215 ) ) ( not ( = ?auto_124210 ?auto_124216 ) ) ( not ( = ?auto_124211 ?auto_124212 ) ) ( not ( = ?auto_124211 ?auto_124213 ) ) ( not ( = ?auto_124211 ?auto_124214 ) ) ( not ( = ?auto_124211 ?auto_124215 ) ) ( not ( = ?auto_124211 ?auto_124216 ) ) ( not ( = ?auto_124212 ?auto_124213 ) ) ( not ( = ?auto_124212 ?auto_124214 ) ) ( not ( = ?auto_124212 ?auto_124215 ) ) ( not ( = ?auto_124212 ?auto_124216 ) ) ( not ( = ?auto_124213 ?auto_124214 ) ) ( not ( = ?auto_124213 ?auto_124215 ) ) ( not ( = ?auto_124213 ?auto_124216 ) ) ( not ( = ?auto_124214 ?auto_124215 ) ) ( not ( = ?auto_124214 ?auto_124216 ) ) ( not ( = ?auto_124215 ?auto_124216 ) ) ( ON-TABLE ?auto_124216 ) ( ON ?auto_124215 ?auto_124216 ) ( ON ?auto_124210 ?auto_124217 ) ( not ( = ?auto_124210 ?auto_124217 ) ) ( not ( = ?auto_124211 ?auto_124217 ) ) ( not ( = ?auto_124212 ?auto_124217 ) ) ( not ( = ?auto_124213 ?auto_124217 ) ) ( not ( = ?auto_124214 ?auto_124217 ) ) ( not ( = ?auto_124215 ?auto_124217 ) ) ( not ( = ?auto_124216 ?auto_124217 ) ) ( ON ?auto_124211 ?auto_124210 ) ( ON-TABLE ?auto_124217 ) ( ON ?auto_124212 ?auto_124211 ) ( ON ?auto_124213 ?auto_124212 ) ( CLEAR ?auto_124213 ) ( HOLDING ?auto_124214 ) ( CLEAR ?auto_124215 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_124216 ?auto_124215 ?auto_124214 )
      ( MAKE-7PILE ?auto_124210 ?auto_124211 ?auto_124212 ?auto_124213 ?auto_124214 ?auto_124215 ?auto_124216 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124218 - BLOCK
      ?auto_124219 - BLOCK
      ?auto_124220 - BLOCK
      ?auto_124221 - BLOCK
      ?auto_124222 - BLOCK
      ?auto_124223 - BLOCK
      ?auto_124224 - BLOCK
    )
    :vars
    (
      ?auto_124225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124218 ?auto_124219 ) ) ( not ( = ?auto_124218 ?auto_124220 ) ) ( not ( = ?auto_124218 ?auto_124221 ) ) ( not ( = ?auto_124218 ?auto_124222 ) ) ( not ( = ?auto_124218 ?auto_124223 ) ) ( not ( = ?auto_124218 ?auto_124224 ) ) ( not ( = ?auto_124219 ?auto_124220 ) ) ( not ( = ?auto_124219 ?auto_124221 ) ) ( not ( = ?auto_124219 ?auto_124222 ) ) ( not ( = ?auto_124219 ?auto_124223 ) ) ( not ( = ?auto_124219 ?auto_124224 ) ) ( not ( = ?auto_124220 ?auto_124221 ) ) ( not ( = ?auto_124220 ?auto_124222 ) ) ( not ( = ?auto_124220 ?auto_124223 ) ) ( not ( = ?auto_124220 ?auto_124224 ) ) ( not ( = ?auto_124221 ?auto_124222 ) ) ( not ( = ?auto_124221 ?auto_124223 ) ) ( not ( = ?auto_124221 ?auto_124224 ) ) ( not ( = ?auto_124222 ?auto_124223 ) ) ( not ( = ?auto_124222 ?auto_124224 ) ) ( not ( = ?auto_124223 ?auto_124224 ) ) ( ON-TABLE ?auto_124224 ) ( ON ?auto_124223 ?auto_124224 ) ( ON ?auto_124218 ?auto_124225 ) ( not ( = ?auto_124218 ?auto_124225 ) ) ( not ( = ?auto_124219 ?auto_124225 ) ) ( not ( = ?auto_124220 ?auto_124225 ) ) ( not ( = ?auto_124221 ?auto_124225 ) ) ( not ( = ?auto_124222 ?auto_124225 ) ) ( not ( = ?auto_124223 ?auto_124225 ) ) ( not ( = ?auto_124224 ?auto_124225 ) ) ( ON ?auto_124219 ?auto_124218 ) ( ON-TABLE ?auto_124225 ) ( ON ?auto_124220 ?auto_124219 ) ( ON ?auto_124221 ?auto_124220 ) ( CLEAR ?auto_124223 ) ( ON ?auto_124222 ?auto_124221 ) ( CLEAR ?auto_124222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_124225 ?auto_124218 ?auto_124219 ?auto_124220 ?auto_124221 )
      ( MAKE-7PILE ?auto_124218 ?auto_124219 ?auto_124220 ?auto_124221 ?auto_124222 ?auto_124223 ?auto_124224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124226 - BLOCK
      ?auto_124227 - BLOCK
      ?auto_124228 - BLOCK
      ?auto_124229 - BLOCK
      ?auto_124230 - BLOCK
      ?auto_124231 - BLOCK
      ?auto_124232 - BLOCK
    )
    :vars
    (
      ?auto_124233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124226 ?auto_124227 ) ) ( not ( = ?auto_124226 ?auto_124228 ) ) ( not ( = ?auto_124226 ?auto_124229 ) ) ( not ( = ?auto_124226 ?auto_124230 ) ) ( not ( = ?auto_124226 ?auto_124231 ) ) ( not ( = ?auto_124226 ?auto_124232 ) ) ( not ( = ?auto_124227 ?auto_124228 ) ) ( not ( = ?auto_124227 ?auto_124229 ) ) ( not ( = ?auto_124227 ?auto_124230 ) ) ( not ( = ?auto_124227 ?auto_124231 ) ) ( not ( = ?auto_124227 ?auto_124232 ) ) ( not ( = ?auto_124228 ?auto_124229 ) ) ( not ( = ?auto_124228 ?auto_124230 ) ) ( not ( = ?auto_124228 ?auto_124231 ) ) ( not ( = ?auto_124228 ?auto_124232 ) ) ( not ( = ?auto_124229 ?auto_124230 ) ) ( not ( = ?auto_124229 ?auto_124231 ) ) ( not ( = ?auto_124229 ?auto_124232 ) ) ( not ( = ?auto_124230 ?auto_124231 ) ) ( not ( = ?auto_124230 ?auto_124232 ) ) ( not ( = ?auto_124231 ?auto_124232 ) ) ( ON-TABLE ?auto_124232 ) ( ON ?auto_124226 ?auto_124233 ) ( not ( = ?auto_124226 ?auto_124233 ) ) ( not ( = ?auto_124227 ?auto_124233 ) ) ( not ( = ?auto_124228 ?auto_124233 ) ) ( not ( = ?auto_124229 ?auto_124233 ) ) ( not ( = ?auto_124230 ?auto_124233 ) ) ( not ( = ?auto_124231 ?auto_124233 ) ) ( not ( = ?auto_124232 ?auto_124233 ) ) ( ON ?auto_124227 ?auto_124226 ) ( ON-TABLE ?auto_124233 ) ( ON ?auto_124228 ?auto_124227 ) ( ON ?auto_124229 ?auto_124228 ) ( ON ?auto_124230 ?auto_124229 ) ( CLEAR ?auto_124230 ) ( HOLDING ?auto_124231 ) ( CLEAR ?auto_124232 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_124232 ?auto_124231 )
      ( MAKE-7PILE ?auto_124226 ?auto_124227 ?auto_124228 ?auto_124229 ?auto_124230 ?auto_124231 ?auto_124232 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124234 - BLOCK
      ?auto_124235 - BLOCK
      ?auto_124236 - BLOCK
      ?auto_124237 - BLOCK
      ?auto_124238 - BLOCK
      ?auto_124239 - BLOCK
      ?auto_124240 - BLOCK
    )
    :vars
    (
      ?auto_124241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124234 ?auto_124235 ) ) ( not ( = ?auto_124234 ?auto_124236 ) ) ( not ( = ?auto_124234 ?auto_124237 ) ) ( not ( = ?auto_124234 ?auto_124238 ) ) ( not ( = ?auto_124234 ?auto_124239 ) ) ( not ( = ?auto_124234 ?auto_124240 ) ) ( not ( = ?auto_124235 ?auto_124236 ) ) ( not ( = ?auto_124235 ?auto_124237 ) ) ( not ( = ?auto_124235 ?auto_124238 ) ) ( not ( = ?auto_124235 ?auto_124239 ) ) ( not ( = ?auto_124235 ?auto_124240 ) ) ( not ( = ?auto_124236 ?auto_124237 ) ) ( not ( = ?auto_124236 ?auto_124238 ) ) ( not ( = ?auto_124236 ?auto_124239 ) ) ( not ( = ?auto_124236 ?auto_124240 ) ) ( not ( = ?auto_124237 ?auto_124238 ) ) ( not ( = ?auto_124237 ?auto_124239 ) ) ( not ( = ?auto_124237 ?auto_124240 ) ) ( not ( = ?auto_124238 ?auto_124239 ) ) ( not ( = ?auto_124238 ?auto_124240 ) ) ( not ( = ?auto_124239 ?auto_124240 ) ) ( ON-TABLE ?auto_124240 ) ( ON ?auto_124234 ?auto_124241 ) ( not ( = ?auto_124234 ?auto_124241 ) ) ( not ( = ?auto_124235 ?auto_124241 ) ) ( not ( = ?auto_124236 ?auto_124241 ) ) ( not ( = ?auto_124237 ?auto_124241 ) ) ( not ( = ?auto_124238 ?auto_124241 ) ) ( not ( = ?auto_124239 ?auto_124241 ) ) ( not ( = ?auto_124240 ?auto_124241 ) ) ( ON ?auto_124235 ?auto_124234 ) ( ON-TABLE ?auto_124241 ) ( ON ?auto_124236 ?auto_124235 ) ( ON ?auto_124237 ?auto_124236 ) ( ON ?auto_124238 ?auto_124237 ) ( CLEAR ?auto_124240 ) ( ON ?auto_124239 ?auto_124238 ) ( CLEAR ?auto_124239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_124241 ?auto_124234 ?auto_124235 ?auto_124236 ?auto_124237 ?auto_124238 )
      ( MAKE-7PILE ?auto_124234 ?auto_124235 ?auto_124236 ?auto_124237 ?auto_124238 ?auto_124239 ?auto_124240 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124242 - BLOCK
      ?auto_124243 - BLOCK
      ?auto_124244 - BLOCK
      ?auto_124245 - BLOCK
      ?auto_124246 - BLOCK
      ?auto_124247 - BLOCK
      ?auto_124248 - BLOCK
    )
    :vars
    (
      ?auto_124249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124242 ?auto_124243 ) ) ( not ( = ?auto_124242 ?auto_124244 ) ) ( not ( = ?auto_124242 ?auto_124245 ) ) ( not ( = ?auto_124242 ?auto_124246 ) ) ( not ( = ?auto_124242 ?auto_124247 ) ) ( not ( = ?auto_124242 ?auto_124248 ) ) ( not ( = ?auto_124243 ?auto_124244 ) ) ( not ( = ?auto_124243 ?auto_124245 ) ) ( not ( = ?auto_124243 ?auto_124246 ) ) ( not ( = ?auto_124243 ?auto_124247 ) ) ( not ( = ?auto_124243 ?auto_124248 ) ) ( not ( = ?auto_124244 ?auto_124245 ) ) ( not ( = ?auto_124244 ?auto_124246 ) ) ( not ( = ?auto_124244 ?auto_124247 ) ) ( not ( = ?auto_124244 ?auto_124248 ) ) ( not ( = ?auto_124245 ?auto_124246 ) ) ( not ( = ?auto_124245 ?auto_124247 ) ) ( not ( = ?auto_124245 ?auto_124248 ) ) ( not ( = ?auto_124246 ?auto_124247 ) ) ( not ( = ?auto_124246 ?auto_124248 ) ) ( not ( = ?auto_124247 ?auto_124248 ) ) ( ON ?auto_124242 ?auto_124249 ) ( not ( = ?auto_124242 ?auto_124249 ) ) ( not ( = ?auto_124243 ?auto_124249 ) ) ( not ( = ?auto_124244 ?auto_124249 ) ) ( not ( = ?auto_124245 ?auto_124249 ) ) ( not ( = ?auto_124246 ?auto_124249 ) ) ( not ( = ?auto_124247 ?auto_124249 ) ) ( not ( = ?auto_124248 ?auto_124249 ) ) ( ON ?auto_124243 ?auto_124242 ) ( ON-TABLE ?auto_124249 ) ( ON ?auto_124244 ?auto_124243 ) ( ON ?auto_124245 ?auto_124244 ) ( ON ?auto_124246 ?auto_124245 ) ( ON ?auto_124247 ?auto_124246 ) ( CLEAR ?auto_124247 ) ( HOLDING ?auto_124248 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_124248 )
      ( MAKE-7PILE ?auto_124242 ?auto_124243 ?auto_124244 ?auto_124245 ?auto_124246 ?auto_124247 ?auto_124248 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_124250 - BLOCK
      ?auto_124251 - BLOCK
      ?auto_124252 - BLOCK
      ?auto_124253 - BLOCK
      ?auto_124254 - BLOCK
      ?auto_124255 - BLOCK
      ?auto_124256 - BLOCK
    )
    :vars
    (
      ?auto_124257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_124250 ?auto_124251 ) ) ( not ( = ?auto_124250 ?auto_124252 ) ) ( not ( = ?auto_124250 ?auto_124253 ) ) ( not ( = ?auto_124250 ?auto_124254 ) ) ( not ( = ?auto_124250 ?auto_124255 ) ) ( not ( = ?auto_124250 ?auto_124256 ) ) ( not ( = ?auto_124251 ?auto_124252 ) ) ( not ( = ?auto_124251 ?auto_124253 ) ) ( not ( = ?auto_124251 ?auto_124254 ) ) ( not ( = ?auto_124251 ?auto_124255 ) ) ( not ( = ?auto_124251 ?auto_124256 ) ) ( not ( = ?auto_124252 ?auto_124253 ) ) ( not ( = ?auto_124252 ?auto_124254 ) ) ( not ( = ?auto_124252 ?auto_124255 ) ) ( not ( = ?auto_124252 ?auto_124256 ) ) ( not ( = ?auto_124253 ?auto_124254 ) ) ( not ( = ?auto_124253 ?auto_124255 ) ) ( not ( = ?auto_124253 ?auto_124256 ) ) ( not ( = ?auto_124254 ?auto_124255 ) ) ( not ( = ?auto_124254 ?auto_124256 ) ) ( not ( = ?auto_124255 ?auto_124256 ) ) ( ON ?auto_124250 ?auto_124257 ) ( not ( = ?auto_124250 ?auto_124257 ) ) ( not ( = ?auto_124251 ?auto_124257 ) ) ( not ( = ?auto_124252 ?auto_124257 ) ) ( not ( = ?auto_124253 ?auto_124257 ) ) ( not ( = ?auto_124254 ?auto_124257 ) ) ( not ( = ?auto_124255 ?auto_124257 ) ) ( not ( = ?auto_124256 ?auto_124257 ) ) ( ON ?auto_124251 ?auto_124250 ) ( ON-TABLE ?auto_124257 ) ( ON ?auto_124252 ?auto_124251 ) ( ON ?auto_124253 ?auto_124252 ) ( ON ?auto_124254 ?auto_124253 ) ( ON ?auto_124255 ?auto_124254 ) ( ON ?auto_124256 ?auto_124255 ) ( CLEAR ?auto_124256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_124257 ?auto_124250 ?auto_124251 ?auto_124252 ?auto_124253 ?auto_124254 ?auto_124255 )
      ( MAKE-7PILE ?auto_124250 ?auto_124251 ?auto_124252 ?auto_124253 ?auto_124254 ?auto_124255 ?auto_124256 ) )
  )

)

