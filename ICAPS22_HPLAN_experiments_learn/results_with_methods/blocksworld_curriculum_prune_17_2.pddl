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
      ?auto_605329 - BLOCK
    )
    :vars
    (
      ?auto_605330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605329 ?auto_605330 ) ( CLEAR ?auto_605329 ) ( HAND-EMPTY ) ( not ( = ?auto_605329 ?auto_605330 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_605329 ?auto_605330 )
      ( !PUTDOWN ?auto_605329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_605336 - BLOCK
      ?auto_605337 - BLOCK
    )
    :vars
    (
      ?auto_605338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_605336 ) ( ON ?auto_605337 ?auto_605338 ) ( CLEAR ?auto_605337 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_605336 ) ( not ( = ?auto_605336 ?auto_605337 ) ) ( not ( = ?auto_605336 ?auto_605338 ) ) ( not ( = ?auto_605337 ?auto_605338 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_605337 ?auto_605338 )
      ( !STACK ?auto_605337 ?auto_605336 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_605346 - BLOCK
      ?auto_605347 - BLOCK
    )
    :vars
    (
      ?auto_605348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605347 ?auto_605348 ) ( not ( = ?auto_605346 ?auto_605347 ) ) ( not ( = ?auto_605346 ?auto_605348 ) ) ( not ( = ?auto_605347 ?auto_605348 ) ) ( ON ?auto_605346 ?auto_605347 ) ( CLEAR ?auto_605346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_605346 )
      ( MAKE-2PILE ?auto_605346 ?auto_605347 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_605357 - BLOCK
      ?auto_605358 - BLOCK
      ?auto_605359 - BLOCK
    )
    :vars
    (
      ?auto_605360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_605358 ) ( ON ?auto_605359 ?auto_605360 ) ( CLEAR ?auto_605359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_605357 ) ( ON ?auto_605358 ?auto_605357 ) ( not ( = ?auto_605357 ?auto_605358 ) ) ( not ( = ?auto_605357 ?auto_605359 ) ) ( not ( = ?auto_605357 ?auto_605360 ) ) ( not ( = ?auto_605358 ?auto_605359 ) ) ( not ( = ?auto_605358 ?auto_605360 ) ) ( not ( = ?auto_605359 ?auto_605360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_605359 ?auto_605360 )
      ( !STACK ?auto_605359 ?auto_605358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_605371 - BLOCK
      ?auto_605372 - BLOCK
      ?auto_605373 - BLOCK
    )
    :vars
    (
      ?auto_605374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605373 ?auto_605374 ) ( ON-TABLE ?auto_605371 ) ( not ( = ?auto_605371 ?auto_605372 ) ) ( not ( = ?auto_605371 ?auto_605373 ) ) ( not ( = ?auto_605371 ?auto_605374 ) ) ( not ( = ?auto_605372 ?auto_605373 ) ) ( not ( = ?auto_605372 ?auto_605374 ) ) ( not ( = ?auto_605373 ?auto_605374 ) ) ( CLEAR ?auto_605371 ) ( ON ?auto_605372 ?auto_605373 ) ( CLEAR ?auto_605372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_605371 ?auto_605372 )
      ( MAKE-3PILE ?auto_605371 ?auto_605372 ?auto_605373 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_605385 - BLOCK
      ?auto_605386 - BLOCK
      ?auto_605387 - BLOCK
    )
    :vars
    (
      ?auto_605388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605387 ?auto_605388 ) ( not ( = ?auto_605385 ?auto_605386 ) ) ( not ( = ?auto_605385 ?auto_605387 ) ) ( not ( = ?auto_605385 ?auto_605388 ) ) ( not ( = ?auto_605386 ?auto_605387 ) ) ( not ( = ?auto_605386 ?auto_605388 ) ) ( not ( = ?auto_605387 ?auto_605388 ) ) ( ON ?auto_605386 ?auto_605387 ) ( ON ?auto_605385 ?auto_605386 ) ( CLEAR ?auto_605385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_605385 )
      ( MAKE-3PILE ?auto_605385 ?auto_605386 ?auto_605387 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_605400 - BLOCK
      ?auto_605401 - BLOCK
      ?auto_605402 - BLOCK
      ?auto_605403 - BLOCK
    )
    :vars
    (
      ?auto_605404 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_605402 ) ( ON ?auto_605403 ?auto_605404 ) ( CLEAR ?auto_605403 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_605400 ) ( ON ?auto_605401 ?auto_605400 ) ( ON ?auto_605402 ?auto_605401 ) ( not ( = ?auto_605400 ?auto_605401 ) ) ( not ( = ?auto_605400 ?auto_605402 ) ) ( not ( = ?auto_605400 ?auto_605403 ) ) ( not ( = ?auto_605400 ?auto_605404 ) ) ( not ( = ?auto_605401 ?auto_605402 ) ) ( not ( = ?auto_605401 ?auto_605403 ) ) ( not ( = ?auto_605401 ?auto_605404 ) ) ( not ( = ?auto_605402 ?auto_605403 ) ) ( not ( = ?auto_605402 ?auto_605404 ) ) ( not ( = ?auto_605403 ?auto_605404 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_605403 ?auto_605404 )
      ( !STACK ?auto_605403 ?auto_605402 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_605418 - BLOCK
      ?auto_605419 - BLOCK
      ?auto_605420 - BLOCK
      ?auto_605421 - BLOCK
    )
    :vars
    (
      ?auto_605422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605421 ?auto_605422 ) ( ON-TABLE ?auto_605418 ) ( ON ?auto_605419 ?auto_605418 ) ( not ( = ?auto_605418 ?auto_605419 ) ) ( not ( = ?auto_605418 ?auto_605420 ) ) ( not ( = ?auto_605418 ?auto_605421 ) ) ( not ( = ?auto_605418 ?auto_605422 ) ) ( not ( = ?auto_605419 ?auto_605420 ) ) ( not ( = ?auto_605419 ?auto_605421 ) ) ( not ( = ?auto_605419 ?auto_605422 ) ) ( not ( = ?auto_605420 ?auto_605421 ) ) ( not ( = ?auto_605420 ?auto_605422 ) ) ( not ( = ?auto_605421 ?auto_605422 ) ) ( CLEAR ?auto_605419 ) ( ON ?auto_605420 ?auto_605421 ) ( CLEAR ?auto_605420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_605418 ?auto_605419 ?auto_605420 )
      ( MAKE-4PILE ?auto_605418 ?auto_605419 ?auto_605420 ?auto_605421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_605436 - BLOCK
      ?auto_605437 - BLOCK
      ?auto_605438 - BLOCK
      ?auto_605439 - BLOCK
    )
    :vars
    (
      ?auto_605440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605439 ?auto_605440 ) ( ON-TABLE ?auto_605436 ) ( not ( = ?auto_605436 ?auto_605437 ) ) ( not ( = ?auto_605436 ?auto_605438 ) ) ( not ( = ?auto_605436 ?auto_605439 ) ) ( not ( = ?auto_605436 ?auto_605440 ) ) ( not ( = ?auto_605437 ?auto_605438 ) ) ( not ( = ?auto_605437 ?auto_605439 ) ) ( not ( = ?auto_605437 ?auto_605440 ) ) ( not ( = ?auto_605438 ?auto_605439 ) ) ( not ( = ?auto_605438 ?auto_605440 ) ) ( not ( = ?auto_605439 ?auto_605440 ) ) ( ON ?auto_605438 ?auto_605439 ) ( CLEAR ?auto_605436 ) ( ON ?auto_605437 ?auto_605438 ) ( CLEAR ?auto_605437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_605436 ?auto_605437 )
      ( MAKE-4PILE ?auto_605436 ?auto_605437 ?auto_605438 ?auto_605439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_605454 - BLOCK
      ?auto_605455 - BLOCK
      ?auto_605456 - BLOCK
      ?auto_605457 - BLOCK
    )
    :vars
    (
      ?auto_605458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605457 ?auto_605458 ) ( not ( = ?auto_605454 ?auto_605455 ) ) ( not ( = ?auto_605454 ?auto_605456 ) ) ( not ( = ?auto_605454 ?auto_605457 ) ) ( not ( = ?auto_605454 ?auto_605458 ) ) ( not ( = ?auto_605455 ?auto_605456 ) ) ( not ( = ?auto_605455 ?auto_605457 ) ) ( not ( = ?auto_605455 ?auto_605458 ) ) ( not ( = ?auto_605456 ?auto_605457 ) ) ( not ( = ?auto_605456 ?auto_605458 ) ) ( not ( = ?auto_605457 ?auto_605458 ) ) ( ON ?auto_605456 ?auto_605457 ) ( ON ?auto_605455 ?auto_605456 ) ( ON ?auto_605454 ?auto_605455 ) ( CLEAR ?auto_605454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_605454 )
      ( MAKE-4PILE ?auto_605454 ?auto_605455 ?auto_605456 ?auto_605457 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_605473 - BLOCK
      ?auto_605474 - BLOCK
      ?auto_605475 - BLOCK
      ?auto_605476 - BLOCK
      ?auto_605477 - BLOCK
    )
    :vars
    (
      ?auto_605478 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_605476 ) ( ON ?auto_605477 ?auto_605478 ) ( CLEAR ?auto_605477 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_605473 ) ( ON ?auto_605474 ?auto_605473 ) ( ON ?auto_605475 ?auto_605474 ) ( ON ?auto_605476 ?auto_605475 ) ( not ( = ?auto_605473 ?auto_605474 ) ) ( not ( = ?auto_605473 ?auto_605475 ) ) ( not ( = ?auto_605473 ?auto_605476 ) ) ( not ( = ?auto_605473 ?auto_605477 ) ) ( not ( = ?auto_605473 ?auto_605478 ) ) ( not ( = ?auto_605474 ?auto_605475 ) ) ( not ( = ?auto_605474 ?auto_605476 ) ) ( not ( = ?auto_605474 ?auto_605477 ) ) ( not ( = ?auto_605474 ?auto_605478 ) ) ( not ( = ?auto_605475 ?auto_605476 ) ) ( not ( = ?auto_605475 ?auto_605477 ) ) ( not ( = ?auto_605475 ?auto_605478 ) ) ( not ( = ?auto_605476 ?auto_605477 ) ) ( not ( = ?auto_605476 ?auto_605478 ) ) ( not ( = ?auto_605477 ?auto_605478 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_605477 ?auto_605478 )
      ( !STACK ?auto_605477 ?auto_605476 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_605495 - BLOCK
      ?auto_605496 - BLOCK
      ?auto_605497 - BLOCK
      ?auto_605498 - BLOCK
      ?auto_605499 - BLOCK
    )
    :vars
    (
      ?auto_605500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605499 ?auto_605500 ) ( ON-TABLE ?auto_605495 ) ( ON ?auto_605496 ?auto_605495 ) ( ON ?auto_605497 ?auto_605496 ) ( not ( = ?auto_605495 ?auto_605496 ) ) ( not ( = ?auto_605495 ?auto_605497 ) ) ( not ( = ?auto_605495 ?auto_605498 ) ) ( not ( = ?auto_605495 ?auto_605499 ) ) ( not ( = ?auto_605495 ?auto_605500 ) ) ( not ( = ?auto_605496 ?auto_605497 ) ) ( not ( = ?auto_605496 ?auto_605498 ) ) ( not ( = ?auto_605496 ?auto_605499 ) ) ( not ( = ?auto_605496 ?auto_605500 ) ) ( not ( = ?auto_605497 ?auto_605498 ) ) ( not ( = ?auto_605497 ?auto_605499 ) ) ( not ( = ?auto_605497 ?auto_605500 ) ) ( not ( = ?auto_605498 ?auto_605499 ) ) ( not ( = ?auto_605498 ?auto_605500 ) ) ( not ( = ?auto_605499 ?auto_605500 ) ) ( CLEAR ?auto_605497 ) ( ON ?auto_605498 ?auto_605499 ) ( CLEAR ?auto_605498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_605495 ?auto_605496 ?auto_605497 ?auto_605498 )
      ( MAKE-5PILE ?auto_605495 ?auto_605496 ?auto_605497 ?auto_605498 ?auto_605499 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_605517 - BLOCK
      ?auto_605518 - BLOCK
      ?auto_605519 - BLOCK
      ?auto_605520 - BLOCK
      ?auto_605521 - BLOCK
    )
    :vars
    (
      ?auto_605522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605521 ?auto_605522 ) ( ON-TABLE ?auto_605517 ) ( ON ?auto_605518 ?auto_605517 ) ( not ( = ?auto_605517 ?auto_605518 ) ) ( not ( = ?auto_605517 ?auto_605519 ) ) ( not ( = ?auto_605517 ?auto_605520 ) ) ( not ( = ?auto_605517 ?auto_605521 ) ) ( not ( = ?auto_605517 ?auto_605522 ) ) ( not ( = ?auto_605518 ?auto_605519 ) ) ( not ( = ?auto_605518 ?auto_605520 ) ) ( not ( = ?auto_605518 ?auto_605521 ) ) ( not ( = ?auto_605518 ?auto_605522 ) ) ( not ( = ?auto_605519 ?auto_605520 ) ) ( not ( = ?auto_605519 ?auto_605521 ) ) ( not ( = ?auto_605519 ?auto_605522 ) ) ( not ( = ?auto_605520 ?auto_605521 ) ) ( not ( = ?auto_605520 ?auto_605522 ) ) ( not ( = ?auto_605521 ?auto_605522 ) ) ( ON ?auto_605520 ?auto_605521 ) ( CLEAR ?auto_605518 ) ( ON ?auto_605519 ?auto_605520 ) ( CLEAR ?auto_605519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_605517 ?auto_605518 ?auto_605519 )
      ( MAKE-5PILE ?auto_605517 ?auto_605518 ?auto_605519 ?auto_605520 ?auto_605521 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_605539 - BLOCK
      ?auto_605540 - BLOCK
      ?auto_605541 - BLOCK
      ?auto_605542 - BLOCK
      ?auto_605543 - BLOCK
    )
    :vars
    (
      ?auto_605544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605543 ?auto_605544 ) ( ON-TABLE ?auto_605539 ) ( not ( = ?auto_605539 ?auto_605540 ) ) ( not ( = ?auto_605539 ?auto_605541 ) ) ( not ( = ?auto_605539 ?auto_605542 ) ) ( not ( = ?auto_605539 ?auto_605543 ) ) ( not ( = ?auto_605539 ?auto_605544 ) ) ( not ( = ?auto_605540 ?auto_605541 ) ) ( not ( = ?auto_605540 ?auto_605542 ) ) ( not ( = ?auto_605540 ?auto_605543 ) ) ( not ( = ?auto_605540 ?auto_605544 ) ) ( not ( = ?auto_605541 ?auto_605542 ) ) ( not ( = ?auto_605541 ?auto_605543 ) ) ( not ( = ?auto_605541 ?auto_605544 ) ) ( not ( = ?auto_605542 ?auto_605543 ) ) ( not ( = ?auto_605542 ?auto_605544 ) ) ( not ( = ?auto_605543 ?auto_605544 ) ) ( ON ?auto_605542 ?auto_605543 ) ( ON ?auto_605541 ?auto_605542 ) ( CLEAR ?auto_605539 ) ( ON ?auto_605540 ?auto_605541 ) ( CLEAR ?auto_605540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_605539 ?auto_605540 )
      ( MAKE-5PILE ?auto_605539 ?auto_605540 ?auto_605541 ?auto_605542 ?auto_605543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_605561 - BLOCK
      ?auto_605562 - BLOCK
      ?auto_605563 - BLOCK
      ?auto_605564 - BLOCK
      ?auto_605565 - BLOCK
    )
    :vars
    (
      ?auto_605566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605565 ?auto_605566 ) ( not ( = ?auto_605561 ?auto_605562 ) ) ( not ( = ?auto_605561 ?auto_605563 ) ) ( not ( = ?auto_605561 ?auto_605564 ) ) ( not ( = ?auto_605561 ?auto_605565 ) ) ( not ( = ?auto_605561 ?auto_605566 ) ) ( not ( = ?auto_605562 ?auto_605563 ) ) ( not ( = ?auto_605562 ?auto_605564 ) ) ( not ( = ?auto_605562 ?auto_605565 ) ) ( not ( = ?auto_605562 ?auto_605566 ) ) ( not ( = ?auto_605563 ?auto_605564 ) ) ( not ( = ?auto_605563 ?auto_605565 ) ) ( not ( = ?auto_605563 ?auto_605566 ) ) ( not ( = ?auto_605564 ?auto_605565 ) ) ( not ( = ?auto_605564 ?auto_605566 ) ) ( not ( = ?auto_605565 ?auto_605566 ) ) ( ON ?auto_605564 ?auto_605565 ) ( ON ?auto_605563 ?auto_605564 ) ( ON ?auto_605562 ?auto_605563 ) ( ON ?auto_605561 ?auto_605562 ) ( CLEAR ?auto_605561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_605561 )
      ( MAKE-5PILE ?auto_605561 ?auto_605562 ?auto_605563 ?auto_605564 ?auto_605565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_605584 - BLOCK
      ?auto_605585 - BLOCK
      ?auto_605586 - BLOCK
      ?auto_605587 - BLOCK
      ?auto_605588 - BLOCK
      ?auto_605589 - BLOCK
    )
    :vars
    (
      ?auto_605590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_605588 ) ( ON ?auto_605589 ?auto_605590 ) ( CLEAR ?auto_605589 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_605584 ) ( ON ?auto_605585 ?auto_605584 ) ( ON ?auto_605586 ?auto_605585 ) ( ON ?auto_605587 ?auto_605586 ) ( ON ?auto_605588 ?auto_605587 ) ( not ( = ?auto_605584 ?auto_605585 ) ) ( not ( = ?auto_605584 ?auto_605586 ) ) ( not ( = ?auto_605584 ?auto_605587 ) ) ( not ( = ?auto_605584 ?auto_605588 ) ) ( not ( = ?auto_605584 ?auto_605589 ) ) ( not ( = ?auto_605584 ?auto_605590 ) ) ( not ( = ?auto_605585 ?auto_605586 ) ) ( not ( = ?auto_605585 ?auto_605587 ) ) ( not ( = ?auto_605585 ?auto_605588 ) ) ( not ( = ?auto_605585 ?auto_605589 ) ) ( not ( = ?auto_605585 ?auto_605590 ) ) ( not ( = ?auto_605586 ?auto_605587 ) ) ( not ( = ?auto_605586 ?auto_605588 ) ) ( not ( = ?auto_605586 ?auto_605589 ) ) ( not ( = ?auto_605586 ?auto_605590 ) ) ( not ( = ?auto_605587 ?auto_605588 ) ) ( not ( = ?auto_605587 ?auto_605589 ) ) ( not ( = ?auto_605587 ?auto_605590 ) ) ( not ( = ?auto_605588 ?auto_605589 ) ) ( not ( = ?auto_605588 ?auto_605590 ) ) ( not ( = ?auto_605589 ?auto_605590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_605589 ?auto_605590 )
      ( !STACK ?auto_605589 ?auto_605588 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_605610 - BLOCK
      ?auto_605611 - BLOCK
      ?auto_605612 - BLOCK
      ?auto_605613 - BLOCK
      ?auto_605614 - BLOCK
      ?auto_605615 - BLOCK
    )
    :vars
    (
      ?auto_605616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605615 ?auto_605616 ) ( ON-TABLE ?auto_605610 ) ( ON ?auto_605611 ?auto_605610 ) ( ON ?auto_605612 ?auto_605611 ) ( ON ?auto_605613 ?auto_605612 ) ( not ( = ?auto_605610 ?auto_605611 ) ) ( not ( = ?auto_605610 ?auto_605612 ) ) ( not ( = ?auto_605610 ?auto_605613 ) ) ( not ( = ?auto_605610 ?auto_605614 ) ) ( not ( = ?auto_605610 ?auto_605615 ) ) ( not ( = ?auto_605610 ?auto_605616 ) ) ( not ( = ?auto_605611 ?auto_605612 ) ) ( not ( = ?auto_605611 ?auto_605613 ) ) ( not ( = ?auto_605611 ?auto_605614 ) ) ( not ( = ?auto_605611 ?auto_605615 ) ) ( not ( = ?auto_605611 ?auto_605616 ) ) ( not ( = ?auto_605612 ?auto_605613 ) ) ( not ( = ?auto_605612 ?auto_605614 ) ) ( not ( = ?auto_605612 ?auto_605615 ) ) ( not ( = ?auto_605612 ?auto_605616 ) ) ( not ( = ?auto_605613 ?auto_605614 ) ) ( not ( = ?auto_605613 ?auto_605615 ) ) ( not ( = ?auto_605613 ?auto_605616 ) ) ( not ( = ?auto_605614 ?auto_605615 ) ) ( not ( = ?auto_605614 ?auto_605616 ) ) ( not ( = ?auto_605615 ?auto_605616 ) ) ( CLEAR ?auto_605613 ) ( ON ?auto_605614 ?auto_605615 ) ( CLEAR ?auto_605614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_605610 ?auto_605611 ?auto_605612 ?auto_605613 ?auto_605614 )
      ( MAKE-6PILE ?auto_605610 ?auto_605611 ?auto_605612 ?auto_605613 ?auto_605614 ?auto_605615 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_605636 - BLOCK
      ?auto_605637 - BLOCK
      ?auto_605638 - BLOCK
      ?auto_605639 - BLOCK
      ?auto_605640 - BLOCK
      ?auto_605641 - BLOCK
    )
    :vars
    (
      ?auto_605642 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605641 ?auto_605642 ) ( ON-TABLE ?auto_605636 ) ( ON ?auto_605637 ?auto_605636 ) ( ON ?auto_605638 ?auto_605637 ) ( not ( = ?auto_605636 ?auto_605637 ) ) ( not ( = ?auto_605636 ?auto_605638 ) ) ( not ( = ?auto_605636 ?auto_605639 ) ) ( not ( = ?auto_605636 ?auto_605640 ) ) ( not ( = ?auto_605636 ?auto_605641 ) ) ( not ( = ?auto_605636 ?auto_605642 ) ) ( not ( = ?auto_605637 ?auto_605638 ) ) ( not ( = ?auto_605637 ?auto_605639 ) ) ( not ( = ?auto_605637 ?auto_605640 ) ) ( not ( = ?auto_605637 ?auto_605641 ) ) ( not ( = ?auto_605637 ?auto_605642 ) ) ( not ( = ?auto_605638 ?auto_605639 ) ) ( not ( = ?auto_605638 ?auto_605640 ) ) ( not ( = ?auto_605638 ?auto_605641 ) ) ( not ( = ?auto_605638 ?auto_605642 ) ) ( not ( = ?auto_605639 ?auto_605640 ) ) ( not ( = ?auto_605639 ?auto_605641 ) ) ( not ( = ?auto_605639 ?auto_605642 ) ) ( not ( = ?auto_605640 ?auto_605641 ) ) ( not ( = ?auto_605640 ?auto_605642 ) ) ( not ( = ?auto_605641 ?auto_605642 ) ) ( ON ?auto_605640 ?auto_605641 ) ( CLEAR ?auto_605638 ) ( ON ?auto_605639 ?auto_605640 ) ( CLEAR ?auto_605639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_605636 ?auto_605637 ?auto_605638 ?auto_605639 )
      ( MAKE-6PILE ?auto_605636 ?auto_605637 ?auto_605638 ?auto_605639 ?auto_605640 ?auto_605641 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_605662 - BLOCK
      ?auto_605663 - BLOCK
      ?auto_605664 - BLOCK
      ?auto_605665 - BLOCK
      ?auto_605666 - BLOCK
      ?auto_605667 - BLOCK
    )
    :vars
    (
      ?auto_605668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605667 ?auto_605668 ) ( ON-TABLE ?auto_605662 ) ( ON ?auto_605663 ?auto_605662 ) ( not ( = ?auto_605662 ?auto_605663 ) ) ( not ( = ?auto_605662 ?auto_605664 ) ) ( not ( = ?auto_605662 ?auto_605665 ) ) ( not ( = ?auto_605662 ?auto_605666 ) ) ( not ( = ?auto_605662 ?auto_605667 ) ) ( not ( = ?auto_605662 ?auto_605668 ) ) ( not ( = ?auto_605663 ?auto_605664 ) ) ( not ( = ?auto_605663 ?auto_605665 ) ) ( not ( = ?auto_605663 ?auto_605666 ) ) ( not ( = ?auto_605663 ?auto_605667 ) ) ( not ( = ?auto_605663 ?auto_605668 ) ) ( not ( = ?auto_605664 ?auto_605665 ) ) ( not ( = ?auto_605664 ?auto_605666 ) ) ( not ( = ?auto_605664 ?auto_605667 ) ) ( not ( = ?auto_605664 ?auto_605668 ) ) ( not ( = ?auto_605665 ?auto_605666 ) ) ( not ( = ?auto_605665 ?auto_605667 ) ) ( not ( = ?auto_605665 ?auto_605668 ) ) ( not ( = ?auto_605666 ?auto_605667 ) ) ( not ( = ?auto_605666 ?auto_605668 ) ) ( not ( = ?auto_605667 ?auto_605668 ) ) ( ON ?auto_605666 ?auto_605667 ) ( ON ?auto_605665 ?auto_605666 ) ( CLEAR ?auto_605663 ) ( ON ?auto_605664 ?auto_605665 ) ( CLEAR ?auto_605664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_605662 ?auto_605663 ?auto_605664 )
      ( MAKE-6PILE ?auto_605662 ?auto_605663 ?auto_605664 ?auto_605665 ?auto_605666 ?auto_605667 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_605688 - BLOCK
      ?auto_605689 - BLOCK
      ?auto_605690 - BLOCK
      ?auto_605691 - BLOCK
      ?auto_605692 - BLOCK
      ?auto_605693 - BLOCK
    )
    :vars
    (
      ?auto_605694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605693 ?auto_605694 ) ( ON-TABLE ?auto_605688 ) ( not ( = ?auto_605688 ?auto_605689 ) ) ( not ( = ?auto_605688 ?auto_605690 ) ) ( not ( = ?auto_605688 ?auto_605691 ) ) ( not ( = ?auto_605688 ?auto_605692 ) ) ( not ( = ?auto_605688 ?auto_605693 ) ) ( not ( = ?auto_605688 ?auto_605694 ) ) ( not ( = ?auto_605689 ?auto_605690 ) ) ( not ( = ?auto_605689 ?auto_605691 ) ) ( not ( = ?auto_605689 ?auto_605692 ) ) ( not ( = ?auto_605689 ?auto_605693 ) ) ( not ( = ?auto_605689 ?auto_605694 ) ) ( not ( = ?auto_605690 ?auto_605691 ) ) ( not ( = ?auto_605690 ?auto_605692 ) ) ( not ( = ?auto_605690 ?auto_605693 ) ) ( not ( = ?auto_605690 ?auto_605694 ) ) ( not ( = ?auto_605691 ?auto_605692 ) ) ( not ( = ?auto_605691 ?auto_605693 ) ) ( not ( = ?auto_605691 ?auto_605694 ) ) ( not ( = ?auto_605692 ?auto_605693 ) ) ( not ( = ?auto_605692 ?auto_605694 ) ) ( not ( = ?auto_605693 ?auto_605694 ) ) ( ON ?auto_605692 ?auto_605693 ) ( ON ?auto_605691 ?auto_605692 ) ( ON ?auto_605690 ?auto_605691 ) ( CLEAR ?auto_605688 ) ( ON ?auto_605689 ?auto_605690 ) ( CLEAR ?auto_605689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_605688 ?auto_605689 )
      ( MAKE-6PILE ?auto_605688 ?auto_605689 ?auto_605690 ?auto_605691 ?auto_605692 ?auto_605693 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_605714 - BLOCK
      ?auto_605715 - BLOCK
      ?auto_605716 - BLOCK
      ?auto_605717 - BLOCK
      ?auto_605718 - BLOCK
      ?auto_605719 - BLOCK
    )
    :vars
    (
      ?auto_605720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605719 ?auto_605720 ) ( not ( = ?auto_605714 ?auto_605715 ) ) ( not ( = ?auto_605714 ?auto_605716 ) ) ( not ( = ?auto_605714 ?auto_605717 ) ) ( not ( = ?auto_605714 ?auto_605718 ) ) ( not ( = ?auto_605714 ?auto_605719 ) ) ( not ( = ?auto_605714 ?auto_605720 ) ) ( not ( = ?auto_605715 ?auto_605716 ) ) ( not ( = ?auto_605715 ?auto_605717 ) ) ( not ( = ?auto_605715 ?auto_605718 ) ) ( not ( = ?auto_605715 ?auto_605719 ) ) ( not ( = ?auto_605715 ?auto_605720 ) ) ( not ( = ?auto_605716 ?auto_605717 ) ) ( not ( = ?auto_605716 ?auto_605718 ) ) ( not ( = ?auto_605716 ?auto_605719 ) ) ( not ( = ?auto_605716 ?auto_605720 ) ) ( not ( = ?auto_605717 ?auto_605718 ) ) ( not ( = ?auto_605717 ?auto_605719 ) ) ( not ( = ?auto_605717 ?auto_605720 ) ) ( not ( = ?auto_605718 ?auto_605719 ) ) ( not ( = ?auto_605718 ?auto_605720 ) ) ( not ( = ?auto_605719 ?auto_605720 ) ) ( ON ?auto_605718 ?auto_605719 ) ( ON ?auto_605717 ?auto_605718 ) ( ON ?auto_605716 ?auto_605717 ) ( ON ?auto_605715 ?auto_605716 ) ( ON ?auto_605714 ?auto_605715 ) ( CLEAR ?auto_605714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_605714 )
      ( MAKE-6PILE ?auto_605714 ?auto_605715 ?auto_605716 ?auto_605717 ?auto_605718 ?auto_605719 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_605741 - BLOCK
      ?auto_605742 - BLOCK
      ?auto_605743 - BLOCK
      ?auto_605744 - BLOCK
      ?auto_605745 - BLOCK
      ?auto_605746 - BLOCK
      ?auto_605747 - BLOCK
    )
    :vars
    (
      ?auto_605748 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_605746 ) ( ON ?auto_605747 ?auto_605748 ) ( CLEAR ?auto_605747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_605741 ) ( ON ?auto_605742 ?auto_605741 ) ( ON ?auto_605743 ?auto_605742 ) ( ON ?auto_605744 ?auto_605743 ) ( ON ?auto_605745 ?auto_605744 ) ( ON ?auto_605746 ?auto_605745 ) ( not ( = ?auto_605741 ?auto_605742 ) ) ( not ( = ?auto_605741 ?auto_605743 ) ) ( not ( = ?auto_605741 ?auto_605744 ) ) ( not ( = ?auto_605741 ?auto_605745 ) ) ( not ( = ?auto_605741 ?auto_605746 ) ) ( not ( = ?auto_605741 ?auto_605747 ) ) ( not ( = ?auto_605741 ?auto_605748 ) ) ( not ( = ?auto_605742 ?auto_605743 ) ) ( not ( = ?auto_605742 ?auto_605744 ) ) ( not ( = ?auto_605742 ?auto_605745 ) ) ( not ( = ?auto_605742 ?auto_605746 ) ) ( not ( = ?auto_605742 ?auto_605747 ) ) ( not ( = ?auto_605742 ?auto_605748 ) ) ( not ( = ?auto_605743 ?auto_605744 ) ) ( not ( = ?auto_605743 ?auto_605745 ) ) ( not ( = ?auto_605743 ?auto_605746 ) ) ( not ( = ?auto_605743 ?auto_605747 ) ) ( not ( = ?auto_605743 ?auto_605748 ) ) ( not ( = ?auto_605744 ?auto_605745 ) ) ( not ( = ?auto_605744 ?auto_605746 ) ) ( not ( = ?auto_605744 ?auto_605747 ) ) ( not ( = ?auto_605744 ?auto_605748 ) ) ( not ( = ?auto_605745 ?auto_605746 ) ) ( not ( = ?auto_605745 ?auto_605747 ) ) ( not ( = ?auto_605745 ?auto_605748 ) ) ( not ( = ?auto_605746 ?auto_605747 ) ) ( not ( = ?auto_605746 ?auto_605748 ) ) ( not ( = ?auto_605747 ?auto_605748 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_605747 ?auto_605748 )
      ( !STACK ?auto_605747 ?auto_605746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_605771 - BLOCK
      ?auto_605772 - BLOCK
      ?auto_605773 - BLOCK
      ?auto_605774 - BLOCK
      ?auto_605775 - BLOCK
      ?auto_605776 - BLOCK
      ?auto_605777 - BLOCK
    )
    :vars
    (
      ?auto_605778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605777 ?auto_605778 ) ( ON-TABLE ?auto_605771 ) ( ON ?auto_605772 ?auto_605771 ) ( ON ?auto_605773 ?auto_605772 ) ( ON ?auto_605774 ?auto_605773 ) ( ON ?auto_605775 ?auto_605774 ) ( not ( = ?auto_605771 ?auto_605772 ) ) ( not ( = ?auto_605771 ?auto_605773 ) ) ( not ( = ?auto_605771 ?auto_605774 ) ) ( not ( = ?auto_605771 ?auto_605775 ) ) ( not ( = ?auto_605771 ?auto_605776 ) ) ( not ( = ?auto_605771 ?auto_605777 ) ) ( not ( = ?auto_605771 ?auto_605778 ) ) ( not ( = ?auto_605772 ?auto_605773 ) ) ( not ( = ?auto_605772 ?auto_605774 ) ) ( not ( = ?auto_605772 ?auto_605775 ) ) ( not ( = ?auto_605772 ?auto_605776 ) ) ( not ( = ?auto_605772 ?auto_605777 ) ) ( not ( = ?auto_605772 ?auto_605778 ) ) ( not ( = ?auto_605773 ?auto_605774 ) ) ( not ( = ?auto_605773 ?auto_605775 ) ) ( not ( = ?auto_605773 ?auto_605776 ) ) ( not ( = ?auto_605773 ?auto_605777 ) ) ( not ( = ?auto_605773 ?auto_605778 ) ) ( not ( = ?auto_605774 ?auto_605775 ) ) ( not ( = ?auto_605774 ?auto_605776 ) ) ( not ( = ?auto_605774 ?auto_605777 ) ) ( not ( = ?auto_605774 ?auto_605778 ) ) ( not ( = ?auto_605775 ?auto_605776 ) ) ( not ( = ?auto_605775 ?auto_605777 ) ) ( not ( = ?auto_605775 ?auto_605778 ) ) ( not ( = ?auto_605776 ?auto_605777 ) ) ( not ( = ?auto_605776 ?auto_605778 ) ) ( not ( = ?auto_605777 ?auto_605778 ) ) ( CLEAR ?auto_605775 ) ( ON ?auto_605776 ?auto_605777 ) ( CLEAR ?auto_605776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_605771 ?auto_605772 ?auto_605773 ?auto_605774 ?auto_605775 ?auto_605776 )
      ( MAKE-7PILE ?auto_605771 ?auto_605772 ?auto_605773 ?auto_605774 ?auto_605775 ?auto_605776 ?auto_605777 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_605801 - BLOCK
      ?auto_605802 - BLOCK
      ?auto_605803 - BLOCK
      ?auto_605804 - BLOCK
      ?auto_605805 - BLOCK
      ?auto_605806 - BLOCK
      ?auto_605807 - BLOCK
    )
    :vars
    (
      ?auto_605808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605807 ?auto_605808 ) ( ON-TABLE ?auto_605801 ) ( ON ?auto_605802 ?auto_605801 ) ( ON ?auto_605803 ?auto_605802 ) ( ON ?auto_605804 ?auto_605803 ) ( not ( = ?auto_605801 ?auto_605802 ) ) ( not ( = ?auto_605801 ?auto_605803 ) ) ( not ( = ?auto_605801 ?auto_605804 ) ) ( not ( = ?auto_605801 ?auto_605805 ) ) ( not ( = ?auto_605801 ?auto_605806 ) ) ( not ( = ?auto_605801 ?auto_605807 ) ) ( not ( = ?auto_605801 ?auto_605808 ) ) ( not ( = ?auto_605802 ?auto_605803 ) ) ( not ( = ?auto_605802 ?auto_605804 ) ) ( not ( = ?auto_605802 ?auto_605805 ) ) ( not ( = ?auto_605802 ?auto_605806 ) ) ( not ( = ?auto_605802 ?auto_605807 ) ) ( not ( = ?auto_605802 ?auto_605808 ) ) ( not ( = ?auto_605803 ?auto_605804 ) ) ( not ( = ?auto_605803 ?auto_605805 ) ) ( not ( = ?auto_605803 ?auto_605806 ) ) ( not ( = ?auto_605803 ?auto_605807 ) ) ( not ( = ?auto_605803 ?auto_605808 ) ) ( not ( = ?auto_605804 ?auto_605805 ) ) ( not ( = ?auto_605804 ?auto_605806 ) ) ( not ( = ?auto_605804 ?auto_605807 ) ) ( not ( = ?auto_605804 ?auto_605808 ) ) ( not ( = ?auto_605805 ?auto_605806 ) ) ( not ( = ?auto_605805 ?auto_605807 ) ) ( not ( = ?auto_605805 ?auto_605808 ) ) ( not ( = ?auto_605806 ?auto_605807 ) ) ( not ( = ?auto_605806 ?auto_605808 ) ) ( not ( = ?auto_605807 ?auto_605808 ) ) ( ON ?auto_605806 ?auto_605807 ) ( CLEAR ?auto_605804 ) ( ON ?auto_605805 ?auto_605806 ) ( CLEAR ?auto_605805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_605801 ?auto_605802 ?auto_605803 ?auto_605804 ?auto_605805 )
      ( MAKE-7PILE ?auto_605801 ?auto_605802 ?auto_605803 ?auto_605804 ?auto_605805 ?auto_605806 ?auto_605807 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_605831 - BLOCK
      ?auto_605832 - BLOCK
      ?auto_605833 - BLOCK
      ?auto_605834 - BLOCK
      ?auto_605835 - BLOCK
      ?auto_605836 - BLOCK
      ?auto_605837 - BLOCK
    )
    :vars
    (
      ?auto_605838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605837 ?auto_605838 ) ( ON-TABLE ?auto_605831 ) ( ON ?auto_605832 ?auto_605831 ) ( ON ?auto_605833 ?auto_605832 ) ( not ( = ?auto_605831 ?auto_605832 ) ) ( not ( = ?auto_605831 ?auto_605833 ) ) ( not ( = ?auto_605831 ?auto_605834 ) ) ( not ( = ?auto_605831 ?auto_605835 ) ) ( not ( = ?auto_605831 ?auto_605836 ) ) ( not ( = ?auto_605831 ?auto_605837 ) ) ( not ( = ?auto_605831 ?auto_605838 ) ) ( not ( = ?auto_605832 ?auto_605833 ) ) ( not ( = ?auto_605832 ?auto_605834 ) ) ( not ( = ?auto_605832 ?auto_605835 ) ) ( not ( = ?auto_605832 ?auto_605836 ) ) ( not ( = ?auto_605832 ?auto_605837 ) ) ( not ( = ?auto_605832 ?auto_605838 ) ) ( not ( = ?auto_605833 ?auto_605834 ) ) ( not ( = ?auto_605833 ?auto_605835 ) ) ( not ( = ?auto_605833 ?auto_605836 ) ) ( not ( = ?auto_605833 ?auto_605837 ) ) ( not ( = ?auto_605833 ?auto_605838 ) ) ( not ( = ?auto_605834 ?auto_605835 ) ) ( not ( = ?auto_605834 ?auto_605836 ) ) ( not ( = ?auto_605834 ?auto_605837 ) ) ( not ( = ?auto_605834 ?auto_605838 ) ) ( not ( = ?auto_605835 ?auto_605836 ) ) ( not ( = ?auto_605835 ?auto_605837 ) ) ( not ( = ?auto_605835 ?auto_605838 ) ) ( not ( = ?auto_605836 ?auto_605837 ) ) ( not ( = ?auto_605836 ?auto_605838 ) ) ( not ( = ?auto_605837 ?auto_605838 ) ) ( ON ?auto_605836 ?auto_605837 ) ( ON ?auto_605835 ?auto_605836 ) ( CLEAR ?auto_605833 ) ( ON ?auto_605834 ?auto_605835 ) ( CLEAR ?auto_605834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_605831 ?auto_605832 ?auto_605833 ?auto_605834 )
      ( MAKE-7PILE ?auto_605831 ?auto_605832 ?auto_605833 ?auto_605834 ?auto_605835 ?auto_605836 ?auto_605837 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_605861 - BLOCK
      ?auto_605862 - BLOCK
      ?auto_605863 - BLOCK
      ?auto_605864 - BLOCK
      ?auto_605865 - BLOCK
      ?auto_605866 - BLOCK
      ?auto_605867 - BLOCK
    )
    :vars
    (
      ?auto_605868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605867 ?auto_605868 ) ( ON-TABLE ?auto_605861 ) ( ON ?auto_605862 ?auto_605861 ) ( not ( = ?auto_605861 ?auto_605862 ) ) ( not ( = ?auto_605861 ?auto_605863 ) ) ( not ( = ?auto_605861 ?auto_605864 ) ) ( not ( = ?auto_605861 ?auto_605865 ) ) ( not ( = ?auto_605861 ?auto_605866 ) ) ( not ( = ?auto_605861 ?auto_605867 ) ) ( not ( = ?auto_605861 ?auto_605868 ) ) ( not ( = ?auto_605862 ?auto_605863 ) ) ( not ( = ?auto_605862 ?auto_605864 ) ) ( not ( = ?auto_605862 ?auto_605865 ) ) ( not ( = ?auto_605862 ?auto_605866 ) ) ( not ( = ?auto_605862 ?auto_605867 ) ) ( not ( = ?auto_605862 ?auto_605868 ) ) ( not ( = ?auto_605863 ?auto_605864 ) ) ( not ( = ?auto_605863 ?auto_605865 ) ) ( not ( = ?auto_605863 ?auto_605866 ) ) ( not ( = ?auto_605863 ?auto_605867 ) ) ( not ( = ?auto_605863 ?auto_605868 ) ) ( not ( = ?auto_605864 ?auto_605865 ) ) ( not ( = ?auto_605864 ?auto_605866 ) ) ( not ( = ?auto_605864 ?auto_605867 ) ) ( not ( = ?auto_605864 ?auto_605868 ) ) ( not ( = ?auto_605865 ?auto_605866 ) ) ( not ( = ?auto_605865 ?auto_605867 ) ) ( not ( = ?auto_605865 ?auto_605868 ) ) ( not ( = ?auto_605866 ?auto_605867 ) ) ( not ( = ?auto_605866 ?auto_605868 ) ) ( not ( = ?auto_605867 ?auto_605868 ) ) ( ON ?auto_605866 ?auto_605867 ) ( ON ?auto_605865 ?auto_605866 ) ( ON ?auto_605864 ?auto_605865 ) ( CLEAR ?auto_605862 ) ( ON ?auto_605863 ?auto_605864 ) ( CLEAR ?auto_605863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_605861 ?auto_605862 ?auto_605863 )
      ( MAKE-7PILE ?auto_605861 ?auto_605862 ?auto_605863 ?auto_605864 ?auto_605865 ?auto_605866 ?auto_605867 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_605891 - BLOCK
      ?auto_605892 - BLOCK
      ?auto_605893 - BLOCK
      ?auto_605894 - BLOCK
      ?auto_605895 - BLOCK
      ?auto_605896 - BLOCK
      ?auto_605897 - BLOCK
    )
    :vars
    (
      ?auto_605898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605897 ?auto_605898 ) ( ON-TABLE ?auto_605891 ) ( not ( = ?auto_605891 ?auto_605892 ) ) ( not ( = ?auto_605891 ?auto_605893 ) ) ( not ( = ?auto_605891 ?auto_605894 ) ) ( not ( = ?auto_605891 ?auto_605895 ) ) ( not ( = ?auto_605891 ?auto_605896 ) ) ( not ( = ?auto_605891 ?auto_605897 ) ) ( not ( = ?auto_605891 ?auto_605898 ) ) ( not ( = ?auto_605892 ?auto_605893 ) ) ( not ( = ?auto_605892 ?auto_605894 ) ) ( not ( = ?auto_605892 ?auto_605895 ) ) ( not ( = ?auto_605892 ?auto_605896 ) ) ( not ( = ?auto_605892 ?auto_605897 ) ) ( not ( = ?auto_605892 ?auto_605898 ) ) ( not ( = ?auto_605893 ?auto_605894 ) ) ( not ( = ?auto_605893 ?auto_605895 ) ) ( not ( = ?auto_605893 ?auto_605896 ) ) ( not ( = ?auto_605893 ?auto_605897 ) ) ( not ( = ?auto_605893 ?auto_605898 ) ) ( not ( = ?auto_605894 ?auto_605895 ) ) ( not ( = ?auto_605894 ?auto_605896 ) ) ( not ( = ?auto_605894 ?auto_605897 ) ) ( not ( = ?auto_605894 ?auto_605898 ) ) ( not ( = ?auto_605895 ?auto_605896 ) ) ( not ( = ?auto_605895 ?auto_605897 ) ) ( not ( = ?auto_605895 ?auto_605898 ) ) ( not ( = ?auto_605896 ?auto_605897 ) ) ( not ( = ?auto_605896 ?auto_605898 ) ) ( not ( = ?auto_605897 ?auto_605898 ) ) ( ON ?auto_605896 ?auto_605897 ) ( ON ?auto_605895 ?auto_605896 ) ( ON ?auto_605894 ?auto_605895 ) ( ON ?auto_605893 ?auto_605894 ) ( CLEAR ?auto_605891 ) ( ON ?auto_605892 ?auto_605893 ) ( CLEAR ?auto_605892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_605891 ?auto_605892 )
      ( MAKE-7PILE ?auto_605891 ?auto_605892 ?auto_605893 ?auto_605894 ?auto_605895 ?auto_605896 ?auto_605897 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_605921 - BLOCK
      ?auto_605922 - BLOCK
      ?auto_605923 - BLOCK
      ?auto_605924 - BLOCK
      ?auto_605925 - BLOCK
      ?auto_605926 - BLOCK
      ?auto_605927 - BLOCK
    )
    :vars
    (
      ?auto_605928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605927 ?auto_605928 ) ( not ( = ?auto_605921 ?auto_605922 ) ) ( not ( = ?auto_605921 ?auto_605923 ) ) ( not ( = ?auto_605921 ?auto_605924 ) ) ( not ( = ?auto_605921 ?auto_605925 ) ) ( not ( = ?auto_605921 ?auto_605926 ) ) ( not ( = ?auto_605921 ?auto_605927 ) ) ( not ( = ?auto_605921 ?auto_605928 ) ) ( not ( = ?auto_605922 ?auto_605923 ) ) ( not ( = ?auto_605922 ?auto_605924 ) ) ( not ( = ?auto_605922 ?auto_605925 ) ) ( not ( = ?auto_605922 ?auto_605926 ) ) ( not ( = ?auto_605922 ?auto_605927 ) ) ( not ( = ?auto_605922 ?auto_605928 ) ) ( not ( = ?auto_605923 ?auto_605924 ) ) ( not ( = ?auto_605923 ?auto_605925 ) ) ( not ( = ?auto_605923 ?auto_605926 ) ) ( not ( = ?auto_605923 ?auto_605927 ) ) ( not ( = ?auto_605923 ?auto_605928 ) ) ( not ( = ?auto_605924 ?auto_605925 ) ) ( not ( = ?auto_605924 ?auto_605926 ) ) ( not ( = ?auto_605924 ?auto_605927 ) ) ( not ( = ?auto_605924 ?auto_605928 ) ) ( not ( = ?auto_605925 ?auto_605926 ) ) ( not ( = ?auto_605925 ?auto_605927 ) ) ( not ( = ?auto_605925 ?auto_605928 ) ) ( not ( = ?auto_605926 ?auto_605927 ) ) ( not ( = ?auto_605926 ?auto_605928 ) ) ( not ( = ?auto_605927 ?auto_605928 ) ) ( ON ?auto_605926 ?auto_605927 ) ( ON ?auto_605925 ?auto_605926 ) ( ON ?auto_605924 ?auto_605925 ) ( ON ?auto_605923 ?auto_605924 ) ( ON ?auto_605922 ?auto_605923 ) ( ON ?auto_605921 ?auto_605922 ) ( CLEAR ?auto_605921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_605921 )
      ( MAKE-7PILE ?auto_605921 ?auto_605922 ?auto_605923 ?auto_605924 ?auto_605925 ?auto_605926 ?auto_605927 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_605952 - BLOCK
      ?auto_605953 - BLOCK
      ?auto_605954 - BLOCK
      ?auto_605955 - BLOCK
      ?auto_605956 - BLOCK
      ?auto_605957 - BLOCK
      ?auto_605958 - BLOCK
      ?auto_605959 - BLOCK
    )
    :vars
    (
      ?auto_605960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_605958 ) ( ON ?auto_605959 ?auto_605960 ) ( CLEAR ?auto_605959 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_605952 ) ( ON ?auto_605953 ?auto_605952 ) ( ON ?auto_605954 ?auto_605953 ) ( ON ?auto_605955 ?auto_605954 ) ( ON ?auto_605956 ?auto_605955 ) ( ON ?auto_605957 ?auto_605956 ) ( ON ?auto_605958 ?auto_605957 ) ( not ( = ?auto_605952 ?auto_605953 ) ) ( not ( = ?auto_605952 ?auto_605954 ) ) ( not ( = ?auto_605952 ?auto_605955 ) ) ( not ( = ?auto_605952 ?auto_605956 ) ) ( not ( = ?auto_605952 ?auto_605957 ) ) ( not ( = ?auto_605952 ?auto_605958 ) ) ( not ( = ?auto_605952 ?auto_605959 ) ) ( not ( = ?auto_605952 ?auto_605960 ) ) ( not ( = ?auto_605953 ?auto_605954 ) ) ( not ( = ?auto_605953 ?auto_605955 ) ) ( not ( = ?auto_605953 ?auto_605956 ) ) ( not ( = ?auto_605953 ?auto_605957 ) ) ( not ( = ?auto_605953 ?auto_605958 ) ) ( not ( = ?auto_605953 ?auto_605959 ) ) ( not ( = ?auto_605953 ?auto_605960 ) ) ( not ( = ?auto_605954 ?auto_605955 ) ) ( not ( = ?auto_605954 ?auto_605956 ) ) ( not ( = ?auto_605954 ?auto_605957 ) ) ( not ( = ?auto_605954 ?auto_605958 ) ) ( not ( = ?auto_605954 ?auto_605959 ) ) ( not ( = ?auto_605954 ?auto_605960 ) ) ( not ( = ?auto_605955 ?auto_605956 ) ) ( not ( = ?auto_605955 ?auto_605957 ) ) ( not ( = ?auto_605955 ?auto_605958 ) ) ( not ( = ?auto_605955 ?auto_605959 ) ) ( not ( = ?auto_605955 ?auto_605960 ) ) ( not ( = ?auto_605956 ?auto_605957 ) ) ( not ( = ?auto_605956 ?auto_605958 ) ) ( not ( = ?auto_605956 ?auto_605959 ) ) ( not ( = ?auto_605956 ?auto_605960 ) ) ( not ( = ?auto_605957 ?auto_605958 ) ) ( not ( = ?auto_605957 ?auto_605959 ) ) ( not ( = ?auto_605957 ?auto_605960 ) ) ( not ( = ?auto_605958 ?auto_605959 ) ) ( not ( = ?auto_605958 ?auto_605960 ) ) ( not ( = ?auto_605959 ?auto_605960 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_605959 ?auto_605960 )
      ( !STACK ?auto_605959 ?auto_605958 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_605986 - BLOCK
      ?auto_605987 - BLOCK
      ?auto_605988 - BLOCK
      ?auto_605989 - BLOCK
      ?auto_605990 - BLOCK
      ?auto_605991 - BLOCK
      ?auto_605992 - BLOCK
      ?auto_605993 - BLOCK
    )
    :vars
    (
      ?auto_605994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605993 ?auto_605994 ) ( ON-TABLE ?auto_605986 ) ( ON ?auto_605987 ?auto_605986 ) ( ON ?auto_605988 ?auto_605987 ) ( ON ?auto_605989 ?auto_605988 ) ( ON ?auto_605990 ?auto_605989 ) ( ON ?auto_605991 ?auto_605990 ) ( not ( = ?auto_605986 ?auto_605987 ) ) ( not ( = ?auto_605986 ?auto_605988 ) ) ( not ( = ?auto_605986 ?auto_605989 ) ) ( not ( = ?auto_605986 ?auto_605990 ) ) ( not ( = ?auto_605986 ?auto_605991 ) ) ( not ( = ?auto_605986 ?auto_605992 ) ) ( not ( = ?auto_605986 ?auto_605993 ) ) ( not ( = ?auto_605986 ?auto_605994 ) ) ( not ( = ?auto_605987 ?auto_605988 ) ) ( not ( = ?auto_605987 ?auto_605989 ) ) ( not ( = ?auto_605987 ?auto_605990 ) ) ( not ( = ?auto_605987 ?auto_605991 ) ) ( not ( = ?auto_605987 ?auto_605992 ) ) ( not ( = ?auto_605987 ?auto_605993 ) ) ( not ( = ?auto_605987 ?auto_605994 ) ) ( not ( = ?auto_605988 ?auto_605989 ) ) ( not ( = ?auto_605988 ?auto_605990 ) ) ( not ( = ?auto_605988 ?auto_605991 ) ) ( not ( = ?auto_605988 ?auto_605992 ) ) ( not ( = ?auto_605988 ?auto_605993 ) ) ( not ( = ?auto_605988 ?auto_605994 ) ) ( not ( = ?auto_605989 ?auto_605990 ) ) ( not ( = ?auto_605989 ?auto_605991 ) ) ( not ( = ?auto_605989 ?auto_605992 ) ) ( not ( = ?auto_605989 ?auto_605993 ) ) ( not ( = ?auto_605989 ?auto_605994 ) ) ( not ( = ?auto_605990 ?auto_605991 ) ) ( not ( = ?auto_605990 ?auto_605992 ) ) ( not ( = ?auto_605990 ?auto_605993 ) ) ( not ( = ?auto_605990 ?auto_605994 ) ) ( not ( = ?auto_605991 ?auto_605992 ) ) ( not ( = ?auto_605991 ?auto_605993 ) ) ( not ( = ?auto_605991 ?auto_605994 ) ) ( not ( = ?auto_605992 ?auto_605993 ) ) ( not ( = ?auto_605992 ?auto_605994 ) ) ( not ( = ?auto_605993 ?auto_605994 ) ) ( CLEAR ?auto_605991 ) ( ON ?auto_605992 ?auto_605993 ) ( CLEAR ?auto_605992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_605986 ?auto_605987 ?auto_605988 ?auto_605989 ?auto_605990 ?auto_605991 ?auto_605992 )
      ( MAKE-8PILE ?auto_605986 ?auto_605987 ?auto_605988 ?auto_605989 ?auto_605990 ?auto_605991 ?auto_605992 ?auto_605993 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_606020 - BLOCK
      ?auto_606021 - BLOCK
      ?auto_606022 - BLOCK
      ?auto_606023 - BLOCK
      ?auto_606024 - BLOCK
      ?auto_606025 - BLOCK
      ?auto_606026 - BLOCK
      ?auto_606027 - BLOCK
    )
    :vars
    (
      ?auto_606028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606027 ?auto_606028 ) ( ON-TABLE ?auto_606020 ) ( ON ?auto_606021 ?auto_606020 ) ( ON ?auto_606022 ?auto_606021 ) ( ON ?auto_606023 ?auto_606022 ) ( ON ?auto_606024 ?auto_606023 ) ( not ( = ?auto_606020 ?auto_606021 ) ) ( not ( = ?auto_606020 ?auto_606022 ) ) ( not ( = ?auto_606020 ?auto_606023 ) ) ( not ( = ?auto_606020 ?auto_606024 ) ) ( not ( = ?auto_606020 ?auto_606025 ) ) ( not ( = ?auto_606020 ?auto_606026 ) ) ( not ( = ?auto_606020 ?auto_606027 ) ) ( not ( = ?auto_606020 ?auto_606028 ) ) ( not ( = ?auto_606021 ?auto_606022 ) ) ( not ( = ?auto_606021 ?auto_606023 ) ) ( not ( = ?auto_606021 ?auto_606024 ) ) ( not ( = ?auto_606021 ?auto_606025 ) ) ( not ( = ?auto_606021 ?auto_606026 ) ) ( not ( = ?auto_606021 ?auto_606027 ) ) ( not ( = ?auto_606021 ?auto_606028 ) ) ( not ( = ?auto_606022 ?auto_606023 ) ) ( not ( = ?auto_606022 ?auto_606024 ) ) ( not ( = ?auto_606022 ?auto_606025 ) ) ( not ( = ?auto_606022 ?auto_606026 ) ) ( not ( = ?auto_606022 ?auto_606027 ) ) ( not ( = ?auto_606022 ?auto_606028 ) ) ( not ( = ?auto_606023 ?auto_606024 ) ) ( not ( = ?auto_606023 ?auto_606025 ) ) ( not ( = ?auto_606023 ?auto_606026 ) ) ( not ( = ?auto_606023 ?auto_606027 ) ) ( not ( = ?auto_606023 ?auto_606028 ) ) ( not ( = ?auto_606024 ?auto_606025 ) ) ( not ( = ?auto_606024 ?auto_606026 ) ) ( not ( = ?auto_606024 ?auto_606027 ) ) ( not ( = ?auto_606024 ?auto_606028 ) ) ( not ( = ?auto_606025 ?auto_606026 ) ) ( not ( = ?auto_606025 ?auto_606027 ) ) ( not ( = ?auto_606025 ?auto_606028 ) ) ( not ( = ?auto_606026 ?auto_606027 ) ) ( not ( = ?auto_606026 ?auto_606028 ) ) ( not ( = ?auto_606027 ?auto_606028 ) ) ( ON ?auto_606026 ?auto_606027 ) ( CLEAR ?auto_606024 ) ( ON ?auto_606025 ?auto_606026 ) ( CLEAR ?auto_606025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_606020 ?auto_606021 ?auto_606022 ?auto_606023 ?auto_606024 ?auto_606025 )
      ( MAKE-8PILE ?auto_606020 ?auto_606021 ?auto_606022 ?auto_606023 ?auto_606024 ?auto_606025 ?auto_606026 ?auto_606027 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_606054 - BLOCK
      ?auto_606055 - BLOCK
      ?auto_606056 - BLOCK
      ?auto_606057 - BLOCK
      ?auto_606058 - BLOCK
      ?auto_606059 - BLOCK
      ?auto_606060 - BLOCK
      ?auto_606061 - BLOCK
    )
    :vars
    (
      ?auto_606062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606061 ?auto_606062 ) ( ON-TABLE ?auto_606054 ) ( ON ?auto_606055 ?auto_606054 ) ( ON ?auto_606056 ?auto_606055 ) ( ON ?auto_606057 ?auto_606056 ) ( not ( = ?auto_606054 ?auto_606055 ) ) ( not ( = ?auto_606054 ?auto_606056 ) ) ( not ( = ?auto_606054 ?auto_606057 ) ) ( not ( = ?auto_606054 ?auto_606058 ) ) ( not ( = ?auto_606054 ?auto_606059 ) ) ( not ( = ?auto_606054 ?auto_606060 ) ) ( not ( = ?auto_606054 ?auto_606061 ) ) ( not ( = ?auto_606054 ?auto_606062 ) ) ( not ( = ?auto_606055 ?auto_606056 ) ) ( not ( = ?auto_606055 ?auto_606057 ) ) ( not ( = ?auto_606055 ?auto_606058 ) ) ( not ( = ?auto_606055 ?auto_606059 ) ) ( not ( = ?auto_606055 ?auto_606060 ) ) ( not ( = ?auto_606055 ?auto_606061 ) ) ( not ( = ?auto_606055 ?auto_606062 ) ) ( not ( = ?auto_606056 ?auto_606057 ) ) ( not ( = ?auto_606056 ?auto_606058 ) ) ( not ( = ?auto_606056 ?auto_606059 ) ) ( not ( = ?auto_606056 ?auto_606060 ) ) ( not ( = ?auto_606056 ?auto_606061 ) ) ( not ( = ?auto_606056 ?auto_606062 ) ) ( not ( = ?auto_606057 ?auto_606058 ) ) ( not ( = ?auto_606057 ?auto_606059 ) ) ( not ( = ?auto_606057 ?auto_606060 ) ) ( not ( = ?auto_606057 ?auto_606061 ) ) ( not ( = ?auto_606057 ?auto_606062 ) ) ( not ( = ?auto_606058 ?auto_606059 ) ) ( not ( = ?auto_606058 ?auto_606060 ) ) ( not ( = ?auto_606058 ?auto_606061 ) ) ( not ( = ?auto_606058 ?auto_606062 ) ) ( not ( = ?auto_606059 ?auto_606060 ) ) ( not ( = ?auto_606059 ?auto_606061 ) ) ( not ( = ?auto_606059 ?auto_606062 ) ) ( not ( = ?auto_606060 ?auto_606061 ) ) ( not ( = ?auto_606060 ?auto_606062 ) ) ( not ( = ?auto_606061 ?auto_606062 ) ) ( ON ?auto_606060 ?auto_606061 ) ( ON ?auto_606059 ?auto_606060 ) ( CLEAR ?auto_606057 ) ( ON ?auto_606058 ?auto_606059 ) ( CLEAR ?auto_606058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_606054 ?auto_606055 ?auto_606056 ?auto_606057 ?auto_606058 )
      ( MAKE-8PILE ?auto_606054 ?auto_606055 ?auto_606056 ?auto_606057 ?auto_606058 ?auto_606059 ?auto_606060 ?auto_606061 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_606088 - BLOCK
      ?auto_606089 - BLOCK
      ?auto_606090 - BLOCK
      ?auto_606091 - BLOCK
      ?auto_606092 - BLOCK
      ?auto_606093 - BLOCK
      ?auto_606094 - BLOCK
      ?auto_606095 - BLOCK
    )
    :vars
    (
      ?auto_606096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606095 ?auto_606096 ) ( ON-TABLE ?auto_606088 ) ( ON ?auto_606089 ?auto_606088 ) ( ON ?auto_606090 ?auto_606089 ) ( not ( = ?auto_606088 ?auto_606089 ) ) ( not ( = ?auto_606088 ?auto_606090 ) ) ( not ( = ?auto_606088 ?auto_606091 ) ) ( not ( = ?auto_606088 ?auto_606092 ) ) ( not ( = ?auto_606088 ?auto_606093 ) ) ( not ( = ?auto_606088 ?auto_606094 ) ) ( not ( = ?auto_606088 ?auto_606095 ) ) ( not ( = ?auto_606088 ?auto_606096 ) ) ( not ( = ?auto_606089 ?auto_606090 ) ) ( not ( = ?auto_606089 ?auto_606091 ) ) ( not ( = ?auto_606089 ?auto_606092 ) ) ( not ( = ?auto_606089 ?auto_606093 ) ) ( not ( = ?auto_606089 ?auto_606094 ) ) ( not ( = ?auto_606089 ?auto_606095 ) ) ( not ( = ?auto_606089 ?auto_606096 ) ) ( not ( = ?auto_606090 ?auto_606091 ) ) ( not ( = ?auto_606090 ?auto_606092 ) ) ( not ( = ?auto_606090 ?auto_606093 ) ) ( not ( = ?auto_606090 ?auto_606094 ) ) ( not ( = ?auto_606090 ?auto_606095 ) ) ( not ( = ?auto_606090 ?auto_606096 ) ) ( not ( = ?auto_606091 ?auto_606092 ) ) ( not ( = ?auto_606091 ?auto_606093 ) ) ( not ( = ?auto_606091 ?auto_606094 ) ) ( not ( = ?auto_606091 ?auto_606095 ) ) ( not ( = ?auto_606091 ?auto_606096 ) ) ( not ( = ?auto_606092 ?auto_606093 ) ) ( not ( = ?auto_606092 ?auto_606094 ) ) ( not ( = ?auto_606092 ?auto_606095 ) ) ( not ( = ?auto_606092 ?auto_606096 ) ) ( not ( = ?auto_606093 ?auto_606094 ) ) ( not ( = ?auto_606093 ?auto_606095 ) ) ( not ( = ?auto_606093 ?auto_606096 ) ) ( not ( = ?auto_606094 ?auto_606095 ) ) ( not ( = ?auto_606094 ?auto_606096 ) ) ( not ( = ?auto_606095 ?auto_606096 ) ) ( ON ?auto_606094 ?auto_606095 ) ( ON ?auto_606093 ?auto_606094 ) ( ON ?auto_606092 ?auto_606093 ) ( CLEAR ?auto_606090 ) ( ON ?auto_606091 ?auto_606092 ) ( CLEAR ?auto_606091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_606088 ?auto_606089 ?auto_606090 ?auto_606091 )
      ( MAKE-8PILE ?auto_606088 ?auto_606089 ?auto_606090 ?auto_606091 ?auto_606092 ?auto_606093 ?auto_606094 ?auto_606095 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_606122 - BLOCK
      ?auto_606123 - BLOCK
      ?auto_606124 - BLOCK
      ?auto_606125 - BLOCK
      ?auto_606126 - BLOCK
      ?auto_606127 - BLOCK
      ?auto_606128 - BLOCK
      ?auto_606129 - BLOCK
    )
    :vars
    (
      ?auto_606130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606129 ?auto_606130 ) ( ON-TABLE ?auto_606122 ) ( ON ?auto_606123 ?auto_606122 ) ( not ( = ?auto_606122 ?auto_606123 ) ) ( not ( = ?auto_606122 ?auto_606124 ) ) ( not ( = ?auto_606122 ?auto_606125 ) ) ( not ( = ?auto_606122 ?auto_606126 ) ) ( not ( = ?auto_606122 ?auto_606127 ) ) ( not ( = ?auto_606122 ?auto_606128 ) ) ( not ( = ?auto_606122 ?auto_606129 ) ) ( not ( = ?auto_606122 ?auto_606130 ) ) ( not ( = ?auto_606123 ?auto_606124 ) ) ( not ( = ?auto_606123 ?auto_606125 ) ) ( not ( = ?auto_606123 ?auto_606126 ) ) ( not ( = ?auto_606123 ?auto_606127 ) ) ( not ( = ?auto_606123 ?auto_606128 ) ) ( not ( = ?auto_606123 ?auto_606129 ) ) ( not ( = ?auto_606123 ?auto_606130 ) ) ( not ( = ?auto_606124 ?auto_606125 ) ) ( not ( = ?auto_606124 ?auto_606126 ) ) ( not ( = ?auto_606124 ?auto_606127 ) ) ( not ( = ?auto_606124 ?auto_606128 ) ) ( not ( = ?auto_606124 ?auto_606129 ) ) ( not ( = ?auto_606124 ?auto_606130 ) ) ( not ( = ?auto_606125 ?auto_606126 ) ) ( not ( = ?auto_606125 ?auto_606127 ) ) ( not ( = ?auto_606125 ?auto_606128 ) ) ( not ( = ?auto_606125 ?auto_606129 ) ) ( not ( = ?auto_606125 ?auto_606130 ) ) ( not ( = ?auto_606126 ?auto_606127 ) ) ( not ( = ?auto_606126 ?auto_606128 ) ) ( not ( = ?auto_606126 ?auto_606129 ) ) ( not ( = ?auto_606126 ?auto_606130 ) ) ( not ( = ?auto_606127 ?auto_606128 ) ) ( not ( = ?auto_606127 ?auto_606129 ) ) ( not ( = ?auto_606127 ?auto_606130 ) ) ( not ( = ?auto_606128 ?auto_606129 ) ) ( not ( = ?auto_606128 ?auto_606130 ) ) ( not ( = ?auto_606129 ?auto_606130 ) ) ( ON ?auto_606128 ?auto_606129 ) ( ON ?auto_606127 ?auto_606128 ) ( ON ?auto_606126 ?auto_606127 ) ( ON ?auto_606125 ?auto_606126 ) ( CLEAR ?auto_606123 ) ( ON ?auto_606124 ?auto_606125 ) ( CLEAR ?auto_606124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_606122 ?auto_606123 ?auto_606124 )
      ( MAKE-8PILE ?auto_606122 ?auto_606123 ?auto_606124 ?auto_606125 ?auto_606126 ?auto_606127 ?auto_606128 ?auto_606129 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_606156 - BLOCK
      ?auto_606157 - BLOCK
      ?auto_606158 - BLOCK
      ?auto_606159 - BLOCK
      ?auto_606160 - BLOCK
      ?auto_606161 - BLOCK
      ?auto_606162 - BLOCK
      ?auto_606163 - BLOCK
    )
    :vars
    (
      ?auto_606164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606163 ?auto_606164 ) ( ON-TABLE ?auto_606156 ) ( not ( = ?auto_606156 ?auto_606157 ) ) ( not ( = ?auto_606156 ?auto_606158 ) ) ( not ( = ?auto_606156 ?auto_606159 ) ) ( not ( = ?auto_606156 ?auto_606160 ) ) ( not ( = ?auto_606156 ?auto_606161 ) ) ( not ( = ?auto_606156 ?auto_606162 ) ) ( not ( = ?auto_606156 ?auto_606163 ) ) ( not ( = ?auto_606156 ?auto_606164 ) ) ( not ( = ?auto_606157 ?auto_606158 ) ) ( not ( = ?auto_606157 ?auto_606159 ) ) ( not ( = ?auto_606157 ?auto_606160 ) ) ( not ( = ?auto_606157 ?auto_606161 ) ) ( not ( = ?auto_606157 ?auto_606162 ) ) ( not ( = ?auto_606157 ?auto_606163 ) ) ( not ( = ?auto_606157 ?auto_606164 ) ) ( not ( = ?auto_606158 ?auto_606159 ) ) ( not ( = ?auto_606158 ?auto_606160 ) ) ( not ( = ?auto_606158 ?auto_606161 ) ) ( not ( = ?auto_606158 ?auto_606162 ) ) ( not ( = ?auto_606158 ?auto_606163 ) ) ( not ( = ?auto_606158 ?auto_606164 ) ) ( not ( = ?auto_606159 ?auto_606160 ) ) ( not ( = ?auto_606159 ?auto_606161 ) ) ( not ( = ?auto_606159 ?auto_606162 ) ) ( not ( = ?auto_606159 ?auto_606163 ) ) ( not ( = ?auto_606159 ?auto_606164 ) ) ( not ( = ?auto_606160 ?auto_606161 ) ) ( not ( = ?auto_606160 ?auto_606162 ) ) ( not ( = ?auto_606160 ?auto_606163 ) ) ( not ( = ?auto_606160 ?auto_606164 ) ) ( not ( = ?auto_606161 ?auto_606162 ) ) ( not ( = ?auto_606161 ?auto_606163 ) ) ( not ( = ?auto_606161 ?auto_606164 ) ) ( not ( = ?auto_606162 ?auto_606163 ) ) ( not ( = ?auto_606162 ?auto_606164 ) ) ( not ( = ?auto_606163 ?auto_606164 ) ) ( ON ?auto_606162 ?auto_606163 ) ( ON ?auto_606161 ?auto_606162 ) ( ON ?auto_606160 ?auto_606161 ) ( ON ?auto_606159 ?auto_606160 ) ( ON ?auto_606158 ?auto_606159 ) ( CLEAR ?auto_606156 ) ( ON ?auto_606157 ?auto_606158 ) ( CLEAR ?auto_606157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_606156 ?auto_606157 )
      ( MAKE-8PILE ?auto_606156 ?auto_606157 ?auto_606158 ?auto_606159 ?auto_606160 ?auto_606161 ?auto_606162 ?auto_606163 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_606190 - BLOCK
      ?auto_606191 - BLOCK
      ?auto_606192 - BLOCK
      ?auto_606193 - BLOCK
      ?auto_606194 - BLOCK
      ?auto_606195 - BLOCK
      ?auto_606196 - BLOCK
      ?auto_606197 - BLOCK
    )
    :vars
    (
      ?auto_606198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606197 ?auto_606198 ) ( not ( = ?auto_606190 ?auto_606191 ) ) ( not ( = ?auto_606190 ?auto_606192 ) ) ( not ( = ?auto_606190 ?auto_606193 ) ) ( not ( = ?auto_606190 ?auto_606194 ) ) ( not ( = ?auto_606190 ?auto_606195 ) ) ( not ( = ?auto_606190 ?auto_606196 ) ) ( not ( = ?auto_606190 ?auto_606197 ) ) ( not ( = ?auto_606190 ?auto_606198 ) ) ( not ( = ?auto_606191 ?auto_606192 ) ) ( not ( = ?auto_606191 ?auto_606193 ) ) ( not ( = ?auto_606191 ?auto_606194 ) ) ( not ( = ?auto_606191 ?auto_606195 ) ) ( not ( = ?auto_606191 ?auto_606196 ) ) ( not ( = ?auto_606191 ?auto_606197 ) ) ( not ( = ?auto_606191 ?auto_606198 ) ) ( not ( = ?auto_606192 ?auto_606193 ) ) ( not ( = ?auto_606192 ?auto_606194 ) ) ( not ( = ?auto_606192 ?auto_606195 ) ) ( not ( = ?auto_606192 ?auto_606196 ) ) ( not ( = ?auto_606192 ?auto_606197 ) ) ( not ( = ?auto_606192 ?auto_606198 ) ) ( not ( = ?auto_606193 ?auto_606194 ) ) ( not ( = ?auto_606193 ?auto_606195 ) ) ( not ( = ?auto_606193 ?auto_606196 ) ) ( not ( = ?auto_606193 ?auto_606197 ) ) ( not ( = ?auto_606193 ?auto_606198 ) ) ( not ( = ?auto_606194 ?auto_606195 ) ) ( not ( = ?auto_606194 ?auto_606196 ) ) ( not ( = ?auto_606194 ?auto_606197 ) ) ( not ( = ?auto_606194 ?auto_606198 ) ) ( not ( = ?auto_606195 ?auto_606196 ) ) ( not ( = ?auto_606195 ?auto_606197 ) ) ( not ( = ?auto_606195 ?auto_606198 ) ) ( not ( = ?auto_606196 ?auto_606197 ) ) ( not ( = ?auto_606196 ?auto_606198 ) ) ( not ( = ?auto_606197 ?auto_606198 ) ) ( ON ?auto_606196 ?auto_606197 ) ( ON ?auto_606195 ?auto_606196 ) ( ON ?auto_606194 ?auto_606195 ) ( ON ?auto_606193 ?auto_606194 ) ( ON ?auto_606192 ?auto_606193 ) ( ON ?auto_606191 ?auto_606192 ) ( ON ?auto_606190 ?auto_606191 ) ( CLEAR ?auto_606190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_606190 )
      ( MAKE-8PILE ?auto_606190 ?auto_606191 ?auto_606192 ?auto_606193 ?auto_606194 ?auto_606195 ?auto_606196 ?auto_606197 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_606225 - BLOCK
      ?auto_606226 - BLOCK
      ?auto_606227 - BLOCK
      ?auto_606228 - BLOCK
      ?auto_606229 - BLOCK
      ?auto_606230 - BLOCK
      ?auto_606231 - BLOCK
      ?auto_606232 - BLOCK
      ?auto_606233 - BLOCK
    )
    :vars
    (
      ?auto_606234 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_606232 ) ( ON ?auto_606233 ?auto_606234 ) ( CLEAR ?auto_606233 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_606225 ) ( ON ?auto_606226 ?auto_606225 ) ( ON ?auto_606227 ?auto_606226 ) ( ON ?auto_606228 ?auto_606227 ) ( ON ?auto_606229 ?auto_606228 ) ( ON ?auto_606230 ?auto_606229 ) ( ON ?auto_606231 ?auto_606230 ) ( ON ?auto_606232 ?auto_606231 ) ( not ( = ?auto_606225 ?auto_606226 ) ) ( not ( = ?auto_606225 ?auto_606227 ) ) ( not ( = ?auto_606225 ?auto_606228 ) ) ( not ( = ?auto_606225 ?auto_606229 ) ) ( not ( = ?auto_606225 ?auto_606230 ) ) ( not ( = ?auto_606225 ?auto_606231 ) ) ( not ( = ?auto_606225 ?auto_606232 ) ) ( not ( = ?auto_606225 ?auto_606233 ) ) ( not ( = ?auto_606225 ?auto_606234 ) ) ( not ( = ?auto_606226 ?auto_606227 ) ) ( not ( = ?auto_606226 ?auto_606228 ) ) ( not ( = ?auto_606226 ?auto_606229 ) ) ( not ( = ?auto_606226 ?auto_606230 ) ) ( not ( = ?auto_606226 ?auto_606231 ) ) ( not ( = ?auto_606226 ?auto_606232 ) ) ( not ( = ?auto_606226 ?auto_606233 ) ) ( not ( = ?auto_606226 ?auto_606234 ) ) ( not ( = ?auto_606227 ?auto_606228 ) ) ( not ( = ?auto_606227 ?auto_606229 ) ) ( not ( = ?auto_606227 ?auto_606230 ) ) ( not ( = ?auto_606227 ?auto_606231 ) ) ( not ( = ?auto_606227 ?auto_606232 ) ) ( not ( = ?auto_606227 ?auto_606233 ) ) ( not ( = ?auto_606227 ?auto_606234 ) ) ( not ( = ?auto_606228 ?auto_606229 ) ) ( not ( = ?auto_606228 ?auto_606230 ) ) ( not ( = ?auto_606228 ?auto_606231 ) ) ( not ( = ?auto_606228 ?auto_606232 ) ) ( not ( = ?auto_606228 ?auto_606233 ) ) ( not ( = ?auto_606228 ?auto_606234 ) ) ( not ( = ?auto_606229 ?auto_606230 ) ) ( not ( = ?auto_606229 ?auto_606231 ) ) ( not ( = ?auto_606229 ?auto_606232 ) ) ( not ( = ?auto_606229 ?auto_606233 ) ) ( not ( = ?auto_606229 ?auto_606234 ) ) ( not ( = ?auto_606230 ?auto_606231 ) ) ( not ( = ?auto_606230 ?auto_606232 ) ) ( not ( = ?auto_606230 ?auto_606233 ) ) ( not ( = ?auto_606230 ?auto_606234 ) ) ( not ( = ?auto_606231 ?auto_606232 ) ) ( not ( = ?auto_606231 ?auto_606233 ) ) ( not ( = ?auto_606231 ?auto_606234 ) ) ( not ( = ?auto_606232 ?auto_606233 ) ) ( not ( = ?auto_606232 ?auto_606234 ) ) ( not ( = ?auto_606233 ?auto_606234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_606233 ?auto_606234 )
      ( !STACK ?auto_606233 ?auto_606232 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_606263 - BLOCK
      ?auto_606264 - BLOCK
      ?auto_606265 - BLOCK
      ?auto_606266 - BLOCK
      ?auto_606267 - BLOCK
      ?auto_606268 - BLOCK
      ?auto_606269 - BLOCK
      ?auto_606270 - BLOCK
      ?auto_606271 - BLOCK
    )
    :vars
    (
      ?auto_606272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606271 ?auto_606272 ) ( ON-TABLE ?auto_606263 ) ( ON ?auto_606264 ?auto_606263 ) ( ON ?auto_606265 ?auto_606264 ) ( ON ?auto_606266 ?auto_606265 ) ( ON ?auto_606267 ?auto_606266 ) ( ON ?auto_606268 ?auto_606267 ) ( ON ?auto_606269 ?auto_606268 ) ( not ( = ?auto_606263 ?auto_606264 ) ) ( not ( = ?auto_606263 ?auto_606265 ) ) ( not ( = ?auto_606263 ?auto_606266 ) ) ( not ( = ?auto_606263 ?auto_606267 ) ) ( not ( = ?auto_606263 ?auto_606268 ) ) ( not ( = ?auto_606263 ?auto_606269 ) ) ( not ( = ?auto_606263 ?auto_606270 ) ) ( not ( = ?auto_606263 ?auto_606271 ) ) ( not ( = ?auto_606263 ?auto_606272 ) ) ( not ( = ?auto_606264 ?auto_606265 ) ) ( not ( = ?auto_606264 ?auto_606266 ) ) ( not ( = ?auto_606264 ?auto_606267 ) ) ( not ( = ?auto_606264 ?auto_606268 ) ) ( not ( = ?auto_606264 ?auto_606269 ) ) ( not ( = ?auto_606264 ?auto_606270 ) ) ( not ( = ?auto_606264 ?auto_606271 ) ) ( not ( = ?auto_606264 ?auto_606272 ) ) ( not ( = ?auto_606265 ?auto_606266 ) ) ( not ( = ?auto_606265 ?auto_606267 ) ) ( not ( = ?auto_606265 ?auto_606268 ) ) ( not ( = ?auto_606265 ?auto_606269 ) ) ( not ( = ?auto_606265 ?auto_606270 ) ) ( not ( = ?auto_606265 ?auto_606271 ) ) ( not ( = ?auto_606265 ?auto_606272 ) ) ( not ( = ?auto_606266 ?auto_606267 ) ) ( not ( = ?auto_606266 ?auto_606268 ) ) ( not ( = ?auto_606266 ?auto_606269 ) ) ( not ( = ?auto_606266 ?auto_606270 ) ) ( not ( = ?auto_606266 ?auto_606271 ) ) ( not ( = ?auto_606266 ?auto_606272 ) ) ( not ( = ?auto_606267 ?auto_606268 ) ) ( not ( = ?auto_606267 ?auto_606269 ) ) ( not ( = ?auto_606267 ?auto_606270 ) ) ( not ( = ?auto_606267 ?auto_606271 ) ) ( not ( = ?auto_606267 ?auto_606272 ) ) ( not ( = ?auto_606268 ?auto_606269 ) ) ( not ( = ?auto_606268 ?auto_606270 ) ) ( not ( = ?auto_606268 ?auto_606271 ) ) ( not ( = ?auto_606268 ?auto_606272 ) ) ( not ( = ?auto_606269 ?auto_606270 ) ) ( not ( = ?auto_606269 ?auto_606271 ) ) ( not ( = ?auto_606269 ?auto_606272 ) ) ( not ( = ?auto_606270 ?auto_606271 ) ) ( not ( = ?auto_606270 ?auto_606272 ) ) ( not ( = ?auto_606271 ?auto_606272 ) ) ( CLEAR ?auto_606269 ) ( ON ?auto_606270 ?auto_606271 ) ( CLEAR ?auto_606270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_606263 ?auto_606264 ?auto_606265 ?auto_606266 ?auto_606267 ?auto_606268 ?auto_606269 ?auto_606270 )
      ( MAKE-9PILE ?auto_606263 ?auto_606264 ?auto_606265 ?auto_606266 ?auto_606267 ?auto_606268 ?auto_606269 ?auto_606270 ?auto_606271 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_606301 - BLOCK
      ?auto_606302 - BLOCK
      ?auto_606303 - BLOCK
      ?auto_606304 - BLOCK
      ?auto_606305 - BLOCK
      ?auto_606306 - BLOCK
      ?auto_606307 - BLOCK
      ?auto_606308 - BLOCK
      ?auto_606309 - BLOCK
    )
    :vars
    (
      ?auto_606310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606309 ?auto_606310 ) ( ON-TABLE ?auto_606301 ) ( ON ?auto_606302 ?auto_606301 ) ( ON ?auto_606303 ?auto_606302 ) ( ON ?auto_606304 ?auto_606303 ) ( ON ?auto_606305 ?auto_606304 ) ( ON ?auto_606306 ?auto_606305 ) ( not ( = ?auto_606301 ?auto_606302 ) ) ( not ( = ?auto_606301 ?auto_606303 ) ) ( not ( = ?auto_606301 ?auto_606304 ) ) ( not ( = ?auto_606301 ?auto_606305 ) ) ( not ( = ?auto_606301 ?auto_606306 ) ) ( not ( = ?auto_606301 ?auto_606307 ) ) ( not ( = ?auto_606301 ?auto_606308 ) ) ( not ( = ?auto_606301 ?auto_606309 ) ) ( not ( = ?auto_606301 ?auto_606310 ) ) ( not ( = ?auto_606302 ?auto_606303 ) ) ( not ( = ?auto_606302 ?auto_606304 ) ) ( not ( = ?auto_606302 ?auto_606305 ) ) ( not ( = ?auto_606302 ?auto_606306 ) ) ( not ( = ?auto_606302 ?auto_606307 ) ) ( not ( = ?auto_606302 ?auto_606308 ) ) ( not ( = ?auto_606302 ?auto_606309 ) ) ( not ( = ?auto_606302 ?auto_606310 ) ) ( not ( = ?auto_606303 ?auto_606304 ) ) ( not ( = ?auto_606303 ?auto_606305 ) ) ( not ( = ?auto_606303 ?auto_606306 ) ) ( not ( = ?auto_606303 ?auto_606307 ) ) ( not ( = ?auto_606303 ?auto_606308 ) ) ( not ( = ?auto_606303 ?auto_606309 ) ) ( not ( = ?auto_606303 ?auto_606310 ) ) ( not ( = ?auto_606304 ?auto_606305 ) ) ( not ( = ?auto_606304 ?auto_606306 ) ) ( not ( = ?auto_606304 ?auto_606307 ) ) ( not ( = ?auto_606304 ?auto_606308 ) ) ( not ( = ?auto_606304 ?auto_606309 ) ) ( not ( = ?auto_606304 ?auto_606310 ) ) ( not ( = ?auto_606305 ?auto_606306 ) ) ( not ( = ?auto_606305 ?auto_606307 ) ) ( not ( = ?auto_606305 ?auto_606308 ) ) ( not ( = ?auto_606305 ?auto_606309 ) ) ( not ( = ?auto_606305 ?auto_606310 ) ) ( not ( = ?auto_606306 ?auto_606307 ) ) ( not ( = ?auto_606306 ?auto_606308 ) ) ( not ( = ?auto_606306 ?auto_606309 ) ) ( not ( = ?auto_606306 ?auto_606310 ) ) ( not ( = ?auto_606307 ?auto_606308 ) ) ( not ( = ?auto_606307 ?auto_606309 ) ) ( not ( = ?auto_606307 ?auto_606310 ) ) ( not ( = ?auto_606308 ?auto_606309 ) ) ( not ( = ?auto_606308 ?auto_606310 ) ) ( not ( = ?auto_606309 ?auto_606310 ) ) ( ON ?auto_606308 ?auto_606309 ) ( CLEAR ?auto_606306 ) ( ON ?auto_606307 ?auto_606308 ) ( CLEAR ?auto_606307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_606301 ?auto_606302 ?auto_606303 ?auto_606304 ?auto_606305 ?auto_606306 ?auto_606307 )
      ( MAKE-9PILE ?auto_606301 ?auto_606302 ?auto_606303 ?auto_606304 ?auto_606305 ?auto_606306 ?auto_606307 ?auto_606308 ?auto_606309 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_606339 - BLOCK
      ?auto_606340 - BLOCK
      ?auto_606341 - BLOCK
      ?auto_606342 - BLOCK
      ?auto_606343 - BLOCK
      ?auto_606344 - BLOCK
      ?auto_606345 - BLOCK
      ?auto_606346 - BLOCK
      ?auto_606347 - BLOCK
    )
    :vars
    (
      ?auto_606348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606347 ?auto_606348 ) ( ON-TABLE ?auto_606339 ) ( ON ?auto_606340 ?auto_606339 ) ( ON ?auto_606341 ?auto_606340 ) ( ON ?auto_606342 ?auto_606341 ) ( ON ?auto_606343 ?auto_606342 ) ( not ( = ?auto_606339 ?auto_606340 ) ) ( not ( = ?auto_606339 ?auto_606341 ) ) ( not ( = ?auto_606339 ?auto_606342 ) ) ( not ( = ?auto_606339 ?auto_606343 ) ) ( not ( = ?auto_606339 ?auto_606344 ) ) ( not ( = ?auto_606339 ?auto_606345 ) ) ( not ( = ?auto_606339 ?auto_606346 ) ) ( not ( = ?auto_606339 ?auto_606347 ) ) ( not ( = ?auto_606339 ?auto_606348 ) ) ( not ( = ?auto_606340 ?auto_606341 ) ) ( not ( = ?auto_606340 ?auto_606342 ) ) ( not ( = ?auto_606340 ?auto_606343 ) ) ( not ( = ?auto_606340 ?auto_606344 ) ) ( not ( = ?auto_606340 ?auto_606345 ) ) ( not ( = ?auto_606340 ?auto_606346 ) ) ( not ( = ?auto_606340 ?auto_606347 ) ) ( not ( = ?auto_606340 ?auto_606348 ) ) ( not ( = ?auto_606341 ?auto_606342 ) ) ( not ( = ?auto_606341 ?auto_606343 ) ) ( not ( = ?auto_606341 ?auto_606344 ) ) ( not ( = ?auto_606341 ?auto_606345 ) ) ( not ( = ?auto_606341 ?auto_606346 ) ) ( not ( = ?auto_606341 ?auto_606347 ) ) ( not ( = ?auto_606341 ?auto_606348 ) ) ( not ( = ?auto_606342 ?auto_606343 ) ) ( not ( = ?auto_606342 ?auto_606344 ) ) ( not ( = ?auto_606342 ?auto_606345 ) ) ( not ( = ?auto_606342 ?auto_606346 ) ) ( not ( = ?auto_606342 ?auto_606347 ) ) ( not ( = ?auto_606342 ?auto_606348 ) ) ( not ( = ?auto_606343 ?auto_606344 ) ) ( not ( = ?auto_606343 ?auto_606345 ) ) ( not ( = ?auto_606343 ?auto_606346 ) ) ( not ( = ?auto_606343 ?auto_606347 ) ) ( not ( = ?auto_606343 ?auto_606348 ) ) ( not ( = ?auto_606344 ?auto_606345 ) ) ( not ( = ?auto_606344 ?auto_606346 ) ) ( not ( = ?auto_606344 ?auto_606347 ) ) ( not ( = ?auto_606344 ?auto_606348 ) ) ( not ( = ?auto_606345 ?auto_606346 ) ) ( not ( = ?auto_606345 ?auto_606347 ) ) ( not ( = ?auto_606345 ?auto_606348 ) ) ( not ( = ?auto_606346 ?auto_606347 ) ) ( not ( = ?auto_606346 ?auto_606348 ) ) ( not ( = ?auto_606347 ?auto_606348 ) ) ( ON ?auto_606346 ?auto_606347 ) ( ON ?auto_606345 ?auto_606346 ) ( CLEAR ?auto_606343 ) ( ON ?auto_606344 ?auto_606345 ) ( CLEAR ?auto_606344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_606339 ?auto_606340 ?auto_606341 ?auto_606342 ?auto_606343 ?auto_606344 )
      ( MAKE-9PILE ?auto_606339 ?auto_606340 ?auto_606341 ?auto_606342 ?auto_606343 ?auto_606344 ?auto_606345 ?auto_606346 ?auto_606347 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_606377 - BLOCK
      ?auto_606378 - BLOCK
      ?auto_606379 - BLOCK
      ?auto_606380 - BLOCK
      ?auto_606381 - BLOCK
      ?auto_606382 - BLOCK
      ?auto_606383 - BLOCK
      ?auto_606384 - BLOCK
      ?auto_606385 - BLOCK
    )
    :vars
    (
      ?auto_606386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606385 ?auto_606386 ) ( ON-TABLE ?auto_606377 ) ( ON ?auto_606378 ?auto_606377 ) ( ON ?auto_606379 ?auto_606378 ) ( ON ?auto_606380 ?auto_606379 ) ( not ( = ?auto_606377 ?auto_606378 ) ) ( not ( = ?auto_606377 ?auto_606379 ) ) ( not ( = ?auto_606377 ?auto_606380 ) ) ( not ( = ?auto_606377 ?auto_606381 ) ) ( not ( = ?auto_606377 ?auto_606382 ) ) ( not ( = ?auto_606377 ?auto_606383 ) ) ( not ( = ?auto_606377 ?auto_606384 ) ) ( not ( = ?auto_606377 ?auto_606385 ) ) ( not ( = ?auto_606377 ?auto_606386 ) ) ( not ( = ?auto_606378 ?auto_606379 ) ) ( not ( = ?auto_606378 ?auto_606380 ) ) ( not ( = ?auto_606378 ?auto_606381 ) ) ( not ( = ?auto_606378 ?auto_606382 ) ) ( not ( = ?auto_606378 ?auto_606383 ) ) ( not ( = ?auto_606378 ?auto_606384 ) ) ( not ( = ?auto_606378 ?auto_606385 ) ) ( not ( = ?auto_606378 ?auto_606386 ) ) ( not ( = ?auto_606379 ?auto_606380 ) ) ( not ( = ?auto_606379 ?auto_606381 ) ) ( not ( = ?auto_606379 ?auto_606382 ) ) ( not ( = ?auto_606379 ?auto_606383 ) ) ( not ( = ?auto_606379 ?auto_606384 ) ) ( not ( = ?auto_606379 ?auto_606385 ) ) ( not ( = ?auto_606379 ?auto_606386 ) ) ( not ( = ?auto_606380 ?auto_606381 ) ) ( not ( = ?auto_606380 ?auto_606382 ) ) ( not ( = ?auto_606380 ?auto_606383 ) ) ( not ( = ?auto_606380 ?auto_606384 ) ) ( not ( = ?auto_606380 ?auto_606385 ) ) ( not ( = ?auto_606380 ?auto_606386 ) ) ( not ( = ?auto_606381 ?auto_606382 ) ) ( not ( = ?auto_606381 ?auto_606383 ) ) ( not ( = ?auto_606381 ?auto_606384 ) ) ( not ( = ?auto_606381 ?auto_606385 ) ) ( not ( = ?auto_606381 ?auto_606386 ) ) ( not ( = ?auto_606382 ?auto_606383 ) ) ( not ( = ?auto_606382 ?auto_606384 ) ) ( not ( = ?auto_606382 ?auto_606385 ) ) ( not ( = ?auto_606382 ?auto_606386 ) ) ( not ( = ?auto_606383 ?auto_606384 ) ) ( not ( = ?auto_606383 ?auto_606385 ) ) ( not ( = ?auto_606383 ?auto_606386 ) ) ( not ( = ?auto_606384 ?auto_606385 ) ) ( not ( = ?auto_606384 ?auto_606386 ) ) ( not ( = ?auto_606385 ?auto_606386 ) ) ( ON ?auto_606384 ?auto_606385 ) ( ON ?auto_606383 ?auto_606384 ) ( ON ?auto_606382 ?auto_606383 ) ( CLEAR ?auto_606380 ) ( ON ?auto_606381 ?auto_606382 ) ( CLEAR ?auto_606381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_606377 ?auto_606378 ?auto_606379 ?auto_606380 ?auto_606381 )
      ( MAKE-9PILE ?auto_606377 ?auto_606378 ?auto_606379 ?auto_606380 ?auto_606381 ?auto_606382 ?auto_606383 ?auto_606384 ?auto_606385 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_606415 - BLOCK
      ?auto_606416 - BLOCK
      ?auto_606417 - BLOCK
      ?auto_606418 - BLOCK
      ?auto_606419 - BLOCK
      ?auto_606420 - BLOCK
      ?auto_606421 - BLOCK
      ?auto_606422 - BLOCK
      ?auto_606423 - BLOCK
    )
    :vars
    (
      ?auto_606424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606423 ?auto_606424 ) ( ON-TABLE ?auto_606415 ) ( ON ?auto_606416 ?auto_606415 ) ( ON ?auto_606417 ?auto_606416 ) ( not ( = ?auto_606415 ?auto_606416 ) ) ( not ( = ?auto_606415 ?auto_606417 ) ) ( not ( = ?auto_606415 ?auto_606418 ) ) ( not ( = ?auto_606415 ?auto_606419 ) ) ( not ( = ?auto_606415 ?auto_606420 ) ) ( not ( = ?auto_606415 ?auto_606421 ) ) ( not ( = ?auto_606415 ?auto_606422 ) ) ( not ( = ?auto_606415 ?auto_606423 ) ) ( not ( = ?auto_606415 ?auto_606424 ) ) ( not ( = ?auto_606416 ?auto_606417 ) ) ( not ( = ?auto_606416 ?auto_606418 ) ) ( not ( = ?auto_606416 ?auto_606419 ) ) ( not ( = ?auto_606416 ?auto_606420 ) ) ( not ( = ?auto_606416 ?auto_606421 ) ) ( not ( = ?auto_606416 ?auto_606422 ) ) ( not ( = ?auto_606416 ?auto_606423 ) ) ( not ( = ?auto_606416 ?auto_606424 ) ) ( not ( = ?auto_606417 ?auto_606418 ) ) ( not ( = ?auto_606417 ?auto_606419 ) ) ( not ( = ?auto_606417 ?auto_606420 ) ) ( not ( = ?auto_606417 ?auto_606421 ) ) ( not ( = ?auto_606417 ?auto_606422 ) ) ( not ( = ?auto_606417 ?auto_606423 ) ) ( not ( = ?auto_606417 ?auto_606424 ) ) ( not ( = ?auto_606418 ?auto_606419 ) ) ( not ( = ?auto_606418 ?auto_606420 ) ) ( not ( = ?auto_606418 ?auto_606421 ) ) ( not ( = ?auto_606418 ?auto_606422 ) ) ( not ( = ?auto_606418 ?auto_606423 ) ) ( not ( = ?auto_606418 ?auto_606424 ) ) ( not ( = ?auto_606419 ?auto_606420 ) ) ( not ( = ?auto_606419 ?auto_606421 ) ) ( not ( = ?auto_606419 ?auto_606422 ) ) ( not ( = ?auto_606419 ?auto_606423 ) ) ( not ( = ?auto_606419 ?auto_606424 ) ) ( not ( = ?auto_606420 ?auto_606421 ) ) ( not ( = ?auto_606420 ?auto_606422 ) ) ( not ( = ?auto_606420 ?auto_606423 ) ) ( not ( = ?auto_606420 ?auto_606424 ) ) ( not ( = ?auto_606421 ?auto_606422 ) ) ( not ( = ?auto_606421 ?auto_606423 ) ) ( not ( = ?auto_606421 ?auto_606424 ) ) ( not ( = ?auto_606422 ?auto_606423 ) ) ( not ( = ?auto_606422 ?auto_606424 ) ) ( not ( = ?auto_606423 ?auto_606424 ) ) ( ON ?auto_606422 ?auto_606423 ) ( ON ?auto_606421 ?auto_606422 ) ( ON ?auto_606420 ?auto_606421 ) ( ON ?auto_606419 ?auto_606420 ) ( CLEAR ?auto_606417 ) ( ON ?auto_606418 ?auto_606419 ) ( CLEAR ?auto_606418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_606415 ?auto_606416 ?auto_606417 ?auto_606418 )
      ( MAKE-9PILE ?auto_606415 ?auto_606416 ?auto_606417 ?auto_606418 ?auto_606419 ?auto_606420 ?auto_606421 ?auto_606422 ?auto_606423 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_606453 - BLOCK
      ?auto_606454 - BLOCK
      ?auto_606455 - BLOCK
      ?auto_606456 - BLOCK
      ?auto_606457 - BLOCK
      ?auto_606458 - BLOCK
      ?auto_606459 - BLOCK
      ?auto_606460 - BLOCK
      ?auto_606461 - BLOCK
    )
    :vars
    (
      ?auto_606462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606461 ?auto_606462 ) ( ON-TABLE ?auto_606453 ) ( ON ?auto_606454 ?auto_606453 ) ( not ( = ?auto_606453 ?auto_606454 ) ) ( not ( = ?auto_606453 ?auto_606455 ) ) ( not ( = ?auto_606453 ?auto_606456 ) ) ( not ( = ?auto_606453 ?auto_606457 ) ) ( not ( = ?auto_606453 ?auto_606458 ) ) ( not ( = ?auto_606453 ?auto_606459 ) ) ( not ( = ?auto_606453 ?auto_606460 ) ) ( not ( = ?auto_606453 ?auto_606461 ) ) ( not ( = ?auto_606453 ?auto_606462 ) ) ( not ( = ?auto_606454 ?auto_606455 ) ) ( not ( = ?auto_606454 ?auto_606456 ) ) ( not ( = ?auto_606454 ?auto_606457 ) ) ( not ( = ?auto_606454 ?auto_606458 ) ) ( not ( = ?auto_606454 ?auto_606459 ) ) ( not ( = ?auto_606454 ?auto_606460 ) ) ( not ( = ?auto_606454 ?auto_606461 ) ) ( not ( = ?auto_606454 ?auto_606462 ) ) ( not ( = ?auto_606455 ?auto_606456 ) ) ( not ( = ?auto_606455 ?auto_606457 ) ) ( not ( = ?auto_606455 ?auto_606458 ) ) ( not ( = ?auto_606455 ?auto_606459 ) ) ( not ( = ?auto_606455 ?auto_606460 ) ) ( not ( = ?auto_606455 ?auto_606461 ) ) ( not ( = ?auto_606455 ?auto_606462 ) ) ( not ( = ?auto_606456 ?auto_606457 ) ) ( not ( = ?auto_606456 ?auto_606458 ) ) ( not ( = ?auto_606456 ?auto_606459 ) ) ( not ( = ?auto_606456 ?auto_606460 ) ) ( not ( = ?auto_606456 ?auto_606461 ) ) ( not ( = ?auto_606456 ?auto_606462 ) ) ( not ( = ?auto_606457 ?auto_606458 ) ) ( not ( = ?auto_606457 ?auto_606459 ) ) ( not ( = ?auto_606457 ?auto_606460 ) ) ( not ( = ?auto_606457 ?auto_606461 ) ) ( not ( = ?auto_606457 ?auto_606462 ) ) ( not ( = ?auto_606458 ?auto_606459 ) ) ( not ( = ?auto_606458 ?auto_606460 ) ) ( not ( = ?auto_606458 ?auto_606461 ) ) ( not ( = ?auto_606458 ?auto_606462 ) ) ( not ( = ?auto_606459 ?auto_606460 ) ) ( not ( = ?auto_606459 ?auto_606461 ) ) ( not ( = ?auto_606459 ?auto_606462 ) ) ( not ( = ?auto_606460 ?auto_606461 ) ) ( not ( = ?auto_606460 ?auto_606462 ) ) ( not ( = ?auto_606461 ?auto_606462 ) ) ( ON ?auto_606460 ?auto_606461 ) ( ON ?auto_606459 ?auto_606460 ) ( ON ?auto_606458 ?auto_606459 ) ( ON ?auto_606457 ?auto_606458 ) ( ON ?auto_606456 ?auto_606457 ) ( CLEAR ?auto_606454 ) ( ON ?auto_606455 ?auto_606456 ) ( CLEAR ?auto_606455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_606453 ?auto_606454 ?auto_606455 )
      ( MAKE-9PILE ?auto_606453 ?auto_606454 ?auto_606455 ?auto_606456 ?auto_606457 ?auto_606458 ?auto_606459 ?auto_606460 ?auto_606461 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_606491 - BLOCK
      ?auto_606492 - BLOCK
      ?auto_606493 - BLOCK
      ?auto_606494 - BLOCK
      ?auto_606495 - BLOCK
      ?auto_606496 - BLOCK
      ?auto_606497 - BLOCK
      ?auto_606498 - BLOCK
      ?auto_606499 - BLOCK
    )
    :vars
    (
      ?auto_606500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606499 ?auto_606500 ) ( ON-TABLE ?auto_606491 ) ( not ( = ?auto_606491 ?auto_606492 ) ) ( not ( = ?auto_606491 ?auto_606493 ) ) ( not ( = ?auto_606491 ?auto_606494 ) ) ( not ( = ?auto_606491 ?auto_606495 ) ) ( not ( = ?auto_606491 ?auto_606496 ) ) ( not ( = ?auto_606491 ?auto_606497 ) ) ( not ( = ?auto_606491 ?auto_606498 ) ) ( not ( = ?auto_606491 ?auto_606499 ) ) ( not ( = ?auto_606491 ?auto_606500 ) ) ( not ( = ?auto_606492 ?auto_606493 ) ) ( not ( = ?auto_606492 ?auto_606494 ) ) ( not ( = ?auto_606492 ?auto_606495 ) ) ( not ( = ?auto_606492 ?auto_606496 ) ) ( not ( = ?auto_606492 ?auto_606497 ) ) ( not ( = ?auto_606492 ?auto_606498 ) ) ( not ( = ?auto_606492 ?auto_606499 ) ) ( not ( = ?auto_606492 ?auto_606500 ) ) ( not ( = ?auto_606493 ?auto_606494 ) ) ( not ( = ?auto_606493 ?auto_606495 ) ) ( not ( = ?auto_606493 ?auto_606496 ) ) ( not ( = ?auto_606493 ?auto_606497 ) ) ( not ( = ?auto_606493 ?auto_606498 ) ) ( not ( = ?auto_606493 ?auto_606499 ) ) ( not ( = ?auto_606493 ?auto_606500 ) ) ( not ( = ?auto_606494 ?auto_606495 ) ) ( not ( = ?auto_606494 ?auto_606496 ) ) ( not ( = ?auto_606494 ?auto_606497 ) ) ( not ( = ?auto_606494 ?auto_606498 ) ) ( not ( = ?auto_606494 ?auto_606499 ) ) ( not ( = ?auto_606494 ?auto_606500 ) ) ( not ( = ?auto_606495 ?auto_606496 ) ) ( not ( = ?auto_606495 ?auto_606497 ) ) ( not ( = ?auto_606495 ?auto_606498 ) ) ( not ( = ?auto_606495 ?auto_606499 ) ) ( not ( = ?auto_606495 ?auto_606500 ) ) ( not ( = ?auto_606496 ?auto_606497 ) ) ( not ( = ?auto_606496 ?auto_606498 ) ) ( not ( = ?auto_606496 ?auto_606499 ) ) ( not ( = ?auto_606496 ?auto_606500 ) ) ( not ( = ?auto_606497 ?auto_606498 ) ) ( not ( = ?auto_606497 ?auto_606499 ) ) ( not ( = ?auto_606497 ?auto_606500 ) ) ( not ( = ?auto_606498 ?auto_606499 ) ) ( not ( = ?auto_606498 ?auto_606500 ) ) ( not ( = ?auto_606499 ?auto_606500 ) ) ( ON ?auto_606498 ?auto_606499 ) ( ON ?auto_606497 ?auto_606498 ) ( ON ?auto_606496 ?auto_606497 ) ( ON ?auto_606495 ?auto_606496 ) ( ON ?auto_606494 ?auto_606495 ) ( ON ?auto_606493 ?auto_606494 ) ( CLEAR ?auto_606491 ) ( ON ?auto_606492 ?auto_606493 ) ( CLEAR ?auto_606492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_606491 ?auto_606492 )
      ( MAKE-9PILE ?auto_606491 ?auto_606492 ?auto_606493 ?auto_606494 ?auto_606495 ?auto_606496 ?auto_606497 ?auto_606498 ?auto_606499 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_606529 - BLOCK
      ?auto_606530 - BLOCK
      ?auto_606531 - BLOCK
      ?auto_606532 - BLOCK
      ?auto_606533 - BLOCK
      ?auto_606534 - BLOCK
      ?auto_606535 - BLOCK
      ?auto_606536 - BLOCK
      ?auto_606537 - BLOCK
    )
    :vars
    (
      ?auto_606538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606537 ?auto_606538 ) ( not ( = ?auto_606529 ?auto_606530 ) ) ( not ( = ?auto_606529 ?auto_606531 ) ) ( not ( = ?auto_606529 ?auto_606532 ) ) ( not ( = ?auto_606529 ?auto_606533 ) ) ( not ( = ?auto_606529 ?auto_606534 ) ) ( not ( = ?auto_606529 ?auto_606535 ) ) ( not ( = ?auto_606529 ?auto_606536 ) ) ( not ( = ?auto_606529 ?auto_606537 ) ) ( not ( = ?auto_606529 ?auto_606538 ) ) ( not ( = ?auto_606530 ?auto_606531 ) ) ( not ( = ?auto_606530 ?auto_606532 ) ) ( not ( = ?auto_606530 ?auto_606533 ) ) ( not ( = ?auto_606530 ?auto_606534 ) ) ( not ( = ?auto_606530 ?auto_606535 ) ) ( not ( = ?auto_606530 ?auto_606536 ) ) ( not ( = ?auto_606530 ?auto_606537 ) ) ( not ( = ?auto_606530 ?auto_606538 ) ) ( not ( = ?auto_606531 ?auto_606532 ) ) ( not ( = ?auto_606531 ?auto_606533 ) ) ( not ( = ?auto_606531 ?auto_606534 ) ) ( not ( = ?auto_606531 ?auto_606535 ) ) ( not ( = ?auto_606531 ?auto_606536 ) ) ( not ( = ?auto_606531 ?auto_606537 ) ) ( not ( = ?auto_606531 ?auto_606538 ) ) ( not ( = ?auto_606532 ?auto_606533 ) ) ( not ( = ?auto_606532 ?auto_606534 ) ) ( not ( = ?auto_606532 ?auto_606535 ) ) ( not ( = ?auto_606532 ?auto_606536 ) ) ( not ( = ?auto_606532 ?auto_606537 ) ) ( not ( = ?auto_606532 ?auto_606538 ) ) ( not ( = ?auto_606533 ?auto_606534 ) ) ( not ( = ?auto_606533 ?auto_606535 ) ) ( not ( = ?auto_606533 ?auto_606536 ) ) ( not ( = ?auto_606533 ?auto_606537 ) ) ( not ( = ?auto_606533 ?auto_606538 ) ) ( not ( = ?auto_606534 ?auto_606535 ) ) ( not ( = ?auto_606534 ?auto_606536 ) ) ( not ( = ?auto_606534 ?auto_606537 ) ) ( not ( = ?auto_606534 ?auto_606538 ) ) ( not ( = ?auto_606535 ?auto_606536 ) ) ( not ( = ?auto_606535 ?auto_606537 ) ) ( not ( = ?auto_606535 ?auto_606538 ) ) ( not ( = ?auto_606536 ?auto_606537 ) ) ( not ( = ?auto_606536 ?auto_606538 ) ) ( not ( = ?auto_606537 ?auto_606538 ) ) ( ON ?auto_606536 ?auto_606537 ) ( ON ?auto_606535 ?auto_606536 ) ( ON ?auto_606534 ?auto_606535 ) ( ON ?auto_606533 ?auto_606534 ) ( ON ?auto_606532 ?auto_606533 ) ( ON ?auto_606531 ?auto_606532 ) ( ON ?auto_606530 ?auto_606531 ) ( ON ?auto_606529 ?auto_606530 ) ( CLEAR ?auto_606529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_606529 )
      ( MAKE-9PILE ?auto_606529 ?auto_606530 ?auto_606531 ?auto_606532 ?auto_606533 ?auto_606534 ?auto_606535 ?auto_606536 ?auto_606537 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_606568 - BLOCK
      ?auto_606569 - BLOCK
      ?auto_606570 - BLOCK
      ?auto_606571 - BLOCK
      ?auto_606572 - BLOCK
      ?auto_606573 - BLOCK
      ?auto_606574 - BLOCK
      ?auto_606575 - BLOCK
      ?auto_606576 - BLOCK
      ?auto_606577 - BLOCK
    )
    :vars
    (
      ?auto_606578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_606576 ) ( ON ?auto_606577 ?auto_606578 ) ( CLEAR ?auto_606577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_606568 ) ( ON ?auto_606569 ?auto_606568 ) ( ON ?auto_606570 ?auto_606569 ) ( ON ?auto_606571 ?auto_606570 ) ( ON ?auto_606572 ?auto_606571 ) ( ON ?auto_606573 ?auto_606572 ) ( ON ?auto_606574 ?auto_606573 ) ( ON ?auto_606575 ?auto_606574 ) ( ON ?auto_606576 ?auto_606575 ) ( not ( = ?auto_606568 ?auto_606569 ) ) ( not ( = ?auto_606568 ?auto_606570 ) ) ( not ( = ?auto_606568 ?auto_606571 ) ) ( not ( = ?auto_606568 ?auto_606572 ) ) ( not ( = ?auto_606568 ?auto_606573 ) ) ( not ( = ?auto_606568 ?auto_606574 ) ) ( not ( = ?auto_606568 ?auto_606575 ) ) ( not ( = ?auto_606568 ?auto_606576 ) ) ( not ( = ?auto_606568 ?auto_606577 ) ) ( not ( = ?auto_606568 ?auto_606578 ) ) ( not ( = ?auto_606569 ?auto_606570 ) ) ( not ( = ?auto_606569 ?auto_606571 ) ) ( not ( = ?auto_606569 ?auto_606572 ) ) ( not ( = ?auto_606569 ?auto_606573 ) ) ( not ( = ?auto_606569 ?auto_606574 ) ) ( not ( = ?auto_606569 ?auto_606575 ) ) ( not ( = ?auto_606569 ?auto_606576 ) ) ( not ( = ?auto_606569 ?auto_606577 ) ) ( not ( = ?auto_606569 ?auto_606578 ) ) ( not ( = ?auto_606570 ?auto_606571 ) ) ( not ( = ?auto_606570 ?auto_606572 ) ) ( not ( = ?auto_606570 ?auto_606573 ) ) ( not ( = ?auto_606570 ?auto_606574 ) ) ( not ( = ?auto_606570 ?auto_606575 ) ) ( not ( = ?auto_606570 ?auto_606576 ) ) ( not ( = ?auto_606570 ?auto_606577 ) ) ( not ( = ?auto_606570 ?auto_606578 ) ) ( not ( = ?auto_606571 ?auto_606572 ) ) ( not ( = ?auto_606571 ?auto_606573 ) ) ( not ( = ?auto_606571 ?auto_606574 ) ) ( not ( = ?auto_606571 ?auto_606575 ) ) ( not ( = ?auto_606571 ?auto_606576 ) ) ( not ( = ?auto_606571 ?auto_606577 ) ) ( not ( = ?auto_606571 ?auto_606578 ) ) ( not ( = ?auto_606572 ?auto_606573 ) ) ( not ( = ?auto_606572 ?auto_606574 ) ) ( not ( = ?auto_606572 ?auto_606575 ) ) ( not ( = ?auto_606572 ?auto_606576 ) ) ( not ( = ?auto_606572 ?auto_606577 ) ) ( not ( = ?auto_606572 ?auto_606578 ) ) ( not ( = ?auto_606573 ?auto_606574 ) ) ( not ( = ?auto_606573 ?auto_606575 ) ) ( not ( = ?auto_606573 ?auto_606576 ) ) ( not ( = ?auto_606573 ?auto_606577 ) ) ( not ( = ?auto_606573 ?auto_606578 ) ) ( not ( = ?auto_606574 ?auto_606575 ) ) ( not ( = ?auto_606574 ?auto_606576 ) ) ( not ( = ?auto_606574 ?auto_606577 ) ) ( not ( = ?auto_606574 ?auto_606578 ) ) ( not ( = ?auto_606575 ?auto_606576 ) ) ( not ( = ?auto_606575 ?auto_606577 ) ) ( not ( = ?auto_606575 ?auto_606578 ) ) ( not ( = ?auto_606576 ?auto_606577 ) ) ( not ( = ?auto_606576 ?auto_606578 ) ) ( not ( = ?auto_606577 ?auto_606578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_606577 ?auto_606578 )
      ( !STACK ?auto_606577 ?auto_606576 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_606610 - BLOCK
      ?auto_606611 - BLOCK
      ?auto_606612 - BLOCK
      ?auto_606613 - BLOCK
      ?auto_606614 - BLOCK
      ?auto_606615 - BLOCK
      ?auto_606616 - BLOCK
      ?auto_606617 - BLOCK
      ?auto_606618 - BLOCK
      ?auto_606619 - BLOCK
    )
    :vars
    (
      ?auto_606620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606619 ?auto_606620 ) ( ON-TABLE ?auto_606610 ) ( ON ?auto_606611 ?auto_606610 ) ( ON ?auto_606612 ?auto_606611 ) ( ON ?auto_606613 ?auto_606612 ) ( ON ?auto_606614 ?auto_606613 ) ( ON ?auto_606615 ?auto_606614 ) ( ON ?auto_606616 ?auto_606615 ) ( ON ?auto_606617 ?auto_606616 ) ( not ( = ?auto_606610 ?auto_606611 ) ) ( not ( = ?auto_606610 ?auto_606612 ) ) ( not ( = ?auto_606610 ?auto_606613 ) ) ( not ( = ?auto_606610 ?auto_606614 ) ) ( not ( = ?auto_606610 ?auto_606615 ) ) ( not ( = ?auto_606610 ?auto_606616 ) ) ( not ( = ?auto_606610 ?auto_606617 ) ) ( not ( = ?auto_606610 ?auto_606618 ) ) ( not ( = ?auto_606610 ?auto_606619 ) ) ( not ( = ?auto_606610 ?auto_606620 ) ) ( not ( = ?auto_606611 ?auto_606612 ) ) ( not ( = ?auto_606611 ?auto_606613 ) ) ( not ( = ?auto_606611 ?auto_606614 ) ) ( not ( = ?auto_606611 ?auto_606615 ) ) ( not ( = ?auto_606611 ?auto_606616 ) ) ( not ( = ?auto_606611 ?auto_606617 ) ) ( not ( = ?auto_606611 ?auto_606618 ) ) ( not ( = ?auto_606611 ?auto_606619 ) ) ( not ( = ?auto_606611 ?auto_606620 ) ) ( not ( = ?auto_606612 ?auto_606613 ) ) ( not ( = ?auto_606612 ?auto_606614 ) ) ( not ( = ?auto_606612 ?auto_606615 ) ) ( not ( = ?auto_606612 ?auto_606616 ) ) ( not ( = ?auto_606612 ?auto_606617 ) ) ( not ( = ?auto_606612 ?auto_606618 ) ) ( not ( = ?auto_606612 ?auto_606619 ) ) ( not ( = ?auto_606612 ?auto_606620 ) ) ( not ( = ?auto_606613 ?auto_606614 ) ) ( not ( = ?auto_606613 ?auto_606615 ) ) ( not ( = ?auto_606613 ?auto_606616 ) ) ( not ( = ?auto_606613 ?auto_606617 ) ) ( not ( = ?auto_606613 ?auto_606618 ) ) ( not ( = ?auto_606613 ?auto_606619 ) ) ( not ( = ?auto_606613 ?auto_606620 ) ) ( not ( = ?auto_606614 ?auto_606615 ) ) ( not ( = ?auto_606614 ?auto_606616 ) ) ( not ( = ?auto_606614 ?auto_606617 ) ) ( not ( = ?auto_606614 ?auto_606618 ) ) ( not ( = ?auto_606614 ?auto_606619 ) ) ( not ( = ?auto_606614 ?auto_606620 ) ) ( not ( = ?auto_606615 ?auto_606616 ) ) ( not ( = ?auto_606615 ?auto_606617 ) ) ( not ( = ?auto_606615 ?auto_606618 ) ) ( not ( = ?auto_606615 ?auto_606619 ) ) ( not ( = ?auto_606615 ?auto_606620 ) ) ( not ( = ?auto_606616 ?auto_606617 ) ) ( not ( = ?auto_606616 ?auto_606618 ) ) ( not ( = ?auto_606616 ?auto_606619 ) ) ( not ( = ?auto_606616 ?auto_606620 ) ) ( not ( = ?auto_606617 ?auto_606618 ) ) ( not ( = ?auto_606617 ?auto_606619 ) ) ( not ( = ?auto_606617 ?auto_606620 ) ) ( not ( = ?auto_606618 ?auto_606619 ) ) ( not ( = ?auto_606618 ?auto_606620 ) ) ( not ( = ?auto_606619 ?auto_606620 ) ) ( CLEAR ?auto_606617 ) ( ON ?auto_606618 ?auto_606619 ) ( CLEAR ?auto_606618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_606610 ?auto_606611 ?auto_606612 ?auto_606613 ?auto_606614 ?auto_606615 ?auto_606616 ?auto_606617 ?auto_606618 )
      ( MAKE-10PILE ?auto_606610 ?auto_606611 ?auto_606612 ?auto_606613 ?auto_606614 ?auto_606615 ?auto_606616 ?auto_606617 ?auto_606618 ?auto_606619 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_606652 - BLOCK
      ?auto_606653 - BLOCK
      ?auto_606654 - BLOCK
      ?auto_606655 - BLOCK
      ?auto_606656 - BLOCK
      ?auto_606657 - BLOCK
      ?auto_606658 - BLOCK
      ?auto_606659 - BLOCK
      ?auto_606660 - BLOCK
      ?auto_606661 - BLOCK
    )
    :vars
    (
      ?auto_606662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606661 ?auto_606662 ) ( ON-TABLE ?auto_606652 ) ( ON ?auto_606653 ?auto_606652 ) ( ON ?auto_606654 ?auto_606653 ) ( ON ?auto_606655 ?auto_606654 ) ( ON ?auto_606656 ?auto_606655 ) ( ON ?auto_606657 ?auto_606656 ) ( ON ?auto_606658 ?auto_606657 ) ( not ( = ?auto_606652 ?auto_606653 ) ) ( not ( = ?auto_606652 ?auto_606654 ) ) ( not ( = ?auto_606652 ?auto_606655 ) ) ( not ( = ?auto_606652 ?auto_606656 ) ) ( not ( = ?auto_606652 ?auto_606657 ) ) ( not ( = ?auto_606652 ?auto_606658 ) ) ( not ( = ?auto_606652 ?auto_606659 ) ) ( not ( = ?auto_606652 ?auto_606660 ) ) ( not ( = ?auto_606652 ?auto_606661 ) ) ( not ( = ?auto_606652 ?auto_606662 ) ) ( not ( = ?auto_606653 ?auto_606654 ) ) ( not ( = ?auto_606653 ?auto_606655 ) ) ( not ( = ?auto_606653 ?auto_606656 ) ) ( not ( = ?auto_606653 ?auto_606657 ) ) ( not ( = ?auto_606653 ?auto_606658 ) ) ( not ( = ?auto_606653 ?auto_606659 ) ) ( not ( = ?auto_606653 ?auto_606660 ) ) ( not ( = ?auto_606653 ?auto_606661 ) ) ( not ( = ?auto_606653 ?auto_606662 ) ) ( not ( = ?auto_606654 ?auto_606655 ) ) ( not ( = ?auto_606654 ?auto_606656 ) ) ( not ( = ?auto_606654 ?auto_606657 ) ) ( not ( = ?auto_606654 ?auto_606658 ) ) ( not ( = ?auto_606654 ?auto_606659 ) ) ( not ( = ?auto_606654 ?auto_606660 ) ) ( not ( = ?auto_606654 ?auto_606661 ) ) ( not ( = ?auto_606654 ?auto_606662 ) ) ( not ( = ?auto_606655 ?auto_606656 ) ) ( not ( = ?auto_606655 ?auto_606657 ) ) ( not ( = ?auto_606655 ?auto_606658 ) ) ( not ( = ?auto_606655 ?auto_606659 ) ) ( not ( = ?auto_606655 ?auto_606660 ) ) ( not ( = ?auto_606655 ?auto_606661 ) ) ( not ( = ?auto_606655 ?auto_606662 ) ) ( not ( = ?auto_606656 ?auto_606657 ) ) ( not ( = ?auto_606656 ?auto_606658 ) ) ( not ( = ?auto_606656 ?auto_606659 ) ) ( not ( = ?auto_606656 ?auto_606660 ) ) ( not ( = ?auto_606656 ?auto_606661 ) ) ( not ( = ?auto_606656 ?auto_606662 ) ) ( not ( = ?auto_606657 ?auto_606658 ) ) ( not ( = ?auto_606657 ?auto_606659 ) ) ( not ( = ?auto_606657 ?auto_606660 ) ) ( not ( = ?auto_606657 ?auto_606661 ) ) ( not ( = ?auto_606657 ?auto_606662 ) ) ( not ( = ?auto_606658 ?auto_606659 ) ) ( not ( = ?auto_606658 ?auto_606660 ) ) ( not ( = ?auto_606658 ?auto_606661 ) ) ( not ( = ?auto_606658 ?auto_606662 ) ) ( not ( = ?auto_606659 ?auto_606660 ) ) ( not ( = ?auto_606659 ?auto_606661 ) ) ( not ( = ?auto_606659 ?auto_606662 ) ) ( not ( = ?auto_606660 ?auto_606661 ) ) ( not ( = ?auto_606660 ?auto_606662 ) ) ( not ( = ?auto_606661 ?auto_606662 ) ) ( ON ?auto_606660 ?auto_606661 ) ( CLEAR ?auto_606658 ) ( ON ?auto_606659 ?auto_606660 ) ( CLEAR ?auto_606659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_606652 ?auto_606653 ?auto_606654 ?auto_606655 ?auto_606656 ?auto_606657 ?auto_606658 ?auto_606659 )
      ( MAKE-10PILE ?auto_606652 ?auto_606653 ?auto_606654 ?auto_606655 ?auto_606656 ?auto_606657 ?auto_606658 ?auto_606659 ?auto_606660 ?auto_606661 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_606694 - BLOCK
      ?auto_606695 - BLOCK
      ?auto_606696 - BLOCK
      ?auto_606697 - BLOCK
      ?auto_606698 - BLOCK
      ?auto_606699 - BLOCK
      ?auto_606700 - BLOCK
      ?auto_606701 - BLOCK
      ?auto_606702 - BLOCK
      ?auto_606703 - BLOCK
    )
    :vars
    (
      ?auto_606704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606703 ?auto_606704 ) ( ON-TABLE ?auto_606694 ) ( ON ?auto_606695 ?auto_606694 ) ( ON ?auto_606696 ?auto_606695 ) ( ON ?auto_606697 ?auto_606696 ) ( ON ?auto_606698 ?auto_606697 ) ( ON ?auto_606699 ?auto_606698 ) ( not ( = ?auto_606694 ?auto_606695 ) ) ( not ( = ?auto_606694 ?auto_606696 ) ) ( not ( = ?auto_606694 ?auto_606697 ) ) ( not ( = ?auto_606694 ?auto_606698 ) ) ( not ( = ?auto_606694 ?auto_606699 ) ) ( not ( = ?auto_606694 ?auto_606700 ) ) ( not ( = ?auto_606694 ?auto_606701 ) ) ( not ( = ?auto_606694 ?auto_606702 ) ) ( not ( = ?auto_606694 ?auto_606703 ) ) ( not ( = ?auto_606694 ?auto_606704 ) ) ( not ( = ?auto_606695 ?auto_606696 ) ) ( not ( = ?auto_606695 ?auto_606697 ) ) ( not ( = ?auto_606695 ?auto_606698 ) ) ( not ( = ?auto_606695 ?auto_606699 ) ) ( not ( = ?auto_606695 ?auto_606700 ) ) ( not ( = ?auto_606695 ?auto_606701 ) ) ( not ( = ?auto_606695 ?auto_606702 ) ) ( not ( = ?auto_606695 ?auto_606703 ) ) ( not ( = ?auto_606695 ?auto_606704 ) ) ( not ( = ?auto_606696 ?auto_606697 ) ) ( not ( = ?auto_606696 ?auto_606698 ) ) ( not ( = ?auto_606696 ?auto_606699 ) ) ( not ( = ?auto_606696 ?auto_606700 ) ) ( not ( = ?auto_606696 ?auto_606701 ) ) ( not ( = ?auto_606696 ?auto_606702 ) ) ( not ( = ?auto_606696 ?auto_606703 ) ) ( not ( = ?auto_606696 ?auto_606704 ) ) ( not ( = ?auto_606697 ?auto_606698 ) ) ( not ( = ?auto_606697 ?auto_606699 ) ) ( not ( = ?auto_606697 ?auto_606700 ) ) ( not ( = ?auto_606697 ?auto_606701 ) ) ( not ( = ?auto_606697 ?auto_606702 ) ) ( not ( = ?auto_606697 ?auto_606703 ) ) ( not ( = ?auto_606697 ?auto_606704 ) ) ( not ( = ?auto_606698 ?auto_606699 ) ) ( not ( = ?auto_606698 ?auto_606700 ) ) ( not ( = ?auto_606698 ?auto_606701 ) ) ( not ( = ?auto_606698 ?auto_606702 ) ) ( not ( = ?auto_606698 ?auto_606703 ) ) ( not ( = ?auto_606698 ?auto_606704 ) ) ( not ( = ?auto_606699 ?auto_606700 ) ) ( not ( = ?auto_606699 ?auto_606701 ) ) ( not ( = ?auto_606699 ?auto_606702 ) ) ( not ( = ?auto_606699 ?auto_606703 ) ) ( not ( = ?auto_606699 ?auto_606704 ) ) ( not ( = ?auto_606700 ?auto_606701 ) ) ( not ( = ?auto_606700 ?auto_606702 ) ) ( not ( = ?auto_606700 ?auto_606703 ) ) ( not ( = ?auto_606700 ?auto_606704 ) ) ( not ( = ?auto_606701 ?auto_606702 ) ) ( not ( = ?auto_606701 ?auto_606703 ) ) ( not ( = ?auto_606701 ?auto_606704 ) ) ( not ( = ?auto_606702 ?auto_606703 ) ) ( not ( = ?auto_606702 ?auto_606704 ) ) ( not ( = ?auto_606703 ?auto_606704 ) ) ( ON ?auto_606702 ?auto_606703 ) ( ON ?auto_606701 ?auto_606702 ) ( CLEAR ?auto_606699 ) ( ON ?auto_606700 ?auto_606701 ) ( CLEAR ?auto_606700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_606694 ?auto_606695 ?auto_606696 ?auto_606697 ?auto_606698 ?auto_606699 ?auto_606700 )
      ( MAKE-10PILE ?auto_606694 ?auto_606695 ?auto_606696 ?auto_606697 ?auto_606698 ?auto_606699 ?auto_606700 ?auto_606701 ?auto_606702 ?auto_606703 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_606736 - BLOCK
      ?auto_606737 - BLOCK
      ?auto_606738 - BLOCK
      ?auto_606739 - BLOCK
      ?auto_606740 - BLOCK
      ?auto_606741 - BLOCK
      ?auto_606742 - BLOCK
      ?auto_606743 - BLOCK
      ?auto_606744 - BLOCK
      ?auto_606745 - BLOCK
    )
    :vars
    (
      ?auto_606746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606745 ?auto_606746 ) ( ON-TABLE ?auto_606736 ) ( ON ?auto_606737 ?auto_606736 ) ( ON ?auto_606738 ?auto_606737 ) ( ON ?auto_606739 ?auto_606738 ) ( ON ?auto_606740 ?auto_606739 ) ( not ( = ?auto_606736 ?auto_606737 ) ) ( not ( = ?auto_606736 ?auto_606738 ) ) ( not ( = ?auto_606736 ?auto_606739 ) ) ( not ( = ?auto_606736 ?auto_606740 ) ) ( not ( = ?auto_606736 ?auto_606741 ) ) ( not ( = ?auto_606736 ?auto_606742 ) ) ( not ( = ?auto_606736 ?auto_606743 ) ) ( not ( = ?auto_606736 ?auto_606744 ) ) ( not ( = ?auto_606736 ?auto_606745 ) ) ( not ( = ?auto_606736 ?auto_606746 ) ) ( not ( = ?auto_606737 ?auto_606738 ) ) ( not ( = ?auto_606737 ?auto_606739 ) ) ( not ( = ?auto_606737 ?auto_606740 ) ) ( not ( = ?auto_606737 ?auto_606741 ) ) ( not ( = ?auto_606737 ?auto_606742 ) ) ( not ( = ?auto_606737 ?auto_606743 ) ) ( not ( = ?auto_606737 ?auto_606744 ) ) ( not ( = ?auto_606737 ?auto_606745 ) ) ( not ( = ?auto_606737 ?auto_606746 ) ) ( not ( = ?auto_606738 ?auto_606739 ) ) ( not ( = ?auto_606738 ?auto_606740 ) ) ( not ( = ?auto_606738 ?auto_606741 ) ) ( not ( = ?auto_606738 ?auto_606742 ) ) ( not ( = ?auto_606738 ?auto_606743 ) ) ( not ( = ?auto_606738 ?auto_606744 ) ) ( not ( = ?auto_606738 ?auto_606745 ) ) ( not ( = ?auto_606738 ?auto_606746 ) ) ( not ( = ?auto_606739 ?auto_606740 ) ) ( not ( = ?auto_606739 ?auto_606741 ) ) ( not ( = ?auto_606739 ?auto_606742 ) ) ( not ( = ?auto_606739 ?auto_606743 ) ) ( not ( = ?auto_606739 ?auto_606744 ) ) ( not ( = ?auto_606739 ?auto_606745 ) ) ( not ( = ?auto_606739 ?auto_606746 ) ) ( not ( = ?auto_606740 ?auto_606741 ) ) ( not ( = ?auto_606740 ?auto_606742 ) ) ( not ( = ?auto_606740 ?auto_606743 ) ) ( not ( = ?auto_606740 ?auto_606744 ) ) ( not ( = ?auto_606740 ?auto_606745 ) ) ( not ( = ?auto_606740 ?auto_606746 ) ) ( not ( = ?auto_606741 ?auto_606742 ) ) ( not ( = ?auto_606741 ?auto_606743 ) ) ( not ( = ?auto_606741 ?auto_606744 ) ) ( not ( = ?auto_606741 ?auto_606745 ) ) ( not ( = ?auto_606741 ?auto_606746 ) ) ( not ( = ?auto_606742 ?auto_606743 ) ) ( not ( = ?auto_606742 ?auto_606744 ) ) ( not ( = ?auto_606742 ?auto_606745 ) ) ( not ( = ?auto_606742 ?auto_606746 ) ) ( not ( = ?auto_606743 ?auto_606744 ) ) ( not ( = ?auto_606743 ?auto_606745 ) ) ( not ( = ?auto_606743 ?auto_606746 ) ) ( not ( = ?auto_606744 ?auto_606745 ) ) ( not ( = ?auto_606744 ?auto_606746 ) ) ( not ( = ?auto_606745 ?auto_606746 ) ) ( ON ?auto_606744 ?auto_606745 ) ( ON ?auto_606743 ?auto_606744 ) ( ON ?auto_606742 ?auto_606743 ) ( CLEAR ?auto_606740 ) ( ON ?auto_606741 ?auto_606742 ) ( CLEAR ?auto_606741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_606736 ?auto_606737 ?auto_606738 ?auto_606739 ?auto_606740 ?auto_606741 )
      ( MAKE-10PILE ?auto_606736 ?auto_606737 ?auto_606738 ?auto_606739 ?auto_606740 ?auto_606741 ?auto_606742 ?auto_606743 ?auto_606744 ?auto_606745 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_606778 - BLOCK
      ?auto_606779 - BLOCK
      ?auto_606780 - BLOCK
      ?auto_606781 - BLOCK
      ?auto_606782 - BLOCK
      ?auto_606783 - BLOCK
      ?auto_606784 - BLOCK
      ?auto_606785 - BLOCK
      ?auto_606786 - BLOCK
      ?auto_606787 - BLOCK
    )
    :vars
    (
      ?auto_606788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606787 ?auto_606788 ) ( ON-TABLE ?auto_606778 ) ( ON ?auto_606779 ?auto_606778 ) ( ON ?auto_606780 ?auto_606779 ) ( ON ?auto_606781 ?auto_606780 ) ( not ( = ?auto_606778 ?auto_606779 ) ) ( not ( = ?auto_606778 ?auto_606780 ) ) ( not ( = ?auto_606778 ?auto_606781 ) ) ( not ( = ?auto_606778 ?auto_606782 ) ) ( not ( = ?auto_606778 ?auto_606783 ) ) ( not ( = ?auto_606778 ?auto_606784 ) ) ( not ( = ?auto_606778 ?auto_606785 ) ) ( not ( = ?auto_606778 ?auto_606786 ) ) ( not ( = ?auto_606778 ?auto_606787 ) ) ( not ( = ?auto_606778 ?auto_606788 ) ) ( not ( = ?auto_606779 ?auto_606780 ) ) ( not ( = ?auto_606779 ?auto_606781 ) ) ( not ( = ?auto_606779 ?auto_606782 ) ) ( not ( = ?auto_606779 ?auto_606783 ) ) ( not ( = ?auto_606779 ?auto_606784 ) ) ( not ( = ?auto_606779 ?auto_606785 ) ) ( not ( = ?auto_606779 ?auto_606786 ) ) ( not ( = ?auto_606779 ?auto_606787 ) ) ( not ( = ?auto_606779 ?auto_606788 ) ) ( not ( = ?auto_606780 ?auto_606781 ) ) ( not ( = ?auto_606780 ?auto_606782 ) ) ( not ( = ?auto_606780 ?auto_606783 ) ) ( not ( = ?auto_606780 ?auto_606784 ) ) ( not ( = ?auto_606780 ?auto_606785 ) ) ( not ( = ?auto_606780 ?auto_606786 ) ) ( not ( = ?auto_606780 ?auto_606787 ) ) ( not ( = ?auto_606780 ?auto_606788 ) ) ( not ( = ?auto_606781 ?auto_606782 ) ) ( not ( = ?auto_606781 ?auto_606783 ) ) ( not ( = ?auto_606781 ?auto_606784 ) ) ( not ( = ?auto_606781 ?auto_606785 ) ) ( not ( = ?auto_606781 ?auto_606786 ) ) ( not ( = ?auto_606781 ?auto_606787 ) ) ( not ( = ?auto_606781 ?auto_606788 ) ) ( not ( = ?auto_606782 ?auto_606783 ) ) ( not ( = ?auto_606782 ?auto_606784 ) ) ( not ( = ?auto_606782 ?auto_606785 ) ) ( not ( = ?auto_606782 ?auto_606786 ) ) ( not ( = ?auto_606782 ?auto_606787 ) ) ( not ( = ?auto_606782 ?auto_606788 ) ) ( not ( = ?auto_606783 ?auto_606784 ) ) ( not ( = ?auto_606783 ?auto_606785 ) ) ( not ( = ?auto_606783 ?auto_606786 ) ) ( not ( = ?auto_606783 ?auto_606787 ) ) ( not ( = ?auto_606783 ?auto_606788 ) ) ( not ( = ?auto_606784 ?auto_606785 ) ) ( not ( = ?auto_606784 ?auto_606786 ) ) ( not ( = ?auto_606784 ?auto_606787 ) ) ( not ( = ?auto_606784 ?auto_606788 ) ) ( not ( = ?auto_606785 ?auto_606786 ) ) ( not ( = ?auto_606785 ?auto_606787 ) ) ( not ( = ?auto_606785 ?auto_606788 ) ) ( not ( = ?auto_606786 ?auto_606787 ) ) ( not ( = ?auto_606786 ?auto_606788 ) ) ( not ( = ?auto_606787 ?auto_606788 ) ) ( ON ?auto_606786 ?auto_606787 ) ( ON ?auto_606785 ?auto_606786 ) ( ON ?auto_606784 ?auto_606785 ) ( ON ?auto_606783 ?auto_606784 ) ( CLEAR ?auto_606781 ) ( ON ?auto_606782 ?auto_606783 ) ( CLEAR ?auto_606782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_606778 ?auto_606779 ?auto_606780 ?auto_606781 ?auto_606782 )
      ( MAKE-10PILE ?auto_606778 ?auto_606779 ?auto_606780 ?auto_606781 ?auto_606782 ?auto_606783 ?auto_606784 ?auto_606785 ?auto_606786 ?auto_606787 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_606820 - BLOCK
      ?auto_606821 - BLOCK
      ?auto_606822 - BLOCK
      ?auto_606823 - BLOCK
      ?auto_606824 - BLOCK
      ?auto_606825 - BLOCK
      ?auto_606826 - BLOCK
      ?auto_606827 - BLOCK
      ?auto_606828 - BLOCK
      ?auto_606829 - BLOCK
    )
    :vars
    (
      ?auto_606830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606829 ?auto_606830 ) ( ON-TABLE ?auto_606820 ) ( ON ?auto_606821 ?auto_606820 ) ( ON ?auto_606822 ?auto_606821 ) ( not ( = ?auto_606820 ?auto_606821 ) ) ( not ( = ?auto_606820 ?auto_606822 ) ) ( not ( = ?auto_606820 ?auto_606823 ) ) ( not ( = ?auto_606820 ?auto_606824 ) ) ( not ( = ?auto_606820 ?auto_606825 ) ) ( not ( = ?auto_606820 ?auto_606826 ) ) ( not ( = ?auto_606820 ?auto_606827 ) ) ( not ( = ?auto_606820 ?auto_606828 ) ) ( not ( = ?auto_606820 ?auto_606829 ) ) ( not ( = ?auto_606820 ?auto_606830 ) ) ( not ( = ?auto_606821 ?auto_606822 ) ) ( not ( = ?auto_606821 ?auto_606823 ) ) ( not ( = ?auto_606821 ?auto_606824 ) ) ( not ( = ?auto_606821 ?auto_606825 ) ) ( not ( = ?auto_606821 ?auto_606826 ) ) ( not ( = ?auto_606821 ?auto_606827 ) ) ( not ( = ?auto_606821 ?auto_606828 ) ) ( not ( = ?auto_606821 ?auto_606829 ) ) ( not ( = ?auto_606821 ?auto_606830 ) ) ( not ( = ?auto_606822 ?auto_606823 ) ) ( not ( = ?auto_606822 ?auto_606824 ) ) ( not ( = ?auto_606822 ?auto_606825 ) ) ( not ( = ?auto_606822 ?auto_606826 ) ) ( not ( = ?auto_606822 ?auto_606827 ) ) ( not ( = ?auto_606822 ?auto_606828 ) ) ( not ( = ?auto_606822 ?auto_606829 ) ) ( not ( = ?auto_606822 ?auto_606830 ) ) ( not ( = ?auto_606823 ?auto_606824 ) ) ( not ( = ?auto_606823 ?auto_606825 ) ) ( not ( = ?auto_606823 ?auto_606826 ) ) ( not ( = ?auto_606823 ?auto_606827 ) ) ( not ( = ?auto_606823 ?auto_606828 ) ) ( not ( = ?auto_606823 ?auto_606829 ) ) ( not ( = ?auto_606823 ?auto_606830 ) ) ( not ( = ?auto_606824 ?auto_606825 ) ) ( not ( = ?auto_606824 ?auto_606826 ) ) ( not ( = ?auto_606824 ?auto_606827 ) ) ( not ( = ?auto_606824 ?auto_606828 ) ) ( not ( = ?auto_606824 ?auto_606829 ) ) ( not ( = ?auto_606824 ?auto_606830 ) ) ( not ( = ?auto_606825 ?auto_606826 ) ) ( not ( = ?auto_606825 ?auto_606827 ) ) ( not ( = ?auto_606825 ?auto_606828 ) ) ( not ( = ?auto_606825 ?auto_606829 ) ) ( not ( = ?auto_606825 ?auto_606830 ) ) ( not ( = ?auto_606826 ?auto_606827 ) ) ( not ( = ?auto_606826 ?auto_606828 ) ) ( not ( = ?auto_606826 ?auto_606829 ) ) ( not ( = ?auto_606826 ?auto_606830 ) ) ( not ( = ?auto_606827 ?auto_606828 ) ) ( not ( = ?auto_606827 ?auto_606829 ) ) ( not ( = ?auto_606827 ?auto_606830 ) ) ( not ( = ?auto_606828 ?auto_606829 ) ) ( not ( = ?auto_606828 ?auto_606830 ) ) ( not ( = ?auto_606829 ?auto_606830 ) ) ( ON ?auto_606828 ?auto_606829 ) ( ON ?auto_606827 ?auto_606828 ) ( ON ?auto_606826 ?auto_606827 ) ( ON ?auto_606825 ?auto_606826 ) ( ON ?auto_606824 ?auto_606825 ) ( CLEAR ?auto_606822 ) ( ON ?auto_606823 ?auto_606824 ) ( CLEAR ?auto_606823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_606820 ?auto_606821 ?auto_606822 ?auto_606823 )
      ( MAKE-10PILE ?auto_606820 ?auto_606821 ?auto_606822 ?auto_606823 ?auto_606824 ?auto_606825 ?auto_606826 ?auto_606827 ?auto_606828 ?auto_606829 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_606862 - BLOCK
      ?auto_606863 - BLOCK
      ?auto_606864 - BLOCK
      ?auto_606865 - BLOCK
      ?auto_606866 - BLOCK
      ?auto_606867 - BLOCK
      ?auto_606868 - BLOCK
      ?auto_606869 - BLOCK
      ?auto_606870 - BLOCK
      ?auto_606871 - BLOCK
    )
    :vars
    (
      ?auto_606872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606871 ?auto_606872 ) ( ON-TABLE ?auto_606862 ) ( ON ?auto_606863 ?auto_606862 ) ( not ( = ?auto_606862 ?auto_606863 ) ) ( not ( = ?auto_606862 ?auto_606864 ) ) ( not ( = ?auto_606862 ?auto_606865 ) ) ( not ( = ?auto_606862 ?auto_606866 ) ) ( not ( = ?auto_606862 ?auto_606867 ) ) ( not ( = ?auto_606862 ?auto_606868 ) ) ( not ( = ?auto_606862 ?auto_606869 ) ) ( not ( = ?auto_606862 ?auto_606870 ) ) ( not ( = ?auto_606862 ?auto_606871 ) ) ( not ( = ?auto_606862 ?auto_606872 ) ) ( not ( = ?auto_606863 ?auto_606864 ) ) ( not ( = ?auto_606863 ?auto_606865 ) ) ( not ( = ?auto_606863 ?auto_606866 ) ) ( not ( = ?auto_606863 ?auto_606867 ) ) ( not ( = ?auto_606863 ?auto_606868 ) ) ( not ( = ?auto_606863 ?auto_606869 ) ) ( not ( = ?auto_606863 ?auto_606870 ) ) ( not ( = ?auto_606863 ?auto_606871 ) ) ( not ( = ?auto_606863 ?auto_606872 ) ) ( not ( = ?auto_606864 ?auto_606865 ) ) ( not ( = ?auto_606864 ?auto_606866 ) ) ( not ( = ?auto_606864 ?auto_606867 ) ) ( not ( = ?auto_606864 ?auto_606868 ) ) ( not ( = ?auto_606864 ?auto_606869 ) ) ( not ( = ?auto_606864 ?auto_606870 ) ) ( not ( = ?auto_606864 ?auto_606871 ) ) ( not ( = ?auto_606864 ?auto_606872 ) ) ( not ( = ?auto_606865 ?auto_606866 ) ) ( not ( = ?auto_606865 ?auto_606867 ) ) ( not ( = ?auto_606865 ?auto_606868 ) ) ( not ( = ?auto_606865 ?auto_606869 ) ) ( not ( = ?auto_606865 ?auto_606870 ) ) ( not ( = ?auto_606865 ?auto_606871 ) ) ( not ( = ?auto_606865 ?auto_606872 ) ) ( not ( = ?auto_606866 ?auto_606867 ) ) ( not ( = ?auto_606866 ?auto_606868 ) ) ( not ( = ?auto_606866 ?auto_606869 ) ) ( not ( = ?auto_606866 ?auto_606870 ) ) ( not ( = ?auto_606866 ?auto_606871 ) ) ( not ( = ?auto_606866 ?auto_606872 ) ) ( not ( = ?auto_606867 ?auto_606868 ) ) ( not ( = ?auto_606867 ?auto_606869 ) ) ( not ( = ?auto_606867 ?auto_606870 ) ) ( not ( = ?auto_606867 ?auto_606871 ) ) ( not ( = ?auto_606867 ?auto_606872 ) ) ( not ( = ?auto_606868 ?auto_606869 ) ) ( not ( = ?auto_606868 ?auto_606870 ) ) ( not ( = ?auto_606868 ?auto_606871 ) ) ( not ( = ?auto_606868 ?auto_606872 ) ) ( not ( = ?auto_606869 ?auto_606870 ) ) ( not ( = ?auto_606869 ?auto_606871 ) ) ( not ( = ?auto_606869 ?auto_606872 ) ) ( not ( = ?auto_606870 ?auto_606871 ) ) ( not ( = ?auto_606870 ?auto_606872 ) ) ( not ( = ?auto_606871 ?auto_606872 ) ) ( ON ?auto_606870 ?auto_606871 ) ( ON ?auto_606869 ?auto_606870 ) ( ON ?auto_606868 ?auto_606869 ) ( ON ?auto_606867 ?auto_606868 ) ( ON ?auto_606866 ?auto_606867 ) ( ON ?auto_606865 ?auto_606866 ) ( CLEAR ?auto_606863 ) ( ON ?auto_606864 ?auto_606865 ) ( CLEAR ?auto_606864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_606862 ?auto_606863 ?auto_606864 )
      ( MAKE-10PILE ?auto_606862 ?auto_606863 ?auto_606864 ?auto_606865 ?auto_606866 ?auto_606867 ?auto_606868 ?auto_606869 ?auto_606870 ?auto_606871 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_606904 - BLOCK
      ?auto_606905 - BLOCK
      ?auto_606906 - BLOCK
      ?auto_606907 - BLOCK
      ?auto_606908 - BLOCK
      ?auto_606909 - BLOCK
      ?auto_606910 - BLOCK
      ?auto_606911 - BLOCK
      ?auto_606912 - BLOCK
      ?auto_606913 - BLOCK
    )
    :vars
    (
      ?auto_606914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606913 ?auto_606914 ) ( ON-TABLE ?auto_606904 ) ( not ( = ?auto_606904 ?auto_606905 ) ) ( not ( = ?auto_606904 ?auto_606906 ) ) ( not ( = ?auto_606904 ?auto_606907 ) ) ( not ( = ?auto_606904 ?auto_606908 ) ) ( not ( = ?auto_606904 ?auto_606909 ) ) ( not ( = ?auto_606904 ?auto_606910 ) ) ( not ( = ?auto_606904 ?auto_606911 ) ) ( not ( = ?auto_606904 ?auto_606912 ) ) ( not ( = ?auto_606904 ?auto_606913 ) ) ( not ( = ?auto_606904 ?auto_606914 ) ) ( not ( = ?auto_606905 ?auto_606906 ) ) ( not ( = ?auto_606905 ?auto_606907 ) ) ( not ( = ?auto_606905 ?auto_606908 ) ) ( not ( = ?auto_606905 ?auto_606909 ) ) ( not ( = ?auto_606905 ?auto_606910 ) ) ( not ( = ?auto_606905 ?auto_606911 ) ) ( not ( = ?auto_606905 ?auto_606912 ) ) ( not ( = ?auto_606905 ?auto_606913 ) ) ( not ( = ?auto_606905 ?auto_606914 ) ) ( not ( = ?auto_606906 ?auto_606907 ) ) ( not ( = ?auto_606906 ?auto_606908 ) ) ( not ( = ?auto_606906 ?auto_606909 ) ) ( not ( = ?auto_606906 ?auto_606910 ) ) ( not ( = ?auto_606906 ?auto_606911 ) ) ( not ( = ?auto_606906 ?auto_606912 ) ) ( not ( = ?auto_606906 ?auto_606913 ) ) ( not ( = ?auto_606906 ?auto_606914 ) ) ( not ( = ?auto_606907 ?auto_606908 ) ) ( not ( = ?auto_606907 ?auto_606909 ) ) ( not ( = ?auto_606907 ?auto_606910 ) ) ( not ( = ?auto_606907 ?auto_606911 ) ) ( not ( = ?auto_606907 ?auto_606912 ) ) ( not ( = ?auto_606907 ?auto_606913 ) ) ( not ( = ?auto_606907 ?auto_606914 ) ) ( not ( = ?auto_606908 ?auto_606909 ) ) ( not ( = ?auto_606908 ?auto_606910 ) ) ( not ( = ?auto_606908 ?auto_606911 ) ) ( not ( = ?auto_606908 ?auto_606912 ) ) ( not ( = ?auto_606908 ?auto_606913 ) ) ( not ( = ?auto_606908 ?auto_606914 ) ) ( not ( = ?auto_606909 ?auto_606910 ) ) ( not ( = ?auto_606909 ?auto_606911 ) ) ( not ( = ?auto_606909 ?auto_606912 ) ) ( not ( = ?auto_606909 ?auto_606913 ) ) ( not ( = ?auto_606909 ?auto_606914 ) ) ( not ( = ?auto_606910 ?auto_606911 ) ) ( not ( = ?auto_606910 ?auto_606912 ) ) ( not ( = ?auto_606910 ?auto_606913 ) ) ( not ( = ?auto_606910 ?auto_606914 ) ) ( not ( = ?auto_606911 ?auto_606912 ) ) ( not ( = ?auto_606911 ?auto_606913 ) ) ( not ( = ?auto_606911 ?auto_606914 ) ) ( not ( = ?auto_606912 ?auto_606913 ) ) ( not ( = ?auto_606912 ?auto_606914 ) ) ( not ( = ?auto_606913 ?auto_606914 ) ) ( ON ?auto_606912 ?auto_606913 ) ( ON ?auto_606911 ?auto_606912 ) ( ON ?auto_606910 ?auto_606911 ) ( ON ?auto_606909 ?auto_606910 ) ( ON ?auto_606908 ?auto_606909 ) ( ON ?auto_606907 ?auto_606908 ) ( ON ?auto_606906 ?auto_606907 ) ( CLEAR ?auto_606904 ) ( ON ?auto_606905 ?auto_606906 ) ( CLEAR ?auto_606905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_606904 ?auto_606905 )
      ( MAKE-10PILE ?auto_606904 ?auto_606905 ?auto_606906 ?auto_606907 ?auto_606908 ?auto_606909 ?auto_606910 ?auto_606911 ?auto_606912 ?auto_606913 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_606946 - BLOCK
      ?auto_606947 - BLOCK
      ?auto_606948 - BLOCK
      ?auto_606949 - BLOCK
      ?auto_606950 - BLOCK
      ?auto_606951 - BLOCK
      ?auto_606952 - BLOCK
      ?auto_606953 - BLOCK
      ?auto_606954 - BLOCK
      ?auto_606955 - BLOCK
    )
    :vars
    (
      ?auto_606956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_606955 ?auto_606956 ) ( not ( = ?auto_606946 ?auto_606947 ) ) ( not ( = ?auto_606946 ?auto_606948 ) ) ( not ( = ?auto_606946 ?auto_606949 ) ) ( not ( = ?auto_606946 ?auto_606950 ) ) ( not ( = ?auto_606946 ?auto_606951 ) ) ( not ( = ?auto_606946 ?auto_606952 ) ) ( not ( = ?auto_606946 ?auto_606953 ) ) ( not ( = ?auto_606946 ?auto_606954 ) ) ( not ( = ?auto_606946 ?auto_606955 ) ) ( not ( = ?auto_606946 ?auto_606956 ) ) ( not ( = ?auto_606947 ?auto_606948 ) ) ( not ( = ?auto_606947 ?auto_606949 ) ) ( not ( = ?auto_606947 ?auto_606950 ) ) ( not ( = ?auto_606947 ?auto_606951 ) ) ( not ( = ?auto_606947 ?auto_606952 ) ) ( not ( = ?auto_606947 ?auto_606953 ) ) ( not ( = ?auto_606947 ?auto_606954 ) ) ( not ( = ?auto_606947 ?auto_606955 ) ) ( not ( = ?auto_606947 ?auto_606956 ) ) ( not ( = ?auto_606948 ?auto_606949 ) ) ( not ( = ?auto_606948 ?auto_606950 ) ) ( not ( = ?auto_606948 ?auto_606951 ) ) ( not ( = ?auto_606948 ?auto_606952 ) ) ( not ( = ?auto_606948 ?auto_606953 ) ) ( not ( = ?auto_606948 ?auto_606954 ) ) ( not ( = ?auto_606948 ?auto_606955 ) ) ( not ( = ?auto_606948 ?auto_606956 ) ) ( not ( = ?auto_606949 ?auto_606950 ) ) ( not ( = ?auto_606949 ?auto_606951 ) ) ( not ( = ?auto_606949 ?auto_606952 ) ) ( not ( = ?auto_606949 ?auto_606953 ) ) ( not ( = ?auto_606949 ?auto_606954 ) ) ( not ( = ?auto_606949 ?auto_606955 ) ) ( not ( = ?auto_606949 ?auto_606956 ) ) ( not ( = ?auto_606950 ?auto_606951 ) ) ( not ( = ?auto_606950 ?auto_606952 ) ) ( not ( = ?auto_606950 ?auto_606953 ) ) ( not ( = ?auto_606950 ?auto_606954 ) ) ( not ( = ?auto_606950 ?auto_606955 ) ) ( not ( = ?auto_606950 ?auto_606956 ) ) ( not ( = ?auto_606951 ?auto_606952 ) ) ( not ( = ?auto_606951 ?auto_606953 ) ) ( not ( = ?auto_606951 ?auto_606954 ) ) ( not ( = ?auto_606951 ?auto_606955 ) ) ( not ( = ?auto_606951 ?auto_606956 ) ) ( not ( = ?auto_606952 ?auto_606953 ) ) ( not ( = ?auto_606952 ?auto_606954 ) ) ( not ( = ?auto_606952 ?auto_606955 ) ) ( not ( = ?auto_606952 ?auto_606956 ) ) ( not ( = ?auto_606953 ?auto_606954 ) ) ( not ( = ?auto_606953 ?auto_606955 ) ) ( not ( = ?auto_606953 ?auto_606956 ) ) ( not ( = ?auto_606954 ?auto_606955 ) ) ( not ( = ?auto_606954 ?auto_606956 ) ) ( not ( = ?auto_606955 ?auto_606956 ) ) ( ON ?auto_606954 ?auto_606955 ) ( ON ?auto_606953 ?auto_606954 ) ( ON ?auto_606952 ?auto_606953 ) ( ON ?auto_606951 ?auto_606952 ) ( ON ?auto_606950 ?auto_606951 ) ( ON ?auto_606949 ?auto_606950 ) ( ON ?auto_606948 ?auto_606949 ) ( ON ?auto_606947 ?auto_606948 ) ( ON ?auto_606946 ?auto_606947 ) ( CLEAR ?auto_606946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_606946 )
      ( MAKE-10PILE ?auto_606946 ?auto_606947 ?auto_606948 ?auto_606949 ?auto_606950 ?auto_606951 ?auto_606952 ?auto_606953 ?auto_606954 ?auto_606955 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_606989 - BLOCK
      ?auto_606990 - BLOCK
      ?auto_606991 - BLOCK
      ?auto_606992 - BLOCK
      ?auto_606993 - BLOCK
      ?auto_606994 - BLOCK
      ?auto_606995 - BLOCK
      ?auto_606996 - BLOCK
      ?auto_606997 - BLOCK
      ?auto_606998 - BLOCK
      ?auto_606999 - BLOCK
    )
    :vars
    (
      ?auto_607000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_606998 ) ( ON ?auto_606999 ?auto_607000 ) ( CLEAR ?auto_606999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_606989 ) ( ON ?auto_606990 ?auto_606989 ) ( ON ?auto_606991 ?auto_606990 ) ( ON ?auto_606992 ?auto_606991 ) ( ON ?auto_606993 ?auto_606992 ) ( ON ?auto_606994 ?auto_606993 ) ( ON ?auto_606995 ?auto_606994 ) ( ON ?auto_606996 ?auto_606995 ) ( ON ?auto_606997 ?auto_606996 ) ( ON ?auto_606998 ?auto_606997 ) ( not ( = ?auto_606989 ?auto_606990 ) ) ( not ( = ?auto_606989 ?auto_606991 ) ) ( not ( = ?auto_606989 ?auto_606992 ) ) ( not ( = ?auto_606989 ?auto_606993 ) ) ( not ( = ?auto_606989 ?auto_606994 ) ) ( not ( = ?auto_606989 ?auto_606995 ) ) ( not ( = ?auto_606989 ?auto_606996 ) ) ( not ( = ?auto_606989 ?auto_606997 ) ) ( not ( = ?auto_606989 ?auto_606998 ) ) ( not ( = ?auto_606989 ?auto_606999 ) ) ( not ( = ?auto_606989 ?auto_607000 ) ) ( not ( = ?auto_606990 ?auto_606991 ) ) ( not ( = ?auto_606990 ?auto_606992 ) ) ( not ( = ?auto_606990 ?auto_606993 ) ) ( not ( = ?auto_606990 ?auto_606994 ) ) ( not ( = ?auto_606990 ?auto_606995 ) ) ( not ( = ?auto_606990 ?auto_606996 ) ) ( not ( = ?auto_606990 ?auto_606997 ) ) ( not ( = ?auto_606990 ?auto_606998 ) ) ( not ( = ?auto_606990 ?auto_606999 ) ) ( not ( = ?auto_606990 ?auto_607000 ) ) ( not ( = ?auto_606991 ?auto_606992 ) ) ( not ( = ?auto_606991 ?auto_606993 ) ) ( not ( = ?auto_606991 ?auto_606994 ) ) ( not ( = ?auto_606991 ?auto_606995 ) ) ( not ( = ?auto_606991 ?auto_606996 ) ) ( not ( = ?auto_606991 ?auto_606997 ) ) ( not ( = ?auto_606991 ?auto_606998 ) ) ( not ( = ?auto_606991 ?auto_606999 ) ) ( not ( = ?auto_606991 ?auto_607000 ) ) ( not ( = ?auto_606992 ?auto_606993 ) ) ( not ( = ?auto_606992 ?auto_606994 ) ) ( not ( = ?auto_606992 ?auto_606995 ) ) ( not ( = ?auto_606992 ?auto_606996 ) ) ( not ( = ?auto_606992 ?auto_606997 ) ) ( not ( = ?auto_606992 ?auto_606998 ) ) ( not ( = ?auto_606992 ?auto_606999 ) ) ( not ( = ?auto_606992 ?auto_607000 ) ) ( not ( = ?auto_606993 ?auto_606994 ) ) ( not ( = ?auto_606993 ?auto_606995 ) ) ( not ( = ?auto_606993 ?auto_606996 ) ) ( not ( = ?auto_606993 ?auto_606997 ) ) ( not ( = ?auto_606993 ?auto_606998 ) ) ( not ( = ?auto_606993 ?auto_606999 ) ) ( not ( = ?auto_606993 ?auto_607000 ) ) ( not ( = ?auto_606994 ?auto_606995 ) ) ( not ( = ?auto_606994 ?auto_606996 ) ) ( not ( = ?auto_606994 ?auto_606997 ) ) ( not ( = ?auto_606994 ?auto_606998 ) ) ( not ( = ?auto_606994 ?auto_606999 ) ) ( not ( = ?auto_606994 ?auto_607000 ) ) ( not ( = ?auto_606995 ?auto_606996 ) ) ( not ( = ?auto_606995 ?auto_606997 ) ) ( not ( = ?auto_606995 ?auto_606998 ) ) ( not ( = ?auto_606995 ?auto_606999 ) ) ( not ( = ?auto_606995 ?auto_607000 ) ) ( not ( = ?auto_606996 ?auto_606997 ) ) ( not ( = ?auto_606996 ?auto_606998 ) ) ( not ( = ?auto_606996 ?auto_606999 ) ) ( not ( = ?auto_606996 ?auto_607000 ) ) ( not ( = ?auto_606997 ?auto_606998 ) ) ( not ( = ?auto_606997 ?auto_606999 ) ) ( not ( = ?auto_606997 ?auto_607000 ) ) ( not ( = ?auto_606998 ?auto_606999 ) ) ( not ( = ?auto_606998 ?auto_607000 ) ) ( not ( = ?auto_606999 ?auto_607000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_606999 ?auto_607000 )
      ( !STACK ?auto_606999 ?auto_606998 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_607035 - BLOCK
      ?auto_607036 - BLOCK
      ?auto_607037 - BLOCK
      ?auto_607038 - BLOCK
      ?auto_607039 - BLOCK
      ?auto_607040 - BLOCK
      ?auto_607041 - BLOCK
      ?auto_607042 - BLOCK
      ?auto_607043 - BLOCK
      ?auto_607044 - BLOCK
      ?auto_607045 - BLOCK
    )
    :vars
    (
      ?auto_607046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607045 ?auto_607046 ) ( ON-TABLE ?auto_607035 ) ( ON ?auto_607036 ?auto_607035 ) ( ON ?auto_607037 ?auto_607036 ) ( ON ?auto_607038 ?auto_607037 ) ( ON ?auto_607039 ?auto_607038 ) ( ON ?auto_607040 ?auto_607039 ) ( ON ?auto_607041 ?auto_607040 ) ( ON ?auto_607042 ?auto_607041 ) ( ON ?auto_607043 ?auto_607042 ) ( not ( = ?auto_607035 ?auto_607036 ) ) ( not ( = ?auto_607035 ?auto_607037 ) ) ( not ( = ?auto_607035 ?auto_607038 ) ) ( not ( = ?auto_607035 ?auto_607039 ) ) ( not ( = ?auto_607035 ?auto_607040 ) ) ( not ( = ?auto_607035 ?auto_607041 ) ) ( not ( = ?auto_607035 ?auto_607042 ) ) ( not ( = ?auto_607035 ?auto_607043 ) ) ( not ( = ?auto_607035 ?auto_607044 ) ) ( not ( = ?auto_607035 ?auto_607045 ) ) ( not ( = ?auto_607035 ?auto_607046 ) ) ( not ( = ?auto_607036 ?auto_607037 ) ) ( not ( = ?auto_607036 ?auto_607038 ) ) ( not ( = ?auto_607036 ?auto_607039 ) ) ( not ( = ?auto_607036 ?auto_607040 ) ) ( not ( = ?auto_607036 ?auto_607041 ) ) ( not ( = ?auto_607036 ?auto_607042 ) ) ( not ( = ?auto_607036 ?auto_607043 ) ) ( not ( = ?auto_607036 ?auto_607044 ) ) ( not ( = ?auto_607036 ?auto_607045 ) ) ( not ( = ?auto_607036 ?auto_607046 ) ) ( not ( = ?auto_607037 ?auto_607038 ) ) ( not ( = ?auto_607037 ?auto_607039 ) ) ( not ( = ?auto_607037 ?auto_607040 ) ) ( not ( = ?auto_607037 ?auto_607041 ) ) ( not ( = ?auto_607037 ?auto_607042 ) ) ( not ( = ?auto_607037 ?auto_607043 ) ) ( not ( = ?auto_607037 ?auto_607044 ) ) ( not ( = ?auto_607037 ?auto_607045 ) ) ( not ( = ?auto_607037 ?auto_607046 ) ) ( not ( = ?auto_607038 ?auto_607039 ) ) ( not ( = ?auto_607038 ?auto_607040 ) ) ( not ( = ?auto_607038 ?auto_607041 ) ) ( not ( = ?auto_607038 ?auto_607042 ) ) ( not ( = ?auto_607038 ?auto_607043 ) ) ( not ( = ?auto_607038 ?auto_607044 ) ) ( not ( = ?auto_607038 ?auto_607045 ) ) ( not ( = ?auto_607038 ?auto_607046 ) ) ( not ( = ?auto_607039 ?auto_607040 ) ) ( not ( = ?auto_607039 ?auto_607041 ) ) ( not ( = ?auto_607039 ?auto_607042 ) ) ( not ( = ?auto_607039 ?auto_607043 ) ) ( not ( = ?auto_607039 ?auto_607044 ) ) ( not ( = ?auto_607039 ?auto_607045 ) ) ( not ( = ?auto_607039 ?auto_607046 ) ) ( not ( = ?auto_607040 ?auto_607041 ) ) ( not ( = ?auto_607040 ?auto_607042 ) ) ( not ( = ?auto_607040 ?auto_607043 ) ) ( not ( = ?auto_607040 ?auto_607044 ) ) ( not ( = ?auto_607040 ?auto_607045 ) ) ( not ( = ?auto_607040 ?auto_607046 ) ) ( not ( = ?auto_607041 ?auto_607042 ) ) ( not ( = ?auto_607041 ?auto_607043 ) ) ( not ( = ?auto_607041 ?auto_607044 ) ) ( not ( = ?auto_607041 ?auto_607045 ) ) ( not ( = ?auto_607041 ?auto_607046 ) ) ( not ( = ?auto_607042 ?auto_607043 ) ) ( not ( = ?auto_607042 ?auto_607044 ) ) ( not ( = ?auto_607042 ?auto_607045 ) ) ( not ( = ?auto_607042 ?auto_607046 ) ) ( not ( = ?auto_607043 ?auto_607044 ) ) ( not ( = ?auto_607043 ?auto_607045 ) ) ( not ( = ?auto_607043 ?auto_607046 ) ) ( not ( = ?auto_607044 ?auto_607045 ) ) ( not ( = ?auto_607044 ?auto_607046 ) ) ( not ( = ?auto_607045 ?auto_607046 ) ) ( CLEAR ?auto_607043 ) ( ON ?auto_607044 ?auto_607045 ) ( CLEAR ?auto_607044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_607035 ?auto_607036 ?auto_607037 ?auto_607038 ?auto_607039 ?auto_607040 ?auto_607041 ?auto_607042 ?auto_607043 ?auto_607044 )
      ( MAKE-11PILE ?auto_607035 ?auto_607036 ?auto_607037 ?auto_607038 ?auto_607039 ?auto_607040 ?auto_607041 ?auto_607042 ?auto_607043 ?auto_607044 ?auto_607045 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_607081 - BLOCK
      ?auto_607082 - BLOCK
      ?auto_607083 - BLOCK
      ?auto_607084 - BLOCK
      ?auto_607085 - BLOCK
      ?auto_607086 - BLOCK
      ?auto_607087 - BLOCK
      ?auto_607088 - BLOCK
      ?auto_607089 - BLOCK
      ?auto_607090 - BLOCK
      ?auto_607091 - BLOCK
    )
    :vars
    (
      ?auto_607092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607091 ?auto_607092 ) ( ON-TABLE ?auto_607081 ) ( ON ?auto_607082 ?auto_607081 ) ( ON ?auto_607083 ?auto_607082 ) ( ON ?auto_607084 ?auto_607083 ) ( ON ?auto_607085 ?auto_607084 ) ( ON ?auto_607086 ?auto_607085 ) ( ON ?auto_607087 ?auto_607086 ) ( ON ?auto_607088 ?auto_607087 ) ( not ( = ?auto_607081 ?auto_607082 ) ) ( not ( = ?auto_607081 ?auto_607083 ) ) ( not ( = ?auto_607081 ?auto_607084 ) ) ( not ( = ?auto_607081 ?auto_607085 ) ) ( not ( = ?auto_607081 ?auto_607086 ) ) ( not ( = ?auto_607081 ?auto_607087 ) ) ( not ( = ?auto_607081 ?auto_607088 ) ) ( not ( = ?auto_607081 ?auto_607089 ) ) ( not ( = ?auto_607081 ?auto_607090 ) ) ( not ( = ?auto_607081 ?auto_607091 ) ) ( not ( = ?auto_607081 ?auto_607092 ) ) ( not ( = ?auto_607082 ?auto_607083 ) ) ( not ( = ?auto_607082 ?auto_607084 ) ) ( not ( = ?auto_607082 ?auto_607085 ) ) ( not ( = ?auto_607082 ?auto_607086 ) ) ( not ( = ?auto_607082 ?auto_607087 ) ) ( not ( = ?auto_607082 ?auto_607088 ) ) ( not ( = ?auto_607082 ?auto_607089 ) ) ( not ( = ?auto_607082 ?auto_607090 ) ) ( not ( = ?auto_607082 ?auto_607091 ) ) ( not ( = ?auto_607082 ?auto_607092 ) ) ( not ( = ?auto_607083 ?auto_607084 ) ) ( not ( = ?auto_607083 ?auto_607085 ) ) ( not ( = ?auto_607083 ?auto_607086 ) ) ( not ( = ?auto_607083 ?auto_607087 ) ) ( not ( = ?auto_607083 ?auto_607088 ) ) ( not ( = ?auto_607083 ?auto_607089 ) ) ( not ( = ?auto_607083 ?auto_607090 ) ) ( not ( = ?auto_607083 ?auto_607091 ) ) ( not ( = ?auto_607083 ?auto_607092 ) ) ( not ( = ?auto_607084 ?auto_607085 ) ) ( not ( = ?auto_607084 ?auto_607086 ) ) ( not ( = ?auto_607084 ?auto_607087 ) ) ( not ( = ?auto_607084 ?auto_607088 ) ) ( not ( = ?auto_607084 ?auto_607089 ) ) ( not ( = ?auto_607084 ?auto_607090 ) ) ( not ( = ?auto_607084 ?auto_607091 ) ) ( not ( = ?auto_607084 ?auto_607092 ) ) ( not ( = ?auto_607085 ?auto_607086 ) ) ( not ( = ?auto_607085 ?auto_607087 ) ) ( not ( = ?auto_607085 ?auto_607088 ) ) ( not ( = ?auto_607085 ?auto_607089 ) ) ( not ( = ?auto_607085 ?auto_607090 ) ) ( not ( = ?auto_607085 ?auto_607091 ) ) ( not ( = ?auto_607085 ?auto_607092 ) ) ( not ( = ?auto_607086 ?auto_607087 ) ) ( not ( = ?auto_607086 ?auto_607088 ) ) ( not ( = ?auto_607086 ?auto_607089 ) ) ( not ( = ?auto_607086 ?auto_607090 ) ) ( not ( = ?auto_607086 ?auto_607091 ) ) ( not ( = ?auto_607086 ?auto_607092 ) ) ( not ( = ?auto_607087 ?auto_607088 ) ) ( not ( = ?auto_607087 ?auto_607089 ) ) ( not ( = ?auto_607087 ?auto_607090 ) ) ( not ( = ?auto_607087 ?auto_607091 ) ) ( not ( = ?auto_607087 ?auto_607092 ) ) ( not ( = ?auto_607088 ?auto_607089 ) ) ( not ( = ?auto_607088 ?auto_607090 ) ) ( not ( = ?auto_607088 ?auto_607091 ) ) ( not ( = ?auto_607088 ?auto_607092 ) ) ( not ( = ?auto_607089 ?auto_607090 ) ) ( not ( = ?auto_607089 ?auto_607091 ) ) ( not ( = ?auto_607089 ?auto_607092 ) ) ( not ( = ?auto_607090 ?auto_607091 ) ) ( not ( = ?auto_607090 ?auto_607092 ) ) ( not ( = ?auto_607091 ?auto_607092 ) ) ( ON ?auto_607090 ?auto_607091 ) ( CLEAR ?auto_607088 ) ( ON ?auto_607089 ?auto_607090 ) ( CLEAR ?auto_607089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_607081 ?auto_607082 ?auto_607083 ?auto_607084 ?auto_607085 ?auto_607086 ?auto_607087 ?auto_607088 ?auto_607089 )
      ( MAKE-11PILE ?auto_607081 ?auto_607082 ?auto_607083 ?auto_607084 ?auto_607085 ?auto_607086 ?auto_607087 ?auto_607088 ?auto_607089 ?auto_607090 ?auto_607091 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_607127 - BLOCK
      ?auto_607128 - BLOCK
      ?auto_607129 - BLOCK
      ?auto_607130 - BLOCK
      ?auto_607131 - BLOCK
      ?auto_607132 - BLOCK
      ?auto_607133 - BLOCK
      ?auto_607134 - BLOCK
      ?auto_607135 - BLOCK
      ?auto_607136 - BLOCK
      ?auto_607137 - BLOCK
    )
    :vars
    (
      ?auto_607138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607137 ?auto_607138 ) ( ON-TABLE ?auto_607127 ) ( ON ?auto_607128 ?auto_607127 ) ( ON ?auto_607129 ?auto_607128 ) ( ON ?auto_607130 ?auto_607129 ) ( ON ?auto_607131 ?auto_607130 ) ( ON ?auto_607132 ?auto_607131 ) ( ON ?auto_607133 ?auto_607132 ) ( not ( = ?auto_607127 ?auto_607128 ) ) ( not ( = ?auto_607127 ?auto_607129 ) ) ( not ( = ?auto_607127 ?auto_607130 ) ) ( not ( = ?auto_607127 ?auto_607131 ) ) ( not ( = ?auto_607127 ?auto_607132 ) ) ( not ( = ?auto_607127 ?auto_607133 ) ) ( not ( = ?auto_607127 ?auto_607134 ) ) ( not ( = ?auto_607127 ?auto_607135 ) ) ( not ( = ?auto_607127 ?auto_607136 ) ) ( not ( = ?auto_607127 ?auto_607137 ) ) ( not ( = ?auto_607127 ?auto_607138 ) ) ( not ( = ?auto_607128 ?auto_607129 ) ) ( not ( = ?auto_607128 ?auto_607130 ) ) ( not ( = ?auto_607128 ?auto_607131 ) ) ( not ( = ?auto_607128 ?auto_607132 ) ) ( not ( = ?auto_607128 ?auto_607133 ) ) ( not ( = ?auto_607128 ?auto_607134 ) ) ( not ( = ?auto_607128 ?auto_607135 ) ) ( not ( = ?auto_607128 ?auto_607136 ) ) ( not ( = ?auto_607128 ?auto_607137 ) ) ( not ( = ?auto_607128 ?auto_607138 ) ) ( not ( = ?auto_607129 ?auto_607130 ) ) ( not ( = ?auto_607129 ?auto_607131 ) ) ( not ( = ?auto_607129 ?auto_607132 ) ) ( not ( = ?auto_607129 ?auto_607133 ) ) ( not ( = ?auto_607129 ?auto_607134 ) ) ( not ( = ?auto_607129 ?auto_607135 ) ) ( not ( = ?auto_607129 ?auto_607136 ) ) ( not ( = ?auto_607129 ?auto_607137 ) ) ( not ( = ?auto_607129 ?auto_607138 ) ) ( not ( = ?auto_607130 ?auto_607131 ) ) ( not ( = ?auto_607130 ?auto_607132 ) ) ( not ( = ?auto_607130 ?auto_607133 ) ) ( not ( = ?auto_607130 ?auto_607134 ) ) ( not ( = ?auto_607130 ?auto_607135 ) ) ( not ( = ?auto_607130 ?auto_607136 ) ) ( not ( = ?auto_607130 ?auto_607137 ) ) ( not ( = ?auto_607130 ?auto_607138 ) ) ( not ( = ?auto_607131 ?auto_607132 ) ) ( not ( = ?auto_607131 ?auto_607133 ) ) ( not ( = ?auto_607131 ?auto_607134 ) ) ( not ( = ?auto_607131 ?auto_607135 ) ) ( not ( = ?auto_607131 ?auto_607136 ) ) ( not ( = ?auto_607131 ?auto_607137 ) ) ( not ( = ?auto_607131 ?auto_607138 ) ) ( not ( = ?auto_607132 ?auto_607133 ) ) ( not ( = ?auto_607132 ?auto_607134 ) ) ( not ( = ?auto_607132 ?auto_607135 ) ) ( not ( = ?auto_607132 ?auto_607136 ) ) ( not ( = ?auto_607132 ?auto_607137 ) ) ( not ( = ?auto_607132 ?auto_607138 ) ) ( not ( = ?auto_607133 ?auto_607134 ) ) ( not ( = ?auto_607133 ?auto_607135 ) ) ( not ( = ?auto_607133 ?auto_607136 ) ) ( not ( = ?auto_607133 ?auto_607137 ) ) ( not ( = ?auto_607133 ?auto_607138 ) ) ( not ( = ?auto_607134 ?auto_607135 ) ) ( not ( = ?auto_607134 ?auto_607136 ) ) ( not ( = ?auto_607134 ?auto_607137 ) ) ( not ( = ?auto_607134 ?auto_607138 ) ) ( not ( = ?auto_607135 ?auto_607136 ) ) ( not ( = ?auto_607135 ?auto_607137 ) ) ( not ( = ?auto_607135 ?auto_607138 ) ) ( not ( = ?auto_607136 ?auto_607137 ) ) ( not ( = ?auto_607136 ?auto_607138 ) ) ( not ( = ?auto_607137 ?auto_607138 ) ) ( ON ?auto_607136 ?auto_607137 ) ( ON ?auto_607135 ?auto_607136 ) ( CLEAR ?auto_607133 ) ( ON ?auto_607134 ?auto_607135 ) ( CLEAR ?auto_607134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_607127 ?auto_607128 ?auto_607129 ?auto_607130 ?auto_607131 ?auto_607132 ?auto_607133 ?auto_607134 )
      ( MAKE-11PILE ?auto_607127 ?auto_607128 ?auto_607129 ?auto_607130 ?auto_607131 ?auto_607132 ?auto_607133 ?auto_607134 ?auto_607135 ?auto_607136 ?auto_607137 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_607173 - BLOCK
      ?auto_607174 - BLOCK
      ?auto_607175 - BLOCK
      ?auto_607176 - BLOCK
      ?auto_607177 - BLOCK
      ?auto_607178 - BLOCK
      ?auto_607179 - BLOCK
      ?auto_607180 - BLOCK
      ?auto_607181 - BLOCK
      ?auto_607182 - BLOCK
      ?auto_607183 - BLOCK
    )
    :vars
    (
      ?auto_607184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607183 ?auto_607184 ) ( ON-TABLE ?auto_607173 ) ( ON ?auto_607174 ?auto_607173 ) ( ON ?auto_607175 ?auto_607174 ) ( ON ?auto_607176 ?auto_607175 ) ( ON ?auto_607177 ?auto_607176 ) ( ON ?auto_607178 ?auto_607177 ) ( not ( = ?auto_607173 ?auto_607174 ) ) ( not ( = ?auto_607173 ?auto_607175 ) ) ( not ( = ?auto_607173 ?auto_607176 ) ) ( not ( = ?auto_607173 ?auto_607177 ) ) ( not ( = ?auto_607173 ?auto_607178 ) ) ( not ( = ?auto_607173 ?auto_607179 ) ) ( not ( = ?auto_607173 ?auto_607180 ) ) ( not ( = ?auto_607173 ?auto_607181 ) ) ( not ( = ?auto_607173 ?auto_607182 ) ) ( not ( = ?auto_607173 ?auto_607183 ) ) ( not ( = ?auto_607173 ?auto_607184 ) ) ( not ( = ?auto_607174 ?auto_607175 ) ) ( not ( = ?auto_607174 ?auto_607176 ) ) ( not ( = ?auto_607174 ?auto_607177 ) ) ( not ( = ?auto_607174 ?auto_607178 ) ) ( not ( = ?auto_607174 ?auto_607179 ) ) ( not ( = ?auto_607174 ?auto_607180 ) ) ( not ( = ?auto_607174 ?auto_607181 ) ) ( not ( = ?auto_607174 ?auto_607182 ) ) ( not ( = ?auto_607174 ?auto_607183 ) ) ( not ( = ?auto_607174 ?auto_607184 ) ) ( not ( = ?auto_607175 ?auto_607176 ) ) ( not ( = ?auto_607175 ?auto_607177 ) ) ( not ( = ?auto_607175 ?auto_607178 ) ) ( not ( = ?auto_607175 ?auto_607179 ) ) ( not ( = ?auto_607175 ?auto_607180 ) ) ( not ( = ?auto_607175 ?auto_607181 ) ) ( not ( = ?auto_607175 ?auto_607182 ) ) ( not ( = ?auto_607175 ?auto_607183 ) ) ( not ( = ?auto_607175 ?auto_607184 ) ) ( not ( = ?auto_607176 ?auto_607177 ) ) ( not ( = ?auto_607176 ?auto_607178 ) ) ( not ( = ?auto_607176 ?auto_607179 ) ) ( not ( = ?auto_607176 ?auto_607180 ) ) ( not ( = ?auto_607176 ?auto_607181 ) ) ( not ( = ?auto_607176 ?auto_607182 ) ) ( not ( = ?auto_607176 ?auto_607183 ) ) ( not ( = ?auto_607176 ?auto_607184 ) ) ( not ( = ?auto_607177 ?auto_607178 ) ) ( not ( = ?auto_607177 ?auto_607179 ) ) ( not ( = ?auto_607177 ?auto_607180 ) ) ( not ( = ?auto_607177 ?auto_607181 ) ) ( not ( = ?auto_607177 ?auto_607182 ) ) ( not ( = ?auto_607177 ?auto_607183 ) ) ( not ( = ?auto_607177 ?auto_607184 ) ) ( not ( = ?auto_607178 ?auto_607179 ) ) ( not ( = ?auto_607178 ?auto_607180 ) ) ( not ( = ?auto_607178 ?auto_607181 ) ) ( not ( = ?auto_607178 ?auto_607182 ) ) ( not ( = ?auto_607178 ?auto_607183 ) ) ( not ( = ?auto_607178 ?auto_607184 ) ) ( not ( = ?auto_607179 ?auto_607180 ) ) ( not ( = ?auto_607179 ?auto_607181 ) ) ( not ( = ?auto_607179 ?auto_607182 ) ) ( not ( = ?auto_607179 ?auto_607183 ) ) ( not ( = ?auto_607179 ?auto_607184 ) ) ( not ( = ?auto_607180 ?auto_607181 ) ) ( not ( = ?auto_607180 ?auto_607182 ) ) ( not ( = ?auto_607180 ?auto_607183 ) ) ( not ( = ?auto_607180 ?auto_607184 ) ) ( not ( = ?auto_607181 ?auto_607182 ) ) ( not ( = ?auto_607181 ?auto_607183 ) ) ( not ( = ?auto_607181 ?auto_607184 ) ) ( not ( = ?auto_607182 ?auto_607183 ) ) ( not ( = ?auto_607182 ?auto_607184 ) ) ( not ( = ?auto_607183 ?auto_607184 ) ) ( ON ?auto_607182 ?auto_607183 ) ( ON ?auto_607181 ?auto_607182 ) ( ON ?auto_607180 ?auto_607181 ) ( CLEAR ?auto_607178 ) ( ON ?auto_607179 ?auto_607180 ) ( CLEAR ?auto_607179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_607173 ?auto_607174 ?auto_607175 ?auto_607176 ?auto_607177 ?auto_607178 ?auto_607179 )
      ( MAKE-11PILE ?auto_607173 ?auto_607174 ?auto_607175 ?auto_607176 ?auto_607177 ?auto_607178 ?auto_607179 ?auto_607180 ?auto_607181 ?auto_607182 ?auto_607183 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_607219 - BLOCK
      ?auto_607220 - BLOCK
      ?auto_607221 - BLOCK
      ?auto_607222 - BLOCK
      ?auto_607223 - BLOCK
      ?auto_607224 - BLOCK
      ?auto_607225 - BLOCK
      ?auto_607226 - BLOCK
      ?auto_607227 - BLOCK
      ?auto_607228 - BLOCK
      ?auto_607229 - BLOCK
    )
    :vars
    (
      ?auto_607230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607229 ?auto_607230 ) ( ON-TABLE ?auto_607219 ) ( ON ?auto_607220 ?auto_607219 ) ( ON ?auto_607221 ?auto_607220 ) ( ON ?auto_607222 ?auto_607221 ) ( ON ?auto_607223 ?auto_607222 ) ( not ( = ?auto_607219 ?auto_607220 ) ) ( not ( = ?auto_607219 ?auto_607221 ) ) ( not ( = ?auto_607219 ?auto_607222 ) ) ( not ( = ?auto_607219 ?auto_607223 ) ) ( not ( = ?auto_607219 ?auto_607224 ) ) ( not ( = ?auto_607219 ?auto_607225 ) ) ( not ( = ?auto_607219 ?auto_607226 ) ) ( not ( = ?auto_607219 ?auto_607227 ) ) ( not ( = ?auto_607219 ?auto_607228 ) ) ( not ( = ?auto_607219 ?auto_607229 ) ) ( not ( = ?auto_607219 ?auto_607230 ) ) ( not ( = ?auto_607220 ?auto_607221 ) ) ( not ( = ?auto_607220 ?auto_607222 ) ) ( not ( = ?auto_607220 ?auto_607223 ) ) ( not ( = ?auto_607220 ?auto_607224 ) ) ( not ( = ?auto_607220 ?auto_607225 ) ) ( not ( = ?auto_607220 ?auto_607226 ) ) ( not ( = ?auto_607220 ?auto_607227 ) ) ( not ( = ?auto_607220 ?auto_607228 ) ) ( not ( = ?auto_607220 ?auto_607229 ) ) ( not ( = ?auto_607220 ?auto_607230 ) ) ( not ( = ?auto_607221 ?auto_607222 ) ) ( not ( = ?auto_607221 ?auto_607223 ) ) ( not ( = ?auto_607221 ?auto_607224 ) ) ( not ( = ?auto_607221 ?auto_607225 ) ) ( not ( = ?auto_607221 ?auto_607226 ) ) ( not ( = ?auto_607221 ?auto_607227 ) ) ( not ( = ?auto_607221 ?auto_607228 ) ) ( not ( = ?auto_607221 ?auto_607229 ) ) ( not ( = ?auto_607221 ?auto_607230 ) ) ( not ( = ?auto_607222 ?auto_607223 ) ) ( not ( = ?auto_607222 ?auto_607224 ) ) ( not ( = ?auto_607222 ?auto_607225 ) ) ( not ( = ?auto_607222 ?auto_607226 ) ) ( not ( = ?auto_607222 ?auto_607227 ) ) ( not ( = ?auto_607222 ?auto_607228 ) ) ( not ( = ?auto_607222 ?auto_607229 ) ) ( not ( = ?auto_607222 ?auto_607230 ) ) ( not ( = ?auto_607223 ?auto_607224 ) ) ( not ( = ?auto_607223 ?auto_607225 ) ) ( not ( = ?auto_607223 ?auto_607226 ) ) ( not ( = ?auto_607223 ?auto_607227 ) ) ( not ( = ?auto_607223 ?auto_607228 ) ) ( not ( = ?auto_607223 ?auto_607229 ) ) ( not ( = ?auto_607223 ?auto_607230 ) ) ( not ( = ?auto_607224 ?auto_607225 ) ) ( not ( = ?auto_607224 ?auto_607226 ) ) ( not ( = ?auto_607224 ?auto_607227 ) ) ( not ( = ?auto_607224 ?auto_607228 ) ) ( not ( = ?auto_607224 ?auto_607229 ) ) ( not ( = ?auto_607224 ?auto_607230 ) ) ( not ( = ?auto_607225 ?auto_607226 ) ) ( not ( = ?auto_607225 ?auto_607227 ) ) ( not ( = ?auto_607225 ?auto_607228 ) ) ( not ( = ?auto_607225 ?auto_607229 ) ) ( not ( = ?auto_607225 ?auto_607230 ) ) ( not ( = ?auto_607226 ?auto_607227 ) ) ( not ( = ?auto_607226 ?auto_607228 ) ) ( not ( = ?auto_607226 ?auto_607229 ) ) ( not ( = ?auto_607226 ?auto_607230 ) ) ( not ( = ?auto_607227 ?auto_607228 ) ) ( not ( = ?auto_607227 ?auto_607229 ) ) ( not ( = ?auto_607227 ?auto_607230 ) ) ( not ( = ?auto_607228 ?auto_607229 ) ) ( not ( = ?auto_607228 ?auto_607230 ) ) ( not ( = ?auto_607229 ?auto_607230 ) ) ( ON ?auto_607228 ?auto_607229 ) ( ON ?auto_607227 ?auto_607228 ) ( ON ?auto_607226 ?auto_607227 ) ( ON ?auto_607225 ?auto_607226 ) ( CLEAR ?auto_607223 ) ( ON ?auto_607224 ?auto_607225 ) ( CLEAR ?auto_607224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_607219 ?auto_607220 ?auto_607221 ?auto_607222 ?auto_607223 ?auto_607224 )
      ( MAKE-11PILE ?auto_607219 ?auto_607220 ?auto_607221 ?auto_607222 ?auto_607223 ?auto_607224 ?auto_607225 ?auto_607226 ?auto_607227 ?auto_607228 ?auto_607229 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_607265 - BLOCK
      ?auto_607266 - BLOCK
      ?auto_607267 - BLOCK
      ?auto_607268 - BLOCK
      ?auto_607269 - BLOCK
      ?auto_607270 - BLOCK
      ?auto_607271 - BLOCK
      ?auto_607272 - BLOCK
      ?auto_607273 - BLOCK
      ?auto_607274 - BLOCK
      ?auto_607275 - BLOCK
    )
    :vars
    (
      ?auto_607276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607275 ?auto_607276 ) ( ON-TABLE ?auto_607265 ) ( ON ?auto_607266 ?auto_607265 ) ( ON ?auto_607267 ?auto_607266 ) ( ON ?auto_607268 ?auto_607267 ) ( not ( = ?auto_607265 ?auto_607266 ) ) ( not ( = ?auto_607265 ?auto_607267 ) ) ( not ( = ?auto_607265 ?auto_607268 ) ) ( not ( = ?auto_607265 ?auto_607269 ) ) ( not ( = ?auto_607265 ?auto_607270 ) ) ( not ( = ?auto_607265 ?auto_607271 ) ) ( not ( = ?auto_607265 ?auto_607272 ) ) ( not ( = ?auto_607265 ?auto_607273 ) ) ( not ( = ?auto_607265 ?auto_607274 ) ) ( not ( = ?auto_607265 ?auto_607275 ) ) ( not ( = ?auto_607265 ?auto_607276 ) ) ( not ( = ?auto_607266 ?auto_607267 ) ) ( not ( = ?auto_607266 ?auto_607268 ) ) ( not ( = ?auto_607266 ?auto_607269 ) ) ( not ( = ?auto_607266 ?auto_607270 ) ) ( not ( = ?auto_607266 ?auto_607271 ) ) ( not ( = ?auto_607266 ?auto_607272 ) ) ( not ( = ?auto_607266 ?auto_607273 ) ) ( not ( = ?auto_607266 ?auto_607274 ) ) ( not ( = ?auto_607266 ?auto_607275 ) ) ( not ( = ?auto_607266 ?auto_607276 ) ) ( not ( = ?auto_607267 ?auto_607268 ) ) ( not ( = ?auto_607267 ?auto_607269 ) ) ( not ( = ?auto_607267 ?auto_607270 ) ) ( not ( = ?auto_607267 ?auto_607271 ) ) ( not ( = ?auto_607267 ?auto_607272 ) ) ( not ( = ?auto_607267 ?auto_607273 ) ) ( not ( = ?auto_607267 ?auto_607274 ) ) ( not ( = ?auto_607267 ?auto_607275 ) ) ( not ( = ?auto_607267 ?auto_607276 ) ) ( not ( = ?auto_607268 ?auto_607269 ) ) ( not ( = ?auto_607268 ?auto_607270 ) ) ( not ( = ?auto_607268 ?auto_607271 ) ) ( not ( = ?auto_607268 ?auto_607272 ) ) ( not ( = ?auto_607268 ?auto_607273 ) ) ( not ( = ?auto_607268 ?auto_607274 ) ) ( not ( = ?auto_607268 ?auto_607275 ) ) ( not ( = ?auto_607268 ?auto_607276 ) ) ( not ( = ?auto_607269 ?auto_607270 ) ) ( not ( = ?auto_607269 ?auto_607271 ) ) ( not ( = ?auto_607269 ?auto_607272 ) ) ( not ( = ?auto_607269 ?auto_607273 ) ) ( not ( = ?auto_607269 ?auto_607274 ) ) ( not ( = ?auto_607269 ?auto_607275 ) ) ( not ( = ?auto_607269 ?auto_607276 ) ) ( not ( = ?auto_607270 ?auto_607271 ) ) ( not ( = ?auto_607270 ?auto_607272 ) ) ( not ( = ?auto_607270 ?auto_607273 ) ) ( not ( = ?auto_607270 ?auto_607274 ) ) ( not ( = ?auto_607270 ?auto_607275 ) ) ( not ( = ?auto_607270 ?auto_607276 ) ) ( not ( = ?auto_607271 ?auto_607272 ) ) ( not ( = ?auto_607271 ?auto_607273 ) ) ( not ( = ?auto_607271 ?auto_607274 ) ) ( not ( = ?auto_607271 ?auto_607275 ) ) ( not ( = ?auto_607271 ?auto_607276 ) ) ( not ( = ?auto_607272 ?auto_607273 ) ) ( not ( = ?auto_607272 ?auto_607274 ) ) ( not ( = ?auto_607272 ?auto_607275 ) ) ( not ( = ?auto_607272 ?auto_607276 ) ) ( not ( = ?auto_607273 ?auto_607274 ) ) ( not ( = ?auto_607273 ?auto_607275 ) ) ( not ( = ?auto_607273 ?auto_607276 ) ) ( not ( = ?auto_607274 ?auto_607275 ) ) ( not ( = ?auto_607274 ?auto_607276 ) ) ( not ( = ?auto_607275 ?auto_607276 ) ) ( ON ?auto_607274 ?auto_607275 ) ( ON ?auto_607273 ?auto_607274 ) ( ON ?auto_607272 ?auto_607273 ) ( ON ?auto_607271 ?auto_607272 ) ( ON ?auto_607270 ?auto_607271 ) ( CLEAR ?auto_607268 ) ( ON ?auto_607269 ?auto_607270 ) ( CLEAR ?auto_607269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_607265 ?auto_607266 ?auto_607267 ?auto_607268 ?auto_607269 )
      ( MAKE-11PILE ?auto_607265 ?auto_607266 ?auto_607267 ?auto_607268 ?auto_607269 ?auto_607270 ?auto_607271 ?auto_607272 ?auto_607273 ?auto_607274 ?auto_607275 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_607311 - BLOCK
      ?auto_607312 - BLOCK
      ?auto_607313 - BLOCK
      ?auto_607314 - BLOCK
      ?auto_607315 - BLOCK
      ?auto_607316 - BLOCK
      ?auto_607317 - BLOCK
      ?auto_607318 - BLOCK
      ?auto_607319 - BLOCK
      ?auto_607320 - BLOCK
      ?auto_607321 - BLOCK
    )
    :vars
    (
      ?auto_607322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607321 ?auto_607322 ) ( ON-TABLE ?auto_607311 ) ( ON ?auto_607312 ?auto_607311 ) ( ON ?auto_607313 ?auto_607312 ) ( not ( = ?auto_607311 ?auto_607312 ) ) ( not ( = ?auto_607311 ?auto_607313 ) ) ( not ( = ?auto_607311 ?auto_607314 ) ) ( not ( = ?auto_607311 ?auto_607315 ) ) ( not ( = ?auto_607311 ?auto_607316 ) ) ( not ( = ?auto_607311 ?auto_607317 ) ) ( not ( = ?auto_607311 ?auto_607318 ) ) ( not ( = ?auto_607311 ?auto_607319 ) ) ( not ( = ?auto_607311 ?auto_607320 ) ) ( not ( = ?auto_607311 ?auto_607321 ) ) ( not ( = ?auto_607311 ?auto_607322 ) ) ( not ( = ?auto_607312 ?auto_607313 ) ) ( not ( = ?auto_607312 ?auto_607314 ) ) ( not ( = ?auto_607312 ?auto_607315 ) ) ( not ( = ?auto_607312 ?auto_607316 ) ) ( not ( = ?auto_607312 ?auto_607317 ) ) ( not ( = ?auto_607312 ?auto_607318 ) ) ( not ( = ?auto_607312 ?auto_607319 ) ) ( not ( = ?auto_607312 ?auto_607320 ) ) ( not ( = ?auto_607312 ?auto_607321 ) ) ( not ( = ?auto_607312 ?auto_607322 ) ) ( not ( = ?auto_607313 ?auto_607314 ) ) ( not ( = ?auto_607313 ?auto_607315 ) ) ( not ( = ?auto_607313 ?auto_607316 ) ) ( not ( = ?auto_607313 ?auto_607317 ) ) ( not ( = ?auto_607313 ?auto_607318 ) ) ( not ( = ?auto_607313 ?auto_607319 ) ) ( not ( = ?auto_607313 ?auto_607320 ) ) ( not ( = ?auto_607313 ?auto_607321 ) ) ( not ( = ?auto_607313 ?auto_607322 ) ) ( not ( = ?auto_607314 ?auto_607315 ) ) ( not ( = ?auto_607314 ?auto_607316 ) ) ( not ( = ?auto_607314 ?auto_607317 ) ) ( not ( = ?auto_607314 ?auto_607318 ) ) ( not ( = ?auto_607314 ?auto_607319 ) ) ( not ( = ?auto_607314 ?auto_607320 ) ) ( not ( = ?auto_607314 ?auto_607321 ) ) ( not ( = ?auto_607314 ?auto_607322 ) ) ( not ( = ?auto_607315 ?auto_607316 ) ) ( not ( = ?auto_607315 ?auto_607317 ) ) ( not ( = ?auto_607315 ?auto_607318 ) ) ( not ( = ?auto_607315 ?auto_607319 ) ) ( not ( = ?auto_607315 ?auto_607320 ) ) ( not ( = ?auto_607315 ?auto_607321 ) ) ( not ( = ?auto_607315 ?auto_607322 ) ) ( not ( = ?auto_607316 ?auto_607317 ) ) ( not ( = ?auto_607316 ?auto_607318 ) ) ( not ( = ?auto_607316 ?auto_607319 ) ) ( not ( = ?auto_607316 ?auto_607320 ) ) ( not ( = ?auto_607316 ?auto_607321 ) ) ( not ( = ?auto_607316 ?auto_607322 ) ) ( not ( = ?auto_607317 ?auto_607318 ) ) ( not ( = ?auto_607317 ?auto_607319 ) ) ( not ( = ?auto_607317 ?auto_607320 ) ) ( not ( = ?auto_607317 ?auto_607321 ) ) ( not ( = ?auto_607317 ?auto_607322 ) ) ( not ( = ?auto_607318 ?auto_607319 ) ) ( not ( = ?auto_607318 ?auto_607320 ) ) ( not ( = ?auto_607318 ?auto_607321 ) ) ( not ( = ?auto_607318 ?auto_607322 ) ) ( not ( = ?auto_607319 ?auto_607320 ) ) ( not ( = ?auto_607319 ?auto_607321 ) ) ( not ( = ?auto_607319 ?auto_607322 ) ) ( not ( = ?auto_607320 ?auto_607321 ) ) ( not ( = ?auto_607320 ?auto_607322 ) ) ( not ( = ?auto_607321 ?auto_607322 ) ) ( ON ?auto_607320 ?auto_607321 ) ( ON ?auto_607319 ?auto_607320 ) ( ON ?auto_607318 ?auto_607319 ) ( ON ?auto_607317 ?auto_607318 ) ( ON ?auto_607316 ?auto_607317 ) ( ON ?auto_607315 ?auto_607316 ) ( CLEAR ?auto_607313 ) ( ON ?auto_607314 ?auto_607315 ) ( CLEAR ?auto_607314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_607311 ?auto_607312 ?auto_607313 ?auto_607314 )
      ( MAKE-11PILE ?auto_607311 ?auto_607312 ?auto_607313 ?auto_607314 ?auto_607315 ?auto_607316 ?auto_607317 ?auto_607318 ?auto_607319 ?auto_607320 ?auto_607321 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_607357 - BLOCK
      ?auto_607358 - BLOCK
      ?auto_607359 - BLOCK
      ?auto_607360 - BLOCK
      ?auto_607361 - BLOCK
      ?auto_607362 - BLOCK
      ?auto_607363 - BLOCK
      ?auto_607364 - BLOCK
      ?auto_607365 - BLOCK
      ?auto_607366 - BLOCK
      ?auto_607367 - BLOCK
    )
    :vars
    (
      ?auto_607368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607367 ?auto_607368 ) ( ON-TABLE ?auto_607357 ) ( ON ?auto_607358 ?auto_607357 ) ( not ( = ?auto_607357 ?auto_607358 ) ) ( not ( = ?auto_607357 ?auto_607359 ) ) ( not ( = ?auto_607357 ?auto_607360 ) ) ( not ( = ?auto_607357 ?auto_607361 ) ) ( not ( = ?auto_607357 ?auto_607362 ) ) ( not ( = ?auto_607357 ?auto_607363 ) ) ( not ( = ?auto_607357 ?auto_607364 ) ) ( not ( = ?auto_607357 ?auto_607365 ) ) ( not ( = ?auto_607357 ?auto_607366 ) ) ( not ( = ?auto_607357 ?auto_607367 ) ) ( not ( = ?auto_607357 ?auto_607368 ) ) ( not ( = ?auto_607358 ?auto_607359 ) ) ( not ( = ?auto_607358 ?auto_607360 ) ) ( not ( = ?auto_607358 ?auto_607361 ) ) ( not ( = ?auto_607358 ?auto_607362 ) ) ( not ( = ?auto_607358 ?auto_607363 ) ) ( not ( = ?auto_607358 ?auto_607364 ) ) ( not ( = ?auto_607358 ?auto_607365 ) ) ( not ( = ?auto_607358 ?auto_607366 ) ) ( not ( = ?auto_607358 ?auto_607367 ) ) ( not ( = ?auto_607358 ?auto_607368 ) ) ( not ( = ?auto_607359 ?auto_607360 ) ) ( not ( = ?auto_607359 ?auto_607361 ) ) ( not ( = ?auto_607359 ?auto_607362 ) ) ( not ( = ?auto_607359 ?auto_607363 ) ) ( not ( = ?auto_607359 ?auto_607364 ) ) ( not ( = ?auto_607359 ?auto_607365 ) ) ( not ( = ?auto_607359 ?auto_607366 ) ) ( not ( = ?auto_607359 ?auto_607367 ) ) ( not ( = ?auto_607359 ?auto_607368 ) ) ( not ( = ?auto_607360 ?auto_607361 ) ) ( not ( = ?auto_607360 ?auto_607362 ) ) ( not ( = ?auto_607360 ?auto_607363 ) ) ( not ( = ?auto_607360 ?auto_607364 ) ) ( not ( = ?auto_607360 ?auto_607365 ) ) ( not ( = ?auto_607360 ?auto_607366 ) ) ( not ( = ?auto_607360 ?auto_607367 ) ) ( not ( = ?auto_607360 ?auto_607368 ) ) ( not ( = ?auto_607361 ?auto_607362 ) ) ( not ( = ?auto_607361 ?auto_607363 ) ) ( not ( = ?auto_607361 ?auto_607364 ) ) ( not ( = ?auto_607361 ?auto_607365 ) ) ( not ( = ?auto_607361 ?auto_607366 ) ) ( not ( = ?auto_607361 ?auto_607367 ) ) ( not ( = ?auto_607361 ?auto_607368 ) ) ( not ( = ?auto_607362 ?auto_607363 ) ) ( not ( = ?auto_607362 ?auto_607364 ) ) ( not ( = ?auto_607362 ?auto_607365 ) ) ( not ( = ?auto_607362 ?auto_607366 ) ) ( not ( = ?auto_607362 ?auto_607367 ) ) ( not ( = ?auto_607362 ?auto_607368 ) ) ( not ( = ?auto_607363 ?auto_607364 ) ) ( not ( = ?auto_607363 ?auto_607365 ) ) ( not ( = ?auto_607363 ?auto_607366 ) ) ( not ( = ?auto_607363 ?auto_607367 ) ) ( not ( = ?auto_607363 ?auto_607368 ) ) ( not ( = ?auto_607364 ?auto_607365 ) ) ( not ( = ?auto_607364 ?auto_607366 ) ) ( not ( = ?auto_607364 ?auto_607367 ) ) ( not ( = ?auto_607364 ?auto_607368 ) ) ( not ( = ?auto_607365 ?auto_607366 ) ) ( not ( = ?auto_607365 ?auto_607367 ) ) ( not ( = ?auto_607365 ?auto_607368 ) ) ( not ( = ?auto_607366 ?auto_607367 ) ) ( not ( = ?auto_607366 ?auto_607368 ) ) ( not ( = ?auto_607367 ?auto_607368 ) ) ( ON ?auto_607366 ?auto_607367 ) ( ON ?auto_607365 ?auto_607366 ) ( ON ?auto_607364 ?auto_607365 ) ( ON ?auto_607363 ?auto_607364 ) ( ON ?auto_607362 ?auto_607363 ) ( ON ?auto_607361 ?auto_607362 ) ( ON ?auto_607360 ?auto_607361 ) ( CLEAR ?auto_607358 ) ( ON ?auto_607359 ?auto_607360 ) ( CLEAR ?auto_607359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_607357 ?auto_607358 ?auto_607359 )
      ( MAKE-11PILE ?auto_607357 ?auto_607358 ?auto_607359 ?auto_607360 ?auto_607361 ?auto_607362 ?auto_607363 ?auto_607364 ?auto_607365 ?auto_607366 ?auto_607367 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_607403 - BLOCK
      ?auto_607404 - BLOCK
      ?auto_607405 - BLOCK
      ?auto_607406 - BLOCK
      ?auto_607407 - BLOCK
      ?auto_607408 - BLOCK
      ?auto_607409 - BLOCK
      ?auto_607410 - BLOCK
      ?auto_607411 - BLOCK
      ?auto_607412 - BLOCK
      ?auto_607413 - BLOCK
    )
    :vars
    (
      ?auto_607414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607413 ?auto_607414 ) ( ON-TABLE ?auto_607403 ) ( not ( = ?auto_607403 ?auto_607404 ) ) ( not ( = ?auto_607403 ?auto_607405 ) ) ( not ( = ?auto_607403 ?auto_607406 ) ) ( not ( = ?auto_607403 ?auto_607407 ) ) ( not ( = ?auto_607403 ?auto_607408 ) ) ( not ( = ?auto_607403 ?auto_607409 ) ) ( not ( = ?auto_607403 ?auto_607410 ) ) ( not ( = ?auto_607403 ?auto_607411 ) ) ( not ( = ?auto_607403 ?auto_607412 ) ) ( not ( = ?auto_607403 ?auto_607413 ) ) ( not ( = ?auto_607403 ?auto_607414 ) ) ( not ( = ?auto_607404 ?auto_607405 ) ) ( not ( = ?auto_607404 ?auto_607406 ) ) ( not ( = ?auto_607404 ?auto_607407 ) ) ( not ( = ?auto_607404 ?auto_607408 ) ) ( not ( = ?auto_607404 ?auto_607409 ) ) ( not ( = ?auto_607404 ?auto_607410 ) ) ( not ( = ?auto_607404 ?auto_607411 ) ) ( not ( = ?auto_607404 ?auto_607412 ) ) ( not ( = ?auto_607404 ?auto_607413 ) ) ( not ( = ?auto_607404 ?auto_607414 ) ) ( not ( = ?auto_607405 ?auto_607406 ) ) ( not ( = ?auto_607405 ?auto_607407 ) ) ( not ( = ?auto_607405 ?auto_607408 ) ) ( not ( = ?auto_607405 ?auto_607409 ) ) ( not ( = ?auto_607405 ?auto_607410 ) ) ( not ( = ?auto_607405 ?auto_607411 ) ) ( not ( = ?auto_607405 ?auto_607412 ) ) ( not ( = ?auto_607405 ?auto_607413 ) ) ( not ( = ?auto_607405 ?auto_607414 ) ) ( not ( = ?auto_607406 ?auto_607407 ) ) ( not ( = ?auto_607406 ?auto_607408 ) ) ( not ( = ?auto_607406 ?auto_607409 ) ) ( not ( = ?auto_607406 ?auto_607410 ) ) ( not ( = ?auto_607406 ?auto_607411 ) ) ( not ( = ?auto_607406 ?auto_607412 ) ) ( not ( = ?auto_607406 ?auto_607413 ) ) ( not ( = ?auto_607406 ?auto_607414 ) ) ( not ( = ?auto_607407 ?auto_607408 ) ) ( not ( = ?auto_607407 ?auto_607409 ) ) ( not ( = ?auto_607407 ?auto_607410 ) ) ( not ( = ?auto_607407 ?auto_607411 ) ) ( not ( = ?auto_607407 ?auto_607412 ) ) ( not ( = ?auto_607407 ?auto_607413 ) ) ( not ( = ?auto_607407 ?auto_607414 ) ) ( not ( = ?auto_607408 ?auto_607409 ) ) ( not ( = ?auto_607408 ?auto_607410 ) ) ( not ( = ?auto_607408 ?auto_607411 ) ) ( not ( = ?auto_607408 ?auto_607412 ) ) ( not ( = ?auto_607408 ?auto_607413 ) ) ( not ( = ?auto_607408 ?auto_607414 ) ) ( not ( = ?auto_607409 ?auto_607410 ) ) ( not ( = ?auto_607409 ?auto_607411 ) ) ( not ( = ?auto_607409 ?auto_607412 ) ) ( not ( = ?auto_607409 ?auto_607413 ) ) ( not ( = ?auto_607409 ?auto_607414 ) ) ( not ( = ?auto_607410 ?auto_607411 ) ) ( not ( = ?auto_607410 ?auto_607412 ) ) ( not ( = ?auto_607410 ?auto_607413 ) ) ( not ( = ?auto_607410 ?auto_607414 ) ) ( not ( = ?auto_607411 ?auto_607412 ) ) ( not ( = ?auto_607411 ?auto_607413 ) ) ( not ( = ?auto_607411 ?auto_607414 ) ) ( not ( = ?auto_607412 ?auto_607413 ) ) ( not ( = ?auto_607412 ?auto_607414 ) ) ( not ( = ?auto_607413 ?auto_607414 ) ) ( ON ?auto_607412 ?auto_607413 ) ( ON ?auto_607411 ?auto_607412 ) ( ON ?auto_607410 ?auto_607411 ) ( ON ?auto_607409 ?auto_607410 ) ( ON ?auto_607408 ?auto_607409 ) ( ON ?auto_607407 ?auto_607408 ) ( ON ?auto_607406 ?auto_607407 ) ( ON ?auto_607405 ?auto_607406 ) ( CLEAR ?auto_607403 ) ( ON ?auto_607404 ?auto_607405 ) ( CLEAR ?auto_607404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_607403 ?auto_607404 )
      ( MAKE-11PILE ?auto_607403 ?auto_607404 ?auto_607405 ?auto_607406 ?auto_607407 ?auto_607408 ?auto_607409 ?auto_607410 ?auto_607411 ?auto_607412 ?auto_607413 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_607449 - BLOCK
      ?auto_607450 - BLOCK
      ?auto_607451 - BLOCK
      ?auto_607452 - BLOCK
      ?auto_607453 - BLOCK
      ?auto_607454 - BLOCK
      ?auto_607455 - BLOCK
      ?auto_607456 - BLOCK
      ?auto_607457 - BLOCK
      ?auto_607458 - BLOCK
      ?auto_607459 - BLOCK
    )
    :vars
    (
      ?auto_607460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607459 ?auto_607460 ) ( not ( = ?auto_607449 ?auto_607450 ) ) ( not ( = ?auto_607449 ?auto_607451 ) ) ( not ( = ?auto_607449 ?auto_607452 ) ) ( not ( = ?auto_607449 ?auto_607453 ) ) ( not ( = ?auto_607449 ?auto_607454 ) ) ( not ( = ?auto_607449 ?auto_607455 ) ) ( not ( = ?auto_607449 ?auto_607456 ) ) ( not ( = ?auto_607449 ?auto_607457 ) ) ( not ( = ?auto_607449 ?auto_607458 ) ) ( not ( = ?auto_607449 ?auto_607459 ) ) ( not ( = ?auto_607449 ?auto_607460 ) ) ( not ( = ?auto_607450 ?auto_607451 ) ) ( not ( = ?auto_607450 ?auto_607452 ) ) ( not ( = ?auto_607450 ?auto_607453 ) ) ( not ( = ?auto_607450 ?auto_607454 ) ) ( not ( = ?auto_607450 ?auto_607455 ) ) ( not ( = ?auto_607450 ?auto_607456 ) ) ( not ( = ?auto_607450 ?auto_607457 ) ) ( not ( = ?auto_607450 ?auto_607458 ) ) ( not ( = ?auto_607450 ?auto_607459 ) ) ( not ( = ?auto_607450 ?auto_607460 ) ) ( not ( = ?auto_607451 ?auto_607452 ) ) ( not ( = ?auto_607451 ?auto_607453 ) ) ( not ( = ?auto_607451 ?auto_607454 ) ) ( not ( = ?auto_607451 ?auto_607455 ) ) ( not ( = ?auto_607451 ?auto_607456 ) ) ( not ( = ?auto_607451 ?auto_607457 ) ) ( not ( = ?auto_607451 ?auto_607458 ) ) ( not ( = ?auto_607451 ?auto_607459 ) ) ( not ( = ?auto_607451 ?auto_607460 ) ) ( not ( = ?auto_607452 ?auto_607453 ) ) ( not ( = ?auto_607452 ?auto_607454 ) ) ( not ( = ?auto_607452 ?auto_607455 ) ) ( not ( = ?auto_607452 ?auto_607456 ) ) ( not ( = ?auto_607452 ?auto_607457 ) ) ( not ( = ?auto_607452 ?auto_607458 ) ) ( not ( = ?auto_607452 ?auto_607459 ) ) ( not ( = ?auto_607452 ?auto_607460 ) ) ( not ( = ?auto_607453 ?auto_607454 ) ) ( not ( = ?auto_607453 ?auto_607455 ) ) ( not ( = ?auto_607453 ?auto_607456 ) ) ( not ( = ?auto_607453 ?auto_607457 ) ) ( not ( = ?auto_607453 ?auto_607458 ) ) ( not ( = ?auto_607453 ?auto_607459 ) ) ( not ( = ?auto_607453 ?auto_607460 ) ) ( not ( = ?auto_607454 ?auto_607455 ) ) ( not ( = ?auto_607454 ?auto_607456 ) ) ( not ( = ?auto_607454 ?auto_607457 ) ) ( not ( = ?auto_607454 ?auto_607458 ) ) ( not ( = ?auto_607454 ?auto_607459 ) ) ( not ( = ?auto_607454 ?auto_607460 ) ) ( not ( = ?auto_607455 ?auto_607456 ) ) ( not ( = ?auto_607455 ?auto_607457 ) ) ( not ( = ?auto_607455 ?auto_607458 ) ) ( not ( = ?auto_607455 ?auto_607459 ) ) ( not ( = ?auto_607455 ?auto_607460 ) ) ( not ( = ?auto_607456 ?auto_607457 ) ) ( not ( = ?auto_607456 ?auto_607458 ) ) ( not ( = ?auto_607456 ?auto_607459 ) ) ( not ( = ?auto_607456 ?auto_607460 ) ) ( not ( = ?auto_607457 ?auto_607458 ) ) ( not ( = ?auto_607457 ?auto_607459 ) ) ( not ( = ?auto_607457 ?auto_607460 ) ) ( not ( = ?auto_607458 ?auto_607459 ) ) ( not ( = ?auto_607458 ?auto_607460 ) ) ( not ( = ?auto_607459 ?auto_607460 ) ) ( ON ?auto_607458 ?auto_607459 ) ( ON ?auto_607457 ?auto_607458 ) ( ON ?auto_607456 ?auto_607457 ) ( ON ?auto_607455 ?auto_607456 ) ( ON ?auto_607454 ?auto_607455 ) ( ON ?auto_607453 ?auto_607454 ) ( ON ?auto_607452 ?auto_607453 ) ( ON ?auto_607451 ?auto_607452 ) ( ON ?auto_607450 ?auto_607451 ) ( ON ?auto_607449 ?auto_607450 ) ( CLEAR ?auto_607449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_607449 )
      ( MAKE-11PILE ?auto_607449 ?auto_607450 ?auto_607451 ?auto_607452 ?auto_607453 ?auto_607454 ?auto_607455 ?auto_607456 ?auto_607457 ?auto_607458 ?auto_607459 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607496 - BLOCK
      ?auto_607497 - BLOCK
      ?auto_607498 - BLOCK
      ?auto_607499 - BLOCK
      ?auto_607500 - BLOCK
      ?auto_607501 - BLOCK
      ?auto_607502 - BLOCK
      ?auto_607503 - BLOCK
      ?auto_607504 - BLOCK
      ?auto_607505 - BLOCK
      ?auto_607506 - BLOCK
      ?auto_607507 - BLOCK
    )
    :vars
    (
      ?auto_607508 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_607506 ) ( ON ?auto_607507 ?auto_607508 ) ( CLEAR ?auto_607507 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_607496 ) ( ON ?auto_607497 ?auto_607496 ) ( ON ?auto_607498 ?auto_607497 ) ( ON ?auto_607499 ?auto_607498 ) ( ON ?auto_607500 ?auto_607499 ) ( ON ?auto_607501 ?auto_607500 ) ( ON ?auto_607502 ?auto_607501 ) ( ON ?auto_607503 ?auto_607502 ) ( ON ?auto_607504 ?auto_607503 ) ( ON ?auto_607505 ?auto_607504 ) ( ON ?auto_607506 ?auto_607505 ) ( not ( = ?auto_607496 ?auto_607497 ) ) ( not ( = ?auto_607496 ?auto_607498 ) ) ( not ( = ?auto_607496 ?auto_607499 ) ) ( not ( = ?auto_607496 ?auto_607500 ) ) ( not ( = ?auto_607496 ?auto_607501 ) ) ( not ( = ?auto_607496 ?auto_607502 ) ) ( not ( = ?auto_607496 ?auto_607503 ) ) ( not ( = ?auto_607496 ?auto_607504 ) ) ( not ( = ?auto_607496 ?auto_607505 ) ) ( not ( = ?auto_607496 ?auto_607506 ) ) ( not ( = ?auto_607496 ?auto_607507 ) ) ( not ( = ?auto_607496 ?auto_607508 ) ) ( not ( = ?auto_607497 ?auto_607498 ) ) ( not ( = ?auto_607497 ?auto_607499 ) ) ( not ( = ?auto_607497 ?auto_607500 ) ) ( not ( = ?auto_607497 ?auto_607501 ) ) ( not ( = ?auto_607497 ?auto_607502 ) ) ( not ( = ?auto_607497 ?auto_607503 ) ) ( not ( = ?auto_607497 ?auto_607504 ) ) ( not ( = ?auto_607497 ?auto_607505 ) ) ( not ( = ?auto_607497 ?auto_607506 ) ) ( not ( = ?auto_607497 ?auto_607507 ) ) ( not ( = ?auto_607497 ?auto_607508 ) ) ( not ( = ?auto_607498 ?auto_607499 ) ) ( not ( = ?auto_607498 ?auto_607500 ) ) ( not ( = ?auto_607498 ?auto_607501 ) ) ( not ( = ?auto_607498 ?auto_607502 ) ) ( not ( = ?auto_607498 ?auto_607503 ) ) ( not ( = ?auto_607498 ?auto_607504 ) ) ( not ( = ?auto_607498 ?auto_607505 ) ) ( not ( = ?auto_607498 ?auto_607506 ) ) ( not ( = ?auto_607498 ?auto_607507 ) ) ( not ( = ?auto_607498 ?auto_607508 ) ) ( not ( = ?auto_607499 ?auto_607500 ) ) ( not ( = ?auto_607499 ?auto_607501 ) ) ( not ( = ?auto_607499 ?auto_607502 ) ) ( not ( = ?auto_607499 ?auto_607503 ) ) ( not ( = ?auto_607499 ?auto_607504 ) ) ( not ( = ?auto_607499 ?auto_607505 ) ) ( not ( = ?auto_607499 ?auto_607506 ) ) ( not ( = ?auto_607499 ?auto_607507 ) ) ( not ( = ?auto_607499 ?auto_607508 ) ) ( not ( = ?auto_607500 ?auto_607501 ) ) ( not ( = ?auto_607500 ?auto_607502 ) ) ( not ( = ?auto_607500 ?auto_607503 ) ) ( not ( = ?auto_607500 ?auto_607504 ) ) ( not ( = ?auto_607500 ?auto_607505 ) ) ( not ( = ?auto_607500 ?auto_607506 ) ) ( not ( = ?auto_607500 ?auto_607507 ) ) ( not ( = ?auto_607500 ?auto_607508 ) ) ( not ( = ?auto_607501 ?auto_607502 ) ) ( not ( = ?auto_607501 ?auto_607503 ) ) ( not ( = ?auto_607501 ?auto_607504 ) ) ( not ( = ?auto_607501 ?auto_607505 ) ) ( not ( = ?auto_607501 ?auto_607506 ) ) ( not ( = ?auto_607501 ?auto_607507 ) ) ( not ( = ?auto_607501 ?auto_607508 ) ) ( not ( = ?auto_607502 ?auto_607503 ) ) ( not ( = ?auto_607502 ?auto_607504 ) ) ( not ( = ?auto_607502 ?auto_607505 ) ) ( not ( = ?auto_607502 ?auto_607506 ) ) ( not ( = ?auto_607502 ?auto_607507 ) ) ( not ( = ?auto_607502 ?auto_607508 ) ) ( not ( = ?auto_607503 ?auto_607504 ) ) ( not ( = ?auto_607503 ?auto_607505 ) ) ( not ( = ?auto_607503 ?auto_607506 ) ) ( not ( = ?auto_607503 ?auto_607507 ) ) ( not ( = ?auto_607503 ?auto_607508 ) ) ( not ( = ?auto_607504 ?auto_607505 ) ) ( not ( = ?auto_607504 ?auto_607506 ) ) ( not ( = ?auto_607504 ?auto_607507 ) ) ( not ( = ?auto_607504 ?auto_607508 ) ) ( not ( = ?auto_607505 ?auto_607506 ) ) ( not ( = ?auto_607505 ?auto_607507 ) ) ( not ( = ?auto_607505 ?auto_607508 ) ) ( not ( = ?auto_607506 ?auto_607507 ) ) ( not ( = ?auto_607506 ?auto_607508 ) ) ( not ( = ?auto_607507 ?auto_607508 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_607507 ?auto_607508 )
      ( !STACK ?auto_607507 ?auto_607506 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607546 - BLOCK
      ?auto_607547 - BLOCK
      ?auto_607548 - BLOCK
      ?auto_607549 - BLOCK
      ?auto_607550 - BLOCK
      ?auto_607551 - BLOCK
      ?auto_607552 - BLOCK
      ?auto_607553 - BLOCK
      ?auto_607554 - BLOCK
      ?auto_607555 - BLOCK
      ?auto_607556 - BLOCK
      ?auto_607557 - BLOCK
    )
    :vars
    (
      ?auto_607558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607557 ?auto_607558 ) ( ON-TABLE ?auto_607546 ) ( ON ?auto_607547 ?auto_607546 ) ( ON ?auto_607548 ?auto_607547 ) ( ON ?auto_607549 ?auto_607548 ) ( ON ?auto_607550 ?auto_607549 ) ( ON ?auto_607551 ?auto_607550 ) ( ON ?auto_607552 ?auto_607551 ) ( ON ?auto_607553 ?auto_607552 ) ( ON ?auto_607554 ?auto_607553 ) ( ON ?auto_607555 ?auto_607554 ) ( not ( = ?auto_607546 ?auto_607547 ) ) ( not ( = ?auto_607546 ?auto_607548 ) ) ( not ( = ?auto_607546 ?auto_607549 ) ) ( not ( = ?auto_607546 ?auto_607550 ) ) ( not ( = ?auto_607546 ?auto_607551 ) ) ( not ( = ?auto_607546 ?auto_607552 ) ) ( not ( = ?auto_607546 ?auto_607553 ) ) ( not ( = ?auto_607546 ?auto_607554 ) ) ( not ( = ?auto_607546 ?auto_607555 ) ) ( not ( = ?auto_607546 ?auto_607556 ) ) ( not ( = ?auto_607546 ?auto_607557 ) ) ( not ( = ?auto_607546 ?auto_607558 ) ) ( not ( = ?auto_607547 ?auto_607548 ) ) ( not ( = ?auto_607547 ?auto_607549 ) ) ( not ( = ?auto_607547 ?auto_607550 ) ) ( not ( = ?auto_607547 ?auto_607551 ) ) ( not ( = ?auto_607547 ?auto_607552 ) ) ( not ( = ?auto_607547 ?auto_607553 ) ) ( not ( = ?auto_607547 ?auto_607554 ) ) ( not ( = ?auto_607547 ?auto_607555 ) ) ( not ( = ?auto_607547 ?auto_607556 ) ) ( not ( = ?auto_607547 ?auto_607557 ) ) ( not ( = ?auto_607547 ?auto_607558 ) ) ( not ( = ?auto_607548 ?auto_607549 ) ) ( not ( = ?auto_607548 ?auto_607550 ) ) ( not ( = ?auto_607548 ?auto_607551 ) ) ( not ( = ?auto_607548 ?auto_607552 ) ) ( not ( = ?auto_607548 ?auto_607553 ) ) ( not ( = ?auto_607548 ?auto_607554 ) ) ( not ( = ?auto_607548 ?auto_607555 ) ) ( not ( = ?auto_607548 ?auto_607556 ) ) ( not ( = ?auto_607548 ?auto_607557 ) ) ( not ( = ?auto_607548 ?auto_607558 ) ) ( not ( = ?auto_607549 ?auto_607550 ) ) ( not ( = ?auto_607549 ?auto_607551 ) ) ( not ( = ?auto_607549 ?auto_607552 ) ) ( not ( = ?auto_607549 ?auto_607553 ) ) ( not ( = ?auto_607549 ?auto_607554 ) ) ( not ( = ?auto_607549 ?auto_607555 ) ) ( not ( = ?auto_607549 ?auto_607556 ) ) ( not ( = ?auto_607549 ?auto_607557 ) ) ( not ( = ?auto_607549 ?auto_607558 ) ) ( not ( = ?auto_607550 ?auto_607551 ) ) ( not ( = ?auto_607550 ?auto_607552 ) ) ( not ( = ?auto_607550 ?auto_607553 ) ) ( not ( = ?auto_607550 ?auto_607554 ) ) ( not ( = ?auto_607550 ?auto_607555 ) ) ( not ( = ?auto_607550 ?auto_607556 ) ) ( not ( = ?auto_607550 ?auto_607557 ) ) ( not ( = ?auto_607550 ?auto_607558 ) ) ( not ( = ?auto_607551 ?auto_607552 ) ) ( not ( = ?auto_607551 ?auto_607553 ) ) ( not ( = ?auto_607551 ?auto_607554 ) ) ( not ( = ?auto_607551 ?auto_607555 ) ) ( not ( = ?auto_607551 ?auto_607556 ) ) ( not ( = ?auto_607551 ?auto_607557 ) ) ( not ( = ?auto_607551 ?auto_607558 ) ) ( not ( = ?auto_607552 ?auto_607553 ) ) ( not ( = ?auto_607552 ?auto_607554 ) ) ( not ( = ?auto_607552 ?auto_607555 ) ) ( not ( = ?auto_607552 ?auto_607556 ) ) ( not ( = ?auto_607552 ?auto_607557 ) ) ( not ( = ?auto_607552 ?auto_607558 ) ) ( not ( = ?auto_607553 ?auto_607554 ) ) ( not ( = ?auto_607553 ?auto_607555 ) ) ( not ( = ?auto_607553 ?auto_607556 ) ) ( not ( = ?auto_607553 ?auto_607557 ) ) ( not ( = ?auto_607553 ?auto_607558 ) ) ( not ( = ?auto_607554 ?auto_607555 ) ) ( not ( = ?auto_607554 ?auto_607556 ) ) ( not ( = ?auto_607554 ?auto_607557 ) ) ( not ( = ?auto_607554 ?auto_607558 ) ) ( not ( = ?auto_607555 ?auto_607556 ) ) ( not ( = ?auto_607555 ?auto_607557 ) ) ( not ( = ?auto_607555 ?auto_607558 ) ) ( not ( = ?auto_607556 ?auto_607557 ) ) ( not ( = ?auto_607556 ?auto_607558 ) ) ( not ( = ?auto_607557 ?auto_607558 ) ) ( CLEAR ?auto_607555 ) ( ON ?auto_607556 ?auto_607557 ) ( CLEAR ?auto_607556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_607546 ?auto_607547 ?auto_607548 ?auto_607549 ?auto_607550 ?auto_607551 ?auto_607552 ?auto_607553 ?auto_607554 ?auto_607555 ?auto_607556 )
      ( MAKE-12PILE ?auto_607546 ?auto_607547 ?auto_607548 ?auto_607549 ?auto_607550 ?auto_607551 ?auto_607552 ?auto_607553 ?auto_607554 ?auto_607555 ?auto_607556 ?auto_607557 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607596 - BLOCK
      ?auto_607597 - BLOCK
      ?auto_607598 - BLOCK
      ?auto_607599 - BLOCK
      ?auto_607600 - BLOCK
      ?auto_607601 - BLOCK
      ?auto_607602 - BLOCK
      ?auto_607603 - BLOCK
      ?auto_607604 - BLOCK
      ?auto_607605 - BLOCK
      ?auto_607606 - BLOCK
      ?auto_607607 - BLOCK
    )
    :vars
    (
      ?auto_607608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607607 ?auto_607608 ) ( ON-TABLE ?auto_607596 ) ( ON ?auto_607597 ?auto_607596 ) ( ON ?auto_607598 ?auto_607597 ) ( ON ?auto_607599 ?auto_607598 ) ( ON ?auto_607600 ?auto_607599 ) ( ON ?auto_607601 ?auto_607600 ) ( ON ?auto_607602 ?auto_607601 ) ( ON ?auto_607603 ?auto_607602 ) ( ON ?auto_607604 ?auto_607603 ) ( not ( = ?auto_607596 ?auto_607597 ) ) ( not ( = ?auto_607596 ?auto_607598 ) ) ( not ( = ?auto_607596 ?auto_607599 ) ) ( not ( = ?auto_607596 ?auto_607600 ) ) ( not ( = ?auto_607596 ?auto_607601 ) ) ( not ( = ?auto_607596 ?auto_607602 ) ) ( not ( = ?auto_607596 ?auto_607603 ) ) ( not ( = ?auto_607596 ?auto_607604 ) ) ( not ( = ?auto_607596 ?auto_607605 ) ) ( not ( = ?auto_607596 ?auto_607606 ) ) ( not ( = ?auto_607596 ?auto_607607 ) ) ( not ( = ?auto_607596 ?auto_607608 ) ) ( not ( = ?auto_607597 ?auto_607598 ) ) ( not ( = ?auto_607597 ?auto_607599 ) ) ( not ( = ?auto_607597 ?auto_607600 ) ) ( not ( = ?auto_607597 ?auto_607601 ) ) ( not ( = ?auto_607597 ?auto_607602 ) ) ( not ( = ?auto_607597 ?auto_607603 ) ) ( not ( = ?auto_607597 ?auto_607604 ) ) ( not ( = ?auto_607597 ?auto_607605 ) ) ( not ( = ?auto_607597 ?auto_607606 ) ) ( not ( = ?auto_607597 ?auto_607607 ) ) ( not ( = ?auto_607597 ?auto_607608 ) ) ( not ( = ?auto_607598 ?auto_607599 ) ) ( not ( = ?auto_607598 ?auto_607600 ) ) ( not ( = ?auto_607598 ?auto_607601 ) ) ( not ( = ?auto_607598 ?auto_607602 ) ) ( not ( = ?auto_607598 ?auto_607603 ) ) ( not ( = ?auto_607598 ?auto_607604 ) ) ( not ( = ?auto_607598 ?auto_607605 ) ) ( not ( = ?auto_607598 ?auto_607606 ) ) ( not ( = ?auto_607598 ?auto_607607 ) ) ( not ( = ?auto_607598 ?auto_607608 ) ) ( not ( = ?auto_607599 ?auto_607600 ) ) ( not ( = ?auto_607599 ?auto_607601 ) ) ( not ( = ?auto_607599 ?auto_607602 ) ) ( not ( = ?auto_607599 ?auto_607603 ) ) ( not ( = ?auto_607599 ?auto_607604 ) ) ( not ( = ?auto_607599 ?auto_607605 ) ) ( not ( = ?auto_607599 ?auto_607606 ) ) ( not ( = ?auto_607599 ?auto_607607 ) ) ( not ( = ?auto_607599 ?auto_607608 ) ) ( not ( = ?auto_607600 ?auto_607601 ) ) ( not ( = ?auto_607600 ?auto_607602 ) ) ( not ( = ?auto_607600 ?auto_607603 ) ) ( not ( = ?auto_607600 ?auto_607604 ) ) ( not ( = ?auto_607600 ?auto_607605 ) ) ( not ( = ?auto_607600 ?auto_607606 ) ) ( not ( = ?auto_607600 ?auto_607607 ) ) ( not ( = ?auto_607600 ?auto_607608 ) ) ( not ( = ?auto_607601 ?auto_607602 ) ) ( not ( = ?auto_607601 ?auto_607603 ) ) ( not ( = ?auto_607601 ?auto_607604 ) ) ( not ( = ?auto_607601 ?auto_607605 ) ) ( not ( = ?auto_607601 ?auto_607606 ) ) ( not ( = ?auto_607601 ?auto_607607 ) ) ( not ( = ?auto_607601 ?auto_607608 ) ) ( not ( = ?auto_607602 ?auto_607603 ) ) ( not ( = ?auto_607602 ?auto_607604 ) ) ( not ( = ?auto_607602 ?auto_607605 ) ) ( not ( = ?auto_607602 ?auto_607606 ) ) ( not ( = ?auto_607602 ?auto_607607 ) ) ( not ( = ?auto_607602 ?auto_607608 ) ) ( not ( = ?auto_607603 ?auto_607604 ) ) ( not ( = ?auto_607603 ?auto_607605 ) ) ( not ( = ?auto_607603 ?auto_607606 ) ) ( not ( = ?auto_607603 ?auto_607607 ) ) ( not ( = ?auto_607603 ?auto_607608 ) ) ( not ( = ?auto_607604 ?auto_607605 ) ) ( not ( = ?auto_607604 ?auto_607606 ) ) ( not ( = ?auto_607604 ?auto_607607 ) ) ( not ( = ?auto_607604 ?auto_607608 ) ) ( not ( = ?auto_607605 ?auto_607606 ) ) ( not ( = ?auto_607605 ?auto_607607 ) ) ( not ( = ?auto_607605 ?auto_607608 ) ) ( not ( = ?auto_607606 ?auto_607607 ) ) ( not ( = ?auto_607606 ?auto_607608 ) ) ( not ( = ?auto_607607 ?auto_607608 ) ) ( ON ?auto_607606 ?auto_607607 ) ( CLEAR ?auto_607604 ) ( ON ?auto_607605 ?auto_607606 ) ( CLEAR ?auto_607605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_607596 ?auto_607597 ?auto_607598 ?auto_607599 ?auto_607600 ?auto_607601 ?auto_607602 ?auto_607603 ?auto_607604 ?auto_607605 )
      ( MAKE-12PILE ?auto_607596 ?auto_607597 ?auto_607598 ?auto_607599 ?auto_607600 ?auto_607601 ?auto_607602 ?auto_607603 ?auto_607604 ?auto_607605 ?auto_607606 ?auto_607607 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607646 - BLOCK
      ?auto_607647 - BLOCK
      ?auto_607648 - BLOCK
      ?auto_607649 - BLOCK
      ?auto_607650 - BLOCK
      ?auto_607651 - BLOCK
      ?auto_607652 - BLOCK
      ?auto_607653 - BLOCK
      ?auto_607654 - BLOCK
      ?auto_607655 - BLOCK
      ?auto_607656 - BLOCK
      ?auto_607657 - BLOCK
    )
    :vars
    (
      ?auto_607658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607657 ?auto_607658 ) ( ON-TABLE ?auto_607646 ) ( ON ?auto_607647 ?auto_607646 ) ( ON ?auto_607648 ?auto_607647 ) ( ON ?auto_607649 ?auto_607648 ) ( ON ?auto_607650 ?auto_607649 ) ( ON ?auto_607651 ?auto_607650 ) ( ON ?auto_607652 ?auto_607651 ) ( ON ?auto_607653 ?auto_607652 ) ( not ( = ?auto_607646 ?auto_607647 ) ) ( not ( = ?auto_607646 ?auto_607648 ) ) ( not ( = ?auto_607646 ?auto_607649 ) ) ( not ( = ?auto_607646 ?auto_607650 ) ) ( not ( = ?auto_607646 ?auto_607651 ) ) ( not ( = ?auto_607646 ?auto_607652 ) ) ( not ( = ?auto_607646 ?auto_607653 ) ) ( not ( = ?auto_607646 ?auto_607654 ) ) ( not ( = ?auto_607646 ?auto_607655 ) ) ( not ( = ?auto_607646 ?auto_607656 ) ) ( not ( = ?auto_607646 ?auto_607657 ) ) ( not ( = ?auto_607646 ?auto_607658 ) ) ( not ( = ?auto_607647 ?auto_607648 ) ) ( not ( = ?auto_607647 ?auto_607649 ) ) ( not ( = ?auto_607647 ?auto_607650 ) ) ( not ( = ?auto_607647 ?auto_607651 ) ) ( not ( = ?auto_607647 ?auto_607652 ) ) ( not ( = ?auto_607647 ?auto_607653 ) ) ( not ( = ?auto_607647 ?auto_607654 ) ) ( not ( = ?auto_607647 ?auto_607655 ) ) ( not ( = ?auto_607647 ?auto_607656 ) ) ( not ( = ?auto_607647 ?auto_607657 ) ) ( not ( = ?auto_607647 ?auto_607658 ) ) ( not ( = ?auto_607648 ?auto_607649 ) ) ( not ( = ?auto_607648 ?auto_607650 ) ) ( not ( = ?auto_607648 ?auto_607651 ) ) ( not ( = ?auto_607648 ?auto_607652 ) ) ( not ( = ?auto_607648 ?auto_607653 ) ) ( not ( = ?auto_607648 ?auto_607654 ) ) ( not ( = ?auto_607648 ?auto_607655 ) ) ( not ( = ?auto_607648 ?auto_607656 ) ) ( not ( = ?auto_607648 ?auto_607657 ) ) ( not ( = ?auto_607648 ?auto_607658 ) ) ( not ( = ?auto_607649 ?auto_607650 ) ) ( not ( = ?auto_607649 ?auto_607651 ) ) ( not ( = ?auto_607649 ?auto_607652 ) ) ( not ( = ?auto_607649 ?auto_607653 ) ) ( not ( = ?auto_607649 ?auto_607654 ) ) ( not ( = ?auto_607649 ?auto_607655 ) ) ( not ( = ?auto_607649 ?auto_607656 ) ) ( not ( = ?auto_607649 ?auto_607657 ) ) ( not ( = ?auto_607649 ?auto_607658 ) ) ( not ( = ?auto_607650 ?auto_607651 ) ) ( not ( = ?auto_607650 ?auto_607652 ) ) ( not ( = ?auto_607650 ?auto_607653 ) ) ( not ( = ?auto_607650 ?auto_607654 ) ) ( not ( = ?auto_607650 ?auto_607655 ) ) ( not ( = ?auto_607650 ?auto_607656 ) ) ( not ( = ?auto_607650 ?auto_607657 ) ) ( not ( = ?auto_607650 ?auto_607658 ) ) ( not ( = ?auto_607651 ?auto_607652 ) ) ( not ( = ?auto_607651 ?auto_607653 ) ) ( not ( = ?auto_607651 ?auto_607654 ) ) ( not ( = ?auto_607651 ?auto_607655 ) ) ( not ( = ?auto_607651 ?auto_607656 ) ) ( not ( = ?auto_607651 ?auto_607657 ) ) ( not ( = ?auto_607651 ?auto_607658 ) ) ( not ( = ?auto_607652 ?auto_607653 ) ) ( not ( = ?auto_607652 ?auto_607654 ) ) ( not ( = ?auto_607652 ?auto_607655 ) ) ( not ( = ?auto_607652 ?auto_607656 ) ) ( not ( = ?auto_607652 ?auto_607657 ) ) ( not ( = ?auto_607652 ?auto_607658 ) ) ( not ( = ?auto_607653 ?auto_607654 ) ) ( not ( = ?auto_607653 ?auto_607655 ) ) ( not ( = ?auto_607653 ?auto_607656 ) ) ( not ( = ?auto_607653 ?auto_607657 ) ) ( not ( = ?auto_607653 ?auto_607658 ) ) ( not ( = ?auto_607654 ?auto_607655 ) ) ( not ( = ?auto_607654 ?auto_607656 ) ) ( not ( = ?auto_607654 ?auto_607657 ) ) ( not ( = ?auto_607654 ?auto_607658 ) ) ( not ( = ?auto_607655 ?auto_607656 ) ) ( not ( = ?auto_607655 ?auto_607657 ) ) ( not ( = ?auto_607655 ?auto_607658 ) ) ( not ( = ?auto_607656 ?auto_607657 ) ) ( not ( = ?auto_607656 ?auto_607658 ) ) ( not ( = ?auto_607657 ?auto_607658 ) ) ( ON ?auto_607656 ?auto_607657 ) ( ON ?auto_607655 ?auto_607656 ) ( CLEAR ?auto_607653 ) ( ON ?auto_607654 ?auto_607655 ) ( CLEAR ?auto_607654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_607646 ?auto_607647 ?auto_607648 ?auto_607649 ?auto_607650 ?auto_607651 ?auto_607652 ?auto_607653 ?auto_607654 )
      ( MAKE-12PILE ?auto_607646 ?auto_607647 ?auto_607648 ?auto_607649 ?auto_607650 ?auto_607651 ?auto_607652 ?auto_607653 ?auto_607654 ?auto_607655 ?auto_607656 ?auto_607657 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607696 - BLOCK
      ?auto_607697 - BLOCK
      ?auto_607698 - BLOCK
      ?auto_607699 - BLOCK
      ?auto_607700 - BLOCK
      ?auto_607701 - BLOCK
      ?auto_607702 - BLOCK
      ?auto_607703 - BLOCK
      ?auto_607704 - BLOCK
      ?auto_607705 - BLOCK
      ?auto_607706 - BLOCK
      ?auto_607707 - BLOCK
    )
    :vars
    (
      ?auto_607708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607707 ?auto_607708 ) ( ON-TABLE ?auto_607696 ) ( ON ?auto_607697 ?auto_607696 ) ( ON ?auto_607698 ?auto_607697 ) ( ON ?auto_607699 ?auto_607698 ) ( ON ?auto_607700 ?auto_607699 ) ( ON ?auto_607701 ?auto_607700 ) ( ON ?auto_607702 ?auto_607701 ) ( not ( = ?auto_607696 ?auto_607697 ) ) ( not ( = ?auto_607696 ?auto_607698 ) ) ( not ( = ?auto_607696 ?auto_607699 ) ) ( not ( = ?auto_607696 ?auto_607700 ) ) ( not ( = ?auto_607696 ?auto_607701 ) ) ( not ( = ?auto_607696 ?auto_607702 ) ) ( not ( = ?auto_607696 ?auto_607703 ) ) ( not ( = ?auto_607696 ?auto_607704 ) ) ( not ( = ?auto_607696 ?auto_607705 ) ) ( not ( = ?auto_607696 ?auto_607706 ) ) ( not ( = ?auto_607696 ?auto_607707 ) ) ( not ( = ?auto_607696 ?auto_607708 ) ) ( not ( = ?auto_607697 ?auto_607698 ) ) ( not ( = ?auto_607697 ?auto_607699 ) ) ( not ( = ?auto_607697 ?auto_607700 ) ) ( not ( = ?auto_607697 ?auto_607701 ) ) ( not ( = ?auto_607697 ?auto_607702 ) ) ( not ( = ?auto_607697 ?auto_607703 ) ) ( not ( = ?auto_607697 ?auto_607704 ) ) ( not ( = ?auto_607697 ?auto_607705 ) ) ( not ( = ?auto_607697 ?auto_607706 ) ) ( not ( = ?auto_607697 ?auto_607707 ) ) ( not ( = ?auto_607697 ?auto_607708 ) ) ( not ( = ?auto_607698 ?auto_607699 ) ) ( not ( = ?auto_607698 ?auto_607700 ) ) ( not ( = ?auto_607698 ?auto_607701 ) ) ( not ( = ?auto_607698 ?auto_607702 ) ) ( not ( = ?auto_607698 ?auto_607703 ) ) ( not ( = ?auto_607698 ?auto_607704 ) ) ( not ( = ?auto_607698 ?auto_607705 ) ) ( not ( = ?auto_607698 ?auto_607706 ) ) ( not ( = ?auto_607698 ?auto_607707 ) ) ( not ( = ?auto_607698 ?auto_607708 ) ) ( not ( = ?auto_607699 ?auto_607700 ) ) ( not ( = ?auto_607699 ?auto_607701 ) ) ( not ( = ?auto_607699 ?auto_607702 ) ) ( not ( = ?auto_607699 ?auto_607703 ) ) ( not ( = ?auto_607699 ?auto_607704 ) ) ( not ( = ?auto_607699 ?auto_607705 ) ) ( not ( = ?auto_607699 ?auto_607706 ) ) ( not ( = ?auto_607699 ?auto_607707 ) ) ( not ( = ?auto_607699 ?auto_607708 ) ) ( not ( = ?auto_607700 ?auto_607701 ) ) ( not ( = ?auto_607700 ?auto_607702 ) ) ( not ( = ?auto_607700 ?auto_607703 ) ) ( not ( = ?auto_607700 ?auto_607704 ) ) ( not ( = ?auto_607700 ?auto_607705 ) ) ( not ( = ?auto_607700 ?auto_607706 ) ) ( not ( = ?auto_607700 ?auto_607707 ) ) ( not ( = ?auto_607700 ?auto_607708 ) ) ( not ( = ?auto_607701 ?auto_607702 ) ) ( not ( = ?auto_607701 ?auto_607703 ) ) ( not ( = ?auto_607701 ?auto_607704 ) ) ( not ( = ?auto_607701 ?auto_607705 ) ) ( not ( = ?auto_607701 ?auto_607706 ) ) ( not ( = ?auto_607701 ?auto_607707 ) ) ( not ( = ?auto_607701 ?auto_607708 ) ) ( not ( = ?auto_607702 ?auto_607703 ) ) ( not ( = ?auto_607702 ?auto_607704 ) ) ( not ( = ?auto_607702 ?auto_607705 ) ) ( not ( = ?auto_607702 ?auto_607706 ) ) ( not ( = ?auto_607702 ?auto_607707 ) ) ( not ( = ?auto_607702 ?auto_607708 ) ) ( not ( = ?auto_607703 ?auto_607704 ) ) ( not ( = ?auto_607703 ?auto_607705 ) ) ( not ( = ?auto_607703 ?auto_607706 ) ) ( not ( = ?auto_607703 ?auto_607707 ) ) ( not ( = ?auto_607703 ?auto_607708 ) ) ( not ( = ?auto_607704 ?auto_607705 ) ) ( not ( = ?auto_607704 ?auto_607706 ) ) ( not ( = ?auto_607704 ?auto_607707 ) ) ( not ( = ?auto_607704 ?auto_607708 ) ) ( not ( = ?auto_607705 ?auto_607706 ) ) ( not ( = ?auto_607705 ?auto_607707 ) ) ( not ( = ?auto_607705 ?auto_607708 ) ) ( not ( = ?auto_607706 ?auto_607707 ) ) ( not ( = ?auto_607706 ?auto_607708 ) ) ( not ( = ?auto_607707 ?auto_607708 ) ) ( ON ?auto_607706 ?auto_607707 ) ( ON ?auto_607705 ?auto_607706 ) ( ON ?auto_607704 ?auto_607705 ) ( CLEAR ?auto_607702 ) ( ON ?auto_607703 ?auto_607704 ) ( CLEAR ?auto_607703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_607696 ?auto_607697 ?auto_607698 ?auto_607699 ?auto_607700 ?auto_607701 ?auto_607702 ?auto_607703 )
      ( MAKE-12PILE ?auto_607696 ?auto_607697 ?auto_607698 ?auto_607699 ?auto_607700 ?auto_607701 ?auto_607702 ?auto_607703 ?auto_607704 ?auto_607705 ?auto_607706 ?auto_607707 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607746 - BLOCK
      ?auto_607747 - BLOCK
      ?auto_607748 - BLOCK
      ?auto_607749 - BLOCK
      ?auto_607750 - BLOCK
      ?auto_607751 - BLOCK
      ?auto_607752 - BLOCK
      ?auto_607753 - BLOCK
      ?auto_607754 - BLOCK
      ?auto_607755 - BLOCK
      ?auto_607756 - BLOCK
      ?auto_607757 - BLOCK
    )
    :vars
    (
      ?auto_607758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607757 ?auto_607758 ) ( ON-TABLE ?auto_607746 ) ( ON ?auto_607747 ?auto_607746 ) ( ON ?auto_607748 ?auto_607747 ) ( ON ?auto_607749 ?auto_607748 ) ( ON ?auto_607750 ?auto_607749 ) ( ON ?auto_607751 ?auto_607750 ) ( not ( = ?auto_607746 ?auto_607747 ) ) ( not ( = ?auto_607746 ?auto_607748 ) ) ( not ( = ?auto_607746 ?auto_607749 ) ) ( not ( = ?auto_607746 ?auto_607750 ) ) ( not ( = ?auto_607746 ?auto_607751 ) ) ( not ( = ?auto_607746 ?auto_607752 ) ) ( not ( = ?auto_607746 ?auto_607753 ) ) ( not ( = ?auto_607746 ?auto_607754 ) ) ( not ( = ?auto_607746 ?auto_607755 ) ) ( not ( = ?auto_607746 ?auto_607756 ) ) ( not ( = ?auto_607746 ?auto_607757 ) ) ( not ( = ?auto_607746 ?auto_607758 ) ) ( not ( = ?auto_607747 ?auto_607748 ) ) ( not ( = ?auto_607747 ?auto_607749 ) ) ( not ( = ?auto_607747 ?auto_607750 ) ) ( not ( = ?auto_607747 ?auto_607751 ) ) ( not ( = ?auto_607747 ?auto_607752 ) ) ( not ( = ?auto_607747 ?auto_607753 ) ) ( not ( = ?auto_607747 ?auto_607754 ) ) ( not ( = ?auto_607747 ?auto_607755 ) ) ( not ( = ?auto_607747 ?auto_607756 ) ) ( not ( = ?auto_607747 ?auto_607757 ) ) ( not ( = ?auto_607747 ?auto_607758 ) ) ( not ( = ?auto_607748 ?auto_607749 ) ) ( not ( = ?auto_607748 ?auto_607750 ) ) ( not ( = ?auto_607748 ?auto_607751 ) ) ( not ( = ?auto_607748 ?auto_607752 ) ) ( not ( = ?auto_607748 ?auto_607753 ) ) ( not ( = ?auto_607748 ?auto_607754 ) ) ( not ( = ?auto_607748 ?auto_607755 ) ) ( not ( = ?auto_607748 ?auto_607756 ) ) ( not ( = ?auto_607748 ?auto_607757 ) ) ( not ( = ?auto_607748 ?auto_607758 ) ) ( not ( = ?auto_607749 ?auto_607750 ) ) ( not ( = ?auto_607749 ?auto_607751 ) ) ( not ( = ?auto_607749 ?auto_607752 ) ) ( not ( = ?auto_607749 ?auto_607753 ) ) ( not ( = ?auto_607749 ?auto_607754 ) ) ( not ( = ?auto_607749 ?auto_607755 ) ) ( not ( = ?auto_607749 ?auto_607756 ) ) ( not ( = ?auto_607749 ?auto_607757 ) ) ( not ( = ?auto_607749 ?auto_607758 ) ) ( not ( = ?auto_607750 ?auto_607751 ) ) ( not ( = ?auto_607750 ?auto_607752 ) ) ( not ( = ?auto_607750 ?auto_607753 ) ) ( not ( = ?auto_607750 ?auto_607754 ) ) ( not ( = ?auto_607750 ?auto_607755 ) ) ( not ( = ?auto_607750 ?auto_607756 ) ) ( not ( = ?auto_607750 ?auto_607757 ) ) ( not ( = ?auto_607750 ?auto_607758 ) ) ( not ( = ?auto_607751 ?auto_607752 ) ) ( not ( = ?auto_607751 ?auto_607753 ) ) ( not ( = ?auto_607751 ?auto_607754 ) ) ( not ( = ?auto_607751 ?auto_607755 ) ) ( not ( = ?auto_607751 ?auto_607756 ) ) ( not ( = ?auto_607751 ?auto_607757 ) ) ( not ( = ?auto_607751 ?auto_607758 ) ) ( not ( = ?auto_607752 ?auto_607753 ) ) ( not ( = ?auto_607752 ?auto_607754 ) ) ( not ( = ?auto_607752 ?auto_607755 ) ) ( not ( = ?auto_607752 ?auto_607756 ) ) ( not ( = ?auto_607752 ?auto_607757 ) ) ( not ( = ?auto_607752 ?auto_607758 ) ) ( not ( = ?auto_607753 ?auto_607754 ) ) ( not ( = ?auto_607753 ?auto_607755 ) ) ( not ( = ?auto_607753 ?auto_607756 ) ) ( not ( = ?auto_607753 ?auto_607757 ) ) ( not ( = ?auto_607753 ?auto_607758 ) ) ( not ( = ?auto_607754 ?auto_607755 ) ) ( not ( = ?auto_607754 ?auto_607756 ) ) ( not ( = ?auto_607754 ?auto_607757 ) ) ( not ( = ?auto_607754 ?auto_607758 ) ) ( not ( = ?auto_607755 ?auto_607756 ) ) ( not ( = ?auto_607755 ?auto_607757 ) ) ( not ( = ?auto_607755 ?auto_607758 ) ) ( not ( = ?auto_607756 ?auto_607757 ) ) ( not ( = ?auto_607756 ?auto_607758 ) ) ( not ( = ?auto_607757 ?auto_607758 ) ) ( ON ?auto_607756 ?auto_607757 ) ( ON ?auto_607755 ?auto_607756 ) ( ON ?auto_607754 ?auto_607755 ) ( ON ?auto_607753 ?auto_607754 ) ( CLEAR ?auto_607751 ) ( ON ?auto_607752 ?auto_607753 ) ( CLEAR ?auto_607752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_607746 ?auto_607747 ?auto_607748 ?auto_607749 ?auto_607750 ?auto_607751 ?auto_607752 )
      ( MAKE-12PILE ?auto_607746 ?auto_607747 ?auto_607748 ?auto_607749 ?auto_607750 ?auto_607751 ?auto_607752 ?auto_607753 ?auto_607754 ?auto_607755 ?auto_607756 ?auto_607757 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607796 - BLOCK
      ?auto_607797 - BLOCK
      ?auto_607798 - BLOCK
      ?auto_607799 - BLOCK
      ?auto_607800 - BLOCK
      ?auto_607801 - BLOCK
      ?auto_607802 - BLOCK
      ?auto_607803 - BLOCK
      ?auto_607804 - BLOCK
      ?auto_607805 - BLOCK
      ?auto_607806 - BLOCK
      ?auto_607807 - BLOCK
    )
    :vars
    (
      ?auto_607808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607807 ?auto_607808 ) ( ON-TABLE ?auto_607796 ) ( ON ?auto_607797 ?auto_607796 ) ( ON ?auto_607798 ?auto_607797 ) ( ON ?auto_607799 ?auto_607798 ) ( ON ?auto_607800 ?auto_607799 ) ( not ( = ?auto_607796 ?auto_607797 ) ) ( not ( = ?auto_607796 ?auto_607798 ) ) ( not ( = ?auto_607796 ?auto_607799 ) ) ( not ( = ?auto_607796 ?auto_607800 ) ) ( not ( = ?auto_607796 ?auto_607801 ) ) ( not ( = ?auto_607796 ?auto_607802 ) ) ( not ( = ?auto_607796 ?auto_607803 ) ) ( not ( = ?auto_607796 ?auto_607804 ) ) ( not ( = ?auto_607796 ?auto_607805 ) ) ( not ( = ?auto_607796 ?auto_607806 ) ) ( not ( = ?auto_607796 ?auto_607807 ) ) ( not ( = ?auto_607796 ?auto_607808 ) ) ( not ( = ?auto_607797 ?auto_607798 ) ) ( not ( = ?auto_607797 ?auto_607799 ) ) ( not ( = ?auto_607797 ?auto_607800 ) ) ( not ( = ?auto_607797 ?auto_607801 ) ) ( not ( = ?auto_607797 ?auto_607802 ) ) ( not ( = ?auto_607797 ?auto_607803 ) ) ( not ( = ?auto_607797 ?auto_607804 ) ) ( not ( = ?auto_607797 ?auto_607805 ) ) ( not ( = ?auto_607797 ?auto_607806 ) ) ( not ( = ?auto_607797 ?auto_607807 ) ) ( not ( = ?auto_607797 ?auto_607808 ) ) ( not ( = ?auto_607798 ?auto_607799 ) ) ( not ( = ?auto_607798 ?auto_607800 ) ) ( not ( = ?auto_607798 ?auto_607801 ) ) ( not ( = ?auto_607798 ?auto_607802 ) ) ( not ( = ?auto_607798 ?auto_607803 ) ) ( not ( = ?auto_607798 ?auto_607804 ) ) ( not ( = ?auto_607798 ?auto_607805 ) ) ( not ( = ?auto_607798 ?auto_607806 ) ) ( not ( = ?auto_607798 ?auto_607807 ) ) ( not ( = ?auto_607798 ?auto_607808 ) ) ( not ( = ?auto_607799 ?auto_607800 ) ) ( not ( = ?auto_607799 ?auto_607801 ) ) ( not ( = ?auto_607799 ?auto_607802 ) ) ( not ( = ?auto_607799 ?auto_607803 ) ) ( not ( = ?auto_607799 ?auto_607804 ) ) ( not ( = ?auto_607799 ?auto_607805 ) ) ( not ( = ?auto_607799 ?auto_607806 ) ) ( not ( = ?auto_607799 ?auto_607807 ) ) ( not ( = ?auto_607799 ?auto_607808 ) ) ( not ( = ?auto_607800 ?auto_607801 ) ) ( not ( = ?auto_607800 ?auto_607802 ) ) ( not ( = ?auto_607800 ?auto_607803 ) ) ( not ( = ?auto_607800 ?auto_607804 ) ) ( not ( = ?auto_607800 ?auto_607805 ) ) ( not ( = ?auto_607800 ?auto_607806 ) ) ( not ( = ?auto_607800 ?auto_607807 ) ) ( not ( = ?auto_607800 ?auto_607808 ) ) ( not ( = ?auto_607801 ?auto_607802 ) ) ( not ( = ?auto_607801 ?auto_607803 ) ) ( not ( = ?auto_607801 ?auto_607804 ) ) ( not ( = ?auto_607801 ?auto_607805 ) ) ( not ( = ?auto_607801 ?auto_607806 ) ) ( not ( = ?auto_607801 ?auto_607807 ) ) ( not ( = ?auto_607801 ?auto_607808 ) ) ( not ( = ?auto_607802 ?auto_607803 ) ) ( not ( = ?auto_607802 ?auto_607804 ) ) ( not ( = ?auto_607802 ?auto_607805 ) ) ( not ( = ?auto_607802 ?auto_607806 ) ) ( not ( = ?auto_607802 ?auto_607807 ) ) ( not ( = ?auto_607802 ?auto_607808 ) ) ( not ( = ?auto_607803 ?auto_607804 ) ) ( not ( = ?auto_607803 ?auto_607805 ) ) ( not ( = ?auto_607803 ?auto_607806 ) ) ( not ( = ?auto_607803 ?auto_607807 ) ) ( not ( = ?auto_607803 ?auto_607808 ) ) ( not ( = ?auto_607804 ?auto_607805 ) ) ( not ( = ?auto_607804 ?auto_607806 ) ) ( not ( = ?auto_607804 ?auto_607807 ) ) ( not ( = ?auto_607804 ?auto_607808 ) ) ( not ( = ?auto_607805 ?auto_607806 ) ) ( not ( = ?auto_607805 ?auto_607807 ) ) ( not ( = ?auto_607805 ?auto_607808 ) ) ( not ( = ?auto_607806 ?auto_607807 ) ) ( not ( = ?auto_607806 ?auto_607808 ) ) ( not ( = ?auto_607807 ?auto_607808 ) ) ( ON ?auto_607806 ?auto_607807 ) ( ON ?auto_607805 ?auto_607806 ) ( ON ?auto_607804 ?auto_607805 ) ( ON ?auto_607803 ?auto_607804 ) ( ON ?auto_607802 ?auto_607803 ) ( CLEAR ?auto_607800 ) ( ON ?auto_607801 ?auto_607802 ) ( CLEAR ?auto_607801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_607796 ?auto_607797 ?auto_607798 ?auto_607799 ?auto_607800 ?auto_607801 )
      ( MAKE-12PILE ?auto_607796 ?auto_607797 ?auto_607798 ?auto_607799 ?auto_607800 ?auto_607801 ?auto_607802 ?auto_607803 ?auto_607804 ?auto_607805 ?auto_607806 ?auto_607807 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607846 - BLOCK
      ?auto_607847 - BLOCK
      ?auto_607848 - BLOCK
      ?auto_607849 - BLOCK
      ?auto_607850 - BLOCK
      ?auto_607851 - BLOCK
      ?auto_607852 - BLOCK
      ?auto_607853 - BLOCK
      ?auto_607854 - BLOCK
      ?auto_607855 - BLOCK
      ?auto_607856 - BLOCK
      ?auto_607857 - BLOCK
    )
    :vars
    (
      ?auto_607858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607857 ?auto_607858 ) ( ON-TABLE ?auto_607846 ) ( ON ?auto_607847 ?auto_607846 ) ( ON ?auto_607848 ?auto_607847 ) ( ON ?auto_607849 ?auto_607848 ) ( not ( = ?auto_607846 ?auto_607847 ) ) ( not ( = ?auto_607846 ?auto_607848 ) ) ( not ( = ?auto_607846 ?auto_607849 ) ) ( not ( = ?auto_607846 ?auto_607850 ) ) ( not ( = ?auto_607846 ?auto_607851 ) ) ( not ( = ?auto_607846 ?auto_607852 ) ) ( not ( = ?auto_607846 ?auto_607853 ) ) ( not ( = ?auto_607846 ?auto_607854 ) ) ( not ( = ?auto_607846 ?auto_607855 ) ) ( not ( = ?auto_607846 ?auto_607856 ) ) ( not ( = ?auto_607846 ?auto_607857 ) ) ( not ( = ?auto_607846 ?auto_607858 ) ) ( not ( = ?auto_607847 ?auto_607848 ) ) ( not ( = ?auto_607847 ?auto_607849 ) ) ( not ( = ?auto_607847 ?auto_607850 ) ) ( not ( = ?auto_607847 ?auto_607851 ) ) ( not ( = ?auto_607847 ?auto_607852 ) ) ( not ( = ?auto_607847 ?auto_607853 ) ) ( not ( = ?auto_607847 ?auto_607854 ) ) ( not ( = ?auto_607847 ?auto_607855 ) ) ( not ( = ?auto_607847 ?auto_607856 ) ) ( not ( = ?auto_607847 ?auto_607857 ) ) ( not ( = ?auto_607847 ?auto_607858 ) ) ( not ( = ?auto_607848 ?auto_607849 ) ) ( not ( = ?auto_607848 ?auto_607850 ) ) ( not ( = ?auto_607848 ?auto_607851 ) ) ( not ( = ?auto_607848 ?auto_607852 ) ) ( not ( = ?auto_607848 ?auto_607853 ) ) ( not ( = ?auto_607848 ?auto_607854 ) ) ( not ( = ?auto_607848 ?auto_607855 ) ) ( not ( = ?auto_607848 ?auto_607856 ) ) ( not ( = ?auto_607848 ?auto_607857 ) ) ( not ( = ?auto_607848 ?auto_607858 ) ) ( not ( = ?auto_607849 ?auto_607850 ) ) ( not ( = ?auto_607849 ?auto_607851 ) ) ( not ( = ?auto_607849 ?auto_607852 ) ) ( not ( = ?auto_607849 ?auto_607853 ) ) ( not ( = ?auto_607849 ?auto_607854 ) ) ( not ( = ?auto_607849 ?auto_607855 ) ) ( not ( = ?auto_607849 ?auto_607856 ) ) ( not ( = ?auto_607849 ?auto_607857 ) ) ( not ( = ?auto_607849 ?auto_607858 ) ) ( not ( = ?auto_607850 ?auto_607851 ) ) ( not ( = ?auto_607850 ?auto_607852 ) ) ( not ( = ?auto_607850 ?auto_607853 ) ) ( not ( = ?auto_607850 ?auto_607854 ) ) ( not ( = ?auto_607850 ?auto_607855 ) ) ( not ( = ?auto_607850 ?auto_607856 ) ) ( not ( = ?auto_607850 ?auto_607857 ) ) ( not ( = ?auto_607850 ?auto_607858 ) ) ( not ( = ?auto_607851 ?auto_607852 ) ) ( not ( = ?auto_607851 ?auto_607853 ) ) ( not ( = ?auto_607851 ?auto_607854 ) ) ( not ( = ?auto_607851 ?auto_607855 ) ) ( not ( = ?auto_607851 ?auto_607856 ) ) ( not ( = ?auto_607851 ?auto_607857 ) ) ( not ( = ?auto_607851 ?auto_607858 ) ) ( not ( = ?auto_607852 ?auto_607853 ) ) ( not ( = ?auto_607852 ?auto_607854 ) ) ( not ( = ?auto_607852 ?auto_607855 ) ) ( not ( = ?auto_607852 ?auto_607856 ) ) ( not ( = ?auto_607852 ?auto_607857 ) ) ( not ( = ?auto_607852 ?auto_607858 ) ) ( not ( = ?auto_607853 ?auto_607854 ) ) ( not ( = ?auto_607853 ?auto_607855 ) ) ( not ( = ?auto_607853 ?auto_607856 ) ) ( not ( = ?auto_607853 ?auto_607857 ) ) ( not ( = ?auto_607853 ?auto_607858 ) ) ( not ( = ?auto_607854 ?auto_607855 ) ) ( not ( = ?auto_607854 ?auto_607856 ) ) ( not ( = ?auto_607854 ?auto_607857 ) ) ( not ( = ?auto_607854 ?auto_607858 ) ) ( not ( = ?auto_607855 ?auto_607856 ) ) ( not ( = ?auto_607855 ?auto_607857 ) ) ( not ( = ?auto_607855 ?auto_607858 ) ) ( not ( = ?auto_607856 ?auto_607857 ) ) ( not ( = ?auto_607856 ?auto_607858 ) ) ( not ( = ?auto_607857 ?auto_607858 ) ) ( ON ?auto_607856 ?auto_607857 ) ( ON ?auto_607855 ?auto_607856 ) ( ON ?auto_607854 ?auto_607855 ) ( ON ?auto_607853 ?auto_607854 ) ( ON ?auto_607852 ?auto_607853 ) ( ON ?auto_607851 ?auto_607852 ) ( CLEAR ?auto_607849 ) ( ON ?auto_607850 ?auto_607851 ) ( CLEAR ?auto_607850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_607846 ?auto_607847 ?auto_607848 ?auto_607849 ?auto_607850 )
      ( MAKE-12PILE ?auto_607846 ?auto_607847 ?auto_607848 ?auto_607849 ?auto_607850 ?auto_607851 ?auto_607852 ?auto_607853 ?auto_607854 ?auto_607855 ?auto_607856 ?auto_607857 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607896 - BLOCK
      ?auto_607897 - BLOCK
      ?auto_607898 - BLOCK
      ?auto_607899 - BLOCK
      ?auto_607900 - BLOCK
      ?auto_607901 - BLOCK
      ?auto_607902 - BLOCK
      ?auto_607903 - BLOCK
      ?auto_607904 - BLOCK
      ?auto_607905 - BLOCK
      ?auto_607906 - BLOCK
      ?auto_607907 - BLOCK
    )
    :vars
    (
      ?auto_607908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607907 ?auto_607908 ) ( ON-TABLE ?auto_607896 ) ( ON ?auto_607897 ?auto_607896 ) ( ON ?auto_607898 ?auto_607897 ) ( not ( = ?auto_607896 ?auto_607897 ) ) ( not ( = ?auto_607896 ?auto_607898 ) ) ( not ( = ?auto_607896 ?auto_607899 ) ) ( not ( = ?auto_607896 ?auto_607900 ) ) ( not ( = ?auto_607896 ?auto_607901 ) ) ( not ( = ?auto_607896 ?auto_607902 ) ) ( not ( = ?auto_607896 ?auto_607903 ) ) ( not ( = ?auto_607896 ?auto_607904 ) ) ( not ( = ?auto_607896 ?auto_607905 ) ) ( not ( = ?auto_607896 ?auto_607906 ) ) ( not ( = ?auto_607896 ?auto_607907 ) ) ( not ( = ?auto_607896 ?auto_607908 ) ) ( not ( = ?auto_607897 ?auto_607898 ) ) ( not ( = ?auto_607897 ?auto_607899 ) ) ( not ( = ?auto_607897 ?auto_607900 ) ) ( not ( = ?auto_607897 ?auto_607901 ) ) ( not ( = ?auto_607897 ?auto_607902 ) ) ( not ( = ?auto_607897 ?auto_607903 ) ) ( not ( = ?auto_607897 ?auto_607904 ) ) ( not ( = ?auto_607897 ?auto_607905 ) ) ( not ( = ?auto_607897 ?auto_607906 ) ) ( not ( = ?auto_607897 ?auto_607907 ) ) ( not ( = ?auto_607897 ?auto_607908 ) ) ( not ( = ?auto_607898 ?auto_607899 ) ) ( not ( = ?auto_607898 ?auto_607900 ) ) ( not ( = ?auto_607898 ?auto_607901 ) ) ( not ( = ?auto_607898 ?auto_607902 ) ) ( not ( = ?auto_607898 ?auto_607903 ) ) ( not ( = ?auto_607898 ?auto_607904 ) ) ( not ( = ?auto_607898 ?auto_607905 ) ) ( not ( = ?auto_607898 ?auto_607906 ) ) ( not ( = ?auto_607898 ?auto_607907 ) ) ( not ( = ?auto_607898 ?auto_607908 ) ) ( not ( = ?auto_607899 ?auto_607900 ) ) ( not ( = ?auto_607899 ?auto_607901 ) ) ( not ( = ?auto_607899 ?auto_607902 ) ) ( not ( = ?auto_607899 ?auto_607903 ) ) ( not ( = ?auto_607899 ?auto_607904 ) ) ( not ( = ?auto_607899 ?auto_607905 ) ) ( not ( = ?auto_607899 ?auto_607906 ) ) ( not ( = ?auto_607899 ?auto_607907 ) ) ( not ( = ?auto_607899 ?auto_607908 ) ) ( not ( = ?auto_607900 ?auto_607901 ) ) ( not ( = ?auto_607900 ?auto_607902 ) ) ( not ( = ?auto_607900 ?auto_607903 ) ) ( not ( = ?auto_607900 ?auto_607904 ) ) ( not ( = ?auto_607900 ?auto_607905 ) ) ( not ( = ?auto_607900 ?auto_607906 ) ) ( not ( = ?auto_607900 ?auto_607907 ) ) ( not ( = ?auto_607900 ?auto_607908 ) ) ( not ( = ?auto_607901 ?auto_607902 ) ) ( not ( = ?auto_607901 ?auto_607903 ) ) ( not ( = ?auto_607901 ?auto_607904 ) ) ( not ( = ?auto_607901 ?auto_607905 ) ) ( not ( = ?auto_607901 ?auto_607906 ) ) ( not ( = ?auto_607901 ?auto_607907 ) ) ( not ( = ?auto_607901 ?auto_607908 ) ) ( not ( = ?auto_607902 ?auto_607903 ) ) ( not ( = ?auto_607902 ?auto_607904 ) ) ( not ( = ?auto_607902 ?auto_607905 ) ) ( not ( = ?auto_607902 ?auto_607906 ) ) ( not ( = ?auto_607902 ?auto_607907 ) ) ( not ( = ?auto_607902 ?auto_607908 ) ) ( not ( = ?auto_607903 ?auto_607904 ) ) ( not ( = ?auto_607903 ?auto_607905 ) ) ( not ( = ?auto_607903 ?auto_607906 ) ) ( not ( = ?auto_607903 ?auto_607907 ) ) ( not ( = ?auto_607903 ?auto_607908 ) ) ( not ( = ?auto_607904 ?auto_607905 ) ) ( not ( = ?auto_607904 ?auto_607906 ) ) ( not ( = ?auto_607904 ?auto_607907 ) ) ( not ( = ?auto_607904 ?auto_607908 ) ) ( not ( = ?auto_607905 ?auto_607906 ) ) ( not ( = ?auto_607905 ?auto_607907 ) ) ( not ( = ?auto_607905 ?auto_607908 ) ) ( not ( = ?auto_607906 ?auto_607907 ) ) ( not ( = ?auto_607906 ?auto_607908 ) ) ( not ( = ?auto_607907 ?auto_607908 ) ) ( ON ?auto_607906 ?auto_607907 ) ( ON ?auto_607905 ?auto_607906 ) ( ON ?auto_607904 ?auto_607905 ) ( ON ?auto_607903 ?auto_607904 ) ( ON ?auto_607902 ?auto_607903 ) ( ON ?auto_607901 ?auto_607902 ) ( ON ?auto_607900 ?auto_607901 ) ( CLEAR ?auto_607898 ) ( ON ?auto_607899 ?auto_607900 ) ( CLEAR ?auto_607899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_607896 ?auto_607897 ?auto_607898 ?auto_607899 )
      ( MAKE-12PILE ?auto_607896 ?auto_607897 ?auto_607898 ?auto_607899 ?auto_607900 ?auto_607901 ?auto_607902 ?auto_607903 ?auto_607904 ?auto_607905 ?auto_607906 ?auto_607907 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607946 - BLOCK
      ?auto_607947 - BLOCK
      ?auto_607948 - BLOCK
      ?auto_607949 - BLOCK
      ?auto_607950 - BLOCK
      ?auto_607951 - BLOCK
      ?auto_607952 - BLOCK
      ?auto_607953 - BLOCK
      ?auto_607954 - BLOCK
      ?auto_607955 - BLOCK
      ?auto_607956 - BLOCK
      ?auto_607957 - BLOCK
    )
    :vars
    (
      ?auto_607958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_607957 ?auto_607958 ) ( ON-TABLE ?auto_607946 ) ( ON ?auto_607947 ?auto_607946 ) ( not ( = ?auto_607946 ?auto_607947 ) ) ( not ( = ?auto_607946 ?auto_607948 ) ) ( not ( = ?auto_607946 ?auto_607949 ) ) ( not ( = ?auto_607946 ?auto_607950 ) ) ( not ( = ?auto_607946 ?auto_607951 ) ) ( not ( = ?auto_607946 ?auto_607952 ) ) ( not ( = ?auto_607946 ?auto_607953 ) ) ( not ( = ?auto_607946 ?auto_607954 ) ) ( not ( = ?auto_607946 ?auto_607955 ) ) ( not ( = ?auto_607946 ?auto_607956 ) ) ( not ( = ?auto_607946 ?auto_607957 ) ) ( not ( = ?auto_607946 ?auto_607958 ) ) ( not ( = ?auto_607947 ?auto_607948 ) ) ( not ( = ?auto_607947 ?auto_607949 ) ) ( not ( = ?auto_607947 ?auto_607950 ) ) ( not ( = ?auto_607947 ?auto_607951 ) ) ( not ( = ?auto_607947 ?auto_607952 ) ) ( not ( = ?auto_607947 ?auto_607953 ) ) ( not ( = ?auto_607947 ?auto_607954 ) ) ( not ( = ?auto_607947 ?auto_607955 ) ) ( not ( = ?auto_607947 ?auto_607956 ) ) ( not ( = ?auto_607947 ?auto_607957 ) ) ( not ( = ?auto_607947 ?auto_607958 ) ) ( not ( = ?auto_607948 ?auto_607949 ) ) ( not ( = ?auto_607948 ?auto_607950 ) ) ( not ( = ?auto_607948 ?auto_607951 ) ) ( not ( = ?auto_607948 ?auto_607952 ) ) ( not ( = ?auto_607948 ?auto_607953 ) ) ( not ( = ?auto_607948 ?auto_607954 ) ) ( not ( = ?auto_607948 ?auto_607955 ) ) ( not ( = ?auto_607948 ?auto_607956 ) ) ( not ( = ?auto_607948 ?auto_607957 ) ) ( not ( = ?auto_607948 ?auto_607958 ) ) ( not ( = ?auto_607949 ?auto_607950 ) ) ( not ( = ?auto_607949 ?auto_607951 ) ) ( not ( = ?auto_607949 ?auto_607952 ) ) ( not ( = ?auto_607949 ?auto_607953 ) ) ( not ( = ?auto_607949 ?auto_607954 ) ) ( not ( = ?auto_607949 ?auto_607955 ) ) ( not ( = ?auto_607949 ?auto_607956 ) ) ( not ( = ?auto_607949 ?auto_607957 ) ) ( not ( = ?auto_607949 ?auto_607958 ) ) ( not ( = ?auto_607950 ?auto_607951 ) ) ( not ( = ?auto_607950 ?auto_607952 ) ) ( not ( = ?auto_607950 ?auto_607953 ) ) ( not ( = ?auto_607950 ?auto_607954 ) ) ( not ( = ?auto_607950 ?auto_607955 ) ) ( not ( = ?auto_607950 ?auto_607956 ) ) ( not ( = ?auto_607950 ?auto_607957 ) ) ( not ( = ?auto_607950 ?auto_607958 ) ) ( not ( = ?auto_607951 ?auto_607952 ) ) ( not ( = ?auto_607951 ?auto_607953 ) ) ( not ( = ?auto_607951 ?auto_607954 ) ) ( not ( = ?auto_607951 ?auto_607955 ) ) ( not ( = ?auto_607951 ?auto_607956 ) ) ( not ( = ?auto_607951 ?auto_607957 ) ) ( not ( = ?auto_607951 ?auto_607958 ) ) ( not ( = ?auto_607952 ?auto_607953 ) ) ( not ( = ?auto_607952 ?auto_607954 ) ) ( not ( = ?auto_607952 ?auto_607955 ) ) ( not ( = ?auto_607952 ?auto_607956 ) ) ( not ( = ?auto_607952 ?auto_607957 ) ) ( not ( = ?auto_607952 ?auto_607958 ) ) ( not ( = ?auto_607953 ?auto_607954 ) ) ( not ( = ?auto_607953 ?auto_607955 ) ) ( not ( = ?auto_607953 ?auto_607956 ) ) ( not ( = ?auto_607953 ?auto_607957 ) ) ( not ( = ?auto_607953 ?auto_607958 ) ) ( not ( = ?auto_607954 ?auto_607955 ) ) ( not ( = ?auto_607954 ?auto_607956 ) ) ( not ( = ?auto_607954 ?auto_607957 ) ) ( not ( = ?auto_607954 ?auto_607958 ) ) ( not ( = ?auto_607955 ?auto_607956 ) ) ( not ( = ?auto_607955 ?auto_607957 ) ) ( not ( = ?auto_607955 ?auto_607958 ) ) ( not ( = ?auto_607956 ?auto_607957 ) ) ( not ( = ?auto_607956 ?auto_607958 ) ) ( not ( = ?auto_607957 ?auto_607958 ) ) ( ON ?auto_607956 ?auto_607957 ) ( ON ?auto_607955 ?auto_607956 ) ( ON ?auto_607954 ?auto_607955 ) ( ON ?auto_607953 ?auto_607954 ) ( ON ?auto_607952 ?auto_607953 ) ( ON ?auto_607951 ?auto_607952 ) ( ON ?auto_607950 ?auto_607951 ) ( ON ?auto_607949 ?auto_607950 ) ( CLEAR ?auto_607947 ) ( ON ?auto_607948 ?auto_607949 ) ( CLEAR ?auto_607948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_607946 ?auto_607947 ?auto_607948 )
      ( MAKE-12PILE ?auto_607946 ?auto_607947 ?auto_607948 ?auto_607949 ?auto_607950 ?auto_607951 ?auto_607952 ?auto_607953 ?auto_607954 ?auto_607955 ?auto_607956 ?auto_607957 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_607996 - BLOCK
      ?auto_607997 - BLOCK
      ?auto_607998 - BLOCK
      ?auto_607999 - BLOCK
      ?auto_608000 - BLOCK
      ?auto_608001 - BLOCK
      ?auto_608002 - BLOCK
      ?auto_608003 - BLOCK
      ?auto_608004 - BLOCK
      ?auto_608005 - BLOCK
      ?auto_608006 - BLOCK
      ?auto_608007 - BLOCK
    )
    :vars
    (
      ?auto_608008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608007 ?auto_608008 ) ( ON-TABLE ?auto_607996 ) ( not ( = ?auto_607996 ?auto_607997 ) ) ( not ( = ?auto_607996 ?auto_607998 ) ) ( not ( = ?auto_607996 ?auto_607999 ) ) ( not ( = ?auto_607996 ?auto_608000 ) ) ( not ( = ?auto_607996 ?auto_608001 ) ) ( not ( = ?auto_607996 ?auto_608002 ) ) ( not ( = ?auto_607996 ?auto_608003 ) ) ( not ( = ?auto_607996 ?auto_608004 ) ) ( not ( = ?auto_607996 ?auto_608005 ) ) ( not ( = ?auto_607996 ?auto_608006 ) ) ( not ( = ?auto_607996 ?auto_608007 ) ) ( not ( = ?auto_607996 ?auto_608008 ) ) ( not ( = ?auto_607997 ?auto_607998 ) ) ( not ( = ?auto_607997 ?auto_607999 ) ) ( not ( = ?auto_607997 ?auto_608000 ) ) ( not ( = ?auto_607997 ?auto_608001 ) ) ( not ( = ?auto_607997 ?auto_608002 ) ) ( not ( = ?auto_607997 ?auto_608003 ) ) ( not ( = ?auto_607997 ?auto_608004 ) ) ( not ( = ?auto_607997 ?auto_608005 ) ) ( not ( = ?auto_607997 ?auto_608006 ) ) ( not ( = ?auto_607997 ?auto_608007 ) ) ( not ( = ?auto_607997 ?auto_608008 ) ) ( not ( = ?auto_607998 ?auto_607999 ) ) ( not ( = ?auto_607998 ?auto_608000 ) ) ( not ( = ?auto_607998 ?auto_608001 ) ) ( not ( = ?auto_607998 ?auto_608002 ) ) ( not ( = ?auto_607998 ?auto_608003 ) ) ( not ( = ?auto_607998 ?auto_608004 ) ) ( not ( = ?auto_607998 ?auto_608005 ) ) ( not ( = ?auto_607998 ?auto_608006 ) ) ( not ( = ?auto_607998 ?auto_608007 ) ) ( not ( = ?auto_607998 ?auto_608008 ) ) ( not ( = ?auto_607999 ?auto_608000 ) ) ( not ( = ?auto_607999 ?auto_608001 ) ) ( not ( = ?auto_607999 ?auto_608002 ) ) ( not ( = ?auto_607999 ?auto_608003 ) ) ( not ( = ?auto_607999 ?auto_608004 ) ) ( not ( = ?auto_607999 ?auto_608005 ) ) ( not ( = ?auto_607999 ?auto_608006 ) ) ( not ( = ?auto_607999 ?auto_608007 ) ) ( not ( = ?auto_607999 ?auto_608008 ) ) ( not ( = ?auto_608000 ?auto_608001 ) ) ( not ( = ?auto_608000 ?auto_608002 ) ) ( not ( = ?auto_608000 ?auto_608003 ) ) ( not ( = ?auto_608000 ?auto_608004 ) ) ( not ( = ?auto_608000 ?auto_608005 ) ) ( not ( = ?auto_608000 ?auto_608006 ) ) ( not ( = ?auto_608000 ?auto_608007 ) ) ( not ( = ?auto_608000 ?auto_608008 ) ) ( not ( = ?auto_608001 ?auto_608002 ) ) ( not ( = ?auto_608001 ?auto_608003 ) ) ( not ( = ?auto_608001 ?auto_608004 ) ) ( not ( = ?auto_608001 ?auto_608005 ) ) ( not ( = ?auto_608001 ?auto_608006 ) ) ( not ( = ?auto_608001 ?auto_608007 ) ) ( not ( = ?auto_608001 ?auto_608008 ) ) ( not ( = ?auto_608002 ?auto_608003 ) ) ( not ( = ?auto_608002 ?auto_608004 ) ) ( not ( = ?auto_608002 ?auto_608005 ) ) ( not ( = ?auto_608002 ?auto_608006 ) ) ( not ( = ?auto_608002 ?auto_608007 ) ) ( not ( = ?auto_608002 ?auto_608008 ) ) ( not ( = ?auto_608003 ?auto_608004 ) ) ( not ( = ?auto_608003 ?auto_608005 ) ) ( not ( = ?auto_608003 ?auto_608006 ) ) ( not ( = ?auto_608003 ?auto_608007 ) ) ( not ( = ?auto_608003 ?auto_608008 ) ) ( not ( = ?auto_608004 ?auto_608005 ) ) ( not ( = ?auto_608004 ?auto_608006 ) ) ( not ( = ?auto_608004 ?auto_608007 ) ) ( not ( = ?auto_608004 ?auto_608008 ) ) ( not ( = ?auto_608005 ?auto_608006 ) ) ( not ( = ?auto_608005 ?auto_608007 ) ) ( not ( = ?auto_608005 ?auto_608008 ) ) ( not ( = ?auto_608006 ?auto_608007 ) ) ( not ( = ?auto_608006 ?auto_608008 ) ) ( not ( = ?auto_608007 ?auto_608008 ) ) ( ON ?auto_608006 ?auto_608007 ) ( ON ?auto_608005 ?auto_608006 ) ( ON ?auto_608004 ?auto_608005 ) ( ON ?auto_608003 ?auto_608004 ) ( ON ?auto_608002 ?auto_608003 ) ( ON ?auto_608001 ?auto_608002 ) ( ON ?auto_608000 ?auto_608001 ) ( ON ?auto_607999 ?auto_608000 ) ( ON ?auto_607998 ?auto_607999 ) ( CLEAR ?auto_607996 ) ( ON ?auto_607997 ?auto_607998 ) ( CLEAR ?auto_607997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_607996 ?auto_607997 )
      ( MAKE-12PILE ?auto_607996 ?auto_607997 ?auto_607998 ?auto_607999 ?auto_608000 ?auto_608001 ?auto_608002 ?auto_608003 ?auto_608004 ?auto_608005 ?auto_608006 ?auto_608007 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_608046 - BLOCK
      ?auto_608047 - BLOCK
      ?auto_608048 - BLOCK
      ?auto_608049 - BLOCK
      ?auto_608050 - BLOCK
      ?auto_608051 - BLOCK
      ?auto_608052 - BLOCK
      ?auto_608053 - BLOCK
      ?auto_608054 - BLOCK
      ?auto_608055 - BLOCK
      ?auto_608056 - BLOCK
      ?auto_608057 - BLOCK
    )
    :vars
    (
      ?auto_608058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608057 ?auto_608058 ) ( not ( = ?auto_608046 ?auto_608047 ) ) ( not ( = ?auto_608046 ?auto_608048 ) ) ( not ( = ?auto_608046 ?auto_608049 ) ) ( not ( = ?auto_608046 ?auto_608050 ) ) ( not ( = ?auto_608046 ?auto_608051 ) ) ( not ( = ?auto_608046 ?auto_608052 ) ) ( not ( = ?auto_608046 ?auto_608053 ) ) ( not ( = ?auto_608046 ?auto_608054 ) ) ( not ( = ?auto_608046 ?auto_608055 ) ) ( not ( = ?auto_608046 ?auto_608056 ) ) ( not ( = ?auto_608046 ?auto_608057 ) ) ( not ( = ?auto_608046 ?auto_608058 ) ) ( not ( = ?auto_608047 ?auto_608048 ) ) ( not ( = ?auto_608047 ?auto_608049 ) ) ( not ( = ?auto_608047 ?auto_608050 ) ) ( not ( = ?auto_608047 ?auto_608051 ) ) ( not ( = ?auto_608047 ?auto_608052 ) ) ( not ( = ?auto_608047 ?auto_608053 ) ) ( not ( = ?auto_608047 ?auto_608054 ) ) ( not ( = ?auto_608047 ?auto_608055 ) ) ( not ( = ?auto_608047 ?auto_608056 ) ) ( not ( = ?auto_608047 ?auto_608057 ) ) ( not ( = ?auto_608047 ?auto_608058 ) ) ( not ( = ?auto_608048 ?auto_608049 ) ) ( not ( = ?auto_608048 ?auto_608050 ) ) ( not ( = ?auto_608048 ?auto_608051 ) ) ( not ( = ?auto_608048 ?auto_608052 ) ) ( not ( = ?auto_608048 ?auto_608053 ) ) ( not ( = ?auto_608048 ?auto_608054 ) ) ( not ( = ?auto_608048 ?auto_608055 ) ) ( not ( = ?auto_608048 ?auto_608056 ) ) ( not ( = ?auto_608048 ?auto_608057 ) ) ( not ( = ?auto_608048 ?auto_608058 ) ) ( not ( = ?auto_608049 ?auto_608050 ) ) ( not ( = ?auto_608049 ?auto_608051 ) ) ( not ( = ?auto_608049 ?auto_608052 ) ) ( not ( = ?auto_608049 ?auto_608053 ) ) ( not ( = ?auto_608049 ?auto_608054 ) ) ( not ( = ?auto_608049 ?auto_608055 ) ) ( not ( = ?auto_608049 ?auto_608056 ) ) ( not ( = ?auto_608049 ?auto_608057 ) ) ( not ( = ?auto_608049 ?auto_608058 ) ) ( not ( = ?auto_608050 ?auto_608051 ) ) ( not ( = ?auto_608050 ?auto_608052 ) ) ( not ( = ?auto_608050 ?auto_608053 ) ) ( not ( = ?auto_608050 ?auto_608054 ) ) ( not ( = ?auto_608050 ?auto_608055 ) ) ( not ( = ?auto_608050 ?auto_608056 ) ) ( not ( = ?auto_608050 ?auto_608057 ) ) ( not ( = ?auto_608050 ?auto_608058 ) ) ( not ( = ?auto_608051 ?auto_608052 ) ) ( not ( = ?auto_608051 ?auto_608053 ) ) ( not ( = ?auto_608051 ?auto_608054 ) ) ( not ( = ?auto_608051 ?auto_608055 ) ) ( not ( = ?auto_608051 ?auto_608056 ) ) ( not ( = ?auto_608051 ?auto_608057 ) ) ( not ( = ?auto_608051 ?auto_608058 ) ) ( not ( = ?auto_608052 ?auto_608053 ) ) ( not ( = ?auto_608052 ?auto_608054 ) ) ( not ( = ?auto_608052 ?auto_608055 ) ) ( not ( = ?auto_608052 ?auto_608056 ) ) ( not ( = ?auto_608052 ?auto_608057 ) ) ( not ( = ?auto_608052 ?auto_608058 ) ) ( not ( = ?auto_608053 ?auto_608054 ) ) ( not ( = ?auto_608053 ?auto_608055 ) ) ( not ( = ?auto_608053 ?auto_608056 ) ) ( not ( = ?auto_608053 ?auto_608057 ) ) ( not ( = ?auto_608053 ?auto_608058 ) ) ( not ( = ?auto_608054 ?auto_608055 ) ) ( not ( = ?auto_608054 ?auto_608056 ) ) ( not ( = ?auto_608054 ?auto_608057 ) ) ( not ( = ?auto_608054 ?auto_608058 ) ) ( not ( = ?auto_608055 ?auto_608056 ) ) ( not ( = ?auto_608055 ?auto_608057 ) ) ( not ( = ?auto_608055 ?auto_608058 ) ) ( not ( = ?auto_608056 ?auto_608057 ) ) ( not ( = ?auto_608056 ?auto_608058 ) ) ( not ( = ?auto_608057 ?auto_608058 ) ) ( ON ?auto_608056 ?auto_608057 ) ( ON ?auto_608055 ?auto_608056 ) ( ON ?auto_608054 ?auto_608055 ) ( ON ?auto_608053 ?auto_608054 ) ( ON ?auto_608052 ?auto_608053 ) ( ON ?auto_608051 ?auto_608052 ) ( ON ?auto_608050 ?auto_608051 ) ( ON ?auto_608049 ?auto_608050 ) ( ON ?auto_608048 ?auto_608049 ) ( ON ?auto_608047 ?auto_608048 ) ( ON ?auto_608046 ?auto_608047 ) ( CLEAR ?auto_608046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_608046 )
      ( MAKE-12PILE ?auto_608046 ?auto_608047 ?auto_608048 ?auto_608049 ?auto_608050 ?auto_608051 ?auto_608052 ?auto_608053 ?auto_608054 ?auto_608055 ?auto_608056 ?auto_608057 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608097 - BLOCK
      ?auto_608098 - BLOCK
      ?auto_608099 - BLOCK
      ?auto_608100 - BLOCK
      ?auto_608101 - BLOCK
      ?auto_608102 - BLOCK
      ?auto_608103 - BLOCK
      ?auto_608104 - BLOCK
      ?auto_608105 - BLOCK
      ?auto_608106 - BLOCK
      ?auto_608107 - BLOCK
      ?auto_608108 - BLOCK
      ?auto_608109 - BLOCK
    )
    :vars
    (
      ?auto_608110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_608108 ) ( ON ?auto_608109 ?auto_608110 ) ( CLEAR ?auto_608109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_608097 ) ( ON ?auto_608098 ?auto_608097 ) ( ON ?auto_608099 ?auto_608098 ) ( ON ?auto_608100 ?auto_608099 ) ( ON ?auto_608101 ?auto_608100 ) ( ON ?auto_608102 ?auto_608101 ) ( ON ?auto_608103 ?auto_608102 ) ( ON ?auto_608104 ?auto_608103 ) ( ON ?auto_608105 ?auto_608104 ) ( ON ?auto_608106 ?auto_608105 ) ( ON ?auto_608107 ?auto_608106 ) ( ON ?auto_608108 ?auto_608107 ) ( not ( = ?auto_608097 ?auto_608098 ) ) ( not ( = ?auto_608097 ?auto_608099 ) ) ( not ( = ?auto_608097 ?auto_608100 ) ) ( not ( = ?auto_608097 ?auto_608101 ) ) ( not ( = ?auto_608097 ?auto_608102 ) ) ( not ( = ?auto_608097 ?auto_608103 ) ) ( not ( = ?auto_608097 ?auto_608104 ) ) ( not ( = ?auto_608097 ?auto_608105 ) ) ( not ( = ?auto_608097 ?auto_608106 ) ) ( not ( = ?auto_608097 ?auto_608107 ) ) ( not ( = ?auto_608097 ?auto_608108 ) ) ( not ( = ?auto_608097 ?auto_608109 ) ) ( not ( = ?auto_608097 ?auto_608110 ) ) ( not ( = ?auto_608098 ?auto_608099 ) ) ( not ( = ?auto_608098 ?auto_608100 ) ) ( not ( = ?auto_608098 ?auto_608101 ) ) ( not ( = ?auto_608098 ?auto_608102 ) ) ( not ( = ?auto_608098 ?auto_608103 ) ) ( not ( = ?auto_608098 ?auto_608104 ) ) ( not ( = ?auto_608098 ?auto_608105 ) ) ( not ( = ?auto_608098 ?auto_608106 ) ) ( not ( = ?auto_608098 ?auto_608107 ) ) ( not ( = ?auto_608098 ?auto_608108 ) ) ( not ( = ?auto_608098 ?auto_608109 ) ) ( not ( = ?auto_608098 ?auto_608110 ) ) ( not ( = ?auto_608099 ?auto_608100 ) ) ( not ( = ?auto_608099 ?auto_608101 ) ) ( not ( = ?auto_608099 ?auto_608102 ) ) ( not ( = ?auto_608099 ?auto_608103 ) ) ( not ( = ?auto_608099 ?auto_608104 ) ) ( not ( = ?auto_608099 ?auto_608105 ) ) ( not ( = ?auto_608099 ?auto_608106 ) ) ( not ( = ?auto_608099 ?auto_608107 ) ) ( not ( = ?auto_608099 ?auto_608108 ) ) ( not ( = ?auto_608099 ?auto_608109 ) ) ( not ( = ?auto_608099 ?auto_608110 ) ) ( not ( = ?auto_608100 ?auto_608101 ) ) ( not ( = ?auto_608100 ?auto_608102 ) ) ( not ( = ?auto_608100 ?auto_608103 ) ) ( not ( = ?auto_608100 ?auto_608104 ) ) ( not ( = ?auto_608100 ?auto_608105 ) ) ( not ( = ?auto_608100 ?auto_608106 ) ) ( not ( = ?auto_608100 ?auto_608107 ) ) ( not ( = ?auto_608100 ?auto_608108 ) ) ( not ( = ?auto_608100 ?auto_608109 ) ) ( not ( = ?auto_608100 ?auto_608110 ) ) ( not ( = ?auto_608101 ?auto_608102 ) ) ( not ( = ?auto_608101 ?auto_608103 ) ) ( not ( = ?auto_608101 ?auto_608104 ) ) ( not ( = ?auto_608101 ?auto_608105 ) ) ( not ( = ?auto_608101 ?auto_608106 ) ) ( not ( = ?auto_608101 ?auto_608107 ) ) ( not ( = ?auto_608101 ?auto_608108 ) ) ( not ( = ?auto_608101 ?auto_608109 ) ) ( not ( = ?auto_608101 ?auto_608110 ) ) ( not ( = ?auto_608102 ?auto_608103 ) ) ( not ( = ?auto_608102 ?auto_608104 ) ) ( not ( = ?auto_608102 ?auto_608105 ) ) ( not ( = ?auto_608102 ?auto_608106 ) ) ( not ( = ?auto_608102 ?auto_608107 ) ) ( not ( = ?auto_608102 ?auto_608108 ) ) ( not ( = ?auto_608102 ?auto_608109 ) ) ( not ( = ?auto_608102 ?auto_608110 ) ) ( not ( = ?auto_608103 ?auto_608104 ) ) ( not ( = ?auto_608103 ?auto_608105 ) ) ( not ( = ?auto_608103 ?auto_608106 ) ) ( not ( = ?auto_608103 ?auto_608107 ) ) ( not ( = ?auto_608103 ?auto_608108 ) ) ( not ( = ?auto_608103 ?auto_608109 ) ) ( not ( = ?auto_608103 ?auto_608110 ) ) ( not ( = ?auto_608104 ?auto_608105 ) ) ( not ( = ?auto_608104 ?auto_608106 ) ) ( not ( = ?auto_608104 ?auto_608107 ) ) ( not ( = ?auto_608104 ?auto_608108 ) ) ( not ( = ?auto_608104 ?auto_608109 ) ) ( not ( = ?auto_608104 ?auto_608110 ) ) ( not ( = ?auto_608105 ?auto_608106 ) ) ( not ( = ?auto_608105 ?auto_608107 ) ) ( not ( = ?auto_608105 ?auto_608108 ) ) ( not ( = ?auto_608105 ?auto_608109 ) ) ( not ( = ?auto_608105 ?auto_608110 ) ) ( not ( = ?auto_608106 ?auto_608107 ) ) ( not ( = ?auto_608106 ?auto_608108 ) ) ( not ( = ?auto_608106 ?auto_608109 ) ) ( not ( = ?auto_608106 ?auto_608110 ) ) ( not ( = ?auto_608107 ?auto_608108 ) ) ( not ( = ?auto_608107 ?auto_608109 ) ) ( not ( = ?auto_608107 ?auto_608110 ) ) ( not ( = ?auto_608108 ?auto_608109 ) ) ( not ( = ?auto_608108 ?auto_608110 ) ) ( not ( = ?auto_608109 ?auto_608110 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_608109 ?auto_608110 )
      ( !STACK ?auto_608109 ?auto_608108 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608151 - BLOCK
      ?auto_608152 - BLOCK
      ?auto_608153 - BLOCK
      ?auto_608154 - BLOCK
      ?auto_608155 - BLOCK
      ?auto_608156 - BLOCK
      ?auto_608157 - BLOCK
      ?auto_608158 - BLOCK
      ?auto_608159 - BLOCK
      ?auto_608160 - BLOCK
      ?auto_608161 - BLOCK
      ?auto_608162 - BLOCK
      ?auto_608163 - BLOCK
    )
    :vars
    (
      ?auto_608164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608163 ?auto_608164 ) ( ON-TABLE ?auto_608151 ) ( ON ?auto_608152 ?auto_608151 ) ( ON ?auto_608153 ?auto_608152 ) ( ON ?auto_608154 ?auto_608153 ) ( ON ?auto_608155 ?auto_608154 ) ( ON ?auto_608156 ?auto_608155 ) ( ON ?auto_608157 ?auto_608156 ) ( ON ?auto_608158 ?auto_608157 ) ( ON ?auto_608159 ?auto_608158 ) ( ON ?auto_608160 ?auto_608159 ) ( ON ?auto_608161 ?auto_608160 ) ( not ( = ?auto_608151 ?auto_608152 ) ) ( not ( = ?auto_608151 ?auto_608153 ) ) ( not ( = ?auto_608151 ?auto_608154 ) ) ( not ( = ?auto_608151 ?auto_608155 ) ) ( not ( = ?auto_608151 ?auto_608156 ) ) ( not ( = ?auto_608151 ?auto_608157 ) ) ( not ( = ?auto_608151 ?auto_608158 ) ) ( not ( = ?auto_608151 ?auto_608159 ) ) ( not ( = ?auto_608151 ?auto_608160 ) ) ( not ( = ?auto_608151 ?auto_608161 ) ) ( not ( = ?auto_608151 ?auto_608162 ) ) ( not ( = ?auto_608151 ?auto_608163 ) ) ( not ( = ?auto_608151 ?auto_608164 ) ) ( not ( = ?auto_608152 ?auto_608153 ) ) ( not ( = ?auto_608152 ?auto_608154 ) ) ( not ( = ?auto_608152 ?auto_608155 ) ) ( not ( = ?auto_608152 ?auto_608156 ) ) ( not ( = ?auto_608152 ?auto_608157 ) ) ( not ( = ?auto_608152 ?auto_608158 ) ) ( not ( = ?auto_608152 ?auto_608159 ) ) ( not ( = ?auto_608152 ?auto_608160 ) ) ( not ( = ?auto_608152 ?auto_608161 ) ) ( not ( = ?auto_608152 ?auto_608162 ) ) ( not ( = ?auto_608152 ?auto_608163 ) ) ( not ( = ?auto_608152 ?auto_608164 ) ) ( not ( = ?auto_608153 ?auto_608154 ) ) ( not ( = ?auto_608153 ?auto_608155 ) ) ( not ( = ?auto_608153 ?auto_608156 ) ) ( not ( = ?auto_608153 ?auto_608157 ) ) ( not ( = ?auto_608153 ?auto_608158 ) ) ( not ( = ?auto_608153 ?auto_608159 ) ) ( not ( = ?auto_608153 ?auto_608160 ) ) ( not ( = ?auto_608153 ?auto_608161 ) ) ( not ( = ?auto_608153 ?auto_608162 ) ) ( not ( = ?auto_608153 ?auto_608163 ) ) ( not ( = ?auto_608153 ?auto_608164 ) ) ( not ( = ?auto_608154 ?auto_608155 ) ) ( not ( = ?auto_608154 ?auto_608156 ) ) ( not ( = ?auto_608154 ?auto_608157 ) ) ( not ( = ?auto_608154 ?auto_608158 ) ) ( not ( = ?auto_608154 ?auto_608159 ) ) ( not ( = ?auto_608154 ?auto_608160 ) ) ( not ( = ?auto_608154 ?auto_608161 ) ) ( not ( = ?auto_608154 ?auto_608162 ) ) ( not ( = ?auto_608154 ?auto_608163 ) ) ( not ( = ?auto_608154 ?auto_608164 ) ) ( not ( = ?auto_608155 ?auto_608156 ) ) ( not ( = ?auto_608155 ?auto_608157 ) ) ( not ( = ?auto_608155 ?auto_608158 ) ) ( not ( = ?auto_608155 ?auto_608159 ) ) ( not ( = ?auto_608155 ?auto_608160 ) ) ( not ( = ?auto_608155 ?auto_608161 ) ) ( not ( = ?auto_608155 ?auto_608162 ) ) ( not ( = ?auto_608155 ?auto_608163 ) ) ( not ( = ?auto_608155 ?auto_608164 ) ) ( not ( = ?auto_608156 ?auto_608157 ) ) ( not ( = ?auto_608156 ?auto_608158 ) ) ( not ( = ?auto_608156 ?auto_608159 ) ) ( not ( = ?auto_608156 ?auto_608160 ) ) ( not ( = ?auto_608156 ?auto_608161 ) ) ( not ( = ?auto_608156 ?auto_608162 ) ) ( not ( = ?auto_608156 ?auto_608163 ) ) ( not ( = ?auto_608156 ?auto_608164 ) ) ( not ( = ?auto_608157 ?auto_608158 ) ) ( not ( = ?auto_608157 ?auto_608159 ) ) ( not ( = ?auto_608157 ?auto_608160 ) ) ( not ( = ?auto_608157 ?auto_608161 ) ) ( not ( = ?auto_608157 ?auto_608162 ) ) ( not ( = ?auto_608157 ?auto_608163 ) ) ( not ( = ?auto_608157 ?auto_608164 ) ) ( not ( = ?auto_608158 ?auto_608159 ) ) ( not ( = ?auto_608158 ?auto_608160 ) ) ( not ( = ?auto_608158 ?auto_608161 ) ) ( not ( = ?auto_608158 ?auto_608162 ) ) ( not ( = ?auto_608158 ?auto_608163 ) ) ( not ( = ?auto_608158 ?auto_608164 ) ) ( not ( = ?auto_608159 ?auto_608160 ) ) ( not ( = ?auto_608159 ?auto_608161 ) ) ( not ( = ?auto_608159 ?auto_608162 ) ) ( not ( = ?auto_608159 ?auto_608163 ) ) ( not ( = ?auto_608159 ?auto_608164 ) ) ( not ( = ?auto_608160 ?auto_608161 ) ) ( not ( = ?auto_608160 ?auto_608162 ) ) ( not ( = ?auto_608160 ?auto_608163 ) ) ( not ( = ?auto_608160 ?auto_608164 ) ) ( not ( = ?auto_608161 ?auto_608162 ) ) ( not ( = ?auto_608161 ?auto_608163 ) ) ( not ( = ?auto_608161 ?auto_608164 ) ) ( not ( = ?auto_608162 ?auto_608163 ) ) ( not ( = ?auto_608162 ?auto_608164 ) ) ( not ( = ?auto_608163 ?auto_608164 ) ) ( CLEAR ?auto_608161 ) ( ON ?auto_608162 ?auto_608163 ) ( CLEAR ?auto_608162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_608151 ?auto_608152 ?auto_608153 ?auto_608154 ?auto_608155 ?auto_608156 ?auto_608157 ?auto_608158 ?auto_608159 ?auto_608160 ?auto_608161 ?auto_608162 )
      ( MAKE-13PILE ?auto_608151 ?auto_608152 ?auto_608153 ?auto_608154 ?auto_608155 ?auto_608156 ?auto_608157 ?auto_608158 ?auto_608159 ?auto_608160 ?auto_608161 ?auto_608162 ?auto_608163 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608205 - BLOCK
      ?auto_608206 - BLOCK
      ?auto_608207 - BLOCK
      ?auto_608208 - BLOCK
      ?auto_608209 - BLOCK
      ?auto_608210 - BLOCK
      ?auto_608211 - BLOCK
      ?auto_608212 - BLOCK
      ?auto_608213 - BLOCK
      ?auto_608214 - BLOCK
      ?auto_608215 - BLOCK
      ?auto_608216 - BLOCK
      ?auto_608217 - BLOCK
    )
    :vars
    (
      ?auto_608218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608217 ?auto_608218 ) ( ON-TABLE ?auto_608205 ) ( ON ?auto_608206 ?auto_608205 ) ( ON ?auto_608207 ?auto_608206 ) ( ON ?auto_608208 ?auto_608207 ) ( ON ?auto_608209 ?auto_608208 ) ( ON ?auto_608210 ?auto_608209 ) ( ON ?auto_608211 ?auto_608210 ) ( ON ?auto_608212 ?auto_608211 ) ( ON ?auto_608213 ?auto_608212 ) ( ON ?auto_608214 ?auto_608213 ) ( not ( = ?auto_608205 ?auto_608206 ) ) ( not ( = ?auto_608205 ?auto_608207 ) ) ( not ( = ?auto_608205 ?auto_608208 ) ) ( not ( = ?auto_608205 ?auto_608209 ) ) ( not ( = ?auto_608205 ?auto_608210 ) ) ( not ( = ?auto_608205 ?auto_608211 ) ) ( not ( = ?auto_608205 ?auto_608212 ) ) ( not ( = ?auto_608205 ?auto_608213 ) ) ( not ( = ?auto_608205 ?auto_608214 ) ) ( not ( = ?auto_608205 ?auto_608215 ) ) ( not ( = ?auto_608205 ?auto_608216 ) ) ( not ( = ?auto_608205 ?auto_608217 ) ) ( not ( = ?auto_608205 ?auto_608218 ) ) ( not ( = ?auto_608206 ?auto_608207 ) ) ( not ( = ?auto_608206 ?auto_608208 ) ) ( not ( = ?auto_608206 ?auto_608209 ) ) ( not ( = ?auto_608206 ?auto_608210 ) ) ( not ( = ?auto_608206 ?auto_608211 ) ) ( not ( = ?auto_608206 ?auto_608212 ) ) ( not ( = ?auto_608206 ?auto_608213 ) ) ( not ( = ?auto_608206 ?auto_608214 ) ) ( not ( = ?auto_608206 ?auto_608215 ) ) ( not ( = ?auto_608206 ?auto_608216 ) ) ( not ( = ?auto_608206 ?auto_608217 ) ) ( not ( = ?auto_608206 ?auto_608218 ) ) ( not ( = ?auto_608207 ?auto_608208 ) ) ( not ( = ?auto_608207 ?auto_608209 ) ) ( not ( = ?auto_608207 ?auto_608210 ) ) ( not ( = ?auto_608207 ?auto_608211 ) ) ( not ( = ?auto_608207 ?auto_608212 ) ) ( not ( = ?auto_608207 ?auto_608213 ) ) ( not ( = ?auto_608207 ?auto_608214 ) ) ( not ( = ?auto_608207 ?auto_608215 ) ) ( not ( = ?auto_608207 ?auto_608216 ) ) ( not ( = ?auto_608207 ?auto_608217 ) ) ( not ( = ?auto_608207 ?auto_608218 ) ) ( not ( = ?auto_608208 ?auto_608209 ) ) ( not ( = ?auto_608208 ?auto_608210 ) ) ( not ( = ?auto_608208 ?auto_608211 ) ) ( not ( = ?auto_608208 ?auto_608212 ) ) ( not ( = ?auto_608208 ?auto_608213 ) ) ( not ( = ?auto_608208 ?auto_608214 ) ) ( not ( = ?auto_608208 ?auto_608215 ) ) ( not ( = ?auto_608208 ?auto_608216 ) ) ( not ( = ?auto_608208 ?auto_608217 ) ) ( not ( = ?auto_608208 ?auto_608218 ) ) ( not ( = ?auto_608209 ?auto_608210 ) ) ( not ( = ?auto_608209 ?auto_608211 ) ) ( not ( = ?auto_608209 ?auto_608212 ) ) ( not ( = ?auto_608209 ?auto_608213 ) ) ( not ( = ?auto_608209 ?auto_608214 ) ) ( not ( = ?auto_608209 ?auto_608215 ) ) ( not ( = ?auto_608209 ?auto_608216 ) ) ( not ( = ?auto_608209 ?auto_608217 ) ) ( not ( = ?auto_608209 ?auto_608218 ) ) ( not ( = ?auto_608210 ?auto_608211 ) ) ( not ( = ?auto_608210 ?auto_608212 ) ) ( not ( = ?auto_608210 ?auto_608213 ) ) ( not ( = ?auto_608210 ?auto_608214 ) ) ( not ( = ?auto_608210 ?auto_608215 ) ) ( not ( = ?auto_608210 ?auto_608216 ) ) ( not ( = ?auto_608210 ?auto_608217 ) ) ( not ( = ?auto_608210 ?auto_608218 ) ) ( not ( = ?auto_608211 ?auto_608212 ) ) ( not ( = ?auto_608211 ?auto_608213 ) ) ( not ( = ?auto_608211 ?auto_608214 ) ) ( not ( = ?auto_608211 ?auto_608215 ) ) ( not ( = ?auto_608211 ?auto_608216 ) ) ( not ( = ?auto_608211 ?auto_608217 ) ) ( not ( = ?auto_608211 ?auto_608218 ) ) ( not ( = ?auto_608212 ?auto_608213 ) ) ( not ( = ?auto_608212 ?auto_608214 ) ) ( not ( = ?auto_608212 ?auto_608215 ) ) ( not ( = ?auto_608212 ?auto_608216 ) ) ( not ( = ?auto_608212 ?auto_608217 ) ) ( not ( = ?auto_608212 ?auto_608218 ) ) ( not ( = ?auto_608213 ?auto_608214 ) ) ( not ( = ?auto_608213 ?auto_608215 ) ) ( not ( = ?auto_608213 ?auto_608216 ) ) ( not ( = ?auto_608213 ?auto_608217 ) ) ( not ( = ?auto_608213 ?auto_608218 ) ) ( not ( = ?auto_608214 ?auto_608215 ) ) ( not ( = ?auto_608214 ?auto_608216 ) ) ( not ( = ?auto_608214 ?auto_608217 ) ) ( not ( = ?auto_608214 ?auto_608218 ) ) ( not ( = ?auto_608215 ?auto_608216 ) ) ( not ( = ?auto_608215 ?auto_608217 ) ) ( not ( = ?auto_608215 ?auto_608218 ) ) ( not ( = ?auto_608216 ?auto_608217 ) ) ( not ( = ?auto_608216 ?auto_608218 ) ) ( not ( = ?auto_608217 ?auto_608218 ) ) ( ON ?auto_608216 ?auto_608217 ) ( CLEAR ?auto_608214 ) ( ON ?auto_608215 ?auto_608216 ) ( CLEAR ?auto_608215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_608205 ?auto_608206 ?auto_608207 ?auto_608208 ?auto_608209 ?auto_608210 ?auto_608211 ?auto_608212 ?auto_608213 ?auto_608214 ?auto_608215 )
      ( MAKE-13PILE ?auto_608205 ?auto_608206 ?auto_608207 ?auto_608208 ?auto_608209 ?auto_608210 ?auto_608211 ?auto_608212 ?auto_608213 ?auto_608214 ?auto_608215 ?auto_608216 ?auto_608217 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608259 - BLOCK
      ?auto_608260 - BLOCK
      ?auto_608261 - BLOCK
      ?auto_608262 - BLOCK
      ?auto_608263 - BLOCK
      ?auto_608264 - BLOCK
      ?auto_608265 - BLOCK
      ?auto_608266 - BLOCK
      ?auto_608267 - BLOCK
      ?auto_608268 - BLOCK
      ?auto_608269 - BLOCK
      ?auto_608270 - BLOCK
      ?auto_608271 - BLOCK
    )
    :vars
    (
      ?auto_608272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608271 ?auto_608272 ) ( ON-TABLE ?auto_608259 ) ( ON ?auto_608260 ?auto_608259 ) ( ON ?auto_608261 ?auto_608260 ) ( ON ?auto_608262 ?auto_608261 ) ( ON ?auto_608263 ?auto_608262 ) ( ON ?auto_608264 ?auto_608263 ) ( ON ?auto_608265 ?auto_608264 ) ( ON ?auto_608266 ?auto_608265 ) ( ON ?auto_608267 ?auto_608266 ) ( not ( = ?auto_608259 ?auto_608260 ) ) ( not ( = ?auto_608259 ?auto_608261 ) ) ( not ( = ?auto_608259 ?auto_608262 ) ) ( not ( = ?auto_608259 ?auto_608263 ) ) ( not ( = ?auto_608259 ?auto_608264 ) ) ( not ( = ?auto_608259 ?auto_608265 ) ) ( not ( = ?auto_608259 ?auto_608266 ) ) ( not ( = ?auto_608259 ?auto_608267 ) ) ( not ( = ?auto_608259 ?auto_608268 ) ) ( not ( = ?auto_608259 ?auto_608269 ) ) ( not ( = ?auto_608259 ?auto_608270 ) ) ( not ( = ?auto_608259 ?auto_608271 ) ) ( not ( = ?auto_608259 ?auto_608272 ) ) ( not ( = ?auto_608260 ?auto_608261 ) ) ( not ( = ?auto_608260 ?auto_608262 ) ) ( not ( = ?auto_608260 ?auto_608263 ) ) ( not ( = ?auto_608260 ?auto_608264 ) ) ( not ( = ?auto_608260 ?auto_608265 ) ) ( not ( = ?auto_608260 ?auto_608266 ) ) ( not ( = ?auto_608260 ?auto_608267 ) ) ( not ( = ?auto_608260 ?auto_608268 ) ) ( not ( = ?auto_608260 ?auto_608269 ) ) ( not ( = ?auto_608260 ?auto_608270 ) ) ( not ( = ?auto_608260 ?auto_608271 ) ) ( not ( = ?auto_608260 ?auto_608272 ) ) ( not ( = ?auto_608261 ?auto_608262 ) ) ( not ( = ?auto_608261 ?auto_608263 ) ) ( not ( = ?auto_608261 ?auto_608264 ) ) ( not ( = ?auto_608261 ?auto_608265 ) ) ( not ( = ?auto_608261 ?auto_608266 ) ) ( not ( = ?auto_608261 ?auto_608267 ) ) ( not ( = ?auto_608261 ?auto_608268 ) ) ( not ( = ?auto_608261 ?auto_608269 ) ) ( not ( = ?auto_608261 ?auto_608270 ) ) ( not ( = ?auto_608261 ?auto_608271 ) ) ( not ( = ?auto_608261 ?auto_608272 ) ) ( not ( = ?auto_608262 ?auto_608263 ) ) ( not ( = ?auto_608262 ?auto_608264 ) ) ( not ( = ?auto_608262 ?auto_608265 ) ) ( not ( = ?auto_608262 ?auto_608266 ) ) ( not ( = ?auto_608262 ?auto_608267 ) ) ( not ( = ?auto_608262 ?auto_608268 ) ) ( not ( = ?auto_608262 ?auto_608269 ) ) ( not ( = ?auto_608262 ?auto_608270 ) ) ( not ( = ?auto_608262 ?auto_608271 ) ) ( not ( = ?auto_608262 ?auto_608272 ) ) ( not ( = ?auto_608263 ?auto_608264 ) ) ( not ( = ?auto_608263 ?auto_608265 ) ) ( not ( = ?auto_608263 ?auto_608266 ) ) ( not ( = ?auto_608263 ?auto_608267 ) ) ( not ( = ?auto_608263 ?auto_608268 ) ) ( not ( = ?auto_608263 ?auto_608269 ) ) ( not ( = ?auto_608263 ?auto_608270 ) ) ( not ( = ?auto_608263 ?auto_608271 ) ) ( not ( = ?auto_608263 ?auto_608272 ) ) ( not ( = ?auto_608264 ?auto_608265 ) ) ( not ( = ?auto_608264 ?auto_608266 ) ) ( not ( = ?auto_608264 ?auto_608267 ) ) ( not ( = ?auto_608264 ?auto_608268 ) ) ( not ( = ?auto_608264 ?auto_608269 ) ) ( not ( = ?auto_608264 ?auto_608270 ) ) ( not ( = ?auto_608264 ?auto_608271 ) ) ( not ( = ?auto_608264 ?auto_608272 ) ) ( not ( = ?auto_608265 ?auto_608266 ) ) ( not ( = ?auto_608265 ?auto_608267 ) ) ( not ( = ?auto_608265 ?auto_608268 ) ) ( not ( = ?auto_608265 ?auto_608269 ) ) ( not ( = ?auto_608265 ?auto_608270 ) ) ( not ( = ?auto_608265 ?auto_608271 ) ) ( not ( = ?auto_608265 ?auto_608272 ) ) ( not ( = ?auto_608266 ?auto_608267 ) ) ( not ( = ?auto_608266 ?auto_608268 ) ) ( not ( = ?auto_608266 ?auto_608269 ) ) ( not ( = ?auto_608266 ?auto_608270 ) ) ( not ( = ?auto_608266 ?auto_608271 ) ) ( not ( = ?auto_608266 ?auto_608272 ) ) ( not ( = ?auto_608267 ?auto_608268 ) ) ( not ( = ?auto_608267 ?auto_608269 ) ) ( not ( = ?auto_608267 ?auto_608270 ) ) ( not ( = ?auto_608267 ?auto_608271 ) ) ( not ( = ?auto_608267 ?auto_608272 ) ) ( not ( = ?auto_608268 ?auto_608269 ) ) ( not ( = ?auto_608268 ?auto_608270 ) ) ( not ( = ?auto_608268 ?auto_608271 ) ) ( not ( = ?auto_608268 ?auto_608272 ) ) ( not ( = ?auto_608269 ?auto_608270 ) ) ( not ( = ?auto_608269 ?auto_608271 ) ) ( not ( = ?auto_608269 ?auto_608272 ) ) ( not ( = ?auto_608270 ?auto_608271 ) ) ( not ( = ?auto_608270 ?auto_608272 ) ) ( not ( = ?auto_608271 ?auto_608272 ) ) ( ON ?auto_608270 ?auto_608271 ) ( ON ?auto_608269 ?auto_608270 ) ( CLEAR ?auto_608267 ) ( ON ?auto_608268 ?auto_608269 ) ( CLEAR ?auto_608268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_608259 ?auto_608260 ?auto_608261 ?auto_608262 ?auto_608263 ?auto_608264 ?auto_608265 ?auto_608266 ?auto_608267 ?auto_608268 )
      ( MAKE-13PILE ?auto_608259 ?auto_608260 ?auto_608261 ?auto_608262 ?auto_608263 ?auto_608264 ?auto_608265 ?auto_608266 ?auto_608267 ?auto_608268 ?auto_608269 ?auto_608270 ?auto_608271 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608313 - BLOCK
      ?auto_608314 - BLOCK
      ?auto_608315 - BLOCK
      ?auto_608316 - BLOCK
      ?auto_608317 - BLOCK
      ?auto_608318 - BLOCK
      ?auto_608319 - BLOCK
      ?auto_608320 - BLOCK
      ?auto_608321 - BLOCK
      ?auto_608322 - BLOCK
      ?auto_608323 - BLOCK
      ?auto_608324 - BLOCK
      ?auto_608325 - BLOCK
    )
    :vars
    (
      ?auto_608326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608325 ?auto_608326 ) ( ON-TABLE ?auto_608313 ) ( ON ?auto_608314 ?auto_608313 ) ( ON ?auto_608315 ?auto_608314 ) ( ON ?auto_608316 ?auto_608315 ) ( ON ?auto_608317 ?auto_608316 ) ( ON ?auto_608318 ?auto_608317 ) ( ON ?auto_608319 ?auto_608318 ) ( ON ?auto_608320 ?auto_608319 ) ( not ( = ?auto_608313 ?auto_608314 ) ) ( not ( = ?auto_608313 ?auto_608315 ) ) ( not ( = ?auto_608313 ?auto_608316 ) ) ( not ( = ?auto_608313 ?auto_608317 ) ) ( not ( = ?auto_608313 ?auto_608318 ) ) ( not ( = ?auto_608313 ?auto_608319 ) ) ( not ( = ?auto_608313 ?auto_608320 ) ) ( not ( = ?auto_608313 ?auto_608321 ) ) ( not ( = ?auto_608313 ?auto_608322 ) ) ( not ( = ?auto_608313 ?auto_608323 ) ) ( not ( = ?auto_608313 ?auto_608324 ) ) ( not ( = ?auto_608313 ?auto_608325 ) ) ( not ( = ?auto_608313 ?auto_608326 ) ) ( not ( = ?auto_608314 ?auto_608315 ) ) ( not ( = ?auto_608314 ?auto_608316 ) ) ( not ( = ?auto_608314 ?auto_608317 ) ) ( not ( = ?auto_608314 ?auto_608318 ) ) ( not ( = ?auto_608314 ?auto_608319 ) ) ( not ( = ?auto_608314 ?auto_608320 ) ) ( not ( = ?auto_608314 ?auto_608321 ) ) ( not ( = ?auto_608314 ?auto_608322 ) ) ( not ( = ?auto_608314 ?auto_608323 ) ) ( not ( = ?auto_608314 ?auto_608324 ) ) ( not ( = ?auto_608314 ?auto_608325 ) ) ( not ( = ?auto_608314 ?auto_608326 ) ) ( not ( = ?auto_608315 ?auto_608316 ) ) ( not ( = ?auto_608315 ?auto_608317 ) ) ( not ( = ?auto_608315 ?auto_608318 ) ) ( not ( = ?auto_608315 ?auto_608319 ) ) ( not ( = ?auto_608315 ?auto_608320 ) ) ( not ( = ?auto_608315 ?auto_608321 ) ) ( not ( = ?auto_608315 ?auto_608322 ) ) ( not ( = ?auto_608315 ?auto_608323 ) ) ( not ( = ?auto_608315 ?auto_608324 ) ) ( not ( = ?auto_608315 ?auto_608325 ) ) ( not ( = ?auto_608315 ?auto_608326 ) ) ( not ( = ?auto_608316 ?auto_608317 ) ) ( not ( = ?auto_608316 ?auto_608318 ) ) ( not ( = ?auto_608316 ?auto_608319 ) ) ( not ( = ?auto_608316 ?auto_608320 ) ) ( not ( = ?auto_608316 ?auto_608321 ) ) ( not ( = ?auto_608316 ?auto_608322 ) ) ( not ( = ?auto_608316 ?auto_608323 ) ) ( not ( = ?auto_608316 ?auto_608324 ) ) ( not ( = ?auto_608316 ?auto_608325 ) ) ( not ( = ?auto_608316 ?auto_608326 ) ) ( not ( = ?auto_608317 ?auto_608318 ) ) ( not ( = ?auto_608317 ?auto_608319 ) ) ( not ( = ?auto_608317 ?auto_608320 ) ) ( not ( = ?auto_608317 ?auto_608321 ) ) ( not ( = ?auto_608317 ?auto_608322 ) ) ( not ( = ?auto_608317 ?auto_608323 ) ) ( not ( = ?auto_608317 ?auto_608324 ) ) ( not ( = ?auto_608317 ?auto_608325 ) ) ( not ( = ?auto_608317 ?auto_608326 ) ) ( not ( = ?auto_608318 ?auto_608319 ) ) ( not ( = ?auto_608318 ?auto_608320 ) ) ( not ( = ?auto_608318 ?auto_608321 ) ) ( not ( = ?auto_608318 ?auto_608322 ) ) ( not ( = ?auto_608318 ?auto_608323 ) ) ( not ( = ?auto_608318 ?auto_608324 ) ) ( not ( = ?auto_608318 ?auto_608325 ) ) ( not ( = ?auto_608318 ?auto_608326 ) ) ( not ( = ?auto_608319 ?auto_608320 ) ) ( not ( = ?auto_608319 ?auto_608321 ) ) ( not ( = ?auto_608319 ?auto_608322 ) ) ( not ( = ?auto_608319 ?auto_608323 ) ) ( not ( = ?auto_608319 ?auto_608324 ) ) ( not ( = ?auto_608319 ?auto_608325 ) ) ( not ( = ?auto_608319 ?auto_608326 ) ) ( not ( = ?auto_608320 ?auto_608321 ) ) ( not ( = ?auto_608320 ?auto_608322 ) ) ( not ( = ?auto_608320 ?auto_608323 ) ) ( not ( = ?auto_608320 ?auto_608324 ) ) ( not ( = ?auto_608320 ?auto_608325 ) ) ( not ( = ?auto_608320 ?auto_608326 ) ) ( not ( = ?auto_608321 ?auto_608322 ) ) ( not ( = ?auto_608321 ?auto_608323 ) ) ( not ( = ?auto_608321 ?auto_608324 ) ) ( not ( = ?auto_608321 ?auto_608325 ) ) ( not ( = ?auto_608321 ?auto_608326 ) ) ( not ( = ?auto_608322 ?auto_608323 ) ) ( not ( = ?auto_608322 ?auto_608324 ) ) ( not ( = ?auto_608322 ?auto_608325 ) ) ( not ( = ?auto_608322 ?auto_608326 ) ) ( not ( = ?auto_608323 ?auto_608324 ) ) ( not ( = ?auto_608323 ?auto_608325 ) ) ( not ( = ?auto_608323 ?auto_608326 ) ) ( not ( = ?auto_608324 ?auto_608325 ) ) ( not ( = ?auto_608324 ?auto_608326 ) ) ( not ( = ?auto_608325 ?auto_608326 ) ) ( ON ?auto_608324 ?auto_608325 ) ( ON ?auto_608323 ?auto_608324 ) ( ON ?auto_608322 ?auto_608323 ) ( CLEAR ?auto_608320 ) ( ON ?auto_608321 ?auto_608322 ) ( CLEAR ?auto_608321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_608313 ?auto_608314 ?auto_608315 ?auto_608316 ?auto_608317 ?auto_608318 ?auto_608319 ?auto_608320 ?auto_608321 )
      ( MAKE-13PILE ?auto_608313 ?auto_608314 ?auto_608315 ?auto_608316 ?auto_608317 ?auto_608318 ?auto_608319 ?auto_608320 ?auto_608321 ?auto_608322 ?auto_608323 ?auto_608324 ?auto_608325 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608367 - BLOCK
      ?auto_608368 - BLOCK
      ?auto_608369 - BLOCK
      ?auto_608370 - BLOCK
      ?auto_608371 - BLOCK
      ?auto_608372 - BLOCK
      ?auto_608373 - BLOCK
      ?auto_608374 - BLOCK
      ?auto_608375 - BLOCK
      ?auto_608376 - BLOCK
      ?auto_608377 - BLOCK
      ?auto_608378 - BLOCK
      ?auto_608379 - BLOCK
    )
    :vars
    (
      ?auto_608380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608379 ?auto_608380 ) ( ON-TABLE ?auto_608367 ) ( ON ?auto_608368 ?auto_608367 ) ( ON ?auto_608369 ?auto_608368 ) ( ON ?auto_608370 ?auto_608369 ) ( ON ?auto_608371 ?auto_608370 ) ( ON ?auto_608372 ?auto_608371 ) ( ON ?auto_608373 ?auto_608372 ) ( not ( = ?auto_608367 ?auto_608368 ) ) ( not ( = ?auto_608367 ?auto_608369 ) ) ( not ( = ?auto_608367 ?auto_608370 ) ) ( not ( = ?auto_608367 ?auto_608371 ) ) ( not ( = ?auto_608367 ?auto_608372 ) ) ( not ( = ?auto_608367 ?auto_608373 ) ) ( not ( = ?auto_608367 ?auto_608374 ) ) ( not ( = ?auto_608367 ?auto_608375 ) ) ( not ( = ?auto_608367 ?auto_608376 ) ) ( not ( = ?auto_608367 ?auto_608377 ) ) ( not ( = ?auto_608367 ?auto_608378 ) ) ( not ( = ?auto_608367 ?auto_608379 ) ) ( not ( = ?auto_608367 ?auto_608380 ) ) ( not ( = ?auto_608368 ?auto_608369 ) ) ( not ( = ?auto_608368 ?auto_608370 ) ) ( not ( = ?auto_608368 ?auto_608371 ) ) ( not ( = ?auto_608368 ?auto_608372 ) ) ( not ( = ?auto_608368 ?auto_608373 ) ) ( not ( = ?auto_608368 ?auto_608374 ) ) ( not ( = ?auto_608368 ?auto_608375 ) ) ( not ( = ?auto_608368 ?auto_608376 ) ) ( not ( = ?auto_608368 ?auto_608377 ) ) ( not ( = ?auto_608368 ?auto_608378 ) ) ( not ( = ?auto_608368 ?auto_608379 ) ) ( not ( = ?auto_608368 ?auto_608380 ) ) ( not ( = ?auto_608369 ?auto_608370 ) ) ( not ( = ?auto_608369 ?auto_608371 ) ) ( not ( = ?auto_608369 ?auto_608372 ) ) ( not ( = ?auto_608369 ?auto_608373 ) ) ( not ( = ?auto_608369 ?auto_608374 ) ) ( not ( = ?auto_608369 ?auto_608375 ) ) ( not ( = ?auto_608369 ?auto_608376 ) ) ( not ( = ?auto_608369 ?auto_608377 ) ) ( not ( = ?auto_608369 ?auto_608378 ) ) ( not ( = ?auto_608369 ?auto_608379 ) ) ( not ( = ?auto_608369 ?auto_608380 ) ) ( not ( = ?auto_608370 ?auto_608371 ) ) ( not ( = ?auto_608370 ?auto_608372 ) ) ( not ( = ?auto_608370 ?auto_608373 ) ) ( not ( = ?auto_608370 ?auto_608374 ) ) ( not ( = ?auto_608370 ?auto_608375 ) ) ( not ( = ?auto_608370 ?auto_608376 ) ) ( not ( = ?auto_608370 ?auto_608377 ) ) ( not ( = ?auto_608370 ?auto_608378 ) ) ( not ( = ?auto_608370 ?auto_608379 ) ) ( not ( = ?auto_608370 ?auto_608380 ) ) ( not ( = ?auto_608371 ?auto_608372 ) ) ( not ( = ?auto_608371 ?auto_608373 ) ) ( not ( = ?auto_608371 ?auto_608374 ) ) ( not ( = ?auto_608371 ?auto_608375 ) ) ( not ( = ?auto_608371 ?auto_608376 ) ) ( not ( = ?auto_608371 ?auto_608377 ) ) ( not ( = ?auto_608371 ?auto_608378 ) ) ( not ( = ?auto_608371 ?auto_608379 ) ) ( not ( = ?auto_608371 ?auto_608380 ) ) ( not ( = ?auto_608372 ?auto_608373 ) ) ( not ( = ?auto_608372 ?auto_608374 ) ) ( not ( = ?auto_608372 ?auto_608375 ) ) ( not ( = ?auto_608372 ?auto_608376 ) ) ( not ( = ?auto_608372 ?auto_608377 ) ) ( not ( = ?auto_608372 ?auto_608378 ) ) ( not ( = ?auto_608372 ?auto_608379 ) ) ( not ( = ?auto_608372 ?auto_608380 ) ) ( not ( = ?auto_608373 ?auto_608374 ) ) ( not ( = ?auto_608373 ?auto_608375 ) ) ( not ( = ?auto_608373 ?auto_608376 ) ) ( not ( = ?auto_608373 ?auto_608377 ) ) ( not ( = ?auto_608373 ?auto_608378 ) ) ( not ( = ?auto_608373 ?auto_608379 ) ) ( not ( = ?auto_608373 ?auto_608380 ) ) ( not ( = ?auto_608374 ?auto_608375 ) ) ( not ( = ?auto_608374 ?auto_608376 ) ) ( not ( = ?auto_608374 ?auto_608377 ) ) ( not ( = ?auto_608374 ?auto_608378 ) ) ( not ( = ?auto_608374 ?auto_608379 ) ) ( not ( = ?auto_608374 ?auto_608380 ) ) ( not ( = ?auto_608375 ?auto_608376 ) ) ( not ( = ?auto_608375 ?auto_608377 ) ) ( not ( = ?auto_608375 ?auto_608378 ) ) ( not ( = ?auto_608375 ?auto_608379 ) ) ( not ( = ?auto_608375 ?auto_608380 ) ) ( not ( = ?auto_608376 ?auto_608377 ) ) ( not ( = ?auto_608376 ?auto_608378 ) ) ( not ( = ?auto_608376 ?auto_608379 ) ) ( not ( = ?auto_608376 ?auto_608380 ) ) ( not ( = ?auto_608377 ?auto_608378 ) ) ( not ( = ?auto_608377 ?auto_608379 ) ) ( not ( = ?auto_608377 ?auto_608380 ) ) ( not ( = ?auto_608378 ?auto_608379 ) ) ( not ( = ?auto_608378 ?auto_608380 ) ) ( not ( = ?auto_608379 ?auto_608380 ) ) ( ON ?auto_608378 ?auto_608379 ) ( ON ?auto_608377 ?auto_608378 ) ( ON ?auto_608376 ?auto_608377 ) ( ON ?auto_608375 ?auto_608376 ) ( CLEAR ?auto_608373 ) ( ON ?auto_608374 ?auto_608375 ) ( CLEAR ?auto_608374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_608367 ?auto_608368 ?auto_608369 ?auto_608370 ?auto_608371 ?auto_608372 ?auto_608373 ?auto_608374 )
      ( MAKE-13PILE ?auto_608367 ?auto_608368 ?auto_608369 ?auto_608370 ?auto_608371 ?auto_608372 ?auto_608373 ?auto_608374 ?auto_608375 ?auto_608376 ?auto_608377 ?auto_608378 ?auto_608379 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608421 - BLOCK
      ?auto_608422 - BLOCK
      ?auto_608423 - BLOCK
      ?auto_608424 - BLOCK
      ?auto_608425 - BLOCK
      ?auto_608426 - BLOCK
      ?auto_608427 - BLOCK
      ?auto_608428 - BLOCK
      ?auto_608429 - BLOCK
      ?auto_608430 - BLOCK
      ?auto_608431 - BLOCK
      ?auto_608432 - BLOCK
      ?auto_608433 - BLOCK
    )
    :vars
    (
      ?auto_608434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608433 ?auto_608434 ) ( ON-TABLE ?auto_608421 ) ( ON ?auto_608422 ?auto_608421 ) ( ON ?auto_608423 ?auto_608422 ) ( ON ?auto_608424 ?auto_608423 ) ( ON ?auto_608425 ?auto_608424 ) ( ON ?auto_608426 ?auto_608425 ) ( not ( = ?auto_608421 ?auto_608422 ) ) ( not ( = ?auto_608421 ?auto_608423 ) ) ( not ( = ?auto_608421 ?auto_608424 ) ) ( not ( = ?auto_608421 ?auto_608425 ) ) ( not ( = ?auto_608421 ?auto_608426 ) ) ( not ( = ?auto_608421 ?auto_608427 ) ) ( not ( = ?auto_608421 ?auto_608428 ) ) ( not ( = ?auto_608421 ?auto_608429 ) ) ( not ( = ?auto_608421 ?auto_608430 ) ) ( not ( = ?auto_608421 ?auto_608431 ) ) ( not ( = ?auto_608421 ?auto_608432 ) ) ( not ( = ?auto_608421 ?auto_608433 ) ) ( not ( = ?auto_608421 ?auto_608434 ) ) ( not ( = ?auto_608422 ?auto_608423 ) ) ( not ( = ?auto_608422 ?auto_608424 ) ) ( not ( = ?auto_608422 ?auto_608425 ) ) ( not ( = ?auto_608422 ?auto_608426 ) ) ( not ( = ?auto_608422 ?auto_608427 ) ) ( not ( = ?auto_608422 ?auto_608428 ) ) ( not ( = ?auto_608422 ?auto_608429 ) ) ( not ( = ?auto_608422 ?auto_608430 ) ) ( not ( = ?auto_608422 ?auto_608431 ) ) ( not ( = ?auto_608422 ?auto_608432 ) ) ( not ( = ?auto_608422 ?auto_608433 ) ) ( not ( = ?auto_608422 ?auto_608434 ) ) ( not ( = ?auto_608423 ?auto_608424 ) ) ( not ( = ?auto_608423 ?auto_608425 ) ) ( not ( = ?auto_608423 ?auto_608426 ) ) ( not ( = ?auto_608423 ?auto_608427 ) ) ( not ( = ?auto_608423 ?auto_608428 ) ) ( not ( = ?auto_608423 ?auto_608429 ) ) ( not ( = ?auto_608423 ?auto_608430 ) ) ( not ( = ?auto_608423 ?auto_608431 ) ) ( not ( = ?auto_608423 ?auto_608432 ) ) ( not ( = ?auto_608423 ?auto_608433 ) ) ( not ( = ?auto_608423 ?auto_608434 ) ) ( not ( = ?auto_608424 ?auto_608425 ) ) ( not ( = ?auto_608424 ?auto_608426 ) ) ( not ( = ?auto_608424 ?auto_608427 ) ) ( not ( = ?auto_608424 ?auto_608428 ) ) ( not ( = ?auto_608424 ?auto_608429 ) ) ( not ( = ?auto_608424 ?auto_608430 ) ) ( not ( = ?auto_608424 ?auto_608431 ) ) ( not ( = ?auto_608424 ?auto_608432 ) ) ( not ( = ?auto_608424 ?auto_608433 ) ) ( not ( = ?auto_608424 ?auto_608434 ) ) ( not ( = ?auto_608425 ?auto_608426 ) ) ( not ( = ?auto_608425 ?auto_608427 ) ) ( not ( = ?auto_608425 ?auto_608428 ) ) ( not ( = ?auto_608425 ?auto_608429 ) ) ( not ( = ?auto_608425 ?auto_608430 ) ) ( not ( = ?auto_608425 ?auto_608431 ) ) ( not ( = ?auto_608425 ?auto_608432 ) ) ( not ( = ?auto_608425 ?auto_608433 ) ) ( not ( = ?auto_608425 ?auto_608434 ) ) ( not ( = ?auto_608426 ?auto_608427 ) ) ( not ( = ?auto_608426 ?auto_608428 ) ) ( not ( = ?auto_608426 ?auto_608429 ) ) ( not ( = ?auto_608426 ?auto_608430 ) ) ( not ( = ?auto_608426 ?auto_608431 ) ) ( not ( = ?auto_608426 ?auto_608432 ) ) ( not ( = ?auto_608426 ?auto_608433 ) ) ( not ( = ?auto_608426 ?auto_608434 ) ) ( not ( = ?auto_608427 ?auto_608428 ) ) ( not ( = ?auto_608427 ?auto_608429 ) ) ( not ( = ?auto_608427 ?auto_608430 ) ) ( not ( = ?auto_608427 ?auto_608431 ) ) ( not ( = ?auto_608427 ?auto_608432 ) ) ( not ( = ?auto_608427 ?auto_608433 ) ) ( not ( = ?auto_608427 ?auto_608434 ) ) ( not ( = ?auto_608428 ?auto_608429 ) ) ( not ( = ?auto_608428 ?auto_608430 ) ) ( not ( = ?auto_608428 ?auto_608431 ) ) ( not ( = ?auto_608428 ?auto_608432 ) ) ( not ( = ?auto_608428 ?auto_608433 ) ) ( not ( = ?auto_608428 ?auto_608434 ) ) ( not ( = ?auto_608429 ?auto_608430 ) ) ( not ( = ?auto_608429 ?auto_608431 ) ) ( not ( = ?auto_608429 ?auto_608432 ) ) ( not ( = ?auto_608429 ?auto_608433 ) ) ( not ( = ?auto_608429 ?auto_608434 ) ) ( not ( = ?auto_608430 ?auto_608431 ) ) ( not ( = ?auto_608430 ?auto_608432 ) ) ( not ( = ?auto_608430 ?auto_608433 ) ) ( not ( = ?auto_608430 ?auto_608434 ) ) ( not ( = ?auto_608431 ?auto_608432 ) ) ( not ( = ?auto_608431 ?auto_608433 ) ) ( not ( = ?auto_608431 ?auto_608434 ) ) ( not ( = ?auto_608432 ?auto_608433 ) ) ( not ( = ?auto_608432 ?auto_608434 ) ) ( not ( = ?auto_608433 ?auto_608434 ) ) ( ON ?auto_608432 ?auto_608433 ) ( ON ?auto_608431 ?auto_608432 ) ( ON ?auto_608430 ?auto_608431 ) ( ON ?auto_608429 ?auto_608430 ) ( ON ?auto_608428 ?auto_608429 ) ( CLEAR ?auto_608426 ) ( ON ?auto_608427 ?auto_608428 ) ( CLEAR ?auto_608427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_608421 ?auto_608422 ?auto_608423 ?auto_608424 ?auto_608425 ?auto_608426 ?auto_608427 )
      ( MAKE-13PILE ?auto_608421 ?auto_608422 ?auto_608423 ?auto_608424 ?auto_608425 ?auto_608426 ?auto_608427 ?auto_608428 ?auto_608429 ?auto_608430 ?auto_608431 ?auto_608432 ?auto_608433 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608475 - BLOCK
      ?auto_608476 - BLOCK
      ?auto_608477 - BLOCK
      ?auto_608478 - BLOCK
      ?auto_608479 - BLOCK
      ?auto_608480 - BLOCK
      ?auto_608481 - BLOCK
      ?auto_608482 - BLOCK
      ?auto_608483 - BLOCK
      ?auto_608484 - BLOCK
      ?auto_608485 - BLOCK
      ?auto_608486 - BLOCK
      ?auto_608487 - BLOCK
    )
    :vars
    (
      ?auto_608488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608487 ?auto_608488 ) ( ON-TABLE ?auto_608475 ) ( ON ?auto_608476 ?auto_608475 ) ( ON ?auto_608477 ?auto_608476 ) ( ON ?auto_608478 ?auto_608477 ) ( ON ?auto_608479 ?auto_608478 ) ( not ( = ?auto_608475 ?auto_608476 ) ) ( not ( = ?auto_608475 ?auto_608477 ) ) ( not ( = ?auto_608475 ?auto_608478 ) ) ( not ( = ?auto_608475 ?auto_608479 ) ) ( not ( = ?auto_608475 ?auto_608480 ) ) ( not ( = ?auto_608475 ?auto_608481 ) ) ( not ( = ?auto_608475 ?auto_608482 ) ) ( not ( = ?auto_608475 ?auto_608483 ) ) ( not ( = ?auto_608475 ?auto_608484 ) ) ( not ( = ?auto_608475 ?auto_608485 ) ) ( not ( = ?auto_608475 ?auto_608486 ) ) ( not ( = ?auto_608475 ?auto_608487 ) ) ( not ( = ?auto_608475 ?auto_608488 ) ) ( not ( = ?auto_608476 ?auto_608477 ) ) ( not ( = ?auto_608476 ?auto_608478 ) ) ( not ( = ?auto_608476 ?auto_608479 ) ) ( not ( = ?auto_608476 ?auto_608480 ) ) ( not ( = ?auto_608476 ?auto_608481 ) ) ( not ( = ?auto_608476 ?auto_608482 ) ) ( not ( = ?auto_608476 ?auto_608483 ) ) ( not ( = ?auto_608476 ?auto_608484 ) ) ( not ( = ?auto_608476 ?auto_608485 ) ) ( not ( = ?auto_608476 ?auto_608486 ) ) ( not ( = ?auto_608476 ?auto_608487 ) ) ( not ( = ?auto_608476 ?auto_608488 ) ) ( not ( = ?auto_608477 ?auto_608478 ) ) ( not ( = ?auto_608477 ?auto_608479 ) ) ( not ( = ?auto_608477 ?auto_608480 ) ) ( not ( = ?auto_608477 ?auto_608481 ) ) ( not ( = ?auto_608477 ?auto_608482 ) ) ( not ( = ?auto_608477 ?auto_608483 ) ) ( not ( = ?auto_608477 ?auto_608484 ) ) ( not ( = ?auto_608477 ?auto_608485 ) ) ( not ( = ?auto_608477 ?auto_608486 ) ) ( not ( = ?auto_608477 ?auto_608487 ) ) ( not ( = ?auto_608477 ?auto_608488 ) ) ( not ( = ?auto_608478 ?auto_608479 ) ) ( not ( = ?auto_608478 ?auto_608480 ) ) ( not ( = ?auto_608478 ?auto_608481 ) ) ( not ( = ?auto_608478 ?auto_608482 ) ) ( not ( = ?auto_608478 ?auto_608483 ) ) ( not ( = ?auto_608478 ?auto_608484 ) ) ( not ( = ?auto_608478 ?auto_608485 ) ) ( not ( = ?auto_608478 ?auto_608486 ) ) ( not ( = ?auto_608478 ?auto_608487 ) ) ( not ( = ?auto_608478 ?auto_608488 ) ) ( not ( = ?auto_608479 ?auto_608480 ) ) ( not ( = ?auto_608479 ?auto_608481 ) ) ( not ( = ?auto_608479 ?auto_608482 ) ) ( not ( = ?auto_608479 ?auto_608483 ) ) ( not ( = ?auto_608479 ?auto_608484 ) ) ( not ( = ?auto_608479 ?auto_608485 ) ) ( not ( = ?auto_608479 ?auto_608486 ) ) ( not ( = ?auto_608479 ?auto_608487 ) ) ( not ( = ?auto_608479 ?auto_608488 ) ) ( not ( = ?auto_608480 ?auto_608481 ) ) ( not ( = ?auto_608480 ?auto_608482 ) ) ( not ( = ?auto_608480 ?auto_608483 ) ) ( not ( = ?auto_608480 ?auto_608484 ) ) ( not ( = ?auto_608480 ?auto_608485 ) ) ( not ( = ?auto_608480 ?auto_608486 ) ) ( not ( = ?auto_608480 ?auto_608487 ) ) ( not ( = ?auto_608480 ?auto_608488 ) ) ( not ( = ?auto_608481 ?auto_608482 ) ) ( not ( = ?auto_608481 ?auto_608483 ) ) ( not ( = ?auto_608481 ?auto_608484 ) ) ( not ( = ?auto_608481 ?auto_608485 ) ) ( not ( = ?auto_608481 ?auto_608486 ) ) ( not ( = ?auto_608481 ?auto_608487 ) ) ( not ( = ?auto_608481 ?auto_608488 ) ) ( not ( = ?auto_608482 ?auto_608483 ) ) ( not ( = ?auto_608482 ?auto_608484 ) ) ( not ( = ?auto_608482 ?auto_608485 ) ) ( not ( = ?auto_608482 ?auto_608486 ) ) ( not ( = ?auto_608482 ?auto_608487 ) ) ( not ( = ?auto_608482 ?auto_608488 ) ) ( not ( = ?auto_608483 ?auto_608484 ) ) ( not ( = ?auto_608483 ?auto_608485 ) ) ( not ( = ?auto_608483 ?auto_608486 ) ) ( not ( = ?auto_608483 ?auto_608487 ) ) ( not ( = ?auto_608483 ?auto_608488 ) ) ( not ( = ?auto_608484 ?auto_608485 ) ) ( not ( = ?auto_608484 ?auto_608486 ) ) ( not ( = ?auto_608484 ?auto_608487 ) ) ( not ( = ?auto_608484 ?auto_608488 ) ) ( not ( = ?auto_608485 ?auto_608486 ) ) ( not ( = ?auto_608485 ?auto_608487 ) ) ( not ( = ?auto_608485 ?auto_608488 ) ) ( not ( = ?auto_608486 ?auto_608487 ) ) ( not ( = ?auto_608486 ?auto_608488 ) ) ( not ( = ?auto_608487 ?auto_608488 ) ) ( ON ?auto_608486 ?auto_608487 ) ( ON ?auto_608485 ?auto_608486 ) ( ON ?auto_608484 ?auto_608485 ) ( ON ?auto_608483 ?auto_608484 ) ( ON ?auto_608482 ?auto_608483 ) ( ON ?auto_608481 ?auto_608482 ) ( CLEAR ?auto_608479 ) ( ON ?auto_608480 ?auto_608481 ) ( CLEAR ?auto_608480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_608475 ?auto_608476 ?auto_608477 ?auto_608478 ?auto_608479 ?auto_608480 )
      ( MAKE-13PILE ?auto_608475 ?auto_608476 ?auto_608477 ?auto_608478 ?auto_608479 ?auto_608480 ?auto_608481 ?auto_608482 ?auto_608483 ?auto_608484 ?auto_608485 ?auto_608486 ?auto_608487 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608529 - BLOCK
      ?auto_608530 - BLOCK
      ?auto_608531 - BLOCK
      ?auto_608532 - BLOCK
      ?auto_608533 - BLOCK
      ?auto_608534 - BLOCK
      ?auto_608535 - BLOCK
      ?auto_608536 - BLOCK
      ?auto_608537 - BLOCK
      ?auto_608538 - BLOCK
      ?auto_608539 - BLOCK
      ?auto_608540 - BLOCK
      ?auto_608541 - BLOCK
    )
    :vars
    (
      ?auto_608542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608541 ?auto_608542 ) ( ON-TABLE ?auto_608529 ) ( ON ?auto_608530 ?auto_608529 ) ( ON ?auto_608531 ?auto_608530 ) ( ON ?auto_608532 ?auto_608531 ) ( not ( = ?auto_608529 ?auto_608530 ) ) ( not ( = ?auto_608529 ?auto_608531 ) ) ( not ( = ?auto_608529 ?auto_608532 ) ) ( not ( = ?auto_608529 ?auto_608533 ) ) ( not ( = ?auto_608529 ?auto_608534 ) ) ( not ( = ?auto_608529 ?auto_608535 ) ) ( not ( = ?auto_608529 ?auto_608536 ) ) ( not ( = ?auto_608529 ?auto_608537 ) ) ( not ( = ?auto_608529 ?auto_608538 ) ) ( not ( = ?auto_608529 ?auto_608539 ) ) ( not ( = ?auto_608529 ?auto_608540 ) ) ( not ( = ?auto_608529 ?auto_608541 ) ) ( not ( = ?auto_608529 ?auto_608542 ) ) ( not ( = ?auto_608530 ?auto_608531 ) ) ( not ( = ?auto_608530 ?auto_608532 ) ) ( not ( = ?auto_608530 ?auto_608533 ) ) ( not ( = ?auto_608530 ?auto_608534 ) ) ( not ( = ?auto_608530 ?auto_608535 ) ) ( not ( = ?auto_608530 ?auto_608536 ) ) ( not ( = ?auto_608530 ?auto_608537 ) ) ( not ( = ?auto_608530 ?auto_608538 ) ) ( not ( = ?auto_608530 ?auto_608539 ) ) ( not ( = ?auto_608530 ?auto_608540 ) ) ( not ( = ?auto_608530 ?auto_608541 ) ) ( not ( = ?auto_608530 ?auto_608542 ) ) ( not ( = ?auto_608531 ?auto_608532 ) ) ( not ( = ?auto_608531 ?auto_608533 ) ) ( not ( = ?auto_608531 ?auto_608534 ) ) ( not ( = ?auto_608531 ?auto_608535 ) ) ( not ( = ?auto_608531 ?auto_608536 ) ) ( not ( = ?auto_608531 ?auto_608537 ) ) ( not ( = ?auto_608531 ?auto_608538 ) ) ( not ( = ?auto_608531 ?auto_608539 ) ) ( not ( = ?auto_608531 ?auto_608540 ) ) ( not ( = ?auto_608531 ?auto_608541 ) ) ( not ( = ?auto_608531 ?auto_608542 ) ) ( not ( = ?auto_608532 ?auto_608533 ) ) ( not ( = ?auto_608532 ?auto_608534 ) ) ( not ( = ?auto_608532 ?auto_608535 ) ) ( not ( = ?auto_608532 ?auto_608536 ) ) ( not ( = ?auto_608532 ?auto_608537 ) ) ( not ( = ?auto_608532 ?auto_608538 ) ) ( not ( = ?auto_608532 ?auto_608539 ) ) ( not ( = ?auto_608532 ?auto_608540 ) ) ( not ( = ?auto_608532 ?auto_608541 ) ) ( not ( = ?auto_608532 ?auto_608542 ) ) ( not ( = ?auto_608533 ?auto_608534 ) ) ( not ( = ?auto_608533 ?auto_608535 ) ) ( not ( = ?auto_608533 ?auto_608536 ) ) ( not ( = ?auto_608533 ?auto_608537 ) ) ( not ( = ?auto_608533 ?auto_608538 ) ) ( not ( = ?auto_608533 ?auto_608539 ) ) ( not ( = ?auto_608533 ?auto_608540 ) ) ( not ( = ?auto_608533 ?auto_608541 ) ) ( not ( = ?auto_608533 ?auto_608542 ) ) ( not ( = ?auto_608534 ?auto_608535 ) ) ( not ( = ?auto_608534 ?auto_608536 ) ) ( not ( = ?auto_608534 ?auto_608537 ) ) ( not ( = ?auto_608534 ?auto_608538 ) ) ( not ( = ?auto_608534 ?auto_608539 ) ) ( not ( = ?auto_608534 ?auto_608540 ) ) ( not ( = ?auto_608534 ?auto_608541 ) ) ( not ( = ?auto_608534 ?auto_608542 ) ) ( not ( = ?auto_608535 ?auto_608536 ) ) ( not ( = ?auto_608535 ?auto_608537 ) ) ( not ( = ?auto_608535 ?auto_608538 ) ) ( not ( = ?auto_608535 ?auto_608539 ) ) ( not ( = ?auto_608535 ?auto_608540 ) ) ( not ( = ?auto_608535 ?auto_608541 ) ) ( not ( = ?auto_608535 ?auto_608542 ) ) ( not ( = ?auto_608536 ?auto_608537 ) ) ( not ( = ?auto_608536 ?auto_608538 ) ) ( not ( = ?auto_608536 ?auto_608539 ) ) ( not ( = ?auto_608536 ?auto_608540 ) ) ( not ( = ?auto_608536 ?auto_608541 ) ) ( not ( = ?auto_608536 ?auto_608542 ) ) ( not ( = ?auto_608537 ?auto_608538 ) ) ( not ( = ?auto_608537 ?auto_608539 ) ) ( not ( = ?auto_608537 ?auto_608540 ) ) ( not ( = ?auto_608537 ?auto_608541 ) ) ( not ( = ?auto_608537 ?auto_608542 ) ) ( not ( = ?auto_608538 ?auto_608539 ) ) ( not ( = ?auto_608538 ?auto_608540 ) ) ( not ( = ?auto_608538 ?auto_608541 ) ) ( not ( = ?auto_608538 ?auto_608542 ) ) ( not ( = ?auto_608539 ?auto_608540 ) ) ( not ( = ?auto_608539 ?auto_608541 ) ) ( not ( = ?auto_608539 ?auto_608542 ) ) ( not ( = ?auto_608540 ?auto_608541 ) ) ( not ( = ?auto_608540 ?auto_608542 ) ) ( not ( = ?auto_608541 ?auto_608542 ) ) ( ON ?auto_608540 ?auto_608541 ) ( ON ?auto_608539 ?auto_608540 ) ( ON ?auto_608538 ?auto_608539 ) ( ON ?auto_608537 ?auto_608538 ) ( ON ?auto_608536 ?auto_608537 ) ( ON ?auto_608535 ?auto_608536 ) ( ON ?auto_608534 ?auto_608535 ) ( CLEAR ?auto_608532 ) ( ON ?auto_608533 ?auto_608534 ) ( CLEAR ?auto_608533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_608529 ?auto_608530 ?auto_608531 ?auto_608532 ?auto_608533 )
      ( MAKE-13PILE ?auto_608529 ?auto_608530 ?auto_608531 ?auto_608532 ?auto_608533 ?auto_608534 ?auto_608535 ?auto_608536 ?auto_608537 ?auto_608538 ?auto_608539 ?auto_608540 ?auto_608541 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608583 - BLOCK
      ?auto_608584 - BLOCK
      ?auto_608585 - BLOCK
      ?auto_608586 - BLOCK
      ?auto_608587 - BLOCK
      ?auto_608588 - BLOCK
      ?auto_608589 - BLOCK
      ?auto_608590 - BLOCK
      ?auto_608591 - BLOCK
      ?auto_608592 - BLOCK
      ?auto_608593 - BLOCK
      ?auto_608594 - BLOCK
      ?auto_608595 - BLOCK
    )
    :vars
    (
      ?auto_608596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608595 ?auto_608596 ) ( ON-TABLE ?auto_608583 ) ( ON ?auto_608584 ?auto_608583 ) ( ON ?auto_608585 ?auto_608584 ) ( not ( = ?auto_608583 ?auto_608584 ) ) ( not ( = ?auto_608583 ?auto_608585 ) ) ( not ( = ?auto_608583 ?auto_608586 ) ) ( not ( = ?auto_608583 ?auto_608587 ) ) ( not ( = ?auto_608583 ?auto_608588 ) ) ( not ( = ?auto_608583 ?auto_608589 ) ) ( not ( = ?auto_608583 ?auto_608590 ) ) ( not ( = ?auto_608583 ?auto_608591 ) ) ( not ( = ?auto_608583 ?auto_608592 ) ) ( not ( = ?auto_608583 ?auto_608593 ) ) ( not ( = ?auto_608583 ?auto_608594 ) ) ( not ( = ?auto_608583 ?auto_608595 ) ) ( not ( = ?auto_608583 ?auto_608596 ) ) ( not ( = ?auto_608584 ?auto_608585 ) ) ( not ( = ?auto_608584 ?auto_608586 ) ) ( not ( = ?auto_608584 ?auto_608587 ) ) ( not ( = ?auto_608584 ?auto_608588 ) ) ( not ( = ?auto_608584 ?auto_608589 ) ) ( not ( = ?auto_608584 ?auto_608590 ) ) ( not ( = ?auto_608584 ?auto_608591 ) ) ( not ( = ?auto_608584 ?auto_608592 ) ) ( not ( = ?auto_608584 ?auto_608593 ) ) ( not ( = ?auto_608584 ?auto_608594 ) ) ( not ( = ?auto_608584 ?auto_608595 ) ) ( not ( = ?auto_608584 ?auto_608596 ) ) ( not ( = ?auto_608585 ?auto_608586 ) ) ( not ( = ?auto_608585 ?auto_608587 ) ) ( not ( = ?auto_608585 ?auto_608588 ) ) ( not ( = ?auto_608585 ?auto_608589 ) ) ( not ( = ?auto_608585 ?auto_608590 ) ) ( not ( = ?auto_608585 ?auto_608591 ) ) ( not ( = ?auto_608585 ?auto_608592 ) ) ( not ( = ?auto_608585 ?auto_608593 ) ) ( not ( = ?auto_608585 ?auto_608594 ) ) ( not ( = ?auto_608585 ?auto_608595 ) ) ( not ( = ?auto_608585 ?auto_608596 ) ) ( not ( = ?auto_608586 ?auto_608587 ) ) ( not ( = ?auto_608586 ?auto_608588 ) ) ( not ( = ?auto_608586 ?auto_608589 ) ) ( not ( = ?auto_608586 ?auto_608590 ) ) ( not ( = ?auto_608586 ?auto_608591 ) ) ( not ( = ?auto_608586 ?auto_608592 ) ) ( not ( = ?auto_608586 ?auto_608593 ) ) ( not ( = ?auto_608586 ?auto_608594 ) ) ( not ( = ?auto_608586 ?auto_608595 ) ) ( not ( = ?auto_608586 ?auto_608596 ) ) ( not ( = ?auto_608587 ?auto_608588 ) ) ( not ( = ?auto_608587 ?auto_608589 ) ) ( not ( = ?auto_608587 ?auto_608590 ) ) ( not ( = ?auto_608587 ?auto_608591 ) ) ( not ( = ?auto_608587 ?auto_608592 ) ) ( not ( = ?auto_608587 ?auto_608593 ) ) ( not ( = ?auto_608587 ?auto_608594 ) ) ( not ( = ?auto_608587 ?auto_608595 ) ) ( not ( = ?auto_608587 ?auto_608596 ) ) ( not ( = ?auto_608588 ?auto_608589 ) ) ( not ( = ?auto_608588 ?auto_608590 ) ) ( not ( = ?auto_608588 ?auto_608591 ) ) ( not ( = ?auto_608588 ?auto_608592 ) ) ( not ( = ?auto_608588 ?auto_608593 ) ) ( not ( = ?auto_608588 ?auto_608594 ) ) ( not ( = ?auto_608588 ?auto_608595 ) ) ( not ( = ?auto_608588 ?auto_608596 ) ) ( not ( = ?auto_608589 ?auto_608590 ) ) ( not ( = ?auto_608589 ?auto_608591 ) ) ( not ( = ?auto_608589 ?auto_608592 ) ) ( not ( = ?auto_608589 ?auto_608593 ) ) ( not ( = ?auto_608589 ?auto_608594 ) ) ( not ( = ?auto_608589 ?auto_608595 ) ) ( not ( = ?auto_608589 ?auto_608596 ) ) ( not ( = ?auto_608590 ?auto_608591 ) ) ( not ( = ?auto_608590 ?auto_608592 ) ) ( not ( = ?auto_608590 ?auto_608593 ) ) ( not ( = ?auto_608590 ?auto_608594 ) ) ( not ( = ?auto_608590 ?auto_608595 ) ) ( not ( = ?auto_608590 ?auto_608596 ) ) ( not ( = ?auto_608591 ?auto_608592 ) ) ( not ( = ?auto_608591 ?auto_608593 ) ) ( not ( = ?auto_608591 ?auto_608594 ) ) ( not ( = ?auto_608591 ?auto_608595 ) ) ( not ( = ?auto_608591 ?auto_608596 ) ) ( not ( = ?auto_608592 ?auto_608593 ) ) ( not ( = ?auto_608592 ?auto_608594 ) ) ( not ( = ?auto_608592 ?auto_608595 ) ) ( not ( = ?auto_608592 ?auto_608596 ) ) ( not ( = ?auto_608593 ?auto_608594 ) ) ( not ( = ?auto_608593 ?auto_608595 ) ) ( not ( = ?auto_608593 ?auto_608596 ) ) ( not ( = ?auto_608594 ?auto_608595 ) ) ( not ( = ?auto_608594 ?auto_608596 ) ) ( not ( = ?auto_608595 ?auto_608596 ) ) ( ON ?auto_608594 ?auto_608595 ) ( ON ?auto_608593 ?auto_608594 ) ( ON ?auto_608592 ?auto_608593 ) ( ON ?auto_608591 ?auto_608592 ) ( ON ?auto_608590 ?auto_608591 ) ( ON ?auto_608589 ?auto_608590 ) ( ON ?auto_608588 ?auto_608589 ) ( ON ?auto_608587 ?auto_608588 ) ( CLEAR ?auto_608585 ) ( ON ?auto_608586 ?auto_608587 ) ( CLEAR ?auto_608586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_608583 ?auto_608584 ?auto_608585 ?auto_608586 )
      ( MAKE-13PILE ?auto_608583 ?auto_608584 ?auto_608585 ?auto_608586 ?auto_608587 ?auto_608588 ?auto_608589 ?auto_608590 ?auto_608591 ?auto_608592 ?auto_608593 ?auto_608594 ?auto_608595 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608637 - BLOCK
      ?auto_608638 - BLOCK
      ?auto_608639 - BLOCK
      ?auto_608640 - BLOCK
      ?auto_608641 - BLOCK
      ?auto_608642 - BLOCK
      ?auto_608643 - BLOCK
      ?auto_608644 - BLOCK
      ?auto_608645 - BLOCK
      ?auto_608646 - BLOCK
      ?auto_608647 - BLOCK
      ?auto_608648 - BLOCK
      ?auto_608649 - BLOCK
    )
    :vars
    (
      ?auto_608650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608649 ?auto_608650 ) ( ON-TABLE ?auto_608637 ) ( ON ?auto_608638 ?auto_608637 ) ( not ( = ?auto_608637 ?auto_608638 ) ) ( not ( = ?auto_608637 ?auto_608639 ) ) ( not ( = ?auto_608637 ?auto_608640 ) ) ( not ( = ?auto_608637 ?auto_608641 ) ) ( not ( = ?auto_608637 ?auto_608642 ) ) ( not ( = ?auto_608637 ?auto_608643 ) ) ( not ( = ?auto_608637 ?auto_608644 ) ) ( not ( = ?auto_608637 ?auto_608645 ) ) ( not ( = ?auto_608637 ?auto_608646 ) ) ( not ( = ?auto_608637 ?auto_608647 ) ) ( not ( = ?auto_608637 ?auto_608648 ) ) ( not ( = ?auto_608637 ?auto_608649 ) ) ( not ( = ?auto_608637 ?auto_608650 ) ) ( not ( = ?auto_608638 ?auto_608639 ) ) ( not ( = ?auto_608638 ?auto_608640 ) ) ( not ( = ?auto_608638 ?auto_608641 ) ) ( not ( = ?auto_608638 ?auto_608642 ) ) ( not ( = ?auto_608638 ?auto_608643 ) ) ( not ( = ?auto_608638 ?auto_608644 ) ) ( not ( = ?auto_608638 ?auto_608645 ) ) ( not ( = ?auto_608638 ?auto_608646 ) ) ( not ( = ?auto_608638 ?auto_608647 ) ) ( not ( = ?auto_608638 ?auto_608648 ) ) ( not ( = ?auto_608638 ?auto_608649 ) ) ( not ( = ?auto_608638 ?auto_608650 ) ) ( not ( = ?auto_608639 ?auto_608640 ) ) ( not ( = ?auto_608639 ?auto_608641 ) ) ( not ( = ?auto_608639 ?auto_608642 ) ) ( not ( = ?auto_608639 ?auto_608643 ) ) ( not ( = ?auto_608639 ?auto_608644 ) ) ( not ( = ?auto_608639 ?auto_608645 ) ) ( not ( = ?auto_608639 ?auto_608646 ) ) ( not ( = ?auto_608639 ?auto_608647 ) ) ( not ( = ?auto_608639 ?auto_608648 ) ) ( not ( = ?auto_608639 ?auto_608649 ) ) ( not ( = ?auto_608639 ?auto_608650 ) ) ( not ( = ?auto_608640 ?auto_608641 ) ) ( not ( = ?auto_608640 ?auto_608642 ) ) ( not ( = ?auto_608640 ?auto_608643 ) ) ( not ( = ?auto_608640 ?auto_608644 ) ) ( not ( = ?auto_608640 ?auto_608645 ) ) ( not ( = ?auto_608640 ?auto_608646 ) ) ( not ( = ?auto_608640 ?auto_608647 ) ) ( not ( = ?auto_608640 ?auto_608648 ) ) ( not ( = ?auto_608640 ?auto_608649 ) ) ( not ( = ?auto_608640 ?auto_608650 ) ) ( not ( = ?auto_608641 ?auto_608642 ) ) ( not ( = ?auto_608641 ?auto_608643 ) ) ( not ( = ?auto_608641 ?auto_608644 ) ) ( not ( = ?auto_608641 ?auto_608645 ) ) ( not ( = ?auto_608641 ?auto_608646 ) ) ( not ( = ?auto_608641 ?auto_608647 ) ) ( not ( = ?auto_608641 ?auto_608648 ) ) ( not ( = ?auto_608641 ?auto_608649 ) ) ( not ( = ?auto_608641 ?auto_608650 ) ) ( not ( = ?auto_608642 ?auto_608643 ) ) ( not ( = ?auto_608642 ?auto_608644 ) ) ( not ( = ?auto_608642 ?auto_608645 ) ) ( not ( = ?auto_608642 ?auto_608646 ) ) ( not ( = ?auto_608642 ?auto_608647 ) ) ( not ( = ?auto_608642 ?auto_608648 ) ) ( not ( = ?auto_608642 ?auto_608649 ) ) ( not ( = ?auto_608642 ?auto_608650 ) ) ( not ( = ?auto_608643 ?auto_608644 ) ) ( not ( = ?auto_608643 ?auto_608645 ) ) ( not ( = ?auto_608643 ?auto_608646 ) ) ( not ( = ?auto_608643 ?auto_608647 ) ) ( not ( = ?auto_608643 ?auto_608648 ) ) ( not ( = ?auto_608643 ?auto_608649 ) ) ( not ( = ?auto_608643 ?auto_608650 ) ) ( not ( = ?auto_608644 ?auto_608645 ) ) ( not ( = ?auto_608644 ?auto_608646 ) ) ( not ( = ?auto_608644 ?auto_608647 ) ) ( not ( = ?auto_608644 ?auto_608648 ) ) ( not ( = ?auto_608644 ?auto_608649 ) ) ( not ( = ?auto_608644 ?auto_608650 ) ) ( not ( = ?auto_608645 ?auto_608646 ) ) ( not ( = ?auto_608645 ?auto_608647 ) ) ( not ( = ?auto_608645 ?auto_608648 ) ) ( not ( = ?auto_608645 ?auto_608649 ) ) ( not ( = ?auto_608645 ?auto_608650 ) ) ( not ( = ?auto_608646 ?auto_608647 ) ) ( not ( = ?auto_608646 ?auto_608648 ) ) ( not ( = ?auto_608646 ?auto_608649 ) ) ( not ( = ?auto_608646 ?auto_608650 ) ) ( not ( = ?auto_608647 ?auto_608648 ) ) ( not ( = ?auto_608647 ?auto_608649 ) ) ( not ( = ?auto_608647 ?auto_608650 ) ) ( not ( = ?auto_608648 ?auto_608649 ) ) ( not ( = ?auto_608648 ?auto_608650 ) ) ( not ( = ?auto_608649 ?auto_608650 ) ) ( ON ?auto_608648 ?auto_608649 ) ( ON ?auto_608647 ?auto_608648 ) ( ON ?auto_608646 ?auto_608647 ) ( ON ?auto_608645 ?auto_608646 ) ( ON ?auto_608644 ?auto_608645 ) ( ON ?auto_608643 ?auto_608644 ) ( ON ?auto_608642 ?auto_608643 ) ( ON ?auto_608641 ?auto_608642 ) ( ON ?auto_608640 ?auto_608641 ) ( CLEAR ?auto_608638 ) ( ON ?auto_608639 ?auto_608640 ) ( CLEAR ?auto_608639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_608637 ?auto_608638 ?auto_608639 )
      ( MAKE-13PILE ?auto_608637 ?auto_608638 ?auto_608639 ?auto_608640 ?auto_608641 ?auto_608642 ?auto_608643 ?auto_608644 ?auto_608645 ?auto_608646 ?auto_608647 ?auto_608648 ?auto_608649 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608691 - BLOCK
      ?auto_608692 - BLOCK
      ?auto_608693 - BLOCK
      ?auto_608694 - BLOCK
      ?auto_608695 - BLOCK
      ?auto_608696 - BLOCK
      ?auto_608697 - BLOCK
      ?auto_608698 - BLOCK
      ?auto_608699 - BLOCK
      ?auto_608700 - BLOCK
      ?auto_608701 - BLOCK
      ?auto_608702 - BLOCK
      ?auto_608703 - BLOCK
    )
    :vars
    (
      ?auto_608704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608703 ?auto_608704 ) ( ON-TABLE ?auto_608691 ) ( not ( = ?auto_608691 ?auto_608692 ) ) ( not ( = ?auto_608691 ?auto_608693 ) ) ( not ( = ?auto_608691 ?auto_608694 ) ) ( not ( = ?auto_608691 ?auto_608695 ) ) ( not ( = ?auto_608691 ?auto_608696 ) ) ( not ( = ?auto_608691 ?auto_608697 ) ) ( not ( = ?auto_608691 ?auto_608698 ) ) ( not ( = ?auto_608691 ?auto_608699 ) ) ( not ( = ?auto_608691 ?auto_608700 ) ) ( not ( = ?auto_608691 ?auto_608701 ) ) ( not ( = ?auto_608691 ?auto_608702 ) ) ( not ( = ?auto_608691 ?auto_608703 ) ) ( not ( = ?auto_608691 ?auto_608704 ) ) ( not ( = ?auto_608692 ?auto_608693 ) ) ( not ( = ?auto_608692 ?auto_608694 ) ) ( not ( = ?auto_608692 ?auto_608695 ) ) ( not ( = ?auto_608692 ?auto_608696 ) ) ( not ( = ?auto_608692 ?auto_608697 ) ) ( not ( = ?auto_608692 ?auto_608698 ) ) ( not ( = ?auto_608692 ?auto_608699 ) ) ( not ( = ?auto_608692 ?auto_608700 ) ) ( not ( = ?auto_608692 ?auto_608701 ) ) ( not ( = ?auto_608692 ?auto_608702 ) ) ( not ( = ?auto_608692 ?auto_608703 ) ) ( not ( = ?auto_608692 ?auto_608704 ) ) ( not ( = ?auto_608693 ?auto_608694 ) ) ( not ( = ?auto_608693 ?auto_608695 ) ) ( not ( = ?auto_608693 ?auto_608696 ) ) ( not ( = ?auto_608693 ?auto_608697 ) ) ( not ( = ?auto_608693 ?auto_608698 ) ) ( not ( = ?auto_608693 ?auto_608699 ) ) ( not ( = ?auto_608693 ?auto_608700 ) ) ( not ( = ?auto_608693 ?auto_608701 ) ) ( not ( = ?auto_608693 ?auto_608702 ) ) ( not ( = ?auto_608693 ?auto_608703 ) ) ( not ( = ?auto_608693 ?auto_608704 ) ) ( not ( = ?auto_608694 ?auto_608695 ) ) ( not ( = ?auto_608694 ?auto_608696 ) ) ( not ( = ?auto_608694 ?auto_608697 ) ) ( not ( = ?auto_608694 ?auto_608698 ) ) ( not ( = ?auto_608694 ?auto_608699 ) ) ( not ( = ?auto_608694 ?auto_608700 ) ) ( not ( = ?auto_608694 ?auto_608701 ) ) ( not ( = ?auto_608694 ?auto_608702 ) ) ( not ( = ?auto_608694 ?auto_608703 ) ) ( not ( = ?auto_608694 ?auto_608704 ) ) ( not ( = ?auto_608695 ?auto_608696 ) ) ( not ( = ?auto_608695 ?auto_608697 ) ) ( not ( = ?auto_608695 ?auto_608698 ) ) ( not ( = ?auto_608695 ?auto_608699 ) ) ( not ( = ?auto_608695 ?auto_608700 ) ) ( not ( = ?auto_608695 ?auto_608701 ) ) ( not ( = ?auto_608695 ?auto_608702 ) ) ( not ( = ?auto_608695 ?auto_608703 ) ) ( not ( = ?auto_608695 ?auto_608704 ) ) ( not ( = ?auto_608696 ?auto_608697 ) ) ( not ( = ?auto_608696 ?auto_608698 ) ) ( not ( = ?auto_608696 ?auto_608699 ) ) ( not ( = ?auto_608696 ?auto_608700 ) ) ( not ( = ?auto_608696 ?auto_608701 ) ) ( not ( = ?auto_608696 ?auto_608702 ) ) ( not ( = ?auto_608696 ?auto_608703 ) ) ( not ( = ?auto_608696 ?auto_608704 ) ) ( not ( = ?auto_608697 ?auto_608698 ) ) ( not ( = ?auto_608697 ?auto_608699 ) ) ( not ( = ?auto_608697 ?auto_608700 ) ) ( not ( = ?auto_608697 ?auto_608701 ) ) ( not ( = ?auto_608697 ?auto_608702 ) ) ( not ( = ?auto_608697 ?auto_608703 ) ) ( not ( = ?auto_608697 ?auto_608704 ) ) ( not ( = ?auto_608698 ?auto_608699 ) ) ( not ( = ?auto_608698 ?auto_608700 ) ) ( not ( = ?auto_608698 ?auto_608701 ) ) ( not ( = ?auto_608698 ?auto_608702 ) ) ( not ( = ?auto_608698 ?auto_608703 ) ) ( not ( = ?auto_608698 ?auto_608704 ) ) ( not ( = ?auto_608699 ?auto_608700 ) ) ( not ( = ?auto_608699 ?auto_608701 ) ) ( not ( = ?auto_608699 ?auto_608702 ) ) ( not ( = ?auto_608699 ?auto_608703 ) ) ( not ( = ?auto_608699 ?auto_608704 ) ) ( not ( = ?auto_608700 ?auto_608701 ) ) ( not ( = ?auto_608700 ?auto_608702 ) ) ( not ( = ?auto_608700 ?auto_608703 ) ) ( not ( = ?auto_608700 ?auto_608704 ) ) ( not ( = ?auto_608701 ?auto_608702 ) ) ( not ( = ?auto_608701 ?auto_608703 ) ) ( not ( = ?auto_608701 ?auto_608704 ) ) ( not ( = ?auto_608702 ?auto_608703 ) ) ( not ( = ?auto_608702 ?auto_608704 ) ) ( not ( = ?auto_608703 ?auto_608704 ) ) ( ON ?auto_608702 ?auto_608703 ) ( ON ?auto_608701 ?auto_608702 ) ( ON ?auto_608700 ?auto_608701 ) ( ON ?auto_608699 ?auto_608700 ) ( ON ?auto_608698 ?auto_608699 ) ( ON ?auto_608697 ?auto_608698 ) ( ON ?auto_608696 ?auto_608697 ) ( ON ?auto_608695 ?auto_608696 ) ( ON ?auto_608694 ?auto_608695 ) ( ON ?auto_608693 ?auto_608694 ) ( CLEAR ?auto_608691 ) ( ON ?auto_608692 ?auto_608693 ) ( CLEAR ?auto_608692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_608691 ?auto_608692 )
      ( MAKE-13PILE ?auto_608691 ?auto_608692 ?auto_608693 ?auto_608694 ?auto_608695 ?auto_608696 ?auto_608697 ?auto_608698 ?auto_608699 ?auto_608700 ?auto_608701 ?auto_608702 ?auto_608703 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_608745 - BLOCK
      ?auto_608746 - BLOCK
      ?auto_608747 - BLOCK
      ?auto_608748 - BLOCK
      ?auto_608749 - BLOCK
      ?auto_608750 - BLOCK
      ?auto_608751 - BLOCK
      ?auto_608752 - BLOCK
      ?auto_608753 - BLOCK
      ?auto_608754 - BLOCK
      ?auto_608755 - BLOCK
      ?auto_608756 - BLOCK
      ?auto_608757 - BLOCK
    )
    :vars
    (
      ?auto_608758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608757 ?auto_608758 ) ( not ( = ?auto_608745 ?auto_608746 ) ) ( not ( = ?auto_608745 ?auto_608747 ) ) ( not ( = ?auto_608745 ?auto_608748 ) ) ( not ( = ?auto_608745 ?auto_608749 ) ) ( not ( = ?auto_608745 ?auto_608750 ) ) ( not ( = ?auto_608745 ?auto_608751 ) ) ( not ( = ?auto_608745 ?auto_608752 ) ) ( not ( = ?auto_608745 ?auto_608753 ) ) ( not ( = ?auto_608745 ?auto_608754 ) ) ( not ( = ?auto_608745 ?auto_608755 ) ) ( not ( = ?auto_608745 ?auto_608756 ) ) ( not ( = ?auto_608745 ?auto_608757 ) ) ( not ( = ?auto_608745 ?auto_608758 ) ) ( not ( = ?auto_608746 ?auto_608747 ) ) ( not ( = ?auto_608746 ?auto_608748 ) ) ( not ( = ?auto_608746 ?auto_608749 ) ) ( not ( = ?auto_608746 ?auto_608750 ) ) ( not ( = ?auto_608746 ?auto_608751 ) ) ( not ( = ?auto_608746 ?auto_608752 ) ) ( not ( = ?auto_608746 ?auto_608753 ) ) ( not ( = ?auto_608746 ?auto_608754 ) ) ( not ( = ?auto_608746 ?auto_608755 ) ) ( not ( = ?auto_608746 ?auto_608756 ) ) ( not ( = ?auto_608746 ?auto_608757 ) ) ( not ( = ?auto_608746 ?auto_608758 ) ) ( not ( = ?auto_608747 ?auto_608748 ) ) ( not ( = ?auto_608747 ?auto_608749 ) ) ( not ( = ?auto_608747 ?auto_608750 ) ) ( not ( = ?auto_608747 ?auto_608751 ) ) ( not ( = ?auto_608747 ?auto_608752 ) ) ( not ( = ?auto_608747 ?auto_608753 ) ) ( not ( = ?auto_608747 ?auto_608754 ) ) ( not ( = ?auto_608747 ?auto_608755 ) ) ( not ( = ?auto_608747 ?auto_608756 ) ) ( not ( = ?auto_608747 ?auto_608757 ) ) ( not ( = ?auto_608747 ?auto_608758 ) ) ( not ( = ?auto_608748 ?auto_608749 ) ) ( not ( = ?auto_608748 ?auto_608750 ) ) ( not ( = ?auto_608748 ?auto_608751 ) ) ( not ( = ?auto_608748 ?auto_608752 ) ) ( not ( = ?auto_608748 ?auto_608753 ) ) ( not ( = ?auto_608748 ?auto_608754 ) ) ( not ( = ?auto_608748 ?auto_608755 ) ) ( not ( = ?auto_608748 ?auto_608756 ) ) ( not ( = ?auto_608748 ?auto_608757 ) ) ( not ( = ?auto_608748 ?auto_608758 ) ) ( not ( = ?auto_608749 ?auto_608750 ) ) ( not ( = ?auto_608749 ?auto_608751 ) ) ( not ( = ?auto_608749 ?auto_608752 ) ) ( not ( = ?auto_608749 ?auto_608753 ) ) ( not ( = ?auto_608749 ?auto_608754 ) ) ( not ( = ?auto_608749 ?auto_608755 ) ) ( not ( = ?auto_608749 ?auto_608756 ) ) ( not ( = ?auto_608749 ?auto_608757 ) ) ( not ( = ?auto_608749 ?auto_608758 ) ) ( not ( = ?auto_608750 ?auto_608751 ) ) ( not ( = ?auto_608750 ?auto_608752 ) ) ( not ( = ?auto_608750 ?auto_608753 ) ) ( not ( = ?auto_608750 ?auto_608754 ) ) ( not ( = ?auto_608750 ?auto_608755 ) ) ( not ( = ?auto_608750 ?auto_608756 ) ) ( not ( = ?auto_608750 ?auto_608757 ) ) ( not ( = ?auto_608750 ?auto_608758 ) ) ( not ( = ?auto_608751 ?auto_608752 ) ) ( not ( = ?auto_608751 ?auto_608753 ) ) ( not ( = ?auto_608751 ?auto_608754 ) ) ( not ( = ?auto_608751 ?auto_608755 ) ) ( not ( = ?auto_608751 ?auto_608756 ) ) ( not ( = ?auto_608751 ?auto_608757 ) ) ( not ( = ?auto_608751 ?auto_608758 ) ) ( not ( = ?auto_608752 ?auto_608753 ) ) ( not ( = ?auto_608752 ?auto_608754 ) ) ( not ( = ?auto_608752 ?auto_608755 ) ) ( not ( = ?auto_608752 ?auto_608756 ) ) ( not ( = ?auto_608752 ?auto_608757 ) ) ( not ( = ?auto_608752 ?auto_608758 ) ) ( not ( = ?auto_608753 ?auto_608754 ) ) ( not ( = ?auto_608753 ?auto_608755 ) ) ( not ( = ?auto_608753 ?auto_608756 ) ) ( not ( = ?auto_608753 ?auto_608757 ) ) ( not ( = ?auto_608753 ?auto_608758 ) ) ( not ( = ?auto_608754 ?auto_608755 ) ) ( not ( = ?auto_608754 ?auto_608756 ) ) ( not ( = ?auto_608754 ?auto_608757 ) ) ( not ( = ?auto_608754 ?auto_608758 ) ) ( not ( = ?auto_608755 ?auto_608756 ) ) ( not ( = ?auto_608755 ?auto_608757 ) ) ( not ( = ?auto_608755 ?auto_608758 ) ) ( not ( = ?auto_608756 ?auto_608757 ) ) ( not ( = ?auto_608756 ?auto_608758 ) ) ( not ( = ?auto_608757 ?auto_608758 ) ) ( ON ?auto_608756 ?auto_608757 ) ( ON ?auto_608755 ?auto_608756 ) ( ON ?auto_608754 ?auto_608755 ) ( ON ?auto_608753 ?auto_608754 ) ( ON ?auto_608752 ?auto_608753 ) ( ON ?auto_608751 ?auto_608752 ) ( ON ?auto_608750 ?auto_608751 ) ( ON ?auto_608749 ?auto_608750 ) ( ON ?auto_608748 ?auto_608749 ) ( ON ?auto_608747 ?auto_608748 ) ( ON ?auto_608746 ?auto_608747 ) ( ON ?auto_608745 ?auto_608746 ) ( CLEAR ?auto_608745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_608745 )
      ( MAKE-13PILE ?auto_608745 ?auto_608746 ?auto_608747 ?auto_608748 ?auto_608749 ?auto_608750 ?auto_608751 ?auto_608752 ?auto_608753 ?auto_608754 ?auto_608755 ?auto_608756 ?auto_608757 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_608800 - BLOCK
      ?auto_608801 - BLOCK
      ?auto_608802 - BLOCK
      ?auto_608803 - BLOCK
      ?auto_608804 - BLOCK
      ?auto_608805 - BLOCK
      ?auto_608806 - BLOCK
      ?auto_608807 - BLOCK
      ?auto_608808 - BLOCK
      ?auto_608809 - BLOCK
      ?auto_608810 - BLOCK
      ?auto_608811 - BLOCK
      ?auto_608812 - BLOCK
      ?auto_608813 - BLOCK
    )
    :vars
    (
      ?auto_608814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_608812 ) ( ON ?auto_608813 ?auto_608814 ) ( CLEAR ?auto_608813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_608800 ) ( ON ?auto_608801 ?auto_608800 ) ( ON ?auto_608802 ?auto_608801 ) ( ON ?auto_608803 ?auto_608802 ) ( ON ?auto_608804 ?auto_608803 ) ( ON ?auto_608805 ?auto_608804 ) ( ON ?auto_608806 ?auto_608805 ) ( ON ?auto_608807 ?auto_608806 ) ( ON ?auto_608808 ?auto_608807 ) ( ON ?auto_608809 ?auto_608808 ) ( ON ?auto_608810 ?auto_608809 ) ( ON ?auto_608811 ?auto_608810 ) ( ON ?auto_608812 ?auto_608811 ) ( not ( = ?auto_608800 ?auto_608801 ) ) ( not ( = ?auto_608800 ?auto_608802 ) ) ( not ( = ?auto_608800 ?auto_608803 ) ) ( not ( = ?auto_608800 ?auto_608804 ) ) ( not ( = ?auto_608800 ?auto_608805 ) ) ( not ( = ?auto_608800 ?auto_608806 ) ) ( not ( = ?auto_608800 ?auto_608807 ) ) ( not ( = ?auto_608800 ?auto_608808 ) ) ( not ( = ?auto_608800 ?auto_608809 ) ) ( not ( = ?auto_608800 ?auto_608810 ) ) ( not ( = ?auto_608800 ?auto_608811 ) ) ( not ( = ?auto_608800 ?auto_608812 ) ) ( not ( = ?auto_608800 ?auto_608813 ) ) ( not ( = ?auto_608800 ?auto_608814 ) ) ( not ( = ?auto_608801 ?auto_608802 ) ) ( not ( = ?auto_608801 ?auto_608803 ) ) ( not ( = ?auto_608801 ?auto_608804 ) ) ( not ( = ?auto_608801 ?auto_608805 ) ) ( not ( = ?auto_608801 ?auto_608806 ) ) ( not ( = ?auto_608801 ?auto_608807 ) ) ( not ( = ?auto_608801 ?auto_608808 ) ) ( not ( = ?auto_608801 ?auto_608809 ) ) ( not ( = ?auto_608801 ?auto_608810 ) ) ( not ( = ?auto_608801 ?auto_608811 ) ) ( not ( = ?auto_608801 ?auto_608812 ) ) ( not ( = ?auto_608801 ?auto_608813 ) ) ( not ( = ?auto_608801 ?auto_608814 ) ) ( not ( = ?auto_608802 ?auto_608803 ) ) ( not ( = ?auto_608802 ?auto_608804 ) ) ( not ( = ?auto_608802 ?auto_608805 ) ) ( not ( = ?auto_608802 ?auto_608806 ) ) ( not ( = ?auto_608802 ?auto_608807 ) ) ( not ( = ?auto_608802 ?auto_608808 ) ) ( not ( = ?auto_608802 ?auto_608809 ) ) ( not ( = ?auto_608802 ?auto_608810 ) ) ( not ( = ?auto_608802 ?auto_608811 ) ) ( not ( = ?auto_608802 ?auto_608812 ) ) ( not ( = ?auto_608802 ?auto_608813 ) ) ( not ( = ?auto_608802 ?auto_608814 ) ) ( not ( = ?auto_608803 ?auto_608804 ) ) ( not ( = ?auto_608803 ?auto_608805 ) ) ( not ( = ?auto_608803 ?auto_608806 ) ) ( not ( = ?auto_608803 ?auto_608807 ) ) ( not ( = ?auto_608803 ?auto_608808 ) ) ( not ( = ?auto_608803 ?auto_608809 ) ) ( not ( = ?auto_608803 ?auto_608810 ) ) ( not ( = ?auto_608803 ?auto_608811 ) ) ( not ( = ?auto_608803 ?auto_608812 ) ) ( not ( = ?auto_608803 ?auto_608813 ) ) ( not ( = ?auto_608803 ?auto_608814 ) ) ( not ( = ?auto_608804 ?auto_608805 ) ) ( not ( = ?auto_608804 ?auto_608806 ) ) ( not ( = ?auto_608804 ?auto_608807 ) ) ( not ( = ?auto_608804 ?auto_608808 ) ) ( not ( = ?auto_608804 ?auto_608809 ) ) ( not ( = ?auto_608804 ?auto_608810 ) ) ( not ( = ?auto_608804 ?auto_608811 ) ) ( not ( = ?auto_608804 ?auto_608812 ) ) ( not ( = ?auto_608804 ?auto_608813 ) ) ( not ( = ?auto_608804 ?auto_608814 ) ) ( not ( = ?auto_608805 ?auto_608806 ) ) ( not ( = ?auto_608805 ?auto_608807 ) ) ( not ( = ?auto_608805 ?auto_608808 ) ) ( not ( = ?auto_608805 ?auto_608809 ) ) ( not ( = ?auto_608805 ?auto_608810 ) ) ( not ( = ?auto_608805 ?auto_608811 ) ) ( not ( = ?auto_608805 ?auto_608812 ) ) ( not ( = ?auto_608805 ?auto_608813 ) ) ( not ( = ?auto_608805 ?auto_608814 ) ) ( not ( = ?auto_608806 ?auto_608807 ) ) ( not ( = ?auto_608806 ?auto_608808 ) ) ( not ( = ?auto_608806 ?auto_608809 ) ) ( not ( = ?auto_608806 ?auto_608810 ) ) ( not ( = ?auto_608806 ?auto_608811 ) ) ( not ( = ?auto_608806 ?auto_608812 ) ) ( not ( = ?auto_608806 ?auto_608813 ) ) ( not ( = ?auto_608806 ?auto_608814 ) ) ( not ( = ?auto_608807 ?auto_608808 ) ) ( not ( = ?auto_608807 ?auto_608809 ) ) ( not ( = ?auto_608807 ?auto_608810 ) ) ( not ( = ?auto_608807 ?auto_608811 ) ) ( not ( = ?auto_608807 ?auto_608812 ) ) ( not ( = ?auto_608807 ?auto_608813 ) ) ( not ( = ?auto_608807 ?auto_608814 ) ) ( not ( = ?auto_608808 ?auto_608809 ) ) ( not ( = ?auto_608808 ?auto_608810 ) ) ( not ( = ?auto_608808 ?auto_608811 ) ) ( not ( = ?auto_608808 ?auto_608812 ) ) ( not ( = ?auto_608808 ?auto_608813 ) ) ( not ( = ?auto_608808 ?auto_608814 ) ) ( not ( = ?auto_608809 ?auto_608810 ) ) ( not ( = ?auto_608809 ?auto_608811 ) ) ( not ( = ?auto_608809 ?auto_608812 ) ) ( not ( = ?auto_608809 ?auto_608813 ) ) ( not ( = ?auto_608809 ?auto_608814 ) ) ( not ( = ?auto_608810 ?auto_608811 ) ) ( not ( = ?auto_608810 ?auto_608812 ) ) ( not ( = ?auto_608810 ?auto_608813 ) ) ( not ( = ?auto_608810 ?auto_608814 ) ) ( not ( = ?auto_608811 ?auto_608812 ) ) ( not ( = ?auto_608811 ?auto_608813 ) ) ( not ( = ?auto_608811 ?auto_608814 ) ) ( not ( = ?auto_608812 ?auto_608813 ) ) ( not ( = ?auto_608812 ?auto_608814 ) ) ( not ( = ?auto_608813 ?auto_608814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_608813 ?auto_608814 )
      ( !STACK ?auto_608813 ?auto_608812 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_608858 - BLOCK
      ?auto_608859 - BLOCK
      ?auto_608860 - BLOCK
      ?auto_608861 - BLOCK
      ?auto_608862 - BLOCK
      ?auto_608863 - BLOCK
      ?auto_608864 - BLOCK
      ?auto_608865 - BLOCK
      ?auto_608866 - BLOCK
      ?auto_608867 - BLOCK
      ?auto_608868 - BLOCK
      ?auto_608869 - BLOCK
      ?auto_608870 - BLOCK
      ?auto_608871 - BLOCK
    )
    :vars
    (
      ?auto_608872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608871 ?auto_608872 ) ( ON-TABLE ?auto_608858 ) ( ON ?auto_608859 ?auto_608858 ) ( ON ?auto_608860 ?auto_608859 ) ( ON ?auto_608861 ?auto_608860 ) ( ON ?auto_608862 ?auto_608861 ) ( ON ?auto_608863 ?auto_608862 ) ( ON ?auto_608864 ?auto_608863 ) ( ON ?auto_608865 ?auto_608864 ) ( ON ?auto_608866 ?auto_608865 ) ( ON ?auto_608867 ?auto_608866 ) ( ON ?auto_608868 ?auto_608867 ) ( ON ?auto_608869 ?auto_608868 ) ( not ( = ?auto_608858 ?auto_608859 ) ) ( not ( = ?auto_608858 ?auto_608860 ) ) ( not ( = ?auto_608858 ?auto_608861 ) ) ( not ( = ?auto_608858 ?auto_608862 ) ) ( not ( = ?auto_608858 ?auto_608863 ) ) ( not ( = ?auto_608858 ?auto_608864 ) ) ( not ( = ?auto_608858 ?auto_608865 ) ) ( not ( = ?auto_608858 ?auto_608866 ) ) ( not ( = ?auto_608858 ?auto_608867 ) ) ( not ( = ?auto_608858 ?auto_608868 ) ) ( not ( = ?auto_608858 ?auto_608869 ) ) ( not ( = ?auto_608858 ?auto_608870 ) ) ( not ( = ?auto_608858 ?auto_608871 ) ) ( not ( = ?auto_608858 ?auto_608872 ) ) ( not ( = ?auto_608859 ?auto_608860 ) ) ( not ( = ?auto_608859 ?auto_608861 ) ) ( not ( = ?auto_608859 ?auto_608862 ) ) ( not ( = ?auto_608859 ?auto_608863 ) ) ( not ( = ?auto_608859 ?auto_608864 ) ) ( not ( = ?auto_608859 ?auto_608865 ) ) ( not ( = ?auto_608859 ?auto_608866 ) ) ( not ( = ?auto_608859 ?auto_608867 ) ) ( not ( = ?auto_608859 ?auto_608868 ) ) ( not ( = ?auto_608859 ?auto_608869 ) ) ( not ( = ?auto_608859 ?auto_608870 ) ) ( not ( = ?auto_608859 ?auto_608871 ) ) ( not ( = ?auto_608859 ?auto_608872 ) ) ( not ( = ?auto_608860 ?auto_608861 ) ) ( not ( = ?auto_608860 ?auto_608862 ) ) ( not ( = ?auto_608860 ?auto_608863 ) ) ( not ( = ?auto_608860 ?auto_608864 ) ) ( not ( = ?auto_608860 ?auto_608865 ) ) ( not ( = ?auto_608860 ?auto_608866 ) ) ( not ( = ?auto_608860 ?auto_608867 ) ) ( not ( = ?auto_608860 ?auto_608868 ) ) ( not ( = ?auto_608860 ?auto_608869 ) ) ( not ( = ?auto_608860 ?auto_608870 ) ) ( not ( = ?auto_608860 ?auto_608871 ) ) ( not ( = ?auto_608860 ?auto_608872 ) ) ( not ( = ?auto_608861 ?auto_608862 ) ) ( not ( = ?auto_608861 ?auto_608863 ) ) ( not ( = ?auto_608861 ?auto_608864 ) ) ( not ( = ?auto_608861 ?auto_608865 ) ) ( not ( = ?auto_608861 ?auto_608866 ) ) ( not ( = ?auto_608861 ?auto_608867 ) ) ( not ( = ?auto_608861 ?auto_608868 ) ) ( not ( = ?auto_608861 ?auto_608869 ) ) ( not ( = ?auto_608861 ?auto_608870 ) ) ( not ( = ?auto_608861 ?auto_608871 ) ) ( not ( = ?auto_608861 ?auto_608872 ) ) ( not ( = ?auto_608862 ?auto_608863 ) ) ( not ( = ?auto_608862 ?auto_608864 ) ) ( not ( = ?auto_608862 ?auto_608865 ) ) ( not ( = ?auto_608862 ?auto_608866 ) ) ( not ( = ?auto_608862 ?auto_608867 ) ) ( not ( = ?auto_608862 ?auto_608868 ) ) ( not ( = ?auto_608862 ?auto_608869 ) ) ( not ( = ?auto_608862 ?auto_608870 ) ) ( not ( = ?auto_608862 ?auto_608871 ) ) ( not ( = ?auto_608862 ?auto_608872 ) ) ( not ( = ?auto_608863 ?auto_608864 ) ) ( not ( = ?auto_608863 ?auto_608865 ) ) ( not ( = ?auto_608863 ?auto_608866 ) ) ( not ( = ?auto_608863 ?auto_608867 ) ) ( not ( = ?auto_608863 ?auto_608868 ) ) ( not ( = ?auto_608863 ?auto_608869 ) ) ( not ( = ?auto_608863 ?auto_608870 ) ) ( not ( = ?auto_608863 ?auto_608871 ) ) ( not ( = ?auto_608863 ?auto_608872 ) ) ( not ( = ?auto_608864 ?auto_608865 ) ) ( not ( = ?auto_608864 ?auto_608866 ) ) ( not ( = ?auto_608864 ?auto_608867 ) ) ( not ( = ?auto_608864 ?auto_608868 ) ) ( not ( = ?auto_608864 ?auto_608869 ) ) ( not ( = ?auto_608864 ?auto_608870 ) ) ( not ( = ?auto_608864 ?auto_608871 ) ) ( not ( = ?auto_608864 ?auto_608872 ) ) ( not ( = ?auto_608865 ?auto_608866 ) ) ( not ( = ?auto_608865 ?auto_608867 ) ) ( not ( = ?auto_608865 ?auto_608868 ) ) ( not ( = ?auto_608865 ?auto_608869 ) ) ( not ( = ?auto_608865 ?auto_608870 ) ) ( not ( = ?auto_608865 ?auto_608871 ) ) ( not ( = ?auto_608865 ?auto_608872 ) ) ( not ( = ?auto_608866 ?auto_608867 ) ) ( not ( = ?auto_608866 ?auto_608868 ) ) ( not ( = ?auto_608866 ?auto_608869 ) ) ( not ( = ?auto_608866 ?auto_608870 ) ) ( not ( = ?auto_608866 ?auto_608871 ) ) ( not ( = ?auto_608866 ?auto_608872 ) ) ( not ( = ?auto_608867 ?auto_608868 ) ) ( not ( = ?auto_608867 ?auto_608869 ) ) ( not ( = ?auto_608867 ?auto_608870 ) ) ( not ( = ?auto_608867 ?auto_608871 ) ) ( not ( = ?auto_608867 ?auto_608872 ) ) ( not ( = ?auto_608868 ?auto_608869 ) ) ( not ( = ?auto_608868 ?auto_608870 ) ) ( not ( = ?auto_608868 ?auto_608871 ) ) ( not ( = ?auto_608868 ?auto_608872 ) ) ( not ( = ?auto_608869 ?auto_608870 ) ) ( not ( = ?auto_608869 ?auto_608871 ) ) ( not ( = ?auto_608869 ?auto_608872 ) ) ( not ( = ?auto_608870 ?auto_608871 ) ) ( not ( = ?auto_608870 ?auto_608872 ) ) ( not ( = ?auto_608871 ?auto_608872 ) ) ( CLEAR ?auto_608869 ) ( ON ?auto_608870 ?auto_608871 ) ( CLEAR ?auto_608870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_608858 ?auto_608859 ?auto_608860 ?auto_608861 ?auto_608862 ?auto_608863 ?auto_608864 ?auto_608865 ?auto_608866 ?auto_608867 ?auto_608868 ?auto_608869 ?auto_608870 )
      ( MAKE-14PILE ?auto_608858 ?auto_608859 ?auto_608860 ?auto_608861 ?auto_608862 ?auto_608863 ?auto_608864 ?auto_608865 ?auto_608866 ?auto_608867 ?auto_608868 ?auto_608869 ?auto_608870 ?auto_608871 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_608916 - BLOCK
      ?auto_608917 - BLOCK
      ?auto_608918 - BLOCK
      ?auto_608919 - BLOCK
      ?auto_608920 - BLOCK
      ?auto_608921 - BLOCK
      ?auto_608922 - BLOCK
      ?auto_608923 - BLOCK
      ?auto_608924 - BLOCK
      ?auto_608925 - BLOCK
      ?auto_608926 - BLOCK
      ?auto_608927 - BLOCK
      ?auto_608928 - BLOCK
      ?auto_608929 - BLOCK
    )
    :vars
    (
      ?auto_608930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608929 ?auto_608930 ) ( ON-TABLE ?auto_608916 ) ( ON ?auto_608917 ?auto_608916 ) ( ON ?auto_608918 ?auto_608917 ) ( ON ?auto_608919 ?auto_608918 ) ( ON ?auto_608920 ?auto_608919 ) ( ON ?auto_608921 ?auto_608920 ) ( ON ?auto_608922 ?auto_608921 ) ( ON ?auto_608923 ?auto_608922 ) ( ON ?auto_608924 ?auto_608923 ) ( ON ?auto_608925 ?auto_608924 ) ( ON ?auto_608926 ?auto_608925 ) ( not ( = ?auto_608916 ?auto_608917 ) ) ( not ( = ?auto_608916 ?auto_608918 ) ) ( not ( = ?auto_608916 ?auto_608919 ) ) ( not ( = ?auto_608916 ?auto_608920 ) ) ( not ( = ?auto_608916 ?auto_608921 ) ) ( not ( = ?auto_608916 ?auto_608922 ) ) ( not ( = ?auto_608916 ?auto_608923 ) ) ( not ( = ?auto_608916 ?auto_608924 ) ) ( not ( = ?auto_608916 ?auto_608925 ) ) ( not ( = ?auto_608916 ?auto_608926 ) ) ( not ( = ?auto_608916 ?auto_608927 ) ) ( not ( = ?auto_608916 ?auto_608928 ) ) ( not ( = ?auto_608916 ?auto_608929 ) ) ( not ( = ?auto_608916 ?auto_608930 ) ) ( not ( = ?auto_608917 ?auto_608918 ) ) ( not ( = ?auto_608917 ?auto_608919 ) ) ( not ( = ?auto_608917 ?auto_608920 ) ) ( not ( = ?auto_608917 ?auto_608921 ) ) ( not ( = ?auto_608917 ?auto_608922 ) ) ( not ( = ?auto_608917 ?auto_608923 ) ) ( not ( = ?auto_608917 ?auto_608924 ) ) ( not ( = ?auto_608917 ?auto_608925 ) ) ( not ( = ?auto_608917 ?auto_608926 ) ) ( not ( = ?auto_608917 ?auto_608927 ) ) ( not ( = ?auto_608917 ?auto_608928 ) ) ( not ( = ?auto_608917 ?auto_608929 ) ) ( not ( = ?auto_608917 ?auto_608930 ) ) ( not ( = ?auto_608918 ?auto_608919 ) ) ( not ( = ?auto_608918 ?auto_608920 ) ) ( not ( = ?auto_608918 ?auto_608921 ) ) ( not ( = ?auto_608918 ?auto_608922 ) ) ( not ( = ?auto_608918 ?auto_608923 ) ) ( not ( = ?auto_608918 ?auto_608924 ) ) ( not ( = ?auto_608918 ?auto_608925 ) ) ( not ( = ?auto_608918 ?auto_608926 ) ) ( not ( = ?auto_608918 ?auto_608927 ) ) ( not ( = ?auto_608918 ?auto_608928 ) ) ( not ( = ?auto_608918 ?auto_608929 ) ) ( not ( = ?auto_608918 ?auto_608930 ) ) ( not ( = ?auto_608919 ?auto_608920 ) ) ( not ( = ?auto_608919 ?auto_608921 ) ) ( not ( = ?auto_608919 ?auto_608922 ) ) ( not ( = ?auto_608919 ?auto_608923 ) ) ( not ( = ?auto_608919 ?auto_608924 ) ) ( not ( = ?auto_608919 ?auto_608925 ) ) ( not ( = ?auto_608919 ?auto_608926 ) ) ( not ( = ?auto_608919 ?auto_608927 ) ) ( not ( = ?auto_608919 ?auto_608928 ) ) ( not ( = ?auto_608919 ?auto_608929 ) ) ( not ( = ?auto_608919 ?auto_608930 ) ) ( not ( = ?auto_608920 ?auto_608921 ) ) ( not ( = ?auto_608920 ?auto_608922 ) ) ( not ( = ?auto_608920 ?auto_608923 ) ) ( not ( = ?auto_608920 ?auto_608924 ) ) ( not ( = ?auto_608920 ?auto_608925 ) ) ( not ( = ?auto_608920 ?auto_608926 ) ) ( not ( = ?auto_608920 ?auto_608927 ) ) ( not ( = ?auto_608920 ?auto_608928 ) ) ( not ( = ?auto_608920 ?auto_608929 ) ) ( not ( = ?auto_608920 ?auto_608930 ) ) ( not ( = ?auto_608921 ?auto_608922 ) ) ( not ( = ?auto_608921 ?auto_608923 ) ) ( not ( = ?auto_608921 ?auto_608924 ) ) ( not ( = ?auto_608921 ?auto_608925 ) ) ( not ( = ?auto_608921 ?auto_608926 ) ) ( not ( = ?auto_608921 ?auto_608927 ) ) ( not ( = ?auto_608921 ?auto_608928 ) ) ( not ( = ?auto_608921 ?auto_608929 ) ) ( not ( = ?auto_608921 ?auto_608930 ) ) ( not ( = ?auto_608922 ?auto_608923 ) ) ( not ( = ?auto_608922 ?auto_608924 ) ) ( not ( = ?auto_608922 ?auto_608925 ) ) ( not ( = ?auto_608922 ?auto_608926 ) ) ( not ( = ?auto_608922 ?auto_608927 ) ) ( not ( = ?auto_608922 ?auto_608928 ) ) ( not ( = ?auto_608922 ?auto_608929 ) ) ( not ( = ?auto_608922 ?auto_608930 ) ) ( not ( = ?auto_608923 ?auto_608924 ) ) ( not ( = ?auto_608923 ?auto_608925 ) ) ( not ( = ?auto_608923 ?auto_608926 ) ) ( not ( = ?auto_608923 ?auto_608927 ) ) ( not ( = ?auto_608923 ?auto_608928 ) ) ( not ( = ?auto_608923 ?auto_608929 ) ) ( not ( = ?auto_608923 ?auto_608930 ) ) ( not ( = ?auto_608924 ?auto_608925 ) ) ( not ( = ?auto_608924 ?auto_608926 ) ) ( not ( = ?auto_608924 ?auto_608927 ) ) ( not ( = ?auto_608924 ?auto_608928 ) ) ( not ( = ?auto_608924 ?auto_608929 ) ) ( not ( = ?auto_608924 ?auto_608930 ) ) ( not ( = ?auto_608925 ?auto_608926 ) ) ( not ( = ?auto_608925 ?auto_608927 ) ) ( not ( = ?auto_608925 ?auto_608928 ) ) ( not ( = ?auto_608925 ?auto_608929 ) ) ( not ( = ?auto_608925 ?auto_608930 ) ) ( not ( = ?auto_608926 ?auto_608927 ) ) ( not ( = ?auto_608926 ?auto_608928 ) ) ( not ( = ?auto_608926 ?auto_608929 ) ) ( not ( = ?auto_608926 ?auto_608930 ) ) ( not ( = ?auto_608927 ?auto_608928 ) ) ( not ( = ?auto_608927 ?auto_608929 ) ) ( not ( = ?auto_608927 ?auto_608930 ) ) ( not ( = ?auto_608928 ?auto_608929 ) ) ( not ( = ?auto_608928 ?auto_608930 ) ) ( not ( = ?auto_608929 ?auto_608930 ) ) ( ON ?auto_608928 ?auto_608929 ) ( CLEAR ?auto_608926 ) ( ON ?auto_608927 ?auto_608928 ) ( CLEAR ?auto_608927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_608916 ?auto_608917 ?auto_608918 ?auto_608919 ?auto_608920 ?auto_608921 ?auto_608922 ?auto_608923 ?auto_608924 ?auto_608925 ?auto_608926 ?auto_608927 )
      ( MAKE-14PILE ?auto_608916 ?auto_608917 ?auto_608918 ?auto_608919 ?auto_608920 ?auto_608921 ?auto_608922 ?auto_608923 ?auto_608924 ?auto_608925 ?auto_608926 ?auto_608927 ?auto_608928 ?auto_608929 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_608974 - BLOCK
      ?auto_608975 - BLOCK
      ?auto_608976 - BLOCK
      ?auto_608977 - BLOCK
      ?auto_608978 - BLOCK
      ?auto_608979 - BLOCK
      ?auto_608980 - BLOCK
      ?auto_608981 - BLOCK
      ?auto_608982 - BLOCK
      ?auto_608983 - BLOCK
      ?auto_608984 - BLOCK
      ?auto_608985 - BLOCK
      ?auto_608986 - BLOCK
      ?auto_608987 - BLOCK
    )
    :vars
    (
      ?auto_608988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_608987 ?auto_608988 ) ( ON-TABLE ?auto_608974 ) ( ON ?auto_608975 ?auto_608974 ) ( ON ?auto_608976 ?auto_608975 ) ( ON ?auto_608977 ?auto_608976 ) ( ON ?auto_608978 ?auto_608977 ) ( ON ?auto_608979 ?auto_608978 ) ( ON ?auto_608980 ?auto_608979 ) ( ON ?auto_608981 ?auto_608980 ) ( ON ?auto_608982 ?auto_608981 ) ( ON ?auto_608983 ?auto_608982 ) ( not ( = ?auto_608974 ?auto_608975 ) ) ( not ( = ?auto_608974 ?auto_608976 ) ) ( not ( = ?auto_608974 ?auto_608977 ) ) ( not ( = ?auto_608974 ?auto_608978 ) ) ( not ( = ?auto_608974 ?auto_608979 ) ) ( not ( = ?auto_608974 ?auto_608980 ) ) ( not ( = ?auto_608974 ?auto_608981 ) ) ( not ( = ?auto_608974 ?auto_608982 ) ) ( not ( = ?auto_608974 ?auto_608983 ) ) ( not ( = ?auto_608974 ?auto_608984 ) ) ( not ( = ?auto_608974 ?auto_608985 ) ) ( not ( = ?auto_608974 ?auto_608986 ) ) ( not ( = ?auto_608974 ?auto_608987 ) ) ( not ( = ?auto_608974 ?auto_608988 ) ) ( not ( = ?auto_608975 ?auto_608976 ) ) ( not ( = ?auto_608975 ?auto_608977 ) ) ( not ( = ?auto_608975 ?auto_608978 ) ) ( not ( = ?auto_608975 ?auto_608979 ) ) ( not ( = ?auto_608975 ?auto_608980 ) ) ( not ( = ?auto_608975 ?auto_608981 ) ) ( not ( = ?auto_608975 ?auto_608982 ) ) ( not ( = ?auto_608975 ?auto_608983 ) ) ( not ( = ?auto_608975 ?auto_608984 ) ) ( not ( = ?auto_608975 ?auto_608985 ) ) ( not ( = ?auto_608975 ?auto_608986 ) ) ( not ( = ?auto_608975 ?auto_608987 ) ) ( not ( = ?auto_608975 ?auto_608988 ) ) ( not ( = ?auto_608976 ?auto_608977 ) ) ( not ( = ?auto_608976 ?auto_608978 ) ) ( not ( = ?auto_608976 ?auto_608979 ) ) ( not ( = ?auto_608976 ?auto_608980 ) ) ( not ( = ?auto_608976 ?auto_608981 ) ) ( not ( = ?auto_608976 ?auto_608982 ) ) ( not ( = ?auto_608976 ?auto_608983 ) ) ( not ( = ?auto_608976 ?auto_608984 ) ) ( not ( = ?auto_608976 ?auto_608985 ) ) ( not ( = ?auto_608976 ?auto_608986 ) ) ( not ( = ?auto_608976 ?auto_608987 ) ) ( not ( = ?auto_608976 ?auto_608988 ) ) ( not ( = ?auto_608977 ?auto_608978 ) ) ( not ( = ?auto_608977 ?auto_608979 ) ) ( not ( = ?auto_608977 ?auto_608980 ) ) ( not ( = ?auto_608977 ?auto_608981 ) ) ( not ( = ?auto_608977 ?auto_608982 ) ) ( not ( = ?auto_608977 ?auto_608983 ) ) ( not ( = ?auto_608977 ?auto_608984 ) ) ( not ( = ?auto_608977 ?auto_608985 ) ) ( not ( = ?auto_608977 ?auto_608986 ) ) ( not ( = ?auto_608977 ?auto_608987 ) ) ( not ( = ?auto_608977 ?auto_608988 ) ) ( not ( = ?auto_608978 ?auto_608979 ) ) ( not ( = ?auto_608978 ?auto_608980 ) ) ( not ( = ?auto_608978 ?auto_608981 ) ) ( not ( = ?auto_608978 ?auto_608982 ) ) ( not ( = ?auto_608978 ?auto_608983 ) ) ( not ( = ?auto_608978 ?auto_608984 ) ) ( not ( = ?auto_608978 ?auto_608985 ) ) ( not ( = ?auto_608978 ?auto_608986 ) ) ( not ( = ?auto_608978 ?auto_608987 ) ) ( not ( = ?auto_608978 ?auto_608988 ) ) ( not ( = ?auto_608979 ?auto_608980 ) ) ( not ( = ?auto_608979 ?auto_608981 ) ) ( not ( = ?auto_608979 ?auto_608982 ) ) ( not ( = ?auto_608979 ?auto_608983 ) ) ( not ( = ?auto_608979 ?auto_608984 ) ) ( not ( = ?auto_608979 ?auto_608985 ) ) ( not ( = ?auto_608979 ?auto_608986 ) ) ( not ( = ?auto_608979 ?auto_608987 ) ) ( not ( = ?auto_608979 ?auto_608988 ) ) ( not ( = ?auto_608980 ?auto_608981 ) ) ( not ( = ?auto_608980 ?auto_608982 ) ) ( not ( = ?auto_608980 ?auto_608983 ) ) ( not ( = ?auto_608980 ?auto_608984 ) ) ( not ( = ?auto_608980 ?auto_608985 ) ) ( not ( = ?auto_608980 ?auto_608986 ) ) ( not ( = ?auto_608980 ?auto_608987 ) ) ( not ( = ?auto_608980 ?auto_608988 ) ) ( not ( = ?auto_608981 ?auto_608982 ) ) ( not ( = ?auto_608981 ?auto_608983 ) ) ( not ( = ?auto_608981 ?auto_608984 ) ) ( not ( = ?auto_608981 ?auto_608985 ) ) ( not ( = ?auto_608981 ?auto_608986 ) ) ( not ( = ?auto_608981 ?auto_608987 ) ) ( not ( = ?auto_608981 ?auto_608988 ) ) ( not ( = ?auto_608982 ?auto_608983 ) ) ( not ( = ?auto_608982 ?auto_608984 ) ) ( not ( = ?auto_608982 ?auto_608985 ) ) ( not ( = ?auto_608982 ?auto_608986 ) ) ( not ( = ?auto_608982 ?auto_608987 ) ) ( not ( = ?auto_608982 ?auto_608988 ) ) ( not ( = ?auto_608983 ?auto_608984 ) ) ( not ( = ?auto_608983 ?auto_608985 ) ) ( not ( = ?auto_608983 ?auto_608986 ) ) ( not ( = ?auto_608983 ?auto_608987 ) ) ( not ( = ?auto_608983 ?auto_608988 ) ) ( not ( = ?auto_608984 ?auto_608985 ) ) ( not ( = ?auto_608984 ?auto_608986 ) ) ( not ( = ?auto_608984 ?auto_608987 ) ) ( not ( = ?auto_608984 ?auto_608988 ) ) ( not ( = ?auto_608985 ?auto_608986 ) ) ( not ( = ?auto_608985 ?auto_608987 ) ) ( not ( = ?auto_608985 ?auto_608988 ) ) ( not ( = ?auto_608986 ?auto_608987 ) ) ( not ( = ?auto_608986 ?auto_608988 ) ) ( not ( = ?auto_608987 ?auto_608988 ) ) ( ON ?auto_608986 ?auto_608987 ) ( ON ?auto_608985 ?auto_608986 ) ( CLEAR ?auto_608983 ) ( ON ?auto_608984 ?auto_608985 ) ( CLEAR ?auto_608984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_608974 ?auto_608975 ?auto_608976 ?auto_608977 ?auto_608978 ?auto_608979 ?auto_608980 ?auto_608981 ?auto_608982 ?auto_608983 ?auto_608984 )
      ( MAKE-14PILE ?auto_608974 ?auto_608975 ?auto_608976 ?auto_608977 ?auto_608978 ?auto_608979 ?auto_608980 ?auto_608981 ?auto_608982 ?auto_608983 ?auto_608984 ?auto_608985 ?auto_608986 ?auto_608987 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_609032 - BLOCK
      ?auto_609033 - BLOCK
      ?auto_609034 - BLOCK
      ?auto_609035 - BLOCK
      ?auto_609036 - BLOCK
      ?auto_609037 - BLOCK
      ?auto_609038 - BLOCK
      ?auto_609039 - BLOCK
      ?auto_609040 - BLOCK
      ?auto_609041 - BLOCK
      ?auto_609042 - BLOCK
      ?auto_609043 - BLOCK
      ?auto_609044 - BLOCK
      ?auto_609045 - BLOCK
    )
    :vars
    (
      ?auto_609046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609045 ?auto_609046 ) ( ON-TABLE ?auto_609032 ) ( ON ?auto_609033 ?auto_609032 ) ( ON ?auto_609034 ?auto_609033 ) ( ON ?auto_609035 ?auto_609034 ) ( ON ?auto_609036 ?auto_609035 ) ( ON ?auto_609037 ?auto_609036 ) ( ON ?auto_609038 ?auto_609037 ) ( ON ?auto_609039 ?auto_609038 ) ( ON ?auto_609040 ?auto_609039 ) ( not ( = ?auto_609032 ?auto_609033 ) ) ( not ( = ?auto_609032 ?auto_609034 ) ) ( not ( = ?auto_609032 ?auto_609035 ) ) ( not ( = ?auto_609032 ?auto_609036 ) ) ( not ( = ?auto_609032 ?auto_609037 ) ) ( not ( = ?auto_609032 ?auto_609038 ) ) ( not ( = ?auto_609032 ?auto_609039 ) ) ( not ( = ?auto_609032 ?auto_609040 ) ) ( not ( = ?auto_609032 ?auto_609041 ) ) ( not ( = ?auto_609032 ?auto_609042 ) ) ( not ( = ?auto_609032 ?auto_609043 ) ) ( not ( = ?auto_609032 ?auto_609044 ) ) ( not ( = ?auto_609032 ?auto_609045 ) ) ( not ( = ?auto_609032 ?auto_609046 ) ) ( not ( = ?auto_609033 ?auto_609034 ) ) ( not ( = ?auto_609033 ?auto_609035 ) ) ( not ( = ?auto_609033 ?auto_609036 ) ) ( not ( = ?auto_609033 ?auto_609037 ) ) ( not ( = ?auto_609033 ?auto_609038 ) ) ( not ( = ?auto_609033 ?auto_609039 ) ) ( not ( = ?auto_609033 ?auto_609040 ) ) ( not ( = ?auto_609033 ?auto_609041 ) ) ( not ( = ?auto_609033 ?auto_609042 ) ) ( not ( = ?auto_609033 ?auto_609043 ) ) ( not ( = ?auto_609033 ?auto_609044 ) ) ( not ( = ?auto_609033 ?auto_609045 ) ) ( not ( = ?auto_609033 ?auto_609046 ) ) ( not ( = ?auto_609034 ?auto_609035 ) ) ( not ( = ?auto_609034 ?auto_609036 ) ) ( not ( = ?auto_609034 ?auto_609037 ) ) ( not ( = ?auto_609034 ?auto_609038 ) ) ( not ( = ?auto_609034 ?auto_609039 ) ) ( not ( = ?auto_609034 ?auto_609040 ) ) ( not ( = ?auto_609034 ?auto_609041 ) ) ( not ( = ?auto_609034 ?auto_609042 ) ) ( not ( = ?auto_609034 ?auto_609043 ) ) ( not ( = ?auto_609034 ?auto_609044 ) ) ( not ( = ?auto_609034 ?auto_609045 ) ) ( not ( = ?auto_609034 ?auto_609046 ) ) ( not ( = ?auto_609035 ?auto_609036 ) ) ( not ( = ?auto_609035 ?auto_609037 ) ) ( not ( = ?auto_609035 ?auto_609038 ) ) ( not ( = ?auto_609035 ?auto_609039 ) ) ( not ( = ?auto_609035 ?auto_609040 ) ) ( not ( = ?auto_609035 ?auto_609041 ) ) ( not ( = ?auto_609035 ?auto_609042 ) ) ( not ( = ?auto_609035 ?auto_609043 ) ) ( not ( = ?auto_609035 ?auto_609044 ) ) ( not ( = ?auto_609035 ?auto_609045 ) ) ( not ( = ?auto_609035 ?auto_609046 ) ) ( not ( = ?auto_609036 ?auto_609037 ) ) ( not ( = ?auto_609036 ?auto_609038 ) ) ( not ( = ?auto_609036 ?auto_609039 ) ) ( not ( = ?auto_609036 ?auto_609040 ) ) ( not ( = ?auto_609036 ?auto_609041 ) ) ( not ( = ?auto_609036 ?auto_609042 ) ) ( not ( = ?auto_609036 ?auto_609043 ) ) ( not ( = ?auto_609036 ?auto_609044 ) ) ( not ( = ?auto_609036 ?auto_609045 ) ) ( not ( = ?auto_609036 ?auto_609046 ) ) ( not ( = ?auto_609037 ?auto_609038 ) ) ( not ( = ?auto_609037 ?auto_609039 ) ) ( not ( = ?auto_609037 ?auto_609040 ) ) ( not ( = ?auto_609037 ?auto_609041 ) ) ( not ( = ?auto_609037 ?auto_609042 ) ) ( not ( = ?auto_609037 ?auto_609043 ) ) ( not ( = ?auto_609037 ?auto_609044 ) ) ( not ( = ?auto_609037 ?auto_609045 ) ) ( not ( = ?auto_609037 ?auto_609046 ) ) ( not ( = ?auto_609038 ?auto_609039 ) ) ( not ( = ?auto_609038 ?auto_609040 ) ) ( not ( = ?auto_609038 ?auto_609041 ) ) ( not ( = ?auto_609038 ?auto_609042 ) ) ( not ( = ?auto_609038 ?auto_609043 ) ) ( not ( = ?auto_609038 ?auto_609044 ) ) ( not ( = ?auto_609038 ?auto_609045 ) ) ( not ( = ?auto_609038 ?auto_609046 ) ) ( not ( = ?auto_609039 ?auto_609040 ) ) ( not ( = ?auto_609039 ?auto_609041 ) ) ( not ( = ?auto_609039 ?auto_609042 ) ) ( not ( = ?auto_609039 ?auto_609043 ) ) ( not ( = ?auto_609039 ?auto_609044 ) ) ( not ( = ?auto_609039 ?auto_609045 ) ) ( not ( = ?auto_609039 ?auto_609046 ) ) ( not ( = ?auto_609040 ?auto_609041 ) ) ( not ( = ?auto_609040 ?auto_609042 ) ) ( not ( = ?auto_609040 ?auto_609043 ) ) ( not ( = ?auto_609040 ?auto_609044 ) ) ( not ( = ?auto_609040 ?auto_609045 ) ) ( not ( = ?auto_609040 ?auto_609046 ) ) ( not ( = ?auto_609041 ?auto_609042 ) ) ( not ( = ?auto_609041 ?auto_609043 ) ) ( not ( = ?auto_609041 ?auto_609044 ) ) ( not ( = ?auto_609041 ?auto_609045 ) ) ( not ( = ?auto_609041 ?auto_609046 ) ) ( not ( = ?auto_609042 ?auto_609043 ) ) ( not ( = ?auto_609042 ?auto_609044 ) ) ( not ( = ?auto_609042 ?auto_609045 ) ) ( not ( = ?auto_609042 ?auto_609046 ) ) ( not ( = ?auto_609043 ?auto_609044 ) ) ( not ( = ?auto_609043 ?auto_609045 ) ) ( not ( = ?auto_609043 ?auto_609046 ) ) ( not ( = ?auto_609044 ?auto_609045 ) ) ( not ( = ?auto_609044 ?auto_609046 ) ) ( not ( = ?auto_609045 ?auto_609046 ) ) ( ON ?auto_609044 ?auto_609045 ) ( ON ?auto_609043 ?auto_609044 ) ( ON ?auto_609042 ?auto_609043 ) ( CLEAR ?auto_609040 ) ( ON ?auto_609041 ?auto_609042 ) ( CLEAR ?auto_609041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_609032 ?auto_609033 ?auto_609034 ?auto_609035 ?auto_609036 ?auto_609037 ?auto_609038 ?auto_609039 ?auto_609040 ?auto_609041 )
      ( MAKE-14PILE ?auto_609032 ?auto_609033 ?auto_609034 ?auto_609035 ?auto_609036 ?auto_609037 ?auto_609038 ?auto_609039 ?auto_609040 ?auto_609041 ?auto_609042 ?auto_609043 ?auto_609044 ?auto_609045 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_609090 - BLOCK
      ?auto_609091 - BLOCK
      ?auto_609092 - BLOCK
      ?auto_609093 - BLOCK
      ?auto_609094 - BLOCK
      ?auto_609095 - BLOCK
      ?auto_609096 - BLOCK
      ?auto_609097 - BLOCK
      ?auto_609098 - BLOCK
      ?auto_609099 - BLOCK
      ?auto_609100 - BLOCK
      ?auto_609101 - BLOCK
      ?auto_609102 - BLOCK
      ?auto_609103 - BLOCK
    )
    :vars
    (
      ?auto_609104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609103 ?auto_609104 ) ( ON-TABLE ?auto_609090 ) ( ON ?auto_609091 ?auto_609090 ) ( ON ?auto_609092 ?auto_609091 ) ( ON ?auto_609093 ?auto_609092 ) ( ON ?auto_609094 ?auto_609093 ) ( ON ?auto_609095 ?auto_609094 ) ( ON ?auto_609096 ?auto_609095 ) ( ON ?auto_609097 ?auto_609096 ) ( not ( = ?auto_609090 ?auto_609091 ) ) ( not ( = ?auto_609090 ?auto_609092 ) ) ( not ( = ?auto_609090 ?auto_609093 ) ) ( not ( = ?auto_609090 ?auto_609094 ) ) ( not ( = ?auto_609090 ?auto_609095 ) ) ( not ( = ?auto_609090 ?auto_609096 ) ) ( not ( = ?auto_609090 ?auto_609097 ) ) ( not ( = ?auto_609090 ?auto_609098 ) ) ( not ( = ?auto_609090 ?auto_609099 ) ) ( not ( = ?auto_609090 ?auto_609100 ) ) ( not ( = ?auto_609090 ?auto_609101 ) ) ( not ( = ?auto_609090 ?auto_609102 ) ) ( not ( = ?auto_609090 ?auto_609103 ) ) ( not ( = ?auto_609090 ?auto_609104 ) ) ( not ( = ?auto_609091 ?auto_609092 ) ) ( not ( = ?auto_609091 ?auto_609093 ) ) ( not ( = ?auto_609091 ?auto_609094 ) ) ( not ( = ?auto_609091 ?auto_609095 ) ) ( not ( = ?auto_609091 ?auto_609096 ) ) ( not ( = ?auto_609091 ?auto_609097 ) ) ( not ( = ?auto_609091 ?auto_609098 ) ) ( not ( = ?auto_609091 ?auto_609099 ) ) ( not ( = ?auto_609091 ?auto_609100 ) ) ( not ( = ?auto_609091 ?auto_609101 ) ) ( not ( = ?auto_609091 ?auto_609102 ) ) ( not ( = ?auto_609091 ?auto_609103 ) ) ( not ( = ?auto_609091 ?auto_609104 ) ) ( not ( = ?auto_609092 ?auto_609093 ) ) ( not ( = ?auto_609092 ?auto_609094 ) ) ( not ( = ?auto_609092 ?auto_609095 ) ) ( not ( = ?auto_609092 ?auto_609096 ) ) ( not ( = ?auto_609092 ?auto_609097 ) ) ( not ( = ?auto_609092 ?auto_609098 ) ) ( not ( = ?auto_609092 ?auto_609099 ) ) ( not ( = ?auto_609092 ?auto_609100 ) ) ( not ( = ?auto_609092 ?auto_609101 ) ) ( not ( = ?auto_609092 ?auto_609102 ) ) ( not ( = ?auto_609092 ?auto_609103 ) ) ( not ( = ?auto_609092 ?auto_609104 ) ) ( not ( = ?auto_609093 ?auto_609094 ) ) ( not ( = ?auto_609093 ?auto_609095 ) ) ( not ( = ?auto_609093 ?auto_609096 ) ) ( not ( = ?auto_609093 ?auto_609097 ) ) ( not ( = ?auto_609093 ?auto_609098 ) ) ( not ( = ?auto_609093 ?auto_609099 ) ) ( not ( = ?auto_609093 ?auto_609100 ) ) ( not ( = ?auto_609093 ?auto_609101 ) ) ( not ( = ?auto_609093 ?auto_609102 ) ) ( not ( = ?auto_609093 ?auto_609103 ) ) ( not ( = ?auto_609093 ?auto_609104 ) ) ( not ( = ?auto_609094 ?auto_609095 ) ) ( not ( = ?auto_609094 ?auto_609096 ) ) ( not ( = ?auto_609094 ?auto_609097 ) ) ( not ( = ?auto_609094 ?auto_609098 ) ) ( not ( = ?auto_609094 ?auto_609099 ) ) ( not ( = ?auto_609094 ?auto_609100 ) ) ( not ( = ?auto_609094 ?auto_609101 ) ) ( not ( = ?auto_609094 ?auto_609102 ) ) ( not ( = ?auto_609094 ?auto_609103 ) ) ( not ( = ?auto_609094 ?auto_609104 ) ) ( not ( = ?auto_609095 ?auto_609096 ) ) ( not ( = ?auto_609095 ?auto_609097 ) ) ( not ( = ?auto_609095 ?auto_609098 ) ) ( not ( = ?auto_609095 ?auto_609099 ) ) ( not ( = ?auto_609095 ?auto_609100 ) ) ( not ( = ?auto_609095 ?auto_609101 ) ) ( not ( = ?auto_609095 ?auto_609102 ) ) ( not ( = ?auto_609095 ?auto_609103 ) ) ( not ( = ?auto_609095 ?auto_609104 ) ) ( not ( = ?auto_609096 ?auto_609097 ) ) ( not ( = ?auto_609096 ?auto_609098 ) ) ( not ( = ?auto_609096 ?auto_609099 ) ) ( not ( = ?auto_609096 ?auto_609100 ) ) ( not ( = ?auto_609096 ?auto_609101 ) ) ( not ( = ?auto_609096 ?auto_609102 ) ) ( not ( = ?auto_609096 ?auto_609103 ) ) ( not ( = ?auto_609096 ?auto_609104 ) ) ( not ( = ?auto_609097 ?auto_609098 ) ) ( not ( = ?auto_609097 ?auto_609099 ) ) ( not ( = ?auto_609097 ?auto_609100 ) ) ( not ( = ?auto_609097 ?auto_609101 ) ) ( not ( = ?auto_609097 ?auto_609102 ) ) ( not ( = ?auto_609097 ?auto_609103 ) ) ( not ( = ?auto_609097 ?auto_609104 ) ) ( not ( = ?auto_609098 ?auto_609099 ) ) ( not ( = ?auto_609098 ?auto_609100 ) ) ( not ( = ?auto_609098 ?auto_609101 ) ) ( not ( = ?auto_609098 ?auto_609102 ) ) ( not ( = ?auto_609098 ?auto_609103 ) ) ( not ( = ?auto_609098 ?auto_609104 ) ) ( not ( = ?auto_609099 ?auto_609100 ) ) ( not ( = ?auto_609099 ?auto_609101 ) ) ( not ( = ?auto_609099 ?auto_609102 ) ) ( not ( = ?auto_609099 ?auto_609103 ) ) ( not ( = ?auto_609099 ?auto_609104 ) ) ( not ( = ?auto_609100 ?auto_609101 ) ) ( not ( = ?auto_609100 ?auto_609102 ) ) ( not ( = ?auto_609100 ?auto_609103 ) ) ( not ( = ?auto_609100 ?auto_609104 ) ) ( not ( = ?auto_609101 ?auto_609102 ) ) ( not ( = ?auto_609101 ?auto_609103 ) ) ( not ( = ?auto_609101 ?auto_609104 ) ) ( not ( = ?auto_609102 ?auto_609103 ) ) ( not ( = ?auto_609102 ?auto_609104 ) ) ( not ( = ?auto_609103 ?auto_609104 ) ) ( ON ?auto_609102 ?auto_609103 ) ( ON ?auto_609101 ?auto_609102 ) ( ON ?auto_609100 ?auto_609101 ) ( ON ?auto_609099 ?auto_609100 ) ( CLEAR ?auto_609097 ) ( ON ?auto_609098 ?auto_609099 ) ( CLEAR ?auto_609098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_609090 ?auto_609091 ?auto_609092 ?auto_609093 ?auto_609094 ?auto_609095 ?auto_609096 ?auto_609097 ?auto_609098 )
      ( MAKE-14PILE ?auto_609090 ?auto_609091 ?auto_609092 ?auto_609093 ?auto_609094 ?auto_609095 ?auto_609096 ?auto_609097 ?auto_609098 ?auto_609099 ?auto_609100 ?auto_609101 ?auto_609102 ?auto_609103 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_609148 - BLOCK
      ?auto_609149 - BLOCK
      ?auto_609150 - BLOCK
      ?auto_609151 - BLOCK
      ?auto_609152 - BLOCK
      ?auto_609153 - BLOCK
      ?auto_609154 - BLOCK
      ?auto_609155 - BLOCK
      ?auto_609156 - BLOCK
      ?auto_609157 - BLOCK
      ?auto_609158 - BLOCK
      ?auto_609159 - BLOCK
      ?auto_609160 - BLOCK
      ?auto_609161 - BLOCK
    )
    :vars
    (
      ?auto_609162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609161 ?auto_609162 ) ( ON-TABLE ?auto_609148 ) ( ON ?auto_609149 ?auto_609148 ) ( ON ?auto_609150 ?auto_609149 ) ( ON ?auto_609151 ?auto_609150 ) ( ON ?auto_609152 ?auto_609151 ) ( ON ?auto_609153 ?auto_609152 ) ( ON ?auto_609154 ?auto_609153 ) ( not ( = ?auto_609148 ?auto_609149 ) ) ( not ( = ?auto_609148 ?auto_609150 ) ) ( not ( = ?auto_609148 ?auto_609151 ) ) ( not ( = ?auto_609148 ?auto_609152 ) ) ( not ( = ?auto_609148 ?auto_609153 ) ) ( not ( = ?auto_609148 ?auto_609154 ) ) ( not ( = ?auto_609148 ?auto_609155 ) ) ( not ( = ?auto_609148 ?auto_609156 ) ) ( not ( = ?auto_609148 ?auto_609157 ) ) ( not ( = ?auto_609148 ?auto_609158 ) ) ( not ( = ?auto_609148 ?auto_609159 ) ) ( not ( = ?auto_609148 ?auto_609160 ) ) ( not ( = ?auto_609148 ?auto_609161 ) ) ( not ( = ?auto_609148 ?auto_609162 ) ) ( not ( = ?auto_609149 ?auto_609150 ) ) ( not ( = ?auto_609149 ?auto_609151 ) ) ( not ( = ?auto_609149 ?auto_609152 ) ) ( not ( = ?auto_609149 ?auto_609153 ) ) ( not ( = ?auto_609149 ?auto_609154 ) ) ( not ( = ?auto_609149 ?auto_609155 ) ) ( not ( = ?auto_609149 ?auto_609156 ) ) ( not ( = ?auto_609149 ?auto_609157 ) ) ( not ( = ?auto_609149 ?auto_609158 ) ) ( not ( = ?auto_609149 ?auto_609159 ) ) ( not ( = ?auto_609149 ?auto_609160 ) ) ( not ( = ?auto_609149 ?auto_609161 ) ) ( not ( = ?auto_609149 ?auto_609162 ) ) ( not ( = ?auto_609150 ?auto_609151 ) ) ( not ( = ?auto_609150 ?auto_609152 ) ) ( not ( = ?auto_609150 ?auto_609153 ) ) ( not ( = ?auto_609150 ?auto_609154 ) ) ( not ( = ?auto_609150 ?auto_609155 ) ) ( not ( = ?auto_609150 ?auto_609156 ) ) ( not ( = ?auto_609150 ?auto_609157 ) ) ( not ( = ?auto_609150 ?auto_609158 ) ) ( not ( = ?auto_609150 ?auto_609159 ) ) ( not ( = ?auto_609150 ?auto_609160 ) ) ( not ( = ?auto_609150 ?auto_609161 ) ) ( not ( = ?auto_609150 ?auto_609162 ) ) ( not ( = ?auto_609151 ?auto_609152 ) ) ( not ( = ?auto_609151 ?auto_609153 ) ) ( not ( = ?auto_609151 ?auto_609154 ) ) ( not ( = ?auto_609151 ?auto_609155 ) ) ( not ( = ?auto_609151 ?auto_609156 ) ) ( not ( = ?auto_609151 ?auto_609157 ) ) ( not ( = ?auto_609151 ?auto_609158 ) ) ( not ( = ?auto_609151 ?auto_609159 ) ) ( not ( = ?auto_609151 ?auto_609160 ) ) ( not ( = ?auto_609151 ?auto_609161 ) ) ( not ( = ?auto_609151 ?auto_609162 ) ) ( not ( = ?auto_609152 ?auto_609153 ) ) ( not ( = ?auto_609152 ?auto_609154 ) ) ( not ( = ?auto_609152 ?auto_609155 ) ) ( not ( = ?auto_609152 ?auto_609156 ) ) ( not ( = ?auto_609152 ?auto_609157 ) ) ( not ( = ?auto_609152 ?auto_609158 ) ) ( not ( = ?auto_609152 ?auto_609159 ) ) ( not ( = ?auto_609152 ?auto_609160 ) ) ( not ( = ?auto_609152 ?auto_609161 ) ) ( not ( = ?auto_609152 ?auto_609162 ) ) ( not ( = ?auto_609153 ?auto_609154 ) ) ( not ( = ?auto_609153 ?auto_609155 ) ) ( not ( = ?auto_609153 ?auto_609156 ) ) ( not ( = ?auto_609153 ?auto_609157 ) ) ( not ( = ?auto_609153 ?auto_609158 ) ) ( not ( = ?auto_609153 ?auto_609159 ) ) ( not ( = ?auto_609153 ?auto_609160 ) ) ( not ( = ?auto_609153 ?auto_609161 ) ) ( not ( = ?auto_609153 ?auto_609162 ) ) ( not ( = ?auto_609154 ?auto_609155 ) ) ( not ( = ?auto_609154 ?auto_609156 ) ) ( not ( = ?auto_609154 ?auto_609157 ) ) ( not ( = ?auto_609154 ?auto_609158 ) ) ( not ( = ?auto_609154 ?auto_609159 ) ) ( not ( = ?auto_609154 ?auto_609160 ) ) ( not ( = ?auto_609154 ?auto_609161 ) ) ( not ( = ?auto_609154 ?auto_609162 ) ) ( not ( = ?auto_609155 ?auto_609156 ) ) ( not ( = ?auto_609155 ?auto_609157 ) ) ( not ( = ?auto_609155 ?auto_609158 ) ) ( not ( = ?auto_609155 ?auto_609159 ) ) ( not ( = ?auto_609155 ?auto_609160 ) ) ( not ( = ?auto_609155 ?auto_609161 ) ) ( not ( = ?auto_609155 ?auto_609162 ) ) ( not ( = ?auto_609156 ?auto_609157 ) ) ( not ( = ?auto_609156 ?auto_609158 ) ) ( not ( = ?auto_609156 ?auto_609159 ) ) ( not ( = ?auto_609156 ?auto_609160 ) ) ( not ( = ?auto_609156 ?auto_609161 ) ) ( not ( = ?auto_609156 ?auto_609162 ) ) ( not ( = ?auto_609157 ?auto_609158 ) ) ( not ( = ?auto_609157 ?auto_609159 ) ) ( not ( = ?auto_609157 ?auto_609160 ) ) ( not ( = ?auto_609157 ?auto_609161 ) ) ( not ( = ?auto_609157 ?auto_609162 ) ) ( not ( = ?auto_609158 ?auto_609159 ) ) ( not ( = ?auto_609158 ?auto_609160 ) ) ( not ( = ?auto_609158 ?auto_609161 ) ) ( not ( = ?auto_609158 ?auto_609162 ) ) ( not ( = ?auto_609159 ?auto_609160 ) ) ( not ( = ?auto_609159 ?auto_609161 ) ) ( not ( = ?auto_609159 ?auto_609162 ) ) ( not ( = ?auto_609160 ?auto_609161 ) ) ( not ( = ?auto_609160 ?auto_609162 ) ) ( not ( = ?auto_609161 ?auto_609162 ) ) ( ON ?auto_609160 ?auto_609161 ) ( ON ?auto_609159 ?auto_609160 ) ( ON ?auto_609158 ?auto_609159 ) ( ON ?auto_609157 ?auto_609158 ) ( ON ?auto_609156 ?auto_609157 ) ( CLEAR ?auto_609154 ) ( ON ?auto_609155 ?auto_609156 ) ( CLEAR ?auto_609155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_609148 ?auto_609149 ?auto_609150 ?auto_609151 ?auto_609152 ?auto_609153 ?auto_609154 ?auto_609155 )
      ( MAKE-14PILE ?auto_609148 ?auto_609149 ?auto_609150 ?auto_609151 ?auto_609152 ?auto_609153 ?auto_609154 ?auto_609155 ?auto_609156 ?auto_609157 ?auto_609158 ?auto_609159 ?auto_609160 ?auto_609161 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_609206 - BLOCK
      ?auto_609207 - BLOCK
      ?auto_609208 - BLOCK
      ?auto_609209 - BLOCK
      ?auto_609210 - BLOCK
      ?auto_609211 - BLOCK
      ?auto_609212 - BLOCK
      ?auto_609213 - BLOCK
      ?auto_609214 - BLOCK
      ?auto_609215 - BLOCK
      ?auto_609216 - BLOCK
      ?auto_609217 - BLOCK
      ?auto_609218 - BLOCK
      ?auto_609219 - BLOCK
    )
    :vars
    (
      ?auto_609220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609219 ?auto_609220 ) ( ON-TABLE ?auto_609206 ) ( ON ?auto_609207 ?auto_609206 ) ( ON ?auto_609208 ?auto_609207 ) ( ON ?auto_609209 ?auto_609208 ) ( ON ?auto_609210 ?auto_609209 ) ( ON ?auto_609211 ?auto_609210 ) ( not ( = ?auto_609206 ?auto_609207 ) ) ( not ( = ?auto_609206 ?auto_609208 ) ) ( not ( = ?auto_609206 ?auto_609209 ) ) ( not ( = ?auto_609206 ?auto_609210 ) ) ( not ( = ?auto_609206 ?auto_609211 ) ) ( not ( = ?auto_609206 ?auto_609212 ) ) ( not ( = ?auto_609206 ?auto_609213 ) ) ( not ( = ?auto_609206 ?auto_609214 ) ) ( not ( = ?auto_609206 ?auto_609215 ) ) ( not ( = ?auto_609206 ?auto_609216 ) ) ( not ( = ?auto_609206 ?auto_609217 ) ) ( not ( = ?auto_609206 ?auto_609218 ) ) ( not ( = ?auto_609206 ?auto_609219 ) ) ( not ( = ?auto_609206 ?auto_609220 ) ) ( not ( = ?auto_609207 ?auto_609208 ) ) ( not ( = ?auto_609207 ?auto_609209 ) ) ( not ( = ?auto_609207 ?auto_609210 ) ) ( not ( = ?auto_609207 ?auto_609211 ) ) ( not ( = ?auto_609207 ?auto_609212 ) ) ( not ( = ?auto_609207 ?auto_609213 ) ) ( not ( = ?auto_609207 ?auto_609214 ) ) ( not ( = ?auto_609207 ?auto_609215 ) ) ( not ( = ?auto_609207 ?auto_609216 ) ) ( not ( = ?auto_609207 ?auto_609217 ) ) ( not ( = ?auto_609207 ?auto_609218 ) ) ( not ( = ?auto_609207 ?auto_609219 ) ) ( not ( = ?auto_609207 ?auto_609220 ) ) ( not ( = ?auto_609208 ?auto_609209 ) ) ( not ( = ?auto_609208 ?auto_609210 ) ) ( not ( = ?auto_609208 ?auto_609211 ) ) ( not ( = ?auto_609208 ?auto_609212 ) ) ( not ( = ?auto_609208 ?auto_609213 ) ) ( not ( = ?auto_609208 ?auto_609214 ) ) ( not ( = ?auto_609208 ?auto_609215 ) ) ( not ( = ?auto_609208 ?auto_609216 ) ) ( not ( = ?auto_609208 ?auto_609217 ) ) ( not ( = ?auto_609208 ?auto_609218 ) ) ( not ( = ?auto_609208 ?auto_609219 ) ) ( not ( = ?auto_609208 ?auto_609220 ) ) ( not ( = ?auto_609209 ?auto_609210 ) ) ( not ( = ?auto_609209 ?auto_609211 ) ) ( not ( = ?auto_609209 ?auto_609212 ) ) ( not ( = ?auto_609209 ?auto_609213 ) ) ( not ( = ?auto_609209 ?auto_609214 ) ) ( not ( = ?auto_609209 ?auto_609215 ) ) ( not ( = ?auto_609209 ?auto_609216 ) ) ( not ( = ?auto_609209 ?auto_609217 ) ) ( not ( = ?auto_609209 ?auto_609218 ) ) ( not ( = ?auto_609209 ?auto_609219 ) ) ( not ( = ?auto_609209 ?auto_609220 ) ) ( not ( = ?auto_609210 ?auto_609211 ) ) ( not ( = ?auto_609210 ?auto_609212 ) ) ( not ( = ?auto_609210 ?auto_609213 ) ) ( not ( = ?auto_609210 ?auto_609214 ) ) ( not ( = ?auto_609210 ?auto_609215 ) ) ( not ( = ?auto_609210 ?auto_609216 ) ) ( not ( = ?auto_609210 ?auto_609217 ) ) ( not ( = ?auto_609210 ?auto_609218 ) ) ( not ( = ?auto_609210 ?auto_609219 ) ) ( not ( = ?auto_609210 ?auto_609220 ) ) ( not ( = ?auto_609211 ?auto_609212 ) ) ( not ( = ?auto_609211 ?auto_609213 ) ) ( not ( = ?auto_609211 ?auto_609214 ) ) ( not ( = ?auto_609211 ?auto_609215 ) ) ( not ( = ?auto_609211 ?auto_609216 ) ) ( not ( = ?auto_609211 ?auto_609217 ) ) ( not ( = ?auto_609211 ?auto_609218 ) ) ( not ( = ?auto_609211 ?auto_609219 ) ) ( not ( = ?auto_609211 ?auto_609220 ) ) ( not ( = ?auto_609212 ?auto_609213 ) ) ( not ( = ?auto_609212 ?auto_609214 ) ) ( not ( = ?auto_609212 ?auto_609215 ) ) ( not ( = ?auto_609212 ?auto_609216 ) ) ( not ( = ?auto_609212 ?auto_609217 ) ) ( not ( = ?auto_609212 ?auto_609218 ) ) ( not ( = ?auto_609212 ?auto_609219 ) ) ( not ( = ?auto_609212 ?auto_609220 ) ) ( not ( = ?auto_609213 ?auto_609214 ) ) ( not ( = ?auto_609213 ?auto_609215 ) ) ( not ( = ?auto_609213 ?auto_609216 ) ) ( not ( = ?auto_609213 ?auto_609217 ) ) ( not ( = ?auto_609213 ?auto_609218 ) ) ( not ( = ?auto_609213 ?auto_609219 ) ) ( not ( = ?auto_609213 ?auto_609220 ) ) ( not ( = ?auto_609214 ?auto_609215 ) ) ( not ( = ?auto_609214 ?auto_609216 ) ) ( not ( = ?auto_609214 ?auto_609217 ) ) ( not ( = ?auto_609214 ?auto_609218 ) ) ( not ( = ?auto_609214 ?auto_609219 ) ) ( not ( = ?auto_609214 ?auto_609220 ) ) ( not ( = ?auto_609215 ?auto_609216 ) ) ( not ( = ?auto_609215 ?auto_609217 ) ) ( not ( = ?auto_609215 ?auto_609218 ) ) ( not ( = ?auto_609215 ?auto_609219 ) ) ( not ( = ?auto_609215 ?auto_609220 ) ) ( not ( = ?auto_609216 ?auto_609217 ) ) ( not ( = ?auto_609216 ?auto_609218 ) ) ( not ( = ?auto_609216 ?auto_609219 ) ) ( not ( = ?auto_609216 ?auto_609220 ) ) ( not ( = ?auto_609217 ?auto_609218 ) ) ( not ( = ?auto_609217 ?auto_609219 ) ) ( not ( = ?auto_609217 ?auto_609220 ) ) ( not ( = ?auto_609218 ?auto_609219 ) ) ( not ( = ?auto_609218 ?auto_609220 ) ) ( not ( = ?auto_609219 ?auto_609220 ) ) ( ON ?auto_609218 ?auto_609219 ) ( ON ?auto_609217 ?auto_609218 ) ( ON ?auto_609216 ?auto_609217 ) ( ON ?auto_609215 ?auto_609216 ) ( ON ?auto_609214 ?auto_609215 ) ( ON ?auto_609213 ?auto_609214 ) ( CLEAR ?auto_609211 ) ( ON ?auto_609212 ?auto_609213 ) ( CLEAR ?auto_609212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_609206 ?auto_609207 ?auto_609208 ?auto_609209 ?auto_609210 ?auto_609211 ?auto_609212 )
      ( MAKE-14PILE ?auto_609206 ?auto_609207 ?auto_609208 ?auto_609209 ?auto_609210 ?auto_609211 ?auto_609212 ?auto_609213 ?auto_609214 ?auto_609215 ?auto_609216 ?auto_609217 ?auto_609218 ?auto_609219 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_609264 - BLOCK
      ?auto_609265 - BLOCK
      ?auto_609266 - BLOCK
      ?auto_609267 - BLOCK
      ?auto_609268 - BLOCK
      ?auto_609269 - BLOCK
      ?auto_609270 - BLOCK
      ?auto_609271 - BLOCK
      ?auto_609272 - BLOCK
      ?auto_609273 - BLOCK
      ?auto_609274 - BLOCK
      ?auto_609275 - BLOCK
      ?auto_609276 - BLOCK
      ?auto_609277 - BLOCK
    )
    :vars
    (
      ?auto_609278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609277 ?auto_609278 ) ( ON-TABLE ?auto_609264 ) ( ON ?auto_609265 ?auto_609264 ) ( ON ?auto_609266 ?auto_609265 ) ( ON ?auto_609267 ?auto_609266 ) ( ON ?auto_609268 ?auto_609267 ) ( not ( = ?auto_609264 ?auto_609265 ) ) ( not ( = ?auto_609264 ?auto_609266 ) ) ( not ( = ?auto_609264 ?auto_609267 ) ) ( not ( = ?auto_609264 ?auto_609268 ) ) ( not ( = ?auto_609264 ?auto_609269 ) ) ( not ( = ?auto_609264 ?auto_609270 ) ) ( not ( = ?auto_609264 ?auto_609271 ) ) ( not ( = ?auto_609264 ?auto_609272 ) ) ( not ( = ?auto_609264 ?auto_609273 ) ) ( not ( = ?auto_609264 ?auto_609274 ) ) ( not ( = ?auto_609264 ?auto_609275 ) ) ( not ( = ?auto_609264 ?auto_609276 ) ) ( not ( = ?auto_609264 ?auto_609277 ) ) ( not ( = ?auto_609264 ?auto_609278 ) ) ( not ( = ?auto_609265 ?auto_609266 ) ) ( not ( = ?auto_609265 ?auto_609267 ) ) ( not ( = ?auto_609265 ?auto_609268 ) ) ( not ( = ?auto_609265 ?auto_609269 ) ) ( not ( = ?auto_609265 ?auto_609270 ) ) ( not ( = ?auto_609265 ?auto_609271 ) ) ( not ( = ?auto_609265 ?auto_609272 ) ) ( not ( = ?auto_609265 ?auto_609273 ) ) ( not ( = ?auto_609265 ?auto_609274 ) ) ( not ( = ?auto_609265 ?auto_609275 ) ) ( not ( = ?auto_609265 ?auto_609276 ) ) ( not ( = ?auto_609265 ?auto_609277 ) ) ( not ( = ?auto_609265 ?auto_609278 ) ) ( not ( = ?auto_609266 ?auto_609267 ) ) ( not ( = ?auto_609266 ?auto_609268 ) ) ( not ( = ?auto_609266 ?auto_609269 ) ) ( not ( = ?auto_609266 ?auto_609270 ) ) ( not ( = ?auto_609266 ?auto_609271 ) ) ( not ( = ?auto_609266 ?auto_609272 ) ) ( not ( = ?auto_609266 ?auto_609273 ) ) ( not ( = ?auto_609266 ?auto_609274 ) ) ( not ( = ?auto_609266 ?auto_609275 ) ) ( not ( = ?auto_609266 ?auto_609276 ) ) ( not ( = ?auto_609266 ?auto_609277 ) ) ( not ( = ?auto_609266 ?auto_609278 ) ) ( not ( = ?auto_609267 ?auto_609268 ) ) ( not ( = ?auto_609267 ?auto_609269 ) ) ( not ( = ?auto_609267 ?auto_609270 ) ) ( not ( = ?auto_609267 ?auto_609271 ) ) ( not ( = ?auto_609267 ?auto_609272 ) ) ( not ( = ?auto_609267 ?auto_609273 ) ) ( not ( = ?auto_609267 ?auto_609274 ) ) ( not ( = ?auto_609267 ?auto_609275 ) ) ( not ( = ?auto_609267 ?auto_609276 ) ) ( not ( = ?auto_609267 ?auto_609277 ) ) ( not ( = ?auto_609267 ?auto_609278 ) ) ( not ( = ?auto_609268 ?auto_609269 ) ) ( not ( = ?auto_609268 ?auto_609270 ) ) ( not ( = ?auto_609268 ?auto_609271 ) ) ( not ( = ?auto_609268 ?auto_609272 ) ) ( not ( = ?auto_609268 ?auto_609273 ) ) ( not ( = ?auto_609268 ?auto_609274 ) ) ( not ( = ?auto_609268 ?auto_609275 ) ) ( not ( = ?auto_609268 ?auto_609276 ) ) ( not ( = ?auto_609268 ?auto_609277 ) ) ( not ( = ?auto_609268 ?auto_609278 ) ) ( not ( = ?auto_609269 ?auto_609270 ) ) ( not ( = ?auto_609269 ?auto_609271 ) ) ( not ( = ?auto_609269 ?auto_609272 ) ) ( not ( = ?auto_609269 ?auto_609273 ) ) ( not ( = ?auto_609269 ?auto_609274 ) ) ( not ( = ?auto_609269 ?auto_609275 ) ) ( not ( = ?auto_609269 ?auto_609276 ) ) ( not ( = ?auto_609269 ?auto_609277 ) ) ( not ( = ?auto_609269 ?auto_609278 ) ) ( not ( = ?auto_609270 ?auto_609271 ) ) ( not ( = ?auto_609270 ?auto_609272 ) ) ( not ( = ?auto_609270 ?auto_609273 ) ) ( not ( = ?auto_609270 ?auto_609274 ) ) ( not ( = ?auto_609270 ?auto_609275 ) ) ( not ( = ?auto_609270 ?auto_609276 ) ) ( not ( = ?auto_609270 ?auto_609277 ) ) ( not ( = ?auto_609270 ?auto_609278 ) ) ( not ( = ?auto_609271 ?auto_609272 ) ) ( not ( = ?auto_609271 ?auto_609273 ) ) ( not ( = ?auto_609271 ?auto_609274 ) ) ( not ( = ?auto_609271 ?auto_609275 ) ) ( not ( = ?auto_609271 ?auto_609276 ) ) ( not ( = ?auto_609271 ?auto_609277 ) ) ( not ( = ?auto_609271 ?auto_609278 ) ) ( not ( = ?auto_609272 ?auto_609273 ) ) ( not ( = ?auto_609272 ?auto_609274 ) ) ( not ( = ?auto_609272 ?auto_609275 ) ) ( not ( = ?auto_609272 ?auto_609276 ) ) ( not ( = ?auto_609272 ?auto_609277 ) ) ( not ( = ?auto_609272 ?auto_609278 ) ) ( not ( = ?auto_609273 ?auto_609274 ) ) ( not ( = ?auto_609273 ?auto_609275 ) ) ( not ( = ?auto_609273 ?auto_609276 ) ) ( not ( = ?auto_609273 ?auto_609277 ) ) ( not ( = ?auto_609273 ?auto_609278 ) ) ( not ( = ?auto_609274 ?auto_609275 ) ) ( not ( = ?auto_609274 ?auto_609276 ) ) ( not ( = ?auto_609274 ?auto_609277 ) ) ( not ( = ?auto_609274 ?auto_609278 ) ) ( not ( = ?auto_609275 ?auto_609276 ) ) ( not ( = ?auto_609275 ?auto_609277 ) ) ( not ( = ?auto_609275 ?auto_609278 ) ) ( not ( = ?auto_609276 ?auto_609277 ) ) ( not ( = ?auto_609276 ?auto_609278 ) ) ( not ( = ?auto_609277 ?auto_609278 ) ) ( ON ?auto_609276 ?auto_609277 ) ( ON ?auto_609275 ?auto_609276 ) ( ON ?auto_609274 ?auto_609275 ) ( ON ?auto_609273 ?auto_609274 ) ( ON ?auto_609272 ?auto_609273 ) ( ON ?auto_609271 ?auto_609272 ) ( ON ?auto_609270 ?auto_609271 ) ( CLEAR ?auto_609268 ) ( ON ?auto_609269 ?auto_609270 ) ( CLEAR ?auto_609269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_609264 ?auto_609265 ?auto_609266 ?auto_609267 ?auto_609268 ?auto_609269 )
      ( MAKE-14PILE ?auto_609264 ?auto_609265 ?auto_609266 ?auto_609267 ?auto_609268 ?auto_609269 ?auto_609270 ?auto_609271 ?auto_609272 ?auto_609273 ?auto_609274 ?auto_609275 ?auto_609276 ?auto_609277 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_609322 - BLOCK
      ?auto_609323 - BLOCK
      ?auto_609324 - BLOCK
      ?auto_609325 - BLOCK
      ?auto_609326 - BLOCK
      ?auto_609327 - BLOCK
      ?auto_609328 - BLOCK
      ?auto_609329 - BLOCK
      ?auto_609330 - BLOCK
      ?auto_609331 - BLOCK
      ?auto_609332 - BLOCK
      ?auto_609333 - BLOCK
      ?auto_609334 - BLOCK
      ?auto_609335 - BLOCK
    )
    :vars
    (
      ?auto_609336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609335 ?auto_609336 ) ( ON-TABLE ?auto_609322 ) ( ON ?auto_609323 ?auto_609322 ) ( ON ?auto_609324 ?auto_609323 ) ( ON ?auto_609325 ?auto_609324 ) ( not ( = ?auto_609322 ?auto_609323 ) ) ( not ( = ?auto_609322 ?auto_609324 ) ) ( not ( = ?auto_609322 ?auto_609325 ) ) ( not ( = ?auto_609322 ?auto_609326 ) ) ( not ( = ?auto_609322 ?auto_609327 ) ) ( not ( = ?auto_609322 ?auto_609328 ) ) ( not ( = ?auto_609322 ?auto_609329 ) ) ( not ( = ?auto_609322 ?auto_609330 ) ) ( not ( = ?auto_609322 ?auto_609331 ) ) ( not ( = ?auto_609322 ?auto_609332 ) ) ( not ( = ?auto_609322 ?auto_609333 ) ) ( not ( = ?auto_609322 ?auto_609334 ) ) ( not ( = ?auto_609322 ?auto_609335 ) ) ( not ( = ?auto_609322 ?auto_609336 ) ) ( not ( = ?auto_609323 ?auto_609324 ) ) ( not ( = ?auto_609323 ?auto_609325 ) ) ( not ( = ?auto_609323 ?auto_609326 ) ) ( not ( = ?auto_609323 ?auto_609327 ) ) ( not ( = ?auto_609323 ?auto_609328 ) ) ( not ( = ?auto_609323 ?auto_609329 ) ) ( not ( = ?auto_609323 ?auto_609330 ) ) ( not ( = ?auto_609323 ?auto_609331 ) ) ( not ( = ?auto_609323 ?auto_609332 ) ) ( not ( = ?auto_609323 ?auto_609333 ) ) ( not ( = ?auto_609323 ?auto_609334 ) ) ( not ( = ?auto_609323 ?auto_609335 ) ) ( not ( = ?auto_609323 ?auto_609336 ) ) ( not ( = ?auto_609324 ?auto_609325 ) ) ( not ( = ?auto_609324 ?auto_609326 ) ) ( not ( = ?auto_609324 ?auto_609327 ) ) ( not ( = ?auto_609324 ?auto_609328 ) ) ( not ( = ?auto_609324 ?auto_609329 ) ) ( not ( = ?auto_609324 ?auto_609330 ) ) ( not ( = ?auto_609324 ?auto_609331 ) ) ( not ( = ?auto_609324 ?auto_609332 ) ) ( not ( = ?auto_609324 ?auto_609333 ) ) ( not ( = ?auto_609324 ?auto_609334 ) ) ( not ( = ?auto_609324 ?auto_609335 ) ) ( not ( = ?auto_609324 ?auto_609336 ) ) ( not ( = ?auto_609325 ?auto_609326 ) ) ( not ( = ?auto_609325 ?auto_609327 ) ) ( not ( = ?auto_609325 ?auto_609328 ) ) ( not ( = ?auto_609325 ?auto_609329 ) ) ( not ( = ?auto_609325 ?auto_609330 ) ) ( not ( = ?auto_609325 ?auto_609331 ) ) ( not ( = ?auto_609325 ?auto_609332 ) ) ( not ( = ?auto_609325 ?auto_609333 ) ) ( not ( = ?auto_609325 ?auto_609334 ) ) ( not ( = ?auto_609325 ?auto_609335 ) ) ( not ( = ?auto_609325 ?auto_609336 ) ) ( not ( = ?auto_609326 ?auto_609327 ) ) ( not ( = ?auto_609326 ?auto_609328 ) ) ( not ( = ?auto_609326 ?auto_609329 ) ) ( not ( = ?auto_609326 ?auto_609330 ) ) ( not ( = ?auto_609326 ?auto_609331 ) ) ( not ( = ?auto_609326 ?auto_609332 ) ) ( not ( = ?auto_609326 ?auto_609333 ) ) ( not ( = ?auto_609326 ?auto_609334 ) ) ( not ( = ?auto_609326 ?auto_609335 ) ) ( not ( = ?auto_609326 ?auto_609336 ) ) ( not ( = ?auto_609327 ?auto_609328 ) ) ( not ( = ?auto_609327 ?auto_609329 ) ) ( not ( = ?auto_609327 ?auto_609330 ) ) ( not ( = ?auto_609327 ?auto_609331 ) ) ( not ( = ?auto_609327 ?auto_609332 ) ) ( not ( = ?auto_609327 ?auto_609333 ) ) ( not ( = ?auto_609327 ?auto_609334 ) ) ( not ( = ?auto_609327 ?auto_609335 ) ) ( not ( = ?auto_609327 ?auto_609336 ) ) ( not ( = ?auto_609328 ?auto_609329 ) ) ( not ( = ?auto_609328 ?auto_609330 ) ) ( not ( = ?auto_609328 ?auto_609331 ) ) ( not ( = ?auto_609328 ?auto_609332 ) ) ( not ( = ?auto_609328 ?auto_609333 ) ) ( not ( = ?auto_609328 ?auto_609334 ) ) ( not ( = ?auto_609328 ?auto_609335 ) ) ( not ( = ?auto_609328 ?auto_609336 ) ) ( not ( = ?auto_609329 ?auto_609330 ) ) ( not ( = ?auto_609329 ?auto_609331 ) ) ( not ( = ?auto_609329 ?auto_609332 ) ) ( not ( = ?auto_609329 ?auto_609333 ) ) ( not ( = ?auto_609329 ?auto_609334 ) ) ( not ( = ?auto_609329 ?auto_609335 ) ) ( not ( = ?auto_609329 ?auto_609336 ) ) ( not ( = ?auto_609330 ?auto_609331 ) ) ( not ( = ?auto_609330 ?auto_609332 ) ) ( not ( = ?auto_609330 ?auto_609333 ) ) ( not ( = ?auto_609330 ?auto_609334 ) ) ( not ( = ?auto_609330 ?auto_609335 ) ) ( not ( = ?auto_609330 ?auto_609336 ) ) ( not ( = ?auto_609331 ?auto_609332 ) ) ( not ( = ?auto_609331 ?auto_609333 ) ) ( not ( = ?auto_609331 ?auto_609334 ) ) ( not ( = ?auto_609331 ?auto_609335 ) ) ( not ( = ?auto_609331 ?auto_609336 ) ) ( not ( = ?auto_609332 ?auto_609333 ) ) ( not ( = ?auto_609332 ?auto_609334 ) ) ( not ( = ?auto_609332 ?auto_609335 ) ) ( not ( = ?auto_609332 ?auto_609336 ) ) ( not ( = ?auto_609333 ?auto_609334 ) ) ( not ( = ?auto_609333 ?auto_609335 ) ) ( not ( = ?auto_609333 ?auto_609336 ) ) ( not ( = ?auto_609334 ?auto_609335 ) ) ( not ( = ?auto_609334 ?auto_609336 ) ) ( not ( = ?auto_609335 ?auto_609336 ) ) ( ON ?auto_609334 ?auto_609335 ) ( ON ?auto_609333 ?auto_609334 ) ( ON ?auto_609332 ?auto_609333 ) ( ON ?auto_609331 ?auto_609332 ) ( ON ?auto_609330 ?auto_609331 ) ( ON ?auto_609329 ?auto_609330 ) ( ON ?auto_609328 ?auto_609329 ) ( ON ?auto_609327 ?auto_609328 ) ( CLEAR ?auto_609325 ) ( ON ?auto_609326 ?auto_609327 ) ( CLEAR ?auto_609326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_609322 ?auto_609323 ?auto_609324 ?auto_609325 ?auto_609326 )
      ( MAKE-14PILE ?auto_609322 ?auto_609323 ?auto_609324 ?auto_609325 ?auto_609326 ?auto_609327 ?auto_609328 ?auto_609329 ?auto_609330 ?auto_609331 ?auto_609332 ?auto_609333 ?auto_609334 ?auto_609335 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_609380 - BLOCK
      ?auto_609381 - BLOCK
      ?auto_609382 - BLOCK
      ?auto_609383 - BLOCK
      ?auto_609384 - BLOCK
      ?auto_609385 - BLOCK
      ?auto_609386 - BLOCK
      ?auto_609387 - BLOCK
      ?auto_609388 - BLOCK
      ?auto_609389 - BLOCK
      ?auto_609390 - BLOCK
      ?auto_609391 - BLOCK
      ?auto_609392 - BLOCK
      ?auto_609393 - BLOCK
    )
    :vars
    (
      ?auto_609394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609393 ?auto_609394 ) ( ON-TABLE ?auto_609380 ) ( ON ?auto_609381 ?auto_609380 ) ( ON ?auto_609382 ?auto_609381 ) ( not ( = ?auto_609380 ?auto_609381 ) ) ( not ( = ?auto_609380 ?auto_609382 ) ) ( not ( = ?auto_609380 ?auto_609383 ) ) ( not ( = ?auto_609380 ?auto_609384 ) ) ( not ( = ?auto_609380 ?auto_609385 ) ) ( not ( = ?auto_609380 ?auto_609386 ) ) ( not ( = ?auto_609380 ?auto_609387 ) ) ( not ( = ?auto_609380 ?auto_609388 ) ) ( not ( = ?auto_609380 ?auto_609389 ) ) ( not ( = ?auto_609380 ?auto_609390 ) ) ( not ( = ?auto_609380 ?auto_609391 ) ) ( not ( = ?auto_609380 ?auto_609392 ) ) ( not ( = ?auto_609380 ?auto_609393 ) ) ( not ( = ?auto_609380 ?auto_609394 ) ) ( not ( = ?auto_609381 ?auto_609382 ) ) ( not ( = ?auto_609381 ?auto_609383 ) ) ( not ( = ?auto_609381 ?auto_609384 ) ) ( not ( = ?auto_609381 ?auto_609385 ) ) ( not ( = ?auto_609381 ?auto_609386 ) ) ( not ( = ?auto_609381 ?auto_609387 ) ) ( not ( = ?auto_609381 ?auto_609388 ) ) ( not ( = ?auto_609381 ?auto_609389 ) ) ( not ( = ?auto_609381 ?auto_609390 ) ) ( not ( = ?auto_609381 ?auto_609391 ) ) ( not ( = ?auto_609381 ?auto_609392 ) ) ( not ( = ?auto_609381 ?auto_609393 ) ) ( not ( = ?auto_609381 ?auto_609394 ) ) ( not ( = ?auto_609382 ?auto_609383 ) ) ( not ( = ?auto_609382 ?auto_609384 ) ) ( not ( = ?auto_609382 ?auto_609385 ) ) ( not ( = ?auto_609382 ?auto_609386 ) ) ( not ( = ?auto_609382 ?auto_609387 ) ) ( not ( = ?auto_609382 ?auto_609388 ) ) ( not ( = ?auto_609382 ?auto_609389 ) ) ( not ( = ?auto_609382 ?auto_609390 ) ) ( not ( = ?auto_609382 ?auto_609391 ) ) ( not ( = ?auto_609382 ?auto_609392 ) ) ( not ( = ?auto_609382 ?auto_609393 ) ) ( not ( = ?auto_609382 ?auto_609394 ) ) ( not ( = ?auto_609383 ?auto_609384 ) ) ( not ( = ?auto_609383 ?auto_609385 ) ) ( not ( = ?auto_609383 ?auto_609386 ) ) ( not ( = ?auto_609383 ?auto_609387 ) ) ( not ( = ?auto_609383 ?auto_609388 ) ) ( not ( = ?auto_609383 ?auto_609389 ) ) ( not ( = ?auto_609383 ?auto_609390 ) ) ( not ( = ?auto_609383 ?auto_609391 ) ) ( not ( = ?auto_609383 ?auto_609392 ) ) ( not ( = ?auto_609383 ?auto_609393 ) ) ( not ( = ?auto_609383 ?auto_609394 ) ) ( not ( = ?auto_609384 ?auto_609385 ) ) ( not ( = ?auto_609384 ?auto_609386 ) ) ( not ( = ?auto_609384 ?auto_609387 ) ) ( not ( = ?auto_609384 ?auto_609388 ) ) ( not ( = ?auto_609384 ?auto_609389 ) ) ( not ( = ?auto_609384 ?auto_609390 ) ) ( not ( = ?auto_609384 ?auto_609391 ) ) ( not ( = ?auto_609384 ?auto_609392 ) ) ( not ( = ?auto_609384 ?auto_609393 ) ) ( not ( = ?auto_609384 ?auto_609394 ) ) ( not ( = ?auto_609385 ?auto_609386 ) ) ( not ( = ?auto_609385 ?auto_609387 ) ) ( not ( = ?auto_609385 ?auto_609388 ) ) ( not ( = ?auto_609385 ?auto_609389 ) ) ( not ( = ?auto_609385 ?auto_609390 ) ) ( not ( = ?auto_609385 ?auto_609391 ) ) ( not ( = ?auto_609385 ?auto_609392 ) ) ( not ( = ?auto_609385 ?auto_609393 ) ) ( not ( = ?auto_609385 ?auto_609394 ) ) ( not ( = ?auto_609386 ?auto_609387 ) ) ( not ( = ?auto_609386 ?auto_609388 ) ) ( not ( = ?auto_609386 ?auto_609389 ) ) ( not ( = ?auto_609386 ?auto_609390 ) ) ( not ( = ?auto_609386 ?auto_609391 ) ) ( not ( = ?auto_609386 ?auto_609392 ) ) ( not ( = ?auto_609386 ?auto_609393 ) ) ( not ( = ?auto_609386 ?auto_609394 ) ) ( not ( = ?auto_609387 ?auto_609388 ) ) ( not ( = ?auto_609387 ?auto_609389 ) ) ( not ( = ?auto_609387 ?auto_609390 ) ) ( not ( = ?auto_609387 ?auto_609391 ) ) ( not ( = ?auto_609387 ?auto_609392 ) ) ( not ( = ?auto_609387 ?auto_609393 ) ) ( not ( = ?auto_609387 ?auto_609394 ) ) ( not ( = ?auto_609388 ?auto_609389 ) ) ( not ( = ?auto_609388 ?auto_609390 ) ) ( not ( = ?auto_609388 ?auto_609391 ) ) ( not ( = ?auto_609388 ?auto_609392 ) ) ( not ( = ?auto_609388 ?auto_609393 ) ) ( not ( = ?auto_609388 ?auto_609394 ) ) ( not ( = ?auto_609389 ?auto_609390 ) ) ( not ( = ?auto_609389 ?auto_609391 ) ) ( not ( = ?auto_609389 ?auto_609392 ) ) ( not ( = ?auto_609389 ?auto_609393 ) ) ( not ( = ?auto_609389 ?auto_609394 ) ) ( not ( = ?auto_609390 ?auto_609391 ) ) ( not ( = ?auto_609390 ?auto_609392 ) ) ( not ( = ?auto_609390 ?auto_609393 ) ) ( not ( = ?auto_609390 ?auto_609394 ) ) ( not ( = ?auto_609391 ?auto_609392 ) ) ( not ( = ?auto_609391 ?auto_609393 ) ) ( not ( = ?auto_609391 ?auto_609394 ) ) ( not ( = ?auto_609392 ?auto_609393 ) ) ( not ( = ?auto_609392 ?auto_609394 ) ) ( not ( = ?auto_609393 ?auto_609394 ) ) ( ON ?auto_609392 ?auto_609393 ) ( ON ?auto_609391 ?auto_609392 ) ( ON ?auto_609390 ?auto_609391 ) ( ON ?auto_609389 ?auto_609390 ) ( ON ?auto_609388 ?auto_609389 ) ( ON ?auto_609387 ?auto_609388 ) ( ON ?auto_609386 ?auto_609387 ) ( ON ?auto_609385 ?auto_609386 ) ( ON ?auto_609384 ?auto_609385 ) ( CLEAR ?auto_609382 ) ( ON ?auto_609383 ?auto_609384 ) ( CLEAR ?auto_609383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_609380 ?auto_609381 ?auto_609382 ?auto_609383 )
      ( MAKE-14PILE ?auto_609380 ?auto_609381 ?auto_609382 ?auto_609383 ?auto_609384 ?auto_609385 ?auto_609386 ?auto_609387 ?auto_609388 ?auto_609389 ?auto_609390 ?auto_609391 ?auto_609392 ?auto_609393 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_609438 - BLOCK
      ?auto_609439 - BLOCK
      ?auto_609440 - BLOCK
      ?auto_609441 - BLOCK
      ?auto_609442 - BLOCK
      ?auto_609443 - BLOCK
      ?auto_609444 - BLOCK
      ?auto_609445 - BLOCK
      ?auto_609446 - BLOCK
      ?auto_609447 - BLOCK
      ?auto_609448 - BLOCK
      ?auto_609449 - BLOCK
      ?auto_609450 - BLOCK
      ?auto_609451 - BLOCK
    )
    :vars
    (
      ?auto_609452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609451 ?auto_609452 ) ( ON-TABLE ?auto_609438 ) ( ON ?auto_609439 ?auto_609438 ) ( not ( = ?auto_609438 ?auto_609439 ) ) ( not ( = ?auto_609438 ?auto_609440 ) ) ( not ( = ?auto_609438 ?auto_609441 ) ) ( not ( = ?auto_609438 ?auto_609442 ) ) ( not ( = ?auto_609438 ?auto_609443 ) ) ( not ( = ?auto_609438 ?auto_609444 ) ) ( not ( = ?auto_609438 ?auto_609445 ) ) ( not ( = ?auto_609438 ?auto_609446 ) ) ( not ( = ?auto_609438 ?auto_609447 ) ) ( not ( = ?auto_609438 ?auto_609448 ) ) ( not ( = ?auto_609438 ?auto_609449 ) ) ( not ( = ?auto_609438 ?auto_609450 ) ) ( not ( = ?auto_609438 ?auto_609451 ) ) ( not ( = ?auto_609438 ?auto_609452 ) ) ( not ( = ?auto_609439 ?auto_609440 ) ) ( not ( = ?auto_609439 ?auto_609441 ) ) ( not ( = ?auto_609439 ?auto_609442 ) ) ( not ( = ?auto_609439 ?auto_609443 ) ) ( not ( = ?auto_609439 ?auto_609444 ) ) ( not ( = ?auto_609439 ?auto_609445 ) ) ( not ( = ?auto_609439 ?auto_609446 ) ) ( not ( = ?auto_609439 ?auto_609447 ) ) ( not ( = ?auto_609439 ?auto_609448 ) ) ( not ( = ?auto_609439 ?auto_609449 ) ) ( not ( = ?auto_609439 ?auto_609450 ) ) ( not ( = ?auto_609439 ?auto_609451 ) ) ( not ( = ?auto_609439 ?auto_609452 ) ) ( not ( = ?auto_609440 ?auto_609441 ) ) ( not ( = ?auto_609440 ?auto_609442 ) ) ( not ( = ?auto_609440 ?auto_609443 ) ) ( not ( = ?auto_609440 ?auto_609444 ) ) ( not ( = ?auto_609440 ?auto_609445 ) ) ( not ( = ?auto_609440 ?auto_609446 ) ) ( not ( = ?auto_609440 ?auto_609447 ) ) ( not ( = ?auto_609440 ?auto_609448 ) ) ( not ( = ?auto_609440 ?auto_609449 ) ) ( not ( = ?auto_609440 ?auto_609450 ) ) ( not ( = ?auto_609440 ?auto_609451 ) ) ( not ( = ?auto_609440 ?auto_609452 ) ) ( not ( = ?auto_609441 ?auto_609442 ) ) ( not ( = ?auto_609441 ?auto_609443 ) ) ( not ( = ?auto_609441 ?auto_609444 ) ) ( not ( = ?auto_609441 ?auto_609445 ) ) ( not ( = ?auto_609441 ?auto_609446 ) ) ( not ( = ?auto_609441 ?auto_609447 ) ) ( not ( = ?auto_609441 ?auto_609448 ) ) ( not ( = ?auto_609441 ?auto_609449 ) ) ( not ( = ?auto_609441 ?auto_609450 ) ) ( not ( = ?auto_609441 ?auto_609451 ) ) ( not ( = ?auto_609441 ?auto_609452 ) ) ( not ( = ?auto_609442 ?auto_609443 ) ) ( not ( = ?auto_609442 ?auto_609444 ) ) ( not ( = ?auto_609442 ?auto_609445 ) ) ( not ( = ?auto_609442 ?auto_609446 ) ) ( not ( = ?auto_609442 ?auto_609447 ) ) ( not ( = ?auto_609442 ?auto_609448 ) ) ( not ( = ?auto_609442 ?auto_609449 ) ) ( not ( = ?auto_609442 ?auto_609450 ) ) ( not ( = ?auto_609442 ?auto_609451 ) ) ( not ( = ?auto_609442 ?auto_609452 ) ) ( not ( = ?auto_609443 ?auto_609444 ) ) ( not ( = ?auto_609443 ?auto_609445 ) ) ( not ( = ?auto_609443 ?auto_609446 ) ) ( not ( = ?auto_609443 ?auto_609447 ) ) ( not ( = ?auto_609443 ?auto_609448 ) ) ( not ( = ?auto_609443 ?auto_609449 ) ) ( not ( = ?auto_609443 ?auto_609450 ) ) ( not ( = ?auto_609443 ?auto_609451 ) ) ( not ( = ?auto_609443 ?auto_609452 ) ) ( not ( = ?auto_609444 ?auto_609445 ) ) ( not ( = ?auto_609444 ?auto_609446 ) ) ( not ( = ?auto_609444 ?auto_609447 ) ) ( not ( = ?auto_609444 ?auto_609448 ) ) ( not ( = ?auto_609444 ?auto_609449 ) ) ( not ( = ?auto_609444 ?auto_609450 ) ) ( not ( = ?auto_609444 ?auto_609451 ) ) ( not ( = ?auto_609444 ?auto_609452 ) ) ( not ( = ?auto_609445 ?auto_609446 ) ) ( not ( = ?auto_609445 ?auto_609447 ) ) ( not ( = ?auto_609445 ?auto_609448 ) ) ( not ( = ?auto_609445 ?auto_609449 ) ) ( not ( = ?auto_609445 ?auto_609450 ) ) ( not ( = ?auto_609445 ?auto_609451 ) ) ( not ( = ?auto_609445 ?auto_609452 ) ) ( not ( = ?auto_609446 ?auto_609447 ) ) ( not ( = ?auto_609446 ?auto_609448 ) ) ( not ( = ?auto_609446 ?auto_609449 ) ) ( not ( = ?auto_609446 ?auto_609450 ) ) ( not ( = ?auto_609446 ?auto_609451 ) ) ( not ( = ?auto_609446 ?auto_609452 ) ) ( not ( = ?auto_609447 ?auto_609448 ) ) ( not ( = ?auto_609447 ?auto_609449 ) ) ( not ( = ?auto_609447 ?auto_609450 ) ) ( not ( = ?auto_609447 ?auto_609451 ) ) ( not ( = ?auto_609447 ?auto_609452 ) ) ( not ( = ?auto_609448 ?auto_609449 ) ) ( not ( = ?auto_609448 ?auto_609450 ) ) ( not ( = ?auto_609448 ?auto_609451 ) ) ( not ( = ?auto_609448 ?auto_609452 ) ) ( not ( = ?auto_609449 ?auto_609450 ) ) ( not ( = ?auto_609449 ?auto_609451 ) ) ( not ( = ?auto_609449 ?auto_609452 ) ) ( not ( = ?auto_609450 ?auto_609451 ) ) ( not ( = ?auto_609450 ?auto_609452 ) ) ( not ( = ?auto_609451 ?auto_609452 ) ) ( ON ?auto_609450 ?auto_609451 ) ( ON ?auto_609449 ?auto_609450 ) ( ON ?auto_609448 ?auto_609449 ) ( ON ?auto_609447 ?auto_609448 ) ( ON ?auto_609446 ?auto_609447 ) ( ON ?auto_609445 ?auto_609446 ) ( ON ?auto_609444 ?auto_609445 ) ( ON ?auto_609443 ?auto_609444 ) ( ON ?auto_609442 ?auto_609443 ) ( ON ?auto_609441 ?auto_609442 ) ( CLEAR ?auto_609439 ) ( ON ?auto_609440 ?auto_609441 ) ( CLEAR ?auto_609440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_609438 ?auto_609439 ?auto_609440 )
      ( MAKE-14PILE ?auto_609438 ?auto_609439 ?auto_609440 ?auto_609441 ?auto_609442 ?auto_609443 ?auto_609444 ?auto_609445 ?auto_609446 ?auto_609447 ?auto_609448 ?auto_609449 ?auto_609450 ?auto_609451 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_609496 - BLOCK
      ?auto_609497 - BLOCK
      ?auto_609498 - BLOCK
      ?auto_609499 - BLOCK
      ?auto_609500 - BLOCK
      ?auto_609501 - BLOCK
      ?auto_609502 - BLOCK
      ?auto_609503 - BLOCK
      ?auto_609504 - BLOCK
      ?auto_609505 - BLOCK
      ?auto_609506 - BLOCK
      ?auto_609507 - BLOCK
      ?auto_609508 - BLOCK
      ?auto_609509 - BLOCK
    )
    :vars
    (
      ?auto_609510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609509 ?auto_609510 ) ( ON-TABLE ?auto_609496 ) ( not ( = ?auto_609496 ?auto_609497 ) ) ( not ( = ?auto_609496 ?auto_609498 ) ) ( not ( = ?auto_609496 ?auto_609499 ) ) ( not ( = ?auto_609496 ?auto_609500 ) ) ( not ( = ?auto_609496 ?auto_609501 ) ) ( not ( = ?auto_609496 ?auto_609502 ) ) ( not ( = ?auto_609496 ?auto_609503 ) ) ( not ( = ?auto_609496 ?auto_609504 ) ) ( not ( = ?auto_609496 ?auto_609505 ) ) ( not ( = ?auto_609496 ?auto_609506 ) ) ( not ( = ?auto_609496 ?auto_609507 ) ) ( not ( = ?auto_609496 ?auto_609508 ) ) ( not ( = ?auto_609496 ?auto_609509 ) ) ( not ( = ?auto_609496 ?auto_609510 ) ) ( not ( = ?auto_609497 ?auto_609498 ) ) ( not ( = ?auto_609497 ?auto_609499 ) ) ( not ( = ?auto_609497 ?auto_609500 ) ) ( not ( = ?auto_609497 ?auto_609501 ) ) ( not ( = ?auto_609497 ?auto_609502 ) ) ( not ( = ?auto_609497 ?auto_609503 ) ) ( not ( = ?auto_609497 ?auto_609504 ) ) ( not ( = ?auto_609497 ?auto_609505 ) ) ( not ( = ?auto_609497 ?auto_609506 ) ) ( not ( = ?auto_609497 ?auto_609507 ) ) ( not ( = ?auto_609497 ?auto_609508 ) ) ( not ( = ?auto_609497 ?auto_609509 ) ) ( not ( = ?auto_609497 ?auto_609510 ) ) ( not ( = ?auto_609498 ?auto_609499 ) ) ( not ( = ?auto_609498 ?auto_609500 ) ) ( not ( = ?auto_609498 ?auto_609501 ) ) ( not ( = ?auto_609498 ?auto_609502 ) ) ( not ( = ?auto_609498 ?auto_609503 ) ) ( not ( = ?auto_609498 ?auto_609504 ) ) ( not ( = ?auto_609498 ?auto_609505 ) ) ( not ( = ?auto_609498 ?auto_609506 ) ) ( not ( = ?auto_609498 ?auto_609507 ) ) ( not ( = ?auto_609498 ?auto_609508 ) ) ( not ( = ?auto_609498 ?auto_609509 ) ) ( not ( = ?auto_609498 ?auto_609510 ) ) ( not ( = ?auto_609499 ?auto_609500 ) ) ( not ( = ?auto_609499 ?auto_609501 ) ) ( not ( = ?auto_609499 ?auto_609502 ) ) ( not ( = ?auto_609499 ?auto_609503 ) ) ( not ( = ?auto_609499 ?auto_609504 ) ) ( not ( = ?auto_609499 ?auto_609505 ) ) ( not ( = ?auto_609499 ?auto_609506 ) ) ( not ( = ?auto_609499 ?auto_609507 ) ) ( not ( = ?auto_609499 ?auto_609508 ) ) ( not ( = ?auto_609499 ?auto_609509 ) ) ( not ( = ?auto_609499 ?auto_609510 ) ) ( not ( = ?auto_609500 ?auto_609501 ) ) ( not ( = ?auto_609500 ?auto_609502 ) ) ( not ( = ?auto_609500 ?auto_609503 ) ) ( not ( = ?auto_609500 ?auto_609504 ) ) ( not ( = ?auto_609500 ?auto_609505 ) ) ( not ( = ?auto_609500 ?auto_609506 ) ) ( not ( = ?auto_609500 ?auto_609507 ) ) ( not ( = ?auto_609500 ?auto_609508 ) ) ( not ( = ?auto_609500 ?auto_609509 ) ) ( not ( = ?auto_609500 ?auto_609510 ) ) ( not ( = ?auto_609501 ?auto_609502 ) ) ( not ( = ?auto_609501 ?auto_609503 ) ) ( not ( = ?auto_609501 ?auto_609504 ) ) ( not ( = ?auto_609501 ?auto_609505 ) ) ( not ( = ?auto_609501 ?auto_609506 ) ) ( not ( = ?auto_609501 ?auto_609507 ) ) ( not ( = ?auto_609501 ?auto_609508 ) ) ( not ( = ?auto_609501 ?auto_609509 ) ) ( not ( = ?auto_609501 ?auto_609510 ) ) ( not ( = ?auto_609502 ?auto_609503 ) ) ( not ( = ?auto_609502 ?auto_609504 ) ) ( not ( = ?auto_609502 ?auto_609505 ) ) ( not ( = ?auto_609502 ?auto_609506 ) ) ( not ( = ?auto_609502 ?auto_609507 ) ) ( not ( = ?auto_609502 ?auto_609508 ) ) ( not ( = ?auto_609502 ?auto_609509 ) ) ( not ( = ?auto_609502 ?auto_609510 ) ) ( not ( = ?auto_609503 ?auto_609504 ) ) ( not ( = ?auto_609503 ?auto_609505 ) ) ( not ( = ?auto_609503 ?auto_609506 ) ) ( not ( = ?auto_609503 ?auto_609507 ) ) ( not ( = ?auto_609503 ?auto_609508 ) ) ( not ( = ?auto_609503 ?auto_609509 ) ) ( not ( = ?auto_609503 ?auto_609510 ) ) ( not ( = ?auto_609504 ?auto_609505 ) ) ( not ( = ?auto_609504 ?auto_609506 ) ) ( not ( = ?auto_609504 ?auto_609507 ) ) ( not ( = ?auto_609504 ?auto_609508 ) ) ( not ( = ?auto_609504 ?auto_609509 ) ) ( not ( = ?auto_609504 ?auto_609510 ) ) ( not ( = ?auto_609505 ?auto_609506 ) ) ( not ( = ?auto_609505 ?auto_609507 ) ) ( not ( = ?auto_609505 ?auto_609508 ) ) ( not ( = ?auto_609505 ?auto_609509 ) ) ( not ( = ?auto_609505 ?auto_609510 ) ) ( not ( = ?auto_609506 ?auto_609507 ) ) ( not ( = ?auto_609506 ?auto_609508 ) ) ( not ( = ?auto_609506 ?auto_609509 ) ) ( not ( = ?auto_609506 ?auto_609510 ) ) ( not ( = ?auto_609507 ?auto_609508 ) ) ( not ( = ?auto_609507 ?auto_609509 ) ) ( not ( = ?auto_609507 ?auto_609510 ) ) ( not ( = ?auto_609508 ?auto_609509 ) ) ( not ( = ?auto_609508 ?auto_609510 ) ) ( not ( = ?auto_609509 ?auto_609510 ) ) ( ON ?auto_609508 ?auto_609509 ) ( ON ?auto_609507 ?auto_609508 ) ( ON ?auto_609506 ?auto_609507 ) ( ON ?auto_609505 ?auto_609506 ) ( ON ?auto_609504 ?auto_609505 ) ( ON ?auto_609503 ?auto_609504 ) ( ON ?auto_609502 ?auto_609503 ) ( ON ?auto_609501 ?auto_609502 ) ( ON ?auto_609500 ?auto_609501 ) ( ON ?auto_609499 ?auto_609500 ) ( ON ?auto_609498 ?auto_609499 ) ( CLEAR ?auto_609496 ) ( ON ?auto_609497 ?auto_609498 ) ( CLEAR ?auto_609497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_609496 ?auto_609497 )
      ( MAKE-14PILE ?auto_609496 ?auto_609497 ?auto_609498 ?auto_609499 ?auto_609500 ?auto_609501 ?auto_609502 ?auto_609503 ?auto_609504 ?auto_609505 ?auto_609506 ?auto_609507 ?auto_609508 ?auto_609509 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_609554 - BLOCK
      ?auto_609555 - BLOCK
      ?auto_609556 - BLOCK
      ?auto_609557 - BLOCK
      ?auto_609558 - BLOCK
      ?auto_609559 - BLOCK
      ?auto_609560 - BLOCK
      ?auto_609561 - BLOCK
      ?auto_609562 - BLOCK
      ?auto_609563 - BLOCK
      ?auto_609564 - BLOCK
      ?auto_609565 - BLOCK
      ?auto_609566 - BLOCK
      ?auto_609567 - BLOCK
    )
    :vars
    (
      ?auto_609568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609567 ?auto_609568 ) ( not ( = ?auto_609554 ?auto_609555 ) ) ( not ( = ?auto_609554 ?auto_609556 ) ) ( not ( = ?auto_609554 ?auto_609557 ) ) ( not ( = ?auto_609554 ?auto_609558 ) ) ( not ( = ?auto_609554 ?auto_609559 ) ) ( not ( = ?auto_609554 ?auto_609560 ) ) ( not ( = ?auto_609554 ?auto_609561 ) ) ( not ( = ?auto_609554 ?auto_609562 ) ) ( not ( = ?auto_609554 ?auto_609563 ) ) ( not ( = ?auto_609554 ?auto_609564 ) ) ( not ( = ?auto_609554 ?auto_609565 ) ) ( not ( = ?auto_609554 ?auto_609566 ) ) ( not ( = ?auto_609554 ?auto_609567 ) ) ( not ( = ?auto_609554 ?auto_609568 ) ) ( not ( = ?auto_609555 ?auto_609556 ) ) ( not ( = ?auto_609555 ?auto_609557 ) ) ( not ( = ?auto_609555 ?auto_609558 ) ) ( not ( = ?auto_609555 ?auto_609559 ) ) ( not ( = ?auto_609555 ?auto_609560 ) ) ( not ( = ?auto_609555 ?auto_609561 ) ) ( not ( = ?auto_609555 ?auto_609562 ) ) ( not ( = ?auto_609555 ?auto_609563 ) ) ( not ( = ?auto_609555 ?auto_609564 ) ) ( not ( = ?auto_609555 ?auto_609565 ) ) ( not ( = ?auto_609555 ?auto_609566 ) ) ( not ( = ?auto_609555 ?auto_609567 ) ) ( not ( = ?auto_609555 ?auto_609568 ) ) ( not ( = ?auto_609556 ?auto_609557 ) ) ( not ( = ?auto_609556 ?auto_609558 ) ) ( not ( = ?auto_609556 ?auto_609559 ) ) ( not ( = ?auto_609556 ?auto_609560 ) ) ( not ( = ?auto_609556 ?auto_609561 ) ) ( not ( = ?auto_609556 ?auto_609562 ) ) ( not ( = ?auto_609556 ?auto_609563 ) ) ( not ( = ?auto_609556 ?auto_609564 ) ) ( not ( = ?auto_609556 ?auto_609565 ) ) ( not ( = ?auto_609556 ?auto_609566 ) ) ( not ( = ?auto_609556 ?auto_609567 ) ) ( not ( = ?auto_609556 ?auto_609568 ) ) ( not ( = ?auto_609557 ?auto_609558 ) ) ( not ( = ?auto_609557 ?auto_609559 ) ) ( not ( = ?auto_609557 ?auto_609560 ) ) ( not ( = ?auto_609557 ?auto_609561 ) ) ( not ( = ?auto_609557 ?auto_609562 ) ) ( not ( = ?auto_609557 ?auto_609563 ) ) ( not ( = ?auto_609557 ?auto_609564 ) ) ( not ( = ?auto_609557 ?auto_609565 ) ) ( not ( = ?auto_609557 ?auto_609566 ) ) ( not ( = ?auto_609557 ?auto_609567 ) ) ( not ( = ?auto_609557 ?auto_609568 ) ) ( not ( = ?auto_609558 ?auto_609559 ) ) ( not ( = ?auto_609558 ?auto_609560 ) ) ( not ( = ?auto_609558 ?auto_609561 ) ) ( not ( = ?auto_609558 ?auto_609562 ) ) ( not ( = ?auto_609558 ?auto_609563 ) ) ( not ( = ?auto_609558 ?auto_609564 ) ) ( not ( = ?auto_609558 ?auto_609565 ) ) ( not ( = ?auto_609558 ?auto_609566 ) ) ( not ( = ?auto_609558 ?auto_609567 ) ) ( not ( = ?auto_609558 ?auto_609568 ) ) ( not ( = ?auto_609559 ?auto_609560 ) ) ( not ( = ?auto_609559 ?auto_609561 ) ) ( not ( = ?auto_609559 ?auto_609562 ) ) ( not ( = ?auto_609559 ?auto_609563 ) ) ( not ( = ?auto_609559 ?auto_609564 ) ) ( not ( = ?auto_609559 ?auto_609565 ) ) ( not ( = ?auto_609559 ?auto_609566 ) ) ( not ( = ?auto_609559 ?auto_609567 ) ) ( not ( = ?auto_609559 ?auto_609568 ) ) ( not ( = ?auto_609560 ?auto_609561 ) ) ( not ( = ?auto_609560 ?auto_609562 ) ) ( not ( = ?auto_609560 ?auto_609563 ) ) ( not ( = ?auto_609560 ?auto_609564 ) ) ( not ( = ?auto_609560 ?auto_609565 ) ) ( not ( = ?auto_609560 ?auto_609566 ) ) ( not ( = ?auto_609560 ?auto_609567 ) ) ( not ( = ?auto_609560 ?auto_609568 ) ) ( not ( = ?auto_609561 ?auto_609562 ) ) ( not ( = ?auto_609561 ?auto_609563 ) ) ( not ( = ?auto_609561 ?auto_609564 ) ) ( not ( = ?auto_609561 ?auto_609565 ) ) ( not ( = ?auto_609561 ?auto_609566 ) ) ( not ( = ?auto_609561 ?auto_609567 ) ) ( not ( = ?auto_609561 ?auto_609568 ) ) ( not ( = ?auto_609562 ?auto_609563 ) ) ( not ( = ?auto_609562 ?auto_609564 ) ) ( not ( = ?auto_609562 ?auto_609565 ) ) ( not ( = ?auto_609562 ?auto_609566 ) ) ( not ( = ?auto_609562 ?auto_609567 ) ) ( not ( = ?auto_609562 ?auto_609568 ) ) ( not ( = ?auto_609563 ?auto_609564 ) ) ( not ( = ?auto_609563 ?auto_609565 ) ) ( not ( = ?auto_609563 ?auto_609566 ) ) ( not ( = ?auto_609563 ?auto_609567 ) ) ( not ( = ?auto_609563 ?auto_609568 ) ) ( not ( = ?auto_609564 ?auto_609565 ) ) ( not ( = ?auto_609564 ?auto_609566 ) ) ( not ( = ?auto_609564 ?auto_609567 ) ) ( not ( = ?auto_609564 ?auto_609568 ) ) ( not ( = ?auto_609565 ?auto_609566 ) ) ( not ( = ?auto_609565 ?auto_609567 ) ) ( not ( = ?auto_609565 ?auto_609568 ) ) ( not ( = ?auto_609566 ?auto_609567 ) ) ( not ( = ?auto_609566 ?auto_609568 ) ) ( not ( = ?auto_609567 ?auto_609568 ) ) ( ON ?auto_609566 ?auto_609567 ) ( ON ?auto_609565 ?auto_609566 ) ( ON ?auto_609564 ?auto_609565 ) ( ON ?auto_609563 ?auto_609564 ) ( ON ?auto_609562 ?auto_609563 ) ( ON ?auto_609561 ?auto_609562 ) ( ON ?auto_609560 ?auto_609561 ) ( ON ?auto_609559 ?auto_609560 ) ( ON ?auto_609558 ?auto_609559 ) ( ON ?auto_609557 ?auto_609558 ) ( ON ?auto_609556 ?auto_609557 ) ( ON ?auto_609555 ?auto_609556 ) ( ON ?auto_609554 ?auto_609555 ) ( CLEAR ?auto_609554 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_609554 )
      ( MAKE-14PILE ?auto_609554 ?auto_609555 ?auto_609556 ?auto_609557 ?auto_609558 ?auto_609559 ?auto_609560 ?auto_609561 ?auto_609562 ?auto_609563 ?auto_609564 ?auto_609565 ?auto_609566 ?auto_609567 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_609613 - BLOCK
      ?auto_609614 - BLOCK
      ?auto_609615 - BLOCK
      ?auto_609616 - BLOCK
      ?auto_609617 - BLOCK
      ?auto_609618 - BLOCK
      ?auto_609619 - BLOCK
      ?auto_609620 - BLOCK
      ?auto_609621 - BLOCK
      ?auto_609622 - BLOCK
      ?auto_609623 - BLOCK
      ?auto_609624 - BLOCK
      ?auto_609625 - BLOCK
      ?auto_609626 - BLOCK
      ?auto_609627 - BLOCK
    )
    :vars
    (
      ?auto_609628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_609626 ) ( ON ?auto_609627 ?auto_609628 ) ( CLEAR ?auto_609627 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_609613 ) ( ON ?auto_609614 ?auto_609613 ) ( ON ?auto_609615 ?auto_609614 ) ( ON ?auto_609616 ?auto_609615 ) ( ON ?auto_609617 ?auto_609616 ) ( ON ?auto_609618 ?auto_609617 ) ( ON ?auto_609619 ?auto_609618 ) ( ON ?auto_609620 ?auto_609619 ) ( ON ?auto_609621 ?auto_609620 ) ( ON ?auto_609622 ?auto_609621 ) ( ON ?auto_609623 ?auto_609622 ) ( ON ?auto_609624 ?auto_609623 ) ( ON ?auto_609625 ?auto_609624 ) ( ON ?auto_609626 ?auto_609625 ) ( not ( = ?auto_609613 ?auto_609614 ) ) ( not ( = ?auto_609613 ?auto_609615 ) ) ( not ( = ?auto_609613 ?auto_609616 ) ) ( not ( = ?auto_609613 ?auto_609617 ) ) ( not ( = ?auto_609613 ?auto_609618 ) ) ( not ( = ?auto_609613 ?auto_609619 ) ) ( not ( = ?auto_609613 ?auto_609620 ) ) ( not ( = ?auto_609613 ?auto_609621 ) ) ( not ( = ?auto_609613 ?auto_609622 ) ) ( not ( = ?auto_609613 ?auto_609623 ) ) ( not ( = ?auto_609613 ?auto_609624 ) ) ( not ( = ?auto_609613 ?auto_609625 ) ) ( not ( = ?auto_609613 ?auto_609626 ) ) ( not ( = ?auto_609613 ?auto_609627 ) ) ( not ( = ?auto_609613 ?auto_609628 ) ) ( not ( = ?auto_609614 ?auto_609615 ) ) ( not ( = ?auto_609614 ?auto_609616 ) ) ( not ( = ?auto_609614 ?auto_609617 ) ) ( not ( = ?auto_609614 ?auto_609618 ) ) ( not ( = ?auto_609614 ?auto_609619 ) ) ( not ( = ?auto_609614 ?auto_609620 ) ) ( not ( = ?auto_609614 ?auto_609621 ) ) ( not ( = ?auto_609614 ?auto_609622 ) ) ( not ( = ?auto_609614 ?auto_609623 ) ) ( not ( = ?auto_609614 ?auto_609624 ) ) ( not ( = ?auto_609614 ?auto_609625 ) ) ( not ( = ?auto_609614 ?auto_609626 ) ) ( not ( = ?auto_609614 ?auto_609627 ) ) ( not ( = ?auto_609614 ?auto_609628 ) ) ( not ( = ?auto_609615 ?auto_609616 ) ) ( not ( = ?auto_609615 ?auto_609617 ) ) ( not ( = ?auto_609615 ?auto_609618 ) ) ( not ( = ?auto_609615 ?auto_609619 ) ) ( not ( = ?auto_609615 ?auto_609620 ) ) ( not ( = ?auto_609615 ?auto_609621 ) ) ( not ( = ?auto_609615 ?auto_609622 ) ) ( not ( = ?auto_609615 ?auto_609623 ) ) ( not ( = ?auto_609615 ?auto_609624 ) ) ( not ( = ?auto_609615 ?auto_609625 ) ) ( not ( = ?auto_609615 ?auto_609626 ) ) ( not ( = ?auto_609615 ?auto_609627 ) ) ( not ( = ?auto_609615 ?auto_609628 ) ) ( not ( = ?auto_609616 ?auto_609617 ) ) ( not ( = ?auto_609616 ?auto_609618 ) ) ( not ( = ?auto_609616 ?auto_609619 ) ) ( not ( = ?auto_609616 ?auto_609620 ) ) ( not ( = ?auto_609616 ?auto_609621 ) ) ( not ( = ?auto_609616 ?auto_609622 ) ) ( not ( = ?auto_609616 ?auto_609623 ) ) ( not ( = ?auto_609616 ?auto_609624 ) ) ( not ( = ?auto_609616 ?auto_609625 ) ) ( not ( = ?auto_609616 ?auto_609626 ) ) ( not ( = ?auto_609616 ?auto_609627 ) ) ( not ( = ?auto_609616 ?auto_609628 ) ) ( not ( = ?auto_609617 ?auto_609618 ) ) ( not ( = ?auto_609617 ?auto_609619 ) ) ( not ( = ?auto_609617 ?auto_609620 ) ) ( not ( = ?auto_609617 ?auto_609621 ) ) ( not ( = ?auto_609617 ?auto_609622 ) ) ( not ( = ?auto_609617 ?auto_609623 ) ) ( not ( = ?auto_609617 ?auto_609624 ) ) ( not ( = ?auto_609617 ?auto_609625 ) ) ( not ( = ?auto_609617 ?auto_609626 ) ) ( not ( = ?auto_609617 ?auto_609627 ) ) ( not ( = ?auto_609617 ?auto_609628 ) ) ( not ( = ?auto_609618 ?auto_609619 ) ) ( not ( = ?auto_609618 ?auto_609620 ) ) ( not ( = ?auto_609618 ?auto_609621 ) ) ( not ( = ?auto_609618 ?auto_609622 ) ) ( not ( = ?auto_609618 ?auto_609623 ) ) ( not ( = ?auto_609618 ?auto_609624 ) ) ( not ( = ?auto_609618 ?auto_609625 ) ) ( not ( = ?auto_609618 ?auto_609626 ) ) ( not ( = ?auto_609618 ?auto_609627 ) ) ( not ( = ?auto_609618 ?auto_609628 ) ) ( not ( = ?auto_609619 ?auto_609620 ) ) ( not ( = ?auto_609619 ?auto_609621 ) ) ( not ( = ?auto_609619 ?auto_609622 ) ) ( not ( = ?auto_609619 ?auto_609623 ) ) ( not ( = ?auto_609619 ?auto_609624 ) ) ( not ( = ?auto_609619 ?auto_609625 ) ) ( not ( = ?auto_609619 ?auto_609626 ) ) ( not ( = ?auto_609619 ?auto_609627 ) ) ( not ( = ?auto_609619 ?auto_609628 ) ) ( not ( = ?auto_609620 ?auto_609621 ) ) ( not ( = ?auto_609620 ?auto_609622 ) ) ( not ( = ?auto_609620 ?auto_609623 ) ) ( not ( = ?auto_609620 ?auto_609624 ) ) ( not ( = ?auto_609620 ?auto_609625 ) ) ( not ( = ?auto_609620 ?auto_609626 ) ) ( not ( = ?auto_609620 ?auto_609627 ) ) ( not ( = ?auto_609620 ?auto_609628 ) ) ( not ( = ?auto_609621 ?auto_609622 ) ) ( not ( = ?auto_609621 ?auto_609623 ) ) ( not ( = ?auto_609621 ?auto_609624 ) ) ( not ( = ?auto_609621 ?auto_609625 ) ) ( not ( = ?auto_609621 ?auto_609626 ) ) ( not ( = ?auto_609621 ?auto_609627 ) ) ( not ( = ?auto_609621 ?auto_609628 ) ) ( not ( = ?auto_609622 ?auto_609623 ) ) ( not ( = ?auto_609622 ?auto_609624 ) ) ( not ( = ?auto_609622 ?auto_609625 ) ) ( not ( = ?auto_609622 ?auto_609626 ) ) ( not ( = ?auto_609622 ?auto_609627 ) ) ( not ( = ?auto_609622 ?auto_609628 ) ) ( not ( = ?auto_609623 ?auto_609624 ) ) ( not ( = ?auto_609623 ?auto_609625 ) ) ( not ( = ?auto_609623 ?auto_609626 ) ) ( not ( = ?auto_609623 ?auto_609627 ) ) ( not ( = ?auto_609623 ?auto_609628 ) ) ( not ( = ?auto_609624 ?auto_609625 ) ) ( not ( = ?auto_609624 ?auto_609626 ) ) ( not ( = ?auto_609624 ?auto_609627 ) ) ( not ( = ?auto_609624 ?auto_609628 ) ) ( not ( = ?auto_609625 ?auto_609626 ) ) ( not ( = ?auto_609625 ?auto_609627 ) ) ( not ( = ?auto_609625 ?auto_609628 ) ) ( not ( = ?auto_609626 ?auto_609627 ) ) ( not ( = ?auto_609626 ?auto_609628 ) ) ( not ( = ?auto_609627 ?auto_609628 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_609627 ?auto_609628 )
      ( !STACK ?auto_609627 ?auto_609626 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_609675 - BLOCK
      ?auto_609676 - BLOCK
      ?auto_609677 - BLOCK
      ?auto_609678 - BLOCK
      ?auto_609679 - BLOCK
      ?auto_609680 - BLOCK
      ?auto_609681 - BLOCK
      ?auto_609682 - BLOCK
      ?auto_609683 - BLOCK
      ?auto_609684 - BLOCK
      ?auto_609685 - BLOCK
      ?auto_609686 - BLOCK
      ?auto_609687 - BLOCK
      ?auto_609688 - BLOCK
      ?auto_609689 - BLOCK
    )
    :vars
    (
      ?auto_609690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609689 ?auto_609690 ) ( ON-TABLE ?auto_609675 ) ( ON ?auto_609676 ?auto_609675 ) ( ON ?auto_609677 ?auto_609676 ) ( ON ?auto_609678 ?auto_609677 ) ( ON ?auto_609679 ?auto_609678 ) ( ON ?auto_609680 ?auto_609679 ) ( ON ?auto_609681 ?auto_609680 ) ( ON ?auto_609682 ?auto_609681 ) ( ON ?auto_609683 ?auto_609682 ) ( ON ?auto_609684 ?auto_609683 ) ( ON ?auto_609685 ?auto_609684 ) ( ON ?auto_609686 ?auto_609685 ) ( ON ?auto_609687 ?auto_609686 ) ( not ( = ?auto_609675 ?auto_609676 ) ) ( not ( = ?auto_609675 ?auto_609677 ) ) ( not ( = ?auto_609675 ?auto_609678 ) ) ( not ( = ?auto_609675 ?auto_609679 ) ) ( not ( = ?auto_609675 ?auto_609680 ) ) ( not ( = ?auto_609675 ?auto_609681 ) ) ( not ( = ?auto_609675 ?auto_609682 ) ) ( not ( = ?auto_609675 ?auto_609683 ) ) ( not ( = ?auto_609675 ?auto_609684 ) ) ( not ( = ?auto_609675 ?auto_609685 ) ) ( not ( = ?auto_609675 ?auto_609686 ) ) ( not ( = ?auto_609675 ?auto_609687 ) ) ( not ( = ?auto_609675 ?auto_609688 ) ) ( not ( = ?auto_609675 ?auto_609689 ) ) ( not ( = ?auto_609675 ?auto_609690 ) ) ( not ( = ?auto_609676 ?auto_609677 ) ) ( not ( = ?auto_609676 ?auto_609678 ) ) ( not ( = ?auto_609676 ?auto_609679 ) ) ( not ( = ?auto_609676 ?auto_609680 ) ) ( not ( = ?auto_609676 ?auto_609681 ) ) ( not ( = ?auto_609676 ?auto_609682 ) ) ( not ( = ?auto_609676 ?auto_609683 ) ) ( not ( = ?auto_609676 ?auto_609684 ) ) ( not ( = ?auto_609676 ?auto_609685 ) ) ( not ( = ?auto_609676 ?auto_609686 ) ) ( not ( = ?auto_609676 ?auto_609687 ) ) ( not ( = ?auto_609676 ?auto_609688 ) ) ( not ( = ?auto_609676 ?auto_609689 ) ) ( not ( = ?auto_609676 ?auto_609690 ) ) ( not ( = ?auto_609677 ?auto_609678 ) ) ( not ( = ?auto_609677 ?auto_609679 ) ) ( not ( = ?auto_609677 ?auto_609680 ) ) ( not ( = ?auto_609677 ?auto_609681 ) ) ( not ( = ?auto_609677 ?auto_609682 ) ) ( not ( = ?auto_609677 ?auto_609683 ) ) ( not ( = ?auto_609677 ?auto_609684 ) ) ( not ( = ?auto_609677 ?auto_609685 ) ) ( not ( = ?auto_609677 ?auto_609686 ) ) ( not ( = ?auto_609677 ?auto_609687 ) ) ( not ( = ?auto_609677 ?auto_609688 ) ) ( not ( = ?auto_609677 ?auto_609689 ) ) ( not ( = ?auto_609677 ?auto_609690 ) ) ( not ( = ?auto_609678 ?auto_609679 ) ) ( not ( = ?auto_609678 ?auto_609680 ) ) ( not ( = ?auto_609678 ?auto_609681 ) ) ( not ( = ?auto_609678 ?auto_609682 ) ) ( not ( = ?auto_609678 ?auto_609683 ) ) ( not ( = ?auto_609678 ?auto_609684 ) ) ( not ( = ?auto_609678 ?auto_609685 ) ) ( not ( = ?auto_609678 ?auto_609686 ) ) ( not ( = ?auto_609678 ?auto_609687 ) ) ( not ( = ?auto_609678 ?auto_609688 ) ) ( not ( = ?auto_609678 ?auto_609689 ) ) ( not ( = ?auto_609678 ?auto_609690 ) ) ( not ( = ?auto_609679 ?auto_609680 ) ) ( not ( = ?auto_609679 ?auto_609681 ) ) ( not ( = ?auto_609679 ?auto_609682 ) ) ( not ( = ?auto_609679 ?auto_609683 ) ) ( not ( = ?auto_609679 ?auto_609684 ) ) ( not ( = ?auto_609679 ?auto_609685 ) ) ( not ( = ?auto_609679 ?auto_609686 ) ) ( not ( = ?auto_609679 ?auto_609687 ) ) ( not ( = ?auto_609679 ?auto_609688 ) ) ( not ( = ?auto_609679 ?auto_609689 ) ) ( not ( = ?auto_609679 ?auto_609690 ) ) ( not ( = ?auto_609680 ?auto_609681 ) ) ( not ( = ?auto_609680 ?auto_609682 ) ) ( not ( = ?auto_609680 ?auto_609683 ) ) ( not ( = ?auto_609680 ?auto_609684 ) ) ( not ( = ?auto_609680 ?auto_609685 ) ) ( not ( = ?auto_609680 ?auto_609686 ) ) ( not ( = ?auto_609680 ?auto_609687 ) ) ( not ( = ?auto_609680 ?auto_609688 ) ) ( not ( = ?auto_609680 ?auto_609689 ) ) ( not ( = ?auto_609680 ?auto_609690 ) ) ( not ( = ?auto_609681 ?auto_609682 ) ) ( not ( = ?auto_609681 ?auto_609683 ) ) ( not ( = ?auto_609681 ?auto_609684 ) ) ( not ( = ?auto_609681 ?auto_609685 ) ) ( not ( = ?auto_609681 ?auto_609686 ) ) ( not ( = ?auto_609681 ?auto_609687 ) ) ( not ( = ?auto_609681 ?auto_609688 ) ) ( not ( = ?auto_609681 ?auto_609689 ) ) ( not ( = ?auto_609681 ?auto_609690 ) ) ( not ( = ?auto_609682 ?auto_609683 ) ) ( not ( = ?auto_609682 ?auto_609684 ) ) ( not ( = ?auto_609682 ?auto_609685 ) ) ( not ( = ?auto_609682 ?auto_609686 ) ) ( not ( = ?auto_609682 ?auto_609687 ) ) ( not ( = ?auto_609682 ?auto_609688 ) ) ( not ( = ?auto_609682 ?auto_609689 ) ) ( not ( = ?auto_609682 ?auto_609690 ) ) ( not ( = ?auto_609683 ?auto_609684 ) ) ( not ( = ?auto_609683 ?auto_609685 ) ) ( not ( = ?auto_609683 ?auto_609686 ) ) ( not ( = ?auto_609683 ?auto_609687 ) ) ( not ( = ?auto_609683 ?auto_609688 ) ) ( not ( = ?auto_609683 ?auto_609689 ) ) ( not ( = ?auto_609683 ?auto_609690 ) ) ( not ( = ?auto_609684 ?auto_609685 ) ) ( not ( = ?auto_609684 ?auto_609686 ) ) ( not ( = ?auto_609684 ?auto_609687 ) ) ( not ( = ?auto_609684 ?auto_609688 ) ) ( not ( = ?auto_609684 ?auto_609689 ) ) ( not ( = ?auto_609684 ?auto_609690 ) ) ( not ( = ?auto_609685 ?auto_609686 ) ) ( not ( = ?auto_609685 ?auto_609687 ) ) ( not ( = ?auto_609685 ?auto_609688 ) ) ( not ( = ?auto_609685 ?auto_609689 ) ) ( not ( = ?auto_609685 ?auto_609690 ) ) ( not ( = ?auto_609686 ?auto_609687 ) ) ( not ( = ?auto_609686 ?auto_609688 ) ) ( not ( = ?auto_609686 ?auto_609689 ) ) ( not ( = ?auto_609686 ?auto_609690 ) ) ( not ( = ?auto_609687 ?auto_609688 ) ) ( not ( = ?auto_609687 ?auto_609689 ) ) ( not ( = ?auto_609687 ?auto_609690 ) ) ( not ( = ?auto_609688 ?auto_609689 ) ) ( not ( = ?auto_609688 ?auto_609690 ) ) ( not ( = ?auto_609689 ?auto_609690 ) ) ( CLEAR ?auto_609687 ) ( ON ?auto_609688 ?auto_609689 ) ( CLEAR ?auto_609688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_609675 ?auto_609676 ?auto_609677 ?auto_609678 ?auto_609679 ?auto_609680 ?auto_609681 ?auto_609682 ?auto_609683 ?auto_609684 ?auto_609685 ?auto_609686 ?auto_609687 ?auto_609688 )
      ( MAKE-15PILE ?auto_609675 ?auto_609676 ?auto_609677 ?auto_609678 ?auto_609679 ?auto_609680 ?auto_609681 ?auto_609682 ?auto_609683 ?auto_609684 ?auto_609685 ?auto_609686 ?auto_609687 ?auto_609688 ?auto_609689 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_609737 - BLOCK
      ?auto_609738 - BLOCK
      ?auto_609739 - BLOCK
      ?auto_609740 - BLOCK
      ?auto_609741 - BLOCK
      ?auto_609742 - BLOCK
      ?auto_609743 - BLOCK
      ?auto_609744 - BLOCK
      ?auto_609745 - BLOCK
      ?auto_609746 - BLOCK
      ?auto_609747 - BLOCK
      ?auto_609748 - BLOCK
      ?auto_609749 - BLOCK
      ?auto_609750 - BLOCK
      ?auto_609751 - BLOCK
    )
    :vars
    (
      ?auto_609752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609751 ?auto_609752 ) ( ON-TABLE ?auto_609737 ) ( ON ?auto_609738 ?auto_609737 ) ( ON ?auto_609739 ?auto_609738 ) ( ON ?auto_609740 ?auto_609739 ) ( ON ?auto_609741 ?auto_609740 ) ( ON ?auto_609742 ?auto_609741 ) ( ON ?auto_609743 ?auto_609742 ) ( ON ?auto_609744 ?auto_609743 ) ( ON ?auto_609745 ?auto_609744 ) ( ON ?auto_609746 ?auto_609745 ) ( ON ?auto_609747 ?auto_609746 ) ( ON ?auto_609748 ?auto_609747 ) ( not ( = ?auto_609737 ?auto_609738 ) ) ( not ( = ?auto_609737 ?auto_609739 ) ) ( not ( = ?auto_609737 ?auto_609740 ) ) ( not ( = ?auto_609737 ?auto_609741 ) ) ( not ( = ?auto_609737 ?auto_609742 ) ) ( not ( = ?auto_609737 ?auto_609743 ) ) ( not ( = ?auto_609737 ?auto_609744 ) ) ( not ( = ?auto_609737 ?auto_609745 ) ) ( not ( = ?auto_609737 ?auto_609746 ) ) ( not ( = ?auto_609737 ?auto_609747 ) ) ( not ( = ?auto_609737 ?auto_609748 ) ) ( not ( = ?auto_609737 ?auto_609749 ) ) ( not ( = ?auto_609737 ?auto_609750 ) ) ( not ( = ?auto_609737 ?auto_609751 ) ) ( not ( = ?auto_609737 ?auto_609752 ) ) ( not ( = ?auto_609738 ?auto_609739 ) ) ( not ( = ?auto_609738 ?auto_609740 ) ) ( not ( = ?auto_609738 ?auto_609741 ) ) ( not ( = ?auto_609738 ?auto_609742 ) ) ( not ( = ?auto_609738 ?auto_609743 ) ) ( not ( = ?auto_609738 ?auto_609744 ) ) ( not ( = ?auto_609738 ?auto_609745 ) ) ( not ( = ?auto_609738 ?auto_609746 ) ) ( not ( = ?auto_609738 ?auto_609747 ) ) ( not ( = ?auto_609738 ?auto_609748 ) ) ( not ( = ?auto_609738 ?auto_609749 ) ) ( not ( = ?auto_609738 ?auto_609750 ) ) ( not ( = ?auto_609738 ?auto_609751 ) ) ( not ( = ?auto_609738 ?auto_609752 ) ) ( not ( = ?auto_609739 ?auto_609740 ) ) ( not ( = ?auto_609739 ?auto_609741 ) ) ( not ( = ?auto_609739 ?auto_609742 ) ) ( not ( = ?auto_609739 ?auto_609743 ) ) ( not ( = ?auto_609739 ?auto_609744 ) ) ( not ( = ?auto_609739 ?auto_609745 ) ) ( not ( = ?auto_609739 ?auto_609746 ) ) ( not ( = ?auto_609739 ?auto_609747 ) ) ( not ( = ?auto_609739 ?auto_609748 ) ) ( not ( = ?auto_609739 ?auto_609749 ) ) ( not ( = ?auto_609739 ?auto_609750 ) ) ( not ( = ?auto_609739 ?auto_609751 ) ) ( not ( = ?auto_609739 ?auto_609752 ) ) ( not ( = ?auto_609740 ?auto_609741 ) ) ( not ( = ?auto_609740 ?auto_609742 ) ) ( not ( = ?auto_609740 ?auto_609743 ) ) ( not ( = ?auto_609740 ?auto_609744 ) ) ( not ( = ?auto_609740 ?auto_609745 ) ) ( not ( = ?auto_609740 ?auto_609746 ) ) ( not ( = ?auto_609740 ?auto_609747 ) ) ( not ( = ?auto_609740 ?auto_609748 ) ) ( not ( = ?auto_609740 ?auto_609749 ) ) ( not ( = ?auto_609740 ?auto_609750 ) ) ( not ( = ?auto_609740 ?auto_609751 ) ) ( not ( = ?auto_609740 ?auto_609752 ) ) ( not ( = ?auto_609741 ?auto_609742 ) ) ( not ( = ?auto_609741 ?auto_609743 ) ) ( not ( = ?auto_609741 ?auto_609744 ) ) ( not ( = ?auto_609741 ?auto_609745 ) ) ( not ( = ?auto_609741 ?auto_609746 ) ) ( not ( = ?auto_609741 ?auto_609747 ) ) ( not ( = ?auto_609741 ?auto_609748 ) ) ( not ( = ?auto_609741 ?auto_609749 ) ) ( not ( = ?auto_609741 ?auto_609750 ) ) ( not ( = ?auto_609741 ?auto_609751 ) ) ( not ( = ?auto_609741 ?auto_609752 ) ) ( not ( = ?auto_609742 ?auto_609743 ) ) ( not ( = ?auto_609742 ?auto_609744 ) ) ( not ( = ?auto_609742 ?auto_609745 ) ) ( not ( = ?auto_609742 ?auto_609746 ) ) ( not ( = ?auto_609742 ?auto_609747 ) ) ( not ( = ?auto_609742 ?auto_609748 ) ) ( not ( = ?auto_609742 ?auto_609749 ) ) ( not ( = ?auto_609742 ?auto_609750 ) ) ( not ( = ?auto_609742 ?auto_609751 ) ) ( not ( = ?auto_609742 ?auto_609752 ) ) ( not ( = ?auto_609743 ?auto_609744 ) ) ( not ( = ?auto_609743 ?auto_609745 ) ) ( not ( = ?auto_609743 ?auto_609746 ) ) ( not ( = ?auto_609743 ?auto_609747 ) ) ( not ( = ?auto_609743 ?auto_609748 ) ) ( not ( = ?auto_609743 ?auto_609749 ) ) ( not ( = ?auto_609743 ?auto_609750 ) ) ( not ( = ?auto_609743 ?auto_609751 ) ) ( not ( = ?auto_609743 ?auto_609752 ) ) ( not ( = ?auto_609744 ?auto_609745 ) ) ( not ( = ?auto_609744 ?auto_609746 ) ) ( not ( = ?auto_609744 ?auto_609747 ) ) ( not ( = ?auto_609744 ?auto_609748 ) ) ( not ( = ?auto_609744 ?auto_609749 ) ) ( not ( = ?auto_609744 ?auto_609750 ) ) ( not ( = ?auto_609744 ?auto_609751 ) ) ( not ( = ?auto_609744 ?auto_609752 ) ) ( not ( = ?auto_609745 ?auto_609746 ) ) ( not ( = ?auto_609745 ?auto_609747 ) ) ( not ( = ?auto_609745 ?auto_609748 ) ) ( not ( = ?auto_609745 ?auto_609749 ) ) ( not ( = ?auto_609745 ?auto_609750 ) ) ( not ( = ?auto_609745 ?auto_609751 ) ) ( not ( = ?auto_609745 ?auto_609752 ) ) ( not ( = ?auto_609746 ?auto_609747 ) ) ( not ( = ?auto_609746 ?auto_609748 ) ) ( not ( = ?auto_609746 ?auto_609749 ) ) ( not ( = ?auto_609746 ?auto_609750 ) ) ( not ( = ?auto_609746 ?auto_609751 ) ) ( not ( = ?auto_609746 ?auto_609752 ) ) ( not ( = ?auto_609747 ?auto_609748 ) ) ( not ( = ?auto_609747 ?auto_609749 ) ) ( not ( = ?auto_609747 ?auto_609750 ) ) ( not ( = ?auto_609747 ?auto_609751 ) ) ( not ( = ?auto_609747 ?auto_609752 ) ) ( not ( = ?auto_609748 ?auto_609749 ) ) ( not ( = ?auto_609748 ?auto_609750 ) ) ( not ( = ?auto_609748 ?auto_609751 ) ) ( not ( = ?auto_609748 ?auto_609752 ) ) ( not ( = ?auto_609749 ?auto_609750 ) ) ( not ( = ?auto_609749 ?auto_609751 ) ) ( not ( = ?auto_609749 ?auto_609752 ) ) ( not ( = ?auto_609750 ?auto_609751 ) ) ( not ( = ?auto_609750 ?auto_609752 ) ) ( not ( = ?auto_609751 ?auto_609752 ) ) ( ON ?auto_609750 ?auto_609751 ) ( CLEAR ?auto_609748 ) ( ON ?auto_609749 ?auto_609750 ) ( CLEAR ?auto_609749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_609737 ?auto_609738 ?auto_609739 ?auto_609740 ?auto_609741 ?auto_609742 ?auto_609743 ?auto_609744 ?auto_609745 ?auto_609746 ?auto_609747 ?auto_609748 ?auto_609749 )
      ( MAKE-15PILE ?auto_609737 ?auto_609738 ?auto_609739 ?auto_609740 ?auto_609741 ?auto_609742 ?auto_609743 ?auto_609744 ?auto_609745 ?auto_609746 ?auto_609747 ?auto_609748 ?auto_609749 ?auto_609750 ?auto_609751 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_609799 - BLOCK
      ?auto_609800 - BLOCK
      ?auto_609801 - BLOCK
      ?auto_609802 - BLOCK
      ?auto_609803 - BLOCK
      ?auto_609804 - BLOCK
      ?auto_609805 - BLOCK
      ?auto_609806 - BLOCK
      ?auto_609807 - BLOCK
      ?auto_609808 - BLOCK
      ?auto_609809 - BLOCK
      ?auto_609810 - BLOCK
      ?auto_609811 - BLOCK
      ?auto_609812 - BLOCK
      ?auto_609813 - BLOCK
    )
    :vars
    (
      ?auto_609814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609813 ?auto_609814 ) ( ON-TABLE ?auto_609799 ) ( ON ?auto_609800 ?auto_609799 ) ( ON ?auto_609801 ?auto_609800 ) ( ON ?auto_609802 ?auto_609801 ) ( ON ?auto_609803 ?auto_609802 ) ( ON ?auto_609804 ?auto_609803 ) ( ON ?auto_609805 ?auto_609804 ) ( ON ?auto_609806 ?auto_609805 ) ( ON ?auto_609807 ?auto_609806 ) ( ON ?auto_609808 ?auto_609807 ) ( ON ?auto_609809 ?auto_609808 ) ( not ( = ?auto_609799 ?auto_609800 ) ) ( not ( = ?auto_609799 ?auto_609801 ) ) ( not ( = ?auto_609799 ?auto_609802 ) ) ( not ( = ?auto_609799 ?auto_609803 ) ) ( not ( = ?auto_609799 ?auto_609804 ) ) ( not ( = ?auto_609799 ?auto_609805 ) ) ( not ( = ?auto_609799 ?auto_609806 ) ) ( not ( = ?auto_609799 ?auto_609807 ) ) ( not ( = ?auto_609799 ?auto_609808 ) ) ( not ( = ?auto_609799 ?auto_609809 ) ) ( not ( = ?auto_609799 ?auto_609810 ) ) ( not ( = ?auto_609799 ?auto_609811 ) ) ( not ( = ?auto_609799 ?auto_609812 ) ) ( not ( = ?auto_609799 ?auto_609813 ) ) ( not ( = ?auto_609799 ?auto_609814 ) ) ( not ( = ?auto_609800 ?auto_609801 ) ) ( not ( = ?auto_609800 ?auto_609802 ) ) ( not ( = ?auto_609800 ?auto_609803 ) ) ( not ( = ?auto_609800 ?auto_609804 ) ) ( not ( = ?auto_609800 ?auto_609805 ) ) ( not ( = ?auto_609800 ?auto_609806 ) ) ( not ( = ?auto_609800 ?auto_609807 ) ) ( not ( = ?auto_609800 ?auto_609808 ) ) ( not ( = ?auto_609800 ?auto_609809 ) ) ( not ( = ?auto_609800 ?auto_609810 ) ) ( not ( = ?auto_609800 ?auto_609811 ) ) ( not ( = ?auto_609800 ?auto_609812 ) ) ( not ( = ?auto_609800 ?auto_609813 ) ) ( not ( = ?auto_609800 ?auto_609814 ) ) ( not ( = ?auto_609801 ?auto_609802 ) ) ( not ( = ?auto_609801 ?auto_609803 ) ) ( not ( = ?auto_609801 ?auto_609804 ) ) ( not ( = ?auto_609801 ?auto_609805 ) ) ( not ( = ?auto_609801 ?auto_609806 ) ) ( not ( = ?auto_609801 ?auto_609807 ) ) ( not ( = ?auto_609801 ?auto_609808 ) ) ( not ( = ?auto_609801 ?auto_609809 ) ) ( not ( = ?auto_609801 ?auto_609810 ) ) ( not ( = ?auto_609801 ?auto_609811 ) ) ( not ( = ?auto_609801 ?auto_609812 ) ) ( not ( = ?auto_609801 ?auto_609813 ) ) ( not ( = ?auto_609801 ?auto_609814 ) ) ( not ( = ?auto_609802 ?auto_609803 ) ) ( not ( = ?auto_609802 ?auto_609804 ) ) ( not ( = ?auto_609802 ?auto_609805 ) ) ( not ( = ?auto_609802 ?auto_609806 ) ) ( not ( = ?auto_609802 ?auto_609807 ) ) ( not ( = ?auto_609802 ?auto_609808 ) ) ( not ( = ?auto_609802 ?auto_609809 ) ) ( not ( = ?auto_609802 ?auto_609810 ) ) ( not ( = ?auto_609802 ?auto_609811 ) ) ( not ( = ?auto_609802 ?auto_609812 ) ) ( not ( = ?auto_609802 ?auto_609813 ) ) ( not ( = ?auto_609802 ?auto_609814 ) ) ( not ( = ?auto_609803 ?auto_609804 ) ) ( not ( = ?auto_609803 ?auto_609805 ) ) ( not ( = ?auto_609803 ?auto_609806 ) ) ( not ( = ?auto_609803 ?auto_609807 ) ) ( not ( = ?auto_609803 ?auto_609808 ) ) ( not ( = ?auto_609803 ?auto_609809 ) ) ( not ( = ?auto_609803 ?auto_609810 ) ) ( not ( = ?auto_609803 ?auto_609811 ) ) ( not ( = ?auto_609803 ?auto_609812 ) ) ( not ( = ?auto_609803 ?auto_609813 ) ) ( not ( = ?auto_609803 ?auto_609814 ) ) ( not ( = ?auto_609804 ?auto_609805 ) ) ( not ( = ?auto_609804 ?auto_609806 ) ) ( not ( = ?auto_609804 ?auto_609807 ) ) ( not ( = ?auto_609804 ?auto_609808 ) ) ( not ( = ?auto_609804 ?auto_609809 ) ) ( not ( = ?auto_609804 ?auto_609810 ) ) ( not ( = ?auto_609804 ?auto_609811 ) ) ( not ( = ?auto_609804 ?auto_609812 ) ) ( not ( = ?auto_609804 ?auto_609813 ) ) ( not ( = ?auto_609804 ?auto_609814 ) ) ( not ( = ?auto_609805 ?auto_609806 ) ) ( not ( = ?auto_609805 ?auto_609807 ) ) ( not ( = ?auto_609805 ?auto_609808 ) ) ( not ( = ?auto_609805 ?auto_609809 ) ) ( not ( = ?auto_609805 ?auto_609810 ) ) ( not ( = ?auto_609805 ?auto_609811 ) ) ( not ( = ?auto_609805 ?auto_609812 ) ) ( not ( = ?auto_609805 ?auto_609813 ) ) ( not ( = ?auto_609805 ?auto_609814 ) ) ( not ( = ?auto_609806 ?auto_609807 ) ) ( not ( = ?auto_609806 ?auto_609808 ) ) ( not ( = ?auto_609806 ?auto_609809 ) ) ( not ( = ?auto_609806 ?auto_609810 ) ) ( not ( = ?auto_609806 ?auto_609811 ) ) ( not ( = ?auto_609806 ?auto_609812 ) ) ( not ( = ?auto_609806 ?auto_609813 ) ) ( not ( = ?auto_609806 ?auto_609814 ) ) ( not ( = ?auto_609807 ?auto_609808 ) ) ( not ( = ?auto_609807 ?auto_609809 ) ) ( not ( = ?auto_609807 ?auto_609810 ) ) ( not ( = ?auto_609807 ?auto_609811 ) ) ( not ( = ?auto_609807 ?auto_609812 ) ) ( not ( = ?auto_609807 ?auto_609813 ) ) ( not ( = ?auto_609807 ?auto_609814 ) ) ( not ( = ?auto_609808 ?auto_609809 ) ) ( not ( = ?auto_609808 ?auto_609810 ) ) ( not ( = ?auto_609808 ?auto_609811 ) ) ( not ( = ?auto_609808 ?auto_609812 ) ) ( not ( = ?auto_609808 ?auto_609813 ) ) ( not ( = ?auto_609808 ?auto_609814 ) ) ( not ( = ?auto_609809 ?auto_609810 ) ) ( not ( = ?auto_609809 ?auto_609811 ) ) ( not ( = ?auto_609809 ?auto_609812 ) ) ( not ( = ?auto_609809 ?auto_609813 ) ) ( not ( = ?auto_609809 ?auto_609814 ) ) ( not ( = ?auto_609810 ?auto_609811 ) ) ( not ( = ?auto_609810 ?auto_609812 ) ) ( not ( = ?auto_609810 ?auto_609813 ) ) ( not ( = ?auto_609810 ?auto_609814 ) ) ( not ( = ?auto_609811 ?auto_609812 ) ) ( not ( = ?auto_609811 ?auto_609813 ) ) ( not ( = ?auto_609811 ?auto_609814 ) ) ( not ( = ?auto_609812 ?auto_609813 ) ) ( not ( = ?auto_609812 ?auto_609814 ) ) ( not ( = ?auto_609813 ?auto_609814 ) ) ( ON ?auto_609812 ?auto_609813 ) ( ON ?auto_609811 ?auto_609812 ) ( CLEAR ?auto_609809 ) ( ON ?auto_609810 ?auto_609811 ) ( CLEAR ?auto_609810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_609799 ?auto_609800 ?auto_609801 ?auto_609802 ?auto_609803 ?auto_609804 ?auto_609805 ?auto_609806 ?auto_609807 ?auto_609808 ?auto_609809 ?auto_609810 )
      ( MAKE-15PILE ?auto_609799 ?auto_609800 ?auto_609801 ?auto_609802 ?auto_609803 ?auto_609804 ?auto_609805 ?auto_609806 ?auto_609807 ?auto_609808 ?auto_609809 ?auto_609810 ?auto_609811 ?auto_609812 ?auto_609813 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_609861 - BLOCK
      ?auto_609862 - BLOCK
      ?auto_609863 - BLOCK
      ?auto_609864 - BLOCK
      ?auto_609865 - BLOCK
      ?auto_609866 - BLOCK
      ?auto_609867 - BLOCK
      ?auto_609868 - BLOCK
      ?auto_609869 - BLOCK
      ?auto_609870 - BLOCK
      ?auto_609871 - BLOCK
      ?auto_609872 - BLOCK
      ?auto_609873 - BLOCK
      ?auto_609874 - BLOCK
      ?auto_609875 - BLOCK
    )
    :vars
    (
      ?auto_609876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609875 ?auto_609876 ) ( ON-TABLE ?auto_609861 ) ( ON ?auto_609862 ?auto_609861 ) ( ON ?auto_609863 ?auto_609862 ) ( ON ?auto_609864 ?auto_609863 ) ( ON ?auto_609865 ?auto_609864 ) ( ON ?auto_609866 ?auto_609865 ) ( ON ?auto_609867 ?auto_609866 ) ( ON ?auto_609868 ?auto_609867 ) ( ON ?auto_609869 ?auto_609868 ) ( ON ?auto_609870 ?auto_609869 ) ( not ( = ?auto_609861 ?auto_609862 ) ) ( not ( = ?auto_609861 ?auto_609863 ) ) ( not ( = ?auto_609861 ?auto_609864 ) ) ( not ( = ?auto_609861 ?auto_609865 ) ) ( not ( = ?auto_609861 ?auto_609866 ) ) ( not ( = ?auto_609861 ?auto_609867 ) ) ( not ( = ?auto_609861 ?auto_609868 ) ) ( not ( = ?auto_609861 ?auto_609869 ) ) ( not ( = ?auto_609861 ?auto_609870 ) ) ( not ( = ?auto_609861 ?auto_609871 ) ) ( not ( = ?auto_609861 ?auto_609872 ) ) ( not ( = ?auto_609861 ?auto_609873 ) ) ( not ( = ?auto_609861 ?auto_609874 ) ) ( not ( = ?auto_609861 ?auto_609875 ) ) ( not ( = ?auto_609861 ?auto_609876 ) ) ( not ( = ?auto_609862 ?auto_609863 ) ) ( not ( = ?auto_609862 ?auto_609864 ) ) ( not ( = ?auto_609862 ?auto_609865 ) ) ( not ( = ?auto_609862 ?auto_609866 ) ) ( not ( = ?auto_609862 ?auto_609867 ) ) ( not ( = ?auto_609862 ?auto_609868 ) ) ( not ( = ?auto_609862 ?auto_609869 ) ) ( not ( = ?auto_609862 ?auto_609870 ) ) ( not ( = ?auto_609862 ?auto_609871 ) ) ( not ( = ?auto_609862 ?auto_609872 ) ) ( not ( = ?auto_609862 ?auto_609873 ) ) ( not ( = ?auto_609862 ?auto_609874 ) ) ( not ( = ?auto_609862 ?auto_609875 ) ) ( not ( = ?auto_609862 ?auto_609876 ) ) ( not ( = ?auto_609863 ?auto_609864 ) ) ( not ( = ?auto_609863 ?auto_609865 ) ) ( not ( = ?auto_609863 ?auto_609866 ) ) ( not ( = ?auto_609863 ?auto_609867 ) ) ( not ( = ?auto_609863 ?auto_609868 ) ) ( not ( = ?auto_609863 ?auto_609869 ) ) ( not ( = ?auto_609863 ?auto_609870 ) ) ( not ( = ?auto_609863 ?auto_609871 ) ) ( not ( = ?auto_609863 ?auto_609872 ) ) ( not ( = ?auto_609863 ?auto_609873 ) ) ( not ( = ?auto_609863 ?auto_609874 ) ) ( not ( = ?auto_609863 ?auto_609875 ) ) ( not ( = ?auto_609863 ?auto_609876 ) ) ( not ( = ?auto_609864 ?auto_609865 ) ) ( not ( = ?auto_609864 ?auto_609866 ) ) ( not ( = ?auto_609864 ?auto_609867 ) ) ( not ( = ?auto_609864 ?auto_609868 ) ) ( not ( = ?auto_609864 ?auto_609869 ) ) ( not ( = ?auto_609864 ?auto_609870 ) ) ( not ( = ?auto_609864 ?auto_609871 ) ) ( not ( = ?auto_609864 ?auto_609872 ) ) ( not ( = ?auto_609864 ?auto_609873 ) ) ( not ( = ?auto_609864 ?auto_609874 ) ) ( not ( = ?auto_609864 ?auto_609875 ) ) ( not ( = ?auto_609864 ?auto_609876 ) ) ( not ( = ?auto_609865 ?auto_609866 ) ) ( not ( = ?auto_609865 ?auto_609867 ) ) ( not ( = ?auto_609865 ?auto_609868 ) ) ( not ( = ?auto_609865 ?auto_609869 ) ) ( not ( = ?auto_609865 ?auto_609870 ) ) ( not ( = ?auto_609865 ?auto_609871 ) ) ( not ( = ?auto_609865 ?auto_609872 ) ) ( not ( = ?auto_609865 ?auto_609873 ) ) ( not ( = ?auto_609865 ?auto_609874 ) ) ( not ( = ?auto_609865 ?auto_609875 ) ) ( not ( = ?auto_609865 ?auto_609876 ) ) ( not ( = ?auto_609866 ?auto_609867 ) ) ( not ( = ?auto_609866 ?auto_609868 ) ) ( not ( = ?auto_609866 ?auto_609869 ) ) ( not ( = ?auto_609866 ?auto_609870 ) ) ( not ( = ?auto_609866 ?auto_609871 ) ) ( not ( = ?auto_609866 ?auto_609872 ) ) ( not ( = ?auto_609866 ?auto_609873 ) ) ( not ( = ?auto_609866 ?auto_609874 ) ) ( not ( = ?auto_609866 ?auto_609875 ) ) ( not ( = ?auto_609866 ?auto_609876 ) ) ( not ( = ?auto_609867 ?auto_609868 ) ) ( not ( = ?auto_609867 ?auto_609869 ) ) ( not ( = ?auto_609867 ?auto_609870 ) ) ( not ( = ?auto_609867 ?auto_609871 ) ) ( not ( = ?auto_609867 ?auto_609872 ) ) ( not ( = ?auto_609867 ?auto_609873 ) ) ( not ( = ?auto_609867 ?auto_609874 ) ) ( not ( = ?auto_609867 ?auto_609875 ) ) ( not ( = ?auto_609867 ?auto_609876 ) ) ( not ( = ?auto_609868 ?auto_609869 ) ) ( not ( = ?auto_609868 ?auto_609870 ) ) ( not ( = ?auto_609868 ?auto_609871 ) ) ( not ( = ?auto_609868 ?auto_609872 ) ) ( not ( = ?auto_609868 ?auto_609873 ) ) ( not ( = ?auto_609868 ?auto_609874 ) ) ( not ( = ?auto_609868 ?auto_609875 ) ) ( not ( = ?auto_609868 ?auto_609876 ) ) ( not ( = ?auto_609869 ?auto_609870 ) ) ( not ( = ?auto_609869 ?auto_609871 ) ) ( not ( = ?auto_609869 ?auto_609872 ) ) ( not ( = ?auto_609869 ?auto_609873 ) ) ( not ( = ?auto_609869 ?auto_609874 ) ) ( not ( = ?auto_609869 ?auto_609875 ) ) ( not ( = ?auto_609869 ?auto_609876 ) ) ( not ( = ?auto_609870 ?auto_609871 ) ) ( not ( = ?auto_609870 ?auto_609872 ) ) ( not ( = ?auto_609870 ?auto_609873 ) ) ( not ( = ?auto_609870 ?auto_609874 ) ) ( not ( = ?auto_609870 ?auto_609875 ) ) ( not ( = ?auto_609870 ?auto_609876 ) ) ( not ( = ?auto_609871 ?auto_609872 ) ) ( not ( = ?auto_609871 ?auto_609873 ) ) ( not ( = ?auto_609871 ?auto_609874 ) ) ( not ( = ?auto_609871 ?auto_609875 ) ) ( not ( = ?auto_609871 ?auto_609876 ) ) ( not ( = ?auto_609872 ?auto_609873 ) ) ( not ( = ?auto_609872 ?auto_609874 ) ) ( not ( = ?auto_609872 ?auto_609875 ) ) ( not ( = ?auto_609872 ?auto_609876 ) ) ( not ( = ?auto_609873 ?auto_609874 ) ) ( not ( = ?auto_609873 ?auto_609875 ) ) ( not ( = ?auto_609873 ?auto_609876 ) ) ( not ( = ?auto_609874 ?auto_609875 ) ) ( not ( = ?auto_609874 ?auto_609876 ) ) ( not ( = ?auto_609875 ?auto_609876 ) ) ( ON ?auto_609874 ?auto_609875 ) ( ON ?auto_609873 ?auto_609874 ) ( ON ?auto_609872 ?auto_609873 ) ( CLEAR ?auto_609870 ) ( ON ?auto_609871 ?auto_609872 ) ( CLEAR ?auto_609871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_609861 ?auto_609862 ?auto_609863 ?auto_609864 ?auto_609865 ?auto_609866 ?auto_609867 ?auto_609868 ?auto_609869 ?auto_609870 ?auto_609871 )
      ( MAKE-15PILE ?auto_609861 ?auto_609862 ?auto_609863 ?auto_609864 ?auto_609865 ?auto_609866 ?auto_609867 ?auto_609868 ?auto_609869 ?auto_609870 ?auto_609871 ?auto_609872 ?auto_609873 ?auto_609874 ?auto_609875 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_609923 - BLOCK
      ?auto_609924 - BLOCK
      ?auto_609925 - BLOCK
      ?auto_609926 - BLOCK
      ?auto_609927 - BLOCK
      ?auto_609928 - BLOCK
      ?auto_609929 - BLOCK
      ?auto_609930 - BLOCK
      ?auto_609931 - BLOCK
      ?auto_609932 - BLOCK
      ?auto_609933 - BLOCK
      ?auto_609934 - BLOCK
      ?auto_609935 - BLOCK
      ?auto_609936 - BLOCK
      ?auto_609937 - BLOCK
    )
    :vars
    (
      ?auto_609938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609937 ?auto_609938 ) ( ON-TABLE ?auto_609923 ) ( ON ?auto_609924 ?auto_609923 ) ( ON ?auto_609925 ?auto_609924 ) ( ON ?auto_609926 ?auto_609925 ) ( ON ?auto_609927 ?auto_609926 ) ( ON ?auto_609928 ?auto_609927 ) ( ON ?auto_609929 ?auto_609928 ) ( ON ?auto_609930 ?auto_609929 ) ( ON ?auto_609931 ?auto_609930 ) ( not ( = ?auto_609923 ?auto_609924 ) ) ( not ( = ?auto_609923 ?auto_609925 ) ) ( not ( = ?auto_609923 ?auto_609926 ) ) ( not ( = ?auto_609923 ?auto_609927 ) ) ( not ( = ?auto_609923 ?auto_609928 ) ) ( not ( = ?auto_609923 ?auto_609929 ) ) ( not ( = ?auto_609923 ?auto_609930 ) ) ( not ( = ?auto_609923 ?auto_609931 ) ) ( not ( = ?auto_609923 ?auto_609932 ) ) ( not ( = ?auto_609923 ?auto_609933 ) ) ( not ( = ?auto_609923 ?auto_609934 ) ) ( not ( = ?auto_609923 ?auto_609935 ) ) ( not ( = ?auto_609923 ?auto_609936 ) ) ( not ( = ?auto_609923 ?auto_609937 ) ) ( not ( = ?auto_609923 ?auto_609938 ) ) ( not ( = ?auto_609924 ?auto_609925 ) ) ( not ( = ?auto_609924 ?auto_609926 ) ) ( not ( = ?auto_609924 ?auto_609927 ) ) ( not ( = ?auto_609924 ?auto_609928 ) ) ( not ( = ?auto_609924 ?auto_609929 ) ) ( not ( = ?auto_609924 ?auto_609930 ) ) ( not ( = ?auto_609924 ?auto_609931 ) ) ( not ( = ?auto_609924 ?auto_609932 ) ) ( not ( = ?auto_609924 ?auto_609933 ) ) ( not ( = ?auto_609924 ?auto_609934 ) ) ( not ( = ?auto_609924 ?auto_609935 ) ) ( not ( = ?auto_609924 ?auto_609936 ) ) ( not ( = ?auto_609924 ?auto_609937 ) ) ( not ( = ?auto_609924 ?auto_609938 ) ) ( not ( = ?auto_609925 ?auto_609926 ) ) ( not ( = ?auto_609925 ?auto_609927 ) ) ( not ( = ?auto_609925 ?auto_609928 ) ) ( not ( = ?auto_609925 ?auto_609929 ) ) ( not ( = ?auto_609925 ?auto_609930 ) ) ( not ( = ?auto_609925 ?auto_609931 ) ) ( not ( = ?auto_609925 ?auto_609932 ) ) ( not ( = ?auto_609925 ?auto_609933 ) ) ( not ( = ?auto_609925 ?auto_609934 ) ) ( not ( = ?auto_609925 ?auto_609935 ) ) ( not ( = ?auto_609925 ?auto_609936 ) ) ( not ( = ?auto_609925 ?auto_609937 ) ) ( not ( = ?auto_609925 ?auto_609938 ) ) ( not ( = ?auto_609926 ?auto_609927 ) ) ( not ( = ?auto_609926 ?auto_609928 ) ) ( not ( = ?auto_609926 ?auto_609929 ) ) ( not ( = ?auto_609926 ?auto_609930 ) ) ( not ( = ?auto_609926 ?auto_609931 ) ) ( not ( = ?auto_609926 ?auto_609932 ) ) ( not ( = ?auto_609926 ?auto_609933 ) ) ( not ( = ?auto_609926 ?auto_609934 ) ) ( not ( = ?auto_609926 ?auto_609935 ) ) ( not ( = ?auto_609926 ?auto_609936 ) ) ( not ( = ?auto_609926 ?auto_609937 ) ) ( not ( = ?auto_609926 ?auto_609938 ) ) ( not ( = ?auto_609927 ?auto_609928 ) ) ( not ( = ?auto_609927 ?auto_609929 ) ) ( not ( = ?auto_609927 ?auto_609930 ) ) ( not ( = ?auto_609927 ?auto_609931 ) ) ( not ( = ?auto_609927 ?auto_609932 ) ) ( not ( = ?auto_609927 ?auto_609933 ) ) ( not ( = ?auto_609927 ?auto_609934 ) ) ( not ( = ?auto_609927 ?auto_609935 ) ) ( not ( = ?auto_609927 ?auto_609936 ) ) ( not ( = ?auto_609927 ?auto_609937 ) ) ( not ( = ?auto_609927 ?auto_609938 ) ) ( not ( = ?auto_609928 ?auto_609929 ) ) ( not ( = ?auto_609928 ?auto_609930 ) ) ( not ( = ?auto_609928 ?auto_609931 ) ) ( not ( = ?auto_609928 ?auto_609932 ) ) ( not ( = ?auto_609928 ?auto_609933 ) ) ( not ( = ?auto_609928 ?auto_609934 ) ) ( not ( = ?auto_609928 ?auto_609935 ) ) ( not ( = ?auto_609928 ?auto_609936 ) ) ( not ( = ?auto_609928 ?auto_609937 ) ) ( not ( = ?auto_609928 ?auto_609938 ) ) ( not ( = ?auto_609929 ?auto_609930 ) ) ( not ( = ?auto_609929 ?auto_609931 ) ) ( not ( = ?auto_609929 ?auto_609932 ) ) ( not ( = ?auto_609929 ?auto_609933 ) ) ( not ( = ?auto_609929 ?auto_609934 ) ) ( not ( = ?auto_609929 ?auto_609935 ) ) ( not ( = ?auto_609929 ?auto_609936 ) ) ( not ( = ?auto_609929 ?auto_609937 ) ) ( not ( = ?auto_609929 ?auto_609938 ) ) ( not ( = ?auto_609930 ?auto_609931 ) ) ( not ( = ?auto_609930 ?auto_609932 ) ) ( not ( = ?auto_609930 ?auto_609933 ) ) ( not ( = ?auto_609930 ?auto_609934 ) ) ( not ( = ?auto_609930 ?auto_609935 ) ) ( not ( = ?auto_609930 ?auto_609936 ) ) ( not ( = ?auto_609930 ?auto_609937 ) ) ( not ( = ?auto_609930 ?auto_609938 ) ) ( not ( = ?auto_609931 ?auto_609932 ) ) ( not ( = ?auto_609931 ?auto_609933 ) ) ( not ( = ?auto_609931 ?auto_609934 ) ) ( not ( = ?auto_609931 ?auto_609935 ) ) ( not ( = ?auto_609931 ?auto_609936 ) ) ( not ( = ?auto_609931 ?auto_609937 ) ) ( not ( = ?auto_609931 ?auto_609938 ) ) ( not ( = ?auto_609932 ?auto_609933 ) ) ( not ( = ?auto_609932 ?auto_609934 ) ) ( not ( = ?auto_609932 ?auto_609935 ) ) ( not ( = ?auto_609932 ?auto_609936 ) ) ( not ( = ?auto_609932 ?auto_609937 ) ) ( not ( = ?auto_609932 ?auto_609938 ) ) ( not ( = ?auto_609933 ?auto_609934 ) ) ( not ( = ?auto_609933 ?auto_609935 ) ) ( not ( = ?auto_609933 ?auto_609936 ) ) ( not ( = ?auto_609933 ?auto_609937 ) ) ( not ( = ?auto_609933 ?auto_609938 ) ) ( not ( = ?auto_609934 ?auto_609935 ) ) ( not ( = ?auto_609934 ?auto_609936 ) ) ( not ( = ?auto_609934 ?auto_609937 ) ) ( not ( = ?auto_609934 ?auto_609938 ) ) ( not ( = ?auto_609935 ?auto_609936 ) ) ( not ( = ?auto_609935 ?auto_609937 ) ) ( not ( = ?auto_609935 ?auto_609938 ) ) ( not ( = ?auto_609936 ?auto_609937 ) ) ( not ( = ?auto_609936 ?auto_609938 ) ) ( not ( = ?auto_609937 ?auto_609938 ) ) ( ON ?auto_609936 ?auto_609937 ) ( ON ?auto_609935 ?auto_609936 ) ( ON ?auto_609934 ?auto_609935 ) ( ON ?auto_609933 ?auto_609934 ) ( CLEAR ?auto_609931 ) ( ON ?auto_609932 ?auto_609933 ) ( CLEAR ?auto_609932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_609923 ?auto_609924 ?auto_609925 ?auto_609926 ?auto_609927 ?auto_609928 ?auto_609929 ?auto_609930 ?auto_609931 ?auto_609932 )
      ( MAKE-15PILE ?auto_609923 ?auto_609924 ?auto_609925 ?auto_609926 ?auto_609927 ?auto_609928 ?auto_609929 ?auto_609930 ?auto_609931 ?auto_609932 ?auto_609933 ?auto_609934 ?auto_609935 ?auto_609936 ?auto_609937 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_609985 - BLOCK
      ?auto_609986 - BLOCK
      ?auto_609987 - BLOCK
      ?auto_609988 - BLOCK
      ?auto_609989 - BLOCK
      ?auto_609990 - BLOCK
      ?auto_609991 - BLOCK
      ?auto_609992 - BLOCK
      ?auto_609993 - BLOCK
      ?auto_609994 - BLOCK
      ?auto_609995 - BLOCK
      ?auto_609996 - BLOCK
      ?auto_609997 - BLOCK
      ?auto_609998 - BLOCK
      ?auto_609999 - BLOCK
    )
    :vars
    (
      ?auto_610000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_609999 ?auto_610000 ) ( ON-TABLE ?auto_609985 ) ( ON ?auto_609986 ?auto_609985 ) ( ON ?auto_609987 ?auto_609986 ) ( ON ?auto_609988 ?auto_609987 ) ( ON ?auto_609989 ?auto_609988 ) ( ON ?auto_609990 ?auto_609989 ) ( ON ?auto_609991 ?auto_609990 ) ( ON ?auto_609992 ?auto_609991 ) ( not ( = ?auto_609985 ?auto_609986 ) ) ( not ( = ?auto_609985 ?auto_609987 ) ) ( not ( = ?auto_609985 ?auto_609988 ) ) ( not ( = ?auto_609985 ?auto_609989 ) ) ( not ( = ?auto_609985 ?auto_609990 ) ) ( not ( = ?auto_609985 ?auto_609991 ) ) ( not ( = ?auto_609985 ?auto_609992 ) ) ( not ( = ?auto_609985 ?auto_609993 ) ) ( not ( = ?auto_609985 ?auto_609994 ) ) ( not ( = ?auto_609985 ?auto_609995 ) ) ( not ( = ?auto_609985 ?auto_609996 ) ) ( not ( = ?auto_609985 ?auto_609997 ) ) ( not ( = ?auto_609985 ?auto_609998 ) ) ( not ( = ?auto_609985 ?auto_609999 ) ) ( not ( = ?auto_609985 ?auto_610000 ) ) ( not ( = ?auto_609986 ?auto_609987 ) ) ( not ( = ?auto_609986 ?auto_609988 ) ) ( not ( = ?auto_609986 ?auto_609989 ) ) ( not ( = ?auto_609986 ?auto_609990 ) ) ( not ( = ?auto_609986 ?auto_609991 ) ) ( not ( = ?auto_609986 ?auto_609992 ) ) ( not ( = ?auto_609986 ?auto_609993 ) ) ( not ( = ?auto_609986 ?auto_609994 ) ) ( not ( = ?auto_609986 ?auto_609995 ) ) ( not ( = ?auto_609986 ?auto_609996 ) ) ( not ( = ?auto_609986 ?auto_609997 ) ) ( not ( = ?auto_609986 ?auto_609998 ) ) ( not ( = ?auto_609986 ?auto_609999 ) ) ( not ( = ?auto_609986 ?auto_610000 ) ) ( not ( = ?auto_609987 ?auto_609988 ) ) ( not ( = ?auto_609987 ?auto_609989 ) ) ( not ( = ?auto_609987 ?auto_609990 ) ) ( not ( = ?auto_609987 ?auto_609991 ) ) ( not ( = ?auto_609987 ?auto_609992 ) ) ( not ( = ?auto_609987 ?auto_609993 ) ) ( not ( = ?auto_609987 ?auto_609994 ) ) ( not ( = ?auto_609987 ?auto_609995 ) ) ( not ( = ?auto_609987 ?auto_609996 ) ) ( not ( = ?auto_609987 ?auto_609997 ) ) ( not ( = ?auto_609987 ?auto_609998 ) ) ( not ( = ?auto_609987 ?auto_609999 ) ) ( not ( = ?auto_609987 ?auto_610000 ) ) ( not ( = ?auto_609988 ?auto_609989 ) ) ( not ( = ?auto_609988 ?auto_609990 ) ) ( not ( = ?auto_609988 ?auto_609991 ) ) ( not ( = ?auto_609988 ?auto_609992 ) ) ( not ( = ?auto_609988 ?auto_609993 ) ) ( not ( = ?auto_609988 ?auto_609994 ) ) ( not ( = ?auto_609988 ?auto_609995 ) ) ( not ( = ?auto_609988 ?auto_609996 ) ) ( not ( = ?auto_609988 ?auto_609997 ) ) ( not ( = ?auto_609988 ?auto_609998 ) ) ( not ( = ?auto_609988 ?auto_609999 ) ) ( not ( = ?auto_609988 ?auto_610000 ) ) ( not ( = ?auto_609989 ?auto_609990 ) ) ( not ( = ?auto_609989 ?auto_609991 ) ) ( not ( = ?auto_609989 ?auto_609992 ) ) ( not ( = ?auto_609989 ?auto_609993 ) ) ( not ( = ?auto_609989 ?auto_609994 ) ) ( not ( = ?auto_609989 ?auto_609995 ) ) ( not ( = ?auto_609989 ?auto_609996 ) ) ( not ( = ?auto_609989 ?auto_609997 ) ) ( not ( = ?auto_609989 ?auto_609998 ) ) ( not ( = ?auto_609989 ?auto_609999 ) ) ( not ( = ?auto_609989 ?auto_610000 ) ) ( not ( = ?auto_609990 ?auto_609991 ) ) ( not ( = ?auto_609990 ?auto_609992 ) ) ( not ( = ?auto_609990 ?auto_609993 ) ) ( not ( = ?auto_609990 ?auto_609994 ) ) ( not ( = ?auto_609990 ?auto_609995 ) ) ( not ( = ?auto_609990 ?auto_609996 ) ) ( not ( = ?auto_609990 ?auto_609997 ) ) ( not ( = ?auto_609990 ?auto_609998 ) ) ( not ( = ?auto_609990 ?auto_609999 ) ) ( not ( = ?auto_609990 ?auto_610000 ) ) ( not ( = ?auto_609991 ?auto_609992 ) ) ( not ( = ?auto_609991 ?auto_609993 ) ) ( not ( = ?auto_609991 ?auto_609994 ) ) ( not ( = ?auto_609991 ?auto_609995 ) ) ( not ( = ?auto_609991 ?auto_609996 ) ) ( not ( = ?auto_609991 ?auto_609997 ) ) ( not ( = ?auto_609991 ?auto_609998 ) ) ( not ( = ?auto_609991 ?auto_609999 ) ) ( not ( = ?auto_609991 ?auto_610000 ) ) ( not ( = ?auto_609992 ?auto_609993 ) ) ( not ( = ?auto_609992 ?auto_609994 ) ) ( not ( = ?auto_609992 ?auto_609995 ) ) ( not ( = ?auto_609992 ?auto_609996 ) ) ( not ( = ?auto_609992 ?auto_609997 ) ) ( not ( = ?auto_609992 ?auto_609998 ) ) ( not ( = ?auto_609992 ?auto_609999 ) ) ( not ( = ?auto_609992 ?auto_610000 ) ) ( not ( = ?auto_609993 ?auto_609994 ) ) ( not ( = ?auto_609993 ?auto_609995 ) ) ( not ( = ?auto_609993 ?auto_609996 ) ) ( not ( = ?auto_609993 ?auto_609997 ) ) ( not ( = ?auto_609993 ?auto_609998 ) ) ( not ( = ?auto_609993 ?auto_609999 ) ) ( not ( = ?auto_609993 ?auto_610000 ) ) ( not ( = ?auto_609994 ?auto_609995 ) ) ( not ( = ?auto_609994 ?auto_609996 ) ) ( not ( = ?auto_609994 ?auto_609997 ) ) ( not ( = ?auto_609994 ?auto_609998 ) ) ( not ( = ?auto_609994 ?auto_609999 ) ) ( not ( = ?auto_609994 ?auto_610000 ) ) ( not ( = ?auto_609995 ?auto_609996 ) ) ( not ( = ?auto_609995 ?auto_609997 ) ) ( not ( = ?auto_609995 ?auto_609998 ) ) ( not ( = ?auto_609995 ?auto_609999 ) ) ( not ( = ?auto_609995 ?auto_610000 ) ) ( not ( = ?auto_609996 ?auto_609997 ) ) ( not ( = ?auto_609996 ?auto_609998 ) ) ( not ( = ?auto_609996 ?auto_609999 ) ) ( not ( = ?auto_609996 ?auto_610000 ) ) ( not ( = ?auto_609997 ?auto_609998 ) ) ( not ( = ?auto_609997 ?auto_609999 ) ) ( not ( = ?auto_609997 ?auto_610000 ) ) ( not ( = ?auto_609998 ?auto_609999 ) ) ( not ( = ?auto_609998 ?auto_610000 ) ) ( not ( = ?auto_609999 ?auto_610000 ) ) ( ON ?auto_609998 ?auto_609999 ) ( ON ?auto_609997 ?auto_609998 ) ( ON ?auto_609996 ?auto_609997 ) ( ON ?auto_609995 ?auto_609996 ) ( ON ?auto_609994 ?auto_609995 ) ( CLEAR ?auto_609992 ) ( ON ?auto_609993 ?auto_609994 ) ( CLEAR ?auto_609993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_609985 ?auto_609986 ?auto_609987 ?auto_609988 ?auto_609989 ?auto_609990 ?auto_609991 ?auto_609992 ?auto_609993 )
      ( MAKE-15PILE ?auto_609985 ?auto_609986 ?auto_609987 ?auto_609988 ?auto_609989 ?auto_609990 ?auto_609991 ?auto_609992 ?auto_609993 ?auto_609994 ?auto_609995 ?auto_609996 ?auto_609997 ?auto_609998 ?auto_609999 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_610047 - BLOCK
      ?auto_610048 - BLOCK
      ?auto_610049 - BLOCK
      ?auto_610050 - BLOCK
      ?auto_610051 - BLOCK
      ?auto_610052 - BLOCK
      ?auto_610053 - BLOCK
      ?auto_610054 - BLOCK
      ?auto_610055 - BLOCK
      ?auto_610056 - BLOCK
      ?auto_610057 - BLOCK
      ?auto_610058 - BLOCK
      ?auto_610059 - BLOCK
      ?auto_610060 - BLOCK
      ?auto_610061 - BLOCK
    )
    :vars
    (
      ?auto_610062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610061 ?auto_610062 ) ( ON-TABLE ?auto_610047 ) ( ON ?auto_610048 ?auto_610047 ) ( ON ?auto_610049 ?auto_610048 ) ( ON ?auto_610050 ?auto_610049 ) ( ON ?auto_610051 ?auto_610050 ) ( ON ?auto_610052 ?auto_610051 ) ( ON ?auto_610053 ?auto_610052 ) ( not ( = ?auto_610047 ?auto_610048 ) ) ( not ( = ?auto_610047 ?auto_610049 ) ) ( not ( = ?auto_610047 ?auto_610050 ) ) ( not ( = ?auto_610047 ?auto_610051 ) ) ( not ( = ?auto_610047 ?auto_610052 ) ) ( not ( = ?auto_610047 ?auto_610053 ) ) ( not ( = ?auto_610047 ?auto_610054 ) ) ( not ( = ?auto_610047 ?auto_610055 ) ) ( not ( = ?auto_610047 ?auto_610056 ) ) ( not ( = ?auto_610047 ?auto_610057 ) ) ( not ( = ?auto_610047 ?auto_610058 ) ) ( not ( = ?auto_610047 ?auto_610059 ) ) ( not ( = ?auto_610047 ?auto_610060 ) ) ( not ( = ?auto_610047 ?auto_610061 ) ) ( not ( = ?auto_610047 ?auto_610062 ) ) ( not ( = ?auto_610048 ?auto_610049 ) ) ( not ( = ?auto_610048 ?auto_610050 ) ) ( not ( = ?auto_610048 ?auto_610051 ) ) ( not ( = ?auto_610048 ?auto_610052 ) ) ( not ( = ?auto_610048 ?auto_610053 ) ) ( not ( = ?auto_610048 ?auto_610054 ) ) ( not ( = ?auto_610048 ?auto_610055 ) ) ( not ( = ?auto_610048 ?auto_610056 ) ) ( not ( = ?auto_610048 ?auto_610057 ) ) ( not ( = ?auto_610048 ?auto_610058 ) ) ( not ( = ?auto_610048 ?auto_610059 ) ) ( not ( = ?auto_610048 ?auto_610060 ) ) ( not ( = ?auto_610048 ?auto_610061 ) ) ( not ( = ?auto_610048 ?auto_610062 ) ) ( not ( = ?auto_610049 ?auto_610050 ) ) ( not ( = ?auto_610049 ?auto_610051 ) ) ( not ( = ?auto_610049 ?auto_610052 ) ) ( not ( = ?auto_610049 ?auto_610053 ) ) ( not ( = ?auto_610049 ?auto_610054 ) ) ( not ( = ?auto_610049 ?auto_610055 ) ) ( not ( = ?auto_610049 ?auto_610056 ) ) ( not ( = ?auto_610049 ?auto_610057 ) ) ( not ( = ?auto_610049 ?auto_610058 ) ) ( not ( = ?auto_610049 ?auto_610059 ) ) ( not ( = ?auto_610049 ?auto_610060 ) ) ( not ( = ?auto_610049 ?auto_610061 ) ) ( not ( = ?auto_610049 ?auto_610062 ) ) ( not ( = ?auto_610050 ?auto_610051 ) ) ( not ( = ?auto_610050 ?auto_610052 ) ) ( not ( = ?auto_610050 ?auto_610053 ) ) ( not ( = ?auto_610050 ?auto_610054 ) ) ( not ( = ?auto_610050 ?auto_610055 ) ) ( not ( = ?auto_610050 ?auto_610056 ) ) ( not ( = ?auto_610050 ?auto_610057 ) ) ( not ( = ?auto_610050 ?auto_610058 ) ) ( not ( = ?auto_610050 ?auto_610059 ) ) ( not ( = ?auto_610050 ?auto_610060 ) ) ( not ( = ?auto_610050 ?auto_610061 ) ) ( not ( = ?auto_610050 ?auto_610062 ) ) ( not ( = ?auto_610051 ?auto_610052 ) ) ( not ( = ?auto_610051 ?auto_610053 ) ) ( not ( = ?auto_610051 ?auto_610054 ) ) ( not ( = ?auto_610051 ?auto_610055 ) ) ( not ( = ?auto_610051 ?auto_610056 ) ) ( not ( = ?auto_610051 ?auto_610057 ) ) ( not ( = ?auto_610051 ?auto_610058 ) ) ( not ( = ?auto_610051 ?auto_610059 ) ) ( not ( = ?auto_610051 ?auto_610060 ) ) ( not ( = ?auto_610051 ?auto_610061 ) ) ( not ( = ?auto_610051 ?auto_610062 ) ) ( not ( = ?auto_610052 ?auto_610053 ) ) ( not ( = ?auto_610052 ?auto_610054 ) ) ( not ( = ?auto_610052 ?auto_610055 ) ) ( not ( = ?auto_610052 ?auto_610056 ) ) ( not ( = ?auto_610052 ?auto_610057 ) ) ( not ( = ?auto_610052 ?auto_610058 ) ) ( not ( = ?auto_610052 ?auto_610059 ) ) ( not ( = ?auto_610052 ?auto_610060 ) ) ( not ( = ?auto_610052 ?auto_610061 ) ) ( not ( = ?auto_610052 ?auto_610062 ) ) ( not ( = ?auto_610053 ?auto_610054 ) ) ( not ( = ?auto_610053 ?auto_610055 ) ) ( not ( = ?auto_610053 ?auto_610056 ) ) ( not ( = ?auto_610053 ?auto_610057 ) ) ( not ( = ?auto_610053 ?auto_610058 ) ) ( not ( = ?auto_610053 ?auto_610059 ) ) ( not ( = ?auto_610053 ?auto_610060 ) ) ( not ( = ?auto_610053 ?auto_610061 ) ) ( not ( = ?auto_610053 ?auto_610062 ) ) ( not ( = ?auto_610054 ?auto_610055 ) ) ( not ( = ?auto_610054 ?auto_610056 ) ) ( not ( = ?auto_610054 ?auto_610057 ) ) ( not ( = ?auto_610054 ?auto_610058 ) ) ( not ( = ?auto_610054 ?auto_610059 ) ) ( not ( = ?auto_610054 ?auto_610060 ) ) ( not ( = ?auto_610054 ?auto_610061 ) ) ( not ( = ?auto_610054 ?auto_610062 ) ) ( not ( = ?auto_610055 ?auto_610056 ) ) ( not ( = ?auto_610055 ?auto_610057 ) ) ( not ( = ?auto_610055 ?auto_610058 ) ) ( not ( = ?auto_610055 ?auto_610059 ) ) ( not ( = ?auto_610055 ?auto_610060 ) ) ( not ( = ?auto_610055 ?auto_610061 ) ) ( not ( = ?auto_610055 ?auto_610062 ) ) ( not ( = ?auto_610056 ?auto_610057 ) ) ( not ( = ?auto_610056 ?auto_610058 ) ) ( not ( = ?auto_610056 ?auto_610059 ) ) ( not ( = ?auto_610056 ?auto_610060 ) ) ( not ( = ?auto_610056 ?auto_610061 ) ) ( not ( = ?auto_610056 ?auto_610062 ) ) ( not ( = ?auto_610057 ?auto_610058 ) ) ( not ( = ?auto_610057 ?auto_610059 ) ) ( not ( = ?auto_610057 ?auto_610060 ) ) ( not ( = ?auto_610057 ?auto_610061 ) ) ( not ( = ?auto_610057 ?auto_610062 ) ) ( not ( = ?auto_610058 ?auto_610059 ) ) ( not ( = ?auto_610058 ?auto_610060 ) ) ( not ( = ?auto_610058 ?auto_610061 ) ) ( not ( = ?auto_610058 ?auto_610062 ) ) ( not ( = ?auto_610059 ?auto_610060 ) ) ( not ( = ?auto_610059 ?auto_610061 ) ) ( not ( = ?auto_610059 ?auto_610062 ) ) ( not ( = ?auto_610060 ?auto_610061 ) ) ( not ( = ?auto_610060 ?auto_610062 ) ) ( not ( = ?auto_610061 ?auto_610062 ) ) ( ON ?auto_610060 ?auto_610061 ) ( ON ?auto_610059 ?auto_610060 ) ( ON ?auto_610058 ?auto_610059 ) ( ON ?auto_610057 ?auto_610058 ) ( ON ?auto_610056 ?auto_610057 ) ( ON ?auto_610055 ?auto_610056 ) ( CLEAR ?auto_610053 ) ( ON ?auto_610054 ?auto_610055 ) ( CLEAR ?auto_610054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_610047 ?auto_610048 ?auto_610049 ?auto_610050 ?auto_610051 ?auto_610052 ?auto_610053 ?auto_610054 )
      ( MAKE-15PILE ?auto_610047 ?auto_610048 ?auto_610049 ?auto_610050 ?auto_610051 ?auto_610052 ?auto_610053 ?auto_610054 ?auto_610055 ?auto_610056 ?auto_610057 ?auto_610058 ?auto_610059 ?auto_610060 ?auto_610061 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_610109 - BLOCK
      ?auto_610110 - BLOCK
      ?auto_610111 - BLOCK
      ?auto_610112 - BLOCK
      ?auto_610113 - BLOCK
      ?auto_610114 - BLOCK
      ?auto_610115 - BLOCK
      ?auto_610116 - BLOCK
      ?auto_610117 - BLOCK
      ?auto_610118 - BLOCK
      ?auto_610119 - BLOCK
      ?auto_610120 - BLOCK
      ?auto_610121 - BLOCK
      ?auto_610122 - BLOCK
      ?auto_610123 - BLOCK
    )
    :vars
    (
      ?auto_610124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610123 ?auto_610124 ) ( ON-TABLE ?auto_610109 ) ( ON ?auto_610110 ?auto_610109 ) ( ON ?auto_610111 ?auto_610110 ) ( ON ?auto_610112 ?auto_610111 ) ( ON ?auto_610113 ?auto_610112 ) ( ON ?auto_610114 ?auto_610113 ) ( not ( = ?auto_610109 ?auto_610110 ) ) ( not ( = ?auto_610109 ?auto_610111 ) ) ( not ( = ?auto_610109 ?auto_610112 ) ) ( not ( = ?auto_610109 ?auto_610113 ) ) ( not ( = ?auto_610109 ?auto_610114 ) ) ( not ( = ?auto_610109 ?auto_610115 ) ) ( not ( = ?auto_610109 ?auto_610116 ) ) ( not ( = ?auto_610109 ?auto_610117 ) ) ( not ( = ?auto_610109 ?auto_610118 ) ) ( not ( = ?auto_610109 ?auto_610119 ) ) ( not ( = ?auto_610109 ?auto_610120 ) ) ( not ( = ?auto_610109 ?auto_610121 ) ) ( not ( = ?auto_610109 ?auto_610122 ) ) ( not ( = ?auto_610109 ?auto_610123 ) ) ( not ( = ?auto_610109 ?auto_610124 ) ) ( not ( = ?auto_610110 ?auto_610111 ) ) ( not ( = ?auto_610110 ?auto_610112 ) ) ( not ( = ?auto_610110 ?auto_610113 ) ) ( not ( = ?auto_610110 ?auto_610114 ) ) ( not ( = ?auto_610110 ?auto_610115 ) ) ( not ( = ?auto_610110 ?auto_610116 ) ) ( not ( = ?auto_610110 ?auto_610117 ) ) ( not ( = ?auto_610110 ?auto_610118 ) ) ( not ( = ?auto_610110 ?auto_610119 ) ) ( not ( = ?auto_610110 ?auto_610120 ) ) ( not ( = ?auto_610110 ?auto_610121 ) ) ( not ( = ?auto_610110 ?auto_610122 ) ) ( not ( = ?auto_610110 ?auto_610123 ) ) ( not ( = ?auto_610110 ?auto_610124 ) ) ( not ( = ?auto_610111 ?auto_610112 ) ) ( not ( = ?auto_610111 ?auto_610113 ) ) ( not ( = ?auto_610111 ?auto_610114 ) ) ( not ( = ?auto_610111 ?auto_610115 ) ) ( not ( = ?auto_610111 ?auto_610116 ) ) ( not ( = ?auto_610111 ?auto_610117 ) ) ( not ( = ?auto_610111 ?auto_610118 ) ) ( not ( = ?auto_610111 ?auto_610119 ) ) ( not ( = ?auto_610111 ?auto_610120 ) ) ( not ( = ?auto_610111 ?auto_610121 ) ) ( not ( = ?auto_610111 ?auto_610122 ) ) ( not ( = ?auto_610111 ?auto_610123 ) ) ( not ( = ?auto_610111 ?auto_610124 ) ) ( not ( = ?auto_610112 ?auto_610113 ) ) ( not ( = ?auto_610112 ?auto_610114 ) ) ( not ( = ?auto_610112 ?auto_610115 ) ) ( not ( = ?auto_610112 ?auto_610116 ) ) ( not ( = ?auto_610112 ?auto_610117 ) ) ( not ( = ?auto_610112 ?auto_610118 ) ) ( not ( = ?auto_610112 ?auto_610119 ) ) ( not ( = ?auto_610112 ?auto_610120 ) ) ( not ( = ?auto_610112 ?auto_610121 ) ) ( not ( = ?auto_610112 ?auto_610122 ) ) ( not ( = ?auto_610112 ?auto_610123 ) ) ( not ( = ?auto_610112 ?auto_610124 ) ) ( not ( = ?auto_610113 ?auto_610114 ) ) ( not ( = ?auto_610113 ?auto_610115 ) ) ( not ( = ?auto_610113 ?auto_610116 ) ) ( not ( = ?auto_610113 ?auto_610117 ) ) ( not ( = ?auto_610113 ?auto_610118 ) ) ( not ( = ?auto_610113 ?auto_610119 ) ) ( not ( = ?auto_610113 ?auto_610120 ) ) ( not ( = ?auto_610113 ?auto_610121 ) ) ( not ( = ?auto_610113 ?auto_610122 ) ) ( not ( = ?auto_610113 ?auto_610123 ) ) ( not ( = ?auto_610113 ?auto_610124 ) ) ( not ( = ?auto_610114 ?auto_610115 ) ) ( not ( = ?auto_610114 ?auto_610116 ) ) ( not ( = ?auto_610114 ?auto_610117 ) ) ( not ( = ?auto_610114 ?auto_610118 ) ) ( not ( = ?auto_610114 ?auto_610119 ) ) ( not ( = ?auto_610114 ?auto_610120 ) ) ( not ( = ?auto_610114 ?auto_610121 ) ) ( not ( = ?auto_610114 ?auto_610122 ) ) ( not ( = ?auto_610114 ?auto_610123 ) ) ( not ( = ?auto_610114 ?auto_610124 ) ) ( not ( = ?auto_610115 ?auto_610116 ) ) ( not ( = ?auto_610115 ?auto_610117 ) ) ( not ( = ?auto_610115 ?auto_610118 ) ) ( not ( = ?auto_610115 ?auto_610119 ) ) ( not ( = ?auto_610115 ?auto_610120 ) ) ( not ( = ?auto_610115 ?auto_610121 ) ) ( not ( = ?auto_610115 ?auto_610122 ) ) ( not ( = ?auto_610115 ?auto_610123 ) ) ( not ( = ?auto_610115 ?auto_610124 ) ) ( not ( = ?auto_610116 ?auto_610117 ) ) ( not ( = ?auto_610116 ?auto_610118 ) ) ( not ( = ?auto_610116 ?auto_610119 ) ) ( not ( = ?auto_610116 ?auto_610120 ) ) ( not ( = ?auto_610116 ?auto_610121 ) ) ( not ( = ?auto_610116 ?auto_610122 ) ) ( not ( = ?auto_610116 ?auto_610123 ) ) ( not ( = ?auto_610116 ?auto_610124 ) ) ( not ( = ?auto_610117 ?auto_610118 ) ) ( not ( = ?auto_610117 ?auto_610119 ) ) ( not ( = ?auto_610117 ?auto_610120 ) ) ( not ( = ?auto_610117 ?auto_610121 ) ) ( not ( = ?auto_610117 ?auto_610122 ) ) ( not ( = ?auto_610117 ?auto_610123 ) ) ( not ( = ?auto_610117 ?auto_610124 ) ) ( not ( = ?auto_610118 ?auto_610119 ) ) ( not ( = ?auto_610118 ?auto_610120 ) ) ( not ( = ?auto_610118 ?auto_610121 ) ) ( not ( = ?auto_610118 ?auto_610122 ) ) ( not ( = ?auto_610118 ?auto_610123 ) ) ( not ( = ?auto_610118 ?auto_610124 ) ) ( not ( = ?auto_610119 ?auto_610120 ) ) ( not ( = ?auto_610119 ?auto_610121 ) ) ( not ( = ?auto_610119 ?auto_610122 ) ) ( not ( = ?auto_610119 ?auto_610123 ) ) ( not ( = ?auto_610119 ?auto_610124 ) ) ( not ( = ?auto_610120 ?auto_610121 ) ) ( not ( = ?auto_610120 ?auto_610122 ) ) ( not ( = ?auto_610120 ?auto_610123 ) ) ( not ( = ?auto_610120 ?auto_610124 ) ) ( not ( = ?auto_610121 ?auto_610122 ) ) ( not ( = ?auto_610121 ?auto_610123 ) ) ( not ( = ?auto_610121 ?auto_610124 ) ) ( not ( = ?auto_610122 ?auto_610123 ) ) ( not ( = ?auto_610122 ?auto_610124 ) ) ( not ( = ?auto_610123 ?auto_610124 ) ) ( ON ?auto_610122 ?auto_610123 ) ( ON ?auto_610121 ?auto_610122 ) ( ON ?auto_610120 ?auto_610121 ) ( ON ?auto_610119 ?auto_610120 ) ( ON ?auto_610118 ?auto_610119 ) ( ON ?auto_610117 ?auto_610118 ) ( ON ?auto_610116 ?auto_610117 ) ( CLEAR ?auto_610114 ) ( ON ?auto_610115 ?auto_610116 ) ( CLEAR ?auto_610115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_610109 ?auto_610110 ?auto_610111 ?auto_610112 ?auto_610113 ?auto_610114 ?auto_610115 )
      ( MAKE-15PILE ?auto_610109 ?auto_610110 ?auto_610111 ?auto_610112 ?auto_610113 ?auto_610114 ?auto_610115 ?auto_610116 ?auto_610117 ?auto_610118 ?auto_610119 ?auto_610120 ?auto_610121 ?auto_610122 ?auto_610123 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_610171 - BLOCK
      ?auto_610172 - BLOCK
      ?auto_610173 - BLOCK
      ?auto_610174 - BLOCK
      ?auto_610175 - BLOCK
      ?auto_610176 - BLOCK
      ?auto_610177 - BLOCK
      ?auto_610178 - BLOCK
      ?auto_610179 - BLOCK
      ?auto_610180 - BLOCK
      ?auto_610181 - BLOCK
      ?auto_610182 - BLOCK
      ?auto_610183 - BLOCK
      ?auto_610184 - BLOCK
      ?auto_610185 - BLOCK
    )
    :vars
    (
      ?auto_610186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610185 ?auto_610186 ) ( ON-TABLE ?auto_610171 ) ( ON ?auto_610172 ?auto_610171 ) ( ON ?auto_610173 ?auto_610172 ) ( ON ?auto_610174 ?auto_610173 ) ( ON ?auto_610175 ?auto_610174 ) ( not ( = ?auto_610171 ?auto_610172 ) ) ( not ( = ?auto_610171 ?auto_610173 ) ) ( not ( = ?auto_610171 ?auto_610174 ) ) ( not ( = ?auto_610171 ?auto_610175 ) ) ( not ( = ?auto_610171 ?auto_610176 ) ) ( not ( = ?auto_610171 ?auto_610177 ) ) ( not ( = ?auto_610171 ?auto_610178 ) ) ( not ( = ?auto_610171 ?auto_610179 ) ) ( not ( = ?auto_610171 ?auto_610180 ) ) ( not ( = ?auto_610171 ?auto_610181 ) ) ( not ( = ?auto_610171 ?auto_610182 ) ) ( not ( = ?auto_610171 ?auto_610183 ) ) ( not ( = ?auto_610171 ?auto_610184 ) ) ( not ( = ?auto_610171 ?auto_610185 ) ) ( not ( = ?auto_610171 ?auto_610186 ) ) ( not ( = ?auto_610172 ?auto_610173 ) ) ( not ( = ?auto_610172 ?auto_610174 ) ) ( not ( = ?auto_610172 ?auto_610175 ) ) ( not ( = ?auto_610172 ?auto_610176 ) ) ( not ( = ?auto_610172 ?auto_610177 ) ) ( not ( = ?auto_610172 ?auto_610178 ) ) ( not ( = ?auto_610172 ?auto_610179 ) ) ( not ( = ?auto_610172 ?auto_610180 ) ) ( not ( = ?auto_610172 ?auto_610181 ) ) ( not ( = ?auto_610172 ?auto_610182 ) ) ( not ( = ?auto_610172 ?auto_610183 ) ) ( not ( = ?auto_610172 ?auto_610184 ) ) ( not ( = ?auto_610172 ?auto_610185 ) ) ( not ( = ?auto_610172 ?auto_610186 ) ) ( not ( = ?auto_610173 ?auto_610174 ) ) ( not ( = ?auto_610173 ?auto_610175 ) ) ( not ( = ?auto_610173 ?auto_610176 ) ) ( not ( = ?auto_610173 ?auto_610177 ) ) ( not ( = ?auto_610173 ?auto_610178 ) ) ( not ( = ?auto_610173 ?auto_610179 ) ) ( not ( = ?auto_610173 ?auto_610180 ) ) ( not ( = ?auto_610173 ?auto_610181 ) ) ( not ( = ?auto_610173 ?auto_610182 ) ) ( not ( = ?auto_610173 ?auto_610183 ) ) ( not ( = ?auto_610173 ?auto_610184 ) ) ( not ( = ?auto_610173 ?auto_610185 ) ) ( not ( = ?auto_610173 ?auto_610186 ) ) ( not ( = ?auto_610174 ?auto_610175 ) ) ( not ( = ?auto_610174 ?auto_610176 ) ) ( not ( = ?auto_610174 ?auto_610177 ) ) ( not ( = ?auto_610174 ?auto_610178 ) ) ( not ( = ?auto_610174 ?auto_610179 ) ) ( not ( = ?auto_610174 ?auto_610180 ) ) ( not ( = ?auto_610174 ?auto_610181 ) ) ( not ( = ?auto_610174 ?auto_610182 ) ) ( not ( = ?auto_610174 ?auto_610183 ) ) ( not ( = ?auto_610174 ?auto_610184 ) ) ( not ( = ?auto_610174 ?auto_610185 ) ) ( not ( = ?auto_610174 ?auto_610186 ) ) ( not ( = ?auto_610175 ?auto_610176 ) ) ( not ( = ?auto_610175 ?auto_610177 ) ) ( not ( = ?auto_610175 ?auto_610178 ) ) ( not ( = ?auto_610175 ?auto_610179 ) ) ( not ( = ?auto_610175 ?auto_610180 ) ) ( not ( = ?auto_610175 ?auto_610181 ) ) ( not ( = ?auto_610175 ?auto_610182 ) ) ( not ( = ?auto_610175 ?auto_610183 ) ) ( not ( = ?auto_610175 ?auto_610184 ) ) ( not ( = ?auto_610175 ?auto_610185 ) ) ( not ( = ?auto_610175 ?auto_610186 ) ) ( not ( = ?auto_610176 ?auto_610177 ) ) ( not ( = ?auto_610176 ?auto_610178 ) ) ( not ( = ?auto_610176 ?auto_610179 ) ) ( not ( = ?auto_610176 ?auto_610180 ) ) ( not ( = ?auto_610176 ?auto_610181 ) ) ( not ( = ?auto_610176 ?auto_610182 ) ) ( not ( = ?auto_610176 ?auto_610183 ) ) ( not ( = ?auto_610176 ?auto_610184 ) ) ( not ( = ?auto_610176 ?auto_610185 ) ) ( not ( = ?auto_610176 ?auto_610186 ) ) ( not ( = ?auto_610177 ?auto_610178 ) ) ( not ( = ?auto_610177 ?auto_610179 ) ) ( not ( = ?auto_610177 ?auto_610180 ) ) ( not ( = ?auto_610177 ?auto_610181 ) ) ( not ( = ?auto_610177 ?auto_610182 ) ) ( not ( = ?auto_610177 ?auto_610183 ) ) ( not ( = ?auto_610177 ?auto_610184 ) ) ( not ( = ?auto_610177 ?auto_610185 ) ) ( not ( = ?auto_610177 ?auto_610186 ) ) ( not ( = ?auto_610178 ?auto_610179 ) ) ( not ( = ?auto_610178 ?auto_610180 ) ) ( not ( = ?auto_610178 ?auto_610181 ) ) ( not ( = ?auto_610178 ?auto_610182 ) ) ( not ( = ?auto_610178 ?auto_610183 ) ) ( not ( = ?auto_610178 ?auto_610184 ) ) ( not ( = ?auto_610178 ?auto_610185 ) ) ( not ( = ?auto_610178 ?auto_610186 ) ) ( not ( = ?auto_610179 ?auto_610180 ) ) ( not ( = ?auto_610179 ?auto_610181 ) ) ( not ( = ?auto_610179 ?auto_610182 ) ) ( not ( = ?auto_610179 ?auto_610183 ) ) ( not ( = ?auto_610179 ?auto_610184 ) ) ( not ( = ?auto_610179 ?auto_610185 ) ) ( not ( = ?auto_610179 ?auto_610186 ) ) ( not ( = ?auto_610180 ?auto_610181 ) ) ( not ( = ?auto_610180 ?auto_610182 ) ) ( not ( = ?auto_610180 ?auto_610183 ) ) ( not ( = ?auto_610180 ?auto_610184 ) ) ( not ( = ?auto_610180 ?auto_610185 ) ) ( not ( = ?auto_610180 ?auto_610186 ) ) ( not ( = ?auto_610181 ?auto_610182 ) ) ( not ( = ?auto_610181 ?auto_610183 ) ) ( not ( = ?auto_610181 ?auto_610184 ) ) ( not ( = ?auto_610181 ?auto_610185 ) ) ( not ( = ?auto_610181 ?auto_610186 ) ) ( not ( = ?auto_610182 ?auto_610183 ) ) ( not ( = ?auto_610182 ?auto_610184 ) ) ( not ( = ?auto_610182 ?auto_610185 ) ) ( not ( = ?auto_610182 ?auto_610186 ) ) ( not ( = ?auto_610183 ?auto_610184 ) ) ( not ( = ?auto_610183 ?auto_610185 ) ) ( not ( = ?auto_610183 ?auto_610186 ) ) ( not ( = ?auto_610184 ?auto_610185 ) ) ( not ( = ?auto_610184 ?auto_610186 ) ) ( not ( = ?auto_610185 ?auto_610186 ) ) ( ON ?auto_610184 ?auto_610185 ) ( ON ?auto_610183 ?auto_610184 ) ( ON ?auto_610182 ?auto_610183 ) ( ON ?auto_610181 ?auto_610182 ) ( ON ?auto_610180 ?auto_610181 ) ( ON ?auto_610179 ?auto_610180 ) ( ON ?auto_610178 ?auto_610179 ) ( ON ?auto_610177 ?auto_610178 ) ( CLEAR ?auto_610175 ) ( ON ?auto_610176 ?auto_610177 ) ( CLEAR ?auto_610176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_610171 ?auto_610172 ?auto_610173 ?auto_610174 ?auto_610175 ?auto_610176 )
      ( MAKE-15PILE ?auto_610171 ?auto_610172 ?auto_610173 ?auto_610174 ?auto_610175 ?auto_610176 ?auto_610177 ?auto_610178 ?auto_610179 ?auto_610180 ?auto_610181 ?auto_610182 ?auto_610183 ?auto_610184 ?auto_610185 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_610233 - BLOCK
      ?auto_610234 - BLOCK
      ?auto_610235 - BLOCK
      ?auto_610236 - BLOCK
      ?auto_610237 - BLOCK
      ?auto_610238 - BLOCK
      ?auto_610239 - BLOCK
      ?auto_610240 - BLOCK
      ?auto_610241 - BLOCK
      ?auto_610242 - BLOCK
      ?auto_610243 - BLOCK
      ?auto_610244 - BLOCK
      ?auto_610245 - BLOCK
      ?auto_610246 - BLOCK
      ?auto_610247 - BLOCK
    )
    :vars
    (
      ?auto_610248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610247 ?auto_610248 ) ( ON-TABLE ?auto_610233 ) ( ON ?auto_610234 ?auto_610233 ) ( ON ?auto_610235 ?auto_610234 ) ( ON ?auto_610236 ?auto_610235 ) ( not ( = ?auto_610233 ?auto_610234 ) ) ( not ( = ?auto_610233 ?auto_610235 ) ) ( not ( = ?auto_610233 ?auto_610236 ) ) ( not ( = ?auto_610233 ?auto_610237 ) ) ( not ( = ?auto_610233 ?auto_610238 ) ) ( not ( = ?auto_610233 ?auto_610239 ) ) ( not ( = ?auto_610233 ?auto_610240 ) ) ( not ( = ?auto_610233 ?auto_610241 ) ) ( not ( = ?auto_610233 ?auto_610242 ) ) ( not ( = ?auto_610233 ?auto_610243 ) ) ( not ( = ?auto_610233 ?auto_610244 ) ) ( not ( = ?auto_610233 ?auto_610245 ) ) ( not ( = ?auto_610233 ?auto_610246 ) ) ( not ( = ?auto_610233 ?auto_610247 ) ) ( not ( = ?auto_610233 ?auto_610248 ) ) ( not ( = ?auto_610234 ?auto_610235 ) ) ( not ( = ?auto_610234 ?auto_610236 ) ) ( not ( = ?auto_610234 ?auto_610237 ) ) ( not ( = ?auto_610234 ?auto_610238 ) ) ( not ( = ?auto_610234 ?auto_610239 ) ) ( not ( = ?auto_610234 ?auto_610240 ) ) ( not ( = ?auto_610234 ?auto_610241 ) ) ( not ( = ?auto_610234 ?auto_610242 ) ) ( not ( = ?auto_610234 ?auto_610243 ) ) ( not ( = ?auto_610234 ?auto_610244 ) ) ( not ( = ?auto_610234 ?auto_610245 ) ) ( not ( = ?auto_610234 ?auto_610246 ) ) ( not ( = ?auto_610234 ?auto_610247 ) ) ( not ( = ?auto_610234 ?auto_610248 ) ) ( not ( = ?auto_610235 ?auto_610236 ) ) ( not ( = ?auto_610235 ?auto_610237 ) ) ( not ( = ?auto_610235 ?auto_610238 ) ) ( not ( = ?auto_610235 ?auto_610239 ) ) ( not ( = ?auto_610235 ?auto_610240 ) ) ( not ( = ?auto_610235 ?auto_610241 ) ) ( not ( = ?auto_610235 ?auto_610242 ) ) ( not ( = ?auto_610235 ?auto_610243 ) ) ( not ( = ?auto_610235 ?auto_610244 ) ) ( not ( = ?auto_610235 ?auto_610245 ) ) ( not ( = ?auto_610235 ?auto_610246 ) ) ( not ( = ?auto_610235 ?auto_610247 ) ) ( not ( = ?auto_610235 ?auto_610248 ) ) ( not ( = ?auto_610236 ?auto_610237 ) ) ( not ( = ?auto_610236 ?auto_610238 ) ) ( not ( = ?auto_610236 ?auto_610239 ) ) ( not ( = ?auto_610236 ?auto_610240 ) ) ( not ( = ?auto_610236 ?auto_610241 ) ) ( not ( = ?auto_610236 ?auto_610242 ) ) ( not ( = ?auto_610236 ?auto_610243 ) ) ( not ( = ?auto_610236 ?auto_610244 ) ) ( not ( = ?auto_610236 ?auto_610245 ) ) ( not ( = ?auto_610236 ?auto_610246 ) ) ( not ( = ?auto_610236 ?auto_610247 ) ) ( not ( = ?auto_610236 ?auto_610248 ) ) ( not ( = ?auto_610237 ?auto_610238 ) ) ( not ( = ?auto_610237 ?auto_610239 ) ) ( not ( = ?auto_610237 ?auto_610240 ) ) ( not ( = ?auto_610237 ?auto_610241 ) ) ( not ( = ?auto_610237 ?auto_610242 ) ) ( not ( = ?auto_610237 ?auto_610243 ) ) ( not ( = ?auto_610237 ?auto_610244 ) ) ( not ( = ?auto_610237 ?auto_610245 ) ) ( not ( = ?auto_610237 ?auto_610246 ) ) ( not ( = ?auto_610237 ?auto_610247 ) ) ( not ( = ?auto_610237 ?auto_610248 ) ) ( not ( = ?auto_610238 ?auto_610239 ) ) ( not ( = ?auto_610238 ?auto_610240 ) ) ( not ( = ?auto_610238 ?auto_610241 ) ) ( not ( = ?auto_610238 ?auto_610242 ) ) ( not ( = ?auto_610238 ?auto_610243 ) ) ( not ( = ?auto_610238 ?auto_610244 ) ) ( not ( = ?auto_610238 ?auto_610245 ) ) ( not ( = ?auto_610238 ?auto_610246 ) ) ( not ( = ?auto_610238 ?auto_610247 ) ) ( not ( = ?auto_610238 ?auto_610248 ) ) ( not ( = ?auto_610239 ?auto_610240 ) ) ( not ( = ?auto_610239 ?auto_610241 ) ) ( not ( = ?auto_610239 ?auto_610242 ) ) ( not ( = ?auto_610239 ?auto_610243 ) ) ( not ( = ?auto_610239 ?auto_610244 ) ) ( not ( = ?auto_610239 ?auto_610245 ) ) ( not ( = ?auto_610239 ?auto_610246 ) ) ( not ( = ?auto_610239 ?auto_610247 ) ) ( not ( = ?auto_610239 ?auto_610248 ) ) ( not ( = ?auto_610240 ?auto_610241 ) ) ( not ( = ?auto_610240 ?auto_610242 ) ) ( not ( = ?auto_610240 ?auto_610243 ) ) ( not ( = ?auto_610240 ?auto_610244 ) ) ( not ( = ?auto_610240 ?auto_610245 ) ) ( not ( = ?auto_610240 ?auto_610246 ) ) ( not ( = ?auto_610240 ?auto_610247 ) ) ( not ( = ?auto_610240 ?auto_610248 ) ) ( not ( = ?auto_610241 ?auto_610242 ) ) ( not ( = ?auto_610241 ?auto_610243 ) ) ( not ( = ?auto_610241 ?auto_610244 ) ) ( not ( = ?auto_610241 ?auto_610245 ) ) ( not ( = ?auto_610241 ?auto_610246 ) ) ( not ( = ?auto_610241 ?auto_610247 ) ) ( not ( = ?auto_610241 ?auto_610248 ) ) ( not ( = ?auto_610242 ?auto_610243 ) ) ( not ( = ?auto_610242 ?auto_610244 ) ) ( not ( = ?auto_610242 ?auto_610245 ) ) ( not ( = ?auto_610242 ?auto_610246 ) ) ( not ( = ?auto_610242 ?auto_610247 ) ) ( not ( = ?auto_610242 ?auto_610248 ) ) ( not ( = ?auto_610243 ?auto_610244 ) ) ( not ( = ?auto_610243 ?auto_610245 ) ) ( not ( = ?auto_610243 ?auto_610246 ) ) ( not ( = ?auto_610243 ?auto_610247 ) ) ( not ( = ?auto_610243 ?auto_610248 ) ) ( not ( = ?auto_610244 ?auto_610245 ) ) ( not ( = ?auto_610244 ?auto_610246 ) ) ( not ( = ?auto_610244 ?auto_610247 ) ) ( not ( = ?auto_610244 ?auto_610248 ) ) ( not ( = ?auto_610245 ?auto_610246 ) ) ( not ( = ?auto_610245 ?auto_610247 ) ) ( not ( = ?auto_610245 ?auto_610248 ) ) ( not ( = ?auto_610246 ?auto_610247 ) ) ( not ( = ?auto_610246 ?auto_610248 ) ) ( not ( = ?auto_610247 ?auto_610248 ) ) ( ON ?auto_610246 ?auto_610247 ) ( ON ?auto_610245 ?auto_610246 ) ( ON ?auto_610244 ?auto_610245 ) ( ON ?auto_610243 ?auto_610244 ) ( ON ?auto_610242 ?auto_610243 ) ( ON ?auto_610241 ?auto_610242 ) ( ON ?auto_610240 ?auto_610241 ) ( ON ?auto_610239 ?auto_610240 ) ( ON ?auto_610238 ?auto_610239 ) ( CLEAR ?auto_610236 ) ( ON ?auto_610237 ?auto_610238 ) ( CLEAR ?auto_610237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_610233 ?auto_610234 ?auto_610235 ?auto_610236 ?auto_610237 )
      ( MAKE-15PILE ?auto_610233 ?auto_610234 ?auto_610235 ?auto_610236 ?auto_610237 ?auto_610238 ?auto_610239 ?auto_610240 ?auto_610241 ?auto_610242 ?auto_610243 ?auto_610244 ?auto_610245 ?auto_610246 ?auto_610247 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_610295 - BLOCK
      ?auto_610296 - BLOCK
      ?auto_610297 - BLOCK
      ?auto_610298 - BLOCK
      ?auto_610299 - BLOCK
      ?auto_610300 - BLOCK
      ?auto_610301 - BLOCK
      ?auto_610302 - BLOCK
      ?auto_610303 - BLOCK
      ?auto_610304 - BLOCK
      ?auto_610305 - BLOCK
      ?auto_610306 - BLOCK
      ?auto_610307 - BLOCK
      ?auto_610308 - BLOCK
      ?auto_610309 - BLOCK
    )
    :vars
    (
      ?auto_610310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610309 ?auto_610310 ) ( ON-TABLE ?auto_610295 ) ( ON ?auto_610296 ?auto_610295 ) ( ON ?auto_610297 ?auto_610296 ) ( not ( = ?auto_610295 ?auto_610296 ) ) ( not ( = ?auto_610295 ?auto_610297 ) ) ( not ( = ?auto_610295 ?auto_610298 ) ) ( not ( = ?auto_610295 ?auto_610299 ) ) ( not ( = ?auto_610295 ?auto_610300 ) ) ( not ( = ?auto_610295 ?auto_610301 ) ) ( not ( = ?auto_610295 ?auto_610302 ) ) ( not ( = ?auto_610295 ?auto_610303 ) ) ( not ( = ?auto_610295 ?auto_610304 ) ) ( not ( = ?auto_610295 ?auto_610305 ) ) ( not ( = ?auto_610295 ?auto_610306 ) ) ( not ( = ?auto_610295 ?auto_610307 ) ) ( not ( = ?auto_610295 ?auto_610308 ) ) ( not ( = ?auto_610295 ?auto_610309 ) ) ( not ( = ?auto_610295 ?auto_610310 ) ) ( not ( = ?auto_610296 ?auto_610297 ) ) ( not ( = ?auto_610296 ?auto_610298 ) ) ( not ( = ?auto_610296 ?auto_610299 ) ) ( not ( = ?auto_610296 ?auto_610300 ) ) ( not ( = ?auto_610296 ?auto_610301 ) ) ( not ( = ?auto_610296 ?auto_610302 ) ) ( not ( = ?auto_610296 ?auto_610303 ) ) ( not ( = ?auto_610296 ?auto_610304 ) ) ( not ( = ?auto_610296 ?auto_610305 ) ) ( not ( = ?auto_610296 ?auto_610306 ) ) ( not ( = ?auto_610296 ?auto_610307 ) ) ( not ( = ?auto_610296 ?auto_610308 ) ) ( not ( = ?auto_610296 ?auto_610309 ) ) ( not ( = ?auto_610296 ?auto_610310 ) ) ( not ( = ?auto_610297 ?auto_610298 ) ) ( not ( = ?auto_610297 ?auto_610299 ) ) ( not ( = ?auto_610297 ?auto_610300 ) ) ( not ( = ?auto_610297 ?auto_610301 ) ) ( not ( = ?auto_610297 ?auto_610302 ) ) ( not ( = ?auto_610297 ?auto_610303 ) ) ( not ( = ?auto_610297 ?auto_610304 ) ) ( not ( = ?auto_610297 ?auto_610305 ) ) ( not ( = ?auto_610297 ?auto_610306 ) ) ( not ( = ?auto_610297 ?auto_610307 ) ) ( not ( = ?auto_610297 ?auto_610308 ) ) ( not ( = ?auto_610297 ?auto_610309 ) ) ( not ( = ?auto_610297 ?auto_610310 ) ) ( not ( = ?auto_610298 ?auto_610299 ) ) ( not ( = ?auto_610298 ?auto_610300 ) ) ( not ( = ?auto_610298 ?auto_610301 ) ) ( not ( = ?auto_610298 ?auto_610302 ) ) ( not ( = ?auto_610298 ?auto_610303 ) ) ( not ( = ?auto_610298 ?auto_610304 ) ) ( not ( = ?auto_610298 ?auto_610305 ) ) ( not ( = ?auto_610298 ?auto_610306 ) ) ( not ( = ?auto_610298 ?auto_610307 ) ) ( not ( = ?auto_610298 ?auto_610308 ) ) ( not ( = ?auto_610298 ?auto_610309 ) ) ( not ( = ?auto_610298 ?auto_610310 ) ) ( not ( = ?auto_610299 ?auto_610300 ) ) ( not ( = ?auto_610299 ?auto_610301 ) ) ( not ( = ?auto_610299 ?auto_610302 ) ) ( not ( = ?auto_610299 ?auto_610303 ) ) ( not ( = ?auto_610299 ?auto_610304 ) ) ( not ( = ?auto_610299 ?auto_610305 ) ) ( not ( = ?auto_610299 ?auto_610306 ) ) ( not ( = ?auto_610299 ?auto_610307 ) ) ( not ( = ?auto_610299 ?auto_610308 ) ) ( not ( = ?auto_610299 ?auto_610309 ) ) ( not ( = ?auto_610299 ?auto_610310 ) ) ( not ( = ?auto_610300 ?auto_610301 ) ) ( not ( = ?auto_610300 ?auto_610302 ) ) ( not ( = ?auto_610300 ?auto_610303 ) ) ( not ( = ?auto_610300 ?auto_610304 ) ) ( not ( = ?auto_610300 ?auto_610305 ) ) ( not ( = ?auto_610300 ?auto_610306 ) ) ( not ( = ?auto_610300 ?auto_610307 ) ) ( not ( = ?auto_610300 ?auto_610308 ) ) ( not ( = ?auto_610300 ?auto_610309 ) ) ( not ( = ?auto_610300 ?auto_610310 ) ) ( not ( = ?auto_610301 ?auto_610302 ) ) ( not ( = ?auto_610301 ?auto_610303 ) ) ( not ( = ?auto_610301 ?auto_610304 ) ) ( not ( = ?auto_610301 ?auto_610305 ) ) ( not ( = ?auto_610301 ?auto_610306 ) ) ( not ( = ?auto_610301 ?auto_610307 ) ) ( not ( = ?auto_610301 ?auto_610308 ) ) ( not ( = ?auto_610301 ?auto_610309 ) ) ( not ( = ?auto_610301 ?auto_610310 ) ) ( not ( = ?auto_610302 ?auto_610303 ) ) ( not ( = ?auto_610302 ?auto_610304 ) ) ( not ( = ?auto_610302 ?auto_610305 ) ) ( not ( = ?auto_610302 ?auto_610306 ) ) ( not ( = ?auto_610302 ?auto_610307 ) ) ( not ( = ?auto_610302 ?auto_610308 ) ) ( not ( = ?auto_610302 ?auto_610309 ) ) ( not ( = ?auto_610302 ?auto_610310 ) ) ( not ( = ?auto_610303 ?auto_610304 ) ) ( not ( = ?auto_610303 ?auto_610305 ) ) ( not ( = ?auto_610303 ?auto_610306 ) ) ( not ( = ?auto_610303 ?auto_610307 ) ) ( not ( = ?auto_610303 ?auto_610308 ) ) ( not ( = ?auto_610303 ?auto_610309 ) ) ( not ( = ?auto_610303 ?auto_610310 ) ) ( not ( = ?auto_610304 ?auto_610305 ) ) ( not ( = ?auto_610304 ?auto_610306 ) ) ( not ( = ?auto_610304 ?auto_610307 ) ) ( not ( = ?auto_610304 ?auto_610308 ) ) ( not ( = ?auto_610304 ?auto_610309 ) ) ( not ( = ?auto_610304 ?auto_610310 ) ) ( not ( = ?auto_610305 ?auto_610306 ) ) ( not ( = ?auto_610305 ?auto_610307 ) ) ( not ( = ?auto_610305 ?auto_610308 ) ) ( not ( = ?auto_610305 ?auto_610309 ) ) ( not ( = ?auto_610305 ?auto_610310 ) ) ( not ( = ?auto_610306 ?auto_610307 ) ) ( not ( = ?auto_610306 ?auto_610308 ) ) ( not ( = ?auto_610306 ?auto_610309 ) ) ( not ( = ?auto_610306 ?auto_610310 ) ) ( not ( = ?auto_610307 ?auto_610308 ) ) ( not ( = ?auto_610307 ?auto_610309 ) ) ( not ( = ?auto_610307 ?auto_610310 ) ) ( not ( = ?auto_610308 ?auto_610309 ) ) ( not ( = ?auto_610308 ?auto_610310 ) ) ( not ( = ?auto_610309 ?auto_610310 ) ) ( ON ?auto_610308 ?auto_610309 ) ( ON ?auto_610307 ?auto_610308 ) ( ON ?auto_610306 ?auto_610307 ) ( ON ?auto_610305 ?auto_610306 ) ( ON ?auto_610304 ?auto_610305 ) ( ON ?auto_610303 ?auto_610304 ) ( ON ?auto_610302 ?auto_610303 ) ( ON ?auto_610301 ?auto_610302 ) ( ON ?auto_610300 ?auto_610301 ) ( ON ?auto_610299 ?auto_610300 ) ( CLEAR ?auto_610297 ) ( ON ?auto_610298 ?auto_610299 ) ( CLEAR ?auto_610298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_610295 ?auto_610296 ?auto_610297 ?auto_610298 )
      ( MAKE-15PILE ?auto_610295 ?auto_610296 ?auto_610297 ?auto_610298 ?auto_610299 ?auto_610300 ?auto_610301 ?auto_610302 ?auto_610303 ?auto_610304 ?auto_610305 ?auto_610306 ?auto_610307 ?auto_610308 ?auto_610309 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_610357 - BLOCK
      ?auto_610358 - BLOCK
      ?auto_610359 - BLOCK
      ?auto_610360 - BLOCK
      ?auto_610361 - BLOCK
      ?auto_610362 - BLOCK
      ?auto_610363 - BLOCK
      ?auto_610364 - BLOCK
      ?auto_610365 - BLOCK
      ?auto_610366 - BLOCK
      ?auto_610367 - BLOCK
      ?auto_610368 - BLOCK
      ?auto_610369 - BLOCK
      ?auto_610370 - BLOCK
      ?auto_610371 - BLOCK
    )
    :vars
    (
      ?auto_610372 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610371 ?auto_610372 ) ( ON-TABLE ?auto_610357 ) ( ON ?auto_610358 ?auto_610357 ) ( not ( = ?auto_610357 ?auto_610358 ) ) ( not ( = ?auto_610357 ?auto_610359 ) ) ( not ( = ?auto_610357 ?auto_610360 ) ) ( not ( = ?auto_610357 ?auto_610361 ) ) ( not ( = ?auto_610357 ?auto_610362 ) ) ( not ( = ?auto_610357 ?auto_610363 ) ) ( not ( = ?auto_610357 ?auto_610364 ) ) ( not ( = ?auto_610357 ?auto_610365 ) ) ( not ( = ?auto_610357 ?auto_610366 ) ) ( not ( = ?auto_610357 ?auto_610367 ) ) ( not ( = ?auto_610357 ?auto_610368 ) ) ( not ( = ?auto_610357 ?auto_610369 ) ) ( not ( = ?auto_610357 ?auto_610370 ) ) ( not ( = ?auto_610357 ?auto_610371 ) ) ( not ( = ?auto_610357 ?auto_610372 ) ) ( not ( = ?auto_610358 ?auto_610359 ) ) ( not ( = ?auto_610358 ?auto_610360 ) ) ( not ( = ?auto_610358 ?auto_610361 ) ) ( not ( = ?auto_610358 ?auto_610362 ) ) ( not ( = ?auto_610358 ?auto_610363 ) ) ( not ( = ?auto_610358 ?auto_610364 ) ) ( not ( = ?auto_610358 ?auto_610365 ) ) ( not ( = ?auto_610358 ?auto_610366 ) ) ( not ( = ?auto_610358 ?auto_610367 ) ) ( not ( = ?auto_610358 ?auto_610368 ) ) ( not ( = ?auto_610358 ?auto_610369 ) ) ( not ( = ?auto_610358 ?auto_610370 ) ) ( not ( = ?auto_610358 ?auto_610371 ) ) ( not ( = ?auto_610358 ?auto_610372 ) ) ( not ( = ?auto_610359 ?auto_610360 ) ) ( not ( = ?auto_610359 ?auto_610361 ) ) ( not ( = ?auto_610359 ?auto_610362 ) ) ( not ( = ?auto_610359 ?auto_610363 ) ) ( not ( = ?auto_610359 ?auto_610364 ) ) ( not ( = ?auto_610359 ?auto_610365 ) ) ( not ( = ?auto_610359 ?auto_610366 ) ) ( not ( = ?auto_610359 ?auto_610367 ) ) ( not ( = ?auto_610359 ?auto_610368 ) ) ( not ( = ?auto_610359 ?auto_610369 ) ) ( not ( = ?auto_610359 ?auto_610370 ) ) ( not ( = ?auto_610359 ?auto_610371 ) ) ( not ( = ?auto_610359 ?auto_610372 ) ) ( not ( = ?auto_610360 ?auto_610361 ) ) ( not ( = ?auto_610360 ?auto_610362 ) ) ( not ( = ?auto_610360 ?auto_610363 ) ) ( not ( = ?auto_610360 ?auto_610364 ) ) ( not ( = ?auto_610360 ?auto_610365 ) ) ( not ( = ?auto_610360 ?auto_610366 ) ) ( not ( = ?auto_610360 ?auto_610367 ) ) ( not ( = ?auto_610360 ?auto_610368 ) ) ( not ( = ?auto_610360 ?auto_610369 ) ) ( not ( = ?auto_610360 ?auto_610370 ) ) ( not ( = ?auto_610360 ?auto_610371 ) ) ( not ( = ?auto_610360 ?auto_610372 ) ) ( not ( = ?auto_610361 ?auto_610362 ) ) ( not ( = ?auto_610361 ?auto_610363 ) ) ( not ( = ?auto_610361 ?auto_610364 ) ) ( not ( = ?auto_610361 ?auto_610365 ) ) ( not ( = ?auto_610361 ?auto_610366 ) ) ( not ( = ?auto_610361 ?auto_610367 ) ) ( not ( = ?auto_610361 ?auto_610368 ) ) ( not ( = ?auto_610361 ?auto_610369 ) ) ( not ( = ?auto_610361 ?auto_610370 ) ) ( not ( = ?auto_610361 ?auto_610371 ) ) ( not ( = ?auto_610361 ?auto_610372 ) ) ( not ( = ?auto_610362 ?auto_610363 ) ) ( not ( = ?auto_610362 ?auto_610364 ) ) ( not ( = ?auto_610362 ?auto_610365 ) ) ( not ( = ?auto_610362 ?auto_610366 ) ) ( not ( = ?auto_610362 ?auto_610367 ) ) ( not ( = ?auto_610362 ?auto_610368 ) ) ( not ( = ?auto_610362 ?auto_610369 ) ) ( not ( = ?auto_610362 ?auto_610370 ) ) ( not ( = ?auto_610362 ?auto_610371 ) ) ( not ( = ?auto_610362 ?auto_610372 ) ) ( not ( = ?auto_610363 ?auto_610364 ) ) ( not ( = ?auto_610363 ?auto_610365 ) ) ( not ( = ?auto_610363 ?auto_610366 ) ) ( not ( = ?auto_610363 ?auto_610367 ) ) ( not ( = ?auto_610363 ?auto_610368 ) ) ( not ( = ?auto_610363 ?auto_610369 ) ) ( not ( = ?auto_610363 ?auto_610370 ) ) ( not ( = ?auto_610363 ?auto_610371 ) ) ( not ( = ?auto_610363 ?auto_610372 ) ) ( not ( = ?auto_610364 ?auto_610365 ) ) ( not ( = ?auto_610364 ?auto_610366 ) ) ( not ( = ?auto_610364 ?auto_610367 ) ) ( not ( = ?auto_610364 ?auto_610368 ) ) ( not ( = ?auto_610364 ?auto_610369 ) ) ( not ( = ?auto_610364 ?auto_610370 ) ) ( not ( = ?auto_610364 ?auto_610371 ) ) ( not ( = ?auto_610364 ?auto_610372 ) ) ( not ( = ?auto_610365 ?auto_610366 ) ) ( not ( = ?auto_610365 ?auto_610367 ) ) ( not ( = ?auto_610365 ?auto_610368 ) ) ( not ( = ?auto_610365 ?auto_610369 ) ) ( not ( = ?auto_610365 ?auto_610370 ) ) ( not ( = ?auto_610365 ?auto_610371 ) ) ( not ( = ?auto_610365 ?auto_610372 ) ) ( not ( = ?auto_610366 ?auto_610367 ) ) ( not ( = ?auto_610366 ?auto_610368 ) ) ( not ( = ?auto_610366 ?auto_610369 ) ) ( not ( = ?auto_610366 ?auto_610370 ) ) ( not ( = ?auto_610366 ?auto_610371 ) ) ( not ( = ?auto_610366 ?auto_610372 ) ) ( not ( = ?auto_610367 ?auto_610368 ) ) ( not ( = ?auto_610367 ?auto_610369 ) ) ( not ( = ?auto_610367 ?auto_610370 ) ) ( not ( = ?auto_610367 ?auto_610371 ) ) ( not ( = ?auto_610367 ?auto_610372 ) ) ( not ( = ?auto_610368 ?auto_610369 ) ) ( not ( = ?auto_610368 ?auto_610370 ) ) ( not ( = ?auto_610368 ?auto_610371 ) ) ( not ( = ?auto_610368 ?auto_610372 ) ) ( not ( = ?auto_610369 ?auto_610370 ) ) ( not ( = ?auto_610369 ?auto_610371 ) ) ( not ( = ?auto_610369 ?auto_610372 ) ) ( not ( = ?auto_610370 ?auto_610371 ) ) ( not ( = ?auto_610370 ?auto_610372 ) ) ( not ( = ?auto_610371 ?auto_610372 ) ) ( ON ?auto_610370 ?auto_610371 ) ( ON ?auto_610369 ?auto_610370 ) ( ON ?auto_610368 ?auto_610369 ) ( ON ?auto_610367 ?auto_610368 ) ( ON ?auto_610366 ?auto_610367 ) ( ON ?auto_610365 ?auto_610366 ) ( ON ?auto_610364 ?auto_610365 ) ( ON ?auto_610363 ?auto_610364 ) ( ON ?auto_610362 ?auto_610363 ) ( ON ?auto_610361 ?auto_610362 ) ( ON ?auto_610360 ?auto_610361 ) ( CLEAR ?auto_610358 ) ( ON ?auto_610359 ?auto_610360 ) ( CLEAR ?auto_610359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_610357 ?auto_610358 ?auto_610359 )
      ( MAKE-15PILE ?auto_610357 ?auto_610358 ?auto_610359 ?auto_610360 ?auto_610361 ?auto_610362 ?auto_610363 ?auto_610364 ?auto_610365 ?auto_610366 ?auto_610367 ?auto_610368 ?auto_610369 ?auto_610370 ?auto_610371 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_610419 - BLOCK
      ?auto_610420 - BLOCK
      ?auto_610421 - BLOCK
      ?auto_610422 - BLOCK
      ?auto_610423 - BLOCK
      ?auto_610424 - BLOCK
      ?auto_610425 - BLOCK
      ?auto_610426 - BLOCK
      ?auto_610427 - BLOCK
      ?auto_610428 - BLOCK
      ?auto_610429 - BLOCK
      ?auto_610430 - BLOCK
      ?auto_610431 - BLOCK
      ?auto_610432 - BLOCK
      ?auto_610433 - BLOCK
    )
    :vars
    (
      ?auto_610434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610433 ?auto_610434 ) ( ON-TABLE ?auto_610419 ) ( not ( = ?auto_610419 ?auto_610420 ) ) ( not ( = ?auto_610419 ?auto_610421 ) ) ( not ( = ?auto_610419 ?auto_610422 ) ) ( not ( = ?auto_610419 ?auto_610423 ) ) ( not ( = ?auto_610419 ?auto_610424 ) ) ( not ( = ?auto_610419 ?auto_610425 ) ) ( not ( = ?auto_610419 ?auto_610426 ) ) ( not ( = ?auto_610419 ?auto_610427 ) ) ( not ( = ?auto_610419 ?auto_610428 ) ) ( not ( = ?auto_610419 ?auto_610429 ) ) ( not ( = ?auto_610419 ?auto_610430 ) ) ( not ( = ?auto_610419 ?auto_610431 ) ) ( not ( = ?auto_610419 ?auto_610432 ) ) ( not ( = ?auto_610419 ?auto_610433 ) ) ( not ( = ?auto_610419 ?auto_610434 ) ) ( not ( = ?auto_610420 ?auto_610421 ) ) ( not ( = ?auto_610420 ?auto_610422 ) ) ( not ( = ?auto_610420 ?auto_610423 ) ) ( not ( = ?auto_610420 ?auto_610424 ) ) ( not ( = ?auto_610420 ?auto_610425 ) ) ( not ( = ?auto_610420 ?auto_610426 ) ) ( not ( = ?auto_610420 ?auto_610427 ) ) ( not ( = ?auto_610420 ?auto_610428 ) ) ( not ( = ?auto_610420 ?auto_610429 ) ) ( not ( = ?auto_610420 ?auto_610430 ) ) ( not ( = ?auto_610420 ?auto_610431 ) ) ( not ( = ?auto_610420 ?auto_610432 ) ) ( not ( = ?auto_610420 ?auto_610433 ) ) ( not ( = ?auto_610420 ?auto_610434 ) ) ( not ( = ?auto_610421 ?auto_610422 ) ) ( not ( = ?auto_610421 ?auto_610423 ) ) ( not ( = ?auto_610421 ?auto_610424 ) ) ( not ( = ?auto_610421 ?auto_610425 ) ) ( not ( = ?auto_610421 ?auto_610426 ) ) ( not ( = ?auto_610421 ?auto_610427 ) ) ( not ( = ?auto_610421 ?auto_610428 ) ) ( not ( = ?auto_610421 ?auto_610429 ) ) ( not ( = ?auto_610421 ?auto_610430 ) ) ( not ( = ?auto_610421 ?auto_610431 ) ) ( not ( = ?auto_610421 ?auto_610432 ) ) ( not ( = ?auto_610421 ?auto_610433 ) ) ( not ( = ?auto_610421 ?auto_610434 ) ) ( not ( = ?auto_610422 ?auto_610423 ) ) ( not ( = ?auto_610422 ?auto_610424 ) ) ( not ( = ?auto_610422 ?auto_610425 ) ) ( not ( = ?auto_610422 ?auto_610426 ) ) ( not ( = ?auto_610422 ?auto_610427 ) ) ( not ( = ?auto_610422 ?auto_610428 ) ) ( not ( = ?auto_610422 ?auto_610429 ) ) ( not ( = ?auto_610422 ?auto_610430 ) ) ( not ( = ?auto_610422 ?auto_610431 ) ) ( not ( = ?auto_610422 ?auto_610432 ) ) ( not ( = ?auto_610422 ?auto_610433 ) ) ( not ( = ?auto_610422 ?auto_610434 ) ) ( not ( = ?auto_610423 ?auto_610424 ) ) ( not ( = ?auto_610423 ?auto_610425 ) ) ( not ( = ?auto_610423 ?auto_610426 ) ) ( not ( = ?auto_610423 ?auto_610427 ) ) ( not ( = ?auto_610423 ?auto_610428 ) ) ( not ( = ?auto_610423 ?auto_610429 ) ) ( not ( = ?auto_610423 ?auto_610430 ) ) ( not ( = ?auto_610423 ?auto_610431 ) ) ( not ( = ?auto_610423 ?auto_610432 ) ) ( not ( = ?auto_610423 ?auto_610433 ) ) ( not ( = ?auto_610423 ?auto_610434 ) ) ( not ( = ?auto_610424 ?auto_610425 ) ) ( not ( = ?auto_610424 ?auto_610426 ) ) ( not ( = ?auto_610424 ?auto_610427 ) ) ( not ( = ?auto_610424 ?auto_610428 ) ) ( not ( = ?auto_610424 ?auto_610429 ) ) ( not ( = ?auto_610424 ?auto_610430 ) ) ( not ( = ?auto_610424 ?auto_610431 ) ) ( not ( = ?auto_610424 ?auto_610432 ) ) ( not ( = ?auto_610424 ?auto_610433 ) ) ( not ( = ?auto_610424 ?auto_610434 ) ) ( not ( = ?auto_610425 ?auto_610426 ) ) ( not ( = ?auto_610425 ?auto_610427 ) ) ( not ( = ?auto_610425 ?auto_610428 ) ) ( not ( = ?auto_610425 ?auto_610429 ) ) ( not ( = ?auto_610425 ?auto_610430 ) ) ( not ( = ?auto_610425 ?auto_610431 ) ) ( not ( = ?auto_610425 ?auto_610432 ) ) ( not ( = ?auto_610425 ?auto_610433 ) ) ( not ( = ?auto_610425 ?auto_610434 ) ) ( not ( = ?auto_610426 ?auto_610427 ) ) ( not ( = ?auto_610426 ?auto_610428 ) ) ( not ( = ?auto_610426 ?auto_610429 ) ) ( not ( = ?auto_610426 ?auto_610430 ) ) ( not ( = ?auto_610426 ?auto_610431 ) ) ( not ( = ?auto_610426 ?auto_610432 ) ) ( not ( = ?auto_610426 ?auto_610433 ) ) ( not ( = ?auto_610426 ?auto_610434 ) ) ( not ( = ?auto_610427 ?auto_610428 ) ) ( not ( = ?auto_610427 ?auto_610429 ) ) ( not ( = ?auto_610427 ?auto_610430 ) ) ( not ( = ?auto_610427 ?auto_610431 ) ) ( not ( = ?auto_610427 ?auto_610432 ) ) ( not ( = ?auto_610427 ?auto_610433 ) ) ( not ( = ?auto_610427 ?auto_610434 ) ) ( not ( = ?auto_610428 ?auto_610429 ) ) ( not ( = ?auto_610428 ?auto_610430 ) ) ( not ( = ?auto_610428 ?auto_610431 ) ) ( not ( = ?auto_610428 ?auto_610432 ) ) ( not ( = ?auto_610428 ?auto_610433 ) ) ( not ( = ?auto_610428 ?auto_610434 ) ) ( not ( = ?auto_610429 ?auto_610430 ) ) ( not ( = ?auto_610429 ?auto_610431 ) ) ( not ( = ?auto_610429 ?auto_610432 ) ) ( not ( = ?auto_610429 ?auto_610433 ) ) ( not ( = ?auto_610429 ?auto_610434 ) ) ( not ( = ?auto_610430 ?auto_610431 ) ) ( not ( = ?auto_610430 ?auto_610432 ) ) ( not ( = ?auto_610430 ?auto_610433 ) ) ( not ( = ?auto_610430 ?auto_610434 ) ) ( not ( = ?auto_610431 ?auto_610432 ) ) ( not ( = ?auto_610431 ?auto_610433 ) ) ( not ( = ?auto_610431 ?auto_610434 ) ) ( not ( = ?auto_610432 ?auto_610433 ) ) ( not ( = ?auto_610432 ?auto_610434 ) ) ( not ( = ?auto_610433 ?auto_610434 ) ) ( ON ?auto_610432 ?auto_610433 ) ( ON ?auto_610431 ?auto_610432 ) ( ON ?auto_610430 ?auto_610431 ) ( ON ?auto_610429 ?auto_610430 ) ( ON ?auto_610428 ?auto_610429 ) ( ON ?auto_610427 ?auto_610428 ) ( ON ?auto_610426 ?auto_610427 ) ( ON ?auto_610425 ?auto_610426 ) ( ON ?auto_610424 ?auto_610425 ) ( ON ?auto_610423 ?auto_610424 ) ( ON ?auto_610422 ?auto_610423 ) ( ON ?auto_610421 ?auto_610422 ) ( CLEAR ?auto_610419 ) ( ON ?auto_610420 ?auto_610421 ) ( CLEAR ?auto_610420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_610419 ?auto_610420 )
      ( MAKE-15PILE ?auto_610419 ?auto_610420 ?auto_610421 ?auto_610422 ?auto_610423 ?auto_610424 ?auto_610425 ?auto_610426 ?auto_610427 ?auto_610428 ?auto_610429 ?auto_610430 ?auto_610431 ?auto_610432 ?auto_610433 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_610481 - BLOCK
      ?auto_610482 - BLOCK
      ?auto_610483 - BLOCK
      ?auto_610484 - BLOCK
      ?auto_610485 - BLOCK
      ?auto_610486 - BLOCK
      ?auto_610487 - BLOCK
      ?auto_610488 - BLOCK
      ?auto_610489 - BLOCK
      ?auto_610490 - BLOCK
      ?auto_610491 - BLOCK
      ?auto_610492 - BLOCK
      ?auto_610493 - BLOCK
      ?auto_610494 - BLOCK
      ?auto_610495 - BLOCK
    )
    :vars
    (
      ?auto_610496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610495 ?auto_610496 ) ( not ( = ?auto_610481 ?auto_610482 ) ) ( not ( = ?auto_610481 ?auto_610483 ) ) ( not ( = ?auto_610481 ?auto_610484 ) ) ( not ( = ?auto_610481 ?auto_610485 ) ) ( not ( = ?auto_610481 ?auto_610486 ) ) ( not ( = ?auto_610481 ?auto_610487 ) ) ( not ( = ?auto_610481 ?auto_610488 ) ) ( not ( = ?auto_610481 ?auto_610489 ) ) ( not ( = ?auto_610481 ?auto_610490 ) ) ( not ( = ?auto_610481 ?auto_610491 ) ) ( not ( = ?auto_610481 ?auto_610492 ) ) ( not ( = ?auto_610481 ?auto_610493 ) ) ( not ( = ?auto_610481 ?auto_610494 ) ) ( not ( = ?auto_610481 ?auto_610495 ) ) ( not ( = ?auto_610481 ?auto_610496 ) ) ( not ( = ?auto_610482 ?auto_610483 ) ) ( not ( = ?auto_610482 ?auto_610484 ) ) ( not ( = ?auto_610482 ?auto_610485 ) ) ( not ( = ?auto_610482 ?auto_610486 ) ) ( not ( = ?auto_610482 ?auto_610487 ) ) ( not ( = ?auto_610482 ?auto_610488 ) ) ( not ( = ?auto_610482 ?auto_610489 ) ) ( not ( = ?auto_610482 ?auto_610490 ) ) ( not ( = ?auto_610482 ?auto_610491 ) ) ( not ( = ?auto_610482 ?auto_610492 ) ) ( not ( = ?auto_610482 ?auto_610493 ) ) ( not ( = ?auto_610482 ?auto_610494 ) ) ( not ( = ?auto_610482 ?auto_610495 ) ) ( not ( = ?auto_610482 ?auto_610496 ) ) ( not ( = ?auto_610483 ?auto_610484 ) ) ( not ( = ?auto_610483 ?auto_610485 ) ) ( not ( = ?auto_610483 ?auto_610486 ) ) ( not ( = ?auto_610483 ?auto_610487 ) ) ( not ( = ?auto_610483 ?auto_610488 ) ) ( not ( = ?auto_610483 ?auto_610489 ) ) ( not ( = ?auto_610483 ?auto_610490 ) ) ( not ( = ?auto_610483 ?auto_610491 ) ) ( not ( = ?auto_610483 ?auto_610492 ) ) ( not ( = ?auto_610483 ?auto_610493 ) ) ( not ( = ?auto_610483 ?auto_610494 ) ) ( not ( = ?auto_610483 ?auto_610495 ) ) ( not ( = ?auto_610483 ?auto_610496 ) ) ( not ( = ?auto_610484 ?auto_610485 ) ) ( not ( = ?auto_610484 ?auto_610486 ) ) ( not ( = ?auto_610484 ?auto_610487 ) ) ( not ( = ?auto_610484 ?auto_610488 ) ) ( not ( = ?auto_610484 ?auto_610489 ) ) ( not ( = ?auto_610484 ?auto_610490 ) ) ( not ( = ?auto_610484 ?auto_610491 ) ) ( not ( = ?auto_610484 ?auto_610492 ) ) ( not ( = ?auto_610484 ?auto_610493 ) ) ( not ( = ?auto_610484 ?auto_610494 ) ) ( not ( = ?auto_610484 ?auto_610495 ) ) ( not ( = ?auto_610484 ?auto_610496 ) ) ( not ( = ?auto_610485 ?auto_610486 ) ) ( not ( = ?auto_610485 ?auto_610487 ) ) ( not ( = ?auto_610485 ?auto_610488 ) ) ( not ( = ?auto_610485 ?auto_610489 ) ) ( not ( = ?auto_610485 ?auto_610490 ) ) ( not ( = ?auto_610485 ?auto_610491 ) ) ( not ( = ?auto_610485 ?auto_610492 ) ) ( not ( = ?auto_610485 ?auto_610493 ) ) ( not ( = ?auto_610485 ?auto_610494 ) ) ( not ( = ?auto_610485 ?auto_610495 ) ) ( not ( = ?auto_610485 ?auto_610496 ) ) ( not ( = ?auto_610486 ?auto_610487 ) ) ( not ( = ?auto_610486 ?auto_610488 ) ) ( not ( = ?auto_610486 ?auto_610489 ) ) ( not ( = ?auto_610486 ?auto_610490 ) ) ( not ( = ?auto_610486 ?auto_610491 ) ) ( not ( = ?auto_610486 ?auto_610492 ) ) ( not ( = ?auto_610486 ?auto_610493 ) ) ( not ( = ?auto_610486 ?auto_610494 ) ) ( not ( = ?auto_610486 ?auto_610495 ) ) ( not ( = ?auto_610486 ?auto_610496 ) ) ( not ( = ?auto_610487 ?auto_610488 ) ) ( not ( = ?auto_610487 ?auto_610489 ) ) ( not ( = ?auto_610487 ?auto_610490 ) ) ( not ( = ?auto_610487 ?auto_610491 ) ) ( not ( = ?auto_610487 ?auto_610492 ) ) ( not ( = ?auto_610487 ?auto_610493 ) ) ( not ( = ?auto_610487 ?auto_610494 ) ) ( not ( = ?auto_610487 ?auto_610495 ) ) ( not ( = ?auto_610487 ?auto_610496 ) ) ( not ( = ?auto_610488 ?auto_610489 ) ) ( not ( = ?auto_610488 ?auto_610490 ) ) ( not ( = ?auto_610488 ?auto_610491 ) ) ( not ( = ?auto_610488 ?auto_610492 ) ) ( not ( = ?auto_610488 ?auto_610493 ) ) ( not ( = ?auto_610488 ?auto_610494 ) ) ( not ( = ?auto_610488 ?auto_610495 ) ) ( not ( = ?auto_610488 ?auto_610496 ) ) ( not ( = ?auto_610489 ?auto_610490 ) ) ( not ( = ?auto_610489 ?auto_610491 ) ) ( not ( = ?auto_610489 ?auto_610492 ) ) ( not ( = ?auto_610489 ?auto_610493 ) ) ( not ( = ?auto_610489 ?auto_610494 ) ) ( not ( = ?auto_610489 ?auto_610495 ) ) ( not ( = ?auto_610489 ?auto_610496 ) ) ( not ( = ?auto_610490 ?auto_610491 ) ) ( not ( = ?auto_610490 ?auto_610492 ) ) ( not ( = ?auto_610490 ?auto_610493 ) ) ( not ( = ?auto_610490 ?auto_610494 ) ) ( not ( = ?auto_610490 ?auto_610495 ) ) ( not ( = ?auto_610490 ?auto_610496 ) ) ( not ( = ?auto_610491 ?auto_610492 ) ) ( not ( = ?auto_610491 ?auto_610493 ) ) ( not ( = ?auto_610491 ?auto_610494 ) ) ( not ( = ?auto_610491 ?auto_610495 ) ) ( not ( = ?auto_610491 ?auto_610496 ) ) ( not ( = ?auto_610492 ?auto_610493 ) ) ( not ( = ?auto_610492 ?auto_610494 ) ) ( not ( = ?auto_610492 ?auto_610495 ) ) ( not ( = ?auto_610492 ?auto_610496 ) ) ( not ( = ?auto_610493 ?auto_610494 ) ) ( not ( = ?auto_610493 ?auto_610495 ) ) ( not ( = ?auto_610493 ?auto_610496 ) ) ( not ( = ?auto_610494 ?auto_610495 ) ) ( not ( = ?auto_610494 ?auto_610496 ) ) ( not ( = ?auto_610495 ?auto_610496 ) ) ( ON ?auto_610494 ?auto_610495 ) ( ON ?auto_610493 ?auto_610494 ) ( ON ?auto_610492 ?auto_610493 ) ( ON ?auto_610491 ?auto_610492 ) ( ON ?auto_610490 ?auto_610491 ) ( ON ?auto_610489 ?auto_610490 ) ( ON ?auto_610488 ?auto_610489 ) ( ON ?auto_610487 ?auto_610488 ) ( ON ?auto_610486 ?auto_610487 ) ( ON ?auto_610485 ?auto_610486 ) ( ON ?auto_610484 ?auto_610485 ) ( ON ?auto_610483 ?auto_610484 ) ( ON ?auto_610482 ?auto_610483 ) ( ON ?auto_610481 ?auto_610482 ) ( CLEAR ?auto_610481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_610481 )
      ( MAKE-15PILE ?auto_610481 ?auto_610482 ?auto_610483 ?auto_610484 ?auto_610485 ?auto_610486 ?auto_610487 ?auto_610488 ?auto_610489 ?auto_610490 ?auto_610491 ?auto_610492 ?auto_610493 ?auto_610494 ?auto_610495 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_610544 - BLOCK
      ?auto_610545 - BLOCK
      ?auto_610546 - BLOCK
      ?auto_610547 - BLOCK
      ?auto_610548 - BLOCK
      ?auto_610549 - BLOCK
      ?auto_610550 - BLOCK
      ?auto_610551 - BLOCK
      ?auto_610552 - BLOCK
      ?auto_610553 - BLOCK
      ?auto_610554 - BLOCK
      ?auto_610555 - BLOCK
      ?auto_610556 - BLOCK
      ?auto_610557 - BLOCK
      ?auto_610558 - BLOCK
      ?auto_610559 - BLOCK
    )
    :vars
    (
      ?auto_610560 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_610558 ) ( ON ?auto_610559 ?auto_610560 ) ( CLEAR ?auto_610559 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_610544 ) ( ON ?auto_610545 ?auto_610544 ) ( ON ?auto_610546 ?auto_610545 ) ( ON ?auto_610547 ?auto_610546 ) ( ON ?auto_610548 ?auto_610547 ) ( ON ?auto_610549 ?auto_610548 ) ( ON ?auto_610550 ?auto_610549 ) ( ON ?auto_610551 ?auto_610550 ) ( ON ?auto_610552 ?auto_610551 ) ( ON ?auto_610553 ?auto_610552 ) ( ON ?auto_610554 ?auto_610553 ) ( ON ?auto_610555 ?auto_610554 ) ( ON ?auto_610556 ?auto_610555 ) ( ON ?auto_610557 ?auto_610556 ) ( ON ?auto_610558 ?auto_610557 ) ( not ( = ?auto_610544 ?auto_610545 ) ) ( not ( = ?auto_610544 ?auto_610546 ) ) ( not ( = ?auto_610544 ?auto_610547 ) ) ( not ( = ?auto_610544 ?auto_610548 ) ) ( not ( = ?auto_610544 ?auto_610549 ) ) ( not ( = ?auto_610544 ?auto_610550 ) ) ( not ( = ?auto_610544 ?auto_610551 ) ) ( not ( = ?auto_610544 ?auto_610552 ) ) ( not ( = ?auto_610544 ?auto_610553 ) ) ( not ( = ?auto_610544 ?auto_610554 ) ) ( not ( = ?auto_610544 ?auto_610555 ) ) ( not ( = ?auto_610544 ?auto_610556 ) ) ( not ( = ?auto_610544 ?auto_610557 ) ) ( not ( = ?auto_610544 ?auto_610558 ) ) ( not ( = ?auto_610544 ?auto_610559 ) ) ( not ( = ?auto_610544 ?auto_610560 ) ) ( not ( = ?auto_610545 ?auto_610546 ) ) ( not ( = ?auto_610545 ?auto_610547 ) ) ( not ( = ?auto_610545 ?auto_610548 ) ) ( not ( = ?auto_610545 ?auto_610549 ) ) ( not ( = ?auto_610545 ?auto_610550 ) ) ( not ( = ?auto_610545 ?auto_610551 ) ) ( not ( = ?auto_610545 ?auto_610552 ) ) ( not ( = ?auto_610545 ?auto_610553 ) ) ( not ( = ?auto_610545 ?auto_610554 ) ) ( not ( = ?auto_610545 ?auto_610555 ) ) ( not ( = ?auto_610545 ?auto_610556 ) ) ( not ( = ?auto_610545 ?auto_610557 ) ) ( not ( = ?auto_610545 ?auto_610558 ) ) ( not ( = ?auto_610545 ?auto_610559 ) ) ( not ( = ?auto_610545 ?auto_610560 ) ) ( not ( = ?auto_610546 ?auto_610547 ) ) ( not ( = ?auto_610546 ?auto_610548 ) ) ( not ( = ?auto_610546 ?auto_610549 ) ) ( not ( = ?auto_610546 ?auto_610550 ) ) ( not ( = ?auto_610546 ?auto_610551 ) ) ( not ( = ?auto_610546 ?auto_610552 ) ) ( not ( = ?auto_610546 ?auto_610553 ) ) ( not ( = ?auto_610546 ?auto_610554 ) ) ( not ( = ?auto_610546 ?auto_610555 ) ) ( not ( = ?auto_610546 ?auto_610556 ) ) ( not ( = ?auto_610546 ?auto_610557 ) ) ( not ( = ?auto_610546 ?auto_610558 ) ) ( not ( = ?auto_610546 ?auto_610559 ) ) ( not ( = ?auto_610546 ?auto_610560 ) ) ( not ( = ?auto_610547 ?auto_610548 ) ) ( not ( = ?auto_610547 ?auto_610549 ) ) ( not ( = ?auto_610547 ?auto_610550 ) ) ( not ( = ?auto_610547 ?auto_610551 ) ) ( not ( = ?auto_610547 ?auto_610552 ) ) ( not ( = ?auto_610547 ?auto_610553 ) ) ( not ( = ?auto_610547 ?auto_610554 ) ) ( not ( = ?auto_610547 ?auto_610555 ) ) ( not ( = ?auto_610547 ?auto_610556 ) ) ( not ( = ?auto_610547 ?auto_610557 ) ) ( not ( = ?auto_610547 ?auto_610558 ) ) ( not ( = ?auto_610547 ?auto_610559 ) ) ( not ( = ?auto_610547 ?auto_610560 ) ) ( not ( = ?auto_610548 ?auto_610549 ) ) ( not ( = ?auto_610548 ?auto_610550 ) ) ( not ( = ?auto_610548 ?auto_610551 ) ) ( not ( = ?auto_610548 ?auto_610552 ) ) ( not ( = ?auto_610548 ?auto_610553 ) ) ( not ( = ?auto_610548 ?auto_610554 ) ) ( not ( = ?auto_610548 ?auto_610555 ) ) ( not ( = ?auto_610548 ?auto_610556 ) ) ( not ( = ?auto_610548 ?auto_610557 ) ) ( not ( = ?auto_610548 ?auto_610558 ) ) ( not ( = ?auto_610548 ?auto_610559 ) ) ( not ( = ?auto_610548 ?auto_610560 ) ) ( not ( = ?auto_610549 ?auto_610550 ) ) ( not ( = ?auto_610549 ?auto_610551 ) ) ( not ( = ?auto_610549 ?auto_610552 ) ) ( not ( = ?auto_610549 ?auto_610553 ) ) ( not ( = ?auto_610549 ?auto_610554 ) ) ( not ( = ?auto_610549 ?auto_610555 ) ) ( not ( = ?auto_610549 ?auto_610556 ) ) ( not ( = ?auto_610549 ?auto_610557 ) ) ( not ( = ?auto_610549 ?auto_610558 ) ) ( not ( = ?auto_610549 ?auto_610559 ) ) ( not ( = ?auto_610549 ?auto_610560 ) ) ( not ( = ?auto_610550 ?auto_610551 ) ) ( not ( = ?auto_610550 ?auto_610552 ) ) ( not ( = ?auto_610550 ?auto_610553 ) ) ( not ( = ?auto_610550 ?auto_610554 ) ) ( not ( = ?auto_610550 ?auto_610555 ) ) ( not ( = ?auto_610550 ?auto_610556 ) ) ( not ( = ?auto_610550 ?auto_610557 ) ) ( not ( = ?auto_610550 ?auto_610558 ) ) ( not ( = ?auto_610550 ?auto_610559 ) ) ( not ( = ?auto_610550 ?auto_610560 ) ) ( not ( = ?auto_610551 ?auto_610552 ) ) ( not ( = ?auto_610551 ?auto_610553 ) ) ( not ( = ?auto_610551 ?auto_610554 ) ) ( not ( = ?auto_610551 ?auto_610555 ) ) ( not ( = ?auto_610551 ?auto_610556 ) ) ( not ( = ?auto_610551 ?auto_610557 ) ) ( not ( = ?auto_610551 ?auto_610558 ) ) ( not ( = ?auto_610551 ?auto_610559 ) ) ( not ( = ?auto_610551 ?auto_610560 ) ) ( not ( = ?auto_610552 ?auto_610553 ) ) ( not ( = ?auto_610552 ?auto_610554 ) ) ( not ( = ?auto_610552 ?auto_610555 ) ) ( not ( = ?auto_610552 ?auto_610556 ) ) ( not ( = ?auto_610552 ?auto_610557 ) ) ( not ( = ?auto_610552 ?auto_610558 ) ) ( not ( = ?auto_610552 ?auto_610559 ) ) ( not ( = ?auto_610552 ?auto_610560 ) ) ( not ( = ?auto_610553 ?auto_610554 ) ) ( not ( = ?auto_610553 ?auto_610555 ) ) ( not ( = ?auto_610553 ?auto_610556 ) ) ( not ( = ?auto_610553 ?auto_610557 ) ) ( not ( = ?auto_610553 ?auto_610558 ) ) ( not ( = ?auto_610553 ?auto_610559 ) ) ( not ( = ?auto_610553 ?auto_610560 ) ) ( not ( = ?auto_610554 ?auto_610555 ) ) ( not ( = ?auto_610554 ?auto_610556 ) ) ( not ( = ?auto_610554 ?auto_610557 ) ) ( not ( = ?auto_610554 ?auto_610558 ) ) ( not ( = ?auto_610554 ?auto_610559 ) ) ( not ( = ?auto_610554 ?auto_610560 ) ) ( not ( = ?auto_610555 ?auto_610556 ) ) ( not ( = ?auto_610555 ?auto_610557 ) ) ( not ( = ?auto_610555 ?auto_610558 ) ) ( not ( = ?auto_610555 ?auto_610559 ) ) ( not ( = ?auto_610555 ?auto_610560 ) ) ( not ( = ?auto_610556 ?auto_610557 ) ) ( not ( = ?auto_610556 ?auto_610558 ) ) ( not ( = ?auto_610556 ?auto_610559 ) ) ( not ( = ?auto_610556 ?auto_610560 ) ) ( not ( = ?auto_610557 ?auto_610558 ) ) ( not ( = ?auto_610557 ?auto_610559 ) ) ( not ( = ?auto_610557 ?auto_610560 ) ) ( not ( = ?auto_610558 ?auto_610559 ) ) ( not ( = ?auto_610558 ?auto_610560 ) ) ( not ( = ?auto_610559 ?auto_610560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_610559 ?auto_610560 )
      ( !STACK ?auto_610559 ?auto_610558 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_610610 - BLOCK
      ?auto_610611 - BLOCK
      ?auto_610612 - BLOCK
      ?auto_610613 - BLOCK
      ?auto_610614 - BLOCK
      ?auto_610615 - BLOCK
      ?auto_610616 - BLOCK
      ?auto_610617 - BLOCK
      ?auto_610618 - BLOCK
      ?auto_610619 - BLOCK
      ?auto_610620 - BLOCK
      ?auto_610621 - BLOCK
      ?auto_610622 - BLOCK
      ?auto_610623 - BLOCK
      ?auto_610624 - BLOCK
      ?auto_610625 - BLOCK
    )
    :vars
    (
      ?auto_610626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610625 ?auto_610626 ) ( ON-TABLE ?auto_610610 ) ( ON ?auto_610611 ?auto_610610 ) ( ON ?auto_610612 ?auto_610611 ) ( ON ?auto_610613 ?auto_610612 ) ( ON ?auto_610614 ?auto_610613 ) ( ON ?auto_610615 ?auto_610614 ) ( ON ?auto_610616 ?auto_610615 ) ( ON ?auto_610617 ?auto_610616 ) ( ON ?auto_610618 ?auto_610617 ) ( ON ?auto_610619 ?auto_610618 ) ( ON ?auto_610620 ?auto_610619 ) ( ON ?auto_610621 ?auto_610620 ) ( ON ?auto_610622 ?auto_610621 ) ( ON ?auto_610623 ?auto_610622 ) ( not ( = ?auto_610610 ?auto_610611 ) ) ( not ( = ?auto_610610 ?auto_610612 ) ) ( not ( = ?auto_610610 ?auto_610613 ) ) ( not ( = ?auto_610610 ?auto_610614 ) ) ( not ( = ?auto_610610 ?auto_610615 ) ) ( not ( = ?auto_610610 ?auto_610616 ) ) ( not ( = ?auto_610610 ?auto_610617 ) ) ( not ( = ?auto_610610 ?auto_610618 ) ) ( not ( = ?auto_610610 ?auto_610619 ) ) ( not ( = ?auto_610610 ?auto_610620 ) ) ( not ( = ?auto_610610 ?auto_610621 ) ) ( not ( = ?auto_610610 ?auto_610622 ) ) ( not ( = ?auto_610610 ?auto_610623 ) ) ( not ( = ?auto_610610 ?auto_610624 ) ) ( not ( = ?auto_610610 ?auto_610625 ) ) ( not ( = ?auto_610610 ?auto_610626 ) ) ( not ( = ?auto_610611 ?auto_610612 ) ) ( not ( = ?auto_610611 ?auto_610613 ) ) ( not ( = ?auto_610611 ?auto_610614 ) ) ( not ( = ?auto_610611 ?auto_610615 ) ) ( not ( = ?auto_610611 ?auto_610616 ) ) ( not ( = ?auto_610611 ?auto_610617 ) ) ( not ( = ?auto_610611 ?auto_610618 ) ) ( not ( = ?auto_610611 ?auto_610619 ) ) ( not ( = ?auto_610611 ?auto_610620 ) ) ( not ( = ?auto_610611 ?auto_610621 ) ) ( not ( = ?auto_610611 ?auto_610622 ) ) ( not ( = ?auto_610611 ?auto_610623 ) ) ( not ( = ?auto_610611 ?auto_610624 ) ) ( not ( = ?auto_610611 ?auto_610625 ) ) ( not ( = ?auto_610611 ?auto_610626 ) ) ( not ( = ?auto_610612 ?auto_610613 ) ) ( not ( = ?auto_610612 ?auto_610614 ) ) ( not ( = ?auto_610612 ?auto_610615 ) ) ( not ( = ?auto_610612 ?auto_610616 ) ) ( not ( = ?auto_610612 ?auto_610617 ) ) ( not ( = ?auto_610612 ?auto_610618 ) ) ( not ( = ?auto_610612 ?auto_610619 ) ) ( not ( = ?auto_610612 ?auto_610620 ) ) ( not ( = ?auto_610612 ?auto_610621 ) ) ( not ( = ?auto_610612 ?auto_610622 ) ) ( not ( = ?auto_610612 ?auto_610623 ) ) ( not ( = ?auto_610612 ?auto_610624 ) ) ( not ( = ?auto_610612 ?auto_610625 ) ) ( not ( = ?auto_610612 ?auto_610626 ) ) ( not ( = ?auto_610613 ?auto_610614 ) ) ( not ( = ?auto_610613 ?auto_610615 ) ) ( not ( = ?auto_610613 ?auto_610616 ) ) ( not ( = ?auto_610613 ?auto_610617 ) ) ( not ( = ?auto_610613 ?auto_610618 ) ) ( not ( = ?auto_610613 ?auto_610619 ) ) ( not ( = ?auto_610613 ?auto_610620 ) ) ( not ( = ?auto_610613 ?auto_610621 ) ) ( not ( = ?auto_610613 ?auto_610622 ) ) ( not ( = ?auto_610613 ?auto_610623 ) ) ( not ( = ?auto_610613 ?auto_610624 ) ) ( not ( = ?auto_610613 ?auto_610625 ) ) ( not ( = ?auto_610613 ?auto_610626 ) ) ( not ( = ?auto_610614 ?auto_610615 ) ) ( not ( = ?auto_610614 ?auto_610616 ) ) ( not ( = ?auto_610614 ?auto_610617 ) ) ( not ( = ?auto_610614 ?auto_610618 ) ) ( not ( = ?auto_610614 ?auto_610619 ) ) ( not ( = ?auto_610614 ?auto_610620 ) ) ( not ( = ?auto_610614 ?auto_610621 ) ) ( not ( = ?auto_610614 ?auto_610622 ) ) ( not ( = ?auto_610614 ?auto_610623 ) ) ( not ( = ?auto_610614 ?auto_610624 ) ) ( not ( = ?auto_610614 ?auto_610625 ) ) ( not ( = ?auto_610614 ?auto_610626 ) ) ( not ( = ?auto_610615 ?auto_610616 ) ) ( not ( = ?auto_610615 ?auto_610617 ) ) ( not ( = ?auto_610615 ?auto_610618 ) ) ( not ( = ?auto_610615 ?auto_610619 ) ) ( not ( = ?auto_610615 ?auto_610620 ) ) ( not ( = ?auto_610615 ?auto_610621 ) ) ( not ( = ?auto_610615 ?auto_610622 ) ) ( not ( = ?auto_610615 ?auto_610623 ) ) ( not ( = ?auto_610615 ?auto_610624 ) ) ( not ( = ?auto_610615 ?auto_610625 ) ) ( not ( = ?auto_610615 ?auto_610626 ) ) ( not ( = ?auto_610616 ?auto_610617 ) ) ( not ( = ?auto_610616 ?auto_610618 ) ) ( not ( = ?auto_610616 ?auto_610619 ) ) ( not ( = ?auto_610616 ?auto_610620 ) ) ( not ( = ?auto_610616 ?auto_610621 ) ) ( not ( = ?auto_610616 ?auto_610622 ) ) ( not ( = ?auto_610616 ?auto_610623 ) ) ( not ( = ?auto_610616 ?auto_610624 ) ) ( not ( = ?auto_610616 ?auto_610625 ) ) ( not ( = ?auto_610616 ?auto_610626 ) ) ( not ( = ?auto_610617 ?auto_610618 ) ) ( not ( = ?auto_610617 ?auto_610619 ) ) ( not ( = ?auto_610617 ?auto_610620 ) ) ( not ( = ?auto_610617 ?auto_610621 ) ) ( not ( = ?auto_610617 ?auto_610622 ) ) ( not ( = ?auto_610617 ?auto_610623 ) ) ( not ( = ?auto_610617 ?auto_610624 ) ) ( not ( = ?auto_610617 ?auto_610625 ) ) ( not ( = ?auto_610617 ?auto_610626 ) ) ( not ( = ?auto_610618 ?auto_610619 ) ) ( not ( = ?auto_610618 ?auto_610620 ) ) ( not ( = ?auto_610618 ?auto_610621 ) ) ( not ( = ?auto_610618 ?auto_610622 ) ) ( not ( = ?auto_610618 ?auto_610623 ) ) ( not ( = ?auto_610618 ?auto_610624 ) ) ( not ( = ?auto_610618 ?auto_610625 ) ) ( not ( = ?auto_610618 ?auto_610626 ) ) ( not ( = ?auto_610619 ?auto_610620 ) ) ( not ( = ?auto_610619 ?auto_610621 ) ) ( not ( = ?auto_610619 ?auto_610622 ) ) ( not ( = ?auto_610619 ?auto_610623 ) ) ( not ( = ?auto_610619 ?auto_610624 ) ) ( not ( = ?auto_610619 ?auto_610625 ) ) ( not ( = ?auto_610619 ?auto_610626 ) ) ( not ( = ?auto_610620 ?auto_610621 ) ) ( not ( = ?auto_610620 ?auto_610622 ) ) ( not ( = ?auto_610620 ?auto_610623 ) ) ( not ( = ?auto_610620 ?auto_610624 ) ) ( not ( = ?auto_610620 ?auto_610625 ) ) ( not ( = ?auto_610620 ?auto_610626 ) ) ( not ( = ?auto_610621 ?auto_610622 ) ) ( not ( = ?auto_610621 ?auto_610623 ) ) ( not ( = ?auto_610621 ?auto_610624 ) ) ( not ( = ?auto_610621 ?auto_610625 ) ) ( not ( = ?auto_610621 ?auto_610626 ) ) ( not ( = ?auto_610622 ?auto_610623 ) ) ( not ( = ?auto_610622 ?auto_610624 ) ) ( not ( = ?auto_610622 ?auto_610625 ) ) ( not ( = ?auto_610622 ?auto_610626 ) ) ( not ( = ?auto_610623 ?auto_610624 ) ) ( not ( = ?auto_610623 ?auto_610625 ) ) ( not ( = ?auto_610623 ?auto_610626 ) ) ( not ( = ?auto_610624 ?auto_610625 ) ) ( not ( = ?auto_610624 ?auto_610626 ) ) ( not ( = ?auto_610625 ?auto_610626 ) ) ( CLEAR ?auto_610623 ) ( ON ?auto_610624 ?auto_610625 ) ( CLEAR ?auto_610624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_610610 ?auto_610611 ?auto_610612 ?auto_610613 ?auto_610614 ?auto_610615 ?auto_610616 ?auto_610617 ?auto_610618 ?auto_610619 ?auto_610620 ?auto_610621 ?auto_610622 ?auto_610623 ?auto_610624 )
      ( MAKE-16PILE ?auto_610610 ?auto_610611 ?auto_610612 ?auto_610613 ?auto_610614 ?auto_610615 ?auto_610616 ?auto_610617 ?auto_610618 ?auto_610619 ?auto_610620 ?auto_610621 ?auto_610622 ?auto_610623 ?auto_610624 ?auto_610625 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_610676 - BLOCK
      ?auto_610677 - BLOCK
      ?auto_610678 - BLOCK
      ?auto_610679 - BLOCK
      ?auto_610680 - BLOCK
      ?auto_610681 - BLOCK
      ?auto_610682 - BLOCK
      ?auto_610683 - BLOCK
      ?auto_610684 - BLOCK
      ?auto_610685 - BLOCK
      ?auto_610686 - BLOCK
      ?auto_610687 - BLOCK
      ?auto_610688 - BLOCK
      ?auto_610689 - BLOCK
      ?auto_610690 - BLOCK
      ?auto_610691 - BLOCK
    )
    :vars
    (
      ?auto_610692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610691 ?auto_610692 ) ( ON-TABLE ?auto_610676 ) ( ON ?auto_610677 ?auto_610676 ) ( ON ?auto_610678 ?auto_610677 ) ( ON ?auto_610679 ?auto_610678 ) ( ON ?auto_610680 ?auto_610679 ) ( ON ?auto_610681 ?auto_610680 ) ( ON ?auto_610682 ?auto_610681 ) ( ON ?auto_610683 ?auto_610682 ) ( ON ?auto_610684 ?auto_610683 ) ( ON ?auto_610685 ?auto_610684 ) ( ON ?auto_610686 ?auto_610685 ) ( ON ?auto_610687 ?auto_610686 ) ( ON ?auto_610688 ?auto_610687 ) ( not ( = ?auto_610676 ?auto_610677 ) ) ( not ( = ?auto_610676 ?auto_610678 ) ) ( not ( = ?auto_610676 ?auto_610679 ) ) ( not ( = ?auto_610676 ?auto_610680 ) ) ( not ( = ?auto_610676 ?auto_610681 ) ) ( not ( = ?auto_610676 ?auto_610682 ) ) ( not ( = ?auto_610676 ?auto_610683 ) ) ( not ( = ?auto_610676 ?auto_610684 ) ) ( not ( = ?auto_610676 ?auto_610685 ) ) ( not ( = ?auto_610676 ?auto_610686 ) ) ( not ( = ?auto_610676 ?auto_610687 ) ) ( not ( = ?auto_610676 ?auto_610688 ) ) ( not ( = ?auto_610676 ?auto_610689 ) ) ( not ( = ?auto_610676 ?auto_610690 ) ) ( not ( = ?auto_610676 ?auto_610691 ) ) ( not ( = ?auto_610676 ?auto_610692 ) ) ( not ( = ?auto_610677 ?auto_610678 ) ) ( not ( = ?auto_610677 ?auto_610679 ) ) ( not ( = ?auto_610677 ?auto_610680 ) ) ( not ( = ?auto_610677 ?auto_610681 ) ) ( not ( = ?auto_610677 ?auto_610682 ) ) ( not ( = ?auto_610677 ?auto_610683 ) ) ( not ( = ?auto_610677 ?auto_610684 ) ) ( not ( = ?auto_610677 ?auto_610685 ) ) ( not ( = ?auto_610677 ?auto_610686 ) ) ( not ( = ?auto_610677 ?auto_610687 ) ) ( not ( = ?auto_610677 ?auto_610688 ) ) ( not ( = ?auto_610677 ?auto_610689 ) ) ( not ( = ?auto_610677 ?auto_610690 ) ) ( not ( = ?auto_610677 ?auto_610691 ) ) ( not ( = ?auto_610677 ?auto_610692 ) ) ( not ( = ?auto_610678 ?auto_610679 ) ) ( not ( = ?auto_610678 ?auto_610680 ) ) ( not ( = ?auto_610678 ?auto_610681 ) ) ( not ( = ?auto_610678 ?auto_610682 ) ) ( not ( = ?auto_610678 ?auto_610683 ) ) ( not ( = ?auto_610678 ?auto_610684 ) ) ( not ( = ?auto_610678 ?auto_610685 ) ) ( not ( = ?auto_610678 ?auto_610686 ) ) ( not ( = ?auto_610678 ?auto_610687 ) ) ( not ( = ?auto_610678 ?auto_610688 ) ) ( not ( = ?auto_610678 ?auto_610689 ) ) ( not ( = ?auto_610678 ?auto_610690 ) ) ( not ( = ?auto_610678 ?auto_610691 ) ) ( not ( = ?auto_610678 ?auto_610692 ) ) ( not ( = ?auto_610679 ?auto_610680 ) ) ( not ( = ?auto_610679 ?auto_610681 ) ) ( not ( = ?auto_610679 ?auto_610682 ) ) ( not ( = ?auto_610679 ?auto_610683 ) ) ( not ( = ?auto_610679 ?auto_610684 ) ) ( not ( = ?auto_610679 ?auto_610685 ) ) ( not ( = ?auto_610679 ?auto_610686 ) ) ( not ( = ?auto_610679 ?auto_610687 ) ) ( not ( = ?auto_610679 ?auto_610688 ) ) ( not ( = ?auto_610679 ?auto_610689 ) ) ( not ( = ?auto_610679 ?auto_610690 ) ) ( not ( = ?auto_610679 ?auto_610691 ) ) ( not ( = ?auto_610679 ?auto_610692 ) ) ( not ( = ?auto_610680 ?auto_610681 ) ) ( not ( = ?auto_610680 ?auto_610682 ) ) ( not ( = ?auto_610680 ?auto_610683 ) ) ( not ( = ?auto_610680 ?auto_610684 ) ) ( not ( = ?auto_610680 ?auto_610685 ) ) ( not ( = ?auto_610680 ?auto_610686 ) ) ( not ( = ?auto_610680 ?auto_610687 ) ) ( not ( = ?auto_610680 ?auto_610688 ) ) ( not ( = ?auto_610680 ?auto_610689 ) ) ( not ( = ?auto_610680 ?auto_610690 ) ) ( not ( = ?auto_610680 ?auto_610691 ) ) ( not ( = ?auto_610680 ?auto_610692 ) ) ( not ( = ?auto_610681 ?auto_610682 ) ) ( not ( = ?auto_610681 ?auto_610683 ) ) ( not ( = ?auto_610681 ?auto_610684 ) ) ( not ( = ?auto_610681 ?auto_610685 ) ) ( not ( = ?auto_610681 ?auto_610686 ) ) ( not ( = ?auto_610681 ?auto_610687 ) ) ( not ( = ?auto_610681 ?auto_610688 ) ) ( not ( = ?auto_610681 ?auto_610689 ) ) ( not ( = ?auto_610681 ?auto_610690 ) ) ( not ( = ?auto_610681 ?auto_610691 ) ) ( not ( = ?auto_610681 ?auto_610692 ) ) ( not ( = ?auto_610682 ?auto_610683 ) ) ( not ( = ?auto_610682 ?auto_610684 ) ) ( not ( = ?auto_610682 ?auto_610685 ) ) ( not ( = ?auto_610682 ?auto_610686 ) ) ( not ( = ?auto_610682 ?auto_610687 ) ) ( not ( = ?auto_610682 ?auto_610688 ) ) ( not ( = ?auto_610682 ?auto_610689 ) ) ( not ( = ?auto_610682 ?auto_610690 ) ) ( not ( = ?auto_610682 ?auto_610691 ) ) ( not ( = ?auto_610682 ?auto_610692 ) ) ( not ( = ?auto_610683 ?auto_610684 ) ) ( not ( = ?auto_610683 ?auto_610685 ) ) ( not ( = ?auto_610683 ?auto_610686 ) ) ( not ( = ?auto_610683 ?auto_610687 ) ) ( not ( = ?auto_610683 ?auto_610688 ) ) ( not ( = ?auto_610683 ?auto_610689 ) ) ( not ( = ?auto_610683 ?auto_610690 ) ) ( not ( = ?auto_610683 ?auto_610691 ) ) ( not ( = ?auto_610683 ?auto_610692 ) ) ( not ( = ?auto_610684 ?auto_610685 ) ) ( not ( = ?auto_610684 ?auto_610686 ) ) ( not ( = ?auto_610684 ?auto_610687 ) ) ( not ( = ?auto_610684 ?auto_610688 ) ) ( not ( = ?auto_610684 ?auto_610689 ) ) ( not ( = ?auto_610684 ?auto_610690 ) ) ( not ( = ?auto_610684 ?auto_610691 ) ) ( not ( = ?auto_610684 ?auto_610692 ) ) ( not ( = ?auto_610685 ?auto_610686 ) ) ( not ( = ?auto_610685 ?auto_610687 ) ) ( not ( = ?auto_610685 ?auto_610688 ) ) ( not ( = ?auto_610685 ?auto_610689 ) ) ( not ( = ?auto_610685 ?auto_610690 ) ) ( not ( = ?auto_610685 ?auto_610691 ) ) ( not ( = ?auto_610685 ?auto_610692 ) ) ( not ( = ?auto_610686 ?auto_610687 ) ) ( not ( = ?auto_610686 ?auto_610688 ) ) ( not ( = ?auto_610686 ?auto_610689 ) ) ( not ( = ?auto_610686 ?auto_610690 ) ) ( not ( = ?auto_610686 ?auto_610691 ) ) ( not ( = ?auto_610686 ?auto_610692 ) ) ( not ( = ?auto_610687 ?auto_610688 ) ) ( not ( = ?auto_610687 ?auto_610689 ) ) ( not ( = ?auto_610687 ?auto_610690 ) ) ( not ( = ?auto_610687 ?auto_610691 ) ) ( not ( = ?auto_610687 ?auto_610692 ) ) ( not ( = ?auto_610688 ?auto_610689 ) ) ( not ( = ?auto_610688 ?auto_610690 ) ) ( not ( = ?auto_610688 ?auto_610691 ) ) ( not ( = ?auto_610688 ?auto_610692 ) ) ( not ( = ?auto_610689 ?auto_610690 ) ) ( not ( = ?auto_610689 ?auto_610691 ) ) ( not ( = ?auto_610689 ?auto_610692 ) ) ( not ( = ?auto_610690 ?auto_610691 ) ) ( not ( = ?auto_610690 ?auto_610692 ) ) ( not ( = ?auto_610691 ?auto_610692 ) ) ( ON ?auto_610690 ?auto_610691 ) ( CLEAR ?auto_610688 ) ( ON ?auto_610689 ?auto_610690 ) ( CLEAR ?auto_610689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_610676 ?auto_610677 ?auto_610678 ?auto_610679 ?auto_610680 ?auto_610681 ?auto_610682 ?auto_610683 ?auto_610684 ?auto_610685 ?auto_610686 ?auto_610687 ?auto_610688 ?auto_610689 )
      ( MAKE-16PILE ?auto_610676 ?auto_610677 ?auto_610678 ?auto_610679 ?auto_610680 ?auto_610681 ?auto_610682 ?auto_610683 ?auto_610684 ?auto_610685 ?auto_610686 ?auto_610687 ?auto_610688 ?auto_610689 ?auto_610690 ?auto_610691 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_610742 - BLOCK
      ?auto_610743 - BLOCK
      ?auto_610744 - BLOCK
      ?auto_610745 - BLOCK
      ?auto_610746 - BLOCK
      ?auto_610747 - BLOCK
      ?auto_610748 - BLOCK
      ?auto_610749 - BLOCK
      ?auto_610750 - BLOCK
      ?auto_610751 - BLOCK
      ?auto_610752 - BLOCK
      ?auto_610753 - BLOCK
      ?auto_610754 - BLOCK
      ?auto_610755 - BLOCK
      ?auto_610756 - BLOCK
      ?auto_610757 - BLOCK
    )
    :vars
    (
      ?auto_610758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610757 ?auto_610758 ) ( ON-TABLE ?auto_610742 ) ( ON ?auto_610743 ?auto_610742 ) ( ON ?auto_610744 ?auto_610743 ) ( ON ?auto_610745 ?auto_610744 ) ( ON ?auto_610746 ?auto_610745 ) ( ON ?auto_610747 ?auto_610746 ) ( ON ?auto_610748 ?auto_610747 ) ( ON ?auto_610749 ?auto_610748 ) ( ON ?auto_610750 ?auto_610749 ) ( ON ?auto_610751 ?auto_610750 ) ( ON ?auto_610752 ?auto_610751 ) ( ON ?auto_610753 ?auto_610752 ) ( not ( = ?auto_610742 ?auto_610743 ) ) ( not ( = ?auto_610742 ?auto_610744 ) ) ( not ( = ?auto_610742 ?auto_610745 ) ) ( not ( = ?auto_610742 ?auto_610746 ) ) ( not ( = ?auto_610742 ?auto_610747 ) ) ( not ( = ?auto_610742 ?auto_610748 ) ) ( not ( = ?auto_610742 ?auto_610749 ) ) ( not ( = ?auto_610742 ?auto_610750 ) ) ( not ( = ?auto_610742 ?auto_610751 ) ) ( not ( = ?auto_610742 ?auto_610752 ) ) ( not ( = ?auto_610742 ?auto_610753 ) ) ( not ( = ?auto_610742 ?auto_610754 ) ) ( not ( = ?auto_610742 ?auto_610755 ) ) ( not ( = ?auto_610742 ?auto_610756 ) ) ( not ( = ?auto_610742 ?auto_610757 ) ) ( not ( = ?auto_610742 ?auto_610758 ) ) ( not ( = ?auto_610743 ?auto_610744 ) ) ( not ( = ?auto_610743 ?auto_610745 ) ) ( not ( = ?auto_610743 ?auto_610746 ) ) ( not ( = ?auto_610743 ?auto_610747 ) ) ( not ( = ?auto_610743 ?auto_610748 ) ) ( not ( = ?auto_610743 ?auto_610749 ) ) ( not ( = ?auto_610743 ?auto_610750 ) ) ( not ( = ?auto_610743 ?auto_610751 ) ) ( not ( = ?auto_610743 ?auto_610752 ) ) ( not ( = ?auto_610743 ?auto_610753 ) ) ( not ( = ?auto_610743 ?auto_610754 ) ) ( not ( = ?auto_610743 ?auto_610755 ) ) ( not ( = ?auto_610743 ?auto_610756 ) ) ( not ( = ?auto_610743 ?auto_610757 ) ) ( not ( = ?auto_610743 ?auto_610758 ) ) ( not ( = ?auto_610744 ?auto_610745 ) ) ( not ( = ?auto_610744 ?auto_610746 ) ) ( not ( = ?auto_610744 ?auto_610747 ) ) ( not ( = ?auto_610744 ?auto_610748 ) ) ( not ( = ?auto_610744 ?auto_610749 ) ) ( not ( = ?auto_610744 ?auto_610750 ) ) ( not ( = ?auto_610744 ?auto_610751 ) ) ( not ( = ?auto_610744 ?auto_610752 ) ) ( not ( = ?auto_610744 ?auto_610753 ) ) ( not ( = ?auto_610744 ?auto_610754 ) ) ( not ( = ?auto_610744 ?auto_610755 ) ) ( not ( = ?auto_610744 ?auto_610756 ) ) ( not ( = ?auto_610744 ?auto_610757 ) ) ( not ( = ?auto_610744 ?auto_610758 ) ) ( not ( = ?auto_610745 ?auto_610746 ) ) ( not ( = ?auto_610745 ?auto_610747 ) ) ( not ( = ?auto_610745 ?auto_610748 ) ) ( not ( = ?auto_610745 ?auto_610749 ) ) ( not ( = ?auto_610745 ?auto_610750 ) ) ( not ( = ?auto_610745 ?auto_610751 ) ) ( not ( = ?auto_610745 ?auto_610752 ) ) ( not ( = ?auto_610745 ?auto_610753 ) ) ( not ( = ?auto_610745 ?auto_610754 ) ) ( not ( = ?auto_610745 ?auto_610755 ) ) ( not ( = ?auto_610745 ?auto_610756 ) ) ( not ( = ?auto_610745 ?auto_610757 ) ) ( not ( = ?auto_610745 ?auto_610758 ) ) ( not ( = ?auto_610746 ?auto_610747 ) ) ( not ( = ?auto_610746 ?auto_610748 ) ) ( not ( = ?auto_610746 ?auto_610749 ) ) ( not ( = ?auto_610746 ?auto_610750 ) ) ( not ( = ?auto_610746 ?auto_610751 ) ) ( not ( = ?auto_610746 ?auto_610752 ) ) ( not ( = ?auto_610746 ?auto_610753 ) ) ( not ( = ?auto_610746 ?auto_610754 ) ) ( not ( = ?auto_610746 ?auto_610755 ) ) ( not ( = ?auto_610746 ?auto_610756 ) ) ( not ( = ?auto_610746 ?auto_610757 ) ) ( not ( = ?auto_610746 ?auto_610758 ) ) ( not ( = ?auto_610747 ?auto_610748 ) ) ( not ( = ?auto_610747 ?auto_610749 ) ) ( not ( = ?auto_610747 ?auto_610750 ) ) ( not ( = ?auto_610747 ?auto_610751 ) ) ( not ( = ?auto_610747 ?auto_610752 ) ) ( not ( = ?auto_610747 ?auto_610753 ) ) ( not ( = ?auto_610747 ?auto_610754 ) ) ( not ( = ?auto_610747 ?auto_610755 ) ) ( not ( = ?auto_610747 ?auto_610756 ) ) ( not ( = ?auto_610747 ?auto_610757 ) ) ( not ( = ?auto_610747 ?auto_610758 ) ) ( not ( = ?auto_610748 ?auto_610749 ) ) ( not ( = ?auto_610748 ?auto_610750 ) ) ( not ( = ?auto_610748 ?auto_610751 ) ) ( not ( = ?auto_610748 ?auto_610752 ) ) ( not ( = ?auto_610748 ?auto_610753 ) ) ( not ( = ?auto_610748 ?auto_610754 ) ) ( not ( = ?auto_610748 ?auto_610755 ) ) ( not ( = ?auto_610748 ?auto_610756 ) ) ( not ( = ?auto_610748 ?auto_610757 ) ) ( not ( = ?auto_610748 ?auto_610758 ) ) ( not ( = ?auto_610749 ?auto_610750 ) ) ( not ( = ?auto_610749 ?auto_610751 ) ) ( not ( = ?auto_610749 ?auto_610752 ) ) ( not ( = ?auto_610749 ?auto_610753 ) ) ( not ( = ?auto_610749 ?auto_610754 ) ) ( not ( = ?auto_610749 ?auto_610755 ) ) ( not ( = ?auto_610749 ?auto_610756 ) ) ( not ( = ?auto_610749 ?auto_610757 ) ) ( not ( = ?auto_610749 ?auto_610758 ) ) ( not ( = ?auto_610750 ?auto_610751 ) ) ( not ( = ?auto_610750 ?auto_610752 ) ) ( not ( = ?auto_610750 ?auto_610753 ) ) ( not ( = ?auto_610750 ?auto_610754 ) ) ( not ( = ?auto_610750 ?auto_610755 ) ) ( not ( = ?auto_610750 ?auto_610756 ) ) ( not ( = ?auto_610750 ?auto_610757 ) ) ( not ( = ?auto_610750 ?auto_610758 ) ) ( not ( = ?auto_610751 ?auto_610752 ) ) ( not ( = ?auto_610751 ?auto_610753 ) ) ( not ( = ?auto_610751 ?auto_610754 ) ) ( not ( = ?auto_610751 ?auto_610755 ) ) ( not ( = ?auto_610751 ?auto_610756 ) ) ( not ( = ?auto_610751 ?auto_610757 ) ) ( not ( = ?auto_610751 ?auto_610758 ) ) ( not ( = ?auto_610752 ?auto_610753 ) ) ( not ( = ?auto_610752 ?auto_610754 ) ) ( not ( = ?auto_610752 ?auto_610755 ) ) ( not ( = ?auto_610752 ?auto_610756 ) ) ( not ( = ?auto_610752 ?auto_610757 ) ) ( not ( = ?auto_610752 ?auto_610758 ) ) ( not ( = ?auto_610753 ?auto_610754 ) ) ( not ( = ?auto_610753 ?auto_610755 ) ) ( not ( = ?auto_610753 ?auto_610756 ) ) ( not ( = ?auto_610753 ?auto_610757 ) ) ( not ( = ?auto_610753 ?auto_610758 ) ) ( not ( = ?auto_610754 ?auto_610755 ) ) ( not ( = ?auto_610754 ?auto_610756 ) ) ( not ( = ?auto_610754 ?auto_610757 ) ) ( not ( = ?auto_610754 ?auto_610758 ) ) ( not ( = ?auto_610755 ?auto_610756 ) ) ( not ( = ?auto_610755 ?auto_610757 ) ) ( not ( = ?auto_610755 ?auto_610758 ) ) ( not ( = ?auto_610756 ?auto_610757 ) ) ( not ( = ?auto_610756 ?auto_610758 ) ) ( not ( = ?auto_610757 ?auto_610758 ) ) ( ON ?auto_610756 ?auto_610757 ) ( ON ?auto_610755 ?auto_610756 ) ( CLEAR ?auto_610753 ) ( ON ?auto_610754 ?auto_610755 ) ( CLEAR ?auto_610754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_610742 ?auto_610743 ?auto_610744 ?auto_610745 ?auto_610746 ?auto_610747 ?auto_610748 ?auto_610749 ?auto_610750 ?auto_610751 ?auto_610752 ?auto_610753 ?auto_610754 )
      ( MAKE-16PILE ?auto_610742 ?auto_610743 ?auto_610744 ?auto_610745 ?auto_610746 ?auto_610747 ?auto_610748 ?auto_610749 ?auto_610750 ?auto_610751 ?auto_610752 ?auto_610753 ?auto_610754 ?auto_610755 ?auto_610756 ?auto_610757 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_610808 - BLOCK
      ?auto_610809 - BLOCK
      ?auto_610810 - BLOCK
      ?auto_610811 - BLOCK
      ?auto_610812 - BLOCK
      ?auto_610813 - BLOCK
      ?auto_610814 - BLOCK
      ?auto_610815 - BLOCK
      ?auto_610816 - BLOCK
      ?auto_610817 - BLOCK
      ?auto_610818 - BLOCK
      ?auto_610819 - BLOCK
      ?auto_610820 - BLOCK
      ?auto_610821 - BLOCK
      ?auto_610822 - BLOCK
      ?auto_610823 - BLOCK
    )
    :vars
    (
      ?auto_610824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610823 ?auto_610824 ) ( ON-TABLE ?auto_610808 ) ( ON ?auto_610809 ?auto_610808 ) ( ON ?auto_610810 ?auto_610809 ) ( ON ?auto_610811 ?auto_610810 ) ( ON ?auto_610812 ?auto_610811 ) ( ON ?auto_610813 ?auto_610812 ) ( ON ?auto_610814 ?auto_610813 ) ( ON ?auto_610815 ?auto_610814 ) ( ON ?auto_610816 ?auto_610815 ) ( ON ?auto_610817 ?auto_610816 ) ( ON ?auto_610818 ?auto_610817 ) ( not ( = ?auto_610808 ?auto_610809 ) ) ( not ( = ?auto_610808 ?auto_610810 ) ) ( not ( = ?auto_610808 ?auto_610811 ) ) ( not ( = ?auto_610808 ?auto_610812 ) ) ( not ( = ?auto_610808 ?auto_610813 ) ) ( not ( = ?auto_610808 ?auto_610814 ) ) ( not ( = ?auto_610808 ?auto_610815 ) ) ( not ( = ?auto_610808 ?auto_610816 ) ) ( not ( = ?auto_610808 ?auto_610817 ) ) ( not ( = ?auto_610808 ?auto_610818 ) ) ( not ( = ?auto_610808 ?auto_610819 ) ) ( not ( = ?auto_610808 ?auto_610820 ) ) ( not ( = ?auto_610808 ?auto_610821 ) ) ( not ( = ?auto_610808 ?auto_610822 ) ) ( not ( = ?auto_610808 ?auto_610823 ) ) ( not ( = ?auto_610808 ?auto_610824 ) ) ( not ( = ?auto_610809 ?auto_610810 ) ) ( not ( = ?auto_610809 ?auto_610811 ) ) ( not ( = ?auto_610809 ?auto_610812 ) ) ( not ( = ?auto_610809 ?auto_610813 ) ) ( not ( = ?auto_610809 ?auto_610814 ) ) ( not ( = ?auto_610809 ?auto_610815 ) ) ( not ( = ?auto_610809 ?auto_610816 ) ) ( not ( = ?auto_610809 ?auto_610817 ) ) ( not ( = ?auto_610809 ?auto_610818 ) ) ( not ( = ?auto_610809 ?auto_610819 ) ) ( not ( = ?auto_610809 ?auto_610820 ) ) ( not ( = ?auto_610809 ?auto_610821 ) ) ( not ( = ?auto_610809 ?auto_610822 ) ) ( not ( = ?auto_610809 ?auto_610823 ) ) ( not ( = ?auto_610809 ?auto_610824 ) ) ( not ( = ?auto_610810 ?auto_610811 ) ) ( not ( = ?auto_610810 ?auto_610812 ) ) ( not ( = ?auto_610810 ?auto_610813 ) ) ( not ( = ?auto_610810 ?auto_610814 ) ) ( not ( = ?auto_610810 ?auto_610815 ) ) ( not ( = ?auto_610810 ?auto_610816 ) ) ( not ( = ?auto_610810 ?auto_610817 ) ) ( not ( = ?auto_610810 ?auto_610818 ) ) ( not ( = ?auto_610810 ?auto_610819 ) ) ( not ( = ?auto_610810 ?auto_610820 ) ) ( not ( = ?auto_610810 ?auto_610821 ) ) ( not ( = ?auto_610810 ?auto_610822 ) ) ( not ( = ?auto_610810 ?auto_610823 ) ) ( not ( = ?auto_610810 ?auto_610824 ) ) ( not ( = ?auto_610811 ?auto_610812 ) ) ( not ( = ?auto_610811 ?auto_610813 ) ) ( not ( = ?auto_610811 ?auto_610814 ) ) ( not ( = ?auto_610811 ?auto_610815 ) ) ( not ( = ?auto_610811 ?auto_610816 ) ) ( not ( = ?auto_610811 ?auto_610817 ) ) ( not ( = ?auto_610811 ?auto_610818 ) ) ( not ( = ?auto_610811 ?auto_610819 ) ) ( not ( = ?auto_610811 ?auto_610820 ) ) ( not ( = ?auto_610811 ?auto_610821 ) ) ( not ( = ?auto_610811 ?auto_610822 ) ) ( not ( = ?auto_610811 ?auto_610823 ) ) ( not ( = ?auto_610811 ?auto_610824 ) ) ( not ( = ?auto_610812 ?auto_610813 ) ) ( not ( = ?auto_610812 ?auto_610814 ) ) ( not ( = ?auto_610812 ?auto_610815 ) ) ( not ( = ?auto_610812 ?auto_610816 ) ) ( not ( = ?auto_610812 ?auto_610817 ) ) ( not ( = ?auto_610812 ?auto_610818 ) ) ( not ( = ?auto_610812 ?auto_610819 ) ) ( not ( = ?auto_610812 ?auto_610820 ) ) ( not ( = ?auto_610812 ?auto_610821 ) ) ( not ( = ?auto_610812 ?auto_610822 ) ) ( not ( = ?auto_610812 ?auto_610823 ) ) ( not ( = ?auto_610812 ?auto_610824 ) ) ( not ( = ?auto_610813 ?auto_610814 ) ) ( not ( = ?auto_610813 ?auto_610815 ) ) ( not ( = ?auto_610813 ?auto_610816 ) ) ( not ( = ?auto_610813 ?auto_610817 ) ) ( not ( = ?auto_610813 ?auto_610818 ) ) ( not ( = ?auto_610813 ?auto_610819 ) ) ( not ( = ?auto_610813 ?auto_610820 ) ) ( not ( = ?auto_610813 ?auto_610821 ) ) ( not ( = ?auto_610813 ?auto_610822 ) ) ( not ( = ?auto_610813 ?auto_610823 ) ) ( not ( = ?auto_610813 ?auto_610824 ) ) ( not ( = ?auto_610814 ?auto_610815 ) ) ( not ( = ?auto_610814 ?auto_610816 ) ) ( not ( = ?auto_610814 ?auto_610817 ) ) ( not ( = ?auto_610814 ?auto_610818 ) ) ( not ( = ?auto_610814 ?auto_610819 ) ) ( not ( = ?auto_610814 ?auto_610820 ) ) ( not ( = ?auto_610814 ?auto_610821 ) ) ( not ( = ?auto_610814 ?auto_610822 ) ) ( not ( = ?auto_610814 ?auto_610823 ) ) ( not ( = ?auto_610814 ?auto_610824 ) ) ( not ( = ?auto_610815 ?auto_610816 ) ) ( not ( = ?auto_610815 ?auto_610817 ) ) ( not ( = ?auto_610815 ?auto_610818 ) ) ( not ( = ?auto_610815 ?auto_610819 ) ) ( not ( = ?auto_610815 ?auto_610820 ) ) ( not ( = ?auto_610815 ?auto_610821 ) ) ( not ( = ?auto_610815 ?auto_610822 ) ) ( not ( = ?auto_610815 ?auto_610823 ) ) ( not ( = ?auto_610815 ?auto_610824 ) ) ( not ( = ?auto_610816 ?auto_610817 ) ) ( not ( = ?auto_610816 ?auto_610818 ) ) ( not ( = ?auto_610816 ?auto_610819 ) ) ( not ( = ?auto_610816 ?auto_610820 ) ) ( not ( = ?auto_610816 ?auto_610821 ) ) ( not ( = ?auto_610816 ?auto_610822 ) ) ( not ( = ?auto_610816 ?auto_610823 ) ) ( not ( = ?auto_610816 ?auto_610824 ) ) ( not ( = ?auto_610817 ?auto_610818 ) ) ( not ( = ?auto_610817 ?auto_610819 ) ) ( not ( = ?auto_610817 ?auto_610820 ) ) ( not ( = ?auto_610817 ?auto_610821 ) ) ( not ( = ?auto_610817 ?auto_610822 ) ) ( not ( = ?auto_610817 ?auto_610823 ) ) ( not ( = ?auto_610817 ?auto_610824 ) ) ( not ( = ?auto_610818 ?auto_610819 ) ) ( not ( = ?auto_610818 ?auto_610820 ) ) ( not ( = ?auto_610818 ?auto_610821 ) ) ( not ( = ?auto_610818 ?auto_610822 ) ) ( not ( = ?auto_610818 ?auto_610823 ) ) ( not ( = ?auto_610818 ?auto_610824 ) ) ( not ( = ?auto_610819 ?auto_610820 ) ) ( not ( = ?auto_610819 ?auto_610821 ) ) ( not ( = ?auto_610819 ?auto_610822 ) ) ( not ( = ?auto_610819 ?auto_610823 ) ) ( not ( = ?auto_610819 ?auto_610824 ) ) ( not ( = ?auto_610820 ?auto_610821 ) ) ( not ( = ?auto_610820 ?auto_610822 ) ) ( not ( = ?auto_610820 ?auto_610823 ) ) ( not ( = ?auto_610820 ?auto_610824 ) ) ( not ( = ?auto_610821 ?auto_610822 ) ) ( not ( = ?auto_610821 ?auto_610823 ) ) ( not ( = ?auto_610821 ?auto_610824 ) ) ( not ( = ?auto_610822 ?auto_610823 ) ) ( not ( = ?auto_610822 ?auto_610824 ) ) ( not ( = ?auto_610823 ?auto_610824 ) ) ( ON ?auto_610822 ?auto_610823 ) ( ON ?auto_610821 ?auto_610822 ) ( ON ?auto_610820 ?auto_610821 ) ( CLEAR ?auto_610818 ) ( ON ?auto_610819 ?auto_610820 ) ( CLEAR ?auto_610819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_610808 ?auto_610809 ?auto_610810 ?auto_610811 ?auto_610812 ?auto_610813 ?auto_610814 ?auto_610815 ?auto_610816 ?auto_610817 ?auto_610818 ?auto_610819 )
      ( MAKE-16PILE ?auto_610808 ?auto_610809 ?auto_610810 ?auto_610811 ?auto_610812 ?auto_610813 ?auto_610814 ?auto_610815 ?auto_610816 ?auto_610817 ?auto_610818 ?auto_610819 ?auto_610820 ?auto_610821 ?auto_610822 ?auto_610823 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_610874 - BLOCK
      ?auto_610875 - BLOCK
      ?auto_610876 - BLOCK
      ?auto_610877 - BLOCK
      ?auto_610878 - BLOCK
      ?auto_610879 - BLOCK
      ?auto_610880 - BLOCK
      ?auto_610881 - BLOCK
      ?auto_610882 - BLOCK
      ?auto_610883 - BLOCK
      ?auto_610884 - BLOCK
      ?auto_610885 - BLOCK
      ?auto_610886 - BLOCK
      ?auto_610887 - BLOCK
      ?auto_610888 - BLOCK
      ?auto_610889 - BLOCK
    )
    :vars
    (
      ?auto_610890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610889 ?auto_610890 ) ( ON-TABLE ?auto_610874 ) ( ON ?auto_610875 ?auto_610874 ) ( ON ?auto_610876 ?auto_610875 ) ( ON ?auto_610877 ?auto_610876 ) ( ON ?auto_610878 ?auto_610877 ) ( ON ?auto_610879 ?auto_610878 ) ( ON ?auto_610880 ?auto_610879 ) ( ON ?auto_610881 ?auto_610880 ) ( ON ?auto_610882 ?auto_610881 ) ( ON ?auto_610883 ?auto_610882 ) ( not ( = ?auto_610874 ?auto_610875 ) ) ( not ( = ?auto_610874 ?auto_610876 ) ) ( not ( = ?auto_610874 ?auto_610877 ) ) ( not ( = ?auto_610874 ?auto_610878 ) ) ( not ( = ?auto_610874 ?auto_610879 ) ) ( not ( = ?auto_610874 ?auto_610880 ) ) ( not ( = ?auto_610874 ?auto_610881 ) ) ( not ( = ?auto_610874 ?auto_610882 ) ) ( not ( = ?auto_610874 ?auto_610883 ) ) ( not ( = ?auto_610874 ?auto_610884 ) ) ( not ( = ?auto_610874 ?auto_610885 ) ) ( not ( = ?auto_610874 ?auto_610886 ) ) ( not ( = ?auto_610874 ?auto_610887 ) ) ( not ( = ?auto_610874 ?auto_610888 ) ) ( not ( = ?auto_610874 ?auto_610889 ) ) ( not ( = ?auto_610874 ?auto_610890 ) ) ( not ( = ?auto_610875 ?auto_610876 ) ) ( not ( = ?auto_610875 ?auto_610877 ) ) ( not ( = ?auto_610875 ?auto_610878 ) ) ( not ( = ?auto_610875 ?auto_610879 ) ) ( not ( = ?auto_610875 ?auto_610880 ) ) ( not ( = ?auto_610875 ?auto_610881 ) ) ( not ( = ?auto_610875 ?auto_610882 ) ) ( not ( = ?auto_610875 ?auto_610883 ) ) ( not ( = ?auto_610875 ?auto_610884 ) ) ( not ( = ?auto_610875 ?auto_610885 ) ) ( not ( = ?auto_610875 ?auto_610886 ) ) ( not ( = ?auto_610875 ?auto_610887 ) ) ( not ( = ?auto_610875 ?auto_610888 ) ) ( not ( = ?auto_610875 ?auto_610889 ) ) ( not ( = ?auto_610875 ?auto_610890 ) ) ( not ( = ?auto_610876 ?auto_610877 ) ) ( not ( = ?auto_610876 ?auto_610878 ) ) ( not ( = ?auto_610876 ?auto_610879 ) ) ( not ( = ?auto_610876 ?auto_610880 ) ) ( not ( = ?auto_610876 ?auto_610881 ) ) ( not ( = ?auto_610876 ?auto_610882 ) ) ( not ( = ?auto_610876 ?auto_610883 ) ) ( not ( = ?auto_610876 ?auto_610884 ) ) ( not ( = ?auto_610876 ?auto_610885 ) ) ( not ( = ?auto_610876 ?auto_610886 ) ) ( not ( = ?auto_610876 ?auto_610887 ) ) ( not ( = ?auto_610876 ?auto_610888 ) ) ( not ( = ?auto_610876 ?auto_610889 ) ) ( not ( = ?auto_610876 ?auto_610890 ) ) ( not ( = ?auto_610877 ?auto_610878 ) ) ( not ( = ?auto_610877 ?auto_610879 ) ) ( not ( = ?auto_610877 ?auto_610880 ) ) ( not ( = ?auto_610877 ?auto_610881 ) ) ( not ( = ?auto_610877 ?auto_610882 ) ) ( not ( = ?auto_610877 ?auto_610883 ) ) ( not ( = ?auto_610877 ?auto_610884 ) ) ( not ( = ?auto_610877 ?auto_610885 ) ) ( not ( = ?auto_610877 ?auto_610886 ) ) ( not ( = ?auto_610877 ?auto_610887 ) ) ( not ( = ?auto_610877 ?auto_610888 ) ) ( not ( = ?auto_610877 ?auto_610889 ) ) ( not ( = ?auto_610877 ?auto_610890 ) ) ( not ( = ?auto_610878 ?auto_610879 ) ) ( not ( = ?auto_610878 ?auto_610880 ) ) ( not ( = ?auto_610878 ?auto_610881 ) ) ( not ( = ?auto_610878 ?auto_610882 ) ) ( not ( = ?auto_610878 ?auto_610883 ) ) ( not ( = ?auto_610878 ?auto_610884 ) ) ( not ( = ?auto_610878 ?auto_610885 ) ) ( not ( = ?auto_610878 ?auto_610886 ) ) ( not ( = ?auto_610878 ?auto_610887 ) ) ( not ( = ?auto_610878 ?auto_610888 ) ) ( not ( = ?auto_610878 ?auto_610889 ) ) ( not ( = ?auto_610878 ?auto_610890 ) ) ( not ( = ?auto_610879 ?auto_610880 ) ) ( not ( = ?auto_610879 ?auto_610881 ) ) ( not ( = ?auto_610879 ?auto_610882 ) ) ( not ( = ?auto_610879 ?auto_610883 ) ) ( not ( = ?auto_610879 ?auto_610884 ) ) ( not ( = ?auto_610879 ?auto_610885 ) ) ( not ( = ?auto_610879 ?auto_610886 ) ) ( not ( = ?auto_610879 ?auto_610887 ) ) ( not ( = ?auto_610879 ?auto_610888 ) ) ( not ( = ?auto_610879 ?auto_610889 ) ) ( not ( = ?auto_610879 ?auto_610890 ) ) ( not ( = ?auto_610880 ?auto_610881 ) ) ( not ( = ?auto_610880 ?auto_610882 ) ) ( not ( = ?auto_610880 ?auto_610883 ) ) ( not ( = ?auto_610880 ?auto_610884 ) ) ( not ( = ?auto_610880 ?auto_610885 ) ) ( not ( = ?auto_610880 ?auto_610886 ) ) ( not ( = ?auto_610880 ?auto_610887 ) ) ( not ( = ?auto_610880 ?auto_610888 ) ) ( not ( = ?auto_610880 ?auto_610889 ) ) ( not ( = ?auto_610880 ?auto_610890 ) ) ( not ( = ?auto_610881 ?auto_610882 ) ) ( not ( = ?auto_610881 ?auto_610883 ) ) ( not ( = ?auto_610881 ?auto_610884 ) ) ( not ( = ?auto_610881 ?auto_610885 ) ) ( not ( = ?auto_610881 ?auto_610886 ) ) ( not ( = ?auto_610881 ?auto_610887 ) ) ( not ( = ?auto_610881 ?auto_610888 ) ) ( not ( = ?auto_610881 ?auto_610889 ) ) ( not ( = ?auto_610881 ?auto_610890 ) ) ( not ( = ?auto_610882 ?auto_610883 ) ) ( not ( = ?auto_610882 ?auto_610884 ) ) ( not ( = ?auto_610882 ?auto_610885 ) ) ( not ( = ?auto_610882 ?auto_610886 ) ) ( not ( = ?auto_610882 ?auto_610887 ) ) ( not ( = ?auto_610882 ?auto_610888 ) ) ( not ( = ?auto_610882 ?auto_610889 ) ) ( not ( = ?auto_610882 ?auto_610890 ) ) ( not ( = ?auto_610883 ?auto_610884 ) ) ( not ( = ?auto_610883 ?auto_610885 ) ) ( not ( = ?auto_610883 ?auto_610886 ) ) ( not ( = ?auto_610883 ?auto_610887 ) ) ( not ( = ?auto_610883 ?auto_610888 ) ) ( not ( = ?auto_610883 ?auto_610889 ) ) ( not ( = ?auto_610883 ?auto_610890 ) ) ( not ( = ?auto_610884 ?auto_610885 ) ) ( not ( = ?auto_610884 ?auto_610886 ) ) ( not ( = ?auto_610884 ?auto_610887 ) ) ( not ( = ?auto_610884 ?auto_610888 ) ) ( not ( = ?auto_610884 ?auto_610889 ) ) ( not ( = ?auto_610884 ?auto_610890 ) ) ( not ( = ?auto_610885 ?auto_610886 ) ) ( not ( = ?auto_610885 ?auto_610887 ) ) ( not ( = ?auto_610885 ?auto_610888 ) ) ( not ( = ?auto_610885 ?auto_610889 ) ) ( not ( = ?auto_610885 ?auto_610890 ) ) ( not ( = ?auto_610886 ?auto_610887 ) ) ( not ( = ?auto_610886 ?auto_610888 ) ) ( not ( = ?auto_610886 ?auto_610889 ) ) ( not ( = ?auto_610886 ?auto_610890 ) ) ( not ( = ?auto_610887 ?auto_610888 ) ) ( not ( = ?auto_610887 ?auto_610889 ) ) ( not ( = ?auto_610887 ?auto_610890 ) ) ( not ( = ?auto_610888 ?auto_610889 ) ) ( not ( = ?auto_610888 ?auto_610890 ) ) ( not ( = ?auto_610889 ?auto_610890 ) ) ( ON ?auto_610888 ?auto_610889 ) ( ON ?auto_610887 ?auto_610888 ) ( ON ?auto_610886 ?auto_610887 ) ( ON ?auto_610885 ?auto_610886 ) ( CLEAR ?auto_610883 ) ( ON ?auto_610884 ?auto_610885 ) ( CLEAR ?auto_610884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_610874 ?auto_610875 ?auto_610876 ?auto_610877 ?auto_610878 ?auto_610879 ?auto_610880 ?auto_610881 ?auto_610882 ?auto_610883 ?auto_610884 )
      ( MAKE-16PILE ?auto_610874 ?auto_610875 ?auto_610876 ?auto_610877 ?auto_610878 ?auto_610879 ?auto_610880 ?auto_610881 ?auto_610882 ?auto_610883 ?auto_610884 ?auto_610885 ?auto_610886 ?auto_610887 ?auto_610888 ?auto_610889 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_610940 - BLOCK
      ?auto_610941 - BLOCK
      ?auto_610942 - BLOCK
      ?auto_610943 - BLOCK
      ?auto_610944 - BLOCK
      ?auto_610945 - BLOCK
      ?auto_610946 - BLOCK
      ?auto_610947 - BLOCK
      ?auto_610948 - BLOCK
      ?auto_610949 - BLOCK
      ?auto_610950 - BLOCK
      ?auto_610951 - BLOCK
      ?auto_610952 - BLOCK
      ?auto_610953 - BLOCK
      ?auto_610954 - BLOCK
      ?auto_610955 - BLOCK
    )
    :vars
    (
      ?auto_610956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_610955 ?auto_610956 ) ( ON-TABLE ?auto_610940 ) ( ON ?auto_610941 ?auto_610940 ) ( ON ?auto_610942 ?auto_610941 ) ( ON ?auto_610943 ?auto_610942 ) ( ON ?auto_610944 ?auto_610943 ) ( ON ?auto_610945 ?auto_610944 ) ( ON ?auto_610946 ?auto_610945 ) ( ON ?auto_610947 ?auto_610946 ) ( ON ?auto_610948 ?auto_610947 ) ( not ( = ?auto_610940 ?auto_610941 ) ) ( not ( = ?auto_610940 ?auto_610942 ) ) ( not ( = ?auto_610940 ?auto_610943 ) ) ( not ( = ?auto_610940 ?auto_610944 ) ) ( not ( = ?auto_610940 ?auto_610945 ) ) ( not ( = ?auto_610940 ?auto_610946 ) ) ( not ( = ?auto_610940 ?auto_610947 ) ) ( not ( = ?auto_610940 ?auto_610948 ) ) ( not ( = ?auto_610940 ?auto_610949 ) ) ( not ( = ?auto_610940 ?auto_610950 ) ) ( not ( = ?auto_610940 ?auto_610951 ) ) ( not ( = ?auto_610940 ?auto_610952 ) ) ( not ( = ?auto_610940 ?auto_610953 ) ) ( not ( = ?auto_610940 ?auto_610954 ) ) ( not ( = ?auto_610940 ?auto_610955 ) ) ( not ( = ?auto_610940 ?auto_610956 ) ) ( not ( = ?auto_610941 ?auto_610942 ) ) ( not ( = ?auto_610941 ?auto_610943 ) ) ( not ( = ?auto_610941 ?auto_610944 ) ) ( not ( = ?auto_610941 ?auto_610945 ) ) ( not ( = ?auto_610941 ?auto_610946 ) ) ( not ( = ?auto_610941 ?auto_610947 ) ) ( not ( = ?auto_610941 ?auto_610948 ) ) ( not ( = ?auto_610941 ?auto_610949 ) ) ( not ( = ?auto_610941 ?auto_610950 ) ) ( not ( = ?auto_610941 ?auto_610951 ) ) ( not ( = ?auto_610941 ?auto_610952 ) ) ( not ( = ?auto_610941 ?auto_610953 ) ) ( not ( = ?auto_610941 ?auto_610954 ) ) ( not ( = ?auto_610941 ?auto_610955 ) ) ( not ( = ?auto_610941 ?auto_610956 ) ) ( not ( = ?auto_610942 ?auto_610943 ) ) ( not ( = ?auto_610942 ?auto_610944 ) ) ( not ( = ?auto_610942 ?auto_610945 ) ) ( not ( = ?auto_610942 ?auto_610946 ) ) ( not ( = ?auto_610942 ?auto_610947 ) ) ( not ( = ?auto_610942 ?auto_610948 ) ) ( not ( = ?auto_610942 ?auto_610949 ) ) ( not ( = ?auto_610942 ?auto_610950 ) ) ( not ( = ?auto_610942 ?auto_610951 ) ) ( not ( = ?auto_610942 ?auto_610952 ) ) ( not ( = ?auto_610942 ?auto_610953 ) ) ( not ( = ?auto_610942 ?auto_610954 ) ) ( not ( = ?auto_610942 ?auto_610955 ) ) ( not ( = ?auto_610942 ?auto_610956 ) ) ( not ( = ?auto_610943 ?auto_610944 ) ) ( not ( = ?auto_610943 ?auto_610945 ) ) ( not ( = ?auto_610943 ?auto_610946 ) ) ( not ( = ?auto_610943 ?auto_610947 ) ) ( not ( = ?auto_610943 ?auto_610948 ) ) ( not ( = ?auto_610943 ?auto_610949 ) ) ( not ( = ?auto_610943 ?auto_610950 ) ) ( not ( = ?auto_610943 ?auto_610951 ) ) ( not ( = ?auto_610943 ?auto_610952 ) ) ( not ( = ?auto_610943 ?auto_610953 ) ) ( not ( = ?auto_610943 ?auto_610954 ) ) ( not ( = ?auto_610943 ?auto_610955 ) ) ( not ( = ?auto_610943 ?auto_610956 ) ) ( not ( = ?auto_610944 ?auto_610945 ) ) ( not ( = ?auto_610944 ?auto_610946 ) ) ( not ( = ?auto_610944 ?auto_610947 ) ) ( not ( = ?auto_610944 ?auto_610948 ) ) ( not ( = ?auto_610944 ?auto_610949 ) ) ( not ( = ?auto_610944 ?auto_610950 ) ) ( not ( = ?auto_610944 ?auto_610951 ) ) ( not ( = ?auto_610944 ?auto_610952 ) ) ( not ( = ?auto_610944 ?auto_610953 ) ) ( not ( = ?auto_610944 ?auto_610954 ) ) ( not ( = ?auto_610944 ?auto_610955 ) ) ( not ( = ?auto_610944 ?auto_610956 ) ) ( not ( = ?auto_610945 ?auto_610946 ) ) ( not ( = ?auto_610945 ?auto_610947 ) ) ( not ( = ?auto_610945 ?auto_610948 ) ) ( not ( = ?auto_610945 ?auto_610949 ) ) ( not ( = ?auto_610945 ?auto_610950 ) ) ( not ( = ?auto_610945 ?auto_610951 ) ) ( not ( = ?auto_610945 ?auto_610952 ) ) ( not ( = ?auto_610945 ?auto_610953 ) ) ( not ( = ?auto_610945 ?auto_610954 ) ) ( not ( = ?auto_610945 ?auto_610955 ) ) ( not ( = ?auto_610945 ?auto_610956 ) ) ( not ( = ?auto_610946 ?auto_610947 ) ) ( not ( = ?auto_610946 ?auto_610948 ) ) ( not ( = ?auto_610946 ?auto_610949 ) ) ( not ( = ?auto_610946 ?auto_610950 ) ) ( not ( = ?auto_610946 ?auto_610951 ) ) ( not ( = ?auto_610946 ?auto_610952 ) ) ( not ( = ?auto_610946 ?auto_610953 ) ) ( not ( = ?auto_610946 ?auto_610954 ) ) ( not ( = ?auto_610946 ?auto_610955 ) ) ( not ( = ?auto_610946 ?auto_610956 ) ) ( not ( = ?auto_610947 ?auto_610948 ) ) ( not ( = ?auto_610947 ?auto_610949 ) ) ( not ( = ?auto_610947 ?auto_610950 ) ) ( not ( = ?auto_610947 ?auto_610951 ) ) ( not ( = ?auto_610947 ?auto_610952 ) ) ( not ( = ?auto_610947 ?auto_610953 ) ) ( not ( = ?auto_610947 ?auto_610954 ) ) ( not ( = ?auto_610947 ?auto_610955 ) ) ( not ( = ?auto_610947 ?auto_610956 ) ) ( not ( = ?auto_610948 ?auto_610949 ) ) ( not ( = ?auto_610948 ?auto_610950 ) ) ( not ( = ?auto_610948 ?auto_610951 ) ) ( not ( = ?auto_610948 ?auto_610952 ) ) ( not ( = ?auto_610948 ?auto_610953 ) ) ( not ( = ?auto_610948 ?auto_610954 ) ) ( not ( = ?auto_610948 ?auto_610955 ) ) ( not ( = ?auto_610948 ?auto_610956 ) ) ( not ( = ?auto_610949 ?auto_610950 ) ) ( not ( = ?auto_610949 ?auto_610951 ) ) ( not ( = ?auto_610949 ?auto_610952 ) ) ( not ( = ?auto_610949 ?auto_610953 ) ) ( not ( = ?auto_610949 ?auto_610954 ) ) ( not ( = ?auto_610949 ?auto_610955 ) ) ( not ( = ?auto_610949 ?auto_610956 ) ) ( not ( = ?auto_610950 ?auto_610951 ) ) ( not ( = ?auto_610950 ?auto_610952 ) ) ( not ( = ?auto_610950 ?auto_610953 ) ) ( not ( = ?auto_610950 ?auto_610954 ) ) ( not ( = ?auto_610950 ?auto_610955 ) ) ( not ( = ?auto_610950 ?auto_610956 ) ) ( not ( = ?auto_610951 ?auto_610952 ) ) ( not ( = ?auto_610951 ?auto_610953 ) ) ( not ( = ?auto_610951 ?auto_610954 ) ) ( not ( = ?auto_610951 ?auto_610955 ) ) ( not ( = ?auto_610951 ?auto_610956 ) ) ( not ( = ?auto_610952 ?auto_610953 ) ) ( not ( = ?auto_610952 ?auto_610954 ) ) ( not ( = ?auto_610952 ?auto_610955 ) ) ( not ( = ?auto_610952 ?auto_610956 ) ) ( not ( = ?auto_610953 ?auto_610954 ) ) ( not ( = ?auto_610953 ?auto_610955 ) ) ( not ( = ?auto_610953 ?auto_610956 ) ) ( not ( = ?auto_610954 ?auto_610955 ) ) ( not ( = ?auto_610954 ?auto_610956 ) ) ( not ( = ?auto_610955 ?auto_610956 ) ) ( ON ?auto_610954 ?auto_610955 ) ( ON ?auto_610953 ?auto_610954 ) ( ON ?auto_610952 ?auto_610953 ) ( ON ?auto_610951 ?auto_610952 ) ( ON ?auto_610950 ?auto_610951 ) ( CLEAR ?auto_610948 ) ( ON ?auto_610949 ?auto_610950 ) ( CLEAR ?auto_610949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_610940 ?auto_610941 ?auto_610942 ?auto_610943 ?auto_610944 ?auto_610945 ?auto_610946 ?auto_610947 ?auto_610948 ?auto_610949 )
      ( MAKE-16PILE ?auto_610940 ?auto_610941 ?auto_610942 ?auto_610943 ?auto_610944 ?auto_610945 ?auto_610946 ?auto_610947 ?auto_610948 ?auto_610949 ?auto_610950 ?auto_610951 ?auto_610952 ?auto_610953 ?auto_610954 ?auto_610955 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_611006 - BLOCK
      ?auto_611007 - BLOCK
      ?auto_611008 - BLOCK
      ?auto_611009 - BLOCK
      ?auto_611010 - BLOCK
      ?auto_611011 - BLOCK
      ?auto_611012 - BLOCK
      ?auto_611013 - BLOCK
      ?auto_611014 - BLOCK
      ?auto_611015 - BLOCK
      ?auto_611016 - BLOCK
      ?auto_611017 - BLOCK
      ?auto_611018 - BLOCK
      ?auto_611019 - BLOCK
      ?auto_611020 - BLOCK
      ?auto_611021 - BLOCK
    )
    :vars
    (
      ?auto_611022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611021 ?auto_611022 ) ( ON-TABLE ?auto_611006 ) ( ON ?auto_611007 ?auto_611006 ) ( ON ?auto_611008 ?auto_611007 ) ( ON ?auto_611009 ?auto_611008 ) ( ON ?auto_611010 ?auto_611009 ) ( ON ?auto_611011 ?auto_611010 ) ( ON ?auto_611012 ?auto_611011 ) ( ON ?auto_611013 ?auto_611012 ) ( not ( = ?auto_611006 ?auto_611007 ) ) ( not ( = ?auto_611006 ?auto_611008 ) ) ( not ( = ?auto_611006 ?auto_611009 ) ) ( not ( = ?auto_611006 ?auto_611010 ) ) ( not ( = ?auto_611006 ?auto_611011 ) ) ( not ( = ?auto_611006 ?auto_611012 ) ) ( not ( = ?auto_611006 ?auto_611013 ) ) ( not ( = ?auto_611006 ?auto_611014 ) ) ( not ( = ?auto_611006 ?auto_611015 ) ) ( not ( = ?auto_611006 ?auto_611016 ) ) ( not ( = ?auto_611006 ?auto_611017 ) ) ( not ( = ?auto_611006 ?auto_611018 ) ) ( not ( = ?auto_611006 ?auto_611019 ) ) ( not ( = ?auto_611006 ?auto_611020 ) ) ( not ( = ?auto_611006 ?auto_611021 ) ) ( not ( = ?auto_611006 ?auto_611022 ) ) ( not ( = ?auto_611007 ?auto_611008 ) ) ( not ( = ?auto_611007 ?auto_611009 ) ) ( not ( = ?auto_611007 ?auto_611010 ) ) ( not ( = ?auto_611007 ?auto_611011 ) ) ( not ( = ?auto_611007 ?auto_611012 ) ) ( not ( = ?auto_611007 ?auto_611013 ) ) ( not ( = ?auto_611007 ?auto_611014 ) ) ( not ( = ?auto_611007 ?auto_611015 ) ) ( not ( = ?auto_611007 ?auto_611016 ) ) ( not ( = ?auto_611007 ?auto_611017 ) ) ( not ( = ?auto_611007 ?auto_611018 ) ) ( not ( = ?auto_611007 ?auto_611019 ) ) ( not ( = ?auto_611007 ?auto_611020 ) ) ( not ( = ?auto_611007 ?auto_611021 ) ) ( not ( = ?auto_611007 ?auto_611022 ) ) ( not ( = ?auto_611008 ?auto_611009 ) ) ( not ( = ?auto_611008 ?auto_611010 ) ) ( not ( = ?auto_611008 ?auto_611011 ) ) ( not ( = ?auto_611008 ?auto_611012 ) ) ( not ( = ?auto_611008 ?auto_611013 ) ) ( not ( = ?auto_611008 ?auto_611014 ) ) ( not ( = ?auto_611008 ?auto_611015 ) ) ( not ( = ?auto_611008 ?auto_611016 ) ) ( not ( = ?auto_611008 ?auto_611017 ) ) ( not ( = ?auto_611008 ?auto_611018 ) ) ( not ( = ?auto_611008 ?auto_611019 ) ) ( not ( = ?auto_611008 ?auto_611020 ) ) ( not ( = ?auto_611008 ?auto_611021 ) ) ( not ( = ?auto_611008 ?auto_611022 ) ) ( not ( = ?auto_611009 ?auto_611010 ) ) ( not ( = ?auto_611009 ?auto_611011 ) ) ( not ( = ?auto_611009 ?auto_611012 ) ) ( not ( = ?auto_611009 ?auto_611013 ) ) ( not ( = ?auto_611009 ?auto_611014 ) ) ( not ( = ?auto_611009 ?auto_611015 ) ) ( not ( = ?auto_611009 ?auto_611016 ) ) ( not ( = ?auto_611009 ?auto_611017 ) ) ( not ( = ?auto_611009 ?auto_611018 ) ) ( not ( = ?auto_611009 ?auto_611019 ) ) ( not ( = ?auto_611009 ?auto_611020 ) ) ( not ( = ?auto_611009 ?auto_611021 ) ) ( not ( = ?auto_611009 ?auto_611022 ) ) ( not ( = ?auto_611010 ?auto_611011 ) ) ( not ( = ?auto_611010 ?auto_611012 ) ) ( not ( = ?auto_611010 ?auto_611013 ) ) ( not ( = ?auto_611010 ?auto_611014 ) ) ( not ( = ?auto_611010 ?auto_611015 ) ) ( not ( = ?auto_611010 ?auto_611016 ) ) ( not ( = ?auto_611010 ?auto_611017 ) ) ( not ( = ?auto_611010 ?auto_611018 ) ) ( not ( = ?auto_611010 ?auto_611019 ) ) ( not ( = ?auto_611010 ?auto_611020 ) ) ( not ( = ?auto_611010 ?auto_611021 ) ) ( not ( = ?auto_611010 ?auto_611022 ) ) ( not ( = ?auto_611011 ?auto_611012 ) ) ( not ( = ?auto_611011 ?auto_611013 ) ) ( not ( = ?auto_611011 ?auto_611014 ) ) ( not ( = ?auto_611011 ?auto_611015 ) ) ( not ( = ?auto_611011 ?auto_611016 ) ) ( not ( = ?auto_611011 ?auto_611017 ) ) ( not ( = ?auto_611011 ?auto_611018 ) ) ( not ( = ?auto_611011 ?auto_611019 ) ) ( not ( = ?auto_611011 ?auto_611020 ) ) ( not ( = ?auto_611011 ?auto_611021 ) ) ( not ( = ?auto_611011 ?auto_611022 ) ) ( not ( = ?auto_611012 ?auto_611013 ) ) ( not ( = ?auto_611012 ?auto_611014 ) ) ( not ( = ?auto_611012 ?auto_611015 ) ) ( not ( = ?auto_611012 ?auto_611016 ) ) ( not ( = ?auto_611012 ?auto_611017 ) ) ( not ( = ?auto_611012 ?auto_611018 ) ) ( not ( = ?auto_611012 ?auto_611019 ) ) ( not ( = ?auto_611012 ?auto_611020 ) ) ( not ( = ?auto_611012 ?auto_611021 ) ) ( not ( = ?auto_611012 ?auto_611022 ) ) ( not ( = ?auto_611013 ?auto_611014 ) ) ( not ( = ?auto_611013 ?auto_611015 ) ) ( not ( = ?auto_611013 ?auto_611016 ) ) ( not ( = ?auto_611013 ?auto_611017 ) ) ( not ( = ?auto_611013 ?auto_611018 ) ) ( not ( = ?auto_611013 ?auto_611019 ) ) ( not ( = ?auto_611013 ?auto_611020 ) ) ( not ( = ?auto_611013 ?auto_611021 ) ) ( not ( = ?auto_611013 ?auto_611022 ) ) ( not ( = ?auto_611014 ?auto_611015 ) ) ( not ( = ?auto_611014 ?auto_611016 ) ) ( not ( = ?auto_611014 ?auto_611017 ) ) ( not ( = ?auto_611014 ?auto_611018 ) ) ( not ( = ?auto_611014 ?auto_611019 ) ) ( not ( = ?auto_611014 ?auto_611020 ) ) ( not ( = ?auto_611014 ?auto_611021 ) ) ( not ( = ?auto_611014 ?auto_611022 ) ) ( not ( = ?auto_611015 ?auto_611016 ) ) ( not ( = ?auto_611015 ?auto_611017 ) ) ( not ( = ?auto_611015 ?auto_611018 ) ) ( not ( = ?auto_611015 ?auto_611019 ) ) ( not ( = ?auto_611015 ?auto_611020 ) ) ( not ( = ?auto_611015 ?auto_611021 ) ) ( not ( = ?auto_611015 ?auto_611022 ) ) ( not ( = ?auto_611016 ?auto_611017 ) ) ( not ( = ?auto_611016 ?auto_611018 ) ) ( not ( = ?auto_611016 ?auto_611019 ) ) ( not ( = ?auto_611016 ?auto_611020 ) ) ( not ( = ?auto_611016 ?auto_611021 ) ) ( not ( = ?auto_611016 ?auto_611022 ) ) ( not ( = ?auto_611017 ?auto_611018 ) ) ( not ( = ?auto_611017 ?auto_611019 ) ) ( not ( = ?auto_611017 ?auto_611020 ) ) ( not ( = ?auto_611017 ?auto_611021 ) ) ( not ( = ?auto_611017 ?auto_611022 ) ) ( not ( = ?auto_611018 ?auto_611019 ) ) ( not ( = ?auto_611018 ?auto_611020 ) ) ( not ( = ?auto_611018 ?auto_611021 ) ) ( not ( = ?auto_611018 ?auto_611022 ) ) ( not ( = ?auto_611019 ?auto_611020 ) ) ( not ( = ?auto_611019 ?auto_611021 ) ) ( not ( = ?auto_611019 ?auto_611022 ) ) ( not ( = ?auto_611020 ?auto_611021 ) ) ( not ( = ?auto_611020 ?auto_611022 ) ) ( not ( = ?auto_611021 ?auto_611022 ) ) ( ON ?auto_611020 ?auto_611021 ) ( ON ?auto_611019 ?auto_611020 ) ( ON ?auto_611018 ?auto_611019 ) ( ON ?auto_611017 ?auto_611018 ) ( ON ?auto_611016 ?auto_611017 ) ( ON ?auto_611015 ?auto_611016 ) ( CLEAR ?auto_611013 ) ( ON ?auto_611014 ?auto_611015 ) ( CLEAR ?auto_611014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_611006 ?auto_611007 ?auto_611008 ?auto_611009 ?auto_611010 ?auto_611011 ?auto_611012 ?auto_611013 ?auto_611014 )
      ( MAKE-16PILE ?auto_611006 ?auto_611007 ?auto_611008 ?auto_611009 ?auto_611010 ?auto_611011 ?auto_611012 ?auto_611013 ?auto_611014 ?auto_611015 ?auto_611016 ?auto_611017 ?auto_611018 ?auto_611019 ?auto_611020 ?auto_611021 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_611072 - BLOCK
      ?auto_611073 - BLOCK
      ?auto_611074 - BLOCK
      ?auto_611075 - BLOCK
      ?auto_611076 - BLOCK
      ?auto_611077 - BLOCK
      ?auto_611078 - BLOCK
      ?auto_611079 - BLOCK
      ?auto_611080 - BLOCK
      ?auto_611081 - BLOCK
      ?auto_611082 - BLOCK
      ?auto_611083 - BLOCK
      ?auto_611084 - BLOCK
      ?auto_611085 - BLOCK
      ?auto_611086 - BLOCK
      ?auto_611087 - BLOCK
    )
    :vars
    (
      ?auto_611088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611087 ?auto_611088 ) ( ON-TABLE ?auto_611072 ) ( ON ?auto_611073 ?auto_611072 ) ( ON ?auto_611074 ?auto_611073 ) ( ON ?auto_611075 ?auto_611074 ) ( ON ?auto_611076 ?auto_611075 ) ( ON ?auto_611077 ?auto_611076 ) ( ON ?auto_611078 ?auto_611077 ) ( not ( = ?auto_611072 ?auto_611073 ) ) ( not ( = ?auto_611072 ?auto_611074 ) ) ( not ( = ?auto_611072 ?auto_611075 ) ) ( not ( = ?auto_611072 ?auto_611076 ) ) ( not ( = ?auto_611072 ?auto_611077 ) ) ( not ( = ?auto_611072 ?auto_611078 ) ) ( not ( = ?auto_611072 ?auto_611079 ) ) ( not ( = ?auto_611072 ?auto_611080 ) ) ( not ( = ?auto_611072 ?auto_611081 ) ) ( not ( = ?auto_611072 ?auto_611082 ) ) ( not ( = ?auto_611072 ?auto_611083 ) ) ( not ( = ?auto_611072 ?auto_611084 ) ) ( not ( = ?auto_611072 ?auto_611085 ) ) ( not ( = ?auto_611072 ?auto_611086 ) ) ( not ( = ?auto_611072 ?auto_611087 ) ) ( not ( = ?auto_611072 ?auto_611088 ) ) ( not ( = ?auto_611073 ?auto_611074 ) ) ( not ( = ?auto_611073 ?auto_611075 ) ) ( not ( = ?auto_611073 ?auto_611076 ) ) ( not ( = ?auto_611073 ?auto_611077 ) ) ( not ( = ?auto_611073 ?auto_611078 ) ) ( not ( = ?auto_611073 ?auto_611079 ) ) ( not ( = ?auto_611073 ?auto_611080 ) ) ( not ( = ?auto_611073 ?auto_611081 ) ) ( not ( = ?auto_611073 ?auto_611082 ) ) ( not ( = ?auto_611073 ?auto_611083 ) ) ( not ( = ?auto_611073 ?auto_611084 ) ) ( not ( = ?auto_611073 ?auto_611085 ) ) ( not ( = ?auto_611073 ?auto_611086 ) ) ( not ( = ?auto_611073 ?auto_611087 ) ) ( not ( = ?auto_611073 ?auto_611088 ) ) ( not ( = ?auto_611074 ?auto_611075 ) ) ( not ( = ?auto_611074 ?auto_611076 ) ) ( not ( = ?auto_611074 ?auto_611077 ) ) ( not ( = ?auto_611074 ?auto_611078 ) ) ( not ( = ?auto_611074 ?auto_611079 ) ) ( not ( = ?auto_611074 ?auto_611080 ) ) ( not ( = ?auto_611074 ?auto_611081 ) ) ( not ( = ?auto_611074 ?auto_611082 ) ) ( not ( = ?auto_611074 ?auto_611083 ) ) ( not ( = ?auto_611074 ?auto_611084 ) ) ( not ( = ?auto_611074 ?auto_611085 ) ) ( not ( = ?auto_611074 ?auto_611086 ) ) ( not ( = ?auto_611074 ?auto_611087 ) ) ( not ( = ?auto_611074 ?auto_611088 ) ) ( not ( = ?auto_611075 ?auto_611076 ) ) ( not ( = ?auto_611075 ?auto_611077 ) ) ( not ( = ?auto_611075 ?auto_611078 ) ) ( not ( = ?auto_611075 ?auto_611079 ) ) ( not ( = ?auto_611075 ?auto_611080 ) ) ( not ( = ?auto_611075 ?auto_611081 ) ) ( not ( = ?auto_611075 ?auto_611082 ) ) ( not ( = ?auto_611075 ?auto_611083 ) ) ( not ( = ?auto_611075 ?auto_611084 ) ) ( not ( = ?auto_611075 ?auto_611085 ) ) ( not ( = ?auto_611075 ?auto_611086 ) ) ( not ( = ?auto_611075 ?auto_611087 ) ) ( not ( = ?auto_611075 ?auto_611088 ) ) ( not ( = ?auto_611076 ?auto_611077 ) ) ( not ( = ?auto_611076 ?auto_611078 ) ) ( not ( = ?auto_611076 ?auto_611079 ) ) ( not ( = ?auto_611076 ?auto_611080 ) ) ( not ( = ?auto_611076 ?auto_611081 ) ) ( not ( = ?auto_611076 ?auto_611082 ) ) ( not ( = ?auto_611076 ?auto_611083 ) ) ( not ( = ?auto_611076 ?auto_611084 ) ) ( not ( = ?auto_611076 ?auto_611085 ) ) ( not ( = ?auto_611076 ?auto_611086 ) ) ( not ( = ?auto_611076 ?auto_611087 ) ) ( not ( = ?auto_611076 ?auto_611088 ) ) ( not ( = ?auto_611077 ?auto_611078 ) ) ( not ( = ?auto_611077 ?auto_611079 ) ) ( not ( = ?auto_611077 ?auto_611080 ) ) ( not ( = ?auto_611077 ?auto_611081 ) ) ( not ( = ?auto_611077 ?auto_611082 ) ) ( not ( = ?auto_611077 ?auto_611083 ) ) ( not ( = ?auto_611077 ?auto_611084 ) ) ( not ( = ?auto_611077 ?auto_611085 ) ) ( not ( = ?auto_611077 ?auto_611086 ) ) ( not ( = ?auto_611077 ?auto_611087 ) ) ( not ( = ?auto_611077 ?auto_611088 ) ) ( not ( = ?auto_611078 ?auto_611079 ) ) ( not ( = ?auto_611078 ?auto_611080 ) ) ( not ( = ?auto_611078 ?auto_611081 ) ) ( not ( = ?auto_611078 ?auto_611082 ) ) ( not ( = ?auto_611078 ?auto_611083 ) ) ( not ( = ?auto_611078 ?auto_611084 ) ) ( not ( = ?auto_611078 ?auto_611085 ) ) ( not ( = ?auto_611078 ?auto_611086 ) ) ( not ( = ?auto_611078 ?auto_611087 ) ) ( not ( = ?auto_611078 ?auto_611088 ) ) ( not ( = ?auto_611079 ?auto_611080 ) ) ( not ( = ?auto_611079 ?auto_611081 ) ) ( not ( = ?auto_611079 ?auto_611082 ) ) ( not ( = ?auto_611079 ?auto_611083 ) ) ( not ( = ?auto_611079 ?auto_611084 ) ) ( not ( = ?auto_611079 ?auto_611085 ) ) ( not ( = ?auto_611079 ?auto_611086 ) ) ( not ( = ?auto_611079 ?auto_611087 ) ) ( not ( = ?auto_611079 ?auto_611088 ) ) ( not ( = ?auto_611080 ?auto_611081 ) ) ( not ( = ?auto_611080 ?auto_611082 ) ) ( not ( = ?auto_611080 ?auto_611083 ) ) ( not ( = ?auto_611080 ?auto_611084 ) ) ( not ( = ?auto_611080 ?auto_611085 ) ) ( not ( = ?auto_611080 ?auto_611086 ) ) ( not ( = ?auto_611080 ?auto_611087 ) ) ( not ( = ?auto_611080 ?auto_611088 ) ) ( not ( = ?auto_611081 ?auto_611082 ) ) ( not ( = ?auto_611081 ?auto_611083 ) ) ( not ( = ?auto_611081 ?auto_611084 ) ) ( not ( = ?auto_611081 ?auto_611085 ) ) ( not ( = ?auto_611081 ?auto_611086 ) ) ( not ( = ?auto_611081 ?auto_611087 ) ) ( not ( = ?auto_611081 ?auto_611088 ) ) ( not ( = ?auto_611082 ?auto_611083 ) ) ( not ( = ?auto_611082 ?auto_611084 ) ) ( not ( = ?auto_611082 ?auto_611085 ) ) ( not ( = ?auto_611082 ?auto_611086 ) ) ( not ( = ?auto_611082 ?auto_611087 ) ) ( not ( = ?auto_611082 ?auto_611088 ) ) ( not ( = ?auto_611083 ?auto_611084 ) ) ( not ( = ?auto_611083 ?auto_611085 ) ) ( not ( = ?auto_611083 ?auto_611086 ) ) ( not ( = ?auto_611083 ?auto_611087 ) ) ( not ( = ?auto_611083 ?auto_611088 ) ) ( not ( = ?auto_611084 ?auto_611085 ) ) ( not ( = ?auto_611084 ?auto_611086 ) ) ( not ( = ?auto_611084 ?auto_611087 ) ) ( not ( = ?auto_611084 ?auto_611088 ) ) ( not ( = ?auto_611085 ?auto_611086 ) ) ( not ( = ?auto_611085 ?auto_611087 ) ) ( not ( = ?auto_611085 ?auto_611088 ) ) ( not ( = ?auto_611086 ?auto_611087 ) ) ( not ( = ?auto_611086 ?auto_611088 ) ) ( not ( = ?auto_611087 ?auto_611088 ) ) ( ON ?auto_611086 ?auto_611087 ) ( ON ?auto_611085 ?auto_611086 ) ( ON ?auto_611084 ?auto_611085 ) ( ON ?auto_611083 ?auto_611084 ) ( ON ?auto_611082 ?auto_611083 ) ( ON ?auto_611081 ?auto_611082 ) ( ON ?auto_611080 ?auto_611081 ) ( CLEAR ?auto_611078 ) ( ON ?auto_611079 ?auto_611080 ) ( CLEAR ?auto_611079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_611072 ?auto_611073 ?auto_611074 ?auto_611075 ?auto_611076 ?auto_611077 ?auto_611078 ?auto_611079 )
      ( MAKE-16PILE ?auto_611072 ?auto_611073 ?auto_611074 ?auto_611075 ?auto_611076 ?auto_611077 ?auto_611078 ?auto_611079 ?auto_611080 ?auto_611081 ?auto_611082 ?auto_611083 ?auto_611084 ?auto_611085 ?auto_611086 ?auto_611087 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_611138 - BLOCK
      ?auto_611139 - BLOCK
      ?auto_611140 - BLOCK
      ?auto_611141 - BLOCK
      ?auto_611142 - BLOCK
      ?auto_611143 - BLOCK
      ?auto_611144 - BLOCK
      ?auto_611145 - BLOCK
      ?auto_611146 - BLOCK
      ?auto_611147 - BLOCK
      ?auto_611148 - BLOCK
      ?auto_611149 - BLOCK
      ?auto_611150 - BLOCK
      ?auto_611151 - BLOCK
      ?auto_611152 - BLOCK
      ?auto_611153 - BLOCK
    )
    :vars
    (
      ?auto_611154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611153 ?auto_611154 ) ( ON-TABLE ?auto_611138 ) ( ON ?auto_611139 ?auto_611138 ) ( ON ?auto_611140 ?auto_611139 ) ( ON ?auto_611141 ?auto_611140 ) ( ON ?auto_611142 ?auto_611141 ) ( ON ?auto_611143 ?auto_611142 ) ( not ( = ?auto_611138 ?auto_611139 ) ) ( not ( = ?auto_611138 ?auto_611140 ) ) ( not ( = ?auto_611138 ?auto_611141 ) ) ( not ( = ?auto_611138 ?auto_611142 ) ) ( not ( = ?auto_611138 ?auto_611143 ) ) ( not ( = ?auto_611138 ?auto_611144 ) ) ( not ( = ?auto_611138 ?auto_611145 ) ) ( not ( = ?auto_611138 ?auto_611146 ) ) ( not ( = ?auto_611138 ?auto_611147 ) ) ( not ( = ?auto_611138 ?auto_611148 ) ) ( not ( = ?auto_611138 ?auto_611149 ) ) ( not ( = ?auto_611138 ?auto_611150 ) ) ( not ( = ?auto_611138 ?auto_611151 ) ) ( not ( = ?auto_611138 ?auto_611152 ) ) ( not ( = ?auto_611138 ?auto_611153 ) ) ( not ( = ?auto_611138 ?auto_611154 ) ) ( not ( = ?auto_611139 ?auto_611140 ) ) ( not ( = ?auto_611139 ?auto_611141 ) ) ( not ( = ?auto_611139 ?auto_611142 ) ) ( not ( = ?auto_611139 ?auto_611143 ) ) ( not ( = ?auto_611139 ?auto_611144 ) ) ( not ( = ?auto_611139 ?auto_611145 ) ) ( not ( = ?auto_611139 ?auto_611146 ) ) ( not ( = ?auto_611139 ?auto_611147 ) ) ( not ( = ?auto_611139 ?auto_611148 ) ) ( not ( = ?auto_611139 ?auto_611149 ) ) ( not ( = ?auto_611139 ?auto_611150 ) ) ( not ( = ?auto_611139 ?auto_611151 ) ) ( not ( = ?auto_611139 ?auto_611152 ) ) ( not ( = ?auto_611139 ?auto_611153 ) ) ( not ( = ?auto_611139 ?auto_611154 ) ) ( not ( = ?auto_611140 ?auto_611141 ) ) ( not ( = ?auto_611140 ?auto_611142 ) ) ( not ( = ?auto_611140 ?auto_611143 ) ) ( not ( = ?auto_611140 ?auto_611144 ) ) ( not ( = ?auto_611140 ?auto_611145 ) ) ( not ( = ?auto_611140 ?auto_611146 ) ) ( not ( = ?auto_611140 ?auto_611147 ) ) ( not ( = ?auto_611140 ?auto_611148 ) ) ( not ( = ?auto_611140 ?auto_611149 ) ) ( not ( = ?auto_611140 ?auto_611150 ) ) ( not ( = ?auto_611140 ?auto_611151 ) ) ( not ( = ?auto_611140 ?auto_611152 ) ) ( not ( = ?auto_611140 ?auto_611153 ) ) ( not ( = ?auto_611140 ?auto_611154 ) ) ( not ( = ?auto_611141 ?auto_611142 ) ) ( not ( = ?auto_611141 ?auto_611143 ) ) ( not ( = ?auto_611141 ?auto_611144 ) ) ( not ( = ?auto_611141 ?auto_611145 ) ) ( not ( = ?auto_611141 ?auto_611146 ) ) ( not ( = ?auto_611141 ?auto_611147 ) ) ( not ( = ?auto_611141 ?auto_611148 ) ) ( not ( = ?auto_611141 ?auto_611149 ) ) ( not ( = ?auto_611141 ?auto_611150 ) ) ( not ( = ?auto_611141 ?auto_611151 ) ) ( not ( = ?auto_611141 ?auto_611152 ) ) ( not ( = ?auto_611141 ?auto_611153 ) ) ( not ( = ?auto_611141 ?auto_611154 ) ) ( not ( = ?auto_611142 ?auto_611143 ) ) ( not ( = ?auto_611142 ?auto_611144 ) ) ( not ( = ?auto_611142 ?auto_611145 ) ) ( not ( = ?auto_611142 ?auto_611146 ) ) ( not ( = ?auto_611142 ?auto_611147 ) ) ( not ( = ?auto_611142 ?auto_611148 ) ) ( not ( = ?auto_611142 ?auto_611149 ) ) ( not ( = ?auto_611142 ?auto_611150 ) ) ( not ( = ?auto_611142 ?auto_611151 ) ) ( not ( = ?auto_611142 ?auto_611152 ) ) ( not ( = ?auto_611142 ?auto_611153 ) ) ( not ( = ?auto_611142 ?auto_611154 ) ) ( not ( = ?auto_611143 ?auto_611144 ) ) ( not ( = ?auto_611143 ?auto_611145 ) ) ( not ( = ?auto_611143 ?auto_611146 ) ) ( not ( = ?auto_611143 ?auto_611147 ) ) ( not ( = ?auto_611143 ?auto_611148 ) ) ( not ( = ?auto_611143 ?auto_611149 ) ) ( not ( = ?auto_611143 ?auto_611150 ) ) ( not ( = ?auto_611143 ?auto_611151 ) ) ( not ( = ?auto_611143 ?auto_611152 ) ) ( not ( = ?auto_611143 ?auto_611153 ) ) ( not ( = ?auto_611143 ?auto_611154 ) ) ( not ( = ?auto_611144 ?auto_611145 ) ) ( not ( = ?auto_611144 ?auto_611146 ) ) ( not ( = ?auto_611144 ?auto_611147 ) ) ( not ( = ?auto_611144 ?auto_611148 ) ) ( not ( = ?auto_611144 ?auto_611149 ) ) ( not ( = ?auto_611144 ?auto_611150 ) ) ( not ( = ?auto_611144 ?auto_611151 ) ) ( not ( = ?auto_611144 ?auto_611152 ) ) ( not ( = ?auto_611144 ?auto_611153 ) ) ( not ( = ?auto_611144 ?auto_611154 ) ) ( not ( = ?auto_611145 ?auto_611146 ) ) ( not ( = ?auto_611145 ?auto_611147 ) ) ( not ( = ?auto_611145 ?auto_611148 ) ) ( not ( = ?auto_611145 ?auto_611149 ) ) ( not ( = ?auto_611145 ?auto_611150 ) ) ( not ( = ?auto_611145 ?auto_611151 ) ) ( not ( = ?auto_611145 ?auto_611152 ) ) ( not ( = ?auto_611145 ?auto_611153 ) ) ( not ( = ?auto_611145 ?auto_611154 ) ) ( not ( = ?auto_611146 ?auto_611147 ) ) ( not ( = ?auto_611146 ?auto_611148 ) ) ( not ( = ?auto_611146 ?auto_611149 ) ) ( not ( = ?auto_611146 ?auto_611150 ) ) ( not ( = ?auto_611146 ?auto_611151 ) ) ( not ( = ?auto_611146 ?auto_611152 ) ) ( not ( = ?auto_611146 ?auto_611153 ) ) ( not ( = ?auto_611146 ?auto_611154 ) ) ( not ( = ?auto_611147 ?auto_611148 ) ) ( not ( = ?auto_611147 ?auto_611149 ) ) ( not ( = ?auto_611147 ?auto_611150 ) ) ( not ( = ?auto_611147 ?auto_611151 ) ) ( not ( = ?auto_611147 ?auto_611152 ) ) ( not ( = ?auto_611147 ?auto_611153 ) ) ( not ( = ?auto_611147 ?auto_611154 ) ) ( not ( = ?auto_611148 ?auto_611149 ) ) ( not ( = ?auto_611148 ?auto_611150 ) ) ( not ( = ?auto_611148 ?auto_611151 ) ) ( not ( = ?auto_611148 ?auto_611152 ) ) ( not ( = ?auto_611148 ?auto_611153 ) ) ( not ( = ?auto_611148 ?auto_611154 ) ) ( not ( = ?auto_611149 ?auto_611150 ) ) ( not ( = ?auto_611149 ?auto_611151 ) ) ( not ( = ?auto_611149 ?auto_611152 ) ) ( not ( = ?auto_611149 ?auto_611153 ) ) ( not ( = ?auto_611149 ?auto_611154 ) ) ( not ( = ?auto_611150 ?auto_611151 ) ) ( not ( = ?auto_611150 ?auto_611152 ) ) ( not ( = ?auto_611150 ?auto_611153 ) ) ( not ( = ?auto_611150 ?auto_611154 ) ) ( not ( = ?auto_611151 ?auto_611152 ) ) ( not ( = ?auto_611151 ?auto_611153 ) ) ( not ( = ?auto_611151 ?auto_611154 ) ) ( not ( = ?auto_611152 ?auto_611153 ) ) ( not ( = ?auto_611152 ?auto_611154 ) ) ( not ( = ?auto_611153 ?auto_611154 ) ) ( ON ?auto_611152 ?auto_611153 ) ( ON ?auto_611151 ?auto_611152 ) ( ON ?auto_611150 ?auto_611151 ) ( ON ?auto_611149 ?auto_611150 ) ( ON ?auto_611148 ?auto_611149 ) ( ON ?auto_611147 ?auto_611148 ) ( ON ?auto_611146 ?auto_611147 ) ( ON ?auto_611145 ?auto_611146 ) ( CLEAR ?auto_611143 ) ( ON ?auto_611144 ?auto_611145 ) ( CLEAR ?auto_611144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_611138 ?auto_611139 ?auto_611140 ?auto_611141 ?auto_611142 ?auto_611143 ?auto_611144 )
      ( MAKE-16PILE ?auto_611138 ?auto_611139 ?auto_611140 ?auto_611141 ?auto_611142 ?auto_611143 ?auto_611144 ?auto_611145 ?auto_611146 ?auto_611147 ?auto_611148 ?auto_611149 ?auto_611150 ?auto_611151 ?auto_611152 ?auto_611153 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_611204 - BLOCK
      ?auto_611205 - BLOCK
      ?auto_611206 - BLOCK
      ?auto_611207 - BLOCK
      ?auto_611208 - BLOCK
      ?auto_611209 - BLOCK
      ?auto_611210 - BLOCK
      ?auto_611211 - BLOCK
      ?auto_611212 - BLOCK
      ?auto_611213 - BLOCK
      ?auto_611214 - BLOCK
      ?auto_611215 - BLOCK
      ?auto_611216 - BLOCK
      ?auto_611217 - BLOCK
      ?auto_611218 - BLOCK
      ?auto_611219 - BLOCK
    )
    :vars
    (
      ?auto_611220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611219 ?auto_611220 ) ( ON-TABLE ?auto_611204 ) ( ON ?auto_611205 ?auto_611204 ) ( ON ?auto_611206 ?auto_611205 ) ( ON ?auto_611207 ?auto_611206 ) ( ON ?auto_611208 ?auto_611207 ) ( not ( = ?auto_611204 ?auto_611205 ) ) ( not ( = ?auto_611204 ?auto_611206 ) ) ( not ( = ?auto_611204 ?auto_611207 ) ) ( not ( = ?auto_611204 ?auto_611208 ) ) ( not ( = ?auto_611204 ?auto_611209 ) ) ( not ( = ?auto_611204 ?auto_611210 ) ) ( not ( = ?auto_611204 ?auto_611211 ) ) ( not ( = ?auto_611204 ?auto_611212 ) ) ( not ( = ?auto_611204 ?auto_611213 ) ) ( not ( = ?auto_611204 ?auto_611214 ) ) ( not ( = ?auto_611204 ?auto_611215 ) ) ( not ( = ?auto_611204 ?auto_611216 ) ) ( not ( = ?auto_611204 ?auto_611217 ) ) ( not ( = ?auto_611204 ?auto_611218 ) ) ( not ( = ?auto_611204 ?auto_611219 ) ) ( not ( = ?auto_611204 ?auto_611220 ) ) ( not ( = ?auto_611205 ?auto_611206 ) ) ( not ( = ?auto_611205 ?auto_611207 ) ) ( not ( = ?auto_611205 ?auto_611208 ) ) ( not ( = ?auto_611205 ?auto_611209 ) ) ( not ( = ?auto_611205 ?auto_611210 ) ) ( not ( = ?auto_611205 ?auto_611211 ) ) ( not ( = ?auto_611205 ?auto_611212 ) ) ( not ( = ?auto_611205 ?auto_611213 ) ) ( not ( = ?auto_611205 ?auto_611214 ) ) ( not ( = ?auto_611205 ?auto_611215 ) ) ( not ( = ?auto_611205 ?auto_611216 ) ) ( not ( = ?auto_611205 ?auto_611217 ) ) ( not ( = ?auto_611205 ?auto_611218 ) ) ( not ( = ?auto_611205 ?auto_611219 ) ) ( not ( = ?auto_611205 ?auto_611220 ) ) ( not ( = ?auto_611206 ?auto_611207 ) ) ( not ( = ?auto_611206 ?auto_611208 ) ) ( not ( = ?auto_611206 ?auto_611209 ) ) ( not ( = ?auto_611206 ?auto_611210 ) ) ( not ( = ?auto_611206 ?auto_611211 ) ) ( not ( = ?auto_611206 ?auto_611212 ) ) ( not ( = ?auto_611206 ?auto_611213 ) ) ( not ( = ?auto_611206 ?auto_611214 ) ) ( not ( = ?auto_611206 ?auto_611215 ) ) ( not ( = ?auto_611206 ?auto_611216 ) ) ( not ( = ?auto_611206 ?auto_611217 ) ) ( not ( = ?auto_611206 ?auto_611218 ) ) ( not ( = ?auto_611206 ?auto_611219 ) ) ( not ( = ?auto_611206 ?auto_611220 ) ) ( not ( = ?auto_611207 ?auto_611208 ) ) ( not ( = ?auto_611207 ?auto_611209 ) ) ( not ( = ?auto_611207 ?auto_611210 ) ) ( not ( = ?auto_611207 ?auto_611211 ) ) ( not ( = ?auto_611207 ?auto_611212 ) ) ( not ( = ?auto_611207 ?auto_611213 ) ) ( not ( = ?auto_611207 ?auto_611214 ) ) ( not ( = ?auto_611207 ?auto_611215 ) ) ( not ( = ?auto_611207 ?auto_611216 ) ) ( not ( = ?auto_611207 ?auto_611217 ) ) ( not ( = ?auto_611207 ?auto_611218 ) ) ( not ( = ?auto_611207 ?auto_611219 ) ) ( not ( = ?auto_611207 ?auto_611220 ) ) ( not ( = ?auto_611208 ?auto_611209 ) ) ( not ( = ?auto_611208 ?auto_611210 ) ) ( not ( = ?auto_611208 ?auto_611211 ) ) ( not ( = ?auto_611208 ?auto_611212 ) ) ( not ( = ?auto_611208 ?auto_611213 ) ) ( not ( = ?auto_611208 ?auto_611214 ) ) ( not ( = ?auto_611208 ?auto_611215 ) ) ( not ( = ?auto_611208 ?auto_611216 ) ) ( not ( = ?auto_611208 ?auto_611217 ) ) ( not ( = ?auto_611208 ?auto_611218 ) ) ( not ( = ?auto_611208 ?auto_611219 ) ) ( not ( = ?auto_611208 ?auto_611220 ) ) ( not ( = ?auto_611209 ?auto_611210 ) ) ( not ( = ?auto_611209 ?auto_611211 ) ) ( not ( = ?auto_611209 ?auto_611212 ) ) ( not ( = ?auto_611209 ?auto_611213 ) ) ( not ( = ?auto_611209 ?auto_611214 ) ) ( not ( = ?auto_611209 ?auto_611215 ) ) ( not ( = ?auto_611209 ?auto_611216 ) ) ( not ( = ?auto_611209 ?auto_611217 ) ) ( not ( = ?auto_611209 ?auto_611218 ) ) ( not ( = ?auto_611209 ?auto_611219 ) ) ( not ( = ?auto_611209 ?auto_611220 ) ) ( not ( = ?auto_611210 ?auto_611211 ) ) ( not ( = ?auto_611210 ?auto_611212 ) ) ( not ( = ?auto_611210 ?auto_611213 ) ) ( not ( = ?auto_611210 ?auto_611214 ) ) ( not ( = ?auto_611210 ?auto_611215 ) ) ( not ( = ?auto_611210 ?auto_611216 ) ) ( not ( = ?auto_611210 ?auto_611217 ) ) ( not ( = ?auto_611210 ?auto_611218 ) ) ( not ( = ?auto_611210 ?auto_611219 ) ) ( not ( = ?auto_611210 ?auto_611220 ) ) ( not ( = ?auto_611211 ?auto_611212 ) ) ( not ( = ?auto_611211 ?auto_611213 ) ) ( not ( = ?auto_611211 ?auto_611214 ) ) ( not ( = ?auto_611211 ?auto_611215 ) ) ( not ( = ?auto_611211 ?auto_611216 ) ) ( not ( = ?auto_611211 ?auto_611217 ) ) ( not ( = ?auto_611211 ?auto_611218 ) ) ( not ( = ?auto_611211 ?auto_611219 ) ) ( not ( = ?auto_611211 ?auto_611220 ) ) ( not ( = ?auto_611212 ?auto_611213 ) ) ( not ( = ?auto_611212 ?auto_611214 ) ) ( not ( = ?auto_611212 ?auto_611215 ) ) ( not ( = ?auto_611212 ?auto_611216 ) ) ( not ( = ?auto_611212 ?auto_611217 ) ) ( not ( = ?auto_611212 ?auto_611218 ) ) ( not ( = ?auto_611212 ?auto_611219 ) ) ( not ( = ?auto_611212 ?auto_611220 ) ) ( not ( = ?auto_611213 ?auto_611214 ) ) ( not ( = ?auto_611213 ?auto_611215 ) ) ( not ( = ?auto_611213 ?auto_611216 ) ) ( not ( = ?auto_611213 ?auto_611217 ) ) ( not ( = ?auto_611213 ?auto_611218 ) ) ( not ( = ?auto_611213 ?auto_611219 ) ) ( not ( = ?auto_611213 ?auto_611220 ) ) ( not ( = ?auto_611214 ?auto_611215 ) ) ( not ( = ?auto_611214 ?auto_611216 ) ) ( not ( = ?auto_611214 ?auto_611217 ) ) ( not ( = ?auto_611214 ?auto_611218 ) ) ( not ( = ?auto_611214 ?auto_611219 ) ) ( not ( = ?auto_611214 ?auto_611220 ) ) ( not ( = ?auto_611215 ?auto_611216 ) ) ( not ( = ?auto_611215 ?auto_611217 ) ) ( not ( = ?auto_611215 ?auto_611218 ) ) ( not ( = ?auto_611215 ?auto_611219 ) ) ( not ( = ?auto_611215 ?auto_611220 ) ) ( not ( = ?auto_611216 ?auto_611217 ) ) ( not ( = ?auto_611216 ?auto_611218 ) ) ( not ( = ?auto_611216 ?auto_611219 ) ) ( not ( = ?auto_611216 ?auto_611220 ) ) ( not ( = ?auto_611217 ?auto_611218 ) ) ( not ( = ?auto_611217 ?auto_611219 ) ) ( not ( = ?auto_611217 ?auto_611220 ) ) ( not ( = ?auto_611218 ?auto_611219 ) ) ( not ( = ?auto_611218 ?auto_611220 ) ) ( not ( = ?auto_611219 ?auto_611220 ) ) ( ON ?auto_611218 ?auto_611219 ) ( ON ?auto_611217 ?auto_611218 ) ( ON ?auto_611216 ?auto_611217 ) ( ON ?auto_611215 ?auto_611216 ) ( ON ?auto_611214 ?auto_611215 ) ( ON ?auto_611213 ?auto_611214 ) ( ON ?auto_611212 ?auto_611213 ) ( ON ?auto_611211 ?auto_611212 ) ( ON ?auto_611210 ?auto_611211 ) ( CLEAR ?auto_611208 ) ( ON ?auto_611209 ?auto_611210 ) ( CLEAR ?auto_611209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_611204 ?auto_611205 ?auto_611206 ?auto_611207 ?auto_611208 ?auto_611209 )
      ( MAKE-16PILE ?auto_611204 ?auto_611205 ?auto_611206 ?auto_611207 ?auto_611208 ?auto_611209 ?auto_611210 ?auto_611211 ?auto_611212 ?auto_611213 ?auto_611214 ?auto_611215 ?auto_611216 ?auto_611217 ?auto_611218 ?auto_611219 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_611270 - BLOCK
      ?auto_611271 - BLOCK
      ?auto_611272 - BLOCK
      ?auto_611273 - BLOCK
      ?auto_611274 - BLOCK
      ?auto_611275 - BLOCK
      ?auto_611276 - BLOCK
      ?auto_611277 - BLOCK
      ?auto_611278 - BLOCK
      ?auto_611279 - BLOCK
      ?auto_611280 - BLOCK
      ?auto_611281 - BLOCK
      ?auto_611282 - BLOCK
      ?auto_611283 - BLOCK
      ?auto_611284 - BLOCK
      ?auto_611285 - BLOCK
    )
    :vars
    (
      ?auto_611286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611285 ?auto_611286 ) ( ON-TABLE ?auto_611270 ) ( ON ?auto_611271 ?auto_611270 ) ( ON ?auto_611272 ?auto_611271 ) ( ON ?auto_611273 ?auto_611272 ) ( not ( = ?auto_611270 ?auto_611271 ) ) ( not ( = ?auto_611270 ?auto_611272 ) ) ( not ( = ?auto_611270 ?auto_611273 ) ) ( not ( = ?auto_611270 ?auto_611274 ) ) ( not ( = ?auto_611270 ?auto_611275 ) ) ( not ( = ?auto_611270 ?auto_611276 ) ) ( not ( = ?auto_611270 ?auto_611277 ) ) ( not ( = ?auto_611270 ?auto_611278 ) ) ( not ( = ?auto_611270 ?auto_611279 ) ) ( not ( = ?auto_611270 ?auto_611280 ) ) ( not ( = ?auto_611270 ?auto_611281 ) ) ( not ( = ?auto_611270 ?auto_611282 ) ) ( not ( = ?auto_611270 ?auto_611283 ) ) ( not ( = ?auto_611270 ?auto_611284 ) ) ( not ( = ?auto_611270 ?auto_611285 ) ) ( not ( = ?auto_611270 ?auto_611286 ) ) ( not ( = ?auto_611271 ?auto_611272 ) ) ( not ( = ?auto_611271 ?auto_611273 ) ) ( not ( = ?auto_611271 ?auto_611274 ) ) ( not ( = ?auto_611271 ?auto_611275 ) ) ( not ( = ?auto_611271 ?auto_611276 ) ) ( not ( = ?auto_611271 ?auto_611277 ) ) ( not ( = ?auto_611271 ?auto_611278 ) ) ( not ( = ?auto_611271 ?auto_611279 ) ) ( not ( = ?auto_611271 ?auto_611280 ) ) ( not ( = ?auto_611271 ?auto_611281 ) ) ( not ( = ?auto_611271 ?auto_611282 ) ) ( not ( = ?auto_611271 ?auto_611283 ) ) ( not ( = ?auto_611271 ?auto_611284 ) ) ( not ( = ?auto_611271 ?auto_611285 ) ) ( not ( = ?auto_611271 ?auto_611286 ) ) ( not ( = ?auto_611272 ?auto_611273 ) ) ( not ( = ?auto_611272 ?auto_611274 ) ) ( not ( = ?auto_611272 ?auto_611275 ) ) ( not ( = ?auto_611272 ?auto_611276 ) ) ( not ( = ?auto_611272 ?auto_611277 ) ) ( not ( = ?auto_611272 ?auto_611278 ) ) ( not ( = ?auto_611272 ?auto_611279 ) ) ( not ( = ?auto_611272 ?auto_611280 ) ) ( not ( = ?auto_611272 ?auto_611281 ) ) ( not ( = ?auto_611272 ?auto_611282 ) ) ( not ( = ?auto_611272 ?auto_611283 ) ) ( not ( = ?auto_611272 ?auto_611284 ) ) ( not ( = ?auto_611272 ?auto_611285 ) ) ( not ( = ?auto_611272 ?auto_611286 ) ) ( not ( = ?auto_611273 ?auto_611274 ) ) ( not ( = ?auto_611273 ?auto_611275 ) ) ( not ( = ?auto_611273 ?auto_611276 ) ) ( not ( = ?auto_611273 ?auto_611277 ) ) ( not ( = ?auto_611273 ?auto_611278 ) ) ( not ( = ?auto_611273 ?auto_611279 ) ) ( not ( = ?auto_611273 ?auto_611280 ) ) ( not ( = ?auto_611273 ?auto_611281 ) ) ( not ( = ?auto_611273 ?auto_611282 ) ) ( not ( = ?auto_611273 ?auto_611283 ) ) ( not ( = ?auto_611273 ?auto_611284 ) ) ( not ( = ?auto_611273 ?auto_611285 ) ) ( not ( = ?auto_611273 ?auto_611286 ) ) ( not ( = ?auto_611274 ?auto_611275 ) ) ( not ( = ?auto_611274 ?auto_611276 ) ) ( not ( = ?auto_611274 ?auto_611277 ) ) ( not ( = ?auto_611274 ?auto_611278 ) ) ( not ( = ?auto_611274 ?auto_611279 ) ) ( not ( = ?auto_611274 ?auto_611280 ) ) ( not ( = ?auto_611274 ?auto_611281 ) ) ( not ( = ?auto_611274 ?auto_611282 ) ) ( not ( = ?auto_611274 ?auto_611283 ) ) ( not ( = ?auto_611274 ?auto_611284 ) ) ( not ( = ?auto_611274 ?auto_611285 ) ) ( not ( = ?auto_611274 ?auto_611286 ) ) ( not ( = ?auto_611275 ?auto_611276 ) ) ( not ( = ?auto_611275 ?auto_611277 ) ) ( not ( = ?auto_611275 ?auto_611278 ) ) ( not ( = ?auto_611275 ?auto_611279 ) ) ( not ( = ?auto_611275 ?auto_611280 ) ) ( not ( = ?auto_611275 ?auto_611281 ) ) ( not ( = ?auto_611275 ?auto_611282 ) ) ( not ( = ?auto_611275 ?auto_611283 ) ) ( not ( = ?auto_611275 ?auto_611284 ) ) ( not ( = ?auto_611275 ?auto_611285 ) ) ( not ( = ?auto_611275 ?auto_611286 ) ) ( not ( = ?auto_611276 ?auto_611277 ) ) ( not ( = ?auto_611276 ?auto_611278 ) ) ( not ( = ?auto_611276 ?auto_611279 ) ) ( not ( = ?auto_611276 ?auto_611280 ) ) ( not ( = ?auto_611276 ?auto_611281 ) ) ( not ( = ?auto_611276 ?auto_611282 ) ) ( not ( = ?auto_611276 ?auto_611283 ) ) ( not ( = ?auto_611276 ?auto_611284 ) ) ( not ( = ?auto_611276 ?auto_611285 ) ) ( not ( = ?auto_611276 ?auto_611286 ) ) ( not ( = ?auto_611277 ?auto_611278 ) ) ( not ( = ?auto_611277 ?auto_611279 ) ) ( not ( = ?auto_611277 ?auto_611280 ) ) ( not ( = ?auto_611277 ?auto_611281 ) ) ( not ( = ?auto_611277 ?auto_611282 ) ) ( not ( = ?auto_611277 ?auto_611283 ) ) ( not ( = ?auto_611277 ?auto_611284 ) ) ( not ( = ?auto_611277 ?auto_611285 ) ) ( not ( = ?auto_611277 ?auto_611286 ) ) ( not ( = ?auto_611278 ?auto_611279 ) ) ( not ( = ?auto_611278 ?auto_611280 ) ) ( not ( = ?auto_611278 ?auto_611281 ) ) ( not ( = ?auto_611278 ?auto_611282 ) ) ( not ( = ?auto_611278 ?auto_611283 ) ) ( not ( = ?auto_611278 ?auto_611284 ) ) ( not ( = ?auto_611278 ?auto_611285 ) ) ( not ( = ?auto_611278 ?auto_611286 ) ) ( not ( = ?auto_611279 ?auto_611280 ) ) ( not ( = ?auto_611279 ?auto_611281 ) ) ( not ( = ?auto_611279 ?auto_611282 ) ) ( not ( = ?auto_611279 ?auto_611283 ) ) ( not ( = ?auto_611279 ?auto_611284 ) ) ( not ( = ?auto_611279 ?auto_611285 ) ) ( not ( = ?auto_611279 ?auto_611286 ) ) ( not ( = ?auto_611280 ?auto_611281 ) ) ( not ( = ?auto_611280 ?auto_611282 ) ) ( not ( = ?auto_611280 ?auto_611283 ) ) ( not ( = ?auto_611280 ?auto_611284 ) ) ( not ( = ?auto_611280 ?auto_611285 ) ) ( not ( = ?auto_611280 ?auto_611286 ) ) ( not ( = ?auto_611281 ?auto_611282 ) ) ( not ( = ?auto_611281 ?auto_611283 ) ) ( not ( = ?auto_611281 ?auto_611284 ) ) ( not ( = ?auto_611281 ?auto_611285 ) ) ( not ( = ?auto_611281 ?auto_611286 ) ) ( not ( = ?auto_611282 ?auto_611283 ) ) ( not ( = ?auto_611282 ?auto_611284 ) ) ( not ( = ?auto_611282 ?auto_611285 ) ) ( not ( = ?auto_611282 ?auto_611286 ) ) ( not ( = ?auto_611283 ?auto_611284 ) ) ( not ( = ?auto_611283 ?auto_611285 ) ) ( not ( = ?auto_611283 ?auto_611286 ) ) ( not ( = ?auto_611284 ?auto_611285 ) ) ( not ( = ?auto_611284 ?auto_611286 ) ) ( not ( = ?auto_611285 ?auto_611286 ) ) ( ON ?auto_611284 ?auto_611285 ) ( ON ?auto_611283 ?auto_611284 ) ( ON ?auto_611282 ?auto_611283 ) ( ON ?auto_611281 ?auto_611282 ) ( ON ?auto_611280 ?auto_611281 ) ( ON ?auto_611279 ?auto_611280 ) ( ON ?auto_611278 ?auto_611279 ) ( ON ?auto_611277 ?auto_611278 ) ( ON ?auto_611276 ?auto_611277 ) ( ON ?auto_611275 ?auto_611276 ) ( CLEAR ?auto_611273 ) ( ON ?auto_611274 ?auto_611275 ) ( CLEAR ?auto_611274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_611270 ?auto_611271 ?auto_611272 ?auto_611273 ?auto_611274 )
      ( MAKE-16PILE ?auto_611270 ?auto_611271 ?auto_611272 ?auto_611273 ?auto_611274 ?auto_611275 ?auto_611276 ?auto_611277 ?auto_611278 ?auto_611279 ?auto_611280 ?auto_611281 ?auto_611282 ?auto_611283 ?auto_611284 ?auto_611285 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_611336 - BLOCK
      ?auto_611337 - BLOCK
      ?auto_611338 - BLOCK
      ?auto_611339 - BLOCK
      ?auto_611340 - BLOCK
      ?auto_611341 - BLOCK
      ?auto_611342 - BLOCK
      ?auto_611343 - BLOCK
      ?auto_611344 - BLOCK
      ?auto_611345 - BLOCK
      ?auto_611346 - BLOCK
      ?auto_611347 - BLOCK
      ?auto_611348 - BLOCK
      ?auto_611349 - BLOCK
      ?auto_611350 - BLOCK
      ?auto_611351 - BLOCK
    )
    :vars
    (
      ?auto_611352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611351 ?auto_611352 ) ( ON-TABLE ?auto_611336 ) ( ON ?auto_611337 ?auto_611336 ) ( ON ?auto_611338 ?auto_611337 ) ( not ( = ?auto_611336 ?auto_611337 ) ) ( not ( = ?auto_611336 ?auto_611338 ) ) ( not ( = ?auto_611336 ?auto_611339 ) ) ( not ( = ?auto_611336 ?auto_611340 ) ) ( not ( = ?auto_611336 ?auto_611341 ) ) ( not ( = ?auto_611336 ?auto_611342 ) ) ( not ( = ?auto_611336 ?auto_611343 ) ) ( not ( = ?auto_611336 ?auto_611344 ) ) ( not ( = ?auto_611336 ?auto_611345 ) ) ( not ( = ?auto_611336 ?auto_611346 ) ) ( not ( = ?auto_611336 ?auto_611347 ) ) ( not ( = ?auto_611336 ?auto_611348 ) ) ( not ( = ?auto_611336 ?auto_611349 ) ) ( not ( = ?auto_611336 ?auto_611350 ) ) ( not ( = ?auto_611336 ?auto_611351 ) ) ( not ( = ?auto_611336 ?auto_611352 ) ) ( not ( = ?auto_611337 ?auto_611338 ) ) ( not ( = ?auto_611337 ?auto_611339 ) ) ( not ( = ?auto_611337 ?auto_611340 ) ) ( not ( = ?auto_611337 ?auto_611341 ) ) ( not ( = ?auto_611337 ?auto_611342 ) ) ( not ( = ?auto_611337 ?auto_611343 ) ) ( not ( = ?auto_611337 ?auto_611344 ) ) ( not ( = ?auto_611337 ?auto_611345 ) ) ( not ( = ?auto_611337 ?auto_611346 ) ) ( not ( = ?auto_611337 ?auto_611347 ) ) ( not ( = ?auto_611337 ?auto_611348 ) ) ( not ( = ?auto_611337 ?auto_611349 ) ) ( not ( = ?auto_611337 ?auto_611350 ) ) ( not ( = ?auto_611337 ?auto_611351 ) ) ( not ( = ?auto_611337 ?auto_611352 ) ) ( not ( = ?auto_611338 ?auto_611339 ) ) ( not ( = ?auto_611338 ?auto_611340 ) ) ( not ( = ?auto_611338 ?auto_611341 ) ) ( not ( = ?auto_611338 ?auto_611342 ) ) ( not ( = ?auto_611338 ?auto_611343 ) ) ( not ( = ?auto_611338 ?auto_611344 ) ) ( not ( = ?auto_611338 ?auto_611345 ) ) ( not ( = ?auto_611338 ?auto_611346 ) ) ( not ( = ?auto_611338 ?auto_611347 ) ) ( not ( = ?auto_611338 ?auto_611348 ) ) ( not ( = ?auto_611338 ?auto_611349 ) ) ( not ( = ?auto_611338 ?auto_611350 ) ) ( not ( = ?auto_611338 ?auto_611351 ) ) ( not ( = ?auto_611338 ?auto_611352 ) ) ( not ( = ?auto_611339 ?auto_611340 ) ) ( not ( = ?auto_611339 ?auto_611341 ) ) ( not ( = ?auto_611339 ?auto_611342 ) ) ( not ( = ?auto_611339 ?auto_611343 ) ) ( not ( = ?auto_611339 ?auto_611344 ) ) ( not ( = ?auto_611339 ?auto_611345 ) ) ( not ( = ?auto_611339 ?auto_611346 ) ) ( not ( = ?auto_611339 ?auto_611347 ) ) ( not ( = ?auto_611339 ?auto_611348 ) ) ( not ( = ?auto_611339 ?auto_611349 ) ) ( not ( = ?auto_611339 ?auto_611350 ) ) ( not ( = ?auto_611339 ?auto_611351 ) ) ( not ( = ?auto_611339 ?auto_611352 ) ) ( not ( = ?auto_611340 ?auto_611341 ) ) ( not ( = ?auto_611340 ?auto_611342 ) ) ( not ( = ?auto_611340 ?auto_611343 ) ) ( not ( = ?auto_611340 ?auto_611344 ) ) ( not ( = ?auto_611340 ?auto_611345 ) ) ( not ( = ?auto_611340 ?auto_611346 ) ) ( not ( = ?auto_611340 ?auto_611347 ) ) ( not ( = ?auto_611340 ?auto_611348 ) ) ( not ( = ?auto_611340 ?auto_611349 ) ) ( not ( = ?auto_611340 ?auto_611350 ) ) ( not ( = ?auto_611340 ?auto_611351 ) ) ( not ( = ?auto_611340 ?auto_611352 ) ) ( not ( = ?auto_611341 ?auto_611342 ) ) ( not ( = ?auto_611341 ?auto_611343 ) ) ( not ( = ?auto_611341 ?auto_611344 ) ) ( not ( = ?auto_611341 ?auto_611345 ) ) ( not ( = ?auto_611341 ?auto_611346 ) ) ( not ( = ?auto_611341 ?auto_611347 ) ) ( not ( = ?auto_611341 ?auto_611348 ) ) ( not ( = ?auto_611341 ?auto_611349 ) ) ( not ( = ?auto_611341 ?auto_611350 ) ) ( not ( = ?auto_611341 ?auto_611351 ) ) ( not ( = ?auto_611341 ?auto_611352 ) ) ( not ( = ?auto_611342 ?auto_611343 ) ) ( not ( = ?auto_611342 ?auto_611344 ) ) ( not ( = ?auto_611342 ?auto_611345 ) ) ( not ( = ?auto_611342 ?auto_611346 ) ) ( not ( = ?auto_611342 ?auto_611347 ) ) ( not ( = ?auto_611342 ?auto_611348 ) ) ( not ( = ?auto_611342 ?auto_611349 ) ) ( not ( = ?auto_611342 ?auto_611350 ) ) ( not ( = ?auto_611342 ?auto_611351 ) ) ( not ( = ?auto_611342 ?auto_611352 ) ) ( not ( = ?auto_611343 ?auto_611344 ) ) ( not ( = ?auto_611343 ?auto_611345 ) ) ( not ( = ?auto_611343 ?auto_611346 ) ) ( not ( = ?auto_611343 ?auto_611347 ) ) ( not ( = ?auto_611343 ?auto_611348 ) ) ( not ( = ?auto_611343 ?auto_611349 ) ) ( not ( = ?auto_611343 ?auto_611350 ) ) ( not ( = ?auto_611343 ?auto_611351 ) ) ( not ( = ?auto_611343 ?auto_611352 ) ) ( not ( = ?auto_611344 ?auto_611345 ) ) ( not ( = ?auto_611344 ?auto_611346 ) ) ( not ( = ?auto_611344 ?auto_611347 ) ) ( not ( = ?auto_611344 ?auto_611348 ) ) ( not ( = ?auto_611344 ?auto_611349 ) ) ( not ( = ?auto_611344 ?auto_611350 ) ) ( not ( = ?auto_611344 ?auto_611351 ) ) ( not ( = ?auto_611344 ?auto_611352 ) ) ( not ( = ?auto_611345 ?auto_611346 ) ) ( not ( = ?auto_611345 ?auto_611347 ) ) ( not ( = ?auto_611345 ?auto_611348 ) ) ( not ( = ?auto_611345 ?auto_611349 ) ) ( not ( = ?auto_611345 ?auto_611350 ) ) ( not ( = ?auto_611345 ?auto_611351 ) ) ( not ( = ?auto_611345 ?auto_611352 ) ) ( not ( = ?auto_611346 ?auto_611347 ) ) ( not ( = ?auto_611346 ?auto_611348 ) ) ( not ( = ?auto_611346 ?auto_611349 ) ) ( not ( = ?auto_611346 ?auto_611350 ) ) ( not ( = ?auto_611346 ?auto_611351 ) ) ( not ( = ?auto_611346 ?auto_611352 ) ) ( not ( = ?auto_611347 ?auto_611348 ) ) ( not ( = ?auto_611347 ?auto_611349 ) ) ( not ( = ?auto_611347 ?auto_611350 ) ) ( not ( = ?auto_611347 ?auto_611351 ) ) ( not ( = ?auto_611347 ?auto_611352 ) ) ( not ( = ?auto_611348 ?auto_611349 ) ) ( not ( = ?auto_611348 ?auto_611350 ) ) ( not ( = ?auto_611348 ?auto_611351 ) ) ( not ( = ?auto_611348 ?auto_611352 ) ) ( not ( = ?auto_611349 ?auto_611350 ) ) ( not ( = ?auto_611349 ?auto_611351 ) ) ( not ( = ?auto_611349 ?auto_611352 ) ) ( not ( = ?auto_611350 ?auto_611351 ) ) ( not ( = ?auto_611350 ?auto_611352 ) ) ( not ( = ?auto_611351 ?auto_611352 ) ) ( ON ?auto_611350 ?auto_611351 ) ( ON ?auto_611349 ?auto_611350 ) ( ON ?auto_611348 ?auto_611349 ) ( ON ?auto_611347 ?auto_611348 ) ( ON ?auto_611346 ?auto_611347 ) ( ON ?auto_611345 ?auto_611346 ) ( ON ?auto_611344 ?auto_611345 ) ( ON ?auto_611343 ?auto_611344 ) ( ON ?auto_611342 ?auto_611343 ) ( ON ?auto_611341 ?auto_611342 ) ( ON ?auto_611340 ?auto_611341 ) ( CLEAR ?auto_611338 ) ( ON ?auto_611339 ?auto_611340 ) ( CLEAR ?auto_611339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_611336 ?auto_611337 ?auto_611338 ?auto_611339 )
      ( MAKE-16PILE ?auto_611336 ?auto_611337 ?auto_611338 ?auto_611339 ?auto_611340 ?auto_611341 ?auto_611342 ?auto_611343 ?auto_611344 ?auto_611345 ?auto_611346 ?auto_611347 ?auto_611348 ?auto_611349 ?auto_611350 ?auto_611351 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_611402 - BLOCK
      ?auto_611403 - BLOCK
      ?auto_611404 - BLOCK
      ?auto_611405 - BLOCK
      ?auto_611406 - BLOCK
      ?auto_611407 - BLOCK
      ?auto_611408 - BLOCK
      ?auto_611409 - BLOCK
      ?auto_611410 - BLOCK
      ?auto_611411 - BLOCK
      ?auto_611412 - BLOCK
      ?auto_611413 - BLOCK
      ?auto_611414 - BLOCK
      ?auto_611415 - BLOCK
      ?auto_611416 - BLOCK
      ?auto_611417 - BLOCK
    )
    :vars
    (
      ?auto_611418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611417 ?auto_611418 ) ( ON-TABLE ?auto_611402 ) ( ON ?auto_611403 ?auto_611402 ) ( not ( = ?auto_611402 ?auto_611403 ) ) ( not ( = ?auto_611402 ?auto_611404 ) ) ( not ( = ?auto_611402 ?auto_611405 ) ) ( not ( = ?auto_611402 ?auto_611406 ) ) ( not ( = ?auto_611402 ?auto_611407 ) ) ( not ( = ?auto_611402 ?auto_611408 ) ) ( not ( = ?auto_611402 ?auto_611409 ) ) ( not ( = ?auto_611402 ?auto_611410 ) ) ( not ( = ?auto_611402 ?auto_611411 ) ) ( not ( = ?auto_611402 ?auto_611412 ) ) ( not ( = ?auto_611402 ?auto_611413 ) ) ( not ( = ?auto_611402 ?auto_611414 ) ) ( not ( = ?auto_611402 ?auto_611415 ) ) ( not ( = ?auto_611402 ?auto_611416 ) ) ( not ( = ?auto_611402 ?auto_611417 ) ) ( not ( = ?auto_611402 ?auto_611418 ) ) ( not ( = ?auto_611403 ?auto_611404 ) ) ( not ( = ?auto_611403 ?auto_611405 ) ) ( not ( = ?auto_611403 ?auto_611406 ) ) ( not ( = ?auto_611403 ?auto_611407 ) ) ( not ( = ?auto_611403 ?auto_611408 ) ) ( not ( = ?auto_611403 ?auto_611409 ) ) ( not ( = ?auto_611403 ?auto_611410 ) ) ( not ( = ?auto_611403 ?auto_611411 ) ) ( not ( = ?auto_611403 ?auto_611412 ) ) ( not ( = ?auto_611403 ?auto_611413 ) ) ( not ( = ?auto_611403 ?auto_611414 ) ) ( not ( = ?auto_611403 ?auto_611415 ) ) ( not ( = ?auto_611403 ?auto_611416 ) ) ( not ( = ?auto_611403 ?auto_611417 ) ) ( not ( = ?auto_611403 ?auto_611418 ) ) ( not ( = ?auto_611404 ?auto_611405 ) ) ( not ( = ?auto_611404 ?auto_611406 ) ) ( not ( = ?auto_611404 ?auto_611407 ) ) ( not ( = ?auto_611404 ?auto_611408 ) ) ( not ( = ?auto_611404 ?auto_611409 ) ) ( not ( = ?auto_611404 ?auto_611410 ) ) ( not ( = ?auto_611404 ?auto_611411 ) ) ( not ( = ?auto_611404 ?auto_611412 ) ) ( not ( = ?auto_611404 ?auto_611413 ) ) ( not ( = ?auto_611404 ?auto_611414 ) ) ( not ( = ?auto_611404 ?auto_611415 ) ) ( not ( = ?auto_611404 ?auto_611416 ) ) ( not ( = ?auto_611404 ?auto_611417 ) ) ( not ( = ?auto_611404 ?auto_611418 ) ) ( not ( = ?auto_611405 ?auto_611406 ) ) ( not ( = ?auto_611405 ?auto_611407 ) ) ( not ( = ?auto_611405 ?auto_611408 ) ) ( not ( = ?auto_611405 ?auto_611409 ) ) ( not ( = ?auto_611405 ?auto_611410 ) ) ( not ( = ?auto_611405 ?auto_611411 ) ) ( not ( = ?auto_611405 ?auto_611412 ) ) ( not ( = ?auto_611405 ?auto_611413 ) ) ( not ( = ?auto_611405 ?auto_611414 ) ) ( not ( = ?auto_611405 ?auto_611415 ) ) ( not ( = ?auto_611405 ?auto_611416 ) ) ( not ( = ?auto_611405 ?auto_611417 ) ) ( not ( = ?auto_611405 ?auto_611418 ) ) ( not ( = ?auto_611406 ?auto_611407 ) ) ( not ( = ?auto_611406 ?auto_611408 ) ) ( not ( = ?auto_611406 ?auto_611409 ) ) ( not ( = ?auto_611406 ?auto_611410 ) ) ( not ( = ?auto_611406 ?auto_611411 ) ) ( not ( = ?auto_611406 ?auto_611412 ) ) ( not ( = ?auto_611406 ?auto_611413 ) ) ( not ( = ?auto_611406 ?auto_611414 ) ) ( not ( = ?auto_611406 ?auto_611415 ) ) ( not ( = ?auto_611406 ?auto_611416 ) ) ( not ( = ?auto_611406 ?auto_611417 ) ) ( not ( = ?auto_611406 ?auto_611418 ) ) ( not ( = ?auto_611407 ?auto_611408 ) ) ( not ( = ?auto_611407 ?auto_611409 ) ) ( not ( = ?auto_611407 ?auto_611410 ) ) ( not ( = ?auto_611407 ?auto_611411 ) ) ( not ( = ?auto_611407 ?auto_611412 ) ) ( not ( = ?auto_611407 ?auto_611413 ) ) ( not ( = ?auto_611407 ?auto_611414 ) ) ( not ( = ?auto_611407 ?auto_611415 ) ) ( not ( = ?auto_611407 ?auto_611416 ) ) ( not ( = ?auto_611407 ?auto_611417 ) ) ( not ( = ?auto_611407 ?auto_611418 ) ) ( not ( = ?auto_611408 ?auto_611409 ) ) ( not ( = ?auto_611408 ?auto_611410 ) ) ( not ( = ?auto_611408 ?auto_611411 ) ) ( not ( = ?auto_611408 ?auto_611412 ) ) ( not ( = ?auto_611408 ?auto_611413 ) ) ( not ( = ?auto_611408 ?auto_611414 ) ) ( not ( = ?auto_611408 ?auto_611415 ) ) ( not ( = ?auto_611408 ?auto_611416 ) ) ( not ( = ?auto_611408 ?auto_611417 ) ) ( not ( = ?auto_611408 ?auto_611418 ) ) ( not ( = ?auto_611409 ?auto_611410 ) ) ( not ( = ?auto_611409 ?auto_611411 ) ) ( not ( = ?auto_611409 ?auto_611412 ) ) ( not ( = ?auto_611409 ?auto_611413 ) ) ( not ( = ?auto_611409 ?auto_611414 ) ) ( not ( = ?auto_611409 ?auto_611415 ) ) ( not ( = ?auto_611409 ?auto_611416 ) ) ( not ( = ?auto_611409 ?auto_611417 ) ) ( not ( = ?auto_611409 ?auto_611418 ) ) ( not ( = ?auto_611410 ?auto_611411 ) ) ( not ( = ?auto_611410 ?auto_611412 ) ) ( not ( = ?auto_611410 ?auto_611413 ) ) ( not ( = ?auto_611410 ?auto_611414 ) ) ( not ( = ?auto_611410 ?auto_611415 ) ) ( not ( = ?auto_611410 ?auto_611416 ) ) ( not ( = ?auto_611410 ?auto_611417 ) ) ( not ( = ?auto_611410 ?auto_611418 ) ) ( not ( = ?auto_611411 ?auto_611412 ) ) ( not ( = ?auto_611411 ?auto_611413 ) ) ( not ( = ?auto_611411 ?auto_611414 ) ) ( not ( = ?auto_611411 ?auto_611415 ) ) ( not ( = ?auto_611411 ?auto_611416 ) ) ( not ( = ?auto_611411 ?auto_611417 ) ) ( not ( = ?auto_611411 ?auto_611418 ) ) ( not ( = ?auto_611412 ?auto_611413 ) ) ( not ( = ?auto_611412 ?auto_611414 ) ) ( not ( = ?auto_611412 ?auto_611415 ) ) ( not ( = ?auto_611412 ?auto_611416 ) ) ( not ( = ?auto_611412 ?auto_611417 ) ) ( not ( = ?auto_611412 ?auto_611418 ) ) ( not ( = ?auto_611413 ?auto_611414 ) ) ( not ( = ?auto_611413 ?auto_611415 ) ) ( not ( = ?auto_611413 ?auto_611416 ) ) ( not ( = ?auto_611413 ?auto_611417 ) ) ( not ( = ?auto_611413 ?auto_611418 ) ) ( not ( = ?auto_611414 ?auto_611415 ) ) ( not ( = ?auto_611414 ?auto_611416 ) ) ( not ( = ?auto_611414 ?auto_611417 ) ) ( not ( = ?auto_611414 ?auto_611418 ) ) ( not ( = ?auto_611415 ?auto_611416 ) ) ( not ( = ?auto_611415 ?auto_611417 ) ) ( not ( = ?auto_611415 ?auto_611418 ) ) ( not ( = ?auto_611416 ?auto_611417 ) ) ( not ( = ?auto_611416 ?auto_611418 ) ) ( not ( = ?auto_611417 ?auto_611418 ) ) ( ON ?auto_611416 ?auto_611417 ) ( ON ?auto_611415 ?auto_611416 ) ( ON ?auto_611414 ?auto_611415 ) ( ON ?auto_611413 ?auto_611414 ) ( ON ?auto_611412 ?auto_611413 ) ( ON ?auto_611411 ?auto_611412 ) ( ON ?auto_611410 ?auto_611411 ) ( ON ?auto_611409 ?auto_611410 ) ( ON ?auto_611408 ?auto_611409 ) ( ON ?auto_611407 ?auto_611408 ) ( ON ?auto_611406 ?auto_611407 ) ( ON ?auto_611405 ?auto_611406 ) ( CLEAR ?auto_611403 ) ( ON ?auto_611404 ?auto_611405 ) ( CLEAR ?auto_611404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_611402 ?auto_611403 ?auto_611404 )
      ( MAKE-16PILE ?auto_611402 ?auto_611403 ?auto_611404 ?auto_611405 ?auto_611406 ?auto_611407 ?auto_611408 ?auto_611409 ?auto_611410 ?auto_611411 ?auto_611412 ?auto_611413 ?auto_611414 ?auto_611415 ?auto_611416 ?auto_611417 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_611468 - BLOCK
      ?auto_611469 - BLOCK
      ?auto_611470 - BLOCK
      ?auto_611471 - BLOCK
      ?auto_611472 - BLOCK
      ?auto_611473 - BLOCK
      ?auto_611474 - BLOCK
      ?auto_611475 - BLOCK
      ?auto_611476 - BLOCK
      ?auto_611477 - BLOCK
      ?auto_611478 - BLOCK
      ?auto_611479 - BLOCK
      ?auto_611480 - BLOCK
      ?auto_611481 - BLOCK
      ?auto_611482 - BLOCK
      ?auto_611483 - BLOCK
    )
    :vars
    (
      ?auto_611484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611483 ?auto_611484 ) ( ON-TABLE ?auto_611468 ) ( not ( = ?auto_611468 ?auto_611469 ) ) ( not ( = ?auto_611468 ?auto_611470 ) ) ( not ( = ?auto_611468 ?auto_611471 ) ) ( not ( = ?auto_611468 ?auto_611472 ) ) ( not ( = ?auto_611468 ?auto_611473 ) ) ( not ( = ?auto_611468 ?auto_611474 ) ) ( not ( = ?auto_611468 ?auto_611475 ) ) ( not ( = ?auto_611468 ?auto_611476 ) ) ( not ( = ?auto_611468 ?auto_611477 ) ) ( not ( = ?auto_611468 ?auto_611478 ) ) ( not ( = ?auto_611468 ?auto_611479 ) ) ( not ( = ?auto_611468 ?auto_611480 ) ) ( not ( = ?auto_611468 ?auto_611481 ) ) ( not ( = ?auto_611468 ?auto_611482 ) ) ( not ( = ?auto_611468 ?auto_611483 ) ) ( not ( = ?auto_611468 ?auto_611484 ) ) ( not ( = ?auto_611469 ?auto_611470 ) ) ( not ( = ?auto_611469 ?auto_611471 ) ) ( not ( = ?auto_611469 ?auto_611472 ) ) ( not ( = ?auto_611469 ?auto_611473 ) ) ( not ( = ?auto_611469 ?auto_611474 ) ) ( not ( = ?auto_611469 ?auto_611475 ) ) ( not ( = ?auto_611469 ?auto_611476 ) ) ( not ( = ?auto_611469 ?auto_611477 ) ) ( not ( = ?auto_611469 ?auto_611478 ) ) ( not ( = ?auto_611469 ?auto_611479 ) ) ( not ( = ?auto_611469 ?auto_611480 ) ) ( not ( = ?auto_611469 ?auto_611481 ) ) ( not ( = ?auto_611469 ?auto_611482 ) ) ( not ( = ?auto_611469 ?auto_611483 ) ) ( not ( = ?auto_611469 ?auto_611484 ) ) ( not ( = ?auto_611470 ?auto_611471 ) ) ( not ( = ?auto_611470 ?auto_611472 ) ) ( not ( = ?auto_611470 ?auto_611473 ) ) ( not ( = ?auto_611470 ?auto_611474 ) ) ( not ( = ?auto_611470 ?auto_611475 ) ) ( not ( = ?auto_611470 ?auto_611476 ) ) ( not ( = ?auto_611470 ?auto_611477 ) ) ( not ( = ?auto_611470 ?auto_611478 ) ) ( not ( = ?auto_611470 ?auto_611479 ) ) ( not ( = ?auto_611470 ?auto_611480 ) ) ( not ( = ?auto_611470 ?auto_611481 ) ) ( not ( = ?auto_611470 ?auto_611482 ) ) ( not ( = ?auto_611470 ?auto_611483 ) ) ( not ( = ?auto_611470 ?auto_611484 ) ) ( not ( = ?auto_611471 ?auto_611472 ) ) ( not ( = ?auto_611471 ?auto_611473 ) ) ( not ( = ?auto_611471 ?auto_611474 ) ) ( not ( = ?auto_611471 ?auto_611475 ) ) ( not ( = ?auto_611471 ?auto_611476 ) ) ( not ( = ?auto_611471 ?auto_611477 ) ) ( not ( = ?auto_611471 ?auto_611478 ) ) ( not ( = ?auto_611471 ?auto_611479 ) ) ( not ( = ?auto_611471 ?auto_611480 ) ) ( not ( = ?auto_611471 ?auto_611481 ) ) ( not ( = ?auto_611471 ?auto_611482 ) ) ( not ( = ?auto_611471 ?auto_611483 ) ) ( not ( = ?auto_611471 ?auto_611484 ) ) ( not ( = ?auto_611472 ?auto_611473 ) ) ( not ( = ?auto_611472 ?auto_611474 ) ) ( not ( = ?auto_611472 ?auto_611475 ) ) ( not ( = ?auto_611472 ?auto_611476 ) ) ( not ( = ?auto_611472 ?auto_611477 ) ) ( not ( = ?auto_611472 ?auto_611478 ) ) ( not ( = ?auto_611472 ?auto_611479 ) ) ( not ( = ?auto_611472 ?auto_611480 ) ) ( not ( = ?auto_611472 ?auto_611481 ) ) ( not ( = ?auto_611472 ?auto_611482 ) ) ( not ( = ?auto_611472 ?auto_611483 ) ) ( not ( = ?auto_611472 ?auto_611484 ) ) ( not ( = ?auto_611473 ?auto_611474 ) ) ( not ( = ?auto_611473 ?auto_611475 ) ) ( not ( = ?auto_611473 ?auto_611476 ) ) ( not ( = ?auto_611473 ?auto_611477 ) ) ( not ( = ?auto_611473 ?auto_611478 ) ) ( not ( = ?auto_611473 ?auto_611479 ) ) ( not ( = ?auto_611473 ?auto_611480 ) ) ( not ( = ?auto_611473 ?auto_611481 ) ) ( not ( = ?auto_611473 ?auto_611482 ) ) ( not ( = ?auto_611473 ?auto_611483 ) ) ( not ( = ?auto_611473 ?auto_611484 ) ) ( not ( = ?auto_611474 ?auto_611475 ) ) ( not ( = ?auto_611474 ?auto_611476 ) ) ( not ( = ?auto_611474 ?auto_611477 ) ) ( not ( = ?auto_611474 ?auto_611478 ) ) ( not ( = ?auto_611474 ?auto_611479 ) ) ( not ( = ?auto_611474 ?auto_611480 ) ) ( not ( = ?auto_611474 ?auto_611481 ) ) ( not ( = ?auto_611474 ?auto_611482 ) ) ( not ( = ?auto_611474 ?auto_611483 ) ) ( not ( = ?auto_611474 ?auto_611484 ) ) ( not ( = ?auto_611475 ?auto_611476 ) ) ( not ( = ?auto_611475 ?auto_611477 ) ) ( not ( = ?auto_611475 ?auto_611478 ) ) ( not ( = ?auto_611475 ?auto_611479 ) ) ( not ( = ?auto_611475 ?auto_611480 ) ) ( not ( = ?auto_611475 ?auto_611481 ) ) ( not ( = ?auto_611475 ?auto_611482 ) ) ( not ( = ?auto_611475 ?auto_611483 ) ) ( not ( = ?auto_611475 ?auto_611484 ) ) ( not ( = ?auto_611476 ?auto_611477 ) ) ( not ( = ?auto_611476 ?auto_611478 ) ) ( not ( = ?auto_611476 ?auto_611479 ) ) ( not ( = ?auto_611476 ?auto_611480 ) ) ( not ( = ?auto_611476 ?auto_611481 ) ) ( not ( = ?auto_611476 ?auto_611482 ) ) ( not ( = ?auto_611476 ?auto_611483 ) ) ( not ( = ?auto_611476 ?auto_611484 ) ) ( not ( = ?auto_611477 ?auto_611478 ) ) ( not ( = ?auto_611477 ?auto_611479 ) ) ( not ( = ?auto_611477 ?auto_611480 ) ) ( not ( = ?auto_611477 ?auto_611481 ) ) ( not ( = ?auto_611477 ?auto_611482 ) ) ( not ( = ?auto_611477 ?auto_611483 ) ) ( not ( = ?auto_611477 ?auto_611484 ) ) ( not ( = ?auto_611478 ?auto_611479 ) ) ( not ( = ?auto_611478 ?auto_611480 ) ) ( not ( = ?auto_611478 ?auto_611481 ) ) ( not ( = ?auto_611478 ?auto_611482 ) ) ( not ( = ?auto_611478 ?auto_611483 ) ) ( not ( = ?auto_611478 ?auto_611484 ) ) ( not ( = ?auto_611479 ?auto_611480 ) ) ( not ( = ?auto_611479 ?auto_611481 ) ) ( not ( = ?auto_611479 ?auto_611482 ) ) ( not ( = ?auto_611479 ?auto_611483 ) ) ( not ( = ?auto_611479 ?auto_611484 ) ) ( not ( = ?auto_611480 ?auto_611481 ) ) ( not ( = ?auto_611480 ?auto_611482 ) ) ( not ( = ?auto_611480 ?auto_611483 ) ) ( not ( = ?auto_611480 ?auto_611484 ) ) ( not ( = ?auto_611481 ?auto_611482 ) ) ( not ( = ?auto_611481 ?auto_611483 ) ) ( not ( = ?auto_611481 ?auto_611484 ) ) ( not ( = ?auto_611482 ?auto_611483 ) ) ( not ( = ?auto_611482 ?auto_611484 ) ) ( not ( = ?auto_611483 ?auto_611484 ) ) ( ON ?auto_611482 ?auto_611483 ) ( ON ?auto_611481 ?auto_611482 ) ( ON ?auto_611480 ?auto_611481 ) ( ON ?auto_611479 ?auto_611480 ) ( ON ?auto_611478 ?auto_611479 ) ( ON ?auto_611477 ?auto_611478 ) ( ON ?auto_611476 ?auto_611477 ) ( ON ?auto_611475 ?auto_611476 ) ( ON ?auto_611474 ?auto_611475 ) ( ON ?auto_611473 ?auto_611474 ) ( ON ?auto_611472 ?auto_611473 ) ( ON ?auto_611471 ?auto_611472 ) ( ON ?auto_611470 ?auto_611471 ) ( CLEAR ?auto_611468 ) ( ON ?auto_611469 ?auto_611470 ) ( CLEAR ?auto_611469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_611468 ?auto_611469 )
      ( MAKE-16PILE ?auto_611468 ?auto_611469 ?auto_611470 ?auto_611471 ?auto_611472 ?auto_611473 ?auto_611474 ?auto_611475 ?auto_611476 ?auto_611477 ?auto_611478 ?auto_611479 ?auto_611480 ?auto_611481 ?auto_611482 ?auto_611483 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_611534 - BLOCK
      ?auto_611535 - BLOCK
      ?auto_611536 - BLOCK
      ?auto_611537 - BLOCK
      ?auto_611538 - BLOCK
      ?auto_611539 - BLOCK
      ?auto_611540 - BLOCK
      ?auto_611541 - BLOCK
      ?auto_611542 - BLOCK
      ?auto_611543 - BLOCK
      ?auto_611544 - BLOCK
      ?auto_611545 - BLOCK
      ?auto_611546 - BLOCK
      ?auto_611547 - BLOCK
      ?auto_611548 - BLOCK
      ?auto_611549 - BLOCK
    )
    :vars
    (
      ?auto_611550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611549 ?auto_611550 ) ( not ( = ?auto_611534 ?auto_611535 ) ) ( not ( = ?auto_611534 ?auto_611536 ) ) ( not ( = ?auto_611534 ?auto_611537 ) ) ( not ( = ?auto_611534 ?auto_611538 ) ) ( not ( = ?auto_611534 ?auto_611539 ) ) ( not ( = ?auto_611534 ?auto_611540 ) ) ( not ( = ?auto_611534 ?auto_611541 ) ) ( not ( = ?auto_611534 ?auto_611542 ) ) ( not ( = ?auto_611534 ?auto_611543 ) ) ( not ( = ?auto_611534 ?auto_611544 ) ) ( not ( = ?auto_611534 ?auto_611545 ) ) ( not ( = ?auto_611534 ?auto_611546 ) ) ( not ( = ?auto_611534 ?auto_611547 ) ) ( not ( = ?auto_611534 ?auto_611548 ) ) ( not ( = ?auto_611534 ?auto_611549 ) ) ( not ( = ?auto_611534 ?auto_611550 ) ) ( not ( = ?auto_611535 ?auto_611536 ) ) ( not ( = ?auto_611535 ?auto_611537 ) ) ( not ( = ?auto_611535 ?auto_611538 ) ) ( not ( = ?auto_611535 ?auto_611539 ) ) ( not ( = ?auto_611535 ?auto_611540 ) ) ( not ( = ?auto_611535 ?auto_611541 ) ) ( not ( = ?auto_611535 ?auto_611542 ) ) ( not ( = ?auto_611535 ?auto_611543 ) ) ( not ( = ?auto_611535 ?auto_611544 ) ) ( not ( = ?auto_611535 ?auto_611545 ) ) ( not ( = ?auto_611535 ?auto_611546 ) ) ( not ( = ?auto_611535 ?auto_611547 ) ) ( not ( = ?auto_611535 ?auto_611548 ) ) ( not ( = ?auto_611535 ?auto_611549 ) ) ( not ( = ?auto_611535 ?auto_611550 ) ) ( not ( = ?auto_611536 ?auto_611537 ) ) ( not ( = ?auto_611536 ?auto_611538 ) ) ( not ( = ?auto_611536 ?auto_611539 ) ) ( not ( = ?auto_611536 ?auto_611540 ) ) ( not ( = ?auto_611536 ?auto_611541 ) ) ( not ( = ?auto_611536 ?auto_611542 ) ) ( not ( = ?auto_611536 ?auto_611543 ) ) ( not ( = ?auto_611536 ?auto_611544 ) ) ( not ( = ?auto_611536 ?auto_611545 ) ) ( not ( = ?auto_611536 ?auto_611546 ) ) ( not ( = ?auto_611536 ?auto_611547 ) ) ( not ( = ?auto_611536 ?auto_611548 ) ) ( not ( = ?auto_611536 ?auto_611549 ) ) ( not ( = ?auto_611536 ?auto_611550 ) ) ( not ( = ?auto_611537 ?auto_611538 ) ) ( not ( = ?auto_611537 ?auto_611539 ) ) ( not ( = ?auto_611537 ?auto_611540 ) ) ( not ( = ?auto_611537 ?auto_611541 ) ) ( not ( = ?auto_611537 ?auto_611542 ) ) ( not ( = ?auto_611537 ?auto_611543 ) ) ( not ( = ?auto_611537 ?auto_611544 ) ) ( not ( = ?auto_611537 ?auto_611545 ) ) ( not ( = ?auto_611537 ?auto_611546 ) ) ( not ( = ?auto_611537 ?auto_611547 ) ) ( not ( = ?auto_611537 ?auto_611548 ) ) ( not ( = ?auto_611537 ?auto_611549 ) ) ( not ( = ?auto_611537 ?auto_611550 ) ) ( not ( = ?auto_611538 ?auto_611539 ) ) ( not ( = ?auto_611538 ?auto_611540 ) ) ( not ( = ?auto_611538 ?auto_611541 ) ) ( not ( = ?auto_611538 ?auto_611542 ) ) ( not ( = ?auto_611538 ?auto_611543 ) ) ( not ( = ?auto_611538 ?auto_611544 ) ) ( not ( = ?auto_611538 ?auto_611545 ) ) ( not ( = ?auto_611538 ?auto_611546 ) ) ( not ( = ?auto_611538 ?auto_611547 ) ) ( not ( = ?auto_611538 ?auto_611548 ) ) ( not ( = ?auto_611538 ?auto_611549 ) ) ( not ( = ?auto_611538 ?auto_611550 ) ) ( not ( = ?auto_611539 ?auto_611540 ) ) ( not ( = ?auto_611539 ?auto_611541 ) ) ( not ( = ?auto_611539 ?auto_611542 ) ) ( not ( = ?auto_611539 ?auto_611543 ) ) ( not ( = ?auto_611539 ?auto_611544 ) ) ( not ( = ?auto_611539 ?auto_611545 ) ) ( not ( = ?auto_611539 ?auto_611546 ) ) ( not ( = ?auto_611539 ?auto_611547 ) ) ( not ( = ?auto_611539 ?auto_611548 ) ) ( not ( = ?auto_611539 ?auto_611549 ) ) ( not ( = ?auto_611539 ?auto_611550 ) ) ( not ( = ?auto_611540 ?auto_611541 ) ) ( not ( = ?auto_611540 ?auto_611542 ) ) ( not ( = ?auto_611540 ?auto_611543 ) ) ( not ( = ?auto_611540 ?auto_611544 ) ) ( not ( = ?auto_611540 ?auto_611545 ) ) ( not ( = ?auto_611540 ?auto_611546 ) ) ( not ( = ?auto_611540 ?auto_611547 ) ) ( not ( = ?auto_611540 ?auto_611548 ) ) ( not ( = ?auto_611540 ?auto_611549 ) ) ( not ( = ?auto_611540 ?auto_611550 ) ) ( not ( = ?auto_611541 ?auto_611542 ) ) ( not ( = ?auto_611541 ?auto_611543 ) ) ( not ( = ?auto_611541 ?auto_611544 ) ) ( not ( = ?auto_611541 ?auto_611545 ) ) ( not ( = ?auto_611541 ?auto_611546 ) ) ( not ( = ?auto_611541 ?auto_611547 ) ) ( not ( = ?auto_611541 ?auto_611548 ) ) ( not ( = ?auto_611541 ?auto_611549 ) ) ( not ( = ?auto_611541 ?auto_611550 ) ) ( not ( = ?auto_611542 ?auto_611543 ) ) ( not ( = ?auto_611542 ?auto_611544 ) ) ( not ( = ?auto_611542 ?auto_611545 ) ) ( not ( = ?auto_611542 ?auto_611546 ) ) ( not ( = ?auto_611542 ?auto_611547 ) ) ( not ( = ?auto_611542 ?auto_611548 ) ) ( not ( = ?auto_611542 ?auto_611549 ) ) ( not ( = ?auto_611542 ?auto_611550 ) ) ( not ( = ?auto_611543 ?auto_611544 ) ) ( not ( = ?auto_611543 ?auto_611545 ) ) ( not ( = ?auto_611543 ?auto_611546 ) ) ( not ( = ?auto_611543 ?auto_611547 ) ) ( not ( = ?auto_611543 ?auto_611548 ) ) ( not ( = ?auto_611543 ?auto_611549 ) ) ( not ( = ?auto_611543 ?auto_611550 ) ) ( not ( = ?auto_611544 ?auto_611545 ) ) ( not ( = ?auto_611544 ?auto_611546 ) ) ( not ( = ?auto_611544 ?auto_611547 ) ) ( not ( = ?auto_611544 ?auto_611548 ) ) ( not ( = ?auto_611544 ?auto_611549 ) ) ( not ( = ?auto_611544 ?auto_611550 ) ) ( not ( = ?auto_611545 ?auto_611546 ) ) ( not ( = ?auto_611545 ?auto_611547 ) ) ( not ( = ?auto_611545 ?auto_611548 ) ) ( not ( = ?auto_611545 ?auto_611549 ) ) ( not ( = ?auto_611545 ?auto_611550 ) ) ( not ( = ?auto_611546 ?auto_611547 ) ) ( not ( = ?auto_611546 ?auto_611548 ) ) ( not ( = ?auto_611546 ?auto_611549 ) ) ( not ( = ?auto_611546 ?auto_611550 ) ) ( not ( = ?auto_611547 ?auto_611548 ) ) ( not ( = ?auto_611547 ?auto_611549 ) ) ( not ( = ?auto_611547 ?auto_611550 ) ) ( not ( = ?auto_611548 ?auto_611549 ) ) ( not ( = ?auto_611548 ?auto_611550 ) ) ( not ( = ?auto_611549 ?auto_611550 ) ) ( ON ?auto_611548 ?auto_611549 ) ( ON ?auto_611547 ?auto_611548 ) ( ON ?auto_611546 ?auto_611547 ) ( ON ?auto_611545 ?auto_611546 ) ( ON ?auto_611544 ?auto_611545 ) ( ON ?auto_611543 ?auto_611544 ) ( ON ?auto_611542 ?auto_611543 ) ( ON ?auto_611541 ?auto_611542 ) ( ON ?auto_611540 ?auto_611541 ) ( ON ?auto_611539 ?auto_611540 ) ( ON ?auto_611538 ?auto_611539 ) ( ON ?auto_611537 ?auto_611538 ) ( ON ?auto_611536 ?auto_611537 ) ( ON ?auto_611535 ?auto_611536 ) ( ON ?auto_611534 ?auto_611535 ) ( CLEAR ?auto_611534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_611534 )
      ( MAKE-16PILE ?auto_611534 ?auto_611535 ?auto_611536 ?auto_611537 ?auto_611538 ?auto_611539 ?auto_611540 ?auto_611541 ?auto_611542 ?auto_611543 ?auto_611544 ?auto_611545 ?auto_611546 ?auto_611547 ?auto_611548 ?auto_611549 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611601 - BLOCK
      ?auto_611602 - BLOCK
      ?auto_611603 - BLOCK
      ?auto_611604 - BLOCK
      ?auto_611605 - BLOCK
      ?auto_611606 - BLOCK
      ?auto_611607 - BLOCK
      ?auto_611608 - BLOCK
      ?auto_611609 - BLOCK
      ?auto_611610 - BLOCK
      ?auto_611611 - BLOCK
      ?auto_611612 - BLOCK
      ?auto_611613 - BLOCK
      ?auto_611614 - BLOCK
      ?auto_611615 - BLOCK
      ?auto_611616 - BLOCK
      ?auto_611617 - BLOCK
    )
    :vars
    (
      ?auto_611618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_611616 ) ( ON ?auto_611617 ?auto_611618 ) ( CLEAR ?auto_611617 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_611601 ) ( ON ?auto_611602 ?auto_611601 ) ( ON ?auto_611603 ?auto_611602 ) ( ON ?auto_611604 ?auto_611603 ) ( ON ?auto_611605 ?auto_611604 ) ( ON ?auto_611606 ?auto_611605 ) ( ON ?auto_611607 ?auto_611606 ) ( ON ?auto_611608 ?auto_611607 ) ( ON ?auto_611609 ?auto_611608 ) ( ON ?auto_611610 ?auto_611609 ) ( ON ?auto_611611 ?auto_611610 ) ( ON ?auto_611612 ?auto_611611 ) ( ON ?auto_611613 ?auto_611612 ) ( ON ?auto_611614 ?auto_611613 ) ( ON ?auto_611615 ?auto_611614 ) ( ON ?auto_611616 ?auto_611615 ) ( not ( = ?auto_611601 ?auto_611602 ) ) ( not ( = ?auto_611601 ?auto_611603 ) ) ( not ( = ?auto_611601 ?auto_611604 ) ) ( not ( = ?auto_611601 ?auto_611605 ) ) ( not ( = ?auto_611601 ?auto_611606 ) ) ( not ( = ?auto_611601 ?auto_611607 ) ) ( not ( = ?auto_611601 ?auto_611608 ) ) ( not ( = ?auto_611601 ?auto_611609 ) ) ( not ( = ?auto_611601 ?auto_611610 ) ) ( not ( = ?auto_611601 ?auto_611611 ) ) ( not ( = ?auto_611601 ?auto_611612 ) ) ( not ( = ?auto_611601 ?auto_611613 ) ) ( not ( = ?auto_611601 ?auto_611614 ) ) ( not ( = ?auto_611601 ?auto_611615 ) ) ( not ( = ?auto_611601 ?auto_611616 ) ) ( not ( = ?auto_611601 ?auto_611617 ) ) ( not ( = ?auto_611601 ?auto_611618 ) ) ( not ( = ?auto_611602 ?auto_611603 ) ) ( not ( = ?auto_611602 ?auto_611604 ) ) ( not ( = ?auto_611602 ?auto_611605 ) ) ( not ( = ?auto_611602 ?auto_611606 ) ) ( not ( = ?auto_611602 ?auto_611607 ) ) ( not ( = ?auto_611602 ?auto_611608 ) ) ( not ( = ?auto_611602 ?auto_611609 ) ) ( not ( = ?auto_611602 ?auto_611610 ) ) ( not ( = ?auto_611602 ?auto_611611 ) ) ( not ( = ?auto_611602 ?auto_611612 ) ) ( not ( = ?auto_611602 ?auto_611613 ) ) ( not ( = ?auto_611602 ?auto_611614 ) ) ( not ( = ?auto_611602 ?auto_611615 ) ) ( not ( = ?auto_611602 ?auto_611616 ) ) ( not ( = ?auto_611602 ?auto_611617 ) ) ( not ( = ?auto_611602 ?auto_611618 ) ) ( not ( = ?auto_611603 ?auto_611604 ) ) ( not ( = ?auto_611603 ?auto_611605 ) ) ( not ( = ?auto_611603 ?auto_611606 ) ) ( not ( = ?auto_611603 ?auto_611607 ) ) ( not ( = ?auto_611603 ?auto_611608 ) ) ( not ( = ?auto_611603 ?auto_611609 ) ) ( not ( = ?auto_611603 ?auto_611610 ) ) ( not ( = ?auto_611603 ?auto_611611 ) ) ( not ( = ?auto_611603 ?auto_611612 ) ) ( not ( = ?auto_611603 ?auto_611613 ) ) ( not ( = ?auto_611603 ?auto_611614 ) ) ( not ( = ?auto_611603 ?auto_611615 ) ) ( not ( = ?auto_611603 ?auto_611616 ) ) ( not ( = ?auto_611603 ?auto_611617 ) ) ( not ( = ?auto_611603 ?auto_611618 ) ) ( not ( = ?auto_611604 ?auto_611605 ) ) ( not ( = ?auto_611604 ?auto_611606 ) ) ( not ( = ?auto_611604 ?auto_611607 ) ) ( not ( = ?auto_611604 ?auto_611608 ) ) ( not ( = ?auto_611604 ?auto_611609 ) ) ( not ( = ?auto_611604 ?auto_611610 ) ) ( not ( = ?auto_611604 ?auto_611611 ) ) ( not ( = ?auto_611604 ?auto_611612 ) ) ( not ( = ?auto_611604 ?auto_611613 ) ) ( not ( = ?auto_611604 ?auto_611614 ) ) ( not ( = ?auto_611604 ?auto_611615 ) ) ( not ( = ?auto_611604 ?auto_611616 ) ) ( not ( = ?auto_611604 ?auto_611617 ) ) ( not ( = ?auto_611604 ?auto_611618 ) ) ( not ( = ?auto_611605 ?auto_611606 ) ) ( not ( = ?auto_611605 ?auto_611607 ) ) ( not ( = ?auto_611605 ?auto_611608 ) ) ( not ( = ?auto_611605 ?auto_611609 ) ) ( not ( = ?auto_611605 ?auto_611610 ) ) ( not ( = ?auto_611605 ?auto_611611 ) ) ( not ( = ?auto_611605 ?auto_611612 ) ) ( not ( = ?auto_611605 ?auto_611613 ) ) ( not ( = ?auto_611605 ?auto_611614 ) ) ( not ( = ?auto_611605 ?auto_611615 ) ) ( not ( = ?auto_611605 ?auto_611616 ) ) ( not ( = ?auto_611605 ?auto_611617 ) ) ( not ( = ?auto_611605 ?auto_611618 ) ) ( not ( = ?auto_611606 ?auto_611607 ) ) ( not ( = ?auto_611606 ?auto_611608 ) ) ( not ( = ?auto_611606 ?auto_611609 ) ) ( not ( = ?auto_611606 ?auto_611610 ) ) ( not ( = ?auto_611606 ?auto_611611 ) ) ( not ( = ?auto_611606 ?auto_611612 ) ) ( not ( = ?auto_611606 ?auto_611613 ) ) ( not ( = ?auto_611606 ?auto_611614 ) ) ( not ( = ?auto_611606 ?auto_611615 ) ) ( not ( = ?auto_611606 ?auto_611616 ) ) ( not ( = ?auto_611606 ?auto_611617 ) ) ( not ( = ?auto_611606 ?auto_611618 ) ) ( not ( = ?auto_611607 ?auto_611608 ) ) ( not ( = ?auto_611607 ?auto_611609 ) ) ( not ( = ?auto_611607 ?auto_611610 ) ) ( not ( = ?auto_611607 ?auto_611611 ) ) ( not ( = ?auto_611607 ?auto_611612 ) ) ( not ( = ?auto_611607 ?auto_611613 ) ) ( not ( = ?auto_611607 ?auto_611614 ) ) ( not ( = ?auto_611607 ?auto_611615 ) ) ( not ( = ?auto_611607 ?auto_611616 ) ) ( not ( = ?auto_611607 ?auto_611617 ) ) ( not ( = ?auto_611607 ?auto_611618 ) ) ( not ( = ?auto_611608 ?auto_611609 ) ) ( not ( = ?auto_611608 ?auto_611610 ) ) ( not ( = ?auto_611608 ?auto_611611 ) ) ( not ( = ?auto_611608 ?auto_611612 ) ) ( not ( = ?auto_611608 ?auto_611613 ) ) ( not ( = ?auto_611608 ?auto_611614 ) ) ( not ( = ?auto_611608 ?auto_611615 ) ) ( not ( = ?auto_611608 ?auto_611616 ) ) ( not ( = ?auto_611608 ?auto_611617 ) ) ( not ( = ?auto_611608 ?auto_611618 ) ) ( not ( = ?auto_611609 ?auto_611610 ) ) ( not ( = ?auto_611609 ?auto_611611 ) ) ( not ( = ?auto_611609 ?auto_611612 ) ) ( not ( = ?auto_611609 ?auto_611613 ) ) ( not ( = ?auto_611609 ?auto_611614 ) ) ( not ( = ?auto_611609 ?auto_611615 ) ) ( not ( = ?auto_611609 ?auto_611616 ) ) ( not ( = ?auto_611609 ?auto_611617 ) ) ( not ( = ?auto_611609 ?auto_611618 ) ) ( not ( = ?auto_611610 ?auto_611611 ) ) ( not ( = ?auto_611610 ?auto_611612 ) ) ( not ( = ?auto_611610 ?auto_611613 ) ) ( not ( = ?auto_611610 ?auto_611614 ) ) ( not ( = ?auto_611610 ?auto_611615 ) ) ( not ( = ?auto_611610 ?auto_611616 ) ) ( not ( = ?auto_611610 ?auto_611617 ) ) ( not ( = ?auto_611610 ?auto_611618 ) ) ( not ( = ?auto_611611 ?auto_611612 ) ) ( not ( = ?auto_611611 ?auto_611613 ) ) ( not ( = ?auto_611611 ?auto_611614 ) ) ( not ( = ?auto_611611 ?auto_611615 ) ) ( not ( = ?auto_611611 ?auto_611616 ) ) ( not ( = ?auto_611611 ?auto_611617 ) ) ( not ( = ?auto_611611 ?auto_611618 ) ) ( not ( = ?auto_611612 ?auto_611613 ) ) ( not ( = ?auto_611612 ?auto_611614 ) ) ( not ( = ?auto_611612 ?auto_611615 ) ) ( not ( = ?auto_611612 ?auto_611616 ) ) ( not ( = ?auto_611612 ?auto_611617 ) ) ( not ( = ?auto_611612 ?auto_611618 ) ) ( not ( = ?auto_611613 ?auto_611614 ) ) ( not ( = ?auto_611613 ?auto_611615 ) ) ( not ( = ?auto_611613 ?auto_611616 ) ) ( not ( = ?auto_611613 ?auto_611617 ) ) ( not ( = ?auto_611613 ?auto_611618 ) ) ( not ( = ?auto_611614 ?auto_611615 ) ) ( not ( = ?auto_611614 ?auto_611616 ) ) ( not ( = ?auto_611614 ?auto_611617 ) ) ( not ( = ?auto_611614 ?auto_611618 ) ) ( not ( = ?auto_611615 ?auto_611616 ) ) ( not ( = ?auto_611615 ?auto_611617 ) ) ( not ( = ?auto_611615 ?auto_611618 ) ) ( not ( = ?auto_611616 ?auto_611617 ) ) ( not ( = ?auto_611616 ?auto_611618 ) ) ( not ( = ?auto_611617 ?auto_611618 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_611617 ?auto_611618 )
      ( !STACK ?auto_611617 ?auto_611616 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611636 - BLOCK
      ?auto_611637 - BLOCK
      ?auto_611638 - BLOCK
      ?auto_611639 - BLOCK
      ?auto_611640 - BLOCK
      ?auto_611641 - BLOCK
      ?auto_611642 - BLOCK
      ?auto_611643 - BLOCK
      ?auto_611644 - BLOCK
      ?auto_611645 - BLOCK
      ?auto_611646 - BLOCK
      ?auto_611647 - BLOCK
      ?auto_611648 - BLOCK
      ?auto_611649 - BLOCK
      ?auto_611650 - BLOCK
      ?auto_611651 - BLOCK
      ?auto_611652 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_611651 ) ( ON-TABLE ?auto_611652 ) ( CLEAR ?auto_611652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_611636 ) ( ON ?auto_611637 ?auto_611636 ) ( ON ?auto_611638 ?auto_611637 ) ( ON ?auto_611639 ?auto_611638 ) ( ON ?auto_611640 ?auto_611639 ) ( ON ?auto_611641 ?auto_611640 ) ( ON ?auto_611642 ?auto_611641 ) ( ON ?auto_611643 ?auto_611642 ) ( ON ?auto_611644 ?auto_611643 ) ( ON ?auto_611645 ?auto_611644 ) ( ON ?auto_611646 ?auto_611645 ) ( ON ?auto_611647 ?auto_611646 ) ( ON ?auto_611648 ?auto_611647 ) ( ON ?auto_611649 ?auto_611648 ) ( ON ?auto_611650 ?auto_611649 ) ( ON ?auto_611651 ?auto_611650 ) ( not ( = ?auto_611636 ?auto_611637 ) ) ( not ( = ?auto_611636 ?auto_611638 ) ) ( not ( = ?auto_611636 ?auto_611639 ) ) ( not ( = ?auto_611636 ?auto_611640 ) ) ( not ( = ?auto_611636 ?auto_611641 ) ) ( not ( = ?auto_611636 ?auto_611642 ) ) ( not ( = ?auto_611636 ?auto_611643 ) ) ( not ( = ?auto_611636 ?auto_611644 ) ) ( not ( = ?auto_611636 ?auto_611645 ) ) ( not ( = ?auto_611636 ?auto_611646 ) ) ( not ( = ?auto_611636 ?auto_611647 ) ) ( not ( = ?auto_611636 ?auto_611648 ) ) ( not ( = ?auto_611636 ?auto_611649 ) ) ( not ( = ?auto_611636 ?auto_611650 ) ) ( not ( = ?auto_611636 ?auto_611651 ) ) ( not ( = ?auto_611636 ?auto_611652 ) ) ( not ( = ?auto_611637 ?auto_611638 ) ) ( not ( = ?auto_611637 ?auto_611639 ) ) ( not ( = ?auto_611637 ?auto_611640 ) ) ( not ( = ?auto_611637 ?auto_611641 ) ) ( not ( = ?auto_611637 ?auto_611642 ) ) ( not ( = ?auto_611637 ?auto_611643 ) ) ( not ( = ?auto_611637 ?auto_611644 ) ) ( not ( = ?auto_611637 ?auto_611645 ) ) ( not ( = ?auto_611637 ?auto_611646 ) ) ( not ( = ?auto_611637 ?auto_611647 ) ) ( not ( = ?auto_611637 ?auto_611648 ) ) ( not ( = ?auto_611637 ?auto_611649 ) ) ( not ( = ?auto_611637 ?auto_611650 ) ) ( not ( = ?auto_611637 ?auto_611651 ) ) ( not ( = ?auto_611637 ?auto_611652 ) ) ( not ( = ?auto_611638 ?auto_611639 ) ) ( not ( = ?auto_611638 ?auto_611640 ) ) ( not ( = ?auto_611638 ?auto_611641 ) ) ( not ( = ?auto_611638 ?auto_611642 ) ) ( not ( = ?auto_611638 ?auto_611643 ) ) ( not ( = ?auto_611638 ?auto_611644 ) ) ( not ( = ?auto_611638 ?auto_611645 ) ) ( not ( = ?auto_611638 ?auto_611646 ) ) ( not ( = ?auto_611638 ?auto_611647 ) ) ( not ( = ?auto_611638 ?auto_611648 ) ) ( not ( = ?auto_611638 ?auto_611649 ) ) ( not ( = ?auto_611638 ?auto_611650 ) ) ( not ( = ?auto_611638 ?auto_611651 ) ) ( not ( = ?auto_611638 ?auto_611652 ) ) ( not ( = ?auto_611639 ?auto_611640 ) ) ( not ( = ?auto_611639 ?auto_611641 ) ) ( not ( = ?auto_611639 ?auto_611642 ) ) ( not ( = ?auto_611639 ?auto_611643 ) ) ( not ( = ?auto_611639 ?auto_611644 ) ) ( not ( = ?auto_611639 ?auto_611645 ) ) ( not ( = ?auto_611639 ?auto_611646 ) ) ( not ( = ?auto_611639 ?auto_611647 ) ) ( not ( = ?auto_611639 ?auto_611648 ) ) ( not ( = ?auto_611639 ?auto_611649 ) ) ( not ( = ?auto_611639 ?auto_611650 ) ) ( not ( = ?auto_611639 ?auto_611651 ) ) ( not ( = ?auto_611639 ?auto_611652 ) ) ( not ( = ?auto_611640 ?auto_611641 ) ) ( not ( = ?auto_611640 ?auto_611642 ) ) ( not ( = ?auto_611640 ?auto_611643 ) ) ( not ( = ?auto_611640 ?auto_611644 ) ) ( not ( = ?auto_611640 ?auto_611645 ) ) ( not ( = ?auto_611640 ?auto_611646 ) ) ( not ( = ?auto_611640 ?auto_611647 ) ) ( not ( = ?auto_611640 ?auto_611648 ) ) ( not ( = ?auto_611640 ?auto_611649 ) ) ( not ( = ?auto_611640 ?auto_611650 ) ) ( not ( = ?auto_611640 ?auto_611651 ) ) ( not ( = ?auto_611640 ?auto_611652 ) ) ( not ( = ?auto_611641 ?auto_611642 ) ) ( not ( = ?auto_611641 ?auto_611643 ) ) ( not ( = ?auto_611641 ?auto_611644 ) ) ( not ( = ?auto_611641 ?auto_611645 ) ) ( not ( = ?auto_611641 ?auto_611646 ) ) ( not ( = ?auto_611641 ?auto_611647 ) ) ( not ( = ?auto_611641 ?auto_611648 ) ) ( not ( = ?auto_611641 ?auto_611649 ) ) ( not ( = ?auto_611641 ?auto_611650 ) ) ( not ( = ?auto_611641 ?auto_611651 ) ) ( not ( = ?auto_611641 ?auto_611652 ) ) ( not ( = ?auto_611642 ?auto_611643 ) ) ( not ( = ?auto_611642 ?auto_611644 ) ) ( not ( = ?auto_611642 ?auto_611645 ) ) ( not ( = ?auto_611642 ?auto_611646 ) ) ( not ( = ?auto_611642 ?auto_611647 ) ) ( not ( = ?auto_611642 ?auto_611648 ) ) ( not ( = ?auto_611642 ?auto_611649 ) ) ( not ( = ?auto_611642 ?auto_611650 ) ) ( not ( = ?auto_611642 ?auto_611651 ) ) ( not ( = ?auto_611642 ?auto_611652 ) ) ( not ( = ?auto_611643 ?auto_611644 ) ) ( not ( = ?auto_611643 ?auto_611645 ) ) ( not ( = ?auto_611643 ?auto_611646 ) ) ( not ( = ?auto_611643 ?auto_611647 ) ) ( not ( = ?auto_611643 ?auto_611648 ) ) ( not ( = ?auto_611643 ?auto_611649 ) ) ( not ( = ?auto_611643 ?auto_611650 ) ) ( not ( = ?auto_611643 ?auto_611651 ) ) ( not ( = ?auto_611643 ?auto_611652 ) ) ( not ( = ?auto_611644 ?auto_611645 ) ) ( not ( = ?auto_611644 ?auto_611646 ) ) ( not ( = ?auto_611644 ?auto_611647 ) ) ( not ( = ?auto_611644 ?auto_611648 ) ) ( not ( = ?auto_611644 ?auto_611649 ) ) ( not ( = ?auto_611644 ?auto_611650 ) ) ( not ( = ?auto_611644 ?auto_611651 ) ) ( not ( = ?auto_611644 ?auto_611652 ) ) ( not ( = ?auto_611645 ?auto_611646 ) ) ( not ( = ?auto_611645 ?auto_611647 ) ) ( not ( = ?auto_611645 ?auto_611648 ) ) ( not ( = ?auto_611645 ?auto_611649 ) ) ( not ( = ?auto_611645 ?auto_611650 ) ) ( not ( = ?auto_611645 ?auto_611651 ) ) ( not ( = ?auto_611645 ?auto_611652 ) ) ( not ( = ?auto_611646 ?auto_611647 ) ) ( not ( = ?auto_611646 ?auto_611648 ) ) ( not ( = ?auto_611646 ?auto_611649 ) ) ( not ( = ?auto_611646 ?auto_611650 ) ) ( not ( = ?auto_611646 ?auto_611651 ) ) ( not ( = ?auto_611646 ?auto_611652 ) ) ( not ( = ?auto_611647 ?auto_611648 ) ) ( not ( = ?auto_611647 ?auto_611649 ) ) ( not ( = ?auto_611647 ?auto_611650 ) ) ( not ( = ?auto_611647 ?auto_611651 ) ) ( not ( = ?auto_611647 ?auto_611652 ) ) ( not ( = ?auto_611648 ?auto_611649 ) ) ( not ( = ?auto_611648 ?auto_611650 ) ) ( not ( = ?auto_611648 ?auto_611651 ) ) ( not ( = ?auto_611648 ?auto_611652 ) ) ( not ( = ?auto_611649 ?auto_611650 ) ) ( not ( = ?auto_611649 ?auto_611651 ) ) ( not ( = ?auto_611649 ?auto_611652 ) ) ( not ( = ?auto_611650 ?auto_611651 ) ) ( not ( = ?auto_611650 ?auto_611652 ) ) ( not ( = ?auto_611651 ?auto_611652 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_611652 )
      ( !STACK ?auto_611652 ?auto_611651 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611670 - BLOCK
      ?auto_611671 - BLOCK
      ?auto_611672 - BLOCK
      ?auto_611673 - BLOCK
      ?auto_611674 - BLOCK
      ?auto_611675 - BLOCK
      ?auto_611676 - BLOCK
      ?auto_611677 - BLOCK
      ?auto_611678 - BLOCK
      ?auto_611679 - BLOCK
      ?auto_611680 - BLOCK
      ?auto_611681 - BLOCK
      ?auto_611682 - BLOCK
      ?auto_611683 - BLOCK
      ?auto_611684 - BLOCK
      ?auto_611685 - BLOCK
      ?auto_611686 - BLOCK
    )
    :vars
    (
      ?auto_611687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611686 ?auto_611687 ) ( ON-TABLE ?auto_611670 ) ( ON ?auto_611671 ?auto_611670 ) ( ON ?auto_611672 ?auto_611671 ) ( ON ?auto_611673 ?auto_611672 ) ( ON ?auto_611674 ?auto_611673 ) ( ON ?auto_611675 ?auto_611674 ) ( ON ?auto_611676 ?auto_611675 ) ( ON ?auto_611677 ?auto_611676 ) ( ON ?auto_611678 ?auto_611677 ) ( ON ?auto_611679 ?auto_611678 ) ( ON ?auto_611680 ?auto_611679 ) ( ON ?auto_611681 ?auto_611680 ) ( ON ?auto_611682 ?auto_611681 ) ( ON ?auto_611683 ?auto_611682 ) ( ON ?auto_611684 ?auto_611683 ) ( not ( = ?auto_611670 ?auto_611671 ) ) ( not ( = ?auto_611670 ?auto_611672 ) ) ( not ( = ?auto_611670 ?auto_611673 ) ) ( not ( = ?auto_611670 ?auto_611674 ) ) ( not ( = ?auto_611670 ?auto_611675 ) ) ( not ( = ?auto_611670 ?auto_611676 ) ) ( not ( = ?auto_611670 ?auto_611677 ) ) ( not ( = ?auto_611670 ?auto_611678 ) ) ( not ( = ?auto_611670 ?auto_611679 ) ) ( not ( = ?auto_611670 ?auto_611680 ) ) ( not ( = ?auto_611670 ?auto_611681 ) ) ( not ( = ?auto_611670 ?auto_611682 ) ) ( not ( = ?auto_611670 ?auto_611683 ) ) ( not ( = ?auto_611670 ?auto_611684 ) ) ( not ( = ?auto_611670 ?auto_611685 ) ) ( not ( = ?auto_611670 ?auto_611686 ) ) ( not ( = ?auto_611670 ?auto_611687 ) ) ( not ( = ?auto_611671 ?auto_611672 ) ) ( not ( = ?auto_611671 ?auto_611673 ) ) ( not ( = ?auto_611671 ?auto_611674 ) ) ( not ( = ?auto_611671 ?auto_611675 ) ) ( not ( = ?auto_611671 ?auto_611676 ) ) ( not ( = ?auto_611671 ?auto_611677 ) ) ( not ( = ?auto_611671 ?auto_611678 ) ) ( not ( = ?auto_611671 ?auto_611679 ) ) ( not ( = ?auto_611671 ?auto_611680 ) ) ( not ( = ?auto_611671 ?auto_611681 ) ) ( not ( = ?auto_611671 ?auto_611682 ) ) ( not ( = ?auto_611671 ?auto_611683 ) ) ( not ( = ?auto_611671 ?auto_611684 ) ) ( not ( = ?auto_611671 ?auto_611685 ) ) ( not ( = ?auto_611671 ?auto_611686 ) ) ( not ( = ?auto_611671 ?auto_611687 ) ) ( not ( = ?auto_611672 ?auto_611673 ) ) ( not ( = ?auto_611672 ?auto_611674 ) ) ( not ( = ?auto_611672 ?auto_611675 ) ) ( not ( = ?auto_611672 ?auto_611676 ) ) ( not ( = ?auto_611672 ?auto_611677 ) ) ( not ( = ?auto_611672 ?auto_611678 ) ) ( not ( = ?auto_611672 ?auto_611679 ) ) ( not ( = ?auto_611672 ?auto_611680 ) ) ( not ( = ?auto_611672 ?auto_611681 ) ) ( not ( = ?auto_611672 ?auto_611682 ) ) ( not ( = ?auto_611672 ?auto_611683 ) ) ( not ( = ?auto_611672 ?auto_611684 ) ) ( not ( = ?auto_611672 ?auto_611685 ) ) ( not ( = ?auto_611672 ?auto_611686 ) ) ( not ( = ?auto_611672 ?auto_611687 ) ) ( not ( = ?auto_611673 ?auto_611674 ) ) ( not ( = ?auto_611673 ?auto_611675 ) ) ( not ( = ?auto_611673 ?auto_611676 ) ) ( not ( = ?auto_611673 ?auto_611677 ) ) ( not ( = ?auto_611673 ?auto_611678 ) ) ( not ( = ?auto_611673 ?auto_611679 ) ) ( not ( = ?auto_611673 ?auto_611680 ) ) ( not ( = ?auto_611673 ?auto_611681 ) ) ( not ( = ?auto_611673 ?auto_611682 ) ) ( not ( = ?auto_611673 ?auto_611683 ) ) ( not ( = ?auto_611673 ?auto_611684 ) ) ( not ( = ?auto_611673 ?auto_611685 ) ) ( not ( = ?auto_611673 ?auto_611686 ) ) ( not ( = ?auto_611673 ?auto_611687 ) ) ( not ( = ?auto_611674 ?auto_611675 ) ) ( not ( = ?auto_611674 ?auto_611676 ) ) ( not ( = ?auto_611674 ?auto_611677 ) ) ( not ( = ?auto_611674 ?auto_611678 ) ) ( not ( = ?auto_611674 ?auto_611679 ) ) ( not ( = ?auto_611674 ?auto_611680 ) ) ( not ( = ?auto_611674 ?auto_611681 ) ) ( not ( = ?auto_611674 ?auto_611682 ) ) ( not ( = ?auto_611674 ?auto_611683 ) ) ( not ( = ?auto_611674 ?auto_611684 ) ) ( not ( = ?auto_611674 ?auto_611685 ) ) ( not ( = ?auto_611674 ?auto_611686 ) ) ( not ( = ?auto_611674 ?auto_611687 ) ) ( not ( = ?auto_611675 ?auto_611676 ) ) ( not ( = ?auto_611675 ?auto_611677 ) ) ( not ( = ?auto_611675 ?auto_611678 ) ) ( not ( = ?auto_611675 ?auto_611679 ) ) ( not ( = ?auto_611675 ?auto_611680 ) ) ( not ( = ?auto_611675 ?auto_611681 ) ) ( not ( = ?auto_611675 ?auto_611682 ) ) ( not ( = ?auto_611675 ?auto_611683 ) ) ( not ( = ?auto_611675 ?auto_611684 ) ) ( not ( = ?auto_611675 ?auto_611685 ) ) ( not ( = ?auto_611675 ?auto_611686 ) ) ( not ( = ?auto_611675 ?auto_611687 ) ) ( not ( = ?auto_611676 ?auto_611677 ) ) ( not ( = ?auto_611676 ?auto_611678 ) ) ( not ( = ?auto_611676 ?auto_611679 ) ) ( not ( = ?auto_611676 ?auto_611680 ) ) ( not ( = ?auto_611676 ?auto_611681 ) ) ( not ( = ?auto_611676 ?auto_611682 ) ) ( not ( = ?auto_611676 ?auto_611683 ) ) ( not ( = ?auto_611676 ?auto_611684 ) ) ( not ( = ?auto_611676 ?auto_611685 ) ) ( not ( = ?auto_611676 ?auto_611686 ) ) ( not ( = ?auto_611676 ?auto_611687 ) ) ( not ( = ?auto_611677 ?auto_611678 ) ) ( not ( = ?auto_611677 ?auto_611679 ) ) ( not ( = ?auto_611677 ?auto_611680 ) ) ( not ( = ?auto_611677 ?auto_611681 ) ) ( not ( = ?auto_611677 ?auto_611682 ) ) ( not ( = ?auto_611677 ?auto_611683 ) ) ( not ( = ?auto_611677 ?auto_611684 ) ) ( not ( = ?auto_611677 ?auto_611685 ) ) ( not ( = ?auto_611677 ?auto_611686 ) ) ( not ( = ?auto_611677 ?auto_611687 ) ) ( not ( = ?auto_611678 ?auto_611679 ) ) ( not ( = ?auto_611678 ?auto_611680 ) ) ( not ( = ?auto_611678 ?auto_611681 ) ) ( not ( = ?auto_611678 ?auto_611682 ) ) ( not ( = ?auto_611678 ?auto_611683 ) ) ( not ( = ?auto_611678 ?auto_611684 ) ) ( not ( = ?auto_611678 ?auto_611685 ) ) ( not ( = ?auto_611678 ?auto_611686 ) ) ( not ( = ?auto_611678 ?auto_611687 ) ) ( not ( = ?auto_611679 ?auto_611680 ) ) ( not ( = ?auto_611679 ?auto_611681 ) ) ( not ( = ?auto_611679 ?auto_611682 ) ) ( not ( = ?auto_611679 ?auto_611683 ) ) ( not ( = ?auto_611679 ?auto_611684 ) ) ( not ( = ?auto_611679 ?auto_611685 ) ) ( not ( = ?auto_611679 ?auto_611686 ) ) ( not ( = ?auto_611679 ?auto_611687 ) ) ( not ( = ?auto_611680 ?auto_611681 ) ) ( not ( = ?auto_611680 ?auto_611682 ) ) ( not ( = ?auto_611680 ?auto_611683 ) ) ( not ( = ?auto_611680 ?auto_611684 ) ) ( not ( = ?auto_611680 ?auto_611685 ) ) ( not ( = ?auto_611680 ?auto_611686 ) ) ( not ( = ?auto_611680 ?auto_611687 ) ) ( not ( = ?auto_611681 ?auto_611682 ) ) ( not ( = ?auto_611681 ?auto_611683 ) ) ( not ( = ?auto_611681 ?auto_611684 ) ) ( not ( = ?auto_611681 ?auto_611685 ) ) ( not ( = ?auto_611681 ?auto_611686 ) ) ( not ( = ?auto_611681 ?auto_611687 ) ) ( not ( = ?auto_611682 ?auto_611683 ) ) ( not ( = ?auto_611682 ?auto_611684 ) ) ( not ( = ?auto_611682 ?auto_611685 ) ) ( not ( = ?auto_611682 ?auto_611686 ) ) ( not ( = ?auto_611682 ?auto_611687 ) ) ( not ( = ?auto_611683 ?auto_611684 ) ) ( not ( = ?auto_611683 ?auto_611685 ) ) ( not ( = ?auto_611683 ?auto_611686 ) ) ( not ( = ?auto_611683 ?auto_611687 ) ) ( not ( = ?auto_611684 ?auto_611685 ) ) ( not ( = ?auto_611684 ?auto_611686 ) ) ( not ( = ?auto_611684 ?auto_611687 ) ) ( not ( = ?auto_611685 ?auto_611686 ) ) ( not ( = ?auto_611685 ?auto_611687 ) ) ( not ( = ?auto_611686 ?auto_611687 ) ) ( CLEAR ?auto_611684 ) ( ON ?auto_611685 ?auto_611686 ) ( CLEAR ?auto_611685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_611670 ?auto_611671 ?auto_611672 ?auto_611673 ?auto_611674 ?auto_611675 ?auto_611676 ?auto_611677 ?auto_611678 ?auto_611679 ?auto_611680 ?auto_611681 ?auto_611682 ?auto_611683 ?auto_611684 ?auto_611685 )
      ( MAKE-17PILE ?auto_611670 ?auto_611671 ?auto_611672 ?auto_611673 ?auto_611674 ?auto_611675 ?auto_611676 ?auto_611677 ?auto_611678 ?auto_611679 ?auto_611680 ?auto_611681 ?auto_611682 ?auto_611683 ?auto_611684 ?auto_611685 ?auto_611686 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611705 - BLOCK
      ?auto_611706 - BLOCK
      ?auto_611707 - BLOCK
      ?auto_611708 - BLOCK
      ?auto_611709 - BLOCK
      ?auto_611710 - BLOCK
      ?auto_611711 - BLOCK
      ?auto_611712 - BLOCK
      ?auto_611713 - BLOCK
      ?auto_611714 - BLOCK
      ?auto_611715 - BLOCK
      ?auto_611716 - BLOCK
      ?auto_611717 - BLOCK
      ?auto_611718 - BLOCK
      ?auto_611719 - BLOCK
      ?auto_611720 - BLOCK
      ?auto_611721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_611721 ) ( ON-TABLE ?auto_611705 ) ( ON ?auto_611706 ?auto_611705 ) ( ON ?auto_611707 ?auto_611706 ) ( ON ?auto_611708 ?auto_611707 ) ( ON ?auto_611709 ?auto_611708 ) ( ON ?auto_611710 ?auto_611709 ) ( ON ?auto_611711 ?auto_611710 ) ( ON ?auto_611712 ?auto_611711 ) ( ON ?auto_611713 ?auto_611712 ) ( ON ?auto_611714 ?auto_611713 ) ( ON ?auto_611715 ?auto_611714 ) ( ON ?auto_611716 ?auto_611715 ) ( ON ?auto_611717 ?auto_611716 ) ( ON ?auto_611718 ?auto_611717 ) ( ON ?auto_611719 ?auto_611718 ) ( not ( = ?auto_611705 ?auto_611706 ) ) ( not ( = ?auto_611705 ?auto_611707 ) ) ( not ( = ?auto_611705 ?auto_611708 ) ) ( not ( = ?auto_611705 ?auto_611709 ) ) ( not ( = ?auto_611705 ?auto_611710 ) ) ( not ( = ?auto_611705 ?auto_611711 ) ) ( not ( = ?auto_611705 ?auto_611712 ) ) ( not ( = ?auto_611705 ?auto_611713 ) ) ( not ( = ?auto_611705 ?auto_611714 ) ) ( not ( = ?auto_611705 ?auto_611715 ) ) ( not ( = ?auto_611705 ?auto_611716 ) ) ( not ( = ?auto_611705 ?auto_611717 ) ) ( not ( = ?auto_611705 ?auto_611718 ) ) ( not ( = ?auto_611705 ?auto_611719 ) ) ( not ( = ?auto_611705 ?auto_611720 ) ) ( not ( = ?auto_611705 ?auto_611721 ) ) ( not ( = ?auto_611706 ?auto_611707 ) ) ( not ( = ?auto_611706 ?auto_611708 ) ) ( not ( = ?auto_611706 ?auto_611709 ) ) ( not ( = ?auto_611706 ?auto_611710 ) ) ( not ( = ?auto_611706 ?auto_611711 ) ) ( not ( = ?auto_611706 ?auto_611712 ) ) ( not ( = ?auto_611706 ?auto_611713 ) ) ( not ( = ?auto_611706 ?auto_611714 ) ) ( not ( = ?auto_611706 ?auto_611715 ) ) ( not ( = ?auto_611706 ?auto_611716 ) ) ( not ( = ?auto_611706 ?auto_611717 ) ) ( not ( = ?auto_611706 ?auto_611718 ) ) ( not ( = ?auto_611706 ?auto_611719 ) ) ( not ( = ?auto_611706 ?auto_611720 ) ) ( not ( = ?auto_611706 ?auto_611721 ) ) ( not ( = ?auto_611707 ?auto_611708 ) ) ( not ( = ?auto_611707 ?auto_611709 ) ) ( not ( = ?auto_611707 ?auto_611710 ) ) ( not ( = ?auto_611707 ?auto_611711 ) ) ( not ( = ?auto_611707 ?auto_611712 ) ) ( not ( = ?auto_611707 ?auto_611713 ) ) ( not ( = ?auto_611707 ?auto_611714 ) ) ( not ( = ?auto_611707 ?auto_611715 ) ) ( not ( = ?auto_611707 ?auto_611716 ) ) ( not ( = ?auto_611707 ?auto_611717 ) ) ( not ( = ?auto_611707 ?auto_611718 ) ) ( not ( = ?auto_611707 ?auto_611719 ) ) ( not ( = ?auto_611707 ?auto_611720 ) ) ( not ( = ?auto_611707 ?auto_611721 ) ) ( not ( = ?auto_611708 ?auto_611709 ) ) ( not ( = ?auto_611708 ?auto_611710 ) ) ( not ( = ?auto_611708 ?auto_611711 ) ) ( not ( = ?auto_611708 ?auto_611712 ) ) ( not ( = ?auto_611708 ?auto_611713 ) ) ( not ( = ?auto_611708 ?auto_611714 ) ) ( not ( = ?auto_611708 ?auto_611715 ) ) ( not ( = ?auto_611708 ?auto_611716 ) ) ( not ( = ?auto_611708 ?auto_611717 ) ) ( not ( = ?auto_611708 ?auto_611718 ) ) ( not ( = ?auto_611708 ?auto_611719 ) ) ( not ( = ?auto_611708 ?auto_611720 ) ) ( not ( = ?auto_611708 ?auto_611721 ) ) ( not ( = ?auto_611709 ?auto_611710 ) ) ( not ( = ?auto_611709 ?auto_611711 ) ) ( not ( = ?auto_611709 ?auto_611712 ) ) ( not ( = ?auto_611709 ?auto_611713 ) ) ( not ( = ?auto_611709 ?auto_611714 ) ) ( not ( = ?auto_611709 ?auto_611715 ) ) ( not ( = ?auto_611709 ?auto_611716 ) ) ( not ( = ?auto_611709 ?auto_611717 ) ) ( not ( = ?auto_611709 ?auto_611718 ) ) ( not ( = ?auto_611709 ?auto_611719 ) ) ( not ( = ?auto_611709 ?auto_611720 ) ) ( not ( = ?auto_611709 ?auto_611721 ) ) ( not ( = ?auto_611710 ?auto_611711 ) ) ( not ( = ?auto_611710 ?auto_611712 ) ) ( not ( = ?auto_611710 ?auto_611713 ) ) ( not ( = ?auto_611710 ?auto_611714 ) ) ( not ( = ?auto_611710 ?auto_611715 ) ) ( not ( = ?auto_611710 ?auto_611716 ) ) ( not ( = ?auto_611710 ?auto_611717 ) ) ( not ( = ?auto_611710 ?auto_611718 ) ) ( not ( = ?auto_611710 ?auto_611719 ) ) ( not ( = ?auto_611710 ?auto_611720 ) ) ( not ( = ?auto_611710 ?auto_611721 ) ) ( not ( = ?auto_611711 ?auto_611712 ) ) ( not ( = ?auto_611711 ?auto_611713 ) ) ( not ( = ?auto_611711 ?auto_611714 ) ) ( not ( = ?auto_611711 ?auto_611715 ) ) ( not ( = ?auto_611711 ?auto_611716 ) ) ( not ( = ?auto_611711 ?auto_611717 ) ) ( not ( = ?auto_611711 ?auto_611718 ) ) ( not ( = ?auto_611711 ?auto_611719 ) ) ( not ( = ?auto_611711 ?auto_611720 ) ) ( not ( = ?auto_611711 ?auto_611721 ) ) ( not ( = ?auto_611712 ?auto_611713 ) ) ( not ( = ?auto_611712 ?auto_611714 ) ) ( not ( = ?auto_611712 ?auto_611715 ) ) ( not ( = ?auto_611712 ?auto_611716 ) ) ( not ( = ?auto_611712 ?auto_611717 ) ) ( not ( = ?auto_611712 ?auto_611718 ) ) ( not ( = ?auto_611712 ?auto_611719 ) ) ( not ( = ?auto_611712 ?auto_611720 ) ) ( not ( = ?auto_611712 ?auto_611721 ) ) ( not ( = ?auto_611713 ?auto_611714 ) ) ( not ( = ?auto_611713 ?auto_611715 ) ) ( not ( = ?auto_611713 ?auto_611716 ) ) ( not ( = ?auto_611713 ?auto_611717 ) ) ( not ( = ?auto_611713 ?auto_611718 ) ) ( not ( = ?auto_611713 ?auto_611719 ) ) ( not ( = ?auto_611713 ?auto_611720 ) ) ( not ( = ?auto_611713 ?auto_611721 ) ) ( not ( = ?auto_611714 ?auto_611715 ) ) ( not ( = ?auto_611714 ?auto_611716 ) ) ( not ( = ?auto_611714 ?auto_611717 ) ) ( not ( = ?auto_611714 ?auto_611718 ) ) ( not ( = ?auto_611714 ?auto_611719 ) ) ( not ( = ?auto_611714 ?auto_611720 ) ) ( not ( = ?auto_611714 ?auto_611721 ) ) ( not ( = ?auto_611715 ?auto_611716 ) ) ( not ( = ?auto_611715 ?auto_611717 ) ) ( not ( = ?auto_611715 ?auto_611718 ) ) ( not ( = ?auto_611715 ?auto_611719 ) ) ( not ( = ?auto_611715 ?auto_611720 ) ) ( not ( = ?auto_611715 ?auto_611721 ) ) ( not ( = ?auto_611716 ?auto_611717 ) ) ( not ( = ?auto_611716 ?auto_611718 ) ) ( not ( = ?auto_611716 ?auto_611719 ) ) ( not ( = ?auto_611716 ?auto_611720 ) ) ( not ( = ?auto_611716 ?auto_611721 ) ) ( not ( = ?auto_611717 ?auto_611718 ) ) ( not ( = ?auto_611717 ?auto_611719 ) ) ( not ( = ?auto_611717 ?auto_611720 ) ) ( not ( = ?auto_611717 ?auto_611721 ) ) ( not ( = ?auto_611718 ?auto_611719 ) ) ( not ( = ?auto_611718 ?auto_611720 ) ) ( not ( = ?auto_611718 ?auto_611721 ) ) ( not ( = ?auto_611719 ?auto_611720 ) ) ( not ( = ?auto_611719 ?auto_611721 ) ) ( not ( = ?auto_611720 ?auto_611721 ) ) ( CLEAR ?auto_611719 ) ( ON ?auto_611720 ?auto_611721 ) ( CLEAR ?auto_611720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_611705 ?auto_611706 ?auto_611707 ?auto_611708 ?auto_611709 ?auto_611710 ?auto_611711 ?auto_611712 ?auto_611713 ?auto_611714 ?auto_611715 ?auto_611716 ?auto_611717 ?auto_611718 ?auto_611719 ?auto_611720 )
      ( MAKE-17PILE ?auto_611705 ?auto_611706 ?auto_611707 ?auto_611708 ?auto_611709 ?auto_611710 ?auto_611711 ?auto_611712 ?auto_611713 ?auto_611714 ?auto_611715 ?auto_611716 ?auto_611717 ?auto_611718 ?auto_611719 ?auto_611720 ?auto_611721 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611739 - BLOCK
      ?auto_611740 - BLOCK
      ?auto_611741 - BLOCK
      ?auto_611742 - BLOCK
      ?auto_611743 - BLOCK
      ?auto_611744 - BLOCK
      ?auto_611745 - BLOCK
      ?auto_611746 - BLOCK
      ?auto_611747 - BLOCK
      ?auto_611748 - BLOCK
      ?auto_611749 - BLOCK
      ?auto_611750 - BLOCK
      ?auto_611751 - BLOCK
      ?auto_611752 - BLOCK
      ?auto_611753 - BLOCK
      ?auto_611754 - BLOCK
      ?auto_611755 - BLOCK
    )
    :vars
    (
      ?auto_611756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611755 ?auto_611756 ) ( ON-TABLE ?auto_611739 ) ( ON ?auto_611740 ?auto_611739 ) ( ON ?auto_611741 ?auto_611740 ) ( ON ?auto_611742 ?auto_611741 ) ( ON ?auto_611743 ?auto_611742 ) ( ON ?auto_611744 ?auto_611743 ) ( ON ?auto_611745 ?auto_611744 ) ( ON ?auto_611746 ?auto_611745 ) ( ON ?auto_611747 ?auto_611746 ) ( ON ?auto_611748 ?auto_611747 ) ( ON ?auto_611749 ?auto_611748 ) ( ON ?auto_611750 ?auto_611749 ) ( ON ?auto_611751 ?auto_611750 ) ( ON ?auto_611752 ?auto_611751 ) ( not ( = ?auto_611739 ?auto_611740 ) ) ( not ( = ?auto_611739 ?auto_611741 ) ) ( not ( = ?auto_611739 ?auto_611742 ) ) ( not ( = ?auto_611739 ?auto_611743 ) ) ( not ( = ?auto_611739 ?auto_611744 ) ) ( not ( = ?auto_611739 ?auto_611745 ) ) ( not ( = ?auto_611739 ?auto_611746 ) ) ( not ( = ?auto_611739 ?auto_611747 ) ) ( not ( = ?auto_611739 ?auto_611748 ) ) ( not ( = ?auto_611739 ?auto_611749 ) ) ( not ( = ?auto_611739 ?auto_611750 ) ) ( not ( = ?auto_611739 ?auto_611751 ) ) ( not ( = ?auto_611739 ?auto_611752 ) ) ( not ( = ?auto_611739 ?auto_611753 ) ) ( not ( = ?auto_611739 ?auto_611754 ) ) ( not ( = ?auto_611739 ?auto_611755 ) ) ( not ( = ?auto_611739 ?auto_611756 ) ) ( not ( = ?auto_611740 ?auto_611741 ) ) ( not ( = ?auto_611740 ?auto_611742 ) ) ( not ( = ?auto_611740 ?auto_611743 ) ) ( not ( = ?auto_611740 ?auto_611744 ) ) ( not ( = ?auto_611740 ?auto_611745 ) ) ( not ( = ?auto_611740 ?auto_611746 ) ) ( not ( = ?auto_611740 ?auto_611747 ) ) ( not ( = ?auto_611740 ?auto_611748 ) ) ( not ( = ?auto_611740 ?auto_611749 ) ) ( not ( = ?auto_611740 ?auto_611750 ) ) ( not ( = ?auto_611740 ?auto_611751 ) ) ( not ( = ?auto_611740 ?auto_611752 ) ) ( not ( = ?auto_611740 ?auto_611753 ) ) ( not ( = ?auto_611740 ?auto_611754 ) ) ( not ( = ?auto_611740 ?auto_611755 ) ) ( not ( = ?auto_611740 ?auto_611756 ) ) ( not ( = ?auto_611741 ?auto_611742 ) ) ( not ( = ?auto_611741 ?auto_611743 ) ) ( not ( = ?auto_611741 ?auto_611744 ) ) ( not ( = ?auto_611741 ?auto_611745 ) ) ( not ( = ?auto_611741 ?auto_611746 ) ) ( not ( = ?auto_611741 ?auto_611747 ) ) ( not ( = ?auto_611741 ?auto_611748 ) ) ( not ( = ?auto_611741 ?auto_611749 ) ) ( not ( = ?auto_611741 ?auto_611750 ) ) ( not ( = ?auto_611741 ?auto_611751 ) ) ( not ( = ?auto_611741 ?auto_611752 ) ) ( not ( = ?auto_611741 ?auto_611753 ) ) ( not ( = ?auto_611741 ?auto_611754 ) ) ( not ( = ?auto_611741 ?auto_611755 ) ) ( not ( = ?auto_611741 ?auto_611756 ) ) ( not ( = ?auto_611742 ?auto_611743 ) ) ( not ( = ?auto_611742 ?auto_611744 ) ) ( not ( = ?auto_611742 ?auto_611745 ) ) ( not ( = ?auto_611742 ?auto_611746 ) ) ( not ( = ?auto_611742 ?auto_611747 ) ) ( not ( = ?auto_611742 ?auto_611748 ) ) ( not ( = ?auto_611742 ?auto_611749 ) ) ( not ( = ?auto_611742 ?auto_611750 ) ) ( not ( = ?auto_611742 ?auto_611751 ) ) ( not ( = ?auto_611742 ?auto_611752 ) ) ( not ( = ?auto_611742 ?auto_611753 ) ) ( not ( = ?auto_611742 ?auto_611754 ) ) ( not ( = ?auto_611742 ?auto_611755 ) ) ( not ( = ?auto_611742 ?auto_611756 ) ) ( not ( = ?auto_611743 ?auto_611744 ) ) ( not ( = ?auto_611743 ?auto_611745 ) ) ( not ( = ?auto_611743 ?auto_611746 ) ) ( not ( = ?auto_611743 ?auto_611747 ) ) ( not ( = ?auto_611743 ?auto_611748 ) ) ( not ( = ?auto_611743 ?auto_611749 ) ) ( not ( = ?auto_611743 ?auto_611750 ) ) ( not ( = ?auto_611743 ?auto_611751 ) ) ( not ( = ?auto_611743 ?auto_611752 ) ) ( not ( = ?auto_611743 ?auto_611753 ) ) ( not ( = ?auto_611743 ?auto_611754 ) ) ( not ( = ?auto_611743 ?auto_611755 ) ) ( not ( = ?auto_611743 ?auto_611756 ) ) ( not ( = ?auto_611744 ?auto_611745 ) ) ( not ( = ?auto_611744 ?auto_611746 ) ) ( not ( = ?auto_611744 ?auto_611747 ) ) ( not ( = ?auto_611744 ?auto_611748 ) ) ( not ( = ?auto_611744 ?auto_611749 ) ) ( not ( = ?auto_611744 ?auto_611750 ) ) ( not ( = ?auto_611744 ?auto_611751 ) ) ( not ( = ?auto_611744 ?auto_611752 ) ) ( not ( = ?auto_611744 ?auto_611753 ) ) ( not ( = ?auto_611744 ?auto_611754 ) ) ( not ( = ?auto_611744 ?auto_611755 ) ) ( not ( = ?auto_611744 ?auto_611756 ) ) ( not ( = ?auto_611745 ?auto_611746 ) ) ( not ( = ?auto_611745 ?auto_611747 ) ) ( not ( = ?auto_611745 ?auto_611748 ) ) ( not ( = ?auto_611745 ?auto_611749 ) ) ( not ( = ?auto_611745 ?auto_611750 ) ) ( not ( = ?auto_611745 ?auto_611751 ) ) ( not ( = ?auto_611745 ?auto_611752 ) ) ( not ( = ?auto_611745 ?auto_611753 ) ) ( not ( = ?auto_611745 ?auto_611754 ) ) ( not ( = ?auto_611745 ?auto_611755 ) ) ( not ( = ?auto_611745 ?auto_611756 ) ) ( not ( = ?auto_611746 ?auto_611747 ) ) ( not ( = ?auto_611746 ?auto_611748 ) ) ( not ( = ?auto_611746 ?auto_611749 ) ) ( not ( = ?auto_611746 ?auto_611750 ) ) ( not ( = ?auto_611746 ?auto_611751 ) ) ( not ( = ?auto_611746 ?auto_611752 ) ) ( not ( = ?auto_611746 ?auto_611753 ) ) ( not ( = ?auto_611746 ?auto_611754 ) ) ( not ( = ?auto_611746 ?auto_611755 ) ) ( not ( = ?auto_611746 ?auto_611756 ) ) ( not ( = ?auto_611747 ?auto_611748 ) ) ( not ( = ?auto_611747 ?auto_611749 ) ) ( not ( = ?auto_611747 ?auto_611750 ) ) ( not ( = ?auto_611747 ?auto_611751 ) ) ( not ( = ?auto_611747 ?auto_611752 ) ) ( not ( = ?auto_611747 ?auto_611753 ) ) ( not ( = ?auto_611747 ?auto_611754 ) ) ( not ( = ?auto_611747 ?auto_611755 ) ) ( not ( = ?auto_611747 ?auto_611756 ) ) ( not ( = ?auto_611748 ?auto_611749 ) ) ( not ( = ?auto_611748 ?auto_611750 ) ) ( not ( = ?auto_611748 ?auto_611751 ) ) ( not ( = ?auto_611748 ?auto_611752 ) ) ( not ( = ?auto_611748 ?auto_611753 ) ) ( not ( = ?auto_611748 ?auto_611754 ) ) ( not ( = ?auto_611748 ?auto_611755 ) ) ( not ( = ?auto_611748 ?auto_611756 ) ) ( not ( = ?auto_611749 ?auto_611750 ) ) ( not ( = ?auto_611749 ?auto_611751 ) ) ( not ( = ?auto_611749 ?auto_611752 ) ) ( not ( = ?auto_611749 ?auto_611753 ) ) ( not ( = ?auto_611749 ?auto_611754 ) ) ( not ( = ?auto_611749 ?auto_611755 ) ) ( not ( = ?auto_611749 ?auto_611756 ) ) ( not ( = ?auto_611750 ?auto_611751 ) ) ( not ( = ?auto_611750 ?auto_611752 ) ) ( not ( = ?auto_611750 ?auto_611753 ) ) ( not ( = ?auto_611750 ?auto_611754 ) ) ( not ( = ?auto_611750 ?auto_611755 ) ) ( not ( = ?auto_611750 ?auto_611756 ) ) ( not ( = ?auto_611751 ?auto_611752 ) ) ( not ( = ?auto_611751 ?auto_611753 ) ) ( not ( = ?auto_611751 ?auto_611754 ) ) ( not ( = ?auto_611751 ?auto_611755 ) ) ( not ( = ?auto_611751 ?auto_611756 ) ) ( not ( = ?auto_611752 ?auto_611753 ) ) ( not ( = ?auto_611752 ?auto_611754 ) ) ( not ( = ?auto_611752 ?auto_611755 ) ) ( not ( = ?auto_611752 ?auto_611756 ) ) ( not ( = ?auto_611753 ?auto_611754 ) ) ( not ( = ?auto_611753 ?auto_611755 ) ) ( not ( = ?auto_611753 ?auto_611756 ) ) ( not ( = ?auto_611754 ?auto_611755 ) ) ( not ( = ?auto_611754 ?auto_611756 ) ) ( not ( = ?auto_611755 ?auto_611756 ) ) ( ON ?auto_611754 ?auto_611755 ) ( CLEAR ?auto_611752 ) ( ON ?auto_611753 ?auto_611754 ) ( CLEAR ?auto_611753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_611739 ?auto_611740 ?auto_611741 ?auto_611742 ?auto_611743 ?auto_611744 ?auto_611745 ?auto_611746 ?auto_611747 ?auto_611748 ?auto_611749 ?auto_611750 ?auto_611751 ?auto_611752 ?auto_611753 )
      ( MAKE-17PILE ?auto_611739 ?auto_611740 ?auto_611741 ?auto_611742 ?auto_611743 ?auto_611744 ?auto_611745 ?auto_611746 ?auto_611747 ?auto_611748 ?auto_611749 ?auto_611750 ?auto_611751 ?auto_611752 ?auto_611753 ?auto_611754 ?auto_611755 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611774 - BLOCK
      ?auto_611775 - BLOCK
      ?auto_611776 - BLOCK
      ?auto_611777 - BLOCK
      ?auto_611778 - BLOCK
      ?auto_611779 - BLOCK
      ?auto_611780 - BLOCK
      ?auto_611781 - BLOCK
      ?auto_611782 - BLOCK
      ?auto_611783 - BLOCK
      ?auto_611784 - BLOCK
      ?auto_611785 - BLOCK
      ?auto_611786 - BLOCK
      ?auto_611787 - BLOCK
      ?auto_611788 - BLOCK
      ?auto_611789 - BLOCK
      ?auto_611790 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_611790 ) ( ON-TABLE ?auto_611774 ) ( ON ?auto_611775 ?auto_611774 ) ( ON ?auto_611776 ?auto_611775 ) ( ON ?auto_611777 ?auto_611776 ) ( ON ?auto_611778 ?auto_611777 ) ( ON ?auto_611779 ?auto_611778 ) ( ON ?auto_611780 ?auto_611779 ) ( ON ?auto_611781 ?auto_611780 ) ( ON ?auto_611782 ?auto_611781 ) ( ON ?auto_611783 ?auto_611782 ) ( ON ?auto_611784 ?auto_611783 ) ( ON ?auto_611785 ?auto_611784 ) ( ON ?auto_611786 ?auto_611785 ) ( ON ?auto_611787 ?auto_611786 ) ( not ( = ?auto_611774 ?auto_611775 ) ) ( not ( = ?auto_611774 ?auto_611776 ) ) ( not ( = ?auto_611774 ?auto_611777 ) ) ( not ( = ?auto_611774 ?auto_611778 ) ) ( not ( = ?auto_611774 ?auto_611779 ) ) ( not ( = ?auto_611774 ?auto_611780 ) ) ( not ( = ?auto_611774 ?auto_611781 ) ) ( not ( = ?auto_611774 ?auto_611782 ) ) ( not ( = ?auto_611774 ?auto_611783 ) ) ( not ( = ?auto_611774 ?auto_611784 ) ) ( not ( = ?auto_611774 ?auto_611785 ) ) ( not ( = ?auto_611774 ?auto_611786 ) ) ( not ( = ?auto_611774 ?auto_611787 ) ) ( not ( = ?auto_611774 ?auto_611788 ) ) ( not ( = ?auto_611774 ?auto_611789 ) ) ( not ( = ?auto_611774 ?auto_611790 ) ) ( not ( = ?auto_611775 ?auto_611776 ) ) ( not ( = ?auto_611775 ?auto_611777 ) ) ( not ( = ?auto_611775 ?auto_611778 ) ) ( not ( = ?auto_611775 ?auto_611779 ) ) ( not ( = ?auto_611775 ?auto_611780 ) ) ( not ( = ?auto_611775 ?auto_611781 ) ) ( not ( = ?auto_611775 ?auto_611782 ) ) ( not ( = ?auto_611775 ?auto_611783 ) ) ( not ( = ?auto_611775 ?auto_611784 ) ) ( not ( = ?auto_611775 ?auto_611785 ) ) ( not ( = ?auto_611775 ?auto_611786 ) ) ( not ( = ?auto_611775 ?auto_611787 ) ) ( not ( = ?auto_611775 ?auto_611788 ) ) ( not ( = ?auto_611775 ?auto_611789 ) ) ( not ( = ?auto_611775 ?auto_611790 ) ) ( not ( = ?auto_611776 ?auto_611777 ) ) ( not ( = ?auto_611776 ?auto_611778 ) ) ( not ( = ?auto_611776 ?auto_611779 ) ) ( not ( = ?auto_611776 ?auto_611780 ) ) ( not ( = ?auto_611776 ?auto_611781 ) ) ( not ( = ?auto_611776 ?auto_611782 ) ) ( not ( = ?auto_611776 ?auto_611783 ) ) ( not ( = ?auto_611776 ?auto_611784 ) ) ( not ( = ?auto_611776 ?auto_611785 ) ) ( not ( = ?auto_611776 ?auto_611786 ) ) ( not ( = ?auto_611776 ?auto_611787 ) ) ( not ( = ?auto_611776 ?auto_611788 ) ) ( not ( = ?auto_611776 ?auto_611789 ) ) ( not ( = ?auto_611776 ?auto_611790 ) ) ( not ( = ?auto_611777 ?auto_611778 ) ) ( not ( = ?auto_611777 ?auto_611779 ) ) ( not ( = ?auto_611777 ?auto_611780 ) ) ( not ( = ?auto_611777 ?auto_611781 ) ) ( not ( = ?auto_611777 ?auto_611782 ) ) ( not ( = ?auto_611777 ?auto_611783 ) ) ( not ( = ?auto_611777 ?auto_611784 ) ) ( not ( = ?auto_611777 ?auto_611785 ) ) ( not ( = ?auto_611777 ?auto_611786 ) ) ( not ( = ?auto_611777 ?auto_611787 ) ) ( not ( = ?auto_611777 ?auto_611788 ) ) ( not ( = ?auto_611777 ?auto_611789 ) ) ( not ( = ?auto_611777 ?auto_611790 ) ) ( not ( = ?auto_611778 ?auto_611779 ) ) ( not ( = ?auto_611778 ?auto_611780 ) ) ( not ( = ?auto_611778 ?auto_611781 ) ) ( not ( = ?auto_611778 ?auto_611782 ) ) ( not ( = ?auto_611778 ?auto_611783 ) ) ( not ( = ?auto_611778 ?auto_611784 ) ) ( not ( = ?auto_611778 ?auto_611785 ) ) ( not ( = ?auto_611778 ?auto_611786 ) ) ( not ( = ?auto_611778 ?auto_611787 ) ) ( not ( = ?auto_611778 ?auto_611788 ) ) ( not ( = ?auto_611778 ?auto_611789 ) ) ( not ( = ?auto_611778 ?auto_611790 ) ) ( not ( = ?auto_611779 ?auto_611780 ) ) ( not ( = ?auto_611779 ?auto_611781 ) ) ( not ( = ?auto_611779 ?auto_611782 ) ) ( not ( = ?auto_611779 ?auto_611783 ) ) ( not ( = ?auto_611779 ?auto_611784 ) ) ( not ( = ?auto_611779 ?auto_611785 ) ) ( not ( = ?auto_611779 ?auto_611786 ) ) ( not ( = ?auto_611779 ?auto_611787 ) ) ( not ( = ?auto_611779 ?auto_611788 ) ) ( not ( = ?auto_611779 ?auto_611789 ) ) ( not ( = ?auto_611779 ?auto_611790 ) ) ( not ( = ?auto_611780 ?auto_611781 ) ) ( not ( = ?auto_611780 ?auto_611782 ) ) ( not ( = ?auto_611780 ?auto_611783 ) ) ( not ( = ?auto_611780 ?auto_611784 ) ) ( not ( = ?auto_611780 ?auto_611785 ) ) ( not ( = ?auto_611780 ?auto_611786 ) ) ( not ( = ?auto_611780 ?auto_611787 ) ) ( not ( = ?auto_611780 ?auto_611788 ) ) ( not ( = ?auto_611780 ?auto_611789 ) ) ( not ( = ?auto_611780 ?auto_611790 ) ) ( not ( = ?auto_611781 ?auto_611782 ) ) ( not ( = ?auto_611781 ?auto_611783 ) ) ( not ( = ?auto_611781 ?auto_611784 ) ) ( not ( = ?auto_611781 ?auto_611785 ) ) ( not ( = ?auto_611781 ?auto_611786 ) ) ( not ( = ?auto_611781 ?auto_611787 ) ) ( not ( = ?auto_611781 ?auto_611788 ) ) ( not ( = ?auto_611781 ?auto_611789 ) ) ( not ( = ?auto_611781 ?auto_611790 ) ) ( not ( = ?auto_611782 ?auto_611783 ) ) ( not ( = ?auto_611782 ?auto_611784 ) ) ( not ( = ?auto_611782 ?auto_611785 ) ) ( not ( = ?auto_611782 ?auto_611786 ) ) ( not ( = ?auto_611782 ?auto_611787 ) ) ( not ( = ?auto_611782 ?auto_611788 ) ) ( not ( = ?auto_611782 ?auto_611789 ) ) ( not ( = ?auto_611782 ?auto_611790 ) ) ( not ( = ?auto_611783 ?auto_611784 ) ) ( not ( = ?auto_611783 ?auto_611785 ) ) ( not ( = ?auto_611783 ?auto_611786 ) ) ( not ( = ?auto_611783 ?auto_611787 ) ) ( not ( = ?auto_611783 ?auto_611788 ) ) ( not ( = ?auto_611783 ?auto_611789 ) ) ( not ( = ?auto_611783 ?auto_611790 ) ) ( not ( = ?auto_611784 ?auto_611785 ) ) ( not ( = ?auto_611784 ?auto_611786 ) ) ( not ( = ?auto_611784 ?auto_611787 ) ) ( not ( = ?auto_611784 ?auto_611788 ) ) ( not ( = ?auto_611784 ?auto_611789 ) ) ( not ( = ?auto_611784 ?auto_611790 ) ) ( not ( = ?auto_611785 ?auto_611786 ) ) ( not ( = ?auto_611785 ?auto_611787 ) ) ( not ( = ?auto_611785 ?auto_611788 ) ) ( not ( = ?auto_611785 ?auto_611789 ) ) ( not ( = ?auto_611785 ?auto_611790 ) ) ( not ( = ?auto_611786 ?auto_611787 ) ) ( not ( = ?auto_611786 ?auto_611788 ) ) ( not ( = ?auto_611786 ?auto_611789 ) ) ( not ( = ?auto_611786 ?auto_611790 ) ) ( not ( = ?auto_611787 ?auto_611788 ) ) ( not ( = ?auto_611787 ?auto_611789 ) ) ( not ( = ?auto_611787 ?auto_611790 ) ) ( not ( = ?auto_611788 ?auto_611789 ) ) ( not ( = ?auto_611788 ?auto_611790 ) ) ( not ( = ?auto_611789 ?auto_611790 ) ) ( ON ?auto_611789 ?auto_611790 ) ( CLEAR ?auto_611787 ) ( ON ?auto_611788 ?auto_611789 ) ( CLEAR ?auto_611788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_611774 ?auto_611775 ?auto_611776 ?auto_611777 ?auto_611778 ?auto_611779 ?auto_611780 ?auto_611781 ?auto_611782 ?auto_611783 ?auto_611784 ?auto_611785 ?auto_611786 ?auto_611787 ?auto_611788 )
      ( MAKE-17PILE ?auto_611774 ?auto_611775 ?auto_611776 ?auto_611777 ?auto_611778 ?auto_611779 ?auto_611780 ?auto_611781 ?auto_611782 ?auto_611783 ?auto_611784 ?auto_611785 ?auto_611786 ?auto_611787 ?auto_611788 ?auto_611789 ?auto_611790 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611808 - BLOCK
      ?auto_611809 - BLOCK
      ?auto_611810 - BLOCK
      ?auto_611811 - BLOCK
      ?auto_611812 - BLOCK
      ?auto_611813 - BLOCK
      ?auto_611814 - BLOCK
      ?auto_611815 - BLOCK
      ?auto_611816 - BLOCK
      ?auto_611817 - BLOCK
      ?auto_611818 - BLOCK
      ?auto_611819 - BLOCK
      ?auto_611820 - BLOCK
      ?auto_611821 - BLOCK
      ?auto_611822 - BLOCK
      ?auto_611823 - BLOCK
      ?auto_611824 - BLOCK
    )
    :vars
    (
      ?auto_611825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611824 ?auto_611825 ) ( ON-TABLE ?auto_611808 ) ( ON ?auto_611809 ?auto_611808 ) ( ON ?auto_611810 ?auto_611809 ) ( ON ?auto_611811 ?auto_611810 ) ( ON ?auto_611812 ?auto_611811 ) ( ON ?auto_611813 ?auto_611812 ) ( ON ?auto_611814 ?auto_611813 ) ( ON ?auto_611815 ?auto_611814 ) ( ON ?auto_611816 ?auto_611815 ) ( ON ?auto_611817 ?auto_611816 ) ( ON ?auto_611818 ?auto_611817 ) ( ON ?auto_611819 ?auto_611818 ) ( ON ?auto_611820 ?auto_611819 ) ( not ( = ?auto_611808 ?auto_611809 ) ) ( not ( = ?auto_611808 ?auto_611810 ) ) ( not ( = ?auto_611808 ?auto_611811 ) ) ( not ( = ?auto_611808 ?auto_611812 ) ) ( not ( = ?auto_611808 ?auto_611813 ) ) ( not ( = ?auto_611808 ?auto_611814 ) ) ( not ( = ?auto_611808 ?auto_611815 ) ) ( not ( = ?auto_611808 ?auto_611816 ) ) ( not ( = ?auto_611808 ?auto_611817 ) ) ( not ( = ?auto_611808 ?auto_611818 ) ) ( not ( = ?auto_611808 ?auto_611819 ) ) ( not ( = ?auto_611808 ?auto_611820 ) ) ( not ( = ?auto_611808 ?auto_611821 ) ) ( not ( = ?auto_611808 ?auto_611822 ) ) ( not ( = ?auto_611808 ?auto_611823 ) ) ( not ( = ?auto_611808 ?auto_611824 ) ) ( not ( = ?auto_611808 ?auto_611825 ) ) ( not ( = ?auto_611809 ?auto_611810 ) ) ( not ( = ?auto_611809 ?auto_611811 ) ) ( not ( = ?auto_611809 ?auto_611812 ) ) ( not ( = ?auto_611809 ?auto_611813 ) ) ( not ( = ?auto_611809 ?auto_611814 ) ) ( not ( = ?auto_611809 ?auto_611815 ) ) ( not ( = ?auto_611809 ?auto_611816 ) ) ( not ( = ?auto_611809 ?auto_611817 ) ) ( not ( = ?auto_611809 ?auto_611818 ) ) ( not ( = ?auto_611809 ?auto_611819 ) ) ( not ( = ?auto_611809 ?auto_611820 ) ) ( not ( = ?auto_611809 ?auto_611821 ) ) ( not ( = ?auto_611809 ?auto_611822 ) ) ( not ( = ?auto_611809 ?auto_611823 ) ) ( not ( = ?auto_611809 ?auto_611824 ) ) ( not ( = ?auto_611809 ?auto_611825 ) ) ( not ( = ?auto_611810 ?auto_611811 ) ) ( not ( = ?auto_611810 ?auto_611812 ) ) ( not ( = ?auto_611810 ?auto_611813 ) ) ( not ( = ?auto_611810 ?auto_611814 ) ) ( not ( = ?auto_611810 ?auto_611815 ) ) ( not ( = ?auto_611810 ?auto_611816 ) ) ( not ( = ?auto_611810 ?auto_611817 ) ) ( not ( = ?auto_611810 ?auto_611818 ) ) ( not ( = ?auto_611810 ?auto_611819 ) ) ( not ( = ?auto_611810 ?auto_611820 ) ) ( not ( = ?auto_611810 ?auto_611821 ) ) ( not ( = ?auto_611810 ?auto_611822 ) ) ( not ( = ?auto_611810 ?auto_611823 ) ) ( not ( = ?auto_611810 ?auto_611824 ) ) ( not ( = ?auto_611810 ?auto_611825 ) ) ( not ( = ?auto_611811 ?auto_611812 ) ) ( not ( = ?auto_611811 ?auto_611813 ) ) ( not ( = ?auto_611811 ?auto_611814 ) ) ( not ( = ?auto_611811 ?auto_611815 ) ) ( not ( = ?auto_611811 ?auto_611816 ) ) ( not ( = ?auto_611811 ?auto_611817 ) ) ( not ( = ?auto_611811 ?auto_611818 ) ) ( not ( = ?auto_611811 ?auto_611819 ) ) ( not ( = ?auto_611811 ?auto_611820 ) ) ( not ( = ?auto_611811 ?auto_611821 ) ) ( not ( = ?auto_611811 ?auto_611822 ) ) ( not ( = ?auto_611811 ?auto_611823 ) ) ( not ( = ?auto_611811 ?auto_611824 ) ) ( not ( = ?auto_611811 ?auto_611825 ) ) ( not ( = ?auto_611812 ?auto_611813 ) ) ( not ( = ?auto_611812 ?auto_611814 ) ) ( not ( = ?auto_611812 ?auto_611815 ) ) ( not ( = ?auto_611812 ?auto_611816 ) ) ( not ( = ?auto_611812 ?auto_611817 ) ) ( not ( = ?auto_611812 ?auto_611818 ) ) ( not ( = ?auto_611812 ?auto_611819 ) ) ( not ( = ?auto_611812 ?auto_611820 ) ) ( not ( = ?auto_611812 ?auto_611821 ) ) ( not ( = ?auto_611812 ?auto_611822 ) ) ( not ( = ?auto_611812 ?auto_611823 ) ) ( not ( = ?auto_611812 ?auto_611824 ) ) ( not ( = ?auto_611812 ?auto_611825 ) ) ( not ( = ?auto_611813 ?auto_611814 ) ) ( not ( = ?auto_611813 ?auto_611815 ) ) ( not ( = ?auto_611813 ?auto_611816 ) ) ( not ( = ?auto_611813 ?auto_611817 ) ) ( not ( = ?auto_611813 ?auto_611818 ) ) ( not ( = ?auto_611813 ?auto_611819 ) ) ( not ( = ?auto_611813 ?auto_611820 ) ) ( not ( = ?auto_611813 ?auto_611821 ) ) ( not ( = ?auto_611813 ?auto_611822 ) ) ( not ( = ?auto_611813 ?auto_611823 ) ) ( not ( = ?auto_611813 ?auto_611824 ) ) ( not ( = ?auto_611813 ?auto_611825 ) ) ( not ( = ?auto_611814 ?auto_611815 ) ) ( not ( = ?auto_611814 ?auto_611816 ) ) ( not ( = ?auto_611814 ?auto_611817 ) ) ( not ( = ?auto_611814 ?auto_611818 ) ) ( not ( = ?auto_611814 ?auto_611819 ) ) ( not ( = ?auto_611814 ?auto_611820 ) ) ( not ( = ?auto_611814 ?auto_611821 ) ) ( not ( = ?auto_611814 ?auto_611822 ) ) ( not ( = ?auto_611814 ?auto_611823 ) ) ( not ( = ?auto_611814 ?auto_611824 ) ) ( not ( = ?auto_611814 ?auto_611825 ) ) ( not ( = ?auto_611815 ?auto_611816 ) ) ( not ( = ?auto_611815 ?auto_611817 ) ) ( not ( = ?auto_611815 ?auto_611818 ) ) ( not ( = ?auto_611815 ?auto_611819 ) ) ( not ( = ?auto_611815 ?auto_611820 ) ) ( not ( = ?auto_611815 ?auto_611821 ) ) ( not ( = ?auto_611815 ?auto_611822 ) ) ( not ( = ?auto_611815 ?auto_611823 ) ) ( not ( = ?auto_611815 ?auto_611824 ) ) ( not ( = ?auto_611815 ?auto_611825 ) ) ( not ( = ?auto_611816 ?auto_611817 ) ) ( not ( = ?auto_611816 ?auto_611818 ) ) ( not ( = ?auto_611816 ?auto_611819 ) ) ( not ( = ?auto_611816 ?auto_611820 ) ) ( not ( = ?auto_611816 ?auto_611821 ) ) ( not ( = ?auto_611816 ?auto_611822 ) ) ( not ( = ?auto_611816 ?auto_611823 ) ) ( not ( = ?auto_611816 ?auto_611824 ) ) ( not ( = ?auto_611816 ?auto_611825 ) ) ( not ( = ?auto_611817 ?auto_611818 ) ) ( not ( = ?auto_611817 ?auto_611819 ) ) ( not ( = ?auto_611817 ?auto_611820 ) ) ( not ( = ?auto_611817 ?auto_611821 ) ) ( not ( = ?auto_611817 ?auto_611822 ) ) ( not ( = ?auto_611817 ?auto_611823 ) ) ( not ( = ?auto_611817 ?auto_611824 ) ) ( not ( = ?auto_611817 ?auto_611825 ) ) ( not ( = ?auto_611818 ?auto_611819 ) ) ( not ( = ?auto_611818 ?auto_611820 ) ) ( not ( = ?auto_611818 ?auto_611821 ) ) ( not ( = ?auto_611818 ?auto_611822 ) ) ( not ( = ?auto_611818 ?auto_611823 ) ) ( not ( = ?auto_611818 ?auto_611824 ) ) ( not ( = ?auto_611818 ?auto_611825 ) ) ( not ( = ?auto_611819 ?auto_611820 ) ) ( not ( = ?auto_611819 ?auto_611821 ) ) ( not ( = ?auto_611819 ?auto_611822 ) ) ( not ( = ?auto_611819 ?auto_611823 ) ) ( not ( = ?auto_611819 ?auto_611824 ) ) ( not ( = ?auto_611819 ?auto_611825 ) ) ( not ( = ?auto_611820 ?auto_611821 ) ) ( not ( = ?auto_611820 ?auto_611822 ) ) ( not ( = ?auto_611820 ?auto_611823 ) ) ( not ( = ?auto_611820 ?auto_611824 ) ) ( not ( = ?auto_611820 ?auto_611825 ) ) ( not ( = ?auto_611821 ?auto_611822 ) ) ( not ( = ?auto_611821 ?auto_611823 ) ) ( not ( = ?auto_611821 ?auto_611824 ) ) ( not ( = ?auto_611821 ?auto_611825 ) ) ( not ( = ?auto_611822 ?auto_611823 ) ) ( not ( = ?auto_611822 ?auto_611824 ) ) ( not ( = ?auto_611822 ?auto_611825 ) ) ( not ( = ?auto_611823 ?auto_611824 ) ) ( not ( = ?auto_611823 ?auto_611825 ) ) ( not ( = ?auto_611824 ?auto_611825 ) ) ( ON ?auto_611823 ?auto_611824 ) ( ON ?auto_611822 ?auto_611823 ) ( CLEAR ?auto_611820 ) ( ON ?auto_611821 ?auto_611822 ) ( CLEAR ?auto_611821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_611808 ?auto_611809 ?auto_611810 ?auto_611811 ?auto_611812 ?auto_611813 ?auto_611814 ?auto_611815 ?auto_611816 ?auto_611817 ?auto_611818 ?auto_611819 ?auto_611820 ?auto_611821 )
      ( MAKE-17PILE ?auto_611808 ?auto_611809 ?auto_611810 ?auto_611811 ?auto_611812 ?auto_611813 ?auto_611814 ?auto_611815 ?auto_611816 ?auto_611817 ?auto_611818 ?auto_611819 ?auto_611820 ?auto_611821 ?auto_611822 ?auto_611823 ?auto_611824 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611843 - BLOCK
      ?auto_611844 - BLOCK
      ?auto_611845 - BLOCK
      ?auto_611846 - BLOCK
      ?auto_611847 - BLOCK
      ?auto_611848 - BLOCK
      ?auto_611849 - BLOCK
      ?auto_611850 - BLOCK
      ?auto_611851 - BLOCK
      ?auto_611852 - BLOCK
      ?auto_611853 - BLOCK
      ?auto_611854 - BLOCK
      ?auto_611855 - BLOCK
      ?auto_611856 - BLOCK
      ?auto_611857 - BLOCK
      ?auto_611858 - BLOCK
      ?auto_611859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_611859 ) ( ON-TABLE ?auto_611843 ) ( ON ?auto_611844 ?auto_611843 ) ( ON ?auto_611845 ?auto_611844 ) ( ON ?auto_611846 ?auto_611845 ) ( ON ?auto_611847 ?auto_611846 ) ( ON ?auto_611848 ?auto_611847 ) ( ON ?auto_611849 ?auto_611848 ) ( ON ?auto_611850 ?auto_611849 ) ( ON ?auto_611851 ?auto_611850 ) ( ON ?auto_611852 ?auto_611851 ) ( ON ?auto_611853 ?auto_611852 ) ( ON ?auto_611854 ?auto_611853 ) ( ON ?auto_611855 ?auto_611854 ) ( not ( = ?auto_611843 ?auto_611844 ) ) ( not ( = ?auto_611843 ?auto_611845 ) ) ( not ( = ?auto_611843 ?auto_611846 ) ) ( not ( = ?auto_611843 ?auto_611847 ) ) ( not ( = ?auto_611843 ?auto_611848 ) ) ( not ( = ?auto_611843 ?auto_611849 ) ) ( not ( = ?auto_611843 ?auto_611850 ) ) ( not ( = ?auto_611843 ?auto_611851 ) ) ( not ( = ?auto_611843 ?auto_611852 ) ) ( not ( = ?auto_611843 ?auto_611853 ) ) ( not ( = ?auto_611843 ?auto_611854 ) ) ( not ( = ?auto_611843 ?auto_611855 ) ) ( not ( = ?auto_611843 ?auto_611856 ) ) ( not ( = ?auto_611843 ?auto_611857 ) ) ( not ( = ?auto_611843 ?auto_611858 ) ) ( not ( = ?auto_611843 ?auto_611859 ) ) ( not ( = ?auto_611844 ?auto_611845 ) ) ( not ( = ?auto_611844 ?auto_611846 ) ) ( not ( = ?auto_611844 ?auto_611847 ) ) ( not ( = ?auto_611844 ?auto_611848 ) ) ( not ( = ?auto_611844 ?auto_611849 ) ) ( not ( = ?auto_611844 ?auto_611850 ) ) ( not ( = ?auto_611844 ?auto_611851 ) ) ( not ( = ?auto_611844 ?auto_611852 ) ) ( not ( = ?auto_611844 ?auto_611853 ) ) ( not ( = ?auto_611844 ?auto_611854 ) ) ( not ( = ?auto_611844 ?auto_611855 ) ) ( not ( = ?auto_611844 ?auto_611856 ) ) ( not ( = ?auto_611844 ?auto_611857 ) ) ( not ( = ?auto_611844 ?auto_611858 ) ) ( not ( = ?auto_611844 ?auto_611859 ) ) ( not ( = ?auto_611845 ?auto_611846 ) ) ( not ( = ?auto_611845 ?auto_611847 ) ) ( not ( = ?auto_611845 ?auto_611848 ) ) ( not ( = ?auto_611845 ?auto_611849 ) ) ( not ( = ?auto_611845 ?auto_611850 ) ) ( not ( = ?auto_611845 ?auto_611851 ) ) ( not ( = ?auto_611845 ?auto_611852 ) ) ( not ( = ?auto_611845 ?auto_611853 ) ) ( not ( = ?auto_611845 ?auto_611854 ) ) ( not ( = ?auto_611845 ?auto_611855 ) ) ( not ( = ?auto_611845 ?auto_611856 ) ) ( not ( = ?auto_611845 ?auto_611857 ) ) ( not ( = ?auto_611845 ?auto_611858 ) ) ( not ( = ?auto_611845 ?auto_611859 ) ) ( not ( = ?auto_611846 ?auto_611847 ) ) ( not ( = ?auto_611846 ?auto_611848 ) ) ( not ( = ?auto_611846 ?auto_611849 ) ) ( not ( = ?auto_611846 ?auto_611850 ) ) ( not ( = ?auto_611846 ?auto_611851 ) ) ( not ( = ?auto_611846 ?auto_611852 ) ) ( not ( = ?auto_611846 ?auto_611853 ) ) ( not ( = ?auto_611846 ?auto_611854 ) ) ( not ( = ?auto_611846 ?auto_611855 ) ) ( not ( = ?auto_611846 ?auto_611856 ) ) ( not ( = ?auto_611846 ?auto_611857 ) ) ( not ( = ?auto_611846 ?auto_611858 ) ) ( not ( = ?auto_611846 ?auto_611859 ) ) ( not ( = ?auto_611847 ?auto_611848 ) ) ( not ( = ?auto_611847 ?auto_611849 ) ) ( not ( = ?auto_611847 ?auto_611850 ) ) ( not ( = ?auto_611847 ?auto_611851 ) ) ( not ( = ?auto_611847 ?auto_611852 ) ) ( not ( = ?auto_611847 ?auto_611853 ) ) ( not ( = ?auto_611847 ?auto_611854 ) ) ( not ( = ?auto_611847 ?auto_611855 ) ) ( not ( = ?auto_611847 ?auto_611856 ) ) ( not ( = ?auto_611847 ?auto_611857 ) ) ( not ( = ?auto_611847 ?auto_611858 ) ) ( not ( = ?auto_611847 ?auto_611859 ) ) ( not ( = ?auto_611848 ?auto_611849 ) ) ( not ( = ?auto_611848 ?auto_611850 ) ) ( not ( = ?auto_611848 ?auto_611851 ) ) ( not ( = ?auto_611848 ?auto_611852 ) ) ( not ( = ?auto_611848 ?auto_611853 ) ) ( not ( = ?auto_611848 ?auto_611854 ) ) ( not ( = ?auto_611848 ?auto_611855 ) ) ( not ( = ?auto_611848 ?auto_611856 ) ) ( not ( = ?auto_611848 ?auto_611857 ) ) ( not ( = ?auto_611848 ?auto_611858 ) ) ( not ( = ?auto_611848 ?auto_611859 ) ) ( not ( = ?auto_611849 ?auto_611850 ) ) ( not ( = ?auto_611849 ?auto_611851 ) ) ( not ( = ?auto_611849 ?auto_611852 ) ) ( not ( = ?auto_611849 ?auto_611853 ) ) ( not ( = ?auto_611849 ?auto_611854 ) ) ( not ( = ?auto_611849 ?auto_611855 ) ) ( not ( = ?auto_611849 ?auto_611856 ) ) ( not ( = ?auto_611849 ?auto_611857 ) ) ( not ( = ?auto_611849 ?auto_611858 ) ) ( not ( = ?auto_611849 ?auto_611859 ) ) ( not ( = ?auto_611850 ?auto_611851 ) ) ( not ( = ?auto_611850 ?auto_611852 ) ) ( not ( = ?auto_611850 ?auto_611853 ) ) ( not ( = ?auto_611850 ?auto_611854 ) ) ( not ( = ?auto_611850 ?auto_611855 ) ) ( not ( = ?auto_611850 ?auto_611856 ) ) ( not ( = ?auto_611850 ?auto_611857 ) ) ( not ( = ?auto_611850 ?auto_611858 ) ) ( not ( = ?auto_611850 ?auto_611859 ) ) ( not ( = ?auto_611851 ?auto_611852 ) ) ( not ( = ?auto_611851 ?auto_611853 ) ) ( not ( = ?auto_611851 ?auto_611854 ) ) ( not ( = ?auto_611851 ?auto_611855 ) ) ( not ( = ?auto_611851 ?auto_611856 ) ) ( not ( = ?auto_611851 ?auto_611857 ) ) ( not ( = ?auto_611851 ?auto_611858 ) ) ( not ( = ?auto_611851 ?auto_611859 ) ) ( not ( = ?auto_611852 ?auto_611853 ) ) ( not ( = ?auto_611852 ?auto_611854 ) ) ( not ( = ?auto_611852 ?auto_611855 ) ) ( not ( = ?auto_611852 ?auto_611856 ) ) ( not ( = ?auto_611852 ?auto_611857 ) ) ( not ( = ?auto_611852 ?auto_611858 ) ) ( not ( = ?auto_611852 ?auto_611859 ) ) ( not ( = ?auto_611853 ?auto_611854 ) ) ( not ( = ?auto_611853 ?auto_611855 ) ) ( not ( = ?auto_611853 ?auto_611856 ) ) ( not ( = ?auto_611853 ?auto_611857 ) ) ( not ( = ?auto_611853 ?auto_611858 ) ) ( not ( = ?auto_611853 ?auto_611859 ) ) ( not ( = ?auto_611854 ?auto_611855 ) ) ( not ( = ?auto_611854 ?auto_611856 ) ) ( not ( = ?auto_611854 ?auto_611857 ) ) ( not ( = ?auto_611854 ?auto_611858 ) ) ( not ( = ?auto_611854 ?auto_611859 ) ) ( not ( = ?auto_611855 ?auto_611856 ) ) ( not ( = ?auto_611855 ?auto_611857 ) ) ( not ( = ?auto_611855 ?auto_611858 ) ) ( not ( = ?auto_611855 ?auto_611859 ) ) ( not ( = ?auto_611856 ?auto_611857 ) ) ( not ( = ?auto_611856 ?auto_611858 ) ) ( not ( = ?auto_611856 ?auto_611859 ) ) ( not ( = ?auto_611857 ?auto_611858 ) ) ( not ( = ?auto_611857 ?auto_611859 ) ) ( not ( = ?auto_611858 ?auto_611859 ) ) ( ON ?auto_611858 ?auto_611859 ) ( ON ?auto_611857 ?auto_611858 ) ( CLEAR ?auto_611855 ) ( ON ?auto_611856 ?auto_611857 ) ( CLEAR ?auto_611856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_611843 ?auto_611844 ?auto_611845 ?auto_611846 ?auto_611847 ?auto_611848 ?auto_611849 ?auto_611850 ?auto_611851 ?auto_611852 ?auto_611853 ?auto_611854 ?auto_611855 ?auto_611856 )
      ( MAKE-17PILE ?auto_611843 ?auto_611844 ?auto_611845 ?auto_611846 ?auto_611847 ?auto_611848 ?auto_611849 ?auto_611850 ?auto_611851 ?auto_611852 ?auto_611853 ?auto_611854 ?auto_611855 ?auto_611856 ?auto_611857 ?auto_611858 ?auto_611859 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611877 - BLOCK
      ?auto_611878 - BLOCK
      ?auto_611879 - BLOCK
      ?auto_611880 - BLOCK
      ?auto_611881 - BLOCK
      ?auto_611882 - BLOCK
      ?auto_611883 - BLOCK
      ?auto_611884 - BLOCK
      ?auto_611885 - BLOCK
      ?auto_611886 - BLOCK
      ?auto_611887 - BLOCK
      ?auto_611888 - BLOCK
      ?auto_611889 - BLOCK
      ?auto_611890 - BLOCK
      ?auto_611891 - BLOCK
      ?auto_611892 - BLOCK
      ?auto_611893 - BLOCK
    )
    :vars
    (
      ?auto_611894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611893 ?auto_611894 ) ( ON-TABLE ?auto_611877 ) ( ON ?auto_611878 ?auto_611877 ) ( ON ?auto_611879 ?auto_611878 ) ( ON ?auto_611880 ?auto_611879 ) ( ON ?auto_611881 ?auto_611880 ) ( ON ?auto_611882 ?auto_611881 ) ( ON ?auto_611883 ?auto_611882 ) ( ON ?auto_611884 ?auto_611883 ) ( ON ?auto_611885 ?auto_611884 ) ( ON ?auto_611886 ?auto_611885 ) ( ON ?auto_611887 ?auto_611886 ) ( ON ?auto_611888 ?auto_611887 ) ( not ( = ?auto_611877 ?auto_611878 ) ) ( not ( = ?auto_611877 ?auto_611879 ) ) ( not ( = ?auto_611877 ?auto_611880 ) ) ( not ( = ?auto_611877 ?auto_611881 ) ) ( not ( = ?auto_611877 ?auto_611882 ) ) ( not ( = ?auto_611877 ?auto_611883 ) ) ( not ( = ?auto_611877 ?auto_611884 ) ) ( not ( = ?auto_611877 ?auto_611885 ) ) ( not ( = ?auto_611877 ?auto_611886 ) ) ( not ( = ?auto_611877 ?auto_611887 ) ) ( not ( = ?auto_611877 ?auto_611888 ) ) ( not ( = ?auto_611877 ?auto_611889 ) ) ( not ( = ?auto_611877 ?auto_611890 ) ) ( not ( = ?auto_611877 ?auto_611891 ) ) ( not ( = ?auto_611877 ?auto_611892 ) ) ( not ( = ?auto_611877 ?auto_611893 ) ) ( not ( = ?auto_611877 ?auto_611894 ) ) ( not ( = ?auto_611878 ?auto_611879 ) ) ( not ( = ?auto_611878 ?auto_611880 ) ) ( not ( = ?auto_611878 ?auto_611881 ) ) ( not ( = ?auto_611878 ?auto_611882 ) ) ( not ( = ?auto_611878 ?auto_611883 ) ) ( not ( = ?auto_611878 ?auto_611884 ) ) ( not ( = ?auto_611878 ?auto_611885 ) ) ( not ( = ?auto_611878 ?auto_611886 ) ) ( not ( = ?auto_611878 ?auto_611887 ) ) ( not ( = ?auto_611878 ?auto_611888 ) ) ( not ( = ?auto_611878 ?auto_611889 ) ) ( not ( = ?auto_611878 ?auto_611890 ) ) ( not ( = ?auto_611878 ?auto_611891 ) ) ( not ( = ?auto_611878 ?auto_611892 ) ) ( not ( = ?auto_611878 ?auto_611893 ) ) ( not ( = ?auto_611878 ?auto_611894 ) ) ( not ( = ?auto_611879 ?auto_611880 ) ) ( not ( = ?auto_611879 ?auto_611881 ) ) ( not ( = ?auto_611879 ?auto_611882 ) ) ( not ( = ?auto_611879 ?auto_611883 ) ) ( not ( = ?auto_611879 ?auto_611884 ) ) ( not ( = ?auto_611879 ?auto_611885 ) ) ( not ( = ?auto_611879 ?auto_611886 ) ) ( not ( = ?auto_611879 ?auto_611887 ) ) ( not ( = ?auto_611879 ?auto_611888 ) ) ( not ( = ?auto_611879 ?auto_611889 ) ) ( not ( = ?auto_611879 ?auto_611890 ) ) ( not ( = ?auto_611879 ?auto_611891 ) ) ( not ( = ?auto_611879 ?auto_611892 ) ) ( not ( = ?auto_611879 ?auto_611893 ) ) ( not ( = ?auto_611879 ?auto_611894 ) ) ( not ( = ?auto_611880 ?auto_611881 ) ) ( not ( = ?auto_611880 ?auto_611882 ) ) ( not ( = ?auto_611880 ?auto_611883 ) ) ( not ( = ?auto_611880 ?auto_611884 ) ) ( not ( = ?auto_611880 ?auto_611885 ) ) ( not ( = ?auto_611880 ?auto_611886 ) ) ( not ( = ?auto_611880 ?auto_611887 ) ) ( not ( = ?auto_611880 ?auto_611888 ) ) ( not ( = ?auto_611880 ?auto_611889 ) ) ( not ( = ?auto_611880 ?auto_611890 ) ) ( not ( = ?auto_611880 ?auto_611891 ) ) ( not ( = ?auto_611880 ?auto_611892 ) ) ( not ( = ?auto_611880 ?auto_611893 ) ) ( not ( = ?auto_611880 ?auto_611894 ) ) ( not ( = ?auto_611881 ?auto_611882 ) ) ( not ( = ?auto_611881 ?auto_611883 ) ) ( not ( = ?auto_611881 ?auto_611884 ) ) ( not ( = ?auto_611881 ?auto_611885 ) ) ( not ( = ?auto_611881 ?auto_611886 ) ) ( not ( = ?auto_611881 ?auto_611887 ) ) ( not ( = ?auto_611881 ?auto_611888 ) ) ( not ( = ?auto_611881 ?auto_611889 ) ) ( not ( = ?auto_611881 ?auto_611890 ) ) ( not ( = ?auto_611881 ?auto_611891 ) ) ( not ( = ?auto_611881 ?auto_611892 ) ) ( not ( = ?auto_611881 ?auto_611893 ) ) ( not ( = ?auto_611881 ?auto_611894 ) ) ( not ( = ?auto_611882 ?auto_611883 ) ) ( not ( = ?auto_611882 ?auto_611884 ) ) ( not ( = ?auto_611882 ?auto_611885 ) ) ( not ( = ?auto_611882 ?auto_611886 ) ) ( not ( = ?auto_611882 ?auto_611887 ) ) ( not ( = ?auto_611882 ?auto_611888 ) ) ( not ( = ?auto_611882 ?auto_611889 ) ) ( not ( = ?auto_611882 ?auto_611890 ) ) ( not ( = ?auto_611882 ?auto_611891 ) ) ( not ( = ?auto_611882 ?auto_611892 ) ) ( not ( = ?auto_611882 ?auto_611893 ) ) ( not ( = ?auto_611882 ?auto_611894 ) ) ( not ( = ?auto_611883 ?auto_611884 ) ) ( not ( = ?auto_611883 ?auto_611885 ) ) ( not ( = ?auto_611883 ?auto_611886 ) ) ( not ( = ?auto_611883 ?auto_611887 ) ) ( not ( = ?auto_611883 ?auto_611888 ) ) ( not ( = ?auto_611883 ?auto_611889 ) ) ( not ( = ?auto_611883 ?auto_611890 ) ) ( not ( = ?auto_611883 ?auto_611891 ) ) ( not ( = ?auto_611883 ?auto_611892 ) ) ( not ( = ?auto_611883 ?auto_611893 ) ) ( not ( = ?auto_611883 ?auto_611894 ) ) ( not ( = ?auto_611884 ?auto_611885 ) ) ( not ( = ?auto_611884 ?auto_611886 ) ) ( not ( = ?auto_611884 ?auto_611887 ) ) ( not ( = ?auto_611884 ?auto_611888 ) ) ( not ( = ?auto_611884 ?auto_611889 ) ) ( not ( = ?auto_611884 ?auto_611890 ) ) ( not ( = ?auto_611884 ?auto_611891 ) ) ( not ( = ?auto_611884 ?auto_611892 ) ) ( not ( = ?auto_611884 ?auto_611893 ) ) ( not ( = ?auto_611884 ?auto_611894 ) ) ( not ( = ?auto_611885 ?auto_611886 ) ) ( not ( = ?auto_611885 ?auto_611887 ) ) ( not ( = ?auto_611885 ?auto_611888 ) ) ( not ( = ?auto_611885 ?auto_611889 ) ) ( not ( = ?auto_611885 ?auto_611890 ) ) ( not ( = ?auto_611885 ?auto_611891 ) ) ( not ( = ?auto_611885 ?auto_611892 ) ) ( not ( = ?auto_611885 ?auto_611893 ) ) ( not ( = ?auto_611885 ?auto_611894 ) ) ( not ( = ?auto_611886 ?auto_611887 ) ) ( not ( = ?auto_611886 ?auto_611888 ) ) ( not ( = ?auto_611886 ?auto_611889 ) ) ( not ( = ?auto_611886 ?auto_611890 ) ) ( not ( = ?auto_611886 ?auto_611891 ) ) ( not ( = ?auto_611886 ?auto_611892 ) ) ( not ( = ?auto_611886 ?auto_611893 ) ) ( not ( = ?auto_611886 ?auto_611894 ) ) ( not ( = ?auto_611887 ?auto_611888 ) ) ( not ( = ?auto_611887 ?auto_611889 ) ) ( not ( = ?auto_611887 ?auto_611890 ) ) ( not ( = ?auto_611887 ?auto_611891 ) ) ( not ( = ?auto_611887 ?auto_611892 ) ) ( not ( = ?auto_611887 ?auto_611893 ) ) ( not ( = ?auto_611887 ?auto_611894 ) ) ( not ( = ?auto_611888 ?auto_611889 ) ) ( not ( = ?auto_611888 ?auto_611890 ) ) ( not ( = ?auto_611888 ?auto_611891 ) ) ( not ( = ?auto_611888 ?auto_611892 ) ) ( not ( = ?auto_611888 ?auto_611893 ) ) ( not ( = ?auto_611888 ?auto_611894 ) ) ( not ( = ?auto_611889 ?auto_611890 ) ) ( not ( = ?auto_611889 ?auto_611891 ) ) ( not ( = ?auto_611889 ?auto_611892 ) ) ( not ( = ?auto_611889 ?auto_611893 ) ) ( not ( = ?auto_611889 ?auto_611894 ) ) ( not ( = ?auto_611890 ?auto_611891 ) ) ( not ( = ?auto_611890 ?auto_611892 ) ) ( not ( = ?auto_611890 ?auto_611893 ) ) ( not ( = ?auto_611890 ?auto_611894 ) ) ( not ( = ?auto_611891 ?auto_611892 ) ) ( not ( = ?auto_611891 ?auto_611893 ) ) ( not ( = ?auto_611891 ?auto_611894 ) ) ( not ( = ?auto_611892 ?auto_611893 ) ) ( not ( = ?auto_611892 ?auto_611894 ) ) ( not ( = ?auto_611893 ?auto_611894 ) ) ( ON ?auto_611892 ?auto_611893 ) ( ON ?auto_611891 ?auto_611892 ) ( ON ?auto_611890 ?auto_611891 ) ( CLEAR ?auto_611888 ) ( ON ?auto_611889 ?auto_611890 ) ( CLEAR ?auto_611889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_611877 ?auto_611878 ?auto_611879 ?auto_611880 ?auto_611881 ?auto_611882 ?auto_611883 ?auto_611884 ?auto_611885 ?auto_611886 ?auto_611887 ?auto_611888 ?auto_611889 )
      ( MAKE-17PILE ?auto_611877 ?auto_611878 ?auto_611879 ?auto_611880 ?auto_611881 ?auto_611882 ?auto_611883 ?auto_611884 ?auto_611885 ?auto_611886 ?auto_611887 ?auto_611888 ?auto_611889 ?auto_611890 ?auto_611891 ?auto_611892 ?auto_611893 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611912 - BLOCK
      ?auto_611913 - BLOCK
      ?auto_611914 - BLOCK
      ?auto_611915 - BLOCK
      ?auto_611916 - BLOCK
      ?auto_611917 - BLOCK
      ?auto_611918 - BLOCK
      ?auto_611919 - BLOCK
      ?auto_611920 - BLOCK
      ?auto_611921 - BLOCK
      ?auto_611922 - BLOCK
      ?auto_611923 - BLOCK
      ?auto_611924 - BLOCK
      ?auto_611925 - BLOCK
      ?auto_611926 - BLOCK
      ?auto_611927 - BLOCK
      ?auto_611928 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_611928 ) ( ON-TABLE ?auto_611912 ) ( ON ?auto_611913 ?auto_611912 ) ( ON ?auto_611914 ?auto_611913 ) ( ON ?auto_611915 ?auto_611914 ) ( ON ?auto_611916 ?auto_611915 ) ( ON ?auto_611917 ?auto_611916 ) ( ON ?auto_611918 ?auto_611917 ) ( ON ?auto_611919 ?auto_611918 ) ( ON ?auto_611920 ?auto_611919 ) ( ON ?auto_611921 ?auto_611920 ) ( ON ?auto_611922 ?auto_611921 ) ( ON ?auto_611923 ?auto_611922 ) ( not ( = ?auto_611912 ?auto_611913 ) ) ( not ( = ?auto_611912 ?auto_611914 ) ) ( not ( = ?auto_611912 ?auto_611915 ) ) ( not ( = ?auto_611912 ?auto_611916 ) ) ( not ( = ?auto_611912 ?auto_611917 ) ) ( not ( = ?auto_611912 ?auto_611918 ) ) ( not ( = ?auto_611912 ?auto_611919 ) ) ( not ( = ?auto_611912 ?auto_611920 ) ) ( not ( = ?auto_611912 ?auto_611921 ) ) ( not ( = ?auto_611912 ?auto_611922 ) ) ( not ( = ?auto_611912 ?auto_611923 ) ) ( not ( = ?auto_611912 ?auto_611924 ) ) ( not ( = ?auto_611912 ?auto_611925 ) ) ( not ( = ?auto_611912 ?auto_611926 ) ) ( not ( = ?auto_611912 ?auto_611927 ) ) ( not ( = ?auto_611912 ?auto_611928 ) ) ( not ( = ?auto_611913 ?auto_611914 ) ) ( not ( = ?auto_611913 ?auto_611915 ) ) ( not ( = ?auto_611913 ?auto_611916 ) ) ( not ( = ?auto_611913 ?auto_611917 ) ) ( not ( = ?auto_611913 ?auto_611918 ) ) ( not ( = ?auto_611913 ?auto_611919 ) ) ( not ( = ?auto_611913 ?auto_611920 ) ) ( not ( = ?auto_611913 ?auto_611921 ) ) ( not ( = ?auto_611913 ?auto_611922 ) ) ( not ( = ?auto_611913 ?auto_611923 ) ) ( not ( = ?auto_611913 ?auto_611924 ) ) ( not ( = ?auto_611913 ?auto_611925 ) ) ( not ( = ?auto_611913 ?auto_611926 ) ) ( not ( = ?auto_611913 ?auto_611927 ) ) ( not ( = ?auto_611913 ?auto_611928 ) ) ( not ( = ?auto_611914 ?auto_611915 ) ) ( not ( = ?auto_611914 ?auto_611916 ) ) ( not ( = ?auto_611914 ?auto_611917 ) ) ( not ( = ?auto_611914 ?auto_611918 ) ) ( not ( = ?auto_611914 ?auto_611919 ) ) ( not ( = ?auto_611914 ?auto_611920 ) ) ( not ( = ?auto_611914 ?auto_611921 ) ) ( not ( = ?auto_611914 ?auto_611922 ) ) ( not ( = ?auto_611914 ?auto_611923 ) ) ( not ( = ?auto_611914 ?auto_611924 ) ) ( not ( = ?auto_611914 ?auto_611925 ) ) ( not ( = ?auto_611914 ?auto_611926 ) ) ( not ( = ?auto_611914 ?auto_611927 ) ) ( not ( = ?auto_611914 ?auto_611928 ) ) ( not ( = ?auto_611915 ?auto_611916 ) ) ( not ( = ?auto_611915 ?auto_611917 ) ) ( not ( = ?auto_611915 ?auto_611918 ) ) ( not ( = ?auto_611915 ?auto_611919 ) ) ( not ( = ?auto_611915 ?auto_611920 ) ) ( not ( = ?auto_611915 ?auto_611921 ) ) ( not ( = ?auto_611915 ?auto_611922 ) ) ( not ( = ?auto_611915 ?auto_611923 ) ) ( not ( = ?auto_611915 ?auto_611924 ) ) ( not ( = ?auto_611915 ?auto_611925 ) ) ( not ( = ?auto_611915 ?auto_611926 ) ) ( not ( = ?auto_611915 ?auto_611927 ) ) ( not ( = ?auto_611915 ?auto_611928 ) ) ( not ( = ?auto_611916 ?auto_611917 ) ) ( not ( = ?auto_611916 ?auto_611918 ) ) ( not ( = ?auto_611916 ?auto_611919 ) ) ( not ( = ?auto_611916 ?auto_611920 ) ) ( not ( = ?auto_611916 ?auto_611921 ) ) ( not ( = ?auto_611916 ?auto_611922 ) ) ( not ( = ?auto_611916 ?auto_611923 ) ) ( not ( = ?auto_611916 ?auto_611924 ) ) ( not ( = ?auto_611916 ?auto_611925 ) ) ( not ( = ?auto_611916 ?auto_611926 ) ) ( not ( = ?auto_611916 ?auto_611927 ) ) ( not ( = ?auto_611916 ?auto_611928 ) ) ( not ( = ?auto_611917 ?auto_611918 ) ) ( not ( = ?auto_611917 ?auto_611919 ) ) ( not ( = ?auto_611917 ?auto_611920 ) ) ( not ( = ?auto_611917 ?auto_611921 ) ) ( not ( = ?auto_611917 ?auto_611922 ) ) ( not ( = ?auto_611917 ?auto_611923 ) ) ( not ( = ?auto_611917 ?auto_611924 ) ) ( not ( = ?auto_611917 ?auto_611925 ) ) ( not ( = ?auto_611917 ?auto_611926 ) ) ( not ( = ?auto_611917 ?auto_611927 ) ) ( not ( = ?auto_611917 ?auto_611928 ) ) ( not ( = ?auto_611918 ?auto_611919 ) ) ( not ( = ?auto_611918 ?auto_611920 ) ) ( not ( = ?auto_611918 ?auto_611921 ) ) ( not ( = ?auto_611918 ?auto_611922 ) ) ( not ( = ?auto_611918 ?auto_611923 ) ) ( not ( = ?auto_611918 ?auto_611924 ) ) ( not ( = ?auto_611918 ?auto_611925 ) ) ( not ( = ?auto_611918 ?auto_611926 ) ) ( not ( = ?auto_611918 ?auto_611927 ) ) ( not ( = ?auto_611918 ?auto_611928 ) ) ( not ( = ?auto_611919 ?auto_611920 ) ) ( not ( = ?auto_611919 ?auto_611921 ) ) ( not ( = ?auto_611919 ?auto_611922 ) ) ( not ( = ?auto_611919 ?auto_611923 ) ) ( not ( = ?auto_611919 ?auto_611924 ) ) ( not ( = ?auto_611919 ?auto_611925 ) ) ( not ( = ?auto_611919 ?auto_611926 ) ) ( not ( = ?auto_611919 ?auto_611927 ) ) ( not ( = ?auto_611919 ?auto_611928 ) ) ( not ( = ?auto_611920 ?auto_611921 ) ) ( not ( = ?auto_611920 ?auto_611922 ) ) ( not ( = ?auto_611920 ?auto_611923 ) ) ( not ( = ?auto_611920 ?auto_611924 ) ) ( not ( = ?auto_611920 ?auto_611925 ) ) ( not ( = ?auto_611920 ?auto_611926 ) ) ( not ( = ?auto_611920 ?auto_611927 ) ) ( not ( = ?auto_611920 ?auto_611928 ) ) ( not ( = ?auto_611921 ?auto_611922 ) ) ( not ( = ?auto_611921 ?auto_611923 ) ) ( not ( = ?auto_611921 ?auto_611924 ) ) ( not ( = ?auto_611921 ?auto_611925 ) ) ( not ( = ?auto_611921 ?auto_611926 ) ) ( not ( = ?auto_611921 ?auto_611927 ) ) ( not ( = ?auto_611921 ?auto_611928 ) ) ( not ( = ?auto_611922 ?auto_611923 ) ) ( not ( = ?auto_611922 ?auto_611924 ) ) ( not ( = ?auto_611922 ?auto_611925 ) ) ( not ( = ?auto_611922 ?auto_611926 ) ) ( not ( = ?auto_611922 ?auto_611927 ) ) ( not ( = ?auto_611922 ?auto_611928 ) ) ( not ( = ?auto_611923 ?auto_611924 ) ) ( not ( = ?auto_611923 ?auto_611925 ) ) ( not ( = ?auto_611923 ?auto_611926 ) ) ( not ( = ?auto_611923 ?auto_611927 ) ) ( not ( = ?auto_611923 ?auto_611928 ) ) ( not ( = ?auto_611924 ?auto_611925 ) ) ( not ( = ?auto_611924 ?auto_611926 ) ) ( not ( = ?auto_611924 ?auto_611927 ) ) ( not ( = ?auto_611924 ?auto_611928 ) ) ( not ( = ?auto_611925 ?auto_611926 ) ) ( not ( = ?auto_611925 ?auto_611927 ) ) ( not ( = ?auto_611925 ?auto_611928 ) ) ( not ( = ?auto_611926 ?auto_611927 ) ) ( not ( = ?auto_611926 ?auto_611928 ) ) ( not ( = ?auto_611927 ?auto_611928 ) ) ( ON ?auto_611927 ?auto_611928 ) ( ON ?auto_611926 ?auto_611927 ) ( ON ?auto_611925 ?auto_611926 ) ( CLEAR ?auto_611923 ) ( ON ?auto_611924 ?auto_611925 ) ( CLEAR ?auto_611924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_611912 ?auto_611913 ?auto_611914 ?auto_611915 ?auto_611916 ?auto_611917 ?auto_611918 ?auto_611919 ?auto_611920 ?auto_611921 ?auto_611922 ?auto_611923 ?auto_611924 )
      ( MAKE-17PILE ?auto_611912 ?auto_611913 ?auto_611914 ?auto_611915 ?auto_611916 ?auto_611917 ?auto_611918 ?auto_611919 ?auto_611920 ?auto_611921 ?auto_611922 ?auto_611923 ?auto_611924 ?auto_611925 ?auto_611926 ?auto_611927 ?auto_611928 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611946 - BLOCK
      ?auto_611947 - BLOCK
      ?auto_611948 - BLOCK
      ?auto_611949 - BLOCK
      ?auto_611950 - BLOCK
      ?auto_611951 - BLOCK
      ?auto_611952 - BLOCK
      ?auto_611953 - BLOCK
      ?auto_611954 - BLOCK
      ?auto_611955 - BLOCK
      ?auto_611956 - BLOCK
      ?auto_611957 - BLOCK
      ?auto_611958 - BLOCK
      ?auto_611959 - BLOCK
      ?auto_611960 - BLOCK
      ?auto_611961 - BLOCK
      ?auto_611962 - BLOCK
    )
    :vars
    (
      ?auto_611963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_611962 ?auto_611963 ) ( ON-TABLE ?auto_611946 ) ( ON ?auto_611947 ?auto_611946 ) ( ON ?auto_611948 ?auto_611947 ) ( ON ?auto_611949 ?auto_611948 ) ( ON ?auto_611950 ?auto_611949 ) ( ON ?auto_611951 ?auto_611950 ) ( ON ?auto_611952 ?auto_611951 ) ( ON ?auto_611953 ?auto_611952 ) ( ON ?auto_611954 ?auto_611953 ) ( ON ?auto_611955 ?auto_611954 ) ( ON ?auto_611956 ?auto_611955 ) ( not ( = ?auto_611946 ?auto_611947 ) ) ( not ( = ?auto_611946 ?auto_611948 ) ) ( not ( = ?auto_611946 ?auto_611949 ) ) ( not ( = ?auto_611946 ?auto_611950 ) ) ( not ( = ?auto_611946 ?auto_611951 ) ) ( not ( = ?auto_611946 ?auto_611952 ) ) ( not ( = ?auto_611946 ?auto_611953 ) ) ( not ( = ?auto_611946 ?auto_611954 ) ) ( not ( = ?auto_611946 ?auto_611955 ) ) ( not ( = ?auto_611946 ?auto_611956 ) ) ( not ( = ?auto_611946 ?auto_611957 ) ) ( not ( = ?auto_611946 ?auto_611958 ) ) ( not ( = ?auto_611946 ?auto_611959 ) ) ( not ( = ?auto_611946 ?auto_611960 ) ) ( not ( = ?auto_611946 ?auto_611961 ) ) ( not ( = ?auto_611946 ?auto_611962 ) ) ( not ( = ?auto_611946 ?auto_611963 ) ) ( not ( = ?auto_611947 ?auto_611948 ) ) ( not ( = ?auto_611947 ?auto_611949 ) ) ( not ( = ?auto_611947 ?auto_611950 ) ) ( not ( = ?auto_611947 ?auto_611951 ) ) ( not ( = ?auto_611947 ?auto_611952 ) ) ( not ( = ?auto_611947 ?auto_611953 ) ) ( not ( = ?auto_611947 ?auto_611954 ) ) ( not ( = ?auto_611947 ?auto_611955 ) ) ( not ( = ?auto_611947 ?auto_611956 ) ) ( not ( = ?auto_611947 ?auto_611957 ) ) ( not ( = ?auto_611947 ?auto_611958 ) ) ( not ( = ?auto_611947 ?auto_611959 ) ) ( not ( = ?auto_611947 ?auto_611960 ) ) ( not ( = ?auto_611947 ?auto_611961 ) ) ( not ( = ?auto_611947 ?auto_611962 ) ) ( not ( = ?auto_611947 ?auto_611963 ) ) ( not ( = ?auto_611948 ?auto_611949 ) ) ( not ( = ?auto_611948 ?auto_611950 ) ) ( not ( = ?auto_611948 ?auto_611951 ) ) ( not ( = ?auto_611948 ?auto_611952 ) ) ( not ( = ?auto_611948 ?auto_611953 ) ) ( not ( = ?auto_611948 ?auto_611954 ) ) ( not ( = ?auto_611948 ?auto_611955 ) ) ( not ( = ?auto_611948 ?auto_611956 ) ) ( not ( = ?auto_611948 ?auto_611957 ) ) ( not ( = ?auto_611948 ?auto_611958 ) ) ( not ( = ?auto_611948 ?auto_611959 ) ) ( not ( = ?auto_611948 ?auto_611960 ) ) ( not ( = ?auto_611948 ?auto_611961 ) ) ( not ( = ?auto_611948 ?auto_611962 ) ) ( not ( = ?auto_611948 ?auto_611963 ) ) ( not ( = ?auto_611949 ?auto_611950 ) ) ( not ( = ?auto_611949 ?auto_611951 ) ) ( not ( = ?auto_611949 ?auto_611952 ) ) ( not ( = ?auto_611949 ?auto_611953 ) ) ( not ( = ?auto_611949 ?auto_611954 ) ) ( not ( = ?auto_611949 ?auto_611955 ) ) ( not ( = ?auto_611949 ?auto_611956 ) ) ( not ( = ?auto_611949 ?auto_611957 ) ) ( not ( = ?auto_611949 ?auto_611958 ) ) ( not ( = ?auto_611949 ?auto_611959 ) ) ( not ( = ?auto_611949 ?auto_611960 ) ) ( not ( = ?auto_611949 ?auto_611961 ) ) ( not ( = ?auto_611949 ?auto_611962 ) ) ( not ( = ?auto_611949 ?auto_611963 ) ) ( not ( = ?auto_611950 ?auto_611951 ) ) ( not ( = ?auto_611950 ?auto_611952 ) ) ( not ( = ?auto_611950 ?auto_611953 ) ) ( not ( = ?auto_611950 ?auto_611954 ) ) ( not ( = ?auto_611950 ?auto_611955 ) ) ( not ( = ?auto_611950 ?auto_611956 ) ) ( not ( = ?auto_611950 ?auto_611957 ) ) ( not ( = ?auto_611950 ?auto_611958 ) ) ( not ( = ?auto_611950 ?auto_611959 ) ) ( not ( = ?auto_611950 ?auto_611960 ) ) ( not ( = ?auto_611950 ?auto_611961 ) ) ( not ( = ?auto_611950 ?auto_611962 ) ) ( not ( = ?auto_611950 ?auto_611963 ) ) ( not ( = ?auto_611951 ?auto_611952 ) ) ( not ( = ?auto_611951 ?auto_611953 ) ) ( not ( = ?auto_611951 ?auto_611954 ) ) ( not ( = ?auto_611951 ?auto_611955 ) ) ( not ( = ?auto_611951 ?auto_611956 ) ) ( not ( = ?auto_611951 ?auto_611957 ) ) ( not ( = ?auto_611951 ?auto_611958 ) ) ( not ( = ?auto_611951 ?auto_611959 ) ) ( not ( = ?auto_611951 ?auto_611960 ) ) ( not ( = ?auto_611951 ?auto_611961 ) ) ( not ( = ?auto_611951 ?auto_611962 ) ) ( not ( = ?auto_611951 ?auto_611963 ) ) ( not ( = ?auto_611952 ?auto_611953 ) ) ( not ( = ?auto_611952 ?auto_611954 ) ) ( not ( = ?auto_611952 ?auto_611955 ) ) ( not ( = ?auto_611952 ?auto_611956 ) ) ( not ( = ?auto_611952 ?auto_611957 ) ) ( not ( = ?auto_611952 ?auto_611958 ) ) ( not ( = ?auto_611952 ?auto_611959 ) ) ( not ( = ?auto_611952 ?auto_611960 ) ) ( not ( = ?auto_611952 ?auto_611961 ) ) ( not ( = ?auto_611952 ?auto_611962 ) ) ( not ( = ?auto_611952 ?auto_611963 ) ) ( not ( = ?auto_611953 ?auto_611954 ) ) ( not ( = ?auto_611953 ?auto_611955 ) ) ( not ( = ?auto_611953 ?auto_611956 ) ) ( not ( = ?auto_611953 ?auto_611957 ) ) ( not ( = ?auto_611953 ?auto_611958 ) ) ( not ( = ?auto_611953 ?auto_611959 ) ) ( not ( = ?auto_611953 ?auto_611960 ) ) ( not ( = ?auto_611953 ?auto_611961 ) ) ( not ( = ?auto_611953 ?auto_611962 ) ) ( not ( = ?auto_611953 ?auto_611963 ) ) ( not ( = ?auto_611954 ?auto_611955 ) ) ( not ( = ?auto_611954 ?auto_611956 ) ) ( not ( = ?auto_611954 ?auto_611957 ) ) ( not ( = ?auto_611954 ?auto_611958 ) ) ( not ( = ?auto_611954 ?auto_611959 ) ) ( not ( = ?auto_611954 ?auto_611960 ) ) ( not ( = ?auto_611954 ?auto_611961 ) ) ( not ( = ?auto_611954 ?auto_611962 ) ) ( not ( = ?auto_611954 ?auto_611963 ) ) ( not ( = ?auto_611955 ?auto_611956 ) ) ( not ( = ?auto_611955 ?auto_611957 ) ) ( not ( = ?auto_611955 ?auto_611958 ) ) ( not ( = ?auto_611955 ?auto_611959 ) ) ( not ( = ?auto_611955 ?auto_611960 ) ) ( not ( = ?auto_611955 ?auto_611961 ) ) ( not ( = ?auto_611955 ?auto_611962 ) ) ( not ( = ?auto_611955 ?auto_611963 ) ) ( not ( = ?auto_611956 ?auto_611957 ) ) ( not ( = ?auto_611956 ?auto_611958 ) ) ( not ( = ?auto_611956 ?auto_611959 ) ) ( not ( = ?auto_611956 ?auto_611960 ) ) ( not ( = ?auto_611956 ?auto_611961 ) ) ( not ( = ?auto_611956 ?auto_611962 ) ) ( not ( = ?auto_611956 ?auto_611963 ) ) ( not ( = ?auto_611957 ?auto_611958 ) ) ( not ( = ?auto_611957 ?auto_611959 ) ) ( not ( = ?auto_611957 ?auto_611960 ) ) ( not ( = ?auto_611957 ?auto_611961 ) ) ( not ( = ?auto_611957 ?auto_611962 ) ) ( not ( = ?auto_611957 ?auto_611963 ) ) ( not ( = ?auto_611958 ?auto_611959 ) ) ( not ( = ?auto_611958 ?auto_611960 ) ) ( not ( = ?auto_611958 ?auto_611961 ) ) ( not ( = ?auto_611958 ?auto_611962 ) ) ( not ( = ?auto_611958 ?auto_611963 ) ) ( not ( = ?auto_611959 ?auto_611960 ) ) ( not ( = ?auto_611959 ?auto_611961 ) ) ( not ( = ?auto_611959 ?auto_611962 ) ) ( not ( = ?auto_611959 ?auto_611963 ) ) ( not ( = ?auto_611960 ?auto_611961 ) ) ( not ( = ?auto_611960 ?auto_611962 ) ) ( not ( = ?auto_611960 ?auto_611963 ) ) ( not ( = ?auto_611961 ?auto_611962 ) ) ( not ( = ?auto_611961 ?auto_611963 ) ) ( not ( = ?auto_611962 ?auto_611963 ) ) ( ON ?auto_611961 ?auto_611962 ) ( ON ?auto_611960 ?auto_611961 ) ( ON ?auto_611959 ?auto_611960 ) ( ON ?auto_611958 ?auto_611959 ) ( CLEAR ?auto_611956 ) ( ON ?auto_611957 ?auto_611958 ) ( CLEAR ?auto_611957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_611946 ?auto_611947 ?auto_611948 ?auto_611949 ?auto_611950 ?auto_611951 ?auto_611952 ?auto_611953 ?auto_611954 ?auto_611955 ?auto_611956 ?auto_611957 )
      ( MAKE-17PILE ?auto_611946 ?auto_611947 ?auto_611948 ?auto_611949 ?auto_611950 ?auto_611951 ?auto_611952 ?auto_611953 ?auto_611954 ?auto_611955 ?auto_611956 ?auto_611957 ?auto_611958 ?auto_611959 ?auto_611960 ?auto_611961 ?auto_611962 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_611981 - BLOCK
      ?auto_611982 - BLOCK
      ?auto_611983 - BLOCK
      ?auto_611984 - BLOCK
      ?auto_611985 - BLOCK
      ?auto_611986 - BLOCK
      ?auto_611987 - BLOCK
      ?auto_611988 - BLOCK
      ?auto_611989 - BLOCK
      ?auto_611990 - BLOCK
      ?auto_611991 - BLOCK
      ?auto_611992 - BLOCK
      ?auto_611993 - BLOCK
      ?auto_611994 - BLOCK
      ?auto_611995 - BLOCK
      ?auto_611996 - BLOCK
      ?auto_611997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_611997 ) ( ON-TABLE ?auto_611981 ) ( ON ?auto_611982 ?auto_611981 ) ( ON ?auto_611983 ?auto_611982 ) ( ON ?auto_611984 ?auto_611983 ) ( ON ?auto_611985 ?auto_611984 ) ( ON ?auto_611986 ?auto_611985 ) ( ON ?auto_611987 ?auto_611986 ) ( ON ?auto_611988 ?auto_611987 ) ( ON ?auto_611989 ?auto_611988 ) ( ON ?auto_611990 ?auto_611989 ) ( ON ?auto_611991 ?auto_611990 ) ( not ( = ?auto_611981 ?auto_611982 ) ) ( not ( = ?auto_611981 ?auto_611983 ) ) ( not ( = ?auto_611981 ?auto_611984 ) ) ( not ( = ?auto_611981 ?auto_611985 ) ) ( not ( = ?auto_611981 ?auto_611986 ) ) ( not ( = ?auto_611981 ?auto_611987 ) ) ( not ( = ?auto_611981 ?auto_611988 ) ) ( not ( = ?auto_611981 ?auto_611989 ) ) ( not ( = ?auto_611981 ?auto_611990 ) ) ( not ( = ?auto_611981 ?auto_611991 ) ) ( not ( = ?auto_611981 ?auto_611992 ) ) ( not ( = ?auto_611981 ?auto_611993 ) ) ( not ( = ?auto_611981 ?auto_611994 ) ) ( not ( = ?auto_611981 ?auto_611995 ) ) ( not ( = ?auto_611981 ?auto_611996 ) ) ( not ( = ?auto_611981 ?auto_611997 ) ) ( not ( = ?auto_611982 ?auto_611983 ) ) ( not ( = ?auto_611982 ?auto_611984 ) ) ( not ( = ?auto_611982 ?auto_611985 ) ) ( not ( = ?auto_611982 ?auto_611986 ) ) ( not ( = ?auto_611982 ?auto_611987 ) ) ( not ( = ?auto_611982 ?auto_611988 ) ) ( not ( = ?auto_611982 ?auto_611989 ) ) ( not ( = ?auto_611982 ?auto_611990 ) ) ( not ( = ?auto_611982 ?auto_611991 ) ) ( not ( = ?auto_611982 ?auto_611992 ) ) ( not ( = ?auto_611982 ?auto_611993 ) ) ( not ( = ?auto_611982 ?auto_611994 ) ) ( not ( = ?auto_611982 ?auto_611995 ) ) ( not ( = ?auto_611982 ?auto_611996 ) ) ( not ( = ?auto_611982 ?auto_611997 ) ) ( not ( = ?auto_611983 ?auto_611984 ) ) ( not ( = ?auto_611983 ?auto_611985 ) ) ( not ( = ?auto_611983 ?auto_611986 ) ) ( not ( = ?auto_611983 ?auto_611987 ) ) ( not ( = ?auto_611983 ?auto_611988 ) ) ( not ( = ?auto_611983 ?auto_611989 ) ) ( not ( = ?auto_611983 ?auto_611990 ) ) ( not ( = ?auto_611983 ?auto_611991 ) ) ( not ( = ?auto_611983 ?auto_611992 ) ) ( not ( = ?auto_611983 ?auto_611993 ) ) ( not ( = ?auto_611983 ?auto_611994 ) ) ( not ( = ?auto_611983 ?auto_611995 ) ) ( not ( = ?auto_611983 ?auto_611996 ) ) ( not ( = ?auto_611983 ?auto_611997 ) ) ( not ( = ?auto_611984 ?auto_611985 ) ) ( not ( = ?auto_611984 ?auto_611986 ) ) ( not ( = ?auto_611984 ?auto_611987 ) ) ( not ( = ?auto_611984 ?auto_611988 ) ) ( not ( = ?auto_611984 ?auto_611989 ) ) ( not ( = ?auto_611984 ?auto_611990 ) ) ( not ( = ?auto_611984 ?auto_611991 ) ) ( not ( = ?auto_611984 ?auto_611992 ) ) ( not ( = ?auto_611984 ?auto_611993 ) ) ( not ( = ?auto_611984 ?auto_611994 ) ) ( not ( = ?auto_611984 ?auto_611995 ) ) ( not ( = ?auto_611984 ?auto_611996 ) ) ( not ( = ?auto_611984 ?auto_611997 ) ) ( not ( = ?auto_611985 ?auto_611986 ) ) ( not ( = ?auto_611985 ?auto_611987 ) ) ( not ( = ?auto_611985 ?auto_611988 ) ) ( not ( = ?auto_611985 ?auto_611989 ) ) ( not ( = ?auto_611985 ?auto_611990 ) ) ( not ( = ?auto_611985 ?auto_611991 ) ) ( not ( = ?auto_611985 ?auto_611992 ) ) ( not ( = ?auto_611985 ?auto_611993 ) ) ( not ( = ?auto_611985 ?auto_611994 ) ) ( not ( = ?auto_611985 ?auto_611995 ) ) ( not ( = ?auto_611985 ?auto_611996 ) ) ( not ( = ?auto_611985 ?auto_611997 ) ) ( not ( = ?auto_611986 ?auto_611987 ) ) ( not ( = ?auto_611986 ?auto_611988 ) ) ( not ( = ?auto_611986 ?auto_611989 ) ) ( not ( = ?auto_611986 ?auto_611990 ) ) ( not ( = ?auto_611986 ?auto_611991 ) ) ( not ( = ?auto_611986 ?auto_611992 ) ) ( not ( = ?auto_611986 ?auto_611993 ) ) ( not ( = ?auto_611986 ?auto_611994 ) ) ( not ( = ?auto_611986 ?auto_611995 ) ) ( not ( = ?auto_611986 ?auto_611996 ) ) ( not ( = ?auto_611986 ?auto_611997 ) ) ( not ( = ?auto_611987 ?auto_611988 ) ) ( not ( = ?auto_611987 ?auto_611989 ) ) ( not ( = ?auto_611987 ?auto_611990 ) ) ( not ( = ?auto_611987 ?auto_611991 ) ) ( not ( = ?auto_611987 ?auto_611992 ) ) ( not ( = ?auto_611987 ?auto_611993 ) ) ( not ( = ?auto_611987 ?auto_611994 ) ) ( not ( = ?auto_611987 ?auto_611995 ) ) ( not ( = ?auto_611987 ?auto_611996 ) ) ( not ( = ?auto_611987 ?auto_611997 ) ) ( not ( = ?auto_611988 ?auto_611989 ) ) ( not ( = ?auto_611988 ?auto_611990 ) ) ( not ( = ?auto_611988 ?auto_611991 ) ) ( not ( = ?auto_611988 ?auto_611992 ) ) ( not ( = ?auto_611988 ?auto_611993 ) ) ( not ( = ?auto_611988 ?auto_611994 ) ) ( not ( = ?auto_611988 ?auto_611995 ) ) ( not ( = ?auto_611988 ?auto_611996 ) ) ( not ( = ?auto_611988 ?auto_611997 ) ) ( not ( = ?auto_611989 ?auto_611990 ) ) ( not ( = ?auto_611989 ?auto_611991 ) ) ( not ( = ?auto_611989 ?auto_611992 ) ) ( not ( = ?auto_611989 ?auto_611993 ) ) ( not ( = ?auto_611989 ?auto_611994 ) ) ( not ( = ?auto_611989 ?auto_611995 ) ) ( not ( = ?auto_611989 ?auto_611996 ) ) ( not ( = ?auto_611989 ?auto_611997 ) ) ( not ( = ?auto_611990 ?auto_611991 ) ) ( not ( = ?auto_611990 ?auto_611992 ) ) ( not ( = ?auto_611990 ?auto_611993 ) ) ( not ( = ?auto_611990 ?auto_611994 ) ) ( not ( = ?auto_611990 ?auto_611995 ) ) ( not ( = ?auto_611990 ?auto_611996 ) ) ( not ( = ?auto_611990 ?auto_611997 ) ) ( not ( = ?auto_611991 ?auto_611992 ) ) ( not ( = ?auto_611991 ?auto_611993 ) ) ( not ( = ?auto_611991 ?auto_611994 ) ) ( not ( = ?auto_611991 ?auto_611995 ) ) ( not ( = ?auto_611991 ?auto_611996 ) ) ( not ( = ?auto_611991 ?auto_611997 ) ) ( not ( = ?auto_611992 ?auto_611993 ) ) ( not ( = ?auto_611992 ?auto_611994 ) ) ( not ( = ?auto_611992 ?auto_611995 ) ) ( not ( = ?auto_611992 ?auto_611996 ) ) ( not ( = ?auto_611992 ?auto_611997 ) ) ( not ( = ?auto_611993 ?auto_611994 ) ) ( not ( = ?auto_611993 ?auto_611995 ) ) ( not ( = ?auto_611993 ?auto_611996 ) ) ( not ( = ?auto_611993 ?auto_611997 ) ) ( not ( = ?auto_611994 ?auto_611995 ) ) ( not ( = ?auto_611994 ?auto_611996 ) ) ( not ( = ?auto_611994 ?auto_611997 ) ) ( not ( = ?auto_611995 ?auto_611996 ) ) ( not ( = ?auto_611995 ?auto_611997 ) ) ( not ( = ?auto_611996 ?auto_611997 ) ) ( ON ?auto_611996 ?auto_611997 ) ( ON ?auto_611995 ?auto_611996 ) ( ON ?auto_611994 ?auto_611995 ) ( ON ?auto_611993 ?auto_611994 ) ( CLEAR ?auto_611991 ) ( ON ?auto_611992 ?auto_611993 ) ( CLEAR ?auto_611992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_611981 ?auto_611982 ?auto_611983 ?auto_611984 ?auto_611985 ?auto_611986 ?auto_611987 ?auto_611988 ?auto_611989 ?auto_611990 ?auto_611991 ?auto_611992 )
      ( MAKE-17PILE ?auto_611981 ?auto_611982 ?auto_611983 ?auto_611984 ?auto_611985 ?auto_611986 ?auto_611987 ?auto_611988 ?auto_611989 ?auto_611990 ?auto_611991 ?auto_611992 ?auto_611993 ?auto_611994 ?auto_611995 ?auto_611996 ?auto_611997 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612015 - BLOCK
      ?auto_612016 - BLOCK
      ?auto_612017 - BLOCK
      ?auto_612018 - BLOCK
      ?auto_612019 - BLOCK
      ?auto_612020 - BLOCK
      ?auto_612021 - BLOCK
      ?auto_612022 - BLOCK
      ?auto_612023 - BLOCK
      ?auto_612024 - BLOCK
      ?auto_612025 - BLOCK
      ?auto_612026 - BLOCK
      ?auto_612027 - BLOCK
      ?auto_612028 - BLOCK
      ?auto_612029 - BLOCK
      ?auto_612030 - BLOCK
      ?auto_612031 - BLOCK
    )
    :vars
    (
      ?auto_612032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612031 ?auto_612032 ) ( ON-TABLE ?auto_612015 ) ( ON ?auto_612016 ?auto_612015 ) ( ON ?auto_612017 ?auto_612016 ) ( ON ?auto_612018 ?auto_612017 ) ( ON ?auto_612019 ?auto_612018 ) ( ON ?auto_612020 ?auto_612019 ) ( ON ?auto_612021 ?auto_612020 ) ( ON ?auto_612022 ?auto_612021 ) ( ON ?auto_612023 ?auto_612022 ) ( ON ?auto_612024 ?auto_612023 ) ( not ( = ?auto_612015 ?auto_612016 ) ) ( not ( = ?auto_612015 ?auto_612017 ) ) ( not ( = ?auto_612015 ?auto_612018 ) ) ( not ( = ?auto_612015 ?auto_612019 ) ) ( not ( = ?auto_612015 ?auto_612020 ) ) ( not ( = ?auto_612015 ?auto_612021 ) ) ( not ( = ?auto_612015 ?auto_612022 ) ) ( not ( = ?auto_612015 ?auto_612023 ) ) ( not ( = ?auto_612015 ?auto_612024 ) ) ( not ( = ?auto_612015 ?auto_612025 ) ) ( not ( = ?auto_612015 ?auto_612026 ) ) ( not ( = ?auto_612015 ?auto_612027 ) ) ( not ( = ?auto_612015 ?auto_612028 ) ) ( not ( = ?auto_612015 ?auto_612029 ) ) ( not ( = ?auto_612015 ?auto_612030 ) ) ( not ( = ?auto_612015 ?auto_612031 ) ) ( not ( = ?auto_612015 ?auto_612032 ) ) ( not ( = ?auto_612016 ?auto_612017 ) ) ( not ( = ?auto_612016 ?auto_612018 ) ) ( not ( = ?auto_612016 ?auto_612019 ) ) ( not ( = ?auto_612016 ?auto_612020 ) ) ( not ( = ?auto_612016 ?auto_612021 ) ) ( not ( = ?auto_612016 ?auto_612022 ) ) ( not ( = ?auto_612016 ?auto_612023 ) ) ( not ( = ?auto_612016 ?auto_612024 ) ) ( not ( = ?auto_612016 ?auto_612025 ) ) ( not ( = ?auto_612016 ?auto_612026 ) ) ( not ( = ?auto_612016 ?auto_612027 ) ) ( not ( = ?auto_612016 ?auto_612028 ) ) ( not ( = ?auto_612016 ?auto_612029 ) ) ( not ( = ?auto_612016 ?auto_612030 ) ) ( not ( = ?auto_612016 ?auto_612031 ) ) ( not ( = ?auto_612016 ?auto_612032 ) ) ( not ( = ?auto_612017 ?auto_612018 ) ) ( not ( = ?auto_612017 ?auto_612019 ) ) ( not ( = ?auto_612017 ?auto_612020 ) ) ( not ( = ?auto_612017 ?auto_612021 ) ) ( not ( = ?auto_612017 ?auto_612022 ) ) ( not ( = ?auto_612017 ?auto_612023 ) ) ( not ( = ?auto_612017 ?auto_612024 ) ) ( not ( = ?auto_612017 ?auto_612025 ) ) ( not ( = ?auto_612017 ?auto_612026 ) ) ( not ( = ?auto_612017 ?auto_612027 ) ) ( not ( = ?auto_612017 ?auto_612028 ) ) ( not ( = ?auto_612017 ?auto_612029 ) ) ( not ( = ?auto_612017 ?auto_612030 ) ) ( not ( = ?auto_612017 ?auto_612031 ) ) ( not ( = ?auto_612017 ?auto_612032 ) ) ( not ( = ?auto_612018 ?auto_612019 ) ) ( not ( = ?auto_612018 ?auto_612020 ) ) ( not ( = ?auto_612018 ?auto_612021 ) ) ( not ( = ?auto_612018 ?auto_612022 ) ) ( not ( = ?auto_612018 ?auto_612023 ) ) ( not ( = ?auto_612018 ?auto_612024 ) ) ( not ( = ?auto_612018 ?auto_612025 ) ) ( not ( = ?auto_612018 ?auto_612026 ) ) ( not ( = ?auto_612018 ?auto_612027 ) ) ( not ( = ?auto_612018 ?auto_612028 ) ) ( not ( = ?auto_612018 ?auto_612029 ) ) ( not ( = ?auto_612018 ?auto_612030 ) ) ( not ( = ?auto_612018 ?auto_612031 ) ) ( not ( = ?auto_612018 ?auto_612032 ) ) ( not ( = ?auto_612019 ?auto_612020 ) ) ( not ( = ?auto_612019 ?auto_612021 ) ) ( not ( = ?auto_612019 ?auto_612022 ) ) ( not ( = ?auto_612019 ?auto_612023 ) ) ( not ( = ?auto_612019 ?auto_612024 ) ) ( not ( = ?auto_612019 ?auto_612025 ) ) ( not ( = ?auto_612019 ?auto_612026 ) ) ( not ( = ?auto_612019 ?auto_612027 ) ) ( not ( = ?auto_612019 ?auto_612028 ) ) ( not ( = ?auto_612019 ?auto_612029 ) ) ( not ( = ?auto_612019 ?auto_612030 ) ) ( not ( = ?auto_612019 ?auto_612031 ) ) ( not ( = ?auto_612019 ?auto_612032 ) ) ( not ( = ?auto_612020 ?auto_612021 ) ) ( not ( = ?auto_612020 ?auto_612022 ) ) ( not ( = ?auto_612020 ?auto_612023 ) ) ( not ( = ?auto_612020 ?auto_612024 ) ) ( not ( = ?auto_612020 ?auto_612025 ) ) ( not ( = ?auto_612020 ?auto_612026 ) ) ( not ( = ?auto_612020 ?auto_612027 ) ) ( not ( = ?auto_612020 ?auto_612028 ) ) ( not ( = ?auto_612020 ?auto_612029 ) ) ( not ( = ?auto_612020 ?auto_612030 ) ) ( not ( = ?auto_612020 ?auto_612031 ) ) ( not ( = ?auto_612020 ?auto_612032 ) ) ( not ( = ?auto_612021 ?auto_612022 ) ) ( not ( = ?auto_612021 ?auto_612023 ) ) ( not ( = ?auto_612021 ?auto_612024 ) ) ( not ( = ?auto_612021 ?auto_612025 ) ) ( not ( = ?auto_612021 ?auto_612026 ) ) ( not ( = ?auto_612021 ?auto_612027 ) ) ( not ( = ?auto_612021 ?auto_612028 ) ) ( not ( = ?auto_612021 ?auto_612029 ) ) ( not ( = ?auto_612021 ?auto_612030 ) ) ( not ( = ?auto_612021 ?auto_612031 ) ) ( not ( = ?auto_612021 ?auto_612032 ) ) ( not ( = ?auto_612022 ?auto_612023 ) ) ( not ( = ?auto_612022 ?auto_612024 ) ) ( not ( = ?auto_612022 ?auto_612025 ) ) ( not ( = ?auto_612022 ?auto_612026 ) ) ( not ( = ?auto_612022 ?auto_612027 ) ) ( not ( = ?auto_612022 ?auto_612028 ) ) ( not ( = ?auto_612022 ?auto_612029 ) ) ( not ( = ?auto_612022 ?auto_612030 ) ) ( not ( = ?auto_612022 ?auto_612031 ) ) ( not ( = ?auto_612022 ?auto_612032 ) ) ( not ( = ?auto_612023 ?auto_612024 ) ) ( not ( = ?auto_612023 ?auto_612025 ) ) ( not ( = ?auto_612023 ?auto_612026 ) ) ( not ( = ?auto_612023 ?auto_612027 ) ) ( not ( = ?auto_612023 ?auto_612028 ) ) ( not ( = ?auto_612023 ?auto_612029 ) ) ( not ( = ?auto_612023 ?auto_612030 ) ) ( not ( = ?auto_612023 ?auto_612031 ) ) ( not ( = ?auto_612023 ?auto_612032 ) ) ( not ( = ?auto_612024 ?auto_612025 ) ) ( not ( = ?auto_612024 ?auto_612026 ) ) ( not ( = ?auto_612024 ?auto_612027 ) ) ( not ( = ?auto_612024 ?auto_612028 ) ) ( not ( = ?auto_612024 ?auto_612029 ) ) ( not ( = ?auto_612024 ?auto_612030 ) ) ( not ( = ?auto_612024 ?auto_612031 ) ) ( not ( = ?auto_612024 ?auto_612032 ) ) ( not ( = ?auto_612025 ?auto_612026 ) ) ( not ( = ?auto_612025 ?auto_612027 ) ) ( not ( = ?auto_612025 ?auto_612028 ) ) ( not ( = ?auto_612025 ?auto_612029 ) ) ( not ( = ?auto_612025 ?auto_612030 ) ) ( not ( = ?auto_612025 ?auto_612031 ) ) ( not ( = ?auto_612025 ?auto_612032 ) ) ( not ( = ?auto_612026 ?auto_612027 ) ) ( not ( = ?auto_612026 ?auto_612028 ) ) ( not ( = ?auto_612026 ?auto_612029 ) ) ( not ( = ?auto_612026 ?auto_612030 ) ) ( not ( = ?auto_612026 ?auto_612031 ) ) ( not ( = ?auto_612026 ?auto_612032 ) ) ( not ( = ?auto_612027 ?auto_612028 ) ) ( not ( = ?auto_612027 ?auto_612029 ) ) ( not ( = ?auto_612027 ?auto_612030 ) ) ( not ( = ?auto_612027 ?auto_612031 ) ) ( not ( = ?auto_612027 ?auto_612032 ) ) ( not ( = ?auto_612028 ?auto_612029 ) ) ( not ( = ?auto_612028 ?auto_612030 ) ) ( not ( = ?auto_612028 ?auto_612031 ) ) ( not ( = ?auto_612028 ?auto_612032 ) ) ( not ( = ?auto_612029 ?auto_612030 ) ) ( not ( = ?auto_612029 ?auto_612031 ) ) ( not ( = ?auto_612029 ?auto_612032 ) ) ( not ( = ?auto_612030 ?auto_612031 ) ) ( not ( = ?auto_612030 ?auto_612032 ) ) ( not ( = ?auto_612031 ?auto_612032 ) ) ( ON ?auto_612030 ?auto_612031 ) ( ON ?auto_612029 ?auto_612030 ) ( ON ?auto_612028 ?auto_612029 ) ( ON ?auto_612027 ?auto_612028 ) ( ON ?auto_612026 ?auto_612027 ) ( CLEAR ?auto_612024 ) ( ON ?auto_612025 ?auto_612026 ) ( CLEAR ?auto_612025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_612015 ?auto_612016 ?auto_612017 ?auto_612018 ?auto_612019 ?auto_612020 ?auto_612021 ?auto_612022 ?auto_612023 ?auto_612024 ?auto_612025 )
      ( MAKE-17PILE ?auto_612015 ?auto_612016 ?auto_612017 ?auto_612018 ?auto_612019 ?auto_612020 ?auto_612021 ?auto_612022 ?auto_612023 ?auto_612024 ?auto_612025 ?auto_612026 ?auto_612027 ?auto_612028 ?auto_612029 ?auto_612030 ?auto_612031 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612050 - BLOCK
      ?auto_612051 - BLOCK
      ?auto_612052 - BLOCK
      ?auto_612053 - BLOCK
      ?auto_612054 - BLOCK
      ?auto_612055 - BLOCK
      ?auto_612056 - BLOCK
      ?auto_612057 - BLOCK
      ?auto_612058 - BLOCK
      ?auto_612059 - BLOCK
      ?auto_612060 - BLOCK
      ?auto_612061 - BLOCK
      ?auto_612062 - BLOCK
      ?auto_612063 - BLOCK
      ?auto_612064 - BLOCK
      ?auto_612065 - BLOCK
      ?auto_612066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612066 ) ( ON-TABLE ?auto_612050 ) ( ON ?auto_612051 ?auto_612050 ) ( ON ?auto_612052 ?auto_612051 ) ( ON ?auto_612053 ?auto_612052 ) ( ON ?auto_612054 ?auto_612053 ) ( ON ?auto_612055 ?auto_612054 ) ( ON ?auto_612056 ?auto_612055 ) ( ON ?auto_612057 ?auto_612056 ) ( ON ?auto_612058 ?auto_612057 ) ( ON ?auto_612059 ?auto_612058 ) ( not ( = ?auto_612050 ?auto_612051 ) ) ( not ( = ?auto_612050 ?auto_612052 ) ) ( not ( = ?auto_612050 ?auto_612053 ) ) ( not ( = ?auto_612050 ?auto_612054 ) ) ( not ( = ?auto_612050 ?auto_612055 ) ) ( not ( = ?auto_612050 ?auto_612056 ) ) ( not ( = ?auto_612050 ?auto_612057 ) ) ( not ( = ?auto_612050 ?auto_612058 ) ) ( not ( = ?auto_612050 ?auto_612059 ) ) ( not ( = ?auto_612050 ?auto_612060 ) ) ( not ( = ?auto_612050 ?auto_612061 ) ) ( not ( = ?auto_612050 ?auto_612062 ) ) ( not ( = ?auto_612050 ?auto_612063 ) ) ( not ( = ?auto_612050 ?auto_612064 ) ) ( not ( = ?auto_612050 ?auto_612065 ) ) ( not ( = ?auto_612050 ?auto_612066 ) ) ( not ( = ?auto_612051 ?auto_612052 ) ) ( not ( = ?auto_612051 ?auto_612053 ) ) ( not ( = ?auto_612051 ?auto_612054 ) ) ( not ( = ?auto_612051 ?auto_612055 ) ) ( not ( = ?auto_612051 ?auto_612056 ) ) ( not ( = ?auto_612051 ?auto_612057 ) ) ( not ( = ?auto_612051 ?auto_612058 ) ) ( not ( = ?auto_612051 ?auto_612059 ) ) ( not ( = ?auto_612051 ?auto_612060 ) ) ( not ( = ?auto_612051 ?auto_612061 ) ) ( not ( = ?auto_612051 ?auto_612062 ) ) ( not ( = ?auto_612051 ?auto_612063 ) ) ( not ( = ?auto_612051 ?auto_612064 ) ) ( not ( = ?auto_612051 ?auto_612065 ) ) ( not ( = ?auto_612051 ?auto_612066 ) ) ( not ( = ?auto_612052 ?auto_612053 ) ) ( not ( = ?auto_612052 ?auto_612054 ) ) ( not ( = ?auto_612052 ?auto_612055 ) ) ( not ( = ?auto_612052 ?auto_612056 ) ) ( not ( = ?auto_612052 ?auto_612057 ) ) ( not ( = ?auto_612052 ?auto_612058 ) ) ( not ( = ?auto_612052 ?auto_612059 ) ) ( not ( = ?auto_612052 ?auto_612060 ) ) ( not ( = ?auto_612052 ?auto_612061 ) ) ( not ( = ?auto_612052 ?auto_612062 ) ) ( not ( = ?auto_612052 ?auto_612063 ) ) ( not ( = ?auto_612052 ?auto_612064 ) ) ( not ( = ?auto_612052 ?auto_612065 ) ) ( not ( = ?auto_612052 ?auto_612066 ) ) ( not ( = ?auto_612053 ?auto_612054 ) ) ( not ( = ?auto_612053 ?auto_612055 ) ) ( not ( = ?auto_612053 ?auto_612056 ) ) ( not ( = ?auto_612053 ?auto_612057 ) ) ( not ( = ?auto_612053 ?auto_612058 ) ) ( not ( = ?auto_612053 ?auto_612059 ) ) ( not ( = ?auto_612053 ?auto_612060 ) ) ( not ( = ?auto_612053 ?auto_612061 ) ) ( not ( = ?auto_612053 ?auto_612062 ) ) ( not ( = ?auto_612053 ?auto_612063 ) ) ( not ( = ?auto_612053 ?auto_612064 ) ) ( not ( = ?auto_612053 ?auto_612065 ) ) ( not ( = ?auto_612053 ?auto_612066 ) ) ( not ( = ?auto_612054 ?auto_612055 ) ) ( not ( = ?auto_612054 ?auto_612056 ) ) ( not ( = ?auto_612054 ?auto_612057 ) ) ( not ( = ?auto_612054 ?auto_612058 ) ) ( not ( = ?auto_612054 ?auto_612059 ) ) ( not ( = ?auto_612054 ?auto_612060 ) ) ( not ( = ?auto_612054 ?auto_612061 ) ) ( not ( = ?auto_612054 ?auto_612062 ) ) ( not ( = ?auto_612054 ?auto_612063 ) ) ( not ( = ?auto_612054 ?auto_612064 ) ) ( not ( = ?auto_612054 ?auto_612065 ) ) ( not ( = ?auto_612054 ?auto_612066 ) ) ( not ( = ?auto_612055 ?auto_612056 ) ) ( not ( = ?auto_612055 ?auto_612057 ) ) ( not ( = ?auto_612055 ?auto_612058 ) ) ( not ( = ?auto_612055 ?auto_612059 ) ) ( not ( = ?auto_612055 ?auto_612060 ) ) ( not ( = ?auto_612055 ?auto_612061 ) ) ( not ( = ?auto_612055 ?auto_612062 ) ) ( not ( = ?auto_612055 ?auto_612063 ) ) ( not ( = ?auto_612055 ?auto_612064 ) ) ( not ( = ?auto_612055 ?auto_612065 ) ) ( not ( = ?auto_612055 ?auto_612066 ) ) ( not ( = ?auto_612056 ?auto_612057 ) ) ( not ( = ?auto_612056 ?auto_612058 ) ) ( not ( = ?auto_612056 ?auto_612059 ) ) ( not ( = ?auto_612056 ?auto_612060 ) ) ( not ( = ?auto_612056 ?auto_612061 ) ) ( not ( = ?auto_612056 ?auto_612062 ) ) ( not ( = ?auto_612056 ?auto_612063 ) ) ( not ( = ?auto_612056 ?auto_612064 ) ) ( not ( = ?auto_612056 ?auto_612065 ) ) ( not ( = ?auto_612056 ?auto_612066 ) ) ( not ( = ?auto_612057 ?auto_612058 ) ) ( not ( = ?auto_612057 ?auto_612059 ) ) ( not ( = ?auto_612057 ?auto_612060 ) ) ( not ( = ?auto_612057 ?auto_612061 ) ) ( not ( = ?auto_612057 ?auto_612062 ) ) ( not ( = ?auto_612057 ?auto_612063 ) ) ( not ( = ?auto_612057 ?auto_612064 ) ) ( not ( = ?auto_612057 ?auto_612065 ) ) ( not ( = ?auto_612057 ?auto_612066 ) ) ( not ( = ?auto_612058 ?auto_612059 ) ) ( not ( = ?auto_612058 ?auto_612060 ) ) ( not ( = ?auto_612058 ?auto_612061 ) ) ( not ( = ?auto_612058 ?auto_612062 ) ) ( not ( = ?auto_612058 ?auto_612063 ) ) ( not ( = ?auto_612058 ?auto_612064 ) ) ( not ( = ?auto_612058 ?auto_612065 ) ) ( not ( = ?auto_612058 ?auto_612066 ) ) ( not ( = ?auto_612059 ?auto_612060 ) ) ( not ( = ?auto_612059 ?auto_612061 ) ) ( not ( = ?auto_612059 ?auto_612062 ) ) ( not ( = ?auto_612059 ?auto_612063 ) ) ( not ( = ?auto_612059 ?auto_612064 ) ) ( not ( = ?auto_612059 ?auto_612065 ) ) ( not ( = ?auto_612059 ?auto_612066 ) ) ( not ( = ?auto_612060 ?auto_612061 ) ) ( not ( = ?auto_612060 ?auto_612062 ) ) ( not ( = ?auto_612060 ?auto_612063 ) ) ( not ( = ?auto_612060 ?auto_612064 ) ) ( not ( = ?auto_612060 ?auto_612065 ) ) ( not ( = ?auto_612060 ?auto_612066 ) ) ( not ( = ?auto_612061 ?auto_612062 ) ) ( not ( = ?auto_612061 ?auto_612063 ) ) ( not ( = ?auto_612061 ?auto_612064 ) ) ( not ( = ?auto_612061 ?auto_612065 ) ) ( not ( = ?auto_612061 ?auto_612066 ) ) ( not ( = ?auto_612062 ?auto_612063 ) ) ( not ( = ?auto_612062 ?auto_612064 ) ) ( not ( = ?auto_612062 ?auto_612065 ) ) ( not ( = ?auto_612062 ?auto_612066 ) ) ( not ( = ?auto_612063 ?auto_612064 ) ) ( not ( = ?auto_612063 ?auto_612065 ) ) ( not ( = ?auto_612063 ?auto_612066 ) ) ( not ( = ?auto_612064 ?auto_612065 ) ) ( not ( = ?auto_612064 ?auto_612066 ) ) ( not ( = ?auto_612065 ?auto_612066 ) ) ( ON ?auto_612065 ?auto_612066 ) ( ON ?auto_612064 ?auto_612065 ) ( ON ?auto_612063 ?auto_612064 ) ( ON ?auto_612062 ?auto_612063 ) ( ON ?auto_612061 ?auto_612062 ) ( CLEAR ?auto_612059 ) ( ON ?auto_612060 ?auto_612061 ) ( CLEAR ?auto_612060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_612050 ?auto_612051 ?auto_612052 ?auto_612053 ?auto_612054 ?auto_612055 ?auto_612056 ?auto_612057 ?auto_612058 ?auto_612059 ?auto_612060 )
      ( MAKE-17PILE ?auto_612050 ?auto_612051 ?auto_612052 ?auto_612053 ?auto_612054 ?auto_612055 ?auto_612056 ?auto_612057 ?auto_612058 ?auto_612059 ?auto_612060 ?auto_612061 ?auto_612062 ?auto_612063 ?auto_612064 ?auto_612065 ?auto_612066 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612084 - BLOCK
      ?auto_612085 - BLOCK
      ?auto_612086 - BLOCK
      ?auto_612087 - BLOCK
      ?auto_612088 - BLOCK
      ?auto_612089 - BLOCK
      ?auto_612090 - BLOCK
      ?auto_612091 - BLOCK
      ?auto_612092 - BLOCK
      ?auto_612093 - BLOCK
      ?auto_612094 - BLOCK
      ?auto_612095 - BLOCK
      ?auto_612096 - BLOCK
      ?auto_612097 - BLOCK
      ?auto_612098 - BLOCK
      ?auto_612099 - BLOCK
      ?auto_612100 - BLOCK
    )
    :vars
    (
      ?auto_612101 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612100 ?auto_612101 ) ( ON-TABLE ?auto_612084 ) ( ON ?auto_612085 ?auto_612084 ) ( ON ?auto_612086 ?auto_612085 ) ( ON ?auto_612087 ?auto_612086 ) ( ON ?auto_612088 ?auto_612087 ) ( ON ?auto_612089 ?auto_612088 ) ( ON ?auto_612090 ?auto_612089 ) ( ON ?auto_612091 ?auto_612090 ) ( ON ?auto_612092 ?auto_612091 ) ( not ( = ?auto_612084 ?auto_612085 ) ) ( not ( = ?auto_612084 ?auto_612086 ) ) ( not ( = ?auto_612084 ?auto_612087 ) ) ( not ( = ?auto_612084 ?auto_612088 ) ) ( not ( = ?auto_612084 ?auto_612089 ) ) ( not ( = ?auto_612084 ?auto_612090 ) ) ( not ( = ?auto_612084 ?auto_612091 ) ) ( not ( = ?auto_612084 ?auto_612092 ) ) ( not ( = ?auto_612084 ?auto_612093 ) ) ( not ( = ?auto_612084 ?auto_612094 ) ) ( not ( = ?auto_612084 ?auto_612095 ) ) ( not ( = ?auto_612084 ?auto_612096 ) ) ( not ( = ?auto_612084 ?auto_612097 ) ) ( not ( = ?auto_612084 ?auto_612098 ) ) ( not ( = ?auto_612084 ?auto_612099 ) ) ( not ( = ?auto_612084 ?auto_612100 ) ) ( not ( = ?auto_612084 ?auto_612101 ) ) ( not ( = ?auto_612085 ?auto_612086 ) ) ( not ( = ?auto_612085 ?auto_612087 ) ) ( not ( = ?auto_612085 ?auto_612088 ) ) ( not ( = ?auto_612085 ?auto_612089 ) ) ( not ( = ?auto_612085 ?auto_612090 ) ) ( not ( = ?auto_612085 ?auto_612091 ) ) ( not ( = ?auto_612085 ?auto_612092 ) ) ( not ( = ?auto_612085 ?auto_612093 ) ) ( not ( = ?auto_612085 ?auto_612094 ) ) ( not ( = ?auto_612085 ?auto_612095 ) ) ( not ( = ?auto_612085 ?auto_612096 ) ) ( not ( = ?auto_612085 ?auto_612097 ) ) ( not ( = ?auto_612085 ?auto_612098 ) ) ( not ( = ?auto_612085 ?auto_612099 ) ) ( not ( = ?auto_612085 ?auto_612100 ) ) ( not ( = ?auto_612085 ?auto_612101 ) ) ( not ( = ?auto_612086 ?auto_612087 ) ) ( not ( = ?auto_612086 ?auto_612088 ) ) ( not ( = ?auto_612086 ?auto_612089 ) ) ( not ( = ?auto_612086 ?auto_612090 ) ) ( not ( = ?auto_612086 ?auto_612091 ) ) ( not ( = ?auto_612086 ?auto_612092 ) ) ( not ( = ?auto_612086 ?auto_612093 ) ) ( not ( = ?auto_612086 ?auto_612094 ) ) ( not ( = ?auto_612086 ?auto_612095 ) ) ( not ( = ?auto_612086 ?auto_612096 ) ) ( not ( = ?auto_612086 ?auto_612097 ) ) ( not ( = ?auto_612086 ?auto_612098 ) ) ( not ( = ?auto_612086 ?auto_612099 ) ) ( not ( = ?auto_612086 ?auto_612100 ) ) ( not ( = ?auto_612086 ?auto_612101 ) ) ( not ( = ?auto_612087 ?auto_612088 ) ) ( not ( = ?auto_612087 ?auto_612089 ) ) ( not ( = ?auto_612087 ?auto_612090 ) ) ( not ( = ?auto_612087 ?auto_612091 ) ) ( not ( = ?auto_612087 ?auto_612092 ) ) ( not ( = ?auto_612087 ?auto_612093 ) ) ( not ( = ?auto_612087 ?auto_612094 ) ) ( not ( = ?auto_612087 ?auto_612095 ) ) ( not ( = ?auto_612087 ?auto_612096 ) ) ( not ( = ?auto_612087 ?auto_612097 ) ) ( not ( = ?auto_612087 ?auto_612098 ) ) ( not ( = ?auto_612087 ?auto_612099 ) ) ( not ( = ?auto_612087 ?auto_612100 ) ) ( not ( = ?auto_612087 ?auto_612101 ) ) ( not ( = ?auto_612088 ?auto_612089 ) ) ( not ( = ?auto_612088 ?auto_612090 ) ) ( not ( = ?auto_612088 ?auto_612091 ) ) ( not ( = ?auto_612088 ?auto_612092 ) ) ( not ( = ?auto_612088 ?auto_612093 ) ) ( not ( = ?auto_612088 ?auto_612094 ) ) ( not ( = ?auto_612088 ?auto_612095 ) ) ( not ( = ?auto_612088 ?auto_612096 ) ) ( not ( = ?auto_612088 ?auto_612097 ) ) ( not ( = ?auto_612088 ?auto_612098 ) ) ( not ( = ?auto_612088 ?auto_612099 ) ) ( not ( = ?auto_612088 ?auto_612100 ) ) ( not ( = ?auto_612088 ?auto_612101 ) ) ( not ( = ?auto_612089 ?auto_612090 ) ) ( not ( = ?auto_612089 ?auto_612091 ) ) ( not ( = ?auto_612089 ?auto_612092 ) ) ( not ( = ?auto_612089 ?auto_612093 ) ) ( not ( = ?auto_612089 ?auto_612094 ) ) ( not ( = ?auto_612089 ?auto_612095 ) ) ( not ( = ?auto_612089 ?auto_612096 ) ) ( not ( = ?auto_612089 ?auto_612097 ) ) ( not ( = ?auto_612089 ?auto_612098 ) ) ( not ( = ?auto_612089 ?auto_612099 ) ) ( not ( = ?auto_612089 ?auto_612100 ) ) ( not ( = ?auto_612089 ?auto_612101 ) ) ( not ( = ?auto_612090 ?auto_612091 ) ) ( not ( = ?auto_612090 ?auto_612092 ) ) ( not ( = ?auto_612090 ?auto_612093 ) ) ( not ( = ?auto_612090 ?auto_612094 ) ) ( not ( = ?auto_612090 ?auto_612095 ) ) ( not ( = ?auto_612090 ?auto_612096 ) ) ( not ( = ?auto_612090 ?auto_612097 ) ) ( not ( = ?auto_612090 ?auto_612098 ) ) ( not ( = ?auto_612090 ?auto_612099 ) ) ( not ( = ?auto_612090 ?auto_612100 ) ) ( not ( = ?auto_612090 ?auto_612101 ) ) ( not ( = ?auto_612091 ?auto_612092 ) ) ( not ( = ?auto_612091 ?auto_612093 ) ) ( not ( = ?auto_612091 ?auto_612094 ) ) ( not ( = ?auto_612091 ?auto_612095 ) ) ( not ( = ?auto_612091 ?auto_612096 ) ) ( not ( = ?auto_612091 ?auto_612097 ) ) ( not ( = ?auto_612091 ?auto_612098 ) ) ( not ( = ?auto_612091 ?auto_612099 ) ) ( not ( = ?auto_612091 ?auto_612100 ) ) ( not ( = ?auto_612091 ?auto_612101 ) ) ( not ( = ?auto_612092 ?auto_612093 ) ) ( not ( = ?auto_612092 ?auto_612094 ) ) ( not ( = ?auto_612092 ?auto_612095 ) ) ( not ( = ?auto_612092 ?auto_612096 ) ) ( not ( = ?auto_612092 ?auto_612097 ) ) ( not ( = ?auto_612092 ?auto_612098 ) ) ( not ( = ?auto_612092 ?auto_612099 ) ) ( not ( = ?auto_612092 ?auto_612100 ) ) ( not ( = ?auto_612092 ?auto_612101 ) ) ( not ( = ?auto_612093 ?auto_612094 ) ) ( not ( = ?auto_612093 ?auto_612095 ) ) ( not ( = ?auto_612093 ?auto_612096 ) ) ( not ( = ?auto_612093 ?auto_612097 ) ) ( not ( = ?auto_612093 ?auto_612098 ) ) ( not ( = ?auto_612093 ?auto_612099 ) ) ( not ( = ?auto_612093 ?auto_612100 ) ) ( not ( = ?auto_612093 ?auto_612101 ) ) ( not ( = ?auto_612094 ?auto_612095 ) ) ( not ( = ?auto_612094 ?auto_612096 ) ) ( not ( = ?auto_612094 ?auto_612097 ) ) ( not ( = ?auto_612094 ?auto_612098 ) ) ( not ( = ?auto_612094 ?auto_612099 ) ) ( not ( = ?auto_612094 ?auto_612100 ) ) ( not ( = ?auto_612094 ?auto_612101 ) ) ( not ( = ?auto_612095 ?auto_612096 ) ) ( not ( = ?auto_612095 ?auto_612097 ) ) ( not ( = ?auto_612095 ?auto_612098 ) ) ( not ( = ?auto_612095 ?auto_612099 ) ) ( not ( = ?auto_612095 ?auto_612100 ) ) ( not ( = ?auto_612095 ?auto_612101 ) ) ( not ( = ?auto_612096 ?auto_612097 ) ) ( not ( = ?auto_612096 ?auto_612098 ) ) ( not ( = ?auto_612096 ?auto_612099 ) ) ( not ( = ?auto_612096 ?auto_612100 ) ) ( not ( = ?auto_612096 ?auto_612101 ) ) ( not ( = ?auto_612097 ?auto_612098 ) ) ( not ( = ?auto_612097 ?auto_612099 ) ) ( not ( = ?auto_612097 ?auto_612100 ) ) ( not ( = ?auto_612097 ?auto_612101 ) ) ( not ( = ?auto_612098 ?auto_612099 ) ) ( not ( = ?auto_612098 ?auto_612100 ) ) ( not ( = ?auto_612098 ?auto_612101 ) ) ( not ( = ?auto_612099 ?auto_612100 ) ) ( not ( = ?auto_612099 ?auto_612101 ) ) ( not ( = ?auto_612100 ?auto_612101 ) ) ( ON ?auto_612099 ?auto_612100 ) ( ON ?auto_612098 ?auto_612099 ) ( ON ?auto_612097 ?auto_612098 ) ( ON ?auto_612096 ?auto_612097 ) ( ON ?auto_612095 ?auto_612096 ) ( ON ?auto_612094 ?auto_612095 ) ( CLEAR ?auto_612092 ) ( ON ?auto_612093 ?auto_612094 ) ( CLEAR ?auto_612093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_612084 ?auto_612085 ?auto_612086 ?auto_612087 ?auto_612088 ?auto_612089 ?auto_612090 ?auto_612091 ?auto_612092 ?auto_612093 )
      ( MAKE-17PILE ?auto_612084 ?auto_612085 ?auto_612086 ?auto_612087 ?auto_612088 ?auto_612089 ?auto_612090 ?auto_612091 ?auto_612092 ?auto_612093 ?auto_612094 ?auto_612095 ?auto_612096 ?auto_612097 ?auto_612098 ?auto_612099 ?auto_612100 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612119 - BLOCK
      ?auto_612120 - BLOCK
      ?auto_612121 - BLOCK
      ?auto_612122 - BLOCK
      ?auto_612123 - BLOCK
      ?auto_612124 - BLOCK
      ?auto_612125 - BLOCK
      ?auto_612126 - BLOCK
      ?auto_612127 - BLOCK
      ?auto_612128 - BLOCK
      ?auto_612129 - BLOCK
      ?auto_612130 - BLOCK
      ?auto_612131 - BLOCK
      ?auto_612132 - BLOCK
      ?auto_612133 - BLOCK
      ?auto_612134 - BLOCK
      ?auto_612135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612135 ) ( ON-TABLE ?auto_612119 ) ( ON ?auto_612120 ?auto_612119 ) ( ON ?auto_612121 ?auto_612120 ) ( ON ?auto_612122 ?auto_612121 ) ( ON ?auto_612123 ?auto_612122 ) ( ON ?auto_612124 ?auto_612123 ) ( ON ?auto_612125 ?auto_612124 ) ( ON ?auto_612126 ?auto_612125 ) ( ON ?auto_612127 ?auto_612126 ) ( not ( = ?auto_612119 ?auto_612120 ) ) ( not ( = ?auto_612119 ?auto_612121 ) ) ( not ( = ?auto_612119 ?auto_612122 ) ) ( not ( = ?auto_612119 ?auto_612123 ) ) ( not ( = ?auto_612119 ?auto_612124 ) ) ( not ( = ?auto_612119 ?auto_612125 ) ) ( not ( = ?auto_612119 ?auto_612126 ) ) ( not ( = ?auto_612119 ?auto_612127 ) ) ( not ( = ?auto_612119 ?auto_612128 ) ) ( not ( = ?auto_612119 ?auto_612129 ) ) ( not ( = ?auto_612119 ?auto_612130 ) ) ( not ( = ?auto_612119 ?auto_612131 ) ) ( not ( = ?auto_612119 ?auto_612132 ) ) ( not ( = ?auto_612119 ?auto_612133 ) ) ( not ( = ?auto_612119 ?auto_612134 ) ) ( not ( = ?auto_612119 ?auto_612135 ) ) ( not ( = ?auto_612120 ?auto_612121 ) ) ( not ( = ?auto_612120 ?auto_612122 ) ) ( not ( = ?auto_612120 ?auto_612123 ) ) ( not ( = ?auto_612120 ?auto_612124 ) ) ( not ( = ?auto_612120 ?auto_612125 ) ) ( not ( = ?auto_612120 ?auto_612126 ) ) ( not ( = ?auto_612120 ?auto_612127 ) ) ( not ( = ?auto_612120 ?auto_612128 ) ) ( not ( = ?auto_612120 ?auto_612129 ) ) ( not ( = ?auto_612120 ?auto_612130 ) ) ( not ( = ?auto_612120 ?auto_612131 ) ) ( not ( = ?auto_612120 ?auto_612132 ) ) ( not ( = ?auto_612120 ?auto_612133 ) ) ( not ( = ?auto_612120 ?auto_612134 ) ) ( not ( = ?auto_612120 ?auto_612135 ) ) ( not ( = ?auto_612121 ?auto_612122 ) ) ( not ( = ?auto_612121 ?auto_612123 ) ) ( not ( = ?auto_612121 ?auto_612124 ) ) ( not ( = ?auto_612121 ?auto_612125 ) ) ( not ( = ?auto_612121 ?auto_612126 ) ) ( not ( = ?auto_612121 ?auto_612127 ) ) ( not ( = ?auto_612121 ?auto_612128 ) ) ( not ( = ?auto_612121 ?auto_612129 ) ) ( not ( = ?auto_612121 ?auto_612130 ) ) ( not ( = ?auto_612121 ?auto_612131 ) ) ( not ( = ?auto_612121 ?auto_612132 ) ) ( not ( = ?auto_612121 ?auto_612133 ) ) ( not ( = ?auto_612121 ?auto_612134 ) ) ( not ( = ?auto_612121 ?auto_612135 ) ) ( not ( = ?auto_612122 ?auto_612123 ) ) ( not ( = ?auto_612122 ?auto_612124 ) ) ( not ( = ?auto_612122 ?auto_612125 ) ) ( not ( = ?auto_612122 ?auto_612126 ) ) ( not ( = ?auto_612122 ?auto_612127 ) ) ( not ( = ?auto_612122 ?auto_612128 ) ) ( not ( = ?auto_612122 ?auto_612129 ) ) ( not ( = ?auto_612122 ?auto_612130 ) ) ( not ( = ?auto_612122 ?auto_612131 ) ) ( not ( = ?auto_612122 ?auto_612132 ) ) ( not ( = ?auto_612122 ?auto_612133 ) ) ( not ( = ?auto_612122 ?auto_612134 ) ) ( not ( = ?auto_612122 ?auto_612135 ) ) ( not ( = ?auto_612123 ?auto_612124 ) ) ( not ( = ?auto_612123 ?auto_612125 ) ) ( not ( = ?auto_612123 ?auto_612126 ) ) ( not ( = ?auto_612123 ?auto_612127 ) ) ( not ( = ?auto_612123 ?auto_612128 ) ) ( not ( = ?auto_612123 ?auto_612129 ) ) ( not ( = ?auto_612123 ?auto_612130 ) ) ( not ( = ?auto_612123 ?auto_612131 ) ) ( not ( = ?auto_612123 ?auto_612132 ) ) ( not ( = ?auto_612123 ?auto_612133 ) ) ( not ( = ?auto_612123 ?auto_612134 ) ) ( not ( = ?auto_612123 ?auto_612135 ) ) ( not ( = ?auto_612124 ?auto_612125 ) ) ( not ( = ?auto_612124 ?auto_612126 ) ) ( not ( = ?auto_612124 ?auto_612127 ) ) ( not ( = ?auto_612124 ?auto_612128 ) ) ( not ( = ?auto_612124 ?auto_612129 ) ) ( not ( = ?auto_612124 ?auto_612130 ) ) ( not ( = ?auto_612124 ?auto_612131 ) ) ( not ( = ?auto_612124 ?auto_612132 ) ) ( not ( = ?auto_612124 ?auto_612133 ) ) ( not ( = ?auto_612124 ?auto_612134 ) ) ( not ( = ?auto_612124 ?auto_612135 ) ) ( not ( = ?auto_612125 ?auto_612126 ) ) ( not ( = ?auto_612125 ?auto_612127 ) ) ( not ( = ?auto_612125 ?auto_612128 ) ) ( not ( = ?auto_612125 ?auto_612129 ) ) ( not ( = ?auto_612125 ?auto_612130 ) ) ( not ( = ?auto_612125 ?auto_612131 ) ) ( not ( = ?auto_612125 ?auto_612132 ) ) ( not ( = ?auto_612125 ?auto_612133 ) ) ( not ( = ?auto_612125 ?auto_612134 ) ) ( not ( = ?auto_612125 ?auto_612135 ) ) ( not ( = ?auto_612126 ?auto_612127 ) ) ( not ( = ?auto_612126 ?auto_612128 ) ) ( not ( = ?auto_612126 ?auto_612129 ) ) ( not ( = ?auto_612126 ?auto_612130 ) ) ( not ( = ?auto_612126 ?auto_612131 ) ) ( not ( = ?auto_612126 ?auto_612132 ) ) ( not ( = ?auto_612126 ?auto_612133 ) ) ( not ( = ?auto_612126 ?auto_612134 ) ) ( not ( = ?auto_612126 ?auto_612135 ) ) ( not ( = ?auto_612127 ?auto_612128 ) ) ( not ( = ?auto_612127 ?auto_612129 ) ) ( not ( = ?auto_612127 ?auto_612130 ) ) ( not ( = ?auto_612127 ?auto_612131 ) ) ( not ( = ?auto_612127 ?auto_612132 ) ) ( not ( = ?auto_612127 ?auto_612133 ) ) ( not ( = ?auto_612127 ?auto_612134 ) ) ( not ( = ?auto_612127 ?auto_612135 ) ) ( not ( = ?auto_612128 ?auto_612129 ) ) ( not ( = ?auto_612128 ?auto_612130 ) ) ( not ( = ?auto_612128 ?auto_612131 ) ) ( not ( = ?auto_612128 ?auto_612132 ) ) ( not ( = ?auto_612128 ?auto_612133 ) ) ( not ( = ?auto_612128 ?auto_612134 ) ) ( not ( = ?auto_612128 ?auto_612135 ) ) ( not ( = ?auto_612129 ?auto_612130 ) ) ( not ( = ?auto_612129 ?auto_612131 ) ) ( not ( = ?auto_612129 ?auto_612132 ) ) ( not ( = ?auto_612129 ?auto_612133 ) ) ( not ( = ?auto_612129 ?auto_612134 ) ) ( not ( = ?auto_612129 ?auto_612135 ) ) ( not ( = ?auto_612130 ?auto_612131 ) ) ( not ( = ?auto_612130 ?auto_612132 ) ) ( not ( = ?auto_612130 ?auto_612133 ) ) ( not ( = ?auto_612130 ?auto_612134 ) ) ( not ( = ?auto_612130 ?auto_612135 ) ) ( not ( = ?auto_612131 ?auto_612132 ) ) ( not ( = ?auto_612131 ?auto_612133 ) ) ( not ( = ?auto_612131 ?auto_612134 ) ) ( not ( = ?auto_612131 ?auto_612135 ) ) ( not ( = ?auto_612132 ?auto_612133 ) ) ( not ( = ?auto_612132 ?auto_612134 ) ) ( not ( = ?auto_612132 ?auto_612135 ) ) ( not ( = ?auto_612133 ?auto_612134 ) ) ( not ( = ?auto_612133 ?auto_612135 ) ) ( not ( = ?auto_612134 ?auto_612135 ) ) ( ON ?auto_612134 ?auto_612135 ) ( ON ?auto_612133 ?auto_612134 ) ( ON ?auto_612132 ?auto_612133 ) ( ON ?auto_612131 ?auto_612132 ) ( ON ?auto_612130 ?auto_612131 ) ( ON ?auto_612129 ?auto_612130 ) ( CLEAR ?auto_612127 ) ( ON ?auto_612128 ?auto_612129 ) ( CLEAR ?auto_612128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_612119 ?auto_612120 ?auto_612121 ?auto_612122 ?auto_612123 ?auto_612124 ?auto_612125 ?auto_612126 ?auto_612127 ?auto_612128 )
      ( MAKE-17PILE ?auto_612119 ?auto_612120 ?auto_612121 ?auto_612122 ?auto_612123 ?auto_612124 ?auto_612125 ?auto_612126 ?auto_612127 ?auto_612128 ?auto_612129 ?auto_612130 ?auto_612131 ?auto_612132 ?auto_612133 ?auto_612134 ?auto_612135 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612153 - BLOCK
      ?auto_612154 - BLOCK
      ?auto_612155 - BLOCK
      ?auto_612156 - BLOCK
      ?auto_612157 - BLOCK
      ?auto_612158 - BLOCK
      ?auto_612159 - BLOCK
      ?auto_612160 - BLOCK
      ?auto_612161 - BLOCK
      ?auto_612162 - BLOCK
      ?auto_612163 - BLOCK
      ?auto_612164 - BLOCK
      ?auto_612165 - BLOCK
      ?auto_612166 - BLOCK
      ?auto_612167 - BLOCK
      ?auto_612168 - BLOCK
      ?auto_612169 - BLOCK
    )
    :vars
    (
      ?auto_612170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612169 ?auto_612170 ) ( ON-TABLE ?auto_612153 ) ( ON ?auto_612154 ?auto_612153 ) ( ON ?auto_612155 ?auto_612154 ) ( ON ?auto_612156 ?auto_612155 ) ( ON ?auto_612157 ?auto_612156 ) ( ON ?auto_612158 ?auto_612157 ) ( ON ?auto_612159 ?auto_612158 ) ( ON ?auto_612160 ?auto_612159 ) ( not ( = ?auto_612153 ?auto_612154 ) ) ( not ( = ?auto_612153 ?auto_612155 ) ) ( not ( = ?auto_612153 ?auto_612156 ) ) ( not ( = ?auto_612153 ?auto_612157 ) ) ( not ( = ?auto_612153 ?auto_612158 ) ) ( not ( = ?auto_612153 ?auto_612159 ) ) ( not ( = ?auto_612153 ?auto_612160 ) ) ( not ( = ?auto_612153 ?auto_612161 ) ) ( not ( = ?auto_612153 ?auto_612162 ) ) ( not ( = ?auto_612153 ?auto_612163 ) ) ( not ( = ?auto_612153 ?auto_612164 ) ) ( not ( = ?auto_612153 ?auto_612165 ) ) ( not ( = ?auto_612153 ?auto_612166 ) ) ( not ( = ?auto_612153 ?auto_612167 ) ) ( not ( = ?auto_612153 ?auto_612168 ) ) ( not ( = ?auto_612153 ?auto_612169 ) ) ( not ( = ?auto_612153 ?auto_612170 ) ) ( not ( = ?auto_612154 ?auto_612155 ) ) ( not ( = ?auto_612154 ?auto_612156 ) ) ( not ( = ?auto_612154 ?auto_612157 ) ) ( not ( = ?auto_612154 ?auto_612158 ) ) ( not ( = ?auto_612154 ?auto_612159 ) ) ( not ( = ?auto_612154 ?auto_612160 ) ) ( not ( = ?auto_612154 ?auto_612161 ) ) ( not ( = ?auto_612154 ?auto_612162 ) ) ( not ( = ?auto_612154 ?auto_612163 ) ) ( not ( = ?auto_612154 ?auto_612164 ) ) ( not ( = ?auto_612154 ?auto_612165 ) ) ( not ( = ?auto_612154 ?auto_612166 ) ) ( not ( = ?auto_612154 ?auto_612167 ) ) ( not ( = ?auto_612154 ?auto_612168 ) ) ( not ( = ?auto_612154 ?auto_612169 ) ) ( not ( = ?auto_612154 ?auto_612170 ) ) ( not ( = ?auto_612155 ?auto_612156 ) ) ( not ( = ?auto_612155 ?auto_612157 ) ) ( not ( = ?auto_612155 ?auto_612158 ) ) ( not ( = ?auto_612155 ?auto_612159 ) ) ( not ( = ?auto_612155 ?auto_612160 ) ) ( not ( = ?auto_612155 ?auto_612161 ) ) ( not ( = ?auto_612155 ?auto_612162 ) ) ( not ( = ?auto_612155 ?auto_612163 ) ) ( not ( = ?auto_612155 ?auto_612164 ) ) ( not ( = ?auto_612155 ?auto_612165 ) ) ( not ( = ?auto_612155 ?auto_612166 ) ) ( not ( = ?auto_612155 ?auto_612167 ) ) ( not ( = ?auto_612155 ?auto_612168 ) ) ( not ( = ?auto_612155 ?auto_612169 ) ) ( not ( = ?auto_612155 ?auto_612170 ) ) ( not ( = ?auto_612156 ?auto_612157 ) ) ( not ( = ?auto_612156 ?auto_612158 ) ) ( not ( = ?auto_612156 ?auto_612159 ) ) ( not ( = ?auto_612156 ?auto_612160 ) ) ( not ( = ?auto_612156 ?auto_612161 ) ) ( not ( = ?auto_612156 ?auto_612162 ) ) ( not ( = ?auto_612156 ?auto_612163 ) ) ( not ( = ?auto_612156 ?auto_612164 ) ) ( not ( = ?auto_612156 ?auto_612165 ) ) ( not ( = ?auto_612156 ?auto_612166 ) ) ( not ( = ?auto_612156 ?auto_612167 ) ) ( not ( = ?auto_612156 ?auto_612168 ) ) ( not ( = ?auto_612156 ?auto_612169 ) ) ( not ( = ?auto_612156 ?auto_612170 ) ) ( not ( = ?auto_612157 ?auto_612158 ) ) ( not ( = ?auto_612157 ?auto_612159 ) ) ( not ( = ?auto_612157 ?auto_612160 ) ) ( not ( = ?auto_612157 ?auto_612161 ) ) ( not ( = ?auto_612157 ?auto_612162 ) ) ( not ( = ?auto_612157 ?auto_612163 ) ) ( not ( = ?auto_612157 ?auto_612164 ) ) ( not ( = ?auto_612157 ?auto_612165 ) ) ( not ( = ?auto_612157 ?auto_612166 ) ) ( not ( = ?auto_612157 ?auto_612167 ) ) ( not ( = ?auto_612157 ?auto_612168 ) ) ( not ( = ?auto_612157 ?auto_612169 ) ) ( not ( = ?auto_612157 ?auto_612170 ) ) ( not ( = ?auto_612158 ?auto_612159 ) ) ( not ( = ?auto_612158 ?auto_612160 ) ) ( not ( = ?auto_612158 ?auto_612161 ) ) ( not ( = ?auto_612158 ?auto_612162 ) ) ( not ( = ?auto_612158 ?auto_612163 ) ) ( not ( = ?auto_612158 ?auto_612164 ) ) ( not ( = ?auto_612158 ?auto_612165 ) ) ( not ( = ?auto_612158 ?auto_612166 ) ) ( not ( = ?auto_612158 ?auto_612167 ) ) ( not ( = ?auto_612158 ?auto_612168 ) ) ( not ( = ?auto_612158 ?auto_612169 ) ) ( not ( = ?auto_612158 ?auto_612170 ) ) ( not ( = ?auto_612159 ?auto_612160 ) ) ( not ( = ?auto_612159 ?auto_612161 ) ) ( not ( = ?auto_612159 ?auto_612162 ) ) ( not ( = ?auto_612159 ?auto_612163 ) ) ( not ( = ?auto_612159 ?auto_612164 ) ) ( not ( = ?auto_612159 ?auto_612165 ) ) ( not ( = ?auto_612159 ?auto_612166 ) ) ( not ( = ?auto_612159 ?auto_612167 ) ) ( not ( = ?auto_612159 ?auto_612168 ) ) ( not ( = ?auto_612159 ?auto_612169 ) ) ( not ( = ?auto_612159 ?auto_612170 ) ) ( not ( = ?auto_612160 ?auto_612161 ) ) ( not ( = ?auto_612160 ?auto_612162 ) ) ( not ( = ?auto_612160 ?auto_612163 ) ) ( not ( = ?auto_612160 ?auto_612164 ) ) ( not ( = ?auto_612160 ?auto_612165 ) ) ( not ( = ?auto_612160 ?auto_612166 ) ) ( not ( = ?auto_612160 ?auto_612167 ) ) ( not ( = ?auto_612160 ?auto_612168 ) ) ( not ( = ?auto_612160 ?auto_612169 ) ) ( not ( = ?auto_612160 ?auto_612170 ) ) ( not ( = ?auto_612161 ?auto_612162 ) ) ( not ( = ?auto_612161 ?auto_612163 ) ) ( not ( = ?auto_612161 ?auto_612164 ) ) ( not ( = ?auto_612161 ?auto_612165 ) ) ( not ( = ?auto_612161 ?auto_612166 ) ) ( not ( = ?auto_612161 ?auto_612167 ) ) ( not ( = ?auto_612161 ?auto_612168 ) ) ( not ( = ?auto_612161 ?auto_612169 ) ) ( not ( = ?auto_612161 ?auto_612170 ) ) ( not ( = ?auto_612162 ?auto_612163 ) ) ( not ( = ?auto_612162 ?auto_612164 ) ) ( not ( = ?auto_612162 ?auto_612165 ) ) ( not ( = ?auto_612162 ?auto_612166 ) ) ( not ( = ?auto_612162 ?auto_612167 ) ) ( not ( = ?auto_612162 ?auto_612168 ) ) ( not ( = ?auto_612162 ?auto_612169 ) ) ( not ( = ?auto_612162 ?auto_612170 ) ) ( not ( = ?auto_612163 ?auto_612164 ) ) ( not ( = ?auto_612163 ?auto_612165 ) ) ( not ( = ?auto_612163 ?auto_612166 ) ) ( not ( = ?auto_612163 ?auto_612167 ) ) ( not ( = ?auto_612163 ?auto_612168 ) ) ( not ( = ?auto_612163 ?auto_612169 ) ) ( not ( = ?auto_612163 ?auto_612170 ) ) ( not ( = ?auto_612164 ?auto_612165 ) ) ( not ( = ?auto_612164 ?auto_612166 ) ) ( not ( = ?auto_612164 ?auto_612167 ) ) ( not ( = ?auto_612164 ?auto_612168 ) ) ( not ( = ?auto_612164 ?auto_612169 ) ) ( not ( = ?auto_612164 ?auto_612170 ) ) ( not ( = ?auto_612165 ?auto_612166 ) ) ( not ( = ?auto_612165 ?auto_612167 ) ) ( not ( = ?auto_612165 ?auto_612168 ) ) ( not ( = ?auto_612165 ?auto_612169 ) ) ( not ( = ?auto_612165 ?auto_612170 ) ) ( not ( = ?auto_612166 ?auto_612167 ) ) ( not ( = ?auto_612166 ?auto_612168 ) ) ( not ( = ?auto_612166 ?auto_612169 ) ) ( not ( = ?auto_612166 ?auto_612170 ) ) ( not ( = ?auto_612167 ?auto_612168 ) ) ( not ( = ?auto_612167 ?auto_612169 ) ) ( not ( = ?auto_612167 ?auto_612170 ) ) ( not ( = ?auto_612168 ?auto_612169 ) ) ( not ( = ?auto_612168 ?auto_612170 ) ) ( not ( = ?auto_612169 ?auto_612170 ) ) ( ON ?auto_612168 ?auto_612169 ) ( ON ?auto_612167 ?auto_612168 ) ( ON ?auto_612166 ?auto_612167 ) ( ON ?auto_612165 ?auto_612166 ) ( ON ?auto_612164 ?auto_612165 ) ( ON ?auto_612163 ?auto_612164 ) ( ON ?auto_612162 ?auto_612163 ) ( CLEAR ?auto_612160 ) ( ON ?auto_612161 ?auto_612162 ) ( CLEAR ?auto_612161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_612153 ?auto_612154 ?auto_612155 ?auto_612156 ?auto_612157 ?auto_612158 ?auto_612159 ?auto_612160 ?auto_612161 )
      ( MAKE-17PILE ?auto_612153 ?auto_612154 ?auto_612155 ?auto_612156 ?auto_612157 ?auto_612158 ?auto_612159 ?auto_612160 ?auto_612161 ?auto_612162 ?auto_612163 ?auto_612164 ?auto_612165 ?auto_612166 ?auto_612167 ?auto_612168 ?auto_612169 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612188 - BLOCK
      ?auto_612189 - BLOCK
      ?auto_612190 - BLOCK
      ?auto_612191 - BLOCK
      ?auto_612192 - BLOCK
      ?auto_612193 - BLOCK
      ?auto_612194 - BLOCK
      ?auto_612195 - BLOCK
      ?auto_612196 - BLOCK
      ?auto_612197 - BLOCK
      ?auto_612198 - BLOCK
      ?auto_612199 - BLOCK
      ?auto_612200 - BLOCK
      ?auto_612201 - BLOCK
      ?auto_612202 - BLOCK
      ?auto_612203 - BLOCK
      ?auto_612204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612204 ) ( ON-TABLE ?auto_612188 ) ( ON ?auto_612189 ?auto_612188 ) ( ON ?auto_612190 ?auto_612189 ) ( ON ?auto_612191 ?auto_612190 ) ( ON ?auto_612192 ?auto_612191 ) ( ON ?auto_612193 ?auto_612192 ) ( ON ?auto_612194 ?auto_612193 ) ( ON ?auto_612195 ?auto_612194 ) ( not ( = ?auto_612188 ?auto_612189 ) ) ( not ( = ?auto_612188 ?auto_612190 ) ) ( not ( = ?auto_612188 ?auto_612191 ) ) ( not ( = ?auto_612188 ?auto_612192 ) ) ( not ( = ?auto_612188 ?auto_612193 ) ) ( not ( = ?auto_612188 ?auto_612194 ) ) ( not ( = ?auto_612188 ?auto_612195 ) ) ( not ( = ?auto_612188 ?auto_612196 ) ) ( not ( = ?auto_612188 ?auto_612197 ) ) ( not ( = ?auto_612188 ?auto_612198 ) ) ( not ( = ?auto_612188 ?auto_612199 ) ) ( not ( = ?auto_612188 ?auto_612200 ) ) ( not ( = ?auto_612188 ?auto_612201 ) ) ( not ( = ?auto_612188 ?auto_612202 ) ) ( not ( = ?auto_612188 ?auto_612203 ) ) ( not ( = ?auto_612188 ?auto_612204 ) ) ( not ( = ?auto_612189 ?auto_612190 ) ) ( not ( = ?auto_612189 ?auto_612191 ) ) ( not ( = ?auto_612189 ?auto_612192 ) ) ( not ( = ?auto_612189 ?auto_612193 ) ) ( not ( = ?auto_612189 ?auto_612194 ) ) ( not ( = ?auto_612189 ?auto_612195 ) ) ( not ( = ?auto_612189 ?auto_612196 ) ) ( not ( = ?auto_612189 ?auto_612197 ) ) ( not ( = ?auto_612189 ?auto_612198 ) ) ( not ( = ?auto_612189 ?auto_612199 ) ) ( not ( = ?auto_612189 ?auto_612200 ) ) ( not ( = ?auto_612189 ?auto_612201 ) ) ( not ( = ?auto_612189 ?auto_612202 ) ) ( not ( = ?auto_612189 ?auto_612203 ) ) ( not ( = ?auto_612189 ?auto_612204 ) ) ( not ( = ?auto_612190 ?auto_612191 ) ) ( not ( = ?auto_612190 ?auto_612192 ) ) ( not ( = ?auto_612190 ?auto_612193 ) ) ( not ( = ?auto_612190 ?auto_612194 ) ) ( not ( = ?auto_612190 ?auto_612195 ) ) ( not ( = ?auto_612190 ?auto_612196 ) ) ( not ( = ?auto_612190 ?auto_612197 ) ) ( not ( = ?auto_612190 ?auto_612198 ) ) ( not ( = ?auto_612190 ?auto_612199 ) ) ( not ( = ?auto_612190 ?auto_612200 ) ) ( not ( = ?auto_612190 ?auto_612201 ) ) ( not ( = ?auto_612190 ?auto_612202 ) ) ( not ( = ?auto_612190 ?auto_612203 ) ) ( not ( = ?auto_612190 ?auto_612204 ) ) ( not ( = ?auto_612191 ?auto_612192 ) ) ( not ( = ?auto_612191 ?auto_612193 ) ) ( not ( = ?auto_612191 ?auto_612194 ) ) ( not ( = ?auto_612191 ?auto_612195 ) ) ( not ( = ?auto_612191 ?auto_612196 ) ) ( not ( = ?auto_612191 ?auto_612197 ) ) ( not ( = ?auto_612191 ?auto_612198 ) ) ( not ( = ?auto_612191 ?auto_612199 ) ) ( not ( = ?auto_612191 ?auto_612200 ) ) ( not ( = ?auto_612191 ?auto_612201 ) ) ( not ( = ?auto_612191 ?auto_612202 ) ) ( not ( = ?auto_612191 ?auto_612203 ) ) ( not ( = ?auto_612191 ?auto_612204 ) ) ( not ( = ?auto_612192 ?auto_612193 ) ) ( not ( = ?auto_612192 ?auto_612194 ) ) ( not ( = ?auto_612192 ?auto_612195 ) ) ( not ( = ?auto_612192 ?auto_612196 ) ) ( not ( = ?auto_612192 ?auto_612197 ) ) ( not ( = ?auto_612192 ?auto_612198 ) ) ( not ( = ?auto_612192 ?auto_612199 ) ) ( not ( = ?auto_612192 ?auto_612200 ) ) ( not ( = ?auto_612192 ?auto_612201 ) ) ( not ( = ?auto_612192 ?auto_612202 ) ) ( not ( = ?auto_612192 ?auto_612203 ) ) ( not ( = ?auto_612192 ?auto_612204 ) ) ( not ( = ?auto_612193 ?auto_612194 ) ) ( not ( = ?auto_612193 ?auto_612195 ) ) ( not ( = ?auto_612193 ?auto_612196 ) ) ( not ( = ?auto_612193 ?auto_612197 ) ) ( not ( = ?auto_612193 ?auto_612198 ) ) ( not ( = ?auto_612193 ?auto_612199 ) ) ( not ( = ?auto_612193 ?auto_612200 ) ) ( not ( = ?auto_612193 ?auto_612201 ) ) ( not ( = ?auto_612193 ?auto_612202 ) ) ( not ( = ?auto_612193 ?auto_612203 ) ) ( not ( = ?auto_612193 ?auto_612204 ) ) ( not ( = ?auto_612194 ?auto_612195 ) ) ( not ( = ?auto_612194 ?auto_612196 ) ) ( not ( = ?auto_612194 ?auto_612197 ) ) ( not ( = ?auto_612194 ?auto_612198 ) ) ( not ( = ?auto_612194 ?auto_612199 ) ) ( not ( = ?auto_612194 ?auto_612200 ) ) ( not ( = ?auto_612194 ?auto_612201 ) ) ( not ( = ?auto_612194 ?auto_612202 ) ) ( not ( = ?auto_612194 ?auto_612203 ) ) ( not ( = ?auto_612194 ?auto_612204 ) ) ( not ( = ?auto_612195 ?auto_612196 ) ) ( not ( = ?auto_612195 ?auto_612197 ) ) ( not ( = ?auto_612195 ?auto_612198 ) ) ( not ( = ?auto_612195 ?auto_612199 ) ) ( not ( = ?auto_612195 ?auto_612200 ) ) ( not ( = ?auto_612195 ?auto_612201 ) ) ( not ( = ?auto_612195 ?auto_612202 ) ) ( not ( = ?auto_612195 ?auto_612203 ) ) ( not ( = ?auto_612195 ?auto_612204 ) ) ( not ( = ?auto_612196 ?auto_612197 ) ) ( not ( = ?auto_612196 ?auto_612198 ) ) ( not ( = ?auto_612196 ?auto_612199 ) ) ( not ( = ?auto_612196 ?auto_612200 ) ) ( not ( = ?auto_612196 ?auto_612201 ) ) ( not ( = ?auto_612196 ?auto_612202 ) ) ( not ( = ?auto_612196 ?auto_612203 ) ) ( not ( = ?auto_612196 ?auto_612204 ) ) ( not ( = ?auto_612197 ?auto_612198 ) ) ( not ( = ?auto_612197 ?auto_612199 ) ) ( not ( = ?auto_612197 ?auto_612200 ) ) ( not ( = ?auto_612197 ?auto_612201 ) ) ( not ( = ?auto_612197 ?auto_612202 ) ) ( not ( = ?auto_612197 ?auto_612203 ) ) ( not ( = ?auto_612197 ?auto_612204 ) ) ( not ( = ?auto_612198 ?auto_612199 ) ) ( not ( = ?auto_612198 ?auto_612200 ) ) ( not ( = ?auto_612198 ?auto_612201 ) ) ( not ( = ?auto_612198 ?auto_612202 ) ) ( not ( = ?auto_612198 ?auto_612203 ) ) ( not ( = ?auto_612198 ?auto_612204 ) ) ( not ( = ?auto_612199 ?auto_612200 ) ) ( not ( = ?auto_612199 ?auto_612201 ) ) ( not ( = ?auto_612199 ?auto_612202 ) ) ( not ( = ?auto_612199 ?auto_612203 ) ) ( not ( = ?auto_612199 ?auto_612204 ) ) ( not ( = ?auto_612200 ?auto_612201 ) ) ( not ( = ?auto_612200 ?auto_612202 ) ) ( not ( = ?auto_612200 ?auto_612203 ) ) ( not ( = ?auto_612200 ?auto_612204 ) ) ( not ( = ?auto_612201 ?auto_612202 ) ) ( not ( = ?auto_612201 ?auto_612203 ) ) ( not ( = ?auto_612201 ?auto_612204 ) ) ( not ( = ?auto_612202 ?auto_612203 ) ) ( not ( = ?auto_612202 ?auto_612204 ) ) ( not ( = ?auto_612203 ?auto_612204 ) ) ( ON ?auto_612203 ?auto_612204 ) ( ON ?auto_612202 ?auto_612203 ) ( ON ?auto_612201 ?auto_612202 ) ( ON ?auto_612200 ?auto_612201 ) ( ON ?auto_612199 ?auto_612200 ) ( ON ?auto_612198 ?auto_612199 ) ( ON ?auto_612197 ?auto_612198 ) ( CLEAR ?auto_612195 ) ( ON ?auto_612196 ?auto_612197 ) ( CLEAR ?auto_612196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_612188 ?auto_612189 ?auto_612190 ?auto_612191 ?auto_612192 ?auto_612193 ?auto_612194 ?auto_612195 ?auto_612196 )
      ( MAKE-17PILE ?auto_612188 ?auto_612189 ?auto_612190 ?auto_612191 ?auto_612192 ?auto_612193 ?auto_612194 ?auto_612195 ?auto_612196 ?auto_612197 ?auto_612198 ?auto_612199 ?auto_612200 ?auto_612201 ?auto_612202 ?auto_612203 ?auto_612204 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612222 - BLOCK
      ?auto_612223 - BLOCK
      ?auto_612224 - BLOCK
      ?auto_612225 - BLOCK
      ?auto_612226 - BLOCK
      ?auto_612227 - BLOCK
      ?auto_612228 - BLOCK
      ?auto_612229 - BLOCK
      ?auto_612230 - BLOCK
      ?auto_612231 - BLOCK
      ?auto_612232 - BLOCK
      ?auto_612233 - BLOCK
      ?auto_612234 - BLOCK
      ?auto_612235 - BLOCK
      ?auto_612236 - BLOCK
      ?auto_612237 - BLOCK
      ?auto_612238 - BLOCK
    )
    :vars
    (
      ?auto_612239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612238 ?auto_612239 ) ( ON-TABLE ?auto_612222 ) ( ON ?auto_612223 ?auto_612222 ) ( ON ?auto_612224 ?auto_612223 ) ( ON ?auto_612225 ?auto_612224 ) ( ON ?auto_612226 ?auto_612225 ) ( ON ?auto_612227 ?auto_612226 ) ( ON ?auto_612228 ?auto_612227 ) ( not ( = ?auto_612222 ?auto_612223 ) ) ( not ( = ?auto_612222 ?auto_612224 ) ) ( not ( = ?auto_612222 ?auto_612225 ) ) ( not ( = ?auto_612222 ?auto_612226 ) ) ( not ( = ?auto_612222 ?auto_612227 ) ) ( not ( = ?auto_612222 ?auto_612228 ) ) ( not ( = ?auto_612222 ?auto_612229 ) ) ( not ( = ?auto_612222 ?auto_612230 ) ) ( not ( = ?auto_612222 ?auto_612231 ) ) ( not ( = ?auto_612222 ?auto_612232 ) ) ( not ( = ?auto_612222 ?auto_612233 ) ) ( not ( = ?auto_612222 ?auto_612234 ) ) ( not ( = ?auto_612222 ?auto_612235 ) ) ( not ( = ?auto_612222 ?auto_612236 ) ) ( not ( = ?auto_612222 ?auto_612237 ) ) ( not ( = ?auto_612222 ?auto_612238 ) ) ( not ( = ?auto_612222 ?auto_612239 ) ) ( not ( = ?auto_612223 ?auto_612224 ) ) ( not ( = ?auto_612223 ?auto_612225 ) ) ( not ( = ?auto_612223 ?auto_612226 ) ) ( not ( = ?auto_612223 ?auto_612227 ) ) ( not ( = ?auto_612223 ?auto_612228 ) ) ( not ( = ?auto_612223 ?auto_612229 ) ) ( not ( = ?auto_612223 ?auto_612230 ) ) ( not ( = ?auto_612223 ?auto_612231 ) ) ( not ( = ?auto_612223 ?auto_612232 ) ) ( not ( = ?auto_612223 ?auto_612233 ) ) ( not ( = ?auto_612223 ?auto_612234 ) ) ( not ( = ?auto_612223 ?auto_612235 ) ) ( not ( = ?auto_612223 ?auto_612236 ) ) ( not ( = ?auto_612223 ?auto_612237 ) ) ( not ( = ?auto_612223 ?auto_612238 ) ) ( not ( = ?auto_612223 ?auto_612239 ) ) ( not ( = ?auto_612224 ?auto_612225 ) ) ( not ( = ?auto_612224 ?auto_612226 ) ) ( not ( = ?auto_612224 ?auto_612227 ) ) ( not ( = ?auto_612224 ?auto_612228 ) ) ( not ( = ?auto_612224 ?auto_612229 ) ) ( not ( = ?auto_612224 ?auto_612230 ) ) ( not ( = ?auto_612224 ?auto_612231 ) ) ( not ( = ?auto_612224 ?auto_612232 ) ) ( not ( = ?auto_612224 ?auto_612233 ) ) ( not ( = ?auto_612224 ?auto_612234 ) ) ( not ( = ?auto_612224 ?auto_612235 ) ) ( not ( = ?auto_612224 ?auto_612236 ) ) ( not ( = ?auto_612224 ?auto_612237 ) ) ( not ( = ?auto_612224 ?auto_612238 ) ) ( not ( = ?auto_612224 ?auto_612239 ) ) ( not ( = ?auto_612225 ?auto_612226 ) ) ( not ( = ?auto_612225 ?auto_612227 ) ) ( not ( = ?auto_612225 ?auto_612228 ) ) ( not ( = ?auto_612225 ?auto_612229 ) ) ( not ( = ?auto_612225 ?auto_612230 ) ) ( not ( = ?auto_612225 ?auto_612231 ) ) ( not ( = ?auto_612225 ?auto_612232 ) ) ( not ( = ?auto_612225 ?auto_612233 ) ) ( not ( = ?auto_612225 ?auto_612234 ) ) ( not ( = ?auto_612225 ?auto_612235 ) ) ( not ( = ?auto_612225 ?auto_612236 ) ) ( not ( = ?auto_612225 ?auto_612237 ) ) ( not ( = ?auto_612225 ?auto_612238 ) ) ( not ( = ?auto_612225 ?auto_612239 ) ) ( not ( = ?auto_612226 ?auto_612227 ) ) ( not ( = ?auto_612226 ?auto_612228 ) ) ( not ( = ?auto_612226 ?auto_612229 ) ) ( not ( = ?auto_612226 ?auto_612230 ) ) ( not ( = ?auto_612226 ?auto_612231 ) ) ( not ( = ?auto_612226 ?auto_612232 ) ) ( not ( = ?auto_612226 ?auto_612233 ) ) ( not ( = ?auto_612226 ?auto_612234 ) ) ( not ( = ?auto_612226 ?auto_612235 ) ) ( not ( = ?auto_612226 ?auto_612236 ) ) ( not ( = ?auto_612226 ?auto_612237 ) ) ( not ( = ?auto_612226 ?auto_612238 ) ) ( not ( = ?auto_612226 ?auto_612239 ) ) ( not ( = ?auto_612227 ?auto_612228 ) ) ( not ( = ?auto_612227 ?auto_612229 ) ) ( not ( = ?auto_612227 ?auto_612230 ) ) ( not ( = ?auto_612227 ?auto_612231 ) ) ( not ( = ?auto_612227 ?auto_612232 ) ) ( not ( = ?auto_612227 ?auto_612233 ) ) ( not ( = ?auto_612227 ?auto_612234 ) ) ( not ( = ?auto_612227 ?auto_612235 ) ) ( not ( = ?auto_612227 ?auto_612236 ) ) ( not ( = ?auto_612227 ?auto_612237 ) ) ( not ( = ?auto_612227 ?auto_612238 ) ) ( not ( = ?auto_612227 ?auto_612239 ) ) ( not ( = ?auto_612228 ?auto_612229 ) ) ( not ( = ?auto_612228 ?auto_612230 ) ) ( not ( = ?auto_612228 ?auto_612231 ) ) ( not ( = ?auto_612228 ?auto_612232 ) ) ( not ( = ?auto_612228 ?auto_612233 ) ) ( not ( = ?auto_612228 ?auto_612234 ) ) ( not ( = ?auto_612228 ?auto_612235 ) ) ( not ( = ?auto_612228 ?auto_612236 ) ) ( not ( = ?auto_612228 ?auto_612237 ) ) ( not ( = ?auto_612228 ?auto_612238 ) ) ( not ( = ?auto_612228 ?auto_612239 ) ) ( not ( = ?auto_612229 ?auto_612230 ) ) ( not ( = ?auto_612229 ?auto_612231 ) ) ( not ( = ?auto_612229 ?auto_612232 ) ) ( not ( = ?auto_612229 ?auto_612233 ) ) ( not ( = ?auto_612229 ?auto_612234 ) ) ( not ( = ?auto_612229 ?auto_612235 ) ) ( not ( = ?auto_612229 ?auto_612236 ) ) ( not ( = ?auto_612229 ?auto_612237 ) ) ( not ( = ?auto_612229 ?auto_612238 ) ) ( not ( = ?auto_612229 ?auto_612239 ) ) ( not ( = ?auto_612230 ?auto_612231 ) ) ( not ( = ?auto_612230 ?auto_612232 ) ) ( not ( = ?auto_612230 ?auto_612233 ) ) ( not ( = ?auto_612230 ?auto_612234 ) ) ( not ( = ?auto_612230 ?auto_612235 ) ) ( not ( = ?auto_612230 ?auto_612236 ) ) ( not ( = ?auto_612230 ?auto_612237 ) ) ( not ( = ?auto_612230 ?auto_612238 ) ) ( not ( = ?auto_612230 ?auto_612239 ) ) ( not ( = ?auto_612231 ?auto_612232 ) ) ( not ( = ?auto_612231 ?auto_612233 ) ) ( not ( = ?auto_612231 ?auto_612234 ) ) ( not ( = ?auto_612231 ?auto_612235 ) ) ( not ( = ?auto_612231 ?auto_612236 ) ) ( not ( = ?auto_612231 ?auto_612237 ) ) ( not ( = ?auto_612231 ?auto_612238 ) ) ( not ( = ?auto_612231 ?auto_612239 ) ) ( not ( = ?auto_612232 ?auto_612233 ) ) ( not ( = ?auto_612232 ?auto_612234 ) ) ( not ( = ?auto_612232 ?auto_612235 ) ) ( not ( = ?auto_612232 ?auto_612236 ) ) ( not ( = ?auto_612232 ?auto_612237 ) ) ( not ( = ?auto_612232 ?auto_612238 ) ) ( not ( = ?auto_612232 ?auto_612239 ) ) ( not ( = ?auto_612233 ?auto_612234 ) ) ( not ( = ?auto_612233 ?auto_612235 ) ) ( not ( = ?auto_612233 ?auto_612236 ) ) ( not ( = ?auto_612233 ?auto_612237 ) ) ( not ( = ?auto_612233 ?auto_612238 ) ) ( not ( = ?auto_612233 ?auto_612239 ) ) ( not ( = ?auto_612234 ?auto_612235 ) ) ( not ( = ?auto_612234 ?auto_612236 ) ) ( not ( = ?auto_612234 ?auto_612237 ) ) ( not ( = ?auto_612234 ?auto_612238 ) ) ( not ( = ?auto_612234 ?auto_612239 ) ) ( not ( = ?auto_612235 ?auto_612236 ) ) ( not ( = ?auto_612235 ?auto_612237 ) ) ( not ( = ?auto_612235 ?auto_612238 ) ) ( not ( = ?auto_612235 ?auto_612239 ) ) ( not ( = ?auto_612236 ?auto_612237 ) ) ( not ( = ?auto_612236 ?auto_612238 ) ) ( not ( = ?auto_612236 ?auto_612239 ) ) ( not ( = ?auto_612237 ?auto_612238 ) ) ( not ( = ?auto_612237 ?auto_612239 ) ) ( not ( = ?auto_612238 ?auto_612239 ) ) ( ON ?auto_612237 ?auto_612238 ) ( ON ?auto_612236 ?auto_612237 ) ( ON ?auto_612235 ?auto_612236 ) ( ON ?auto_612234 ?auto_612235 ) ( ON ?auto_612233 ?auto_612234 ) ( ON ?auto_612232 ?auto_612233 ) ( ON ?auto_612231 ?auto_612232 ) ( ON ?auto_612230 ?auto_612231 ) ( CLEAR ?auto_612228 ) ( ON ?auto_612229 ?auto_612230 ) ( CLEAR ?auto_612229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_612222 ?auto_612223 ?auto_612224 ?auto_612225 ?auto_612226 ?auto_612227 ?auto_612228 ?auto_612229 )
      ( MAKE-17PILE ?auto_612222 ?auto_612223 ?auto_612224 ?auto_612225 ?auto_612226 ?auto_612227 ?auto_612228 ?auto_612229 ?auto_612230 ?auto_612231 ?auto_612232 ?auto_612233 ?auto_612234 ?auto_612235 ?auto_612236 ?auto_612237 ?auto_612238 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612257 - BLOCK
      ?auto_612258 - BLOCK
      ?auto_612259 - BLOCK
      ?auto_612260 - BLOCK
      ?auto_612261 - BLOCK
      ?auto_612262 - BLOCK
      ?auto_612263 - BLOCK
      ?auto_612264 - BLOCK
      ?auto_612265 - BLOCK
      ?auto_612266 - BLOCK
      ?auto_612267 - BLOCK
      ?auto_612268 - BLOCK
      ?auto_612269 - BLOCK
      ?auto_612270 - BLOCK
      ?auto_612271 - BLOCK
      ?auto_612272 - BLOCK
      ?auto_612273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612273 ) ( ON-TABLE ?auto_612257 ) ( ON ?auto_612258 ?auto_612257 ) ( ON ?auto_612259 ?auto_612258 ) ( ON ?auto_612260 ?auto_612259 ) ( ON ?auto_612261 ?auto_612260 ) ( ON ?auto_612262 ?auto_612261 ) ( ON ?auto_612263 ?auto_612262 ) ( not ( = ?auto_612257 ?auto_612258 ) ) ( not ( = ?auto_612257 ?auto_612259 ) ) ( not ( = ?auto_612257 ?auto_612260 ) ) ( not ( = ?auto_612257 ?auto_612261 ) ) ( not ( = ?auto_612257 ?auto_612262 ) ) ( not ( = ?auto_612257 ?auto_612263 ) ) ( not ( = ?auto_612257 ?auto_612264 ) ) ( not ( = ?auto_612257 ?auto_612265 ) ) ( not ( = ?auto_612257 ?auto_612266 ) ) ( not ( = ?auto_612257 ?auto_612267 ) ) ( not ( = ?auto_612257 ?auto_612268 ) ) ( not ( = ?auto_612257 ?auto_612269 ) ) ( not ( = ?auto_612257 ?auto_612270 ) ) ( not ( = ?auto_612257 ?auto_612271 ) ) ( not ( = ?auto_612257 ?auto_612272 ) ) ( not ( = ?auto_612257 ?auto_612273 ) ) ( not ( = ?auto_612258 ?auto_612259 ) ) ( not ( = ?auto_612258 ?auto_612260 ) ) ( not ( = ?auto_612258 ?auto_612261 ) ) ( not ( = ?auto_612258 ?auto_612262 ) ) ( not ( = ?auto_612258 ?auto_612263 ) ) ( not ( = ?auto_612258 ?auto_612264 ) ) ( not ( = ?auto_612258 ?auto_612265 ) ) ( not ( = ?auto_612258 ?auto_612266 ) ) ( not ( = ?auto_612258 ?auto_612267 ) ) ( not ( = ?auto_612258 ?auto_612268 ) ) ( not ( = ?auto_612258 ?auto_612269 ) ) ( not ( = ?auto_612258 ?auto_612270 ) ) ( not ( = ?auto_612258 ?auto_612271 ) ) ( not ( = ?auto_612258 ?auto_612272 ) ) ( not ( = ?auto_612258 ?auto_612273 ) ) ( not ( = ?auto_612259 ?auto_612260 ) ) ( not ( = ?auto_612259 ?auto_612261 ) ) ( not ( = ?auto_612259 ?auto_612262 ) ) ( not ( = ?auto_612259 ?auto_612263 ) ) ( not ( = ?auto_612259 ?auto_612264 ) ) ( not ( = ?auto_612259 ?auto_612265 ) ) ( not ( = ?auto_612259 ?auto_612266 ) ) ( not ( = ?auto_612259 ?auto_612267 ) ) ( not ( = ?auto_612259 ?auto_612268 ) ) ( not ( = ?auto_612259 ?auto_612269 ) ) ( not ( = ?auto_612259 ?auto_612270 ) ) ( not ( = ?auto_612259 ?auto_612271 ) ) ( not ( = ?auto_612259 ?auto_612272 ) ) ( not ( = ?auto_612259 ?auto_612273 ) ) ( not ( = ?auto_612260 ?auto_612261 ) ) ( not ( = ?auto_612260 ?auto_612262 ) ) ( not ( = ?auto_612260 ?auto_612263 ) ) ( not ( = ?auto_612260 ?auto_612264 ) ) ( not ( = ?auto_612260 ?auto_612265 ) ) ( not ( = ?auto_612260 ?auto_612266 ) ) ( not ( = ?auto_612260 ?auto_612267 ) ) ( not ( = ?auto_612260 ?auto_612268 ) ) ( not ( = ?auto_612260 ?auto_612269 ) ) ( not ( = ?auto_612260 ?auto_612270 ) ) ( not ( = ?auto_612260 ?auto_612271 ) ) ( not ( = ?auto_612260 ?auto_612272 ) ) ( not ( = ?auto_612260 ?auto_612273 ) ) ( not ( = ?auto_612261 ?auto_612262 ) ) ( not ( = ?auto_612261 ?auto_612263 ) ) ( not ( = ?auto_612261 ?auto_612264 ) ) ( not ( = ?auto_612261 ?auto_612265 ) ) ( not ( = ?auto_612261 ?auto_612266 ) ) ( not ( = ?auto_612261 ?auto_612267 ) ) ( not ( = ?auto_612261 ?auto_612268 ) ) ( not ( = ?auto_612261 ?auto_612269 ) ) ( not ( = ?auto_612261 ?auto_612270 ) ) ( not ( = ?auto_612261 ?auto_612271 ) ) ( not ( = ?auto_612261 ?auto_612272 ) ) ( not ( = ?auto_612261 ?auto_612273 ) ) ( not ( = ?auto_612262 ?auto_612263 ) ) ( not ( = ?auto_612262 ?auto_612264 ) ) ( not ( = ?auto_612262 ?auto_612265 ) ) ( not ( = ?auto_612262 ?auto_612266 ) ) ( not ( = ?auto_612262 ?auto_612267 ) ) ( not ( = ?auto_612262 ?auto_612268 ) ) ( not ( = ?auto_612262 ?auto_612269 ) ) ( not ( = ?auto_612262 ?auto_612270 ) ) ( not ( = ?auto_612262 ?auto_612271 ) ) ( not ( = ?auto_612262 ?auto_612272 ) ) ( not ( = ?auto_612262 ?auto_612273 ) ) ( not ( = ?auto_612263 ?auto_612264 ) ) ( not ( = ?auto_612263 ?auto_612265 ) ) ( not ( = ?auto_612263 ?auto_612266 ) ) ( not ( = ?auto_612263 ?auto_612267 ) ) ( not ( = ?auto_612263 ?auto_612268 ) ) ( not ( = ?auto_612263 ?auto_612269 ) ) ( not ( = ?auto_612263 ?auto_612270 ) ) ( not ( = ?auto_612263 ?auto_612271 ) ) ( not ( = ?auto_612263 ?auto_612272 ) ) ( not ( = ?auto_612263 ?auto_612273 ) ) ( not ( = ?auto_612264 ?auto_612265 ) ) ( not ( = ?auto_612264 ?auto_612266 ) ) ( not ( = ?auto_612264 ?auto_612267 ) ) ( not ( = ?auto_612264 ?auto_612268 ) ) ( not ( = ?auto_612264 ?auto_612269 ) ) ( not ( = ?auto_612264 ?auto_612270 ) ) ( not ( = ?auto_612264 ?auto_612271 ) ) ( not ( = ?auto_612264 ?auto_612272 ) ) ( not ( = ?auto_612264 ?auto_612273 ) ) ( not ( = ?auto_612265 ?auto_612266 ) ) ( not ( = ?auto_612265 ?auto_612267 ) ) ( not ( = ?auto_612265 ?auto_612268 ) ) ( not ( = ?auto_612265 ?auto_612269 ) ) ( not ( = ?auto_612265 ?auto_612270 ) ) ( not ( = ?auto_612265 ?auto_612271 ) ) ( not ( = ?auto_612265 ?auto_612272 ) ) ( not ( = ?auto_612265 ?auto_612273 ) ) ( not ( = ?auto_612266 ?auto_612267 ) ) ( not ( = ?auto_612266 ?auto_612268 ) ) ( not ( = ?auto_612266 ?auto_612269 ) ) ( not ( = ?auto_612266 ?auto_612270 ) ) ( not ( = ?auto_612266 ?auto_612271 ) ) ( not ( = ?auto_612266 ?auto_612272 ) ) ( not ( = ?auto_612266 ?auto_612273 ) ) ( not ( = ?auto_612267 ?auto_612268 ) ) ( not ( = ?auto_612267 ?auto_612269 ) ) ( not ( = ?auto_612267 ?auto_612270 ) ) ( not ( = ?auto_612267 ?auto_612271 ) ) ( not ( = ?auto_612267 ?auto_612272 ) ) ( not ( = ?auto_612267 ?auto_612273 ) ) ( not ( = ?auto_612268 ?auto_612269 ) ) ( not ( = ?auto_612268 ?auto_612270 ) ) ( not ( = ?auto_612268 ?auto_612271 ) ) ( not ( = ?auto_612268 ?auto_612272 ) ) ( not ( = ?auto_612268 ?auto_612273 ) ) ( not ( = ?auto_612269 ?auto_612270 ) ) ( not ( = ?auto_612269 ?auto_612271 ) ) ( not ( = ?auto_612269 ?auto_612272 ) ) ( not ( = ?auto_612269 ?auto_612273 ) ) ( not ( = ?auto_612270 ?auto_612271 ) ) ( not ( = ?auto_612270 ?auto_612272 ) ) ( not ( = ?auto_612270 ?auto_612273 ) ) ( not ( = ?auto_612271 ?auto_612272 ) ) ( not ( = ?auto_612271 ?auto_612273 ) ) ( not ( = ?auto_612272 ?auto_612273 ) ) ( ON ?auto_612272 ?auto_612273 ) ( ON ?auto_612271 ?auto_612272 ) ( ON ?auto_612270 ?auto_612271 ) ( ON ?auto_612269 ?auto_612270 ) ( ON ?auto_612268 ?auto_612269 ) ( ON ?auto_612267 ?auto_612268 ) ( ON ?auto_612266 ?auto_612267 ) ( ON ?auto_612265 ?auto_612266 ) ( CLEAR ?auto_612263 ) ( ON ?auto_612264 ?auto_612265 ) ( CLEAR ?auto_612264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_612257 ?auto_612258 ?auto_612259 ?auto_612260 ?auto_612261 ?auto_612262 ?auto_612263 ?auto_612264 )
      ( MAKE-17PILE ?auto_612257 ?auto_612258 ?auto_612259 ?auto_612260 ?auto_612261 ?auto_612262 ?auto_612263 ?auto_612264 ?auto_612265 ?auto_612266 ?auto_612267 ?auto_612268 ?auto_612269 ?auto_612270 ?auto_612271 ?auto_612272 ?auto_612273 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612291 - BLOCK
      ?auto_612292 - BLOCK
      ?auto_612293 - BLOCK
      ?auto_612294 - BLOCK
      ?auto_612295 - BLOCK
      ?auto_612296 - BLOCK
      ?auto_612297 - BLOCK
      ?auto_612298 - BLOCK
      ?auto_612299 - BLOCK
      ?auto_612300 - BLOCK
      ?auto_612301 - BLOCK
      ?auto_612302 - BLOCK
      ?auto_612303 - BLOCK
      ?auto_612304 - BLOCK
      ?auto_612305 - BLOCK
      ?auto_612306 - BLOCK
      ?auto_612307 - BLOCK
    )
    :vars
    (
      ?auto_612308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612307 ?auto_612308 ) ( ON-TABLE ?auto_612291 ) ( ON ?auto_612292 ?auto_612291 ) ( ON ?auto_612293 ?auto_612292 ) ( ON ?auto_612294 ?auto_612293 ) ( ON ?auto_612295 ?auto_612294 ) ( ON ?auto_612296 ?auto_612295 ) ( not ( = ?auto_612291 ?auto_612292 ) ) ( not ( = ?auto_612291 ?auto_612293 ) ) ( not ( = ?auto_612291 ?auto_612294 ) ) ( not ( = ?auto_612291 ?auto_612295 ) ) ( not ( = ?auto_612291 ?auto_612296 ) ) ( not ( = ?auto_612291 ?auto_612297 ) ) ( not ( = ?auto_612291 ?auto_612298 ) ) ( not ( = ?auto_612291 ?auto_612299 ) ) ( not ( = ?auto_612291 ?auto_612300 ) ) ( not ( = ?auto_612291 ?auto_612301 ) ) ( not ( = ?auto_612291 ?auto_612302 ) ) ( not ( = ?auto_612291 ?auto_612303 ) ) ( not ( = ?auto_612291 ?auto_612304 ) ) ( not ( = ?auto_612291 ?auto_612305 ) ) ( not ( = ?auto_612291 ?auto_612306 ) ) ( not ( = ?auto_612291 ?auto_612307 ) ) ( not ( = ?auto_612291 ?auto_612308 ) ) ( not ( = ?auto_612292 ?auto_612293 ) ) ( not ( = ?auto_612292 ?auto_612294 ) ) ( not ( = ?auto_612292 ?auto_612295 ) ) ( not ( = ?auto_612292 ?auto_612296 ) ) ( not ( = ?auto_612292 ?auto_612297 ) ) ( not ( = ?auto_612292 ?auto_612298 ) ) ( not ( = ?auto_612292 ?auto_612299 ) ) ( not ( = ?auto_612292 ?auto_612300 ) ) ( not ( = ?auto_612292 ?auto_612301 ) ) ( not ( = ?auto_612292 ?auto_612302 ) ) ( not ( = ?auto_612292 ?auto_612303 ) ) ( not ( = ?auto_612292 ?auto_612304 ) ) ( not ( = ?auto_612292 ?auto_612305 ) ) ( not ( = ?auto_612292 ?auto_612306 ) ) ( not ( = ?auto_612292 ?auto_612307 ) ) ( not ( = ?auto_612292 ?auto_612308 ) ) ( not ( = ?auto_612293 ?auto_612294 ) ) ( not ( = ?auto_612293 ?auto_612295 ) ) ( not ( = ?auto_612293 ?auto_612296 ) ) ( not ( = ?auto_612293 ?auto_612297 ) ) ( not ( = ?auto_612293 ?auto_612298 ) ) ( not ( = ?auto_612293 ?auto_612299 ) ) ( not ( = ?auto_612293 ?auto_612300 ) ) ( not ( = ?auto_612293 ?auto_612301 ) ) ( not ( = ?auto_612293 ?auto_612302 ) ) ( not ( = ?auto_612293 ?auto_612303 ) ) ( not ( = ?auto_612293 ?auto_612304 ) ) ( not ( = ?auto_612293 ?auto_612305 ) ) ( not ( = ?auto_612293 ?auto_612306 ) ) ( not ( = ?auto_612293 ?auto_612307 ) ) ( not ( = ?auto_612293 ?auto_612308 ) ) ( not ( = ?auto_612294 ?auto_612295 ) ) ( not ( = ?auto_612294 ?auto_612296 ) ) ( not ( = ?auto_612294 ?auto_612297 ) ) ( not ( = ?auto_612294 ?auto_612298 ) ) ( not ( = ?auto_612294 ?auto_612299 ) ) ( not ( = ?auto_612294 ?auto_612300 ) ) ( not ( = ?auto_612294 ?auto_612301 ) ) ( not ( = ?auto_612294 ?auto_612302 ) ) ( not ( = ?auto_612294 ?auto_612303 ) ) ( not ( = ?auto_612294 ?auto_612304 ) ) ( not ( = ?auto_612294 ?auto_612305 ) ) ( not ( = ?auto_612294 ?auto_612306 ) ) ( not ( = ?auto_612294 ?auto_612307 ) ) ( not ( = ?auto_612294 ?auto_612308 ) ) ( not ( = ?auto_612295 ?auto_612296 ) ) ( not ( = ?auto_612295 ?auto_612297 ) ) ( not ( = ?auto_612295 ?auto_612298 ) ) ( not ( = ?auto_612295 ?auto_612299 ) ) ( not ( = ?auto_612295 ?auto_612300 ) ) ( not ( = ?auto_612295 ?auto_612301 ) ) ( not ( = ?auto_612295 ?auto_612302 ) ) ( not ( = ?auto_612295 ?auto_612303 ) ) ( not ( = ?auto_612295 ?auto_612304 ) ) ( not ( = ?auto_612295 ?auto_612305 ) ) ( not ( = ?auto_612295 ?auto_612306 ) ) ( not ( = ?auto_612295 ?auto_612307 ) ) ( not ( = ?auto_612295 ?auto_612308 ) ) ( not ( = ?auto_612296 ?auto_612297 ) ) ( not ( = ?auto_612296 ?auto_612298 ) ) ( not ( = ?auto_612296 ?auto_612299 ) ) ( not ( = ?auto_612296 ?auto_612300 ) ) ( not ( = ?auto_612296 ?auto_612301 ) ) ( not ( = ?auto_612296 ?auto_612302 ) ) ( not ( = ?auto_612296 ?auto_612303 ) ) ( not ( = ?auto_612296 ?auto_612304 ) ) ( not ( = ?auto_612296 ?auto_612305 ) ) ( not ( = ?auto_612296 ?auto_612306 ) ) ( not ( = ?auto_612296 ?auto_612307 ) ) ( not ( = ?auto_612296 ?auto_612308 ) ) ( not ( = ?auto_612297 ?auto_612298 ) ) ( not ( = ?auto_612297 ?auto_612299 ) ) ( not ( = ?auto_612297 ?auto_612300 ) ) ( not ( = ?auto_612297 ?auto_612301 ) ) ( not ( = ?auto_612297 ?auto_612302 ) ) ( not ( = ?auto_612297 ?auto_612303 ) ) ( not ( = ?auto_612297 ?auto_612304 ) ) ( not ( = ?auto_612297 ?auto_612305 ) ) ( not ( = ?auto_612297 ?auto_612306 ) ) ( not ( = ?auto_612297 ?auto_612307 ) ) ( not ( = ?auto_612297 ?auto_612308 ) ) ( not ( = ?auto_612298 ?auto_612299 ) ) ( not ( = ?auto_612298 ?auto_612300 ) ) ( not ( = ?auto_612298 ?auto_612301 ) ) ( not ( = ?auto_612298 ?auto_612302 ) ) ( not ( = ?auto_612298 ?auto_612303 ) ) ( not ( = ?auto_612298 ?auto_612304 ) ) ( not ( = ?auto_612298 ?auto_612305 ) ) ( not ( = ?auto_612298 ?auto_612306 ) ) ( not ( = ?auto_612298 ?auto_612307 ) ) ( not ( = ?auto_612298 ?auto_612308 ) ) ( not ( = ?auto_612299 ?auto_612300 ) ) ( not ( = ?auto_612299 ?auto_612301 ) ) ( not ( = ?auto_612299 ?auto_612302 ) ) ( not ( = ?auto_612299 ?auto_612303 ) ) ( not ( = ?auto_612299 ?auto_612304 ) ) ( not ( = ?auto_612299 ?auto_612305 ) ) ( not ( = ?auto_612299 ?auto_612306 ) ) ( not ( = ?auto_612299 ?auto_612307 ) ) ( not ( = ?auto_612299 ?auto_612308 ) ) ( not ( = ?auto_612300 ?auto_612301 ) ) ( not ( = ?auto_612300 ?auto_612302 ) ) ( not ( = ?auto_612300 ?auto_612303 ) ) ( not ( = ?auto_612300 ?auto_612304 ) ) ( not ( = ?auto_612300 ?auto_612305 ) ) ( not ( = ?auto_612300 ?auto_612306 ) ) ( not ( = ?auto_612300 ?auto_612307 ) ) ( not ( = ?auto_612300 ?auto_612308 ) ) ( not ( = ?auto_612301 ?auto_612302 ) ) ( not ( = ?auto_612301 ?auto_612303 ) ) ( not ( = ?auto_612301 ?auto_612304 ) ) ( not ( = ?auto_612301 ?auto_612305 ) ) ( not ( = ?auto_612301 ?auto_612306 ) ) ( not ( = ?auto_612301 ?auto_612307 ) ) ( not ( = ?auto_612301 ?auto_612308 ) ) ( not ( = ?auto_612302 ?auto_612303 ) ) ( not ( = ?auto_612302 ?auto_612304 ) ) ( not ( = ?auto_612302 ?auto_612305 ) ) ( not ( = ?auto_612302 ?auto_612306 ) ) ( not ( = ?auto_612302 ?auto_612307 ) ) ( not ( = ?auto_612302 ?auto_612308 ) ) ( not ( = ?auto_612303 ?auto_612304 ) ) ( not ( = ?auto_612303 ?auto_612305 ) ) ( not ( = ?auto_612303 ?auto_612306 ) ) ( not ( = ?auto_612303 ?auto_612307 ) ) ( not ( = ?auto_612303 ?auto_612308 ) ) ( not ( = ?auto_612304 ?auto_612305 ) ) ( not ( = ?auto_612304 ?auto_612306 ) ) ( not ( = ?auto_612304 ?auto_612307 ) ) ( not ( = ?auto_612304 ?auto_612308 ) ) ( not ( = ?auto_612305 ?auto_612306 ) ) ( not ( = ?auto_612305 ?auto_612307 ) ) ( not ( = ?auto_612305 ?auto_612308 ) ) ( not ( = ?auto_612306 ?auto_612307 ) ) ( not ( = ?auto_612306 ?auto_612308 ) ) ( not ( = ?auto_612307 ?auto_612308 ) ) ( ON ?auto_612306 ?auto_612307 ) ( ON ?auto_612305 ?auto_612306 ) ( ON ?auto_612304 ?auto_612305 ) ( ON ?auto_612303 ?auto_612304 ) ( ON ?auto_612302 ?auto_612303 ) ( ON ?auto_612301 ?auto_612302 ) ( ON ?auto_612300 ?auto_612301 ) ( ON ?auto_612299 ?auto_612300 ) ( ON ?auto_612298 ?auto_612299 ) ( CLEAR ?auto_612296 ) ( ON ?auto_612297 ?auto_612298 ) ( CLEAR ?auto_612297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_612291 ?auto_612292 ?auto_612293 ?auto_612294 ?auto_612295 ?auto_612296 ?auto_612297 )
      ( MAKE-17PILE ?auto_612291 ?auto_612292 ?auto_612293 ?auto_612294 ?auto_612295 ?auto_612296 ?auto_612297 ?auto_612298 ?auto_612299 ?auto_612300 ?auto_612301 ?auto_612302 ?auto_612303 ?auto_612304 ?auto_612305 ?auto_612306 ?auto_612307 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612326 - BLOCK
      ?auto_612327 - BLOCK
      ?auto_612328 - BLOCK
      ?auto_612329 - BLOCK
      ?auto_612330 - BLOCK
      ?auto_612331 - BLOCK
      ?auto_612332 - BLOCK
      ?auto_612333 - BLOCK
      ?auto_612334 - BLOCK
      ?auto_612335 - BLOCK
      ?auto_612336 - BLOCK
      ?auto_612337 - BLOCK
      ?auto_612338 - BLOCK
      ?auto_612339 - BLOCK
      ?auto_612340 - BLOCK
      ?auto_612341 - BLOCK
      ?auto_612342 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612342 ) ( ON-TABLE ?auto_612326 ) ( ON ?auto_612327 ?auto_612326 ) ( ON ?auto_612328 ?auto_612327 ) ( ON ?auto_612329 ?auto_612328 ) ( ON ?auto_612330 ?auto_612329 ) ( ON ?auto_612331 ?auto_612330 ) ( not ( = ?auto_612326 ?auto_612327 ) ) ( not ( = ?auto_612326 ?auto_612328 ) ) ( not ( = ?auto_612326 ?auto_612329 ) ) ( not ( = ?auto_612326 ?auto_612330 ) ) ( not ( = ?auto_612326 ?auto_612331 ) ) ( not ( = ?auto_612326 ?auto_612332 ) ) ( not ( = ?auto_612326 ?auto_612333 ) ) ( not ( = ?auto_612326 ?auto_612334 ) ) ( not ( = ?auto_612326 ?auto_612335 ) ) ( not ( = ?auto_612326 ?auto_612336 ) ) ( not ( = ?auto_612326 ?auto_612337 ) ) ( not ( = ?auto_612326 ?auto_612338 ) ) ( not ( = ?auto_612326 ?auto_612339 ) ) ( not ( = ?auto_612326 ?auto_612340 ) ) ( not ( = ?auto_612326 ?auto_612341 ) ) ( not ( = ?auto_612326 ?auto_612342 ) ) ( not ( = ?auto_612327 ?auto_612328 ) ) ( not ( = ?auto_612327 ?auto_612329 ) ) ( not ( = ?auto_612327 ?auto_612330 ) ) ( not ( = ?auto_612327 ?auto_612331 ) ) ( not ( = ?auto_612327 ?auto_612332 ) ) ( not ( = ?auto_612327 ?auto_612333 ) ) ( not ( = ?auto_612327 ?auto_612334 ) ) ( not ( = ?auto_612327 ?auto_612335 ) ) ( not ( = ?auto_612327 ?auto_612336 ) ) ( not ( = ?auto_612327 ?auto_612337 ) ) ( not ( = ?auto_612327 ?auto_612338 ) ) ( not ( = ?auto_612327 ?auto_612339 ) ) ( not ( = ?auto_612327 ?auto_612340 ) ) ( not ( = ?auto_612327 ?auto_612341 ) ) ( not ( = ?auto_612327 ?auto_612342 ) ) ( not ( = ?auto_612328 ?auto_612329 ) ) ( not ( = ?auto_612328 ?auto_612330 ) ) ( not ( = ?auto_612328 ?auto_612331 ) ) ( not ( = ?auto_612328 ?auto_612332 ) ) ( not ( = ?auto_612328 ?auto_612333 ) ) ( not ( = ?auto_612328 ?auto_612334 ) ) ( not ( = ?auto_612328 ?auto_612335 ) ) ( not ( = ?auto_612328 ?auto_612336 ) ) ( not ( = ?auto_612328 ?auto_612337 ) ) ( not ( = ?auto_612328 ?auto_612338 ) ) ( not ( = ?auto_612328 ?auto_612339 ) ) ( not ( = ?auto_612328 ?auto_612340 ) ) ( not ( = ?auto_612328 ?auto_612341 ) ) ( not ( = ?auto_612328 ?auto_612342 ) ) ( not ( = ?auto_612329 ?auto_612330 ) ) ( not ( = ?auto_612329 ?auto_612331 ) ) ( not ( = ?auto_612329 ?auto_612332 ) ) ( not ( = ?auto_612329 ?auto_612333 ) ) ( not ( = ?auto_612329 ?auto_612334 ) ) ( not ( = ?auto_612329 ?auto_612335 ) ) ( not ( = ?auto_612329 ?auto_612336 ) ) ( not ( = ?auto_612329 ?auto_612337 ) ) ( not ( = ?auto_612329 ?auto_612338 ) ) ( not ( = ?auto_612329 ?auto_612339 ) ) ( not ( = ?auto_612329 ?auto_612340 ) ) ( not ( = ?auto_612329 ?auto_612341 ) ) ( not ( = ?auto_612329 ?auto_612342 ) ) ( not ( = ?auto_612330 ?auto_612331 ) ) ( not ( = ?auto_612330 ?auto_612332 ) ) ( not ( = ?auto_612330 ?auto_612333 ) ) ( not ( = ?auto_612330 ?auto_612334 ) ) ( not ( = ?auto_612330 ?auto_612335 ) ) ( not ( = ?auto_612330 ?auto_612336 ) ) ( not ( = ?auto_612330 ?auto_612337 ) ) ( not ( = ?auto_612330 ?auto_612338 ) ) ( not ( = ?auto_612330 ?auto_612339 ) ) ( not ( = ?auto_612330 ?auto_612340 ) ) ( not ( = ?auto_612330 ?auto_612341 ) ) ( not ( = ?auto_612330 ?auto_612342 ) ) ( not ( = ?auto_612331 ?auto_612332 ) ) ( not ( = ?auto_612331 ?auto_612333 ) ) ( not ( = ?auto_612331 ?auto_612334 ) ) ( not ( = ?auto_612331 ?auto_612335 ) ) ( not ( = ?auto_612331 ?auto_612336 ) ) ( not ( = ?auto_612331 ?auto_612337 ) ) ( not ( = ?auto_612331 ?auto_612338 ) ) ( not ( = ?auto_612331 ?auto_612339 ) ) ( not ( = ?auto_612331 ?auto_612340 ) ) ( not ( = ?auto_612331 ?auto_612341 ) ) ( not ( = ?auto_612331 ?auto_612342 ) ) ( not ( = ?auto_612332 ?auto_612333 ) ) ( not ( = ?auto_612332 ?auto_612334 ) ) ( not ( = ?auto_612332 ?auto_612335 ) ) ( not ( = ?auto_612332 ?auto_612336 ) ) ( not ( = ?auto_612332 ?auto_612337 ) ) ( not ( = ?auto_612332 ?auto_612338 ) ) ( not ( = ?auto_612332 ?auto_612339 ) ) ( not ( = ?auto_612332 ?auto_612340 ) ) ( not ( = ?auto_612332 ?auto_612341 ) ) ( not ( = ?auto_612332 ?auto_612342 ) ) ( not ( = ?auto_612333 ?auto_612334 ) ) ( not ( = ?auto_612333 ?auto_612335 ) ) ( not ( = ?auto_612333 ?auto_612336 ) ) ( not ( = ?auto_612333 ?auto_612337 ) ) ( not ( = ?auto_612333 ?auto_612338 ) ) ( not ( = ?auto_612333 ?auto_612339 ) ) ( not ( = ?auto_612333 ?auto_612340 ) ) ( not ( = ?auto_612333 ?auto_612341 ) ) ( not ( = ?auto_612333 ?auto_612342 ) ) ( not ( = ?auto_612334 ?auto_612335 ) ) ( not ( = ?auto_612334 ?auto_612336 ) ) ( not ( = ?auto_612334 ?auto_612337 ) ) ( not ( = ?auto_612334 ?auto_612338 ) ) ( not ( = ?auto_612334 ?auto_612339 ) ) ( not ( = ?auto_612334 ?auto_612340 ) ) ( not ( = ?auto_612334 ?auto_612341 ) ) ( not ( = ?auto_612334 ?auto_612342 ) ) ( not ( = ?auto_612335 ?auto_612336 ) ) ( not ( = ?auto_612335 ?auto_612337 ) ) ( not ( = ?auto_612335 ?auto_612338 ) ) ( not ( = ?auto_612335 ?auto_612339 ) ) ( not ( = ?auto_612335 ?auto_612340 ) ) ( not ( = ?auto_612335 ?auto_612341 ) ) ( not ( = ?auto_612335 ?auto_612342 ) ) ( not ( = ?auto_612336 ?auto_612337 ) ) ( not ( = ?auto_612336 ?auto_612338 ) ) ( not ( = ?auto_612336 ?auto_612339 ) ) ( not ( = ?auto_612336 ?auto_612340 ) ) ( not ( = ?auto_612336 ?auto_612341 ) ) ( not ( = ?auto_612336 ?auto_612342 ) ) ( not ( = ?auto_612337 ?auto_612338 ) ) ( not ( = ?auto_612337 ?auto_612339 ) ) ( not ( = ?auto_612337 ?auto_612340 ) ) ( not ( = ?auto_612337 ?auto_612341 ) ) ( not ( = ?auto_612337 ?auto_612342 ) ) ( not ( = ?auto_612338 ?auto_612339 ) ) ( not ( = ?auto_612338 ?auto_612340 ) ) ( not ( = ?auto_612338 ?auto_612341 ) ) ( not ( = ?auto_612338 ?auto_612342 ) ) ( not ( = ?auto_612339 ?auto_612340 ) ) ( not ( = ?auto_612339 ?auto_612341 ) ) ( not ( = ?auto_612339 ?auto_612342 ) ) ( not ( = ?auto_612340 ?auto_612341 ) ) ( not ( = ?auto_612340 ?auto_612342 ) ) ( not ( = ?auto_612341 ?auto_612342 ) ) ( ON ?auto_612341 ?auto_612342 ) ( ON ?auto_612340 ?auto_612341 ) ( ON ?auto_612339 ?auto_612340 ) ( ON ?auto_612338 ?auto_612339 ) ( ON ?auto_612337 ?auto_612338 ) ( ON ?auto_612336 ?auto_612337 ) ( ON ?auto_612335 ?auto_612336 ) ( ON ?auto_612334 ?auto_612335 ) ( ON ?auto_612333 ?auto_612334 ) ( CLEAR ?auto_612331 ) ( ON ?auto_612332 ?auto_612333 ) ( CLEAR ?auto_612332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_612326 ?auto_612327 ?auto_612328 ?auto_612329 ?auto_612330 ?auto_612331 ?auto_612332 )
      ( MAKE-17PILE ?auto_612326 ?auto_612327 ?auto_612328 ?auto_612329 ?auto_612330 ?auto_612331 ?auto_612332 ?auto_612333 ?auto_612334 ?auto_612335 ?auto_612336 ?auto_612337 ?auto_612338 ?auto_612339 ?auto_612340 ?auto_612341 ?auto_612342 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612360 - BLOCK
      ?auto_612361 - BLOCK
      ?auto_612362 - BLOCK
      ?auto_612363 - BLOCK
      ?auto_612364 - BLOCK
      ?auto_612365 - BLOCK
      ?auto_612366 - BLOCK
      ?auto_612367 - BLOCK
      ?auto_612368 - BLOCK
      ?auto_612369 - BLOCK
      ?auto_612370 - BLOCK
      ?auto_612371 - BLOCK
      ?auto_612372 - BLOCK
      ?auto_612373 - BLOCK
      ?auto_612374 - BLOCK
      ?auto_612375 - BLOCK
      ?auto_612376 - BLOCK
    )
    :vars
    (
      ?auto_612377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612376 ?auto_612377 ) ( ON-TABLE ?auto_612360 ) ( ON ?auto_612361 ?auto_612360 ) ( ON ?auto_612362 ?auto_612361 ) ( ON ?auto_612363 ?auto_612362 ) ( ON ?auto_612364 ?auto_612363 ) ( not ( = ?auto_612360 ?auto_612361 ) ) ( not ( = ?auto_612360 ?auto_612362 ) ) ( not ( = ?auto_612360 ?auto_612363 ) ) ( not ( = ?auto_612360 ?auto_612364 ) ) ( not ( = ?auto_612360 ?auto_612365 ) ) ( not ( = ?auto_612360 ?auto_612366 ) ) ( not ( = ?auto_612360 ?auto_612367 ) ) ( not ( = ?auto_612360 ?auto_612368 ) ) ( not ( = ?auto_612360 ?auto_612369 ) ) ( not ( = ?auto_612360 ?auto_612370 ) ) ( not ( = ?auto_612360 ?auto_612371 ) ) ( not ( = ?auto_612360 ?auto_612372 ) ) ( not ( = ?auto_612360 ?auto_612373 ) ) ( not ( = ?auto_612360 ?auto_612374 ) ) ( not ( = ?auto_612360 ?auto_612375 ) ) ( not ( = ?auto_612360 ?auto_612376 ) ) ( not ( = ?auto_612360 ?auto_612377 ) ) ( not ( = ?auto_612361 ?auto_612362 ) ) ( not ( = ?auto_612361 ?auto_612363 ) ) ( not ( = ?auto_612361 ?auto_612364 ) ) ( not ( = ?auto_612361 ?auto_612365 ) ) ( not ( = ?auto_612361 ?auto_612366 ) ) ( not ( = ?auto_612361 ?auto_612367 ) ) ( not ( = ?auto_612361 ?auto_612368 ) ) ( not ( = ?auto_612361 ?auto_612369 ) ) ( not ( = ?auto_612361 ?auto_612370 ) ) ( not ( = ?auto_612361 ?auto_612371 ) ) ( not ( = ?auto_612361 ?auto_612372 ) ) ( not ( = ?auto_612361 ?auto_612373 ) ) ( not ( = ?auto_612361 ?auto_612374 ) ) ( not ( = ?auto_612361 ?auto_612375 ) ) ( not ( = ?auto_612361 ?auto_612376 ) ) ( not ( = ?auto_612361 ?auto_612377 ) ) ( not ( = ?auto_612362 ?auto_612363 ) ) ( not ( = ?auto_612362 ?auto_612364 ) ) ( not ( = ?auto_612362 ?auto_612365 ) ) ( not ( = ?auto_612362 ?auto_612366 ) ) ( not ( = ?auto_612362 ?auto_612367 ) ) ( not ( = ?auto_612362 ?auto_612368 ) ) ( not ( = ?auto_612362 ?auto_612369 ) ) ( not ( = ?auto_612362 ?auto_612370 ) ) ( not ( = ?auto_612362 ?auto_612371 ) ) ( not ( = ?auto_612362 ?auto_612372 ) ) ( not ( = ?auto_612362 ?auto_612373 ) ) ( not ( = ?auto_612362 ?auto_612374 ) ) ( not ( = ?auto_612362 ?auto_612375 ) ) ( not ( = ?auto_612362 ?auto_612376 ) ) ( not ( = ?auto_612362 ?auto_612377 ) ) ( not ( = ?auto_612363 ?auto_612364 ) ) ( not ( = ?auto_612363 ?auto_612365 ) ) ( not ( = ?auto_612363 ?auto_612366 ) ) ( not ( = ?auto_612363 ?auto_612367 ) ) ( not ( = ?auto_612363 ?auto_612368 ) ) ( not ( = ?auto_612363 ?auto_612369 ) ) ( not ( = ?auto_612363 ?auto_612370 ) ) ( not ( = ?auto_612363 ?auto_612371 ) ) ( not ( = ?auto_612363 ?auto_612372 ) ) ( not ( = ?auto_612363 ?auto_612373 ) ) ( not ( = ?auto_612363 ?auto_612374 ) ) ( not ( = ?auto_612363 ?auto_612375 ) ) ( not ( = ?auto_612363 ?auto_612376 ) ) ( not ( = ?auto_612363 ?auto_612377 ) ) ( not ( = ?auto_612364 ?auto_612365 ) ) ( not ( = ?auto_612364 ?auto_612366 ) ) ( not ( = ?auto_612364 ?auto_612367 ) ) ( not ( = ?auto_612364 ?auto_612368 ) ) ( not ( = ?auto_612364 ?auto_612369 ) ) ( not ( = ?auto_612364 ?auto_612370 ) ) ( not ( = ?auto_612364 ?auto_612371 ) ) ( not ( = ?auto_612364 ?auto_612372 ) ) ( not ( = ?auto_612364 ?auto_612373 ) ) ( not ( = ?auto_612364 ?auto_612374 ) ) ( not ( = ?auto_612364 ?auto_612375 ) ) ( not ( = ?auto_612364 ?auto_612376 ) ) ( not ( = ?auto_612364 ?auto_612377 ) ) ( not ( = ?auto_612365 ?auto_612366 ) ) ( not ( = ?auto_612365 ?auto_612367 ) ) ( not ( = ?auto_612365 ?auto_612368 ) ) ( not ( = ?auto_612365 ?auto_612369 ) ) ( not ( = ?auto_612365 ?auto_612370 ) ) ( not ( = ?auto_612365 ?auto_612371 ) ) ( not ( = ?auto_612365 ?auto_612372 ) ) ( not ( = ?auto_612365 ?auto_612373 ) ) ( not ( = ?auto_612365 ?auto_612374 ) ) ( not ( = ?auto_612365 ?auto_612375 ) ) ( not ( = ?auto_612365 ?auto_612376 ) ) ( not ( = ?auto_612365 ?auto_612377 ) ) ( not ( = ?auto_612366 ?auto_612367 ) ) ( not ( = ?auto_612366 ?auto_612368 ) ) ( not ( = ?auto_612366 ?auto_612369 ) ) ( not ( = ?auto_612366 ?auto_612370 ) ) ( not ( = ?auto_612366 ?auto_612371 ) ) ( not ( = ?auto_612366 ?auto_612372 ) ) ( not ( = ?auto_612366 ?auto_612373 ) ) ( not ( = ?auto_612366 ?auto_612374 ) ) ( not ( = ?auto_612366 ?auto_612375 ) ) ( not ( = ?auto_612366 ?auto_612376 ) ) ( not ( = ?auto_612366 ?auto_612377 ) ) ( not ( = ?auto_612367 ?auto_612368 ) ) ( not ( = ?auto_612367 ?auto_612369 ) ) ( not ( = ?auto_612367 ?auto_612370 ) ) ( not ( = ?auto_612367 ?auto_612371 ) ) ( not ( = ?auto_612367 ?auto_612372 ) ) ( not ( = ?auto_612367 ?auto_612373 ) ) ( not ( = ?auto_612367 ?auto_612374 ) ) ( not ( = ?auto_612367 ?auto_612375 ) ) ( not ( = ?auto_612367 ?auto_612376 ) ) ( not ( = ?auto_612367 ?auto_612377 ) ) ( not ( = ?auto_612368 ?auto_612369 ) ) ( not ( = ?auto_612368 ?auto_612370 ) ) ( not ( = ?auto_612368 ?auto_612371 ) ) ( not ( = ?auto_612368 ?auto_612372 ) ) ( not ( = ?auto_612368 ?auto_612373 ) ) ( not ( = ?auto_612368 ?auto_612374 ) ) ( not ( = ?auto_612368 ?auto_612375 ) ) ( not ( = ?auto_612368 ?auto_612376 ) ) ( not ( = ?auto_612368 ?auto_612377 ) ) ( not ( = ?auto_612369 ?auto_612370 ) ) ( not ( = ?auto_612369 ?auto_612371 ) ) ( not ( = ?auto_612369 ?auto_612372 ) ) ( not ( = ?auto_612369 ?auto_612373 ) ) ( not ( = ?auto_612369 ?auto_612374 ) ) ( not ( = ?auto_612369 ?auto_612375 ) ) ( not ( = ?auto_612369 ?auto_612376 ) ) ( not ( = ?auto_612369 ?auto_612377 ) ) ( not ( = ?auto_612370 ?auto_612371 ) ) ( not ( = ?auto_612370 ?auto_612372 ) ) ( not ( = ?auto_612370 ?auto_612373 ) ) ( not ( = ?auto_612370 ?auto_612374 ) ) ( not ( = ?auto_612370 ?auto_612375 ) ) ( not ( = ?auto_612370 ?auto_612376 ) ) ( not ( = ?auto_612370 ?auto_612377 ) ) ( not ( = ?auto_612371 ?auto_612372 ) ) ( not ( = ?auto_612371 ?auto_612373 ) ) ( not ( = ?auto_612371 ?auto_612374 ) ) ( not ( = ?auto_612371 ?auto_612375 ) ) ( not ( = ?auto_612371 ?auto_612376 ) ) ( not ( = ?auto_612371 ?auto_612377 ) ) ( not ( = ?auto_612372 ?auto_612373 ) ) ( not ( = ?auto_612372 ?auto_612374 ) ) ( not ( = ?auto_612372 ?auto_612375 ) ) ( not ( = ?auto_612372 ?auto_612376 ) ) ( not ( = ?auto_612372 ?auto_612377 ) ) ( not ( = ?auto_612373 ?auto_612374 ) ) ( not ( = ?auto_612373 ?auto_612375 ) ) ( not ( = ?auto_612373 ?auto_612376 ) ) ( not ( = ?auto_612373 ?auto_612377 ) ) ( not ( = ?auto_612374 ?auto_612375 ) ) ( not ( = ?auto_612374 ?auto_612376 ) ) ( not ( = ?auto_612374 ?auto_612377 ) ) ( not ( = ?auto_612375 ?auto_612376 ) ) ( not ( = ?auto_612375 ?auto_612377 ) ) ( not ( = ?auto_612376 ?auto_612377 ) ) ( ON ?auto_612375 ?auto_612376 ) ( ON ?auto_612374 ?auto_612375 ) ( ON ?auto_612373 ?auto_612374 ) ( ON ?auto_612372 ?auto_612373 ) ( ON ?auto_612371 ?auto_612372 ) ( ON ?auto_612370 ?auto_612371 ) ( ON ?auto_612369 ?auto_612370 ) ( ON ?auto_612368 ?auto_612369 ) ( ON ?auto_612367 ?auto_612368 ) ( ON ?auto_612366 ?auto_612367 ) ( CLEAR ?auto_612364 ) ( ON ?auto_612365 ?auto_612366 ) ( CLEAR ?auto_612365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_612360 ?auto_612361 ?auto_612362 ?auto_612363 ?auto_612364 ?auto_612365 )
      ( MAKE-17PILE ?auto_612360 ?auto_612361 ?auto_612362 ?auto_612363 ?auto_612364 ?auto_612365 ?auto_612366 ?auto_612367 ?auto_612368 ?auto_612369 ?auto_612370 ?auto_612371 ?auto_612372 ?auto_612373 ?auto_612374 ?auto_612375 ?auto_612376 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612395 - BLOCK
      ?auto_612396 - BLOCK
      ?auto_612397 - BLOCK
      ?auto_612398 - BLOCK
      ?auto_612399 - BLOCK
      ?auto_612400 - BLOCK
      ?auto_612401 - BLOCK
      ?auto_612402 - BLOCK
      ?auto_612403 - BLOCK
      ?auto_612404 - BLOCK
      ?auto_612405 - BLOCK
      ?auto_612406 - BLOCK
      ?auto_612407 - BLOCK
      ?auto_612408 - BLOCK
      ?auto_612409 - BLOCK
      ?auto_612410 - BLOCK
      ?auto_612411 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612411 ) ( ON-TABLE ?auto_612395 ) ( ON ?auto_612396 ?auto_612395 ) ( ON ?auto_612397 ?auto_612396 ) ( ON ?auto_612398 ?auto_612397 ) ( ON ?auto_612399 ?auto_612398 ) ( not ( = ?auto_612395 ?auto_612396 ) ) ( not ( = ?auto_612395 ?auto_612397 ) ) ( not ( = ?auto_612395 ?auto_612398 ) ) ( not ( = ?auto_612395 ?auto_612399 ) ) ( not ( = ?auto_612395 ?auto_612400 ) ) ( not ( = ?auto_612395 ?auto_612401 ) ) ( not ( = ?auto_612395 ?auto_612402 ) ) ( not ( = ?auto_612395 ?auto_612403 ) ) ( not ( = ?auto_612395 ?auto_612404 ) ) ( not ( = ?auto_612395 ?auto_612405 ) ) ( not ( = ?auto_612395 ?auto_612406 ) ) ( not ( = ?auto_612395 ?auto_612407 ) ) ( not ( = ?auto_612395 ?auto_612408 ) ) ( not ( = ?auto_612395 ?auto_612409 ) ) ( not ( = ?auto_612395 ?auto_612410 ) ) ( not ( = ?auto_612395 ?auto_612411 ) ) ( not ( = ?auto_612396 ?auto_612397 ) ) ( not ( = ?auto_612396 ?auto_612398 ) ) ( not ( = ?auto_612396 ?auto_612399 ) ) ( not ( = ?auto_612396 ?auto_612400 ) ) ( not ( = ?auto_612396 ?auto_612401 ) ) ( not ( = ?auto_612396 ?auto_612402 ) ) ( not ( = ?auto_612396 ?auto_612403 ) ) ( not ( = ?auto_612396 ?auto_612404 ) ) ( not ( = ?auto_612396 ?auto_612405 ) ) ( not ( = ?auto_612396 ?auto_612406 ) ) ( not ( = ?auto_612396 ?auto_612407 ) ) ( not ( = ?auto_612396 ?auto_612408 ) ) ( not ( = ?auto_612396 ?auto_612409 ) ) ( not ( = ?auto_612396 ?auto_612410 ) ) ( not ( = ?auto_612396 ?auto_612411 ) ) ( not ( = ?auto_612397 ?auto_612398 ) ) ( not ( = ?auto_612397 ?auto_612399 ) ) ( not ( = ?auto_612397 ?auto_612400 ) ) ( not ( = ?auto_612397 ?auto_612401 ) ) ( not ( = ?auto_612397 ?auto_612402 ) ) ( not ( = ?auto_612397 ?auto_612403 ) ) ( not ( = ?auto_612397 ?auto_612404 ) ) ( not ( = ?auto_612397 ?auto_612405 ) ) ( not ( = ?auto_612397 ?auto_612406 ) ) ( not ( = ?auto_612397 ?auto_612407 ) ) ( not ( = ?auto_612397 ?auto_612408 ) ) ( not ( = ?auto_612397 ?auto_612409 ) ) ( not ( = ?auto_612397 ?auto_612410 ) ) ( not ( = ?auto_612397 ?auto_612411 ) ) ( not ( = ?auto_612398 ?auto_612399 ) ) ( not ( = ?auto_612398 ?auto_612400 ) ) ( not ( = ?auto_612398 ?auto_612401 ) ) ( not ( = ?auto_612398 ?auto_612402 ) ) ( not ( = ?auto_612398 ?auto_612403 ) ) ( not ( = ?auto_612398 ?auto_612404 ) ) ( not ( = ?auto_612398 ?auto_612405 ) ) ( not ( = ?auto_612398 ?auto_612406 ) ) ( not ( = ?auto_612398 ?auto_612407 ) ) ( not ( = ?auto_612398 ?auto_612408 ) ) ( not ( = ?auto_612398 ?auto_612409 ) ) ( not ( = ?auto_612398 ?auto_612410 ) ) ( not ( = ?auto_612398 ?auto_612411 ) ) ( not ( = ?auto_612399 ?auto_612400 ) ) ( not ( = ?auto_612399 ?auto_612401 ) ) ( not ( = ?auto_612399 ?auto_612402 ) ) ( not ( = ?auto_612399 ?auto_612403 ) ) ( not ( = ?auto_612399 ?auto_612404 ) ) ( not ( = ?auto_612399 ?auto_612405 ) ) ( not ( = ?auto_612399 ?auto_612406 ) ) ( not ( = ?auto_612399 ?auto_612407 ) ) ( not ( = ?auto_612399 ?auto_612408 ) ) ( not ( = ?auto_612399 ?auto_612409 ) ) ( not ( = ?auto_612399 ?auto_612410 ) ) ( not ( = ?auto_612399 ?auto_612411 ) ) ( not ( = ?auto_612400 ?auto_612401 ) ) ( not ( = ?auto_612400 ?auto_612402 ) ) ( not ( = ?auto_612400 ?auto_612403 ) ) ( not ( = ?auto_612400 ?auto_612404 ) ) ( not ( = ?auto_612400 ?auto_612405 ) ) ( not ( = ?auto_612400 ?auto_612406 ) ) ( not ( = ?auto_612400 ?auto_612407 ) ) ( not ( = ?auto_612400 ?auto_612408 ) ) ( not ( = ?auto_612400 ?auto_612409 ) ) ( not ( = ?auto_612400 ?auto_612410 ) ) ( not ( = ?auto_612400 ?auto_612411 ) ) ( not ( = ?auto_612401 ?auto_612402 ) ) ( not ( = ?auto_612401 ?auto_612403 ) ) ( not ( = ?auto_612401 ?auto_612404 ) ) ( not ( = ?auto_612401 ?auto_612405 ) ) ( not ( = ?auto_612401 ?auto_612406 ) ) ( not ( = ?auto_612401 ?auto_612407 ) ) ( not ( = ?auto_612401 ?auto_612408 ) ) ( not ( = ?auto_612401 ?auto_612409 ) ) ( not ( = ?auto_612401 ?auto_612410 ) ) ( not ( = ?auto_612401 ?auto_612411 ) ) ( not ( = ?auto_612402 ?auto_612403 ) ) ( not ( = ?auto_612402 ?auto_612404 ) ) ( not ( = ?auto_612402 ?auto_612405 ) ) ( not ( = ?auto_612402 ?auto_612406 ) ) ( not ( = ?auto_612402 ?auto_612407 ) ) ( not ( = ?auto_612402 ?auto_612408 ) ) ( not ( = ?auto_612402 ?auto_612409 ) ) ( not ( = ?auto_612402 ?auto_612410 ) ) ( not ( = ?auto_612402 ?auto_612411 ) ) ( not ( = ?auto_612403 ?auto_612404 ) ) ( not ( = ?auto_612403 ?auto_612405 ) ) ( not ( = ?auto_612403 ?auto_612406 ) ) ( not ( = ?auto_612403 ?auto_612407 ) ) ( not ( = ?auto_612403 ?auto_612408 ) ) ( not ( = ?auto_612403 ?auto_612409 ) ) ( not ( = ?auto_612403 ?auto_612410 ) ) ( not ( = ?auto_612403 ?auto_612411 ) ) ( not ( = ?auto_612404 ?auto_612405 ) ) ( not ( = ?auto_612404 ?auto_612406 ) ) ( not ( = ?auto_612404 ?auto_612407 ) ) ( not ( = ?auto_612404 ?auto_612408 ) ) ( not ( = ?auto_612404 ?auto_612409 ) ) ( not ( = ?auto_612404 ?auto_612410 ) ) ( not ( = ?auto_612404 ?auto_612411 ) ) ( not ( = ?auto_612405 ?auto_612406 ) ) ( not ( = ?auto_612405 ?auto_612407 ) ) ( not ( = ?auto_612405 ?auto_612408 ) ) ( not ( = ?auto_612405 ?auto_612409 ) ) ( not ( = ?auto_612405 ?auto_612410 ) ) ( not ( = ?auto_612405 ?auto_612411 ) ) ( not ( = ?auto_612406 ?auto_612407 ) ) ( not ( = ?auto_612406 ?auto_612408 ) ) ( not ( = ?auto_612406 ?auto_612409 ) ) ( not ( = ?auto_612406 ?auto_612410 ) ) ( not ( = ?auto_612406 ?auto_612411 ) ) ( not ( = ?auto_612407 ?auto_612408 ) ) ( not ( = ?auto_612407 ?auto_612409 ) ) ( not ( = ?auto_612407 ?auto_612410 ) ) ( not ( = ?auto_612407 ?auto_612411 ) ) ( not ( = ?auto_612408 ?auto_612409 ) ) ( not ( = ?auto_612408 ?auto_612410 ) ) ( not ( = ?auto_612408 ?auto_612411 ) ) ( not ( = ?auto_612409 ?auto_612410 ) ) ( not ( = ?auto_612409 ?auto_612411 ) ) ( not ( = ?auto_612410 ?auto_612411 ) ) ( ON ?auto_612410 ?auto_612411 ) ( ON ?auto_612409 ?auto_612410 ) ( ON ?auto_612408 ?auto_612409 ) ( ON ?auto_612407 ?auto_612408 ) ( ON ?auto_612406 ?auto_612407 ) ( ON ?auto_612405 ?auto_612406 ) ( ON ?auto_612404 ?auto_612405 ) ( ON ?auto_612403 ?auto_612404 ) ( ON ?auto_612402 ?auto_612403 ) ( ON ?auto_612401 ?auto_612402 ) ( CLEAR ?auto_612399 ) ( ON ?auto_612400 ?auto_612401 ) ( CLEAR ?auto_612400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_612395 ?auto_612396 ?auto_612397 ?auto_612398 ?auto_612399 ?auto_612400 )
      ( MAKE-17PILE ?auto_612395 ?auto_612396 ?auto_612397 ?auto_612398 ?auto_612399 ?auto_612400 ?auto_612401 ?auto_612402 ?auto_612403 ?auto_612404 ?auto_612405 ?auto_612406 ?auto_612407 ?auto_612408 ?auto_612409 ?auto_612410 ?auto_612411 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612429 - BLOCK
      ?auto_612430 - BLOCK
      ?auto_612431 - BLOCK
      ?auto_612432 - BLOCK
      ?auto_612433 - BLOCK
      ?auto_612434 - BLOCK
      ?auto_612435 - BLOCK
      ?auto_612436 - BLOCK
      ?auto_612437 - BLOCK
      ?auto_612438 - BLOCK
      ?auto_612439 - BLOCK
      ?auto_612440 - BLOCK
      ?auto_612441 - BLOCK
      ?auto_612442 - BLOCK
      ?auto_612443 - BLOCK
      ?auto_612444 - BLOCK
      ?auto_612445 - BLOCK
    )
    :vars
    (
      ?auto_612446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612445 ?auto_612446 ) ( ON-TABLE ?auto_612429 ) ( ON ?auto_612430 ?auto_612429 ) ( ON ?auto_612431 ?auto_612430 ) ( ON ?auto_612432 ?auto_612431 ) ( not ( = ?auto_612429 ?auto_612430 ) ) ( not ( = ?auto_612429 ?auto_612431 ) ) ( not ( = ?auto_612429 ?auto_612432 ) ) ( not ( = ?auto_612429 ?auto_612433 ) ) ( not ( = ?auto_612429 ?auto_612434 ) ) ( not ( = ?auto_612429 ?auto_612435 ) ) ( not ( = ?auto_612429 ?auto_612436 ) ) ( not ( = ?auto_612429 ?auto_612437 ) ) ( not ( = ?auto_612429 ?auto_612438 ) ) ( not ( = ?auto_612429 ?auto_612439 ) ) ( not ( = ?auto_612429 ?auto_612440 ) ) ( not ( = ?auto_612429 ?auto_612441 ) ) ( not ( = ?auto_612429 ?auto_612442 ) ) ( not ( = ?auto_612429 ?auto_612443 ) ) ( not ( = ?auto_612429 ?auto_612444 ) ) ( not ( = ?auto_612429 ?auto_612445 ) ) ( not ( = ?auto_612429 ?auto_612446 ) ) ( not ( = ?auto_612430 ?auto_612431 ) ) ( not ( = ?auto_612430 ?auto_612432 ) ) ( not ( = ?auto_612430 ?auto_612433 ) ) ( not ( = ?auto_612430 ?auto_612434 ) ) ( not ( = ?auto_612430 ?auto_612435 ) ) ( not ( = ?auto_612430 ?auto_612436 ) ) ( not ( = ?auto_612430 ?auto_612437 ) ) ( not ( = ?auto_612430 ?auto_612438 ) ) ( not ( = ?auto_612430 ?auto_612439 ) ) ( not ( = ?auto_612430 ?auto_612440 ) ) ( not ( = ?auto_612430 ?auto_612441 ) ) ( not ( = ?auto_612430 ?auto_612442 ) ) ( not ( = ?auto_612430 ?auto_612443 ) ) ( not ( = ?auto_612430 ?auto_612444 ) ) ( not ( = ?auto_612430 ?auto_612445 ) ) ( not ( = ?auto_612430 ?auto_612446 ) ) ( not ( = ?auto_612431 ?auto_612432 ) ) ( not ( = ?auto_612431 ?auto_612433 ) ) ( not ( = ?auto_612431 ?auto_612434 ) ) ( not ( = ?auto_612431 ?auto_612435 ) ) ( not ( = ?auto_612431 ?auto_612436 ) ) ( not ( = ?auto_612431 ?auto_612437 ) ) ( not ( = ?auto_612431 ?auto_612438 ) ) ( not ( = ?auto_612431 ?auto_612439 ) ) ( not ( = ?auto_612431 ?auto_612440 ) ) ( not ( = ?auto_612431 ?auto_612441 ) ) ( not ( = ?auto_612431 ?auto_612442 ) ) ( not ( = ?auto_612431 ?auto_612443 ) ) ( not ( = ?auto_612431 ?auto_612444 ) ) ( not ( = ?auto_612431 ?auto_612445 ) ) ( not ( = ?auto_612431 ?auto_612446 ) ) ( not ( = ?auto_612432 ?auto_612433 ) ) ( not ( = ?auto_612432 ?auto_612434 ) ) ( not ( = ?auto_612432 ?auto_612435 ) ) ( not ( = ?auto_612432 ?auto_612436 ) ) ( not ( = ?auto_612432 ?auto_612437 ) ) ( not ( = ?auto_612432 ?auto_612438 ) ) ( not ( = ?auto_612432 ?auto_612439 ) ) ( not ( = ?auto_612432 ?auto_612440 ) ) ( not ( = ?auto_612432 ?auto_612441 ) ) ( not ( = ?auto_612432 ?auto_612442 ) ) ( not ( = ?auto_612432 ?auto_612443 ) ) ( not ( = ?auto_612432 ?auto_612444 ) ) ( not ( = ?auto_612432 ?auto_612445 ) ) ( not ( = ?auto_612432 ?auto_612446 ) ) ( not ( = ?auto_612433 ?auto_612434 ) ) ( not ( = ?auto_612433 ?auto_612435 ) ) ( not ( = ?auto_612433 ?auto_612436 ) ) ( not ( = ?auto_612433 ?auto_612437 ) ) ( not ( = ?auto_612433 ?auto_612438 ) ) ( not ( = ?auto_612433 ?auto_612439 ) ) ( not ( = ?auto_612433 ?auto_612440 ) ) ( not ( = ?auto_612433 ?auto_612441 ) ) ( not ( = ?auto_612433 ?auto_612442 ) ) ( not ( = ?auto_612433 ?auto_612443 ) ) ( not ( = ?auto_612433 ?auto_612444 ) ) ( not ( = ?auto_612433 ?auto_612445 ) ) ( not ( = ?auto_612433 ?auto_612446 ) ) ( not ( = ?auto_612434 ?auto_612435 ) ) ( not ( = ?auto_612434 ?auto_612436 ) ) ( not ( = ?auto_612434 ?auto_612437 ) ) ( not ( = ?auto_612434 ?auto_612438 ) ) ( not ( = ?auto_612434 ?auto_612439 ) ) ( not ( = ?auto_612434 ?auto_612440 ) ) ( not ( = ?auto_612434 ?auto_612441 ) ) ( not ( = ?auto_612434 ?auto_612442 ) ) ( not ( = ?auto_612434 ?auto_612443 ) ) ( not ( = ?auto_612434 ?auto_612444 ) ) ( not ( = ?auto_612434 ?auto_612445 ) ) ( not ( = ?auto_612434 ?auto_612446 ) ) ( not ( = ?auto_612435 ?auto_612436 ) ) ( not ( = ?auto_612435 ?auto_612437 ) ) ( not ( = ?auto_612435 ?auto_612438 ) ) ( not ( = ?auto_612435 ?auto_612439 ) ) ( not ( = ?auto_612435 ?auto_612440 ) ) ( not ( = ?auto_612435 ?auto_612441 ) ) ( not ( = ?auto_612435 ?auto_612442 ) ) ( not ( = ?auto_612435 ?auto_612443 ) ) ( not ( = ?auto_612435 ?auto_612444 ) ) ( not ( = ?auto_612435 ?auto_612445 ) ) ( not ( = ?auto_612435 ?auto_612446 ) ) ( not ( = ?auto_612436 ?auto_612437 ) ) ( not ( = ?auto_612436 ?auto_612438 ) ) ( not ( = ?auto_612436 ?auto_612439 ) ) ( not ( = ?auto_612436 ?auto_612440 ) ) ( not ( = ?auto_612436 ?auto_612441 ) ) ( not ( = ?auto_612436 ?auto_612442 ) ) ( not ( = ?auto_612436 ?auto_612443 ) ) ( not ( = ?auto_612436 ?auto_612444 ) ) ( not ( = ?auto_612436 ?auto_612445 ) ) ( not ( = ?auto_612436 ?auto_612446 ) ) ( not ( = ?auto_612437 ?auto_612438 ) ) ( not ( = ?auto_612437 ?auto_612439 ) ) ( not ( = ?auto_612437 ?auto_612440 ) ) ( not ( = ?auto_612437 ?auto_612441 ) ) ( not ( = ?auto_612437 ?auto_612442 ) ) ( not ( = ?auto_612437 ?auto_612443 ) ) ( not ( = ?auto_612437 ?auto_612444 ) ) ( not ( = ?auto_612437 ?auto_612445 ) ) ( not ( = ?auto_612437 ?auto_612446 ) ) ( not ( = ?auto_612438 ?auto_612439 ) ) ( not ( = ?auto_612438 ?auto_612440 ) ) ( not ( = ?auto_612438 ?auto_612441 ) ) ( not ( = ?auto_612438 ?auto_612442 ) ) ( not ( = ?auto_612438 ?auto_612443 ) ) ( not ( = ?auto_612438 ?auto_612444 ) ) ( not ( = ?auto_612438 ?auto_612445 ) ) ( not ( = ?auto_612438 ?auto_612446 ) ) ( not ( = ?auto_612439 ?auto_612440 ) ) ( not ( = ?auto_612439 ?auto_612441 ) ) ( not ( = ?auto_612439 ?auto_612442 ) ) ( not ( = ?auto_612439 ?auto_612443 ) ) ( not ( = ?auto_612439 ?auto_612444 ) ) ( not ( = ?auto_612439 ?auto_612445 ) ) ( not ( = ?auto_612439 ?auto_612446 ) ) ( not ( = ?auto_612440 ?auto_612441 ) ) ( not ( = ?auto_612440 ?auto_612442 ) ) ( not ( = ?auto_612440 ?auto_612443 ) ) ( not ( = ?auto_612440 ?auto_612444 ) ) ( not ( = ?auto_612440 ?auto_612445 ) ) ( not ( = ?auto_612440 ?auto_612446 ) ) ( not ( = ?auto_612441 ?auto_612442 ) ) ( not ( = ?auto_612441 ?auto_612443 ) ) ( not ( = ?auto_612441 ?auto_612444 ) ) ( not ( = ?auto_612441 ?auto_612445 ) ) ( not ( = ?auto_612441 ?auto_612446 ) ) ( not ( = ?auto_612442 ?auto_612443 ) ) ( not ( = ?auto_612442 ?auto_612444 ) ) ( not ( = ?auto_612442 ?auto_612445 ) ) ( not ( = ?auto_612442 ?auto_612446 ) ) ( not ( = ?auto_612443 ?auto_612444 ) ) ( not ( = ?auto_612443 ?auto_612445 ) ) ( not ( = ?auto_612443 ?auto_612446 ) ) ( not ( = ?auto_612444 ?auto_612445 ) ) ( not ( = ?auto_612444 ?auto_612446 ) ) ( not ( = ?auto_612445 ?auto_612446 ) ) ( ON ?auto_612444 ?auto_612445 ) ( ON ?auto_612443 ?auto_612444 ) ( ON ?auto_612442 ?auto_612443 ) ( ON ?auto_612441 ?auto_612442 ) ( ON ?auto_612440 ?auto_612441 ) ( ON ?auto_612439 ?auto_612440 ) ( ON ?auto_612438 ?auto_612439 ) ( ON ?auto_612437 ?auto_612438 ) ( ON ?auto_612436 ?auto_612437 ) ( ON ?auto_612435 ?auto_612436 ) ( ON ?auto_612434 ?auto_612435 ) ( CLEAR ?auto_612432 ) ( ON ?auto_612433 ?auto_612434 ) ( CLEAR ?auto_612433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_612429 ?auto_612430 ?auto_612431 ?auto_612432 ?auto_612433 )
      ( MAKE-17PILE ?auto_612429 ?auto_612430 ?auto_612431 ?auto_612432 ?auto_612433 ?auto_612434 ?auto_612435 ?auto_612436 ?auto_612437 ?auto_612438 ?auto_612439 ?auto_612440 ?auto_612441 ?auto_612442 ?auto_612443 ?auto_612444 ?auto_612445 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612464 - BLOCK
      ?auto_612465 - BLOCK
      ?auto_612466 - BLOCK
      ?auto_612467 - BLOCK
      ?auto_612468 - BLOCK
      ?auto_612469 - BLOCK
      ?auto_612470 - BLOCK
      ?auto_612471 - BLOCK
      ?auto_612472 - BLOCK
      ?auto_612473 - BLOCK
      ?auto_612474 - BLOCK
      ?auto_612475 - BLOCK
      ?auto_612476 - BLOCK
      ?auto_612477 - BLOCK
      ?auto_612478 - BLOCK
      ?auto_612479 - BLOCK
      ?auto_612480 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612480 ) ( ON-TABLE ?auto_612464 ) ( ON ?auto_612465 ?auto_612464 ) ( ON ?auto_612466 ?auto_612465 ) ( ON ?auto_612467 ?auto_612466 ) ( not ( = ?auto_612464 ?auto_612465 ) ) ( not ( = ?auto_612464 ?auto_612466 ) ) ( not ( = ?auto_612464 ?auto_612467 ) ) ( not ( = ?auto_612464 ?auto_612468 ) ) ( not ( = ?auto_612464 ?auto_612469 ) ) ( not ( = ?auto_612464 ?auto_612470 ) ) ( not ( = ?auto_612464 ?auto_612471 ) ) ( not ( = ?auto_612464 ?auto_612472 ) ) ( not ( = ?auto_612464 ?auto_612473 ) ) ( not ( = ?auto_612464 ?auto_612474 ) ) ( not ( = ?auto_612464 ?auto_612475 ) ) ( not ( = ?auto_612464 ?auto_612476 ) ) ( not ( = ?auto_612464 ?auto_612477 ) ) ( not ( = ?auto_612464 ?auto_612478 ) ) ( not ( = ?auto_612464 ?auto_612479 ) ) ( not ( = ?auto_612464 ?auto_612480 ) ) ( not ( = ?auto_612465 ?auto_612466 ) ) ( not ( = ?auto_612465 ?auto_612467 ) ) ( not ( = ?auto_612465 ?auto_612468 ) ) ( not ( = ?auto_612465 ?auto_612469 ) ) ( not ( = ?auto_612465 ?auto_612470 ) ) ( not ( = ?auto_612465 ?auto_612471 ) ) ( not ( = ?auto_612465 ?auto_612472 ) ) ( not ( = ?auto_612465 ?auto_612473 ) ) ( not ( = ?auto_612465 ?auto_612474 ) ) ( not ( = ?auto_612465 ?auto_612475 ) ) ( not ( = ?auto_612465 ?auto_612476 ) ) ( not ( = ?auto_612465 ?auto_612477 ) ) ( not ( = ?auto_612465 ?auto_612478 ) ) ( not ( = ?auto_612465 ?auto_612479 ) ) ( not ( = ?auto_612465 ?auto_612480 ) ) ( not ( = ?auto_612466 ?auto_612467 ) ) ( not ( = ?auto_612466 ?auto_612468 ) ) ( not ( = ?auto_612466 ?auto_612469 ) ) ( not ( = ?auto_612466 ?auto_612470 ) ) ( not ( = ?auto_612466 ?auto_612471 ) ) ( not ( = ?auto_612466 ?auto_612472 ) ) ( not ( = ?auto_612466 ?auto_612473 ) ) ( not ( = ?auto_612466 ?auto_612474 ) ) ( not ( = ?auto_612466 ?auto_612475 ) ) ( not ( = ?auto_612466 ?auto_612476 ) ) ( not ( = ?auto_612466 ?auto_612477 ) ) ( not ( = ?auto_612466 ?auto_612478 ) ) ( not ( = ?auto_612466 ?auto_612479 ) ) ( not ( = ?auto_612466 ?auto_612480 ) ) ( not ( = ?auto_612467 ?auto_612468 ) ) ( not ( = ?auto_612467 ?auto_612469 ) ) ( not ( = ?auto_612467 ?auto_612470 ) ) ( not ( = ?auto_612467 ?auto_612471 ) ) ( not ( = ?auto_612467 ?auto_612472 ) ) ( not ( = ?auto_612467 ?auto_612473 ) ) ( not ( = ?auto_612467 ?auto_612474 ) ) ( not ( = ?auto_612467 ?auto_612475 ) ) ( not ( = ?auto_612467 ?auto_612476 ) ) ( not ( = ?auto_612467 ?auto_612477 ) ) ( not ( = ?auto_612467 ?auto_612478 ) ) ( not ( = ?auto_612467 ?auto_612479 ) ) ( not ( = ?auto_612467 ?auto_612480 ) ) ( not ( = ?auto_612468 ?auto_612469 ) ) ( not ( = ?auto_612468 ?auto_612470 ) ) ( not ( = ?auto_612468 ?auto_612471 ) ) ( not ( = ?auto_612468 ?auto_612472 ) ) ( not ( = ?auto_612468 ?auto_612473 ) ) ( not ( = ?auto_612468 ?auto_612474 ) ) ( not ( = ?auto_612468 ?auto_612475 ) ) ( not ( = ?auto_612468 ?auto_612476 ) ) ( not ( = ?auto_612468 ?auto_612477 ) ) ( not ( = ?auto_612468 ?auto_612478 ) ) ( not ( = ?auto_612468 ?auto_612479 ) ) ( not ( = ?auto_612468 ?auto_612480 ) ) ( not ( = ?auto_612469 ?auto_612470 ) ) ( not ( = ?auto_612469 ?auto_612471 ) ) ( not ( = ?auto_612469 ?auto_612472 ) ) ( not ( = ?auto_612469 ?auto_612473 ) ) ( not ( = ?auto_612469 ?auto_612474 ) ) ( not ( = ?auto_612469 ?auto_612475 ) ) ( not ( = ?auto_612469 ?auto_612476 ) ) ( not ( = ?auto_612469 ?auto_612477 ) ) ( not ( = ?auto_612469 ?auto_612478 ) ) ( not ( = ?auto_612469 ?auto_612479 ) ) ( not ( = ?auto_612469 ?auto_612480 ) ) ( not ( = ?auto_612470 ?auto_612471 ) ) ( not ( = ?auto_612470 ?auto_612472 ) ) ( not ( = ?auto_612470 ?auto_612473 ) ) ( not ( = ?auto_612470 ?auto_612474 ) ) ( not ( = ?auto_612470 ?auto_612475 ) ) ( not ( = ?auto_612470 ?auto_612476 ) ) ( not ( = ?auto_612470 ?auto_612477 ) ) ( not ( = ?auto_612470 ?auto_612478 ) ) ( not ( = ?auto_612470 ?auto_612479 ) ) ( not ( = ?auto_612470 ?auto_612480 ) ) ( not ( = ?auto_612471 ?auto_612472 ) ) ( not ( = ?auto_612471 ?auto_612473 ) ) ( not ( = ?auto_612471 ?auto_612474 ) ) ( not ( = ?auto_612471 ?auto_612475 ) ) ( not ( = ?auto_612471 ?auto_612476 ) ) ( not ( = ?auto_612471 ?auto_612477 ) ) ( not ( = ?auto_612471 ?auto_612478 ) ) ( not ( = ?auto_612471 ?auto_612479 ) ) ( not ( = ?auto_612471 ?auto_612480 ) ) ( not ( = ?auto_612472 ?auto_612473 ) ) ( not ( = ?auto_612472 ?auto_612474 ) ) ( not ( = ?auto_612472 ?auto_612475 ) ) ( not ( = ?auto_612472 ?auto_612476 ) ) ( not ( = ?auto_612472 ?auto_612477 ) ) ( not ( = ?auto_612472 ?auto_612478 ) ) ( not ( = ?auto_612472 ?auto_612479 ) ) ( not ( = ?auto_612472 ?auto_612480 ) ) ( not ( = ?auto_612473 ?auto_612474 ) ) ( not ( = ?auto_612473 ?auto_612475 ) ) ( not ( = ?auto_612473 ?auto_612476 ) ) ( not ( = ?auto_612473 ?auto_612477 ) ) ( not ( = ?auto_612473 ?auto_612478 ) ) ( not ( = ?auto_612473 ?auto_612479 ) ) ( not ( = ?auto_612473 ?auto_612480 ) ) ( not ( = ?auto_612474 ?auto_612475 ) ) ( not ( = ?auto_612474 ?auto_612476 ) ) ( not ( = ?auto_612474 ?auto_612477 ) ) ( not ( = ?auto_612474 ?auto_612478 ) ) ( not ( = ?auto_612474 ?auto_612479 ) ) ( not ( = ?auto_612474 ?auto_612480 ) ) ( not ( = ?auto_612475 ?auto_612476 ) ) ( not ( = ?auto_612475 ?auto_612477 ) ) ( not ( = ?auto_612475 ?auto_612478 ) ) ( not ( = ?auto_612475 ?auto_612479 ) ) ( not ( = ?auto_612475 ?auto_612480 ) ) ( not ( = ?auto_612476 ?auto_612477 ) ) ( not ( = ?auto_612476 ?auto_612478 ) ) ( not ( = ?auto_612476 ?auto_612479 ) ) ( not ( = ?auto_612476 ?auto_612480 ) ) ( not ( = ?auto_612477 ?auto_612478 ) ) ( not ( = ?auto_612477 ?auto_612479 ) ) ( not ( = ?auto_612477 ?auto_612480 ) ) ( not ( = ?auto_612478 ?auto_612479 ) ) ( not ( = ?auto_612478 ?auto_612480 ) ) ( not ( = ?auto_612479 ?auto_612480 ) ) ( ON ?auto_612479 ?auto_612480 ) ( ON ?auto_612478 ?auto_612479 ) ( ON ?auto_612477 ?auto_612478 ) ( ON ?auto_612476 ?auto_612477 ) ( ON ?auto_612475 ?auto_612476 ) ( ON ?auto_612474 ?auto_612475 ) ( ON ?auto_612473 ?auto_612474 ) ( ON ?auto_612472 ?auto_612473 ) ( ON ?auto_612471 ?auto_612472 ) ( ON ?auto_612470 ?auto_612471 ) ( ON ?auto_612469 ?auto_612470 ) ( CLEAR ?auto_612467 ) ( ON ?auto_612468 ?auto_612469 ) ( CLEAR ?auto_612468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_612464 ?auto_612465 ?auto_612466 ?auto_612467 ?auto_612468 )
      ( MAKE-17PILE ?auto_612464 ?auto_612465 ?auto_612466 ?auto_612467 ?auto_612468 ?auto_612469 ?auto_612470 ?auto_612471 ?auto_612472 ?auto_612473 ?auto_612474 ?auto_612475 ?auto_612476 ?auto_612477 ?auto_612478 ?auto_612479 ?auto_612480 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612498 - BLOCK
      ?auto_612499 - BLOCK
      ?auto_612500 - BLOCK
      ?auto_612501 - BLOCK
      ?auto_612502 - BLOCK
      ?auto_612503 - BLOCK
      ?auto_612504 - BLOCK
      ?auto_612505 - BLOCK
      ?auto_612506 - BLOCK
      ?auto_612507 - BLOCK
      ?auto_612508 - BLOCK
      ?auto_612509 - BLOCK
      ?auto_612510 - BLOCK
      ?auto_612511 - BLOCK
      ?auto_612512 - BLOCK
      ?auto_612513 - BLOCK
      ?auto_612514 - BLOCK
    )
    :vars
    (
      ?auto_612515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612514 ?auto_612515 ) ( ON-TABLE ?auto_612498 ) ( ON ?auto_612499 ?auto_612498 ) ( ON ?auto_612500 ?auto_612499 ) ( not ( = ?auto_612498 ?auto_612499 ) ) ( not ( = ?auto_612498 ?auto_612500 ) ) ( not ( = ?auto_612498 ?auto_612501 ) ) ( not ( = ?auto_612498 ?auto_612502 ) ) ( not ( = ?auto_612498 ?auto_612503 ) ) ( not ( = ?auto_612498 ?auto_612504 ) ) ( not ( = ?auto_612498 ?auto_612505 ) ) ( not ( = ?auto_612498 ?auto_612506 ) ) ( not ( = ?auto_612498 ?auto_612507 ) ) ( not ( = ?auto_612498 ?auto_612508 ) ) ( not ( = ?auto_612498 ?auto_612509 ) ) ( not ( = ?auto_612498 ?auto_612510 ) ) ( not ( = ?auto_612498 ?auto_612511 ) ) ( not ( = ?auto_612498 ?auto_612512 ) ) ( not ( = ?auto_612498 ?auto_612513 ) ) ( not ( = ?auto_612498 ?auto_612514 ) ) ( not ( = ?auto_612498 ?auto_612515 ) ) ( not ( = ?auto_612499 ?auto_612500 ) ) ( not ( = ?auto_612499 ?auto_612501 ) ) ( not ( = ?auto_612499 ?auto_612502 ) ) ( not ( = ?auto_612499 ?auto_612503 ) ) ( not ( = ?auto_612499 ?auto_612504 ) ) ( not ( = ?auto_612499 ?auto_612505 ) ) ( not ( = ?auto_612499 ?auto_612506 ) ) ( not ( = ?auto_612499 ?auto_612507 ) ) ( not ( = ?auto_612499 ?auto_612508 ) ) ( not ( = ?auto_612499 ?auto_612509 ) ) ( not ( = ?auto_612499 ?auto_612510 ) ) ( not ( = ?auto_612499 ?auto_612511 ) ) ( not ( = ?auto_612499 ?auto_612512 ) ) ( not ( = ?auto_612499 ?auto_612513 ) ) ( not ( = ?auto_612499 ?auto_612514 ) ) ( not ( = ?auto_612499 ?auto_612515 ) ) ( not ( = ?auto_612500 ?auto_612501 ) ) ( not ( = ?auto_612500 ?auto_612502 ) ) ( not ( = ?auto_612500 ?auto_612503 ) ) ( not ( = ?auto_612500 ?auto_612504 ) ) ( not ( = ?auto_612500 ?auto_612505 ) ) ( not ( = ?auto_612500 ?auto_612506 ) ) ( not ( = ?auto_612500 ?auto_612507 ) ) ( not ( = ?auto_612500 ?auto_612508 ) ) ( not ( = ?auto_612500 ?auto_612509 ) ) ( not ( = ?auto_612500 ?auto_612510 ) ) ( not ( = ?auto_612500 ?auto_612511 ) ) ( not ( = ?auto_612500 ?auto_612512 ) ) ( not ( = ?auto_612500 ?auto_612513 ) ) ( not ( = ?auto_612500 ?auto_612514 ) ) ( not ( = ?auto_612500 ?auto_612515 ) ) ( not ( = ?auto_612501 ?auto_612502 ) ) ( not ( = ?auto_612501 ?auto_612503 ) ) ( not ( = ?auto_612501 ?auto_612504 ) ) ( not ( = ?auto_612501 ?auto_612505 ) ) ( not ( = ?auto_612501 ?auto_612506 ) ) ( not ( = ?auto_612501 ?auto_612507 ) ) ( not ( = ?auto_612501 ?auto_612508 ) ) ( not ( = ?auto_612501 ?auto_612509 ) ) ( not ( = ?auto_612501 ?auto_612510 ) ) ( not ( = ?auto_612501 ?auto_612511 ) ) ( not ( = ?auto_612501 ?auto_612512 ) ) ( not ( = ?auto_612501 ?auto_612513 ) ) ( not ( = ?auto_612501 ?auto_612514 ) ) ( not ( = ?auto_612501 ?auto_612515 ) ) ( not ( = ?auto_612502 ?auto_612503 ) ) ( not ( = ?auto_612502 ?auto_612504 ) ) ( not ( = ?auto_612502 ?auto_612505 ) ) ( not ( = ?auto_612502 ?auto_612506 ) ) ( not ( = ?auto_612502 ?auto_612507 ) ) ( not ( = ?auto_612502 ?auto_612508 ) ) ( not ( = ?auto_612502 ?auto_612509 ) ) ( not ( = ?auto_612502 ?auto_612510 ) ) ( not ( = ?auto_612502 ?auto_612511 ) ) ( not ( = ?auto_612502 ?auto_612512 ) ) ( not ( = ?auto_612502 ?auto_612513 ) ) ( not ( = ?auto_612502 ?auto_612514 ) ) ( not ( = ?auto_612502 ?auto_612515 ) ) ( not ( = ?auto_612503 ?auto_612504 ) ) ( not ( = ?auto_612503 ?auto_612505 ) ) ( not ( = ?auto_612503 ?auto_612506 ) ) ( not ( = ?auto_612503 ?auto_612507 ) ) ( not ( = ?auto_612503 ?auto_612508 ) ) ( not ( = ?auto_612503 ?auto_612509 ) ) ( not ( = ?auto_612503 ?auto_612510 ) ) ( not ( = ?auto_612503 ?auto_612511 ) ) ( not ( = ?auto_612503 ?auto_612512 ) ) ( not ( = ?auto_612503 ?auto_612513 ) ) ( not ( = ?auto_612503 ?auto_612514 ) ) ( not ( = ?auto_612503 ?auto_612515 ) ) ( not ( = ?auto_612504 ?auto_612505 ) ) ( not ( = ?auto_612504 ?auto_612506 ) ) ( not ( = ?auto_612504 ?auto_612507 ) ) ( not ( = ?auto_612504 ?auto_612508 ) ) ( not ( = ?auto_612504 ?auto_612509 ) ) ( not ( = ?auto_612504 ?auto_612510 ) ) ( not ( = ?auto_612504 ?auto_612511 ) ) ( not ( = ?auto_612504 ?auto_612512 ) ) ( not ( = ?auto_612504 ?auto_612513 ) ) ( not ( = ?auto_612504 ?auto_612514 ) ) ( not ( = ?auto_612504 ?auto_612515 ) ) ( not ( = ?auto_612505 ?auto_612506 ) ) ( not ( = ?auto_612505 ?auto_612507 ) ) ( not ( = ?auto_612505 ?auto_612508 ) ) ( not ( = ?auto_612505 ?auto_612509 ) ) ( not ( = ?auto_612505 ?auto_612510 ) ) ( not ( = ?auto_612505 ?auto_612511 ) ) ( not ( = ?auto_612505 ?auto_612512 ) ) ( not ( = ?auto_612505 ?auto_612513 ) ) ( not ( = ?auto_612505 ?auto_612514 ) ) ( not ( = ?auto_612505 ?auto_612515 ) ) ( not ( = ?auto_612506 ?auto_612507 ) ) ( not ( = ?auto_612506 ?auto_612508 ) ) ( not ( = ?auto_612506 ?auto_612509 ) ) ( not ( = ?auto_612506 ?auto_612510 ) ) ( not ( = ?auto_612506 ?auto_612511 ) ) ( not ( = ?auto_612506 ?auto_612512 ) ) ( not ( = ?auto_612506 ?auto_612513 ) ) ( not ( = ?auto_612506 ?auto_612514 ) ) ( not ( = ?auto_612506 ?auto_612515 ) ) ( not ( = ?auto_612507 ?auto_612508 ) ) ( not ( = ?auto_612507 ?auto_612509 ) ) ( not ( = ?auto_612507 ?auto_612510 ) ) ( not ( = ?auto_612507 ?auto_612511 ) ) ( not ( = ?auto_612507 ?auto_612512 ) ) ( not ( = ?auto_612507 ?auto_612513 ) ) ( not ( = ?auto_612507 ?auto_612514 ) ) ( not ( = ?auto_612507 ?auto_612515 ) ) ( not ( = ?auto_612508 ?auto_612509 ) ) ( not ( = ?auto_612508 ?auto_612510 ) ) ( not ( = ?auto_612508 ?auto_612511 ) ) ( not ( = ?auto_612508 ?auto_612512 ) ) ( not ( = ?auto_612508 ?auto_612513 ) ) ( not ( = ?auto_612508 ?auto_612514 ) ) ( not ( = ?auto_612508 ?auto_612515 ) ) ( not ( = ?auto_612509 ?auto_612510 ) ) ( not ( = ?auto_612509 ?auto_612511 ) ) ( not ( = ?auto_612509 ?auto_612512 ) ) ( not ( = ?auto_612509 ?auto_612513 ) ) ( not ( = ?auto_612509 ?auto_612514 ) ) ( not ( = ?auto_612509 ?auto_612515 ) ) ( not ( = ?auto_612510 ?auto_612511 ) ) ( not ( = ?auto_612510 ?auto_612512 ) ) ( not ( = ?auto_612510 ?auto_612513 ) ) ( not ( = ?auto_612510 ?auto_612514 ) ) ( not ( = ?auto_612510 ?auto_612515 ) ) ( not ( = ?auto_612511 ?auto_612512 ) ) ( not ( = ?auto_612511 ?auto_612513 ) ) ( not ( = ?auto_612511 ?auto_612514 ) ) ( not ( = ?auto_612511 ?auto_612515 ) ) ( not ( = ?auto_612512 ?auto_612513 ) ) ( not ( = ?auto_612512 ?auto_612514 ) ) ( not ( = ?auto_612512 ?auto_612515 ) ) ( not ( = ?auto_612513 ?auto_612514 ) ) ( not ( = ?auto_612513 ?auto_612515 ) ) ( not ( = ?auto_612514 ?auto_612515 ) ) ( ON ?auto_612513 ?auto_612514 ) ( ON ?auto_612512 ?auto_612513 ) ( ON ?auto_612511 ?auto_612512 ) ( ON ?auto_612510 ?auto_612511 ) ( ON ?auto_612509 ?auto_612510 ) ( ON ?auto_612508 ?auto_612509 ) ( ON ?auto_612507 ?auto_612508 ) ( ON ?auto_612506 ?auto_612507 ) ( ON ?auto_612505 ?auto_612506 ) ( ON ?auto_612504 ?auto_612505 ) ( ON ?auto_612503 ?auto_612504 ) ( ON ?auto_612502 ?auto_612503 ) ( CLEAR ?auto_612500 ) ( ON ?auto_612501 ?auto_612502 ) ( CLEAR ?auto_612501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_612498 ?auto_612499 ?auto_612500 ?auto_612501 )
      ( MAKE-17PILE ?auto_612498 ?auto_612499 ?auto_612500 ?auto_612501 ?auto_612502 ?auto_612503 ?auto_612504 ?auto_612505 ?auto_612506 ?auto_612507 ?auto_612508 ?auto_612509 ?auto_612510 ?auto_612511 ?auto_612512 ?auto_612513 ?auto_612514 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612533 - BLOCK
      ?auto_612534 - BLOCK
      ?auto_612535 - BLOCK
      ?auto_612536 - BLOCK
      ?auto_612537 - BLOCK
      ?auto_612538 - BLOCK
      ?auto_612539 - BLOCK
      ?auto_612540 - BLOCK
      ?auto_612541 - BLOCK
      ?auto_612542 - BLOCK
      ?auto_612543 - BLOCK
      ?auto_612544 - BLOCK
      ?auto_612545 - BLOCK
      ?auto_612546 - BLOCK
      ?auto_612547 - BLOCK
      ?auto_612548 - BLOCK
      ?auto_612549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612549 ) ( ON-TABLE ?auto_612533 ) ( ON ?auto_612534 ?auto_612533 ) ( ON ?auto_612535 ?auto_612534 ) ( not ( = ?auto_612533 ?auto_612534 ) ) ( not ( = ?auto_612533 ?auto_612535 ) ) ( not ( = ?auto_612533 ?auto_612536 ) ) ( not ( = ?auto_612533 ?auto_612537 ) ) ( not ( = ?auto_612533 ?auto_612538 ) ) ( not ( = ?auto_612533 ?auto_612539 ) ) ( not ( = ?auto_612533 ?auto_612540 ) ) ( not ( = ?auto_612533 ?auto_612541 ) ) ( not ( = ?auto_612533 ?auto_612542 ) ) ( not ( = ?auto_612533 ?auto_612543 ) ) ( not ( = ?auto_612533 ?auto_612544 ) ) ( not ( = ?auto_612533 ?auto_612545 ) ) ( not ( = ?auto_612533 ?auto_612546 ) ) ( not ( = ?auto_612533 ?auto_612547 ) ) ( not ( = ?auto_612533 ?auto_612548 ) ) ( not ( = ?auto_612533 ?auto_612549 ) ) ( not ( = ?auto_612534 ?auto_612535 ) ) ( not ( = ?auto_612534 ?auto_612536 ) ) ( not ( = ?auto_612534 ?auto_612537 ) ) ( not ( = ?auto_612534 ?auto_612538 ) ) ( not ( = ?auto_612534 ?auto_612539 ) ) ( not ( = ?auto_612534 ?auto_612540 ) ) ( not ( = ?auto_612534 ?auto_612541 ) ) ( not ( = ?auto_612534 ?auto_612542 ) ) ( not ( = ?auto_612534 ?auto_612543 ) ) ( not ( = ?auto_612534 ?auto_612544 ) ) ( not ( = ?auto_612534 ?auto_612545 ) ) ( not ( = ?auto_612534 ?auto_612546 ) ) ( not ( = ?auto_612534 ?auto_612547 ) ) ( not ( = ?auto_612534 ?auto_612548 ) ) ( not ( = ?auto_612534 ?auto_612549 ) ) ( not ( = ?auto_612535 ?auto_612536 ) ) ( not ( = ?auto_612535 ?auto_612537 ) ) ( not ( = ?auto_612535 ?auto_612538 ) ) ( not ( = ?auto_612535 ?auto_612539 ) ) ( not ( = ?auto_612535 ?auto_612540 ) ) ( not ( = ?auto_612535 ?auto_612541 ) ) ( not ( = ?auto_612535 ?auto_612542 ) ) ( not ( = ?auto_612535 ?auto_612543 ) ) ( not ( = ?auto_612535 ?auto_612544 ) ) ( not ( = ?auto_612535 ?auto_612545 ) ) ( not ( = ?auto_612535 ?auto_612546 ) ) ( not ( = ?auto_612535 ?auto_612547 ) ) ( not ( = ?auto_612535 ?auto_612548 ) ) ( not ( = ?auto_612535 ?auto_612549 ) ) ( not ( = ?auto_612536 ?auto_612537 ) ) ( not ( = ?auto_612536 ?auto_612538 ) ) ( not ( = ?auto_612536 ?auto_612539 ) ) ( not ( = ?auto_612536 ?auto_612540 ) ) ( not ( = ?auto_612536 ?auto_612541 ) ) ( not ( = ?auto_612536 ?auto_612542 ) ) ( not ( = ?auto_612536 ?auto_612543 ) ) ( not ( = ?auto_612536 ?auto_612544 ) ) ( not ( = ?auto_612536 ?auto_612545 ) ) ( not ( = ?auto_612536 ?auto_612546 ) ) ( not ( = ?auto_612536 ?auto_612547 ) ) ( not ( = ?auto_612536 ?auto_612548 ) ) ( not ( = ?auto_612536 ?auto_612549 ) ) ( not ( = ?auto_612537 ?auto_612538 ) ) ( not ( = ?auto_612537 ?auto_612539 ) ) ( not ( = ?auto_612537 ?auto_612540 ) ) ( not ( = ?auto_612537 ?auto_612541 ) ) ( not ( = ?auto_612537 ?auto_612542 ) ) ( not ( = ?auto_612537 ?auto_612543 ) ) ( not ( = ?auto_612537 ?auto_612544 ) ) ( not ( = ?auto_612537 ?auto_612545 ) ) ( not ( = ?auto_612537 ?auto_612546 ) ) ( not ( = ?auto_612537 ?auto_612547 ) ) ( not ( = ?auto_612537 ?auto_612548 ) ) ( not ( = ?auto_612537 ?auto_612549 ) ) ( not ( = ?auto_612538 ?auto_612539 ) ) ( not ( = ?auto_612538 ?auto_612540 ) ) ( not ( = ?auto_612538 ?auto_612541 ) ) ( not ( = ?auto_612538 ?auto_612542 ) ) ( not ( = ?auto_612538 ?auto_612543 ) ) ( not ( = ?auto_612538 ?auto_612544 ) ) ( not ( = ?auto_612538 ?auto_612545 ) ) ( not ( = ?auto_612538 ?auto_612546 ) ) ( not ( = ?auto_612538 ?auto_612547 ) ) ( not ( = ?auto_612538 ?auto_612548 ) ) ( not ( = ?auto_612538 ?auto_612549 ) ) ( not ( = ?auto_612539 ?auto_612540 ) ) ( not ( = ?auto_612539 ?auto_612541 ) ) ( not ( = ?auto_612539 ?auto_612542 ) ) ( not ( = ?auto_612539 ?auto_612543 ) ) ( not ( = ?auto_612539 ?auto_612544 ) ) ( not ( = ?auto_612539 ?auto_612545 ) ) ( not ( = ?auto_612539 ?auto_612546 ) ) ( not ( = ?auto_612539 ?auto_612547 ) ) ( not ( = ?auto_612539 ?auto_612548 ) ) ( not ( = ?auto_612539 ?auto_612549 ) ) ( not ( = ?auto_612540 ?auto_612541 ) ) ( not ( = ?auto_612540 ?auto_612542 ) ) ( not ( = ?auto_612540 ?auto_612543 ) ) ( not ( = ?auto_612540 ?auto_612544 ) ) ( not ( = ?auto_612540 ?auto_612545 ) ) ( not ( = ?auto_612540 ?auto_612546 ) ) ( not ( = ?auto_612540 ?auto_612547 ) ) ( not ( = ?auto_612540 ?auto_612548 ) ) ( not ( = ?auto_612540 ?auto_612549 ) ) ( not ( = ?auto_612541 ?auto_612542 ) ) ( not ( = ?auto_612541 ?auto_612543 ) ) ( not ( = ?auto_612541 ?auto_612544 ) ) ( not ( = ?auto_612541 ?auto_612545 ) ) ( not ( = ?auto_612541 ?auto_612546 ) ) ( not ( = ?auto_612541 ?auto_612547 ) ) ( not ( = ?auto_612541 ?auto_612548 ) ) ( not ( = ?auto_612541 ?auto_612549 ) ) ( not ( = ?auto_612542 ?auto_612543 ) ) ( not ( = ?auto_612542 ?auto_612544 ) ) ( not ( = ?auto_612542 ?auto_612545 ) ) ( not ( = ?auto_612542 ?auto_612546 ) ) ( not ( = ?auto_612542 ?auto_612547 ) ) ( not ( = ?auto_612542 ?auto_612548 ) ) ( not ( = ?auto_612542 ?auto_612549 ) ) ( not ( = ?auto_612543 ?auto_612544 ) ) ( not ( = ?auto_612543 ?auto_612545 ) ) ( not ( = ?auto_612543 ?auto_612546 ) ) ( not ( = ?auto_612543 ?auto_612547 ) ) ( not ( = ?auto_612543 ?auto_612548 ) ) ( not ( = ?auto_612543 ?auto_612549 ) ) ( not ( = ?auto_612544 ?auto_612545 ) ) ( not ( = ?auto_612544 ?auto_612546 ) ) ( not ( = ?auto_612544 ?auto_612547 ) ) ( not ( = ?auto_612544 ?auto_612548 ) ) ( not ( = ?auto_612544 ?auto_612549 ) ) ( not ( = ?auto_612545 ?auto_612546 ) ) ( not ( = ?auto_612545 ?auto_612547 ) ) ( not ( = ?auto_612545 ?auto_612548 ) ) ( not ( = ?auto_612545 ?auto_612549 ) ) ( not ( = ?auto_612546 ?auto_612547 ) ) ( not ( = ?auto_612546 ?auto_612548 ) ) ( not ( = ?auto_612546 ?auto_612549 ) ) ( not ( = ?auto_612547 ?auto_612548 ) ) ( not ( = ?auto_612547 ?auto_612549 ) ) ( not ( = ?auto_612548 ?auto_612549 ) ) ( ON ?auto_612548 ?auto_612549 ) ( ON ?auto_612547 ?auto_612548 ) ( ON ?auto_612546 ?auto_612547 ) ( ON ?auto_612545 ?auto_612546 ) ( ON ?auto_612544 ?auto_612545 ) ( ON ?auto_612543 ?auto_612544 ) ( ON ?auto_612542 ?auto_612543 ) ( ON ?auto_612541 ?auto_612542 ) ( ON ?auto_612540 ?auto_612541 ) ( ON ?auto_612539 ?auto_612540 ) ( ON ?auto_612538 ?auto_612539 ) ( ON ?auto_612537 ?auto_612538 ) ( CLEAR ?auto_612535 ) ( ON ?auto_612536 ?auto_612537 ) ( CLEAR ?auto_612536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_612533 ?auto_612534 ?auto_612535 ?auto_612536 )
      ( MAKE-17PILE ?auto_612533 ?auto_612534 ?auto_612535 ?auto_612536 ?auto_612537 ?auto_612538 ?auto_612539 ?auto_612540 ?auto_612541 ?auto_612542 ?auto_612543 ?auto_612544 ?auto_612545 ?auto_612546 ?auto_612547 ?auto_612548 ?auto_612549 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612567 - BLOCK
      ?auto_612568 - BLOCK
      ?auto_612569 - BLOCK
      ?auto_612570 - BLOCK
      ?auto_612571 - BLOCK
      ?auto_612572 - BLOCK
      ?auto_612573 - BLOCK
      ?auto_612574 - BLOCK
      ?auto_612575 - BLOCK
      ?auto_612576 - BLOCK
      ?auto_612577 - BLOCK
      ?auto_612578 - BLOCK
      ?auto_612579 - BLOCK
      ?auto_612580 - BLOCK
      ?auto_612581 - BLOCK
      ?auto_612582 - BLOCK
      ?auto_612583 - BLOCK
    )
    :vars
    (
      ?auto_612584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612583 ?auto_612584 ) ( ON-TABLE ?auto_612567 ) ( ON ?auto_612568 ?auto_612567 ) ( not ( = ?auto_612567 ?auto_612568 ) ) ( not ( = ?auto_612567 ?auto_612569 ) ) ( not ( = ?auto_612567 ?auto_612570 ) ) ( not ( = ?auto_612567 ?auto_612571 ) ) ( not ( = ?auto_612567 ?auto_612572 ) ) ( not ( = ?auto_612567 ?auto_612573 ) ) ( not ( = ?auto_612567 ?auto_612574 ) ) ( not ( = ?auto_612567 ?auto_612575 ) ) ( not ( = ?auto_612567 ?auto_612576 ) ) ( not ( = ?auto_612567 ?auto_612577 ) ) ( not ( = ?auto_612567 ?auto_612578 ) ) ( not ( = ?auto_612567 ?auto_612579 ) ) ( not ( = ?auto_612567 ?auto_612580 ) ) ( not ( = ?auto_612567 ?auto_612581 ) ) ( not ( = ?auto_612567 ?auto_612582 ) ) ( not ( = ?auto_612567 ?auto_612583 ) ) ( not ( = ?auto_612567 ?auto_612584 ) ) ( not ( = ?auto_612568 ?auto_612569 ) ) ( not ( = ?auto_612568 ?auto_612570 ) ) ( not ( = ?auto_612568 ?auto_612571 ) ) ( not ( = ?auto_612568 ?auto_612572 ) ) ( not ( = ?auto_612568 ?auto_612573 ) ) ( not ( = ?auto_612568 ?auto_612574 ) ) ( not ( = ?auto_612568 ?auto_612575 ) ) ( not ( = ?auto_612568 ?auto_612576 ) ) ( not ( = ?auto_612568 ?auto_612577 ) ) ( not ( = ?auto_612568 ?auto_612578 ) ) ( not ( = ?auto_612568 ?auto_612579 ) ) ( not ( = ?auto_612568 ?auto_612580 ) ) ( not ( = ?auto_612568 ?auto_612581 ) ) ( not ( = ?auto_612568 ?auto_612582 ) ) ( not ( = ?auto_612568 ?auto_612583 ) ) ( not ( = ?auto_612568 ?auto_612584 ) ) ( not ( = ?auto_612569 ?auto_612570 ) ) ( not ( = ?auto_612569 ?auto_612571 ) ) ( not ( = ?auto_612569 ?auto_612572 ) ) ( not ( = ?auto_612569 ?auto_612573 ) ) ( not ( = ?auto_612569 ?auto_612574 ) ) ( not ( = ?auto_612569 ?auto_612575 ) ) ( not ( = ?auto_612569 ?auto_612576 ) ) ( not ( = ?auto_612569 ?auto_612577 ) ) ( not ( = ?auto_612569 ?auto_612578 ) ) ( not ( = ?auto_612569 ?auto_612579 ) ) ( not ( = ?auto_612569 ?auto_612580 ) ) ( not ( = ?auto_612569 ?auto_612581 ) ) ( not ( = ?auto_612569 ?auto_612582 ) ) ( not ( = ?auto_612569 ?auto_612583 ) ) ( not ( = ?auto_612569 ?auto_612584 ) ) ( not ( = ?auto_612570 ?auto_612571 ) ) ( not ( = ?auto_612570 ?auto_612572 ) ) ( not ( = ?auto_612570 ?auto_612573 ) ) ( not ( = ?auto_612570 ?auto_612574 ) ) ( not ( = ?auto_612570 ?auto_612575 ) ) ( not ( = ?auto_612570 ?auto_612576 ) ) ( not ( = ?auto_612570 ?auto_612577 ) ) ( not ( = ?auto_612570 ?auto_612578 ) ) ( not ( = ?auto_612570 ?auto_612579 ) ) ( not ( = ?auto_612570 ?auto_612580 ) ) ( not ( = ?auto_612570 ?auto_612581 ) ) ( not ( = ?auto_612570 ?auto_612582 ) ) ( not ( = ?auto_612570 ?auto_612583 ) ) ( not ( = ?auto_612570 ?auto_612584 ) ) ( not ( = ?auto_612571 ?auto_612572 ) ) ( not ( = ?auto_612571 ?auto_612573 ) ) ( not ( = ?auto_612571 ?auto_612574 ) ) ( not ( = ?auto_612571 ?auto_612575 ) ) ( not ( = ?auto_612571 ?auto_612576 ) ) ( not ( = ?auto_612571 ?auto_612577 ) ) ( not ( = ?auto_612571 ?auto_612578 ) ) ( not ( = ?auto_612571 ?auto_612579 ) ) ( not ( = ?auto_612571 ?auto_612580 ) ) ( not ( = ?auto_612571 ?auto_612581 ) ) ( not ( = ?auto_612571 ?auto_612582 ) ) ( not ( = ?auto_612571 ?auto_612583 ) ) ( not ( = ?auto_612571 ?auto_612584 ) ) ( not ( = ?auto_612572 ?auto_612573 ) ) ( not ( = ?auto_612572 ?auto_612574 ) ) ( not ( = ?auto_612572 ?auto_612575 ) ) ( not ( = ?auto_612572 ?auto_612576 ) ) ( not ( = ?auto_612572 ?auto_612577 ) ) ( not ( = ?auto_612572 ?auto_612578 ) ) ( not ( = ?auto_612572 ?auto_612579 ) ) ( not ( = ?auto_612572 ?auto_612580 ) ) ( not ( = ?auto_612572 ?auto_612581 ) ) ( not ( = ?auto_612572 ?auto_612582 ) ) ( not ( = ?auto_612572 ?auto_612583 ) ) ( not ( = ?auto_612572 ?auto_612584 ) ) ( not ( = ?auto_612573 ?auto_612574 ) ) ( not ( = ?auto_612573 ?auto_612575 ) ) ( not ( = ?auto_612573 ?auto_612576 ) ) ( not ( = ?auto_612573 ?auto_612577 ) ) ( not ( = ?auto_612573 ?auto_612578 ) ) ( not ( = ?auto_612573 ?auto_612579 ) ) ( not ( = ?auto_612573 ?auto_612580 ) ) ( not ( = ?auto_612573 ?auto_612581 ) ) ( not ( = ?auto_612573 ?auto_612582 ) ) ( not ( = ?auto_612573 ?auto_612583 ) ) ( not ( = ?auto_612573 ?auto_612584 ) ) ( not ( = ?auto_612574 ?auto_612575 ) ) ( not ( = ?auto_612574 ?auto_612576 ) ) ( not ( = ?auto_612574 ?auto_612577 ) ) ( not ( = ?auto_612574 ?auto_612578 ) ) ( not ( = ?auto_612574 ?auto_612579 ) ) ( not ( = ?auto_612574 ?auto_612580 ) ) ( not ( = ?auto_612574 ?auto_612581 ) ) ( not ( = ?auto_612574 ?auto_612582 ) ) ( not ( = ?auto_612574 ?auto_612583 ) ) ( not ( = ?auto_612574 ?auto_612584 ) ) ( not ( = ?auto_612575 ?auto_612576 ) ) ( not ( = ?auto_612575 ?auto_612577 ) ) ( not ( = ?auto_612575 ?auto_612578 ) ) ( not ( = ?auto_612575 ?auto_612579 ) ) ( not ( = ?auto_612575 ?auto_612580 ) ) ( not ( = ?auto_612575 ?auto_612581 ) ) ( not ( = ?auto_612575 ?auto_612582 ) ) ( not ( = ?auto_612575 ?auto_612583 ) ) ( not ( = ?auto_612575 ?auto_612584 ) ) ( not ( = ?auto_612576 ?auto_612577 ) ) ( not ( = ?auto_612576 ?auto_612578 ) ) ( not ( = ?auto_612576 ?auto_612579 ) ) ( not ( = ?auto_612576 ?auto_612580 ) ) ( not ( = ?auto_612576 ?auto_612581 ) ) ( not ( = ?auto_612576 ?auto_612582 ) ) ( not ( = ?auto_612576 ?auto_612583 ) ) ( not ( = ?auto_612576 ?auto_612584 ) ) ( not ( = ?auto_612577 ?auto_612578 ) ) ( not ( = ?auto_612577 ?auto_612579 ) ) ( not ( = ?auto_612577 ?auto_612580 ) ) ( not ( = ?auto_612577 ?auto_612581 ) ) ( not ( = ?auto_612577 ?auto_612582 ) ) ( not ( = ?auto_612577 ?auto_612583 ) ) ( not ( = ?auto_612577 ?auto_612584 ) ) ( not ( = ?auto_612578 ?auto_612579 ) ) ( not ( = ?auto_612578 ?auto_612580 ) ) ( not ( = ?auto_612578 ?auto_612581 ) ) ( not ( = ?auto_612578 ?auto_612582 ) ) ( not ( = ?auto_612578 ?auto_612583 ) ) ( not ( = ?auto_612578 ?auto_612584 ) ) ( not ( = ?auto_612579 ?auto_612580 ) ) ( not ( = ?auto_612579 ?auto_612581 ) ) ( not ( = ?auto_612579 ?auto_612582 ) ) ( not ( = ?auto_612579 ?auto_612583 ) ) ( not ( = ?auto_612579 ?auto_612584 ) ) ( not ( = ?auto_612580 ?auto_612581 ) ) ( not ( = ?auto_612580 ?auto_612582 ) ) ( not ( = ?auto_612580 ?auto_612583 ) ) ( not ( = ?auto_612580 ?auto_612584 ) ) ( not ( = ?auto_612581 ?auto_612582 ) ) ( not ( = ?auto_612581 ?auto_612583 ) ) ( not ( = ?auto_612581 ?auto_612584 ) ) ( not ( = ?auto_612582 ?auto_612583 ) ) ( not ( = ?auto_612582 ?auto_612584 ) ) ( not ( = ?auto_612583 ?auto_612584 ) ) ( ON ?auto_612582 ?auto_612583 ) ( ON ?auto_612581 ?auto_612582 ) ( ON ?auto_612580 ?auto_612581 ) ( ON ?auto_612579 ?auto_612580 ) ( ON ?auto_612578 ?auto_612579 ) ( ON ?auto_612577 ?auto_612578 ) ( ON ?auto_612576 ?auto_612577 ) ( ON ?auto_612575 ?auto_612576 ) ( ON ?auto_612574 ?auto_612575 ) ( ON ?auto_612573 ?auto_612574 ) ( ON ?auto_612572 ?auto_612573 ) ( ON ?auto_612571 ?auto_612572 ) ( ON ?auto_612570 ?auto_612571 ) ( CLEAR ?auto_612568 ) ( ON ?auto_612569 ?auto_612570 ) ( CLEAR ?auto_612569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_612567 ?auto_612568 ?auto_612569 )
      ( MAKE-17PILE ?auto_612567 ?auto_612568 ?auto_612569 ?auto_612570 ?auto_612571 ?auto_612572 ?auto_612573 ?auto_612574 ?auto_612575 ?auto_612576 ?auto_612577 ?auto_612578 ?auto_612579 ?auto_612580 ?auto_612581 ?auto_612582 ?auto_612583 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612602 - BLOCK
      ?auto_612603 - BLOCK
      ?auto_612604 - BLOCK
      ?auto_612605 - BLOCK
      ?auto_612606 - BLOCK
      ?auto_612607 - BLOCK
      ?auto_612608 - BLOCK
      ?auto_612609 - BLOCK
      ?auto_612610 - BLOCK
      ?auto_612611 - BLOCK
      ?auto_612612 - BLOCK
      ?auto_612613 - BLOCK
      ?auto_612614 - BLOCK
      ?auto_612615 - BLOCK
      ?auto_612616 - BLOCK
      ?auto_612617 - BLOCK
      ?auto_612618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612618 ) ( ON-TABLE ?auto_612602 ) ( ON ?auto_612603 ?auto_612602 ) ( not ( = ?auto_612602 ?auto_612603 ) ) ( not ( = ?auto_612602 ?auto_612604 ) ) ( not ( = ?auto_612602 ?auto_612605 ) ) ( not ( = ?auto_612602 ?auto_612606 ) ) ( not ( = ?auto_612602 ?auto_612607 ) ) ( not ( = ?auto_612602 ?auto_612608 ) ) ( not ( = ?auto_612602 ?auto_612609 ) ) ( not ( = ?auto_612602 ?auto_612610 ) ) ( not ( = ?auto_612602 ?auto_612611 ) ) ( not ( = ?auto_612602 ?auto_612612 ) ) ( not ( = ?auto_612602 ?auto_612613 ) ) ( not ( = ?auto_612602 ?auto_612614 ) ) ( not ( = ?auto_612602 ?auto_612615 ) ) ( not ( = ?auto_612602 ?auto_612616 ) ) ( not ( = ?auto_612602 ?auto_612617 ) ) ( not ( = ?auto_612602 ?auto_612618 ) ) ( not ( = ?auto_612603 ?auto_612604 ) ) ( not ( = ?auto_612603 ?auto_612605 ) ) ( not ( = ?auto_612603 ?auto_612606 ) ) ( not ( = ?auto_612603 ?auto_612607 ) ) ( not ( = ?auto_612603 ?auto_612608 ) ) ( not ( = ?auto_612603 ?auto_612609 ) ) ( not ( = ?auto_612603 ?auto_612610 ) ) ( not ( = ?auto_612603 ?auto_612611 ) ) ( not ( = ?auto_612603 ?auto_612612 ) ) ( not ( = ?auto_612603 ?auto_612613 ) ) ( not ( = ?auto_612603 ?auto_612614 ) ) ( not ( = ?auto_612603 ?auto_612615 ) ) ( not ( = ?auto_612603 ?auto_612616 ) ) ( not ( = ?auto_612603 ?auto_612617 ) ) ( not ( = ?auto_612603 ?auto_612618 ) ) ( not ( = ?auto_612604 ?auto_612605 ) ) ( not ( = ?auto_612604 ?auto_612606 ) ) ( not ( = ?auto_612604 ?auto_612607 ) ) ( not ( = ?auto_612604 ?auto_612608 ) ) ( not ( = ?auto_612604 ?auto_612609 ) ) ( not ( = ?auto_612604 ?auto_612610 ) ) ( not ( = ?auto_612604 ?auto_612611 ) ) ( not ( = ?auto_612604 ?auto_612612 ) ) ( not ( = ?auto_612604 ?auto_612613 ) ) ( not ( = ?auto_612604 ?auto_612614 ) ) ( not ( = ?auto_612604 ?auto_612615 ) ) ( not ( = ?auto_612604 ?auto_612616 ) ) ( not ( = ?auto_612604 ?auto_612617 ) ) ( not ( = ?auto_612604 ?auto_612618 ) ) ( not ( = ?auto_612605 ?auto_612606 ) ) ( not ( = ?auto_612605 ?auto_612607 ) ) ( not ( = ?auto_612605 ?auto_612608 ) ) ( not ( = ?auto_612605 ?auto_612609 ) ) ( not ( = ?auto_612605 ?auto_612610 ) ) ( not ( = ?auto_612605 ?auto_612611 ) ) ( not ( = ?auto_612605 ?auto_612612 ) ) ( not ( = ?auto_612605 ?auto_612613 ) ) ( not ( = ?auto_612605 ?auto_612614 ) ) ( not ( = ?auto_612605 ?auto_612615 ) ) ( not ( = ?auto_612605 ?auto_612616 ) ) ( not ( = ?auto_612605 ?auto_612617 ) ) ( not ( = ?auto_612605 ?auto_612618 ) ) ( not ( = ?auto_612606 ?auto_612607 ) ) ( not ( = ?auto_612606 ?auto_612608 ) ) ( not ( = ?auto_612606 ?auto_612609 ) ) ( not ( = ?auto_612606 ?auto_612610 ) ) ( not ( = ?auto_612606 ?auto_612611 ) ) ( not ( = ?auto_612606 ?auto_612612 ) ) ( not ( = ?auto_612606 ?auto_612613 ) ) ( not ( = ?auto_612606 ?auto_612614 ) ) ( not ( = ?auto_612606 ?auto_612615 ) ) ( not ( = ?auto_612606 ?auto_612616 ) ) ( not ( = ?auto_612606 ?auto_612617 ) ) ( not ( = ?auto_612606 ?auto_612618 ) ) ( not ( = ?auto_612607 ?auto_612608 ) ) ( not ( = ?auto_612607 ?auto_612609 ) ) ( not ( = ?auto_612607 ?auto_612610 ) ) ( not ( = ?auto_612607 ?auto_612611 ) ) ( not ( = ?auto_612607 ?auto_612612 ) ) ( not ( = ?auto_612607 ?auto_612613 ) ) ( not ( = ?auto_612607 ?auto_612614 ) ) ( not ( = ?auto_612607 ?auto_612615 ) ) ( not ( = ?auto_612607 ?auto_612616 ) ) ( not ( = ?auto_612607 ?auto_612617 ) ) ( not ( = ?auto_612607 ?auto_612618 ) ) ( not ( = ?auto_612608 ?auto_612609 ) ) ( not ( = ?auto_612608 ?auto_612610 ) ) ( not ( = ?auto_612608 ?auto_612611 ) ) ( not ( = ?auto_612608 ?auto_612612 ) ) ( not ( = ?auto_612608 ?auto_612613 ) ) ( not ( = ?auto_612608 ?auto_612614 ) ) ( not ( = ?auto_612608 ?auto_612615 ) ) ( not ( = ?auto_612608 ?auto_612616 ) ) ( not ( = ?auto_612608 ?auto_612617 ) ) ( not ( = ?auto_612608 ?auto_612618 ) ) ( not ( = ?auto_612609 ?auto_612610 ) ) ( not ( = ?auto_612609 ?auto_612611 ) ) ( not ( = ?auto_612609 ?auto_612612 ) ) ( not ( = ?auto_612609 ?auto_612613 ) ) ( not ( = ?auto_612609 ?auto_612614 ) ) ( not ( = ?auto_612609 ?auto_612615 ) ) ( not ( = ?auto_612609 ?auto_612616 ) ) ( not ( = ?auto_612609 ?auto_612617 ) ) ( not ( = ?auto_612609 ?auto_612618 ) ) ( not ( = ?auto_612610 ?auto_612611 ) ) ( not ( = ?auto_612610 ?auto_612612 ) ) ( not ( = ?auto_612610 ?auto_612613 ) ) ( not ( = ?auto_612610 ?auto_612614 ) ) ( not ( = ?auto_612610 ?auto_612615 ) ) ( not ( = ?auto_612610 ?auto_612616 ) ) ( not ( = ?auto_612610 ?auto_612617 ) ) ( not ( = ?auto_612610 ?auto_612618 ) ) ( not ( = ?auto_612611 ?auto_612612 ) ) ( not ( = ?auto_612611 ?auto_612613 ) ) ( not ( = ?auto_612611 ?auto_612614 ) ) ( not ( = ?auto_612611 ?auto_612615 ) ) ( not ( = ?auto_612611 ?auto_612616 ) ) ( not ( = ?auto_612611 ?auto_612617 ) ) ( not ( = ?auto_612611 ?auto_612618 ) ) ( not ( = ?auto_612612 ?auto_612613 ) ) ( not ( = ?auto_612612 ?auto_612614 ) ) ( not ( = ?auto_612612 ?auto_612615 ) ) ( not ( = ?auto_612612 ?auto_612616 ) ) ( not ( = ?auto_612612 ?auto_612617 ) ) ( not ( = ?auto_612612 ?auto_612618 ) ) ( not ( = ?auto_612613 ?auto_612614 ) ) ( not ( = ?auto_612613 ?auto_612615 ) ) ( not ( = ?auto_612613 ?auto_612616 ) ) ( not ( = ?auto_612613 ?auto_612617 ) ) ( not ( = ?auto_612613 ?auto_612618 ) ) ( not ( = ?auto_612614 ?auto_612615 ) ) ( not ( = ?auto_612614 ?auto_612616 ) ) ( not ( = ?auto_612614 ?auto_612617 ) ) ( not ( = ?auto_612614 ?auto_612618 ) ) ( not ( = ?auto_612615 ?auto_612616 ) ) ( not ( = ?auto_612615 ?auto_612617 ) ) ( not ( = ?auto_612615 ?auto_612618 ) ) ( not ( = ?auto_612616 ?auto_612617 ) ) ( not ( = ?auto_612616 ?auto_612618 ) ) ( not ( = ?auto_612617 ?auto_612618 ) ) ( ON ?auto_612617 ?auto_612618 ) ( ON ?auto_612616 ?auto_612617 ) ( ON ?auto_612615 ?auto_612616 ) ( ON ?auto_612614 ?auto_612615 ) ( ON ?auto_612613 ?auto_612614 ) ( ON ?auto_612612 ?auto_612613 ) ( ON ?auto_612611 ?auto_612612 ) ( ON ?auto_612610 ?auto_612611 ) ( ON ?auto_612609 ?auto_612610 ) ( ON ?auto_612608 ?auto_612609 ) ( ON ?auto_612607 ?auto_612608 ) ( ON ?auto_612606 ?auto_612607 ) ( ON ?auto_612605 ?auto_612606 ) ( CLEAR ?auto_612603 ) ( ON ?auto_612604 ?auto_612605 ) ( CLEAR ?auto_612604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_612602 ?auto_612603 ?auto_612604 )
      ( MAKE-17PILE ?auto_612602 ?auto_612603 ?auto_612604 ?auto_612605 ?auto_612606 ?auto_612607 ?auto_612608 ?auto_612609 ?auto_612610 ?auto_612611 ?auto_612612 ?auto_612613 ?auto_612614 ?auto_612615 ?auto_612616 ?auto_612617 ?auto_612618 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612636 - BLOCK
      ?auto_612637 - BLOCK
      ?auto_612638 - BLOCK
      ?auto_612639 - BLOCK
      ?auto_612640 - BLOCK
      ?auto_612641 - BLOCK
      ?auto_612642 - BLOCK
      ?auto_612643 - BLOCK
      ?auto_612644 - BLOCK
      ?auto_612645 - BLOCK
      ?auto_612646 - BLOCK
      ?auto_612647 - BLOCK
      ?auto_612648 - BLOCK
      ?auto_612649 - BLOCK
      ?auto_612650 - BLOCK
      ?auto_612651 - BLOCK
      ?auto_612652 - BLOCK
    )
    :vars
    (
      ?auto_612653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612652 ?auto_612653 ) ( ON-TABLE ?auto_612636 ) ( not ( = ?auto_612636 ?auto_612637 ) ) ( not ( = ?auto_612636 ?auto_612638 ) ) ( not ( = ?auto_612636 ?auto_612639 ) ) ( not ( = ?auto_612636 ?auto_612640 ) ) ( not ( = ?auto_612636 ?auto_612641 ) ) ( not ( = ?auto_612636 ?auto_612642 ) ) ( not ( = ?auto_612636 ?auto_612643 ) ) ( not ( = ?auto_612636 ?auto_612644 ) ) ( not ( = ?auto_612636 ?auto_612645 ) ) ( not ( = ?auto_612636 ?auto_612646 ) ) ( not ( = ?auto_612636 ?auto_612647 ) ) ( not ( = ?auto_612636 ?auto_612648 ) ) ( not ( = ?auto_612636 ?auto_612649 ) ) ( not ( = ?auto_612636 ?auto_612650 ) ) ( not ( = ?auto_612636 ?auto_612651 ) ) ( not ( = ?auto_612636 ?auto_612652 ) ) ( not ( = ?auto_612636 ?auto_612653 ) ) ( not ( = ?auto_612637 ?auto_612638 ) ) ( not ( = ?auto_612637 ?auto_612639 ) ) ( not ( = ?auto_612637 ?auto_612640 ) ) ( not ( = ?auto_612637 ?auto_612641 ) ) ( not ( = ?auto_612637 ?auto_612642 ) ) ( not ( = ?auto_612637 ?auto_612643 ) ) ( not ( = ?auto_612637 ?auto_612644 ) ) ( not ( = ?auto_612637 ?auto_612645 ) ) ( not ( = ?auto_612637 ?auto_612646 ) ) ( not ( = ?auto_612637 ?auto_612647 ) ) ( not ( = ?auto_612637 ?auto_612648 ) ) ( not ( = ?auto_612637 ?auto_612649 ) ) ( not ( = ?auto_612637 ?auto_612650 ) ) ( not ( = ?auto_612637 ?auto_612651 ) ) ( not ( = ?auto_612637 ?auto_612652 ) ) ( not ( = ?auto_612637 ?auto_612653 ) ) ( not ( = ?auto_612638 ?auto_612639 ) ) ( not ( = ?auto_612638 ?auto_612640 ) ) ( not ( = ?auto_612638 ?auto_612641 ) ) ( not ( = ?auto_612638 ?auto_612642 ) ) ( not ( = ?auto_612638 ?auto_612643 ) ) ( not ( = ?auto_612638 ?auto_612644 ) ) ( not ( = ?auto_612638 ?auto_612645 ) ) ( not ( = ?auto_612638 ?auto_612646 ) ) ( not ( = ?auto_612638 ?auto_612647 ) ) ( not ( = ?auto_612638 ?auto_612648 ) ) ( not ( = ?auto_612638 ?auto_612649 ) ) ( not ( = ?auto_612638 ?auto_612650 ) ) ( not ( = ?auto_612638 ?auto_612651 ) ) ( not ( = ?auto_612638 ?auto_612652 ) ) ( not ( = ?auto_612638 ?auto_612653 ) ) ( not ( = ?auto_612639 ?auto_612640 ) ) ( not ( = ?auto_612639 ?auto_612641 ) ) ( not ( = ?auto_612639 ?auto_612642 ) ) ( not ( = ?auto_612639 ?auto_612643 ) ) ( not ( = ?auto_612639 ?auto_612644 ) ) ( not ( = ?auto_612639 ?auto_612645 ) ) ( not ( = ?auto_612639 ?auto_612646 ) ) ( not ( = ?auto_612639 ?auto_612647 ) ) ( not ( = ?auto_612639 ?auto_612648 ) ) ( not ( = ?auto_612639 ?auto_612649 ) ) ( not ( = ?auto_612639 ?auto_612650 ) ) ( not ( = ?auto_612639 ?auto_612651 ) ) ( not ( = ?auto_612639 ?auto_612652 ) ) ( not ( = ?auto_612639 ?auto_612653 ) ) ( not ( = ?auto_612640 ?auto_612641 ) ) ( not ( = ?auto_612640 ?auto_612642 ) ) ( not ( = ?auto_612640 ?auto_612643 ) ) ( not ( = ?auto_612640 ?auto_612644 ) ) ( not ( = ?auto_612640 ?auto_612645 ) ) ( not ( = ?auto_612640 ?auto_612646 ) ) ( not ( = ?auto_612640 ?auto_612647 ) ) ( not ( = ?auto_612640 ?auto_612648 ) ) ( not ( = ?auto_612640 ?auto_612649 ) ) ( not ( = ?auto_612640 ?auto_612650 ) ) ( not ( = ?auto_612640 ?auto_612651 ) ) ( not ( = ?auto_612640 ?auto_612652 ) ) ( not ( = ?auto_612640 ?auto_612653 ) ) ( not ( = ?auto_612641 ?auto_612642 ) ) ( not ( = ?auto_612641 ?auto_612643 ) ) ( not ( = ?auto_612641 ?auto_612644 ) ) ( not ( = ?auto_612641 ?auto_612645 ) ) ( not ( = ?auto_612641 ?auto_612646 ) ) ( not ( = ?auto_612641 ?auto_612647 ) ) ( not ( = ?auto_612641 ?auto_612648 ) ) ( not ( = ?auto_612641 ?auto_612649 ) ) ( not ( = ?auto_612641 ?auto_612650 ) ) ( not ( = ?auto_612641 ?auto_612651 ) ) ( not ( = ?auto_612641 ?auto_612652 ) ) ( not ( = ?auto_612641 ?auto_612653 ) ) ( not ( = ?auto_612642 ?auto_612643 ) ) ( not ( = ?auto_612642 ?auto_612644 ) ) ( not ( = ?auto_612642 ?auto_612645 ) ) ( not ( = ?auto_612642 ?auto_612646 ) ) ( not ( = ?auto_612642 ?auto_612647 ) ) ( not ( = ?auto_612642 ?auto_612648 ) ) ( not ( = ?auto_612642 ?auto_612649 ) ) ( not ( = ?auto_612642 ?auto_612650 ) ) ( not ( = ?auto_612642 ?auto_612651 ) ) ( not ( = ?auto_612642 ?auto_612652 ) ) ( not ( = ?auto_612642 ?auto_612653 ) ) ( not ( = ?auto_612643 ?auto_612644 ) ) ( not ( = ?auto_612643 ?auto_612645 ) ) ( not ( = ?auto_612643 ?auto_612646 ) ) ( not ( = ?auto_612643 ?auto_612647 ) ) ( not ( = ?auto_612643 ?auto_612648 ) ) ( not ( = ?auto_612643 ?auto_612649 ) ) ( not ( = ?auto_612643 ?auto_612650 ) ) ( not ( = ?auto_612643 ?auto_612651 ) ) ( not ( = ?auto_612643 ?auto_612652 ) ) ( not ( = ?auto_612643 ?auto_612653 ) ) ( not ( = ?auto_612644 ?auto_612645 ) ) ( not ( = ?auto_612644 ?auto_612646 ) ) ( not ( = ?auto_612644 ?auto_612647 ) ) ( not ( = ?auto_612644 ?auto_612648 ) ) ( not ( = ?auto_612644 ?auto_612649 ) ) ( not ( = ?auto_612644 ?auto_612650 ) ) ( not ( = ?auto_612644 ?auto_612651 ) ) ( not ( = ?auto_612644 ?auto_612652 ) ) ( not ( = ?auto_612644 ?auto_612653 ) ) ( not ( = ?auto_612645 ?auto_612646 ) ) ( not ( = ?auto_612645 ?auto_612647 ) ) ( not ( = ?auto_612645 ?auto_612648 ) ) ( not ( = ?auto_612645 ?auto_612649 ) ) ( not ( = ?auto_612645 ?auto_612650 ) ) ( not ( = ?auto_612645 ?auto_612651 ) ) ( not ( = ?auto_612645 ?auto_612652 ) ) ( not ( = ?auto_612645 ?auto_612653 ) ) ( not ( = ?auto_612646 ?auto_612647 ) ) ( not ( = ?auto_612646 ?auto_612648 ) ) ( not ( = ?auto_612646 ?auto_612649 ) ) ( not ( = ?auto_612646 ?auto_612650 ) ) ( not ( = ?auto_612646 ?auto_612651 ) ) ( not ( = ?auto_612646 ?auto_612652 ) ) ( not ( = ?auto_612646 ?auto_612653 ) ) ( not ( = ?auto_612647 ?auto_612648 ) ) ( not ( = ?auto_612647 ?auto_612649 ) ) ( not ( = ?auto_612647 ?auto_612650 ) ) ( not ( = ?auto_612647 ?auto_612651 ) ) ( not ( = ?auto_612647 ?auto_612652 ) ) ( not ( = ?auto_612647 ?auto_612653 ) ) ( not ( = ?auto_612648 ?auto_612649 ) ) ( not ( = ?auto_612648 ?auto_612650 ) ) ( not ( = ?auto_612648 ?auto_612651 ) ) ( not ( = ?auto_612648 ?auto_612652 ) ) ( not ( = ?auto_612648 ?auto_612653 ) ) ( not ( = ?auto_612649 ?auto_612650 ) ) ( not ( = ?auto_612649 ?auto_612651 ) ) ( not ( = ?auto_612649 ?auto_612652 ) ) ( not ( = ?auto_612649 ?auto_612653 ) ) ( not ( = ?auto_612650 ?auto_612651 ) ) ( not ( = ?auto_612650 ?auto_612652 ) ) ( not ( = ?auto_612650 ?auto_612653 ) ) ( not ( = ?auto_612651 ?auto_612652 ) ) ( not ( = ?auto_612651 ?auto_612653 ) ) ( not ( = ?auto_612652 ?auto_612653 ) ) ( ON ?auto_612651 ?auto_612652 ) ( ON ?auto_612650 ?auto_612651 ) ( ON ?auto_612649 ?auto_612650 ) ( ON ?auto_612648 ?auto_612649 ) ( ON ?auto_612647 ?auto_612648 ) ( ON ?auto_612646 ?auto_612647 ) ( ON ?auto_612645 ?auto_612646 ) ( ON ?auto_612644 ?auto_612645 ) ( ON ?auto_612643 ?auto_612644 ) ( ON ?auto_612642 ?auto_612643 ) ( ON ?auto_612641 ?auto_612642 ) ( ON ?auto_612640 ?auto_612641 ) ( ON ?auto_612639 ?auto_612640 ) ( ON ?auto_612638 ?auto_612639 ) ( CLEAR ?auto_612636 ) ( ON ?auto_612637 ?auto_612638 ) ( CLEAR ?auto_612637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_612636 ?auto_612637 )
      ( MAKE-17PILE ?auto_612636 ?auto_612637 ?auto_612638 ?auto_612639 ?auto_612640 ?auto_612641 ?auto_612642 ?auto_612643 ?auto_612644 ?auto_612645 ?auto_612646 ?auto_612647 ?auto_612648 ?auto_612649 ?auto_612650 ?auto_612651 ?auto_612652 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612671 - BLOCK
      ?auto_612672 - BLOCK
      ?auto_612673 - BLOCK
      ?auto_612674 - BLOCK
      ?auto_612675 - BLOCK
      ?auto_612676 - BLOCK
      ?auto_612677 - BLOCK
      ?auto_612678 - BLOCK
      ?auto_612679 - BLOCK
      ?auto_612680 - BLOCK
      ?auto_612681 - BLOCK
      ?auto_612682 - BLOCK
      ?auto_612683 - BLOCK
      ?auto_612684 - BLOCK
      ?auto_612685 - BLOCK
      ?auto_612686 - BLOCK
      ?auto_612687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612687 ) ( ON-TABLE ?auto_612671 ) ( not ( = ?auto_612671 ?auto_612672 ) ) ( not ( = ?auto_612671 ?auto_612673 ) ) ( not ( = ?auto_612671 ?auto_612674 ) ) ( not ( = ?auto_612671 ?auto_612675 ) ) ( not ( = ?auto_612671 ?auto_612676 ) ) ( not ( = ?auto_612671 ?auto_612677 ) ) ( not ( = ?auto_612671 ?auto_612678 ) ) ( not ( = ?auto_612671 ?auto_612679 ) ) ( not ( = ?auto_612671 ?auto_612680 ) ) ( not ( = ?auto_612671 ?auto_612681 ) ) ( not ( = ?auto_612671 ?auto_612682 ) ) ( not ( = ?auto_612671 ?auto_612683 ) ) ( not ( = ?auto_612671 ?auto_612684 ) ) ( not ( = ?auto_612671 ?auto_612685 ) ) ( not ( = ?auto_612671 ?auto_612686 ) ) ( not ( = ?auto_612671 ?auto_612687 ) ) ( not ( = ?auto_612672 ?auto_612673 ) ) ( not ( = ?auto_612672 ?auto_612674 ) ) ( not ( = ?auto_612672 ?auto_612675 ) ) ( not ( = ?auto_612672 ?auto_612676 ) ) ( not ( = ?auto_612672 ?auto_612677 ) ) ( not ( = ?auto_612672 ?auto_612678 ) ) ( not ( = ?auto_612672 ?auto_612679 ) ) ( not ( = ?auto_612672 ?auto_612680 ) ) ( not ( = ?auto_612672 ?auto_612681 ) ) ( not ( = ?auto_612672 ?auto_612682 ) ) ( not ( = ?auto_612672 ?auto_612683 ) ) ( not ( = ?auto_612672 ?auto_612684 ) ) ( not ( = ?auto_612672 ?auto_612685 ) ) ( not ( = ?auto_612672 ?auto_612686 ) ) ( not ( = ?auto_612672 ?auto_612687 ) ) ( not ( = ?auto_612673 ?auto_612674 ) ) ( not ( = ?auto_612673 ?auto_612675 ) ) ( not ( = ?auto_612673 ?auto_612676 ) ) ( not ( = ?auto_612673 ?auto_612677 ) ) ( not ( = ?auto_612673 ?auto_612678 ) ) ( not ( = ?auto_612673 ?auto_612679 ) ) ( not ( = ?auto_612673 ?auto_612680 ) ) ( not ( = ?auto_612673 ?auto_612681 ) ) ( not ( = ?auto_612673 ?auto_612682 ) ) ( not ( = ?auto_612673 ?auto_612683 ) ) ( not ( = ?auto_612673 ?auto_612684 ) ) ( not ( = ?auto_612673 ?auto_612685 ) ) ( not ( = ?auto_612673 ?auto_612686 ) ) ( not ( = ?auto_612673 ?auto_612687 ) ) ( not ( = ?auto_612674 ?auto_612675 ) ) ( not ( = ?auto_612674 ?auto_612676 ) ) ( not ( = ?auto_612674 ?auto_612677 ) ) ( not ( = ?auto_612674 ?auto_612678 ) ) ( not ( = ?auto_612674 ?auto_612679 ) ) ( not ( = ?auto_612674 ?auto_612680 ) ) ( not ( = ?auto_612674 ?auto_612681 ) ) ( not ( = ?auto_612674 ?auto_612682 ) ) ( not ( = ?auto_612674 ?auto_612683 ) ) ( not ( = ?auto_612674 ?auto_612684 ) ) ( not ( = ?auto_612674 ?auto_612685 ) ) ( not ( = ?auto_612674 ?auto_612686 ) ) ( not ( = ?auto_612674 ?auto_612687 ) ) ( not ( = ?auto_612675 ?auto_612676 ) ) ( not ( = ?auto_612675 ?auto_612677 ) ) ( not ( = ?auto_612675 ?auto_612678 ) ) ( not ( = ?auto_612675 ?auto_612679 ) ) ( not ( = ?auto_612675 ?auto_612680 ) ) ( not ( = ?auto_612675 ?auto_612681 ) ) ( not ( = ?auto_612675 ?auto_612682 ) ) ( not ( = ?auto_612675 ?auto_612683 ) ) ( not ( = ?auto_612675 ?auto_612684 ) ) ( not ( = ?auto_612675 ?auto_612685 ) ) ( not ( = ?auto_612675 ?auto_612686 ) ) ( not ( = ?auto_612675 ?auto_612687 ) ) ( not ( = ?auto_612676 ?auto_612677 ) ) ( not ( = ?auto_612676 ?auto_612678 ) ) ( not ( = ?auto_612676 ?auto_612679 ) ) ( not ( = ?auto_612676 ?auto_612680 ) ) ( not ( = ?auto_612676 ?auto_612681 ) ) ( not ( = ?auto_612676 ?auto_612682 ) ) ( not ( = ?auto_612676 ?auto_612683 ) ) ( not ( = ?auto_612676 ?auto_612684 ) ) ( not ( = ?auto_612676 ?auto_612685 ) ) ( not ( = ?auto_612676 ?auto_612686 ) ) ( not ( = ?auto_612676 ?auto_612687 ) ) ( not ( = ?auto_612677 ?auto_612678 ) ) ( not ( = ?auto_612677 ?auto_612679 ) ) ( not ( = ?auto_612677 ?auto_612680 ) ) ( not ( = ?auto_612677 ?auto_612681 ) ) ( not ( = ?auto_612677 ?auto_612682 ) ) ( not ( = ?auto_612677 ?auto_612683 ) ) ( not ( = ?auto_612677 ?auto_612684 ) ) ( not ( = ?auto_612677 ?auto_612685 ) ) ( not ( = ?auto_612677 ?auto_612686 ) ) ( not ( = ?auto_612677 ?auto_612687 ) ) ( not ( = ?auto_612678 ?auto_612679 ) ) ( not ( = ?auto_612678 ?auto_612680 ) ) ( not ( = ?auto_612678 ?auto_612681 ) ) ( not ( = ?auto_612678 ?auto_612682 ) ) ( not ( = ?auto_612678 ?auto_612683 ) ) ( not ( = ?auto_612678 ?auto_612684 ) ) ( not ( = ?auto_612678 ?auto_612685 ) ) ( not ( = ?auto_612678 ?auto_612686 ) ) ( not ( = ?auto_612678 ?auto_612687 ) ) ( not ( = ?auto_612679 ?auto_612680 ) ) ( not ( = ?auto_612679 ?auto_612681 ) ) ( not ( = ?auto_612679 ?auto_612682 ) ) ( not ( = ?auto_612679 ?auto_612683 ) ) ( not ( = ?auto_612679 ?auto_612684 ) ) ( not ( = ?auto_612679 ?auto_612685 ) ) ( not ( = ?auto_612679 ?auto_612686 ) ) ( not ( = ?auto_612679 ?auto_612687 ) ) ( not ( = ?auto_612680 ?auto_612681 ) ) ( not ( = ?auto_612680 ?auto_612682 ) ) ( not ( = ?auto_612680 ?auto_612683 ) ) ( not ( = ?auto_612680 ?auto_612684 ) ) ( not ( = ?auto_612680 ?auto_612685 ) ) ( not ( = ?auto_612680 ?auto_612686 ) ) ( not ( = ?auto_612680 ?auto_612687 ) ) ( not ( = ?auto_612681 ?auto_612682 ) ) ( not ( = ?auto_612681 ?auto_612683 ) ) ( not ( = ?auto_612681 ?auto_612684 ) ) ( not ( = ?auto_612681 ?auto_612685 ) ) ( not ( = ?auto_612681 ?auto_612686 ) ) ( not ( = ?auto_612681 ?auto_612687 ) ) ( not ( = ?auto_612682 ?auto_612683 ) ) ( not ( = ?auto_612682 ?auto_612684 ) ) ( not ( = ?auto_612682 ?auto_612685 ) ) ( not ( = ?auto_612682 ?auto_612686 ) ) ( not ( = ?auto_612682 ?auto_612687 ) ) ( not ( = ?auto_612683 ?auto_612684 ) ) ( not ( = ?auto_612683 ?auto_612685 ) ) ( not ( = ?auto_612683 ?auto_612686 ) ) ( not ( = ?auto_612683 ?auto_612687 ) ) ( not ( = ?auto_612684 ?auto_612685 ) ) ( not ( = ?auto_612684 ?auto_612686 ) ) ( not ( = ?auto_612684 ?auto_612687 ) ) ( not ( = ?auto_612685 ?auto_612686 ) ) ( not ( = ?auto_612685 ?auto_612687 ) ) ( not ( = ?auto_612686 ?auto_612687 ) ) ( ON ?auto_612686 ?auto_612687 ) ( ON ?auto_612685 ?auto_612686 ) ( ON ?auto_612684 ?auto_612685 ) ( ON ?auto_612683 ?auto_612684 ) ( ON ?auto_612682 ?auto_612683 ) ( ON ?auto_612681 ?auto_612682 ) ( ON ?auto_612680 ?auto_612681 ) ( ON ?auto_612679 ?auto_612680 ) ( ON ?auto_612678 ?auto_612679 ) ( ON ?auto_612677 ?auto_612678 ) ( ON ?auto_612676 ?auto_612677 ) ( ON ?auto_612675 ?auto_612676 ) ( ON ?auto_612674 ?auto_612675 ) ( ON ?auto_612673 ?auto_612674 ) ( CLEAR ?auto_612671 ) ( ON ?auto_612672 ?auto_612673 ) ( CLEAR ?auto_612672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_612671 ?auto_612672 )
      ( MAKE-17PILE ?auto_612671 ?auto_612672 ?auto_612673 ?auto_612674 ?auto_612675 ?auto_612676 ?auto_612677 ?auto_612678 ?auto_612679 ?auto_612680 ?auto_612681 ?auto_612682 ?auto_612683 ?auto_612684 ?auto_612685 ?auto_612686 ?auto_612687 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612705 - BLOCK
      ?auto_612706 - BLOCK
      ?auto_612707 - BLOCK
      ?auto_612708 - BLOCK
      ?auto_612709 - BLOCK
      ?auto_612710 - BLOCK
      ?auto_612711 - BLOCK
      ?auto_612712 - BLOCK
      ?auto_612713 - BLOCK
      ?auto_612714 - BLOCK
      ?auto_612715 - BLOCK
      ?auto_612716 - BLOCK
      ?auto_612717 - BLOCK
      ?auto_612718 - BLOCK
      ?auto_612719 - BLOCK
      ?auto_612720 - BLOCK
      ?auto_612721 - BLOCK
    )
    :vars
    (
      ?auto_612722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_612721 ?auto_612722 ) ( not ( = ?auto_612705 ?auto_612706 ) ) ( not ( = ?auto_612705 ?auto_612707 ) ) ( not ( = ?auto_612705 ?auto_612708 ) ) ( not ( = ?auto_612705 ?auto_612709 ) ) ( not ( = ?auto_612705 ?auto_612710 ) ) ( not ( = ?auto_612705 ?auto_612711 ) ) ( not ( = ?auto_612705 ?auto_612712 ) ) ( not ( = ?auto_612705 ?auto_612713 ) ) ( not ( = ?auto_612705 ?auto_612714 ) ) ( not ( = ?auto_612705 ?auto_612715 ) ) ( not ( = ?auto_612705 ?auto_612716 ) ) ( not ( = ?auto_612705 ?auto_612717 ) ) ( not ( = ?auto_612705 ?auto_612718 ) ) ( not ( = ?auto_612705 ?auto_612719 ) ) ( not ( = ?auto_612705 ?auto_612720 ) ) ( not ( = ?auto_612705 ?auto_612721 ) ) ( not ( = ?auto_612705 ?auto_612722 ) ) ( not ( = ?auto_612706 ?auto_612707 ) ) ( not ( = ?auto_612706 ?auto_612708 ) ) ( not ( = ?auto_612706 ?auto_612709 ) ) ( not ( = ?auto_612706 ?auto_612710 ) ) ( not ( = ?auto_612706 ?auto_612711 ) ) ( not ( = ?auto_612706 ?auto_612712 ) ) ( not ( = ?auto_612706 ?auto_612713 ) ) ( not ( = ?auto_612706 ?auto_612714 ) ) ( not ( = ?auto_612706 ?auto_612715 ) ) ( not ( = ?auto_612706 ?auto_612716 ) ) ( not ( = ?auto_612706 ?auto_612717 ) ) ( not ( = ?auto_612706 ?auto_612718 ) ) ( not ( = ?auto_612706 ?auto_612719 ) ) ( not ( = ?auto_612706 ?auto_612720 ) ) ( not ( = ?auto_612706 ?auto_612721 ) ) ( not ( = ?auto_612706 ?auto_612722 ) ) ( not ( = ?auto_612707 ?auto_612708 ) ) ( not ( = ?auto_612707 ?auto_612709 ) ) ( not ( = ?auto_612707 ?auto_612710 ) ) ( not ( = ?auto_612707 ?auto_612711 ) ) ( not ( = ?auto_612707 ?auto_612712 ) ) ( not ( = ?auto_612707 ?auto_612713 ) ) ( not ( = ?auto_612707 ?auto_612714 ) ) ( not ( = ?auto_612707 ?auto_612715 ) ) ( not ( = ?auto_612707 ?auto_612716 ) ) ( not ( = ?auto_612707 ?auto_612717 ) ) ( not ( = ?auto_612707 ?auto_612718 ) ) ( not ( = ?auto_612707 ?auto_612719 ) ) ( not ( = ?auto_612707 ?auto_612720 ) ) ( not ( = ?auto_612707 ?auto_612721 ) ) ( not ( = ?auto_612707 ?auto_612722 ) ) ( not ( = ?auto_612708 ?auto_612709 ) ) ( not ( = ?auto_612708 ?auto_612710 ) ) ( not ( = ?auto_612708 ?auto_612711 ) ) ( not ( = ?auto_612708 ?auto_612712 ) ) ( not ( = ?auto_612708 ?auto_612713 ) ) ( not ( = ?auto_612708 ?auto_612714 ) ) ( not ( = ?auto_612708 ?auto_612715 ) ) ( not ( = ?auto_612708 ?auto_612716 ) ) ( not ( = ?auto_612708 ?auto_612717 ) ) ( not ( = ?auto_612708 ?auto_612718 ) ) ( not ( = ?auto_612708 ?auto_612719 ) ) ( not ( = ?auto_612708 ?auto_612720 ) ) ( not ( = ?auto_612708 ?auto_612721 ) ) ( not ( = ?auto_612708 ?auto_612722 ) ) ( not ( = ?auto_612709 ?auto_612710 ) ) ( not ( = ?auto_612709 ?auto_612711 ) ) ( not ( = ?auto_612709 ?auto_612712 ) ) ( not ( = ?auto_612709 ?auto_612713 ) ) ( not ( = ?auto_612709 ?auto_612714 ) ) ( not ( = ?auto_612709 ?auto_612715 ) ) ( not ( = ?auto_612709 ?auto_612716 ) ) ( not ( = ?auto_612709 ?auto_612717 ) ) ( not ( = ?auto_612709 ?auto_612718 ) ) ( not ( = ?auto_612709 ?auto_612719 ) ) ( not ( = ?auto_612709 ?auto_612720 ) ) ( not ( = ?auto_612709 ?auto_612721 ) ) ( not ( = ?auto_612709 ?auto_612722 ) ) ( not ( = ?auto_612710 ?auto_612711 ) ) ( not ( = ?auto_612710 ?auto_612712 ) ) ( not ( = ?auto_612710 ?auto_612713 ) ) ( not ( = ?auto_612710 ?auto_612714 ) ) ( not ( = ?auto_612710 ?auto_612715 ) ) ( not ( = ?auto_612710 ?auto_612716 ) ) ( not ( = ?auto_612710 ?auto_612717 ) ) ( not ( = ?auto_612710 ?auto_612718 ) ) ( not ( = ?auto_612710 ?auto_612719 ) ) ( not ( = ?auto_612710 ?auto_612720 ) ) ( not ( = ?auto_612710 ?auto_612721 ) ) ( not ( = ?auto_612710 ?auto_612722 ) ) ( not ( = ?auto_612711 ?auto_612712 ) ) ( not ( = ?auto_612711 ?auto_612713 ) ) ( not ( = ?auto_612711 ?auto_612714 ) ) ( not ( = ?auto_612711 ?auto_612715 ) ) ( not ( = ?auto_612711 ?auto_612716 ) ) ( not ( = ?auto_612711 ?auto_612717 ) ) ( not ( = ?auto_612711 ?auto_612718 ) ) ( not ( = ?auto_612711 ?auto_612719 ) ) ( not ( = ?auto_612711 ?auto_612720 ) ) ( not ( = ?auto_612711 ?auto_612721 ) ) ( not ( = ?auto_612711 ?auto_612722 ) ) ( not ( = ?auto_612712 ?auto_612713 ) ) ( not ( = ?auto_612712 ?auto_612714 ) ) ( not ( = ?auto_612712 ?auto_612715 ) ) ( not ( = ?auto_612712 ?auto_612716 ) ) ( not ( = ?auto_612712 ?auto_612717 ) ) ( not ( = ?auto_612712 ?auto_612718 ) ) ( not ( = ?auto_612712 ?auto_612719 ) ) ( not ( = ?auto_612712 ?auto_612720 ) ) ( not ( = ?auto_612712 ?auto_612721 ) ) ( not ( = ?auto_612712 ?auto_612722 ) ) ( not ( = ?auto_612713 ?auto_612714 ) ) ( not ( = ?auto_612713 ?auto_612715 ) ) ( not ( = ?auto_612713 ?auto_612716 ) ) ( not ( = ?auto_612713 ?auto_612717 ) ) ( not ( = ?auto_612713 ?auto_612718 ) ) ( not ( = ?auto_612713 ?auto_612719 ) ) ( not ( = ?auto_612713 ?auto_612720 ) ) ( not ( = ?auto_612713 ?auto_612721 ) ) ( not ( = ?auto_612713 ?auto_612722 ) ) ( not ( = ?auto_612714 ?auto_612715 ) ) ( not ( = ?auto_612714 ?auto_612716 ) ) ( not ( = ?auto_612714 ?auto_612717 ) ) ( not ( = ?auto_612714 ?auto_612718 ) ) ( not ( = ?auto_612714 ?auto_612719 ) ) ( not ( = ?auto_612714 ?auto_612720 ) ) ( not ( = ?auto_612714 ?auto_612721 ) ) ( not ( = ?auto_612714 ?auto_612722 ) ) ( not ( = ?auto_612715 ?auto_612716 ) ) ( not ( = ?auto_612715 ?auto_612717 ) ) ( not ( = ?auto_612715 ?auto_612718 ) ) ( not ( = ?auto_612715 ?auto_612719 ) ) ( not ( = ?auto_612715 ?auto_612720 ) ) ( not ( = ?auto_612715 ?auto_612721 ) ) ( not ( = ?auto_612715 ?auto_612722 ) ) ( not ( = ?auto_612716 ?auto_612717 ) ) ( not ( = ?auto_612716 ?auto_612718 ) ) ( not ( = ?auto_612716 ?auto_612719 ) ) ( not ( = ?auto_612716 ?auto_612720 ) ) ( not ( = ?auto_612716 ?auto_612721 ) ) ( not ( = ?auto_612716 ?auto_612722 ) ) ( not ( = ?auto_612717 ?auto_612718 ) ) ( not ( = ?auto_612717 ?auto_612719 ) ) ( not ( = ?auto_612717 ?auto_612720 ) ) ( not ( = ?auto_612717 ?auto_612721 ) ) ( not ( = ?auto_612717 ?auto_612722 ) ) ( not ( = ?auto_612718 ?auto_612719 ) ) ( not ( = ?auto_612718 ?auto_612720 ) ) ( not ( = ?auto_612718 ?auto_612721 ) ) ( not ( = ?auto_612718 ?auto_612722 ) ) ( not ( = ?auto_612719 ?auto_612720 ) ) ( not ( = ?auto_612719 ?auto_612721 ) ) ( not ( = ?auto_612719 ?auto_612722 ) ) ( not ( = ?auto_612720 ?auto_612721 ) ) ( not ( = ?auto_612720 ?auto_612722 ) ) ( not ( = ?auto_612721 ?auto_612722 ) ) ( ON ?auto_612720 ?auto_612721 ) ( ON ?auto_612719 ?auto_612720 ) ( ON ?auto_612718 ?auto_612719 ) ( ON ?auto_612717 ?auto_612718 ) ( ON ?auto_612716 ?auto_612717 ) ( ON ?auto_612715 ?auto_612716 ) ( ON ?auto_612714 ?auto_612715 ) ( ON ?auto_612713 ?auto_612714 ) ( ON ?auto_612712 ?auto_612713 ) ( ON ?auto_612711 ?auto_612712 ) ( ON ?auto_612710 ?auto_612711 ) ( ON ?auto_612709 ?auto_612710 ) ( ON ?auto_612708 ?auto_612709 ) ( ON ?auto_612707 ?auto_612708 ) ( ON ?auto_612706 ?auto_612707 ) ( ON ?auto_612705 ?auto_612706 ) ( CLEAR ?auto_612705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_612705 )
      ( MAKE-17PILE ?auto_612705 ?auto_612706 ?auto_612707 ?auto_612708 ?auto_612709 ?auto_612710 ?auto_612711 ?auto_612712 ?auto_612713 ?auto_612714 ?auto_612715 ?auto_612716 ?auto_612717 ?auto_612718 ?auto_612719 ?auto_612720 ?auto_612721 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612740 - BLOCK
      ?auto_612741 - BLOCK
      ?auto_612742 - BLOCK
      ?auto_612743 - BLOCK
      ?auto_612744 - BLOCK
      ?auto_612745 - BLOCK
      ?auto_612746 - BLOCK
      ?auto_612747 - BLOCK
      ?auto_612748 - BLOCK
      ?auto_612749 - BLOCK
      ?auto_612750 - BLOCK
      ?auto_612751 - BLOCK
      ?auto_612752 - BLOCK
      ?auto_612753 - BLOCK
      ?auto_612754 - BLOCK
      ?auto_612755 - BLOCK
      ?auto_612756 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_612756 ) ( not ( = ?auto_612740 ?auto_612741 ) ) ( not ( = ?auto_612740 ?auto_612742 ) ) ( not ( = ?auto_612740 ?auto_612743 ) ) ( not ( = ?auto_612740 ?auto_612744 ) ) ( not ( = ?auto_612740 ?auto_612745 ) ) ( not ( = ?auto_612740 ?auto_612746 ) ) ( not ( = ?auto_612740 ?auto_612747 ) ) ( not ( = ?auto_612740 ?auto_612748 ) ) ( not ( = ?auto_612740 ?auto_612749 ) ) ( not ( = ?auto_612740 ?auto_612750 ) ) ( not ( = ?auto_612740 ?auto_612751 ) ) ( not ( = ?auto_612740 ?auto_612752 ) ) ( not ( = ?auto_612740 ?auto_612753 ) ) ( not ( = ?auto_612740 ?auto_612754 ) ) ( not ( = ?auto_612740 ?auto_612755 ) ) ( not ( = ?auto_612740 ?auto_612756 ) ) ( not ( = ?auto_612741 ?auto_612742 ) ) ( not ( = ?auto_612741 ?auto_612743 ) ) ( not ( = ?auto_612741 ?auto_612744 ) ) ( not ( = ?auto_612741 ?auto_612745 ) ) ( not ( = ?auto_612741 ?auto_612746 ) ) ( not ( = ?auto_612741 ?auto_612747 ) ) ( not ( = ?auto_612741 ?auto_612748 ) ) ( not ( = ?auto_612741 ?auto_612749 ) ) ( not ( = ?auto_612741 ?auto_612750 ) ) ( not ( = ?auto_612741 ?auto_612751 ) ) ( not ( = ?auto_612741 ?auto_612752 ) ) ( not ( = ?auto_612741 ?auto_612753 ) ) ( not ( = ?auto_612741 ?auto_612754 ) ) ( not ( = ?auto_612741 ?auto_612755 ) ) ( not ( = ?auto_612741 ?auto_612756 ) ) ( not ( = ?auto_612742 ?auto_612743 ) ) ( not ( = ?auto_612742 ?auto_612744 ) ) ( not ( = ?auto_612742 ?auto_612745 ) ) ( not ( = ?auto_612742 ?auto_612746 ) ) ( not ( = ?auto_612742 ?auto_612747 ) ) ( not ( = ?auto_612742 ?auto_612748 ) ) ( not ( = ?auto_612742 ?auto_612749 ) ) ( not ( = ?auto_612742 ?auto_612750 ) ) ( not ( = ?auto_612742 ?auto_612751 ) ) ( not ( = ?auto_612742 ?auto_612752 ) ) ( not ( = ?auto_612742 ?auto_612753 ) ) ( not ( = ?auto_612742 ?auto_612754 ) ) ( not ( = ?auto_612742 ?auto_612755 ) ) ( not ( = ?auto_612742 ?auto_612756 ) ) ( not ( = ?auto_612743 ?auto_612744 ) ) ( not ( = ?auto_612743 ?auto_612745 ) ) ( not ( = ?auto_612743 ?auto_612746 ) ) ( not ( = ?auto_612743 ?auto_612747 ) ) ( not ( = ?auto_612743 ?auto_612748 ) ) ( not ( = ?auto_612743 ?auto_612749 ) ) ( not ( = ?auto_612743 ?auto_612750 ) ) ( not ( = ?auto_612743 ?auto_612751 ) ) ( not ( = ?auto_612743 ?auto_612752 ) ) ( not ( = ?auto_612743 ?auto_612753 ) ) ( not ( = ?auto_612743 ?auto_612754 ) ) ( not ( = ?auto_612743 ?auto_612755 ) ) ( not ( = ?auto_612743 ?auto_612756 ) ) ( not ( = ?auto_612744 ?auto_612745 ) ) ( not ( = ?auto_612744 ?auto_612746 ) ) ( not ( = ?auto_612744 ?auto_612747 ) ) ( not ( = ?auto_612744 ?auto_612748 ) ) ( not ( = ?auto_612744 ?auto_612749 ) ) ( not ( = ?auto_612744 ?auto_612750 ) ) ( not ( = ?auto_612744 ?auto_612751 ) ) ( not ( = ?auto_612744 ?auto_612752 ) ) ( not ( = ?auto_612744 ?auto_612753 ) ) ( not ( = ?auto_612744 ?auto_612754 ) ) ( not ( = ?auto_612744 ?auto_612755 ) ) ( not ( = ?auto_612744 ?auto_612756 ) ) ( not ( = ?auto_612745 ?auto_612746 ) ) ( not ( = ?auto_612745 ?auto_612747 ) ) ( not ( = ?auto_612745 ?auto_612748 ) ) ( not ( = ?auto_612745 ?auto_612749 ) ) ( not ( = ?auto_612745 ?auto_612750 ) ) ( not ( = ?auto_612745 ?auto_612751 ) ) ( not ( = ?auto_612745 ?auto_612752 ) ) ( not ( = ?auto_612745 ?auto_612753 ) ) ( not ( = ?auto_612745 ?auto_612754 ) ) ( not ( = ?auto_612745 ?auto_612755 ) ) ( not ( = ?auto_612745 ?auto_612756 ) ) ( not ( = ?auto_612746 ?auto_612747 ) ) ( not ( = ?auto_612746 ?auto_612748 ) ) ( not ( = ?auto_612746 ?auto_612749 ) ) ( not ( = ?auto_612746 ?auto_612750 ) ) ( not ( = ?auto_612746 ?auto_612751 ) ) ( not ( = ?auto_612746 ?auto_612752 ) ) ( not ( = ?auto_612746 ?auto_612753 ) ) ( not ( = ?auto_612746 ?auto_612754 ) ) ( not ( = ?auto_612746 ?auto_612755 ) ) ( not ( = ?auto_612746 ?auto_612756 ) ) ( not ( = ?auto_612747 ?auto_612748 ) ) ( not ( = ?auto_612747 ?auto_612749 ) ) ( not ( = ?auto_612747 ?auto_612750 ) ) ( not ( = ?auto_612747 ?auto_612751 ) ) ( not ( = ?auto_612747 ?auto_612752 ) ) ( not ( = ?auto_612747 ?auto_612753 ) ) ( not ( = ?auto_612747 ?auto_612754 ) ) ( not ( = ?auto_612747 ?auto_612755 ) ) ( not ( = ?auto_612747 ?auto_612756 ) ) ( not ( = ?auto_612748 ?auto_612749 ) ) ( not ( = ?auto_612748 ?auto_612750 ) ) ( not ( = ?auto_612748 ?auto_612751 ) ) ( not ( = ?auto_612748 ?auto_612752 ) ) ( not ( = ?auto_612748 ?auto_612753 ) ) ( not ( = ?auto_612748 ?auto_612754 ) ) ( not ( = ?auto_612748 ?auto_612755 ) ) ( not ( = ?auto_612748 ?auto_612756 ) ) ( not ( = ?auto_612749 ?auto_612750 ) ) ( not ( = ?auto_612749 ?auto_612751 ) ) ( not ( = ?auto_612749 ?auto_612752 ) ) ( not ( = ?auto_612749 ?auto_612753 ) ) ( not ( = ?auto_612749 ?auto_612754 ) ) ( not ( = ?auto_612749 ?auto_612755 ) ) ( not ( = ?auto_612749 ?auto_612756 ) ) ( not ( = ?auto_612750 ?auto_612751 ) ) ( not ( = ?auto_612750 ?auto_612752 ) ) ( not ( = ?auto_612750 ?auto_612753 ) ) ( not ( = ?auto_612750 ?auto_612754 ) ) ( not ( = ?auto_612750 ?auto_612755 ) ) ( not ( = ?auto_612750 ?auto_612756 ) ) ( not ( = ?auto_612751 ?auto_612752 ) ) ( not ( = ?auto_612751 ?auto_612753 ) ) ( not ( = ?auto_612751 ?auto_612754 ) ) ( not ( = ?auto_612751 ?auto_612755 ) ) ( not ( = ?auto_612751 ?auto_612756 ) ) ( not ( = ?auto_612752 ?auto_612753 ) ) ( not ( = ?auto_612752 ?auto_612754 ) ) ( not ( = ?auto_612752 ?auto_612755 ) ) ( not ( = ?auto_612752 ?auto_612756 ) ) ( not ( = ?auto_612753 ?auto_612754 ) ) ( not ( = ?auto_612753 ?auto_612755 ) ) ( not ( = ?auto_612753 ?auto_612756 ) ) ( not ( = ?auto_612754 ?auto_612755 ) ) ( not ( = ?auto_612754 ?auto_612756 ) ) ( not ( = ?auto_612755 ?auto_612756 ) ) ( ON ?auto_612755 ?auto_612756 ) ( ON ?auto_612754 ?auto_612755 ) ( ON ?auto_612753 ?auto_612754 ) ( ON ?auto_612752 ?auto_612753 ) ( ON ?auto_612751 ?auto_612752 ) ( ON ?auto_612750 ?auto_612751 ) ( ON ?auto_612749 ?auto_612750 ) ( ON ?auto_612748 ?auto_612749 ) ( ON ?auto_612747 ?auto_612748 ) ( ON ?auto_612746 ?auto_612747 ) ( ON ?auto_612745 ?auto_612746 ) ( ON ?auto_612744 ?auto_612745 ) ( ON ?auto_612743 ?auto_612744 ) ( ON ?auto_612742 ?auto_612743 ) ( ON ?auto_612741 ?auto_612742 ) ( ON ?auto_612740 ?auto_612741 ) ( CLEAR ?auto_612740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_612740 )
      ( MAKE-17PILE ?auto_612740 ?auto_612741 ?auto_612742 ?auto_612743 ?auto_612744 ?auto_612745 ?auto_612746 ?auto_612747 ?auto_612748 ?auto_612749 ?auto_612750 ?auto_612751 ?auto_612752 ?auto_612753 ?auto_612754 ?auto_612755 ?auto_612756 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_612774 - BLOCK
      ?auto_612775 - BLOCK
      ?auto_612776 - BLOCK
      ?auto_612777 - BLOCK
      ?auto_612778 - BLOCK
      ?auto_612779 - BLOCK
      ?auto_612780 - BLOCK
      ?auto_612781 - BLOCK
      ?auto_612782 - BLOCK
      ?auto_612783 - BLOCK
      ?auto_612784 - BLOCK
      ?auto_612785 - BLOCK
      ?auto_612786 - BLOCK
      ?auto_612787 - BLOCK
      ?auto_612788 - BLOCK
      ?auto_612789 - BLOCK
      ?auto_612790 - BLOCK
    )
    :vars
    (
      ?auto_612791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_612774 ?auto_612775 ) ) ( not ( = ?auto_612774 ?auto_612776 ) ) ( not ( = ?auto_612774 ?auto_612777 ) ) ( not ( = ?auto_612774 ?auto_612778 ) ) ( not ( = ?auto_612774 ?auto_612779 ) ) ( not ( = ?auto_612774 ?auto_612780 ) ) ( not ( = ?auto_612774 ?auto_612781 ) ) ( not ( = ?auto_612774 ?auto_612782 ) ) ( not ( = ?auto_612774 ?auto_612783 ) ) ( not ( = ?auto_612774 ?auto_612784 ) ) ( not ( = ?auto_612774 ?auto_612785 ) ) ( not ( = ?auto_612774 ?auto_612786 ) ) ( not ( = ?auto_612774 ?auto_612787 ) ) ( not ( = ?auto_612774 ?auto_612788 ) ) ( not ( = ?auto_612774 ?auto_612789 ) ) ( not ( = ?auto_612774 ?auto_612790 ) ) ( not ( = ?auto_612775 ?auto_612776 ) ) ( not ( = ?auto_612775 ?auto_612777 ) ) ( not ( = ?auto_612775 ?auto_612778 ) ) ( not ( = ?auto_612775 ?auto_612779 ) ) ( not ( = ?auto_612775 ?auto_612780 ) ) ( not ( = ?auto_612775 ?auto_612781 ) ) ( not ( = ?auto_612775 ?auto_612782 ) ) ( not ( = ?auto_612775 ?auto_612783 ) ) ( not ( = ?auto_612775 ?auto_612784 ) ) ( not ( = ?auto_612775 ?auto_612785 ) ) ( not ( = ?auto_612775 ?auto_612786 ) ) ( not ( = ?auto_612775 ?auto_612787 ) ) ( not ( = ?auto_612775 ?auto_612788 ) ) ( not ( = ?auto_612775 ?auto_612789 ) ) ( not ( = ?auto_612775 ?auto_612790 ) ) ( not ( = ?auto_612776 ?auto_612777 ) ) ( not ( = ?auto_612776 ?auto_612778 ) ) ( not ( = ?auto_612776 ?auto_612779 ) ) ( not ( = ?auto_612776 ?auto_612780 ) ) ( not ( = ?auto_612776 ?auto_612781 ) ) ( not ( = ?auto_612776 ?auto_612782 ) ) ( not ( = ?auto_612776 ?auto_612783 ) ) ( not ( = ?auto_612776 ?auto_612784 ) ) ( not ( = ?auto_612776 ?auto_612785 ) ) ( not ( = ?auto_612776 ?auto_612786 ) ) ( not ( = ?auto_612776 ?auto_612787 ) ) ( not ( = ?auto_612776 ?auto_612788 ) ) ( not ( = ?auto_612776 ?auto_612789 ) ) ( not ( = ?auto_612776 ?auto_612790 ) ) ( not ( = ?auto_612777 ?auto_612778 ) ) ( not ( = ?auto_612777 ?auto_612779 ) ) ( not ( = ?auto_612777 ?auto_612780 ) ) ( not ( = ?auto_612777 ?auto_612781 ) ) ( not ( = ?auto_612777 ?auto_612782 ) ) ( not ( = ?auto_612777 ?auto_612783 ) ) ( not ( = ?auto_612777 ?auto_612784 ) ) ( not ( = ?auto_612777 ?auto_612785 ) ) ( not ( = ?auto_612777 ?auto_612786 ) ) ( not ( = ?auto_612777 ?auto_612787 ) ) ( not ( = ?auto_612777 ?auto_612788 ) ) ( not ( = ?auto_612777 ?auto_612789 ) ) ( not ( = ?auto_612777 ?auto_612790 ) ) ( not ( = ?auto_612778 ?auto_612779 ) ) ( not ( = ?auto_612778 ?auto_612780 ) ) ( not ( = ?auto_612778 ?auto_612781 ) ) ( not ( = ?auto_612778 ?auto_612782 ) ) ( not ( = ?auto_612778 ?auto_612783 ) ) ( not ( = ?auto_612778 ?auto_612784 ) ) ( not ( = ?auto_612778 ?auto_612785 ) ) ( not ( = ?auto_612778 ?auto_612786 ) ) ( not ( = ?auto_612778 ?auto_612787 ) ) ( not ( = ?auto_612778 ?auto_612788 ) ) ( not ( = ?auto_612778 ?auto_612789 ) ) ( not ( = ?auto_612778 ?auto_612790 ) ) ( not ( = ?auto_612779 ?auto_612780 ) ) ( not ( = ?auto_612779 ?auto_612781 ) ) ( not ( = ?auto_612779 ?auto_612782 ) ) ( not ( = ?auto_612779 ?auto_612783 ) ) ( not ( = ?auto_612779 ?auto_612784 ) ) ( not ( = ?auto_612779 ?auto_612785 ) ) ( not ( = ?auto_612779 ?auto_612786 ) ) ( not ( = ?auto_612779 ?auto_612787 ) ) ( not ( = ?auto_612779 ?auto_612788 ) ) ( not ( = ?auto_612779 ?auto_612789 ) ) ( not ( = ?auto_612779 ?auto_612790 ) ) ( not ( = ?auto_612780 ?auto_612781 ) ) ( not ( = ?auto_612780 ?auto_612782 ) ) ( not ( = ?auto_612780 ?auto_612783 ) ) ( not ( = ?auto_612780 ?auto_612784 ) ) ( not ( = ?auto_612780 ?auto_612785 ) ) ( not ( = ?auto_612780 ?auto_612786 ) ) ( not ( = ?auto_612780 ?auto_612787 ) ) ( not ( = ?auto_612780 ?auto_612788 ) ) ( not ( = ?auto_612780 ?auto_612789 ) ) ( not ( = ?auto_612780 ?auto_612790 ) ) ( not ( = ?auto_612781 ?auto_612782 ) ) ( not ( = ?auto_612781 ?auto_612783 ) ) ( not ( = ?auto_612781 ?auto_612784 ) ) ( not ( = ?auto_612781 ?auto_612785 ) ) ( not ( = ?auto_612781 ?auto_612786 ) ) ( not ( = ?auto_612781 ?auto_612787 ) ) ( not ( = ?auto_612781 ?auto_612788 ) ) ( not ( = ?auto_612781 ?auto_612789 ) ) ( not ( = ?auto_612781 ?auto_612790 ) ) ( not ( = ?auto_612782 ?auto_612783 ) ) ( not ( = ?auto_612782 ?auto_612784 ) ) ( not ( = ?auto_612782 ?auto_612785 ) ) ( not ( = ?auto_612782 ?auto_612786 ) ) ( not ( = ?auto_612782 ?auto_612787 ) ) ( not ( = ?auto_612782 ?auto_612788 ) ) ( not ( = ?auto_612782 ?auto_612789 ) ) ( not ( = ?auto_612782 ?auto_612790 ) ) ( not ( = ?auto_612783 ?auto_612784 ) ) ( not ( = ?auto_612783 ?auto_612785 ) ) ( not ( = ?auto_612783 ?auto_612786 ) ) ( not ( = ?auto_612783 ?auto_612787 ) ) ( not ( = ?auto_612783 ?auto_612788 ) ) ( not ( = ?auto_612783 ?auto_612789 ) ) ( not ( = ?auto_612783 ?auto_612790 ) ) ( not ( = ?auto_612784 ?auto_612785 ) ) ( not ( = ?auto_612784 ?auto_612786 ) ) ( not ( = ?auto_612784 ?auto_612787 ) ) ( not ( = ?auto_612784 ?auto_612788 ) ) ( not ( = ?auto_612784 ?auto_612789 ) ) ( not ( = ?auto_612784 ?auto_612790 ) ) ( not ( = ?auto_612785 ?auto_612786 ) ) ( not ( = ?auto_612785 ?auto_612787 ) ) ( not ( = ?auto_612785 ?auto_612788 ) ) ( not ( = ?auto_612785 ?auto_612789 ) ) ( not ( = ?auto_612785 ?auto_612790 ) ) ( not ( = ?auto_612786 ?auto_612787 ) ) ( not ( = ?auto_612786 ?auto_612788 ) ) ( not ( = ?auto_612786 ?auto_612789 ) ) ( not ( = ?auto_612786 ?auto_612790 ) ) ( not ( = ?auto_612787 ?auto_612788 ) ) ( not ( = ?auto_612787 ?auto_612789 ) ) ( not ( = ?auto_612787 ?auto_612790 ) ) ( not ( = ?auto_612788 ?auto_612789 ) ) ( not ( = ?auto_612788 ?auto_612790 ) ) ( not ( = ?auto_612789 ?auto_612790 ) ) ( ON ?auto_612774 ?auto_612791 ) ( not ( = ?auto_612790 ?auto_612791 ) ) ( not ( = ?auto_612789 ?auto_612791 ) ) ( not ( = ?auto_612788 ?auto_612791 ) ) ( not ( = ?auto_612787 ?auto_612791 ) ) ( not ( = ?auto_612786 ?auto_612791 ) ) ( not ( = ?auto_612785 ?auto_612791 ) ) ( not ( = ?auto_612784 ?auto_612791 ) ) ( not ( = ?auto_612783 ?auto_612791 ) ) ( not ( = ?auto_612782 ?auto_612791 ) ) ( not ( = ?auto_612781 ?auto_612791 ) ) ( not ( = ?auto_612780 ?auto_612791 ) ) ( not ( = ?auto_612779 ?auto_612791 ) ) ( not ( = ?auto_612778 ?auto_612791 ) ) ( not ( = ?auto_612777 ?auto_612791 ) ) ( not ( = ?auto_612776 ?auto_612791 ) ) ( not ( = ?auto_612775 ?auto_612791 ) ) ( not ( = ?auto_612774 ?auto_612791 ) ) ( ON ?auto_612775 ?auto_612774 ) ( ON ?auto_612776 ?auto_612775 ) ( ON ?auto_612777 ?auto_612776 ) ( ON ?auto_612778 ?auto_612777 ) ( ON ?auto_612779 ?auto_612778 ) ( ON ?auto_612780 ?auto_612779 ) ( ON ?auto_612781 ?auto_612780 ) ( ON ?auto_612782 ?auto_612781 ) ( ON ?auto_612783 ?auto_612782 ) ( ON ?auto_612784 ?auto_612783 ) ( ON ?auto_612785 ?auto_612784 ) ( ON ?auto_612786 ?auto_612785 ) ( ON ?auto_612787 ?auto_612786 ) ( ON ?auto_612788 ?auto_612787 ) ( ON ?auto_612789 ?auto_612788 ) ( ON ?auto_612790 ?auto_612789 ) ( CLEAR ?auto_612790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_612790 ?auto_612789 ?auto_612788 ?auto_612787 ?auto_612786 ?auto_612785 ?auto_612784 ?auto_612783 ?auto_612782 ?auto_612781 ?auto_612780 ?auto_612779 ?auto_612778 ?auto_612777 ?auto_612776 ?auto_612775 ?auto_612774 )
      ( MAKE-17PILE ?auto_612774 ?auto_612775 ?auto_612776 ?auto_612777 ?auto_612778 ?auto_612779 ?auto_612780 ?auto_612781 ?auto_612782 ?auto_612783 ?auto_612784 ?auto_612785 ?auto_612786 ?auto_612787 ?auto_612788 ?auto_612789 ?auto_612790 ) )
  )

)

