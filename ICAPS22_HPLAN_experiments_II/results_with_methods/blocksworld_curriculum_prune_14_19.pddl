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
      ?auto_356336 - BLOCK
    )
    :vars
    (
      ?auto_356337 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356336 ?auto_356337 ) ( CLEAR ?auto_356336 ) ( HAND-EMPTY ) ( not ( = ?auto_356336 ?auto_356337 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_356336 ?auto_356337 )
      ( !PUTDOWN ?auto_356336 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_356343 - BLOCK
      ?auto_356344 - BLOCK
    )
    :vars
    (
      ?auto_356345 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_356343 ) ( ON ?auto_356344 ?auto_356345 ) ( CLEAR ?auto_356344 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_356343 ) ( not ( = ?auto_356343 ?auto_356344 ) ) ( not ( = ?auto_356343 ?auto_356345 ) ) ( not ( = ?auto_356344 ?auto_356345 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_356344 ?auto_356345 )
      ( !STACK ?auto_356344 ?auto_356343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_356353 - BLOCK
      ?auto_356354 - BLOCK
    )
    :vars
    (
      ?auto_356355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356354 ?auto_356355 ) ( not ( = ?auto_356353 ?auto_356354 ) ) ( not ( = ?auto_356353 ?auto_356355 ) ) ( not ( = ?auto_356354 ?auto_356355 ) ) ( ON ?auto_356353 ?auto_356354 ) ( CLEAR ?auto_356353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_356353 )
      ( MAKE-2PILE ?auto_356353 ?auto_356354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_356364 - BLOCK
      ?auto_356365 - BLOCK
      ?auto_356366 - BLOCK
    )
    :vars
    (
      ?auto_356367 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_356365 ) ( ON ?auto_356366 ?auto_356367 ) ( CLEAR ?auto_356366 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_356364 ) ( ON ?auto_356365 ?auto_356364 ) ( not ( = ?auto_356364 ?auto_356365 ) ) ( not ( = ?auto_356364 ?auto_356366 ) ) ( not ( = ?auto_356364 ?auto_356367 ) ) ( not ( = ?auto_356365 ?auto_356366 ) ) ( not ( = ?auto_356365 ?auto_356367 ) ) ( not ( = ?auto_356366 ?auto_356367 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_356366 ?auto_356367 )
      ( !STACK ?auto_356366 ?auto_356365 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_356378 - BLOCK
      ?auto_356379 - BLOCK
      ?auto_356380 - BLOCK
    )
    :vars
    (
      ?auto_356381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356380 ?auto_356381 ) ( ON-TABLE ?auto_356378 ) ( not ( = ?auto_356378 ?auto_356379 ) ) ( not ( = ?auto_356378 ?auto_356380 ) ) ( not ( = ?auto_356378 ?auto_356381 ) ) ( not ( = ?auto_356379 ?auto_356380 ) ) ( not ( = ?auto_356379 ?auto_356381 ) ) ( not ( = ?auto_356380 ?auto_356381 ) ) ( CLEAR ?auto_356378 ) ( ON ?auto_356379 ?auto_356380 ) ( CLEAR ?auto_356379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_356378 ?auto_356379 )
      ( MAKE-3PILE ?auto_356378 ?auto_356379 ?auto_356380 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_356392 - BLOCK
      ?auto_356393 - BLOCK
      ?auto_356394 - BLOCK
    )
    :vars
    (
      ?auto_356395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356394 ?auto_356395 ) ( not ( = ?auto_356392 ?auto_356393 ) ) ( not ( = ?auto_356392 ?auto_356394 ) ) ( not ( = ?auto_356392 ?auto_356395 ) ) ( not ( = ?auto_356393 ?auto_356394 ) ) ( not ( = ?auto_356393 ?auto_356395 ) ) ( not ( = ?auto_356394 ?auto_356395 ) ) ( ON ?auto_356393 ?auto_356394 ) ( ON ?auto_356392 ?auto_356393 ) ( CLEAR ?auto_356392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_356392 )
      ( MAKE-3PILE ?auto_356392 ?auto_356393 ?auto_356394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_356407 - BLOCK
      ?auto_356408 - BLOCK
      ?auto_356409 - BLOCK
      ?auto_356410 - BLOCK
    )
    :vars
    (
      ?auto_356411 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_356409 ) ( ON ?auto_356410 ?auto_356411 ) ( CLEAR ?auto_356410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_356407 ) ( ON ?auto_356408 ?auto_356407 ) ( ON ?auto_356409 ?auto_356408 ) ( not ( = ?auto_356407 ?auto_356408 ) ) ( not ( = ?auto_356407 ?auto_356409 ) ) ( not ( = ?auto_356407 ?auto_356410 ) ) ( not ( = ?auto_356407 ?auto_356411 ) ) ( not ( = ?auto_356408 ?auto_356409 ) ) ( not ( = ?auto_356408 ?auto_356410 ) ) ( not ( = ?auto_356408 ?auto_356411 ) ) ( not ( = ?auto_356409 ?auto_356410 ) ) ( not ( = ?auto_356409 ?auto_356411 ) ) ( not ( = ?auto_356410 ?auto_356411 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_356410 ?auto_356411 )
      ( !STACK ?auto_356410 ?auto_356409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_356425 - BLOCK
      ?auto_356426 - BLOCK
      ?auto_356427 - BLOCK
      ?auto_356428 - BLOCK
    )
    :vars
    (
      ?auto_356429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356428 ?auto_356429 ) ( ON-TABLE ?auto_356425 ) ( ON ?auto_356426 ?auto_356425 ) ( not ( = ?auto_356425 ?auto_356426 ) ) ( not ( = ?auto_356425 ?auto_356427 ) ) ( not ( = ?auto_356425 ?auto_356428 ) ) ( not ( = ?auto_356425 ?auto_356429 ) ) ( not ( = ?auto_356426 ?auto_356427 ) ) ( not ( = ?auto_356426 ?auto_356428 ) ) ( not ( = ?auto_356426 ?auto_356429 ) ) ( not ( = ?auto_356427 ?auto_356428 ) ) ( not ( = ?auto_356427 ?auto_356429 ) ) ( not ( = ?auto_356428 ?auto_356429 ) ) ( CLEAR ?auto_356426 ) ( ON ?auto_356427 ?auto_356428 ) ( CLEAR ?auto_356427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_356425 ?auto_356426 ?auto_356427 )
      ( MAKE-4PILE ?auto_356425 ?auto_356426 ?auto_356427 ?auto_356428 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_356443 - BLOCK
      ?auto_356444 - BLOCK
      ?auto_356445 - BLOCK
      ?auto_356446 - BLOCK
    )
    :vars
    (
      ?auto_356447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356446 ?auto_356447 ) ( ON-TABLE ?auto_356443 ) ( not ( = ?auto_356443 ?auto_356444 ) ) ( not ( = ?auto_356443 ?auto_356445 ) ) ( not ( = ?auto_356443 ?auto_356446 ) ) ( not ( = ?auto_356443 ?auto_356447 ) ) ( not ( = ?auto_356444 ?auto_356445 ) ) ( not ( = ?auto_356444 ?auto_356446 ) ) ( not ( = ?auto_356444 ?auto_356447 ) ) ( not ( = ?auto_356445 ?auto_356446 ) ) ( not ( = ?auto_356445 ?auto_356447 ) ) ( not ( = ?auto_356446 ?auto_356447 ) ) ( ON ?auto_356445 ?auto_356446 ) ( CLEAR ?auto_356443 ) ( ON ?auto_356444 ?auto_356445 ) ( CLEAR ?auto_356444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_356443 ?auto_356444 )
      ( MAKE-4PILE ?auto_356443 ?auto_356444 ?auto_356445 ?auto_356446 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_356461 - BLOCK
      ?auto_356462 - BLOCK
      ?auto_356463 - BLOCK
      ?auto_356464 - BLOCK
    )
    :vars
    (
      ?auto_356465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356464 ?auto_356465 ) ( not ( = ?auto_356461 ?auto_356462 ) ) ( not ( = ?auto_356461 ?auto_356463 ) ) ( not ( = ?auto_356461 ?auto_356464 ) ) ( not ( = ?auto_356461 ?auto_356465 ) ) ( not ( = ?auto_356462 ?auto_356463 ) ) ( not ( = ?auto_356462 ?auto_356464 ) ) ( not ( = ?auto_356462 ?auto_356465 ) ) ( not ( = ?auto_356463 ?auto_356464 ) ) ( not ( = ?auto_356463 ?auto_356465 ) ) ( not ( = ?auto_356464 ?auto_356465 ) ) ( ON ?auto_356463 ?auto_356464 ) ( ON ?auto_356462 ?auto_356463 ) ( ON ?auto_356461 ?auto_356462 ) ( CLEAR ?auto_356461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_356461 )
      ( MAKE-4PILE ?auto_356461 ?auto_356462 ?auto_356463 ?auto_356464 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_356480 - BLOCK
      ?auto_356481 - BLOCK
      ?auto_356482 - BLOCK
      ?auto_356483 - BLOCK
      ?auto_356484 - BLOCK
    )
    :vars
    (
      ?auto_356485 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_356483 ) ( ON ?auto_356484 ?auto_356485 ) ( CLEAR ?auto_356484 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_356480 ) ( ON ?auto_356481 ?auto_356480 ) ( ON ?auto_356482 ?auto_356481 ) ( ON ?auto_356483 ?auto_356482 ) ( not ( = ?auto_356480 ?auto_356481 ) ) ( not ( = ?auto_356480 ?auto_356482 ) ) ( not ( = ?auto_356480 ?auto_356483 ) ) ( not ( = ?auto_356480 ?auto_356484 ) ) ( not ( = ?auto_356480 ?auto_356485 ) ) ( not ( = ?auto_356481 ?auto_356482 ) ) ( not ( = ?auto_356481 ?auto_356483 ) ) ( not ( = ?auto_356481 ?auto_356484 ) ) ( not ( = ?auto_356481 ?auto_356485 ) ) ( not ( = ?auto_356482 ?auto_356483 ) ) ( not ( = ?auto_356482 ?auto_356484 ) ) ( not ( = ?auto_356482 ?auto_356485 ) ) ( not ( = ?auto_356483 ?auto_356484 ) ) ( not ( = ?auto_356483 ?auto_356485 ) ) ( not ( = ?auto_356484 ?auto_356485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_356484 ?auto_356485 )
      ( !STACK ?auto_356484 ?auto_356483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_356502 - BLOCK
      ?auto_356503 - BLOCK
      ?auto_356504 - BLOCK
      ?auto_356505 - BLOCK
      ?auto_356506 - BLOCK
    )
    :vars
    (
      ?auto_356507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356506 ?auto_356507 ) ( ON-TABLE ?auto_356502 ) ( ON ?auto_356503 ?auto_356502 ) ( ON ?auto_356504 ?auto_356503 ) ( not ( = ?auto_356502 ?auto_356503 ) ) ( not ( = ?auto_356502 ?auto_356504 ) ) ( not ( = ?auto_356502 ?auto_356505 ) ) ( not ( = ?auto_356502 ?auto_356506 ) ) ( not ( = ?auto_356502 ?auto_356507 ) ) ( not ( = ?auto_356503 ?auto_356504 ) ) ( not ( = ?auto_356503 ?auto_356505 ) ) ( not ( = ?auto_356503 ?auto_356506 ) ) ( not ( = ?auto_356503 ?auto_356507 ) ) ( not ( = ?auto_356504 ?auto_356505 ) ) ( not ( = ?auto_356504 ?auto_356506 ) ) ( not ( = ?auto_356504 ?auto_356507 ) ) ( not ( = ?auto_356505 ?auto_356506 ) ) ( not ( = ?auto_356505 ?auto_356507 ) ) ( not ( = ?auto_356506 ?auto_356507 ) ) ( CLEAR ?auto_356504 ) ( ON ?auto_356505 ?auto_356506 ) ( CLEAR ?auto_356505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_356502 ?auto_356503 ?auto_356504 ?auto_356505 )
      ( MAKE-5PILE ?auto_356502 ?auto_356503 ?auto_356504 ?auto_356505 ?auto_356506 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_356524 - BLOCK
      ?auto_356525 - BLOCK
      ?auto_356526 - BLOCK
      ?auto_356527 - BLOCK
      ?auto_356528 - BLOCK
    )
    :vars
    (
      ?auto_356529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356528 ?auto_356529 ) ( ON-TABLE ?auto_356524 ) ( ON ?auto_356525 ?auto_356524 ) ( not ( = ?auto_356524 ?auto_356525 ) ) ( not ( = ?auto_356524 ?auto_356526 ) ) ( not ( = ?auto_356524 ?auto_356527 ) ) ( not ( = ?auto_356524 ?auto_356528 ) ) ( not ( = ?auto_356524 ?auto_356529 ) ) ( not ( = ?auto_356525 ?auto_356526 ) ) ( not ( = ?auto_356525 ?auto_356527 ) ) ( not ( = ?auto_356525 ?auto_356528 ) ) ( not ( = ?auto_356525 ?auto_356529 ) ) ( not ( = ?auto_356526 ?auto_356527 ) ) ( not ( = ?auto_356526 ?auto_356528 ) ) ( not ( = ?auto_356526 ?auto_356529 ) ) ( not ( = ?auto_356527 ?auto_356528 ) ) ( not ( = ?auto_356527 ?auto_356529 ) ) ( not ( = ?auto_356528 ?auto_356529 ) ) ( ON ?auto_356527 ?auto_356528 ) ( CLEAR ?auto_356525 ) ( ON ?auto_356526 ?auto_356527 ) ( CLEAR ?auto_356526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_356524 ?auto_356525 ?auto_356526 )
      ( MAKE-5PILE ?auto_356524 ?auto_356525 ?auto_356526 ?auto_356527 ?auto_356528 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_356546 - BLOCK
      ?auto_356547 - BLOCK
      ?auto_356548 - BLOCK
      ?auto_356549 - BLOCK
      ?auto_356550 - BLOCK
    )
    :vars
    (
      ?auto_356551 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356550 ?auto_356551 ) ( ON-TABLE ?auto_356546 ) ( not ( = ?auto_356546 ?auto_356547 ) ) ( not ( = ?auto_356546 ?auto_356548 ) ) ( not ( = ?auto_356546 ?auto_356549 ) ) ( not ( = ?auto_356546 ?auto_356550 ) ) ( not ( = ?auto_356546 ?auto_356551 ) ) ( not ( = ?auto_356547 ?auto_356548 ) ) ( not ( = ?auto_356547 ?auto_356549 ) ) ( not ( = ?auto_356547 ?auto_356550 ) ) ( not ( = ?auto_356547 ?auto_356551 ) ) ( not ( = ?auto_356548 ?auto_356549 ) ) ( not ( = ?auto_356548 ?auto_356550 ) ) ( not ( = ?auto_356548 ?auto_356551 ) ) ( not ( = ?auto_356549 ?auto_356550 ) ) ( not ( = ?auto_356549 ?auto_356551 ) ) ( not ( = ?auto_356550 ?auto_356551 ) ) ( ON ?auto_356549 ?auto_356550 ) ( ON ?auto_356548 ?auto_356549 ) ( CLEAR ?auto_356546 ) ( ON ?auto_356547 ?auto_356548 ) ( CLEAR ?auto_356547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_356546 ?auto_356547 )
      ( MAKE-5PILE ?auto_356546 ?auto_356547 ?auto_356548 ?auto_356549 ?auto_356550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_356568 - BLOCK
      ?auto_356569 - BLOCK
      ?auto_356570 - BLOCK
      ?auto_356571 - BLOCK
      ?auto_356572 - BLOCK
    )
    :vars
    (
      ?auto_356573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356572 ?auto_356573 ) ( not ( = ?auto_356568 ?auto_356569 ) ) ( not ( = ?auto_356568 ?auto_356570 ) ) ( not ( = ?auto_356568 ?auto_356571 ) ) ( not ( = ?auto_356568 ?auto_356572 ) ) ( not ( = ?auto_356568 ?auto_356573 ) ) ( not ( = ?auto_356569 ?auto_356570 ) ) ( not ( = ?auto_356569 ?auto_356571 ) ) ( not ( = ?auto_356569 ?auto_356572 ) ) ( not ( = ?auto_356569 ?auto_356573 ) ) ( not ( = ?auto_356570 ?auto_356571 ) ) ( not ( = ?auto_356570 ?auto_356572 ) ) ( not ( = ?auto_356570 ?auto_356573 ) ) ( not ( = ?auto_356571 ?auto_356572 ) ) ( not ( = ?auto_356571 ?auto_356573 ) ) ( not ( = ?auto_356572 ?auto_356573 ) ) ( ON ?auto_356571 ?auto_356572 ) ( ON ?auto_356570 ?auto_356571 ) ( ON ?auto_356569 ?auto_356570 ) ( ON ?auto_356568 ?auto_356569 ) ( CLEAR ?auto_356568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_356568 )
      ( MAKE-5PILE ?auto_356568 ?auto_356569 ?auto_356570 ?auto_356571 ?auto_356572 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_356591 - BLOCK
      ?auto_356592 - BLOCK
      ?auto_356593 - BLOCK
      ?auto_356594 - BLOCK
      ?auto_356595 - BLOCK
      ?auto_356596 - BLOCK
    )
    :vars
    (
      ?auto_356597 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_356595 ) ( ON ?auto_356596 ?auto_356597 ) ( CLEAR ?auto_356596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_356591 ) ( ON ?auto_356592 ?auto_356591 ) ( ON ?auto_356593 ?auto_356592 ) ( ON ?auto_356594 ?auto_356593 ) ( ON ?auto_356595 ?auto_356594 ) ( not ( = ?auto_356591 ?auto_356592 ) ) ( not ( = ?auto_356591 ?auto_356593 ) ) ( not ( = ?auto_356591 ?auto_356594 ) ) ( not ( = ?auto_356591 ?auto_356595 ) ) ( not ( = ?auto_356591 ?auto_356596 ) ) ( not ( = ?auto_356591 ?auto_356597 ) ) ( not ( = ?auto_356592 ?auto_356593 ) ) ( not ( = ?auto_356592 ?auto_356594 ) ) ( not ( = ?auto_356592 ?auto_356595 ) ) ( not ( = ?auto_356592 ?auto_356596 ) ) ( not ( = ?auto_356592 ?auto_356597 ) ) ( not ( = ?auto_356593 ?auto_356594 ) ) ( not ( = ?auto_356593 ?auto_356595 ) ) ( not ( = ?auto_356593 ?auto_356596 ) ) ( not ( = ?auto_356593 ?auto_356597 ) ) ( not ( = ?auto_356594 ?auto_356595 ) ) ( not ( = ?auto_356594 ?auto_356596 ) ) ( not ( = ?auto_356594 ?auto_356597 ) ) ( not ( = ?auto_356595 ?auto_356596 ) ) ( not ( = ?auto_356595 ?auto_356597 ) ) ( not ( = ?auto_356596 ?auto_356597 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_356596 ?auto_356597 )
      ( !STACK ?auto_356596 ?auto_356595 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_356617 - BLOCK
      ?auto_356618 - BLOCK
      ?auto_356619 - BLOCK
      ?auto_356620 - BLOCK
      ?auto_356621 - BLOCK
      ?auto_356622 - BLOCK
    )
    :vars
    (
      ?auto_356623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356622 ?auto_356623 ) ( ON-TABLE ?auto_356617 ) ( ON ?auto_356618 ?auto_356617 ) ( ON ?auto_356619 ?auto_356618 ) ( ON ?auto_356620 ?auto_356619 ) ( not ( = ?auto_356617 ?auto_356618 ) ) ( not ( = ?auto_356617 ?auto_356619 ) ) ( not ( = ?auto_356617 ?auto_356620 ) ) ( not ( = ?auto_356617 ?auto_356621 ) ) ( not ( = ?auto_356617 ?auto_356622 ) ) ( not ( = ?auto_356617 ?auto_356623 ) ) ( not ( = ?auto_356618 ?auto_356619 ) ) ( not ( = ?auto_356618 ?auto_356620 ) ) ( not ( = ?auto_356618 ?auto_356621 ) ) ( not ( = ?auto_356618 ?auto_356622 ) ) ( not ( = ?auto_356618 ?auto_356623 ) ) ( not ( = ?auto_356619 ?auto_356620 ) ) ( not ( = ?auto_356619 ?auto_356621 ) ) ( not ( = ?auto_356619 ?auto_356622 ) ) ( not ( = ?auto_356619 ?auto_356623 ) ) ( not ( = ?auto_356620 ?auto_356621 ) ) ( not ( = ?auto_356620 ?auto_356622 ) ) ( not ( = ?auto_356620 ?auto_356623 ) ) ( not ( = ?auto_356621 ?auto_356622 ) ) ( not ( = ?auto_356621 ?auto_356623 ) ) ( not ( = ?auto_356622 ?auto_356623 ) ) ( CLEAR ?auto_356620 ) ( ON ?auto_356621 ?auto_356622 ) ( CLEAR ?auto_356621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_356617 ?auto_356618 ?auto_356619 ?auto_356620 ?auto_356621 )
      ( MAKE-6PILE ?auto_356617 ?auto_356618 ?auto_356619 ?auto_356620 ?auto_356621 ?auto_356622 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_356643 - BLOCK
      ?auto_356644 - BLOCK
      ?auto_356645 - BLOCK
      ?auto_356646 - BLOCK
      ?auto_356647 - BLOCK
      ?auto_356648 - BLOCK
    )
    :vars
    (
      ?auto_356649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356648 ?auto_356649 ) ( ON-TABLE ?auto_356643 ) ( ON ?auto_356644 ?auto_356643 ) ( ON ?auto_356645 ?auto_356644 ) ( not ( = ?auto_356643 ?auto_356644 ) ) ( not ( = ?auto_356643 ?auto_356645 ) ) ( not ( = ?auto_356643 ?auto_356646 ) ) ( not ( = ?auto_356643 ?auto_356647 ) ) ( not ( = ?auto_356643 ?auto_356648 ) ) ( not ( = ?auto_356643 ?auto_356649 ) ) ( not ( = ?auto_356644 ?auto_356645 ) ) ( not ( = ?auto_356644 ?auto_356646 ) ) ( not ( = ?auto_356644 ?auto_356647 ) ) ( not ( = ?auto_356644 ?auto_356648 ) ) ( not ( = ?auto_356644 ?auto_356649 ) ) ( not ( = ?auto_356645 ?auto_356646 ) ) ( not ( = ?auto_356645 ?auto_356647 ) ) ( not ( = ?auto_356645 ?auto_356648 ) ) ( not ( = ?auto_356645 ?auto_356649 ) ) ( not ( = ?auto_356646 ?auto_356647 ) ) ( not ( = ?auto_356646 ?auto_356648 ) ) ( not ( = ?auto_356646 ?auto_356649 ) ) ( not ( = ?auto_356647 ?auto_356648 ) ) ( not ( = ?auto_356647 ?auto_356649 ) ) ( not ( = ?auto_356648 ?auto_356649 ) ) ( ON ?auto_356647 ?auto_356648 ) ( CLEAR ?auto_356645 ) ( ON ?auto_356646 ?auto_356647 ) ( CLEAR ?auto_356646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_356643 ?auto_356644 ?auto_356645 ?auto_356646 )
      ( MAKE-6PILE ?auto_356643 ?auto_356644 ?auto_356645 ?auto_356646 ?auto_356647 ?auto_356648 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_356669 - BLOCK
      ?auto_356670 - BLOCK
      ?auto_356671 - BLOCK
      ?auto_356672 - BLOCK
      ?auto_356673 - BLOCK
      ?auto_356674 - BLOCK
    )
    :vars
    (
      ?auto_356675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356674 ?auto_356675 ) ( ON-TABLE ?auto_356669 ) ( ON ?auto_356670 ?auto_356669 ) ( not ( = ?auto_356669 ?auto_356670 ) ) ( not ( = ?auto_356669 ?auto_356671 ) ) ( not ( = ?auto_356669 ?auto_356672 ) ) ( not ( = ?auto_356669 ?auto_356673 ) ) ( not ( = ?auto_356669 ?auto_356674 ) ) ( not ( = ?auto_356669 ?auto_356675 ) ) ( not ( = ?auto_356670 ?auto_356671 ) ) ( not ( = ?auto_356670 ?auto_356672 ) ) ( not ( = ?auto_356670 ?auto_356673 ) ) ( not ( = ?auto_356670 ?auto_356674 ) ) ( not ( = ?auto_356670 ?auto_356675 ) ) ( not ( = ?auto_356671 ?auto_356672 ) ) ( not ( = ?auto_356671 ?auto_356673 ) ) ( not ( = ?auto_356671 ?auto_356674 ) ) ( not ( = ?auto_356671 ?auto_356675 ) ) ( not ( = ?auto_356672 ?auto_356673 ) ) ( not ( = ?auto_356672 ?auto_356674 ) ) ( not ( = ?auto_356672 ?auto_356675 ) ) ( not ( = ?auto_356673 ?auto_356674 ) ) ( not ( = ?auto_356673 ?auto_356675 ) ) ( not ( = ?auto_356674 ?auto_356675 ) ) ( ON ?auto_356673 ?auto_356674 ) ( ON ?auto_356672 ?auto_356673 ) ( CLEAR ?auto_356670 ) ( ON ?auto_356671 ?auto_356672 ) ( CLEAR ?auto_356671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_356669 ?auto_356670 ?auto_356671 )
      ( MAKE-6PILE ?auto_356669 ?auto_356670 ?auto_356671 ?auto_356672 ?auto_356673 ?auto_356674 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_356695 - BLOCK
      ?auto_356696 - BLOCK
      ?auto_356697 - BLOCK
      ?auto_356698 - BLOCK
      ?auto_356699 - BLOCK
      ?auto_356700 - BLOCK
    )
    :vars
    (
      ?auto_356701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356700 ?auto_356701 ) ( ON-TABLE ?auto_356695 ) ( not ( = ?auto_356695 ?auto_356696 ) ) ( not ( = ?auto_356695 ?auto_356697 ) ) ( not ( = ?auto_356695 ?auto_356698 ) ) ( not ( = ?auto_356695 ?auto_356699 ) ) ( not ( = ?auto_356695 ?auto_356700 ) ) ( not ( = ?auto_356695 ?auto_356701 ) ) ( not ( = ?auto_356696 ?auto_356697 ) ) ( not ( = ?auto_356696 ?auto_356698 ) ) ( not ( = ?auto_356696 ?auto_356699 ) ) ( not ( = ?auto_356696 ?auto_356700 ) ) ( not ( = ?auto_356696 ?auto_356701 ) ) ( not ( = ?auto_356697 ?auto_356698 ) ) ( not ( = ?auto_356697 ?auto_356699 ) ) ( not ( = ?auto_356697 ?auto_356700 ) ) ( not ( = ?auto_356697 ?auto_356701 ) ) ( not ( = ?auto_356698 ?auto_356699 ) ) ( not ( = ?auto_356698 ?auto_356700 ) ) ( not ( = ?auto_356698 ?auto_356701 ) ) ( not ( = ?auto_356699 ?auto_356700 ) ) ( not ( = ?auto_356699 ?auto_356701 ) ) ( not ( = ?auto_356700 ?auto_356701 ) ) ( ON ?auto_356699 ?auto_356700 ) ( ON ?auto_356698 ?auto_356699 ) ( ON ?auto_356697 ?auto_356698 ) ( CLEAR ?auto_356695 ) ( ON ?auto_356696 ?auto_356697 ) ( CLEAR ?auto_356696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_356695 ?auto_356696 )
      ( MAKE-6PILE ?auto_356695 ?auto_356696 ?auto_356697 ?auto_356698 ?auto_356699 ?auto_356700 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_356721 - BLOCK
      ?auto_356722 - BLOCK
      ?auto_356723 - BLOCK
      ?auto_356724 - BLOCK
      ?auto_356725 - BLOCK
      ?auto_356726 - BLOCK
    )
    :vars
    (
      ?auto_356727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356726 ?auto_356727 ) ( not ( = ?auto_356721 ?auto_356722 ) ) ( not ( = ?auto_356721 ?auto_356723 ) ) ( not ( = ?auto_356721 ?auto_356724 ) ) ( not ( = ?auto_356721 ?auto_356725 ) ) ( not ( = ?auto_356721 ?auto_356726 ) ) ( not ( = ?auto_356721 ?auto_356727 ) ) ( not ( = ?auto_356722 ?auto_356723 ) ) ( not ( = ?auto_356722 ?auto_356724 ) ) ( not ( = ?auto_356722 ?auto_356725 ) ) ( not ( = ?auto_356722 ?auto_356726 ) ) ( not ( = ?auto_356722 ?auto_356727 ) ) ( not ( = ?auto_356723 ?auto_356724 ) ) ( not ( = ?auto_356723 ?auto_356725 ) ) ( not ( = ?auto_356723 ?auto_356726 ) ) ( not ( = ?auto_356723 ?auto_356727 ) ) ( not ( = ?auto_356724 ?auto_356725 ) ) ( not ( = ?auto_356724 ?auto_356726 ) ) ( not ( = ?auto_356724 ?auto_356727 ) ) ( not ( = ?auto_356725 ?auto_356726 ) ) ( not ( = ?auto_356725 ?auto_356727 ) ) ( not ( = ?auto_356726 ?auto_356727 ) ) ( ON ?auto_356725 ?auto_356726 ) ( ON ?auto_356724 ?auto_356725 ) ( ON ?auto_356723 ?auto_356724 ) ( ON ?auto_356722 ?auto_356723 ) ( ON ?auto_356721 ?auto_356722 ) ( CLEAR ?auto_356721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_356721 )
      ( MAKE-6PILE ?auto_356721 ?auto_356722 ?auto_356723 ?auto_356724 ?auto_356725 ?auto_356726 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_356748 - BLOCK
      ?auto_356749 - BLOCK
      ?auto_356750 - BLOCK
      ?auto_356751 - BLOCK
      ?auto_356752 - BLOCK
      ?auto_356753 - BLOCK
      ?auto_356754 - BLOCK
    )
    :vars
    (
      ?auto_356755 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_356753 ) ( ON ?auto_356754 ?auto_356755 ) ( CLEAR ?auto_356754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_356748 ) ( ON ?auto_356749 ?auto_356748 ) ( ON ?auto_356750 ?auto_356749 ) ( ON ?auto_356751 ?auto_356750 ) ( ON ?auto_356752 ?auto_356751 ) ( ON ?auto_356753 ?auto_356752 ) ( not ( = ?auto_356748 ?auto_356749 ) ) ( not ( = ?auto_356748 ?auto_356750 ) ) ( not ( = ?auto_356748 ?auto_356751 ) ) ( not ( = ?auto_356748 ?auto_356752 ) ) ( not ( = ?auto_356748 ?auto_356753 ) ) ( not ( = ?auto_356748 ?auto_356754 ) ) ( not ( = ?auto_356748 ?auto_356755 ) ) ( not ( = ?auto_356749 ?auto_356750 ) ) ( not ( = ?auto_356749 ?auto_356751 ) ) ( not ( = ?auto_356749 ?auto_356752 ) ) ( not ( = ?auto_356749 ?auto_356753 ) ) ( not ( = ?auto_356749 ?auto_356754 ) ) ( not ( = ?auto_356749 ?auto_356755 ) ) ( not ( = ?auto_356750 ?auto_356751 ) ) ( not ( = ?auto_356750 ?auto_356752 ) ) ( not ( = ?auto_356750 ?auto_356753 ) ) ( not ( = ?auto_356750 ?auto_356754 ) ) ( not ( = ?auto_356750 ?auto_356755 ) ) ( not ( = ?auto_356751 ?auto_356752 ) ) ( not ( = ?auto_356751 ?auto_356753 ) ) ( not ( = ?auto_356751 ?auto_356754 ) ) ( not ( = ?auto_356751 ?auto_356755 ) ) ( not ( = ?auto_356752 ?auto_356753 ) ) ( not ( = ?auto_356752 ?auto_356754 ) ) ( not ( = ?auto_356752 ?auto_356755 ) ) ( not ( = ?auto_356753 ?auto_356754 ) ) ( not ( = ?auto_356753 ?auto_356755 ) ) ( not ( = ?auto_356754 ?auto_356755 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_356754 ?auto_356755 )
      ( !STACK ?auto_356754 ?auto_356753 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_356778 - BLOCK
      ?auto_356779 - BLOCK
      ?auto_356780 - BLOCK
      ?auto_356781 - BLOCK
      ?auto_356782 - BLOCK
      ?auto_356783 - BLOCK
      ?auto_356784 - BLOCK
    )
    :vars
    (
      ?auto_356785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356784 ?auto_356785 ) ( ON-TABLE ?auto_356778 ) ( ON ?auto_356779 ?auto_356778 ) ( ON ?auto_356780 ?auto_356779 ) ( ON ?auto_356781 ?auto_356780 ) ( ON ?auto_356782 ?auto_356781 ) ( not ( = ?auto_356778 ?auto_356779 ) ) ( not ( = ?auto_356778 ?auto_356780 ) ) ( not ( = ?auto_356778 ?auto_356781 ) ) ( not ( = ?auto_356778 ?auto_356782 ) ) ( not ( = ?auto_356778 ?auto_356783 ) ) ( not ( = ?auto_356778 ?auto_356784 ) ) ( not ( = ?auto_356778 ?auto_356785 ) ) ( not ( = ?auto_356779 ?auto_356780 ) ) ( not ( = ?auto_356779 ?auto_356781 ) ) ( not ( = ?auto_356779 ?auto_356782 ) ) ( not ( = ?auto_356779 ?auto_356783 ) ) ( not ( = ?auto_356779 ?auto_356784 ) ) ( not ( = ?auto_356779 ?auto_356785 ) ) ( not ( = ?auto_356780 ?auto_356781 ) ) ( not ( = ?auto_356780 ?auto_356782 ) ) ( not ( = ?auto_356780 ?auto_356783 ) ) ( not ( = ?auto_356780 ?auto_356784 ) ) ( not ( = ?auto_356780 ?auto_356785 ) ) ( not ( = ?auto_356781 ?auto_356782 ) ) ( not ( = ?auto_356781 ?auto_356783 ) ) ( not ( = ?auto_356781 ?auto_356784 ) ) ( not ( = ?auto_356781 ?auto_356785 ) ) ( not ( = ?auto_356782 ?auto_356783 ) ) ( not ( = ?auto_356782 ?auto_356784 ) ) ( not ( = ?auto_356782 ?auto_356785 ) ) ( not ( = ?auto_356783 ?auto_356784 ) ) ( not ( = ?auto_356783 ?auto_356785 ) ) ( not ( = ?auto_356784 ?auto_356785 ) ) ( CLEAR ?auto_356782 ) ( ON ?auto_356783 ?auto_356784 ) ( CLEAR ?auto_356783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_356778 ?auto_356779 ?auto_356780 ?auto_356781 ?auto_356782 ?auto_356783 )
      ( MAKE-7PILE ?auto_356778 ?auto_356779 ?auto_356780 ?auto_356781 ?auto_356782 ?auto_356783 ?auto_356784 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_356808 - BLOCK
      ?auto_356809 - BLOCK
      ?auto_356810 - BLOCK
      ?auto_356811 - BLOCK
      ?auto_356812 - BLOCK
      ?auto_356813 - BLOCK
      ?auto_356814 - BLOCK
    )
    :vars
    (
      ?auto_356815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356814 ?auto_356815 ) ( ON-TABLE ?auto_356808 ) ( ON ?auto_356809 ?auto_356808 ) ( ON ?auto_356810 ?auto_356809 ) ( ON ?auto_356811 ?auto_356810 ) ( not ( = ?auto_356808 ?auto_356809 ) ) ( not ( = ?auto_356808 ?auto_356810 ) ) ( not ( = ?auto_356808 ?auto_356811 ) ) ( not ( = ?auto_356808 ?auto_356812 ) ) ( not ( = ?auto_356808 ?auto_356813 ) ) ( not ( = ?auto_356808 ?auto_356814 ) ) ( not ( = ?auto_356808 ?auto_356815 ) ) ( not ( = ?auto_356809 ?auto_356810 ) ) ( not ( = ?auto_356809 ?auto_356811 ) ) ( not ( = ?auto_356809 ?auto_356812 ) ) ( not ( = ?auto_356809 ?auto_356813 ) ) ( not ( = ?auto_356809 ?auto_356814 ) ) ( not ( = ?auto_356809 ?auto_356815 ) ) ( not ( = ?auto_356810 ?auto_356811 ) ) ( not ( = ?auto_356810 ?auto_356812 ) ) ( not ( = ?auto_356810 ?auto_356813 ) ) ( not ( = ?auto_356810 ?auto_356814 ) ) ( not ( = ?auto_356810 ?auto_356815 ) ) ( not ( = ?auto_356811 ?auto_356812 ) ) ( not ( = ?auto_356811 ?auto_356813 ) ) ( not ( = ?auto_356811 ?auto_356814 ) ) ( not ( = ?auto_356811 ?auto_356815 ) ) ( not ( = ?auto_356812 ?auto_356813 ) ) ( not ( = ?auto_356812 ?auto_356814 ) ) ( not ( = ?auto_356812 ?auto_356815 ) ) ( not ( = ?auto_356813 ?auto_356814 ) ) ( not ( = ?auto_356813 ?auto_356815 ) ) ( not ( = ?auto_356814 ?auto_356815 ) ) ( ON ?auto_356813 ?auto_356814 ) ( CLEAR ?auto_356811 ) ( ON ?auto_356812 ?auto_356813 ) ( CLEAR ?auto_356812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_356808 ?auto_356809 ?auto_356810 ?auto_356811 ?auto_356812 )
      ( MAKE-7PILE ?auto_356808 ?auto_356809 ?auto_356810 ?auto_356811 ?auto_356812 ?auto_356813 ?auto_356814 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_356838 - BLOCK
      ?auto_356839 - BLOCK
      ?auto_356840 - BLOCK
      ?auto_356841 - BLOCK
      ?auto_356842 - BLOCK
      ?auto_356843 - BLOCK
      ?auto_356844 - BLOCK
    )
    :vars
    (
      ?auto_356845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356844 ?auto_356845 ) ( ON-TABLE ?auto_356838 ) ( ON ?auto_356839 ?auto_356838 ) ( ON ?auto_356840 ?auto_356839 ) ( not ( = ?auto_356838 ?auto_356839 ) ) ( not ( = ?auto_356838 ?auto_356840 ) ) ( not ( = ?auto_356838 ?auto_356841 ) ) ( not ( = ?auto_356838 ?auto_356842 ) ) ( not ( = ?auto_356838 ?auto_356843 ) ) ( not ( = ?auto_356838 ?auto_356844 ) ) ( not ( = ?auto_356838 ?auto_356845 ) ) ( not ( = ?auto_356839 ?auto_356840 ) ) ( not ( = ?auto_356839 ?auto_356841 ) ) ( not ( = ?auto_356839 ?auto_356842 ) ) ( not ( = ?auto_356839 ?auto_356843 ) ) ( not ( = ?auto_356839 ?auto_356844 ) ) ( not ( = ?auto_356839 ?auto_356845 ) ) ( not ( = ?auto_356840 ?auto_356841 ) ) ( not ( = ?auto_356840 ?auto_356842 ) ) ( not ( = ?auto_356840 ?auto_356843 ) ) ( not ( = ?auto_356840 ?auto_356844 ) ) ( not ( = ?auto_356840 ?auto_356845 ) ) ( not ( = ?auto_356841 ?auto_356842 ) ) ( not ( = ?auto_356841 ?auto_356843 ) ) ( not ( = ?auto_356841 ?auto_356844 ) ) ( not ( = ?auto_356841 ?auto_356845 ) ) ( not ( = ?auto_356842 ?auto_356843 ) ) ( not ( = ?auto_356842 ?auto_356844 ) ) ( not ( = ?auto_356842 ?auto_356845 ) ) ( not ( = ?auto_356843 ?auto_356844 ) ) ( not ( = ?auto_356843 ?auto_356845 ) ) ( not ( = ?auto_356844 ?auto_356845 ) ) ( ON ?auto_356843 ?auto_356844 ) ( ON ?auto_356842 ?auto_356843 ) ( CLEAR ?auto_356840 ) ( ON ?auto_356841 ?auto_356842 ) ( CLEAR ?auto_356841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_356838 ?auto_356839 ?auto_356840 ?auto_356841 )
      ( MAKE-7PILE ?auto_356838 ?auto_356839 ?auto_356840 ?auto_356841 ?auto_356842 ?auto_356843 ?auto_356844 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_356868 - BLOCK
      ?auto_356869 - BLOCK
      ?auto_356870 - BLOCK
      ?auto_356871 - BLOCK
      ?auto_356872 - BLOCK
      ?auto_356873 - BLOCK
      ?auto_356874 - BLOCK
    )
    :vars
    (
      ?auto_356875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356874 ?auto_356875 ) ( ON-TABLE ?auto_356868 ) ( ON ?auto_356869 ?auto_356868 ) ( not ( = ?auto_356868 ?auto_356869 ) ) ( not ( = ?auto_356868 ?auto_356870 ) ) ( not ( = ?auto_356868 ?auto_356871 ) ) ( not ( = ?auto_356868 ?auto_356872 ) ) ( not ( = ?auto_356868 ?auto_356873 ) ) ( not ( = ?auto_356868 ?auto_356874 ) ) ( not ( = ?auto_356868 ?auto_356875 ) ) ( not ( = ?auto_356869 ?auto_356870 ) ) ( not ( = ?auto_356869 ?auto_356871 ) ) ( not ( = ?auto_356869 ?auto_356872 ) ) ( not ( = ?auto_356869 ?auto_356873 ) ) ( not ( = ?auto_356869 ?auto_356874 ) ) ( not ( = ?auto_356869 ?auto_356875 ) ) ( not ( = ?auto_356870 ?auto_356871 ) ) ( not ( = ?auto_356870 ?auto_356872 ) ) ( not ( = ?auto_356870 ?auto_356873 ) ) ( not ( = ?auto_356870 ?auto_356874 ) ) ( not ( = ?auto_356870 ?auto_356875 ) ) ( not ( = ?auto_356871 ?auto_356872 ) ) ( not ( = ?auto_356871 ?auto_356873 ) ) ( not ( = ?auto_356871 ?auto_356874 ) ) ( not ( = ?auto_356871 ?auto_356875 ) ) ( not ( = ?auto_356872 ?auto_356873 ) ) ( not ( = ?auto_356872 ?auto_356874 ) ) ( not ( = ?auto_356872 ?auto_356875 ) ) ( not ( = ?auto_356873 ?auto_356874 ) ) ( not ( = ?auto_356873 ?auto_356875 ) ) ( not ( = ?auto_356874 ?auto_356875 ) ) ( ON ?auto_356873 ?auto_356874 ) ( ON ?auto_356872 ?auto_356873 ) ( ON ?auto_356871 ?auto_356872 ) ( CLEAR ?auto_356869 ) ( ON ?auto_356870 ?auto_356871 ) ( CLEAR ?auto_356870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_356868 ?auto_356869 ?auto_356870 )
      ( MAKE-7PILE ?auto_356868 ?auto_356869 ?auto_356870 ?auto_356871 ?auto_356872 ?auto_356873 ?auto_356874 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_356898 - BLOCK
      ?auto_356899 - BLOCK
      ?auto_356900 - BLOCK
      ?auto_356901 - BLOCK
      ?auto_356902 - BLOCK
      ?auto_356903 - BLOCK
      ?auto_356904 - BLOCK
    )
    :vars
    (
      ?auto_356905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356904 ?auto_356905 ) ( ON-TABLE ?auto_356898 ) ( not ( = ?auto_356898 ?auto_356899 ) ) ( not ( = ?auto_356898 ?auto_356900 ) ) ( not ( = ?auto_356898 ?auto_356901 ) ) ( not ( = ?auto_356898 ?auto_356902 ) ) ( not ( = ?auto_356898 ?auto_356903 ) ) ( not ( = ?auto_356898 ?auto_356904 ) ) ( not ( = ?auto_356898 ?auto_356905 ) ) ( not ( = ?auto_356899 ?auto_356900 ) ) ( not ( = ?auto_356899 ?auto_356901 ) ) ( not ( = ?auto_356899 ?auto_356902 ) ) ( not ( = ?auto_356899 ?auto_356903 ) ) ( not ( = ?auto_356899 ?auto_356904 ) ) ( not ( = ?auto_356899 ?auto_356905 ) ) ( not ( = ?auto_356900 ?auto_356901 ) ) ( not ( = ?auto_356900 ?auto_356902 ) ) ( not ( = ?auto_356900 ?auto_356903 ) ) ( not ( = ?auto_356900 ?auto_356904 ) ) ( not ( = ?auto_356900 ?auto_356905 ) ) ( not ( = ?auto_356901 ?auto_356902 ) ) ( not ( = ?auto_356901 ?auto_356903 ) ) ( not ( = ?auto_356901 ?auto_356904 ) ) ( not ( = ?auto_356901 ?auto_356905 ) ) ( not ( = ?auto_356902 ?auto_356903 ) ) ( not ( = ?auto_356902 ?auto_356904 ) ) ( not ( = ?auto_356902 ?auto_356905 ) ) ( not ( = ?auto_356903 ?auto_356904 ) ) ( not ( = ?auto_356903 ?auto_356905 ) ) ( not ( = ?auto_356904 ?auto_356905 ) ) ( ON ?auto_356903 ?auto_356904 ) ( ON ?auto_356902 ?auto_356903 ) ( ON ?auto_356901 ?auto_356902 ) ( ON ?auto_356900 ?auto_356901 ) ( CLEAR ?auto_356898 ) ( ON ?auto_356899 ?auto_356900 ) ( CLEAR ?auto_356899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_356898 ?auto_356899 )
      ( MAKE-7PILE ?auto_356898 ?auto_356899 ?auto_356900 ?auto_356901 ?auto_356902 ?auto_356903 ?auto_356904 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_356928 - BLOCK
      ?auto_356929 - BLOCK
      ?auto_356930 - BLOCK
      ?auto_356931 - BLOCK
      ?auto_356932 - BLOCK
      ?auto_356933 - BLOCK
      ?auto_356934 - BLOCK
    )
    :vars
    (
      ?auto_356935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_356934 ?auto_356935 ) ( not ( = ?auto_356928 ?auto_356929 ) ) ( not ( = ?auto_356928 ?auto_356930 ) ) ( not ( = ?auto_356928 ?auto_356931 ) ) ( not ( = ?auto_356928 ?auto_356932 ) ) ( not ( = ?auto_356928 ?auto_356933 ) ) ( not ( = ?auto_356928 ?auto_356934 ) ) ( not ( = ?auto_356928 ?auto_356935 ) ) ( not ( = ?auto_356929 ?auto_356930 ) ) ( not ( = ?auto_356929 ?auto_356931 ) ) ( not ( = ?auto_356929 ?auto_356932 ) ) ( not ( = ?auto_356929 ?auto_356933 ) ) ( not ( = ?auto_356929 ?auto_356934 ) ) ( not ( = ?auto_356929 ?auto_356935 ) ) ( not ( = ?auto_356930 ?auto_356931 ) ) ( not ( = ?auto_356930 ?auto_356932 ) ) ( not ( = ?auto_356930 ?auto_356933 ) ) ( not ( = ?auto_356930 ?auto_356934 ) ) ( not ( = ?auto_356930 ?auto_356935 ) ) ( not ( = ?auto_356931 ?auto_356932 ) ) ( not ( = ?auto_356931 ?auto_356933 ) ) ( not ( = ?auto_356931 ?auto_356934 ) ) ( not ( = ?auto_356931 ?auto_356935 ) ) ( not ( = ?auto_356932 ?auto_356933 ) ) ( not ( = ?auto_356932 ?auto_356934 ) ) ( not ( = ?auto_356932 ?auto_356935 ) ) ( not ( = ?auto_356933 ?auto_356934 ) ) ( not ( = ?auto_356933 ?auto_356935 ) ) ( not ( = ?auto_356934 ?auto_356935 ) ) ( ON ?auto_356933 ?auto_356934 ) ( ON ?auto_356932 ?auto_356933 ) ( ON ?auto_356931 ?auto_356932 ) ( ON ?auto_356930 ?auto_356931 ) ( ON ?auto_356929 ?auto_356930 ) ( ON ?auto_356928 ?auto_356929 ) ( CLEAR ?auto_356928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_356928 )
      ( MAKE-7PILE ?auto_356928 ?auto_356929 ?auto_356930 ?auto_356931 ?auto_356932 ?auto_356933 ?auto_356934 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_356959 - BLOCK
      ?auto_356960 - BLOCK
      ?auto_356961 - BLOCK
      ?auto_356962 - BLOCK
      ?auto_356963 - BLOCK
      ?auto_356964 - BLOCK
      ?auto_356965 - BLOCK
      ?auto_356966 - BLOCK
    )
    :vars
    (
      ?auto_356967 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_356965 ) ( ON ?auto_356966 ?auto_356967 ) ( CLEAR ?auto_356966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_356959 ) ( ON ?auto_356960 ?auto_356959 ) ( ON ?auto_356961 ?auto_356960 ) ( ON ?auto_356962 ?auto_356961 ) ( ON ?auto_356963 ?auto_356962 ) ( ON ?auto_356964 ?auto_356963 ) ( ON ?auto_356965 ?auto_356964 ) ( not ( = ?auto_356959 ?auto_356960 ) ) ( not ( = ?auto_356959 ?auto_356961 ) ) ( not ( = ?auto_356959 ?auto_356962 ) ) ( not ( = ?auto_356959 ?auto_356963 ) ) ( not ( = ?auto_356959 ?auto_356964 ) ) ( not ( = ?auto_356959 ?auto_356965 ) ) ( not ( = ?auto_356959 ?auto_356966 ) ) ( not ( = ?auto_356959 ?auto_356967 ) ) ( not ( = ?auto_356960 ?auto_356961 ) ) ( not ( = ?auto_356960 ?auto_356962 ) ) ( not ( = ?auto_356960 ?auto_356963 ) ) ( not ( = ?auto_356960 ?auto_356964 ) ) ( not ( = ?auto_356960 ?auto_356965 ) ) ( not ( = ?auto_356960 ?auto_356966 ) ) ( not ( = ?auto_356960 ?auto_356967 ) ) ( not ( = ?auto_356961 ?auto_356962 ) ) ( not ( = ?auto_356961 ?auto_356963 ) ) ( not ( = ?auto_356961 ?auto_356964 ) ) ( not ( = ?auto_356961 ?auto_356965 ) ) ( not ( = ?auto_356961 ?auto_356966 ) ) ( not ( = ?auto_356961 ?auto_356967 ) ) ( not ( = ?auto_356962 ?auto_356963 ) ) ( not ( = ?auto_356962 ?auto_356964 ) ) ( not ( = ?auto_356962 ?auto_356965 ) ) ( not ( = ?auto_356962 ?auto_356966 ) ) ( not ( = ?auto_356962 ?auto_356967 ) ) ( not ( = ?auto_356963 ?auto_356964 ) ) ( not ( = ?auto_356963 ?auto_356965 ) ) ( not ( = ?auto_356963 ?auto_356966 ) ) ( not ( = ?auto_356963 ?auto_356967 ) ) ( not ( = ?auto_356964 ?auto_356965 ) ) ( not ( = ?auto_356964 ?auto_356966 ) ) ( not ( = ?auto_356964 ?auto_356967 ) ) ( not ( = ?auto_356965 ?auto_356966 ) ) ( not ( = ?auto_356965 ?auto_356967 ) ) ( not ( = ?auto_356966 ?auto_356967 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_356966 ?auto_356967 )
      ( !STACK ?auto_356966 ?auto_356965 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_356993 - BLOCK
      ?auto_356994 - BLOCK
      ?auto_356995 - BLOCK
      ?auto_356996 - BLOCK
      ?auto_356997 - BLOCK
      ?auto_356998 - BLOCK
      ?auto_356999 - BLOCK
      ?auto_357000 - BLOCK
    )
    :vars
    (
      ?auto_357001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357000 ?auto_357001 ) ( ON-TABLE ?auto_356993 ) ( ON ?auto_356994 ?auto_356993 ) ( ON ?auto_356995 ?auto_356994 ) ( ON ?auto_356996 ?auto_356995 ) ( ON ?auto_356997 ?auto_356996 ) ( ON ?auto_356998 ?auto_356997 ) ( not ( = ?auto_356993 ?auto_356994 ) ) ( not ( = ?auto_356993 ?auto_356995 ) ) ( not ( = ?auto_356993 ?auto_356996 ) ) ( not ( = ?auto_356993 ?auto_356997 ) ) ( not ( = ?auto_356993 ?auto_356998 ) ) ( not ( = ?auto_356993 ?auto_356999 ) ) ( not ( = ?auto_356993 ?auto_357000 ) ) ( not ( = ?auto_356993 ?auto_357001 ) ) ( not ( = ?auto_356994 ?auto_356995 ) ) ( not ( = ?auto_356994 ?auto_356996 ) ) ( not ( = ?auto_356994 ?auto_356997 ) ) ( not ( = ?auto_356994 ?auto_356998 ) ) ( not ( = ?auto_356994 ?auto_356999 ) ) ( not ( = ?auto_356994 ?auto_357000 ) ) ( not ( = ?auto_356994 ?auto_357001 ) ) ( not ( = ?auto_356995 ?auto_356996 ) ) ( not ( = ?auto_356995 ?auto_356997 ) ) ( not ( = ?auto_356995 ?auto_356998 ) ) ( not ( = ?auto_356995 ?auto_356999 ) ) ( not ( = ?auto_356995 ?auto_357000 ) ) ( not ( = ?auto_356995 ?auto_357001 ) ) ( not ( = ?auto_356996 ?auto_356997 ) ) ( not ( = ?auto_356996 ?auto_356998 ) ) ( not ( = ?auto_356996 ?auto_356999 ) ) ( not ( = ?auto_356996 ?auto_357000 ) ) ( not ( = ?auto_356996 ?auto_357001 ) ) ( not ( = ?auto_356997 ?auto_356998 ) ) ( not ( = ?auto_356997 ?auto_356999 ) ) ( not ( = ?auto_356997 ?auto_357000 ) ) ( not ( = ?auto_356997 ?auto_357001 ) ) ( not ( = ?auto_356998 ?auto_356999 ) ) ( not ( = ?auto_356998 ?auto_357000 ) ) ( not ( = ?auto_356998 ?auto_357001 ) ) ( not ( = ?auto_356999 ?auto_357000 ) ) ( not ( = ?auto_356999 ?auto_357001 ) ) ( not ( = ?auto_357000 ?auto_357001 ) ) ( CLEAR ?auto_356998 ) ( ON ?auto_356999 ?auto_357000 ) ( CLEAR ?auto_356999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_356993 ?auto_356994 ?auto_356995 ?auto_356996 ?auto_356997 ?auto_356998 ?auto_356999 )
      ( MAKE-8PILE ?auto_356993 ?auto_356994 ?auto_356995 ?auto_356996 ?auto_356997 ?auto_356998 ?auto_356999 ?auto_357000 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_357027 - BLOCK
      ?auto_357028 - BLOCK
      ?auto_357029 - BLOCK
      ?auto_357030 - BLOCK
      ?auto_357031 - BLOCK
      ?auto_357032 - BLOCK
      ?auto_357033 - BLOCK
      ?auto_357034 - BLOCK
    )
    :vars
    (
      ?auto_357035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357034 ?auto_357035 ) ( ON-TABLE ?auto_357027 ) ( ON ?auto_357028 ?auto_357027 ) ( ON ?auto_357029 ?auto_357028 ) ( ON ?auto_357030 ?auto_357029 ) ( ON ?auto_357031 ?auto_357030 ) ( not ( = ?auto_357027 ?auto_357028 ) ) ( not ( = ?auto_357027 ?auto_357029 ) ) ( not ( = ?auto_357027 ?auto_357030 ) ) ( not ( = ?auto_357027 ?auto_357031 ) ) ( not ( = ?auto_357027 ?auto_357032 ) ) ( not ( = ?auto_357027 ?auto_357033 ) ) ( not ( = ?auto_357027 ?auto_357034 ) ) ( not ( = ?auto_357027 ?auto_357035 ) ) ( not ( = ?auto_357028 ?auto_357029 ) ) ( not ( = ?auto_357028 ?auto_357030 ) ) ( not ( = ?auto_357028 ?auto_357031 ) ) ( not ( = ?auto_357028 ?auto_357032 ) ) ( not ( = ?auto_357028 ?auto_357033 ) ) ( not ( = ?auto_357028 ?auto_357034 ) ) ( not ( = ?auto_357028 ?auto_357035 ) ) ( not ( = ?auto_357029 ?auto_357030 ) ) ( not ( = ?auto_357029 ?auto_357031 ) ) ( not ( = ?auto_357029 ?auto_357032 ) ) ( not ( = ?auto_357029 ?auto_357033 ) ) ( not ( = ?auto_357029 ?auto_357034 ) ) ( not ( = ?auto_357029 ?auto_357035 ) ) ( not ( = ?auto_357030 ?auto_357031 ) ) ( not ( = ?auto_357030 ?auto_357032 ) ) ( not ( = ?auto_357030 ?auto_357033 ) ) ( not ( = ?auto_357030 ?auto_357034 ) ) ( not ( = ?auto_357030 ?auto_357035 ) ) ( not ( = ?auto_357031 ?auto_357032 ) ) ( not ( = ?auto_357031 ?auto_357033 ) ) ( not ( = ?auto_357031 ?auto_357034 ) ) ( not ( = ?auto_357031 ?auto_357035 ) ) ( not ( = ?auto_357032 ?auto_357033 ) ) ( not ( = ?auto_357032 ?auto_357034 ) ) ( not ( = ?auto_357032 ?auto_357035 ) ) ( not ( = ?auto_357033 ?auto_357034 ) ) ( not ( = ?auto_357033 ?auto_357035 ) ) ( not ( = ?auto_357034 ?auto_357035 ) ) ( ON ?auto_357033 ?auto_357034 ) ( CLEAR ?auto_357031 ) ( ON ?auto_357032 ?auto_357033 ) ( CLEAR ?auto_357032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_357027 ?auto_357028 ?auto_357029 ?auto_357030 ?auto_357031 ?auto_357032 )
      ( MAKE-8PILE ?auto_357027 ?auto_357028 ?auto_357029 ?auto_357030 ?auto_357031 ?auto_357032 ?auto_357033 ?auto_357034 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_357061 - BLOCK
      ?auto_357062 - BLOCK
      ?auto_357063 - BLOCK
      ?auto_357064 - BLOCK
      ?auto_357065 - BLOCK
      ?auto_357066 - BLOCK
      ?auto_357067 - BLOCK
      ?auto_357068 - BLOCK
    )
    :vars
    (
      ?auto_357069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357068 ?auto_357069 ) ( ON-TABLE ?auto_357061 ) ( ON ?auto_357062 ?auto_357061 ) ( ON ?auto_357063 ?auto_357062 ) ( ON ?auto_357064 ?auto_357063 ) ( not ( = ?auto_357061 ?auto_357062 ) ) ( not ( = ?auto_357061 ?auto_357063 ) ) ( not ( = ?auto_357061 ?auto_357064 ) ) ( not ( = ?auto_357061 ?auto_357065 ) ) ( not ( = ?auto_357061 ?auto_357066 ) ) ( not ( = ?auto_357061 ?auto_357067 ) ) ( not ( = ?auto_357061 ?auto_357068 ) ) ( not ( = ?auto_357061 ?auto_357069 ) ) ( not ( = ?auto_357062 ?auto_357063 ) ) ( not ( = ?auto_357062 ?auto_357064 ) ) ( not ( = ?auto_357062 ?auto_357065 ) ) ( not ( = ?auto_357062 ?auto_357066 ) ) ( not ( = ?auto_357062 ?auto_357067 ) ) ( not ( = ?auto_357062 ?auto_357068 ) ) ( not ( = ?auto_357062 ?auto_357069 ) ) ( not ( = ?auto_357063 ?auto_357064 ) ) ( not ( = ?auto_357063 ?auto_357065 ) ) ( not ( = ?auto_357063 ?auto_357066 ) ) ( not ( = ?auto_357063 ?auto_357067 ) ) ( not ( = ?auto_357063 ?auto_357068 ) ) ( not ( = ?auto_357063 ?auto_357069 ) ) ( not ( = ?auto_357064 ?auto_357065 ) ) ( not ( = ?auto_357064 ?auto_357066 ) ) ( not ( = ?auto_357064 ?auto_357067 ) ) ( not ( = ?auto_357064 ?auto_357068 ) ) ( not ( = ?auto_357064 ?auto_357069 ) ) ( not ( = ?auto_357065 ?auto_357066 ) ) ( not ( = ?auto_357065 ?auto_357067 ) ) ( not ( = ?auto_357065 ?auto_357068 ) ) ( not ( = ?auto_357065 ?auto_357069 ) ) ( not ( = ?auto_357066 ?auto_357067 ) ) ( not ( = ?auto_357066 ?auto_357068 ) ) ( not ( = ?auto_357066 ?auto_357069 ) ) ( not ( = ?auto_357067 ?auto_357068 ) ) ( not ( = ?auto_357067 ?auto_357069 ) ) ( not ( = ?auto_357068 ?auto_357069 ) ) ( ON ?auto_357067 ?auto_357068 ) ( ON ?auto_357066 ?auto_357067 ) ( CLEAR ?auto_357064 ) ( ON ?auto_357065 ?auto_357066 ) ( CLEAR ?auto_357065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_357061 ?auto_357062 ?auto_357063 ?auto_357064 ?auto_357065 )
      ( MAKE-8PILE ?auto_357061 ?auto_357062 ?auto_357063 ?auto_357064 ?auto_357065 ?auto_357066 ?auto_357067 ?auto_357068 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_357095 - BLOCK
      ?auto_357096 - BLOCK
      ?auto_357097 - BLOCK
      ?auto_357098 - BLOCK
      ?auto_357099 - BLOCK
      ?auto_357100 - BLOCK
      ?auto_357101 - BLOCK
      ?auto_357102 - BLOCK
    )
    :vars
    (
      ?auto_357103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357102 ?auto_357103 ) ( ON-TABLE ?auto_357095 ) ( ON ?auto_357096 ?auto_357095 ) ( ON ?auto_357097 ?auto_357096 ) ( not ( = ?auto_357095 ?auto_357096 ) ) ( not ( = ?auto_357095 ?auto_357097 ) ) ( not ( = ?auto_357095 ?auto_357098 ) ) ( not ( = ?auto_357095 ?auto_357099 ) ) ( not ( = ?auto_357095 ?auto_357100 ) ) ( not ( = ?auto_357095 ?auto_357101 ) ) ( not ( = ?auto_357095 ?auto_357102 ) ) ( not ( = ?auto_357095 ?auto_357103 ) ) ( not ( = ?auto_357096 ?auto_357097 ) ) ( not ( = ?auto_357096 ?auto_357098 ) ) ( not ( = ?auto_357096 ?auto_357099 ) ) ( not ( = ?auto_357096 ?auto_357100 ) ) ( not ( = ?auto_357096 ?auto_357101 ) ) ( not ( = ?auto_357096 ?auto_357102 ) ) ( not ( = ?auto_357096 ?auto_357103 ) ) ( not ( = ?auto_357097 ?auto_357098 ) ) ( not ( = ?auto_357097 ?auto_357099 ) ) ( not ( = ?auto_357097 ?auto_357100 ) ) ( not ( = ?auto_357097 ?auto_357101 ) ) ( not ( = ?auto_357097 ?auto_357102 ) ) ( not ( = ?auto_357097 ?auto_357103 ) ) ( not ( = ?auto_357098 ?auto_357099 ) ) ( not ( = ?auto_357098 ?auto_357100 ) ) ( not ( = ?auto_357098 ?auto_357101 ) ) ( not ( = ?auto_357098 ?auto_357102 ) ) ( not ( = ?auto_357098 ?auto_357103 ) ) ( not ( = ?auto_357099 ?auto_357100 ) ) ( not ( = ?auto_357099 ?auto_357101 ) ) ( not ( = ?auto_357099 ?auto_357102 ) ) ( not ( = ?auto_357099 ?auto_357103 ) ) ( not ( = ?auto_357100 ?auto_357101 ) ) ( not ( = ?auto_357100 ?auto_357102 ) ) ( not ( = ?auto_357100 ?auto_357103 ) ) ( not ( = ?auto_357101 ?auto_357102 ) ) ( not ( = ?auto_357101 ?auto_357103 ) ) ( not ( = ?auto_357102 ?auto_357103 ) ) ( ON ?auto_357101 ?auto_357102 ) ( ON ?auto_357100 ?auto_357101 ) ( ON ?auto_357099 ?auto_357100 ) ( CLEAR ?auto_357097 ) ( ON ?auto_357098 ?auto_357099 ) ( CLEAR ?auto_357098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_357095 ?auto_357096 ?auto_357097 ?auto_357098 )
      ( MAKE-8PILE ?auto_357095 ?auto_357096 ?auto_357097 ?auto_357098 ?auto_357099 ?auto_357100 ?auto_357101 ?auto_357102 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_357129 - BLOCK
      ?auto_357130 - BLOCK
      ?auto_357131 - BLOCK
      ?auto_357132 - BLOCK
      ?auto_357133 - BLOCK
      ?auto_357134 - BLOCK
      ?auto_357135 - BLOCK
      ?auto_357136 - BLOCK
    )
    :vars
    (
      ?auto_357137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357136 ?auto_357137 ) ( ON-TABLE ?auto_357129 ) ( ON ?auto_357130 ?auto_357129 ) ( not ( = ?auto_357129 ?auto_357130 ) ) ( not ( = ?auto_357129 ?auto_357131 ) ) ( not ( = ?auto_357129 ?auto_357132 ) ) ( not ( = ?auto_357129 ?auto_357133 ) ) ( not ( = ?auto_357129 ?auto_357134 ) ) ( not ( = ?auto_357129 ?auto_357135 ) ) ( not ( = ?auto_357129 ?auto_357136 ) ) ( not ( = ?auto_357129 ?auto_357137 ) ) ( not ( = ?auto_357130 ?auto_357131 ) ) ( not ( = ?auto_357130 ?auto_357132 ) ) ( not ( = ?auto_357130 ?auto_357133 ) ) ( not ( = ?auto_357130 ?auto_357134 ) ) ( not ( = ?auto_357130 ?auto_357135 ) ) ( not ( = ?auto_357130 ?auto_357136 ) ) ( not ( = ?auto_357130 ?auto_357137 ) ) ( not ( = ?auto_357131 ?auto_357132 ) ) ( not ( = ?auto_357131 ?auto_357133 ) ) ( not ( = ?auto_357131 ?auto_357134 ) ) ( not ( = ?auto_357131 ?auto_357135 ) ) ( not ( = ?auto_357131 ?auto_357136 ) ) ( not ( = ?auto_357131 ?auto_357137 ) ) ( not ( = ?auto_357132 ?auto_357133 ) ) ( not ( = ?auto_357132 ?auto_357134 ) ) ( not ( = ?auto_357132 ?auto_357135 ) ) ( not ( = ?auto_357132 ?auto_357136 ) ) ( not ( = ?auto_357132 ?auto_357137 ) ) ( not ( = ?auto_357133 ?auto_357134 ) ) ( not ( = ?auto_357133 ?auto_357135 ) ) ( not ( = ?auto_357133 ?auto_357136 ) ) ( not ( = ?auto_357133 ?auto_357137 ) ) ( not ( = ?auto_357134 ?auto_357135 ) ) ( not ( = ?auto_357134 ?auto_357136 ) ) ( not ( = ?auto_357134 ?auto_357137 ) ) ( not ( = ?auto_357135 ?auto_357136 ) ) ( not ( = ?auto_357135 ?auto_357137 ) ) ( not ( = ?auto_357136 ?auto_357137 ) ) ( ON ?auto_357135 ?auto_357136 ) ( ON ?auto_357134 ?auto_357135 ) ( ON ?auto_357133 ?auto_357134 ) ( ON ?auto_357132 ?auto_357133 ) ( CLEAR ?auto_357130 ) ( ON ?auto_357131 ?auto_357132 ) ( CLEAR ?auto_357131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_357129 ?auto_357130 ?auto_357131 )
      ( MAKE-8PILE ?auto_357129 ?auto_357130 ?auto_357131 ?auto_357132 ?auto_357133 ?auto_357134 ?auto_357135 ?auto_357136 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_357163 - BLOCK
      ?auto_357164 - BLOCK
      ?auto_357165 - BLOCK
      ?auto_357166 - BLOCK
      ?auto_357167 - BLOCK
      ?auto_357168 - BLOCK
      ?auto_357169 - BLOCK
      ?auto_357170 - BLOCK
    )
    :vars
    (
      ?auto_357171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357170 ?auto_357171 ) ( ON-TABLE ?auto_357163 ) ( not ( = ?auto_357163 ?auto_357164 ) ) ( not ( = ?auto_357163 ?auto_357165 ) ) ( not ( = ?auto_357163 ?auto_357166 ) ) ( not ( = ?auto_357163 ?auto_357167 ) ) ( not ( = ?auto_357163 ?auto_357168 ) ) ( not ( = ?auto_357163 ?auto_357169 ) ) ( not ( = ?auto_357163 ?auto_357170 ) ) ( not ( = ?auto_357163 ?auto_357171 ) ) ( not ( = ?auto_357164 ?auto_357165 ) ) ( not ( = ?auto_357164 ?auto_357166 ) ) ( not ( = ?auto_357164 ?auto_357167 ) ) ( not ( = ?auto_357164 ?auto_357168 ) ) ( not ( = ?auto_357164 ?auto_357169 ) ) ( not ( = ?auto_357164 ?auto_357170 ) ) ( not ( = ?auto_357164 ?auto_357171 ) ) ( not ( = ?auto_357165 ?auto_357166 ) ) ( not ( = ?auto_357165 ?auto_357167 ) ) ( not ( = ?auto_357165 ?auto_357168 ) ) ( not ( = ?auto_357165 ?auto_357169 ) ) ( not ( = ?auto_357165 ?auto_357170 ) ) ( not ( = ?auto_357165 ?auto_357171 ) ) ( not ( = ?auto_357166 ?auto_357167 ) ) ( not ( = ?auto_357166 ?auto_357168 ) ) ( not ( = ?auto_357166 ?auto_357169 ) ) ( not ( = ?auto_357166 ?auto_357170 ) ) ( not ( = ?auto_357166 ?auto_357171 ) ) ( not ( = ?auto_357167 ?auto_357168 ) ) ( not ( = ?auto_357167 ?auto_357169 ) ) ( not ( = ?auto_357167 ?auto_357170 ) ) ( not ( = ?auto_357167 ?auto_357171 ) ) ( not ( = ?auto_357168 ?auto_357169 ) ) ( not ( = ?auto_357168 ?auto_357170 ) ) ( not ( = ?auto_357168 ?auto_357171 ) ) ( not ( = ?auto_357169 ?auto_357170 ) ) ( not ( = ?auto_357169 ?auto_357171 ) ) ( not ( = ?auto_357170 ?auto_357171 ) ) ( ON ?auto_357169 ?auto_357170 ) ( ON ?auto_357168 ?auto_357169 ) ( ON ?auto_357167 ?auto_357168 ) ( ON ?auto_357166 ?auto_357167 ) ( ON ?auto_357165 ?auto_357166 ) ( CLEAR ?auto_357163 ) ( ON ?auto_357164 ?auto_357165 ) ( CLEAR ?auto_357164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_357163 ?auto_357164 )
      ( MAKE-8PILE ?auto_357163 ?auto_357164 ?auto_357165 ?auto_357166 ?auto_357167 ?auto_357168 ?auto_357169 ?auto_357170 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_357197 - BLOCK
      ?auto_357198 - BLOCK
      ?auto_357199 - BLOCK
      ?auto_357200 - BLOCK
      ?auto_357201 - BLOCK
      ?auto_357202 - BLOCK
      ?auto_357203 - BLOCK
      ?auto_357204 - BLOCK
    )
    :vars
    (
      ?auto_357205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357204 ?auto_357205 ) ( not ( = ?auto_357197 ?auto_357198 ) ) ( not ( = ?auto_357197 ?auto_357199 ) ) ( not ( = ?auto_357197 ?auto_357200 ) ) ( not ( = ?auto_357197 ?auto_357201 ) ) ( not ( = ?auto_357197 ?auto_357202 ) ) ( not ( = ?auto_357197 ?auto_357203 ) ) ( not ( = ?auto_357197 ?auto_357204 ) ) ( not ( = ?auto_357197 ?auto_357205 ) ) ( not ( = ?auto_357198 ?auto_357199 ) ) ( not ( = ?auto_357198 ?auto_357200 ) ) ( not ( = ?auto_357198 ?auto_357201 ) ) ( not ( = ?auto_357198 ?auto_357202 ) ) ( not ( = ?auto_357198 ?auto_357203 ) ) ( not ( = ?auto_357198 ?auto_357204 ) ) ( not ( = ?auto_357198 ?auto_357205 ) ) ( not ( = ?auto_357199 ?auto_357200 ) ) ( not ( = ?auto_357199 ?auto_357201 ) ) ( not ( = ?auto_357199 ?auto_357202 ) ) ( not ( = ?auto_357199 ?auto_357203 ) ) ( not ( = ?auto_357199 ?auto_357204 ) ) ( not ( = ?auto_357199 ?auto_357205 ) ) ( not ( = ?auto_357200 ?auto_357201 ) ) ( not ( = ?auto_357200 ?auto_357202 ) ) ( not ( = ?auto_357200 ?auto_357203 ) ) ( not ( = ?auto_357200 ?auto_357204 ) ) ( not ( = ?auto_357200 ?auto_357205 ) ) ( not ( = ?auto_357201 ?auto_357202 ) ) ( not ( = ?auto_357201 ?auto_357203 ) ) ( not ( = ?auto_357201 ?auto_357204 ) ) ( not ( = ?auto_357201 ?auto_357205 ) ) ( not ( = ?auto_357202 ?auto_357203 ) ) ( not ( = ?auto_357202 ?auto_357204 ) ) ( not ( = ?auto_357202 ?auto_357205 ) ) ( not ( = ?auto_357203 ?auto_357204 ) ) ( not ( = ?auto_357203 ?auto_357205 ) ) ( not ( = ?auto_357204 ?auto_357205 ) ) ( ON ?auto_357203 ?auto_357204 ) ( ON ?auto_357202 ?auto_357203 ) ( ON ?auto_357201 ?auto_357202 ) ( ON ?auto_357200 ?auto_357201 ) ( ON ?auto_357199 ?auto_357200 ) ( ON ?auto_357198 ?auto_357199 ) ( ON ?auto_357197 ?auto_357198 ) ( CLEAR ?auto_357197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_357197 )
      ( MAKE-8PILE ?auto_357197 ?auto_357198 ?auto_357199 ?auto_357200 ?auto_357201 ?auto_357202 ?auto_357203 ?auto_357204 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_357232 - BLOCK
      ?auto_357233 - BLOCK
      ?auto_357234 - BLOCK
      ?auto_357235 - BLOCK
      ?auto_357236 - BLOCK
      ?auto_357237 - BLOCK
      ?auto_357238 - BLOCK
      ?auto_357239 - BLOCK
      ?auto_357240 - BLOCK
    )
    :vars
    (
      ?auto_357241 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_357239 ) ( ON ?auto_357240 ?auto_357241 ) ( CLEAR ?auto_357240 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_357232 ) ( ON ?auto_357233 ?auto_357232 ) ( ON ?auto_357234 ?auto_357233 ) ( ON ?auto_357235 ?auto_357234 ) ( ON ?auto_357236 ?auto_357235 ) ( ON ?auto_357237 ?auto_357236 ) ( ON ?auto_357238 ?auto_357237 ) ( ON ?auto_357239 ?auto_357238 ) ( not ( = ?auto_357232 ?auto_357233 ) ) ( not ( = ?auto_357232 ?auto_357234 ) ) ( not ( = ?auto_357232 ?auto_357235 ) ) ( not ( = ?auto_357232 ?auto_357236 ) ) ( not ( = ?auto_357232 ?auto_357237 ) ) ( not ( = ?auto_357232 ?auto_357238 ) ) ( not ( = ?auto_357232 ?auto_357239 ) ) ( not ( = ?auto_357232 ?auto_357240 ) ) ( not ( = ?auto_357232 ?auto_357241 ) ) ( not ( = ?auto_357233 ?auto_357234 ) ) ( not ( = ?auto_357233 ?auto_357235 ) ) ( not ( = ?auto_357233 ?auto_357236 ) ) ( not ( = ?auto_357233 ?auto_357237 ) ) ( not ( = ?auto_357233 ?auto_357238 ) ) ( not ( = ?auto_357233 ?auto_357239 ) ) ( not ( = ?auto_357233 ?auto_357240 ) ) ( not ( = ?auto_357233 ?auto_357241 ) ) ( not ( = ?auto_357234 ?auto_357235 ) ) ( not ( = ?auto_357234 ?auto_357236 ) ) ( not ( = ?auto_357234 ?auto_357237 ) ) ( not ( = ?auto_357234 ?auto_357238 ) ) ( not ( = ?auto_357234 ?auto_357239 ) ) ( not ( = ?auto_357234 ?auto_357240 ) ) ( not ( = ?auto_357234 ?auto_357241 ) ) ( not ( = ?auto_357235 ?auto_357236 ) ) ( not ( = ?auto_357235 ?auto_357237 ) ) ( not ( = ?auto_357235 ?auto_357238 ) ) ( not ( = ?auto_357235 ?auto_357239 ) ) ( not ( = ?auto_357235 ?auto_357240 ) ) ( not ( = ?auto_357235 ?auto_357241 ) ) ( not ( = ?auto_357236 ?auto_357237 ) ) ( not ( = ?auto_357236 ?auto_357238 ) ) ( not ( = ?auto_357236 ?auto_357239 ) ) ( not ( = ?auto_357236 ?auto_357240 ) ) ( not ( = ?auto_357236 ?auto_357241 ) ) ( not ( = ?auto_357237 ?auto_357238 ) ) ( not ( = ?auto_357237 ?auto_357239 ) ) ( not ( = ?auto_357237 ?auto_357240 ) ) ( not ( = ?auto_357237 ?auto_357241 ) ) ( not ( = ?auto_357238 ?auto_357239 ) ) ( not ( = ?auto_357238 ?auto_357240 ) ) ( not ( = ?auto_357238 ?auto_357241 ) ) ( not ( = ?auto_357239 ?auto_357240 ) ) ( not ( = ?auto_357239 ?auto_357241 ) ) ( not ( = ?auto_357240 ?auto_357241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_357240 ?auto_357241 )
      ( !STACK ?auto_357240 ?auto_357239 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_357270 - BLOCK
      ?auto_357271 - BLOCK
      ?auto_357272 - BLOCK
      ?auto_357273 - BLOCK
      ?auto_357274 - BLOCK
      ?auto_357275 - BLOCK
      ?auto_357276 - BLOCK
      ?auto_357277 - BLOCK
      ?auto_357278 - BLOCK
    )
    :vars
    (
      ?auto_357279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357278 ?auto_357279 ) ( ON-TABLE ?auto_357270 ) ( ON ?auto_357271 ?auto_357270 ) ( ON ?auto_357272 ?auto_357271 ) ( ON ?auto_357273 ?auto_357272 ) ( ON ?auto_357274 ?auto_357273 ) ( ON ?auto_357275 ?auto_357274 ) ( ON ?auto_357276 ?auto_357275 ) ( not ( = ?auto_357270 ?auto_357271 ) ) ( not ( = ?auto_357270 ?auto_357272 ) ) ( not ( = ?auto_357270 ?auto_357273 ) ) ( not ( = ?auto_357270 ?auto_357274 ) ) ( not ( = ?auto_357270 ?auto_357275 ) ) ( not ( = ?auto_357270 ?auto_357276 ) ) ( not ( = ?auto_357270 ?auto_357277 ) ) ( not ( = ?auto_357270 ?auto_357278 ) ) ( not ( = ?auto_357270 ?auto_357279 ) ) ( not ( = ?auto_357271 ?auto_357272 ) ) ( not ( = ?auto_357271 ?auto_357273 ) ) ( not ( = ?auto_357271 ?auto_357274 ) ) ( not ( = ?auto_357271 ?auto_357275 ) ) ( not ( = ?auto_357271 ?auto_357276 ) ) ( not ( = ?auto_357271 ?auto_357277 ) ) ( not ( = ?auto_357271 ?auto_357278 ) ) ( not ( = ?auto_357271 ?auto_357279 ) ) ( not ( = ?auto_357272 ?auto_357273 ) ) ( not ( = ?auto_357272 ?auto_357274 ) ) ( not ( = ?auto_357272 ?auto_357275 ) ) ( not ( = ?auto_357272 ?auto_357276 ) ) ( not ( = ?auto_357272 ?auto_357277 ) ) ( not ( = ?auto_357272 ?auto_357278 ) ) ( not ( = ?auto_357272 ?auto_357279 ) ) ( not ( = ?auto_357273 ?auto_357274 ) ) ( not ( = ?auto_357273 ?auto_357275 ) ) ( not ( = ?auto_357273 ?auto_357276 ) ) ( not ( = ?auto_357273 ?auto_357277 ) ) ( not ( = ?auto_357273 ?auto_357278 ) ) ( not ( = ?auto_357273 ?auto_357279 ) ) ( not ( = ?auto_357274 ?auto_357275 ) ) ( not ( = ?auto_357274 ?auto_357276 ) ) ( not ( = ?auto_357274 ?auto_357277 ) ) ( not ( = ?auto_357274 ?auto_357278 ) ) ( not ( = ?auto_357274 ?auto_357279 ) ) ( not ( = ?auto_357275 ?auto_357276 ) ) ( not ( = ?auto_357275 ?auto_357277 ) ) ( not ( = ?auto_357275 ?auto_357278 ) ) ( not ( = ?auto_357275 ?auto_357279 ) ) ( not ( = ?auto_357276 ?auto_357277 ) ) ( not ( = ?auto_357276 ?auto_357278 ) ) ( not ( = ?auto_357276 ?auto_357279 ) ) ( not ( = ?auto_357277 ?auto_357278 ) ) ( not ( = ?auto_357277 ?auto_357279 ) ) ( not ( = ?auto_357278 ?auto_357279 ) ) ( CLEAR ?auto_357276 ) ( ON ?auto_357277 ?auto_357278 ) ( CLEAR ?auto_357277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_357270 ?auto_357271 ?auto_357272 ?auto_357273 ?auto_357274 ?auto_357275 ?auto_357276 ?auto_357277 )
      ( MAKE-9PILE ?auto_357270 ?auto_357271 ?auto_357272 ?auto_357273 ?auto_357274 ?auto_357275 ?auto_357276 ?auto_357277 ?auto_357278 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_357308 - BLOCK
      ?auto_357309 - BLOCK
      ?auto_357310 - BLOCK
      ?auto_357311 - BLOCK
      ?auto_357312 - BLOCK
      ?auto_357313 - BLOCK
      ?auto_357314 - BLOCK
      ?auto_357315 - BLOCK
      ?auto_357316 - BLOCK
    )
    :vars
    (
      ?auto_357317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357316 ?auto_357317 ) ( ON-TABLE ?auto_357308 ) ( ON ?auto_357309 ?auto_357308 ) ( ON ?auto_357310 ?auto_357309 ) ( ON ?auto_357311 ?auto_357310 ) ( ON ?auto_357312 ?auto_357311 ) ( ON ?auto_357313 ?auto_357312 ) ( not ( = ?auto_357308 ?auto_357309 ) ) ( not ( = ?auto_357308 ?auto_357310 ) ) ( not ( = ?auto_357308 ?auto_357311 ) ) ( not ( = ?auto_357308 ?auto_357312 ) ) ( not ( = ?auto_357308 ?auto_357313 ) ) ( not ( = ?auto_357308 ?auto_357314 ) ) ( not ( = ?auto_357308 ?auto_357315 ) ) ( not ( = ?auto_357308 ?auto_357316 ) ) ( not ( = ?auto_357308 ?auto_357317 ) ) ( not ( = ?auto_357309 ?auto_357310 ) ) ( not ( = ?auto_357309 ?auto_357311 ) ) ( not ( = ?auto_357309 ?auto_357312 ) ) ( not ( = ?auto_357309 ?auto_357313 ) ) ( not ( = ?auto_357309 ?auto_357314 ) ) ( not ( = ?auto_357309 ?auto_357315 ) ) ( not ( = ?auto_357309 ?auto_357316 ) ) ( not ( = ?auto_357309 ?auto_357317 ) ) ( not ( = ?auto_357310 ?auto_357311 ) ) ( not ( = ?auto_357310 ?auto_357312 ) ) ( not ( = ?auto_357310 ?auto_357313 ) ) ( not ( = ?auto_357310 ?auto_357314 ) ) ( not ( = ?auto_357310 ?auto_357315 ) ) ( not ( = ?auto_357310 ?auto_357316 ) ) ( not ( = ?auto_357310 ?auto_357317 ) ) ( not ( = ?auto_357311 ?auto_357312 ) ) ( not ( = ?auto_357311 ?auto_357313 ) ) ( not ( = ?auto_357311 ?auto_357314 ) ) ( not ( = ?auto_357311 ?auto_357315 ) ) ( not ( = ?auto_357311 ?auto_357316 ) ) ( not ( = ?auto_357311 ?auto_357317 ) ) ( not ( = ?auto_357312 ?auto_357313 ) ) ( not ( = ?auto_357312 ?auto_357314 ) ) ( not ( = ?auto_357312 ?auto_357315 ) ) ( not ( = ?auto_357312 ?auto_357316 ) ) ( not ( = ?auto_357312 ?auto_357317 ) ) ( not ( = ?auto_357313 ?auto_357314 ) ) ( not ( = ?auto_357313 ?auto_357315 ) ) ( not ( = ?auto_357313 ?auto_357316 ) ) ( not ( = ?auto_357313 ?auto_357317 ) ) ( not ( = ?auto_357314 ?auto_357315 ) ) ( not ( = ?auto_357314 ?auto_357316 ) ) ( not ( = ?auto_357314 ?auto_357317 ) ) ( not ( = ?auto_357315 ?auto_357316 ) ) ( not ( = ?auto_357315 ?auto_357317 ) ) ( not ( = ?auto_357316 ?auto_357317 ) ) ( ON ?auto_357315 ?auto_357316 ) ( CLEAR ?auto_357313 ) ( ON ?auto_357314 ?auto_357315 ) ( CLEAR ?auto_357314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_357308 ?auto_357309 ?auto_357310 ?auto_357311 ?auto_357312 ?auto_357313 ?auto_357314 )
      ( MAKE-9PILE ?auto_357308 ?auto_357309 ?auto_357310 ?auto_357311 ?auto_357312 ?auto_357313 ?auto_357314 ?auto_357315 ?auto_357316 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_357346 - BLOCK
      ?auto_357347 - BLOCK
      ?auto_357348 - BLOCK
      ?auto_357349 - BLOCK
      ?auto_357350 - BLOCK
      ?auto_357351 - BLOCK
      ?auto_357352 - BLOCK
      ?auto_357353 - BLOCK
      ?auto_357354 - BLOCK
    )
    :vars
    (
      ?auto_357355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357354 ?auto_357355 ) ( ON-TABLE ?auto_357346 ) ( ON ?auto_357347 ?auto_357346 ) ( ON ?auto_357348 ?auto_357347 ) ( ON ?auto_357349 ?auto_357348 ) ( ON ?auto_357350 ?auto_357349 ) ( not ( = ?auto_357346 ?auto_357347 ) ) ( not ( = ?auto_357346 ?auto_357348 ) ) ( not ( = ?auto_357346 ?auto_357349 ) ) ( not ( = ?auto_357346 ?auto_357350 ) ) ( not ( = ?auto_357346 ?auto_357351 ) ) ( not ( = ?auto_357346 ?auto_357352 ) ) ( not ( = ?auto_357346 ?auto_357353 ) ) ( not ( = ?auto_357346 ?auto_357354 ) ) ( not ( = ?auto_357346 ?auto_357355 ) ) ( not ( = ?auto_357347 ?auto_357348 ) ) ( not ( = ?auto_357347 ?auto_357349 ) ) ( not ( = ?auto_357347 ?auto_357350 ) ) ( not ( = ?auto_357347 ?auto_357351 ) ) ( not ( = ?auto_357347 ?auto_357352 ) ) ( not ( = ?auto_357347 ?auto_357353 ) ) ( not ( = ?auto_357347 ?auto_357354 ) ) ( not ( = ?auto_357347 ?auto_357355 ) ) ( not ( = ?auto_357348 ?auto_357349 ) ) ( not ( = ?auto_357348 ?auto_357350 ) ) ( not ( = ?auto_357348 ?auto_357351 ) ) ( not ( = ?auto_357348 ?auto_357352 ) ) ( not ( = ?auto_357348 ?auto_357353 ) ) ( not ( = ?auto_357348 ?auto_357354 ) ) ( not ( = ?auto_357348 ?auto_357355 ) ) ( not ( = ?auto_357349 ?auto_357350 ) ) ( not ( = ?auto_357349 ?auto_357351 ) ) ( not ( = ?auto_357349 ?auto_357352 ) ) ( not ( = ?auto_357349 ?auto_357353 ) ) ( not ( = ?auto_357349 ?auto_357354 ) ) ( not ( = ?auto_357349 ?auto_357355 ) ) ( not ( = ?auto_357350 ?auto_357351 ) ) ( not ( = ?auto_357350 ?auto_357352 ) ) ( not ( = ?auto_357350 ?auto_357353 ) ) ( not ( = ?auto_357350 ?auto_357354 ) ) ( not ( = ?auto_357350 ?auto_357355 ) ) ( not ( = ?auto_357351 ?auto_357352 ) ) ( not ( = ?auto_357351 ?auto_357353 ) ) ( not ( = ?auto_357351 ?auto_357354 ) ) ( not ( = ?auto_357351 ?auto_357355 ) ) ( not ( = ?auto_357352 ?auto_357353 ) ) ( not ( = ?auto_357352 ?auto_357354 ) ) ( not ( = ?auto_357352 ?auto_357355 ) ) ( not ( = ?auto_357353 ?auto_357354 ) ) ( not ( = ?auto_357353 ?auto_357355 ) ) ( not ( = ?auto_357354 ?auto_357355 ) ) ( ON ?auto_357353 ?auto_357354 ) ( ON ?auto_357352 ?auto_357353 ) ( CLEAR ?auto_357350 ) ( ON ?auto_357351 ?auto_357352 ) ( CLEAR ?auto_357351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_357346 ?auto_357347 ?auto_357348 ?auto_357349 ?auto_357350 ?auto_357351 )
      ( MAKE-9PILE ?auto_357346 ?auto_357347 ?auto_357348 ?auto_357349 ?auto_357350 ?auto_357351 ?auto_357352 ?auto_357353 ?auto_357354 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_357384 - BLOCK
      ?auto_357385 - BLOCK
      ?auto_357386 - BLOCK
      ?auto_357387 - BLOCK
      ?auto_357388 - BLOCK
      ?auto_357389 - BLOCK
      ?auto_357390 - BLOCK
      ?auto_357391 - BLOCK
      ?auto_357392 - BLOCK
    )
    :vars
    (
      ?auto_357393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357392 ?auto_357393 ) ( ON-TABLE ?auto_357384 ) ( ON ?auto_357385 ?auto_357384 ) ( ON ?auto_357386 ?auto_357385 ) ( ON ?auto_357387 ?auto_357386 ) ( not ( = ?auto_357384 ?auto_357385 ) ) ( not ( = ?auto_357384 ?auto_357386 ) ) ( not ( = ?auto_357384 ?auto_357387 ) ) ( not ( = ?auto_357384 ?auto_357388 ) ) ( not ( = ?auto_357384 ?auto_357389 ) ) ( not ( = ?auto_357384 ?auto_357390 ) ) ( not ( = ?auto_357384 ?auto_357391 ) ) ( not ( = ?auto_357384 ?auto_357392 ) ) ( not ( = ?auto_357384 ?auto_357393 ) ) ( not ( = ?auto_357385 ?auto_357386 ) ) ( not ( = ?auto_357385 ?auto_357387 ) ) ( not ( = ?auto_357385 ?auto_357388 ) ) ( not ( = ?auto_357385 ?auto_357389 ) ) ( not ( = ?auto_357385 ?auto_357390 ) ) ( not ( = ?auto_357385 ?auto_357391 ) ) ( not ( = ?auto_357385 ?auto_357392 ) ) ( not ( = ?auto_357385 ?auto_357393 ) ) ( not ( = ?auto_357386 ?auto_357387 ) ) ( not ( = ?auto_357386 ?auto_357388 ) ) ( not ( = ?auto_357386 ?auto_357389 ) ) ( not ( = ?auto_357386 ?auto_357390 ) ) ( not ( = ?auto_357386 ?auto_357391 ) ) ( not ( = ?auto_357386 ?auto_357392 ) ) ( not ( = ?auto_357386 ?auto_357393 ) ) ( not ( = ?auto_357387 ?auto_357388 ) ) ( not ( = ?auto_357387 ?auto_357389 ) ) ( not ( = ?auto_357387 ?auto_357390 ) ) ( not ( = ?auto_357387 ?auto_357391 ) ) ( not ( = ?auto_357387 ?auto_357392 ) ) ( not ( = ?auto_357387 ?auto_357393 ) ) ( not ( = ?auto_357388 ?auto_357389 ) ) ( not ( = ?auto_357388 ?auto_357390 ) ) ( not ( = ?auto_357388 ?auto_357391 ) ) ( not ( = ?auto_357388 ?auto_357392 ) ) ( not ( = ?auto_357388 ?auto_357393 ) ) ( not ( = ?auto_357389 ?auto_357390 ) ) ( not ( = ?auto_357389 ?auto_357391 ) ) ( not ( = ?auto_357389 ?auto_357392 ) ) ( not ( = ?auto_357389 ?auto_357393 ) ) ( not ( = ?auto_357390 ?auto_357391 ) ) ( not ( = ?auto_357390 ?auto_357392 ) ) ( not ( = ?auto_357390 ?auto_357393 ) ) ( not ( = ?auto_357391 ?auto_357392 ) ) ( not ( = ?auto_357391 ?auto_357393 ) ) ( not ( = ?auto_357392 ?auto_357393 ) ) ( ON ?auto_357391 ?auto_357392 ) ( ON ?auto_357390 ?auto_357391 ) ( ON ?auto_357389 ?auto_357390 ) ( CLEAR ?auto_357387 ) ( ON ?auto_357388 ?auto_357389 ) ( CLEAR ?auto_357388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_357384 ?auto_357385 ?auto_357386 ?auto_357387 ?auto_357388 )
      ( MAKE-9PILE ?auto_357384 ?auto_357385 ?auto_357386 ?auto_357387 ?auto_357388 ?auto_357389 ?auto_357390 ?auto_357391 ?auto_357392 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_357422 - BLOCK
      ?auto_357423 - BLOCK
      ?auto_357424 - BLOCK
      ?auto_357425 - BLOCK
      ?auto_357426 - BLOCK
      ?auto_357427 - BLOCK
      ?auto_357428 - BLOCK
      ?auto_357429 - BLOCK
      ?auto_357430 - BLOCK
    )
    :vars
    (
      ?auto_357431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357430 ?auto_357431 ) ( ON-TABLE ?auto_357422 ) ( ON ?auto_357423 ?auto_357422 ) ( ON ?auto_357424 ?auto_357423 ) ( not ( = ?auto_357422 ?auto_357423 ) ) ( not ( = ?auto_357422 ?auto_357424 ) ) ( not ( = ?auto_357422 ?auto_357425 ) ) ( not ( = ?auto_357422 ?auto_357426 ) ) ( not ( = ?auto_357422 ?auto_357427 ) ) ( not ( = ?auto_357422 ?auto_357428 ) ) ( not ( = ?auto_357422 ?auto_357429 ) ) ( not ( = ?auto_357422 ?auto_357430 ) ) ( not ( = ?auto_357422 ?auto_357431 ) ) ( not ( = ?auto_357423 ?auto_357424 ) ) ( not ( = ?auto_357423 ?auto_357425 ) ) ( not ( = ?auto_357423 ?auto_357426 ) ) ( not ( = ?auto_357423 ?auto_357427 ) ) ( not ( = ?auto_357423 ?auto_357428 ) ) ( not ( = ?auto_357423 ?auto_357429 ) ) ( not ( = ?auto_357423 ?auto_357430 ) ) ( not ( = ?auto_357423 ?auto_357431 ) ) ( not ( = ?auto_357424 ?auto_357425 ) ) ( not ( = ?auto_357424 ?auto_357426 ) ) ( not ( = ?auto_357424 ?auto_357427 ) ) ( not ( = ?auto_357424 ?auto_357428 ) ) ( not ( = ?auto_357424 ?auto_357429 ) ) ( not ( = ?auto_357424 ?auto_357430 ) ) ( not ( = ?auto_357424 ?auto_357431 ) ) ( not ( = ?auto_357425 ?auto_357426 ) ) ( not ( = ?auto_357425 ?auto_357427 ) ) ( not ( = ?auto_357425 ?auto_357428 ) ) ( not ( = ?auto_357425 ?auto_357429 ) ) ( not ( = ?auto_357425 ?auto_357430 ) ) ( not ( = ?auto_357425 ?auto_357431 ) ) ( not ( = ?auto_357426 ?auto_357427 ) ) ( not ( = ?auto_357426 ?auto_357428 ) ) ( not ( = ?auto_357426 ?auto_357429 ) ) ( not ( = ?auto_357426 ?auto_357430 ) ) ( not ( = ?auto_357426 ?auto_357431 ) ) ( not ( = ?auto_357427 ?auto_357428 ) ) ( not ( = ?auto_357427 ?auto_357429 ) ) ( not ( = ?auto_357427 ?auto_357430 ) ) ( not ( = ?auto_357427 ?auto_357431 ) ) ( not ( = ?auto_357428 ?auto_357429 ) ) ( not ( = ?auto_357428 ?auto_357430 ) ) ( not ( = ?auto_357428 ?auto_357431 ) ) ( not ( = ?auto_357429 ?auto_357430 ) ) ( not ( = ?auto_357429 ?auto_357431 ) ) ( not ( = ?auto_357430 ?auto_357431 ) ) ( ON ?auto_357429 ?auto_357430 ) ( ON ?auto_357428 ?auto_357429 ) ( ON ?auto_357427 ?auto_357428 ) ( ON ?auto_357426 ?auto_357427 ) ( CLEAR ?auto_357424 ) ( ON ?auto_357425 ?auto_357426 ) ( CLEAR ?auto_357425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_357422 ?auto_357423 ?auto_357424 ?auto_357425 )
      ( MAKE-9PILE ?auto_357422 ?auto_357423 ?auto_357424 ?auto_357425 ?auto_357426 ?auto_357427 ?auto_357428 ?auto_357429 ?auto_357430 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_357460 - BLOCK
      ?auto_357461 - BLOCK
      ?auto_357462 - BLOCK
      ?auto_357463 - BLOCK
      ?auto_357464 - BLOCK
      ?auto_357465 - BLOCK
      ?auto_357466 - BLOCK
      ?auto_357467 - BLOCK
      ?auto_357468 - BLOCK
    )
    :vars
    (
      ?auto_357469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357468 ?auto_357469 ) ( ON-TABLE ?auto_357460 ) ( ON ?auto_357461 ?auto_357460 ) ( not ( = ?auto_357460 ?auto_357461 ) ) ( not ( = ?auto_357460 ?auto_357462 ) ) ( not ( = ?auto_357460 ?auto_357463 ) ) ( not ( = ?auto_357460 ?auto_357464 ) ) ( not ( = ?auto_357460 ?auto_357465 ) ) ( not ( = ?auto_357460 ?auto_357466 ) ) ( not ( = ?auto_357460 ?auto_357467 ) ) ( not ( = ?auto_357460 ?auto_357468 ) ) ( not ( = ?auto_357460 ?auto_357469 ) ) ( not ( = ?auto_357461 ?auto_357462 ) ) ( not ( = ?auto_357461 ?auto_357463 ) ) ( not ( = ?auto_357461 ?auto_357464 ) ) ( not ( = ?auto_357461 ?auto_357465 ) ) ( not ( = ?auto_357461 ?auto_357466 ) ) ( not ( = ?auto_357461 ?auto_357467 ) ) ( not ( = ?auto_357461 ?auto_357468 ) ) ( not ( = ?auto_357461 ?auto_357469 ) ) ( not ( = ?auto_357462 ?auto_357463 ) ) ( not ( = ?auto_357462 ?auto_357464 ) ) ( not ( = ?auto_357462 ?auto_357465 ) ) ( not ( = ?auto_357462 ?auto_357466 ) ) ( not ( = ?auto_357462 ?auto_357467 ) ) ( not ( = ?auto_357462 ?auto_357468 ) ) ( not ( = ?auto_357462 ?auto_357469 ) ) ( not ( = ?auto_357463 ?auto_357464 ) ) ( not ( = ?auto_357463 ?auto_357465 ) ) ( not ( = ?auto_357463 ?auto_357466 ) ) ( not ( = ?auto_357463 ?auto_357467 ) ) ( not ( = ?auto_357463 ?auto_357468 ) ) ( not ( = ?auto_357463 ?auto_357469 ) ) ( not ( = ?auto_357464 ?auto_357465 ) ) ( not ( = ?auto_357464 ?auto_357466 ) ) ( not ( = ?auto_357464 ?auto_357467 ) ) ( not ( = ?auto_357464 ?auto_357468 ) ) ( not ( = ?auto_357464 ?auto_357469 ) ) ( not ( = ?auto_357465 ?auto_357466 ) ) ( not ( = ?auto_357465 ?auto_357467 ) ) ( not ( = ?auto_357465 ?auto_357468 ) ) ( not ( = ?auto_357465 ?auto_357469 ) ) ( not ( = ?auto_357466 ?auto_357467 ) ) ( not ( = ?auto_357466 ?auto_357468 ) ) ( not ( = ?auto_357466 ?auto_357469 ) ) ( not ( = ?auto_357467 ?auto_357468 ) ) ( not ( = ?auto_357467 ?auto_357469 ) ) ( not ( = ?auto_357468 ?auto_357469 ) ) ( ON ?auto_357467 ?auto_357468 ) ( ON ?auto_357466 ?auto_357467 ) ( ON ?auto_357465 ?auto_357466 ) ( ON ?auto_357464 ?auto_357465 ) ( ON ?auto_357463 ?auto_357464 ) ( CLEAR ?auto_357461 ) ( ON ?auto_357462 ?auto_357463 ) ( CLEAR ?auto_357462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_357460 ?auto_357461 ?auto_357462 )
      ( MAKE-9PILE ?auto_357460 ?auto_357461 ?auto_357462 ?auto_357463 ?auto_357464 ?auto_357465 ?auto_357466 ?auto_357467 ?auto_357468 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_357498 - BLOCK
      ?auto_357499 - BLOCK
      ?auto_357500 - BLOCK
      ?auto_357501 - BLOCK
      ?auto_357502 - BLOCK
      ?auto_357503 - BLOCK
      ?auto_357504 - BLOCK
      ?auto_357505 - BLOCK
      ?auto_357506 - BLOCK
    )
    :vars
    (
      ?auto_357507 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357506 ?auto_357507 ) ( ON-TABLE ?auto_357498 ) ( not ( = ?auto_357498 ?auto_357499 ) ) ( not ( = ?auto_357498 ?auto_357500 ) ) ( not ( = ?auto_357498 ?auto_357501 ) ) ( not ( = ?auto_357498 ?auto_357502 ) ) ( not ( = ?auto_357498 ?auto_357503 ) ) ( not ( = ?auto_357498 ?auto_357504 ) ) ( not ( = ?auto_357498 ?auto_357505 ) ) ( not ( = ?auto_357498 ?auto_357506 ) ) ( not ( = ?auto_357498 ?auto_357507 ) ) ( not ( = ?auto_357499 ?auto_357500 ) ) ( not ( = ?auto_357499 ?auto_357501 ) ) ( not ( = ?auto_357499 ?auto_357502 ) ) ( not ( = ?auto_357499 ?auto_357503 ) ) ( not ( = ?auto_357499 ?auto_357504 ) ) ( not ( = ?auto_357499 ?auto_357505 ) ) ( not ( = ?auto_357499 ?auto_357506 ) ) ( not ( = ?auto_357499 ?auto_357507 ) ) ( not ( = ?auto_357500 ?auto_357501 ) ) ( not ( = ?auto_357500 ?auto_357502 ) ) ( not ( = ?auto_357500 ?auto_357503 ) ) ( not ( = ?auto_357500 ?auto_357504 ) ) ( not ( = ?auto_357500 ?auto_357505 ) ) ( not ( = ?auto_357500 ?auto_357506 ) ) ( not ( = ?auto_357500 ?auto_357507 ) ) ( not ( = ?auto_357501 ?auto_357502 ) ) ( not ( = ?auto_357501 ?auto_357503 ) ) ( not ( = ?auto_357501 ?auto_357504 ) ) ( not ( = ?auto_357501 ?auto_357505 ) ) ( not ( = ?auto_357501 ?auto_357506 ) ) ( not ( = ?auto_357501 ?auto_357507 ) ) ( not ( = ?auto_357502 ?auto_357503 ) ) ( not ( = ?auto_357502 ?auto_357504 ) ) ( not ( = ?auto_357502 ?auto_357505 ) ) ( not ( = ?auto_357502 ?auto_357506 ) ) ( not ( = ?auto_357502 ?auto_357507 ) ) ( not ( = ?auto_357503 ?auto_357504 ) ) ( not ( = ?auto_357503 ?auto_357505 ) ) ( not ( = ?auto_357503 ?auto_357506 ) ) ( not ( = ?auto_357503 ?auto_357507 ) ) ( not ( = ?auto_357504 ?auto_357505 ) ) ( not ( = ?auto_357504 ?auto_357506 ) ) ( not ( = ?auto_357504 ?auto_357507 ) ) ( not ( = ?auto_357505 ?auto_357506 ) ) ( not ( = ?auto_357505 ?auto_357507 ) ) ( not ( = ?auto_357506 ?auto_357507 ) ) ( ON ?auto_357505 ?auto_357506 ) ( ON ?auto_357504 ?auto_357505 ) ( ON ?auto_357503 ?auto_357504 ) ( ON ?auto_357502 ?auto_357503 ) ( ON ?auto_357501 ?auto_357502 ) ( ON ?auto_357500 ?auto_357501 ) ( CLEAR ?auto_357498 ) ( ON ?auto_357499 ?auto_357500 ) ( CLEAR ?auto_357499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_357498 ?auto_357499 )
      ( MAKE-9PILE ?auto_357498 ?auto_357499 ?auto_357500 ?auto_357501 ?auto_357502 ?auto_357503 ?auto_357504 ?auto_357505 ?auto_357506 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_357536 - BLOCK
      ?auto_357537 - BLOCK
      ?auto_357538 - BLOCK
      ?auto_357539 - BLOCK
      ?auto_357540 - BLOCK
      ?auto_357541 - BLOCK
      ?auto_357542 - BLOCK
      ?auto_357543 - BLOCK
      ?auto_357544 - BLOCK
    )
    :vars
    (
      ?auto_357545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357544 ?auto_357545 ) ( not ( = ?auto_357536 ?auto_357537 ) ) ( not ( = ?auto_357536 ?auto_357538 ) ) ( not ( = ?auto_357536 ?auto_357539 ) ) ( not ( = ?auto_357536 ?auto_357540 ) ) ( not ( = ?auto_357536 ?auto_357541 ) ) ( not ( = ?auto_357536 ?auto_357542 ) ) ( not ( = ?auto_357536 ?auto_357543 ) ) ( not ( = ?auto_357536 ?auto_357544 ) ) ( not ( = ?auto_357536 ?auto_357545 ) ) ( not ( = ?auto_357537 ?auto_357538 ) ) ( not ( = ?auto_357537 ?auto_357539 ) ) ( not ( = ?auto_357537 ?auto_357540 ) ) ( not ( = ?auto_357537 ?auto_357541 ) ) ( not ( = ?auto_357537 ?auto_357542 ) ) ( not ( = ?auto_357537 ?auto_357543 ) ) ( not ( = ?auto_357537 ?auto_357544 ) ) ( not ( = ?auto_357537 ?auto_357545 ) ) ( not ( = ?auto_357538 ?auto_357539 ) ) ( not ( = ?auto_357538 ?auto_357540 ) ) ( not ( = ?auto_357538 ?auto_357541 ) ) ( not ( = ?auto_357538 ?auto_357542 ) ) ( not ( = ?auto_357538 ?auto_357543 ) ) ( not ( = ?auto_357538 ?auto_357544 ) ) ( not ( = ?auto_357538 ?auto_357545 ) ) ( not ( = ?auto_357539 ?auto_357540 ) ) ( not ( = ?auto_357539 ?auto_357541 ) ) ( not ( = ?auto_357539 ?auto_357542 ) ) ( not ( = ?auto_357539 ?auto_357543 ) ) ( not ( = ?auto_357539 ?auto_357544 ) ) ( not ( = ?auto_357539 ?auto_357545 ) ) ( not ( = ?auto_357540 ?auto_357541 ) ) ( not ( = ?auto_357540 ?auto_357542 ) ) ( not ( = ?auto_357540 ?auto_357543 ) ) ( not ( = ?auto_357540 ?auto_357544 ) ) ( not ( = ?auto_357540 ?auto_357545 ) ) ( not ( = ?auto_357541 ?auto_357542 ) ) ( not ( = ?auto_357541 ?auto_357543 ) ) ( not ( = ?auto_357541 ?auto_357544 ) ) ( not ( = ?auto_357541 ?auto_357545 ) ) ( not ( = ?auto_357542 ?auto_357543 ) ) ( not ( = ?auto_357542 ?auto_357544 ) ) ( not ( = ?auto_357542 ?auto_357545 ) ) ( not ( = ?auto_357543 ?auto_357544 ) ) ( not ( = ?auto_357543 ?auto_357545 ) ) ( not ( = ?auto_357544 ?auto_357545 ) ) ( ON ?auto_357543 ?auto_357544 ) ( ON ?auto_357542 ?auto_357543 ) ( ON ?auto_357541 ?auto_357542 ) ( ON ?auto_357540 ?auto_357541 ) ( ON ?auto_357539 ?auto_357540 ) ( ON ?auto_357538 ?auto_357539 ) ( ON ?auto_357537 ?auto_357538 ) ( ON ?auto_357536 ?auto_357537 ) ( CLEAR ?auto_357536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_357536 )
      ( MAKE-9PILE ?auto_357536 ?auto_357537 ?auto_357538 ?auto_357539 ?auto_357540 ?auto_357541 ?auto_357542 ?auto_357543 ?auto_357544 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_357575 - BLOCK
      ?auto_357576 - BLOCK
      ?auto_357577 - BLOCK
      ?auto_357578 - BLOCK
      ?auto_357579 - BLOCK
      ?auto_357580 - BLOCK
      ?auto_357581 - BLOCK
      ?auto_357582 - BLOCK
      ?auto_357583 - BLOCK
      ?auto_357584 - BLOCK
    )
    :vars
    (
      ?auto_357585 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_357583 ) ( ON ?auto_357584 ?auto_357585 ) ( CLEAR ?auto_357584 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_357575 ) ( ON ?auto_357576 ?auto_357575 ) ( ON ?auto_357577 ?auto_357576 ) ( ON ?auto_357578 ?auto_357577 ) ( ON ?auto_357579 ?auto_357578 ) ( ON ?auto_357580 ?auto_357579 ) ( ON ?auto_357581 ?auto_357580 ) ( ON ?auto_357582 ?auto_357581 ) ( ON ?auto_357583 ?auto_357582 ) ( not ( = ?auto_357575 ?auto_357576 ) ) ( not ( = ?auto_357575 ?auto_357577 ) ) ( not ( = ?auto_357575 ?auto_357578 ) ) ( not ( = ?auto_357575 ?auto_357579 ) ) ( not ( = ?auto_357575 ?auto_357580 ) ) ( not ( = ?auto_357575 ?auto_357581 ) ) ( not ( = ?auto_357575 ?auto_357582 ) ) ( not ( = ?auto_357575 ?auto_357583 ) ) ( not ( = ?auto_357575 ?auto_357584 ) ) ( not ( = ?auto_357575 ?auto_357585 ) ) ( not ( = ?auto_357576 ?auto_357577 ) ) ( not ( = ?auto_357576 ?auto_357578 ) ) ( not ( = ?auto_357576 ?auto_357579 ) ) ( not ( = ?auto_357576 ?auto_357580 ) ) ( not ( = ?auto_357576 ?auto_357581 ) ) ( not ( = ?auto_357576 ?auto_357582 ) ) ( not ( = ?auto_357576 ?auto_357583 ) ) ( not ( = ?auto_357576 ?auto_357584 ) ) ( not ( = ?auto_357576 ?auto_357585 ) ) ( not ( = ?auto_357577 ?auto_357578 ) ) ( not ( = ?auto_357577 ?auto_357579 ) ) ( not ( = ?auto_357577 ?auto_357580 ) ) ( not ( = ?auto_357577 ?auto_357581 ) ) ( not ( = ?auto_357577 ?auto_357582 ) ) ( not ( = ?auto_357577 ?auto_357583 ) ) ( not ( = ?auto_357577 ?auto_357584 ) ) ( not ( = ?auto_357577 ?auto_357585 ) ) ( not ( = ?auto_357578 ?auto_357579 ) ) ( not ( = ?auto_357578 ?auto_357580 ) ) ( not ( = ?auto_357578 ?auto_357581 ) ) ( not ( = ?auto_357578 ?auto_357582 ) ) ( not ( = ?auto_357578 ?auto_357583 ) ) ( not ( = ?auto_357578 ?auto_357584 ) ) ( not ( = ?auto_357578 ?auto_357585 ) ) ( not ( = ?auto_357579 ?auto_357580 ) ) ( not ( = ?auto_357579 ?auto_357581 ) ) ( not ( = ?auto_357579 ?auto_357582 ) ) ( not ( = ?auto_357579 ?auto_357583 ) ) ( not ( = ?auto_357579 ?auto_357584 ) ) ( not ( = ?auto_357579 ?auto_357585 ) ) ( not ( = ?auto_357580 ?auto_357581 ) ) ( not ( = ?auto_357580 ?auto_357582 ) ) ( not ( = ?auto_357580 ?auto_357583 ) ) ( not ( = ?auto_357580 ?auto_357584 ) ) ( not ( = ?auto_357580 ?auto_357585 ) ) ( not ( = ?auto_357581 ?auto_357582 ) ) ( not ( = ?auto_357581 ?auto_357583 ) ) ( not ( = ?auto_357581 ?auto_357584 ) ) ( not ( = ?auto_357581 ?auto_357585 ) ) ( not ( = ?auto_357582 ?auto_357583 ) ) ( not ( = ?auto_357582 ?auto_357584 ) ) ( not ( = ?auto_357582 ?auto_357585 ) ) ( not ( = ?auto_357583 ?auto_357584 ) ) ( not ( = ?auto_357583 ?auto_357585 ) ) ( not ( = ?auto_357584 ?auto_357585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_357584 ?auto_357585 )
      ( !STACK ?auto_357584 ?auto_357583 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_357617 - BLOCK
      ?auto_357618 - BLOCK
      ?auto_357619 - BLOCK
      ?auto_357620 - BLOCK
      ?auto_357621 - BLOCK
      ?auto_357622 - BLOCK
      ?auto_357623 - BLOCK
      ?auto_357624 - BLOCK
      ?auto_357625 - BLOCK
      ?auto_357626 - BLOCK
    )
    :vars
    (
      ?auto_357627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357626 ?auto_357627 ) ( ON-TABLE ?auto_357617 ) ( ON ?auto_357618 ?auto_357617 ) ( ON ?auto_357619 ?auto_357618 ) ( ON ?auto_357620 ?auto_357619 ) ( ON ?auto_357621 ?auto_357620 ) ( ON ?auto_357622 ?auto_357621 ) ( ON ?auto_357623 ?auto_357622 ) ( ON ?auto_357624 ?auto_357623 ) ( not ( = ?auto_357617 ?auto_357618 ) ) ( not ( = ?auto_357617 ?auto_357619 ) ) ( not ( = ?auto_357617 ?auto_357620 ) ) ( not ( = ?auto_357617 ?auto_357621 ) ) ( not ( = ?auto_357617 ?auto_357622 ) ) ( not ( = ?auto_357617 ?auto_357623 ) ) ( not ( = ?auto_357617 ?auto_357624 ) ) ( not ( = ?auto_357617 ?auto_357625 ) ) ( not ( = ?auto_357617 ?auto_357626 ) ) ( not ( = ?auto_357617 ?auto_357627 ) ) ( not ( = ?auto_357618 ?auto_357619 ) ) ( not ( = ?auto_357618 ?auto_357620 ) ) ( not ( = ?auto_357618 ?auto_357621 ) ) ( not ( = ?auto_357618 ?auto_357622 ) ) ( not ( = ?auto_357618 ?auto_357623 ) ) ( not ( = ?auto_357618 ?auto_357624 ) ) ( not ( = ?auto_357618 ?auto_357625 ) ) ( not ( = ?auto_357618 ?auto_357626 ) ) ( not ( = ?auto_357618 ?auto_357627 ) ) ( not ( = ?auto_357619 ?auto_357620 ) ) ( not ( = ?auto_357619 ?auto_357621 ) ) ( not ( = ?auto_357619 ?auto_357622 ) ) ( not ( = ?auto_357619 ?auto_357623 ) ) ( not ( = ?auto_357619 ?auto_357624 ) ) ( not ( = ?auto_357619 ?auto_357625 ) ) ( not ( = ?auto_357619 ?auto_357626 ) ) ( not ( = ?auto_357619 ?auto_357627 ) ) ( not ( = ?auto_357620 ?auto_357621 ) ) ( not ( = ?auto_357620 ?auto_357622 ) ) ( not ( = ?auto_357620 ?auto_357623 ) ) ( not ( = ?auto_357620 ?auto_357624 ) ) ( not ( = ?auto_357620 ?auto_357625 ) ) ( not ( = ?auto_357620 ?auto_357626 ) ) ( not ( = ?auto_357620 ?auto_357627 ) ) ( not ( = ?auto_357621 ?auto_357622 ) ) ( not ( = ?auto_357621 ?auto_357623 ) ) ( not ( = ?auto_357621 ?auto_357624 ) ) ( not ( = ?auto_357621 ?auto_357625 ) ) ( not ( = ?auto_357621 ?auto_357626 ) ) ( not ( = ?auto_357621 ?auto_357627 ) ) ( not ( = ?auto_357622 ?auto_357623 ) ) ( not ( = ?auto_357622 ?auto_357624 ) ) ( not ( = ?auto_357622 ?auto_357625 ) ) ( not ( = ?auto_357622 ?auto_357626 ) ) ( not ( = ?auto_357622 ?auto_357627 ) ) ( not ( = ?auto_357623 ?auto_357624 ) ) ( not ( = ?auto_357623 ?auto_357625 ) ) ( not ( = ?auto_357623 ?auto_357626 ) ) ( not ( = ?auto_357623 ?auto_357627 ) ) ( not ( = ?auto_357624 ?auto_357625 ) ) ( not ( = ?auto_357624 ?auto_357626 ) ) ( not ( = ?auto_357624 ?auto_357627 ) ) ( not ( = ?auto_357625 ?auto_357626 ) ) ( not ( = ?auto_357625 ?auto_357627 ) ) ( not ( = ?auto_357626 ?auto_357627 ) ) ( CLEAR ?auto_357624 ) ( ON ?auto_357625 ?auto_357626 ) ( CLEAR ?auto_357625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_357617 ?auto_357618 ?auto_357619 ?auto_357620 ?auto_357621 ?auto_357622 ?auto_357623 ?auto_357624 ?auto_357625 )
      ( MAKE-10PILE ?auto_357617 ?auto_357618 ?auto_357619 ?auto_357620 ?auto_357621 ?auto_357622 ?auto_357623 ?auto_357624 ?auto_357625 ?auto_357626 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_357659 - BLOCK
      ?auto_357660 - BLOCK
      ?auto_357661 - BLOCK
      ?auto_357662 - BLOCK
      ?auto_357663 - BLOCK
      ?auto_357664 - BLOCK
      ?auto_357665 - BLOCK
      ?auto_357666 - BLOCK
      ?auto_357667 - BLOCK
      ?auto_357668 - BLOCK
    )
    :vars
    (
      ?auto_357669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357668 ?auto_357669 ) ( ON-TABLE ?auto_357659 ) ( ON ?auto_357660 ?auto_357659 ) ( ON ?auto_357661 ?auto_357660 ) ( ON ?auto_357662 ?auto_357661 ) ( ON ?auto_357663 ?auto_357662 ) ( ON ?auto_357664 ?auto_357663 ) ( ON ?auto_357665 ?auto_357664 ) ( not ( = ?auto_357659 ?auto_357660 ) ) ( not ( = ?auto_357659 ?auto_357661 ) ) ( not ( = ?auto_357659 ?auto_357662 ) ) ( not ( = ?auto_357659 ?auto_357663 ) ) ( not ( = ?auto_357659 ?auto_357664 ) ) ( not ( = ?auto_357659 ?auto_357665 ) ) ( not ( = ?auto_357659 ?auto_357666 ) ) ( not ( = ?auto_357659 ?auto_357667 ) ) ( not ( = ?auto_357659 ?auto_357668 ) ) ( not ( = ?auto_357659 ?auto_357669 ) ) ( not ( = ?auto_357660 ?auto_357661 ) ) ( not ( = ?auto_357660 ?auto_357662 ) ) ( not ( = ?auto_357660 ?auto_357663 ) ) ( not ( = ?auto_357660 ?auto_357664 ) ) ( not ( = ?auto_357660 ?auto_357665 ) ) ( not ( = ?auto_357660 ?auto_357666 ) ) ( not ( = ?auto_357660 ?auto_357667 ) ) ( not ( = ?auto_357660 ?auto_357668 ) ) ( not ( = ?auto_357660 ?auto_357669 ) ) ( not ( = ?auto_357661 ?auto_357662 ) ) ( not ( = ?auto_357661 ?auto_357663 ) ) ( not ( = ?auto_357661 ?auto_357664 ) ) ( not ( = ?auto_357661 ?auto_357665 ) ) ( not ( = ?auto_357661 ?auto_357666 ) ) ( not ( = ?auto_357661 ?auto_357667 ) ) ( not ( = ?auto_357661 ?auto_357668 ) ) ( not ( = ?auto_357661 ?auto_357669 ) ) ( not ( = ?auto_357662 ?auto_357663 ) ) ( not ( = ?auto_357662 ?auto_357664 ) ) ( not ( = ?auto_357662 ?auto_357665 ) ) ( not ( = ?auto_357662 ?auto_357666 ) ) ( not ( = ?auto_357662 ?auto_357667 ) ) ( not ( = ?auto_357662 ?auto_357668 ) ) ( not ( = ?auto_357662 ?auto_357669 ) ) ( not ( = ?auto_357663 ?auto_357664 ) ) ( not ( = ?auto_357663 ?auto_357665 ) ) ( not ( = ?auto_357663 ?auto_357666 ) ) ( not ( = ?auto_357663 ?auto_357667 ) ) ( not ( = ?auto_357663 ?auto_357668 ) ) ( not ( = ?auto_357663 ?auto_357669 ) ) ( not ( = ?auto_357664 ?auto_357665 ) ) ( not ( = ?auto_357664 ?auto_357666 ) ) ( not ( = ?auto_357664 ?auto_357667 ) ) ( not ( = ?auto_357664 ?auto_357668 ) ) ( not ( = ?auto_357664 ?auto_357669 ) ) ( not ( = ?auto_357665 ?auto_357666 ) ) ( not ( = ?auto_357665 ?auto_357667 ) ) ( not ( = ?auto_357665 ?auto_357668 ) ) ( not ( = ?auto_357665 ?auto_357669 ) ) ( not ( = ?auto_357666 ?auto_357667 ) ) ( not ( = ?auto_357666 ?auto_357668 ) ) ( not ( = ?auto_357666 ?auto_357669 ) ) ( not ( = ?auto_357667 ?auto_357668 ) ) ( not ( = ?auto_357667 ?auto_357669 ) ) ( not ( = ?auto_357668 ?auto_357669 ) ) ( ON ?auto_357667 ?auto_357668 ) ( CLEAR ?auto_357665 ) ( ON ?auto_357666 ?auto_357667 ) ( CLEAR ?auto_357666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_357659 ?auto_357660 ?auto_357661 ?auto_357662 ?auto_357663 ?auto_357664 ?auto_357665 ?auto_357666 )
      ( MAKE-10PILE ?auto_357659 ?auto_357660 ?auto_357661 ?auto_357662 ?auto_357663 ?auto_357664 ?auto_357665 ?auto_357666 ?auto_357667 ?auto_357668 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_357701 - BLOCK
      ?auto_357702 - BLOCK
      ?auto_357703 - BLOCK
      ?auto_357704 - BLOCK
      ?auto_357705 - BLOCK
      ?auto_357706 - BLOCK
      ?auto_357707 - BLOCK
      ?auto_357708 - BLOCK
      ?auto_357709 - BLOCK
      ?auto_357710 - BLOCK
    )
    :vars
    (
      ?auto_357711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357710 ?auto_357711 ) ( ON-TABLE ?auto_357701 ) ( ON ?auto_357702 ?auto_357701 ) ( ON ?auto_357703 ?auto_357702 ) ( ON ?auto_357704 ?auto_357703 ) ( ON ?auto_357705 ?auto_357704 ) ( ON ?auto_357706 ?auto_357705 ) ( not ( = ?auto_357701 ?auto_357702 ) ) ( not ( = ?auto_357701 ?auto_357703 ) ) ( not ( = ?auto_357701 ?auto_357704 ) ) ( not ( = ?auto_357701 ?auto_357705 ) ) ( not ( = ?auto_357701 ?auto_357706 ) ) ( not ( = ?auto_357701 ?auto_357707 ) ) ( not ( = ?auto_357701 ?auto_357708 ) ) ( not ( = ?auto_357701 ?auto_357709 ) ) ( not ( = ?auto_357701 ?auto_357710 ) ) ( not ( = ?auto_357701 ?auto_357711 ) ) ( not ( = ?auto_357702 ?auto_357703 ) ) ( not ( = ?auto_357702 ?auto_357704 ) ) ( not ( = ?auto_357702 ?auto_357705 ) ) ( not ( = ?auto_357702 ?auto_357706 ) ) ( not ( = ?auto_357702 ?auto_357707 ) ) ( not ( = ?auto_357702 ?auto_357708 ) ) ( not ( = ?auto_357702 ?auto_357709 ) ) ( not ( = ?auto_357702 ?auto_357710 ) ) ( not ( = ?auto_357702 ?auto_357711 ) ) ( not ( = ?auto_357703 ?auto_357704 ) ) ( not ( = ?auto_357703 ?auto_357705 ) ) ( not ( = ?auto_357703 ?auto_357706 ) ) ( not ( = ?auto_357703 ?auto_357707 ) ) ( not ( = ?auto_357703 ?auto_357708 ) ) ( not ( = ?auto_357703 ?auto_357709 ) ) ( not ( = ?auto_357703 ?auto_357710 ) ) ( not ( = ?auto_357703 ?auto_357711 ) ) ( not ( = ?auto_357704 ?auto_357705 ) ) ( not ( = ?auto_357704 ?auto_357706 ) ) ( not ( = ?auto_357704 ?auto_357707 ) ) ( not ( = ?auto_357704 ?auto_357708 ) ) ( not ( = ?auto_357704 ?auto_357709 ) ) ( not ( = ?auto_357704 ?auto_357710 ) ) ( not ( = ?auto_357704 ?auto_357711 ) ) ( not ( = ?auto_357705 ?auto_357706 ) ) ( not ( = ?auto_357705 ?auto_357707 ) ) ( not ( = ?auto_357705 ?auto_357708 ) ) ( not ( = ?auto_357705 ?auto_357709 ) ) ( not ( = ?auto_357705 ?auto_357710 ) ) ( not ( = ?auto_357705 ?auto_357711 ) ) ( not ( = ?auto_357706 ?auto_357707 ) ) ( not ( = ?auto_357706 ?auto_357708 ) ) ( not ( = ?auto_357706 ?auto_357709 ) ) ( not ( = ?auto_357706 ?auto_357710 ) ) ( not ( = ?auto_357706 ?auto_357711 ) ) ( not ( = ?auto_357707 ?auto_357708 ) ) ( not ( = ?auto_357707 ?auto_357709 ) ) ( not ( = ?auto_357707 ?auto_357710 ) ) ( not ( = ?auto_357707 ?auto_357711 ) ) ( not ( = ?auto_357708 ?auto_357709 ) ) ( not ( = ?auto_357708 ?auto_357710 ) ) ( not ( = ?auto_357708 ?auto_357711 ) ) ( not ( = ?auto_357709 ?auto_357710 ) ) ( not ( = ?auto_357709 ?auto_357711 ) ) ( not ( = ?auto_357710 ?auto_357711 ) ) ( ON ?auto_357709 ?auto_357710 ) ( ON ?auto_357708 ?auto_357709 ) ( CLEAR ?auto_357706 ) ( ON ?auto_357707 ?auto_357708 ) ( CLEAR ?auto_357707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_357701 ?auto_357702 ?auto_357703 ?auto_357704 ?auto_357705 ?auto_357706 ?auto_357707 )
      ( MAKE-10PILE ?auto_357701 ?auto_357702 ?auto_357703 ?auto_357704 ?auto_357705 ?auto_357706 ?auto_357707 ?auto_357708 ?auto_357709 ?auto_357710 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_357743 - BLOCK
      ?auto_357744 - BLOCK
      ?auto_357745 - BLOCK
      ?auto_357746 - BLOCK
      ?auto_357747 - BLOCK
      ?auto_357748 - BLOCK
      ?auto_357749 - BLOCK
      ?auto_357750 - BLOCK
      ?auto_357751 - BLOCK
      ?auto_357752 - BLOCK
    )
    :vars
    (
      ?auto_357753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357752 ?auto_357753 ) ( ON-TABLE ?auto_357743 ) ( ON ?auto_357744 ?auto_357743 ) ( ON ?auto_357745 ?auto_357744 ) ( ON ?auto_357746 ?auto_357745 ) ( ON ?auto_357747 ?auto_357746 ) ( not ( = ?auto_357743 ?auto_357744 ) ) ( not ( = ?auto_357743 ?auto_357745 ) ) ( not ( = ?auto_357743 ?auto_357746 ) ) ( not ( = ?auto_357743 ?auto_357747 ) ) ( not ( = ?auto_357743 ?auto_357748 ) ) ( not ( = ?auto_357743 ?auto_357749 ) ) ( not ( = ?auto_357743 ?auto_357750 ) ) ( not ( = ?auto_357743 ?auto_357751 ) ) ( not ( = ?auto_357743 ?auto_357752 ) ) ( not ( = ?auto_357743 ?auto_357753 ) ) ( not ( = ?auto_357744 ?auto_357745 ) ) ( not ( = ?auto_357744 ?auto_357746 ) ) ( not ( = ?auto_357744 ?auto_357747 ) ) ( not ( = ?auto_357744 ?auto_357748 ) ) ( not ( = ?auto_357744 ?auto_357749 ) ) ( not ( = ?auto_357744 ?auto_357750 ) ) ( not ( = ?auto_357744 ?auto_357751 ) ) ( not ( = ?auto_357744 ?auto_357752 ) ) ( not ( = ?auto_357744 ?auto_357753 ) ) ( not ( = ?auto_357745 ?auto_357746 ) ) ( not ( = ?auto_357745 ?auto_357747 ) ) ( not ( = ?auto_357745 ?auto_357748 ) ) ( not ( = ?auto_357745 ?auto_357749 ) ) ( not ( = ?auto_357745 ?auto_357750 ) ) ( not ( = ?auto_357745 ?auto_357751 ) ) ( not ( = ?auto_357745 ?auto_357752 ) ) ( not ( = ?auto_357745 ?auto_357753 ) ) ( not ( = ?auto_357746 ?auto_357747 ) ) ( not ( = ?auto_357746 ?auto_357748 ) ) ( not ( = ?auto_357746 ?auto_357749 ) ) ( not ( = ?auto_357746 ?auto_357750 ) ) ( not ( = ?auto_357746 ?auto_357751 ) ) ( not ( = ?auto_357746 ?auto_357752 ) ) ( not ( = ?auto_357746 ?auto_357753 ) ) ( not ( = ?auto_357747 ?auto_357748 ) ) ( not ( = ?auto_357747 ?auto_357749 ) ) ( not ( = ?auto_357747 ?auto_357750 ) ) ( not ( = ?auto_357747 ?auto_357751 ) ) ( not ( = ?auto_357747 ?auto_357752 ) ) ( not ( = ?auto_357747 ?auto_357753 ) ) ( not ( = ?auto_357748 ?auto_357749 ) ) ( not ( = ?auto_357748 ?auto_357750 ) ) ( not ( = ?auto_357748 ?auto_357751 ) ) ( not ( = ?auto_357748 ?auto_357752 ) ) ( not ( = ?auto_357748 ?auto_357753 ) ) ( not ( = ?auto_357749 ?auto_357750 ) ) ( not ( = ?auto_357749 ?auto_357751 ) ) ( not ( = ?auto_357749 ?auto_357752 ) ) ( not ( = ?auto_357749 ?auto_357753 ) ) ( not ( = ?auto_357750 ?auto_357751 ) ) ( not ( = ?auto_357750 ?auto_357752 ) ) ( not ( = ?auto_357750 ?auto_357753 ) ) ( not ( = ?auto_357751 ?auto_357752 ) ) ( not ( = ?auto_357751 ?auto_357753 ) ) ( not ( = ?auto_357752 ?auto_357753 ) ) ( ON ?auto_357751 ?auto_357752 ) ( ON ?auto_357750 ?auto_357751 ) ( ON ?auto_357749 ?auto_357750 ) ( CLEAR ?auto_357747 ) ( ON ?auto_357748 ?auto_357749 ) ( CLEAR ?auto_357748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_357743 ?auto_357744 ?auto_357745 ?auto_357746 ?auto_357747 ?auto_357748 )
      ( MAKE-10PILE ?auto_357743 ?auto_357744 ?auto_357745 ?auto_357746 ?auto_357747 ?auto_357748 ?auto_357749 ?auto_357750 ?auto_357751 ?auto_357752 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_357785 - BLOCK
      ?auto_357786 - BLOCK
      ?auto_357787 - BLOCK
      ?auto_357788 - BLOCK
      ?auto_357789 - BLOCK
      ?auto_357790 - BLOCK
      ?auto_357791 - BLOCK
      ?auto_357792 - BLOCK
      ?auto_357793 - BLOCK
      ?auto_357794 - BLOCK
    )
    :vars
    (
      ?auto_357795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357794 ?auto_357795 ) ( ON-TABLE ?auto_357785 ) ( ON ?auto_357786 ?auto_357785 ) ( ON ?auto_357787 ?auto_357786 ) ( ON ?auto_357788 ?auto_357787 ) ( not ( = ?auto_357785 ?auto_357786 ) ) ( not ( = ?auto_357785 ?auto_357787 ) ) ( not ( = ?auto_357785 ?auto_357788 ) ) ( not ( = ?auto_357785 ?auto_357789 ) ) ( not ( = ?auto_357785 ?auto_357790 ) ) ( not ( = ?auto_357785 ?auto_357791 ) ) ( not ( = ?auto_357785 ?auto_357792 ) ) ( not ( = ?auto_357785 ?auto_357793 ) ) ( not ( = ?auto_357785 ?auto_357794 ) ) ( not ( = ?auto_357785 ?auto_357795 ) ) ( not ( = ?auto_357786 ?auto_357787 ) ) ( not ( = ?auto_357786 ?auto_357788 ) ) ( not ( = ?auto_357786 ?auto_357789 ) ) ( not ( = ?auto_357786 ?auto_357790 ) ) ( not ( = ?auto_357786 ?auto_357791 ) ) ( not ( = ?auto_357786 ?auto_357792 ) ) ( not ( = ?auto_357786 ?auto_357793 ) ) ( not ( = ?auto_357786 ?auto_357794 ) ) ( not ( = ?auto_357786 ?auto_357795 ) ) ( not ( = ?auto_357787 ?auto_357788 ) ) ( not ( = ?auto_357787 ?auto_357789 ) ) ( not ( = ?auto_357787 ?auto_357790 ) ) ( not ( = ?auto_357787 ?auto_357791 ) ) ( not ( = ?auto_357787 ?auto_357792 ) ) ( not ( = ?auto_357787 ?auto_357793 ) ) ( not ( = ?auto_357787 ?auto_357794 ) ) ( not ( = ?auto_357787 ?auto_357795 ) ) ( not ( = ?auto_357788 ?auto_357789 ) ) ( not ( = ?auto_357788 ?auto_357790 ) ) ( not ( = ?auto_357788 ?auto_357791 ) ) ( not ( = ?auto_357788 ?auto_357792 ) ) ( not ( = ?auto_357788 ?auto_357793 ) ) ( not ( = ?auto_357788 ?auto_357794 ) ) ( not ( = ?auto_357788 ?auto_357795 ) ) ( not ( = ?auto_357789 ?auto_357790 ) ) ( not ( = ?auto_357789 ?auto_357791 ) ) ( not ( = ?auto_357789 ?auto_357792 ) ) ( not ( = ?auto_357789 ?auto_357793 ) ) ( not ( = ?auto_357789 ?auto_357794 ) ) ( not ( = ?auto_357789 ?auto_357795 ) ) ( not ( = ?auto_357790 ?auto_357791 ) ) ( not ( = ?auto_357790 ?auto_357792 ) ) ( not ( = ?auto_357790 ?auto_357793 ) ) ( not ( = ?auto_357790 ?auto_357794 ) ) ( not ( = ?auto_357790 ?auto_357795 ) ) ( not ( = ?auto_357791 ?auto_357792 ) ) ( not ( = ?auto_357791 ?auto_357793 ) ) ( not ( = ?auto_357791 ?auto_357794 ) ) ( not ( = ?auto_357791 ?auto_357795 ) ) ( not ( = ?auto_357792 ?auto_357793 ) ) ( not ( = ?auto_357792 ?auto_357794 ) ) ( not ( = ?auto_357792 ?auto_357795 ) ) ( not ( = ?auto_357793 ?auto_357794 ) ) ( not ( = ?auto_357793 ?auto_357795 ) ) ( not ( = ?auto_357794 ?auto_357795 ) ) ( ON ?auto_357793 ?auto_357794 ) ( ON ?auto_357792 ?auto_357793 ) ( ON ?auto_357791 ?auto_357792 ) ( ON ?auto_357790 ?auto_357791 ) ( CLEAR ?auto_357788 ) ( ON ?auto_357789 ?auto_357790 ) ( CLEAR ?auto_357789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_357785 ?auto_357786 ?auto_357787 ?auto_357788 ?auto_357789 )
      ( MAKE-10PILE ?auto_357785 ?auto_357786 ?auto_357787 ?auto_357788 ?auto_357789 ?auto_357790 ?auto_357791 ?auto_357792 ?auto_357793 ?auto_357794 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_357827 - BLOCK
      ?auto_357828 - BLOCK
      ?auto_357829 - BLOCK
      ?auto_357830 - BLOCK
      ?auto_357831 - BLOCK
      ?auto_357832 - BLOCK
      ?auto_357833 - BLOCK
      ?auto_357834 - BLOCK
      ?auto_357835 - BLOCK
      ?auto_357836 - BLOCK
    )
    :vars
    (
      ?auto_357837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357836 ?auto_357837 ) ( ON-TABLE ?auto_357827 ) ( ON ?auto_357828 ?auto_357827 ) ( ON ?auto_357829 ?auto_357828 ) ( not ( = ?auto_357827 ?auto_357828 ) ) ( not ( = ?auto_357827 ?auto_357829 ) ) ( not ( = ?auto_357827 ?auto_357830 ) ) ( not ( = ?auto_357827 ?auto_357831 ) ) ( not ( = ?auto_357827 ?auto_357832 ) ) ( not ( = ?auto_357827 ?auto_357833 ) ) ( not ( = ?auto_357827 ?auto_357834 ) ) ( not ( = ?auto_357827 ?auto_357835 ) ) ( not ( = ?auto_357827 ?auto_357836 ) ) ( not ( = ?auto_357827 ?auto_357837 ) ) ( not ( = ?auto_357828 ?auto_357829 ) ) ( not ( = ?auto_357828 ?auto_357830 ) ) ( not ( = ?auto_357828 ?auto_357831 ) ) ( not ( = ?auto_357828 ?auto_357832 ) ) ( not ( = ?auto_357828 ?auto_357833 ) ) ( not ( = ?auto_357828 ?auto_357834 ) ) ( not ( = ?auto_357828 ?auto_357835 ) ) ( not ( = ?auto_357828 ?auto_357836 ) ) ( not ( = ?auto_357828 ?auto_357837 ) ) ( not ( = ?auto_357829 ?auto_357830 ) ) ( not ( = ?auto_357829 ?auto_357831 ) ) ( not ( = ?auto_357829 ?auto_357832 ) ) ( not ( = ?auto_357829 ?auto_357833 ) ) ( not ( = ?auto_357829 ?auto_357834 ) ) ( not ( = ?auto_357829 ?auto_357835 ) ) ( not ( = ?auto_357829 ?auto_357836 ) ) ( not ( = ?auto_357829 ?auto_357837 ) ) ( not ( = ?auto_357830 ?auto_357831 ) ) ( not ( = ?auto_357830 ?auto_357832 ) ) ( not ( = ?auto_357830 ?auto_357833 ) ) ( not ( = ?auto_357830 ?auto_357834 ) ) ( not ( = ?auto_357830 ?auto_357835 ) ) ( not ( = ?auto_357830 ?auto_357836 ) ) ( not ( = ?auto_357830 ?auto_357837 ) ) ( not ( = ?auto_357831 ?auto_357832 ) ) ( not ( = ?auto_357831 ?auto_357833 ) ) ( not ( = ?auto_357831 ?auto_357834 ) ) ( not ( = ?auto_357831 ?auto_357835 ) ) ( not ( = ?auto_357831 ?auto_357836 ) ) ( not ( = ?auto_357831 ?auto_357837 ) ) ( not ( = ?auto_357832 ?auto_357833 ) ) ( not ( = ?auto_357832 ?auto_357834 ) ) ( not ( = ?auto_357832 ?auto_357835 ) ) ( not ( = ?auto_357832 ?auto_357836 ) ) ( not ( = ?auto_357832 ?auto_357837 ) ) ( not ( = ?auto_357833 ?auto_357834 ) ) ( not ( = ?auto_357833 ?auto_357835 ) ) ( not ( = ?auto_357833 ?auto_357836 ) ) ( not ( = ?auto_357833 ?auto_357837 ) ) ( not ( = ?auto_357834 ?auto_357835 ) ) ( not ( = ?auto_357834 ?auto_357836 ) ) ( not ( = ?auto_357834 ?auto_357837 ) ) ( not ( = ?auto_357835 ?auto_357836 ) ) ( not ( = ?auto_357835 ?auto_357837 ) ) ( not ( = ?auto_357836 ?auto_357837 ) ) ( ON ?auto_357835 ?auto_357836 ) ( ON ?auto_357834 ?auto_357835 ) ( ON ?auto_357833 ?auto_357834 ) ( ON ?auto_357832 ?auto_357833 ) ( ON ?auto_357831 ?auto_357832 ) ( CLEAR ?auto_357829 ) ( ON ?auto_357830 ?auto_357831 ) ( CLEAR ?auto_357830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_357827 ?auto_357828 ?auto_357829 ?auto_357830 )
      ( MAKE-10PILE ?auto_357827 ?auto_357828 ?auto_357829 ?auto_357830 ?auto_357831 ?auto_357832 ?auto_357833 ?auto_357834 ?auto_357835 ?auto_357836 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_357869 - BLOCK
      ?auto_357870 - BLOCK
      ?auto_357871 - BLOCK
      ?auto_357872 - BLOCK
      ?auto_357873 - BLOCK
      ?auto_357874 - BLOCK
      ?auto_357875 - BLOCK
      ?auto_357876 - BLOCK
      ?auto_357877 - BLOCK
      ?auto_357878 - BLOCK
    )
    :vars
    (
      ?auto_357879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357878 ?auto_357879 ) ( ON-TABLE ?auto_357869 ) ( ON ?auto_357870 ?auto_357869 ) ( not ( = ?auto_357869 ?auto_357870 ) ) ( not ( = ?auto_357869 ?auto_357871 ) ) ( not ( = ?auto_357869 ?auto_357872 ) ) ( not ( = ?auto_357869 ?auto_357873 ) ) ( not ( = ?auto_357869 ?auto_357874 ) ) ( not ( = ?auto_357869 ?auto_357875 ) ) ( not ( = ?auto_357869 ?auto_357876 ) ) ( not ( = ?auto_357869 ?auto_357877 ) ) ( not ( = ?auto_357869 ?auto_357878 ) ) ( not ( = ?auto_357869 ?auto_357879 ) ) ( not ( = ?auto_357870 ?auto_357871 ) ) ( not ( = ?auto_357870 ?auto_357872 ) ) ( not ( = ?auto_357870 ?auto_357873 ) ) ( not ( = ?auto_357870 ?auto_357874 ) ) ( not ( = ?auto_357870 ?auto_357875 ) ) ( not ( = ?auto_357870 ?auto_357876 ) ) ( not ( = ?auto_357870 ?auto_357877 ) ) ( not ( = ?auto_357870 ?auto_357878 ) ) ( not ( = ?auto_357870 ?auto_357879 ) ) ( not ( = ?auto_357871 ?auto_357872 ) ) ( not ( = ?auto_357871 ?auto_357873 ) ) ( not ( = ?auto_357871 ?auto_357874 ) ) ( not ( = ?auto_357871 ?auto_357875 ) ) ( not ( = ?auto_357871 ?auto_357876 ) ) ( not ( = ?auto_357871 ?auto_357877 ) ) ( not ( = ?auto_357871 ?auto_357878 ) ) ( not ( = ?auto_357871 ?auto_357879 ) ) ( not ( = ?auto_357872 ?auto_357873 ) ) ( not ( = ?auto_357872 ?auto_357874 ) ) ( not ( = ?auto_357872 ?auto_357875 ) ) ( not ( = ?auto_357872 ?auto_357876 ) ) ( not ( = ?auto_357872 ?auto_357877 ) ) ( not ( = ?auto_357872 ?auto_357878 ) ) ( not ( = ?auto_357872 ?auto_357879 ) ) ( not ( = ?auto_357873 ?auto_357874 ) ) ( not ( = ?auto_357873 ?auto_357875 ) ) ( not ( = ?auto_357873 ?auto_357876 ) ) ( not ( = ?auto_357873 ?auto_357877 ) ) ( not ( = ?auto_357873 ?auto_357878 ) ) ( not ( = ?auto_357873 ?auto_357879 ) ) ( not ( = ?auto_357874 ?auto_357875 ) ) ( not ( = ?auto_357874 ?auto_357876 ) ) ( not ( = ?auto_357874 ?auto_357877 ) ) ( not ( = ?auto_357874 ?auto_357878 ) ) ( not ( = ?auto_357874 ?auto_357879 ) ) ( not ( = ?auto_357875 ?auto_357876 ) ) ( not ( = ?auto_357875 ?auto_357877 ) ) ( not ( = ?auto_357875 ?auto_357878 ) ) ( not ( = ?auto_357875 ?auto_357879 ) ) ( not ( = ?auto_357876 ?auto_357877 ) ) ( not ( = ?auto_357876 ?auto_357878 ) ) ( not ( = ?auto_357876 ?auto_357879 ) ) ( not ( = ?auto_357877 ?auto_357878 ) ) ( not ( = ?auto_357877 ?auto_357879 ) ) ( not ( = ?auto_357878 ?auto_357879 ) ) ( ON ?auto_357877 ?auto_357878 ) ( ON ?auto_357876 ?auto_357877 ) ( ON ?auto_357875 ?auto_357876 ) ( ON ?auto_357874 ?auto_357875 ) ( ON ?auto_357873 ?auto_357874 ) ( ON ?auto_357872 ?auto_357873 ) ( CLEAR ?auto_357870 ) ( ON ?auto_357871 ?auto_357872 ) ( CLEAR ?auto_357871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_357869 ?auto_357870 ?auto_357871 )
      ( MAKE-10PILE ?auto_357869 ?auto_357870 ?auto_357871 ?auto_357872 ?auto_357873 ?auto_357874 ?auto_357875 ?auto_357876 ?auto_357877 ?auto_357878 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_357911 - BLOCK
      ?auto_357912 - BLOCK
      ?auto_357913 - BLOCK
      ?auto_357914 - BLOCK
      ?auto_357915 - BLOCK
      ?auto_357916 - BLOCK
      ?auto_357917 - BLOCK
      ?auto_357918 - BLOCK
      ?auto_357919 - BLOCK
      ?auto_357920 - BLOCK
    )
    :vars
    (
      ?auto_357921 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357920 ?auto_357921 ) ( ON-TABLE ?auto_357911 ) ( not ( = ?auto_357911 ?auto_357912 ) ) ( not ( = ?auto_357911 ?auto_357913 ) ) ( not ( = ?auto_357911 ?auto_357914 ) ) ( not ( = ?auto_357911 ?auto_357915 ) ) ( not ( = ?auto_357911 ?auto_357916 ) ) ( not ( = ?auto_357911 ?auto_357917 ) ) ( not ( = ?auto_357911 ?auto_357918 ) ) ( not ( = ?auto_357911 ?auto_357919 ) ) ( not ( = ?auto_357911 ?auto_357920 ) ) ( not ( = ?auto_357911 ?auto_357921 ) ) ( not ( = ?auto_357912 ?auto_357913 ) ) ( not ( = ?auto_357912 ?auto_357914 ) ) ( not ( = ?auto_357912 ?auto_357915 ) ) ( not ( = ?auto_357912 ?auto_357916 ) ) ( not ( = ?auto_357912 ?auto_357917 ) ) ( not ( = ?auto_357912 ?auto_357918 ) ) ( not ( = ?auto_357912 ?auto_357919 ) ) ( not ( = ?auto_357912 ?auto_357920 ) ) ( not ( = ?auto_357912 ?auto_357921 ) ) ( not ( = ?auto_357913 ?auto_357914 ) ) ( not ( = ?auto_357913 ?auto_357915 ) ) ( not ( = ?auto_357913 ?auto_357916 ) ) ( not ( = ?auto_357913 ?auto_357917 ) ) ( not ( = ?auto_357913 ?auto_357918 ) ) ( not ( = ?auto_357913 ?auto_357919 ) ) ( not ( = ?auto_357913 ?auto_357920 ) ) ( not ( = ?auto_357913 ?auto_357921 ) ) ( not ( = ?auto_357914 ?auto_357915 ) ) ( not ( = ?auto_357914 ?auto_357916 ) ) ( not ( = ?auto_357914 ?auto_357917 ) ) ( not ( = ?auto_357914 ?auto_357918 ) ) ( not ( = ?auto_357914 ?auto_357919 ) ) ( not ( = ?auto_357914 ?auto_357920 ) ) ( not ( = ?auto_357914 ?auto_357921 ) ) ( not ( = ?auto_357915 ?auto_357916 ) ) ( not ( = ?auto_357915 ?auto_357917 ) ) ( not ( = ?auto_357915 ?auto_357918 ) ) ( not ( = ?auto_357915 ?auto_357919 ) ) ( not ( = ?auto_357915 ?auto_357920 ) ) ( not ( = ?auto_357915 ?auto_357921 ) ) ( not ( = ?auto_357916 ?auto_357917 ) ) ( not ( = ?auto_357916 ?auto_357918 ) ) ( not ( = ?auto_357916 ?auto_357919 ) ) ( not ( = ?auto_357916 ?auto_357920 ) ) ( not ( = ?auto_357916 ?auto_357921 ) ) ( not ( = ?auto_357917 ?auto_357918 ) ) ( not ( = ?auto_357917 ?auto_357919 ) ) ( not ( = ?auto_357917 ?auto_357920 ) ) ( not ( = ?auto_357917 ?auto_357921 ) ) ( not ( = ?auto_357918 ?auto_357919 ) ) ( not ( = ?auto_357918 ?auto_357920 ) ) ( not ( = ?auto_357918 ?auto_357921 ) ) ( not ( = ?auto_357919 ?auto_357920 ) ) ( not ( = ?auto_357919 ?auto_357921 ) ) ( not ( = ?auto_357920 ?auto_357921 ) ) ( ON ?auto_357919 ?auto_357920 ) ( ON ?auto_357918 ?auto_357919 ) ( ON ?auto_357917 ?auto_357918 ) ( ON ?auto_357916 ?auto_357917 ) ( ON ?auto_357915 ?auto_357916 ) ( ON ?auto_357914 ?auto_357915 ) ( ON ?auto_357913 ?auto_357914 ) ( CLEAR ?auto_357911 ) ( ON ?auto_357912 ?auto_357913 ) ( CLEAR ?auto_357912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_357911 ?auto_357912 )
      ( MAKE-10PILE ?auto_357911 ?auto_357912 ?auto_357913 ?auto_357914 ?auto_357915 ?auto_357916 ?auto_357917 ?auto_357918 ?auto_357919 ?auto_357920 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_357953 - BLOCK
      ?auto_357954 - BLOCK
      ?auto_357955 - BLOCK
      ?auto_357956 - BLOCK
      ?auto_357957 - BLOCK
      ?auto_357958 - BLOCK
      ?auto_357959 - BLOCK
      ?auto_357960 - BLOCK
      ?auto_357961 - BLOCK
      ?auto_357962 - BLOCK
    )
    :vars
    (
      ?auto_357963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_357962 ?auto_357963 ) ( not ( = ?auto_357953 ?auto_357954 ) ) ( not ( = ?auto_357953 ?auto_357955 ) ) ( not ( = ?auto_357953 ?auto_357956 ) ) ( not ( = ?auto_357953 ?auto_357957 ) ) ( not ( = ?auto_357953 ?auto_357958 ) ) ( not ( = ?auto_357953 ?auto_357959 ) ) ( not ( = ?auto_357953 ?auto_357960 ) ) ( not ( = ?auto_357953 ?auto_357961 ) ) ( not ( = ?auto_357953 ?auto_357962 ) ) ( not ( = ?auto_357953 ?auto_357963 ) ) ( not ( = ?auto_357954 ?auto_357955 ) ) ( not ( = ?auto_357954 ?auto_357956 ) ) ( not ( = ?auto_357954 ?auto_357957 ) ) ( not ( = ?auto_357954 ?auto_357958 ) ) ( not ( = ?auto_357954 ?auto_357959 ) ) ( not ( = ?auto_357954 ?auto_357960 ) ) ( not ( = ?auto_357954 ?auto_357961 ) ) ( not ( = ?auto_357954 ?auto_357962 ) ) ( not ( = ?auto_357954 ?auto_357963 ) ) ( not ( = ?auto_357955 ?auto_357956 ) ) ( not ( = ?auto_357955 ?auto_357957 ) ) ( not ( = ?auto_357955 ?auto_357958 ) ) ( not ( = ?auto_357955 ?auto_357959 ) ) ( not ( = ?auto_357955 ?auto_357960 ) ) ( not ( = ?auto_357955 ?auto_357961 ) ) ( not ( = ?auto_357955 ?auto_357962 ) ) ( not ( = ?auto_357955 ?auto_357963 ) ) ( not ( = ?auto_357956 ?auto_357957 ) ) ( not ( = ?auto_357956 ?auto_357958 ) ) ( not ( = ?auto_357956 ?auto_357959 ) ) ( not ( = ?auto_357956 ?auto_357960 ) ) ( not ( = ?auto_357956 ?auto_357961 ) ) ( not ( = ?auto_357956 ?auto_357962 ) ) ( not ( = ?auto_357956 ?auto_357963 ) ) ( not ( = ?auto_357957 ?auto_357958 ) ) ( not ( = ?auto_357957 ?auto_357959 ) ) ( not ( = ?auto_357957 ?auto_357960 ) ) ( not ( = ?auto_357957 ?auto_357961 ) ) ( not ( = ?auto_357957 ?auto_357962 ) ) ( not ( = ?auto_357957 ?auto_357963 ) ) ( not ( = ?auto_357958 ?auto_357959 ) ) ( not ( = ?auto_357958 ?auto_357960 ) ) ( not ( = ?auto_357958 ?auto_357961 ) ) ( not ( = ?auto_357958 ?auto_357962 ) ) ( not ( = ?auto_357958 ?auto_357963 ) ) ( not ( = ?auto_357959 ?auto_357960 ) ) ( not ( = ?auto_357959 ?auto_357961 ) ) ( not ( = ?auto_357959 ?auto_357962 ) ) ( not ( = ?auto_357959 ?auto_357963 ) ) ( not ( = ?auto_357960 ?auto_357961 ) ) ( not ( = ?auto_357960 ?auto_357962 ) ) ( not ( = ?auto_357960 ?auto_357963 ) ) ( not ( = ?auto_357961 ?auto_357962 ) ) ( not ( = ?auto_357961 ?auto_357963 ) ) ( not ( = ?auto_357962 ?auto_357963 ) ) ( ON ?auto_357961 ?auto_357962 ) ( ON ?auto_357960 ?auto_357961 ) ( ON ?auto_357959 ?auto_357960 ) ( ON ?auto_357958 ?auto_357959 ) ( ON ?auto_357957 ?auto_357958 ) ( ON ?auto_357956 ?auto_357957 ) ( ON ?auto_357955 ?auto_357956 ) ( ON ?auto_357954 ?auto_357955 ) ( ON ?auto_357953 ?auto_357954 ) ( CLEAR ?auto_357953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_357953 )
      ( MAKE-10PILE ?auto_357953 ?auto_357954 ?auto_357955 ?auto_357956 ?auto_357957 ?auto_357958 ?auto_357959 ?auto_357960 ?auto_357961 ?auto_357962 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_357996 - BLOCK
      ?auto_357997 - BLOCK
      ?auto_357998 - BLOCK
      ?auto_357999 - BLOCK
      ?auto_358000 - BLOCK
      ?auto_358001 - BLOCK
      ?auto_358002 - BLOCK
      ?auto_358003 - BLOCK
      ?auto_358004 - BLOCK
      ?auto_358005 - BLOCK
      ?auto_358006 - BLOCK
    )
    :vars
    (
      ?auto_358007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_358005 ) ( ON ?auto_358006 ?auto_358007 ) ( CLEAR ?auto_358006 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_357996 ) ( ON ?auto_357997 ?auto_357996 ) ( ON ?auto_357998 ?auto_357997 ) ( ON ?auto_357999 ?auto_357998 ) ( ON ?auto_358000 ?auto_357999 ) ( ON ?auto_358001 ?auto_358000 ) ( ON ?auto_358002 ?auto_358001 ) ( ON ?auto_358003 ?auto_358002 ) ( ON ?auto_358004 ?auto_358003 ) ( ON ?auto_358005 ?auto_358004 ) ( not ( = ?auto_357996 ?auto_357997 ) ) ( not ( = ?auto_357996 ?auto_357998 ) ) ( not ( = ?auto_357996 ?auto_357999 ) ) ( not ( = ?auto_357996 ?auto_358000 ) ) ( not ( = ?auto_357996 ?auto_358001 ) ) ( not ( = ?auto_357996 ?auto_358002 ) ) ( not ( = ?auto_357996 ?auto_358003 ) ) ( not ( = ?auto_357996 ?auto_358004 ) ) ( not ( = ?auto_357996 ?auto_358005 ) ) ( not ( = ?auto_357996 ?auto_358006 ) ) ( not ( = ?auto_357996 ?auto_358007 ) ) ( not ( = ?auto_357997 ?auto_357998 ) ) ( not ( = ?auto_357997 ?auto_357999 ) ) ( not ( = ?auto_357997 ?auto_358000 ) ) ( not ( = ?auto_357997 ?auto_358001 ) ) ( not ( = ?auto_357997 ?auto_358002 ) ) ( not ( = ?auto_357997 ?auto_358003 ) ) ( not ( = ?auto_357997 ?auto_358004 ) ) ( not ( = ?auto_357997 ?auto_358005 ) ) ( not ( = ?auto_357997 ?auto_358006 ) ) ( not ( = ?auto_357997 ?auto_358007 ) ) ( not ( = ?auto_357998 ?auto_357999 ) ) ( not ( = ?auto_357998 ?auto_358000 ) ) ( not ( = ?auto_357998 ?auto_358001 ) ) ( not ( = ?auto_357998 ?auto_358002 ) ) ( not ( = ?auto_357998 ?auto_358003 ) ) ( not ( = ?auto_357998 ?auto_358004 ) ) ( not ( = ?auto_357998 ?auto_358005 ) ) ( not ( = ?auto_357998 ?auto_358006 ) ) ( not ( = ?auto_357998 ?auto_358007 ) ) ( not ( = ?auto_357999 ?auto_358000 ) ) ( not ( = ?auto_357999 ?auto_358001 ) ) ( not ( = ?auto_357999 ?auto_358002 ) ) ( not ( = ?auto_357999 ?auto_358003 ) ) ( not ( = ?auto_357999 ?auto_358004 ) ) ( not ( = ?auto_357999 ?auto_358005 ) ) ( not ( = ?auto_357999 ?auto_358006 ) ) ( not ( = ?auto_357999 ?auto_358007 ) ) ( not ( = ?auto_358000 ?auto_358001 ) ) ( not ( = ?auto_358000 ?auto_358002 ) ) ( not ( = ?auto_358000 ?auto_358003 ) ) ( not ( = ?auto_358000 ?auto_358004 ) ) ( not ( = ?auto_358000 ?auto_358005 ) ) ( not ( = ?auto_358000 ?auto_358006 ) ) ( not ( = ?auto_358000 ?auto_358007 ) ) ( not ( = ?auto_358001 ?auto_358002 ) ) ( not ( = ?auto_358001 ?auto_358003 ) ) ( not ( = ?auto_358001 ?auto_358004 ) ) ( not ( = ?auto_358001 ?auto_358005 ) ) ( not ( = ?auto_358001 ?auto_358006 ) ) ( not ( = ?auto_358001 ?auto_358007 ) ) ( not ( = ?auto_358002 ?auto_358003 ) ) ( not ( = ?auto_358002 ?auto_358004 ) ) ( not ( = ?auto_358002 ?auto_358005 ) ) ( not ( = ?auto_358002 ?auto_358006 ) ) ( not ( = ?auto_358002 ?auto_358007 ) ) ( not ( = ?auto_358003 ?auto_358004 ) ) ( not ( = ?auto_358003 ?auto_358005 ) ) ( not ( = ?auto_358003 ?auto_358006 ) ) ( not ( = ?auto_358003 ?auto_358007 ) ) ( not ( = ?auto_358004 ?auto_358005 ) ) ( not ( = ?auto_358004 ?auto_358006 ) ) ( not ( = ?auto_358004 ?auto_358007 ) ) ( not ( = ?auto_358005 ?auto_358006 ) ) ( not ( = ?auto_358005 ?auto_358007 ) ) ( not ( = ?auto_358006 ?auto_358007 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_358006 ?auto_358007 )
      ( !STACK ?auto_358006 ?auto_358005 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_358042 - BLOCK
      ?auto_358043 - BLOCK
      ?auto_358044 - BLOCK
      ?auto_358045 - BLOCK
      ?auto_358046 - BLOCK
      ?auto_358047 - BLOCK
      ?auto_358048 - BLOCK
      ?auto_358049 - BLOCK
      ?auto_358050 - BLOCK
      ?auto_358051 - BLOCK
      ?auto_358052 - BLOCK
    )
    :vars
    (
      ?auto_358053 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358052 ?auto_358053 ) ( ON-TABLE ?auto_358042 ) ( ON ?auto_358043 ?auto_358042 ) ( ON ?auto_358044 ?auto_358043 ) ( ON ?auto_358045 ?auto_358044 ) ( ON ?auto_358046 ?auto_358045 ) ( ON ?auto_358047 ?auto_358046 ) ( ON ?auto_358048 ?auto_358047 ) ( ON ?auto_358049 ?auto_358048 ) ( ON ?auto_358050 ?auto_358049 ) ( not ( = ?auto_358042 ?auto_358043 ) ) ( not ( = ?auto_358042 ?auto_358044 ) ) ( not ( = ?auto_358042 ?auto_358045 ) ) ( not ( = ?auto_358042 ?auto_358046 ) ) ( not ( = ?auto_358042 ?auto_358047 ) ) ( not ( = ?auto_358042 ?auto_358048 ) ) ( not ( = ?auto_358042 ?auto_358049 ) ) ( not ( = ?auto_358042 ?auto_358050 ) ) ( not ( = ?auto_358042 ?auto_358051 ) ) ( not ( = ?auto_358042 ?auto_358052 ) ) ( not ( = ?auto_358042 ?auto_358053 ) ) ( not ( = ?auto_358043 ?auto_358044 ) ) ( not ( = ?auto_358043 ?auto_358045 ) ) ( not ( = ?auto_358043 ?auto_358046 ) ) ( not ( = ?auto_358043 ?auto_358047 ) ) ( not ( = ?auto_358043 ?auto_358048 ) ) ( not ( = ?auto_358043 ?auto_358049 ) ) ( not ( = ?auto_358043 ?auto_358050 ) ) ( not ( = ?auto_358043 ?auto_358051 ) ) ( not ( = ?auto_358043 ?auto_358052 ) ) ( not ( = ?auto_358043 ?auto_358053 ) ) ( not ( = ?auto_358044 ?auto_358045 ) ) ( not ( = ?auto_358044 ?auto_358046 ) ) ( not ( = ?auto_358044 ?auto_358047 ) ) ( not ( = ?auto_358044 ?auto_358048 ) ) ( not ( = ?auto_358044 ?auto_358049 ) ) ( not ( = ?auto_358044 ?auto_358050 ) ) ( not ( = ?auto_358044 ?auto_358051 ) ) ( not ( = ?auto_358044 ?auto_358052 ) ) ( not ( = ?auto_358044 ?auto_358053 ) ) ( not ( = ?auto_358045 ?auto_358046 ) ) ( not ( = ?auto_358045 ?auto_358047 ) ) ( not ( = ?auto_358045 ?auto_358048 ) ) ( not ( = ?auto_358045 ?auto_358049 ) ) ( not ( = ?auto_358045 ?auto_358050 ) ) ( not ( = ?auto_358045 ?auto_358051 ) ) ( not ( = ?auto_358045 ?auto_358052 ) ) ( not ( = ?auto_358045 ?auto_358053 ) ) ( not ( = ?auto_358046 ?auto_358047 ) ) ( not ( = ?auto_358046 ?auto_358048 ) ) ( not ( = ?auto_358046 ?auto_358049 ) ) ( not ( = ?auto_358046 ?auto_358050 ) ) ( not ( = ?auto_358046 ?auto_358051 ) ) ( not ( = ?auto_358046 ?auto_358052 ) ) ( not ( = ?auto_358046 ?auto_358053 ) ) ( not ( = ?auto_358047 ?auto_358048 ) ) ( not ( = ?auto_358047 ?auto_358049 ) ) ( not ( = ?auto_358047 ?auto_358050 ) ) ( not ( = ?auto_358047 ?auto_358051 ) ) ( not ( = ?auto_358047 ?auto_358052 ) ) ( not ( = ?auto_358047 ?auto_358053 ) ) ( not ( = ?auto_358048 ?auto_358049 ) ) ( not ( = ?auto_358048 ?auto_358050 ) ) ( not ( = ?auto_358048 ?auto_358051 ) ) ( not ( = ?auto_358048 ?auto_358052 ) ) ( not ( = ?auto_358048 ?auto_358053 ) ) ( not ( = ?auto_358049 ?auto_358050 ) ) ( not ( = ?auto_358049 ?auto_358051 ) ) ( not ( = ?auto_358049 ?auto_358052 ) ) ( not ( = ?auto_358049 ?auto_358053 ) ) ( not ( = ?auto_358050 ?auto_358051 ) ) ( not ( = ?auto_358050 ?auto_358052 ) ) ( not ( = ?auto_358050 ?auto_358053 ) ) ( not ( = ?auto_358051 ?auto_358052 ) ) ( not ( = ?auto_358051 ?auto_358053 ) ) ( not ( = ?auto_358052 ?auto_358053 ) ) ( CLEAR ?auto_358050 ) ( ON ?auto_358051 ?auto_358052 ) ( CLEAR ?auto_358051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_358042 ?auto_358043 ?auto_358044 ?auto_358045 ?auto_358046 ?auto_358047 ?auto_358048 ?auto_358049 ?auto_358050 ?auto_358051 )
      ( MAKE-11PILE ?auto_358042 ?auto_358043 ?auto_358044 ?auto_358045 ?auto_358046 ?auto_358047 ?auto_358048 ?auto_358049 ?auto_358050 ?auto_358051 ?auto_358052 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_358088 - BLOCK
      ?auto_358089 - BLOCK
      ?auto_358090 - BLOCK
      ?auto_358091 - BLOCK
      ?auto_358092 - BLOCK
      ?auto_358093 - BLOCK
      ?auto_358094 - BLOCK
      ?auto_358095 - BLOCK
      ?auto_358096 - BLOCK
      ?auto_358097 - BLOCK
      ?auto_358098 - BLOCK
    )
    :vars
    (
      ?auto_358099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358098 ?auto_358099 ) ( ON-TABLE ?auto_358088 ) ( ON ?auto_358089 ?auto_358088 ) ( ON ?auto_358090 ?auto_358089 ) ( ON ?auto_358091 ?auto_358090 ) ( ON ?auto_358092 ?auto_358091 ) ( ON ?auto_358093 ?auto_358092 ) ( ON ?auto_358094 ?auto_358093 ) ( ON ?auto_358095 ?auto_358094 ) ( not ( = ?auto_358088 ?auto_358089 ) ) ( not ( = ?auto_358088 ?auto_358090 ) ) ( not ( = ?auto_358088 ?auto_358091 ) ) ( not ( = ?auto_358088 ?auto_358092 ) ) ( not ( = ?auto_358088 ?auto_358093 ) ) ( not ( = ?auto_358088 ?auto_358094 ) ) ( not ( = ?auto_358088 ?auto_358095 ) ) ( not ( = ?auto_358088 ?auto_358096 ) ) ( not ( = ?auto_358088 ?auto_358097 ) ) ( not ( = ?auto_358088 ?auto_358098 ) ) ( not ( = ?auto_358088 ?auto_358099 ) ) ( not ( = ?auto_358089 ?auto_358090 ) ) ( not ( = ?auto_358089 ?auto_358091 ) ) ( not ( = ?auto_358089 ?auto_358092 ) ) ( not ( = ?auto_358089 ?auto_358093 ) ) ( not ( = ?auto_358089 ?auto_358094 ) ) ( not ( = ?auto_358089 ?auto_358095 ) ) ( not ( = ?auto_358089 ?auto_358096 ) ) ( not ( = ?auto_358089 ?auto_358097 ) ) ( not ( = ?auto_358089 ?auto_358098 ) ) ( not ( = ?auto_358089 ?auto_358099 ) ) ( not ( = ?auto_358090 ?auto_358091 ) ) ( not ( = ?auto_358090 ?auto_358092 ) ) ( not ( = ?auto_358090 ?auto_358093 ) ) ( not ( = ?auto_358090 ?auto_358094 ) ) ( not ( = ?auto_358090 ?auto_358095 ) ) ( not ( = ?auto_358090 ?auto_358096 ) ) ( not ( = ?auto_358090 ?auto_358097 ) ) ( not ( = ?auto_358090 ?auto_358098 ) ) ( not ( = ?auto_358090 ?auto_358099 ) ) ( not ( = ?auto_358091 ?auto_358092 ) ) ( not ( = ?auto_358091 ?auto_358093 ) ) ( not ( = ?auto_358091 ?auto_358094 ) ) ( not ( = ?auto_358091 ?auto_358095 ) ) ( not ( = ?auto_358091 ?auto_358096 ) ) ( not ( = ?auto_358091 ?auto_358097 ) ) ( not ( = ?auto_358091 ?auto_358098 ) ) ( not ( = ?auto_358091 ?auto_358099 ) ) ( not ( = ?auto_358092 ?auto_358093 ) ) ( not ( = ?auto_358092 ?auto_358094 ) ) ( not ( = ?auto_358092 ?auto_358095 ) ) ( not ( = ?auto_358092 ?auto_358096 ) ) ( not ( = ?auto_358092 ?auto_358097 ) ) ( not ( = ?auto_358092 ?auto_358098 ) ) ( not ( = ?auto_358092 ?auto_358099 ) ) ( not ( = ?auto_358093 ?auto_358094 ) ) ( not ( = ?auto_358093 ?auto_358095 ) ) ( not ( = ?auto_358093 ?auto_358096 ) ) ( not ( = ?auto_358093 ?auto_358097 ) ) ( not ( = ?auto_358093 ?auto_358098 ) ) ( not ( = ?auto_358093 ?auto_358099 ) ) ( not ( = ?auto_358094 ?auto_358095 ) ) ( not ( = ?auto_358094 ?auto_358096 ) ) ( not ( = ?auto_358094 ?auto_358097 ) ) ( not ( = ?auto_358094 ?auto_358098 ) ) ( not ( = ?auto_358094 ?auto_358099 ) ) ( not ( = ?auto_358095 ?auto_358096 ) ) ( not ( = ?auto_358095 ?auto_358097 ) ) ( not ( = ?auto_358095 ?auto_358098 ) ) ( not ( = ?auto_358095 ?auto_358099 ) ) ( not ( = ?auto_358096 ?auto_358097 ) ) ( not ( = ?auto_358096 ?auto_358098 ) ) ( not ( = ?auto_358096 ?auto_358099 ) ) ( not ( = ?auto_358097 ?auto_358098 ) ) ( not ( = ?auto_358097 ?auto_358099 ) ) ( not ( = ?auto_358098 ?auto_358099 ) ) ( ON ?auto_358097 ?auto_358098 ) ( CLEAR ?auto_358095 ) ( ON ?auto_358096 ?auto_358097 ) ( CLEAR ?auto_358096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_358088 ?auto_358089 ?auto_358090 ?auto_358091 ?auto_358092 ?auto_358093 ?auto_358094 ?auto_358095 ?auto_358096 )
      ( MAKE-11PILE ?auto_358088 ?auto_358089 ?auto_358090 ?auto_358091 ?auto_358092 ?auto_358093 ?auto_358094 ?auto_358095 ?auto_358096 ?auto_358097 ?auto_358098 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_358134 - BLOCK
      ?auto_358135 - BLOCK
      ?auto_358136 - BLOCK
      ?auto_358137 - BLOCK
      ?auto_358138 - BLOCK
      ?auto_358139 - BLOCK
      ?auto_358140 - BLOCK
      ?auto_358141 - BLOCK
      ?auto_358142 - BLOCK
      ?auto_358143 - BLOCK
      ?auto_358144 - BLOCK
    )
    :vars
    (
      ?auto_358145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358144 ?auto_358145 ) ( ON-TABLE ?auto_358134 ) ( ON ?auto_358135 ?auto_358134 ) ( ON ?auto_358136 ?auto_358135 ) ( ON ?auto_358137 ?auto_358136 ) ( ON ?auto_358138 ?auto_358137 ) ( ON ?auto_358139 ?auto_358138 ) ( ON ?auto_358140 ?auto_358139 ) ( not ( = ?auto_358134 ?auto_358135 ) ) ( not ( = ?auto_358134 ?auto_358136 ) ) ( not ( = ?auto_358134 ?auto_358137 ) ) ( not ( = ?auto_358134 ?auto_358138 ) ) ( not ( = ?auto_358134 ?auto_358139 ) ) ( not ( = ?auto_358134 ?auto_358140 ) ) ( not ( = ?auto_358134 ?auto_358141 ) ) ( not ( = ?auto_358134 ?auto_358142 ) ) ( not ( = ?auto_358134 ?auto_358143 ) ) ( not ( = ?auto_358134 ?auto_358144 ) ) ( not ( = ?auto_358134 ?auto_358145 ) ) ( not ( = ?auto_358135 ?auto_358136 ) ) ( not ( = ?auto_358135 ?auto_358137 ) ) ( not ( = ?auto_358135 ?auto_358138 ) ) ( not ( = ?auto_358135 ?auto_358139 ) ) ( not ( = ?auto_358135 ?auto_358140 ) ) ( not ( = ?auto_358135 ?auto_358141 ) ) ( not ( = ?auto_358135 ?auto_358142 ) ) ( not ( = ?auto_358135 ?auto_358143 ) ) ( not ( = ?auto_358135 ?auto_358144 ) ) ( not ( = ?auto_358135 ?auto_358145 ) ) ( not ( = ?auto_358136 ?auto_358137 ) ) ( not ( = ?auto_358136 ?auto_358138 ) ) ( not ( = ?auto_358136 ?auto_358139 ) ) ( not ( = ?auto_358136 ?auto_358140 ) ) ( not ( = ?auto_358136 ?auto_358141 ) ) ( not ( = ?auto_358136 ?auto_358142 ) ) ( not ( = ?auto_358136 ?auto_358143 ) ) ( not ( = ?auto_358136 ?auto_358144 ) ) ( not ( = ?auto_358136 ?auto_358145 ) ) ( not ( = ?auto_358137 ?auto_358138 ) ) ( not ( = ?auto_358137 ?auto_358139 ) ) ( not ( = ?auto_358137 ?auto_358140 ) ) ( not ( = ?auto_358137 ?auto_358141 ) ) ( not ( = ?auto_358137 ?auto_358142 ) ) ( not ( = ?auto_358137 ?auto_358143 ) ) ( not ( = ?auto_358137 ?auto_358144 ) ) ( not ( = ?auto_358137 ?auto_358145 ) ) ( not ( = ?auto_358138 ?auto_358139 ) ) ( not ( = ?auto_358138 ?auto_358140 ) ) ( not ( = ?auto_358138 ?auto_358141 ) ) ( not ( = ?auto_358138 ?auto_358142 ) ) ( not ( = ?auto_358138 ?auto_358143 ) ) ( not ( = ?auto_358138 ?auto_358144 ) ) ( not ( = ?auto_358138 ?auto_358145 ) ) ( not ( = ?auto_358139 ?auto_358140 ) ) ( not ( = ?auto_358139 ?auto_358141 ) ) ( not ( = ?auto_358139 ?auto_358142 ) ) ( not ( = ?auto_358139 ?auto_358143 ) ) ( not ( = ?auto_358139 ?auto_358144 ) ) ( not ( = ?auto_358139 ?auto_358145 ) ) ( not ( = ?auto_358140 ?auto_358141 ) ) ( not ( = ?auto_358140 ?auto_358142 ) ) ( not ( = ?auto_358140 ?auto_358143 ) ) ( not ( = ?auto_358140 ?auto_358144 ) ) ( not ( = ?auto_358140 ?auto_358145 ) ) ( not ( = ?auto_358141 ?auto_358142 ) ) ( not ( = ?auto_358141 ?auto_358143 ) ) ( not ( = ?auto_358141 ?auto_358144 ) ) ( not ( = ?auto_358141 ?auto_358145 ) ) ( not ( = ?auto_358142 ?auto_358143 ) ) ( not ( = ?auto_358142 ?auto_358144 ) ) ( not ( = ?auto_358142 ?auto_358145 ) ) ( not ( = ?auto_358143 ?auto_358144 ) ) ( not ( = ?auto_358143 ?auto_358145 ) ) ( not ( = ?auto_358144 ?auto_358145 ) ) ( ON ?auto_358143 ?auto_358144 ) ( ON ?auto_358142 ?auto_358143 ) ( CLEAR ?auto_358140 ) ( ON ?auto_358141 ?auto_358142 ) ( CLEAR ?auto_358141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_358134 ?auto_358135 ?auto_358136 ?auto_358137 ?auto_358138 ?auto_358139 ?auto_358140 ?auto_358141 )
      ( MAKE-11PILE ?auto_358134 ?auto_358135 ?auto_358136 ?auto_358137 ?auto_358138 ?auto_358139 ?auto_358140 ?auto_358141 ?auto_358142 ?auto_358143 ?auto_358144 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_358180 - BLOCK
      ?auto_358181 - BLOCK
      ?auto_358182 - BLOCK
      ?auto_358183 - BLOCK
      ?auto_358184 - BLOCK
      ?auto_358185 - BLOCK
      ?auto_358186 - BLOCK
      ?auto_358187 - BLOCK
      ?auto_358188 - BLOCK
      ?auto_358189 - BLOCK
      ?auto_358190 - BLOCK
    )
    :vars
    (
      ?auto_358191 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358190 ?auto_358191 ) ( ON-TABLE ?auto_358180 ) ( ON ?auto_358181 ?auto_358180 ) ( ON ?auto_358182 ?auto_358181 ) ( ON ?auto_358183 ?auto_358182 ) ( ON ?auto_358184 ?auto_358183 ) ( ON ?auto_358185 ?auto_358184 ) ( not ( = ?auto_358180 ?auto_358181 ) ) ( not ( = ?auto_358180 ?auto_358182 ) ) ( not ( = ?auto_358180 ?auto_358183 ) ) ( not ( = ?auto_358180 ?auto_358184 ) ) ( not ( = ?auto_358180 ?auto_358185 ) ) ( not ( = ?auto_358180 ?auto_358186 ) ) ( not ( = ?auto_358180 ?auto_358187 ) ) ( not ( = ?auto_358180 ?auto_358188 ) ) ( not ( = ?auto_358180 ?auto_358189 ) ) ( not ( = ?auto_358180 ?auto_358190 ) ) ( not ( = ?auto_358180 ?auto_358191 ) ) ( not ( = ?auto_358181 ?auto_358182 ) ) ( not ( = ?auto_358181 ?auto_358183 ) ) ( not ( = ?auto_358181 ?auto_358184 ) ) ( not ( = ?auto_358181 ?auto_358185 ) ) ( not ( = ?auto_358181 ?auto_358186 ) ) ( not ( = ?auto_358181 ?auto_358187 ) ) ( not ( = ?auto_358181 ?auto_358188 ) ) ( not ( = ?auto_358181 ?auto_358189 ) ) ( not ( = ?auto_358181 ?auto_358190 ) ) ( not ( = ?auto_358181 ?auto_358191 ) ) ( not ( = ?auto_358182 ?auto_358183 ) ) ( not ( = ?auto_358182 ?auto_358184 ) ) ( not ( = ?auto_358182 ?auto_358185 ) ) ( not ( = ?auto_358182 ?auto_358186 ) ) ( not ( = ?auto_358182 ?auto_358187 ) ) ( not ( = ?auto_358182 ?auto_358188 ) ) ( not ( = ?auto_358182 ?auto_358189 ) ) ( not ( = ?auto_358182 ?auto_358190 ) ) ( not ( = ?auto_358182 ?auto_358191 ) ) ( not ( = ?auto_358183 ?auto_358184 ) ) ( not ( = ?auto_358183 ?auto_358185 ) ) ( not ( = ?auto_358183 ?auto_358186 ) ) ( not ( = ?auto_358183 ?auto_358187 ) ) ( not ( = ?auto_358183 ?auto_358188 ) ) ( not ( = ?auto_358183 ?auto_358189 ) ) ( not ( = ?auto_358183 ?auto_358190 ) ) ( not ( = ?auto_358183 ?auto_358191 ) ) ( not ( = ?auto_358184 ?auto_358185 ) ) ( not ( = ?auto_358184 ?auto_358186 ) ) ( not ( = ?auto_358184 ?auto_358187 ) ) ( not ( = ?auto_358184 ?auto_358188 ) ) ( not ( = ?auto_358184 ?auto_358189 ) ) ( not ( = ?auto_358184 ?auto_358190 ) ) ( not ( = ?auto_358184 ?auto_358191 ) ) ( not ( = ?auto_358185 ?auto_358186 ) ) ( not ( = ?auto_358185 ?auto_358187 ) ) ( not ( = ?auto_358185 ?auto_358188 ) ) ( not ( = ?auto_358185 ?auto_358189 ) ) ( not ( = ?auto_358185 ?auto_358190 ) ) ( not ( = ?auto_358185 ?auto_358191 ) ) ( not ( = ?auto_358186 ?auto_358187 ) ) ( not ( = ?auto_358186 ?auto_358188 ) ) ( not ( = ?auto_358186 ?auto_358189 ) ) ( not ( = ?auto_358186 ?auto_358190 ) ) ( not ( = ?auto_358186 ?auto_358191 ) ) ( not ( = ?auto_358187 ?auto_358188 ) ) ( not ( = ?auto_358187 ?auto_358189 ) ) ( not ( = ?auto_358187 ?auto_358190 ) ) ( not ( = ?auto_358187 ?auto_358191 ) ) ( not ( = ?auto_358188 ?auto_358189 ) ) ( not ( = ?auto_358188 ?auto_358190 ) ) ( not ( = ?auto_358188 ?auto_358191 ) ) ( not ( = ?auto_358189 ?auto_358190 ) ) ( not ( = ?auto_358189 ?auto_358191 ) ) ( not ( = ?auto_358190 ?auto_358191 ) ) ( ON ?auto_358189 ?auto_358190 ) ( ON ?auto_358188 ?auto_358189 ) ( ON ?auto_358187 ?auto_358188 ) ( CLEAR ?auto_358185 ) ( ON ?auto_358186 ?auto_358187 ) ( CLEAR ?auto_358186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_358180 ?auto_358181 ?auto_358182 ?auto_358183 ?auto_358184 ?auto_358185 ?auto_358186 )
      ( MAKE-11PILE ?auto_358180 ?auto_358181 ?auto_358182 ?auto_358183 ?auto_358184 ?auto_358185 ?auto_358186 ?auto_358187 ?auto_358188 ?auto_358189 ?auto_358190 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_358226 - BLOCK
      ?auto_358227 - BLOCK
      ?auto_358228 - BLOCK
      ?auto_358229 - BLOCK
      ?auto_358230 - BLOCK
      ?auto_358231 - BLOCK
      ?auto_358232 - BLOCK
      ?auto_358233 - BLOCK
      ?auto_358234 - BLOCK
      ?auto_358235 - BLOCK
      ?auto_358236 - BLOCK
    )
    :vars
    (
      ?auto_358237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358236 ?auto_358237 ) ( ON-TABLE ?auto_358226 ) ( ON ?auto_358227 ?auto_358226 ) ( ON ?auto_358228 ?auto_358227 ) ( ON ?auto_358229 ?auto_358228 ) ( ON ?auto_358230 ?auto_358229 ) ( not ( = ?auto_358226 ?auto_358227 ) ) ( not ( = ?auto_358226 ?auto_358228 ) ) ( not ( = ?auto_358226 ?auto_358229 ) ) ( not ( = ?auto_358226 ?auto_358230 ) ) ( not ( = ?auto_358226 ?auto_358231 ) ) ( not ( = ?auto_358226 ?auto_358232 ) ) ( not ( = ?auto_358226 ?auto_358233 ) ) ( not ( = ?auto_358226 ?auto_358234 ) ) ( not ( = ?auto_358226 ?auto_358235 ) ) ( not ( = ?auto_358226 ?auto_358236 ) ) ( not ( = ?auto_358226 ?auto_358237 ) ) ( not ( = ?auto_358227 ?auto_358228 ) ) ( not ( = ?auto_358227 ?auto_358229 ) ) ( not ( = ?auto_358227 ?auto_358230 ) ) ( not ( = ?auto_358227 ?auto_358231 ) ) ( not ( = ?auto_358227 ?auto_358232 ) ) ( not ( = ?auto_358227 ?auto_358233 ) ) ( not ( = ?auto_358227 ?auto_358234 ) ) ( not ( = ?auto_358227 ?auto_358235 ) ) ( not ( = ?auto_358227 ?auto_358236 ) ) ( not ( = ?auto_358227 ?auto_358237 ) ) ( not ( = ?auto_358228 ?auto_358229 ) ) ( not ( = ?auto_358228 ?auto_358230 ) ) ( not ( = ?auto_358228 ?auto_358231 ) ) ( not ( = ?auto_358228 ?auto_358232 ) ) ( not ( = ?auto_358228 ?auto_358233 ) ) ( not ( = ?auto_358228 ?auto_358234 ) ) ( not ( = ?auto_358228 ?auto_358235 ) ) ( not ( = ?auto_358228 ?auto_358236 ) ) ( not ( = ?auto_358228 ?auto_358237 ) ) ( not ( = ?auto_358229 ?auto_358230 ) ) ( not ( = ?auto_358229 ?auto_358231 ) ) ( not ( = ?auto_358229 ?auto_358232 ) ) ( not ( = ?auto_358229 ?auto_358233 ) ) ( not ( = ?auto_358229 ?auto_358234 ) ) ( not ( = ?auto_358229 ?auto_358235 ) ) ( not ( = ?auto_358229 ?auto_358236 ) ) ( not ( = ?auto_358229 ?auto_358237 ) ) ( not ( = ?auto_358230 ?auto_358231 ) ) ( not ( = ?auto_358230 ?auto_358232 ) ) ( not ( = ?auto_358230 ?auto_358233 ) ) ( not ( = ?auto_358230 ?auto_358234 ) ) ( not ( = ?auto_358230 ?auto_358235 ) ) ( not ( = ?auto_358230 ?auto_358236 ) ) ( not ( = ?auto_358230 ?auto_358237 ) ) ( not ( = ?auto_358231 ?auto_358232 ) ) ( not ( = ?auto_358231 ?auto_358233 ) ) ( not ( = ?auto_358231 ?auto_358234 ) ) ( not ( = ?auto_358231 ?auto_358235 ) ) ( not ( = ?auto_358231 ?auto_358236 ) ) ( not ( = ?auto_358231 ?auto_358237 ) ) ( not ( = ?auto_358232 ?auto_358233 ) ) ( not ( = ?auto_358232 ?auto_358234 ) ) ( not ( = ?auto_358232 ?auto_358235 ) ) ( not ( = ?auto_358232 ?auto_358236 ) ) ( not ( = ?auto_358232 ?auto_358237 ) ) ( not ( = ?auto_358233 ?auto_358234 ) ) ( not ( = ?auto_358233 ?auto_358235 ) ) ( not ( = ?auto_358233 ?auto_358236 ) ) ( not ( = ?auto_358233 ?auto_358237 ) ) ( not ( = ?auto_358234 ?auto_358235 ) ) ( not ( = ?auto_358234 ?auto_358236 ) ) ( not ( = ?auto_358234 ?auto_358237 ) ) ( not ( = ?auto_358235 ?auto_358236 ) ) ( not ( = ?auto_358235 ?auto_358237 ) ) ( not ( = ?auto_358236 ?auto_358237 ) ) ( ON ?auto_358235 ?auto_358236 ) ( ON ?auto_358234 ?auto_358235 ) ( ON ?auto_358233 ?auto_358234 ) ( ON ?auto_358232 ?auto_358233 ) ( CLEAR ?auto_358230 ) ( ON ?auto_358231 ?auto_358232 ) ( CLEAR ?auto_358231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_358226 ?auto_358227 ?auto_358228 ?auto_358229 ?auto_358230 ?auto_358231 )
      ( MAKE-11PILE ?auto_358226 ?auto_358227 ?auto_358228 ?auto_358229 ?auto_358230 ?auto_358231 ?auto_358232 ?auto_358233 ?auto_358234 ?auto_358235 ?auto_358236 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_358272 - BLOCK
      ?auto_358273 - BLOCK
      ?auto_358274 - BLOCK
      ?auto_358275 - BLOCK
      ?auto_358276 - BLOCK
      ?auto_358277 - BLOCK
      ?auto_358278 - BLOCK
      ?auto_358279 - BLOCK
      ?auto_358280 - BLOCK
      ?auto_358281 - BLOCK
      ?auto_358282 - BLOCK
    )
    :vars
    (
      ?auto_358283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358282 ?auto_358283 ) ( ON-TABLE ?auto_358272 ) ( ON ?auto_358273 ?auto_358272 ) ( ON ?auto_358274 ?auto_358273 ) ( ON ?auto_358275 ?auto_358274 ) ( not ( = ?auto_358272 ?auto_358273 ) ) ( not ( = ?auto_358272 ?auto_358274 ) ) ( not ( = ?auto_358272 ?auto_358275 ) ) ( not ( = ?auto_358272 ?auto_358276 ) ) ( not ( = ?auto_358272 ?auto_358277 ) ) ( not ( = ?auto_358272 ?auto_358278 ) ) ( not ( = ?auto_358272 ?auto_358279 ) ) ( not ( = ?auto_358272 ?auto_358280 ) ) ( not ( = ?auto_358272 ?auto_358281 ) ) ( not ( = ?auto_358272 ?auto_358282 ) ) ( not ( = ?auto_358272 ?auto_358283 ) ) ( not ( = ?auto_358273 ?auto_358274 ) ) ( not ( = ?auto_358273 ?auto_358275 ) ) ( not ( = ?auto_358273 ?auto_358276 ) ) ( not ( = ?auto_358273 ?auto_358277 ) ) ( not ( = ?auto_358273 ?auto_358278 ) ) ( not ( = ?auto_358273 ?auto_358279 ) ) ( not ( = ?auto_358273 ?auto_358280 ) ) ( not ( = ?auto_358273 ?auto_358281 ) ) ( not ( = ?auto_358273 ?auto_358282 ) ) ( not ( = ?auto_358273 ?auto_358283 ) ) ( not ( = ?auto_358274 ?auto_358275 ) ) ( not ( = ?auto_358274 ?auto_358276 ) ) ( not ( = ?auto_358274 ?auto_358277 ) ) ( not ( = ?auto_358274 ?auto_358278 ) ) ( not ( = ?auto_358274 ?auto_358279 ) ) ( not ( = ?auto_358274 ?auto_358280 ) ) ( not ( = ?auto_358274 ?auto_358281 ) ) ( not ( = ?auto_358274 ?auto_358282 ) ) ( not ( = ?auto_358274 ?auto_358283 ) ) ( not ( = ?auto_358275 ?auto_358276 ) ) ( not ( = ?auto_358275 ?auto_358277 ) ) ( not ( = ?auto_358275 ?auto_358278 ) ) ( not ( = ?auto_358275 ?auto_358279 ) ) ( not ( = ?auto_358275 ?auto_358280 ) ) ( not ( = ?auto_358275 ?auto_358281 ) ) ( not ( = ?auto_358275 ?auto_358282 ) ) ( not ( = ?auto_358275 ?auto_358283 ) ) ( not ( = ?auto_358276 ?auto_358277 ) ) ( not ( = ?auto_358276 ?auto_358278 ) ) ( not ( = ?auto_358276 ?auto_358279 ) ) ( not ( = ?auto_358276 ?auto_358280 ) ) ( not ( = ?auto_358276 ?auto_358281 ) ) ( not ( = ?auto_358276 ?auto_358282 ) ) ( not ( = ?auto_358276 ?auto_358283 ) ) ( not ( = ?auto_358277 ?auto_358278 ) ) ( not ( = ?auto_358277 ?auto_358279 ) ) ( not ( = ?auto_358277 ?auto_358280 ) ) ( not ( = ?auto_358277 ?auto_358281 ) ) ( not ( = ?auto_358277 ?auto_358282 ) ) ( not ( = ?auto_358277 ?auto_358283 ) ) ( not ( = ?auto_358278 ?auto_358279 ) ) ( not ( = ?auto_358278 ?auto_358280 ) ) ( not ( = ?auto_358278 ?auto_358281 ) ) ( not ( = ?auto_358278 ?auto_358282 ) ) ( not ( = ?auto_358278 ?auto_358283 ) ) ( not ( = ?auto_358279 ?auto_358280 ) ) ( not ( = ?auto_358279 ?auto_358281 ) ) ( not ( = ?auto_358279 ?auto_358282 ) ) ( not ( = ?auto_358279 ?auto_358283 ) ) ( not ( = ?auto_358280 ?auto_358281 ) ) ( not ( = ?auto_358280 ?auto_358282 ) ) ( not ( = ?auto_358280 ?auto_358283 ) ) ( not ( = ?auto_358281 ?auto_358282 ) ) ( not ( = ?auto_358281 ?auto_358283 ) ) ( not ( = ?auto_358282 ?auto_358283 ) ) ( ON ?auto_358281 ?auto_358282 ) ( ON ?auto_358280 ?auto_358281 ) ( ON ?auto_358279 ?auto_358280 ) ( ON ?auto_358278 ?auto_358279 ) ( ON ?auto_358277 ?auto_358278 ) ( CLEAR ?auto_358275 ) ( ON ?auto_358276 ?auto_358277 ) ( CLEAR ?auto_358276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_358272 ?auto_358273 ?auto_358274 ?auto_358275 ?auto_358276 )
      ( MAKE-11PILE ?auto_358272 ?auto_358273 ?auto_358274 ?auto_358275 ?auto_358276 ?auto_358277 ?auto_358278 ?auto_358279 ?auto_358280 ?auto_358281 ?auto_358282 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_358318 - BLOCK
      ?auto_358319 - BLOCK
      ?auto_358320 - BLOCK
      ?auto_358321 - BLOCK
      ?auto_358322 - BLOCK
      ?auto_358323 - BLOCK
      ?auto_358324 - BLOCK
      ?auto_358325 - BLOCK
      ?auto_358326 - BLOCK
      ?auto_358327 - BLOCK
      ?auto_358328 - BLOCK
    )
    :vars
    (
      ?auto_358329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358328 ?auto_358329 ) ( ON-TABLE ?auto_358318 ) ( ON ?auto_358319 ?auto_358318 ) ( ON ?auto_358320 ?auto_358319 ) ( not ( = ?auto_358318 ?auto_358319 ) ) ( not ( = ?auto_358318 ?auto_358320 ) ) ( not ( = ?auto_358318 ?auto_358321 ) ) ( not ( = ?auto_358318 ?auto_358322 ) ) ( not ( = ?auto_358318 ?auto_358323 ) ) ( not ( = ?auto_358318 ?auto_358324 ) ) ( not ( = ?auto_358318 ?auto_358325 ) ) ( not ( = ?auto_358318 ?auto_358326 ) ) ( not ( = ?auto_358318 ?auto_358327 ) ) ( not ( = ?auto_358318 ?auto_358328 ) ) ( not ( = ?auto_358318 ?auto_358329 ) ) ( not ( = ?auto_358319 ?auto_358320 ) ) ( not ( = ?auto_358319 ?auto_358321 ) ) ( not ( = ?auto_358319 ?auto_358322 ) ) ( not ( = ?auto_358319 ?auto_358323 ) ) ( not ( = ?auto_358319 ?auto_358324 ) ) ( not ( = ?auto_358319 ?auto_358325 ) ) ( not ( = ?auto_358319 ?auto_358326 ) ) ( not ( = ?auto_358319 ?auto_358327 ) ) ( not ( = ?auto_358319 ?auto_358328 ) ) ( not ( = ?auto_358319 ?auto_358329 ) ) ( not ( = ?auto_358320 ?auto_358321 ) ) ( not ( = ?auto_358320 ?auto_358322 ) ) ( not ( = ?auto_358320 ?auto_358323 ) ) ( not ( = ?auto_358320 ?auto_358324 ) ) ( not ( = ?auto_358320 ?auto_358325 ) ) ( not ( = ?auto_358320 ?auto_358326 ) ) ( not ( = ?auto_358320 ?auto_358327 ) ) ( not ( = ?auto_358320 ?auto_358328 ) ) ( not ( = ?auto_358320 ?auto_358329 ) ) ( not ( = ?auto_358321 ?auto_358322 ) ) ( not ( = ?auto_358321 ?auto_358323 ) ) ( not ( = ?auto_358321 ?auto_358324 ) ) ( not ( = ?auto_358321 ?auto_358325 ) ) ( not ( = ?auto_358321 ?auto_358326 ) ) ( not ( = ?auto_358321 ?auto_358327 ) ) ( not ( = ?auto_358321 ?auto_358328 ) ) ( not ( = ?auto_358321 ?auto_358329 ) ) ( not ( = ?auto_358322 ?auto_358323 ) ) ( not ( = ?auto_358322 ?auto_358324 ) ) ( not ( = ?auto_358322 ?auto_358325 ) ) ( not ( = ?auto_358322 ?auto_358326 ) ) ( not ( = ?auto_358322 ?auto_358327 ) ) ( not ( = ?auto_358322 ?auto_358328 ) ) ( not ( = ?auto_358322 ?auto_358329 ) ) ( not ( = ?auto_358323 ?auto_358324 ) ) ( not ( = ?auto_358323 ?auto_358325 ) ) ( not ( = ?auto_358323 ?auto_358326 ) ) ( not ( = ?auto_358323 ?auto_358327 ) ) ( not ( = ?auto_358323 ?auto_358328 ) ) ( not ( = ?auto_358323 ?auto_358329 ) ) ( not ( = ?auto_358324 ?auto_358325 ) ) ( not ( = ?auto_358324 ?auto_358326 ) ) ( not ( = ?auto_358324 ?auto_358327 ) ) ( not ( = ?auto_358324 ?auto_358328 ) ) ( not ( = ?auto_358324 ?auto_358329 ) ) ( not ( = ?auto_358325 ?auto_358326 ) ) ( not ( = ?auto_358325 ?auto_358327 ) ) ( not ( = ?auto_358325 ?auto_358328 ) ) ( not ( = ?auto_358325 ?auto_358329 ) ) ( not ( = ?auto_358326 ?auto_358327 ) ) ( not ( = ?auto_358326 ?auto_358328 ) ) ( not ( = ?auto_358326 ?auto_358329 ) ) ( not ( = ?auto_358327 ?auto_358328 ) ) ( not ( = ?auto_358327 ?auto_358329 ) ) ( not ( = ?auto_358328 ?auto_358329 ) ) ( ON ?auto_358327 ?auto_358328 ) ( ON ?auto_358326 ?auto_358327 ) ( ON ?auto_358325 ?auto_358326 ) ( ON ?auto_358324 ?auto_358325 ) ( ON ?auto_358323 ?auto_358324 ) ( ON ?auto_358322 ?auto_358323 ) ( CLEAR ?auto_358320 ) ( ON ?auto_358321 ?auto_358322 ) ( CLEAR ?auto_358321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_358318 ?auto_358319 ?auto_358320 ?auto_358321 )
      ( MAKE-11PILE ?auto_358318 ?auto_358319 ?auto_358320 ?auto_358321 ?auto_358322 ?auto_358323 ?auto_358324 ?auto_358325 ?auto_358326 ?auto_358327 ?auto_358328 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_358364 - BLOCK
      ?auto_358365 - BLOCK
      ?auto_358366 - BLOCK
      ?auto_358367 - BLOCK
      ?auto_358368 - BLOCK
      ?auto_358369 - BLOCK
      ?auto_358370 - BLOCK
      ?auto_358371 - BLOCK
      ?auto_358372 - BLOCK
      ?auto_358373 - BLOCK
      ?auto_358374 - BLOCK
    )
    :vars
    (
      ?auto_358375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358374 ?auto_358375 ) ( ON-TABLE ?auto_358364 ) ( ON ?auto_358365 ?auto_358364 ) ( not ( = ?auto_358364 ?auto_358365 ) ) ( not ( = ?auto_358364 ?auto_358366 ) ) ( not ( = ?auto_358364 ?auto_358367 ) ) ( not ( = ?auto_358364 ?auto_358368 ) ) ( not ( = ?auto_358364 ?auto_358369 ) ) ( not ( = ?auto_358364 ?auto_358370 ) ) ( not ( = ?auto_358364 ?auto_358371 ) ) ( not ( = ?auto_358364 ?auto_358372 ) ) ( not ( = ?auto_358364 ?auto_358373 ) ) ( not ( = ?auto_358364 ?auto_358374 ) ) ( not ( = ?auto_358364 ?auto_358375 ) ) ( not ( = ?auto_358365 ?auto_358366 ) ) ( not ( = ?auto_358365 ?auto_358367 ) ) ( not ( = ?auto_358365 ?auto_358368 ) ) ( not ( = ?auto_358365 ?auto_358369 ) ) ( not ( = ?auto_358365 ?auto_358370 ) ) ( not ( = ?auto_358365 ?auto_358371 ) ) ( not ( = ?auto_358365 ?auto_358372 ) ) ( not ( = ?auto_358365 ?auto_358373 ) ) ( not ( = ?auto_358365 ?auto_358374 ) ) ( not ( = ?auto_358365 ?auto_358375 ) ) ( not ( = ?auto_358366 ?auto_358367 ) ) ( not ( = ?auto_358366 ?auto_358368 ) ) ( not ( = ?auto_358366 ?auto_358369 ) ) ( not ( = ?auto_358366 ?auto_358370 ) ) ( not ( = ?auto_358366 ?auto_358371 ) ) ( not ( = ?auto_358366 ?auto_358372 ) ) ( not ( = ?auto_358366 ?auto_358373 ) ) ( not ( = ?auto_358366 ?auto_358374 ) ) ( not ( = ?auto_358366 ?auto_358375 ) ) ( not ( = ?auto_358367 ?auto_358368 ) ) ( not ( = ?auto_358367 ?auto_358369 ) ) ( not ( = ?auto_358367 ?auto_358370 ) ) ( not ( = ?auto_358367 ?auto_358371 ) ) ( not ( = ?auto_358367 ?auto_358372 ) ) ( not ( = ?auto_358367 ?auto_358373 ) ) ( not ( = ?auto_358367 ?auto_358374 ) ) ( not ( = ?auto_358367 ?auto_358375 ) ) ( not ( = ?auto_358368 ?auto_358369 ) ) ( not ( = ?auto_358368 ?auto_358370 ) ) ( not ( = ?auto_358368 ?auto_358371 ) ) ( not ( = ?auto_358368 ?auto_358372 ) ) ( not ( = ?auto_358368 ?auto_358373 ) ) ( not ( = ?auto_358368 ?auto_358374 ) ) ( not ( = ?auto_358368 ?auto_358375 ) ) ( not ( = ?auto_358369 ?auto_358370 ) ) ( not ( = ?auto_358369 ?auto_358371 ) ) ( not ( = ?auto_358369 ?auto_358372 ) ) ( not ( = ?auto_358369 ?auto_358373 ) ) ( not ( = ?auto_358369 ?auto_358374 ) ) ( not ( = ?auto_358369 ?auto_358375 ) ) ( not ( = ?auto_358370 ?auto_358371 ) ) ( not ( = ?auto_358370 ?auto_358372 ) ) ( not ( = ?auto_358370 ?auto_358373 ) ) ( not ( = ?auto_358370 ?auto_358374 ) ) ( not ( = ?auto_358370 ?auto_358375 ) ) ( not ( = ?auto_358371 ?auto_358372 ) ) ( not ( = ?auto_358371 ?auto_358373 ) ) ( not ( = ?auto_358371 ?auto_358374 ) ) ( not ( = ?auto_358371 ?auto_358375 ) ) ( not ( = ?auto_358372 ?auto_358373 ) ) ( not ( = ?auto_358372 ?auto_358374 ) ) ( not ( = ?auto_358372 ?auto_358375 ) ) ( not ( = ?auto_358373 ?auto_358374 ) ) ( not ( = ?auto_358373 ?auto_358375 ) ) ( not ( = ?auto_358374 ?auto_358375 ) ) ( ON ?auto_358373 ?auto_358374 ) ( ON ?auto_358372 ?auto_358373 ) ( ON ?auto_358371 ?auto_358372 ) ( ON ?auto_358370 ?auto_358371 ) ( ON ?auto_358369 ?auto_358370 ) ( ON ?auto_358368 ?auto_358369 ) ( ON ?auto_358367 ?auto_358368 ) ( CLEAR ?auto_358365 ) ( ON ?auto_358366 ?auto_358367 ) ( CLEAR ?auto_358366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_358364 ?auto_358365 ?auto_358366 )
      ( MAKE-11PILE ?auto_358364 ?auto_358365 ?auto_358366 ?auto_358367 ?auto_358368 ?auto_358369 ?auto_358370 ?auto_358371 ?auto_358372 ?auto_358373 ?auto_358374 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_358410 - BLOCK
      ?auto_358411 - BLOCK
      ?auto_358412 - BLOCK
      ?auto_358413 - BLOCK
      ?auto_358414 - BLOCK
      ?auto_358415 - BLOCK
      ?auto_358416 - BLOCK
      ?auto_358417 - BLOCK
      ?auto_358418 - BLOCK
      ?auto_358419 - BLOCK
      ?auto_358420 - BLOCK
    )
    :vars
    (
      ?auto_358421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358420 ?auto_358421 ) ( ON-TABLE ?auto_358410 ) ( not ( = ?auto_358410 ?auto_358411 ) ) ( not ( = ?auto_358410 ?auto_358412 ) ) ( not ( = ?auto_358410 ?auto_358413 ) ) ( not ( = ?auto_358410 ?auto_358414 ) ) ( not ( = ?auto_358410 ?auto_358415 ) ) ( not ( = ?auto_358410 ?auto_358416 ) ) ( not ( = ?auto_358410 ?auto_358417 ) ) ( not ( = ?auto_358410 ?auto_358418 ) ) ( not ( = ?auto_358410 ?auto_358419 ) ) ( not ( = ?auto_358410 ?auto_358420 ) ) ( not ( = ?auto_358410 ?auto_358421 ) ) ( not ( = ?auto_358411 ?auto_358412 ) ) ( not ( = ?auto_358411 ?auto_358413 ) ) ( not ( = ?auto_358411 ?auto_358414 ) ) ( not ( = ?auto_358411 ?auto_358415 ) ) ( not ( = ?auto_358411 ?auto_358416 ) ) ( not ( = ?auto_358411 ?auto_358417 ) ) ( not ( = ?auto_358411 ?auto_358418 ) ) ( not ( = ?auto_358411 ?auto_358419 ) ) ( not ( = ?auto_358411 ?auto_358420 ) ) ( not ( = ?auto_358411 ?auto_358421 ) ) ( not ( = ?auto_358412 ?auto_358413 ) ) ( not ( = ?auto_358412 ?auto_358414 ) ) ( not ( = ?auto_358412 ?auto_358415 ) ) ( not ( = ?auto_358412 ?auto_358416 ) ) ( not ( = ?auto_358412 ?auto_358417 ) ) ( not ( = ?auto_358412 ?auto_358418 ) ) ( not ( = ?auto_358412 ?auto_358419 ) ) ( not ( = ?auto_358412 ?auto_358420 ) ) ( not ( = ?auto_358412 ?auto_358421 ) ) ( not ( = ?auto_358413 ?auto_358414 ) ) ( not ( = ?auto_358413 ?auto_358415 ) ) ( not ( = ?auto_358413 ?auto_358416 ) ) ( not ( = ?auto_358413 ?auto_358417 ) ) ( not ( = ?auto_358413 ?auto_358418 ) ) ( not ( = ?auto_358413 ?auto_358419 ) ) ( not ( = ?auto_358413 ?auto_358420 ) ) ( not ( = ?auto_358413 ?auto_358421 ) ) ( not ( = ?auto_358414 ?auto_358415 ) ) ( not ( = ?auto_358414 ?auto_358416 ) ) ( not ( = ?auto_358414 ?auto_358417 ) ) ( not ( = ?auto_358414 ?auto_358418 ) ) ( not ( = ?auto_358414 ?auto_358419 ) ) ( not ( = ?auto_358414 ?auto_358420 ) ) ( not ( = ?auto_358414 ?auto_358421 ) ) ( not ( = ?auto_358415 ?auto_358416 ) ) ( not ( = ?auto_358415 ?auto_358417 ) ) ( not ( = ?auto_358415 ?auto_358418 ) ) ( not ( = ?auto_358415 ?auto_358419 ) ) ( not ( = ?auto_358415 ?auto_358420 ) ) ( not ( = ?auto_358415 ?auto_358421 ) ) ( not ( = ?auto_358416 ?auto_358417 ) ) ( not ( = ?auto_358416 ?auto_358418 ) ) ( not ( = ?auto_358416 ?auto_358419 ) ) ( not ( = ?auto_358416 ?auto_358420 ) ) ( not ( = ?auto_358416 ?auto_358421 ) ) ( not ( = ?auto_358417 ?auto_358418 ) ) ( not ( = ?auto_358417 ?auto_358419 ) ) ( not ( = ?auto_358417 ?auto_358420 ) ) ( not ( = ?auto_358417 ?auto_358421 ) ) ( not ( = ?auto_358418 ?auto_358419 ) ) ( not ( = ?auto_358418 ?auto_358420 ) ) ( not ( = ?auto_358418 ?auto_358421 ) ) ( not ( = ?auto_358419 ?auto_358420 ) ) ( not ( = ?auto_358419 ?auto_358421 ) ) ( not ( = ?auto_358420 ?auto_358421 ) ) ( ON ?auto_358419 ?auto_358420 ) ( ON ?auto_358418 ?auto_358419 ) ( ON ?auto_358417 ?auto_358418 ) ( ON ?auto_358416 ?auto_358417 ) ( ON ?auto_358415 ?auto_358416 ) ( ON ?auto_358414 ?auto_358415 ) ( ON ?auto_358413 ?auto_358414 ) ( ON ?auto_358412 ?auto_358413 ) ( CLEAR ?auto_358410 ) ( ON ?auto_358411 ?auto_358412 ) ( CLEAR ?auto_358411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_358410 ?auto_358411 )
      ( MAKE-11PILE ?auto_358410 ?auto_358411 ?auto_358412 ?auto_358413 ?auto_358414 ?auto_358415 ?auto_358416 ?auto_358417 ?auto_358418 ?auto_358419 ?auto_358420 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_358456 - BLOCK
      ?auto_358457 - BLOCK
      ?auto_358458 - BLOCK
      ?auto_358459 - BLOCK
      ?auto_358460 - BLOCK
      ?auto_358461 - BLOCK
      ?auto_358462 - BLOCK
      ?auto_358463 - BLOCK
      ?auto_358464 - BLOCK
      ?auto_358465 - BLOCK
      ?auto_358466 - BLOCK
    )
    :vars
    (
      ?auto_358467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358466 ?auto_358467 ) ( not ( = ?auto_358456 ?auto_358457 ) ) ( not ( = ?auto_358456 ?auto_358458 ) ) ( not ( = ?auto_358456 ?auto_358459 ) ) ( not ( = ?auto_358456 ?auto_358460 ) ) ( not ( = ?auto_358456 ?auto_358461 ) ) ( not ( = ?auto_358456 ?auto_358462 ) ) ( not ( = ?auto_358456 ?auto_358463 ) ) ( not ( = ?auto_358456 ?auto_358464 ) ) ( not ( = ?auto_358456 ?auto_358465 ) ) ( not ( = ?auto_358456 ?auto_358466 ) ) ( not ( = ?auto_358456 ?auto_358467 ) ) ( not ( = ?auto_358457 ?auto_358458 ) ) ( not ( = ?auto_358457 ?auto_358459 ) ) ( not ( = ?auto_358457 ?auto_358460 ) ) ( not ( = ?auto_358457 ?auto_358461 ) ) ( not ( = ?auto_358457 ?auto_358462 ) ) ( not ( = ?auto_358457 ?auto_358463 ) ) ( not ( = ?auto_358457 ?auto_358464 ) ) ( not ( = ?auto_358457 ?auto_358465 ) ) ( not ( = ?auto_358457 ?auto_358466 ) ) ( not ( = ?auto_358457 ?auto_358467 ) ) ( not ( = ?auto_358458 ?auto_358459 ) ) ( not ( = ?auto_358458 ?auto_358460 ) ) ( not ( = ?auto_358458 ?auto_358461 ) ) ( not ( = ?auto_358458 ?auto_358462 ) ) ( not ( = ?auto_358458 ?auto_358463 ) ) ( not ( = ?auto_358458 ?auto_358464 ) ) ( not ( = ?auto_358458 ?auto_358465 ) ) ( not ( = ?auto_358458 ?auto_358466 ) ) ( not ( = ?auto_358458 ?auto_358467 ) ) ( not ( = ?auto_358459 ?auto_358460 ) ) ( not ( = ?auto_358459 ?auto_358461 ) ) ( not ( = ?auto_358459 ?auto_358462 ) ) ( not ( = ?auto_358459 ?auto_358463 ) ) ( not ( = ?auto_358459 ?auto_358464 ) ) ( not ( = ?auto_358459 ?auto_358465 ) ) ( not ( = ?auto_358459 ?auto_358466 ) ) ( not ( = ?auto_358459 ?auto_358467 ) ) ( not ( = ?auto_358460 ?auto_358461 ) ) ( not ( = ?auto_358460 ?auto_358462 ) ) ( not ( = ?auto_358460 ?auto_358463 ) ) ( not ( = ?auto_358460 ?auto_358464 ) ) ( not ( = ?auto_358460 ?auto_358465 ) ) ( not ( = ?auto_358460 ?auto_358466 ) ) ( not ( = ?auto_358460 ?auto_358467 ) ) ( not ( = ?auto_358461 ?auto_358462 ) ) ( not ( = ?auto_358461 ?auto_358463 ) ) ( not ( = ?auto_358461 ?auto_358464 ) ) ( not ( = ?auto_358461 ?auto_358465 ) ) ( not ( = ?auto_358461 ?auto_358466 ) ) ( not ( = ?auto_358461 ?auto_358467 ) ) ( not ( = ?auto_358462 ?auto_358463 ) ) ( not ( = ?auto_358462 ?auto_358464 ) ) ( not ( = ?auto_358462 ?auto_358465 ) ) ( not ( = ?auto_358462 ?auto_358466 ) ) ( not ( = ?auto_358462 ?auto_358467 ) ) ( not ( = ?auto_358463 ?auto_358464 ) ) ( not ( = ?auto_358463 ?auto_358465 ) ) ( not ( = ?auto_358463 ?auto_358466 ) ) ( not ( = ?auto_358463 ?auto_358467 ) ) ( not ( = ?auto_358464 ?auto_358465 ) ) ( not ( = ?auto_358464 ?auto_358466 ) ) ( not ( = ?auto_358464 ?auto_358467 ) ) ( not ( = ?auto_358465 ?auto_358466 ) ) ( not ( = ?auto_358465 ?auto_358467 ) ) ( not ( = ?auto_358466 ?auto_358467 ) ) ( ON ?auto_358465 ?auto_358466 ) ( ON ?auto_358464 ?auto_358465 ) ( ON ?auto_358463 ?auto_358464 ) ( ON ?auto_358462 ?auto_358463 ) ( ON ?auto_358461 ?auto_358462 ) ( ON ?auto_358460 ?auto_358461 ) ( ON ?auto_358459 ?auto_358460 ) ( ON ?auto_358458 ?auto_358459 ) ( ON ?auto_358457 ?auto_358458 ) ( ON ?auto_358456 ?auto_358457 ) ( CLEAR ?auto_358456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_358456 )
      ( MAKE-11PILE ?auto_358456 ?auto_358457 ?auto_358458 ?auto_358459 ?auto_358460 ?auto_358461 ?auto_358462 ?auto_358463 ?auto_358464 ?auto_358465 ?auto_358466 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_358503 - BLOCK
      ?auto_358504 - BLOCK
      ?auto_358505 - BLOCK
      ?auto_358506 - BLOCK
      ?auto_358507 - BLOCK
      ?auto_358508 - BLOCK
      ?auto_358509 - BLOCK
      ?auto_358510 - BLOCK
      ?auto_358511 - BLOCK
      ?auto_358512 - BLOCK
      ?auto_358513 - BLOCK
      ?auto_358514 - BLOCK
    )
    :vars
    (
      ?auto_358515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_358513 ) ( ON ?auto_358514 ?auto_358515 ) ( CLEAR ?auto_358514 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_358503 ) ( ON ?auto_358504 ?auto_358503 ) ( ON ?auto_358505 ?auto_358504 ) ( ON ?auto_358506 ?auto_358505 ) ( ON ?auto_358507 ?auto_358506 ) ( ON ?auto_358508 ?auto_358507 ) ( ON ?auto_358509 ?auto_358508 ) ( ON ?auto_358510 ?auto_358509 ) ( ON ?auto_358511 ?auto_358510 ) ( ON ?auto_358512 ?auto_358511 ) ( ON ?auto_358513 ?auto_358512 ) ( not ( = ?auto_358503 ?auto_358504 ) ) ( not ( = ?auto_358503 ?auto_358505 ) ) ( not ( = ?auto_358503 ?auto_358506 ) ) ( not ( = ?auto_358503 ?auto_358507 ) ) ( not ( = ?auto_358503 ?auto_358508 ) ) ( not ( = ?auto_358503 ?auto_358509 ) ) ( not ( = ?auto_358503 ?auto_358510 ) ) ( not ( = ?auto_358503 ?auto_358511 ) ) ( not ( = ?auto_358503 ?auto_358512 ) ) ( not ( = ?auto_358503 ?auto_358513 ) ) ( not ( = ?auto_358503 ?auto_358514 ) ) ( not ( = ?auto_358503 ?auto_358515 ) ) ( not ( = ?auto_358504 ?auto_358505 ) ) ( not ( = ?auto_358504 ?auto_358506 ) ) ( not ( = ?auto_358504 ?auto_358507 ) ) ( not ( = ?auto_358504 ?auto_358508 ) ) ( not ( = ?auto_358504 ?auto_358509 ) ) ( not ( = ?auto_358504 ?auto_358510 ) ) ( not ( = ?auto_358504 ?auto_358511 ) ) ( not ( = ?auto_358504 ?auto_358512 ) ) ( not ( = ?auto_358504 ?auto_358513 ) ) ( not ( = ?auto_358504 ?auto_358514 ) ) ( not ( = ?auto_358504 ?auto_358515 ) ) ( not ( = ?auto_358505 ?auto_358506 ) ) ( not ( = ?auto_358505 ?auto_358507 ) ) ( not ( = ?auto_358505 ?auto_358508 ) ) ( not ( = ?auto_358505 ?auto_358509 ) ) ( not ( = ?auto_358505 ?auto_358510 ) ) ( not ( = ?auto_358505 ?auto_358511 ) ) ( not ( = ?auto_358505 ?auto_358512 ) ) ( not ( = ?auto_358505 ?auto_358513 ) ) ( not ( = ?auto_358505 ?auto_358514 ) ) ( not ( = ?auto_358505 ?auto_358515 ) ) ( not ( = ?auto_358506 ?auto_358507 ) ) ( not ( = ?auto_358506 ?auto_358508 ) ) ( not ( = ?auto_358506 ?auto_358509 ) ) ( not ( = ?auto_358506 ?auto_358510 ) ) ( not ( = ?auto_358506 ?auto_358511 ) ) ( not ( = ?auto_358506 ?auto_358512 ) ) ( not ( = ?auto_358506 ?auto_358513 ) ) ( not ( = ?auto_358506 ?auto_358514 ) ) ( not ( = ?auto_358506 ?auto_358515 ) ) ( not ( = ?auto_358507 ?auto_358508 ) ) ( not ( = ?auto_358507 ?auto_358509 ) ) ( not ( = ?auto_358507 ?auto_358510 ) ) ( not ( = ?auto_358507 ?auto_358511 ) ) ( not ( = ?auto_358507 ?auto_358512 ) ) ( not ( = ?auto_358507 ?auto_358513 ) ) ( not ( = ?auto_358507 ?auto_358514 ) ) ( not ( = ?auto_358507 ?auto_358515 ) ) ( not ( = ?auto_358508 ?auto_358509 ) ) ( not ( = ?auto_358508 ?auto_358510 ) ) ( not ( = ?auto_358508 ?auto_358511 ) ) ( not ( = ?auto_358508 ?auto_358512 ) ) ( not ( = ?auto_358508 ?auto_358513 ) ) ( not ( = ?auto_358508 ?auto_358514 ) ) ( not ( = ?auto_358508 ?auto_358515 ) ) ( not ( = ?auto_358509 ?auto_358510 ) ) ( not ( = ?auto_358509 ?auto_358511 ) ) ( not ( = ?auto_358509 ?auto_358512 ) ) ( not ( = ?auto_358509 ?auto_358513 ) ) ( not ( = ?auto_358509 ?auto_358514 ) ) ( not ( = ?auto_358509 ?auto_358515 ) ) ( not ( = ?auto_358510 ?auto_358511 ) ) ( not ( = ?auto_358510 ?auto_358512 ) ) ( not ( = ?auto_358510 ?auto_358513 ) ) ( not ( = ?auto_358510 ?auto_358514 ) ) ( not ( = ?auto_358510 ?auto_358515 ) ) ( not ( = ?auto_358511 ?auto_358512 ) ) ( not ( = ?auto_358511 ?auto_358513 ) ) ( not ( = ?auto_358511 ?auto_358514 ) ) ( not ( = ?auto_358511 ?auto_358515 ) ) ( not ( = ?auto_358512 ?auto_358513 ) ) ( not ( = ?auto_358512 ?auto_358514 ) ) ( not ( = ?auto_358512 ?auto_358515 ) ) ( not ( = ?auto_358513 ?auto_358514 ) ) ( not ( = ?auto_358513 ?auto_358515 ) ) ( not ( = ?auto_358514 ?auto_358515 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_358514 ?auto_358515 )
      ( !STACK ?auto_358514 ?auto_358513 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_358553 - BLOCK
      ?auto_358554 - BLOCK
      ?auto_358555 - BLOCK
      ?auto_358556 - BLOCK
      ?auto_358557 - BLOCK
      ?auto_358558 - BLOCK
      ?auto_358559 - BLOCK
      ?auto_358560 - BLOCK
      ?auto_358561 - BLOCK
      ?auto_358562 - BLOCK
      ?auto_358563 - BLOCK
      ?auto_358564 - BLOCK
    )
    :vars
    (
      ?auto_358565 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358564 ?auto_358565 ) ( ON-TABLE ?auto_358553 ) ( ON ?auto_358554 ?auto_358553 ) ( ON ?auto_358555 ?auto_358554 ) ( ON ?auto_358556 ?auto_358555 ) ( ON ?auto_358557 ?auto_358556 ) ( ON ?auto_358558 ?auto_358557 ) ( ON ?auto_358559 ?auto_358558 ) ( ON ?auto_358560 ?auto_358559 ) ( ON ?auto_358561 ?auto_358560 ) ( ON ?auto_358562 ?auto_358561 ) ( not ( = ?auto_358553 ?auto_358554 ) ) ( not ( = ?auto_358553 ?auto_358555 ) ) ( not ( = ?auto_358553 ?auto_358556 ) ) ( not ( = ?auto_358553 ?auto_358557 ) ) ( not ( = ?auto_358553 ?auto_358558 ) ) ( not ( = ?auto_358553 ?auto_358559 ) ) ( not ( = ?auto_358553 ?auto_358560 ) ) ( not ( = ?auto_358553 ?auto_358561 ) ) ( not ( = ?auto_358553 ?auto_358562 ) ) ( not ( = ?auto_358553 ?auto_358563 ) ) ( not ( = ?auto_358553 ?auto_358564 ) ) ( not ( = ?auto_358553 ?auto_358565 ) ) ( not ( = ?auto_358554 ?auto_358555 ) ) ( not ( = ?auto_358554 ?auto_358556 ) ) ( not ( = ?auto_358554 ?auto_358557 ) ) ( not ( = ?auto_358554 ?auto_358558 ) ) ( not ( = ?auto_358554 ?auto_358559 ) ) ( not ( = ?auto_358554 ?auto_358560 ) ) ( not ( = ?auto_358554 ?auto_358561 ) ) ( not ( = ?auto_358554 ?auto_358562 ) ) ( not ( = ?auto_358554 ?auto_358563 ) ) ( not ( = ?auto_358554 ?auto_358564 ) ) ( not ( = ?auto_358554 ?auto_358565 ) ) ( not ( = ?auto_358555 ?auto_358556 ) ) ( not ( = ?auto_358555 ?auto_358557 ) ) ( not ( = ?auto_358555 ?auto_358558 ) ) ( not ( = ?auto_358555 ?auto_358559 ) ) ( not ( = ?auto_358555 ?auto_358560 ) ) ( not ( = ?auto_358555 ?auto_358561 ) ) ( not ( = ?auto_358555 ?auto_358562 ) ) ( not ( = ?auto_358555 ?auto_358563 ) ) ( not ( = ?auto_358555 ?auto_358564 ) ) ( not ( = ?auto_358555 ?auto_358565 ) ) ( not ( = ?auto_358556 ?auto_358557 ) ) ( not ( = ?auto_358556 ?auto_358558 ) ) ( not ( = ?auto_358556 ?auto_358559 ) ) ( not ( = ?auto_358556 ?auto_358560 ) ) ( not ( = ?auto_358556 ?auto_358561 ) ) ( not ( = ?auto_358556 ?auto_358562 ) ) ( not ( = ?auto_358556 ?auto_358563 ) ) ( not ( = ?auto_358556 ?auto_358564 ) ) ( not ( = ?auto_358556 ?auto_358565 ) ) ( not ( = ?auto_358557 ?auto_358558 ) ) ( not ( = ?auto_358557 ?auto_358559 ) ) ( not ( = ?auto_358557 ?auto_358560 ) ) ( not ( = ?auto_358557 ?auto_358561 ) ) ( not ( = ?auto_358557 ?auto_358562 ) ) ( not ( = ?auto_358557 ?auto_358563 ) ) ( not ( = ?auto_358557 ?auto_358564 ) ) ( not ( = ?auto_358557 ?auto_358565 ) ) ( not ( = ?auto_358558 ?auto_358559 ) ) ( not ( = ?auto_358558 ?auto_358560 ) ) ( not ( = ?auto_358558 ?auto_358561 ) ) ( not ( = ?auto_358558 ?auto_358562 ) ) ( not ( = ?auto_358558 ?auto_358563 ) ) ( not ( = ?auto_358558 ?auto_358564 ) ) ( not ( = ?auto_358558 ?auto_358565 ) ) ( not ( = ?auto_358559 ?auto_358560 ) ) ( not ( = ?auto_358559 ?auto_358561 ) ) ( not ( = ?auto_358559 ?auto_358562 ) ) ( not ( = ?auto_358559 ?auto_358563 ) ) ( not ( = ?auto_358559 ?auto_358564 ) ) ( not ( = ?auto_358559 ?auto_358565 ) ) ( not ( = ?auto_358560 ?auto_358561 ) ) ( not ( = ?auto_358560 ?auto_358562 ) ) ( not ( = ?auto_358560 ?auto_358563 ) ) ( not ( = ?auto_358560 ?auto_358564 ) ) ( not ( = ?auto_358560 ?auto_358565 ) ) ( not ( = ?auto_358561 ?auto_358562 ) ) ( not ( = ?auto_358561 ?auto_358563 ) ) ( not ( = ?auto_358561 ?auto_358564 ) ) ( not ( = ?auto_358561 ?auto_358565 ) ) ( not ( = ?auto_358562 ?auto_358563 ) ) ( not ( = ?auto_358562 ?auto_358564 ) ) ( not ( = ?auto_358562 ?auto_358565 ) ) ( not ( = ?auto_358563 ?auto_358564 ) ) ( not ( = ?auto_358563 ?auto_358565 ) ) ( not ( = ?auto_358564 ?auto_358565 ) ) ( CLEAR ?auto_358562 ) ( ON ?auto_358563 ?auto_358564 ) ( CLEAR ?auto_358563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_358553 ?auto_358554 ?auto_358555 ?auto_358556 ?auto_358557 ?auto_358558 ?auto_358559 ?auto_358560 ?auto_358561 ?auto_358562 ?auto_358563 )
      ( MAKE-12PILE ?auto_358553 ?auto_358554 ?auto_358555 ?auto_358556 ?auto_358557 ?auto_358558 ?auto_358559 ?auto_358560 ?auto_358561 ?auto_358562 ?auto_358563 ?auto_358564 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_358603 - BLOCK
      ?auto_358604 - BLOCK
      ?auto_358605 - BLOCK
      ?auto_358606 - BLOCK
      ?auto_358607 - BLOCK
      ?auto_358608 - BLOCK
      ?auto_358609 - BLOCK
      ?auto_358610 - BLOCK
      ?auto_358611 - BLOCK
      ?auto_358612 - BLOCK
      ?auto_358613 - BLOCK
      ?auto_358614 - BLOCK
    )
    :vars
    (
      ?auto_358615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358614 ?auto_358615 ) ( ON-TABLE ?auto_358603 ) ( ON ?auto_358604 ?auto_358603 ) ( ON ?auto_358605 ?auto_358604 ) ( ON ?auto_358606 ?auto_358605 ) ( ON ?auto_358607 ?auto_358606 ) ( ON ?auto_358608 ?auto_358607 ) ( ON ?auto_358609 ?auto_358608 ) ( ON ?auto_358610 ?auto_358609 ) ( ON ?auto_358611 ?auto_358610 ) ( not ( = ?auto_358603 ?auto_358604 ) ) ( not ( = ?auto_358603 ?auto_358605 ) ) ( not ( = ?auto_358603 ?auto_358606 ) ) ( not ( = ?auto_358603 ?auto_358607 ) ) ( not ( = ?auto_358603 ?auto_358608 ) ) ( not ( = ?auto_358603 ?auto_358609 ) ) ( not ( = ?auto_358603 ?auto_358610 ) ) ( not ( = ?auto_358603 ?auto_358611 ) ) ( not ( = ?auto_358603 ?auto_358612 ) ) ( not ( = ?auto_358603 ?auto_358613 ) ) ( not ( = ?auto_358603 ?auto_358614 ) ) ( not ( = ?auto_358603 ?auto_358615 ) ) ( not ( = ?auto_358604 ?auto_358605 ) ) ( not ( = ?auto_358604 ?auto_358606 ) ) ( not ( = ?auto_358604 ?auto_358607 ) ) ( not ( = ?auto_358604 ?auto_358608 ) ) ( not ( = ?auto_358604 ?auto_358609 ) ) ( not ( = ?auto_358604 ?auto_358610 ) ) ( not ( = ?auto_358604 ?auto_358611 ) ) ( not ( = ?auto_358604 ?auto_358612 ) ) ( not ( = ?auto_358604 ?auto_358613 ) ) ( not ( = ?auto_358604 ?auto_358614 ) ) ( not ( = ?auto_358604 ?auto_358615 ) ) ( not ( = ?auto_358605 ?auto_358606 ) ) ( not ( = ?auto_358605 ?auto_358607 ) ) ( not ( = ?auto_358605 ?auto_358608 ) ) ( not ( = ?auto_358605 ?auto_358609 ) ) ( not ( = ?auto_358605 ?auto_358610 ) ) ( not ( = ?auto_358605 ?auto_358611 ) ) ( not ( = ?auto_358605 ?auto_358612 ) ) ( not ( = ?auto_358605 ?auto_358613 ) ) ( not ( = ?auto_358605 ?auto_358614 ) ) ( not ( = ?auto_358605 ?auto_358615 ) ) ( not ( = ?auto_358606 ?auto_358607 ) ) ( not ( = ?auto_358606 ?auto_358608 ) ) ( not ( = ?auto_358606 ?auto_358609 ) ) ( not ( = ?auto_358606 ?auto_358610 ) ) ( not ( = ?auto_358606 ?auto_358611 ) ) ( not ( = ?auto_358606 ?auto_358612 ) ) ( not ( = ?auto_358606 ?auto_358613 ) ) ( not ( = ?auto_358606 ?auto_358614 ) ) ( not ( = ?auto_358606 ?auto_358615 ) ) ( not ( = ?auto_358607 ?auto_358608 ) ) ( not ( = ?auto_358607 ?auto_358609 ) ) ( not ( = ?auto_358607 ?auto_358610 ) ) ( not ( = ?auto_358607 ?auto_358611 ) ) ( not ( = ?auto_358607 ?auto_358612 ) ) ( not ( = ?auto_358607 ?auto_358613 ) ) ( not ( = ?auto_358607 ?auto_358614 ) ) ( not ( = ?auto_358607 ?auto_358615 ) ) ( not ( = ?auto_358608 ?auto_358609 ) ) ( not ( = ?auto_358608 ?auto_358610 ) ) ( not ( = ?auto_358608 ?auto_358611 ) ) ( not ( = ?auto_358608 ?auto_358612 ) ) ( not ( = ?auto_358608 ?auto_358613 ) ) ( not ( = ?auto_358608 ?auto_358614 ) ) ( not ( = ?auto_358608 ?auto_358615 ) ) ( not ( = ?auto_358609 ?auto_358610 ) ) ( not ( = ?auto_358609 ?auto_358611 ) ) ( not ( = ?auto_358609 ?auto_358612 ) ) ( not ( = ?auto_358609 ?auto_358613 ) ) ( not ( = ?auto_358609 ?auto_358614 ) ) ( not ( = ?auto_358609 ?auto_358615 ) ) ( not ( = ?auto_358610 ?auto_358611 ) ) ( not ( = ?auto_358610 ?auto_358612 ) ) ( not ( = ?auto_358610 ?auto_358613 ) ) ( not ( = ?auto_358610 ?auto_358614 ) ) ( not ( = ?auto_358610 ?auto_358615 ) ) ( not ( = ?auto_358611 ?auto_358612 ) ) ( not ( = ?auto_358611 ?auto_358613 ) ) ( not ( = ?auto_358611 ?auto_358614 ) ) ( not ( = ?auto_358611 ?auto_358615 ) ) ( not ( = ?auto_358612 ?auto_358613 ) ) ( not ( = ?auto_358612 ?auto_358614 ) ) ( not ( = ?auto_358612 ?auto_358615 ) ) ( not ( = ?auto_358613 ?auto_358614 ) ) ( not ( = ?auto_358613 ?auto_358615 ) ) ( not ( = ?auto_358614 ?auto_358615 ) ) ( ON ?auto_358613 ?auto_358614 ) ( CLEAR ?auto_358611 ) ( ON ?auto_358612 ?auto_358613 ) ( CLEAR ?auto_358612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_358603 ?auto_358604 ?auto_358605 ?auto_358606 ?auto_358607 ?auto_358608 ?auto_358609 ?auto_358610 ?auto_358611 ?auto_358612 )
      ( MAKE-12PILE ?auto_358603 ?auto_358604 ?auto_358605 ?auto_358606 ?auto_358607 ?auto_358608 ?auto_358609 ?auto_358610 ?auto_358611 ?auto_358612 ?auto_358613 ?auto_358614 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_358653 - BLOCK
      ?auto_358654 - BLOCK
      ?auto_358655 - BLOCK
      ?auto_358656 - BLOCK
      ?auto_358657 - BLOCK
      ?auto_358658 - BLOCK
      ?auto_358659 - BLOCK
      ?auto_358660 - BLOCK
      ?auto_358661 - BLOCK
      ?auto_358662 - BLOCK
      ?auto_358663 - BLOCK
      ?auto_358664 - BLOCK
    )
    :vars
    (
      ?auto_358665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358664 ?auto_358665 ) ( ON-TABLE ?auto_358653 ) ( ON ?auto_358654 ?auto_358653 ) ( ON ?auto_358655 ?auto_358654 ) ( ON ?auto_358656 ?auto_358655 ) ( ON ?auto_358657 ?auto_358656 ) ( ON ?auto_358658 ?auto_358657 ) ( ON ?auto_358659 ?auto_358658 ) ( ON ?auto_358660 ?auto_358659 ) ( not ( = ?auto_358653 ?auto_358654 ) ) ( not ( = ?auto_358653 ?auto_358655 ) ) ( not ( = ?auto_358653 ?auto_358656 ) ) ( not ( = ?auto_358653 ?auto_358657 ) ) ( not ( = ?auto_358653 ?auto_358658 ) ) ( not ( = ?auto_358653 ?auto_358659 ) ) ( not ( = ?auto_358653 ?auto_358660 ) ) ( not ( = ?auto_358653 ?auto_358661 ) ) ( not ( = ?auto_358653 ?auto_358662 ) ) ( not ( = ?auto_358653 ?auto_358663 ) ) ( not ( = ?auto_358653 ?auto_358664 ) ) ( not ( = ?auto_358653 ?auto_358665 ) ) ( not ( = ?auto_358654 ?auto_358655 ) ) ( not ( = ?auto_358654 ?auto_358656 ) ) ( not ( = ?auto_358654 ?auto_358657 ) ) ( not ( = ?auto_358654 ?auto_358658 ) ) ( not ( = ?auto_358654 ?auto_358659 ) ) ( not ( = ?auto_358654 ?auto_358660 ) ) ( not ( = ?auto_358654 ?auto_358661 ) ) ( not ( = ?auto_358654 ?auto_358662 ) ) ( not ( = ?auto_358654 ?auto_358663 ) ) ( not ( = ?auto_358654 ?auto_358664 ) ) ( not ( = ?auto_358654 ?auto_358665 ) ) ( not ( = ?auto_358655 ?auto_358656 ) ) ( not ( = ?auto_358655 ?auto_358657 ) ) ( not ( = ?auto_358655 ?auto_358658 ) ) ( not ( = ?auto_358655 ?auto_358659 ) ) ( not ( = ?auto_358655 ?auto_358660 ) ) ( not ( = ?auto_358655 ?auto_358661 ) ) ( not ( = ?auto_358655 ?auto_358662 ) ) ( not ( = ?auto_358655 ?auto_358663 ) ) ( not ( = ?auto_358655 ?auto_358664 ) ) ( not ( = ?auto_358655 ?auto_358665 ) ) ( not ( = ?auto_358656 ?auto_358657 ) ) ( not ( = ?auto_358656 ?auto_358658 ) ) ( not ( = ?auto_358656 ?auto_358659 ) ) ( not ( = ?auto_358656 ?auto_358660 ) ) ( not ( = ?auto_358656 ?auto_358661 ) ) ( not ( = ?auto_358656 ?auto_358662 ) ) ( not ( = ?auto_358656 ?auto_358663 ) ) ( not ( = ?auto_358656 ?auto_358664 ) ) ( not ( = ?auto_358656 ?auto_358665 ) ) ( not ( = ?auto_358657 ?auto_358658 ) ) ( not ( = ?auto_358657 ?auto_358659 ) ) ( not ( = ?auto_358657 ?auto_358660 ) ) ( not ( = ?auto_358657 ?auto_358661 ) ) ( not ( = ?auto_358657 ?auto_358662 ) ) ( not ( = ?auto_358657 ?auto_358663 ) ) ( not ( = ?auto_358657 ?auto_358664 ) ) ( not ( = ?auto_358657 ?auto_358665 ) ) ( not ( = ?auto_358658 ?auto_358659 ) ) ( not ( = ?auto_358658 ?auto_358660 ) ) ( not ( = ?auto_358658 ?auto_358661 ) ) ( not ( = ?auto_358658 ?auto_358662 ) ) ( not ( = ?auto_358658 ?auto_358663 ) ) ( not ( = ?auto_358658 ?auto_358664 ) ) ( not ( = ?auto_358658 ?auto_358665 ) ) ( not ( = ?auto_358659 ?auto_358660 ) ) ( not ( = ?auto_358659 ?auto_358661 ) ) ( not ( = ?auto_358659 ?auto_358662 ) ) ( not ( = ?auto_358659 ?auto_358663 ) ) ( not ( = ?auto_358659 ?auto_358664 ) ) ( not ( = ?auto_358659 ?auto_358665 ) ) ( not ( = ?auto_358660 ?auto_358661 ) ) ( not ( = ?auto_358660 ?auto_358662 ) ) ( not ( = ?auto_358660 ?auto_358663 ) ) ( not ( = ?auto_358660 ?auto_358664 ) ) ( not ( = ?auto_358660 ?auto_358665 ) ) ( not ( = ?auto_358661 ?auto_358662 ) ) ( not ( = ?auto_358661 ?auto_358663 ) ) ( not ( = ?auto_358661 ?auto_358664 ) ) ( not ( = ?auto_358661 ?auto_358665 ) ) ( not ( = ?auto_358662 ?auto_358663 ) ) ( not ( = ?auto_358662 ?auto_358664 ) ) ( not ( = ?auto_358662 ?auto_358665 ) ) ( not ( = ?auto_358663 ?auto_358664 ) ) ( not ( = ?auto_358663 ?auto_358665 ) ) ( not ( = ?auto_358664 ?auto_358665 ) ) ( ON ?auto_358663 ?auto_358664 ) ( ON ?auto_358662 ?auto_358663 ) ( CLEAR ?auto_358660 ) ( ON ?auto_358661 ?auto_358662 ) ( CLEAR ?auto_358661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_358653 ?auto_358654 ?auto_358655 ?auto_358656 ?auto_358657 ?auto_358658 ?auto_358659 ?auto_358660 ?auto_358661 )
      ( MAKE-12PILE ?auto_358653 ?auto_358654 ?auto_358655 ?auto_358656 ?auto_358657 ?auto_358658 ?auto_358659 ?auto_358660 ?auto_358661 ?auto_358662 ?auto_358663 ?auto_358664 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_358703 - BLOCK
      ?auto_358704 - BLOCK
      ?auto_358705 - BLOCK
      ?auto_358706 - BLOCK
      ?auto_358707 - BLOCK
      ?auto_358708 - BLOCK
      ?auto_358709 - BLOCK
      ?auto_358710 - BLOCK
      ?auto_358711 - BLOCK
      ?auto_358712 - BLOCK
      ?auto_358713 - BLOCK
      ?auto_358714 - BLOCK
    )
    :vars
    (
      ?auto_358715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358714 ?auto_358715 ) ( ON-TABLE ?auto_358703 ) ( ON ?auto_358704 ?auto_358703 ) ( ON ?auto_358705 ?auto_358704 ) ( ON ?auto_358706 ?auto_358705 ) ( ON ?auto_358707 ?auto_358706 ) ( ON ?auto_358708 ?auto_358707 ) ( ON ?auto_358709 ?auto_358708 ) ( not ( = ?auto_358703 ?auto_358704 ) ) ( not ( = ?auto_358703 ?auto_358705 ) ) ( not ( = ?auto_358703 ?auto_358706 ) ) ( not ( = ?auto_358703 ?auto_358707 ) ) ( not ( = ?auto_358703 ?auto_358708 ) ) ( not ( = ?auto_358703 ?auto_358709 ) ) ( not ( = ?auto_358703 ?auto_358710 ) ) ( not ( = ?auto_358703 ?auto_358711 ) ) ( not ( = ?auto_358703 ?auto_358712 ) ) ( not ( = ?auto_358703 ?auto_358713 ) ) ( not ( = ?auto_358703 ?auto_358714 ) ) ( not ( = ?auto_358703 ?auto_358715 ) ) ( not ( = ?auto_358704 ?auto_358705 ) ) ( not ( = ?auto_358704 ?auto_358706 ) ) ( not ( = ?auto_358704 ?auto_358707 ) ) ( not ( = ?auto_358704 ?auto_358708 ) ) ( not ( = ?auto_358704 ?auto_358709 ) ) ( not ( = ?auto_358704 ?auto_358710 ) ) ( not ( = ?auto_358704 ?auto_358711 ) ) ( not ( = ?auto_358704 ?auto_358712 ) ) ( not ( = ?auto_358704 ?auto_358713 ) ) ( not ( = ?auto_358704 ?auto_358714 ) ) ( not ( = ?auto_358704 ?auto_358715 ) ) ( not ( = ?auto_358705 ?auto_358706 ) ) ( not ( = ?auto_358705 ?auto_358707 ) ) ( not ( = ?auto_358705 ?auto_358708 ) ) ( not ( = ?auto_358705 ?auto_358709 ) ) ( not ( = ?auto_358705 ?auto_358710 ) ) ( not ( = ?auto_358705 ?auto_358711 ) ) ( not ( = ?auto_358705 ?auto_358712 ) ) ( not ( = ?auto_358705 ?auto_358713 ) ) ( not ( = ?auto_358705 ?auto_358714 ) ) ( not ( = ?auto_358705 ?auto_358715 ) ) ( not ( = ?auto_358706 ?auto_358707 ) ) ( not ( = ?auto_358706 ?auto_358708 ) ) ( not ( = ?auto_358706 ?auto_358709 ) ) ( not ( = ?auto_358706 ?auto_358710 ) ) ( not ( = ?auto_358706 ?auto_358711 ) ) ( not ( = ?auto_358706 ?auto_358712 ) ) ( not ( = ?auto_358706 ?auto_358713 ) ) ( not ( = ?auto_358706 ?auto_358714 ) ) ( not ( = ?auto_358706 ?auto_358715 ) ) ( not ( = ?auto_358707 ?auto_358708 ) ) ( not ( = ?auto_358707 ?auto_358709 ) ) ( not ( = ?auto_358707 ?auto_358710 ) ) ( not ( = ?auto_358707 ?auto_358711 ) ) ( not ( = ?auto_358707 ?auto_358712 ) ) ( not ( = ?auto_358707 ?auto_358713 ) ) ( not ( = ?auto_358707 ?auto_358714 ) ) ( not ( = ?auto_358707 ?auto_358715 ) ) ( not ( = ?auto_358708 ?auto_358709 ) ) ( not ( = ?auto_358708 ?auto_358710 ) ) ( not ( = ?auto_358708 ?auto_358711 ) ) ( not ( = ?auto_358708 ?auto_358712 ) ) ( not ( = ?auto_358708 ?auto_358713 ) ) ( not ( = ?auto_358708 ?auto_358714 ) ) ( not ( = ?auto_358708 ?auto_358715 ) ) ( not ( = ?auto_358709 ?auto_358710 ) ) ( not ( = ?auto_358709 ?auto_358711 ) ) ( not ( = ?auto_358709 ?auto_358712 ) ) ( not ( = ?auto_358709 ?auto_358713 ) ) ( not ( = ?auto_358709 ?auto_358714 ) ) ( not ( = ?auto_358709 ?auto_358715 ) ) ( not ( = ?auto_358710 ?auto_358711 ) ) ( not ( = ?auto_358710 ?auto_358712 ) ) ( not ( = ?auto_358710 ?auto_358713 ) ) ( not ( = ?auto_358710 ?auto_358714 ) ) ( not ( = ?auto_358710 ?auto_358715 ) ) ( not ( = ?auto_358711 ?auto_358712 ) ) ( not ( = ?auto_358711 ?auto_358713 ) ) ( not ( = ?auto_358711 ?auto_358714 ) ) ( not ( = ?auto_358711 ?auto_358715 ) ) ( not ( = ?auto_358712 ?auto_358713 ) ) ( not ( = ?auto_358712 ?auto_358714 ) ) ( not ( = ?auto_358712 ?auto_358715 ) ) ( not ( = ?auto_358713 ?auto_358714 ) ) ( not ( = ?auto_358713 ?auto_358715 ) ) ( not ( = ?auto_358714 ?auto_358715 ) ) ( ON ?auto_358713 ?auto_358714 ) ( ON ?auto_358712 ?auto_358713 ) ( ON ?auto_358711 ?auto_358712 ) ( CLEAR ?auto_358709 ) ( ON ?auto_358710 ?auto_358711 ) ( CLEAR ?auto_358710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_358703 ?auto_358704 ?auto_358705 ?auto_358706 ?auto_358707 ?auto_358708 ?auto_358709 ?auto_358710 )
      ( MAKE-12PILE ?auto_358703 ?auto_358704 ?auto_358705 ?auto_358706 ?auto_358707 ?auto_358708 ?auto_358709 ?auto_358710 ?auto_358711 ?auto_358712 ?auto_358713 ?auto_358714 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_358753 - BLOCK
      ?auto_358754 - BLOCK
      ?auto_358755 - BLOCK
      ?auto_358756 - BLOCK
      ?auto_358757 - BLOCK
      ?auto_358758 - BLOCK
      ?auto_358759 - BLOCK
      ?auto_358760 - BLOCK
      ?auto_358761 - BLOCK
      ?auto_358762 - BLOCK
      ?auto_358763 - BLOCK
      ?auto_358764 - BLOCK
    )
    :vars
    (
      ?auto_358765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358764 ?auto_358765 ) ( ON-TABLE ?auto_358753 ) ( ON ?auto_358754 ?auto_358753 ) ( ON ?auto_358755 ?auto_358754 ) ( ON ?auto_358756 ?auto_358755 ) ( ON ?auto_358757 ?auto_358756 ) ( ON ?auto_358758 ?auto_358757 ) ( not ( = ?auto_358753 ?auto_358754 ) ) ( not ( = ?auto_358753 ?auto_358755 ) ) ( not ( = ?auto_358753 ?auto_358756 ) ) ( not ( = ?auto_358753 ?auto_358757 ) ) ( not ( = ?auto_358753 ?auto_358758 ) ) ( not ( = ?auto_358753 ?auto_358759 ) ) ( not ( = ?auto_358753 ?auto_358760 ) ) ( not ( = ?auto_358753 ?auto_358761 ) ) ( not ( = ?auto_358753 ?auto_358762 ) ) ( not ( = ?auto_358753 ?auto_358763 ) ) ( not ( = ?auto_358753 ?auto_358764 ) ) ( not ( = ?auto_358753 ?auto_358765 ) ) ( not ( = ?auto_358754 ?auto_358755 ) ) ( not ( = ?auto_358754 ?auto_358756 ) ) ( not ( = ?auto_358754 ?auto_358757 ) ) ( not ( = ?auto_358754 ?auto_358758 ) ) ( not ( = ?auto_358754 ?auto_358759 ) ) ( not ( = ?auto_358754 ?auto_358760 ) ) ( not ( = ?auto_358754 ?auto_358761 ) ) ( not ( = ?auto_358754 ?auto_358762 ) ) ( not ( = ?auto_358754 ?auto_358763 ) ) ( not ( = ?auto_358754 ?auto_358764 ) ) ( not ( = ?auto_358754 ?auto_358765 ) ) ( not ( = ?auto_358755 ?auto_358756 ) ) ( not ( = ?auto_358755 ?auto_358757 ) ) ( not ( = ?auto_358755 ?auto_358758 ) ) ( not ( = ?auto_358755 ?auto_358759 ) ) ( not ( = ?auto_358755 ?auto_358760 ) ) ( not ( = ?auto_358755 ?auto_358761 ) ) ( not ( = ?auto_358755 ?auto_358762 ) ) ( not ( = ?auto_358755 ?auto_358763 ) ) ( not ( = ?auto_358755 ?auto_358764 ) ) ( not ( = ?auto_358755 ?auto_358765 ) ) ( not ( = ?auto_358756 ?auto_358757 ) ) ( not ( = ?auto_358756 ?auto_358758 ) ) ( not ( = ?auto_358756 ?auto_358759 ) ) ( not ( = ?auto_358756 ?auto_358760 ) ) ( not ( = ?auto_358756 ?auto_358761 ) ) ( not ( = ?auto_358756 ?auto_358762 ) ) ( not ( = ?auto_358756 ?auto_358763 ) ) ( not ( = ?auto_358756 ?auto_358764 ) ) ( not ( = ?auto_358756 ?auto_358765 ) ) ( not ( = ?auto_358757 ?auto_358758 ) ) ( not ( = ?auto_358757 ?auto_358759 ) ) ( not ( = ?auto_358757 ?auto_358760 ) ) ( not ( = ?auto_358757 ?auto_358761 ) ) ( not ( = ?auto_358757 ?auto_358762 ) ) ( not ( = ?auto_358757 ?auto_358763 ) ) ( not ( = ?auto_358757 ?auto_358764 ) ) ( not ( = ?auto_358757 ?auto_358765 ) ) ( not ( = ?auto_358758 ?auto_358759 ) ) ( not ( = ?auto_358758 ?auto_358760 ) ) ( not ( = ?auto_358758 ?auto_358761 ) ) ( not ( = ?auto_358758 ?auto_358762 ) ) ( not ( = ?auto_358758 ?auto_358763 ) ) ( not ( = ?auto_358758 ?auto_358764 ) ) ( not ( = ?auto_358758 ?auto_358765 ) ) ( not ( = ?auto_358759 ?auto_358760 ) ) ( not ( = ?auto_358759 ?auto_358761 ) ) ( not ( = ?auto_358759 ?auto_358762 ) ) ( not ( = ?auto_358759 ?auto_358763 ) ) ( not ( = ?auto_358759 ?auto_358764 ) ) ( not ( = ?auto_358759 ?auto_358765 ) ) ( not ( = ?auto_358760 ?auto_358761 ) ) ( not ( = ?auto_358760 ?auto_358762 ) ) ( not ( = ?auto_358760 ?auto_358763 ) ) ( not ( = ?auto_358760 ?auto_358764 ) ) ( not ( = ?auto_358760 ?auto_358765 ) ) ( not ( = ?auto_358761 ?auto_358762 ) ) ( not ( = ?auto_358761 ?auto_358763 ) ) ( not ( = ?auto_358761 ?auto_358764 ) ) ( not ( = ?auto_358761 ?auto_358765 ) ) ( not ( = ?auto_358762 ?auto_358763 ) ) ( not ( = ?auto_358762 ?auto_358764 ) ) ( not ( = ?auto_358762 ?auto_358765 ) ) ( not ( = ?auto_358763 ?auto_358764 ) ) ( not ( = ?auto_358763 ?auto_358765 ) ) ( not ( = ?auto_358764 ?auto_358765 ) ) ( ON ?auto_358763 ?auto_358764 ) ( ON ?auto_358762 ?auto_358763 ) ( ON ?auto_358761 ?auto_358762 ) ( ON ?auto_358760 ?auto_358761 ) ( CLEAR ?auto_358758 ) ( ON ?auto_358759 ?auto_358760 ) ( CLEAR ?auto_358759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_358753 ?auto_358754 ?auto_358755 ?auto_358756 ?auto_358757 ?auto_358758 ?auto_358759 )
      ( MAKE-12PILE ?auto_358753 ?auto_358754 ?auto_358755 ?auto_358756 ?auto_358757 ?auto_358758 ?auto_358759 ?auto_358760 ?auto_358761 ?auto_358762 ?auto_358763 ?auto_358764 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_358803 - BLOCK
      ?auto_358804 - BLOCK
      ?auto_358805 - BLOCK
      ?auto_358806 - BLOCK
      ?auto_358807 - BLOCK
      ?auto_358808 - BLOCK
      ?auto_358809 - BLOCK
      ?auto_358810 - BLOCK
      ?auto_358811 - BLOCK
      ?auto_358812 - BLOCK
      ?auto_358813 - BLOCK
      ?auto_358814 - BLOCK
    )
    :vars
    (
      ?auto_358815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358814 ?auto_358815 ) ( ON-TABLE ?auto_358803 ) ( ON ?auto_358804 ?auto_358803 ) ( ON ?auto_358805 ?auto_358804 ) ( ON ?auto_358806 ?auto_358805 ) ( ON ?auto_358807 ?auto_358806 ) ( not ( = ?auto_358803 ?auto_358804 ) ) ( not ( = ?auto_358803 ?auto_358805 ) ) ( not ( = ?auto_358803 ?auto_358806 ) ) ( not ( = ?auto_358803 ?auto_358807 ) ) ( not ( = ?auto_358803 ?auto_358808 ) ) ( not ( = ?auto_358803 ?auto_358809 ) ) ( not ( = ?auto_358803 ?auto_358810 ) ) ( not ( = ?auto_358803 ?auto_358811 ) ) ( not ( = ?auto_358803 ?auto_358812 ) ) ( not ( = ?auto_358803 ?auto_358813 ) ) ( not ( = ?auto_358803 ?auto_358814 ) ) ( not ( = ?auto_358803 ?auto_358815 ) ) ( not ( = ?auto_358804 ?auto_358805 ) ) ( not ( = ?auto_358804 ?auto_358806 ) ) ( not ( = ?auto_358804 ?auto_358807 ) ) ( not ( = ?auto_358804 ?auto_358808 ) ) ( not ( = ?auto_358804 ?auto_358809 ) ) ( not ( = ?auto_358804 ?auto_358810 ) ) ( not ( = ?auto_358804 ?auto_358811 ) ) ( not ( = ?auto_358804 ?auto_358812 ) ) ( not ( = ?auto_358804 ?auto_358813 ) ) ( not ( = ?auto_358804 ?auto_358814 ) ) ( not ( = ?auto_358804 ?auto_358815 ) ) ( not ( = ?auto_358805 ?auto_358806 ) ) ( not ( = ?auto_358805 ?auto_358807 ) ) ( not ( = ?auto_358805 ?auto_358808 ) ) ( not ( = ?auto_358805 ?auto_358809 ) ) ( not ( = ?auto_358805 ?auto_358810 ) ) ( not ( = ?auto_358805 ?auto_358811 ) ) ( not ( = ?auto_358805 ?auto_358812 ) ) ( not ( = ?auto_358805 ?auto_358813 ) ) ( not ( = ?auto_358805 ?auto_358814 ) ) ( not ( = ?auto_358805 ?auto_358815 ) ) ( not ( = ?auto_358806 ?auto_358807 ) ) ( not ( = ?auto_358806 ?auto_358808 ) ) ( not ( = ?auto_358806 ?auto_358809 ) ) ( not ( = ?auto_358806 ?auto_358810 ) ) ( not ( = ?auto_358806 ?auto_358811 ) ) ( not ( = ?auto_358806 ?auto_358812 ) ) ( not ( = ?auto_358806 ?auto_358813 ) ) ( not ( = ?auto_358806 ?auto_358814 ) ) ( not ( = ?auto_358806 ?auto_358815 ) ) ( not ( = ?auto_358807 ?auto_358808 ) ) ( not ( = ?auto_358807 ?auto_358809 ) ) ( not ( = ?auto_358807 ?auto_358810 ) ) ( not ( = ?auto_358807 ?auto_358811 ) ) ( not ( = ?auto_358807 ?auto_358812 ) ) ( not ( = ?auto_358807 ?auto_358813 ) ) ( not ( = ?auto_358807 ?auto_358814 ) ) ( not ( = ?auto_358807 ?auto_358815 ) ) ( not ( = ?auto_358808 ?auto_358809 ) ) ( not ( = ?auto_358808 ?auto_358810 ) ) ( not ( = ?auto_358808 ?auto_358811 ) ) ( not ( = ?auto_358808 ?auto_358812 ) ) ( not ( = ?auto_358808 ?auto_358813 ) ) ( not ( = ?auto_358808 ?auto_358814 ) ) ( not ( = ?auto_358808 ?auto_358815 ) ) ( not ( = ?auto_358809 ?auto_358810 ) ) ( not ( = ?auto_358809 ?auto_358811 ) ) ( not ( = ?auto_358809 ?auto_358812 ) ) ( not ( = ?auto_358809 ?auto_358813 ) ) ( not ( = ?auto_358809 ?auto_358814 ) ) ( not ( = ?auto_358809 ?auto_358815 ) ) ( not ( = ?auto_358810 ?auto_358811 ) ) ( not ( = ?auto_358810 ?auto_358812 ) ) ( not ( = ?auto_358810 ?auto_358813 ) ) ( not ( = ?auto_358810 ?auto_358814 ) ) ( not ( = ?auto_358810 ?auto_358815 ) ) ( not ( = ?auto_358811 ?auto_358812 ) ) ( not ( = ?auto_358811 ?auto_358813 ) ) ( not ( = ?auto_358811 ?auto_358814 ) ) ( not ( = ?auto_358811 ?auto_358815 ) ) ( not ( = ?auto_358812 ?auto_358813 ) ) ( not ( = ?auto_358812 ?auto_358814 ) ) ( not ( = ?auto_358812 ?auto_358815 ) ) ( not ( = ?auto_358813 ?auto_358814 ) ) ( not ( = ?auto_358813 ?auto_358815 ) ) ( not ( = ?auto_358814 ?auto_358815 ) ) ( ON ?auto_358813 ?auto_358814 ) ( ON ?auto_358812 ?auto_358813 ) ( ON ?auto_358811 ?auto_358812 ) ( ON ?auto_358810 ?auto_358811 ) ( ON ?auto_358809 ?auto_358810 ) ( CLEAR ?auto_358807 ) ( ON ?auto_358808 ?auto_358809 ) ( CLEAR ?auto_358808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_358803 ?auto_358804 ?auto_358805 ?auto_358806 ?auto_358807 ?auto_358808 )
      ( MAKE-12PILE ?auto_358803 ?auto_358804 ?auto_358805 ?auto_358806 ?auto_358807 ?auto_358808 ?auto_358809 ?auto_358810 ?auto_358811 ?auto_358812 ?auto_358813 ?auto_358814 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_358853 - BLOCK
      ?auto_358854 - BLOCK
      ?auto_358855 - BLOCK
      ?auto_358856 - BLOCK
      ?auto_358857 - BLOCK
      ?auto_358858 - BLOCK
      ?auto_358859 - BLOCK
      ?auto_358860 - BLOCK
      ?auto_358861 - BLOCK
      ?auto_358862 - BLOCK
      ?auto_358863 - BLOCK
      ?auto_358864 - BLOCK
    )
    :vars
    (
      ?auto_358865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358864 ?auto_358865 ) ( ON-TABLE ?auto_358853 ) ( ON ?auto_358854 ?auto_358853 ) ( ON ?auto_358855 ?auto_358854 ) ( ON ?auto_358856 ?auto_358855 ) ( not ( = ?auto_358853 ?auto_358854 ) ) ( not ( = ?auto_358853 ?auto_358855 ) ) ( not ( = ?auto_358853 ?auto_358856 ) ) ( not ( = ?auto_358853 ?auto_358857 ) ) ( not ( = ?auto_358853 ?auto_358858 ) ) ( not ( = ?auto_358853 ?auto_358859 ) ) ( not ( = ?auto_358853 ?auto_358860 ) ) ( not ( = ?auto_358853 ?auto_358861 ) ) ( not ( = ?auto_358853 ?auto_358862 ) ) ( not ( = ?auto_358853 ?auto_358863 ) ) ( not ( = ?auto_358853 ?auto_358864 ) ) ( not ( = ?auto_358853 ?auto_358865 ) ) ( not ( = ?auto_358854 ?auto_358855 ) ) ( not ( = ?auto_358854 ?auto_358856 ) ) ( not ( = ?auto_358854 ?auto_358857 ) ) ( not ( = ?auto_358854 ?auto_358858 ) ) ( not ( = ?auto_358854 ?auto_358859 ) ) ( not ( = ?auto_358854 ?auto_358860 ) ) ( not ( = ?auto_358854 ?auto_358861 ) ) ( not ( = ?auto_358854 ?auto_358862 ) ) ( not ( = ?auto_358854 ?auto_358863 ) ) ( not ( = ?auto_358854 ?auto_358864 ) ) ( not ( = ?auto_358854 ?auto_358865 ) ) ( not ( = ?auto_358855 ?auto_358856 ) ) ( not ( = ?auto_358855 ?auto_358857 ) ) ( not ( = ?auto_358855 ?auto_358858 ) ) ( not ( = ?auto_358855 ?auto_358859 ) ) ( not ( = ?auto_358855 ?auto_358860 ) ) ( not ( = ?auto_358855 ?auto_358861 ) ) ( not ( = ?auto_358855 ?auto_358862 ) ) ( not ( = ?auto_358855 ?auto_358863 ) ) ( not ( = ?auto_358855 ?auto_358864 ) ) ( not ( = ?auto_358855 ?auto_358865 ) ) ( not ( = ?auto_358856 ?auto_358857 ) ) ( not ( = ?auto_358856 ?auto_358858 ) ) ( not ( = ?auto_358856 ?auto_358859 ) ) ( not ( = ?auto_358856 ?auto_358860 ) ) ( not ( = ?auto_358856 ?auto_358861 ) ) ( not ( = ?auto_358856 ?auto_358862 ) ) ( not ( = ?auto_358856 ?auto_358863 ) ) ( not ( = ?auto_358856 ?auto_358864 ) ) ( not ( = ?auto_358856 ?auto_358865 ) ) ( not ( = ?auto_358857 ?auto_358858 ) ) ( not ( = ?auto_358857 ?auto_358859 ) ) ( not ( = ?auto_358857 ?auto_358860 ) ) ( not ( = ?auto_358857 ?auto_358861 ) ) ( not ( = ?auto_358857 ?auto_358862 ) ) ( not ( = ?auto_358857 ?auto_358863 ) ) ( not ( = ?auto_358857 ?auto_358864 ) ) ( not ( = ?auto_358857 ?auto_358865 ) ) ( not ( = ?auto_358858 ?auto_358859 ) ) ( not ( = ?auto_358858 ?auto_358860 ) ) ( not ( = ?auto_358858 ?auto_358861 ) ) ( not ( = ?auto_358858 ?auto_358862 ) ) ( not ( = ?auto_358858 ?auto_358863 ) ) ( not ( = ?auto_358858 ?auto_358864 ) ) ( not ( = ?auto_358858 ?auto_358865 ) ) ( not ( = ?auto_358859 ?auto_358860 ) ) ( not ( = ?auto_358859 ?auto_358861 ) ) ( not ( = ?auto_358859 ?auto_358862 ) ) ( not ( = ?auto_358859 ?auto_358863 ) ) ( not ( = ?auto_358859 ?auto_358864 ) ) ( not ( = ?auto_358859 ?auto_358865 ) ) ( not ( = ?auto_358860 ?auto_358861 ) ) ( not ( = ?auto_358860 ?auto_358862 ) ) ( not ( = ?auto_358860 ?auto_358863 ) ) ( not ( = ?auto_358860 ?auto_358864 ) ) ( not ( = ?auto_358860 ?auto_358865 ) ) ( not ( = ?auto_358861 ?auto_358862 ) ) ( not ( = ?auto_358861 ?auto_358863 ) ) ( not ( = ?auto_358861 ?auto_358864 ) ) ( not ( = ?auto_358861 ?auto_358865 ) ) ( not ( = ?auto_358862 ?auto_358863 ) ) ( not ( = ?auto_358862 ?auto_358864 ) ) ( not ( = ?auto_358862 ?auto_358865 ) ) ( not ( = ?auto_358863 ?auto_358864 ) ) ( not ( = ?auto_358863 ?auto_358865 ) ) ( not ( = ?auto_358864 ?auto_358865 ) ) ( ON ?auto_358863 ?auto_358864 ) ( ON ?auto_358862 ?auto_358863 ) ( ON ?auto_358861 ?auto_358862 ) ( ON ?auto_358860 ?auto_358861 ) ( ON ?auto_358859 ?auto_358860 ) ( ON ?auto_358858 ?auto_358859 ) ( CLEAR ?auto_358856 ) ( ON ?auto_358857 ?auto_358858 ) ( CLEAR ?auto_358857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_358853 ?auto_358854 ?auto_358855 ?auto_358856 ?auto_358857 )
      ( MAKE-12PILE ?auto_358853 ?auto_358854 ?auto_358855 ?auto_358856 ?auto_358857 ?auto_358858 ?auto_358859 ?auto_358860 ?auto_358861 ?auto_358862 ?auto_358863 ?auto_358864 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_358903 - BLOCK
      ?auto_358904 - BLOCK
      ?auto_358905 - BLOCK
      ?auto_358906 - BLOCK
      ?auto_358907 - BLOCK
      ?auto_358908 - BLOCK
      ?auto_358909 - BLOCK
      ?auto_358910 - BLOCK
      ?auto_358911 - BLOCK
      ?auto_358912 - BLOCK
      ?auto_358913 - BLOCK
      ?auto_358914 - BLOCK
    )
    :vars
    (
      ?auto_358915 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358914 ?auto_358915 ) ( ON-TABLE ?auto_358903 ) ( ON ?auto_358904 ?auto_358903 ) ( ON ?auto_358905 ?auto_358904 ) ( not ( = ?auto_358903 ?auto_358904 ) ) ( not ( = ?auto_358903 ?auto_358905 ) ) ( not ( = ?auto_358903 ?auto_358906 ) ) ( not ( = ?auto_358903 ?auto_358907 ) ) ( not ( = ?auto_358903 ?auto_358908 ) ) ( not ( = ?auto_358903 ?auto_358909 ) ) ( not ( = ?auto_358903 ?auto_358910 ) ) ( not ( = ?auto_358903 ?auto_358911 ) ) ( not ( = ?auto_358903 ?auto_358912 ) ) ( not ( = ?auto_358903 ?auto_358913 ) ) ( not ( = ?auto_358903 ?auto_358914 ) ) ( not ( = ?auto_358903 ?auto_358915 ) ) ( not ( = ?auto_358904 ?auto_358905 ) ) ( not ( = ?auto_358904 ?auto_358906 ) ) ( not ( = ?auto_358904 ?auto_358907 ) ) ( not ( = ?auto_358904 ?auto_358908 ) ) ( not ( = ?auto_358904 ?auto_358909 ) ) ( not ( = ?auto_358904 ?auto_358910 ) ) ( not ( = ?auto_358904 ?auto_358911 ) ) ( not ( = ?auto_358904 ?auto_358912 ) ) ( not ( = ?auto_358904 ?auto_358913 ) ) ( not ( = ?auto_358904 ?auto_358914 ) ) ( not ( = ?auto_358904 ?auto_358915 ) ) ( not ( = ?auto_358905 ?auto_358906 ) ) ( not ( = ?auto_358905 ?auto_358907 ) ) ( not ( = ?auto_358905 ?auto_358908 ) ) ( not ( = ?auto_358905 ?auto_358909 ) ) ( not ( = ?auto_358905 ?auto_358910 ) ) ( not ( = ?auto_358905 ?auto_358911 ) ) ( not ( = ?auto_358905 ?auto_358912 ) ) ( not ( = ?auto_358905 ?auto_358913 ) ) ( not ( = ?auto_358905 ?auto_358914 ) ) ( not ( = ?auto_358905 ?auto_358915 ) ) ( not ( = ?auto_358906 ?auto_358907 ) ) ( not ( = ?auto_358906 ?auto_358908 ) ) ( not ( = ?auto_358906 ?auto_358909 ) ) ( not ( = ?auto_358906 ?auto_358910 ) ) ( not ( = ?auto_358906 ?auto_358911 ) ) ( not ( = ?auto_358906 ?auto_358912 ) ) ( not ( = ?auto_358906 ?auto_358913 ) ) ( not ( = ?auto_358906 ?auto_358914 ) ) ( not ( = ?auto_358906 ?auto_358915 ) ) ( not ( = ?auto_358907 ?auto_358908 ) ) ( not ( = ?auto_358907 ?auto_358909 ) ) ( not ( = ?auto_358907 ?auto_358910 ) ) ( not ( = ?auto_358907 ?auto_358911 ) ) ( not ( = ?auto_358907 ?auto_358912 ) ) ( not ( = ?auto_358907 ?auto_358913 ) ) ( not ( = ?auto_358907 ?auto_358914 ) ) ( not ( = ?auto_358907 ?auto_358915 ) ) ( not ( = ?auto_358908 ?auto_358909 ) ) ( not ( = ?auto_358908 ?auto_358910 ) ) ( not ( = ?auto_358908 ?auto_358911 ) ) ( not ( = ?auto_358908 ?auto_358912 ) ) ( not ( = ?auto_358908 ?auto_358913 ) ) ( not ( = ?auto_358908 ?auto_358914 ) ) ( not ( = ?auto_358908 ?auto_358915 ) ) ( not ( = ?auto_358909 ?auto_358910 ) ) ( not ( = ?auto_358909 ?auto_358911 ) ) ( not ( = ?auto_358909 ?auto_358912 ) ) ( not ( = ?auto_358909 ?auto_358913 ) ) ( not ( = ?auto_358909 ?auto_358914 ) ) ( not ( = ?auto_358909 ?auto_358915 ) ) ( not ( = ?auto_358910 ?auto_358911 ) ) ( not ( = ?auto_358910 ?auto_358912 ) ) ( not ( = ?auto_358910 ?auto_358913 ) ) ( not ( = ?auto_358910 ?auto_358914 ) ) ( not ( = ?auto_358910 ?auto_358915 ) ) ( not ( = ?auto_358911 ?auto_358912 ) ) ( not ( = ?auto_358911 ?auto_358913 ) ) ( not ( = ?auto_358911 ?auto_358914 ) ) ( not ( = ?auto_358911 ?auto_358915 ) ) ( not ( = ?auto_358912 ?auto_358913 ) ) ( not ( = ?auto_358912 ?auto_358914 ) ) ( not ( = ?auto_358912 ?auto_358915 ) ) ( not ( = ?auto_358913 ?auto_358914 ) ) ( not ( = ?auto_358913 ?auto_358915 ) ) ( not ( = ?auto_358914 ?auto_358915 ) ) ( ON ?auto_358913 ?auto_358914 ) ( ON ?auto_358912 ?auto_358913 ) ( ON ?auto_358911 ?auto_358912 ) ( ON ?auto_358910 ?auto_358911 ) ( ON ?auto_358909 ?auto_358910 ) ( ON ?auto_358908 ?auto_358909 ) ( ON ?auto_358907 ?auto_358908 ) ( CLEAR ?auto_358905 ) ( ON ?auto_358906 ?auto_358907 ) ( CLEAR ?auto_358906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_358903 ?auto_358904 ?auto_358905 ?auto_358906 )
      ( MAKE-12PILE ?auto_358903 ?auto_358904 ?auto_358905 ?auto_358906 ?auto_358907 ?auto_358908 ?auto_358909 ?auto_358910 ?auto_358911 ?auto_358912 ?auto_358913 ?auto_358914 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_358953 - BLOCK
      ?auto_358954 - BLOCK
      ?auto_358955 - BLOCK
      ?auto_358956 - BLOCK
      ?auto_358957 - BLOCK
      ?auto_358958 - BLOCK
      ?auto_358959 - BLOCK
      ?auto_358960 - BLOCK
      ?auto_358961 - BLOCK
      ?auto_358962 - BLOCK
      ?auto_358963 - BLOCK
      ?auto_358964 - BLOCK
    )
    :vars
    (
      ?auto_358965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_358964 ?auto_358965 ) ( ON-TABLE ?auto_358953 ) ( ON ?auto_358954 ?auto_358953 ) ( not ( = ?auto_358953 ?auto_358954 ) ) ( not ( = ?auto_358953 ?auto_358955 ) ) ( not ( = ?auto_358953 ?auto_358956 ) ) ( not ( = ?auto_358953 ?auto_358957 ) ) ( not ( = ?auto_358953 ?auto_358958 ) ) ( not ( = ?auto_358953 ?auto_358959 ) ) ( not ( = ?auto_358953 ?auto_358960 ) ) ( not ( = ?auto_358953 ?auto_358961 ) ) ( not ( = ?auto_358953 ?auto_358962 ) ) ( not ( = ?auto_358953 ?auto_358963 ) ) ( not ( = ?auto_358953 ?auto_358964 ) ) ( not ( = ?auto_358953 ?auto_358965 ) ) ( not ( = ?auto_358954 ?auto_358955 ) ) ( not ( = ?auto_358954 ?auto_358956 ) ) ( not ( = ?auto_358954 ?auto_358957 ) ) ( not ( = ?auto_358954 ?auto_358958 ) ) ( not ( = ?auto_358954 ?auto_358959 ) ) ( not ( = ?auto_358954 ?auto_358960 ) ) ( not ( = ?auto_358954 ?auto_358961 ) ) ( not ( = ?auto_358954 ?auto_358962 ) ) ( not ( = ?auto_358954 ?auto_358963 ) ) ( not ( = ?auto_358954 ?auto_358964 ) ) ( not ( = ?auto_358954 ?auto_358965 ) ) ( not ( = ?auto_358955 ?auto_358956 ) ) ( not ( = ?auto_358955 ?auto_358957 ) ) ( not ( = ?auto_358955 ?auto_358958 ) ) ( not ( = ?auto_358955 ?auto_358959 ) ) ( not ( = ?auto_358955 ?auto_358960 ) ) ( not ( = ?auto_358955 ?auto_358961 ) ) ( not ( = ?auto_358955 ?auto_358962 ) ) ( not ( = ?auto_358955 ?auto_358963 ) ) ( not ( = ?auto_358955 ?auto_358964 ) ) ( not ( = ?auto_358955 ?auto_358965 ) ) ( not ( = ?auto_358956 ?auto_358957 ) ) ( not ( = ?auto_358956 ?auto_358958 ) ) ( not ( = ?auto_358956 ?auto_358959 ) ) ( not ( = ?auto_358956 ?auto_358960 ) ) ( not ( = ?auto_358956 ?auto_358961 ) ) ( not ( = ?auto_358956 ?auto_358962 ) ) ( not ( = ?auto_358956 ?auto_358963 ) ) ( not ( = ?auto_358956 ?auto_358964 ) ) ( not ( = ?auto_358956 ?auto_358965 ) ) ( not ( = ?auto_358957 ?auto_358958 ) ) ( not ( = ?auto_358957 ?auto_358959 ) ) ( not ( = ?auto_358957 ?auto_358960 ) ) ( not ( = ?auto_358957 ?auto_358961 ) ) ( not ( = ?auto_358957 ?auto_358962 ) ) ( not ( = ?auto_358957 ?auto_358963 ) ) ( not ( = ?auto_358957 ?auto_358964 ) ) ( not ( = ?auto_358957 ?auto_358965 ) ) ( not ( = ?auto_358958 ?auto_358959 ) ) ( not ( = ?auto_358958 ?auto_358960 ) ) ( not ( = ?auto_358958 ?auto_358961 ) ) ( not ( = ?auto_358958 ?auto_358962 ) ) ( not ( = ?auto_358958 ?auto_358963 ) ) ( not ( = ?auto_358958 ?auto_358964 ) ) ( not ( = ?auto_358958 ?auto_358965 ) ) ( not ( = ?auto_358959 ?auto_358960 ) ) ( not ( = ?auto_358959 ?auto_358961 ) ) ( not ( = ?auto_358959 ?auto_358962 ) ) ( not ( = ?auto_358959 ?auto_358963 ) ) ( not ( = ?auto_358959 ?auto_358964 ) ) ( not ( = ?auto_358959 ?auto_358965 ) ) ( not ( = ?auto_358960 ?auto_358961 ) ) ( not ( = ?auto_358960 ?auto_358962 ) ) ( not ( = ?auto_358960 ?auto_358963 ) ) ( not ( = ?auto_358960 ?auto_358964 ) ) ( not ( = ?auto_358960 ?auto_358965 ) ) ( not ( = ?auto_358961 ?auto_358962 ) ) ( not ( = ?auto_358961 ?auto_358963 ) ) ( not ( = ?auto_358961 ?auto_358964 ) ) ( not ( = ?auto_358961 ?auto_358965 ) ) ( not ( = ?auto_358962 ?auto_358963 ) ) ( not ( = ?auto_358962 ?auto_358964 ) ) ( not ( = ?auto_358962 ?auto_358965 ) ) ( not ( = ?auto_358963 ?auto_358964 ) ) ( not ( = ?auto_358963 ?auto_358965 ) ) ( not ( = ?auto_358964 ?auto_358965 ) ) ( ON ?auto_358963 ?auto_358964 ) ( ON ?auto_358962 ?auto_358963 ) ( ON ?auto_358961 ?auto_358962 ) ( ON ?auto_358960 ?auto_358961 ) ( ON ?auto_358959 ?auto_358960 ) ( ON ?auto_358958 ?auto_358959 ) ( ON ?auto_358957 ?auto_358958 ) ( ON ?auto_358956 ?auto_358957 ) ( CLEAR ?auto_358954 ) ( ON ?auto_358955 ?auto_358956 ) ( CLEAR ?auto_358955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_358953 ?auto_358954 ?auto_358955 )
      ( MAKE-12PILE ?auto_358953 ?auto_358954 ?auto_358955 ?auto_358956 ?auto_358957 ?auto_358958 ?auto_358959 ?auto_358960 ?auto_358961 ?auto_358962 ?auto_358963 ?auto_358964 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_359003 - BLOCK
      ?auto_359004 - BLOCK
      ?auto_359005 - BLOCK
      ?auto_359006 - BLOCK
      ?auto_359007 - BLOCK
      ?auto_359008 - BLOCK
      ?auto_359009 - BLOCK
      ?auto_359010 - BLOCK
      ?auto_359011 - BLOCK
      ?auto_359012 - BLOCK
      ?auto_359013 - BLOCK
      ?auto_359014 - BLOCK
    )
    :vars
    (
      ?auto_359015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359014 ?auto_359015 ) ( ON-TABLE ?auto_359003 ) ( not ( = ?auto_359003 ?auto_359004 ) ) ( not ( = ?auto_359003 ?auto_359005 ) ) ( not ( = ?auto_359003 ?auto_359006 ) ) ( not ( = ?auto_359003 ?auto_359007 ) ) ( not ( = ?auto_359003 ?auto_359008 ) ) ( not ( = ?auto_359003 ?auto_359009 ) ) ( not ( = ?auto_359003 ?auto_359010 ) ) ( not ( = ?auto_359003 ?auto_359011 ) ) ( not ( = ?auto_359003 ?auto_359012 ) ) ( not ( = ?auto_359003 ?auto_359013 ) ) ( not ( = ?auto_359003 ?auto_359014 ) ) ( not ( = ?auto_359003 ?auto_359015 ) ) ( not ( = ?auto_359004 ?auto_359005 ) ) ( not ( = ?auto_359004 ?auto_359006 ) ) ( not ( = ?auto_359004 ?auto_359007 ) ) ( not ( = ?auto_359004 ?auto_359008 ) ) ( not ( = ?auto_359004 ?auto_359009 ) ) ( not ( = ?auto_359004 ?auto_359010 ) ) ( not ( = ?auto_359004 ?auto_359011 ) ) ( not ( = ?auto_359004 ?auto_359012 ) ) ( not ( = ?auto_359004 ?auto_359013 ) ) ( not ( = ?auto_359004 ?auto_359014 ) ) ( not ( = ?auto_359004 ?auto_359015 ) ) ( not ( = ?auto_359005 ?auto_359006 ) ) ( not ( = ?auto_359005 ?auto_359007 ) ) ( not ( = ?auto_359005 ?auto_359008 ) ) ( not ( = ?auto_359005 ?auto_359009 ) ) ( not ( = ?auto_359005 ?auto_359010 ) ) ( not ( = ?auto_359005 ?auto_359011 ) ) ( not ( = ?auto_359005 ?auto_359012 ) ) ( not ( = ?auto_359005 ?auto_359013 ) ) ( not ( = ?auto_359005 ?auto_359014 ) ) ( not ( = ?auto_359005 ?auto_359015 ) ) ( not ( = ?auto_359006 ?auto_359007 ) ) ( not ( = ?auto_359006 ?auto_359008 ) ) ( not ( = ?auto_359006 ?auto_359009 ) ) ( not ( = ?auto_359006 ?auto_359010 ) ) ( not ( = ?auto_359006 ?auto_359011 ) ) ( not ( = ?auto_359006 ?auto_359012 ) ) ( not ( = ?auto_359006 ?auto_359013 ) ) ( not ( = ?auto_359006 ?auto_359014 ) ) ( not ( = ?auto_359006 ?auto_359015 ) ) ( not ( = ?auto_359007 ?auto_359008 ) ) ( not ( = ?auto_359007 ?auto_359009 ) ) ( not ( = ?auto_359007 ?auto_359010 ) ) ( not ( = ?auto_359007 ?auto_359011 ) ) ( not ( = ?auto_359007 ?auto_359012 ) ) ( not ( = ?auto_359007 ?auto_359013 ) ) ( not ( = ?auto_359007 ?auto_359014 ) ) ( not ( = ?auto_359007 ?auto_359015 ) ) ( not ( = ?auto_359008 ?auto_359009 ) ) ( not ( = ?auto_359008 ?auto_359010 ) ) ( not ( = ?auto_359008 ?auto_359011 ) ) ( not ( = ?auto_359008 ?auto_359012 ) ) ( not ( = ?auto_359008 ?auto_359013 ) ) ( not ( = ?auto_359008 ?auto_359014 ) ) ( not ( = ?auto_359008 ?auto_359015 ) ) ( not ( = ?auto_359009 ?auto_359010 ) ) ( not ( = ?auto_359009 ?auto_359011 ) ) ( not ( = ?auto_359009 ?auto_359012 ) ) ( not ( = ?auto_359009 ?auto_359013 ) ) ( not ( = ?auto_359009 ?auto_359014 ) ) ( not ( = ?auto_359009 ?auto_359015 ) ) ( not ( = ?auto_359010 ?auto_359011 ) ) ( not ( = ?auto_359010 ?auto_359012 ) ) ( not ( = ?auto_359010 ?auto_359013 ) ) ( not ( = ?auto_359010 ?auto_359014 ) ) ( not ( = ?auto_359010 ?auto_359015 ) ) ( not ( = ?auto_359011 ?auto_359012 ) ) ( not ( = ?auto_359011 ?auto_359013 ) ) ( not ( = ?auto_359011 ?auto_359014 ) ) ( not ( = ?auto_359011 ?auto_359015 ) ) ( not ( = ?auto_359012 ?auto_359013 ) ) ( not ( = ?auto_359012 ?auto_359014 ) ) ( not ( = ?auto_359012 ?auto_359015 ) ) ( not ( = ?auto_359013 ?auto_359014 ) ) ( not ( = ?auto_359013 ?auto_359015 ) ) ( not ( = ?auto_359014 ?auto_359015 ) ) ( ON ?auto_359013 ?auto_359014 ) ( ON ?auto_359012 ?auto_359013 ) ( ON ?auto_359011 ?auto_359012 ) ( ON ?auto_359010 ?auto_359011 ) ( ON ?auto_359009 ?auto_359010 ) ( ON ?auto_359008 ?auto_359009 ) ( ON ?auto_359007 ?auto_359008 ) ( ON ?auto_359006 ?auto_359007 ) ( ON ?auto_359005 ?auto_359006 ) ( CLEAR ?auto_359003 ) ( ON ?auto_359004 ?auto_359005 ) ( CLEAR ?auto_359004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_359003 ?auto_359004 )
      ( MAKE-12PILE ?auto_359003 ?auto_359004 ?auto_359005 ?auto_359006 ?auto_359007 ?auto_359008 ?auto_359009 ?auto_359010 ?auto_359011 ?auto_359012 ?auto_359013 ?auto_359014 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_359053 - BLOCK
      ?auto_359054 - BLOCK
      ?auto_359055 - BLOCK
      ?auto_359056 - BLOCK
      ?auto_359057 - BLOCK
      ?auto_359058 - BLOCK
      ?auto_359059 - BLOCK
      ?auto_359060 - BLOCK
      ?auto_359061 - BLOCK
      ?auto_359062 - BLOCK
      ?auto_359063 - BLOCK
      ?auto_359064 - BLOCK
    )
    :vars
    (
      ?auto_359065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359064 ?auto_359065 ) ( not ( = ?auto_359053 ?auto_359054 ) ) ( not ( = ?auto_359053 ?auto_359055 ) ) ( not ( = ?auto_359053 ?auto_359056 ) ) ( not ( = ?auto_359053 ?auto_359057 ) ) ( not ( = ?auto_359053 ?auto_359058 ) ) ( not ( = ?auto_359053 ?auto_359059 ) ) ( not ( = ?auto_359053 ?auto_359060 ) ) ( not ( = ?auto_359053 ?auto_359061 ) ) ( not ( = ?auto_359053 ?auto_359062 ) ) ( not ( = ?auto_359053 ?auto_359063 ) ) ( not ( = ?auto_359053 ?auto_359064 ) ) ( not ( = ?auto_359053 ?auto_359065 ) ) ( not ( = ?auto_359054 ?auto_359055 ) ) ( not ( = ?auto_359054 ?auto_359056 ) ) ( not ( = ?auto_359054 ?auto_359057 ) ) ( not ( = ?auto_359054 ?auto_359058 ) ) ( not ( = ?auto_359054 ?auto_359059 ) ) ( not ( = ?auto_359054 ?auto_359060 ) ) ( not ( = ?auto_359054 ?auto_359061 ) ) ( not ( = ?auto_359054 ?auto_359062 ) ) ( not ( = ?auto_359054 ?auto_359063 ) ) ( not ( = ?auto_359054 ?auto_359064 ) ) ( not ( = ?auto_359054 ?auto_359065 ) ) ( not ( = ?auto_359055 ?auto_359056 ) ) ( not ( = ?auto_359055 ?auto_359057 ) ) ( not ( = ?auto_359055 ?auto_359058 ) ) ( not ( = ?auto_359055 ?auto_359059 ) ) ( not ( = ?auto_359055 ?auto_359060 ) ) ( not ( = ?auto_359055 ?auto_359061 ) ) ( not ( = ?auto_359055 ?auto_359062 ) ) ( not ( = ?auto_359055 ?auto_359063 ) ) ( not ( = ?auto_359055 ?auto_359064 ) ) ( not ( = ?auto_359055 ?auto_359065 ) ) ( not ( = ?auto_359056 ?auto_359057 ) ) ( not ( = ?auto_359056 ?auto_359058 ) ) ( not ( = ?auto_359056 ?auto_359059 ) ) ( not ( = ?auto_359056 ?auto_359060 ) ) ( not ( = ?auto_359056 ?auto_359061 ) ) ( not ( = ?auto_359056 ?auto_359062 ) ) ( not ( = ?auto_359056 ?auto_359063 ) ) ( not ( = ?auto_359056 ?auto_359064 ) ) ( not ( = ?auto_359056 ?auto_359065 ) ) ( not ( = ?auto_359057 ?auto_359058 ) ) ( not ( = ?auto_359057 ?auto_359059 ) ) ( not ( = ?auto_359057 ?auto_359060 ) ) ( not ( = ?auto_359057 ?auto_359061 ) ) ( not ( = ?auto_359057 ?auto_359062 ) ) ( not ( = ?auto_359057 ?auto_359063 ) ) ( not ( = ?auto_359057 ?auto_359064 ) ) ( not ( = ?auto_359057 ?auto_359065 ) ) ( not ( = ?auto_359058 ?auto_359059 ) ) ( not ( = ?auto_359058 ?auto_359060 ) ) ( not ( = ?auto_359058 ?auto_359061 ) ) ( not ( = ?auto_359058 ?auto_359062 ) ) ( not ( = ?auto_359058 ?auto_359063 ) ) ( not ( = ?auto_359058 ?auto_359064 ) ) ( not ( = ?auto_359058 ?auto_359065 ) ) ( not ( = ?auto_359059 ?auto_359060 ) ) ( not ( = ?auto_359059 ?auto_359061 ) ) ( not ( = ?auto_359059 ?auto_359062 ) ) ( not ( = ?auto_359059 ?auto_359063 ) ) ( not ( = ?auto_359059 ?auto_359064 ) ) ( not ( = ?auto_359059 ?auto_359065 ) ) ( not ( = ?auto_359060 ?auto_359061 ) ) ( not ( = ?auto_359060 ?auto_359062 ) ) ( not ( = ?auto_359060 ?auto_359063 ) ) ( not ( = ?auto_359060 ?auto_359064 ) ) ( not ( = ?auto_359060 ?auto_359065 ) ) ( not ( = ?auto_359061 ?auto_359062 ) ) ( not ( = ?auto_359061 ?auto_359063 ) ) ( not ( = ?auto_359061 ?auto_359064 ) ) ( not ( = ?auto_359061 ?auto_359065 ) ) ( not ( = ?auto_359062 ?auto_359063 ) ) ( not ( = ?auto_359062 ?auto_359064 ) ) ( not ( = ?auto_359062 ?auto_359065 ) ) ( not ( = ?auto_359063 ?auto_359064 ) ) ( not ( = ?auto_359063 ?auto_359065 ) ) ( not ( = ?auto_359064 ?auto_359065 ) ) ( ON ?auto_359063 ?auto_359064 ) ( ON ?auto_359062 ?auto_359063 ) ( ON ?auto_359061 ?auto_359062 ) ( ON ?auto_359060 ?auto_359061 ) ( ON ?auto_359059 ?auto_359060 ) ( ON ?auto_359058 ?auto_359059 ) ( ON ?auto_359057 ?auto_359058 ) ( ON ?auto_359056 ?auto_359057 ) ( ON ?auto_359055 ?auto_359056 ) ( ON ?auto_359054 ?auto_359055 ) ( ON ?auto_359053 ?auto_359054 ) ( CLEAR ?auto_359053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_359053 )
      ( MAKE-12PILE ?auto_359053 ?auto_359054 ?auto_359055 ?auto_359056 ?auto_359057 ?auto_359058 ?auto_359059 ?auto_359060 ?auto_359061 ?auto_359062 ?auto_359063 ?auto_359064 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359104 - BLOCK
      ?auto_359105 - BLOCK
      ?auto_359106 - BLOCK
      ?auto_359107 - BLOCK
      ?auto_359108 - BLOCK
      ?auto_359109 - BLOCK
      ?auto_359110 - BLOCK
      ?auto_359111 - BLOCK
      ?auto_359112 - BLOCK
      ?auto_359113 - BLOCK
      ?auto_359114 - BLOCK
      ?auto_359115 - BLOCK
      ?auto_359116 - BLOCK
    )
    :vars
    (
      ?auto_359117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_359115 ) ( ON ?auto_359116 ?auto_359117 ) ( CLEAR ?auto_359116 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_359104 ) ( ON ?auto_359105 ?auto_359104 ) ( ON ?auto_359106 ?auto_359105 ) ( ON ?auto_359107 ?auto_359106 ) ( ON ?auto_359108 ?auto_359107 ) ( ON ?auto_359109 ?auto_359108 ) ( ON ?auto_359110 ?auto_359109 ) ( ON ?auto_359111 ?auto_359110 ) ( ON ?auto_359112 ?auto_359111 ) ( ON ?auto_359113 ?auto_359112 ) ( ON ?auto_359114 ?auto_359113 ) ( ON ?auto_359115 ?auto_359114 ) ( not ( = ?auto_359104 ?auto_359105 ) ) ( not ( = ?auto_359104 ?auto_359106 ) ) ( not ( = ?auto_359104 ?auto_359107 ) ) ( not ( = ?auto_359104 ?auto_359108 ) ) ( not ( = ?auto_359104 ?auto_359109 ) ) ( not ( = ?auto_359104 ?auto_359110 ) ) ( not ( = ?auto_359104 ?auto_359111 ) ) ( not ( = ?auto_359104 ?auto_359112 ) ) ( not ( = ?auto_359104 ?auto_359113 ) ) ( not ( = ?auto_359104 ?auto_359114 ) ) ( not ( = ?auto_359104 ?auto_359115 ) ) ( not ( = ?auto_359104 ?auto_359116 ) ) ( not ( = ?auto_359104 ?auto_359117 ) ) ( not ( = ?auto_359105 ?auto_359106 ) ) ( not ( = ?auto_359105 ?auto_359107 ) ) ( not ( = ?auto_359105 ?auto_359108 ) ) ( not ( = ?auto_359105 ?auto_359109 ) ) ( not ( = ?auto_359105 ?auto_359110 ) ) ( not ( = ?auto_359105 ?auto_359111 ) ) ( not ( = ?auto_359105 ?auto_359112 ) ) ( not ( = ?auto_359105 ?auto_359113 ) ) ( not ( = ?auto_359105 ?auto_359114 ) ) ( not ( = ?auto_359105 ?auto_359115 ) ) ( not ( = ?auto_359105 ?auto_359116 ) ) ( not ( = ?auto_359105 ?auto_359117 ) ) ( not ( = ?auto_359106 ?auto_359107 ) ) ( not ( = ?auto_359106 ?auto_359108 ) ) ( not ( = ?auto_359106 ?auto_359109 ) ) ( not ( = ?auto_359106 ?auto_359110 ) ) ( not ( = ?auto_359106 ?auto_359111 ) ) ( not ( = ?auto_359106 ?auto_359112 ) ) ( not ( = ?auto_359106 ?auto_359113 ) ) ( not ( = ?auto_359106 ?auto_359114 ) ) ( not ( = ?auto_359106 ?auto_359115 ) ) ( not ( = ?auto_359106 ?auto_359116 ) ) ( not ( = ?auto_359106 ?auto_359117 ) ) ( not ( = ?auto_359107 ?auto_359108 ) ) ( not ( = ?auto_359107 ?auto_359109 ) ) ( not ( = ?auto_359107 ?auto_359110 ) ) ( not ( = ?auto_359107 ?auto_359111 ) ) ( not ( = ?auto_359107 ?auto_359112 ) ) ( not ( = ?auto_359107 ?auto_359113 ) ) ( not ( = ?auto_359107 ?auto_359114 ) ) ( not ( = ?auto_359107 ?auto_359115 ) ) ( not ( = ?auto_359107 ?auto_359116 ) ) ( not ( = ?auto_359107 ?auto_359117 ) ) ( not ( = ?auto_359108 ?auto_359109 ) ) ( not ( = ?auto_359108 ?auto_359110 ) ) ( not ( = ?auto_359108 ?auto_359111 ) ) ( not ( = ?auto_359108 ?auto_359112 ) ) ( not ( = ?auto_359108 ?auto_359113 ) ) ( not ( = ?auto_359108 ?auto_359114 ) ) ( not ( = ?auto_359108 ?auto_359115 ) ) ( not ( = ?auto_359108 ?auto_359116 ) ) ( not ( = ?auto_359108 ?auto_359117 ) ) ( not ( = ?auto_359109 ?auto_359110 ) ) ( not ( = ?auto_359109 ?auto_359111 ) ) ( not ( = ?auto_359109 ?auto_359112 ) ) ( not ( = ?auto_359109 ?auto_359113 ) ) ( not ( = ?auto_359109 ?auto_359114 ) ) ( not ( = ?auto_359109 ?auto_359115 ) ) ( not ( = ?auto_359109 ?auto_359116 ) ) ( not ( = ?auto_359109 ?auto_359117 ) ) ( not ( = ?auto_359110 ?auto_359111 ) ) ( not ( = ?auto_359110 ?auto_359112 ) ) ( not ( = ?auto_359110 ?auto_359113 ) ) ( not ( = ?auto_359110 ?auto_359114 ) ) ( not ( = ?auto_359110 ?auto_359115 ) ) ( not ( = ?auto_359110 ?auto_359116 ) ) ( not ( = ?auto_359110 ?auto_359117 ) ) ( not ( = ?auto_359111 ?auto_359112 ) ) ( not ( = ?auto_359111 ?auto_359113 ) ) ( not ( = ?auto_359111 ?auto_359114 ) ) ( not ( = ?auto_359111 ?auto_359115 ) ) ( not ( = ?auto_359111 ?auto_359116 ) ) ( not ( = ?auto_359111 ?auto_359117 ) ) ( not ( = ?auto_359112 ?auto_359113 ) ) ( not ( = ?auto_359112 ?auto_359114 ) ) ( not ( = ?auto_359112 ?auto_359115 ) ) ( not ( = ?auto_359112 ?auto_359116 ) ) ( not ( = ?auto_359112 ?auto_359117 ) ) ( not ( = ?auto_359113 ?auto_359114 ) ) ( not ( = ?auto_359113 ?auto_359115 ) ) ( not ( = ?auto_359113 ?auto_359116 ) ) ( not ( = ?auto_359113 ?auto_359117 ) ) ( not ( = ?auto_359114 ?auto_359115 ) ) ( not ( = ?auto_359114 ?auto_359116 ) ) ( not ( = ?auto_359114 ?auto_359117 ) ) ( not ( = ?auto_359115 ?auto_359116 ) ) ( not ( = ?auto_359115 ?auto_359117 ) ) ( not ( = ?auto_359116 ?auto_359117 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_359116 ?auto_359117 )
      ( !STACK ?auto_359116 ?auto_359115 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359158 - BLOCK
      ?auto_359159 - BLOCK
      ?auto_359160 - BLOCK
      ?auto_359161 - BLOCK
      ?auto_359162 - BLOCK
      ?auto_359163 - BLOCK
      ?auto_359164 - BLOCK
      ?auto_359165 - BLOCK
      ?auto_359166 - BLOCK
      ?auto_359167 - BLOCK
      ?auto_359168 - BLOCK
      ?auto_359169 - BLOCK
      ?auto_359170 - BLOCK
    )
    :vars
    (
      ?auto_359171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359170 ?auto_359171 ) ( ON-TABLE ?auto_359158 ) ( ON ?auto_359159 ?auto_359158 ) ( ON ?auto_359160 ?auto_359159 ) ( ON ?auto_359161 ?auto_359160 ) ( ON ?auto_359162 ?auto_359161 ) ( ON ?auto_359163 ?auto_359162 ) ( ON ?auto_359164 ?auto_359163 ) ( ON ?auto_359165 ?auto_359164 ) ( ON ?auto_359166 ?auto_359165 ) ( ON ?auto_359167 ?auto_359166 ) ( ON ?auto_359168 ?auto_359167 ) ( not ( = ?auto_359158 ?auto_359159 ) ) ( not ( = ?auto_359158 ?auto_359160 ) ) ( not ( = ?auto_359158 ?auto_359161 ) ) ( not ( = ?auto_359158 ?auto_359162 ) ) ( not ( = ?auto_359158 ?auto_359163 ) ) ( not ( = ?auto_359158 ?auto_359164 ) ) ( not ( = ?auto_359158 ?auto_359165 ) ) ( not ( = ?auto_359158 ?auto_359166 ) ) ( not ( = ?auto_359158 ?auto_359167 ) ) ( not ( = ?auto_359158 ?auto_359168 ) ) ( not ( = ?auto_359158 ?auto_359169 ) ) ( not ( = ?auto_359158 ?auto_359170 ) ) ( not ( = ?auto_359158 ?auto_359171 ) ) ( not ( = ?auto_359159 ?auto_359160 ) ) ( not ( = ?auto_359159 ?auto_359161 ) ) ( not ( = ?auto_359159 ?auto_359162 ) ) ( not ( = ?auto_359159 ?auto_359163 ) ) ( not ( = ?auto_359159 ?auto_359164 ) ) ( not ( = ?auto_359159 ?auto_359165 ) ) ( not ( = ?auto_359159 ?auto_359166 ) ) ( not ( = ?auto_359159 ?auto_359167 ) ) ( not ( = ?auto_359159 ?auto_359168 ) ) ( not ( = ?auto_359159 ?auto_359169 ) ) ( not ( = ?auto_359159 ?auto_359170 ) ) ( not ( = ?auto_359159 ?auto_359171 ) ) ( not ( = ?auto_359160 ?auto_359161 ) ) ( not ( = ?auto_359160 ?auto_359162 ) ) ( not ( = ?auto_359160 ?auto_359163 ) ) ( not ( = ?auto_359160 ?auto_359164 ) ) ( not ( = ?auto_359160 ?auto_359165 ) ) ( not ( = ?auto_359160 ?auto_359166 ) ) ( not ( = ?auto_359160 ?auto_359167 ) ) ( not ( = ?auto_359160 ?auto_359168 ) ) ( not ( = ?auto_359160 ?auto_359169 ) ) ( not ( = ?auto_359160 ?auto_359170 ) ) ( not ( = ?auto_359160 ?auto_359171 ) ) ( not ( = ?auto_359161 ?auto_359162 ) ) ( not ( = ?auto_359161 ?auto_359163 ) ) ( not ( = ?auto_359161 ?auto_359164 ) ) ( not ( = ?auto_359161 ?auto_359165 ) ) ( not ( = ?auto_359161 ?auto_359166 ) ) ( not ( = ?auto_359161 ?auto_359167 ) ) ( not ( = ?auto_359161 ?auto_359168 ) ) ( not ( = ?auto_359161 ?auto_359169 ) ) ( not ( = ?auto_359161 ?auto_359170 ) ) ( not ( = ?auto_359161 ?auto_359171 ) ) ( not ( = ?auto_359162 ?auto_359163 ) ) ( not ( = ?auto_359162 ?auto_359164 ) ) ( not ( = ?auto_359162 ?auto_359165 ) ) ( not ( = ?auto_359162 ?auto_359166 ) ) ( not ( = ?auto_359162 ?auto_359167 ) ) ( not ( = ?auto_359162 ?auto_359168 ) ) ( not ( = ?auto_359162 ?auto_359169 ) ) ( not ( = ?auto_359162 ?auto_359170 ) ) ( not ( = ?auto_359162 ?auto_359171 ) ) ( not ( = ?auto_359163 ?auto_359164 ) ) ( not ( = ?auto_359163 ?auto_359165 ) ) ( not ( = ?auto_359163 ?auto_359166 ) ) ( not ( = ?auto_359163 ?auto_359167 ) ) ( not ( = ?auto_359163 ?auto_359168 ) ) ( not ( = ?auto_359163 ?auto_359169 ) ) ( not ( = ?auto_359163 ?auto_359170 ) ) ( not ( = ?auto_359163 ?auto_359171 ) ) ( not ( = ?auto_359164 ?auto_359165 ) ) ( not ( = ?auto_359164 ?auto_359166 ) ) ( not ( = ?auto_359164 ?auto_359167 ) ) ( not ( = ?auto_359164 ?auto_359168 ) ) ( not ( = ?auto_359164 ?auto_359169 ) ) ( not ( = ?auto_359164 ?auto_359170 ) ) ( not ( = ?auto_359164 ?auto_359171 ) ) ( not ( = ?auto_359165 ?auto_359166 ) ) ( not ( = ?auto_359165 ?auto_359167 ) ) ( not ( = ?auto_359165 ?auto_359168 ) ) ( not ( = ?auto_359165 ?auto_359169 ) ) ( not ( = ?auto_359165 ?auto_359170 ) ) ( not ( = ?auto_359165 ?auto_359171 ) ) ( not ( = ?auto_359166 ?auto_359167 ) ) ( not ( = ?auto_359166 ?auto_359168 ) ) ( not ( = ?auto_359166 ?auto_359169 ) ) ( not ( = ?auto_359166 ?auto_359170 ) ) ( not ( = ?auto_359166 ?auto_359171 ) ) ( not ( = ?auto_359167 ?auto_359168 ) ) ( not ( = ?auto_359167 ?auto_359169 ) ) ( not ( = ?auto_359167 ?auto_359170 ) ) ( not ( = ?auto_359167 ?auto_359171 ) ) ( not ( = ?auto_359168 ?auto_359169 ) ) ( not ( = ?auto_359168 ?auto_359170 ) ) ( not ( = ?auto_359168 ?auto_359171 ) ) ( not ( = ?auto_359169 ?auto_359170 ) ) ( not ( = ?auto_359169 ?auto_359171 ) ) ( not ( = ?auto_359170 ?auto_359171 ) ) ( CLEAR ?auto_359168 ) ( ON ?auto_359169 ?auto_359170 ) ( CLEAR ?auto_359169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_359158 ?auto_359159 ?auto_359160 ?auto_359161 ?auto_359162 ?auto_359163 ?auto_359164 ?auto_359165 ?auto_359166 ?auto_359167 ?auto_359168 ?auto_359169 )
      ( MAKE-13PILE ?auto_359158 ?auto_359159 ?auto_359160 ?auto_359161 ?auto_359162 ?auto_359163 ?auto_359164 ?auto_359165 ?auto_359166 ?auto_359167 ?auto_359168 ?auto_359169 ?auto_359170 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359212 - BLOCK
      ?auto_359213 - BLOCK
      ?auto_359214 - BLOCK
      ?auto_359215 - BLOCK
      ?auto_359216 - BLOCK
      ?auto_359217 - BLOCK
      ?auto_359218 - BLOCK
      ?auto_359219 - BLOCK
      ?auto_359220 - BLOCK
      ?auto_359221 - BLOCK
      ?auto_359222 - BLOCK
      ?auto_359223 - BLOCK
      ?auto_359224 - BLOCK
    )
    :vars
    (
      ?auto_359225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359224 ?auto_359225 ) ( ON-TABLE ?auto_359212 ) ( ON ?auto_359213 ?auto_359212 ) ( ON ?auto_359214 ?auto_359213 ) ( ON ?auto_359215 ?auto_359214 ) ( ON ?auto_359216 ?auto_359215 ) ( ON ?auto_359217 ?auto_359216 ) ( ON ?auto_359218 ?auto_359217 ) ( ON ?auto_359219 ?auto_359218 ) ( ON ?auto_359220 ?auto_359219 ) ( ON ?auto_359221 ?auto_359220 ) ( not ( = ?auto_359212 ?auto_359213 ) ) ( not ( = ?auto_359212 ?auto_359214 ) ) ( not ( = ?auto_359212 ?auto_359215 ) ) ( not ( = ?auto_359212 ?auto_359216 ) ) ( not ( = ?auto_359212 ?auto_359217 ) ) ( not ( = ?auto_359212 ?auto_359218 ) ) ( not ( = ?auto_359212 ?auto_359219 ) ) ( not ( = ?auto_359212 ?auto_359220 ) ) ( not ( = ?auto_359212 ?auto_359221 ) ) ( not ( = ?auto_359212 ?auto_359222 ) ) ( not ( = ?auto_359212 ?auto_359223 ) ) ( not ( = ?auto_359212 ?auto_359224 ) ) ( not ( = ?auto_359212 ?auto_359225 ) ) ( not ( = ?auto_359213 ?auto_359214 ) ) ( not ( = ?auto_359213 ?auto_359215 ) ) ( not ( = ?auto_359213 ?auto_359216 ) ) ( not ( = ?auto_359213 ?auto_359217 ) ) ( not ( = ?auto_359213 ?auto_359218 ) ) ( not ( = ?auto_359213 ?auto_359219 ) ) ( not ( = ?auto_359213 ?auto_359220 ) ) ( not ( = ?auto_359213 ?auto_359221 ) ) ( not ( = ?auto_359213 ?auto_359222 ) ) ( not ( = ?auto_359213 ?auto_359223 ) ) ( not ( = ?auto_359213 ?auto_359224 ) ) ( not ( = ?auto_359213 ?auto_359225 ) ) ( not ( = ?auto_359214 ?auto_359215 ) ) ( not ( = ?auto_359214 ?auto_359216 ) ) ( not ( = ?auto_359214 ?auto_359217 ) ) ( not ( = ?auto_359214 ?auto_359218 ) ) ( not ( = ?auto_359214 ?auto_359219 ) ) ( not ( = ?auto_359214 ?auto_359220 ) ) ( not ( = ?auto_359214 ?auto_359221 ) ) ( not ( = ?auto_359214 ?auto_359222 ) ) ( not ( = ?auto_359214 ?auto_359223 ) ) ( not ( = ?auto_359214 ?auto_359224 ) ) ( not ( = ?auto_359214 ?auto_359225 ) ) ( not ( = ?auto_359215 ?auto_359216 ) ) ( not ( = ?auto_359215 ?auto_359217 ) ) ( not ( = ?auto_359215 ?auto_359218 ) ) ( not ( = ?auto_359215 ?auto_359219 ) ) ( not ( = ?auto_359215 ?auto_359220 ) ) ( not ( = ?auto_359215 ?auto_359221 ) ) ( not ( = ?auto_359215 ?auto_359222 ) ) ( not ( = ?auto_359215 ?auto_359223 ) ) ( not ( = ?auto_359215 ?auto_359224 ) ) ( not ( = ?auto_359215 ?auto_359225 ) ) ( not ( = ?auto_359216 ?auto_359217 ) ) ( not ( = ?auto_359216 ?auto_359218 ) ) ( not ( = ?auto_359216 ?auto_359219 ) ) ( not ( = ?auto_359216 ?auto_359220 ) ) ( not ( = ?auto_359216 ?auto_359221 ) ) ( not ( = ?auto_359216 ?auto_359222 ) ) ( not ( = ?auto_359216 ?auto_359223 ) ) ( not ( = ?auto_359216 ?auto_359224 ) ) ( not ( = ?auto_359216 ?auto_359225 ) ) ( not ( = ?auto_359217 ?auto_359218 ) ) ( not ( = ?auto_359217 ?auto_359219 ) ) ( not ( = ?auto_359217 ?auto_359220 ) ) ( not ( = ?auto_359217 ?auto_359221 ) ) ( not ( = ?auto_359217 ?auto_359222 ) ) ( not ( = ?auto_359217 ?auto_359223 ) ) ( not ( = ?auto_359217 ?auto_359224 ) ) ( not ( = ?auto_359217 ?auto_359225 ) ) ( not ( = ?auto_359218 ?auto_359219 ) ) ( not ( = ?auto_359218 ?auto_359220 ) ) ( not ( = ?auto_359218 ?auto_359221 ) ) ( not ( = ?auto_359218 ?auto_359222 ) ) ( not ( = ?auto_359218 ?auto_359223 ) ) ( not ( = ?auto_359218 ?auto_359224 ) ) ( not ( = ?auto_359218 ?auto_359225 ) ) ( not ( = ?auto_359219 ?auto_359220 ) ) ( not ( = ?auto_359219 ?auto_359221 ) ) ( not ( = ?auto_359219 ?auto_359222 ) ) ( not ( = ?auto_359219 ?auto_359223 ) ) ( not ( = ?auto_359219 ?auto_359224 ) ) ( not ( = ?auto_359219 ?auto_359225 ) ) ( not ( = ?auto_359220 ?auto_359221 ) ) ( not ( = ?auto_359220 ?auto_359222 ) ) ( not ( = ?auto_359220 ?auto_359223 ) ) ( not ( = ?auto_359220 ?auto_359224 ) ) ( not ( = ?auto_359220 ?auto_359225 ) ) ( not ( = ?auto_359221 ?auto_359222 ) ) ( not ( = ?auto_359221 ?auto_359223 ) ) ( not ( = ?auto_359221 ?auto_359224 ) ) ( not ( = ?auto_359221 ?auto_359225 ) ) ( not ( = ?auto_359222 ?auto_359223 ) ) ( not ( = ?auto_359222 ?auto_359224 ) ) ( not ( = ?auto_359222 ?auto_359225 ) ) ( not ( = ?auto_359223 ?auto_359224 ) ) ( not ( = ?auto_359223 ?auto_359225 ) ) ( not ( = ?auto_359224 ?auto_359225 ) ) ( ON ?auto_359223 ?auto_359224 ) ( CLEAR ?auto_359221 ) ( ON ?auto_359222 ?auto_359223 ) ( CLEAR ?auto_359222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_359212 ?auto_359213 ?auto_359214 ?auto_359215 ?auto_359216 ?auto_359217 ?auto_359218 ?auto_359219 ?auto_359220 ?auto_359221 ?auto_359222 )
      ( MAKE-13PILE ?auto_359212 ?auto_359213 ?auto_359214 ?auto_359215 ?auto_359216 ?auto_359217 ?auto_359218 ?auto_359219 ?auto_359220 ?auto_359221 ?auto_359222 ?auto_359223 ?auto_359224 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359266 - BLOCK
      ?auto_359267 - BLOCK
      ?auto_359268 - BLOCK
      ?auto_359269 - BLOCK
      ?auto_359270 - BLOCK
      ?auto_359271 - BLOCK
      ?auto_359272 - BLOCK
      ?auto_359273 - BLOCK
      ?auto_359274 - BLOCK
      ?auto_359275 - BLOCK
      ?auto_359276 - BLOCK
      ?auto_359277 - BLOCK
      ?auto_359278 - BLOCK
    )
    :vars
    (
      ?auto_359279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359278 ?auto_359279 ) ( ON-TABLE ?auto_359266 ) ( ON ?auto_359267 ?auto_359266 ) ( ON ?auto_359268 ?auto_359267 ) ( ON ?auto_359269 ?auto_359268 ) ( ON ?auto_359270 ?auto_359269 ) ( ON ?auto_359271 ?auto_359270 ) ( ON ?auto_359272 ?auto_359271 ) ( ON ?auto_359273 ?auto_359272 ) ( ON ?auto_359274 ?auto_359273 ) ( not ( = ?auto_359266 ?auto_359267 ) ) ( not ( = ?auto_359266 ?auto_359268 ) ) ( not ( = ?auto_359266 ?auto_359269 ) ) ( not ( = ?auto_359266 ?auto_359270 ) ) ( not ( = ?auto_359266 ?auto_359271 ) ) ( not ( = ?auto_359266 ?auto_359272 ) ) ( not ( = ?auto_359266 ?auto_359273 ) ) ( not ( = ?auto_359266 ?auto_359274 ) ) ( not ( = ?auto_359266 ?auto_359275 ) ) ( not ( = ?auto_359266 ?auto_359276 ) ) ( not ( = ?auto_359266 ?auto_359277 ) ) ( not ( = ?auto_359266 ?auto_359278 ) ) ( not ( = ?auto_359266 ?auto_359279 ) ) ( not ( = ?auto_359267 ?auto_359268 ) ) ( not ( = ?auto_359267 ?auto_359269 ) ) ( not ( = ?auto_359267 ?auto_359270 ) ) ( not ( = ?auto_359267 ?auto_359271 ) ) ( not ( = ?auto_359267 ?auto_359272 ) ) ( not ( = ?auto_359267 ?auto_359273 ) ) ( not ( = ?auto_359267 ?auto_359274 ) ) ( not ( = ?auto_359267 ?auto_359275 ) ) ( not ( = ?auto_359267 ?auto_359276 ) ) ( not ( = ?auto_359267 ?auto_359277 ) ) ( not ( = ?auto_359267 ?auto_359278 ) ) ( not ( = ?auto_359267 ?auto_359279 ) ) ( not ( = ?auto_359268 ?auto_359269 ) ) ( not ( = ?auto_359268 ?auto_359270 ) ) ( not ( = ?auto_359268 ?auto_359271 ) ) ( not ( = ?auto_359268 ?auto_359272 ) ) ( not ( = ?auto_359268 ?auto_359273 ) ) ( not ( = ?auto_359268 ?auto_359274 ) ) ( not ( = ?auto_359268 ?auto_359275 ) ) ( not ( = ?auto_359268 ?auto_359276 ) ) ( not ( = ?auto_359268 ?auto_359277 ) ) ( not ( = ?auto_359268 ?auto_359278 ) ) ( not ( = ?auto_359268 ?auto_359279 ) ) ( not ( = ?auto_359269 ?auto_359270 ) ) ( not ( = ?auto_359269 ?auto_359271 ) ) ( not ( = ?auto_359269 ?auto_359272 ) ) ( not ( = ?auto_359269 ?auto_359273 ) ) ( not ( = ?auto_359269 ?auto_359274 ) ) ( not ( = ?auto_359269 ?auto_359275 ) ) ( not ( = ?auto_359269 ?auto_359276 ) ) ( not ( = ?auto_359269 ?auto_359277 ) ) ( not ( = ?auto_359269 ?auto_359278 ) ) ( not ( = ?auto_359269 ?auto_359279 ) ) ( not ( = ?auto_359270 ?auto_359271 ) ) ( not ( = ?auto_359270 ?auto_359272 ) ) ( not ( = ?auto_359270 ?auto_359273 ) ) ( not ( = ?auto_359270 ?auto_359274 ) ) ( not ( = ?auto_359270 ?auto_359275 ) ) ( not ( = ?auto_359270 ?auto_359276 ) ) ( not ( = ?auto_359270 ?auto_359277 ) ) ( not ( = ?auto_359270 ?auto_359278 ) ) ( not ( = ?auto_359270 ?auto_359279 ) ) ( not ( = ?auto_359271 ?auto_359272 ) ) ( not ( = ?auto_359271 ?auto_359273 ) ) ( not ( = ?auto_359271 ?auto_359274 ) ) ( not ( = ?auto_359271 ?auto_359275 ) ) ( not ( = ?auto_359271 ?auto_359276 ) ) ( not ( = ?auto_359271 ?auto_359277 ) ) ( not ( = ?auto_359271 ?auto_359278 ) ) ( not ( = ?auto_359271 ?auto_359279 ) ) ( not ( = ?auto_359272 ?auto_359273 ) ) ( not ( = ?auto_359272 ?auto_359274 ) ) ( not ( = ?auto_359272 ?auto_359275 ) ) ( not ( = ?auto_359272 ?auto_359276 ) ) ( not ( = ?auto_359272 ?auto_359277 ) ) ( not ( = ?auto_359272 ?auto_359278 ) ) ( not ( = ?auto_359272 ?auto_359279 ) ) ( not ( = ?auto_359273 ?auto_359274 ) ) ( not ( = ?auto_359273 ?auto_359275 ) ) ( not ( = ?auto_359273 ?auto_359276 ) ) ( not ( = ?auto_359273 ?auto_359277 ) ) ( not ( = ?auto_359273 ?auto_359278 ) ) ( not ( = ?auto_359273 ?auto_359279 ) ) ( not ( = ?auto_359274 ?auto_359275 ) ) ( not ( = ?auto_359274 ?auto_359276 ) ) ( not ( = ?auto_359274 ?auto_359277 ) ) ( not ( = ?auto_359274 ?auto_359278 ) ) ( not ( = ?auto_359274 ?auto_359279 ) ) ( not ( = ?auto_359275 ?auto_359276 ) ) ( not ( = ?auto_359275 ?auto_359277 ) ) ( not ( = ?auto_359275 ?auto_359278 ) ) ( not ( = ?auto_359275 ?auto_359279 ) ) ( not ( = ?auto_359276 ?auto_359277 ) ) ( not ( = ?auto_359276 ?auto_359278 ) ) ( not ( = ?auto_359276 ?auto_359279 ) ) ( not ( = ?auto_359277 ?auto_359278 ) ) ( not ( = ?auto_359277 ?auto_359279 ) ) ( not ( = ?auto_359278 ?auto_359279 ) ) ( ON ?auto_359277 ?auto_359278 ) ( ON ?auto_359276 ?auto_359277 ) ( CLEAR ?auto_359274 ) ( ON ?auto_359275 ?auto_359276 ) ( CLEAR ?auto_359275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_359266 ?auto_359267 ?auto_359268 ?auto_359269 ?auto_359270 ?auto_359271 ?auto_359272 ?auto_359273 ?auto_359274 ?auto_359275 )
      ( MAKE-13PILE ?auto_359266 ?auto_359267 ?auto_359268 ?auto_359269 ?auto_359270 ?auto_359271 ?auto_359272 ?auto_359273 ?auto_359274 ?auto_359275 ?auto_359276 ?auto_359277 ?auto_359278 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359320 - BLOCK
      ?auto_359321 - BLOCK
      ?auto_359322 - BLOCK
      ?auto_359323 - BLOCK
      ?auto_359324 - BLOCK
      ?auto_359325 - BLOCK
      ?auto_359326 - BLOCK
      ?auto_359327 - BLOCK
      ?auto_359328 - BLOCK
      ?auto_359329 - BLOCK
      ?auto_359330 - BLOCK
      ?auto_359331 - BLOCK
      ?auto_359332 - BLOCK
    )
    :vars
    (
      ?auto_359333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359332 ?auto_359333 ) ( ON-TABLE ?auto_359320 ) ( ON ?auto_359321 ?auto_359320 ) ( ON ?auto_359322 ?auto_359321 ) ( ON ?auto_359323 ?auto_359322 ) ( ON ?auto_359324 ?auto_359323 ) ( ON ?auto_359325 ?auto_359324 ) ( ON ?auto_359326 ?auto_359325 ) ( ON ?auto_359327 ?auto_359326 ) ( not ( = ?auto_359320 ?auto_359321 ) ) ( not ( = ?auto_359320 ?auto_359322 ) ) ( not ( = ?auto_359320 ?auto_359323 ) ) ( not ( = ?auto_359320 ?auto_359324 ) ) ( not ( = ?auto_359320 ?auto_359325 ) ) ( not ( = ?auto_359320 ?auto_359326 ) ) ( not ( = ?auto_359320 ?auto_359327 ) ) ( not ( = ?auto_359320 ?auto_359328 ) ) ( not ( = ?auto_359320 ?auto_359329 ) ) ( not ( = ?auto_359320 ?auto_359330 ) ) ( not ( = ?auto_359320 ?auto_359331 ) ) ( not ( = ?auto_359320 ?auto_359332 ) ) ( not ( = ?auto_359320 ?auto_359333 ) ) ( not ( = ?auto_359321 ?auto_359322 ) ) ( not ( = ?auto_359321 ?auto_359323 ) ) ( not ( = ?auto_359321 ?auto_359324 ) ) ( not ( = ?auto_359321 ?auto_359325 ) ) ( not ( = ?auto_359321 ?auto_359326 ) ) ( not ( = ?auto_359321 ?auto_359327 ) ) ( not ( = ?auto_359321 ?auto_359328 ) ) ( not ( = ?auto_359321 ?auto_359329 ) ) ( not ( = ?auto_359321 ?auto_359330 ) ) ( not ( = ?auto_359321 ?auto_359331 ) ) ( not ( = ?auto_359321 ?auto_359332 ) ) ( not ( = ?auto_359321 ?auto_359333 ) ) ( not ( = ?auto_359322 ?auto_359323 ) ) ( not ( = ?auto_359322 ?auto_359324 ) ) ( not ( = ?auto_359322 ?auto_359325 ) ) ( not ( = ?auto_359322 ?auto_359326 ) ) ( not ( = ?auto_359322 ?auto_359327 ) ) ( not ( = ?auto_359322 ?auto_359328 ) ) ( not ( = ?auto_359322 ?auto_359329 ) ) ( not ( = ?auto_359322 ?auto_359330 ) ) ( not ( = ?auto_359322 ?auto_359331 ) ) ( not ( = ?auto_359322 ?auto_359332 ) ) ( not ( = ?auto_359322 ?auto_359333 ) ) ( not ( = ?auto_359323 ?auto_359324 ) ) ( not ( = ?auto_359323 ?auto_359325 ) ) ( not ( = ?auto_359323 ?auto_359326 ) ) ( not ( = ?auto_359323 ?auto_359327 ) ) ( not ( = ?auto_359323 ?auto_359328 ) ) ( not ( = ?auto_359323 ?auto_359329 ) ) ( not ( = ?auto_359323 ?auto_359330 ) ) ( not ( = ?auto_359323 ?auto_359331 ) ) ( not ( = ?auto_359323 ?auto_359332 ) ) ( not ( = ?auto_359323 ?auto_359333 ) ) ( not ( = ?auto_359324 ?auto_359325 ) ) ( not ( = ?auto_359324 ?auto_359326 ) ) ( not ( = ?auto_359324 ?auto_359327 ) ) ( not ( = ?auto_359324 ?auto_359328 ) ) ( not ( = ?auto_359324 ?auto_359329 ) ) ( not ( = ?auto_359324 ?auto_359330 ) ) ( not ( = ?auto_359324 ?auto_359331 ) ) ( not ( = ?auto_359324 ?auto_359332 ) ) ( not ( = ?auto_359324 ?auto_359333 ) ) ( not ( = ?auto_359325 ?auto_359326 ) ) ( not ( = ?auto_359325 ?auto_359327 ) ) ( not ( = ?auto_359325 ?auto_359328 ) ) ( not ( = ?auto_359325 ?auto_359329 ) ) ( not ( = ?auto_359325 ?auto_359330 ) ) ( not ( = ?auto_359325 ?auto_359331 ) ) ( not ( = ?auto_359325 ?auto_359332 ) ) ( not ( = ?auto_359325 ?auto_359333 ) ) ( not ( = ?auto_359326 ?auto_359327 ) ) ( not ( = ?auto_359326 ?auto_359328 ) ) ( not ( = ?auto_359326 ?auto_359329 ) ) ( not ( = ?auto_359326 ?auto_359330 ) ) ( not ( = ?auto_359326 ?auto_359331 ) ) ( not ( = ?auto_359326 ?auto_359332 ) ) ( not ( = ?auto_359326 ?auto_359333 ) ) ( not ( = ?auto_359327 ?auto_359328 ) ) ( not ( = ?auto_359327 ?auto_359329 ) ) ( not ( = ?auto_359327 ?auto_359330 ) ) ( not ( = ?auto_359327 ?auto_359331 ) ) ( not ( = ?auto_359327 ?auto_359332 ) ) ( not ( = ?auto_359327 ?auto_359333 ) ) ( not ( = ?auto_359328 ?auto_359329 ) ) ( not ( = ?auto_359328 ?auto_359330 ) ) ( not ( = ?auto_359328 ?auto_359331 ) ) ( not ( = ?auto_359328 ?auto_359332 ) ) ( not ( = ?auto_359328 ?auto_359333 ) ) ( not ( = ?auto_359329 ?auto_359330 ) ) ( not ( = ?auto_359329 ?auto_359331 ) ) ( not ( = ?auto_359329 ?auto_359332 ) ) ( not ( = ?auto_359329 ?auto_359333 ) ) ( not ( = ?auto_359330 ?auto_359331 ) ) ( not ( = ?auto_359330 ?auto_359332 ) ) ( not ( = ?auto_359330 ?auto_359333 ) ) ( not ( = ?auto_359331 ?auto_359332 ) ) ( not ( = ?auto_359331 ?auto_359333 ) ) ( not ( = ?auto_359332 ?auto_359333 ) ) ( ON ?auto_359331 ?auto_359332 ) ( ON ?auto_359330 ?auto_359331 ) ( ON ?auto_359329 ?auto_359330 ) ( CLEAR ?auto_359327 ) ( ON ?auto_359328 ?auto_359329 ) ( CLEAR ?auto_359328 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_359320 ?auto_359321 ?auto_359322 ?auto_359323 ?auto_359324 ?auto_359325 ?auto_359326 ?auto_359327 ?auto_359328 )
      ( MAKE-13PILE ?auto_359320 ?auto_359321 ?auto_359322 ?auto_359323 ?auto_359324 ?auto_359325 ?auto_359326 ?auto_359327 ?auto_359328 ?auto_359329 ?auto_359330 ?auto_359331 ?auto_359332 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359374 - BLOCK
      ?auto_359375 - BLOCK
      ?auto_359376 - BLOCK
      ?auto_359377 - BLOCK
      ?auto_359378 - BLOCK
      ?auto_359379 - BLOCK
      ?auto_359380 - BLOCK
      ?auto_359381 - BLOCK
      ?auto_359382 - BLOCK
      ?auto_359383 - BLOCK
      ?auto_359384 - BLOCK
      ?auto_359385 - BLOCK
      ?auto_359386 - BLOCK
    )
    :vars
    (
      ?auto_359387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359386 ?auto_359387 ) ( ON-TABLE ?auto_359374 ) ( ON ?auto_359375 ?auto_359374 ) ( ON ?auto_359376 ?auto_359375 ) ( ON ?auto_359377 ?auto_359376 ) ( ON ?auto_359378 ?auto_359377 ) ( ON ?auto_359379 ?auto_359378 ) ( ON ?auto_359380 ?auto_359379 ) ( not ( = ?auto_359374 ?auto_359375 ) ) ( not ( = ?auto_359374 ?auto_359376 ) ) ( not ( = ?auto_359374 ?auto_359377 ) ) ( not ( = ?auto_359374 ?auto_359378 ) ) ( not ( = ?auto_359374 ?auto_359379 ) ) ( not ( = ?auto_359374 ?auto_359380 ) ) ( not ( = ?auto_359374 ?auto_359381 ) ) ( not ( = ?auto_359374 ?auto_359382 ) ) ( not ( = ?auto_359374 ?auto_359383 ) ) ( not ( = ?auto_359374 ?auto_359384 ) ) ( not ( = ?auto_359374 ?auto_359385 ) ) ( not ( = ?auto_359374 ?auto_359386 ) ) ( not ( = ?auto_359374 ?auto_359387 ) ) ( not ( = ?auto_359375 ?auto_359376 ) ) ( not ( = ?auto_359375 ?auto_359377 ) ) ( not ( = ?auto_359375 ?auto_359378 ) ) ( not ( = ?auto_359375 ?auto_359379 ) ) ( not ( = ?auto_359375 ?auto_359380 ) ) ( not ( = ?auto_359375 ?auto_359381 ) ) ( not ( = ?auto_359375 ?auto_359382 ) ) ( not ( = ?auto_359375 ?auto_359383 ) ) ( not ( = ?auto_359375 ?auto_359384 ) ) ( not ( = ?auto_359375 ?auto_359385 ) ) ( not ( = ?auto_359375 ?auto_359386 ) ) ( not ( = ?auto_359375 ?auto_359387 ) ) ( not ( = ?auto_359376 ?auto_359377 ) ) ( not ( = ?auto_359376 ?auto_359378 ) ) ( not ( = ?auto_359376 ?auto_359379 ) ) ( not ( = ?auto_359376 ?auto_359380 ) ) ( not ( = ?auto_359376 ?auto_359381 ) ) ( not ( = ?auto_359376 ?auto_359382 ) ) ( not ( = ?auto_359376 ?auto_359383 ) ) ( not ( = ?auto_359376 ?auto_359384 ) ) ( not ( = ?auto_359376 ?auto_359385 ) ) ( not ( = ?auto_359376 ?auto_359386 ) ) ( not ( = ?auto_359376 ?auto_359387 ) ) ( not ( = ?auto_359377 ?auto_359378 ) ) ( not ( = ?auto_359377 ?auto_359379 ) ) ( not ( = ?auto_359377 ?auto_359380 ) ) ( not ( = ?auto_359377 ?auto_359381 ) ) ( not ( = ?auto_359377 ?auto_359382 ) ) ( not ( = ?auto_359377 ?auto_359383 ) ) ( not ( = ?auto_359377 ?auto_359384 ) ) ( not ( = ?auto_359377 ?auto_359385 ) ) ( not ( = ?auto_359377 ?auto_359386 ) ) ( not ( = ?auto_359377 ?auto_359387 ) ) ( not ( = ?auto_359378 ?auto_359379 ) ) ( not ( = ?auto_359378 ?auto_359380 ) ) ( not ( = ?auto_359378 ?auto_359381 ) ) ( not ( = ?auto_359378 ?auto_359382 ) ) ( not ( = ?auto_359378 ?auto_359383 ) ) ( not ( = ?auto_359378 ?auto_359384 ) ) ( not ( = ?auto_359378 ?auto_359385 ) ) ( not ( = ?auto_359378 ?auto_359386 ) ) ( not ( = ?auto_359378 ?auto_359387 ) ) ( not ( = ?auto_359379 ?auto_359380 ) ) ( not ( = ?auto_359379 ?auto_359381 ) ) ( not ( = ?auto_359379 ?auto_359382 ) ) ( not ( = ?auto_359379 ?auto_359383 ) ) ( not ( = ?auto_359379 ?auto_359384 ) ) ( not ( = ?auto_359379 ?auto_359385 ) ) ( not ( = ?auto_359379 ?auto_359386 ) ) ( not ( = ?auto_359379 ?auto_359387 ) ) ( not ( = ?auto_359380 ?auto_359381 ) ) ( not ( = ?auto_359380 ?auto_359382 ) ) ( not ( = ?auto_359380 ?auto_359383 ) ) ( not ( = ?auto_359380 ?auto_359384 ) ) ( not ( = ?auto_359380 ?auto_359385 ) ) ( not ( = ?auto_359380 ?auto_359386 ) ) ( not ( = ?auto_359380 ?auto_359387 ) ) ( not ( = ?auto_359381 ?auto_359382 ) ) ( not ( = ?auto_359381 ?auto_359383 ) ) ( not ( = ?auto_359381 ?auto_359384 ) ) ( not ( = ?auto_359381 ?auto_359385 ) ) ( not ( = ?auto_359381 ?auto_359386 ) ) ( not ( = ?auto_359381 ?auto_359387 ) ) ( not ( = ?auto_359382 ?auto_359383 ) ) ( not ( = ?auto_359382 ?auto_359384 ) ) ( not ( = ?auto_359382 ?auto_359385 ) ) ( not ( = ?auto_359382 ?auto_359386 ) ) ( not ( = ?auto_359382 ?auto_359387 ) ) ( not ( = ?auto_359383 ?auto_359384 ) ) ( not ( = ?auto_359383 ?auto_359385 ) ) ( not ( = ?auto_359383 ?auto_359386 ) ) ( not ( = ?auto_359383 ?auto_359387 ) ) ( not ( = ?auto_359384 ?auto_359385 ) ) ( not ( = ?auto_359384 ?auto_359386 ) ) ( not ( = ?auto_359384 ?auto_359387 ) ) ( not ( = ?auto_359385 ?auto_359386 ) ) ( not ( = ?auto_359385 ?auto_359387 ) ) ( not ( = ?auto_359386 ?auto_359387 ) ) ( ON ?auto_359385 ?auto_359386 ) ( ON ?auto_359384 ?auto_359385 ) ( ON ?auto_359383 ?auto_359384 ) ( ON ?auto_359382 ?auto_359383 ) ( CLEAR ?auto_359380 ) ( ON ?auto_359381 ?auto_359382 ) ( CLEAR ?auto_359381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_359374 ?auto_359375 ?auto_359376 ?auto_359377 ?auto_359378 ?auto_359379 ?auto_359380 ?auto_359381 )
      ( MAKE-13PILE ?auto_359374 ?auto_359375 ?auto_359376 ?auto_359377 ?auto_359378 ?auto_359379 ?auto_359380 ?auto_359381 ?auto_359382 ?auto_359383 ?auto_359384 ?auto_359385 ?auto_359386 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359428 - BLOCK
      ?auto_359429 - BLOCK
      ?auto_359430 - BLOCK
      ?auto_359431 - BLOCK
      ?auto_359432 - BLOCK
      ?auto_359433 - BLOCK
      ?auto_359434 - BLOCK
      ?auto_359435 - BLOCK
      ?auto_359436 - BLOCK
      ?auto_359437 - BLOCK
      ?auto_359438 - BLOCK
      ?auto_359439 - BLOCK
      ?auto_359440 - BLOCK
    )
    :vars
    (
      ?auto_359441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359440 ?auto_359441 ) ( ON-TABLE ?auto_359428 ) ( ON ?auto_359429 ?auto_359428 ) ( ON ?auto_359430 ?auto_359429 ) ( ON ?auto_359431 ?auto_359430 ) ( ON ?auto_359432 ?auto_359431 ) ( ON ?auto_359433 ?auto_359432 ) ( not ( = ?auto_359428 ?auto_359429 ) ) ( not ( = ?auto_359428 ?auto_359430 ) ) ( not ( = ?auto_359428 ?auto_359431 ) ) ( not ( = ?auto_359428 ?auto_359432 ) ) ( not ( = ?auto_359428 ?auto_359433 ) ) ( not ( = ?auto_359428 ?auto_359434 ) ) ( not ( = ?auto_359428 ?auto_359435 ) ) ( not ( = ?auto_359428 ?auto_359436 ) ) ( not ( = ?auto_359428 ?auto_359437 ) ) ( not ( = ?auto_359428 ?auto_359438 ) ) ( not ( = ?auto_359428 ?auto_359439 ) ) ( not ( = ?auto_359428 ?auto_359440 ) ) ( not ( = ?auto_359428 ?auto_359441 ) ) ( not ( = ?auto_359429 ?auto_359430 ) ) ( not ( = ?auto_359429 ?auto_359431 ) ) ( not ( = ?auto_359429 ?auto_359432 ) ) ( not ( = ?auto_359429 ?auto_359433 ) ) ( not ( = ?auto_359429 ?auto_359434 ) ) ( not ( = ?auto_359429 ?auto_359435 ) ) ( not ( = ?auto_359429 ?auto_359436 ) ) ( not ( = ?auto_359429 ?auto_359437 ) ) ( not ( = ?auto_359429 ?auto_359438 ) ) ( not ( = ?auto_359429 ?auto_359439 ) ) ( not ( = ?auto_359429 ?auto_359440 ) ) ( not ( = ?auto_359429 ?auto_359441 ) ) ( not ( = ?auto_359430 ?auto_359431 ) ) ( not ( = ?auto_359430 ?auto_359432 ) ) ( not ( = ?auto_359430 ?auto_359433 ) ) ( not ( = ?auto_359430 ?auto_359434 ) ) ( not ( = ?auto_359430 ?auto_359435 ) ) ( not ( = ?auto_359430 ?auto_359436 ) ) ( not ( = ?auto_359430 ?auto_359437 ) ) ( not ( = ?auto_359430 ?auto_359438 ) ) ( not ( = ?auto_359430 ?auto_359439 ) ) ( not ( = ?auto_359430 ?auto_359440 ) ) ( not ( = ?auto_359430 ?auto_359441 ) ) ( not ( = ?auto_359431 ?auto_359432 ) ) ( not ( = ?auto_359431 ?auto_359433 ) ) ( not ( = ?auto_359431 ?auto_359434 ) ) ( not ( = ?auto_359431 ?auto_359435 ) ) ( not ( = ?auto_359431 ?auto_359436 ) ) ( not ( = ?auto_359431 ?auto_359437 ) ) ( not ( = ?auto_359431 ?auto_359438 ) ) ( not ( = ?auto_359431 ?auto_359439 ) ) ( not ( = ?auto_359431 ?auto_359440 ) ) ( not ( = ?auto_359431 ?auto_359441 ) ) ( not ( = ?auto_359432 ?auto_359433 ) ) ( not ( = ?auto_359432 ?auto_359434 ) ) ( not ( = ?auto_359432 ?auto_359435 ) ) ( not ( = ?auto_359432 ?auto_359436 ) ) ( not ( = ?auto_359432 ?auto_359437 ) ) ( not ( = ?auto_359432 ?auto_359438 ) ) ( not ( = ?auto_359432 ?auto_359439 ) ) ( not ( = ?auto_359432 ?auto_359440 ) ) ( not ( = ?auto_359432 ?auto_359441 ) ) ( not ( = ?auto_359433 ?auto_359434 ) ) ( not ( = ?auto_359433 ?auto_359435 ) ) ( not ( = ?auto_359433 ?auto_359436 ) ) ( not ( = ?auto_359433 ?auto_359437 ) ) ( not ( = ?auto_359433 ?auto_359438 ) ) ( not ( = ?auto_359433 ?auto_359439 ) ) ( not ( = ?auto_359433 ?auto_359440 ) ) ( not ( = ?auto_359433 ?auto_359441 ) ) ( not ( = ?auto_359434 ?auto_359435 ) ) ( not ( = ?auto_359434 ?auto_359436 ) ) ( not ( = ?auto_359434 ?auto_359437 ) ) ( not ( = ?auto_359434 ?auto_359438 ) ) ( not ( = ?auto_359434 ?auto_359439 ) ) ( not ( = ?auto_359434 ?auto_359440 ) ) ( not ( = ?auto_359434 ?auto_359441 ) ) ( not ( = ?auto_359435 ?auto_359436 ) ) ( not ( = ?auto_359435 ?auto_359437 ) ) ( not ( = ?auto_359435 ?auto_359438 ) ) ( not ( = ?auto_359435 ?auto_359439 ) ) ( not ( = ?auto_359435 ?auto_359440 ) ) ( not ( = ?auto_359435 ?auto_359441 ) ) ( not ( = ?auto_359436 ?auto_359437 ) ) ( not ( = ?auto_359436 ?auto_359438 ) ) ( not ( = ?auto_359436 ?auto_359439 ) ) ( not ( = ?auto_359436 ?auto_359440 ) ) ( not ( = ?auto_359436 ?auto_359441 ) ) ( not ( = ?auto_359437 ?auto_359438 ) ) ( not ( = ?auto_359437 ?auto_359439 ) ) ( not ( = ?auto_359437 ?auto_359440 ) ) ( not ( = ?auto_359437 ?auto_359441 ) ) ( not ( = ?auto_359438 ?auto_359439 ) ) ( not ( = ?auto_359438 ?auto_359440 ) ) ( not ( = ?auto_359438 ?auto_359441 ) ) ( not ( = ?auto_359439 ?auto_359440 ) ) ( not ( = ?auto_359439 ?auto_359441 ) ) ( not ( = ?auto_359440 ?auto_359441 ) ) ( ON ?auto_359439 ?auto_359440 ) ( ON ?auto_359438 ?auto_359439 ) ( ON ?auto_359437 ?auto_359438 ) ( ON ?auto_359436 ?auto_359437 ) ( ON ?auto_359435 ?auto_359436 ) ( CLEAR ?auto_359433 ) ( ON ?auto_359434 ?auto_359435 ) ( CLEAR ?auto_359434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_359428 ?auto_359429 ?auto_359430 ?auto_359431 ?auto_359432 ?auto_359433 ?auto_359434 )
      ( MAKE-13PILE ?auto_359428 ?auto_359429 ?auto_359430 ?auto_359431 ?auto_359432 ?auto_359433 ?auto_359434 ?auto_359435 ?auto_359436 ?auto_359437 ?auto_359438 ?auto_359439 ?auto_359440 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359482 - BLOCK
      ?auto_359483 - BLOCK
      ?auto_359484 - BLOCK
      ?auto_359485 - BLOCK
      ?auto_359486 - BLOCK
      ?auto_359487 - BLOCK
      ?auto_359488 - BLOCK
      ?auto_359489 - BLOCK
      ?auto_359490 - BLOCK
      ?auto_359491 - BLOCK
      ?auto_359492 - BLOCK
      ?auto_359493 - BLOCK
      ?auto_359494 - BLOCK
    )
    :vars
    (
      ?auto_359495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359494 ?auto_359495 ) ( ON-TABLE ?auto_359482 ) ( ON ?auto_359483 ?auto_359482 ) ( ON ?auto_359484 ?auto_359483 ) ( ON ?auto_359485 ?auto_359484 ) ( ON ?auto_359486 ?auto_359485 ) ( not ( = ?auto_359482 ?auto_359483 ) ) ( not ( = ?auto_359482 ?auto_359484 ) ) ( not ( = ?auto_359482 ?auto_359485 ) ) ( not ( = ?auto_359482 ?auto_359486 ) ) ( not ( = ?auto_359482 ?auto_359487 ) ) ( not ( = ?auto_359482 ?auto_359488 ) ) ( not ( = ?auto_359482 ?auto_359489 ) ) ( not ( = ?auto_359482 ?auto_359490 ) ) ( not ( = ?auto_359482 ?auto_359491 ) ) ( not ( = ?auto_359482 ?auto_359492 ) ) ( not ( = ?auto_359482 ?auto_359493 ) ) ( not ( = ?auto_359482 ?auto_359494 ) ) ( not ( = ?auto_359482 ?auto_359495 ) ) ( not ( = ?auto_359483 ?auto_359484 ) ) ( not ( = ?auto_359483 ?auto_359485 ) ) ( not ( = ?auto_359483 ?auto_359486 ) ) ( not ( = ?auto_359483 ?auto_359487 ) ) ( not ( = ?auto_359483 ?auto_359488 ) ) ( not ( = ?auto_359483 ?auto_359489 ) ) ( not ( = ?auto_359483 ?auto_359490 ) ) ( not ( = ?auto_359483 ?auto_359491 ) ) ( not ( = ?auto_359483 ?auto_359492 ) ) ( not ( = ?auto_359483 ?auto_359493 ) ) ( not ( = ?auto_359483 ?auto_359494 ) ) ( not ( = ?auto_359483 ?auto_359495 ) ) ( not ( = ?auto_359484 ?auto_359485 ) ) ( not ( = ?auto_359484 ?auto_359486 ) ) ( not ( = ?auto_359484 ?auto_359487 ) ) ( not ( = ?auto_359484 ?auto_359488 ) ) ( not ( = ?auto_359484 ?auto_359489 ) ) ( not ( = ?auto_359484 ?auto_359490 ) ) ( not ( = ?auto_359484 ?auto_359491 ) ) ( not ( = ?auto_359484 ?auto_359492 ) ) ( not ( = ?auto_359484 ?auto_359493 ) ) ( not ( = ?auto_359484 ?auto_359494 ) ) ( not ( = ?auto_359484 ?auto_359495 ) ) ( not ( = ?auto_359485 ?auto_359486 ) ) ( not ( = ?auto_359485 ?auto_359487 ) ) ( not ( = ?auto_359485 ?auto_359488 ) ) ( not ( = ?auto_359485 ?auto_359489 ) ) ( not ( = ?auto_359485 ?auto_359490 ) ) ( not ( = ?auto_359485 ?auto_359491 ) ) ( not ( = ?auto_359485 ?auto_359492 ) ) ( not ( = ?auto_359485 ?auto_359493 ) ) ( not ( = ?auto_359485 ?auto_359494 ) ) ( not ( = ?auto_359485 ?auto_359495 ) ) ( not ( = ?auto_359486 ?auto_359487 ) ) ( not ( = ?auto_359486 ?auto_359488 ) ) ( not ( = ?auto_359486 ?auto_359489 ) ) ( not ( = ?auto_359486 ?auto_359490 ) ) ( not ( = ?auto_359486 ?auto_359491 ) ) ( not ( = ?auto_359486 ?auto_359492 ) ) ( not ( = ?auto_359486 ?auto_359493 ) ) ( not ( = ?auto_359486 ?auto_359494 ) ) ( not ( = ?auto_359486 ?auto_359495 ) ) ( not ( = ?auto_359487 ?auto_359488 ) ) ( not ( = ?auto_359487 ?auto_359489 ) ) ( not ( = ?auto_359487 ?auto_359490 ) ) ( not ( = ?auto_359487 ?auto_359491 ) ) ( not ( = ?auto_359487 ?auto_359492 ) ) ( not ( = ?auto_359487 ?auto_359493 ) ) ( not ( = ?auto_359487 ?auto_359494 ) ) ( not ( = ?auto_359487 ?auto_359495 ) ) ( not ( = ?auto_359488 ?auto_359489 ) ) ( not ( = ?auto_359488 ?auto_359490 ) ) ( not ( = ?auto_359488 ?auto_359491 ) ) ( not ( = ?auto_359488 ?auto_359492 ) ) ( not ( = ?auto_359488 ?auto_359493 ) ) ( not ( = ?auto_359488 ?auto_359494 ) ) ( not ( = ?auto_359488 ?auto_359495 ) ) ( not ( = ?auto_359489 ?auto_359490 ) ) ( not ( = ?auto_359489 ?auto_359491 ) ) ( not ( = ?auto_359489 ?auto_359492 ) ) ( not ( = ?auto_359489 ?auto_359493 ) ) ( not ( = ?auto_359489 ?auto_359494 ) ) ( not ( = ?auto_359489 ?auto_359495 ) ) ( not ( = ?auto_359490 ?auto_359491 ) ) ( not ( = ?auto_359490 ?auto_359492 ) ) ( not ( = ?auto_359490 ?auto_359493 ) ) ( not ( = ?auto_359490 ?auto_359494 ) ) ( not ( = ?auto_359490 ?auto_359495 ) ) ( not ( = ?auto_359491 ?auto_359492 ) ) ( not ( = ?auto_359491 ?auto_359493 ) ) ( not ( = ?auto_359491 ?auto_359494 ) ) ( not ( = ?auto_359491 ?auto_359495 ) ) ( not ( = ?auto_359492 ?auto_359493 ) ) ( not ( = ?auto_359492 ?auto_359494 ) ) ( not ( = ?auto_359492 ?auto_359495 ) ) ( not ( = ?auto_359493 ?auto_359494 ) ) ( not ( = ?auto_359493 ?auto_359495 ) ) ( not ( = ?auto_359494 ?auto_359495 ) ) ( ON ?auto_359493 ?auto_359494 ) ( ON ?auto_359492 ?auto_359493 ) ( ON ?auto_359491 ?auto_359492 ) ( ON ?auto_359490 ?auto_359491 ) ( ON ?auto_359489 ?auto_359490 ) ( ON ?auto_359488 ?auto_359489 ) ( CLEAR ?auto_359486 ) ( ON ?auto_359487 ?auto_359488 ) ( CLEAR ?auto_359487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_359482 ?auto_359483 ?auto_359484 ?auto_359485 ?auto_359486 ?auto_359487 )
      ( MAKE-13PILE ?auto_359482 ?auto_359483 ?auto_359484 ?auto_359485 ?auto_359486 ?auto_359487 ?auto_359488 ?auto_359489 ?auto_359490 ?auto_359491 ?auto_359492 ?auto_359493 ?auto_359494 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359536 - BLOCK
      ?auto_359537 - BLOCK
      ?auto_359538 - BLOCK
      ?auto_359539 - BLOCK
      ?auto_359540 - BLOCK
      ?auto_359541 - BLOCK
      ?auto_359542 - BLOCK
      ?auto_359543 - BLOCK
      ?auto_359544 - BLOCK
      ?auto_359545 - BLOCK
      ?auto_359546 - BLOCK
      ?auto_359547 - BLOCK
      ?auto_359548 - BLOCK
    )
    :vars
    (
      ?auto_359549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359548 ?auto_359549 ) ( ON-TABLE ?auto_359536 ) ( ON ?auto_359537 ?auto_359536 ) ( ON ?auto_359538 ?auto_359537 ) ( ON ?auto_359539 ?auto_359538 ) ( not ( = ?auto_359536 ?auto_359537 ) ) ( not ( = ?auto_359536 ?auto_359538 ) ) ( not ( = ?auto_359536 ?auto_359539 ) ) ( not ( = ?auto_359536 ?auto_359540 ) ) ( not ( = ?auto_359536 ?auto_359541 ) ) ( not ( = ?auto_359536 ?auto_359542 ) ) ( not ( = ?auto_359536 ?auto_359543 ) ) ( not ( = ?auto_359536 ?auto_359544 ) ) ( not ( = ?auto_359536 ?auto_359545 ) ) ( not ( = ?auto_359536 ?auto_359546 ) ) ( not ( = ?auto_359536 ?auto_359547 ) ) ( not ( = ?auto_359536 ?auto_359548 ) ) ( not ( = ?auto_359536 ?auto_359549 ) ) ( not ( = ?auto_359537 ?auto_359538 ) ) ( not ( = ?auto_359537 ?auto_359539 ) ) ( not ( = ?auto_359537 ?auto_359540 ) ) ( not ( = ?auto_359537 ?auto_359541 ) ) ( not ( = ?auto_359537 ?auto_359542 ) ) ( not ( = ?auto_359537 ?auto_359543 ) ) ( not ( = ?auto_359537 ?auto_359544 ) ) ( not ( = ?auto_359537 ?auto_359545 ) ) ( not ( = ?auto_359537 ?auto_359546 ) ) ( not ( = ?auto_359537 ?auto_359547 ) ) ( not ( = ?auto_359537 ?auto_359548 ) ) ( not ( = ?auto_359537 ?auto_359549 ) ) ( not ( = ?auto_359538 ?auto_359539 ) ) ( not ( = ?auto_359538 ?auto_359540 ) ) ( not ( = ?auto_359538 ?auto_359541 ) ) ( not ( = ?auto_359538 ?auto_359542 ) ) ( not ( = ?auto_359538 ?auto_359543 ) ) ( not ( = ?auto_359538 ?auto_359544 ) ) ( not ( = ?auto_359538 ?auto_359545 ) ) ( not ( = ?auto_359538 ?auto_359546 ) ) ( not ( = ?auto_359538 ?auto_359547 ) ) ( not ( = ?auto_359538 ?auto_359548 ) ) ( not ( = ?auto_359538 ?auto_359549 ) ) ( not ( = ?auto_359539 ?auto_359540 ) ) ( not ( = ?auto_359539 ?auto_359541 ) ) ( not ( = ?auto_359539 ?auto_359542 ) ) ( not ( = ?auto_359539 ?auto_359543 ) ) ( not ( = ?auto_359539 ?auto_359544 ) ) ( not ( = ?auto_359539 ?auto_359545 ) ) ( not ( = ?auto_359539 ?auto_359546 ) ) ( not ( = ?auto_359539 ?auto_359547 ) ) ( not ( = ?auto_359539 ?auto_359548 ) ) ( not ( = ?auto_359539 ?auto_359549 ) ) ( not ( = ?auto_359540 ?auto_359541 ) ) ( not ( = ?auto_359540 ?auto_359542 ) ) ( not ( = ?auto_359540 ?auto_359543 ) ) ( not ( = ?auto_359540 ?auto_359544 ) ) ( not ( = ?auto_359540 ?auto_359545 ) ) ( not ( = ?auto_359540 ?auto_359546 ) ) ( not ( = ?auto_359540 ?auto_359547 ) ) ( not ( = ?auto_359540 ?auto_359548 ) ) ( not ( = ?auto_359540 ?auto_359549 ) ) ( not ( = ?auto_359541 ?auto_359542 ) ) ( not ( = ?auto_359541 ?auto_359543 ) ) ( not ( = ?auto_359541 ?auto_359544 ) ) ( not ( = ?auto_359541 ?auto_359545 ) ) ( not ( = ?auto_359541 ?auto_359546 ) ) ( not ( = ?auto_359541 ?auto_359547 ) ) ( not ( = ?auto_359541 ?auto_359548 ) ) ( not ( = ?auto_359541 ?auto_359549 ) ) ( not ( = ?auto_359542 ?auto_359543 ) ) ( not ( = ?auto_359542 ?auto_359544 ) ) ( not ( = ?auto_359542 ?auto_359545 ) ) ( not ( = ?auto_359542 ?auto_359546 ) ) ( not ( = ?auto_359542 ?auto_359547 ) ) ( not ( = ?auto_359542 ?auto_359548 ) ) ( not ( = ?auto_359542 ?auto_359549 ) ) ( not ( = ?auto_359543 ?auto_359544 ) ) ( not ( = ?auto_359543 ?auto_359545 ) ) ( not ( = ?auto_359543 ?auto_359546 ) ) ( not ( = ?auto_359543 ?auto_359547 ) ) ( not ( = ?auto_359543 ?auto_359548 ) ) ( not ( = ?auto_359543 ?auto_359549 ) ) ( not ( = ?auto_359544 ?auto_359545 ) ) ( not ( = ?auto_359544 ?auto_359546 ) ) ( not ( = ?auto_359544 ?auto_359547 ) ) ( not ( = ?auto_359544 ?auto_359548 ) ) ( not ( = ?auto_359544 ?auto_359549 ) ) ( not ( = ?auto_359545 ?auto_359546 ) ) ( not ( = ?auto_359545 ?auto_359547 ) ) ( not ( = ?auto_359545 ?auto_359548 ) ) ( not ( = ?auto_359545 ?auto_359549 ) ) ( not ( = ?auto_359546 ?auto_359547 ) ) ( not ( = ?auto_359546 ?auto_359548 ) ) ( not ( = ?auto_359546 ?auto_359549 ) ) ( not ( = ?auto_359547 ?auto_359548 ) ) ( not ( = ?auto_359547 ?auto_359549 ) ) ( not ( = ?auto_359548 ?auto_359549 ) ) ( ON ?auto_359547 ?auto_359548 ) ( ON ?auto_359546 ?auto_359547 ) ( ON ?auto_359545 ?auto_359546 ) ( ON ?auto_359544 ?auto_359545 ) ( ON ?auto_359543 ?auto_359544 ) ( ON ?auto_359542 ?auto_359543 ) ( ON ?auto_359541 ?auto_359542 ) ( CLEAR ?auto_359539 ) ( ON ?auto_359540 ?auto_359541 ) ( CLEAR ?auto_359540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_359536 ?auto_359537 ?auto_359538 ?auto_359539 ?auto_359540 )
      ( MAKE-13PILE ?auto_359536 ?auto_359537 ?auto_359538 ?auto_359539 ?auto_359540 ?auto_359541 ?auto_359542 ?auto_359543 ?auto_359544 ?auto_359545 ?auto_359546 ?auto_359547 ?auto_359548 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359590 - BLOCK
      ?auto_359591 - BLOCK
      ?auto_359592 - BLOCK
      ?auto_359593 - BLOCK
      ?auto_359594 - BLOCK
      ?auto_359595 - BLOCK
      ?auto_359596 - BLOCK
      ?auto_359597 - BLOCK
      ?auto_359598 - BLOCK
      ?auto_359599 - BLOCK
      ?auto_359600 - BLOCK
      ?auto_359601 - BLOCK
      ?auto_359602 - BLOCK
    )
    :vars
    (
      ?auto_359603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359602 ?auto_359603 ) ( ON-TABLE ?auto_359590 ) ( ON ?auto_359591 ?auto_359590 ) ( ON ?auto_359592 ?auto_359591 ) ( not ( = ?auto_359590 ?auto_359591 ) ) ( not ( = ?auto_359590 ?auto_359592 ) ) ( not ( = ?auto_359590 ?auto_359593 ) ) ( not ( = ?auto_359590 ?auto_359594 ) ) ( not ( = ?auto_359590 ?auto_359595 ) ) ( not ( = ?auto_359590 ?auto_359596 ) ) ( not ( = ?auto_359590 ?auto_359597 ) ) ( not ( = ?auto_359590 ?auto_359598 ) ) ( not ( = ?auto_359590 ?auto_359599 ) ) ( not ( = ?auto_359590 ?auto_359600 ) ) ( not ( = ?auto_359590 ?auto_359601 ) ) ( not ( = ?auto_359590 ?auto_359602 ) ) ( not ( = ?auto_359590 ?auto_359603 ) ) ( not ( = ?auto_359591 ?auto_359592 ) ) ( not ( = ?auto_359591 ?auto_359593 ) ) ( not ( = ?auto_359591 ?auto_359594 ) ) ( not ( = ?auto_359591 ?auto_359595 ) ) ( not ( = ?auto_359591 ?auto_359596 ) ) ( not ( = ?auto_359591 ?auto_359597 ) ) ( not ( = ?auto_359591 ?auto_359598 ) ) ( not ( = ?auto_359591 ?auto_359599 ) ) ( not ( = ?auto_359591 ?auto_359600 ) ) ( not ( = ?auto_359591 ?auto_359601 ) ) ( not ( = ?auto_359591 ?auto_359602 ) ) ( not ( = ?auto_359591 ?auto_359603 ) ) ( not ( = ?auto_359592 ?auto_359593 ) ) ( not ( = ?auto_359592 ?auto_359594 ) ) ( not ( = ?auto_359592 ?auto_359595 ) ) ( not ( = ?auto_359592 ?auto_359596 ) ) ( not ( = ?auto_359592 ?auto_359597 ) ) ( not ( = ?auto_359592 ?auto_359598 ) ) ( not ( = ?auto_359592 ?auto_359599 ) ) ( not ( = ?auto_359592 ?auto_359600 ) ) ( not ( = ?auto_359592 ?auto_359601 ) ) ( not ( = ?auto_359592 ?auto_359602 ) ) ( not ( = ?auto_359592 ?auto_359603 ) ) ( not ( = ?auto_359593 ?auto_359594 ) ) ( not ( = ?auto_359593 ?auto_359595 ) ) ( not ( = ?auto_359593 ?auto_359596 ) ) ( not ( = ?auto_359593 ?auto_359597 ) ) ( not ( = ?auto_359593 ?auto_359598 ) ) ( not ( = ?auto_359593 ?auto_359599 ) ) ( not ( = ?auto_359593 ?auto_359600 ) ) ( not ( = ?auto_359593 ?auto_359601 ) ) ( not ( = ?auto_359593 ?auto_359602 ) ) ( not ( = ?auto_359593 ?auto_359603 ) ) ( not ( = ?auto_359594 ?auto_359595 ) ) ( not ( = ?auto_359594 ?auto_359596 ) ) ( not ( = ?auto_359594 ?auto_359597 ) ) ( not ( = ?auto_359594 ?auto_359598 ) ) ( not ( = ?auto_359594 ?auto_359599 ) ) ( not ( = ?auto_359594 ?auto_359600 ) ) ( not ( = ?auto_359594 ?auto_359601 ) ) ( not ( = ?auto_359594 ?auto_359602 ) ) ( not ( = ?auto_359594 ?auto_359603 ) ) ( not ( = ?auto_359595 ?auto_359596 ) ) ( not ( = ?auto_359595 ?auto_359597 ) ) ( not ( = ?auto_359595 ?auto_359598 ) ) ( not ( = ?auto_359595 ?auto_359599 ) ) ( not ( = ?auto_359595 ?auto_359600 ) ) ( not ( = ?auto_359595 ?auto_359601 ) ) ( not ( = ?auto_359595 ?auto_359602 ) ) ( not ( = ?auto_359595 ?auto_359603 ) ) ( not ( = ?auto_359596 ?auto_359597 ) ) ( not ( = ?auto_359596 ?auto_359598 ) ) ( not ( = ?auto_359596 ?auto_359599 ) ) ( not ( = ?auto_359596 ?auto_359600 ) ) ( not ( = ?auto_359596 ?auto_359601 ) ) ( not ( = ?auto_359596 ?auto_359602 ) ) ( not ( = ?auto_359596 ?auto_359603 ) ) ( not ( = ?auto_359597 ?auto_359598 ) ) ( not ( = ?auto_359597 ?auto_359599 ) ) ( not ( = ?auto_359597 ?auto_359600 ) ) ( not ( = ?auto_359597 ?auto_359601 ) ) ( not ( = ?auto_359597 ?auto_359602 ) ) ( not ( = ?auto_359597 ?auto_359603 ) ) ( not ( = ?auto_359598 ?auto_359599 ) ) ( not ( = ?auto_359598 ?auto_359600 ) ) ( not ( = ?auto_359598 ?auto_359601 ) ) ( not ( = ?auto_359598 ?auto_359602 ) ) ( not ( = ?auto_359598 ?auto_359603 ) ) ( not ( = ?auto_359599 ?auto_359600 ) ) ( not ( = ?auto_359599 ?auto_359601 ) ) ( not ( = ?auto_359599 ?auto_359602 ) ) ( not ( = ?auto_359599 ?auto_359603 ) ) ( not ( = ?auto_359600 ?auto_359601 ) ) ( not ( = ?auto_359600 ?auto_359602 ) ) ( not ( = ?auto_359600 ?auto_359603 ) ) ( not ( = ?auto_359601 ?auto_359602 ) ) ( not ( = ?auto_359601 ?auto_359603 ) ) ( not ( = ?auto_359602 ?auto_359603 ) ) ( ON ?auto_359601 ?auto_359602 ) ( ON ?auto_359600 ?auto_359601 ) ( ON ?auto_359599 ?auto_359600 ) ( ON ?auto_359598 ?auto_359599 ) ( ON ?auto_359597 ?auto_359598 ) ( ON ?auto_359596 ?auto_359597 ) ( ON ?auto_359595 ?auto_359596 ) ( ON ?auto_359594 ?auto_359595 ) ( CLEAR ?auto_359592 ) ( ON ?auto_359593 ?auto_359594 ) ( CLEAR ?auto_359593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_359590 ?auto_359591 ?auto_359592 ?auto_359593 )
      ( MAKE-13PILE ?auto_359590 ?auto_359591 ?auto_359592 ?auto_359593 ?auto_359594 ?auto_359595 ?auto_359596 ?auto_359597 ?auto_359598 ?auto_359599 ?auto_359600 ?auto_359601 ?auto_359602 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359644 - BLOCK
      ?auto_359645 - BLOCK
      ?auto_359646 - BLOCK
      ?auto_359647 - BLOCK
      ?auto_359648 - BLOCK
      ?auto_359649 - BLOCK
      ?auto_359650 - BLOCK
      ?auto_359651 - BLOCK
      ?auto_359652 - BLOCK
      ?auto_359653 - BLOCK
      ?auto_359654 - BLOCK
      ?auto_359655 - BLOCK
      ?auto_359656 - BLOCK
    )
    :vars
    (
      ?auto_359657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359656 ?auto_359657 ) ( ON-TABLE ?auto_359644 ) ( ON ?auto_359645 ?auto_359644 ) ( not ( = ?auto_359644 ?auto_359645 ) ) ( not ( = ?auto_359644 ?auto_359646 ) ) ( not ( = ?auto_359644 ?auto_359647 ) ) ( not ( = ?auto_359644 ?auto_359648 ) ) ( not ( = ?auto_359644 ?auto_359649 ) ) ( not ( = ?auto_359644 ?auto_359650 ) ) ( not ( = ?auto_359644 ?auto_359651 ) ) ( not ( = ?auto_359644 ?auto_359652 ) ) ( not ( = ?auto_359644 ?auto_359653 ) ) ( not ( = ?auto_359644 ?auto_359654 ) ) ( not ( = ?auto_359644 ?auto_359655 ) ) ( not ( = ?auto_359644 ?auto_359656 ) ) ( not ( = ?auto_359644 ?auto_359657 ) ) ( not ( = ?auto_359645 ?auto_359646 ) ) ( not ( = ?auto_359645 ?auto_359647 ) ) ( not ( = ?auto_359645 ?auto_359648 ) ) ( not ( = ?auto_359645 ?auto_359649 ) ) ( not ( = ?auto_359645 ?auto_359650 ) ) ( not ( = ?auto_359645 ?auto_359651 ) ) ( not ( = ?auto_359645 ?auto_359652 ) ) ( not ( = ?auto_359645 ?auto_359653 ) ) ( not ( = ?auto_359645 ?auto_359654 ) ) ( not ( = ?auto_359645 ?auto_359655 ) ) ( not ( = ?auto_359645 ?auto_359656 ) ) ( not ( = ?auto_359645 ?auto_359657 ) ) ( not ( = ?auto_359646 ?auto_359647 ) ) ( not ( = ?auto_359646 ?auto_359648 ) ) ( not ( = ?auto_359646 ?auto_359649 ) ) ( not ( = ?auto_359646 ?auto_359650 ) ) ( not ( = ?auto_359646 ?auto_359651 ) ) ( not ( = ?auto_359646 ?auto_359652 ) ) ( not ( = ?auto_359646 ?auto_359653 ) ) ( not ( = ?auto_359646 ?auto_359654 ) ) ( not ( = ?auto_359646 ?auto_359655 ) ) ( not ( = ?auto_359646 ?auto_359656 ) ) ( not ( = ?auto_359646 ?auto_359657 ) ) ( not ( = ?auto_359647 ?auto_359648 ) ) ( not ( = ?auto_359647 ?auto_359649 ) ) ( not ( = ?auto_359647 ?auto_359650 ) ) ( not ( = ?auto_359647 ?auto_359651 ) ) ( not ( = ?auto_359647 ?auto_359652 ) ) ( not ( = ?auto_359647 ?auto_359653 ) ) ( not ( = ?auto_359647 ?auto_359654 ) ) ( not ( = ?auto_359647 ?auto_359655 ) ) ( not ( = ?auto_359647 ?auto_359656 ) ) ( not ( = ?auto_359647 ?auto_359657 ) ) ( not ( = ?auto_359648 ?auto_359649 ) ) ( not ( = ?auto_359648 ?auto_359650 ) ) ( not ( = ?auto_359648 ?auto_359651 ) ) ( not ( = ?auto_359648 ?auto_359652 ) ) ( not ( = ?auto_359648 ?auto_359653 ) ) ( not ( = ?auto_359648 ?auto_359654 ) ) ( not ( = ?auto_359648 ?auto_359655 ) ) ( not ( = ?auto_359648 ?auto_359656 ) ) ( not ( = ?auto_359648 ?auto_359657 ) ) ( not ( = ?auto_359649 ?auto_359650 ) ) ( not ( = ?auto_359649 ?auto_359651 ) ) ( not ( = ?auto_359649 ?auto_359652 ) ) ( not ( = ?auto_359649 ?auto_359653 ) ) ( not ( = ?auto_359649 ?auto_359654 ) ) ( not ( = ?auto_359649 ?auto_359655 ) ) ( not ( = ?auto_359649 ?auto_359656 ) ) ( not ( = ?auto_359649 ?auto_359657 ) ) ( not ( = ?auto_359650 ?auto_359651 ) ) ( not ( = ?auto_359650 ?auto_359652 ) ) ( not ( = ?auto_359650 ?auto_359653 ) ) ( not ( = ?auto_359650 ?auto_359654 ) ) ( not ( = ?auto_359650 ?auto_359655 ) ) ( not ( = ?auto_359650 ?auto_359656 ) ) ( not ( = ?auto_359650 ?auto_359657 ) ) ( not ( = ?auto_359651 ?auto_359652 ) ) ( not ( = ?auto_359651 ?auto_359653 ) ) ( not ( = ?auto_359651 ?auto_359654 ) ) ( not ( = ?auto_359651 ?auto_359655 ) ) ( not ( = ?auto_359651 ?auto_359656 ) ) ( not ( = ?auto_359651 ?auto_359657 ) ) ( not ( = ?auto_359652 ?auto_359653 ) ) ( not ( = ?auto_359652 ?auto_359654 ) ) ( not ( = ?auto_359652 ?auto_359655 ) ) ( not ( = ?auto_359652 ?auto_359656 ) ) ( not ( = ?auto_359652 ?auto_359657 ) ) ( not ( = ?auto_359653 ?auto_359654 ) ) ( not ( = ?auto_359653 ?auto_359655 ) ) ( not ( = ?auto_359653 ?auto_359656 ) ) ( not ( = ?auto_359653 ?auto_359657 ) ) ( not ( = ?auto_359654 ?auto_359655 ) ) ( not ( = ?auto_359654 ?auto_359656 ) ) ( not ( = ?auto_359654 ?auto_359657 ) ) ( not ( = ?auto_359655 ?auto_359656 ) ) ( not ( = ?auto_359655 ?auto_359657 ) ) ( not ( = ?auto_359656 ?auto_359657 ) ) ( ON ?auto_359655 ?auto_359656 ) ( ON ?auto_359654 ?auto_359655 ) ( ON ?auto_359653 ?auto_359654 ) ( ON ?auto_359652 ?auto_359653 ) ( ON ?auto_359651 ?auto_359652 ) ( ON ?auto_359650 ?auto_359651 ) ( ON ?auto_359649 ?auto_359650 ) ( ON ?auto_359648 ?auto_359649 ) ( ON ?auto_359647 ?auto_359648 ) ( CLEAR ?auto_359645 ) ( ON ?auto_359646 ?auto_359647 ) ( CLEAR ?auto_359646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_359644 ?auto_359645 ?auto_359646 )
      ( MAKE-13PILE ?auto_359644 ?auto_359645 ?auto_359646 ?auto_359647 ?auto_359648 ?auto_359649 ?auto_359650 ?auto_359651 ?auto_359652 ?auto_359653 ?auto_359654 ?auto_359655 ?auto_359656 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359698 - BLOCK
      ?auto_359699 - BLOCK
      ?auto_359700 - BLOCK
      ?auto_359701 - BLOCK
      ?auto_359702 - BLOCK
      ?auto_359703 - BLOCK
      ?auto_359704 - BLOCK
      ?auto_359705 - BLOCK
      ?auto_359706 - BLOCK
      ?auto_359707 - BLOCK
      ?auto_359708 - BLOCK
      ?auto_359709 - BLOCK
      ?auto_359710 - BLOCK
    )
    :vars
    (
      ?auto_359711 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359710 ?auto_359711 ) ( ON-TABLE ?auto_359698 ) ( not ( = ?auto_359698 ?auto_359699 ) ) ( not ( = ?auto_359698 ?auto_359700 ) ) ( not ( = ?auto_359698 ?auto_359701 ) ) ( not ( = ?auto_359698 ?auto_359702 ) ) ( not ( = ?auto_359698 ?auto_359703 ) ) ( not ( = ?auto_359698 ?auto_359704 ) ) ( not ( = ?auto_359698 ?auto_359705 ) ) ( not ( = ?auto_359698 ?auto_359706 ) ) ( not ( = ?auto_359698 ?auto_359707 ) ) ( not ( = ?auto_359698 ?auto_359708 ) ) ( not ( = ?auto_359698 ?auto_359709 ) ) ( not ( = ?auto_359698 ?auto_359710 ) ) ( not ( = ?auto_359698 ?auto_359711 ) ) ( not ( = ?auto_359699 ?auto_359700 ) ) ( not ( = ?auto_359699 ?auto_359701 ) ) ( not ( = ?auto_359699 ?auto_359702 ) ) ( not ( = ?auto_359699 ?auto_359703 ) ) ( not ( = ?auto_359699 ?auto_359704 ) ) ( not ( = ?auto_359699 ?auto_359705 ) ) ( not ( = ?auto_359699 ?auto_359706 ) ) ( not ( = ?auto_359699 ?auto_359707 ) ) ( not ( = ?auto_359699 ?auto_359708 ) ) ( not ( = ?auto_359699 ?auto_359709 ) ) ( not ( = ?auto_359699 ?auto_359710 ) ) ( not ( = ?auto_359699 ?auto_359711 ) ) ( not ( = ?auto_359700 ?auto_359701 ) ) ( not ( = ?auto_359700 ?auto_359702 ) ) ( not ( = ?auto_359700 ?auto_359703 ) ) ( not ( = ?auto_359700 ?auto_359704 ) ) ( not ( = ?auto_359700 ?auto_359705 ) ) ( not ( = ?auto_359700 ?auto_359706 ) ) ( not ( = ?auto_359700 ?auto_359707 ) ) ( not ( = ?auto_359700 ?auto_359708 ) ) ( not ( = ?auto_359700 ?auto_359709 ) ) ( not ( = ?auto_359700 ?auto_359710 ) ) ( not ( = ?auto_359700 ?auto_359711 ) ) ( not ( = ?auto_359701 ?auto_359702 ) ) ( not ( = ?auto_359701 ?auto_359703 ) ) ( not ( = ?auto_359701 ?auto_359704 ) ) ( not ( = ?auto_359701 ?auto_359705 ) ) ( not ( = ?auto_359701 ?auto_359706 ) ) ( not ( = ?auto_359701 ?auto_359707 ) ) ( not ( = ?auto_359701 ?auto_359708 ) ) ( not ( = ?auto_359701 ?auto_359709 ) ) ( not ( = ?auto_359701 ?auto_359710 ) ) ( not ( = ?auto_359701 ?auto_359711 ) ) ( not ( = ?auto_359702 ?auto_359703 ) ) ( not ( = ?auto_359702 ?auto_359704 ) ) ( not ( = ?auto_359702 ?auto_359705 ) ) ( not ( = ?auto_359702 ?auto_359706 ) ) ( not ( = ?auto_359702 ?auto_359707 ) ) ( not ( = ?auto_359702 ?auto_359708 ) ) ( not ( = ?auto_359702 ?auto_359709 ) ) ( not ( = ?auto_359702 ?auto_359710 ) ) ( not ( = ?auto_359702 ?auto_359711 ) ) ( not ( = ?auto_359703 ?auto_359704 ) ) ( not ( = ?auto_359703 ?auto_359705 ) ) ( not ( = ?auto_359703 ?auto_359706 ) ) ( not ( = ?auto_359703 ?auto_359707 ) ) ( not ( = ?auto_359703 ?auto_359708 ) ) ( not ( = ?auto_359703 ?auto_359709 ) ) ( not ( = ?auto_359703 ?auto_359710 ) ) ( not ( = ?auto_359703 ?auto_359711 ) ) ( not ( = ?auto_359704 ?auto_359705 ) ) ( not ( = ?auto_359704 ?auto_359706 ) ) ( not ( = ?auto_359704 ?auto_359707 ) ) ( not ( = ?auto_359704 ?auto_359708 ) ) ( not ( = ?auto_359704 ?auto_359709 ) ) ( not ( = ?auto_359704 ?auto_359710 ) ) ( not ( = ?auto_359704 ?auto_359711 ) ) ( not ( = ?auto_359705 ?auto_359706 ) ) ( not ( = ?auto_359705 ?auto_359707 ) ) ( not ( = ?auto_359705 ?auto_359708 ) ) ( not ( = ?auto_359705 ?auto_359709 ) ) ( not ( = ?auto_359705 ?auto_359710 ) ) ( not ( = ?auto_359705 ?auto_359711 ) ) ( not ( = ?auto_359706 ?auto_359707 ) ) ( not ( = ?auto_359706 ?auto_359708 ) ) ( not ( = ?auto_359706 ?auto_359709 ) ) ( not ( = ?auto_359706 ?auto_359710 ) ) ( not ( = ?auto_359706 ?auto_359711 ) ) ( not ( = ?auto_359707 ?auto_359708 ) ) ( not ( = ?auto_359707 ?auto_359709 ) ) ( not ( = ?auto_359707 ?auto_359710 ) ) ( not ( = ?auto_359707 ?auto_359711 ) ) ( not ( = ?auto_359708 ?auto_359709 ) ) ( not ( = ?auto_359708 ?auto_359710 ) ) ( not ( = ?auto_359708 ?auto_359711 ) ) ( not ( = ?auto_359709 ?auto_359710 ) ) ( not ( = ?auto_359709 ?auto_359711 ) ) ( not ( = ?auto_359710 ?auto_359711 ) ) ( ON ?auto_359709 ?auto_359710 ) ( ON ?auto_359708 ?auto_359709 ) ( ON ?auto_359707 ?auto_359708 ) ( ON ?auto_359706 ?auto_359707 ) ( ON ?auto_359705 ?auto_359706 ) ( ON ?auto_359704 ?auto_359705 ) ( ON ?auto_359703 ?auto_359704 ) ( ON ?auto_359702 ?auto_359703 ) ( ON ?auto_359701 ?auto_359702 ) ( ON ?auto_359700 ?auto_359701 ) ( CLEAR ?auto_359698 ) ( ON ?auto_359699 ?auto_359700 ) ( CLEAR ?auto_359699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_359698 ?auto_359699 )
      ( MAKE-13PILE ?auto_359698 ?auto_359699 ?auto_359700 ?auto_359701 ?auto_359702 ?auto_359703 ?auto_359704 ?auto_359705 ?auto_359706 ?auto_359707 ?auto_359708 ?auto_359709 ?auto_359710 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_359752 - BLOCK
      ?auto_359753 - BLOCK
      ?auto_359754 - BLOCK
      ?auto_359755 - BLOCK
      ?auto_359756 - BLOCK
      ?auto_359757 - BLOCK
      ?auto_359758 - BLOCK
      ?auto_359759 - BLOCK
      ?auto_359760 - BLOCK
      ?auto_359761 - BLOCK
      ?auto_359762 - BLOCK
      ?auto_359763 - BLOCK
      ?auto_359764 - BLOCK
    )
    :vars
    (
      ?auto_359765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359764 ?auto_359765 ) ( not ( = ?auto_359752 ?auto_359753 ) ) ( not ( = ?auto_359752 ?auto_359754 ) ) ( not ( = ?auto_359752 ?auto_359755 ) ) ( not ( = ?auto_359752 ?auto_359756 ) ) ( not ( = ?auto_359752 ?auto_359757 ) ) ( not ( = ?auto_359752 ?auto_359758 ) ) ( not ( = ?auto_359752 ?auto_359759 ) ) ( not ( = ?auto_359752 ?auto_359760 ) ) ( not ( = ?auto_359752 ?auto_359761 ) ) ( not ( = ?auto_359752 ?auto_359762 ) ) ( not ( = ?auto_359752 ?auto_359763 ) ) ( not ( = ?auto_359752 ?auto_359764 ) ) ( not ( = ?auto_359752 ?auto_359765 ) ) ( not ( = ?auto_359753 ?auto_359754 ) ) ( not ( = ?auto_359753 ?auto_359755 ) ) ( not ( = ?auto_359753 ?auto_359756 ) ) ( not ( = ?auto_359753 ?auto_359757 ) ) ( not ( = ?auto_359753 ?auto_359758 ) ) ( not ( = ?auto_359753 ?auto_359759 ) ) ( not ( = ?auto_359753 ?auto_359760 ) ) ( not ( = ?auto_359753 ?auto_359761 ) ) ( not ( = ?auto_359753 ?auto_359762 ) ) ( not ( = ?auto_359753 ?auto_359763 ) ) ( not ( = ?auto_359753 ?auto_359764 ) ) ( not ( = ?auto_359753 ?auto_359765 ) ) ( not ( = ?auto_359754 ?auto_359755 ) ) ( not ( = ?auto_359754 ?auto_359756 ) ) ( not ( = ?auto_359754 ?auto_359757 ) ) ( not ( = ?auto_359754 ?auto_359758 ) ) ( not ( = ?auto_359754 ?auto_359759 ) ) ( not ( = ?auto_359754 ?auto_359760 ) ) ( not ( = ?auto_359754 ?auto_359761 ) ) ( not ( = ?auto_359754 ?auto_359762 ) ) ( not ( = ?auto_359754 ?auto_359763 ) ) ( not ( = ?auto_359754 ?auto_359764 ) ) ( not ( = ?auto_359754 ?auto_359765 ) ) ( not ( = ?auto_359755 ?auto_359756 ) ) ( not ( = ?auto_359755 ?auto_359757 ) ) ( not ( = ?auto_359755 ?auto_359758 ) ) ( not ( = ?auto_359755 ?auto_359759 ) ) ( not ( = ?auto_359755 ?auto_359760 ) ) ( not ( = ?auto_359755 ?auto_359761 ) ) ( not ( = ?auto_359755 ?auto_359762 ) ) ( not ( = ?auto_359755 ?auto_359763 ) ) ( not ( = ?auto_359755 ?auto_359764 ) ) ( not ( = ?auto_359755 ?auto_359765 ) ) ( not ( = ?auto_359756 ?auto_359757 ) ) ( not ( = ?auto_359756 ?auto_359758 ) ) ( not ( = ?auto_359756 ?auto_359759 ) ) ( not ( = ?auto_359756 ?auto_359760 ) ) ( not ( = ?auto_359756 ?auto_359761 ) ) ( not ( = ?auto_359756 ?auto_359762 ) ) ( not ( = ?auto_359756 ?auto_359763 ) ) ( not ( = ?auto_359756 ?auto_359764 ) ) ( not ( = ?auto_359756 ?auto_359765 ) ) ( not ( = ?auto_359757 ?auto_359758 ) ) ( not ( = ?auto_359757 ?auto_359759 ) ) ( not ( = ?auto_359757 ?auto_359760 ) ) ( not ( = ?auto_359757 ?auto_359761 ) ) ( not ( = ?auto_359757 ?auto_359762 ) ) ( not ( = ?auto_359757 ?auto_359763 ) ) ( not ( = ?auto_359757 ?auto_359764 ) ) ( not ( = ?auto_359757 ?auto_359765 ) ) ( not ( = ?auto_359758 ?auto_359759 ) ) ( not ( = ?auto_359758 ?auto_359760 ) ) ( not ( = ?auto_359758 ?auto_359761 ) ) ( not ( = ?auto_359758 ?auto_359762 ) ) ( not ( = ?auto_359758 ?auto_359763 ) ) ( not ( = ?auto_359758 ?auto_359764 ) ) ( not ( = ?auto_359758 ?auto_359765 ) ) ( not ( = ?auto_359759 ?auto_359760 ) ) ( not ( = ?auto_359759 ?auto_359761 ) ) ( not ( = ?auto_359759 ?auto_359762 ) ) ( not ( = ?auto_359759 ?auto_359763 ) ) ( not ( = ?auto_359759 ?auto_359764 ) ) ( not ( = ?auto_359759 ?auto_359765 ) ) ( not ( = ?auto_359760 ?auto_359761 ) ) ( not ( = ?auto_359760 ?auto_359762 ) ) ( not ( = ?auto_359760 ?auto_359763 ) ) ( not ( = ?auto_359760 ?auto_359764 ) ) ( not ( = ?auto_359760 ?auto_359765 ) ) ( not ( = ?auto_359761 ?auto_359762 ) ) ( not ( = ?auto_359761 ?auto_359763 ) ) ( not ( = ?auto_359761 ?auto_359764 ) ) ( not ( = ?auto_359761 ?auto_359765 ) ) ( not ( = ?auto_359762 ?auto_359763 ) ) ( not ( = ?auto_359762 ?auto_359764 ) ) ( not ( = ?auto_359762 ?auto_359765 ) ) ( not ( = ?auto_359763 ?auto_359764 ) ) ( not ( = ?auto_359763 ?auto_359765 ) ) ( not ( = ?auto_359764 ?auto_359765 ) ) ( ON ?auto_359763 ?auto_359764 ) ( ON ?auto_359762 ?auto_359763 ) ( ON ?auto_359761 ?auto_359762 ) ( ON ?auto_359760 ?auto_359761 ) ( ON ?auto_359759 ?auto_359760 ) ( ON ?auto_359758 ?auto_359759 ) ( ON ?auto_359757 ?auto_359758 ) ( ON ?auto_359756 ?auto_359757 ) ( ON ?auto_359755 ?auto_359756 ) ( ON ?auto_359754 ?auto_359755 ) ( ON ?auto_359753 ?auto_359754 ) ( ON ?auto_359752 ?auto_359753 ) ( CLEAR ?auto_359752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_359752 )
      ( MAKE-13PILE ?auto_359752 ?auto_359753 ?auto_359754 ?auto_359755 ?auto_359756 ?auto_359757 ?auto_359758 ?auto_359759 ?auto_359760 ?auto_359761 ?auto_359762 ?auto_359763 ?auto_359764 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_359807 - BLOCK
      ?auto_359808 - BLOCK
      ?auto_359809 - BLOCK
      ?auto_359810 - BLOCK
      ?auto_359811 - BLOCK
      ?auto_359812 - BLOCK
      ?auto_359813 - BLOCK
      ?auto_359814 - BLOCK
      ?auto_359815 - BLOCK
      ?auto_359816 - BLOCK
      ?auto_359817 - BLOCK
      ?auto_359818 - BLOCK
      ?auto_359819 - BLOCK
      ?auto_359820 - BLOCK
    )
    :vars
    (
      ?auto_359821 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_359819 ) ( ON ?auto_359820 ?auto_359821 ) ( CLEAR ?auto_359820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_359807 ) ( ON ?auto_359808 ?auto_359807 ) ( ON ?auto_359809 ?auto_359808 ) ( ON ?auto_359810 ?auto_359809 ) ( ON ?auto_359811 ?auto_359810 ) ( ON ?auto_359812 ?auto_359811 ) ( ON ?auto_359813 ?auto_359812 ) ( ON ?auto_359814 ?auto_359813 ) ( ON ?auto_359815 ?auto_359814 ) ( ON ?auto_359816 ?auto_359815 ) ( ON ?auto_359817 ?auto_359816 ) ( ON ?auto_359818 ?auto_359817 ) ( ON ?auto_359819 ?auto_359818 ) ( not ( = ?auto_359807 ?auto_359808 ) ) ( not ( = ?auto_359807 ?auto_359809 ) ) ( not ( = ?auto_359807 ?auto_359810 ) ) ( not ( = ?auto_359807 ?auto_359811 ) ) ( not ( = ?auto_359807 ?auto_359812 ) ) ( not ( = ?auto_359807 ?auto_359813 ) ) ( not ( = ?auto_359807 ?auto_359814 ) ) ( not ( = ?auto_359807 ?auto_359815 ) ) ( not ( = ?auto_359807 ?auto_359816 ) ) ( not ( = ?auto_359807 ?auto_359817 ) ) ( not ( = ?auto_359807 ?auto_359818 ) ) ( not ( = ?auto_359807 ?auto_359819 ) ) ( not ( = ?auto_359807 ?auto_359820 ) ) ( not ( = ?auto_359807 ?auto_359821 ) ) ( not ( = ?auto_359808 ?auto_359809 ) ) ( not ( = ?auto_359808 ?auto_359810 ) ) ( not ( = ?auto_359808 ?auto_359811 ) ) ( not ( = ?auto_359808 ?auto_359812 ) ) ( not ( = ?auto_359808 ?auto_359813 ) ) ( not ( = ?auto_359808 ?auto_359814 ) ) ( not ( = ?auto_359808 ?auto_359815 ) ) ( not ( = ?auto_359808 ?auto_359816 ) ) ( not ( = ?auto_359808 ?auto_359817 ) ) ( not ( = ?auto_359808 ?auto_359818 ) ) ( not ( = ?auto_359808 ?auto_359819 ) ) ( not ( = ?auto_359808 ?auto_359820 ) ) ( not ( = ?auto_359808 ?auto_359821 ) ) ( not ( = ?auto_359809 ?auto_359810 ) ) ( not ( = ?auto_359809 ?auto_359811 ) ) ( not ( = ?auto_359809 ?auto_359812 ) ) ( not ( = ?auto_359809 ?auto_359813 ) ) ( not ( = ?auto_359809 ?auto_359814 ) ) ( not ( = ?auto_359809 ?auto_359815 ) ) ( not ( = ?auto_359809 ?auto_359816 ) ) ( not ( = ?auto_359809 ?auto_359817 ) ) ( not ( = ?auto_359809 ?auto_359818 ) ) ( not ( = ?auto_359809 ?auto_359819 ) ) ( not ( = ?auto_359809 ?auto_359820 ) ) ( not ( = ?auto_359809 ?auto_359821 ) ) ( not ( = ?auto_359810 ?auto_359811 ) ) ( not ( = ?auto_359810 ?auto_359812 ) ) ( not ( = ?auto_359810 ?auto_359813 ) ) ( not ( = ?auto_359810 ?auto_359814 ) ) ( not ( = ?auto_359810 ?auto_359815 ) ) ( not ( = ?auto_359810 ?auto_359816 ) ) ( not ( = ?auto_359810 ?auto_359817 ) ) ( not ( = ?auto_359810 ?auto_359818 ) ) ( not ( = ?auto_359810 ?auto_359819 ) ) ( not ( = ?auto_359810 ?auto_359820 ) ) ( not ( = ?auto_359810 ?auto_359821 ) ) ( not ( = ?auto_359811 ?auto_359812 ) ) ( not ( = ?auto_359811 ?auto_359813 ) ) ( not ( = ?auto_359811 ?auto_359814 ) ) ( not ( = ?auto_359811 ?auto_359815 ) ) ( not ( = ?auto_359811 ?auto_359816 ) ) ( not ( = ?auto_359811 ?auto_359817 ) ) ( not ( = ?auto_359811 ?auto_359818 ) ) ( not ( = ?auto_359811 ?auto_359819 ) ) ( not ( = ?auto_359811 ?auto_359820 ) ) ( not ( = ?auto_359811 ?auto_359821 ) ) ( not ( = ?auto_359812 ?auto_359813 ) ) ( not ( = ?auto_359812 ?auto_359814 ) ) ( not ( = ?auto_359812 ?auto_359815 ) ) ( not ( = ?auto_359812 ?auto_359816 ) ) ( not ( = ?auto_359812 ?auto_359817 ) ) ( not ( = ?auto_359812 ?auto_359818 ) ) ( not ( = ?auto_359812 ?auto_359819 ) ) ( not ( = ?auto_359812 ?auto_359820 ) ) ( not ( = ?auto_359812 ?auto_359821 ) ) ( not ( = ?auto_359813 ?auto_359814 ) ) ( not ( = ?auto_359813 ?auto_359815 ) ) ( not ( = ?auto_359813 ?auto_359816 ) ) ( not ( = ?auto_359813 ?auto_359817 ) ) ( not ( = ?auto_359813 ?auto_359818 ) ) ( not ( = ?auto_359813 ?auto_359819 ) ) ( not ( = ?auto_359813 ?auto_359820 ) ) ( not ( = ?auto_359813 ?auto_359821 ) ) ( not ( = ?auto_359814 ?auto_359815 ) ) ( not ( = ?auto_359814 ?auto_359816 ) ) ( not ( = ?auto_359814 ?auto_359817 ) ) ( not ( = ?auto_359814 ?auto_359818 ) ) ( not ( = ?auto_359814 ?auto_359819 ) ) ( not ( = ?auto_359814 ?auto_359820 ) ) ( not ( = ?auto_359814 ?auto_359821 ) ) ( not ( = ?auto_359815 ?auto_359816 ) ) ( not ( = ?auto_359815 ?auto_359817 ) ) ( not ( = ?auto_359815 ?auto_359818 ) ) ( not ( = ?auto_359815 ?auto_359819 ) ) ( not ( = ?auto_359815 ?auto_359820 ) ) ( not ( = ?auto_359815 ?auto_359821 ) ) ( not ( = ?auto_359816 ?auto_359817 ) ) ( not ( = ?auto_359816 ?auto_359818 ) ) ( not ( = ?auto_359816 ?auto_359819 ) ) ( not ( = ?auto_359816 ?auto_359820 ) ) ( not ( = ?auto_359816 ?auto_359821 ) ) ( not ( = ?auto_359817 ?auto_359818 ) ) ( not ( = ?auto_359817 ?auto_359819 ) ) ( not ( = ?auto_359817 ?auto_359820 ) ) ( not ( = ?auto_359817 ?auto_359821 ) ) ( not ( = ?auto_359818 ?auto_359819 ) ) ( not ( = ?auto_359818 ?auto_359820 ) ) ( not ( = ?auto_359818 ?auto_359821 ) ) ( not ( = ?auto_359819 ?auto_359820 ) ) ( not ( = ?auto_359819 ?auto_359821 ) ) ( not ( = ?auto_359820 ?auto_359821 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_359820 ?auto_359821 )
      ( !STACK ?auto_359820 ?auto_359819 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_359836 - BLOCK
      ?auto_359837 - BLOCK
      ?auto_359838 - BLOCK
      ?auto_359839 - BLOCK
      ?auto_359840 - BLOCK
      ?auto_359841 - BLOCK
      ?auto_359842 - BLOCK
      ?auto_359843 - BLOCK
      ?auto_359844 - BLOCK
      ?auto_359845 - BLOCK
      ?auto_359846 - BLOCK
      ?auto_359847 - BLOCK
      ?auto_359848 - BLOCK
      ?auto_359849 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_359848 ) ( ON-TABLE ?auto_359849 ) ( CLEAR ?auto_359849 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_359836 ) ( ON ?auto_359837 ?auto_359836 ) ( ON ?auto_359838 ?auto_359837 ) ( ON ?auto_359839 ?auto_359838 ) ( ON ?auto_359840 ?auto_359839 ) ( ON ?auto_359841 ?auto_359840 ) ( ON ?auto_359842 ?auto_359841 ) ( ON ?auto_359843 ?auto_359842 ) ( ON ?auto_359844 ?auto_359843 ) ( ON ?auto_359845 ?auto_359844 ) ( ON ?auto_359846 ?auto_359845 ) ( ON ?auto_359847 ?auto_359846 ) ( ON ?auto_359848 ?auto_359847 ) ( not ( = ?auto_359836 ?auto_359837 ) ) ( not ( = ?auto_359836 ?auto_359838 ) ) ( not ( = ?auto_359836 ?auto_359839 ) ) ( not ( = ?auto_359836 ?auto_359840 ) ) ( not ( = ?auto_359836 ?auto_359841 ) ) ( not ( = ?auto_359836 ?auto_359842 ) ) ( not ( = ?auto_359836 ?auto_359843 ) ) ( not ( = ?auto_359836 ?auto_359844 ) ) ( not ( = ?auto_359836 ?auto_359845 ) ) ( not ( = ?auto_359836 ?auto_359846 ) ) ( not ( = ?auto_359836 ?auto_359847 ) ) ( not ( = ?auto_359836 ?auto_359848 ) ) ( not ( = ?auto_359836 ?auto_359849 ) ) ( not ( = ?auto_359837 ?auto_359838 ) ) ( not ( = ?auto_359837 ?auto_359839 ) ) ( not ( = ?auto_359837 ?auto_359840 ) ) ( not ( = ?auto_359837 ?auto_359841 ) ) ( not ( = ?auto_359837 ?auto_359842 ) ) ( not ( = ?auto_359837 ?auto_359843 ) ) ( not ( = ?auto_359837 ?auto_359844 ) ) ( not ( = ?auto_359837 ?auto_359845 ) ) ( not ( = ?auto_359837 ?auto_359846 ) ) ( not ( = ?auto_359837 ?auto_359847 ) ) ( not ( = ?auto_359837 ?auto_359848 ) ) ( not ( = ?auto_359837 ?auto_359849 ) ) ( not ( = ?auto_359838 ?auto_359839 ) ) ( not ( = ?auto_359838 ?auto_359840 ) ) ( not ( = ?auto_359838 ?auto_359841 ) ) ( not ( = ?auto_359838 ?auto_359842 ) ) ( not ( = ?auto_359838 ?auto_359843 ) ) ( not ( = ?auto_359838 ?auto_359844 ) ) ( not ( = ?auto_359838 ?auto_359845 ) ) ( not ( = ?auto_359838 ?auto_359846 ) ) ( not ( = ?auto_359838 ?auto_359847 ) ) ( not ( = ?auto_359838 ?auto_359848 ) ) ( not ( = ?auto_359838 ?auto_359849 ) ) ( not ( = ?auto_359839 ?auto_359840 ) ) ( not ( = ?auto_359839 ?auto_359841 ) ) ( not ( = ?auto_359839 ?auto_359842 ) ) ( not ( = ?auto_359839 ?auto_359843 ) ) ( not ( = ?auto_359839 ?auto_359844 ) ) ( not ( = ?auto_359839 ?auto_359845 ) ) ( not ( = ?auto_359839 ?auto_359846 ) ) ( not ( = ?auto_359839 ?auto_359847 ) ) ( not ( = ?auto_359839 ?auto_359848 ) ) ( not ( = ?auto_359839 ?auto_359849 ) ) ( not ( = ?auto_359840 ?auto_359841 ) ) ( not ( = ?auto_359840 ?auto_359842 ) ) ( not ( = ?auto_359840 ?auto_359843 ) ) ( not ( = ?auto_359840 ?auto_359844 ) ) ( not ( = ?auto_359840 ?auto_359845 ) ) ( not ( = ?auto_359840 ?auto_359846 ) ) ( not ( = ?auto_359840 ?auto_359847 ) ) ( not ( = ?auto_359840 ?auto_359848 ) ) ( not ( = ?auto_359840 ?auto_359849 ) ) ( not ( = ?auto_359841 ?auto_359842 ) ) ( not ( = ?auto_359841 ?auto_359843 ) ) ( not ( = ?auto_359841 ?auto_359844 ) ) ( not ( = ?auto_359841 ?auto_359845 ) ) ( not ( = ?auto_359841 ?auto_359846 ) ) ( not ( = ?auto_359841 ?auto_359847 ) ) ( not ( = ?auto_359841 ?auto_359848 ) ) ( not ( = ?auto_359841 ?auto_359849 ) ) ( not ( = ?auto_359842 ?auto_359843 ) ) ( not ( = ?auto_359842 ?auto_359844 ) ) ( not ( = ?auto_359842 ?auto_359845 ) ) ( not ( = ?auto_359842 ?auto_359846 ) ) ( not ( = ?auto_359842 ?auto_359847 ) ) ( not ( = ?auto_359842 ?auto_359848 ) ) ( not ( = ?auto_359842 ?auto_359849 ) ) ( not ( = ?auto_359843 ?auto_359844 ) ) ( not ( = ?auto_359843 ?auto_359845 ) ) ( not ( = ?auto_359843 ?auto_359846 ) ) ( not ( = ?auto_359843 ?auto_359847 ) ) ( not ( = ?auto_359843 ?auto_359848 ) ) ( not ( = ?auto_359843 ?auto_359849 ) ) ( not ( = ?auto_359844 ?auto_359845 ) ) ( not ( = ?auto_359844 ?auto_359846 ) ) ( not ( = ?auto_359844 ?auto_359847 ) ) ( not ( = ?auto_359844 ?auto_359848 ) ) ( not ( = ?auto_359844 ?auto_359849 ) ) ( not ( = ?auto_359845 ?auto_359846 ) ) ( not ( = ?auto_359845 ?auto_359847 ) ) ( not ( = ?auto_359845 ?auto_359848 ) ) ( not ( = ?auto_359845 ?auto_359849 ) ) ( not ( = ?auto_359846 ?auto_359847 ) ) ( not ( = ?auto_359846 ?auto_359848 ) ) ( not ( = ?auto_359846 ?auto_359849 ) ) ( not ( = ?auto_359847 ?auto_359848 ) ) ( not ( = ?auto_359847 ?auto_359849 ) ) ( not ( = ?auto_359848 ?auto_359849 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_359849 )
      ( !STACK ?auto_359849 ?auto_359848 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_359864 - BLOCK
      ?auto_359865 - BLOCK
      ?auto_359866 - BLOCK
      ?auto_359867 - BLOCK
      ?auto_359868 - BLOCK
      ?auto_359869 - BLOCK
      ?auto_359870 - BLOCK
      ?auto_359871 - BLOCK
      ?auto_359872 - BLOCK
      ?auto_359873 - BLOCK
      ?auto_359874 - BLOCK
      ?auto_359875 - BLOCK
      ?auto_359876 - BLOCK
      ?auto_359877 - BLOCK
    )
    :vars
    (
      ?auto_359878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359877 ?auto_359878 ) ( ON-TABLE ?auto_359864 ) ( ON ?auto_359865 ?auto_359864 ) ( ON ?auto_359866 ?auto_359865 ) ( ON ?auto_359867 ?auto_359866 ) ( ON ?auto_359868 ?auto_359867 ) ( ON ?auto_359869 ?auto_359868 ) ( ON ?auto_359870 ?auto_359869 ) ( ON ?auto_359871 ?auto_359870 ) ( ON ?auto_359872 ?auto_359871 ) ( ON ?auto_359873 ?auto_359872 ) ( ON ?auto_359874 ?auto_359873 ) ( ON ?auto_359875 ?auto_359874 ) ( not ( = ?auto_359864 ?auto_359865 ) ) ( not ( = ?auto_359864 ?auto_359866 ) ) ( not ( = ?auto_359864 ?auto_359867 ) ) ( not ( = ?auto_359864 ?auto_359868 ) ) ( not ( = ?auto_359864 ?auto_359869 ) ) ( not ( = ?auto_359864 ?auto_359870 ) ) ( not ( = ?auto_359864 ?auto_359871 ) ) ( not ( = ?auto_359864 ?auto_359872 ) ) ( not ( = ?auto_359864 ?auto_359873 ) ) ( not ( = ?auto_359864 ?auto_359874 ) ) ( not ( = ?auto_359864 ?auto_359875 ) ) ( not ( = ?auto_359864 ?auto_359876 ) ) ( not ( = ?auto_359864 ?auto_359877 ) ) ( not ( = ?auto_359864 ?auto_359878 ) ) ( not ( = ?auto_359865 ?auto_359866 ) ) ( not ( = ?auto_359865 ?auto_359867 ) ) ( not ( = ?auto_359865 ?auto_359868 ) ) ( not ( = ?auto_359865 ?auto_359869 ) ) ( not ( = ?auto_359865 ?auto_359870 ) ) ( not ( = ?auto_359865 ?auto_359871 ) ) ( not ( = ?auto_359865 ?auto_359872 ) ) ( not ( = ?auto_359865 ?auto_359873 ) ) ( not ( = ?auto_359865 ?auto_359874 ) ) ( not ( = ?auto_359865 ?auto_359875 ) ) ( not ( = ?auto_359865 ?auto_359876 ) ) ( not ( = ?auto_359865 ?auto_359877 ) ) ( not ( = ?auto_359865 ?auto_359878 ) ) ( not ( = ?auto_359866 ?auto_359867 ) ) ( not ( = ?auto_359866 ?auto_359868 ) ) ( not ( = ?auto_359866 ?auto_359869 ) ) ( not ( = ?auto_359866 ?auto_359870 ) ) ( not ( = ?auto_359866 ?auto_359871 ) ) ( not ( = ?auto_359866 ?auto_359872 ) ) ( not ( = ?auto_359866 ?auto_359873 ) ) ( not ( = ?auto_359866 ?auto_359874 ) ) ( not ( = ?auto_359866 ?auto_359875 ) ) ( not ( = ?auto_359866 ?auto_359876 ) ) ( not ( = ?auto_359866 ?auto_359877 ) ) ( not ( = ?auto_359866 ?auto_359878 ) ) ( not ( = ?auto_359867 ?auto_359868 ) ) ( not ( = ?auto_359867 ?auto_359869 ) ) ( not ( = ?auto_359867 ?auto_359870 ) ) ( not ( = ?auto_359867 ?auto_359871 ) ) ( not ( = ?auto_359867 ?auto_359872 ) ) ( not ( = ?auto_359867 ?auto_359873 ) ) ( not ( = ?auto_359867 ?auto_359874 ) ) ( not ( = ?auto_359867 ?auto_359875 ) ) ( not ( = ?auto_359867 ?auto_359876 ) ) ( not ( = ?auto_359867 ?auto_359877 ) ) ( not ( = ?auto_359867 ?auto_359878 ) ) ( not ( = ?auto_359868 ?auto_359869 ) ) ( not ( = ?auto_359868 ?auto_359870 ) ) ( not ( = ?auto_359868 ?auto_359871 ) ) ( not ( = ?auto_359868 ?auto_359872 ) ) ( not ( = ?auto_359868 ?auto_359873 ) ) ( not ( = ?auto_359868 ?auto_359874 ) ) ( not ( = ?auto_359868 ?auto_359875 ) ) ( not ( = ?auto_359868 ?auto_359876 ) ) ( not ( = ?auto_359868 ?auto_359877 ) ) ( not ( = ?auto_359868 ?auto_359878 ) ) ( not ( = ?auto_359869 ?auto_359870 ) ) ( not ( = ?auto_359869 ?auto_359871 ) ) ( not ( = ?auto_359869 ?auto_359872 ) ) ( not ( = ?auto_359869 ?auto_359873 ) ) ( not ( = ?auto_359869 ?auto_359874 ) ) ( not ( = ?auto_359869 ?auto_359875 ) ) ( not ( = ?auto_359869 ?auto_359876 ) ) ( not ( = ?auto_359869 ?auto_359877 ) ) ( not ( = ?auto_359869 ?auto_359878 ) ) ( not ( = ?auto_359870 ?auto_359871 ) ) ( not ( = ?auto_359870 ?auto_359872 ) ) ( not ( = ?auto_359870 ?auto_359873 ) ) ( not ( = ?auto_359870 ?auto_359874 ) ) ( not ( = ?auto_359870 ?auto_359875 ) ) ( not ( = ?auto_359870 ?auto_359876 ) ) ( not ( = ?auto_359870 ?auto_359877 ) ) ( not ( = ?auto_359870 ?auto_359878 ) ) ( not ( = ?auto_359871 ?auto_359872 ) ) ( not ( = ?auto_359871 ?auto_359873 ) ) ( not ( = ?auto_359871 ?auto_359874 ) ) ( not ( = ?auto_359871 ?auto_359875 ) ) ( not ( = ?auto_359871 ?auto_359876 ) ) ( not ( = ?auto_359871 ?auto_359877 ) ) ( not ( = ?auto_359871 ?auto_359878 ) ) ( not ( = ?auto_359872 ?auto_359873 ) ) ( not ( = ?auto_359872 ?auto_359874 ) ) ( not ( = ?auto_359872 ?auto_359875 ) ) ( not ( = ?auto_359872 ?auto_359876 ) ) ( not ( = ?auto_359872 ?auto_359877 ) ) ( not ( = ?auto_359872 ?auto_359878 ) ) ( not ( = ?auto_359873 ?auto_359874 ) ) ( not ( = ?auto_359873 ?auto_359875 ) ) ( not ( = ?auto_359873 ?auto_359876 ) ) ( not ( = ?auto_359873 ?auto_359877 ) ) ( not ( = ?auto_359873 ?auto_359878 ) ) ( not ( = ?auto_359874 ?auto_359875 ) ) ( not ( = ?auto_359874 ?auto_359876 ) ) ( not ( = ?auto_359874 ?auto_359877 ) ) ( not ( = ?auto_359874 ?auto_359878 ) ) ( not ( = ?auto_359875 ?auto_359876 ) ) ( not ( = ?auto_359875 ?auto_359877 ) ) ( not ( = ?auto_359875 ?auto_359878 ) ) ( not ( = ?auto_359876 ?auto_359877 ) ) ( not ( = ?auto_359876 ?auto_359878 ) ) ( not ( = ?auto_359877 ?auto_359878 ) ) ( CLEAR ?auto_359875 ) ( ON ?auto_359876 ?auto_359877 ) ( CLEAR ?auto_359876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_359864 ?auto_359865 ?auto_359866 ?auto_359867 ?auto_359868 ?auto_359869 ?auto_359870 ?auto_359871 ?auto_359872 ?auto_359873 ?auto_359874 ?auto_359875 ?auto_359876 )
      ( MAKE-14PILE ?auto_359864 ?auto_359865 ?auto_359866 ?auto_359867 ?auto_359868 ?auto_359869 ?auto_359870 ?auto_359871 ?auto_359872 ?auto_359873 ?auto_359874 ?auto_359875 ?auto_359876 ?auto_359877 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_359893 - BLOCK
      ?auto_359894 - BLOCK
      ?auto_359895 - BLOCK
      ?auto_359896 - BLOCK
      ?auto_359897 - BLOCK
      ?auto_359898 - BLOCK
      ?auto_359899 - BLOCK
      ?auto_359900 - BLOCK
      ?auto_359901 - BLOCK
      ?auto_359902 - BLOCK
      ?auto_359903 - BLOCK
      ?auto_359904 - BLOCK
      ?auto_359905 - BLOCK
      ?auto_359906 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_359906 ) ( ON-TABLE ?auto_359893 ) ( ON ?auto_359894 ?auto_359893 ) ( ON ?auto_359895 ?auto_359894 ) ( ON ?auto_359896 ?auto_359895 ) ( ON ?auto_359897 ?auto_359896 ) ( ON ?auto_359898 ?auto_359897 ) ( ON ?auto_359899 ?auto_359898 ) ( ON ?auto_359900 ?auto_359899 ) ( ON ?auto_359901 ?auto_359900 ) ( ON ?auto_359902 ?auto_359901 ) ( ON ?auto_359903 ?auto_359902 ) ( ON ?auto_359904 ?auto_359903 ) ( not ( = ?auto_359893 ?auto_359894 ) ) ( not ( = ?auto_359893 ?auto_359895 ) ) ( not ( = ?auto_359893 ?auto_359896 ) ) ( not ( = ?auto_359893 ?auto_359897 ) ) ( not ( = ?auto_359893 ?auto_359898 ) ) ( not ( = ?auto_359893 ?auto_359899 ) ) ( not ( = ?auto_359893 ?auto_359900 ) ) ( not ( = ?auto_359893 ?auto_359901 ) ) ( not ( = ?auto_359893 ?auto_359902 ) ) ( not ( = ?auto_359893 ?auto_359903 ) ) ( not ( = ?auto_359893 ?auto_359904 ) ) ( not ( = ?auto_359893 ?auto_359905 ) ) ( not ( = ?auto_359893 ?auto_359906 ) ) ( not ( = ?auto_359894 ?auto_359895 ) ) ( not ( = ?auto_359894 ?auto_359896 ) ) ( not ( = ?auto_359894 ?auto_359897 ) ) ( not ( = ?auto_359894 ?auto_359898 ) ) ( not ( = ?auto_359894 ?auto_359899 ) ) ( not ( = ?auto_359894 ?auto_359900 ) ) ( not ( = ?auto_359894 ?auto_359901 ) ) ( not ( = ?auto_359894 ?auto_359902 ) ) ( not ( = ?auto_359894 ?auto_359903 ) ) ( not ( = ?auto_359894 ?auto_359904 ) ) ( not ( = ?auto_359894 ?auto_359905 ) ) ( not ( = ?auto_359894 ?auto_359906 ) ) ( not ( = ?auto_359895 ?auto_359896 ) ) ( not ( = ?auto_359895 ?auto_359897 ) ) ( not ( = ?auto_359895 ?auto_359898 ) ) ( not ( = ?auto_359895 ?auto_359899 ) ) ( not ( = ?auto_359895 ?auto_359900 ) ) ( not ( = ?auto_359895 ?auto_359901 ) ) ( not ( = ?auto_359895 ?auto_359902 ) ) ( not ( = ?auto_359895 ?auto_359903 ) ) ( not ( = ?auto_359895 ?auto_359904 ) ) ( not ( = ?auto_359895 ?auto_359905 ) ) ( not ( = ?auto_359895 ?auto_359906 ) ) ( not ( = ?auto_359896 ?auto_359897 ) ) ( not ( = ?auto_359896 ?auto_359898 ) ) ( not ( = ?auto_359896 ?auto_359899 ) ) ( not ( = ?auto_359896 ?auto_359900 ) ) ( not ( = ?auto_359896 ?auto_359901 ) ) ( not ( = ?auto_359896 ?auto_359902 ) ) ( not ( = ?auto_359896 ?auto_359903 ) ) ( not ( = ?auto_359896 ?auto_359904 ) ) ( not ( = ?auto_359896 ?auto_359905 ) ) ( not ( = ?auto_359896 ?auto_359906 ) ) ( not ( = ?auto_359897 ?auto_359898 ) ) ( not ( = ?auto_359897 ?auto_359899 ) ) ( not ( = ?auto_359897 ?auto_359900 ) ) ( not ( = ?auto_359897 ?auto_359901 ) ) ( not ( = ?auto_359897 ?auto_359902 ) ) ( not ( = ?auto_359897 ?auto_359903 ) ) ( not ( = ?auto_359897 ?auto_359904 ) ) ( not ( = ?auto_359897 ?auto_359905 ) ) ( not ( = ?auto_359897 ?auto_359906 ) ) ( not ( = ?auto_359898 ?auto_359899 ) ) ( not ( = ?auto_359898 ?auto_359900 ) ) ( not ( = ?auto_359898 ?auto_359901 ) ) ( not ( = ?auto_359898 ?auto_359902 ) ) ( not ( = ?auto_359898 ?auto_359903 ) ) ( not ( = ?auto_359898 ?auto_359904 ) ) ( not ( = ?auto_359898 ?auto_359905 ) ) ( not ( = ?auto_359898 ?auto_359906 ) ) ( not ( = ?auto_359899 ?auto_359900 ) ) ( not ( = ?auto_359899 ?auto_359901 ) ) ( not ( = ?auto_359899 ?auto_359902 ) ) ( not ( = ?auto_359899 ?auto_359903 ) ) ( not ( = ?auto_359899 ?auto_359904 ) ) ( not ( = ?auto_359899 ?auto_359905 ) ) ( not ( = ?auto_359899 ?auto_359906 ) ) ( not ( = ?auto_359900 ?auto_359901 ) ) ( not ( = ?auto_359900 ?auto_359902 ) ) ( not ( = ?auto_359900 ?auto_359903 ) ) ( not ( = ?auto_359900 ?auto_359904 ) ) ( not ( = ?auto_359900 ?auto_359905 ) ) ( not ( = ?auto_359900 ?auto_359906 ) ) ( not ( = ?auto_359901 ?auto_359902 ) ) ( not ( = ?auto_359901 ?auto_359903 ) ) ( not ( = ?auto_359901 ?auto_359904 ) ) ( not ( = ?auto_359901 ?auto_359905 ) ) ( not ( = ?auto_359901 ?auto_359906 ) ) ( not ( = ?auto_359902 ?auto_359903 ) ) ( not ( = ?auto_359902 ?auto_359904 ) ) ( not ( = ?auto_359902 ?auto_359905 ) ) ( not ( = ?auto_359902 ?auto_359906 ) ) ( not ( = ?auto_359903 ?auto_359904 ) ) ( not ( = ?auto_359903 ?auto_359905 ) ) ( not ( = ?auto_359903 ?auto_359906 ) ) ( not ( = ?auto_359904 ?auto_359905 ) ) ( not ( = ?auto_359904 ?auto_359906 ) ) ( not ( = ?auto_359905 ?auto_359906 ) ) ( CLEAR ?auto_359904 ) ( ON ?auto_359905 ?auto_359906 ) ( CLEAR ?auto_359905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_359893 ?auto_359894 ?auto_359895 ?auto_359896 ?auto_359897 ?auto_359898 ?auto_359899 ?auto_359900 ?auto_359901 ?auto_359902 ?auto_359903 ?auto_359904 ?auto_359905 )
      ( MAKE-14PILE ?auto_359893 ?auto_359894 ?auto_359895 ?auto_359896 ?auto_359897 ?auto_359898 ?auto_359899 ?auto_359900 ?auto_359901 ?auto_359902 ?auto_359903 ?auto_359904 ?auto_359905 ?auto_359906 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_359921 - BLOCK
      ?auto_359922 - BLOCK
      ?auto_359923 - BLOCK
      ?auto_359924 - BLOCK
      ?auto_359925 - BLOCK
      ?auto_359926 - BLOCK
      ?auto_359927 - BLOCK
      ?auto_359928 - BLOCK
      ?auto_359929 - BLOCK
      ?auto_359930 - BLOCK
      ?auto_359931 - BLOCK
      ?auto_359932 - BLOCK
      ?auto_359933 - BLOCK
      ?auto_359934 - BLOCK
    )
    :vars
    (
      ?auto_359935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359934 ?auto_359935 ) ( ON-TABLE ?auto_359921 ) ( ON ?auto_359922 ?auto_359921 ) ( ON ?auto_359923 ?auto_359922 ) ( ON ?auto_359924 ?auto_359923 ) ( ON ?auto_359925 ?auto_359924 ) ( ON ?auto_359926 ?auto_359925 ) ( ON ?auto_359927 ?auto_359926 ) ( ON ?auto_359928 ?auto_359927 ) ( ON ?auto_359929 ?auto_359928 ) ( ON ?auto_359930 ?auto_359929 ) ( ON ?auto_359931 ?auto_359930 ) ( not ( = ?auto_359921 ?auto_359922 ) ) ( not ( = ?auto_359921 ?auto_359923 ) ) ( not ( = ?auto_359921 ?auto_359924 ) ) ( not ( = ?auto_359921 ?auto_359925 ) ) ( not ( = ?auto_359921 ?auto_359926 ) ) ( not ( = ?auto_359921 ?auto_359927 ) ) ( not ( = ?auto_359921 ?auto_359928 ) ) ( not ( = ?auto_359921 ?auto_359929 ) ) ( not ( = ?auto_359921 ?auto_359930 ) ) ( not ( = ?auto_359921 ?auto_359931 ) ) ( not ( = ?auto_359921 ?auto_359932 ) ) ( not ( = ?auto_359921 ?auto_359933 ) ) ( not ( = ?auto_359921 ?auto_359934 ) ) ( not ( = ?auto_359921 ?auto_359935 ) ) ( not ( = ?auto_359922 ?auto_359923 ) ) ( not ( = ?auto_359922 ?auto_359924 ) ) ( not ( = ?auto_359922 ?auto_359925 ) ) ( not ( = ?auto_359922 ?auto_359926 ) ) ( not ( = ?auto_359922 ?auto_359927 ) ) ( not ( = ?auto_359922 ?auto_359928 ) ) ( not ( = ?auto_359922 ?auto_359929 ) ) ( not ( = ?auto_359922 ?auto_359930 ) ) ( not ( = ?auto_359922 ?auto_359931 ) ) ( not ( = ?auto_359922 ?auto_359932 ) ) ( not ( = ?auto_359922 ?auto_359933 ) ) ( not ( = ?auto_359922 ?auto_359934 ) ) ( not ( = ?auto_359922 ?auto_359935 ) ) ( not ( = ?auto_359923 ?auto_359924 ) ) ( not ( = ?auto_359923 ?auto_359925 ) ) ( not ( = ?auto_359923 ?auto_359926 ) ) ( not ( = ?auto_359923 ?auto_359927 ) ) ( not ( = ?auto_359923 ?auto_359928 ) ) ( not ( = ?auto_359923 ?auto_359929 ) ) ( not ( = ?auto_359923 ?auto_359930 ) ) ( not ( = ?auto_359923 ?auto_359931 ) ) ( not ( = ?auto_359923 ?auto_359932 ) ) ( not ( = ?auto_359923 ?auto_359933 ) ) ( not ( = ?auto_359923 ?auto_359934 ) ) ( not ( = ?auto_359923 ?auto_359935 ) ) ( not ( = ?auto_359924 ?auto_359925 ) ) ( not ( = ?auto_359924 ?auto_359926 ) ) ( not ( = ?auto_359924 ?auto_359927 ) ) ( not ( = ?auto_359924 ?auto_359928 ) ) ( not ( = ?auto_359924 ?auto_359929 ) ) ( not ( = ?auto_359924 ?auto_359930 ) ) ( not ( = ?auto_359924 ?auto_359931 ) ) ( not ( = ?auto_359924 ?auto_359932 ) ) ( not ( = ?auto_359924 ?auto_359933 ) ) ( not ( = ?auto_359924 ?auto_359934 ) ) ( not ( = ?auto_359924 ?auto_359935 ) ) ( not ( = ?auto_359925 ?auto_359926 ) ) ( not ( = ?auto_359925 ?auto_359927 ) ) ( not ( = ?auto_359925 ?auto_359928 ) ) ( not ( = ?auto_359925 ?auto_359929 ) ) ( not ( = ?auto_359925 ?auto_359930 ) ) ( not ( = ?auto_359925 ?auto_359931 ) ) ( not ( = ?auto_359925 ?auto_359932 ) ) ( not ( = ?auto_359925 ?auto_359933 ) ) ( not ( = ?auto_359925 ?auto_359934 ) ) ( not ( = ?auto_359925 ?auto_359935 ) ) ( not ( = ?auto_359926 ?auto_359927 ) ) ( not ( = ?auto_359926 ?auto_359928 ) ) ( not ( = ?auto_359926 ?auto_359929 ) ) ( not ( = ?auto_359926 ?auto_359930 ) ) ( not ( = ?auto_359926 ?auto_359931 ) ) ( not ( = ?auto_359926 ?auto_359932 ) ) ( not ( = ?auto_359926 ?auto_359933 ) ) ( not ( = ?auto_359926 ?auto_359934 ) ) ( not ( = ?auto_359926 ?auto_359935 ) ) ( not ( = ?auto_359927 ?auto_359928 ) ) ( not ( = ?auto_359927 ?auto_359929 ) ) ( not ( = ?auto_359927 ?auto_359930 ) ) ( not ( = ?auto_359927 ?auto_359931 ) ) ( not ( = ?auto_359927 ?auto_359932 ) ) ( not ( = ?auto_359927 ?auto_359933 ) ) ( not ( = ?auto_359927 ?auto_359934 ) ) ( not ( = ?auto_359927 ?auto_359935 ) ) ( not ( = ?auto_359928 ?auto_359929 ) ) ( not ( = ?auto_359928 ?auto_359930 ) ) ( not ( = ?auto_359928 ?auto_359931 ) ) ( not ( = ?auto_359928 ?auto_359932 ) ) ( not ( = ?auto_359928 ?auto_359933 ) ) ( not ( = ?auto_359928 ?auto_359934 ) ) ( not ( = ?auto_359928 ?auto_359935 ) ) ( not ( = ?auto_359929 ?auto_359930 ) ) ( not ( = ?auto_359929 ?auto_359931 ) ) ( not ( = ?auto_359929 ?auto_359932 ) ) ( not ( = ?auto_359929 ?auto_359933 ) ) ( not ( = ?auto_359929 ?auto_359934 ) ) ( not ( = ?auto_359929 ?auto_359935 ) ) ( not ( = ?auto_359930 ?auto_359931 ) ) ( not ( = ?auto_359930 ?auto_359932 ) ) ( not ( = ?auto_359930 ?auto_359933 ) ) ( not ( = ?auto_359930 ?auto_359934 ) ) ( not ( = ?auto_359930 ?auto_359935 ) ) ( not ( = ?auto_359931 ?auto_359932 ) ) ( not ( = ?auto_359931 ?auto_359933 ) ) ( not ( = ?auto_359931 ?auto_359934 ) ) ( not ( = ?auto_359931 ?auto_359935 ) ) ( not ( = ?auto_359932 ?auto_359933 ) ) ( not ( = ?auto_359932 ?auto_359934 ) ) ( not ( = ?auto_359932 ?auto_359935 ) ) ( not ( = ?auto_359933 ?auto_359934 ) ) ( not ( = ?auto_359933 ?auto_359935 ) ) ( not ( = ?auto_359934 ?auto_359935 ) ) ( ON ?auto_359933 ?auto_359934 ) ( CLEAR ?auto_359931 ) ( ON ?auto_359932 ?auto_359933 ) ( CLEAR ?auto_359932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_359921 ?auto_359922 ?auto_359923 ?auto_359924 ?auto_359925 ?auto_359926 ?auto_359927 ?auto_359928 ?auto_359929 ?auto_359930 ?auto_359931 ?auto_359932 )
      ( MAKE-14PILE ?auto_359921 ?auto_359922 ?auto_359923 ?auto_359924 ?auto_359925 ?auto_359926 ?auto_359927 ?auto_359928 ?auto_359929 ?auto_359930 ?auto_359931 ?auto_359932 ?auto_359933 ?auto_359934 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_359950 - BLOCK
      ?auto_359951 - BLOCK
      ?auto_359952 - BLOCK
      ?auto_359953 - BLOCK
      ?auto_359954 - BLOCK
      ?auto_359955 - BLOCK
      ?auto_359956 - BLOCK
      ?auto_359957 - BLOCK
      ?auto_359958 - BLOCK
      ?auto_359959 - BLOCK
      ?auto_359960 - BLOCK
      ?auto_359961 - BLOCK
      ?auto_359962 - BLOCK
      ?auto_359963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_359963 ) ( ON-TABLE ?auto_359950 ) ( ON ?auto_359951 ?auto_359950 ) ( ON ?auto_359952 ?auto_359951 ) ( ON ?auto_359953 ?auto_359952 ) ( ON ?auto_359954 ?auto_359953 ) ( ON ?auto_359955 ?auto_359954 ) ( ON ?auto_359956 ?auto_359955 ) ( ON ?auto_359957 ?auto_359956 ) ( ON ?auto_359958 ?auto_359957 ) ( ON ?auto_359959 ?auto_359958 ) ( ON ?auto_359960 ?auto_359959 ) ( not ( = ?auto_359950 ?auto_359951 ) ) ( not ( = ?auto_359950 ?auto_359952 ) ) ( not ( = ?auto_359950 ?auto_359953 ) ) ( not ( = ?auto_359950 ?auto_359954 ) ) ( not ( = ?auto_359950 ?auto_359955 ) ) ( not ( = ?auto_359950 ?auto_359956 ) ) ( not ( = ?auto_359950 ?auto_359957 ) ) ( not ( = ?auto_359950 ?auto_359958 ) ) ( not ( = ?auto_359950 ?auto_359959 ) ) ( not ( = ?auto_359950 ?auto_359960 ) ) ( not ( = ?auto_359950 ?auto_359961 ) ) ( not ( = ?auto_359950 ?auto_359962 ) ) ( not ( = ?auto_359950 ?auto_359963 ) ) ( not ( = ?auto_359951 ?auto_359952 ) ) ( not ( = ?auto_359951 ?auto_359953 ) ) ( not ( = ?auto_359951 ?auto_359954 ) ) ( not ( = ?auto_359951 ?auto_359955 ) ) ( not ( = ?auto_359951 ?auto_359956 ) ) ( not ( = ?auto_359951 ?auto_359957 ) ) ( not ( = ?auto_359951 ?auto_359958 ) ) ( not ( = ?auto_359951 ?auto_359959 ) ) ( not ( = ?auto_359951 ?auto_359960 ) ) ( not ( = ?auto_359951 ?auto_359961 ) ) ( not ( = ?auto_359951 ?auto_359962 ) ) ( not ( = ?auto_359951 ?auto_359963 ) ) ( not ( = ?auto_359952 ?auto_359953 ) ) ( not ( = ?auto_359952 ?auto_359954 ) ) ( not ( = ?auto_359952 ?auto_359955 ) ) ( not ( = ?auto_359952 ?auto_359956 ) ) ( not ( = ?auto_359952 ?auto_359957 ) ) ( not ( = ?auto_359952 ?auto_359958 ) ) ( not ( = ?auto_359952 ?auto_359959 ) ) ( not ( = ?auto_359952 ?auto_359960 ) ) ( not ( = ?auto_359952 ?auto_359961 ) ) ( not ( = ?auto_359952 ?auto_359962 ) ) ( not ( = ?auto_359952 ?auto_359963 ) ) ( not ( = ?auto_359953 ?auto_359954 ) ) ( not ( = ?auto_359953 ?auto_359955 ) ) ( not ( = ?auto_359953 ?auto_359956 ) ) ( not ( = ?auto_359953 ?auto_359957 ) ) ( not ( = ?auto_359953 ?auto_359958 ) ) ( not ( = ?auto_359953 ?auto_359959 ) ) ( not ( = ?auto_359953 ?auto_359960 ) ) ( not ( = ?auto_359953 ?auto_359961 ) ) ( not ( = ?auto_359953 ?auto_359962 ) ) ( not ( = ?auto_359953 ?auto_359963 ) ) ( not ( = ?auto_359954 ?auto_359955 ) ) ( not ( = ?auto_359954 ?auto_359956 ) ) ( not ( = ?auto_359954 ?auto_359957 ) ) ( not ( = ?auto_359954 ?auto_359958 ) ) ( not ( = ?auto_359954 ?auto_359959 ) ) ( not ( = ?auto_359954 ?auto_359960 ) ) ( not ( = ?auto_359954 ?auto_359961 ) ) ( not ( = ?auto_359954 ?auto_359962 ) ) ( not ( = ?auto_359954 ?auto_359963 ) ) ( not ( = ?auto_359955 ?auto_359956 ) ) ( not ( = ?auto_359955 ?auto_359957 ) ) ( not ( = ?auto_359955 ?auto_359958 ) ) ( not ( = ?auto_359955 ?auto_359959 ) ) ( not ( = ?auto_359955 ?auto_359960 ) ) ( not ( = ?auto_359955 ?auto_359961 ) ) ( not ( = ?auto_359955 ?auto_359962 ) ) ( not ( = ?auto_359955 ?auto_359963 ) ) ( not ( = ?auto_359956 ?auto_359957 ) ) ( not ( = ?auto_359956 ?auto_359958 ) ) ( not ( = ?auto_359956 ?auto_359959 ) ) ( not ( = ?auto_359956 ?auto_359960 ) ) ( not ( = ?auto_359956 ?auto_359961 ) ) ( not ( = ?auto_359956 ?auto_359962 ) ) ( not ( = ?auto_359956 ?auto_359963 ) ) ( not ( = ?auto_359957 ?auto_359958 ) ) ( not ( = ?auto_359957 ?auto_359959 ) ) ( not ( = ?auto_359957 ?auto_359960 ) ) ( not ( = ?auto_359957 ?auto_359961 ) ) ( not ( = ?auto_359957 ?auto_359962 ) ) ( not ( = ?auto_359957 ?auto_359963 ) ) ( not ( = ?auto_359958 ?auto_359959 ) ) ( not ( = ?auto_359958 ?auto_359960 ) ) ( not ( = ?auto_359958 ?auto_359961 ) ) ( not ( = ?auto_359958 ?auto_359962 ) ) ( not ( = ?auto_359958 ?auto_359963 ) ) ( not ( = ?auto_359959 ?auto_359960 ) ) ( not ( = ?auto_359959 ?auto_359961 ) ) ( not ( = ?auto_359959 ?auto_359962 ) ) ( not ( = ?auto_359959 ?auto_359963 ) ) ( not ( = ?auto_359960 ?auto_359961 ) ) ( not ( = ?auto_359960 ?auto_359962 ) ) ( not ( = ?auto_359960 ?auto_359963 ) ) ( not ( = ?auto_359961 ?auto_359962 ) ) ( not ( = ?auto_359961 ?auto_359963 ) ) ( not ( = ?auto_359962 ?auto_359963 ) ) ( ON ?auto_359962 ?auto_359963 ) ( CLEAR ?auto_359960 ) ( ON ?auto_359961 ?auto_359962 ) ( CLEAR ?auto_359961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_359950 ?auto_359951 ?auto_359952 ?auto_359953 ?auto_359954 ?auto_359955 ?auto_359956 ?auto_359957 ?auto_359958 ?auto_359959 ?auto_359960 ?auto_359961 )
      ( MAKE-14PILE ?auto_359950 ?auto_359951 ?auto_359952 ?auto_359953 ?auto_359954 ?auto_359955 ?auto_359956 ?auto_359957 ?auto_359958 ?auto_359959 ?auto_359960 ?auto_359961 ?auto_359962 ?auto_359963 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_359978 - BLOCK
      ?auto_359979 - BLOCK
      ?auto_359980 - BLOCK
      ?auto_359981 - BLOCK
      ?auto_359982 - BLOCK
      ?auto_359983 - BLOCK
      ?auto_359984 - BLOCK
      ?auto_359985 - BLOCK
      ?auto_359986 - BLOCK
      ?auto_359987 - BLOCK
      ?auto_359988 - BLOCK
      ?auto_359989 - BLOCK
      ?auto_359990 - BLOCK
      ?auto_359991 - BLOCK
    )
    :vars
    (
      ?auto_359992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_359991 ?auto_359992 ) ( ON-TABLE ?auto_359978 ) ( ON ?auto_359979 ?auto_359978 ) ( ON ?auto_359980 ?auto_359979 ) ( ON ?auto_359981 ?auto_359980 ) ( ON ?auto_359982 ?auto_359981 ) ( ON ?auto_359983 ?auto_359982 ) ( ON ?auto_359984 ?auto_359983 ) ( ON ?auto_359985 ?auto_359984 ) ( ON ?auto_359986 ?auto_359985 ) ( ON ?auto_359987 ?auto_359986 ) ( not ( = ?auto_359978 ?auto_359979 ) ) ( not ( = ?auto_359978 ?auto_359980 ) ) ( not ( = ?auto_359978 ?auto_359981 ) ) ( not ( = ?auto_359978 ?auto_359982 ) ) ( not ( = ?auto_359978 ?auto_359983 ) ) ( not ( = ?auto_359978 ?auto_359984 ) ) ( not ( = ?auto_359978 ?auto_359985 ) ) ( not ( = ?auto_359978 ?auto_359986 ) ) ( not ( = ?auto_359978 ?auto_359987 ) ) ( not ( = ?auto_359978 ?auto_359988 ) ) ( not ( = ?auto_359978 ?auto_359989 ) ) ( not ( = ?auto_359978 ?auto_359990 ) ) ( not ( = ?auto_359978 ?auto_359991 ) ) ( not ( = ?auto_359978 ?auto_359992 ) ) ( not ( = ?auto_359979 ?auto_359980 ) ) ( not ( = ?auto_359979 ?auto_359981 ) ) ( not ( = ?auto_359979 ?auto_359982 ) ) ( not ( = ?auto_359979 ?auto_359983 ) ) ( not ( = ?auto_359979 ?auto_359984 ) ) ( not ( = ?auto_359979 ?auto_359985 ) ) ( not ( = ?auto_359979 ?auto_359986 ) ) ( not ( = ?auto_359979 ?auto_359987 ) ) ( not ( = ?auto_359979 ?auto_359988 ) ) ( not ( = ?auto_359979 ?auto_359989 ) ) ( not ( = ?auto_359979 ?auto_359990 ) ) ( not ( = ?auto_359979 ?auto_359991 ) ) ( not ( = ?auto_359979 ?auto_359992 ) ) ( not ( = ?auto_359980 ?auto_359981 ) ) ( not ( = ?auto_359980 ?auto_359982 ) ) ( not ( = ?auto_359980 ?auto_359983 ) ) ( not ( = ?auto_359980 ?auto_359984 ) ) ( not ( = ?auto_359980 ?auto_359985 ) ) ( not ( = ?auto_359980 ?auto_359986 ) ) ( not ( = ?auto_359980 ?auto_359987 ) ) ( not ( = ?auto_359980 ?auto_359988 ) ) ( not ( = ?auto_359980 ?auto_359989 ) ) ( not ( = ?auto_359980 ?auto_359990 ) ) ( not ( = ?auto_359980 ?auto_359991 ) ) ( not ( = ?auto_359980 ?auto_359992 ) ) ( not ( = ?auto_359981 ?auto_359982 ) ) ( not ( = ?auto_359981 ?auto_359983 ) ) ( not ( = ?auto_359981 ?auto_359984 ) ) ( not ( = ?auto_359981 ?auto_359985 ) ) ( not ( = ?auto_359981 ?auto_359986 ) ) ( not ( = ?auto_359981 ?auto_359987 ) ) ( not ( = ?auto_359981 ?auto_359988 ) ) ( not ( = ?auto_359981 ?auto_359989 ) ) ( not ( = ?auto_359981 ?auto_359990 ) ) ( not ( = ?auto_359981 ?auto_359991 ) ) ( not ( = ?auto_359981 ?auto_359992 ) ) ( not ( = ?auto_359982 ?auto_359983 ) ) ( not ( = ?auto_359982 ?auto_359984 ) ) ( not ( = ?auto_359982 ?auto_359985 ) ) ( not ( = ?auto_359982 ?auto_359986 ) ) ( not ( = ?auto_359982 ?auto_359987 ) ) ( not ( = ?auto_359982 ?auto_359988 ) ) ( not ( = ?auto_359982 ?auto_359989 ) ) ( not ( = ?auto_359982 ?auto_359990 ) ) ( not ( = ?auto_359982 ?auto_359991 ) ) ( not ( = ?auto_359982 ?auto_359992 ) ) ( not ( = ?auto_359983 ?auto_359984 ) ) ( not ( = ?auto_359983 ?auto_359985 ) ) ( not ( = ?auto_359983 ?auto_359986 ) ) ( not ( = ?auto_359983 ?auto_359987 ) ) ( not ( = ?auto_359983 ?auto_359988 ) ) ( not ( = ?auto_359983 ?auto_359989 ) ) ( not ( = ?auto_359983 ?auto_359990 ) ) ( not ( = ?auto_359983 ?auto_359991 ) ) ( not ( = ?auto_359983 ?auto_359992 ) ) ( not ( = ?auto_359984 ?auto_359985 ) ) ( not ( = ?auto_359984 ?auto_359986 ) ) ( not ( = ?auto_359984 ?auto_359987 ) ) ( not ( = ?auto_359984 ?auto_359988 ) ) ( not ( = ?auto_359984 ?auto_359989 ) ) ( not ( = ?auto_359984 ?auto_359990 ) ) ( not ( = ?auto_359984 ?auto_359991 ) ) ( not ( = ?auto_359984 ?auto_359992 ) ) ( not ( = ?auto_359985 ?auto_359986 ) ) ( not ( = ?auto_359985 ?auto_359987 ) ) ( not ( = ?auto_359985 ?auto_359988 ) ) ( not ( = ?auto_359985 ?auto_359989 ) ) ( not ( = ?auto_359985 ?auto_359990 ) ) ( not ( = ?auto_359985 ?auto_359991 ) ) ( not ( = ?auto_359985 ?auto_359992 ) ) ( not ( = ?auto_359986 ?auto_359987 ) ) ( not ( = ?auto_359986 ?auto_359988 ) ) ( not ( = ?auto_359986 ?auto_359989 ) ) ( not ( = ?auto_359986 ?auto_359990 ) ) ( not ( = ?auto_359986 ?auto_359991 ) ) ( not ( = ?auto_359986 ?auto_359992 ) ) ( not ( = ?auto_359987 ?auto_359988 ) ) ( not ( = ?auto_359987 ?auto_359989 ) ) ( not ( = ?auto_359987 ?auto_359990 ) ) ( not ( = ?auto_359987 ?auto_359991 ) ) ( not ( = ?auto_359987 ?auto_359992 ) ) ( not ( = ?auto_359988 ?auto_359989 ) ) ( not ( = ?auto_359988 ?auto_359990 ) ) ( not ( = ?auto_359988 ?auto_359991 ) ) ( not ( = ?auto_359988 ?auto_359992 ) ) ( not ( = ?auto_359989 ?auto_359990 ) ) ( not ( = ?auto_359989 ?auto_359991 ) ) ( not ( = ?auto_359989 ?auto_359992 ) ) ( not ( = ?auto_359990 ?auto_359991 ) ) ( not ( = ?auto_359990 ?auto_359992 ) ) ( not ( = ?auto_359991 ?auto_359992 ) ) ( ON ?auto_359990 ?auto_359991 ) ( ON ?auto_359989 ?auto_359990 ) ( CLEAR ?auto_359987 ) ( ON ?auto_359988 ?auto_359989 ) ( CLEAR ?auto_359988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_359978 ?auto_359979 ?auto_359980 ?auto_359981 ?auto_359982 ?auto_359983 ?auto_359984 ?auto_359985 ?auto_359986 ?auto_359987 ?auto_359988 )
      ( MAKE-14PILE ?auto_359978 ?auto_359979 ?auto_359980 ?auto_359981 ?auto_359982 ?auto_359983 ?auto_359984 ?auto_359985 ?auto_359986 ?auto_359987 ?auto_359988 ?auto_359989 ?auto_359990 ?auto_359991 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360007 - BLOCK
      ?auto_360008 - BLOCK
      ?auto_360009 - BLOCK
      ?auto_360010 - BLOCK
      ?auto_360011 - BLOCK
      ?auto_360012 - BLOCK
      ?auto_360013 - BLOCK
      ?auto_360014 - BLOCK
      ?auto_360015 - BLOCK
      ?auto_360016 - BLOCK
      ?auto_360017 - BLOCK
      ?auto_360018 - BLOCK
      ?auto_360019 - BLOCK
      ?auto_360020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360020 ) ( ON-TABLE ?auto_360007 ) ( ON ?auto_360008 ?auto_360007 ) ( ON ?auto_360009 ?auto_360008 ) ( ON ?auto_360010 ?auto_360009 ) ( ON ?auto_360011 ?auto_360010 ) ( ON ?auto_360012 ?auto_360011 ) ( ON ?auto_360013 ?auto_360012 ) ( ON ?auto_360014 ?auto_360013 ) ( ON ?auto_360015 ?auto_360014 ) ( ON ?auto_360016 ?auto_360015 ) ( not ( = ?auto_360007 ?auto_360008 ) ) ( not ( = ?auto_360007 ?auto_360009 ) ) ( not ( = ?auto_360007 ?auto_360010 ) ) ( not ( = ?auto_360007 ?auto_360011 ) ) ( not ( = ?auto_360007 ?auto_360012 ) ) ( not ( = ?auto_360007 ?auto_360013 ) ) ( not ( = ?auto_360007 ?auto_360014 ) ) ( not ( = ?auto_360007 ?auto_360015 ) ) ( not ( = ?auto_360007 ?auto_360016 ) ) ( not ( = ?auto_360007 ?auto_360017 ) ) ( not ( = ?auto_360007 ?auto_360018 ) ) ( not ( = ?auto_360007 ?auto_360019 ) ) ( not ( = ?auto_360007 ?auto_360020 ) ) ( not ( = ?auto_360008 ?auto_360009 ) ) ( not ( = ?auto_360008 ?auto_360010 ) ) ( not ( = ?auto_360008 ?auto_360011 ) ) ( not ( = ?auto_360008 ?auto_360012 ) ) ( not ( = ?auto_360008 ?auto_360013 ) ) ( not ( = ?auto_360008 ?auto_360014 ) ) ( not ( = ?auto_360008 ?auto_360015 ) ) ( not ( = ?auto_360008 ?auto_360016 ) ) ( not ( = ?auto_360008 ?auto_360017 ) ) ( not ( = ?auto_360008 ?auto_360018 ) ) ( not ( = ?auto_360008 ?auto_360019 ) ) ( not ( = ?auto_360008 ?auto_360020 ) ) ( not ( = ?auto_360009 ?auto_360010 ) ) ( not ( = ?auto_360009 ?auto_360011 ) ) ( not ( = ?auto_360009 ?auto_360012 ) ) ( not ( = ?auto_360009 ?auto_360013 ) ) ( not ( = ?auto_360009 ?auto_360014 ) ) ( not ( = ?auto_360009 ?auto_360015 ) ) ( not ( = ?auto_360009 ?auto_360016 ) ) ( not ( = ?auto_360009 ?auto_360017 ) ) ( not ( = ?auto_360009 ?auto_360018 ) ) ( not ( = ?auto_360009 ?auto_360019 ) ) ( not ( = ?auto_360009 ?auto_360020 ) ) ( not ( = ?auto_360010 ?auto_360011 ) ) ( not ( = ?auto_360010 ?auto_360012 ) ) ( not ( = ?auto_360010 ?auto_360013 ) ) ( not ( = ?auto_360010 ?auto_360014 ) ) ( not ( = ?auto_360010 ?auto_360015 ) ) ( not ( = ?auto_360010 ?auto_360016 ) ) ( not ( = ?auto_360010 ?auto_360017 ) ) ( not ( = ?auto_360010 ?auto_360018 ) ) ( not ( = ?auto_360010 ?auto_360019 ) ) ( not ( = ?auto_360010 ?auto_360020 ) ) ( not ( = ?auto_360011 ?auto_360012 ) ) ( not ( = ?auto_360011 ?auto_360013 ) ) ( not ( = ?auto_360011 ?auto_360014 ) ) ( not ( = ?auto_360011 ?auto_360015 ) ) ( not ( = ?auto_360011 ?auto_360016 ) ) ( not ( = ?auto_360011 ?auto_360017 ) ) ( not ( = ?auto_360011 ?auto_360018 ) ) ( not ( = ?auto_360011 ?auto_360019 ) ) ( not ( = ?auto_360011 ?auto_360020 ) ) ( not ( = ?auto_360012 ?auto_360013 ) ) ( not ( = ?auto_360012 ?auto_360014 ) ) ( not ( = ?auto_360012 ?auto_360015 ) ) ( not ( = ?auto_360012 ?auto_360016 ) ) ( not ( = ?auto_360012 ?auto_360017 ) ) ( not ( = ?auto_360012 ?auto_360018 ) ) ( not ( = ?auto_360012 ?auto_360019 ) ) ( not ( = ?auto_360012 ?auto_360020 ) ) ( not ( = ?auto_360013 ?auto_360014 ) ) ( not ( = ?auto_360013 ?auto_360015 ) ) ( not ( = ?auto_360013 ?auto_360016 ) ) ( not ( = ?auto_360013 ?auto_360017 ) ) ( not ( = ?auto_360013 ?auto_360018 ) ) ( not ( = ?auto_360013 ?auto_360019 ) ) ( not ( = ?auto_360013 ?auto_360020 ) ) ( not ( = ?auto_360014 ?auto_360015 ) ) ( not ( = ?auto_360014 ?auto_360016 ) ) ( not ( = ?auto_360014 ?auto_360017 ) ) ( not ( = ?auto_360014 ?auto_360018 ) ) ( not ( = ?auto_360014 ?auto_360019 ) ) ( not ( = ?auto_360014 ?auto_360020 ) ) ( not ( = ?auto_360015 ?auto_360016 ) ) ( not ( = ?auto_360015 ?auto_360017 ) ) ( not ( = ?auto_360015 ?auto_360018 ) ) ( not ( = ?auto_360015 ?auto_360019 ) ) ( not ( = ?auto_360015 ?auto_360020 ) ) ( not ( = ?auto_360016 ?auto_360017 ) ) ( not ( = ?auto_360016 ?auto_360018 ) ) ( not ( = ?auto_360016 ?auto_360019 ) ) ( not ( = ?auto_360016 ?auto_360020 ) ) ( not ( = ?auto_360017 ?auto_360018 ) ) ( not ( = ?auto_360017 ?auto_360019 ) ) ( not ( = ?auto_360017 ?auto_360020 ) ) ( not ( = ?auto_360018 ?auto_360019 ) ) ( not ( = ?auto_360018 ?auto_360020 ) ) ( not ( = ?auto_360019 ?auto_360020 ) ) ( ON ?auto_360019 ?auto_360020 ) ( ON ?auto_360018 ?auto_360019 ) ( CLEAR ?auto_360016 ) ( ON ?auto_360017 ?auto_360018 ) ( CLEAR ?auto_360017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_360007 ?auto_360008 ?auto_360009 ?auto_360010 ?auto_360011 ?auto_360012 ?auto_360013 ?auto_360014 ?auto_360015 ?auto_360016 ?auto_360017 )
      ( MAKE-14PILE ?auto_360007 ?auto_360008 ?auto_360009 ?auto_360010 ?auto_360011 ?auto_360012 ?auto_360013 ?auto_360014 ?auto_360015 ?auto_360016 ?auto_360017 ?auto_360018 ?auto_360019 ?auto_360020 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360035 - BLOCK
      ?auto_360036 - BLOCK
      ?auto_360037 - BLOCK
      ?auto_360038 - BLOCK
      ?auto_360039 - BLOCK
      ?auto_360040 - BLOCK
      ?auto_360041 - BLOCK
      ?auto_360042 - BLOCK
      ?auto_360043 - BLOCK
      ?auto_360044 - BLOCK
      ?auto_360045 - BLOCK
      ?auto_360046 - BLOCK
      ?auto_360047 - BLOCK
      ?auto_360048 - BLOCK
    )
    :vars
    (
      ?auto_360049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360048 ?auto_360049 ) ( ON-TABLE ?auto_360035 ) ( ON ?auto_360036 ?auto_360035 ) ( ON ?auto_360037 ?auto_360036 ) ( ON ?auto_360038 ?auto_360037 ) ( ON ?auto_360039 ?auto_360038 ) ( ON ?auto_360040 ?auto_360039 ) ( ON ?auto_360041 ?auto_360040 ) ( ON ?auto_360042 ?auto_360041 ) ( ON ?auto_360043 ?auto_360042 ) ( not ( = ?auto_360035 ?auto_360036 ) ) ( not ( = ?auto_360035 ?auto_360037 ) ) ( not ( = ?auto_360035 ?auto_360038 ) ) ( not ( = ?auto_360035 ?auto_360039 ) ) ( not ( = ?auto_360035 ?auto_360040 ) ) ( not ( = ?auto_360035 ?auto_360041 ) ) ( not ( = ?auto_360035 ?auto_360042 ) ) ( not ( = ?auto_360035 ?auto_360043 ) ) ( not ( = ?auto_360035 ?auto_360044 ) ) ( not ( = ?auto_360035 ?auto_360045 ) ) ( not ( = ?auto_360035 ?auto_360046 ) ) ( not ( = ?auto_360035 ?auto_360047 ) ) ( not ( = ?auto_360035 ?auto_360048 ) ) ( not ( = ?auto_360035 ?auto_360049 ) ) ( not ( = ?auto_360036 ?auto_360037 ) ) ( not ( = ?auto_360036 ?auto_360038 ) ) ( not ( = ?auto_360036 ?auto_360039 ) ) ( not ( = ?auto_360036 ?auto_360040 ) ) ( not ( = ?auto_360036 ?auto_360041 ) ) ( not ( = ?auto_360036 ?auto_360042 ) ) ( not ( = ?auto_360036 ?auto_360043 ) ) ( not ( = ?auto_360036 ?auto_360044 ) ) ( not ( = ?auto_360036 ?auto_360045 ) ) ( not ( = ?auto_360036 ?auto_360046 ) ) ( not ( = ?auto_360036 ?auto_360047 ) ) ( not ( = ?auto_360036 ?auto_360048 ) ) ( not ( = ?auto_360036 ?auto_360049 ) ) ( not ( = ?auto_360037 ?auto_360038 ) ) ( not ( = ?auto_360037 ?auto_360039 ) ) ( not ( = ?auto_360037 ?auto_360040 ) ) ( not ( = ?auto_360037 ?auto_360041 ) ) ( not ( = ?auto_360037 ?auto_360042 ) ) ( not ( = ?auto_360037 ?auto_360043 ) ) ( not ( = ?auto_360037 ?auto_360044 ) ) ( not ( = ?auto_360037 ?auto_360045 ) ) ( not ( = ?auto_360037 ?auto_360046 ) ) ( not ( = ?auto_360037 ?auto_360047 ) ) ( not ( = ?auto_360037 ?auto_360048 ) ) ( not ( = ?auto_360037 ?auto_360049 ) ) ( not ( = ?auto_360038 ?auto_360039 ) ) ( not ( = ?auto_360038 ?auto_360040 ) ) ( not ( = ?auto_360038 ?auto_360041 ) ) ( not ( = ?auto_360038 ?auto_360042 ) ) ( not ( = ?auto_360038 ?auto_360043 ) ) ( not ( = ?auto_360038 ?auto_360044 ) ) ( not ( = ?auto_360038 ?auto_360045 ) ) ( not ( = ?auto_360038 ?auto_360046 ) ) ( not ( = ?auto_360038 ?auto_360047 ) ) ( not ( = ?auto_360038 ?auto_360048 ) ) ( not ( = ?auto_360038 ?auto_360049 ) ) ( not ( = ?auto_360039 ?auto_360040 ) ) ( not ( = ?auto_360039 ?auto_360041 ) ) ( not ( = ?auto_360039 ?auto_360042 ) ) ( not ( = ?auto_360039 ?auto_360043 ) ) ( not ( = ?auto_360039 ?auto_360044 ) ) ( not ( = ?auto_360039 ?auto_360045 ) ) ( not ( = ?auto_360039 ?auto_360046 ) ) ( not ( = ?auto_360039 ?auto_360047 ) ) ( not ( = ?auto_360039 ?auto_360048 ) ) ( not ( = ?auto_360039 ?auto_360049 ) ) ( not ( = ?auto_360040 ?auto_360041 ) ) ( not ( = ?auto_360040 ?auto_360042 ) ) ( not ( = ?auto_360040 ?auto_360043 ) ) ( not ( = ?auto_360040 ?auto_360044 ) ) ( not ( = ?auto_360040 ?auto_360045 ) ) ( not ( = ?auto_360040 ?auto_360046 ) ) ( not ( = ?auto_360040 ?auto_360047 ) ) ( not ( = ?auto_360040 ?auto_360048 ) ) ( not ( = ?auto_360040 ?auto_360049 ) ) ( not ( = ?auto_360041 ?auto_360042 ) ) ( not ( = ?auto_360041 ?auto_360043 ) ) ( not ( = ?auto_360041 ?auto_360044 ) ) ( not ( = ?auto_360041 ?auto_360045 ) ) ( not ( = ?auto_360041 ?auto_360046 ) ) ( not ( = ?auto_360041 ?auto_360047 ) ) ( not ( = ?auto_360041 ?auto_360048 ) ) ( not ( = ?auto_360041 ?auto_360049 ) ) ( not ( = ?auto_360042 ?auto_360043 ) ) ( not ( = ?auto_360042 ?auto_360044 ) ) ( not ( = ?auto_360042 ?auto_360045 ) ) ( not ( = ?auto_360042 ?auto_360046 ) ) ( not ( = ?auto_360042 ?auto_360047 ) ) ( not ( = ?auto_360042 ?auto_360048 ) ) ( not ( = ?auto_360042 ?auto_360049 ) ) ( not ( = ?auto_360043 ?auto_360044 ) ) ( not ( = ?auto_360043 ?auto_360045 ) ) ( not ( = ?auto_360043 ?auto_360046 ) ) ( not ( = ?auto_360043 ?auto_360047 ) ) ( not ( = ?auto_360043 ?auto_360048 ) ) ( not ( = ?auto_360043 ?auto_360049 ) ) ( not ( = ?auto_360044 ?auto_360045 ) ) ( not ( = ?auto_360044 ?auto_360046 ) ) ( not ( = ?auto_360044 ?auto_360047 ) ) ( not ( = ?auto_360044 ?auto_360048 ) ) ( not ( = ?auto_360044 ?auto_360049 ) ) ( not ( = ?auto_360045 ?auto_360046 ) ) ( not ( = ?auto_360045 ?auto_360047 ) ) ( not ( = ?auto_360045 ?auto_360048 ) ) ( not ( = ?auto_360045 ?auto_360049 ) ) ( not ( = ?auto_360046 ?auto_360047 ) ) ( not ( = ?auto_360046 ?auto_360048 ) ) ( not ( = ?auto_360046 ?auto_360049 ) ) ( not ( = ?auto_360047 ?auto_360048 ) ) ( not ( = ?auto_360047 ?auto_360049 ) ) ( not ( = ?auto_360048 ?auto_360049 ) ) ( ON ?auto_360047 ?auto_360048 ) ( ON ?auto_360046 ?auto_360047 ) ( ON ?auto_360045 ?auto_360046 ) ( CLEAR ?auto_360043 ) ( ON ?auto_360044 ?auto_360045 ) ( CLEAR ?auto_360044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_360035 ?auto_360036 ?auto_360037 ?auto_360038 ?auto_360039 ?auto_360040 ?auto_360041 ?auto_360042 ?auto_360043 ?auto_360044 )
      ( MAKE-14PILE ?auto_360035 ?auto_360036 ?auto_360037 ?auto_360038 ?auto_360039 ?auto_360040 ?auto_360041 ?auto_360042 ?auto_360043 ?auto_360044 ?auto_360045 ?auto_360046 ?auto_360047 ?auto_360048 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360064 - BLOCK
      ?auto_360065 - BLOCK
      ?auto_360066 - BLOCK
      ?auto_360067 - BLOCK
      ?auto_360068 - BLOCK
      ?auto_360069 - BLOCK
      ?auto_360070 - BLOCK
      ?auto_360071 - BLOCK
      ?auto_360072 - BLOCK
      ?auto_360073 - BLOCK
      ?auto_360074 - BLOCK
      ?auto_360075 - BLOCK
      ?auto_360076 - BLOCK
      ?auto_360077 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360077 ) ( ON-TABLE ?auto_360064 ) ( ON ?auto_360065 ?auto_360064 ) ( ON ?auto_360066 ?auto_360065 ) ( ON ?auto_360067 ?auto_360066 ) ( ON ?auto_360068 ?auto_360067 ) ( ON ?auto_360069 ?auto_360068 ) ( ON ?auto_360070 ?auto_360069 ) ( ON ?auto_360071 ?auto_360070 ) ( ON ?auto_360072 ?auto_360071 ) ( not ( = ?auto_360064 ?auto_360065 ) ) ( not ( = ?auto_360064 ?auto_360066 ) ) ( not ( = ?auto_360064 ?auto_360067 ) ) ( not ( = ?auto_360064 ?auto_360068 ) ) ( not ( = ?auto_360064 ?auto_360069 ) ) ( not ( = ?auto_360064 ?auto_360070 ) ) ( not ( = ?auto_360064 ?auto_360071 ) ) ( not ( = ?auto_360064 ?auto_360072 ) ) ( not ( = ?auto_360064 ?auto_360073 ) ) ( not ( = ?auto_360064 ?auto_360074 ) ) ( not ( = ?auto_360064 ?auto_360075 ) ) ( not ( = ?auto_360064 ?auto_360076 ) ) ( not ( = ?auto_360064 ?auto_360077 ) ) ( not ( = ?auto_360065 ?auto_360066 ) ) ( not ( = ?auto_360065 ?auto_360067 ) ) ( not ( = ?auto_360065 ?auto_360068 ) ) ( not ( = ?auto_360065 ?auto_360069 ) ) ( not ( = ?auto_360065 ?auto_360070 ) ) ( not ( = ?auto_360065 ?auto_360071 ) ) ( not ( = ?auto_360065 ?auto_360072 ) ) ( not ( = ?auto_360065 ?auto_360073 ) ) ( not ( = ?auto_360065 ?auto_360074 ) ) ( not ( = ?auto_360065 ?auto_360075 ) ) ( not ( = ?auto_360065 ?auto_360076 ) ) ( not ( = ?auto_360065 ?auto_360077 ) ) ( not ( = ?auto_360066 ?auto_360067 ) ) ( not ( = ?auto_360066 ?auto_360068 ) ) ( not ( = ?auto_360066 ?auto_360069 ) ) ( not ( = ?auto_360066 ?auto_360070 ) ) ( not ( = ?auto_360066 ?auto_360071 ) ) ( not ( = ?auto_360066 ?auto_360072 ) ) ( not ( = ?auto_360066 ?auto_360073 ) ) ( not ( = ?auto_360066 ?auto_360074 ) ) ( not ( = ?auto_360066 ?auto_360075 ) ) ( not ( = ?auto_360066 ?auto_360076 ) ) ( not ( = ?auto_360066 ?auto_360077 ) ) ( not ( = ?auto_360067 ?auto_360068 ) ) ( not ( = ?auto_360067 ?auto_360069 ) ) ( not ( = ?auto_360067 ?auto_360070 ) ) ( not ( = ?auto_360067 ?auto_360071 ) ) ( not ( = ?auto_360067 ?auto_360072 ) ) ( not ( = ?auto_360067 ?auto_360073 ) ) ( not ( = ?auto_360067 ?auto_360074 ) ) ( not ( = ?auto_360067 ?auto_360075 ) ) ( not ( = ?auto_360067 ?auto_360076 ) ) ( not ( = ?auto_360067 ?auto_360077 ) ) ( not ( = ?auto_360068 ?auto_360069 ) ) ( not ( = ?auto_360068 ?auto_360070 ) ) ( not ( = ?auto_360068 ?auto_360071 ) ) ( not ( = ?auto_360068 ?auto_360072 ) ) ( not ( = ?auto_360068 ?auto_360073 ) ) ( not ( = ?auto_360068 ?auto_360074 ) ) ( not ( = ?auto_360068 ?auto_360075 ) ) ( not ( = ?auto_360068 ?auto_360076 ) ) ( not ( = ?auto_360068 ?auto_360077 ) ) ( not ( = ?auto_360069 ?auto_360070 ) ) ( not ( = ?auto_360069 ?auto_360071 ) ) ( not ( = ?auto_360069 ?auto_360072 ) ) ( not ( = ?auto_360069 ?auto_360073 ) ) ( not ( = ?auto_360069 ?auto_360074 ) ) ( not ( = ?auto_360069 ?auto_360075 ) ) ( not ( = ?auto_360069 ?auto_360076 ) ) ( not ( = ?auto_360069 ?auto_360077 ) ) ( not ( = ?auto_360070 ?auto_360071 ) ) ( not ( = ?auto_360070 ?auto_360072 ) ) ( not ( = ?auto_360070 ?auto_360073 ) ) ( not ( = ?auto_360070 ?auto_360074 ) ) ( not ( = ?auto_360070 ?auto_360075 ) ) ( not ( = ?auto_360070 ?auto_360076 ) ) ( not ( = ?auto_360070 ?auto_360077 ) ) ( not ( = ?auto_360071 ?auto_360072 ) ) ( not ( = ?auto_360071 ?auto_360073 ) ) ( not ( = ?auto_360071 ?auto_360074 ) ) ( not ( = ?auto_360071 ?auto_360075 ) ) ( not ( = ?auto_360071 ?auto_360076 ) ) ( not ( = ?auto_360071 ?auto_360077 ) ) ( not ( = ?auto_360072 ?auto_360073 ) ) ( not ( = ?auto_360072 ?auto_360074 ) ) ( not ( = ?auto_360072 ?auto_360075 ) ) ( not ( = ?auto_360072 ?auto_360076 ) ) ( not ( = ?auto_360072 ?auto_360077 ) ) ( not ( = ?auto_360073 ?auto_360074 ) ) ( not ( = ?auto_360073 ?auto_360075 ) ) ( not ( = ?auto_360073 ?auto_360076 ) ) ( not ( = ?auto_360073 ?auto_360077 ) ) ( not ( = ?auto_360074 ?auto_360075 ) ) ( not ( = ?auto_360074 ?auto_360076 ) ) ( not ( = ?auto_360074 ?auto_360077 ) ) ( not ( = ?auto_360075 ?auto_360076 ) ) ( not ( = ?auto_360075 ?auto_360077 ) ) ( not ( = ?auto_360076 ?auto_360077 ) ) ( ON ?auto_360076 ?auto_360077 ) ( ON ?auto_360075 ?auto_360076 ) ( ON ?auto_360074 ?auto_360075 ) ( CLEAR ?auto_360072 ) ( ON ?auto_360073 ?auto_360074 ) ( CLEAR ?auto_360073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_360064 ?auto_360065 ?auto_360066 ?auto_360067 ?auto_360068 ?auto_360069 ?auto_360070 ?auto_360071 ?auto_360072 ?auto_360073 )
      ( MAKE-14PILE ?auto_360064 ?auto_360065 ?auto_360066 ?auto_360067 ?auto_360068 ?auto_360069 ?auto_360070 ?auto_360071 ?auto_360072 ?auto_360073 ?auto_360074 ?auto_360075 ?auto_360076 ?auto_360077 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360092 - BLOCK
      ?auto_360093 - BLOCK
      ?auto_360094 - BLOCK
      ?auto_360095 - BLOCK
      ?auto_360096 - BLOCK
      ?auto_360097 - BLOCK
      ?auto_360098 - BLOCK
      ?auto_360099 - BLOCK
      ?auto_360100 - BLOCK
      ?auto_360101 - BLOCK
      ?auto_360102 - BLOCK
      ?auto_360103 - BLOCK
      ?auto_360104 - BLOCK
      ?auto_360105 - BLOCK
    )
    :vars
    (
      ?auto_360106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360105 ?auto_360106 ) ( ON-TABLE ?auto_360092 ) ( ON ?auto_360093 ?auto_360092 ) ( ON ?auto_360094 ?auto_360093 ) ( ON ?auto_360095 ?auto_360094 ) ( ON ?auto_360096 ?auto_360095 ) ( ON ?auto_360097 ?auto_360096 ) ( ON ?auto_360098 ?auto_360097 ) ( ON ?auto_360099 ?auto_360098 ) ( not ( = ?auto_360092 ?auto_360093 ) ) ( not ( = ?auto_360092 ?auto_360094 ) ) ( not ( = ?auto_360092 ?auto_360095 ) ) ( not ( = ?auto_360092 ?auto_360096 ) ) ( not ( = ?auto_360092 ?auto_360097 ) ) ( not ( = ?auto_360092 ?auto_360098 ) ) ( not ( = ?auto_360092 ?auto_360099 ) ) ( not ( = ?auto_360092 ?auto_360100 ) ) ( not ( = ?auto_360092 ?auto_360101 ) ) ( not ( = ?auto_360092 ?auto_360102 ) ) ( not ( = ?auto_360092 ?auto_360103 ) ) ( not ( = ?auto_360092 ?auto_360104 ) ) ( not ( = ?auto_360092 ?auto_360105 ) ) ( not ( = ?auto_360092 ?auto_360106 ) ) ( not ( = ?auto_360093 ?auto_360094 ) ) ( not ( = ?auto_360093 ?auto_360095 ) ) ( not ( = ?auto_360093 ?auto_360096 ) ) ( not ( = ?auto_360093 ?auto_360097 ) ) ( not ( = ?auto_360093 ?auto_360098 ) ) ( not ( = ?auto_360093 ?auto_360099 ) ) ( not ( = ?auto_360093 ?auto_360100 ) ) ( not ( = ?auto_360093 ?auto_360101 ) ) ( not ( = ?auto_360093 ?auto_360102 ) ) ( not ( = ?auto_360093 ?auto_360103 ) ) ( not ( = ?auto_360093 ?auto_360104 ) ) ( not ( = ?auto_360093 ?auto_360105 ) ) ( not ( = ?auto_360093 ?auto_360106 ) ) ( not ( = ?auto_360094 ?auto_360095 ) ) ( not ( = ?auto_360094 ?auto_360096 ) ) ( not ( = ?auto_360094 ?auto_360097 ) ) ( not ( = ?auto_360094 ?auto_360098 ) ) ( not ( = ?auto_360094 ?auto_360099 ) ) ( not ( = ?auto_360094 ?auto_360100 ) ) ( not ( = ?auto_360094 ?auto_360101 ) ) ( not ( = ?auto_360094 ?auto_360102 ) ) ( not ( = ?auto_360094 ?auto_360103 ) ) ( not ( = ?auto_360094 ?auto_360104 ) ) ( not ( = ?auto_360094 ?auto_360105 ) ) ( not ( = ?auto_360094 ?auto_360106 ) ) ( not ( = ?auto_360095 ?auto_360096 ) ) ( not ( = ?auto_360095 ?auto_360097 ) ) ( not ( = ?auto_360095 ?auto_360098 ) ) ( not ( = ?auto_360095 ?auto_360099 ) ) ( not ( = ?auto_360095 ?auto_360100 ) ) ( not ( = ?auto_360095 ?auto_360101 ) ) ( not ( = ?auto_360095 ?auto_360102 ) ) ( not ( = ?auto_360095 ?auto_360103 ) ) ( not ( = ?auto_360095 ?auto_360104 ) ) ( not ( = ?auto_360095 ?auto_360105 ) ) ( not ( = ?auto_360095 ?auto_360106 ) ) ( not ( = ?auto_360096 ?auto_360097 ) ) ( not ( = ?auto_360096 ?auto_360098 ) ) ( not ( = ?auto_360096 ?auto_360099 ) ) ( not ( = ?auto_360096 ?auto_360100 ) ) ( not ( = ?auto_360096 ?auto_360101 ) ) ( not ( = ?auto_360096 ?auto_360102 ) ) ( not ( = ?auto_360096 ?auto_360103 ) ) ( not ( = ?auto_360096 ?auto_360104 ) ) ( not ( = ?auto_360096 ?auto_360105 ) ) ( not ( = ?auto_360096 ?auto_360106 ) ) ( not ( = ?auto_360097 ?auto_360098 ) ) ( not ( = ?auto_360097 ?auto_360099 ) ) ( not ( = ?auto_360097 ?auto_360100 ) ) ( not ( = ?auto_360097 ?auto_360101 ) ) ( not ( = ?auto_360097 ?auto_360102 ) ) ( not ( = ?auto_360097 ?auto_360103 ) ) ( not ( = ?auto_360097 ?auto_360104 ) ) ( not ( = ?auto_360097 ?auto_360105 ) ) ( not ( = ?auto_360097 ?auto_360106 ) ) ( not ( = ?auto_360098 ?auto_360099 ) ) ( not ( = ?auto_360098 ?auto_360100 ) ) ( not ( = ?auto_360098 ?auto_360101 ) ) ( not ( = ?auto_360098 ?auto_360102 ) ) ( not ( = ?auto_360098 ?auto_360103 ) ) ( not ( = ?auto_360098 ?auto_360104 ) ) ( not ( = ?auto_360098 ?auto_360105 ) ) ( not ( = ?auto_360098 ?auto_360106 ) ) ( not ( = ?auto_360099 ?auto_360100 ) ) ( not ( = ?auto_360099 ?auto_360101 ) ) ( not ( = ?auto_360099 ?auto_360102 ) ) ( not ( = ?auto_360099 ?auto_360103 ) ) ( not ( = ?auto_360099 ?auto_360104 ) ) ( not ( = ?auto_360099 ?auto_360105 ) ) ( not ( = ?auto_360099 ?auto_360106 ) ) ( not ( = ?auto_360100 ?auto_360101 ) ) ( not ( = ?auto_360100 ?auto_360102 ) ) ( not ( = ?auto_360100 ?auto_360103 ) ) ( not ( = ?auto_360100 ?auto_360104 ) ) ( not ( = ?auto_360100 ?auto_360105 ) ) ( not ( = ?auto_360100 ?auto_360106 ) ) ( not ( = ?auto_360101 ?auto_360102 ) ) ( not ( = ?auto_360101 ?auto_360103 ) ) ( not ( = ?auto_360101 ?auto_360104 ) ) ( not ( = ?auto_360101 ?auto_360105 ) ) ( not ( = ?auto_360101 ?auto_360106 ) ) ( not ( = ?auto_360102 ?auto_360103 ) ) ( not ( = ?auto_360102 ?auto_360104 ) ) ( not ( = ?auto_360102 ?auto_360105 ) ) ( not ( = ?auto_360102 ?auto_360106 ) ) ( not ( = ?auto_360103 ?auto_360104 ) ) ( not ( = ?auto_360103 ?auto_360105 ) ) ( not ( = ?auto_360103 ?auto_360106 ) ) ( not ( = ?auto_360104 ?auto_360105 ) ) ( not ( = ?auto_360104 ?auto_360106 ) ) ( not ( = ?auto_360105 ?auto_360106 ) ) ( ON ?auto_360104 ?auto_360105 ) ( ON ?auto_360103 ?auto_360104 ) ( ON ?auto_360102 ?auto_360103 ) ( ON ?auto_360101 ?auto_360102 ) ( CLEAR ?auto_360099 ) ( ON ?auto_360100 ?auto_360101 ) ( CLEAR ?auto_360100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_360092 ?auto_360093 ?auto_360094 ?auto_360095 ?auto_360096 ?auto_360097 ?auto_360098 ?auto_360099 ?auto_360100 )
      ( MAKE-14PILE ?auto_360092 ?auto_360093 ?auto_360094 ?auto_360095 ?auto_360096 ?auto_360097 ?auto_360098 ?auto_360099 ?auto_360100 ?auto_360101 ?auto_360102 ?auto_360103 ?auto_360104 ?auto_360105 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360121 - BLOCK
      ?auto_360122 - BLOCK
      ?auto_360123 - BLOCK
      ?auto_360124 - BLOCK
      ?auto_360125 - BLOCK
      ?auto_360126 - BLOCK
      ?auto_360127 - BLOCK
      ?auto_360128 - BLOCK
      ?auto_360129 - BLOCK
      ?auto_360130 - BLOCK
      ?auto_360131 - BLOCK
      ?auto_360132 - BLOCK
      ?auto_360133 - BLOCK
      ?auto_360134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360134 ) ( ON-TABLE ?auto_360121 ) ( ON ?auto_360122 ?auto_360121 ) ( ON ?auto_360123 ?auto_360122 ) ( ON ?auto_360124 ?auto_360123 ) ( ON ?auto_360125 ?auto_360124 ) ( ON ?auto_360126 ?auto_360125 ) ( ON ?auto_360127 ?auto_360126 ) ( ON ?auto_360128 ?auto_360127 ) ( not ( = ?auto_360121 ?auto_360122 ) ) ( not ( = ?auto_360121 ?auto_360123 ) ) ( not ( = ?auto_360121 ?auto_360124 ) ) ( not ( = ?auto_360121 ?auto_360125 ) ) ( not ( = ?auto_360121 ?auto_360126 ) ) ( not ( = ?auto_360121 ?auto_360127 ) ) ( not ( = ?auto_360121 ?auto_360128 ) ) ( not ( = ?auto_360121 ?auto_360129 ) ) ( not ( = ?auto_360121 ?auto_360130 ) ) ( not ( = ?auto_360121 ?auto_360131 ) ) ( not ( = ?auto_360121 ?auto_360132 ) ) ( not ( = ?auto_360121 ?auto_360133 ) ) ( not ( = ?auto_360121 ?auto_360134 ) ) ( not ( = ?auto_360122 ?auto_360123 ) ) ( not ( = ?auto_360122 ?auto_360124 ) ) ( not ( = ?auto_360122 ?auto_360125 ) ) ( not ( = ?auto_360122 ?auto_360126 ) ) ( not ( = ?auto_360122 ?auto_360127 ) ) ( not ( = ?auto_360122 ?auto_360128 ) ) ( not ( = ?auto_360122 ?auto_360129 ) ) ( not ( = ?auto_360122 ?auto_360130 ) ) ( not ( = ?auto_360122 ?auto_360131 ) ) ( not ( = ?auto_360122 ?auto_360132 ) ) ( not ( = ?auto_360122 ?auto_360133 ) ) ( not ( = ?auto_360122 ?auto_360134 ) ) ( not ( = ?auto_360123 ?auto_360124 ) ) ( not ( = ?auto_360123 ?auto_360125 ) ) ( not ( = ?auto_360123 ?auto_360126 ) ) ( not ( = ?auto_360123 ?auto_360127 ) ) ( not ( = ?auto_360123 ?auto_360128 ) ) ( not ( = ?auto_360123 ?auto_360129 ) ) ( not ( = ?auto_360123 ?auto_360130 ) ) ( not ( = ?auto_360123 ?auto_360131 ) ) ( not ( = ?auto_360123 ?auto_360132 ) ) ( not ( = ?auto_360123 ?auto_360133 ) ) ( not ( = ?auto_360123 ?auto_360134 ) ) ( not ( = ?auto_360124 ?auto_360125 ) ) ( not ( = ?auto_360124 ?auto_360126 ) ) ( not ( = ?auto_360124 ?auto_360127 ) ) ( not ( = ?auto_360124 ?auto_360128 ) ) ( not ( = ?auto_360124 ?auto_360129 ) ) ( not ( = ?auto_360124 ?auto_360130 ) ) ( not ( = ?auto_360124 ?auto_360131 ) ) ( not ( = ?auto_360124 ?auto_360132 ) ) ( not ( = ?auto_360124 ?auto_360133 ) ) ( not ( = ?auto_360124 ?auto_360134 ) ) ( not ( = ?auto_360125 ?auto_360126 ) ) ( not ( = ?auto_360125 ?auto_360127 ) ) ( not ( = ?auto_360125 ?auto_360128 ) ) ( not ( = ?auto_360125 ?auto_360129 ) ) ( not ( = ?auto_360125 ?auto_360130 ) ) ( not ( = ?auto_360125 ?auto_360131 ) ) ( not ( = ?auto_360125 ?auto_360132 ) ) ( not ( = ?auto_360125 ?auto_360133 ) ) ( not ( = ?auto_360125 ?auto_360134 ) ) ( not ( = ?auto_360126 ?auto_360127 ) ) ( not ( = ?auto_360126 ?auto_360128 ) ) ( not ( = ?auto_360126 ?auto_360129 ) ) ( not ( = ?auto_360126 ?auto_360130 ) ) ( not ( = ?auto_360126 ?auto_360131 ) ) ( not ( = ?auto_360126 ?auto_360132 ) ) ( not ( = ?auto_360126 ?auto_360133 ) ) ( not ( = ?auto_360126 ?auto_360134 ) ) ( not ( = ?auto_360127 ?auto_360128 ) ) ( not ( = ?auto_360127 ?auto_360129 ) ) ( not ( = ?auto_360127 ?auto_360130 ) ) ( not ( = ?auto_360127 ?auto_360131 ) ) ( not ( = ?auto_360127 ?auto_360132 ) ) ( not ( = ?auto_360127 ?auto_360133 ) ) ( not ( = ?auto_360127 ?auto_360134 ) ) ( not ( = ?auto_360128 ?auto_360129 ) ) ( not ( = ?auto_360128 ?auto_360130 ) ) ( not ( = ?auto_360128 ?auto_360131 ) ) ( not ( = ?auto_360128 ?auto_360132 ) ) ( not ( = ?auto_360128 ?auto_360133 ) ) ( not ( = ?auto_360128 ?auto_360134 ) ) ( not ( = ?auto_360129 ?auto_360130 ) ) ( not ( = ?auto_360129 ?auto_360131 ) ) ( not ( = ?auto_360129 ?auto_360132 ) ) ( not ( = ?auto_360129 ?auto_360133 ) ) ( not ( = ?auto_360129 ?auto_360134 ) ) ( not ( = ?auto_360130 ?auto_360131 ) ) ( not ( = ?auto_360130 ?auto_360132 ) ) ( not ( = ?auto_360130 ?auto_360133 ) ) ( not ( = ?auto_360130 ?auto_360134 ) ) ( not ( = ?auto_360131 ?auto_360132 ) ) ( not ( = ?auto_360131 ?auto_360133 ) ) ( not ( = ?auto_360131 ?auto_360134 ) ) ( not ( = ?auto_360132 ?auto_360133 ) ) ( not ( = ?auto_360132 ?auto_360134 ) ) ( not ( = ?auto_360133 ?auto_360134 ) ) ( ON ?auto_360133 ?auto_360134 ) ( ON ?auto_360132 ?auto_360133 ) ( ON ?auto_360131 ?auto_360132 ) ( ON ?auto_360130 ?auto_360131 ) ( CLEAR ?auto_360128 ) ( ON ?auto_360129 ?auto_360130 ) ( CLEAR ?auto_360129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_360121 ?auto_360122 ?auto_360123 ?auto_360124 ?auto_360125 ?auto_360126 ?auto_360127 ?auto_360128 ?auto_360129 )
      ( MAKE-14PILE ?auto_360121 ?auto_360122 ?auto_360123 ?auto_360124 ?auto_360125 ?auto_360126 ?auto_360127 ?auto_360128 ?auto_360129 ?auto_360130 ?auto_360131 ?auto_360132 ?auto_360133 ?auto_360134 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360149 - BLOCK
      ?auto_360150 - BLOCK
      ?auto_360151 - BLOCK
      ?auto_360152 - BLOCK
      ?auto_360153 - BLOCK
      ?auto_360154 - BLOCK
      ?auto_360155 - BLOCK
      ?auto_360156 - BLOCK
      ?auto_360157 - BLOCK
      ?auto_360158 - BLOCK
      ?auto_360159 - BLOCK
      ?auto_360160 - BLOCK
      ?auto_360161 - BLOCK
      ?auto_360162 - BLOCK
    )
    :vars
    (
      ?auto_360163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360162 ?auto_360163 ) ( ON-TABLE ?auto_360149 ) ( ON ?auto_360150 ?auto_360149 ) ( ON ?auto_360151 ?auto_360150 ) ( ON ?auto_360152 ?auto_360151 ) ( ON ?auto_360153 ?auto_360152 ) ( ON ?auto_360154 ?auto_360153 ) ( ON ?auto_360155 ?auto_360154 ) ( not ( = ?auto_360149 ?auto_360150 ) ) ( not ( = ?auto_360149 ?auto_360151 ) ) ( not ( = ?auto_360149 ?auto_360152 ) ) ( not ( = ?auto_360149 ?auto_360153 ) ) ( not ( = ?auto_360149 ?auto_360154 ) ) ( not ( = ?auto_360149 ?auto_360155 ) ) ( not ( = ?auto_360149 ?auto_360156 ) ) ( not ( = ?auto_360149 ?auto_360157 ) ) ( not ( = ?auto_360149 ?auto_360158 ) ) ( not ( = ?auto_360149 ?auto_360159 ) ) ( not ( = ?auto_360149 ?auto_360160 ) ) ( not ( = ?auto_360149 ?auto_360161 ) ) ( not ( = ?auto_360149 ?auto_360162 ) ) ( not ( = ?auto_360149 ?auto_360163 ) ) ( not ( = ?auto_360150 ?auto_360151 ) ) ( not ( = ?auto_360150 ?auto_360152 ) ) ( not ( = ?auto_360150 ?auto_360153 ) ) ( not ( = ?auto_360150 ?auto_360154 ) ) ( not ( = ?auto_360150 ?auto_360155 ) ) ( not ( = ?auto_360150 ?auto_360156 ) ) ( not ( = ?auto_360150 ?auto_360157 ) ) ( not ( = ?auto_360150 ?auto_360158 ) ) ( not ( = ?auto_360150 ?auto_360159 ) ) ( not ( = ?auto_360150 ?auto_360160 ) ) ( not ( = ?auto_360150 ?auto_360161 ) ) ( not ( = ?auto_360150 ?auto_360162 ) ) ( not ( = ?auto_360150 ?auto_360163 ) ) ( not ( = ?auto_360151 ?auto_360152 ) ) ( not ( = ?auto_360151 ?auto_360153 ) ) ( not ( = ?auto_360151 ?auto_360154 ) ) ( not ( = ?auto_360151 ?auto_360155 ) ) ( not ( = ?auto_360151 ?auto_360156 ) ) ( not ( = ?auto_360151 ?auto_360157 ) ) ( not ( = ?auto_360151 ?auto_360158 ) ) ( not ( = ?auto_360151 ?auto_360159 ) ) ( not ( = ?auto_360151 ?auto_360160 ) ) ( not ( = ?auto_360151 ?auto_360161 ) ) ( not ( = ?auto_360151 ?auto_360162 ) ) ( not ( = ?auto_360151 ?auto_360163 ) ) ( not ( = ?auto_360152 ?auto_360153 ) ) ( not ( = ?auto_360152 ?auto_360154 ) ) ( not ( = ?auto_360152 ?auto_360155 ) ) ( not ( = ?auto_360152 ?auto_360156 ) ) ( not ( = ?auto_360152 ?auto_360157 ) ) ( not ( = ?auto_360152 ?auto_360158 ) ) ( not ( = ?auto_360152 ?auto_360159 ) ) ( not ( = ?auto_360152 ?auto_360160 ) ) ( not ( = ?auto_360152 ?auto_360161 ) ) ( not ( = ?auto_360152 ?auto_360162 ) ) ( not ( = ?auto_360152 ?auto_360163 ) ) ( not ( = ?auto_360153 ?auto_360154 ) ) ( not ( = ?auto_360153 ?auto_360155 ) ) ( not ( = ?auto_360153 ?auto_360156 ) ) ( not ( = ?auto_360153 ?auto_360157 ) ) ( not ( = ?auto_360153 ?auto_360158 ) ) ( not ( = ?auto_360153 ?auto_360159 ) ) ( not ( = ?auto_360153 ?auto_360160 ) ) ( not ( = ?auto_360153 ?auto_360161 ) ) ( not ( = ?auto_360153 ?auto_360162 ) ) ( not ( = ?auto_360153 ?auto_360163 ) ) ( not ( = ?auto_360154 ?auto_360155 ) ) ( not ( = ?auto_360154 ?auto_360156 ) ) ( not ( = ?auto_360154 ?auto_360157 ) ) ( not ( = ?auto_360154 ?auto_360158 ) ) ( not ( = ?auto_360154 ?auto_360159 ) ) ( not ( = ?auto_360154 ?auto_360160 ) ) ( not ( = ?auto_360154 ?auto_360161 ) ) ( not ( = ?auto_360154 ?auto_360162 ) ) ( not ( = ?auto_360154 ?auto_360163 ) ) ( not ( = ?auto_360155 ?auto_360156 ) ) ( not ( = ?auto_360155 ?auto_360157 ) ) ( not ( = ?auto_360155 ?auto_360158 ) ) ( not ( = ?auto_360155 ?auto_360159 ) ) ( not ( = ?auto_360155 ?auto_360160 ) ) ( not ( = ?auto_360155 ?auto_360161 ) ) ( not ( = ?auto_360155 ?auto_360162 ) ) ( not ( = ?auto_360155 ?auto_360163 ) ) ( not ( = ?auto_360156 ?auto_360157 ) ) ( not ( = ?auto_360156 ?auto_360158 ) ) ( not ( = ?auto_360156 ?auto_360159 ) ) ( not ( = ?auto_360156 ?auto_360160 ) ) ( not ( = ?auto_360156 ?auto_360161 ) ) ( not ( = ?auto_360156 ?auto_360162 ) ) ( not ( = ?auto_360156 ?auto_360163 ) ) ( not ( = ?auto_360157 ?auto_360158 ) ) ( not ( = ?auto_360157 ?auto_360159 ) ) ( not ( = ?auto_360157 ?auto_360160 ) ) ( not ( = ?auto_360157 ?auto_360161 ) ) ( not ( = ?auto_360157 ?auto_360162 ) ) ( not ( = ?auto_360157 ?auto_360163 ) ) ( not ( = ?auto_360158 ?auto_360159 ) ) ( not ( = ?auto_360158 ?auto_360160 ) ) ( not ( = ?auto_360158 ?auto_360161 ) ) ( not ( = ?auto_360158 ?auto_360162 ) ) ( not ( = ?auto_360158 ?auto_360163 ) ) ( not ( = ?auto_360159 ?auto_360160 ) ) ( not ( = ?auto_360159 ?auto_360161 ) ) ( not ( = ?auto_360159 ?auto_360162 ) ) ( not ( = ?auto_360159 ?auto_360163 ) ) ( not ( = ?auto_360160 ?auto_360161 ) ) ( not ( = ?auto_360160 ?auto_360162 ) ) ( not ( = ?auto_360160 ?auto_360163 ) ) ( not ( = ?auto_360161 ?auto_360162 ) ) ( not ( = ?auto_360161 ?auto_360163 ) ) ( not ( = ?auto_360162 ?auto_360163 ) ) ( ON ?auto_360161 ?auto_360162 ) ( ON ?auto_360160 ?auto_360161 ) ( ON ?auto_360159 ?auto_360160 ) ( ON ?auto_360158 ?auto_360159 ) ( ON ?auto_360157 ?auto_360158 ) ( CLEAR ?auto_360155 ) ( ON ?auto_360156 ?auto_360157 ) ( CLEAR ?auto_360156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_360149 ?auto_360150 ?auto_360151 ?auto_360152 ?auto_360153 ?auto_360154 ?auto_360155 ?auto_360156 )
      ( MAKE-14PILE ?auto_360149 ?auto_360150 ?auto_360151 ?auto_360152 ?auto_360153 ?auto_360154 ?auto_360155 ?auto_360156 ?auto_360157 ?auto_360158 ?auto_360159 ?auto_360160 ?auto_360161 ?auto_360162 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360178 - BLOCK
      ?auto_360179 - BLOCK
      ?auto_360180 - BLOCK
      ?auto_360181 - BLOCK
      ?auto_360182 - BLOCK
      ?auto_360183 - BLOCK
      ?auto_360184 - BLOCK
      ?auto_360185 - BLOCK
      ?auto_360186 - BLOCK
      ?auto_360187 - BLOCK
      ?auto_360188 - BLOCK
      ?auto_360189 - BLOCK
      ?auto_360190 - BLOCK
      ?auto_360191 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360191 ) ( ON-TABLE ?auto_360178 ) ( ON ?auto_360179 ?auto_360178 ) ( ON ?auto_360180 ?auto_360179 ) ( ON ?auto_360181 ?auto_360180 ) ( ON ?auto_360182 ?auto_360181 ) ( ON ?auto_360183 ?auto_360182 ) ( ON ?auto_360184 ?auto_360183 ) ( not ( = ?auto_360178 ?auto_360179 ) ) ( not ( = ?auto_360178 ?auto_360180 ) ) ( not ( = ?auto_360178 ?auto_360181 ) ) ( not ( = ?auto_360178 ?auto_360182 ) ) ( not ( = ?auto_360178 ?auto_360183 ) ) ( not ( = ?auto_360178 ?auto_360184 ) ) ( not ( = ?auto_360178 ?auto_360185 ) ) ( not ( = ?auto_360178 ?auto_360186 ) ) ( not ( = ?auto_360178 ?auto_360187 ) ) ( not ( = ?auto_360178 ?auto_360188 ) ) ( not ( = ?auto_360178 ?auto_360189 ) ) ( not ( = ?auto_360178 ?auto_360190 ) ) ( not ( = ?auto_360178 ?auto_360191 ) ) ( not ( = ?auto_360179 ?auto_360180 ) ) ( not ( = ?auto_360179 ?auto_360181 ) ) ( not ( = ?auto_360179 ?auto_360182 ) ) ( not ( = ?auto_360179 ?auto_360183 ) ) ( not ( = ?auto_360179 ?auto_360184 ) ) ( not ( = ?auto_360179 ?auto_360185 ) ) ( not ( = ?auto_360179 ?auto_360186 ) ) ( not ( = ?auto_360179 ?auto_360187 ) ) ( not ( = ?auto_360179 ?auto_360188 ) ) ( not ( = ?auto_360179 ?auto_360189 ) ) ( not ( = ?auto_360179 ?auto_360190 ) ) ( not ( = ?auto_360179 ?auto_360191 ) ) ( not ( = ?auto_360180 ?auto_360181 ) ) ( not ( = ?auto_360180 ?auto_360182 ) ) ( not ( = ?auto_360180 ?auto_360183 ) ) ( not ( = ?auto_360180 ?auto_360184 ) ) ( not ( = ?auto_360180 ?auto_360185 ) ) ( not ( = ?auto_360180 ?auto_360186 ) ) ( not ( = ?auto_360180 ?auto_360187 ) ) ( not ( = ?auto_360180 ?auto_360188 ) ) ( not ( = ?auto_360180 ?auto_360189 ) ) ( not ( = ?auto_360180 ?auto_360190 ) ) ( not ( = ?auto_360180 ?auto_360191 ) ) ( not ( = ?auto_360181 ?auto_360182 ) ) ( not ( = ?auto_360181 ?auto_360183 ) ) ( not ( = ?auto_360181 ?auto_360184 ) ) ( not ( = ?auto_360181 ?auto_360185 ) ) ( not ( = ?auto_360181 ?auto_360186 ) ) ( not ( = ?auto_360181 ?auto_360187 ) ) ( not ( = ?auto_360181 ?auto_360188 ) ) ( not ( = ?auto_360181 ?auto_360189 ) ) ( not ( = ?auto_360181 ?auto_360190 ) ) ( not ( = ?auto_360181 ?auto_360191 ) ) ( not ( = ?auto_360182 ?auto_360183 ) ) ( not ( = ?auto_360182 ?auto_360184 ) ) ( not ( = ?auto_360182 ?auto_360185 ) ) ( not ( = ?auto_360182 ?auto_360186 ) ) ( not ( = ?auto_360182 ?auto_360187 ) ) ( not ( = ?auto_360182 ?auto_360188 ) ) ( not ( = ?auto_360182 ?auto_360189 ) ) ( not ( = ?auto_360182 ?auto_360190 ) ) ( not ( = ?auto_360182 ?auto_360191 ) ) ( not ( = ?auto_360183 ?auto_360184 ) ) ( not ( = ?auto_360183 ?auto_360185 ) ) ( not ( = ?auto_360183 ?auto_360186 ) ) ( not ( = ?auto_360183 ?auto_360187 ) ) ( not ( = ?auto_360183 ?auto_360188 ) ) ( not ( = ?auto_360183 ?auto_360189 ) ) ( not ( = ?auto_360183 ?auto_360190 ) ) ( not ( = ?auto_360183 ?auto_360191 ) ) ( not ( = ?auto_360184 ?auto_360185 ) ) ( not ( = ?auto_360184 ?auto_360186 ) ) ( not ( = ?auto_360184 ?auto_360187 ) ) ( not ( = ?auto_360184 ?auto_360188 ) ) ( not ( = ?auto_360184 ?auto_360189 ) ) ( not ( = ?auto_360184 ?auto_360190 ) ) ( not ( = ?auto_360184 ?auto_360191 ) ) ( not ( = ?auto_360185 ?auto_360186 ) ) ( not ( = ?auto_360185 ?auto_360187 ) ) ( not ( = ?auto_360185 ?auto_360188 ) ) ( not ( = ?auto_360185 ?auto_360189 ) ) ( not ( = ?auto_360185 ?auto_360190 ) ) ( not ( = ?auto_360185 ?auto_360191 ) ) ( not ( = ?auto_360186 ?auto_360187 ) ) ( not ( = ?auto_360186 ?auto_360188 ) ) ( not ( = ?auto_360186 ?auto_360189 ) ) ( not ( = ?auto_360186 ?auto_360190 ) ) ( not ( = ?auto_360186 ?auto_360191 ) ) ( not ( = ?auto_360187 ?auto_360188 ) ) ( not ( = ?auto_360187 ?auto_360189 ) ) ( not ( = ?auto_360187 ?auto_360190 ) ) ( not ( = ?auto_360187 ?auto_360191 ) ) ( not ( = ?auto_360188 ?auto_360189 ) ) ( not ( = ?auto_360188 ?auto_360190 ) ) ( not ( = ?auto_360188 ?auto_360191 ) ) ( not ( = ?auto_360189 ?auto_360190 ) ) ( not ( = ?auto_360189 ?auto_360191 ) ) ( not ( = ?auto_360190 ?auto_360191 ) ) ( ON ?auto_360190 ?auto_360191 ) ( ON ?auto_360189 ?auto_360190 ) ( ON ?auto_360188 ?auto_360189 ) ( ON ?auto_360187 ?auto_360188 ) ( ON ?auto_360186 ?auto_360187 ) ( CLEAR ?auto_360184 ) ( ON ?auto_360185 ?auto_360186 ) ( CLEAR ?auto_360185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_360178 ?auto_360179 ?auto_360180 ?auto_360181 ?auto_360182 ?auto_360183 ?auto_360184 ?auto_360185 )
      ( MAKE-14PILE ?auto_360178 ?auto_360179 ?auto_360180 ?auto_360181 ?auto_360182 ?auto_360183 ?auto_360184 ?auto_360185 ?auto_360186 ?auto_360187 ?auto_360188 ?auto_360189 ?auto_360190 ?auto_360191 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360206 - BLOCK
      ?auto_360207 - BLOCK
      ?auto_360208 - BLOCK
      ?auto_360209 - BLOCK
      ?auto_360210 - BLOCK
      ?auto_360211 - BLOCK
      ?auto_360212 - BLOCK
      ?auto_360213 - BLOCK
      ?auto_360214 - BLOCK
      ?auto_360215 - BLOCK
      ?auto_360216 - BLOCK
      ?auto_360217 - BLOCK
      ?auto_360218 - BLOCK
      ?auto_360219 - BLOCK
    )
    :vars
    (
      ?auto_360220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360219 ?auto_360220 ) ( ON-TABLE ?auto_360206 ) ( ON ?auto_360207 ?auto_360206 ) ( ON ?auto_360208 ?auto_360207 ) ( ON ?auto_360209 ?auto_360208 ) ( ON ?auto_360210 ?auto_360209 ) ( ON ?auto_360211 ?auto_360210 ) ( not ( = ?auto_360206 ?auto_360207 ) ) ( not ( = ?auto_360206 ?auto_360208 ) ) ( not ( = ?auto_360206 ?auto_360209 ) ) ( not ( = ?auto_360206 ?auto_360210 ) ) ( not ( = ?auto_360206 ?auto_360211 ) ) ( not ( = ?auto_360206 ?auto_360212 ) ) ( not ( = ?auto_360206 ?auto_360213 ) ) ( not ( = ?auto_360206 ?auto_360214 ) ) ( not ( = ?auto_360206 ?auto_360215 ) ) ( not ( = ?auto_360206 ?auto_360216 ) ) ( not ( = ?auto_360206 ?auto_360217 ) ) ( not ( = ?auto_360206 ?auto_360218 ) ) ( not ( = ?auto_360206 ?auto_360219 ) ) ( not ( = ?auto_360206 ?auto_360220 ) ) ( not ( = ?auto_360207 ?auto_360208 ) ) ( not ( = ?auto_360207 ?auto_360209 ) ) ( not ( = ?auto_360207 ?auto_360210 ) ) ( not ( = ?auto_360207 ?auto_360211 ) ) ( not ( = ?auto_360207 ?auto_360212 ) ) ( not ( = ?auto_360207 ?auto_360213 ) ) ( not ( = ?auto_360207 ?auto_360214 ) ) ( not ( = ?auto_360207 ?auto_360215 ) ) ( not ( = ?auto_360207 ?auto_360216 ) ) ( not ( = ?auto_360207 ?auto_360217 ) ) ( not ( = ?auto_360207 ?auto_360218 ) ) ( not ( = ?auto_360207 ?auto_360219 ) ) ( not ( = ?auto_360207 ?auto_360220 ) ) ( not ( = ?auto_360208 ?auto_360209 ) ) ( not ( = ?auto_360208 ?auto_360210 ) ) ( not ( = ?auto_360208 ?auto_360211 ) ) ( not ( = ?auto_360208 ?auto_360212 ) ) ( not ( = ?auto_360208 ?auto_360213 ) ) ( not ( = ?auto_360208 ?auto_360214 ) ) ( not ( = ?auto_360208 ?auto_360215 ) ) ( not ( = ?auto_360208 ?auto_360216 ) ) ( not ( = ?auto_360208 ?auto_360217 ) ) ( not ( = ?auto_360208 ?auto_360218 ) ) ( not ( = ?auto_360208 ?auto_360219 ) ) ( not ( = ?auto_360208 ?auto_360220 ) ) ( not ( = ?auto_360209 ?auto_360210 ) ) ( not ( = ?auto_360209 ?auto_360211 ) ) ( not ( = ?auto_360209 ?auto_360212 ) ) ( not ( = ?auto_360209 ?auto_360213 ) ) ( not ( = ?auto_360209 ?auto_360214 ) ) ( not ( = ?auto_360209 ?auto_360215 ) ) ( not ( = ?auto_360209 ?auto_360216 ) ) ( not ( = ?auto_360209 ?auto_360217 ) ) ( not ( = ?auto_360209 ?auto_360218 ) ) ( not ( = ?auto_360209 ?auto_360219 ) ) ( not ( = ?auto_360209 ?auto_360220 ) ) ( not ( = ?auto_360210 ?auto_360211 ) ) ( not ( = ?auto_360210 ?auto_360212 ) ) ( not ( = ?auto_360210 ?auto_360213 ) ) ( not ( = ?auto_360210 ?auto_360214 ) ) ( not ( = ?auto_360210 ?auto_360215 ) ) ( not ( = ?auto_360210 ?auto_360216 ) ) ( not ( = ?auto_360210 ?auto_360217 ) ) ( not ( = ?auto_360210 ?auto_360218 ) ) ( not ( = ?auto_360210 ?auto_360219 ) ) ( not ( = ?auto_360210 ?auto_360220 ) ) ( not ( = ?auto_360211 ?auto_360212 ) ) ( not ( = ?auto_360211 ?auto_360213 ) ) ( not ( = ?auto_360211 ?auto_360214 ) ) ( not ( = ?auto_360211 ?auto_360215 ) ) ( not ( = ?auto_360211 ?auto_360216 ) ) ( not ( = ?auto_360211 ?auto_360217 ) ) ( not ( = ?auto_360211 ?auto_360218 ) ) ( not ( = ?auto_360211 ?auto_360219 ) ) ( not ( = ?auto_360211 ?auto_360220 ) ) ( not ( = ?auto_360212 ?auto_360213 ) ) ( not ( = ?auto_360212 ?auto_360214 ) ) ( not ( = ?auto_360212 ?auto_360215 ) ) ( not ( = ?auto_360212 ?auto_360216 ) ) ( not ( = ?auto_360212 ?auto_360217 ) ) ( not ( = ?auto_360212 ?auto_360218 ) ) ( not ( = ?auto_360212 ?auto_360219 ) ) ( not ( = ?auto_360212 ?auto_360220 ) ) ( not ( = ?auto_360213 ?auto_360214 ) ) ( not ( = ?auto_360213 ?auto_360215 ) ) ( not ( = ?auto_360213 ?auto_360216 ) ) ( not ( = ?auto_360213 ?auto_360217 ) ) ( not ( = ?auto_360213 ?auto_360218 ) ) ( not ( = ?auto_360213 ?auto_360219 ) ) ( not ( = ?auto_360213 ?auto_360220 ) ) ( not ( = ?auto_360214 ?auto_360215 ) ) ( not ( = ?auto_360214 ?auto_360216 ) ) ( not ( = ?auto_360214 ?auto_360217 ) ) ( not ( = ?auto_360214 ?auto_360218 ) ) ( not ( = ?auto_360214 ?auto_360219 ) ) ( not ( = ?auto_360214 ?auto_360220 ) ) ( not ( = ?auto_360215 ?auto_360216 ) ) ( not ( = ?auto_360215 ?auto_360217 ) ) ( not ( = ?auto_360215 ?auto_360218 ) ) ( not ( = ?auto_360215 ?auto_360219 ) ) ( not ( = ?auto_360215 ?auto_360220 ) ) ( not ( = ?auto_360216 ?auto_360217 ) ) ( not ( = ?auto_360216 ?auto_360218 ) ) ( not ( = ?auto_360216 ?auto_360219 ) ) ( not ( = ?auto_360216 ?auto_360220 ) ) ( not ( = ?auto_360217 ?auto_360218 ) ) ( not ( = ?auto_360217 ?auto_360219 ) ) ( not ( = ?auto_360217 ?auto_360220 ) ) ( not ( = ?auto_360218 ?auto_360219 ) ) ( not ( = ?auto_360218 ?auto_360220 ) ) ( not ( = ?auto_360219 ?auto_360220 ) ) ( ON ?auto_360218 ?auto_360219 ) ( ON ?auto_360217 ?auto_360218 ) ( ON ?auto_360216 ?auto_360217 ) ( ON ?auto_360215 ?auto_360216 ) ( ON ?auto_360214 ?auto_360215 ) ( ON ?auto_360213 ?auto_360214 ) ( CLEAR ?auto_360211 ) ( ON ?auto_360212 ?auto_360213 ) ( CLEAR ?auto_360212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_360206 ?auto_360207 ?auto_360208 ?auto_360209 ?auto_360210 ?auto_360211 ?auto_360212 )
      ( MAKE-14PILE ?auto_360206 ?auto_360207 ?auto_360208 ?auto_360209 ?auto_360210 ?auto_360211 ?auto_360212 ?auto_360213 ?auto_360214 ?auto_360215 ?auto_360216 ?auto_360217 ?auto_360218 ?auto_360219 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360235 - BLOCK
      ?auto_360236 - BLOCK
      ?auto_360237 - BLOCK
      ?auto_360238 - BLOCK
      ?auto_360239 - BLOCK
      ?auto_360240 - BLOCK
      ?auto_360241 - BLOCK
      ?auto_360242 - BLOCK
      ?auto_360243 - BLOCK
      ?auto_360244 - BLOCK
      ?auto_360245 - BLOCK
      ?auto_360246 - BLOCK
      ?auto_360247 - BLOCK
      ?auto_360248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360248 ) ( ON-TABLE ?auto_360235 ) ( ON ?auto_360236 ?auto_360235 ) ( ON ?auto_360237 ?auto_360236 ) ( ON ?auto_360238 ?auto_360237 ) ( ON ?auto_360239 ?auto_360238 ) ( ON ?auto_360240 ?auto_360239 ) ( not ( = ?auto_360235 ?auto_360236 ) ) ( not ( = ?auto_360235 ?auto_360237 ) ) ( not ( = ?auto_360235 ?auto_360238 ) ) ( not ( = ?auto_360235 ?auto_360239 ) ) ( not ( = ?auto_360235 ?auto_360240 ) ) ( not ( = ?auto_360235 ?auto_360241 ) ) ( not ( = ?auto_360235 ?auto_360242 ) ) ( not ( = ?auto_360235 ?auto_360243 ) ) ( not ( = ?auto_360235 ?auto_360244 ) ) ( not ( = ?auto_360235 ?auto_360245 ) ) ( not ( = ?auto_360235 ?auto_360246 ) ) ( not ( = ?auto_360235 ?auto_360247 ) ) ( not ( = ?auto_360235 ?auto_360248 ) ) ( not ( = ?auto_360236 ?auto_360237 ) ) ( not ( = ?auto_360236 ?auto_360238 ) ) ( not ( = ?auto_360236 ?auto_360239 ) ) ( not ( = ?auto_360236 ?auto_360240 ) ) ( not ( = ?auto_360236 ?auto_360241 ) ) ( not ( = ?auto_360236 ?auto_360242 ) ) ( not ( = ?auto_360236 ?auto_360243 ) ) ( not ( = ?auto_360236 ?auto_360244 ) ) ( not ( = ?auto_360236 ?auto_360245 ) ) ( not ( = ?auto_360236 ?auto_360246 ) ) ( not ( = ?auto_360236 ?auto_360247 ) ) ( not ( = ?auto_360236 ?auto_360248 ) ) ( not ( = ?auto_360237 ?auto_360238 ) ) ( not ( = ?auto_360237 ?auto_360239 ) ) ( not ( = ?auto_360237 ?auto_360240 ) ) ( not ( = ?auto_360237 ?auto_360241 ) ) ( not ( = ?auto_360237 ?auto_360242 ) ) ( not ( = ?auto_360237 ?auto_360243 ) ) ( not ( = ?auto_360237 ?auto_360244 ) ) ( not ( = ?auto_360237 ?auto_360245 ) ) ( not ( = ?auto_360237 ?auto_360246 ) ) ( not ( = ?auto_360237 ?auto_360247 ) ) ( not ( = ?auto_360237 ?auto_360248 ) ) ( not ( = ?auto_360238 ?auto_360239 ) ) ( not ( = ?auto_360238 ?auto_360240 ) ) ( not ( = ?auto_360238 ?auto_360241 ) ) ( not ( = ?auto_360238 ?auto_360242 ) ) ( not ( = ?auto_360238 ?auto_360243 ) ) ( not ( = ?auto_360238 ?auto_360244 ) ) ( not ( = ?auto_360238 ?auto_360245 ) ) ( not ( = ?auto_360238 ?auto_360246 ) ) ( not ( = ?auto_360238 ?auto_360247 ) ) ( not ( = ?auto_360238 ?auto_360248 ) ) ( not ( = ?auto_360239 ?auto_360240 ) ) ( not ( = ?auto_360239 ?auto_360241 ) ) ( not ( = ?auto_360239 ?auto_360242 ) ) ( not ( = ?auto_360239 ?auto_360243 ) ) ( not ( = ?auto_360239 ?auto_360244 ) ) ( not ( = ?auto_360239 ?auto_360245 ) ) ( not ( = ?auto_360239 ?auto_360246 ) ) ( not ( = ?auto_360239 ?auto_360247 ) ) ( not ( = ?auto_360239 ?auto_360248 ) ) ( not ( = ?auto_360240 ?auto_360241 ) ) ( not ( = ?auto_360240 ?auto_360242 ) ) ( not ( = ?auto_360240 ?auto_360243 ) ) ( not ( = ?auto_360240 ?auto_360244 ) ) ( not ( = ?auto_360240 ?auto_360245 ) ) ( not ( = ?auto_360240 ?auto_360246 ) ) ( not ( = ?auto_360240 ?auto_360247 ) ) ( not ( = ?auto_360240 ?auto_360248 ) ) ( not ( = ?auto_360241 ?auto_360242 ) ) ( not ( = ?auto_360241 ?auto_360243 ) ) ( not ( = ?auto_360241 ?auto_360244 ) ) ( not ( = ?auto_360241 ?auto_360245 ) ) ( not ( = ?auto_360241 ?auto_360246 ) ) ( not ( = ?auto_360241 ?auto_360247 ) ) ( not ( = ?auto_360241 ?auto_360248 ) ) ( not ( = ?auto_360242 ?auto_360243 ) ) ( not ( = ?auto_360242 ?auto_360244 ) ) ( not ( = ?auto_360242 ?auto_360245 ) ) ( not ( = ?auto_360242 ?auto_360246 ) ) ( not ( = ?auto_360242 ?auto_360247 ) ) ( not ( = ?auto_360242 ?auto_360248 ) ) ( not ( = ?auto_360243 ?auto_360244 ) ) ( not ( = ?auto_360243 ?auto_360245 ) ) ( not ( = ?auto_360243 ?auto_360246 ) ) ( not ( = ?auto_360243 ?auto_360247 ) ) ( not ( = ?auto_360243 ?auto_360248 ) ) ( not ( = ?auto_360244 ?auto_360245 ) ) ( not ( = ?auto_360244 ?auto_360246 ) ) ( not ( = ?auto_360244 ?auto_360247 ) ) ( not ( = ?auto_360244 ?auto_360248 ) ) ( not ( = ?auto_360245 ?auto_360246 ) ) ( not ( = ?auto_360245 ?auto_360247 ) ) ( not ( = ?auto_360245 ?auto_360248 ) ) ( not ( = ?auto_360246 ?auto_360247 ) ) ( not ( = ?auto_360246 ?auto_360248 ) ) ( not ( = ?auto_360247 ?auto_360248 ) ) ( ON ?auto_360247 ?auto_360248 ) ( ON ?auto_360246 ?auto_360247 ) ( ON ?auto_360245 ?auto_360246 ) ( ON ?auto_360244 ?auto_360245 ) ( ON ?auto_360243 ?auto_360244 ) ( ON ?auto_360242 ?auto_360243 ) ( CLEAR ?auto_360240 ) ( ON ?auto_360241 ?auto_360242 ) ( CLEAR ?auto_360241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_360235 ?auto_360236 ?auto_360237 ?auto_360238 ?auto_360239 ?auto_360240 ?auto_360241 )
      ( MAKE-14PILE ?auto_360235 ?auto_360236 ?auto_360237 ?auto_360238 ?auto_360239 ?auto_360240 ?auto_360241 ?auto_360242 ?auto_360243 ?auto_360244 ?auto_360245 ?auto_360246 ?auto_360247 ?auto_360248 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360263 - BLOCK
      ?auto_360264 - BLOCK
      ?auto_360265 - BLOCK
      ?auto_360266 - BLOCK
      ?auto_360267 - BLOCK
      ?auto_360268 - BLOCK
      ?auto_360269 - BLOCK
      ?auto_360270 - BLOCK
      ?auto_360271 - BLOCK
      ?auto_360272 - BLOCK
      ?auto_360273 - BLOCK
      ?auto_360274 - BLOCK
      ?auto_360275 - BLOCK
      ?auto_360276 - BLOCK
    )
    :vars
    (
      ?auto_360277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360276 ?auto_360277 ) ( ON-TABLE ?auto_360263 ) ( ON ?auto_360264 ?auto_360263 ) ( ON ?auto_360265 ?auto_360264 ) ( ON ?auto_360266 ?auto_360265 ) ( ON ?auto_360267 ?auto_360266 ) ( not ( = ?auto_360263 ?auto_360264 ) ) ( not ( = ?auto_360263 ?auto_360265 ) ) ( not ( = ?auto_360263 ?auto_360266 ) ) ( not ( = ?auto_360263 ?auto_360267 ) ) ( not ( = ?auto_360263 ?auto_360268 ) ) ( not ( = ?auto_360263 ?auto_360269 ) ) ( not ( = ?auto_360263 ?auto_360270 ) ) ( not ( = ?auto_360263 ?auto_360271 ) ) ( not ( = ?auto_360263 ?auto_360272 ) ) ( not ( = ?auto_360263 ?auto_360273 ) ) ( not ( = ?auto_360263 ?auto_360274 ) ) ( not ( = ?auto_360263 ?auto_360275 ) ) ( not ( = ?auto_360263 ?auto_360276 ) ) ( not ( = ?auto_360263 ?auto_360277 ) ) ( not ( = ?auto_360264 ?auto_360265 ) ) ( not ( = ?auto_360264 ?auto_360266 ) ) ( not ( = ?auto_360264 ?auto_360267 ) ) ( not ( = ?auto_360264 ?auto_360268 ) ) ( not ( = ?auto_360264 ?auto_360269 ) ) ( not ( = ?auto_360264 ?auto_360270 ) ) ( not ( = ?auto_360264 ?auto_360271 ) ) ( not ( = ?auto_360264 ?auto_360272 ) ) ( not ( = ?auto_360264 ?auto_360273 ) ) ( not ( = ?auto_360264 ?auto_360274 ) ) ( not ( = ?auto_360264 ?auto_360275 ) ) ( not ( = ?auto_360264 ?auto_360276 ) ) ( not ( = ?auto_360264 ?auto_360277 ) ) ( not ( = ?auto_360265 ?auto_360266 ) ) ( not ( = ?auto_360265 ?auto_360267 ) ) ( not ( = ?auto_360265 ?auto_360268 ) ) ( not ( = ?auto_360265 ?auto_360269 ) ) ( not ( = ?auto_360265 ?auto_360270 ) ) ( not ( = ?auto_360265 ?auto_360271 ) ) ( not ( = ?auto_360265 ?auto_360272 ) ) ( not ( = ?auto_360265 ?auto_360273 ) ) ( not ( = ?auto_360265 ?auto_360274 ) ) ( not ( = ?auto_360265 ?auto_360275 ) ) ( not ( = ?auto_360265 ?auto_360276 ) ) ( not ( = ?auto_360265 ?auto_360277 ) ) ( not ( = ?auto_360266 ?auto_360267 ) ) ( not ( = ?auto_360266 ?auto_360268 ) ) ( not ( = ?auto_360266 ?auto_360269 ) ) ( not ( = ?auto_360266 ?auto_360270 ) ) ( not ( = ?auto_360266 ?auto_360271 ) ) ( not ( = ?auto_360266 ?auto_360272 ) ) ( not ( = ?auto_360266 ?auto_360273 ) ) ( not ( = ?auto_360266 ?auto_360274 ) ) ( not ( = ?auto_360266 ?auto_360275 ) ) ( not ( = ?auto_360266 ?auto_360276 ) ) ( not ( = ?auto_360266 ?auto_360277 ) ) ( not ( = ?auto_360267 ?auto_360268 ) ) ( not ( = ?auto_360267 ?auto_360269 ) ) ( not ( = ?auto_360267 ?auto_360270 ) ) ( not ( = ?auto_360267 ?auto_360271 ) ) ( not ( = ?auto_360267 ?auto_360272 ) ) ( not ( = ?auto_360267 ?auto_360273 ) ) ( not ( = ?auto_360267 ?auto_360274 ) ) ( not ( = ?auto_360267 ?auto_360275 ) ) ( not ( = ?auto_360267 ?auto_360276 ) ) ( not ( = ?auto_360267 ?auto_360277 ) ) ( not ( = ?auto_360268 ?auto_360269 ) ) ( not ( = ?auto_360268 ?auto_360270 ) ) ( not ( = ?auto_360268 ?auto_360271 ) ) ( not ( = ?auto_360268 ?auto_360272 ) ) ( not ( = ?auto_360268 ?auto_360273 ) ) ( not ( = ?auto_360268 ?auto_360274 ) ) ( not ( = ?auto_360268 ?auto_360275 ) ) ( not ( = ?auto_360268 ?auto_360276 ) ) ( not ( = ?auto_360268 ?auto_360277 ) ) ( not ( = ?auto_360269 ?auto_360270 ) ) ( not ( = ?auto_360269 ?auto_360271 ) ) ( not ( = ?auto_360269 ?auto_360272 ) ) ( not ( = ?auto_360269 ?auto_360273 ) ) ( not ( = ?auto_360269 ?auto_360274 ) ) ( not ( = ?auto_360269 ?auto_360275 ) ) ( not ( = ?auto_360269 ?auto_360276 ) ) ( not ( = ?auto_360269 ?auto_360277 ) ) ( not ( = ?auto_360270 ?auto_360271 ) ) ( not ( = ?auto_360270 ?auto_360272 ) ) ( not ( = ?auto_360270 ?auto_360273 ) ) ( not ( = ?auto_360270 ?auto_360274 ) ) ( not ( = ?auto_360270 ?auto_360275 ) ) ( not ( = ?auto_360270 ?auto_360276 ) ) ( not ( = ?auto_360270 ?auto_360277 ) ) ( not ( = ?auto_360271 ?auto_360272 ) ) ( not ( = ?auto_360271 ?auto_360273 ) ) ( not ( = ?auto_360271 ?auto_360274 ) ) ( not ( = ?auto_360271 ?auto_360275 ) ) ( not ( = ?auto_360271 ?auto_360276 ) ) ( not ( = ?auto_360271 ?auto_360277 ) ) ( not ( = ?auto_360272 ?auto_360273 ) ) ( not ( = ?auto_360272 ?auto_360274 ) ) ( not ( = ?auto_360272 ?auto_360275 ) ) ( not ( = ?auto_360272 ?auto_360276 ) ) ( not ( = ?auto_360272 ?auto_360277 ) ) ( not ( = ?auto_360273 ?auto_360274 ) ) ( not ( = ?auto_360273 ?auto_360275 ) ) ( not ( = ?auto_360273 ?auto_360276 ) ) ( not ( = ?auto_360273 ?auto_360277 ) ) ( not ( = ?auto_360274 ?auto_360275 ) ) ( not ( = ?auto_360274 ?auto_360276 ) ) ( not ( = ?auto_360274 ?auto_360277 ) ) ( not ( = ?auto_360275 ?auto_360276 ) ) ( not ( = ?auto_360275 ?auto_360277 ) ) ( not ( = ?auto_360276 ?auto_360277 ) ) ( ON ?auto_360275 ?auto_360276 ) ( ON ?auto_360274 ?auto_360275 ) ( ON ?auto_360273 ?auto_360274 ) ( ON ?auto_360272 ?auto_360273 ) ( ON ?auto_360271 ?auto_360272 ) ( ON ?auto_360270 ?auto_360271 ) ( ON ?auto_360269 ?auto_360270 ) ( CLEAR ?auto_360267 ) ( ON ?auto_360268 ?auto_360269 ) ( CLEAR ?auto_360268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_360263 ?auto_360264 ?auto_360265 ?auto_360266 ?auto_360267 ?auto_360268 )
      ( MAKE-14PILE ?auto_360263 ?auto_360264 ?auto_360265 ?auto_360266 ?auto_360267 ?auto_360268 ?auto_360269 ?auto_360270 ?auto_360271 ?auto_360272 ?auto_360273 ?auto_360274 ?auto_360275 ?auto_360276 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360292 - BLOCK
      ?auto_360293 - BLOCK
      ?auto_360294 - BLOCK
      ?auto_360295 - BLOCK
      ?auto_360296 - BLOCK
      ?auto_360297 - BLOCK
      ?auto_360298 - BLOCK
      ?auto_360299 - BLOCK
      ?auto_360300 - BLOCK
      ?auto_360301 - BLOCK
      ?auto_360302 - BLOCK
      ?auto_360303 - BLOCK
      ?auto_360304 - BLOCK
      ?auto_360305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360305 ) ( ON-TABLE ?auto_360292 ) ( ON ?auto_360293 ?auto_360292 ) ( ON ?auto_360294 ?auto_360293 ) ( ON ?auto_360295 ?auto_360294 ) ( ON ?auto_360296 ?auto_360295 ) ( not ( = ?auto_360292 ?auto_360293 ) ) ( not ( = ?auto_360292 ?auto_360294 ) ) ( not ( = ?auto_360292 ?auto_360295 ) ) ( not ( = ?auto_360292 ?auto_360296 ) ) ( not ( = ?auto_360292 ?auto_360297 ) ) ( not ( = ?auto_360292 ?auto_360298 ) ) ( not ( = ?auto_360292 ?auto_360299 ) ) ( not ( = ?auto_360292 ?auto_360300 ) ) ( not ( = ?auto_360292 ?auto_360301 ) ) ( not ( = ?auto_360292 ?auto_360302 ) ) ( not ( = ?auto_360292 ?auto_360303 ) ) ( not ( = ?auto_360292 ?auto_360304 ) ) ( not ( = ?auto_360292 ?auto_360305 ) ) ( not ( = ?auto_360293 ?auto_360294 ) ) ( not ( = ?auto_360293 ?auto_360295 ) ) ( not ( = ?auto_360293 ?auto_360296 ) ) ( not ( = ?auto_360293 ?auto_360297 ) ) ( not ( = ?auto_360293 ?auto_360298 ) ) ( not ( = ?auto_360293 ?auto_360299 ) ) ( not ( = ?auto_360293 ?auto_360300 ) ) ( not ( = ?auto_360293 ?auto_360301 ) ) ( not ( = ?auto_360293 ?auto_360302 ) ) ( not ( = ?auto_360293 ?auto_360303 ) ) ( not ( = ?auto_360293 ?auto_360304 ) ) ( not ( = ?auto_360293 ?auto_360305 ) ) ( not ( = ?auto_360294 ?auto_360295 ) ) ( not ( = ?auto_360294 ?auto_360296 ) ) ( not ( = ?auto_360294 ?auto_360297 ) ) ( not ( = ?auto_360294 ?auto_360298 ) ) ( not ( = ?auto_360294 ?auto_360299 ) ) ( not ( = ?auto_360294 ?auto_360300 ) ) ( not ( = ?auto_360294 ?auto_360301 ) ) ( not ( = ?auto_360294 ?auto_360302 ) ) ( not ( = ?auto_360294 ?auto_360303 ) ) ( not ( = ?auto_360294 ?auto_360304 ) ) ( not ( = ?auto_360294 ?auto_360305 ) ) ( not ( = ?auto_360295 ?auto_360296 ) ) ( not ( = ?auto_360295 ?auto_360297 ) ) ( not ( = ?auto_360295 ?auto_360298 ) ) ( not ( = ?auto_360295 ?auto_360299 ) ) ( not ( = ?auto_360295 ?auto_360300 ) ) ( not ( = ?auto_360295 ?auto_360301 ) ) ( not ( = ?auto_360295 ?auto_360302 ) ) ( not ( = ?auto_360295 ?auto_360303 ) ) ( not ( = ?auto_360295 ?auto_360304 ) ) ( not ( = ?auto_360295 ?auto_360305 ) ) ( not ( = ?auto_360296 ?auto_360297 ) ) ( not ( = ?auto_360296 ?auto_360298 ) ) ( not ( = ?auto_360296 ?auto_360299 ) ) ( not ( = ?auto_360296 ?auto_360300 ) ) ( not ( = ?auto_360296 ?auto_360301 ) ) ( not ( = ?auto_360296 ?auto_360302 ) ) ( not ( = ?auto_360296 ?auto_360303 ) ) ( not ( = ?auto_360296 ?auto_360304 ) ) ( not ( = ?auto_360296 ?auto_360305 ) ) ( not ( = ?auto_360297 ?auto_360298 ) ) ( not ( = ?auto_360297 ?auto_360299 ) ) ( not ( = ?auto_360297 ?auto_360300 ) ) ( not ( = ?auto_360297 ?auto_360301 ) ) ( not ( = ?auto_360297 ?auto_360302 ) ) ( not ( = ?auto_360297 ?auto_360303 ) ) ( not ( = ?auto_360297 ?auto_360304 ) ) ( not ( = ?auto_360297 ?auto_360305 ) ) ( not ( = ?auto_360298 ?auto_360299 ) ) ( not ( = ?auto_360298 ?auto_360300 ) ) ( not ( = ?auto_360298 ?auto_360301 ) ) ( not ( = ?auto_360298 ?auto_360302 ) ) ( not ( = ?auto_360298 ?auto_360303 ) ) ( not ( = ?auto_360298 ?auto_360304 ) ) ( not ( = ?auto_360298 ?auto_360305 ) ) ( not ( = ?auto_360299 ?auto_360300 ) ) ( not ( = ?auto_360299 ?auto_360301 ) ) ( not ( = ?auto_360299 ?auto_360302 ) ) ( not ( = ?auto_360299 ?auto_360303 ) ) ( not ( = ?auto_360299 ?auto_360304 ) ) ( not ( = ?auto_360299 ?auto_360305 ) ) ( not ( = ?auto_360300 ?auto_360301 ) ) ( not ( = ?auto_360300 ?auto_360302 ) ) ( not ( = ?auto_360300 ?auto_360303 ) ) ( not ( = ?auto_360300 ?auto_360304 ) ) ( not ( = ?auto_360300 ?auto_360305 ) ) ( not ( = ?auto_360301 ?auto_360302 ) ) ( not ( = ?auto_360301 ?auto_360303 ) ) ( not ( = ?auto_360301 ?auto_360304 ) ) ( not ( = ?auto_360301 ?auto_360305 ) ) ( not ( = ?auto_360302 ?auto_360303 ) ) ( not ( = ?auto_360302 ?auto_360304 ) ) ( not ( = ?auto_360302 ?auto_360305 ) ) ( not ( = ?auto_360303 ?auto_360304 ) ) ( not ( = ?auto_360303 ?auto_360305 ) ) ( not ( = ?auto_360304 ?auto_360305 ) ) ( ON ?auto_360304 ?auto_360305 ) ( ON ?auto_360303 ?auto_360304 ) ( ON ?auto_360302 ?auto_360303 ) ( ON ?auto_360301 ?auto_360302 ) ( ON ?auto_360300 ?auto_360301 ) ( ON ?auto_360299 ?auto_360300 ) ( ON ?auto_360298 ?auto_360299 ) ( CLEAR ?auto_360296 ) ( ON ?auto_360297 ?auto_360298 ) ( CLEAR ?auto_360297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_360292 ?auto_360293 ?auto_360294 ?auto_360295 ?auto_360296 ?auto_360297 )
      ( MAKE-14PILE ?auto_360292 ?auto_360293 ?auto_360294 ?auto_360295 ?auto_360296 ?auto_360297 ?auto_360298 ?auto_360299 ?auto_360300 ?auto_360301 ?auto_360302 ?auto_360303 ?auto_360304 ?auto_360305 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360320 - BLOCK
      ?auto_360321 - BLOCK
      ?auto_360322 - BLOCK
      ?auto_360323 - BLOCK
      ?auto_360324 - BLOCK
      ?auto_360325 - BLOCK
      ?auto_360326 - BLOCK
      ?auto_360327 - BLOCK
      ?auto_360328 - BLOCK
      ?auto_360329 - BLOCK
      ?auto_360330 - BLOCK
      ?auto_360331 - BLOCK
      ?auto_360332 - BLOCK
      ?auto_360333 - BLOCK
    )
    :vars
    (
      ?auto_360334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360333 ?auto_360334 ) ( ON-TABLE ?auto_360320 ) ( ON ?auto_360321 ?auto_360320 ) ( ON ?auto_360322 ?auto_360321 ) ( ON ?auto_360323 ?auto_360322 ) ( not ( = ?auto_360320 ?auto_360321 ) ) ( not ( = ?auto_360320 ?auto_360322 ) ) ( not ( = ?auto_360320 ?auto_360323 ) ) ( not ( = ?auto_360320 ?auto_360324 ) ) ( not ( = ?auto_360320 ?auto_360325 ) ) ( not ( = ?auto_360320 ?auto_360326 ) ) ( not ( = ?auto_360320 ?auto_360327 ) ) ( not ( = ?auto_360320 ?auto_360328 ) ) ( not ( = ?auto_360320 ?auto_360329 ) ) ( not ( = ?auto_360320 ?auto_360330 ) ) ( not ( = ?auto_360320 ?auto_360331 ) ) ( not ( = ?auto_360320 ?auto_360332 ) ) ( not ( = ?auto_360320 ?auto_360333 ) ) ( not ( = ?auto_360320 ?auto_360334 ) ) ( not ( = ?auto_360321 ?auto_360322 ) ) ( not ( = ?auto_360321 ?auto_360323 ) ) ( not ( = ?auto_360321 ?auto_360324 ) ) ( not ( = ?auto_360321 ?auto_360325 ) ) ( not ( = ?auto_360321 ?auto_360326 ) ) ( not ( = ?auto_360321 ?auto_360327 ) ) ( not ( = ?auto_360321 ?auto_360328 ) ) ( not ( = ?auto_360321 ?auto_360329 ) ) ( not ( = ?auto_360321 ?auto_360330 ) ) ( not ( = ?auto_360321 ?auto_360331 ) ) ( not ( = ?auto_360321 ?auto_360332 ) ) ( not ( = ?auto_360321 ?auto_360333 ) ) ( not ( = ?auto_360321 ?auto_360334 ) ) ( not ( = ?auto_360322 ?auto_360323 ) ) ( not ( = ?auto_360322 ?auto_360324 ) ) ( not ( = ?auto_360322 ?auto_360325 ) ) ( not ( = ?auto_360322 ?auto_360326 ) ) ( not ( = ?auto_360322 ?auto_360327 ) ) ( not ( = ?auto_360322 ?auto_360328 ) ) ( not ( = ?auto_360322 ?auto_360329 ) ) ( not ( = ?auto_360322 ?auto_360330 ) ) ( not ( = ?auto_360322 ?auto_360331 ) ) ( not ( = ?auto_360322 ?auto_360332 ) ) ( not ( = ?auto_360322 ?auto_360333 ) ) ( not ( = ?auto_360322 ?auto_360334 ) ) ( not ( = ?auto_360323 ?auto_360324 ) ) ( not ( = ?auto_360323 ?auto_360325 ) ) ( not ( = ?auto_360323 ?auto_360326 ) ) ( not ( = ?auto_360323 ?auto_360327 ) ) ( not ( = ?auto_360323 ?auto_360328 ) ) ( not ( = ?auto_360323 ?auto_360329 ) ) ( not ( = ?auto_360323 ?auto_360330 ) ) ( not ( = ?auto_360323 ?auto_360331 ) ) ( not ( = ?auto_360323 ?auto_360332 ) ) ( not ( = ?auto_360323 ?auto_360333 ) ) ( not ( = ?auto_360323 ?auto_360334 ) ) ( not ( = ?auto_360324 ?auto_360325 ) ) ( not ( = ?auto_360324 ?auto_360326 ) ) ( not ( = ?auto_360324 ?auto_360327 ) ) ( not ( = ?auto_360324 ?auto_360328 ) ) ( not ( = ?auto_360324 ?auto_360329 ) ) ( not ( = ?auto_360324 ?auto_360330 ) ) ( not ( = ?auto_360324 ?auto_360331 ) ) ( not ( = ?auto_360324 ?auto_360332 ) ) ( not ( = ?auto_360324 ?auto_360333 ) ) ( not ( = ?auto_360324 ?auto_360334 ) ) ( not ( = ?auto_360325 ?auto_360326 ) ) ( not ( = ?auto_360325 ?auto_360327 ) ) ( not ( = ?auto_360325 ?auto_360328 ) ) ( not ( = ?auto_360325 ?auto_360329 ) ) ( not ( = ?auto_360325 ?auto_360330 ) ) ( not ( = ?auto_360325 ?auto_360331 ) ) ( not ( = ?auto_360325 ?auto_360332 ) ) ( not ( = ?auto_360325 ?auto_360333 ) ) ( not ( = ?auto_360325 ?auto_360334 ) ) ( not ( = ?auto_360326 ?auto_360327 ) ) ( not ( = ?auto_360326 ?auto_360328 ) ) ( not ( = ?auto_360326 ?auto_360329 ) ) ( not ( = ?auto_360326 ?auto_360330 ) ) ( not ( = ?auto_360326 ?auto_360331 ) ) ( not ( = ?auto_360326 ?auto_360332 ) ) ( not ( = ?auto_360326 ?auto_360333 ) ) ( not ( = ?auto_360326 ?auto_360334 ) ) ( not ( = ?auto_360327 ?auto_360328 ) ) ( not ( = ?auto_360327 ?auto_360329 ) ) ( not ( = ?auto_360327 ?auto_360330 ) ) ( not ( = ?auto_360327 ?auto_360331 ) ) ( not ( = ?auto_360327 ?auto_360332 ) ) ( not ( = ?auto_360327 ?auto_360333 ) ) ( not ( = ?auto_360327 ?auto_360334 ) ) ( not ( = ?auto_360328 ?auto_360329 ) ) ( not ( = ?auto_360328 ?auto_360330 ) ) ( not ( = ?auto_360328 ?auto_360331 ) ) ( not ( = ?auto_360328 ?auto_360332 ) ) ( not ( = ?auto_360328 ?auto_360333 ) ) ( not ( = ?auto_360328 ?auto_360334 ) ) ( not ( = ?auto_360329 ?auto_360330 ) ) ( not ( = ?auto_360329 ?auto_360331 ) ) ( not ( = ?auto_360329 ?auto_360332 ) ) ( not ( = ?auto_360329 ?auto_360333 ) ) ( not ( = ?auto_360329 ?auto_360334 ) ) ( not ( = ?auto_360330 ?auto_360331 ) ) ( not ( = ?auto_360330 ?auto_360332 ) ) ( not ( = ?auto_360330 ?auto_360333 ) ) ( not ( = ?auto_360330 ?auto_360334 ) ) ( not ( = ?auto_360331 ?auto_360332 ) ) ( not ( = ?auto_360331 ?auto_360333 ) ) ( not ( = ?auto_360331 ?auto_360334 ) ) ( not ( = ?auto_360332 ?auto_360333 ) ) ( not ( = ?auto_360332 ?auto_360334 ) ) ( not ( = ?auto_360333 ?auto_360334 ) ) ( ON ?auto_360332 ?auto_360333 ) ( ON ?auto_360331 ?auto_360332 ) ( ON ?auto_360330 ?auto_360331 ) ( ON ?auto_360329 ?auto_360330 ) ( ON ?auto_360328 ?auto_360329 ) ( ON ?auto_360327 ?auto_360328 ) ( ON ?auto_360326 ?auto_360327 ) ( ON ?auto_360325 ?auto_360326 ) ( CLEAR ?auto_360323 ) ( ON ?auto_360324 ?auto_360325 ) ( CLEAR ?auto_360324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_360320 ?auto_360321 ?auto_360322 ?auto_360323 ?auto_360324 )
      ( MAKE-14PILE ?auto_360320 ?auto_360321 ?auto_360322 ?auto_360323 ?auto_360324 ?auto_360325 ?auto_360326 ?auto_360327 ?auto_360328 ?auto_360329 ?auto_360330 ?auto_360331 ?auto_360332 ?auto_360333 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360349 - BLOCK
      ?auto_360350 - BLOCK
      ?auto_360351 - BLOCK
      ?auto_360352 - BLOCK
      ?auto_360353 - BLOCK
      ?auto_360354 - BLOCK
      ?auto_360355 - BLOCK
      ?auto_360356 - BLOCK
      ?auto_360357 - BLOCK
      ?auto_360358 - BLOCK
      ?auto_360359 - BLOCK
      ?auto_360360 - BLOCK
      ?auto_360361 - BLOCK
      ?auto_360362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360362 ) ( ON-TABLE ?auto_360349 ) ( ON ?auto_360350 ?auto_360349 ) ( ON ?auto_360351 ?auto_360350 ) ( ON ?auto_360352 ?auto_360351 ) ( not ( = ?auto_360349 ?auto_360350 ) ) ( not ( = ?auto_360349 ?auto_360351 ) ) ( not ( = ?auto_360349 ?auto_360352 ) ) ( not ( = ?auto_360349 ?auto_360353 ) ) ( not ( = ?auto_360349 ?auto_360354 ) ) ( not ( = ?auto_360349 ?auto_360355 ) ) ( not ( = ?auto_360349 ?auto_360356 ) ) ( not ( = ?auto_360349 ?auto_360357 ) ) ( not ( = ?auto_360349 ?auto_360358 ) ) ( not ( = ?auto_360349 ?auto_360359 ) ) ( not ( = ?auto_360349 ?auto_360360 ) ) ( not ( = ?auto_360349 ?auto_360361 ) ) ( not ( = ?auto_360349 ?auto_360362 ) ) ( not ( = ?auto_360350 ?auto_360351 ) ) ( not ( = ?auto_360350 ?auto_360352 ) ) ( not ( = ?auto_360350 ?auto_360353 ) ) ( not ( = ?auto_360350 ?auto_360354 ) ) ( not ( = ?auto_360350 ?auto_360355 ) ) ( not ( = ?auto_360350 ?auto_360356 ) ) ( not ( = ?auto_360350 ?auto_360357 ) ) ( not ( = ?auto_360350 ?auto_360358 ) ) ( not ( = ?auto_360350 ?auto_360359 ) ) ( not ( = ?auto_360350 ?auto_360360 ) ) ( not ( = ?auto_360350 ?auto_360361 ) ) ( not ( = ?auto_360350 ?auto_360362 ) ) ( not ( = ?auto_360351 ?auto_360352 ) ) ( not ( = ?auto_360351 ?auto_360353 ) ) ( not ( = ?auto_360351 ?auto_360354 ) ) ( not ( = ?auto_360351 ?auto_360355 ) ) ( not ( = ?auto_360351 ?auto_360356 ) ) ( not ( = ?auto_360351 ?auto_360357 ) ) ( not ( = ?auto_360351 ?auto_360358 ) ) ( not ( = ?auto_360351 ?auto_360359 ) ) ( not ( = ?auto_360351 ?auto_360360 ) ) ( not ( = ?auto_360351 ?auto_360361 ) ) ( not ( = ?auto_360351 ?auto_360362 ) ) ( not ( = ?auto_360352 ?auto_360353 ) ) ( not ( = ?auto_360352 ?auto_360354 ) ) ( not ( = ?auto_360352 ?auto_360355 ) ) ( not ( = ?auto_360352 ?auto_360356 ) ) ( not ( = ?auto_360352 ?auto_360357 ) ) ( not ( = ?auto_360352 ?auto_360358 ) ) ( not ( = ?auto_360352 ?auto_360359 ) ) ( not ( = ?auto_360352 ?auto_360360 ) ) ( not ( = ?auto_360352 ?auto_360361 ) ) ( not ( = ?auto_360352 ?auto_360362 ) ) ( not ( = ?auto_360353 ?auto_360354 ) ) ( not ( = ?auto_360353 ?auto_360355 ) ) ( not ( = ?auto_360353 ?auto_360356 ) ) ( not ( = ?auto_360353 ?auto_360357 ) ) ( not ( = ?auto_360353 ?auto_360358 ) ) ( not ( = ?auto_360353 ?auto_360359 ) ) ( not ( = ?auto_360353 ?auto_360360 ) ) ( not ( = ?auto_360353 ?auto_360361 ) ) ( not ( = ?auto_360353 ?auto_360362 ) ) ( not ( = ?auto_360354 ?auto_360355 ) ) ( not ( = ?auto_360354 ?auto_360356 ) ) ( not ( = ?auto_360354 ?auto_360357 ) ) ( not ( = ?auto_360354 ?auto_360358 ) ) ( not ( = ?auto_360354 ?auto_360359 ) ) ( not ( = ?auto_360354 ?auto_360360 ) ) ( not ( = ?auto_360354 ?auto_360361 ) ) ( not ( = ?auto_360354 ?auto_360362 ) ) ( not ( = ?auto_360355 ?auto_360356 ) ) ( not ( = ?auto_360355 ?auto_360357 ) ) ( not ( = ?auto_360355 ?auto_360358 ) ) ( not ( = ?auto_360355 ?auto_360359 ) ) ( not ( = ?auto_360355 ?auto_360360 ) ) ( not ( = ?auto_360355 ?auto_360361 ) ) ( not ( = ?auto_360355 ?auto_360362 ) ) ( not ( = ?auto_360356 ?auto_360357 ) ) ( not ( = ?auto_360356 ?auto_360358 ) ) ( not ( = ?auto_360356 ?auto_360359 ) ) ( not ( = ?auto_360356 ?auto_360360 ) ) ( not ( = ?auto_360356 ?auto_360361 ) ) ( not ( = ?auto_360356 ?auto_360362 ) ) ( not ( = ?auto_360357 ?auto_360358 ) ) ( not ( = ?auto_360357 ?auto_360359 ) ) ( not ( = ?auto_360357 ?auto_360360 ) ) ( not ( = ?auto_360357 ?auto_360361 ) ) ( not ( = ?auto_360357 ?auto_360362 ) ) ( not ( = ?auto_360358 ?auto_360359 ) ) ( not ( = ?auto_360358 ?auto_360360 ) ) ( not ( = ?auto_360358 ?auto_360361 ) ) ( not ( = ?auto_360358 ?auto_360362 ) ) ( not ( = ?auto_360359 ?auto_360360 ) ) ( not ( = ?auto_360359 ?auto_360361 ) ) ( not ( = ?auto_360359 ?auto_360362 ) ) ( not ( = ?auto_360360 ?auto_360361 ) ) ( not ( = ?auto_360360 ?auto_360362 ) ) ( not ( = ?auto_360361 ?auto_360362 ) ) ( ON ?auto_360361 ?auto_360362 ) ( ON ?auto_360360 ?auto_360361 ) ( ON ?auto_360359 ?auto_360360 ) ( ON ?auto_360358 ?auto_360359 ) ( ON ?auto_360357 ?auto_360358 ) ( ON ?auto_360356 ?auto_360357 ) ( ON ?auto_360355 ?auto_360356 ) ( ON ?auto_360354 ?auto_360355 ) ( CLEAR ?auto_360352 ) ( ON ?auto_360353 ?auto_360354 ) ( CLEAR ?auto_360353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_360349 ?auto_360350 ?auto_360351 ?auto_360352 ?auto_360353 )
      ( MAKE-14PILE ?auto_360349 ?auto_360350 ?auto_360351 ?auto_360352 ?auto_360353 ?auto_360354 ?auto_360355 ?auto_360356 ?auto_360357 ?auto_360358 ?auto_360359 ?auto_360360 ?auto_360361 ?auto_360362 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360377 - BLOCK
      ?auto_360378 - BLOCK
      ?auto_360379 - BLOCK
      ?auto_360380 - BLOCK
      ?auto_360381 - BLOCK
      ?auto_360382 - BLOCK
      ?auto_360383 - BLOCK
      ?auto_360384 - BLOCK
      ?auto_360385 - BLOCK
      ?auto_360386 - BLOCK
      ?auto_360387 - BLOCK
      ?auto_360388 - BLOCK
      ?auto_360389 - BLOCK
      ?auto_360390 - BLOCK
    )
    :vars
    (
      ?auto_360391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360390 ?auto_360391 ) ( ON-TABLE ?auto_360377 ) ( ON ?auto_360378 ?auto_360377 ) ( ON ?auto_360379 ?auto_360378 ) ( not ( = ?auto_360377 ?auto_360378 ) ) ( not ( = ?auto_360377 ?auto_360379 ) ) ( not ( = ?auto_360377 ?auto_360380 ) ) ( not ( = ?auto_360377 ?auto_360381 ) ) ( not ( = ?auto_360377 ?auto_360382 ) ) ( not ( = ?auto_360377 ?auto_360383 ) ) ( not ( = ?auto_360377 ?auto_360384 ) ) ( not ( = ?auto_360377 ?auto_360385 ) ) ( not ( = ?auto_360377 ?auto_360386 ) ) ( not ( = ?auto_360377 ?auto_360387 ) ) ( not ( = ?auto_360377 ?auto_360388 ) ) ( not ( = ?auto_360377 ?auto_360389 ) ) ( not ( = ?auto_360377 ?auto_360390 ) ) ( not ( = ?auto_360377 ?auto_360391 ) ) ( not ( = ?auto_360378 ?auto_360379 ) ) ( not ( = ?auto_360378 ?auto_360380 ) ) ( not ( = ?auto_360378 ?auto_360381 ) ) ( not ( = ?auto_360378 ?auto_360382 ) ) ( not ( = ?auto_360378 ?auto_360383 ) ) ( not ( = ?auto_360378 ?auto_360384 ) ) ( not ( = ?auto_360378 ?auto_360385 ) ) ( not ( = ?auto_360378 ?auto_360386 ) ) ( not ( = ?auto_360378 ?auto_360387 ) ) ( not ( = ?auto_360378 ?auto_360388 ) ) ( not ( = ?auto_360378 ?auto_360389 ) ) ( not ( = ?auto_360378 ?auto_360390 ) ) ( not ( = ?auto_360378 ?auto_360391 ) ) ( not ( = ?auto_360379 ?auto_360380 ) ) ( not ( = ?auto_360379 ?auto_360381 ) ) ( not ( = ?auto_360379 ?auto_360382 ) ) ( not ( = ?auto_360379 ?auto_360383 ) ) ( not ( = ?auto_360379 ?auto_360384 ) ) ( not ( = ?auto_360379 ?auto_360385 ) ) ( not ( = ?auto_360379 ?auto_360386 ) ) ( not ( = ?auto_360379 ?auto_360387 ) ) ( not ( = ?auto_360379 ?auto_360388 ) ) ( not ( = ?auto_360379 ?auto_360389 ) ) ( not ( = ?auto_360379 ?auto_360390 ) ) ( not ( = ?auto_360379 ?auto_360391 ) ) ( not ( = ?auto_360380 ?auto_360381 ) ) ( not ( = ?auto_360380 ?auto_360382 ) ) ( not ( = ?auto_360380 ?auto_360383 ) ) ( not ( = ?auto_360380 ?auto_360384 ) ) ( not ( = ?auto_360380 ?auto_360385 ) ) ( not ( = ?auto_360380 ?auto_360386 ) ) ( not ( = ?auto_360380 ?auto_360387 ) ) ( not ( = ?auto_360380 ?auto_360388 ) ) ( not ( = ?auto_360380 ?auto_360389 ) ) ( not ( = ?auto_360380 ?auto_360390 ) ) ( not ( = ?auto_360380 ?auto_360391 ) ) ( not ( = ?auto_360381 ?auto_360382 ) ) ( not ( = ?auto_360381 ?auto_360383 ) ) ( not ( = ?auto_360381 ?auto_360384 ) ) ( not ( = ?auto_360381 ?auto_360385 ) ) ( not ( = ?auto_360381 ?auto_360386 ) ) ( not ( = ?auto_360381 ?auto_360387 ) ) ( not ( = ?auto_360381 ?auto_360388 ) ) ( not ( = ?auto_360381 ?auto_360389 ) ) ( not ( = ?auto_360381 ?auto_360390 ) ) ( not ( = ?auto_360381 ?auto_360391 ) ) ( not ( = ?auto_360382 ?auto_360383 ) ) ( not ( = ?auto_360382 ?auto_360384 ) ) ( not ( = ?auto_360382 ?auto_360385 ) ) ( not ( = ?auto_360382 ?auto_360386 ) ) ( not ( = ?auto_360382 ?auto_360387 ) ) ( not ( = ?auto_360382 ?auto_360388 ) ) ( not ( = ?auto_360382 ?auto_360389 ) ) ( not ( = ?auto_360382 ?auto_360390 ) ) ( not ( = ?auto_360382 ?auto_360391 ) ) ( not ( = ?auto_360383 ?auto_360384 ) ) ( not ( = ?auto_360383 ?auto_360385 ) ) ( not ( = ?auto_360383 ?auto_360386 ) ) ( not ( = ?auto_360383 ?auto_360387 ) ) ( not ( = ?auto_360383 ?auto_360388 ) ) ( not ( = ?auto_360383 ?auto_360389 ) ) ( not ( = ?auto_360383 ?auto_360390 ) ) ( not ( = ?auto_360383 ?auto_360391 ) ) ( not ( = ?auto_360384 ?auto_360385 ) ) ( not ( = ?auto_360384 ?auto_360386 ) ) ( not ( = ?auto_360384 ?auto_360387 ) ) ( not ( = ?auto_360384 ?auto_360388 ) ) ( not ( = ?auto_360384 ?auto_360389 ) ) ( not ( = ?auto_360384 ?auto_360390 ) ) ( not ( = ?auto_360384 ?auto_360391 ) ) ( not ( = ?auto_360385 ?auto_360386 ) ) ( not ( = ?auto_360385 ?auto_360387 ) ) ( not ( = ?auto_360385 ?auto_360388 ) ) ( not ( = ?auto_360385 ?auto_360389 ) ) ( not ( = ?auto_360385 ?auto_360390 ) ) ( not ( = ?auto_360385 ?auto_360391 ) ) ( not ( = ?auto_360386 ?auto_360387 ) ) ( not ( = ?auto_360386 ?auto_360388 ) ) ( not ( = ?auto_360386 ?auto_360389 ) ) ( not ( = ?auto_360386 ?auto_360390 ) ) ( not ( = ?auto_360386 ?auto_360391 ) ) ( not ( = ?auto_360387 ?auto_360388 ) ) ( not ( = ?auto_360387 ?auto_360389 ) ) ( not ( = ?auto_360387 ?auto_360390 ) ) ( not ( = ?auto_360387 ?auto_360391 ) ) ( not ( = ?auto_360388 ?auto_360389 ) ) ( not ( = ?auto_360388 ?auto_360390 ) ) ( not ( = ?auto_360388 ?auto_360391 ) ) ( not ( = ?auto_360389 ?auto_360390 ) ) ( not ( = ?auto_360389 ?auto_360391 ) ) ( not ( = ?auto_360390 ?auto_360391 ) ) ( ON ?auto_360389 ?auto_360390 ) ( ON ?auto_360388 ?auto_360389 ) ( ON ?auto_360387 ?auto_360388 ) ( ON ?auto_360386 ?auto_360387 ) ( ON ?auto_360385 ?auto_360386 ) ( ON ?auto_360384 ?auto_360385 ) ( ON ?auto_360383 ?auto_360384 ) ( ON ?auto_360382 ?auto_360383 ) ( ON ?auto_360381 ?auto_360382 ) ( CLEAR ?auto_360379 ) ( ON ?auto_360380 ?auto_360381 ) ( CLEAR ?auto_360380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_360377 ?auto_360378 ?auto_360379 ?auto_360380 )
      ( MAKE-14PILE ?auto_360377 ?auto_360378 ?auto_360379 ?auto_360380 ?auto_360381 ?auto_360382 ?auto_360383 ?auto_360384 ?auto_360385 ?auto_360386 ?auto_360387 ?auto_360388 ?auto_360389 ?auto_360390 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360406 - BLOCK
      ?auto_360407 - BLOCK
      ?auto_360408 - BLOCK
      ?auto_360409 - BLOCK
      ?auto_360410 - BLOCK
      ?auto_360411 - BLOCK
      ?auto_360412 - BLOCK
      ?auto_360413 - BLOCK
      ?auto_360414 - BLOCK
      ?auto_360415 - BLOCK
      ?auto_360416 - BLOCK
      ?auto_360417 - BLOCK
      ?auto_360418 - BLOCK
      ?auto_360419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360419 ) ( ON-TABLE ?auto_360406 ) ( ON ?auto_360407 ?auto_360406 ) ( ON ?auto_360408 ?auto_360407 ) ( not ( = ?auto_360406 ?auto_360407 ) ) ( not ( = ?auto_360406 ?auto_360408 ) ) ( not ( = ?auto_360406 ?auto_360409 ) ) ( not ( = ?auto_360406 ?auto_360410 ) ) ( not ( = ?auto_360406 ?auto_360411 ) ) ( not ( = ?auto_360406 ?auto_360412 ) ) ( not ( = ?auto_360406 ?auto_360413 ) ) ( not ( = ?auto_360406 ?auto_360414 ) ) ( not ( = ?auto_360406 ?auto_360415 ) ) ( not ( = ?auto_360406 ?auto_360416 ) ) ( not ( = ?auto_360406 ?auto_360417 ) ) ( not ( = ?auto_360406 ?auto_360418 ) ) ( not ( = ?auto_360406 ?auto_360419 ) ) ( not ( = ?auto_360407 ?auto_360408 ) ) ( not ( = ?auto_360407 ?auto_360409 ) ) ( not ( = ?auto_360407 ?auto_360410 ) ) ( not ( = ?auto_360407 ?auto_360411 ) ) ( not ( = ?auto_360407 ?auto_360412 ) ) ( not ( = ?auto_360407 ?auto_360413 ) ) ( not ( = ?auto_360407 ?auto_360414 ) ) ( not ( = ?auto_360407 ?auto_360415 ) ) ( not ( = ?auto_360407 ?auto_360416 ) ) ( not ( = ?auto_360407 ?auto_360417 ) ) ( not ( = ?auto_360407 ?auto_360418 ) ) ( not ( = ?auto_360407 ?auto_360419 ) ) ( not ( = ?auto_360408 ?auto_360409 ) ) ( not ( = ?auto_360408 ?auto_360410 ) ) ( not ( = ?auto_360408 ?auto_360411 ) ) ( not ( = ?auto_360408 ?auto_360412 ) ) ( not ( = ?auto_360408 ?auto_360413 ) ) ( not ( = ?auto_360408 ?auto_360414 ) ) ( not ( = ?auto_360408 ?auto_360415 ) ) ( not ( = ?auto_360408 ?auto_360416 ) ) ( not ( = ?auto_360408 ?auto_360417 ) ) ( not ( = ?auto_360408 ?auto_360418 ) ) ( not ( = ?auto_360408 ?auto_360419 ) ) ( not ( = ?auto_360409 ?auto_360410 ) ) ( not ( = ?auto_360409 ?auto_360411 ) ) ( not ( = ?auto_360409 ?auto_360412 ) ) ( not ( = ?auto_360409 ?auto_360413 ) ) ( not ( = ?auto_360409 ?auto_360414 ) ) ( not ( = ?auto_360409 ?auto_360415 ) ) ( not ( = ?auto_360409 ?auto_360416 ) ) ( not ( = ?auto_360409 ?auto_360417 ) ) ( not ( = ?auto_360409 ?auto_360418 ) ) ( not ( = ?auto_360409 ?auto_360419 ) ) ( not ( = ?auto_360410 ?auto_360411 ) ) ( not ( = ?auto_360410 ?auto_360412 ) ) ( not ( = ?auto_360410 ?auto_360413 ) ) ( not ( = ?auto_360410 ?auto_360414 ) ) ( not ( = ?auto_360410 ?auto_360415 ) ) ( not ( = ?auto_360410 ?auto_360416 ) ) ( not ( = ?auto_360410 ?auto_360417 ) ) ( not ( = ?auto_360410 ?auto_360418 ) ) ( not ( = ?auto_360410 ?auto_360419 ) ) ( not ( = ?auto_360411 ?auto_360412 ) ) ( not ( = ?auto_360411 ?auto_360413 ) ) ( not ( = ?auto_360411 ?auto_360414 ) ) ( not ( = ?auto_360411 ?auto_360415 ) ) ( not ( = ?auto_360411 ?auto_360416 ) ) ( not ( = ?auto_360411 ?auto_360417 ) ) ( not ( = ?auto_360411 ?auto_360418 ) ) ( not ( = ?auto_360411 ?auto_360419 ) ) ( not ( = ?auto_360412 ?auto_360413 ) ) ( not ( = ?auto_360412 ?auto_360414 ) ) ( not ( = ?auto_360412 ?auto_360415 ) ) ( not ( = ?auto_360412 ?auto_360416 ) ) ( not ( = ?auto_360412 ?auto_360417 ) ) ( not ( = ?auto_360412 ?auto_360418 ) ) ( not ( = ?auto_360412 ?auto_360419 ) ) ( not ( = ?auto_360413 ?auto_360414 ) ) ( not ( = ?auto_360413 ?auto_360415 ) ) ( not ( = ?auto_360413 ?auto_360416 ) ) ( not ( = ?auto_360413 ?auto_360417 ) ) ( not ( = ?auto_360413 ?auto_360418 ) ) ( not ( = ?auto_360413 ?auto_360419 ) ) ( not ( = ?auto_360414 ?auto_360415 ) ) ( not ( = ?auto_360414 ?auto_360416 ) ) ( not ( = ?auto_360414 ?auto_360417 ) ) ( not ( = ?auto_360414 ?auto_360418 ) ) ( not ( = ?auto_360414 ?auto_360419 ) ) ( not ( = ?auto_360415 ?auto_360416 ) ) ( not ( = ?auto_360415 ?auto_360417 ) ) ( not ( = ?auto_360415 ?auto_360418 ) ) ( not ( = ?auto_360415 ?auto_360419 ) ) ( not ( = ?auto_360416 ?auto_360417 ) ) ( not ( = ?auto_360416 ?auto_360418 ) ) ( not ( = ?auto_360416 ?auto_360419 ) ) ( not ( = ?auto_360417 ?auto_360418 ) ) ( not ( = ?auto_360417 ?auto_360419 ) ) ( not ( = ?auto_360418 ?auto_360419 ) ) ( ON ?auto_360418 ?auto_360419 ) ( ON ?auto_360417 ?auto_360418 ) ( ON ?auto_360416 ?auto_360417 ) ( ON ?auto_360415 ?auto_360416 ) ( ON ?auto_360414 ?auto_360415 ) ( ON ?auto_360413 ?auto_360414 ) ( ON ?auto_360412 ?auto_360413 ) ( ON ?auto_360411 ?auto_360412 ) ( ON ?auto_360410 ?auto_360411 ) ( CLEAR ?auto_360408 ) ( ON ?auto_360409 ?auto_360410 ) ( CLEAR ?auto_360409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_360406 ?auto_360407 ?auto_360408 ?auto_360409 )
      ( MAKE-14PILE ?auto_360406 ?auto_360407 ?auto_360408 ?auto_360409 ?auto_360410 ?auto_360411 ?auto_360412 ?auto_360413 ?auto_360414 ?auto_360415 ?auto_360416 ?auto_360417 ?auto_360418 ?auto_360419 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360434 - BLOCK
      ?auto_360435 - BLOCK
      ?auto_360436 - BLOCK
      ?auto_360437 - BLOCK
      ?auto_360438 - BLOCK
      ?auto_360439 - BLOCK
      ?auto_360440 - BLOCK
      ?auto_360441 - BLOCK
      ?auto_360442 - BLOCK
      ?auto_360443 - BLOCK
      ?auto_360444 - BLOCK
      ?auto_360445 - BLOCK
      ?auto_360446 - BLOCK
      ?auto_360447 - BLOCK
    )
    :vars
    (
      ?auto_360448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360447 ?auto_360448 ) ( ON-TABLE ?auto_360434 ) ( ON ?auto_360435 ?auto_360434 ) ( not ( = ?auto_360434 ?auto_360435 ) ) ( not ( = ?auto_360434 ?auto_360436 ) ) ( not ( = ?auto_360434 ?auto_360437 ) ) ( not ( = ?auto_360434 ?auto_360438 ) ) ( not ( = ?auto_360434 ?auto_360439 ) ) ( not ( = ?auto_360434 ?auto_360440 ) ) ( not ( = ?auto_360434 ?auto_360441 ) ) ( not ( = ?auto_360434 ?auto_360442 ) ) ( not ( = ?auto_360434 ?auto_360443 ) ) ( not ( = ?auto_360434 ?auto_360444 ) ) ( not ( = ?auto_360434 ?auto_360445 ) ) ( not ( = ?auto_360434 ?auto_360446 ) ) ( not ( = ?auto_360434 ?auto_360447 ) ) ( not ( = ?auto_360434 ?auto_360448 ) ) ( not ( = ?auto_360435 ?auto_360436 ) ) ( not ( = ?auto_360435 ?auto_360437 ) ) ( not ( = ?auto_360435 ?auto_360438 ) ) ( not ( = ?auto_360435 ?auto_360439 ) ) ( not ( = ?auto_360435 ?auto_360440 ) ) ( not ( = ?auto_360435 ?auto_360441 ) ) ( not ( = ?auto_360435 ?auto_360442 ) ) ( not ( = ?auto_360435 ?auto_360443 ) ) ( not ( = ?auto_360435 ?auto_360444 ) ) ( not ( = ?auto_360435 ?auto_360445 ) ) ( not ( = ?auto_360435 ?auto_360446 ) ) ( not ( = ?auto_360435 ?auto_360447 ) ) ( not ( = ?auto_360435 ?auto_360448 ) ) ( not ( = ?auto_360436 ?auto_360437 ) ) ( not ( = ?auto_360436 ?auto_360438 ) ) ( not ( = ?auto_360436 ?auto_360439 ) ) ( not ( = ?auto_360436 ?auto_360440 ) ) ( not ( = ?auto_360436 ?auto_360441 ) ) ( not ( = ?auto_360436 ?auto_360442 ) ) ( not ( = ?auto_360436 ?auto_360443 ) ) ( not ( = ?auto_360436 ?auto_360444 ) ) ( not ( = ?auto_360436 ?auto_360445 ) ) ( not ( = ?auto_360436 ?auto_360446 ) ) ( not ( = ?auto_360436 ?auto_360447 ) ) ( not ( = ?auto_360436 ?auto_360448 ) ) ( not ( = ?auto_360437 ?auto_360438 ) ) ( not ( = ?auto_360437 ?auto_360439 ) ) ( not ( = ?auto_360437 ?auto_360440 ) ) ( not ( = ?auto_360437 ?auto_360441 ) ) ( not ( = ?auto_360437 ?auto_360442 ) ) ( not ( = ?auto_360437 ?auto_360443 ) ) ( not ( = ?auto_360437 ?auto_360444 ) ) ( not ( = ?auto_360437 ?auto_360445 ) ) ( not ( = ?auto_360437 ?auto_360446 ) ) ( not ( = ?auto_360437 ?auto_360447 ) ) ( not ( = ?auto_360437 ?auto_360448 ) ) ( not ( = ?auto_360438 ?auto_360439 ) ) ( not ( = ?auto_360438 ?auto_360440 ) ) ( not ( = ?auto_360438 ?auto_360441 ) ) ( not ( = ?auto_360438 ?auto_360442 ) ) ( not ( = ?auto_360438 ?auto_360443 ) ) ( not ( = ?auto_360438 ?auto_360444 ) ) ( not ( = ?auto_360438 ?auto_360445 ) ) ( not ( = ?auto_360438 ?auto_360446 ) ) ( not ( = ?auto_360438 ?auto_360447 ) ) ( not ( = ?auto_360438 ?auto_360448 ) ) ( not ( = ?auto_360439 ?auto_360440 ) ) ( not ( = ?auto_360439 ?auto_360441 ) ) ( not ( = ?auto_360439 ?auto_360442 ) ) ( not ( = ?auto_360439 ?auto_360443 ) ) ( not ( = ?auto_360439 ?auto_360444 ) ) ( not ( = ?auto_360439 ?auto_360445 ) ) ( not ( = ?auto_360439 ?auto_360446 ) ) ( not ( = ?auto_360439 ?auto_360447 ) ) ( not ( = ?auto_360439 ?auto_360448 ) ) ( not ( = ?auto_360440 ?auto_360441 ) ) ( not ( = ?auto_360440 ?auto_360442 ) ) ( not ( = ?auto_360440 ?auto_360443 ) ) ( not ( = ?auto_360440 ?auto_360444 ) ) ( not ( = ?auto_360440 ?auto_360445 ) ) ( not ( = ?auto_360440 ?auto_360446 ) ) ( not ( = ?auto_360440 ?auto_360447 ) ) ( not ( = ?auto_360440 ?auto_360448 ) ) ( not ( = ?auto_360441 ?auto_360442 ) ) ( not ( = ?auto_360441 ?auto_360443 ) ) ( not ( = ?auto_360441 ?auto_360444 ) ) ( not ( = ?auto_360441 ?auto_360445 ) ) ( not ( = ?auto_360441 ?auto_360446 ) ) ( not ( = ?auto_360441 ?auto_360447 ) ) ( not ( = ?auto_360441 ?auto_360448 ) ) ( not ( = ?auto_360442 ?auto_360443 ) ) ( not ( = ?auto_360442 ?auto_360444 ) ) ( not ( = ?auto_360442 ?auto_360445 ) ) ( not ( = ?auto_360442 ?auto_360446 ) ) ( not ( = ?auto_360442 ?auto_360447 ) ) ( not ( = ?auto_360442 ?auto_360448 ) ) ( not ( = ?auto_360443 ?auto_360444 ) ) ( not ( = ?auto_360443 ?auto_360445 ) ) ( not ( = ?auto_360443 ?auto_360446 ) ) ( not ( = ?auto_360443 ?auto_360447 ) ) ( not ( = ?auto_360443 ?auto_360448 ) ) ( not ( = ?auto_360444 ?auto_360445 ) ) ( not ( = ?auto_360444 ?auto_360446 ) ) ( not ( = ?auto_360444 ?auto_360447 ) ) ( not ( = ?auto_360444 ?auto_360448 ) ) ( not ( = ?auto_360445 ?auto_360446 ) ) ( not ( = ?auto_360445 ?auto_360447 ) ) ( not ( = ?auto_360445 ?auto_360448 ) ) ( not ( = ?auto_360446 ?auto_360447 ) ) ( not ( = ?auto_360446 ?auto_360448 ) ) ( not ( = ?auto_360447 ?auto_360448 ) ) ( ON ?auto_360446 ?auto_360447 ) ( ON ?auto_360445 ?auto_360446 ) ( ON ?auto_360444 ?auto_360445 ) ( ON ?auto_360443 ?auto_360444 ) ( ON ?auto_360442 ?auto_360443 ) ( ON ?auto_360441 ?auto_360442 ) ( ON ?auto_360440 ?auto_360441 ) ( ON ?auto_360439 ?auto_360440 ) ( ON ?auto_360438 ?auto_360439 ) ( ON ?auto_360437 ?auto_360438 ) ( CLEAR ?auto_360435 ) ( ON ?auto_360436 ?auto_360437 ) ( CLEAR ?auto_360436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_360434 ?auto_360435 ?auto_360436 )
      ( MAKE-14PILE ?auto_360434 ?auto_360435 ?auto_360436 ?auto_360437 ?auto_360438 ?auto_360439 ?auto_360440 ?auto_360441 ?auto_360442 ?auto_360443 ?auto_360444 ?auto_360445 ?auto_360446 ?auto_360447 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360463 - BLOCK
      ?auto_360464 - BLOCK
      ?auto_360465 - BLOCK
      ?auto_360466 - BLOCK
      ?auto_360467 - BLOCK
      ?auto_360468 - BLOCK
      ?auto_360469 - BLOCK
      ?auto_360470 - BLOCK
      ?auto_360471 - BLOCK
      ?auto_360472 - BLOCK
      ?auto_360473 - BLOCK
      ?auto_360474 - BLOCK
      ?auto_360475 - BLOCK
      ?auto_360476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360476 ) ( ON-TABLE ?auto_360463 ) ( ON ?auto_360464 ?auto_360463 ) ( not ( = ?auto_360463 ?auto_360464 ) ) ( not ( = ?auto_360463 ?auto_360465 ) ) ( not ( = ?auto_360463 ?auto_360466 ) ) ( not ( = ?auto_360463 ?auto_360467 ) ) ( not ( = ?auto_360463 ?auto_360468 ) ) ( not ( = ?auto_360463 ?auto_360469 ) ) ( not ( = ?auto_360463 ?auto_360470 ) ) ( not ( = ?auto_360463 ?auto_360471 ) ) ( not ( = ?auto_360463 ?auto_360472 ) ) ( not ( = ?auto_360463 ?auto_360473 ) ) ( not ( = ?auto_360463 ?auto_360474 ) ) ( not ( = ?auto_360463 ?auto_360475 ) ) ( not ( = ?auto_360463 ?auto_360476 ) ) ( not ( = ?auto_360464 ?auto_360465 ) ) ( not ( = ?auto_360464 ?auto_360466 ) ) ( not ( = ?auto_360464 ?auto_360467 ) ) ( not ( = ?auto_360464 ?auto_360468 ) ) ( not ( = ?auto_360464 ?auto_360469 ) ) ( not ( = ?auto_360464 ?auto_360470 ) ) ( not ( = ?auto_360464 ?auto_360471 ) ) ( not ( = ?auto_360464 ?auto_360472 ) ) ( not ( = ?auto_360464 ?auto_360473 ) ) ( not ( = ?auto_360464 ?auto_360474 ) ) ( not ( = ?auto_360464 ?auto_360475 ) ) ( not ( = ?auto_360464 ?auto_360476 ) ) ( not ( = ?auto_360465 ?auto_360466 ) ) ( not ( = ?auto_360465 ?auto_360467 ) ) ( not ( = ?auto_360465 ?auto_360468 ) ) ( not ( = ?auto_360465 ?auto_360469 ) ) ( not ( = ?auto_360465 ?auto_360470 ) ) ( not ( = ?auto_360465 ?auto_360471 ) ) ( not ( = ?auto_360465 ?auto_360472 ) ) ( not ( = ?auto_360465 ?auto_360473 ) ) ( not ( = ?auto_360465 ?auto_360474 ) ) ( not ( = ?auto_360465 ?auto_360475 ) ) ( not ( = ?auto_360465 ?auto_360476 ) ) ( not ( = ?auto_360466 ?auto_360467 ) ) ( not ( = ?auto_360466 ?auto_360468 ) ) ( not ( = ?auto_360466 ?auto_360469 ) ) ( not ( = ?auto_360466 ?auto_360470 ) ) ( not ( = ?auto_360466 ?auto_360471 ) ) ( not ( = ?auto_360466 ?auto_360472 ) ) ( not ( = ?auto_360466 ?auto_360473 ) ) ( not ( = ?auto_360466 ?auto_360474 ) ) ( not ( = ?auto_360466 ?auto_360475 ) ) ( not ( = ?auto_360466 ?auto_360476 ) ) ( not ( = ?auto_360467 ?auto_360468 ) ) ( not ( = ?auto_360467 ?auto_360469 ) ) ( not ( = ?auto_360467 ?auto_360470 ) ) ( not ( = ?auto_360467 ?auto_360471 ) ) ( not ( = ?auto_360467 ?auto_360472 ) ) ( not ( = ?auto_360467 ?auto_360473 ) ) ( not ( = ?auto_360467 ?auto_360474 ) ) ( not ( = ?auto_360467 ?auto_360475 ) ) ( not ( = ?auto_360467 ?auto_360476 ) ) ( not ( = ?auto_360468 ?auto_360469 ) ) ( not ( = ?auto_360468 ?auto_360470 ) ) ( not ( = ?auto_360468 ?auto_360471 ) ) ( not ( = ?auto_360468 ?auto_360472 ) ) ( not ( = ?auto_360468 ?auto_360473 ) ) ( not ( = ?auto_360468 ?auto_360474 ) ) ( not ( = ?auto_360468 ?auto_360475 ) ) ( not ( = ?auto_360468 ?auto_360476 ) ) ( not ( = ?auto_360469 ?auto_360470 ) ) ( not ( = ?auto_360469 ?auto_360471 ) ) ( not ( = ?auto_360469 ?auto_360472 ) ) ( not ( = ?auto_360469 ?auto_360473 ) ) ( not ( = ?auto_360469 ?auto_360474 ) ) ( not ( = ?auto_360469 ?auto_360475 ) ) ( not ( = ?auto_360469 ?auto_360476 ) ) ( not ( = ?auto_360470 ?auto_360471 ) ) ( not ( = ?auto_360470 ?auto_360472 ) ) ( not ( = ?auto_360470 ?auto_360473 ) ) ( not ( = ?auto_360470 ?auto_360474 ) ) ( not ( = ?auto_360470 ?auto_360475 ) ) ( not ( = ?auto_360470 ?auto_360476 ) ) ( not ( = ?auto_360471 ?auto_360472 ) ) ( not ( = ?auto_360471 ?auto_360473 ) ) ( not ( = ?auto_360471 ?auto_360474 ) ) ( not ( = ?auto_360471 ?auto_360475 ) ) ( not ( = ?auto_360471 ?auto_360476 ) ) ( not ( = ?auto_360472 ?auto_360473 ) ) ( not ( = ?auto_360472 ?auto_360474 ) ) ( not ( = ?auto_360472 ?auto_360475 ) ) ( not ( = ?auto_360472 ?auto_360476 ) ) ( not ( = ?auto_360473 ?auto_360474 ) ) ( not ( = ?auto_360473 ?auto_360475 ) ) ( not ( = ?auto_360473 ?auto_360476 ) ) ( not ( = ?auto_360474 ?auto_360475 ) ) ( not ( = ?auto_360474 ?auto_360476 ) ) ( not ( = ?auto_360475 ?auto_360476 ) ) ( ON ?auto_360475 ?auto_360476 ) ( ON ?auto_360474 ?auto_360475 ) ( ON ?auto_360473 ?auto_360474 ) ( ON ?auto_360472 ?auto_360473 ) ( ON ?auto_360471 ?auto_360472 ) ( ON ?auto_360470 ?auto_360471 ) ( ON ?auto_360469 ?auto_360470 ) ( ON ?auto_360468 ?auto_360469 ) ( ON ?auto_360467 ?auto_360468 ) ( ON ?auto_360466 ?auto_360467 ) ( CLEAR ?auto_360464 ) ( ON ?auto_360465 ?auto_360466 ) ( CLEAR ?auto_360465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_360463 ?auto_360464 ?auto_360465 )
      ( MAKE-14PILE ?auto_360463 ?auto_360464 ?auto_360465 ?auto_360466 ?auto_360467 ?auto_360468 ?auto_360469 ?auto_360470 ?auto_360471 ?auto_360472 ?auto_360473 ?auto_360474 ?auto_360475 ?auto_360476 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360491 - BLOCK
      ?auto_360492 - BLOCK
      ?auto_360493 - BLOCK
      ?auto_360494 - BLOCK
      ?auto_360495 - BLOCK
      ?auto_360496 - BLOCK
      ?auto_360497 - BLOCK
      ?auto_360498 - BLOCK
      ?auto_360499 - BLOCK
      ?auto_360500 - BLOCK
      ?auto_360501 - BLOCK
      ?auto_360502 - BLOCK
      ?auto_360503 - BLOCK
      ?auto_360504 - BLOCK
    )
    :vars
    (
      ?auto_360505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360504 ?auto_360505 ) ( ON-TABLE ?auto_360491 ) ( not ( = ?auto_360491 ?auto_360492 ) ) ( not ( = ?auto_360491 ?auto_360493 ) ) ( not ( = ?auto_360491 ?auto_360494 ) ) ( not ( = ?auto_360491 ?auto_360495 ) ) ( not ( = ?auto_360491 ?auto_360496 ) ) ( not ( = ?auto_360491 ?auto_360497 ) ) ( not ( = ?auto_360491 ?auto_360498 ) ) ( not ( = ?auto_360491 ?auto_360499 ) ) ( not ( = ?auto_360491 ?auto_360500 ) ) ( not ( = ?auto_360491 ?auto_360501 ) ) ( not ( = ?auto_360491 ?auto_360502 ) ) ( not ( = ?auto_360491 ?auto_360503 ) ) ( not ( = ?auto_360491 ?auto_360504 ) ) ( not ( = ?auto_360491 ?auto_360505 ) ) ( not ( = ?auto_360492 ?auto_360493 ) ) ( not ( = ?auto_360492 ?auto_360494 ) ) ( not ( = ?auto_360492 ?auto_360495 ) ) ( not ( = ?auto_360492 ?auto_360496 ) ) ( not ( = ?auto_360492 ?auto_360497 ) ) ( not ( = ?auto_360492 ?auto_360498 ) ) ( not ( = ?auto_360492 ?auto_360499 ) ) ( not ( = ?auto_360492 ?auto_360500 ) ) ( not ( = ?auto_360492 ?auto_360501 ) ) ( not ( = ?auto_360492 ?auto_360502 ) ) ( not ( = ?auto_360492 ?auto_360503 ) ) ( not ( = ?auto_360492 ?auto_360504 ) ) ( not ( = ?auto_360492 ?auto_360505 ) ) ( not ( = ?auto_360493 ?auto_360494 ) ) ( not ( = ?auto_360493 ?auto_360495 ) ) ( not ( = ?auto_360493 ?auto_360496 ) ) ( not ( = ?auto_360493 ?auto_360497 ) ) ( not ( = ?auto_360493 ?auto_360498 ) ) ( not ( = ?auto_360493 ?auto_360499 ) ) ( not ( = ?auto_360493 ?auto_360500 ) ) ( not ( = ?auto_360493 ?auto_360501 ) ) ( not ( = ?auto_360493 ?auto_360502 ) ) ( not ( = ?auto_360493 ?auto_360503 ) ) ( not ( = ?auto_360493 ?auto_360504 ) ) ( not ( = ?auto_360493 ?auto_360505 ) ) ( not ( = ?auto_360494 ?auto_360495 ) ) ( not ( = ?auto_360494 ?auto_360496 ) ) ( not ( = ?auto_360494 ?auto_360497 ) ) ( not ( = ?auto_360494 ?auto_360498 ) ) ( not ( = ?auto_360494 ?auto_360499 ) ) ( not ( = ?auto_360494 ?auto_360500 ) ) ( not ( = ?auto_360494 ?auto_360501 ) ) ( not ( = ?auto_360494 ?auto_360502 ) ) ( not ( = ?auto_360494 ?auto_360503 ) ) ( not ( = ?auto_360494 ?auto_360504 ) ) ( not ( = ?auto_360494 ?auto_360505 ) ) ( not ( = ?auto_360495 ?auto_360496 ) ) ( not ( = ?auto_360495 ?auto_360497 ) ) ( not ( = ?auto_360495 ?auto_360498 ) ) ( not ( = ?auto_360495 ?auto_360499 ) ) ( not ( = ?auto_360495 ?auto_360500 ) ) ( not ( = ?auto_360495 ?auto_360501 ) ) ( not ( = ?auto_360495 ?auto_360502 ) ) ( not ( = ?auto_360495 ?auto_360503 ) ) ( not ( = ?auto_360495 ?auto_360504 ) ) ( not ( = ?auto_360495 ?auto_360505 ) ) ( not ( = ?auto_360496 ?auto_360497 ) ) ( not ( = ?auto_360496 ?auto_360498 ) ) ( not ( = ?auto_360496 ?auto_360499 ) ) ( not ( = ?auto_360496 ?auto_360500 ) ) ( not ( = ?auto_360496 ?auto_360501 ) ) ( not ( = ?auto_360496 ?auto_360502 ) ) ( not ( = ?auto_360496 ?auto_360503 ) ) ( not ( = ?auto_360496 ?auto_360504 ) ) ( not ( = ?auto_360496 ?auto_360505 ) ) ( not ( = ?auto_360497 ?auto_360498 ) ) ( not ( = ?auto_360497 ?auto_360499 ) ) ( not ( = ?auto_360497 ?auto_360500 ) ) ( not ( = ?auto_360497 ?auto_360501 ) ) ( not ( = ?auto_360497 ?auto_360502 ) ) ( not ( = ?auto_360497 ?auto_360503 ) ) ( not ( = ?auto_360497 ?auto_360504 ) ) ( not ( = ?auto_360497 ?auto_360505 ) ) ( not ( = ?auto_360498 ?auto_360499 ) ) ( not ( = ?auto_360498 ?auto_360500 ) ) ( not ( = ?auto_360498 ?auto_360501 ) ) ( not ( = ?auto_360498 ?auto_360502 ) ) ( not ( = ?auto_360498 ?auto_360503 ) ) ( not ( = ?auto_360498 ?auto_360504 ) ) ( not ( = ?auto_360498 ?auto_360505 ) ) ( not ( = ?auto_360499 ?auto_360500 ) ) ( not ( = ?auto_360499 ?auto_360501 ) ) ( not ( = ?auto_360499 ?auto_360502 ) ) ( not ( = ?auto_360499 ?auto_360503 ) ) ( not ( = ?auto_360499 ?auto_360504 ) ) ( not ( = ?auto_360499 ?auto_360505 ) ) ( not ( = ?auto_360500 ?auto_360501 ) ) ( not ( = ?auto_360500 ?auto_360502 ) ) ( not ( = ?auto_360500 ?auto_360503 ) ) ( not ( = ?auto_360500 ?auto_360504 ) ) ( not ( = ?auto_360500 ?auto_360505 ) ) ( not ( = ?auto_360501 ?auto_360502 ) ) ( not ( = ?auto_360501 ?auto_360503 ) ) ( not ( = ?auto_360501 ?auto_360504 ) ) ( not ( = ?auto_360501 ?auto_360505 ) ) ( not ( = ?auto_360502 ?auto_360503 ) ) ( not ( = ?auto_360502 ?auto_360504 ) ) ( not ( = ?auto_360502 ?auto_360505 ) ) ( not ( = ?auto_360503 ?auto_360504 ) ) ( not ( = ?auto_360503 ?auto_360505 ) ) ( not ( = ?auto_360504 ?auto_360505 ) ) ( ON ?auto_360503 ?auto_360504 ) ( ON ?auto_360502 ?auto_360503 ) ( ON ?auto_360501 ?auto_360502 ) ( ON ?auto_360500 ?auto_360501 ) ( ON ?auto_360499 ?auto_360500 ) ( ON ?auto_360498 ?auto_360499 ) ( ON ?auto_360497 ?auto_360498 ) ( ON ?auto_360496 ?auto_360497 ) ( ON ?auto_360495 ?auto_360496 ) ( ON ?auto_360494 ?auto_360495 ) ( ON ?auto_360493 ?auto_360494 ) ( CLEAR ?auto_360491 ) ( ON ?auto_360492 ?auto_360493 ) ( CLEAR ?auto_360492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_360491 ?auto_360492 )
      ( MAKE-14PILE ?auto_360491 ?auto_360492 ?auto_360493 ?auto_360494 ?auto_360495 ?auto_360496 ?auto_360497 ?auto_360498 ?auto_360499 ?auto_360500 ?auto_360501 ?auto_360502 ?auto_360503 ?auto_360504 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360520 - BLOCK
      ?auto_360521 - BLOCK
      ?auto_360522 - BLOCK
      ?auto_360523 - BLOCK
      ?auto_360524 - BLOCK
      ?auto_360525 - BLOCK
      ?auto_360526 - BLOCK
      ?auto_360527 - BLOCK
      ?auto_360528 - BLOCK
      ?auto_360529 - BLOCK
      ?auto_360530 - BLOCK
      ?auto_360531 - BLOCK
      ?auto_360532 - BLOCK
      ?auto_360533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360533 ) ( ON-TABLE ?auto_360520 ) ( not ( = ?auto_360520 ?auto_360521 ) ) ( not ( = ?auto_360520 ?auto_360522 ) ) ( not ( = ?auto_360520 ?auto_360523 ) ) ( not ( = ?auto_360520 ?auto_360524 ) ) ( not ( = ?auto_360520 ?auto_360525 ) ) ( not ( = ?auto_360520 ?auto_360526 ) ) ( not ( = ?auto_360520 ?auto_360527 ) ) ( not ( = ?auto_360520 ?auto_360528 ) ) ( not ( = ?auto_360520 ?auto_360529 ) ) ( not ( = ?auto_360520 ?auto_360530 ) ) ( not ( = ?auto_360520 ?auto_360531 ) ) ( not ( = ?auto_360520 ?auto_360532 ) ) ( not ( = ?auto_360520 ?auto_360533 ) ) ( not ( = ?auto_360521 ?auto_360522 ) ) ( not ( = ?auto_360521 ?auto_360523 ) ) ( not ( = ?auto_360521 ?auto_360524 ) ) ( not ( = ?auto_360521 ?auto_360525 ) ) ( not ( = ?auto_360521 ?auto_360526 ) ) ( not ( = ?auto_360521 ?auto_360527 ) ) ( not ( = ?auto_360521 ?auto_360528 ) ) ( not ( = ?auto_360521 ?auto_360529 ) ) ( not ( = ?auto_360521 ?auto_360530 ) ) ( not ( = ?auto_360521 ?auto_360531 ) ) ( not ( = ?auto_360521 ?auto_360532 ) ) ( not ( = ?auto_360521 ?auto_360533 ) ) ( not ( = ?auto_360522 ?auto_360523 ) ) ( not ( = ?auto_360522 ?auto_360524 ) ) ( not ( = ?auto_360522 ?auto_360525 ) ) ( not ( = ?auto_360522 ?auto_360526 ) ) ( not ( = ?auto_360522 ?auto_360527 ) ) ( not ( = ?auto_360522 ?auto_360528 ) ) ( not ( = ?auto_360522 ?auto_360529 ) ) ( not ( = ?auto_360522 ?auto_360530 ) ) ( not ( = ?auto_360522 ?auto_360531 ) ) ( not ( = ?auto_360522 ?auto_360532 ) ) ( not ( = ?auto_360522 ?auto_360533 ) ) ( not ( = ?auto_360523 ?auto_360524 ) ) ( not ( = ?auto_360523 ?auto_360525 ) ) ( not ( = ?auto_360523 ?auto_360526 ) ) ( not ( = ?auto_360523 ?auto_360527 ) ) ( not ( = ?auto_360523 ?auto_360528 ) ) ( not ( = ?auto_360523 ?auto_360529 ) ) ( not ( = ?auto_360523 ?auto_360530 ) ) ( not ( = ?auto_360523 ?auto_360531 ) ) ( not ( = ?auto_360523 ?auto_360532 ) ) ( not ( = ?auto_360523 ?auto_360533 ) ) ( not ( = ?auto_360524 ?auto_360525 ) ) ( not ( = ?auto_360524 ?auto_360526 ) ) ( not ( = ?auto_360524 ?auto_360527 ) ) ( not ( = ?auto_360524 ?auto_360528 ) ) ( not ( = ?auto_360524 ?auto_360529 ) ) ( not ( = ?auto_360524 ?auto_360530 ) ) ( not ( = ?auto_360524 ?auto_360531 ) ) ( not ( = ?auto_360524 ?auto_360532 ) ) ( not ( = ?auto_360524 ?auto_360533 ) ) ( not ( = ?auto_360525 ?auto_360526 ) ) ( not ( = ?auto_360525 ?auto_360527 ) ) ( not ( = ?auto_360525 ?auto_360528 ) ) ( not ( = ?auto_360525 ?auto_360529 ) ) ( not ( = ?auto_360525 ?auto_360530 ) ) ( not ( = ?auto_360525 ?auto_360531 ) ) ( not ( = ?auto_360525 ?auto_360532 ) ) ( not ( = ?auto_360525 ?auto_360533 ) ) ( not ( = ?auto_360526 ?auto_360527 ) ) ( not ( = ?auto_360526 ?auto_360528 ) ) ( not ( = ?auto_360526 ?auto_360529 ) ) ( not ( = ?auto_360526 ?auto_360530 ) ) ( not ( = ?auto_360526 ?auto_360531 ) ) ( not ( = ?auto_360526 ?auto_360532 ) ) ( not ( = ?auto_360526 ?auto_360533 ) ) ( not ( = ?auto_360527 ?auto_360528 ) ) ( not ( = ?auto_360527 ?auto_360529 ) ) ( not ( = ?auto_360527 ?auto_360530 ) ) ( not ( = ?auto_360527 ?auto_360531 ) ) ( not ( = ?auto_360527 ?auto_360532 ) ) ( not ( = ?auto_360527 ?auto_360533 ) ) ( not ( = ?auto_360528 ?auto_360529 ) ) ( not ( = ?auto_360528 ?auto_360530 ) ) ( not ( = ?auto_360528 ?auto_360531 ) ) ( not ( = ?auto_360528 ?auto_360532 ) ) ( not ( = ?auto_360528 ?auto_360533 ) ) ( not ( = ?auto_360529 ?auto_360530 ) ) ( not ( = ?auto_360529 ?auto_360531 ) ) ( not ( = ?auto_360529 ?auto_360532 ) ) ( not ( = ?auto_360529 ?auto_360533 ) ) ( not ( = ?auto_360530 ?auto_360531 ) ) ( not ( = ?auto_360530 ?auto_360532 ) ) ( not ( = ?auto_360530 ?auto_360533 ) ) ( not ( = ?auto_360531 ?auto_360532 ) ) ( not ( = ?auto_360531 ?auto_360533 ) ) ( not ( = ?auto_360532 ?auto_360533 ) ) ( ON ?auto_360532 ?auto_360533 ) ( ON ?auto_360531 ?auto_360532 ) ( ON ?auto_360530 ?auto_360531 ) ( ON ?auto_360529 ?auto_360530 ) ( ON ?auto_360528 ?auto_360529 ) ( ON ?auto_360527 ?auto_360528 ) ( ON ?auto_360526 ?auto_360527 ) ( ON ?auto_360525 ?auto_360526 ) ( ON ?auto_360524 ?auto_360525 ) ( ON ?auto_360523 ?auto_360524 ) ( ON ?auto_360522 ?auto_360523 ) ( CLEAR ?auto_360520 ) ( ON ?auto_360521 ?auto_360522 ) ( CLEAR ?auto_360521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_360520 ?auto_360521 )
      ( MAKE-14PILE ?auto_360520 ?auto_360521 ?auto_360522 ?auto_360523 ?auto_360524 ?auto_360525 ?auto_360526 ?auto_360527 ?auto_360528 ?auto_360529 ?auto_360530 ?auto_360531 ?auto_360532 ?auto_360533 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360548 - BLOCK
      ?auto_360549 - BLOCK
      ?auto_360550 - BLOCK
      ?auto_360551 - BLOCK
      ?auto_360552 - BLOCK
      ?auto_360553 - BLOCK
      ?auto_360554 - BLOCK
      ?auto_360555 - BLOCK
      ?auto_360556 - BLOCK
      ?auto_360557 - BLOCK
      ?auto_360558 - BLOCK
      ?auto_360559 - BLOCK
      ?auto_360560 - BLOCK
      ?auto_360561 - BLOCK
    )
    :vars
    (
      ?auto_360562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_360561 ?auto_360562 ) ( not ( = ?auto_360548 ?auto_360549 ) ) ( not ( = ?auto_360548 ?auto_360550 ) ) ( not ( = ?auto_360548 ?auto_360551 ) ) ( not ( = ?auto_360548 ?auto_360552 ) ) ( not ( = ?auto_360548 ?auto_360553 ) ) ( not ( = ?auto_360548 ?auto_360554 ) ) ( not ( = ?auto_360548 ?auto_360555 ) ) ( not ( = ?auto_360548 ?auto_360556 ) ) ( not ( = ?auto_360548 ?auto_360557 ) ) ( not ( = ?auto_360548 ?auto_360558 ) ) ( not ( = ?auto_360548 ?auto_360559 ) ) ( not ( = ?auto_360548 ?auto_360560 ) ) ( not ( = ?auto_360548 ?auto_360561 ) ) ( not ( = ?auto_360548 ?auto_360562 ) ) ( not ( = ?auto_360549 ?auto_360550 ) ) ( not ( = ?auto_360549 ?auto_360551 ) ) ( not ( = ?auto_360549 ?auto_360552 ) ) ( not ( = ?auto_360549 ?auto_360553 ) ) ( not ( = ?auto_360549 ?auto_360554 ) ) ( not ( = ?auto_360549 ?auto_360555 ) ) ( not ( = ?auto_360549 ?auto_360556 ) ) ( not ( = ?auto_360549 ?auto_360557 ) ) ( not ( = ?auto_360549 ?auto_360558 ) ) ( not ( = ?auto_360549 ?auto_360559 ) ) ( not ( = ?auto_360549 ?auto_360560 ) ) ( not ( = ?auto_360549 ?auto_360561 ) ) ( not ( = ?auto_360549 ?auto_360562 ) ) ( not ( = ?auto_360550 ?auto_360551 ) ) ( not ( = ?auto_360550 ?auto_360552 ) ) ( not ( = ?auto_360550 ?auto_360553 ) ) ( not ( = ?auto_360550 ?auto_360554 ) ) ( not ( = ?auto_360550 ?auto_360555 ) ) ( not ( = ?auto_360550 ?auto_360556 ) ) ( not ( = ?auto_360550 ?auto_360557 ) ) ( not ( = ?auto_360550 ?auto_360558 ) ) ( not ( = ?auto_360550 ?auto_360559 ) ) ( not ( = ?auto_360550 ?auto_360560 ) ) ( not ( = ?auto_360550 ?auto_360561 ) ) ( not ( = ?auto_360550 ?auto_360562 ) ) ( not ( = ?auto_360551 ?auto_360552 ) ) ( not ( = ?auto_360551 ?auto_360553 ) ) ( not ( = ?auto_360551 ?auto_360554 ) ) ( not ( = ?auto_360551 ?auto_360555 ) ) ( not ( = ?auto_360551 ?auto_360556 ) ) ( not ( = ?auto_360551 ?auto_360557 ) ) ( not ( = ?auto_360551 ?auto_360558 ) ) ( not ( = ?auto_360551 ?auto_360559 ) ) ( not ( = ?auto_360551 ?auto_360560 ) ) ( not ( = ?auto_360551 ?auto_360561 ) ) ( not ( = ?auto_360551 ?auto_360562 ) ) ( not ( = ?auto_360552 ?auto_360553 ) ) ( not ( = ?auto_360552 ?auto_360554 ) ) ( not ( = ?auto_360552 ?auto_360555 ) ) ( not ( = ?auto_360552 ?auto_360556 ) ) ( not ( = ?auto_360552 ?auto_360557 ) ) ( not ( = ?auto_360552 ?auto_360558 ) ) ( not ( = ?auto_360552 ?auto_360559 ) ) ( not ( = ?auto_360552 ?auto_360560 ) ) ( not ( = ?auto_360552 ?auto_360561 ) ) ( not ( = ?auto_360552 ?auto_360562 ) ) ( not ( = ?auto_360553 ?auto_360554 ) ) ( not ( = ?auto_360553 ?auto_360555 ) ) ( not ( = ?auto_360553 ?auto_360556 ) ) ( not ( = ?auto_360553 ?auto_360557 ) ) ( not ( = ?auto_360553 ?auto_360558 ) ) ( not ( = ?auto_360553 ?auto_360559 ) ) ( not ( = ?auto_360553 ?auto_360560 ) ) ( not ( = ?auto_360553 ?auto_360561 ) ) ( not ( = ?auto_360553 ?auto_360562 ) ) ( not ( = ?auto_360554 ?auto_360555 ) ) ( not ( = ?auto_360554 ?auto_360556 ) ) ( not ( = ?auto_360554 ?auto_360557 ) ) ( not ( = ?auto_360554 ?auto_360558 ) ) ( not ( = ?auto_360554 ?auto_360559 ) ) ( not ( = ?auto_360554 ?auto_360560 ) ) ( not ( = ?auto_360554 ?auto_360561 ) ) ( not ( = ?auto_360554 ?auto_360562 ) ) ( not ( = ?auto_360555 ?auto_360556 ) ) ( not ( = ?auto_360555 ?auto_360557 ) ) ( not ( = ?auto_360555 ?auto_360558 ) ) ( not ( = ?auto_360555 ?auto_360559 ) ) ( not ( = ?auto_360555 ?auto_360560 ) ) ( not ( = ?auto_360555 ?auto_360561 ) ) ( not ( = ?auto_360555 ?auto_360562 ) ) ( not ( = ?auto_360556 ?auto_360557 ) ) ( not ( = ?auto_360556 ?auto_360558 ) ) ( not ( = ?auto_360556 ?auto_360559 ) ) ( not ( = ?auto_360556 ?auto_360560 ) ) ( not ( = ?auto_360556 ?auto_360561 ) ) ( not ( = ?auto_360556 ?auto_360562 ) ) ( not ( = ?auto_360557 ?auto_360558 ) ) ( not ( = ?auto_360557 ?auto_360559 ) ) ( not ( = ?auto_360557 ?auto_360560 ) ) ( not ( = ?auto_360557 ?auto_360561 ) ) ( not ( = ?auto_360557 ?auto_360562 ) ) ( not ( = ?auto_360558 ?auto_360559 ) ) ( not ( = ?auto_360558 ?auto_360560 ) ) ( not ( = ?auto_360558 ?auto_360561 ) ) ( not ( = ?auto_360558 ?auto_360562 ) ) ( not ( = ?auto_360559 ?auto_360560 ) ) ( not ( = ?auto_360559 ?auto_360561 ) ) ( not ( = ?auto_360559 ?auto_360562 ) ) ( not ( = ?auto_360560 ?auto_360561 ) ) ( not ( = ?auto_360560 ?auto_360562 ) ) ( not ( = ?auto_360561 ?auto_360562 ) ) ( ON ?auto_360560 ?auto_360561 ) ( ON ?auto_360559 ?auto_360560 ) ( ON ?auto_360558 ?auto_360559 ) ( ON ?auto_360557 ?auto_360558 ) ( ON ?auto_360556 ?auto_360557 ) ( ON ?auto_360555 ?auto_360556 ) ( ON ?auto_360554 ?auto_360555 ) ( ON ?auto_360553 ?auto_360554 ) ( ON ?auto_360552 ?auto_360553 ) ( ON ?auto_360551 ?auto_360552 ) ( ON ?auto_360550 ?auto_360551 ) ( ON ?auto_360549 ?auto_360550 ) ( ON ?auto_360548 ?auto_360549 ) ( CLEAR ?auto_360548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_360548 )
      ( MAKE-14PILE ?auto_360548 ?auto_360549 ?auto_360550 ?auto_360551 ?auto_360552 ?auto_360553 ?auto_360554 ?auto_360555 ?auto_360556 ?auto_360557 ?auto_360558 ?auto_360559 ?auto_360560 ?auto_360561 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360577 - BLOCK
      ?auto_360578 - BLOCK
      ?auto_360579 - BLOCK
      ?auto_360580 - BLOCK
      ?auto_360581 - BLOCK
      ?auto_360582 - BLOCK
      ?auto_360583 - BLOCK
      ?auto_360584 - BLOCK
      ?auto_360585 - BLOCK
      ?auto_360586 - BLOCK
      ?auto_360587 - BLOCK
      ?auto_360588 - BLOCK
      ?auto_360589 - BLOCK
      ?auto_360590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_360590 ) ( not ( = ?auto_360577 ?auto_360578 ) ) ( not ( = ?auto_360577 ?auto_360579 ) ) ( not ( = ?auto_360577 ?auto_360580 ) ) ( not ( = ?auto_360577 ?auto_360581 ) ) ( not ( = ?auto_360577 ?auto_360582 ) ) ( not ( = ?auto_360577 ?auto_360583 ) ) ( not ( = ?auto_360577 ?auto_360584 ) ) ( not ( = ?auto_360577 ?auto_360585 ) ) ( not ( = ?auto_360577 ?auto_360586 ) ) ( not ( = ?auto_360577 ?auto_360587 ) ) ( not ( = ?auto_360577 ?auto_360588 ) ) ( not ( = ?auto_360577 ?auto_360589 ) ) ( not ( = ?auto_360577 ?auto_360590 ) ) ( not ( = ?auto_360578 ?auto_360579 ) ) ( not ( = ?auto_360578 ?auto_360580 ) ) ( not ( = ?auto_360578 ?auto_360581 ) ) ( not ( = ?auto_360578 ?auto_360582 ) ) ( not ( = ?auto_360578 ?auto_360583 ) ) ( not ( = ?auto_360578 ?auto_360584 ) ) ( not ( = ?auto_360578 ?auto_360585 ) ) ( not ( = ?auto_360578 ?auto_360586 ) ) ( not ( = ?auto_360578 ?auto_360587 ) ) ( not ( = ?auto_360578 ?auto_360588 ) ) ( not ( = ?auto_360578 ?auto_360589 ) ) ( not ( = ?auto_360578 ?auto_360590 ) ) ( not ( = ?auto_360579 ?auto_360580 ) ) ( not ( = ?auto_360579 ?auto_360581 ) ) ( not ( = ?auto_360579 ?auto_360582 ) ) ( not ( = ?auto_360579 ?auto_360583 ) ) ( not ( = ?auto_360579 ?auto_360584 ) ) ( not ( = ?auto_360579 ?auto_360585 ) ) ( not ( = ?auto_360579 ?auto_360586 ) ) ( not ( = ?auto_360579 ?auto_360587 ) ) ( not ( = ?auto_360579 ?auto_360588 ) ) ( not ( = ?auto_360579 ?auto_360589 ) ) ( not ( = ?auto_360579 ?auto_360590 ) ) ( not ( = ?auto_360580 ?auto_360581 ) ) ( not ( = ?auto_360580 ?auto_360582 ) ) ( not ( = ?auto_360580 ?auto_360583 ) ) ( not ( = ?auto_360580 ?auto_360584 ) ) ( not ( = ?auto_360580 ?auto_360585 ) ) ( not ( = ?auto_360580 ?auto_360586 ) ) ( not ( = ?auto_360580 ?auto_360587 ) ) ( not ( = ?auto_360580 ?auto_360588 ) ) ( not ( = ?auto_360580 ?auto_360589 ) ) ( not ( = ?auto_360580 ?auto_360590 ) ) ( not ( = ?auto_360581 ?auto_360582 ) ) ( not ( = ?auto_360581 ?auto_360583 ) ) ( not ( = ?auto_360581 ?auto_360584 ) ) ( not ( = ?auto_360581 ?auto_360585 ) ) ( not ( = ?auto_360581 ?auto_360586 ) ) ( not ( = ?auto_360581 ?auto_360587 ) ) ( not ( = ?auto_360581 ?auto_360588 ) ) ( not ( = ?auto_360581 ?auto_360589 ) ) ( not ( = ?auto_360581 ?auto_360590 ) ) ( not ( = ?auto_360582 ?auto_360583 ) ) ( not ( = ?auto_360582 ?auto_360584 ) ) ( not ( = ?auto_360582 ?auto_360585 ) ) ( not ( = ?auto_360582 ?auto_360586 ) ) ( not ( = ?auto_360582 ?auto_360587 ) ) ( not ( = ?auto_360582 ?auto_360588 ) ) ( not ( = ?auto_360582 ?auto_360589 ) ) ( not ( = ?auto_360582 ?auto_360590 ) ) ( not ( = ?auto_360583 ?auto_360584 ) ) ( not ( = ?auto_360583 ?auto_360585 ) ) ( not ( = ?auto_360583 ?auto_360586 ) ) ( not ( = ?auto_360583 ?auto_360587 ) ) ( not ( = ?auto_360583 ?auto_360588 ) ) ( not ( = ?auto_360583 ?auto_360589 ) ) ( not ( = ?auto_360583 ?auto_360590 ) ) ( not ( = ?auto_360584 ?auto_360585 ) ) ( not ( = ?auto_360584 ?auto_360586 ) ) ( not ( = ?auto_360584 ?auto_360587 ) ) ( not ( = ?auto_360584 ?auto_360588 ) ) ( not ( = ?auto_360584 ?auto_360589 ) ) ( not ( = ?auto_360584 ?auto_360590 ) ) ( not ( = ?auto_360585 ?auto_360586 ) ) ( not ( = ?auto_360585 ?auto_360587 ) ) ( not ( = ?auto_360585 ?auto_360588 ) ) ( not ( = ?auto_360585 ?auto_360589 ) ) ( not ( = ?auto_360585 ?auto_360590 ) ) ( not ( = ?auto_360586 ?auto_360587 ) ) ( not ( = ?auto_360586 ?auto_360588 ) ) ( not ( = ?auto_360586 ?auto_360589 ) ) ( not ( = ?auto_360586 ?auto_360590 ) ) ( not ( = ?auto_360587 ?auto_360588 ) ) ( not ( = ?auto_360587 ?auto_360589 ) ) ( not ( = ?auto_360587 ?auto_360590 ) ) ( not ( = ?auto_360588 ?auto_360589 ) ) ( not ( = ?auto_360588 ?auto_360590 ) ) ( not ( = ?auto_360589 ?auto_360590 ) ) ( ON ?auto_360589 ?auto_360590 ) ( ON ?auto_360588 ?auto_360589 ) ( ON ?auto_360587 ?auto_360588 ) ( ON ?auto_360586 ?auto_360587 ) ( ON ?auto_360585 ?auto_360586 ) ( ON ?auto_360584 ?auto_360585 ) ( ON ?auto_360583 ?auto_360584 ) ( ON ?auto_360582 ?auto_360583 ) ( ON ?auto_360581 ?auto_360582 ) ( ON ?auto_360580 ?auto_360581 ) ( ON ?auto_360579 ?auto_360580 ) ( ON ?auto_360578 ?auto_360579 ) ( ON ?auto_360577 ?auto_360578 ) ( CLEAR ?auto_360577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_360577 )
      ( MAKE-14PILE ?auto_360577 ?auto_360578 ?auto_360579 ?auto_360580 ?auto_360581 ?auto_360582 ?auto_360583 ?auto_360584 ?auto_360585 ?auto_360586 ?auto_360587 ?auto_360588 ?auto_360589 ?auto_360590 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_360605 - BLOCK
      ?auto_360606 - BLOCK
      ?auto_360607 - BLOCK
      ?auto_360608 - BLOCK
      ?auto_360609 - BLOCK
      ?auto_360610 - BLOCK
      ?auto_360611 - BLOCK
      ?auto_360612 - BLOCK
      ?auto_360613 - BLOCK
      ?auto_360614 - BLOCK
      ?auto_360615 - BLOCK
      ?auto_360616 - BLOCK
      ?auto_360617 - BLOCK
      ?auto_360618 - BLOCK
    )
    :vars
    (
      ?auto_360619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_360605 ?auto_360606 ) ) ( not ( = ?auto_360605 ?auto_360607 ) ) ( not ( = ?auto_360605 ?auto_360608 ) ) ( not ( = ?auto_360605 ?auto_360609 ) ) ( not ( = ?auto_360605 ?auto_360610 ) ) ( not ( = ?auto_360605 ?auto_360611 ) ) ( not ( = ?auto_360605 ?auto_360612 ) ) ( not ( = ?auto_360605 ?auto_360613 ) ) ( not ( = ?auto_360605 ?auto_360614 ) ) ( not ( = ?auto_360605 ?auto_360615 ) ) ( not ( = ?auto_360605 ?auto_360616 ) ) ( not ( = ?auto_360605 ?auto_360617 ) ) ( not ( = ?auto_360605 ?auto_360618 ) ) ( not ( = ?auto_360606 ?auto_360607 ) ) ( not ( = ?auto_360606 ?auto_360608 ) ) ( not ( = ?auto_360606 ?auto_360609 ) ) ( not ( = ?auto_360606 ?auto_360610 ) ) ( not ( = ?auto_360606 ?auto_360611 ) ) ( not ( = ?auto_360606 ?auto_360612 ) ) ( not ( = ?auto_360606 ?auto_360613 ) ) ( not ( = ?auto_360606 ?auto_360614 ) ) ( not ( = ?auto_360606 ?auto_360615 ) ) ( not ( = ?auto_360606 ?auto_360616 ) ) ( not ( = ?auto_360606 ?auto_360617 ) ) ( not ( = ?auto_360606 ?auto_360618 ) ) ( not ( = ?auto_360607 ?auto_360608 ) ) ( not ( = ?auto_360607 ?auto_360609 ) ) ( not ( = ?auto_360607 ?auto_360610 ) ) ( not ( = ?auto_360607 ?auto_360611 ) ) ( not ( = ?auto_360607 ?auto_360612 ) ) ( not ( = ?auto_360607 ?auto_360613 ) ) ( not ( = ?auto_360607 ?auto_360614 ) ) ( not ( = ?auto_360607 ?auto_360615 ) ) ( not ( = ?auto_360607 ?auto_360616 ) ) ( not ( = ?auto_360607 ?auto_360617 ) ) ( not ( = ?auto_360607 ?auto_360618 ) ) ( not ( = ?auto_360608 ?auto_360609 ) ) ( not ( = ?auto_360608 ?auto_360610 ) ) ( not ( = ?auto_360608 ?auto_360611 ) ) ( not ( = ?auto_360608 ?auto_360612 ) ) ( not ( = ?auto_360608 ?auto_360613 ) ) ( not ( = ?auto_360608 ?auto_360614 ) ) ( not ( = ?auto_360608 ?auto_360615 ) ) ( not ( = ?auto_360608 ?auto_360616 ) ) ( not ( = ?auto_360608 ?auto_360617 ) ) ( not ( = ?auto_360608 ?auto_360618 ) ) ( not ( = ?auto_360609 ?auto_360610 ) ) ( not ( = ?auto_360609 ?auto_360611 ) ) ( not ( = ?auto_360609 ?auto_360612 ) ) ( not ( = ?auto_360609 ?auto_360613 ) ) ( not ( = ?auto_360609 ?auto_360614 ) ) ( not ( = ?auto_360609 ?auto_360615 ) ) ( not ( = ?auto_360609 ?auto_360616 ) ) ( not ( = ?auto_360609 ?auto_360617 ) ) ( not ( = ?auto_360609 ?auto_360618 ) ) ( not ( = ?auto_360610 ?auto_360611 ) ) ( not ( = ?auto_360610 ?auto_360612 ) ) ( not ( = ?auto_360610 ?auto_360613 ) ) ( not ( = ?auto_360610 ?auto_360614 ) ) ( not ( = ?auto_360610 ?auto_360615 ) ) ( not ( = ?auto_360610 ?auto_360616 ) ) ( not ( = ?auto_360610 ?auto_360617 ) ) ( not ( = ?auto_360610 ?auto_360618 ) ) ( not ( = ?auto_360611 ?auto_360612 ) ) ( not ( = ?auto_360611 ?auto_360613 ) ) ( not ( = ?auto_360611 ?auto_360614 ) ) ( not ( = ?auto_360611 ?auto_360615 ) ) ( not ( = ?auto_360611 ?auto_360616 ) ) ( not ( = ?auto_360611 ?auto_360617 ) ) ( not ( = ?auto_360611 ?auto_360618 ) ) ( not ( = ?auto_360612 ?auto_360613 ) ) ( not ( = ?auto_360612 ?auto_360614 ) ) ( not ( = ?auto_360612 ?auto_360615 ) ) ( not ( = ?auto_360612 ?auto_360616 ) ) ( not ( = ?auto_360612 ?auto_360617 ) ) ( not ( = ?auto_360612 ?auto_360618 ) ) ( not ( = ?auto_360613 ?auto_360614 ) ) ( not ( = ?auto_360613 ?auto_360615 ) ) ( not ( = ?auto_360613 ?auto_360616 ) ) ( not ( = ?auto_360613 ?auto_360617 ) ) ( not ( = ?auto_360613 ?auto_360618 ) ) ( not ( = ?auto_360614 ?auto_360615 ) ) ( not ( = ?auto_360614 ?auto_360616 ) ) ( not ( = ?auto_360614 ?auto_360617 ) ) ( not ( = ?auto_360614 ?auto_360618 ) ) ( not ( = ?auto_360615 ?auto_360616 ) ) ( not ( = ?auto_360615 ?auto_360617 ) ) ( not ( = ?auto_360615 ?auto_360618 ) ) ( not ( = ?auto_360616 ?auto_360617 ) ) ( not ( = ?auto_360616 ?auto_360618 ) ) ( not ( = ?auto_360617 ?auto_360618 ) ) ( ON ?auto_360605 ?auto_360619 ) ( not ( = ?auto_360618 ?auto_360619 ) ) ( not ( = ?auto_360617 ?auto_360619 ) ) ( not ( = ?auto_360616 ?auto_360619 ) ) ( not ( = ?auto_360615 ?auto_360619 ) ) ( not ( = ?auto_360614 ?auto_360619 ) ) ( not ( = ?auto_360613 ?auto_360619 ) ) ( not ( = ?auto_360612 ?auto_360619 ) ) ( not ( = ?auto_360611 ?auto_360619 ) ) ( not ( = ?auto_360610 ?auto_360619 ) ) ( not ( = ?auto_360609 ?auto_360619 ) ) ( not ( = ?auto_360608 ?auto_360619 ) ) ( not ( = ?auto_360607 ?auto_360619 ) ) ( not ( = ?auto_360606 ?auto_360619 ) ) ( not ( = ?auto_360605 ?auto_360619 ) ) ( ON ?auto_360606 ?auto_360605 ) ( ON ?auto_360607 ?auto_360606 ) ( ON ?auto_360608 ?auto_360607 ) ( ON ?auto_360609 ?auto_360608 ) ( ON ?auto_360610 ?auto_360609 ) ( ON ?auto_360611 ?auto_360610 ) ( ON ?auto_360612 ?auto_360611 ) ( ON ?auto_360613 ?auto_360612 ) ( ON ?auto_360614 ?auto_360613 ) ( ON ?auto_360615 ?auto_360614 ) ( ON ?auto_360616 ?auto_360615 ) ( ON ?auto_360617 ?auto_360616 ) ( ON ?auto_360618 ?auto_360617 ) ( CLEAR ?auto_360618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_360618 ?auto_360617 ?auto_360616 ?auto_360615 ?auto_360614 ?auto_360613 ?auto_360612 ?auto_360611 ?auto_360610 ?auto_360609 ?auto_360608 ?auto_360607 ?auto_360606 ?auto_360605 )
      ( MAKE-14PILE ?auto_360605 ?auto_360606 ?auto_360607 ?auto_360608 ?auto_360609 ?auto_360610 ?auto_360611 ?auto_360612 ?auto_360613 ?auto_360614 ?auto_360615 ?auto_360616 ?auto_360617 ?auto_360618 ) )
  )

)

