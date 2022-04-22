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
      ?auto_93453 - BLOCK
    )
    :vars
    (
      ?auto_93454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93453 ?auto_93454 ) ( CLEAR ?auto_93453 ) ( HAND-EMPTY ) ( not ( = ?auto_93453 ?auto_93454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93453 ?auto_93454 )
      ( !PUTDOWN ?auto_93453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93456 - BLOCK
    )
    :vars
    (
      ?auto_93457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93456 ?auto_93457 ) ( CLEAR ?auto_93456 ) ( HAND-EMPTY ) ( not ( = ?auto_93456 ?auto_93457 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93456 ?auto_93457 )
      ( !PUTDOWN ?auto_93456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93460 - BLOCK
      ?auto_93461 - BLOCK
    )
    :vars
    (
      ?auto_93462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93460 ) ( ON ?auto_93461 ?auto_93462 ) ( CLEAR ?auto_93461 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93460 ) ( not ( = ?auto_93460 ?auto_93461 ) ) ( not ( = ?auto_93460 ?auto_93462 ) ) ( not ( = ?auto_93461 ?auto_93462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93461 ?auto_93462 )
      ( !STACK ?auto_93461 ?auto_93460 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93465 - BLOCK
      ?auto_93466 - BLOCK
    )
    :vars
    (
      ?auto_93467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93465 ) ( ON ?auto_93466 ?auto_93467 ) ( CLEAR ?auto_93466 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93465 ) ( not ( = ?auto_93465 ?auto_93466 ) ) ( not ( = ?auto_93465 ?auto_93467 ) ) ( not ( = ?auto_93466 ?auto_93467 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93466 ?auto_93467 )
      ( !STACK ?auto_93466 ?auto_93465 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93470 - BLOCK
      ?auto_93471 - BLOCK
    )
    :vars
    (
      ?auto_93472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93471 ?auto_93472 ) ( not ( = ?auto_93470 ?auto_93471 ) ) ( not ( = ?auto_93470 ?auto_93472 ) ) ( not ( = ?auto_93471 ?auto_93472 ) ) ( ON ?auto_93470 ?auto_93471 ) ( CLEAR ?auto_93470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93470 )
      ( MAKE-2PILE ?auto_93470 ?auto_93471 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93475 - BLOCK
      ?auto_93476 - BLOCK
    )
    :vars
    (
      ?auto_93477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93476 ?auto_93477 ) ( not ( = ?auto_93475 ?auto_93476 ) ) ( not ( = ?auto_93475 ?auto_93477 ) ) ( not ( = ?auto_93476 ?auto_93477 ) ) ( ON ?auto_93475 ?auto_93476 ) ( CLEAR ?auto_93475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93475 )
      ( MAKE-2PILE ?auto_93475 ?auto_93476 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93481 - BLOCK
      ?auto_93482 - BLOCK
      ?auto_93483 - BLOCK
    )
    :vars
    (
      ?auto_93484 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93482 ) ( ON ?auto_93483 ?auto_93484 ) ( CLEAR ?auto_93483 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93481 ) ( ON ?auto_93482 ?auto_93481 ) ( not ( = ?auto_93481 ?auto_93482 ) ) ( not ( = ?auto_93481 ?auto_93483 ) ) ( not ( = ?auto_93481 ?auto_93484 ) ) ( not ( = ?auto_93482 ?auto_93483 ) ) ( not ( = ?auto_93482 ?auto_93484 ) ) ( not ( = ?auto_93483 ?auto_93484 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93483 ?auto_93484 )
      ( !STACK ?auto_93483 ?auto_93482 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93488 - BLOCK
      ?auto_93489 - BLOCK
      ?auto_93490 - BLOCK
    )
    :vars
    (
      ?auto_93491 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93489 ) ( ON ?auto_93490 ?auto_93491 ) ( CLEAR ?auto_93490 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93488 ) ( ON ?auto_93489 ?auto_93488 ) ( not ( = ?auto_93488 ?auto_93489 ) ) ( not ( = ?auto_93488 ?auto_93490 ) ) ( not ( = ?auto_93488 ?auto_93491 ) ) ( not ( = ?auto_93489 ?auto_93490 ) ) ( not ( = ?auto_93489 ?auto_93491 ) ) ( not ( = ?auto_93490 ?auto_93491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93490 ?auto_93491 )
      ( !STACK ?auto_93490 ?auto_93489 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93495 - BLOCK
      ?auto_93496 - BLOCK
      ?auto_93497 - BLOCK
    )
    :vars
    (
      ?auto_93498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93497 ?auto_93498 ) ( ON-TABLE ?auto_93495 ) ( not ( = ?auto_93495 ?auto_93496 ) ) ( not ( = ?auto_93495 ?auto_93497 ) ) ( not ( = ?auto_93495 ?auto_93498 ) ) ( not ( = ?auto_93496 ?auto_93497 ) ) ( not ( = ?auto_93496 ?auto_93498 ) ) ( not ( = ?auto_93497 ?auto_93498 ) ) ( CLEAR ?auto_93495 ) ( ON ?auto_93496 ?auto_93497 ) ( CLEAR ?auto_93496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93495 ?auto_93496 )
      ( MAKE-3PILE ?auto_93495 ?auto_93496 ?auto_93497 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93502 - BLOCK
      ?auto_93503 - BLOCK
      ?auto_93504 - BLOCK
    )
    :vars
    (
      ?auto_93505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93504 ?auto_93505 ) ( ON-TABLE ?auto_93502 ) ( not ( = ?auto_93502 ?auto_93503 ) ) ( not ( = ?auto_93502 ?auto_93504 ) ) ( not ( = ?auto_93502 ?auto_93505 ) ) ( not ( = ?auto_93503 ?auto_93504 ) ) ( not ( = ?auto_93503 ?auto_93505 ) ) ( not ( = ?auto_93504 ?auto_93505 ) ) ( CLEAR ?auto_93502 ) ( ON ?auto_93503 ?auto_93504 ) ( CLEAR ?auto_93503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93502 ?auto_93503 )
      ( MAKE-3PILE ?auto_93502 ?auto_93503 ?auto_93504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93509 - BLOCK
      ?auto_93510 - BLOCK
      ?auto_93511 - BLOCK
    )
    :vars
    (
      ?auto_93512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93511 ?auto_93512 ) ( not ( = ?auto_93509 ?auto_93510 ) ) ( not ( = ?auto_93509 ?auto_93511 ) ) ( not ( = ?auto_93509 ?auto_93512 ) ) ( not ( = ?auto_93510 ?auto_93511 ) ) ( not ( = ?auto_93510 ?auto_93512 ) ) ( not ( = ?auto_93511 ?auto_93512 ) ) ( ON ?auto_93510 ?auto_93511 ) ( ON ?auto_93509 ?auto_93510 ) ( CLEAR ?auto_93509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93509 )
      ( MAKE-3PILE ?auto_93509 ?auto_93510 ?auto_93511 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93516 - BLOCK
      ?auto_93517 - BLOCK
      ?auto_93518 - BLOCK
    )
    :vars
    (
      ?auto_93519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93518 ?auto_93519 ) ( not ( = ?auto_93516 ?auto_93517 ) ) ( not ( = ?auto_93516 ?auto_93518 ) ) ( not ( = ?auto_93516 ?auto_93519 ) ) ( not ( = ?auto_93517 ?auto_93518 ) ) ( not ( = ?auto_93517 ?auto_93519 ) ) ( not ( = ?auto_93518 ?auto_93519 ) ) ( ON ?auto_93517 ?auto_93518 ) ( ON ?auto_93516 ?auto_93517 ) ( CLEAR ?auto_93516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93516 )
      ( MAKE-3PILE ?auto_93516 ?auto_93517 ?auto_93518 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93524 - BLOCK
      ?auto_93525 - BLOCK
      ?auto_93526 - BLOCK
      ?auto_93527 - BLOCK
    )
    :vars
    (
      ?auto_93528 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93526 ) ( ON ?auto_93527 ?auto_93528 ) ( CLEAR ?auto_93527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93524 ) ( ON ?auto_93525 ?auto_93524 ) ( ON ?auto_93526 ?auto_93525 ) ( not ( = ?auto_93524 ?auto_93525 ) ) ( not ( = ?auto_93524 ?auto_93526 ) ) ( not ( = ?auto_93524 ?auto_93527 ) ) ( not ( = ?auto_93524 ?auto_93528 ) ) ( not ( = ?auto_93525 ?auto_93526 ) ) ( not ( = ?auto_93525 ?auto_93527 ) ) ( not ( = ?auto_93525 ?auto_93528 ) ) ( not ( = ?auto_93526 ?auto_93527 ) ) ( not ( = ?auto_93526 ?auto_93528 ) ) ( not ( = ?auto_93527 ?auto_93528 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93527 ?auto_93528 )
      ( !STACK ?auto_93527 ?auto_93526 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93533 - BLOCK
      ?auto_93534 - BLOCK
      ?auto_93535 - BLOCK
      ?auto_93536 - BLOCK
    )
    :vars
    (
      ?auto_93537 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93535 ) ( ON ?auto_93536 ?auto_93537 ) ( CLEAR ?auto_93536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93533 ) ( ON ?auto_93534 ?auto_93533 ) ( ON ?auto_93535 ?auto_93534 ) ( not ( = ?auto_93533 ?auto_93534 ) ) ( not ( = ?auto_93533 ?auto_93535 ) ) ( not ( = ?auto_93533 ?auto_93536 ) ) ( not ( = ?auto_93533 ?auto_93537 ) ) ( not ( = ?auto_93534 ?auto_93535 ) ) ( not ( = ?auto_93534 ?auto_93536 ) ) ( not ( = ?auto_93534 ?auto_93537 ) ) ( not ( = ?auto_93535 ?auto_93536 ) ) ( not ( = ?auto_93535 ?auto_93537 ) ) ( not ( = ?auto_93536 ?auto_93537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93536 ?auto_93537 )
      ( !STACK ?auto_93536 ?auto_93535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93542 - BLOCK
      ?auto_93543 - BLOCK
      ?auto_93544 - BLOCK
      ?auto_93545 - BLOCK
    )
    :vars
    (
      ?auto_93546 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93545 ?auto_93546 ) ( ON-TABLE ?auto_93542 ) ( ON ?auto_93543 ?auto_93542 ) ( not ( = ?auto_93542 ?auto_93543 ) ) ( not ( = ?auto_93542 ?auto_93544 ) ) ( not ( = ?auto_93542 ?auto_93545 ) ) ( not ( = ?auto_93542 ?auto_93546 ) ) ( not ( = ?auto_93543 ?auto_93544 ) ) ( not ( = ?auto_93543 ?auto_93545 ) ) ( not ( = ?auto_93543 ?auto_93546 ) ) ( not ( = ?auto_93544 ?auto_93545 ) ) ( not ( = ?auto_93544 ?auto_93546 ) ) ( not ( = ?auto_93545 ?auto_93546 ) ) ( CLEAR ?auto_93543 ) ( ON ?auto_93544 ?auto_93545 ) ( CLEAR ?auto_93544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93542 ?auto_93543 ?auto_93544 )
      ( MAKE-4PILE ?auto_93542 ?auto_93543 ?auto_93544 ?auto_93545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93551 - BLOCK
      ?auto_93552 - BLOCK
      ?auto_93553 - BLOCK
      ?auto_93554 - BLOCK
    )
    :vars
    (
      ?auto_93555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93554 ?auto_93555 ) ( ON-TABLE ?auto_93551 ) ( ON ?auto_93552 ?auto_93551 ) ( not ( = ?auto_93551 ?auto_93552 ) ) ( not ( = ?auto_93551 ?auto_93553 ) ) ( not ( = ?auto_93551 ?auto_93554 ) ) ( not ( = ?auto_93551 ?auto_93555 ) ) ( not ( = ?auto_93552 ?auto_93553 ) ) ( not ( = ?auto_93552 ?auto_93554 ) ) ( not ( = ?auto_93552 ?auto_93555 ) ) ( not ( = ?auto_93553 ?auto_93554 ) ) ( not ( = ?auto_93553 ?auto_93555 ) ) ( not ( = ?auto_93554 ?auto_93555 ) ) ( CLEAR ?auto_93552 ) ( ON ?auto_93553 ?auto_93554 ) ( CLEAR ?auto_93553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93551 ?auto_93552 ?auto_93553 )
      ( MAKE-4PILE ?auto_93551 ?auto_93552 ?auto_93553 ?auto_93554 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93560 - BLOCK
      ?auto_93561 - BLOCK
      ?auto_93562 - BLOCK
      ?auto_93563 - BLOCK
    )
    :vars
    (
      ?auto_93564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93563 ?auto_93564 ) ( ON-TABLE ?auto_93560 ) ( not ( = ?auto_93560 ?auto_93561 ) ) ( not ( = ?auto_93560 ?auto_93562 ) ) ( not ( = ?auto_93560 ?auto_93563 ) ) ( not ( = ?auto_93560 ?auto_93564 ) ) ( not ( = ?auto_93561 ?auto_93562 ) ) ( not ( = ?auto_93561 ?auto_93563 ) ) ( not ( = ?auto_93561 ?auto_93564 ) ) ( not ( = ?auto_93562 ?auto_93563 ) ) ( not ( = ?auto_93562 ?auto_93564 ) ) ( not ( = ?auto_93563 ?auto_93564 ) ) ( ON ?auto_93562 ?auto_93563 ) ( CLEAR ?auto_93560 ) ( ON ?auto_93561 ?auto_93562 ) ( CLEAR ?auto_93561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93560 ?auto_93561 )
      ( MAKE-4PILE ?auto_93560 ?auto_93561 ?auto_93562 ?auto_93563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93569 - BLOCK
      ?auto_93570 - BLOCK
      ?auto_93571 - BLOCK
      ?auto_93572 - BLOCK
    )
    :vars
    (
      ?auto_93573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93572 ?auto_93573 ) ( ON-TABLE ?auto_93569 ) ( not ( = ?auto_93569 ?auto_93570 ) ) ( not ( = ?auto_93569 ?auto_93571 ) ) ( not ( = ?auto_93569 ?auto_93572 ) ) ( not ( = ?auto_93569 ?auto_93573 ) ) ( not ( = ?auto_93570 ?auto_93571 ) ) ( not ( = ?auto_93570 ?auto_93572 ) ) ( not ( = ?auto_93570 ?auto_93573 ) ) ( not ( = ?auto_93571 ?auto_93572 ) ) ( not ( = ?auto_93571 ?auto_93573 ) ) ( not ( = ?auto_93572 ?auto_93573 ) ) ( ON ?auto_93571 ?auto_93572 ) ( CLEAR ?auto_93569 ) ( ON ?auto_93570 ?auto_93571 ) ( CLEAR ?auto_93570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93569 ?auto_93570 )
      ( MAKE-4PILE ?auto_93569 ?auto_93570 ?auto_93571 ?auto_93572 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93578 - BLOCK
      ?auto_93579 - BLOCK
      ?auto_93580 - BLOCK
      ?auto_93581 - BLOCK
    )
    :vars
    (
      ?auto_93582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93581 ?auto_93582 ) ( not ( = ?auto_93578 ?auto_93579 ) ) ( not ( = ?auto_93578 ?auto_93580 ) ) ( not ( = ?auto_93578 ?auto_93581 ) ) ( not ( = ?auto_93578 ?auto_93582 ) ) ( not ( = ?auto_93579 ?auto_93580 ) ) ( not ( = ?auto_93579 ?auto_93581 ) ) ( not ( = ?auto_93579 ?auto_93582 ) ) ( not ( = ?auto_93580 ?auto_93581 ) ) ( not ( = ?auto_93580 ?auto_93582 ) ) ( not ( = ?auto_93581 ?auto_93582 ) ) ( ON ?auto_93580 ?auto_93581 ) ( ON ?auto_93579 ?auto_93580 ) ( ON ?auto_93578 ?auto_93579 ) ( CLEAR ?auto_93578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93578 )
      ( MAKE-4PILE ?auto_93578 ?auto_93579 ?auto_93580 ?auto_93581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93587 - BLOCK
      ?auto_93588 - BLOCK
      ?auto_93589 - BLOCK
      ?auto_93590 - BLOCK
    )
    :vars
    (
      ?auto_93591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93590 ?auto_93591 ) ( not ( = ?auto_93587 ?auto_93588 ) ) ( not ( = ?auto_93587 ?auto_93589 ) ) ( not ( = ?auto_93587 ?auto_93590 ) ) ( not ( = ?auto_93587 ?auto_93591 ) ) ( not ( = ?auto_93588 ?auto_93589 ) ) ( not ( = ?auto_93588 ?auto_93590 ) ) ( not ( = ?auto_93588 ?auto_93591 ) ) ( not ( = ?auto_93589 ?auto_93590 ) ) ( not ( = ?auto_93589 ?auto_93591 ) ) ( not ( = ?auto_93590 ?auto_93591 ) ) ( ON ?auto_93589 ?auto_93590 ) ( ON ?auto_93588 ?auto_93589 ) ( ON ?auto_93587 ?auto_93588 ) ( CLEAR ?auto_93587 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93587 )
      ( MAKE-4PILE ?auto_93587 ?auto_93588 ?auto_93589 ?auto_93590 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93597 - BLOCK
      ?auto_93598 - BLOCK
      ?auto_93599 - BLOCK
      ?auto_93600 - BLOCK
      ?auto_93601 - BLOCK
    )
    :vars
    (
      ?auto_93602 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93600 ) ( ON ?auto_93601 ?auto_93602 ) ( CLEAR ?auto_93601 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93597 ) ( ON ?auto_93598 ?auto_93597 ) ( ON ?auto_93599 ?auto_93598 ) ( ON ?auto_93600 ?auto_93599 ) ( not ( = ?auto_93597 ?auto_93598 ) ) ( not ( = ?auto_93597 ?auto_93599 ) ) ( not ( = ?auto_93597 ?auto_93600 ) ) ( not ( = ?auto_93597 ?auto_93601 ) ) ( not ( = ?auto_93597 ?auto_93602 ) ) ( not ( = ?auto_93598 ?auto_93599 ) ) ( not ( = ?auto_93598 ?auto_93600 ) ) ( not ( = ?auto_93598 ?auto_93601 ) ) ( not ( = ?auto_93598 ?auto_93602 ) ) ( not ( = ?auto_93599 ?auto_93600 ) ) ( not ( = ?auto_93599 ?auto_93601 ) ) ( not ( = ?auto_93599 ?auto_93602 ) ) ( not ( = ?auto_93600 ?auto_93601 ) ) ( not ( = ?auto_93600 ?auto_93602 ) ) ( not ( = ?auto_93601 ?auto_93602 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93601 ?auto_93602 )
      ( !STACK ?auto_93601 ?auto_93600 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93608 - BLOCK
      ?auto_93609 - BLOCK
      ?auto_93610 - BLOCK
      ?auto_93611 - BLOCK
      ?auto_93612 - BLOCK
    )
    :vars
    (
      ?auto_93613 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93611 ) ( ON ?auto_93612 ?auto_93613 ) ( CLEAR ?auto_93612 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93608 ) ( ON ?auto_93609 ?auto_93608 ) ( ON ?auto_93610 ?auto_93609 ) ( ON ?auto_93611 ?auto_93610 ) ( not ( = ?auto_93608 ?auto_93609 ) ) ( not ( = ?auto_93608 ?auto_93610 ) ) ( not ( = ?auto_93608 ?auto_93611 ) ) ( not ( = ?auto_93608 ?auto_93612 ) ) ( not ( = ?auto_93608 ?auto_93613 ) ) ( not ( = ?auto_93609 ?auto_93610 ) ) ( not ( = ?auto_93609 ?auto_93611 ) ) ( not ( = ?auto_93609 ?auto_93612 ) ) ( not ( = ?auto_93609 ?auto_93613 ) ) ( not ( = ?auto_93610 ?auto_93611 ) ) ( not ( = ?auto_93610 ?auto_93612 ) ) ( not ( = ?auto_93610 ?auto_93613 ) ) ( not ( = ?auto_93611 ?auto_93612 ) ) ( not ( = ?auto_93611 ?auto_93613 ) ) ( not ( = ?auto_93612 ?auto_93613 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93612 ?auto_93613 )
      ( !STACK ?auto_93612 ?auto_93611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93619 - BLOCK
      ?auto_93620 - BLOCK
      ?auto_93621 - BLOCK
      ?auto_93622 - BLOCK
      ?auto_93623 - BLOCK
    )
    :vars
    (
      ?auto_93624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93623 ?auto_93624 ) ( ON-TABLE ?auto_93619 ) ( ON ?auto_93620 ?auto_93619 ) ( ON ?auto_93621 ?auto_93620 ) ( not ( = ?auto_93619 ?auto_93620 ) ) ( not ( = ?auto_93619 ?auto_93621 ) ) ( not ( = ?auto_93619 ?auto_93622 ) ) ( not ( = ?auto_93619 ?auto_93623 ) ) ( not ( = ?auto_93619 ?auto_93624 ) ) ( not ( = ?auto_93620 ?auto_93621 ) ) ( not ( = ?auto_93620 ?auto_93622 ) ) ( not ( = ?auto_93620 ?auto_93623 ) ) ( not ( = ?auto_93620 ?auto_93624 ) ) ( not ( = ?auto_93621 ?auto_93622 ) ) ( not ( = ?auto_93621 ?auto_93623 ) ) ( not ( = ?auto_93621 ?auto_93624 ) ) ( not ( = ?auto_93622 ?auto_93623 ) ) ( not ( = ?auto_93622 ?auto_93624 ) ) ( not ( = ?auto_93623 ?auto_93624 ) ) ( CLEAR ?auto_93621 ) ( ON ?auto_93622 ?auto_93623 ) ( CLEAR ?auto_93622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93619 ?auto_93620 ?auto_93621 ?auto_93622 )
      ( MAKE-5PILE ?auto_93619 ?auto_93620 ?auto_93621 ?auto_93622 ?auto_93623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93630 - BLOCK
      ?auto_93631 - BLOCK
      ?auto_93632 - BLOCK
      ?auto_93633 - BLOCK
      ?auto_93634 - BLOCK
    )
    :vars
    (
      ?auto_93635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93634 ?auto_93635 ) ( ON-TABLE ?auto_93630 ) ( ON ?auto_93631 ?auto_93630 ) ( ON ?auto_93632 ?auto_93631 ) ( not ( = ?auto_93630 ?auto_93631 ) ) ( not ( = ?auto_93630 ?auto_93632 ) ) ( not ( = ?auto_93630 ?auto_93633 ) ) ( not ( = ?auto_93630 ?auto_93634 ) ) ( not ( = ?auto_93630 ?auto_93635 ) ) ( not ( = ?auto_93631 ?auto_93632 ) ) ( not ( = ?auto_93631 ?auto_93633 ) ) ( not ( = ?auto_93631 ?auto_93634 ) ) ( not ( = ?auto_93631 ?auto_93635 ) ) ( not ( = ?auto_93632 ?auto_93633 ) ) ( not ( = ?auto_93632 ?auto_93634 ) ) ( not ( = ?auto_93632 ?auto_93635 ) ) ( not ( = ?auto_93633 ?auto_93634 ) ) ( not ( = ?auto_93633 ?auto_93635 ) ) ( not ( = ?auto_93634 ?auto_93635 ) ) ( CLEAR ?auto_93632 ) ( ON ?auto_93633 ?auto_93634 ) ( CLEAR ?auto_93633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93630 ?auto_93631 ?auto_93632 ?auto_93633 )
      ( MAKE-5PILE ?auto_93630 ?auto_93631 ?auto_93632 ?auto_93633 ?auto_93634 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93641 - BLOCK
      ?auto_93642 - BLOCK
      ?auto_93643 - BLOCK
      ?auto_93644 - BLOCK
      ?auto_93645 - BLOCK
    )
    :vars
    (
      ?auto_93646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93645 ?auto_93646 ) ( ON-TABLE ?auto_93641 ) ( ON ?auto_93642 ?auto_93641 ) ( not ( = ?auto_93641 ?auto_93642 ) ) ( not ( = ?auto_93641 ?auto_93643 ) ) ( not ( = ?auto_93641 ?auto_93644 ) ) ( not ( = ?auto_93641 ?auto_93645 ) ) ( not ( = ?auto_93641 ?auto_93646 ) ) ( not ( = ?auto_93642 ?auto_93643 ) ) ( not ( = ?auto_93642 ?auto_93644 ) ) ( not ( = ?auto_93642 ?auto_93645 ) ) ( not ( = ?auto_93642 ?auto_93646 ) ) ( not ( = ?auto_93643 ?auto_93644 ) ) ( not ( = ?auto_93643 ?auto_93645 ) ) ( not ( = ?auto_93643 ?auto_93646 ) ) ( not ( = ?auto_93644 ?auto_93645 ) ) ( not ( = ?auto_93644 ?auto_93646 ) ) ( not ( = ?auto_93645 ?auto_93646 ) ) ( ON ?auto_93644 ?auto_93645 ) ( CLEAR ?auto_93642 ) ( ON ?auto_93643 ?auto_93644 ) ( CLEAR ?auto_93643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93641 ?auto_93642 ?auto_93643 )
      ( MAKE-5PILE ?auto_93641 ?auto_93642 ?auto_93643 ?auto_93644 ?auto_93645 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93652 - BLOCK
      ?auto_93653 - BLOCK
      ?auto_93654 - BLOCK
      ?auto_93655 - BLOCK
      ?auto_93656 - BLOCK
    )
    :vars
    (
      ?auto_93657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93656 ?auto_93657 ) ( ON-TABLE ?auto_93652 ) ( ON ?auto_93653 ?auto_93652 ) ( not ( = ?auto_93652 ?auto_93653 ) ) ( not ( = ?auto_93652 ?auto_93654 ) ) ( not ( = ?auto_93652 ?auto_93655 ) ) ( not ( = ?auto_93652 ?auto_93656 ) ) ( not ( = ?auto_93652 ?auto_93657 ) ) ( not ( = ?auto_93653 ?auto_93654 ) ) ( not ( = ?auto_93653 ?auto_93655 ) ) ( not ( = ?auto_93653 ?auto_93656 ) ) ( not ( = ?auto_93653 ?auto_93657 ) ) ( not ( = ?auto_93654 ?auto_93655 ) ) ( not ( = ?auto_93654 ?auto_93656 ) ) ( not ( = ?auto_93654 ?auto_93657 ) ) ( not ( = ?auto_93655 ?auto_93656 ) ) ( not ( = ?auto_93655 ?auto_93657 ) ) ( not ( = ?auto_93656 ?auto_93657 ) ) ( ON ?auto_93655 ?auto_93656 ) ( CLEAR ?auto_93653 ) ( ON ?auto_93654 ?auto_93655 ) ( CLEAR ?auto_93654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93652 ?auto_93653 ?auto_93654 )
      ( MAKE-5PILE ?auto_93652 ?auto_93653 ?auto_93654 ?auto_93655 ?auto_93656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93663 - BLOCK
      ?auto_93664 - BLOCK
      ?auto_93665 - BLOCK
      ?auto_93666 - BLOCK
      ?auto_93667 - BLOCK
    )
    :vars
    (
      ?auto_93668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93667 ?auto_93668 ) ( ON-TABLE ?auto_93663 ) ( not ( = ?auto_93663 ?auto_93664 ) ) ( not ( = ?auto_93663 ?auto_93665 ) ) ( not ( = ?auto_93663 ?auto_93666 ) ) ( not ( = ?auto_93663 ?auto_93667 ) ) ( not ( = ?auto_93663 ?auto_93668 ) ) ( not ( = ?auto_93664 ?auto_93665 ) ) ( not ( = ?auto_93664 ?auto_93666 ) ) ( not ( = ?auto_93664 ?auto_93667 ) ) ( not ( = ?auto_93664 ?auto_93668 ) ) ( not ( = ?auto_93665 ?auto_93666 ) ) ( not ( = ?auto_93665 ?auto_93667 ) ) ( not ( = ?auto_93665 ?auto_93668 ) ) ( not ( = ?auto_93666 ?auto_93667 ) ) ( not ( = ?auto_93666 ?auto_93668 ) ) ( not ( = ?auto_93667 ?auto_93668 ) ) ( ON ?auto_93666 ?auto_93667 ) ( ON ?auto_93665 ?auto_93666 ) ( CLEAR ?auto_93663 ) ( ON ?auto_93664 ?auto_93665 ) ( CLEAR ?auto_93664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93663 ?auto_93664 )
      ( MAKE-5PILE ?auto_93663 ?auto_93664 ?auto_93665 ?auto_93666 ?auto_93667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93674 - BLOCK
      ?auto_93675 - BLOCK
      ?auto_93676 - BLOCK
      ?auto_93677 - BLOCK
      ?auto_93678 - BLOCK
    )
    :vars
    (
      ?auto_93679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93678 ?auto_93679 ) ( ON-TABLE ?auto_93674 ) ( not ( = ?auto_93674 ?auto_93675 ) ) ( not ( = ?auto_93674 ?auto_93676 ) ) ( not ( = ?auto_93674 ?auto_93677 ) ) ( not ( = ?auto_93674 ?auto_93678 ) ) ( not ( = ?auto_93674 ?auto_93679 ) ) ( not ( = ?auto_93675 ?auto_93676 ) ) ( not ( = ?auto_93675 ?auto_93677 ) ) ( not ( = ?auto_93675 ?auto_93678 ) ) ( not ( = ?auto_93675 ?auto_93679 ) ) ( not ( = ?auto_93676 ?auto_93677 ) ) ( not ( = ?auto_93676 ?auto_93678 ) ) ( not ( = ?auto_93676 ?auto_93679 ) ) ( not ( = ?auto_93677 ?auto_93678 ) ) ( not ( = ?auto_93677 ?auto_93679 ) ) ( not ( = ?auto_93678 ?auto_93679 ) ) ( ON ?auto_93677 ?auto_93678 ) ( ON ?auto_93676 ?auto_93677 ) ( CLEAR ?auto_93674 ) ( ON ?auto_93675 ?auto_93676 ) ( CLEAR ?auto_93675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93674 ?auto_93675 )
      ( MAKE-5PILE ?auto_93674 ?auto_93675 ?auto_93676 ?auto_93677 ?auto_93678 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93685 - BLOCK
      ?auto_93686 - BLOCK
      ?auto_93687 - BLOCK
      ?auto_93688 - BLOCK
      ?auto_93689 - BLOCK
    )
    :vars
    (
      ?auto_93690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93689 ?auto_93690 ) ( not ( = ?auto_93685 ?auto_93686 ) ) ( not ( = ?auto_93685 ?auto_93687 ) ) ( not ( = ?auto_93685 ?auto_93688 ) ) ( not ( = ?auto_93685 ?auto_93689 ) ) ( not ( = ?auto_93685 ?auto_93690 ) ) ( not ( = ?auto_93686 ?auto_93687 ) ) ( not ( = ?auto_93686 ?auto_93688 ) ) ( not ( = ?auto_93686 ?auto_93689 ) ) ( not ( = ?auto_93686 ?auto_93690 ) ) ( not ( = ?auto_93687 ?auto_93688 ) ) ( not ( = ?auto_93687 ?auto_93689 ) ) ( not ( = ?auto_93687 ?auto_93690 ) ) ( not ( = ?auto_93688 ?auto_93689 ) ) ( not ( = ?auto_93688 ?auto_93690 ) ) ( not ( = ?auto_93689 ?auto_93690 ) ) ( ON ?auto_93688 ?auto_93689 ) ( ON ?auto_93687 ?auto_93688 ) ( ON ?auto_93686 ?auto_93687 ) ( ON ?auto_93685 ?auto_93686 ) ( CLEAR ?auto_93685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93685 )
      ( MAKE-5PILE ?auto_93685 ?auto_93686 ?auto_93687 ?auto_93688 ?auto_93689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93696 - BLOCK
      ?auto_93697 - BLOCK
      ?auto_93698 - BLOCK
      ?auto_93699 - BLOCK
      ?auto_93700 - BLOCK
    )
    :vars
    (
      ?auto_93701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93700 ?auto_93701 ) ( not ( = ?auto_93696 ?auto_93697 ) ) ( not ( = ?auto_93696 ?auto_93698 ) ) ( not ( = ?auto_93696 ?auto_93699 ) ) ( not ( = ?auto_93696 ?auto_93700 ) ) ( not ( = ?auto_93696 ?auto_93701 ) ) ( not ( = ?auto_93697 ?auto_93698 ) ) ( not ( = ?auto_93697 ?auto_93699 ) ) ( not ( = ?auto_93697 ?auto_93700 ) ) ( not ( = ?auto_93697 ?auto_93701 ) ) ( not ( = ?auto_93698 ?auto_93699 ) ) ( not ( = ?auto_93698 ?auto_93700 ) ) ( not ( = ?auto_93698 ?auto_93701 ) ) ( not ( = ?auto_93699 ?auto_93700 ) ) ( not ( = ?auto_93699 ?auto_93701 ) ) ( not ( = ?auto_93700 ?auto_93701 ) ) ( ON ?auto_93699 ?auto_93700 ) ( ON ?auto_93698 ?auto_93699 ) ( ON ?auto_93697 ?auto_93698 ) ( ON ?auto_93696 ?auto_93697 ) ( CLEAR ?auto_93696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93696 )
      ( MAKE-5PILE ?auto_93696 ?auto_93697 ?auto_93698 ?auto_93699 ?auto_93700 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93708 - BLOCK
      ?auto_93709 - BLOCK
      ?auto_93710 - BLOCK
      ?auto_93711 - BLOCK
      ?auto_93712 - BLOCK
      ?auto_93713 - BLOCK
    )
    :vars
    (
      ?auto_93714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93712 ) ( ON ?auto_93713 ?auto_93714 ) ( CLEAR ?auto_93713 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93708 ) ( ON ?auto_93709 ?auto_93708 ) ( ON ?auto_93710 ?auto_93709 ) ( ON ?auto_93711 ?auto_93710 ) ( ON ?auto_93712 ?auto_93711 ) ( not ( = ?auto_93708 ?auto_93709 ) ) ( not ( = ?auto_93708 ?auto_93710 ) ) ( not ( = ?auto_93708 ?auto_93711 ) ) ( not ( = ?auto_93708 ?auto_93712 ) ) ( not ( = ?auto_93708 ?auto_93713 ) ) ( not ( = ?auto_93708 ?auto_93714 ) ) ( not ( = ?auto_93709 ?auto_93710 ) ) ( not ( = ?auto_93709 ?auto_93711 ) ) ( not ( = ?auto_93709 ?auto_93712 ) ) ( not ( = ?auto_93709 ?auto_93713 ) ) ( not ( = ?auto_93709 ?auto_93714 ) ) ( not ( = ?auto_93710 ?auto_93711 ) ) ( not ( = ?auto_93710 ?auto_93712 ) ) ( not ( = ?auto_93710 ?auto_93713 ) ) ( not ( = ?auto_93710 ?auto_93714 ) ) ( not ( = ?auto_93711 ?auto_93712 ) ) ( not ( = ?auto_93711 ?auto_93713 ) ) ( not ( = ?auto_93711 ?auto_93714 ) ) ( not ( = ?auto_93712 ?auto_93713 ) ) ( not ( = ?auto_93712 ?auto_93714 ) ) ( not ( = ?auto_93713 ?auto_93714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93713 ?auto_93714 )
      ( !STACK ?auto_93713 ?auto_93712 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93721 - BLOCK
      ?auto_93722 - BLOCK
      ?auto_93723 - BLOCK
      ?auto_93724 - BLOCK
      ?auto_93725 - BLOCK
      ?auto_93726 - BLOCK
    )
    :vars
    (
      ?auto_93727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93725 ) ( ON ?auto_93726 ?auto_93727 ) ( CLEAR ?auto_93726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93721 ) ( ON ?auto_93722 ?auto_93721 ) ( ON ?auto_93723 ?auto_93722 ) ( ON ?auto_93724 ?auto_93723 ) ( ON ?auto_93725 ?auto_93724 ) ( not ( = ?auto_93721 ?auto_93722 ) ) ( not ( = ?auto_93721 ?auto_93723 ) ) ( not ( = ?auto_93721 ?auto_93724 ) ) ( not ( = ?auto_93721 ?auto_93725 ) ) ( not ( = ?auto_93721 ?auto_93726 ) ) ( not ( = ?auto_93721 ?auto_93727 ) ) ( not ( = ?auto_93722 ?auto_93723 ) ) ( not ( = ?auto_93722 ?auto_93724 ) ) ( not ( = ?auto_93722 ?auto_93725 ) ) ( not ( = ?auto_93722 ?auto_93726 ) ) ( not ( = ?auto_93722 ?auto_93727 ) ) ( not ( = ?auto_93723 ?auto_93724 ) ) ( not ( = ?auto_93723 ?auto_93725 ) ) ( not ( = ?auto_93723 ?auto_93726 ) ) ( not ( = ?auto_93723 ?auto_93727 ) ) ( not ( = ?auto_93724 ?auto_93725 ) ) ( not ( = ?auto_93724 ?auto_93726 ) ) ( not ( = ?auto_93724 ?auto_93727 ) ) ( not ( = ?auto_93725 ?auto_93726 ) ) ( not ( = ?auto_93725 ?auto_93727 ) ) ( not ( = ?auto_93726 ?auto_93727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93726 ?auto_93727 )
      ( !STACK ?auto_93726 ?auto_93725 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93734 - BLOCK
      ?auto_93735 - BLOCK
      ?auto_93736 - BLOCK
      ?auto_93737 - BLOCK
      ?auto_93738 - BLOCK
      ?auto_93739 - BLOCK
    )
    :vars
    (
      ?auto_93740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93739 ?auto_93740 ) ( ON-TABLE ?auto_93734 ) ( ON ?auto_93735 ?auto_93734 ) ( ON ?auto_93736 ?auto_93735 ) ( ON ?auto_93737 ?auto_93736 ) ( not ( = ?auto_93734 ?auto_93735 ) ) ( not ( = ?auto_93734 ?auto_93736 ) ) ( not ( = ?auto_93734 ?auto_93737 ) ) ( not ( = ?auto_93734 ?auto_93738 ) ) ( not ( = ?auto_93734 ?auto_93739 ) ) ( not ( = ?auto_93734 ?auto_93740 ) ) ( not ( = ?auto_93735 ?auto_93736 ) ) ( not ( = ?auto_93735 ?auto_93737 ) ) ( not ( = ?auto_93735 ?auto_93738 ) ) ( not ( = ?auto_93735 ?auto_93739 ) ) ( not ( = ?auto_93735 ?auto_93740 ) ) ( not ( = ?auto_93736 ?auto_93737 ) ) ( not ( = ?auto_93736 ?auto_93738 ) ) ( not ( = ?auto_93736 ?auto_93739 ) ) ( not ( = ?auto_93736 ?auto_93740 ) ) ( not ( = ?auto_93737 ?auto_93738 ) ) ( not ( = ?auto_93737 ?auto_93739 ) ) ( not ( = ?auto_93737 ?auto_93740 ) ) ( not ( = ?auto_93738 ?auto_93739 ) ) ( not ( = ?auto_93738 ?auto_93740 ) ) ( not ( = ?auto_93739 ?auto_93740 ) ) ( CLEAR ?auto_93737 ) ( ON ?auto_93738 ?auto_93739 ) ( CLEAR ?auto_93738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93734 ?auto_93735 ?auto_93736 ?auto_93737 ?auto_93738 )
      ( MAKE-6PILE ?auto_93734 ?auto_93735 ?auto_93736 ?auto_93737 ?auto_93738 ?auto_93739 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93747 - BLOCK
      ?auto_93748 - BLOCK
      ?auto_93749 - BLOCK
      ?auto_93750 - BLOCK
      ?auto_93751 - BLOCK
      ?auto_93752 - BLOCK
    )
    :vars
    (
      ?auto_93753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93752 ?auto_93753 ) ( ON-TABLE ?auto_93747 ) ( ON ?auto_93748 ?auto_93747 ) ( ON ?auto_93749 ?auto_93748 ) ( ON ?auto_93750 ?auto_93749 ) ( not ( = ?auto_93747 ?auto_93748 ) ) ( not ( = ?auto_93747 ?auto_93749 ) ) ( not ( = ?auto_93747 ?auto_93750 ) ) ( not ( = ?auto_93747 ?auto_93751 ) ) ( not ( = ?auto_93747 ?auto_93752 ) ) ( not ( = ?auto_93747 ?auto_93753 ) ) ( not ( = ?auto_93748 ?auto_93749 ) ) ( not ( = ?auto_93748 ?auto_93750 ) ) ( not ( = ?auto_93748 ?auto_93751 ) ) ( not ( = ?auto_93748 ?auto_93752 ) ) ( not ( = ?auto_93748 ?auto_93753 ) ) ( not ( = ?auto_93749 ?auto_93750 ) ) ( not ( = ?auto_93749 ?auto_93751 ) ) ( not ( = ?auto_93749 ?auto_93752 ) ) ( not ( = ?auto_93749 ?auto_93753 ) ) ( not ( = ?auto_93750 ?auto_93751 ) ) ( not ( = ?auto_93750 ?auto_93752 ) ) ( not ( = ?auto_93750 ?auto_93753 ) ) ( not ( = ?auto_93751 ?auto_93752 ) ) ( not ( = ?auto_93751 ?auto_93753 ) ) ( not ( = ?auto_93752 ?auto_93753 ) ) ( CLEAR ?auto_93750 ) ( ON ?auto_93751 ?auto_93752 ) ( CLEAR ?auto_93751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93747 ?auto_93748 ?auto_93749 ?auto_93750 ?auto_93751 )
      ( MAKE-6PILE ?auto_93747 ?auto_93748 ?auto_93749 ?auto_93750 ?auto_93751 ?auto_93752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93760 - BLOCK
      ?auto_93761 - BLOCK
      ?auto_93762 - BLOCK
      ?auto_93763 - BLOCK
      ?auto_93764 - BLOCK
      ?auto_93765 - BLOCK
    )
    :vars
    (
      ?auto_93766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93765 ?auto_93766 ) ( ON-TABLE ?auto_93760 ) ( ON ?auto_93761 ?auto_93760 ) ( ON ?auto_93762 ?auto_93761 ) ( not ( = ?auto_93760 ?auto_93761 ) ) ( not ( = ?auto_93760 ?auto_93762 ) ) ( not ( = ?auto_93760 ?auto_93763 ) ) ( not ( = ?auto_93760 ?auto_93764 ) ) ( not ( = ?auto_93760 ?auto_93765 ) ) ( not ( = ?auto_93760 ?auto_93766 ) ) ( not ( = ?auto_93761 ?auto_93762 ) ) ( not ( = ?auto_93761 ?auto_93763 ) ) ( not ( = ?auto_93761 ?auto_93764 ) ) ( not ( = ?auto_93761 ?auto_93765 ) ) ( not ( = ?auto_93761 ?auto_93766 ) ) ( not ( = ?auto_93762 ?auto_93763 ) ) ( not ( = ?auto_93762 ?auto_93764 ) ) ( not ( = ?auto_93762 ?auto_93765 ) ) ( not ( = ?auto_93762 ?auto_93766 ) ) ( not ( = ?auto_93763 ?auto_93764 ) ) ( not ( = ?auto_93763 ?auto_93765 ) ) ( not ( = ?auto_93763 ?auto_93766 ) ) ( not ( = ?auto_93764 ?auto_93765 ) ) ( not ( = ?auto_93764 ?auto_93766 ) ) ( not ( = ?auto_93765 ?auto_93766 ) ) ( ON ?auto_93764 ?auto_93765 ) ( CLEAR ?auto_93762 ) ( ON ?auto_93763 ?auto_93764 ) ( CLEAR ?auto_93763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93760 ?auto_93761 ?auto_93762 ?auto_93763 )
      ( MAKE-6PILE ?auto_93760 ?auto_93761 ?auto_93762 ?auto_93763 ?auto_93764 ?auto_93765 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93773 - BLOCK
      ?auto_93774 - BLOCK
      ?auto_93775 - BLOCK
      ?auto_93776 - BLOCK
      ?auto_93777 - BLOCK
      ?auto_93778 - BLOCK
    )
    :vars
    (
      ?auto_93779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93778 ?auto_93779 ) ( ON-TABLE ?auto_93773 ) ( ON ?auto_93774 ?auto_93773 ) ( ON ?auto_93775 ?auto_93774 ) ( not ( = ?auto_93773 ?auto_93774 ) ) ( not ( = ?auto_93773 ?auto_93775 ) ) ( not ( = ?auto_93773 ?auto_93776 ) ) ( not ( = ?auto_93773 ?auto_93777 ) ) ( not ( = ?auto_93773 ?auto_93778 ) ) ( not ( = ?auto_93773 ?auto_93779 ) ) ( not ( = ?auto_93774 ?auto_93775 ) ) ( not ( = ?auto_93774 ?auto_93776 ) ) ( not ( = ?auto_93774 ?auto_93777 ) ) ( not ( = ?auto_93774 ?auto_93778 ) ) ( not ( = ?auto_93774 ?auto_93779 ) ) ( not ( = ?auto_93775 ?auto_93776 ) ) ( not ( = ?auto_93775 ?auto_93777 ) ) ( not ( = ?auto_93775 ?auto_93778 ) ) ( not ( = ?auto_93775 ?auto_93779 ) ) ( not ( = ?auto_93776 ?auto_93777 ) ) ( not ( = ?auto_93776 ?auto_93778 ) ) ( not ( = ?auto_93776 ?auto_93779 ) ) ( not ( = ?auto_93777 ?auto_93778 ) ) ( not ( = ?auto_93777 ?auto_93779 ) ) ( not ( = ?auto_93778 ?auto_93779 ) ) ( ON ?auto_93777 ?auto_93778 ) ( CLEAR ?auto_93775 ) ( ON ?auto_93776 ?auto_93777 ) ( CLEAR ?auto_93776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93773 ?auto_93774 ?auto_93775 ?auto_93776 )
      ( MAKE-6PILE ?auto_93773 ?auto_93774 ?auto_93775 ?auto_93776 ?auto_93777 ?auto_93778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93786 - BLOCK
      ?auto_93787 - BLOCK
      ?auto_93788 - BLOCK
      ?auto_93789 - BLOCK
      ?auto_93790 - BLOCK
      ?auto_93791 - BLOCK
    )
    :vars
    (
      ?auto_93792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93791 ?auto_93792 ) ( ON-TABLE ?auto_93786 ) ( ON ?auto_93787 ?auto_93786 ) ( not ( = ?auto_93786 ?auto_93787 ) ) ( not ( = ?auto_93786 ?auto_93788 ) ) ( not ( = ?auto_93786 ?auto_93789 ) ) ( not ( = ?auto_93786 ?auto_93790 ) ) ( not ( = ?auto_93786 ?auto_93791 ) ) ( not ( = ?auto_93786 ?auto_93792 ) ) ( not ( = ?auto_93787 ?auto_93788 ) ) ( not ( = ?auto_93787 ?auto_93789 ) ) ( not ( = ?auto_93787 ?auto_93790 ) ) ( not ( = ?auto_93787 ?auto_93791 ) ) ( not ( = ?auto_93787 ?auto_93792 ) ) ( not ( = ?auto_93788 ?auto_93789 ) ) ( not ( = ?auto_93788 ?auto_93790 ) ) ( not ( = ?auto_93788 ?auto_93791 ) ) ( not ( = ?auto_93788 ?auto_93792 ) ) ( not ( = ?auto_93789 ?auto_93790 ) ) ( not ( = ?auto_93789 ?auto_93791 ) ) ( not ( = ?auto_93789 ?auto_93792 ) ) ( not ( = ?auto_93790 ?auto_93791 ) ) ( not ( = ?auto_93790 ?auto_93792 ) ) ( not ( = ?auto_93791 ?auto_93792 ) ) ( ON ?auto_93790 ?auto_93791 ) ( ON ?auto_93789 ?auto_93790 ) ( CLEAR ?auto_93787 ) ( ON ?auto_93788 ?auto_93789 ) ( CLEAR ?auto_93788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93786 ?auto_93787 ?auto_93788 )
      ( MAKE-6PILE ?auto_93786 ?auto_93787 ?auto_93788 ?auto_93789 ?auto_93790 ?auto_93791 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93799 - BLOCK
      ?auto_93800 - BLOCK
      ?auto_93801 - BLOCK
      ?auto_93802 - BLOCK
      ?auto_93803 - BLOCK
      ?auto_93804 - BLOCK
    )
    :vars
    (
      ?auto_93805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93804 ?auto_93805 ) ( ON-TABLE ?auto_93799 ) ( ON ?auto_93800 ?auto_93799 ) ( not ( = ?auto_93799 ?auto_93800 ) ) ( not ( = ?auto_93799 ?auto_93801 ) ) ( not ( = ?auto_93799 ?auto_93802 ) ) ( not ( = ?auto_93799 ?auto_93803 ) ) ( not ( = ?auto_93799 ?auto_93804 ) ) ( not ( = ?auto_93799 ?auto_93805 ) ) ( not ( = ?auto_93800 ?auto_93801 ) ) ( not ( = ?auto_93800 ?auto_93802 ) ) ( not ( = ?auto_93800 ?auto_93803 ) ) ( not ( = ?auto_93800 ?auto_93804 ) ) ( not ( = ?auto_93800 ?auto_93805 ) ) ( not ( = ?auto_93801 ?auto_93802 ) ) ( not ( = ?auto_93801 ?auto_93803 ) ) ( not ( = ?auto_93801 ?auto_93804 ) ) ( not ( = ?auto_93801 ?auto_93805 ) ) ( not ( = ?auto_93802 ?auto_93803 ) ) ( not ( = ?auto_93802 ?auto_93804 ) ) ( not ( = ?auto_93802 ?auto_93805 ) ) ( not ( = ?auto_93803 ?auto_93804 ) ) ( not ( = ?auto_93803 ?auto_93805 ) ) ( not ( = ?auto_93804 ?auto_93805 ) ) ( ON ?auto_93803 ?auto_93804 ) ( ON ?auto_93802 ?auto_93803 ) ( CLEAR ?auto_93800 ) ( ON ?auto_93801 ?auto_93802 ) ( CLEAR ?auto_93801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93799 ?auto_93800 ?auto_93801 )
      ( MAKE-6PILE ?auto_93799 ?auto_93800 ?auto_93801 ?auto_93802 ?auto_93803 ?auto_93804 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93812 - BLOCK
      ?auto_93813 - BLOCK
      ?auto_93814 - BLOCK
      ?auto_93815 - BLOCK
      ?auto_93816 - BLOCK
      ?auto_93817 - BLOCK
    )
    :vars
    (
      ?auto_93818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93817 ?auto_93818 ) ( ON-TABLE ?auto_93812 ) ( not ( = ?auto_93812 ?auto_93813 ) ) ( not ( = ?auto_93812 ?auto_93814 ) ) ( not ( = ?auto_93812 ?auto_93815 ) ) ( not ( = ?auto_93812 ?auto_93816 ) ) ( not ( = ?auto_93812 ?auto_93817 ) ) ( not ( = ?auto_93812 ?auto_93818 ) ) ( not ( = ?auto_93813 ?auto_93814 ) ) ( not ( = ?auto_93813 ?auto_93815 ) ) ( not ( = ?auto_93813 ?auto_93816 ) ) ( not ( = ?auto_93813 ?auto_93817 ) ) ( not ( = ?auto_93813 ?auto_93818 ) ) ( not ( = ?auto_93814 ?auto_93815 ) ) ( not ( = ?auto_93814 ?auto_93816 ) ) ( not ( = ?auto_93814 ?auto_93817 ) ) ( not ( = ?auto_93814 ?auto_93818 ) ) ( not ( = ?auto_93815 ?auto_93816 ) ) ( not ( = ?auto_93815 ?auto_93817 ) ) ( not ( = ?auto_93815 ?auto_93818 ) ) ( not ( = ?auto_93816 ?auto_93817 ) ) ( not ( = ?auto_93816 ?auto_93818 ) ) ( not ( = ?auto_93817 ?auto_93818 ) ) ( ON ?auto_93816 ?auto_93817 ) ( ON ?auto_93815 ?auto_93816 ) ( ON ?auto_93814 ?auto_93815 ) ( CLEAR ?auto_93812 ) ( ON ?auto_93813 ?auto_93814 ) ( CLEAR ?auto_93813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93812 ?auto_93813 )
      ( MAKE-6PILE ?auto_93812 ?auto_93813 ?auto_93814 ?auto_93815 ?auto_93816 ?auto_93817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93825 - BLOCK
      ?auto_93826 - BLOCK
      ?auto_93827 - BLOCK
      ?auto_93828 - BLOCK
      ?auto_93829 - BLOCK
      ?auto_93830 - BLOCK
    )
    :vars
    (
      ?auto_93831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93830 ?auto_93831 ) ( ON-TABLE ?auto_93825 ) ( not ( = ?auto_93825 ?auto_93826 ) ) ( not ( = ?auto_93825 ?auto_93827 ) ) ( not ( = ?auto_93825 ?auto_93828 ) ) ( not ( = ?auto_93825 ?auto_93829 ) ) ( not ( = ?auto_93825 ?auto_93830 ) ) ( not ( = ?auto_93825 ?auto_93831 ) ) ( not ( = ?auto_93826 ?auto_93827 ) ) ( not ( = ?auto_93826 ?auto_93828 ) ) ( not ( = ?auto_93826 ?auto_93829 ) ) ( not ( = ?auto_93826 ?auto_93830 ) ) ( not ( = ?auto_93826 ?auto_93831 ) ) ( not ( = ?auto_93827 ?auto_93828 ) ) ( not ( = ?auto_93827 ?auto_93829 ) ) ( not ( = ?auto_93827 ?auto_93830 ) ) ( not ( = ?auto_93827 ?auto_93831 ) ) ( not ( = ?auto_93828 ?auto_93829 ) ) ( not ( = ?auto_93828 ?auto_93830 ) ) ( not ( = ?auto_93828 ?auto_93831 ) ) ( not ( = ?auto_93829 ?auto_93830 ) ) ( not ( = ?auto_93829 ?auto_93831 ) ) ( not ( = ?auto_93830 ?auto_93831 ) ) ( ON ?auto_93829 ?auto_93830 ) ( ON ?auto_93828 ?auto_93829 ) ( ON ?auto_93827 ?auto_93828 ) ( CLEAR ?auto_93825 ) ( ON ?auto_93826 ?auto_93827 ) ( CLEAR ?auto_93826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93825 ?auto_93826 )
      ( MAKE-6PILE ?auto_93825 ?auto_93826 ?auto_93827 ?auto_93828 ?auto_93829 ?auto_93830 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93838 - BLOCK
      ?auto_93839 - BLOCK
      ?auto_93840 - BLOCK
      ?auto_93841 - BLOCK
      ?auto_93842 - BLOCK
      ?auto_93843 - BLOCK
    )
    :vars
    (
      ?auto_93844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93843 ?auto_93844 ) ( not ( = ?auto_93838 ?auto_93839 ) ) ( not ( = ?auto_93838 ?auto_93840 ) ) ( not ( = ?auto_93838 ?auto_93841 ) ) ( not ( = ?auto_93838 ?auto_93842 ) ) ( not ( = ?auto_93838 ?auto_93843 ) ) ( not ( = ?auto_93838 ?auto_93844 ) ) ( not ( = ?auto_93839 ?auto_93840 ) ) ( not ( = ?auto_93839 ?auto_93841 ) ) ( not ( = ?auto_93839 ?auto_93842 ) ) ( not ( = ?auto_93839 ?auto_93843 ) ) ( not ( = ?auto_93839 ?auto_93844 ) ) ( not ( = ?auto_93840 ?auto_93841 ) ) ( not ( = ?auto_93840 ?auto_93842 ) ) ( not ( = ?auto_93840 ?auto_93843 ) ) ( not ( = ?auto_93840 ?auto_93844 ) ) ( not ( = ?auto_93841 ?auto_93842 ) ) ( not ( = ?auto_93841 ?auto_93843 ) ) ( not ( = ?auto_93841 ?auto_93844 ) ) ( not ( = ?auto_93842 ?auto_93843 ) ) ( not ( = ?auto_93842 ?auto_93844 ) ) ( not ( = ?auto_93843 ?auto_93844 ) ) ( ON ?auto_93842 ?auto_93843 ) ( ON ?auto_93841 ?auto_93842 ) ( ON ?auto_93840 ?auto_93841 ) ( ON ?auto_93839 ?auto_93840 ) ( ON ?auto_93838 ?auto_93839 ) ( CLEAR ?auto_93838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93838 )
      ( MAKE-6PILE ?auto_93838 ?auto_93839 ?auto_93840 ?auto_93841 ?auto_93842 ?auto_93843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93851 - BLOCK
      ?auto_93852 - BLOCK
      ?auto_93853 - BLOCK
      ?auto_93854 - BLOCK
      ?auto_93855 - BLOCK
      ?auto_93856 - BLOCK
    )
    :vars
    (
      ?auto_93857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93856 ?auto_93857 ) ( not ( = ?auto_93851 ?auto_93852 ) ) ( not ( = ?auto_93851 ?auto_93853 ) ) ( not ( = ?auto_93851 ?auto_93854 ) ) ( not ( = ?auto_93851 ?auto_93855 ) ) ( not ( = ?auto_93851 ?auto_93856 ) ) ( not ( = ?auto_93851 ?auto_93857 ) ) ( not ( = ?auto_93852 ?auto_93853 ) ) ( not ( = ?auto_93852 ?auto_93854 ) ) ( not ( = ?auto_93852 ?auto_93855 ) ) ( not ( = ?auto_93852 ?auto_93856 ) ) ( not ( = ?auto_93852 ?auto_93857 ) ) ( not ( = ?auto_93853 ?auto_93854 ) ) ( not ( = ?auto_93853 ?auto_93855 ) ) ( not ( = ?auto_93853 ?auto_93856 ) ) ( not ( = ?auto_93853 ?auto_93857 ) ) ( not ( = ?auto_93854 ?auto_93855 ) ) ( not ( = ?auto_93854 ?auto_93856 ) ) ( not ( = ?auto_93854 ?auto_93857 ) ) ( not ( = ?auto_93855 ?auto_93856 ) ) ( not ( = ?auto_93855 ?auto_93857 ) ) ( not ( = ?auto_93856 ?auto_93857 ) ) ( ON ?auto_93855 ?auto_93856 ) ( ON ?auto_93854 ?auto_93855 ) ( ON ?auto_93853 ?auto_93854 ) ( ON ?auto_93852 ?auto_93853 ) ( ON ?auto_93851 ?auto_93852 ) ( CLEAR ?auto_93851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93851 )
      ( MAKE-6PILE ?auto_93851 ?auto_93852 ?auto_93853 ?auto_93854 ?auto_93855 ?auto_93856 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93865 - BLOCK
      ?auto_93866 - BLOCK
      ?auto_93867 - BLOCK
      ?auto_93868 - BLOCK
      ?auto_93869 - BLOCK
      ?auto_93870 - BLOCK
      ?auto_93871 - BLOCK
    )
    :vars
    (
      ?auto_93872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93870 ) ( ON ?auto_93871 ?auto_93872 ) ( CLEAR ?auto_93871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93865 ) ( ON ?auto_93866 ?auto_93865 ) ( ON ?auto_93867 ?auto_93866 ) ( ON ?auto_93868 ?auto_93867 ) ( ON ?auto_93869 ?auto_93868 ) ( ON ?auto_93870 ?auto_93869 ) ( not ( = ?auto_93865 ?auto_93866 ) ) ( not ( = ?auto_93865 ?auto_93867 ) ) ( not ( = ?auto_93865 ?auto_93868 ) ) ( not ( = ?auto_93865 ?auto_93869 ) ) ( not ( = ?auto_93865 ?auto_93870 ) ) ( not ( = ?auto_93865 ?auto_93871 ) ) ( not ( = ?auto_93865 ?auto_93872 ) ) ( not ( = ?auto_93866 ?auto_93867 ) ) ( not ( = ?auto_93866 ?auto_93868 ) ) ( not ( = ?auto_93866 ?auto_93869 ) ) ( not ( = ?auto_93866 ?auto_93870 ) ) ( not ( = ?auto_93866 ?auto_93871 ) ) ( not ( = ?auto_93866 ?auto_93872 ) ) ( not ( = ?auto_93867 ?auto_93868 ) ) ( not ( = ?auto_93867 ?auto_93869 ) ) ( not ( = ?auto_93867 ?auto_93870 ) ) ( not ( = ?auto_93867 ?auto_93871 ) ) ( not ( = ?auto_93867 ?auto_93872 ) ) ( not ( = ?auto_93868 ?auto_93869 ) ) ( not ( = ?auto_93868 ?auto_93870 ) ) ( not ( = ?auto_93868 ?auto_93871 ) ) ( not ( = ?auto_93868 ?auto_93872 ) ) ( not ( = ?auto_93869 ?auto_93870 ) ) ( not ( = ?auto_93869 ?auto_93871 ) ) ( not ( = ?auto_93869 ?auto_93872 ) ) ( not ( = ?auto_93870 ?auto_93871 ) ) ( not ( = ?auto_93870 ?auto_93872 ) ) ( not ( = ?auto_93871 ?auto_93872 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93871 ?auto_93872 )
      ( !STACK ?auto_93871 ?auto_93870 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93880 - BLOCK
      ?auto_93881 - BLOCK
      ?auto_93882 - BLOCK
      ?auto_93883 - BLOCK
      ?auto_93884 - BLOCK
      ?auto_93885 - BLOCK
      ?auto_93886 - BLOCK
    )
    :vars
    (
      ?auto_93887 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93885 ) ( ON ?auto_93886 ?auto_93887 ) ( CLEAR ?auto_93886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93880 ) ( ON ?auto_93881 ?auto_93880 ) ( ON ?auto_93882 ?auto_93881 ) ( ON ?auto_93883 ?auto_93882 ) ( ON ?auto_93884 ?auto_93883 ) ( ON ?auto_93885 ?auto_93884 ) ( not ( = ?auto_93880 ?auto_93881 ) ) ( not ( = ?auto_93880 ?auto_93882 ) ) ( not ( = ?auto_93880 ?auto_93883 ) ) ( not ( = ?auto_93880 ?auto_93884 ) ) ( not ( = ?auto_93880 ?auto_93885 ) ) ( not ( = ?auto_93880 ?auto_93886 ) ) ( not ( = ?auto_93880 ?auto_93887 ) ) ( not ( = ?auto_93881 ?auto_93882 ) ) ( not ( = ?auto_93881 ?auto_93883 ) ) ( not ( = ?auto_93881 ?auto_93884 ) ) ( not ( = ?auto_93881 ?auto_93885 ) ) ( not ( = ?auto_93881 ?auto_93886 ) ) ( not ( = ?auto_93881 ?auto_93887 ) ) ( not ( = ?auto_93882 ?auto_93883 ) ) ( not ( = ?auto_93882 ?auto_93884 ) ) ( not ( = ?auto_93882 ?auto_93885 ) ) ( not ( = ?auto_93882 ?auto_93886 ) ) ( not ( = ?auto_93882 ?auto_93887 ) ) ( not ( = ?auto_93883 ?auto_93884 ) ) ( not ( = ?auto_93883 ?auto_93885 ) ) ( not ( = ?auto_93883 ?auto_93886 ) ) ( not ( = ?auto_93883 ?auto_93887 ) ) ( not ( = ?auto_93884 ?auto_93885 ) ) ( not ( = ?auto_93884 ?auto_93886 ) ) ( not ( = ?auto_93884 ?auto_93887 ) ) ( not ( = ?auto_93885 ?auto_93886 ) ) ( not ( = ?auto_93885 ?auto_93887 ) ) ( not ( = ?auto_93886 ?auto_93887 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93886 ?auto_93887 )
      ( !STACK ?auto_93886 ?auto_93885 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93895 - BLOCK
      ?auto_93896 - BLOCK
      ?auto_93897 - BLOCK
      ?auto_93898 - BLOCK
      ?auto_93899 - BLOCK
      ?auto_93900 - BLOCK
      ?auto_93901 - BLOCK
    )
    :vars
    (
      ?auto_93902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93901 ?auto_93902 ) ( ON-TABLE ?auto_93895 ) ( ON ?auto_93896 ?auto_93895 ) ( ON ?auto_93897 ?auto_93896 ) ( ON ?auto_93898 ?auto_93897 ) ( ON ?auto_93899 ?auto_93898 ) ( not ( = ?auto_93895 ?auto_93896 ) ) ( not ( = ?auto_93895 ?auto_93897 ) ) ( not ( = ?auto_93895 ?auto_93898 ) ) ( not ( = ?auto_93895 ?auto_93899 ) ) ( not ( = ?auto_93895 ?auto_93900 ) ) ( not ( = ?auto_93895 ?auto_93901 ) ) ( not ( = ?auto_93895 ?auto_93902 ) ) ( not ( = ?auto_93896 ?auto_93897 ) ) ( not ( = ?auto_93896 ?auto_93898 ) ) ( not ( = ?auto_93896 ?auto_93899 ) ) ( not ( = ?auto_93896 ?auto_93900 ) ) ( not ( = ?auto_93896 ?auto_93901 ) ) ( not ( = ?auto_93896 ?auto_93902 ) ) ( not ( = ?auto_93897 ?auto_93898 ) ) ( not ( = ?auto_93897 ?auto_93899 ) ) ( not ( = ?auto_93897 ?auto_93900 ) ) ( not ( = ?auto_93897 ?auto_93901 ) ) ( not ( = ?auto_93897 ?auto_93902 ) ) ( not ( = ?auto_93898 ?auto_93899 ) ) ( not ( = ?auto_93898 ?auto_93900 ) ) ( not ( = ?auto_93898 ?auto_93901 ) ) ( not ( = ?auto_93898 ?auto_93902 ) ) ( not ( = ?auto_93899 ?auto_93900 ) ) ( not ( = ?auto_93899 ?auto_93901 ) ) ( not ( = ?auto_93899 ?auto_93902 ) ) ( not ( = ?auto_93900 ?auto_93901 ) ) ( not ( = ?auto_93900 ?auto_93902 ) ) ( not ( = ?auto_93901 ?auto_93902 ) ) ( CLEAR ?auto_93899 ) ( ON ?auto_93900 ?auto_93901 ) ( CLEAR ?auto_93900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93895 ?auto_93896 ?auto_93897 ?auto_93898 ?auto_93899 ?auto_93900 )
      ( MAKE-7PILE ?auto_93895 ?auto_93896 ?auto_93897 ?auto_93898 ?auto_93899 ?auto_93900 ?auto_93901 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93910 - BLOCK
      ?auto_93911 - BLOCK
      ?auto_93912 - BLOCK
      ?auto_93913 - BLOCK
      ?auto_93914 - BLOCK
      ?auto_93915 - BLOCK
      ?auto_93916 - BLOCK
    )
    :vars
    (
      ?auto_93917 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93916 ?auto_93917 ) ( ON-TABLE ?auto_93910 ) ( ON ?auto_93911 ?auto_93910 ) ( ON ?auto_93912 ?auto_93911 ) ( ON ?auto_93913 ?auto_93912 ) ( ON ?auto_93914 ?auto_93913 ) ( not ( = ?auto_93910 ?auto_93911 ) ) ( not ( = ?auto_93910 ?auto_93912 ) ) ( not ( = ?auto_93910 ?auto_93913 ) ) ( not ( = ?auto_93910 ?auto_93914 ) ) ( not ( = ?auto_93910 ?auto_93915 ) ) ( not ( = ?auto_93910 ?auto_93916 ) ) ( not ( = ?auto_93910 ?auto_93917 ) ) ( not ( = ?auto_93911 ?auto_93912 ) ) ( not ( = ?auto_93911 ?auto_93913 ) ) ( not ( = ?auto_93911 ?auto_93914 ) ) ( not ( = ?auto_93911 ?auto_93915 ) ) ( not ( = ?auto_93911 ?auto_93916 ) ) ( not ( = ?auto_93911 ?auto_93917 ) ) ( not ( = ?auto_93912 ?auto_93913 ) ) ( not ( = ?auto_93912 ?auto_93914 ) ) ( not ( = ?auto_93912 ?auto_93915 ) ) ( not ( = ?auto_93912 ?auto_93916 ) ) ( not ( = ?auto_93912 ?auto_93917 ) ) ( not ( = ?auto_93913 ?auto_93914 ) ) ( not ( = ?auto_93913 ?auto_93915 ) ) ( not ( = ?auto_93913 ?auto_93916 ) ) ( not ( = ?auto_93913 ?auto_93917 ) ) ( not ( = ?auto_93914 ?auto_93915 ) ) ( not ( = ?auto_93914 ?auto_93916 ) ) ( not ( = ?auto_93914 ?auto_93917 ) ) ( not ( = ?auto_93915 ?auto_93916 ) ) ( not ( = ?auto_93915 ?auto_93917 ) ) ( not ( = ?auto_93916 ?auto_93917 ) ) ( CLEAR ?auto_93914 ) ( ON ?auto_93915 ?auto_93916 ) ( CLEAR ?auto_93915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93910 ?auto_93911 ?auto_93912 ?auto_93913 ?auto_93914 ?auto_93915 )
      ( MAKE-7PILE ?auto_93910 ?auto_93911 ?auto_93912 ?auto_93913 ?auto_93914 ?auto_93915 ?auto_93916 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93925 - BLOCK
      ?auto_93926 - BLOCK
      ?auto_93927 - BLOCK
      ?auto_93928 - BLOCK
      ?auto_93929 - BLOCK
      ?auto_93930 - BLOCK
      ?auto_93931 - BLOCK
    )
    :vars
    (
      ?auto_93932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93931 ?auto_93932 ) ( ON-TABLE ?auto_93925 ) ( ON ?auto_93926 ?auto_93925 ) ( ON ?auto_93927 ?auto_93926 ) ( ON ?auto_93928 ?auto_93927 ) ( not ( = ?auto_93925 ?auto_93926 ) ) ( not ( = ?auto_93925 ?auto_93927 ) ) ( not ( = ?auto_93925 ?auto_93928 ) ) ( not ( = ?auto_93925 ?auto_93929 ) ) ( not ( = ?auto_93925 ?auto_93930 ) ) ( not ( = ?auto_93925 ?auto_93931 ) ) ( not ( = ?auto_93925 ?auto_93932 ) ) ( not ( = ?auto_93926 ?auto_93927 ) ) ( not ( = ?auto_93926 ?auto_93928 ) ) ( not ( = ?auto_93926 ?auto_93929 ) ) ( not ( = ?auto_93926 ?auto_93930 ) ) ( not ( = ?auto_93926 ?auto_93931 ) ) ( not ( = ?auto_93926 ?auto_93932 ) ) ( not ( = ?auto_93927 ?auto_93928 ) ) ( not ( = ?auto_93927 ?auto_93929 ) ) ( not ( = ?auto_93927 ?auto_93930 ) ) ( not ( = ?auto_93927 ?auto_93931 ) ) ( not ( = ?auto_93927 ?auto_93932 ) ) ( not ( = ?auto_93928 ?auto_93929 ) ) ( not ( = ?auto_93928 ?auto_93930 ) ) ( not ( = ?auto_93928 ?auto_93931 ) ) ( not ( = ?auto_93928 ?auto_93932 ) ) ( not ( = ?auto_93929 ?auto_93930 ) ) ( not ( = ?auto_93929 ?auto_93931 ) ) ( not ( = ?auto_93929 ?auto_93932 ) ) ( not ( = ?auto_93930 ?auto_93931 ) ) ( not ( = ?auto_93930 ?auto_93932 ) ) ( not ( = ?auto_93931 ?auto_93932 ) ) ( ON ?auto_93930 ?auto_93931 ) ( CLEAR ?auto_93928 ) ( ON ?auto_93929 ?auto_93930 ) ( CLEAR ?auto_93929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93925 ?auto_93926 ?auto_93927 ?auto_93928 ?auto_93929 )
      ( MAKE-7PILE ?auto_93925 ?auto_93926 ?auto_93927 ?auto_93928 ?auto_93929 ?auto_93930 ?auto_93931 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93940 - BLOCK
      ?auto_93941 - BLOCK
      ?auto_93942 - BLOCK
      ?auto_93943 - BLOCK
      ?auto_93944 - BLOCK
      ?auto_93945 - BLOCK
      ?auto_93946 - BLOCK
    )
    :vars
    (
      ?auto_93947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93946 ?auto_93947 ) ( ON-TABLE ?auto_93940 ) ( ON ?auto_93941 ?auto_93940 ) ( ON ?auto_93942 ?auto_93941 ) ( ON ?auto_93943 ?auto_93942 ) ( not ( = ?auto_93940 ?auto_93941 ) ) ( not ( = ?auto_93940 ?auto_93942 ) ) ( not ( = ?auto_93940 ?auto_93943 ) ) ( not ( = ?auto_93940 ?auto_93944 ) ) ( not ( = ?auto_93940 ?auto_93945 ) ) ( not ( = ?auto_93940 ?auto_93946 ) ) ( not ( = ?auto_93940 ?auto_93947 ) ) ( not ( = ?auto_93941 ?auto_93942 ) ) ( not ( = ?auto_93941 ?auto_93943 ) ) ( not ( = ?auto_93941 ?auto_93944 ) ) ( not ( = ?auto_93941 ?auto_93945 ) ) ( not ( = ?auto_93941 ?auto_93946 ) ) ( not ( = ?auto_93941 ?auto_93947 ) ) ( not ( = ?auto_93942 ?auto_93943 ) ) ( not ( = ?auto_93942 ?auto_93944 ) ) ( not ( = ?auto_93942 ?auto_93945 ) ) ( not ( = ?auto_93942 ?auto_93946 ) ) ( not ( = ?auto_93942 ?auto_93947 ) ) ( not ( = ?auto_93943 ?auto_93944 ) ) ( not ( = ?auto_93943 ?auto_93945 ) ) ( not ( = ?auto_93943 ?auto_93946 ) ) ( not ( = ?auto_93943 ?auto_93947 ) ) ( not ( = ?auto_93944 ?auto_93945 ) ) ( not ( = ?auto_93944 ?auto_93946 ) ) ( not ( = ?auto_93944 ?auto_93947 ) ) ( not ( = ?auto_93945 ?auto_93946 ) ) ( not ( = ?auto_93945 ?auto_93947 ) ) ( not ( = ?auto_93946 ?auto_93947 ) ) ( ON ?auto_93945 ?auto_93946 ) ( CLEAR ?auto_93943 ) ( ON ?auto_93944 ?auto_93945 ) ( CLEAR ?auto_93944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93940 ?auto_93941 ?auto_93942 ?auto_93943 ?auto_93944 )
      ( MAKE-7PILE ?auto_93940 ?auto_93941 ?auto_93942 ?auto_93943 ?auto_93944 ?auto_93945 ?auto_93946 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93955 - BLOCK
      ?auto_93956 - BLOCK
      ?auto_93957 - BLOCK
      ?auto_93958 - BLOCK
      ?auto_93959 - BLOCK
      ?auto_93960 - BLOCK
      ?auto_93961 - BLOCK
    )
    :vars
    (
      ?auto_93962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93961 ?auto_93962 ) ( ON-TABLE ?auto_93955 ) ( ON ?auto_93956 ?auto_93955 ) ( ON ?auto_93957 ?auto_93956 ) ( not ( = ?auto_93955 ?auto_93956 ) ) ( not ( = ?auto_93955 ?auto_93957 ) ) ( not ( = ?auto_93955 ?auto_93958 ) ) ( not ( = ?auto_93955 ?auto_93959 ) ) ( not ( = ?auto_93955 ?auto_93960 ) ) ( not ( = ?auto_93955 ?auto_93961 ) ) ( not ( = ?auto_93955 ?auto_93962 ) ) ( not ( = ?auto_93956 ?auto_93957 ) ) ( not ( = ?auto_93956 ?auto_93958 ) ) ( not ( = ?auto_93956 ?auto_93959 ) ) ( not ( = ?auto_93956 ?auto_93960 ) ) ( not ( = ?auto_93956 ?auto_93961 ) ) ( not ( = ?auto_93956 ?auto_93962 ) ) ( not ( = ?auto_93957 ?auto_93958 ) ) ( not ( = ?auto_93957 ?auto_93959 ) ) ( not ( = ?auto_93957 ?auto_93960 ) ) ( not ( = ?auto_93957 ?auto_93961 ) ) ( not ( = ?auto_93957 ?auto_93962 ) ) ( not ( = ?auto_93958 ?auto_93959 ) ) ( not ( = ?auto_93958 ?auto_93960 ) ) ( not ( = ?auto_93958 ?auto_93961 ) ) ( not ( = ?auto_93958 ?auto_93962 ) ) ( not ( = ?auto_93959 ?auto_93960 ) ) ( not ( = ?auto_93959 ?auto_93961 ) ) ( not ( = ?auto_93959 ?auto_93962 ) ) ( not ( = ?auto_93960 ?auto_93961 ) ) ( not ( = ?auto_93960 ?auto_93962 ) ) ( not ( = ?auto_93961 ?auto_93962 ) ) ( ON ?auto_93960 ?auto_93961 ) ( ON ?auto_93959 ?auto_93960 ) ( CLEAR ?auto_93957 ) ( ON ?auto_93958 ?auto_93959 ) ( CLEAR ?auto_93958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93955 ?auto_93956 ?auto_93957 ?auto_93958 )
      ( MAKE-7PILE ?auto_93955 ?auto_93956 ?auto_93957 ?auto_93958 ?auto_93959 ?auto_93960 ?auto_93961 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93970 - BLOCK
      ?auto_93971 - BLOCK
      ?auto_93972 - BLOCK
      ?auto_93973 - BLOCK
      ?auto_93974 - BLOCK
      ?auto_93975 - BLOCK
      ?auto_93976 - BLOCK
    )
    :vars
    (
      ?auto_93977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93976 ?auto_93977 ) ( ON-TABLE ?auto_93970 ) ( ON ?auto_93971 ?auto_93970 ) ( ON ?auto_93972 ?auto_93971 ) ( not ( = ?auto_93970 ?auto_93971 ) ) ( not ( = ?auto_93970 ?auto_93972 ) ) ( not ( = ?auto_93970 ?auto_93973 ) ) ( not ( = ?auto_93970 ?auto_93974 ) ) ( not ( = ?auto_93970 ?auto_93975 ) ) ( not ( = ?auto_93970 ?auto_93976 ) ) ( not ( = ?auto_93970 ?auto_93977 ) ) ( not ( = ?auto_93971 ?auto_93972 ) ) ( not ( = ?auto_93971 ?auto_93973 ) ) ( not ( = ?auto_93971 ?auto_93974 ) ) ( not ( = ?auto_93971 ?auto_93975 ) ) ( not ( = ?auto_93971 ?auto_93976 ) ) ( not ( = ?auto_93971 ?auto_93977 ) ) ( not ( = ?auto_93972 ?auto_93973 ) ) ( not ( = ?auto_93972 ?auto_93974 ) ) ( not ( = ?auto_93972 ?auto_93975 ) ) ( not ( = ?auto_93972 ?auto_93976 ) ) ( not ( = ?auto_93972 ?auto_93977 ) ) ( not ( = ?auto_93973 ?auto_93974 ) ) ( not ( = ?auto_93973 ?auto_93975 ) ) ( not ( = ?auto_93973 ?auto_93976 ) ) ( not ( = ?auto_93973 ?auto_93977 ) ) ( not ( = ?auto_93974 ?auto_93975 ) ) ( not ( = ?auto_93974 ?auto_93976 ) ) ( not ( = ?auto_93974 ?auto_93977 ) ) ( not ( = ?auto_93975 ?auto_93976 ) ) ( not ( = ?auto_93975 ?auto_93977 ) ) ( not ( = ?auto_93976 ?auto_93977 ) ) ( ON ?auto_93975 ?auto_93976 ) ( ON ?auto_93974 ?auto_93975 ) ( CLEAR ?auto_93972 ) ( ON ?auto_93973 ?auto_93974 ) ( CLEAR ?auto_93973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93970 ?auto_93971 ?auto_93972 ?auto_93973 )
      ( MAKE-7PILE ?auto_93970 ?auto_93971 ?auto_93972 ?auto_93973 ?auto_93974 ?auto_93975 ?auto_93976 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93985 - BLOCK
      ?auto_93986 - BLOCK
      ?auto_93987 - BLOCK
      ?auto_93988 - BLOCK
      ?auto_93989 - BLOCK
      ?auto_93990 - BLOCK
      ?auto_93991 - BLOCK
    )
    :vars
    (
      ?auto_93992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93991 ?auto_93992 ) ( ON-TABLE ?auto_93985 ) ( ON ?auto_93986 ?auto_93985 ) ( not ( = ?auto_93985 ?auto_93986 ) ) ( not ( = ?auto_93985 ?auto_93987 ) ) ( not ( = ?auto_93985 ?auto_93988 ) ) ( not ( = ?auto_93985 ?auto_93989 ) ) ( not ( = ?auto_93985 ?auto_93990 ) ) ( not ( = ?auto_93985 ?auto_93991 ) ) ( not ( = ?auto_93985 ?auto_93992 ) ) ( not ( = ?auto_93986 ?auto_93987 ) ) ( not ( = ?auto_93986 ?auto_93988 ) ) ( not ( = ?auto_93986 ?auto_93989 ) ) ( not ( = ?auto_93986 ?auto_93990 ) ) ( not ( = ?auto_93986 ?auto_93991 ) ) ( not ( = ?auto_93986 ?auto_93992 ) ) ( not ( = ?auto_93987 ?auto_93988 ) ) ( not ( = ?auto_93987 ?auto_93989 ) ) ( not ( = ?auto_93987 ?auto_93990 ) ) ( not ( = ?auto_93987 ?auto_93991 ) ) ( not ( = ?auto_93987 ?auto_93992 ) ) ( not ( = ?auto_93988 ?auto_93989 ) ) ( not ( = ?auto_93988 ?auto_93990 ) ) ( not ( = ?auto_93988 ?auto_93991 ) ) ( not ( = ?auto_93988 ?auto_93992 ) ) ( not ( = ?auto_93989 ?auto_93990 ) ) ( not ( = ?auto_93989 ?auto_93991 ) ) ( not ( = ?auto_93989 ?auto_93992 ) ) ( not ( = ?auto_93990 ?auto_93991 ) ) ( not ( = ?auto_93990 ?auto_93992 ) ) ( not ( = ?auto_93991 ?auto_93992 ) ) ( ON ?auto_93990 ?auto_93991 ) ( ON ?auto_93989 ?auto_93990 ) ( ON ?auto_93988 ?auto_93989 ) ( CLEAR ?auto_93986 ) ( ON ?auto_93987 ?auto_93988 ) ( CLEAR ?auto_93987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93985 ?auto_93986 ?auto_93987 )
      ( MAKE-7PILE ?auto_93985 ?auto_93986 ?auto_93987 ?auto_93988 ?auto_93989 ?auto_93990 ?auto_93991 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94000 - BLOCK
      ?auto_94001 - BLOCK
      ?auto_94002 - BLOCK
      ?auto_94003 - BLOCK
      ?auto_94004 - BLOCK
      ?auto_94005 - BLOCK
      ?auto_94006 - BLOCK
    )
    :vars
    (
      ?auto_94007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94006 ?auto_94007 ) ( ON-TABLE ?auto_94000 ) ( ON ?auto_94001 ?auto_94000 ) ( not ( = ?auto_94000 ?auto_94001 ) ) ( not ( = ?auto_94000 ?auto_94002 ) ) ( not ( = ?auto_94000 ?auto_94003 ) ) ( not ( = ?auto_94000 ?auto_94004 ) ) ( not ( = ?auto_94000 ?auto_94005 ) ) ( not ( = ?auto_94000 ?auto_94006 ) ) ( not ( = ?auto_94000 ?auto_94007 ) ) ( not ( = ?auto_94001 ?auto_94002 ) ) ( not ( = ?auto_94001 ?auto_94003 ) ) ( not ( = ?auto_94001 ?auto_94004 ) ) ( not ( = ?auto_94001 ?auto_94005 ) ) ( not ( = ?auto_94001 ?auto_94006 ) ) ( not ( = ?auto_94001 ?auto_94007 ) ) ( not ( = ?auto_94002 ?auto_94003 ) ) ( not ( = ?auto_94002 ?auto_94004 ) ) ( not ( = ?auto_94002 ?auto_94005 ) ) ( not ( = ?auto_94002 ?auto_94006 ) ) ( not ( = ?auto_94002 ?auto_94007 ) ) ( not ( = ?auto_94003 ?auto_94004 ) ) ( not ( = ?auto_94003 ?auto_94005 ) ) ( not ( = ?auto_94003 ?auto_94006 ) ) ( not ( = ?auto_94003 ?auto_94007 ) ) ( not ( = ?auto_94004 ?auto_94005 ) ) ( not ( = ?auto_94004 ?auto_94006 ) ) ( not ( = ?auto_94004 ?auto_94007 ) ) ( not ( = ?auto_94005 ?auto_94006 ) ) ( not ( = ?auto_94005 ?auto_94007 ) ) ( not ( = ?auto_94006 ?auto_94007 ) ) ( ON ?auto_94005 ?auto_94006 ) ( ON ?auto_94004 ?auto_94005 ) ( ON ?auto_94003 ?auto_94004 ) ( CLEAR ?auto_94001 ) ( ON ?auto_94002 ?auto_94003 ) ( CLEAR ?auto_94002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94000 ?auto_94001 ?auto_94002 )
      ( MAKE-7PILE ?auto_94000 ?auto_94001 ?auto_94002 ?auto_94003 ?auto_94004 ?auto_94005 ?auto_94006 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94015 - BLOCK
      ?auto_94016 - BLOCK
      ?auto_94017 - BLOCK
      ?auto_94018 - BLOCK
      ?auto_94019 - BLOCK
      ?auto_94020 - BLOCK
      ?auto_94021 - BLOCK
    )
    :vars
    (
      ?auto_94022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94021 ?auto_94022 ) ( ON-TABLE ?auto_94015 ) ( not ( = ?auto_94015 ?auto_94016 ) ) ( not ( = ?auto_94015 ?auto_94017 ) ) ( not ( = ?auto_94015 ?auto_94018 ) ) ( not ( = ?auto_94015 ?auto_94019 ) ) ( not ( = ?auto_94015 ?auto_94020 ) ) ( not ( = ?auto_94015 ?auto_94021 ) ) ( not ( = ?auto_94015 ?auto_94022 ) ) ( not ( = ?auto_94016 ?auto_94017 ) ) ( not ( = ?auto_94016 ?auto_94018 ) ) ( not ( = ?auto_94016 ?auto_94019 ) ) ( not ( = ?auto_94016 ?auto_94020 ) ) ( not ( = ?auto_94016 ?auto_94021 ) ) ( not ( = ?auto_94016 ?auto_94022 ) ) ( not ( = ?auto_94017 ?auto_94018 ) ) ( not ( = ?auto_94017 ?auto_94019 ) ) ( not ( = ?auto_94017 ?auto_94020 ) ) ( not ( = ?auto_94017 ?auto_94021 ) ) ( not ( = ?auto_94017 ?auto_94022 ) ) ( not ( = ?auto_94018 ?auto_94019 ) ) ( not ( = ?auto_94018 ?auto_94020 ) ) ( not ( = ?auto_94018 ?auto_94021 ) ) ( not ( = ?auto_94018 ?auto_94022 ) ) ( not ( = ?auto_94019 ?auto_94020 ) ) ( not ( = ?auto_94019 ?auto_94021 ) ) ( not ( = ?auto_94019 ?auto_94022 ) ) ( not ( = ?auto_94020 ?auto_94021 ) ) ( not ( = ?auto_94020 ?auto_94022 ) ) ( not ( = ?auto_94021 ?auto_94022 ) ) ( ON ?auto_94020 ?auto_94021 ) ( ON ?auto_94019 ?auto_94020 ) ( ON ?auto_94018 ?auto_94019 ) ( ON ?auto_94017 ?auto_94018 ) ( CLEAR ?auto_94015 ) ( ON ?auto_94016 ?auto_94017 ) ( CLEAR ?auto_94016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94015 ?auto_94016 )
      ( MAKE-7PILE ?auto_94015 ?auto_94016 ?auto_94017 ?auto_94018 ?auto_94019 ?auto_94020 ?auto_94021 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94030 - BLOCK
      ?auto_94031 - BLOCK
      ?auto_94032 - BLOCK
      ?auto_94033 - BLOCK
      ?auto_94034 - BLOCK
      ?auto_94035 - BLOCK
      ?auto_94036 - BLOCK
    )
    :vars
    (
      ?auto_94037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94036 ?auto_94037 ) ( ON-TABLE ?auto_94030 ) ( not ( = ?auto_94030 ?auto_94031 ) ) ( not ( = ?auto_94030 ?auto_94032 ) ) ( not ( = ?auto_94030 ?auto_94033 ) ) ( not ( = ?auto_94030 ?auto_94034 ) ) ( not ( = ?auto_94030 ?auto_94035 ) ) ( not ( = ?auto_94030 ?auto_94036 ) ) ( not ( = ?auto_94030 ?auto_94037 ) ) ( not ( = ?auto_94031 ?auto_94032 ) ) ( not ( = ?auto_94031 ?auto_94033 ) ) ( not ( = ?auto_94031 ?auto_94034 ) ) ( not ( = ?auto_94031 ?auto_94035 ) ) ( not ( = ?auto_94031 ?auto_94036 ) ) ( not ( = ?auto_94031 ?auto_94037 ) ) ( not ( = ?auto_94032 ?auto_94033 ) ) ( not ( = ?auto_94032 ?auto_94034 ) ) ( not ( = ?auto_94032 ?auto_94035 ) ) ( not ( = ?auto_94032 ?auto_94036 ) ) ( not ( = ?auto_94032 ?auto_94037 ) ) ( not ( = ?auto_94033 ?auto_94034 ) ) ( not ( = ?auto_94033 ?auto_94035 ) ) ( not ( = ?auto_94033 ?auto_94036 ) ) ( not ( = ?auto_94033 ?auto_94037 ) ) ( not ( = ?auto_94034 ?auto_94035 ) ) ( not ( = ?auto_94034 ?auto_94036 ) ) ( not ( = ?auto_94034 ?auto_94037 ) ) ( not ( = ?auto_94035 ?auto_94036 ) ) ( not ( = ?auto_94035 ?auto_94037 ) ) ( not ( = ?auto_94036 ?auto_94037 ) ) ( ON ?auto_94035 ?auto_94036 ) ( ON ?auto_94034 ?auto_94035 ) ( ON ?auto_94033 ?auto_94034 ) ( ON ?auto_94032 ?auto_94033 ) ( CLEAR ?auto_94030 ) ( ON ?auto_94031 ?auto_94032 ) ( CLEAR ?auto_94031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94030 ?auto_94031 )
      ( MAKE-7PILE ?auto_94030 ?auto_94031 ?auto_94032 ?auto_94033 ?auto_94034 ?auto_94035 ?auto_94036 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94045 - BLOCK
      ?auto_94046 - BLOCK
      ?auto_94047 - BLOCK
      ?auto_94048 - BLOCK
      ?auto_94049 - BLOCK
      ?auto_94050 - BLOCK
      ?auto_94051 - BLOCK
    )
    :vars
    (
      ?auto_94052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94051 ?auto_94052 ) ( not ( = ?auto_94045 ?auto_94046 ) ) ( not ( = ?auto_94045 ?auto_94047 ) ) ( not ( = ?auto_94045 ?auto_94048 ) ) ( not ( = ?auto_94045 ?auto_94049 ) ) ( not ( = ?auto_94045 ?auto_94050 ) ) ( not ( = ?auto_94045 ?auto_94051 ) ) ( not ( = ?auto_94045 ?auto_94052 ) ) ( not ( = ?auto_94046 ?auto_94047 ) ) ( not ( = ?auto_94046 ?auto_94048 ) ) ( not ( = ?auto_94046 ?auto_94049 ) ) ( not ( = ?auto_94046 ?auto_94050 ) ) ( not ( = ?auto_94046 ?auto_94051 ) ) ( not ( = ?auto_94046 ?auto_94052 ) ) ( not ( = ?auto_94047 ?auto_94048 ) ) ( not ( = ?auto_94047 ?auto_94049 ) ) ( not ( = ?auto_94047 ?auto_94050 ) ) ( not ( = ?auto_94047 ?auto_94051 ) ) ( not ( = ?auto_94047 ?auto_94052 ) ) ( not ( = ?auto_94048 ?auto_94049 ) ) ( not ( = ?auto_94048 ?auto_94050 ) ) ( not ( = ?auto_94048 ?auto_94051 ) ) ( not ( = ?auto_94048 ?auto_94052 ) ) ( not ( = ?auto_94049 ?auto_94050 ) ) ( not ( = ?auto_94049 ?auto_94051 ) ) ( not ( = ?auto_94049 ?auto_94052 ) ) ( not ( = ?auto_94050 ?auto_94051 ) ) ( not ( = ?auto_94050 ?auto_94052 ) ) ( not ( = ?auto_94051 ?auto_94052 ) ) ( ON ?auto_94050 ?auto_94051 ) ( ON ?auto_94049 ?auto_94050 ) ( ON ?auto_94048 ?auto_94049 ) ( ON ?auto_94047 ?auto_94048 ) ( ON ?auto_94046 ?auto_94047 ) ( ON ?auto_94045 ?auto_94046 ) ( CLEAR ?auto_94045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94045 )
      ( MAKE-7PILE ?auto_94045 ?auto_94046 ?auto_94047 ?auto_94048 ?auto_94049 ?auto_94050 ?auto_94051 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94060 - BLOCK
      ?auto_94061 - BLOCK
      ?auto_94062 - BLOCK
      ?auto_94063 - BLOCK
      ?auto_94064 - BLOCK
      ?auto_94065 - BLOCK
      ?auto_94066 - BLOCK
    )
    :vars
    (
      ?auto_94067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94066 ?auto_94067 ) ( not ( = ?auto_94060 ?auto_94061 ) ) ( not ( = ?auto_94060 ?auto_94062 ) ) ( not ( = ?auto_94060 ?auto_94063 ) ) ( not ( = ?auto_94060 ?auto_94064 ) ) ( not ( = ?auto_94060 ?auto_94065 ) ) ( not ( = ?auto_94060 ?auto_94066 ) ) ( not ( = ?auto_94060 ?auto_94067 ) ) ( not ( = ?auto_94061 ?auto_94062 ) ) ( not ( = ?auto_94061 ?auto_94063 ) ) ( not ( = ?auto_94061 ?auto_94064 ) ) ( not ( = ?auto_94061 ?auto_94065 ) ) ( not ( = ?auto_94061 ?auto_94066 ) ) ( not ( = ?auto_94061 ?auto_94067 ) ) ( not ( = ?auto_94062 ?auto_94063 ) ) ( not ( = ?auto_94062 ?auto_94064 ) ) ( not ( = ?auto_94062 ?auto_94065 ) ) ( not ( = ?auto_94062 ?auto_94066 ) ) ( not ( = ?auto_94062 ?auto_94067 ) ) ( not ( = ?auto_94063 ?auto_94064 ) ) ( not ( = ?auto_94063 ?auto_94065 ) ) ( not ( = ?auto_94063 ?auto_94066 ) ) ( not ( = ?auto_94063 ?auto_94067 ) ) ( not ( = ?auto_94064 ?auto_94065 ) ) ( not ( = ?auto_94064 ?auto_94066 ) ) ( not ( = ?auto_94064 ?auto_94067 ) ) ( not ( = ?auto_94065 ?auto_94066 ) ) ( not ( = ?auto_94065 ?auto_94067 ) ) ( not ( = ?auto_94066 ?auto_94067 ) ) ( ON ?auto_94065 ?auto_94066 ) ( ON ?auto_94064 ?auto_94065 ) ( ON ?auto_94063 ?auto_94064 ) ( ON ?auto_94062 ?auto_94063 ) ( ON ?auto_94061 ?auto_94062 ) ( ON ?auto_94060 ?auto_94061 ) ( CLEAR ?auto_94060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94060 )
      ( MAKE-7PILE ?auto_94060 ?auto_94061 ?auto_94062 ?auto_94063 ?auto_94064 ?auto_94065 ?auto_94066 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94076 - BLOCK
      ?auto_94077 - BLOCK
      ?auto_94078 - BLOCK
      ?auto_94079 - BLOCK
      ?auto_94080 - BLOCK
      ?auto_94081 - BLOCK
      ?auto_94082 - BLOCK
      ?auto_94083 - BLOCK
    )
    :vars
    (
      ?auto_94084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94082 ) ( ON ?auto_94083 ?auto_94084 ) ( CLEAR ?auto_94083 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94076 ) ( ON ?auto_94077 ?auto_94076 ) ( ON ?auto_94078 ?auto_94077 ) ( ON ?auto_94079 ?auto_94078 ) ( ON ?auto_94080 ?auto_94079 ) ( ON ?auto_94081 ?auto_94080 ) ( ON ?auto_94082 ?auto_94081 ) ( not ( = ?auto_94076 ?auto_94077 ) ) ( not ( = ?auto_94076 ?auto_94078 ) ) ( not ( = ?auto_94076 ?auto_94079 ) ) ( not ( = ?auto_94076 ?auto_94080 ) ) ( not ( = ?auto_94076 ?auto_94081 ) ) ( not ( = ?auto_94076 ?auto_94082 ) ) ( not ( = ?auto_94076 ?auto_94083 ) ) ( not ( = ?auto_94076 ?auto_94084 ) ) ( not ( = ?auto_94077 ?auto_94078 ) ) ( not ( = ?auto_94077 ?auto_94079 ) ) ( not ( = ?auto_94077 ?auto_94080 ) ) ( not ( = ?auto_94077 ?auto_94081 ) ) ( not ( = ?auto_94077 ?auto_94082 ) ) ( not ( = ?auto_94077 ?auto_94083 ) ) ( not ( = ?auto_94077 ?auto_94084 ) ) ( not ( = ?auto_94078 ?auto_94079 ) ) ( not ( = ?auto_94078 ?auto_94080 ) ) ( not ( = ?auto_94078 ?auto_94081 ) ) ( not ( = ?auto_94078 ?auto_94082 ) ) ( not ( = ?auto_94078 ?auto_94083 ) ) ( not ( = ?auto_94078 ?auto_94084 ) ) ( not ( = ?auto_94079 ?auto_94080 ) ) ( not ( = ?auto_94079 ?auto_94081 ) ) ( not ( = ?auto_94079 ?auto_94082 ) ) ( not ( = ?auto_94079 ?auto_94083 ) ) ( not ( = ?auto_94079 ?auto_94084 ) ) ( not ( = ?auto_94080 ?auto_94081 ) ) ( not ( = ?auto_94080 ?auto_94082 ) ) ( not ( = ?auto_94080 ?auto_94083 ) ) ( not ( = ?auto_94080 ?auto_94084 ) ) ( not ( = ?auto_94081 ?auto_94082 ) ) ( not ( = ?auto_94081 ?auto_94083 ) ) ( not ( = ?auto_94081 ?auto_94084 ) ) ( not ( = ?auto_94082 ?auto_94083 ) ) ( not ( = ?auto_94082 ?auto_94084 ) ) ( not ( = ?auto_94083 ?auto_94084 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94083 ?auto_94084 )
      ( !STACK ?auto_94083 ?auto_94082 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94093 - BLOCK
      ?auto_94094 - BLOCK
      ?auto_94095 - BLOCK
      ?auto_94096 - BLOCK
      ?auto_94097 - BLOCK
      ?auto_94098 - BLOCK
      ?auto_94099 - BLOCK
      ?auto_94100 - BLOCK
    )
    :vars
    (
      ?auto_94101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94099 ) ( ON ?auto_94100 ?auto_94101 ) ( CLEAR ?auto_94100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94093 ) ( ON ?auto_94094 ?auto_94093 ) ( ON ?auto_94095 ?auto_94094 ) ( ON ?auto_94096 ?auto_94095 ) ( ON ?auto_94097 ?auto_94096 ) ( ON ?auto_94098 ?auto_94097 ) ( ON ?auto_94099 ?auto_94098 ) ( not ( = ?auto_94093 ?auto_94094 ) ) ( not ( = ?auto_94093 ?auto_94095 ) ) ( not ( = ?auto_94093 ?auto_94096 ) ) ( not ( = ?auto_94093 ?auto_94097 ) ) ( not ( = ?auto_94093 ?auto_94098 ) ) ( not ( = ?auto_94093 ?auto_94099 ) ) ( not ( = ?auto_94093 ?auto_94100 ) ) ( not ( = ?auto_94093 ?auto_94101 ) ) ( not ( = ?auto_94094 ?auto_94095 ) ) ( not ( = ?auto_94094 ?auto_94096 ) ) ( not ( = ?auto_94094 ?auto_94097 ) ) ( not ( = ?auto_94094 ?auto_94098 ) ) ( not ( = ?auto_94094 ?auto_94099 ) ) ( not ( = ?auto_94094 ?auto_94100 ) ) ( not ( = ?auto_94094 ?auto_94101 ) ) ( not ( = ?auto_94095 ?auto_94096 ) ) ( not ( = ?auto_94095 ?auto_94097 ) ) ( not ( = ?auto_94095 ?auto_94098 ) ) ( not ( = ?auto_94095 ?auto_94099 ) ) ( not ( = ?auto_94095 ?auto_94100 ) ) ( not ( = ?auto_94095 ?auto_94101 ) ) ( not ( = ?auto_94096 ?auto_94097 ) ) ( not ( = ?auto_94096 ?auto_94098 ) ) ( not ( = ?auto_94096 ?auto_94099 ) ) ( not ( = ?auto_94096 ?auto_94100 ) ) ( not ( = ?auto_94096 ?auto_94101 ) ) ( not ( = ?auto_94097 ?auto_94098 ) ) ( not ( = ?auto_94097 ?auto_94099 ) ) ( not ( = ?auto_94097 ?auto_94100 ) ) ( not ( = ?auto_94097 ?auto_94101 ) ) ( not ( = ?auto_94098 ?auto_94099 ) ) ( not ( = ?auto_94098 ?auto_94100 ) ) ( not ( = ?auto_94098 ?auto_94101 ) ) ( not ( = ?auto_94099 ?auto_94100 ) ) ( not ( = ?auto_94099 ?auto_94101 ) ) ( not ( = ?auto_94100 ?auto_94101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94100 ?auto_94101 )
      ( !STACK ?auto_94100 ?auto_94099 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94110 - BLOCK
      ?auto_94111 - BLOCK
      ?auto_94112 - BLOCK
      ?auto_94113 - BLOCK
      ?auto_94114 - BLOCK
      ?auto_94115 - BLOCK
      ?auto_94116 - BLOCK
      ?auto_94117 - BLOCK
    )
    :vars
    (
      ?auto_94118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94117 ?auto_94118 ) ( ON-TABLE ?auto_94110 ) ( ON ?auto_94111 ?auto_94110 ) ( ON ?auto_94112 ?auto_94111 ) ( ON ?auto_94113 ?auto_94112 ) ( ON ?auto_94114 ?auto_94113 ) ( ON ?auto_94115 ?auto_94114 ) ( not ( = ?auto_94110 ?auto_94111 ) ) ( not ( = ?auto_94110 ?auto_94112 ) ) ( not ( = ?auto_94110 ?auto_94113 ) ) ( not ( = ?auto_94110 ?auto_94114 ) ) ( not ( = ?auto_94110 ?auto_94115 ) ) ( not ( = ?auto_94110 ?auto_94116 ) ) ( not ( = ?auto_94110 ?auto_94117 ) ) ( not ( = ?auto_94110 ?auto_94118 ) ) ( not ( = ?auto_94111 ?auto_94112 ) ) ( not ( = ?auto_94111 ?auto_94113 ) ) ( not ( = ?auto_94111 ?auto_94114 ) ) ( not ( = ?auto_94111 ?auto_94115 ) ) ( not ( = ?auto_94111 ?auto_94116 ) ) ( not ( = ?auto_94111 ?auto_94117 ) ) ( not ( = ?auto_94111 ?auto_94118 ) ) ( not ( = ?auto_94112 ?auto_94113 ) ) ( not ( = ?auto_94112 ?auto_94114 ) ) ( not ( = ?auto_94112 ?auto_94115 ) ) ( not ( = ?auto_94112 ?auto_94116 ) ) ( not ( = ?auto_94112 ?auto_94117 ) ) ( not ( = ?auto_94112 ?auto_94118 ) ) ( not ( = ?auto_94113 ?auto_94114 ) ) ( not ( = ?auto_94113 ?auto_94115 ) ) ( not ( = ?auto_94113 ?auto_94116 ) ) ( not ( = ?auto_94113 ?auto_94117 ) ) ( not ( = ?auto_94113 ?auto_94118 ) ) ( not ( = ?auto_94114 ?auto_94115 ) ) ( not ( = ?auto_94114 ?auto_94116 ) ) ( not ( = ?auto_94114 ?auto_94117 ) ) ( not ( = ?auto_94114 ?auto_94118 ) ) ( not ( = ?auto_94115 ?auto_94116 ) ) ( not ( = ?auto_94115 ?auto_94117 ) ) ( not ( = ?auto_94115 ?auto_94118 ) ) ( not ( = ?auto_94116 ?auto_94117 ) ) ( not ( = ?auto_94116 ?auto_94118 ) ) ( not ( = ?auto_94117 ?auto_94118 ) ) ( CLEAR ?auto_94115 ) ( ON ?auto_94116 ?auto_94117 ) ( CLEAR ?auto_94116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94110 ?auto_94111 ?auto_94112 ?auto_94113 ?auto_94114 ?auto_94115 ?auto_94116 )
      ( MAKE-8PILE ?auto_94110 ?auto_94111 ?auto_94112 ?auto_94113 ?auto_94114 ?auto_94115 ?auto_94116 ?auto_94117 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94127 - BLOCK
      ?auto_94128 - BLOCK
      ?auto_94129 - BLOCK
      ?auto_94130 - BLOCK
      ?auto_94131 - BLOCK
      ?auto_94132 - BLOCK
      ?auto_94133 - BLOCK
      ?auto_94134 - BLOCK
    )
    :vars
    (
      ?auto_94135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94134 ?auto_94135 ) ( ON-TABLE ?auto_94127 ) ( ON ?auto_94128 ?auto_94127 ) ( ON ?auto_94129 ?auto_94128 ) ( ON ?auto_94130 ?auto_94129 ) ( ON ?auto_94131 ?auto_94130 ) ( ON ?auto_94132 ?auto_94131 ) ( not ( = ?auto_94127 ?auto_94128 ) ) ( not ( = ?auto_94127 ?auto_94129 ) ) ( not ( = ?auto_94127 ?auto_94130 ) ) ( not ( = ?auto_94127 ?auto_94131 ) ) ( not ( = ?auto_94127 ?auto_94132 ) ) ( not ( = ?auto_94127 ?auto_94133 ) ) ( not ( = ?auto_94127 ?auto_94134 ) ) ( not ( = ?auto_94127 ?auto_94135 ) ) ( not ( = ?auto_94128 ?auto_94129 ) ) ( not ( = ?auto_94128 ?auto_94130 ) ) ( not ( = ?auto_94128 ?auto_94131 ) ) ( not ( = ?auto_94128 ?auto_94132 ) ) ( not ( = ?auto_94128 ?auto_94133 ) ) ( not ( = ?auto_94128 ?auto_94134 ) ) ( not ( = ?auto_94128 ?auto_94135 ) ) ( not ( = ?auto_94129 ?auto_94130 ) ) ( not ( = ?auto_94129 ?auto_94131 ) ) ( not ( = ?auto_94129 ?auto_94132 ) ) ( not ( = ?auto_94129 ?auto_94133 ) ) ( not ( = ?auto_94129 ?auto_94134 ) ) ( not ( = ?auto_94129 ?auto_94135 ) ) ( not ( = ?auto_94130 ?auto_94131 ) ) ( not ( = ?auto_94130 ?auto_94132 ) ) ( not ( = ?auto_94130 ?auto_94133 ) ) ( not ( = ?auto_94130 ?auto_94134 ) ) ( not ( = ?auto_94130 ?auto_94135 ) ) ( not ( = ?auto_94131 ?auto_94132 ) ) ( not ( = ?auto_94131 ?auto_94133 ) ) ( not ( = ?auto_94131 ?auto_94134 ) ) ( not ( = ?auto_94131 ?auto_94135 ) ) ( not ( = ?auto_94132 ?auto_94133 ) ) ( not ( = ?auto_94132 ?auto_94134 ) ) ( not ( = ?auto_94132 ?auto_94135 ) ) ( not ( = ?auto_94133 ?auto_94134 ) ) ( not ( = ?auto_94133 ?auto_94135 ) ) ( not ( = ?auto_94134 ?auto_94135 ) ) ( CLEAR ?auto_94132 ) ( ON ?auto_94133 ?auto_94134 ) ( CLEAR ?auto_94133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94127 ?auto_94128 ?auto_94129 ?auto_94130 ?auto_94131 ?auto_94132 ?auto_94133 )
      ( MAKE-8PILE ?auto_94127 ?auto_94128 ?auto_94129 ?auto_94130 ?auto_94131 ?auto_94132 ?auto_94133 ?auto_94134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94144 - BLOCK
      ?auto_94145 - BLOCK
      ?auto_94146 - BLOCK
      ?auto_94147 - BLOCK
      ?auto_94148 - BLOCK
      ?auto_94149 - BLOCK
      ?auto_94150 - BLOCK
      ?auto_94151 - BLOCK
    )
    :vars
    (
      ?auto_94152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94151 ?auto_94152 ) ( ON-TABLE ?auto_94144 ) ( ON ?auto_94145 ?auto_94144 ) ( ON ?auto_94146 ?auto_94145 ) ( ON ?auto_94147 ?auto_94146 ) ( ON ?auto_94148 ?auto_94147 ) ( not ( = ?auto_94144 ?auto_94145 ) ) ( not ( = ?auto_94144 ?auto_94146 ) ) ( not ( = ?auto_94144 ?auto_94147 ) ) ( not ( = ?auto_94144 ?auto_94148 ) ) ( not ( = ?auto_94144 ?auto_94149 ) ) ( not ( = ?auto_94144 ?auto_94150 ) ) ( not ( = ?auto_94144 ?auto_94151 ) ) ( not ( = ?auto_94144 ?auto_94152 ) ) ( not ( = ?auto_94145 ?auto_94146 ) ) ( not ( = ?auto_94145 ?auto_94147 ) ) ( not ( = ?auto_94145 ?auto_94148 ) ) ( not ( = ?auto_94145 ?auto_94149 ) ) ( not ( = ?auto_94145 ?auto_94150 ) ) ( not ( = ?auto_94145 ?auto_94151 ) ) ( not ( = ?auto_94145 ?auto_94152 ) ) ( not ( = ?auto_94146 ?auto_94147 ) ) ( not ( = ?auto_94146 ?auto_94148 ) ) ( not ( = ?auto_94146 ?auto_94149 ) ) ( not ( = ?auto_94146 ?auto_94150 ) ) ( not ( = ?auto_94146 ?auto_94151 ) ) ( not ( = ?auto_94146 ?auto_94152 ) ) ( not ( = ?auto_94147 ?auto_94148 ) ) ( not ( = ?auto_94147 ?auto_94149 ) ) ( not ( = ?auto_94147 ?auto_94150 ) ) ( not ( = ?auto_94147 ?auto_94151 ) ) ( not ( = ?auto_94147 ?auto_94152 ) ) ( not ( = ?auto_94148 ?auto_94149 ) ) ( not ( = ?auto_94148 ?auto_94150 ) ) ( not ( = ?auto_94148 ?auto_94151 ) ) ( not ( = ?auto_94148 ?auto_94152 ) ) ( not ( = ?auto_94149 ?auto_94150 ) ) ( not ( = ?auto_94149 ?auto_94151 ) ) ( not ( = ?auto_94149 ?auto_94152 ) ) ( not ( = ?auto_94150 ?auto_94151 ) ) ( not ( = ?auto_94150 ?auto_94152 ) ) ( not ( = ?auto_94151 ?auto_94152 ) ) ( ON ?auto_94150 ?auto_94151 ) ( CLEAR ?auto_94148 ) ( ON ?auto_94149 ?auto_94150 ) ( CLEAR ?auto_94149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94144 ?auto_94145 ?auto_94146 ?auto_94147 ?auto_94148 ?auto_94149 )
      ( MAKE-8PILE ?auto_94144 ?auto_94145 ?auto_94146 ?auto_94147 ?auto_94148 ?auto_94149 ?auto_94150 ?auto_94151 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94161 - BLOCK
      ?auto_94162 - BLOCK
      ?auto_94163 - BLOCK
      ?auto_94164 - BLOCK
      ?auto_94165 - BLOCK
      ?auto_94166 - BLOCK
      ?auto_94167 - BLOCK
      ?auto_94168 - BLOCK
    )
    :vars
    (
      ?auto_94169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94168 ?auto_94169 ) ( ON-TABLE ?auto_94161 ) ( ON ?auto_94162 ?auto_94161 ) ( ON ?auto_94163 ?auto_94162 ) ( ON ?auto_94164 ?auto_94163 ) ( ON ?auto_94165 ?auto_94164 ) ( not ( = ?auto_94161 ?auto_94162 ) ) ( not ( = ?auto_94161 ?auto_94163 ) ) ( not ( = ?auto_94161 ?auto_94164 ) ) ( not ( = ?auto_94161 ?auto_94165 ) ) ( not ( = ?auto_94161 ?auto_94166 ) ) ( not ( = ?auto_94161 ?auto_94167 ) ) ( not ( = ?auto_94161 ?auto_94168 ) ) ( not ( = ?auto_94161 ?auto_94169 ) ) ( not ( = ?auto_94162 ?auto_94163 ) ) ( not ( = ?auto_94162 ?auto_94164 ) ) ( not ( = ?auto_94162 ?auto_94165 ) ) ( not ( = ?auto_94162 ?auto_94166 ) ) ( not ( = ?auto_94162 ?auto_94167 ) ) ( not ( = ?auto_94162 ?auto_94168 ) ) ( not ( = ?auto_94162 ?auto_94169 ) ) ( not ( = ?auto_94163 ?auto_94164 ) ) ( not ( = ?auto_94163 ?auto_94165 ) ) ( not ( = ?auto_94163 ?auto_94166 ) ) ( not ( = ?auto_94163 ?auto_94167 ) ) ( not ( = ?auto_94163 ?auto_94168 ) ) ( not ( = ?auto_94163 ?auto_94169 ) ) ( not ( = ?auto_94164 ?auto_94165 ) ) ( not ( = ?auto_94164 ?auto_94166 ) ) ( not ( = ?auto_94164 ?auto_94167 ) ) ( not ( = ?auto_94164 ?auto_94168 ) ) ( not ( = ?auto_94164 ?auto_94169 ) ) ( not ( = ?auto_94165 ?auto_94166 ) ) ( not ( = ?auto_94165 ?auto_94167 ) ) ( not ( = ?auto_94165 ?auto_94168 ) ) ( not ( = ?auto_94165 ?auto_94169 ) ) ( not ( = ?auto_94166 ?auto_94167 ) ) ( not ( = ?auto_94166 ?auto_94168 ) ) ( not ( = ?auto_94166 ?auto_94169 ) ) ( not ( = ?auto_94167 ?auto_94168 ) ) ( not ( = ?auto_94167 ?auto_94169 ) ) ( not ( = ?auto_94168 ?auto_94169 ) ) ( ON ?auto_94167 ?auto_94168 ) ( CLEAR ?auto_94165 ) ( ON ?auto_94166 ?auto_94167 ) ( CLEAR ?auto_94166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94161 ?auto_94162 ?auto_94163 ?auto_94164 ?auto_94165 ?auto_94166 )
      ( MAKE-8PILE ?auto_94161 ?auto_94162 ?auto_94163 ?auto_94164 ?auto_94165 ?auto_94166 ?auto_94167 ?auto_94168 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94178 - BLOCK
      ?auto_94179 - BLOCK
      ?auto_94180 - BLOCK
      ?auto_94181 - BLOCK
      ?auto_94182 - BLOCK
      ?auto_94183 - BLOCK
      ?auto_94184 - BLOCK
      ?auto_94185 - BLOCK
    )
    :vars
    (
      ?auto_94186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94185 ?auto_94186 ) ( ON-TABLE ?auto_94178 ) ( ON ?auto_94179 ?auto_94178 ) ( ON ?auto_94180 ?auto_94179 ) ( ON ?auto_94181 ?auto_94180 ) ( not ( = ?auto_94178 ?auto_94179 ) ) ( not ( = ?auto_94178 ?auto_94180 ) ) ( not ( = ?auto_94178 ?auto_94181 ) ) ( not ( = ?auto_94178 ?auto_94182 ) ) ( not ( = ?auto_94178 ?auto_94183 ) ) ( not ( = ?auto_94178 ?auto_94184 ) ) ( not ( = ?auto_94178 ?auto_94185 ) ) ( not ( = ?auto_94178 ?auto_94186 ) ) ( not ( = ?auto_94179 ?auto_94180 ) ) ( not ( = ?auto_94179 ?auto_94181 ) ) ( not ( = ?auto_94179 ?auto_94182 ) ) ( not ( = ?auto_94179 ?auto_94183 ) ) ( not ( = ?auto_94179 ?auto_94184 ) ) ( not ( = ?auto_94179 ?auto_94185 ) ) ( not ( = ?auto_94179 ?auto_94186 ) ) ( not ( = ?auto_94180 ?auto_94181 ) ) ( not ( = ?auto_94180 ?auto_94182 ) ) ( not ( = ?auto_94180 ?auto_94183 ) ) ( not ( = ?auto_94180 ?auto_94184 ) ) ( not ( = ?auto_94180 ?auto_94185 ) ) ( not ( = ?auto_94180 ?auto_94186 ) ) ( not ( = ?auto_94181 ?auto_94182 ) ) ( not ( = ?auto_94181 ?auto_94183 ) ) ( not ( = ?auto_94181 ?auto_94184 ) ) ( not ( = ?auto_94181 ?auto_94185 ) ) ( not ( = ?auto_94181 ?auto_94186 ) ) ( not ( = ?auto_94182 ?auto_94183 ) ) ( not ( = ?auto_94182 ?auto_94184 ) ) ( not ( = ?auto_94182 ?auto_94185 ) ) ( not ( = ?auto_94182 ?auto_94186 ) ) ( not ( = ?auto_94183 ?auto_94184 ) ) ( not ( = ?auto_94183 ?auto_94185 ) ) ( not ( = ?auto_94183 ?auto_94186 ) ) ( not ( = ?auto_94184 ?auto_94185 ) ) ( not ( = ?auto_94184 ?auto_94186 ) ) ( not ( = ?auto_94185 ?auto_94186 ) ) ( ON ?auto_94184 ?auto_94185 ) ( ON ?auto_94183 ?auto_94184 ) ( CLEAR ?auto_94181 ) ( ON ?auto_94182 ?auto_94183 ) ( CLEAR ?auto_94182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94178 ?auto_94179 ?auto_94180 ?auto_94181 ?auto_94182 )
      ( MAKE-8PILE ?auto_94178 ?auto_94179 ?auto_94180 ?auto_94181 ?auto_94182 ?auto_94183 ?auto_94184 ?auto_94185 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94195 - BLOCK
      ?auto_94196 - BLOCK
      ?auto_94197 - BLOCK
      ?auto_94198 - BLOCK
      ?auto_94199 - BLOCK
      ?auto_94200 - BLOCK
      ?auto_94201 - BLOCK
      ?auto_94202 - BLOCK
    )
    :vars
    (
      ?auto_94203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94202 ?auto_94203 ) ( ON-TABLE ?auto_94195 ) ( ON ?auto_94196 ?auto_94195 ) ( ON ?auto_94197 ?auto_94196 ) ( ON ?auto_94198 ?auto_94197 ) ( not ( = ?auto_94195 ?auto_94196 ) ) ( not ( = ?auto_94195 ?auto_94197 ) ) ( not ( = ?auto_94195 ?auto_94198 ) ) ( not ( = ?auto_94195 ?auto_94199 ) ) ( not ( = ?auto_94195 ?auto_94200 ) ) ( not ( = ?auto_94195 ?auto_94201 ) ) ( not ( = ?auto_94195 ?auto_94202 ) ) ( not ( = ?auto_94195 ?auto_94203 ) ) ( not ( = ?auto_94196 ?auto_94197 ) ) ( not ( = ?auto_94196 ?auto_94198 ) ) ( not ( = ?auto_94196 ?auto_94199 ) ) ( not ( = ?auto_94196 ?auto_94200 ) ) ( not ( = ?auto_94196 ?auto_94201 ) ) ( not ( = ?auto_94196 ?auto_94202 ) ) ( not ( = ?auto_94196 ?auto_94203 ) ) ( not ( = ?auto_94197 ?auto_94198 ) ) ( not ( = ?auto_94197 ?auto_94199 ) ) ( not ( = ?auto_94197 ?auto_94200 ) ) ( not ( = ?auto_94197 ?auto_94201 ) ) ( not ( = ?auto_94197 ?auto_94202 ) ) ( not ( = ?auto_94197 ?auto_94203 ) ) ( not ( = ?auto_94198 ?auto_94199 ) ) ( not ( = ?auto_94198 ?auto_94200 ) ) ( not ( = ?auto_94198 ?auto_94201 ) ) ( not ( = ?auto_94198 ?auto_94202 ) ) ( not ( = ?auto_94198 ?auto_94203 ) ) ( not ( = ?auto_94199 ?auto_94200 ) ) ( not ( = ?auto_94199 ?auto_94201 ) ) ( not ( = ?auto_94199 ?auto_94202 ) ) ( not ( = ?auto_94199 ?auto_94203 ) ) ( not ( = ?auto_94200 ?auto_94201 ) ) ( not ( = ?auto_94200 ?auto_94202 ) ) ( not ( = ?auto_94200 ?auto_94203 ) ) ( not ( = ?auto_94201 ?auto_94202 ) ) ( not ( = ?auto_94201 ?auto_94203 ) ) ( not ( = ?auto_94202 ?auto_94203 ) ) ( ON ?auto_94201 ?auto_94202 ) ( ON ?auto_94200 ?auto_94201 ) ( CLEAR ?auto_94198 ) ( ON ?auto_94199 ?auto_94200 ) ( CLEAR ?auto_94199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94195 ?auto_94196 ?auto_94197 ?auto_94198 ?auto_94199 )
      ( MAKE-8PILE ?auto_94195 ?auto_94196 ?auto_94197 ?auto_94198 ?auto_94199 ?auto_94200 ?auto_94201 ?auto_94202 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94212 - BLOCK
      ?auto_94213 - BLOCK
      ?auto_94214 - BLOCK
      ?auto_94215 - BLOCK
      ?auto_94216 - BLOCK
      ?auto_94217 - BLOCK
      ?auto_94218 - BLOCK
      ?auto_94219 - BLOCK
    )
    :vars
    (
      ?auto_94220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94219 ?auto_94220 ) ( ON-TABLE ?auto_94212 ) ( ON ?auto_94213 ?auto_94212 ) ( ON ?auto_94214 ?auto_94213 ) ( not ( = ?auto_94212 ?auto_94213 ) ) ( not ( = ?auto_94212 ?auto_94214 ) ) ( not ( = ?auto_94212 ?auto_94215 ) ) ( not ( = ?auto_94212 ?auto_94216 ) ) ( not ( = ?auto_94212 ?auto_94217 ) ) ( not ( = ?auto_94212 ?auto_94218 ) ) ( not ( = ?auto_94212 ?auto_94219 ) ) ( not ( = ?auto_94212 ?auto_94220 ) ) ( not ( = ?auto_94213 ?auto_94214 ) ) ( not ( = ?auto_94213 ?auto_94215 ) ) ( not ( = ?auto_94213 ?auto_94216 ) ) ( not ( = ?auto_94213 ?auto_94217 ) ) ( not ( = ?auto_94213 ?auto_94218 ) ) ( not ( = ?auto_94213 ?auto_94219 ) ) ( not ( = ?auto_94213 ?auto_94220 ) ) ( not ( = ?auto_94214 ?auto_94215 ) ) ( not ( = ?auto_94214 ?auto_94216 ) ) ( not ( = ?auto_94214 ?auto_94217 ) ) ( not ( = ?auto_94214 ?auto_94218 ) ) ( not ( = ?auto_94214 ?auto_94219 ) ) ( not ( = ?auto_94214 ?auto_94220 ) ) ( not ( = ?auto_94215 ?auto_94216 ) ) ( not ( = ?auto_94215 ?auto_94217 ) ) ( not ( = ?auto_94215 ?auto_94218 ) ) ( not ( = ?auto_94215 ?auto_94219 ) ) ( not ( = ?auto_94215 ?auto_94220 ) ) ( not ( = ?auto_94216 ?auto_94217 ) ) ( not ( = ?auto_94216 ?auto_94218 ) ) ( not ( = ?auto_94216 ?auto_94219 ) ) ( not ( = ?auto_94216 ?auto_94220 ) ) ( not ( = ?auto_94217 ?auto_94218 ) ) ( not ( = ?auto_94217 ?auto_94219 ) ) ( not ( = ?auto_94217 ?auto_94220 ) ) ( not ( = ?auto_94218 ?auto_94219 ) ) ( not ( = ?auto_94218 ?auto_94220 ) ) ( not ( = ?auto_94219 ?auto_94220 ) ) ( ON ?auto_94218 ?auto_94219 ) ( ON ?auto_94217 ?auto_94218 ) ( ON ?auto_94216 ?auto_94217 ) ( CLEAR ?auto_94214 ) ( ON ?auto_94215 ?auto_94216 ) ( CLEAR ?auto_94215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94212 ?auto_94213 ?auto_94214 ?auto_94215 )
      ( MAKE-8PILE ?auto_94212 ?auto_94213 ?auto_94214 ?auto_94215 ?auto_94216 ?auto_94217 ?auto_94218 ?auto_94219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94229 - BLOCK
      ?auto_94230 - BLOCK
      ?auto_94231 - BLOCK
      ?auto_94232 - BLOCK
      ?auto_94233 - BLOCK
      ?auto_94234 - BLOCK
      ?auto_94235 - BLOCK
      ?auto_94236 - BLOCK
    )
    :vars
    (
      ?auto_94237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94236 ?auto_94237 ) ( ON-TABLE ?auto_94229 ) ( ON ?auto_94230 ?auto_94229 ) ( ON ?auto_94231 ?auto_94230 ) ( not ( = ?auto_94229 ?auto_94230 ) ) ( not ( = ?auto_94229 ?auto_94231 ) ) ( not ( = ?auto_94229 ?auto_94232 ) ) ( not ( = ?auto_94229 ?auto_94233 ) ) ( not ( = ?auto_94229 ?auto_94234 ) ) ( not ( = ?auto_94229 ?auto_94235 ) ) ( not ( = ?auto_94229 ?auto_94236 ) ) ( not ( = ?auto_94229 ?auto_94237 ) ) ( not ( = ?auto_94230 ?auto_94231 ) ) ( not ( = ?auto_94230 ?auto_94232 ) ) ( not ( = ?auto_94230 ?auto_94233 ) ) ( not ( = ?auto_94230 ?auto_94234 ) ) ( not ( = ?auto_94230 ?auto_94235 ) ) ( not ( = ?auto_94230 ?auto_94236 ) ) ( not ( = ?auto_94230 ?auto_94237 ) ) ( not ( = ?auto_94231 ?auto_94232 ) ) ( not ( = ?auto_94231 ?auto_94233 ) ) ( not ( = ?auto_94231 ?auto_94234 ) ) ( not ( = ?auto_94231 ?auto_94235 ) ) ( not ( = ?auto_94231 ?auto_94236 ) ) ( not ( = ?auto_94231 ?auto_94237 ) ) ( not ( = ?auto_94232 ?auto_94233 ) ) ( not ( = ?auto_94232 ?auto_94234 ) ) ( not ( = ?auto_94232 ?auto_94235 ) ) ( not ( = ?auto_94232 ?auto_94236 ) ) ( not ( = ?auto_94232 ?auto_94237 ) ) ( not ( = ?auto_94233 ?auto_94234 ) ) ( not ( = ?auto_94233 ?auto_94235 ) ) ( not ( = ?auto_94233 ?auto_94236 ) ) ( not ( = ?auto_94233 ?auto_94237 ) ) ( not ( = ?auto_94234 ?auto_94235 ) ) ( not ( = ?auto_94234 ?auto_94236 ) ) ( not ( = ?auto_94234 ?auto_94237 ) ) ( not ( = ?auto_94235 ?auto_94236 ) ) ( not ( = ?auto_94235 ?auto_94237 ) ) ( not ( = ?auto_94236 ?auto_94237 ) ) ( ON ?auto_94235 ?auto_94236 ) ( ON ?auto_94234 ?auto_94235 ) ( ON ?auto_94233 ?auto_94234 ) ( CLEAR ?auto_94231 ) ( ON ?auto_94232 ?auto_94233 ) ( CLEAR ?auto_94232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94229 ?auto_94230 ?auto_94231 ?auto_94232 )
      ( MAKE-8PILE ?auto_94229 ?auto_94230 ?auto_94231 ?auto_94232 ?auto_94233 ?auto_94234 ?auto_94235 ?auto_94236 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94246 - BLOCK
      ?auto_94247 - BLOCK
      ?auto_94248 - BLOCK
      ?auto_94249 - BLOCK
      ?auto_94250 - BLOCK
      ?auto_94251 - BLOCK
      ?auto_94252 - BLOCK
      ?auto_94253 - BLOCK
    )
    :vars
    (
      ?auto_94254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94253 ?auto_94254 ) ( ON-TABLE ?auto_94246 ) ( ON ?auto_94247 ?auto_94246 ) ( not ( = ?auto_94246 ?auto_94247 ) ) ( not ( = ?auto_94246 ?auto_94248 ) ) ( not ( = ?auto_94246 ?auto_94249 ) ) ( not ( = ?auto_94246 ?auto_94250 ) ) ( not ( = ?auto_94246 ?auto_94251 ) ) ( not ( = ?auto_94246 ?auto_94252 ) ) ( not ( = ?auto_94246 ?auto_94253 ) ) ( not ( = ?auto_94246 ?auto_94254 ) ) ( not ( = ?auto_94247 ?auto_94248 ) ) ( not ( = ?auto_94247 ?auto_94249 ) ) ( not ( = ?auto_94247 ?auto_94250 ) ) ( not ( = ?auto_94247 ?auto_94251 ) ) ( not ( = ?auto_94247 ?auto_94252 ) ) ( not ( = ?auto_94247 ?auto_94253 ) ) ( not ( = ?auto_94247 ?auto_94254 ) ) ( not ( = ?auto_94248 ?auto_94249 ) ) ( not ( = ?auto_94248 ?auto_94250 ) ) ( not ( = ?auto_94248 ?auto_94251 ) ) ( not ( = ?auto_94248 ?auto_94252 ) ) ( not ( = ?auto_94248 ?auto_94253 ) ) ( not ( = ?auto_94248 ?auto_94254 ) ) ( not ( = ?auto_94249 ?auto_94250 ) ) ( not ( = ?auto_94249 ?auto_94251 ) ) ( not ( = ?auto_94249 ?auto_94252 ) ) ( not ( = ?auto_94249 ?auto_94253 ) ) ( not ( = ?auto_94249 ?auto_94254 ) ) ( not ( = ?auto_94250 ?auto_94251 ) ) ( not ( = ?auto_94250 ?auto_94252 ) ) ( not ( = ?auto_94250 ?auto_94253 ) ) ( not ( = ?auto_94250 ?auto_94254 ) ) ( not ( = ?auto_94251 ?auto_94252 ) ) ( not ( = ?auto_94251 ?auto_94253 ) ) ( not ( = ?auto_94251 ?auto_94254 ) ) ( not ( = ?auto_94252 ?auto_94253 ) ) ( not ( = ?auto_94252 ?auto_94254 ) ) ( not ( = ?auto_94253 ?auto_94254 ) ) ( ON ?auto_94252 ?auto_94253 ) ( ON ?auto_94251 ?auto_94252 ) ( ON ?auto_94250 ?auto_94251 ) ( ON ?auto_94249 ?auto_94250 ) ( CLEAR ?auto_94247 ) ( ON ?auto_94248 ?auto_94249 ) ( CLEAR ?auto_94248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94246 ?auto_94247 ?auto_94248 )
      ( MAKE-8PILE ?auto_94246 ?auto_94247 ?auto_94248 ?auto_94249 ?auto_94250 ?auto_94251 ?auto_94252 ?auto_94253 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94263 - BLOCK
      ?auto_94264 - BLOCK
      ?auto_94265 - BLOCK
      ?auto_94266 - BLOCK
      ?auto_94267 - BLOCK
      ?auto_94268 - BLOCK
      ?auto_94269 - BLOCK
      ?auto_94270 - BLOCK
    )
    :vars
    (
      ?auto_94271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94270 ?auto_94271 ) ( ON-TABLE ?auto_94263 ) ( ON ?auto_94264 ?auto_94263 ) ( not ( = ?auto_94263 ?auto_94264 ) ) ( not ( = ?auto_94263 ?auto_94265 ) ) ( not ( = ?auto_94263 ?auto_94266 ) ) ( not ( = ?auto_94263 ?auto_94267 ) ) ( not ( = ?auto_94263 ?auto_94268 ) ) ( not ( = ?auto_94263 ?auto_94269 ) ) ( not ( = ?auto_94263 ?auto_94270 ) ) ( not ( = ?auto_94263 ?auto_94271 ) ) ( not ( = ?auto_94264 ?auto_94265 ) ) ( not ( = ?auto_94264 ?auto_94266 ) ) ( not ( = ?auto_94264 ?auto_94267 ) ) ( not ( = ?auto_94264 ?auto_94268 ) ) ( not ( = ?auto_94264 ?auto_94269 ) ) ( not ( = ?auto_94264 ?auto_94270 ) ) ( not ( = ?auto_94264 ?auto_94271 ) ) ( not ( = ?auto_94265 ?auto_94266 ) ) ( not ( = ?auto_94265 ?auto_94267 ) ) ( not ( = ?auto_94265 ?auto_94268 ) ) ( not ( = ?auto_94265 ?auto_94269 ) ) ( not ( = ?auto_94265 ?auto_94270 ) ) ( not ( = ?auto_94265 ?auto_94271 ) ) ( not ( = ?auto_94266 ?auto_94267 ) ) ( not ( = ?auto_94266 ?auto_94268 ) ) ( not ( = ?auto_94266 ?auto_94269 ) ) ( not ( = ?auto_94266 ?auto_94270 ) ) ( not ( = ?auto_94266 ?auto_94271 ) ) ( not ( = ?auto_94267 ?auto_94268 ) ) ( not ( = ?auto_94267 ?auto_94269 ) ) ( not ( = ?auto_94267 ?auto_94270 ) ) ( not ( = ?auto_94267 ?auto_94271 ) ) ( not ( = ?auto_94268 ?auto_94269 ) ) ( not ( = ?auto_94268 ?auto_94270 ) ) ( not ( = ?auto_94268 ?auto_94271 ) ) ( not ( = ?auto_94269 ?auto_94270 ) ) ( not ( = ?auto_94269 ?auto_94271 ) ) ( not ( = ?auto_94270 ?auto_94271 ) ) ( ON ?auto_94269 ?auto_94270 ) ( ON ?auto_94268 ?auto_94269 ) ( ON ?auto_94267 ?auto_94268 ) ( ON ?auto_94266 ?auto_94267 ) ( CLEAR ?auto_94264 ) ( ON ?auto_94265 ?auto_94266 ) ( CLEAR ?auto_94265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94263 ?auto_94264 ?auto_94265 )
      ( MAKE-8PILE ?auto_94263 ?auto_94264 ?auto_94265 ?auto_94266 ?auto_94267 ?auto_94268 ?auto_94269 ?auto_94270 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94280 - BLOCK
      ?auto_94281 - BLOCK
      ?auto_94282 - BLOCK
      ?auto_94283 - BLOCK
      ?auto_94284 - BLOCK
      ?auto_94285 - BLOCK
      ?auto_94286 - BLOCK
      ?auto_94287 - BLOCK
    )
    :vars
    (
      ?auto_94288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94287 ?auto_94288 ) ( ON-TABLE ?auto_94280 ) ( not ( = ?auto_94280 ?auto_94281 ) ) ( not ( = ?auto_94280 ?auto_94282 ) ) ( not ( = ?auto_94280 ?auto_94283 ) ) ( not ( = ?auto_94280 ?auto_94284 ) ) ( not ( = ?auto_94280 ?auto_94285 ) ) ( not ( = ?auto_94280 ?auto_94286 ) ) ( not ( = ?auto_94280 ?auto_94287 ) ) ( not ( = ?auto_94280 ?auto_94288 ) ) ( not ( = ?auto_94281 ?auto_94282 ) ) ( not ( = ?auto_94281 ?auto_94283 ) ) ( not ( = ?auto_94281 ?auto_94284 ) ) ( not ( = ?auto_94281 ?auto_94285 ) ) ( not ( = ?auto_94281 ?auto_94286 ) ) ( not ( = ?auto_94281 ?auto_94287 ) ) ( not ( = ?auto_94281 ?auto_94288 ) ) ( not ( = ?auto_94282 ?auto_94283 ) ) ( not ( = ?auto_94282 ?auto_94284 ) ) ( not ( = ?auto_94282 ?auto_94285 ) ) ( not ( = ?auto_94282 ?auto_94286 ) ) ( not ( = ?auto_94282 ?auto_94287 ) ) ( not ( = ?auto_94282 ?auto_94288 ) ) ( not ( = ?auto_94283 ?auto_94284 ) ) ( not ( = ?auto_94283 ?auto_94285 ) ) ( not ( = ?auto_94283 ?auto_94286 ) ) ( not ( = ?auto_94283 ?auto_94287 ) ) ( not ( = ?auto_94283 ?auto_94288 ) ) ( not ( = ?auto_94284 ?auto_94285 ) ) ( not ( = ?auto_94284 ?auto_94286 ) ) ( not ( = ?auto_94284 ?auto_94287 ) ) ( not ( = ?auto_94284 ?auto_94288 ) ) ( not ( = ?auto_94285 ?auto_94286 ) ) ( not ( = ?auto_94285 ?auto_94287 ) ) ( not ( = ?auto_94285 ?auto_94288 ) ) ( not ( = ?auto_94286 ?auto_94287 ) ) ( not ( = ?auto_94286 ?auto_94288 ) ) ( not ( = ?auto_94287 ?auto_94288 ) ) ( ON ?auto_94286 ?auto_94287 ) ( ON ?auto_94285 ?auto_94286 ) ( ON ?auto_94284 ?auto_94285 ) ( ON ?auto_94283 ?auto_94284 ) ( ON ?auto_94282 ?auto_94283 ) ( CLEAR ?auto_94280 ) ( ON ?auto_94281 ?auto_94282 ) ( CLEAR ?auto_94281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94280 ?auto_94281 )
      ( MAKE-8PILE ?auto_94280 ?auto_94281 ?auto_94282 ?auto_94283 ?auto_94284 ?auto_94285 ?auto_94286 ?auto_94287 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94297 - BLOCK
      ?auto_94298 - BLOCK
      ?auto_94299 - BLOCK
      ?auto_94300 - BLOCK
      ?auto_94301 - BLOCK
      ?auto_94302 - BLOCK
      ?auto_94303 - BLOCK
      ?auto_94304 - BLOCK
    )
    :vars
    (
      ?auto_94305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94304 ?auto_94305 ) ( ON-TABLE ?auto_94297 ) ( not ( = ?auto_94297 ?auto_94298 ) ) ( not ( = ?auto_94297 ?auto_94299 ) ) ( not ( = ?auto_94297 ?auto_94300 ) ) ( not ( = ?auto_94297 ?auto_94301 ) ) ( not ( = ?auto_94297 ?auto_94302 ) ) ( not ( = ?auto_94297 ?auto_94303 ) ) ( not ( = ?auto_94297 ?auto_94304 ) ) ( not ( = ?auto_94297 ?auto_94305 ) ) ( not ( = ?auto_94298 ?auto_94299 ) ) ( not ( = ?auto_94298 ?auto_94300 ) ) ( not ( = ?auto_94298 ?auto_94301 ) ) ( not ( = ?auto_94298 ?auto_94302 ) ) ( not ( = ?auto_94298 ?auto_94303 ) ) ( not ( = ?auto_94298 ?auto_94304 ) ) ( not ( = ?auto_94298 ?auto_94305 ) ) ( not ( = ?auto_94299 ?auto_94300 ) ) ( not ( = ?auto_94299 ?auto_94301 ) ) ( not ( = ?auto_94299 ?auto_94302 ) ) ( not ( = ?auto_94299 ?auto_94303 ) ) ( not ( = ?auto_94299 ?auto_94304 ) ) ( not ( = ?auto_94299 ?auto_94305 ) ) ( not ( = ?auto_94300 ?auto_94301 ) ) ( not ( = ?auto_94300 ?auto_94302 ) ) ( not ( = ?auto_94300 ?auto_94303 ) ) ( not ( = ?auto_94300 ?auto_94304 ) ) ( not ( = ?auto_94300 ?auto_94305 ) ) ( not ( = ?auto_94301 ?auto_94302 ) ) ( not ( = ?auto_94301 ?auto_94303 ) ) ( not ( = ?auto_94301 ?auto_94304 ) ) ( not ( = ?auto_94301 ?auto_94305 ) ) ( not ( = ?auto_94302 ?auto_94303 ) ) ( not ( = ?auto_94302 ?auto_94304 ) ) ( not ( = ?auto_94302 ?auto_94305 ) ) ( not ( = ?auto_94303 ?auto_94304 ) ) ( not ( = ?auto_94303 ?auto_94305 ) ) ( not ( = ?auto_94304 ?auto_94305 ) ) ( ON ?auto_94303 ?auto_94304 ) ( ON ?auto_94302 ?auto_94303 ) ( ON ?auto_94301 ?auto_94302 ) ( ON ?auto_94300 ?auto_94301 ) ( ON ?auto_94299 ?auto_94300 ) ( CLEAR ?auto_94297 ) ( ON ?auto_94298 ?auto_94299 ) ( CLEAR ?auto_94298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94297 ?auto_94298 )
      ( MAKE-8PILE ?auto_94297 ?auto_94298 ?auto_94299 ?auto_94300 ?auto_94301 ?auto_94302 ?auto_94303 ?auto_94304 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94314 - BLOCK
      ?auto_94315 - BLOCK
      ?auto_94316 - BLOCK
      ?auto_94317 - BLOCK
      ?auto_94318 - BLOCK
      ?auto_94319 - BLOCK
      ?auto_94320 - BLOCK
      ?auto_94321 - BLOCK
    )
    :vars
    (
      ?auto_94322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94321 ?auto_94322 ) ( not ( = ?auto_94314 ?auto_94315 ) ) ( not ( = ?auto_94314 ?auto_94316 ) ) ( not ( = ?auto_94314 ?auto_94317 ) ) ( not ( = ?auto_94314 ?auto_94318 ) ) ( not ( = ?auto_94314 ?auto_94319 ) ) ( not ( = ?auto_94314 ?auto_94320 ) ) ( not ( = ?auto_94314 ?auto_94321 ) ) ( not ( = ?auto_94314 ?auto_94322 ) ) ( not ( = ?auto_94315 ?auto_94316 ) ) ( not ( = ?auto_94315 ?auto_94317 ) ) ( not ( = ?auto_94315 ?auto_94318 ) ) ( not ( = ?auto_94315 ?auto_94319 ) ) ( not ( = ?auto_94315 ?auto_94320 ) ) ( not ( = ?auto_94315 ?auto_94321 ) ) ( not ( = ?auto_94315 ?auto_94322 ) ) ( not ( = ?auto_94316 ?auto_94317 ) ) ( not ( = ?auto_94316 ?auto_94318 ) ) ( not ( = ?auto_94316 ?auto_94319 ) ) ( not ( = ?auto_94316 ?auto_94320 ) ) ( not ( = ?auto_94316 ?auto_94321 ) ) ( not ( = ?auto_94316 ?auto_94322 ) ) ( not ( = ?auto_94317 ?auto_94318 ) ) ( not ( = ?auto_94317 ?auto_94319 ) ) ( not ( = ?auto_94317 ?auto_94320 ) ) ( not ( = ?auto_94317 ?auto_94321 ) ) ( not ( = ?auto_94317 ?auto_94322 ) ) ( not ( = ?auto_94318 ?auto_94319 ) ) ( not ( = ?auto_94318 ?auto_94320 ) ) ( not ( = ?auto_94318 ?auto_94321 ) ) ( not ( = ?auto_94318 ?auto_94322 ) ) ( not ( = ?auto_94319 ?auto_94320 ) ) ( not ( = ?auto_94319 ?auto_94321 ) ) ( not ( = ?auto_94319 ?auto_94322 ) ) ( not ( = ?auto_94320 ?auto_94321 ) ) ( not ( = ?auto_94320 ?auto_94322 ) ) ( not ( = ?auto_94321 ?auto_94322 ) ) ( ON ?auto_94320 ?auto_94321 ) ( ON ?auto_94319 ?auto_94320 ) ( ON ?auto_94318 ?auto_94319 ) ( ON ?auto_94317 ?auto_94318 ) ( ON ?auto_94316 ?auto_94317 ) ( ON ?auto_94315 ?auto_94316 ) ( ON ?auto_94314 ?auto_94315 ) ( CLEAR ?auto_94314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94314 )
      ( MAKE-8PILE ?auto_94314 ?auto_94315 ?auto_94316 ?auto_94317 ?auto_94318 ?auto_94319 ?auto_94320 ?auto_94321 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_94331 - BLOCK
      ?auto_94332 - BLOCK
      ?auto_94333 - BLOCK
      ?auto_94334 - BLOCK
      ?auto_94335 - BLOCK
      ?auto_94336 - BLOCK
      ?auto_94337 - BLOCK
      ?auto_94338 - BLOCK
    )
    :vars
    (
      ?auto_94339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94338 ?auto_94339 ) ( not ( = ?auto_94331 ?auto_94332 ) ) ( not ( = ?auto_94331 ?auto_94333 ) ) ( not ( = ?auto_94331 ?auto_94334 ) ) ( not ( = ?auto_94331 ?auto_94335 ) ) ( not ( = ?auto_94331 ?auto_94336 ) ) ( not ( = ?auto_94331 ?auto_94337 ) ) ( not ( = ?auto_94331 ?auto_94338 ) ) ( not ( = ?auto_94331 ?auto_94339 ) ) ( not ( = ?auto_94332 ?auto_94333 ) ) ( not ( = ?auto_94332 ?auto_94334 ) ) ( not ( = ?auto_94332 ?auto_94335 ) ) ( not ( = ?auto_94332 ?auto_94336 ) ) ( not ( = ?auto_94332 ?auto_94337 ) ) ( not ( = ?auto_94332 ?auto_94338 ) ) ( not ( = ?auto_94332 ?auto_94339 ) ) ( not ( = ?auto_94333 ?auto_94334 ) ) ( not ( = ?auto_94333 ?auto_94335 ) ) ( not ( = ?auto_94333 ?auto_94336 ) ) ( not ( = ?auto_94333 ?auto_94337 ) ) ( not ( = ?auto_94333 ?auto_94338 ) ) ( not ( = ?auto_94333 ?auto_94339 ) ) ( not ( = ?auto_94334 ?auto_94335 ) ) ( not ( = ?auto_94334 ?auto_94336 ) ) ( not ( = ?auto_94334 ?auto_94337 ) ) ( not ( = ?auto_94334 ?auto_94338 ) ) ( not ( = ?auto_94334 ?auto_94339 ) ) ( not ( = ?auto_94335 ?auto_94336 ) ) ( not ( = ?auto_94335 ?auto_94337 ) ) ( not ( = ?auto_94335 ?auto_94338 ) ) ( not ( = ?auto_94335 ?auto_94339 ) ) ( not ( = ?auto_94336 ?auto_94337 ) ) ( not ( = ?auto_94336 ?auto_94338 ) ) ( not ( = ?auto_94336 ?auto_94339 ) ) ( not ( = ?auto_94337 ?auto_94338 ) ) ( not ( = ?auto_94337 ?auto_94339 ) ) ( not ( = ?auto_94338 ?auto_94339 ) ) ( ON ?auto_94337 ?auto_94338 ) ( ON ?auto_94336 ?auto_94337 ) ( ON ?auto_94335 ?auto_94336 ) ( ON ?auto_94334 ?auto_94335 ) ( ON ?auto_94333 ?auto_94334 ) ( ON ?auto_94332 ?auto_94333 ) ( ON ?auto_94331 ?auto_94332 ) ( CLEAR ?auto_94331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94331 )
      ( MAKE-8PILE ?auto_94331 ?auto_94332 ?auto_94333 ?auto_94334 ?auto_94335 ?auto_94336 ?auto_94337 ?auto_94338 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94349 - BLOCK
      ?auto_94350 - BLOCK
      ?auto_94351 - BLOCK
      ?auto_94352 - BLOCK
      ?auto_94353 - BLOCK
      ?auto_94354 - BLOCK
      ?auto_94355 - BLOCK
      ?auto_94356 - BLOCK
      ?auto_94357 - BLOCK
    )
    :vars
    (
      ?auto_94358 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94356 ) ( ON ?auto_94357 ?auto_94358 ) ( CLEAR ?auto_94357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94349 ) ( ON ?auto_94350 ?auto_94349 ) ( ON ?auto_94351 ?auto_94350 ) ( ON ?auto_94352 ?auto_94351 ) ( ON ?auto_94353 ?auto_94352 ) ( ON ?auto_94354 ?auto_94353 ) ( ON ?auto_94355 ?auto_94354 ) ( ON ?auto_94356 ?auto_94355 ) ( not ( = ?auto_94349 ?auto_94350 ) ) ( not ( = ?auto_94349 ?auto_94351 ) ) ( not ( = ?auto_94349 ?auto_94352 ) ) ( not ( = ?auto_94349 ?auto_94353 ) ) ( not ( = ?auto_94349 ?auto_94354 ) ) ( not ( = ?auto_94349 ?auto_94355 ) ) ( not ( = ?auto_94349 ?auto_94356 ) ) ( not ( = ?auto_94349 ?auto_94357 ) ) ( not ( = ?auto_94349 ?auto_94358 ) ) ( not ( = ?auto_94350 ?auto_94351 ) ) ( not ( = ?auto_94350 ?auto_94352 ) ) ( not ( = ?auto_94350 ?auto_94353 ) ) ( not ( = ?auto_94350 ?auto_94354 ) ) ( not ( = ?auto_94350 ?auto_94355 ) ) ( not ( = ?auto_94350 ?auto_94356 ) ) ( not ( = ?auto_94350 ?auto_94357 ) ) ( not ( = ?auto_94350 ?auto_94358 ) ) ( not ( = ?auto_94351 ?auto_94352 ) ) ( not ( = ?auto_94351 ?auto_94353 ) ) ( not ( = ?auto_94351 ?auto_94354 ) ) ( not ( = ?auto_94351 ?auto_94355 ) ) ( not ( = ?auto_94351 ?auto_94356 ) ) ( not ( = ?auto_94351 ?auto_94357 ) ) ( not ( = ?auto_94351 ?auto_94358 ) ) ( not ( = ?auto_94352 ?auto_94353 ) ) ( not ( = ?auto_94352 ?auto_94354 ) ) ( not ( = ?auto_94352 ?auto_94355 ) ) ( not ( = ?auto_94352 ?auto_94356 ) ) ( not ( = ?auto_94352 ?auto_94357 ) ) ( not ( = ?auto_94352 ?auto_94358 ) ) ( not ( = ?auto_94353 ?auto_94354 ) ) ( not ( = ?auto_94353 ?auto_94355 ) ) ( not ( = ?auto_94353 ?auto_94356 ) ) ( not ( = ?auto_94353 ?auto_94357 ) ) ( not ( = ?auto_94353 ?auto_94358 ) ) ( not ( = ?auto_94354 ?auto_94355 ) ) ( not ( = ?auto_94354 ?auto_94356 ) ) ( not ( = ?auto_94354 ?auto_94357 ) ) ( not ( = ?auto_94354 ?auto_94358 ) ) ( not ( = ?auto_94355 ?auto_94356 ) ) ( not ( = ?auto_94355 ?auto_94357 ) ) ( not ( = ?auto_94355 ?auto_94358 ) ) ( not ( = ?auto_94356 ?auto_94357 ) ) ( not ( = ?auto_94356 ?auto_94358 ) ) ( not ( = ?auto_94357 ?auto_94358 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94357 ?auto_94358 )
      ( !STACK ?auto_94357 ?auto_94356 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94368 - BLOCK
      ?auto_94369 - BLOCK
      ?auto_94370 - BLOCK
      ?auto_94371 - BLOCK
      ?auto_94372 - BLOCK
      ?auto_94373 - BLOCK
      ?auto_94374 - BLOCK
      ?auto_94375 - BLOCK
      ?auto_94376 - BLOCK
    )
    :vars
    (
      ?auto_94377 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94375 ) ( ON ?auto_94376 ?auto_94377 ) ( CLEAR ?auto_94376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94368 ) ( ON ?auto_94369 ?auto_94368 ) ( ON ?auto_94370 ?auto_94369 ) ( ON ?auto_94371 ?auto_94370 ) ( ON ?auto_94372 ?auto_94371 ) ( ON ?auto_94373 ?auto_94372 ) ( ON ?auto_94374 ?auto_94373 ) ( ON ?auto_94375 ?auto_94374 ) ( not ( = ?auto_94368 ?auto_94369 ) ) ( not ( = ?auto_94368 ?auto_94370 ) ) ( not ( = ?auto_94368 ?auto_94371 ) ) ( not ( = ?auto_94368 ?auto_94372 ) ) ( not ( = ?auto_94368 ?auto_94373 ) ) ( not ( = ?auto_94368 ?auto_94374 ) ) ( not ( = ?auto_94368 ?auto_94375 ) ) ( not ( = ?auto_94368 ?auto_94376 ) ) ( not ( = ?auto_94368 ?auto_94377 ) ) ( not ( = ?auto_94369 ?auto_94370 ) ) ( not ( = ?auto_94369 ?auto_94371 ) ) ( not ( = ?auto_94369 ?auto_94372 ) ) ( not ( = ?auto_94369 ?auto_94373 ) ) ( not ( = ?auto_94369 ?auto_94374 ) ) ( not ( = ?auto_94369 ?auto_94375 ) ) ( not ( = ?auto_94369 ?auto_94376 ) ) ( not ( = ?auto_94369 ?auto_94377 ) ) ( not ( = ?auto_94370 ?auto_94371 ) ) ( not ( = ?auto_94370 ?auto_94372 ) ) ( not ( = ?auto_94370 ?auto_94373 ) ) ( not ( = ?auto_94370 ?auto_94374 ) ) ( not ( = ?auto_94370 ?auto_94375 ) ) ( not ( = ?auto_94370 ?auto_94376 ) ) ( not ( = ?auto_94370 ?auto_94377 ) ) ( not ( = ?auto_94371 ?auto_94372 ) ) ( not ( = ?auto_94371 ?auto_94373 ) ) ( not ( = ?auto_94371 ?auto_94374 ) ) ( not ( = ?auto_94371 ?auto_94375 ) ) ( not ( = ?auto_94371 ?auto_94376 ) ) ( not ( = ?auto_94371 ?auto_94377 ) ) ( not ( = ?auto_94372 ?auto_94373 ) ) ( not ( = ?auto_94372 ?auto_94374 ) ) ( not ( = ?auto_94372 ?auto_94375 ) ) ( not ( = ?auto_94372 ?auto_94376 ) ) ( not ( = ?auto_94372 ?auto_94377 ) ) ( not ( = ?auto_94373 ?auto_94374 ) ) ( not ( = ?auto_94373 ?auto_94375 ) ) ( not ( = ?auto_94373 ?auto_94376 ) ) ( not ( = ?auto_94373 ?auto_94377 ) ) ( not ( = ?auto_94374 ?auto_94375 ) ) ( not ( = ?auto_94374 ?auto_94376 ) ) ( not ( = ?auto_94374 ?auto_94377 ) ) ( not ( = ?auto_94375 ?auto_94376 ) ) ( not ( = ?auto_94375 ?auto_94377 ) ) ( not ( = ?auto_94376 ?auto_94377 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94376 ?auto_94377 )
      ( !STACK ?auto_94376 ?auto_94375 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94387 - BLOCK
      ?auto_94388 - BLOCK
      ?auto_94389 - BLOCK
      ?auto_94390 - BLOCK
      ?auto_94391 - BLOCK
      ?auto_94392 - BLOCK
      ?auto_94393 - BLOCK
      ?auto_94394 - BLOCK
      ?auto_94395 - BLOCK
    )
    :vars
    (
      ?auto_94396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94395 ?auto_94396 ) ( ON-TABLE ?auto_94387 ) ( ON ?auto_94388 ?auto_94387 ) ( ON ?auto_94389 ?auto_94388 ) ( ON ?auto_94390 ?auto_94389 ) ( ON ?auto_94391 ?auto_94390 ) ( ON ?auto_94392 ?auto_94391 ) ( ON ?auto_94393 ?auto_94392 ) ( not ( = ?auto_94387 ?auto_94388 ) ) ( not ( = ?auto_94387 ?auto_94389 ) ) ( not ( = ?auto_94387 ?auto_94390 ) ) ( not ( = ?auto_94387 ?auto_94391 ) ) ( not ( = ?auto_94387 ?auto_94392 ) ) ( not ( = ?auto_94387 ?auto_94393 ) ) ( not ( = ?auto_94387 ?auto_94394 ) ) ( not ( = ?auto_94387 ?auto_94395 ) ) ( not ( = ?auto_94387 ?auto_94396 ) ) ( not ( = ?auto_94388 ?auto_94389 ) ) ( not ( = ?auto_94388 ?auto_94390 ) ) ( not ( = ?auto_94388 ?auto_94391 ) ) ( not ( = ?auto_94388 ?auto_94392 ) ) ( not ( = ?auto_94388 ?auto_94393 ) ) ( not ( = ?auto_94388 ?auto_94394 ) ) ( not ( = ?auto_94388 ?auto_94395 ) ) ( not ( = ?auto_94388 ?auto_94396 ) ) ( not ( = ?auto_94389 ?auto_94390 ) ) ( not ( = ?auto_94389 ?auto_94391 ) ) ( not ( = ?auto_94389 ?auto_94392 ) ) ( not ( = ?auto_94389 ?auto_94393 ) ) ( not ( = ?auto_94389 ?auto_94394 ) ) ( not ( = ?auto_94389 ?auto_94395 ) ) ( not ( = ?auto_94389 ?auto_94396 ) ) ( not ( = ?auto_94390 ?auto_94391 ) ) ( not ( = ?auto_94390 ?auto_94392 ) ) ( not ( = ?auto_94390 ?auto_94393 ) ) ( not ( = ?auto_94390 ?auto_94394 ) ) ( not ( = ?auto_94390 ?auto_94395 ) ) ( not ( = ?auto_94390 ?auto_94396 ) ) ( not ( = ?auto_94391 ?auto_94392 ) ) ( not ( = ?auto_94391 ?auto_94393 ) ) ( not ( = ?auto_94391 ?auto_94394 ) ) ( not ( = ?auto_94391 ?auto_94395 ) ) ( not ( = ?auto_94391 ?auto_94396 ) ) ( not ( = ?auto_94392 ?auto_94393 ) ) ( not ( = ?auto_94392 ?auto_94394 ) ) ( not ( = ?auto_94392 ?auto_94395 ) ) ( not ( = ?auto_94392 ?auto_94396 ) ) ( not ( = ?auto_94393 ?auto_94394 ) ) ( not ( = ?auto_94393 ?auto_94395 ) ) ( not ( = ?auto_94393 ?auto_94396 ) ) ( not ( = ?auto_94394 ?auto_94395 ) ) ( not ( = ?auto_94394 ?auto_94396 ) ) ( not ( = ?auto_94395 ?auto_94396 ) ) ( CLEAR ?auto_94393 ) ( ON ?auto_94394 ?auto_94395 ) ( CLEAR ?auto_94394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_94387 ?auto_94388 ?auto_94389 ?auto_94390 ?auto_94391 ?auto_94392 ?auto_94393 ?auto_94394 )
      ( MAKE-9PILE ?auto_94387 ?auto_94388 ?auto_94389 ?auto_94390 ?auto_94391 ?auto_94392 ?auto_94393 ?auto_94394 ?auto_94395 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94406 - BLOCK
      ?auto_94407 - BLOCK
      ?auto_94408 - BLOCK
      ?auto_94409 - BLOCK
      ?auto_94410 - BLOCK
      ?auto_94411 - BLOCK
      ?auto_94412 - BLOCK
      ?auto_94413 - BLOCK
      ?auto_94414 - BLOCK
    )
    :vars
    (
      ?auto_94415 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94414 ?auto_94415 ) ( ON-TABLE ?auto_94406 ) ( ON ?auto_94407 ?auto_94406 ) ( ON ?auto_94408 ?auto_94407 ) ( ON ?auto_94409 ?auto_94408 ) ( ON ?auto_94410 ?auto_94409 ) ( ON ?auto_94411 ?auto_94410 ) ( ON ?auto_94412 ?auto_94411 ) ( not ( = ?auto_94406 ?auto_94407 ) ) ( not ( = ?auto_94406 ?auto_94408 ) ) ( not ( = ?auto_94406 ?auto_94409 ) ) ( not ( = ?auto_94406 ?auto_94410 ) ) ( not ( = ?auto_94406 ?auto_94411 ) ) ( not ( = ?auto_94406 ?auto_94412 ) ) ( not ( = ?auto_94406 ?auto_94413 ) ) ( not ( = ?auto_94406 ?auto_94414 ) ) ( not ( = ?auto_94406 ?auto_94415 ) ) ( not ( = ?auto_94407 ?auto_94408 ) ) ( not ( = ?auto_94407 ?auto_94409 ) ) ( not ( = ?auto_94407 ?auto_94410 ) ) ( not ( = ?auto_94407 ?auto_94411 ) ) ( not ( = ?auto_94407 ?auto_94412 ) ) ( not ( = ?auto_94407 ?auto_94413 ) ) ( not ( = ?auto_94407 ?auto_94414 ) ) ( not ( = ?auto_94407 ?auto_94415 ) ) ( not ( = ?auto_94408 ?auto_94409 ) ) ( not ( = ?auto_94408 ?auto_94410 ) ) ( not ( = ?auto_94408 ?auto_94411 ) ) ( not ( = ?auto_94408 ?auto_94412 ) ) ( not ( = ?auto_94408 ?auto_94413 ) ) ( not ( = ?auto_94408 ?auto_94414 ) ) ( not ( = ?auto_94408 ?auto_94415 ) ) ( not ( = ?auto_94409 ?auto_94410 ) ) ( not ( = ?auto_94409 ?auto_94411 ) ) ( not ( = ?auto_94409 ?auto_94412 ) ) ( not ( = ?auto_94409 ?auto_94413 ) ) ( not ( = ?auto_94409 ?auto_94414 ) ) ( not ( = ?auto_94409 ?auto_94415 ) ) ( not ( = ?auto_94410 ?auto_94411 ) ) ( not ( = ?auto_94410 ?auto_94412 ) ) ( not ( = ?auto_94410 ?auto_94413 ) ) ( not ( = ?auto_94410 ?auto_94414 ) ) ( not ( = ?auto_94410 ?auto_94415 ) ) ( not ( = ?auto_94411 ?auto_94412 ) ) ( not ( = ?auto_94411 ?auto_94413 ) ) ( not ( = ?auto_94411 ?auto_94414 ) ) ( not ( = ?auto_94411 ?auto_94415 ) ) ( not ( = ?auto_94412 ?auto_94413 ) ) ( not ( = ?auto_94412 ?auto_94414 ) ) ( not ( = ?auto_94412 ?auto_94415 ) ) ( not ( = ?auto_94413 ?auto_94414 ) ) ( not ( = ?auto_94413 ?auto_94415 ) ) ( not ( = ?auto_94414 ?auto_94415 ) ) ( CLEAR ?auto_94412 ) ( ON ?auto_94413 ?auto_94414 ) ( CLEAR ?auto_94413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_94406 ?auto_94407 ?auto_94408 ?auto_94409 ?auto_94410 ?auto_94411 ?auto_94412 ?auto_94413 )
      ( MAKE-9PILE ?auto_94406 ?auto_94407 ?auto_94408 ?auto_94409 ?auto_94410 ?auto_94411 ?auto_94412 ?auto_94413 ?auto_94414 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94425 - BLOCK
      ?auto_94426 - BLOCK
      ?auto_94427 - BLOCK
      ?auto_94428 - BLOCK
      ?auto_94429 - BLOCK
      ?auto_94430 - BLOCK
      ?auto_94431 - BLOCK
      ?auto_94432 - BLOCK
      ?auto_94433 - BLOCK
    )
    :vars
    (
      ?auto_94434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94433 ?auto_94434 ) ( ON-TABLE ?auto_94425 ) ( ON ?auto_94426 ?auto_94425 ) ( ON ?auto_94427 ?auto_94426 ) ( ON ?auto_94428 ?auto_94427 ) ( ON ?auto_94429 ?auto_94428 ) ( ON ?auto_94430 ?auto_94429 ) ( not ( = ?auto_94425 ?auto_94426 ) ) ( not ( = ?auto_94425 ?auto_94427 ) ) ( not ( = ?auto_94425 ?auto_94428 ) ) ( not ( = ?auto_94425 ?auto_94429 ) ) ( not ( = ?auto_94425 ?auto_94430 ) ) ( not ( = ?auto_94425 ?auto_94431 ) ) ( not ( = ?auto_94425 ?auto_94432 ) ) ( not ( = ?auto_94425 ?auto_94433 ) ) ( not ( = ?auto_94425 ?auto_94434 ) ) ( not ( = ?auto_94426 ?auto_94427 ) ) ( not ( = ?auto_94426 ?auto_94428 ) ) ( not ( = ?auto_94426 ?auto_94429 ) ) ( not ( = ?auto_94426 ?auto_94430 ) ) ( not ( = ?auto_94426 ?auto_94431 ) ) ( not ( = ?auto_94426 ?auto_94432 ) ) ( not ( = ?auto_94426 ?auto_94433 ) ) ( not ( = ?auto_94426 ?auto_94434 ) ) ( not ( = ?auto_94427 ?auto_94428 ) ) ( not ( = ?auto_94427 ?auto_94429 ) ) ( not ( = ?auto_94427 ?auto_94430 ) ) ( not ( = ?auto_94427 ?auto_94431 ) ) ( not ( = ?auto_94427 ?auto_94432 ) ) ( not ( = ?auto_94427 ?auto_94433 ) ) ( not ( = ?auto_94427 ?auto_94434 ) ) ( not ( = ?auto_94428 ?auto_94429 ) ) ( not ( = ?auto_94428 ?auto_94430 ) ) ( not ( = ?auto_94428 ?auto_94431 ) ) ( not ( = ?auto_94428 ?auto_94432 ) ) ( not ( = ?auto_94428 ?auto_94433 ) ) ( not ( = ?auto_94428 ?auto_94434 ) ) ( not ( = ?auto_94429 ?auto_94430 ) ) ( not ( = ?auto_94429 ?auto_94431 ) ) ( not ( = ?auto_94429 ?auto_94432 ) ) ( not ( = ?auto_94429 ?auto_94433 ) ) ( not ( = ?auto_94429 ?auto_94434 ) ) ( not ( = ?auto_94430 ?auto_94431 ) ) ( not ( = ?auto_94430 ?auto_94432 ) ) ( not ( = ?auto_94430 ?auto_94433 ) ) ( not ( = ?auto_94430 ?auto_94434 ) ) ( not ( = ?auto_94431 ?auto_94432 ) ) ( not ( = ?auto_94431 ?auto_94433 ) ) ( not ( = ?auto_94431 ?auto_94434 ) ) ( not ( = ?auto_94432 ?auto_94433 ) ) ( not ( = ?auto_94432 ?auto_94434 ) ) ( not ( = ?auto_94433 ?auto_94434 ) ) ( ON ?auto_94432 ?auto_94433 ) ( CLEAR ?auto_94430 ) ( ON ?auto_94431 ?auto_94432 ) ( CLEAR ?auto_94431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94425 ?auto_94426 ?auto_94427 ?auto_94428 ?auto_94429 ?auto_94430 ?auto_94431 )
      ( MAKE-9PILE ?auto_94425 ?auto_94426 ?auto_94427 ?auto_94428 ?auto_94429 ?auto_94430 ?auto_94431 ?auto_94432 ?auto_94433 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94444 - BLOCK
      ?auto_94445 - BLOCK
      ?auto_94446 - BLOCK
      ?auto_94447 - BLOCK
      ?auto_94448 - BLOCK
      ?auto_94449 - BLOCK
      ?auto_94450 - BLOCK
      ?auto_94451 - BLOCK
      ?auto_94452 - BLOCK
    )
    :vars
    (
      ?auto_94453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94452 ?auto_94453 ) ( ON-TABLE ?auto_94444 ) ( ON ?auto_94445 ?auto_94444 ) ( ON ?auto_94446 ?auto_94445 ) ( ON ?auto_94447 ?auto_94446 ) ( ON ?auto_94448 ?auto_94447 ) ( ON ?auto_94449 ?auto_94448 ) ( not ( = ?auto_94444 ?auto_94445 ) ) ( not ( = ?auto_94444 ?auto_94446 ) ) ( not ( = ?auto_94444 ?auto_94447 ) ) ( not ( = ?auto_94444 ?auto_94448 ) ) ( not ( = ?auto_94444 ?auto_94449 ) ) ( not ( = ?auto_94444 ?auto_94450 ) ) ( not ( = ?auto_94444 ?auto_94451 ) ) ( not ( = ?auto_94444 ?auto_94452 ) ) ( not ( = ?auto_94444 ?auto_94453 ) ) ( not ( = ?auto_94445 ?auto_94446 ) ) ( not ( = ?auto_94445 ?auto_94447 ) ) ( not ( = ?auto_94445 ?auto_94448 ) ) ( not ( = ?auto_94445 ?auto_94449 ) ) ( not ( = ?auto_94445 ?auto_94450 ) ) ( not ( = ?auto_94445 ?auto_94451 ) ) ( not ( = ?auto_94445 ?auto_94452 ) ) ( not ( = ?auto_94445 ?auto_94453 ) ) ( not ( = ?auto_94446 ?auto_94447 ) ) ( not ( = ?auto_94446 ?auto_94448 ) ) ( not ( = ?auto_94446 ?auto_94449 ) ) ( not ( = ?auto_94446 ?auto_94450 ) ) ( not ( = ?auto_94446 ?auto_94451 ) ) ( not ( = ?auto_94446 ?auto_94452 ) ) ( not ( = ?auto_94446 ?auto_94453 ) ) ( not ( = ?auto_94447 ?auto_94448 ) ) ( not ( = ?auto_94447 ?auto_94449 ) ) ( not ( = ?auto_94447 ?auto_94450 ) ) ( not ( = ?auto_94447 ?auto_94451 ) ) ( not ( = ?auto_94447 ?auto_94452 ) ) ( not ( = ?auto_94447 ?auto_94453 ) ) ( not ( = ?auto_94448 ?auto_94449 ) ) ( not ( = ?auto_94448 ?auto_94450 ) ) ( not ( = ?auto_94448 ?auto_94451 ) ) ( not ( = ?auto_94448 ?auto_94452 ) ) ( not ( = ?auto_94448 ?auto_94453 ) ) ( not ( = ?auto_94449 ?auto_94450 ) ) ( not ( = ?auto_94449 ?auto_94451 ) ) ( not ( = ?auto_94449 ?auto_94452 ) ) ( not ( = ?auto_94449 ?auto_94453 ) ) ( not ( = ?auto_94450 ?auto_94451 ) ) ( not ( = ?auto_94450 ?auto_94452 ) ) ( not ( = ?auto_94450 ?auto_94453 ) ) ( not ( = ?auto_94451 ?auto_94452 ) ) ( not ( = ?auto_94451 ?auto_94453 ) ) ( not ( = ?auto_94452 ?auto_94453 ) ) ( ON ?auto_94451 ?auto_94452 ) ( CLEAR ?auto_94449 ) ( ON ?auto_94450 ?auto_94451 ) ( CLEAR ?auto_94450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94444 ?auto_94445 ?auto_94446 ?auto_94447 ?auto_94448 ?auto_94449 ?auto_94450 )
      ( MAKE-9PILE ?auto_94444 ?auto_94445 ?auto_94446 ?auto_94447 ?auto_94448 ?auto_94449 ?auto_94450 ?auto_94451 ?auto_94452 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94463 - BLOCK
      ?auto_94464 - BLOCK
      ?auto_94465 - BLOCK
      ?auto_94466 - BLOCK
      ?auto_94467 - BLOCK
      ?auto_94468 - BLOCK
      ?auto_94469 - BLOCK
      ?auto_94470 - BLOCK
      ?auto_94471 - BLOCK
    )
    :vars
    (
      ?auto_94472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94471 ?auto_94472 ) ( ON-TABLE ?auto_94463 ) ( ON ?auto_94464 ?auto_94463 ) ( ON ?auto_94465 ?auto_94464 ) ( ON ?auto_94466 ?auto_94465 ) ( ON ?auto_94467 ?auto_94466 ) ( not ( = ?auto_94463 ?auto_94464 ) ) ( not ( = ?auto_94463 ?auto_94465 ) ) ( not ( = ?auto_94463 ?auto_94466 ) ) ( not ( = ?auto_94463 ?auto_94467 ) ) ( not ( = ?auto_94463 ?auto_94468 ) ) ( not ( = ?auto_94463 ?auto_94469 ) ) ( not ( = ?auto_94463 ?auto_94470 ) ) ( not ( = ?auto_94463 ?auto_94471 ) ) ( not ( = ?auto_94463 ?auto_94472 ) ) ( not ( = ?auto_94464 ?auto_94465 ) ) ( not ( = ?auto_94464 ?auto_94466 ) ) ( not ( = ?auto_94464 ?auto_94467 ) ) ( not ( = ?auto_94464 ?auto_94468 ) ) ( not ( = ?auto_94464 ?auto_94469 ) ) ( not ( = ?auto_94464 ?auto_94470 ) ) ( not ( = ?auto_94464 ?auto_94471 ) ) ( not ( = ?auto_94464 ?auto_94472 ) ) ( not ( = ?auto_94465 ?auto_94466 ) ) ( not ( = ?auto_94465 ?auto_94467 ) ) ( not ( = ?auto_94465 ?auto_94468 ) ) ( not ( = ?auto_94465 ?auto_94469 ) ) ( not ( = ?auto_94465 ?auto_94470 ) ) ( not ( = ?auto_94465 ?auto_94471 ) ) ( not ( = ?auto_94465 ?auto_94472 ) ) ( not ( = ?auto_94466 ?auto_94467 ) ) ( not ( = ?auto_94466 ?auto_94468 ) ) ( not ( = ?auto_94466 ?auto_94469 ) ) ( not ( = ?auto_94466 ?auto_94470 ) ) ( not ( = ?auto_94466 ?auto_94471 ) ) ( not ( = ?auto_94466 ?auto_94472 ) ) ( not ( = ?auto_94467 ?auto_94468 ) ) ( not ( = ?auto_94467 ?auto_94469 ) ) ( not ( = ?auto_94467 ?auto_94470 ) ) ( not ( = ?auto_94467 ?auto_94471 ) ) ( not ( = ?auto_94467 ?auto_94472 ) ) ( not ( = ?auto_94468 ?auto_94469 ) ) ( not ( = ?auto_94468 ?auto_94470 ) ) ( not ( = ?auto_94468 ?auto_94471 ) ) ( not ( = ?auto_94468 ?auto_94472 ) ) ( not ( = ?auto_94469 ?auto_94470 ) ) ( not ( = ?auto_94469 ?auto_94471 ) ) ( not ( = ?auto_94469 ?auto_94472 ) ) ( not ( = ?auto_94470 ?auto_94471 ) ) ( not ( = ?auto_94470 ?auto_94472 ) ) ( not ( = ?auto_94471 ?auto_94472 ) ) ( ON ?auto_94470 ?auto_94471 ) ( ON ?auto_94469 ?auto_94470 ) ( CLEAR ?auto_94467 ) ( ON ?auto_94468 ?auto_94469 ) ( CLEAR ?auto_94468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94463 ?auto_94464 ?auto_94465 ?auto_94466 ?auto_94467 ?auto_94468 )
      ( MAKE-9PILE ?auto_94463 ?auto_94464 ?auto_94465 ?auto_94466 ?auto_94467 ?auto_94468 ?auto_94469 ?auto_94470 ?auto_94471 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94482 - BLOCK
      ?auto_94483 - BLOCK
      ?auto_94484 - BLOCK
      ?auto_94485 - BLOCK
      ?auto_94486 - BLOCK
      ?auto_94487 - BLOCK
      ?auto_94488 - BLOCK
      ?auto_94489 - BLOCK
      ?auto_94490 - BLOCK
    )
    :vars
    (
      ?auto_94491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94490 ?auto_94491 ) ( ON-TABLE ?auto_94482 ) ( ON ?auto_94483 ?auto_94482 ) ( ON ?auto_94484 ?auto_94483 ) ( ON ?auto_94485 ?auto_94484 ) ( ON ?auto_94486 ?auto_94485 ) ( not ( = ?auto_94482 ?auto_94483 ) ) ( not ( = ?auto_94482 ?auto_94484 ) ) ( not ( = ?auto_94482 ?auto_94485 ) ) ( not ( = ?auto_94482 ?auto_94486 ) ) ( not ( = ?auto_94482 ?auto_94487 ) ) ( not ( = ?auto_94482 ?auto_94488 ) ) ( not ( = ?auto_94482 ?auto_94489 ) ) ( not ( = ?auto_94482 ?auto_94490 ) ) ( not ( = ?auto_94482 ?auto_94491 ) ) ( not ( = ?auto_94483 ?auto_94484 ) ) ( not ( = ?auto_94483 ?auto_94485 ) ) ( not ( = ?auto_94483 ?auto_94486 ) ) ( not ( = ?auto_94483 ?auto_94487 ) ) ( not ( = ?auto_94483 ?auto_94488 ) ) ( not ( = ?auto_94483 ?auto_94489 ) ) ( not ( = ?auto_94483 ?auto_94490 ) ) ( not ( = ?auto_94483 ?auto_94491 ) ) ( not ( = ?auto_94484 ?auto_94485 ) ) ( not ( = ?auto_94484 ?auto_94486 ) ) ( not ( = ?auto_94484 ?auto_94487 ) ) ( not ( = ?auto_94484 ?auto_94488 ) ) ( not ( = ?auto_94484 ?auto_94489 ) ) ( not ( = ?auto_94484 ?auto_94490 ) ) ( not ( = ?auto_94484 ?auto_94491 ) ) ( not ( = ?auto_94485 ?auto_94486 ) ) ( not ( = ?auto_94485 ?auto_94487 ) ) ( not ( = ?auto_94485 ?auto_94488 ) ) ( not ( = ?auto_94485 ?auto_94489 ) ) ( not ( = ?auto_94485 ?auto_94490 ) ) ( not ( = ?auto_94485 ?auto_94491 ) ) ( not ( = ?auto_94486 ?auto_94487 ) ) ( not ( = ?auto_94486 ?auto_94488 ) ) ( not ( = ?auto_94486 ?auto_94489 ) ) ( not ( = ?auto_94486 ?auto_94490 ) ) ( not ( = ?auto_94486 ?auto_94491 ) ) ( not ( = ?auto_94487 ?auto_94488 ) ) ( not ( = ?auto_94487 ?auto_94489 ) ) ( not ( = ?auto_94487 ?auto_94490 ) ) ( not ( = ?auto_94487 ?auto_94491 ) ) ( not ( = ?auto_94488 ?auto_94489 ) ) ( not ( = ?auto_94488 ?auto_94490 ) ) ( not ( = ?auto_94488 ?auto_94491 ) ) ( not ( = ?auto_94489 ?auto_94490 ) ) ( not ( = ?auto_94489 ?auto_94491 ) ) ( not ( = ?auto_94490 ?auto_94491 ) ) ( ON ?auto_94489 ?auto_94490 ) ( ON ?auto_94488 ?auto_94489 ) ( CLEAR ?auto_94486 ) ( ON ?auto_94487 ?auto_94488 ) ( CLEAR ?auto_94487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94482 ?auto_94483 ?auto_94484 ?auto_94485 ?auto_94486 ?auto_94487 )
      ( MAKE-9PILE ?auto_94482 ?auto_94483 ?auto_94484 ?auto_94485 ?auto_94486 ?auto_94487 ?auto_94488 ?auto_94489 ?auto_94490 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94501 - BLOCK
      ?auto_94502 - BLOCK
      ?auto_94503 - BLOCK
      ?auto_94504 - BLOCK
      ?auto_94505 - BLOCK
      ?auto_94506 - BLOCK
      ?auto_94507 - BLOCK
      ?auto_94508 - BLOCK
      ?auto_94509 - BLOCK
    )
    :vars
    (
      ?auto_94510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94509 ?auto_94510 ) ( ON-TABLE ?auto_94501 ) ( ON ?auto_94502 ?auto_94501 ) ( ON ?auto_94503 ?auto_94502 ) ( ON ?auto_94504 ?auto_94503 ) ( not ( = ?auto_94501 ?auto_94502 ) ) ( not ( = ?auto_94501 ?auto_94503 ) ) ( not ( = ?auto_94501 ?auto_94504 ) ) ( not ( = ?auto_94501 ?auto_94505 ) ) ( not ( = ?auto_94501 ?auto_94506 ) ) ( not ( = ?auto_94501 ?auto_94507 ) ) ( not ( = ?auto_94501 ?auto_94508 ) ) ( not ( = ?auto_94501 ?auto_94509 ) ) ( not ( = ?auto_94501 ?auto_94510 ) ) ( not ( = ?auto_94502 ?auto_94503 ) ) ( not ( = ?auto_94502 ?auto_94504 ) ) ( not ( = ?auto_94502 ?auto_94505 ) ) ( not ( = ?auto_94502 ?auto_94506 ) ) ( not ( = ?auto_94502 ?auto_94507 ) ) ( not ( = ?auto_94502 ?auto_94508 ) ) ( not ( = ?auto_94502 ?auto_94509 ) ) ( not ( = ?auto_94502 ?auto_94510 ) ) ( not ( = ?auto_94503 ?auto_94504 ) ) ( not ( = ?auto_94503 ?auto_94505 ) ) ( not ( = ?auto_94503 ?auto_94506 ) ) ( not ( = ?auto_94503 ?auto_94507 ) ) ( not ( = ?auto_94503 ?auto_94508 ) ) ( not ( = ?auto_94503 ?auto_94509 ) ) ( not ( = ?auto_94503 ?auto_94510 ) ) ( not ( = ?auto_94504 ?auto_94505 ) ) ( not ( = ?auto_94504 ?auto_94506 ) ) ( not ( = ?auto_94504 ?auto_94507 ) ) ( not ( = ?auto_94504 ?auto_94508 ) ) ( not ( = ?auto_94504 ?auto_94509 ) ) ( not ( = ?auto_94504 ?auto_94510 ) ) ( not ( = ?auto_94505 ?auto_94506 ) ) ( not ( = ?auto_94505 ?auto_94507 ) ) ( not ( = ?auto_94505 ?auto_94508 ) ) ( not ( = ?auto_94505 ?auto_94509 ) ) ( not ( = ?auto_94505 ?auto_94510 ) ) ( not ( = ?auto_94506 ?auto_94507 ) ) ( not ( = ?auto_94506 ?auto_94508 ) ) ( not ( = ?auto_94506 ?auto_94509 ) ) ( not ( = ?auto_94506 ?auto_94510 ) ) ( not ( = ?auto_94507 ?auto_94508 ) ) ( not ( = ?auto_94507 ?auto_94509 ) ) ( not ( = ?auto_94507 ?auto_94510 ) ) ( not ( = ?auto_94508 ?auto_94509 ) ) ( not ( = ?auto_94508 ?auto_94510 ) ) ( not ( = ?auto_94509 ?auto_94510 ) ) ( ON ?auto_94508 ?auto_94509 ) ( ON ?auto_94507 ?auto_94508 ) ( ON ?auto_94506 ?auto_94507 ) ( CLEAR ?auto_94504 ) ( ON ?auto_94505 ?auto_94506 ) ( CLEAR ?auto_94505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94501 ?auto_94502 ?auto_94503 ?auto_94504 ?auto_94505 )
      ( MAKE-9PILE ?auto_94501 ?auto_94502 ?auto_94503 ?auto_94504 ?auto_94505 ?auto_94506 ?auto_94507 ?auto_94508 ?auto_94509 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94520 - BLOCK
      ?auto_94521 - BLOCK
      ?auto_94522 - BLOCK
      ?auto_94523 - BLOCK
      ?auto_94524 - BLOCK
      ?auto_94525 - BLOCK
      ?auto_94526 - BLOCK
      ?auto_94527 - BLOCK
      ?auto_94528 - BLOCK
    )
    :vars
    (
      ?auto_94529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94528 ?auto_94529 ) ( ON-TABLE ?auto_94520 ) ( ON ?auto_94521 ?auto_94520 ) ( ON ?auto_94522 ?auto_94521 ) ( ON ?auto_94523 ?auto_94522 ) ( not ( = ?auto_94520 ?auto_94521 ) ) ( not ( = ?auto_94520 ?auto_94522 ) ) ( not ( = ?auto_94520 ?auto_94523 ) ) ( not ( = ?auto_94520 ?auto_94524 ) ) ( not ( = ?auto_94520 ?auto_94525 ) ) ( not ( = ?auto_94520 ?auto_94526 ) ) ( not ( = ?auto_94520 ?auto_94527 ) ) ( not ( = ?auto_94520 ?auto_94528 ) ) ( not ( = ?auto_94520 ?auto_94529 ) ) ( not ( = ?auto_94521 ?auto_94522 ) ) ( not ( = ?auto_94521 ?auto_94523 ) ) ( not ( = ?auto_94521 ?auto_94524 ) ) ( not ( = ?auto_94521 ?auto_94525 ) ) ( not ( = ?auto_94521 ?auto_94526 ) ) ( not ( = ?auto_94521 ?auto_94527 ) ) ( not ( = ?auto_94521 ?auto_94528 ) ) ( not ( = ?auto_94521 ?auto_94529 ) ) ( not ( = ?auto_94522 ?auto_94523 ) ) ( not ( = ?auto_94522 ?auto_94524 ) ) ( not ( = ?auto_94522 ?auto_94525 ) ) ( not ( = ?auto_94522 ?auto_94526 ) ) ( not ( = ?auto_94522 ?auto_94527 ) ) ( not ( = ?auto_94522 ?auto_94528 ) ) ( not ( = ?auto_94522 ?auto_94529 ) ) ( not ( = ?auto_94523 ?auto_94524 ) ) ( not ( = ?auto_94523 ?auto_94525 ) ) ( not ( = ?auto_94523 ?auto_94526 ) ) ( not ( = ?auto_94523 ?auto_94527 ) ) ( not ( = ?auto_94523 ?auto_94528 ) ) ( not ( = ?auto_94523 ?auto_94529 ) ) ( not ( = ?auto_94524 ?auto_94525 ) ) ( not ( = ?auto_94524 ?auto_94526 ) ) ( not ( = ?auto_94524 ?auto_94527 ) ) ( not ( = ?auto_94524 ?auto_94528 ) ) ( not ( = ?auto_94524 ?auto_94529 ) ) ( not ( = ?auto_94525 ?auto_94526 ) ) ( not ( = ?auto_94525 ?auto_94527 ) ) ( not ( = ?auto_94525 ?auto_94528 ) ) ( not ( = ?auto_94525 ?auto_94529 ) ) ( not ( = ?auto_94526 ?auto_94527 ) ) ( not ( = ?auto_94526 ?auto_94528 ) ) ( not ( = ?auto_94526 ?auto_94529 ) ) ( not ( = ?auto_94527 ?auto_94528 ) ) ( not ( = ?auto_94527 ?auto_94529 ) ) ( not ( = ?auto_94528 ?auto_94529 ) ) ( ON ?auto_94527 ?auto_94528 ) ( ON ?auto_94526 ?auto_94527 ) ( ON ?auto_94525 ?auto_94526 ) ( CLEAR ?auto_94523 ) ( ON ?auto_94524 ?auto_94525 ) ( CLEAR ?auto_94524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94520 ?auto_94521 ?auto_94522 ?auto_94523 ?auto_94524 )
      ( MAKE-9PILE ?auto_94520 ?auto_94521 ?auto_94522 ?auto_94523 ?auto_94524 ?auto_94525 ?auto_94526 ?auto_94527 ?auto_94528 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94539 - BLOCK
      ?auto_94540 - BLOCK
      ?auto_94541 - BLOCK
      ?auto_94542 - BLOCK
      ?auto_94543 - BLOCK
      ?auto_94544 - BLOCK
      ?auto_94545 - BLOCK
      ?auto_94546 - BLOCK
      ?auto_94547 - BLOCK
    )
    :vars
    (
      ?auto_94548 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94547 ?auto_94548 ) ( ON-TABLE ?auto_94539 ) ( ON ?auto_94540 ?auto_94539 ) ( ON ?auto_94541 ?auto_94540 ) ( not ( = ?auto_94539 ?auto_94540 ) ) ( not ( = ?auto_94539 ?auto_94541 ) ) ( not ( = ?auto_94539 ?auto_94542 ) ) ( not ( = ?auto_94539 ?auto_94543 ) ) ( not ( = ?auto_94539 ?auto_94544 ) ) ( not ( = ?auto_94539 ?auto_94545 ) ) ( not ( = ?auto_94539 ?auto_94546 ) ) ( not ( = ?auto_94539 ?auto_94547 ) ) ( not ( = ?auto_94539 ?auto_94548 ) ) ( not ( = ?auto_94540 ?auto_94541 ) ) ( not ( = ?auto_94540 ?auto_94542 ) ) ( not ( = ?auto_94540 ?auto_94543 ) ) ( not ( = ?auto_94540 ?auto_94544 ) ) ( not ( = ?auto_94540 ?auto_94545 ) ) ( not ( = ?auto_94540 ?auto_94546 ) ) ( not ( = ?auto_94540 ?auto_94547 ) ) ( not ( = ?auto_94540 ?auto_94548 ) ) ( not ( = ?auto_94541 ?auto_94542 ) ) ( not ( = ?auto_94541 ?auto_94543 ) ) ( not ( = ?auto_94541 ?auto_94544 ) ) ( not ( = ?auto_94541 ?auto_94545 ) ) ( not ( = ?auto_94541 ?auto_94546 ) ) ( not ( = ?auto_94541 ?auto_94547 ) ) ( not ( = ?auto_94541 ?auto_94548 ) ) ( not ( = ?auto_94542 ?auto_94543 ) ) ( not ( = ?auto_94542 ?auto_94544 ) ) ( not ( = ?auto_94542 ?auto_94545 ) ) ( not ( = ?auto_94542 ?auto_94546 ) ) ( not ( = ?auto_94542 ?auto_94547 ) ) ( not ( = ?auto_94542 ?auto_94548 ) ) ( not ( = ?auto_94543 ?auto_94544 ) ) ( not ( = ?auto_94543 ?auto_94545 ) ) ( not ( = ?auto_94543 ?auto_94546 ) ) ( not ( = ?auto_94543 ?auto_94547 ) ) ( not ( = ?auto_94543 ?auto_94548 ) ) ( not ( = ?auto_94544 ?auto_94545 ) ) ( not ( = ?auto_94544 ?auto_94546 ) ) ( not ( = ?auto_94544 ?auto_94547 ) ) ( not ( = ?auto_94544 ?auto_94548 ) ) ( not ( = ?auto_94545 ?auto_94546 ) ) ( not ( = ?auto_94545 ?auto_94547 ) ) ( not ( = ?auto_94545 ?auto_94548 ) ) ( not ( = ?auto_94546 ?auto_94547 ) ) ( not ( = ?auto_94546 ?auto_94548 ) ) ( not ( = ?auto_94547 ?auto_94548 ) ) ( ON ?auto_94546 ?auto_94547 ) ( ON ?auto_94545 ?auto_94546 ) ( ON ?auto_94544 ?auto_94545 ) ( ON ?auto_94543 ?auto_94544 ) ( CLEAR ?auto_94541 ) ( ON ?auto_94542 ?auto_94543 ) ( CLEAR ?auto_94542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94539 ?auto_94540 ?auto_94541 ?auto_94542 )
      ( MAKE-9PILE ?auto_94539 ?auto_94540 ?auto_94541 ?auto_94542 ?auto_94543 ?auto_94544 ?auto_94545 ?auto_94546 ?auto_94547 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94558 - BLOCK
      ?auto_94559 - BLOCK
      ?auto_94560 - BLOCK
      ?auto_94561 - BLOCK
      ?auto_94562 - BLOCK
      ?auto_94563 - BLOCK
      ?auto_94564 - BLOCK
      ?auto_94565 - BLOCK
      ?auto_94566 - BLOCK
    )
    :vars
    (
      ?auto_94567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94566 ?auto_94567 ) ( ON-TABLE ?auto_94558 ) ( ON ?auto_94559 ?auto_94558 ) ( ON ?auto_94560 ?auto_94559 ) ( not ( = ?auto_94558 ?auto_94559 ) ) ( not ( = ?auto_94558 ?auto_94560 ) ) ( not ( = ?auto_94558 ?auto_94561 ) ) ( not ( = ?auto_94558 ?auto_94562 ) ) ( not ( = ?auto_94558 ?auto_94563 ) ) ( not ( = ?auto_94558 ?auto_94564 ) ) ( not ( = ?auto_94558 ?auto_94565 ) ) ( not ( = ?auto_94558 ?auto_94566 ) ) ( not ( = ?auto_94558 ?auto_94567 ) ) ( not ( = ?auto_94559 ?auto_94560 ) ) ( not ( = ?auto_94559 ?auto_94561 ) ) ( not ( = ?auto_94559 ?auto_94562 ) ) ( not ( = ?auto_94559 ?auto_94563 ) ) ( not ( = ?auto_94559 ?auto_94564 ) ) ( not ( = ?auto_94559 ?auto_94565 ) ) ( not ( = ?auto_94559 ?auto_94566 ) ) ( not ( = ?auto_94559 ?auto_94567 ) ) ( not ( = ?auto_94560 ?auto_94561 ) ) ( not ( = ?auto_94560 ?auto_94562 ) ) ( not ( = ?auto_94560 ?auto_94563 ) ) ( not ( = ?auto_94560 ?auto_94564 ) ) ( not ( = ?auto_94560 ?auto_94565 ) ) ( not ( = ?auto_94560 ?auto_94566 ) ) ( not ( = ?auto_94560 ?auto_94567 ) ) ( not ( = ?auto_94561 ?auto_94562 ) ) ( not ( = ?auto_94561 ?auto_94563 ) ) ( not ( = ?auto_94561 ?auto_94564 ) ) ( not ( = ?auto_94561 ?auto_94565 ) ) ( not ( = ?auto_94561 ?auto_94566 ) ) ( not ( = ?auto_94561 ?auto_94567 ) ) ( not ( = ?auto_94562 ?auto_94563 ) ) ( not ( = ?auto_94562 ?auto_94564 ) ) ( not ( = ?auto_94562 ?auto_94565 ) ) ( not ( = ?auto_94562 ?auto_94566 ) ) ( not ( = ?auto_94562 ?auto_94567 ) ) ( not ( = ?auto_94563 ?auto_94564 ) ) ( not ( = ?auto_94563 ?auto_94565 ) ) ( not ( = ?auto_94563 ?auto_94566 ) ) ( not ( = ?auto_94563 ?auto_94567 ) ) ( not ( = ?auto_94564 ?auto_94565 ) ) ( not ( = ?auto_94564 ?auto_94566 ) ) ( not ( = ?auto_94564 ?auto_94567 ) ) ( not ( = ?auto_94565 ?auto_94566 ) ) ( not ( = ?auto_94565 ?auto_94567 ) ) ( not ( = ?auto_94566 ?auto_94567 ) ) ( ON ?auto_94565 ?auto_94566 ) ( ON ?auto_94564 ?auto_94565 ) ( ON ?auto_94563 ?auto_94564 ) ( ON ?auto_94562 ?auto_94563 ) ( CLEAR ?auto_94560 ) ( ON ?auto_94561 ?auto_94562 ) ( CLEAR ?auto_94561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94558 ?auto_94559 ?auto_94560 ?auto_94561 )
      ( MAKE-9PILE ?auto_94558 ?auto_94559 ?auto_94560 ?auto_94561 ?auto_94562 ?auto_94563 ?auto_94564 ?auto_94565 ?auto_94566 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94577 - BLOCK
      ?auto_94578 - BLOCK
      ?auto_94579 - BLOCK
      ?auto_94580 - BLOCK
      ?auto_94581 - BLOCK
      ?auto_94582 - BLOCK
      ?auto_94583 - BLOCK
      ?auto_94584 - BLOCK
      ?auto_94585 - BLOCK
    )
    :vars
    (
      ?auto_94586 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94585 ?auto_94586 ) ( ON-TABLE ?auto_94577 ) ( ON ?auto_94578 ?auto_94577 ) ( not ( = ?auto_94577 ?auto_94578 ) ) ( not ( = ?auto_94577 ?auto_94579 ) ) ( not ( = ?auto_94577 ?auto_94580 ) ) ( not ( = ?auto_94577 ?auto_94581 ) ) ( not ( = ?auto_94577 ?auto_94582 ) ) ( not ( = ?auto_94577 ?auto_94583 ) ) ( not ( = ?auto_94577 ?auto_94584 ) ) ( not ( = ?auto_94577 ?auto_94585 ) ) ( not ( = ?auto_94577 ?auto_94586 ) ) ( not ( = ?auto_94578 ?auto_94579 ) ) ( not ( = ?auto_94578 ?auto_94580 ) ) ( not ( = ?auto_94578 ?auto_94581 ) ) ( not ( = ?auto_94578 ?auto_94582 ) ) ( not ( = ?auto_94578 ?auto_94583 ) ) ( not ( = ?auto_94578 ?auto_94584 ) ) ( not ( = ?auto_94578 ?auto_94585 ) ) ( not ( = ?auto_94578 ?auto_94586 ) ) ( not ( = ?auto_94579 ?auto_94580 ) ) ( not ( = ?auto_94579 ?auto_94581 ) ) ( not ( = ?auto_94579 ?auto_94582 ) ) ( not ( = ?auto_94579 ?auto_94583 ) ) ( not ( = ?auto_94579 ?auto_94584 ) ) ( not ( = ?auto_94579 ?auto_94585 ) ) ( not ( = ?auto_94579 ?auto_94586 ) ) ( not ( = ?auto_94580 ?auto_94581 ) ) ( not ( = ?auto_94580 ?auto_94582 ) ) ( not ( = ?auto_94580 ?auto_94583 ) ) ( not ( = ?auto_94580 ?auto_94584 ) ) ( not ( = ?auto_94580 ?auto_94585 ) ) ( not ( = ?auto_94580 ?auto_94586 ) ) ( not ( = ?auto_94581 ?auto_94582 ) ) ( not ( = ?auto_94581 ?auto_94583 ) ) ( not ( = ?auto_94581 ?auto_94584 ) ) ( not ( = ?auto_94581 ?auto_94585 ) ) ( not ( = ?auto_94581 ?auto_94586 ) ) ( not ( = ?auto_94582 ?auto_94583 ) ) ( not ( = ?auto_94582 ?auto_94584 ) ) ( not ( = ?auto_94582 ?auto_94585 ) ) ( not ( = ?auto_94582 ?auto_94586 ) ) ( not ( = ?auto_94583 ?auto_94584 ) ) ( not ( = ?auto_94583 ?auto_94585 ) ) ( not ( = ?auto_94583 ?auto_94586 ) ) ( not ( = ?auto_94584 ?auto_94585 ) ) ( not ( = ?auto_94584 ?auto_94586 ) ) ( not ( = ?auto_94585 ?auto_94586 ) ) ( ON ?auto_94584 ?auto_94585 ) ( ON ?auto_94583 ?auto_94584 ) ( ON ?auto_94582 ?auto_94583 ) ( ON ?auto_94581 ?auto_94582 ) ( ON ?auto_94580 ?auto_94581 ) ( CLEAR ?auto_94578 ) ( ON ?auto_94579 ?auto_94580 ) ( CLEAR ?auto_94579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94577 ?auto_94578 ?auto_94579 )
      ( MAKE-9PILE ?auto_94577 ?auto_94578 ?auto_94579 ?auto_94580 ?auto_94581 ?auto_94582 ?auto_94583 ?auto_94584 ?auto_94585 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94596 - BLOCK
      ?auto_94597 - BLOCK
      ?auto_94598 - BLOCK
      ?auto_94599 - BLOCK
      ?auto_94600 - BLOCK
      ?auto_94601 - BLOCK
      ?auto_94602 - BLOCK
      ?auto_94603 - BLOCK
      ?auto_94604 - BLOCK
    )
    :vars
    (
      ?auto_94605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94604 ?auto_94605 ) ( ON-TABLE ?auto_94596 ) ( ON ?auto_94597 ?auto_94596 ) ( not ( = ?auto_94596 ?auto_94597 ) ) ( not ( = ?auto_94596 ?auto_94598 ) ) ( not ( = ?auto_94596 ?auto_94599 ) ) ( not ( = ?auto_94596 ?auto_94600 ) ) ( not ( = ?auto_94596 ?auto_94601 ) ) ( not ( = ?auto_94596 ?auto_94602 ) ) ( not ( = ?auto_94596 ?auto_94603 ) ) ( not ( = ?auto_94596 ?auto_94604 ) ) ( not ( = ?auto_94596 ?auto_94605 ) ) ( not ( = ?auto_94597 ?auto_94598 ) ) ( not ( = ?auto_94597 ?auto_94599 ) ) ( not ( = ?auto_94597 ?auto_94600 ) ) ( not ( = ?auto_94597 ?auto_94601 ) ) ( not ( = ?auto_94597 ?auto_94602 ) ) ( not ( = ?auto_94597 ?auto_94603 ) ) ( not ( = ?auto_94597 ?auto_94604 ) ) ( not ( = ?auto_94597 ?auto_94605 ) ) ( not ( = ?auto_94598 ?auto_94599 ) ) ( not ( = ?auto_94598 ?auto_94600 ) ) ( not ( = ?auto_94598 ?auto_94601 ) ) ( not ( = ?auto_94598 ?auto_94602 ) ) ( not ( = ?auto_94598 ?auto_94603 ) ) ( not ( = ?auto_94598 ?auto_94604 ) ) ( not ( = ?auto_94598 ?auto_94605 ) ) ( not ( = ?auto_94599 ?auto_94600 ) ) ( not ( = ?auto_94599 ?auto_94601 ) ) ( not ( = ?auto_94599 ?auto_94602 ) ) ( not ( = ?auto_94599 ?auto_94603 ) ) ( not ( = ?auto_94599 ?auto_94604 ) ) ( not ( = ?auto_94599 ?auto_94605 ) ) ( not ( = ?auto_94600 ?auto_94601 ) ) ( not ( = ?auto_94600 ?auto_94602 ) ) ( not ( = ?auto_94600 ?auto_94603 ) ) ( not ( = ?auto_94600 ?auto_94604 ) ) ( not ( = ?auto_94600 ?auto_94605 ) ) ( not ( = ?auto_94601 ?auto_94602 ) ) ( not ( = ?auto_94601 ?auto_94603 ) ) ( not ( = ?auto_94601 ?auto_94604 ) ) ( not ( = ?auto_94601 ?auto_94605 ) ) ( not ( = ?auto_94602 ?auto_94603 ) ) ( not ( = ?auto_94602 ?auto_94604 ) ) ( not ( = ?auto_94602 ?auto_94605 ) ) ( not ( = ?auto_94603 ?auto_94604 ) ) ( not ( = ?auto_94603 ?auto_94605 ) ) ( not ( = ?auto_94604 ?auto_94605 ) ) ( ON ?auto_94603 ?auto_94604 ) ( ON ?auto_94602 ?auto_94603 ) ( ON ?auto_94601 ?auto_94602 ) ( ON ?auto_94600 ?auto_94601 ) ( ON ?auto_94599 ?auto_94600 ) ( CLEAR ?auto_94597 ) ( ON ?auto_94598 ?auto_94599 ) ( CLEAR ?auto_94598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94596 ?auto_94597 ?auto_94598 )
      ( MAKE-9PILE ?auto_94596 ?auto_94597 ?auto_94598 ?auto_94599 ?auto_94600 ?auto_94601 ?auto_94602 ?auto_94603 ?auto_94604 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94615 - BLOCK
      ?auto_94616 - BLOCK
      ?auto_94617 - BLOCK
      ?auto_94618 - BLOCK
      ?auto_94619 - BLOCK
      ?auto_94620 - BLOCK
      ?auto_94621 - BLOCK
      ?auto_94622 - BLOCK
      ?auto_94623 - BLOCK
    )
    :vars
    (
      ?auto_94624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94623 ?auto_94624 ) ( ON-TABLE ?auto_94615 ) ( not ( = ?auto_94615 ?auto_94616 ) ) ( not ( = ?auto_94615 ?auto_94617 ) ) ( not ( = ?auto_94615 ?auto_94618 ) ) ( not ( = ?auto_94615 ?auto_94619 ) ) ( not ( = ?auto_94615 ?auto_94620 ) ) ( not ( = ?auto_94615 ?auto_94621 ) ) ( not ( = ?auto_94615 ?auto_94622 ) ) ( not ( = ?auto_94615 ?auto_94623 ) ) ( not ( = ?auto_94615 ?auto_94624 ) ) ( not ( = ?auto_94616 ?auto_94617 ) ) ( not ( = ?auto_94616 ?auto_94618 ) ) ( not ( = ?auto_94616 ?auto_94619 ) ) ( not ( = ?auto_94616 ?auto_94620 ) ) ( not ( = ?auto_94616 ?auto_94621 ) ) ( not ( = ?auto_94616 ?auto_94622 ) ) ( not ( = ?auto_94616 ?auto_94623 ) ) ( not ( = ?auto_94616 ?auto_94624 ) ) ( not ( = ?auto_94617 ?auto_94618 ) ) ( not ( = ?auto_94617 ?auto_94619 ) ) ( not ( = ?auto_94617 ?auto_94620 ) ) ( not ( = ?auto_94617 ?auto_94621 ) ) ( not ( = ?auto_94617 ?auto_94622 ) ) ( not ( = ?auto_94617 ?auto_94623 ) ) ( not ( = ?auto_94617 ?auto_94624 ) ) ( not ( = ?auto_94618 ?auto_94619 ) ) ( not ( = ?auto_94618 ?auto_94620 ) ) ( not ( = ?auto_94618 ?auto_94621 ) ) ( not ( = ?auto_94618 ?auto_94622 ) ) ( not ( = ?auto_94618 ?auto_94623 ) ) ( not ( = ?auto_94618 ?auto_94624 ) ) ( not ( = ?auto_94619 ?auto_94620 ) ) ( not ( = ?auto_94619 ?auto_94621 ) ) ( not ( = ?auto_94619 ?auto_94622 ) ) ( not ( = ?auto_94619 ?auto_94623 ) ) ( not ( = ?auto_94619 ?auto_94624 ) ) ( not ( = ?auto_94620 ?auto_94621 ) ) ( not ( = ?auto_94620 ?auto_94622 ) ) ( not ( = ?auto_94620 ?auto_94623 ) ) ( not ( = ?auto_94620 ?auto_94624 ) ) ( not ( = ?auto_94621 ?auto_94622 ) ) ( not ( = ?auto_94621 ?auto_94623 ) ) ( not ( = ?auto_94621 ?auto_94624 ) ) ( not ( = ?auto_94622 ?auto_94623 ) ) ( not ( = ?auto_94622 ?auto_94624 ) ) ( not ( = ?auto_94623 ?auto_94624 ) ) ( ON ?auto_94622 ?auto_94623 ) ( ON ?auto_94621 ?auto_94622 ) ( ON ?auto_94620 ?auto_94621 ) ( ON ?auto_94619 ?auto_94620 ) ( ON ?auto_94618 ?auto_94619 ) ( ON ?auto_94617 ?auto_94618 ) ( CLEAR ?auto_94615 ) ( ON ?auto_94616 ?auto_94617 ) ( CLEAR ?auto_94616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94615 ?auto_94616 )
      ( MAKE-9PILE ?auto_94615 ?auto_94616 ?auto_94617 ?auto_94618 ?auto_94619 ?auto_94620 ?auto_94621 ?auto_94622 ?auto_94623 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94634 - BLOCK
      ?auto_94635 - BLOCK
      ?auto_94636 - BLOCK
      ?auto_94637 - BLOCK
      ?auto_94638 - BLOCK
      ?auto_94639 - BLOCK
      ?auto_94640 - BLOCK
      ?auto_94641 - BLOCK
      ?auto_94642 - BLOCK
    )
    :vars
    (
      ?auto_94643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94642 ?auto_94643 ) ( ON-TABLE ?auto_94634 ) ( not ( = ?auto_94634 ?auto_94635 ) ) ( not ( = ?auto_94634 ?auto_94636 ) ) ( not ( = ?auto_94634 ?auto_94637 ) ) ( not ( = ?auto_94634 ?auto_94638 ) ) ( not ( = ?auto_94634 ?auto_94639 ) ) ( not ( = ?auto_94634 ?auto_94640 ) ) ( not ( = ?auto_94634 ?auto_94641 ) ) ( not ( = ?auto_94634 ?auto_94642 ) ) ( not ( = ?auto_94634 ?auto_94643 ) ) ( not ( = ?auto_94635 ?auto_94636 ) ) ( not ( = ?auto_94635 ?auto_94637 ) ) ( not ( = ?auto_94635 ?auto_94638 ) ) ( not ( = ?auto_94635 ?auto_94639 ) ) ( not ( = ?auto_94635 ?auto_94640 ) ) ( not ( = ?auto_94635 ?auto_94641 ) ) ( not ( = ?auto_94635 ?auto_94642 ) ) ( not ( = ?auto_94635 ?auto_94643 ) ) ( not ( = ?auto_94636 ?auto_94637 ) ) ( not ( = ?auto_94636 ?auto_94638 ) ) ( not ( = ?auto_94636 ?auto_94639 ) ) ( not ( = ?auto_94636 ?auto_94640 ) ) ( not ( = ?auto_94636 ?auto_94641 ) ) ( not ( = ?auto_94636 ?auto_94642 ) ) ( not ( = ?auto_94636 ?auto_94643 ) ) ( not ( = ?auto_94637 ?auto_94638 ) ) ( not ( = ?auto_94637 ?auto_94639 ) ) ( not ( = ?auto_94637 ?auto_94640 ) ) ( not ( = ?auto_94637 ?auto_94641 ) ) ( not ( = ?auto_94637 ?auto_94642 ) ) ( not ( = ?auto_94637 ?auto_94643 ) ) ( not ( = ?auto_94638 ?auto_94639 ) ) ( not ( = ?auto_94638 ?auto_94640 ) ) ( not ( = ?auto_94638 ?auto_94641 ) ) ( not ( = ?auto_94638 ?auto_94642 ) ) ( not ( = ?auto_94638 ?auto_94643 ) ) ( not ( = ?auto_94639 ?auto_94640 ) ) ( not ( = ?auto_94639 ?auto_94641 ) ) ( not ( = ?auto_94639 ?auto_94642 ) ) ( not ( = ?auto_94639 ?auto_94643 ) ) ( not ( = ?auto_94640 ?auto_94641 ) ) ( not ( = ?auto_94640 ?auto_94642 ) ) ( not ( = ?auto_94640 ?auto_94643 ) ) ( not ( = ?auto_94641 ?auto_94642 ) ) ( not ( = ?auto_94641 ?auto_94643 ) ) ( not ( = ?auto_94642 ?auto_94643 ) ) ( ON ?auto_94641 ?auto_94642 ) ( ON ?auto_94640 ?auto_94641 ) ( ON ?auto_94639 ?auto_94640 ) ( ON ?auto_94638 ?auto_94639 ) ( ON ?auto_94637 ?auto_94638 ) ( ON ?auto_94636 ?auto_94637 ) ( CLEAR ?auto_94634 ) ( ON ?auto_94635 ?auto_94636 ) ( CLEAR ?auto_94635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94634 ?auto_94635 )
      ( MAKE-9PILE ?auto_94634 ?auto_94635 ?auto_94636 ?auto_94637 ?auto_94638 ?auto_94639 ?auto_94640 ?auto_94641 ?auto_94642 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94653 - BLOCK
      ?auto_94654 - BLOCK
      ?auto_94655 - BLOCK
      ?auto_94656 - BLOCK
      ?auto_94657 - BLOCK
      ?auto_94658 - BLOCK
      ?auto_94659 - BLOCK
      ?auto_94660 - BLOCK
      ?auto_94661 - BLOCK
    )
    :vars
    (
      ?auto_94662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94661 ?auto_94662 ) ( not ( = ?auto_94653 ?auto_94654 ) ) ( not ( = ?auto_94653 ?auto_94655 ) ) ( not ( = ?auto_94653 ?auto_94656 ) ) ( not ( = ?auto_94653 ?auto_94657 ) ) ( not ( = ?auto_94653 ?auto_94658 ) ) ( not ( = ?auto_94653 ?auto_94659 ) ) ( not ( = ?auto_94653 ?auto_94660 ) ) ( not ( = ?auto_94653 ?auto_94661 ) ) ( not ( = ?auto_94653 ?auto_94662 ) ) ( not ( = ?auto_94654 ?auto_94655 ) ) ( not ( = ?auto_94654 ?auto_94656 ) ) ( not ( = ?auto_94654 ?auto_94657 ) ) ( not ( = ?auto_94654 ?auto_94658 ) ) ( not ( = ?auto_94654 ?auto_94659 ) ) ( not ( = ?auto_94654 ?auto_94660 ) ) ( not ( = ?auto_94654 ?auto_94661 ) ) ( not ( = ?auto_94654 ?auto_94662 ) ) ( not ( = ?auto_94655 ?auto_94656 ) ) ( not ( = ?auto_94655 ?auto_94657 ) ) ( not ( = ?auto_94655 ?auto_94658 ) ) ( not ( = ?auto_94655 ?auto_94659 ) ) ( not ( = ?auto_94655 ?auto_94660 ) ) ( not ( = ?auto_94655 ?auto_94661 ) ) ( not ( = ?auto_94655 ?auto_94662 ) ) ( not ( = ?auto_94656 ?auto_94657 ) ) ( not ( = ?auto_94656 ?auto_94658 ) ) ( not ( = ?auto_94656 ?auto_94659 ) ) ( not ( = ?auto_94656 ?auto_94660 ) ) ( not ( = ?auto_94656 ?auto_94661 ) ) ( not ( = ?auto_94656 ?auto_94662 ) ) ( not ( = ?auto_94657 ?auto_94658 ) ) ( not ( = ?auto_94657 ?auto_94659 ) ) ( not ( = ?auto_94657 ?auto_94660 ) ) ( not ( = ?auto_94657 ?auto_94661 ) ) ( not ( = ?auto_94657 ?auto_94662 ) ) ( not ( = ?auto_94658 ?auto_94659 ) ) ( not ( = ?auto_94658 ?auto_94660 ) ) ( not ( = ?auto_94658 ?auto_94661 ) ) ( not ( = ?auto_94658 ?auto_94662 ) ) ( not ( = ?auto_94659 ?auto_94660 ) ) ( not ( = ?auto_94659 ?auto_94661 ) ) ( not ( = ?auto_94659 ?auto_94662 ) ) ( not ( = ?auto_94660 ?auto_94661 ) ) ( not ( = ?auto_94660 ?auto_94662 ) ) ( not ( = ?auto_94661 ?auto_94662 ) ) ( ON ?auto_94660 ?auto_94661 ) ( ON ?auto_94659 ?auto_94660 ) ( ON ?auto_94658 ?auto_94659 ) ( ON ?auto_94657 ?auto_94658 ) ( ON ?auto_94656 ?auto_94657 ) ( ON ?auto_94655 ?auto_94656 ) ( ON ?auto_94654 ?auto_94655 ) ( ON ?auto_94653 ?auto_94654 ) ( CLEAR ?auto_94653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94653 )
      ( MAKE-9PILE ?auto_94653 ?auto_94654 ?auto_94655 ?auto_94656 ?auto_94657 ?auto_94658 ?auto_94659 ?auto_94660 ?auto_94661 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_94672 - BLOCK
      ?auto_94673 - BLOCK
      ?auto_94674 - BLOCK
      ?auto_94675 - BLOCK
      ?auto_94676 - BLOCK
      ?auto_94677 - BLOCK
      ?auto_94678 - BLOCK
      ?auto_94679 - BLOCK
      ?auto_94680 - BLOCK
    )
    :vars
    (
      ?auto_94681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94680 ?auto_94681 ) ( not ( = ?auto_94672 ?auto_94673 ) ) ( not ( = ?auto_94672 ?auto_94674 ) ) ( not ( = ?auto_94672 ?auto_94675 ) ) ( not ( = ?auto_94672 ?auto_94676 ) ) ( not ( = ?auto_94672 ?auto_94677 ) ) ( not ( = ?auto_94672 ?auto_94678 ) ) ( not ( = ?auto_94672 ?auto_94679 ) ) ( not ( = ?auto_94672 ?auto_94680 ) ) ( not ( = ?auto_94672 ?auto_94681 ) ) ( not ( = ?auto_94673 ?auto_94674 ) ) ( not ( = ?auto_94673 ?auto_94675 ) ) ( not ( = ?auto_94673 ?auto_94676 ) ) ( not ( = ?auto_94673 ?auto_94677 ) ) ( not ( = ?auto_94673 ?auto_94678 ) ) ( not ( = ?auto_94673 ?auto_94679 ) ) ( not ( = ?auto_94673 ?auto_94680 ) ) ( not ( = ?auto_94673 ?auto_94681 ) ) ( not ( = ?auto_94674 ?auto_94675 ) ) ( not ( = ?auto_94674 ?auto_94676 ) ) ( not ( = ?auto_94674 ?auto_94677 ) ) ( not ( = ?auto_94674 ?auto_94678 ) ) ( not ( = ?auto_94674 ?auto_94679 ) ) ( not ( = ?auto_94674 ?auto_94680 ) ) ( not ( = ?auto_94674 ?auto_94681 ) ) ( not ( = ?auto_94675 ?auto_94676 ) ) ( not ( = ?auto_94675 ?auto_94677 ) ) ( not ( = ?auto_94675 ?auto_94678 ) ) ( not ( = ?auto_94675 ?auto_94679 ) ) ( not ( = ?auto_94675 ?auto_94680 ) ) ( not ( = ?auto_94675 ?auto_94681 ) ) ( not ( = ?auto_94676 ?auto_94677 ) ) ( not ( = ?auto_94676 ?auto_94678 ) ) ( not ( = ?auto_94676 ?auto_94679 ) ) ( not ( = ?auto_94676 ?auto_94680 ) ) ( not ( = ?auto_94676 ?auto_94681 ) ) ( not ( = ?auto_94677 ?auto_94678 ) ) ( not ( = ?auto_94677 ?auto_94679 ) ) ( not ( = ?auto_94677 ?auto_94680 ) ) ( not ( = ?auto_94677 ?auto_94681 ) ) ( not ( = ?auto_94678 ?auto_94679 ) ) ( not ( = ?auto_94678 ?auto_94680 ) ) ( not ( = ?auto_94678 ?auto_94681 ) ) ( not ( = ?auto_94679 ?auto_94680 ) ) ( not ( = ?auto_94679 ?auto_94681 ) ) ( not ( = ?auto_94680 ?auto_94681 ) ) ( ON ?auto_94679 ?auto_94680 ) ( ON ?auto_94678 ?auto_94679 ) ( ON ?auto_94677 ?auto_94678 ) ( ON ?auto_94676 ?auto_94677 ) ( ON ?auto_94675 ?auto_94676 ) ( ON ?auto_94674 ?auto_94675 ) ( ON ?auto_94673 ?auto_94674 ) ( ON ?auto_94672 ?auto_94673 ) ( CLEAR ?auto_94672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94672 )
      ( MAKE-9PILE ?auto_94672 ?auto_94673 ?auto_94674 ?auto_94675 ?auto_94676 ?auto_94677 ?auto_94678 ?auto_94679 ?auto_94680 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94692 - BLOCK
      ?auto_94693 - BLOCK
      ?auto_94694 - BLOCK
      ?auto_94695 - BLOCK
      ?auto_94696 - BLOCK
      ?auto_94697 - BLOCK
      ?auto_94698 - BLOCK
      ?auto_94699 - BLOCK
      ?auto_94700 - BLOCK
      ?auto_94701 - BLOCK
    )
    :vars
    (
      ?auto_94702 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94700 ) ( ON ?auto_94701 ?auto_94702 ) ( CLEAR ?auto_94701 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94692 ) ( ON ?auto_94693 ?auto_94692 ) ( ON ?auto_94694 ?auto_94693 ) ( ON ?auto_94695 ?auto_94694 ) ( ON ?auto_94696 ?auto_94695 ) ( ON ?auto_94697 ?auto_94696 ) ( ON ?auto_94698 ?auto_94697 ) ( ON ?auto_94699 ?auto_94698 ) ( ON ?auto_94700 ?auto_94699 ) ( not ( = ?auto_94692 ?auto_94693 ) ) ( not ( = ?auto_94692 ?auto_94694 ) ) ( not ( = ?auto_94692 ?auto_94695 ) ) ( not ( = ?auto_94692 ?auto_94696 ) ) ( not ( = ?auto_94692 ?auto_94697 ) ) ( not ( = ?auto_94692 ?auto_94698 ) ) ( not ( = ?auto_94692 ?auto_94699 ) ) ( not ( = ?auto_94692 ?auto_94700 ) ) ( not ( = ?auto_94692 ?auto_94701 ) ) ( not ( = ?auto_94692 ?auto_94702 ) ) ( not ( = ?auto_94693 ?auto_94694 ) ) ( not ( = ?auto_94693 ?auto_94695 ) ) ( not ( = ?auto_94693 ?auto_94696 ) ) ( not ( = ?auto_94693 ?auto_94697 ) ) ( not ( = ?auto_94693 ?auto_94698 ) ) ( not ( = ?auto_94693 ?auto_94699 ) ) ( not ( = ?auto_94693 ?auto_94700 ) ) ( not ( = ?auto_94693 ?auto_94701 ) ) ( not ( = ?auto_94693 ?auto_94702 ) ) ( not ( = ?auto_94694 ?auto_94695 ) ) ( not ( = ?auto_94694 ?auto_94696 ) ) ( not ( = ?auto_94694 ?auto_94697 ) ) ( not ( = ?auto_94694 ?auto_94698 ) ) ( not ( = ?auto_94694 ?auto_94699 ) ) ( not ( = ?auto_94694 ?auto_94700 ) ) ( not ( = ?auto_94694 ?auto_94701 ) ) ( not ( = ?auto_94694 ?auto_94702 ) ) ( not ( = ?auto_94695 ?auto_94696 ) ) ( not ( = ?auto_94695 ?auto_94697 ) ) ( not ( = ?auto_94695 ?auto_94698 ) ) ( not ( = ?auto_94695 ?auto_94699 ) ) ( not ( = ?auto_94695 ?auto_94700 ) ) ( not ( = ?auto_94695 ?auto_94701 ) ) ( not ( = ?auto_94695 ?auto_94702 ) ) ( not ( = ?auto_94696 ?auto_94697 ) ) ( not ( = ?auto_94696 ?auto_94698 ) ) ( not ( = ?auto_94696 ?auto_94699 ) ) ( not ( = ?auto_94696 ?auto_94700 ) ) ( not ( = ?auto_94696 ?auto_94701 ) ) ( not ( = ?auto_94696 ?auto_94702 ) ) ( not ( = ?auto_94697 ?auto_94698 ) ) ( not ( = ?auto_94697 ?auto_94699 ) ) ( not ( = ?auto_94697 ?auto_94700 ) ) ( not ( = ?auto_94697 ?auto_94701 ) ) ( not ( = ?auto_94697 ?auto_94702 ) ) ( not ( = ?auto_94698 ?auto_94699 ) ) ( not ( = ?auto_94698 ?auto_94700 ) ) ( not ( = ?auto_94698 ?auto_94701 ) ) ( not ( = ?auto_94698 ?auto_94702 ) ) ( not ( = ?auto_94699 ?auto_94700 ) ) ( not ( = ?auto_94699 ?auto_94701 ) ) ( not ( = ?auto_94699 ?auto_94702 ) ) ( not ( = ?auto_94700 ?auto_94701 ) ) ( not ( = ?auto_94700 ?auto_94702 ) ) ( not ( = ?auto_94701 ?auto_94702 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94701 ?auto_94702 )
      ( !STACK ?auto_94701 ?auto_94700 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94713 - BLOCK
      ?auto_94714 - BLOCK
      ?auto_94715 - BLOCK
      ?auto_94716 - BLOCK
      ?auto_94717 - BLOCK
      ?auto_94718 - BLOCK
      ?auto_94719 - BLOCK
      ?auto_94720 - BLOCK
      ?auto_94721 - BLOCK
      ?auto_94722 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_94721 ) ( ON-TABLE ?auto_94722 ) ( CLEAR ?auto_94722 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94713 ) ( ON ?auto_94714 ?auto_94713 ) ( ON ?auto_94715 ?auto_94714 ) ( ON ?auto_94716 ?auto_94715 ) ( ON ?auto_94717 ?auto_94716 ) ( ON ?auto_94718 ?auto_94717 ) ( ON ?auto_94719 ?auto_94718 ) ( ON ?auto_94720 ?auto_94719 ) ( ON ?auto_94721 ?auto_94720 ) ( not ( = ?auto_94713 ?auto_94714 ) ) ( not ( = ?auto_94713 ?auto_94715 ) ) ( not ( = ?auto_94713 ?auto_94716 ) ) ( not ( = ?auto_94713 ?auto_94717 ) ) ( not ( = ?auto_94713 ?auto_94718 ) ) ( not ( = ?auto_94713 ?auto_94719 ) ) ( not ( = ?auto_94713 ?auto_94720 ) ) ( not ( = ?auto_94713 ?auto_94721 ) ) ( not ( = ?auto_94713 ?auto_94722 ) ) ( not ( = ?auto_94714 ?auto_94715 ) ) ( not ( = ?auto_94714 ?auto_94716 ) ) ( not ( = ?auto_94714 ?auto_94717 ) ) ( not ( = ?auto_94714 ?auto_94718 ) ) ( not ( = ?auto_94714 ?auto_94719 ) ) ( not ( = ?auto_94714 ?auto_94720 ) ) ( not ( = ?auto_94714 ?auto_94721 ) ) ( not ( = ?auto_94714 ?auto_94722 ) ) ( not ( = ?auto_94715 ?auto_94716 ) ) ( not ( = ?auto_94715 ?auto_94717 ) ) ( not ( = ?auto_94715 ?auto_94718 ) ) ( not ( = ?auto_94715 ?auto_94719 ) ) ( not ( = ?auto_94715 ?auto_94720 ) ) ( not ( = ?auto_94715 ?auto_94721 ) ) ( not ( = ?auto_94715 ?auto_94722 ) ) ( not ( = ?auto_94716 ?auto_94717 ) ) ( not ( = ?auto_94716 ?auto_94718 ) ) ( not ( = ?auto_94716 ?auto_94719 ) ) ( not ( = ?auto_94716 ?auto_94720 ) ) ( not ( = ?auto_94716 ?auto_94721 ) ) ( not ( = ?auto_94716 ?auto_94722 ) ) ( not ( = ?auto_94717 ?auto_94718 ) ) ( not ( = ?auto_94717 ?auto_94719 ) ) ( not ( = ?auto_94717 ?auto_94720 ) ) ( not ( = ?auto_94717 ?auto_94721 ) ) ( not ( = ?auto_94717 ?auto_94722 ) ) ( not ( = ?auto_94718 ?auto_94719 ) ) ( not ( = ?auto_94718 ?auto_94720 ) ) ( not ( = ?auto_94718 ?auto_94721 ) ) ( not ( = ?auto_94718 ?auto_94722 ) ) ( not ( = ?auto_94719 ?auto_94720 ) ) ( not ( = ?auto_94719 ?auto_94721 ) ) ( not ( = ?auto_94719 ?auto_94722 ) ) ( not ( = ?auto_94720 ?auto_94721 ) ) ( not ( = ?auto_94720 ?auto_94722 ) ) ( not ( = ?auto_94721 ?auto_94722 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_94722 )
      ( !STACK ?auto_94722 ?auto_94721 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94733 - BLOCK
      ?auto_94734 - BLOCK
      ?auto_94735 - BLOCK
      ?auto_94736 - BLOCK
      ?auto_94737 - BLOCK
      ?auto_94738 - BLOCK
      ?auto_94739 - BLOCK
      ?auto_94740 - BLOCK
      ?auto_94741 - BLOCK
      ?auto_94742 - BLOCK
    )
    :vars
    (
      ?auto_94743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94742 ?auto_94743 ) ( ON-TABLE ?auto_94733 ) ( ON ?auto_94734 ?auto_94733 ) ( ON ?auto_94735 ?auto_94734 ) ( ON ?auto_94736 ?auto_94735 ) ( ON ?auto_94737 ?auto_94736 ) ( ON ?auto_94738 ?auto_94737 ) ( ON ?auto_94739 ?auto_94738 ) ( ON ?auto_94740 ?auto_94739 ) ( not ( = ?auto_94733 ?auto_94734 ) ) ( not ( = ?auto_94733 ?auto_94735 ) ) ( not ( = ?auto_94733 ?auto_94736 ) ) ( not ( = ?auto_94733 ?auto_94737 ) ) ( not ( = ?auto_94733 ?auto_94738 ) ) ( not ( = ?auto_94733 ?auto_94739 ) ) ( not ( = ?auto_94733 ?auto_94740 ) ) ( not ( = ?auto_94733 ?auto_94741 ) ) ( not ( = ?auto_94733 ?auto_94742 ) ) ( not ( = ?auto_94733 ?auto_94743 ) ) ( not ( = ?auto_94734 ?auto_94735 ) ) ( not ( = ?auto_94734 ?auto_94736 ) ) ( not ( = ?auto_94734 ?auto_94737 ) ) ( not ( = ?auto_94734 ?auto_94738 ) ) ( not ( = ?auto_94734 ?auto_94739 ) ) ( not ( = ?auto_94734 ?auto_94740 ) ) ( not ( = ?auto_94734 ?auto_94741 ) ) ( not ( = ?auto_94734 ?auto_94742 ) ) ( not ( = ?auto_94734 ?auto_94743 ) ) ( not ( = ?auto_94735 ?auto_94736 ) ) ( not ( = ?auto_94735 ?auto_94737 ) ) ( not ( = ?auto_94735 ?auto_94738 ) ) ( not ( = ?auto_94735 ?auto_94739 ) ) ( not ( = ?auto_94735 ?auto_94740 ) ) ( not ( = ?auto_94735 ?auto_94741 ) ) ( not ( = ?auto_94735 ?auto_94742 ) ) ( not ( = ?auto_94735 ?auto_94743 ) ) ( not ( = ?auto_94736 ?auto_94737 ) ) ( not ( = ?auto_94736 ?auto_94738 ) ) ( not ( = ?auto_94736 ?auto_94739 ) ) ( not ( = ?auto_94736 ?auto_94740 ) ) ( not ( = ?auto_94736 ?auto_94741 ) ) ( not ( = ?auto_94736 ?auto_94742 ) ) ( not ( = ?auto_94736 ?auto_94743 ) ) ( not ( = ?auto_94737 ?auto_94738 ) ) ( not ( = ?auto_94737 ?auto_94739 ) ) ( not ( = ?auto_94737 ?auto_94740 ) ) ( not ( = ?auto_94737 ?auto_94741 ) ) ( not ( = ?auto_94737 ?auto_94742 ) ) ( not ( = ?auto_94737 ?auto_94743 ) ) ( not ( = ?auto_94738 ?auto_94739 ) ) ( not ( = ?auto_94738 ?auto_94740 ) ) ( not ( = ?auto_94738 ?auto_94741 ) ) ( not ( = ?auto_94738 ?auto_94742 ) ) ( not ( = ?auto_94738 ?auto_94743 ) ) ( not ( = ?auto_94739 ?auto_94740 ) ) ( not ( = ?auto_94739 ?auto_94741 ) ) ( not ( = ?auto_94739 ?auto_94742 ) ) ( not ( = ?auto_94739 ?auto_94743 ) ) ( not ( = ?auto_94740 ?auto_94741 ) ) ( not ( = ?auto_94740 ?auto_94742 ) ) ( not ( = ?auto_94740 ?auto_94743 ) ) ( not ( = ?auto_94741 ?auto_94742 ) ) ( not ( = ?auto_94741 ?auto_94743 ) ) ( not ( = ?auto_94742 ?auto_94743 ) ) ( CLEAR ?auto_94740 ) ( ON ?auto_94741 ?auto_94742 ) ( CLEAR ?auto_94741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_94733 ?auto_94734 ?auto_94735 ?auto_94736 ?auto_94737 ?auto_94738 ?auto_94739 ?auto_94740 ?auto_94741 )
      ( MAKE-10PILE ?auto_94733 ?auto_94734 ?auto_94735 ?auto_94736 ?auto_94737 ?auto_94738 ?auto_94739 ?auto_94740 ?auto_94741 ?auto_94742 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94754 - BLOCK
      ?auto_94755 - BLOCK
      ?auto_94756 - BLOCK
      ?auto_94757 - BLOCK
      ?auto_94758 - BLOCK
      ?auto_94759 - BLOCK
      ?auto_94760 - BLOCK
      ?auto_94761 - BLOCK
      ?auto_94762 - BLOCK
      ?auto_94763 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94763 ) ( ON-TABLE ?auto_94754 ) ( ON ?auto_94755 ?auto_94754 ) ( ON ?auto_94756 ?auto_94755 ) ( ON ?auto_94757 ?auto_94756 ) ( ON ?auto_94758 ?auto_94757 ) ( ON ?auto_94759 ?auto_94758 ) ( ON ?auto_94760 ?auto_94759 ) ( ON ?auto_94761 ?auto_94760 ) ( not ( = ?auto_94754 ?auto_94755 ) ) ( not ( = ?auto_94754 ?auto_94756 ) ) ( not ( = ?auto_94754 ?auto_94757 ) ) ( not ( = ?auto_94754 ?auto_94758 ) ) ( not ( = ?auto_94754 ?auto_94759 ) ) ( not ( = ?auto_94754 ?auto_94760 ) ) ( not ( = ?auto_94754 ?auto_94761 ) ) ( not ( = ?auto_94754 ?auto_94762 ) ) ( not ( = ?auto_94754 ?auto_94763 ) ) ( not ( = ?auto_94755 ?auto_94756 ) ) ( not ( = ?auto_94755 ?auto_94757 ) ) ( not ( = ?auto_94755 ?auto_94758 ) ) ( not ( = ?auto_94755 ?auto_94759 ) ) ( not ( = ?auto_94755 ?auto_94760 ) ) ( not ( = ?auto_94755 ?auto_94761 ) ) ( not ( = ?auto_94755 ?auto_94762 ) ) ( not ( = ?auto_94755 ?auto_94763 ) ) ( not ( = ?auto_94756 ?auto_94757 ) ) ( not ( = ?auto_94756 ?auto_94758 ) ) ( not ( = ?auto_94756 ?auto_94759 ) ) ( not ( = ?auto_94756 ?auto_94760 ) ) ( not ( = ?auto_94756 ?auto_94761 ) ) ( not ( = ?auto_94756 ?auto_94762 ) ) ( not ( = ?auto_94756 ?auto_94763 ) ) ( not ( = ?auto_94757 ?auto_94758 ) ) ( not ( = ?auto_94757 ?auto_94759 ) ) ( not ( = ?auto_94757 ?auto_94760 ) ) ( not ( = ?auto_94757 ?auto_94761 ) ) ( not ( = ?auto_94757 ?auto_94762 ) ) ( not ( = ?auto_94757 ?auto_94763 ) ) ( not ( = ?auto_94758 ?auto_94759 ) ) ( not ( = ?auto_94758 ?auto_94760 ) ) ( not ( = ?auto_94758 ?auto_94761 ) ) ( not ( = ?auto_94758 ?auto_94762 ) ) ( not ( = ?auto_94758 ?auto_94763 ) ) ( not ( = ?auto_94759 ?auto_94760 ) ) ( not ( = ?auto_94759 ?auto_94761 ) ) ( not ( = ?auto_94759 ?auto_94762 ) ) ( not ( = ?auto_94759 ?auto_94763 ) ) ( not ( = ?auto_94760 ?auto_94761 ) ) ( not ( = ?auto_94760 ?auto_94762 ) ) ( not ( = ?auto_94760 ?auto_94763 ) ) ( not ( = ?auto_94761 ?auto_94762 ) ) ( not ( = ?auto_94761 ?auto_94763 ) ) ( not ( = ?auto_94762 ?auto_94763 ) ) ( CLEAR ?auto_94761 ) ( ON ?auto_94762 ?auto_94763 ) ( CLEAR ?auto_94762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_94754 ?auto_94755 ?auto_94756 ?auto_94757 ?auto_94758 ?auto_94759 ?auto_94760 ?auto_94761 ?auto_94762 )
      ( MAKE-10PILE ?auto_94754 ?auto_94755 ?auto_94756 ?auto_94757 ?auto_94758 ?auto_94759 ?auto_94760 ?auto_94761 ?auto_94762 ?auto_94763 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94774 - BLOCK
      ?auto_94775 - BLOCK
      ?auto_94776 - BLOCK
      ?auto_94777 - BLOCK
      ?auto_94778 - BLOCK
      ?auto_94779 - BLOCK
      ?auto_94780 - BLOCK
      ?auto_94781 - BLOCK
      ?auto_94782 - BLOCK
      ?auto_94783 - BLOCK
    )
    :vars
    (
      ?auto_94784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94783 ?auto_94784 ) ( ON-TABLE ?auto_94774 ) ( ON ?auto_94775 ?auto_94774 ) ( ON ?auto_94776 ?auto_94775 ) ( ON ?auto_94777 ?auto_94776 ) ( ON ?auto_94778 ?auto_94777 ) ( ON ?auto_94779 ?auto_94778 ) ( ON ?auto_94780 ?auto_94779 ) ( not ( = ?auto_94774 ?auto_94775 ) ) ( not ( = ?auto_94774 ?auto_94776 ) ) ( not ( = ?auto_94774 ?auto_94777 ) ) ( not ( = ?auto_94774 ?auto_94778 ) ) ( not ( = ?auto_94774 ?auto_94779 ) ) ( not ( = ?auto_94774 ?auto_94780 ) ) ( not ( = ?auto_94774 ?auto_94781 ) ) ( not ( = ?auto_94774 ?auto_94782 ) ) ( not ( = ?auto_94774 ?auto_94783 ) ) ( not ( = ?auto_94774 ?auto_94784 ) ) ( not ( = ?auto_94775 ?auto_94776 ) ) ( not ( = ?auto_94775 ?auto_94777 ) ) ( not ( = ?auto_94775 ?auto_94778 ) ) ( not ( = ?auto_94775 ?auto_94779 ) ) ( not ( = ?auto_94775 ?auto_94780 ) ) ( not ( = ?auto_94775 ?auto_94781 ) ) ( not ( = ?auto_94775 ?auto_94782 ) ) ( not ( = ?auto_94775 ?auto_94783 ) ) ( not ( = ?auto_94775 ?auto_94784 ) ) ( not ( = ?auto_94776 ?auto_94777 ) ) ( not ( = ?auto_94776 ?auto_94778 ) ) ( not ( = ?auto_94776 ?auto_94779 ) ) ( not ( = ?auto_94776 ?auto_94780 ) ) ( not ( = ?auto_94776 ?auto_94781 ) ) ( not ( = ?auto_94776 ?auto_94782 ) ) ( not ( = ?auto_94776 ?auto_94783 ) ) ( not ( = ?auto_94776 ?auto_94784 ) ) ( not ( = ?auto_94777 ?auto_94778 ) ) ( not ( = ?auto_94777 ?auto_94779 ) ) ( not ( = ?auto_94777 ?auto_94780 ) ) ( not ( = ?auto_94777 ?auto_94781 ) ) ( not ( = ?auto_94777 ?auto_94782 ) ) ( not ( = ?auto_94777 ?auto_94783 ) ) ( not ( = ?auto_94777 ?auto_94784 ) ) ( not ( = ?auto_94778 ?auto_94779 ) ) ( not ( = ?auto_94778 ?auto_94780 ) ) ( not ( = ?auto_94778 ?auto_94781 ) ) ( not ( = ?auto_94778 ?auto_94782 ) ) ( not ( = ?auto_94778 ?auto_94783 ) ) ( not ( = ?auto_94778 ?auto_94784 ) ) ( not ( = ?auto_94779 ?auto_94780 ) ) ( not ( = ?auto_94779 ?auto_94781 ) ) ( not ( = ?auto_94779 ?auto_94782 ) ) ( not ( = ?auto_94779 ?auto_94783 ) ) ( not ( = ?auto_94779 ?auto_94784 ) ) ( not ( = ?auto_94780 ?auto_94781 ) ) ( not ( = ?auto_94780 ?auto_94782 ) ) ( not ( = ?auto_94780 ?auto_94783 ) ) ( not ( = ?auto_94780 ?auto_94784 ) ) ( not ( = ?auto_94781 ?auto_94782 ) ) ( not ( = ?auto_94781 ?auto_94783 ) ) ( not ( = ?auto_94781 ?auto_94784 ) ) ( not ( = ?auto_94782 ?auto_94783 ) ) ( not ( = ?auto_94782 ?auto_94784 ) ) ( not ( = ?auto_94783 ?auto_94784 ) ) ( ON ?auto_94782 ?auto_94783 ) ( CLEAR ?auto_94780 ) ( ON ?auto_94781 ?auto_94782 ) ( CLEAR ?auto_94781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_94774 ?auto_94775 ?auto_94776 ?auto_94777 ?auto_94778 ?auto_94779 ?auto_94780 ?auto_94781 )
      ( MAKE-10PILE ?auto_94774 ?auto_94775 ?auto_94776 ?auto_94777 ?auto_94778 ?auto_94779 ?auto_94780 ?auto_94781 ?auto_94782 ?auto_94783 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94795 - BLOCK
      ?auto_94796 - BLOCK
      ?auto_94797 - BLOCK
      ?auto_94798 - BLOCK
      ?auto_94799 - BLOCK
      ?auto_94800 - BLOCK
      ?auto_94801 - BLOCK
      ?auto_94802 - BLOCK
      ?auto_94803 - BLOCK
      ?auto_94804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94804 ) ( ON-TABLE ?auto_94795 ) ( ON ?auto_94796 ?auto_94795 ) ( ON ?auto_94797 ?auto_94796 ) ( ON ?auto_94798 ?auto_94797 ) ( ON ?auto_94799 ?auto_94798 ) ( ON ?auto_94800 ?auto_94799 ) ( ON ?auto_94801 ?auto_94800 ) ( not ( = ?auto_94795 ?auto_94796 ) ) ( not ( = ?auto_94795 ?auto_94797 ) ) ( not ( = ?auto_94795 ?auto_94798 ) ) ( not ( = ?auto_94795 ?auto_94799 ) ) ( not ( = ?auto_94795 ?auto_94800 ) ) ( not ( = ?auto_94795 ?auto_94801 ) ) ( not ( = ?auto_94795 ?auto_94802 ) ) ( not ( = ?auto_94795 ?auto_94803 ) ) ( not ( = ?auto_94795 ?auto_94804 ) ) ( not ( = ?auto_94796 ?auto_94797 ) ) ( not ( = ?auto_94796 ?auto_94798 ) ) ( not ( = ?auto_94796 ?auto_94799 ) ) ( not ( = ?auto_94796 ?auto_94800 ) ) ( not ( = ?auto_94796 ?auto_94801 ) ) ( not ( = ?auto_94796 ?auto_94802 ) ) ( not ( = ?auto_94796 ?auto_94803 ) ) ( not ( = ?auto_94796 ?auto_94804 ) ) ( not ( = ?auto_94797 ?auto_94798 ) ) ( not ( = ?auto_94797 ?auto_94799 ) ) ( not ( = ?auto_94797 ?auto_94800 ) ) ( not ( = ?auto_94797 ?auto_94801 ) ) ( not ( = ?auto_94797 ?auto_94802 ) ) ( not ( = ?auto_94797 ?auto_94803 ) ) ( not ( = ?auto_94797 ?auto_94804 ) ) ( not ( = ?auto_94798 ?auto_94799 ) ) ( not ( = ?auto_94798 ?auto_94800 ) ) ( not ( = ?auto_94798 ?auto_94801 ) ) ( not ( = ?auto_94798 ?auto_94802 ) ) ( not ( = ?auto_94798 ?auto_94803 ) ) ( not ( = ?auto_94798 ?auto_94804 ) ) ( not ( = ?auto_94799 ?auto_94800 ) ) ( not ( = ?auto_94799 ?auto_94801 ) ) ( not ( = ?auto_94799 ?auto_94802 ) ) ( not ( = ?auto_94799 ?auto_94803 ) ) ( not ( = ?auto_94799 ?auto_94804 ) ) ( not ( = ?auto_94800 ?auto_94801 ) ) ( not ( = ?auto_94800 ?auto_94802 ) ) ( not ( = ?auto_94800 ?auto_94803 ) ) ( not ( = ?auto_94800 ?auto_94804 ) ) ( not ( = ?auto_94801 ?auto_94802 ) ) ( not ( = ?auto_94801 ?auto_94803 ) ) ( not ( = ?auto_94801 ?auto_94804 ) ) ( not ( = ?auto_94802 ?auto_94803 ) ) ( not ( = ?auto_94802 ?auto_94804 ) ) ( not ( = ?auto_94803 ?auto_94804 ) ) ( ON ?auto_94803 ?auto_94804 ) ( CLEAR ?auto_94801 ) ( ON ?auto_94802 ?auto_94803 ) ( CLEAR ?auto_94802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_94795 ?auto_94796 ?auto_94797 ?auto_94798 ?auto_94799 ?auto_94800 ?auto_94801 ?auto_94802 )
      ( MAKE-10PILE ?auto_94795 ?auto_94796 ?auto_94797 ?auto_94798 ?auto_94799 ?auto_94800 ?auto_94801 ?auto_94802 ?auto_94803 ?auto_94804 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94815 - BLOCK
      ?auto_94816 - BLOCK
      ?auto_94817 - BLOCK
      ?auto_94818 - BLOCK
      ?auto_94819 - BLOCK
      ?auto_94820 - BLOCK
      ?auto_94821 - BLOCK
      ?auto_94822 - BLOCK
      ?auto_94823 - BLOCK
      ?auto_94824 - BLOCK
    )
    :vars
    (
      ?auto_94825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94824 ?auto_94825 ) ( ON-TABLE ?auto_94815 ) ( ON ?auto_94816 ?auto_94815 ) ( ON ?auto_94817 ?auto_94816 ) ( ON ?auto_94818 ?auto_94817 ) ( ON ?auto_94819 ?auto_94818 ) ( ON ?auto_94820 ?auto_94819 ) ( not ( = ?auto_94815 ?auto_94816 ) ) ( not ( = ?auto_94815 ?auto_94817 ) ) ( not ( = ?auto_94815 ?auto_94818 ) ) ( not ( = ?auto_94815 ?auto_94819 ) ) ( not ( = ?auto_94815 ?auto_94820 ) ) ( not ( = ?auto_94815 ?auto_94821 ) ) ( not ( = ?auto_94815 ?auto_94822 ) ) ( not ( = ?auto_94815 ?auto_94823 ) ) ( not ( = ?auto_94815 ?auto_94824 ) ) ( not ( = ?auto_94815 ?auto_94825 ) ) ( not ( = ?auto_94816 ?auto_94817 ) ) ( not ( = ?auto_94816 ?auto_94818 ) ) ( not ( = ?auto_94816 ?auto_94819 ) ) ( not ( = ?auto_94816 ?auto_94820 ) ) ( not ( = ?auto_94816 ?auto_94821 ) ) ( not ( = ?auto_94816 ?auto_94822 ) ) ( not ( = ?auto_94816 ?auto_94823 ) ) ( not ( = ?auto_94816 ?auto_94824 ) ) ( not ( = ?auto_94816 ?auto_94825 ) ) ( not ( = ?auto_94817 ?auto_94818 ) ) ( not ( = ?auto_94817 ?auto_94819 ) ) ( not ( = ?auto_94817 ?auto_94820 ) ) ( not ( = ?auto_94817 ?auto_94821 ) ) ( not ( = ?auto_94817 ?auto_94822 ) ) ( not ( = ?auto_94817 ?auto_94823 ) ) ( not ( = ?auto_94817 ?auto_94824 ) ) ( not ( = ?auto_94817 ?auto_94825 ) ) ( not ( = ?auto_94818 ?auto_94819 ) ) ( not ( = ?auto_94818 ?auto_94820 ) ) ( not ( = ?auto_94818 ?auto_94821 ) ) ( not ( = ?auto_94818 ?auto_94822 ) ) ( not ( = ?auto_94818 ?auto_94823 ) ) ( not ( = ?auto_94818 ?auto_94824 ) ) ( not ( = ?auto_94818 ?auto_94825 ) ) ( not ( = ?auto_94819 ?auto_94820 ) ) ( not ( = ?auto_94819 ?auto_94821 ) ) ( not ( = ?auto_94819 ?auto_94822 ) ) ( not ( = ?auto_94819 ?auto_94823 ) ) ( not ( = ?auto_94819 ?auto_94824 ) ) ( not ( = ?auto_94819 ?auto_94825 ) ) ( not ( = ?auto_94820 ?auto_94821 ) ) ( not ( = ?auto_94820 ?auto_94822 ) ) ( not ( = ?auto_94820 ?auto_94823 ) ) ( not ( = ?auto_94820 ?auto_94824 ) ) ( not ( = ?auto_94820 ?auto_94825 ) ) ( not ( = ?auto_94821 ?auto_94822 ) ) ( not ( = ?auto_94821 ?auto_94823 ) ) ( not ( = ?auto_94821 ?auto_94824 ) ) ( not ( = ?auto_94821 ?auto_94825 ) ) ( not ( = ?auto_94822 ?auto_94823 ) ) ( not ( = ?auto_94822 ?auto_94824 ) ) ( not ( = ?auto_94822 ?auto_94825 ) ) ( not ( = ?auto_94823 ?auto_94824 ) ) ( not ( = ?auto_94823 ?auto_94825 ) ) ( not ( = ?auto_94824 ?auto_94825 ) ) ( ON ?auto_94823 ?auto_94824 ) ( ON ?auto_94822 ?auto_94823 ) ( CLEAR ?auto_94820 ) ( ON ?auto_94821 ?auto_94822 ) ( CLEAR ?auto_94821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94815 ?auto_94816 ?auto_94817 ?auto_94818 ?auto_94819 ?auto_94820 ?auto_94821 )
      ( MAKE-10PILE ?auto_94815 ?auto_94816 ?auto_94817 ?auto_94818 ?auto_94819 ?auto_94820 ?auto_94821 ?auto_94822 ?auto_94823 ?auto_94824 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94836 - BLOCK
      ?auto_94837 - BLOCK
      ?auto_94838 - BLOCK
      ?auto_94839 - BLOCK
      ?auto_94840 - BLOCK
      ?auto_94841 - BLOCK
      ?auto_94842 - BLOCK
      ?auto_94843 - BLOCK
      ?auto_94844 - BLOCK
      ?auto_94845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94845 ) ( ON-TABLE ?auto_94836 ) ( ON ?auto_94837 ?auto_94836 ) ( ON ?auto_94838 ?auto_94837 ) ( ON ?auto_94839 ?auto_94838 ) ( ON ?auto_94840 ?auto_94839 ) ( ON ?auto_94841 ?auto_94840 ) ( not ( = ?auto_94836 ?auto_94837 ) ) ( not ( = ?auto_94836 ?auto_94838 ) ) ( not ( = ?auto_94836 ?auto_94839 ) ) ( not ( = ?auto_94836 ?auto_94840 ) ) ( not ( = ?auto_94836 ?auto_94841 ) ) ( not ( = ?auto_94836 ?auto_94842 ) ) ( not ( = ?auto_94836 ?auto_94843 ) ) ( not ( = ?auto_94836 ?auto_94844 ) ) ( not ( = ?auto_94836 ?auto_94845 ) ) ( not ( = ?auto_94837 ?auto_94838 ) ) ( not ( = ?auto_94837 ?auto_94839 ) ) ( not ( = ?auto_94837 ?auto_94840 ) ) ( not ( = ?auto_94837 ?auto_94841 ) ) ( not ( = ?auto_94837 ?auto_94842 ) ) ( not ( = ?auto_94837 ?auto_94843 ) ) ( not ( = ?auto_94837 ?auto_94844 ) ) ( not ( = ?auto_94837 ?auto_94845 ) ) ( not ( = ?auto_94838 ?auto_94839 ) ) ( not ( = ?auto_94838 ?auto_94840 ) ) ( not ( = ?auto_94838 ?auto_94841 ) ) ( not ( = ?auto_94838 ?auto_94842 ) ) ( not ( = ?auto_94838 ?auto_94843 ) ) ( not ( = ?auto_94838 ?auto_94844 ) ) ( not ( = ?auto_94838 ?auto_94845 ) ) ( not ( = ?auto_94839 ?auto_94840 ) ) ( not ( = ?auto_94839 ?auto_94841 ) ) ( not ( = ?auto_94839 ?auto_94842 ) ) ( not ( = ?auto_94839 ?auto_94843 ) ) ( not ( = ?auto_94839 ?auto_94844 ) ) ( not ( = ?auto_94839 ?auto_94845 ) ) ( not ( = ?auto_94840 ?auto_94841 ) ) ( not ( = ?auto_94840 ?auto_94842 ) ) ( not ( = ?auto_94840 ?auto_94843 ) ) ( not ( = ?auto_94840 ?auto_94844 ) ) ( not ( = ?auto_94840 ?auto_94845 ) ) ( not ( = ?auto_94841 ?auto_94842 ) ) ( not ( = ?auto_94841 ?auto_94843 ) ) ( not ( = ?auto_94841 ?auto_94844 ) ) ( not ( = ?auto_94841 ?auto_94845 ) ) ( not ( = ?auto_94842 ?auto_94843 ) ) ( not ( = ?auto_94842 ?auto_94844 ) ) ( not ( = ?auto_94842 ?auto_94845 ) ) ( not ( = ?auto_94843 ?auto_94844 ) ) ( not ( = ?auto_94843 ?auto_94845 ) ) ( not ( = ?auto_94844 ?auto_94845 ) ) ( ON ?auto_94844 ?auto_94845 ) ( ON ?auto_94843 ?auto_94844 ) ( CLEAR ?auto_94841 ) ( ON ?auto_94842 ?auto_94843 ) ( CLEAR ?auto_94842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94836 ?auto_94837 ?auto_94838 ?auto_94839 ?auto_94840 ?auto_94841 ?auto_94842 )
      ( MAKE-10PILE ?auto_94836 ?auto_94837 ?auto_94838 ?auto_94839 ?auto_94840 ?auto_94841 ?auto_94842 ?auto_94843 ?auto_94844 ?auto_94845 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94856 - BLOCK
      ?auto_94857 - BLOCK
      ?auto_94858 - BLOCK
      ?auto_94859 - BLOCK
      ?auto_94860 - BLOCK
      ?auto_94861 - BLOCK
      ?auto_94862 - BLOCK
      ?auto_94863 - BLOCK
      ?auto_94864 - BLOCK
      ?auto_94865 - BLOCK
    )
    :vars
    (
      ?auto_94866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94865 ?auto_94866 ) ( ON-TABLE ?auto_94856 ) ( ON ?auto_94857 ?auto_94856 ) ( ON ?auto_94858 ?auto_94857 ) ( ON ?auto_94859 ?auto_94858 ) ( ON ?auto_94860 ?auto_94859 ) ( not ( = ?auto_94856 ?auto_94857 ) ) ( not ( = ?auto_94856 ?auto_94858 ) ) ( not ( = ?auto_94856 ?auto_94859 ) ) ( not ( = ?auto_94856 ?auto_94860 ) ) ( not ( = ?auto_94856 ?auto_94861 ) ) ( not ( = ?auto_94856 ?auto_94862 ) ) ( not ( = ?auto_94856 ?auto_94863 ) ) ( not ( = ?auto_94856 ?auto_94864 ) ) ( not ( = ?auto_94856 ?auto_94865 ) ) ( not ( = ?auto_94856 ?auto_94866 ) ) ( not ( = ?auto_94857 ?auto_94858 ) ) ( not ( = ?auto_94857 ?auto_94859 ) ) ( not ( = ?auto_94857 ?auto_94860 ) ) ( not ( = ?auto_94857 ?auto_94861 ) ) ( not ( = ?auto_94857 ?auto_94862 ) ) ( not ( = ?auto_94857 ?auto_94863 ) ) ( not ( = ?auto_94857 ?auto_94864 ) ) ( not ( = ?auto_94857 ?auto_94865 ) ) ( not ( = ?auto_94857 ?auto_94866 ) ) ( not ( = ?auto_94858 ?auto_94859 ) ) ( not ( = ?auto_94858 ?auto_94860 ) ) ( not ( = ?auto_94858 ?auto_94861 ) ) ( not ( = ?auto_94858 ?auto_94862 ) ) ( not ( = ?auto_94858 ?auto_94863 ) ) ( not ( = ?auto_94858 ?auto_94864 ) ) ( not ( = ?auto_94858 ?auto_94865 ) ) ( not ( = ?auto_94858 ?auto_94866 ) ) ( not ( = ?auto_94859 ?auto_94860 ) ) ( not ( = ?auto_94859 ?auto_94861 ) ) ( not ( = ?auto_94859 ?auto_94862 ) ) ( not ( = ?auto_94859 ?auto_94863 ) ) ( not ( = ?auto_94859 ?auto_94864 ) ) ( not ( = ?auto_94859 ?auto_94865 ) ) ( not ( = ?auto_94859 ?auto_94866 ) ) ( not ( = ?auto_94860 ?auto_94861 ) ) ( not ( = ?auto_94860 ?auto_94862 ) ) ( not ( = ?auto_94860 ?auto_94863 ) ) ( not ( = ?auto_94860 ?auto_94864 ) ) ( not ( = ?auto_94860 ?auto_94865 ) ) ( not ( = ?auto_94860 ?auto_94866 ) ) ( not ( = ?auto_94861 ?auto_94862 ) ) ( not ( = ?auto_94861 ?auto_94863 ) ) ( not ( = ?auto_94861 ?auto_94864 ) ) ( not ( = ?auto_94861 ?auto_94865 ) ) ( not ( = ?auto_94861 ?auto_94866 ) ) ( not ( = ?auto_94862 ?auto_94863 ) ) ( not ( = ?auto_94862 ?auto_94864 ) ) ( not ( = ?auto_94862 ?auto_94865 ) ) ( not ( = ?auto_94862 ?auto_94866 ) ) ( not ( = ?auto_94863 ?auto_94864 ) ) ( not ( = ?auto_94863 ?auto_94865 ) ) ( not ( = ?auto_94863 ?auto_94866 ) ) ( not ( = ?auto_94864 ?auto_94865 ) ) ( not ( = ?auto_94864 ?auto_94866 ) ) ( not ( = ?auto_94865 ?auto_94866 ) ) ( ON ?auto_94864 ?auto_94865 ) ( ON ?auto_94863 ?auto_94864 ) ( ON ?auto_94862 ?auto_94863 ) ( CLEAR ?auto_94860 ) ( ON ?auto_94861 ?auto_94862 ) ( CLEAR ?auto_94861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94856 ?auto_94857 ?auto_94858 ?auto_94859 ?auto_94860 ?auto_94861 )
      ( MAKE-10PILE ?auto_94856 ?auto_94857 ?auto_94858 ?auto_94859 ?auto_94860 ?auto_94861 ?auto_94862 ?auto_94863 ?auto_94864 ?auto_94865 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94877 - BLOCK
      ?auto_94878 - BLOCK
      ?auto_94879 - BLOCK
      ?auto_94880 - BLOCK
      ?auto_94881 - BLOCK
      ?auto_94882 - BLOCK
      ?auto_94883 - BLOCK
      ?auto_94884 - BLOCK
      ?auto_94885 - BLOCK
      ?auto_94886 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94886 ) ( ON-TABLE ?auto_94877 ) ( ON ?auto_94878 ?auto_94877 ) ( ON ?auto_94879 ?auto_94878 ) ( ON ?auto_94880 ?auto_94879 ) ( ON ?auto_94881 ?auto_94880 ) ( not ( = ?auto_94877 ?auto_94878 ) ) ( not ( = ?auto_94877 ?auto_94879 ) ) ( not ( = ?auto_94877 ?auto_94880 ) ) ( not ( = ?auto_94877 ?auto_94881 ) ) ( not ( = ?auto_94877 ?auto_94882 ) ) ( not ( = ?auto_94877 ?auto_94883 ) ) ( not ( = ?auto_94877 ?auto_94884 ) ) ( not ( = ?auto_94877 ?auto_94885 ) ) ( not ( = ?auto_94877 ?auto_94886 ) ) ( not ( = ?auto_94878 ?auto_94879 ) ) ( not ( = ?auto_94878 ?auto_94880 ) ) ( not ( = ?auto_94878 ?auto_94881 ) ) ( not ( = ?auto_94878 ?auto_94882 ) ) ( not ( = ?auto_94878 ?auto_94883 ) ) ( not ( = ?auto_94878 ?auto_94884 ) ) ( not ( = ?auto_94878 ?auto_94885 ) ) ( not ( = ?auto_94878 ?auto_94886 ) ) ( not ( = ?auto_94879 ?auto_94880 ) ) ( not ( = ?auto_94879 ?auto_94881 ) ) ( not ( = ?auto_94879 ?auto_94882 ) ) ( not ( = ?auto_94879 ?auto_94883 ) ) ( not ( = ?auto_94879 ?auto_94884 ) ) ( not ( = ?auto_94879 ?auto_94885 ) ) ( not ( = ?auto_94879 ?auto_94886 ) ) ( not ( = ?auto_94880 ?auto_94881 ) ) ( not ( = ?auto_94880 ?auto_94882 ) ) ( not ( = ?auto_94880 ?auto_94883 ) ) ( not ( = ?auto_94880 ?auto_94884 ) ) ( not ( = ?auto_94880 ?auto_94885 ) ) ( not ( = ?auto_94880 ?auto_94886 ) ) ( not ( = ?auto_94881 ?auto_94882 ) ) ( not ( = ?auto_94881 ?auto_94883 ) ) ( not ( = ?auto_94881 ?auto_94884 ) ) ( not ( = ?auto_94881 ?auto_94885 ) ) ( not ( = ?auto_94881 ?auto_94886 ) ) ( not ( = ?auto_94882 ?auto_94883 ) ) ( not ( = ?auto_94882 ?auto_94884 ) ) ( not ( = ?auto_94882 ?auto_94885 ) ) ( not ( = ?auto_94882 ?auto_94886 ) ) ( not ( = ?auto_94883 ?auto_94884 ) ) ( not ( = ?auto_94883 ?auto_94885 ) ) ( not ( = ?auto_94883 ?auto_94886 ) ) ( not ( = ?auto_94884 ?auto_94885 ) ) ( not ( = ?auto_94884 ?auto_94886 ) ) ( not ( = ?auto_94885 ?auto_94886 ) ) ( ON ?auto_94885 ?auto_94886 ) ( ON ?auto_94884 ?auto_94885 ) ( ON ?auto_94883 ?auto_94884 ) ( CLEAR ?auto_94881 ) ( ON ?auto_94882 ?auto_94883 ) ( CLEAR ?auto_94882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94877 ?auto_94878 ?auto_94879 ?auto_94880 ?auto_94881 ?auto_94882 )
      ( MAKE-10PILE ?auto_94877 ?auto_94878 ?auto_94879 ?auto_94880 ?auto_94881 ?auto_94882 ?auto_94883 ?auto_94884 ?auto_94885 ?auto_94886 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94897 - BLOCK
      ?auto_94898 - BLOCK
      ?auto_94899 - BLOCK
      ?auto_94900 - BLOCK
      ?auto_94901 - BLOCK
      ?auto_94902 - BLOCK
      ?auto_94903 - BLOCK
      ?auto_94904 - BLOCK
      ?auto_94905 - BLOCK
      ?auto_94906 - BLOCK
    )
    :vars
    (
      ?auto_94907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94906 ?auto_94907 ) ( ON-TABLE ?auto_94897 ) ( ON ?auto_94898 ?auto_94897 ) ( ON ?auto_94899 ?auto_94898 ) ( ON ?auto_94900 ?auto_94899 ) ( not ( = ?auto_94897 ?auto_94898 ) ) ( not ( = ?auto_94897 ?auto_94899 ) ) ( not ( = ?auto_94897 ?auto_94900 ) ) ( not ( = ?auto_94897 ?auto_94901 ) ) ( not ( = ?auto_94897 ?auto_94902 ) ) ( not ( = ?auto_94897 ?auto_94903 ) ) ( not ( = ?auto_94897 ?auto_94904 ) ) ( not ( = ?auto_94897 ?auto_94905 ) ) ( not ( = ?auto_94897 ?auto_94906 ) ) ( not ( = ?auto_94897 ?auto_94907 ) ) ( not ( = ?auto_94898 ?auto_94899 ) ) ( not ( = ?auto_94898 ?auto_94900 ) ) ( not ( = ?auto_94898 ?auto_94901 ) ) ( not ( = ?auto_94898 ?auto_94902 ) ) ( not ( = ?auto_94898 ?auto_94903 ) ) ( not ( = ?auto_94898 ?auto_94904 ) ) ( not ( = ?auto_94898 ?auto_94905 ) ) ( not ( = ?auto_94898 ?auto_94906 ) ) ( not ( = ?auto_94898 ?auto_94907 ) ) ( not ( = ?auto_94899 ?auto_94900 ) ) ( not ( = ?auto_94899 ?auto_94901 ) ) ( not ( = ?auto_94899 ?auto_94902 ) ) ( not ( = ?auto_94899 ?auto_94903 ) ) ( not ( = ?auto_94899 ?auto_94904 ) ) ( not ( = ?auto_94899 ?auto_94905 ) ) ( not ( = ?auto_94899 ?auto_94906 ) ) ( not ( = ?auto_94899 ?auto_94907 ) ) ( not ( = ?auto_94900 ?auto_94901 ) ) ( not ( = ?auto_94900 ?auto_94902 ) ) ( not ( = ?auto_94900 ?auto_94903 ) ) ( not ( = ?auto_94900 ?auto_94904 ) ) ( not ( = ?auto_94900 ?auto_94905 ) ) ( not ( = ?auto_94900 ?auto_94906 ) ) ( not ( = ?auto_94900 ?auto_94907 ) ) ( not ( = ?auto_94901 ?auto_94902 ) ) ( not ( = ?auto_94901 ?auto_94903 ) ) ( not ( = ?auto_94901 ?auto_94904 ) ) ( not ( = ?auto_94901 ?auto_94905 ) ) ( not ( = ?auto_94901 ?auto_94906 ) ) ( not ( = ?auto_94901 ?auto_94907 ) ) ( not ( = ?auto_94902 ?auto_94903 ) ) ( not ( = ?auto_94902 ?auto_94904 ) ) ( not ( = ?auto_94902 ?auto_94905 ) ) ( not ( = ?auto_94902 ?auto_94906 ) ) ( not ( = ?auto_94902 ?auto_94907 ) ) ( not ( = ?auto_94903 ?auto_94904 ) ) ( not ( = ?auto_94903 ?auto_94905 ) ) ( not ( = ?auto_94903 ?auto_94906 ) ) ( not ( = ?auto_94903 ?auto_94907 ) ) ( not ( = ?auto_94904 ?auto_94905 ) ) ( not ( = ?auto_94904 ?auto_94906 ) ) ( not ( = ?auto_94904 ?auto_94907 ) ) ( not ( = ?auto_94905 ?auto_94906 ) ) ( not ( = ?auto_94905 ?auto_94907 ) ) ( not ( = ?auto_94906 ?auto_94907 ) ) ( ON ?auto_94905 ?auto_94906 ) ( ON ?auto_94904 ?auto_94905 ) ( ON ?auto_94903 ?auto_94904 ) ( ON ?auto_94902 ?auto_94903 ) ( CLEAR ?auto_94900 ) ( ON ?auto_94901 ?auto_94902 ) ( CLEAR ?auto_94901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94897 ?auto_94898 ?auto_94899 ?auto_94900 ?auto_94901 )
      ( MAKE-10PILE ?auto_94897 ?auto_94898 ?auto_94899 ?auto_94900 ?auto_94901 ?auto_94902 ?auto_94903 ?auto_94904 ?auto_94905 ?auto_94906 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94918 - BLOCK
      ?auto_94919 - BLOCK
      ?auto_94920 - BLOCK
      ?auto_94921 - BLOCK
      ?auto_94922 - BLOCK
      ?auto_94923 - BLOCK
      ?auto_94924 - BLOCK
      ?auto_94925 - BLOCK
      ?auto_94926 - BLOCK
      ?auto_94927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94927 ) ( ON-TABLE ?auto_94918 ) ( ON ?auto_94919 ?auto_94918 ) ( ON ?auto_94920 ?auto_94919 ) ( ON ?auto_94921 ?auto_94920 ) ( not ( = ?auto_94918 ?auto_94919 ) ) ( not ( = ?auto_94918 ?auto_94920 ) ) ( not ( = ?auto_94918 ?auto_94921 ) ) ( not ( = ?auto_94918 ?auto_94922 ) ) ( not ( = ?auto_94918 ?auto_94923 ) ) ( not ( = ?auto_94918 ?auto_94924 ) ) ( not ( = ?auto_94918 ?auto_94925 ) ) ( not ( = ?auto_94918 ?auto_94926 ) ) ( not ( = ?auto_94918 ?auto_94927 ) ) ( not ( = ?auto_94919 ?auto_94920 ) ) ( not ( = ?auto_94919 ?auto_94921 ) ) ( not ( = ?auto_94919 ?auto_94922 ) ) ( not ( = ?auto_94919 ?auto_94923 ) ) ( not ( = ?auto_94919 ?auto_94924 ) ) ( not ( = ?auto_94919 ?auto_94925 ) ) ( not ( = ?auto_94919 ?auto_94926 ) ) ( not ( = ?auto_94919 ?auto_94927 ) ) ( not ( = ?auto_94920 ?auto_94921 ) ) ( not ( = ?auto_94920 ?auto_94922 ) ) ( not ( = ?auto_94920 ?auto_94923 ) ) ( not ( = ?auto_94920 ?auto_94924 ) ) ( not ( = ?auto_94920 ?auto_94925 ) ) ( not ( = ?auto_94920 ?auto_94926 ) ) ( not ( = ?auto_94920 ?auto_94927 ) ) ( not ( = ?auto_94921 ?auto_94922 ) ) ( not ( = ?auto_94921 ?auto_94923 ) ) ( not ( = ?auto_94921 ?auto_94924 ) ) ( not ( = ?auto_94921 ?auto_94925 ) ) ( not ( = ?auto_94921 ?auto_94926 ) ) ( not ( = ?auto_94921 ?auto_94927 ) ) ( not ( = ?auto_94922 ?auto_94923 ) ) ( not ( = ?auto_94922 ?auto_94924 ) ) ( not ( = ?auto_94922 ?auto_94925 ) ) ( not ( = ?auto_94922 ?auto_94926 ) ) ( not ( = ?auto_94922 ?auto_94927 ) ) ( not ( = ?auto_94923 ?auto_94924 ) ) ( not ( = ?auto_94923 ?auto_94925 ) ) ( not ( = ?auto_94923 ?auto_94926 ) ) ( not ( = ?auto_94923 ?auto_94927 ) ) ( not ( = ?auto_94924 ?auto_94925 ) ) ( not ( = ?auto_94924 ?auto_94926 ) ) ( not ( = ?auto_94924 ?auto_94927 ) ) ( not ( = ?auto_94925 ?auto_94926 ) ) ( not ( = ?auto_94925 ?auto_94927 ) ) ( not ( = ?auto_94926 ?auto_94927 ) ) ( ON ?auto_94926 ?auto_94927 ) ( ON ?auto_94925 ?auto_94926 ) ( ON ?auto_94924 ?auto_94925 ) ( ON ?auto_94923 ?auto_94924 ) ( CLEAR ?auto_94921 ) ( ON ?auto_94922 ?auto_94923 ) ( CLEAR ?auto_94922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94918 ?auto_94919 ?auto_94920 ?auto_94921 ?auto_94922 )
      ( MAKE-10PILE ?auto_94918 ?auto_94919 ?auto_94920 ?auto_94921 ?auto_94922 ?auto_94923 ?auto_94924 ?auto_94925 ?auto_94926 ?auto_94927 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94938 - BLOCK
      ?auto_94939 - BLOCK
      ?auto_94940 - BLOCK
      ?auto_94941 - BLOCK
      ?auto_94942 - BLOCK
      ?auto_94943 - BLOCK
      ?auto_94944 - BLOCK
      ?auto_94945 - BLOCK
      ?auto_94946 - BLOCK
      ?auto_94947 - BLOCK
    )
    :vars
    (
      ?auto_94948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94947 ?auto_94948 ) ( ON-TABLE ?auto_94938 ) ( ON ?auto_94939 ?auto_94938 ) ( ON ?auto_94940 ?auto_94939 ) ( not ( = ?auto_94938 ?auto_94939 ) ) ( not ( = ?auto_94938 ?auto_94940 ) ) ( not ( = ?auto_94938 ?auto_94941 ) ) ( not ( = ?auto_94938 ?auto_94942 ) ) ( not ( = ?auto_94938 ?auto_94943 ) ) ( not ( = ?auto_94938 ?auto_94944 ) ) ( not ( = ?auto_94938 ?auto_94945 ) ) ( not ( = ?auto_94938 ?auto_94946 ) ) ( not ( = ?auto_94938 ?auto_94947 ) ) ( not ( = ?auto_94938 ?auto_94948 ) ) ( not ( = ?auto_94939 ?auto_94940 ) ) ( not ( = ?auto_94939 ?auto_94941 ) ) ( not ( = ?auto_94939 ?auto_94942 ) ) ( not ( = ?auto_94939 ?auto_94943 ) ) ( not ( = ?auto_94939 ?auto_94944 ) ) ( not ( = ?auto_94939 ?auto_94945 ) ) ( not ( = ?auto_94939 ?auto_94946 ) ) ( not ( = ?auto_94939 ?auto_94947 ) ) ( not ( = ?auto_94939 ?auto_94948 ) ) ( not ( = ?auto_94940 ?auto_94941 ) ) ( not ( = ?auto_94940 ?auto_94942 ) ) ( not ( = ?auto_94940 ?auto_94943 ) ) ( not ( = ?auto_94940 ?auto_94944 ) ) ( not ( = ?auto_94940 ?auto_94945 ) ) ( not ( = ?auto_94940 ?auto_94946 ) ) ( not ( = ?auto_94940 ?auto_94947 ) ) ( not ( = ?auto_94940 ?auto_94948 ) ) ( not ( = ?auto_94941 ?auto_94942 ) ) ( not ( = ?auto_94941 ?auto_94943 ) ) ( not ( = ?auto_94941 ?auto_94944 ) ) ( not ( = ?auto_94941 ?auto_94945 ) ) ( not ( = ?auto_94941 ?auto_94946 ) ) ( not ( = ?auto_94941 ?auto_94947 ) ) ( not ( = ?auto_94941 ?auto_94948 ) ) ( not ( = ?auto_94942 ?auto_94943 ) ) ( not ( = ?auto_94942 ?auto_94944 ) ) ( not ( = ?auto_94942 ?auto_94945 ) ) ( not ( = ?auto_94942 ?auto_94946 ) ) ( not ( = ?auto_94942 ?auto_94947 ) ) ( not ( = ?auto_94942 ?auto_94948 ) ) ( not ( = ?auto_94943 ?auto_94944 ) ) ( not ( = ?auto_94943 ?auto_94945 ) ) ( not ( = ?auto_94943 ?auto_94946 ) ) ( not ( = ?auto_94943 ?auto_94947 ) ) ( not ( = ?auto_94943 ?auto_94948 ) ) ( not ( = ?auto_94944 ?auto_94945 ) ) ( not ( = ?auto_94944 ?auto_94946 ) ) ( not ( = ?auto_94944 ?auto_94947 ) ) ( not ( = ?auto_94944 ?auto_94948 ) ) ( not ( = ?auto_94945 ?auto_94946 ) ) ( not ( = ?auto_94945 ?auto_94947 ) ) ( not ( = ?auto_94945 ?auto_94948 ) ) ( not ( = ?auto_94946 ?auto_94947 ) ) ( not ( = ?auto_94946 ?auto_94948 ) ) ( not ( = ?auto_94947 ?auto_94948 ) ) ( ON ?auto_94946 ?auto_94947 ) ( ON ?auto_94945 ?auto_94946 ) ( ON ?auto_94944 ?auto_94945 ) ( ON ?auto_94943 ?auto_94944 ) ( ON ?auto_94942 ?auto_94943 ) ( CLEAR ?auto_94940 ) ( ON ?auto_94941 ?auto_94942 ) ( CLEAR ?auto_94941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94938 ?auto_94939 ?auto_94940 ?auto_94941 )
      ( MAKE-10PILE ?auto_94938 ?auto_94939 ?auto_94940 ?auto_94941 ?auto_94942 ?auto_94943 ?auto_94944 ?auto_94945 ?auto_94946 ?auto_94947 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94959 - BLOCK
      ?auto_94960 - BLOCK
      ?auto_94961 - BLOCK
      ?auto_94962 - BLOCK
      ?auto_94963 - BLOCK
      ?auto_94964 - BLOCK
      ?auto_94965 - BLOCK
      ?auto_94966 - BLOCK
      ?auto_94967 - BLOCK
      ?auto_94968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94968 ) ( ON-TABLE ?auto_94959 ) ( ON ?auto_94960 ?auto_94959 ) ( ON ?auto_94961 ?auto_94960 ) ( not ( = ?auto_94959 ?auto_94960 ) ) ( not ( = ?auto_94959 ?auto_94961 ) ) ( not ( = ?auto_94959 ?auto_94962 ) ) ( not ( = ?auto_94959 ?auto_94963 ) ) ( not ( = ?auto_94959 ?auto_94964 ) ) ( not ( = ?auto_94959 ?auto_94965 ) ) ( not ( = ?auto_94959 ?auto_94966 ) ) ( not ( = ?auto_94959 ?auto_94967 ) ) ( not ( = ?auto_94959 ?auto_94968 ) ) ( not ( = ?auto_94960 ?auto_94961 ) ) ( not ( = ?auto_94960 ?auto_94962 ) ) ( not ( = ?auto_94960 ?auto_94963 ) ) ( not ( = ?auto_94960 ?auto_94964 ) ) ( not ( = ?auto_94960 ?auto_94965 ) ) ( not ( = ?auto_94960 ?auto_94966 ) ) ( not ( = ?auto_94960 ?auto_94967 ) ) ( not ( = ?auto_94960 ?auto_94968 ) ) ( not ( = ?auto_94961 ?auto_94962 ) ) ( not ( = ?auto_94961 ?auto_94963 ) ) ( not ( = ?auto_94961 ?auto_94964 ) ) ( not ( = ?auto_94961 ?auto_94965 ) ) ( not ( = ?auto_94961 ?auto_94966 ) ) ( not ( = ?auto_94961 ?auto_94967 ) ) ( not ( = ?auto_94961 ?auto_94968 ) ) ( not ( = ?auto_94962 ?auto_94963 ) ) ( not ( = ?auto_94962 ?auto_94964 ) ) ( not ( = ?auto_94962 ?auto_94965 ) ) ( not ( = ?auto_94962 ?auto_94966 ) ) ( not ( = ?auto_94962 ?auto_94967 ) ) ( not ( = ?auto_94962 ?auto_94968 ) ) ( not ( = ?auto_94963 ?auto_94964 ) ) ( not ( = ?auto_94963 ?auto_94965 ) ) ( not ( = ?auto_94963 ?auto_94966 ) ) ( not ( = ?auto_94963 ?auto_94967 ) ) ( not ( = ?auto_94963 ?auto_94968 ) ) ( not ( = ?auto_94964 ?auto_94965 ) ) ( not ( = ?auto_94964 ?auto_94966 ) ) ( not ( = ?auto_94964 ?auto_94967 ) ) ( not ( = ?auto_94964 ?auto_94968 ) ) ( not ( = ?auto_94965 ?auto_94966 ) ) ( not ( = ?auto_94965 ?auto_94967 ) ) ( not ( = ?auto_94965 ?auto_94968 ) ) ( not ( = ?auto_94966 ?auto_94967 ) ) ( not ( = ?auto_94966 ?auto_94968 ) ) ( not ( = ?auto_94967 ?auto_94968 ) ) ( ON ?auto_94967 ?auto_94968 ) ( ON ?auto_94966 ?auto_94967 ) ( ON ?auto_94965 ?auto_94966 ) ( ON ?auto_94964 ?auto_94965 ) ( ON ?auto_94963 ?auto_94964 ) ( CLEAR ?auto_94961 ) ( ON ?auto_94962 ?auto_94963 ) ( CLEAR ?auto_94962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94959 ?auto_94960 ?auto_94961 ?auto_94962 )
      ( MAKE-10PILE ?auto_94959 ?auto_94960 ?auto_94961 ?auto_94962 ?auto_94963 ?auto_94964 ?auto_94965 ?auto_94966 ?auto_94967 ?auto_94968 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_94979 - BLOCK
      ?auto_94980 - BLOCK
      ?auto_94981 - BLOCK
      ?auto_94982 - BLOCK
      ?auto_94983 - BLOCK
      ?auto_94984 - BLOCK
      ?auto_94985 - BLOCK
      ?auto_94986 - BLOCK
      ?auto_94987 - BLOCK
      ?auto_94988 - BLOCK
    )
    :vars
    (
      ?auto_94989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_94988 ?auto_94989 ) ( ON-TABLE ?auto_94979 ) ( ON ?auto_94980 ?auto_94979 ) ( not ( = ?auto_94979 ?auto_94980 ) ) ( not ( = ?auto_94979 ?auto_94981 ) ) ( not ( = ?auto_94979 ?auto_94982 ) ) ( not ( = ?auto_94979 ?auto_94983 ) ) ( not ( = ?auto_94979 ?auto_94984 ) ) ( not ( = ?auto_94979 ?auto_94985 ) ) ( not ( = ?auto_94979 ?auto_94986 ) ) ( not ( = ?auto_94979 ?auto_94987 ) ) ( not ( = ?auto_94979 ?auto_94988 ) ) ( not ( = ?auto_94979 ?auto_94989 ) ) ( not ( = ?auto_94980 ?auto_94981 ) ) ( not ( = ?auto_94980 ?auto_94982 ) ) ( not ( = ?auto_94980 ?auto_94983 ) ) ( not ( = ?auto_94980 ?auto_94984 ) ) ( not ( = ?auto_94980 ?auto_94985 ) ) ( not ( = ?auto_94980 ?auto_94986 ) ) ( not ( = ?auto_94980 ?auto_94987 ) ) ( not ( = ?auto_94980 ?auto_94988 ) ) ( not ( = ?auto_94980 ?auto_94989 ) ) ( not ( = ?auto_94981 ?auto_94982 ) ) ( not ( = ?auto_94981 ?auto_94983 ) ) ( not ( = ?auto_94981 ?auto_94984 ) ) ( not ( = ?auto_94981 ?auto_94985 ) ) ( not ( = ?auto_94981 ?auto_94986 ) ) ( not ( = ?auto_94981 ?auto_94987 ) ) ( not ( = ?auto_94981 ?auto_94988 ) ) ( not ( = ?auto_94981 ?auto_94989 ) ) ( not ( = ?auto_94982 ?auto_94983 ) ) ( not ( = ?auto_94982 ?auto_94984 ) ) ( not ( = ?auto_94982 ?auto_94985 ) ) ( not ( = ?auto_94982 ?auto_94986 ) ) ( not ( = ?auto_94982 ?auto_94987 ) ) ( not ( = ?auto_94982 ?auto_94988 ) ) ( not ( = ?auto_94982 ?auto_94989 ) ) ( not ( = ?auto_94983 ?auto_94984 ) ) ( not ( = ?auto_94983 ?auto_94985 ) ) ( not ( = ?auto_94983 ?auto_94986 ) ) ( not ( = ?auto_94983 ?auto_94987 ) ) ( not ( = ?auto_94983 ?auto_94988 ) ) ( not ( = ?auto_94983 ?auto_94989 ) ) ( not ( = ?auto_94984 ?auto_94985 ) ) ( not ( = ?auto_94984 ?auto_94986 ) ) ( not ( = ?auto_94984 ?auto_94987 ) ) ( not ( = ?auto_94984 ?auto_94988 ) ) ( not ( = ?auto_94984 ?auto_94989 ) ) ( not ( = ?auto_94985 ?auto_94986 ) ) ( not ( = ?auto_94985 ?auto_94987 ) ) ( not ( = ?auto_94985 ?auto_94988 ) ) ( not ( = ?auto_94985 ?auto_94989 ) ) ( not ( = ?auto_94986 ?auto_94987 ) ) ( not ( = ?auto_94986 ?auto_94988 ) ) ( not ( = ?auto_94986 ?auto_94989 ) ) ( not ( = ?auto_94987 ?auto_94988 ) ) ( not ( = ?auto_94987 ?auto_94989 ) ) ( not ( = ?auto_94988 ?auto_94989 ) ) ( ON ?auto_94987 ?auto_94988 ) ( ON ?auto_94986 ?auto_94987 ) ( ON ?auto_94985 ?auto_94986 ) ( ON ?auto_94984 ?auto_94985 ) ( ON ?auto_94983 ?auto_94984 ) ( ON ?auto_94982 ?auto_94983 ) ( CLEAR ?auto_94980 ) ( ON ?auto_94981 ?auto_94982 ) ( CLEAR ?auto_94981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94979 ?auto_94980 ?auto_94981 )
      ( MAKE-10PILE ?auto_94979 ?auto_94980 ?auto_94981 ?auto_94982 ?auto_94983 ?auto_94984 ?auto_94985 ?auto_94986 ?auto_94987 ?auto_94988 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_95000 - BLOCK
      ?auto_95001 - BLOCK
      ?auto_95002 - BLOCK
      ?auto_95003 - BLOCK
      ?auto_95004 - BLOCK
      ?auto_95005 - BLOCK
      ?auto_95006 - BLOCK
      ?auto_95007 - BLOCK
      ?auto_95008 - BLOCK
      ?auto_95009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95009 ) ( ON-TABLE ?auto_95000 ) ( ON ?auto_95001 ?auto_95000 ) ( not ( = ?auto_95000 ?auto_95001 ) ) ( not ( = ?auto_95000 ?auto_95002 ) ) ( not ( = ?auto_95000 ?auto_95003 ) ) ( not ( = ?auto_95000 ?auto_95004 ) ) ( not ( = ?auto_95000 ?auto_95005 ) ) ( not ( = ?auto_95000 ?auto_95006 ) ) ( not ( = ?auto_95000 ?auto_95007 ) ) ( not ( = ?auto_95000 ?auto_95008 ) ) ( not ( = ?auto_95000 ?auto_95009 ) ) ( not ( = ?auto_95001 ?auto_95002 ) ) ( not ( = ?auto_95001 ?auto_95003 ) ) ( not ( = ?auto_95001 ?auto_95004 ) ) ( not ( = ?auto_95001 ?auto_95005 ) ) ( not ( = ?auto_95001 ?auto_95006 ) ) ( not ( = ?auto_95001 ?auto_95007 ) ) ( not ( = ?auto_95001 ?auto_95008 ) ) ( not ( = ?auto_95001 ?auto_95009 ) ) ( not ( = ?auto_95002 ?auto_95003 ) ) ( not ( = ?auto_95002 ?auto_95004 ) ) ( not ( = ?auto_95002 ?auto_95005 ) ) ( not ( = ?auto_95002 ?auto_95006 ) ) ( not ( = ?auto_95002 ?auto_95007 ) ) ( not ( = ?auto_95002 ?auto_95008 ) ) ( not ( = ?auto_95002 ?auto_95009 ) ) ( not ( = ?auto_95003 ?auto_95004 ) ) ( not ( = ?auto_95003 ?auto_95005 ) ) ( not ( = ?auto_95003 ?auto_95006 ) ) ( not ( = ?auto_95003 ?auto_95007 ) ) ( not ( = ?auto_95003 ?auto_95008 ) ) ( not ( = ?auto_95003 ?auto_95009 ) ) ( not ( = ?auto_95004 ?auto_95005 ) ) ( not ( = ?auto_95004 ?auto_95006 ) ) ( not ( = ?auto_95004 ?auto_95007 ) ) ( not ( = ?auto_95004 ?auto_95008 ) ) ( not ( = ?auto_95004 ?auto_95009 ) ) ( not ( = ?auto_95005 ?auto_95006 ) ) ( not ( = ?auto_95005 ?auto_95007 ) ) ( not ( = ?auto_95005 ?auto_95008 ) ) ( not ( = ?auto_95005 ?auto_95009 ) ) ( not ( = ?auto_95006 ?auto_95007 ) ) ( not ( = ?auto_95006 ?auto_95008 ) ) ( not ( = ?auto_95006 ?auto_95009 ) ) ( not ( = ?auto_95007 ?auto_95008 ) ) ( not ( = ?auto_95007 ?auto_95009 ) ) ( not ( = ?auto_95008 ?auto_95009 ) ) ( ON ?auto_95008 ?auto_95009 ) ( ON ?auto_95007 ?auto_95008 ) ( ON ?auto_95006 ?auto_95007 ) ( ON ?auto_95005 ?auto_95006 ) ( ON ?auto_95004 ?auto_95005 ) ( ON ?auto_95003 ?auto_95004 ) ( CLEAR ?auto_95001 ) ( ON ?auto_95002 ?auto_95003 ) ( CLEAR ?auto_95002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_95000 ?auto_95001 ?auto_95002 )
      ( MAKE-10PILE ?auto_95000 ?auto_95001 ?auto_95002 ?auto_95003 ?auto_95004 ?auto_95005 ?auto_95006 ?auto_95007 ?auto_95008 ?auto_95009 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_95020 - BLOCK
      ?auto_95021 - BLOCK
      ?auto_95022 - BLOCK
      ?auto_95023 - BLOCK
      ?auto_95024 - BLOCK
      ?auto_95025 - BLOCK
      ?auto_95026 - BLOCK
      ?auto_95027 - BLOCK
      ?auto_95028 - BLOCK
      ?auto_95029 - BLOCK
    )
    :vars
    (
      ?auto_95030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95029 ?auto_95030 ) ( ON-TABLE ?auto_95020 ) ( not ( = ?auto_95020 ?auto_95021 ) ) ( not ( = ?auto_95020 ?auto_95022 ) ) ( not ( = ?auto_95020 ?auto_95023 ) ) ( not ( = ?auto_95020 ?auto_95024 ) ) ( not ( = ?auto_95020 ?auto_95025 ) ) ( not ( = ?auto_95020 ?auto_95026 ) ) ( not ( = ?auto_95020 ?auto_95027 ) ) ( not ( = ?auto_95020 ?auto_95028 ) ) ( not ( = ?auto_95020 ?auto_95029 ) ) ( not ( = ?auto_95020 ?auto_95030 ) ) ( not ( = ?auto_95021 ?auto_95022 ) ) ( not ( = ?auto_95021 ?auto_95023 ) ) ( not ( = ?auto_95021 ?auto_95024 ) ) ( not ( = ?auto_95021 ?auto_95025 ) ) ( not ( = ?auto_95021 ?auto_95026 ) ) ( not ( = ?auto_95021 ?auto_95027 ) ) ( not ( = ?auto_95021 ?auto_95028 ) ) ( not ( = ?auto_95021 ?auto_95029 ) ) ( not ( = ?auto_95021 ?auto_95030 ) ) ( not ( = ?auto_95022 ?auto_95023 ) ) ( not ( = ?auto_95022 ?auto_95024 ) ) ( not ( = ?auto_95022 ?auto_95025 ) ) ( not ( = ?auto_95022 ?auto_95026 ) ) ( not ( = ?auto_95022 ?auto_95027 ) ) ( not ( = ?auto_95022 ?auto_95028 ) ) ( not ( = ?auto_95022 ?auto_95029 ) ) ( not ( = ?auto_95022 ?auto_95030 ) ) ( not ( = ?auto_95023 ?auto_95024 ) ) ( not ( = ?auto_95023 ?auto_95025 ) ) ( not ( = ?auto_95023 ?auto_95026 ) ) ( not ( = ?auto_95023 ?auto_95027 ) ) ( not ( = ?auto_95023 ?auto_95028 ) ) ( not ( = ?auto_95023 ?auto_95029 ) ) ( not ( = ?auto_95023 ?auto_95030 ) ) ( not ( = ?auto_95024 ?auto_95025 ) ) ( not ( = ?auto_95024 ?auto_95026 ) ) ( not ( = ?auto_95024 ?auto_95027 ) ) ( not ( = ?auto_95024 ?auto_95028 ) ) ( not ( = ?auto_95024 ?auto_95029 ) ) ( not ( = ?auto_95024 ?auto_95030 ) ) ( not ( = ?auto_95025 ?auto_95026 ) ) ( not ( = ?auto_95025 ?auto_95027 ) ) ( not ( = ?auto_95025 ?auto_95028 ) ) ( not ( = ?auto_95025 ?auto_95029 ) ) ( not ( = ?auto_95025 ?auto_95030 ) ) ( not ( = ?auto_95026 ?auto_95027 ) ) ( not ( = ?auto_95026 ?auto_95028 ) ) ( not ( = ?auto_95026 ?auto_95029 ) ) ( not ( = ?auto_95026 ?auto_95030 ) ) ( not ( = ?auto_95027 ?auto_95028 ) ) ( not ( = ?auto_95027 ?auto_95029 ) ) ( not ( = ?auto_95027 ?auto_95030 ) ) ( not ( = ?auto_95028 ?auto_95029 ) ) ( not ( = ?auto_95028 ?auto_95030 ) ) ( not ( = ?auto_95029 ?auto_95030 ) ) ( ON ?auto_95028 ?auto_95029 ) ( ON ?auto_95027 ?auto_95028 ) ( ON ?auto_95026 ?auto_95027 ) ( ON ?auto_95025 ?auto_95026 ) ( ON ?auto_95024 ?auto_95025 ) ( ON ?auto_95023 ?auto_95024 ) ( ON ?auto_95022 ?auto_95023 ) ( CLEAR ?auto_95020 ) ( ON ?auto_95021 ?auto_95022 ) ( CLEAR ?auto_95021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95020 ?auto_95021 )
      ( MAKE-10PILE ?auto_95020 ?auto_95021 ?auto_95022 ?auto_95023 ?auto_95024 ?auto_95025 ?auto_95026 ?auto_95027 ?auto_95028 ?auto_95029 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_95041 - BLOCK
      ?auto_95042 - BLOCK
      ?auto_95043 - BLOCK
      ?auto_95044 - BLOCK
      ?auto_95045 - BLOCK
      ?auto_95046 - BLOCK
      ?auto_95047 - BLOCK
      ?auto_95048 - BLOCK
      ?auto_95049 - BLOCK
      ?auto_95050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95050 ) ( ON-TABLE ?auto_95041 ) ( not ( = ?auto_95041 ?auto_95042 ) ) ( not ( = ?auto_95041 ?auto_95043 ) ) ( not ( = ?auto_95041 ?auto_95044 ) ) ( not ( = ?auto_95041 ?auto_95045 ) ) ( not ( = ?auto_95041 ?auto_95046 ) ) ( not ( = ?auto_95041 ?auto_95047 ) ) ( not ( = ?auto_95041 ?auto_95048 ) ) ( not ( = ?auto_95041 ?auto_95049 ) ) ( not ( = ?auto_95041 ?auto_95050 ) ) ( not ( = ?auto_95042 ?auto_95043 ) ) ( not ( = ?auto_95042 ?auto_95044 ) ) ( not ( = ?auto_95042 ?auto_95045 ) ) ( not ( = ?auto_95042 ?auto_95046 ) ) ( not ( = ?auto_95042 ?auto_95047 ) ) ( not ( = ?auto_95042 ?auto_95048 ) ) ( not ( = ?auto_95042 ?auto_95049 ) ) ( not ( = ?auto_95042 ?auto_95050 ) ) ( not ( = ?auto_95043 ?auto_95044 ) ) ( not ( = ?auto_95043 ?auto_95045 ) ) ( not ( = ?auto_95043 ?auto_95046 ) ) ( not ( = ?auto_95043 ?auto_95047 ) ) ( not ( = ?auto_95043 ?auto_95048 ) ) ( not ( = ?auto_95043 ?auto_95049 ) ) ( not ( = ?auto_95043 ?auto_95050 ) ) ( not ( = ?auto_95044 ?auto_95045 ) ) ( not ( = ?auto_95044 ?auto_95046 ) ) ( not ( = ?auto_95044 ?auto_95047 ) ) ( not ( = ?auto_95044 ?auto_95048 ) ) ( not ( = ?auto_95044 ?auto_95049 ) ) ( not ( = ?auto_95044 ?auto_95050 ) ) ( not ( = ?auto_95045 ?auto_95046 ) ) ( not ( = ?auto_95045 ?auto_95047 ) ) ( not ( = ?auto_95045 ?auto_95048 ) ) ( not ( = ?auto_95045 ?auto_95049 ) ) ( not ( = ?auto_95045 ?auto_95050 ) ) ( not ( = ?auto_95046 ?auto_95047 ) ) ( not ( = ?auto_95046 ?auto_95048 ) ) ( not ( = ?auto_95046 ?auto_95049 ) ) ( not ( = ?auto_95046 ?auto_95050 ) ) ( not ( = ?auto_95047 ?auto_95048 ) ) ( not ( = ?auto_95047 ?auto_95049 ) ) ( not ( = ?auto_95047 ?auto_95050 ) ) ( not ( = ?auto_95048 ?auto_95049 ) ) ( not ( = ?auto_95048 ?auto_95050 ) ) ( not ( = ?auto_95049 ?auto_95050 ) ) ( ON ?auto_95049 ?auto_95050 ) ( ON ?auto_95048 ?auto_95049 ) ( ON ?auto_95047 ?auto_95048 ) ( ON ?auto_95046 ?auto_95047 ) ( ON ?auto_95045 ?auto_95046 ) ( ON ?auto_95044 ?auto_95045 ) ( ON ?auto_95043 ?auto_95044 ) ( CLEAR ?auto_95041 ) ( ON ?auto_95042 ?auto_95043 ) ( CLEAR ?auto_95042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_95041 ?auto_95042 )
      ( MAKE-10PILE ?auto_95041 ?auto_95042 ?auto_95043 ?auto_95044 ?auto_95045 ?auto_95046 ?auto_95047 ?auto_95048 ?auto_95049 ?auto_95050 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_95061 - BLOCK
      ?auto_95062 - BLOCK
      ?auto_95063 - BLOCK
      ?auto_95064 - BLOCK
      ?auto_95065 - BLOCK
      ?auto_95066 - BLOCK
      ?auto_95067 - BLOCK
      ?auto_95068 - BLOCK
      ?auto_95069 - BLOCK
      ?auto_95070 - BLOCK
    )
    :vars
    (
      ?auto_95071 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_95070 ?auto_95071 ) ( not ( = ?auto_95061 ?auto_95062 ) ) ( not ( = ?auto_95061 ?auto_95063 ) ) ( not ( = ?auto_95061 ?auto_95064 ) ) ( not ( = ?auto_95061 ?auto_95065 ) ) ( not ( = ?auto_95061 ?auto_95066 ) ) ( not ( = ?auto_95061 ?auto_95067 ) ) ( not ( = ?auto_95061 ?auto_95068 ) ) ( not ( = ?auto_95061 ?auto_95069 ) ) ( not ( = ?auto_95061 ?auto_95070 ) ) ( not ( = ?auto_95061 ?auto_95071 ) ) ( not ( = ?auto_95062 ?auto_95063 ) ) ( not ( = ?auto_95062 ?auto_95064 ) ) ( not ( = ?auto_95062 ?auto_95065 ) ) ( not ( = ?auto_95062 ?auto_95066 ) ) ( not ( = ?auto_95062 ?auto_95067 ) ) ( not ( = ?auto_95062 ?auto_95068 ) ) ( not ( = ?auto_95062 ?auto_95069 ) ) ( not ( = ?auto_95062 ?auto_95070 ) ) ( not ( = ?auto_95062 ?auto_95071 ) ) ( not ( = ?auto_95063 ?auto_95064 ) ) ( not ( = ?auto_95063 ?auto_95065 ) ) ( not ( = ?auto_95063 ?auto_95066 ) ) ( not ( = ?auto_95063 ?auto_95067 ) ) ( not ( = ?auto_95063 ?auto_95068 ) ) ( not ( = ?auto_95063 ?auto_95069 ) ) ( not ( = ?auto_95063 ?auto_95070 ) ) ( not ( = ?auto_95063 ?auto_95071 ) ) ( not ( = ?auto_95064 ?auto_95065 ) ) ( not ( = ?auto_95064 ?auto_95066 ) ) ( not ( = ?auto_95064 ?auto_95067 ) ) ( not ( = ?auto_95064 ?auto_95068 ) ) ( not ( = ?auto_95064 ?auto_95069 ) ) ( not ( = ?auto_95064 ?auto_95070 ) ) ( not ( = ?auto_95064 ?auto_95071 ) ) ( not ( = ?auto_95065 ?auto_95066 ) ) ( not ( = ?auto_95065 ?auto_95067 ) ) ( not ( = ?auto_95065 ?auto_95068 ) ) ( not ( = ?auto_95065 ?auto_95069 ) ) ( not ( = ?auto_95065 ?auto_95070 ) ) ( not ( = ?auto_95065 ?auto_95071 ) ) ( not ( = ?auto_95066 ?auto_95067 ) ) ( not ( = ?auto_95066 ?auto_95068 ) ) ( not ( = ?auto_95066 ?auto_95069 ) ) ( not ( = ?auto_95066 ?auto_95070 ) ) ( not ( = ?auto_95066 ?auto_95071 ) ) ( not ( = ?auto_95067 ?auto_95068 ) ) ( not ( = ?auto_95067 ?auto_95069 ) ) ( not ( = ?auto_95067 ?auto_95070 ) ) ( not ( = ?auto_95067 ?auto_95071 ) ) ( not ( = ?auto_95068 ?auto_95069 ) ) ( not ( = ?auto_95068 ?auto_95070 ) ) ( not ( = ?auto_95068 ?auto_95071 ) ) ( not ( = ?auto_95069 ?auto_95070 ) ) ( not ( = ?auto_95069 ?auto_95071 ) ) ( not ( = ?auto_95070 ?auto_95071 ) ) ( ON ?auto_95069 ?auto_95070 ) ( ON ?auto_95068 ?auto_95069 ) ( ON ?auto_95067 ?auto_95068 ) ( ON ?auto_95066 ?auto_95067 ) ( ON ?auto_95065 ?auto_95066 ) ( ON ?auto_95064 ?auto_95065 ) ( ON ?auto_95063 ?auto_95064 ) ( ON ?auto_95062 ?auto_95063 ) ( ON ?auto_95061 ?auto_95062 ) ( CLEAR ?auto_95061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95061 )
      ( MAKE-10PILE ?auto_95061 ?auto_95062 ?auto_95063 ?auto_95064 ?auto_95065 ?auto_95066 ?auto_95067 ?auto_95068 ?auto_95069 ?auto_95070 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_95082 - BLOCK
      ?auto_95083 - BLOCK
      ?auto_95084 - BLOCK
      ?auto_95085 - BLOCK
      ?auto_95086 - BLOCK
      ?auto_95087 - BLOCK
      ?auto_95088 - BLOCK
      ?auto_95089 - BLOCK
      ?auto_95090 - BLOCK
      ?auto_95091 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_95091 ) ( not ( = ?auto_95082 ?auto_95083 ) ) ( not ( = ?auto_95082 ?auto_95084 ) ) ( not ( = ?auto_95082 ?auto_95085 ) ) ( not ( = ?auto_95082 ?auto_95086 ) ) ( not ( = ?auto_95082 ?auto_95087 ) ) ( not ( = ?auto_95082 ?auto_95088 ) ) ( not ( = ?auto_95082 ?auto_95089 ) ) ( not ( = ?auto_95082 ?auto_95090 ) ) ( not ( = ?auto_95082 ?auto_95091 ) ) ( not ( = ?auto_95083 ?auto_95084 ) ) ( not ( = ?auto_95083 ?auto_95085 ) ) ( not ( = ?auto_95083 ?auto_95086 ) ) ( not ( = ?auto_95083 ?auto_95087 ) ) ( not ( = ?auto_95083 ?auto_95088 ) ) ( not ( = ?auto_95083 ?auto_95089 ) ) ( not ( = ?auto_95083 ?auto_95090 ) ) ( not ( = ?auto_95083 ?auto_95091 ) ) ( not ( = ?auto_95084 ?auto_95085 ) ) ( not ( = ?auto_95084 ?auto_95086 ) ) ( not ( = ?auto_95084 ?auto_95087 ) ) ( not ( = ?auto_95084 ?auto_95088 ) ) ( not ( = ?auto_95084 ?auto_95089 ) ) ( not ( = ?auto_95084 ?auto_95090 ) ) ( not ( = ?auto_95084 ?auto_95091 ) ) ( not ( = ?auto_95085 ?auto_95086 ) ) ( not ( = ?auto_95085 ?auto_95087 ) ) ( not ( = ?auto_95085 ?auto_95088 ) ) ( not ( = ?auto_95085 ?auto_95089 ) ) ( not ( = ?auto_95085 ?auto_95090 ) ) ( not ( = ?auto_95085 ?auto_95091 ) ) ( not ( = ?auto_95086 ?auto_95087 ) ) ( not ( = ?auto_95086 ?auto_95088 ) ) ( not ( = ?auto_95086 ?auto_95089 ) ) ( not ( = ?auto_95086 ?auto_95090 ) ) ( not ( = ?auto_95086 ?auto_95091 ) ) ( not ( = ?auto_95087 ?auto_95088 ) ) ( not ( = ?auto_95087 ?auto_95089 ) ) ( not ( = ?auto_95087 ?auto_95090 ) ) ( not ( = ?auto_95087 ?auto_95091 ) ) ( not ( = ?auto_95088 ?auto_95089 ) ) ( not ( = ?auto_95088 ?auto_95090 ) ) ( not ( = ?auto_95088 ?auto_95091 ) ) ( not ( = ?auto_95089 ?auto_95090 ) ) ( not ( = ?auto_95089 ?auto_95091 ) ) ( not ( = ?auto_95090 ?auto_95091 ) ) ( ON ?auto_95090 ?auto_95091 ) ( ON ?auto_95089 ?auto_95090 ) ( ON ?auto_95088 ?auto_95089 ) ( ON ?auto_95087 ?auto_95088 ) ( ON ?auto_95086 ?auto_95087 ) ( ON ?auto_95085 ?auto_95086 ) ( ON ?auto_95084 ?auto_95085 ) ( ON ?auto_95083 ?auto_95084 ) ( ON ?auto_95082 ?auto_95083 ) ( CLEAR ?auto_95082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_95082 )
      ( MAKE-10PILE ?auto_95082 ?auto_95083 ?auto_95084 ?auto_95085 ?auto_95086 ?auto_95087 ?auto_95088 ?auto_95089 ?auto_95090 ?auto_95091 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_95102 - BLOCK
      ?auto_95103 - BLOCK
      ?auto_95104 - BLOCK
      ?auto_95105 - BLOCK
      ?auto_95106 - BLOCK
      ?auto_95107 - BLOCK
      ?auto_95108 - BLOCK
      ?auto_95109 - BLOCK
      ?auto_95110 - BLOCK
      ?auto_95111 - BLOCK
    )
    :vars
    (
      ?auto_95112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_95102 ?auto_95103 ) ) ( not ( = ?auto_95102 ?auto_95104 ) ) ( not ( = ?auto_95102 ?auto_95105 ) ) ( not ( = ?auto_95102 ?auto_95106 ) ) ( not ( = ?auto_95102 ?auto_95107 ) ) ( not ( = ?auto_95102 ?auto_95108 ) ) ( not ( = ?auto_95102 ?auto_95109 ) ) ( not ( = ?auto_95102 ?auto_95110 ) ) ( not ( = ?auto_95102 ?auto_95111 ) ) ( not ( = ?auto_95103 ?auto_95104 ) ) ( not ( = ?auto_95103 ?auto_95105 ) ) ( not ( = ?auto_95103 ?auto_95106 ) ) ( not ( = ?auto_95103 ?auto_95107 ) ) ( not ( = ?auto_95103 ?auto_95108 ) ) ( not ( = ?auto_95103 ?auto_95109 ) ) ( not ( = ?auto_95103 ?auto_95110 ) ) ( not ( = ?auto_95103 ?auto_95111 ) ) ( not ( = ?auto_95104 ?auto_95105 ) ) ( not ( = ?auto_95104 ?auto_95106 ) ) ( not ( = ?auto_95104 ?auto_95107 ) ) ( not ( = ?auto_95104 ?auto_95108 ) ) ( not ( = ?auto_95104 ?auto_95109 ) ) ( not ( = ?auto_95104 ?auto_95110 ) ) ( not ( = ?auto_95104 ?auto_95111 ) ) ( not ( = ?auto_95105 ?auto_95106 ) ) ( not ( = ?auto_95105 ?auto_95107 ) ) ( not ( = ?auto_95105 ?auto_95108 ) ) ( not ( = ?auto_95105 ?auto_95109 ) ) ( not ( = ?auto_95105 ?auto_95110 ) ) ( not ( = ?auto_95105 ?auto_95111 ) ) ( not ( = ?auto_95106 ?auto_95107 ) ) ( not ( = ?auto_95106 ?auto_95108 ) ) ( not ( = ?auto_95106 ?auto_95109 ) ) ( not ( = ?auto_95106 ?auto_95110 ) ) ( not ( = ?auto_95106 ?auto_95111 ) ) ( not ( = ?auto_95107 ?auto_95108 ) ) ( not ( = ?auto_95107 ?auto_95109 ) ) ( not ( = ?auto_95107 ?auto_95110 ) ) ( not ( = ?auto_95107 ?auto_95111 ) ) ( not ( = ?auto_95108 ?auto_95109 ) ) ( not ( = ?auto_95108 ?auto_95110 ) ) ( not ( = ?auto_95108 ?auto_95111 ) ) ( not ( = ?auto_95109 ?auto_95110 ) ) ( not ( = ?auto_95109 ?auto_95111 ) ) ( not ( = ?auto_95110 ?auto_95111 ) ) ( ON ?auto_95102 ?auto_95112 ) ( not ( = ?auto_95111 ?auto_95112 ) ) ( not ( = ?auto_95110 ?auto_95112 ) ) ( not ( = ?auto_95109 ?auto_95112 ) ) ( not ( = ?auto_95108 ?auto_95112 ) ) ( not ( = ?auto_95107 ?auto_95112 ) ) ( not ( = ?auto_95106 ?auto_95112 ) ) ( not ( = ?auto_95105 ?auto_95112 ) ) ( not ( = ?auto_95104 ?auto_95112 ) ) ( not ( = ?auto_95103 ?auto_95112 ) ) ( not ( = ?auto_95102 ?auto_95112 ) ) ( ON ?auto_95103 ?auto_95102 ) ( ON ?auto_95104 ?auto_95103 ) ( ON ?auto_95105 ?auto_95104 ) ( ON ?auto_95106 ?auto_95105 ) ( ON ?auto_95107 ?auto_95106 ) ( ON ?auto_95108 ?auto_95107 ) ( ON ?auto_95109 ?auto_95108 ) ( ON ?auto_95110 ?auto_95109 ) ( ON ?auto_95111 ?auto_95110 ) ( CLEAR ?auto_95111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_95111 ?auto_95110 ?auto_95109 ?auto_95108 ?auto_95107 ?auto_95106 ?auto_95105 ?auto_95104 ?auto_95103 ?auto_95102 )
      ( MAKE-10PILE ?auto_95102 ?auto_95103 ?auto_95104 ?auto_95105 ?auto_95106 ?auto_95107 ?auto_95108 ?auto_95109 ?auto_95110 ?auto_95111 ) )
  )

)

