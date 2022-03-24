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
      ?auto_23293 - BLOCK
    )
    :vars
    (
      ?auto_23294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23293 ?auto_23294 ) ( CLEAR ?auto_23293 ) ( HAND-EMPTY ) ( not ( = ?auto_23293 ?auto_23294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23293 ?auto_23294 )
      ( !PUTDOWN ?auto_23293 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23300 - BLOCK
      ?auto_23301 - BLOCK
    )
    :vars
    (
      ?auto_23302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23300 ) ( ON ?auto_23301 ?auto_23302 ) ( CLEAR ?auto_23301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23300 ) ( not ( = ?auto_23300 ?auto_23301 ) ) ( not ( = ?auto_23300 ?auto_23302 ) ) ( not ( = ?auto_23301 ?auto_23302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23301 ?auto_23302 )
      ( !STACK ?auto_23301 ?auto_23300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_23310 - BLOCK
      ?auto_23311 - BLOCK
    )
    :vars
    (
      ?auto_23312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23311 ?auto_23312 ) ( not ( = ?auto_23310 ?auto_23311 ) ) ( not ( = ?auto_23310 ?auto_23312 ) ) ( not ( = ?auto_23311 ?auto_23312 ) ) ( ON ?auto_23310 ?auto_23311 ) ( CLEAR ?auto_23310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23310 )
      ( MAKE-2PILE ?auto_23310 ?auto_23311 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23321 - BLOCK
      ?auto_23322 - BLOCK
      ?auto_23323 - BLOCK
    )
    :vars
    (
      ?auto_23324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23322 ) ( ON ?auto_23323 ?auto_23324 ) ( CLEAR ?auto_23323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23321 ) ( ON ?auto_23322 ?auto_23321 ) ( not ( = ?auto_23321 ?auto_23322 ) ) ( not ( = ?auto_23321 ?auto_23323 ) ) ( not ( = ?auto_23321 ?auto_23324 ) ) ( not ( = ?auto_23322 ?auto_23323 ) ) ( not ( = ?auto_23322 ?auto_23324 ) ) ( not ( = ?auto_23323 ?auto_23324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23323 ?auto_23324 )
      ( !STACK ?auto_23323 ?auto_23322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23335 - BLOCK
      ?auto_23336 - BLOCK
      ?auto_23337 - BLOCK
    )
    :vars
    (
      ?auto_23338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23337 ?auto_23338 ) ( ON-TABLE ?auto_23335 ) ( not ( = ?auto_23335 ?auto_23336 ) ) ( not ( = ?auto_23335 ?auto_23337 ) ) ( not ( = ?auto_23335 ?auto_23338 ) ) ( not ( = ?auto_23336 ?auto_23337 ) ) ( not ( = ?auto_23336 ?auto_23338 ) ) ( not ( = ?auto_23337 ?auto_23338 ) ) ( CLEAR ?auto_23335 ) ( ON ?auto_23336 ?auto_23337 ) ( CLEAR ?auto_23336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23335 ?auto_23336 )
      ( MAKE-3PILE ?auto_23335 ?auto_23336 ?auto_23337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_23349 - BLOCK
      ?auto_23350 - BLOCK
      ?auto_23351 - BLOCK
    )
    :vars
    (
      ?auto_23352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23351 ?auto_23352 ) ( not ( = ?auto_23349 ?auto_23350 ) ) ( not ( = ?auto_23349 ?auto_23351 ) ) ( not ( = ?auto_23349 ?auto_23352 ) ) ( not ( = ?auto_23350 ?auto_23351 ) ) ( not ( = ?auto_23350 ?auto_23352 ) ) ( not ( = ?auto_23351 ?auto_23352 ) ) ( ON ?auto_23350 ?auto_23351 ) ( ON ?auto_23349 ?auto_23350 ) ( CLEAR ?auto_23349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23349 )
      ( MAKE-3PILE ?auto_23349 ?auto_23350 ?auto_23351 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23364 - BLOCK
      ?auto_23365 - BLOCK
      ?auto_23366 - BLOCK
      ?auto_23367 - BLOCK
    )
    :vars
    (
      ?auto_23368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23366 ) ( ON ?auto_23367 ?auto_23368 ) ( CLEAR ?auto_23367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23364 ) ( ON ?auto_23365 ?auto_23364 ) ( ON ?auto_23366 ?auto_23365 ) ( not ( = ?auto_23364 ?auto_23365 ) ) ( not ( = ?auto_23364 ?auto_23366 ) ) ( not ( = ?auto_23364 ?auto_23367 ) ) ( not ( = ?auto_23364 ?auto_23368 ) ) ( not ( = ?auto_23365 ?auto_23366 ) ) ( not ( = ?auto_23365 ?auto_23367 ) ) ( not ( = ?auto_23365 ?auto_23368 ) ) ( not ( = ?auto_23366 ?auto_23367 ) ) ( not ( = ?auto_23366 ?auto_23368 ) ) ( not ( = ?auto_23367 ?auto_23368 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23367 ?auto_23368 )
      ( !STACK ?auto_23367 ?auto_23366 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23382 - BLOCK
      ?auto_23383 - BLOCK
      ?auto_23384 - BLOCK
      ?auto_23385 - BLOCK
    )
    :vars
    (
      ?auto_23386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23385 ?auto_23386 ) ( ON-TABLE ?auto_23382 ) ( ON ?auto_23383 ?auto_23382 ) ( not ( = ?auto_23382 ?auto_23383 ) ) ( not ( = ?auto_23382 ?auto_23384 ) ) ( not ( = ?auto_23382 ?auto_23385 ) ) ( not ( = ?auto_23382 ?auto_23386 ) ) ( not ( = ?auto_23383 ?auto_23384 ) ) ( not ( = ?auto_23383 ?auto_23385 ) ) ( not ( = ?auto_23383 ?auto_23386 ) ) ( not ( = ?auto_23384 ?auto_23385 ) ) ( not ( = ?auto_23384 ?auto_23386 ) ) ( not ( = ?auto_23385 ?auto_23386 ) ) ( CLEAR ?auto_23383 ) ( ON ?auto_23384 ?auto_23385 ) ( CLEAR ?auto_23384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23382 ?auto_23383 ?auto_23384 )
      ( MAKE-4PILE ?auto_23382 ?auto_23383 ?auto_23384 ?auto_23385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23400 - BLOCK
      ?auto_23401 - BLOCK
      ?auto_23402 - BLOCK
      ?auto_23403 - BLOCK
    )
    :vars
    (
      ?auto_23404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23403 ?auto_23404 ) ( ON-TABLE ?auto_23400 ) ( not ( = ?auto_23400 ?auto_23401 ) ) ( not ( = ?auto_23400 ?auto_23402 ) ) ( not ( = ?auto_23400 ?auto_23403 ) ) ( not ( = ?auto_23400 ?auto_23404 ) ) ( not ( = ?auto_23401 ?auto_23402 ) ) ( not ( = ?auto_23401 ?auto_23403 ) ) ( not ( = ?auto_23401 ?auto_23404 ) ) ( not ( = ?auto_23402 ?auto_23403 ) ) ( not ( = ?auto_23402 ?auto_23404 ) ) ( not ( = ?auto_23403 ?auto_23404 ) ) ( ON ?auto_23402 ?auto_23403 ) ( CLEAR ?auto_23400 ) ( ON ?auto_23401 ?auto_23402 ) ( CLEAR ?auto_23401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23400 ?auto_23401 )
      ( MAKE-4PILE ?auto_23400 ?auto_23401 ?auto_23402 ?auto_23403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_23418 - BLOCK
      ?auto_23419 - BLOCK
      ?auto_23420 - BLOCK
      ?auto_23421 - BLOCK
    )
    :vars
    (
      ?auto_23422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23421 ?auto_23422 ) ( not ( = ?auto_23418 ?auto_23419 ) ) ( not ( = ?auto_23418 ?auto_23420 ) ) ( not ( = ?auto_23418 ?auto_23421 ) ) ( not ( = ?auto_23418 ?auto_23422 ) ) ( not ( = ?auto_23419 ?auto_23420 ) ) ( not ( = ?auto_23419 ?auto_23421 ) ) ( not ( = ?auto_23419 ?auto_23422 ) ) ( not ( = ?auto_23420 ?auto_23421 ) ) ( not ( = ?auto_23420 ?auto_23422 ) ) ( not ( = ?auto_23421 ?auto_23422 ) ) ( ON ?auto_23420 ?auto_23421 ) ( ON ?auto_23419 ?auto_23420 ) ( ON ?auto_23418 ?auto_23419 ) ( CLEAR ?auto_23418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23418 )
      ( MAKE-4PILE ?auto_23418 ?auto_23419 ?auto_23420 ?auto_23421 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23437 - BLOCK
      ?auto_23438 - BLOCK
      ?auto_23439 - BLOCK
      ?auto_23440 - BLOCK
      ?auto_23441 - BLOCK
    )
    :vars
    (
      ?auto_23442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23440 ) ( ON ?auto_23441 ?auto_23442 ) ( CLEAR ?auto_23441 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23437 ) ( ON ?auto_23438 ?auto_23437 ) ( ON ?auto_23439 ?auto_23438 ) ( ON ?auto_23440 ?auto_23439 ) ( not ( = ?auto_23437 ?auto_23438 ) ) ( not ( = ?auto_23437 ?auto_23439 ) ) ( not ( = ?auto_23437 ?auto_23440 ) ) ( not ( = ?auto_23437 ?auto_23441 ) ) ( not ( = ?auto_23437 ?auto_23442 ) ) ( not ( = ?auto_23438 ?auto_23439 ) ) ( not ( = ?auto_23438 ?auto_23440 ) ) ( not ( = ?auto_23438 ?auto_23441 ) ) ( not ( = ?auto_23438 ?auto_23442 ) ) ( not ( = ?auto_23439 ?auto_23440 ) ) ( not ( = ?auto_23439 ?auto_23441 ) ) ( not ( = ?auto_23439 ?auto_23442 ) ) ( not ( = ?auto_23440 ?auto_23441 ) ) ( not ( = ?auto_23440 ?auto_23442 ) ) ( not ( = ?auto_23441 ?auto_23442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23441 ?auto_23442 )
      ( !STACK ?auto_23441 ?auto_23440 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23459 - BLOCK
      ?auto_23460 - BLOCK
      ?auto_23461 - BLOCK
      ?auto_23462 - BLOCK
      ?auto_23463 - BLOCK
    )
    :vars
    (
      ?auto_23464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23463 ?auto_23464 ) ( ON-TABLE ?auto_23459 ) ( ON ?auto_23460 ?auto_23459 ) ( ON ?auto_23461 ?auto_23460 ) ( not ( = ?auto_23459 ?auto_23460 ) ) ( not ( = ?auto_23459 ?auto_23461 ) ) ( not ( = ?auto_23459 ?auto_23462 ) ) ( not ( = ?auto_23459 ?auto_23463 ) ) ( not ( = ?auto_23459 ?auto_23464 ) ) ( not ( = ?auto_23460 ?auto_23461 ) ) ( not ( = ?auto_23460 ?auto_23462 ) ) ( not ( = ?auto_23460 ?auto_23463 ) ) ( not ( = ?auto_23460 ?auto_23464 ) ) ( not ( = ?auto_23461 ?auto_23462 ) ) ( not ( = ?auto_23461 ?auto_23463 ) ) ( not ( = ?auto_23461 ?auto_23464 ) ) ( not ( = ?auto_23462 ?auto_23463 ) ) ( not ( = ?auto_23462 ?auto_23464 ) ) ( not ( = ?auto_23463 ?auto_23464 ) ) ( CLEAR ?auto_23461 ) ( ON ?auto_23462 ?auto_23463 ) ( CLEAR ?auto_23462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23459 ?auto_23460 ?auto_23461 ?auto_23462 )
      ( MAKE-5PILE ?auto_23459 ?auto_23460 ?auto_23461 ?auto_23462 ?auto_23463 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23481 - BLOCK
      ?auto_23482 - BLOCK
      ?auto_23483 - BLOCK
      ?auto_23484 - BLOCK
      ?auto_23485 - BLOCK
    )
    :vars
    (
      ?auto_23486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23485 ?auto_23486 ) ( ON-TABLE ?auto_23481 ) ( ON ?auto_23482 ?auto_23481 ) ( not ( = ?auto_23481 ?auto_23482 ) ) ( not ( = ?auto_23481 ?auto_23483 ) ) ( not ( = ?auto_23481 ?auto_23484 ) ) ( not ( = ?auto_23481 ?auto_23485 ) ) ( not ( = ?auto_23481 ?auto_23486 ) ) ( not ( = ?auto_23482 ?auto_23483 ) ) ( not ( = ?auto_23482 ?auto_23484 ) ) ( not ( = ?auto_23482 ?auto_23485 ) ) ( not ( = ?auto_23482 ?auto_23486 ) ) ( not ( = ?auto_23483 ?auto_23484 ) ) ( not ( = ?auto_23483 ?auto_23485 ) ) ( not ( = ?auto_23483 ?auto_23486 ) ) ( not ( = ?auto_23484 ?auto_23485 ) ) ( not ( = ?auto_23484 ?auto_23486 ) ) ( not ( = ?auto_23485 ?auto_23486 ) ) ( ON ?auto_23484 ?auto_23485 ) ( CLEAR ?auto_23482 ) ( ON ?auto_23483 ?auto_23484 ) ( CLEAR ?auto_23483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23481 ?auto_23482 ?auto_23483 )
      ( MAKE-5PILE ?auto_23481 ?auto_23482 ?auto_23483 ?auto_23484 ?auto_23485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23503 - BLOCK
      ?auto_23504 - BLOCK
      ?auto_23505 - BLOCK
      ?auto_23506 - BLOCK
      ?auto_23507 - BLOCK
    )
    :vars
    (
      ?auto_23508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23507 ?auto_23508 ) ( ON-TABLE ?auto_23503 ) ( not ( = ?auto_23503 ?auto_23504 ) ) ( not ( = ?auto_23503 ?auto_23505 ) ) ( not ( = ?auto_23503 ?auto_23506 ) ) ( not ( = ?auto_23503 ?auto_23507 ) ) ( not ( = ?auto_23503 ?auto_23508 ) ) ( not ( = ?auto_23504 ?auto_23505 ) ) ( not ( = ?auto_23504 ?auto_23506 ) ) ( not ( = ?auto_23504 ?auto_23507 ) ) ( not ( = ?auto_23504 ?auto_23508 ) ) ( not ( = ?auto_23505 ?auto_23506 ) ) ( not ( = ?auto_23505 ?auto_23507 ) ) ( not ( = ?auto_23505 ?auto_23508 ) ) ( not ( = ?auto_23506 ?auto_23507 ) ) ( not ( = ?auto_23506 ?auto_23508 ) ) ( not ( = ?auto_23507 ?auto_23508 ) ) ( ON ?auto_23506 ?auto_23507 ) ( ON ?auto_23505 ?auto_23506 ) ( CLEAR ?auto_23503 ) ( ON ?auto_23504 ?auto_23505 ) ( CLEAR ?auto_23504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23503 ?auto_23504 )
      ( MAKE-5PILE ?auto_23503 ?auto_23504 ?auto_23505 ?auto_23506 ?auto_23507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_23525 - BLOCK
      ?auto_23526 - BLOCK
      ?auto_23527 - BLOCK
      ?auto_23528 - BLOCK
      ?auto_23529 - BLOCK
    )
    :vars
    (
      ?auto_23530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23529 ?auto_23530 ) ( not ( = ?auto_23525 ?auto_23526 ) ) ( not ( = ?auto_23525 ?auto_23527 ) ) ( not ( = ?auto_23525 ?auto_23528 ) ) ( not ( = ?auto_23525 ?auto_23529 ) ) ( not ( = ?auto_23525 ?auto_23530 ) ) ( not ( = ?auto_23526 ?auto_23527 ) ) ( not ( = ?auto_23526 ?auto_23528 ) ) ( not ( = ?auto_23526 ?auto_23529 ) ) ( not ( = ?auto_23526 ?auto_23530 ) ) ( not ( = ?auto_23527 ?auto_23528 ) ) ( not ( = ?auto_23527 ?auto_23529 ) ) ( not ( = ?auto_23527 ?auto_23530 ) ) ( not ( = ?auto_23528 ?auto_23529 ) ) ( not ( = ?auto_23528 ?auto_23530 ) ) ( not ( = ?auto_23529 ?auto_23530 ) ) ( ON ?auto_23528 ?auto_23529 ) ( ON ?auto_23527 ?auto_23528 ) ( ON ?auto_23526 ?auto_23527 ) ( ON ?auto_23525 ?auto_23526 ) ( CLEAR ?auto_23525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23525 )
      ( MAKE-5PILE ?auto_23525 ?auto_23526 ?auto_23527 ?auto_23528 ?auto_23529 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23548 - BLOCK
      ?auto_23549 - BLOCK
      ?auto_23550 - BLOCK
      ?auto_23551 - BLOCK
      ?auto_23552 - BLOCK
      ?auto_23553 - BLOCK
    )
    :vars
    (
      ?auto_23554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23552 ) ( ON ?auto_23553 ?auto_23554 ) ( CLEAR ?auto_23553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23548 ) ( ON ?auto_23549 ?auto_23548 ) ( ON ?auto_23550 ?auto_23549 ) ( ON ?auto_23551 ?auto_23550 ) ( ON ?auto_23552 ?auto_23551 ) ( not ( = ?auto_23548 ?auto_23549 ) ) ( not ( = ?auto_23548 ?auto_23550 ) ) ( not ( = ?auto_23548 ?auto_23551 ) ) ( not ( = ?auto_23548 ?auto_23552 ) ) ( not ( = ?auto_23548 ?auto_23553 ) ) ( not ( = ?auto_23548 ?auto_23554 ) ) ( not ( = ?auto_23549 ?auto_23550 ) ) ( not ( = ?auto_23549 ?auto_23551 ) ) ( not ( = ?auto_23549 ?auto_23552 ) ) ( not ( = ?auto_23549 ?auto_23553 ) ) ( not ( = ?auto_23549 ?auto_23554 ) ) ( not ( = ?auto_23550 ?auto_23551 ) ) ( not ( = ?auto_23550 ?auto_23552 ) ) ( not ( = ?auto_23550 ?auto_23553 ) ) ( not ( = ?auto_23550 ?auto_23554 ) ) ( not ( = ?auto_23551 ?auto_23552 ) ) ( not ( = ?auto_23551 ?auto_23553 ) ) ( not ( = ?auto_23551 ?auto_23554 ) ) ( not ( = ?auto_23552 ?auto_23553 ) ) ( not ( = ?auto_23552 ?auto_23554 ) ) ( not ( = ?auto_23553 ?auto_23554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23553 ?auto_23554 )
      ( !STACK ?auto_23553 ?auto_23552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23574 - BLOCK
      ?auto_23575 - BLOCK
      ?auto_23576 - BLOCK
      ?auto_23577 - BLOCK
      ?auto_23578 - BLOCK
      ?auto_23579 - BLOCK
    )
    :vars
    (
      ?auto_23580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23579 ?auto_23580 ) ( ON-TABLE ?auto_23574 ) ( ON ?auto_23575 ?auto_23574 ) ( ON ?auto_23576 ?auto_23575 ) ( ON ?auto_23577 ?auto_23576 ) ( not ( = ?auto_23574 ?auto_23575 ) ) ( not ( = ?auto_23574 ?auto_23576 ) ) ( not ( = ?auto_23574 ?auto_23577 ) ) ( not ( = ?auto_23574 ?auto_23578 ) ) ( not ( = ?auto_23574 ?auto_23579 ) ) ( not ( = ?auto_23574 ?auto_23580 ) ) ( not ( = ?auto_23575 ?auto_23576 ) ) ( not ( = ?auto_23575 ?auto_23577 ) ) ( not ( = ?auto_23575 ?auto_23578 ) ) ( not ( = ?auto_23575 ?auto_23579 ) ) ( not ( = ?auto_23575 ?auto_23580 ) ) ( not ( = ?auto_23576 ?auto_23577 ) ) ( not ( = ?auto_23576 ?auto_23578 ) ) ( not ( = ?auto_23576 ?auto_23579 ) ) ( not ( = ?auto_23576 ?auto_23580 ) ) ( not ( = ?auto_23577 ?auto_23578 ) ) ( not ( = ?auto_23577 ?auto_23579 ) ) ( not ( = ?auto_23577 ?auto_23580 ) ) ( not ( = ?auto_23578 ?auto_23579 ) ) ( not ( = ?auto_23578 ?auto_23580 ) ) ( not ( = ?auto_23579 ?auto_23580 ) ) ( CLEAR ?auto_23577 ) ( ON ?auto_23578 ?auto_23579 ) ( CLEAR ?auto_23578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23574 ?auto_23575 ?auto_23576 ?auto_23577 ?auto_23578 )
      ( MAKE-6PILE ?auto_23574 ?auto_23575 ?auto_23576 ?auto_23577 ?auto_23578 ?auto_23579 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23600 - BLOCK
      ?auto_23601 - BLOCK
      ?auto_23602 - BLOCK
      ?auto_23603 - BLOCK
      ?auto_23604 - BLOCK
      ?auto_23605 - BLOCK
    )
    :vars
    (
      ?auto_23606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23605 ?auto_23606 ) ( ON-TABLE ?auto_23600 ) ( ON ?auto_23601 ?auto_23600 ) ( ON ?auto_23602 ?auto_23601 ) ( not ( = ?auto_23600 ?auto_23601 ) ) ( not ( = ?auto_23600 ?auto_23602 ) ) ( not ( = ?auto_23600 ?auto_23603 ) ) ( not ( = ?auto_23600 ?auto_23604 ) ) ( not ( = ?auto_23600 ?auto_23605 ) ) ( not ( = ?auto_23600 ?auto_23606 ) ) ( not ( = ?auto_23601 ?auto_23602 ) ) ( not ( = ?auto_23601 ?auto_23603 ) ) ( not ( = ?auto_23601 ?auto_23604 ) ) ( not ( = ?auto_23601 ?auto_23605 ) ) ( not ( = ?auto_23601 ?auto_23606 ) ) ( not ( = ?auto_23602 ?auto_23603 ) ) ( not ( = ?auto_23602 ?auto_23604 ) ) ( not ( = ?auto_23602 ?auto_23605 ) ) ( not ( = ?auto_23602 ?auto_23606 ) ) ( not ( = ?auto_23603 ?auto_23604 ) ) ( not ( = ?auto_23603 ?auto_23605 ) ) ( not ( = ?auto_23603 ?auto_23606 ) ) ( not ( = ?auto_23604 ?auto_23605 ) ) ( not ( = ?auto_23604 ?auto_23606 ) ) ( not ( = ?auto_23605 ?auto_23606 ) ) ( ON ?auto_23604 ?auto_23605 ) ( CLEAR ?auto_23602 ) ( ON ?auto_23603 ?auto_23604 ) ( CLEAR ?auto_23603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23600 ?auto_23601 ?auto_23602 ?auto_23603 )
      ( MAKE-6PILE ?auto_23600 ?auto_23601 ?auto_23602 ?auto_23603 ?auto_23604 ?auto_23605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23626 - BLOCK
      ?auto_23627 - BLOCK
      ?auto_23628 - BLOCK
      ?auto_23629 - BLOCK
      ?auto_23630 - BLOCK
      ?auto_23631 - BLOCK
    )
    :vars
    (
      ?auto_23632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23631 ?auto_23632 ) ( ON-TABLE ?auto_23626 ) ( ON ?auto_23627 ?auto_23626 ) ( not ( = ?auto_23626 ?auto_23627 ) ) ( not ( = ?auto_23626 ?auto_23628 ) ) ( not ( = ?auto_23626 ?auto_23629 ) ) ( not ( = ?auto_23626 ?auto_23630 ) ) ( not ( = ?auto_23626 ?auto_23631 ) ) ( not ( = ?auto_23626 ?auto_23632 ) ) ( not ( = ?auto_23627 ?auto_23628 ) ) ( not ( = ?auto_23627 ?auto_23629 ) ) ( not ( = ?auto_23627 ?auto_23630 ) ) ( not ( = ?auto_23627 ?auto_23631 ) ) ( not ( = ?auto_23627 ?auto_23632 ) ) ( not ( = ?auto_23628 ?auto_23629 ) ) ( not ( = ?auto_23628 ?auto_23630 ) ) ( not ( = ?auto_23628 ?auto_23631 ) ) ( not ( = ?auto_23628 ?auto_23632 ) ) ( not ( = ?auto_23629 ?auto_23630 ) ) ( not ( = ?auto_23629 ?auto_23631 ) ) ( not ( = ?auto_23629 ?auto_23632 ) ) ( not ( = ?auto_23630 ?auto_23631 ) ) ( not ( = ?auto_23630 ?auto_23632 ) ) ( not ( = ?auto_23631 ?auto_23632 ) ) ( ON ?auto_23630 ?auto_23631 ) ( ON ?auto_23629 ?auto_23630 ) ( CLEAR ?auto_23627 ) ( ON ?auto_23628 ?auto_23629 ) ( CLEAR ?auto_23628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23626 ?auto_23627 ?auto_23628 )
      ( MAKE-6PILE ?auto_23626 ?auto_23627 ?auto_23628 ?auto_23629 ?auto_23630 ?auto_23631 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23652 - BLOCK
      ?auto_23653 - BLOCK
      ?auto_23654 - BLOCK
      ?auto_23655 - BLOCK
      ?auto_23656 - BLOCK
      ?auto_23657 - BLOCK
    )
    :vars
    (
      ?auto_23658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23657 ?auto_23658 ) ( ON-TABLE ?auto_23652 ) ( not ( = ?auto_23652 ?auto_23653 ) ) ( not ( = ?auto_23652 ?auto_23654 ) ) ( not ( = ?auto_23652 ?auto_23655 ) ) ( not ( = ?auto_23652 ?auto_23656 ) ) ( not ( = ?auto_23652 ?auto_23657 ) ) ( not ( = ?auto_23652 ?auto_23658 ) ) ( not ( = ?auto_23653 ?auto_23654 ) ) ( not ( = ?auto_23653 ?auto_23655 ) ) ( not ( = ?auto_23653 ?auto_23656 ) ) ( not ( = ?auto_23653 ?auto_23657 ) ) ( not ( = ?auto_23653 ?auto_23658 ) ) ( not ( = ?auto_23654 ?auto_23655 ) ) ( not ( = ?auto_23654 ?auto_23656 ) ) ( not ( = ?auto_23654 ?auto_23657 ) ) ( not ( = ?auto_23654 ?auto_23658 ) ) ( not ( = ?auto_23655 ?auto_23656 ) ) ( not ( = ?auto_23655 ?auto_23657 ) ) ( not ( = ?auto_23655 ?auto_23658 ) ) ( not ( = ?auto_23656 ?auto_23657 ) ) ( not ( = ?auto_23656 ?auto_23658 ) ) ( not ( = ?auto_23657 ?auto_23658 ) ) ( ON ?auto_23656 ?auto_23657 ) ( ON ?auto_23655 ?auto_23656 ) ( ON ?auto_23654 ?auto_23655 ) ( CLEAR ?auto_23652 ) ( ON ?auto_23653 ?auto_23654 ) ( CLEAR ?auto_23653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23652 ?auto_23653 )
      ( MAKE-6PILE ?auto_23652 ?auto_23653 ?auto_23654 ?auto_23655 ?auto_23656 ?auto_23657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_23678 - BLOCK
      ?auto_23679 - BLOCK
      ?auto_23680 - BLOCK
      ?auto_23681 - BLOCK
      ?auto_23682 - BLOCK
      ?auto_23683 - BLOCK
    )
    :vars
    (
      ?auto_23684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23683 ?auto_23684 ) ( not ( = ?auto_23678 ?auto_23679 ) ) ( not ( = ?auto_23678 ?auto_23680 ) ) ( not ( = ?auto_23678 ?auto_23681 ) ) ( not ( = ?auto_23678 ?auto_23682 ) ) ( not ( = ?auto_23678 ?auto_23683 ) ) ( not ( = ?auto_23678 ?auto_23684 ) ) ( not ( = ?auto_23679 ?auto_23680 ) ) ( not ( = ?auto_23679 ?auto_23681 ) ) ( not ( = ?auto_23679 ?auto_23682 ) ) ( not ( = ?auto_23679 ?auto_23683 ) ) ( not ( = ?auto_23679 ?auto_23684 ) ) ( not ( = ?auto_23680 ?auto_23681 ) ) ( not ( = ?auto_23680 ?auto_23682 ) ) ( not ( = ?auto_23680 ?auto_23683 ) ) ( not ( = ?auto_23680 ?auto_23684 ) ) ( not ( = ?auto_23681 ?auto_23682 ) ) ( not ( = ?auto_23681 ?auto_23683 ) ) ( not ( = ?auto_23681 ?auto_23684 ) ) ( not ( = ?auto_23682 ?auto_23683 ) ) ( not ( = ?auto_23682 ?auto_23684 ) ) ( not ( = ?auto_23683 ?auto_23684 ) ) ( ON ?auto_23682 ?auto_23683 ) ( ON ?auto_23681 ?auto_23682 ) ( ON ?auto_23680 ?auto_23681 ) ( ON ?auto_23679 ?auto_23680 ) ( ON ?auto_23678 ?auto_23679 ) ( CLEAR ?auto_23678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23678 )
      ( MAKE-6PILE ?auto_23678 ?auto_23679 ?auto_23680 ?auto_23681 ?auto_23682 ?auto_23683 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23705 - BLOCK
      ?auto_23706 - BLOCK
      ?auto_23707 - BLOCK
      ?auto_23708 - BLOCK
      ?auto_23709 - BLOCK
      ?auto_23710 - BLOCK
      ?auto_23711 - BLOCK
    )
    :vars
    (
      ?auto_23712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23710 ) ( ON ?auto_23711 ?auto_23712 ) ( CLEAR ?auto_23711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23705 ) ( ON ?auto_23706 ?auto_23705 ) ( ON ?auto_23707 ?auto_23706 ) ( ON ?auto_23708 ?auto_23707 ) ( ON ?auto_23709 ?auto_23708 ) ( ON ?auto_23710 ?auto_23709 ) ( not ( = ?auto_23705 ?auto_23706 ) ) ( not ( = ?auto_23705 ?auto_23707 ) ) ( not ( = ?auto_23705 ?auto_23708 ) ) ( not ( = ?auto_23705 ?auto_23709 ) ) ( not ( = ?auto_23705 ?auto_23710 ) ) ( not ( = ?auto_23705 ?auto_23711 ) ) ( not ( = ?auto_23705 ?auto_23712 ) ) ( not ( = ?auto_23706 ?auto_23707 ) ) ( not ( = ?auto_23706 ?auto_23708 ) ) ( not ( = ?auto_23706 ?auto_23709 ) ) ( not ( = ?auto_23706 ?auto_23710 ) ) ( not ( = ?auto_23706 ?auto_23711 ) ) ( not ( = ?auto_23706 ?auto_23712 ) ) ( not ( = ?auto_23707 ?auto_23708 ) ) ( not ( = ?auto_23707 ?auto_23709 ) ) ( not ( = ?auto_23707 ?auto_23710 ) ) ( not ( = ?auto_23707 ?auto_23711 ) ) ( not ( = ?auto_23707 ?auto_23712 ) ) ( not ( = ?auto_23708 ?auto_23709 ) ) ( not ( = ?auto_23708 ?auto_23710 ) ) ( not ( = ?auto_23708 ?auto_23711 ) ) ( not ( = ?auto_23708 ?auto_23712 ) ) ( not ( = ?auto_23709 ?auto_23710 ) ) ( not ( = ?auto_23709 ?auto_23711 ) ) ( not ( = ?auto_23709 ?auto_23712 ) ) ( not ( = ?auto_23710 ?auto_23711 ) ) ( not ( = ?auto_23710 ?auto_23712 ) ) ( not ( = ?auto_23711 ?auto_23712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23711 ?auto_23712 )
      ( !STACK ?auto_23711 ?auto_23710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23720 - BLOCK
      ?auto_23721 - BLOCK
      ?auto_23722 - BLOCK
      ?auto_23723 - BLOCK
      ?auto_23724 - BLOCK
      ?auto_23725 - BLOCK
      ?auto_23726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_23725 ) ( ON-TABLE ?auto_23726 ) ( CLEAR ?auto_23726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_23720 ) ( ON ?auto_23721 ?auto_23720 ) ( ON ?auto_23722 ?auto_23721 ) ( ON ?auto_23723 ?auto_23722 ) ( ON ?auto_23724 ?auto_23723 ) ( ON ?auto_23725 ?auto_23724 ) ( not ( = ?auto_23720 ?auto_23721 ) ) ( not ( = ?auto_23720 ?auto_23722 ) ) ( not ( = ?auto_23720 ?auto_23723 ) ) ( not ( = ?auto_23720 ?auto_23724 ) ) ( not ( = ?auto_23720 ?auto_23725 ) ) ( not ( = ?auto_23720 ?auto_23726 ) ) ( not ( = ?auto_23721 ?auto_23722 ) ) ( not ( = ?auto_23721 ?auto_23723 ) ) ( not ( = ?auto_23721 ?auto_23724 ) ) ( not ( = ?auto_23721 ?auto_23725 ) ) ( not ( = ?auto_23721 ?auto_23726 ) ) ( not ( = ?auto_23722 ?auto_23723 ) ) ( not ( = ?auto_23722 ?auto_23724 ) ) ( not ( = ?auto_23722 ?auto_23725 ) ) ( not ( = ?auto_23722 ?auto_23726 ) ) ( not ( = ?auto_23723 ?auto_23724 ) ) ( not ( = ?auto_23723 ?auto_23725 ) ) ( not ( = ?auto_23723 ?auto_23726 ) ) ( not ( = ?auto_23724 ?auto_23725 ) ) ( not ( = ?auto_23724 ?auto_23726 ) ) ( not ( = ?auto_23725 ?auto_23726 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_23726 )
      ( !STACK ?auto_23726 ?auto_23725 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23734 - BLOCK
      ?auto_23735 - BLOCK
      ?auto_23736 - BLOCK
      ?auto_23737 - BLOCK
      ?auto_23738 - BLOCK
      ?auto_23739 - BLOCK
      ?auto_23740 - BLOCK
    )
    :vars
    (
      ?auto_23741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23740 ?auto_23741 ) ( ON-TABLE ?auto_23734 ) ( ON ?auto_23735 ?auto_23734 ) ( ON ?auto_23736 ?auto_23735 ) ( ON ?auto_23737 ?auto_23736 ) ( ON ?auto_23738 ?auto_23737 ) ( not ( = ?auto_23734 ?auto_23735 ) ) ( not ( = ?auto_23734 ?auto_23736 ) ) ( not ( = ?auto_23734 ?auto_23737 ) ) ( not ( = ?auto_23734 ?auto_23738 ) ) ( not ( = ?auto_23734 ?auto_23739 ) ) ( not ( = ?auto_23734 ?auto_23740 ) ) ( not ( = ?auto_23734 ?auto_23741 ) ) ( not ( = ?auto_23735 ?auto_23736 ) ) ( not ( = ?auto_23735 ?auto_23737 ) ) ( not ( = ?auto_23735 ?auto_23738 ) ) ( not ( = ?auto_23735 ?auto_23739 ) ) ( not ( = ?auto_23735 ?auto_23740 ) ) ( not ( = ?auto_23735 ?auto_23741 ) ) ( not ( = ?auto_23736 ?auto_23737 ) ) ( not ( = ?auto_23736 ?auto_23738 ) ) ( not ( = ?auto_23736 ?auto_23739 ) ) ( not ( = ?auto_23736 ?auto_23740 ) ) ( not ( = ?auto_23736 ?auto_23741 ) ) ( not ( = ?auto_23737 ?auto_23738 ) ) ( not ( = ?auto_23737 ?auto_23739 ) ) ( not ( = ?auto_23737 ?auto_23740 ) ) ( not ( = ?auto_23737 ?auto_23741 ) ) ( not ( = ?auto_23738 ?auto_23739 ) ) ( not ( = ?auto_23738 ?auto_23740 ) ) ( not ( = ?auto_23738 ?auto_23741 ) ) ( not ( = ?auto_23739 ?auto_23740 ) ) ( not ( = ?auto_23739 ?auto_23741 ) ) ( not ( = ?auto_23740 ?auto_23741 ) ) ( CLEAR ?auto_23738 ) ( ON ?auto_23739 ?auto_23740 ) ( CLEAR ?auto_23739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_23734 ?auto_23735 ?auto_23736 ?auto_23737 ?auto_23738 ?auto_23739 )
      ( MAKE-7PILE ?auto_23734 ?auto_23735 ?auto_23736 ?auto_23737 ?auto_23738 ?auto_23739 ?auto_23740 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23749 - BLOCK
      ?auto_23750 - BLOCK
      ?auto_23751 - BLOCK
      ?auto_23752 - BLOCK
      ?auto_23753 - BLOCK
      ?auto_23754 - BLOCK
      ?auto_23755 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23755 ) ( ON-TABLE ?auto_23749 ) ( ON ?auto_23750 ?auto_23749 ) ( ON ?auto_23751 ?auto_23750 ) ( ON ?auto_23752 ?auto_23751 ) ( ON ?auto_23753 ?auto_23752 ) ( not ( = ?auto_23749 ?auto_23750 ) ) ( not ( = ?auto_23749 ?auto_23751 ) ) ( not ( = ?auto_23749 ?auto_23752 ) ) ( not ( = ?auto_23749 ?auto_23753 ) ) ( not ( = ?auto_23749 ?auto_23754 ) ) ( not ( = ?auto_23749 ?auto_23755 ) ) ( not ( = ?auto_23750 ?auto_23751 ) ) ( not ( = ?auto_23750 ?auto_23752 ) ) ( not ( = ?auto_23750 ?auto_23753 ) ) ( not ( = ?auto_23750 ?auto_23754 ) ) ( not ( = ?auto_23750 ?auto_23755 ) ) ( not ( = ?auto_23751 ?auto_23752 ) ) ( not ( = ?auto_23751 ?auto_23753 ) ) ( not ( = ?auto_23751 ?auto_23754 ) ) ( not ( = ?auto_23751 ?auto_23755 ) ) ( not ( = ?auto_23752 ?auto_23753 ) ) ( not ( = ?auto_23752 ?auto_23754 ) ) ( not ( = ?auto_23752 ?auto_23755 ) ) ( not ( = ?auto_23753 ?auto_23754 ) ) ( not ( = ?auto_23753 ?auto_23755 ) ) ( not ( = ?auto_23754 ?auto_23755 ) ) ( CLEAR ?auto_23753 ) ( ON ?auto_23754 ?auto_23755 ) ( CLEAR ?auto_23754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_23749 ?auto_23750 ?auto_23751 ?auto_23752 ?auto_23753 ?auto_23754 )
      ( MAKE-7PILE ?auto_23749 ?auto_23750 ?auto_23751 ?auto_23752 ?auto_23753 ?auto_23754 ?auto_23755 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23763 - BLOCK
      ?auto_23764 - BLOCK
      ?auto_23765 - BLOCK
      ?auto_23766 - BLOCK
      ?auto_23767 - BLOCK
      ?auto_23768 - BLOCK
      ?auto_23769 - BLOCK
    )
    :vars
    (
      ?auto_23770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23769 ?auto_23770 ) ( ON-TABLE ?auto_23763 ) ( ON ?auto_23764 ?auto_23763 ) ( ON ?auto_23765 ?auto_23764 ) ( ON ?auto_23766 ?auto_23765 ) ( not ( = ?auto_23763 ?auto_23764 ) ) ( not ( = ?auto_23763 ?auto_23765 ) ) ( not ( = ?auto_23763 ?auto_23766 ) ) ( not ( = ?auto_23763 ?auto_23767 ) ) ( not ( = ?auto_23763 ?auto_23768 ) ) ( not ( = ?auto_23763 ?auto_23769 ) ) ( not ( = ?auto_23763 ?auto_23770 ) ) ( not ( = ?auto_23764 ?auto_23765 ) ) ( not ( = ?auto_23764 ?auto_23766 ) ) ( not ( = ?auto_23764 ?auto_23767 ) ) ( not ( = ?auto_23764 ?auto_23768 ) ) ( not ( = ?auto_23764 ?auto_23769 ) ) ( not ( = ?auto_23764 ?auto_23770 ) ) ( not ( = ?auto_23765 ?auto_23766 ) ) ( not ( = ?auto_23765 ?auto_23767 ) ) ( not ( = ?auto_23765 ?auto_23768 ) ) ( not ( = ?auto_23765 ?auto_23769 ) ) ( not ( = ?auto_23765 ?auto_23770 ) ) ( not ( = ?auto_23766 ?auto_23767 ) ) ( not ( = ?auto_23766 ?auto_23768 ) ) ( not ( = ?auto_23766 ?auto_23769 ) ) ( not ( = ?auto_23766 ?auto_23770 ) ) ( not ( = ?auto_23767 ?auto_23768 ) ) ( not ( = ?auto_23767 ?auto_23769 ) ) ( not ( = ?auto_23767 ?auto_23770 ) ) ( not ( = ?auto_23768 ?auto_23769 ) ) ( not ( = ?auto_23768 ?auto_23770 ) ) ( not ( = ?auto_23769 ?auto_23770 ) ) ( ON ?auto_23768 ?auto_23769 ) ( CLEAR ?auto_23766 ) ( ON ?auto_23767 ?auto_23768 ) ( CLEAR ?auto_23767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23763 ?auto_23764 ?auto_23765 ?auto_23766 ?auto_23767 )
      ( MAKE-7PILE ?auto_23763 ?auto_23764 ?auto_23765 ?auto_23766 ?auto_23767 ?auto_23768 ?auto_23769 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23778 - BLOCK
      ?auto_23779 - BLOCK
      ?auto_23780 - BLOCK
      ?auto_23781 - BLOCK
      ?auto_23782 - BLOCK
      ?auto_23783 - BLOCK
      ?auto_23784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23784 ) ( ON-TABLE ?auto_23778 ) ( ON ?auto_23779 ?auto_23778 ) ( ON ?auto_23780 ?auto_23779 ) ( ON ?auto_23781 ?auto_23780 ) ( not ( = ?auto_23778 ?auto_23779 ) ) ( not ( = ?auto_23778 ?auto_23780 ) ) ( not ( = ?auto_23778 ?auto_23781 ) ) ( not ( = ?auto_23778 ?auto_23782 ) ) ( not ( = ?auto_23778 ?auto_23783 ) ) ( not ( = ?auto_23778 ?auto_23784 ) ) ( not ( = ?auto_23779 ?auto_23780 ) ) ( not ( = ?auto_23779 ?auto_23781 ) ) ( not ( = ?auto_23779 ?auto_23782 ) ) ( not ( = ?auto_23779 ?auto_23783 ) ) ( not ( = ?auto_23779 ?auto_23784 ) ) ( not ( = ?auto_23780 ?auto_23781 ) ) ( not ( = ?auto_23780 ?auto_23782 ) ) ( not ( = ?auto_23780 ?auto_23783 ) ) ( not ( = ?auto_23780 ?auto_23784 ) ) ( not ( = ?auto_23781 ?auto_23782 ) ) ( not ( = ?auto_23781 ?auto_23783 ) ) ( not ( = ?auto_23781 ?auto_23784 ) ) ( not ( = ?auto_23782 ?auto_23783 ) ) ( not ( = ?auto_23782 ?auto_23784 ) ) ( not ( = ?auto_23783 ?auto_23784 ) ) ( ON ?auto_23783 ?auto_23784 ) ( CLEAR ?auto_23781 ) ( ON ?auto_23782 ?auto_23783 ) ( CLEAR ?auto_23782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_23778 ?auto_23779 ?auto_23780 ?auto_23781 ?auto_23782 )
      ( MAKE-7PILE ?auto_23778 ?auto_23779 ?auto_23780 ?auto_23781 ?auto_23782 ?auto_23783 ?auto_23784 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23792 - BLOCK
      ?auto_23793 - BLOCK
      ?auto_23794 - BLOCK
      ?auto_23795 - BLOCK
      ?auto_23796 - BLOCK
      ?auto_23797 - BLOCK
      ?auto_23798 - BLOCK
    )
    :vars
    (
      ?auto_23799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23798 ?auto_23799 ) ( ON-TABLE ?auto_23792 ) ( ON ?auto_23793 ?auto_23792 ) ( ON ?auto_23794 ?auto_23793 ) ( not ( = ?auto_23792 ?auto_23793 ) ) ( not ( = ?auto_23792 ?auto_23794 ) ) ( not ( = ?auto_23792 ?auto_23795 ) ) ( not ( = ?auto_23792 ?auto_23796 ) ) ( not ( = ?auto_23792 ?auto_23797 ) ) ( not ( = ?auto_23792 ?auto_23798 ) ) ( not ( = ?auto_23792 ?auto_23799 ) ) ( not ( = ?auto_23793 ?auto_23794 ) ) ( not ( = ?auto_23793 ?auto_23795 ) ) ( not ( = ?auto_23793 ?auto_23796 ) ) ( not ( = ?auto_23793 ?auto_23797 ) ) ( not ( = ?auto_23793 ?auto_23798 ) ) ( not ( = ?auto_23793 ?auto_23799 ) ) ( not ( = ?auto_23794 ?auto_23795 ) ) ( not ( = ?auto_23794 ?auto_23796 ) ) ( not ( = ?auto_23794 ?auto_23797 ) ) ( not ( = ?auto_23794 ?auto_23798 ) ) ( not ( = ?auto_23794 ?auto_23799 ) ) ( not ( = ?auto_23795 ?auto_23796 ) ) ( not ( = ?auto_23795 ?auto_23797 ) ) ( not ( = ?auto_23795 ?auto_23798 ) ) ( not ( = ?auto_23795 ?auto_23799 ) ) ( not ( = ?auto_23796 ?auto_23797 ) ) ( not ( = ?auto_23796 ?auto_23798 ) ) ( not ( = ?auto_23796 ?auto_23799 ) ) ( not ( = ?auto_23797 ?auto_23798 ) ) ( not ( = ?auto_23797 ?auto_23799 ) ) ( not ( = ?auto_23798 ?auto_23799 ) ) ( ON ?auto_23797 ?auto_23798 ) ( ON ?auto_23796 ?auto_23797 ) ( CLEAR ?auto_23794 ) ( ON ?auto_23795 ?auto_23796 ) ( CLEAR ?auto_23795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23792 ?auto_23793 ?auto_23794 ?auto_23795 )
      ( MAKE-7PILE ?auto_23792 ?auto_23793 ?auto_23794 ?auto_23795 ?auto_23796 ?auto_23797 ?auto_23798 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23807 - BLOCK
      ?auto_23808 - BLOCK
      ?auto_23809 - BLOCK
      ?auto_23810 - BLOCK
      ?auto_23811 - BLOCK
      ?auto_23812 - BLOCK
      ?auto_23813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23813 ) ( ON-TABLE ?auto_23807 ) ( ON ?auto_23808 ?auto_23807 ) ( ON ?auto_23809 ?auto_23808 ) ( not ( = ?auto_23807 ?auto_23808 ) ) ( not ( = ?auto_23807 ?auto_23809 ) ) ( not ( = ?auto_23807 ?auto_23810 ) ) ( not ( = ?auto_23807 ?auto_23811 ) ) ( not ( = ?auto_23807 ?auto_23812 ) ) ( not ( = ?auto_23807 ?auto_23813 ) ) ( not ( = ?auto_23808 ?auto_23809 ) ) ( not ( = ?auto_23808 ?auto_23810 ) ) ( not ( = ?auto_23808 ?auto_23811 ) ) ( not ( = ?auto_23808 ?auto_23812 ) ) ( not ( = ?auto_23808 ?auto_23813 ) ) ( not ( = ?auto_23809 ?auto_23810 ) ) ( not ( = ?auto_23809 ?auto_23811 ) ) ( not ( = ?auto_23809 ?auto_23812 ) ) ( not ( = ?auto_23809 ?auto_23813 ) ) ( not ( = ?auto_23810 ?auto_23811 ) ) ( not ( = ?auto_23810 ?auto_23812 ) ) ( not ( = ?auto_23810 ?auto_23813 ) ) ( not ( = ?auto_23811 ?auto_23812 ) ) ( not ( = ?auto_23811 ?auto_23813 ) ) ( not ( = ?auto_23812 ?auto_23813 ) ) ( ON ?auto_23812 ?auto_23813 ) ( ON ?auto_23811 ?auto_23812 ) ( CLEAR ?auto_23809 ) ( ON ?auto_23810 ?auto_23811 ) ( CLEAR ?auto_23810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_23807 ?auto_23808 ?auto_23809 ?auto_23810 )
      ( MAKE-7PILE ?auto_23807 ?auto_23808 ?auto_23809 ?auto_23810 ?auto_23811 ?auto_23812 ?auto_23813 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23821 - BLOCK
      ?auto_23822 - BLOCK
      ?auto_23823 - BLOCK
      ?auto_23824 - BLOCK
      ?auto_23825 - BLOCK
      ?auto_23826 - BLOCK
      ?auto_23827 - BLOCK
    )
    :vars
    (
      ?auto_23828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23827 ?auto_23828 ) ( ON-TABLE ?auto_23821 ) ( ON ?auto_23822 ?auto_23821 ) ( not ( = ?auto_23821 ?auto_23822 ) ) ( not ( = ?auto_23821 ?auto_23823 ) ) ( not ( = ?auto_23821 ?auto_23824 ) ) ( not ( = ?auto_23821 ?auto_23825 ) ) ( not ( = ?auto_23821 ?auto_23826 ) ) ( not ( = ?auto_23821 ?auto_23827 ) ) ( not ( = ?auto_23821 ?auto_23828 ) ) ( not ( = ?auto_23822 ?auto_23823 ) ) ( not ( = ?auto_23822 ?auto_23824 ) ) ( not ( = ?auto_23822 ?auto_23825 ) ) ( not ( = ?auto_23822 ?auto_23826 ) ) ( not ( = ?auto_23822 ?auto_23827 ) ) ( not ( = ?auto_23822 ?auto_23828 ) ) ( not ( = ?auto_23823 ?auto_23824 ) ) ( not ( = ?auto_23823 ?auto_23825 ) ) ( not ( = ?auto_23823 ?auto_23826 ) ) ( not ( = ?auto_23823 ?auto_23827 ) ) ( not ( = ?auto_23823 ?auto_23828 ) ) ( not ( = ?auto_23824 ?auto_23825 ) ) ( not ( = ?auto_23824 ?auto_23826 ) ) ( not ( = ?auto_23824 ?auto_23827 ) ) ( not ( = ?auto_23824 ?auto_23828 ) ) ( not ( = ?auto_23825 ?auto_23826 ) ) ( not ( = ?auto_23825 ?auto_23827 ) ) ( not ( = ?auto_23825 ?auto_23828 ) ) ( not ( = ?auto_23826 ?auto_23827 ) ) ( not ( = ?auto_23826 ?auto_23828 ) ) ( not ( = ?auto_23827 ?auto_23828 ) ) ( ON ?auto_23826 ?auto_23827 ) ( ON ?auto_23825 ?auto_23826 ) ( ON ?auto_23824 ?auto_23825 ) ( CLEAR ?auto_23822 ) ( ON ?auto_23823 ?auto_23824 ) ( CLEAR ?auto_23823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23821 ?auto_23822 ?auto_23823 )
      ( MAKE-7PILE ?auto_23821 ?auto_23822 ?auto_23823 ?auto_23824 ?auto_23825 ?auto_23826 ?auto_23827 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23836 - BLOCK
      ?auto_23837 - BLOCK
      ?auto_23838 - BLOCK
      ?auto_23839 - BLOCK
      ?auto_23840 - BLOCK
      ?auto_23841 - BLOCK
      ?auto_23842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23842 ) ( ON-TABLE ?auto_23836 ) ( ON ?auto_23837 ?auto_23836 ) ( not ( = ?auto_23836 ?auto_23837 ) ) ( not ( = ?auto_23836 ?auto_23838 ) ) ( not ( = ?auto_23836 ?auto_23839 ) ) ( not ( = ?auto_23836 ?auto_23840 ) ) ( not ( = ?auto_23836 ?auto_23841 ) ) ( not ( = ?auto_23836 ?auto_23842 ) ) ( not ( = ?auto_23837 ?auto_23838 ) ) ( not ( = ?auto_23837 ?auto_23839 ) ) ( not ( = ?auto_23837 ?auto_23840 ) ) ( not ( = ?auto_23837 ?auto_23841 ) ) ( not ( = ?auto_23837 ?auto_23842 ) ) ( not ( = ?auto_23838 ?auto_23839 ) ) ( not ( = ?auto_23838 ?auto_23840 ) ) ( not ( = ?auto_23838 ?auto_23841 ) ) ( not ( = ?auto_23838 ?auto_23842 ) ) ( not ( = ?auto_23839 ?auto_23840 ) ) ( not ( = ?auto_23839 ?auto_23841 ) ) ( not ( = ?auto_23839 ?auto_23842 ) ) ( not ( = ?auto_23840 ?auto_23841 ) ) ( not ( = ?auto_23840 ?auto_23842 ) ) ( not ( = ?auto_23841 ?auto_23842 ) ) ( ON ?auto_23841 ?auto_23842 ) ( ON ?auto_23840 ?auto_23841 ) ( ON ?auto_23839 ?auto_23840 ) ( CLEAR ?auto_23837 ) ( ON ?auto_23838 ?auto_23839 ) ( CLEAR ?auto_23838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_23836 ?auto_23837 ?auto_23838 )
      ( MAKE-7PILE ?auto_23836 ?auto_23837 ?auto_23838 ?auto_23839 ?auto_23840 ?auto_23841 ?auto_23842 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23850 - BLOCK
      ?auto_23851 - BLOCK
      ?auto_23852 - BLOCK
      ?auto_23853 - BLOCK
      ?auto_23854 - BLOCK
      ?auto_23855 - BLOCK
      ?auto_23856 - BLOCK
    )
    :vars
    (
      ?auto_23857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23856 ?auto_23857 ) ( ON-TABLE ?auto_23850 ) ( not ( = ?auto_23850 ?auto_23851 ) ) ( not ( = ?auto_23850 ?auto_23852 ) ) ( not ( = ?auto_23850 ?auto_23853 ) ) ( not ( = ?auto_23850 ?auto_23854 ) ) ( not ( = ?auto_23850 ?auto_23855 ) ) ( not ( = ?auto_23850 ?auto_23856 ) ) ( not ( = ?auto_23850 ?auto_23857 ) ) ( not ( = ?auto_23851 ?auto_23852 ) ) ( not ( = ?auto_23851 ?auto_23853 ) ) ( not ( = ?auto_23851 ?auto_23854 ) ) ( not ( = ?auto_23851 ?auto_23855 ) ) ( not ( = ?auto_23851 ?auto_23856 ) ) ( not ( = ?auto_23851 ?auto_23857 ) ) ( not ( = ?auto_23852 ?auto_23853 ) ) ( not ( = ?auto_23852 ?auto_23854 ) ) ( not ( = ?auto_23852 ?auto_23855 ) ) ( not ( = ?auto_23852 ?auto_23856 ) ) ( not ( = ?auto_23852 ?auto_23857 ) ) ( not ( = ?auto_23853 ?auto_23854 ) ) ( not ( = ?auto_23853 ?auto_23855 ) ) ( not ( = ?auto_23853 ?auto_23856 ) ) ( not ( = ?auto_23853 ?auto_23857 ) ) ( not ( = ?auto_23854 ?auto_23855 ) ) ( not ( = ?auto_23854 ?auto_23856 ) ) ( not ( = ?auto_23854 ?auto_23857 ) ) ( not ( = ?auto_23855 ?auto_23856 ) ) ( not ( = ?auto_23855 ?auto_23857 ) ) ( not ( = ?auto_23856 ?auto_23857 ) ) ( ON ?auto_23855 ?auto_23856 ) ( ON ?auto_23854 ?auto_23855 ) ( ON ?auto_23853 ?auto_23854 ) ( ON ?auto_23852 ?auto_23853 ) ( CLEAR ?auto_23850 ) ( ON ?auto_23851 ?auto_23852 ) ( CLEAR ?auto_23851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23850 ?auto_23851 )
      ( MAKE-7PILE ?auto_23850 ?auto_23851 ?auto_23852 ?auto_23853 ?auto_23854 ?auto_23855 ?auto_23856 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23865 - BLOCK
      ?auto_23866 - BLOCK
      ?auto_23867 - BLOCK
      ?auto_23868 - BLOCK
      ?auto_23869 - BLOCK
      ?auto_23870 - BLOCK
      ?auto_23871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23871 ) ( ON-TABLE ?auto_23865 ) ( not ( = ?auto_23865 ?auto_23866 ) ) ( not ( = ?auto_23865 ?auto_23867 ) ) ( not ( = ?auto_23865 ?auto_23868 ) ) ( not ( = ?auto_23865 ?auto_23869 ) ) ( not ( = ?auto_23865 ?auto_23870 ) ) ( not ( = ?auto_23865 ?auto_23871 ) ) ( not ( = ?auto_23866 ?auto_23867 ) ) ( not ( = ?auto_23866 ?auto_23868 ) ) ( not ( = ?auto_23866 ?auto_23869 ) ) ( not ( = ?auto_23866 ?auto_23870 ) ) ( not ( = ?auto_23866 ?auto_23871 ) ) ( not ( = ?auto_23867 ?auto_23868 ) ) ( not ( = ?auto_23867 ?auto_23869 ) ) ( not ( = ?auto_23867 ?auto_23870 ) ) ( not ( = ?auto_23867 ?auto_23871 ) ) ( not ( = ?auto_23868 ?auto_23869 ) ) ( not ( = ?auto_23868 ?auto_23870 ) ) ( not ( = ?auto_23868 ?auto_23871 ) ) ( not ( = ?auto_23869 ?auto_23870 ) ) ( not ( = ?auto_23869 ?auto_23871 ) ) ( not ( = ?auto_23870 ?auto_23871 ) ) ( ON ?auto_23870 ?auto_23871 ) ( ON ?auto_23869 ?auto_23870 ) ( ON ?auto_23868 ?auto_23869 ) ( ON ?auto_23867 ?auto_23868 ) ( CLEAR ?auto_23865 ) ( ON ?auto_23866 ?auto_23867 ) ( CLEAR ?auto_23866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_23865 ?auto_23866 )
      ( MAKE-7PILE ?auto_23865 ?auto_23866 ?auto_23867 ?auto_23868 ?auto_23869 ?auto_23870 ?auto_23871 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23879 - BLOCK
      ?auto_23880 - BLOCK
      ?auto_23881 - BLOCK
      ?auto_23882 - BLOCK
      ?auto_23883 - BLOCK
      ?auto_23884 - BLOCK
      ?auto_23885 - BLOCK
    )
    :vars
    (
      ?auto_23886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_23885 ?auto_23886 ) ( not ( = ?auto_23879 ?auto_23880 ) ) ( not ( = ?auto_23879 ?auto_23881 ) ) ( not ( = ?auto_23879 ?auto_23882 ) ) ( not ( = ?auto_23879 ?auto_23883 ) ) ( not ( = ?auto_23879 ?auto_23884 ) ) ( not ( = ?auto_23879 ?auto_23885 ) ) ( not ( = ?auto_23879 ?auto_23886 ) ) ( not ( = ?auto_23880 ?auto_23881 ) ) ( not ( = ?auto_23880 ?auto_23882 ) ) ( not ( = ?auto_23880 ?auto_23883 ) ) ( not ( = ?auto_23880 ?auto_23884 ) ) ( not ( = ?auto_23880 ?auto_23885 ) ) ( not ( = ?auto_23880 ?auto_23886 ) ) ( not ( = ?auto_23881 ?auto_23882 ) ) ( not ( = ?auto_23881 ?auto_23883 ) ) ( not ( = ?auto_23881 ?auto_23884 ) ) ( not ( = ?auto_23881 ?auto_23885 ) ) ( not ( = ?auto_23881 ?auto_23886 ) ) ( not ( = ?auto_23882 ?auto_23883 ) ) ( not ( = ?auto_23882 ?auto_23884 ) ) ( not ( = ?auto_23882 ?auto_23885 ) ) ( not ( = ?auto_23882 ?auto_23886 ) ) ( not ( = ?auto_23883 ?auto_23884 ) ) ( not ( = ?auto_23883 ?auto_23885 ) ) ( not ( = ?auto_23883 ?auto_23886 ) ) ( not ( = ?auto_23884 ?auto_23885 ) ) ( not ( = ?auto_23884 ?auto_23886 ) ) ( not ( = ?auto_23885 ?auto_23886 ) ) ( ON ?auto_23884 ?auto_23885 ) ( ON ?auto_23883 ?auto_23884 ) ( ON ?auto_23882 ?auto_23883 ) ( ON ?auto_23881 ?auto_23882 ) ( ON ?auto_23880 ?auto_23881 ) ( ON ?auto_23879 ?auto_23880 ) ( CLEAR ?auto_23879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23879 )
      ( MAKE-7PILE ?auto_23879 ?auto_23880 ?auto_23881 ?auto_23882 ?auto_23883 ?auto_23884 ?auto_23885 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23894 - BLOCK
      ?auto_23895 - BLOCK
      ?auto_23896 - BLOCK
      ?auto_23897 - BLOCK
      ?auto_23898 - BLOCK
      ?auto_23899 - BLOCK
      ?auto_23900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23900 ) ( not ( = ?auto_23894 ?auto_23895 ) ) ( not ( = ?auto_23894 ?auto_23896 ) ) ( not ( = ?auto_23894 ?auto_23897 ) ) ( not ( = ?auto_23894 ?auto_23898 ) ) ( not ( = ?auto_23894 ?auto_23899 ) ) ( not ( = ?auto_23894 ?auto_23900 ) ) ( not ( = ?auto_23895 ?auto_23896 ) ) ( not ( = ?auto_23895 ?auto_23897 ) ) ( not ( = ?auto_23895 ?auto_23898 ) ) ( not ( = ?auto_23895 ?auto_23899 ) ) ( not ( = ?auto_23895 ?auto_23900 ) ) ( not ( = ?auto_23896 ?auto_23897 ) ) ( not ( = ?auto_23896 ?auto_23898 ) ) ( not ( = ?auto_23896 ?auto_23899 ) ) ( not ( = ?auto_23896 ?auto_23900 ) ) ( not ( = ?auto_23897 ?auto_23898 ) ) ( not ( = ?auto_23897 ?auto_23899 ) ) ( not ( = ?auto_23897 ?auto_23900 ) ) ( not ( = ?auto_23898 ?auto_23899 ) ) ( not ( = ?auto_23898 ?auto_23900 ) ) ( not ( = ?auto_23899 ?auto_23900 ) ) ( ON ?auto_23899 ?auto_23900 ) ( ON ?auto_23898 ?auto_23899 ) ( ON ?auto_23897 ?auto_23898 ) ( ON ?auto_23896 ?auto_23897 ) ( ON ?auto_23895 ?auto_23896 ) ( ON ?auto_23894 ?auto_23895 ) ( CLEAR ?auto_23894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_23894 )
      ( MAKE-7PILE ?auto_23894 ?auto_23895 ?auto_23896 ?auto_23897 ?auto_23898 ?auto_23899 ?auto_23900 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_23908 - BLOCK
      ?auto_23909 - BLOCK
      ?auto_23910 - BLOCK
      ?auto_23911 - BLOCK
      ?auto_23912 - BLOCK
      ?auto_23913 - BLOCK
      ?auto_23914 - BLOCK
    )
    :vars
    (
      ?auto_23915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_23908 ?auto_23909 ) ) ( not ( = ?auto_23908 ?auto_23910 ) ) ( not ( = ?auto_23908 ?auto_23911 ) ) ( not ( = ?auto_23908 ?auto_23912 ) ) ( not ( = ?auto_23908 ?auto_23913 ) ) ( not ( = ?auto_23908 ?auto_23914 ) ) ( not ( = ?auto_23909 ?auto_23910 ) ) ( not ( = ?auto_23909 ?auto_23911 ) ) ( not ( = ?auto_23909 ?auto_23912 ) ) ( not ( = ?auto_23909 ?auto_23913 ) ) ( not ( = ?auto_23909 ?auto_23914 ) ) ( not ( = ?auto_23910 ?auto_23911 ) ) ( not ( = ?auto_23910 ?auto_23912 ) ) ( not ( = ?auto_23910 ?auto_23913 ) ) ( not ( = ?auto_23910 ?auto_23914 ) ) ( not ( = ?auto_23911 ?auto_23912 ) ) ( not ( = ?auto_23911 ?auto_23913 ) ) ( not ( = ?auto_23911 ?auto_23914 ) ) ( not ( = ?auto_23912 ?auto_23913 ) ) ( not ( = ?auto_23912 ?auto_23914 ) ) ( not ( = ?auto_23913 ?auto_23914 ) ) ( ON ?auto_23908 ?auto_23915 ) ( not ( = ?auto_23914 ?auto_23915 ) ) ( not ( = ?auto_23913 ?auto_23915 ) ) ( not ( = ?auto_23912 ?auto_23915 ) ) ( not ( = ?auto_23911 ?auto_23915 ) ) ( not ( = ?auto_23910 ?auto_23915 ) ) ( not ( = ?auto_23909 ?auto_23915 ) ) ( not ( = ?auto_23908 ?auto_23915 ) ) ( ON ?auto_23909 ?auto_23908 ) ( ON ?auto_23910 ?auto_23909 ) ( ON ?auto_23911 ?auto_23910 ) ( ON ?auto_23912 ?auto_23911 ) ( ON ?auto_23913 ?auto_23912 ) ( ON ?auto_23914 ?auto_23913 ) ( CLEAR ?auto_23914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_23914 ?auto_23913 ?auto_23912 ?auto_23911 ?auto_23910 ?auto_23909 ?auto_23908 )
      ( MAKE-7PILE ?auto_23908 ?auto_23909 ?auto_23910 ?auto_23911 ?auto_23912 ?auto_23913 ?auto_23914 ) )
  )

)

