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
      ?auto_81455 - BLOCK
      ?auto_81456 - BLOCK
      ?auto_81457 - BLOCK
      ?auto_81458 - BLOCK
      ?auto_81459 - BLOCK
      ?auto_81460 - BLOCK
      ?auto_81461 - BLOCK
    )
    :vars
    (
      ?auto_81462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81462 ?auto_81461 ) ( CLEAR ?auto_81462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81455 ) ( ON ?auto_81456 ?auto_81455 ) ( ON ?auto_81457 ?auto_81456 ) ( ON ?auto_81458 ?auto_81457 ) ( ON ?auto_81459 ?auto_81458 ) ( ON ?auto_81460 ?auto_81459 ) ( ON ?auto_81461 ?auto_81460 ) ( not ( = ?auto_81455 ?auto_81456 ) ) ( not ( = ?auto_81455 ?auto_81457 ) ) ( not ( = ?auto_81455 ?auto_81458 ) ) ( not ( = ?auto_81455 ?auto_81459 ) ) ( not ( = ?auto_81455 ?auto_81460 ) ) ( not ( = ?auto_81455 ?auto_81461 ) ) ( not ( = ?auto_81455 ?auto_81462 ) ) ( not ( = ?auto_81456 ?auto_81457 ) ) ( not ( = ?auto_81456 ?auto_81458 ) ) ( not ( = ?auto_81456 ?auto_81459 ) ) ( not ( = ?auto_81456 ?auto_81460 ) ) ( not ( = ?auto_81456 ?auto_81461 ) ) ( not ( = ?auto_81456 ?auto_81462 ) ) ( not ( = ?auto_81457 ?auto_81458 ) ) ( not ( = ?auto_81457 ?auto_81459 ) ) ( not ( = ?auto_81457 ?auto_81460 ) ) ( not ( = ?auto_81457 ?auto_81461 ) ) ( not ( = ?auto_81457 ?auto_81462 ) ) ( not ( = ?auto_81458 ?auto_81459 ) ) ( not ( = ?auto_81458 ?auto_81460 ) ) ( not ( = ?auto_81458 ?auto_81461 ) ) ( not ( = ?auto_81458 ?auto_81462 ) ) ( not ( = ?auto_81459 ?auto_81460 ) ) ( not ( = ?auto_81459 ?auto_81461 ) ) ( not ( = ?auto_81459 ?auto_81462 ) ) ( not ( = ?auto_81460 ?auto_81461 ) ) ( not ( = ?auto_81460 ?auto_81462 ) ) ( not ( = ?auto_81461 ?auto_81462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81462 ?auto_81461 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81464 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81464 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_81464 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_81465 - BLOCK
    )
    :vars
    (
      ?auto_81466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81465 ?auto_81466 ) ( CLEAR ?auto_81465 ) ( HAND-EMPTY ) ( not ( = ?auto_81465 ?auto_81466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81465 ?auto_81466 )
      ( MAKE-1PILE ?auto_81465 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81473 - BLOCK
      ?auto_81474 - BLOCK
      ?auto_81475 - BLOCK
      ?auto_81476 - BLOCK
      ?auto_81477 - BLOCK
      ?auto_81478 - BLOCK
    )
    :vars
    (
      ?auto_81479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81479 ?auto_81478 ) ( CLEAR ?auto_81479 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81473 ) ( ON ?auto_81474 ?auto_81473 ) ( ON ?auto_81475 ?auto_81474 ) ( ON ?auto_81476 ?auto_81475 ) ( ON ?auto_81477 ?auto_81476 ) ( ON ?auto_81478 ?auto_81477 ) ( not ( = ?auto_81473 ?auto_81474 ) ) ( not ( = ?auto_81473 ?auto_81475 ) ) ( not ( = ?auto_81473 ?auto_81476 ) ) ( not ( = ?auto_81473 ?auto_81477 ) ) ( not ( = ?auto_81473 ?auto_81478 ) ) ( not ( = ?auto_81473 ?auto_81479 ) ) ( not ( = ?auto_81474 ?auto_81475 ) ) ( not ( = ?auto_81474 ?auto_81476 ) ) ( not ( = ?auto_81474 ?auto_81477 ) ) ( not ( = ?auto_81474 ?auto_81478 ) ) ( not ( = ?auto_81474 ?auto_81479 ) ) ( not ( = ?auto_81475 ?auto_81476 ) ) ( not ( = ?auto_81475 ?auto_81477 ) ) ( not ( = ?auto_81475 ?auto_81478 ) ) ( not ( = ?auto_81475 ?auto_81479 ) ) ( not ( = ?auto_81476 ?auto_81477 ) ) ( not ( = ?auto_81476 ?auto_81478 ) ) ( not ( = ?auto_81476 ?auto_81479 ) ) ( not ( = ?auto_81477 ?auto_81478 ) ) ( not ( = ?auto_81477 ?auto_81479 ) ) ( not ( = ?auto_81478 ?auto_81479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81479 ?auto_81478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81480 - BLOCK
      ?auto_81481 - BLOCK
      ?auto_81482 - BLOCK
      ?auto_81483 - BLOCK
      ?auto_81484 - BLOCK
      ?auto_81485 - BLOCK
    )
    :vars
    (
      ?auto_81486 - BLOCK
      ?auto_81487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81486 ?auto_81485 ) ( CLEAR ?auto_81486 ) ( ON-TABLE ?auto_81480 ) ( ON ?auto_81481 ?auto_81480 ) ( ON ?auto_81482 ?auto_81481 ) ( ON ?auto_81483 ?auto_81482 ) ( ON ?auto_81484 ?auto_81483 ) ( ON ?auto_81485 ?auto_81484 ) ( not ( = ?auto_81480 ?auto_81481 ) ) ( not ( = ?auto_81480 ?auto_81482 ) ) ( not ( = ?auto_81480 ?auto_81483 ) ) ( not ( = ?auto_81480 ?auto_81484 ) ) ( not ( = ?auto_81480 ?auto_81485 ) ) ( not ( = ?auto_81480 ?auto_81486 ) ) ( not ( = ?auto_81481 ?auto_81482 ) ) ( not ( = ?auto_81481 ?auto_81483 ) ) ( not ( = ?auto_81481 ?auto_81484 ) ) ( not ( = ?auto_81481 ?auto_81485 ) ) ( not ( = ?auto_81481 ?auto_81486 ) ) ( not ( = ?auto_81482 ?auto_81483 ) ) ( not ( = ?auto_81482 ?auto_81484 ) ) ( not ( = ?auto_81482 ?auto_81485 ) ) ( not ( = ?auto_81482 ?auto_81486 ) ) ( not ( = ?auto_81483 ?auto_81484 ) ) ( not ( = ?auto_81483 ?auto_81485 ) ) ( not ( = ?auto_81483 ?auto_81486 ) ) ( not ( = ?auto_81484 ?auto_81485 ) ) ( not ( = ?auto_81484 ?auto_81486 ) ) ( not ( = ?auto_81485 ?auto_81486 ) ) ( HOLDING ?auto_81487 ) ( not ( = ?auto_81480 ?auto_81487 ) ) ( not ( = ?auto_81481 ?auto_81487 ) ) ( not ( = ?auto_81482 ?auto_81487 ) ) ( not ( = ?auto_81483 ?auto_81487 ) ) ( not ( = ?auto_81484 ?auto_81487 ) ) ( not ( = ?auto_81485 ?auto_81487 ) ) ( not ( = ?auto_81486 ?auto_81487 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_81487 )
      ( MAKE-6PILE ?auto_81480 ?auto_81481 ?auto_81482 ?auto_81483 ?auto_81484 ?auto_81485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81488 - BLOCK
      ?auto_81489 - BLOCK
      ?auto_81490 - BLOCK
      ?auto_81491 - BLOCK
      ?auto_81492 - BLOCK
      ?auto_81493 - BLOCK
    )
    :vars
    (
      ?auto_81495 - BLOCK
      ?auto_81494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81495 ?auto_81493 ) ( ON-TABLE ?auto_81488 ) ( ON ?auto_81489 ?auto_81488 ) ( ON ?auto_81490 ?auto_81489 ) ( ON ?auto_81491 ?auto_81490 ) ( ON ?auto_81492 ?auto_81491 ) ( ON ?auto_81493 ?auto_81492 ) ( not ( = ?auto_81488 ?auto_81489 ) ) ( not ( = ?auto_81488 ?auto_81490 ) ) ( not ( = ?auto_81488 ?auto_81491 ) ) ( not ( = ?auto_81488 ?auto_81492 ) ) ( not ( = ?auto_81488 ?auto_81493 ) ) ( not ( = ?auto_81488 ?auto_81495 ) ) ( not ( = ?auto_81489 ?auto_81490 ) ) ( not ( = ?auto_81489 ?auto_81491 ) ) ( not ( = ?auto_81489 ?auto_81492 ) ) ( not ( = ?auto_81489 ?auto_81493 ) ) ( not ( = ?auto_81489 ?auto_81495 ) ) ( not ( = ?auto_81490 ?auto_81491 ) ) ( not ( = ?auto_81490 ?auto_81492 ) ) ( not ( = ?auto_81490 ?auto_81493 ) ) ( not ( = ?auto_81490 ?auto_81495 ) ) ( not ( = ?auto_81491 ?auto_81492 ) ) ( not ( = ?auto_81491 ?auto_81493 ) ) ( not ( = ?auto_81491 ?auto_81495 ) ) ( not ( = ?auto_81492 ?auto_81493 ) ) ( not ( = ?auto_81492 ?auto_81495 ) ) ( not ( = ?auto_81493 ?auto_81495 ) ) ( not ( = ?auto_81488 ?auto_81494 ) ) ( not ( = ?auto_81489 ?auto_81494 ) ) ( not ( = ?auto_81490 ?auto_81494 ) ) ( not ( = ?auto_81491 ?auto_81494 ) ) ( not ( = ?auto_81492 ?auto_81494 ) ) ( not ( = ?auto_81493 ?auto_81494 ) ) ( not ( = ?auto_81495 ?auto_81494 ) ) ( ON ?auto_81494 ?auto_81495 ) ( CLEAR ?auto_81494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81488 ?auto_81489 ?auto_81490 ?auto_81491 ?auto_81492 ?auto_81493 ?auto_81495 )
      ( MAKE-6PILE ?auto_81488 ?auto_81489 ?auto_81490 ?auto_81491 ?auto_81492 ?auto_81493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81498 - BLOCK
      ?auto_81499 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81499 ) ( CLEAR ?auto_81498 ) ( ON-TABLE ?auto_81498 ) ( not ( = ?auto_81498 ?auto_81499 ) ) )
    :subtasks
    ( ( !STACK ?auto_81499 ?auto_81498 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81500 - BLOCK
      ?auto_81501 - BLOCK
    )
    :vars
    (
      ?auto_81502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81500 ) ( ON-TABLE ?auto_81500 ) ( not ( = ?auto_81500 ?auto_81501 ) ) ( ON ?auto_81501 ?auto_81502 ) ( CLEAR ?auto_81501 ) ( HAND-EMPTY ) ( not ( = ?auto_81500 ?auto_81502 ) ) ( not ( = ?auto_81501 ?auto_81502 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81501 ?auto_81502 )
      ( MAKE-2PILE ?auto_81500 ?auto_81501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81503 - BLOCK
      ?auto_81504 - BLOCK
    )
    :vars
    (
      ?auto_81505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81503 ?auto_81504 ) ) ( ON ?auto_81504 ?auto_81505 ) ( CLEAR ?auto_81504 ) ( not ( = ?auto_81503 ?auto_81505 ) ) ( not ( = ?auto_81504 ?auto_81505 ) ) ( HOLDING ?auto_81503 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81503 )
      ( MAKE-2PILE ?auto_81503 ?auto_81504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81506 - BLOCK
      ?auto_81507 - BLOCK
    )
    :vars
    (
      ?auto_81508 - BLOCK
      ?auto_81509 - BLOCK
      ?auto_81513 - BLOCK
      ?auto_81512 - BLOCK
      ?auto_81511 - BLOCK
      ?auto_81510 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81506 ?auto_81507 ) ) ( ON ?auto_81507 ?auto_81508 ) ( not ( = ?auto_81506 ?auto_81508 ) ) ( not ( = ?auto_81507 ?auto_81508 ) ) ( ON ?auto_81506 ?auto_81507 ) ( CLEAR ?auto_81506 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81509 ) ( ON ?auto_81513 ?auto_81509 ) ( ON ?auto_81512 ?auto_81513 ) ( ON ?auto_81511 ?auto_81512 ) ( ON ?auto_81510 ?auto_81511 ) ( ON ?auto_81508 ?auto_81510 ) ( not ( = ?auto_81509 ?auto_81513 ) ) ( not ( = ?auto_81509 ?auto_81512 ) ) ( not ( = ?auto_81509 ?auto_81511 ) ) ( not ( = ?auto_81509 ?auto_81510 ) ) ( not ( = ?auto_81509 ?auto_81508 ) ) ( not ( = ?auto_81509 ?auto_81507 ) ) ( not ( = ?auto_81509 ?auto_81506 ) ) ( not ( = ?auto_81513 ?auto_81512 ) ) ( not ( = ?auto_81513 ?auto_81511 ) ) ( not ( = ?auto_81513 ?auto_81510 ) ) ( not ( = ?auto_81513 ?auto_81508 ) ) ( not ( = ?auto_81513 ?auto_81507 ) ) ( not ( = ?auto_81513 ?auto_81506 ) ) ( not ( = ?auto_81512 ?auto_81511 ) ) ( not ( = ?auto_81512 ?auto_81510 ) ) ( not ( = ?auto_81512 ?auto_81508 ) ) ( not ( = ?auto_81512 ?auto_81507 ) ) ( not ( = ?auto_81512 ?auto_81506 ) ) ( not ( = ?auto_81511 ?auto_81510 ) ) ( not ( = ?auto_81511 ?auto_81508 ) ) ( not ( = ?auto_81511 ?auto_81507 ) ) ( not ( = ?auto_81511 ?auto_81506 ) ) ( not ( = ?auto_81510 ?auto_81508 ) ) ( not ( = ?auto_81510 ?auto_81507 ) ) ( not ( = ?auto_81510 ?auto_81506 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81509 ?auto_81513 ?auto_81512 ?auto_81511 ?auto_81510 ?auto_81508 ?auto_81507 )
      ( MAKE-2PILE ?auto_81506 ?auto_81507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81519 - BLOCK
      ?auto_81520 - BLOCK
      ?auto_81521 - BLOCK
      ?auto_81522 - BLOCK
      ?auto_81523 - BLOCK
    )
    :vars
    (
      ?auto_81524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81524 ?auto_81523 ) ( CLEAR ?auto_81524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81519 ) ( ON ?auto_81520 ?auto_81519 ) ( ON ?auto_81521 ?auto_81520 ) ( ON ?auto_81522 ?auto_81521 ) ( ON ?auto_81523 ?auto_81522 ) ( not ( = ?auto_81519 ?auto_81520 ) ) ( not ( = ?auto_81519 ?auto_81521 ) ) ( not ( = ?auto_81519 ?auto_81522 ) ) ( not ( = ?auto_81519 ?auto_81523 ) ) ( not ( = ?auto_81519 ?auto_81524 ) ) ( not ( = ?auto_81520 ?auto_81521 ) ) ( not ( = ?auto_81520 ?auto_81522 ) ) ( not ( = ?auto_81520 ?auto_81523 ) ) ( not ( = ?auto_81520 ?auto_81524 ) ) ( not ( = ?auto_81521 ?auto_81522 ) ) ( not ( = ?auto_81521 ?auto_81523 ) ) ( not ( = ?auto_81521 ?auto_81524 ) ) ( not ( = ?auto_81522 ?auto_81523 ) ) ( not ( = ?auto_81522 ?auto_81524 ) ) ( not ( = ?auto_81523 ?auto_81524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81524 ?auto_81523 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81525 - BLOCK
      ?auto_81526 - BLOCK
      ?auto_81527 - BLOCK
      ?auto_81528 - BLOCK
      ?auto_81529 - BLOCK
    )
    :vars
    (
      ?auto_81530 - BLOCK
      ?auto_81531 - BLOCK
      ?auto_81532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81530 ?auto_81529 ) ( CLEAR ?auto_81530 ) ( ON-TABLE ?auto_81525 ) ( ON ?auto_81526 ?auto_81525 ) ( ON ?auto_81527 ?auto_81526 ) ( ON ?auto_81528 ?auto_81527 ) ( ON ?auto_81529 ?auto_81528 ) ( not ( = ?auto_81525 ?auto_81526 ) ) ( not ( = ?auto_81525 ?auto_81527 ) ) ( not ( = ?auto_81525 ?auto_81528 ) ) ( not ( = ?auto_81525 ?auto_81529 ) ) ( not ( = ?auto_81525 ?auto_81530 ) ) ( not ( = ?auto_81526 ?auto_81527 ) ) ( not ( = ?auto_81526 ?auto_81528 ) ) ( not ( = ?auto_81526 ?auto_81529 ) ) ( not ( = ?auto_81526 ?auto_81530 ) ) ( not ( = ?auto_81527 ?auto_81528 ) ) ( not ( = ?auto_81527 ?auto_81529 ) ) ( not ( = ?auto_81527 ?auto_81530 ) ) ( not ( = ?auto_81528 ?auto_81529 ) ) ( not ( = ?auto_81528 ?auto_81530 ) ) ( not ( = ?auto_81529 ?auto_81530 ) ) ( HOLDING ?auto_81531 ) ( CLEAR ?auto_81532 ) ( not ( = ?auto_81525 ?auto_81531 ) ) ( not ( = ?auto_81525 ?auto_81532 ) ) ( not ( = ?auto_81526 ?auto_81531 ) ) ( not ( = ?auto_81526 ?auto_81532 ) ) ( not ( = ?auto_81527 ?auto_81531 ) ) ( not ( = ?auto_81527 ?auto_81532 ) ) ( not ( = ?auto_81528 ?auto_81531 ) ) ( not ( = ?auto_81528 ?auto_81532 ) ) ( not ( = ?auto_81529 ?auto_81531 ) ) ( not ( = ?auto_81529 ?auto_81532 ) ) ( not ( = ?auto_81530 ?auto_81531 ) ) ( not ( = ?auto_81530 ?auto_81532 ) ) ( not ( = ?auto_81531 ?auto_81532 ) ) )
    :subtasks
    ( ( !STACK ?auto_81531 ?auto_81532 )
      ( MAKE-5PILE ?auto_81525 ?auto_81526 ?auto_81527 ?auto_81528 ?auto_81529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81533 - BLOCK
      ?auto_81534 - BLOCK
      ?auto_81535 - BLOCK
      ?auto_81536 - BLOCK
      ?auto_81537 - BLOCK
    )
    :vars
    (
      ?auto_81538 - BLOCK
      ?auto_81539 - BLOCK
      ?auto_81540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81538 ?auto_81537 ) ( ON-TABLE ?auto_81533 ) ( ON ?auto_81534 ?auto_81533 ) ( ON ?auto_81535 ?auto_81534 ) ( ON ?auto_81536 ?auto_81535 ) ( ON ?auto_81537 ?auto_81536 ) ( not ( = ?auto_81533 ?auto_81534 ) ) ( not ( = ?auto_81533 ?auto_81535 ) ) ( not ( = ?auto_81533 ?auto_81536 ) ) ( not ( = ?auto_81533 ?auto_81537 ) ) ( not ( = ?auto_81533 ?auto_81538 ) ) ( not ( = ?auto_81534 ?auto_81535 ) ) ( not ( = ?auto_81534 ?auto_81536 ) ) ( not ( = ?auto_81534 ?auto_81537 ) ) ( not ( = ?auto_81534 ?auto_81538 ) ) ( not ( = ?auto_81535 ?auto_81536 ) ) ( not ( = ?auto_81535 ?auto_81537 ) ) ( not ( = ?auto_81535 ?auto_81538 ) ) ( not ( = ?auto_81536 ?auto_81537 ) ) ( not ( = ?auto_81536 ?auto_81538 ) ) ( not ( = ?auto_81537 ?auto_81538 ) ) ( CLEAR ?auto_81539 ) ( not ( = ?auto_81533 ?auto_81540 ) ) ( not ( = ?auto_81533 ?auto_81539 ) ) ( not ( = ?auto_81534 ?auto_81540 ) ) ( not ( = ?auto_81534 ?auto_81539 ) ) ( not ( = ?auto_81535 ?auto_81540 ) ) ( not ( = ?auto_81535 ?auto_81539 ) ) ( not ( = ?auto_81536 ?auto_81540 ) ) ( not ( = ?auto_81536 ?auto_81539 ) ) ( not ( = ?auto_81537 ?auto_81540 ) ) ( not ( = ?auto_81537 ?auto_81539 ) ) ( not ( = ?auto_81538 ?auto_81540 ) ) ( not ( = ?auto_81538 ?auto_81539 ) ) ( not ( = ?auto_81540 ?auto_81539 ) ) ( ON ?auto_81540 ?auto_81538 ) ( CLEAR ?auto_81540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81533 ?auto_81534 ?auto_81535 ?auto_81536 ?auto_81537 ?auto_81538 )
      ( MAKE-5PILE ?auto_81533 ?auto_81534 ?auto_81535 ?auto_81536 ?auto_81537 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81541 - BLOCK
      ?auto_81542 - BLOCK
      ?auto_81543 - BLOCK
      ?auto_81544 - BLOCK
      ?auto_81545 - BLOCK
    )
    :vars
    (
      ?auto_81548 - BLOCK
      ?auto_81546 - BLOCK
      ?auto_81547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81548 ?auto_81545 ) ( ON-TABLE ?auto_81541 ) ( ON ?auto_81542 ?auto_81541 ) ( ON ?auto_81543 ?auto_81542 ) ( ON ?auto_81544 ?auto_81543 ) ( ON ?auto_81545 ?auto_81544 ) ( not ( = ?auto_81541 ?auto_81542 ) ) ( not ( = ?auto_81541 ?auto_81543 ) ) ( not ( = ?auto_81541 ?auto_81544 ) ) ( not ( = ?auto_81541 ?auto_81545 ) ) ( not ( = ?auto_81541 ?auto_81548 ) ) ( not ( = ?auto_81542 ?auto_81543 ) ) ( not ( = ?auto_81542 ?auto_81544 ) ) ( not ( = ?auto_81542 ?auto_81545 ) ) ( not ( = ?auto_81542 ?auto_81548 ) ) ( not ( = ?auto_81543 ?auto_81544 ) ) ( not ( = ?auto_81543 ?auto_81545 ) ) ( not ( = ?auto_81543 ?auto_81548 ) ) ( not ( = ?auto_81544 ?auto_81545 ) ) ( not ( = ?auto_81544 ?auto_81548 ) ) ( not ( = ?auto_81545 ?auto_81548 ) ) ( not ( = ?auto_81541 ?auto_81546 ) ) ( not ( = ?auto_81541 ?auto_81547 ) ) ( not ( = ?auto_81542 ?auto_81546 ) ) ( not ( = ?auto_81542 ?auto_81547 ) ) ( not ( = ?auto_81543 ?auto_81546 ) ) ( not ( = ?auto_81543 ?auto_81547 ) ) ( not ( = ?auto_81544 ?auto_81546 ) ) ( not ( = ?auto_81544 ?auto_81547 ) ) ( not ( = ?auto_81545 ?auto_81546 ) ) ( not ( = ?auto_81545 ?auto_81547 ) ) ( not ( = ?auto_81548 ?auto_81546 ) ) ( not ( = ?auto_81548 ?auto_81547 ) ) ( not ( = ?auto_81546 ?auto_81547 ) ) ( ON ?auto_81546 ?auto_81548 ) ( CLEAR ?auto_81546 ) ( HOLDING ?auto_81547 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81547 )
      ( MAKE-5PILE ?auto_81541 ?auto_81542 ?auto_81543 ?auto_81544 ?auto_81545 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81549 - BLOCK
      ?auto_81550 - BLOCK
      ?auto_81551 - BLOCK
      ?auto_81552 - BLOCK
      ?auto_81553 - BLOCK
    )
    :vars
    (
      ?auto_81555 - BLOCK
      ?auto_81556 - BLOCK
      ?auto_81554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81555 ?auto_81553 ) ( ON-TABLE ?auto_81549 ) ( ON ?auto_81550 ?auto_81549 ) ( ON ?auto_81551 ?auto_81550 ) ( ON ?auto_81552 ?auto_81551 ) ( ON ?auto_81553 ?auto_81552 ) ( not ( = ?auto_81549 ?auto_81550 ) ) ( not ( = ?auto_81549 ?auto_81551 ) ) ( not ( = ?auto_81549 ?auto_81552 ) ) ( not ( = ?auto_81549 ?auto_81553 ) ) ( not ( = ?auto_81549 ?auto_81555 ) ) ( not ( = ?auto_81550 ?auto_81551 ) ) ( not ( = ?auto_81550 ?auto_81552 ) ) ( not ( = ?auto_81550 ?auto_81553 ) ) ( not ( = ?auto_81550 ?auto_81555 ) ) ( not ( = ?auto_81551 ?auto_81552 ) ) ( not ( = ?auto_81551 ?auto_81553 ) ) ( not ( = ?auto_81551 ?auto_81555 ) ) ( not ( = ?auto_81552 ?auto_81553 ) ) ( not ( = ?auto_81552 ?auto_81555 ) ) ( not ( = ?auto_81553 ?auto_81555 ) ) ( not ( = ?auto_81549 ?auto_81556 ) ) ( not ( = ?auto_81549 ?auto_81554 ) ) ( not ( = ?auto_81550 ?auto_81556 ) ) ( not ( = ?auto_81550 ?auto_81554 ) ) ( not ( = ?auto_81551 ?auto_81556 ) ) ( not ( = ?auto_81551 ?auto_81554 ) ) ( not ( = ?auto_81552 ?auto_81556 ) ) ( not ( = ?auto_81552 ?auto_81554 ) ) ( not ( = ?auto_81553 ?auto_81556 ) ) ( not ( = ?auto_81553 ?auto_81554 ) ) ( not ( = ?auto_81555 ?auto_81556 ) ) ( not ( = ?auto_81555 ?auto_81554 ) ) ( not ( = ?auto_81556 ?auto_81554 ) ) ( ON ?auto_81556 ?auto_81555 ) ( ON ?auto_81554 ?auto_81556 ) ( CLEAR ?auto_81554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81549 ?auto_81550 ?auto_81551 ?auto_81552 ?auto_81553 ?auto_81555 ?auto_81556 )
      ( MAKE-5PILE ?auto_81549 ?auto_81550 ?auto_81551 ?auto_81552 ?auto_81553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81560 - BLOCK
      ?auto_81561 - BLOCK
      ?auto_81562 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81562 ) ( CLEAR ?auto_81561 ) ( ON-TABLE ?auto_81560 ) ( ON ?auto_81561 ?auto_81560 ) ( not ( = ?auto_81560 ?auto_81561 ) ) ( not ( = ?auto_81560 ?auto_81562 ) ) ( not ( = ?auto_81561 ?auto_81562 ) ) )
    :subtasks
    ( ( !STACK ?auto_81562 ?auto_81561 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81563 - BLOCK
      ?auto_81564 - BLOCK
      ?auto_81565 - BLOCK
    )
    :vars
    (
      ?auto_81566 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81564 ) ( ON-TABLE ?auto_81563 ) ( ON ?auto_81564 ?auto_81563 ) ( not ( = ?auto_81563 ?auto_81564 ) ) ( not ( = ?auto_81563 ?auto_81565 ) ) ( not ( = ?auto_81564 ?auto_81565 ) ) ( ON ?auto_81565 ?auto_81566 ) ( CLEAR ?auto_81565 ) ( HAND-EMPTY ) ( not ( = ?auto_81563 ?auto_81566 ) ) ( not ( = ?auto_81564 ?auto_81566 ) ) ( not ( = ?auto_81565 ?auto_81566 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81565 ?auto_81566 )
      ( MAKE-3PILE ?auto_81563 ?auto_81564 ?auto_81565 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81567 - BLOCK
      ?auto_81568 - BLOCK
      ?auto_81569 - BLOCK
    )
    :vars
    (
      ?auto_81570 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81567 ) ( not ( = ?auto_81567 ?auto_81568 ) ) ( not ( = ?auto_81567 ?auto_81569 ) ) ( not ( = ?auto_81568 ?auto_81569 ) ) ( ON ?auto_81569 ?auto_81570 ) ( CLEAR ?auto_81569 ) ( not ( = ?auto_81567 ?auto_81570 ) ) ( not ( = ?auto_81568 ?auto_81570 ) ) ( not ( = ?auto_81569 ?auto_81570 ) ) ( HOLDING ?auto_81568 ) ( CLEAR ?auto_81567 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81567 ?auto_81568 )
      ( MAKE-3PILE ?auto_81567 ?auto_81568 ?auto_81569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81571 - BLOCK
      ?auto_81572 - BLOCK
      ?auto_81573 - BLOCK
    )
    :vars
    (
      ?auto_81574 - BLOCK
      ?auto_81576 - BLOCK
      ?auto_81577 - BLOCK
      ?auto_81575 - BLOCK
      ?auto_81578 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81571 ) ( not ( = ?auto_81571 ?auto_81572 ) ) ( not ( = ?auto_81571 ?auto_81573 ) ) ( not ( = ?auto_81572 ?auto_81573 ) ) ( ON ?auto_81573 ?auto_81574 ) ( not ( = ?auto_81571 ?auto_81574 ) ) ( not ( = ?auto_81572 ?auto_81574 ) ) ( not ( = ?auto_81573 ?auto_81574 ) ) ( CLEAR ?auto_81571 ) ( ON ?auto_81572 ?auto_81573 ) ( CLEAR ?auto_81572 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81576 ) ( ON ?auto_81577 ?auto_81576 ) ( ON ?auto_81575 ?auto_81577 ) ( ON ?auto_81578 ?auto_81575 ) ( ON ?auto_81574 ?auto_81578 ) ( not ( = ?auto_81576 ?auto_81577 ) ) ( not ( = ?auto_81576 ?auto_81575 ) ) ( not ( = ?auto_81576 ?auto_81578 ) ) ( not ( = ?auto_81576 ?auto_81574 ) ) ( not ( = ?auto_81576 ?auto_81573 ) ) ( not ( = ?auto_81576 ?auto_81572 ) ) ( not ( = ?auto_81577 ?auto_81575 ) ) ( not ( = ?auto_81577 ?auto_81578 ) ) ( not ( = ?auto_81577 ?auto_81574 ) ) ( not ( = ?auto_81577 ?auto_81573 ) ) ( not ( = ?auto_81577 ?auto_81572 ) ) ( not ( = ?auto_81575 ?auto_81578 ) ) ( not ( = ?auto_81575 ?auto_81574 ) ) ( not ( = ?auto_81575 ?auto_81573 ) ) ( not ( = ?auto_81575 ?auto_81572 ) ) ( not ( = ?auto_81578 ?auto_81574 ) ) ( not ( = ?auto_81578 ?auto_81573 ) ) ( not ( = ?auto_81578 ?auto_81572 ) ) ( not ( = ?auto_81571 ?auto_81576 ) ) ( not ( = ?auto_81571 ?auto_81577 ) ) ( not ( = ?auto_81571 ?auto_81575 ) ) ( not ( = ?auto_81571 ?auto_81578 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81576 ?auto_81577 ?auto_81575 ?auto_81578 ?auto_81574 ?auto_81573 )
      ( MAKE-3PILE ?auto_81571 ?auto_81572 ?auto_81573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81579 - BLOCK
      ?auto_81580 - BLOCK
      ?auto_81581 - BLOCK
    )
    :vars
    (
      ?auto_81584 - BLOCK
      ?auto_81586 - BLOCK
      ?auto_81583 - BLOCK
      ?auto_81582 - BLOCK
      ?auto_81585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81579 ?auto_81580 ) ) ( not ( = ?auto_81579 ?auto_81581 ) ) ( not ( = ?auto_81580 ?auto_81581 ) ) ( ON ?auto_81581 ?auto_81584 ) ( not ( = ?auto_81579 ?auto_81584 ) ) ( not ( = ?auto_81580 ?auto_81584 ) ) ( not ( = ?auto_81581 ?auto_81584 ) ) ( ON ?auto_81580 ?auto_81581 ) ( CLEAR ?auto_81580 ) ( ON-TABLE ?auto_81586 ) ( ON ?auto_81583 ?auto_81586 ) ( ON ?auto_81582 ?auto_81583 ) ( ON ?auto_81585 ?auto_81582 ) ( ON ?auto_81584 ?auto_81585 ) ( not ( = ?auto_81586 ?auto_81583 ) ) ( not ( = ?auto_81586 ?auto_81582 ) ) ( not ( = ?auto_81586 ?auto_81585 ) ) ( not ( = ?auto_81586 ?auto_81584 ) ) ( not ( = ?auto_81586 ?auto_81581 ) ) ( not ( = ?auto_81586 ?auto_81580 ) ) ( not ( = ?auto_81583 ?auto_81582 ) ) ( not ( = ?auto_81583 ?auto_81585 ) ) ( not ( = ?auto_81583 ?auto_81584 ) ) ( not ( = ?auto_81583 ?auto_81581 ) ) ( not ( = ?auto_81583 ?auto_81580 ) ) ( not ( = ?auto_81582 ?auto_81585 ) ) ( not ( = ?auto_81582 ?auto_81584 ) ) ( not ( = ?auto_81582 ?auto_81581 ) ) ( not ( = ?auto_81582 ?auto_81580 ) ) ( not ( = ?auto_81585 ?auto_81584 ) ) ( not ( = ?auto_81585 ?auto_81581 ) ) ( not ( = ?auto_81585 ?auto_81580 ) ) ( not ( = ?auto_81579 ?auto_81586 ) ) ( not ( = ?auto_81579 ?auto_81583 ) ) ( not ( = ?auto_81579 ?auto_81582 ) ) ( not ( = ?auto_81579 ?auto_81585 ) ) ( HOLDING ?auto_81579 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81579 )
      ( MAKE-3PILE ?auto_81579 ?auto_81580 ?auto_81581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81587 - BLOCK
      ?auto_81588 - BLOCK
      ?auto_81589 - BLOCK
    )
    :vars
    (
      ?auto_81590 - BLOCK
      ?auto_81594 - BLOCK
      ?auto_81593 - BLOCK
      ?auto_81591 - BLOCK
      ?auto_81592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81587 ?auto_81588 ) ) ( not ( = ?auto_81587 ?auto_81589 ) ) ( not ( = ?auto_81588 ?auto_81589 ) ) ( ON ?auto_81589 ?auto_81590 ) ( not ( = ?auto_81587 ?auto_81590 ) ) ( not ( = ?auto_81588 ?auto_81590 ) ) ( not ( = ?auto_81589 ?auto_81590 ) ) ( ON ?auto_81588 ?auto_81589 ) ( ON-TABLE ?auto_81594 ) ( ON ?auto_81593 ?auto_81594 ) ( ON ?auto_81591 ?auto_81593 ) ( ON ?auto_81592 ?auto_81591 ) ( ON ?auto_81590 ?auto_81592 ) ( not ( = ?auto_81594 ?auto_81593 ) ) ( not ( = ?auto_81594 ?auto_81591 ) ) ( not ( = ?auto_81594 ?auto_81592 ) ) ( not ( = ?auto_81594 ?auto_81590 ) ) ( not ( = ?auto_81594 ?auto_81589 ) ) ( not ( = ?auto_81594 ?auto_81588 ) ) ( not ( = ?auto_81593 ?auto_81591 ) ) ( not ( = ?auto_81593 ?auto_81592 ) ) ( not ( = ?auto_81593 ?auto_81590 ) ) ( not ( = ?auto_81593 ?auto_81589 ) ) ( not ( = ?auto_81593 ?auto_81588 ) ) ( not ( = ?auto_81591 ?auto_81592 ) ) ( not ( = ?auto_81591 ?auto_81590 ) ) ( not ( = ?auto_81591 ?auto_81589 ) ) ( not ( = ?auto_81591 ?auto_81588 ) ) ( not ( = ?auto_81592 ?auto_81590 ) ) ( not ( = ?auto_81592 ?auto_81589 ) ) ( not ( = ?auto_81592 ?auto_81588 ) ) ( not ( = ?auto_81587 ?auto_81594 ) ) ( not ( = ?auto_81587 ?auto_81593 ) ) ( not ( = ?auto_81587 ?auto_81591 ) ) ( not ( = ?auto_81587 ?auto_81592 ) ) ( ON ?auto_81587 ?auto_81588 ) ( CLEAR ?auto_81587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81594 ?auto_81593 ?auto_81591 ?auto_81592 ?auto_81590 ?auto_81589 ?auto_81588 )
      ( MAKE-3PILE ?auto_81587 ?auto_81588 ?auto_81589 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81599 - BLOCK
      ?auto_81600 - BLOCK
      ?auto_81601 - BLOCK
      ?auto_81602 - BLOCK
    )
    :vars
    (
      ?auto_81603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81603 ?auto_81602 ) ( CLEAR ?auto_81603 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81599 ) ( ON ?auto_81600 ?auto_81599 ) ( ON ?auto_81601 ?auto_81600 ) ( ON ?auto_81602 ?auto_81601 ) ( not ( = ?auto_81599 ?auto_81600 ) ) ( not ( = ?auto_81599 ?auto_81601 ) ) ( not ( = ?auto_81599 ?auto_81602 ) ) ( not ( = ?auto_81599 ?auto_81603 ) ) ( not ( = ?auto_81600 ?auto_81601 ) ) ( not ( = ?auto_81600 ?auto_81602 ) ) ( not ( = ?auto_81600 ?auto_81603 ) ) ( not ( = ?auto_81601 ?auto_81602 ) ) ( not ( = ?auto_81601 ?auto_81603 ) ) ( not ( = ?auto_81602 ?auto_81603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81603 ?auto_81602 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81604 - BLOCK
      ?auto_81605 - BLOCK
      ?auto_81606 - BLOCK
      ?auto_81607 - BLOCK
    )
    :vars
    (
      ?auto_81608 - BLOCK
      ?auto_81609 - BLOCK
      ?auto_81610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81608 ?auto_81607 ) ( CLEAR ?auto_81608 ) ( ON-TABLE ?auto_81604 ) ( ON ?auto_81605 ?auto_81604 ) ( ON ?auto_81606 ?auto_81605 ) ( ON ?auto_81607 ?auto_81606 ) ( not ( = ?auto_81604 ?auto_81605 ) ) ( not ( = ?auto_81604 ?auto_81606 ) ) ( not ( = ?auto_81604 ?auto_81607 ) ) ( not ( = ?auto_81604 ?auto_81608 ) ) ( not ( = ?auto_81605 ?auto_81606 ) ) ( not ( = ?auto_81605 ?auto_81607 ) ) ( not ( = ?auto_81605 ?auto_81608 ) ) ( not ( = ?auto_81606 ?auto_81607 ) ) ( not ( = ?auto_81606 ?auto_81608 ) ) ( not ( = ?auto_81607 ?auto_81608 ) ) ( HOLDING ?auto_81609 ) ( CLEAR ?auto_81610 ) ( not ( = ?auto_81604 ?auto_81609 ) ) ( not ( = ?auto_81604 ?auto_81610 ) ) ( not ( = ?auto_81605 ?auto_81609 ) ) ( not ( = ?auto_81605 ?auto_81610 ) ) ( not ( = ?auto_81606 ?auto_81609 ) ) ( not ( = ?auto_81606 ?auto_81610 ) ) ( not ( = ?auto_81607 ?auto_81609 ) ) ( not ( = ?auto_81607 ?auto_81610 ) ) ( not ( = ?auto_81608 ?auto_81609 ) ) ( not ( = ?auto_81608 ?auto_81610 ) ) ( not ( = ?auto_81609 ?auto_81610 ) ) )
    :subtasks
    ( ( !STACK ?auto_81609 ?auto_81610 )
      ( MAKE-4PILE ?auto_81604 ?auto_81605 ?auto_81606 ?auto_81607 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81611 - BLOCK
      ?auto_81612 - BLOCK
      ?auto_81613 - BLOCK
      ?auto_81614 - BLOCK
    )
    :vars
    (
      ?auto_81616 - BLOCK
      ?auto_81615 - BLOCK
      ?auto_81617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81616 ?auto_81614 ) ( ON-TABLE ?auto_81611 ) ( ON ?auto_81612 ?auto_81611 ) ( ON ?auto_81613 ?auto_81612 ) ( ON ?auto_81614 ?auto_81613 ) ( not ( = ?auto_81611 ?auto_81612 ) ) ( not ( = ?auto_81611 ?auto_81613 ) ) ( not ( = ?auto_81611 ?auto_81614 ) ) ( not ( = ?auto_81611 ?auto_81616 ) ) ( not ( = ?auto_81612 ?auto_81613 ) ) ( not ( = ?auto_81612 ?auto_81614 ) ) ( not ( = ?auto_81612 ?auto_81616 ) ) ( not ( = ?auto_81613 ?auto_81614 ) ) ( not ( = ?auto_81613 ?auto_81616 ) ) ( not ( = ?auto_81614 ?auto_81616 ) ) ( CLEAR ?auto_81615 ) ( not ( = ?auto_81611 ?auto_81617 ) ) ( not ( = ?auto_81611 ?auto_81615 ) ) ( not ( = ?auto_81612 ?auto_81617 ) ) ( not ( = ?auto_81612 ?auto_81615 ) ) ( not ( = ?auto_81613 ?auto_81617 ) ) ( not ( = ?auto_81613 ?auto_81615 ) ) ( not ( = ?auto_81614 ?auto_81617 ) ) ( not ( = ?auto_81614 ?auto_81615 ) ) ( not ( = ?auto_81616 ?auto_81617 ) ) ( not ( = ?auto_81616 ?auto_81615 ) ) ( not ( = ?auto_81617 ?auto_81615 ) ) ( ON ?auto_81617 ?auto_81616 ) ( CLEAR ?auto_81617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81611 ?auto_81612 ?auto_81613 ?auto_81614 ?auto_81616 )
      ( MAKE-4PILE ?auto_81611 ?auto_81612 ?auto_81613 ?auto_81614 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81618 - BLOCK
      ?auto_81619 - BLOCK
      ?auto_81620 - BLOCK
      ?auto_81621 - BLOCK
    )
    :vars
    (
      ?auto_81624 - BLOCK
      ?auto_81623 - BLOCK
      ?auto_81622 - BLOCK
      ?auto_81625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81624 ?auto_81621 ) ( ON-TABLE ?auto_81618 ) ( ON ?auto_81619 ?auto_81618 ) ( ON ?auto_81620 ?auto_81619 ) ( ON ?auto_81621 ?auto_81620 ) ( not ( = ?auto_81618 ?auto_81619 ) ) ( not ( = ?auto_81618 ?auto_81620 ) ) ( not ( = ?auto_81618 ?auto_81621 ) ) ( not ( = ?auto_81618 ?auto_81624 ) ) ( not ( = ?auto_81619 ?auto_81620 ) ) ( not ( = ?auto_81619 ?auto_81621 ) ) ( not ( = ?auto_81619 ?auto_81624 ) ) ( not ( = ?auto_81620 ?auto_81621 ) ) ( not ( = ?auto_81620 ?auto_81624 ) ) ( not ( = ?auto_81621 ?auto_81624 ) ) ( not ( = ?auto_81618 ?auto_81623 ) ) ( not ( = ?auto_81618 ?auto_81622 ) ) ( not ( = ?auto_81619 ?auto_81623 ) ) ( not ( = ?auto_81619 ?auto_81622 ) ) ( not ( = ?auto_81620 ?auto_81623 ) ) ( not ( = ?auto_81620 ?auto_81622 ) ) ( not ( = ?auto_81621 ?auto_81623 ) ) ( not ( = ?auto_81621 ?auto_81622 ) ) ( not ( = ?auto_81624 ?auto_81623 ) ) ( not ( = ?auto_81624 ?auto_81622 ) ) ( not ( = ?auto_81623 ?auto_81622 ) ) ( ON ?auto_81623 ?auto_81624 ) ( CLEAR ?auto_81623 ) ( HOLDING ?auto_81622 ) ( CLEAR ?auto_81625 ) ( ON-TABLE ?auto_81625 ) ( not ( = ?auto_81625 ?auto_81622 ) ) ( not ( = ?auto_81618 ?auto_81625 ) ) ( not ( = ?auto_81619 ?auto_81625 ) ) ( not ( = ?auto_81620 ?auto_81625 ) ) ( not ( = ?auto_81621 ?auto_81625 ) ) ( not ( = ?auto_81624 ?auto_81625 ) ) ( not ( = ?auto_81623 ?auto_81625 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81625 ?auto_81622 )
      ( MAKE-4PILE ?auto_81618 ?auto_81619 ?auto_81620 ?auto_81621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81626 - BLOCK
      ?auto_81627 - BLOCK
      ?auto_81628 - BLOCK
      ?auto_81629 - BLOCK
    )
    :vars
    (
      ?auto_81631 - BLOCK
      ?auto_81632 - BLOCK
      ?auto_81633 - BLOCK
      ?auto_81630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81631 ?auto_81629 ) ( ON-TABLE ?auto_81626 ) ( ON ?auto_81627 ?auto_81626 ) ( ON ?auto_81628 ?auto_81627 ) ( ON ?auto_81629 ?auto_81628 ) ( not ( = ?auto_81626 ?auto_81627 ) ) ( not ( = ?auto_81626 ?auto_81628 ) ) ( not ( = ?auto_81626 ?auto_81629 ) ) ( not ( = ?auto_81626 ?auto_81631 ) ) ( not ( = ?auto_81627 ?auto_81628 ) ) ( not ( = ?auto_81627 ?auto_81629 ) ) ( not ( = ?auto_81627 ?auto_81631 ) ) ( not ( = ?auto_81628 ?auto_81629 ) ) ( not ( = ?auto_81628 ?auto_81631 ) ) ( not ( = ?auto_81629 ?auto_81631 ) ) ( not ( = ?auto_81626 ?auto_81632 ) ) ( not ( = ?auto_81626 ?auto_81633 ) ) ( not ( = ?auto_81627 ?auto_81632 ) ) ( not ( = ?auto_81627 ?auto_81633 ) ) ( not ( = ?auto_81628 ?auto_81632 ) ) ( not ( = ?auto_81628 ?auto_81633 ) ) ( not ( = ?auto_81629 ?auto_81632 ) ) ( not ( = ?auto_81629 ?auto_81633 ) ) ( not ( = ?auto_81631 ?auto_81632 ) ) ( not ( = ?auto_81631 ?auto_81633 ) ) ( not ( = ?auto_81632 ?auto_81633 ) ) ( ON ?auto_81632 ?auto_81631 ) ( CLEAR ?auto_81630 ) ( ON-TABLE ?auto_81630 ) ( not ( = ?auto_81630 ?auto_81633 ) ) ( not ( = ?auto_81626 ?auto_81630 ) ) ( not ( = ?auto_81627 ?auto_81630 ) ) ( not ( = ?auto_81628 ?auto_81630 ) ) ( not ( = ?auto_81629 ?auto_81630 ) ) ( not ( = ?auto_81631 ?auto_81630 ) ) ( not ( = ?auto_81632 ?auto_81630 ) ) ( ON ?auto_81633 ?auto_81632 ) ( CLEAR ?auto_81633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81626 ?auto_81627 ?auto_81628 ?auto_81629 ?auto_81631 ?auto_81632 )
      ( MAKE-4PILE ?auto_81626 ?auto_81627 ?auto_81628 ?auto_81629 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81634 - BLOCK
      ?auto_81635 - BLOCK
      ?auto_81636 - BLOCK
      ?auto_81637 - BLOCK
    )
    :vars
    (
      ?auto_81638 - BLOCK
      ?auto_81640 - BLOCK
      ?auto_81639 - BLOCK
      ?auto_81641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81638 ?auto_81637 ) ( ON-TABLE ?auto_81634 ) ( ON ?auto_81635 ?auto_81634 ) ( ON ?auto_81636 ?auto_81635 ) ( ON ?auto_81637 ?auto_81636 ) ( not ( = ?auto_81634 ?auto_81635 ) ) ( not ( = ?auto_81634 ?auto_81636 ) ) ( not ( = ?auto_81634 ?auto_81637 ) ) ( not ( = ?auto_81634 ?auto_81638 ) ) ( not ( = ?auto_81635 ?auto_81636 ) ) ( not ( = ?auto_81635 ?auto_81637 ) ) ( not ( = ?auto_81635 ?auto_81638 ) ) ( not ( = ?auto_81636 ?auto_81637 ) ) ( not ( = ?auto_81636 ?auto_81638 ) ) ( not ( = ?auto_81637 ?auto_81638 ) ) ( not ( = ?auto_81634 ?auto_81640 ) ) ( not ( = ?auto_81634 ?auto_81639 ) ) ( not ( = ?auto_81635 ?auto_81640 ) ) ( not ( = ?auto_81635 ?auto_81639 ) ) ( not ( = ?auto_81636 ?auto_81640 ) ) ( not ( = ?auto_81636 ?auto_81639 ) ) ( not ( = ?auto_81637 ?auto_81640 ) ) ( not ( = ?auto_81637 ?auto_81639 ) ) ( not ( = ?auto_81638 ?auto_81640 ) ) ( not ( = ?auto_81638 ?auto_81639 ) ) ( not ( = ?auto_81640 ?auto_81639 ) ) ( ON ?auto_81640 ?auto_81638 ) ( not ( = ?auto_81641 ?auto_81639 ) ) ( not ( = ?auto_81634 ?auto_81641 ) ) ( not ( = ?auto_81635 ?auto_81641 ) ) ( not ( = ?auto_81636 ?auto_81641 ) ) ( not ( = ?auto_81637 ?auto_81641 ) ) ( not ( = ?auto_81638 ?auto_81641 ) ) ( not ( = ?auto_81640 ?auto_81641 ) ) ( ON ?auto_81639 ?auto_81640 ) ( CLEAR ?auto_81639 ) ( HOLDING ?auto_81641 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81641 )
      ( MAKE-4PILE ?auto_81634 ?auto_81635 ?auto_81636 ?auto_81637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81642 - BLOCK
      ?auto_81643 - BLOCK
      ?auto_81644 - BLOCK
      ?auto_81645 - BLOCK
    )
    :vars
    (
      ?auto_81648 - BLOCK
      ?auto_81646 - BLOCK
      ?auto_81649 - BLOCK
      ?auto_81647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81648 ?auto_81645 ) ( ON-TABLE ?auto_81642 ) ( ON ?auto_81643 ?auto_81642 ) ( ON ?auto_81644 ?auto_81643 ) ( ON ?auto_81645 ?auto_81644 ) ( not ( = ?auto_81642 ?auto_81643 ) ) ( not ( = ?auto_81642 ?auto_81644 ) ) ( not ( = ?auto_81642 ?auto_81645 ) ) ( not ( = ?auto_81642 ?auto_81648 ) ) ( not ( = ?auto_81643 ?auto_81644 ) ) ( not ( = ?auto_81643 ?auto_81645 ) ) ( not ( = ?auto_81643 ?auto_81648 ) ) ( not ( = ?auto_81644 ?auto_81645 ) ) ( not ( = ?auto_81644 ?auto_81648 ) ) ( not ( = ?auto_81645 ?auto_81648 ) ) ( not ( = ?auto_81642 ?auto_81646 ) ) ( not ( = ?auto_81642 ?auto_81649 ) ) ( not ( = ?auto_81643 ?auto_81646 ) ) ( not ( = ?auto_81643 ?auto_81649 ) ) ( not ( = ?auto_81644 ?auto_81646 ) ) ( not ( = ?auto_81644 ?auto_81649 ) ) ( not ( = ?auto_81645 ?auto_81646 ) ) ( not ( = ?auto_81645 ?auto_81649 ) ) ( not ( = ?auto_81648 ?auto_81646 ) ) ( not ( = ?auto_81648 ?auto_81649 ) ) ( not ( = ?auto_81646 ?auto_81649 ) ) ( ON ?auto_81646 ?auto_81648 ) ( not ( = ?auto_81647 ?auto_81649 ) ) ( not ( = ?auto_81642 ?auto_81647 ) ) ( not ( = ?auto_81643 ?auto_81647 ) ) ( not ( = ?auto_81644 ?auto_81647 ) ) ( not ( = ?auto_81645 ?auto_81647 ) ) ( not ( = ?auto_81648 ?auto_81647 ) ) ( not ( = ?auto_81646 ?auto_81647 ) ) ( ON ?auto_81649 ?auto_81646 ) ( ON ?auto_81647 ?auto_81649 ) ( CLEAR ?auto_81647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81642 ?auto_81643 ?auto_81644 ?auto_81645 ?auto_81648 ?auto_81646 ?auto_81649 )
      ( MAKE-4PILE ?auto_81642 ?auto_81643 ?auto_81644 ?auto_81645 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81654 - BLOCK
      ?auto_81655 - BLOCK
      ?auto_81656 - BLOCK
      ?auto_81657 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81657 ) ( CLEAR ?auto_81656 ) ( ON-TABLE ?auto_81654 ) ( ON ?auto_81655 ?auto_81654 ) ( ON ?auto_81656 ?auto_81655 ) ( not ( = ?auto_81654 ?auto_81655 ) ) ( not ( = ?auto_81654 ?auto_81656 ) ) ( not ( = ?auto_81654 ?auto_81657 ) ) ( not ( = ?auto_81655 ?auto_81656 ) ) ( not ( = ?auto_81655 ?auto_81657 ) ) ( not ( = ?auto_81656 ?auto_81657 ) ) )
    :subtasks
    ( ( !STACK ?auto_81657 ?auto_81656 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81658 - BLOCK
      ?auto_81659 - BLOCK
      ?auto_81660 - BLOCK
      ?auto_81661 - BLOCK
    )
    :vars
    (
      ?auto_81662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81660 ) ( ON-TABLE ?auto_81658 ) ( ON ?auto_81659 ?auto_81658 ) ( ON ?auto_81660 ?auto_81659 ) ( not ( = ?auto_81658 ?auto_81659 ) ) ( not ( = ?auto_81658 ?auto_81660 ) ) ( not ( = ?auto_81658 ?auto_81661 ) ) ( not ( = ?auto_81659 ?auto_81660 ) ) ( not ( = ?auto_81659 ?auto_81661 ) ) ( not ( = ?auto_81660 ?auto_81661 ) ) ( ON ?auto_81661 ?auto_81662 ) ( CLEAR ?auto_81661 ) ( HAND-EMPTY ) ( not ( = ?auto_81658 ?auto_81662 ) ) ( not ( = ?auto_81659 ?auto_81662 ) ) ( not ( = ?auto_81660 ?auto_81662 ) ) ( not ( = ?auto_81661 ?auto_81662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81661 ?auto_81662 )
      ( MAKE-4PILE ?auto_81658 ?auto_81659 ?auto_81660 ?auto_81661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81663 - BLOCK
      ?auto_81664 - BLOCK
      ?auto_81665 - BLOCK
      ?auto_81666 - BLOCK
    )
    :vars
    (
      ?auto_81667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81663 ) ( ON ?auto_81664 ?auto_81663 ) ( not ( = ?auto_81663 ?auto_81664 ) ) ( not ( = ?auto_81663 ?auto_81665 ) ) ( not ( = ?auto_81663 ?auto_81666 ) ) ( not ( = ?auto_81664 ?auto_81665 ) ) ( not ( = ?auto_81664 ?auto_81666 ) ) ( not ( = ?auto_81665 ?auto_81666 ) ) ( ON ?auto_81666 ?auto_81667 ) ( CLEAR ?auto_81666 ) ( not ( = ?auto_81663 ?auto_81667 ) ) ( not ( = ?auto_81664 ?auto_81667 ) ) ( not ( = ?auto_81665 ?auto_81667 ) ) ( not ( = ?auto_81666 ?auto_81667 ) ) ( HOLDING ?auto_81665 ) ( CLEAR ?auto_81664 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81663 ?auto_81664 ?auto_81665 )
      ( MAKE-4PILE ?auto_81663 ?auto_81664 ?auto_81665 ?auto_81666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81668 - BLOCK
      ?auto_81669 - BLOCK
      ?auto_81670 - BLOCK
      ?auto_81671 - BLOCK
    )
    :vars
    (
      ?auto_81672 - BLOCK
      ?auto_81673 - BLOCK
      ?auto_81675 - BLOCK
      ?auto_81674 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81668 ) ( ON ?auto_81669 ?auto_81668 ) ( not ( = ?auto_81668 ?auto_81669 ) ) ( not ( = ?auto_81668 ?auto_81670 ) ) ( not ( = ?auto_81668 ?auto_81671 ) ) ( not ( = ?auto_81669 ?auto_81670 ) ) ( not ( = ?auto_81669 ?auto_81671 ) ) ( not ( = ?auto_81670 ?auto_81671 ) ) ( ON ?auto_81671 ?auto_81672 ) ( not ( = ?auto_81668 ?auto_81672 ) ) ( not ( = ?auto_81669 ?auto_81672 ) ) ( not ( = ?auto_81670 ?auto_81672 ) ) ( not ( = ?auto_81671 ?auto_81672 ) ) ( CLEAR ?auto_81669 ) ( ON ?auto_81670 ?auto_81671 ) ( CLEAR ?auto_81670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81673 ) ( ON ?auto_81675 ?auto_81673 ) ( ON ?auto_81674 ?auto_81675 ) ( ON ?auto_81672 ?auto_81674 ) ( not ( = ?auto_81673 ?auto_81675 ) ) ( not ( = ?auto_81673 ?auto_81674 ) ) ( not ( = ?auto_81673 ?auto_81672 ) ) ( not ( = ?auto_81673 ?auto_81671 ) ) ( not ( = ?auto_81673 ?auto_81670 ) ) ( not ( = ?auto_81675 ?auto_81674 ) ) ( not ( = ?auto_81675 ?auto_81672 ) ) ( not ( = ?auto_81675 ?auto_81671 ) ) ( not ( = ?auto_81675 ?auto_81670 ) ) ( not ( = ?auto_81674 ?auto_81672 ) ) ( not ( = ?auto_81674 ?auto_81671 ) ) ( not ( = ?auto_81674 ?auto_81670 ) ) ( not ( = ?auto_81668 ?auto_81673 ) ) ( not ( = ?auto_81668 ?auto_81675 ) ) ( not ( = ?auto_81668 ?auto_81674 ) ) ( not ( = ?auto_81669 ?auto_81673 ) ) ( not ( = ?auto_81669 ?auto_81675 ) ) ( not ( = ?auto_81669 ?auto_81674 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81673 ?auto_81675 ?auto_81674 ?auto_81672 ?auto_81671 )
      ( MAKE-4PILE ?auto_81668 ?auto_81669 ?auto_81670 ?auto_81671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81676 - BLOCK
      ?auto_81677 - BLOCK
      ?auto_81678 - BLOCK
      ?auto_81679 - BLOCK
    )
    :vars
    (
      ?auto_81683 - BLOCK
      ?auto_81682 - BLOCK
      ?auto_81680 - BLOCK
      ?auto_81681 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81676 ) ( not ( = ?auto_81676 ?auto_81677 ) ) ( not ( = ?auto_81676 ?auto_81678 ) ) ( not ( = ?auto_81676 ?auto_81679 ) ) ( not ( = ?auto_81677 ?auto_81678 ) ) ( not ( = ?auto_81677 ?auto_81679 ) ) ( not ( = ?auto_81678 ?auto_81679 ) ) ( ON ?auto_81679 ?auto_81683 ) ( not ( = ?auto_81676 ?auto_81683 ) ) ( not ( = ?auto_81677 ?auto_81683 ) ) ( not ( = ?auto_81678 ?auto_81683 ) ) ( not ( = ?auto_81679 ?auto_81683 ) ) ( ON ?auto_81678 ?auto_81679 ) ( CLEAR ?auto_81678 ) ( ON-TABLE ?auto_81682 ) ( ON ?auto_81680 ?auto_81682 ) ( ON ?auto_81681 ?auto_81680 ) ( ON ?auto_81683 ?auto_81681 ) ( not ( = ?auto_81682 ?auto_81680 ) ) ( not ( = ?auto_81682 ?auto_81681 ) ) ( not ( = ?auto_81682 ?auto_81683 ) ) ( not ( = ?auto_81682 ?auto_81679 ) ) ( not ( = ?auto_81682 ?auto_81678 ) ) ( not ( = ?auto_81680 ?auto_81681 ) ) ( not ( = ?auto_81680 ?auto_81683 ) ) ( not ( = ?auto_81680 ?auto_81679 ) ) ( not ( = ?auto_81680 ?auto_81678 ) ) ( not ( = ?auto_81681 ?auto_81683 ) ) ( not ( = ?auto_81681 ?auto_81679 ) ) ( not ( = ?auto_81681 ?auto_81678 ) ) ( not ( = ?auto_81676 ?auto_81682 ) ) ( not ( = ?auto_81676 ?auto_81680 ) ) ( not ( = ?auto_81676 ?auto_81681 ) ) ( not ( = ?auto_81677 ?auto_81682 ) ) ( not ( = ?auto_81677 ?auto_81680 ) ) ( not ( = ?auto_81677 ?auto_81681 ) ) ( HOLDING ?auto_81677 ) ( CLEAR ?auto_81676 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81676 ?auto_81677 )
      ( MAKE-4PILE ?auto_81676 ?auto_81677 ?auto_81678 ?auto_81679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81684 - BLOCK
      ?auto_81685 - BLOCK
      ?auto_81686 - BLOCK
      ?auto_81687 - BLOCK
    )
    :vars
    (
      ?auto_81691 - BLOCK
      ?auto_81689 - BLOCK
      ?auto_81690 - BLOCK
      ?auto_81688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81684 ) ( not ( = ?auto_81684 ?auto_81685 ) ) ( not ( = ?auto_81684 ?auto_81686 ) ) ( not ( = ?auto_81684 ?auto_81687 ) ) ( not ( = ?auto_81685 ?auto_81686 ) ) ( not ( = ?auto_81685 ?auto_81687 ) ) ( not ( = ?auto_81686 ?auto_81687 ) ) ( ON ?auto_81687 ?auto_81691 ) ( not ( = ?auto_81684 ?auto_81691 ) ) ( not ( = ?auto_81685 ?auto_81691 ) ) ( not ( = ?auto_81686 ?auto_81691 ) ) ( not ( = ?auto_81687 ?auto_81691 ) ) ( ON ?auto_81686 ?auto_81687 ) ( ON-TABLE ?auto_81689 ) ( ON ?auto_81690 ?auto_81689 ) ( ON ?auto_81688 ?auto_81690 ) ( ON ?auto_81691 ?auto_81688 ) ( not ( = ?auto_81689 ?auto_81690 ) ) ( not ( = ?auto_81689 ?auto_81688 ) ) ( not ( = ?auto_81689 ?auto_81691 ) ) ( not ( = ?auto_81689 ?auto_81687 ) ) ( not ( = ?auto_81689 ?auto_81686 ) ) ( not ( = ?auto_81690 ?auto_81688 ) ) ( not ( = ?auto_81690 ?auto_81691 ) ) ( not ( = ?auto_81690 ?auto_81687 ) ) ( not ( = ?auto_81690 ?auto_81686 ) ) ( not ( = ?auto_81688 ?auto_81691 ) ) ( not ( = ?auto_81688 ?auto_81687 ) ) ( not ( = ?auto_81688 ?auto_81686 ) ) ( not ( = ?auto_81684 ?auto_81689 ) ) ( not ( = ?auto_81684 ?auto_81690 ) ) ( not ( = ?auto_81684 ?auto_81688 ) ) ( not ( = ?auto_81685 ?auto_81689 ) ) ( not ( = ?auto_81685 ?auto_81690 ) ) ( not ( = ?auto_81685 ?auto_81688 ) ) ( CLEAR ?auto_81684 ) ( ON ?auto_81685 ?auto_81686 ) ( CLEAR ?auto_81685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81689 ?auto_81690 ?auto_81688 ?auto_81691 ?auto_81687 ?auto_81686 )
      ( MAKE-4PILE ?auto_81684 ?auto_81685 ?auto_81686 ?auto_81687 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81692 - BLOCK
      ?auto_81693 - BLOCK
      ?auto_81694 - BLOCK
      ?auto_81695 - BLOCK
    )
    :vars
    (
      ?auto_81697 - BLOCK
      ?auto_81698 - BLOCK
      ?auto_81696 - BLOCK
      ?auto_81699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81692 ?auto_81693 ) ) ( not ( = ?auto_81692 ?auto_81694 ) ) ( not ( = ?auto_81692 ?auto_81695 ) ) ( not ( = ?auto_81693 ?auto_81694 ) ) ( not ( = ?auto_81693 ?auto_81695 ) ) ( not ( = ?auto_81694 ?auto_81695 ) ) ( ON ?auto_81695 ?auto_81697 ) ( not ( = ?auto_81692 ?auto_81697 ) ) ( not ( = ?auto_81693 ?auto_81697 ) ) ( not ( = ?auto_81694 ?auto_81697 ) ) ( not ( = ?auto_81695 ?auto_81697 ) ) ( ON ?auto_81694 ?auto_81695 ) ( ON-TABLE ?auto_81698 ) ( ON ?auto_81696 ?auto_81698 ) ( ON ?auto_81699 ?auto_81696 ) ( ON ?auto_81697 ?auto_81699 ) ( not ( = ?auto_81698 ?auto_81696 ) ) ( not ( = ?auto_81698 ?auto_81699 ) ) ( not ( = ?auto_81698 ?auto_81697 ) ) ( not ( = ?auto_81698 ?auto_81695 ) ) ( not ( = ?auto_81698 ?auto_81694 ) ) ( not ( = ?auto_81696 ?auto_81699 ) ) ( not ( = ?auto_81696 ?auto_81697 ) ) ( not ( = ?auto_81696 ?auto_81695 ) ) ( not ( = ?auto_81696 ?auto_81694 ) ) ( not ( = ?auto_81699 ?auto_81697 ) ) ( not ( = ?auto_81699 ?auto_81695 ) ) ( not ( = ?auto_81699 ?auto_81694 ) ) ( not ( = ?auto_81692 ?auto_81698 ) ) ( not ( = ?auto_81692 ?auto_81696 ) ) ( not ( = ?auto_81692 ?auto_81699 ) ) ( not ( = ?auto_81693 ?auto_81698 ) ) ( not ( = ?auto_81693 ?auto_81696 ) ) ( not ( = ?auto_81693 ?auto_81699 ) ) ( ON ?auto_81693 ?auto_81694 ) ( CLEAR ?auto_81693 ) ( HOLDING ?auto_81692 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81692 )
      ( MAKE-4PILE ?auto_81692 ?auto_81693 ?auto_81694 ?auto_81695 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_81700 - BLOCK
      ?auto_81701 - BLOCK
      ?auto_81702 - BLOCK
      ?auto_81703 - BLOCK
    )
    :vars
    (
      ?auto_81706 - BLOCK
      ?auto_81704 - BLOCK
      ?auto_81705 - BLOCK
      ?auto_81707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81700 ?auto_81701 ) ) ( not ( = ?auto_81700 ?auto_81702 ) ) ( not ( = ?auto_81700 ?auto_81703 ) ) ( not ( = ?auto_81701 ?auto_81702 ) ) ( not ( = ?auto_81701 ?auto_81703 ) ) ( not ( = ?auto_81702 ?auto_81703 ) ) ( ON ?auto_81703 ?auto_81706 ) ( not ( = ?auto_81700 ?auto_81706 ) ) ( not ( = ?auto_81701 ?auto_81706 ) ) ( not ( = ?auto_81702 ?auto_81706 ) ) ( not ( = ?auto_81703 ?auto_81706 ) ) ( ON ?auto_81702 ?auto_81703 ) ( ON-TABLE ?auto_81704 ) ( ON ?auto_81705 ?auto_81704 ) ( ON ?auto_81707 ?auto_81705 ) ( ON ?auto_81706 ?auto_81707 ) ( not ( = ?auto_81704 ?auto_81705 ) ) ( not ( = ?auto_81704 ?auto_81707 ) ) ( not ( = ?auto_81704 ?auto_81706 ) ) ( not ( = ?auto_81704 ?auto_81703 ) ) ( not ( = ?auto_81704 ?auto_81702 ) ) ( not ( = ?auto_81705 ?auto_81707 ) ) ( not ( = ?auto_81705 ?auto_81706 ) ) ( not ( = ?auto_81705 ?auto_81703 ) ) ( not ( = ?auto_81705 ?auto_81702 ) ) ( not ( = ?auto_81707 ?auto_81706 ) ) ( not ( = ?auto_81707 ?auto_81703 ) ) ( not ( = ?auto_81707 ?auto_81702 ) ) ( not ( = ?auto_81700 ?auto_81704 ) ) ( not ( = ?auto_81700 ?auto_81705 ) ) ( not ( = ?auto_81700 ?auto_81707 ) ) ( not ( = ?auto_81701 ?auto_81704 ) ) ( not ( = ?auto_81701 ?auto_81705 ) ) ( not ( = ?auto_81701 ?auto_81707 ) ) ( ON ?auto_81701 ?auto_81702 ) ( ON ?auto_81700 ?auto_81701 ) ( CLEAR ?auto_81700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81704 ?auto_81705 ?auto_81707 ?auto_81706 ?auto_81703 ?auto_81702 ?auto_81701 )
      ( MAKE-4PILE ?auto_81700 ?auto_81701 ?auto_81702 ?auto_81703 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81711 - BLOCK
      ?auto_81712 - BLOCK
      ?auto_81713 - BLOCK
    )
    :vars
    (
      ?auto_81714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81714 ?auto_81713 ) ( CLEAR ?auto_81714 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81711 ) ( ON ?auto_81712 ?auto_81711 ) ( ON ?auto_81713 ?auto_81712 ) ( not ( = ?auto_81711 ?auto_81712 ) ) ( not ( = ?auto_81711 ?auto_81713 ) ) ( not ( = ?auto_81711 ?auto_81714 ) ) ( not ( = ?auto_81712 ?auto_81713 ) ) ( not ( = ?auto_81712 ?auto_81714 ) ) ( not ( = ?auto_81713 ?auto_81714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81714 ?auto_81713 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81715 - BLOCK
      ?auto_81716 - BLOCK
      ?auto_81717 - BLOCK
    )
    :vars
    (
      ?auto_81718 - BLOCK
      ?auto_81719 - BLOCK
      ?auto_81720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81718 ?auto_81717 ) ( CLEAR ?auto_81718 ) ( ON-TABLE ?auto_81715 ) ( ON ?auto_81716 ?auto_81715 ) ( ON ?auto_81717 ?auto_81716 ) ( not ( = ?auto_81715 ?auto_81716 ) ) ( not ( = ?auto_81715 ?auto_81717 ) ) ( not ( = ?auto_81715 ?auto_81718 ) ) ( not ( = ?auto_81716 ?auto_81717 ) ) ( not ( = ?auto_81716 ?auto_81718 ) ) ( not ( = ?auto_81717 ?auto_81718 ) ) ( HOLDING ?auto_81719 ) ( CLEAR ?auto_81720 ) ( not ( = ?auto_81715 ?auto_81719 ) ) ( not ( = ?auto_81715 ?auto_81720 ) ) ( not ( = ?auto_81716 ?auto_81719 ) ) ( not ( = ?auto_81716 ?auto_81720 ) ) ( not ( = ?auto_81717 ?auto_81719 ) ) ( not ( = ?auto_81717 ?auto_81720 ) ) ( not ( = ?auto_81718 ?auto_81719 ) ) ( not ( = ?auto_81718 ?auto_81720 ) ) ( not ( = ?auto_81719 ?auto_81720 ) ) )
    :subtasks
    ( ( !STACK ?auto_81719 ?auto_81720 )
      ( MAKE-3PILE ?auto_81715 ?auto_81716 ?auto_81717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81721 - BLOCK
      ?auto_81722 - BLOCK
      ?auto_81723 - BLOCK
    )
    :vars
    (
      ?auto_81724 - BLOCK
      ?auto_81725 - BLOCK
      ?auto_81726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81724 ?auto_81723 ) ( ON-TABLE ?auto_81721 ) ( ON ?auto_81722 ?auto_81721 ) ( ON ?auto_81723 ?auto_81722 ) ( not ( = ?auto_81721 ?auto_81722 ) ) ( not ( = ?auto_81721 ?auto_81723 ) ) ( not ( = ?auto_81721 ?auto_81724 ) ) ( not ( = ?auto_81722 ?auto_81723 ) ) ( not ( = ?auto_81722 ?auto_81724 ) ) ( not ( = ?auto_81723 ?auto_81724 ) ) ( CLEAR ?auto_81725 ) ( not ( = ?auto_81721 ?auto_81726 ) ) ( not ( = ?auto_81721 ?auto_81725 ) ) ( not ( = ?auto_81722 ?auto_81726 ) ) ( not ( = ?auto_81722 ?auto_81725 ) ) ( not ( = ?auto_81723 ?auto_81726 ) ) ( not ( = ?auto_81723 ?auto_81725 ) ) ( not ( = ?auto_81724 ?auto_81726 ) ) ( not ( = ?auto_81724 ?auto_81725 ) ) ( not ( = ?auto_81726 ?auto_81725 ) ) ( ON ?auto_81726 ?auto_81724 ) ( CLEAR ?auto_81726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81721 ?auto_81722 ?auto_81723 ?auto_81724 )
      ( MAKE-3PILE ?auto_81721 ?auto_81722 ?auto_81723 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81727 - BLOCK
      ?auto_81728 - BLOCK
      ?auto_81729 - BLOCK
    )
    :vars
    (
      ?auto_81732 - BLOCK
      ?auto_81730 - BLOCK
      ?auto_81731 - BLOCK
      ?auto_81733 - BLOCK
      ?auto_81734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81732 ?auto_81729 ) ( ON-TABLE ?auto_81727 ) ( ON ?auto_81728 ?auto_81727 ) ( ON ?auto_81729 ?auto_81728 ) ( not ( = ?auto_81727 ?auto_81728 ) ) ( not ( = ?auto_81727 ?auto_81729 ) ) ( not ( = ?auto_81727 ?auto_81732 ) ) ( not ( = ?auto_81728 ?auto_81729 ) ) ( not ( = ?auto_81728 ?auto_81732 ) ) ( not ( = ?auto_81729 ?auto_81732 ) ) ( not ( = ?auto_81727 ?auto_81730 ) ) ( not ( = ?auto_81727 ?auto_81731 ) ) ( not ( = ?auto_81728 ?auto_81730 ) ) ( not ( = ?auto_81728 ?auto_81731 ) ) ( not ( = ?auto_81729 ?auto_81730 ) ) ( not ( = ?auto_81729 ?auto_81731 ) ) ( not ( = ?auto_81732 ?auto_81730 ) ) ( not ( = ?auto_81732 ?auto_81731 ) ) ( not ( = ?auto_81730 ?auto_81731 ) ) ( ON ?auto_81730 ?auto_81732 ) ( CLEAR ?auto_81730 ) ( HOLDING ?auto_81731 ) ( CLEAR ?auto_81733 ) ( ON-TABLE ?auto_81734 ) ( ON ?auto_81733 ?auto_81734 ) ( not ( = ?auto_81734 ?auto_81733 ) ) ( not ( = ?auto_81734 ?auto_81731 ) ) ( not ( = ?auto_81733 ?auto_81731 ) ) ( not ( = ?auto_81727 ?auto_81733 ) ) ( not ( = ?auto_81727 ?auto_81734 ) ) ( not ( = ?auto_81728 ?auto_81733 ) ) ( not ( = ?auto_81728 ?auto_81734 ) ) ( not ( = ?auto_81729 ?auto_81733 ) ) ( not ( = ?auto_81729 ?auto_81734 ) ) ( not ( = ?auto_81732 ?auto_81733 ) ) ( not ( = ?auto_81732 ?auto_81734 ) ) ( not ( = ?auto_81730 ?auto_81733 ) ) ( not ( = ?auto_81730 ?auto_81734 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81734 ?auto_81733 ?auto_81731 )
      ( MAKE-3PILE ?auto_81727 ?auto_81728 ?auto_81729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81735 - BLOCK
      ?auto_81736 - BLOCK
      ?auto_81737 - BLOCK
    )
    :vars
    (
      ?auto_81738 - BLOCK
      ?auto_81742 - BLOCK
      ?auto_81740 - BLOCK
      ?auto_81739 - BLOCK
      ?auto_81741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81738 ?auto_81737 ) ( ON-TABLE ?auto_81735 ) ( ON ?auto_81736 ?auto_81735 ) ( ON ?auto_81737 ?auto_81736 ) ( not ( = ?auto_81735 ?auto_81736 ) ) ( not ( = ?auto_81735 ?auto_81737 ) ) ( not ( = ?auto_81735 ?auto_81738 ) ) ( not ( = ?auto_81736 ?auto_81737 ) ) ( not ( = ?auto_81736 ?auto_81738 ) ) ( not ( = ?auto_81737 ?auto_81738 ) ) ( not ( = ?auto_81735 ?auto_81742 ) ) ( not ( = ?auto_81735 ?auto_81740 ) ) ( not ( = ?auto_81736 ?auto_81742 ) ) ( not ( = ?auto_81736 ?auto_81740 ) ) ( not ( = ?auto_81737 ?auto_81742 ) ) ( not ( = ?auto_81737 ?auto_81740 ) ) ( not ( = ?auto_81738 ?auto_81742 ) ) ( not ( = ?auto_81738 ?auto_81740 ) ) ( not ( = ?auto_81742 ?auto_81740 ) ) ( ON ?auto_81742 ?auto_81738 ) ( CLEAR ?auto_81739 ) ( ON-TABLE ?auto_81741 ) ( ON ?auto_81739 ?auto_81741 ) ( not ( = ?auto_81741 ?auto_81739 ) ) ( not ( = ?auto_81741 ?auto_81740 ) ) ( not ( = ?auto_81739 ?auto_81740 ) ) ( not ( = ?auto_81735 ?auto_81739 ) ) ( not ( = ?auto_81735 ?auto_81741 ) ) ( not ( = ?auto_81736 ?auto_81739 ) ) ( not ( = ?auto_81736 ?auto_81741 ) ) ( not ( = ?auto_81737 ?auto_81739 ) ) ( not ( = ?auto_81737 ?auto_81741 ) ) ( not ( = ?auto_81738 ?auto_81739 ) ) ( not ( = ?auto_81738 ?auto_81741 ) ) ( not ( = ?auto_81742 ?auto_81739 ) ) ( not ( = ?auto_81742 ?auto_81741 ) ) ( ON ?auto_81740 ?auto_81742 ) ( CLEAR ?auto_81740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81735 ?auto_81736 ?auto_81737 ?auto_81738 ?auto_81742 )
      ( MAKE-3PILE ?auto_81735 ?auto_81736 ?auto_81737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81743 - BLOCK
      ?auto_81744 - BLOCK
      ?auto_81745 - BLOCK
    )
    :vars
    (
      ?auto_81746 - BLOCK
      ?auto_81750 - BLOCK
      ?auto_81749 - BLOCK
      ?auto_81747 - BLOCK
      ?auto_81748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81746 ?auto_81745 ) ( ON-TABLE ?auto_81743 ) ( ON ?auto_81744 ?auto_81743 ) ( ON ?auto_81745 ?auto_81744 ) ( not ( = ?auto_81743 ?auto_81744 ) ) ( not ( = ?auto_81743 ?auto_81745 ) ) ( not ( = ?auto_81743 ?auto_81746 ) ) ( not ( = ?auto_81744 ?auto_81745 ) ) ( not ( = ?auto_81744 ?auto_81746 ) ) ( not ( = ?auto_81745 ?auto_81746 ) ) ( not ( = ?auto_81743 ?auto_81750 ) ) ( not ( = ?auto_81743 ?auto_81749 ) ) ( not ( = ?auto_81744 ?auto_81750 ) ) ( not ( = ?auto_81744 ?auto_81749 ) ) ( not ( = ?auto_81745 ?auto_81750 ) ) ( not ( = ?auto_81745 ?auto_81749 ) ) ( not ( = ?auto_81746 ?auto_81750 ) ) ( not ( = ?auto_81746 ?auto_81749 ) ) ( not ( = ?auto_81750 ?auto_81749 ) ) ( ON ?auto_81750 ?auto_81746 ) ( ON-TABLE ?auto_81747 ) ( not ( = ?auto_81747 ?auto_81748 ) ) ( not ( = ?auto_81747 ?auto_81749 ) ) ( not ( = ?auto_81748 ?auto_81749 ) ) ( not ( = ?auto_81743 ?auto_81748 ) ) ( not ( = ?auto_81743 ?auto_81747 ) ) ( not ( = ?auto_81744 ?auto_81748 ) ) ( not ( = ?auto_81744 ?auto_81747 ) ) ( not ( = ?auto_81745 ?auto_81748 ) ) ( not ( = ?auto_81745 ?auto_81747 ) ) ( not ( = ?auto_81746 ?auto_81748 ) ) ( not ( = ?auto_81746 ?auto_81747 ) ) ( not ( = ?auto_81750 ?auto_81748 ) ) ( not ( = ?auto_81750 ?auto_81747 ) ) ( ON ?auto_81749 ?auto_81750 ) ( CLEAR ?auto_81749 ) ( HOLDING ?auto_81748 ) ( CLEAR ?auto_81747 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81747 ?auto_81748 )
      ( MAKE-3PILE ?auto_81743 ?auto_81744 ?auto_81745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81751 - BLOCK
      ?auto_81752 - BLOCK
      ?auto_81753 - BLOCK
    )
    :vars
    (
      ?auto_81758 - BLOCK
      ?auto_81757 - BLOCK
      ?auto_81756 - BLOCK
      ?auto_81754 - BLOCK
      ?auto_81755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81758 ?auto_81753 ) ( ON-TABLE ?auto_81751 ) ( ON ?auto_81752 ?auto_81751 ) ( ON ?auto_81753 ?auto_81752 ) ( not ( = ?auto_81751 ?auto_81752 ) ) ( not ( = ?auto_81751 ?auto_81753 ) ) ( not ( = ?auto_81751 ?auto_81758 ) ) ( not ( = ?auto_81752 ?auto_81753 ) ) ( not ( = ?auto_81752 ?auto_81758 ) ) ( not ( = ?auto_81753 ?auto_81758 ) ) ( not ( = ?auto_81751 ?auto_81757 ) ) ( not ( = ?auto_81751 ?auto_81756 ) ) ( not ( = ?auto_81752 ?auto_81757 ) ) ( not ( = ?auto_81752 ?auto_81756 ) ) ( not ( = ?auto_81753 ?auto_81757 ) ) ( not ( = ?auto_81753 ?auto_81756 ) ) ( not ( = ?auto_81758 ?auto_81757 ) ) ( not ( = ?auto_81758 ?auto_81756 ) ) ( not ( = ?auto_81757 ?auto_81756 ) ) ( ON ?auto_81757 ?auto_81758 ) ( ON-TABLE ?auto_81754 ) ( not ( = ?auto_81754 ?auto_81755 ) ) ( not ( = ?auto_81754 ?auto_81756 ) ) ( not ( = ?auto_81755 ?auto_81756 ) ) ( not ( = ?auto_81751 ?auto_81755 ) ) ( not ( = ?auto_81751 ?auto_81754 ) ) ( not ( = ?auto_81752 ?auto_81755 ) ) ( not ( = ?auto_81752 ?auto_81754 ) ) ( not ( = ?auto_81753 ?auto_81755 ) ) ( not ( = ?auto_81753 ?auto_81754 ) ) ( not ( = ?auto_81758 ?auto_81755 ) ) ( not ( = ?auto_81758 ?auto_81754 ) ) ( not ( = ?auto_81757 ?auto_81755 ) ) ( not ( = ?auto_81757 ?auto_81754 ) ) ( ON ?auto_81756 ?auto_81757 ) ( CLEAR ?auto_81754 ) ( ON ?auto_81755 ?auto_81756 ) ( CLEAR ?auto_81755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81751 ?auto_81752 ?auto_81753 ?auto_81758 ?auto_81757 ?auto_81756 )
      ( MAKE-3PILE ?auto_81751 ?auto_81752 ?auto_81753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81759 - BLOCK
      ?auto_81760 - BLOCK
      ?auto_81761 - BLOCK
    )
    :vars
    (
      ?auto_81765 - BLOCK
      ?auto_81764 - BLOCK
      ?auto_81766 - BLOCK
      ?auto_81762 - BLOCK
      ?auto_81763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81765 ?auto_81761 ) ( ON-TABLE ?auto_81759 ) ( ON ?auto_81760 ?auto_81759 ) ( ON ?auto_81761 ?auto_81760 ) ( not ( = ?auto_81759 ?auto_81760 ) ) ( not ( = ?auto_81759 ?auto_81761 ) ) ( not ( = ?auto_81759 ?auto_81765 ) ) ( not ( = ?auto_81760 ?auto_81761 ) ) ( not ( = ?auto_81760 ?auto_81765 ) ) ( not ( = ?auto_81761 ?auto_81765 ) ) ( not ( = ?auto_81759 ?auto_81764 ) ) ( not ( = ?auto_81759 ?auto_81766 ) ) ( not ( = ?auto_81760 ?auto_81764 ) ) ( not ( = ?auto_81760 ?auto_81766 ) ) ( not ( = ?auto_81761 ?auto_81764 ) ) ( not ( = ?auto_81761 ?auto_81766 ) ) ( not ( = ?auto_81765 ?auto_81764 ) ) ( not ( = ?auto_81765 ?auto_81766 ) ) ( not ( = ?auto_81764 ?auto_81766 ) ) ( ON ?auto_81764 ?auto_81765 ) ( not ( = ?auto_81762 ?auto_81763 ) ) ( not ( = ?auto_81762 ?auto_81766 ) ) ( not ( = ?auto_81763 ?auto_81766 ) ) ( not ( = ?auto_81759 ?auto_81763 ) ) ( not ( = ?auto_81759 ?auto_81762 ) ) ( not ( = ?auto_81760 ?auto_81763 ) ) ( not ( = ?auto_81760 ?auto_81762 ) ) ( not ( = ?auto_81761 ?auto_81763 ) ) ( not ( = ?auto_81761 ?auto_81762 ) ) ( not ( = ?auto_81765 ?auto_81763 ) ) ( not ( = ?auto_81765 ?auto_81762 ) ) ( not ( = ?auto_81764 ?auto_81763 ) ) ( not ( = ?auto_81764 ?auto_81762 ) ) ( ON ?auto_81766 ?auto_81764 ) ( ON ?auto_81763 ?auto_81766 ) ( CLEAR ?auto_81763 ) ( HOLDING ?auto_81762 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81762 )
      ( MAKE-3PILE ?auto_81759 ?auto_81760 ?auto_81761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_81767 - BLOCK
      ?auto_81768 - BLOCK
      ?auto_81769 - BLOCK
    )
    :vars
    (
      ?auto_81771 - BLOCK
      ?auto_81772 - BLOCK
      ?auto_81774 - BLOCK
      ?auto_81770 - BLOCK
      ?auto_81773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81771 ?auto_81769 ) ( ON-TABLE ?auto_81767 ) ( ON ?auto_81768 ?auto_81767 ) ( ON ?auto_81769 ?auto_81768 ) ( not ( = ?auto_81767 ?auto_81768 ) ) ( not ( = ?auto_81767 ?auto_81769 ) ) ( not ( = ?auto_81767 ?auto_81771 ) ) ( not ( = ?auto_81768 ?auto_81769 ) ) ( not ( = ?auto_81768 ?auto_81771 ) ) ( not ( = ?auto_81769 ?auto_81771 ) ) ( not ( = ?auto_81767 ?auto_81772 ) ) ( not ( = ?auto_81767 ?auto_81774 ) ) ( not ( = ?auto_81768 ?auto_81772 ) ) ( not ( = ?auto_81768 ?auto_81774 ) ) ( not ( = ?auto_81769 ?auto_81772 ) ) ( not ( = ?auto_81769 ?auto_81774 ) ) ( not ( = ?auto_81771 ?auto_81772 ) ) ( not ( = ?auto_81771 ?auto_81774 ) ) ( not ( = ?auto_81772 ?auto_81774 ) ) ( ON ?auto_81772 ?auto_81771 ) ( not ( = ?auto_81770 ?auto_81773 ) ) ( not ( = ?auto_81770 ?auto_81774 ) ) ( not ( = ?auto_81773 ?auto_81774 ) ) ( not ( = ?auto_81767 ?auto_81773 ) ) ( not ( = ?auto_81767 ?auto_81770 ) ) ( not ( = ?auto_81768 ?auto_81773 ) ) ( not ( = ?auto_81768 ?auto_81770 ) ) ( not ( = ?auto_81769 ?auto_81773 ) ) ( not ( = ?auto_81769 ?auto_81770 ) ) ( not ( = ?auto_81771 ?auto_81773 ) ) ( not ( = ?auto_81771 ?auto_81770 ) ) ( not ( = ?auto_81772 ?auto_81773 ) ) ( not ( = ?auto_81772 ?auto_81770 ) ) ( ON ?auto_81774 ?auto_81772 ) ( ON ?auto_81773 ?auto_81774 ) ( ON ?auto_81770 ?auto_81773 ) ( CLEAR ?auto_81770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81767 ?auto_81768 ?auto_81769 ?auto_81771 ?auto_81772 ?auto_81774 ?auto_81773 )
      ( MAKE-3PILE ?auto_81767 ?auto_81768 ?auto_81769 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81780 - BLOCK
      ?auto_81781 - BLOCK
      ?auto_81782 - BLOCK
      ?auto_81783 - BLOCK
      ?auto_81784 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81784 ) ( CLEAR ?auto_81783 ) ( ON-TABLE ?auto_81780 ) ( ON ?auto_81781 ?auto_81780 ) ( ON ?auto_81782 ?auto_81781 ) ( ON ?auto_81783 ?auto_81782 ) ( not ( = ?auto_81780 ?auto_81781 ) ) ( not ( = ?auto_81780 ?auto_81782 ) ) ( not ( = ?auto_81780 ?auto_81783 ) ) ( not ( = ?auto_81780 ?auto_81784 ) ) ( not ( = ?auto_81781 ?auto_81782 ) ) ( not ( = ?auto_81781 ?auto_81783 ) ) ( not ( = ?auto_81781 ?auto_81784 ) ) ( not ( = ?auto_81782 ?auto_81783 ) ) ( not ( = ?auto_81782 ?auto_81784 ) ) ( not ( = ?auto_81783 ?auto_81784 ) ) )
    :subtasks
    ( ( !STACK ?auto_81784 ?auto_81783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81785 - BLOCK
      ?auto_81786 - BLOCK
      ?auto_81787 - BLOCK
      ?auto_81788 - BLOCK
      ?auto_81789 - BLOCK
    )
    :vars
    (
      ?auto_81790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81788 ) ( ON-TABLE ?auto_81785 ) ( ON ?auto_81786 ?auto_81785 ) ( ON ?auto_81787 ?auto_81786 ) ( ON ?auto_81788 ?auto_81787 ) ( not ( = ?auto_81785 ?auto_81786 ) ) ( not ( = ?auto_81785 ?auto_81787 ) ) ( not ( = ?auto_81785 ?auto_81788 ) ) ( not ( = ?auto_81785 ?auto_81789 ) ) ( not ( = ?auto_81786 ?auto_81787 ) ) ( not ( = ?auto_81786 ?auto_81788 ) ) ( not ( = ?auto_81786 ?auto_81789 ) ) ( not ( = ?auto_81787 ?auto_81788 ) ) ( not ( = ?auto_81787 ?auto_81789 ) ) ( not ( = ?auto_81788 ?auto_81789 ) ) ( ON ?auto_81789 ?auto_81790 ) ( CLEAR ?auto_81789 ) ( HAND-EMPTY ) ( not ( = ?auto_81785 ?auto_81790 ) ) ( not ( = ?auto_81786 ?auto_81790 ) ) ( not ( = ?auto_81787 ?auto_81790 ) ) ( not ( = ?auto_81788 ?auto_81790 ) ) ( not ( = ?auto_81789 ?auto_81790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81789 ?auto_81790 )
      ( MAKE-5PILE ?auto_81785 ?auto_81786 ?auto_81787 ?auto_81788 ?auto_81789 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81791 - BLOCK
      ?auto_81792 - BLOCK
      ?auto_81793 - BLOCK
      ?auto_81794 - BLOCK
      ?auto_81795 - BLOCK
    )
    :vars
    (
      ?auto_81796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81791 ) ( ON ?auto_81792 ?auto_81791 ) ( ON ?auto_81793 ?auto_81792 ) ( not ( = ?auto_81791 ?auto_81792 ) ) ( not ( = ?auto_81791 ?auto_81793 ) ) ( not ( = ?auto_81791 ?auto_81794 ) ) ( not ( = ?auto_81791 ?auto_81795 ) ) ( not ( = ?auto_81792 ?auto_81793 ) ) ( not ( = ?auto_81792 ?auto_81794 ) ) ( not ( = ?auto_81792 ?auto_81795 ) ) ( not ( = ?auto_81793 ?auto_81794 ) ) ( not ( = ?auto_81793 ?auto_81795 ) ) ( not ( = ?auto_81794 ?auto_81795 ) ) ( ON ?auto_81795 ?auto_81796 ) ( CLEAR ?auto_81795 ) ( not ( = ?auto_81791 ?auto_81796 ) ) ( not ( = ?auto_81792 ?auto_81796 ) ) ( not ( = ?auto_81793 ?auto_81796 ) ) ( not ( = ?auto_81794 ?auto_81796 ) ) ( not ( = ?auto_81795 ?auto_81796 ) ) ( HOLDING ?auto_81794 ) ( CLEAR ?auto_81793 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81791 ?auto_81792 ?auto_81793 ?auto_81794 )
      ( MAKE-5PILE ?auto_81791 ?auto_81792 ?auto_81793 ?auto_81794 ?auto_81795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81797 - BLOCK
      ?auto_81798 - BLOCK
      ?auto_81799 - BLOCK
      ?auto_81800 - BLOCK
      ?auto_81801 - BLOCK
    )
    :vars
    (
      ?auto_81802 - BLOCK
      ?auto_81804 - BLOCK
      ?auto_81803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81797 ) ( ON ?auto_81798 ?auto_81797 ) ( ON ?auto_81799 ?auto_81798 ) ( not ( = ?auto_81797 ?auto_81798 ) ) ( not ( = ?auto_81797 ?auto_81799 ) ) ( not ( = ?auto_81797 ?auto_81800 ) ) ( not ( = ?auto_81797 ?auto_81801 ) ) ( not ( = ?auto_81798 ?auto_81799 ) ) ( not ( = ?auto_81798 ?auto_81800 ) ) ( not ( = ?auto_81798 ?auto_81801 ) ) ( not ( = ?auto_81799 ?auto_81800 ) ) ( not ( = ?auto_81799 ?auto_81801 ) ) ( not ( = ?auto_81800 ?auto_81801 ) ) ( ON ?auto_81801 ?auto_81802 ) ( not ( = ?auto_81797 ?auto_81802 ) ) ( not ( = ?auto_81798 ?auto_81802 ) ) ( not ( = ?auto_81799 ?auto_81802 ) ) ( not ( = ?auto_81800 ?auto_81802 ) ) ( not ( = ?auto_81801 ?auto_81802 ) ) ( CLEAR ?auto_81799 ) ( ON ?auto_81800 ?auto_81801 ) ( CLEAR ?auto_81800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81804 ) ( ON ?auto_81803 ?auto_81804 ) ( ON ?auto_81802 ?auto_81803 ) ( not ( = ?auto_81804 ?auto_81803 ) ) ( not ( = ?auto_81804 ?auto_81802 ) ) ( not ( = ?auto_81804 ?auto_81801 ) ) ( not ( = ?auto_81804 ?auto_81800 ) ) ( not ( = ?auto_81803 ?auto_81802 ) ) ( not ( = ?auto_81803 ?auto_81801 ) ) ( not ( = ?auto_81803 ?auto_81800 ) ) ( not ( = ?auto_81797 ?auto_81804 ) ) ( not ( = ?auto_81797 ?auto_81803 ) ) ( not ( = ?auto_81798 ?auto_81804 ) ) ( not ( = ?auto_81798 ?auto_81803 ) ) ( not ( = ?auto_81799 ?auto_81804 ) ) ( not ( = ?auto_81799 ?auto_81803 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81804 ?auto_81803 ?auto_81802 ?auto_81801 )
      ( MAKE-5PILE ?auto_81797 ?auto_81798 ?auto_81799 ?auto_81800 ?auto_81801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81805 - BLOCK
      ?auto_81806 - BLOCK
      ?auto_81807 - BLOCK
      ?auto_81808 - BLOCK
      ?auto_81809 - BLOCK
    )
    :vars
    (
      ?auto_81812 - BLOCK
      ?auto_81810 - BLOCK
      ?auto_81811 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81805 ) ( ON ?auto_81806 ?auto_81805 ) ( not ( = ?auto_81805 ?auto_81806 ) ) ( not ( = ?auto_81805 ?auto_81807 ) ) ( not ( = ?auto_81805 ?auto_81808 ) ) ( not ( = ?auto_81805 ?auto_81809 ) ) ( not ( = ?auto_81806 ?auto_81807 ) ) ( not ( = ?auto_81806 ?auto_81808 ) ) ( not ( = ?auto_81806 ?auto_81809 ) ) ( not ( = ?auto_81807 ?auto_81808 ) ) ( not ( = ?auto_81807 ?auto_81809 ) ) ( not ( = ?auto_81808 ?auto_81809 ) ) ( ON ?auto_81809 ?auto_81812 ) ( not ( = ?auto_81805 ?auto_81812 ) ) ( not ( = ?auto_81806 ?auto_81812 ) ) ( not ( = ?auto_81807 ?auto_81812 ) ) ( not ( = ?auto_81808 ?auto_81812 ) ) ( not ( = ?auto_81809 ?auto_81812 ) ) ( ON ?auto_81808 ?auto_81809 ) ( CLEAR ?auto_81808 ) ( ON-TABLE ?auto_81810 ) ( ON ?auto_81811 ?auto_81810 ) ( ON ?auto_81812 ?auto_81811 ) ( not ( = ?auto_81810 ?auto_81811 ) ) ( not ( = ?auto_81810 ?auto_81812 ) ) ( not ( = ?auto_81810 ?auto_81809 ) ) ( not ( = ?auto_81810 ?auto_81808 ) ) ( not ( = ?auto_81811 ?auto_81812 ) ) ( not ( = ?auto_81811 ?auto_81809 ) ) ( not ( = ?auto_81811 ?auto_81808 ) ) ( not ( = ?auto_81805 ?auto_81810 ) ) ( not ( = ?auto_81805 ?auto_81811 ) ) ( not ( = ?auto_81806 ?auto_81810 ) ) ( not ( = ?auto_81806 ?auto_81811 ) ) ( not ( = ?auto_81807 ?auto_81810 ) ) ( not ( = ?auto_81807 ?auto_81811 ) ) ( HOLDING ?auto_81807 ) ( CLEAR ?auto_81806 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81805 ?auto_81806 ?auto_81807 )
      ( MAKE-5PILE ?auto_81805 ?auto_81806 ?auto_81807 ?auto_81808 ?auto_81809 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81813 - BLOCK
      ?auto_81814 - BLOCK
      ?auto_81815 - BLOCK
      ?auto_81816 - BLOCK
      ?auto_81817 - BLOCK
    )
    :vars
    (
      ?auto_81818 - BLOCK
      ?auto_81820 - BLOCK
      ?auto_81819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81813 ) ( ON ?auto_81814 ?auto_81813 ) ( not ( = ?auto_81813 ?auto_81814 ) ) ( not ( = ?auto_81813 ?auto_81815 ) ) ( not ( = ?auto_81813 ?auto_81816 ) ) ( not ( = ?auto_81813 ?auto_81817 ) ) ( not ( = ?auto_81814 ?auto_81815 ) ) ( not ( = ?auto_81814 ?auto_81816 ) ) ( not ( = ?auto_81814 ?auto_81817 ) ) ( not ( = ?auto_81815 ?auto_81816 ) ) ( not ( = ?auto_81815 ?auto_81817 ) ) ( not ( = ?auto_81816 ?auto_81817 ) ) ( ON ?auto_81817 ?auto_81818 ) ( not ( = ?auto_81813 ?auto_81818 ) ) ( not ( = ?auto_81814 ?auto_81818 ) ) ( not ( = ?auto_81815 ?auto_81818 ) ) ( not ( = ?auto_81816 ?auto_81818 ) ) ( not ( = ?auto_81817 ?auto_81818 ) ) ( ON ?auto_81816 ?auto_81817 ) ( ON-TABLE ?auto_81820 ) ( ON ?auto_81819 ?auto_81820 ) ( ON ?auto_81818 ?auto_81819 ) ( not ( = ?auto_81820 ?auto_81819 ) ) ( not ( = ?auto_81820 ?auto_81818 ) ) ( not ( = ?auto_81820 ?auto_81817 ) ) ( not ( = ?auto_81820 ?auto_81816 ) ) ( not ( = ?auto_81819 ?auto_81818 ) ) ( not ( = ?auto_81819 ?auto_81817 ) ) ( not ( = ?auto_81819 ?auto_81816 ) ) ( not ( = ?auto_81813 ?auto_81820 ) ) ( not ( = ?auto_81813 ?auto_81819 ) ) ( not ( = ?auto_81814 ?auto_81820 ) ) ( not ( = ?auto_81814 ?auto_81819 ) ) ( not ( = ?auto_81815 ?auto_81820 ) ) ( not ( = ?auto_81815 ?auto_81819 ) ) ( CLEAR ?auto_81814 ) ( ON ?auto_81815 ?auto_81816 ) ( CLEAR ?auto_81815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81820 ?auto_81819 ?auto_81818 ?auto_81817 ?auto_81816 )
      ( MAKE-5PILE ?auto_81813 ?auto_81814 ?auto_81815 ?auto_81816 ?auto_81817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81821 - BLOCK
      ?auto_81822 - BLOCK
      ?auto_81823 - BLOCK
      ?auto_81824 - BLOCK
      ?auto_81825 - BLOCK
    )
    :vars
    (
      ?auto_81827 - BLOCK
      ?auto_81828 - BLOCK
      ?auto_81826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81821 ) ( not ( = ?auto_81821 ?auto_81822 ) ) ( not ( = ?auto_81821 ?auto_81823 ) ) ( not ( = ?auto_81821 ?auto_81824 ) ) ( not ( = ?auto_81821 ?auto_81825 ) ) ( not ( = ?auto_81822 ?auto_81823 ) ) ( not ( = ?auto_81822 ?auto_81824 ) ) ( not ( = ?auto_81822 ?auto_81825 ) ) ( not ( = ?auto_81823 ?auto_81824 ) ) ( not ( = ?auto_81823 ?auto_81825 ) ) ( not ( = ?auto_81824 ?auto_81825 ) ) ( ON ?auto_81825 ?auto_81827 ) ( not ( = ?auto_81821 ?auto_81827 ) ) ( not ( = ?auto_81822 ?auto_81827 ) ) ( not ( = ?auto_81823 ?auto_81827 ) ) ( not ( = ?auto_81824 ?auto_81827 ) ) ( not ( = ?auto_81825 ?auto_81827 ) ) ( ON ?auto_81824 ?auto_81825 ) ( ON-TABLE ?auto_81828 ) ( ON ?auto_81826 ?auto_81828 ) ( ON ?auto_81827 ?auto_81826 ) ( not ( = ?auto_81828 ?auto_81826 ) ) ( not ( = ?auto_81828 ?auto_81827 ) ) ( not ( = ?auto_81828 ?auto_81825 ) ) ( not ( = ?auto_81828 ?auto_81824 ) ) ( not ( = ?auto_81826 ?auto_81827 ) ) ( not ( = ?auto_81826 ?auto_81825 ) ) ( not ( = ?auto_81826 ?auto_81824 ) ) ( not ( = ?auto_81821 ?auto_81828 ) ) ( not ( = ?auto_81821 ?auto_81826 ) ) ( not ( = ?auto_81822 ?auto_81828 ) ) ( not ( = ?auto_81822 ?auto_81826 ) ) ( not ( = ?auto_81823 ?auto_81828 ) ) ( not ( = ?auto_81823 ?auto_81826 ) ) ( ON ?auto_81823 ?auto_81824 ) ( CLEAR ?auto_81823 ) ( HOLDING ?auto_81822 ) ( CLEAR ?auto_81821 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81821 ?auto_81822 )
      ( MAKE-5PILE ?auto_81821 ?auto_81822 ?auto_81823 ?auto_81824 ?auto_81825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81829 - BLOCK
      ?auto_81830 - BLOCK
      ?auto_81831 - BLOCK
      ?auto_81832 - BLOCK
      ?auto_81833 - BLOCK
    )
    :vars
    (
      ?auto_81835 - BLOCK
      ?auto_81834 - BLOCK
      ?auto_81836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81829 ) ( not ( = ?auto_81829 ?auto_81830 ) ) ( not ( = ?auto_81829 ?auto_81831 ) ) ( not ( = ?auto_81829 ?auto_81832 ) ) ( not ( = ?auto_81829 ?auto_81833 ) ) ( not ( = ?auto_81830 ?auto_81831 ) ) ( not ( = ?auto_81830 ?auto_81832 ) ) ( not ( = ?auto_81830 ?auto_81833 ) ) ( not ( = ?auto_81831 ?auto_81832 ) ) ( not ( = ?auto_81831 ?auto_81833 ) ) ( not ( = ?auto_81832 ?auto_81833 ) ) ( ON ?auto_81833 ?auto_81835 ) ( not ( = ?auto_81829 ?auto_81835 ) ) ( not ( = ?auto_81830 ?auto_81835 ) ) ( not ( = ?auto_81831 ?auto_81835 ) ) ( not ( = ?auto_81832 ?auto_81835 ) ) ( not ( = ?auto_81833 ?auto_81835 ) ) ( ON ?auto_81832 ?auto_81833 ) ( ON-TABLE ?auto_81834 ) ( ON ?auto_81836 ?auto_81834 ) ( ON ?auto_81835 ?auto_81836 ) ( not ( = ?auto_81834 ?auto_81836 ) ) ( not ( = ?auto_81834 ?auto_81835 ) ) ( not ( = ?auto_81834 ?auto_81833 ) ) ( not ( = ?auto_81834 ?auto_81832 ) ) ( not ( = ?auto_81836 ?auto_81835 ) ) ( not ( = ?auto_81836 ?auto_81833 ) ) ( not ( = ?auto_81836 ?auto_81832 ) ) ( not ( = ?auto_81829 ?auto_81834 ) ) ( not ( = ?auto_81829 ?auto_81836 ) ) ( not ( = ?auto_81830 ?auto_81834 ) ) ( not ( = ?auto_81830 ?auto_81836 ) ) ( not ( = ?auto_81831 ?auto_81834 ) ) ( not ( = ?auto_81831 ?auto_81836 ) ) ( ON ?auto_81831 ?auto_81832 ) ( CLEAR ?auto_81829 ) ( ON ?auto_81830 ?auto_81831 ) ( CLEAR ?auto_81830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81834 ?auto_81836 ?auto_81835 ?auto_81833 ?auto_81832 ?auto_81831 )
      ( MAKE-5PILE ?auto_81829 ?auto_81830 ?auto_81831 ?auto_81832 ?auto_81833 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81837 - BLOCK
      ?auto_81838 - BLOCK
      ?auto_81839 - BLOCK
      ?auto_81840 - BLOCK
      ?auto_81841 - BLOCK
    )
    :vars
    (
      ?auto_81842 - BLOCK
      ?auto_81843 - BLOCK
      ?auto_81844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81837 ?auto_81838 ) ) ( not ( = ?auto_81837 ?auto_81839 ) ) ( not ( = ?auto_81837 ?auto_81840 ) ) ( not ( = ?auto_81837 ?auto_81841 ) ) ( not ( = ?auto_81838 ?auto_81839 ) ) ( not ( = ?auto_81838 ?auto_81840 ) ) ( not ( = ?auto_81838 ?auto_81841 ) ) ( not ( = ?auto_81839 ?auto_81840 ) ) ( not ( = ?auto_81839 ?auto_81841 ) ) ( not ( = ?auto_81840 ?auto_81841 ) ) ( ON ?auto_81841 ?auto_81842 ) ( not ( = ?auto_81837 ?auto_81842 ) ) ( not ( = ?auto_81838 ?auto_81842 ) ) ( not ( = ?auto_81839 ?auto_81842 ) ) ( not ( = ?auto_81840 ?auto_81842 ) ) ( not ( = ?auto_81841 ?auto_81842 ) ) ( ON ?auto_81840 ?auto_81841 ) ( ON-TABLE ?auto_81843 ) ( ON ?auto_81844 ?auto_81843 ) ( ON ?auto_81842 ?auto_81844 ) ( not ( = ?auto_81843 ?auto_81844 ) ) ( not ( = ?auto_81843 ?auto_81842 ) ) ( not ( = ?auto_81843 ?auto_81841 ) ) ( not ( = ?auto_81843 ?auto_81840 ) ) ( not ( = ?auto_81844 ?auto_81842 ) ) ( not ( = ?auto_81844 ?auto_81841 ) ) ( not ( = ?auto_81844 ?auto_81840 ) ) ( not ( = ?auto_81837 ?auto_81843 ) ) ( not ( = ?auto_81837 ?auto_81844 ) ) ( not ( = ?auto_81838 ?auto_81843 ) ) ( not ( = ?auto_81838 ?auto_81844 ) ) ( not ( = ?auto_81839 ?auto_81843 ) ) ( not ( = ?auto_81839 ?auto_81844 ) ) ( ON ?auto_81839 ?auto_81840 ) ( ON ?auto_81838 ?auto_81839 ) ( CLEAR ?auto_81838 ) ( HOLDING ?auto_81837 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81837 )
      ( MAKE-5PILE ?auto_81837 ?auto_81838 ?auto_81839 ?auto_81840 ?auto_81841 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_81845 - BLOCK
      ?auto_81846 - BLOCK
      ?auto_81847 - BLOCK
      ?auto_81848 - BLOCK
      ?auto_81849 - BLOCK
    )
    :vars
    (
      ?auto_81851 - BLOCK
      ?auto_81852 - BLOCK
      ?auto_81850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_81845 ?auto_81846 ) ) ( not ( = ?auto_81845 ?auto_81847 ) ) ( not ( = ?auto_81845 ?auto_81848 ) ) ( not ( = ?auto_81845 ?auto_81849 ) ) ( not ( = ?auto_81846 ?auto_81847 ) ) ( not ( = ?auto_81846 ?auto_81848 ) ) ( not ( = ?auto_81846 ?auto_81849 ) ) ( not ( = ?auto_81847 ?auto_81848 ) ) ( not ( = ?auto_81847 ?auto_81849 ) ) ( not ( = ?auto_81848 ?auto_81849 ) ) ( ON ?auto_81849 ?auto_81851 ) ( not ( = ?auto_81845 ?auto_81851 ) ) ( not ( = ?auto_81846 ?auto_81851 ) ) ( not ( = ?auto_81847 ?auto_81851 ) ) ( not ( = ?auto_81848 ?auto_81851 ) ) ( not ( = ?auto_81849 ?auto_81851 ) ) ( ON ?auto_81848 ?auto_81849 ) ( ON-TABLE ?auto_81852 ) ( ON ?auto_81850 ?auto_81852 ) ( ON ?auto_81851 ?auto_81850 ) ( not ( = ?auto_81852 ?auto_81850 ) ) ( not ( = ?auto_81852 ?auto_81851 ) ) ( not ( = ?auto_81852 ?auto_81849 ) ) ( not ( = ?auto_81852 ?auto_81848 ) ) ( not ( = ?auto_81850 ?auto_81851 ) ) ( not ( = ?auto_81850 ?auto_81849 ) ) ( not ( = ?auto_81850 ?auto_81848 ) ) ( not ( = ?auto_81845 ?auto_81852 ) ) ( not ( = ?auto_81845 ?auto_81850 ) ) ( not ( = ?auto_81846 ?auto_81852 ) ) ( not ( = ?auto_81846 ?auto_81850 ) ) ( not ( = ?auto_81847 ?auto_81852 ) ) ( not ( = ?auto_81847 ?auto_81850 ) ) ( ON ?auto_81847 ?auto_81848 ) ( ON ?auto_81846 ?auto_81847 ) ( ON ?auto_81845 ?auto_81846 ) ( CLEAR ?auto_81845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81852 ?auto_81850 ?auto_81851 ?auto_81849 ?auto_81848 ?auto_81847 ?auto_81846 )
      ( MAKE-5PILE ?auto_81845 ?auto_81846 ?auto_81847 ?auto_81848 ?auto_81849 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81855 - BLOCK
      ?auto_81856 - BLOCK
    )
    :vars
    (
      ?auto_81857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81857 ?auto_81856 ) ( CLEAR ?auto_81857 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81855 ) ( ON ?auto_81856 ?auto_81855 ) ( not ( = ?auto_81855 ?auto_81856 ) ) ( not ( = ?auto_81855 ?auto_81857 ) ) ( not ( = ?auto_81856 ?auto_81857 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81857 ?auto_81856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81858 - BLOCK
      ?auto_81859 - BLOCK
    )
    :vars
    (
      ?auto_81860 - BLOCK
      ?auto_81861 - BLOCK
      ?auto_81862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81860 ?auto_81859 ) ( CLEAR ?auto_81860 ) ( ON-TABLE ?auto_81858 ) ( ON ?auto_81859 ?auto_81858 ) ( not ( = ?auto_81858 ?auto_81859 ) ) ( not ( = ?auto_81858 ?auto_81860 ) ) ( not ( = ?auto_81859 ?auto_81860 ) ) ( HOLDING ?auto_81861 ) ( CLEAR ?auto_81862 ) ( not ( = ?auto_81858 ?auto_81861 ) ) ( not ( = ?auto_81858 ?auto_81862 ) ) ( not ( = ?auto_81859 ?auto_81861 ) ) ( not ( = ?auto_81859 ?auto_81862 ) ) ( not ( = ?auto_81860 ?auto_81861 ) ) ( not ( = ?auto_81860 ?auto_81862 ) ) ( not ( = ?auto_81861 ?auto_81862 ) ) )
    :subtasks
    ( ( !STACK ?auto_81861 ?auto_81862 )
      ( MAKE-2PILE ?auto_81858 ?auto_81859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81863 - BLOCK
      ?auto_81864 - BLOCK
    )
    :vars
    (
      ?auto_81866 - BLOCK
      ?auto_81867 - BLOCK
      ?auto_81865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81866 ?auto_81864 ) ( ON-TABLE ?auto_81863 ) ( ON ?auto_81864 ?auto_81863 ) ( not ( = ?auto_81863 ?auto_81864 ) ) ( not ( = ?auto_81863 ?auto_81866 ) ) ( not ( = ?auto_81864 ?auto_81866 ) ) ( CLEAR ?auto_81867 ) ( not ( = ?auto_81863 ?auto_81865 ) ) ( not ( = ?auto_81863 ?auto_81867 ) ) ( not ( = ?auto_81864 ?auto_81865 ) ) ( not ( = ?auto_81864 ?auto_81867 ) ) ( not ( = ?auto_81866 ?auto_81865 ) ) ( not ( = ?auto_81866 ?auto_81867 ) ) ( not ( = ?auto_81865 ?auto_81867 ) ) ( ON ?auto_81865 ?auto_81866 ) ( CLEAR ?auto_81865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81863 ?auto_81864 ?auto_81866 )
      ( MAKE-2PILE ?auto_81863 ?auto_81864 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81868 - BLOCK
      ?auto_81869 - BLOCK
    )
    :vars
    (
      ?auto_81870 - BLOCK
      ?auto_81872 - BLOCK
      ?auto_81871 - BLOCK
      ?auto_81875 - BLOCK
      ?auto_81873 - BLOCK
      ?auto_81874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81870 ?auto_81869 ) ( ON-TABLE ?auto_81868 ) ( ON ?auto_81869 ?auto_81868 ) ( not ( = ?auto_81868 ?auto_81869 ) ) ( not ( = ?auto_81868 ?auto_81870 ) ) ( not ( = ?auto_81869 ?auto_81870 ) ) ( not ( = ?auto_81868 ?auto_81872 ) ) ( not ( = ?auto_81868 ?auto_81871 ) ) ( not ( = ?auto_81869 ?auto_81872 ) ) ( not ( = ?auto_81869 ?auto_81871 ) ) ( not ( = ?auto_81870 ?auto_81872 ) ) ( not ( = ?auto_81870 ?auto_81871 ) ) ( not ( = ?auto_81872 ?auto_81871 ) ) ( ON ?auto_81872 ?auto_81870 ) ( CLEAR ?auto_81872 ) ( HOLDING ?auto_81871 ) ( CLEAR ?auto_81875 ) ( ON-TABLE ?auto_81873 ) ( ON ?auto_81874 ?auto_81873 ) ( ON ?auto_81875 ?auto_81874 ) ( not ( = ?auto_81873 ?auto_81874 ) ) ( not ( = ?auto_81873 ?auto_81875 ) ) ( not ( = ?auto_81873 ?auto_81871 ) ) ( not ( = ?auto_81874 ?auto_81875 ) ) ( not ( = ?auto_81874 ?auto_81871 ) ) ( not ( = ?auto_81875 ?auto_81871 ) ) ( not ( = ?auto_81868 ?auto_81875 ) ) ( not ( = ?auto_81868 ?auto_81873 ) ) ( not ( = ?auto_81868 ?auto_81874 ) ) ( not ( = ?auto_81869 ?auto_81875 ) ) ( not ( = ?auto_81869 ?auto_81873 ) ) ( not ( = ?auto_81869 ?auto_81874 ) ) ( not ( = ?auto_81870 ?auto_81875 ) ) ( not ( = ?auto_81870 ?auto_81873 ) ) ( not ( = ?auto_81870 ?auto_81874 ) ) ( not ( = ?auto_81872 ?auto_81875 ) ) ( not ( = ?auto_81872 ?auto_81873 ) ) ( not ( = ?auto_81872 ?auto_81874 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81873 ?auto_81874 ?auto_81875 ?auto_81871 )
      ( MAKE-2PILE ?auto_81868 ?auto_81869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81876 - BLOCK
      ?auto_81877 - BLOCK
    )
    :vars
    (
      ?auto_81883 - BLOCK
      ?auto_81882 - BLOCK
      ?auto_81880 - BLOCK
      ?auto_81881 - BLOCK
      ?auto_81879 - BLOCK
      ?auto_81878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81883 ?auto_81877 ) ( ON-TABLE ?auto_81876 ) ( ON ?auto_81877 ?auto_81876 ) ( not ( = ?auto_81876 ?auto_81877 ) ) ( not ( = ?auto_81876 ?auto_81883 ) ) ( not ( = ?auto_81877 ?auto_81883 ) ) ( not ( = ?auto_81876 ?auto_81882 ) ) ( not ( = ?auto_81876 ?auto_81880 ) ) ( not ( = ?auto_81877 ?auto_81882 ) ) ( not ( = ?auto_81877 ?auto_81880 ) ) ( not ( = ?auto_81883 ?auto_81882 ) ) ( not ( = ?auto_81883 ?auto_81880 ) ) ( not ( = ?auto_81882 ?auto_81880 ) ) ( ON ?auto_81882 ?auto_81883 ) ( CLEAR ?auto_81881 ) ( ON-TABLE ?auto_81879 ) ( ON ?auto_81878 ?auto_81879 ) ( ON ?auto_81881 ?auto_81878 ) ( not ( = ?auto_81879 ?auto_81878 ) ) ( not ( = ?auto_81879 ?auto_81881 ) ) ( not ( = ?auto_81879 ?auto_81880 ) ) ( not ( = ?auto_81878 ?auto_81881 ) ) ( not ( = ?auto_81878 ?auto_81880 ) ) ( not ( = ?auto_81881 ?auto_81880 ) ) ( not ( = ?auto_81876 ?auto_81881 ) ) ( not ( = ?auto_81876 ?auto_81879 ) ) ( not ( = ?auto_81876 ?auto_81878 ) ) ( not ( = ?auto_81877 ?auto_81881 ) ) ( not ( = ?auto_81877 ?auto_81879 ) ) ( not ( = ?auto_81877 ?auto_81878 ) ) ( not ( = ?auto_81883 ?auto_81881 ) ) ( not ( = ?auto_81883 ?auto_81879 ) ) ( not ( = ?auto_81883 ?auto_81878 ) ) ( not ( = ?auto_81882 ?auto_81881 ) ) ( not ( = ?auto_81882 ?auto_81879 ) ) ( not ( = ?auto_81882 ?auto_81878 ) ) ( ON ?auto_81880 ?auto_81882 ) ( CLEAR ?auto_81880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81876 ?auto_81877 ?auto_81883 ?auto_81882 )
      ( MAKE-2PILE ?auto_81876 ?auto_81877 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81884 - BLOCK
      ?auto_81885 - BLOCK
    )
    :vars
    (
      ?auto_81887 - BLOCK
      ?auto_81889 - BLOCK
      ?auto_81886 - BLOCK
      ?auto_81890 - BLOCK
      ?auto_81891 - BLOCK
      ?auto_81888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81887 ?auto_81885 ) ( ON-TABLE ?auto_81884 ) ( ON ?auto_81885 ?auto_81884 ) ( not ( = ?auto_81884 ?auto_81885 ) ) ( not ( = ?auto_81884 ?auto_81887 ) ) ( not ( = ?auto_81885 ?auto_81887 ) ) ( not ( = ?auto_81884 ?auto_81889 ) ) ( not ( = ?auto_81884 ?auto_81886 ) ) ( not ( = ?auto_81885 ?auto_81889 ) ) ( not ( = ?auto_81885 ?auto_81886 ) ) ( not ( = ?auto_81887 ?auto_81889 ) ) ( not ( = ?auto_81887 ?auto_81886 ) ) ( not ( = ?auto_81889 ?auto_81886 ) ) ( ON ?auto_81889 ?auto_81887 ) ( ON-TABLE ?auto_81890 ) ( ON ?auto_81891 ?auto_81890 ) ( not ( = ?auto_81890 ?auto_81891 ) ) ( not ( = ?auto_81890 ?auto_81888 ) ) ( not ( = ?auto_81890 ?auto_81886 ) ) ( not ( = ?auto_81891 ?auto_81888 ) ) ( not ( = ?auto_81891 ?auto_81886 ) ) ( not ( = ?auto_81888 ?auto_81886 ) ) ( not ( = ?auto_81884 ?auto_81888 ) ) ( not ( = ?auto_81884 ?auto_81890 ) ) ( not ( = ?auto_81884 ?auto_81891 ) ) ( not ( = ?auto_81885 ?auto_81888 ) ) ( not ( = ?auto_81885 ?auto_81890 ) ) ( not ( = ?auto_81885 ?auto_81891 ) ) ( not ( = ?auto_81887 ?auto_81888 ) ) ( not ( = ?auto_81887 ?auto_81890 ) ) ( not ( = ?auto_81887 ?auto_81891 ) ) ( not ( = ?auto_81889 ?auto_81888 ) ) ( not ( = ?auto_81889 ?auto_81890 ) ) ( not ( = ?auto_81889 ?auto_81891 ) ) ( ON ?auto_81886 ?auto_81889 ) ( CLEAR ?auto_81886 ) ( HOLDING ?auto_81888 ) ( CLEAR ?auto_81891 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81890 ?auto_81891 ?auto_81888 )
      ( MAKE-2PILE ?auto_81884 ?auto_81885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81892 - BLOCK
      ?auto_81893 - BLOCK
    )
    :vars
    (
      ?auto_81896 - BLOCK
      ?auto_81894 - BLOCK
      ?auto_81897 - BLOCK
      ?auto_81898 - BLOCK
      ?auto_81895 - BLOCK
      ?auto_81899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81896 ?auto_81893 ) ( ON-TABLE ?auto_81892 ) ( ON ?auto_81893 ?auto_81892 ) ( not ( = ?auto_81892 ?auto_81893 ) ) ( not ( = ?auto_81892 ?auto_81896 ) ) ( not ( = ?auto_81893 ?auto_81896 ) ) ( not ( = ?auto_81892 ?auto_81894 ) ) ( not ( = ?auto_81892 ?auto_81897 ) ) ( not ( = ?auto_81893 ?auto_81894 ) ) ( not ( = ?auto_81893 ?auto_81897 ) ) ( not ( = ?auto_81896 ?auto_81894 ) ) ( not ( = ?auto_81896 ?auto_81897 ) ) ( not ( = ?auto_81894 ?auto_81897 ) ) ( ON ?auto_81894 ?auto_81896 ) ( ON-TABLE ?auto_81898 ) ( ON ?auto_81895 ?auto_81898 ) ( not ( = ?auto_81898 ?auto_81895 ) ) ( not ( = ?auto_81898 ?auto_81899 ) ) ( not ( = ?auto_81898 ?auto_81897 ) ) ( not ( = ?auto_81895 ?auto_81899 ) ) ( not ( = ?auto_81895 ?auto_81897 ) ) ( not ( = ?auto_81899 ?auto_81897 ) ) ( not ( = ?auto_81892 ?auto_81899 ) ) ( not ( = ?auto_81892 ?auto_81898 ) ) ( not ( = ?auto_81892 ?auto_81895 ) ) ( not ( = ?auto_81893 ?auto_81899 ) ) ( not ( = ?auto_81893 ?auto_81898 ) ) ( not ( = ?auto_81893 ?auto_81895 ) ) ( not ( = ?auto_81896 ?auto_81899 ) ) ( not ( = ?auto_81896 ?auto_81898 ) ) ( not ( = ?auto_81896 ?auto_81895 ) ) ( not ( = ?auto_81894 ?auto_81899 ) ) ( not ( = ?auto_81894 ?auto_81898 ) ) ( not ( = ?auto_81894 ?auto_81895 ) ) ( ON ?auto_81897 ?auto_81894 ) ( CLEAR ?auto_81895 ) ( ON ?auto_81899 ?auto_81897 ) ( CLEAR ?auto_81899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81892 ?auto_81893 ?auto_81896 ?auto_81894 ?auto_81897 )
      ( MAKE-2PILE ?auto_81892 ?auto_81893 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81900 - BLOCK
      ?auto_81901 - BLOCK
    )
    :vars
    (
      ?auto_81905 - BLOCK
      ?auto_81904 - BLOCK
      ?auto_81903 - BLOCK
      ?auto_81906 - BLOCK
      ?auto_81907 - BLOCK
      ?auto_81902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81905 ?auto_81901 ) ( ON-TABLE ?auto_81900 ) ( ON ?auto_81901 ?auto_81900 ) ( not ( = ?auto_81900 ?auto_81901 ) ) ( not ( = ?auto_81900 ?auto_81905 ) ) ( not ( = ?auto_81901 ?auto_81905 ) ) ( not ( = ?auto_81900 ?auto_81904 ) ) ( not ( = ?auto_81900 ?auto_81903 ) ) ( not ( = ?auto_81901 ?auto_81904 ) ) ( not ( = ?auto_81901 ?auto_81903 ) ) ( not ( = ?auto_81905 ?auto_81904 ) ) ( not ( = ?auto_81905 ?auto_81903 ) ) ( not ( = ?auto_81904 ?auto_81903 ) ) ( ON ?auto_81904 ?auto_81905 ) ( ON-TABLE ?auto_81906 ) ( not ( = ?auto_81906 ?auto_81907 ) ) ( not ( = ?auto_81906 ?auto_81902 ) ) ( not ( = ?auto_81906 ?auto_81903 ) ) ( not ( = ?auto_81907 ?auto_81902 ) ) ( not ( = ?auto_81907 ?auto_81903 ) ) ( not ( = ?auto_81902 ?auto_81903 ) ) ( not ( = ?auto_81900 ?auto_81902 ) ) ( not ( = ?auto_81900 ?auto_81906 ) ) ( not ( = ?auto_81900 ?auto_81907 ) ) ( not ( = ?auto_81901 ?auto_81902 ) ) ( not ( = ?auto_81901 ?auto_81906 ) ) ( not ( = ?auto_81901 ?auto_81907 ) ) ( not ( = ?auto_81905 ?auto_81902 ) ) ( not ( = ?auto_81905 ?auto_81906 ) ) ( not ( = ?auto_81905 ?auto_81907 ) ) ( not ( = ?auto_81904 ?auto_81902 ) ) ( not ( = ?auto_81904 ?auto_81906 ) ) ( not ( = ?auto_81904 ?auto_81907 ) ) ( ON ?auto_81903 ?auto_81904 ) ( ON ?auto_81902 ?auto_81903 ) ( CLEAR ?auto_81902 ) ( HOLDING ?auto_81907 ) ( CLEAR ?auto_81906 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81906 ?auto_81907 )
      ( MAKE-2PILE ?auto_81900 ?auto_81901 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81908 - BLOCK
      ?auto_81909 - BLOCK
    )
    :vars
    (
      ?auto_81913 - BLOCK
      ?auto_81914 - BLOCK
      ?auto_81915 - BLOCK
      ?auto_81912 - BLOCK
      ?auto_81910 - BLOCK
      ?auto_81911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81913 ?auto_81909 ) ( ON-TABLE ?auto_81908 ) ( ON ?auto_81909 ?auto_81908 ) ( not ( = ?auto_81908 ?auto_81909 ) ) ( not ( = ?auto_81908 ?auto_81913 ) ) ( not ( = ?auto_81909 ?auto_81913 ) ) ( not ( = ?auto_81908 ?auto_81914 ) ) ( not ( = ?auto_81908 ?auto_81915 ) ) ( not ( = ?auto_81909 ?auto_81914 ) ) ( not ( = ?auto_81909 ?auto_81915 ) ) ( not ( = ?auto_81913 ?auto_81914 ) ) ( not ( = ?auto_81913 ?auto_81915 ) ) ( not ( = ?auto_81914 ?auto_81915 ) ) ( ON ?auto_81914 ?auto_81913 ) ( ON-TABLE ?auto_81912 ) ( not ( = ?auto_81912 ?auto_81910 ) ) ( not ( = ?auto_81912 ?auto_81911 ) ) ( not ( = ?auto_81912 ?auto_81915 ) ) ( not ( = ?auto_81910 ?auto_81911 ) ) ( not ( = ?auto_81910 ?auto_81915 ) ) ( not ( = ?auto_81911 ?auto_81915 ) ) ( not ( = ?auto_81908 ?auto_81911 ) ) ( not ( = ?auto_81908 ?auto_81912 ) ) ( not ( = ?auto_81908 ?auto_81910 ) ) ( not ( = ?auto_81909 ?auto_81911 ) ) ( not ( = ?auto_81909 ?auto_81912 ) ) ( not ( = ?auto_81909 ?auto_81910 ) ) ( not ( = ?auto_81913 ?auto_81911 ) ) ( not ( = ?auto_81913 ?auto_81912 ) ) ( not ( = ?auto_81913 ?auto_81910 ) ) ( not ( = ?auto_81914 ?auto_81911 ) ) ( not ( = ?auto_81914 ?auto_81912 ) ) ( not ( = ?auto_81914 ?auto_81910 ) ) ( ON ?auto_81915 ?auto_81914 ) ( ON ?auto_81911 ?auto_81915 ) ( CLEAR ?auto_81912 ) ( ON ?auto_81910 ?auto_81911 ) ( CLEAR ?auto_81910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_81908 ?auto_81909 ?auto_81913 ?auto_81914 ?auto_81915 ?auto_81911 )
      ( MAKE-2PILE ?auto_81908 ?auto_81909 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81916 - BLOCK
      ?auto_81917 - BLOCK
    )
    :vars
    (
      ?auto_81918 - BLOCK
      ?auto_81922 - BLOCK
      ?auto_81923 - BLOCK
      ?auto_81920 - BLOCK
      ?auto_81921 - BLOCK
      ?auto_81919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81918 ?auto_81917 ) ( ON-TABLE ?auto_81916 ) ( ON ?auto_81917 ?auto_81916 ) ( not ( = ?auto_81916 ?auto_81917 ) ) ( not ( = ?auto_81916 ?auto_81918 ) ) ( not ( = ?auto_81917 ?auto_81918 ) ) ( not ( = ?auto_81916 ?auto_81922 ) ) ( not ( = ?auto_81916 ?auto_81923 ) ) ( not ( = ?auto_81917 ?auto_81922 ) ) ( not ( = ?auto_81917 ?auto_81923 ) ) ( not ( = ?auto_81918 ?auto_81922 ) ) ( not ( = ?auto_81918 ?auto_81923 ) ) ( not ( = ?auto_81922 ?auto_81923 ) ) ( ON ?auto_81922 ?auto_81918 ) ( not ( = ?auto_81920 ?auto_81921 ) ) ( not ( = ?auto_81920 ?auto_81919 ) ) ( not ( = ?auto_81920 ?auto_81923 ) ) ( not ( = ?auto_81921 ?auto_81919 ) ) ( not ( = ?auto_81921 ?auto_81923 ) ) ( not ( = ?auto_81919 ?auto_81923 ) ) ( not ( = ?auto_81916 ?auto_81919 ) ) ( not ( = ?auto_81916 ?auto_81920 ) ) ( not ( = ?auto_81916 ?auto_81921 ) ) ( not ( = ?auto_81917 ?auto_81919 ) ) ( not ( = ?auto_81917 ?auto_81920 ) ) ( not ( = ?auto_81917 ?auto_81921 ) ) ( not ( = ?auto_81918 ?auto_81919 ) ) ( not ( = ?auto_81918 ?auto_81920 ) ) ( not ( = ?auto_81918 ?auto_81921 ) ) ( not ( = ?auto_81922 ?auto_81919 ) ) ( not ( = ?auto_81922 ?auto_81920 ) ) ( not ( = ?auto_81922 ?auto_81921 ) ) ( ON ?auto_81923 ?auto_81922 ) ( ON ?auto_81919 ?auto_81923 ) ( ON ?auto_81921 ?auto_81919 ) ( CLEAR ?auto_81921 ) ( HOLDING ?auto_81920 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_81920 )
      ( MAKE-2PILE ?auto_81916 ?auto_81917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_81924 - BLOCK
      ?auto_81925 - BLOCK
    )
    :vars
    (
      ?auto_81929 - BLOCK
      ?auto_81928 - BLOCK
      ?auto_81926 - BLOCK
      ?auto_81927 - BLOCK
      ?auto_81931 - BLOCK
      ?auto_81930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_81929 ?auto_81925 ) ( ON-TABLE ?auto_81924 ) ( ON ?auto_81925 ?auto_81924 ) ( not ( = ?auto_81924 ?auto_81925 ) ) ( not ( = ?auto_81924 ?auto_81929 ) ) ( not ( = ?auto_81925 ?auto_81929 ) ) ( not ( = ?auto_81924 ?auto_81928 ) ) ( not ( = ?auto_81924 ?auto_81926 ) ) ( not ( = ?auto_81925 ?auto_81928 ) ) ( not ( = ?auto_81925 ?auto_81926 ) ) ( not ( = ?auto_81929 ?auto_81928 ) ) ( not ( = ?auto_81929 ?auto_81926 ) ) ( not ( = ?auto_81928 ?auto_81926 ) ) ( ON ?auto_81928 ?auto_81929 ) ( not ( = ?auto_81927 ?auto_81931 ) ) ( not ( = ?auto_81927 ?auto_81930 ) ) ( not ( = ?auto_81927 ?auto_81926 ) ) ( not ( = ?auto_81931 ?auto_81930 ) ) ( not ( = ?auto_81931 ?auto_81926 ) ) ( not ( = ?auto_81930 ?auto_81926 ) ) ( not ( = ?auto_81924 ?auto_81930 ) ) ( not ( = ?auto_81924 ?auto_81927 ) ) ( not ( = ?auto_81924 ?auto_81931 ) ) ( not ( = ?auto_81925 ?auto_81930 ) ) ( not ( = ?auto_81925 ?auto_81927 ) ) ( not ( = ?auto_81925 ?auto_81931 ) ) ( not ( = ?auto_81929 ?auto_81930 ) ) ( not ( = ?auto_81929 ?auto_81927 ) ) ( not ( = ?auto_81929 ?auto_81931 ) ) ( not ( = ?auto_81928 ?auto_81930 ) ) ( not ( = ?auto_81928 ?auto_81927 ) ) ( not ( = ?auto_81928 ?auto_81931 ) ) ( ON ?auto_81926 ?auto_81928 ) ( ON ?auto_81930 ?auto_81926 ) ( ON ?auto_81931 ?auto_81930 ) ( ON ?auto_81927 ?auto_81931 ) ( CLEAR ?auto_81927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_81924 ?auto_81925 ?auto_81929 ?auto_81928 ?auto_81926 ?auto_81930 ?auto_81931 )
      ( MAKE-2PILE ?auto_81924 ?auto_81925 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81938 - BLOCK
      ?auto_81939 - BLOCK
      ?auto_81940 - BLOCK
      ?auto_81941 - BLOCK
      ?auto_81942 - BLOCK
      ?auto_81943 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_81943 ) ( CLEAR ?auto_81942 ) ( ON-TABLE ?auto_81938 ) ( ON ?auto_81939 ?auto_81938 ) ( ON ?auto_81940 ?auto_81939 ) ( ON ?auto_81941 ?auto_81940 ) ( ON ?auto_81942 ?auto_81941 ) ( not ( = ?auto_81938 ?auto_81939 ) ) ( not ( = ?auto_81938 ?auto_81940 ) ) ( not ( = ?auto_81938 ?auto_81941 ) ) ( not ( = ?auto_81938 ?auto_81942 ) ) ( not ( = ?auto_81938 ?auto_81943 ) ) ( not ( = ?auto_81939 ?auto_81940 ) ) ( not ( = ?auto_81939 ?auto_81941 ) ) ( not ( = ?auto_81939 ?auto_81942 ) ) ( not ( = ?auto_81939 ?auto_81943 ) ) ( not ( = ?auto_81940 ?auto_81941 ) ) ( not ( = ?auto_81940 ?auto_81942 ) ) ( not ( = ?auto_81940 ?auto_81943 ) ) ( not ( = ?auto_81941 ?auto_81942 ) ) ( not ( = ?auto_81941 ?auto_81943 ) ) ( not ( = ?auto_81942 ?auto_81943 ) ) )
    :subtasks
    ( ( !STACK ?auto_81943 ?auto_81942 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81944 - BLOCK
      ?auto_81945 - BLOCK
      ?auto_81946 - BLOCK
      ?auto_81947 - BLOCK
      ?auto_81948 - BLOCK
      ?auto_81949 - BLOCK
    )
    :vars
    (
      ?auto_81950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_81948 ) ( ON-TABLE ?auto_81944 ) ( ON ?auto_81945 ?auto_81944 ) ( ON ?auto_81946 ?auto_81945 ) ( ON ?auto_81947 ?auto_81946 ) ( ON ?auto_81948 ?auto_81947 ) ( not ( = ?auto_81944 ?auto_81945 ) ) ( not ( = ?auto_81944 ?auto_81946 ) ) ( not ( = ?auto_81944 ?auto_81947 ) ) ( not ( = ?auto_81944 ?auto_81948 ) ) ( not ( = ?auto_81944 ?auto_81949 ) ) ( not ( = ?auto_81945 ?auto_81946 ) ) ( not ( = ?auto_81945 ?auto_81947 ) ) ( not ( = ?auto_81945 ?auto_81948 ) ) ( not ( = ?auto_81945 ?auto_81949 ) ) ( not ( = ?auto_81946 ?auto_81947 ) ) ( not ( = ?auto_81946 ?auto_81948 ) ) ( not ( = ?auto_81946 ?auto_81949 ) ) ( not ( = ?auto_81947 ?auto_81948 ) ) ( not ( = ?auto_81947 ?auto_81949 ) ) ( not ( = ?auto_81948 ?auto_81949 ) ) ( ON ?auto_81949 ?auto_81950 ) ( CLEAR ?auto_81949 ) ( HAND-EMPTY ) ( not ( = ?auto_81944 ?auto_81950 ) ) ( not ( = ?auto_81945 ?auto_81950 ) ) ( not ( = ?auto_81946 ?auto_81950 ) ) ( not ( = ?auto_81947 ?auto_81950 ) ) ( not ( = ?auto_81948 ?auto_81950 ) ) ( not ( = ?auto_81949 ?auto_81950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_81949 ?auto_81950 )
      ( MAKE-6PILE ?auto_81944 ?auto_81945 ?auto_81946 ?auto_81947 ?auto_81948 ?auto_81949 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81951 - BLOCK
      ?auto_81952 - BLOCK
      ?auto_81953 - BLOCK
      ?auto_81954 - BLOCK
      ?auto_81955 - BLOCK
      ?auto_81956 - BLOCK
    )
    :vars
    (
      ?auto_81957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81951 ) ( ON ?auto_81952 ?auto_81951 ) ( ON ?auto_81953 ?auto_81952 ) ( ON ?auto_81954 ?auto_81953 ) ( not ( = ?auto_81951 ?auto_81952 ) ) ( not ( = ?auto_81951 ?auto_81953 ) ) ( not ( = ?auto_81951 ?auto_81954 ) ) ( not ( = ?auto_81951 ?auto_81955 ) ) ( not ( = ?auto_81951 ?auto_81956 ) ) ( not ( = ?auto_81952 ?auto_81953 ) ) ( not ( = ?auto_81952 ?auto_81954 ) ) ( not ( = ?auto_81952 ?auto_81955 ) ) ( not ( = ?auto_81952 ?auto_81956 ) ) ( not ( = ?auto_81953 ?auto_81954 ) ) ( not ( = ?auto_81953 ?auto_81955 ) ) ( not ( = ?auto_81953 ?auto_81956 ) ) ( not ( = ?auto_81954 ?auto_81955 ) ) ( not ( = ?auto_81954 ?auto_81956 ) ) ( not ( = ?auto_81955 ?auto_81956 ) ) ( ON ?auto_81956 ?auto_81957 ) ( CLEAR ?auto_81956 ) ( not ( = ?auto_81951 ?auto_81957 ) ) ( not ( = ?auto_81952 ?auto_81957 ) ) ( not ( = ?auto_81953 ?auto_81957 ) ) ( not ( = ?auto_81954 ?auto_81957 ) ) ( not ( = ?auto_81955 ?auto_81957 ) ) ( not ( = ?auto_81956 ?auto_81957 ) ) ( HOLDING ?auto_81955 ) ( CLEAR ?auto_81954 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81951 ?auto_81952 ?auto_81953 ?auto_81954 ?auto_81955 )
      ( MAKE-6PILE ?auto_81951 ?auto_81952 ?auto_81953 ?auto_81954 ?auto_81955 ?auto_81956 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81958 - BLOCK
      ?auto_81959 - BLOCK
      ?auto_81960 - BLOCK
      ?auto_81961 - BLOCK
      ?auto_81962 - BLOCK
      ?auto_81963 - BLOCK
    )
    :vars
    (
      ?auto_81964 - BLOCK
      ?auto_81965 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81958 ) ( ON ?auto_81959 ?auto_81958 ) ( ON ?auto_81960 ?auto_81959 ) ( ON ?auto_81961 ?auto_81960 ) ( not ( = ?auto_81958 ?auto_81959 ) ) ( not ( = ?auto_81958 ?auto_81960 ) ) ( not ( = ?auto_81958 ?auto_81961 ) ) ( not ( = ?auto_81958 ?auto_81962 ) ) ( not ( = ?auto_81958 ?auto_81963 ) ) ( not ( = ?auto_81959 ?auto_81960 ) ) ( not ( = ?auto_81959 ?auto_81961 ) ) ( not ( = ?auto_81959 ?auto_81962 ) ) ( not ( = ?auto_81959 ?auto_81963 ) ) ( not ( = ?auto_81960 ?auto_81961 ) ) ( not ( = ?auto_81960 ?auto_81962 ) ) ( not ( = ?auto_81960 ?auto_81963 ) ) ( not ( = ?auto_81961 ?auto_81962 ) ) ( not ( = ?auto_81961 ?auto_81963 ) ) ( not ( = ?auto_81962 ?auto_81963 ) ) ( ON ?auto_81963 ?auto_81964 ) ( not ( = ?auto_81958 ?auto_81964 ) ) ( not ( = ?auto_81959 ?auto_81964 ) ) ( not ( = ?auto_81960 ?auto_81964 ) ) ( not ( = ?auto_81961 ?auto_81964 ) ) ( not ( = ?auto_81962 ?auto_81964 ) ) ( not ( = ?auto_81963 ?auto_81964 ) ) ( CLEAR ?auto_81961 ) ( ON ?auto_81962 ?auto_81963 ) ( CLEAR ?auto_81962 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_81965 ) ( ON ?auto_81964 ?auto_81965 ) ( not ( = ?auto_81965 ?auto_81964 ) ) ( not ( = ?auto_81965 ?auto_81963 ) ) ( not ( = ?auto_81965 ?auto_81962 ) ) ( not ( = ?auto_81958 ?auto_81965 ) ) ( not ( = ?auto_81959 ?auto_81965 ) ) ( not ( = ?auto_81960 ?auto_81965 ) ) ( not ( = ?auto_81961 ?auto_81965 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81965 ?auto_81964 ?auto_81963 )
      ( MAKE-6PILE ?auto_81958 ?auto_81959 ?auto_81960 ?auto_81961 ?auto_81962 ?auto_81963 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81966 - BLOCK
      ?auto_81967 - BLOCK
      ?auto_81968 - BLOCK
      ?auto_81969 - BLOCK
      ?auto_81970 - BLOCK
      ?auto_81971 - BLOCK
    )
    :vars
    (
      ?auto_81972 - BLOCK
      ?auto_81973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81966 ) ( ON ?auto_81967 ?auto_81966 ) ( ON ?auto_81968 ?auto_81967 ) ( not ( = ?auto_81966 ?auto_81967 ) ) ( not ( = ?auto_81966 ?auto_81968 ) ) ( not ( = ?auto_81966 ?auto_81969 ) ) ( not ( = ?auto_81966 ?auto_81970 ) ) ( not ( = ?auto_81966 ?auto_81971 ) ) ( not ( = ?auto_81967 ?auto_81968 ) ) ( not ( = ?auto_81967 ?auto_81969 ) ) ( not ( = ?auto_81967 ?auto_81970 ) ) ( not ( = ?auto_81967 ?auto_81971 ) ) ( not ( = ?auto_81968 ?auto_81969 ) ) ( not ( = ?auto_81968 ?auto_81970 ) ) ( not ( = ?auto_81968 ?auto_81971 ) ) ( not ( = ?auto_81969 ?auto_81970 ) ) ( not ( = ?auto_81969 ?auto_81971 ) ) ( not ( = ?auto_81970 ?auto_81971 ) ) ( ON ?auto_81971 ?auto_81972 ) ( not ( = ?auto_81966 ?auto_81972 ) ) ( not ( = ?auto_81967 ?auto_81972 ) ) ( not ( = ?auto_81968 ?auto_81972 ) ) ( not ( = ?auto_81969 ?auto_81972 ) ) ( not ( = ?auto_81970 ?auto_81972 ) ) ( not ( = ?auto_81971 ?auto_81972 ) ) ( ON ?auto_81970 ?auto_81971 ) ( CLEAR ?auto_81970 ) ( ON-TABLE ?auto_81973 ) ( ON ?auto_81972 ?auto_81973 ) ( not ( = ?auto_81973 ?auto_81972 ) ) ( not ( = ?auto_81973 ?auto_81971 ) ) ( not ( = ?auto_81973 ?auto_81970 ) ) ( not ( = ?auto_81966 ?auto_81973 ) ) ( not ( = ?auto_81967 ?auto_81973 ) ) ( not ( = ?auto_81968 ?auto_81973 ) ) ( not ( = ?auto_81969 ?auto_81973 ) ) ( HOLDING ?auto_81969 ) ( CLEAR ?auto_81968 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81966 ?auto_81967 ?auto_81968 ?auto_81969 )
      ( MAKE-6PILE ?auto_81966 ?auto_81967 ?auto_81968 ?auto_81969 ?auto_81970 ?auto_81971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81974 - BLOCK
      ?auto_81975 - BLOCK
      ?auto_81976 - BLOCK
      ?auto_81977 - BLOCK
      ?auto_81978 - BLOCK
      ?auto_81979 - BLOCK
    )
    :vars
    (
      ?auto_81980 - BLOCK
      ?auto_81981 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81974 ) ( ON ?auto_81975 ?auto_81974 ) ( ON ?auto_81976 ?auto_81975 ) ( not ( = ?auto_81974 ?auto_81975 ) ) ( not ( = ?auto_81974 ?auto_81976 ) ) ( not ( = ?auto_81974 ?auto_81977 ) ) ( not ( = ?auto_81974 ?auto_81978 ) ) ( not ( = ?auto_81974 ?auto_81979 ) ) ( not ( = ?auto_81975 ?auto_81976 ) ) ( not ( = ?auto_81975 ?auto_81977 ) ) ( not ( = ?auto_81975 ?auto_81978 ) ) ( not ( = ?auto_81975 ?auto_81979 ) ) ( not ( = ?auto_81976 ?auto_81977 ) ) ( not ( = ?auto_81976 ?auto_81978 ) ) ( not ( = ?auto_81976 ?auto_81979 ) ) ( not ( = ?auto_81977 ?auto_81978 ) ) ( not ( = ?auto_81977 ?auto_81979 ) ) ( not ( = ?auto_81978 ?auto_81979 ) ) ( ON ?auto_81979 ?auto_81980 ) ( not ( = ?auto_81974 ?auto_81980 ) ) ( not ( = ?auto_81975 ?auto_81980 ) ) ( not ( = ?auto_81976 ?auto_81980 ) ) ( not ( = ?auto_81977 ?auto_81980 ) ) ( not ( = ?auto_81978 ?auto_81980 ) ) ( not ( = ?auto_81979 ?auto_81980 ) ) ( ON ?auto_81978 ?auto_81979 ) ( ON-TABLE ?auto_81981 ) ( ON ?auto_81980 ?auto_81981 ) ( not ( = ?auto_81981 ?auto_81980 ) ) ( not ( = ?auto_81981 ?auto_81979 ) ) ( not ( = ?auto_81981 ?auto_81978 ) ) ( not ( = ?auto_81974 ?auto_81981 ) ) ( not ( = ?auto_81975 ?auto_81981 ) ) ( not ( = ?auto_81976 ?auto_81981 ) ) ( not ( = ?auto_81977 ?auto_81981 ) ) ( CLEAR ?auto_81976 ) ( ON ?auto_81977 ?auto_81978 ) ( CLEAR ?auto_81977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_81981 ?auto_81980 ?auto_81979 ?auto_81978 )
      ( MAKE-6PILE ?auto_81974 ?auto_81975 ?auto_81976 ?auto_81977 ?auto_81978 ?auto_81979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81982 - BLOCK
      ?auto_81983 - BLOCK
      ?auto_81984 - BLOCK
      ?auto_81985 - BLOCK
      ?auto_81986 - BLOCK
      ?auto_81987 - BLOCK
    )
    :vars
    (
      ?auto_81988 - BLOCK
      ?auto_81989 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81982 ) ( ON ?auto_81983 ?auto_81982 ) ( not ( = ?auto_81982 ?auto_81983 ) ) ( not ( = ?auto_81982 ?auto_81984 ) ) ( not ( = ?auto_81982 ?auto_81985 ) ) ( not ( = ?auto_81982 ?auto_81986 ) ) ( not ( = ?auto_81982 ?auto_81987 ) ) ( not ( = ?auto_81983 ?auto_81984 ) ) ( not ( = ?auto_81983 ?auto_81985 ) ) ( not ( = ?auto_81983 ?auto_81986 ) ) ( not ( = ?auto_81983 ?auto_81987 ) ) ( not ( = ?auto_81984 ?auto_81985 ) ) ( not ( = ?auto_81984 ?auto_81986 ) ) ( not ( = ?auto_81984 ?auto_81987 ) ) ( not ( = ?auto_81985 ?auto_81986 ) ) ( not ( = ?auto_81985 ?auto_81987 ) ) ( not ( = ?auto_81986 ?auto_81987 ) ) ( ON ?auto_81987 ?auto_81988 ) ( not ( = ?auto_81982 ?auto_81988 ) ) ( not ( = ?auto_81983 ?auto_81988 ) ) ( not ( = ?auto_81984 ?auto_81988 ) ) ( not ( = ?auto_81985 ?auto_81988 ) ) ( not ( = ?auto_81986 ?auto_81988 ) ) ( not ( = ?auto_81987 ?auto_81988 ) ) ( ON ?auto_81986 ?auto_81987 ) ( ON-TABLE ?auto_81989 ) ( ON ?auto_81988 ?auto_81989 ) ( not ( = ?auto_81989 ?auto_81988 ) ) ( not ( = ?auto_81989 ?auto_81987 ) ) ( not ( = ?auto_81989 ?auto_81986 ) ) ( not ( = ?auto_81982 ?auto_81989 ) ) ( not ( = ?auto_81983 ?auto_81989 ) ) ( not ( = ?auto_81984 ?auto_81989 ) ) ( not ( = ?auto_81985 ?auto_81989 ) ) ( ON ?auto_81985 ?auto_81986 ) ( CLEAR ?auto_81985 ) ( HOLDING ?auto_81984 ) ( CLEAR ?auto_81983 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_81982 ?auto_81983 ?auto_81984 )
      ( MAKE-6PILE ?auto_81982 ?auto_81983 ?auto_81984 ?auto_81985 ?auto_81986 ?auto_81987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81990 - BLOCK
      ?auto_81991 - BLOCK
      ?auto_81992 - BLOCK
      ?auto_81993 - BLOCK
      ?auto_81994 - BLOCK
      ?auto_81995 - BLOCK
    )
    :vars
    (
      ?auto_81997 - BLOCK
      ?auto_81996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81990 ) ( ON ?auto_81991 ?auto_81990 ) ( not ( = ?auto_81990 ?auto_81991 ) ) ( not ( = ?auto_81990 ?auto_81992 ) ) ( not ( = ?auto_81990 ?auto_81993 ) ) ( not ( = ?auto_81990 ?auto_81994 ) ) ( not ( = ?auto_81990 ?auto_81995 ) ) ( not ( = ?auto_81991 ?auto_81992 ) ) ( not ( = ?auto_81991 ?auto_81993 ) ) ( not ( = ?auto_81991 ?auto_81994 ) ) ( not ( = ?auto_81991 ?auto_81995 ) ) ( not ( = ?auto_81992 ?auto_81993 ) ) ( not ( = ?auto_81992 ?auto_81994 ) ) ( not ( = ?auto_81992 ?auto_81995 ) ) ( not ( = ?auto_81993 ?auto_81994 ) ) ( not ( = ?auto_81993 ?auto_81995 ) ) ( not ( = ?auto_81994 ?auto_81995 ) ) ( ON ?auto_81995 ?auto_81997 ) ( not ( = ?auto_81990 ?auto_81997 ) ) ( not ( = ?auto_81991 ?auto_81997 ) ) ( not ( = ?auto_81992 ?auto_81997 ) ) ( not ( = ?auto_81993 ?auto_81997 ) ) ( not ( = ?auto_81994 ?auto_81997 ) ) ( not ( = ?auto_81995 ?auto_81997 ) ) ( ON ?auto_81994 ?auto_81995 ) ( ON-TABLE ?auto_81996 ) ( ON ?auto_81997 ?auto_81996 ) ( not ( = ?auto_81996 ?auto_81997 ) ) ( not ( = ?auto_81996 ?auto_81995 ) ) ( not ( = ?auto_81996 ?auto_81994 ) ) ( not ( = ?auto_81990 ?auto_81996 ) ) ( not ( = ?auto_81991 ?auto_81996 ) ) ( not ( = ?auto_81992 ?auto_81996 ) ) ( not ( = ?auto_81993 ?auto_81996 ) ) ( ON ?auto_81993 ?auto_81994 ) ( CLEAR ?auto_81991 ) ( ON ?auto_81992 ?auto_81993 ) ( CLEAR ?auto_81992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_81996 ?auto_81997 ?auto_81995 ?auto_81994 ?auto_81993 )
      ( MAKE-6PILE ?auto_81990 ?auto_81991 ?auto_81992 ?auto_81993 ?auto_81994 ?auto_81995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_81998 - BLOCK
      ?auto_81999 - BLOCK
      ?auto_82000 - BLOCK
      ?auto_82001 - BLOCK
      ?auto_82002 - BLOCK
      ?auto_82003 - BLOCK
    )
    :vars
    (
      ?auto_82005 - BLOCK
      ?auto_82004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81998 ) ( not ( = ?auto_81998 ?auto_81999 ) ) ( not ( = ?auto_81998 ?auto_82000 ) ) ( not ( = ?auto_81998 ?auto_82001 ) ) ( not ( = ?auto_81998 ?auto_82002 ) ) ( not ( = ?auto_81998 ?auto_82003 ) ) ( not ( = ?auto_81999 ?auto_82000 ) ) ( not ( = ?auto_81999 ?auto_82001 ) ) ( not ( = ?auto_81999 ?auto_82002 ) ) ( not ( = ?auto_81999 ?auto_82003 ) ) ( not ( = ?auto_82000 ?auto_82001 ) ) ( not ( = ?auto_82000 ?auto_82002 ) ) ( not ( = ?auto_82000 ?auto_82003 ) ) ( not ( = ?auto_82001 ?auto_82002 ) ) ( not ( = ?auto_82001 ?auto_82003 ) ) ( not ( = ?auto_82002 ?auto_82003 ) ) ( ON ?auto_82003 ?auto_82005 ) ( not ( = ?auto_81998 ?auto_82005 ) ) ( not ( = ?auto_81999 ?auto_82005 ) ) ( not ( = ?auto_82000 ?auto_82005 ) ) ( not ( = ?auto_82001 ?auto_82005 ) ) ( not ( = ?auto_82002 ?auto_82005 ) ) ( not ( = ?auto_82003 ?auto_82005 ) ) ( ON ?auto_82002 ?auto_82003 ) ( ON-TABLE ?auto_82004 ) ( ON ?auto_82005 ?auto_82004 ) ( not ( = ?auto_82004 ?auto_82005 ) ) ( not ( = ?auto_82004 ?auto_82003 ) ) ( not ( = ?auto_82004 ?auto_82002 ) ) ( not ( = ?auto_81998 ?auto_82004 ) ) ( not ( = ?auto_81999 ?auto_82004 ) ) ( not ( = ?auto_82000 ?auto_82004 ) ) ( not ( = ?auto_82001 ?auto_82004 ) ) ( ON ?auto_82001 ?auto_82002 ) ( ON ?auto_82000 ?auto_82001 ) ( CLEAR ?auto_82000 ) ( HOLDING ?auto_81999 ) ( CLEAR ?auto_81998 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_81998 ?auto_81999 )
      ( MAKE-6PILE ?auto_81998 ?auto_81999 ?auto_82000 ?auto_82001 ?auto_82002 ?auto_82003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82006 - BLOCK
      ?auto_82007 - BLOCK
      ?auto_82008 - BLOCK
      ?auto_82009 - BLOCK
      ?auto_82010 - BLOCK
      ?auto_82011 - BLOCK
    )
    :vars
    (
      ?auto_82013 - BLOCK
      ?auto_82012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82006 ) ( not ( = ?auto_82006 ?auto_82007 ) ) ( not ( = ?auto_82006 ?auto_82008 ) ) ( not ( = ?auto_82006 ?auto_82009 ) ) ( not ( = ?auto_82006 ?auto_82010 ) ) ( not ( = ?auto_82006 ?auto_82011 ) ) ( not ( = ?auto_82007 ?auto_82008 ) ) ( not ( = ?auto_82007 ?auto_82009 ) ) ( not ( = ?auto_82007 ?auto_82010 ) ) ( not ( = ?auto_82007 ?auto_82011 ) ) ( not ( = ?auto_82008 ?auto_82009 ) ) ( not ( = ?auto_82008 ?auto_82010 ) ) ( not ( = ?auto_82008 ?auto_82011 ) ) ( not ( = ?auto_82009 ?auto_82010 ) ) ( not ( = ?auto_82009 ?auto_82011 ) ) ( not ( = ?auto_82010 ?auto_82011 ) ) ( ON ?auto_82011 ?auto_82013 ) ( not ( = ?auto_82006 ?auto_82013 ) ) ( not ( = ?auto_82007 ?auto_82013 ) ) ( not ( = ?auto_82008 ?auto_82013 ) ) ( not ( = ?auto_82009 ?auto_82013 ) ) ( not ( = ?auto_82010 ?auto_82013 ) ) ( not ( = ?auto_82011 ?auto_82013 ) ) ( ON ?auto_82010 ?auto_82011 ) ( ON-TABLE ?auto_82012 ) ( ON ?auto_82013 ?auto_82012 ) ( not ( = ?auto_82012 ?auto_82013 ) ) ( not ( = ?auto_82012 ?auto_82011 ) ) ( not ( = ?auto_82012 ?auto_82010 ) ) ( not ( = ?auto_82006 ?auto_82012 ) ) ( not ( = ?auto_82007 ?auto_82012 ) ) ( not ( = ?auto_82008 ?auto_82012 ) ) ( not ( = ?auto_82009 ?auto_82012 ) ) ( ON ?auto_82009 ?auto_82010 ) ( ON ?auto_82008 ?auto_82009 ) ( CLEAR ?auto_82006 ) ( ON ?auto_82007 ?auto_82008 ) ( CLEAR ?auto_82007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82012 ?auto_82013 ?auto_82011 ?auto_82010 ?auto_82009 ?auto_82008 )
      ( MAKE-6PILE ?auto_82006 ?auto_82007 ?auto_82008 ?auto_82009 ?auto_82010 ?auto_82011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82014 - BLOCK
      ?auto_82015 - BLOCK
      ?auto_82016 - BLOCK
      ?auto_82017 - BLOCK
      ?auto_82018 - BLOCK
      ?auto_82019 - BLOCK
    )
    :vars
    (
      ?auto_82020 - BLOCK
      ?auto_82021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82014 ?auto_82015 ) ) ( not ( = ?auto_82014 ?auto_82016 ) ) ( not ( = ?auto_82014 ?auto_82017 ) ) ( not ( = ?auto_82014 ?auto_82018 ) ) ( not ( = ?auto_82014 ?auto_82019 ) ) ( not ( = ?auto_82015 ?auto_82016 ) ) ( not ( = ?auto_82015 ?auto_82017 ) ) ( not ( = ?auto_82015 ?auto_82018 ) ) ( not ( = ?auto_82015 ?auto_82019 ) ) ( not ( = ?auto_82016 ?auto_82017 ) ) ( not ( = ?auto_82016 ?auto_82018 ) ) ( not ( = ?auto_82016 ?auto_82019 ) ) ( not ( = ?auto_82017 ?auto_82018 ) ) ( not ( = ?auto_82017 ?auto_82019 ) ) ( not ( = ?auto_82018 ?auto_82019 ) ) ( ON ?auto_82019 ?auto_82020 ) ( not ( = ?auto_82014 ?auto_82020 ) ) ( not ( = ?auto_82015 ?auto_82020 ) ) ( not ( = ?auto_82016 ?auto_82020 ) ) ( not ( = ?auto_82017 ?auto_82020 ) ) ( not ( = ?auto_82018 ?auto_82020 ) ) ( not ( = ?auto_82019 ?auto_82020 ) ) ( ON ?auto_82018 ?auto_82019 ) ( ON-TABLE ?auto_82021 ) ( ON ?auto_82020 ?auto_82021 ) ( not ( = ?auto_82021 ?auto_82020 ) ) ( not ( = ?auto_82021 ?auto_82019 ) ) ( not ( = ?auto_82021 ?auto_82018 ) ) ( not ( = ?auto_82014 ?auto_82021 ) ) ( not ( = ?auto_82015 ?auto_82021 ) ) ( not ( = ?auto_82016 ?auto_82021 ) ) ( not ( = ?auto_82017 ?auto_82021 ) ) ( ON ?auto_82017 ?auto_82018 ) ( ON ?auto_82016 ?auto_82017 ) ( ON ?auto_82015 ?auto_82016 ) ( CLEAR ?auto_82015 ) ( HOLDING ?auto_82014 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82014 )
      ( MAKE-6PILE ?auto_82014 ?auto_82015 ?auto_82016 ?auto_82017 ?auto_82018 ?auto_82019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82022 - BLOCK
      ?auto_82023 - BLOCK
      ?auto_82024 - BLOCK
      ?auto_82025 - BLOCK
      ?auto_82026 - BLOCK
      ?auto_82027 - BLOCK
    )
    :vars
    (
      ?auto_82029 - BLOCK
      ?auto_82028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82022 ?auto_82023 ) ) ( not ( = ?auto_82022 ?auto_82024 ) ) ( not ( = ?auto_82022 ?auto_82025 ) ) ( not ( = ?auto_82022 ?auto_82026 ) ) ( not ( = ?auto_82022 ?auto_82027 ) ) ( not ( = ?auto_82023 ?auto_82024 ) ) ( not ( = ?auto_82023 ?auto_82025 ) ) ( not ( = ?auto_82023 ?auto_82026 ) ) ( not ( = ?auto_82023 ?auto_82027 ) ) ( not ( = ?auto_82024 ?auto_82025 ) ) ( not ( = ?auto_82024 ?auto_82026 ) ) ( not ( = ?auto_82024 ?auto_82027 ) ) ( not ( = ?auto_82025 ?auto_82026 ) ) ( not ( = ?auto_82025 ?auto_82027 ) ) ( not ( = ?auto_82026 ?auto_82027 ) ) ( ON ?auto_82027 ?auto_82029 ) ( not ( = ?auto_82022 ?auto_82029 ) ) ( not ( = ?auto_82023 ?auto_82029 ) ) ( not ( = ?auto_82024 ?auto_82029 ) ) ( not ( = ?auto_82025 ?auto_82029 ) ) ( not ( = ?auto_82026 ?auto_82029 ) ) ( not ( = ?auto_82027 ?auto_82029 ) ) ( ON ?auto_82026 ?auto_82027 ) ( ON-TABLE ?auto_82028 ) ( ON ?auto_82029 ?auto_82028 ) ( not ( = ?auto_82028 ?auto_82029 ) ) ( not ( = ?auto_82028 ?auto_82027 ) ) ( not ( = ?auto_82028 ?auto_82026 ) ) ( not ( = ?auto_82022 ?auto_82028 ) ) ( not ( = ?auto_82023 ?auto_82028 ) ) ( not ( = ?auto_82024 ?auto_82028 ) ) ( not ( = ?auto_82025 ?auto_82028 ) ) ( ON ?auto_82025 ?auto_82026 ) ( ON ?auto_82024 ?auto_82025 ) ( ON ?auto_82023 ?auto_82024 ) ( ON ?auto_82022 ?auto_82023 ) ( CLEAR ?auto_82022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82028 ?auto_82029 ?auto_82027 ?auto_82026 ?auto_82025 ?auto_82024 ?auto_82023 )
      ( MAKE-6PILE ?auto_82022 ?auto_82023 ?auto_82024 ?auto_82025 ?auto_82026 ?auto_82027 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82031 - BLOCK
    )
    :vars
    (
      ?auto_82032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82032 ?auto_82031 ) ( CLEAR ?auto_82032 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82031 ) ( not ( = ?auto_82031 ?auto_82032 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82032 ?auto_82031 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82033 - BLOCK
    )
    :vars
    (
      ?auto_82034 - BLOCK
      ?auto_82035 - BLOCK
      ?auto_82036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82034 ?auto_82033 ) ( CLEAR ?auto_82034 ) ( ON-TABLE ?auto_82033 ) ( not ( = ?auto_82033 ?auto_82034 ) ) ( HOLDING ?auto_82035 ) ( CLEAR ?auto_82036 ) ( not ( = ?auto_82033 ?auto_82035 ) ) ( not ( = ?auto_82033 ?auto_82036 ) ) ( not ( = ?auto_82034 ?auto_82035 ) ) ( not ( = ?auto_82034 ?auto_82036 ) ) ( not ( = ?auto_82035 ?auto_82036 ) ) )
    :subtasks
    ( ( !STACK ?auto_82035 ?auto_82036 )
      ( MAKE-1PILE ?auto_82033 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82037 - BLOCK
    )
    :vars
    (
      ?auto_82038 - BLOCK
      ?auto_82039 - BLOCK
      ?auto_82040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82038 ?auto_82037 ) ( ON-TABLE ?auto_82037 ) ( not ( = ?auto_82037 ?auto_82038 ) ) ( CLEAR ?auto_82039 ) ( not ( = ?auto_82037 ?auto_82040 ) ) ( not ( = ?auto_82037 ?auto_82039 ) ) ( not ( = ?auto_82038 ?auto_82040 ) ) ( not ( = ?auto_82038 ?auto_82039 ) ) ( not ( = ?auto_82040 ?auto_82039 ) ) ( ON ?auto_82040 ?auto_82038 ) ( CLEAR ?auto_82040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82037 ?auto_82038 )
      ( MAKE-1PILE ?auto_82037 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82041 - BLOCK
    )
    :vars
    (
      ?auto_82042 - BLOCK
      ?auto_82044 - BLOCK
      ?auto_82043 - BLOCK
      ?auto_82045 - BLOCK
      ?auto_82048 - BLOCK
      ?auto_82046 - BLOCK
      ?auto_82047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82042 ?auto_82041 ) ( ON-TABLE ?auto_82041 ) ( not ( = ?auto_82041 ?auto_82042 ) ) ( not ( = ?auto_82041 ?auto_82044 ) ) ( not ( = ?auto_82041 ?auto_82043 ) ) ( not ( = ?auto_82042 ?auto_82044 ) ) ( not ( = ?auto_82042 ?auto_82043 ) ) ( not ( = ?auto_82044 ?auto_82043 ) ) ( ON ?auto_82044 ?auto_82042 ) ( CLEAR ?auto_82044 ) ( HOLDING ?auto_82043 ) ( CLEAR ?auto_82045 ) ( ON-TABLE ?auto_82048 ) ( ON ?auto_82046 ?auto_82048 ) ( ON ?auto_82047 ?auto_82046 ) ( ON ?auto_82045 ?auto_82047 ) ( not ( = ?auto_82048 ?auto_82046 ) ) ( not ( = ?auto_82048 ?auto_82047 ) ) ( not ( = ?auto_82048 ?auto_82045 ) ) ( not ( = ?auto_82048 ?auto_82043 ) ) ( not ( = ?auto_82046 ?auto_82047 ) ) ( not ( = ?auto_82046 ?auto_82045 ) ) ( not ( = ?auto_82046 ?auto_82043 ) ) ( not ( = ?auto_82047 ?auto_82045 ) ) ( not ( = ?auto_82047 ?auto_82043 ) ) ( not ( = ?auto_82045 ?auto_82043 ) ) ( not ( = ?auto_82041 ?auto_82045 ) ) ( not ( = ?auto_82041 ?auto_82048 ) ) ( not ( = ?auto_82041 ?auto_82046 ) ) ( not ( = ?auto_82041 ?auto_82047 ) ) ( not ( = ?auto_82042 ?auto_82045 ) ) ( not ( = ?auto_82042 ?auto_82048 ) ) ( not ( = ?auto_82042 ?auto_82046 ) ) ( not ( = ?auto_82042 ?auto_82047 ) ) ( not ( = ?auto_82044 ?auto_82045 ) ) ( not ( = ?auto_82044 ?auto_82048 ) ) ( not ( = ?auto_82044 ?auto_82046 ) ) ( not ( = ?auto_82044 ?auto_82047 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82048 ?auto_82046 ?auto_82047 ?auto_82045 ?auto_82043 )
      ( MAKE-1PILE ?auto_82041 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82049 - BLOCK
    )
    :vars
    (
      ?auto_82056 - BLOCK
      ?auto_82052 - BLOCK
      ?auto_82054 - BLOCK
      ?auto_82053 - BLOCK
      ?auto_82050 - BLOCK
      ?auto_82055 - BLOCK
      ?auto_82051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82056 ?auto_82049 ) ( ON-TABLE ?auto_82049 ) ( not ( = ?auto_82049 ?auto_82056 ) ) ( not ( = ?auto_82049 ?auto_82052 ) ) ( not ( = ?auto_82049 ?auto_82054 ) ) ( not ( = ?auto_82056 ?auto_82052 ) ) ( not ( = ?auto_82056 ?auto_82054 ) ) ( not ( = ?auto_82052 ?auto_82054 ) ) ( ON ?auto_82052 ?auto_82056 ) ( CLEAR ?auto_82053 ) ( ON-TABLE ?auto_82050 ) ( ON ?auto_82055 ?auto_82050 ) ( ON ?auto_82051 ?auto_82055 ) ( ON ?auto_82053 ?auto_82051 ) ( not ( = ?auto_82050 ?auto_82055 ) ) ( not ( = ?auto_82050 ?auto_82051 ) ) ( not ( = ?auto_82050 ?auto_82053 ) ) ( not ( = ?auto_82050 ?auto_82054 ) ) ( not ( = ?auto_82055 ?auto_82051 ) ) ( not ( = ?auto_82055 ?auto_82053 ) ) ( not ( = ?auto_82055 ?auto_82054 ) ) ( not ( = ?auto_82051 ?auto_82053 ) ) ( not ( = ?auto_82051 ?auto_82054 ) ) ( not ( = ?auto_82053 ?auto_82054 ) ) ( not ( = ?auto_82049 ?auto_82053 ) ) ( not ( = ?auto_82049 ?auto_82050 ) ) ( not ( = ?auto_82049 ?auto_82055 ) ) ( not ( = ?auto_82049 ?auto_82051 ) ) ( not ( = ?auto_82056 ?auto_82053 ) ) ( not ( = ?auto_82056 ?auto_82050 ) ) ( not ( = ?auto_82056 ?auto_82055 ) ) ( not ( = ?auto_82056 ?auto_82051 ) ) ( not ( = ?auto_82052 ?auto_82053 ) ) ( not ( = ?auto_82052 ?auto_82050 ) ) ( not ( = ?auto_82052 ?auto_82055 ) ) ( not ( = ?auto_82052 ?auto_82051 ) ) ( ON ?auto_82054 ?auto_82052 ) ( CLEAR ?auto_82054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82049 ?auto_82056 ?auto_82052 )
      ( MAKE-1PILE ?auto_82049 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82057 - BLOCK
    )
    :vars
    (
      ?auto_82064 - BLOCK
      ?auto_82058 - BLOCK
      ?auto_82060 - BLOCK
      ?auto_82061 - BLOCK
      ?auto_82063 - BLOCK
      ?auto_82059 - BLOCK
      ?auto_82062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82064 ?auto_82057 ) ( ON-TABLE ?auto_82057 ) ( not ( = ?auto_82057 ?auto_82064 ) ) ( not ( = ?auto_82057 ?auto_82058 ) ) ( not ( = ?auto_82057 ?auto_82060 ) ) ( not ( = ?auto_82064 ?auto_82058 ) ) ( not ( = ?auto_82064 ?auto_82060 ) ) ( not ( = ?auto_82058 ?auto_82060 ) ) ( ON ?auto_82058 ?auto_82064 ) ( ON-TABLE ?auto_82061 ) ( ON ?auto_82063 ?auto_82061 ) ( ON ?auto_82059 ?auto_82063 ) ( not ( = ?auto_82061 ?auto_82063 ) ) ( not ( = ?auto_82061 ?auto_82059 ) ) ( not ( = ?auto_82061 ?auto_82062 ) ) ( not ( = ?auto_82061 ?auto_82060 ) ) ( not ( = ?auto_82063 ?auto_82059 ) ) ( not ( = ?auto_82063 ?auto_82062 ) ) ( not ( = ?auto_82063 ?auto_82060 ) ) ( not ( = ?auto_82059 ?auto_82062 ) ) ( not ( = ?auto_82059 ?auto_82060 ) ) ( not ( = ?auto_82062 ?auto_82060 ) ) ( not ( = ?auto_82057 ?auto_82062 ) ) ( not ( = ?auto_82057 ?auto_82061 ) ) ( not ( = ?auto_82057 ?auto_82063 ) ) ( not ( = ?auto_82057 ?auto_82059 ) ) ( not ( = ?auto_82064 ?auto_82062 ) ) ( not ( = ?auto_82064 ?auto_82061 ) ) ( not ( = ?auto_82064 ?auto_82063 ) ) ( not ( = ?auto_82064 ?auto_82059 ) ) ( not ( = ?auto_82058 ?auto_82062 ) ) ( not ( = ?auto_82058 ?auto_82061 ) ) ( not ( = ?auto_82058 ?auto_82063 ) ) ( not ( = ?auto_82058 ?auto_82059 ) ) ( ON ?auto_82060 ?auto_82058 ) ( CLEAR ?auto_82060 ) ( HOLDING ?auto_82062 ) ( CLEAR ?auto_82059 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82061 ?auto_82063 ?auto_82059 ?auto_82062 )
      ( MAKE-1PILE ?auto_82057 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82065 - BLOCK
    )
    :vars
    (
      ?auto_82069 - BLOCK
      ?auto_82070 - BLOCK
      ?auto_82071 - BLOCK
      ?auto_82067 - BLOCK
      ?auto_82066 - BLOCK
      ?auto_82072 - BLOCK
      ?auto_82068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82069 ?auto_82065 ) ( ON-TABLE ?auto_82065 ) ( not ( = ?auto_82065 ?auto_82069 ) ) ( not ( = ?auto_82065 ?auto_82070 ) ) ( not ( = ?auto_82065 ?auto_82071 ) ) ( not ( = ?auto_82069 ?auto_82070 ) ) ( not ( = ?auto_82069 ?auto_82071 ) ) ( not ( = ?auto_82070 ?auto_82071 ) ) ( ON ?auto_82070 ?auto_82069 ) ( ON-TABLE ?auto_82067 ) ( ON ?auto_82066 ?auto_82067 ) ( ON ?auto_82072 ?auto_82066 ) ( not ( = ?auto_82067 ?auto_82066 ) ) ( not ( = ?auto_82067 ?auto_82072 ) ) ( not ( = ?auto_82067 ?auto_82068 ) ) ( not ( = ?auto_82067 ?auto_82071 ) ) ( not ( = ?auto_82066 ?auto_82072 ) ) ( not ( = ?auto_82066 ?auto_82068 ) ) ( not ( = ?auto_82066 ?auto_82071 ) ) ( not ( = ?auto_82072 ?auto_82068 ) ) ( not ( = ?auto_82072 ?auto_82071 ) ) ( not ( = ?auto_82068 ?auto_82071 ) ) ( not ( = ?auto_82065 ?auto_82068 ) ) ( not ( = ?auto_82065 ?auto_82067 ) ) ( not ( = ?auto_82065 ?auto_82066 ) ) ( not ( = ?auto_82065 ?auto_82072 ) ) ( not ( = ?auto_82069 ?auto_82068 ) ) ( not ( = ?auto_82069 ?auto_82067 ) ) ( not ( = ?auto_82069 ?auto_82066 ) ) ( not ( = ?auto_82069 ?auto_82072 ) ) ( not ( = ?auto_82070 ?auto_82068 ) ) ( not ( = ?auto_82070 ?auto_82067 ) ) ( not ( = ?auto_82070 ?auto_82066 ) ) ( not ( = ?auto_82070 ?auto_82072 ) ) ( ON ?auto_82071 ?auto_82070 ) ( CLEAR ?auto_82072 ) ( ON ?auto_82068 ?auto_82071 ) ( CLEAR ?auto_82068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82065 ?auto_82069 ?auto_82070 ?auto_82071 )
      ( MAKE-1PILE ?auto_82065 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82073 - BLOCK
    )
    :vars
    (
      ?auto_82077 - BLOCK
      ?auto_82078 - BLOCK
      ?auto_82075 - BLOCK
      ?auto_82079 - BLOCK
      ?auto_82076 - BLOCK
      ?auto_82074 - BLOCK
      ?auto_82080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82077 ?auto_82073 ) ( ON-TABLE ?auto_82073 ) ( not ( = ?auto_82073 ?auto_82077 ) ) ( not ( = ?auto_82073 ?auto_82078 ) ) ( not ( = ?auto_82073 ?auto_82075 ) ) ( not ( = ?auto_82077 ?auto_82078 ) ) ( not ( = ?auto_82077 ?auto_82075 ) ) ( not ( = ?auto_82078 ?auto_82075 ) ) ( ON ?auto_82078 ?auto_82077 ) ( ON-TABLE ?auto_82079 ) ( ON ?auto_82076 ?auto_82079 ) ( not ( = ?auto_82079 ?auto_82076 ) ) ( not ( = ?auto_82079 ?auto_82074 ) ) ( not ( = ?auto_82079 ?auto_82080 ) ) ( not ( = ?auto_82079 ?auto_82075 ) ) ( not ( = ?auto_82076 ?auto_82074 ) ) ( not ( = ?auto_82076 ?auto_82080 ) ) ( not ( = ?auto_82076 ?auto_82075 ) ) ( not ( = ?auto_82074 ?auto_82080 ) ) ( not ( = ?auto_82074 ?auto_82075 ) ) ( not ( = ?auto_82080 ?auto_82075 ) ) ( not ( = ?auto_82073 ?auto_82080 ) ) ( not ( = ?auto_82073 ?auto_82079 ) ) ( not ( = ?auto_82073 ?auto_82076 ) ) ( not ( = ?auto_82073 ?auto_82074 ) ) ( not ( = ?auto_82077 ?auto_82080 ) ) ( not ( = ?auto_82077 ?auto_82079 ) ) ( not ( = ?auto_82077 ?auto_82076 ) ) ( not ( = ?auto_82077 ?auto_82074 ) ) ( not ( = ?auto_82078 ?auto_82080 ) ) ( not ( = ?auto_82078 ?auto_82079 ) ) ( not ( = ?auto_82078 ?auto_82076 ) ) ( not ( = ?auto_82078 ?auto_82074 ) ) ( ON ?auto_82075 ?auto_82078 ) ( ON ?auto_82080 ?auto_82075 ) ( CLEAR ?auto_82080 ) ( HOLDING ?auto_82074 ) ( CLEAR ?auto_82076 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82079 ?auto_82076 ?auto_82074 )
      ( MAKE-1PILE ?auto_82073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82081 - BLOCK
    )
    :vars
    (
      ?auto_82085 - BLOCK
      ?auto_82083 - BLOCK
      ?auto_82082 - BLOCK
      ?auto_82087 - BLOCK
      ?auto_82084 - BLOCK
      ?auto_82088 - BLOCK
      ?auto_82086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82085 ?auto_82081 ) ( ON-TABLE ?auto_82081 ) ( not ( = ?auto_82081 ?auto_82085 ) ) ( not ( = ?auto_82081 ?auto_82083 ) ) ( not ( = ?auto_82081 ?auto_82082 ) ) ( not ( = ?auto_82085 ?auto_82083 ) ) ( not ( = ?auto_82085 ?auto_82082 ) ) ( not ( = ?auto_82083 ?auto_82082 ) ) ( ON ?auto_82083 ?auto_82085 ) ( ON-TABLE ?auto_82087 ) ( ON ?auto_82084 ?auto_82087 ) ( not ( = ?auto_82087 ?auto_82084 ) ) ( not ( = ?auto_82087 ?auto_82088 ) ) ( not ( = ?auto_82087 ?auto_82086 ) ) ( not ( = ?auto_82087 ?auto_82082 ) ) ( not ( = ?auto_82084 ?auto_82088 ) ) ( not ( = ?auto_82084 ?auto_82086 ) ) ( not ( = ?auto_82084 ?auto_82082 ) ) ( not ( = ?auto_82088 ?auto_82086 ) ) ( not ( = ?auto_82088 ?auto_82082 ) ) ( not ( = ?auto_82086 ?auto_82082 ) ) ( not ( = ?auto_82081 ?auto_82086 ) ) ( not ( = ?auto_82081 ?auto_82087 ) ) ( not ( = ?auto_82081 ?auto_82084 ) ) ( not ( = ?auto_82081 ?auto_82088 ) ) ( not ( = ?auto_82085 ?auto_82086 ) ) ( not ( = ?auto_82085 ?auto_82087 ) ) ( not ( = ?auto_82085 ?auto_82084 ) ) ( not ( = ?auto_82085 ?auto_82088 ) ) ( not ( = ?auto_82083 ?auto_82086 ) ) ( not ( = ?auto_82083 ?auto_82087 ) ) ( not ( = ?auto_82083 ?auto_82084 ) ) ( not ( = ?auto_82083 ?auto_82088 ) ) ( ON ?auto_82082 ?auto_82083 ) ( ON ?auto_82086 ?auto_82082 ) ( CLEAR ?auto_82084 ) ( ON ?auto_82088 ?auto_82086 ) ( CLEAR ?auto_82088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82081 ?auto_82085 ?auto_82083 ?auto_82082 ?auto_82086 )
      ( MAKE-1PILE ?auto_82081 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82089 - BLOCK
    )
    :vars
    (
      ?auto_82094 - BLOCK
      ?auto_82090 - BLOCK
      ?auto_82093 - BLOCK
      ?auto_82092 - BLOCK
      ?auto_82095 - BLOCK
      ?auto_82096 - BLOCK
      ?auto_82091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82094 ?auto_82089 ) ( ON-TABLE ?auto_82089 ) ( not ( = ?auto_82089 ?auto_82094 ) ) ( not ( = ?auto_82089 ?auto_82090 ) ) ( not ( = ?auto_82089 ?auto_82093 ) ) ( not ( = ?auto_82094 ?auto_82090 ) ) ( not ( = ?auto_82094 ?auto_82093 ) ) ( not ( = ?auto_82090 ?auto_82093 ) ) ( ON ?auto_82090 ?auto_82094 ) ( ON-TABLE ?auto_82092 ) ( not ( = ?auto_82092 ?auto_82095 ) ) ( not ( = ?auto_82092 ?auto_82096 ) ) ( not ( = ?auto_82092 ?auto_82091 ) ) ( not ( = ?auto_82092 ?auto_82093 ) ) ( not ( = ?auto_82095 ?auto_82096 ) ) ( not ( = ?auto_82095 ?auto_82091 ) ) ( not ( = ?auto_82095 ?auto_82093 ) ) ( not ( = ?auto_82096 ?auto_82091 ) ) ( not ( = ?auto_82096 ?auto_82093 ) ) ( not ( = ?auto_82091 ?auto_82093 ) ) ( not ( = ?auto_82089 ?auto_82091 ) ) ( not ( = ?auto_82089 ?auto_82092 ) ) ( not ( = ?auto_82089 ?auto_82095 ) ) ( not ( = ?auto_82089 ?auto_82096 ) ) ( not ( = ?auto_82094 ?auto_82091 ) ) ( not ( = ?auto_82094 ?auto_82092 ) ) ( not ( = ?auto_82094 ?auto_82095 ) ) ( not ( = ?auto_82094 ?auto_82096 ) ) ( not ( = ?auto_82090 ?auto_82091 ) ) ( not ( = ?auto_82090 ?auto_82092 ) ) ( not ( = ?auto_82090 ?auto_82095 ) ) ( not ( = ?auto_82090 ?auto_82096 ) ) ( ON ?auto_82093 ?auto_82090 ) ( ON ?auto_82091 ?auto_82093 ) ( ON ?auto_82096 ?auto_82091 ) ( CLEAR ?auto_82096 ) ( HOLDING ?auto_82095 ) ( CLEAR ?auto_82092 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82092 ?auto_82095 )
      ( MAKE-1PILE ?auto_82089 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82097 - BLOCK
    )
    :vars
    (
      ?auto_82100 - BLOCK
      ?auto_82099 - BLOCK
      ?auto_82102 - BLOCK
      ?auto_82101 - BLOCK
      ?auto_82098 - BLOCK
      ?auto_82103 - BLOCK
      ?auto_82104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82100 ?auto_82097 ) ( ON-TABLE ?auto_82097 ) ( not ( = ?auto_82097 ?auto_82100 ) ) ( not ( = ?auto_82097 ?auto_82099 ) ) ( not ( = ?auto_82097 ?auto_82102 ) ) ( not ( = ?auto_82100 ?auto_82099 ) ) ( not ( = ?auto_82100 ?auto_82102 ) ) ( not ( = ?auto_82099 ?auto_82102 ) ) ( ON ?auto_82099 ?auto_82100 ) ( ON-TABLE ?auto_82101 ) ( not ( = ?auto_82101 ?auto_82098 ) ) ( not ( = ?auto_82101 ?auto_82103 ) ) ( not ( = ?auto_82101 ?auto_82104 ) ) ( not ( = ?auto_82101 ?auto_82102 ) ) ( not ( = ?auto_82098 ?auto_82103 ) ) ( not ( = ?auto_82098 ?auto_82104 ) ) ( not ( = ?auto_82098 ?auto_82102 ) ) ( not ( = ?auto_82103 ?auto_82104 ) ) ( not ( = ?auto_82103 ?auto_82102 ) ) ( not ( = ?auto_82104 ?auto_82102 ) ) ( not ( = ?auto_82097 ?auto_82104 ) ) ( not ( = ?auto_82097 ?auto_82101 ) ) ( not ( = ?auto_82097 ?auto_82098 ) ) ( not ( = ?auto_82097 ?auto_82103 ) ) ( not ( = ?auto_82100 ?auto_82104 ) ) ( not ( = ?auto_82100 ?auto_82101 ) ) ( not ( = ?auto_82100 ?auto_82098 ) ) ( not ( = ?auto_82100 ?auto_82103 ) ) ( not ( = ?auto_82099 ?auto_82104 ) ) ( not ( = ?auto_82099 ?auto_82101 ) ) ( not ( = ?auto_82099 ?auto_82098 ) ) ( not ( = ?auto_82099 ?auto_82103 ) ) ( ON ?auto_82102 ?auto_82099 ) ( ON ?auto_82104 ?auto_82102 ) ( ON ?auto_82103 ?auto_82104 ) ( CLEAR ?auto_82101 ) ( ON ?auto_82098 ?auto_82103 ) ( CLEAR ?auto_82098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82097 ?auto_82100 ?auto_82099 ?auto_82102 ?auto_82104 ?auto_82103 )
      ( MAKE-1PILE ?auto_82097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82105 - BLOCK
    )
    :vars
    (
      ?auto_82106 - BLOCK
      ?auto_82109 - BLOCK
      ?auto_82110 - BLOCK
      ?auto_82111 - BLOCK
      ?auto_82108 - BLOCK
      ?auto_82107 - BLOCK
      ?auto_82112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82106 ?auto_82105 ) ( ON-TABLE ?auto_82105 ) ( not ( = ?auto_82105 ?auto_82106 ) ) ( not ( = ?auto_82105 ?auto_82109 ) ) ( not ( = ?auto_82105 ?auto_82110 ) ) ( not ( = ?auto_82106 ?auto_82109 ) ) ( not ( = ?auto_82106 ?auto_82110 ) ) ( not ( = ?auto_82109 ?auto_82110 ) ) ( ON ?auto_82109 ?auto_82106 ) ( not ( = ?auto_82111 ?auto_82108 ) ) ( not ( = ?auto_82111 ?auto_82107 ) ) ( not ( = ?auto_82111 ?auto_82112 ) ) ( not ( = ?auto_82111 ?auto_82110 ) ) ( not ( = ?auto_82108 ?auto_82107 ) ) ( not ( = ?auto_82108 ?auto_82112 ) ) ( not ( = ?auto_82108 ?auto_82110 ) ) ( not ( = ?auto_82107 ?auto_82112 ) ) ( not ( = ?auto_82107 ?auto_82110 ) ) ( not ( = ?auto_82112 ?auto_82110 ) ) ( not ( = ?auto_82105 ?auto_82112 ) ) ( not ( = ?auto_82105 ?auto_82111 ) ) ( not ( = ?auto_82105 ?auto_82108 ) ) ( not ( = ?auto_82105 ?auto_82107 ) ) ( not ( = ?auto_82106 ?auto_82112 ) ) ( not ( = ?auto_82106 ?auto_82111 ) ) ( not ( = ?auto_82106 ?auto_82108 ) ) ( not ( = ?auto_82106 ?auto_82107 ) ) ( not ( = ?auto_82109 ?auto_82112 ) ) ( not ( = ?auto_82109 ?auto_82111 ) ) ( not ( = ?auto_82109 ?auto_82108 ) ) ( not ( = ?auto_82109 ?auto_82107 ) ) ( ON ?auto_82110 ?auto_82109 ) ( ON ?auto_82112 ?auto_82110 ) ( ON ?auto_82107 ?auto_82112 ) ( ON ?auto_82108 ?auto_82107 ) ( CLEAR ?auto_82108 ) ( HOLDING ?auto_82111 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82111 )
      ( MAKE-1PILE ?auto_82105 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82113 - BLOCK
    )
    :vars
    (
      ?auto_82117 - BLOCK
      ?auto_82120 - BLOCK
      ?auto_82119 - BLOCK
      ?auto_82116 - BLOCK
      ?auto_82118 - BLOCK
      ?auto_82114 - BLOCK
      ?auto_82115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82117 ?auto_82113 ) ( ON-TABLE ?auto_82113 ) ( not ( = ?auto_82113 ?auto_82117 ) ) ( not ( = ?auto_82113 ?auto_82120 ) ) ( not ( = ?auto_82113 ?auto_82119 ) ) ( not ( = ?auto_82117 ?auto_82120 ) ) ( not ( = ?auto_82117 ?auto_82119 ) ) ( not ( = ?auto_82120 ?auto_82119 ) ) ( ON ?auto_82120 ?auto_82117 ) ( not ( = ?auto_82116 ?auto_82118 ) ) ( not ( = ?auto_82116 ?auto_82114 ) ) ( not ( = ?auto_82116 ?auto_82115 ) ) ( not ( = ?auto_82116 ?auto_82119 ) ) ( not ( = ?auto_82118 ?auto_82114 ) ) ( not ( = ?auto_82118 ?auto_82115 ) ) ( not ( = ?auto_82118 ?auto_82119 ) ) ( not ( = ?auto_82114 ?auto_82115 ) ) ( not ( = ?auto_82114 ?auto_82119 ) ) ( not ( = ?auto_82115 ?auto_82119 ) ) ( not ( = ?auto_82113 ?auto_82115 ) ) ( not ( = ?auto_82113 ?auto_82116 ) ) ( not ( = ?auto_82113 ?auto_82118 ) ) ( not ( = ?auto_82113 ?auto_82114 ) ) ( not ( = ?auto_82117 ?auto_82115 ) ) ( not ( = ?auto_82117 ?auto_82116 ) ) ( not ( = ?auto_82117 ?auto_82118 ) ) ( not ( = ?auto_82117 ?auto_82114 ) ) ( not ( = ?auto_82120 ?auto_82115 ) ) ( not ( = ?auto_82120 ?auto_82116 ) ) ( not ( = ?auto_82120 ?auto_82118 ) ) ( not ( = ?auto_82120 ?auto_82114 ) ) ( ON ?auto_82119 ?auto_82120 ) ( ON ?auto_82115 ?auto_82119 ) ( ON ?auto_82114 ?auto_82115 ) ( ON ?auto_82118 ?auto_82114 ) ( ON ?auto_82116 ?auto_82118 ) ( CLEAR ?auto_82116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82113 ?auto_82117 ?auto_82120 ?auto_82119 ?auto_82115 ?auto_82114 ?auto_82118 )
      ( MAKE-1PILE ?auto_82113 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82128 - BLOCK
      ?auto_82129 - BLOCK
      ?auto_82130 - BLOCK
      ?auto_82131 - BLOCK
      ?auto_82132 - BLOCK
      ?auto_82133 - BLOCK
      ?auto_82134 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_82134 ) ( CLEAR ?auto_82133 ) ( ON-TABLE ?auto_82128 ) ( ON ?auto_82129 ?auto_82128 ) ( ON ?auto_82130 ?auto_82129 ) ( ON ?auto_82131 ?auto_82130 ) ( ON ?auto_82132 ?auto_82131 ) ( ON ?auto_82133 ?auto_82132 ) ( not ( = ?auto_82128 ?auto_82129 ) ) ( not ( = ?auto_82128 ?auto_82130 ) ) ( not ( = ?auto_82128 ?auto_82131 ) ) ( not ( = ?auto_82128 ?auto_82132 ) ) ( not ( = ?auto_82128 ?auto_82133 ) ) ( not ( = ?auto_82128 ?auto_82134 ) ) ( not ( = ?auto_82129 ?auto_82130 ) ) ( not ( = ?auto_82129 ?auto_82131 ) ) ( not ( = ?auto_82129 ?auto_82132 ) ) ( not ( = ?auto_82129 ?auto_82133 ) ) ( not ( = ?auto_82129 ?auto_82134 ) ) ( not ( = ?auto_82130 ?auto_82131 ) ) ( not ( = ?auto_82130 ?auto_82132 ) ) ( not ( = ?auto_82130 ?auto_82133 ) ) ( not ( = ?auto_82130 ?auto_82134 ) ) ( not ( = ?auto_82131 ?auto_82132 ) ) ( not ( = ?auto_82131 ?auto_82133 ) ) ( not ( = ?auto_82131 ?auto_82134 ) ) ( not ( = ?auto_82132 ?auto_82133 ) ) ( not ( = ?auto_82132 ?auto_82134 ) ) ( not ( = ?auto_82133 ?auto_82134 ) ) )
    :subtasks
    ( ( !STACK ?auto_82134 ?auto_82133 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82135 - BLOCK
      ?auto_82136 - BLOCK
      ?auto_82137 - BLOCK
      ?auto_82138 - BLOCK
      ?auto_82139 - BLOCK
      ?auto_82140 - BLOCK
      ?auto_82141 - BLOCK
    )
    :vars
    (
      ?auto_82142 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82140 ) ( ON-TABLE ?auto_82135 ) ( ON ?auto_82136 ?auto_82135 ) ( ON ?auto_82137 ?auto_82136 ) ( ON ?auto_82138 ?auto_82137 ) ( ON ?auto_82139 ?auto_82138 ) ( ON ?auto_82140 ?auto_82139 ) ( not ( = ?auto_82135 ?auto_82136 ) ) ( not ( = ?auto_82135 ?auto_82137 ) ) ( not ( = ?auto_82135 ?auto_82138 ) ) ( not ( = ?auto_82135 ?auto_82139 ) ) ( not ( = ?auto_82135 ?auto_82140 ) ) ( not ( = ?auto_82135 ?auto_82141 ) ) ( not ( = ?auto_82136 ?auto_82137 ) ) ( not ( = ?auto_82136 ?auto_82138 ) ) ( not ( = ?auto_82136 ?auto_82139 ) ) ( not ( = ?auto_82136 ?auto_82140 ) ) ( not ( = ?auto_82136 ?auto_82141 ) ) ( not ( = ?auto_82137 ?auto_82138 ) ) ( not ( = ?auto_82137 ?auto_82139 ) ) ( not ( = ?auto_82137 ?auto_82140 ) ) ( not ( = ?auto_82137 ?auto_82141 ) ) ( not ( = ?auto_82138 ?auto_82139 ) ) ( not ( = ?auto_82138 ?auto_82140 ) ) ( not ( = ?auto_82138 ?auto_82141 ) ) ( not ( = ?auto_82139 ?auto_82140 ) ) ( not ( = ?auto_82139 ?auto_82141 ) ) ( not ( = ?auto_82140 ?auto_82141 ) ) ( ON ?auto_82141 ?auto_82142 ) ( CLEAR ?auto_82141 ) ( HAND-EMPTY ) ( not ( = ?auto_82135 ?auto_82142 ) ) ( not ( = ?auto_82136 ?auto_82142 ) ) ( not ( = ?auto_82137 ?auto_82142 ) ) ( not ( = ?auto_82138 ?auto_82142 ) ) ( not ( = ?auto_82139 ?auto_82142 ) ) ( not ( = ?auto_82140 ?auto_82142 ) ) ( not ( = ?auto_82141 ?auto_82142 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82141 ?auto_82142 )
      ( MAKE-7PILE ?auto_82135 ?auto_82136 ?auto_82137 ?auto_82138 ?auto_82139 ?auto_82140 ?auto_82141 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82143 - BLOCK
      ?auto_82144 - BLOCK
      ?auto_82145 - BLOCK
      ?auto_82146 - BLOCK
      ?auto_82147 - BLOCK
      ?auto_82148 - BLOCK
      ?auto_82149 - BLOCK
    )
    :vars
    (
      ?auto_82150 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82143 ) ( ON ?auto_82144 ?auto_82143 ) ( ON ?auto_82145 ?auto_82144 ) ( ON ?auto_82146 ?auto_82145 ) ( ON ?auto_82147 ?auto_82146 ) ( not ( = ?auto_82143 ?auto_82144 ) ) ( not ( = ?auto_82143 ?auto_82145 ) ) ( not ( = ?auto_82143 ?auto_82146 ) ) ( not ( = ?auto_82143 ?auto_82147 ) ) ( not ( = ?auto_82143 ?auto_82148 ) ) ( not ( = ?auto_82143 ?auto_82149 ) ) ( not ( = ?auto_82144 ?auto_82145 ) ) ( not ( = ?auto_82144 ?auto_82146 ) ) ( not ( = ?auto_82144 ?auto_82147 ) ) ( not ( = ?auto_82144 ?auto_82148 ) ) ( not ( = ?auto_82144 ?auto_82149 ) ) ( not ( = ?auto_82145 ?auto_82146 ) ) ( not ( = ?auto_82145 ?auto_82147 ) ) ( not ( = ?auto_82145 ?auto_82148 ) ) ( not ( = ?auto_82145 ?auto_82149 ) ) ( not ( = ?auto_82146 ?auto_82147 ) ) ( not ( = ?auto_82146 ?auto_82148 ) ) ( not ( = ?auto_82146 ?auto_82149 ) ) ( not ( = ?auto_82147 ?auto_82148 ) ) ( not ( = ?auto_82147 ?auto_82149 ) ) ( not ( = ?auto_82148 ?auto_82149 ) ) ( ON ?auto_82149 ?auto_82150 ) ( CLEAR ?auto_82149 ) ( not ( = ?auto_82143 ?auto_82150 ) ) ( not ( = ?auto_82144 ?auto_82150 ) ) ( not ( = ?auto_82145 ?auto_82150 ) ) ( not ( = ?auto_82146 ?auto_82150 ) ) ( not ( = ?auto_82147 ?auto_82150 ) ) ( not ( = ?auto_82148 ?auto_82150 ) ) ( not ( = ?auto_82149 ?auto_82150 ) ) ( HOLDING ?auto_82148 ) ( CLEAR ?auto_82147 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82143 ?auto_82144 ?auto_82145 ?auto_82146 ?auto_82147 ?auto_82148 )
      ( MAKE-7PILE ?auto_82143 ?auto_82144 ?auto_82145 ?auto_82146 ?auto_82147 ?auto_82148 ?auto_82149 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82151 - BLOCK
      ?auto_82152 - BLOCK
      ?auto_82153 - BLOCK
      ?auto_82154 - BLOCK
      ?auto_82155 - BLOCK
      ?auto_82156 - BLOCK
      ?auto_82157 - BLOCK
    )
    :vars
    (
      ?auto_82158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82151 ) ( ON ?auto_82152 ?auto_82151 ) ( ON ?auto_82153 ?auto_82152 ) ( ON ?auto_82154 ?auto_82153 ) ( ON ?auto_82155 ?auto_82154 ) ( not ( = ?auto_82151 ?auto_82152 ) ) ( not ( = ?auto_82151 ?auto_82153 ) ) ( not ( = ?auto_82151 ?auto_82154 ) ) ( not ( = ?auto_82151 ?auto_82155 ) ) ( not ( = ?auto_82151 ?auto_82156 ) ) ( not ( = ?auto_82151 ?auto_82157 ) ) ( not ( = ?auto_82152 ?auto_82153 ) ) ( not ( = ?auto_82152 ?auto_82154 ) ) ( not ( = ?auto_82152 ?auto_82155 ) ) ( not ( = ?auto_82152 ?auto_82156 ) ) ( not ( = ?auto_82152 ?auto_82157 ) ) ( not ( = ?auto_82153 ?auto_82154 ) ) ( not ( = ?auto_82153 ?auto_82155 ) ) ( not ( = ?auto_82153 ?auto_82156 ) ) ( not ( = ?auto_82153 ?auto_82157 ) ) ( not ( = ?auto_82154 ?auto_82155 ) ) ( not ( = ?auto_82154 ?auto_82156 ) ) ( not ( = ?auto_82154 ?auto_82157 ) ) ( not ( = ?auto_82155 ?auto_82156 ) ) ( not ( = ?auto_82155 ?auto_82157 ) ) ( not ( = ?auto_82156 ?auto_82157 ) ) ( ON ?auto_82157 ?auto_82158 ) ( not ( = ?auto_82151 ?auto_82158 ) ) ( not ( = ?auto_82152 ?auto_82158 ) ) ( not ( = ?auto_82153 ?auto_82158 ) ) ( not ( = ?auto_82154 ?auto_82158 ) ) ( not ( = ?auto_82155 ?auto_82158 ) ) ( not ( = ?auto_82156 ?auto_82158 ) ) ( not ( = ?auto_82157 ?auto_82158 ) ) ( CLEAR ?auto_82155 ) ( ON ?auto_82156 ?auto_82157 ) ( CLEAR ?auto_82156 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82158 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82158 ?auto_82157 )
      ( MAKE-7PILE ?auto_82151 ?auto_82152 ?auto_82153 ?auto_82154 ?auto_82155 ?auto_82156 ?auto_82157 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82159 - BLOCK
      ?auto_82160 - BLOCK
      ?auto_82161 - BLOCK
      ?auto_82162 - BLOCK
      ?auto_82163 - BLOCK
      ?auto_82164 - BLOCK
      ?auto_82165 - BLOCK
    )
    :vars
    (
      ?auto_82166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82159 ) ( ON ?auto_82160 ?auto_82159 ) ( ON ?auto_82161 ?auto_82160 ) ( ON ?auto_82162 ?auto_82161 ) ( not ( = ?auto_82159 ?auto_82160 ) ) ( not ( = ?auto_82159 ?auto_82161 ) ) ( not ( = ?auto_82159 ?auto_82162 ) ) ( not ( = ?auto_82159 ?auto_82163 ) ) ( not ( = ?auto_82159 ?auto_82164 ) ) ( not ( = ?auto_82159 ?auto_82165 ) ) ( not ( = ?auto_82160 ?auto_82161 ) ) ( not ( = ?auto_82160 ?auto_82162 ) ) ( not ( = ?auto_82160 ?auto_82163 ) ) ( not ( = ?auto_82160 ?auto_82164 ) ) ( not ( = ?auto_82160 ?auto_82165 ) ) ( not ( = ?auto_82161 ?auto_82162 ) ) ( not ( = ?auto_82161 ?auto_82163 ) ) ( not ( = ?auto_82161 ?auto_82164 ) ) ( not ( = ?auto_82161 ?auto_82165 ) ) ( not ( = ?auto_82162 ?auto_82163 ) ) ( not ( = ?auto_82162 ?auto_82164 ) ) ( not ( = ?auto_82162 ?auto_82165 ) ) ( not ( = ?auto_82163 ?auto_82164 ) ) ( not ( = ?auto_82163 ?auto_82165 ) ) ( not ( = ?auto_82164 ?auto_82165 ) ) ( ON ?auto_82165 ?auto_82166 ) ( not ( = ?auto_82159 ?auto_82166 ) ) ( not ( = ?auto_82160 ?auto_82166 ) ) ( not ( = ?auto_82161 ?auto_82166 ) ) ( not ( = ?auto_82162 ?auto_82166 ) ) ( not ( = ?auto_82163 ?auto_82166 ) ) ( not ( = ?auto_82164 ?auto_82166 ) ) ( not ( = ?auto_82165 ?auto_82166 ) ) ( ON ?auto_82164 ?auto_82165 ) ( CLEAR ?auto_82164 ) ( ON-TABLE ?auto_82166 ) ( HOLDING ?auto_82163 ) ( CLEAR ?auto_82162 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82159 ?auto_82160 ?auto_82161 ?auto_82162 ?auto_82163 )
      ( MAKE-7PILE ?auto_82159 ?auto_82160 ?auto_82161 ?auto_82162 ?auto_82163 ?auto_82164 ?auto_82165 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82167 - BLOCK
      ?auto_82168 - BLOCK
      ?auto_82169 - BLOCK
      ?auto_82170 - BLOCK
      ?auto_82171 - BLOCK
      ?auto_82172 - BLOCK
      ?auto_82173 - BLOCK
    )
    :vars
    (
      ?auto_82174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82167 ) ( ON ?auto_82168 ?auto_82167 ) ( ON ?auto_82169 ?auto_82168 ) ( ON ?auto_82170 ?auto_82169 ) ( not ( = ?auto_82167 ?auto_82168 ) ) ( not ( = ?auto_82167 ?auto_82169 ) ) ( not ( = ?auto_82167 ?auto_82170 ) ) ( not ( = ?auto_82167 ?auto_82171 ) ) ( not ( = ?auto_82167 ?auto_82172 ) ) ( not ( = ?auto_82167 ?auto_82173 ) ) ( not ( = ?auto_82168 ?auto_82169 ) ) ( not ( = ?auto_82168 ?auto_82170 ) ) ( not ( = ?auto_82168 ?auto_82171 ) ) ( not ( = ?auto_82168 ?auto_82172 ) ) ( not ( = ?auto_82168 ?auto_82173 ) ) ( not ( = ?auto_82169 ?auto_82170 ) ) ( not ( = ?auto_82169 ?auto_82171 ) ) ( not ( = ?auto_82169 ?auto_82172 ) ) ( not ( = ?auto_82169 ?auto_82173 ) ) ( not ( = ?auto_82170 ?auto_82171 ) ) ( not ( = ?auto_82170 ?auto_82172 ) ) ( not ( = ?auto_82170 ?auto_82173 ) ) ( not ( = ?auto_82171 ?auto_82172 ) ) ( not ( = ?auto_82171 ?auto_82173 ) ) ( not ( = ?auto_82172 ?auto_82173 ) ) ( ON ?auto_82173 ?auto_82174 ) ( not ( = ?auto_82167 ?auto_82174 ) ) ( not ( = ?auto_82168 ?auto_82174 ) ) ( not ( = ?auto_82169 ?auto_82174 ) ) ( not ( = ?auto_82170 ?auto_82174 ) ) ( not ( = ?auto_82171 ?auto_82174 ) ) ( not ( = ?auto_82172 ?auto_82174 ) ) ( not ( = ?auto_82173 ?auto_82174 ) ) ( ON ?auto_82172 ?auto_82173 ) ( ON-TABLE ?auto_82174 ) ( CLEAR ?auto_82170 ) ( ON ?auto_82171 ?auto_82172 ) ( CLEAR ?auto_82171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82174 ?auto_82173 ?auto_82172 )
      ( MAKE-7PILE ?auto_82167 ?auto_82168 ?auto_82169 ?auto_82170 ?auto_82171 ?auto_82172 ?auto_82173 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82175 - BLOCK
      ?auto_82176 - BLOCK
      ?auto_82177 - BLOCK
      ?auto_82178 - BLOCK
      ?auto_82179 - BLOCK
      ?auto_82180 - BLOCK
      ?auto_82181 - BLOCK
    )
    :vars
    (
      ?auto_82182 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82175 ) ( ON ?auto_82176 ?auto_82175 ) ( ON ?auto_82177 ?auto_82176 ) ( not ( = ?auto_82175 ?auto_82176 ) ) ( not ( = ?auto_82175 ?auto_82177 ) ) ( not ( = ?auto_82175 ?auto_82178 ) ) ( not ( = ?auto_82175 ?auto_82179 ) ) ( not ( = ?auto_82175 ?auto_82180 ) ) ( not ( = ?auto_82175 ?auto_82181 ) ) ( not ( = ?auto_82176 ?auto_82177 ) ) ( not ( = ?auto_82176 ?auto_82178 ) ) ( not ( = ?auto_82176 ?auto_82179 ) ) ( not ( = ?auto_82176 ?auto_82180 ) ) ( not ( = ?auto_82176 ?auto_82181 ) ) ( not ( = ?auto_82177 ?auto_82178 ) ) ( not ( = ?auto_82177 ?auto_82179 ) ) ( not ( = ?auto_82177 ?auto_82180 ) ) ( not ( = ?auto_82177 ?auto_82181 ) ) ( not ( = ?auto_82178 ?auto_82179 ) ) ( not ( = ?auto_82178 ?auto_82180 ) ) ( not ( = ?auto_82178 ?auto_82181 ) ) ( not ( = ?auto_82179 ?auto_82180 ) ) ( not ( = ?auto_82179 ?auto_82181 ) ) ( not ( = ?auto_82180 ?auto_82181 ) ) ( ON ?auto_82181 ?auto_82182 ) ( not ( = ?auto_82175 ?auto_82182 ) ) ( not ( = ?auto_82176 ?auto_82182 ) ) ( not ( = ?auto_82177 ?auto_82182 ) ) ( not ( = ?auto_82178 ?auto_82182 ) ) ( not ( = ?auto_82179 ?auto_82182 ) ) ( not ( = ?auto_82180 ?auto_82182 ) ) ( not ( = ?auto_82181 ?auto_82182 ) ) ( ON ?auto_82180 ?auto_82181 ) ( ON-TABLE ?auto_82182 ) ( ON ?auto_82179 ?auto_82180 ) ( CLEAR ?auto_82179 ) ( HOLDING ?auto_82178 ) ( CLEAR ?auto_82177 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82175 ?auto_82176 ?auto_82177 ?auto_82178 )
      ( MAKE-7PILE ?auto_82175 ?auto_82176 ?auto_82177 ?auto_82178 ?auto_82179 ?auto_82180 ?auto_82181 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82183 - BLOCK
      ?auto_82184 - BLOCK
      ?auto_82185 - BLOCK
      ?auto_82186 - BLOCK
      ?auto_82187 - BLOCK
      ?auto_82188 - BLOCK
      ?auto_82189 - BLOCK
    )
    :vars
    (
      ?auto_82190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82183 ) ( ON ?auto_82184 ?auto_82183 ) ( ON ?auto_82185 ?auto_82184 ) ( not ( = ?auto_82183 ?auto_82184 ) ) ( not ( = ?auto_82183 ?auto_82185 ) ) ( not ( = ?auto_82183 ?auto_82186 ) ) ( not ( = ?auto_82183 ?auto_82187 ) ) ( not ( = ?auto_82183 ?auto_82188 ) ) ( not ( = ?auto_82183 ?auto_82189 ) ) ( not ( = ?auto_82184 ?auto_82185 ) ) ( not ( = ?auto_82184 ?auto_82186 ) ) ( not ( = ?auto_82184 ?auto_82187 ) ) ( not ( = ?auto_82184 ?auto_82188 ) ) ( not ( = ?auto_82184 ?auto_82189 ) ) ( not ( = ?auto_82185 ?auto_82186 ) ) ( not ( = ?auto_82185 ?auto_82187 ) ) ( not ( = ?auto_82185 ?auto_82188 ) ) ( not ( = ?auto_82185 ?auto_82189 ) ) ( not ( = ?auto_82186 ?auto_82187 ) ) ( not ( = ?auto_82186 ?auto_82188 ) ) ( not ( = ?auto_82186 ?auto_82189 ) ) ( not ( = ?auto_82187 ?auto_82188 ) ) ( not ( = ?auto_82187 ?auto_82189 ) ) ( not ( = ?auto_82188 ?auto_82189 ) ) ( ON ?auto_82189 ?auto_82190 ) ( not ( = ?auto_82183 ?auto_82190 ) ) ( not ( = ?auto_82184 ?auto_82190 ) ) ( not ( = ?auto_82185 ?auto_82190 ) ) ( not ( = ?auto_82186 ?auto_82190 ) ) ( not ( = ?auto_82187 ?auto_82190 ) ) ( not ( = ?auto_82188 ?auto_82190 ) ) ( not ( = ?auto_82189 ?auto_82190 ) ) ( ON ?auto_82188 ?auto_82189 ) ( ON-TABLE ?auto_82190 ) ( ON ?auto_82187 ?auto_82188 ) ( CLEAR ?auto_82185 ) ( ON ?auto_82186 ?auto_82187 ) ( CLEAR ?auto_82186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82190 ?auto_82189 ?auto_82188 ?auto_82187 )
      ( MAKE-7PILE ?auto_82183 ?auto_82184 ?auto_82185 ?auto_82186 ?auto_82187 ?auto_82188 ?auto_82189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82191 - BLOCK
      ?auto_82192 - BLOCK
      ?auto_82193 - BLOCK
      ?auto_82194 - BLOCK
      ?auto_82195 - BLOCK
      ?auto_82196 - BLOCK
      ?auto_82197 - BLOCK
    )
    :vars
    (
      ?auto_82198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82191 ) ( ON ?auto_82192 ?auto_82191 ) ( not ( = ?auto_82191 ?auto_82192 ) ) ( not ( = ?auto_82191 ?auto_82193 ) ) ( not ( = ?auto_82191 ?auto_82194 ) ) ( not ( = ?auto_82191 ?auto_82195 ) ) ( not ( = ?auto_82191 ?auto_82196 ) ) ( not ( = ?auto_82191 ?auto_82197 ) ) ( not ( = ?auto_82192 ?auto_82193 ) ) ( not ( = ?auto_82192 ?auto_82194 ) ) ( not ( = ?auto_82192 ?auto_82195 ) ) ( not ( = ?auto_82192 ?auto_82196 ) ) ( not ( = ?auto_82192 ?auto_82197 ) ) ( not ( = ?auto_82193 ?auto_82194 ) ) ( not ( = ?auto_82193 ?auto_82195 ) ) ( not ( = ?auto_82193 ?auto_82196 ) ) ( not ( = ?auto_82193 ?auto_82197 ) ) ( not ( = ?auto_82194 ?auto_82195 ) ) ( not ( = ?auto_82194 ?auto_82196 ) ) ( not ( = ?auto_82194 ?auto_82197 ) ) ( not ( = ?auto_82195 ?auto_82196 ) ) ( not ( = ?auto_82195 ?auto_82197 ) ) ( not ( = ?auto_82196 ?auto_82197 ) ) ( ON ?auto_82197 ?auto_82198 ) ( not ( = ?auto_82191 ?auto_82198 ) ) ( not ( = ?auto_82192 ?auto_82198 ) ) ( not ( = ?auto_82193 ?auto_82198 ) ) ( not ( = ?auto_82194 ?auto_82198 ) ) ( not ( = ?auto_82195 ?auto_82198 ) ) ( not ( = ?auto_82196 ?auto_82198 ) ) ( not ( = ?auto_82197 ?auto_82198 ) ) ( ON ?auto_82196 ?auto_82197 ) ( ON-TABLE ?auto_82198 ) ( ON ?auto_82195 ?auto_82196 ) ( ON ?auto_82194 ?auto_82195 ) ( CLEAR ?auto_82194 ) ( HOLDING ?auto_82193 ) ( CLEAR ?auto_82192 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82191 ?auto_82192 ?auto_82193 )
      ( MAKE-7PILE ?auto_82191 ?auto_82192 ?auto_82193 ?auto_82194 ?auto_82195 ?auto_82196 ?auto_82197 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82199 - BLOCK
      ?auto_82200 - BLOCK
      ?auto_82201 - BLOCK
      ?auto_82202 - BLOCK
      ?auto_82203 - BLOCK
      ?auto_82204 - BLOCK
      ?auto_82205 - BLOCK
    )
    :vars
    (
      ?auto_82206 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82199 ) ( ON ?auto_82200 ?auto_82199 ) ( not ( = ?auto_82199 ?auto_82200 ) ) ( not ( = ?auto_82199 ?auto_82201 ) ) ( not ( = ?auto_82199 ?auto_82202 ) ) ( not ( = ?auto_82199 ?auto_82203 ) ) ( not ( = ?auto_82199 ?auto_82204 ) ) ( not ( = ?auto_82199 ?auto_82205 ) ) ( not ( = ?auto_82200 ?auto_82201 ) ) ( not ( = ?auto_82200 ?auto_82202 ) ) ( not ( = ?auto_82200 ?auto_82203 ) ) ( not ( = ?auto_82200 ?auto_82204 ) ) ( not ( = ?auto_82200 ?auto_82205 ) ) ( not ( = ?auto_82201 ?auto_82202 ) ) ( not ( = ?auto_82201 ?auto_82203 ) ) ( not ( = ?auto_82201 ?auto_82204 ) ) ( not ( = ?auto_82201 ?auto_82205 ) ) ( not ( = ?auto_82202 ?auto_82203 ) ) ( not ( = ?auto_82202 ?auto_82204 ) ) ( not ( = ?auto_82202 ?auto_82205 ) ) ( not ( = ?auto_82203 ?auto_82204 ) ) ( not ( = ?auto_82203 ?auto_82205 ) ) ( not ( = ?auto_82204 ?auto_82205 ) ) ( ON ?auto_82205 ?auto_82206 ) ( not ( = ?auto_82199 ?auto_82206 ) ) ( not ( = ?auto_82200 ?auto_82206 ) ) ( not ( = ?auto_82201 ?auto_82206 ) ) ( not ( = ?auto_82202 ?auto_82206 ) ) ( not ( = ?auto_82203 ?auto_82206 ) ) ( not ( = ?auto_82204 ?auto_82206 ) ) ( not ( = ?auto_82205 ?auto_82206 ) ) ( ON ?auto_82204 ?auto_82205 ) ( ON-TABLE ?auto_82206 ) ( ON ?auto_82203 ?auto_82204 ) ( ON ?auto_82202 ?auto_82203 ) ( CLEAR ?auto_82200 ) ( ON ?auto_82201 ?auto_82202 ) ( CLEAR ?auto_82201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82206 ?auto_82205 ?auto_82204 ?auto_82203 ?auto_82202 )
      ( MAKE-7PILE ?auto_82199 ?auto_82200 ?auto_82201 ?auto_82202 ?auto_82203 ?auto_82204 ?auto_82205 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82207 - BLOCK
      ?auto_82208 - BLOCK
      ?auto_82209 - BLOCK
      ?auto_82210 - BLOCK
      ?auto_82211 - BLOCK
      ?auto_82212 - BLOCK
      ?auto_82213 - BLOCK
    )
    :vars
    (
      ?auto_82214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82207 ) ( not ( = ?auto_82207 ?auto_82208 ) ) ( not ( = ?auto_82207 ?auto_82209 ) ) ( not ( = ?auto_82207 ?auto_82210 ) ) ( not ( = ?auto_82207 ?auto_82211 ) ) ( not ( = ?auto_82207 ?auto_82212 ) ) ( not ( = ?auto_82207 ?auto_82213 ) ) ( not ( = ?auto_82208 ?auto_82209 ) ) ( not ( = ?auto_82208 ?auto_82210 ) ) ( not ( = ?auto_82208 ?auto_82211 ) ) ( not ( = ?auto_82208 ?auto_82212 ) ) ( not ( = ?auto_82208 ?auto_82213 ) ) ( not ( = ?auto_82209 ?auto_82210 ) ) ( not ( = ?auto_82209 ?auto_82211 ) ) ( not ( = ?auto_82209 ?auto_82212 ) ) ( not ( = ?auto_82209 ?auto_82213 ) ) ( not ( = ?auto_82210 ?auto_82211 ) ) ( not ( = ?auto_82210 ?auto_82212 ) ) ( not ( = ?auto_82210 ?auto_82213 ) ) ( not ( = ?auto_82211 ?auto_82212 ) ) ( not ( = ?auto_82211 ?auto_82213 ) ) ( not ( = ?auto_82212 ?auto_82213 ) ) ( ON ?auto_82213 ?auto_82214 ) ( not ( = ?auto_82207 ?auto_82214 ) ) ( not ( = ?auto_82208 ?auto_82214 ) ) ( not ( = ?auto_82209 ?auto_82214 ) ) ( not ( = ?auto_82210 ?auto_82214 ) ) ( not ( = ?auto_82211 ?auto_82214 ) ) ( not ( = ?auto_82212 ?auto_82214 ) ) ( not ( = ?auto_82213 ?auto_82214 ) ) ( ON ?auto_82212 ?auto_82213 ) ( ON-TABLE ?auto_82214 ) ( ON ?auto_82211 ?auto_82212 ) ( ON ?auto_82210 ?auto_82211 ) ( ON ?auto_82209 ?auto_82210 ) ( CLEAR ?auto_82209 ) ( HOLDING ?auto_82208 ) ( CLEAR ?auto_82207 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82207 ?auto_82208 )
      ( MAKE-7PILE ?auto_82207 ?auto_82208 ?auto_82209 ?auto_82210 ?auto_82211 ?auto_82212 ?auto_82213 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82215 - BLOCK
      ?auto_82216 - BLOCK
      ?auto_82217 - BLOCK
      ?auto_82218 - BLOCK
      ?auto_82219 - BLOCK
      ?auto_82220 - BLOCK
      ?auto_82221 - BLOCK
    )
    :vars
    (
      ?auto_82222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82215 ) ( not ( = ?auto_82215 ?auto_82216 ) ) ( not ( = ?auto_82215 ?auto_82217 ) ) ( not ( = ?auto_82215 ?auto_82218 ) ) ( not ( = ?auto_82215 ?auto_82219 ) ) ( not ( = ?auto_82215 ?auto_82220 ) ) ( not ( = ?auto_82215 ?auto_82221 ) ) ( not ( = ?auto_82216 ?auto_82217 ) ) ( not ( = ?auto_82216 ?auto_82218 ) ) ( not ( = ?auto_82216 ?auto_82219 ) ) ( not ( = ?auto_82216 ?auto_82220 ) ) ( not ( = ?auto_82216 ?auto_82221 ) ) ( not ( = ?auto_82217 ?auto_82218 ) ) ( not ( = ?auto_82217 ?auto_82219 ) ) ( not ( = ?auto_82217 ?auto_82220 ) ) ( not ( = ?auto_82217 ?auto_82221 ) ) ( not ( = ?auto_82218 ?auto_82219 ) ) ( not ( = ?auto_82218 ?auto_82220 ) ) ( not ( = ?auto_82218 ?auto_82221 ) ) ( not ( = ?auto_82219 ?auto_82220 ) ) ( not ( = ?auto_82219 ?auto_82221 ) ) ( not ( = ?auto_82220 ?auto_82221 ) ) ( ON ?auto_82221 ?auto_82222 ) ( not ( = ?auto_82215 ?auto_82222 ) ) ( not ( = ?auto_82216 ?auto_82222 ) ) ( not ( = ?auto_82217 ?auto_82222 ) ) ( not ( = ?auto_82218 ?auto_82222 ) ) ( not ( = ?auto_82219 ?auto_82222 ) ) ( not ( = ?auto_82220 ?auto_82222 ) ) ( not ( = ?auto_82221 ?auto_82222 ) ) ( ON ?auto_82220 ?auto_82221 ) ( ON-TABLE ?auto_82222 ) ( ON ?auto_82219 ?auto_82220 ) ( ON ?auto_82218 ?auto_82219 ) ( ON ?auto_82217 ?auto_82218 ) ( CLEAR ?auto_82215 ) ( ON ?auto_82216 ?auto_82217 ) ( CLEAR ?auto_82216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82222 ?auto_82221 ?auto_82220 ?auto_82219 ?auto_82218 ?auto_82217 )
      ( MAKE-7PILE ?auto_82215 ?auto_82216 ?auto_82217 ?auto_82218 ?auto_82219 ?auto_82220 ?auto_82221 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82223 - BLOCK
      ?auto_82224 - BLOCK
      ?auto_82225 - BLOCK
      ?auto_82226 - BLOCK
      ?auto_82227 - BLOCK
      ?auto_82228 - BLOCK
      ?auto_82229 - BLOCK
    )
    :vars
    (
      ?auto_82230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82223 ?auto_82224 ) ) ( not ( = ?auto_82223 ?auto_82225 ) ) ( not ( = ?auto_82223 ?auto_82226 ) ) ( not ( = ?auto_82223 ?auto_82227 ) ) ( not ( = ?auto_82223 ?auto_82228 ) ) ( not ( = ?auto_82223 ?auto_82229 ) ) ( not ( = ?auto_82224 ?auto_82225 ) ) ( not ( = ?auto_82224 ?auto_82226 ) ) ( not ( = ?auto_82224 ?auto_82227 ) ) ( not ( = ?auto_82224 ?auto_82228 ) ) ( not ( = ?auto_82224 ?auto_82229 ) ) ( not ( = ?auto_82225 ?auto_82226 ) ) ( not ( = ?auto_82225 ?auto_82227 ) ) ( not ( = ?auto_82225 ?auto_82228 ) ) ( not ( = ?auto_82225 ?auto_82229 ) ) ( not ( = ?auto_82226 ?auto_82227 ) ) ( not ( = ?auto_82226 ?auto_82228 ) ) ( not ( = ?auto_82226 ?auto_82229 ) ) ( not ( = ?auto_82227 ?auto_82228 ) ) ( not ( = ?auto_82227 ?auto_82229 ) ) ( not ( = ?auto_82228 ?auto_82229 ) ) ( ON ?auto_82229 ?auto_82230 ) ( not ( = ?auto_82223 ?auto_82230 ) ) ( not ( = ?auto_82224 ?auto_82230 ) ) ( not ( = ?auto_82225 ?auto_82230 ) ) ( not ( = ?auto_82226 ?auto_82230 ) ) ( not ( = ?auto_82227 ?auto_82230 ) ) ( not ( = ?auto_82228 ?auto_82230 ) ) ( not ( = ?auto_82229 ?auto_82230 ) ) ( ON ?auto_82228 ?auto_82229 ) ( ON-TABLE ?auto_82230 ) ( ON ?auto_82227 ?auto_82228 ) ( ON ?auto_82226 ?auto_82227 ) ( ON ?auto_82225 ?auto_82226 ) ( ON ?auto_82224 ?auto_82225 ) ( CLEAR ?auto_82224 ) ( HOLDING ?auto_82223 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82223 )
      ( MAKE-7PILE ?auto_82223 ?auto_82224 ?auto_82225 ?auto_82226 ?auto_82227 ?auto_82228 ?auto_82229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_82231 - BLOCK
      ?auto_82232 - BLOCK
      ?auto_82233 - BLOCK
      ?auto_82234 - BLOCK
      ?auto_82235 - BLOCK
      ?auto_82236 - BLOCK
      ?auto_82237 - BLOCK
    )
    :vars
    (
      ?auto_82238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82231 ?auto_82232 ) ) ( not ( = ?auto_82231 ?auto_82233 ) ) ( not ( = ?auto_82231 ?auto_82234 ) ) ( not ( = ?auto_82231 ?auto_82235 ) ) ( not ( = ?auto_82231 ?auto_82236 ) ) ( not ( = ?auto_82231 ?auto_82237 ) ) ( not ( = ?auto_82232 ?auto_82233 ) ) ( not ( = ?auto_82232 ?auto_82234 ) ) ( not ( = ?auto_82232 ?auto_82235 ) ) ( not ( = ?auto_82232 ?auto_82236 ) ) ( not ( = ?auto_82232 ?auto_82237 ) ) ( not ( = ?auto_82233 ?auto_82234 ) ) ( not ( = ?auto_82233 ?auto_82235 ) ) ( not ( = ?auto_82233 ?auto_82236 ) ) ( not ( = ?auto_82233 ?auto_82237 ) ) ( not ( = ?auto_82234 ?auto_82235 ) ) ( not ( = ?auto_82234 ?auto_82236 ) ) ( not ( = ?auto_82234 ?auto_82237 ) ) ( not ( = ?auto_82235 ?auto_82236 ) ) ( not ( = ?auto_82235 ?auto_82237 ) ) ( not ( = ?auto_82236 ?auto_82237 ) ) ( ON ?auto_82237 ?auto_82238 ) ( not ( = ?auto_82231 ?auto_82238 ) ) ( not ( = ?auto_82232 ?auto_82238 ) ) ( not ( = ?auto_82233 ?auto_82238 ) ) ( not ( = ?auto_82234 ?auto_82238 ) ) ( not ( = ?auto_82235 ?auto_82238 ) ) ( not ( = ?auto_82236 ?auto_82238 ) ) ( not ( = ?auto_82237 ?auto_82238 ) ) ( ON ?auto_82236 ?auto_82237 ) ( ON-TABLE ?auto_82238 ) ( ON ?auto_82235 ?auto_82236 ) ( ON ?auto_82234 ?auto_82235 ) ( ON ?auto_82233 ?auto_82234 ) ( ON ?auto_82232 ?auto_82233 ) ( ON ?auto_82231 ?auto_82232 ) ( CLEAR ?auto_82231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82238 ?auto_82237 ?auto_82236 ?auto_82235 ?auto_82234 ?auto_82233 ?auto_82232 )
      ( MAKE-7PILE ?auto_82231 ?auto_82232 ?auto_82233 ?auto_82234 ?auto_82235 ?auto_82236 ?auto_82237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82245 - BLOCK
      ?auto_82246 - BLOCK
      ?auto_82247 - BLOCK
      ?auto_82248 - BLOCK
      ?auto_82249 - BLOCK
      ?auto_82250 - BLOCK
    )
    :vars
    (
      ?auto_82251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82251 ?auto_82250 ) ( CLEAR ?auto_82251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82245 ) ( ON ?auto_82246 ?auto_82245 ) ( ON ?auto_82247 ?auto_82246 ) ( ON ?auto_82248 ?auto_82247 ) ( ON ?auto_82249 ?auto_82248 ) ( ON ?auto_82250 ?auto_82249 ) ( not ( = ?auto_82245 ?auto_82246 ) ) ( not ( = ?auto_82245 ?auto_82247 ) ) ( not ( = ?auto_82245 ?auto_82248 ) ) ( not ( = ?auto_82245 ?auto_82249 ) ) ( not ( = ?auto_82245 ?auto_82250 ) ) ( not ( = ?auto_82245 ?auto_82251 ) ) ( not ( = ?auto_82246 ?auto_82247 ) ) ( not ( = ?auto_82246 ?auto_82248 ) ) ( not ( = ?auto_82246 ?auto_82249 ) ) ( not ( = ?auto_82246 ?auto_82250 ) ) ( not ( = ?auto_82246 ?auto_82251 ) ) ( not ( = ?auto_82247 ?auto_82248 ) ) ( not ( = ?auto_82247 ?auto_82249 ) ) ( not ( = ?auto_82247 ?auto_82250 ) ) ( not ( = ?auto_82247 ?auto_82251 ) ) ( not ( = ?auto_82248 ?auto_82249 ) ) ( not ( = ?auto_82248 ?auto_82250 ) ) ( not ( = ?auto_82248 ?auto_82251 ) ) ( not ( = ?auto_82249 ?auto_82250 ) ) ( not ( = ?auto_82249 ?auto_82251 ) ) ( not ( = ?auto_82250 ?auto_82251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82251 ?auto_82250 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82267 - BLOCK
      ?auto_82268 - BLOCK
      ?auto_82269 - BLOCK
      ?auto_82270 - BLOCK
      ?auto_82271 - BLOCK
      ?auto_82272 - BLOCK
    )
    :vars
    (
      ?auto_82273 - BLOCK
      ?auto_82274 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82267 ) ( ON ?auto_82268 ?auto_82267 ) ( ON ?auto_82269 ?auto_82268 ) ( ON ?auto_82270 ?auto_82269 ) ( ON ?auto_82271 ?auto_82270 ) ( not ( = ?auto_82267 ?auto_82268 ) ) ( not ( = ?auto_82267 ?auto_82269 ) ) ( not ( = ?auto_82267 ?auto_82270 ) ) ( not ( = ?auto_82267 ?auto_82271 ) ) ( not ( = ?auto_82267 ?auto_82272 ) ) ( not ( = ?auto_82267 ?auto_82273 ) ) ( not ( = ?auto_82268 ?auto_82269 ) ) ( not ( = ?auto_82268 ?auto_82270 ) ) ( not ( = ?auto_82268 ?auto_82271 ) ) ( not ( = ?auto_82268 ?auto_82272 ) ) ( not ( = ?auto_82268 ?auto_82273 ) ) ( not ( = ?auto_82269 ?auto_82270 ) ) ( not ( = ?auto_82269 ?auto_82271 ) ) ( not ( = ?auto_82269 ?auto_82272 ) ) ( not ( = ?auto_82269 ?auto_82273 ) ) ( not ( = ?auto_82270 ?auto_82271 ) ) ( not ( = ?auto_82270 ?auto_82272 ) ) ( not ( = ?auto_82270 ?auto_82273 ) ) ( not ( = ?auto_82271 ?auto_82272 ) ) ( not ( = ?auto_82271 ?auto_82273 ) ) ( not ( = ?auto_82272 ?auto_82273 ) ) ( ON ?auto_82273 ?auto_82274 ) ( CLEAR ?auto_82273 ) ( not ( = ?auto_82267 ?auto_82274 ) ) ( not ( = ?auto_82268 ?auto_82274 ) ) ( not ( = ?auto_82269 ?auto_82274 ) ) ( not ( = ?auto_82270 ?auto_82274 ) ) ( not ( = ?auto_82271 ?auto_82274 ) ) ( not ( = ?auto_82272 ?auto_82274 ) ) ( not ( = ?auto_82273 ?auto_82274 ) ) ( HOLDING ?auto_82272 ) ( CLEAR ?auto_82271 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82267 ?auto_82268 ?auto_82269 ?auto_82270 ?auto_82271 ?auto_82272 ?auto_82273 )
      ( MAKE-6PILE ?auto_82267 ?auto_82268 ?auto_82269 ?auto_82270 ?auto_82271 ?auto_82272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82275 - BLOCK
      ?auto_82276 - BLOCK
      ?auto_82277 - BLOCK
      ?auto_82278 - BLOCK
      ?auto_82279 - BLOCK
      ?auto_82280 - BLOCK
    )
    :vars
    (
      ?auto_82282 - BLOCK
      ?auto_82281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82275 ) ( ON ?auto_82276 ?auto_82275 ) ( ON ?auto_82277 ?auto_82276 ) ( ON ?auto_82278 ?auto_82277 ) ( ON ?auto_82279 ?auto_82278 ) ( not ( = ?auto_82275 ?auto_82276 ) ) ( not ( = ?auto_82275 ?auto_82277 ) ) ( not ( = ?auto_82275 ?auto_82278 ) ) ( not ( = ?auto_82275 ?auto_82279 ) ) ( not ( = ?auto_82275 ?auto_82280 ) ) ( not ( = ?auto_82275 ?auto_82282 ) ) ( not ( = ?auto_82276 ?auto_82277 ) ) ( not ( = ?auto_82276 ?auto_82278 ) ) ( not ( = ?auto_82276 ?auto_82279 ) ) ( not ( = ?auto_82276 ?auto_82280 ) ) ( not ( = ?auto_82276 ?auto_82282 ) ) ( not ( = ?auto_82277 ?auto_82278 ) ) ( not ( = ?auto_82277 ?auto_82279 ) ) ( not ( = ?auto_82277 ?auto_82280 ) ) ( not ( = ?auto_82277 ?auto_82282 ) ) ( not ( = ?auto_82278 ?auto_82279 ) ) ( not ( = ?auto_82278 ?auto_82280 ) ) ( not ( = ?auto_82278 ?auto_82282 ) ) ( not ( = ?auto_82279 ?auto_82280 ) ) ( not ( = ?auto_82279 ?auto_82282 ) ) ( not ( = ?auto_82280 ?auto_82282 ) ) ( ON ?auto_82282 ?auto_82281 ) ( not ( = ?auto_82275 ?auto_82281 ) ) ( not ( = ?auto_82276 ?auto_82281 ) ) ( not ( = ?auto_82277 ?auto_82281 ) ) ( not ( = ?auto_82278 ?auto_82281 ) ) ( not ( = ?auto_82279 ?auto_82281 ) ) ( not ( = ?auto_82280 ?auto_82281 ) ) ( not ( = ?auto_82282 ?auto_82281 ) ) ( CLEAR ?auto_82279 ) ( ON ?auto_82280 ?auto_82282 ) ( CLEAR ?auto_82280 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82281 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82281 ?auto_82282 )
      ( MAKE-6PILE ?auto_82275 ?auto_82276 ?auto_82277 ?auto_82278 ?auto_82279 ?auto_82280 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82283 - BLOCK
      ?auto_82284 - BLOCK
      ?auto_82285 - BLOCK
      ?auto_82286 - BLOCK
      ?auto_82287 - BLOCK
      ?auto_82288 - BLOCK
    )
    :vars
    (
      ?auto_82290 - BLOCK
      ?auto_82289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82283 ) ( ON ?auto_82284 ?auto_82283 ) ( ON ?auto_82285 ?auto_82284 ) ( ON ?auto_82286 ?auto_82285 ) ( not ( = ?auto_82283 ?auto_82284 ) ) ( not ( = ?auto_82283 ?auto_82285 ) ) ( not ( = ?auto_82283 ?auto_82286 ) ) ( not ( = ?auto_82283 ?auto_82287 ) ) ( not ( = ?auto_82283 ?auto_82288 ) ) ( not ( = ?auto_82283 ?auto_82290 ) ) ( not ( = ?auto_82284 ?auto_82285 ) ) ( not ( = ?auto_82284 ?auto_82286 ) ) ( not ( = ?auto_82284 ?auto_82287 ) ) ( not ( = ?auto_82284 ?auto_82288 ) ) ( not ( = ?auto_82284 ?auto_82290 ) ) ( not ( = ?auto_82285 ?auto_82286 ) ) ( not ( = ?auto_82285 ?auto_82287 ) ) ( not ( = ?auto_82285 ?auto_82288 ) ) ( not ( = ?auto_82285 ?auto_82290 ) ) ( not ( = ?auto_82286 ?auto_82287 ) ) ( not ( = ?auto_82286 ?auto_82288 ) ) ( not ( = ?auto_82286 ?auto_82290 ) ) ( not ( = ?auto_82287 ?auto_82288 ) ) ( not ( = ?auto_82287 ?auto_82290 ) ) ( not ( = ?auto_82288 ?auto_82290 ) ) ( ON ?auto_82290 ?auto_82289 ) ( not ( = ?auto_82283 ?auto_82289 ) ) ( not ( = ?auto_82284 ?auto_82289 ) ) ( not ( = ?auto_82285 ?auto_82289 ) ) ( not ( = ?auto_82286 ?auto_82289 ) ) ( not ( = ?auto_82287 ?auto_82289 ) ) ( not ( = ?auto_82288 ?auto_82289 ) ) ( not ( = ?auto_82290 ?auto_82289 ) ) ( ON ?auto_82288 ?auto_82290 ) ( CLEAR ?auto_82288 ) ( ON-TABLE ?auto_82289 ) ( HOLDING ?auto_82287 ) ( CLEAR ?auto_82286 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82283 ?auto_82284 ?auto_82285 ?auto_82286 ?auto_82287 )
      ( MAKE-6PILE ?auto_82283 ?auto_82284 ?auto_82285 ?auto_82286 ?auto_82287 ?auto_82288 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82291 - BLOCK
      ?auto_82292 - BLOCK
      ?auto_82293 - BLOCK
      ?auto_82294 - BLOCK
      ?auto_82295 - BLOCK
      ?auto_82296 - BLOCK
    )
    :vars
    (
      ?auto_82297 - BLOCK
      ?auto_82298 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82291 ) ( ON ?auto_82292 ?auto_82291 ) ( ON ?auto_82293 ?auto_82292 ) ( ON ?auto_82294 ?auto_82293 ) ( not ( = ?auto_82291 ?auto_82292 ) ) ( not ( = ?auto_82291 ?auto_82293 ) ) ( not ( = ?auto_82291 ?auto_82294 ) ) ( not ( = ?auto_82291 ?auto_82295 ) ) ( not ( = ?auto_82291 ?auto_82296 ) ) ( not ( = ?auto_82291 ?auto_82297 ) ) ( not ( = ?auto_82292 ?auto_82293 ) ) ( not ( = ?auto_82292 ?auto_82294 ) ) ( not ( = ?auto_82292 ?auto_82295 ) ) ( not ( = ?auto_82292 ?auto_82296 ) ) ( not ( = ?auto_82292 ?auto_82297 ) ) ( not ( = ?auto_82293 ?auto_82294 ) ) ( not ( = ?auto_82293 ?auto_82295 ) ) ( not ( = ?auto_82293 ?auto_82296 ) ) ( not ( = ?auto_82293 ?auto_82297 ) ) ( not ( = ?auto_82294 ?auto_82295 ) ) ( not ( = ?auto_82294 ?auto_82296 ) ) ( not ( = ?auto_82294 ?auto_82297 ) ) ( not ( = ?auto_82295 ?auto_82296 ) ) ( not ( = ?auto_82295 ?auto_82297 ) ) ( not ( = ?auto_82296 ?auto_82297 ) ) ( ON ?auto_82297 ?auto_82298 ) ( not ( = ?auto_82291 ?auto_82298 ) ) ( not ( = ?auto_82292 ?auto_82298 ) ) ( not ( = ?auto_82293 ?auto_82298 ) ) ( not ( = ?auto_82294 ?auto_82298 ) ) ( not ( = ?auto_82295 ?auto_82298 ) ) ( not ( = ?auto_82296 ?auto_82298 ) ) ( not ( = ?auto_82297 ?auto_82298 ) ) ( ON ?auto_82296 ?auto_82297 ) ( ON-TABLE ?auto_82298 ) ( CLEAR ?auto_82294 ) ( ON ?auto_82295 ?auto_82296 ) ( CLEAR ?auto_82295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82298 ?auto_82297 ?auto_82296 )
      ( MAKE-6PILE ?auto_82291 ?auto_82292 ?auto_82293 ?auto_82294 ?auto_82295 ?auto_82296 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82299 - BLOCK
      ?auto_82300 - BLOCK
      ?auto_82301 - BLOCK
      ?auto_82302 - BLOCK
      ?auto_82303 - BLOCK
      ?auto_82304 - BLOCK
    )
    :vars
    (
      ?auto_82305 - BLOCK
      ?auto_82306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82299 ) ( ON ?auto_82300 ?auto_82299 ) ( ON ?auto_82301 ?auto_82300 ) ( not ( = ?auto_82299 ?auto_82300 ) ) ( not ( = ?auto_82299 ?auto_82301 ) ) ( not ( = ?auto_82299 ?auto_82302 ) ) ( not ( = ?auto_82299 ?auto_82303 ) ) ( not ( = ?auto_82299 ?auto_82304 ) ) ( not ( = ?auto_82299 ?auto_82305 ) ) ( not ( = ?auto_82300 ?auto_82301 ) ) ( not ( = ?auto_82300 ?auto_82302 ) ) ( not ( = ?auto_82300 ?auto_82303 ) ) ( not ( = ?auto_82300 ?auto_82304 ) ) ( not ( = ?auto_82300 ?auto_82305 ) ) ( not ( = ?auto_82301 ?auto_82302 ) ) ( not ( = ?auto_82301 ?auto_82303 ) ) ( not ( = ?auto_82301 ?auto_82304 ) ) ( not ( = ?auto_82301 ?auto_82305 ) ) ( not ( = ?auto_82302 ?auto_82303 ) ) ( not ( = ?auto_82302 ?auto_82304 ) ) ( not ( = ?auto_82302 ?auto_82305 ) ) ( not ( = ?auto_82303 ?auto_82304 ) ) ( not ( = ?auto_82303 ?auto_82305 ) ) ( not ( = ?auto_82304 ?auto_82305 ) ) ( ON ?auto_82305 ?auto_82306 ) ( not ( = ?auto_82299 ?auto_82306 ) ) ( not ( = ?auto_82300 ?auto_82306 ) ) ( not ( = ?auto_82301 ?auto_82306 ) ) ( not ( = ?auto_82302 ?auto_82306 ) ) ( not ( = ?auto_82303 ?auto_82306 ) ) ( not ( = ?auto_82304 ?auto_82306 ) ) ( not ( = ?auto_82305 ?auto_82306 ) ) ( ON ?auto_82304 ?auto_82305 ) ( ON-TABLE ?auto_82306 ) ( ON ?auto_82303 ?auto_82304 ) ( CLEAR ?auto_82303 ) ( HOLDING ?auto_82302 ) ( CLEAR ?auto_82301 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82299 ?auto_82300 ?auto_82301 ?auto_82302 )
      ( MAKE-6PILE ?auto_82299 ?auto_82300 ?auto_82301 ?auto_82302 ?auto_82303 ?auto_82304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82307 - BLOCK
      ?auto_82308 - BLOCK
      ?auto_82309 - BLOCK
      ?auto_82310 - BLOCK
      ?auto_82311 - BLOCK
      ?auto_82312 - BLOCK
    )
    :vars
    (
      ?auto_82313 - BLOCK
      ?auto_82314 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82307 ) ( ON ?auto_82308 ?auto_82307 ) ( ON ?auto_82309 ?auto_82308 ) ( not ( = ?auto_82307 ?auto_82308 ) ) ( not ( = ?auto_82307 ?auto_82309 ) ) ( not ( = ?auto_82307 ?auto_82310 ) ) ( not ( = ?auto_82307 ?auto_82311 ) ) ( not ( = ?auto_82307 ?auto_82312 ) ) ( not ( = ?auto_82307 ?auto_82313 ) ) ( not ( = ?auto_82308 ?auto_82309 ) ) ( not ( = ?auto_82308 ?auto_82310 ) ) ( not ( = ?auto_82308 ?auto_82311 ) ) ( not ( = ?auto_82308 ?auto_82312 ) ) ( not ( = ?auto_82308 ?auto_82313 ) ) ( not ( = ?auto_82309 ?auto_82310 ) ) ( not ( = ?auto_82309 ?auto_82311 ) ) ( not ( = ?auto_82309 ?auto_82312 ) ) ( not ( = ?auto_82309 ?auto_82313 ) ) ( not ( = ?auto_82310 ?auto_82311 ) ) ( not ( = ?auto_82310 ?auto_82312 ) ) ( not ( = ?auto_82310 ?auto_82313 ) ) ( not ( = ?auto_82311 ?auto_82312 ) ) ( not ( = ?auto_82311 ?auto_82313 ) ) ( not ( = ?auto_82312 ?auto_82313 ) ) ( ON ?auto_82313 ?auto_82314 ) ( not ( = ?auto_82307 ?auto_82314 ) ) ( not ( = ?auto_82308 ?auto_82314 ) ) ( not ( = ?auto_82309 ?auto_82314 ) ) ( not ( = ?auto_82310 ?auto_82314 ) ) ( not ( = ?auto_82311 ?auto_82314 ) ) ( not ( = ?auto_82312 ?auto_82314 ) ) ( not ( = ?auto_82313 ?auto_82314 ) ) ( ON ?auto_82312 ?auto_82313 ) ( ON-TABLE ?auto_82314 ) ( ON ?auto_82311 ?auto_82312 ) ( CLEAR ?auto_82309 ) ( ON ?auto_82310 ?auto_82311 ) ( CLEAR ?auto_82310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82314 ?auto_82313 ?auto_82312 ?auto_82311 )
      ( MAKE-6PILE ?auto_82307 ?auto_82308 ?auto_82309 ?auto_82310 ?auto_82311 ?auto_82312 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82315 - BLOCK
      ?auto_82316 - BLOCK
      ?auto_82317 - BLOCK
      ?auto_82318 - BLOCK
      ?auto_82319 - BLOCK
      ?auto_82320 - BLOCK
    )
    :vars
    (
      ?auto_82322 - BLOCK
      ?auto_82321 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82315 ) ( ON ?auto_82316 ?auto_82315 ) ( not ( = ?auto_82315 ?auto_82316 ) ) ( not ( = ?auto_82315 ?auto_82317 ) ) ( not ( = ?auto_82315 ?auto_82318 ) ) ( not ( = ?auto_82315 ?auto_82319 ) ) ( not ( = ?auto_82315 ?auto_82320 ) ) ( not ( = ?auto_82315 ?auto_82322 ) ) ( not ( = ?auto_82316 ?auto_82317 ) ) ( not ( = ?auto_82316 ?auto_82318 ) ) ( not ( = ?auto_82316 ?auto_82319 ) ) ( not ( = ?auto_82316 ?auto_82320 ) ) ( not ( = ?auto_82316 ?auto_82322 ) ) ( not ( = ?auto_82317 ?auto_82318 ) ) ( not ( = ?auto_82317 ?auto_82319 ) ) ( not ( = ?auto_82317 ?auto_82320 ) ) ( not ( = ?auto_82317 ?auto_82322 ) ) ( not ( = ?auto_82318 ?auto_82319 ) ) ( not ( = ?auto_82318 ?auto_82320 ) ) ( not ( = ?auto_82318 ?auto_82322 ) ) ( not ( = ?auto_82319 ?auto_82320 ) ) ( not ( = ?auto_82319 ?auto_82322 ) ) ( not ( = ?auto_82320 ?auto_82322 ) ) ( ON ?auto_82322 ?auto_82321 ) ( not ( = ?auto_82315 ?auto_82321 ) ) ( not ( = ?auto_82316 ?auto_82321 ) ) ( not ( = ?auto_82317 ?auto_82321 ) ) ( not ( = ?auto_82318 ?auto_82321 ) ) ( not ( = ?auto_82319 ?auto_82321 ) ) ( not ( = ?auto_82320 ?auto_82321 ) ) ( not ( = ?auto_82322 ?auto_82321 ) ) ( ON ?auto_82320 ?auto_82322 ) ( ON-TABLE ?auto_82321 ) ( ON ?auto_82319 ?auto_82320 ) ( ON ?auto_82318 ?auto_82319 ) ( CLEAR ?auto_82318 ) ( HOLDING ?auto_82317 ) ( CLEAR ?auto_82316 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82315 ?auto_82316 ?auto_82317 )
      ( MAKE-6PILE ?auto_82315 ?auto_82316 ?auto_82317 ?auto_82318 ?auto_82319 ?auto_82320 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82323 - BLOCK
      ?auto_82324 - BLOCK
      ?auto_82325 - BLOCK
      ?auto_82326 - BLOCK
      ?auto_82327 - BLOCK
      ?auto_82328 - BLOCK
    )
    :vars
    (
      ?auto_82329 - BLOCK
      ?auto_82330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82323 ) ( ON ?auto_82324 ?auto_82323 ) ( not ( = ?auto_82323 ?auto_82324 ) ) ( not ( = ?auto_82323 ?auto_82325 ) ) ( not ( = ?auto_82323 ?auto_82326 ) ) ( not ( = ?auto_82323 ?auto_82327 ) ) ( not ( = ?auto_82323 ?auto_82328 ) ) ( not ( = ?auto_82323 ?auto_82329 ) ) ( not ( = ?auto_82324 ?auto_82325 ) ) ( not ( = ?auto_82324 ?auto_82326 ) ) ( not ( = ?auto_82324 ?auto_82327 ) ) ( not ( = ?auto_82324 ?auto_82328 ) ) ( not ( = ?auto_82324 ?auto_82329 ) ) ( not ( = ?auto_82325 ?auto_82326 ) ) ( not ( = ?auto_82325 ?auto_82327 ) ) ( not ( = ?auto_82325 ?auto_82328 ) ) ( not ( = ?auto_82325 ?auto_82329 ) ) ( not ( = ?auto_82326 ?auto_82327 ) ) ( not ( = ?auto_82326 ?auto_82328 ) ) ( not ( = ?auto_82326 ?auto_82329 ) ) ( not ( = ?auto_82327 ?auto_82328 ) ) ( not ( = ?auto_82327 ?auto_82329 ) ) ( not ( = ?auto_82328 ?auto_82329 ) ) ( ON ?auto_82329 ?auto_82330 ) ( not ( = ?auto_82323 ?auto_82330 ) ) ( not ( = ?auto_82324 ?auto_82330 ) ) ( not ( = ?auto_82325 ?auto_82330 ) ) ( not ( = ?auto_82326 ?auto_82330 ) ) ( not ( = ?auto_82327 ?auto_82330 ) ) ( not ( = ?auto_82328 ?auto_82330 ) ) ( not ( = ?auto_82329 ?auto_82330 ) ) ( ON ?auto_82328 ?auto_82329 ) ( ON-TABLE ?auto_82330 ) ( ON ?auto_82327 ?auto_82328 ) ( ON ?auto_82326 ?auto_82327 ) ( CLEAR ?auto_82324 ) ( ON ?auto_82325 ?auto_82326 ) ( CLEAR ?auto_82325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82330 ?auto_82329 ?auto_82328 ?auto_82327 ?auto_82326 )
      ( MAKE-6PILE ?auto_82323 ?auto_82324 ?auto_82325 ?auto_82326 ?auto_82327 ?auto_82328 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82331 - BLOCK
      ?auto_82332 - BLOCK
      ?auto_82333 - BLOCK
      ?auto_82334 - BLOCK
      ?auto_82335 - BLOCK
      ?auto_82336 - BLOCK
    )
    :vars
    (
      ?auto_82337 - BLOCK
      ?auto_82338 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82331 ) ( not ( = ?auto_82331 ?auto_82332 ) ) ( not ( = ?auto_82331 ?auto_82333 ) ) ( not ( = ?auto_82331 ?auto_82334 ) ) ( not ( = ?auto_82331 ?auto_82335 ) ) ( not ( = ?auto_82331 ?auto_82336 ) ) ( not ( = ?auto_82331 ?auto_82337 ) ) ( not ( = ?auto_82332 ?auto_82333 ) ) ( not ( = ?auto_82332 ?auto_82334 ) ) ( not ( = ?auto_82332 ?auto_82335 ) ) ( not ( = ?auto_82332 ?auto_82336 ) ) ( not ( = ?auto_82332 ?auto_82337 ) ) ( not ( = ?auto_82333 ?auto_82334 ) ) ( not ( = ?auto_82333 ?auto_82335 ) ) ( not ( = ?auto_82333 ?auto_82336 ) ) ( not ( = ?auto_82333 ?auto_82337 ) ) ( not ( = ?auto_82334 ?auto_82335 ) ) ( not ( = ?auto_82334 ?auto_82336 ) ) ( not ( = ?auto_82334 ?auto_82337 ) ) ( not ( = ?auto_82335 ?auto_82336 ) ) ( not ( = ?auto_82335 ?auto_82337 ) ) ( not ( = ?auto_82336 ?auto_82337 ) ) ( ON ?auto_82337 ?auto_82338 ) ( not ( = ?auto_82331 ?auto_82338 ) ) ( not ( = ?auto_82332 ?auto_82338 ) ) ( not ( = ?auto_82333 ?auto_82338 ) ) ( not ( = ?auto_82334 ?auto_82338 ) ) ( not ( = ?auto_82335 ?auto_82338 ) ) ( not ( = ?auto_82336 ?auto_82338 ) ) ( not ( = ?auto_82337 ?auto_82338 ) ) ( ON ?auto_82336 ?auto_82337 ) ( ON-TABLE ?auto_82338 ) ( ON ?auto_82335 ?auto_82336 ) ( ON ?auto_82334 ?auto_82335 ) ( ON ?auto_82333 ?auto_82334 ) ( CLEAR ?auto_82333 ) ( HOLDING ?auto_82332 ) ( CLEAR ?auto_82331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82331 ?auto_82332 )
      ( MAKE-6PILE ?auto_82331 ?auto_82332 ?auto_82333 ?auto_82334 ?auto_82335 ?auto_82336 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82339 - BLOCK
      ?auto_82340 - BLOCK
      ?auto_82341 - BLOCK
      ?auto_82342 - BLOCK
      ?auto_82343 - BLOCK
      ?auto_82344 - BLOCK
    )
    :vars
    (
      ?auto_82345 - BLOCK
      ?auto_82346 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82339 ) ( not ( = ?auto_82339 ?auto_82340 ) ) ( not ( = ?auto_82339 ?auto_82341 ) ) ( not ( = ?auto_82339 ?auto_82342 ) ) ( not ( = ?auto_82339 ?auto_82343 ) ) ( not ( = ?auto_82339 ?auto_82344 ) ) ( not ( = ?auto_82339 ?auto_82345 ) ) ( not ( = ?auto_82340 ?auto_82341 ) ) ( not ( = ?auto_82340 ?auto_82342 ) ) ( not ( = ?auto_82340 ?auto_82343 ) ) ( not ( = ?auto_82340 ?auto_82344 ) ) ( not ( = ?auto_82340 ?auto_82345 ) ) ( not ( = ?auto_82341 ?auto_82342 ) ) ( not ( = ?auto_82341 ?auto_82343 ) ) ( not ( = ?auto_82341 ?auto_82344 ) ) ( not ( = ?auto_82341 ?auto_82345 ) ) ( not ( = ?auto_82342 ?auto_82343 ) ) ( not ( = ?auto_82342 ?auto_82344 ) ) ( not ( = ?auto_82342 ?auto_82345 ) ) ( not ( = ?auto_82343 ?auto_82344 ) ) ( not ( = ?auto_82343 ?auto_82345 ) ) ( not ( = ?auto_82344 ?auto_82345 ) ) ( ON ?auto_82345 ?auto_82346 ) ( not ( = ?auto_82339 ?auto_82346 ) ) ( not ( = ?auto_82340 ?auto_82346 ) ) ( not ( = ?auto_82341 ?auto_82346 ) ) ( not ( = ?auto_82342 ?auto_82346 ) ) ( not ( = ?auto_82343 ?auto_82346 ) ) ( not ( = ?auto_82344 ?auto_82346 ) ) ( not ( = ?auto_82345 ?auto_82346 ) ) ( ON ?auto_82344 ?auto_82345 ) ( ON-TABLE ?auto_82346 ) ( ON ?auto_82343 ?auto_82344 ) ( ON ?auto_82342 ?auto_82343 ) ( ON ?auto_82341 ?auto_82342 ) ( CLEAR ?auto_82339 ) ( ON ?auto_82340 ?auto_82341 ) ( CLEAR ?auto_82340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82346 ?auto_82345 ?auto_82344 ?auto_82343 ?auto_82342 ?auto_82341 )
      ( MAKE-6PILE ?auto_82339 ?auto_82340 ?auto_82341 ?auto_82342 ?auto_82343 ?auto_82344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82347 - BLOCK
      ?auto_82348 - BLOCK
      ?auto_82349 - BLOCK
      ?auto_82350 - BLOCK
      ?auto_82351 - BLOCK
      ?auto_82352 - BLOCK
    )
    :vars
    (
      ?auto_82353 - BLOCK
      ?auto_82354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82347 ?auto_82348 ) ) ( not ( = ?auto_82347 ?auto_82349 ) ) ( not ( = ?auto_82347 ?auto_82350 ) ) ( not ( = ?auto_82347 ?auto_82351 ) ) ( not ( = ?auto_82347 ?auto_82352 ) ) ( not ( = ?auto_82347 ?auto_82353 ) ) ( not ( = ?auto_82348 ?auto_82349 ) ) ( not ( = ?auto_82348 ?auto_82350 ) ) ( not ( = ?auto_82348 ?auto_82351 ) ) ( not ( = ?auto_82348 ?auto_82352 ) ) ( not ( = ?auto_82348 ?auto_82353 ) ) ( not ( = ?auto_82349 ?auto_82350 ) ) ( not ( = ?auto_82349 ?auto_82351 ) ) ( not ( = ?auto_82349 ?auto_82352 ) ) ( not ( = ?auto_82349 ?auto_82353 ) ) ( not ( = ?auto_82350 ?auto_82351 ) ) ( not ( = ?auto_82350 ?auto_82352 ) ) ( not ( = ?auto_82350 ?auto_82353 ) ) ( not ( = ?auto_82351 ?auto_82352 ) ) ( not ( = ?auto_82351 ?auto_82353 ) ) ( not ( = ?auto_82352 ?auto_82353 ) ) ( ON ?auto_82353 ?auto_82354 ) ( not ( = ?auto_82347 ?auto_82354 ) ) ( not ( = ?auto_82348 ?auto_82354 ) ) ( not ( = ?auto_82349 ?auto_82354 ) ) ( not ( = ?auto_82350 ?auto_82354 ) ) ( not ( = ?auto_82351 ?auto_82354 ) ) ( not ( = ?auto_82352 ?auto_82354 ) ) ( not ( = ?auto_82353 ?auto_82354 ) ) ( ON ?auto_82352 ?auto_82353 ) ( ON-TABLE ?auto_82354 ) ( ON ?auto_82351 ?auto_82352 ) ( ON ?auto_82350 ?auto_82351 ) ( ON ?auto_82349 ?auto_82350 ) ( ON ?auto_82348 ?auto_82349 ) ( CLEAR ?auto_82348 ) ( HOLDING ?auto_82347 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82347 )
      ( MAKE-6PILE ?auto_82347 ?auto_82348 ?auto_82349 ?auto_82350 ?auto_82351 ?auto_82352 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_82355 - BLOCK
      ?auto_82356 - BLOCK
      ?auto_82357 - BLOCK
      ?auto_82358 - BLOCK
      ?auto_82359 - BLOCK
      ?auto_82360 - BLOCK
    )
    :vars
    (
      ?auto_82361 - BLOCK
      ?auto_82362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82355 ?auto_82356 ) ) ( not ( = ?auto_82355 ?auto_82357 ) ) ( not ( = ?auto_82355 ?auto_82358 ) ) ( not ( = ?auto_82355 ?auto_82359 ) ) ( not ( = ?auto_82355 ?auto_82360 ) ) ( not ( = ?auto_82355 ?auto_82361 ) ) ( not ( = ?auto_82356 ?auto_82357 ) ) ( not ( = ?auto_82356 ?auto_82358 ) ) ( not ( = ?auto_82356 ?auto_82359 ) ) ( not ( = ?auto_82356 ?auto_82360 ) ) ( not ( = ?auto_82356 ?auto_82361 ) ) ( not ( = ?auto_82357 ?auto_82358 ) ) ( not ( = ?auto_82357 ?auto_82359 ) ) ( not ( = ?auto_82357 ?auto_82360 ) ) ( not ( = ?auto_82357 ?auto_82361 ) ) ( not ( = ?auto_82358 ?auto_82359 ) ) ( not ( = ?auto_82358 ?auto_82360 ) ) ( not ( = ?auto_82358 ?auto_82361 ) ) ( not ( = ?auto_82359 ?auto_82360 ) ) ( not ( = ?auto_82359 ?auto_82361 ) ) ( not ( = ?auto_82360 ?auto_82361 ) ) ( ON ?auto_82361 ?auto_82362 ) ( not ( = ?auto_82355 ?auto_82362 ) ) ( not ( = ?auto_82356 ?auto_82362 ) ) ( not ( = ?auto_82357 ?auto_82362 ) ) ( not ( = ?auto_82358 ?auto_82362 ) ) ( not ( = ?auto_82359 ?auto_82362 ) ) ( not ( = ?auto_82360 ?auto_82362 ) ) ( not ( = ?auto_82361 ?auto_82362 ) ) ( ON ?auto_82360 ?auto_82361 ) ( ON-TABLE ?auto_82362 ) ( ON ?auto_82359 ?auto_82360 ) ( ON ?auto_82358 ?auto_82359 ) ( ON ?auto_82357 ?auto_82358 ) ( ON ?auto_82356 ?auto_82357 ) ( ON ?auto_82355 ?auto_82356 ) ( CLEAR ?auto_82355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82362 ?auto_82361 ?auto_82360 ?auto_82359 ?auto_82358 ?auto_82357 ?auto_82356 )
      ( MAKE-6PILE ?auto_82355 ?auto_82356 ?auto_82357 ?auto_82358 ?auto_82359 ?auto_82360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82364 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_82364 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_82364 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82365 - BLOCK
    )
    :vars
    (
      ?auto_82366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82365 ?auto_82366 ) ( CLEAR ?auto_82365 ) ( HAND-EMPTY ) ( not ( = ?auto_82365 ?auto_82366 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82365 ?auto_82366 )
      ( MAKE-1PILE ?auto_82365 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82367 - BLOCK
    )
    :vars
    (
      ?auto_82368 - BLOCK
      ?auto_82369 - BLOCK
      ?auto_82373 - BLOCK
      ?auto_82371 - BLOCK
      ?auto_82372 - BLOCK
      ?auto_82370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82367 ?auto_82368 ) ) ( HOLDING ?auto_82367 ) ( CLEAR ?auto_82368 ) ( ON-TABLE ?auto_82369 ) ( ON ?auto_82373 ?auto_82369 ) ( ON ?auto_82371 ?auto_82373 ) ( ON ?auto_82372 ?auto_82371 ) ( ON ?auto_82370 ?auto_82372 ) ( ON ?auto_82368 ?auto_82370 ) ( not ( = ?auto_82369 ?auto_82373 ) ) ( not ( = ?auto_82369 ?auto_82371 ) ) ( not ( = ?auto_82369 ?auto_82372 ) ) ( not ( = ?auto_82369 ?auto_82370 ) ) ( not ( = ?auto_82369 ?auto_82368 ) ) ( not ( = ?auto_82369 ?auto_82367 ) ) ( not ( = ?auto_82373 ?auto_82371 ) ) ( not ( = ?auto_82373 ?auto_82372 ) ) ( not ( = ?auto_82373 ?auto_82370 ) ) ( not ( = ?auto_82373 ?auto_82368 ) ) ( not ( = ?auto_82373 ?auto_82367 ) ) ( not ( = ?auto_82371 ?auto_82372 ) ) ( not ( = ?auto_82371 ?auto_82370 ) ) ( not ( = ?auto_82371 ?auto_82368 ) ) ( not ( = ?auto_82371 ?auto_82367 ) ) ( not ( = ?auto_82372 ?auto_82370 ) ) ( not ( = ?auto_82372 ?auto_82368 ) ) ( not ( = ?auto_82372 ?auto_82367 ) ) ( not ( = ?auto_82370 ?auto_82368 ) ) ( not ( = ?auto_82370 ?auto_82367 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82369 ?auto_82373 ?auto_82371 ?auto_82372 ?auto_82370 ?auto_82368 ?auto_82367 )
      ( MAKE-1PILE ?auto_82367 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82374 - BLOCK
    )
    :vars
    (
      ?auto_82378 - BLOCK
      ?auto_82379 - BLOCK
      ?auto_82377 - BLOCK
      ?auto_82375 - BLOCK
      ?auto_82376 - BLOCK
      ?auto_82380 - BLOCK
      ?auto_82381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82374 ?auto_82378 ) ) ( CLEAR ?auto_82378 ) ( ON-TABLE ?auto_82379 ) ( ON ?auto_82377 ?auto_82379 ) ( ON ?auto_82375 ?auto_82377 ) ( ON ?auto_82376 ?auto_82375 ) ( ON ?auto_82380 ?auto_82376 ) ( ON ?auto_82378 ?auto_82380 ) ( not ( = ?auto_82379 ?auto_82377 ) ) ( not ( = ?auto_82379 ?auto_82375 ) ) ( not ( = ?auto_82379 ?auto_82376 ) ) ( not ( = ?auto_82379 ?auto_82380 ) ) ( not ( = ?auto_82379 ?auto_82378 ) ) ( not ( = ?auto_82379 ?auto_82374 ) ) ( not ( = ?auto_82377 ?auto_82375 ) ) ( not ( = ?auto_82377 ?auto_82376 ) ) ( not ( = ?auto_82377 ?auto_82380 ) ) ( not ( = ?auto_82377 ?auto_82378 ) ) ( not ( = ?auto_82377 ?auto_82374 ) ) ( not ( = ?auto_82375 ?auto_82376 ) ) ( not ( = ?auto_82375 ?auto_82380 ) ) ( not ( = ?auto_82375 ?auto_82378 ) ) ( not ( = ?auto_82375 ?auto_82374 ) ) ( not ( = ?auto_82376 ?auto_82380 ) ) ( not ( = ?auto_82376 ?auto_82378 ) ) ( not ( = ?auto_82376 ?auto_82374 ) ) ( not ( = ?auto_82380 ?auto_82378 ) ) ( not ( = ?auto_82380 ?auto_82374 ) ) ( ON ?auto_82374 ?auto_82381 ) ( CLEAR ?auto_82374 ) ( HAND-EMPTY ) ( not ( = ?auto_82374 ?auto_82381 ) ) ( not ( = ?auto_82378 ?auto_82381 ) ) ( not ( = ?auto_82379 ?auto_82381 ) ) ( not ( = ?auto_82377 ?auto_82381 ) ) ( not ( = ?auto_82375 ?auto_82381 ) ) ( not ( = ?auto_82376 ?auto_82381 ) ) ( not ( = ?auto_82380 ?auto_82381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82374 ?auto_82381 )
      ( MAKE-1PILE ?auto_82374 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82382 - BLOCK
    )
    :vars
    (
      ?auto_82388 - BLOCK
      ?auto_82383 - BLOCK
      ?auto_82389 - BLOCK
      ?auto_82385 - BLOCK
      ?auto_82387 - BLOCK
      ?auto_82386 - BLOCK
      ?auto_82384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82382 ?auto_82388 ) ) ( ON-TABLE ?auto_82383 ) ( ON ?auto_82389 ?auto_82383 ) ( ON ?auto_82385 ?auto_82389 ) ( ON ?auto_82387 ?auto_82385 ) ( ON ?auto_82386 ?auto_82387 ) ( not ( = ?auto_82383 ?auto_82389 ) ) ( not ( = ?auto_82383 ?auto_82385 ) ) ( not ( = ?auto_82383 ?auto_82387 ) ) ( not ( = ?auto_82383 ?auto_82386 ) ) ( not ( = ?auto_82383 ?auto_82388 ) ) ( not ( = ?auto_82383 ?auto_82382 ) ) ( not ( = ?auto_82389 ?auto_82385 ) ) ( not ( = ?auto_82389 ?auto_82387 ) ) ( not ( = ?auto_82389 ?auto_82386 ) ) ( not ( = ?auto_82389 ?auto_82388 ) ) ( not ( = ?auto_82389 ?auto_82382 ) ) ( not ( = ?auto_82385 ?auto_82387 ) ) ( not ( = ?auto_82385 ?auto_82386 ) ) ( not ( = ?auto_82385 ?auto_82388 ) ) ( not ( = ?auto_82385 ?auto_82382 ) ) ( not ( = ?auto_82387 ?auto_82386 ) ) ( not ( = ?auto_82387 ?auto_82388 ) ) ( not ( = ?auto_82387 ?auto_82382 ) ) ( not ( = ?auto_82386 ?auto_82388 ) ) ( not ( = ?auto_82386 ?auto_82382 ) ) ( ON ?auto_82382 ?auto_82384 ) ( CLEAR ?auto_82382 ) ( not ( = ?auto_82382 ?auto_82384 ) ) ( not ( = ?auto_82388 ?auto_82384 ) ) ( not ( = ?auto_82383 ?auto_82384 ) ) ( not ( = ?auto_82389 ?auto_82384 ) ) ( not ( = ?auto_82385 ?auto_82384 ) ) ( not ( = ?auto_82387 ?auto_82384 ) ) ( not ( = ?auto_82386 ?auto_82384 ) ) ( HOLDING ?auto_82388 ) ( CLEAR ?auto_82386 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82383 ?auto_82389 ?auto_82385 ?auto_82387 ?auto_82386 ?auto_82388 )
      ( MAKE-1PILE ?auto_82382 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82390 - BLOCK
    )
    :vars
    (
      ?auto_82392 - BLOCK
      ?auto_82394 - BLOCK
      ?auto_82391 - BLOCK
      ?auto_82393 - BLOCK
      ?auto_82396 - BLOCK
      ?auto_82397 - BLOCK
      ?auto_82395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82390 ?auto_82392 ) ) ( ON-TABLE ?auto_82394 ) ( ON ?auto_82391 ?auto_82394 ) ( ON ?auto_82393 ?auto_82391 ) ( ON ?auto_82396 ?auto_82393 ) ( ON ?auto_82397 ?auto_82396 ) ( not ( = ?auto_82394 ?auto_82391 ) ) ( not ( = ?auto_82394 ?auto_82393 ) ) ( not ( = ?auto_82394 ?auto_82396 ) ) ( not ( = ?auto_82394 ?auto_82397 ) ) ( not ( = ?auto_82394 ?auto_82392 ) ) ( not ( = ?auto_82394 ?auto_82390 ) ) ( not ( = ?auto_82391 ?auto_82393 ) ) ( not ( = ?auto_82391 ?auto_82396 ) ) ( not ( = ?auto_82391 ?auto_82397 ) ) ( not ( = ?auto_82391 ?auto_82392 ) ) ( not ( = ?auto_82391 ?auto_82390 ) ) ( not ( = ?auto_82393 ?auto_82396 ) ) ( not ( = ?auto_82393 ?auto_82397 ) ) ( not ( = ?auto_82393 ?auto_82392 ) ) ( not ( = ?auto_82393 ?auto_82390 ) ) ( not ( = ?auto_82396 ?auto_82397 ) ) ( not ( = ?auto_82396 ?auto_82392 ) ) ( not ( = ?auto_82396 ?auto_82390 ) ) ( not ( = ?auto_82397 ?auto_82392 ) ) ( not ( = ?auto_82397 ?auto_82390 ) ) ( ON ?auto_82390 ?auto_82395 ) ( not ( = ?auto_82390 ?auto_82395 ) ) ( not ( = ?auto_82392 ?auto_82395 ) ) ( not ( = ?auto_82394 ?auto_82395 ) ) ( not ( = ?auto_82391 ?auto_82395 ) ) ( not ( = ?auto_82393 ?auto_82395 ) ) ( not ( = ?auto_82396 ?auto_82395 ) ) ( not ( = ?auto_82397 ?auto_82395 ) ) ( CLEAR ?auto_82397 ) ( ON ?auto_82392 ?auto_82390 ) ( CLEAR ?auto_82392 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82395 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82395 ?auto_82390 )
      ( MAKE-1PILE ?auto_82390 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82398 - BLOCK
    )
    :vars
    (
      ?auto_82405 - BLOCK
      ?auto_82402 - BLOCK
      ?auto_82403 - BLOCK
      ?auto_82404 - BLOCK
      ?auto_82400 - BLOCK
      ?auto_82401 - BLOCK
      ?auto_82399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82398 ?auto_82405 ) ) ( ON-TABLE ?auto_82402 ) ( ON ?auto_82403 ?auto_82402 ) ( ON ?auto_82404 ?auto_82403 ) ( ON ?auto_82400 ?auto_82404 ) ( not ( = ?auto_82402 ?auto_82403 ) ) ( not ( = ?auto_82402 ?auto_82404 ) ) ( not ( = ?auto_82402 ?auto_82400 ) ) ( not ( = ?auto_82402 ?auto_82401 ) ) ( not ( = ?auto_82402 ?auto_82405 ) ) ( not ( = ?auto_82402 ?auto_82398 ) ) ( not ( = ?auto_82403 ?auto_82404 ) ) ( not ( = ?auto_82403 ?auto_82400 ) ) ( not ( = ?auto_82403 ?auto_82401 ) ) ( not ( = ?auto_82403 ?auto_82405 ) ) ( not ( = ?auto_82403 ?auto_82398 ) ) ( not ( = ?auto_82404 ?auto_82400 ) ) ( not ( = ?auto_82404 ?auto_82401 ) ) ( not ( = ?auto_82404 ?auto_82405 ) ) ( not ( = ?auto_82404 ?auto_82398 ) ) ( not ( = ?auto_82400 ?auto_82401 ) ) ( not ( = ?auto_82400 ?auto_82405 ) ) ( not ( = ?auto_82400 ?auto_82398 ) ) ( not ( = ?auto_82401 ?auto_82405 ) ) ( not ( = ?auto_82401 ?auto_82398 ) ) ( ON ?auto_82398 ?auto_82399 ) ( not ( = ?auto_82398 ?auto_82399 ) ) ( not ( = ?auto_82405 ?auto_82399 ) ) ( not ( = ?auto_82402 ?auto_82399 ) ) ( not ( = ?auto_82403 ?auto_82399 ) ) ( not ( = ?auto_82404 ?auto_82399 ) ) ( not ( = ?auto_82400 ?auto_82399 ) ) ( not ( = ?auto_82401 ?auto_82399 ) ) ( ON ?auto_82405 ?auto_82398 ) ( CLEAR ?auto_82405 ) ( ON-TABLE ?auto_82399 ) ( HOLDING ?auto_82401 ) ( CLEAR ?auto_82400 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82402 ?auto_82403 ?auto_82404 ?auto_82400 ?auto_82401 )
      ( MAKE-1PILE ?auto_82398 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82406 - BLOCK
    )
    :vars
    (
      ?auto_82408 - BLOCK
      ?auto_82411 - BLOCK
      ?auto_82413 - BLOCK
      ?auto_82407 - BLOCK
      ?auto_82409 - BLOCK
      ?auto_82412 - BLOCK
      ?auto_82410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82406 ?auto_82408 ) ) ( ON-TABLE ?auto_82411 ) ( ON ?auto_82413 ?auto_82411 ) ( ON ?auto_82407 ?auto_82413 ) ( ON ?auto_82409 ?auto_82407 ) ( not ( = ?auto_82411 ?auto_82413 ) ) ( not ( = ?auto_82411 ?auto_82407 ) ) ( not ( = ?auto_82411 ?auto_82409 ) ) ( not ( = ?auto_82411 ?auto_82412 ) ) ( not ( = ?auto_82411 ?auto_82408 ) ) ( not ( = ?auto_82411 ?auto_82406 ) ) ( not ( = ?auto_82413 ?auto_82407 ) ) ( not ( = ?auto_82413 ?auto_82409 ) ) ( not ( = ?auto_82413 ?auto_82412 ) ) ( not ( = ?auto_82413 ?auto_82408 ) ) ( not ( = ?auto_82413 ?auto_82406 ) ) ( not ( = ?auto_82407 ?auto_82409 ) ) ( not ( = ?auto_82407 ?auto_82412 ) ) ( not ( = ?auto_82407 ?auto_82408 ) ) ( not ( = ?auto_82407 ?auto_82406 ) ) ( not ( = ?auto_82409 ?auto_82412 ) ) ( not ( = ?auto_82409 ?auto_82408 ) ) ( not ( = ?auto_82409 ?auto_82406 ) ) ( not ( = ?auto_82412 ?auto_82408 ) ) ( not ( = ?auto_82412 ?auto_82406 ) ) ( ON ?auto_82406 ?auto_82410 ) ( not ( = ?auto_82406 ?auto_82410 ) ) ( not ( = ?auto_82408 ?auto_82410 ) ) ( not ( = ?auto_82411 ?auto_82410 ) ) ( not ( = ?auto_82413 ?auto_82410 ) ) ( not ( = ?auto_82407 ?auto_82410 ) ) ( not ( = ?auto_82409 ?auto_82410 ) ) ( not ( = ?auto_82412 ?auto_82410 ) ) ( ON ?auto_82408 ?auto_82406 ) ( ON-TABLE ?auto_82410 ) ( CLEAR ?auto_82409 ) ( ON ?auto_82412 ?auto_82408 ) ( CLEAR ?auto_82412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82410 ?auto_82406 ?auto_82408 )
      ( MAKE-1PILE ?auto_82406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82414 - BLOCK
    )
    :vars
    (
      ?auto_82418 - BLOCK
      ?auto_82419 - BLOCK
      ?auto_82415 - BLOCK
      ?auto_82421 - BLOCK
      ?auto_82416 - BLOCK
      ?auto_82417 - BLOCK
      ?auto_82420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82414 ?auto_82418 ) ) ( ON-TABLE ?auto_82419 ) ( ON ?auto_82415 ?auto_82419 ) ( ON ?auto_82421 ?auto_82415 ) ( not ( = ?auto_82419 ?auto_82415 ) ) ( not ( = ?auto_82419 ?auto_82421 ) ) ( not ( = ?auto_82419 ?auto_82416 ) ) ( not ( = ?auto_82419 ?auto_82417 ) ) ( not ( = ?auto_82419 ?auto_82418 ) ) ( not ( = ?auto_82419 ?auto_82414 ) ) ( not ( = ?auto_82415 ?auto_82421 ) ) ( not ( = ?auto_82415 ?auto_82416 ) ) ( not ( = ?auto_82415 ?auto_82417 ) ) ( not ( = ?auto_82415 ?auto_82418 ) ) ( not ( = ?auto_82415 ?auto_82414 ) ) ( not ( = ?auto_82421 ?auto_82416 ) ) ( not ( = ?auto_82421 ?auto_82417 ) ) ( not ( = ?auto_82421 ?auto_82418 ) ) ( not ( = ?auto_82421 ?auto_82414 ) ) ( not ( = ?auto_82416 ?auto_82417 ) ) ( not ( = ?auto_82416 ?auto_82418 ) ) ( not ( = ?auto_82416 ?auto_82414 ) ) ( not ( = ?auto_82417 ?auto_82418 ) ) ( not ( = ?auto_82417 ?auto_82414 ) ) ( ON ?auto_82414 ?auto_82420 ) ( not ( = ?auto_82414 ?auto_82420 ) ) ( not ( = ?auto_82418 ?auto_82420 ) ) ( not ( = ?auto_82419 ?auto_82420 ) ) ( not ( = ?auto_82415 ?auto_82420 ) ) ( not ( = ?auto_82421 ?auto_82420 ) ) ( not ( = ?auto_82416 ?auto_82420 ) ) ( not ( = ?auto_82417 ?auto_82420 ) ) ( ON ?auto_82418 ?auto_82414 ) ( ON-TABLE ?auto_82420 ) ( ON ?auto_82417 ?auto_82418 ) ( CLEAR ?auto_82417 ) ( HOLDING ?auto_82416 ) ( CLEAR ?auto_82421 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82419 ?auto_82415 ?auto_82421 ?auto_82416 )
      ( MAKE-1PILE ?auto_82414 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82422 - BLOCK
    )
    :vars
    (
      ?auto_82428 - BLOCK
      ?auto_82427 - BLOCK
      ?auto_82429 - BLOCK
      ?auto_82424 - BLOCK
      ?auto_82423 - BLOCK
      ?auto_82425 - BLOCK
      ?auto_82426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82422 ?auto_82428 ) ) ( ON-TABLE ?auto_82427 ) ( ON ?auto_82429 ?auto_82427 ) ( ON ?auto_82424 ?auto_82429 ) ( not ( = ?auto_82427 ?auto_82429 ) ) ( not ( = ?auto_82427 ?auto_82424 ) ) ( not ( = ?auto_82427 ?auto_82423 ) ) ( not ( = ?auto_82427 ?auto_82425 ) ) ( not ( = ?auto_82427 ?auto_82428 ) ) ( not ( = ?auto_82427 ?auto_82422 ) ) ( not ( = ?auto_82429 ?auto_82424 ) ) ( not ( = ?auto_82429 ?auto_82423 ) ) ( not ( = ?auto_82429 ?auto_82425 ) ) ( not ( = ?auto_82429 ?auto_82428 ) ) ( not ( = ?auto_82429 ?auto_82422 ) ) ( not ( = ?auto_82424 ?auto_82423 ) ) ( not ( = ?auto_82424 ?auto_82425 ) ) ( not ( = ?auto_82424 ?auto_82428 ) ) ( not ( = ?auto_82424 ?auto_82422 ) ) ( not ( = ?auto_82423 ?auto_82425 ) ) ( not ( = ?auto_82423 ?auto_82428 ) ) ( not ( = ?auto_82423 ?auto_82422 ) ) ( not ( = ?auto_82425 ?auto_82428 ) ) ( not ( = ?auto_82425 ?auto_82422 ) ) ( ON ?auto_82422 ?auto_82426 ) ( not ( = ?auto_82422 ?auto_82426 ) ) ( not ( = ?auto_82428 ?auto_82426 ) ) ( not ( = ?auto_82427 ?auto_82426 ) ) ( not ( = ?auto_82429 ?auto_82426 ) ) ( not ( = ?auto_82424 ?auto_82426 ) ) ( not ( = ?auto_82423 ?auto_82426 ) ) ( not ( = ?auto_82425 ?auto_82426 ) ) ( ON ?auto_82428 ?auto_82422 ) ( ON-TABLE ?auto_82426 ) ( ON ?auto_82425 ?auto_82428 ) ( CLEAR ?auto_82424 ) ( ON ?auto_82423 ?auto_82425 ) ( CLEAR ?auto_82423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82426 ?auto_82422 ?auto_82428 ?auto_82425 )
      ( MAKE-1PILE ?auto_82422 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82430 - BLOCK
    )
    :vars
    (
      ?auto_82435 - BLOCK
      ?auto_82437 - BLOCK
      ?auto_82433 - BLOCK
      ?auto_82431 - BLOCK
      ?auto_82432 - BLOCK
      ?auto_82434 - BLOCK
      ?auto_82436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82430 ?auto_82435 ) ) ( ON-TABLE ?auto_82437 ) ( ON ?auto_82433 ?auto_82437 ) ( not ( = ?auto_82437 ?auto_82433 ) ) ( not ( = ?auto_82437 ?auto_82431 ) ) ( not ( = ?auto_82437 ?auto_82432 ) ) ( not ( = ?auto_82437 ?auto_82434 ) ) ( not ( = ?auto_82437 ?auto_82435 ) ) ( not ( = ?auto_82437 ?auto_82430 ) ) ( not ( = ?auto_82433 ?auto_82431 ) ) ( not ( = ?auto_82433 ?auto_82432 ) ) ( not ( = ?auto_82433 ?auto_82434 ) ) ( not ( = ?auto_82433 ?auto_82435 ) ) ( not ( = ?auto_82433 ?auto_82430 ) ) ( not ( = ?auto_82431 ?auto_82432 ) ) ( not ( = ?auto_82431 ?auto_82434 ) ) ( not ( = ?auto_82431 ?auto_82435 ) ) ( not ( = ?auto_82431 ?auto_82430 ) ) ( not ( = ?auto_82432 ?auto_82434 ) ) ( not ( = ?auto_82432 ?auto_82435 ) ) ( not ( = ?auto_82432 ?auto_82430 ) ) ( not ( = ?auto_82434 ?auto_82435 ) ) ( not ( = ?auto_82434 ?auto_82430 ) ) ( ON ?auto_82430 ?auto_82436 ) ( not ( = ?auto_82430 ?auto_82436 ) ) ( not ( = ?auto_82435 ?auto_82436 ) ) ( not ( = ?auto_82437 ?auto_82436 ) ) ( not ( = ?auto_82433 ?auto_82436 ) ) ( not ( = ?auto_82431 ?auto_82436 ) ) ( not ( = ?auto_82432 ?auto_82436 ) ) ( not ( = ?auto_82434 ?auto_82436 ) ) ( ON ?auto_82435 ?auto_82430 ) ( ON-TABLE ?auto_82436 ) ( ON ?auto_82434 ?auto_82435 ) ( ON ?auto_82432 ?auto_82434 ) ( CLEAR ?auto_82432 ) ( HOLDING ?auto_82431 ) ( CLEAR ?auto_82433 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82437 ?auto_82433 ?auto_82431 )
      ( MAKE-1PILE ?auto_82430 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82438 - BLOCK
    )
    :vars
    (
      ?auto_82441 - BLOCK
      ?auto_82443 - BLOCK
      ?auto_82442 - BLOCK
      ?auto_82439 - BLOCK
      ?auto_82444 - BLOCK
      ?auto_82440 - BLOCK
      ?auto_82445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82438 ?auto_82441 ) ) ( ON-TABLE ?auto_82443 ) ( ON ?auto_82442 ?auto_82443 ) ( not ( = ?auto_82443 ?auto_82442 ) ) ( not ( = ?auto_82443 ?auto_82439 ) ) ( not ( = ?auto_82443 ?auto_82444 ) ) ( not ( = ?auto_82443 ?auto_82440 ) ) ( not ( = ?auto_82443 ?auto_82441 ) ) ( not ( = ?auto_82443 ?auto_82438 ) ) ( not ( = ?auto_82442 ?auto_82439 ) ) ( not ( = ?auto_82442 ?auto_82444 ) ) ( not ( = ?auto_82442 ?auto_82440 ) ) ( not ( = ?auto_82442 ?auto_82441 ) ) ( not ( = ?auto_82442 ?auto_82438 ) ) ( not ( = ?auto_82439 ?auto_82444 ) ) ( not ( = ?auto_82439 ?auto_82440 ) ) ( not ( = ?auto_82439 ?auto_82441 ) ) ( not ( = ?auto_82439 ?auto_82438 ) ) ( not ( = ?auto_82444 ?auto_82440 ) ) ( not ( = ?auto_82444 ?auto_82441 ) ) ( not ( = ?auto_82444 ?auto_82438 ) ) ( not ( = ?auto_82440 ?auto_82441 ) ) ( not ( = ?auto_82440 ?auto_82438 ) ) ( ON ?auto_82438 ?auto_82445 ) ( not ( = ?auto_82438 ?auto_82445 ) ) ( not ( = ?auto_82441 ?auto_82445 ) ) ( not ( = ?auto_82443 ?auto_82445 ) ) ( not ( = ?auto_82442 ?auto_82445 ) ) ( not ( = ?auto_82439 ?auto_82445 ) ) ( not ( = ?auto_82444 ?auto_82445 ) ) ( not ( = ?auto_82440 ?auto_82445 ) ) ( ON ?auto_82441 ?auto_82438 ) ( ON-TABLE ?auto_82445 ) ( ON ?auto_82440 ?auto_82441 ) ( ON ?auto_82444 ?auto_82440 ) ( CLEAR ?auto_82442 ) ( ON ?auto_82439 ?auto_82444 ) ( CLEAR ?auto_82439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82445 ?auto_82438 ?auto_82441 ?auto_82440 ?auto_82444 )
      ( MAKE-1PILE ?auto_82438 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82446 - BLOCK
    )
    :vars
    (
      ?auto_82447 - BLOCK
      ?auto_82452 - BLOCK
      ?auto_82453 - BLOCK
      ?auto_82448 - BLOCK
      ?auto_82451 - BLOCK
      ?auto_82450 - BLOCK
      ?auto_82449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82446 ?auto_82447 ) ) ( ON-TABLE ?auto_82452 ) ( not ( = ?auto_82452 ?auto_82453 ) ) ( not ( = ?auto_82452 ?auto_82448 ) ) ( not ( = ?auto_82452 ?auto_82451 ) ) ( not ( = ?auto_82452 ?auto_82450 ) ) ( not ( = ?auto_82452 ?auto_82447 ) ) ( not ( = ?auto_82452 ?auto_82446 ) ) ( not ( = ?auto_82453 ?auto_82448 ) ) ( not ( = ?auto_82453 ?auto_82451 ) ) ( not ( = ?auto_82453 ?auto_82450 ) ) ( not ( = ?auto_82453 ?auto_82447 ) ) ( not ( = ?auto_82453 ?auto_82446 ) ) ( not ( = ?auto_82448 ?auto_82451 ) ) ( not ( = ?auto_82448 ?auto_82450 ) ) ( not ( = ?auto_82448 ?auto_82447 ) ) ( not ( = ?auto_82448 ?auto_82446 ) ) ( not ( = ?auto_82451 ?auto_82450 ) ) ( not ( = ?auto_82451 ?auto_82447 ) ) ( not ( = ?auto_82451 ?auto_82446 ) ) ( not ( = ?auto_82450 ?auto_82447 ) ) ( not ( = ?auto_82450 ?auto_82446 ) ) ( ON ?auto_82446 ?auto_82449 ) ( not ( = ?auto_82446 ?auto_82449 ) ) ( not ( = ?auto_82447 ?auto_82449 ) ) ( not ( = ?auto_82452 ?auto_82449 ) ) ( not ( = ?auto_82453 ?auto_82449 ) ) ( not ( = ?auto_82448 ?auto_82449 ) ) ( not ( = ?auto_82451 ?auto_82449 ) ) ( not ( = ?auto_82450 ?auto_82449 ) ) ( ON ?auto_82447 ?auto_82446 ) ( ON-TABLE ?auto_82449 ) ( ON ?auto_82450 ?auto_82447 ) ( ON ?auto_82451 ?auto_82450 ) ( ON ?auto_82448 ?auto_82451 ) ( CLEAR ?auto_82448 ) ( HOLDING ?auto_82453 ) ( CLEAR ?auto_82452 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82452 ?auto_82453 )
      ( MAKE-1PILE ?auto_82446 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82454 - BLOCK
    )
    :vars
    (
      ?auto_82461 - BLOCK
      ?auto_82460 - BLOCK
      ?auto_82459 - BLOCK
      ?auto_82455 - BLOCK
      ?auto_82457 - BLOCK
      ?auto_82456 - BLOCK
      ?auto_82458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82454 ?auto_82461 ) ) ( ON-TABLE ?auto_82460 ) ( not ( = ?auto_82460 ?auto_82459 ) ) ( not ( = ?auto_82460 ?auto_82455 ) ) ( not ( = ?auto_82460 ?auto_82457 ) ) ( not ( = ?auto_82460 ?auto_82456 ) ) ( not ( = ?auto_82460 ?auto_82461 ) ) ( not ( = ?auto_82460 ?auto_82454 ) ) ( not ( = ?auto_82459 ?auto_82455 ) ) ( not ( = ?auto_82459 ?auto_82457 ) ) ( not ( = ?auto_82459 ?auto_82456 ) ) ( not ( = ?auto_82459 ?auto_82461 ) ) ( not ( = ?auto_82459 ?auto_82454 ) ) ( not ( = ?auto_82455 ?auto_82457 ) ) ( not ( = ?auto_82455 ?auto_82456 ) ) ( not ( = ?auto_82455 ?auto_82461 ) ) ( not ( = ?auto_82455 ?auto_82454 ) ) ( not ( = ?auto_82457 ?auto_82456 ) ) ( not ( = ?auto_82457 ?auto_82461 ) ) ( not ( = ?auto_82457 ?auto_82454 ) ) ( not ( = ?auto_82456 ?auto_82461 ) ) ( not ( = ?auto_82456 ?auto_82454 ) ) ( ON ?auto_82454 ?auto_82458 ) ( not ( = ?auto_82454 ?auto_82458 ) ) ( not ( = ?auto_82461 ?auto_82458 ) ) ( not ( = ?auto_82460 ?auto_82458 ) ) ( not ( = ?auto_82459 ?auto_82458 ) ) ( not ( = ?auto_82455 ?auto_82458 ) ) ( not ( = ?auto_82457 ?auto_82458 ) ) ( not ( = ?auto_82456 ?auto_82458 ) ) ( ON ?auto_82461 ?auto_82454 ) ( ON-TABLE ?auto_82458 ) ( ON ?auto_82456 ?auto_82461 ) ( ON ?auto_82457 ?auto_82456 ) ( ON ?auto_82455 ?auto_82457 ) ( CLEAR ?auto_82460 ) ( ON ?auto_82459 ?auto_82455 ) ( CLEAR ?auto_82459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82458 ?auto_82454 ?auto_82461 ?auto_82456 ?auto_82457 ?auto_82455 )
      ( MAKE-1PILE ?auto_82454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82462 - BLOCK
    )
    :vars
    (
      ?auto_82464 - BLOCK
      ?auto_82465 - BLOCK
      ?auto_82463 - BLOCK
      ?auto_82466 - BLOCK
      ?auto_82468 - BLOCK
      ?auto_82469 - BLOCK
      ?auto_82467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82462 ?auto_82464 ) ) ( not ( = ?auto_82465 ?auto_82463 ) ) ( not ( = ?auto_82465 ?auto_82466 ) ) ( not ( = ?auto_82465 ?auto_82468 ) ) ( not ( = ?auto_82465 ?auto_82469 ) ) ( not ( = ?auto_82465 ?auto_82464 ) ) ( not ( = ?auto_82465 ?auto_82462 ) ) ( not ( = ?auto_82463 ?auto_82466 ) ) ( not ( = ?auto_82463 ?auto_82468 ) ) ( not ( = ?auto_82463 ?auto_82469 ) ) ( not ( = ?auto_82463 ?auto_82464 ) ) ( not ( = ?auto_82463 ?auto_82462 ) ) ( not ( = ?auto_82466 ?auto_82468 ) ) ( not ( = ?auto_82466 ?auto_82469 ) ) ( not ( = ?auto_82466 ?auto_82464 ) ) ( not ( = ?auto_82466 ?auto_82462 ) ) ( not ( = ?auto_82468 ?auto_82469 ) ) ( not ( = ?auto_82468 ?auto_82464 ) ) ( not ( = ?auto_82468 ?auto_82462 ) ) ( not ( = ?auto_82469 ?auto_82464 ) ) ( not ( = ?auto_82469 ?auto_82462 ) ) ( ON ?auto_82462 ?auto_82467 ) ( not ( = ?auto_82462 ?auto_82467 ) ) ( not ( = ?auto_82464 ?auto_82467 ) ) ( not ( = ?auto_82465 ?auto_82467 ) ) ( not ( = ?auto_82463 ?auto_82467 ) ) ( not ( = ?auto_82466 ?auto_82467 ) ) ( not ( = ?auto_82468 ?auto_82467 ) ) ( not ( = ?auto_82469 ?auto_82467 ) ) ( ON ?auto_82464 ?auto_82462 ) ( ON-TABLE ?auto_82467 ) ( ON ?auto_82469 ?auto_82464 ) ( ON ?auto_82468 ?auto_82469 ) ( ON ?auto_82466 ?auto_82468 ) ( ON ?auto_82463 ?auto_82466 ) ( CLEAR ?auto_82463 ) ( HOLDING ?auto_82465 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82465 )
      ( MAKE-1PILE ?auto_82462 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_82470 - BLOCK
    )
    :vars
    (
      ?auto_82476 - BLOCK
      ?auto_82471 - BLOCK
      ?auto_82474 - BLOCK
      ?auto_82472 - BLOCK
      ?auto_82473 - BLOCK
      ?auto_82475 - BLOCK
      ?auto_82477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82470 ?auto_82476 ) ) ( not ( = ?auto_82471 ?auto_82474 ) ) ( not ( = ?auto_82471 ?auto_82472 ) ) ( not ( = ?auto_82471 ?auto_82473 ) ) ( not ( = ?auto_82471 ?auto_82475 ) ) ( not ( = ?auto_82471 ?auto_82476 ) ) ( not ( = ?auto_82471 ?auto_82470 ) ) ( not ( = ?auto_82474 ?auto_82472 ) ) ( not ( = ?auto_82474 ?auto_82473 ) ) ( not ( = ?auto_82474 ?auto_82475 ) ) ( not ( = ?auto_82474 ?auto_82476 ) ) ( not ( = ?auto_82474 ?auto_82470 ) ) ( not ( = ?auto_82472 ?auto_82473 ) ) ( not ( = ?auto_82472 ?auto_82475 ) ) ( not ( = ?auto_82472 ?auto_82476 ) ) ( not ( = ?auto_82472 ?auto_82470 ) ) ( not ( = ?auto_82473 ?auto_82475 ) ) ( not ( = ?auto_82473 ?auto_82476 ) ) ( not ( = ?auto_82473 ?auto_82470 ) ) ( not ( = ?auto_82475 ?auto_82476 ) ) ( not ( = ?auto_82475 ?auto_82470 ) ) ( ON ?auto_82470 ?auto_82477 ) ( not ( = ?auto_82470 ?auto_82477 ) ) ( not ( = ?auto_82476 ?auto_82477 ) ) ( not ( = ?auto_82471 ?auto_82477 ) ) ( not ( = ?auto_82474 ?auto_82477 ) ) ( not ( = ?auto_82472 ?auto_82477 ) ) ( not ( = ?auto_82473 ?auto_82477 ) ) ( not ( = ?auto_82475 ?auto_82477 ) ) ( ON ?auto_82476 ?auto_82470 ) ( ON-TABLE ?auto_82477 ) ( ON ?auto_82475 ?auto_82476 ) ( ON ?auto_82473 ?auto_82475 ) ( ON ?auto_82472 ?auto_82473 ) ( ON ?auto_82474 ?auto_82472 ) ( ON ?auto_82471 ?auto_82474 ) ( CLEAR ?auto_82471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82477 ?auto_82470 ?auto_82476 ?auto_82475 ?auto_82473 ?auto_82472 ?auto_82474 )
      ( MAKE-1PILE ?auto_82470 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82483 - BLOCK
      ?auto_82484 - BLOCK
      ?auto_82485 - BLOCK
      ?auto_82486 - BLOCK
      ?auto_82487 - BLOCK
    )
    :vars
    (
      ?auto_82488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82488 ?auto_82487 ) ( CLEAR ?auto_82488 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82483 ) ( ON ?auto_82484 ?auto_82483 ) ( ON ?auto_82485 ?auto_82484 ) ( ON ?auto_82486 ?auto_82485 ) ( ON ?auto_82487 ?auto_82486 ) ( not ( = ?auto_82483 ?auto_82484 ) ) ( not ( = ?auto_82483 ?auto_82485 ) ) ( not ( = ?auto_82483 ?auto_82486 ) ) ( not ( = ?auto_82483 ?auto_82487 ) ) ( not ( = ?auto_82483 ?auto_82488 ) ) ( not ( = ?auto_82484 ?auto_82485 ) ) ( not ( = ?auto_82484 ?auto_82486 ) ) ( not ( = ?auto_82484 ?auto_82487 ) ) ( not ( = ?auto_82484 ?auto_82488 ) ) ( not ( = ?auto_82485 ?auto_82486 ) ) ( not ( = ?auto_82485 ?auto_82487 ) ) ( not ( = ?auto_82485 ?auto_82488 ) ) ( not ( = ?auto_82486 ?auto_82487 ) ) ( not ( = ?auto_82486 ?auto_82488 ) ) ( not ( = ?auto_82487 ?auto_82488 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82488 ?auto_82487 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82489 - BLOCK
      ?auto_82490 - BLOCK
      ?auto_82491 - BLOCK
      ?auto_82492 - BLOCK
      ?auto_82493 - BLOCK
    )
    :vars
    (
      ?auto_82494 - BLOCK
      ?auto_82495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82494 ?auto_82493 ) ( CLEAR ?auto_82494 ) ( ON-TABLE ?auto_82489 ) ( ON ?auto_82490 ?auto_82489 ) ( ON ?auto_82491 ?auto_82490 ) ( ON ?auto_82492 ?auto_82491 ) ( ON ?auto_82493 ?auto_82492 ) ( not ( = ?auto_82489 ?auto_82490 ) ) ( not ( = ?auto_82489 ?auto_82491 ) ) ( not ( = ?auto_82489 ?auto_82492 ) ) ( not ( = ?auto_82489 ?auto_82493 ) ) ( not ( = ?auto_82489 ?auto_82494 ) ) ( not ( = ?auto_82490 ?auto_82491 ) ) ( not ( = ?auto_82490 ?auto_82492 ) ) ( not ( = ?auto_82490 ?auto_82493 ) ) ( not ( = ?auto_82490 ?auto_82494 ) ) ( not ( = ?auto_82491 ?auto_82492 ) ) ( not ( = ?auto_82491 ?auto_82493 ) ) ( not ( = ?auto_82491 ?auto_82494 ) ) ( not ( = ?auto_82492 ?auto_82493 ) ) ( not ( = ?auto_82492 ?auto_82494 ) ) ( not ( = ?auto_82493 ?auto_82494 ) ) ( HOLDING ?auto_82495 ) ( not ( = ?auto_82489 ?auto_82495 ) ) ( not ( = ?auto_82490 ?auto_82495 ) ) ( not ( = ?auto_82491 ?auto_82495 ) ) ( not ( = ?auto_82492 ?auto_82495 ) ) ( not ( = ?auto_82493 ?auto_82495 ) ) ( not ( = ?auto_82494 ?auto_82495 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_82495 )
      ( MAKE-5PILE ?auto_82489 ?auto_82490 ?auto_82491 ?auto_82492 ?auto_82493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82496 - BLOCK
      ?auto_82497 - BLOCK
      ?auto_82498 - BLOCK
      ?auto_82499 - BLOCK
      ?auto_82500 - BLOCK
    )
    :vars
    (
      ?auto_82501 - BLOCK
      ?auto_82502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82501 ?auto_82500 ) ( ON-TABLE ?auto_82496 ) ( ON ?auto_82497 ?auto_82496 ) ( ON ?auto_82498 ?auto_82497 ) ( ON ?auto_82499 ?auto_82498 ) ( ON ?auto_82500 ?auto_82499 ) ( not ( = ?auto_82496 ?auto_82497 ) ) ( not ( = ?auto_82496 ?auto_82498 ) ) ( not ( = ?auto_82496 ?auto_82499 ) ) ( not ( = ?auto_82496 ?auto_82500 ) ) ( not ( = ?auto_82496 ?auto_82501 ) ) ( not ( = ?auto_82497 ?auto_82498 ) ) ( not ( = ?auto_82497 ?auto_82499 ) ) ( not ( = ?auto_82497 ?auto_82500 ) ) ( not ( = ?auto_82497 ?auto_82501 ) ) ( not ( = ?auto_82498 ?auto_82499 ) ) ( not ( = ?auto_82498 ?auto_82500 ) ) ( not ( = ?auto_82498 ?auto_82501 ) ) ( not ( = ?auto_82499 ?auto_82500 ) ) ( not ( = ?auto_82499 ?auto_82501 ) ) ( not ( = ?auto_82500 ?auto_82501 ) ) ( not ( = ?auto_82496 ?auto_82502 ) ) ( not ( = ?auto_82497 ?auto_82502 ) ) ( not ( = ?auto_82498 ?auto_82502 ) ) ( not ( = ?auto_82499 ?auto_82502 ) ) ( not ( = ?auto_82500 ?auto_82502 ) ) ( not ( = ?auto_82501 ?auto_82502 ) ) ( ON ?auto_82502 ?auto_82501 ) ( CLEAR ?auto_82502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82496 ?auto_82497 ?auto_82498 ?auto_82499 ?auto_82500 ?auto_82501 )
      ( MAKE-5PILE ?auto_82496 ?auto_82497 ?auto_82498 ?auto_82499 ?auto_82500 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82503 - BLOCK
      ?auto_82504 - BLOCK
      ?auto_82505 - BLOCK
      ?auto_82506 - BLOCK
      ?auto_82507 - BLOCK
    )
    :vars
    (
      ?auto_82508 - BLOCK
      ?auto_82509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82508 ?auto_82507 ) ( ON-TABLE ?auto_82503 ) ( ON ?auto_82504 ?auto_82503 ) ( ON ?auto_82505 ?auto_82504 ) ( ON ?auto_82506 ?auto_82505 ) ( ON ?auto_82507 ?auto_82506 ) ( not ( = ?auto_82503 ?auto_82504 ) ) ( not ( = ?auto_82503 ?auto_82505 ) ) ( not ( = ?auto_82503 ?auto_82506 ) ) ( not ( = ?auto_82503 ?auto_82507 ) ) ( not ( = ?auto_82503 ?auto_82508 ) ) ( not ( = ?auto_82504 ?auto_82505 ) ) ( not ( = ?auto_82504 ?auto_82506 ) ) ( not ( = ?auto_82504 ?auto_82507 ) ) ( not ( = ?auto_82504 ?auto_82508 ) ) ( not ( = ?auto_82505 ?auto_82506 ) ) ( not ( = ?auto_82505 ?auto_82507 ) ) ( not ( = ?auto_82505 ?auto_82508 ) ) ( not ( = ?auto_82506 ?auto_82507 ) ) ( not ( = ?auto_82506 ?auto_82508 ) ) ( not ( = ?auto_82507 ?auto_82508 ) ) ( not ( = ?auto_82503 ?auto_82509 ) ) ( not ( = ?auto_82504 ?auto_82509 ) ) ( not ( = ?auto_82505 ?auto_82509 ) ) ( not ( = ?auto_82506 ?auto_82509 ) ) ( not ( = ?auto_82507 ?auto_82509 ) ) ( not ( = ?auto_82508 ?auto_82509 ) ) ( HOLDING ?auto_82509 ) ( CLEAR ?auto_82508 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82503 ?auto_82504 ?auto_82505 ?auto_82506 ?auto_82507 ?auto_82508 ?auto_82509 )
      ( MAKE-5PILE ?auto_82503 ?auto_82504 ?auto_82505 ?auto_82506 ?auto_82507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82510 - BLOCK
      ?auto_82511 - BLOCK
      ?auto_82512 - BLOCK
      ?auto_82513 - BLOCK
      ?auto_82514 - BLOCK
    )
    :vars
    (
      ?auto_82515 - BLOCK
      ?auto_82516 - BLOCK
      ?auto_82517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82515 ?auto_82514 ) ( ON-TABLE ?auto_82510 ) ( ON ?auto_82511 ?auto_82510 ) ( ON ?auto_82512 ?auto_82511 ) ( ON ?auto_82513 ?auto_82512 ) ( ON ?auto_82514 ?auto_82513 ) ( not ( = ?auto_82510 ?auto_82511 ) ) ( not ( = ?auto_82510 ?auto_82512 ) ) ( not ( = ?auto_82510 ?auto_82513 ) ) ( not ( = ?auto_82510 ?auto_82514 ) ) ( not ( = ?auto_82510 ?auto_82515 ) ) ( not ( = ?auto_82511 ?auto_82512 ) ) ( not ( = ?auto_82511 ?auto_82513 ) ) ( not ( = ?auto_82511 ?auto_82514 ) ) ( not ( = ?auto_82511 ?auto_82515 ) ) ( not ( = ?auto_82512 ?auto_82513 ) ) ( not ( = ?auto_82512 ?auto_82514 ) ) ( not ( = ?auto_82512 ?auto_82515 ) ) ( not ( = ?auto_82513 ?auto_82514 ) ) ( not ( = ?auto_82513 ?auto_82515 ) ) ( not ( = ?auto_82514 ?auto_82515 ) ) ( not ( = ?auto_82510 ?auto_82516 ) ) ( not ( = ?auto_82511 ?auto_82516 ) ) ( not ( = ?auto_82512 ?auto_82516 ) ) ( not ( = ?auto_82513 ?auto_82516 ) ) ( not ( = ?auto_82514 ?auto_82516 ) ) ( not ( = ?auto_82515 ?auto_82516 ) ) ( CLEAR ?auto_82515 ) ( ON ?auto_82516 ?auto_82517 ) ( CLEAR ?auto_82516 ) ( HAND-EMPTY ) ( not ( = ?auto_82510 ?auto_82517 ) ) ( not ( = ?auto_82511 ?auto_82517 ) ) ( not ( = ?auto_82512 ?auto_82517 ) ) ( not ( = ?auto_82513 ?auto_82517 ) ) ( not ( = ?auto_82514 ?auto_82517 ) ) ( not ( = ?auto_82515 ?auto_82517 ) ) ( not ( = ?auto_82516 ?auto_82517 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82516 ?auto_82517 )
      ( MAKE-5PILE ?auto_82510 ?auto_82511 ?auto_82512 ?auto_82513 ?auto_82514 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82534 - BLOCK
      ?auto_82535 - BLOCK
      ?auto_82536 - BLOCK
      ?auto_82537 - BLOCK
      ?auto_82538 - BLOCK
    )
    :vars
    (
      ?auto_82540 - BLOCK
      ?auto_82539 - BLOCK
      ?auto_82541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82534 ) ( ON ?auto_82535 ?auto_82534 ) ( ON ?auto_82536 ?auto_82535 ) ( ON ?auto_82537 ?auto_82536 ) ( not ( = ?auto_82534 ?auto_82535 ) ) ( not ( = ?auto_82534 ?auto_82536 ) ) ( not ( = ?auto_82534 ?auto_82537 ) ) ( not ( = ?auto_82534 ?auto_82538 ) ) ( not ( = ?auto_82534 ?auto_82540 ) ) ( not ( = ?auto_82535 ?auto_82536 ) ) ( not ( = ?auto_82535 ?auto_82537 ) ) ( not ( = ?auto_82535 ?auto_82538 ) ) ( not ( = ?auto_82535 ?auto_82540 ) ) ( not ( = ?auto_82536 ?auto_82537 ) ) ( not ( = ?auto_82536 ?auto_82538 ) ) ( not ( = ?auto_82536 ?auto_82540 ) ) ( not ( = ?auto_82537 ?auto_82538 ) ) ( not ( = ?auto_82537 ?auto_82540 ) ) ( not ( = ?auto_82538 ?auto_82540 ) ) ( not ( = ?auto_82534 ?auto_82539 ) ) ( not ( = ?auto_82535 ?auto_82539 ) ) ( not ( = ?auto_82536 ?auto_82539 ) ) ( not ( = ?auto_82537 ?auto_82539 ) ) ( not ( = ?auto_82538 ?auto_82539 ) ) ( not ( = ?auto_82540 ?auto_82539 ) ) ( ON ?auto_82539 ?auto_82541 ) ( not ( = ?auto_82534 ?auto_82541 ) ) ( not ( = ?auto_82535 ?auto_82541 ) ) ( not ( = ?auto_82536 ?auto_82541 ) ) ( not ( = ?auto_82537 ?auto_82541 ) ) ( not ( = ?auto_82538 ?auto_82541 ) ) ( not ( = ?auto_82540 ?auto_82541 ) ) ( not ( = ?auto_82539 ?auto_82541 ) ) ( ON ?auto_82540 ?auto_82539 ) ( CLEAR ?auto_82540 ) ( HOLDING ?auto_82538 ) ( CLEAR ?auto_82537 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82534 ?auto_82535 ?auto_82536 ?auto_82537 ?auto_82538 ?auto_82540 )
      ( MAKE-5PILE ?auto_82534 ?auto_82535 ?auto_82536 ?auto_82537 ?auto_82538 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82542 - BLOCK
      ?auto_82543 - BLOCK
      ?auto_82544 - BLOCK
      ?auto_82545 - BLOCK
      ?auto_82546 - BLOCK
    )
    :vars
    (
      ?auto_82548 - BLOCK
      ?auto_82549 - BLOCK
      ?auto_82547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82542 ) ( ON ?auto_82543 ?auto_82542 ) ( ON ?auto_82544 ?auto_82543 ) ( ON ?auto_82545 ?auto_82544 ) ( not ( = ?auto_82542 ?auto_82543 ) ) ( not ( = ?auto_82542 ?auto_82544 ) ) ( not ( = ?auto_82542 ?auto_82545 ) ) ( not ( = ?auto_82542 ?auto_82546 ) ) ( not ( = ?auto_82542 ?auto_82548 ) ) ( not ( = ?auto_82543 ?auto_82544 ) ) ( not ( = ?auto_82543 ?auto_82545 ) ) ( not ( = ?auto_82543 ?auto_82546 ) ) ( not ( = ?auto_82543 ?auto_82548 ) ) ( not ( = ?auto_82544 ?auto_82545 ) ) ( not ( = ?auto_82544 ?auto_82546 ) ) ( not ( = ?auto_82544 ?auto_82548 ) ) ( not ( = ?auto_82545 ?auto_82546 ) ) ( not ( = ?auto_82545 ?auto_82548 ) ) ( not ( = ?auto_82546 ?auto_82548 ) ) ( not ( = ?auto_82542 ?auto_82549 ) ) ( not ( = ?auto_82543 ?auto_82549 ) ) ( not ( = ?auto_82544 ?auto_82549 ) ) ( not ( = ?auto_82545 ?auto_82549 ) ) ( not ( = ?auto_82546 ?auto_82549 ) ) ( not ( = ?auto_82548 ?auto_82549 ) ) ( ON ?auto_82549 ?auto_82547 ) ( not ( = ?auto_82542 ?auto_82547 ) ) ( not ( = ?auto_82543 ?auto_82547 ) ) ( not ( = ?auto_82544 ?auto_82547 ) ) ( not ( = ?auto_82545 ?auto_82547 ) ) ( not ( = ?auto_82546 ?auto_82547 ) ) ( not ( = ?auto_82548 ?auto_82547 ) ) ( not ( = ?auto_82549 ?auto_82547 ) ) ( ON ?auto_82548 ?auto_82549 ) ( CLEAR ?auto_82545 ) ( ON ?auto_82546 ?auto_82548 ) ( CLEAR ?auto_82546 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82547 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82547 ?auto_82549 ?auto_82548 )
      ( MAKE-5PILE ?auto_82542 ?auto_82543 ?auto_82544 ?auto_82545 ?auto_82546 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82550 - BLOCK
      ?auto_82551 - BLOCK
      ?auto_82552 - BLOCK
      ?auto_82553 - BLOCK
      ?auto_82554 - BLOCK
    )
    :vars
    (
      ?auto_82555 - BLOCK
      ?auto_82556 - BLOCK
      ?auto_82557 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82550 ) ( ON ?auto_82551 ?auto_82550 ) ( ON ?auto_82552 ?auto_82551 ) ( not ( = ?auto_82550 ?auto_82551 ) ) ( not ( = ?auto_82550 ?auto_82552 ) ) ( not ( = ?auto_82550 ?auto_82553 ) ) ( not ( = ?auto_82550 ?auto_82554 ) ) ( not ( = ?auto_82550 ?auto_82555 ) ) ( not ( = ?auto_82551 ?auto_82552 ) ) ( not ( = ?auto_82551 ?auto_82553 ) ) ( not ( = ?auto_82551 ?auto_82554 ) ) ( not ( = ?auto_82551 ?auto_82555 ) ) ( not ( = ?auto_82552 ?auto_82553 ) ) ( not ( = ?auto_82552 ?auto_82554 ) ) ( not ( = ?auto_82552 ?auto_82555 ) ) ( not ( = ?auto_82553 ?auto_82554 ) ) ( not ( = ?auto_82553 ?auto_82555 ) ) ( not ( = ?auto_82554 ?auto_82555 ) ) ( not ( = ?auto_82550 ?auto_82556 ) ) ( not ( = ?auto_82551 ?auto_82556 ) ) ( not ( = ?auto_82552 ?auto_82556 ) ) ( not ( = ?auto_82553 ?auto_82556 ) ) ( not ( = ?auto_82554 ?auto_82556 ) ) ( not ( = ?auto_82555 ?auto_82556 ) ) ( ON ?auto_82556 ?auto_82557 ) ( not ( = ?auto_82550 ?auto_82557 ) ) ( not ( = ?auto_82551 ?auto_82557 ) ) ( not ( = ?auto_82552 ?auto_82557 ) ) ( not ( = ?auto_82553 ?auto_82557 ) ) ( not ( = ?auto_82554 ?auto_82557 ) ) ( not ( = ?auto_82555 ?auto_82557 ) ) ( not ( = ?auto_82556 ?auto_82557 ) ) ( ON ?auto_82555 ?auto_82556 ) ( ON ?auto_82554 ?auto_82555 ) ( CLEAR ?auto_82554 ) ( ON-TABLE ?auto_82557 ) ( HOLDING ?auto_82553 ) ( CLEAR ?auto_82552 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82550 ?auto_82551 ?auto_82552 ?auto_82553 )
      ( MAKE-5PILE ?auto_82550 ?auto_82551 ?auto_82552 ?auto_82553 ?auto_82554 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82558 - BLOCK
      ?auto_82559 - BLOCK
      ?auto_82560 - BLOCK
      ?auto_82561 - BLOCK
      ?auto_82562 - BLOCK
    )
    :vars
    (
      ?auto_82565 - BLOCK
      ?auto_82564 - BLOCK
      ?auto_82563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82558 ) ( ON ?auto_82559 ?auto_82558 ) ( ON ?auto_82560 ?auto_82559 ) ( not ( = ?auto_82558 ?auto_82559 ) ) ( not ( = ?auto_82558 ?auto_82560 ) ) ( not ( = ?auto_82558 ?auto_82561 ) ) ( not ( = ?auto_82558 ?auto_82562 ) ) ( not ( = ?auto_82558 ?auto_82565 ) ) ( not ( = ?auto_82559 ?auto_82560 ) ) ( not ( = ?auto_82559 ?auto_82561 ) ) ( not ( = ?auto_82559 ?auto_82562 ) ) ( not ( = ?auto_82559 ?auto_82565 ) ) ( not ( = ?auto_82560 ?auto_82561 ) ) ( not ( = ?auto_82560 ?auto_82562 ) ) ( not ( = ?auto_82560 ?auto_82565 ) ) ( not ( = ?auto_82561 ?auto_82562 ) ) ( not ( = ?auto_82561 ?auto_82565 ) ) ( not ( = ?auto_82562 ?auto_82565 ) ) ( not ( = ?auto_82558 ?auto_82564 ) ) ( not ( = ?auto_82559 ?auto_82564 ) ) ( not ( = ?auto_82560 ?auto_82564 ) ) ( not ( = ?auto_82561 ?auto_82564 ) ) ( not ( = ?auto_82562 ?auto_82564 ) ) ( not ( = ?auto_82565 ?auto_82564 ) ) ( ON ?auto_82564 ?auto_82563 ) ( not ( = ?auto_82558 ?auto_82563 ) ) ( not ( = ?auto_82559 ?auto_82563 ) ) ( not ( = ?auto_82560 ?auto_82563 ) ) ( not ( = ?auto_82561 ?auto_82563 ) ) ( not ( = ?auto_82562 ?auto_82563 ) ) ( not ( = ?auto_82565 ?auto_82563 ) ) ( not ( = ?auto_82564 ?auto_82563 ) ) ( ON ?auto_82565 ?auto_82564 ) ( ON ?auto_82562 ?auto_82565 ) ( ON-TABLE ?auto_82563 ) ( CLEAR ?auto_82560 ) ( ON ?auto_82561 ?auto_82562 ) ( CLEAR ?auto_82561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82563 ?auto_82564 ?auto_82565 ?auto_82562 )
      ( MAKE-5PILE ?auto_82558 ?auto_82559 ?auto_82560 ?auto_82561 ?auto_82562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82566 - BLOCK
      ?auto_82567 - BLOCK
      ?auto_82568 - BLOCK
      ?auto_82569 - BLOCK
      ?auto_82570 - BLOCK
    )
    :vars
    (
      ?auto_82573 - BLOCK
      ?auto_82572 - BLOCK
      ?auto_82571 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82566 ) ( ON ?auto_82567 ?auto_82566 ) ( not ( = ?auto_82566 ?auto_82567 ) ) ( not ( = ?auto_82566 ?auto_82568 ) ) ( not ( = ?auto_82566 ?auto_82569 ) ) ( not ( = ?auto_82566 ?auto_82570 ) ) ( not ( = ?auto_82566 ?auto_82573 ) ) ( not ( = ?auto_82567 ?auto_82568 ) ) ( not ( = ?auto_82567 ?auto_82569 ) ) ( not ( = ?auto_82567 ?auto_82570 ) ) ( not ( = ?auto_82567 ?auto_82573 ) ) ( not ( = ?auto_82568 ?auto_82569 ) ) ( not ( = ?auto_82568 ?auto_82570 ) ) ( not ( = ?auto_82568 ?auto_82573 ) ) ( not ( = ?auto_82569 ?auto_82570 ) ) ( not ( = ?auto_82569 ?auto_82573 ) ) ( not ( = ?auto_82570 ?auto_82573 ) ) ( not ( = ?auto_82566 ?auto_82572 ) ) ( not ( = ?auto_82567 ?auto_82572 ) ) ( not ( = ?auto_82568 ?auto_82572 ) ) ( not ( = ?auto_82569 ?auto_82572 ) ) ( not ( = ?auto_82570 ?auto_82572 ) ) ( not ( = ?auto_82573 ?auto_82572 ) ) ( ON ?auto_82572 ?auto_82571 ) ( not ( = ?auto_82566 ?auto_82571 ) ) ( not ( = ?auto_82567 ?auto_82571 ) ) ( not ( = ?auto_82568 ?auto_82571 ) ) ( not ( = ?auto_82569 ?auto_82571 ) ) ( not ( = ?auto_82570 ?auto_82571 ) ) ( not ( = ?auto_82573 ?auto_82571 ) ) ( not ( = ?auto_82572 ?auto_82571 ) ) ( ON ?auto_82573 ?auto_82572 ) ( ON ?auto_82570 ?auto_82573 ) ( ON-TABLE ?auto_82571 ) ( ON ?auto_82569 ?auto_82570 ) ( CLEAR ?auto_82569 ) ( HOLDING ?auto_82568 ) ( CLEAR ?auto_82567 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82566 ?auto_82567 ?auto_82568 )
      ( MAKE-5PILE ?auto_82566 ?auto_82567 ?auto_82568 ?auto_82569 ?auto_82570 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82574 - BLOCK
      ?auto_82575 - BLOCK
      ?auto_82576 - BLOCK
      ?auto_82577 - BLOCK
      ?auto_82578 - BLOCK
    )
    :vars
    (
      ?auto_82580 - BLOCK
      ?auto_82579 - BLOCK
      ?auto_82581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82574 ) ( ON ?auto_82575 ?auto_82574 ) ( not ( = ?auto_82574 ?auto_82575 ) ) ( not ( = ?auto_82574 ?auto_82576 ) ) ( not ( = ?auto_82574 ?auto_82577 ) ) ( not ( = ?auto_82574 ?auto_82578 ) ) ( not ( = ?auto_82574 ?auto_82580 ) ) ( not ( = ?auto_82575 ?auto_82576 ) ) ( not ( = ?auto_82575 ?auto_82577 ) ) ( not ( = ?auto_82575 ?auto_82578 ) ) ( not ( = ?auto_82575 ?auto_82580 ) ) ( not ( = ?auto_82576 ?auto_82577 ) ) ( not ( = ?auto_82576 ?auto_82578 ) ) ( not ( = ?auto_82576 ?auto_82580 ) ) ( not ( = ?auto_82577 ?auto_82578 ) ) ( not ( = ?auto_82577 ?auto_82580 ) ) ( not ( = ?auto_82578 ?auto_82580 ) ) ( not ( = ?auto_82574 ?auto_82579 ) ) ( not ( = ?auto_82575 ?auto_82579 ) ) ( not ( = ?auto_82576 ?auto_82579 ) ) ( not ( = ?auto_82577 ?auto_82579 ) ) ( not ( = ?auto_82578 ?auto_82579 ) ) ( not ( = ?auto_82580 ?auto_82579 ) ) ( ON ?auto_82579 ?auto_82581 ) ( not ( = ?auto_82574 ?auto_82581 ) ) ( not ( = ?auto_82575 ?auto_82581 ) ) ( not ( = ?auto_82576 ?auto_82581 ) ) ( not ( = ?auto_82577 ?auto_82581 ) ) ( not ( = ?auto_82578 ?auto_82581 ) ) ( not ( = ?auto_82580 ?auto_82581 ) ) ( not ( = ?auto_82579 ?auto_82581 ) ) ( ON ?auto_82580 ?auto_82579 ) ( ON ?auto_82578 ?auto_82580 ) ( ON-TABLE ?auto_82581 ) ( ON ?auto_82577 ?auto_82578 ) ( CLEAR ?auto_82575 ) ( ON ?auto_82576 ?auto_82577 ) ( CLEAR ?auto_82576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82581 ?auto_82579 ?auto_82580 ?auto_82578 ?auto_82577 )
      ( MAKE-5PILE ?auto_82574 ?auto_82575 ?auto_82576 ?auto_82577 ?auto_82578 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82582 - BLOCK
      ?auto_82583 - BLOCK
      ?auto_82584 - BLOCK
      ?auto_82585 - BLOCK
      ?auto_82586 - BLOCK
    )
    :vars
    (
      ?auto_82588 - BLOCK
      ?auto_82589 - BLOCK
      ?auto_82587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82582 ) ( not ( = ?auto_82582 ?auto_82583 ) ) ( not ( = ?auto_82582 ?auto_82584 ) ) ( not ( = ?auto_82582 ?auto_82585 ) ) ( not ( = ?auto_82582 ?auto_82586 ) ) ( not ( = ?auto_82582 ?auto_82588 ) ) ( not ( = ?auto_82583 ?auto_82584 ) ) ( not ( = ?auto_82583 ?auto_82585 ) ) ( not ( = ?auto_82583 ?auto_82586 ) ) ( not ( = ?auto_82583 ?auto_82588 ) ) ( not ( = ?auto_82584 ?auto_82585 ) ) ( not ( = ?auto_82584 ?auto_82586 ) ) ( not ( = ?auto_82584 ?auto_82588 ) ) ( not ( = ?auto_82585 ?auto_82586 ) ) ( not ( = ?auto_82585 ?auto_82588 ) ) ( not ( = ?auto_82586 ?auto_82588 ) ) ( not ( = ?auto_82582 ?auto_82589 ) ) ( not ( = ?auto_82583 ?auto_82589 ) ) ( not ( = ?auto_82584 ?auto_82589 ) ) ( not ( = ?auto_82585 ?auto_82589 ) ) ( not ( = ?auto_82586 ?auto_82589 ) ) ( not ( = ?auto_82588 ?auto_82589 ) ) ( ON ?auto_82589 ?auto_82587 ) ( not ( = ?auto_82582 ?auto_82587 ) ) ( not ( = ?auto_82583 ?auto_82587 ) ) ( not ( = ?auto_82584 ?auto_82587 ) ) ( not ( = ?auto_82585 ?auto_82587 ) ) ( not ( = ?auto_82586 ?auto_82587 ) ) ( not ( = ?auto_82588 ?auto_82587 ) ) ( not ( = ?auto_82589 ?auto_82587 ) ) ( ON ?auto_82588 ?auto_82589 ) ( ON ?auto_82586 ?auto_82588 ) ( ON-TABLE ?auto_82587 ) ( ON ?auto_82585 ?auto_82586 ) ( ON ?auto_82584 ?auto_82585 ) ( CLEAR ?auto_82584 ) ( HOLDING ?auto_82583 ) ( CLEAR ?auto_82582 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82582 ?auto_82583 )
      ( MAKE-5PILE ?auto_82582 ?auto_82583 ?auto_82584 ?auto_82585 ?auto_82586 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82590 - BLOCK
      ?auto_82591 - BLOCK
      ?auto_82592 - BLOCK
      ?auto_82593 - BLOCK
      ?auto_82594 - BLOCK
    )
    :vars
    (
      ?auto_82596 - BLOCK
      ?auto_82597 - BLOCK
      ?auto_82595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82590 ) ( not ( = ?auto_82590 ?auto_82591 ) ) ( not ( = ?auto_82590 ?auto_82592 ) ) ( not ( = ?auto_82590 ?auto_82593 ) ) ( not ( = ?auto_82590 ?auto_82594 ) ) ( not ( = ?auto_82590 ?auto_82596 ) ) ( not ( = ?auto_82591 ?auto_82592 ) ) ( not ( = ?auto_82591 ?auto_82593 ) ) ( not ( = ?auto_82591 ?auto_82594 ) ) ( not ( = ?auto_82591 ?auto_82596 ) ) ( not ( = ?auto_82592 ?auto_82593 ) ) ( not ( = ?auto_82592 ?auto_82594 ) ) ( not ( = ?auto_82592 ?auto_82596 ) ) ( not ( = ?auto_82593 ?auto_82594 ) ) ( not ( = ?auto_82593 ?auto_82596 ) ) ( not ( = ?auto_82594 ?auto_82596 ) ) ( not ( = ?auto_82590 ?auto_82597 ) ) ( not ( = ?auto_82591 ?auto_82597 ) ) ( not ( = ?auto_82592 ?auto_82597 ) ) ( not ( = ?auto_82593 ?auto_82597 ) ) ( not ( = ?auto_82594 ?auto_82597 ) ) ( not ( = ?auto_82596 ?auto_82597 ) ) ( ON ?auto_82597 ?auto_82595 ) ( not ( = ?auto_82590 ?auto_82595 ) ) ( not ( = ?auto_82591 ?auto_82595 ) ) ( not ( = ?auto_82592 ?auto_82595 ) ) ( not ( = ?auto_82593 ?auto_82595 ) ) ( not ( = ?auto_82594 ?auto_82595 ) ) ( not ( = ?auto_82596 ?auto_82595 ) ) ( not ( = ?auto_82597 ?auto_82595 ) ) ( ON ?auto_82596 ?auto_82597 ) ( ON ?auto_82594 ?auto_82596 ) ( ON-TABLE ?auto_82595 ) ( ON ?auto_82593 ?auto_82594 ) ( ON ?auto_82592 ?auto_82593 ) ( CLEAR ?auto_82590 ) ( ON ?auto_82591 ?auto_82592 ) ( CLEAR ?auto_82591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82595 ?auto_82597 ?auto_82596 ?auto_82594 ?auto_82593 ?auto_82592 )
      ( MAKE-5PILE ?auto_82590 ?auto_82591 ?auto_82592 ?auto_82593 ?auto_82594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82598 - BLOCK
      ?auto_82599 - BLOCK
      ?auto_82600 - BLOCK
      ?auto_82601 - BLOCK
      ?auto_82602 - BLOCK
    )
    :vars
    (
      ?auto_82605 - BLOCK
      ?auto_82603 - BLOCK
      ?auto_82604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82598 ?auto_82599 ) ) ( not ( = ?auto_82598 ?auto_82600 ) ) ( not ( = ?auto_82598 ?auto_82601 ) ) ( not ( = ?auto_82598 ?auto_82602 ) ) ( not ( = ?auto_82598 ?auto_82605 ) ) ( not ( = ?auto_82599 ?auto_82600 ) ) ( not ( = ?auto_82599 ?auto_82601 ) ) ( not ( = ?auto_82599 ?auto_82602 ) ) ( not ( = ?auto_82599 ?auto_82605 ) ) ( not ( = ?auto_82600 ?auto_82601 ) ) ( not ( = ?auto_82600 ?auto_82602 ) ) ( not ( = ?auto_82600 ?auto_82605 ) ) ( not ( = ?auto_82601 ?auto_82602 ) ) ( not ( = ?auto_82601 ?auto_82605 ) ) ( not ( = ?auto_82602 ?auto_82605 ) ) ( not ( = ?auto_82598 ?auto_82603 ) ) ( not ( = ?auto_82599 ?auto_82603 ) ) ( not ( = ?auto_82600 ?auto_82603 ) ) ( not ( = ?auto_82601 ?auto_82603 ) ) ( not ( = ?auto_82602 ?auto_82603 ) ) ( not ( = ?auto_82605 ?auto_82603 ) ) ( ON ?auto_82603 ?auto_82604 ) ( not ( = ?auto_82598 ?auto_82604 ) ) ( not ( = ?auto_82599 ?auto_82604 ) ) ( not ( = ?auto_82600 ?auto_82604 ) ) ( not ( = ?auto_82601 ?auto_82604 ) ) ( not ( = ?auto_82602 ?auto_82604 ) ) ( not ( = ?auto_82605 ?auto_82604 ) ) ( not ( = ?auto_82603 ?auto_82604 ) ) ( ON ?auto_82605 ?auto_82603 ) ( ON ?auto_82602 ?auto_82605 ) ( ON-TABLE ?auto_82604 ) ( ON ?auto_82601 ?auto_82602 ) ( ON ?auto_82600 ?auto_82601 ) ( ON ?auto_82599 ?auto_82600 ) ( CLEAR ?auto_82599 ) ( HOLDING ?auto_82598 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82598 )
      ( MAKE-5PILE ?auto_82598 ?auto_82599 ?auto_82600 ?auto_82601 ?auto_82602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_82606 - BLOCK
      ?auto_82607 - BLOCK
      ?auto_82608 - BLOCK
      ?auto_82609 - BLOCK
      ?auto_82610 - BLOCK
    )
    :vars
    (
      ?auto_82613 - BLOCK
      ?auto_82612 - BLOCK
      ?auto_82611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82606 ?auto_82607 ) ) ( not ( = ?auto_82606 ?auto_82608 ) ) ( not ( = ?auto_82606 ?auto_82609 ) ) ( not ( = ?auto_82606 ?auto_82610 ) ) ( not ( = ?auto_82606 ?auto_82613 ) ) ( not ( = ?auto_82607 ?auto_82608 ) ) ( not ( = ?auto_82607 ?auto_82609 ) ) ( not ( = ?auto_82607 ?auto_82610 ) ) ( not ( = ?auto_82607 ?auto_82613 ) ) ( not ( = ?auto_82608 ?auto_82609 ) ) ( not ( = ?auto_82608 ?auto_82610 ) ) ( not ( = ?auto_82608 ?auto_82613 ) ) ( not ( = ?auto_82609 ?auto_82610 ) ) ( not ( = ?auto_82609 ?auto_82613 ) ) ( not ( = ?auto_82610 ?auto_82613 ) ) ( not ( = ?auto_82606 ?auto_82612 ) ) ( not ( = ?auto_82607 ?auto_82612 ) ) ( not ( = ?auto_82608 ?auto_82612 ) ) ( not ( = ?auto_82609 ?auto_82612 ) ) ( not ( = ?auto_82610 ?auto_82612 ) ) ( not ( = ?auto_82613 ?auto_82612 ) ) ( ON ?auto_82612 ?auto_82611 ) ( not ( = ?auto_82606 ?auto_82611 ) ) ( not ( = ?auto_82607 ?auto_82611 ) ) ( not ( = ?auto_82608 ?auto_82611 ) ) ( not ( = ?auto_82609 ?auto_82611 ) ) ( not ( = ?auto_82610 ?auto_82611 ) ) ( not ( = ?auto_82613 ?auto_82611 ) ) ( not ( = ?auto_82612 ?auto_82611 ) ) ( ON ?auto_82613 ?auto_82612 ) ( ON ?auto_82610 ?auto_82613 ) ( ON-TABLE ?auto_82611 ) ( ON ?auto_82609 ?auto_82610 ) ( ON ?auto_82608 ?auto_82609 ) ( ON ?auto_82607 ?auto_82608 ) ( ON ?auto_82606 ?auto_82607 ) ( CLEAR ?auto_82606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82611 ?auto_82612 ?auto_82613 ?auto_82610 ?auto_82609 ?auto_82608 ?auto_82607 )
      ( MAKE-5PILE ?auto_82606 ?auto_82607 ?auto_82608 ?auto_82609 ?auto_82610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82616 - BLOCK
      ?auto_82617 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_82617 ) ( CLEAR ?auto_82616 ) ( ON-TABLE ?auto_82616 ) ( not ( = ?auto_82616 ?auto_82617 ) ) )
    :subtasks
    ( ( !STACK ?auto_82617 ?auto_82616 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82618 - BLOCK
      ?auto_82619 - BLOCK
    )
    :vars
    (
      ?auto_82620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82618 ) ( ON-TABLE ?auto_82618 ) ( not ( = ?auto_82618 ?auto_82619 ) ) ( ON ?auto_82619 ?auto_82620 ) ( CLEAR ?auto_82619 ) ( HAND-EMPTY ) ( not ( = ?auto_82618 ?auto_82620 ) ) ( not ( = ?auto_82619 ?auto_82620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82619 ?auto_82620 )
      ( MAKE-2PILE ?auto_82618 ?auto_82619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82621 - BLOCK
      ?auto_82622 - BLOCK
    )
    :vars
    (
      ?auto_82623 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82621 ?auto_82622 ) ) ( ON ?auto_82622 ?auto_82623 ) ( CLEAR ?auto_82622 ) ( not ( = ?auto_82621 ?auto_82623 ) ) ( not ( = ?auto_82622 ?auto_82623 ) ) ( HOLDING ?auto_82621 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82621 )
      ( MAKE-2PILE ?auto_82621 ?auto_82622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82624 - BLOCK
      ?auto_82625 - BLOCK
    )
    :vars
    (
      ?auto_82626 - BLOCK
      ?auto_82630 - BLOCK
      ?auto_82628 - BLOCK
      ?auto_82627 - BLOCK
      ?auto_82629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82624 ?auto_82625 ) ) ( ON ?auto_82625 ?auto_82626 ) ( not ( = ?auto_82624 ?auto_82626 ) ) ( not ( = ?auto_82625 ?auto_82626 ) ) ( ON ?auto_82624 ?auto_82625 ) ( CLEAR ?auto_82624 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82630 ) ( ON ?auto_82628 ?auto_82630 ) ( ON ?auto_82627 ?auto_82628 ) ( ON ?auto_82629 ?auto_82627 ) ( ON ?auto_82626 ?auto_82629 ) ( not ( = ?auto_82630 ?auto_82628 ) ) ( not ( = ?auto_82630 ?auto_82627 ) ) ( not ( = ?auto_82630 ?auto_82629 ) ) ( not ( = ?auto_82630 ?auto_82626 ) ) ( not ( = ?auto_82630 ?auto_82625 ) ) ( not ( = ?auto_82630 ?auto_82624 ) ) ( not ( = ?auto_82628 ?auto_82627 ) ) ( not ( = ?auto_82628 ?auto_82629 ) ) ( not ( = ?auto_82628 ?auto_82626 ) ) ( not ( = ?auto_82628 ?auto_82625 ) ) ( not ( = ?auto_82628 ?auto_82624 ) ) ( not ( = ?auto_82627 ?auto_82629 ) ) ( not ( = ?auto_82627 ?auto_82626 ) ) ( not ( = ?auto_82627 ?auto_82625 ) ) ( not ( = ?auto_82627 ?auto_82624 ) ) ( not ( = ?auto_82629 ?auto_82626 ) ) ( not ( = ?auto_82629 ?auto_82625 ) ) ( not ( = ?auto_82629 ?auto_82624 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82630 ?auto_82628 ?auto_82627 ?auto_82629 ?auto_82626 ?auto_82625 )
      ( MAKE-2PILE ?auto_82624 ?auto_82625 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82631 - BLOCK
      ?auto_82632 - BLOCK
    )
    :vars
    (
      ?auto_82634 - BLOCK
      ?auto_82635 - BLOCK
      ?auto_82633 - BLOCK
      ?auto_82637 - BLOCK
      ?auto_82636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82631 ?auto_82632 ) ) ( ON ?auto_82632 ?auto_82634 ) ( not ( = ?auto_82631 ?auto_82634 ) ) ( not ( = ?auto_82632 ?auto_82634 ) ) ( ON-TABLE ?auto_82635 ) ( ON ?auto_82633 ?auto_82635 ) ( ON ?auto_82637 ?auto_82633 ) ( ON ?auto_82636 ?auto_82637 ) ( ON ?auto_82634 ?auto_82636 ) ( not ( = ?auto_82635 ?auto_82633 ) ) ( not ( = ?auto_82635 ?auto_82637 ) ) ( not ( = ?auto_82635 ?auto_82636 ) ) ( not ( = ?auto_82635 ?auto_82634 ) ) ( not ( = ?auto_82635 ?auto_82632 ) ) ( not ( = ?auto_82635 ?auto_82631 ) ) ( not ( = ?auto_82633 ?auto_82637 ) ) ( not ( = ?auto_82633 ?auto_82636 ) ) ( not ( = ?auto_82633 ?auto_82634 ) ) ( not ( = ?auto_82633 ?auto_82632 ) ) ( not ( = ?auto_82633 ?auto_82631 ) ) ( not ( = ?auto_82637 ?auto_82636 ) ) ( not ( = ?auto_82637 ?auto_82634 ) ) ( not ( = ?auto_82637 ?auto_82632 ) ) ( not ( = ?auto_82637 ?auto_82631 ) ) ( not ( = ?auto_82636 ?auto_82634 ) ) ( not ( = ?auto_82636 ?auto_82632 ) ) ( not ( = ?auto_82636 ?auto_82631 ) ) ( HOLDING ?auto_82631 ) ( CLEAR ?auto_82632 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82635 ?auto_82633 ?auto_82637 ?auto_82636 ?auto_82634 ?auto_82632 ?auto_82631 )
      ( MAKE-2PILE ?auto_82631 ?auto_82632 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82638 - BLOCK
      ?auto_82639 - BLOCK
    )
    :vars
    (
      ?auto_82644 - BLOCK
      ?auto_82643 - BLOCK
      ?auto_82642 - BLOCK
      ?auto_82640 - BLOCK
      ?auto_82641 - BLOCK
      ?auto_82645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82638 ?auto_82639 ) ) ( ON ?auto_82639 ?auto_82644 ) ( not ( = ?auto_82638 ?auto_82644 ) ) ( not ( = ?auto_82639 ?auto_82644 ) ) ( ON-TABLE ?auto_82643 ) ( ON ?auto_82642 ?auto_82643 ) ( ON ?auto_82640 ?auto_82642 ) ( ON ?auto_82641 ?auto_82640 ) ( ON ?auto_82644 ?auto_82641 ) ( not ( = ?auto_82643 ?auto_82642 ) ) ( not ( = ?auto_82643 ?auto_82640 ) ) ( not ( = ?auto_82643 ?auto_82641 ) ) ( not ( = ?auto_82643 ?auto_82644 ) ) ( not ( = ?auto_82643 ?auto_82639 ) ) ( not ( = ?auto_82643 ?auto_82638 ) ) ( not ( = ?auto_82642 ?auto_82640 ) ) ( not ( = ?auto_82642 ?auto_82641 ) ) ( not ( = ?auto_82642 ?auto_82644 ) ) ( not ( = ?auto_82642 ?auto_82639 ) ) ( not ( = ?auto_82642 ?auto_82638 ) ) ( not ( = ?auto_82640 ?auto_82641 ) ) ( not ( = ?auto_82640 ?auto_82644 ) ) ( not ( = ?auto_82640 ?auto_82639 ) ) ( not ( = ?auto_82640 ?auto_82638 ) ) ( not ( = ?auto_82641 ?auto_82644 ) ) ( not ( = ?auto_82641 ?auto_82639 ) ) ( not ( = ?auto_82641 ?auto_82638 ) ) ( CLEAR ?auto_82639 ) ( ON ?auto_82638 ?auto_82645 ) ( CLEAR ?auto_82638 ) ( HAND-EMPTY ) ( not ( = ?auto_82638 ?auto_82645 ) ) ( not ( = ?auto_82639 ?auto_82645 ) ) ( not ( = ?auto_82644 ?auto_82645 ) ) ( not ( = ?auto_82643 ?auto_82645 ) ) ( not ( = ?auto_82642 ?auto_82645 ) ) ( not ( = ?auto_82640 ?auto_82645 ) ) ( not ( = ?auto_82641 ?auto_82645 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82638 ?auto_82645 )
      ( MAKE-2PILE ?auto_82638 ?auto_82639 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82646 - BLOCK
      ?auto_82647 - BLOCK
    )
    :vars
    (
      ?auto_82652 - BLOCK
      ?auto_82653 - BLOCK
      ?auto_82649 - BLOCK
      ?auto_82651 - BLOCK
      ?auto_82650 - BLOCK
      ?auto_82648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82646 ?auto_82647 ) ) ( not ( = ?auto_82646 ?auto_82652 ) ) ( not ( = ?auto_82647 ?auto_82652 ) ) ( ON-TABLE ?auto_82653 ) ( ON ?auto_82649 ?auto_82653 ) ( ON ?auto_82651 ?auto_82649 ) ( ON ?auto_82650 ?auto_82651 ) ( ON ?auto_82652 ?auto_82650 ) ( not ( = ?auto_82653 ?auto_82649 ) ) ( not ( = ?auto_82653 ?auto_82651 ) ) ( not ( = ?auto_82653 ?auto_82650 ) ) ( not ( = ?auto_82653 ?auto_82652 ) ) ( not ( = ?auto_82653 ?auto_82647 ) ) ( not ( = ?auto_82653 ?auto_82646 ) ) ( not ( = ?auto_82649 ?auto_82651 ) ) ( not ( = ?auto_82649 ?auto_82650 ) ) ( not ( = ?auto_82649 ?auto_82652 ) ) ( not ( = ?auto_82649 ?auto_82647 ) ) ( not ( = ?auto_82649 ?auto_82646 ) ) ( not ( = ?auto_82651 ?auto_82650 ) ) ( not ( = ?auto_82651 ?auto_82652 ) ) ( not ( = ?auto_82651 ?auto_82647 ) ) ( not ( = ?auto_82651 ?auto_82646 ) ) ( not ( = ?auto_82650 ?auto_82652 ) ) ( not ( = ?auto_82650 ?auto_82647 ) ) ( not ( = ?auto_82650 ?auto_82646 ) ) ( ON ?auto_82646 ?auto_82648 ) ( CLEAR ?auto_82646 ) ( not ( = ?auto_82646 ?auto_82648 ) ) ( not ( = ?auto_82647 ?auto_82648 ) ) ( not ( = ?auto_82652 ?auto_82648 ) ) ( not ( = ?auto_82653 ?auto_82648 ) ) ( not ( = ?auto_82649 ?auto_82648 ) ) ( not ( = ?auto_82651 ?auto_82648 ) ) ( not ( = ?auto_82650 ?auto_82648 ) ) ( HOLDING ?auto_82647 ) ( CLEAR ?auto_82652 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82653 ?auto_82649 ?auto_82651 ?auto_82650 ?auto_82652 ?auto_82647 )
      ( MAKE-2PILE ?auto_82646 ?auto_82647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82654 - BLOCK
      ?auto_82655 - BLOCK
    )
    :vars
    (
      ?auto_82657 - BLOCK
      ?auto_82659 - BLOCK
      ?auto_82656 - BLOCK
      ?auto_82658 - BLOCK
      ?auto_82661 - BLOCK
      ?auto_82660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82654 ?auto_82655 ) ) ( not ( = ?auto_82654 ?auto_82657 ) ) ( not ( = ?auto_82655 ?auto_82657 ) ) ( ON-TABLE ?auto_82659 ) ( ON ?auto_82656 ?auto_82659 ) ( ON ?auto_82658 ?auto_82656 ) ( ON ?auto_82661 ?auto_82658 ) ( ON ?auto_82657 ?auto_82661 ) ( not ( = ?auto_82659 ?auto_82656 ) ) ( not ( = ?auto_82659 ?auto_82658 ) ) ( not ( = ?auto_82659 ?auto_82661 ) ) ( not ( = ?auto_82659 ?auto_82657 ) ) ( not ( = ?auto_82659 ?auto_82655 ) ) ( not ( = ?auto_82659 ?auto_82654 ) ) ( not ( = ?auto_82656 ?auto_82658 ) ) ( not ( = ?auto_82656 ?auto_82661 ) ) ( not ( = ?auto_82656 ?auto_82657 ) ) ( not ( = ?auto_82656 ?auto_82655 ) ) ( not ( = ?auto_82656 ?auto_82654 ) ) ( not ( = ?auto_82658 ?auto_82661 ) ) ( not ( = ?auto_82658 ?auto_82657 ) ) ( not ( = ?auto_82658 ?auto_82655 ) ) ( not ( = ?auto_82658 ?auto_82654 ) ) ( not ( = ?auto_82661 ?auto_82657 ) ) ( not ( = ?auto_82661 ?auto_82655 ) ) ( not ( = ?auto_82661 ?auto_82654 ) ) ( ON ?auto_82654 ?auto_82660 ) ( not ( = ?auto_82654 ?auto_82660 ) ) ( not ( = ?auto_82655 ?auto_82660 ) ) ( not ( = ?auto_82657 ?auto_82660 ) ) ( not ( = ?auto_82659 ?auto_82660 ) ) ( not ( = ?auto_82656 ?auto_82660 ) ) ( not ( = ?auto_82658 ?auto_82660 ) ) ( not ( = ?auto_82661 ?auto_82660 ) ) ( CLEAR ?auto_82657 ) ( ON ?auto_82655 ?auto_82654 ) ( CLEAR ?auto_82655 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82660 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82660 ?auto_82654 )
      ( MAKE-2PILE ?auto_82654 ?auto_82655 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82662 - BLOCK
      ?auto_82663 - BLOCK
    )
    :vars
    (
      ?auto_82666 - BLOCK
      ?auto_82667 - BLOCK
      ?auto_82664 - BLOCK
      ?auto_82668 - BLOCK
      ?auto_82669 - BLOCK
      ?auto_82665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82662 ?auto_82663 ) ) ( not ( = ?auto_82662 ?auto_82666 ) ) ( not ( = ?auto_82663 ?auto_82666 ) ) ( ON-TABLE ?auto_82667 ) ( ON ?auto_82664 ?auto_82667 ) ( ON ?auto_82668 ?auto_82664 ) ( ON ?auto_82669 ?auto_82668 ) ( not ( = ?auto_82667 ?auto_82664 ) ) ( not ( = ?auto_82667 ?auto_82668 ) ) ( not ( = ?auto_82667 ?auto_82669 ) ) ( not ( = ?auto_82667 ?auto_82666 ) ) ( not ( = ?auto_82667 ?auto_82663 ) ) ( not ( = ?auto_82667 ?auto_82662 ) ) ( not ( = ?auto_82664 ?auto_82668 ) ) ( not ( = ?auto_82664 ?auto_82669 ) ) ( not ( = ?auto_82664 ?auto_82666 ) ) ( not ( = ?auto_82664 ?auto_82663 ) ) ( not ( = ?auto_82664 ?auto_82662 ) ) ( not ( = ?auto_82668 ?auto_82669 ) ) ( not ( = ?auto_82668 ?auto_82666 ) ) ( not ( = ?auto_82668 ?auto_82663 ) ) ( not ( = ?auto_82668 ?auto_82662 ) ) ( not ( = ?auto_82669 ?auto_82666 ) ) ( not ( = ?auto_82669 ?auto_82663 ) ) ( not ( = ?auto_82669 ?auto_82662 ) ) ( ON ?auto_82662 ?auto_82665 ) ( not ( = ?auto_82662 ?auto_82665 ) ) ( not ( = ?auto_82663 ?auto_82665 ) ) ( not ( = ?auto_82666 ?auto_82665 ) ) ( not ( = ?auto_82667 ?auto_82665 ) ) ( not ( = ?auto_82664 ?auto_82665 ) ) ( not ( = ?auto_82668 ?auto_82665 ) ) ( not ( = ?auto_82669 ?auto_82665 ) ) ( ON ?auto_82663 ?auto_82662 ) ( CLEAR ?auto_82663 ) ( ON-TABLE ?auto_82665 ) ( HOLDING ?auto_82666 ) ( CLEAR ?auto_82669 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82667 ?auto_82664 ?auto_82668 ?auto_82669 ?auto_82666 )
      ( MAKE-2PILE ?auto_82662 ?auto_82663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82670 - BLOCK
      ?auto_82671 - BLOCK
    )
    :vars
    (
      ?auto_82677 - BLOCK
      ?auto_82675 - BLOCK
      ?auto_82674 - BLOCK
      ?auto_82673 - BLOCK
      ?auto_82672 - BLOCK
      ?auto_82676 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82670 ?auto_82671 ) ) ( not ( = ?auto_82670 ?auto_82677 ) ) ( not ( = ?auto_82671 ?auto_82677 ) ) ( ON-TABLE ?auto_82675 ) ( ON ?auto_82674 ?auto_82675 ) ( ON ?auto_82673 ?auto_82674 ) ( ON ?auto_82672 ?auto_82673 ) ( not ( = ?auto_82675 ?auto_82674 ) ) ( not ( = ?auto_82675 ?auto_82673 ) ) ( not ( = ?auto_82675 ?auto_82672 ) ) ( not ( = ?auto_82675 ?auto_82677 ) ) ( not ( = ?auto_82675 ?auto_82671 ) ) ( not ( = ?auto_82675 ?auto_82670 ) ) ( not ( = ?auto_82674 ?auto_82673 ) ) ( not ( = ?auto_82674 ?auto_82672 ) ) ( not ( = ?auto_82674 ?auto_82677 ) ) ( not ( = ?auto_82674 ?auto_82671 ) ) ( not ( = ?auto_82674 ?auto_82670 ) ) ( not ( = ?auto_82673 ?auto_82672 ) ) ( not ( = ?auto_82673 ?auto_82677 ) ) ( not ( = ?auto_82673 ?auto_82671 ) ) ( not ( = ?auto_82673 ?auto_82670 ) ) ( not ( = ?auto_82672 ?auto_82677 ) ) ( not ( = ?auto_82672 ?auto_82671 ) ) ( not ( = ?auto_82672 ?auto_82670 ) ) ( ON ?auto_82670 ?auto_82676 ) ( not ( = ?auto_82670 ?auto_82676 ) ) ( not ( = ?auto_82671 ?auto_82676 ) ) ( not ( = ?auto_82677 ?auto_82676 ) ) ( not ( = ?auto_82675 ?auto_82676 ) ) ( not ( = ?auto_82674 ?auto_82676 ) ) ( not ( = ?auto_82673 ?auto_82676 ) ) ( not ( = ?auto_82672 ?auto_82676 ) ) ( ON ?auto_82671 ?auto_82670 ) ( ON-TABLE ?auto_82676 ) ( CLEAR ?auto_82672 ) ( ON ?auto_82677 ?auto_82671 ) ( CLEAR ?auto_82677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82676 ?auto_82670 ?auto_82671 )
      ( MAKE-2PILE ?auto_82670 ?auto_82671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82678 - BLOCK
      ?auto_82679 - BLOCK
    )
    :vars
    (
      ?auto_82682 - BLOCK
      ?auto_82683 - BLOCK
      ?auto_82681 - BLOCK
      ?auto_82684 - BLOCK
      ?auto_82685 - BLOCK
      ?auto_82680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82678 ?auto_82679 ) ) ( not ( = ?auto_82678 ?auto_82682 ) ) ( not ( = ?auto_82679 ?auto_82682 ) ) ( ON-TABLE ?auto_82683 ) ( ON ?auto_82681 ?auto_82683 ) ( ON ?auto_82684 ?auto_82681 ) ( not ( = ?auto_82683 ?auto_82681 ) ) ( not ( = ?auto_82683 ?auto_82684 ) ) ( not ( = ?auto_82683 ?auto_82685 ) ) ( not ( = ?auto_82683 ?auto_82682 ) ) ( not ( = ?auto_82683 ?auto_82679 ) ) ( not ( = ?auto_82683 ?auto_82678 ) ) ( not ( = ?auto_82681 ?auto_82684 ) ) ( not ( = ?auto_82681 ?auto_82685 ) ) ( not ( = ?auto_82681 ?auto_82682 ) ) ( not ( = ?auto_82681 ?auto_82679 ) ) ( not ( = ?auto_82681 ?auto_82678 ) ) ( not ( = ?auto_82684 ?auto_82685 ) ) ( not ( = ?auto_82684 ?auto_82682 ) ) ( not ( = ?auto_82684 ?auto_82679 ) ) ( not ( = ?auto_82684 ?auto_82678 ) ) ( not ( = ?auto_82685 ?auto_82682 ) ) ( not ( = ?auto_82685 ?auto_82679 ) ) ( not ( = ?auto_82685 ?auto_82678 ) ) ( ON ?auto_82678 ?auto_82680 ) ( not ( = ?auto_82678 ?auto_82680 ) ) ( not ( = ?auto_82679 ?auto_82680 ) ) ( not ( = ?auto_82682 ?auto_82680 ) ) ( not ( = ?auto_82683 ?auto_82680 ) ) ( not ( = ?auto_82681 ?auto_82680 ) ) ( not ( = ?auto_82684 ?auto_82680 ) ) ( not ( = ?auto_82685 ?auto_82680 ) ) ( ON ?auto_82679 ?auto_82678 ) ( ON-TABLE ?auto_82680 ) ( ON ?auto_82682 ?auto_82679 ) ( CLEAR ?auto_82682 ) ( HOLDING ?auto_82685 ) ( CLEAR ?auto_82684 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82683 ?auto_82681 ?auto_82684 ?auto_82685 )
      ( MAKE-2PILE ?auto_82678 ?auto_82679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82686 - BLOCK
      ?auto_82687 - BLOCK
    )
    :vars
    (
      ?auto_82693 - BLOCK
      ?auto_82692 - BLOCK
      ?auto_82689 - BLOCK
      ?auto_82690 - BLOCK
      ?auto_82688 - BLOCK
      ?auto_82691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82686 ?auto_82687 ) ) ( not ( = ?auto_82686 ?auto_82693 ) ) ( not ( = ?auto_82687 ?auto_82693 ) ) ( ON-TABLE ?auto_82692 ) ( ON ?auto_82689 ?auto_82692 ) ( ON ?auto_82690 ?auto_82689 ) ( not ( = ?auto_82692 ?auto_82689 ) ) ( not ( = ?auto_82692 ?auto_82690 ) ) ( not ( = ?auto_82692 ?auto_82688 ) ) ( not ( = ?auto_82692 ?auto_82693 ) ) ( not ( = ?auto_82692 ?auto_82687 ) ) ( not ( = ?auto_82692 ?auto_82686 ) ) ( not ( = ?auto_82689 ?auto_82690 ) ) ( not ( = ?auto_82689 ?auto_82688 ) ) ( not ( = ?auto_82689 ?auto_82693 ) ) ( not ( = ?auto_82689 ?auto_82687 ) ) ( not ( = ?auto_82689 ?auto_82686 ) ) ( not ( = ?auto_82690 ?auto_82688 ) ) ( not ( = ?auto_82690 ?auto_82693 ) ) ( not ( = ?auto_82690 ?auto_82687 ) ) ( not ( = ?auto_82690 ?auto_82686 ) ) ( not ( = ?auto_82688 ?auto_82693 ) ) ( not ( = ?auto_82688 ?auto_82687 ) ) ( not ( = ?auto_82688 ?auto_82686 ) ) ( ON ?auto_82686 ?auto_82691 ) ( not ( = ?auto_82686 ?auto_82691 ) ) ( not ( = ?auto_82687 ?auto_82691 ) ) ( not ( = ?auto_82693 ?auto_82691 ) ) ( not ( = ?auto_82692 ?auto_82691 ) ) ( not ( = ?auto_82689 ?auto_82691 ) ) ( not ( = ?auto_82690 ?auto_82691 ) ) ( not ( = ?auto_82688 ?auto_82691 ) ) ( ON ?auto_82687 ?auto_82686 ) ( ON-TABLE ?auto_82691 ) ( ON ?auto_82693 ?auto_82687 ) ( CLEAR ?auto_82690 ) ( ON ?auto_82688 ?auto_82693 ) ( CLEAR ?auto_82688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82691 ?auto_82686 ?auto_82687 ?auto_82693 )
      ( MAKE-2PILE ?auto_82686 ?auto_82687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82694 - BLOCK
      ?auto_82695 - BLOCK
    )
    :vars
    (
      ?auto_82698 - BLOCK
      ?auto_82699 - BLOCK
      ?auto_82696 - BLOCK
      ?auto_82700 - BLOCK
      ?auto_82701 - BLOCK
      ?auto_82697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82694 ?auto_82695 ) ) ( not ( = ?auto_82694 ?auto_82698 ) ) ( not ( = ?auto_82695 ?auto_82698 ) ) ( ON-TABLE ?auto_82699 ) ( ON ?auto_82696 ?auto_82699 ) ( not ( = ?auto_82699 ?auto_82696 ) ) ( not ( = ?auto_82699 ?auto_82700 ) ) ( not ( = ?auto_82699 ?auto_82701 ) ) ( not ( = ?auto_82699 ?auto_82698 ) ) ( not ( = ?auto_82699 ?auto_82695 ) ) ( not ( = ?auto_82699 ?auto_82694 ) ) ( not ( = ?auto_82696 ?auto_82700 ) ) ( not ( = ?auto_82696 ?auto_82701 ) ) ( not ( = ?auto_82696 ?auto_82698 ) ) ( not ( = ?auto_82696 ?auto_82695 ) ) ( not ( = ?auto_82696 ?auto_82694 ) ) ( not ( = ?auto_82700 ?auto_82701 ) ) ( not ( = ?auto_82700 ?auto_82698 ) ) ( not ( = ?auto_82700 ?auto_82695 ) ) ( not ( = ?auto_82700 ?auto_82694 ) ) ( not ( = ?auto_82701 ?auto_82698 ) ) ( not ( = ?auto_82701 ?auto_82695 ) ) ( not ( = ?auto_82701 ?auto_82694 ) ) ( ON ?auto_82694 ?auto_82697 ) ( not ( = ?auto_82694 ?auto_82697 ) ) ( not ( = ?auto_82695 ?auto_82697 ) ) ( not ( = ?auto_82698 ?auto_82697 ) ) ( not ( = ?auto_82699 ?auto_82697 ) ) ( not ( = ?auto_82696 ?auto_82697 ) ) ( not ( = ?auto_82700 ?auto_82697 ) ) ( not ( = ?auto_82701 ?auto_82697 ) ) ( ON ?auto_82695 ?auto_82694 ) ( ON-TABLE ?auto_82697 ) ( ON ?auto_82698 ?auto_82695 ) ( ON ?auto_82701 ?auto_82698 ) ( CLEAR ?auto_82701 ) ( HOLDING ?auto_82700 ) ( CLEAR ?auto_82696 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82699 ?auto_82696 ?auto_82700 )
      ( MAKE-2PILE ?auto_82694 ?auto_82695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82702 - BLOCK
      ?auto_82703 - BLOCK
    )
    :vars
    (
      ?auto_82708 - BLOCK
      ?auto_82709 - BLOCK
      ?auto_82704 - BLOCK
      ?auto_82707 - BLOCK
      ?auto_82706 - BLOCK
      ?auto_82705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82702 ?auto_82703 ) ) ( not ( = ?auto_82702 ?auto_82708 ) ) ( not ( = ?auto_82703 ?auto_82708 ) ) ( ON-TABLE ?auto_82709 ) ( ON ?auto_82704 ?auto_82709 ) ( not ( = ?auto_82709 ?auto_82704 ) ) ( not ( = ?auto_82709 ?auto_82707 ) ) ( not ( = ?auto_82709 ?auto_82706 ) ) ( not ( = ?auto_82709 ?auto_82708 ) ) ( not ( = ?auto_82709 ?auto_82703 ) ) ( not ( = ?auto_82709 ?auto_82702 ) ) ( not ( = ?auto_82704 ?auto_82707 ) ) ( not ( = ?auto_82704 ?auto_82706 ) ) ( not ( = ?auto_82704 ?auto_82708 ) ) ( not ( = ?auto_82704 ?auto_82703 ) ) ( not ( = ?auto_82704 ?auto_82702 ) ) ( not ( = ?auto_82707 ?auto_82706 ) ) ( not ( = ?auto_82707 ?auto_82708 ) ) ( not ( = ?auto_82707 ?auto_82703 ) ) ( not ( = ?auto_82707 ?auto_82702 ) ) ( not ( = ?auto_82706 ?auto_82708 ) ) ( not ( = ?auto_82706 ?auto_82703 ) ) ( not ( = ?auto_82706 ?auto_82702 ) ) ( ON ?auto_82702 ?auto_82705 ) ( not ( = ?auto_82702 ?auto_82705 ) ) ( not ( = ?auto_82703 ?auto_82705 ) ) ( not ( = ?auto_82708 ?auto_82705 ) ) ( not ( = ?auto_82709 ?auto_82705 ) ) ( not ( = ?auto_82704 ?auto_82705 ) ) ( not ( = ?auto_82707 ?auto_82705 ) ) ( not ( = ?auto_82706 ?auto_82705 ) ) ( ON ?auto_82703 ?auto_82702 ) ( ON-TABLE ?auto_82705 ) ( ON ?auto_82708 ?auto_82703 ) ( ON ?auto_82706 ?auto_82708 ) ( CLEAR ?auto_82704 ) ( ON ?auto_82707 ?auto_82706 ) ( CLEAR ?auto_82707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82705 ?auto_82702 ?auto_82703 ?auto_82708 ?auto_82706 )
      ( MAKE-2PILE ?auto_82702 ?auto_82703 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82710 - BLOCK
      ?auto_82711 - BLOCK
    )
    :vars
    (
      ?auto_82714 - BLOCK
      ?auto_82717 - BLOCK
      ?auto_82715 - BLOCK
      ?auto_82716 - BLOCK
      ?auto_82713 - BLOCK
      ?auto_82712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82710 ?auto_82711 ) ) ( not ( = ?auto_82710 ?auto_82714 ) ) ( not ( = ?auto_82711 ?auto_82714 ) ) ( ON-TABLE ?auto_82717 ) ( not ( = ?auto_82717 ?auto_82715 ) ) ( not ( = ?auto_82717 ?auto_82716 ) ) ( not ( = ?auto_82717 ?auto_82713 ) ) ( not ( = ?auto_82717 ?auto_82714 ) ) ( not ( = ?auto_82717 ?auto_82711 ) ) ( not ( = ?auto_82717 ?auto_82710 ) ) ( not ( = ?auto_82715 ?auto_82716 ) ) ( not ( = ?auto_82715 ?auto_82713 ) ) ( not ( = ?auto_82715 ?auto_82714 ) ) ( not ( = ?auto_82715 ?auto_82711 ) ) ( not ( = ?auto_82715 ?auto_82710 ) ) ( not ( = ?auto_82716 ?auto_82713 ) ) ( not ( = ?auto_82716 ?auto_82714 ) ) ( not ( = ?auto_82716 ?auto_82711 ) ) ( not ( = ?auto_82716 ?auto_82710 ) ) ( not ( = ?auto_82713 ?auto_82714 ) ) ( not ( = ?auto_82713 ?auto_82711 ) ) ( not ( = ?auto_82713 ?auto_82710 ) ) ( ON ?auto_82710 ?auto_82712 ) ( not ( = ?auto_82710 ?auto_82712 ) ) ( not ( = ?auto_82711 ?auto_82712 ) ) ( not ( = ?auto_82714 ?auto_82712 ) ) ( not ( = ?auto_82717 ?auto_82712 ) ) ( not ( = ?auto_82715 ?auto_82712 ) ) ( not ( = ?auto_82716 ?auto_82712 ) ) ( not ( = ?auto_82713 ?auto_82712 ) ) ( ON ?auto_82711 ?auto_82710 ) ( ON-TABLE ?auto_82712 ) ( ON ?auto_82714 ?auto_82711 ) ( ON ?auto_82713 ?auto_82714 ) ( ON ?auto_82716 ?auto_82713 ) ( CLEAR ?auto_82716 ) ( HOLDING ?auto_82715 ) ( CLEAR ?auto_82717 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82717 ?auto_82715 )
      ( MAKE-2PILE ?auto_82710 ?auto_82711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82718 - BLOCK
      ?auto_82719 - BLOCK
    )
    :vars
    (
      ?auto_82722 - BLOCK
      ?auto_82720 - BLOCK
      ?auto_82721 - BLOCK
      ?auto_82724 - BLOCK
      ?auto_82725 - BLOCK
      ?auto_82723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82718 ?auto_82719 ) ) ( not ( = ?auto_82718 ?auto_82722 ) ) ( not ( = ?auto_82719 ?auto_82722 ) ) ( ON-TABLE ?auto_82720 ) ( not ( = ?auto_82720 ?auto_82721 ) ) ( not ( = ?auto_82720 ?auto_82724 ) ) ( not ( = ?auto_82720 ?auto_82725 ) ) ( not ( = ?auto_82720 ?auto_82722 ) ) ( not ( = ?auto_82720 ?auto_82719 ) ) ( not ( = ?auto_82720 ?auto_82718 ) ) ( not ( = ?auto_82721 ?auto_82724 ) ) ( not ( = ?auto_82721 ?auto_82725 ) ) ( not ( = ?auto_82721 ?auto_82722 ) ) ( not ( = ?auto_82721 ?auto_82719 ) ) ( not ( = ?auto_82721 ?auto_82718 ) ) ( not ( = ?auto_82724 ?auto_82725 ) ) ( not ( = ?auto_82724 ?auto_82722 ) ) ( not ( = ?auto_82724 ?auto_82719 ) ) ( not ( = ?auto_82724 ?auto_82718 ) ) ( not ( = ?auto_82725 ?auto_82722 ) ) ( not ( = ?auto_82725 ?auto_82719 ) ) ( not ( = ?auto_82725 ?auto_82718 ) ) ( ON ?auto_82718 ?auto_82723 ) ( not ( = ?auto_82718 ?auto_82723 ) ) ( not ( = ?auto_82719 ?auto_82723 ) ) ( not ( = ?auto_82722 ?auto_82723 ) ) ( not ( = ?auto_82720 ?auto_82723 ) ) ( not ( = ?auto_82721 ?auto_82723 ) ) ( not ( = ?auto_82724 ?auto_82723 ) ) ( not ( = ?auto_82725 ?auto_82723 ) ) ( ON ?auto_82719 ?auto_82718 ) ( ON-TABLE ?auto_82723 ) ( ON ?auto_82722 ?auto_82719 ) ( ON ?auto_82725 ?auto_82722 ) ( ON ?auto_82724 ?auto_82725 ) ( CLEAR ?auto_82720 ) ( ON ?auto_82721 ?auto_82724 ) ( CLEAR ?auto_82721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82723 ?auto_82718 ?auto_82719 ?auto_82722 ?auto_82725 ?auto_82724 )
      ( MAKE-2PILE ?auto_82718 ?auto_82719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82726 - BLOCK
      ?auto_82727 - BLOCK
    )
    :vars
    (
      ?auto_82733 - BLOCK
      ?auto_82729 - BLOCK
      ?auto_82732 - BLOCK
      ?auto_82731 - BLOCK
      ?auto_82730 - BLOCK
      ?auto_82728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82726 ?auto_82727 ) ) ( not ( = ?auto_82726 ?auto_82733 ) ) ( not ( = ?auto_82727 ?auto_82733 ) ) ( not ( = ?auto_82729 ?auto_82732 ) ) ( not ( = ?auto_82729 ?auto_82731 ) ) ( not ( = ?auto_82729 ?auto_82730 ) ) ( not ( = ?auto_82729 ?auto_82733 ) ) ( not ( = ?auto_82729 ?auto_82727 ) ) ( not ( = ?auto_82729 ?auto_82726 ) ) ( not ( = ?auto_82732 ?auto_82731 ) ) ( not ( = ?auto_82732 ?auto_82730 ) ) ( not ( = ?auto_82732 ?auto_82733 ) ) ( not ( = ?auto_82732 ?auto_82727 ) ) ( not ( = ?auto_82732 ?auto_82726 ) ) ( not ( = ?auto_82731 ?auto_82730 ) ) ( not ( = ?auto_82731 ?auto_82733 ) ) ( not ( = ?auto_82731 ?auto_82727 ) ) ( not ( = ?auto_82731 ?auto_82726 ) ) ( not ( = ?auto_82730 ?auto_82733 ) ) ( not ( = ?auto_82730 ?auto_82727 ) ) ( not ( = ?auto_82730 ?auto_82726 ) ) ( ON ?auto_82726 ?auto_82728 ) ( not ( = ?auto_82726 ?auto_82728 ) ) ( not ( = ?auto_82727 ?auto_82728 ) ) ( not ( = ?auto_82733 ?auto_82728 ) ) ( not ( = ?auto_82729 ?auto_82728 ) ) ( not ( = ?auto_82732 ?auto_82728 ) ) ( not ( = ?auto_82731 ?auto_82728 ) ) ( not ( = ?auto_82730 ?auto_82728 ) ) ( ON ?auto_82727 ?auto_82726 ) ( ON-TABLE ?auto_82728 ) ( ON ?auto_82733 ?auto_82727 ) ( ON ?auto_82730 ?auto_82733 ) ( ON ?auto_82731 ?auto_82730 ) ( ON ?auto_82732 ?auto_82731 ) ( CLEAR ?auto_82732 ) ( HOLDING ?auto_82729 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82729 )
      ( MAKE-2PILE ?auto_82726 ?auto_82727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_82734 - BLOCK
      ?auto_82735 - BLOCK
    )
    :vars
    (
      ?auto_82740 - BLOCK
      ?auto_82741 - BLOCK
      ?auto_82738 - BLOCK
      ?auto_82739 - BLOCK
      ?auto_82737 - BLOCK
      ?auto_82736 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82734 ?auto_82735 ) ) ( not ( = ?auto_82734 ?auto_82740 ) ) ( not ( = ?auto_82735 ?auto_82740 ) ) ( not ( = ?auto_82741 ?auto_82738 ) ) ( not ( = ?auto_82741 ?auto_82739 ) ) ( not ( = ?auto_82741 ?auto_82737 ) ) ( not ( = ?auto_82741 ?auto_82740 ) ) ( not ( = ?auto_82741 ?auto_82735 ) ) ( not ( = ?auto_82741 ?auto_82734 ) ) ( not ( = ?auto_82738 ?auto_82739 ) ) ( not ( = ?auto_82738 ?auto_82737 ) ) ( not ( = ?auto_82738 ?auto_82740 ) ) ( not ( = ?auto_82738 ?auto_82735 ) ) ( not ( = ?auto_82738 ?auto_82734 ) ) ( not ( = ?auto_82739 ?auto_82737 ) ) ( not ( = ?auto_82739 ?auto_82740 ) ) ( not ( = ?auto_82739 ?auto_82735 ) ) ( not ( = ?auto_82739 ?auto_82734 ) ) ( not ( = ?auto_82737 ?auto_82740 ) ) ( not ( = ?auto_82737 ?auto_82735 ) ) ( not ( = ?auto_82737 ?auto_82734 ) ) ( ON ?auto_82734 ?auto_82736 ) ( not ( = ?auto_82734 ?auto_82736 ) ) ( not ( = ?auto_82735 ?auto_82736 ) ) ( not ( = ?auto_82740 ?auto_82736 ) ) ( not ( = ?auto_82741 ?auto_82736 ) ) ( not ( = ?auto_82738 ?auto_82736 ) ) ( not ( = ?auto_82739 ?auto_82736 ) ) ( not ( = ?auto_82737 ?auto_82736 ) ) ( ON ?auto_82735 ?auto_82734 ) ( ON-TABLE ?auto_82736 ) ( ON ?auto_82740 ?auto_82735 ) ( ON ?auto_82737 ?auto_82740 ) ( ON ?auto_82739 ?auto_82737 ) ( ON ?auto_82738 ?auto_82739 ) ( ON ?auto_82741 ?auto_82738 ) ( CLEAR ?auto_82741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82736 ?auto_82734 ?auto_82735 ?auto_82740 ?auto_82737 ?auto_82739 ?auto_82738 )
      ( MAKE-2PILE ?auto_82734 ?auto_82735 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82746 - BLOCK
      ?auto_82747 - BLOCK
      ?auto_82748 - BLOCK
      ?auto_82749 - BLOCK
    )
    :vars
    (
      ?auto_82750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82750 ?auto_82749 ) ( CLEAR ?auto_82750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82746 ) ( ON ?auto_82747 ?auto_82746 ) ( ON ?auto_82748 ?auto_82747 ) ( ON ?auto_82749 ?auto_82748 ) ( not ( = ?auto_82746 ?auto_82747 ) ) ( not ( = ?auto_82746 ?auto_82748 ) ) ( not ( = ?auto_82746 ?auto_82749 ) ) ( not ( = ?auto_82746 ?auto_82750 ) ) ( not ( = ?auto_82747 ?auto_82748 ) ) ( not ( = ?auto_82747 ?auto_82749 ) ) ( not ( = ?auto_82747 ?auto_82750 ) ) ( not ( = ?auto_82748 ?auto_82749 ) ) ( not ( = ?auto_82748 ?auto_82750 ) ) ( not ( = ?auto_82749 ?auto_82750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82750 ?auto_82749 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82751 - BLOCK
      ?auto_82752 - BLOCK
      ?auto_82753 - BLOCK
      ?auto_82754 - BLOCK
    )
    :vars
    (
      ?auto_82755 - BLOCK
      ?auto_82756 - BLOCK
      ?auto_82757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82755 ?auto_82754 ) ( CLEAR ?auto_82755 ) ( ON-TABLE ?auto_82751 ) ( ON ?auto_82752 ?auto_82751 ) ( ON ?auto_82753 ?auto_82752 ) ( ON ?auto_82754 ?auto_82753 ) ( not ( = ?auto_82751 ?auto_82752 ) ) ( not ( = ?auto_82751 ?auto_82753 ) ) ( not ( = ?auto_82751 ?auto_82754 ) ) ( not ( = ?auto_82751 ?auto_82755 ) ) ( not ( = ?auto_82752 ?auto_82753 ) ) ( not ( = ?auto_82752 ?auto_82754 ) ) ( not ( = ?auto_82752 ?auto_82755 ) ) ( not ( = ?auto_82753 ?auto_82754 ) ) ( not ( = ?auto_82753 ?auto_82755 ) ) ( not ( = ?auto_82754 ?auto_82755 ) ) ( HOLDING ?auto_82756 ) ( CLEAR ?auto_82757 ) ( not ( = ?auto_82751 ?auto_82756 ) ) ( not ( = ?auto_82751 ?auto_82757 ) ) ( not ( = ?auto_82752 ?auto_82756 ) ) ( not ( = ?auto_82752 ?auto_82757 ) ) ( not ( = ?auto_82753 ?auto_82756 ) ) ( not ( = ?auto_82753 ?auto_82757 ) ) ( not ( = ?auto_82754 ?auto_82756 ) ) ( not ( = ?auto_82754 ?auto_82757 ) ) ( not ( = ?auto_82755 ?auto_82756 ) ) ( not ( = ?auto_82755 ?auto_82757 ) ) ( not ( = ?auto_82756 ?auto_82757 ) ) )
    :subtasks
    ( ( !STACK ?auto_82756 ?auto_82757 )
      ( MAKE-4PILE ?auto_82751 ?auto_82752 ?auto_82753 ?auto_82754 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82758 - BLOCK
      ?auto_82759 - BLOCK
      ?auto_82760 - BLOCK
      ?auto_82761 - BLOCK
    )
    :vars
    (
      ?auto_82764 - BLOCK
      ?auto_82763 - BLOCK
      ?auto_82762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82764 ?auto_82761 ) ( ON-TABLE ?auto_82758 ) ( ON ?auto_82759 ?auto_82758 ) ( ON ?auto_82760 ?auto_82759 ) ( ON ?auto_82761 ?auto_82760 ) ( not ( = ?auto_82758 ?auto_82759 ) ) ( not ( = ?auto_82758 ?auto_82760 ) ) ( not ( = ?auto_82758 ?auto_82761 ) ) ( not ( = ?auto_82758 ?auto_82764 ) ) ( not ( = ?auto_82759 ?auto_82760 ) ) ( not ( = ?auto_82759 ?auto_82761 ) ) ( not ( = ?auto_82759 ?auto_82764 ) ) ( not ( = ?auto_82760 ?auto_82761 ) ) ( not ( = ?auto_82760 ?auto_82764 ) ) ( not ( = ?auto_82761 ?auto_82764 ) ) ( CLEAR ?auto_82763 ) ( not ( = ?auto_82758 ?auto_82762 ) ) ( not ( = ?auto_82758 ?auto_82763 ) ) ( not ( = ?auto_82759 ?auto_82762 ) ) ( not ( = ?auto_82759 ?auto_82763 ) ) ( not ( = ?auto_82760 ?auto_82762 ) ) ( not ( = ?auto_82760 ?auto_82763 ) ) ( not ( = ?auto_82761 ?auto_82762 ) ) ( not ( = ?auto_82761 ?auto_82763 ) ) ( not ( = ?auto_82764 ?auto_82762 ) ) ( not ( = ?auto_82764 ?auto_82763 ) ) ( not ( = ?auto_82762 ?auto_82763 ) ) ( ON ?auto_82762 ?auto_82764 ) ( CLEAR ?auto_82762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82758 ?auto_82759 ?auto_82760 ?auto_82761 ?auto_82764 )
      ( MAKE-4PILE ?auto_82758 ?auto_82759 ?auto_82760 ?auto_82761 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82765 - BLOCK
      ?auto_82766 - BLOCK
      ?auto_82767 - BLOCK
      ?auto_82768 - BLOCK
    )
    :vars
    (
      ?auto_82770 - BLOCK
      ?auto_82769 - BLOCK
      ?auto_82771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82770 ?auto_82768 ) ( ON-TABLE ?auto_82765 ) ( ON ?auto_82766 ?auto_82765 ) ( ON ?auto_82767 ?auto_82766 ) ( ON ?auto_82768 ?auto_82767 ) ( not ( = ?auto_82765 ?auto_82766 ) ) ( not ( = ?auto_82765 ?auto_82767 ) ) ( not ( = ?auto_82765 ?auto_82768 ) ) ( not ( = ?auto_82765 ?auto_82770 ) ) ( not ( = ?auto_82766 ?auto_82767 ) ) ( not ( = ?auto_82766 ?auto_82768 ) ) ( not ( = ?auto_82766 ?auto_82770 ) ) ( not ( = ?auto_82767 ?auto_82768 ) ) ( not ( = ?auto_82767 ?auto_82770 ) ) ( not ( = ?auto_82768 ?auto_82770 ) ) ( not ( = ?auto_82765 ?auto_82769 ) ) ( not ( = ?auto_82765 ?auto_82771 ) ) ( not ( = ?auto_82766 ?auto_82769 ) ) ( not ( = ?auto_82766 ?auto_82771 ) ) ( not ( = ?auto_82767 ?auto_82769 ) ) ( not ( = ?auto_82767 ?auto_82771 ) ) ( not ( = ?auto_82768 ?auto_82769 ) ) ( not ( = ?auto_82768 ?auto_82771 ) ) ( not ( = ?auto_82770 ?auto_82769 ) ) ( not ( = ?auto_82770 ?auto_82771 ) ) ( not ( = ?auto_82769 ?auto_82771 ) ) ( ON ?auto_82769 ?auto_82770 ) ( CLEAR ?auto_82769 ) ( HOLDING ?auto_82771 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82771 )
      ( MAKE-4PILE ?auto_82765 ?auto_82766 ?auto_82767 ?auto_82768 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82772 - BLOCK
      ?auto_82773 - BLOCK
      ?auto_82774 - BLOCK
      ?auto_82775 - BLOCK
    )
    :vars
    (
      ?auto_82776 - BLOCK
      ?auto_82777 - BLOCK
      ?auto_82778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82776 ?auto_82775 ) ( ON-TABLE ?auto_82772 ) ( ON ?auto_82773 ?auto_82772 ) ( ON ?auto_82774 ?auto_82773 ) ( ON ?auto_82775 ?auto_82774 ) ( not ( = ?auto_82772 ?auto_82773 ) ) ( not ( = ?auto_82772 ?auto_82774 ) ) ( not ( = ?auto_82772 ?auto_82775 ) ) ( not ( = ?auto_82772 ?auto_82776 ) ) ( not ( = ?auto_82773 ?auto_82774 ) ) ( not ( = ?auto_82773 ?auto_82775 ) ) ( not ( = ?auto_82773 ?auto_82776 ) ) ( not ( = ?auto_82774 ?auto_82775 ) ) ( not ( = ?auto_82774 ?auto_82776 ) ) ( not ( = ?auto_82775 ?auto_82776 ) ) ( not ( = ?auto_82772 ?auto_82777 ) ) ( not ( = ?auto_82772 ?auto_82778 ) ) ( not ( = ?auto_82773 ?auto_82777 ) ) ( not ( = ?auto_82773 ?auto_82778 ) ) ( not ( = ?auto_82774 ?auto_82777 ) ) ( not ( = ?auto_82774 ?auto_82778 ) ) ( not ( = ?auto_82775 ?auto_82777 ) ) ( not ( = ?auto_82775 ?auto_82778 ) ) ( not ( = ?auto_82776 ?auto_82777 ) ) ( not ( = ?auto_82776 ?auto_82778 ) ) ( not ( = ?auto_82777 ?auto_82778 ) ) ( ON ?auto_82777 ?auto_82776 ) ( ON ?auto_82778 ?auto_82777 ) ( CLEAR ?auto_82778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82772 ?auto_82773 ?auto_82774 ?auto_82775 ?auto_82776 ?auto_82777 )
      ( MAKE-4PILE ?auto_82772 ?auto_82773 ?auto_82774 ?auto_82775 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82779 - BLOCK
      ?auto_82780 - BLOCK
      ?auto_82781 - BLOCK
      ?auto_82782 - BLOCK
    )
    :vars
    (
      ?auto_82783 - BLOCK
      ?auto_82784 - BLOCK
      ?auto_82785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82783 ?auto_82782 ) ( ON-TABLE ?auto_82779 ) ( ON ?auto_82780 ?auto_82779 ) ( ON ?auto_82781 ?auto_82780 ) ( ON ?auto_82782 ?auto_82781 ) ( not ( = ?auto_82779 ?auto_82780 ) ) ( not ( = ?auto_82779 ?auto_82781 ) ) ( not ( = ?auto_82779 ?auto_82782 ) ) ( not ( = ?auto_82779 ?auto_82783 ) ) ( not ( = ?auto_82780 ?auto_82781 ) ) ( not ( = ?auto_82780 ?auto_82782 ) ) ( not ( = ?auto_82780 ?auto_82783 ) ) ( not ( = ?auto_82781 ?auto_82782 ) ) ( not ( = ?auto_82781 ?auto_82783 ) ) ( not ( = ?auto_82782 ?auto_82783 ) ) ( not ( = ?auto_82779 ?auto_82784 ) ) ( not ( = ?auto_82779 ?auto_82785 ) ) ( not ( = ?auto_82780 ?auto_82784 ) ) ( not ( = ?auto_82780 ?auto_82785 ) ) ( not ( = ?auto_82781 ?auto_82784 ) ) ( not ( = ?auto_82781 ?auto_82785 ) ) ( not ( = ?auto_82782 ?auto_82784 ) ) ( not ( = ?auto_82782 ?auto_82785 ) ) ( not ( = ?auto_82783 ?auto_82784 ) ) ( not ( = ?auto_82783 ?auto_82785 ) ) ( not ( = ?auto_82784 ?auto_82785 ) ) ( ON ?auto_82784 ?auto_82783 ) ( HOLDING ?auto_82785 ) ( CLEAR ?auto_82784 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82779 ?auto_82780 ?auto_82781 ?auto_82782 ?auto_82783 ?auto_82784 ?auto_82785 )
      ( MAKE-4PILE ?auto_82779 ?auto_82780 ?auto_82781 ?auto_82782 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82786 - BLOCK
      ?auto_82787 - BLOCK
      ?auto_82788 - BLOCK
      ?auto_82789 - BLOCK
    )
    :vars
    (
      ?auto_82790 - BLOCK
      ?auto_82791 - BLOCK
      ?auto_82792 - BLOCK
      ?auto_82793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82790 ?auto_82789 ) ( ON-TABLE ?auto_82786 ) ( ON ?auto_82787 ?auto_82786 ) ( ON ?auto_82788 ?auto_82787 ) ( ON ?auto_82789 ?auto_82788 ) ( not ( = ?auto_82786 ?auto_82787 ) ) ( not ( = ?auto_82786 ?auto_82788 ) ) ( not ( = ?auto_82786 ?auto_82789 ) ) ( not ( = ?auto_82786 ?auto_82790 ) ) ( not ( = ?auto_82787 ?auto_82788 ) ) ( not ( = ?auto_82787 ?auto_82789 ) ) ( not ( = ?auto_82787 ?auto_82790 ) ) ( not ( = ?auto_82788 ?auto_82789 ) ) ( not ( = ?auto_82788 ?auto_82790 ) ) ( not ( = ?auto_82789 ?auto_82790 ) ) ( not ( = ?auto_82786 ?auto_82791 ) ) ( not ( = ?auto_82786 ?auto_82792 ) ) ( not ( = ?auto_82787 ?auto_82791 ) ) ( not ( = ?auto_82787 ?auto_82792 ) ) ( not ( = ?auto_82788 ?auto_82791 ) ) ( not ( = ?auto_82788 ?auto_82792 ) ) ( not ( = ?auto_82789 ?auto_82791 ) ) ( not ( = ?auto_82789 ?auto_82792 ) ) ( not ( = ?auto_82790 ?auto_82791 ) ) ( not ( = ?auto_82790 ?auto_82792 ) ) ( not ( = ?auto_82791 ?auto_82792 ) ) ( ON ?auto_82791 ?auto_82790 ) ( CLEAR ?auto_82791 ) ( ON ?auto_82792 ?auto_82793 ) ( CLEAR ?auto_82792 ) ( HAND-EMPTY ) ( not ( = ?auto_82786 ?auto_82793 ) ) ( not ( = ?auto_82787 ?auto_82793 ) ) ( not ( = ?auto_82788 ?auto_82793 ) ) ( not ( = ?auto_82789 ?auto_82793 ) ) ( not ( = ?auto_82790 ?auto_82793 ) ) ( not ( = ?auto_82791 ?auto_82793 ) ) ( not ( = ?auto_82792 ?auto_82793 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82792 ?auto_82793 )
      ( MAKE-4PILE ?auto_82786 ?auto_82787 ?auto_82788 ?auto_82789 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82794 - BLOCK
      ?auto_82795 - BLOCK
      ?auto_82796 - BLOCK
      ?auto_82797 - BLOCK
    )
    :vars
    (
      ?auto_82800 - BLOCK
      ?auto_82798 - BLOCK
      ?auto_82801 - BLOCK
      ?auto_82799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82800 ?auto_82797 ) ( ON-TABLE ?auto_82794 ) ( ON ?auto_82795 ?auto_82794 ) ( ON ?auto_82796 ?auto_82795 ) ( ON ?auto_82797 ?auto_82796 ) ( not ( = ?auto_82794 ?auto_82795 ) ) ( not ( = ?auto_82794 ?auto_82796 ) ) ( not ( = ?auto_82794 ?auto_82797 ) ) ( not ( = ?auto_82794 ?auto_82800 ) ) ( not ( = ?auto_82795 ?auto_82796 ) ) ( not ( = ?auto_82795 ?auto_82797 ) ) ( not ( = ?auto_82795 ?auto_82800 ) ) ( not ( = ?auto_82796 ?auto_82797 ) ) ( not ( = ?auto_82796 ?auto_82800 ) ) ( not ( = ?auto_82797 ?auto_82800 ) ) ( not ( = ?auto_82794 ?auto_82798 ) ) ( not ( = ?auto_82794 ?auto_82801 ) ) ( not ( = ?auto_82795 ?auto_82798 ) ) ( not ( = ?auto_82795 ?auto_82801 ) ) ( not ( = ?auto_82796 ?auto_82798 ) ) ( not ( = ?auto_82796 ?auto_82801 ) ) ( not ( = ?auto_82797 ?auto_82798 ) ) ( not ( = ?auto_82797 ?auto_82801 ) ) ( not ( = ?auto_82800 ?auto_82798 ) ) ( not ( = ?auto_82800 ?auto_82801 ) ) ( not ( = ?auto_82798 ?auto_82801 ) ) ( ON ?auto_82801 ?auto_82799 ) ( CLEAR ?auto_82801 ) ( not ( = ?auto_82794 ?auto_82799 ) ) ( not ( = ?auto_82795 ?auto_82799 ) ) ( not ( = ?auto_82796 ?auto_82799 ) ) ( not ( = ?auto_82797 ?auto_82799 ) ) ( not ( = ?auto_82800 ?auto_82799 ) ) ( not ( = ?auto_82798 ?auto_82799 ) ) ( not ( = ?auto_82801 ?auto_82799 ) ) ( HOLDING ?auto_82798 ) ( CLEAR ?auto_82800 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82794 ?auto_82795 ?auto_82796 ?auto_82797 ?auto_82800 ?auto_82798 )
      ( MAKE-4PILE ?auto_82794 ?auto_82795 ?auto_82796 ?auto_82797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82802 - BLOCK
      ?auto_82803 - BLOCK
      ?auto_82804 - BLOCK
      ?auto_82805 - BLOCK
    )
    :vars
    (
      ?auto_82808 - BLOCK
      ?auto_82806 - BLOCK
      ?auto_82809 - BLOCK
      ?auto_82807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_82808 ?auto_82805 ) ( ON-TABLE ?auto_82802 ) ( ON ?auto_82803 ?auto_82802 ) ( ON ?auto_82804 ?auto_82803 ) ( ON ?auto_82805 ?auto_82804 ) ( not ( = ?auto_82802 ?auto_82803 ) ) ( not ( = ?auto_82802 ?auto_82804 ) ) ( not ( = ?auto_82802 ?auto_82805 ) ) ( not ( = ?auto_82802 ?auto_82808 ) ) ( not ( = ?auto_82803 ?auto_82804 ) ) ( not ( = ?auto_82803 ?auto_82805 ) ) ( not ( = ?auto_82803 ?auto_82808 ) ) ( not ( = ?auto_82804 ?auto_82805 ) ) ( not ( = ?auto_82804 ?auto_82808 ) ) ( not ( = ?auto_82805 ?auto_82808 ) ) ( not ( = ?auto_82802 ?auto_82806 ) ) ( not ( = ?auto_82802 ?auto_82809 ) ) ( not ( = ?auto_82803 ?auto_82806 ) ) ( not ( = ?auto_82803 ?auto_82809 ) ) ( not ( = ?auto_82804 ?auto_82806 ) ) ( not ( = ?auto_82804 ?auto_82809 ) ) ( not ( = ?auto_82805 ?auto_82806 ) ) ( not ( = ?auto_82805 ?auto_82809 ) ) ( not ( = ?auto_82808 ?auto_82806 ) ) ( not ( = ?auto_82808 ?auto_82809 ) ) ( not ( = ?auto_82806 ?auto_82809 ) ) ( ON ?auto_82809 ?auto_82807 ) ( not ( = ?auto_82802 ?auto_82807 ) ) ( not ( = ?auto_82803 ?auto_82807 ) ) ( not ( = ?auto_82804 ?auto_82807 ) ) ( not ( = ?auto_82805 ?auto_82807 ) ) ( not ( = ?auto_82808 ?auto_82807 ) ) ( not ( = ?auto_82806 ?auto_82807 ) ) ( not ( = ?auto_82809 ?auto_82807 ) ) ( CLEAR ?auto_82808 ) ( ON ?auto_82806 ?auto_82809 ) ( CLEAR ?auto_82806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82807 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82807 ?auto_82809 )
      ( MAKE-4PILE ?auto_82802 ?auto_82803 ?auto_82804 ?auto_82805 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82826 - BLOCK
      ?auto_82827 - BLOCK
      ?auto_82828 - BLOCK
      ?auto_82829 - BLOCK
    )
    :vars
    (
      ?auto_82832 - BLOCK
      ?auto_82831 - BLOCK
      ?auto_82830 - BLOCK
      ?auto_82833 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82826 ) ( ON ?auto_82827 ?auto_82826 ) ( ON ?auto_82828 ?auto_82827 ) ( not ( = ?auto_82826 ?auto_82827 ) ) ( not ( = ?auto_82826 ?auto_82828 ) ) ( not ( = ?auto_82826 ?auto_82829 ) ) ( not ( = ?auto_82826 ?auto_82832 ) ) ( not ( = ?auto_82827 ?auto_82828 ) ) ( not ( = ?auto_82827 ?auto_82829 ) ) ( not ( = ?auto_82827 ?auto_82832 ) ) ( not ( = ?auto_82828 ?auto_82829 ) ) ( not ( = ?auto_82828 ?auto_82832 ) ) ( not ( = ?auto_82829 ?auto_82832 ) ) ( not ( = ?auto_82826 ?auto_82831 ) ) ( not ( = ?auto_82826 ?auto_82830 ) ) ( not ( = ?auto_82827 ?auto_82831 ) ) ( not ( = ?auto_82827 ?auto_82830 ) ) ( not ( = ?auto_82828 ?auto_82831 ) ) ( not ( = ?auto_82828 ?auto_82830 ) ) ( not ( = ?auto_82829 ?auto_82831 ) ) ( not ( = ?auto_82829 ?auto_82830 ) ) ( not ( = ?auto_82832 ?auto_82831 ) ) ( not ( = ?auto_82832 ?auto_82830 ) ) ( not ( = ?auto_82831 ?auto_82830 ) ) ( ON ?auto_82830 ?auto_82833 ) ( not ( = ?auto_82826 ?auto_82833 ) ) ( not ( = ?auto_82827 ?auto_82833 ) ) ( not ( = ?auto_82828 ?auto_82833 ) ) ( not ( = ?auto_82829 ?auto_82833 ) ) ( not ( = ?auto_82832 ?auto_82833 ) ) ( not ( = ?auto_82831 ?auto_82833 ) ) ( not ( = ?auto_82830 ?auto_82833 ) ) ( ON ?auto_82831 ?auto_82830 ) ( ON-TABLE ?auto_82833 ) ( ON ?auto_82832 ?auto_82831 ) ( CLEAR ?auto_82832 ) ( HOLDING ?auto_82829 ) ( CLEAR ?auto_82828 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82826 ?auto_82827 ?auto_82828 ?auto_82829 ?auto_82832 )
      ( MAKE-4PILE ?auto_82826 ?auto_82827 ?auto_82828 ?auto_82829 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82834 - BLOCK
      ?auto_82835 - BLOCK
      ?auto_82836 - BLOCK
      ?auto_82837 - BLOCK
    )
    :vars
    (
      ?auto_82838 - BLOCK
      ?auto_82839 - BLOCK
      ?auto_82840 - BLOCK
      ?auto_82841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82834 ) ( ON ?auto_82835 ?auto_82834 ) ( ON ?auto_82836 ?auto_82835 ) ( not ( = ?auto_82834 ?auto_82835 ) ) ( not ( = ?auto_82834 ?auto_82836 ) ) ( not ( = ?auto_82834 ?auto_82837 ) ) ( not ( = ?auto_82834 ?auto_82838 ) ) ( not ( = ?auto_82835 ?auto_82836 ) ) ( not ( = ?auto_82835 ?auto_82837 ) ) ( not ( = ?auto_82835 ?auto_82838 ) ) ( not ( = ?auto_82836 ?auto_82837 ) ) ( not ( = ?auto_82836 ?auto_82838 ) ) ( not ( = ?auto_82837 ?auto_82838 ) ) ( not ( = ?auto_82834 ?auto_82839 ) ) ( not ( = ?auto_82834 ?auto_82840 ) ) ( not ( = ?auto_82835 ?auto_82839 ) ) ( not ( = ?auto_82835 ?auto_82840 ) ) ( not ( = ?auto_82836 ?auto_82839 ) ) ( not ( = ?auto_82836 ?auto_82840 ) ) ( not ( = ?auto_82837 ?auto_82839 ) ) ( not ( = ?auto_82837 ?auto_82840 ) ) ( not ( = ?auto_82838 ?auto_82839 ) ) ( not ( = ?auto_82838 ?auto_82840 ) ) ( not ( = ?auto_82839 ?auto_82840 ) ) ( ON ?auto_82840 ?auto_82841 ) ( not ( = ?auto_82834 ?auto_82841 ) ) ( not ( = ?auto_82835 ?auto_82841 ) ) ( not ( = ?auto_82836 ?auto_82841 ) ) ( not ( = ?auto_82837 ?auto_82841 ) ) ( not ( = ?auto_82838 ?auto_82841 ) ) ( not ( = ?auto_82839 ?auto_82841 ) ) ( not ( = ?auto_82840 ?auto_82841 ) ) ( ON ?auto_82839 ?auto_82840 ) ( ON-TABLE ?auto_82841 ) ( ON ?auto_82838 ?auto_82839 ) ( CLEAR ?auto_82836 ) ( ON ?auto_82837 ?auto_82838 ) ( CLEAR ?auto_82837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82841 ?auto_82840 ?auto_82839 ?auto_82838 )
      ( MAKE-4PILE ?auto_82834 ?auto_82835 ?auto_82836 ?auto_82837 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82842 - BLOCK
      ?auto_82843 - BLOCK
      ?auto_82844 - BLOCK
      ?auto_82845 - BLOCK
    )
    :vars
    (
      ?auto_82849 - BLOCK
      ?auto_82848 - BLOCK
      ?auto_82847 - BLOCK
      ?auto_82846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82842 ) ( ON ?auto_82843 ?auto_82842 ) ( not ( = ?auto_82842 ?auto_82843 ) ) ( not ( = ?auto_82842 ?auto_82844 ) ) ( not ( = ?auto_82842 ?auto_82845 ) ) ( not ( = ?auto_82842 ?auto_82849 ) ) ( not ( = ?auto_82843 ?auto_82844 ) ) ( not ( = ?auto_82843 ?auto_82845 ) ) ( not ( = ?auto_82843 ?auto_82849 ) ) ( not ( = ?auto_82844 ?auto_82845 ) ) ( not ( = ?auto_82844 ?auto_82849 ) ) ( not ( = ?auto_82845 ?auto_82849 ) ) ( not ( = ?auto_82842 ?auto_82848 ) ) ( not ( = ?auto_82842 ?auto_82847 ) ) ( not ( = ?auto_82843 ?auto_82848 ) ) ( not ( = ?auto_82843 ?auto_82847 ) ) ( not ( = ?auto_82844 ?auto_82848 ) ) ( not ( = ?auto_82844 ?auto_82847 ) ) ( not ( = ?auto_82845 ?auto_82848 ) ) ( not ( = ?auto_82845 ?auto_82847 ) ) ( not ( = ?auto_82849 ?auto_82848 ) ) ( not ( = ?auto_82849 ?auto_82847 ) ) ( not ( = ?auto_82848 ?auto_82847 ) ) ( ON ?auto_82847 ?auto_82846 ) ( not ( = ?auto_82842 ?auto_82846 ) ) ( not ( = ?auto_82843 ?auto_82846 ) ) ( not ( = ?auto_82844 ?auto_82846 ) ) ( not ( = ?auto_82845 ?auto_82846 ) ) ( not ( = ?auto_82849 ?auto_82846 ) ) ( not ( = ?auto_82848 ?auto_82846 ) ) ( not ( = ?auto_82847 ?auto_82846 ) ) ( ON ?auto_82848 ?auto_82847 ) ( ON-TABLE ?auto_82846 ) ( ON ?auto_82849 ?auto_82848 ) ( ON ?auto_82845 ?auto_82849 ) ( CLEAR ?auto_82845 ) ( HOLDING ?auto_82844 ) ( CLEAR ?auto_82843 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82842 ?auto_82843 ?auto_82844 )
      ( MAKE-4PILE ?auto_82842 ?auto_82843 ?auto_82844 ?auto_82845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82850 - BLOCK
      ?auto_82851 - BLOCK
      ?auto_82852 - BLOCK
      ?auto_82853 - BLOCK
    )
    :vars
    (
      ?auto_82855 - BLOCK
      ?auto_82856 - BLOCK
      ?auto_82857 - BLOCK
      ?auto_82854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82850 ) ( ON ?auto_82851 ?auto_82850 ) ( not ( = ?auto_82850 ?auto_82851 ) ) ( not ( = ?auto_82850 ?auto_82852 ) ) ( not ( = ?auto_82850 ?auto_82853 ) ) ( not ( = ?auto_82850 ?auto_82855 ) ) ( not ( = ?auto_82851 ?auto_82852 ) ) ( not ( = ?auto_82851 ?auto_82853 ) ) ( not ( = ?auto_82851 ?auto_82855 ) ) ( not ( = ?auto_82852 ?auto_82853 ) ) ( not ( = ?auto_82852 ?auto_82855 ) ) ( not ( = ?auto_82853 ?auto_82855 ) ) ( not ( = ?auto_82850 ?auto_82856 ) ) ( not ( = ?auto_82850 ?auto_82857 ) ) ( not ( = ?auto_82851 ?auto_82856 ) ) ( not ( = ?auto_82851 ?auto_82857 ) ) ( not ( = ?auto_82852 ?auto_82856 ) ) ( not ( = ?auto_82852 ?auto_82857 ) ) ( not ( = ?auto_82853 ?auto_82856 ) ) ( not ( = ?auto_82853 ?auto_82857 ) ) ( not ( = ?auto_82855 ?auto_82856 ) ) ( not ( = ?auto_82855 ?auto_82857 ) ) ( not ( = ?auto_82856 ?auto_82857 ) ) ( ON ?auto_82857 ?auto_82854 ) ( not ( = ?auto_82850 ?auto_82854 ) ) ( not ( = ?auto_82851 ?auto_82854 ) ) ( not ( = ?auto_82852 ?auto_82854 ) ) ( not ( = ?auto_82853 ?auto_82854 ) ) ( not ( = ?auto_82855 ?auto_82854 ) ) ( not ( = ?auto_82856 ?auto_82854 ) ) ( not ( = ?auto_82857 ?auto_82854 ) ) ( ON ?auto_82856 ?auto_82857 ) ( ON-TABLE ?auto_82854 ) ( ON ?auto_82855 ?auto_82856 ) ( ON ?auto_82853 ?auto_82855 ) ( CLEAR ?auto_82851 ) ( ON ?auto_82852 ?auto_82853 ) ( CLEAR ?auto_82852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82854 ?auto_82857 ?auto_82856 ?auto_82855 ?auto_82853 )
      ( MAKE-4PILE ?auto_82850 ?auto_82851 ?auto_82852 ?auto_82853 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82858 - BLOCK
      ?auto_82859 - BLOCK
      ?auto_82860 - BLOCK
      ?auto_82861 - BLOCK
    )
    :vars
    (
      ?auto_82865 - BLOCK
      ?auto_82863 - BLOCK
      ?auto_82862 - BLOCK
      ?auto_82864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82858 ) ( not ( = ?auto_82858 ?auto_82859 ) ) ( not ( = ?auto_82858 ?auto_82860 ) ) ( not ( = ?auto_82858 ?auto_82861 ) ) ( not ( = ?auto_82858 ?auto_82865 ) ) ( not ( = ?auto_82859 ?auto_82860 ) ) ( not ( = ?auto_82859 ?auto_82861 ) ) ( not ( = ?auto_82859 ?auto_82865 ) ) ( not ( = ?auto_82860 ?auto_82861 ) ) ( not ( = ?auto_82860 ?auto_82865 ) ) ( not ( = ?auto_82861 ?auto_82865 ) ) ( not ( = ?auto_82858 ?auto_82863 ) ) ( not ( = ?auto_82858 ?auto_82862 ) ) ( not ( = ?auto_82859 ?auto_82863 ) ) ( not ( = ?auto_82859 ?auto_82862 ) ) ( not ( = ?auto_82860 ?auto_82863 ) ) ( not ( = ?auto_82860 ?auto_82862 ) ) ( not ( = ?auto_82861 ?auto_82863 ) ) ( not ( = ?auto_82861 ?auto_82862 ) ) ( not ( = ?auto_82865 ?auto_82863 ) ) ( not ( = ?auto_82865 ?auto_82862 ) ) ( not ( = ?auto_82863 ?auto_82862 ) ) ( ON ?auto_82862 ?auto_82864 ) ( not ( = ?auto_82858 ?auto_82864 ) ) ( not ( = ?auto_82859 ?auto_82864 ) ) ( not ( = ?auto_82860 ?auto_82864 ) ) ( not ( = ?auto_82861 ?auto_82864 ) ) ( not ( = ?auto_82865 ?auto_82864 ) ) ( not ( = ?auto_82863 ?auto_82864 ) ) ( not ( = ?auto_82862 ?auto_82864 ) ) ( ON ?auto_82863 ?auto_82862 ) ( ON-TABLE ?auto_82864 ) ( ON ?auto_82865 ?auto_82863 ) ( ON ?auto_82861 ?auto_82865 ) ( ON ?auto_82860 ?auto_82861 ) ( CLEAR ?auto_82860 ) ( HOLDING ?auto_82859 ) ( CLEAR ?auto_82858 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82858 ?auto_82859 )
      ( MAKE-4PILE ?auto_82858 ?auto_82859 ?auto_82860 ?auto_82861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82866 - BLOCK
      ?auto_82867 - BLOCK
      ?auto_82868 - BLOCK
      ?auto_82869 - BLOCK
    )
    :vars
    (
      ?auto_82872 - BLOCK
      ?auto_82871 - BLOCK
      ?auto_82870 - BLOCK
      ?auto_82873 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82866 ) ( not ( = ?auto_82866 ?auto_82867 ) ) ( not ( = ?auto_82866 ?auto_82868 ) ) ( not ( = ?auto_82866 ?auto_82869 ) ) ( not ( = ?auto_82866 ?auto_82872 ) ) ( not ( = ?auto_82867 ?auto_82868 ) ) ( not ( = ?auto_82867 ?auto_82869 ) ) ( not ( = ?auto_82867 ?auto_82872 ) ) ( not ( = ?auto_82868 ?auto_82869 ) ) ( not ( = ?auto_82868 ?auto_82872 ) ) ( not ( = ?auto_82869 ?auto_82872 ) ) ( not ( = ?auto_82866 ?auto_82871 ) ) ( not ( = ?auto_82866 ?auto_82870 ) ) ( not ( = ?auto_82867 ?auto_82871 ) ) ( not ( = ?auto_82867 ?auto_82870 ) ) ( not ( = ?auto_82868 ?auto_82871 ) ) ( not ( = ?auto_82868 ?auto_82870 ) ) ( not ( = ?auto_82869 ?auto_82871 ) ) ( not ( = ?auto_82869 ?auto_82870 ) ) ( not ( = ?auto_82872 ?auto_82871 ) ) ( not ( = ?auto_82872 ?auto_82870 ) ) ( not ( = ?auto_82871 ?auto_82870 ) ) ( ON ?auto_82870 ?auto_82873 ) ( not ( = ?auto_82866 ?auto_82873 ) ) ( not ( = ?auto_82867 ?auto_82873 ) ) ( not ( = ?auto_82868 ?auto_82873 ) ) ( not ( = ?auto_82869 ?auto_82873 ) ) ( not ( = ?auto_82872 ?auto_82873 ) ) ( not ( = ?auto_82871 ?auto_82873 ) ) ( not ( = ?auto_82870 ?auto_82873 ) ) ( ON ?auto_82871 ?auto_82870 ) ( ON-TABLE ?auto_82873 ) ( ON ?auto_82872 ?auto_82871 ) ( ON ?auto_82869 ?auto_82872 ) ( ON ?auto_82868 ?auto_82869 ) ( CLEAR ?auto_82866 ) ( ON ?auto_82867 ?auto_82868 ) ( CLEAR ?auto_82867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82873 ?auto_82870 ?auto_82871 ?auto_82872 ?auto_82869 ?auto_82868 )
      ( MAKE-4PILE ?auto_82866 ?auto_82867 ?auto_82868 ?auto_82869 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82874 - BLOCK
      ?auto_82875 - BLOCK
      ?auto_82876 - BLOCK
      ?auto_82877 - BLOCK
    )
    :vars
    (
      ?auto_82879 - BLOCK
      ?auto_82880 - BLOCK
      ?auto_82881 - BLOCK
      ?auto_82878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82874 ?auto_82875 ) ) ( not ( = ?auto_82874 ?auto_82876 ) ) ( not ( = ?auto_82874 ?auto_82877 ) ) ( not ( = ?auto_82874 ?auto_82879 ) ) ( not ( = ?auto_82875 ?auto_82876 ) ) ( not ( = ?auto_82875 ?auto_82877 ) ) ( not ( = ?auto_82875 ?auto_82879 ) ) ( not ( = ?auto_82876 ?auto_82877 ) ) ( not ( = ?auto_82876 ?auto_82879 ) ) ( not ( = ?auto_82877 ?auto_82879 ) ) ( not ( = ?auto_82874 ?auto_82880 ) ) ( not ( = ?auto_82874 ?auto_82881 ) ) ( not ( = ?auto_82875 ?auto_82880 ) ) ( not ( = ?auto_82875 ?auto_82881 ) ) ( not ( = ?auto_82876 ?auto_82880 ) ) ( not ( = ?auto_82876 ?auto_82881 ) ) ( not ( = ?auto_82877 ?auto_82880 ) ) ( not ( = ?auto_82877 ?auto_82881 ) ) ( not ( = ?auto_82879 ?auto_82880 ) ) ( not ( = ?auto_82879 ?auto_82881 ) ) ( not ( = ?auto_82880 ?auto_82881 ) ) ( ON ?auto_82881 ?auto_82878 ) ( not ( = ?auto_82874 ?auto_82878 ) ) ( not ( = ?auto_82875 ?auto_82878 ) ) ( not ( = ?auto_82876 ?auto_82878 ) ) ( not ( = ?auto_82877 ?auto_82878 ) ) ( not ( = ?auto_82879 ?auto_82878 ) ) ( not ( = ?auto_82880 ?auto_82878 ) ) ( not ( = ?auto_82881 ?auto_82878 ) ) ( ON ?auto_82880 ?auto_82881 ) ( ON-TABLE ?auto_82878 ) ( ON ?auto_82879 ?auto_82880 ) ( ON ?auto_82877 ?auto_82879 ) ( ON ?auto_82876 ?auto_82877 ) ( ON ?auto_82875 ?auto_82876 ) ( CLEAR ?auto_82875 ) ( HOLDING ?auto_82874 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82874 )
      ( MAKE-4PILE ?auto_82874 ?auto_82875 ?auto_82876 ?auto_82877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_82882 - BLOCK
      ?auto_82883 - BLOCK
      ?auto_82884 - BLOCK
      ?auto_82885 - BLOCK
    )
    :vars
    (
      ?auto_82887 - BLOCK
      ?auto_82888 - BLOCK
      ?auto_82889 - BLOCK
      ?auto_82886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82882 ?auto_82883 ) ) ( not ( = ?auto_82882 ?auto_82884 ) ) ( not ( = ?auto_82882 ?auto_82885 ) ) ( not ( = ?auto_82882 ?auto_82887 ) ) ( not ( = ?auto_82883 ?auto_82884 ) ) ( not ( = ?auto_82883 ?auto_82885 ) ) ( not ( = ?auto_82883 ?auto_82887 ) ) ( not ( = ?auto_82884 ?auto_82885 ) ) ( not ( = ?auto_82884 ?auto_82887 ) ) ( not ( = ?auto_82885 ?auto_82887 ) ) ( not ( = ?auto_82882 ?auto_82888 ) ) ( not ( = ?auto_82882 ?auto_82889 ) ) ( not ( = ?auto_82883 ?auto_82888 ) ) ( not ( = ?auto_82883 ?auto_82889 ) ) ( not ( = ?auto_82884 ?auto_82888 ) ) ( not ( = ?auto_82884 ?auto_82889 ) ) ( not ( = ?auto_82885 ?auto_82888 ) ) ( not ( = ?auto_82885 ?auto_82889 ) ) ( not ( = ?auto_82887 ?auto_82888 ) ) ( not ( = ?auto_82887 ?auto_82889 ) ) ( not ( = ?auto_82888 ?auto_82889 ) ) ( ON ?auto_82889 ?auto_82886 ) ( not ( = ?auto_82882 ?auto_82886 ) ) ( not ( = ?auto_82883 ?auto_82886 ) ) ( not ( = ?auto_82884 ?auto_82886 ) ) ( not ( = ?auto_82885 ?auto_82886 ) ) ( not ( = ?auto_82887 ?auto_82886 ) ) ( not ( = ?auto_82888 ?auto_82886 ) ) ( not ( = ?auto_82889 ?auto_82886 ) ) ( ON ?auto_82888 ?auto_82889 ) ( ON-TABLE ?auto_82886 ) ( ON ?auto_82887 ?auto_82888 ) ( ON ?auto_82885 ?auto_82887 ) ( ON ?auto_82884 ?auto_82885 ) ( ON ?auto_82883 ?auto_82884 ) ( ON ?auto_82882 ?auto_82883 ) ( CLEAR ?auto_82882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82886 ?auto_82889 ?auto_82888 ?auto_82887 ?auto_82885 ?auto_82884 ?auto_82883 )
      ( MAKE-4PILE ?auto_82882 ?auto_82883 ?auto_82884 ?auto_82885 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82893 - BLOCK
      ?auto_82894 - BLOCK
      ?auto_82895 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_82895 ) ( CLEAR ?auto_82894 ) ( ON-TABLE ?auto_82893 ) ( ON ?auto_82894 ?auto_82893 ) ( not ( = ?auto_82893 ?auto_82894 ) ) ( not ( = ?auto_82893 ?auto_82895 ) ) ( not ( = ?auto_82894 ?auto_82895 ) ) )
    :subtasks
    ( ( !STACK ?auto_82895 ?auto_82894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82896 - BLOCK
      ?auto_82897 - BLOCK
      ?auto_82898 - BLOCK
    )
    :vars
    (
      ?auto_82899 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_82897 ) ( ON-TABLE ?auto_82896 ) ( ON ?auto_82897 ?auto_82896 ) ( not ( = ?auto_82896 ?auto_82897 ) ) ( not ( = ?auto_82896 ?auto_82898 ) ) ( not ( = ?auto_82897 ?auto_82898 ) ) ( ON ?auto_82898 ?auto_82899 ) ( CLEAR ?auto_82898 ) ( HAND-EMPTY ) ( not ( = ?auto_82896 ?auto_82899 ) ) ( not ( = ?auto_82897 ?auto_82899 ) ) ( not ( = ?auto_82898 ?auto_82899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82898 ?auto_82899 )
      ( MAKE-3PILE ?auto_82896 ?auto_82897 ?auto_82898 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82900 - BLOCK
      ?auto_82901 - BLOCK
      ?auto_82902 - BLOCK
    )
    :vars
    (
      ?auto_82903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82900 ) ( not ( = ?auto_82900 ?auto_82901 ) ) ( not ( = ?auto_82900 ?auto_82902 ) ) ( not ( = ?auto_82901 ?auto_82902 ) ) ( ON ?auto_82902 ?auto_82903 ) ( CLEAR ?auto_82902 ) ( not ( = ?auto_82900 ?auto_82903 ) ) ( not ( = ?auto_82901 ?auto_82903 ) ) ( not ( = ?auto_82902 ?auto_82903 ) ) ( HOLDING ?auto_82901 ) ( CLEAR ?auto_82900 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82900 ?auto_82901 )
      ( MAKE-3PILE ?auto_82900 ?auto_82901 ?auto_82902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82904 - BLOCK
      ?auto_82905 - BLOCK
      ?auto_82906 - BLOCK
    )
    :vars
    (
      ?auto_82907 - BLOCK
      ?auto_82910 - BLOCK
      ?auto_82908 - BLOCK
      ?auto_82909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_82904 ) ( not ( = ?auto_82904 ?auto_82905 ) ) ( not ( = ?auto_82904 ?auto_82906 ) ) ( not ( = ?auto_82905 ?auto_82906 ) ) ( ON ?auto_82906 ?auto_82907 ) ( not ( = ?auto_82904 ?auto_82907 ) ) ( not ( = ?auto_82905 ?auto_82907 ) ) ( not ( = ?auto_82906 ?auto_82907 ) ) ( CLEAR ?auto_82904 ) ( ON ?auto_82905 ?auto_82906 ) ( CLEAR ?auto_82905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82910 ) ( ON ?auto_82908 ?auto_82910 ) ( ON ?auto_82909 ?auto_82908 ) ( ON ?auto_82907 ?auto_82909 ) ( not ( = ?auto_82910 ?auto_82908 ) ) ( not ( = ?auto_82910 ?auto_82909 ) ) ( not ( = ?auto_82910 ?auto_82907 ) ) ( not ( = ?auto_82910 ?auto_82906 ) ) ( not ( = ?auto_82910 ?auto_82905 ) ) ( not ( = ?auto_82908 ?auto_82909 ) ) ( not ( = ?auto_82908 ?auto_82907 ) ) ( not ( = ?auto_82908 ?auto_82906 ) ) ( not ( = ?auto_82908 ?auto_82905 ) ) ( not ( = ?auto_82909 ?auto_82907 ) ) ( not ( = ?auto_82909 ?auto_82906 ) ) ( not ( = ?auto_82909 ?auto_82905 ) ) ( not ( = ?auto_82904 ?auto_82910 ) ) ( not ( = ?auto_82904 ?auto_82908 ) ) ( not ( = ?auto_82904 ?auto_82909 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82910 ?auto_82908 ?auto_82909 ?auto_82907 ?auto_82906 )
      ( MAKE-3PILE ?auto_82904 ?auto_82905 ?auto_82906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82911 - BLOCK
      ?auto_82912 - BLOCK
      ?auto_82913 - BLOCK
    )
    :vars
    (
      ?auto_82916 - BLOCK
      ?auto_82917 - BLOCK
      ?auto_82914 - BLOCK
      ?auto_82915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82911 ?auto_82912 ) ) ( not ( = ?auto_82911 ?auto_82913 ) ) ( not ( = ?auto_82912 ?auto_82913 ) ) ( ON ?auto_82913 ?auto_82916 ) ( not ( = ?auto_82911 ?auto_82916 ) ) ( not ( = ?auto_82912 ?auto_82916 ) ) ( not ( = ?auto_82913 ?auto_82916 ) ) ( ON ?auto_82912 ?auto_82913 ) ( CLEAR ?auto_82912 ) ( ON-TABLE ?auto_82917 ) ( ON ?auto_82914 ?auto_82917 ) ( ON ?auto_82915 ?auto_82914 ) ( ON ?auto_82916 ?auto_82915 ) ( not ( = ?auto_82917 ?auto_82914 ) ) ( not ( = ?auto_82917 ?auto_82915 ) ) ( not ( = ?auto_82917 ?auto_82916 ) ) ( not ( = ?auto_82917 ?auto_82913 ) ) ( not ( = ?auto_82917 ?auto_82912 ) ) ( not ( = ?auto_82914 ?auto_82915 ) ) ( not ( = ?auto_82914 ?auto_82916 ) ) ( not ( = ?auto_82914 ?auto_82913 ) ) ( not ( = ?auto_82914 ?auto_82912 ) ) ( not ( = ?auto_82915 ?auto_82916 ) ) ( not ( = ?auto_82915 ?auto_82913 ) ) ( not ( = ?auto_82915 ?auto_82912 ) ) ( not ( = ?auto_82911 ?auto_82917 ) ) ( not ( = ?auto_82911 ?auto_82914 ) ) ( not ( = ?auto_82911 ?auto_82915 ) ) ( HOLDING ?auto_82911 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_82911 )
      ( MAKE-3PILE ?auto_82911 ?auto_82912 ?auto_82913 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82918 - BLOCK
      ?auto_82919 - BLOCK
      ?auto_82920 - BLOCK
    )
    :vars
    (
      ?auto_82921 - BLOCK
      ?auto_82922 - BLOCK
      ?auto_82924 - BLOCK
      ?auto_82923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82918 ?auto_82919 ) ) ( not ( = ?auto_82918 ?auto_82920 ) ) ( not ( = ?auto_82919 ?auto_82920 ) ) ( ON ?auto_82920 ?auto_82921 ) ( not ( = ?auto_82918 ?auto_82921 ) ) ( not ( = ?auto_82919 ?auto_82921 ) ) ( not ( = ?auto_82920 ?auto_82921 ) ) ( ON ?auto_82919 ?auto_82920 ) ( ON-TABLE ?auto_82922 ) ( ON ?auto_82924 ?auto_82922 ) ( ON ?auto_82923 ?auto_82924 ) ( ON ?auto_82921 ?auto_82923 ) ( not ( = ?auto_82922 ?auto_82924 ) ) ( not ( = ?auto_82922 ?auto_82923 ) ) ( not ( = ?auto_82922 ?auto_82921 ) ) ( not ( = ?auto_82922 ?auto_82920 ) ) ( not ( = ?auto_82922 ?auto_82919 ) ) ( not ( = ?auto_82924 ?auto_82923 ) ) ( not ( = ?auto_82924 ?auto_82921 ) ) ( not ( = ?auto_82924 ?auto_82920 ) ) ( not ( = ?auto_82924 ?auto_82919 ) ) ( not ( = ?auto_82923 ?auto_82921 ) ) ( not ( = ?auto_82923 ?auto_82920 ) ) ( not ( = ?auto_82923 ?auto_82919 ) ) ( not ( = ?auto_82918 ?auto_82922 ) ) ( not ( = ?auto_82918 ?auto_82924 ) ) ( not ( = ?auto_82918 ?auto_82923 ) ) ( ON ?auto_82918 ?auto_82919 ) ( CLEAR ?auto_82918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82922 ?auto_82924 ?auto_82923 ?auto_82921 ?auto_82920 ?auto_82919 )
      ( MAKE-3PILE ?auto_82918 ?auto_82919 ?auto_82920 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82925 - BLOCK
      ?auto_82926 - BLOCK
      ?auto_82927 - BLOCK
    )
    :vars
    (
      ?auto_82930 - BLOCK
      ?auto_82931 - BLOCK
      ?auto_82929 - BLOCK
      ?auto_82928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82925 ?auto_82926 ) ) ( not ( = ?auto_82925 ?auto_82927 ) ) ( not ( = ?auto_82926 ?auto_82927 ) ) ( ON ?auto_82927 ?auto_82930 ) ( not ( = ?auto_82925 ?auto_82930 ) ) ( not ( = ?auto_82926 ?auto_82930 ) ) ( not ( = ?auto_82927 ?auto_82930 ) ) ( ON ?auto_82926 ?auto_82927 ) ( ON-TABLE ?auto_82931 ) ( ON ?auto_82929 ?auto_82931 ) ( ON ?auto_82928 ?auto_82929 ) ( ON ?auto_82930 ?auto_82928 ) ( not ( = ?auto_82931 ?auto_82929 ) ) ( not ( = ?auto_82931 ?auto_82928 ) ) ( not ( = ?auto_82931 ?auto_82930 ) ) ( not ( = ?auto_82931 ?auto_82927 ) ) ( not ( = ?auto_82931 ?auto_82926 ) ) ( not ( = ?auto_82929 ?auto_82928 ) ) ( not ( = ?auto_82929 ?auto_82930 ) ) ( not ( = ?auto_82929 ?auto_82927 ) ) ( not ( = ?auto_82929 ?auto_82926 ) ) ( not ( = ?auto_82928 ?auto_82930 ) ) ( not ( = ?auto_82928 ?auto_82927 ) ) ( not ( = ?auto_82928 ?auto_82926 ) ) ( not ( = ?auto_82925 ?auto_82931 ) ) ( not ( = ?auto_82925 ?auto_82929 ) ) ( not ( = ?auto_82925 ?auto_82928 ) ) ( HOLDING ?auto_82925 ) ( CLEAR ?auto_82926 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_82931 ?auto_82929 ?auto_82928 ?auto_82930 ?auto_82927 ?auto_82926 ?auto_82925 )
      ( MAKE-3PILE ?auto_82925 ?auto_82926 ?auto_82927 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82932 - BLOCK
      ?auto_82933 - BLOCK
      ?auto_82934 - BLOCK
    )
    :vars
    (
      ?auto_82938 - BLOCK
      ?auto_82936 - BLOCK
      ?auto_82935 - BLOCK
      ?auto_82937 - BLOCK
      ?auto_82939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82932 ?auto_82933 ) ) ( not ( = ?auto_82932 ?auto_82934 ) ) ( not ( = ?auto_82933 ?auto_82934 ) ) ( ON ?auto_82934 ?auto_82938 ) ( not ( = ?auto_82932 ?auto_82938 ) ) ( not ( = ?auto_82933 ?auto_82938 ) ) ( not ( = ?auto_82934 ?auto_82938 ) ) ( ON ?auto_82933 ?auto_82934 ) ( ON-TABLE ?auto_82936 ) ( ON ?auto_82935 ?auto_82936 ) ( ON ?auto_82937 ?auto_82935 ) ( ON ?auto_82938 ?auto_82937 ) ( not ( = ?auto_82936 ?auto_82935 ) ) ( not ( = ?auto_82936 ?auto_82937 ) ) ( not ( = ?auto_82936 ?auto_82938 ) ) ( not ( = ?auto_82936 ?auto_82934 ) ) ( not ( = ?auto_82936 ?auto_82933 ) ) ( not ( = ?auto_82935 ?auto_82937 ) ) ( not ( = ?auto_82935 ?auto_82938 ) ) ( not ( = ?auto_82935 ?auto_82934 ) ) ( not ( = ?auto_82935 ?auto_82933 ) ) ( not ( = ?auto_82937 ?auto_82938 ) ) ( not ( = ?auto_82937 ?auto_82934 ) ) ( not ( = ?auto_82937 ?auto_82933 ) ) ( not ( = ?auto_82932 ?auto_82936 ) ) ( not ( = ?auto_82932 ?auto_82935 ) ) ( not ( = ?auto_82932 ?auto_82937 ) ) ( CLEAR ?auto_82933 ) ( ON ?auto_82932 ?auto_82939 ) ( CLEAR ?auto_82932 ) ( HAND-EMPTY ) ( not ( = ?auto_82932 ?auto_82939 ) ) ( not ( = ?auto_82933 ?auto_82939 ) ) ( not ( = ?auto_82934 ?auto_82939 ) ) ( not ( = ?auto_82938 ?auto_82939 ) ) ( not ( = ?auto_82936 ?auto_82939 ) ) ( not ( = ?auto_82935 ?auto_82939 ) ) ( not ( = ?auto_82937 ?auto_82939 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_82932 ?auto_82939 )
      ( MAKE-3PILE ?auto_82932 ?auto_82933 ?auto_82934 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82940 - BLOCK
      ?auto_82941 - BLOCK
      ?auto_82942 - BLOCK
    )
    :vars
    (
      ?auto_82944 - BLOCK
      ?auto_82943 - BLOCK
      ?auto_82946 - BLOCK
      ?auto_82945 - BLOCK
      ?auto_82947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82940 ?auto_82941 ) ) ( not ( = ?auto_82940 ?auto_82942 ) ) ( not ( = ?auto_82941 ?auto_82942 ) ) ( ON ?auto_82942 ?auto_82944 ) ( not ( = ?auto_82940 ?auto_82944 ) ) ( not ( = ?auto_82941 ?auto_82944 ) ) ( not ( = ?auto_82942 ?auto_82944 ) ) ( ON-TABLE ?auto_82943 ) ( ON ?auto_82946 ?auto_82943 ) ( ON ?auto_82945 ?auto_82946 ) ( ON ?auto_82944 ?auto_82945 ) ( not ( = ?auto_82943 ?auto_82946 ) ) ( not ( = ?auto_82943 ?auto_82945 ) ) ( not ( = ?auto_82943 ?auto_82944 ) ) ( not ( = ?auto_82943 ?auto_82942 ) ) ( not ( = ?auto_82943 ?auto_82941 ) ) ( not ( = ?auto_82946 ?auto_82945 ) ) ( not ( = ?auto_82946 ?auto_82944 ) ) ( not ( = ?auto_82946 ?auto_82942 ) ) ( not ( = ?auto_82946 ?auto_82941 ) ) ( not ( = ?auto_82945 ?auto_82944 ) ) ( not ( = ?auto_82945 ?auto_82942 ) ) ( not ( = ?auto_82945 ?auto_82941 ) ) ( not ( = ?auto_82940 ?auto_82943 ) ) ( not ( = ?auto_82940 ?auto_82946 ) ) ( not ( = ?auto_82940 ?auto_82945 ) ) ( ON ?auto_82940 ?auto_82947 ) ( CLEAR ?auto_82940 ) ( not ( = ?auto_82940 ?auto_82947 ) ) ( not ( = ?auto_82941 ?auto_82947 ) ) ( not ( = ?auto_82942 ?auto_82947 ) ) ( not ( = ?auto_82944 ?auto_82947 ) ) ( not ( = ?auto_82943 ?auto_82947 ) ) ( not ( = ?auto_82946 ?auto_82947 ) ) ( not ( = ?auto_82945 ?auto_82947 ) ) ( HOLDING ?auto_82941 ) ( CLEAR ?auto_82942 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_82943 ?auto_82946 ?auto_82945 ?auto_82944 ?auto_82942 ?auto_82941 )
      ( MAKE-3PILE ?auto_82940 ?auto_82941 ?auto_82942 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82948 - BLOCK
      ?auto_82949 - BLOCK
      ?auto_82950 - BLOCK
    )
    :vars
    (
      ?auto_82951 - BLOCK
      ?auto_82955 - BLOCK
      ?auto_82952 - BLOCK
      ?auto_82953 - BLOCK
      ?auto_82954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82948 ?auto_82949 ) ) ( not ( = ?auto_82948 ?auto_82950 ) ) ( not ( = ?auto_82949 ?auto_82950 ) ) ( ON ?auto_82950 ?auto_82951 ) ( not ( = ?auto_82948 ?auto_82951 ) ) ( not ( = ?auto_82949 ?auto_82951 ) ) ( not ( = ?auto_82950 ?auto_82951 ) ) ( ON-TABLE ?auto_82955 ) ( ON ?auto_82952 ?auto_82955 ) ( ON ?auto_82953 ?auto_82952 ) ( ON ?auto_82951 ?auto_82953 ) ( not ( = ?auto_82955 ?auto_82952 ) ) ( not ( = ?auto_82955 ?auto_82953 ) ) ( not ( = ?auto_82955 ?auto_82951 ) ) ( not ( = ?auto_82955 ?auto_82950 ) ) ( not ( = ?auto_82955 ?auto_82949 ) ) ( not ( = ?auto_82952 ?auto_82953 ) ) ( not ( = ?auto_82952 ?auto_82951 ) ) ( not ( = ?auto_82952 ?auto_82950 ) ) ( not ( = ?auto_82952 ?auto_82949 ) ) ( not ( = ?auto_82953 ?auto_82951 ) ) ( not ( = ?auto_82953 ?auto_82950 ) ) ( not ( = ?auto_82953 ?auto_82949 ) ) ( not ( = ?auto_82948 ?auto_82955 ) ) ( not ( = ?auto_82948 ?auto_82952 ) ) ( not ( = ?auto_82948 ?auto_82953 ) ) ( ON ?auto_82948 ?auto_82954 ) ( not ( = ?auto_82948 ?auto_82954 ) ) ( not ( = ?auto_82949 ?auto_82954 ) ) ( not ( = ?auto_82950 ?auto_82954 ) ) ( not ( = ?auto_82951 ?auto_82954 ) ) ( not ( = ?auto_82955 ?auto_82954 ) ) ( not ( = ?auto_82952 ?auto_82954 ) ) ( not ( = ?auto_82953 ?auto_82954 ) ) ( CLEAR ?auto_82950 ) ( ON ?auto_82949 ?auto_82948 ) ( CLEAR ?auto_82949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_82954 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_82954 ?auto_82948 )
      ( MAKE-3PILE ?auto_82948 ?auto_82949 ?auto_82950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82956 - BLOCK
      ?auto_82957 - BLOCK
      ?auto_82958 - BLOCK
    )
    :vars
    (
      ?auto_82962 - BLOCK
      ?auto_82963 - BLOCK
      ?auto_82959 - BLOCK
      ?auto_82960 - BLOCK
      ?auto_82961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82956 ?auto_82957 ) ) ( not ( = ?auto_82956 ?auto_82958 ) ) ( not ( = ?auto_82957 ?auto_82958 ) ) ( not ( = ?auto_82956 ?auto_82962 ) ) ( not ( = ?auto_82957 ?auto_82962 ) ) ( not ( = ?auto_82958 ?auto_82962 ) ) ( ON-TABLE ?auto_82963 ) ( ON ?auto_82959 ?auto_82963 ) ( ON ?auto_82960 ?auto_82959 ) ( ON ?auto_82962 ?auto_82960 ) ( not ( = ?auto_82963 ?auto_82959 ) ) ( not ( = ?auto_82963 ?auto_82960 ) ) ( not ( = ?auto_82963 ?auto_82962 ) ) ( not ( = ?auto_82963 ?auto_82958 ) ) ( not ( = ?auto_82963 ?auto_82957 ) ) ( not ( = ?auto_82959 ?auto_82960 ) ) ( not ( = ?auto_82959 ?auto_82962 ) ) ( not ( = ?auto_82959 ?auto_82958 ) ) ( not ( = ?auto_82959 ?auto_82957 ) ) ( not ( = ?auto_82960 ?auto_82962 ) ) ( not ( = ?auto_82960 ?auto_82958 ) ) ( not ( = ?auto_82960 ?auto_82957 ) ) ( not ( = ?auto_82956 ?auto_82963 ) ) ( not ( = ?auto_82956 ?auto_82959 ) ) ( not ( = ?auto_82956 ?auto_82960 ) ) ( ON ?auto_82956 ?auto_82961 ) ( not ( = ?auto_82956 ?auto_82961 ) ) ( not ( = ?auto_82957 ?auto_82961 ) ) ( not ( = ?auto_82958 ?auto_82961 ) ) ( not ( = ?auto_82962 ?auto_82961 ) ) ( not ( = ?auto_82963 ?auto_82961 ) ) ( not ( = ?auto_82959 ?auto_82961 ) ) ( not ( = ?auto_82960 ?auto_82961 ) ) ( ON ?auto_82957 ?auto_82956 ) ( CLEAR ?auto_82957 ) ( ON-TABLE ?auto_82961 ) ( HOLDING ?auto_82958 ) ( CLEAR ?auto_82962 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82963 ?auto_82959 ?auto_82960 ?auto_82962 ?auto_82958 )
      ( MAKE-3PILE ?auto_82956 ?auto_82957 ?auto_82958 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82964 - BLOCK
      ?auto_82965 - BLOCK
      ?auto_82966 - BLOCK
    )
    :vars
    (
      ?auto_82971 - BLOCK
      ?auto_82969 - BLOCK
      ?auto_82968 - BLOCK
      ?auto_82970 - BLOCK
      ?auto_82967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82964 ?auto_82965 ) ) ( not ( = ?auto_82964 ?auto_82966 ) ) ( not ( = ?auto_82965 ?auto_82966 ) ) ( not ( = ?auto_82964 ?auto_82971 ) ) ( not ( = ?auto_82965 ?auto_82971 ) ) ( not ( = ?auto_82966 ?auto_82971 ) ) ( ON-TABLE ?auto_82969 ) ( ON ?auto_82968 ?auto_82969 ) ( ON ?auto_82970 ?auto_82968 ) ( ON ?auto_82971 ?auto_82970 ) ( not ( = ?auto_82969 ?auto_82968 ) ) ( not ( = ?auto_82969 ?auto_82970 ) ) ( not ( = ?auto_82969 ?auto_82971 ) ) ( not ( = ?auto_82969 ?auto_82966 ) ) ( not ( = ?auto_82969 ?auto_82965 ) ) ( not ( = ?auto_82968 ?auto_82970 ) ) ( not ( = ?auto_82968 ?auto_82971 ) ) ( not ( = ?auto_82968 ?auto_82966 ) ) ( not ( = ?auto_82968 ?auto_82965 ) ) ( not ( = ?auto_82970 ?auto_82971 ) ) ( not ( = ?auto_82970 ?auto_82966 ) ) ( not ( = ?auto_82970 ?auto_82965 ) ) ( not ( = ?auto_82964 ?auto_82969 ) ) ( not ( = ?auto_82964 ?auto_82968 ) ) ( not ( = ?auto_82964 ?auto_82970 ) ) ( ON ?auto_82964 ?auto_82967 ) ( not ( = ?auto_82964 ?auto_82967 ) ) ( not ( = ?auto_82965 ?auto_82967 ) ) ( not ( = ?auto_82966 ?auto_82967 ) ) ( not ( = ?auto_82971 ?auto_82967 ) ) ( not ( = ?auto_82969 ?auto_82967 ) ) ( not ( = ?auto_82968 ?auto_82967 ) ) ( not ( = ?auto_82970 ?auto_82967 ) ) ( ON ?auto_82965 ?auto_82964 ) ( ON-TABLE ?auto_82967 ) ( CLEAR ?auto_82971 ) ( ON ?auto_82966 ?auto_82965 ) ( CLEAR ?auto_82966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82967 ?auto_82964 ?auto_82965 )
      ( MAKE-3PILE ?auto_82964 ?auto_82965 ?auto_82966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82972 - BLOCK
      ?auto_82973 - BLOCK
      ?auto_82974 - BLOCK
    )
    :vars
    (
      ?auto_82976 - BLOCK
      ?auto_82977 - BLOCK
      ?auto_82979 - BLOCK
      ?auto_82978 - BLOCK
      ?auto_82975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82972 ?auto_82973 ) ) ( not ( = ?auto_82972 ?auto_82974 ) ) ( not ( = ?auto_82973 ?auto_82974 ) ) ( not ( = ?auto_82972 ?auto_82976 ) ) ( not ( = ?auto_82973 ?auto_82976 ) ) ( not ( = ?auto_82974 ?auto_82976 ) ) ( ON-TABLE ?auto_82977 ) ( ON ?auto_82979 ?auto_82977 ) ( ON ?auto_82978 ?auto_82979 ) ( not ( = ?auto_82977 ?auto_82979 ) ) ( not ( = ?auto_82977 ?auto_82978 ) ) ( not ( = ?auto_82977 ?auto_82976 ) ) ( not ( = ?auto_82977 ?auto_82974 ) ) ( not ( = ?auto_82977 ?auto_82973 ) ) ( not ( = ?auto_82979 ?auto_82978 ) ) ( not ( = ?auto_82979 ?auto_82976 ) ) ( not ( = ?auto_82979 ?auto_82974 ) ) ( not ( = ?auto_82979 ?auto_82973 ) ) ( not ( = ?auto_82978 ?auto_82976 ) ) ( not ( = ?auto_82978 ?auto_82974 ) ) ( not ( = ?auto_82978 ?auto_82973 ) ) ( not ( = ?auto_82972 ?auto_82977 ) ) ( not ( = ?auto_82972 ?auto_82979 ) ) ( not ( = ?auto_82972 ?auto_82978 ) ) ( ON ?auto_82972 ?auto_82975 ) ( not ( = ?auto_82972 ?auto_82975 ) ) ( not ( = ?auto_82973 ?auto_82975 ) ) ( not ( = ?auto_82974 ?auto_82975 ) ) ( not ( = ?auto_82976 ?auto_82975 ) ) ( not ( = ?auto_82977 ?auto_82975 ) ) ( not ( = ?auto_82979 ?auto_82975 ) ) ( not ( = ?auto_82978 ?auto_82975 ) ) ( ON ?auto_82973 ?auto_82972 ) ( ON-TABLE ?auto_82975 ) ( ON ?auto_82974 ?auto_82973 ) ( CLEAR ?auto_82974 ) ( HOLDING ?auto_82976 ) ( CLEAR ?auto_82978 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82977 ?auto_82979 ?auto_82978 ?auto_82976 )
      ( MAKE-3PILE ?auto_82972 ?auto_82973 ?auto_82974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82980 - BLOCK
      ?auto_82981 - BLOCK
      ?auto_82982 - BLOCK
    )
    :vars
    (
      ?auto_82985 - BLOCK
      ?auto_82987 - BLOCK
      ?auto_82986 - BLOCK
      ?auto_82984 - BLOCK
      ?auto_82983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82980 ?auto_82981 ) ) ( not ( = ?auto_82980 ?auto_82982 ) ) ( not ( = ?auto_82981 ?auto_82982 ) ) ( not ( = ?auto_82980 ?auto_82985 ) ) ( not ( = ?auto_82981 ?auto_82985 ) ) ( not ( = ?auto_82982 ?auto_82985 ) ) ( ON-TABLE ?auto_82987 ) ( ON ?auto_82986 ?auto_82987 ) ( ON ?auto_82984 ?auto_82986 ) ( not ( = ?auto_82987 ?auto_82986 ) ) ( not ( = ?auto_82987 ?auto_82984 ) ) ( not ( = ?auto_82987 ?auto_82985 ) ) ( not ( = ?auto_82987 ?auto_82982 ) ) ( not ( = ?auto_82987 ?auto_82981 ) ) ( not ( = ?auto_82986 ?auto_82984 ) ) ( not ( = ?auto_82986 ?auto_82985 ) ) ( not ( = ?auto_82986 ?auto_82982 ) ) ( not ( = ?auto_82986 ?auto_82981 ) ) ( not ( = ?auto_82984 ?auto_82985 ) ) ( not ( = ?auto_82984 ?auto_82982 ) ) ( not ( = ?auto_82984 ?auto_82981 ) ) ( not ( = ?auto_82980 ?auto_82987 ) ) ( not ( = ?auto_82980 ?auto_82986 ) ) ( not ( = ?auto_82980 ?auto_82984 ) ) ( ON ?auto_82980 ?auto_82983 ) ( not ( = ?auto_82980 ?auto_82983 ) ) ( not ( = ?auto_82981 ?auto_82983 ) ) ( not ( = ?auto_82982 ?auto_82983 ) ) ( not ( = ?auto_82985 ?auto_82983 ) ) ( not ( = ?auto_82987 ?auto_82983 ) ) ( not ( = ?auto_82986 ?auto_82983 ) ) ( not ( = ?auto_82984 ?auto_82983 ) ) ( ON ?auto_82981 ?auto_82980 ) ( ON-TABLE ?auto_82983 ) ( ON ?auto_82982 ?auto_82981 ) ( CLEAR ?auto_82984 ) ( ON ?auto_82985 ?auto_82982 ) ( CLEAR ?auto_82985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_82983 ?auto_82980 ?auto_82981 ?auto_82982 )
      ( MAKE-3PILE ?auto_82980 ?auto_82981 ?auto_82982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82988 - BLOCK
      ?auto_82989 - BLOCK
      ?auto_82990 - BLOCK
    )
    :vars
    (
      ?auto_82993 - BLOCK
      ?auto_82995 - BLOCK
      ?auto_82992 - BLOCK
      ?auto_82991 - BLOCK
      ?auto_82994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82988 ?auto_82989 ) ) ( not ( = ?auto_82988 ?auto_82990 ) ) ( not ( = ?auto_82989 ?auto_82990 ) ) ( not ( = ?auto_82988 ?auto_82993 ) ) ( not ( = ?auto_82989 ?auto_82993 ) ) ( not ( = ?auto_82990 ?auto_82993 ) ) ( ON-TABLE ?auto_82995 ) ( ON ?auto_82992 ?auto_82995 ) ( not ( = ?auto_82995 ?auto_82992 ) ) ( not ( = ?auto_82995 ?auto_82991 ) ) ( not ( = ?auto_82995 ?auto_82993 ) ) ( not ( = ?auto_82995 ?auto_82990 ) ) ( not ( = ?auto_82995 ?auto_82989 ) ) ( not ( = ?auto_82992 ?auto_82991 ) ) ( not ( = ?auto_82992 ?auto_82993 ) ) ( not ( = ?auto_82992 ?auto_82990 ) ) ( not ( = ?auto_82992 ?auto_82989 ) ) ( not ( = ?auto_82991 ?auto_82993 ) ) ( not ( = ?auto_82991 ?auto_82990 ) ) ( not ( = ?auto_82991 ?auto_82989 ) ) ( not ( = ?auto_82988 ?auto_82995 ) ) ( not ( = ?auto_82988 ?auto_82992 ) ) ( not ( = ?auto_82988 ?auto_82991 ) ) ( ON ?auto_82988 ?auto_82994 ) ( not ( = ?auto_82988 ?auto_82994 ) ) ( not ( = ?auto_82989 ?auto_82994 ) ) ( not ( = ?auto_82990 ?auto_82994 ) ) ( not ( = ?auto_82993 ?auto_82994 ) ) ( not ( = ?auto_82995 ?auto_82994 ) ) ( not ( = ?auto_82992 ?auto_82994 ) ) ( not ( = ?auto_82991 ?auto_82994 ) ) ( ON ?auto_82989 ?auto_82988 ) ( ON-TABLE ?auto_82994 ) ( ON ?auto_82990 ?auto_82989 ) ( ON ?auto_82993 ?auto_82990 ) ( CLEAR ?auto_82993 ) ( HOLDING ?auto_82991 ) ( CLEAR ?auto_82992 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_82995 ?auto_82992 ?auto_82991 )
      ( MAKE-3PILE ?auto_82988 ?auto_82989 ?auto_82990 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_82996 - BLOCK
      ?auto_82997 - BLOCK
      ?auto_82998 - BLOCK
    )
    :vars
    (
      ?auto_83003 - BLOCK
      ?auto_83001 - BLOCK
      ?auto_83002 - BLOCK
      ?auto_83000 - BLOCK
      ?auto_82999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_82996 ?auto_82997 ) ) ( not ( = ?auto_82996 ?auto_82998 ) ) ( not ( = ?auto_82997 ?auto_82998 ) ) ( not ( = ?auto_82996 ?auto_83003 ) ) ( not ( = ?auto_82997 ?auto_83003 ) ) ( not ( = ?auto_82998 ?auto_83003 ) ) ( ON-TABLE ?auto_83001 ) ( ON ?auto_83002 ?auto_83001 ) ( not ( = ?auto_83001 ?auto_83002 ) ) ( not ( = ?auto_83001 ?auto_83000 ) ) ( not ( = ?auto_83001 ?auto_83003 ) ) ( not ( = ?auto_83001 ?auto_82998 ) ) ( not ( = ?auto_83001 ?auto_82997 ) ) ( not ( = ?auto_83002 ?auto_83000 ) ) ( not ( = ?auto_83002 ?auto_83003 ) ) ( not ( = ?auto_83002 ?auto_82998 ) ) ( not ( = ?auto_83002 ?auto_82997 ) ) ( not ( = ?auto_83000 ?auto_83003 ) ) ( not ( = ?auto_83000 ?auto_82998 ) ) ( not ( = ?auto_83000 ?auto_82997 ) ) ( not ( = ?auto_82996 ?auto_83001 ) ) ( not ( = ?auto_82996 ?auto_83002 ) ) ( not ( = ?auto_82996 ?auto_83000 ) ) ( ON ?auto_82996 ?auto_82999 ) ( not ( = ?auto_82996 ?auto_82999 ) ) ( not ( = ?auto_82997 ?auto_82999 ) ) ( not ( = ?auto_82998 ?auto_82999 ) ) ( not ( = ?auto_83003 ?auto_82999 ) ) ( not ( = ?auto_83001 ?auto_82999 ) ) ( not ( = ?auto_83002 ?auto_82999 ) ) ( not ( = ?auto_83000 ?auto_82999 ) ) ( ON ?auto_82997 ?auto_82996 ) ( ON-TABLE ?auto_82999 ) ( ON ?auto_82998 ?auto_82997 ) ( ON ?auto_83003 ?auto_82998 ) ( CLEAR ?auto_83002 ) ( ON ?auto_83000 ?auto_83003 ) ( CLEAR ?auto_83000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_82999 ?auto_82996 ?auto_82997 ?auto_82998 ?auto_83003 )
      ( MAKE-3PILE ?auto_82996 ?auto_82997 ?auto_82998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83004 - BLOCK
      ?auto_83005 - BLOCK
      ?auto_83006 - BLOCK
    )
    :vars
    (
      ?auto_83011 - BLOCK
      ?auto_83009 - BLOCK
      ?auto_83007 - BLOCK
      ?auto_83010 - BLOCK
      ?auto_83008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83004 ?auto_83005 ) ) ( not ( = ?auto_83004 ?auto_83006 ) ) ( not ( = ?auto_83005 ?auto_83006 ) ) ( not ( = ?auto_83004 ?auto_83011 ) ) ( not ( = ?auto_83005 ?auto_83011 ) ) ( not ( = ?auto_83006 ?auto_83011 ) ) ( ON-TABLE ?auto_83009 ) ( not ( = ?auto_83009 ?auto_83007 ) ) ( not ( = ?auto_83009 ?auto_83010 ) ) ( not ( = ?auto_83009 ?auto_83011 ) ) ( not ( = ?auto_83009 ?auto_83006 ) ) ( not ( = ?auto_83009 ?auto_83005 ) ) ( not ( = ?auto_83007 ?auto_83010 ) ) ( not ( = ?auto_83007 ?auto_83011 ) ) ( not ( = ?auto_83007 ?auto_83006 ) ) ( not ( = ?auto_83007 ?auto_83005 ) ) ( not ( = ?auto_83010 ?auto_83011 ) ) ( not ( = ?auto_83010 ?auto_83006 ) ) ( not ( = ?auto_83010 ?auto_83005 ) ) ( not ( = ?auto_83004 ?auto_83009 ) ) ( not ( = ?auto_83004 ?auto_83007 ) ) ( not ( = ?auto_83004 ?auto_83010 ) ) ( ON ?auto_83004 ?auto_83008 ) ( not ( = ?auto_83004 ?auto_83008 ) ) ( not ( = ?auto_83005 ?auto_83008 ) ) ( not ( = ?auto_83006 ?auto_83008 ) ) ( not ( = ?auto_83011 ?auto_83008 ) ) ( not ( = ?auto_83009 ?auto_83008 ) ) ( not ( = ?auto_83007 ?auto_83008 ) ) ( not ( = ?auto_83010 ?auto_83008 ) ) ( ON ?auto_83005 ?auto_83004 ) ( ON-TABLE ?auto_83008 ) ( ON ?auto_83006 ?auto_83005 ) ( ON ?auto_83011 ?auto_83006 ) ( ON ?auto_83010 ?auto_83011 ) ( CLEAR ?auto_83010 ) ( HOLDING ?auto_83007 ) ( CLEAR ?auto_83009 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83009 ?auto_83007 )
      ( MAKE-3PILE ?auto_83004 ?auto_83005 ?auto_83006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83012 - BLOCK
      ?auto_83013 - BLOCK
      ?auto_83014 - BLOCK
    )
    :vars
    (
      ?auto_83017 - BLOCK
      ?auto_83019 - BLOCK
      ?auto_83016 - BLOCK
      ?auto_83018 - BLOCK
      ?auto_83015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83012 ?auto_83013 ) ) ( not ( = ?auto_83012 ?auto_83014 ) ) ( not ( = ?auto_83013 ?auto_83014 ) ) ( not ( = ?auto_83012 ?auto_83017 ) ) ( not ( = ?auto_83013 ?auto_83017 ) ) ( not ( = ?auto_83014 ?auto_83017 ) ) ( ON-TABLE ?auto_83019 ) ( not ( = ?auto_83019 ?auto_83016 ) ) ( not ( = ?auto_83019 ?auto_83018 ) ) ( not ( = ?auto_83019 ?auto_83017 ) ) ( not ( = ?auto_83019 ?auto_83014 ) ) ( not ( = ?auto_83019 ?auto_83013 ) ) ( not ( = ?auto_83016 ?auto_83018 ) ) ( not ( = ?auto_83016 ?auto_83017 ) ) ( not ( = ?auto_83016 ?auto_83014 ) ) ( not ( = ?auto_83016 ?auto_83013 ) ) ( not ( = ?auto_83018 ?auto_83017 ) ) ( not ( = ?auto_83018 ?auto_83014 ) ) ( not ( = ?auto_83018 ?auto_83013 ) ) ( not ( = ?auto_83012 ?auto_83019 ) ) ( not ( = ?auto_83012 ?auto_83016 ) ) ( not ( = ?auto_83012 ?auto_83018 ) ) ( ON ?auto_83012 ?auto_83015 ) ( not ( = ?auto_83012 ?auto_83015 ) ) ( not ( = ?auto_83013 ?auto_83015 ) ) ( not ( = ?auto_83014 ?auto_83015 ) ) ( not ( = ?auto_83017 ?auto_83015 ) ) ( not ( = ?auto_83019 ?auto_83015 ) ) ( not ( = ?auto_83016 ?auto_83015 ) ) ( not ( = ?auto_83018 ?auto_83015 ) ) ( ON ?auto_83013 ?auto_83012 ) ( ON-TABLE ?auto_83015 ) ( ON ?auto_83014 ?auto_83013 ) ( ON ?auto_83017 ?auto_83014 ) ( ON ?auto_83018 ?auto_83017 ) ( CLEAR ?auto_83019 ) ( ON ?auto_83016 ?auto_83018 ) ( CLEAR ?auto_83016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83015 ?auto_83012 ?auto_83013 ?auto_83014 ?auto_83017 ?auto_83018 )
      ( MAKE-3PILE ?auto_83012 ?auto_83013 ?auto_83014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83020 - BLOCK
      ?auto_83021 - BLOCK
      ?auto_83022 - BLOCK
    )
    :vars
    (
      ?auto_83024 - BLOCK
      ?auto_83026 - BLOCK
      ?auto_83023 - BLOCK
      ?auto_83027 - BLOCK
      ?auto_83025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83020 ?auto_83021 ) ) ( not ( = ?auto_83020 ?auto_83022 ) ) ( not ( = ?auto_83021 ?auto_83022 ) ) ( not ( = ?auto_83020 ?auto_83024 ) ) ( not ( = ?auto_83021 ?auto_83024 ) ) ( not ( = ?auto_83022 ?auto_83024 ) ) ( not ( = ?auto_83026 ?auto_83023 ) ) ( not ( = ?auto_83026 ?auto_83027 ) ) ( not ( = ?auto_83026 ?auto_83024 ) ) ( not ( = ?auto_83026 ?auto_83022 ) ) ( not ( = ?auto_83026 ?auto_83021 ) ) ( not ( = ?auto_83023 ?auto_83027 ) ) ( not ( = ?auto_83023 ?auto_83024 ) ) ( not ( = ?auto_83023 ?auto_83022 ) ) ( not ( = ?auto_83023 ?auto_83021 ) ) ( not ( = ?auto_83027 ?auto_83024 ) ) ( not ( = ?auto_83027 ?auto_83022 ) ) ( not ( = ?auto_83027 ?auto_83021 ) ) ( not ( = ?auto_83020 ?auto_83026 ) ) ( not ( = ?auto_83020 ?auto_83023 ) ) ( not ( = ?auto_83020 ?auto_83027 ) ) ( ON ?auto_83020 ?auto_83025 ) ( not ( = ?auto_83020 ?auto_83025 ) ) ( not ( = ?auto_83021 ?auto_83025 ) ) ( not ( = ?auto_83022 ?auto_83025 ) ) ( not ( = ?auto_83024 ?auto_83025 ) ) ( not ( = ?auto_83026 ?auto_83025 ) ) ( not ( = ?auto_83023 ?auto_83025 ) ) ( not ( = ?auto_83027 ?auto_83025 ) ) ( ON ?auto_83021 ?auto_83020 ) ( ON-TABLE ?auto_83025 ) ( ON ?auto_83022 ?auto_83021 ) ( ON ?auto_83024 ?auto_83022 ) ( ON ?auto_83027 ?auto_83024 ) ( ON ?auto_83023 ?auto_83027 ) ( CLEAR ?auto_83023 ) ( HOLDING ?auto_83026 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83026 )
      ( MAKE-3PILE ?auto_83020 ?auto_83021 ?auto_83022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83028 - BLOCK
      ?auto_83029 - BLOCK
      ?auto_83030 - BLOCK
    )
    :vars
    (
      ?auto_83035 - BLOCK
      ?auto_83031 - BLOCK
      ?auto_83034 - BLOCK
      ?auto_83033 - BLOCK
      ?auto_83032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83028 ?auto_83029 ) ) ( not ( = ?auto_83028 ?auto_83030 ) ) ( not ( = ?auto_83029 ?auto_83030 ) ) ( not ( = ?auto_83028 ?auto_83035 ) ) ( not ( = ?auto_83029 ?auto_83035 ) ) ( not ( = ?auto_83030 ?auto_83035 ) ) ( not ( = ?auto_83031 ?auto_83034 ) ) ( not ( = ?auto_83031 ?auto_83033 ) ) ( not ( = ?auto_83031 ?auto_83035 ) ) ( not ( = ?auto_83031 ?auto_83030 ) ) ( not ( = ?auto_83031 ?auto_83029 ) ) ( not ( = ?auto_83034 ?auto_83033 ) ) ( not ( = ?auto_83034 ?auto_83035 ) ) ( not ( = ?auto_83034 ?auto_83030 ) ) ( not ( = ?auto_83034 ?auto_83029 ) ) ( not ( = ?auto_83033 ?auto_83035 ) ) ( not ( = ?auto_83033 ?auto_83030 ) ) ( not ( = ?auto_83033 ?auto_83029 ) ) ( not ( = ?auto_83028 ?auto_83031 ) ) ( not ( = ?auto_83028 ?auto_83034 ) ) ( not ( = ?auto_83028 ?auto_83033 ) ) ( ON ?auto_83028 ?auto_83032 ) ( not ( = ?auto_83028 ?auto_83032 ) ) ( not ( = ?auto_83029 ?auto_83032 ) ) ( not ( = ?auto_83030 ?auto_83032 ) ) ( not ( = ?auto_83035 ?auto_83032 ) ) ( not ( = ?auto_83031 ?auto_83032 ) ) ( not ( = ?auto_83034 ?auto_83032 ) ) ( not ( = ?auto_83033 ?auto_83032 ) ) ( ON ?auto_83029 ?auto_83028 ) ( ON-TABLE ?auto_83032 ) ( ON ?auto_83030 ?auto_83029 ) ( ON ?auto_83035 ?auto_83030 ) ( ON ?auto_83033 ?auto_83035 ) ( ON ?auto_83034 ?auto_83033 ) ( ON ?auto_83031 ?auto_83034 ) ( CLEAR ?auto_83031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83032 ?auto_83028 ?auto_83029 ?auto_83030 ?auto_83035 ?auto_83033 ?auto_83034 )
      ( MAKE-3PILE ?auto_83028 ?auto_83029 ?auto_83030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83039 - BLOCK
      ?auto_83040 - BLOCK
      ?auto_83041 - BLOCK
    )
    :vars
    (
      ?auto_83042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83042 ?auto_83041 ) ( CLEAR ?auto_83042 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83039 ) ( ON ?auto_83040 ?auto_83039 ) ( ON ?auto_83041 ?auto_83040 ) ( not ( = ?auto_83039 ?auto_83040 ) ) ( not ( = ?auto_83039 ?auto_83041 ) ) ( not ( = ?auto_83039 ?auto_83042 ) ) ( not ( = ?auto_83040 ?auto_83041 ) ) ( not ( = ?auto_83040 ?auto_83042 ) ) ( not ( = ?auto_83041 ?auto_83042 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83042 ?auto_83041 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83043 - BLOCK
      ?auto_83044 - BLOCK
      ?auto_83045 - BLOCK
    )
    :vars
    (
      ?auto_83046 - BLOCK
      ?auto_83047 - BLOCK
      ?auto_83048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83046 ?auto_83045 ) ( CLEAR ?auto_83046 ) ( ON-TABLE ?auto_83043 ) ( ON ?auto_83044 ?auto_83043 ) ( ON ?auto_83045 ?auto_83044 ) ( not ( = ?auto_83043 ?auto_83044 ) ) ( not ( = ?auto_83043 ?auto_83045 ) ) ( not ( = ?auto_83043 ?auto_83046 ) ) ( not ( = ?auto_83044 ?auto_83045 ) ) ( not ( = ?auto_83044 ?auto_83046 ) ) ( not ( = ?auto_83045 ?auto_83046 ) ) ( HOLDING ?auto_83047 ) ( CLEAR ?auto_83048 ) ( not ( = ?auto_83043 ?auto_83047 ) ) ( not ( = ?auto_83043 ?auto_83048 ) ) ( not ( = ?auto_83044 ?auto_83047 ) ) ( not ( = ?auto_83044 ?auto_83048 ) ) ( not ( = ?auto_83045 ?auto_83047 ) ) ( not ( = ?auto_83045 ?auto_83048 ) ) ( not ( = ?auto_83046 ?auto_83047 ) ) ( not ( = ?auto_83046 ?auto_83048 ) ) ( not ( = ?auto_83047 ?auto_83048 ) ) )
    :subtasks
    ( ( !STACK ?auto_83047 ?auto_83048 )
      ( MAKE-3PILE ?auto_83043 ?auto_83044 ?auto_83045 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83049 - BLOCK
      ?auto_83050 - BLOCK
      ?auto_83051 - BLOCK
    )
    :vars
    (
      ?auto_83054 - BLOCK
      ?auto_83053 - BLOCK
      ?auto_83052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83054 ?auto_83051 ) ( ON-TABLE ?auto_83049 ) ( ON ?auto_83050 ?auto_83049 ) ( ON ?auto_83051 ?auto_83050 ) ( not ( = ?auto_83049 ?auto_83050 ) ) ( not ( = ?auto_83049 ?auto_83051 ) ) ( not ( = ?auto_83049 ?auto_83054 ) ) ( not ( = ?auto_83050 ?auto_83051 ) ) ( not ( = ?auto_83050 ?auto_83054 ) ) ( not ( = ?auto_83051 ?auto_83054 ) ) ( CLEAR ?auto_83053 ) ( not ( = ?auto_83049 ?auto_83052 ) ) ( not ( = ?auto_83049 ?auto_83053 ) ) ( not ( = ?auto_83050 ?auto_83052 ) ) ( not ( = ?auto_83050 ?auto_83053 ) ) ( not ( = ?auto_83051 ?auto_83052 ) ) ( not ( = ?auto_83051 ?auto_83053 ) ) ( not ( = ?auto_83054 ?auto_83052 ) ) ( not ( = ?auto_83054 ?auto_83053 ) ) ( not ( = ?auto_83052 ?auto_83053 ) ) ( ON ?auto_83052 ?auto_83054 ) ( CLEAR ?auto_83052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83049 ?auto_83050 ?auto_83051 ?auto_83054 )
      ( MAKE-3PILE ?auto_83049 ?auto_83050 ?auto_83051 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83055 - BLOCK
      ?auto_83056 - BLOCK
      ?auto_83057 - BLOCK
    )
    :vars
    (
      ?auto_83060 - BLOCK
      ?auto_83058 - BLOCK
      ?auto_83059 - BLOCK
      ?auto_83061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83060 ?auto_83057 ) ( ON-TABLE ?auto_83055 ) ( ON ?auto_83056 ?auto_83055 ) ( ON ?auto_83057 ?auto_83056 ) ( not ( = ?auto_83055 ?auto_83056 ) ) ( not ( = ?auto_83055 ?auto_83057 ) ) ( not ( = ?auto_83055 ?auto_83060 ) ) ( not ( = ?auto_83056 ?auto_83057 ) ) ( not ( = ?auto_83056 ?auto_83060 ) ) ( not ( = ?auto_83057 ?auto_83060 ) ) ( not ( = ?auto_83055 ?auto_83058 ) ) ( not ( = ?auto_83055 ?auto_83059 ) ) ( not ( = ?auto_83056 ?auto_83058 ) ) ( not ( = ?auto_83056 ?auto_83059 ) ) ( not ( = ?auto_83057 ?auto_83058 ) ) ( not ( = ?auto_83057 ?auto_83059 ) ) ( not ( = ?auto_83060 ?auto_83058 ) ) ( not ( = ?auto_83060 ?auto_83059 ) ) ( not ( = ?auto_83058 ?auto_83059 ) ) ( ON ?auto_83058 ?auto_83060 ) ( CLEAR ?auto_83058 ) ( HOLDING ?auto_83059 ) ( CLEAR ?auto_83061 ) ( ON-TABLE ?auto_83061 ) ( not ( = ?auto_83061 ?auto_83059 ) ) ( not ( = ?auto_83055 ?auto_83061 ) ) ( not ( = ?auto_83056 ?auto_83061 ) ) ( not ( = ?auto_83057 ?auto_83061 ) ) ( not ( = ?auto_83060 ?auto_83061 ) ) ( not ( = ?auto_83058 ?auto_83061 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83061 ?auto_83059 )
      ( MAKE-3PILE ?auto_83055 ?auto_83056 ?auto_83057 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83062 - BLOCK
      ?auto_83063 - BLOCK
      ?auto_83064 - BLOCK
    )
    :vars
    (
      ?auto_83065 - BLOCK
      ?auto_83067 - BLOCK
      ?auto_83066 - BLOCK
      ?auto_83068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83065 ?auto_83064 ) ( ON-TABLE ?auto_83062 ) ( ON ?auto_83063 ?auto_83062 ) ( ON ?auto_83064 ?auto_83063 ) ( not ( = ?auto_83062 ?auto_83063 ) ) ( not ( = ?auto_83062 ?auto_83064 ) ) ( not ( = ?auto_83062 ?auto_83065 ) ) ( not ( = ?auto_83063 ?auto_83064 ) ) ( not ( = ?auto_83063 ?auto_83065 ) ) ( not ( = ?auto_83064 ?auto_83065 ) ) ( not ( = ?auto_83062 ?auto_83067 ) ) ( not ( = ?auto_83062 ?auto_83066 ) ) ( not ( = ?auto_83063 ?auto_83067 ) ) ( not ( = ?auto_83063 ?auto_83066 ) ) ( not ( = ?auto_83064 ?auto_83067 ) ) ( not ( = ?auto_83064 ?auto_83066 ) ) ( not ( = ?auto_83065 ?auto_83067 ) ) ( not ( = ?auto_83065 ?auto_83066 ) ) ( not ( = ?auto_83067 ?auto_83066 ) ) ( ON ?auto_83067 ?auto_83065 ) ( CLEAR ?auto_83068 ) ( ON-TABLE ?auto_83068 ) ( not ( = ?auto_83068 ?auto_83066 ) ) ( not ( = ?auto_83062 ?auto_83068 ) ) ( not ( = ?auto_83063 ?auto_83068 ) ) ( not ( = ?auto_83064 ?auto_83068 ) ) ( not ( = ?auto_83065 ?auto_83068 ) ) ( not ( = ?auto_83067 ?auto_83068 ) ) ( ON ?auto_83066 ?auto_83067 ) ( CLEAR ?auto_83066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83062 ?auto_83063 ?auto_83064 ?auto_83065 ?auto_83067 )
      ( MAKE-3PILE ?auto_83062 ?auto_83063 ?auto_83064 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83069 - BLOCK
      ?auto_83070 - BLOCK
      ?auto_83071 - BLOCK
    )
    :vars
    (
      ?auto_83072 - BLOCK
      ?auto_83075 - BLOCK
      ?auto_83073 - BLOCK
      ?auto_83074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83072 ?auto_83071 ) ( ON-TABLE ?auto_83069 ) ( ON ?auto_83070 ?auto_83069 ) ( ON ?auto_83071 ?auto_83070 ) ( not ( = ?auto_83069 ?auto_83070 ) ) ( not ( = ?auto_83069 ?auto_83071 ) ) ( not ( = ?auto_83069 ?auto_83072 ) ) ( not ( = ?auto_83070 ?auto_83071 ) ) ( not ( = ?auto_83070 ?auto_83072 ) ) ( not ( = ?auto_83071 ?auto_83072 ) ) ( not ( = ?auto_83069 ?auto_83075 ) ) ( not ( = ?auto_83069 ?auto_83073 ) ) ( not ( = ?auto_83070 ?auto_83075 ) ) ( not ( = ?auto_83070 ?auto_83073 ) ) ( not ( = ?auto_83071 ?auto_83075 ) ) ( not ( = ?auto_83071 ?auto_83073 ) ) ( not ( = ?auto_83072 ?auto_83075 ) ) ( not ( = ?auto_83072 ?auto_83073 ) ) ( not ( = ?auto_83075 ?auto_83073 ) ) ( ON ?auto_83075 ?auto_83072 ) ( not ( = ?auto_83074 ?auto_83073 ) ) ( not ( = ?auto_83069 ?auto_83074 ) ) ( not ( = ?auto_83070 ?auto_83074 ) ) ( not ( = ?auto_83071 ?auto_83074 ) ) ( not ( = ?auto_83072 ?auto_83074 ) ) ( not ( = ?auto_83075 ?auto_83074 ) ) ( ON ?auto_83073 ?auto_83075 ) ( CLEAR ?auto_83073 ) ( HOLDING ?auto_83074 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83074 )
      ( MAKE-3PILE ?auto_83069 ?auto_83070 ?auto_83071 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83076 - BLOCK
      ?auto_83077 - BLOCK
      ?auto_83078 - BLOCK
    )
    :vars
    (
      ?auto_83079 - BLOCK
      ?auto_83081 - BLOCK
      ?auto_83082 - BLOCK
      ?auto_83080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83079 ?auto_83078 ) ( ON-TABLE ?auto_83076 ) ( ON ?auto_83077 ?auto_83076 ) ( ON ?auto_83078 ?auto_83077 ) ( not ( = ?auto_83076 ?auto_83077 ) ) ( not ( = ?auto_83076 ?auto_83078 ) ) ( not ( = ?auto_83076 ?auto_83079 ) ) ( not ( = ?auto_83077 ?auto_83078 ) ) ( not ( = ?auto_83077 ?auto_83079 ) ) ( not ( = ?auto_83078 ?auto_83079 ) ) ( not ( = ?auto_83076 ?auto_83081 ) ) ( not ( = ?auto_83076 ?auto_83082 ) ) ( not ( = ?auto_83077 ?auto_83081 ) ) ( not ( = ?auto_83077 ?auto_83082 ) ) ( not ( = ?auto_83078 ?auto_83081 ) ) ( not ( = ?auto_83078 ?auto_83082 ) ) ( not ( = ?auto_83079 ?auto_83081 ) ) ( not ( = ?auto_83079 ?auto_83082 ) ) ( not ( = ?auto_83081 ?auto_83082 ) ) ( ON ?auto_83081 ?auto_83079 ) ( not ( = ?auto_83080 ?auto_83082 ) ) ( not ( = ?auto_83076 ?auto_83080 ) ) ( not ( = ?auto_83077 ?auto_83080 ) ) ( not ( = ?auto_83078 ?auto_83080 ) ) ( not ( = ?auto_83079 ?auto_83080 ) ) ( not ( = ?auto_83081 ?auto_83080 ) ) ( ON ?auto_83082 ?auto_83081 ) ( ON ?auto_83080 ?auto_83082 ) ( CLEAR ?auto_83080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83076 ?auto_83077 ?auto_83078 ?auto_83079 ?auto_83081 ?auto_83082 )
      ( MAKE-3PILE ?auto_83076 ?auto_83077 ?auto_83078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83083 - BLOCK
      ?auto_83084 - BLOCK
      ?auto_83085 - BLOCK
    )
    :vars
    (
      ?auto_83086 - BLOCK
      ?auto_83087 - BLOCK
      ?auto_83089 - BLOCK
      ?auto_83088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83086 ?auto_83085 ) ( ON-TABLE ?auto_83083 ) ( ON ?auto_83084 ?auto_83083 ) ( ON ?auto_83085 ?auto_83084 ) ( not ( = ?auto_83083 ?auto_83084 ) ) ( not ( = ?auto_83083 ?auto_83085 ) ) ( not ( = ?auto_83083 ?auto_83086 ) ) ( not ( = ?auto_83084 ?auto_83085 ) ) ( not ( = ?auto_83084 ?auto_83086 ) ) ( not ( = ?auto_83085 ?auto_83086 ) ) ( not ( = ?auto_83083 ?auto_83087 ) ) ( not ( = ?auto_83083 ?auto_83089 ) ) ( not ( = ?auto_83084 ?auto_83087 ) ) ( not ( = ?auto_83084 ?auto_83089 ) ) ( not ( = ?auto_83085 ?auto_83087 ) ) ( not ( = ?auto_83085 ?auto_83089 ) ) ( not ( = ?auto_83086 ?auto_83087 ) ) ( not ( = ?auto_83086 ?auto_83089 ) ) ( not ( = ?auto_83087 ?auto_83089 ) ) ( ON ?auto_83087 ?auto_83086 ) ( not ( = ?auto_83088 ?auto_83089 ) ) ( not ( = ?auto_83083 ?auto_83088 ) ) ( not ( = ?auto_83084 ?auto_83088 ) ) ( not ( = ?auto_83085 ?auto_83088 ) ) ( not ( = ?auto_83086 ?auto_83088 ) ) ( not ( = ?auto_83087 ?auto_83088 ) ) ( ON ?auto_83089 ?auto_83087 ) ( HOLDING ?auto_83088 ) ( CLEAR ?auto_83089 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83083 ?auto_83084 ?auto_83085 ?auto_83086 ?auto_83087 ?auto_83089 ?auto_83088 )
      ( MAKE-3PILE ?auto_83083 ?auto_83084 ?auto_83085 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83090 - BLOCK
      ?auto_83091 - BLOCK
      ?auto_83092 - BLOCK
    )
    :vars
    (
      ?auto_83096 - BLOCK
      ?auto_83093 - BLOCK
      ?auto_83095 - BLOCK
      ?auto_83094 - BLOCK
      ?auto_83097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83096 ?auto_83092 ) ( ON-TABLE ?auto_83090 ) ( ON ?auto_83091 ?auto_83090 ) ( ON ?auto_83092 ?auto_83091 ) ( not ( = ?auto_83090 ?auto_83091 ) ) ( not ( = ?auto_83090 ?auto_83092 ) ) ( not ( = ?auto_83090 ?auto_83096 ) ) ( not ( = ?auto_83091 ?auto_83092 ) ) ( not ( = ?auto_83091 ?auto_83096 ) ) ( not ( = ?auto_83092 ?auto_83096 ) ) ( not ( = ?auto_83090 ?auto_83093 ) ) ( not ( = ?auto_83090 ?auto_83095 ) ) ( not ( = ?auto_83091 ?auto_83093 ) ) ( not ( = ?auto_83091 ?auto_83095 ) ) ( not ( = ?auto_83092 ?auto_83093 ) ) ( not ( = ?auto_83092 ?auto_83095 ) ) ( not ( = ?auto_83096 ?auto_83093 ) ) ( not ( = ?auto_83096 ?auto_83095 ) ) ( not ( = ?auto_83093 ?auto_83095 ) ) ( ON ?auto_83093 ?auto_83096 ) ( not ( = ?auto_83094 ?auto_83095 ) ) ( not ( = ?auto_83090 ?auto_83094 ) ) ( not ( = ?auto_83091 ?auto_83094 ) ) ( not ( = ?auto_83092 ?auto_83094 ) ) ( not ( = ?auto_83096 ?auto_83094 ) ) ( not ( = ?auto_83093 ?auto_83094 ) ) ( ON ?auto_83095 ?auto_83093 ) ( CLEAR ?auto_83095 ) ( ON ?auto_83094 ?auto_83097 ) ( CLEAR ?auto_83094 ) ( HAND-EMPTY ) ( not ( = ?auto_83090 ?auto_83097 ) ) ( not ( = ?auto_83091 ?auto_83097 ) ) ( not ( = ?auto_83092 ?auto_83097 ) ) ( not ( = ?auto_83096 ?auto_83097 ) ) ( not ( = ?auto_83093 ?auto_83097 ) ) ( not ( = ?auto_83095 ?auto_83097 ) ) ( not ( = ?auto_83094 ?auto_83097 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83094 ?auto_83097 )
      ( MAKE-3PILE ?auto_83090 ?auto_83091 ?auto_83092 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83098 - BLOCK
      ?auto_83099 - BLOCK
      ?auto_83100 - BLOCK
    )
    :vars
    (
      ?auto_83101 - BLOCK
      ?auto_83104 - BLOCK
      ?auto_83103 - BLOCK
      ?auto_83102 - BLOCK
      ?auto_83105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83101 ?auto_83100 ) ( ON-TABLE ?auto_83098 ) ( ON ?auto_83099 ?auto_83098 ) ( ON ?auto_83100 ?auto_83099 ) ( not ( = ?auto_83098 ?auto_83099 ) ) ( not ( = ?auto_83098 ?auto_83100 ) ) ( not ( = ?auto_83098 ?auto_83101 ) ) ( not ( = ?auto_83099 ?auto_83100 ) ) ( not ( = ?auto_83099 ?auto_83101 ) ) ( not ( = ?auto_83100 ?auto_83101 ) ) ( not ( = ?auto_83098 ?auto_83104 ) ) ( not ( = ?auto_83098 ?auto_83103 ) ) ( not ( = ?auto_83099 ?auto_83104 ) ) ( not ( = ?auto_83099 ?auto_83103 ) ) ( not ( = ?auto_83100 ?auto_83104 ) ) ( not ( = ?auto_83100 ?auto_83103 ) ) ( not ( = ?auto_83101 ?auto_83104 ) ) ( not ( = ?auto_83101 ?auto_83103 ) ) ( not ( = ?auto_83104 ?auto_83103 ) ) ( ON ?auto_83104 ?auto_83101 ) ( not ( = ?auto_83102 ?auto_83103 ) ) ( not ( = ?auto_83098 ?auto_83102 ) ) ( not ( = ?auto_83099 ?auto_83102 ) ) ( not ( = ?auto_83100 ?auto_83102 ) ) ( not ( = ?auto_83101 ?auto_83102 ) ) ( not ( = ?auto_83104 ?auto_83102 ) ) ( ON ?auto_83102 ?auto_83105 ) ( CLEAR ?auto_83102 ) ( not ( = ?auto_83098 ?auto_83105 ) ) ( not ( = ?auto_83099 ?auto_83105 ) ) ( not ( = ?auto_83100 ?auto_83105 ) ) ( not ( = ?auto_83101 ?auto_83105 ) ) ( not ( = ?auto_83104 ?auto_83105 ) ) ( not ( = ?auto_83103 ?auto_83105 ) ) ( not ( = ?auto_83102 ?auto_83105 ) ) ( HOLDING ?auto_83103 ) ( CLEAR ?auto_83104 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83098 ?auto_83099 ?auto_83100 ?auto_83101 ?auto_83104 ?auto_83103 )
      ( MAKE-3PILE ?auto_83098 ?auto_83099 ?auto_83100 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83106 - BLOCK
      ?auto_83107 - BLOCK
      ?auto_83108 - BLOCK
    )
    :vars
    (
      ?auto_83111 - BLOCK
      ?auto_83109 - BLOCK
      ?auto_83112 - BLOCK
      ?auto_83110 - BLOCK
      ?auto_83113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83111 ?auto_83108 ) ( ON-TABLE ?auto_83106 ) ( ON ?auto_83107 ?auto_83106 ) ( ON ?auto_83108 ?auto_83107 ) ( not ( = ?auto_83106 ?auto_83107 ) ) ( not ( = ?auto_83106 ?auto_83108 ) ) ( not ( = ?auto_83106 ?auto_83111 ) ) ( not ( = ?auto_83107 ?auto_83108 ) ) ( not ( = ?auto_83107 ?auto_83111 ) ) ( not ( = ?auto_83108 ?auto_83111 ) ) ( not ( = ?auto_83106 ?auto_83109 ) ) ( not ( = ?auto_83106 ?auto_83112 ) ) ( not ( = ?auto_83107 ?auto_83109 ) ) ( not ( = ?auto_83107 ?auto_83112 ) ) ( not ( = ?auto_83108 ?auto_83109 ) ) ( not ( = ?auto_83108 ?auto_83112 ) ) ( not ( = ?auto_83111 ?auto_83109 ) ) ( not ( = ?auto_83111 ?auto_83112 ) ) ( not ( = ?auto_83109 ?auto_83112 ) ) ( ON ?auto_83109 ?auto_83111 ) ( not ( = ?auto_83110 ?auto_83112 ) ) ( not ( = ?auto_83106 ?auto_83110 ) ) ( not ( = ?auto_83107 ?auto_83110 ) ) ( not ( = ?auto_83108 ?auto_83110 ) ) ( not ( = ?auto_83111 ?auto_83110 ) ) ( not ( = ?auto_83109 ?auto_83110 ) ) ( ON ?auto_83110 ?auto_83113 ) ( not ( = ?auto_83106 ?auto_83113 ) ) ( not ( = ?auto_83107 ?auto_83113 ) ) ( not ( = ?auto_83108 ?auto_83113 ) ) ( not ( = ?auto_83111 ?auto_83113 ) ) ( not ( = ?auto_83109 ?auto_83113 ) ) ( not ( = ?auto_83112 ?auto_83113 ) ) ( not ( = ?auto_83110 ?auto_83113 ) ) ( CLEAR ?auto_83109 ) ( ON ?auto_83112 ?auto_83110 ) ( CLEAR ?auto_83112 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83113 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83113 ?auto_83110 )
      ( MAKE-3PILE ?auto_83106 ?auto_83107 ?auto_83108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83114 - BLOCK
      ?auto_83115 - BLOCK
      ?auto_83116 - BLOCK
    )
    :vars
    (
      ?auto_83121 - BLOCK
      ?auto_83120 - BLOCK
      ?auto_83117 - BLOCK
      ?auto_83118 - BLOCK
      ?auto_83119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83121 ?auto_83116 ) ( ON-TABLE ?auto_83114 ) ( ON ?auto_83115 ?auto_83114 ) ( ON ?auto_83116 ?auto_83115 ) ( not ( = ?auto_83114 ?auto_83115 ) ) ( not ( = ?auto_83114 ?auto_83116 ) ) ( not ( = ?auto_83114 ?auto_83121 ) ) ( not ( = ?auto_83115 ?auto_83116 ) ) ( not ( = ?auto_83115 ?auto_83121 ) ) ( not ( = ?auto_83116 ?auto_83121 ) ) ( not ( = ?auto_83114 ?auto_83120 ) ) ( not ( = ?auto_83114 ?auto_83117 ) ) ( not ( = ?auto_83115 ?auto_83120 ) ) ( not ( = ?auto_83115 ?auto_83117 ) ) ( not ( = ?auto_83116 ?auto_83120 ) ) ( not ( = ?auto_83116 ?auto_83117 ) ) ( not ( = ?auto_83121 ?auto_83120 ) ) ( not ( = ?auto_83121 ?auto_83117 ) ) ( not ( = ?auto_83120 ?auto_83117 ) ) ( not ( = ?auto_83118 ?auto_83117 ) ) ( not ( = ?auto_83114 ?auto_83118 ) ) ( not ( = ?auto_83115 ?auto_83118 ) ) ( not ( = ?auto_83116 ?auto_83118 ) ) ( not ( = ?auto_83121 ?auto_83118 ) ) ( not ( = ?auto_83120 ?auto_83118 ) ) ( ON ?auto_83118 ?auto_83119 ) ( not ( = ?auto_83114 ?auto_83119 ) ) ( not ( = ?auto_83115 ?auto_83119 ) ) ( not ( = ?auto_83116 ?auto_83119 ) ) ( not ( = ?auto_83121 ?auto_83119 ) ) ( not ( = ?auto_83120 ?auto_83119 ) ) ( not ( = ?auto_83117 ?auto_83119 ) ) ( not ( = ?auto_83118 ?auto_83119 ) ) ( ON ?auto_83117 ?auto_83118 ) ( CLEAR ?auto_83117 ) ( ON-TABLE ?auto_83119 ) ( HOLDING ?auto_83120 ) ( CLEAR ?auto_83121 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83114 ?auto_83115 ?auto_83116 ?auto_83121 ?auto_83120 )
      ( MAKE-3PILE ?auto_83114 ?auto_83115 ?auto_83116 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83122 - BLOCK
      ?auto_83123 - BLOCK
      ?auto_83124 - BLOCK
    )
    :vars
    (
      ?auto_83127 - BLOCK
      ?auto_83126 - BLOCK
      ?auto_83129 - BLOCK
      ?auto_83125 - BLOCK
      ?auto_83128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83127 ?auto_83124 ) ( ON-TABLE ?auto_83122 ) ( ON ?auto_83123 ?auto_83122 ) ( ON ?auto_83124 ?auto_83123 ) ( not ( = ?auto_83122 ?auto_83123 ) ) ( not ( = ?auto_83122 ?auto_83124 ) ) ( not ( = ?auto_83122 ?auto_83127 ) ) ( not ( = ?auto_83123 ?auto_83124 ) ) ( not ( = ?auto_83123 ?auto_83127 ) ) ( not ( = ?auto_83124 ?auto_83127 ) ) ( not ( = ?auto_83122 ?auto_83126 ) ) ( not ( = ?auto_83122 ?auto_83129 ) ) ( not ( = ?auto_83123 ?auto_83126 ) ) ( not ( = ?auto_83123 ?auto_83129 ) ) ( not ( = ?auto_83124 ?auto_83126 ) ) ( not ( = ?auto_83124 ?auto_83129 ) ) ( not ( = ?auto_83127 ?auto_83126 ) ) ( not ( = ?auto_83127 ?auto_83129 ) ) ( not ( = ?auto_83126 ?auto_83129 ) ) ( not ( = ?auto_83125 ?auto_83129 ) ) ( not ( = ?auto_83122 ?auto_83125 ) ) ( not ( = ?auto_83123 ?auto_83125 ) ) ( not ( = ?auto_83124 ?auto_83125 ) ) ( not ( = ?auto_83127 ?auto_83125 ) ) ( not ( = ?auto_83126 ?auto_83125 ) ) ( ON ?auto_83125 ?auto_83128 ) ( not ( = ?auto_83122 ?auto_83128 ) ) ( not ( = ?auto_83123 ?auto_83128 ) ) ( not ( = ?auto_83124 ?auto_83128 ) ) ( not ( = ?auto_83127 ?auto_83128 ) ) ( not ( = ?auto_83126 ?auto_83128 ) ) ( not ( = ?auto_83129 ?auto_83128 ) ) ( not ( = ?auto_83125 ?auto_83128 ) ) ( ON ?auto_83129 ?auto_83125 ) ( ON-TABLE ?auto_83128 ) ( CLEAR ?auto_83127 ) ( ON ?auto_83126 ?auto_83129 ) ( CLEAR ?auto_83126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83128 ?auto_83125 ?auto_83129 )
      ( MAKE-3PILE ?auto_83122 ?auto_83123 ?auto_83124 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83146 - BLOCK
      ?auto_83147 - BLOCK
      ?auto_83148 - BLOCK
    )
    :vars
    (
      ?auto_83152 - BLOCK
      ?auto_83153 - BLOCK
      ?auto_83150 - BLOCK
      ?auto_83149 - BLOCK
      ?auto_83151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83146 ) ( ON ?auto_83147 ?auto_83146 ) ( not ( = ?auto_83146 ?auto_83147 ) ) ( not ( = ?auto_83146 ?auto_83148 ) ) ( not ( = ?auto_83146 ?auto_83152 ) ) ( not ( = ?auto_83147 ?auto_83148 ) ) ( not ( = ?auto_83147 ?auto_83152 ) ) ( not ( = ?auto_83148 ?auto_83152 ) ) ( not ( = ?auto_83146 ?auto_83153 ) ) ( not ( = ?auto_83146 ?auto_83150 ) ) ( not ( = ?auto_83147 ?auto_83153 ) ) ( not ( = ?auto_83147 ?auto_83150 ) ) ( not ( = ?auto_83148 ?auto_83153 ) ) ( not ( = ?auto_83148 ?auto_83150 ) ) ( not ( = ?auto_83152 ?auto_83153 ) ) ( not ( = ?auto_83152 ?auto_83150 ) ) ( not ( = ?auto_83153 ?auto_83150 ) ) ( not ( = ?auto_83149 ?auto_83150 ) ) ( not ( = ?auto_83146 ?auto_83149 ) ) ( not ( = ?auto_83147 ?auto_83149 ) ) ( not ( = ?auto_83148 ?auto_83149 ) ) ( not ( = ?auto_83152 ?auto_83149 ) ) ( not ( = ?auto_83153 ?auto_83149 ) ) ( ON ?auto_83149 ?auto_83151 ) ( not ( = ?auto_83146 ?auto_83151 ) ) ( not ( = ?auto_83147 ?auto_83151 ) ) ( not ( = ?auto_83148 ?auto_83151 ) ) ( not ( = ?auto_83152 ?auto_83151 ) ) ( not ( = ?auto_83153 ?auto_83151 ) ) ( not ( = ?auto_83150 ?auto_83151 ) ) ( not ( = ?auto_83149 ?auto_83151 ) ) ( ON ?auto_83150 ?auto_83149 ) ( ON-TABLE ?auto_83151 ) ( ON ?auto_83153 ?auto_83150 ) ( ON ?auto_83152 ?auto_83153 ) ( CLEAR ?auto_83152 ) ( HOLDING ?auto_83148 ) ( CLEAR ?auto_83147 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83146 ?auto_83147 ?auto_83148 ?auto_83152 )
      ( MAKE-3PILE ?auto_83146 ?auto_83147 ?auto_83148 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83154 - BLOCK
      ?auto_83155 - BLOCK
      ?auto_83156 - BLOCK
    )
    :vars
    (
      ?auto_83161 - BLOCK
      ?auto_83157 - BLOCK
      ?auto_83158 - BLOCK
      ?auto_83159 - BLOCK
      ?auto_83160 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83154 ) ( ON ?auto_83155 ?auto_83154 ) ( not ( = ?auto_83154 ?auto_83155 ) ) ( not ( = ?auto_83154 ?auto_83156 ) ) ( not ( = ?auto_83154 ?auto_83161 ) ) ( not ( = ?auto_83155 ?auto_83156 ) ) ( not ( = ?auto_83155 ?auto_83161 ) ) ( not ( = ?auto_83156 ?auto_83161 ) ) ( not ( = ?auto_83154 ?auto_83157 ) ) ( not ( = ?auto_83154 ?auto_83158 ) ) ( not ( = ?auto_83155 ?auto_83157 ) ) ( not ( = ?auto_83155 ?auto_83158 ) ) ( not ( = ?auto_83156 ?auto_83157 ) ) ( not ( = ?auto_83156 ?auto_83158 ) ) ( not ( = ?auto_83161 ?auto_83157 ) ) ( not ( = ?auto_83161 ?auto_83158 ) ) ( not ( = ?auto_83157 ?auto_83158 ) ) ( not ( = ?auto_83159 ?auto_83158 ) ) ( not ( = ?auto_83154 ?auto_83159 ) ) ( not ( = ?auto_83155 ?auto_83159 ) ) ( not ( = ?auto_83156 ?auto_83159 ) ) ( not ( = ?auto_83161 ?auto_83159 ) ) ( not ( = ?auto_83157 ?auto_83159 ) ) ( ON ?auto_83159 ?auto_83160 ) ( not ( = ?auto_83154 ?auto_83160 ) ) ( not ( = ?auto_83155 ?auto_83160 ) ) ( not ( = ?auto_83156 ?auto_83160 ) ) ( not ( = ?auto_83161 ?auto_83160 ) ) ( not ( = ?auto_83157 ?auto_83160 ) ) ( not ( = ?auto_83158 ?auto_83160 ) ) ( not ( = ?auto_83159 ?auto_83160 ) ) ( ON ?auto_83158 ?auto_83159 ) ( ON-TABLE ?auto_83160 ) ( ON ?auto_83157 ?auto_83158 ) ( ON ?auto_83161 ?auto_83157 ) ( CLEAR ?auto_83155 ) ( ON ?auto_83156 ?auto_83161 ) ( CLEAR ?auto_83156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83160 ?auto_83159 ?auto_83158 ?auto_83157 ?auto_83161 )
      ( MAKE-3PILE ?auto_83154 ?auto_83155 ?auto_83156 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83162 - BLOCK
      ?auto_83163 - BLOCK
      ?auto_83164 - BLOCK
    )
    :vars
    (
      ?auto_83169 - BLOCK
      ?auto_83167 - BLOCK
      ?auto_83165 - BLOCK
      ?auto_83168 - BLOCK
      ?auto_83166 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83162 ) ( not ( = ?auto_83162 ?auto_83163 ) ) ( not ( = ?auto_83162 ?auto_83164 ) ) ( not ( = ?auto_83162 ?auto_83169 ) ) ( not ( = ?auto_83163 ?auto_83164 ) ) ( not ( = ?auto_83163 ?auto_83169 ) ) ( not ( = ?auto_83164 ?auto_83169 ) ) ( not ( = ?auto_83162 ?auto_83167 ) ) ( not ( = ?auto_83162 ?auto_83165 ) ) ( not ( = ?auto_83163 ?auto_83167 ) ) ( not ( = ?auto_83163 ?auto_83165 ) ) ( not ( = ?auto_83164 ?auto_83167 ) ) ( not ( = ?auto_83164 ?auto_83165 ) ) ( not ( = ?auto_83169 ?auto_83167 ) ) ( not ( = ?auto_83169 ?auto_83165 ) ) ( not ( = ?auto_83167 ?auto_83165 ) ) ( not ( = ?auto_83168 ?auto_83165 ) ) ( not ( = ?auto_83162 ?auto_83168 ) ) ( not ( = ?auto_83163 ?auto_83168 ) ) ( not ( = ?auto_83164 ?auto_83168 ) ) ( not ( = ?auto_83169 ?auto_83168 ) ) ( not ( = ?auto_83167 ?auto_83168 ) ) ( ON ?auto_83168 ?auto_83166 ) ( not ( = ?auto_83162 ?auto_83166 ) ) ( not ( = ?auto_83163 ?auto_83166 ) ) ( not ( = ?auto_83164 ?auto_83166 ) ) ( not ( = ?auto_83169 ?auto_83166 ) ) ( not ( = ?auto_83167 ?auto_83166 ) ) ( not ( = ?auto_83165 ?auto_83166 ) ) ( not ( = ?auto_83168 ?auto_83166 ) ) ( ON ?auto_83165 ?auto_83168 ) ( ON-TABLE ?auto_83166 ) ( ON ?auto_83167 ?auto_83165 ) ( ON ?auto_83169 ?auto_83167 ) ( ON ?auto_83164 ?auto_83169 ) ( CLEAR ?auto_83164 ) ( HOLDING ?auto_83163 ) ( CLEAR ?auto_83162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83162 ?auto_83163 )
      ( MAKE-3PILE ?auto_83162 ?auto_83163 ?auto_83164 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83170 - BLOCK
      ?auto_83171 - BLOCK
      ?auto_83172 - BLOCK
    )
    :vars
    (
      ?auto_83175 - BLOCK
      ?auto_83173 - BLOCK
      ?auto_83174 - BLOCK
      ?auto_83176 - BLOCK
      ?auto_83177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83170 ) ( not ( = ?auto_83170 ?auto_83171 ) ) ( not ( = ?auto_83170 ?auto_83172 ) ) ( not ( = ?auto_83170 ?auto_83175 ) ) ( not ( = ?auto_83171 ?auto_83172 ) ) ( not ( = ?auto_83171 ?auto_83175 ) ) ( not ( = ?auto_83172 ?auto_83175 ) ) ( not ( = ?auto_83170 ?auto_83173 ) ) ( not ( = ?auto_83170 ?auto_83174 ) ) ( not ( = ?auto_83171 ?auto_83173 ) ) ( not ( = ?auto_83171 ?auto_83174 ) ) ( not ( = ?auto_83172 ?auto_83173 ) ) ( not ( = ?auto_83172 ?auto_83174 ) ) ( not ( = ?auto_83175 ?auto_83173 ) ) ( not ( = ?auto_83175 ?auto_83174 ) ) ( not ( = ?auto_83173 ?auto_83174 ) ) ( not ( = ?auto_83176 ?auto_83174 ) ) ( not ( = ?auto_83170 ?auto_83176 ) ) ( not ( = ?auto_83171 ?auto_83176 ) ) ( not ( = ?auto_83172 ?auto_83176 ) ) ( not ( = ?auto_83175 ?auto_83176 ) ) ( not ( = ?auto_83173 ?auto_83176 ) ) ( ON ?auto_83176 ?auto_83177 ) ( not ( = ?auto_83170 ?auto_83177 ) ) ( not ( = ?auto_83171 ?auto_83177 ) ) ( not ( = ?auto_83172 ?auto_83177 ) ) ( not ( = ?auto_83175 ?auto_83177 ) ) ( not ( = ?auto_83173 ?auto_83177 ) ) ( not ( = ?auto_83174 ?auto_83177 ) ) ( not ( = ?auto_83176 ?auto_83177 ) ) ( ON ?auto_83174 ?auto_83176 ) ( ON-TABLE ?auto_83177 ) ( ON ?auto_83173 ?auto_83174 ) ( ON ?auto_83175 ?auto_83173 ) ( ON ?auto_83172 ?auto_83175 ) ( CLEAR ?auto_83170 ) ( ON ?auto_83171 ?auto_83172 ) ( CLEAR ?auto_83171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83177 ?auto_83176 ?auto_83174 ?auto_83173 ?auto_83175 ?auto_83172 )
      ( MAKE-3PILE ?auto_83170 ?auto_83171 ?auto_83172 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83178 - BLOCK
      ?auto_83179 - BLOCK
      ?auto_83180 - BLOCK
    )
    :vars
    (
      ?auto_83185 - BLOCK
      ?auto_83182 - BLOCK
      ?auto_83183 - BLOCK
      ?auto_83184 - BLOCK
      ?auto_83181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83178 ?auto_83179 ) ) ( not ( = ?auto_83178 ?auto_83180 ) ) ( not ( = ?auto_83178 ?auto_83185 ) ) ( not ( = ?auto_83179 ?auto_83180 ) ) ( not ( = ?auto_83179 ?auto_83185 ) ) ( not ( = ?auto_83180 ?auto_83185 ) ) ( not ( = ?auto_83178 ?auto_83182 ) ) ( not ( = ?auto_83178 ?auto_83183 ) ) ( not ( = ?auto_83179 ?auto_83182 ) ) ( not ( = ?auto_83179 ?auto_83183 ) ) ( not ( = ?auto_83180 ?auto_83182 ) ) ( not ( = ?auto_83180 ?auto_83183 ) ) ( not ( = ?auto_83185 ?auto_83182 ) ) ( not ( = ?auto_83185 ?auto_83183 ) ) ( not ( = ?auto_83182 ?auto_83183 ) ) ( not ( = ?auto_83184 ?auto_83183 ) ) ( not ( = ?auto_83178 ?auto_83184 ) ) ( not ( = ?auto_83179 ?auto_83184 ) ) ( not ( = ?auto_83180 ?auto_83184 ) ) ( not ( = ?auto_83185 ?auto_83184 ) ) ( not ( = ?auto_83182 ?auto_83184 ) ) ( ON ?auto_83184 ?auto_83181 ) ( not ( = ?auto_83178 ?auto_83181 ) ) ( not ( = ?auto_83179 ?auto_83181 ) ) ( not ( = ?auto_83180 ?auto_83181 ) ) ( not ( = ?auto_83185 ?auto_83181 ) ) ( not ( = ?auto_83182 ?auto_83181 ) ) ( not ( = ?auto_83183 ?auto_83181 ) ) ( not ( = ?auto_83184 ?auto_83181 ) ) ( ON ?auto_83183 ?auto_83184 ) ( ON-TABLE ?auto_83181 ) ( ON ?auto_83182 ?auto_83183 ) ( ON ?auto_83185 ?auto_83182 ) ( ON ?auto_83180 ?auto_83185 ) ( ON ?auto_83179 ?auto_83180 ) ( CLEAR ?auto_83179 ) ( HOLDING ?auto_83178 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83178 )
      ( MAKE-3PILE ?auto_83178 ?auto_83179 ?auto_83180 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_83186 - BLOCK
      ?auto_83187 - BLOCK
      ?auto_83188 - BLOCK
    )
    :vars
    (
      ?auto_83192 - BLOCK
      ?auto_83191 - BLOCK
      ?auto_83190 - BLOCK
      ?auto_83189 - BLOCK
      ?auto_83193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83186 ?auto_83187 ) ) ( not ( = ?auto_83186 ?auto_83188 ) ) ( not ( = ?auto_83186 ?auto_83192 ) ) ( not ( = ?auto_83187 ?auto_83188 ) ) ( not ( = ?auto_83187 ?auto_83192 ) ) ( not ( = ?auto_83188 ?auto_83192 ) ) ( not ( = ?auto_83186 ?auto_83191 ) ) ( not ( = ?auto_83186 ?auto_83190 ) ) ( not ( = ?auto_83187 ?auto_83191 ) ) ( not ( = ?auto_83187 ?auto_83190 ) ) ( not ( = ?auto_83188 ?auto_83191 ) ) ( not ( = ?auto_83188 ?auto_83190 ) ) ( not ( = ?auto_83192 ?auto_83191 ) ) ( not ( = ?auto_83192 ?auto_83190 ) ) ( not ( = ?auto_83191 ?auto_83190 ) ) ( not ( = ?auto_83189 ?auto_83190 ) ) ( not ( = ?auto_83186 ?auto_83189 ) ) ( not ( = ?auto_83187 ?auto_83189 ) ) ( not ( = ?auto_83188 ?auto_83189 ) ) ( not ( = ?auto_83192 ?auto_83189 ) ) ( not ( = ?auto_83191 ?auto_83189 ) ) ( ON ?auto_83189 ?auto_83193 ) ( not ( = ?auto_83186 ?auto_83193 ) ) ( not ( = ?auto_83187 ?auto_83193 ) ) ( not ( = ?auto_83188 ?auto_83193 ) ) ( not ( = ?auto_83192 ?auto_83193 ) ) ( not ( = ?auto_83191 ?auto_83193 ) ) ( not ( = ?auto_83190 ?auto_83193 ) ) ( not ( = ?auto_83189 ?auto_83193 ) ) ( ON ?auto_83190 ?auto_83189 ) ( ON-TABLE ?auto_83193 ) ( ON ?auto_83191 ?auto_83190 ) ( ON ?auto_83192 ?auto_83191 ) ( ON ?auto_83188 ?auto_83192 ) ( ON ?auto_83187 ?auto_83188 ) ( ON ?auto_83186 ?auto_83187 ) ( CLEAR ?auto_83186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83193 ?auto_83189 ?auto_83190 ?auto_83191 ?auto_83192 ?auto_83188 ?auto_83187 )
      ( MAKE-3PILE ?auto_83186 ?auto_83187 ?auto_83188 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83198 - BLOCK
      ?auto_83199 - BLOCK
      ?auto_83200 - BLOCK
      ?auto_83201 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_83201 ) ( CLEAR ?auto_83200 ) ( ON-TABLE ?auto_83198 ) ( ON ?auto_83199 ?auto_83198 ) ( ON ?auto_83200 ?auto_83199 ) ( not ( = ?auto_83198 ?auto_83199 ) ) ( not ( = ?auto_83198 ?auto_83200 ) ) ( not ( = ?auto_83198 ?auto_83201 ) ) ( not ( = ?auto_83199 ?auto_83200 ) ) ( not ( = ?auto_83199 ?auto_83201 ) ) ( not ( = ?auto_83200 ?auto_83201 ) ) )
    :subtasks
    ( ( !STACK ?auto_83201 ?auto_83200 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83202 - BLOCK
      ?auto_83203 - BLOCK
      ?auto_83204 - BLOCK
      ?auto_83205 - BLOCK
    )
    :vars
    (
      ?auto_83206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83204 ) ( ON-TABLE ?auto_83202 ) ( ON ?auto_83203 ?auto_83202 ) ( ON ?auto_83204 ?auto_83203 ) ( not ( = ?auto_83202 ?auto_83203 ) ) ( not ( = ?auto_83202 ?auto_83204 ) ) ( not ( = ?auto_83202 ?auto_83205 ) ) ( not ( = ?auto_83203 ?auto_83204 ) ) ( not ( = ?auto_83203 ?auto_83205 ) ) ( not ( = ?auto_83204 ?auto_83205 ) ) ( ON ?auto_83205 ?auto_83206 ) ( CLEAR ?auto_83205 ) ( HAND-EMPTY ) ( not ( = ?auto_83202 ?auto_83206 ) ) ( not ( = ?auto_83203 ?auto_83206 ) ) ( not ( = ?auto_83204 ?auto_83206 ) ) ( not ( = ?auto_83205 ?auto_83206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83205 ?auto_83206 )
      ( MAKE-4PILE ?auto_83202 ?auto_83203 ?auto_83204 ?auto_83205 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83207 - BLOCK
      ?auto_83208 - BLOCK
      ?auto_83209 - BLOCK
      ?auto_83210 - BLOCK
    )
    :vars
    (
      ?auto_83211 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83207 ) ( ON ?auto_83208 ?auto_83207 ) ( not ( = ?auto_83207 ?auto_83208 ) ) ( not ( = ?auto_83207 ?auto_83209 ) ) ( not ( = ?auto_83207 ?auto_83210 ) ) ( not ( = ?auto_83208 ?auto_83209 ) ) ( not ( = ?auto_83208 ?auto_83210 ) ) ( not ( = ?auto_83209 ?auto_83210 ) ) ( ON ?auto_83210 ?auto_83211 ) ( CLEAR ?auto_83210 ) ( not ( = ?auto_83207 ?auto_83211 ) ) ( not ( = ?auto_83208 ?auto_83211 ) ) ( not ( = ?auto_83209 ?auto_83211 ) ) ( not ( = ?auto_83210 ?auto_83211 ) ) ( HOLDING ?auto_83209 ) ( CLEAR ?auto_83208 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83207 ?auto_83208 ?auto_83209 )
      ( MAKE-4PILE ?auto_83207 ?auto_83208 ?auto_83209 ?auto_83210 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83212 - BLOCK
      ?auto_83213 - BLOCK
      ?auto_83214 - BLOCK
      ?auto_83215 - BLOCK
    )
    :vars
    (
      ?auto_83216 - BLOCK
      ?auto_83217 - BLOCK
      ?auto_83218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83212 ) ( ON ?auto_83213 ?auto_83212 ) ( not ( = ?auto_83212 ?auto_83213 ) ) ( not ( = ?auto_83212 ?auto_83214 ) ) ( not ( = ?auto_83212 ?auto_83215 ) ) ( not ( = ?auto_83213 ?auto_83214 ) ) ( not ( = ?auto_83213 ?auto_83215 ) ) ( not ( = ?auto_83214 ?auto_83215 ) ) ( ON ?auto_83215 ?auto_83216 ) ( not ( = ?auto_83212 ?auto_83216 ) ) ( not ( = ?auto_83213 ?auto_83216 ) ) ( not ( = ?auto_83214 ?auto_83216 ) ) ( not ( = ?auto_83215 ?auto_83216 ) ) ( CLEAR ?auto_83213 ) ( ON ?auto_83214 ?auto_83215 ) ( CLEAR ?auto_83214 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83217 ) ( ON ?auto_83218 ?auto_83217 ) ( ON ?auto_83216 ?auto_83218 ) ( not ( = ?auto_83217 ?auto_83218 ) ) ( not ( = ?auto_83217 ?auto_83216 ) ) ( not ( = ?auto_83217 ?auto_83215 ) ) ( not ( = ?auto_83217 ?auto_83214 ) ) ( not ( = ?auto_83218 ?auto_83216 ) ) ( not ( = ?auto_83218 ?auto_83215 ) ) ( not ( = ?auto_83218 ?auto_83214 ) ) ( not ( = ?auto_83212 ?auto_83217 ) ) ( not ( = ?auto_83212 ?auto_83218 ) ) ( not ( = ?auto_83213 ?auto_83217 ) ) ( not ( = ?auto_83213 ?auto_83218 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83217 ?auto_83218 ?auto_83216 ?auto_83215 )
      ( MAKE-4PILE ?auto_83212 ?auto_83213 ?auto_83214 ?auto_83215 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83219 - BLOCK
      ?auto_83220 - BLOCK
      ?auto_83221 - BLOCK
      ?auto_83222 - BLOCK
    )
    :vars
    (
      ?auto_83225 - BLOCK
      ?auto_83224 - BLOCK
      ?auto_83223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83219 ) ( not ( = ?auto_83219 ?auto_83220 ) ) ( not ( = ?auto_83219 ?auto_83221 ) ) ( not ( = ?auto_83219 ?auto_83222 ) ) ( not ( = ?auto_83220 ?auto_83221 ) ) ( not ( = ?auto_83220 ?auto_83222 ) ) ( not ( = ?auto_83221 ?auto_83222 ) ) ( ON ?auto_83222 ?auto_83225 ) ( not ( = ?auto_83219 ?auto_83225 ) ) ( not ( = ?auto_83220 ?auto_83225 ) ) ( not ( = ?auto_83221 ?auto_83225 ) ) ( not ( = ?auto_83222 ?auto_83225 ) ) ( ON ?auto_83221 ?auto_83222 ) ( CLEAR ?auto_83221 ) ( ON-TABLE ?auto_83224 ) ( ON ?auto_83223 ?auto_83224 ) ( ON ?auto_83225 ?auto_83223 ) ( not ( = ?auto_83224 ?auto_83223 ) ) ( not ( = ?auto_83224 ?auto_83225 ) ) ( not ( = ?auto_83224 ?auto_83222 ) ) ( not ( = ?auto_83224 ?auto_83221 ) ) ( not ( = ?auto_83223 ?auto_83225 ) ) ( not ( = ?auto_83223 ?auto_83222 ) ) ( not ( = ?auto_83223 ?auto_83221 ) ) ( not ( = ?auto_83219 ?auto_83224 ) ) ( not ( = ?auto_83219 ?auto_83223 ) ) ( not ( = ?auto_83220 ?auto_83224 ) ) ( not ( = ?auto_83220 ?auto_83223 ) ) ( HOLDING ?auto_83220 ) ( CLEAR ?auto_83219 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83219 ?auto_83220 )
      ( MAKE-4PILE ?auto_83219 ?auto_83220 ?auto_83221 ?auto_83222 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83226 - BLOCK
      ?auto_83227 - BLOCK
      ?auto_83228 - BLOCK
      ?auto_83229 - BLOCK
    )
    :vars
    (
      ?auto_83232 - BLOCK
      ?auto_83230 - BLOCK
      ?auto_83231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83226 ) ( not ( = ?auto_83226 ?auto_83227 ) ) ( not ( = ?auto_83226 ?auto_83228 ) ) ( not ( = ?auto_83226 ?auto_83229 ) ) ( not ( = ?auto_83227 ?auto_83228 ) ) ( not ( = ?auto_83227 ?auto_83229 ) ) ( not ( = ?auto_83228 ?auto_83229 ) ) ( ON ?auto_83229 ?auto_83232 ) ( not ( = ?auto_83226 ?auto_83232 ) ) ( not ( = ?auto_83227 ?auto_83232 ) ) ( not ( = ?auto_83228 ?auto_83232 ) ) ( not ( = ?auto_83229 ?auto_83232 ) ) ( ON ?auto_83228 ?auto_83229 ) ( ON-TABLE ?auto_83230 ) ( ON ?auto_83231 ?auto_83230 ) ( ON ?auto_83232 ?auto_83231 ) ( not ( = ?auto_83230 ?auto_83231 ) ) ( not ( = ?auto_83230 ?auto_83232 ) ) ( not ( = ?auto_83230 ?auto_83229 ) ) ( not ( = ?auto_83230 ?auto_83228 ) ) ( not ( = ?auto_83231 ?auto_83232 ) ) ( not ( = ?auto_83231 ?auto_83229 ) ) ( not ( = ?auto_83231 ?auto_83228 ) ) ( not ( = ?auto_83226 ?auto_83230 ) ) ( not ( = ?auto_83226 ?auto_83231 ) ) ( not ( = ?auto_83227 ?auto_83230 ) ) ( not ( = ?auto_83227 ?auto_83231 ) ) ( CLEAR ?auto_83226 ) ( ON ?auto_83227 ?auto_83228 ) ( CLEAR ?auto_83227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83230 ?auto_83231 ?auto_83232 ?auto_83229 ?auto_83228 )
      ( MAKE-4PILE ?auto_83226 ?auto_83227 ?auto_83228 ?auto_83229 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83233 - BLOCK
      ?auto_83234 - BLOCK
      ?auto_83235 - BLOCK
      ?auto_83236 - BLOCK
    )
    :vars
    (
      ?auto_83239 - BLOCK
      ?auto_83238 - BLOCK
      ?auto_83237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83233 ?auto_83234 ) ) ( not ( = ?auto_83233 ?auto_83235 ) ) ( not ( = ?auto_83233 ?auto_83236 ) ) ( not ( = ?auto_83234 ?auto_83235 ) ) ( not ( = ?auto_83234 ?auto_83236 ) ) ( not ( = ?auto_83235 ?auto_83236 ) ) ( ON ?auto_83236 ?auto_83239 ) ( not ( = ?auto_83233 ?auto_83239 ) ) ( not ( = ?auto_83234 ?auto_83239 ) ) ( not ( = ?auto_83235 ?auto_83239 ) ) ( not ( = ?auto_83236 ?auto_83239 ) ) ( ON ?auto_83235 ?auto_83236 ) ( ON-TABLE ?auto_83238 ) ( ON ?auto_83237 ?auto_83238 ) ( ON ?auto_83239 ?auto_83237 ) ( not ( = ?auto_83238 ?auto_83237 ) ) ( not ( = ?auto_83238 ?auto_83239 ) ) ( not ( = ?auto_83238 ?auto_83236 ) ) ( not ( = ?auto_83238 ?auto_83235 ) ) ( not ( = ?auto_83237 ?auto_83239 ) ) ( not ( = ?auto_83237 ?auto_83236 ) ) ( not ( = ?auto_83237 ?auto_83235 ) ) ( not ( = ?auto_83233 ?auto_83238 ) ) ( not ( = ?auto_83233 ?auto_83237 ) ) ( not ( = ?auto_83234 ?auto_83238 ) ) ( not ( = ?auto_83234 ?auto_83237 ) ) ( ON ?auto_83234 ?auto_83235 ) ( CLEAR ?auto_83234 ) ( HOLDING ?auto_83233 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83233 )
      ( MAKE-4PILE ?auto_83233 ?auto_83234 ?auto_83235 ?auto_83236 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83240 - BLOCK
      ?auto_83241 - BLOCK
      ?auto_83242 - BLOCK
      ?auto_83243 - BLOCK
    )
    :vars
    (
      ?auto_83246 - BLOCK
      ?auto_83245 - BLOCK
      ?auto_83244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83240 ?auto_83241 ) ) ( not ( = ?auto_83240 ?auto_83242 ) ) ( not ( = ?auto_83240 ?auto_83243 ) ) ( not ( = ?auto_83241 ?auto_83242 ) ) ( not ( = ?auto_83241 ?auto_83243 ) ) ( not ( = ?auto_83242 ?auto_83243 ) ) ( ON ?auto_83243 ?auto_83246 ) ( not ( = ?auto_83240 ?auto_83246 ) ) ( not ( = ?auto_83241 ?auto_83246 ) ) ( not ( = ?auto_83242 ?auto_83246 ) ) ( not ( = ?auto_83243 ?auto_83246 ) ) ( ON ?auto_83242 ?auto_83243 ) ( ON-TABLE ?auto_83245 ) ( ON ?auto_83244 ?auto_83245 ) ( ON ?auto_83246 ?auto_83244 ) ( not ( = ?auto_83245 ?auto_83244 ) ) ( not ( = ?auto_83245 ?auto_83246 ) ) ( not ( = ?auto_83245 ?auto_83243 ) ) ( not ( = ?auto_83245 ?auto_83242 ) ) ( not ( = ?auto_83244 ?auto_83246 ) ) ( not ( = ?auto_83244 ?auto_83243 ) ) ( not ( = ?auto_83244 ?auto_83242 ) ) ( not ( = ?auto_83240 ?auto_83245 ) ) ( not ( = ?auto_83240 ?auto_83244 ) ) ( not ( = ?auto_83241 ?auto_83245 ) ) ( not ( = ?auto_83241 ?auto_83244 ) ) ( ON ?auto_83241 ?auto_83242 ) ( ON ?auto_83240 ?auto_83241 ) ( CLEAR ?auto_83240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83245 ?auto_83244 ?auto_83246 ?auto_83243 ?auto_83242 ?auto_83241 )
      ( MAKE-4PILE ?auto_83240 ?auto_83241 ?auto_83242 ?auto_83243 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83247 - BLOCK
      ?auto_83248 - BLOCK
      ?auto_83249 - BLOCK
      ?auto_83250 - BLOCK
    )
    :vars
    (
      ?auto_83253 - BLOCK
      ?auto_83252 - BLOCK
      ?auto_83251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83247 ?auto_83248 ) ) ( not ( = ?auto_83247 ?auto_83249 ) ) ( not ( = ?auto_83247 ?auto_83250 ) ) ( not ( = ?auto_83248 ?auto_83249 ) ) ( not ( = ?auto_83248 ?auto_83250 ) ) ( not ( = ?auto_83249 ?auto_83250 ) ) ( ON ?auto_83250 ?auto_83253 ) ( not ( = ?auto_83247 ?auto_83253 ) ) ( not ( = ?auto_83248 ?auto_83253 ) ) ( not ( = ?auto_83249 ?auto_83253 ) ) ( not ( = ?auto_83250 ?auto_83253 ) ) ( ON ?auto_83249 ?auto_83250 ) ( ON-TABLE ?auto_83252 ) ( ON ?auto_83251 ?auto_83252 ) ( ON ?auto_83253 ?auto_83251 ) ( not ( = ?auto_83252 ?auto_83251 ) ) ( not ( = ?auto_83252 ?auto_83253 ) ) ( not ( = ?auto_83252 ?auto_83250 ) ) ( not ( = ?auto_83252 ?auto_83249 ) ) ( not ( = ?auto_83251 ?auto_83253 ) ) ( not ( = ?auto_83251 ?auto_83250 ) ) ( not ( = ?auto_83251 ?auto_83249 ) ) ( not ( = ?auto_83247 ?auto_83252 ) ) ( not ( = ?auto_83247 ?auto_83251 ) ) ( not ( = ?auto_83248 ?auto_83252 ) ) ( not ( = ?auto_83248 ?auto_83251 ) ) ( ON ?auto_83248 ?auto_83249 ) ( HOLDING ?auto_83247 ) ( CLEAR ?auto_83248 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83252 ?auto_83251 ?auto_83253 ?auto_83250 ?auto_83249 ?auto_83248 ?auto_83247 )
      ( MAKE-4PILE ?auto_83247 ?auto_83248 ?auto_83249 ?auto_83250 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83254 - BLOCK
      ?auto_83255 - BLOCK
      ?auto_83256 - BLOCK
      ?auto_83257 - BLOCK
    )
    :vars
    (
      ?auto_83259 - BLOCK
      ?auto_83258 - BLOCK
      ?auto_83260 - BLOCK
      ?auto_83261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83254 ?auto_83255 ) ) ( not ( = ?auto_83254 ?auto_83256 ) ) ( not ( = ?auto_83254 ?auto_83257 ) ) ( not ( = ?auto_83255 ?auto_83256 ) ) ( not ( = ?auto_83255 ?auto_83257 ) ) ( not ( = ?auto_83256 ?auto_83257 ) ) ( ON ?auto_83257 ?auto_83259 ) ( not ( = ?auto_83254 ?auto_83259 ) ) ( not ( = ?auto_83255 ?auto_83259 ) ) ( not ( = ?auto_83256 ?auto_83259 ) ) ( not ( = ?auto_83257 ?auto_83259 ) ) ( ON ?auto_83256 ?auto_83257 ) ( ON-TABLE ?auto_83258 ) ( ON ?auto_83260 ?auto_83258 ) ( ON ?auto_83259 ?auto_83260 ) ( not ( = ?auto_83258 ?auto_83260 ) ) ( not ( = ?auto_83258 ?auto_83259 ) ) ( not ( = ?auto_83258 ?auto_83257 ) ) ( not ( = ?auto_83258 ?auto_83256 ) ) ( not ( = ?auto_83260 ?auto_83259 ) ) ( not ( = ?auto_83260 ?auto_83257 ) ) ( not ( = ?auto_83260 ?auto_83256 ) ) ( not ( = ?auto_83254 ?auto_83258 ) ) ( not ( = ?auto_83254 ?auto_83260 ) ) ( not ( = ?auto_83255 ?auto_83258 ) ) ( not ( = ?auto_83255 ?auto_83260 ) ) ( ON ?auto_83255 ?auto_83256 ) ( CLEAR ?auto_83255 ) ( ON ?auto_83254 ?auto_83261 ) ( CLEAR ?auto_83254 ) ( HAND-EMPTY ) ( not ( = ?auto_83254 ?auto_83261 ) ) ( not ( = ?auto_83255 ?auto_83261 ) ) ( not ( = ?auto_83256 ?auto_83261 ) ) ( not ( = ?auto_83257 ?auto_83261 ) ) ( not ( = ?auto_83259 ?auto_83261 ) ) ( not ( = ?auto_83258 ?auto_83261 ) ) ( not ( = ?auto_83260 ?auto_83261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83254 ?auto_83261 )
      ( MAKE-4PILE ?auto_83254 ?auto_83255 ?auto_83256 ?auto_83257 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83262 - BLOCK
      ?auto_83263 - BLOCK
      ?auto_83264 - BLOCK
      ?auto_83265 - BLOCK
    )
    :vars
    (
      ?auto_83268 - BLOCK
      ?auto_83267 - BLOCK
      ?auto_83269 - BLOCK
      ?auto_83266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83262 ?auto_83263 ) ) ( not ( = ?auto_83262 ?auto_83264 ) ) ( not ( = ?auto_83262 ?auto_83265 ) ) ( not ( = ?auto_83263 ?auto_83264 ) ) ( not ( = ?auto_83263 ?auto_83265 ) ) ( not ( = ?auto_83264 ?auto_83265 ) ) ( ON ?auto_83265 ?auto_83268 ) ( not ( = ?auto_83262 ?auto_83268 ) ) ( not ( = ?auto_83263 ?auto_83268 ) ) ( not ( = ?auto_83264 ?auto_83268 ) ) ( not ( = ?auto_83265 ?auto_83268 ) ) ( ON ?auto_83264 ?auto_83265 ) ( ON-TABLE ?auto_83267 ) ( ON ?auto_83269 ?auto_83267 ) ( ON ?auto_83268 ?auto_83269 ) ( not ( = ?auto_83267 ?auto_83269 ) ) ( not ( = ?auto_83267 ?auto_83268 ) ) ( not ( = ?auto_83267 ?auto_83265 ) ) ( not ( = ?auto_83267 ?auto_83264 ) ) ( not ( = ?auto_83269 ?auto_83268 ) ) ( not ( = ?auto_83269 ?auto_83265 ) ) ( not ( = ?auto_83269 ?auto_83264 ) ) ( not ( = ?auto_83262 ?auto_83267 ) ) ( not ( = ?auto_83262 ?auto_83269 ) ) ( not ( = ?auto_83263 ?auto_83267 ) ) ( not ( = ?auto_83263 ?auto_83269 ) ) ( ON ?auto_83262 ?auto_83266 ) ( CLEAR ?auto_83262 ) ( not ( = ?auto_83262 ?auto_83266 ) ) ( not ( = ?auto_83263 ?auto_83266 ) ) ( not ( = ?auto_83264 ?auto_83266 ) ) ( not ( = ?auto_83265 ?auto_83266 ) ) ( not ( = ?auto_83268 ?auto_83266 ) ) ( not ( = ?auto_83267 ?auto_83266 ) ) ( not ( = ?auto_83269 ?auto_83266 ) ) ( HOLDING ?auto_83263 ) ( CLEAR ?auto_83264 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83267 ?auto_83269 ?auto_83268 ?auto_83265 ?auto_83264 ?auto_83263 )
      ( MAKE-4PILE ?auto_83262 ?auto_83263 ?auto_83264 ?auto_83265 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83270 - BLOCK
      ?auto_83271 - BLOCK
      ?auto_83272 - BLOCK
      ?auto_83273 - BLOCK
    )
    :vars
    (
      ?auto_83277 - BLOCK
      ?auto_83275 - BLOCK
      ?auto_83276 - BLOCK
      ?auto_83274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83270 ?auto_83271 ) ) ( not ( = ?auto_83270 ?auto_83272 ) ) ( not ( = ?auto_83270 ?auto_83273 ) ) ( not ( = ?auto_83271 ?auto_83272 ) ) ( not ( = ?auto_83271 ?auto_83273 ) ) ( not ( = ?auto_83272 ?auto_83273 ) ) ( ON ?auto_83273 ?auto_83277 ) ( not ( = ?auto_83270 ?auto_83277 ) ) ( not ( = ?auto_83271 ?auto_83277 ) ) ( not ( = ?auto_83272 ?auto_83277 ) ) ( not ( = ?auto_83273 ?auto_83277 ) ) ( ON ?auto_83272 ?auto_83273 ) ( ON-TABLE ?auto_83275 ) ( ON ?auto_83276 ?auto_83275 ) ( ON ?auto_83277 ?auto_83276 ) ( not ( = ?auto_83275 ?auto_83276 ) ) ( not ( = ?auto_83275 ?auto_83277 ) ) ( not ( = ?auto_83275 ?auto_83273 ) ) ( not ( = ?auto_83275 ?auto_83272 ) ) ( not ( = ?auto_83276 ?auto_83277 ) ) ( not ( = ?auto_83276 ?auto_83273 ) ) ( not ( = ?auto_83276 ?auto_83272 ) ) ( not ( = ?auto_83270 ?auto_83275 ) ) ( not ( = ?auto_83270 ?auto_83276 ) ) ( not ( = ?auto_83271 ?auto_83275 ) ) ( not ( = ?auto_83271 ?auto_83276 ) ) ( ON ?auto_83270 ?auto_83274 ) ( not ( = ?auto_83270 ?auto_83274 ) ) ( not ( = ?auto_83271 ?auto_83274 ) ) ( not ( = ?auto_83272 ?auto_83274 ) ) ( not ( = ?auto_83273 ?auto_83274 ) ) ( not ( = ?auto_83277 ?auto_83274 ) ) ( not ( = ?auto_83275 ?auto_83274 ) ) ( not ( = ?auto_83276 ?auto_83274 ) ) ( CLEAR ?auto_83272 ) ( ON ?auto_83271 ?auto_83270 ) ( CLEAR ?auto_83271 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83274 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83274 ?auto_83270 )
      ( MAKE-4PILE ?auto_83270 ?auto_83271 ?auto_83272 ?auto_83273 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83278 - BLOCK
      ?auto_83279 - BLOCK
      ?auto_83280 - BLOCK
      ?auto_83281 - BLOCK
    )
    :vars
    (
      ?auto_83284 - BLOCK
      ?auto_83283 - BLOCK
      ?auto_83282 - BLOCK
      ?auto_83285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83278 ?auto_83279 ) ) ( not ( = ?auto_83278 ?auto_83280 ) ) ( not ( = ?auto_83278 ?auto_83281 ) ) ( not ( = ?auto_83279 ?auto_83280 ) ) ( not ( = ?auto_83279 ?auto_83281 ) ) ( not ( = ?auto_83280 ?auto_83281 ) ) ( ON ?auto_83281 ?auto_83284 ) ( not ( = ?auto_83278 ?auto_83284 ) ) ( not ( = ?auto_83279 ?auto_83284 ) ) ( not ( = ?auto_83280 ?auto_83284 ) ) ( not ( = ?auto_83281 ?auto_83284 ) ) ( ON-TABLE ?auto_83283 ) ( ON ?auto_83282 ?auto_83283 ) ( ON ?auto_83284 ?auto_83282 ) ( not ( = ?auto_83283 ?auto_83282 ) ) ( not ( = ?auto_83283 ?auto_83284 ) ) ( not ( = ?auto_83283 ?auto_83281 ) ) ( not ( = ?auto_83283 ?auto_83280 ) ) ( not ( = ?auto_83282 ?auto_83284 ) ) ( not ( = ?auto_83282 ?auto_83281 ) ) ( not ( = ?auto_83282 ?auto_83280 ) ) ( not ( = ?auto_83278 ?auto_83283 ) ) ( not ( = ?auto_83278 ?auto_83282 ) ) ( not ( = ?auto_83279 ?auto_83283 ) ) ( not ( = ?auto_83279 ?auto_83282 ) ) ( ON ?auto_83278 ?auto_83285 ) ( not ( = ?auto_83278 ?auto_83285 ) ) ( not ( = ?auto_83279 ?auto_83285 ) ) ( not ( = ?auto_83280 ?auto_83285 ) ) ( not ( = ?auto_83281 ?auto_83285 ) ) ( not ( = ?auto_83284 ?auto_83285 ) ) ( not ( = ?auto_83283 ?auto_83285 ) ) ( not ( = ?auto_83282 ?auto_83285 ) ) ( ON ?auto_83279 ?auto_83278 ) ( CLEAR ?auto_83279 ) ( ON-TABLE ?auto_83285 ) ( HOLDING ?auto_83280 ) ( CLEAR ?auto_83281 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83283 ?auto_83282 ?auto_83284 ?auto_83281 ?auto_83280 )
      ( MAKE-4PILE ?auto_83278 ?auto_83279 ?auto_83280 ?auto_83281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83286 - BLOCK
      ?auto_83287 - BLOCK
      ?auto_83288 - BLOCK
      ?auto_83289 - BLOCK
    )
    :vars
    (
      ?auto_83293 - BLOCK
      ?auto_83291 - BLOCK
      ?auto_83290 - BLOCK
      ?auto_83292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83286 ?auto_83287 ) ) ( not ( = ?auto_83286 ?auto_83288 ) ) ( not ( = ?auto_83286 ?auto_83289 ) ) ( not ( = ?auto_83287 ?auto_83288 ) ) ( not ( = ?auto_83287 ?auto_83289 ) ) ( not ( = ?auto_83288 ?auto_83289 ) ) ( ON ?auto_83289 ?auto_83293 ) ( not ( = ?auto_83286 ?auto_83293 ) ) ( not ( = ?auto_83287 ?auto_83293 ) ) ( not ( = ?auto_83288 ?auto_83293 ) ) ( not ( = ?auto_83289 ?auto_83293 ) ) ( ON-TABLE ?auto_83291 ) ( ON ?auto_83290 ?auto_83291 ) ( ON ?auto_83293 ?auto_83290 ) ( not ( = ?auto_83291 ?auto_83290 ) ) ( not ( = ?auto_83291 ?auto_83293 ) ) ( not ( = ?auto_83291 ?auto_83289 ) ) ( not ( = ?auto_83291 ?auto_83288 ) ) ( not ( = ?auto_83290 ?auto_83293 ) ) ( not ( = ?auto_83290 ?auto_83289 ) ) ( not ( = ?auto_83290 ?auto_83288 ) ) ( not ( = ?auto_83286 ?auto_83291 ) ) ( not ( = ?auto_83286 ?auto_83290 ) ) ( not ( = ?auto_83287 ?auto_83291 ) ) ( not ( = ?auto_83287 ?auto_83290 ) ) ( ON ?auto_83286 ?auto_83292 ) ( not ( = ?auto_83286 ?auto_83292 ) ) ( not ( = ?auto_83287 ?auto_83292 ) ) ( not ( = ?auto_83288 ?auto_83292 ) ) ( not ( = ?auto_83289 ?auto_83292 ) ) ( not ( = ?auto_83293 ?auto_83292 ) ) ( not ( = ?auto_83291 ?auto_83292 ) ) ( not ( = ?auto_83290 ?auto_83292 ) ) ( ON ?auto_83287 ?auto_83286 ) ( ON-TABLE ?auto_83292 ) ( CLEAR ?auto_83289 ) ( ON ?auto_83288 ?auto_83287 ) ( CLEAR ?auto_83288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83292 ?auto_83286 ?auto_83287 )
      ( MAKE-4PILE ?auto_83286 ?auto_83287 ?auto_83288 ?auto_83289 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83294 - BLOCK
      ?auto_83295 - BLOCK
      ?auto_83296 - BLOCK
      ?auto_83297 - BLOCK
    )
    :vars
    (
      ?auto_83301 - BLOCK
      ?auto_83299 - BLOCK
      ?auto_83298 - BLOCK
      ?auto_83300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83294 ?auto_83295 ) ) ( not ( = ?auto_83294 ?auto_83296 ) ) ( not ( = ?auto_83294 ?auto_83297 ) ) ( not ( = ?auto_83295 ?auto_83296 ) ) ( not ( = ?auto_83295 ?auto_83297 ) ) ( not ( = ?auto_83296 ?auto_83297 ) ) ( not ( = ?auto_83294 ?auto_83301 ) ) ( not ( = ?auto_83295 ?auto_83301 ) ) ( not ( = ?auto_83296 ?auto_83301 ) ) ( not ( = ?auto_83297 ?auto_83301 ) ) ( ON-TABLE ?auto_83299 ) ( ON ?auto_83298 ?auto_83299 ) ( ON ?auto_83301 ?auto_83298 ) ( not ( = ?auto_83299 ?auto_83298 ) ) ( not ( = ?auto_83299 ?auto_83301 ) ) ( not ( = ?auto_83299 ?auto_83297 ) ) ( not ( = ?auto_83299 ?auto_83296 ) ) ( not ( = ?auto_83298 ?auto_83301 ) ) ( not ( = ?auto_83298 ?auto_83297 ) ) ( not ( = ?auto_83298 ?auto_83296 ) ) ( not ( = ?auto_83294 ?auto_83299 ) ) ( not ( = ?auto_83294 ?auto_83298 ) ) ( not ( = ?auto_83295 ?auto_83299 ) ) ( not ( = ?auto_83295 ?auto_83298 ) ) ( ON ?auto_83294 ?auto_83300 ) ( not ( = ?auto_83294 ?auto_83300 ) ) ( not ( = ?auto_83295 ?auto_83300 ) ) ( not ( = ?auto_83296 ?auto_83300 ) ) ( not ( = ?auto_83297 ?auto_83300 ) ) ( not ( = ?auto_83301 ?auto_83300 ) ) ( not ( = ?auto_83299 ?auto_83300 ) ) ( not ( = ?auto_83298 ?auto_83300 ) ) ( ON ?auto_83295 ?auto_83294 ) ( ON-TABLE ?auto_83300 ) ( ON ?auto_83296 ?auto_83295 ) ( CLEAR ?auto_83296 ) ( HOLDING ?auto_83297 ) ( CLEAR ?auto_83301 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83299 ?auto_83298 ?auto_83301 ?auto_83297 )
      ( MAKE-4PILE ?auto_83294 ?auto_83295 ?auto_83296 ?auto_83297 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83302 - BLOCK
      ?auto_83303 - BLOCK
      ?auto_83304 - BLOCK
      ?auto_83305 - BLOCK
    )
    :vars
    (
      ?auto_83309 - BLOCK
      ?auto_83306 - BLOCK
      ?auto_83307 - BLOCK
      ?auto_83308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83302 ?auto_83303 ) ) ( not ( = ?auto_83302 ?auto_83304 ) ) ( not ( = ?auto_83302 ?auto_83305 ) ) ( not ( = ?auto_83303 ?auto_83304 ) ) ( not ( = ?auto_83303 ?auto_83305 ) ) ( not ( = ?auto_83304 ?auto_83305 ) ) ( not ( = ?auto_83302 ?auto_83309 ) ) ( not ( = ?auto_83303 ?auto_83309 ) ) ( not ( = ?auto_83304 ?auto_83309 ) ) ( not ( = ?auto_83305 ?auto_83309 ) ) ( ON-TABLE ?auto_83306 ) ( ON ?auto_83307 ?auto_83306 ) ( ON ?auto_83309 ?auto_83307 ) ( not ( = ?auto_83306 ?auto_83307 ) ) ( not ( = ?auto_83306 ?auto_83309 ) ) ( not ( = ?auto_83306 ?auto_83305 ) ) ( not ( = ?auto_83306 ?auto_83304 ) ) ( not ( = ?auto_83307 ?auto_83309 ) ) ( not ( = ?auto_83307 ?auto_83305 ) ) ( not ( = ?auto_83307 ?auto_83304 ) ) ( not ( = ?auto_83302 ?auto_83306 ) ) ( not ( = ?auto_83302 ?auto_83307 ) ) ( not ( = ?auto_83303 ?auto_83306 ) ) ( not ( = ?auto_83303 ?auto_83307 ) ) ( ON ?auto_83302 ?auto_83308 ) ( not ( = ?auto_83302 ?auto_83308 ) ) ( not ( = ?auto_83303 ?auto_83308 ) ) ( not ( = ?auto_83304 ?auto_83308 ) ) ( not ( = ?auto_83305 ?auto_83308 ) ) ( not ( = ?auto_83309 ?auto_83308 ) ) ( not ( = ?auto_83306 ?auto_83308 ) ) ( not ( = ?auto_83307 ?auto_83308 ) ) ( ON ?auto_83303 ?auto_83302 ) ( ON-TABLE ?auto_83308 ) ( ON ?auto_83304 ?auto_83303 ) ( CLEAR ?auto_83309 ) ( ON ?auto_83305 ?auto_83304 ) ( CLEAR ?auto_83305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83308 ?auto_83302 ?auto_83303 ?auto_83304 )
      ( MAKE-4PILE ?auto_83302 ?auto_83303 ?auto_83304 ?auto_83305 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83310 - BLOCK
      ?auto_83311 - BLOCK
      ?auto_83312 - BLOCK
      ?auto_83313 - BLOCK
    )
    :vars
    (
      ?auto_83316 - BLOCK
      ?auto_83314 - BLOCK
      ?auto_83317 - BLOCK
      ?auto_83315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83310 ?auto_83311 ) ) ( not ( = ?auto_83310 ?auto_83312 ) ) ( not ( = ?auto_83310 ?auto_83313 ) ) ( not ( = ?auto_83311 ?auto_83312 ) ) ( not ( = ?auto_83311 ?auto_83313 ) ) ( not ( = ?auto_83312 ?auto_83313 ) ) ( not ( = ?auto_83310 ?auto_83316 ) ) ( not ( = ?auto_83311 ?auto_83316 ) ) ( not ( = ?auto_83312 ?auto_83316 ) ) ( not ( = ?auto_83313 ?auto_83316 ) ) ( ON-TABLE ?auto_83314 ) ( ON ?auto_83317 ?auto_83314 ) ( not ( = ?auto_83314 ?auto_83317 ) ) ( not ( = ?auto_83314 ?auto_83316 ) ) ( not ( = ?auto_83314 ?auto_83313 ) ) ( not ( = ?auto_83314 ?auto_83312 ) ) ( not ( = ?auto_83317 ?auto_83316 ) ) ( not ( = ?auto_83317 ?auto_83313 ) ) ( not ( = ?auto_83317 ?auto_83312 ) ) ( not ( = ?auto_83310 ?auto_83314 ) ) ( not ( = ?auto_83310 ?auto_83317 ) ) ( not ( = ?auto_83311 ?auto_83314 ) ) ( not ( = ?auto_83311 ?auto_83317 ) ) ( ON ?auto_83310 ?auto_83315 ) ( not ( = ?auto_83310 ?auto_83315 ) ) ( not ( = ?auto_83311 ?auto_83315 ) ) ( not ( = ?auto_83312 ?auto_83315 ) ) ( not ( = ?auto_83313 ?auto_83315 ) ) ( not ( = ?auto_83316 ?auto_83315 ) ) ( not ( = ?auto_83314 ?auto_83315 ) ) ( not ( = ?auto_83317 ?auto_83315 ) ) ( ON ?auto_83311 ?auto_83310 ) ( ON-TABLE ?auto_83315 ) ( ON ?auto_83312 ?auto_83311 ) ( ON ?auto_83313 ?auto_83312 ) ( CLEAR ?auto_83313 ) ( HOLDING ?auto_83316 ) ( CLEAR ?auto_83317 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83314 ?auto_83317 ?auto_83316 )
      ( MAKE-4PILE ?auto_83310 ?auto_83311 ?auto_83312 ?auto_83313 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83318 - BLOCK
      ?auto_83319 - BLOCK
      ?auto_83320 - BLOCK
      ?auto_83321 - BLOCK
    )
    :vars
    (
      ?auto_83324 - BLOCK
      ?auto_83323 - BLOCK
      ?auto_83322 - BLOCK
      ?auto_83325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83318 ?auto_83319 ) ) ( not ( = ?auto_83318 ?auto_83320 ) ) ( not ( = ?auto_83318 ?auto_83321 ) ) ( not ( = ?auto_83319 ?auto_83320 ) ) ( not ( = ?auto_83319 ?auto_83321 ) ) ( not ( = ?auto_83320 ?auto_83321 ) ) ( not ( = ?auto_83318 ?auto_83324 ) ) ( not ( = ?auto_83319 ?auto_83324 ) ) ( not ( = ?auto_83320 ?auto_83324 ) ) ( not ( = ?auto_83321 ?auto_83324 ) ) ( ON-TABLE ?auto_83323 ) ( ON ?auto_83322 ?auto_83323 ) ( not ( = ?auto_83323 ?auto_83322 ) ) ( not ( = ?auto_83323 ?auto_83324 ) ) ( not ( = ?auto_83323 ?auto_83321 ) ) ( not ( = ?auto_83323 ?auto_83320 ) ) ( not ( = ?auto_83322 ?auto_83324 ) ) ( not ( = ?auto_83322 ?auto_83321 ) ) ( not ( = ?auto_83322 ?auto_83320 ) ) ( not ( = ?auto_83318 ?auto_83323 ) ) ( not ( = ?auto_83318 ?auto_83322 ) ) ( not ( = ?auto_83319 ?auto_83323 ) ) ( not ( = ?auto_83319 ?auto_83322 ) ) ( ON ?auto_83318 ?auto_83325 ) ( not ( = ?auto_83318 ?auto_83325 ) ) ( not ( = ?auto_83319 ?auto_83325 ) ) ( not ( = ?auto_83320 ?auto_83325 ) ) ( not ( = ?auto_83321 ?auto_83325 ) ) ( not ( = ?auto_83324 ?auto_83325 ) ) ( not ( = ?auto_83323 ?auto_83325 ) ) ( not ( = ?auto_83322 ?auto_83325 ) ) ( ON ?auto_83319 ?auto_83318 ) ( ON-TABLE ?auto_83325 ) ( ON ?auto_83320 ?auto_83319 ) ( ON ?auto_83321 ?auto_83320 ) ( CLEAR ?auto_83322 ) ( ON ?auto_83324 ?auto_83321 ) ( CLEAR ?auto_83324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83325 ?auto_83318 ?auto_83319 ?auto_83320 ?auto_83321 )
      ( MAKE-4PILE ?auto_83318 ?auto_83319 ?auto_83320 ?auto_83321 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83326 - BLOCK
      ?auto_83327 - BLOCK
      ?auto_83328 - BLOCK
      ?auto_83329 - BLOCK
    )
    :vars
    (
      ?auto_83333 - BLOCK
      ?auto_83332 - BLOCK
      ?auto_83330 - BLOCK
      ?auto_83331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83326 ?auto_83327 ) ) ( not ( = ?auto_83326 ?auto_83328 ) ) ( not ( = ?auto_83326 ?auto_83329 ) ) ( not ( = ?auto_83327 ?auto_83328 ) ) ( not ( = ?auto_83327 ?auto_83329 ) ) ( not ( = ?auto_83328 ?auto_83329 ) ) ( not ( = ?auto_83326 ?auto_83333 ) ) ( not ( = ?auto_83327 ?auto_83333 ) ) ( not ( = ?auto_83328 ?auto_83333 ) ) ( not ( = ?auto_83329 ?auto_83333 ) ) ( ON-TABLE ?auto_83332 ) ( not ( = ?auto_83332 ?auto_83330 ) ) ( not ( = ?auto_83332 ?auto_83333 ) ) ( not ( = ?auto_83332 ?auto_83329 ) ) ( not ( = ?auto_83332 ?auto_83328 ) ) ( not ( = ?auto_83330 ?auto_83333 ) ) ( not ( = ?auto_83330 ?auto_83329 ) ) ( not ( = ?auto_83330 ?auto_83328 ) ) ( not ( = ?auto_83326 ?auto_83332 ) ) ( not ( = ?auto_83326 ?auto_83330 ) ) ( not ( = ?auto_83327 ?auto_83332 ) ) ( not ( = ?auto_83327 ?auto_83330 ) ) ( ON ?auto_83326 ?auto_83331 ) ( not ( = ?auto_83326 ?auto_83331 ) ) ( not ( = ?auto_83327 ?auto_83331 ) ) ( not ( = ?auto_83328 ?auto_83331 ) ) ( not ( = ?auto_83329 ?auto_83331 ) ) ( not ( = ?auto_83333 ?auto_83331 ) ) ( not ( = ?auto_83332 ?auto_83331 ) ) ( not ( = ?auto_83330 ?auto_83331 ) ) ( ON ?auto_83327 ?auto_83326 ) ( ON-TABLE ?auto_83331 ) ( ON ?auto_83328 ?auto_83327 ) ( ON ?auto_83329 ?auto_83328 ) ( ON ?auto_83333 ?auto_83329 ) ( CLEAR ?auto_83333 ) ( HOLDING ?auto_83330 ) ( CLEAR ?auto_83332 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83332 ?auto_83330 )
      ( MAKE-4PILE ?auto_83326 ?auto_83327 ?auto_83328 ?auto_83329 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83334 - BLOCK
      ?auto_83335 - BLOCK
      ?auto_83336 - BLOCK
      ?auto_83337 - BLOCK
    )
    :vars
    (
      ?auto_83340 - BLOCK
      ?auto_83339 - BLOCK
      ?auto_83338 - BLOCK
      ?auto_83341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83334 ?auto_83335 ) ) ( not ( = ?auto_83334 ?auto_83336 ) ) ( not ( = ?auto_83334 ?auto_83337 ) ) ( not ( = ?auto_83335 ?auto_83336 ) ) ( not ( = ?auto_83335 ?auto_83337 ) ) ( not ( = ?auto_83336 ?auto_83337 ) ) ( not ( = ?auto_83334 ?auto_83340 ) ) ( not ( = ?auto_83335 ?auto_83340 ) ) ( not ( = ?auto_83336 ?auto_83340 ) ) ( not ( = ?auto_83337 ?auto_83340 ) ) ( ON-TABLE ?auto_83339 ) ( not ( = ?auto_83339 ?auto_83338 ) ) ( not ( = ?auto_83339 ?auto_83340 ) ) ( not ( = ?auto_83339 ?auto_83337 ) ) ( not ( = ?auto_83339 ?auto_83336 ) ) ( not ( = ?auto_83338 ?auto_83340 ) ) ( not ( = ?auto_83338 ?auto_83337 ) ) ( not ( = ?auto_83338 ?auto_83336 ) ) ( not ( = ?auto_83334 ?auto_83339 ) ) ( not ( = ?auto_83334 ?auto_83338 ) ) ( not ( = ?auto_83335 ?auto_83339 ) ) ( not ( = ?auto_83335 ?auto_83338 ) ) ( ON ?auto_83334 ?auto_83341 ) ( not ( = ?auto_83334 ?auto_83341 ) ) ( not ( = ?auto_83335 ?auto_83341 ) ) ( not ( = ?auto_83336 ?auto_83341 ) ) ( not ( = ?auto_83337 ?auto_83341 ) ) ( not ( = ?auto_83340 ?auto_83341 ) ) ( not ( = ?auto_83339 ?auto_83341 ) ) ( not ( = ?auto_83338 ?auto_83341 ) ) ( ON ?auto_83335 ?auto_83334 ) ( ON-TABLE ?auto_83341 ) ( ON ?auto_83336 ?auto_83335 ) ( ON ?auto_83337 ?auto_83336 ) ( ON ?auto_83340 ?auto_83337 ) ( CLEAR ?auto_83339 ) ( ON ?auto_83338 ?auto_83340 ) ( CLEAR ?auto_83338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83341 ?auto_83334 ?auto_83335 ?auto_83336 ?auto_83337 ?auto_83340 )
      ( MAKE-4PILE ?auto_83334 ?auto_83335 ?auto_83336 ?auto_83337 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83342 - BLOCK
      ?auto_83343 - BLOCK
      ?auto_83344 - BLOCK
      ?auto_83345 - BLOCK
    )
    :vars
    (
      ?auto_83349 - BLOCK
      ?auto_83348 - BLOCK
      ?auto_83346 - BLOCK
      ?auto_83347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83342 ?auto_83343 ) ) ( not ( = ?auto_83342 ?auto_83344 ) ) ( not ( = ?auto_83342 ?auto_83345 ) ) ( not ( = ?auto_83343 ?auto_83344 ) ) ( not ( = ?auto_83343 ?auto_83345 ) ) ( not ( = ?auto_83344 ?auto_83345 ) ) ( not ( = ?auto_83342 ?auto_83349 ) ) ( not ( = ?auto_83343 ?auto_83349 ) ) ( not ( = ?auto_83344 ?auto_83349 ) ) ( not ( = ?auto_83345 ?auto_83349 ) ) ( not ( = ?auto_83348 ?auto_83346 ) ) ( not ( = ?auto_83348 ?auto_83349 ) ) ( not ( = ?auto_83348 ?auto_83345 ) ) ( not ( = ?auto_83348 ?auto_83344 ) ) ( not ( = ?auto_83346 ?auto_83349 ) ) ( not ( = ?auto_83346 ?auto_83345 ) ) ( not ( = ?auto_83346 ?auto_83344 ) ) ( not ( = ?auto_83342 ?auto_83348 ) ) ( not ( = ?auto_83342 ?auto_83346 ) ) ( not ( = ?auto_83343 ?auto_83348 ) ) ( not ( = ?auto_83343 ?auto_83346 ) ) ( ON ?auto_83342 ?auto_83347 ) ( not ( = ?auto_83342 ?auto_83347 ) ) ( not ( = ?auto_83343 ?auto_83347 ) ) ( not ( = ?auto_83344 ?auto_83347 ) ) ( not ( = ?auto_83345 ?auto_83347 ) ) ( not ( = ?auto_83349 ?auto_83347 ) ) ( not ( = ?auto_83348 ?auto_83347 ) ) ( not ( = ?auto_83346 ?auto_83347 ) ) ( ON ?auto_83343 ?auto_83342 ) ( ON-TABLE ?auto_83347 ) ( ON ?auto_83344 ?auto_83343 ) ( ON ?auto_83345 ?auto_83344 ) ( ON ?auto_83349 ?auto_83345 ) ( ON ?auto_83346 ?auto_83349 ) ( CLEAR ?auto_83346 ) ( HOLDING ?auto_83348 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83348 )
      ( MAKE-4PILE ?auto_83342 ?auto_83343 ?auto_83344 ?auto_83345 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_83350 - BLOCK
      ?auto_83351 - BLOCK
      ?auto_83352 - BLOCK
      ?auto_83353 - BLOCK
    )
    :vars
    (
      ?auto_83357 - BLOCK
      ?auto_83356 - BLOCK
      ?auto_83354 - BLOCK
      ?auto_83355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83350 ?auto_83351 ) ) ( not ( = ?auto_83350 ?auto_83352 ) ) ( not ( = ?auto_83350 ?auto_83353 ) ) ( not ( = ?auto_83351 ?auto_83352 ) ) ( not ( = ?auto_83351 ?auto_83353 ) ) ( not ( = ?auto_83352 ?auto_83353 ) ) ( not ( = ?auto_83350 ?auto_83357 ) ) ( not ( = ?auto_83351 ?auto_83357 ) ) ( not ( = ?auto_83352 ?auto_83357 ) ) ( not ( = ?auto_83353 ?auto_83357 ) ) ( not ( = ?auto_83356 ?auto_83354 ) ) ( not ( = ?auto_83356 ?auto_83357 ) ) ( not ( = ?auto_83356 ?auto_83353 ) ) ( not ( = ?auto_83356 ?auto_83352 ) ) ( not ( = ?auto_83354 ?auto_83357 ) ) ( not ( = ?auto_83354 ?auto_83353 ) ) ( not ( = ?auto_83354 ?auto_83352 ) ) ( not ( = ?auto_83350 ?auto_83356 ) ) ( not ( = ?auto_83350 ?auto_83354 ) ) ( not ( = ?auto_83351 ?auto_83356 ) ) ( not ( = ?auto_83351 ?auto_83354 ) ) ( ON ?auto_83350 ?auto_83355 ) ( not ( = ?auto_83350 ?auto_83355 ) ) ( not ( = ?auto_83351 ?auto_83355 ) ) ( not ( = ?auto_83352 ?auto_83355 ) ) ( not ( = ?auto_83353 ?auto_83355 ) ) ( not ( = ?auto_83357 ?auto_83355 ) ) ( not ( = ?auto_83356 ?auto_83355 ) ) ( not ( = ?auto_83354 ?auto_83355 ) ) ( ON ?auto_83351 ?auto_83350 ) ( ON-TABLE ?auto_83355 ) ( ON ?auto_83352 ?auto_83351 ) ( ON ?auto_83353 ?auto_83352 ) ( ON ?auto_83357 ?auto_83353 ) ( ON ?auto_83354 ?auto_83357 ) ( ON ?auto_83356 ?auto_83354 ) ( CLEAR ?auto_83356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83355 ?auto_83350 ?auto_83351 ?auto_83352 ?auto_83353 ?auto_83357 ?auto_83354 )
      ( MAKE-4PILE ?auto_83350 ?auto_83351 ?auto_83352 ?auto_83353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83360 - BLOCK
      ?auto_83361 - BLOCK
    )
    :vars
    (
      ?auto_83362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83362 ?auto_83361 ) ( CLEAR ?auto_83362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83360 ) ( ON ?auto_83361 ?auto_83360 ) ( not ( = ?auto_83360 ?auto_83361 ) ) ( not ( = ?auto_83360 ?auto_83362 ) ) ( not ( = ?auto_83361 ?auto_83362 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83362 ?auto_83361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83363 - BLOCK
      ?auto_83364 - BLOCK
    )
    :vars
    (
      ?auto_83365 - BLOCK
      ?auto_83366 - BLOCK
      ?auto_83367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83365 ?auto_83364 ) ( CLEAR ?auto_83365 ) ( ON-TABLE ?auto_83363 ) ( ON ?auto_83364 ?auto_83363 ) ( not ( = ?auto_83363 ?auto_83364 ) ) ( not ( = ?auto_83363 ?auto_83365 ) ) ( not ( = ?auto_83364 ?auto_83365 ) ) ( HOLDING ?auto_83366 ) ( CLEAR ?auto_83367 ) ( not ( = ?auto_83363 ?auto_83366 ) ) ( not ( = ?auto_83363 ?auto_83367 ) ) ( not ( = ?auto_83364 ?auto_83366 ) ) ( not ( = ?auto_83364 ?auto_83367 ) ) ( not ( = ?auto_83365 ?auto_83366 ) ) ( not ( = ?auto_83365 ?auto_83367 ) ) ( not ( = ?auto_83366 ?auto_83367 ) ) )
    :subtasks
    ( ( !STACK ?auto_83366 ?auto_83367 )
      ( MAKE-2PILE ?auto_83363 ?auto_83364 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83368 - BLOCK
      ?auto_83369 - BLOCK
    )
    :vars
    (
      ?auto_83371 - BLOCK
      ?auto_83372 - BLOCK
      ?auto_83370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83371 ?auto_83369 ) ( ON-TABLE ?auto_83368 ) ( ON ?auto_83369 ?auto_83368 ) ( not ( = ?auto_83368 ?auto_83369 ) ) ( not ( = ?auto_83368 ?auto_83371 ) ) ( not ( = ?auto_83369 ?auto_83371 ) ) ( CLEAR ?auto_83372 ) ( not ( = ?auto_83368 ?auto_83370 ) ) ( not ( = ?auto_83368 ?auto_83372 ) ) ( not ( = ?auto_83369 ?auto_83370 ) ) ( not ( = ?auto_83369 ?auto_83372 ) ) ( not ( = ?auto_83371 ?auto_83370 ) ) ( not ( = ?auto_83371 ?auto_83372 ) ) ( not ( = ?auto_83370 ?auto_83372 ) ) ( ON ?auto_83370 ?auto_83371 ) ( CLEAR ?auto_83370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83368 ?auto_83369 ?auto_83371 )
      ( MAKE-2PILE ?auto_83368 ?auto_83369 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83373 - BLOCK
      ?auto_83374 - BLOCK
    )
    :vars
    (
      ?auto_83377 - BLOCK
      ?auto_83375 - BLOCK
      ?auto_83376 - BLOCK
      ?auto_83379 - BLOCK
      ?auto_83378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83377 ?auto_83374 ) ( ON-TABLE ?auto_83373 ) ( ON ?auto_83374 ?auto_83373 ) ( not ( = ?auto_83373 ?auto_83374 ) ) ( not ( = ?auto_83373 ?auto_83377 ) ) ( not ( = ?auto_83374 ?auto_83377 ) ) ( not ( = ?auto_83373 ?auto_83375 ) ) ( not ( = ?auto_83373 ?auto_83376 ) ) ( not ( = ?auto_83374 ?auto_83375 ) ) ( not ( = ?auto_83374 ?auto_83376 ) ) ( not ( = ?auto_83377 ?auto_83375 ) ) ( not ( = ?auto_83377 ?auto_83376 ) ) ( not ( = ?auto_83375 ?auto_83376 ) ) ( ON ?auto_83375 ?auto_83377 ) ( CLEAR ?auto_83375 ) ( HOLDING ?auto_83376 ) ( CLEAR ?auto_83379 ) ( ON-TABLE ?auto_83378 ) ( ON ?auto_83379 ?auto_83378 ) ( not ( = ?auto_83378 ?auto_83379 ) ) ( not ( = ?auto_83378 ?auto_83376 ) ) ( not ( = ?auto_83379 ?auto_83376 ) ) ( not ( = ?auto_83373 ?auto_83379 ) ) ( not ( = ?auto_83373 ?auto_83378 ) ) ( not ( = ?auto_83374 ?auto_83379 ) ) ( not ( = ?auto_83374 ?auto_83378 ) ) ( not ( = ?auto_83377 ?auto_83379 ) ) ( not ( = ?auto_83377 ?auto_83378 ) ) ( not ( = ?auto_83375 ?auto_83379 ) ) ( not ( = ?auto_83375 ?auto_83378 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83378 ?auto_83379 ?auto_83376 )
      ( MAKE-2PILE ?auto_83373 ?auto_83374 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83380 - BLOCK
      ?auto_83381 - BLOCK
    )
    :vars
    (
      ?auto_83383 - BLOCK
      ?auto_83385 - BLOCK
      ?auto_83386 - BLOCK
      ?auto_83384 - BLOCK
      ?auto_83382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83383 ?auto_83381 ) ( ON-TABLE ?auto_83380 ) ( ON ?auto_83381 ?auto_83380 ) ( not ( = ?auto_83380 ?auto_83381 ) ) ( not ( = ?auto_83380 ?auto_83383 ) ) ( not ( = ?auto_83381 ?auto_83383 ) ) ( not ( = ?auto_83380 ?auto_83385 ) ) ( not ( = ?auto_83380 ?auto_83386 ) ) ( not ( = ?auto_83381 ?auto_83385 ) ) ( not ( = ?auto_83381 ?auto_83386 ) ) ( not ( = ?auto_83383 ?auto_83385 ) ) ( not ( = ?auto_83383 ?auto_83386 ) ) ( not ( = ?auto_83385 ?auto_83386 ) ) ( ON ?auto_83385 ?auto_83383 ) ( CLEAR ?auto_83384 ) ( ON-TABLE ?auto_83382 ) ( ON ?auto_83384 ?auto_83382 ) ( not ( = ?auto_83382 ?auto_83384 ) ) ( not ( = ?auto_83382 ?auto_83386 ) ) ( not ( = ?auto_83384 ?auto_83386 ) ) ( not ( = ?auto_83380 ?auto_83384 ) ) ( not ( = ?auto_83380 ?auto_83382 ) ) ( not ( = ?auto_83381 ?auto_83384 ) ) ( not ( = ?auto_83381 ?auto_83382 ) ) ( not ( = ?auto_83383 ?auto_83384 ) ) ( not ( = ?auto_83383 ?auto_83382 ) ) ( not ( = ?auto_83385 ?auto_83384 ) ) ( not ( = ?auto_83385 ?auto_83382 ) ) ( ON ?auto_83386 ?auto_83385 ) ( CLEAR ?auto_83386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83380 ?auto_83381 ?auto_83383 ?auto_83385 )
      ( MAKE-2PILE ?auto_83380 ?auto_83381 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83387 - BLOCK
      ?auto_83388 - BLOCK
    )
    :vars
    (
      ?auto_83389 - BLOCK
      ?auto_83390 - BLOCK
      ?auto_83392 - BLOCK
      ?auto_83391 - BLOCK
      ?auto_83393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83389 ?auto_83388 ) ( ON-TABLE ?auto_83387 ) ( ON ?auto_83388 ?auto_83387 ) ( not ( = ?auto_83387 ?auto_83388 ) ) ( not ( = ?auto_83387 ?auto_83389 ) ) ( not ( = ?auto_83388 ?auto_83389 ) ) ( not ( = ?auto_83387 ?auto_83390 ) ) ( not ( = ?auto_83387 ?auto_83392 ) ) ( not ( = ?auto_83388 ?auto_83390 ) ) ( not ( = ?auto_83388 ?auto_83392 ) ) ( not ( = ?auto_83389 ?auto_83390 ) ) ( not ( = ?auto_83389 ?auto_83392 ) ) ( not ( = ?auto_83390 ?auto_83392 ) ) ( ON ?auto_83390 ?auto_83389 ) ( ON-TABLE ?auto_83391 ) ( not ( = ?auto_83391 ?auto_83393 ) ) ( not ( = ?auto_83391 ?auto_83392 ) ) ( not ( = ?auto_83393 ?auto_83392 ) ) ( not ( = ?auto_83387 ?auto_83393 ) ) ( not ( = ?auto_83387 ?auto_83391 ) ) ( not ( = ?auto_83388 ?auto_83393 ) ) ( not ( = ?auto_83388 ?auto_83391 ) ) ( not ( = ?auto_83389 ?auto_83393 ) ) ( not ( = ?auto_83389 ?auto_83391 ) ) ( not ( = ?auto_83390 ?auto_83393 ) ) ( not ( = ?auto_83390 ?auto_83391 ) ) ( ON ?auto_83392 ?auto_83390 ) ( CLEAR ?auto_83392 ) ( HOLDING ?auto_83393 ) ( CLEAR ?auto_83391 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83391 ?auto_83393 )
      ( MAKE-2PILE ?auto_83387 ?auto_83388 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83394 - BLOCK
      ?auto_83395 - BLOCK
    )
    :vars
    (
      ?auto_83396 - BLOCK
      ?auto_83398 - BLOCK
      ?auto_83397 - BLOCK
      ?auto_83400 - BLOCK
      ?auto_83399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83396 ?auto_83395 ) ( ON-TABLE ?auto_83394 ) ( ON ?auto_83395 ?auto_83394 ) ( not ( = ?auto_83394 ?auto_83395 ) ) ( not ( = ?auto_83394 ?auto_83396 ) ) ( not ( = ?auto_83395 ?auto_83396 ) ) ( not ( = ?auto_83394 ?auto_83398 ) ) ( not ( = ?auto_83394 ?auto_83397 ) ) ( not ( = ?auto_83395 ?auto_83398 ) ) ( not ( = ?auto_83395 ?auto_83397 ) ) ( not ( = ?auto_83396 ?auto_83398 ) ) ( not ( = ?auto_83396 ?auto_83397 ) ) ( not ( = ?auto_83398 ?auto_83397 ) ) ( ON ?auto_83398 ?auto_83396 ) ( ON-TABLE ?auto_83400 ) ( not ( = ?auto_83400 ?auto_83399 ) ) ( not ( = ?auto_83400 ?auto_83397 ) ) ( not ( = ?auto_83399 ?auto_83397 ) ) ( not ( = ?auto_83394 ?auto_83399 ) ) ( not ( = ?auto_83394 ?auto_83400 ) ) ( not ( = ?auto_83395 ?auto_83399 ) ) ( not ( = ?auto_83395 ?auto_83400 ) ) ( not ( = ?auto_83396 ?auto_83399 ) ) ( not ( = ?auto_83396 ?auto_83400 ) ) ( not ( = ?auto_83398 ?auto_83399 ) ) ( not ( = ?auto_83398 ?auto_83400 ) ) ( ON ?auto_83397 ?auto_83398 ) ( CLEAR ?auto_83400 ) ( ON ?auto_83399 ?auto_83397 ) ( CLEAR ?auto_83399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83394 ?auto_83395 ?auto_83396 ?auto_83398 ?auto_83397 )
      ( MAKE-2PILE ?auto_83394 ?auto_83395 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83401 - BLOCK
      ?auto_83402 - BLOCK
    )
    :vars
    (
      ?auto_83405 - BLOCK
      ?auto_83403 - BLOCK
      ?auto_83406 - BLOCK
      ?auto_83404 - BLOCK
      ?auto_83407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83405 ?auto_83402 ) ( ON-TABLE ?auto_83401 ) ( ON ?auto_83402 ?auto_83401 ) ( not ( = ?auto_83401 ?auto_83402 ) ) ( not ( = ?auto_83401 ?auto_83405 ) ) ( not ( = ?auto_83402 ?auto_83405 ) ) ( not ( = ?auto_83401 ?auto_83403 ) ) ( not ( = ?auto_83401 ?auto_83406 ) ) ( not ( = ?auto_83402 ?auto_83403 ) ) ( not ( = ?auto_83402 ?auto_83406 ) ) ( not ( = ?auto_83405 ?auto_83403 ) ) ( not ( = ?auto_83405 ?auto_83406 ) ) ( not ( = ?auto_83403 ?auto_83406 ) ) ( ON ?auto_83403 ?auto_83405 ) ( not ( = ?auto_83404 ?auto_83407 ) ) ( not ( = ?auto_83404 ?auto_83406 ) ) ( not ( = ?auto_83407 ?auto_83406 ) ) ( not ( = ?auto_83401 ?auto_83407 ) ) ( not ( = ?auto_83401 ?auto_83404 ) ) ( not ( = ?auto_83402 ?auto_83407 ) ) ( not ( = ?auto_83402 ?auto_83404 ) ) ( not ( = ?auto_83405 ?auto_83407 ) ) ( not ( = ?auto_83405 ?auto_83404 ) ) ( not ( = ?auto_83403 ?auto_83407 ) ) ( not ( = ?auto_83403 ?auto_83404 ) ) ( ON ?auto_83406 ?auto_83403 ) ( ON ?auto_83407 ?auto_83406 ) ( CLEAR ?auto_83407 ) ( HOLDING ?auto_83404 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83404 )
      ( MAKE-2PILE ?auto_83401 ?auto_83402 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83408 - BLOCK
      ?auto_83409 - BLOCK
    )
    :vars
    (
      ?auto_83412 - BLOCK
      ?auto_83414 - BLOCK
      ?auto_83411 - BLOCK
      ?auto_83413 - BLOCK
      ?auto_83410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83412 ?auto_83409 ) ( ON-TABLE ?auto_83408 ) ( ON ?auto_83409 ?auto_83408 ) ( not ( = ?auto_83408 ?auto_83409 ) ) ( not ( = ?auto_83408 ?auto_83412 ) ) ( not ( = ?auto_83409 ?auto_83412 ) ) ( not ( = ?auto_83408 ?auto_83414 ) ) ( not ( = ?auto_83408 ?auto_83411 ) ) ( not ( = ?auto_83409 ?auto_83414 ) ) ( not ( = ?auto_83409 ?auto_83411 ) ) ( not ( = ?auto_83412 ?auto_83414 ) ) ( not ( = ?auto_83412 ?auto_83411 ) ) ( not ( = ?auto_83414 ?auto_83411 ) ) ( ON ?auto_83414 ?auto_83412 ) ( not ( = ?auto_83413 ?auto_83410 ) ) ( not ( = ?auto_83413 ?auto_83411 ) ) ( not ( = ?auto_83410 ?auto_83411 ) ) ( not ( = ?auto_83408 ?auto_83410 ) ) ( not ( = ?auto_83408 ?auto_83413 ) ) ( not ( = ?auto_83409 ?auto_83410 ) ) ( not ( = ?auto_83409 ?auto_83413 ) ) ( not ( = ?auto_83412 ?auto_83410 ) ) ( not ( = ?auto_83412 ?auto_83413 ) ) ( not ( = ?auto_83414 ?auto_83410 ) ) ( not ( = ?auto_83414 ?auto_83413 ) ) ( ON ?auto_83411 ?auto_83414 ) ( ON ?auto_83410 ?auto_83411 ) ( ON ?auto_83413 ?auto_83410 ) ( CLEAR ?auto_83413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83408 ?auto_83409 ?auto_83412 ?auto_83414 ?auto_83411 ?auto_83410 )
      ( MAKE-2PILE ?auto_83408 ?auto_83409 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83415 - BLOCK
      ?auto_83416 - BLOCK
    )
    :vars
    (
      ?auto_83419 - BLOCK
      ?auto_83420 - BLOCK
      ?auto_83418 - BLOCK
      ?auto_83421 - BLOCK
      ?auto_83417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83419 ?auto_83416 ) ( ON-TABLE ?auto_83415 ) ( ON ?auto_83416 ?auto_83415 ) ( not ( = ?auto_83415 ?auto_83416 ) ) ( not ( = ?auto_83415 ?auto_83419 ) ) ( not ( = ?auto_83416 ?auto_83419 ) ) ( not ( = ?auto_83415 ?auto_83420 ) ) ( not ( = ?auto_83415 ?auto_83418 ) ) ( not ( = ?auto_83416 ?auto_83420 ) ) ( not ( = ?auto_83416 ?auto_83418 ) ) ( not ( = ?auto_83419 ?auto_83420 ) ) ( not ( = ?auto_83419 ?auto_83418 ) ) ( not ( = ?auto_83420 ?auto_83418 ) ) ( ON ?auto_83420 ?auto_83419 ) ( not ( = ?auto_83421 ?auto_83417 ) ) ( not ( = ?auto_83421 ?auto_83418 ) ) ( not ( = ?auto_83417 ?auto_83418 ) ) ( not ( = ?auto_83415 ?auto_83417 ) ) ( not ( = ?auto_83415 ?auto_83421 ) ) ( not ( = ?auto_83416 ?auto_83417 ) ) ( not ( = ?auto_83416 ?auto_83421 ) ) ( not ( = ?auto_83419 ?auto_83417 ) ) ( not ( = ?auto_83419 ?auto_83421 ) ) ( not ( = ?auto_83420 ?auto_83417 ) ) ( not ( = ?auto_83420 ?auto_83421 ) ) ( ON ?auto_83418 ?auto_83420 ) ( ON ?auto_83417 ?auto_83418 ) ( HOLDING ?auto_83421 ) ( CLEAR ?auto_83417 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83415 ?auto_83416 ?auto_83419 ?auto_83420 ?auto_83418 ?auto_83417 ?auto_83421 )
      ( MAKE-2PILE ?auto_83415 ?auto_83416 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83422 - BLOCK
      ?auto_83423 - BLOCK
    )
    :vars
    (
      ?auto_83428 - BLOCK
      ?auto_83424 - BLOCK
      ?auto_83427 - BLOCK
      ?auto_83426 - BLOCK
      ?auto_83425 - BLOCK
      ?auto_83429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83428 ?auto_83423 ) ( ON-TABLE ?auto_83422 ) ( ON ?auto_83423 ?auto_83422 ) ( not ( = ?auto_83422 ?auto_83423 ) ) ( not ( = ?auto_83422 ?auto_83428 ) ) ( not ( = ?auto_83423 ?auto_83428 ) ) ( not ( = ?auto_83422 ?auto_83424 ) ) ( not ( = ?auto_83422 ?auto_83427 ) ) ( not ( = ?auto_83423 ?auto_83424 ) ) ( not ( = ?auto_83423 ?auto_83427 ) ) ( not ( = ?auto_83428 ?auto_83424 ) ) ( not ( = ?auto_83428 ?auto_83427 ) ) ( not ( = ?auto_83424 ?auto_83427 ) ) ( ON ?auto_83424 ?auto_83428 ) ( not ( = ?auto_83426 ?auto_83425 ) ) ( not ( = ?auto_83426 ?auto_83427 ) ) ( not ( = ?auto_83425 ?auto_83427 ) ) ( not ( = ?auto_83422 ?auto_83425 ) ) ( not ( = ?auto_83422 ?auto_83426 ) ) ( not ( = ?auto_83423 ?auto_83425 ) ) ( not ( = ?auto_83423 ?auto_83426 ) ) ( not ( = ?auto_83428 ?auto_83425 ) ) ( not ( = ?auto_83428 ?auto_83426 ) ) ( not ( = ?auto_83424 ?auto_83425 ) ) ( not ( = ?auto_83424 ?auto_83426 ) ) ( ON ?auto_83427 ?auto_83424 ) ( ON ?auto_83425 ?auto_83427 ) ( CLEAR ?auto_83425 ) ( ON ?auto_83426 ?auto_83429 ) ( CLEAR ?auto_83426 ) ( HAND-EMPTY ) ( not ( = ?auto_83422 ?auto_83429 ) ) ( not ( = ?auto_83423 ?auto_83429 ) ) ( not ( = ?auto_83428 ?auto_83429 ) ) ( not ( = ?auto_83424 ?auto_83429 ) ) ( not ( = ?auto_83427 ?auto_83429 ) ) ( not ( = ?auto_83426 ?auto_83429 ) ) ( not ( = ?auto_83425 ?auto_83429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83426 ?auto_83429 )
      ( MAKE-2PILE ?auto_83422 ?auto_83423 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83430 - BLOCK
      ?auto_83431 - BLOCK
    )
    :vars
    (
      ?auto_83432 - BLOCK
      ?auto_83436 - BLOCK
      ?auto_83433 - BLOCK
      ?auto_83437 - BLOCK
      ?auto_83435 - BLOCK
      ?auto_83434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83432 ?auto_83431 ) ( ON-TABLE ?auto_83430 ) ( ON ?auto_83431 ?auto_83430 ) ( not ( = ?auto_83430 ?auto_83431 ) ) ( not ( = ?auto_83430 ?auto_83432 ) ) ( not ( = ?auto_83431 ?auto_83432 ) ) ( not ( = ?auto_83430 ?auto_83436 ) ) ( not ( = ?auto_83430 ?auto_83433 ) ) ( not ( = ?auto_83431 ?auto_83436 ) ) ( not ( = ?auto_83431 ?auto_83433 ) ) ( not ( = ?auto_83432 ?auto_83436 ) ) ( not ( = ?auto_83432 ?auto_83433 ) ) ( not ( = ?auto_83436 ?auto_83433 ) ) ( ON ?auto_83436 ?auto_83432 ) ( not ( = ?auto_83437 ?auto_83435 ) ) ( not ( = ?auto_83437 ?auto_83433 ) ) ( not ( = ?auto_83435 ?auto_83433 ) ) ( not ( = ?auto_83430 ?auto_83435 ) ) ( not ( = ?auto_83430 ?auto_83437 ) ) ( not ( = ?auto_83431 ?auto_83435 ) ) ( not ( = ?auto_83431 ?auto_83437 ) ) ( not ( = ?auto_83432 ?auto_83435 ) ) ( not ( = ?auto_83432 ?auto_83437 ) ) ( not ( = ?auto_83436 ?auto_83435 ) ) ( not ( = ?auto_83436 ?auto_83437 ) ) ( ON ?auto_83433 ?auto_83436 ) ( ON ?auto_83437 ?auto_83434 ) ( CLEAR ?auto_83437 ) ( not ( = ?auto_83430 ?auto_83434 ) ) ( not ( = ?auto_83431 ?auto_83434 ) ) ( not ( = ?auto_83432 ?auto_83434 ) ) ( not ( = ?auto_83436 ?auto_83434 ) ) ( not ( = ?auto_83433 ?auto_83434 ) ) ( not ( = ?auto_83437 ?auto_83434 ) ) ( not ( = ?auto_83435 ?auto_83434 ) ) ( HOLDING ?auto_83435 ) ( CLEAR ?auto_83433 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83430 ?auto_83431 ?auto_83432 ?auto_83436 ?auto_83433 ?auto_83435 )
      ( MAKE-2PILE ?auto_83430 ?auto_83431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83438 - BLOCK
      ?auto_83439 - BLOCK
    )
    :vars
    (
      ?auto_83442 - BLOCK
      ?auto_83440 - BLOCK
      ?auto_83444 - BLOCK
      ?auto_83441 - BLOCK
      ?auto_83443 - BLOCK
      ?auto_83445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83442 ?auto_83439 ) ( ON-TABLE ?auto_83438 ) ( ON ?auto_83439 ?auto_83438 ) ( not ( = ?auto_83438 ?auto_83439 ) ) ( not ( = ?auto_83438 ?auto_83442 ) ) ( not ( = ?auto_83439 ?auto_83442 ) ) ( not ( = ?auto_83438 ?auto_83440 ) ) ( not ( = ?auto_83438 ?auto_83444 ) ) ( not ( = ?auto_83439 ?auto_83440 ) ) ( not ( = ?auto_83439 ?auto_83444 ) ) ( not ( = ?auto_83442 ?auto_83440 ) ) ( not ( = ?auto_83442 ?auto_83444 ) ) ( not ( = ?auto_83440 ?auto_83444 ) ) ( ON ?auto_83440 ?auto_83442 ) ( not ( = ?auto_83441 ?auto_83443 ) ) ( not ( = ?auto_83441 ?auto_83444 ) ) ( not ( = ?auto_83443 ?auto_83444 ) ) ( not ( = ?auto_83438 ?auto_83443 ) ) ( not ( = ?auto_83438 ?auto_83441 ) ) ( not ( = ?auto_83439 ?auto_83443 ) ) ( not ( = ?auto_83439 ?auto_83441 ) ) ( not ( = ?auto_83442 ?auto_83443 ) ) ( not ( = ?auto_83442 ?auto_83441 ) ) ( not ( = ?auto_83440 ?auto_83443 ) ) ( not ( = ?auto_83440 ?auto_83441 ) ) ( ON ?auto_83444 ?auto_83440 ) ( ON ?auto_83441 ?auto_83445 ) ( not ( = ?auto_83438 ?auto_83445 ) ) ( not ( = ?auto_83439 ?auto_83445 ) ) ( not ( = ?auto_83442 ?auto_83445 ) ) ( not ( = ?auto_83440 ?auto_83445 ) ) ( not ( = ?auto_83444 ?auto_83445 ) ) ( not ( = ?auto_83441 ?auto_83445 ) ) ( not ( = ?auto_83443 ?auto_83445 ) ) ( CLEAR ?auto_83444 ) ( ON ?auto_83443 ?auto_83441 ) ( CLEAR ?auto_83443 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83445 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83445 ?auto_83441 )
      ( MAKE-2PILE ?auto_83438 ?auto_83439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83446 - BLOCK
      ?auto_83447 - BLOCK
    )
    :vars
    (
      ?auto_83448 - BLOCK
      ?auto_83451 - BLOCK
      ?auto_83450 - BLOCK
      ?auto_83452 - BLOCK
      ?auto_83449 - BLOCK
      ?auto_83453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83448 ?auto_83447 ) ( ON-TABLE ?auto_83446 ) ( ON ?auto_83447 ?auto_83446 ) ( not ( = ?auto_83446 ?auto_83447 ) ) ( not ( = ?auto_83446 ?auto_83448 ) ) ( not ( = ?auto_83447 ?auto_83448 ) ) ( not ( = ?auto_83446 ?auto_83451 ) ) ( not ( = ?auto_83446 ?auto_83450 ) ) ( not ( = ?auto_83447 ?auto_83451 ) ) ( not ( = ?auto_83447 ?auto_83450 ) ) ( not ( = ?auto_83448 ?auto_83451 ) ) ( not ( = ?auto_83448 ?auto_83450 ) ) ( not ( = ?auto_83451 ?auto_83450 ) ) ( ON ?auto_83451 ?auto_83448 ) ( not ( = ?auto_83452 ?auto_83449 ) ) ( not ( = ?auto_83452 ?auto_83450 ) ) ( not ( = ?auto_83449 ?auto_83450 ) ) ( not ( = ?auto_83446 ?auto_83449 ) ) ( not ( = ?auto_83446 ?auto_83452 ) ) ( not ( = ?auto_83447 ?auto_83449 ) ) ( not ( = ?auto_83447 ?auto_83452 ) ) ( not ( = ?auto_83448 ?auto_83449 ) ) ( not ( = ?auto_83448 ?auto_83452 ) ) ( not ( = ?auto_83451 ?auto_83449 ) ) ( not ( = ?auto_83451 ?auto_83452 ) ) ( ON ?auto_83452 ?auto_83453 ) ( not ( = ?auto_83446 ?auto_83453 ) ) ( not ( = ?auto_83447 ?auto_83453 ) ) ( not ( = ?auto_83448 ?auto_83453 ) ) ( not ( = ?auto_83451 ?auto_83453 ) ) ( not ( = ?auto_83450 ?auto_83453 ) ) ( not ( = ?auto_83452 ?auto_83453 ) ) ( not ( = ?auto_83449 ?auto_83453 ) ) ( ON ?auto_83449 ?auto_83452 ) ( CLEAR ?auto_83449 ) ( ON-TABLE ?auto_83453 ) ( HOLDING ?auto_83450 ) ( CLEAR ?auto_83451 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83446 ?auto_83447 ?auto_83448 ?auto_83451 ?auto_83450 )
      ( MAKE-2PILE ?auto_83446 ?auto_83447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83454 - BLOCK
      ?auto_83455 - BLOCK
    )
    :vars
    (
      ?auto_83459 - BLOCK
      ?auto_83456 - BLOCK
      ?auto_83461 - BLOCK
      ?auto_83457 - BLOCK
      ?auto_83460 - BLOCK
      ?auto_83458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83459 ?auto_83455 ) ( ON-TABLE ?auto_83454 ) ( ON ?auto_83455 ?auto_83454 ) ( not ( = ?auto_83454 ?auto_83455 ) ) ( not ( = ?auto_83454 ?auto_83459 ) ) ( not ( = ?auto_83455 ?auto_83459 ) ) ( not ( = ?auto_83454 ?auto_83456 ) ) ( not ( = ?auto_83454 ?auto_83461 ) ) ( not ( = ?auto_83455 ?auto_83456 ) ) ( not ( = ?auto_83455 ?auto_83461 ) ) ( not ( = ?auto_83459 ?auto_83456 ) ) ( not ( = ?auto_83459 ?auto_83461 ) ) ( not ( = ?auto_83456 ?auto_83461 ) ) ( ON ?auto_83456 ?auto_83459 ) ( not ( = ?auto_83457 ?auto_83460 ) ) ( not ( = ?auto_83457 ?auto_83461 ) ) ( not ( = ?auto_83460 ?auto_83461 ) ) ( not ( = ?auto_83454 ?auto_83460 ) ) ( not ( = ?auto_83454 ?auto_83457 ) ) ( not ( = ?auto_83455 ?auto_83460 ) ) ( not ( = ?auto_83455 ?auto_83457 ) ) ( not ( = ?auto_83459 ?auto_83460 ) ) ( not ( = ?auto_83459 ?auto_83457 ) ) ( not ( = ?auto_83456 ?auto_83460 ) ) ( not ( = ?auto_83456 ?auto_83457 ) ) ( ON ?auto_83457 ?auto_83458 ) ( not ( = ?auto_83454 ?auto_83458 ) ) ( not ( = ?auto_83455 ?auto_83458 ) ) ( not ( = ?auto_83459 ?auto_83458 ) ) ( not ( = ?auto_83456 ?auto_83458 ) ) ( not ( = ?auto_83461 ?auto_83458 ) ) ( not ( = ?auto_83457 ?auto_83458 ) ) ( not ( = ?auto_83460 ?auto_83458 ) ) ( ON ?auto_83460 ?auto_83457 ) ( ON-TABLE ?auto_83458 ) ( CLEAR ?auto_83456 ) ( ON ?auto_83461 ?auto_83460 ) ( CLEAR ?auto_83461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83458 ?auto_83457 ?auto_83460 )
      ( MAKE-2PILE ?auto_83454 ?auto_83455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83462 - BLOCK
      ?auto_83463 - BLOCK
    )
    :vars
    (
      ?auto_83466 - BLOCK
      ?auto_83464 - BLOCK
      ?auto_83468 - BLOCK
      ?auto_83465 - BLOCK
      ?auto_83467 - BLOCK
      ?auto_83469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83466 ?auto_83463 ) ( ON-TABLE ?auto_83462 ) ( ON ?auto_83463 ?auto_83462 ) ( not ( = ?auto_83462 ?auto_83463 ) ) ( not ( = ?auto_83462 ?auto_83466 ) ) ( not ( = ?auto_83463 ?auto_83466 ) ) ( not ( = ?auto_83462 ?auto_83464 ) ) ( not ( = ?auto_83462 ?auto_83468 ) ) ( not ( = ?auto_83463 ?auto_83464 ) ) ( not ( = ?auto_83463 ?auto_83468 ) ) ( not ( = ?auto_83466 ?auto_83464 ) ) ( not ( = ?auto_83466 ?auto_83468 ) ) ( not ( = ?auto_83464 ?auto_83468 ) ) ( not ( = ?auto_83465 ?auto_83467 ) ) ( not ( = ?auto_83465 ?auto_83468 ) ) ( not ( = ?auto_83467 ?auto_83468 ) ) ( not ( = ?auto_83462 ?auto_83467 ) ) ( not ( = ?auto_83462 ?auto_83465 ) ) ( not ( = ?auto_83463 ?auto_83467 ) ) ( not ( = ?auto_83463 ?auto_83465 ) ) ( not ( = ?auto_83466 ?auto_83467 ) ) ( not ( = ?auto_83466 ?auto_83465 ) ) ( not ( = ?auto_83464 ?auto_83467 ) ) ( not ( = ?auto_83464 ?auto_83465 ) ) ( ON ?auto_83465 ?auto_83469 ) ( not ( = ?auto_83462 ?auto_83469 ) ) ( not ( = ?auto_83463 ?auto_83469 ) ) ( not ( = ?auto_83466 ?auto_83469 ) ) ( not ( = ?auto_83464 ?auto_83469 ) ) ( not ( = ?auto_83468 ?auto_83469 ) ) ( not ( = ?auto_83465 ?auto_83469 ) ) ( not ( = ?auto_83467 ?auto_83469 ) ) ( ON ?auto_83467 ?auto_83465 ) ( ON-TABLE ?auto_83469 ) ( ON ?auto_83468 ?auto_83467 ) ( CLEAR ?auto_83468 ) ( HOLDING ?auto_83464 ) ( CLEAR ?auto_83466 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83462 ?auto_83463 ?auto_83466 ?auto_83464 )
      ( MAKE-2PILE ?auto_83462 ?auto_83463 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83470 - BLOCK
      ?auto_83471 - BLOCK
    )
    :vars
    (
      ?auto_83472 - BLOCK
      ?auto_83477 - BLOCK
      ?auto_83476 - BLOCK
      ?auto_83473 - BLOCK
      ?auto_83475 - BLOCK
      ?auto_83474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83472 ?auto_83471 ) ( ON-TABLE ?auto_83470 ) ( ON ?auto_83471 ?auto_83470 ) ( not ( = ?auto_83470 ?auto_83471 ) ) ( not ( = ?auto_83470 ?auto_83472 ) ) ( not ( = ?auto_83471 ?auto_83472 ) ) ( not ( = ?auto_83470 ?auto_83477 ) ) ( not ( = ?auto_83470 ?auto_83476 ) ) ( not ( = ?auto_83471 ?auto_83477 ) ) ( not ( = ?auto_83471 ?auto_83476 ) ) ( not ( = ?auto_83472 ?auto_83477 ) ) ( not ( = ?auto_83472 ?auto_83476 ) ) ( not ( = ?auto_83477 ?auto_83476 ) ) ( not ( = ?auto_83473 ?auto_83475 ) ) ( not ( = ?auto_83473 ?auto_83476 ) ) ( not ( = ?auto_83475 ?auto_83476 ) ) ( not ( = ?auto_83470 ?auto_83475 ) ) ( not ( = ?auto_83470 ?auto_83473 ) ) ( not ( = ?auto_83471 ?auto_83475 ) ) ( not ( = ?auto_83471 ?auto_83473 ) ) ( not ( = ?auto_83472 ?auto_83475 ) ) ( not ( = ?auto_83472 ?auto_83473 ) ) ( not ( = ?auto_83477 ?auto_83475 ) ) ( not ( = ?auto_83477 ?auto_83473 ) ) ( ON ?auto_83473 ?auto_83474 ) ( not ( = ?auto_83470 ?auto_83474 ) ) ( not ( = ?auto_83471 ?auto_83474 ) ) ( not ( = ?auto_83472 ?auto_83474 ) ) ( not ( = ?auto_83477 ?auto_83474 ) ) ( not ( = ?auto_83476 ?auto_83474 ) ) ( not ( = ?auto_83473 ?auto_83474 ) ) ( not ( = ?auto_83475 ?auto_83474 ) ) ( ON ?auto_83475 ?auto_83473 ) ( ON-TABLE ?auto_83474 ) ( ON ?auto_83476 ?auto_83475 ) ( CLEAR ?auto_83472 ) ( ON ?auto_83477 ?auto_83476 ) ( CLEAR ?auto_83477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83474 ?auto_83473 ?auto_83475 ?auto_83476 )
      ( MAKE-2PILE ?auto_83470 ?auto_83471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83494 - BLOCK
      ?auto_83495 - BLOCK
    )
    :vars
    (
      ?auto_83499 - BLOCK
      ?auto_83496 - BLOCK
      ?auto_83501 - BLOCK
      ?auto_83497 - BLOCK
      ?auto_83498 - BLOCK
      ?auto_83500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83494 ) ( not ( = ?auto_83494 ?auto_83495 ) ) ( not ( = ?auto_83494 ?auto_83499 ) ) ( not ( = ?auto_83495 ?auto_83499 ) ) ( not ( = ?auto_83494 ?auto_83496 ) ) ( not ( = ?auto_83494 ?auto_83501 ) ) ( not ( = ?auto_83495 ?auto_83496 ) ) ( not ( = ?auto_83495 ?auto_83501 ) ) ( not ( = ?auto_83499 ?auto_83496 ) ) ( not ( = ?auto_83499 ?auto_83501 ) ) ( not ( = ?auto_83496 ?auto_83501 ) ) ( not ( = ?auto_83497 ?auto_83498 ) ) ( not ( = ?auto_83497 ?auto_83501 ) ) ( not ( = ?auto_83498 ?auto_83501 ) ) ( not ( = ?auto_83494 ?auto_83498 ) ) ( not ( = ?auto_83494 ?auto_83497 ) ) ( not ( = ?auto_83495 ?auto_83498 ) ) ( not ( = ?auto_83495 ?auto_83497 ) ) ( not ( = ?auto_83499 ?auto_83498 ) ) ( not ( = ?auto_83499 ?auto_83497 ) ) ( not ( = ?auto_83496 ?auto_83498 ) ) ( not ( = ?auto_83496 ?auto_83497 ) ) ( ON ?auto_83497 ?auto_83500 ) ( not ( = ?auto_83494 ?auto_83500 ) ) ( not ( = ?auto_83495 ?auto_83500 ) ) ( not ( = ?auto_83499 ?auto_83500 ) ) ( not ( = ?auto_83496 ?auto_83500 ) ) ( not ( = ?auto_83501 ?auto_83500 ) ) ( not ( = ?auto_83497 ?auto_83500 ) ) ( not ( = ?auto_83498 ?auto_83500 ) ) ( ON ?auto_83498 ?auto_83497 ) ( ON-TABLE ?auto_83500 ) ( ON ?auto_83501 ?auto_83498 ) ( ON ?auto_83496 ?auto_83501 ) ( ON ?auto_83499 ?auto_83496 ) ( CLEAR ?auto_83499 ) ( HOLDING ?auto_83495 ) ( CLEAR ?auto_83494 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83494 ?auto_83495 ?auto_83499 )
      ( MAKE-2PILE ?auto_83494 ?auto_83495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83502 - BLOCK
      ?auto_83503 - BLOCK
    )
    :vars
    (
      ?auto_83505 - BLOCK
      ?auto_83506 - BLOCK
      ?auto_83508 - BLOCK
      ?auto_83509 - BLOCK
      ?auto_83504 - BLOCK
      ?auto_83507 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83502 ) ( not ( = ?auto_83502 ?auto_83503 ) ) ( not ( = ?auto_83502 ?auto_83505 ) ) ( not ( = ?auto_83503 ?auto_83505 ) ) ( not ( = ?auto_83502 ?auto_83506 ) ) ( not ( = ?auto_83502 ?auto_83508 ) ) ( not ( = ?auto_83503 ?auto_83506 ) ) ( not ( = ?auto_83503 ?auto_83508 ) ) ( not ( = ?auto_83505 ?auto_83506 ) ) ( not ( = ?auto_83505 ?auto_83508 ) ) ( not ( = ?auto_83506 ?auto_83508 ) ) ( not ( = ?auto_83509 ?auto_83504 ) ) ( not ( = ?auto_83509 ?auto_83508 ) ) ( not ( = ?auto_83504 ?auto_83508 ) ) ( not ( = ?auto_83502 ?auto_83504 ) ) ( not ( = ?auto_83502 ?auto_83509 ) ) ( not ( = ?auto_83503 ?auto_83504 ) ) ( not ( = ?auto_83503 ?auto_83509 ) ) ( not ( = ?auto_83505 ?auto_83504 ) ) ( not ( = ?auto_83505 ?auto_83509 ) ) ( not ( = ?auto_83506 ?auto_83504 ) ) ( not ( = ?auto_83506 ?auto_83509 ) ) ( ON ?auto_83509 ?auto_83507 ) ( not ( = ?auto_83502 ?auto_83507 ) ) ( not ( = ?auto_83503 ?auto_83507 ) ) ( not ( = ?auto_83505 ?auto_83507 ) ) ( not ( = ?auto_83506 ?auto_83507 ) ) ( not ( = ?auto_83508 ?auto_83507 ) ) ( not ( = ?auto_83509 ?auto_83507 ) ) ( not ( = ?auto_83504 ?auto_83507 ) ) ( ON ?auto_83504 ?auto_83509 ) ( ON-TABLE ?auto_83507 ) ( ON ?auto_83508 ?auto_83504 ) ( ON ?auto_83506 ?auto_83508 ) ( ON ?auto_83505 ?auto_83506 ) ( CLEAR ?auto_83502 ) ( ON ?auto_83503 ?auto_83505 ) ( CLEAR ?auto_83503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83507 ?auto_83509 ?auto_83504 ?auto_83508 ?auto_83506 ?auto_83505 )
      ( MAKE-2PILE ?auto_83502 ?auto_83503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83510 - BLOCK
      ?auto_83511 - BLOCK
    )
    :vars
    (
      ?auto_83514 - BLOCK
      ?auto_83517 - BLOCK
      ?auto_83516 - BLOCK
      ?auto_83512 - BLOCK
      ?auto_83513 - BLOCK
      ?auto_83515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83510 ?auto_83511 ) ) ( not ( = ?auto_83510 ?auto_83514 ) ) ( not ( = ?auto_83511 ?auto_83514 ) ) ( not ( = ?auto_83510 ?auto_83517 ) ) ( not ( = ?auto_83510 ?auto_83516 ) ) ( not ( = ?auto_83511 ?auto_83517 ) ) ( not ( = ?auto_83511 ?auto_83516 ) ) ( not ( = ?auto_83514 ?auto_83517 ) ) ( not ( = ?auto_83514 ?auto_83516 ) ) ( not ( = ?auto_83517 ?auto_83516 ) ) ( not ( = ?auto_83512 ?auto_83513 ) ) ( not ( = ?auto_83512 ?auto_83516 ) ) ( not ( = ?auto_83513 ?auto_83516 ) ) ( not ( = ?auto_83510 ?auto_83513 ) ) ( not ( = ?auto_83510 ?auto_83512 ) ) ( not ( = ?auto_83511 ?auto_83513 ) ) ( not ( = ?auto_83511 ?auto_83512 ) ) ( not ( = ?auto_83514 ?auto_83513 ) ) ( not ( = ?auto_83514 ?auto_83512 ) ) ( not ( = ?auto_83517 ?auto_83513 ) ) ( not ( = ?auto_83517 ?auto_83512 ) ) ( ON ?auto_83512 ?auto_83515 ) ( not ( = ?auto_83510 ?auto_83515 ) ) ( not ( = ?auto_83511 ?auto_83515 ) ) ( not ( = ?auto_83514 ?auto_83515 ) ) ( not ( = ?auto_83517 ?auto_83515 ) ) ( not ( = ?auto_83516 ?auto_83515 ) ) ( not ( = ?auto_83512 ?auto_83515 ) ) ( not ( = ?auto_83513 ?auto_83515 ) ) ( ON ?auto_83513 ?auto_83512 ) ( ON-TABLE ?auto_83515 ) ( ON ?auto_83516 ?auto_83513 ) ( ON ?auto_83517 ?auto_83516 ) ( ON ?auto_83514 ?auto_83517 ) ( ON ?auto_83511 ?auto_83514 ) ( CLEAR ?auto_83511 ) ( HOLDING ?auto_83510 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83510 )
      ( MAKE-2PILE ?auto_83510 ?auto_83511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_83518 - BLOCK
      ?auto_83519 - BLOCK
    )
    :vars
    (
      ?auto_83521 - BLOCK
      ?auto_83523 - BLOCK
      ?auto_83524 - BLOCK
      ?auto_83522 - BLOCK
      ?auto_83525 - BLOCK
      ?auto_83520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83518 ?auto_83519 ) ) ( not ( = ?auto_83518 ?auto_83521 ) ) ( not ( = ?auto_83519 ?auto_83521 ) ) ( not ( = ?auto_83518 ?auto_83523 ) ) ( not ( = ?auto_83518 ?auto_83524 ) ) ( not ( = ?auto_83519 ?auto_83523 ) ) ( not ( = ?auto_83519 ?auto_83524 ) ) ( not ( = ?auto_83521 ?auto_83523 ) ) ( not ( = ?auto_83521 ?auto_83524 ) ) ( not ( = ?auto_83523 ?auto_83524 ) ) ( not ( = ?auto_83522 ?auto_83525 ) ) ( not ( = ?auto_83522 ?auto_83524 ) ) ( not ( = ?auto_83525 ?auto_83524 ) ) ( not ( = ?auto_83518 ?auto_83525 ) ) ( not ( = ?auto_83518 ?auto_83522 ) ) ( not ( = ?auto_83519 ?auto_83525 ) ) ( not ( = ?auto_83519 ?auto_83522 ) ) ( not ( = ?auto_83521 ?auto_83525 ) ) ( not ( = ?auto_83521 ?auto_83522 ) ) ( not ( = ?auto_83523 ?auto_83525 ) ) ( not ( = ?auto_83523 ?auto_83522 ) ) ( ON ?auto_83522 ?auto_83520 ) ( not ( = ?auto_83518 ?auto_83520 ) ) ( not ( = ?auto_83519 ?auto_83520 ) ) ( not ( = ?auto_83521 ?auto_83520 ) ) ( not ( = ?auto_83523 ?auto_83520 ) ) ( not ( = ?auto_83524 ?auto_83520 ) ) ( not ( = ?auto_83522 ?auto_83520 ) ) ( not ( = ?auto_83525 ?auto_83520 ) ) ( ON ?auto_83525 ?auto_83522 ) ( ON-TABLE ?auto_83520 ) ( ON ?auto_83524 ?auto_83525 ) ( ON ?auto_83523 ?auto_83524 ) ( ON ?auto_83521 ?auto_83523 ) ( ON ?auto_83519 ?auto_83521 ) ( ON ?auto_83518 ?auto_83519 ) ( CLEAR ?auto_83518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83520 ?auto_83522 ?auto_83525 ?auto_83524 ?auto_83523 ?auto_83521 ?auto_83519 )
      ( MAKE-2PILE ?auto_83518 ?auto_83519 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83531 - BLOCK
      ?auto_83532 - BLOCK
      ?auto_83533 - BLOCK
      ?auto_83534 - BLOCK
      ?auto_83535 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_83535 ) ( CLEAR ?auto_83534 ) ( ON-TABLE ?auto_83531 ) ( ON ?auto_83532 ?auto_83531 ) ( ON ?auto_83533 ?auto_83532 ) ( ON ?auto_83534 ?auto_83533 ) ( not ( = ?auto_83531 ?auto_83532 ) ) ( not ( = ?auto_83531 ?auto_83533 ) ) ( not ( = ?auto_83531 ?auto_83534 ) ) ( not ( = ?auto_83531 ?auto_83535 ) ) ( not ( = ?auto_83532 ?auto_83533 ) ) ( not ( = ?auto_83532 ?auto_83534 ) ) ( not ( = ?auto_83532 ?auto_83535 ) ) ( not ( = ?auto_83533 ?auto_83534 ) ) ( not ( = ?auto_83533 ?auto_83535 ) ) ( not ( = ?auto_83534 ?auto_83535 ) ) )
    :subtasks
    ( ( !STACK ?auto_83535 ?auto_83534 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83536 - BLOCK
      ?auto_83537 - BLOCK
      ?auto_83538 - BLOCK
      ?auto_83539 - BLOCK
      ?auto_83540 - BLOCK
    )
    :vars
    (
      ?auto_83541 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83539 ) ( ON-TABLE ?auto_83536 ) ( ON ?auto_83537 ?auto_83536 ) ( ON ?auto_83538 ?auto_83537 ) ( ON ?auto_83539 ?auto_83538 ) ( not ( = ?auto_83536 ?auto_83537 ) ) ( not ( = ?auto_83536 ?auto_83538 ) ) ( not ( = ?auto_83536 ?auto_83539 ) ) ( not ( = ?auto_83536 ?auto_83540 ) ) ( not ( = ?auto_83537 ?auto_83538 ) ) ( not ( = ?auto_83537 ?auto_83539 ) ) ( not ( = ?auto_83537 ?auto_83540 ) ) ( not ( = ?auto_83538 ?auto_83539 ) ) ( not ( = ?auto_83538 ?auto_83540 ) ) ( not ( = ?auto_83539 ?auto_83540 ) ) ( ON ?auto_83540 ?auto_83541 ) ( CLEAR ?auto_83540 ) ( HAND-EMPTY ) ( not ( = ?auto_83536 ?auto_83541 ) ) ( not ( = ?auto_83537 ?auto_83541 ) ) ( not ( = ?auto_83538 ?auto_83541 ) ) ( not ( = ?auto_83539 ?auto_83541 ) ) ( not ( = ?auto_83540 ?auto_83541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83540 ?auto_83541 )
      ( MAKE-5PILE ?auto_83536 ?auto_83537 ?auto_83538 ?auto_83539 ?auto_83540 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83542 - BLOCK
      ?auto_83543 - BLOCK
      ?auto_83544 - BLOCK
      ?auto_83545 - BLOCK
      ?auto_83546 - BLOCK
    )
    :vars
    (
      ?auto_83547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83542 ) ( ON ?auto_83543 ?auto_83542 ) ( ON ?auto_83544 ?auto_83543 ) ( not ( = ?auto_83542 ?auto_83543 ) ) ( not ( = ?auto_83542 ?auto_83544 ) ) ( not ( = ?auto_83542 ?auto_83545 ) ) ( not ( = ?auto_83542 ?auto_83546 ) ) ( not ( = ?auto_83543 ?auto_83544 ) ) ( not ( = ?auto_83543 ?auto_83545 ) ) ( not ( = ?auto_83543 ?auto_83546 ) ) ( not ( = ?auto_83544 ?auto_83545 ) ) ( not ( = ?auto_83544 ?auto_83546 ) ) ( not ( = ?auto_83545 ?auto_83546 ) ) ( ON ?auto_83546 ?auto_83547 ) ( CLEAR ?auto_83546 ) ( not ( = ?auto_83542 ?auto_83547 ) ) ( not ( = ?auto_83543 ?auto_83547 ) ) ( not ( = ?auto_83544 ?auto_83547 ) ) ( not ( = ?auto_83545 ?auto_83547 ) ) ( not ( = ?auto_83546 ?auto_83547 ) ) ( HOLDING ?auto_83545 ) ( CLEAR ?auto_83544 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83542 ?auto_83543 ?auto_83544 ?auto_83545 )
      ( MAKE-5PILE ?auto_83542 ?auto_83543 ?auto_83544 ?auto_83545 ?auto_83546 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83548 - BLOCK
      ?auto_83549 - BLOCK
      ?auto_83550 - BLOCK
      ?auto_83551 - BLOCK
      ?auto_83552 - BLOCK
    )
    :vars
    (
      ?auto_83553 - BLOCK
      ?auto_83554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83548 ) ( ON ?auto_83549 ?auto_83548 ) ( ON ?auto_83550 ?auto_83549 ) ( not ( = ?auto_83548 ?auto_83549 ) ) ( not ( = ?auto_83548 ?auto_83550 ) ) ( not ( = ?auto_83548 ?auto_83551 ) ) ( not ( = ?auto_83548 ?auto_83552 ) ) ( not ( = ?auto_83549 ?auto_83550 ) ) ( not ( = ?auto_83549 ?auto_83551 ) ) ( not ( = ?auto_83549 ?auto_83552 ) ) ( not ( = ?auto_83550 ?auto_83551 ) ) ( not ( = ?auto_83550 ?auto_83552 ) ) ( not ( = ?auto_83551 ?auto_83552 ) ) ( ON ?auto_83552 ?auto_83553 ) ( not ( = ?auto_83548 ?auto_83553 ) ) ( not ( = ?auto_83549 ?auto_83553 ) ) ( not ( = ?auto_83550 ?auto_83553 ) ) ( not ( = ?auto_83551 ?auto_83553 ) ) ( not ( = ?auto_83552 ?auto_83553 ) ) ( CLEAR ?auto_83550 ) ( ON ?auto_83551 ?auto_83552 ) ( CLEAR ?auto_83551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83554 ) ( ON ?auto_83553 ?auto_83554 ) ( not ( = ?auto_83554 ?auto_83553 ) ) ( not ( = ?auto_83554 ?auto_83552 ) ) ( not ( = ?auto_83554 ?auto_83551 ) ) ( not ( = ?auto_83548 ?auto_83554 ) ) ( not ( = ?auto_83549 ?auto_83554 ) ) ( not ( = ?auto_83550 ?auto_83554 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83554 ?auto_83553 ?auto_83552 )
      ( MAKE-5PILE ?auto_83548 ?auto_83549 ?auto_83550 ?auto_83551 ?auto_83552 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83555 - BLOCK
      ?auto_83556 - BLOCK
      ?auto_83557 - BLOCK
      ?auto_83558 - BLOCK
      ?auto_83559 - BLOCK
    )
    :vars
    (
      ?auto_83561 - BLOCK
      ?auto_83560 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83555 ) ( ON ?auto_83556 ?auto_83555 ) ( not ( = ?auto_83555 ?auto_83556 ) ) ( not ( = ?auto_83555 ?auto_83557 ) ) ( not ( = ?auto_83555 ?auto_83558 ) ) ( not ( = ?auto_83555 ?auto_83559 ) ) ( not ( = ?auto_83556 ?auto_83557 ) ) ( not ( = ?auto_83556 ?auto_83558 ) ) ( not ( = ?auto_83556 ?auto_83559 ) ) ( not ( = ?auto_83557 ?auto_83558 ) ) ( not ( = ?auto_83557 ?auto_83559 ) ) ( not ( = ?auto_83558 ?auto_83559 ) ) ( ON ?auto_83559 ?auto_83561 ) ( not ( = ?auto_83555 ?auto_83561 ) ) ( not ( = ?auto_83556 ?auto_83561 ) ) ( not ( = ?auto_83557 ?auto_83561 ) ) ( not ( = ?auto_83558 ?auto_83561 ) ) ( not ( = ?auto_83559 ?auto_83561 ) ) ( ON ?auto_83558 ?auto_83559 ) ( CLEAR ?auto_83558 ) ( ON-TABLE ?auto_83560 ) ( ON ?auto_83561 ?auto_83560 ) ( not ( = ?auto_83560 ?auto_83561 ) ) ( not ( = ?auto_83560 ?auto_83559 ) ) ( not ( = ?auto_83560 ?auto_83558 ) ) ( not ( = ?auto_83555 ?auto_83560 ) ) ( not ( = ?auto_83556 ?auto_83560 ) ) ( not ( = ?auto_83557 ?auto_83560 ) ) ( HOLDING ?auto_83557 ) ( CLEAR ?auto_83556 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83555 ?auto_83556 ?auto_83557 )
      ( MAKE-5PILE ?auto_83555 ?auto_83556 ?auto_83557 ?auto_83558 ?auto_83559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83562 - BLOCK
      ?auto_83563 - BLOCK
      ?auto_83564 - BLOCK
      ?auto_83565 - BLOCK
      ?auto_83566 - BLOCK
    )
    :vars
    (
      ?auto_83567 - BLOCK
      ?auto_83568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83562 ) ( ON ?auto_83563 ?auto_83562 ) ( not ( = ?auto_83562 ?auto_83563 ) ) ( not ( = ?auto_83562 ?auto_83564 ) ) ( not ( = ?auto_83562 ?auto_83565 ) ) ( not ( = ?auto_83562 ?auto_83566 ) ) ( not ( = ?auto_83563 ?auto_83564 ) ) ( not ( = ?auto_83563 ?auto_83565 ) ) ( not ( = ?auto_83563 ?auto_83566 ) ) ( not ( = ?auto_83564 ?auto_83565 ) ) ( not ( = ?auto_83564 ?auto_83566 ) ) ( not ( = ?auto_83565 ?auto_83566 ) ) ( ON ?auto_83566 ?auto_83567 ) ( not ( = ?auto_83562 ?auto_83567 ) ) ( not ( = ?auto_83563 ?auto_83567 ) ) ( not ( = ?auto_83564 ?auto_83567 ) ) ( not ( = ?auto_83565 ?auto_83567 ) ) ( not ( = ?auto_83566 ?auto_83567 ) ) ( ON ?auto_83565 ?auto_83566 ) ( ON-TABLE ?auto_83568 ) ( ON ?auto_83567 ?auto_83568 ) ( not ( = ?auto_83568 ?auto_83567 ) ) ( not ( = ?auto_83568 ?auto_83566 ) ) ( not ( = ?auto_83568 ?auto_83565 ) ) ( not ( = ?auto_83562 ?auto_83568 ) ) ( not ( = ?auto_83563 ?auto_83568 ) ) ( not ( = ?auto_83564 ?auto_83568 ) ) ( CLEAR ?auto_83563 ) ( ON ?auto_83564 ?auto_83565 ) ( CLEAR ?auto_83564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83568 ?auto_83567 ?auto_83566 ?auto_83565 )
      ( MAKE-5PILE ?auto_83562 ?auto_83563 ?auto_83564 ?auto_83565 ?auto_83566 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83569 - BLOCK
      ?auto_83570 - BLOCK
      ?auto_83571 - BLOCK
      ?auto_83572 - BLOCK
      ?auto_83573 - BLOCK
    )
    :vars
    (
      ?auto_83575 - BLOCK
      ?auto_83574 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83569 ) ( not ( = ?auto_83569 ?auto_83570 ) ) ( not ( = ?auto_83569 ?auto_83571 ) ) ( not ( = ?auto_83569 ?auto_83572 ) ) ( not ( = ?auto_83569 ?auto_83573 ) ) ( not ( = ?auto_83570 ?auto_83571 ) ) ( not ( = ?auto_83570 ?auto_83572 ) ) ( not ( = ?auto_83570 ?auto_83573 ) ) ( not ( = ?auto_83571 ?auto_83572 ) ) ( not ( = ?auto_83571 ?auto_83573 ) ) ( not ( = ?auto_83572 ?auto_83573 ) ) ( ON ?auto_83573 ?auto_83575 ) ( not ( = ?auto_83569 ?auto_83575 ) ) ( not ( = ?auto_83570 ?auto_83575 ) ) ( not ( = ?auto_83571 ?auto_83575 ) ) ( not ( = ?auto_83572 ?auto_83575 ) ) ( not ( = ?auto_83573 ?auto_83575 ) ) ( ON ?auto_83572 ?auto_83573 ) ( ON-TABLE ?auto_83574 ) ( ON ?auto_83575 ?auto_83574 ) ( not ( = ?auto_83574 ?auto_83575 ) ) ( not ( = ?auto_83574 ?auto_83573 ) ) ( not ( = ?auto_83574 ?auto_83572 ) ) ( not ( = ?auto_83569 ?auto_83574 ) ) ( not ( = ?auto_83570 ?auto_83574 ) ) ( not ( = ?auto_83571 ?auto_83574 ) ) ( ON ?auto_83571 ?auto_83572 ) ( CLEAR ?auto_83571 ) ( HOLDING ?auto_83570 ) ( CLEAR ?auto_83569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83569 ?auto_83570 )
      ( MAKE-5PILE ?auto_83569 ?auto_83570 ?auto_83571 ?auto_83572 ?auto_83573 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83576 - BLOCK
      ?auto_83577 - BLOCK
      ?auto_83578 - BLOCK
      ?auto_83579 - BLOCK
      ?auto_83580 - BLOCK
    )
    :vars
    (
      ?auto_83582 - BLOCK
      ?auto_83581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83576 ) ( not ( = ?auto_83576 ?auto_83577 ) ) ( not ( = ?auto_83576 ?auto_83578 ) ) ( not ( = ?auto_83576 ?auto_83579 ) ) ( not ( = ?auto_83576 ?auto_83580 ) ) ( not ( = ?auto_83577 ?auto_83578 ) ) ( not ( = ?auto_83577 ?auto_83579 ) ) ( not ( = ?auto_83577 ?auto_83580 ) ) ( not ( = ?auto_83578 ?auto_83579 ) ) ( not ( = ?auto_83578 ?auto_83580 ) ) ( not ( = ?auto_83579 ?auto_83580 ) ) ( ON ?auto_83580 ?auto_83582 ) ( not ( = ?auto_83576 ?auto_83582 ) ) ( not ( = ?auto_83577 ?auto_83582 ) ) ( not ( = ?auto_83578 ?auto_83582 ) ) ( not ( = ?auto_83579 ?auto_83582 ) ) ( not ( = ?auto_83580 ?auto_83582 ) ) ( ON ?auto_83579 ?auto_83580 ) ( ON-TABLE ?auto_83581 ) ( ON ?auto_83582 ?auto_83581 ) ( not ( = ?auto_83581 ?auto_83582 ) ) ( not ( = ?auto_83581 ?auto_83580 ) ) ( not ( = ?auto_83581 ?auto_83579 ) ) ( not ( = ?auto_83576 ?auto_83581 ) ) ( not ( = ?auto_83577 ?auto_83581 ) ) ( not ( = ?auto_83578 ?auto_83581 ) ) ( ON ?auto_83578 ?auto_83579 ) ( CLEAR ?auto_83576 ) ( ON ?auto_83577 ?auto_83578 ) ( CLEAR ?auto_83577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83581 ?auto_83582 ?auto_83580 ?auto_83579 ?auto_83578 )
      ( MAKE-5PILE ?auto_83576 ?auto_83577 ?auto_83578 ?auto_83579 ?auto_83580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83583 - BLOCK
      ?auto_83584 - BLOCK
      ?auto_83585 - BLOCK
      ?auto_83586 - BLOCK
      ?auto_83587 - BLOCK
    )
    :vars
    (
      ?auto_83588 - BLOCK
      ?auto_83589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83583 ?auto_83584 ) ) ( not ( = ?auto_83583 ?auto_83585 ) ) ( not ( = ?auto_83583 ?auto_83586 ) ) ( not ( = ?auto_83583 ?auto_83587 ) ) ( not ( = ?auto_83584 ?auto_83585 ) ) ( not ( = ?auto_83584 ?auto_83586 ) ) ( not ( = ?auto_83584 ?auto_83587 ) ) ( not ( = ?auto_83585 ?auto_83586 ) ) ( not ( = ?auto_83585 ?auto_83587 ) ) ( not ( = ?auto_83586 ?auto_83587 ) ) ( ON ?auto_83587 ?auto_83588 ) ( not ( = ?auto_83583 ?auto_83588 ) ) ( not ( = ?auto_83584 ?auto_83588 ) ) ( not ( = ?auto_83585 ?auto_83588 ) ) ( not ( = ?auto_83586 ?auto_83588 ) ) ( not ( = ?auto_83587 ?auto_83588 ) ) ( ON ?auto_83586 ?auto_83587 ) ( ON-TABLE ?auto_83589 ) ( ON ?auto_83588 ?auto_83589 ) ( not ( = ?auto_83589 ?auto_83588 ) ) ( not ( = ?auto_83589 ?auto_83587 ) ) ( not ( = ?auto_83589 ?auto_83586 ) ) ( not ( = ?auto_83583 ?auto_83589 ) ) ( not ( = ?auto_83584 ?auto_83589 ) ) ( not ( = ?auto_83585 ?auto_83589 ) ) ( ON ?auto_83585 ?auto_83586 ) ( ON ?auto_83584 ?auto_83585 ) ( CLEAR ?auto_83584 ) ( HOLDING ?auto_83583 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83583 )
      ( MAKE-5PILE ?auto_83583 ?auto_83584 ?auto_83585 ?auto_83586 ?auto_83587 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83590 - BLOCK
      ?auto_83591 - BLOCK
      ?auto_83592 - BLOCK
      ?auto_83593 - BLOCK
      ?auto_83594 - BLOCK
    )
    :vars
    (
      ?auto_83596 - BLOCK
      ?auto_83595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83590 ?auto_83591 ) ) ( not ( = ?auto_83590 ?auto_83592 ) ) ( not ( = ?auto_83590 ?auto_83593 ) ) ( not ( = ?auto_83590 ?auto_83594 ) ) ( not ( = ?auto_83591 ?auto_83592 ) ) ( not ( = ?auto_83591 ?auto_83593 ) ) ( not ( = ?auto_83591 ?auto_83594 ) ) ( not ( = ?auto_83592 ?auto_83593 ) ) ( not ( = ?auto_83592 ?auto_83594 ) ) ( not ( = ?auto_83593 ?auto_83594 ) ) ( ON ?auto_83594 ?auto_83596 ) ( not ( = ?auto_83590 ?auto_83596 ) ) ( not ( = ?auto_83591 ?auto_83596 ) ) ( not ( = ?auto_83592 ?auto_83596 ) ) ( not ( = ?auto_83593 ?auto_83596 ) ) ( not ( = ?auto_83594 ?auto_83596 ) ) ( ON ?auto_83593 ?auto_83594 ) ( ON-TABLE ?auto_83595 ) ( ON ?auto_83596 ?auto_83595 ) ( not ( = ?auto_83595 ?auto_83596 ) ) ( not ( = ?auto_83595 ?auto_83594 ) ) ( not ( = ?auto_83595 ?auto_83593 ) ) ( not ( = ?auto_83590 ?auto_83595 ) ) ( not ( = ?auto_83591 ?auto_83595 ) ) ( not ( = ?auto_83592 ?auto_83595 ) ) ( ON ?auto_83592 ?auto_83593 ) ( ON ?auto_83591 ?auto_83592 ) ( ON ?auto_83590 ?auto_83591 ) ( CLEAR ?auto_83590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83595 ?auto_83596 ?auto_83594 ?auto_83593 ?auto_83592 ?auto_83591 )
      ( MAKE-5PILE ?auto_83590 ?auto_83591 ?auto_83592 ?auto_83593 ?auto_83594 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83597 - BLOCK
      ?auto_83598 - BLOCK
      ?auto_83599 - BLOCK
      ?auto_83600 - BLOCK
      ?auto_83601 - BLOCK
    )
    :vars
    (
      ?auto_83603 - BLOCK
      ?auto_83602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83597 ?auto_83598 ) ) ( not ( = ?auto_83597 ?auto_83599 ) ) ( not ( = ?auto_83597 ?auto_83600 ) ) ( not ( = ?auto_83597 ?auto_83601 ) ) ( not ( = ?auto_83598 ?auto_83599 ) ) ( not ( = ?auto_83598 ?auto_83600 ) ) ( not ( = ?auto_83598 ?auto_83601 ) ) ( not ( = ?auto_83599 ?auto_83600 ) ) ( not ( = ?auto_83599 ?auto_83601 ) ) ( not ( = ?auto_83600 ?auto_83601 ) ) ( ON ?auto_83601 ?auto_83603 ) ( not ( = ?auto_83597 ?auto_83603 ) ) ( not ( = ?auto_83598 ?auto_83603 ) ) ( not ( = ?auto_83599 ?auto_83603 ) ) ( not ( = ?auto_83600 ?auto_83603 ) ) ( not ( = ?auto_83601 ?auto_83603 ) ) ( ON ?auto_83600 ?auto_83601 ) ( ON-TABLE ?auto_83602 ) ( ON ?auto_83603 ?auto_83602 ) ( not ( = ?auto_83602 ?auto_83603 ) ) ( not ( = ?auto_83602 ?auto_83601 ) ) ( not ( = ?auto_83602 ?auto_83600 ) ) ( not ( = ?auto_83597 ?auto_83602 ) ) ( not ( = ?auto_83598 ?auto_83602 ) ) ( not ( = ?auto_83599 ?auto_83602 ) ) ( ON ?auto_83599 ?auto_83600 ) ( ON ?auto_83598 ?auto_83599 ) ( HOLDING ?auto_83597 ) ( CLEAR ?auto_83598 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83602 ?auto_83603 ?auto_83601 ?auto_83600 ?auto_83599 ?auto_83598 ?auto_83597 )
      ( MAKE-5PILE ?auto_83597 ?auto_83598 ?auto_83599 ?auto_83600 ?auto_83601 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83604 - BLOCK
      ?auto_83605 - BLOCK
      ?auto_83606 - BLOCK
      ?auto_83607 - BLOCK
      ?auto_83608 - BLOCK
    )
    :vars
    (
      ?auto_83610 - BLOCK
      ?auto_83609 - BLOCK
      ?auto_83611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83604 ?auto_83605 ) ) ( not ( = ?auto_83604 ?auto_83606 ) ) ( not ( = ?auto_83604 ?auto_83607 ) ) ( not ( = ?auto_83604 ?auto_83608 ) ) ( not ( = ?auto_83605 ?auto_83606 ) ) ( not ( = ?auto_83605 ?auto_83607 ) ) ( not ( = ?auto_83605 ?auto_83608 ) ) ( not ( = ?auto_83606 ?auto_83607 ) ) ( not ( = ?auto_83606 ?auto_83608 ) ) ( not ( = ?auto_83607 ?auto_83608 ) ) ( ON ?auto_83608 ?auto_83610 ) ( not ( = ?auto_83604 ?auto_83610 ) ) ( not ( = ?auto_83605 ?auto_83610 ) ) ( not ( = ?auto_83606 ?auto_83610 ) ) ( not ( = ?auto_83607 ?auto_83610 ) ) ( not ( = ?auto_83608 ?auto_83610 ) ) ( ON ?auto_83607 ?auto_83608 ) ( ON-TABLE ?auto_83609 ) ( ON ?auto_83610 ?auto_83609 ) ( not ( = ?auto_83609 ?auto_83610 ) ) ( not ( = ?auto_83609 ?auto_83608 ) ) ( not ( = ?auto_83609 ?auto_83607 ) ) ( not ( = ?auto_83604 ?auto_83609 ) ) ( not ( = ?auto_83605 ?auto_83609 ) ) ( not ( = ?auto_83606 ?auto_83609 ) ) ( ON ?auto_83606 ?auto_83607 ) ( ON ?auto_83605 ?auto_83606 ) ( CLEAR ?auto_83605 ) ( ON ?auto_83604 ?auto_83611 ) ( CLEAR ?auto_83604 ) ( HAND-EMPTY ) ( not ( = ?auto_83604 ?auto_83611 ) ) ( not ( = ?auto_83605 ?auto_83611 ) ) ( not ( = ?auto_83606 ?auto_83611 ) ) ( not ( = ?auto_83607 ?auto_83611 ) ) ( not ( = ?auto_83608 ?auto_83611 ) ) ( not ( = ?auto_83610 ?auto_83611 ) ) ( not ( = ?auto_83609 ?auto_83611 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83604 ?auto_83611 )
      ( MAKE-5PILE ?auto_83604 ?auto_83605 ?auto_83606 ?auto_83607 ?auto_83608 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83612 - BLOCK
      ?auto_83613 - BLOCK
      ?auto_83614 - BLOCK
      ?auto_83615 - BLOCK
      ?auto_83616 - BLOCK
    )
    :vars
    (
      ?auto_83618 - BLOCK
      ?auto_83619 - BLOCK
      ?auto_83617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83612 ?auto_83613 ) ) ( not ( = ?auto_83612 ?auto_83614 ) ) ( not ( = ?auto_83612 ?auto_83615 ) ) ( not ( = ?auto_83612 ?auto_83616 ) ) ( not ( = ?auto_83613 ?auto_83614 ) ) ( not ( = ?auto_83613 ?auto_83615 ) ) ( not ( = ?auto_83613 ?auto_83616 ) ) ( not ( = ?auto_83614 ?auto_83615 ) ) ( not ( = ?auto_83614 ?auto_83616 ) ) ( not ( = ?auto_83615 ?auto_83616 ) ) ( ON ?auto_83616 ?auto_83618 ) ( not ( = ?auto_83612 ?auto_83618 ) ) ( not ( = ?auto_83613 ?auto_83618 ) ) ( not ( = ?auto_83614 ?auto_83618 ) ) ( not ( = ?auto_83615 ?auto_83618 ) ) ( not ( = ?auto_83616 ?auto_83618 ) ) ( ON ?auto_83615 ?auto_83616 ) ( ON-TABLE ?auto_83619 ) ( ON ?auto_83618 ?auto_83619 ) ( not ( = ?auto_83619 ?auto_83618 ) ) ( not ( = ?auto_83619 ?auto_83616 ) ) ( not ( = ?auto_83619 ?auto_83615 ) ) ( not ( = ?auto_83612 ?auto_83619 ) ) ( not ( = ?auto_83613 ?auto_83619 ) ) ( not ( = ?auto_83614 ?auto_83619 ) ) ( ON ?auto_83614 ?auto_83615 ) ( ON ?auto_83612 ?auto_83617 ) ( CLEAR ?auto_83612 ) ( not ( = ?auto_83612 ?auto_83617 ) ) ( not ( = ?auto_83613 ?auto_83617 ) ) ( not ( = ?auto_83614 ?auto_83617 ) ) ( not ( = ?auto_83615 ?auto_83617 ) ) ( not ( = ?auto_83616 ?auto_83617 ) ) ( not ( = ?auto_83618 ?auto_83617 ) ) ( not ( = ?auto_83619 ?auto_83617 ) ) ( HOLDING ?auto_83613 ) ( CLEAR ?auto_83614 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83619 ?auto_83618 ?auto_83616 ?auto_83615 ?auto_83614 ?auto_83613 )
      ( MAKE-5PILE ?auto_83612 ?auto_83613 ?auto_83614 ?auto_83615 ?auto_83616 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83620 - BLOCK
      ?auto_83621 - BLOCK
      ?auto_83622 - BLOCK
      ?auto_83623 - BLOCK
      ?auto_83624 - BLOCK
    )
    :vars
    (
      ?auto_83625 - BLOCK
      ?auto_83626 - BLOCK
      ?auto_83627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83620 ?auto_83621 ) ) ( not ( = ?auto_83620 ?auto_83622 ) ) ( not ( = ?auto_83620 ?auto_83623 ) ) ( not ( = ?auto_83620 ?auto_83624 ) ) ( not ( = ?auto_83621 ?auto_83622 ) ) ( not ( = ?auto_83621 ?auto_83623 ) ) ( not ( = ?auto_83621 ?auto_83624 ) ) ( not ( = ?auto_83622 ?auto_83623 ) ) ( not ( = ?auto_83622 ?auto_83624 ) ) ( not ( = ?auto_83623 ?auto_83624 ) ) ( ON ?auto_83624 ?auto_83625 ) ( not ( = ?auto_83620 ?auto_83625 ) ) ( not ( = ?auto_83621 ?auto_83625 ) ) ( not ( = ?auto_83622 ?auto_83625 ) ) ( not ( = ?auto_83623 ?auto_83625 ) ) ( not ( = ?auto_83624 ?auto_83625 ) ) ( ON ?auto_83623 ?auto_83624 ) ( ON-TABLE ?auto_83626 ) ( ON ?auto_83625 ?auto_83626 ) ( not ( = ?auto_83626 ?auto_83625 ) ) ( not ( = ?auto_83626 ?auto_83624 ) ) ( not ( = ?auto_83626 ?auto_83623 ) ) ( not ( = ?auto_83620 ?auto_83626 ) ) ( not ( = ?auto_83621 ?auto_83626 ) ) ( not ( = ?auto_83622 ?auto_83626 ) ) ( ON ?auto_83622 ?auto_83623 ) ( ON ?auto_83620 ?auto_83627 ) ( not ( = ?auto_83620 ?auto_83627 ) ) ( not ( = ?auto_83621 ?auto_83627 ) ) ( not ( = ?auto_83622 ?auto_83627 ) ) ( not ( = ?auto_83623 ?auto_83627 ) ) ( not ( = ?auto_83624 ?auto_83627 ) ) ( not ( = ?auto_83625 ?auto_83627 ) ) ( not ( = ?auto_83626 ?auto_83627 ) ) ( CLEAR ?auto_83622 ) ( ON ?auto_83621 ?auto_83620 ) ( CLEAR ?auto_83621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83627 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83627 ?auto_83620 )
      ( MAKE-5PILE ?auto_83620 ?auto_83621 ?auto_83622 ?auto_83623 ?auto_83624 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83628 - BLOCK
      ?auto_83629 - BLOCK
      ?auto_83630 - BLOCK
      ?auto_83631 - BLOCK
      ?auto_83632 - BLOCK
    )
    :vars
    (
      ?auto_83635 - BLOCK
      ?auto_83634 - BLOCK
      ?auto_83633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83628 ?auto_83629 ) ) ( not ( = ?auto_83628 ?auto_83630 ) ) ( not ( = ?auto_83628 ?auto_83631 ) ) ( not ( = ?auto_83628 ?auto_83632 ) ) ( not ( = ?auto_83629 ?auto_83630 ) ) ( not ( = ?auto_83629 ?auto_83631 ) ) ( not ( = ?auto_83629 ?auto_83632 ) ) ( not ( = ?auto_83630 ?auto_83631 ) ) ( not ( = ?auto_83630 ?auto_83632 ) ) ( not ( = ?auto_83631 ?auto_83632 ) ) ( ON ?auto_83632 ?auto_83635 ) ( not ( = ?auto_83628 ?auto_83635 ) ) ( not ( = ?auto_83629 ?auto_83635 ) ) ( not ( = ?auto_83630 ?auto_83635 ) ) ( not ( = ?auto_83631 ?auto_83635 ) ) ( not ( = ?auto_83632 ?auto_83635 ) ) ( ON ?auto_83631 ?auto_83632 ) ( ON-TABLE ?auto_83634 ) ( ON ?auto_83635 ?auto_83634 ) ( not ( = ?auto_83634 ?auto_83635 ) ) ( not ( = ?auto_83634 ?auto_83632 ) ) ( not ( = ?auto_83634 ?auto_83631 ) ) ( not ( = ?auto_83628 ?auto_83634 ) ) ( not ( = ?auto_83629 ?auto_83634 ) ) ( not ( = ?auto_83630 ?auto_83634 ) ) ( ON ?auto_83628 ?auto_83633 ) ( not ( = ?auto_83628 ?auto_83633 ) ) ( not ( = ?auto_83629 ?auto_83633 ) ) ( not ( = ?auto_83630 ?auto_83633 ) ) ( not ( = ?auto_83631 ?auto_83633 ) ) ( not ( = ?auto_83632 ?auto_83633 ) ) ( not ( = ?auto_83635 ?auto_83633 ) ) ( not ( = ?auto_83634 ?auto_83633 ) ) ( ON ?auto_83629 ?auto_83628 ) ( CLEAR ?auto_83629 ) ( ON-TABLE ?auto_83633 ) ( HOLDING ?auto_83630 ) ( CLEAR ?auto_83631 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83634 ?auto_83635 ?auto_83632 ?auto_83631 ?auto_83630 )
      ( MAKE-5PILE ?auto_83628 ?auto_83629 ?auto_83630 ?auto_83631 ?auto_83632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83636 - BLOCK
      ?auto_83637 - BLOCK
      ?auto_83638 - BLOCK
      ?auto_83639 - BLOCK
      ?auto_83640 - BLOCK
    )
    :vars
    (
      ?auto_83642 - BLOCK
      ?auto_83641 - BLOCK
      ?auto_83643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83636 ?auto_83637 ) ) ( not ( = ?auto_83636 ?auto_83638 ) ) ( not ( = ?auto_83636 ?auto_83639 ) ) ( not ( = ?auto_83636 ?auto_83640 ) ) ( not ( = ?auto_83637 ?auto_83638 ) ) ( not ( = ?auto_83637 ?auto_83639 ) ) ( not ( = ?auto_83637 ?auto_83640 ) ) ( not ( = ?auto_83638 ?auto_83639 ) ) ( not ( = ?auto_83638 ?auto_83640 ) ) ( not ( = ?auto_83639 ?auto_83640 ) ) ( ON ?auto_83640 ?auto_83642 ) ( not ( = ?auto_83636 ?auto_83642 ) ) ( not ( = ?auto_83637 ?auto_83642 ) ) ( not ( = ?auto_83638 ?auto_83642 ) ) ( not ( = ?auto_83639 ?auto_83642 ) ) ( not ( = ?auto_83640 ?auto_83642 ) ) ( ON ?auto_83639 ?auto_83640 ) ( ON-TABLE ?auto_83641 ) ( ON ?auto_83642 ?auto_83641 ) ( not ( = ?auto_83641 ?auto_83642 ) ) ( not ( = ?auto_83641 ?auto_83640 ) ) ( not ( = ?auto_83641 ?auto_83639 ) ) ( not ( = ?auto_83636 ?auto_83641 ) ) ( not ( = ?auto_83637 ?auto_83641 ) ) ( not ( = ?auto_83638 ?auto_83641 ) ) ( ON ?auto_83636 ?auto_83643 ) ( not ( = ?auto_83636 ?auto_83643 ) ) ( not ( = ?auto_83637 ?auto_83643 ) ) ( not ( = ?auto_83638 ?auto_83643 ) ) ( not ( = ?auto_83639 ?auto_83643 ) ) ( not ( = ?auto_83640 ?auto_83643 ) ) ( not ( = ?auto_83642 ?auto_83643 ) ) ( not ( = ?auto_83641 ?auto_83643 ) ) ( ON ?auto_83637 ?auto_83636 ) ( ON-TABLE ?auto_83643 ) ( CLEAR ?auto_83639 ) ( ON ?auto_83638 ?auto_83637 ) ( CLEAR ?auto_83638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83643 ?auto_83636 ?auto_83637 )
      ( MAKE-5PILE ?auto_83636 ?auto_83637 ?auto_83638 ?auto_83639 ?auto_83640 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83644 - BLOCK
      ?auto_83645 - BLOCK
      ?auto_83646 - BLOCK
      ?auto_83647 - BLOCK
      ?auto_83648 - BLOCK
    )
    :vars
    (
      ?auto_83649 - BLOCK
      ?auto_83651 - BLOCK
      ?auto_83650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83644 ?auto_83645 ) ) ( not ( = ?auto_83644 ?auto_83646 ) ) ( not ( = ?auto_83644 ?auto_83647 ) ) ( not ( = ?auto_83644 ?auto_83648 ) ) ( not ( = ?auto_83645 ?auto_83646 ) ) ( not ( = ?auto_83645 ?auto_83647 ) ) ( not ( = ?auto_83645 ?auto_83648 ) ) ( not ( = ?auto_83646 ?auto_83647 ) ) ( not ( = ?auto_83646 ?auto_83648 ) ) ( not ( = ?auto_83647 ?auto_83648 ) ) ( ON ?auto_83648 ?auto_83649 ) ( not ( = ?auto_83644 ?auto_83649 ) ) ( not ( = ?auto_83645 ?auto_83649 ) ) ( not ( = ?auto_83646 ?auto_83649 ) ) ( not ( = ?auto_83647 ?auto_83649 ) ) ( not ( = ?auto_83648 ?auto_83649 ) ) ( ON-TABLE ?auto_83651 ) ( ON ?auto_83649 ?auto_83651 ) ( not ( = ?auto_83651 ?auto_83649 ) ) ( not ( = ?auto_83651 ?auto_83648 ) ) ( not ( = ?auto_83651 ?auto_83647 ) ) ( not ( = ?auto_83644 ?auto_83651 ) ) ( not ( = ?auto_83645 ?auto_83651 ) ) ( not ( = ?auto_83646 ?auto_83651 ) ) ( ON ?auto_83644 ?auto_83650 ) ( not ( = ?auto_83644 ?auto_83650 ) ) ( not ( = ?auto_83645 ?auto_83650 ) ) ( not ( = ?auto_83646 ?auto_83650 ) ) ( not ( = ?auto_83647 ?auto_83650 ) ) ( not ( = ?auto_83648 ?auto_83650 ) ) ( not ( = ?auto_83649 ?auto_83650 ) ) ( not ( = ?auto_83651 ?auto_83650 ) ) ( ON ?auto_83645 ?auto_83644 ) ( ON-TABLE ?auto_83650 ) ( ON ?auto_83646 ?auto_83645 ) ( CLEAR ?auto_83646 ) ( HOLDING ?auto_83647 ) ( CLEAR ?auto_83648 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83651 ?auto_83649 ?auto_83648 ?auto_83647 )
      ( MAKE-5PILE ?auto_83644 ?auto_83645 ?auto_83646 ?auto_83647 ?auto_83648 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83652 - BLOCK
      ?auto_83653 - BLOCK
      ?auto_83654 - BLOCK
      ?auto_83655 - BLOCK
      ?auto_83656 - BLOCK
    )
    :vars
    (
      ?auto_83658 - BLOCK
      ?auto_83659 - BLOCK
      ?auto_83657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83652 ?auto_83653 ) ) ( not ( = ?auto_83652 ?auto_83654 ) ) ( not ( = ?auto_83652 ?auto_83655 ) ) ( not ( = ?auto_83652 ?auto_83656 ) ) ( not ( = ?auto_83653 ?auto_83654 ) ) ( not ( = ?auto_83653 ?auto_83655 ) ) ( not ( = ?auto_83653 ?auto_83656 ) ) ( not ( = ?auto_83654 ?auto_83655 ) ) ( not ( = ?auto_83654 ?auto_83656 ) ) ( not ( = ?auto_83655 ?auto_83656 ) ) ( ON ?auto_83656 ?auto_83658 ) ( not ( = ?auto_83652 ?auto_83658 ) ) ( not ( = ?auto_83653 ?auto_83658 ) ) ( not ( = ?auto_83654 ?auto_83658 ) ) ( not ( = ?auto_83655 ?auto_83658 ) ) ( not ( = ?auto_83656 ?auto_83658 ) ) ( ON-TABLE ?auto_83659 ) ( ON ?auto_83658 ?auto_83659 ) ( not ( = ?auto_83659 ?auto_83658 ) ) ( not ( = ?auto_83659 ?auto_83656 ) ) ( not ( = ?auto_83659 ?auto_83655 ) ) ( not ( = ?auto_83652 ?auto_83659 ) ) ( not ( = ?auto_83653 ?auto_83659 ) ) ( not ( = ?auto_83654 ?auto_83659 ) ) ( ON ?auto_83652 ?auto_83657 ) ( not ( = ?auto_83652 ?auto_83657 ) ) ( not ( = ?auto_83653 ?auto_83657 ) ) ( not ( = ?auto_83654 ?auto_83657 ) ) ( not ( = ?auto_83655 ?auto_83657 ) ) ( not ( = ?auto_83656 ?auto_83657 ) ) ( not ( = ?auto_83658 ?auto_83657 ) ) ( not ( = ?auto_83659 ?auto_83657 ) ) ( ON ?auto_83653 ?auto_83652 ) ( ON-TABLE ?auto_83657 ) ( ON ?auto_83654 ?auto_83653 ) ( CLEAR ?auto_83656 ) ( ON ?auto_83655 ?auto_83654 ) ( CLEAR ?auto_83655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83657 ?auto_83652 ?auto_83653 ?auto_83654 )
      ( MAKE-5PILE ?auto_83652 ?auto_83653 ?auto_83654 ?auto_83655 ?auto_83656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83660 - BLOCK
      ?auto_83661 - BLOCK
      ?auto_83662 - BLOCK
      ?auto_83663 - BLOCK
      ?auto_83664 - BLOCK
    )
    :vars
    (
      ?auto_83667 - BLOCK
      ?auto_83666 - BLOCK
      ?auto_83665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83660 ?auto_83661 ) ) ( not ( = ?auto_83660 ?auto_83662 ) ) ( not ( = ?auto_83660 ?auto_83663 ) ) ( not ( = ?auto_83660 ?auto_83664 ) ) ( not ( = ?auto_83661 ?auto_83662 ) ) ( not ( = ?auto_83661 ?auto_83663 ) ) ( not ( = ?auto_83661 ?auto_83664 ) ) ( not ( = ?auto_83662 ?auto_83663 ) ) ( not ( = ?auto_83662 ?auto_83664 ) ) ( not ( = ?auto_83663 ?auto_83664 ) ) ( not ( = ?auto_83660 ?auto_83667 ) ) ( not ( = ?auto_83661 ?auto_83667 ) ) ( not ( = ?auto_83662 ?auto_83667 ) ) ( not ( = ?auto_83663 ?auto_83667 ) ) ( not ( = ?auto_83664 ?auto_83667 ) ) ( ON-TABLE ?auto_83666 ) ( ON ?auto_83667 ?auto_83666 ) ( not ( = ?auto_83666 ?auto_83667 ) ) ( not ( = ?auto_83666 ?auto_83664 ) ) ( not ( = ?auto_83666 ?auto_83663 ) ) ( not ( = ?auto_83660 ?auto_83666 ) ) ( not ( = ?auto_83661 ?auto_83666 ) ) ( not ( = ?auto_83662 ?auto_83666 ) ) ( ON ?auto_83660 ?auto_83665 ) ( not ( = ?auto_83660 ?auto_83665 ) ) ( not ( = ?auto_83661 ?auto_83665 ) ) ( not ( = ?auto_83662 ?auto_83665 ) ) ( not ( = ?auto_83663 ?auto_83665 ) ) ( not ( = ?auto_83664 ?auto_83665 ) ) ( not ( = ?auto_83667 ?auto_83665 ) ) ( not ( = ?auto_83666 ?auto_83665 ) ) ( ON ?auto_83661 ?auto_83660 ) ( ON-TABLE ?auto_83665 ) ( ON ?auto_83662 ?auto_83661 ) ( ON ?auto_83663 ?auto_83662 ) ( CLEAR ?auto_83663 ) ( HOLDING ?auto_83664 ) ( CLEAR ?auto_83667 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83666 ?auto_83667 ?auto_83664 )
      ( MAKE-5PILE ?auto_83660 ?auto_83661 ?auto_83662 ?auto_83663 ?auto_83664 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83668 - BLOCK
      ?auto_83669 - BLOCK
      ?auto_83670 - BLOCK
      ?auto_83671 - BLOCK
      ?auto_83672 - BLOCK
    )
    :vars
    (
      ?auto_83675 - BLOCK
      ?auto_83674 - BLOCK
      ?auto_83673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83668 ?auto_83669 ) ) ( not ( = ?auto_83668 ?auto_83670 ) ) ( not ( = ?auto_83668 ?auto_83671 ) ) ( not ( = ?auto_83668 ?auto_83672 ) ) ( not ( = ?auto_83669 ?auto_83670 ) ) ( not ( = ?auto_83669 ?auto_83671 ) ) ( not ( = ?auto_83669 ?auto_83672 ) ) ( not ( = ?auto_83670 ?auto_83671 ) ) ( not ( = ?auto_83670 ?auto_83672 ) ) ( not ( = ?auto_83671 ?auto_83672 ) ) ( not ( = ?auto_83668 ?auto_83675 ) ) ( not ( = ?auto_83669 ?auto_83675 ) ) ( not ( = ?auto_83670 ?auto_83675 ) ) ( not ( = ?auto_83671 ?auto_83675 ) ) ( not ( = ?auto_83672 ?auto_83675 ) ) ( ON-TABLE ?auto_83674 ) ( ON ?auto_83675 ?auto_83674 ) ( not ( = ?auto_83674 ?auto_83675 ) ) ( not ( = ?auto_83674 ?auto_83672 ) ) ( not ( = ?auto_83674 ?auto_83671 ) ) ( not ( = ?auto_83668 ?auto_83674 ) ) ( not ( = ?auto_83669 ?auto_83674 ) ) ( not ( = ?auto_83670 ?auto_83674 ) ) ( ON ?auto_83668 ?auto_83673 ) ( not ( = ?auto_83668 ?auto_83673 ) ) ( not ( = ?auto_83669 ?auto_83673 ) ) ( not ( = ?auto_83670 ?auto_83673 ) ) ( not ( = ?auto_83671 ?auto_83673 ) ) ( not ( = ?auto_83672 ?auto_83673 ) ) ( not ( = ?auto_83675 ?auto_83673 ) ) ( not ( = ?auto_83674 ?auto_83673 ) ) ( ON ?auto_83669 ?auto_83668 ) ( ON-TABLE ?auto_83673 ) ( ON ?auto_83670 ?auto_83669 ) ( ON ?auto_83671 ?auto_83670 ) ( CLEAR ?auto_83675 ) ( ON ?auto_83672 ?auto_83671 ) ( CLEAR ?auto_83672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83673 ?auto_83668 ?auto_83669 ?auto_83670 ?auto_83671 )
      ( MAKE-5PILE ?auto_83668 ?auto_83669 ?auto_83670 ?auto_83671 ?auto_83672 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83676 - BLOCK
      ?auto_83677 - BLOCK
      ?auto_83678 - BLOCK
      ?auto_83679 - BLOCK
      ?auto_83680 - BLOCK
    )
    :vars
    (
      ?auto_83682 - BLOCK
      ?auto_83681 - BLOCK
      ?auto_83683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83676 ?auto_83677 ) ) ( not ( = ?auto_83676 ?auto_83678 ) ) ( not ( = ?auto_83676 ?auto_83679 ) ) ( not ( = ?auto_83676 ?auto_83680 ) ) ( not ( = ?auto_83677 ?auto_83678 ) ) ( not ( = ?auto_83677 ?auto_83679 ) ) ( not ( = ?auto_83677 ?auto_83680 ) ) ( not ( = ?auto_83678 ?auto_83679 ) ) ( not ( = ?auto_83678 ?auto_83680 ) ) ( not ( = ?auto_83679 ?auto_83680 ) ) ( not ( = ?auto_83676 ?auto_83682 ) ) ( not ( = ?auto_83677 ?auto_83682 ) ) ( not ( = ?auto_83678 ?auto_83682 ) ) ( not ( = ?auto_83679 ?auto_83682 ) ) ( not ( = ?auto_83680 ?auto_83682 ) ) ( ON-TABLE ?auto_83681 ) ( not ( = ?auto_83681 ?auto_83682 ) ) ( not ( = ?auto_83681 ?auto_83680 ) ) ( not ( = ?auto_83681 ?auto_83679 ) ) ( not ( = ?auto_83676 ?auto_83681 ) ) ( not ( = ?auto_83677 ?auto_83681 ) ) ( not ( = ?auto_83678 ?auto_83681 ) ) ( ON ?auto_83676 ?auto_83683 ) ( not ( = ?auto_83676 ?auto_83683 ) ) ( not ( = ?auto_83677 ?auto_83683 ) ) ( not ( = ?auto_83678 ?auto_83683 ) ) ( not ( = ?auto_83679 ?auto_83683 ) ) ( not ( = ?auto_83680 ?auto_83683 ) ) ( not ( = ?auto_83682 ?auto_83683 ) ) ( not ( = ?auto_83681 ?auto_83683 ) ) ( ON ?auto_83677 ?auto_83676 ) ( ON-TABLE ?auto_83683 ) ( ON ?auto_83678 ?auto_83677 ) ( ON ?auto_83679 ?auto_83678 ) ( ON ?auto_83680 ?auto_83679 ) ( CLEAR ?auto_83680 ) ( HOLDING ?auto_83682 ) ( CLEAR ?auto_83681 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83681 ?auto_83682 )
      ( MAKE-5PILE ?auto_83676 ?auto_83677 ?auto_83678 ?auto_83679 ?auto_83680 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83684 - BLOCK
      ?auto_83685 - BLOCK
      ?auto_83686 - BLOCK
      ?auto_83687 - BLOCK
      ?auto_83688 - BLOCK
    )
    :vars
    (
      ?auto_83690 - BLOCK
      ?auto_83691 - BLOCK
      ?auto_83689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83684 ?auto_83685 ) ) ( not ( = ?auto_83684 ?auto_83686 ) ) ( not ( = ?auto_83684 ?auto_83687 ) ) ( not ( = ?auto_83684 ?auto_83688 ) ) ( not ( = ?auto_83685 ?auto_83686 ) ) ( not ( = ?auto_83685 ?auto_83687 ) ) ( not ( = ?auto_83685 ?auto_83688 ) ) ( not ( = ?auto_83686 ?auto_83687 ) ) ( not ( = ?auto_83686 ?auto_83688 ) ) ( not ( = ?auto_83687 ?auto_83688 ) ) ( not ( = ?auto_83684 ?auto_83690 ) ) ( not ( = ?auto_83685 ?auto_83690 ) ) ( not ( = ?auto_83686 ?auto_83690 ) ) ( not ( = ?auto_83687 ?auto_83690 ) ) ( not ( = ?auto_83688 ?auto_83690 ) ) ( ON-TABLE ?auto_83691 ) ( not ( = ?auto_83691 ?auto_83690 ) ) ( not ( = ?auto_83691 ?auto_83688 ) ) ( not ( = ?auto_83691 ?auto_83687 ) ) ( not ( = ?auto_83684 ?auto_83691 ) ) ( not ( = ?auto_83685 ?auto_83691 ) ) ( not ( = ?auto_83686 ?auto_83691 ) ) ( ON ?auto_83684 ?auto_83689 ) ( not ( = ?auto_83684 ?auto_83689 ) ) ( not ( = ?auto_83685 ?auto_83689 ) ) ( not ( = ?auto_83686 ?auto_83689 ) ) ( not ( = ?auto_83687 ?auto_83689 ) ) ( not ( = ?auto_83688 ?auto_83689 ) ) ( not ( = ?auto_83690 ?auto_83689 ) ) ( not ( = ?auto_83691 ?auto_83689 ) ) ( ON ?auto_83685 ?auto_83684 ) ( ON-TABLE ?auto_83689 ) ( ON ?auto_83686 ?auto_83685 ) ( ON ?auto_83687 ?auto_83686 ) ( ON ?auto_83688 ?auto_83687 ) ( CLEAR ?auto_83691 ) ( ON ?auto_83690 ?auto_83688 ) ( CLEAR ?auto_83690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83689 ?auto_83684 ?auto_83685 ?auto_83686 ?auto_83687 ?auto_83688 )
      ( MAKE-5PILE ?auto_83684 ?auto_83685 ?auto_83686 ?auto_83687 ?auto_83688 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83692 - BLOCK
      ?auto_83693 - BLOCK
      ?auto_83694 - BLOCK
      ?auto_83695 - BLOCK
      ?auto_83696 - BLOCK
    )
    :vars
    (
      ?auto_83699 - BLOCK
      ?auto_83697 - BLOCK
      ?auto_83698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83692 ?auto_83693 ) ) ( not ( = ?auto_83692 ?auto_83694 ) ) ( not ( = ?auto_83692 ?auto_83695 ) ) ( not ( = ?auto_83692 ?auto_83696 ) ) ( not ( = ?auto_83693 ?auto_83694 ) ) ( not ( = ?auto_83693 ?auto_83695 ) ) ( not ( = ?auto_83693 ?auto_83696 ) ) ( not ( = ?auto_83694 ?auto_83695 ) ) ( not ( = ?auto_83694 ?auto_83696 ) ) ( not ( = ?auto_83695 ?auto_83696 ) ) ( not ( = ?auto_83692 ?auto_83699 ) ) ( not ( = ?auto_83693 ?auto_83699 ) ) ( not ( = ?auto_83694 ?auto_83699 ) ) ( not ( = ?auto_83695 ?auto_83699 ) ) ( not ( = ?auto_83696 ?auto_83699 ) ) ( not ( = ?auto_83697 ?auto_83699 ) ) ( not ( = ?auto_83697 ?auto_83696 ) ) ( not ( = ?auto_83697 ?auto_83695 ) ) ( not ( = ?auto_83692 ?auto_83697 ) ) ( not ( = ?auto_83693 ?auto_83697 ) ) ( not ( = ?auto_83694 ?auto_83697 ) ) ( ON ?auto_83692 ?auto_83698 ) ( not ( = ?auto_83692 ?auto_83698 ) ) ( not ( = ?auto_83693 ?auto_83698 ) ) ( not ( = ?auto_83694 ?auto_83698 ) ) ( not ( = ?auto_83695 ?auto_83698 ) ) ( not ( = ?auto_83696 ?auto_83698 ) ) ( not ( = ?auto_83699 ?auto_83698 ) ) ( not ( = ?auto_83697 ?auto_83698 ) ) ( ON ?auto_83693 ?auto_83692 ) ( ON-TABLE ?auto_83698 ) ( ON ?auto_83694 ?auto_83693 ) ( ON ?auto_83695 ?auto_83694 ) ( ON ?auto_83696 ?auto_83695 ) ( ON ?auto_83699 ?auto_83696 ) ( CLEAR ?auto_83699 ) ( HOLDING ?auto_83697 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83697 )
      ( MAKE-5PILE ?auto_83692 ?auto_83693 ?auto_83694 ?auto_83695 ?auto_83696 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_83700 - BLOCK
      ?auto_83701 - BLOCK
      ?auto_83702 - BLOCK
      ?auto_83703 - BLOCK
      ?auto_83704 - BLOCK
    )
    :vars
    (
      ?auto_83705 - BLOCK
      ?auto_83706 - BLOCK
      ?auto_83707 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83700 ?auto_83701 ) ) ( not ( = ?auto_83700 ?auto_83702 ) ) ( not ( = ?auto_83700 ?auto_83703 ) ) ( not ( = ?auto_83700 ?auto_83704 ) ) ( not ( = ?auto_83701 ?auto_83702 ) ) ( not ( = ?auto_83701 ?auto_83703 ) ) ( not ( = ?auto_83701 ?auto_83704 ) ) ( not ( = ?auto_83702 ?auto_83703 ) ) ( not ( = ?auto_83702 ?auto_83704 ) ) ( not ( = ?auto_83703 ?auto_83704 ) ) ( not ( = ?auto_83700 ?auto_83705 ) ) ( not ( = ?auto_83701 ?auto_83705 ) ) ( not ( = ?auto_83702 ?auto_83705 ) ) ( not ( = ?auto_83703 ?auto_83705 ) ) ( not ( = ?auto_83704 ?auto_83705 ) ) ( not ( = ?auto_83706 ?auto_83705 ) ) ( not ( = ?auto_83706 ?auto_83704 ) ) ( not ( = ?auto_83706 ?auto_83703 ) ) ( not ( = ?auto_83700 ?auto_83706 ) ) ( not ( = ?auto_83701 ?auto_83706 ) ) ( not ( = ?auto_83702 ?auto_83706 ) ) ( ON ?auto_83700 ?auto_83707 ) ( not ( = ?auto_83700 ?auto_83707 ) ) ( not ( = ?auto_83701 ?auto_83707 ) ) ( not ( = ?auto_83702 ?auto_83707 ) ) ( not ( = ?auto_83703 ?auto_83707 ) ) ( not ( = ?auto_83704 ?auto_83707 ) ) ( not ( = ?auto_83705 ?auto_83707 ) ) ( not ( = ?auto_83706 ?auto_83707 ) ) ( ON ?auto_83701 ?auto_83700 ) ( ON-TABLE ?auto_83707 ) ( ON ?auto_83702 ?auto_83701 ) ( ON ?auto_83703 ?auto_83702 ) ( ON ?auto_83704 ?auto_83703 ) ( ON ?auto_83705 ?auto_83704 ) ( ON ?auto_83706 ?auto_83705 ) ( CLEAR ?auto_83706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83707 ?auto_83700 ?auto_83701 ?auto_83702 ?auto_83703 ?auto_83704 ?auto_83705 )
      ( MAKE-5PILE ?auto_83700 ?auto_83701 ?auto_83702 ?auto_83703 ?auto_83704 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83709 - BLOCK
    )
    :vars
    (
      ?auto_83710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83710 ?auto_83709 ) ( CLEAR ?auto_83710 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83709 ) ( not ( = ?auto_83709 ?auto_83710 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83710 ?auto_83709 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83711 - BLOCK
    )
    :vars
    (
      ?auto_83712 - BLOCK
      ?auto_83713 - BLOCK
      ?auto_83714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83712 ?auto_83711 ) ( CLEAR ?auto_83712 ) ( ON-TABLE ?auto_83711 ) ( not ( = ?auto_83711 ?auto_83712 ) ) ( HOLDING ?auto_83713 ) ( CLEAR ?auto_83714 ) ( not ( = ?auto_83711 ?auto_83713 ) ) ( not ( = ?auto_83711 ?auto_83714 ) ) ( not ( = ?auto_83712 ?auto_83713 ) ) ( not ( = ?auto_83712 ?auto_83714 ) ) ( not ( = ?auto_83713 ?auto_83714 ) ) )
    :subtasks
    ( ( !STACK ?auto_83713 ?auto_83714 )
      ( MAKE-1PILE ?auto_83711 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83715 - BLOCK
    )
    :vars
    (
      ?auto_83717 - BLOCK
      ?auto_83718 - BLOCK
      ?auto_83716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83717 ?auto_83715 ) ( ON-TABLE ?auto_83715 ) ( not ( = ?auto_83715 ?auto_83717 ) ) ( CLEAR ?auto_83718 ) ( not ( = ?auto_83715 ?auto_83716 ) ) ( not ( = ?auto_83715 ?auto_83718 ) ) ( not ( = ?auto_83717 ?auto_83716 ) ) ( not ( = ?auto_83717 ?auto_83718 ) ) ( not ( = ?auto_83716 ?auto_83718 ) ) ( ON ?auto_83716 ?auto_83717 ) ( CLEAR ?auto_83716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83715 ?auto_83717 )
      ( MAKE-1PILE ?auto_83715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83719 - BLOCK
    )
    :vars
    (
      ?auto_83721 - BLOCK
      ?auto_83722 - BLOCK
      ?auto_83720 - BLOCK
      ?auto_83723 - BLOCK
      ?auto_83724 - BLOCK
      ?auto_83725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83721 ?auto_83719 ) ( ON-TABLE ?auto_83719 ) ( not ( = ?auto_83719 ?auto_83721 ) ) ( not ( = ?auto_83719 ?auto_83722 ) ) ( not ( = ?auto_83719 ?auto_83720 ) ) ( not ( = ?auto_83721 ?auto_83722 ) ) ( not ( = ?auto_83721 ?auto_83720 ) ) ( not ( = ?auto_83722 ?auto_83720 ) ) ( ON ?auto_83722 ?auto_83721 ) ( CLEAR ?auto_83722 ) ( HOLDING ?auto_83720 ) ( CLEAR ?auto_83723 ) ( ON-TABLE ?auto_83724 ) ( ON ?auto_83725 ?auto_83724 ) ( ON ?auto_83723 ?auto_83725 ) ( not ( = ?auto_83724 ?auto_83725 ) ) ( not ( = ?auto_83724 ?auto_83723 ) ) ( not ( = ?auto_83724 ?auto_83720 ) ) ( not ( = ?auto_83725 ?auto_83723 ) ) ( not ( = ?auto_83725 ?auto_83720 ) ) ( not ( = ?auto_83723 ?auto_83720 ) ) ( not ( = ?auto_83719 ?auto_83723 ) ) ( not ( = ?auto_83719 ?auto_83724 ) ) ( not ( = ?auto_83719 ?auto_83725 ) ) ( not ( = ?auto_83721 ?auto_83723 ) ) ( not ( = ?auto_83721 ?auto_83724 ) ) ( not ( = ?auto_83721 ?auto_83725 ) ) ( not ( = ?auto_83722 ?auto_83723 ) ) ( not ( = ?auto_83722 ?auto_83724 ) ) ( not ( = ?auto_83722 ?auto_83725 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83724 ?auto_83725 ?auto_83723 ?auto_83720 )
      ( MAKE-1PILE ?auto_83719 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83726 - BLOCK
    )
    :vars
    (
      ?auto_83732 - BLOCK
      ?auto_83727 - BLOCK
      ?auto_83728 - BLOCK
      ?auto_83729 - BLOCK
      ?auto_83730 - BLOCK
      ?auto_83731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83732 ?auto_83726 ) ( ON-TABLE ?auto_83726 ) ( not ( = ?auto_83726 ?auto_83732 ) ) ( not ( = ?auto_83726 ?auto_83727 ) ) ( not ( = ?auto_83726 ?auto_83728 ) ) ( not ( = ?auto_83732 ?auto_83727 ) ) ( not ( = ?auto_83732 ?auto_83728 ) ) ( not ( = ?auto_83727 ?auto_83728 ) ) ( ON ?auto_83727 ?auto_83732 ) ( CLEAR ?auto_83729 ) ( ON-TABLE ?auto_83730 ) ( ON ?auto_83731 ?auto_83730 ) ( ON ?auto_83729 ?auto_83731 ) ( not ( = ?auto_83730 ?auto_83731 ) ) ( not ( = ?auto_83730 ?auto_83729 ) ) ( not ( = ?auto_83730 ?auto_83728 ) ) ( not ( = ?auto_83731 ?auto_83729 ) ) ( not ( = ?auto_83731 ?auto_83728 ) ) ( not ( = ?auto_83729 ?auto_83728 ) ) ( not ( = ?auto_83726 ?auto_83729 ) ) ( not ( = ?auto_83726 ?auto_83730 ) ) ( not ( = ?auto_83726 ?auto_83731 ) ) ( not ( = ?auto_83732 ?auto_83729 ) ) ( not ( = ?auto_83732 ?auto_83730 ) ) ( not ( = ?auto_83732 ?auto_83731 ) ) ( not ( = ?auto_83727 ?auto_83729 ) ) ( not ( = ?auto_83727 ?auto_83730 ) ) ( not ( = ?auto_83727 ?auto_83731 ) ) ( ON ?auto_83728 ?auto_83727 ) ( CLEAR ?auto_83728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83726 ?auto_83732 ?auto_83727 )
      ( MAKE-1PILE ?auto_83726 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83733 - BLOCK
    )
    :vars
    (
      ?auto_83734 - BLOCK
      ?auto_83739 - BLOCK
      ?auto_83738 - BLOCK
      ?auto_83737 - BLOCK
      ?auto_83735 - BLOCK
      ?auto_83736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83734 ?auto_83733 ) ( ON-TABLE ?auto_83733 ) ( not ( = ?auto_83733 ?auto_83734 ) ) ( not ( = ?auto_83733 ?auto_83739 ) ) ( not ( = ?auto_83733 ?auto_83738 ) ) ( not ( = ?auto_83734 ?auto_83739 ) ) ( not ( = ?auto_83734 ?auto_83738 ) ) ( not ( = ?auto_83739 ?auto_83738 ) ) ( ON ?auto_83739 ?auto_83734 ) ( ON-TABLE ?auto_83737 ) ( ON ?auto_83735 ?auto_83737 ) ( not ( = ?auto_83737 ?auto_83735 ) ) ( not ( = ?auto_83737 ?auto_83736 ) ) ( not ( = ?auto_83737 ?auto_83738 ) ) ( not ( = ?auto_83735 ?auto_83736 ) ) ( not ( = ?auto_83735 ?auto_83738 ) ) ( not ( = ?auto_83736 ?auto_83738 ) ) ( not ( = ?auto_83733 ?auto_83736 ) ) ( not ( = ?auto_83733 ?auto_83737 ) ) ( not ( = ?auto_83733 ?auto_83735 ) ) ( not ( = ?auto_83734 ?auto_83736 ) ) ( not ( = ?auto_83734 ?auto_83737 ) ) ( not ( = ?auto_83734 ?auto_83735 ) ) ( not ( = ?auto_83739 ?auto_83736 ) ) ( not ( = ?auto_83739 ?auto_83737 ) ) ( not ( = ?auto_83739 ?auto_83735 ) ) ( ON ?auto_83738 ?auto_83739 ) ( CLEAR ?auto_83738 ) ( HOLDING ?auto_83736 ) ( CLEAR ?auto_83735 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83737 ?auto_83735 ?auto_83736 )
      ( MAKE-1PILE ?auto_83733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83740 - BLOCK
    )
    :vars
    (
      ?auto_83746 - BLOCK
      ?auto_83743 - BLOCK
      ?auto_83741 - BLOCK
      ?auto_83744 - BLOCK
      ?auto_83742 - BLOCK
      ?auto_83745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83746 ?auto_83740 ) ( ON-TABLE ?auto_83740 ) ( not ( = ?auto_83740 ?auto_83746 ) ) ( not ( = ?auto_83740 ?auto_83743 ) ) ( not ( = ?auto_83740 ?auto_83741 ) ) ( not ( = ?auto_83746 ?auto_83743 ) ) ( not ( = ?auto_83746 ?auto_83741 ) ) ( not ( = ?auto_83743 ?auto_83741 ) ) ( ON ?auto_83743 ?auto_83746 ) ( ON-TABLE ?auto_83744 ) ( ON ?auto_83742 ?auto_83744 ) ( not ( = ?auto_83744 ?auto_83742 ) ) ( not ( = ?auto_83744 ?auto_83745 ) ) ( not ( = ?auto_83744 ?auto_83741 ) ) ( not ( = ?auto_83742 ?auto_83745 ) ) ( not ( = ?auto_83742 ?auto_83741 ) ) ( not ( = ?auto_83745 ?auto_83741 ) ) ( not ( = ?auto_83740 ?auto_83745 ) ) ( not ( = ?auto_83740 ?auto_83744 ) ) ( not ( = ?auto_83740 ?auto_83742 ) ) ( not ( = ?auto_83746 ?auto_83745 ) ) ( not ( = ?auto_83746 ?auto_83744 ) ) ( not ( = ?auto_83746 ?auto_83742 ) ) ( not ( = ?auto_83743 ?auto_83745 ) ) ( not ( = ?auto_83743 ?auto_83744 ) ) ( not ( = ?auto_83743 ?auto_83742 ) ) ( ON ?auto_83741 ?auto_83743 ) ( CLEAR ?auto_83742 ) ( ON ?auto_83745 ?auto_83741 ) ( CLEAR ?auto_83745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83740 ?auto_83746 ?auto_83743 ?auto_83741 )
      ( MAKE-1PILE ?auto_83740 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83747 - BLOCK
    )
    :vars
    (
      ?auto_83749 - BLOCK
      ?auto_83753 - BLOCK
      ?auto_83751 - BLOCK
      ?auto_83752 - BLOCK
      ?auto_83750 - BLOCK
      ?auto_83748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83749 ?auto_83747 ) ( ON-TABLE ?auto_83747 ) ( not ( = ?auto_83747 ?auto_83749 ) ) ( not ( = ?auto_83747 ?auto_83753 ) ) ( not ( = ?auto_83747 ?auto_83751 ) ) ( not ( = ?auto_83749 ?auto_83753 ) ) ( not ( = ?auto_83749 ?auto_83751 ) ) ( not ( = ?auto_83753 ?auto_83751 ) ) ( ON ?auto_83753 ?auto_83749 ) ( ON-TABLE ?auto_83752 ) ( not ( = ?auto_83752 ?auto_83750 ) ) ( not ( = ?auto_83752 ?auto_83748 ) ) ( not ( = ?auto_83752 ?auto_83751 ) ) ( not ( = ?auto_83750 ?auto_83748 ) ) ( not ( = ?auto_83750 ?auto_83751 ) ) ( not ( = ?auto_83748 ?auto_83751 ) ) ( not ( = ?auto_83747 ?auto_83748 ) ) ( not ( = ?auto_83747 ?auto_83752 ) ) ( not ( = ?auto_83747 ?auto_83750 ) ) ( not ( = ?auto_83749 ?auto_83748 ) ) ( not ( = ?auto_83749 ?auto_83752 ) ) ( not ( = ?auto_83749 ?auto_83750 ) ) ( not ( = ?auto_83753 ?auto_83748 ) ) ( not ( = ?auto_83753 ?auto_83752 ) ) ( not ( = ?auto_83753 ?auto_83750 ) ) ( ON ?auto_83751 ?auto_83753 ) ( ON ?auto_83748 ?auto_83751 ) ( CLEAR ?auto_83748 ) ( HOLDING ?auto_83750 ) ( CLEAR ?auto_83752 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83752 ?auto_83750 )
      ( MAKE-1PILE ?auto_83747 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83754 - BLOCK
    )
    :vars
    (
      ?auto_83758 - BLOCK
      ?auto_83755 - BLOCK
      ?auto_83760 - BLOCK
      ?auto_83757 - BLOCK
      ?auto_83759 - BLOCK
      ?auto_83756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83758 ?auto_83754 ) ( ON-TABLE ?auto_83754 ) ( not ( = ?auto_83754 ?auto_83758 ) ) ( not ( = ?auto_83754 ?auto_83755 ) ) ( not ( = ?auto_83754 ?auto_83760 ) ) ( not ( = ?auto_83758 ?auto_83755 ) ) ( not ( = ?auto_83758 ?auto_83760 ) ) ( not ( = ?auto_83755 ?auto_83760 ) ) ( ON ?auto_83755 ?auto_83758 ) ( ON-TABLE ?auto_83757 ) ( not ( = ?auto_83757 ?auto_83759 ) ) ( not ( = ?auto_83757 ?auto_83756 ) ) ( not ( = ?auto_83757 ?auto_83760 ) ) ( not ( = ?auto_83759 ?auto_83756 ) ) ( not ( = ?auto_83759 ?auto_83760 ) ) ( not ( = ?auto_83756 ?auto_83760 ) ) ( not ( = ?auto_83754 ?auto_83756 ) ) ( not ( = ?auto_83754 ?auto_83757 ) ) ( not ( = ?auto_83754 ?auto_83759 ) ) ( not ( = ?auto_83758 ?auto_83756 ) ) ( not ( = ?auto_83758 ?auto_83757 ) ) ( not ( = ?auto_83758 ?auto_83759 ) ) ( not ( = ?auto_83755 ?auto_83756 ) ) ( not ( = ?auto_83755 ?auto_83757 ) ) ( not ( = ?auto_83755 ?auto_83759 ) ) ( ON ?auto_83760 ?auto_83755 ) ( ON ?auto_83756 ?auto_83760 ) ( CLEAR ?auto_83757 ) ( ON ?auto_83759 ?auto_83756 ) ( CLEAR ?auto_83759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83754 ?auto_83758 ?auto_83755 ?auto_83760 ?auto_83756 )
      ( MAKE-1PILE ?auto_83754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83761 - BLOCK
    )
    :vars
    (
      ?auto_83767 - BLOCK
      ?auto_83762 - BLOCK
      ?auto_83764 - BLOCK
      ?auto_83766 - BLOCK
      ?auto_83765 - BLOCK
      ?auto_83763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83767 ?auto_83761 ) ( ON-TABLE ?auto_83761 ) ( not ( = ?auto_83761 ?auto_83767 ) ) ( not ( = ?auto_83761 ?auto_83762 ) ) ( not ( = ?auto_83761 ?auto_83764 ) ) ( not ( = ?auto_83767 ?auto_83762 ) ) ( not ( = ?auto_83767 ?auto_83764 ) ) ( not ( = ?auto_83762 ?auto_83764 ) ) ( ON ?auto_83762 ?auto_83767 ) ( not ( = ?auto_83766 ?auto_83765 ) ) ( not ( = ?auto_83766 ?auto_83763 ) ) ( not ( = ?auto_83766 ?auto_83764 ) ) ( not ( = ?auto_83765 ?auto_83763 ) ) ( not ( = ?auto_83765 ?auto_83764 ) ) ( not ( = ?auto_83763 ?auto_83764 ) ) ( not ( = ?auto_83761 ?auto_83763 ) ) ( not ( = ?auto_83761 ?auto_83766 ) ) ( not ( = ?auto_83761 ?auto_83765 ) ) ( not ( = ?auto_83767 ?auto_83763 ) ) ( not ( = ?auto_83767 ?auto_83766 ) ) ( not ( = ?auto_83767 ?auto_83765 ) ) ( not ( = ?auto_83762 ?auto_83763 ) ) ( not ( = ?auto_83762 ?auto_83766 ) ) ( not ( = ?auto_83762 ?auto_83765 ) ) ( ON ?auto_83764 ?auto_83762 ) ( ON ?auto_83763 ?auto_83764 ) ( ON ?auto_83765 ?auto_83763 ) ( CLEAR ?auto_83765 ) ( HOLDING ?auto_83766 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83766 )
      ( MAKE-1PILE ?auto_83761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83768 - BLOCK
    )
    :vars
    (
      ?auto_83769 - BLOCK
      ?auto_83770 - BLOCK
      ?auto_83772 - BLOCK
      ?auto_83773 - BLOCK
      ?auto_83774 - BLOCK
      ?auto_83771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83769 ?auto_83768 ) ( ON-TABLE ?auto_83768 ) ( not ( = ?auto_83768 ?auto_83769 ) ) ( not ( = ?auto_83768 ?auto_83770 ) ) ( not ( = ?auto_83768 ?auto_83772 ) ) ( not ( = ?auto_83769 ?auto_83770 ) ) ( not ( = ?auto_83769 ?auto_83772 ) ) ( not ( = ?auto_83770 ?auto_83772 ) ) ( ON ?auto_83770 ?auto_83769 ) ( not ( = ?auto_83773 ?auto_83774 ) ) ( not ( = ?auto_83773 ?auto_83771 ) ) ( not ( = ?auto_83773 ?auto_83772 ) ) ( not ( = ?auto_83774 ?auto_83771 ) ) ( not ( = ?auto_83774 ?auto_83772 ) ) ( not ( = ?auto_83771 ?auto_83772 ) ) ( not ( = ?auto_83768 ?auto_83771 ) ) ( not ( = ?auto_83768 ?auto_83773 ) ) ( not ( = ?auto_83768 ?auto_83774 ) ) ( not ( = ?auto_83769 ?auto_83771 ) ) ( not ( = ?auto_83769 ?auto_83773 ) ) ( not ( = ?auto_83769 ?auto_83774 ) ) ( not ( = ?auto_83770 ?auto_83771 ) ) ( not ( = ?auto_83770 ?auto_83773 ) ) ( not ( = ?auto_83770 ?auto_83774 ) ) ( ON ?auto_83772 ?auto_83770 ) ( ON ?auto_83771 ?auto_83772 ) ( ON ?auto_83774 ?auto_83771 ) ( ON ?auto_83773 ?auto_83774 ) ( CLEAR ?auto_83773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83768 ?auto_83769 ?auto_83770 ?auto_83772 ?auto_83771 ?auto_83774 )
      ( MAKE-1PILE ?auto_83768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83775 - BLOCK
    )
    :vars
    (
      ?auto_83778 - BLOCK
      ?auto_83779 - BLOCK
      ?auto_83776 - BLOCK
      ?auto_83781 - BLOCK
      ?auto_83780 - BLOCK
      ?auto_83777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83778 ?auto_83775 ) ( ON-TABLE ?auto_83775 ) ( not ( = ?auto_83775 ?auto_83778 ) ) ( not ( = ?auto_83775 ?auto_83779 ) ) ( not ( = ?auto_83775 ?auto_83776 ) ) ( not ( = ?auto_83778 ?auto_83779 ) ) ( not ( = ?auto_83778 ?auto_83776 ) ) ( not ( = ?auto_83779 ?auto_83776 ) ) ( ON ?auto_83779 ?auto_83778 ) ( not ( = ?auto_83781 ?auto_83780 ) ) ( not ( = ?auto_83781 ?auto_83777 ) ) ( not ( = ?auto_83781 ?auto_83776 ) ) ( not ( = ?auto_83780 ?auto_83777 ) ) ( not ( = ?auto_83780 ?auto_83776 ) ) ( not ( = ?auto_83777 ?auto_83776 ) ) ( not ( = ?auto_83775 ?auto_83777 ) ) ( not ( = ?auto_83775 ?auto_83781 ) ) ( not ( = ?auto_83775 ?auto_83780 ) ) ( not ( = ?auto_83778 ?auto_83777 ) ) ( not ( = ?auto_83778 ?auto_83781 ) ) ( not ( = ?auto_83778 ?auto_83780 ) ) ( not ( = ?auto_83779 ?auto_83777 ) ) ( not ( = ?auto_83779 ?auto_83781 ) ) ( not ( = ?auto_83779 ?auto_83780 ) ) ( ON ?auto_83776 ?auto_83779 ) ( ON ?auto_83777 ?auto_83776 ) ( ON ?auto_83780 ?auto_83777 ) ( HOLDING ?auto_83781 ) ( CLEAR ?auto_83780 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83775 ?auto_83778 ?auto_83779 ?auto_83776 ?auto_83777 ?auto_83780 ?auto_83781 )
      ( MAKE-1PILE ?auto_83775 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83782 - BLOCK
    )
    :vars
    (
      ?auto_83786 - BLOCK
      ?auto_83784 - BLOCK
      ?auto_83783 - BLOCK
      ?auto_83785 - BLOCK
      ?auto_83788 - BLOCK
      ?auto_83787 - BLOCK
      ?auto_83789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83786 ?auto_83782 ) ( ON-TABLE ?auto_83782 ) ( not ( = ?auto_83782 ?auto_83786 ) ) ( not ( = ?auto_83782 ?auto_83784 ) ) ( not ( = ?auto_83782 ?auto_83783 ) ) ( not ( = ?auto_83786 ?auto_83784 ) ) ( not ( = ?auto_83786 ?auto_83783 ) ) ( not ( = ?auto_83784 ?auto_83783 ) ) ( ON ?auto_83784 ?auto_83786 ) ( not ( = ?auto_83785 ?auto_83788 ) ) ( not ( = ?auto_83785 ?auto_83787 ) ) ( not ( = ?auto_83785 ?auto_83783 ) ) ( not ( = ?auto_83788 ?auto_83787 ) ) ( not ( = ?auto_83788 ?auto_83783 ) ) ( not ( = ?auto_83787 ?auto_83783 ) ) ( not ( = ?auto_83782 ?auto_83787 ) ) ( not ( = ?auto_83782 ?auto_83785 ) ) ( not ( = ?auto_83782 ?auto_83788 ) ) ( not ( = ?auto_83786 ?auto_83787 ) ) ( not ( = ?auto_83786 ?auto_83785 ) ) ( not ( = ?auto_83786 ?auto_83788 ) ) ( not ( = ?auto_83784 ?auto_83787 ) ) ( not ( = ?auto_83784 ?auto_83785 ) ) ( not ( = ?auto_83784 ?auto_83788 ) ) ( ON ?auto_83783 ?auto_83784 ) ( ON ?auto_83787 ?auto_83783 ) ( ON ?auto_83788 ?auto_83787 ) ( CLEAR ?auto_83788 ) ( ON ?auto_83785 ?auto_83789 ) ( CLEAR ?auto_83785 ) ( HAND-EMPTY ) ( not ( = ?auto_83782 ?auto_83789 ) ) ( not ( = ?auto_83786 ?auto_83789 ) ) ( not ( = ?auto_83784 ?auto_83789 ) ) ( not ( = ?auto_83783 ?auto_83789 ) ) ( not ( = ?auto_83785 ?auto_83789 ) ) ( not ( = ?auto_83788 ?auto_83789 ) ) ( not ( = ?auto_83787 ?auto_83789 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83785 ?auto_83789 )
      ( MAKE-1PILE ?auto_83782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83790 - BLOCK
    )
    :vars
    (
      ?auto_83792 - BLOCK
      ?auto_83796 - BLOCK
      ?auto_83791 - BLOCK
      ?auto_83795 - BLOCK
      ?auto_83793 - BLOCK
      ?auto_83797 - BLOCK
      ?auto_83794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83792 ?auto_83790 ) ( ON-TABLE ?auto_83790 ) ( not ( = ?auto_83790 ?auto_83792 ) ) ( not ( = ?auto_83790 ?auto_83796 ) ) ( not ( = ?auto_83790 ?auto_83791 ) ) ( not ( = ?auto_83792 ?auto_83796 ) ) ( not ( = ?auto_83792 ?auto_83791 ) ) ( not ( = ?auto_83796 ?auto_83791 ) ) ( ON ?auto_83796 ?auto_83792 ) ( not ( = ?auto_83795 ?auto_83793 ) ) ( not ( = ?auto_83795 ?auto_83797 ) ) ( not ( = ?auto_83795 ?auto_83791 ) ) ( not ( = ?auto_83793 ?auto_83797 ) ) ( not ( = ?auto_83793 ?auto_83791 ) ) ( not ( = ?auto_83797 ?auto_83791 ) ) ( not ( = ?auto_83790 ?auto_83797 ) ) ( not ( = ?auto_83790 ?auto_83795 ) ) ( not ( = ?auto_83790 ?auto_83793 ) ) ( not ( = ?auto_83792 ?auto_83797 ) ) ( not ( = ?auto_83792 ?auto_83795 ) ) ( not ( = ?auto_83792 ?auto_83793 ) ) ( not ( = ?auto_83796 ?auto_83797 ) ) ( not ( = ?auto_83796 ?auto_83795 ) ) ( not ( = ?auto_83796 ?auto_83793 ) ) ( ON ?auto_83791 ?auto_83796 ) ( ON ?auto_83797 ?auto_83791 ) ( ON ?auto_83795 ?auto_83794 ) ( CLEAR ?auto_83795 ) ( not ( = ?auto_83790 ?auto_83794 ) ) ( not ( = ?auto_83792 ?auto_83794 ) ) ( not ( = ?auto_83796 ?auto_83794 ) ) ( not ( = ?auto_83791 ?auto_83794 ) ) ( not ( = ?auto_83795 ?auto_83794 ) ) ( not ( = ?auto_83793 ?auto_83794 ) ) ( not ( = ?auto_83797 ?auto_83794 ) ) ( HOLDING ?auto_83793 ) ( CLEAR ?auto_83797 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83790 ?auto_83792 ?auto_83796 ?auto_83791 ?auto_83797 ?auto_83793 )
      ( MAKE-1PILE ?auto_83790 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83798 - BLOCK
    )
    :vars
    (
      ?auto_83801 - BLOCK
      ?auto_83800 - BLOCK
      ?auto_83802 - BLOCK
      ?auto_83805 - BLOCK
      ?auto_83803 - BLOCK
      ?auto_83799 - BLOCK
      ?auto_83804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83801 ?auto_83798 ) ( ON-TABLE ?auto_83798 ) ( not ( = ?auto_83798 ?auto_83801 ) ) ( not ( = ?auto_83798 ?auto_83800 ) ) ( not ( = ?auto_83798 ?auto_83802 ) ) ( not ( = ?auto_83801 ?auto_83800 ) ) ( not ( = ?auto_83801 ?auto_83802 ) ) ( not ( = ?auto_83800 ?auto_83802 ) ) ( ON ?auto_83800 ?auto_83801 ) ( not ( = ?auto_83805 ?auto_83803 ) ) ( not ( = ?auto_83805 ?auto_83799 ) ) ( not ( = ?auto_83805 ?auto_83802 ) ) ( not ( = ?auto_83803 ?auto_83799 ) ) ( not ( = ?auto_83803 ?auto_83802 ) ) ( not ( = ?auto_83799 ?auto_83802 ) ) ( not ( = ?auto_83798 ?auto_83799 ) ) ( not ( = ?auto_83798 ?auto_83805 ) ) ( not ( = ?auto_83798 ?auto_83803 ) ) ( not ( = ?auto_83801 ?auto_83799 ) ) ( not ( = ?auto_83801 ?auto_83805 ) ) ( not ( = ?auto_83801 ?auto_83803 ) ) ( not ( = ?auto_83800 ?auto_83799 ) ) ( not ( = ?auto_83800 ?auto_83805 ) ) ( not ( = ?auto_83800 ?auto_83803 ) ) ( ON ?auto_83802 ?auto_83800 ) ( ON ?auto_83799 ?auto_83802 ) ( ON ?auto_83805 ?auto_83804 ) ( not ( = ?auto_83798 ?auto_83804 ) ) ( not ( = ?auto_83801 ?auto_83804 ) ) ( not ( = ?auto_83800 ?auto_83804 ) ) ( not ( = ?auto_83802 ?auto_83804 ) ) ( not ( = ?auto_83805 ?auto_83804 ) ) ( not ( = ?auto_83803 ?auto_83804 ) ) ( not ( = ?auto_83799 ?auto_83804 ) ) ( CLEAR ?auto_83799 ) ( ON ?auto_83803 ?auto_83805 ) ( CLEAR ?auto_83803 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83804 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83804 ?auto_83805 )
      ( MAKE-1PILE ?auto_83798 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83806 - BLOCK
    )
    :vars
    (
      ?auto_83808 - BLOCK
      ?auto_83810 - BLOCK
      ?auto_83813 - BLOCK
      ?auto_83809 - BLOCK
      ?auto_83807 - BLOCK
      ?auto_83811 - BLOCK
      ?auto_83812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83808 ?auto_83806 ) ( ON-TABLE ?auto_83806 ) ( not ( = ?auto_83806 ?auto_83808 ) ) ( not ( = ?auto_83806 ?auto_83810 ) ) ( not ( = ?auto_83806 ?auto_83813 ) ) ( not ( = ?auto_83808 ?auto_83810 ) ) ( not ( = ?auto_83808 ?auto_83813 ) ) ( not ( = ?auto_83810 ?auto_83813 ) ) ( ON ?auto_83810 ?auto_83808 ) ( not ( = ?auto_83809 ?auto_83807 ) ) ( not ( = ?auto_83809 ?auto_83811 ) ) ( not ( = ?auto_83809 ?auto_83813 ) ) ( not ( = ?auto_83807 ?auto_83811 ) ) ( not ( = ?auto_83807 ?auto_83813 ) ) ( not ( = ?auto_83811 ?auto_83813 ) ) ( not ( = ?auto_83806 ?auto_83811 ) ) ( not ( = ?auto_83806 ?auto_83809 ) ) ( not ( = ?auto_83806 ?auto_83807 ) ) ( not ( = ?auto_83808 ?auto_83811 ) ) ( not ( = ?auto_83808 ?auto_83809 ) ) ( not ( = ?auto_83808 ?auto_83807 ) ) ( not ( = ?auto_83810 ?auto_83811 ) ) ( not ( = ?auto_83810 ?auto_83809 ) ) ( not ( = ?auto_83810 ?auto_83807 ) ) ( ON ?auto_83813 ?auto_83810 ) ( ON ?auto_83809 ?auto_83812 ) ( not ( = ?auto_83806 ?auto_83812 ) ) ( not ( = ?auto_83808 ?auto_83812 ) ) ( not ( = ?auto_83810 ?auto_83812 ) ) ( not ( = ?auto_83813 ?auto_83812 ) ) ( not ( = ?auto_83809 ?auto_83812 ) ) ( not ( = ?auto_83807 ?auto_83812 ) ) ( not ( = ?auto_83811 ?auto_83812 ) ) ( ON ?auto_83807 ?auto_83809 ) ( CLEAR ?auto_83807 ) ( ON-TABLE ?auto_83812 ) ( HOLDING ?auto_83811 ) ( CLEAR ?auto_83813 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83806 ?auto_83808 ?auto_83810 ?auto_83813 ?auto_83811 )
      ( MAKE-1PILE ?auto_83806 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83814 - BLOCK
    )
    :vars
    (
      ?auto_83819 - BLOCK
      ?auto_83818 - BLOCK
      ?auto_83820 - BLOCK
      ?auto_83817 - BLOCK
      ?auto_83815 - BLOCK
      ?auto_83821 - BLOCK
      ?auto_83816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83819 ?auto_83814 ) ( ON-TABLE ?auto_83814 ) ( not ( = ?auto_83814 ?auto_83819 ) ) ( not ( = ?auto_83814 ?auto_83818 ) ) ( not ( = ?auto_83814 ?auto_83820 ) ) ( not ( = ?auto_83819 ?auto_83818 ) ) ( not ( = ?auto_83819 ?auto_83820 ) ) ( not ( = ?auto_83818 ?auto_83820 ) ) ( ON ?auto_83818 ?auto_83819 ) ( not ( = ?auto_83817 ?auto_83815 ) ) ( not ( = ?auto_83817 ?auto_83821 ) ) ( not ( = ?auto_83817 ?auto_83820 ) ) ( not ( = ?auto_83815 ?auto_83821 ) ) ( not ( = ?auto_83815 ?auto_83820 ) ) ( not ( = ?auto_83821 ?auto_83820 ) ) ( not ( = ?auto_83814 ?auto_83821 ) ) ( not ( = ?auto_83814 ?auto_83817 ) ) ( not ( = ?auto_83814 ?auto_83815 ) ) ( not ( = ?auto_83819 ?auto_83821 ) ) ( not ( = ?auto_83819 ?auto_83817 ) ) ( not ( = ?auto_83819 ?auto_83815 ) ) ( not ( = ?auto_83818 ?auto_83821 ) ) ( not ( = ?auto_83818 ?auto_83817 ) ) ( not ( = ?auto_83818 ?auto_83815 ) ) ( ON ?auto_83820 ?auto_83818 ) ( ON ?auto_83817 ?auto_83816 ) ( not ( = ?auto_83814 ?auto_83816 ) ) ( not ( = ?auto_83819 ?auto_83816 ) ) ( not ( = ?auto_83818 ?auto_83816 ) ) ( not ( = ?auto_83820 ?auto_83816 ) ) ( not ( = ?auto_83817 ?auto_83816 ) ) ( not ( = ?auto_83815 ?auto_83816 ) ) ( not ( = ?auto_83821 ?auto_83816 ) ) ( ON ?auto_83815 ?auto_83817 ) ( ON-TABLE ?auto_83816 ) ( CLEAR ?auto_83820 ) ( ON ?auto_83821 ?auto_83815 ) ( CLEAR ?auto_83821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83816 ?auto_83817 ?auto_83815 )
      ( MAKE-1PILE ?auto_83814 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83822 - BLOCK
    )
    :vars
    (
      ?auto_83824 - BLOCK
      ?auto_83825 - BLOCK
      ?auto_83827 - BLOCK
      ?auto_83829 - BLOCK
      ?auto_83826 - BLOCK
      ?auto_83823 - BLOCK
      ?auto_83828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83824 ?auto_83822 ) ( ON-TABLE ?auto_83822 ) ( not ( = ?auto_83822 ?auto_83824 ) ) ( not ( = ?auto_83822 ?auto_83825 ) ) ( not ( = ?auto_83822 ?auto_83827 ) ) ( not ( = ?auto_83824 ?auto_83825 ) ) ( not ( = ?auto_83824 ?auto_83827 ) ) ( not ( = ?auto_83825 ?auto_83827 ) ) ( ON ?auto_83825 ?auto_83824 ) ( not ( = ?auto_83829 ?auto_83826 ) ) ( not ( = ?auto_83829 ?auto_83823 ) ) ( not ( = ?auto_83829 ?auto_83827 ) ) ( not ( = ?auto_83826 ?auto_83823 ) ) ( not ( = ?auto_83826 ?auto_83827 ) ) ( not ( = ?auto_83823 ?auto_83827 ) ) ( not ( = ?auto_83822 ?auto_83823 ) ) ( not ( = ?auto_83822 ?auto_83829 ) ) ( not ( = ?auto_83822 ?auto_83826 ) ) ( not ( = ?auto_83824 ?auto_83823 ) ) ( not ( = ?auto_83824 ?auto_83829 ) ) ( not ( = ?auto_83824 ?auto_83826 ) ) ( not ( = ?auto_83825 ?auto_83823 ) ) ( not ( = ?auto_83825 ?auto_83829 ) ) ( not ( = ?auto_83825 ?auto_83826 ) ) ( ON ?auto_83829 ?auto_83828 ) ( not ( = ?auto_83822 ?auto_83828 ) ) ( not ( = ?auto_83824 ?auto_83828 ) ) ( not ( = ?auto_83825 ?auto_83828 ) ) ( not ( = ?auto_83827 ?auto_83828 ) ) ( not ( = ?auto_83829 ?auto_83828 ) ) ( not ( = ?auto_83826 ?auto_83828 ) ) ( not ( = ?auto_83823 ?auto_83828 ) ) ( ON ?auto_83826 ?auto_83829 ) ( ON-TABLE ?auto_83828 ) ( ON ?auto_83823 ?auto_83826 ) ( CLEAR ?auto_83823 ) ( HOLDING ?auto_83827 ) ( CLEAR ?auto_83825 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83822 ?auto_83824 ?auto_83825 ?auto_83827 )
      ( MAKE-1PILE ?auto_83822 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83830 - BLOCK
    )
    :vars
    (
      ?auto_83836 - BLOCK
      ?auto_83837 - BLOCK
      ?auto_83832 - BLOCK
      ?auto_83831 - BLOCK
      ?auto_83835 - BLOCK
      ?auto_83834 - BLOCK
      ?auto_83833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83836 ?auto_83830 ) ( ON-TABLE ?auto_83830 ) ( not ( = ?auto_83830 ?auto_83836 ) ) ( not ( = ?auto_83830 ?auto_83837 ) ) ( not ( = ?auto_83830 ?auto_83832 ) ) ( not ( = ?auto_83836 ?auto_83837 ) ) ( not ( = ?auto_83836 ?auto_83832 ) ) ( not ( = ?auto_83837 ?auto_83832 ) ) ( ON ?auto_83837 ?auto_83836 ) ( not ( = ?auto_83831 ?auto_83835 ) ) ( not ( = ?auto_83831 ?auto_83834 ) ) ( not ( = ?auto_83831 ?auto_83832 ) ) ( not ( = ?auto_83835 ?auto_83834 ) ) ( not ( = ?auto_83835 ?auto_83832 ) ) ( not ( = ?auto_83834 ?auto_83832 ) ) ( not ( = ?auto_83830 ?auto_83834 ) ) ( not ( = ?auto_83830 ?auto_83831 ) ) ( not ( = ?auto_83830 ?auto_83835 ) ) ( not ( = ?auto_83836 ?auto_83834 ) ) ( not ( = ?auto_83836 ?auto_83831 ) ) ( not ( = ?auto_83836 ?auto_83835 ) ) ( not ( = ?auto_83837 ?auto_83834 ) ) ( not ( = ?auto_83837 ?auto_83831 ) ) ( not ( = ?auto_83837 ?auto_83835 ) ) ( ON ?auto_83831 ?auto_83833 ) ( not ( = ?auto_83830 ?auto_83833 ) ) ( not ( = ?auto_83836 ?auto_83833 ) ) ( not ( = ?auto_83837 ?auto_83833 ) ) ( not ( = ?auto_83832 ?auto_83833 ) ) ( not ( = ?auto_83831 ?auto_83833 ) ) ( not ( = ?auto_83835 ?auto_83833 ) ) ( not ( = ?auto_83834 ?auto_83833 ) ) ( ON ?auto_83835 ?auto_83831 ) ( ON-TABLE ?auto_83833 ) ( ON ?auto_83834 ?auto_83835 ) ( CLEAR ?auto_83837 ) ( ON ?auto_83832 ?auto_83834 ) ( CLEAR ?auto_83832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83833 ?auto_83831 ?auto_83835 ?auto_83834 )
      ( MAKE-1PILE ?auto_83830 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83838 - BLOCK
    )
    :vars
    (
      ?auto_83845 - BLOCK
      ?auto_83844 - BLOCK
      ?auto_83843 - BLOCK
      ?auto_83840 - BLOCK
      ?auto_83841 - BLOCK
      ?auto_83839 - BLOCK
      ?auto_83842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83845 ?auto_83838 ) ( ON-TABLE ?auto_83838 ) ( not ( = ?auto_83838 ?auto_83845 ) ) ( not ( = ?auto_83838 ?auto_83844 ) ) ( not ( = ?auto_83838 ?auto_83843 ) ) ( not ( = ?auto_83845 ?auto_83844 ) ) ( not ( = ?auto_83845 ?auto_83843 ) ) ( not ( = ?auto_83844 ?auto_83843 ) ) ( not ( = ?auto_83840 ?auto_83841 ) ) ( not ( = ?auto_83840 ?auto_83839 ) ) ( not ( = ?auto_83840 ?auto_83843 ) ) ( not ( = ?auto_83841 ?auto_83839 ) ) ( not ( = ?auto_83841 ?auto_83843 ) ) ( not ( = ?auto_83839 ?auto_83843 ) ) ( not ( = ?auto_83838 ?auto_83839 ) ) ( not ( = ?auto_83838 ?auto_83840 ) ) ( not ( = ?auto_83838 ?auto_83841 ) ) ( not ( = ?auto_83845 ?auto_83839 ) ) ( not ( = ?auto_83845 ?auto_83840 ) ) ( not ( = ?auto_83845 ?auto_83841 ) ) ( not ( = ?auto_83844 ?auto_83839 ) ) ( not ( = ?auto_83844 ?auto_83840 ) ) ( not ( = ?auto_83844 ?auto_83841 ) ) ( ON ?auto_83840 ?auto_83842 ) ( not ( = ?auto_83838 ?auto_83842 ) ) ( not ( = ?auto_83845 ?auto_83842 ) ) ( not ( = ?auto_83844 ?auto_83842 ) ) ( not ( = ?auto_83843 ?auto_83842 ) ) ( not ( = ?auto_83840 ?auto_83842 ) ) ( not ( = ?auto_83841 ?auto_83842 ) ) ( not ( = ?auto_83839 ?auto_83842 ) ) ( ON ?auto_83841 ?auto_83840 ) ( ON-TABLE ?auto_83842 ) ( ON ?auto_83839 ?auto_83841 ) ( ON ?auto_83843 ?auto_83839 ) ( CLEAR ?auto_83843 ) ( HOLDING ?auto_83844 ) ( CLEAR ?auto_83845 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83838 ?auto_83845 ?auto_83844 )
      ( MAKE-1PILE ?auto_83838 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83846 - BLOCK
    )
    :vars
    (
      ?auto_83849 - BLOCK
      ?auto_83847 - BLOCK
      ?auto_83853 - BLOCK
      ?auto_83851 - BLOCK
      ?auto_83850 - BLOCK
      ?auto_83848 - BLOCK
      ?auto_83852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_83849 ?auto_83846 ) ( ON-TABLE ?auto_83846 ) ( not ( = ?auto_83846 ?auto_83849 ) ) ( not ( = ?auto_83846 ?auto_83847 ) ) ( not ( = ?auto_83846 ?auto_83853 ) ) ( not ( = ?auto_83849 ?auto_83847 ) ) ( not ( = ?auto_83849 ?auto_83853 ) ) ( not ( = ?auto_83847 ?auto_83853 ) ) ( not ( = ?auto_83851 ?auto_83850 ) ) ( not ( = ?auto_83851 ?auto_83848 ) ) ( not ( = ?auto_83851 ?auto_83853 ) ) ( not ( = ?auto_83850 ?auto_83848 ) ) ( not ( = ?auto_83850 ?auto_83853 ) ) ( not ( = ?auto_83848 ?auto_83853 ) ) ( not ( = ?auto_83846 ?auto_83848 ) ) ( not ( = ?auto_83846 ?auto_83851 ) ) ( not ( = ?auto_83846 ?auto_83850 ) ) ( not ( = ?auto_83849 ?auto_83848 ) ) ( not ( = ?auto_83849 ?auto_83851 ) ) ( not ( = ?auto_83849 ?auto_83850 ) ) ( not ( = ?auto_83847 ?auto_83848 ) ) ( not ( = ?auto_83847 ?auto_83851 ) ) ( not ( = ?auto_83847 ?auto_83850 ) ) ( ON ?auto_83851 ?auto_83852 ) ( not ( = ?auto_83846 ?auto_83852 ) ) ( not ( = ?auto_83849 ?auto_83852 ) ) ( not ( = ?auto_83847 ?auto_83852 ) ) ( not ( = ?auto_83853 ?auto_83852 ) ) ( not ( = ?auto_83851 ?auto_83852 ) ) ( not ( = ?auto_83850 ?auto_83852 ) ) ( not ( = ?auto_83848 ?auto_83852 ) ) ( ON ?auto_83850 ?auto_83851 ) ( ON-TABLE ?auto_83852 ) ( ON ?auto_83848 ?auto_83850 ) ( ON ?auto_83853 ?auto_83848 ) ( CLEAR ?auto_83849 ) ( ON ?auto_83847 ?auto_83853 ) ( CLEAR ?auto_83847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83852 ?auto_83851 ?auto_83850 ?auto_83848 ?auto_83853 )
      ( MAKE-1PILE ?auto_83846 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83870 - BLOCK
    )
    :vars
    (
      ?auto_83872 - BLOCK
      ?auto_83877 - BLOCK
      ?auto_83874 - BLOCK
      ?auto_83871 - BLOCK
      ?auto_83876 - BLOCK
      ?auto_83875 - BLOCK
      ?auto_83873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83870 ?auto_83872 ) ) ( not ( = ?auto_83870 ?auto_83877 ) ) ( not ( = ?auto_83870 ?auto_83874 ) ) ( not ( = ?auto_83872 ?auto_83877 ) ) ( not ( = ?auto_83872 ?auto_83874 ) ) ( not ( = ?auto_83877 ?auto_83874 ) ) ( not ( = ?auto_83871 ?auto_83876 ) ) ( not ( = ?auto_83871 ?auto_83875 ) ) ( not ( = ?auto_83871 ?auto_83874 ) ) ( not ( = ?auto_83876 ?auto_83875 ) ) ( not ( = ?auto_83876 ?auto_83874 ) ) ( not ( = ?auto_83875 ?auto_83874 ) ) ( not ( = ?auto_83870 ?auto_83875 ) ) ( not ( = ?auto_83870 ?auto_83871 ) ) ( not ( = ?auto_83870 ?auto_83876 ) ) ( not ( = ?auto_83872 ?auto_83875 ) ) ( not ( = ?auto_83872 ?auto_83871 ) ) ( not ( = ?auto_83872 ?auto_83876 ) ) ( not ( = ?auto_83877 ?auto_83875 ) ) ( not ( = ?auto_83877 ?auto_83871 ) ) ( not ( = ?auto_83877 ?auto_83876 ) ) ( ON ?auto_83871 ?auto_83873 ) ( not ( = ?auto_83870 ?auto_83873 ) ) ( not ( = ?auto_83872 ?auto_83873 ) ) ( not ( = ?auto_83877 ?auto_83873 ) ) ( not ( = ?auto_83874 ?auto_83873 ) ) ( not ( = ?auto_83871 ?auto_83873 ) ) ( not ( = ?auto_83876 ?auto_83873 ) ) ( not ( = ?auto_83875 ?auto_83873 ) ) ( ON ?auto_83876 ?auto_83871 ) ( ON-TABLE ?auto_83873 ) ( ON ?auto_83875 ?auto_83876 ) ( ON ?auto_83874 ?auto_83875 ) ( ON ?auto_83877 ?auto_83874 ) ( ON ?auto_83872 ?auto_83877 ) ( CLEAR ?auto_83872 ) ( HOLDING ?auto_83870 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83870 ?auto_83872 )
      ( MAKE-1PILE ?auto_83870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_83878 - BLOCK
    )
    :vars
    (
      ?auto_83882 - BLOCK
      ?auto_83884 - BLOCK
      ?auto_83881 - BLOCK
      ?auto_83883 - BLOCK
      ?auto_83885 - BLOCK
      ?auto_83880 - BLOCK
      ?auto_83879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83878 ?auto_83882 ) ) ( not ( = ?auto_83878 ?auto_83884 ) ) ( not ( = ?auto_83878 ?auto_83881 ) ) ( not ( = ?auto_83882 ?auto_83884 ) ) ( not ( = ?auto_83882 ?auto_83881 ) ) ( not ( = ?auto_83884 ?auto_83881 ) ) ( not ( = ?auto_83883 ?auto_83885 ) ) ( not ( = ?auto_83883 ?auto_83880 ) ) ( not ( = ?auto_83883 ?auto_83881 ) ) ( not ( = ?auto_83885 ?auto_83880 ) ) ( not ( = ?auto_83885 ?auto_83881 ) ) ( not ( = ?auto_83880 ?auto_83881 ) ) ( not ( = ?auto_83878 ?auto_83880 ) ) ( not ( = ?auto_83878 ?auto_83883 ) ) ( not ( = ?auto_83878 ?auto_83885 ) ) ( not ( = ?auto_83882 ?auto_83880 ) ) ( not ( = ?auto_83882 ?auto_83883 ) ) ( not ( = ?auto_83882 ?auto_83885 ) ) ( not ( = ?auto_83884 ?auto_83880 ) ) ( not ( = ?auto_83884 ?auto_83883 ) ) ( not ( = ?auto_83884 ?auto_83885 ) ) ( ON ?auto_83883 ?auto_83879 ) ( not ( = ?auto_83878 ?auto_83879 ) ) ( not ( = ?auto_83882 ?auto_83879 ) ) ( not ( = ?auto_83884 ?auto_83879 ) ) ( not ( = ?auto_83881 ?auto_83879 ) ) ( not ( = ?auto_83883 ?auto_83879 ) ) ( not ( = ?auto_83885 ?auto_83879 ) ) ( not ( = ?auto_83880 ?auto_83879 ) ) ( ON ?auto_83885 ?auto_83883 ) ( ON-TABLE ?auto_83879 ) ( ON ?auto_83880 ?auto_83885 ) ( ON ?auto_83881 ?auto_83880 ) ( ON ?auto_83884 ?auto_83881 ) ( ON ?auto_83882 ?auto_83884 ) ( ON ?auto_83878 ?auto_83882 ) ( CLEAR ?auto_83878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83879 ?auto_83883 ?auto_83885 ?auto_83880 ?auto_83881 ?auto_83884 ?auto_83882 )
      ( MAKE-1PILE ?auto_83878 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83892 - BLOCK
      ?auto_83893 - BLOCK
      ?auto_83894 - BLOCK
      ?auto_83895 - BLOCK
      ?auto_83896 - BLOCK
      ?auto_83897 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_83897 ) ( CLEAR ?auto_83896 ) ( ON-TABLE ?auto_83892 ) ( ON ?auto_83893 ?auto_83892 ) ( ON ?auto_83894 ?auto_83893 ) ( ON ?auto_83895 ?auto_83894 ) ( ON ?auto_83896 ?auto_83895 ) ( not ( = ?auto_83892 ?auto_83893 ) ) ( not ( = ?auto_83892 ?auto_83894 ) ) ( not ( = ?auto_83892 ?auto_83895 ) ) ( not ( = ?auto_83892 ?auto_83896 ) ) ( not ( = ?auto_83892 ?auto_83897 ) ) ( not ( = ?auto_83893 ?auto_83894 ) ) ( not ( = ?auto_83893 ?auto_83895 ) ) ( not ( = ?auto_83893 ?auto_83896 ) ) ( not ( = ?auto_83893 ?auto_83897 ) ) ( not ( = ?auto_83894 ?auto_83895 ) ) ( not ( = ?auto_83894 ?auto_83896 ) ) ( not ( = ?auto_83894 ?auto_83897 ) ) ( not ( = ?auto_83895 ?auto_83896 ) ) ( not ( = ?auto_83895 ?auto_83897 ) ) ( not ( = ?auto_83896 ?auto_83897 ) ) )
    :subtasks
    ( ( !STACK ?auto_83897 ?auto_83896 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83898 - BLOCK
      ?auto_83899 - BLOCK
      ?auto_83900 - BLOCK
      ?auto_83901 - BLOCK
      ?auto_83902 - BLOCK
      ?auto_83903 - BLOCK
    )
    :vars
    (
      ?auto_83904 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_83902 ) ( ON-TABLE ?auto_83898 ) ( ON ?auto_83899 ?auto_83898 ) ( ON ?auto_83900 ?auto_83899 ) ( ON ?auto_83901 ?auto_83900 ) ( ON ?auto_83902 ?auto_83901 ) ( not ( = ?auto_83898 ?auto_83899 ) ) ( not ( = ?auto_83898 ?auto_83900 ) ) ( not ( = ?auto_83898 ?auto_83901 ) ) ( not ( = ?auto_83898 ?auto_83902 ) ) ( not ( = ?auto_83898 ?auto_83903 ) ) ( not ( = ?auto_83899 ?auto_83900 ) ) ( not ( = ?auto_83899 ?auto_83901 ) ) ( not ( = ?auto_83899 ?auto_83902 ) ) ( not ( = ?auto_83899 ?auto_83903 ) ) ( not ( = ?auto_83900 ?auto_83901 ) ) ( not ( = ?auto_83900 ?auto_83902 ) ) ( not ( = ?auto_83900 ?auto_83903 ) ) ( not ( = ?auto_83901 ?auto_83902 ) ) ( not ( = ?auto_83901 ?auto_83903 ) ) ( not ( = ?auto_83902 ?auto_83903 ) ) ( ON ?auto_83903 ?auto_83904 ) ( CLEAR ?auto_83903 ) ( HAND-EMPTY ) ( not ( = ?auto_83898 ?auto_83904 ) ) ( not ( = ?auto_83899 ?auto_83904 ) ) ( not ( = ?auto_83900 ?auto_83904 ) ) ( not ( = ?auto_83901 ?auto_83904 ) ) ( not ( = ?auto_83902 ?auto_83904 ) ) ( not ( = ?auto_83903 ?auto_83904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83903 ?auto_83904 )
      ( MAKE-6PILE ?auto_83898 ?auto_83899 ?auto_83900 ?auto_83901 ?auto_83902 ?auto_83903 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83905 - BLOCK
      ?auto_83906 - BLOCK
      ?auto_83907 - BLOCK
      ?auto_83908 - BLOCK
      ?auto_83909 - BLOCK
      ?auto_83910 - BLOCK
    )
    :vars
    (
      ?auto_83911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83905 ) ( ON ?auto_83906 ?auto_83905 ) ( ON ?auto_83907 ?auto_83906 ) ( ON ?auto_83908 ?auto_83907 ) ( not ( = ?auto_83905 ?auto_83906 ) ) ( not ( = ?auto_83905 ?auto_83907 ) ) ( not ( = ?auto_83905 ?auto_83908 ) ) ( not ( = ?auto_83905 ?auto_83909 ) ) ( not ( = ?auto_83905 ?auto_83910 ) ) ( not ( = ?auto_83906 ?auto_83907 ) ) ( not ( = ?auto_83906 ?auto_83908 ) ) ( not ( = ?auto_83906 ?auto_83909 ) ) ( not ( = ?auto_83906 ?auto_83910 ) ) ( not ( = ?auto_83907 ?auto_83908 ) ) ( not ( = ?auto_83907 ?auto_83909 ) ) ( not ( = ?auto_83907 ?auto_83910 ) ) ( not ( = ?auto_83908 ?auto_83909 ) ) ( not ( = ?auto_83908 ?auto_83910 ) ) ( not ( = ?auto_83909 ?auto_83910 ) ) ( ON ?auto_83910 ?auto_83911 ) ( CLEAR ?auto_83910 ) ( not ( = ?auto_83905 ?auto_83911 ) ) ( not ( = ?auto_83906 ?auto_83911 ) ) ( not ( = ?auto_83907 ?auto_83911 ) ) ( not ( = ?auto_83908 ?auto_83911 ) ) ( not ( = ?auto_83909 ?auto_83911 ) ) ( not ( = ?auto_83910 ?auto_83911 ) ) ( HOLDING ?auto_83909 ) ( CLEAR ?auto_83908 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83905 ?auto_83906 ?auto_83907 ?auto_83908 ?auto_83909 )
      ( MAKE-6PILE ?auto_83905 ?auto_83906 ?auto_83907 ?auto_83908 ?auto_83909 ?auto_83910 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83912 - BLOCK
      ?auto_83913 - BLOCK
      ?auto_83914 - BLOCK
      ?auto_83915 - BLOCK
      ?auto_83916 - BLOCK
      ?auto_83917 - BLOCK
    )
    :vars
    (
      ?auto_83918 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83912 ) ( ON ?auto_83913 ?auto_83912 ) ( ON ?auto_83914 ?auto_83913 ) ( ON ?auto_83915 ?auto_83914 ) ( not ( = ?auto_83912 ?auto_83913 ) ) ( not ( = ?auto_83912 ?auto_83914 ) ) ( not ( = ?auto_83912 ?auto_83915 ) ) ( not ( = ?auto_83912 ?auto_83916 ) ) ( not ( = ?auto_83912 ?auto_83917 ) ) ( not ( = ?auto_83913 ?auto_83914 ) ) ( not ( = ?auto_83913 ?auto_83915 ) ) ( not ( = ?auto_83913 ?auto_83916 ) ) ( not ( = ?auto_83913 ?auto_83917 ) ) ( not ( = ?auto_83914 ?auto_83915 ) ) ( not ( = ?auto_83914 ?auto_83916 ) ) ( not ( = ?auto_83914 ?auto_83917 ) ) ( not ( = ?auto_83915 ?auto_83916 ) ) ( not ( = ?auto_83915 ?auto_83917 ) ) ( not ( = ?auto_83916 ?auto_83917 ) ) ( ON ?auto_83917 ?auto_83918 ) ( not ( = ?auto_83912 ?auto_83918 ) ) ( not ( = ?auto_83913 ?auto_83918 ) ) ( not ( = ?auto_83914 ?auto_83918 ) ) ( not ( = ?auto_83915 ?auto_83918 ) ) ( not ( = ?auto_83916 ?auto_83918 ) ) ( not ( = ?auto_83917 ?auto_83918 ) ) ( CLEAR ?auto_83915 ) ( ON ?auto_83916 ?auto_83917 ) ( CLEAR ?auto_83916 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_83918 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83918 ?auto_83917 )
      ( MAKE-6PILE ?auto_83912 ?auto_83913 ?auto_83914 ?auto_83915 ?auto_83916 ?auto_83917 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83919 - BLOCK
      ?auto_83920 - BLOCK
      ?auto_83921 - BLOCK
      ?auto_83922 - BLOCK
      ?auto_83923 - BLOCK
      ?auto_83924 - BLOCK
    )
    :vars
    (
      ?auto_83925 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83919 ) ( ON ?auto_83920 ?auto_83919 ) ( ON ?auto_83921 ?auto_83920 ) ( not ( = ?auto_83919 ?auto_83920 ) ) ( not ( = ?auto_83919 ?auto_83921 ) ) ( not ( = ?auto_83919 ?auto_83922 ) ) ( not ( = ?auto_83919 ?auto_83923 ) ) ( not ( = ?auto_83919 ?auto_83924 ) ) ( not ( = ?auto_83920 ?auto_83921 ) ) ( not ( = ?auto_83920 ?auto_83922 ) ) ( not ( = ?auto_83920 ?auto_83923 ) ) ( not ( = ?auto_83920 ?auto_83924 ) ) ( not ( = ?auto_83921 ?auto_83922 ) ) ( not ( = ?auto_83921 ?auto_83923 ) ) ( not ( = ?auto_83921 ?auto_83924 ) ) ( not ( = ?auto_83922 ?auto_83923 ) ) ( not ( = ?auto_83922 ?auto_83924 ) ) ( not ( = ?auto_83923 ?auto_83924 ) ) ( ON ?auto_83924 ?auto_83925 ) ( not ( = ?auto_83919 ?auto_83925 ) ) ( not ( = ?auto_83920 ?auto_83925 ) ) ( not ( = ?auto_83921 ?auto_83925 ) ) ( not ( = ?auto_83922 ?auto_83925 ) ) ( not ( = ?auto_83923 ?auto_83925 ) ) ( not ( = ?auto_83924 ?auto_83925 ) ) ( ON ?auto_83923 ?auto_83924 ) ( CLEAR ?auto_83923 ) ( ON-TABLE ?auto_83925 ) ( HOLDING ?auto_83922 ) ( CLEAR ?auto_83921 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83919 ?auto_83920 ?auto_83921 ?auto_83922 )
      ( MAKE-6PILE ?auto_83919 ?auto_83920 ?auto_83921 ?auto_83922 ?auto_83923 ?auto_83924 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83926 - BLOCK
      ?auto_83927 - BLOCK
      ?auto_83928 - BLOCK
      ?auto_83929 - BLOCK
      ?auto_83930 - BLOCK
      ?auto_83931 - BLOCK
    )
    :vars
    (
      ?auto_83932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83926 ) ( ON ?auto_83927 ?auto_83926 ) ( ON ?auto_83928 ?auto_83927 ) ( not ( = ?auto_83926 ?auto_83927 ) ) ( not ( = ?auto_83926 ?auto_83928 ) ) ( not ( = ?auto_83926 ?auto_83929 ) ) ( not ( = ?auto_83926 ?auto_83930 ) ) ( not ( = ?auto_83926 ?auto_83931 ) ) ( not ( = ?auto_83927 ?auto_83928 ) ) ( not ( = ?auto_83927 ?auto_83929 ) ) ( not ( = ?auto_83927 ?auto_83930 ) ) ( not ( = ?auto_83927 ?auto_83931 ) ) ( not ( = ?auto_83928 ?auto_83929 ) ) ( not ( = ?auto_83928 ?auto_83930 ) ) ( not ( = ?auto_83928 ?auto_83931 ) ) ( not ( = ?auto_83929 ?auto_83930 ) ) ( not ( = ?auto_83929 ?auto_83931 ) ) ( not ( = ?auto_83930 ?auto_83931 ) ) ( ON ?auto_83931 ?auto_83932 ) ( not ( = ?auto_83926 ?auto_83932 ) ) ( not ( = ?auto_83927 ?auto_83932 ) ) ( not ( = ?auto_83928 ?auto_83932 ) ) ( not ( = ?auto_83929 ?auto_83932 ) ) ( not ( = ?auto_83930 ?auto_83932 ) ) ( not ( = ?auto_83931 ?auto_83932 ) ) ( ON ?auto_83930 ?auto_83931 ) ( ON-TABLE ?auto_83932 ) ( CLEAR ?auto_83928 ) ( ON ?auto_83929 ?auto_83930 ) ( CLEAR ?auto_83929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83932 ?auto_83931 ?auto_83930 )
      ( MAKE-6PILE ?auto_83926 ?auto_83927 ?auto_83928 ?auto_83929 ?auto_83930 ?auto_83931 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83933 - BLOCK
      ?auto_83934 - BLOCK
      ?auto_83935 - BLOCK
      ?auto_83936 - BLOCK
      ?auto_83937 - BLOCK
      ?auto_83938 - BLOCK
    )
    :vars
    (
      ?auto_83939 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83933 ) ( ON ?auto_83934 ?auto_83933 ) ( not ( = ?auto_83933 ?auto_83934 ) ) ( not ( = ?auto_83933 ?auto_83935 ) ) ( not ( = ?auto_83933 ?auto_83936 ) ) ( not ( = ?auto_83933 ?auto_83937 ) ) ( not ( = ?auto_83933 ?auto_83938 ) ) ( not ( = ?auto_83934 ?auto_83935 ) ) ( not ( = ?auto_83934 ?auto_83936 ) ) ( not ( = ?auto_83934 ?auto_83937 ) ) ( not ( = ?auto_83934 ?auto_83938 ) ) ( not ( = ?auto_83935 ?auto_83936 ) ) ( not ( = ?auto_83935 ?auto_83937 ) ) ( not ( = ?auto_83935 ?auto_83938 ) ) ( not ( = ?auto_83936 ?auto_83937 ) ) ( not ( = ?auto_83936 ?auto_83938 ) ) ( not ( = ?auto_83937 ?auto_83938 ) ) ( ON ?auto_83938 ?auto_83939 ) ( not ( = ?auto_83933 ?auto_83939 ) ) ( not ( = ?auto_83934 ?auto_83939 ) ) ( not ( = ?auto_83935 ?auto_83939 ) ) ( not ( = ?auto_83936 ?auto_83939 ) ) ( not ( = ?auto_83937 ?auto_83939 ) ) ( not ( = ?auto_83938 ?auto_83939 ) ) ( ON ?auto_83937 ?auto_83938 ) ( ON-TABLE ?auto_83939 ) ( ON ?auto_83936 ?auto_83937 ) ( CLEAR ?auto_83936 ) ( HOLDING ?auto_83935 ) ( CLEAR ?auto_83934 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_83933 ?auto_83934 ?auto_83935 )
      ( MAKE-6PILE ?auto_83933 ?auto_83934 ?auto_83935 ?auto_83936 ?auto_83937 ?auto_83938 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83940 - BLOCK
      ?auto_83941 - BLOCK
      ?auto_83942 - BLOCK
      ?auto_83943 - BLOCK
      ?auto_83944 - BLOCK
      ?auto_83945 - BLOCK
    )
    :vars
    (
      ?auto_83946 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83940 ) ( ON ?auto_83941 ?auto_83940 ) ( not ( = ?auto_83940 ?auto_83941 ) ) ( not ( = ?auto_83940 ?auto_83942 ) ) ( not ( = ?auto_83940 ?auto_83943 ) ) ( not ( = ?auto_83940 ?auto_83944 ) ) ( not ( = ?auto_83940 ?auto_83945 ) ) ( not ( = ?auto_83941 ?auto_83942 ) ) ( not ( = ?auto_83941 ?auto_83943 ) ) ( not ( = ?auto_83941 ?auto_83944 ) ) ( not ( = ?auto_83941 ?auto_83945 ) ) ( not ( = ?auto_83942 ?auto_83943 ) ) ( not ( = ?auto_83942 ?auto_83944 ) ) ( not ( = ?auto_83942 ?auto_83945 ) ) ( not ( = ?auto_83943 ?auto_83944 ) ) ( not ( = ?auto_83943 ?auto_83945 ) ) ( not ( = ?auto_83944 ?auto_83945 ) ) ( ON ?auto_83945 ?auto_83946 ) ( not ( = ?auto_83940 ?auto_83946 ) ) ( not ( = ?auto_83941 ?auto_83946 ) ) ( not ( = ?auto_83942 ?auto_83946 ) ) ( not ( = ?auto_83943 ?auto_83946 ) ) ( not ( = ?auto_83944 ?auto_83946 ) ) ( not ( = ?auto_83945 ?auto_83946 ) ) ( ON ?auto_83944 ?auto_83945 ) ( ON-TABLE ?auto_83946 ) ( ON ?auto_83943 ?auto_83944 ) ( CLEAR ?auto_83941 ) ( ON ?auto_83942 ?auto_83943 ) ( CLEAR ?auto_83942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_83946 ?auto_83945 ?auto_83944 ?auto_83943 )
      ( MAKE-6PILE ?auto_83940 ?auto_83941 ?auto_83942 ?auto_83943 ?auto_83944 ?auto_83945 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83947 - BLOCK
      ?auto_83948 - BLOCK
      ?auto_83949 - BLOCK
      ?auto_83950 - BLOCK
      ?auto_83951 - BLOCK
      ?auto_83952 - BLOCK
    )
    :vars
    (
      ?auto_83953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83947 ) ( not ( = ?auto_83947 ?auto_83948 ) ) ( not ( = ?auto_83947 ?auto_83949 ) ) ( not ( = ?auto_83947 ?auto_83950 ) ) ( not ( = ?auto_83947 ?auto_83951 ) ) ( not ( = ?auto_83947 ?auto_83952 ) ) ( not ( = ?auto_83948 ?auto_83949 ) ) ( not ( = ?auto_83948 ?auto_83950 ) ) ( not ( = ?auto_83948 ?auto_83951 ) ) ( not ( = ?auto_83948 ?auto_83952 ) ) ( not ( = ?auto_83949 ?auto_83950 ) ) ( not ( = ?auto_83949 ?auto_83951 ) ) ( not ( = ?auto_83949 ?auto_83952 ) ) ( not ( = ?auto_83950 ?auto_83951 ) ) ( not ( = ?auto_83950 ?auto_83952 ) ) ( not ( = ?auto_83951 ?auto_83952 ) ) ( ON ?auto_83952 ?auto_83953 ) ( not ( = ?auto_83947 ?auto_83953 ) ) ( not ( = ?auto_83948 ?auto_83953 ) ) ( not ( = ?auto_83949 ?auto_83953 ) ) ( not ( = ?auto_83950 ?auto_83953 ) ) ( not ( = ?auto_83951 ?auto_83953 ) ) ( not ( = ?auto_83952 ?auto_83953 ) ) ( ON ?auto_83951 ?auto_83952 ) ( ON-TABLE ?auto_83953 ) ( ON ?auto_83950 ?auto_83951 ) ( ON ?auto_83949 ?auto_83950 ) ( CLEAR ?auto_83949 ) ( HOLDING ?auto_83948 ) ( CLEAR ?auto_83947 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_83947 ?auto_83948 )
      ( MAKE-6PILE ?auto_83947 ?auto_83948 ?auto_83949 ?auto_83950 ?auto_83951 ?auto_83952 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83954 - BLOCK
      ?auto_83955 - BLOCK
      ?auto_83956 - BLOCK
      ?auto_83957 - BLOCK
      ?auto_83958 - BLOCK
      ?auto_83959 - BLOCK
    )
    :vars
    (
      ?auto_83960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_83954 ) ( not ( = ?auto_83954 ?auto_83955 ) ) ( not ( = ?auto_83954 ?auto_83956 ) ) ( not ( = ?auto_83954 ?auto_83957 ) ) ( not ( = ?auto_83954 ?auto_83958 ) ) ( not ( = ?auto_83954 ?auto_83959 ) ) ( not ( = ?auto_83955 ?auto_83956 ) ) ( not ( = ?auto_83955 ?auto_83957 ) ) ( not ( = ?auto_83955 ?auto_83958 ) ) ( not ( = ?auto_83955 ?auto_83959 ) ) ( not ( = ?auto_83956 ?auto_83957 ) ) ( not ( = ?auto_83956 ?auto_83958 ) ) ( not ( = ?auto_83956 ?auto_83959 ) ) ( not ( = ?auto_83957 ?auto_83958 ) ) ( not ( = ?auto_83957 ?auto_83959 ) ) ( not ( = ?auto_83958 ?auto_83959 ) ) ( ON ?auto_83959 ?auto_83960 ) ( not ( = ?auto_83954 ?auto_83960 ) ) ( not ( = ?auto_83955 ?auto_83960 ) ) ( not ( = ?auto_83956 ?auto_83960 ) ) ( not ( = ?auto_83957 ?auto_83960 ) ) ( not ( = ?auto_83958 ?auto_83960 ) ) ( not ( = ?auto_83959 ?auto_83960 ) ) ( ON ?auto_83958 ?auto_83959 ) ( ON-TABLE ?auto_83960 ) ( ON ?auto_83957 ?auto_83958 ) ( ON ?auto_83956 ?auto_83957 ) ( CLEAR ?auto_83954 ) ( ON ?auto_83955 ?auto_83956 ) ( CLEAR ?auto_83955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_83960 ?auto_83959 ?auto_83958 ?auto_83957 ?auto_83956 )
      ( MAKE-6PILE ?auto_83954 ?auto_83955 ?auto_83956 ?auto_83957 ?auto_83958 ?auto_83959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83961 - BLOCK
      ?auto_83962 - BLOCK
      ?auto_83963 - BLOCK
      ?auto_83964 - BLOCK
      ?auto_83965 - BLOCK
      ?auto_83966 - BLOCK
    )
    :vars
    (
      ?auto_83967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83961 ?auto_83962 ) ) ( not ( = ?auto_83961 ?auto_83963 ) ) ( not ( = ?auto_83961 ?auto_83964 ) ) ( not ( = ?auto_83961 ?auto_83965 ) ) ( not ( = ?auto_83961 ?auto_83966 ) ) ( not ( = ?auto_83962 ?auto_83963 ) ) ( not ( = ?auto_83962 ?auto_83964 ) ) ( not ( = ?auto_83962 ?auto_83965 ) ) ( not ( = ?auto_83962 ?auto_83966 ) ) ( not ( = ?auto_83963 ?auto_83964 ) ) ( not ( = ?auto_83963 ?auto_83965 ) ) ( not ( = ?auto_83963 ?auto_83966 ) ) ( not ( = ?auto_83964 ?auto_83965 ) ) ( not ( = ?auto_83964 ?auto_83966 ) ) ( not ( = ?auto_83965 ?auto_83966 ) ) ( ON ?auto_83966 ?auto_83967 ) ( not ( = ?auto_83961 ?auto_83967 ) ) ( not ( = ?auto_83962 ?auto_83967 ) ) ( not ( = ?auto_83963 ?auto_83967 ) ) ( not ( = ?auto_83964 ?auto_83967 ) ) ( not ( = ?auto_83965 ?auto_83967 ) ) ( not ( = ?auto_83966 ?auto_83967 ) ) ( ON ?auto_83965 ?auto_83966 ) ( ON-TABLE ?auto_83967 ) ( ON ?auto_83964 ?auto_83965 ) ( ON ?auto_83963 ?auto_83964 ) ( ON ?auto_83962 ?auto_83963 ) ( CLEAR ?auto_83962 ) ( HOLDING ?auto_83961 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_83961 )
      ( MAKE-6PILE ?auto_83961 ?auto_83962 ?auto_83963 ?auto_83964 ?auto_83965 ?auto_83966 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83968 - BLOCK
      ?auto_83969 - BLOCK
      ?auto_83970 - BLOCK
      ?auto_83971 - BLOCK
      ?auto_83972 - BLOCK
      ?auto_83973 - BLOCK
    )
    :vars
    (
      ?auto_83974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83968 ?auto_83969 ) ) ( not ( = ?auto_83968 ?auto_83970 ) ) ( not ( = ?auto_83968 ?auto_83971 ) ) ( not ( = ?auto_83968 ?auto_83972 ) ) ( not ( = ?auto_83968 ?auto_83973 ) ) ( not ( = ?auto_83969 ?auto_83970 ) ) ( not ( = ?auto_83969 ?auto_83971 ) ) ( not ( = ?auto_83969 ?auto_83972 ) ) ( not ( = ?auto_83969 ?auto_83973 ) ) ( not ( = ?auto_83970 ?auto_83971 ) ) ( not ( = ?auto_83970 ?auto_83972 ) ) ( not ( = ?auto_83970 ?auto_83973 ) ) ( not ( = ?auto_83971 ?auto_83972 ) ) ( not ( = ?auto_83971 ?auto_83973 ) ) ( not ( = ?auto_83972 ?auto_83973 ) ) ( ON ?auto_83973 ?auto_83974 ) ( not ( = ?auto_83968 ?auto_83974 ) ) ( not ( = ?auto_83969 ?auto_83974 ) ) ( not ( = ?auto_83970 ?auto_83974 ) ) ( not ( = ?auto_83971 ?auto_83974 ) ) ( not ( = ?auto_83972 ?auto_83974 ) ) ( not ( = ?auto_83973 ?auto_83974 ) ) ( ON ?auto_83972 ?auto_83973 ) ( ON-TABLE ?auto_83974 ) ( ON ?auto_83971 ?auto_83972 ) ( ON ?auto_83970 ?auto_83971 ) ( ON ?auto_83969 ?auto_83970 ) ( ON ?auto_83968 ?auto_83969 ) ( CLEAR ?auto_83968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83974 ?auto_83973 ?auto_83972 ?auto_83971 ?auto_83970 ?auto_83969 )
      ( MAKE-6PILE ?auto_83968 ?auto_83969 ?auto_83970 ?auto_83971 ?auto_83972 ?auto_83973 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83975 - BLOCK
      ?auto_83976 - BLOCK
      ?auto_83977 - BLOCK
      ?auto_83978 - BLOCK
      ?auto_83979 - BLOCK
      ?auto_83980 - BLOCK
    )
    :vars
    (
      ?auto_83981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83975 ?auto_83976 ) ) ( not ( = ?auto_83975 ?auto_83977 ) ) ( not ( = ?auto_83975 ?auto_83978 ) ) ( not ( = ?auto_83975 ?auto_83979 ) ) ( not ( = ?auto_83975 ?auto_83980 ) ) ( not ( = ?auto_83976 ?auto_83977 ) ) ( not ( = ?auto_83976 ?auto_83978 ) ) ( not ( = ?auto_83976 ?auto_83979 ) ) ( not ( = ?auto_83976 ?auto_83980 ) ) ( not ( = ?auto_83977 ?auto_83978 ) ) ( not ( = ?auto_83977 ?auto_83979 ) ) ( not ( = ?auto_83977 ?auto_83980 ) ) ( not ( = ?auto_83978 ?auto_83979 ) ) ( not ( = ?auto_83978 ?auto_83980 ) ) ( not ( = ?auto_83979 ?auto_83980 ) ) ( ON ?auto_83980 ?auto_83981 ) ( not ( = ?auto_83975 ?auto_83981 ) ) ( not ( = ?auto_83976 ?auto_83981 ) ) ( not ( = ?auto_83977 ?auto_83981 ) ) ( not ( = ?auto_83978 ?auto_83981 ) ) ( not ( = ?auto_83979 ?auto_83981 ) ) ( not ( = ?auto_83980 ?auto_83981 ) ) ( ON ?auto_83979 ?auto_83980 ) ( ON-TABLE ?auto_83981 ) ( ON ?auto_83978 ?auto_83979 ) ( ON ?auto_83977 ?auto_83978 ) ( ON ?auto_83976 ?auto_83977 ) ( HOLDING ?auto_83975 ) ( CLEAR ?auto_83976 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_83981 ?auto_83980 ?auto_83979 ?auto_83978 ?auto_83977 ?auto_83976 ?auto_83975 )
      ( MAKE-6PILE ?auto_83975 ?auto_83976 ?auto_83977 ?auto_83978 ?auto_83979 ?auto_83980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83982 - BLOCK
      ?auto_83983 - BLOCK
      ?auto_83984 - BLOCK
      ?auto_83985 - BLOCK
      ?auto_83986 - BLOCK
      ?auto_83987 - BLOCK
    )
    :vars
    (
      ?auto_83988 - BLOCK
      ?auto_83989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83982 ?auto_83983 ) ) ( not ( = ?auto_83982 ?auto_83984 ) ) ( not ( = ?auto_83982 ?auto_83985 ) ) ( not ( = ?auto_83982 ?auto_83986 ) ) ( not ( = ?auto_83982 ?auto_83987 ) ) ( not ( = ?auto_83983 ?auto_83984 ) ) ( not ( = ?auto_83983 ?auto_83985 ) ) ( not ( = ?auto_83983 ?auto_83986 ) ) ( not ( = ?auto_83983 ?auto_83987 ) ) ( not ( = ?auto_83984 ?auto_83985 ) ) ( not ( = ?auto_83984 ?auto_83986 ) ) ( not ( = ?auto_83984 ?auto_83987 ) ) ( not ( = ?auto_83985 ?auto_83986 ) ) ( not ( = ?auto_83985 ?auto_83987 ) ) ( not ( = ?auto_83986 ?auto_83987 ) ) ( ON ?auto_83987 ?auto_83988 ) ( not ( = ?auto_83982 ?auto_83988 ) ) ( not ( = ?auto_83983 ?auto_83988 ) ) ( not ( = ?auto_83984 ?auto_83988 ) ) ( not ( = ?auto_83985 ?auto_83988 ) ) ( not ( = ?auto_83986 ?auto_83988 ) ) ( not ( = ?auto_83987 ?auto_83988 ) ) ( ON ?auto_83986 ?auto_83987 ) ( ON-TABLE ?auto_83988 ) ( ON ?auto_83985 ?auto_83986 ) ( ON ?auto_83984 ?auto_83985 ) ( ON ?auto_83983 ?auto_83984 ) ( CLEAR ?auto_83983 ) ( ON ?auto_83982 ?auto_83989 ) ( CLEAR ?auto_83982 ) ( HAND-EMPTY ) ( not ( = ?auto_83982 ?auto_83989 ) ) ( not ( = ?auto_83983 ?auto_83989 ) ) ( not ( = ?auto_83984 ?auto_83989 ) ) ( not ( = ?auto_83985 ?auto_83989 ) ) ( not ( = ?auto_83986 ?auto_83989 ) ) ( not ( = ?auto_83987 ?auto_83989 ) ) ( not ( = ?auto_83988 ?auto_83989 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_83982 ?auto_83989 )
      ( MAKE-6PILE ?auto_83982 ?auto_83983 ?auto_83984 ?auto_83985 ?auto_83986 ?auto_83987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83990 - BLOCK
      ?auto_83991 - BLOCK
      ?auto_83992 - BLOCK
      ?auto_83993 - BLOCK
      ?auto_83994 - BLOCK
      ?auto_83995 - BLOCK
    )
    :vars
    (
      ?auto_83997 - BLOCK
      ?auto_83996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83990 ?auto_83991 ) ) ( not ( = ?auto_83990 ?auto_83992 ) ) ( not ( = ?auto_83990 ?auto_83993 ) ) ( not ( = ?auto_83990 ?auto_83994 ) ) ( not ( = ?auto_83990 ?auto_83995 ) ) ( not ( = ?auto_83991 ?auto_83992 ) ) ( not ( = ?auto_83991 ?auto_83993 ) ) ( not ( = ?auto_83991 ?auto_83994 ) ) ( not ( = ?auto_83991 ?auto_83995 ) ) ( not ( = ?auto_83992 ?auto_83993 ) ) ( not ( = ?auto_83992 ?auto_83994 ) ) ( not ( = ?auto_83992 ?auto_83995 ) ) ( not ( = ?auto_83993 ?auto_83994 ) ) ( not ( = ?auto_83993 ?auto_83995 ) ) ( not ( = ?auto_83994 ?auto_83995 ) ) ( ON ?auto_83995 ?auto_83997 ) ( not ( = ?auto_83990 ?auto_83997 ) ) ( not ( = ?auto_83991 ?auto_83997 ) ) ( not ( = ?auto_83992 ?auto_83997 ) ) ( not ( = ?auto_83993 ?auto_83997 ) ) ( not ( = ?auto_83994 ?auto_83997 ) ) ( not ( = ?auto_83995 ?auto_83997 ) ) ( ON ?auto_83994 ?auto_83995 ) ( ON-TABLE ?auto_83997 ) ( ON ?auto_83993 ?auto_83994 ) ( ON ?auto_83992 ?auto_83993 ) ( ON ?auto_83990 ?auto_83996 ) ( CLEAR ?auto_83990 ) ( not ( = ?auto_83990 ?auto_83996 ) ) ( not ( = ?auto_83991 ?auto_83996 ) ) ( not ( = ?auto_83992 ?auto_83996 ) ) ( not ( = ?auto_83993 ?auto_83996 ) ) ( not ( = ?auto_83994 ?auto_83996 ) ) ( not ( = ?auto_83995 ?auto_83996 ) ) ( not ( = ?auto_83997 ?auto_83996 ) ) ( HOLDING ?auto_83991 ) ( CLEAR ?auto_83992 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_83997 ?auto_83995 ?auto_83994 ?auto_83993 ?auto_83992 ?auto_83991 )
      ( MAKE-6PILE ?auto_83990 ?auto_83991 ?auto_83992 ?auto_83993 ?auto_83994 ?auto_83995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_83998 - BLOCK
      ?auto_83999 - BLOCK
      ?auto_84000 - BLOCK
      ?auto_84001 - BLOCK
      ?auto_84002 - BLOCK
      ?auto_84003 - BLOCK
    )
    :vars
    (
      ?auto_84004 - BLOCK
      ?auto_84005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_83998 ?auto_83999 ) ) ( not ( = ?auto_83998 ?auto_84000 ) ) ( not ( = ?auto_83998 ?auto_84001 ) ) ( not ( = ?auto_83998 ?auto_84002 ) ) ( not ( = ?auto_83998 ?auto_84003 ) ) ( not ( = ?auto_83999 ?auto_84000 ) ) ( not ( = ?auto_83999 ?auto_84001 ) ) ( not ( = ?auto_83999 ?auto_84002 ) ) ( not ( = ?auto_83999 ?auto_84003 ) ) ( not ( = ?auto_84000 ?auto_84001 ) ) ( not ( = ?auto_84000 ?auto_84002 ) ) ( not ( = ?auto_84000 ?auto_84003 ) ) ( not ( = ?auto_84001 ?auto_84002 ) ) ( not ( = ?auto_84001 ?auto_84003 ) ) ( not ( = ?auto_84002 ?auto_84003 ) ) ( ON ?auto_84003 ?auto_84004 ) ( not ( = ?auto_83998 ?auto_84004 ) ) ( not ( = ?auto_83999 ?auto_84004 ) ) ( not ( = ?auto_84000 ?auto_84004 ) ) ( not ( = ?auto_84001 ?auto_84004 ) ) ( not ( = ?auto_84002 ?auto_84004 ) ) ( not ( = ?auto_84003 ?auto_84004 ) ) ( ON ?auto_84002 ?auto_84003 ) ( ON-TABLE ?auto_84004 ) ( ON ?auto_84001 ?auto_84002 ) ( ON ?auto_84000 ?auto_84001 ) ( ON ?auto_83998 ?auto_84005 ) ( not ( = ?auto_83998 ?auto_84005 ) ) ( not ( = ?auto_83999 ?auto_84005 ) ) ( not ( = ?auto_84000 ?auto_84005 ) ) ( not ( = ?auto_84001 ?auto_84005 ) ) ( not ( = ?auto_84002 ?auto_84005 ) ) ( not ( = ?auto_84003 ?auto_84005 ) ) ( not ( = ?auto_84004 ?auto_84005 ) ) ( CLEAR ?auto_84000 ) ( ON ?auto_83999 ?auto_83998 ) ( CLEAR ?auto_83999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84005 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84005 ?auto_83998 )
      ( MAKE-6PILE ?auto_83998 ?auto_83999 ?auto_84000 ?auto_84001 ?auto_84002 ?auto_84003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84006 - BLOCK
      ?auto_84007 - BLOCK
      ?auto_84008 - BLOCK
      ?auto_84009 - BLOCK
      ?auto_84010 - BLOCK
      ?auto_84011 - BLOCK
    )
    :vars
    (
      ?auto_84012 - BLOCK
      ?auto_84013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84006 ?auto_84007 ) ) ( not ( = ?auto_84006 ?auto_84008 ) ) ( not ( = ?auto_84006 ?auto_84009 ) ) ( not ( = ?auto_84006 ?auto_84010 ) ) ( not ( = ?auto_84006 ?auto_84011 ) ) ( not ( = ?auto_84007 ?auto_84008 ) ) ( not ( = ?auto_84007 ?auto_84009 ) ) ( not ( = ?auto_84007 ?auto_84010 ) ) ( not ( = ?auto_84007 ?auto_84011 ) ) ( not ( = ?auto_84008 ?auto_84009 ) ) ( not ( = ?auto_84008 ?auto_84010 ) ) ( not ( = ?auto_84008 ?auto_84011 ) ) ( not ( = ?auto_84009 ?auto_84010 ) ) ( not ( = ?auto_84009 ?auto_84011 ) ) ( not ( = ?auto_84010 ?auto_84011 ) ) ( ON ?auto_84011 ?auto_84012 ) ( not ( = ?auto_84006 ?auto_84012 ) ) ( not ( = ?auto_84007 ?auto_84012 ) ) ( not ( = ?auto_84008 ?auto_84012 ) ) ( not ( = ?auto_84009 ?auto_84012 ) ) ( not ( = ?auto_84010 ?auto_84012 ) ) ( not ( = ?auto_84011 ?auto_84012 ) ) ( ON ?auto_84010 ?auto_84011 ) ( ON-TABLE ?auto_84012 ) ( ON ?auto_84009 ?auto_84010 ) ( ON ?auto_84006 ?auto_84013 ) ( not ( = ?auto_84006 ?auto_84013 ) ) ( not ( = ?auto_84007 ?auto_84013 ) ) ( not ( = ?auto_84008 ?auto_84013 ) ) ( not ( = ?auto_84009 ?auto_84013 ) ) ( not ( = ?auto_84010 ?auto_84013 ) ) ( not ( = ?auto_84011 ?auto_84013 ) ) ( not ( = ?auto_84012 ?auto_84013 ) ) ( ON ?auto_84007 ?auto_84006 ) ( CLEAR ?auto_84007 ) ( ON-TABLE ?auto_84013 ) ( HOLDING ?auto_84008 ) ( CLEAR ?auto_84009 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84012 ?auto_84011 ?auto_84010 ?auto_84009 ?auto_84008 )
      ( MAKE-6PILE ?auto_84006 ?auto_84007 ?auto_84008 ?auto_84009 ?auto_84010 ?auto_84011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84014 - BLOCK
      ?auto_84015 - BLOCK
      ?auto_84016 - BLOCK
      ?auto_84017 - BLOCK
      ?auto_84018 - BLOCK
      ?auto_84019 - BLOCK
    )
    :vars
    (
      ?auto_84020 - BLOCK
      ?auto_84021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84014 ?auto_84015 ) ) ( not ( = ?auto_84014 ?auto_84016 ) ) ( not ( = ?auto_84014 ?auto_84017 ) ) ( not ( = ?auto_84014 ?auto_84018 ) ) ( not ( = ?auto_84014 ?auto_84019 ) ) ( not ( = ?auto_84015 ?auto_84016 ) ) ( not ( = ?auto_84015 ?auto_84017 ) ) ( not ( = ?auto_84015 ?auto_84018 ) ) ( not ( = ?auto_84015 ?auto_84019 ) ) ( not ( = ?auto_84016 ?auto_84017 ) ) ( not ( = ?auto_84016 ?auto_84018 ) ) ( not ( = ?auto_84016 ?auto_84019 ) ) ( not ( = ?auto_84017 ?auto_84018 ) ) ( not ( = ?auto_84017 ?auto_84019 ) ) ( not ( = ?auto_84018 ?auto_84019 ) ) ( ON ?auto_84019 ?auto_84020 ) ( not ( = ?auto_84014 ?auto_84020 ) ) ( not ( = ?auto_84015 ?auto_84020 ) ) ( not ( = ?auto_84016 ?auto_84020 ) ) ( not ( = ?auto_84017 ?auto_84020 ) ) ( not ( = ?auto_84018 ?auto_84020 ) ) ( not ( = ?auto_84019 ?auto_84020 ) ) ( ON ?auto_84018 ?auto_84019 ) ( ON-TABLE ?auto_84020 ) ( ON ?auto_84017 ?auto_84018 ) ( ON ?auto_84014 ?auto_84021 ) ( not ( = ?auto_84014 ?auto_84021 ) ) ( not ( = ?auto_84015 ?auto_84021 ) ) ( not ( = ?auto_84016 ?auto_84021 ) ) ( not ( = ?auto_84017 ?auto_84021 ) ) ( not ( = ?auto_84018 ?auto_84021 ) ) ( not ( = ?auto_84019 ?auto_84021 ) ) ( not ( = ?auto_84020 ?auto_84021 ) ) ( ON ?auto_84015 ?auto_84014 ) ( ON-TABLE ?auto_84021 ) ( CLEAR ?auto_84017 ) ( ON ?auto_84016 ?auto_84015 ) ( CLEAR ?auto_84016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84021 ?auto_84014 ?auto_84015 )
      ( MAKE-6PILE ?auto_84014 ?auto_84015 ?auto_84016 ?auto_84017 ?auto_84018 ?auto_84019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84022 - BLOCK
      ?auto_84023 - BLOCK
      ?auto_84024 - BLOCK
      ?auto_84025 - BLOCK
      ?auto_84026 - BLOCK
      ?auto_84027 - BLOCK
    )
    :vars
    (
      ?auto_84029 - BLOCK
      ?auto_84028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84022 ?auto_84023 ) ) ( not ( = ?auto_84022 ?auto_84024 ) ) ( not ( = ?auto_84022 ?auto_84025 ) ) ( not ( = ?auto_84022 ?auto_84026 ) ) ( not ( = ?auto_84022 ?auto_84027 ) ) ( not ( = ?auto_84023 ?auto_84024 ) ) ( not ( = ?auto_84023 ?auto_84025 ) ) ( not ( = ?auto_84023 ?auto_84026 ) ) ( not ( = ?auto_84023 ?auto_84027 ) ) ( not ( = ?auto_84024 ?auto_84025 ) ) ( not ( = ?auto_84024 ?auto_84026 ) ) ( not ( = ?auto_84024 ?auto_84027 ) ) ( not ( = ?auto_84025 ?auto_84026 ) ) ( not ( = ?auto_84025 ?auto_84027 ) ) ( not ( = ?auto_84026 ?auto_84027 ) ) ( ON ?auto_84027 ?auto_84029 ) ( not ( = ?auto_84022 ?auto_84029 ) ) ( not ( = ?auto_84023 ?auto_84029 ) ) ( not ( = ?auto_84024 ?auto_84029 ) ) ( not ( = ?auto_84025 ?auto_84029 ) ) ( not ( = ?auto_84026 ?auto_84029 ) ) ( not ( = ?auto_84027 ?auto_84029 ) ) ( ON ?auto_84026 ?auto_84027 ) ( ON-TABLE ?auto_84029 ) ( ON ?auto_84022 ?auto_84028 ) ( not ( = ?auto_84022 ?auto_84028 ) ) ( not ( = ?auto_84023 ?auto_84028 ) ) ( not ( = ?auto_84024 ?auto_84028 ) ) ( not ( = ?auto_84025 ?auto_84028 ) ) ( not ( = ?auto_84026 ?auto_84028 ) ) ( not ( = ?auto_84027 ?auto_84028 ) ) ( not ( = ?auto_84029 ?auto_84028 ) ) ( ON ?auto_84023 ?auto_84022 ) ( ON-TABLE ?auto_84028 ) ( ON ?auto_84024 ?auto_84023 ) ( CLEAR ?auto_84024 ) ( HOLDING ?auto_84025 ) ( CLEAR ?auto_84026 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84029 ?auto_84027 ?auto_84026 ?auto_84025 )
      ( MAKE-6PILE ?auto_84022 ?auto_84023 ?auto_84024 ?auto_84025 ?auto_84026 ?auto_84027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84030 - BLOCK
      ?auto_84031 - BLOCK
      ?auto_84032 - BLOCK
      ?auto_84033 - BLOCK
      ?auto_84034 - BLOCK
      ?auto_84035 - BLOCK
    )
    :vars
    (
      ?auto_84036 - BLOCK
      ?auto_84037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84030 ?auto_84031 ) ) ( not ( = ?auto_84030 ?auto_84032 ) ) ( not ( = ?auto_84030 ?auto_84033 ) ) ( not ( = ?auto_84030 ?auto_84034 ) ) ( not ( = ?auto_84030 ?auto_84035 ) ) ( not ( = ?auto_84031 ?auto_84032 ) ) ( not ( = ?auto_84031 ?auto_84033 ) ) ( not ( = ?auto_84031 ?auto_84034 ) ) ( not ( = ?auto_84031 ?auto_84035 ) ) ( not ( = ?auto_84032 ?auto_84033 ) ) ( not ( = ?auto_84032 ?auto_84034 ) ) ( not ( = ?auto_84032 ?auto_84035 ) ) ( not ( = ?auto_84033 ?auto_84034 ) ) ( not ( = ?auto_84033 ?auto_84035 ) ) ( not ( = ?auto_84034 ?auto_84035 ) ) ( ON ?auto_84035 ?auto_84036 ) ( not ( = ?auto_84030 ?auto_84036 ) ) ( not ( = ?auto_84031 ?auto_84036 ) ) ( not ( = ?auto_84032 ?auto_84036 ) ) ( not ( = ?auto_84033 ?auto_84036 ) ) ( not ( = ?auto_84034 ?auto_84036 ) ) ( not ( = ?auto_84035 ?auto_84036 ) ) ( ON ?auto_84034 ?auto_84035 ) ( ON-TABLE ?auto_84036 ) ( ON ?auto_84030 ?auto_84037 ) ( not ( = ?auto_84030 ?auto_84037 ) ) ( not ( = ?auto_84031 ?auto_84037 ) ) ( not ( = ?auto_84032 ?auto_84037 ) ) ( not ( = ?auto_84033 ?auto_84037 ) ) ( not ( = ?auto_84034 ?auto_84037 ) ) ( not ( = ?auto_84035 ?auto_84037 ) ) ( not ( = ?auto_84036 ?auto_84037 ) ) ( ON ?auto_84031 ?auto_84030 ) ( ON-TABLE ?auto_84037 ) ( ON ?auto_84032 ?auto_84031 ) ( CLEAR ?auto_84034 ) ( ON ?auto_84033 ?auto_84032 ) ( CLEAR ?auto_84033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84037 ?auto_84030 ?auto_84031 ?auto_84032 )
      ( MAKE-6PILE ?auto_84030 ?auto_84031 ?auto_84032 ?auto_84033 ?auto_84034 ?auto_84035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84038 - BLOCK
      ?auto_84039 - BLOCK
      ?auto_84040 - BLOCK
      ?auto_84041 - BLOCK
      ?auto_84042 - BLOCK
      ?auto_84043 - BLOCK
    )
    :vars
    (
      ?auto_84044 - BLOCK
      ?auto_84045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84038 ?auto_84039 ) ) ( not ( = ?auto_84038 ?auto_84040 ) ) ( not ( = ?auto_84038 ?auto_84041 ) ) ( not ( = ?auto_84038 ?auto_84042 ) ) ( not ( = ?auto_84038 ?auto_84043 ) ) ( not ( = ?auto_84039 ?auto_84040 ) ) ( not ( = ?auto_84039 ?auto_84041 ) ) ( not ( = ?auto_84039 ?auto_84042 ) ) ( not ( = ?auto_84039 ?auto_84043 ) ) ( not ( = ?auto_84040 ?auto_84041 ) ) ( not ( = ?auto_84040 ?auto_84042 ) ) ( not ( = ?auto_84040 ?auto_84043 ) ) ( not ( = ?auto_84041 ?auto_84042 ) ) ( not ( = ?auto_84041 ?auto_84043 ) ) ( not ( = ?auto_84042 ?auto_84043 ) ) ( ON ?auto_84043 ?auto_84044 ) ( not ( = ?auto_84038 ?auto_84044 ) ) ( not ( = ?auto_84039 ?auto_84044 ) ) ( not ( = ?auto_84040 ?auto_84044 ) ) ( not ( = ?auto_84041 ?auto_84044 ) ) ( not ( = ?auto_84042 ?auto_84044 ) ) ( not ( = ?auto_84043 ?auto_84044 ) ) ( ON-TABLE ?auto_84044 ) ( ON ?auto_84038 ?auto_84045 ) ( not ( = ?auto_84038 ?auto_84045 ) ) ( not ( = ?auto_84039 ?auto_84045 ) ) ( not ( = ?auto_84040 ?auto_84045 ) ) ( not ( = ?auto_84041 ?auto_84045 ) ) ( not ( = ?auto_84042 ?auto_84045 ) ) ( not ( = ?auto_84043 ?auto_84045 ) ) ( not ( = ?auto_84044 ?auto_84045 ) ) ( ON ?auto_84039 ?auto_84038 ) ( ON-TABLE ?auto_84045 ) ( ON ?auto_84040 ?auto_84039 ) ( ON ?auto_84041 ?auto_84040 ) ( CLEAR ?auto_84041 ) ( HOLDING ?auto_84042 ) ( CLEAR ?auto_84043 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84044 ?auto_84043 ?auto_84042 )
      ( MAKE-6PILE ?auto_84038 ?auto_84039 ?auto_84040 ?auto_84041 ?auto_84042 ?auto_84043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84046 - BLOCK
      ?auto_84047 - BLOCK
      ?auto_84048 - BLOCK
      ?auto_84049 - BLOCK
      ?auto_84050 - BLOCK
      ?auto_84051 - BLOCK
    )
    :vars
    (
      ?auto_84052 - BLOCK
      ?auto_84053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84046 ?auto_84047 ) ) ( not ( = ?auto_84046 ?auto_84048 ) ) ( not ( = ?auto_84046 ?auto_84049 ) ) ( not ( = ?auto_84046 ?auto_84050 ) ) ( not ( = ?auto_84046 ?auto_84051 ) ) ( not ( = ?auto_84047 ?auto_84048 ) ) ( not ( = ?auto_84047 ?auto_84049 ) ) ( not ( = ?auto_84047 ?auto_84050 ) ) ( not ( = ?auto_84047 ?auto_84051 ) ) ( not ( = ?auto_84048 ?auto_84049 ) ) ( not ( = ?auto_84048 ?auto_84050 ) ) ( not ( = ?auto_84048 ?auto_84051 ) ) ( not ( = ?auto_84049 ?auto_84050 ) ) ( not ( = ?auto_84049 ?auto_84051 ) ) ( not ( = ?auto_84050 ?auto_84051 ) ) ( ON ?auto_84051 ?auto_84052 ) ( not ( = ?auto_84046 ?auto_84052 ) ) ( not ( = ?auto_84047 ?auto_84052 ) ) ( not ( = ?auto_84048 ?auto_84052 ) ) ( not ( = ?auto_84049 ?auto_84052 ) ) ( not ( = ?auto_84050 ?auto_84052 ) ) ( not ( = ?auto_84051 ?auto_84052 ) ) ( ON-TABLE ?auto_84052 ) ( ON ?auto_84046 ?auto_84053 ) ( not ( = ?auto_84046 ?auto_84053 ) ) ( not ( = ?auto_84047 ?auto_84053 ) ) ( not ( = ?auto_84048 ?auto_84053 ) ) ( not ( = ?auto_84049 ?auto_84053 ) ) ( not ( = ?auto_84050 ?auto_84053 ) ) ( not ( = ?auto_84051 ?auto_84053 ) ) ( not ( = ?auto_84052 ?auto_84053 ) ) ( ON ?auto_84047 ?auto_84046 ) ( ON-TABLE ?auto_84053 ) ( ON ?auto_84048 ?auto_84047 ) ( ON ?auto_84049 ?auto_84048 ) ( CLEAR ?auto_84051 ) ( ON ?auto_84050 ?auto_84049 ) ( CLEAR ?auto_84050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84053 ?auto_84046 ?auto_84047 ?auto_84048 ?auto_84049 )
      ( MAKE-6PILE ?auto_84046 ?auto_84047 ?auto_84048 ?auto_84049 ?auto_84050 ?auto_84051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84054 - BLOCK
      ?auto_84055 - BLOCK
      ?auto_84056 - BLOCK
      ?auto_84057 - BLOCK
      ?auto_84058 - BLOCK
      ?auto_84059 - BLOCK
    )
    :vars
    (
      ?auto_84060 - BLOCK
      ?auto_84061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84054 ?auto_84055 ) ) ( not ( = ?auto_84054 ?auto_84056 ) ) ( not ( = ?auto_84054 ?auto_84057 ) ) ( not ( = ?auto_84054 ?auto_84058 ) ) ( not ( = ?auto_84054 ?auto_84059 ) ) ( not ( = ?auto_84055 ?auto_84056 ) ) ( not ( = ?auto_84055 ?auto_84057 ) ) ( not ( = ?auto_84055 ?auto_84058 ) ) ( not ( = ?auto_84055 ?auto_84059 ) ) ( not ( = ?auto_84056 ?auto_84057 ) ) ( not ( = ?auto_84056 ?auto_84058 ) ) ( not ( = ?auto_84056 ?auto_84059 ) ) ( not ( = ?auto_84057 ?auto_84058 ) ) ( not ( = ?auto_84057 ?auto_84059 ) ) ( not ( = ?auto_84058 ?auto_84059 ) ) ( not ( = ?auto_84054 ?auto_84060 ) ) ( not ( = ?auto_84055 ?auto_84060 ) ) ( not ( = ?auto_84056 ?auto_84060 ) ) ( not ( = ?auto_84057 ?auto_84060 ) ) ( not ( = ?auto_84058 ?auto_84060 ) ) ( not ( = ?auto_84059 ?auto_84060 ) ) ( ON-TABLE ?auto_84060 ) ( ON ?auto_84054 ?auto_84061 ) ( not ( = ?auto_84054 ?auto_84061 ) ) ( not ( = ?auto_84055 ?auto_84061 ) ) ( not ( = ?auto_84056 ?auto_84061 ) ) ( not ( = ?auto_84057 ?auto_84061 ) ) ( not ( = ?auto_84058 ?auto_84061 ) ) ( not ( = ?auto_84059 ?auto_84061 ) ) ( not ( = ?auto_84060 ?auto_84061 ) ) ( ON ?auto_84055 ?auto_84054 ) ( ON-TABLE ?auto_84061 ) ( ON ?auto_84056 ?auto_84055 ) ( ON ?auto_84057 ?auto_84056 ) ( ON ?auto_84058 ?auto_84057 ) ( CLEAR ?auto_84058 ) ( HOLDING ?auto_84059 ) ( CLEAR ?auto_84060 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84060 ?auto_84059 )
      ( MAKE-6PILE ?auto_84054 ?auto_84055 ?auto_84056 ?auto_84057 ?auto_84058 ?auto_84059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84062 - BLOCK
      ?auto_84063 - BLOCK
      ?auto_84064 - BLOCK
      ?auto_84065 - BLOCK
      ?auto_84066 - BLOCK
      ?auto_84067 - BLOCK
    )
    :vars
    (
      ?auto_84068 - BLOCK
      ?auto_84069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84062 ?auto_84063 ) ) ( not ( = ?auto_84062 ?auto_84064 ) ) ( not ( = ?auto_84062 ?auto_84065 ) ) ( not ( = ?auto_84062 ?auto_84066 ) ) ( not ( = ?auto_84062 ?auto_84067 ) ) ( not ( = ?auto_84063 ?auto_84064 ) ) ( not ( = ?auto_84063 ?auto_84065 ) ) ( not ( = ?auto_84063 ?auto_84066 ) ) ( not ( = ?auto_84063 ?auto_84067 ) ) ( not ( = ?auto_84064 ?auto_84065 ) ) ( not ( = ?auto_84064 ?auto_84066 ) ) ( not ( = ?auto_84064 ?auto_84067 ) ) ( not ( = ?auto_84065 ?auto_84066 ) ) ( not ( = ?auto_84065 ?auto_84067 ) ) ( not ( = ?auto_84066 ?auto_84067 ) ) ( not ( = ?auto_84062 ?auto_84068 ) ) ( not ( = ?auto_84063 ?auto_84068 ) ) ( not ( = ?auto_84064 ?auto_84068 ) ) ( not ( = ?auto_84065 ?auto_84068 ) ) ( not ( = ?auto_84066 ?auto_84068 ) ) ( not ( = ?auto_84067 ?auto_84068 ) ) ( ON-TABLE ?auto_84068 ) ( ON ?auto_84062 ?auto_84069 ) ( not ( = ?auto_84062 ?auto_84069 ) ) ( not ( = ?auto_84063 ?auto_84069 ) ) ( not ( = ?auto_84064 ?auto_84069 ) ) ( not ( = ?auto_84065 ?auto_84069 ) ) ( not ( = ?auto_84066 ?auto_84069 ) ) ( not ( = ?auto_84067 ?auto_84069 ) ) ( not ( = ?auto_84068 ?auto_84069 ) ) ( ON ?auto_84063 ?auto_84062 ) ( ON-TABLE ?auto_84069 ) ( ON ?auto_84064 ?auto_84063 ) ( ON ?auto_84065 ?auto_84064 ) ( ON ?auto_84066 ?auto_84065 ) ( CLEAR ?auto_84068 ) ( ON ?auto_84067 ?auto_84066 ) ( CLEAR ?auto_84067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84069 ?auto_84062 ?auto_84063 ?auto_84064 ?auto_84065 ?auto_84066 )
      ( MAKE-6PILE ?auto_84062 ?auto_84063 ?auto_84064 ?auto_84065 ?auto_84066 ?auto_84067 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84070 - BLOCK
      ?auto_84071 - BLOCK
      ?auto_84072 - BLOCK
      ?auto_84073 - BLOCK
      ?auto_84074 - BLOCK
      ?auto_84075 - BLOCK
    )
    :vars
    (
      ?auto_84076 - BLOCK
      ?auto_84077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84070 ?auto_84071 ) ) ( not ( = ?auto_84070 ?auto_84072 ) ) ( not ( = ?auto_84070 ?auto_84073 ) ) ( not ( = ?auto_84070 ?auto_84074 ) ) ( not ( = ?auto_84070 ?auto_84075 ) ) ( not ( = ?auto_84071 ?auto_84072 ) ) ( not ( = ?auto_84071 ?auto_84073 ) ) ( not ( = ?auto_84071 ?auto_84074 ) ) ( not ( = ?auto_84071 ?auto_84075 ) ) ( not ( = ?auto_84072 ?auto_84073 ) ) ( not ( = ?auto_84072 ?auto_84074 ) ) ( not ( = ?auto_84072 ?auto_84075 ) ) ( not ( = ?auto_84073 ?auto_84074 ) ) ( not ( = ?auto_84073 ?auto_84075 ) ) ( not ( = ?auto_84074 ?auto_84075 ) ) ( not ( = ?auto_84070 ?auto_84076 ) ) ( not ( = ?auto_84071 ?auto_84076 ) ) ( not ( = ?auto_84072 ?auto_84076 ) ) ( not ( = ?auto_84073 ?auto_84076 ) ) ( not ( = ?auto_84074 ?auto_84076 ) ) ( not ( = ?auto_84075 ?auto_84076 ) ) ( ON ?auto_84070 ?auto_84077 ) ( not ( = ?auto_84070 ?auto_84077 ) ) ( not ( = ?auto_84071 ?auto_84077 ) ) ( not ( = ?auto_84072 ?auto_84077 ) ) ( not ( = ?auto_84073 ?auto_84077 ) ) ( not ( = ?auto_84074 ?auto_84077 ) ) ( not ( = ?auto_84075 ?auto_84077 ) ) ( not ( = ?auto_84076 ?auto_84077 ) ) ( ON ?auto_84071 ?auto_84070 ) ( ON-TABLE ?auto_84077 ) ( ON ?auto_84072 ?auto_84071 ) ( ON ?auto_84073 ?auto_84072 ) ( ON ?auto_84074 ?auto_84073 ) ( ON ?auto_84075 ?auto_84074 ) ( CLEAR ?auto_84075 ) ( HOLDING ?auto_84076 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84076 )
      ( MAKE-6PILE ?auto_84070 ?auto_84071 ?auto_84072 ?auto_84073 ?auto_84074 ?auto_84075 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_84078 - BLOCK
      ?auto_84079 - BLOCK
      ?auto_84080 - BLOCK
      ?auto_84081 - BLOCK
      ?auto_84082 - BLOCK
      ?auto_84083 - BLOCK
    )
    :vars
    (
      ?auto_84084 - BLOCK
      ?auto_84085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84078 ?auto_84079 ) ) ( not ( = ?auto_84078 ?auto_84080 ) ) ( not ( = ?auto_84078 ?auto_84081 ) ) ( not ( = ?auto_84078 ?auto_84082 ) ) ( not ( = ?auto_84078 ?auto_84083 ) ) ( not ( = ?auto_84079 ?auto_84080 ) ) ( not ( = ?auto_84079 ?auto_84081 ) ) ( not ( = ?auto_84079 ?auto_84082 ) ) ( not ( = ?auto_84079 ?auto_84083 ) ) ( not ( = ?auto_84080 ?auto_84081 ) ) ( not ( = ?auto_84080 ?auto_84082 ) ) ( not ( = ?auto_84080 ?auto_84083 ) ) ( not ( = ?auto_84081 ?auto_84082 ) ) ( not ( = ?auto_84081 ?auto_84083 ) ) ( not ( = ?auto_84082 ?auto_84083 ) ) ( not ( = ?auto_84078 ?auto_84084 ) ) ( not ( = ?auto_84079 ?auto_84084 ) ) ( not ( = ?auto_84080 ?auto_84084 ) ) ( not ( = ?auto_84081 ?auto_84084 ) ) ( not ( = ?auto_84082 ?auto_84084 ) ) ( not ( = ?auto_84083 ?auto_84084 ) ) ( ON ?auto_84078 ?auto_84085 ) ( not ( = ?auto_84078 ?auto_84085 ) ) ( not ( = ?auto_84079 ?auto_84085 ) ) ( not ( = ?auto_84080 ?auto_84085 ) ) ( not ( = ?auto_84081 ?auto_84085 ) ) ( not ( = ?auto_84082 ?auto_84085 ) ) ( not ( = ?auto_84083 ?auto_84085 ) ) ( not ( = ?auto_84084 ?auto_84085 ) ) ( ON ?auto_84079 ?auto_84078 ) ( ON-TABLE ?auto_84085 ) ( ON ?auto_84080 ?auto_84079 ) ( ON ?auto_84081 ?auto_84080 ) ( ON ?auto_84082 ?auto_84081 ) ( ON ?auto_84083 ?auto_84082 ) ( ON ?auto_84084 ?auto_84083 ) ( CLEAR ?auto_84084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84085 ?auto_84078 ?auto_84079 ?auto_84080 ?auto_84081 ?auto_84082 ?auto_84083 )
      ( MAKE-6PILE ?auto_84078 ?auto_84079 ?auto_84080 ?auto_84081 ?auto_84082 ?auto_84083 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84093 - BLOCK
      ?auto_84094 - BLOCK
      ?auto_84095 - BLOCK
      ?auto_84096 - BLOCK
      ?auto_84097 - BLOCK
      ?auto_84098 - BLOCK
      ?auto_84099 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_84099 ) ( CLEAR ?auto_84098 ) ( ON-TABLE ?auto_84093 ) ( ON ?auto_84094 ?auto_84093 ) ( ON ?auto_84095 ?auto_84094 ) ( ON ?auto_84096 ?auto_84095 ) ( ON ?auto_84097 ?auto_84096 ) ( ON ?auto_84098 ?auto_84097 ) ( not ( = ?auto_84093 ?auto_84094 ) ) ( not ( = ?auto_84093 ?auto_84095 ) ) ( not ( = ?auto_84093 ?auto_84096 ) ) ( not ( = ?auto_84093 ?auto_84097 ) ) ( not ( = ?auto_84093 ?auto_84098 ) ) ( not ( = ?auto_84093 ?auto_84099 ) ) ( not ( = ?auto_84094 ?auto_84095 ) ) ( not ( = ?auto_84094 ?auto_84096 ) ) ( not ( = ?auto_84094 ?auto_84097 ) ) ( not ( = ?auto_84094 ?auto_84098 ) ) ( not ( = ?auto_84094 ?auto_84099 ) ) ( not ( = ?auto_84095 ?auto_84096 ) ) ( not ( = ?auto_84095 ?auto_84097 ) ) ( not ( = ?auto_84095 ?auto_84098 ) ) ( not ( = ?auto_84095 ?auto_84099 ) ) ( not ( = ?auto_84096 ?auto_84097 ) ) ( not ( = ?auto_84096 ?auto_84098 ) ) ( not ( = ?auto_84096 ?auto_84099 ) ) ( not ( = ?auto_84097 ?auto_84098 ) ) ( not ( = ?auto_84097 ?auto_84099 ) ) ( not ( = ?auto_84098 ?auto_84099 ) ) )
    :subtasks
    ( ( !STACK ?auto_84099 ?auto_84098 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84100 - BLOCK
      ?auto_84101 - BLOCK
      ?auto_84102 - BLOCK
      ?auto_84103 - BLOCK
      ?auto_84104 - BLOCK
      ?auto_84105 - BLOCK
      ?auto_84106 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_84105 ) ( ON-TABLE ?auto_84100 ) ( ON ?auto_84101 ?auto_84100 ) ( ON ?auto_84102 ?auto_84101 ) ( ON ?auto_84103 ?auto_84102 ) ( ON ?auto_84104 ?auto_84103 ) ( ON ?auto_84105 ?auto_84104 ) ( not ( = ?auto_84100 ?auto_84101 ) ) ( not ( = ?auto_84100 ?auto_84102 ) ) ( not ( = ?auto_84100 ?auto_84103 ) ) ( not ( = ?auto_84100 ?auto_84104 ) ) ( not ( = ?auto_84100 ?auto_84105 ) ) ( not ( = ?auto_84100 ?auto_84106 ) ) ( not ( = ?auto_84101 ?auto_84102 ) ) ( not ( = ?auto_84101 ?auto_84103 ) ) ( not ( = ?auto_84101 ?auto_84104 ) ) ( not ( = ?auto_84101 ?auto_84105 ) ) ( not ( = ?auto_84101 ?auto_84106 ) ) ( not ( = ?auto_84102 ?auto_84103 ) ) ( not ( = ?auto_84102 ?auto_84104 ) ) ( not ( = ?auto_84102 ?auto_84105 ) ) ( not ( = ?auto_84102 ?auto_84106 ) ) ( not ( = ?auto_84103 ?auto_84104 ) ) ( not ( = ?auto_84103 ?auto_84105 ) ) ( not ( = ?auto_84103 ?auto_84106 ) ) ( not ( = ?auto_84104 ?auto_84105 ) ) ( not ( = ?auto_84104 ?auto_84106 ) ) ( not ( = ?auto_84105 ?auto_84106 ) ) ( ON-TABLE ?auto_84106 ) ( CLEAR ?auto_84106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_84106 )
      ( MAKE-7PILE ?auto_84100 ?auto_84101 ?auto_84102 ?auto_84103 ?auto_84104 ?auto_84105 ?auto_84106 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84107 - BLOCK
      ?auto_84108 - BLOCK
      ?auto_84109 - BLOCK
      ?auto_84110 - BLOCK
      ?auto_84111 - BLOCK
      ?auto_84112 - BLOCK
      ?auto_84113 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84107 ) ( ON ?auto_84108 ?auto_84107 ) ( ON ?auto_84109 ?auto_84108 ) ( ON ?auto_84110 ?auto_84109 ) ( ON ?auto_84111 ?auto_84110 ) ( not ( = ?auto_84107 ?auto_84108 ) ) ( not ( = ?auto_84107 ?auto_84109 ) ) ( not ( = ?auto_84107 ?auto_84110 ) ) ( not ( = ?auto_84107 ?auto_84111 ) ) ( not ( = ?auto_84107 ?auto_84112 ) ) ( not ( = ?auto_84107 ?auto_84113 ) ) ( not ( = ?auto_84108 ?auto_84109 ) ) ( not ( = ?auto_84108 ?auto_84110 ) ) ( not ( = ?auto_84108 ?auto_84111 ) ) ( not ( = ?auto_84108 ?auto_84112 ) ) ( not ( = ?auto_84108 ?auto_84113 ) ) ( not ( = ?auto_84109 ?auto_84110 ) ) ( not ( = ?auto_84109 ?auto_84111 ) ) ( not ( = ?auto_84109 ?auto_84112 ) ) ( not ( = ?auto_84109 ?auto_84113 ) ) ( not ( = ?auto_84110 ?auto_84111 ) ) ( not ( = ?auto_84110 ?auto_84112 ) ) ( not ( = ?auto_84110 ?auto_84113 ) ) ( not ( = ?auto_84111 ?auto_84112 ) ) ( not ( = ?auto_84111 ?auto_84113 ) ) ( not ( = ?auto_84112 ?auto_84113 ) ) ( ON-TABLE ?auto_84113 ) ( CLEAR ?auto_84113 ) ( HOLDING ?auto_84112 ) ( CLEAR ?auto_84111 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84107 ?auto_84108 ?auto_84109 ?auto_84110 ?auto_84111 ?auto_84112 )
      ( MAKE-7PILE ?auto_84107 ?auto_84108 ?auto_84109 ?auto_84110 ?auto_84111 ?auto_84112 ?auto_84113 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84114 - BLOCK
      ?auto_84115 - BLOCK
      ?auto_84116 - BLOCK
      ?auto_84117 - BLOCK
      ?auto_84118 - BLOCK
      ?auto_84119 - BLOCK
      ?auto_84120 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84114 ) ( ON ?auto_84115 ?auto_84114 ) ( ON ?auto_84116 ?auto_84115 ) ( ON ?auto_84117 ?auto_84116 ) ( ON ?auto_84118 ?auto_84117 ) ( not ( = ?auto_84114 ?auto_84115 ) ) ( not ( = ?auto_84114 ?auto_84116 ) ) ( not ( = ?auto_84114 ?auto_84117 ) ) ( not ( = ?auto_84114 ?auto_84118 ) ) ( not ( = ?auto_84114 ?auto_84119 ) ) ( not ( = ?auto_84114 ?auto_84120 ) ) ( not ( = ?auto_84115 ?auto_84116 ) ) ( not ( = ?auto_84115 ?auto_84117 ) ) ( not ( = ?auto_84115 ?auto_84118 ) ) ( not ( = ?auto_84115 ?auto_84119 ) ) ( not ( = ?auto_84115 ?auto_84120 ) ) ( not ( = ?auto_84116 ?auto_84117 ) ) ( not ( = ?auto_84116 ?auto_84118 ) ) ( not ( = ?auto_84116 ?auto_84119 ) ) ( not ( = ?auto_84116 ?auto_84120 ) ) ( not ( = ?auto_84117 ?auto_84118 ) ) ( not ( = ?auto_84117 ?auto_84119 ) ) ( not ( = ?auto_84117 ?auto_84120 ) ) ( not ( = ?auto_84118 ?auto_84119 ) ) ( not ( = ?auto_84118 ?auto_84120 ) ) ( not ( = ?auto_84119 ?auto_84120 ) ) ( ON-TABLE ?auto_84120 ) ( CLEAR ?auto_84118 ) ( ON ?auto_84119 ?auto_84120 ) ( CLEAR ?auto_84119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84120 )
      ( MAKE-7PILE ?auto_84114 ?auto_84115 ?auto_84116 ?auto_84117 ?auto_84118 ?auto_84119 ?auto_84120 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84121 - BLOCK
      ?auto_84122 - BLOCK
      ?auto_84123 - BLOCK
      ?auto_84124 - BLOCK
      ?auto_84125 - BLOCK
      ?auto_84126 - BLOCK
      ?auto_84127 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84121 ) ( ON ?auto_84122 ?auto_84121 ) ( ON ?auto_84123 ?auto_84122 ) ( ON ?auto_84124 ?auto_84123 ) ( not ( = ?auto_84121 ?auto_84122 ) ) ( not ( = ?auto_84121 ?auto_84123 ) ) ( not ( = ?auto_84121 ?auto_84124 ) ) ( not ( = ?auto_84121 ?auto_84125 ) ) ( not ( = ?auto_84121 ?auto_84126 ) ) ( not ( = ?auto_84121 ?auto_84127 ) ) ( not ( = ?auto_84122 ?auto_84123 ) ) ( not ( = ?auto_84122 ?auto_84124 ) ) ( not ( = ?auto_84122 ?auto_84125 ) ) ( not ( = ?auto_84122 ?auto_84126 ) ) ( not ( = ?auto_84122 ?auto_84127 ) ) ( not ( = ?auto_84123 ?auto_84124 ) ) ( not ( = ?auto_84123 ?auto_84125 ) ) ( not ( = ?auto_84123 ?auto_84126 ) ) ( not ( = ?auto_84123 ?auto_84127 ) ) ( not ( = ?auto_84124 ?auto_84125 ) ) ( not ( = ?auto_84124 ?auto_84126 ) ) ( not ( = ?auto_84124 ?auto_84127 ) ) ( not ( = ?auto_84125 ?auto_84126 ) ) ( not ( = ?auto_84125 ?auto_84127 ) ) ( not ( = ?auto_84126 ?auto_84127 ) ) ( ON-TABLE ?auto_84127 ) ( ON ?auto_84126 ?auto_84127 ) ( CLEAR ?auto_84126 ) ( HOLDING ?auto_84125 ) ( CLEAR ?auto_84124 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84121 ?auto_84122 ?auto_84123 ?auto_84124 ?auto_84125 )
      ( MAKE-7PILE ?auto_84121 ?auto_84122 ?auto_84123 ?auto_84124 ?auto_84125 ?auto_84126 ?auto_84127 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84128 - BLOCK
      ?auto_84129 - BLOCK
      ?auto_84130 - BLOCK
      ?auto_84131 - BLOCK
      ?auto_84132 - BLOCK
      ?auto_84133 - BLOCK
      ?auto_84134 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84128 ) ( ON ?auto_84129 ?auto_84128 ) ( ON ?auto_84130 ?auto_84129 ) ( ON ?auto_84131 ?auto_84130 ) ( not ( = ?auto_84128 ?auto_84129 ) ) ( not ( = ?auto_84128 ?auto_84130 ) ) ( not ( = ?auto_84128 ?auto_84131 ) ) ( not ( = ?auto_84128 ?auto_84132 ) ) ( not ( = ?auto_84128 ?auto_84133 ) ) ( not ( = ?auto_84128 ?auto_84134 ) ) ( not ( = ?auto_84129 ?auto_84130 ) ) ( not ( = ?auto_84129 ?auto_84131 ) ) ( not ( = ?auto_84129 ?auto_84132 ) ) ( not ( = ?auto_84129 ?auto_84133 ) ) ( not ( = ?auto_84129 ?auto_84134 ) ) ( not ( = ?auto_84130 ?auto_84131 ) ) ( not ( = ?auto_84130 ?auto_84132 ) ) ( not ( = ?auto_84130 ?auto_84133 ) ) ( not ( = ?auto_84130 ?auto_84134 ) ) ( not ( = ?auto_84131 ?auto_84132 ) ) ( not ( = ?auto_84131 ?auto_84133 ) ) ( not ( = ?auto_84131 ?auto_84134 ) ) ( not ( = ?auto_84132 ?auto_84133 ) ) ( not ( = ?auto_84132 ?auto_84134 ) ) ( not ( = ?auto_84133 ?auto_84134 ) ) ( ON-TABLE ?auto_84134 ) ( ON ?auto_84133 ?auto_84134 ) ( CLEAR ?auto_84131 ) ( ON ?auto_84132 ?auto_84133 ) ( CLEAR ?auto_84132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84134 ?auto_84133 )
      ( MAKE-7PILE ?auto_84128 ?auto_84129 ?auto_84130 ?auto_84131 ?auto_84132 ?auto_84133 ?auto_84134 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84135 - BLOCK
      ?auto_84136 - BLOCK
      ?auto_84137 - BLOCK
      ?auto_84138 - BLOCK
      ?auto_84139 - BLOCK
      ?auto_84140 - BLOCK
      ?auto_84141 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84135 ) ( ON ?auto_84136 ?auto_84135 ) ( ON ?auto_84137 ?auto_84136 ) ( not ( = ?auto_84135 ?auto_84136 ) ) ( not ( = ?auto_84135 ?auto_84137 ) ) ( not ( = ?auto_84135 ?auto_84138 ) ) ( not ( = ?auto_84135 ?auto_84139 ) ) ( not ( = ?auto_84135 ?auto_84140 ) ) ( not ( = ?auto_84135 ?auto_84141 ) ) ( not ( = ?auto_84136 ?auto_84137 ) ) ( not ( = ?auto_84136 ?auto_84138 ) ) ( not ( = ?auto_84136 ?auto_84139 ) ) ( not ( = ?auto_84136 ?auto_84140 ) ) ( not ( = ?auto_84136 ?auto_84141 ) ) ( not ( = ?auto_84137 ?auto_84138 ) ) ( not ( = ?auto_84137 ?auto_84139 ) ) ( not ( = ?auto_84137 ?auto_84140 ) ) ( not ( = ?auto_84137 ?auto_84141 ) ) ( not ( = ?auto_84138 ?auto_84139 ) ) ( not ( = ?auto_84138 ?auto_84140 ) ) ( not ( = ?auto_84138 ?auto_84141 ) ) ( not ( = ?auto_84139 ?auto_84140 ) ) ( not ( = ?auto_84139 ?auto_84141 ) ) ( not ( = ?auto_84140 ?auto_84141 ) ) ( ON-TABLE ?auto_84141 ) ( ON ?auto_84140 ?auto_84141 ) ( ON ?auto_84139 ?auto_84140 ) ( CLEAR ?auto_84139 ) ( HOLDING ?auto_84138 ) ( CLEAR ?auto_84137 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84135 ?auto_84136 ?auto_84137 ?auto_84138 )
      ( MAKE-7PILE ?auto_84135 ?auto_84136 ?auto_84137 ?auto_84138 ?auto_84139 ?auto_84140 ?auto_84141 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84142 - BLOCK
      ?auto_84143 - BLOCK
      ?auto_84144 - BLOCK
      ?auto_84145 - BLOCK
      ?auto_84146 - BLOCK
      ?auto_84147 - BLOCK
      ?auto_84148 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84142 ) ( ON ?auto_84143 ?auto_84142 ) ( ON ?auto_84144 ?auto_84143 ) ( not ( = ?auto_84142 ?auto_84143 ) ) ( not ( = ?auto_84142 ?auto_84144 ) ) ( not ( = ?auto_84142 ?auto_84145 ) ) ( not ( = ?auto_84142 ?auto_84146 ) ) ( not ( = ?auto_84142 ?auto_84147 ) ) ( not ( = ?auto_84142 ?auto_84148 ) ) ( not ( = ?auto_84143 ?auto_84144 ) ) ( not ( = ?auto_84143 ?auto_84145 ) ) ( not ( = ?auto_84143 ?auto_84146 ) ) ( not ( = ?auto_84143 ?auto_84147 ) ) ( not ( = ?auto_84143 ?auto_84148 ) ) ( not ( = ?auto_84144 ?auto_84145 ) ) ( not ( = ?auto_84144 ?auto_84146 ) ) ( not ( = ?auto_84144 ?auto_84147 ) ) ( not ( = ?auto_84144 ?auto_84148 ) ) ( not ( = ?auto_84145 ?auto_84146 ) ) ( not ( = ?auto_84145 ?auto_84147 ) ) ( not ( = ?auto_84145 ?auto_84148 ) ) ( not ( = ?auto_84146 ?auto_84147 ) ) ( not ( = ?auto_84146 ?auto_84148 ) ) ( not ( = ?auto_84147 ?auto_84148 ) ) ( ON-TABLE ?auto_84148 ) ( ON ?auto_84147 ?auto_84148 ) ( ON ?auto_84146 ?auto_84147 ) ( CLEAR ?auto_84144 ) ( ON ?auto_84145 ?auto_84146 ) ( CLEAR ?auto_84145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84148 ?auto_84147 ?auto_84146 )
      ( MAKE-7PILE ?auto_84142 ?auto_84143 ?auto_84144 ?auto_84145 ?auto_84146 ?auto_84147 ?auto_84148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84149 - BLOCK
      ?auto_84150 - BLOCK
      ?auto_84151 - BLOCK
      ?auto_84152 - BLOCK
      ?auto_84153 - BLOCK
      ?auto_84154 - BLOCK
      ?auto_84155 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84149 ) ( ON ?auto_84150 ?auto_84149 ) ( not ( = ?auto_84149 ?auto_84150 ) ) ( not ( = ?auto_84149 ?auto_84151 ) ) ( not ( = ?auto_84149 ?auto_84152 ) ) ( not ( = ?auto_84149 ?auto_84153 ) ) ( not ( = ?auto_84149 ?auto_84154 ) ) ( not ( = ?auto_84149 ?auto_84155 ) ) ( not ( = ?auto_84150 ?auto_84151 ) ) ( not ( = ?auto_84150 ?auto_84152 ) ) ( not ( = ?auto_84150 ?auto_84153 ) ) ( not ( = ?auto_84150 ?auto_84154 ) ) ( not ( = ?auto_84150 ?auto_84155 ) ) ( not ( = ?auto_84151 ?auto_84152 ) ) ( not ( = ?auto_84151 ?auto_84153 ) ) ( not ( = ?auto_84151 ?auto_84154 ) ) ( not ( = ?auto_84151 ?auto_84155 ) ) ( not ( = ?auto_84152 ?auto_84153 ) ) ( not ( = ?auto_84152 ?auto_84154 ) ) ( not ( = ?auto_84152 ?auto_84155 ) ) ( not ( = ?auto_84153 ?auto_84154 ) ) ( not ( = ?auto_84153 ?auto_84155 ) ) ( not ( = ?auto_84154 ?auto_84155 ) ) ( ON-TABLE ?auto_84155 ) ( ON ?auto_84154 ?auto_84155 ) ( ON ?auto_84153 ?auto_84154 ) ( ON ?auto_84152 ?auto_84153 ) ( CLEAR ?auto_84152 ) ( HOLDING ?auto_84151 ) ( CLEAR ?auto_84150 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84149 ?auto_84150 ?auto_84151 )
      ( MAKE-7PILE ?auto_84149 ?auto_84150 ?auto_84151 ?auto_84152 ?auto_84153 ?auto_84154 ?auto_84155 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84156 - BLOCK
      ?auto_84157 - BLOCK
      ?auto_84158 - BLOCK
      ?auto_84159 - BLOCK
      ?auto_84160 - BLOCK
      ?auto_84161 - BLOCK
      ?auto_84162 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84156 ) ( ON ?auto_84157 ?auto_84156 ) ( not ( = ?auto_84156 ?auto_84157 ) ) ( not ( = ?auto_84156 ?auto_84158 ) ) ( not ( = ?auto_84156 ?auto_84159 ) ) ( not ( = ?auto_84156 ?auto_84160 ) ) ( not ( = ?auto_84156 ?auto_84161 ) ) ( not ( = ?auto_84156 ?auto_84162 ) ) ( not ( = ?auto_84157 ?auto_84158 ) ) ( not ( = ?auto_84157 ?auto_84159 ) ) ( not ( = ?auto_84157 ?auto_84160 ) ) ( not ( = ?auto_84157 ?auto_84161 ) ) ( not ( = ?auto_84157 ?auto_84162 ) ) ( not ( = ?auto_84158 ?auto_84159 ) ) ( not ( = ?auto_84158 ?auto_84160 ) ) ( not ( = ?auto_84158 ?auto_84161 ) ) ( not ( = ?auto_84158 ?auto_84162 ) ) ( not ( = ?auto_84159 ?auto_84160 ) ) ( not ( = ?auto_84159 ?auto_84161 ) ) ( not ( = ?auto_84159 ?auto_84162 ) ) ( not ( = ?auto_84160 ?auto_84161 ) ) ( not ( = ?auto_84160 ?auto_84162 ) ) ( not ( = ?auto_84161 ?auto_84162 ) ) ( ON-TABLE ?auto_84162 ) ( ON ?auto_84161 ?auto_84162 ) ( ON ?auto_84160 ?auto_84161 ) ( ON ?auto_84159 ?auto_84160 ) ( CLEAR ?auto_84157 ) ( ON ?auto_84158 ?auto_84159 ) ( CLEAR ?auto_84158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84162 ?auto_84161 ?auto_84160 ?auto_84159 )
      ( MAKE-7PILE ?auto_84156 ?auto_84157 ?auto_84158 ?auto_84159 ?auto_84160 ?auto_84161 ?auto_84162 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84163 - BLOCK
      ?auto_84164 - BLOCK
      ?auto_84165 - BLOCK
      ?auto_84166 - BLOCK
      ?auto_84167 - BLOCK
      ?auto_84168 - BLOCK
      ?auto_84169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84163 ) ( not ( = ?auto_84163 ?auto_84164 ) ) ( not ( = ?auto_84163 ?auto_84165 ) ) ( not ( = ?auto_84163 ?auto_84166 ) ) ( not ( = ?auto_84163 ?auto_84167 ) ) ( not ( = ?auto_84163 ?auto_84168 ) ) ( not ( = ?auto_84163 ?auto_84169 ) ) ( not ( = ?auto_84164 ?auto_84165 ) ) ( not ( = ?auto_84164 ?auto_84166 ) ) ( not ( = ?auto_84164 ?auto_84167 ) ) ( not ( = ?auto_84164 ?auto_84168 ) ) ( not ( = ?auto_84164 ?auto_84169 ) ) ( not ( = ?auto_84165 ?auto_84166 ) ) ( not ( = ?auto_84165 ?auto_84167 ) ) ( not ( = ?auto_84165 ?auto_84168 ) ) ( not ( = ?auto_84165 ?auto_84169 ) ) ( not ( = ?auto_84166 ?auto_84167 ) ) ( not ( = ?auto_84166 ?auto_84168 ) ) ( not ( = ?auto_84166 ?auto_84169 ) ) ( not ( = ?auto_84167 ?auto_84168 ) ) ( not ( = ?auto_84167 ?auto_84169 ) ) ( not ( = ?auto_84168 ?auto_84169 ) ) ( ON-TABLE ?auto_84169 ) ( ON ?auto_84168 ?auto_84169 ) ( ON ?auto_84167 ?auto_84168 ) ( ON ?auto_84166 ?auto_84167 ) ( ON ?auto_84165 ?auto_84166 ) ( CLEAR ?auto_84165 ) ( HOLDING ?auto_84164 ) ( CLEAR ?auto_84163 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84163 ?auto_84164 )
      ( MAKE-7PILE ?auto_84163 ?auto_84164 ?auto_84165 ?auto_84166 ?auto_84167 ?auto_84168 ?auto_84169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84170 - BLOCK
      ?auto_84171 - BLOCK
      ?auto_84172 - BLOCK
      ?auto_84173 - BLOCK
      ?auto_84174 - BLOCK
      ?auto_84175 - BLOCK
      ?auto_84176 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_84170 ) ( not ( = ?auto_84170 ?auto_84171 ) ) ( not ( = ?auto_84170 ?auto_84172 ) ) ( not ( = ?auto_84170 ?auto_84173 ) ) ( not ( = ?auto_84170 ?auto_84174 ) ) ( not ( = ?auto_84170 ?auto_84175 ) ) ( not ( = ?auto_84170 ?auto_84176 ) ) ( not ( = ?auto_84171 ?auto_84172 ) ) ( not ( = ?auto_84171 ?auto_84173 ) ) ( not ( = ?auto_84171 ?auto_84174 ) ) ( not ( = ?auto_84171 ?auto_84175 ) ) ( not ( = ?auto_84171 ?auto_84176 ) ) ( not ( = ?auto_84172 ?auto_84173 ) ) ( not ( = ?auto_84172 ?auto_84174 ) ) ( not ( = ?auto_84172 ?auto_84175 ) ) ( not ( = ?auto_84172 ?auto_84176 ) ) ( not ( = ?auto_84173 ?auto_84174 ) ) ( not ( = ?auto_84173 ?auto_84175 ) ) ( not ( = ?auto_84173 ?auto_84176 ) ) ( not ( = ?auto_84174 ?auto_84175 ) ) ( not ( = ?auto_84174 ?auto_84176 ) ) ( not ( = ?auto_84175 ?auto_84176 ) ) ( ON-TABLE ?auto_84176 ) ( ON ?auto_84175 ?auto_84176 ) ( ON ?auto_84174 ?auto_84175 ) ( ON ?auto_84173 ?auto_84174 ) ( ON ?auto_84172 ?auto_84173 ) ( CLEAR ?auto_84170 ) ( ON ?auto_84171 ?auto_84172 ) ( CLEAR ?auto_84171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84176 ?auto_84175 ?auto_84174 ?auto_84173 ?auto_84172 )
      ( MAKE-7PILE ?auto_84170 ?auto_84171 ?auto_84172 ?auto_84173 ?auto_84174 ?auto_84175 ?auto_84176 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84177 - BLOCK
      ?auto_84178 - BLOCK
      ?auto_84179 - BLOCK
      ?auto_84180 - BLOCK
      ?auto_84181 - BLOCK
      ?auto_84182 - BLOCK
      ?auto_84183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84177 ?auto_84178 ) ) ( not ( = ?auto_84177 ?auto_84179 ) ) ( not ( = ?auto_84177 ?auto_84180 ) ) ( not ( = ?auto_84177 ?auto_84181 ) ) ( not ( = ?auto_84177 ?auto_84182 ) ) ( not ( = ?auto_84177 ?auto_84183 ) ) ( not ( = ?auto_84178 ?auto_84179 ) ) ( not ( = ?auto_84178 ?auto_84180 ) ) ( not ( = ?auto_84178 ?auto_84181 ) ) ( not ( = ?auto_84178 ?auto_84182 ) ) ( not ( = ?auto_84178 ?auto_84183 ) ) ( not ( = ?auto_84179 ?auto_84180 ) ) ( not ( = ?auto_84179 ?auto_84181 ) ) ( not ( = ?auto_84179 ?auto_84182 ) ) ( not ( = ?auto_84179 ?auto_84183 ) ) ( not ( = ?auto_84180 ?auto_84181 ) ) ( not ( = ?auto_84180 ?auto_84182 ) ) ( not ( = ?auto_84180 ?auto_84183 ) ) ( not ( = ?auto_84181 ?auto_84182 ) ) ( not ( = ?auto_84181 ?auto_84183 ) ) ( not ( = ?auto_84182 ?auto_84183 ) ) ( ON-TABLE ?auto_84183 ) ( ON ?auto_84182 ?auto_84183 ) ( ON ?auto_84181 ?auto_84182 ) ( ON ?auto_84180 ?auto_84181 ) ( ON ?auto_84179 ?auto_84180 ) ( ON ?auto_84178 ?auto_84179 ) ( CLEAR ?auto_84178 ) ( HOLDING ?auto_84177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84177 )
      ( MAKE-7PILE ?auto_84177 ?auto_84178 ?auto_84179 ?auto_84180 ?auto_84181 ?auto_84182 ?auto_84183 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84184 - BLOCK
      ?auto_84185 - BLOCK
      ?auto_84186 - BLOCK
      ?auto_84187 - BLOCK
      ?auto_84188 - BLOCK
      ?auto_84189 - BLOCK
      ?auto_84190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84184 ?auto_84185 ) ) ( not ( = ?auto_84184 ?auto_84186 ) ) ( not ( = ?auto_84184 ?auto_84187 ) ) ( not ( = ?auto_84184 ?auto_84188 ) ) ( not ( = ?auto_84184 ?auto_84189 ) ) ( not ( = ?auto_84184 ?auto_84190 ) ) ( not ( = ?auto_84185 ?auto_84186 ) ) ( not ( = ?auto_84185 ?auto_84187 ) ) ( not ( = ?auto_84185 ?auto_84188 ) ) ( not ( = ?auto_84185 ?auto_84189 ) ) ( not ( = ?auto_84185 ?auto_84190 ) ) ( not ( = ?auto_84186 ?auto_84187 ) ) ( not ( = ?auto_84186 ?auto_84188 ) ) ( not ( = ?auto_84186 ?auto_84189 ) ) ( not ( = ?auto_84186 ?auto_84190 ) ) ( not ( = ?auto_84187 ?auto_84188 ) ) ( not ( = ?auto_84187 ?auto_84189 ) ) ( not ( = ?auto_84187 ?auto_84190 ) ) ( not ( = ?auto_84188 ?auto_84189 ) ) ( not ( = ?auto_84188 ?auto_84190 ) ) ( not ( = ?auto_84189 ?auto_84190 ) ) ( ON-TABLE ?auto_84190 ) ( ON ?auto_84189 ?auto_84190 ) ( ON ?auto_84188 ?auto_84189 ) ( ON ?auto_84187 ?auto_84188 ) ( ON ?auto_84186 ?auto_84187 ) ( ON ?auto_84185 ?auto_84186 ) ( ON ?auto_84184 ?auto_84185 ) ( CLEAR ?auto_84184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84190 ?auto_84189 ?auto_84188 ?auto_84187 ?auto_84186 ?auto_84185 )
      ( MAKE-7PILE ?auto_84184 ?auto_84185 ?auto_84186 ?auto_84187 ?auto_84188 ?auto_84189 ?auto_84190 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84191 - BLOCK
      ?auto_84192 - BLOCK
      ?auto_84193 - BLOCK
      ?auto_84194 - BLOCK
      ?auto_84195 - BLOCK
      ?auto_84196 - BLOCK
      ?auto_84197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84191 ?auto_84192 ) ) ( not ( = ?auto_84191 ?auto_84193 ) ) ( not ( = ?auto_84191 ?auto_84194 ) ) ( not ( = ?auto_84191 ?auto_84195 ) ) ( not ( = ?auto_84191 ?auto_84196 ) ) ( not ( = ?auto_84191 ?auto_84197 ) ) ( not ( = ?auto_84192 ?auto_84193 ) ) ( not ( = ?auto_84192 ?auto_84194 ) ) ( not ( = ?auto_84192 ?auto_84195 ) ) ( not ( = ?auto_84192 ?auto_84196 ) ) ( not ( = ?auto_84192 ?auto_84197 ) ) ( not ( = ?auto_84193 ?auto_84194 ) ) ( not ( = ?auto_84193 ?auto_84195 ) ) ( not ( = ?auto_84193 ?auto_84196 ) ) ( not ( = ?auto_84193 ?auto_84197 ) ) ( not ( = ?auto_84194 ?auto_84195 ) ) ( not ( = ?auto_84194 ?auto_84196 ) ) ( not ( = ?auto_84194 ?auto_84197 ) ) ( not ( = ?auto_84195 ?auto_84196 ) ) ( not ( = ?auto_84195 ?auto_84197 ) ) ( not ( = ?auto_84196 ?auto_84197 ) ) ( ON-TABLE ?auto_84197 ) ( ON ?auto_84196 ?auto_84197 ) ( ON ?auto_84195 ?auto_84196 ) ( ON ?auto_84194 ?auto_84195 ) ( ON ?auto_84193 ?auto_84194 ) ( ON ?auto_84192 ?auto_84193 ) ( HOLDING ?auto_84191 ) ( CLEAR ?auto_84192 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84197 ?auto_84196 ?auto_84195 ?auto_84194 ?auto_84193 ?auto_84192 ?auto_84191 )
      ( MAKE-7PILE ?auto_84191 ?auto_84192 ?auto_84193 ?auto_84194 ?auto_84195 ?auto_84196 ?auto_84197 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84198 - BLOCK
      ?auto_84199 - BLOCK
      ?auto_84200 - BLOCK
      ?auto_84201 - BLOCK
      ?auto_84202 - BLOCK
      ?auto_84203 - BLOCK
      ?auto_84204 - BLOCK
    )
    :vars
    (
      ?auto_84205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84198 ?auto_84199 ) ) ( not ( = ?auto_84198 ?auto_84200 ) ) ( not ( = ?auto_84198 ?auto_84201 ) ) ( not ( = ?auto_84198 ?auto_84202 ) ) ( not ( = ?auto_84198 ?auto_84203 ) ) ( not ( = ?auto_84198 ?auto_84204 ) ) ( not ( = ?auto_84199 ?auto_84200 ) ) ( not ( = ?auto_84199 ?auto_84201 ) ) ( not ( = ?auto_84199 ?auto_84202 ) ) ( not ( = ?auto_84199 ?auto_84203 ) ) ( not ( = ?auto_84199 ?auto_84204 ) ) ( not ( = ?auto_84200 ?auto_84201 ) ) ( not ( = ?auto_84200 ?auto_84202 ) ) ( not ( = ?auto_84200 ?auto_84203 ) ) ( not ( = ?auto_84200 ?auto_84204 ) ) ( not ( = ?auto_84201 ?auto_84202 ) ) ( not ( = ?auto_84201 ?auto_84203 ) ) ( not ( = ?auto_84201 ?auto_84204 ) ) ( not ( = ?auto_84202 ?auto_84203 ) ) ( not ( = ?auto_84202 ?auto_84204 ) ) ( not ( = ?auto_84203 ?auto_84204 ) ) ( ON-TABLE ?auto_84204 ) ( ON ?auto_84203 ?auto_84204 ) ( ON ?auto_84202 ?auto_84203 ) ( ON ?auto_84201 ?auto_84202 ) ( ON ?auto_84200 ?auto_84201 ) ( ON ?auto_84199 ?auto_84200 ) ( CLEAR ?auto_84199 ) ( ON ?auto_84198 ?auto_84205 ) ( CLEAR ?auto_84198 ) ( HAND-EMPTY ) ( not ( = ?auto_84198 ?auto_84205 ) ) ( not ( = ?auto_84199 ?auto_84205 ) ) ( not ( = ?auto_84200 ?auto_84205 ) ) ( not ( = ?auto_84201 ?auto_84205 ) ) ( not ( = ?auto_84202 ?auto_84205 ) ) ( not ( = ?auto_84203 ?auto_84205 ) ) ( not ( = ?auto_84204 ?auto_84205 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_84198 ?auto_84205 )
      ( MAKE-7PILE ?auto_84198 ?auto_84199 ?auto_84200 ?auto_84201 ?auto_84202 ?auto_84203 ?auto_84204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84206 - BLOCK
      ?auto_84207 - BLOCK
      ?auto_84208 - BLOCK
      ?auto_84209 - BLOCK
      ?auto_84210 - BLOCK
      ?auto_84211 - BLOCK
      ?auto_84212 - BLOCK
    )
    :vars
    (
      ?auto_84213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84206 ?auto_84207 ) ) ( not ( = ?auto_84206 ?auto_84208 ) ) ( not ( = ?auto_84206 ?auto_84209 ) ) ( not ( = ?auto_84206 ?auto_84210 ) ) ( not ( = ?auto_84206 ?auto_84211 ) ) ( not ( = ?auto_84206 ?auto_84212 ) ) ( not ( = ?auto_84207 ?auto_84208 ) ) ( not ( = ?auto_84207 ?auto_84209 ) ) ( not ( = ?auto_84207 ?auto_84210 ) ) ( not ( = ?auto_84207 ?auto_84211 ) ) ( not ( = ?auto_84207 ?auto_84212 ) ) ( not ( = ?auto_84208 ?auto_84209 ) ) ( not ( = ?auto_84208 ?auto_84210 ) ) ( not ( = ?auto_84208 ?auto_84211 ) ) ( not ( = ?auto_84208 ?auto_84212 ) ) ( not ( = ?auto_84209 ?auto_84210 ) ) ( not ( = ?auto_84209 ?auto_84211 ) ) ( not ( = ?auto_84209 ?auto_84212 ) ) ( not ( = ?auto_84210 ?auto_84211 ) ) ( not ( = ?auto_84210 ?auto_84212 ) ) ( not ( = ?auto_84211 ?auto_84212 ) ) ( ON-TABLE ?auto_84212 ) ( ON ?auto_84211 ?auto_84212 ) ( ON ?auto_84210 ?auto_84211 ) ( ON ?auto_84209 ?auto_84210 ) ( ON ?auto_84208 ?auto_84209 ) ( ON ?auto_84206 ?auto_84213 ) ( CLEAR ?auto_84206 ) ( not ( = ?auto_84206 ?auto_84213 ) ) ( not ( = ?auto_84207 ?auto_84213 ) ) ( not ( = ?auto_84208 ?auto_84213 ) ) ( not ( = ?auto_84209 ?auto_84213 ) ) ( not ( = ?auto_84210 ?auto_84213 ) ) ( not ( = ?auto_84211 ?auto_84213 ) ) ( not ( = ?auto_84212 ?auto_84213 ) ) ( HOLDING ?auto_84207 ) ( CLEAR ?auto_84208 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84212 ?auto_84211 ?auto_84210 ?auto_84209 ?auto_84208 ?auto_84207 )
      ( MAKE-7PILE ?auto_84206 ?auto_84207 ?auto_84208 ?auto_84209 ?auto_84210 ?auto_84211 ?auto_84212 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84214 - BLOCK
      ?auto_84215 - BLOCK
      ?auto_84216 - BLOCK
      ?auto_84217 - BLOCK
      ?auto_84218 - BLOCK
      ?auto_84219 - BLOCK
      ?auto_84220 - BLOCK
    )
    :vars
    (
      ?auto_84221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84214 ?auto_84215 ) ) ( not ( = ?auto_84214 ?auto_84216 ) ) ( not ( = ?auto_84214 ?auto_84217 ) ) ( not ( = ?auto_84214 ?auto_84218 ) ) ( not ( = ?auto_84214 ?auto_84219 ) ) ( not ( = ?auto_84214 ?auto_84220 ) ) ( not ( = ?auto_84215 ?auto_84216 ) ) ( not ( = ?auto_84215 ?auto_84217 ) ) ( not ( = ?auto_84215 ?auto_84218 ) ) ( not ( = ?auto_84215 ?auto_84219 ) ) ( not ( = ?auto_84215 ?auto_84220 ) ) ( not ( = ?auto_84216 ?auto_84217 ) ) ( not ( = ?auto_84216 ?auto_84218 ) ) ( not ( = ?auto_84216 ?auto_84219 ) ) ( not ( = ?auto_84216 ?auto_84220 ) ) ( not ( = ?auto_84217 ?auto_84218 ) ) ( not ( = ?auto_84217 ?auto_84219 ) ) ( not ( = ?auto_84217 ?auto_84220 ) ) ( not ( = ?auto_84218 ?auto_84219 ) ) ( not ( = ?auto_84218 ?auto_84220 ) ) ( not ( = ?auto_84219 ?auto_84220 ) ) ( ON-TABLE ?auto_84220 ) ( ON ?auto_84219 ?auto_84220 ) ( ON ?auto_84218 ?auto_84219 ) ( ON ?auto_84217 ?auto_84218 ) ( ON ?auto_84216 ?auto_84217 ) ( ON ?auto_84214 ?auto_84221 ) ( not ( = ?auto_84214 ?auto_84221 ) ) ( not ( = ?auto_84215 ?auto_84221 ) ) ( not ( = ?auto_84216 ?auto_84221 ) ) ( not ( = ?auto_84217 ?auto_84221 ) ) ( not ( = ?auto_84218 ?auto_84221 ) ) ( not ( = ?auto_84219 ?auto_84221 ) ) ( not ( = ?auto_84220 ?auto_84221 ) ) ( CLEAR ?auto_84216 ) ( ON ?auto_84215 ?auto_84214 ) ( CLEAR ?auto_84215 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_84221 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84221 ?auto_84214 )
      ( MAKE-7PILE ?auto_84214 ?auto_84215 ?auto_84216 ?auto_84217 ?auto_84218 ?auto_84219 ?auto_84220 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84222 - BLOCK
      ?auto_84223 - BLOCK
      ?auto_84224 - BLOCK
      ?auto_84225 - BLOCK
      ?auto_84226 - BLOCK
      ?auto_84227 - BLOCK
      ?auto_84228 - BLOCK
    )
    :vars
    (
      ?auto_84229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84222 ?auto_84223 ) ) ( not ( = ?auto_84222 ?auto_84224 ) ) ( not ( = ?auto_84222 ?auto_84225 ) ) ( not ( = ?auto_84222 ?auto_84226 ) ) ( not ( = ?auto_84222 ?auto_84227 ) ) ( not ( = ?auto_84222 ?auto_84228 ) ) ( not ( = ?auto_84223 ?auto_84224 ) ) ( not ( = ?auto_84223 ?auto_84225 ) ) ( not ( = ?auto_84223 ?auto_84226 ) ) ( not ( = ?auto_84223 ?auto_84227 ) ) ( not ( = ?auto_84223 ?auto_84228 ) ) ( not ( = ?auto_84224 ?auto_84225 ) ) ( not ( = ?auto_84224 ?auto_84226 ) ) ( not ( = ?auto_84224 ?auto_84227 ) ) ( not ( = ?auto_84224 ?auto_84228 ) ) ( not ( = ?auto_84225 ?auto_84226 ) ) ( not ( = ?auto_84225 ?auto_84227 ) ) ( not ( = ?auto_84225 ?auto_84228 ) ) ( not ( = ?auto_84226 ?auto_84227 ) ) ( not ( = ?auto_84226 ?auto_84228 ) ) ( not ( = ?auto_84227 ?auto_84228 ) ) ( ON-TABLE ?auto_84228 ) ( ON ?auto_84227 ?auto_84228 ) ( ON ?auto_84226 ?auto_84227 ) ( ON ?auto_84225 ?auto_84226 ) ( ON ?auto_84222 ?auto_84229 ) ( not ( = ?auto_84222 ?auto_84229 ) ) ( not ( = ?auto_84223 ?auto_84229 ) ) ( not ( = ?auto_84224 ?auto_84229 ) ) ( not ( = ?auto_84225 ?auto_84229 ) ) ( not ( = ?auto_84226 ?auto_84229 ) ) ( not ( = ?auto_84227 ?auto_84229 ) ) ( not ( = ?auto_84228 ?auto_84229 ) ) ( ON ?auto_84223 ?auto_84222 ) ( CLEAR ?auto_84223 ) ( ON-TABLE ?auto_84229 ) ( HOLDING ?auto_84224 ) ( CLEAR ?auto_84225 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84228 ?auto_84227 ?auto_84226 ?auto_84225 ?auto_84224 )
      ( MAKE-7PILE ?auto_84222 ?auto_84223 ?auto_84224 ?auto_84225 ?auto_84226 ?auto_84227 ?auto_84228 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84230 - BLOCK
      ?auto_84231 - BLOCK
      ?auto_84232 - BLOCK
      ?auto_84233 - BLOCK
      ?auto_84234 - BLOCK
      ?auto_84235 - BLOCK
      ?auto_84236 - BLOCK
    )
    :vars
    (
      ?auto_84237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84230 ?auto_84231 ) ) ( not ( = ?auto_84230 ?auto_84232 ) ) ( not ( = ?auto_84230 ?auto_84233 ) ) ( not ( = ?auto_84230 ?auto_84234 ) ) ( not ( = ?auto_84230 ?auto_84235 ) ) ( not ( = ?auto_84230 ?auto_84236 ) ) ( not ( = ?auto_84231 ?auto_84232 ) ) ( not ( = ?auto_84231 ?auto_84233 ) ) ( not ( = ?auto_84231 ?auto_84234 ) ) ( not ( = ?auto_84231 ?auto_84235 ) ) ( not ( = ?auto_84231 ?auto_84236 ) ) ( not ( = ?auto_84232 ?auto_84233 ) ) ( not ( = ?auto_84232 ?auto_84234 ) ) ( not ( = ?auto_84232 ?auto_84235 ) ) ( not ( = ?auto_84232 ?auto_84236 ) ) ( not ( = ?auto_84233 ?auto_84234 ) ) ( not ( = ?auto_84233 ?auto_84235 ) ) ( not ( = ?auto_84233 ?auto_84236 ) ) ( not ( = ?auto_84234 ?auto_84235 ) ) ( not ( = ?auto_84234 ?auto_84236 ) ) ( not ( = ?auto_84235 ?auto_84236 ) ) ( ON-TABLE ?auto_84236 ) ( ON ?auto_84235 ?auto_84236 ) ( ON ?auto_84234 ?auto_84235 ) ( ON ?auto_84233 ?auto_84234 ) ( ON ?auto_84230 ?auto_84237 ) ( not ( = ?auto_84230 ?auto_84237 ) ) ( not ( = ?auto_84231 ?auto_84237 ) ) ( not ( = ?auto_84232 ?auto_84237 ) ) ( not ( = ?auto_84233 ?auto_84237 ) ) ( not ( = ?auto_84234 ?auto_84237 ) ) ( not ( = ?auto_84235 ?auto_84237 ) ) ( not ( = ?auto_84236 ?auto_84237 ) ) ( ON ?auto_84231 ?auto_84230 ) ( ON-TABLE ?auto_84237 ) ( CLEAR ?auto_84233 ) ( ON ?auto_84232 ?auto_84231 ) ( CLEAR ?auto_84232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84237 ?auto_84230 ?auto_84231 )
      ( MAKE-7PILE ?auto_84230 ?auto_84231 ?auto_84232 ?auto_84233 ?auto_84234 ?auto_84235 ?auto_84236 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84238 - BLOCK
      ?auto_84239 - BLOCK
      ?auto_84240 - BLOCK
      ?auto_84241 - BLOCK
      ?auto_84242 - BLOCK
      ?auto_84243 - BLOCK
      ?auto_84244 - BLOCK
    )
    :vars
    (
      ?auto_84245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84238 ?auto_84239 ) ) ( not ( = ?auto_84238 ?auto_84240 ) ) ( not ( = ?auto_84238 ?auto_84241 ) ) ( not ( = ?auto_84238 ?auto_84242 ) ) ( not ( = ?auto_84238 ?auto_84243 ) ) ( not ( = ?auto_84238 ?auto_84244 ) ) ( not ( = ?auto_84239 ?auto_84240 ) ) ( not ( = ?auto_84239 ?auto_84241 ) ) ( not ( = ?auto_84239 ?auto_84242 ) ) ( not ( = ?auto_84239 ?auto_84243 ) ) ( not ( = ?auto_84239 ?auto_84244 ) ) ( not ( = ?auto_84240 ?auto_84241 ) ) ( not ( = ?auto_84240 ?auto_84242 ) ) ( not ( = ?auto_84240 ?auto_84243 ) ) ( not ( = ?auto_84240 ?auto_84244 ) ) ( not ( = ?auto_84241 ?auto_84242 ) ) ( not ( = ?auto_84241 ?auto_84243 ) ) ( not ( = ?auto_84241 ?auto_84244 ) ) ( not ( = ?auto_84242 ?auto_84243 ) ) ( not ( = ?auto_84242 ?auto_84244 ) ) ( not ( = ?auto_84243 ?auto_84244 ) ) ( ON-TABLE ?auto_84244 ) ( ON ?auto_84243 ?auto_84244 ) ( ON ?auto_84242 ?auto_84243 ) ( ON ?auto_84238 ?auto_84245 ) ( not ( = ?auto_84238 ?auto_84245 ) ) ( not ( = ?auto_84239 ?auto_84245 ) ) ( not ( = ?auto_84240 ?auto_84245 ) ) ( not ( = ?auto_84241 ?auto_84245 ) ) ( not ( = ?auto_84242 ?auto_84245 ) ) ( not ( = ?auto_84243 ?auto_84245 ) ) ( not ( = ?auto_84244 ?auto_84245 ) ) ( ON ?auto_84239 ?auto_84238 ) ( ON-TABLE ?auto_84245 ) ( ON ?auto_84240 ?auto_84239 ) ( CLEAR ?auto_84240 ) ( HOLDING ?auto_84241 ) ( CLEAR ?auto_84242 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84244 ?auto_84243 ?auto_84242 ?auto_84241 )
      ( MAKE-7PILE ?auto_84238 ?auto_84239 ?auto_84240 ?auto_84241 ?auto_84242 ?auto_84243 ?auto_84244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84246 - BLOCK
      ?auto_84247 - BLOCK
      ?auto_84248 - BLOCK
      ?auto_84249 - BLOCK
      ?auto_84250 - BLOCK
      ?auto_84251 - BLOCK
      ?auto_84252 - BLOCK
    )
    :vars
    (
      ?auto_84253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84246 ?auto_84247 ) ) ( not ( = ?auto_84246 ?auto_84248 ) ) ( not ( = ?auto_84246 ?auto_84249 ) ) ( not ( = ?auto_84246 ?auto_84250 ) ) ( not ( = ?auto_84246 ?auto_84251 ) ) ( not ( = ?auto_84246 ?auto_84252 ) ) ( not ( = ?auto_84247 ?auto_84248 ) ) ( not ( = ?auto_84247 ?auto_84249 ) ) ( not ( = ?auto_84247 ?auto_84250 ) ) ( not ( = ?auto_84247 ?auto_84251 ) ) ( not ( = ?auto_84247 ?auto_84252 ) ) ( not ( = ?auto_84248 ?auto_84249 ) ) ( not ( = ?auto_84248 ?auto_84250 ) ) ( not ( = ?auto_84248 ?auto_84251 ) ) ( not ( = ?auto_84248 ?auto_84252 ) ) ( not ( = ?auto_84249 ?auto_84250 ) ) ( not ( = ?auto_84249 ?auto_84251 ) ) ( not ( = ?auto_84249 ?auto_84252 ) ) ( not ( = ?auto_84250 ?auto_84251 ) ) ( not ( = ?auto_84250 ?auto_84252 ) ) ( not ( = ?auto_84251 ?auto_84252 ) ) ( ON-TABLE ?auto_84252 ) ( ON ?auto_84251 ?auto_84252 ) ( ON ?auto_84250 ?auto_84251 ) ( ON ?auto_84246 ?auto_84253 ) ( not ( = ?auto_84246 ?auto_84253 ) ) ( not ( = ?auto_84247 ?auto_84253 ) ) ( not ( = ?auto_84248 ?auto_84253 ) ) ( not ( = ?auto_84249 ?auto_84253 ) ) ( not ( = ?auto_84250 ?auto_84253 ) ) ( not ( = ?auto_84251 ?auto_84253 ) ) ( not ( = ?auto_84252 ?auto_84253 ) ) ( ON ?auto_84247 ?auto_84246 ) ( ON-TABLE ?auto_84253 ) ( ON ?auto_84248 ?auto_84247 ) ( CLEAR ?auto_84250 ) ( ON ?auto_84249 ?auto_84248 ) ( CLEAR ?auto_84249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_84253 ?auto_84246 ?auto_84247 ?auto_84248 )
      ( MAKE-7PILE ?auto_84246 ?auto_84247 ?auto_84248 ?auto_84249 ?auto_84250 ?auto_84251 ?auto_84252 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84254 - BLOCK
      ?auto_84255 - BLOCK
      ?auto_84256 - BLOCK
      ?auto_84257 - BLOCK
      ?auto_84258 - BLOCK
      ?auto_84259 - BLOCK
      ?auto_84260 - BLOCK
    )
    :vars
    (
      ?auto_84261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84254 ?auto_84255 ) ) ( not ( = ?auto_84254 ?auto_84256 ) ) ( not ( = ?auto_84254 ?auto_84257 ) ) ( not ( = ?auto_84254 ?auto_84258 ) ) ( not ( = ?auto_84254 ?auto_84259 ) ) ( not ( = ?auto_84254 ?auto_84260 ) ) ( not ( = ?auto_84255 ?auto_84256 ) ) ( not ( = ?auto_84255 ?auto_84257 ) ) ( not ( = ?auto_84255 ?auto_84258 ) ) ( not ( = ?auto_84255 ?auto_84259 ) ) ( not ( = ?auto_84255 ?auto_84260 ) ) ( not ( = ?auto_84256 ?auto_84257 ) ) ( not ( = ?auto_84256 ?auto_84258 ) ) ( not ( = ?auto_84256 ?auto_84259 ) ) ( not ( = ?auto_84256 ?auto_84260 ) ) ( not ( = ?auto_84257 ?auto_84258 ) ) ( not ( = ?auto_84257 ?auto_84259 ) ) ( not ( = ?auto_84257 ?auto_84260 ) ) ( not ( = ?auto_84258 ?auto_84259 ) ) ( not ( = ?auto_84258 ?auto_84260 ) ) ( not ( = ?auto_84259 ?auto_84260 ) ) ( ON-TABLE ?auto_84260 ) ( ON ?auto_84259 ?auto_84260 ) ( ON ?auto_84254 ?auto_84261 ) ( not ( = ?auto_84254 ?auto_84261 ) ) ( not ( = ?auto_84255 ?auto_84261 ) ) ( not ( = ?auto_84256 ?auto_84261 ) ) ( not ( = ?auto_84257 ?auto_84261 ) ) ( not ( = ?auto_84258 ?auto_84261 ) ) ( not ( = ?auto_84259 ?auto_84261 ) ) ( not ( = ?auto_84260 ?auto_84261 ) ) ( ON ?auto_84255 ?auto_84254 ) ( ON-TABLE ?auto_84261 ) ( ON ?auto_84256 ?auto_84255 ) ( ON ?auto_84257 ?auto_84256 ) ( CLEAR ?auto_84257 ) ( HOLDING ?auto_84258 ) ( CLEAR ?auto_84259 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_84260 ?auto_84259 ?auto_84258 )
      ( MAKE-7PILE ?auto_84254 ?auto_84255 ?auto_84256 ?auto_84257 ?auto_84258 ?auto_84259 ?auto_84260 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84262 - BLOCK
      ?auto_84263 - BLOCK
      ?auto_84264 - BLOCK
      ?auto_84265 - BLOCK
      ?auto_84266 - BLOCK
      ?auto_84267 - BLOCK
      ?auto_84268 - BLOCK
    )
    :vars
    (
      ?auto_84269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84262 ?auto_84263 ) ) ( not ( = ?auto_84262 ?auto_84264 ) ) ( not ( = ?auto_84262 ?auto_84265 ) ) ( not ( = ?auto_84262 ?auto_84266 ) ) ( not ( = ?auto_84262 ?auto_84267 ) ) ( not ( = ?auto_84262 ?auto_84268 ) ) ( not ( = ?auto_84263 ?auto_84264 ) ) ( not ( = ?auto_84263 ?auto_84265 ) ) ( not ( = ?auto_84263 ?auto_84266 ) ) ( not ( = ?auto_84263 ?auto_84267 ) ) ( not ( = ?auto_84263 ?auto_84268 ) ) ( not ( = ?auto_84264 ?auto_84265 ) ) ( not ( = ?auto_84264 ?auto_84266 ) ) ( not ( = ?auto_84264 ?auto_84267 ) ) ( not ( = ?auto_84264 ?auto_84268 ) ) ( not ( = ?auto_84265 ?auto_84266 ) ) ( not ( = ?auto_84265 ?auto_84267 ) ) ( not ( = ?auto_84265 ?auto_84268 ) ) ( not ( = ?auto_84266 ?auto_84267 ) ) ( not ( = ?auto_84266 ?auto_84268 ) ) ( not ( = ?auto_84267 ?auto_84268 ) ) ( ON-TABLE ?auto_84268 ) ( ON ?auto_84267 ?auto_84268 ) ( ON ?auto_84262 ?auto_84269 ) ( not ( = ?auto_84262 ?auto_84269 ) ) ( not ( = ?auto_84263 ?auto_84269 ) ) ( not ( = ?auto_84264 ?auto_84269 ) ) ( not ( = ?auto_84265 ?auto_84269 ) ) ( not ( = ?auto_84266 ?auto_84269 ) ) ( not ( = ?auto_84267 ?auto_84269 ) ) ( not ( = ?auto_84268 ?auto_84269 ) ) ( ON ?auto_84263 ?auto_84262 ) ( ON-TABLE ?auto_84269 ) ( ON ?auto_84264 ?auto_84263 ) ( ON ?auto_84265 ?auto_84264 ) ( CLEAR ?auto_84267 ) ( ON ?auto_84266 ?auto_84265 ) ( CLEAR ?auto_84266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_84269 ?auto_84262 ?auto_84263 ?auto_84264 ?auto_84265 )
      ( MAKE-7PILE ?auto_84262 ?auto_84263 ?auto_84264 ?auto_84265 ?auto_84266 ?auto_84267 ?auto_84268 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84270 - BLOCK
      ?auto_84271 - BLOCK
      ?auto_84272 - BLOCK
      ?auto_84273 - BLOCK
      ?auto_84274 - BLOCK
      ?auto_84275 - BLOCK
      ?auto_84276 - BLOCK
    )
    :vars
    (
      ?auto_84277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84270 ?auto_84271 ) ) ( not ( = ?auto_84270 ?auto_84272 ) ) ( not ( = ?auto_84270 ?auto_84273 ) ) ( not ( = ?auto_84270 ?auto_84274 ) ) ( not ( = ?auto_84270 ?auto_84275 ) ) ( not ( = ?auto_84270 ?auto_84276 ) ) ( not ( = ?auto_84271 ?auto_84272 ) ) ( not ( = ?auto_84271 ?auto_84273 ) ) ( not ( = ?auto_84271 ?auto_84274 ) ) ( not ( = ?auto_84271 ?auto_84275 ) ) ( not ( = ?auto_84271 ?auto_84276 ) ) ( not ( = ?auto_84272 ?auto_84273 ) ) ( not ( = ?auto_84272 ?auto_84274 ) ) ( not ( = ?auto_84272 ?auto_84275 ) ) ( not ( = ?auto_84272 ?auto_84276 ) ) ( not ( = ?auto_84273 ?auto_84274 ) ) ( not ( = ?auto_84273 ?auto_84275 ) ) ( not ( = ?auto_84273 ?auto_84276 ) ) ( not ( = ?auto_84274 ?auto_84275 ) ) ( not ( = ?auto_84274 ?auto_84276 ) ) ( not ( = ?auto_84275 ?auto_84276 ) ) ( ON-TABLE ?auto_84276 ) ( ON ?auto_84270 ?auto_84277 ) ( not ( = ?auto_84270 ?auto_84277 ) ) ( not ( = ?auto_84271 ?auto_84277 ) ) ( not ( = ?auto_84272 ?auto_84277 ) ) ( not ( = ?auto_84273 ?auto_84277 ) ) ( not ( = ?auto_84274 ?auto_84277 ) ) ( not ( = ?auto_84275 ?auto_84277 ) ) ( not ( = ?auto_84276 ?auto_84277 ) ) ( ON ?auto_84271 ?auto_84270 ) ( ON-TABLE ?auto_84277 ) ( ON ?auto_84272 ?auto_84271 ) ( ON ?auto_84273 ?auto_84272 ) ( ON ?auto_84274 ?auto_84273 ) ( CLEAR ?auto_84274 ) ( HOLDING ?auto_84275 ) ( CLEAR ?auto_84276 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_84276 ?auto_84275 )
      ( MAKE-7PILE ?auto_84270 ?auto_84271 ?auto_84272 ?auto_84273 ?auto_84274 ?auto_84275 ?auto_84276 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84278 - BLOCK
      ?auto_84279 - BLOCK
      ?auto_84280 - BLOCK
      ?auto_84281 - BLOCK
      ?auto_84282 - BLOCK
      ?auto_84283 - BLOCK
      ?auto_84284 - BLOCK
    )
    :vars
    (
      ?auto_84285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84278 ?auto_84279 ) ) ( not ( = ?auto_84278 ?auto_84280 ) ) ( not ( = ?auto_84278 ?auto_84281 ) ) ( not ( = ?auto_84278 ?auto_84282 ) ) ( not ( = ?auto_84278 ?auto_84283 ) ) ( not ( = ?auto_84278 ?auto_84284 ) ) ( not ( = ?auto_84279 ?auto_84280 ) ) ( not ( = ?auto_84279 ?auto_84281 ) ) ( not ( = ?auto_84279 ?auto_84282 ) ) ( not ( = ?auto_84279 ?auto_84283 ) ) ( not ( = ?auto_84279 ?auto_84284 ) ) ( not ( = ?auto_84280 ?auto_84281 ) ) ( not ( = ?auto_84280 ?auto_84282 ) ) ( not ( = ?auto_84280 ?auto_84283 ) ) ( not ( = ?auto_84280 ?auto_84284 ) ) ( not ( = ?auto_84281 ?auto_84282 ) ) ( not ( = ?auto_84281 ?auto_84283 ) ) ( not ( = ?auto_84281 ?auto_84284 ) ) ( not ( = ?auto_84282 ?auto_84283 ) ) ( not ( = ?auto_84282 ?auto_84284 ) ) ( not ( = ?auto_84283 ?auto_84284 ) ) ( ON-TABLE ?auto_84284 ) ( ON ?auto_84278 ?auto_84285 ) ( not ( = ?auto_84278 ?auto_84285 ) ) ( not ( = ?auto_84279 ?auto_84285 ) ) ( not ( = ?auto_84280 ?auto_84285 ) ) ( not ( = ?auto_84281 ?auto_84285 ) ) ( not ( = ?auto_84282 ?auto_84285 ) ) ( not ( = ?auto_84283 ?auto_84285 ) ) ( not ( = ?auto_84284 ?auto_84285 ) ) ( ON ?auto_84279 ?auto_84278 ) ( ON-TABLE ?auto_84285 ) ( ON ?auto_84280 ?auto_84279 ) ( ON ?auto_84281 ?auto_84280 ) ( ON ?auto_84282 ?auto_84281 ) ( CLEAR ?auto_84284 ) ( ON ?auto_84283 ?auto_84282 ) ( CLEAR ?auto_84283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_84285 ?auto_84278 ?auto_84279 ?auto_84280 ?auto_84281 ?auto_84282 )
      ( MAKE-7PILE ?auto_84278 ?auto_84279 ?auto_84280 ?auto_84281 ?auto_84282 ?auto_84283 ?auto_84284 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84286 - BLOCK
      ?auto_84287 - BLOCK
      ?auto_84288 - BLOCK
      ?auto_84289 - BLOCK
      ?auto_84290 - BLOCK
      ?auto_84291 - BLOCK
      ?auto_84292 - BLOCK
    )
    :vars
    (
      ?auto_84293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84286 ?auto_84287 ) ) ( not ( = ?auto_84286 ?auto_84288 ) ) ( not ( = ?auto_84286 ?auto_84289 ) ) ( not ( = ?auto_84286 ?auto_84290 ) ) ( not ( = ?auto_84286 ?auto_84291 ) ) ( not ( = ?auto_84286 ?auto_84292 ) ) ( not ( = ?auto_84287 ?auto_84288 ) ) ( not ( = ?auto_84287 ?auto_84289 ) ) ( not ( = ?auto_84287 ?auto_84290 ) ) ( not ( = ?auto_84287 ?auto_84291 ) ) ( not ( = ?auto_84287 ?auto_84292 ) ) ( not ( = ?auto_84288 ?auto_84289 ) ) ( not ( = ?auto_84288 ?auto_84290 ) ) ( not ( = ?auto_84288 ?auto_84291 ) ) ( not ( = ?auto_84288 ?auto_84292 ) ) ( not ( = ?auto_84289 ?auto_84290 ) ) ( not ( = ?auto_84289 ?auto_84291 ) ) ( not ( = ?auto_84289 ?auto_84292 ) ) ( not ( = ?auto_84290 ?auto_84291 ) ) ( not ( = ?auto_84290 ?auto_84292 ) ) ( not ( = ?auto_84291 ?auto_84292 ) ) ( ON ?auto_84286 ?auto_84293 ) ( not ( = ?auto_84286 ?auto_84293 ) ) ( not ( = ?auto_84287 ?auto_84293 ) ) ( not ( = ?auto_84288 ?auto_84293 ) ) ( not ( = ?auto_84289 ?auto_84293 ) ) ( not ( = ?auto_84290 ?auto_84293 ) ) ( not ( = ?auto_84291 ?auto_84293 ) ) ( not ( = ?auto_84292 ?auto_84293 ) ) ( ON ?auto_84287 ?auto_84286 ) ( ON-TABLE ?auto_84293 ) ( ON ?auto_84288 ?auto_84287 ) ( ON ?auto_84289 ?auto_84288 ) ( ON ?auto_84290 ?auto_84289 ) ( ON ?auto_84291 ?auto_84290 ) ( CLEAR ?auto_84291 ) ( HOLDING ?auto_84292 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_84292 )
      ( MAKE-7PILE ?auto_84286 ?auto_84287 ?auto_84288 ?auto_84289 ?auto_84290 ?auto_84291 ?auto_84292 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_84294 - BLOCK
      ?auto_84295 - BLOCK
      ?auto_84296 - BLOCK
      ?auto_84297 - BLOCK
      ?auto_84298 - BLOCK
      ?auto_84299 - BLOCK
      ?auto_84300 - BLOCK
    )
    :vars
    (
      ?auto_84301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84294 ?auto_84295 ) ) ( not ( = ?auto_84294 ?auto_84296 ) ) ( not ( = ?auto_84294 ?auto_84297 ) ) ( not ( = ?auto_84294 ?auto_84298 ) ) ( not ( = ?auto_84294 ?auto_84299 ) ) ( not ( = ?auto_84294 ?auto_84300 ) ) ( not ( = ?auto_84295 ?auto_84296 ) ) ( not ( = ?auto_84295 ?auto_84297 ) ) ( not ( = ?auto_84295 ?auto_84298 ) ) ( not ( = ?auto_84295 ?auto_84299 ) ) ( not ( = ?auto_84295 ?auto_84300 ) ) ( not ( = ?auto_84296 ?auto_84297 ) ) ( not ( = ?auto_84296 ?auto_84298 ) ) ( not ( = ?auto_84296 ?auto_84299 ) ) ( not ( = ?auto_84296 ?auto_84300 ) ) ( not ( = ?auto_84297 ?auto_84298 ) ) ( not ( = ?auto_84297 ?auto_84299 ) ) ( not ( = ?auto_84297 ?auto_84300 ) ) ( not ( = ?auto_84298 ?auto_84299 ) ) ( not ( = ?auto_84298 ?auto_84300 ) ) ( not ( = ?auto_84299 ?auto_84300 ) ) ( ON ?auto_84294 ?auto_84301 ) ( not ( = ?auto_84294 ?auto_84301 ) ) ( not ( = ?auto_84295 ?auto_84301 ) ) ( not ( = ?auto_84296 ?auto_84301 ) ) ( not ( = ?auto_84297 ?auto_84301 ) ) ( not ( = ?auto_84298 ?auto_84301 ) ) ( not ( = ?auto_84299 ?auto_84301 ) ) ( not ( = ?auto_84300 ?auto_84301 ) ) ( ON ?auto_84295 ?auto_84294 ) ( ON-TABLE ?auto_84301 ) ( ON ?auto_84296 ?auto_84295 ) ( ON ?auto_84297 ?auto_84296 ) ( ON ?auto_84298 ?auto_84297 ) ( ON ?auto_84299 ?auto_84298 ) ( ON ?auto_84300 ?auto_84299 ) ( CLEAR ?auto_84300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_84301 ?auto_84294 ?auto_84295 ?auto_84296 ?auto_84297 ?auto_84298 ?auto_84299 )
      ( MAKE-7PILE ?auto_84294 ?auto_84295 ?auto_84296 ?auto_84297 ?auto_84298 ?auto_84299 ?auto_84300 ) )
  )

)

