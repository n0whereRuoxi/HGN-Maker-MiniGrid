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
      ?auto_71491 - BLOCK
      ?auto_71492 - BLOCK
      ?auto_71493 - BLOCK
      ?auto_71494 - BLOCK
      ?auto_71495 - BLOCK
      ?auto_71496 - BLOCK
      ?auto_71497 - BLOCK
    )
    :vars
    (
      ?auto_71498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71498 ?auto_71497 ) ( CLEAR ?auto_71498 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71491 ) ( ON ?auto_71492 ?auto_71491 ) ( ON ?auto_71493 ?auto_71492 ) ( ON ?auto_71494 ?auto_71493 ) ( ON ?auto_71495 ?auto_71494 ) ( ON ?auto_71496 ?auto_71495 ) ( ON ?auto_71497 ?auto_71496 ) ( not ( = ?auto_71491 ?auto_71492 ) ) ( not ( = ?auto_71491 ?auto_71493 ) ) ( not ( = ?auto_71491 ?auto_71494 ) ) ( not ( = ?auto_71491 ?auto_71495 ) ) ( not ( = ?auto_71491 ?auto_71496 ) ) ( not ( = ?auto_71491 ?auto_71497 ) ) ( not ( = ?auto_71491 ?auto_71498 ) ) ( not ( = ?auto_71492 ?auto_71493 ) ) ( not ( = ?auto_71492 ?auto_71494 ) ) ( not ( = ?auto_71492 ?auto_71495 ) ) ( not ( = ?auto_71492 ?auto_71496 ) ) ( not ( = ?auto_71492 ?auto_71497 ) ) ( not ( = ?auto_71492 ?auto_71498 ) ) ( not ( = ?auto_71493 ?auto_71494 ) ) ( not ( = ?auto_71493 ?auto_71495 ) ) ( not ( = ?auto_71493 ?auto_71496 ) ) ( not ( = ?auto_71493 ?auto_71497 ) ) ( not ( = ?auto_71493 ?auto_71498 ) ) ( not ( = ?auto_71494 ?auto_71495 ) ) ( not ( = ?auto_71494 ?auto_71496 ) ) ( not ( = ?auto_71494 ?auto_71497 ) ) ( not ( = ?auto_71494 ?auto_71498 ) ) ( not ( = ?auto_71495 ?auto_71496 ) ) ( not ( = ?auto_71495 ?auto_71497 ) ) ( not ( = ?auto_71495 ?auto_71498 ) ) ( not ( = ?auto_71496 ?auto_71497 ) ) ( not ( = ?auto_71496 ?auto_71498 ) ) ( not ( = ?auto_71497 ?auto_71498 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71498 ?auto_71497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71500 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71500 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_71500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_71501 - BLOCK
    )
    :vars
    (
      ?auto_71502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71501 ?auto_71502 ) ( CLEAR ?auto_71501 ) ( HAND-EMPTY ) ( not ( = ?auto_71501 ?auto_71502 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71501 ?auto_71502 )
      ( MAKE-1PILE ?auto_71501 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71509 - BLOCK
      ?auto_71510 - BLOCK
      ?auto_71511 - BLOCK
      ?auto_71512 - BLOCK
      ?auto_71513 - BLOCK
      ?auto_71514 - BLOCK
    )
    :vars
    (
      ?auto_71515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71515 ?auto_71514 ) ( CLEAR ?auto_71515 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71509 ) ( ON ?auto_71510 ?auto_71509 ) ( ON ?auto_71511 ?auto_71510 ) ( ON ?auto_71512 ?auto_71511 ) ( ON ?auto_71513 ?auto_71512 ) ( ON ?auto_71514 ?auto_71513 ) ( not ( = ?auto_71509 ?auto_71510 ) ) ( not ( = ?auto_71509 ?auto_71511 ) ) ( not ( = ?auto_71509 ?auto_71512 ) ) ( not ( = ?auto_71509 ?auto_71513 ) ) ( not ( = ?auto_71509 ?auto_71514 ) ) ( not ( = ?auto_71509 ?auto_71515 ) ) ( not ( = ?auto_71510 ?auto_71511 ) ) ( not ( = ?auto_71510 ?auto_71512 ) ) ( not ( = ?auto_71510 ?auto_71513 ) ) ( not ( = ?auto_71510 ?auto_71514 ) ) ( not ( = ?auto_71510 ?auto_71515 ) ) ( not ( = ?auto_71511 ?auto_71512 ) ) ( not ( = ?auto_71511 ?auto_71513 ) ) ( not ( = ?auto_71511 ?auto_71514 ) ) ( not ( = ?auto_71511 ?auto_71515 ) ) ( not ( = ?auto_71512 ?auto_71513 ) ) ( not ( = ?auto_71512 ?auto_71514 ) ) ( not ( = ?auto_71512 ?auto_71515 ) ) ( not ( = ?auto_71513 ?auto_71514 ) ) ( not ( = ?auto_71513 ?auto_71515 ) ) ( not ( = ?auto_71514 ?auto_71515 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71515 ?auto_71514 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71516 - BLOCK
      ?auto_71517 - BLOCK
      ?auto_71518 - BLOCK
      ?auto_71519 - BLOCK
      ?auto_71520 - BLOCK
      ?auto_71521 - BLOCK
    )
    :vars
    (
      ?auto_71522 - BLOCK
      ?auto_71523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71522 ?auto_71521 ) ( CLEAR ?auto_71522 ) ( ON-TABLE ?auto_71516 ) ( ON ?auto_71517 ?auto_71516 ) ( ON ?auto_71518 ?auto_71517 ) ( ON ?auto_71519 ?auto_71518 ) ( ON ?auto_71520 ?auto_71519 ) ( ON ?auto_71521 ?auto_71520 ) ( not ( = ?auto_71516 ?auto_71517 ) ) ( not ( = ?auto_71516 ?auto_71518 ) ) ( not ( = ?auto_71516 ?auto_71519 ) ) ( not ( = ?auto_71516 ?auto_71520 ) ) ( not ( = ?auto_71516 ?auto_71521 ) ) ( not ( = ?auto_71516 ?auto_71522 ) ) ( not ( = ?auto_71517 ?auto_71518 ) ) ( not ( = ?auto_71517 ?auto_71519 ) ) ( not ( = ?auto_71517 ?auto_71520 ) ) ( not ( = ?auto_71517 ?auto_71521 ) ) ( not ( = ?auto_71517 ?auto_71522 ) ) ( not ( = ?auto_71518 ?auto_71519 ) ) ( not ( = ?auto_71518 ?auto_71520 ) ) ( not ( = ?auto_71518 ?auto_71521 ) ) ( not ( = ?auto_71518 ?auto_71522 ) ) ( not ( = ?auto_71519 ?auto_71520 ) ) ( not ( = ?auto_71519 ?auto_71521 ) ) ( not ( = ?auto_71519 ?auto_71522 ) ) ( not ( = ?auto_71520 ?auto_71521 ) ) ( not ( = ?auto_71520 ?auto_71522 ) ) ( not ( = ?auto_71521 ?auto_71522 ) ) ( HOLDING ?auto_71523 ) ( not ( = ?auto_71516 ?auto_71523 ) ) ( not ( = ?auto_71517 ?auto_71523 ) ) ( not ( = ?auto_71518 ?auto_71523 ) ) ( not ( = ?auto_71519 ?auto_71523 ) ) ( not ( = ?auto_71520 ?auto_71523 ) ) ( not ( = ?auto_71521 ?auto_71523 ) ) ( not ( = ?auto_71522 ?auto_71523 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_71523 )
      ( MAKE-6PILE ?auto_71516 ?auto_71517 ?auto_71518 ?auto_71519 ?auto_71520 ?auto_71521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71524 - BLOCK
      ?auto_71525 - BLOCK
      ?auto_71526 - BLOCK
      ?auto_71527 - BLOCK
      ?auto_71528 - BLOCK
      ?auto_71529 - BLOCK
    )
    :vars
    (
      ?auto_71531 - BLOCK
      ?auto_71530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71531 ?auto_71529 ) ( ON-TABLE ?auto_71524 ) ( ON ?auto_71525 ?auto_71524 ) ( ON ?auto_71526 ?auto_71525 ) ( ON ?auto_71527 ?auto_71526 ) ( ON ?auto_71528 ?auto_71527 ) ( ON ?auto_71529 ?auto_71528 ) ( not ( = ?auto_71524 ?auto_71525 ) ) ( not ( = ?auto_71524 ?auto_71526 ) ) ( not ( = ?auto_71524 ?auto_71527 ) ) ( not ( = ?auto_71524 ?auto_71528 ) ) ( not ( = ?auto_71524 ?auto_71529 ) ) ( not ( = ?auto_71524 ?auto_71531 ) ) ( not ( = ?auto_71525 ?auto_71526 ) ) ( not ( = ?auto_71525 ?auto_71527 ) ) ( not ( = ?auto_71525 ?auto_71528 ) ) ( not ( = ?auto_71525 ?auto_71529 ) ) ( not ( = ?auto_71525 ?auto_71531 ) ) ( not ( = ?auto_71526 ?auto_71527 ) ) ( not ( = ?auto_71526 ?auto_71528 ) ) ( not ( = ?auto_71526 ?auto_71529 ) ) ( not ( = ?auto_71526 ?auto_71531 ) ) ( not ( = ?auto_71527 ?auto_71528 ) ) ( not ( = ?auto_71527 ?auto_71529 ) ) ( not ( = ?auto_71527 ?auto_71531 ) ) ( not ( = ?auto_71528 ?auto_71529 ) ) ( not ( = ?auto_71528 ?auto_71531 ) ) ( not ( = ?auto_71529 ?auto_71531 ) ) ( not ( = ?auto_71524 ?auto_71530 ) ) ( not ( = ?auto_71525 ?auto_71530 ) ) ( not ( = ?auto_71526 ?auto_71530 ) ) ( not ( = ?auto_71527 ?auto_71530 ) ) ( not ( = ?auto_71528 ?auto_71530 ) ) ( not ( = ?auto_71529 ?auto_71530 ) ) ( not ( = ?auto_71531 ?auto_71530 ) ) ( ON ?auto_71530 ?auto_71531 ) ( CLEAR ?auto_71530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71524 ?auto_71525 ?auto_71526 ?auto_71527 ?auto_71528 ?auto_71529 ?auto_71531 )
      ( MAKE-6PILE ?auto_71524 ?auto_71525 ?auto_71526 ?auto_71527 ?auto_71528 ?auto_71529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71534 - BLOCK
      ?auto_71535 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71535 ) ( CLEAR ?auto_71534 ) ( ON-TABLE ?auto_71534 ) ( not ( = ?auto_71534 ?auto_71535 ) ) )
    :subtasks
    ( ( !STACK ?auto_71535 ?auto_71534 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71536 - BLOCK
      ?auto_71537 - BLOCK
    )
    :vars
    (
      ?auto_71538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71536 ) ( ON-TABLE ?auto_71536 ) ( not ( = ?auto_71536 ?auto_71537 ) ) ( ON ?auto_71537 ?auto_71538 ) ( CLEAR ?auto_71537 ) ( HAND-EMPTY ) ( not ( = ?auto_71536 ?auto_71538 ) ) ( not ( = ?auto_71537 ?auto_71538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71537 ?auto_71538 )
      ( MAKE-2PILE ?auto_71536 ?auto_71537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71539 - BLOCK
      ?auto_71540 - BLOCK
    )
    :vars
    (
      ?auto_71541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71539 ?auto_71540 ) ) ( ON ?auto_71540 ?auto_71541 ) ( CLEAR ?auto_71540 ) ( not ( = ?auto_71539 ?auto_71541 ) ) ( not ( = ?auto_71540 ?auto_71541 ) ) ( HOLDING ?auto_71539 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71539 )
      ( MAKE-2PILE ?auto_71539 ?auto_71540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71542 - BLOCK
      ?auto_71543 - BLOCK
    )
    :vars
    (
      ?auto_71544 - BLOCK
      ?auto_71549 - BLOCK
      ?auto_71545 - BLOCK
      ?auto_71546 - BLOCK
      ?auto_71547 - BLOCK
      ?auto_71548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71542 ?auto_71543 ) ) ( ON ?auto_71543 ?auto_71544 ) ( not ( = ?auto_71542 ?auto_71544 ) ) ( not ( = ?auto_71543 ?auto_71544 ) ) ( ON ?auto_71542 ?auto_71543 ) ( CLEAR ?auto_71542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71549 ) ( ON ?auto_71545 ?auto_71549 ) ( ON ?auto_71546 ?auto_71545 ) ( ON ?auto_71547 ?auto_71546 ) ( ON ?auto_71548 ?auto_71547 ) ( ON ?auto_71544 ?auto_71548 ) ( not ( = ?auto_71549 ?auto_71545 ) ) ( not ( = ?auto_71549 ?auto_71546 ) ) ( not ( = ?auto_71549 ?auto_71547 ) ) ( not ( = ?auto_71549 ?auto_71548 ) ) ( not ( = ?auto_71549 ?auto_71544 ) ) ( not ( = ?auto_71549 ?auto_71543 ) ) ( not ( = ?auto_71549 ?auto_71542 ) ) ( not ( = ?auto_71545 ?auto_71546 ) ) ( not ( = ?auto_71545 ?auto_71547 ) ) ( not ( = ?auto_71545 ?auto_71548 ) ) ( not ( = ?auto_71545 ?auto_71544 ) ) ( not ( = ?auto_71545 ?auto_71543 ) ) ( not ( = ?auto_71545 ?auto_71542 ) ) ( not ( = ?auto_71546 ?auto_71547 ) ) ( not ( = ?auto_71546 ?auto_71548 ) ) ( not ( = ?auto_71546 ?auto_71544 ) ) ( not ( = ?auto_71546 ?auto_71543 ) ) ( not ( = ?auto_71546 ?auto_71542 ) ) ( not ( = ?auto_71547 ?auto_71548 ) ) ( not ( = ?auto_71547 ?auto_71544 ) ) ( not ( = ?auto_71547 ?auto_71543 ) ) ( not ( = ?auto_71547 ?auto_71542 ) ) ( not ( = ?auto_71548 ?auto_71544 ) ) ( not ( = ?auto_71548 ?auto_71543 ) ) ( not ( = ?auto_71548 ?auto_71542 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71549 ?auto_71545 ?auto_71546 ?auto_71547 ?auto_71548 ?auto_71544 ?auto_71543 )
      ( MAKE-2PILE ?auto_71542 ?auto_71543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71555 - BLOCK
      ?auto_71556 - BLOCK
      ?auto_71557 - BLOCK
      ?auto_71558 - BLOCK
      ?auto_71559 - BLOCK
    )
    :vars
    (
      ?auto_71560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71560 ?auto_71559 ) ( CLEAR ?auto_71560 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71555 ) ( ON ?auto_71556 ?auto_71555 ) ( ON ?auto_71557 ?auto_71556 ) ( ON ?auto_71558 ?auto_71557 ) ( ON ?auto_71559 ?auto_71558 ) ( not ( = ?auto_71555 ?auto_71556 ) ) ( not ( = ?auto_71555 ?auto_71557 ) ) ( not ( = ?auto_71555 ?auto_71558 ) ) ( not ( = ?auto_71555 ?auto_71559 ) ) ( not ( = ?auto_71555 ?auto_71560 ) ) ( not ( = ?auto_71556 ?auto_71557 ) ) ( not ( = ?auto_71556 ?auto_71558 ) ) ( not ( = ?auto_71556 ?auto_71559 ) ) ( not ( = ?auto_71556 ?auto_71560 ) ) ( not ( = ?auto_71557 ?auto_71558 ) ) ( not ( = ?auto_71557 ?auto_71559 ) ) ( not ( = ?auto_71557 ?auto_71560 ) ) ( not ( = ?auto_71558 ?auto_71559 ) ) ( not ( = ?auto_71558 ?auto_71560 ) ) ( not ( = ?auto_71559 ?auto_71560 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71560 ?auto_71559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71561 - BLOCK
      ?auto_71562 - BLOCK
      ?auto_71563 - BLOCK
      ?auto_71564 - BLOCK
      ?auto_71565 - BLOCK
    )
    :vars
    (
      ?auto_71566 - BLOCK
      ?auto_71567 - BLOCK
      ?auto_71568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71566 ?auto_71565 ) ( CLEAR ?auto_71566 ) ( ON-TABLE ?auto_71561 ) ( ON ?auto_71562 ?auto_71561 ) ( ON ?auto_71563 ?auto_71562 ) ( ON ?auto_71564 ?auto_71563 ) ( ON ?auto_71565 ?auto_71564 ) ( not ( = ?auto_71561 ?auto_71562 ) ) ( not ( = ?auto_71561 ?auto_71563 ) ) ( not ( = ?auto_71561 ?auto_71564 ) ) ( not ( = ?auto_71561 ?auto_71565 ) ) ( not ( = ?auto_71561 ?auto_71566 ) ) ( not ( = ?auto_71562 ?auto_71563 ) ) ( not ( = ?auto_71562 ?auto_71564 ) ) ( not ( = ?auto_71562 ?auto_71565 ) ) ( not ( = ?auto_71562 ?auto_71566 ) ) ( not ( = ?auto_71563 ?auto_71564 ) ) ( not ( = ?auto_71563 ?auto_71565 ) ) ( not ( = ?auto_71563 ?auto_71566 ) ) ( not ( = ?auto_71564 ?auto_71565 ) ) ( not ( = ?auto_71564 ?auto_71566 ) ) ( not ( = ?auto_71565 ?auto_71566 ) ) ( HOLDING ?auto_71567 ) ( CLEAR ?auto_71568 ) ( not ( = ?auto_71561 ?auto_71567 ) ) ( not ( = ?auto_71561 ?auto_71568 ) ) ( not ( = ?auto_71562 ?auto_71567 ) ) ( not ( = ?auto_71562 ?auto_71568 ) ) ( not ( = ?auto_71563 ?auto_71567 ) ) ( not ( = ?auto_71563 ?auto_71568 ) ) ( not ( = ?auto_71564 ?auto_71567 ) ) ( not ( = ?auto_71564 ?auto_71568 ) ) ( not ( = ?auto_71565 ?auto_71567 ) ) ( not ( = ?auto_71565 ?auto_71568 ) ) ( not ( = ?auto_71566 ?auto_71567 ) ) ( not ( = ?auto_71566 ?auto_71568 ) ) ( not ( = ?auto_71567 ?auto_71568 ) ) )
    :subtasks
    ( ( !STACK ?auto_71567 ?auto_71568 )
      ( MAKE-5PILE ?auto_71561 ?auto_71562 ?auto_71563 ?auto_71564 ?auto_71565 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72487 - BLOCK
      ?auto_72488 - BLOCK
      ?auto_72489 - BLOCK
      ?auto_72490 - BLOCK
      ?auto_72491 - BLOCK
    )
    :vars
    (
      ?auto_72492 - BLOCK
      ?auto_72493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72492 ?auto_72491 ) ( ON-TABLE ?auto_72487 ) ( ON ?auto_72488 ?auto_72487 ) ( ON ?auto_72489 ?auto_72488 ) ( ON ?auto_72490 ?auto_72489 ) ( ON ?auto_72491 ?auto_72490 ) ( not ( = ?auto_72487 ?auto_72488 ) ) ( not ( = ?auto_72487 ?auto_72489 ) ) ( not ( = ?auto_72487 ?auto_72490 ) ) ( not ( = ?auto_72487 ?auto_72491 ) ) ( not ( = ?auto_72487 ?auto_72492 ) ) ( not ( = ?auto_72488 ?auto_72489 ) ) ( not ( = ?auto_72488 ?auto_72490 ) ) ( not ( = ?auto_72488 ?auto_72491 ) ) ( not ( = ?auto_72488 ?auto_72492 ) ) ( not ( = ?auto_72489 ?auto_72490 ) ) ( not ( = ?auto_72489 ?auto_72491 ) ) ( not ( = ?auto_72489 ?auto_72492 ) ) ( not ( = ?auto_72490 ?auto_72491 ) ) ( not ( = ?auto_72490 ?auto_72492 ) ) ( not ( = ?auto_72491 ?auto_72492 ) ) ( not ( = ?auto_72487 ?auto_72493 ) ) ( not ( = ?auto_72488 ?auto_72493 ) ) ( not ( = ?auto_72489 ?auto_72493 ) ) ( not ( = ?auto_72490 ?auto_72493 ) ) ( not ( = ?auto_72491 ?auto_72493 ) ) ( not ( = ?auto_72492 ?auto_72493 ) ) ( ON ?auto_72493 ?auto_72492 ) ( CLEAR ?auto_72493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72487 ?auto_72488 ?auto_72489 ?auto_72490 ?auto_72491 ?auto_72492 )
      ( MAKE-5PILE ?auto_72487 ?auto_72488 ?auto_72489 ?auto_72490 ?auto_72491 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71577 - BLOCK
      ?auto_71578 - BLOCK
      ?auto_71579 - BLOCK
      ?auto_71580 - BLOCK
      ?auto_71581 - BLOCK
    )
    :vars
    (
      ?auto_71584 - BLOCK
      ?auto_71582 - BLOCK
      ?auto_71583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71584 ?auto_71581 ) ( ON-TABLE ?auto_71577 ) ( ON ?auto_71578 ?auto_71577 ) ( ON ?auto_71579 ?auto_71578 ) ( ON ?auto_71580 ?auto_71579 ) ( ON ?auto_71581 ?auto_71580 ) ( not ( = ?auto_71577 ?auto_71578 ) ) ( not ( = ?auto_71577 ?auto_71579 ) ) ( not ( = ?auto_71577 ?auto_71580 ) ) ( not ( = ?auto_71577 ?auto_71581 ) ) ( not ( = ?auto_71577 ?auto_71584 ) ) ( not ( = ?auto_71578 ?auto_71579 ) ) ( not ( = ?auto_71578 ?auto_71580 ) ) ( not ( = ?auto_71578 ?auto_71581 ) ) ( not ( = ?auto_71578 ?auto_71584 ) ) ( not ( = ?auto_71579 ?auto_71580 ) ) ( not ( = ?auto_71579 ?auto_71581 ) ) ( not ( = ?auto_71579 ?auto_71584 ) ) ( not ( = ?auto_71580 ?auto_71581 ) ) ( not ( = ?auto_71580 ?auto_71584 ) ) ( not ( = ?auto_71581 ?auto_71584 ) ) ( not ( = ?auto_71577 ?auto_71582 ) ) ( not ( = ?auto_71577 ?auto_71583 ) ) ( not ( = ?auto_71578 ?auto_71582 ) ) ( not ( = ?auto_71578 ?auto_71583 ) ) ( not ( = ?auto_71579 ?auto_71582 ) ) ( not ( = ?auto_71579 ?auto_71583 ) ) ( not ( = ?auto_71580 ?auto_71582 ) ) ( not ( = ?auto_71580 ?auto_71583 ) ) ( not ( = ?auto_71581 ?auto_71582 ) ) ( not ( = ?auto_71581 ?auto_71583 ) ) ( not ( = ?auto_71584 ?auto_71582 ) ) ( not ( = ?auto_71584 ?auto_71583 ) ) ( not ( = ?auto_71582 ?auto_71583 ) ) ( ON ?auto_71582 ?auto_71584 ) ( CLEAR ?auto_71582 ) ( HOLDING ?auto_71583 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71583 )
      ( MAKE-5PILE ?auto_71577 ?auto_71578 ?auto_71579 ?auto_71580 ?auto_71581 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71585 - BLOCK
      ?auto_71586 - BLOCK
      ?auto_71587 - BLOCK
      ?auto_71588 - BLOCK
      ?auto_71589 - BLOCK
    )
    :vars
    (
      ?auto_71592 - BLOCK
      ?auto_71590 - BLOCK
      ?auto_71591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71592 ?auto_71589 ) ( ON-TABLE ?auto_71585 ) ( ON ?auto_71586 ?auto_71585 ) ( ON ?auto_71587 ?auto_71586 ) ( ON ?auto_71588 ?auto_71587 ) ( ON ?auto_71589 ?auto_71588 ) ( not ( = ?auto_71585 ?auto_71586 ) ) ( not ( = ?auto_71585 ?auto_71587 ) ) ( not ( = ?auto_71585 ?auto_71588 ) ) ( not ( = ?auto_71585 ?auto_71589 ) ) ( not ( = ?auto_71585 ?auto_71592 ) ) ( not ( = ?auto_71586 ?auto_71587 ) ) ( not ( = ?auto_71586 ?auto_71588 ) ) ( not ( = ?auto_71586 ?auto_71589 ) ) ( not ( = ?auto_71586 ?auto_71592 ) ) ( not ( = ?auto_71587 ?auto_71588 ) ) ( not ( = ?auto_71587 ?auto_71589 ) ) ( not ( = ?auto_71587 ?auto_71592 ) ) ( not ( = ?auto_71588 ?auto_71589 ) ) ( not ( = ?auto_71588 ?auto_71592 ) ) ( not ( = ?auto_71589 ?auto_71592 ) ) ( not ( = ?auto_71585 ?auto_71590 ) ) ( not ( = ?auto_71585 ?auto_71591 ) ) ( not ( = ?auto_71586 ?auto_71590 ) ) ( not ( = ?auto_71586 ?auto_71591 ) ) ( not ( = ?auto_71587 ?auto_71590 ) ) ( not ( = ?auto_71587 ?auto_71591 ) ) ( not ( = ?auto_71588 ?auto_71590 ) ) ( not ( = ?auto_71588 ?auto_71591 ) ) ( not ( = ?auto_71589 ?auto_71590 ) ) ( not ( = ?auto_71589 ?auto_71591 ) ) ( not ( = ?auto_71592 ?auto_71590 ) ) ( not ( = ?auto_71592 ?auto_71591 ) ) ( not ( = ?auto_71590 ?auto_71591 ) ) ( ON ?auto_71590 ?auto_71592 ) ( ON ?auto_71591 ?auto_71590 ) ( CLEAR ?auto_71591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71585 ?auto_71586 ?auto_71587 ?auto_71588 ?auto_71589 ?auto_71592 ?auto_71590 )
      ( MAKE-5PILE ?auto_71585 ?auto_71586 ?auto_71587 ?auto_71588 ?auto_71589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71596 - BLOCK
      ?auto_71597 - BLOCK
      ?auto_71598 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71598 ) ( CLEAR ?auto_71597 ) ( ON-TABLE ?auto_71596 ) ( ON ?auto_71597 ?auto_71596 ) ( not ( = ?auto_71596 ?auto_71597 ) ) ( not ( = ?auto_71596 ?auto_71598 ) ) ( not ( = ?auto_71597 ?auto_71598 ) ) )
    :subtasks
    ( ( !STACK ?auto_71598 ?auto_71597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71599 - BLOCK
      ?auto_71600 - BLOCK
      ?auto_71601 - BLOCK
    )
    :vars
    (
      ?auto_71602 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71600 ) ( ON-TABLE ?auto_71599 ) ( ON ?auto_71600 ?auto_71599 ) ( not ( = ?auto_71599 ?auto_71600 ) ) ( not ( = ?auto_71599 ?auto_71601 ) ) ( not ( = ?auto_71600 ?auto_71601 ) ) ( ON ?auto_71601 ?auto_71602 ) ( CLEAR ?auto_71601 ) ( HAND-EMPTY ) ( not ( = ?auto_71599 ?auto_71602 ) ) ( not ( = ?auto_71600 ?auto_71602 ) ) ( not ( = ?auto_71601 ?auto_71602 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71601 ?auto_71602 )
      ( MAKE-3PILE ?auto_71599 ?auto_71600 ?auto_71601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71603 - BLOCK
      ?auto_71604 - BLOCK
      ?auto_71605 - BLOCK
    )
    :vars
    (
      ?auto_71606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71603 ) ( not ( = ?auto_71603 ?auto_71604 ) ) ( not ( = ?auto_71603 ?auto_71605 ) ) ( not ( = ?auto_71604 ?auto_71605 ) ) ( ON ?auto_71605 ?auto_71606 ) ( CLEAR ?auto_71605 ) ( not ( = ?auto_71603 ?auto_71606 ) ) ( not ( = ?auto_71604 ?auto_71606 ) ) ( not ( = ?auto_71605 ?auto_71606 ) ) ( HOLDING ?auto_71604 ) ( CLEAR ?auto_71603 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71603 ?auto_71604 )
      ( MAKE-3PILE ?auto_71603 ?auto_71604 ?auto_71605 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71607 - BLOCK
      ?auto_71608 - BLOCK
      ?auto_71609 - BLOCK
    )
    :vars
    (
      ?auto_71610 - BLOCK
      ?auto_71613 - BLOCK
      ?auto_71612 - BLOCK
      ?auto_71614 - BLOCK
      ?auto_71611 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71607 ) ( not ( = ?auto_71607 ?auto_71608 ) ) ( not ( = ?auto_71607 ?auto_71609 ) ) ( not ( = ?auto_71608 ?auto_71609 ) ) ( ON ?auto_71609 ?auto_71610 ) ( not ( = ?auto_71607 ?auto_71610 ) ) ( not ( = ?auto_71608 ?auto_71610 ) ) ( not ( = ?auto_71609 ?auto_71610 ) ) ( CLEAR ?auto_71607 ) ( ON ?auto_71608 ?auto_71609 ) ( CLEAR ?auto_71608 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71613 ) ( ON ?auto_71612 ?auto_71613 ) ( ON ?auto_71614 ?auto_71612 ) ( ON ?auto_71611 ?auto_71614 ) ( ON ?auto_71610 ?auto_71611 ) ( not ( = ?auto_71613 ?auto_71612 ) ) ( not ( = ?auto_71613 ?auto_71614 ) ) ( not ( = ?auto_71613 ?auto_71611 ) ) ( not ( = ?auto_71613 ?auto_71610 ) ) ( not ( = ?auto_71613 ?auto_71609 ) ) ( not ( = ?auto_71613 ?auto_71608 ) ) ( not ( = ?auto_71612 ?auto_71614 ) ) ( not ( = ?auto_71612 ?auto_71611 ) ) ( not ( = ?auto_71612 ?auto_71610 ) ) ( not ( = ?auto_71612 ?auto_71609 ) ) ( not ( = ?auto_71612 ?auto_71608 ) ) ( not ( = ?auto_71614 ?auto_71611 ) ) ( not ( = ?auto_71614 ?auto_71610 ) ) ( not ( = ?auto_71614 ?auto_71609 ) ) ( not ( = ?auto_71614 ?auto_71608 ) ) ( not ( = ?auto_71611 ?auto_71610 ) ) ( not ( = ?auto_71611 ?auto_71609 ) ) ( not ( = ?auto_71611 ?auto_71608 ) ) ( not ( = ?auto_71607 ?auto_71613 ) ) ( not ( = ?auto_71607 ?auto_71612 ) ) ( not ( = ?auto_71607 ?auto_71614 ) ) ( not ( = ?auto_71607 ?auto_71611 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71613 ?auto_71612 ?auto_71614 ?auto_71611 ?auto_71610 ?auto_71609 )
      ( MAKE-3PILE ?auto_71607 ?auto_71608 ?auto_71609 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71615 - BLOCK
      ?auto_71616 - BLOCK
      ?auto_71617 - BLOCK
    )
    :vars
    (
      ?auto_71621 - BLOCK
      ?auto_71618 - BLOCK
      ?auto_71619 - BLOCK
      ?auto_71620 - BLOCK
      ?auto_71622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71615 ?auto_71616 ) ) ( not ( = ?auto_71615 ?auto_71617 ) ) ( not ( = ?auto_71616 ?auto_71617 ) ) ( ON ?auto_71617 ?auto_71621 ) ( not ( = ?auto_71615 ?auto_71621 ) ) ( not ( = ?auto_71616 ?auto_71621 ) ) ( not ( = ?auto_71617 ?auto_71621 ) ) ( ON ?auto_71616 ?auto_71617 ) ( CLEAR ?auto_71616 ) ( ON-TABLE ?auto_71618 ) ( ON ?auto_71619 ?auto_71618 ) ( ON ?auto_71620 ?auto_71619 ) ( ON ?auto_71622 ?auto_71620 ) ( ON ?auto_71621 ?auto_71622 ) ( not ( = ?auto_71618 ?auto_71619 ) ) ( not ( = ?auto_71618 ?auto_71620 ) ) ( not ( = ?auto_71618 ?auto_71622 ) ) ( not ( = ?auto_71618 ?auto_71621 ) ) ( not ( = ?auto_71618 ?auto_71617 ) ) ( not ( = ?auto_71618 ?auto_71616 ) ) ( not ( = ?auto_71619 ?auto_71620 ) ) ( not ( = ?auto_71619 ?auto_71622 ) ) ( not ( = ?auto_71619 ?auto_71621 ) ) ( not ( = ?auto_71619 ?auto_71617 ) ) ( not ( = ?auto_71619 ?auto_71616 ) ) ( not ( = ?auto_71620 ?auto_71622 ) ) ( not ( = ?auto_71620 ?auto_71621 ) ) ( not ( = ?auto_71620 ?auto_71617 ) ) ( not ( = ?auto_71620 ?auto_71616 ) ) ( not ( = ?auto_71622 ?auto_71621 ) ) ( not ( = ?auto_71622 ?auto_71617 ) ) ( not ( = ?auto_71622 ?auto_71616 ) ) ( not ( = ?auto_71615 ?auto_71618 ) ) ( not ( = ?auto_71615 ?auto_71619 ) ) ( not ( = ?auto_71615 ?auto_71620 ) ) ( not ( = ?auto_71615 ?auto_71622 ) ) ( HOLDING ?auto_71615 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71615 )
      ( MAKE-3PILE ?auto_71615 ?auto_71616 ?auto_71617 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71623 - BLOCK
      ?auto_71624 - BLOCK
      ?auto_71625 - BLOCK
    )
    :vars
    (
      ?auto_71629 - BLOCK
      ?auto_71630 - BLOCK
      ?auto_71627 - BLOCK
      ?auto_71628 - BLOCK
      ?auto_71626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71623 ?auto_71624 ) ) ( not ( = ?auto_71623 ?auto_71625 ) ) ( not ( = ?auto_71624 ?auto_71625 ) ) ( ON ?auto_71625 ?auto_71629 ) ( not ( = ?auto_71623 ?auto_71629 ) ) ( not ( = ?auto_71624 ?auto_71629 ) ) ( not ( = ?auto_71625 ?auto_71629 ) ) ( ON ?auto_71624 ?auto_71625 ) ( ON-TABLE ?auto_71630 ) ( ON ?auto_71627 ?auto_71630 ) ( ON ?auto_71628 ?auto_71627 ) ( ON ?auto_71626 ?auto_71628 ) ( ON ?auto_71629 ?auto_71626 ) ( not ( = ?auto_71630 ?auto_71627 ) ) ( not ( = ?auto_71630 ?auto_71628 ) ) ( not ( = ?auto_71630 ?auto_71626 ) ) ( not ( = ?auto_71630 ?auto_71629 ) ) ( not ( = ?auto_71630 ?auto_71625 ) ) ( not ( = ?auto_71630 ?auto_71624 ) ) ( not ( = ?auto_71627 ?auto_71628 ) ) ( not ( = ?auto_71627 ?auto_71626 ) ) ( not ( = ?auto_71627 ?auto_71629 ) ) ( not ( = ?auto_71627 ?auto_71625 ) ) ( not ( = ?auto_71627 ?auto_71624 ) ) ( not ( = ?auto_71628 ?auto_71626 ) ) ( not ( = ?auto_71628 ?auto_71629 ) ) ( not ( = ?auto_71628 ?auto_71625 ) ) ( not ( = ?auto_71628 ?auto_71624 ) ) ( not ( = ?auto_71626 ?auto_71629 ) ) ( not ( = ?auto_71626 ?auto_71625 ) ) ( not ( = ?auto_71626 ?auto_71624 ) ) ( not ( = ?auto_71623 ?auto_71630 ) ) ( not ( = ?auto_71623 ?auto_71627 ) ) ( not ( = ?auto_71623 ?auto_71628 ) ) ( not ( = ?auto_71623 ?auto_71626 ) ) ( ON ?auto_71623 ?auto_71624 ) ( CLEAR ?auto_71623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71630 ?auto_71627 ?auto_71628 ?auto_71626 ?auto_71629 ?auto_71625 ?auto_71624 )
      ( MAKE-3PILE ?auto_71623 ?auto_71624 ?auto_71625 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71635 - BLOCK
      ?auto_71636 - BLOCK
      ?auto_71637 - BLOCK
      ?auto_71638 - BLOCK
    )
    :vars
    (
      ?auto_71639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71639 ?auto_71638 ) ( CLEAR ?auto_71639 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71635 ) ( ON ?auto_71636 ?auto_71635 ) ( ON ?auto_71637 ?auto_71636 ) ( ON ?auto_71638 ?auto_71637 ) ( not ( = ?auto_71635 ?auto_71636 ) ) ( not ( = ?auto_71635 ?auto_71637 ) ) ( not ( = ?auto_71635 ?auto_71638 ) ) ( not ( = ?auto_71635 ?auto_71639 ) ) ( not ( = ?auto_71636 ?auto_71637 ) ) ( not ( = ?auto_71636 ?auto_71638 ) ) ( not ( = ?auto_71636 ?auto_71639 ) ) ( not ( = ?auto_71637 ?auto_71638 ) ) ( not ( = ?auto_71637 ?auto_71639 ) ) ( not ( = ?auto_71638 ?auto_71639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71639 ?auto_71638 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71640 - BLOCK
      ?auto_71641 - BLOCK
      ?auto_71642 - BLOCK
      ?auto_71643 - BLOCK
    )
    :vars
    (
      ?auto_71644 - BLOCK
      ?auto_71645 - BLOCK
      ?auto_71646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71644 ?auto_71643 ) ( CLEAR ?auto_71644 ) ( ON-TABLE ?auto_71640 ) ( ON ?auto_71641 ?auto_71640 ) ( ON ?auto_71642 ?auto_71641 ) ( ON ?auto_71643 ?auto_71642 ) ( not ( = ?auto_71640 ?auto_71641 ) ) ( not ( = ?auto_71640 ?auto_71642 ) ) ( not ( = ?auto_71640 ?auto_71643 ) ) ( not ( = ?auto_71640 ?auto_71644 ) ) ( not ( = ?auto_71641 ?auto_71642 ) ) ( not ( = ?auto_71641 ?auto_71643 ) ) ( not ( = ?auto_71641 ?auto_71644 ) ) ( not ( = ?auto_71642 ?auto_71643 ) ) ( not ( = ?auto_71642 ?auto_71644 ) ) ( not ( = ?auto_71643 ?auto_71644 ) ) ( HOLDING ?auto_71645 ) ( CLEAR ?auto_71646 ) ( not ( = ?auto_71640 ?auto_71645 ) ) ( not ( = ?auto_71640 ?auto_71646 ) ) ( not ( = ?auto_71641 ?auto_71645 ) ) ( not ( = ?auto_71641 ?auto_71646 ) ) ( not ( = ?auto_71642 ?auto_71645 ) ) ( not ( = ?auto_71642 ?auto_71646 ) ) ( not ( = ?auto_71643 ?auto_71645 ) ) ( not ( = ?auto_71643 ?auto_71646 ) ) ( not ( = ?auto_71644 ?auto_71645 ) ) ( not ( = ?auto_71644 ?auto_71646 ) ) ( not ( = ?auto_71645 ?auto_71646 ) ) )
    :subtasks
    ( ( !STACK ?auto_71645 ?auto_71646 )
      ( MAKE-4PILE ?auto_71640 ?auto_71641 ?auto_71642 ?auto_71643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71647 - BLOCK
      ?auto_71648 - BLOCK
      ?auto_71649 - BLOCK
      ?auto_71650 - BLOCK
    )
    :vars
    (
      ?auto_71651 - BLOCK
      ?auto_71653 - BLOCK
      ?auto_71652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71651 ?auto_71650 ) ( ON-TABLE ?auto_71647 ) ( ON ?auto_71648 ?auto_71647 ) ( ON ?auto_71649 ?auto_71648 ) ( ON ?auto_71650 ?auto_71649 ) ( not ( = ?auto_71647 ?auto_71648 ) ) ( not ( = ?auto_71647 ?auto_71649 ) ) ( not ( = ?auto_71647 ?auto_71650 ) ) ( not ( = ?auto_71647 ?auto_71651 ) ) ( not ( = ?auto_71648 ?auto_71649 ) ) ( not ( = ?auto_71648 ?auto_71650 ) ) ( not ( = ?auto_71648 ?auto_71651 ) ) ( not ( = ?auto_71649 ?auto_71650 ) ) ( not ( = ?auto_71649 ?auto_71651 ) ) ( not ( = ?auto_71650 ?auto_71651 ) ) ( CLEAR ?auto_71653 ) ( not ( = ?auto_71647 ?auto_71652 ) ) ( not ( = ?auto_71647 ?auto_71653 ) ) ( not ( = ?auto_71648 ?auto_71652 ) ) ( not ( = ?auto_71648 ?auto_71653 ) ) ( not ( = ?auto_71649 ?auto_71652 ) ) ( not ( = ?auto_71649 ?auto_71653 ) ) ( not ( = ?auto_71650 ?auto_71652 ) ) ( not ( = ?auto_71650 ?auto_71653 ) ) ( not ( = ?auto_71651 ?auto_71652 ) ) ( not ( = ?auto_71651 ?auto_71653 ) ) ( not ( = ?auto_71652 ?auto_71653 ) ) ( ON ?auto_71652 ?auto_71651 ) ( CLEAR ?auto_71652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71647 ?auto_71648 ?auto_71649 ?auto_71650 ?auto_71651 )
      ( MAKE-4PILE ?auto_71647 ?auto_71648 ?auto_71649 ?auto_71650 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71654 - BLOCK
      ?auto_71655 - BLOCK
      ?auto_71656 - BLOCK
      ?auto_71657 - BLOCK
    )
    :vars
    (
      ?auto_71659 - BLOCK
      ?auto_71660 - BLOCK
      ?auto_71658 - BLOCK
      ?auto_71661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71659 ?auto_71657 ) ( ON-TABLE ?auto_71654 ) ( ON ?auto_71655 ?auto_71654 ) ( ON ?auto_71656 ?auto_71655 ) ( ON ?auto_71657 ?auto_71656 ) ( not ( = ?auto_71654 ?auto_71655 ) ) ( not ( = ?auto_71654 ?auto_71656 ) ) ( not ( = ?auto_71654 ?auto_71657 ) ) ( not ( = ?auto_71654 ?auto_71659 ) ) ( not ( = ?auto_71655 ?auto_71656 ) ) ( not ( = ?auto_71655 ?auto_71657 ) ) ( not ( = ?auto_71655 ?auto_71659 ) ) ( not ( = ?auto_71656 ?auto_71657 ) ) ( not ( = ?auto_71656 ?auto_71659 ) ) ( not ( = ?auto_71657 ?auto_71659 ) ) ( not ( = ?auto_71654 ?auto_71660 ) ) ( not ( = ?auto_71654 ?auto_71658 ) ) ( not ( = ?auto_71655 ?auto_71660 ) ) ( not ( = ?auto_71655 ?auto_71658 ) ) ( not ( = ?auto_71656 ?auto_71660 ) ) ( not ( = ?auto_71656 ?auto_71658 ) ) ( not ( = ?auto_71657 ?auto_71660 ) ) ( not ( = ?auto_71657 ?auto_71658 ) ) ( not ( = ?auto_71659 ?auto_71660 ) ) ( not ( = ?auto_71659 ?auto_71658 ) ) ( not ( = ?auto_71660 ?auto_71658 ) ) ( ON ?auto_71660 ?auto_71659 ) ( CLEAR ?auto_71660 ) ( HOLDING ?auto_71658 ) ( CLEAR ?auto_71661 ) ( ON-TABLE ?auto_71661 ) ( not ( = ?auto_71661 ?auto_71658 ) ) ( not ( = ?auto_71654 ?auto_71661 ) ) ( not ( = ?auto_71655 ?auto_71661 ) ) ( not ( = ?auto_71656 ?auto_71661 ) ) ( not ( = ?auto_71657 ?auto_71661 ) ) ( not ( = ?auto_71659 ?auto_71661 ) ) ( not ( = ?auto_71660 ?auto_71661 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71661 ?auto_71658 )
      ( MAKE-4PILE ?auto_71654 ?auto_71655 ?auto_71656 ?auto_71657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72716 - BLOCK
      ?auto_72717 - BLOCK
      ?auto_72718 - BLOCK
      ?auto_72719 - BLOCK
    )
    :vars
    (
      ?auto_72720 - BLOCK
      ?auto_72721 - BLOCK
      ?auto_72722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72720 ?auto_72719 ) ( ON-TABLE ?auto_72716 ) ( ON ?auto_72717 ?auto_72716 ) ( ON ?auto_72718 ?auto_72717 ) ( ON ?auto_72719 ?auto_72718 ) ( not ( = ?auto_72716 ?auto_72717 ) ) ( not ( = ?auto_72716 ?auto_72718 ) ) ( not ( = ?auto_72716 ?auto_72719 ) ) ( not ( = ?auto_72716 ?auto_72720 ) ) ( not ( = ?auto_72717 ?auto_72718 ) ) ( not ( = ?auto_72717 ?auto_72719 ) ) ( not ( = ?auto_72717 ?auto_72720 ) ) ( not ( = ?auto_72718 ?auto_72719 ) ) ( not ( = ?auto_72718 ?auto_72720 ) ) ( not ( = ?auto_72719 ?auto_72720 ) ) ( not ( = ?auto_72716 ?auto_72721 ) ) ( not ( = ?auto_72716 ?auto_72722 ) ) ( not ( = ?auto_72717 ?auto_72721 ) ) ( not ( = ?auto_72717 ?auto_72722 ) ) ( not ( = ?auto_72718 ?auto_72721 ) ) ( not ( = ?auto_72718 ?auto_72722 ) ) ( not ( = ?auto_72719 ?auto_72721 ) ) ( not ( = ?auto_72719 ?auto_72722 ) ) ( not ( = ?auto_72720 ?auto_72721 ) ) ( not ( = ?auto_72720 ?auto_72722 ) ) ( not ( = ?auto_72721 ?auto_72722 ) ) ( ON ?auto_72721 ?auto_72720 ) ( ON ?auto_72722 ?auto_72721 ) ( CLEAR ?auto_72722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72716 ?auto_72717 ?auto_72718 ?auto_72719 ?auto_72720 ?auto_72721 )
      ( MAKE-4PILE ?auto_72716 ?auto_72717 ?auto_72718 ?auto_72719 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71670 - BLOCK
      ?auto_71671 - BLOCK
      ?auto_71672 - BLOCK
      ?auto_71673 - BLOCK
    )
    :vars
    (
      ?auto_71675 - BLOCK
      ?auto_71677 - BLOCK
      ?auto_71674 - BLOCK
      ?auto_71676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71675 ?auto_71673 ) ( ON-TABLE ?auto_71670 ) ( ON ?auto_71671 ?auto_71670 ) ( ON ?auto_71672 ?auto_71671 ) ( ON ?auto_71673 ?auto_71672 ) ( not ( = ?auto_71670 ?auto_71671 ) ) ( not ( = ?auto_71670 ?auto_71672 ) ) ( not ( = ?auto_71670 ?auto_71673 ) ) ( not ( = ?auto_71670 ?auto_71675 ) ) ( not ( = ?auto_71671 ?auto_71672 ) ) ( not ( = ?auto_71671 ?auto_71673 ) ) ( not ( = ?auto_71671 ?auto_71675 ) ) ( not ( = ?auto_71672 ?auto_71673 ) ) ( not ( = ?auto_71672 ?auto_71675 ) ) ( not ( = ?auto_71673 ?auto_71675 ) ) ( not ( = ?auto_71670 ?auto_71677 ) ) ( not ( = ?auto_71670 ?auto_71674 ) ) ( not ( = ?auto_71671 ?auto_71677 ) ) ( not ( = ?auto_71671 ?auto_71674 ) ) ( not ( = ?auto_71672 ?auto_71677 ) ) ( not ( = ?auto_71672 ?auto_71674 ) ) ( not ( = ?auto_71673 ?auto_71677 ) ) ( not ( = ?auto_71673 ?auto_71674 ) ) ( not ( = ?auto_71675 ?auto_71677 ) ) ( not ( = ?auto_71675 ?auto_71674 ) ) ( not ( = ?auto_71677 ?auto_71674 ) ) ( ON ?auto_71677 ?auto_71675 ) ( not ( = ?auto_71676 ?auto_71674 ) ) ( not ( = ?auto_71670 ?auto_71676 ) ) ( not ( = ?auto_71671 ?auto_71676 ) ) ( not ( = ?auto_71672 ?auto_71676 ) ) ( not ( = ?auto_71673 ?auto_71676 ) ) ( not ( = ?auto_71675 ?auto_71676 ) ) ( not ( = ?auto_71677 ?auto_71676 ) ) ( ON ?auto_71674 ?auto_71677 ) ( CLEAR ?auto_71674 ) ( HOLDING ?auto_71676 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71676 )
      ( MAKE-4PILE ?auto_71670 ?auto_71671 ?auto_71672 ?auto_71673 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71678 - BLOCK
      ?auto_71679 - BLOCK
      ?auto_71680 - BLOCK
      ?auto_71681 - BLOCK
    )
    :vars
    (
      ?auto_71684 - BLOCK
      ?auto_71682 - BLOCK
      ?auto_71685 - BLOCK
      ?auto_71683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71684 ?auto_71681 ) ( ON-TABLE ?auto_71678 ) ( ON ?auto_71679 ?auto_71678 ) ( ON ?auto_71680 ?auto_71679 ) ( ON ?auto_71681 ?auto_71680 ) ( not ( = ?auto_71678 ?auto_71679 ) ) ( not ( = ?auto_71678 ?auto_71680 ) ) ( not ( = ?auto_71678 ?auto_71681 ) ) ( not ( = ?auto_71678 ?auto_71684 ) ) ( not ( = ?auto_71679 ?auto_71680 ) ) ( not ( = ?auto_71679 ?auto_71681 ) ) ( not ( = ?auto_71679 ?auto_71684 ) ) ( not ( = ?auto_71680 ?auto_71681 ) ) ( not ( = ?auto_71680 ?auto_71684 ) ) ( not ( = ?auto_71681 ?auto_71684 ) ) ( not ( = ?auto_71678 ?auto_71682 ) ) ( not ( = ?auto_71678 ?auto_71685 ) ) ( not ( = ?auto_71679 ?auto_71682 ) ) ( not ( = ?auto_71679 ?auto_71685 ) ) ( not ( = ?auto_71680 ?auto_71682 ) ) ( not ( = ?auto_71680 ?auto_71685 ) ) ( not ( = ?auto_71681 ?auto_71682 ) ) ( not ( = ?auto_71681 ?auto_71685 ) ) ( not ( = ?auto_71684 ?auto_71682 ) ) ( not ( = ?auto_71684 ?auto_71685 ) ) ( not ( = ?auto_71682 ?auto_71685 ) ) ( ON ?auto_71682 ?auto_71684 ) ( not ( = ?auto_71683 ?auto_71685 ) ) ( not ( = ?auto_71678 ?auto_71683 ) ) ( not ( = ?auto_71679 ?auto_71683 ) ) ( not ( = ?auto_71680 ?auto_71683 ) ) ( not ( = ?auto_71681 ?auto_71683 ) ) ( not ( = ?auto_71684 ?auto_71683 ) ) ( not ( = ?auto_71682 ?auto_71683 ) ) ( ON ?auto_71685 ?auto_71682 ) ( ON ?auto_71683 ?auto_71685 ) ( CLEAR ?auto_71683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71678 ?auto_71679 ?auto_71680 ?auto_71681 ?auto_71684 ?auto_71682 ?auto_71685 )
      ( MAKE-4PILE ?auto_71678 ?auto_71679 ?auto_71680 ?auto_71681 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71690 - BLOCK
      ?auto_71691 - BLOCK
      ?auto_71692 - BLOCK
      ?auto_71693 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71693 ) ( CLEAR ?auto_71692 ) ( ON-TABLE ?auto_71690 ) ( ON ?auto_71691 ?auto_71690 ) ( ON ?auto_71692 ?auto_71691 ) ( not ( = ?auto_71690 ?auto_71691 ) ) ( not ( = ?auto_71690 ?auto_71692 ) ) ( not ( = ?auto_71690 ?auto_71693 ) ) ( not ( = ?auto_71691 ?auto_71692 ) ) ( not ( = ?auto_71691 ?auto_71693 ) ) ( not ( = ?auto_71692 ?auto_71693 ) ) )
    :subtasks
    ( ( !STACK ?auto_71693 ?auto_71692 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71694 - BLOCK
      ?auto_71695 - BLOCK
      ?auto_71696 - BLOCK
      ?auto_71697 - BLOCK
    )
    :vars
    (
      ?auto_71698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71696 ) ( ON-TABLE ?auto_71694 ) ( ON ?auto_71695 ?auto_71694 ) ( ON ?auto_71696 ?auto_71695 ) ( not ( = ?auto_71694 ?auto_71695 ) ) ( not ( = ?auto_71694 ?auto_71696 ) ) ( not ( = ?auto_71694 ?auto_71697 ) ) ( not ( = ?auto_71695 ?auto_71696 ) ) ( not ( = ?auto_71695 ?auto_71697 ) ) ( not ( = ?auto_71696 ?auto_71697 ) ) ( ON ?auto_71697 ?auto_71698 ) ( CLEAR ?auto_71697 ) ( HAND-EMPTY ) ( not ( = ?auto_71694 ?auto_71698 ) ) ( not ( = ?auto_71695 ?auto_71698 ) ) ( not ( = ?auto_71696 ?auto_71698 ) ) ( not ( = ?auto_71697 ?auto_71698 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71697 ?auto_71698 )
      ( MAKE-4PILE ?auto_71694 ?auto_71695 ?auto_71696 ?auto_71697 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71699 - BLOCK
      ?auto_71700 - BLOCK
      ?auto_71701 - BLOCK
      ?auto_71702 - BLOCK
    )
    :vars
    (
      ?auto_71703 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71699 ) ( ON ?auto_71700 ?auto_71699 ) ( not ( = ?auto_71699 ?auto_71700 ) ) ( not ( = ?auto_71699 ?auto_71701 ) ) ( not ( = ?auto_71699 ?auto_71702 ) ) ( not ( = ?auto_71700 ?auto_71701 ) ) ( not ( = ?auto_71700 ?auto_71702 ) ) ( not ( = ?auto_71701 ?auto_71702 ) ) ( ON ?auto_71702 ?auto_71703 ) ( CLEAR ?auto_71702 ) ( not ( = ?auto_71699 ?auto_71703 ) ) ( not ( = ?auto_71700 ?auto_71703 ) ) ( not ( = ?auto_71701 ?auto_71703 ) ) ( not ( = ?auto_71702 ?auto_71703 ) ) ( HOLDING ?auto_71701 ) ( CLEAR ?auto_71700 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71699 ?auto_71700 ?auto_71701 )
      ( MAKE-4PILE ?auto_71699 ?auto_71700 ?auto_71701 ?auto_71702 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71704 - BLOCK
      ?auto_71705 - BLOCK
      ?auto_71706 - BLOCK
      ?auto_71707 - BLOCK
    )
    :vars
    (
      ?auto_71708 - BLOCK
      ?auto_71711 - BLOCK
      ?auto_71710 - BLOCK
      ?auto_71709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71704 ) ( ON ?auto_71705 ?auto_71704 ) ( not ( = ?auto_71704 ?auto_71705 ) ) ( not ( = ?auto_71704 ?auto_71706 ) ) ( not ( = ?auto_71704 ?auto_71707 ) ) ( not ( = ?auto_71705 ?auto_71706 ) ) ( not ( = ?auto_71705 ?auto_71707 ) ) ( not ( = ?auto_71706 ?auto_71707 ) ) ( ON ?auto_71707 ?auto_71708 ) ( not ( = ?auto_71704 ?auto_71708 ) ) ( not ( = ?auto_71705 ?auto_71708 ) ) ( not ( = ?auto_71706 ?auto_71708 ) ) ( not ( = ?auto_71707 ?auto_71708 ) ) ( CLEAR ?auto_71705 ) ( ON ?auto_71706 ?auto_71707 ) ( CLEAR ?auto_71706 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71711 ) ( ON ?auto_71710 ?auto_71711 ) ( ON ?auto_71709 ?auto_71710 ) ( ON ?auto_71708 ?auto_71709 ) ( not ( = ?auto_71711 ?auto_71710 ) ) ( not ( = ?auto_71711 ?auto_71709 ) ) ( not ( = ?auto_71711 ?auto_71708 ) ) ( not ( = ?auto_71711 ?auto_71707 ) ) ( not ( = ?auto_71711 ?auto_71706 ) ) ( not ( = ?auto_71710 ?auto_71709 ) ) ( not ( = ?auto_71710 ?auto_71708 ) ) ( not ( = ?auto_71710 ?auto_71707 ) ) ( not ( = ?auto_71710 ?auto_71706 ) ) ( not ( = ?auto_71709 ?auto_71708 ) ) ( not ( = ?auto_71709 ?auto_71707 ) ) ( not ( = ?auto_71709 ?auto_71706 ) ) ( not ( = ?auto_71704 ?auto_71711 ) ) ( not ( = ?auto_71704 ?auto_71710 ) ) ( not ( = ?auto_71704 ?auto_71709 ) ) ( not ( = ?auto_71705 ?auto_71711 ) ) ( not ( = ?auto_71705 ?auto_71710 ) ) ( not ( = ?auto_71705 ?auto_71709 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71711 ?auto_71710 ?auto_71709 ?auto_71708 ?auto_71707 )
      ( MAKE-4PILE ?auto_71704 ?auto_71705 ?auto_71706 ?auto_71707 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71712 - BLOCK
      ?auto_71713 - BLOCK
      ?auto_71714 - BLOCK
      ?auto_71715 - BLOCK
    )
    :vars
    (
      ?auto_71719 - BLOCK
      ?auto_71718 - BLOCK
      ?auto_71717 - BLOCK
      ?auto_71716 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71712 ) ( not ( = ?auto_71712 ?auto_71713 ) ) ( not ( = ?auto_71712 ?auto_71714 ) ) ( not ( = ?auto_71712 ?auto_71715 ) ) ( not ( = ?auto_71713 ?auto_71714 ) ) ( not ( = ?auto_71713 ?auto_71715 ) ) ( not ( = ?auto_71714 ?auto_71715 ) ) ( ON ?auto_71715 ?auto_71719 ) ( not ( = ?auto_71712 ?auto_71719 ) ) ( not ( = ?auto_71713 ?auto_71719 ) ) ( not ( = ?auto_71714 ?auto_71719 ) ) ( not ( = ?auto_71715 ?auto_71719 ) ) ( ON ?auto_71714 ?auto_71715 ) ( CLEAR ?auto_71714 ) ( ON-TABLE ?auto_71718 ) ( ON ?auto_71717 ?auto_71718 ) ( ON ?auto_71716 ?auto_71717 ) ( ON ?auto_71719 ?auto_71716 ) ( not ( = ?auto_71718 ?auto_71717 ) ) ( not ( = ?auto_71718 ?auto_71716 ) ) ( not ( = ?auto_71718 ?auto_71719 ) ) ( not ( = ?auto_71718 ?auto_71715 ) ) ( not ( = ?auto_71718 ?auto_71714 ) ) ( not ( = ?auto_71717 ?auto_71716 ) ) ( not ( = ?auto_71717 ?auto_71719 ) ) ( not ( = ?auto_71717 ?auto_71715 ) ) ( not ( = ?auto_71717 ?auto_71714 ) ) ( not ( = ?auto_71716 ?auto_71719 ) ) ( not ( = ?auto_71716 ?auto_71715 ) ) ( not ( = ?auto_71716 ?auto_71714 ) ) ( not ( = ?auto_71712 ?auto_71718 ) ) ( not ( = ?auto_71712 ?auto_71717 ) ) ( not ( = ?auto_71712 ?auto_71716 ) ) ( not ( = ?auto_71713 ?auto_71718 ) ) ( not ( = ?auto_71713 ?auto_71717 ) ) ( not ( = ?auto_71713 ?auto_71716 ) ) ( HOLDING ?auto_71713 ) ( CLEAR ?auto_71712 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71712 ?auto_71713 )
      ( MAKE-4PILE ?auto_71712 ?auto_71713 ?auto_71714 ?auto_71715 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71720 - BLOCK
      ?auto_71721 - BLOCK
      ?auto_71722 - BLOCK
      ?auto_71723 - BLOCK
    )
    :vars
    (
      ?auto_71727 - BLOCK
      ?auto_71725 - BLOCK
      ?auto_71726 - BLOCK
      ?auto_71724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71720 ) ( not ( = ?auto_71720 ?auto_71721 ) ) ( not ( = ?auto_71720 ?auto_71722 ) ) ( not ( = ?auto_71720 ?auto_71723 ) ) ( not ( = ?auto_71721 ?auto_71722 ) ) ( not ( = ?auto_71721 ?auto_71723 ) ) ( not ( = ?auto_71722 ?auto_71723 ) ) ( ON ?auto_71723 ?auto_71727 ) ( not ( = ?auto_71720 ?auto_71727 ) ) ( not ( = ?auto_71721 ?auto_71727 ) ) ( not ( = ?auto_71722 ?auto_71727 ) ) ( not ( = ?auto_71723 ?auto_71727 ) ) ( ON ?auto_71722 ?auto_71723 ) ( ON-TABLE ?auto_71725 ) ( ON ?auto_71726 ?auto_71725 ) ( ON ?auto_71724 ?auto_71726 ) ( ON ?auto_71727 ?auto_71724 ) ( not ( = ?auto_71725 ?auto_71726 ) ) ( not ( = ?auto_71725 ?auto_71724 ) ) ( not ( = ?auto_71725 ?auto_71727 ) ) ( not ( = ?auto_71725 ?auto_71723 ) ) ( not ( = ?auto_71725 ?auto_71722 ) ) ( not ( = ?auto_71726 ?auto_71724 ) ) ( not ( = ?auto_71726 ?auto_71727 ) ) ( not ( = ?auto_71726 ?auto_71723 ) ) ( not ( = ?auto_71726 ?auto_71722 ) ) ( not ( = ?auto_71724 ?auto_71727 ) ) ( not ( = ?auto_71724 ?auto_71723 ) ) ( not ( = ?auto_71724 ?auto_71722 ) ) ( not ( = ?auto_71720 ?auto_71725 ) ) ( not ( = ?auto_71720 ?auto_71726 ) ) ( not ( = ?auto_71720 ?auto_71724 ) ) ( not ( = ?auto_71721 ?auto_71725 ) ) ( not ( = ?auto_71721 ?auto_71726 ) ) ( not ( = ?auto_71721 ?auto_71724 ) ) ( CLEAR ?auto_71720 ) ( ON ?auto_71721 ?auto_71722 ) ( CLEAR ?auto_71721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71725 ?auto_71726 ?auto_71724 ?auto_71727 ?auto_71723 ?auto_71722 )
      ( MAKE-4PILE ?auto_71720 ?auto_71721 ?auto_71722 ?auto_71723 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71728 - BLOCK
      ?auto_71729 - BLOCK
      ?auto_71730 - BLOCK
      ?auto_71731 - BLOCK
    )
    :vars
    (
      ?auto_71733 - BLOCK
      ?auto_71734 - BLOCK
      ?auto_71732 - BLOCK
      ?auto_71735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71728 ?auto_71729 ) ) ( not ( = ?auto_71728 ?auto_71730 ) ) ( not ( = ?auto_71728 ?auto_71731 ) ) ( not ( = ?auto_71729 ?auto_71730 ) ) ( not ( = ?auto_71729 ?auto_71731 ) ) ( not ( = ?auto_71730 ?auto_71731 ) ) ( ON ?auto_71731 ?auto_71733 ) ( not ( = ?auto_71728 ?auto_71733 ) ) ( not ( = ?auto_71729 ?auto_71733 ) ) ( not ( = ?auto_71730 ?auto_71733 ) ) ( not ( = ?auto_71731 ?auto_71733 ) ) ( ON ?auto_71730 ?auto_71731 ) ( ON-TABLE ?auto_71734 ) ( ON ?auto_71732 ?auto_71734 ) ( ON ?auto_71735 ?auto_71732 ) ( ON ?auto_71733 ?auto_71735 ) ( not ( = ?auto_71734 ?auto_71732 ) ) ( not ( = ?auto_71734 ?auto_71735 ) ) ( not ( = ?auto_71734 ?auto_71733 ) ) ( not ( = ?auto_71734 ?auto_71731 ) ) ( not ( = ?auto_71734 ?auto_71730 ) ) ( not ( = ?auto_71732 ?auto_71735 ) ) ( not ( = ?auto_71732 ?auto_71733 ) ) ( not ( = ?auto_71732 ?auto_71731 ) ) ( not ( = ?auto_71732 ?auto_71730 ) ) ( not ( = ?auto_71735 ?auto_71733 ) ) ( not ( = ?auto_71735 ?auto_71731 ) ) ( not ( = ?auto_71735 ?auto_71730 ) ) ( not ( = ?auto_71728 ?auto_71734 ) ) ( not ( = ?auto_71728 ?auto_71732 ) ) ( not ( = ?auto_71728 ?auto_71735 ) ) ( not ( = ?auto_71729 ?auto_71734 ) ) ( not ( = ?auto_71729 ?auto_71732 ) ) ( not ( = ?auto_71729 ?auto_71735 ) ) ( ON ?auto_71729 ?auto_71730 ) ( CLEAR ?auto_71729 ) ( HOLDING ?auto_71728 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71728 )
      ( MAKE-4PILE ?auto_71728 ?auto_71729 ?auto_71730 ?auto_71731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_71736 - BLOCK
      ?auto_71737 - BLOCK
      ?auto_71738 - BLOCK
      ?auto_71739 - BLOCK
    )
    :vars
    (
      ?auto_71743 - BLOCK
      ?auto_71742 - BLOCK
      ?auto_71740 - BLOCK
      ?auto_71741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71736 ?auto_71737 ) ) ( not ( = ?auto_71736 ?auto_71738 ) ) ( not ( = ?auto_71736 ?auto_71739 ) ) ( not ( = ?auto_71737 ?auto_71738 ) ) ( not ( = ?auto_71737 ?auto_71739 ) ) ( not ( = ?auto_71738 ?auto_71739 ) ) ( ON ?auto_71739 ?auto_71743 ) ( not ( = ?auto_71736 ?auto_71743 ) ) ( not ( = ?auto_71737 ?auto_71743 ) ) ( not ( = ?auto_71738 ?auto_71743 ) ) ( not ( = ?auto_71739 ?auto_71743 ) ) ( ON ?auto_71738 ?auto_71739 ) ( ON-TABLE ?auto_71742 ) ( ON ?auto_71740 ?auto_71742 ) ( ON ?auto_71741 ?auto_71740 ) ( ON ?auto_71743 ?auto_71741 ) ( not ( = ?auto_71742 ?auto_71740 ) ) ( not ( = ?auto_71742 ?auto_71741 ) ) ( not ( = ?auto_71742 ?auto_71743 ) ) ( not ( = ?auto_71742 ?auto_71739 ) ) ( not ( = ?auto_71742 ?auto_71738 ) ) ( not ( = ?auto_71740 ?auto_71741 ) ) ( not ( = ?auto_71740 ?auto_71743 ) ) ( not ( = ?auto_71740 ?auto_71739 ) ) ( not ( = ?auto_71740 ?auto_71738 ) ) ( not ( = ?auto_71741 ?auto_71743 ) ) ( not ( = ?auto_71741 ?auto_71739 ) ) ( not ( = ?auto_71741 ?auto_71738 ) ) ( not ( = ?auto_71736 ?auto_71742 ) ) ( not ( = ?auto_71736 ?auto_71740 ) ) ( not ( = ?auto_71736 ?auto_71741 ) ) ( not ( = ?auto_71737 ?auto_71742 ) ) ( not ( = ?auto_71737 ?auto_71740 ) ) ( not ( = ?auto_71737 ?auto_71741 ) ) ( ON ?auto_71737 ?auto_71738 ) ( ON ?auto_71736 ?auto_71737 ) ( CLEAR ?auto_71736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71742 ?auto_71740 ?auto_71741 ?auto_71743 ?auto_71739 ?auto_71738 ?auto_71737 )
      ( MAKE-4PILE ?auto_71736 ?auto_71737 ?auto_71738 ?auto_71739 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71747 - BLOCK
      ?auto_71748 - BLOCK
      ?auto_71749 - BLOCK
    )
    :vars
    (
      ?auto_71750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71750 ?auto_71749 ) ( CLEAR ?auto_71750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71747 ) ( ON ?auto_71748 ?auto_71747 ) ( ON ?auto_71749 ?auto_71748 ) ( not ( = ?auto_71747 ?auto_71748 ) ) ( not ( = ?auto_71747 ?auto_71749 ) ) ( not ( = ?auto_71747 ?auto_71750 ) ) ( not ( = ?auto_71748 ?auto_71749 ) ) ( not ( = ?auto_71748 ?auto_71750 ) ) ( not ( = ?auto_71749 ?auto_71750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71750 ?auto_71749 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71751 - BLOCK
      ?auto_71752 - BLOCK
      ?auto_71753 - BLOCK
    )
    :vars
    (
      ?auto_71754 - BLOCK
      ?auto_71755 - BLOCK
      ?auto_71756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71754 ?auto_71753 ) ( CLEAR ?auto_71754 ) ( ON-TABLE ?auto_71751 ) ( ON ?auto_71752 ?auto_71751 ) ( ON ?auto_71753 ?auto_71752 ) ( not ( = ?auto_71751 ?auto_71752 ) ) ( not ( = ?auto_71751 ?auto_71753 ) ) ( not ( = ?auto_71751 ?auto_71754 ) ) ( not ( = ?auto_71752 ?auto_71753 ) ) ( not ( = ?auto_71752 ?auto_71754 ) ) ( not ( = ?auto_71753 ?auto_71754 ) ) ( HOLDING ?auto_71755 ) ( CLEAR ?auto_71756 ) ( not ( = ?auto_71751 ?auto_71755 ) ) ( not ( = ?auto_71751 ?auto_71756 ) ) ( not ( = ?auto_71752 ?auto_71755 ) ) ( not ( = ?auto_71752 ?auto_71756 ) ) ( not ( = ?auto_71753 ?auto_71755 ) ) ( not ( = ?auto_71753 ?auto_71756 ) ) ( not ( = ?auto_71754 ?auto_71755 ) ) ( not ( = ?auto_71754 ?auto_71756 ) ) ( not ( = ?auto_71755 ?auto_71756 ) ) )
    :subtasks
    ( ( !STACK ?auto_71755 ?auto_71756 )
      ( MAKE-3PILE ?auto_71751 ?auto_71752 ?auto_71753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71757 - BLOCK
      ?auto_71758 - BLOCK
      ?auto_71759 - BLOCK
    )
    :vars
    (
      ?auto_71761 - BLOCK
      ?auto_71760 - BLOCK
      ?auto_71762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71761 ?auto_71759 ) ( ON-TABLE ?auto_71757 ) ( ON ?auto_71758 ?auto_71757 ) ( ON ?auto_71759 ?auto_71758 ) ( not ( = ?auto_71757 ?auto_71758 ) ) ( not ( = ?auto_71757 ?auto_71759 ) ) ( not ( = ?auto_71757 ?auto_71761 ) ) ( not ( = ?auto_71758 ?auto_71759 ) ) ( not ( = ?auto_71758 ?auto_71761 ) ) ( not ( = ?auto_71759 ?auto_71761 ) ) ( CLEAR ?auto_71760 ) ( not ( = ?auto_71757 ?auto_71762 ) ) ( not ( = ?auto_71757 ?auto_71760 ) ) ( not ( = ?auto_71758 ?auto_71762 ) ) ( not ( = ?auto_71758 ?auto_71760 ) ) ( not ( = ?auto_71759 ?auto_71762 ) ) ( not ( = ?auto_71759 ?auto_71760 ) ) ( not ( = ?auto_71761 ?auto_71762 ) ) ( not ( = ?auto_71761 ?auto_71760 ) ) ( not ( = ?auto_71762 ?auto_71760 ) ) ( ON ?auto_71762 ?auto_71761 ) ( CLEAR ?auto_71762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71757 ?auto_71758 ?auto_71759 ?auto_71761 )
      ( MAKE-3PILE ?auto_71757 ?auto_71758 ?auto_71759 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71763 - BLOCK
      ?auto_71764 - BLOCK
      ?auto_71765 - BLOCK
    )
    :vars
    (
      ?auto_71767 - BLOCK
      ?auto_71768 - BLOCK
      ?auto_71766 - BLOCK
      ?auto_71769 - BLOCK
      ?auto_71770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71767 ?auto_71765 ) ( ON-TABLE ?auto_71763 ) ( ON ?auto_71764 ?auto_71763 ) ( ON ?auto_71765 ?auto_71764 ) ( not ( = ?auto_71763 ?auto_71764 ) ) ( not ( = ?auto_71763 ?auto_71765 ) ) ( not ( = ?auto_71763 ?auto_71767 ) ) ( not ( = ?auto_71764 ?auto_71765 ) ) ( not ( = ?auto_71764 ?auto_71767 ) ) ( not ( = ?auto_71765 ?auto_71767 ) ) ( not ( = ?auto_71763 ?auto_71768 ) ) ( not ( = ?auto_71763 ?auto_71766 ) ) ( not ( = ?auto_71764 ?auto_71768 ) ) ( not ( = ?auto_71764 ?auto_71766 ) ) ( not ( = ?auto_71765 ?auto_71768 ) ) ( not ( = ?auto_71765 ?auto_71766 ) ) ( not ( = ?auto_71767 ?auto_71768 ) ) ( not ( = ?auto_71767 ?auto_71766 ) ) ( not ( = ?auto_71768 ?auto_71766 ) ) ( ON ?auto_71768 ?auto_71767 ) ( CLEAR ?auto_71768 ) ( HOLDING ?auto_71766 ) ( CLEAR ?auto_71769 ) ( ON-TABLE ?auto_71770 ) ( ON ?auto_71769 ?auto_71770 ) ( not ( = ?auto_71770 ?auto_71769 ) ) ( not ( = ?auto_71770 ?auto_71766 ) ) ( not ( = ?auto_71769 ?auto_71766 ) ) ( not ( = ?auto_71763 ?auto_71769 ) ) ( not ( = ?auto_71763 ?auto_71770 ) ) ( not ( = ?auto_71764 ?auto_71769 ) ) ( not ( = ?auto_71764 ?auto_71770 ) ) ( not ( = ?auto_71765 ?auto_71769 ) ) ( not ( = ?auto_71765 ?auto_71770 ) ) ( not ( = ?auto_71767 ?auto_71769 ) ) ( not ( = ?auto_71767 ?auto_71770 ) ) ( not ( = ?auto_71768 ?auto_71769 ) ) ( not ( = ?auto_71768 ?auto_71770 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71770 ?auto_71769 ?auto_71766 )
      ( MAKE-3PILE ?auto_71763 ?auto_71764 ?auto_71765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71771 - BLOCK
      ?auto_71772 - BLOCK
      ?auto_71773 - BLOCK
    )
    :vars
    (
      ?auto_71774 - BLOCK
      ?auto_71776 - BLOCK
      ?auto_71777 - BLOCK
      ?auto_71775 - BLOCK
      ?auto_71778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71774 ?auto_71773 ) ( ON-TABLE ?auto_71771 ) ( ON ?auto_71772 ?auto_71771 ) ( ON ?auto_71773 ?auto_71772 ) ( not ( = ?auto_71771 ?auto_71772 ) ) ( not ( = ?auto_71771 ?auto_71773 ) ) ( not ( = ?auto_71771 ?auto_71774 ) ) ( not ( = ?auto_71772 ?auto_71773 ) ) ( not ( = ?auto_71772 ?auto_71774 ) ) ( not ( = ?auto_71773 ?auto_71774 ) ) ( not ( = ?auto_71771 ?auto_71776 ) ) ( not ( = ?auto_71771 ?auto_71777 ) ) ( not ( = ?auto_71772 ?auto_71776 ) ) ( not ( = ?auto_71772 ?auto_71777 ) ) ( not ( = ?auto_71773 ?auto_71776 ) ) ( not ( = ?auto_71773 ?auto_71777 ) ) ( not ( = ?auto_71774 ?auto_71776 ) ) ( not ( = ?auto_71774 ?auto_71777 ) ) ( not ( = ?auto_71776 ?auto_71777 ) ) ( ON ?auto_71776 ?auto_71774 ) ( CLEAR ?auto_71775 ) ( ON-TABLE ?auto_71778 ) ( ON ?auto_71775 ?auto_71778 ) ( not ( = ?auto_71778 ?auto_71775 ) ) ( not ( = ?auto_71778 ?auto_71777 ) ) ( not ( = ?auto_71775 ?auto_71777 ) ) ( not ( = ?auto_71771 ?auto_71775 ) ) ( not ( = ?auto_71771 ?auto_71778 ) ) ( not ( = ?auto_71772 ?auto_71775 ) ) ( not ( = ?auto_71772 ?auto_71778 ) ) ( not ( = ?auto_71773 ?auto_71775 ) ) ( not ( = ?auto_71773 ?auto_71778 ) ) ( not ( = ?auto_71774 ?auto_71775 ) ) ( not ( = ?auto_71774 ?auto_71778 ) ) ( not ( = ?auto_71776 ?auto_71775 ) ) ( not ( = ?auto_71776 ?auto_71778 ) ) ( ON ?auto_71777 ?auto_71776 ) ( CLEAR ?auto_71777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71771 ?auto_71772 ?auto_71773 ?auto_71774 ?auto_71776 )
      ( MAKE-3PILE ?auto_71771 ?auto_71772 ?auto_71773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71779 - BLOCK
      ?auto_71780 - BLOCK
      ?auto_71781 - BLOCK
    )
    :vars
    (
      ?auto_71785 - BLOCK
      ?auto_71782 - BLOCK
      ?auto_71783 - BLOCK
      ?auto_71786 - BLOCK
      ?auto_71784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71785 ?auto_71781 ) ( ON-TABLE ?auto_71779 ) ( ON ?auto_71780 ?auto_71779 ) ( ON ?auto_71781 ?auto_71780 ) ( not ( = ?auto_71779 ?auto_71780 ) ) ( not ( = ?auto_71779 ?auto_71781 ) ) ( not ( = ?auto_71779 ?auto_71785 ) ) ( not ( = ?auto_71780 ?auto_71781 ) ) ( not ( = ?auto_71780 ?auto_71785 ) ) ( not ( = ?auto_71781 ?auto_71785 ) ) ( not ( = ?auto_71779 ?auto_71782 ) ) ( not ( = ?auto_71779 ?auto_71783 ) ) ( not ( = ?auto_71780 ?auto_71782 ) ) ( not ( = ?auto_71780 ?auto_71783 ) ) ( not ( = ?auto_71781 ?auto_71782 ) ) ( not ( = ?auto_71781 ?auto_71783 ) ) ( not ( = ?auto_71785 ?auto_71782 ) ) ( not ( = ?auto_71785 ?auto_71783 ) ) ( not ( = ?auto_71782 ?auto_71783 ) ) ( ON ?auto_71782 ?auto_71785 ) ( ON-TABLE ?auto_71786 ) ( not ( = ?auto_71786 ?auto_71784 ) ) ( not ( = ?auto_71786 ?auto_71783 ) ) ( not ( = ?auto_71784 ?auto_71783 ) ) ( not ( = ?auto_71779 ?auto_71784 ) ) ( not ( = ?auto_71779 ?auto_71786 ) ) ( not ( = ?auto_71780 ?auto_71784 ) ) ( not ( = ?auto_71780 ?auto_71786 ) ) ( not ( = ?auto_71781 ?auto_71784 ) ) ( not ( = ?auto_71781 ?auto_71786 ) ) ( not ( = ?auto_71785 ?auto_71784 ) ) ( not ( = ?auto_71785 ?auto_71786 ) ) ( not ( = ?auto_71782 ?auto_71784 ) ) ( not ( = ?auto_71782 ?auto_71786 ) ) ( ON ?auto_71783 ?auto_71782 ) ( CLEAR ?auto_71783 ) ( HOLDING ?auto_71784 ) ( CLEAR ?auto_71786 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71786 ?auto_71784 )
      ( MAKE-3PILE ?auto_71779 ?auto_71780 ?auto_71781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72964 - BLOCK
      ?auto_72965 - BLOCK
      ?auto_72966 - BLOCK
    )
    :vars
    (
      ?auto_72968 - BLOCK
      ?auto_72967 - BLOCK
      ?auto_72969 - BLOCK
      ?auto_72970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72968 ?auto_72966 ) ( ON-TABLE ?auto_72964 ) ( ON ?auto_72965 ?auto_72964 ) ( ON ?auto_72966 ?auto_72965 ) ( not ( = ?auto_72964 ?auto_72965 ) ) ( not ( = ?auto_72964 ?auto_72966 ) ) ( not ( = ?auto_72964 ?auto_72968 ) ) ( not ( = ?auto_72965 ?auto_72966 ) ) ( not ( = ?auto_72965 ?auto_72968 ) ) ( not ( = ?auto_72966 ?auto_72968 ) ) ( not ( = ?auto_72964 ?auto_72967 ) ) ( not ( = ?auto_72964 ?auto_72969 ) ) ( not ( = ?auto_72965 ?auto_72967 ) ) ( not ( = ?auto_72965 ?auto_72969 ) ) ( not ( = ?auto_72966 ?auto_72967 ) ) ( not ( = ?auto_72966 ?auto_72969 ) ) ( not ( = ?auto_72968 ?auto_72967 ) ) ( not ( = ?auto_72968 ?auto_72969 ) ) ( not ( = ?auto_72967 ?auto_72969 ) ) ( ON ?auto_72967 ?auto_72968 ) ( not ( = ?auto_72970 ?auto_72969 ) ) ( not ( = ?auto_72964 ?auto_72970 ) ) ( not ( = ?auto_72965 ?auto_72970 ) ) ( not ( = ?auto_72966 ?auto_72970 ) ) ( not ( = ?auto_72968 ?auto_72970 ) ) ( not ( = ?auto_72967 ?auto_72970 ) ) ( ON ?auto_72969 ?auto_72967 ) ( ON ?auto_72970 ?auto_72969 ) ( CLEAR ?auto_72970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72964 ?auto_72965 ?auto_72966 ?auto_72968 ?auto_72967 ?auto_72969 )
      ( MAKE-3PILE ?auto_72964 ?auto_72965 ?auto_72966 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71795 - BLOCK
      ?auto_71796 - BLOCK
      ?auto_71797 - BLOCK
    )
    :vars
    (
      ?auto_71798 - BLOCK
      ?auto_71802 - BLOCK
      ?auto_71800 - BLOCK
      ?auto_71799 - BLOCK
      ?auto_71801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71798 ?auto_71797 ) ( ON-TABLE ?auto_71795 ) ( ON ?auto_71796 ?auto_71795 ) ( ON ?auto_71797 ?auto_71796 ) ( not ( = ?auto_71795 ?auto_71796 ) ) ( not ( = ?auto_71795 ?auto_71797 ) ) ( not ( = ?auto_71795 ?auto_71798 ) ) ( not ( = ?auto_71796 ?auto_71797 ) ) ( not ( = ?auto_71796 ?auto_71798 ) ) ( not ( = ?auto_71797 ?auto_71798 ) ) ( not ( = ?auto_71795 ?auto_71802 ) ) ( not ( = ?auto_71795 ?auto_71800 ) ) ( not ( = ?auto_71796 ?auto_71802 ) ) ( not ( = ?auto_71796 ?auto_71800 ) ) ( not ( = ?auto_71797 ?auto_71802 ) ) ( not ( = ?auto_71797 ?auto_71800 ) ) ( not ( = ?auto_71798 ?auto_71802 ) ) ( not ( = ?auto_71798 ?auto_71800 ) ) ( not ( = ?auto_71802 ?auto_71800 ) ) ( ON ?auto_71802 ?auto_71798 ) ( not ( = ?auto_71799 ?auto_71801 ) ) ( not ( = ?auto_71799 ?auto_71800 ) ) ( not ( = ?auto_71801 ?auto_71800 ) ) ( not ( = ?auto_71795 ?auto_71801 ) ) ( not ( = ?auto_71795 ?auto_71799 ) ) ( not ( = ?auto_71796 ?auto_71801 ) ) ( not ( = ?auto_71796 ?auto_71799 ) ) ( not ( = ?auto_71797 ?auto_71801 ) ) ( not ( = ?auto_71797 ?auto_71799 ) ) ( not ( = ?auto_71798 ?auto_71801 ) ) ( not ( = ?auto_71798 ?auto_71799 ) ) ( not ( = ?auto_71802 ?auto_71801 ) ) ( not ( = ?auto_71802 ?auto_71799 ) ) ( ON ?auto_71800 ?auto_71802 ) ( ON ?auto_71801 ?auto_71800 ) ( CLEAR ?auto_71801 ) ( HOLDING ?auto_71799 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71799 )
      ( MAKE-3PILE ?auto_71795 ?auto_71796 ?auto_71797 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_71803 - BLOCK
      ?auto_71804 - BLOCK
      ?auto_71805 - BLOCK
    )
    :vars
    (
      ?auto_71807 - BLOCK
      ?auto_71806 - BLOCK
      ?auto_71810 - BLOCK
      ?auto_71808 - BLOCK
      ?auto_71809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71807 ?auto_71805 ) ( ON-TABLE ?auto_71803 ) ( ON ?auto_71804 ?auto_71803 ) ( ON ?auto_71805 ?auto_71804 ) ( not ( = ?auto_71803 ?auto_71804 ) ) ( not ( = ?auto_71803 ?auto_71805 ) ) ( not ( = ?auto_71803 ?auto_71807 ) ) ( not ( = ?auto_71804 ?auto_71805 ) ) ( not ( = ?auto_71804 ?auto_71807 ) ) ( not ( = ?auto_71805 ?auto_71807 ) ) ( not ( = ?auto_71803 ?auto_71806 ) ) ( not ( = ?auto_71803 ?auto_71810 ) ) ( not ( = ?auto_71804 ?auto_71806 ) ) ( not ( = ?auto_71804 ?auto_71810 ) ) ( not ( = ?auto_71805 ?auto_71806 ) ) ( not ( = ?auto_71805 ?auto_71810 ) ) ( not ( = ?auto_71807 ?auto_71806 ) ) ( not ( = ?auto_71807 ?auto_71810 ) ) ( not ( = ?auto_71806 ?auto_71810 ) ) ( ON ?auto_71806 ?auto_71807 ) ( not ( = ?auto_71808 ?auto_71809 ) ) ( not ( = ?auto_71808 ?auto_71810 ) ) ( not ( = ?auto_71809 ?auto_71810 ) ) ( not ( = ?auto_71803 ?auto_71809 ) ) ( not ( = ?auto_71803 ?auto_71808 ) ) ( not ( = ?auto_71804 ?auto_71809 ) ) ( not ( = ?auto_71804 ?auto_71808 ) ) ( not ( = ?auto_71805 ?auto_71809 ) ) ( not ( = ?auto_71805 ?auto_71808 ) ) ( not ( = ?auto_71807 ?auto_71809 ) ) ( not ( = ?auto_71807 ?auto_71808 ) ) ( not ( = ?auto_71806 ?auto_71809 ) ) ( not ( = ?auto_71806 ?auto_71808 ) ) ( ON ?auto_71810 ?auto_71806 ) ( ON ?auto_71809 ?auto_71810 ) ( ON ?auto_71808 ?auto_71809 ) ( CLEAR ?auto_71808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71803 ?auto_71804 ?auto_71805 ?auto_71807 ?auto_71806 ?auto_71810 ?auto_71809 )
      ( MAKE-3PILE ?auto_71803 ?auto_71804 ?auto_71805 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71816 - BLOCK
      ?auto_71817 - BLOCK
      ?auto_71818 - BLOCK
      ?auto_71819 - BLOCK
      ?auto_71820 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71820 ) ( CLEAR ?auto_71819 ) ( ON-TABLE ?auto_71816 ) ( ON ?auto_71817 ?auto_71816 ) ( ON ?auto_71818 ?auto_71817 ) ( ON ?auto_71819 ?auto_71818 ) ( not ( = ?auto_71816 ?auto_71817 ) ) ( not ( = ?auto_71816 ?auto_71818 ) ) ( not ( = ?auto_71816 ?auto_71819 ) ) ( not ( = ?auto_71816 ?auto_71820 ) ) ( not ( = ?auto_71817 ?auto_71818 ) ) ( not ( = ?auto_71817 ?auto_71819 ) ) ( not ( = ?auto_71817 ?auto_71820 ) ) ( not ( = ?auto_71818 ?auto_71819 ) ) ( not ( = ?auto_71818 ?auto_71820 ) ) ( not ( = ?auto_71819 ?auto_71820 ) ) )
    :subtasks
    ( ( !STACK ?auto_71820 ?auto_71819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71821 - BLOCK
      ?auto_71822 - BLOCK
      ?auto_71823 - BLOCK
      ?auto_71824 - BLOCK
      ?auto_71825 - BLOCK
    )
    :vars
    (
      ?auto_71826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71824 ) ( ON-TABLE ?auto_71821 ) ( ON ?auto_71822 ?auto_71821 ) ( ON ?auto_71823 ?auto_71822 ) ( ON ?auto_71824 ?auto_71823 ) ( not ( = ?auto_71821 ?auto_71822 ) ) ( not ( = ?auto_71821 ?auto_71823 ) ) ( not ( = ?auto_71821 ?auto_71824 ) ) ( not ( = ?auto_71821 ?auto_71825 ) ) ( not ( = ?auto_71822 ?auto_71823 ) ) ( not ( = ?auto_71822 ?auto_71824 ) ) ( not ( = ?auto_71822 ?auto_71825 ) ) ( not ( = ?auto_71823 ?auto_71824 ) ) ( not ( = ?auto_71823 ?auto_71825 ) ) ( not ( = ?auto_71824 ?auto_71825 ) ) ( ON ?auto_71825 ?auto_71826 ) ( CLEAR ?auto_71825 ) ( HAND-EMPTY ) ( not ( = ?auto_71821 ?auto_71826 ) ) ( not ( = ?auto_71822 ?auto_71826 ) ) ( not ( = ?auto_71823 ?auto_71826 ) ) ( not ( = ?auto_71824 ?auto_71826 ) ) ( not ( = ?auto_71825 ?auto_71826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71825 ?auto_71826 )
      ( MAKE-5PILE ?auto_71821 ?auto_71822 ?auto_71823 ?auto_71824 ?auto_71825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71827 - BLOCK
      ?auto_71828 - BLOCK
      ?auto_71829 - BLOCK
      ?auto_71830 - BLOCK
      ?auto_71831 - BLOCK
    )
    :vars
    (
      ?auto_71832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71827 ) ( ON ?auto_71828 ?auto_71827 ) ( ON ?auto_71829 ?auto_71828 ) ( not ( = ?auto_71827 ?auto_71828 ) ) ( not ( = ?auto_71827 ?auto_71829 ) ) ( not ( = ?auto_71827 ?auto_71830 ) ) ( not ( = ?auto_71827 ?auto_71831 ) ) ( not ( = ?auto_71828 ?auto_71829 ) ) ( not ( = ?auto_71828 ?auto_71830 ) ) ( not ( = ?auto_71828 ?auto_71831 ) ) ( not ( = ?auto_71829 ?auto_71830 ) ) ( not ( = ?auto_71829 ?auto_71831 ) ) ( not ( = ?auto_71830 ?auto_71831 ) ) ( ON ?auto_71831 ?auto_71832 ) ( CLEAR ?auto_71831 ) ( not ( = ?auto_71827 ?auto_71832 ) ) ( not ( = ?auto_71828 ?auto_71832 ) ) ( not ( = ?auto_71829 ?auto_71832 ) ) ( not ( = ?auto_71830 ?auto_71832 ) ) ( not ( = ?auto_71831 ?auto_71832 ) ) ( HOLDING ?auto_71830 ) ( CLEAR ?auto_71829 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71827 ?auto_71828 ?auto_71829 ?auto_71830 )
      ( MAKE-5PILE ?auto_71827 ?auto_71828 ?auto_71829 ?auto_71830 ?auto_71831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71833 - BLOCK
      ?auto_71834 - BLOCK
      ?auto_71835 - BLOCK
      ?auto_71836 - BLOCK
      ?auto_71837 - BLOCK
    )
    :vars
    (
      ?auto_71838 - BLOCK
      ?auto_71840 - BLOCK
      ?auto_71839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71833 ) ( ON ?auto_71834 ?auto_71833 ) ( ON ?auto_71835 ?auto_71834 ) ( not ( = ?auto_71833 ?auto_71834 ) ) ( not ( = ?auto_71833 ?auto_71835 ) ) ( not ( = ?auto_71833 ?auto_71836 ) ) ( not ( = ?auto_71833 ?auto_71837 ) ) ( not ( = ?auto_71834 ?auto_71835 ) ) ( not ( = ?auto_71834 ?auto_71836 ) ) ( not ( = ?auto_71834 ?auto_71837 ) ) ( not ( = ?auto_71835 ?auto_71836 ) ) ( not ( = ?auto_71835 ?auto_71837 ) ) ( not ( = ?auto_71836 ?auto_71837 ) ) ( ON ?auto_71837 ?auto_71838 ) ( not ( = ?auto_71833 ?auto_71838 ) ) ( not ( = ?auto_71834 ?auto_71838 ) ) ( not ( = ?auto_71835 ?auto_71838 ) ) ( not ( = ?auto_71836 ?auto_71838 ) ) ( not ( = ?auto_71837 ?auto_71838 ) ) ( CLEAR ?auto_71835 ) ( ON ?auto_71836 ?auto_71837 ) ( CLEAR ?auto_71836 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71840 ) ( ON ?auto_71839 ?auto_71840 ) ( ON ?auto_71838 ?auto_71839 ) ( not ( = ?auto_71840 ?auto_71839 ) ) ( not ( = ?auto_71840 ?auto_71838 ) ) ( not ( = ?auto_71840 ?auto_71837 ) ) ( not ( = ?auto_71840 ?auto_71836 ) ) ( not ( = ?auto_71839 ?auto_71838 ) ) ( not ( = ?auto_71839 ?auto_71837 ) ) ( not ( = ?auto_71839 ?auto_71836 ) ) ( not ( = ?auto_71833 ?auto_71840 ) ) ( not ( = ?auto_71833 ?auto_71839 ) ) ( not ( = ?auto_71834 ?auto_71840 ) ) ( not ( = ?auto_71834 ?auto_71839 ) ) ( not ( = ?auto_71835 ?auto_71840 ) ) ( not ( = ?auto_71835 ?auto_71839 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71840 ?auto_71839 ?auto_71838 ?auto_71837 )
      ( MAKE-5PILE ?auto_71833 ?auto_71834 ?auto_71835 ?auto_71836 ?auto_71837 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71841 - BLOCK
      ?auto_71842 - BLOCK
      ?auto_71843 - BLOCK
      ?auto_71844 - BLOCK
      ?auto_71845 - BLOCK
    )
    :vars
    (
      ?auto_71848 - BLOCK
      ?auto_71846 - BLOCK
      ?auto_71847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71841 ) ( ON ?auto_71842 ?auto_71841 ) ( not ( = ?auto_71841 ?auto_71842 ) ) ( not ( = ?auto_71841 ?auto_71843 ) ) ( not ( = ?auto_71841 ?auto_71844 ) ) ( not ( = ?auto_71841 ?auto_71845 ) ) ( not ( = ?auto_71842 ?auto_71843 ) ) ( not ( = ?auto_71842 ?auto_71844 ) ) ( not ( = ?auto_71842 ?auto_71845 ) ) ( not ( = ?auto_71843 ?auto_71844 ) ) ( not ( = ?auto_71843 ?auto_71845 ) ) ( not ( = ?auto_71844 ?auto_71845 ) ) ( ON ?auto_71845 ?auto_71848 ) ( not ( = ?auto_71841 ?auto_71848 ) ) ( not ( = ?auto_71842 ?auto_71848 ) ) ( not ( = ?auto_71843 ?auto_71848 ) ) ( not ( = ?auto_71844 ?auto_71848 ) ) ( not ( = ?auto_71845 ?auto_71848 ) ) ( ON ?auto_71844 ?auto_71845 ) ( CLEAR ?auto_71844 ) ( ON-TABLE ?auto_71846 ) ( ON ?auto_71847 ?auto_71846 ) ( ON ?auto_71848 ?auto_71847 ) ( not ( = ?auto_71846 ?auto_71847 ) ) ( not ( = ?auto_71846 ?auto_71848 ) ) ( not ( = ?auto_71846 ?auto_71845 ) ) ( not ( = ?auto_71846 ?auto_71844 ) ) ( not ( = ?auto_71847 ?auto_71848 ) ) ( not ( = ?auto_71847 ?auto_71845 ) ) ( not ( = ?auto_71847 ?auto_71844 ) ) ( not ( = ?auto_71841 ?auto_71846 ) ) ( not ( = ?auto_71841 ?auto_71847 ) ) ( not ( = ?auto_71842 ?auto_71846 ) ) ( not ( = ?auto_71842 ?auto_71847 ) ) ( not ( = ?auto_71843 ?auto_71846 ) ) ( not ( = ?auto_71843 ?auto_71847 ) ) ( HOLDING ?auto_71843 ) ( CLEAR ?auto_71842 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71841 ?auto_71842 ?auto_71843 )
      ( MAKE-5PILE ?auto_71841 ?auto_71842 ?auto_71843 ?auto_71844 ?auto_71845 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71849 - BLOCK
      ?auto_71850 - BLOCK
      ?auto_71851 - BLOCK
      ?auto_71852 - BLOCK
      ?auto_71853 - BLOCK
    )
    :vars
    (
      ?auto_71856 - BLOCK
      ?auto_71855 - BLOCK
      ?auto_71854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71849 ) ( ON ?auto_71850 ?auto_71849 ) ( not ( = ?auto_71849 ?auto_71850 ) ) ( not ( = ?auto_71849 ?auto_71851 ) ) ( not ( = ?auto_71849 ?auto_71852 ) ) ( not ( = ?auto_71849 ?auto_71853 ) ) ( not ( = ?auto_71850 ?auto_71851 ) ) ( not ( = ?auto_71850 ?auto_71852 ) ) ( not ( = ?auto_71850 ?auto_71853 ) ) ( not ( = ?auto_71851 ?auto_71852 ) ) ( not ( = ?auto_71851 ?auto_71853 ) ) ( not ( = ?auto_71852 ?auto_71853 ) ) ( ON ?auto_71853 ?auto_71856 ) ( not ( = ?auto_71849 ?auto_71856 ) ) ( not ( = ?auto_71850 ?auto_71856 ) ) ( not ( = ?auto_71851 ?auto_71856 ) ) ( not ( = ?auto_71852 ?auto_71856 ) ) ( not ( = ?auto_71853 ?auto_71856 ) ) ( ON ?auto_71852 ?auto_71853 ) ( ON-TABLE ?auto_71855 ) ( ON ?auto_71854 ?auto_71855 ) ( ON ?auto_71856 ?auto_71854 ) ( not ( = ?auto_71855 ?auto_71854 ) ) ( not ( = ?auto_71855 ?auto_71856 ) ) ( not ( = ?auto_71855 ?auto_71853 ) ) ( not ( = ?auto_71855 ?auto_71852 ) ) ( not ( = ?auto_71854 ?auto_71856 ) ) ( not ( = ?auto_71854 ?auto_71853 ) ) ( not ( = ?auto_71854 ?auto_71852 ) ) ( not ( = ?auto_71849 ?auto_71855 ) ) ( not ( = ?auto_71849 ?auto_71854 ) ) ( not ( = ?auto_71850 ?auto_71855 ) ) ( not ( = ?auto_71850 ?auto_71854 ) ) ( not ( = ?auto_71851 ?auto_71855 ) ) ( not ( = ?auto_71851 ?auto_71854 ) ) ( CLEAR ?auto_71850 ) ( ON ?auto_71851 ?auto_71852 ) ( CLEAR ?auto_71851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71855 ?auto_71854 ?auto_71856 ?auto_71853 ?auto_71852 )
      ( MAKE-5PILE ?auto_71849 ?auto_71850 ?auto_71851 ?auto_71852 ?auto_71853 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71857 - BLOCK
      ?auto_71858 - BLOCK
      ?auto_71859 - BLOCK
      ?auto_71860 - BLOCK
      ?auto_71861 - BLOCK
    )
    :vars
    (
      ?auto_71862 - BLOCK
      ?auto_71863 - BLOCK
      ?auto_71864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71857 ) ( not ( = ?auto_71857 ?auto_71858 ) ) ( not ( = ?auto_71857 ?auto_71859 ) ) ( not ( = ?auto_71857 ?auto_71860 ) ) ( not ( = ?auto_71857 ?auto_71861 ) ) ( not ( = ?auto_71858 ?auto_71859 ) ) ( not ( = ?auto_71858 ?auto_71860 ) ) ( not ( = ?auto_71858 ?auto_71861 ) ) ( not ( = ?auto_71859 ?auto_71860 ) ) ( not ( = ?auto_71859 ?auto_71861 ) ) ( not ( = ?auto_71860 ?auto_71861 ) ) ( ON ?auto_71861 ?auto_71862 ) ( not ( = ?auto_71857 ?auto_71862 ) ) ( not ( = ?auto_71858 ?auto_71862 ) ) ( not ( = ?auto_71859 ?auto_71862 ) ) ( not ( = ?auto_71860 ?auto_71862 ) ) ( not ( = ?auto_71861 ?auto_71862 ) ) ( ON ?auto_71860 ?auto_71861 ) ( ON-TABLE ?auto_71863 ) ( ON ?auto_71864 ?auto_71863 ) ( ON ?auto_71862 ?auto_71864 ) ( not ( = ?auto_71863 ?auto_71864 ) ) ( not ( = ?auto_71863 ?auto_71862 ) ) ( not ( = ?auto_71863 ?auto_71861 ) ) ( not ( = ?auto_71863 ?auto_71860 ) ) ( not ( = ?auto_71864 ?auto_71862 ) ) ( not ( = ?auto_71864 ?auto_71861 ) ) ( not ( = ?auto_71864 ?auto_71860 ) ) ( not ( = ?auto_71857 ?auto_71863 ) ) ( not ( = ?auto_71857 ?auto_71864 ) ) ( not ( = ?auto_71858 ?auto_71863 ) ) ( not ( = ?auto_71858 ?auto_71864 ) ) ( not ( = ?auto_71859 ?auto_71863 ) ) ( not ( = ?auto_71859 ?auto_71864 ) ) ( ON ?auto_71859 ?auto_71860 ) ( CLEAR ?auto_71859 ) ( HOLDING ?auto_71858 ) ( CLEAR ?auto_71857 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71857 ?auto_71858 )
      ( MAKE-5PILE ?auto_71857 ?auto_71858 ?auto_71859 ?auto_71860 ?auto_71861 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71865 - BLOCK
      ?auto_71866 - BLOCK
      ?auto_71867 - BLOCK
      ?auto_71868 - BLOCK
      ?auto_71869 - BLOCK
    )
    :vars
    (
      ?auto_71870 - BLOCK
      ?auto_71871 - BLOCK
      ?auto_71872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71865 ) ( not ( = ?auto_71865 ?auto_71866 ) ) ( not ( = ?auto_71865 ?auto_71867 ) ) ( not ( = ?auto_71865 ?auto_71868 ) ) ( not ( = ?auto_71865 ?auto_71869 ) ) ( not ( = ?auto_71866 ?auto_71867 ) ) ( not ( = ?auto_71866 ?auto_71868 ) ) ( not ( = ?auto_71866 ?auto_71869 ) ) ( not ( = ?auto_71867 ?auto_71868 ) ) ( not ( = ?auto_71867 ?auto_71869 ) ) ( not ( = ?auto_71868 ?auto_71869 ) ) ( ON ?auto_71869 ?auto_71870 ) ( not ( = ?auto_71865 ?auto_71870 ) ) ( not ( = ?auto_71866 ?auto_71870 ) ) ( not ( = ?auto_71867 ?auto_71870 ) ) ( not ( = ?auto_71868 ?auto_71870 ) ) ( not ( = ?auto_71869 ?auto_71870 ) ) ( ON ?auto_71868 ?auto_71869 ) ( ON-TABLE ?auto_71871 ) ( ON ?auto_71872 ?auto_71871 ) ( ON ?auto_71870 ?auto_71872 ) ( not ( = ?auto_71871 ?auto_71872 ) ) ( not ( = ?auto_71871 ?auto_71870 ) ) ( not ( = ?auto_71871 ?auto_71869 ) ) ( not ( = ?auto_71871 ?auto_71868 ) ) ( not ( = ?auto_71872 ?auto_71870 ) ) ( not ( = ?auto_71872 ?auto_71869 ) ) ( not ( = ?auto_71872 ?auto_71868 ) ) ( not ( = ?auto_71865 ?auto_71871 ) ) ( not ( = ?auto_71865 ?auto_71872 ) ) ( not ( = ?auto_71866 ?auto_71871 ) ) ( not ( = ?auto_71866 ?auto_71872 ) ) ( not ( = ?auto_71867 ?auto_71871 ) ) ( not ( = ?auto_71867 ?auto_71872 ) ) ( ON ?auto_71867 ?auto_71868 ) ( CLEAR ?auto_71865 ) ( ON ?auto_71866 ?auto_71867 ) ( CLEAR ?auto_71866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_71871 ?auto_71872 ?auto_71870 ?auto_71869 ?auto_71868 ?auto_71867 )
      ( MAKE-5PILE ?auto_71865 ?auto_71866 ?auto_71867 ?auto_71868 ?auto_71869 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71873 - BLOCK
      ?auto_71874 - BLOCK
      ?auto_71875 - BLOCK
      ?auto_71876 - BLOCK
      ?auto_71877 - BLOCK
    )
    :vars
    (
      ?auto_71879 - BLOCK
      ?auto_71880 - BLOCK
      ?auto_71878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71873 ?auto_71874 ) ) ( not ( = ?auto_71873 ?auto_71875 ) ) ( not ( = ?auto_71873 ?auto_71876 ) ) ( not ( = ?auto_71873 ?auto_71877 ) ) ( not ( = ?auto_71874 ?auto_71875 ) ) ( not ( = ?auto_71874 ?auto_71876 ) ) ( not ( = ?auto_71874 ?auto_71877 ) ) ( not ( = ?auto_71875 ?auto_71876 ) ) ( not ( = ?auto_71875 ?auto_71877 ) ) ( not ( = ?auto_71876 ?auto_71877 ) ) ( ON ?auto_71877 ?auto_71879 ) ( not ( = ?auto_71873 ?auto_71879 ) ) ( not ( = ?auto_71874 ?auto_71879 ) ) ( not ( = ?auto_71875 ?auto_71879 ) ) ( not ( = ?auto_71876 ?auto_71879 ) ) ( not ( = ?auto_71877 ?auto_71879 ) ) ( ON ?auto_71876 ?auto_71877 ) ( ON-TABLE ?auto_71880 ) ( ON ?auto_71878 ?auto_71880 ) ( ON ?auto_71879 ?auto_71878 ) ( not ( = ?auto_71880 ?auto_71878 ) ) ( not ( = ?auto_71880 ?auto_71879 ) ) ( not ( = ?auto_71880 ?auto_71877 ) ) ( not ( = ?auto_71880 ?auto_71876 ) ) ( not ( = ?auto_71878 ?auto_71879 ) ) ( not ( = ?auto_71878 ?auto_71877 ) ) ( not ( = ?auto_71878 ?auto_71876 ) ) ( not ( = ?auto_71873 ?auto_71880 ) ) ( not ( = ?auto_71873 ?auto_71878 ) ) ( not ( = ?auto_71874 ?auto_71880 ) ) ( not ( = ?auto_71874 ?auto_71878 ) ) ( not ( = ?auto_71875 ?auto_71880 ) ) ( not ( = ?auto_71875 ?auto_71878 ) ) ( ON ?auto_71875 ?auto_71876 ) ( ON ?auto_71874 ?auto_71875 ) ( CLEAR ?auto_71874 ) ( HOLDING ?auto_71873 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71873 )
      ( MAKE-5PILE ?auto_71873 ?auto_71874 ?auto_71875 ?auto_71876 ?auto_71877 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_71881 - BLOCK
      ?auto_71882 - BLOCK
      ?auto_71883 - BLOCK
      ?auto_71884 - BLOCK
      ?auto_71885 - BLOCK
    )
    :vars
    (
      ?auto_71887 - BLOCK
      ?auto_71886 - BLOCK
      ?auto_71888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71881 ?auto_71882 ) ) ( not ( = ?auto_71881 ?auto_71883 ) ) ( not ( = ?auto_71881 ?auto_71884 ) ) ( not ( = ?auto_71881 ?auto_71885 ) ) ( not ( = ?auto_71882 ?auto_71883 ) ) ( not ( = ?auto_71882 ?auto_71884 ) ) ( not ( = ?auto_71882 ?auto_71885 ) ) ( not ( = ?auto_71883 ?auto_71884 ) ) ( not ( = ?auto_71883 ?auto_71885 ) ) ( not ( = ?auto_71884 ?auto_71885 ) ) ( ON ?auto_71885 ?auto_71887 ) ( not ( = ?auto_71881 ?auto_71887 ) ) ( not ( = ?auto_71882 ?auto_71887 ) ) ( not ( = ?auto_71883 ?auto_71887 ) ) ( not ( = ?auto_71884 ?auto_71887 ) ) ( not ( = ?auto_71885 ?auto_71887 ) ) ( ON ?auto_71884 ?auto_71885 ) ( ON-TABLE ?auto_71886 ) ( ON ?auto_71888 ?auto_71886 ) ( ON ?auto_71887 ?auto_71888 ) ( not ( = ?auto_71886 ?auto_71888 ) ) ( not ( = ?auto_71886 ?auto_71887 ) ) ( not ( = ?auto_71886 ?auto_71885 ) ) ( not ( = ?auto_71886 ?auto_71884 ) ) ( not ( = ?auto_71888 ?auto_71887 ) ) ( not ( = ?auto_71888 ?auto_71885 ) ) ( not ( = ?auto_71888 ?auto_71884 ) ) ( not ( = ?auto_71881 ?auto_71886 ) ) ( not ( = ?auto_71881 ?auto_71888 ) ) ( not ( = ?auto_71882 ?auto_71886 ) ) ( not ( = ?auto_71882 ?auto_71888 ) ) ( not ( = ?auto_71883 ?auto_71886 ) ) ( not ( = ?auto_71883 ?auto_71888 ) ) ( ON ?auto_71883 ?auto_71884 ) ( ON ?auto_71882 ?auto_71883 ) ( ON ?auto_71881 ?auto_71882 ) ( CLEAR ?auto_71881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71886 ?auto_71888 ?auto_71887 ?auto_71885 ?auto_71884 ?auto_71883 ?auto_71882 )
      ( MAKE-5PILE ?auto_71881 ?auto_71882 ?auto_71883 ?auto_71884 ?auto_71885 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71891 - BLOCK
      ?auto_71892 - BLOCK
    )
    :vars
    (
      ?auto_71893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71893 ?auto_71892 ) ( CLEAR ?auto_71893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71891 ) ( ON ?auto_71892 ?auto_71891 ) ( not ( = ?auto_71891 ?auto_71892 ) ) ( not ( = ?auto_71891 ?auto_71893 ) ) ( not ( = ?auto_71892 ?auto_71893 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71893 ?auto_71892 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71894 - BLOCK
      ?auto_71895 - BLOCK
    )
    :vars
    (
      ?auto_71896 - BLOCK
      ?auto_71897 - BLOCK
      ?auto_71898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71896 ?auto_71895 ) ( CLEAR ?auto_71896 ) ( ON-TABLE ?auto_71894 ) ( ON ?auto_71895 ?auto_71894 ) ( not ( = ?auto_71894 ?auto_71895 ) ) ( not ( = ?auto_71894 ?auto_71896 ) ) ( not ( = ?auto_71895 ?auto_71896 ) ) ( HOLDING ?auto_71897 ) ( CLEAR ?auto_71898 ) ( not ( = ?auto_71894 ?auto_71897 ) ) ( not ( = ?auto_71894 ?auto_71898 ) ) ( not ( = ?auto_71895 ?auto_71897 ) ) ( not ( = ?auto_71895 ?auto_71898 ) ) ( not ( = ?auto_71896 ?auto_71897 ) ) ( not ( = ?auto_71896 ?auto_71898 ) ) ( not ( = ?auto_71897 ?auto_71898 ) ) )
    :subtasks
    ( ( !STACK ?auto_71897 ?auto_71898 )
      ( MAKE-2PILE ?auto_71894 ?auto_71895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71899 - BLOCK
      ?auto_71900 - BLOCK
    )
    :vars
    (
      ?auto_71903 - BLOCK
      ?auto_71901 - BLOCK
      ?auto_71902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71903 ?auto_71900 ) ( ON-TABLE ?auto_71899 ) ( ON ?auto_71900 ?auto_71899 ) ( not ( = ?auto_71899 ?auto_71900 ) ) ( not ( = ?auto_71899 ?auto_71903 ) ) ( not ( = ?auto_71900 ?auto_71903 ) ) ( CLEAR ?auto_71901 ) ( not ( = ?auto_71899 ?auto_71902 ) ) ( not ( = ?auto_71899 ?auto_71901 ) ) ( not ( = ?auto_71900 ?auto_71902 ) ) ( not ( = ?auto_71900 ?auto_71901 ) ) ( not ( = ?auto_71903 ?auto_71902 ) ) ( not ( = ?auto_71903 ?auto_71901 ) ) ( not ( = ?auto_71902 ?auto_71901 ) ) ( ON ?auto_71902 ?auto_71903 ) ( CLEAR ?auto_71902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71899 ?auto_71900 ?auto_71903 )
      ( MAKE-2PILE ?auto_71899 ?auto_71900 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71904 - BLOCK
      ?auto_71905 - BLOCK
    )
    :vars
    (
      ?auto_71907 - BLOCK
      ?auto_71908 - BLOCK
      ?auto_71906 - BLOCK
      ?auto_71910 - BLOCK
      ?auto_71911 - BLOCK
      ?auto_71909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71907 ?auto_71905 ) ( ON-TABLE ?auto_71904 ) ( ON ?auto_71905 ?auto_71904 ) ( not ( = ?auto_71904 ?auto_71905 ) ) ( not ( = ?auto_71904 ?auto_71907 ) ) ( not ( = ?auto_71905 ?auto_71907 ) ) ( not ( = ?auto_71904 ?auto_71908 ) ) ( not ( = ?auto_71904 ?auto_71906 ) ) ( not ( = ?auto_71905 ?auto_71908 ) ) ( not ( = ?auto_71905 ?auto_71906 ) ) ( not ( = ?auto_71907 ?auto_71908 ) ) ( not ( = ?auto_71907 ?auto_71906 ) ) ( not ( = ?auto_71908 ?auto_71906 ) ) ( ON ?auto_71908 ?auto_71907 ) ( CLEAR ?auto_71908 ) ( HOLDING ?auto_71906 ) ( CLEAR ?auto_71910 ) ( ON-TABLE ?auto_71911 ) ( ON ?auto_71909 ?auto_71911 ) ( ON ?auto_71910 ?auto_71909 ) ( not ( = ?auto_71911 ?auto_71909 ) ) ( not ( = ?auto_71911 ?auto_71910 ) ) ( not ( = ?auto_71911 ?auto_71906 ) ) ( not ( = ?auto_71909 ?auto_71910 ) ) ( not ( = ?auto_71909 ?auto_71906 ) ) ( not ( = ?auto_71910 ?auto_71906 ) ) ( not ( = ?auto_71904 ?auto_71910 ) ) ( not ( = ?auto_71904 ?auto_71911 ) ) ( not ( = ?auto_71904 ?auto_71909 ) ) ( not ( = ?auto_71905 ?auto_71910 ) ) ( not ( = ?auto_71905 ?auto_71911 ) ) ( not ( = ?auto_71905 ?auto_71909 ) ) ( not ( = ?auto_71907 ?auto_71910 ) ) ( not ( = ?auto_71907 ?auto_71911 ) ) ( not ( = ?auto_71907 ?auto_71909 ) ) ( not ( = ?auto_71908 ?auto_71910 ) ) ( not ( = ?auto_71908 ?auto_71911 ) ) ( not ( = ?auto_71908 ?auto_71909 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71911 ?auto_71909 ?auto_71910 ?auto_71906 )
      ( MAKE-2PILE ?auto_71904 ?auto_71905 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71912 - BLOCK
      ?auto_71913 - BLOCK
    )
    :vars
    (
      ?auto_71916 - BLOCK
      ?auto_71917 - BLOCK
      ?auto_71914 - BLOCK
      ?auto_71919 - BLOCK
      ?auto_71915 - BLOCK
      ?auto_71918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71916 ?auto_71913 ) ( ON-TABLE ?auto_71912 ) ( ON ?auto_71913 ?auto_71912 ) ( not ( = ?auto_71912 ?auto_71913 ) ) ( not ( = ?auto_71912 ?auto_71916 ) ) ( not ( = ?auto_71913 ?auto_71916 ) ) ( not ( = ?auto_71912 ?auto_71917 ) ) ( not ( = ?auto_71912 ?auto_71914 ) ) ( not ( = ?auto_71913 ?auto_71917 ) ) ( not ( = ?auto_71913 ?auto_71914 ) ) ( not ( = ?auto_71916 ?auto_71917 ) ) ( not ( = ?auto_71916 ?auto_71914 ) ) ( not ( = ?auto_71917 ?auto_71914 ) ) ( ON ?auto_71917 ?auto_71916 ) ( CLEAR ?auto_71919 ) ( ON-TABLE ?auto_71915 ) ( ON ?auto_71918 ?auto_71915 ) ( ON ?auto_71919 ?auto_71918 ) ( not ( = ?auto_71915 ?auto_71918 ) ) ( not ( = ?auto_71915 ?auto_71919 ) ) ( not ( = ?auto_71915 ?auto_71914 ) ) ( not ( = ?auto_71918 ?auto_71919 ) ) ( not ( = ?auto_71918 ?auto_71914 ) ) ( not ( = ?auto_71919 ?auto_71914 ) ) ( not ( = ?auto_71912 ?auto_71919 ) ) ( not ( = ?auto_71912 ?auto_71915 ) ) ( not ( = ?auto_71912 ?auto_71918 ) ) ( not ( = ?auto_71913 ?auto_71919 ) ) ( not ( = ?auto_71913 ?auto_71915 ) ) ( not ( = ?auto_71913 ?auto_71918 ) ) ( not ( = ?auto_71916 ?auto_71919 ) ) ( not ( = ?auto_71916 ?auto_71915 ) ) ( not ( = ?auto_71916 ?auto_71918 ) ) ( not ( = ?auto_71917 ?auto_71919 ) ) ( not ( = ?auto_71917 ?auto_71915 ) ) ( not ( = ?auto_71917 ?auto_71918 ) ) ( ON ?auto_71914 ?auto_71917 ) ( CLEAR ?auto_71914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_71912 ?auto_71913 ?auto_71916 ?auto_71917 )
      ( MAKE-2PILE ?auto_71912 ?auto_71913 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71920 - BLOCK
      ?auto_71921 - BLOCK
    )
    :vars
    (
      ?auto_71926 - BLOCK
      ?auto_71925 - BLOCK
      ?auto_71924 - BLOCK
      ?auto_71923 - BLOCK
      ?auto_71927 - BLOCK
      ?auto_71922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71926 ?auto_71921 ) ( ON-TABLE ?auto_71920 ) ( ON ?auto_71921 ?auto_71920 ) ( not ( = ?auto_71920 ?auto_71921 ) ) ( not ( = ?auto_71920 ?auto_71926 ) ) ( not ( = ?auto_71921 ?auto_71926 ) ) ( not ( = ?auto_71920 ?auto_71925 ) ) ( not ( = ?auto_71920 ?auto_71924 ) ) ( not ( = ?auto_71921 ?auto_71925 ) ) ( not ( = ?auto_71921 ?auto_71924 ) ) ( not ( = ?auto_71926 ?auto_71925 ) ) ( not ( = ?auto_71926 ?auto_71924 ) ) ( not ( = ?auto_71925 ?auto_71924 ) ) ( ON ?auto_71925 ?auto_71926 ) ( ON-TABLE ?auto_71923 ) ( ON ?auto_71927 ?auto_71923 ) ( not ( = ?auto_71923 ?auto_71927 ) ) ( not ( = ?auto_71923 ?auto_71922 ) ) ( not ( = ?auto_71923 ?auto_71924 ) ) ( not ( = ?auto_71927 ?auto_71922 ) ) ( not ( = ?auto_71927 ?auto_71924 ) ) ( not ( = ?auto_71922 ?auto_71924 ) ) ( not ( = ?auto_71920 ?auto_71922 ) ) ( not ( = ?auto_71920 ?auto_71923 ) ) ( not ( = ?auto_71920 ?auto_71927 ) ) ( not ( = ?auto_71921 ?auto_71922 ) ) ( not ( = ?auto_71921 ?auto_71923 ) ) ( not ( = ?auto_71921 ?auto_71927 ) ) ( not ( = ?auto_71926 ?auto_71922 ) ) ( not ( = ?auto_71926 ?auto_71923 ) ) ( not ( = ?auto_71926 ?auto_71927 ) ) ( not ( = ?auto_71925 ?auto_71922 ) ) ( not ( = ?auto_71925 ?auto_71923 ) ) ( not ( = ?auto_71925 ?auto_71927 ) ) ( ON ?auto_71924 ?auto_71925 ) ( CLEAR ?auto_71924 ) ( HOLDING ?auto_71922 ) ( CLEAR ?auto_71927 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_71923 ?auto_71927 ?auto_71922 )
      ( MAKE-2PILE ?auto_71920 ?auto_71921 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71928 - BLOCK
      ?auto_71929 - BLOCK
    )
    :vars
    (
      ?auto_71931 - BLOCK
      ?auto_71930 - BLOCK
      ?auto_71932 - BLOCK
      ?auto_71935 - BLOCK
      ?auto_71933 - BLOCK
      ?auto_71934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71931 ?auto_71929 ) ( ON-TABLE ?auto_71928 ) ( ON ?auto_71929 ?auto_71928 ) ( not ( = ?auto_71928 ?auto_71929 ) ) ( not ( = ?auto_71928 ?auto_71931 ) ) ( not ( = ?auto_71929 ?auto_71931 ) ) ( not ( = ?auto_71928 ?auto_71930 ) ) ( not ( = ?auto_71928 ?auto_71932 ) ) ( not ( = ?auto_71929 ?auto_71930 ) ) ( not ( = ?auto_71929 ?auto_71932 ) ) ( not ( = ?auto_71931 ?auto_71930 ) ) ( not ( = ?auto_71931 ?auto_71932 ) ) ( not ( = ?auto_71930 ?auto_71932 ) ) ( ON ?auto_71930 ?auto_71931 ) ( ON-TABLE ?auto_71935 ) ( ON ?auto_71933 ?auto_71935 ) ( not ( = ?auto_71935 ?auto_71933 ) ) ( not ( = ?auto_71935 ?auto_71934 ) ) ( not ( = ?auto_71935 ?auto_71932 ) ) ( not ( = ?auto_71933 ?auto_71934 ) ) ( not ( = ?auto_71933 ?auto_71932 ) ) ( not ( = ?auto_71934 ?auto_71932 ) ) ( not ( = ?auto_71928 ?auto_71934 ) ) ( not ( = ?auto_71928 ?auto_71935 ) ) ( not ( = ?auto_71928 ?auto_71933 ) ) ( not ( = ?auto_71929 ?auto_71934 ) ) ( not ( = ?auto_71929 ?auto_71935 ) ) ( not ( = ?auto_71929 ?auto_71933 ) ) ( not ( = ?auto_71931 ?auto_71934 ) ) ( not ( = ?auto_71931 ?auto_71935 ) ) ( not ( = ?auto_71931 ?auto_71933 ) ) ( not ( = ?auto_71930 ?auto_71934 ) ) ( not ( = ?auto_71930 ?auto_71935 ) ) ( not ( = ?auto_71930 ?auto_71933 ) ) ( ON ?auto_71932 ?auto_71930 ) ( CLEAR ?auto_71933 ) ( ON ?auto_71934 ?auto_71932 ) ( CLEAR ?auto_71934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71928 ?auto_71929 ?auto_71931 ?auto_71930 ?auto_71932 )
      ( MAKE-2PILE ?auto_71928 ?auto_71929 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71936 - BLOCK
      ?auto_71937 - BLOCK
    )
    :vars
    (
      ?auto_71940 - BLOCK
      ?auto_71943 - BLOCK
      ?auto_71938 - BLOCK
      ?auto_71939 - BLOCK
      ?auto_71942 - BLOCK
      ?auto_71941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71940 ?auto_71937 ) ( ON-TABLE ?auto_71936 ) ( ON ?auto_71937 ?auto_71936 ) ( not ( = ?auto_71936 ?auto_71937 ) ) ( not ( = ?auto_71936 ?auto_71940 ) ) ( not ( = ?auto_71937 ?auto_71940 ) ) ( not ( = ?auto_71936 ?auto_71943 ) ) ( not ( = ?auto_71936 ?auto_71938 ) ) ( not ( = ?auto_71937 ?auto_71943 ) ) ( not ( = ?auto_71937 ?auto_71938 ) ) ( not ( = ?auto_71940 ?auto_71943 ) ) ( not ( = ?auto_71940 ?auto_71938 ) ) ( not ( = ?auto_71943 ?auto_71938 ) ) ( ON ?auto_71943 ?auto_71940 ) ( ON-TABLE ?auto_71939 ) ( not ( = ?auto_71939 ?auto_71942 ) ) ( not ( = ?auto_71939 ?auto_71941 ) ) ( not ( = ?auto_71939 ?auto_71938 ) ) ( not ( = ?auto_71942 ?auto_71941 ) ) ( not ( = ?auto_71942 ?auto_71938 ) ) ( not ( = ?auto_71941 ?auto_71938 ) ) ( not ( = ?auto_71936 ?auto_71941 ) ) ( not ( = ?auto_71936 ?auto_71939 ) ) ( not ( = ?auto_71936 ?auto_71942 ) ) ( not ( = ?auto_71937 ?auto_71941 ) ) ( not ( = ?auto_71937 ?auto_71939 ) ) ( not ( = ?auto_71937 ?auto_71942 ) ) ( not ( = ?auto_71940 ?auto_71941 ) ) ( not ( = ?auto_71940 ?auto_71939 ) ) ( not ( = ?auto_71940 ?auto_71942 ) ) ( not ( = ?auto_71943 ?auto_71941 ) ) ( not ( = ?auto_71943 ?auto_71939 ) ) ( not ( = ?auto_71943 ?auto_71942 ) ) ( ON ?auto_71938 ?auto_71943 ) ( ON ?auto_71941 ?auto_71938 ) ( CLEAR ?auto_71941 ) ( HOLDING ?auto_71942 ) ( CLEAR ?auto_71939 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71939 ?auto_71942 )
      ( MAKE-2PILE ?auto_71936 ?auto_71937 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73237 - BLOCK
      ?auto_73238 - BLOCK
    )
    :vars
    (
      ?auto_73241 - BLOCK
      ?auto_73243 - BLOCK
      ?auto_73239 - BLOCK
      ?auto_73242 - BLOCK
      ?auto_73240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73241 ?auto_73238 ) ( ON-TABLE ?auto_73237 ) ( ON ?auto_73238 ?auto_73237 ) ( not ( = ?auto_73237 ?auto_73238 ) ) ( not ( = ?auto_73237 ?auto_73241 ) ) ( not ( = ?auto_73238 ?auto_73241 ) ) ( not ( = ?auto_73237 ?auto_73243 ) ) ( not ( = ?auto_73237 ?auto_73239 ) ) ( not ( = ?auto_73238 ?auto_73243 ) ) ( not ( = ?auto_73238 ?auto_73239 ) ) ( not ( = ?auto_73241 ?auto_73243 ) ) ( not ( = ?auto_73241 ?auto_73239 ) ) ( not ( = ?auto_73243 ?auto_73239 ) ) ( ON ?auto_73243 ?auto_73241 ) ( not ( = ?auto_73242 ?auto_73240 ) ) ( not ( = ?auto_73242 ?auto_73239 ) ) ( not ( = ?auto_73240 ?auto_73239 ) ) ( not ( = ?auto_73237 ?auto_73240 ) ) ( not ( = ?auto_73237 ?auto_73242 ) ) ( not ( = ?auto_73238 ?auto_73240 ) ) ( not ( = ?auto_73238 ?auto_73242 ) ) ( not ( = ?auto_73241 ?auto_73240 ) ) ( not ( = ?auto_73241 ?auto_73242 ) ) ( not ( = ?auto_73243 ?auto_73240 ) ) ( not ( = ?auto_73243 ?auto_73242 ) ) ( ON ?auto_73239 ?auto_73243 ) ( ON ?auto_73240 ?auto_73239 ) ( ON ?auto_73242 ?auto_73240 ) ( CLEAR ?auto_73242 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73237 ?auto_73238 ?auto_73241 ?auto_73243 ?auto_73239 ?auto_73240 )
      ( MAKE-2PILE ?auto_73237 ?auto_73238 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71952 - BLOCK
      ?auto_71953 - BLOCK
    )
    :vars
    (
      ?auto_71957 - BLOCK
      ?auto_71954 - BLOCK
      ?auto_71959 - BLOCK
      ?auto_71955 - BLOCK
      ?auto_71958 - BLOCK
      ?auto_71956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71957 ?auto_71953 ) ( ON-TABLE ?auto_71952 ) ( ON ?auto_71953 ?auto_71952 ) ( not ( = ?auto_71952 ?auto_71953 ) ) ( not ( = ?auto_71952 ?auto_71957 ) ) ( not ( = ?auto_71953 ?auto_71957 ) ) ( not ( = ?auto_71952 ?auto_71954 ) ) ( not ( = ?auto_71952 ?auto_71959 ) ) ( not ( = ?auto_71953 ?auto_71954 ) ) ( not ( = ?auto_71953 ?auto_71959 ) ) ( not ( = ?auto_71957 ?auto_71954 ) ) ( not ( = ?auto_71957 ?auto_71959 ) ) ( not ( = ?auto_71954 ?auto_71959 ) ) ( ON ?auto_71954 ?auto_71957 ) ( not ( = ?auto_71955 ?auto_71958 ) ) ( not ( = ?auto_71955 ?auto_71956 ) ) ( not ( = ?auto_71955 ?auto_71959 ) ) ( not ( = ?auto_71958 ?auto_71956 ) ) ( not ( = ?auto_71958 ?auto_71959 ) ) ( not ( = ?auto_71956 ?auto_71959 ) ) ( not ( = ?auto_71952 ?auto_71956 ) ) ( not ( = ?auto_71952 ?auto_71955 ) ) ( not ( = ?auto_71952 ?auto_71958 ) ) ( not ( = ?auto_71953 ?auto_71956 ) ) ( not ( = ?auto_71953 ?auto_71955 ) ) ( not ( = ?auto_71953 ?auto_71958 ) ) ( not ( = ?auto_71957 ?auto_71956 ) ) ( not ( = ?auto_71957 ?auto_71955 ) ) ( not ( = ?auto_71957 ?auto_71958 ) ) ( not ( = ?auto_71954 ?auto_71956 ) ) ( not ( = ?auto_71954 ?auto_71955 ) ) ( not ( = ?auto_71954 ?auto_71958 ) ) ( ON ?auto_71959 ?auto_71954 ) ( ON ?auto_71956 ?auto_71959 ) ( ON ?auto_71958 ?auto_71956 ) ( CLEAR ?auto_71958 ) ( HOLDING ?auto_71955 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_71955 )
      ( MAKE-2PILE ?auto_71952 ?auto_71953 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71960 - BLOCK
      ?auto_71961 - BLOCK
    )
    :vars
    (
      ?auto_71964 - BLOCK
      ?auto_71962 - BLOCK
      ?auto_71967 - BLOCK
      ?auto_71966 - BLOCK
      ?auto_71963 - BLOCK
      ?auto_71965 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_71964 ?auto_71961 ) ( ON-TABLE ?auto_71960 ) ( ON ?auto_71961 ?auto_71960 ) ( not ( = ?auto_71960 ?auto_71961 ) ) ( not ( = ?auto_71960 ?auto_71964 ) ) ( not ( = ?auto_71961 ?auto_71964 ) ) ( not ( = ?auto_71960 ?auto_71962 ) ) ( not ( = ?auto_71960 ?auto_71967 ) ) ( not ( = ?auto_71961 ?auto_71962 ) ) ( not ( = ?auto_71961 ?auto_71967 ) ) ( not ( = ?auto_71964 ?auto_71962 ) ) ( not ( = ?auto_71964 ?auto_71967 ) ) ( not ( = ?auto_71962 ?auto_71967 ) ) ( ON ?auto_71962 ?auto_71964 ) ( not ( = ?auto_71966 ?auto_71963 ) ) ( not ( = ?auto_71966 ?auto_71965 ) ) ( not ( = ?auto_71966 ?auto_71967 ) ) ( not ( = ?auto_71963 ?auto_71965 ) ) ( not ( = ?auto_71963 ?auto_71967 ) ) ( not ( = ?auto_71965 ?auto_71967 ) ) ( not ( = ?auto_71960 ?auto_71965 ) ) ( not ( = ?auto_71960 ?auto_71966 ) ) ( not ( = ?auto_71960 ?auto_71963 ) ) ( not ( = ?auto_71961 ?auto_71965 ) ) ( not ( = ?auto_71961 ?auto_71966 ) ) ( not ( = ?auto_71961 ?auto_71963 ) ) ( not ( = ?auto_71964 ?auto_71965 ) ) ( not ( = ?auto_71964 ?auto_71966 ) ) ( not ( = ?auto_71964 ?auto_71963 ) ) ( not ( = ?auto_71962 ?auto_71965 ) ) ( not ( = ?auto_71962 ?auto_71966 ) ) ( not ( = ?auto_71962 ?auto_71963 ) ) ( ON ?auto_71967 ?auto_71962 ) ( ON ?auto_71965 ?auto_71967 ) ( ON ?auto_71963 ?auto_71965 ) ( ON ?auto_71966 ?auto_71963 ) ( CLEAR ?auto_71966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_71960 ?auto_71961 ?auto_71964 ?auto_71962 ?auto_71967 ?auto_71965 ?auto_71963 )
      ( MAKE-2PILE ?auto_71960 ?auto_71961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71974 - BLOCK
      ?auto_71975 - BLOCK
      ?auto_71976 - BLOCK
      ?auto_71977 - BLOCK
      ?auto_71978 - BLOCK
      ?auto_71979 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_71979 ) ( CLEAR ?auto_71978 ) ( ON-TABLE ?auto_71974 ) ( ON ?auto_71975 ?auto_71974 ) ( ON ?auto_71976 ?auto_71975 ) ( ON ?auto_71977 ?auto_71976 ) ( ON ?auto_71978 ?auto_71977 ) ( not ( = ?auto_71974 ?auto_71975 ) ) ( not ( = ?auto_71974 ?auto_71976 ) ) ( not ( = ?auto_71974 ?auto_71977 ) ) ( not ( = ?auto_71974 ?auto_71978 ) ) ( not ( = ?auto_71974 ?auto_71979 ) ) ( not ( = ?auto_71975 ?auto_71976 ) ) ( not ( = ?auto_71975 ?auto_71977 ) ) ( not ( = ?auto_71975 ?auto_71978 ) ) ( not ( = ?auto_71975 ?auto_71979 ) ) ( not ( = ?auto_71976 ?auto_71977 ) ) ( not ( = ?auto_71976 ?auto_71978 ) ) ( not ( = ?auto_71976 ?auto_71979 ) ) ( not ( = ?auto_71977 ?auto_71978 ) ) ( not ( = ?auto_71977 ?auto_71979 ) ) ( not ( = ?auto_71978 ?auto_71979 ) ) )
    :subtasks
    ( ( !STACK ?auto_71979 ?auto_71978 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71980 - BLOCK
      ?auto_71981 - BLOCK
      ?auto_71982 - BLOCK
      ?auto_71983 - BLOCK
      ?auto_71984 - BLOCK
      ?auto_71985 - BLOCK
    )
    :vars
    (
      ?auto_71986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71984 ) ( ON-TABLE ?auto_71980 ) ( ON ?auto_71981 ?auto_71980 ) ( ON ?auto_71982 ?auto_71981 ) ( ON ?auto_71983 ?auto_71982 ) ( ON ?auto_71984 ?auto_71983 ) ( not ( = ?auto_71980 ?auto_71981 ) ) ( not ( = ?auto_71980 ?auto_71982 ) ) ( not ( = ?auto_71980 ?auto_71983 ) ) ( not ( = ?auto_71980 ?auto_71984 ) ) ( not ( = ?auto_71980 ?auto_71985 ) ) ( not ( = ?auto_71981 ?auto_71982 ) ) ( not ( = ?auto_71981 ?auto_71983 ) ) ( not ( = ?auto_71981 ?auto_71984 ) ) ( not ( = ?auto_71981 ?auto_71985 ) ) ( not ( = ?auto_71982 ?auto_71983 ) ) ( not ( = ?auto_71982 ?auto_71984 ) ) ( not ( = ?auto_71982 ?auto_71985 ) ) ( not ( = ?auto_71983 ?auto_71984 ) ) ( not ( = ?auto_71983 ?auto_71985 ) ) ( not ( = ?auto_71984 ?auto_71985 ) ) ( ON ?auto_71985 ?auto_71986 ) ( CLEAR ?auto_71985 ) ( HAND-EMPTY ) ( not ( = ?auto_71980 ?auto_71986 ) ) ( not ( = ?auto_71981 ?auto_71986 ) ) ( not ( = ?auto_71982 ?auto_71986 ) ) ( not ( = ?auto_71983 ?auto_71986 ) ) ( not ( = ?auto_71984 ?auto_71986 ) ) ( not ( = ?auto_71985 ?auto_71986 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_71985 ?auto_71986 )
      ( MAKE-6PILE ?auto_71980 ?auto_71981 ?auto_71982 ?auto_71983 ?auto_71984 ?auto_71985 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71987 - BLOCK
      ?auto_71988 - BLOCK
      ?auto_71989 - BLOCK
      ?auto_71990 - BLOCK
      ?auto_71991 - BLOCK
      ?auto_71992 - BLOCK
    )
    :vars
    (
      ?auto_71993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71987 ) ( ON ?auto_71988 ?auto_71987 ) ( ON ?auto_71989 ?auto_71988 ) ( ON ?auto_71990 ?auto_71989 ) ( not ( = ?auto_71987 ?auto_71988 ) ) ( not ( = ?auto_71987 ?auto_71989 ) ) ( not ( = ?auto_71987 ?auto_71990 ) ) ( not ( = ?auto_71987 ?auto_71991 ) ) ( not ( = ?auto_71987 ?auto_71992 ) ) ( not ( = ?auto_71988 ?auto_71989 ) ) ( not ( = ?auto_71988 ?auto_71990 ) ) ( not ( = ?auto_71988 ?auto_71991 ) ) ( not ( = ?auto_71988 ?auto_71992 ) ) ( not ( = ?auto_71989 ?auto_71990 ) ) ( not ( = ?auto_71989 ?auto_71991 ) ) ( not ( = ?auto_71989 ?auto_71992 ) ) ( not ( = ?auto_71990 ?auto_71991 ) ) ( not ( = ?auto_71990 ?auto_71992 ) ) ( not ( = ?auto_71991 ?auto_71992 ) ) ( ON ?auto_71992 ?auto_71993 ) ( CLEAR ?auto_71992 ) ( not ( = ?auto_71987 ?auto_71993 ) ) ( not ( = ?auto_71988 ?auto_71993 ) ) ( not ( = ?auto_71989 ?auto_71993 ) ) ( not ( = ?auto_71990 ?auto_71993 ) ) ( not ( = ?auto_71991 ?auto_71993 ) ) ( not ( = ?auto_71992 ?auto_71993 ) ) ( HOLDING ?auto_71991 ) ( CLEAR ?auto_71990 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_71987 ?auto_71988 ?auto_71989 ?auto_71990 ?auto_71991 )
      ( MAKE-6PILE ?auto_71987 ?auto_71988 ?auto_71989 ?auto_71990 ?auto_71991 ?auto_71992 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_71994 - BLOCK
      ?auto_71995 - BLOCK
      ?auto_71996 - BLOCK
      ?auto_71997 - BLOCK
      ?auto_71998 - BLOCK
      ?auto_71999 - BLOCK
    )
    :vars
    (
      ?auto_72000 - BLOCK
      ?auto_72001 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_71994 ) ( ON ?auto_71995 ?auto_71994 ) ( ON ?auto_71996 ?auto_71995 ) ( ON ?auto_71997 ?auto_71996 ) ( not ( = ?auto_71994 ?auto_71995 ) ) ( not ( = ?auto_71994 ?auto_71996 ) ) ( not ( = ?auto_71994 ?auto_71997 ) ) ( not ( = ?auto_71994 ?auto_71998 ) ) ( not ( = ?auto_71994 ?auto_71999 ) ) ( not ( = ?auto_71995 ?auto_71996 ) ) ( not ( = ?auto_71995 ?auto_71997 ) ) ( not ( = ?auto_71995 ?auto_71998 ) ) ( not ( = ?auto_71995 ?auto_71999 ) ) ( not ( = ?auto_71996 ?auto_71997 ) ) ( not ( = ?auto_71996 ?auto_71998 ) ) ( not ( = ?auto_71996 ?auto_71999 ) ) ( not ( = ?auto_71997 ?auto_71998 ) ) ( not ( = ?auto_71997 ?auto_71999 ) ) ( not ( = ?auto_71998 ?auto_71999 ) ) ( ON ?auto_71999 ?auto_72000 ) ( not ( = ?auto_71994 ?auto_72000 ) ) ( not ( = ?auto_71995 ?auto_72000 ) ) ( not ( = ?auto_71996 ?auto_72000 ) ) ( not ( = ?auto_71997 ?auto_72000 ) ) ( not ( = ?auto_71998 ?auto_72000 ) ) ( not ( = ?auto_71999 ?auto_72000 ) ) ( CLEAR ?auto_71997 ) ( ON ?auto_71998 ?auto_71999 ) ( CLEAR ?auto_71998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72001 ) ( ON ?auto_72000 ?auto_72001 ) ( not ( = ?auto_72001 ?auto_72000 ) ) ( not ( = ?auto_72001 ?auto_71999 ) ) ( not ( = ?auto_72001 ?auto_71998 ) ) ( not ( = ?auto_71994 ?auto_72001 ) ) ( not ( = ?auto_71995 ?auto_72001 ) ) ( not ( = ?auto_71996 ?auto_72001 ) ) ( not ( = ?auto_71997 ?auto_72001 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72001 ?auto_72000 ?auto_71999 )
      ( MAKE-6PILE ?auto_71994 ?auto_71995 ?auto_71996 ?auto_71997 ?auto_71998 ?auto_71999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72002 - BLOCK
      ?auto_72003 - BLOCK
      ?auto_72004 - BLOCK
      ?auto_72005 - BLOCK
      ?auto_72006 - BLOCK
      ?auto_72007 - BLOCK
    )
    :vars
    (
      ?auto_72009 - BLOCK
      ?auto_72008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72002 ) ( ON ?auto_72003 ?auto_72002 ) ( ON ?auto_72004 ?auto_72003 ) ( not ( = ?auto_72002 ?auto_72003 ) ) ( not ( = ?auto_72002 ?auto_72004 ) ) ( not ( = ?auto_72002 ?auto_72005 ) ) ( not ( = ?auto_72002 ?auto_72006 ) ) ( not ( = ?auto_72002 ?auto_72007 ) ) ( not ( = ?auto_72003 ?auto_72004 ) ) ( not ( = ?auto_72003 ?auto_72005 ) ) ( not ( = ?auto_72003 ?auto_72006 ) ) ( not ( = ?auto_72003 ?auto_72007 ) ) ( not ( = ?auto_72004 ?auto_72005 ) ) ( not ( = ?auto_72004 ?auto_72006 ) ) ( not ( = ?auto_72004 ?auto_72007 ) ) ( not ( = ?auto_72005 ?auto_72006 ) ) ( not ( = ?auto_72005 ?auto_72007 ) ) ( not ( = ?auto_72006 ?auto_72007 ) ) ( ON ?auto_72007 ?auto_72009 ) ( not ( = ?auto_72002 ?auto_72009 ) ) ( not ( = ?auto_72003 ?auto_72009 ) ) ( not ( = ?auto_72004 ?auto_72009 ) ) ( not ( = ?auto_72005 ?auto_72009 ) ) ( not ( = ?auto_72006 ?auto_72009 ) ) ( not ( = ?auto_72007 ?auto_72009 ) ) ( ON ?auto_72006 ?auto_72007 ) ( CLEAR ?auto_72006 ) ( ON-TABLE ?auto_72008 ) ( ON ?auto_72009 ?auto_72008 ) ( not ( = ?auto_72008 ?auto_72009 ) ) ( not ( = ?auto_72008 ?auto_72007 ) ) ( not ( = ?auto_72008 ?auto_72006 ) ) ( not ( = ?auto_72002 ?auto_72008 ) ) ( not ( = ?auto_72003 ?auto_72008 ) ) ( not ( = ?auto_72004 ?auto_72008 ) ) ( not ( = ?auto_72005 ?auto_72008 ) ) ( HOLDING ?auto_72005 ) ( CLEAR ?auto_72004 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72002 ?auto_72003 ?auto_72004 ?auto_72005 )
      ( MAKE-6PILE ?auto_72002 ?auto_72003 ?auto_72004 ?auto_72005 ?auto_72006 ?auto_72007 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72010 - BLOCK
      ?auto_72011 - BLOCK
      ?auto_72012 - BLOCK
      ?auto_72013 - BLOCK
      ?auto_72014 - BLOCK
      ?auto_72015 - BLOCK
    )
    :vars
    (
      ?auto_72016 - BLOCK
      ?auto_72017 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72010 ) ( ON ?auto_72011 ?auto_72010 ) ( ON ?auto_72012 ?auto_72011 ) ( not ( = ?auto_72010 ?auto_72011 ) ) ( not ( = ?auto_72010 ?auto_72012 ) ) ( not ( = ?auto_72010 ?auto_72013 ) ) ( not ( = ?auto_72010 ?auto_72014 ) ) ( not ( = ?auto_72010 ?auto_72015 ) ) ( not ( = ?auto_72011 ?auto_72012 ) ) ( not ( = ?auto_72011 ?auto_72013 ) ) ( not ( = ?auto_72011 ?auto_72014 ) ) ( not ( = ?auto_72011 ?auto_72015 ) ) ( not ( = ?auto_72012 ?auto_72013 ) ) ( not ( = ?auto_72012 ?auto_72014 ) ) ( not ( = ?auto_72012 ?auto_72015 ) ) ( not ( = ?auto_72013 ?auto_72014 ) ) ( not ( = ?auto_72013 ?auto_72015 ) ) ( not ( = ?auto_72014 ?auto_72015 ) ) ( ON ?auto_72015 ?auto_72016 ) ( not ( = ?auto_72010 ?auto_72016 ) ) ( not ( = ?auto_72011 ?auto_72016 ) ) ( not ( = ?auto_72012 ?auto_72016 ) ) ( not ( = ?auto_72013 ?auto_72016 ) ) ( not ( = ?auto_72014 ?auto_72016 ) ) ( not ( = ?auto_72015 ?auto_72016 ) ) ( ON ?auto_72014 ?auto_72015 ) ( ON-TABLE ?auto_72017 ) ( ON ?auto_72016 ?auto_72017 ) ( not ( = ?auto_72017 ?auto_72016 ) ) ( not ( = ?auto_72017 ?auto_72015 ) ) ( not ( = ?auto_72017 ?auto_72014 ) ) ( not ( = ?auto_72010 ?auto_72017 ) ) ( not ( = ?auto_72011 ?auto_72017 ) ) ( not ( = ?auto_72012 ?auto_72017 ) ) ( not ( = ?auto_72013 ?auto_72017 ) ) ( CLEAR ?auto_72012 ) ( ON ?auto_72013 ?auto_72014 ) ( CLEAR ?auto_72013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72017 ?auto_72016 ?auto_72015 ?auto_72014 )
      ( MAKE-6PILE ?auto_72010 ?auto_72011 ?auto_72012 ?auto_72013 ?auto_72014 ?auto_72015 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72018 - BLOCK
      ?auto_72019 - BLOCK
      ?auto_72020 - BLOCK
      ?auto_72021 - BLOCK
      ?auto_72022 - BLOCK
      ?auto_72023 - BLOCK
    )
    :vars
    (
      ?auto_72025 - BLOCK
      ?auto_72024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72018 ) ( ON ?auto_72019 ?auto_72018 ) ( not ( = ?auto_72018 ?auto_72019 ) ) ( not ( = ?auto_72018 ?auto_72020 ) ) ( not ( = ?auto_72018 ?auto_72021 ) ) ( not ( = ?auto_72018 ?auto_72022 ) ) ( not ( = ?auto_72018 ?auto_72023 ) ) ( not ( = ?auto_72019 ?auto_72020 ) ) ( not ( = ?auto_72019 ?auto_72021 ) ) ( not ( = ?auto_72019 ?auto_72022 ) ) ( not ( = ?auto_72019 ?auto_72023 ) ) ( not ( = ?auto_72020 ?auto_72021 ) ) ( not ( = ?auto_72020 ?auto_72022 ) ) ( not ( = ?auto_72020 ?auto_72023 ) ) ( not ( = ?auto_72021 ?auto_72022 ) ) ( not ( = ?auto_72021 ?auto_72023 ) ) ( not ( = ?auto_72022 ?auto_72023 ) ) ( ON ?auto_72023 ?auto_72025 ) ( not ( = ?auto_72018 ?auto_72025 ) ) ( not ( = ?auto_72019 ?auto_72025 ) ) ( not ( = ?auto_72020 ?auto_72025 ) ) ( not ( = ?auto_72021 ?auto_72025 ) ) ( not ( = ?auto_72022 ?auto_72025 ) ) ( not ( = ?auto_72023 ?auto_72025 ) ) ( ON ?auto_72022 ?auto_72023 ) ( ON-TABLE ?auto_72024 ) ( ON ?auto_72025 ?auto_72024 ) ( not ( = ?auto_72024 ?auto_72025 ) ) ( not ( = ?auto_72024 ?auto_72023 ) ) ( not ( = ?auto_72024 ?auto_72022 ) ) ( not ( = ?auto_72018 ?auto_72024 ) ) ( not ( = ?auto_72019 ?auto_72024 ) ) ( not ( = ?auto_72020 ?auto_72024 ) ) ( not ( = ?auto_72021 ?auto_72024 ) ) ( ON ?auto_72021 ?auto_72022 ) ( CLEAR ?auto_72021 ) ( HOLDING ?auto_72020 ) ( CLEAR ?auto_72019 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72018 ?auto_72019 ?auto_72020 )
      ( MAKE-6PILE ?auto_72018 ?auto_72019 ?auto_72020 ?auto_72021 ?auto_72022 ?auto_72023 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72026 - BLOCK
      ?auto_72027 - BLOCK
      ?auto_72028 - BLOCK
      ?auto_72029 - BLOCK
      ?auto_72030 - BLOCK
      ?auto_72031 - BLOCK
    )
    :vars
    (
      ?auto_72032 - BLOCK
      ?auto_72033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72026 ) ( ON ?auto_72027 ?auto_72026 ) ( not ( = ?auto_72026 ?auto_72027 ) ) ( not ( = ?auto_72026 ?auto_72028 ) ) ( not ( = ?auto_72026 ?auto_72029 ) ) ( not ( = ?auto_72026 ?auto_72030 ) ) ( not ( = ?auto_72026 ?auto_72031 ) ) ( not ( = ?auto_72027 ?auto_72028 ) ) ( not ( = ?auto_72027 ?auto_72029 ) ) ( not ( = ?auto_72027 ?auto_72030 ) ) ( not ( = ?auto_72027 ?auto_72031 ) ) ( not ( = ?auto_72028 ?auto_72029 ) ) ( not ( = ?auto_72028 ?auto_72030 ) ) ( not ( = ?auto_72028 ?auto_72031 ) ) ( not ( = ?auto_72029 ?auto_72030 ) ) ( not ( = ?auto_72029 ?auto_72031 ) ) ( not ( = ?auto_72030 ?auto_72031 ) ) ( ON ?auto_72031 ?auto_72032 ) ( not ( = ?auto_72026 ?auto_72032 ) ) ( not ( = ?auto_72027 ?auto_72032 ) ) ( not ( = ?auto_72028 ?auto_72032 ) ) ( not ( = ?auto_72029 ?auto_72032 ) ) ( not ( = ?auto_72030 ?auto_72032 ) ) ( not ( = ?auto_72031 ?auto_72032 ) ) ( ON ?auto_72030 ?auto_72031 ) ( ON-TABLE ?auto_72033 ) ( ON ?auto_72032 ?auto_72033 ) ( not ( = ?auto_72033 ?auto_72032 ) ) ( not ( = ?auto_72033 ?auto_72031 ) ) ( not ( = ?auto_72033 ?auto_72030 ) ) ( not ( = ?auto_72026 ?auto_72033 ) ) ( not ( = ?auto_72027 ?auto_72033 ) ) ( not ( = ?auto_72028 ?auto_72033 ) ) ( not ( = ?auto_72029 ?auto_72033 ) ) ( ON ?auto_72029 ?auto_72030 ) ( CLEAR ?auto_72027 ) ( ON ?auto_72028 ?auto_72029 ) ( CLEAR ?auto_72028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72033 ?auto_72032 ?auto_72031 ?auto_72030 ?auto_72029 )
      ( MAKE-6PILE ?auto_72026 ?auto_72027 ?auto_72028 ?auto_72029 ?auto_72030 ?auto_72031 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72034 - BLOCK
      ?auto_72035 - BLOCK
      ?auto_72036 - BLOCK
      ?auto_72037 - BLOCK
      ?auto_72038 - BLOCK
      ?auto_72039 - BLOCK
    )
    :vars
    (
      ?auto_72041 - BLOCK
      ?auto_72040 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72034 ) ( not ( = ?auto_72034 ?auto_72035 ) ) ( not ( = ?auto_72034 ?auto_72036 ) ) ( not ( = ?auto_72034 ?auto_72037 ) ) ( not ( = ?auto_72034 ?auto_72038 ) ) ( not ( = ?auto_72034 ?auto_72039 ) ) ( not ( = ?auto_72035 ?auto_72036 ) ) ( not ( = ?auto_72035 ?auto_72037 ) ) ( not ( = ?auto_72035 ?auto_72038 ) ) ( not ( = ?auto_72035 ?auto_72039 ) ) ( not ( = ?auto_72036 ?auto_72037 ) ) ( not ( = ?auto_72036 ?auto_72038 ) ) ( not ( = ?auto_72036 ?auto_72039 ) ) ( not ( = ?auto_72037 ?auto_72038 ) ) ( not ( = ?auto_72037 ?auto_72039 ) ) ( not ( = ?auto_72038 ?auto_72039 ) ) ( ON ?auto_72039 ?auto_72041 ) ( not ( = ?auto_72034 ?auto_72041 ) ) ( not ( = ?auto_72035 ?auto_72041 ) ) ( not ( = ?auto_72036 ?auto_72041 ) ) ( not ( = ?auto_72037 ?auto_72041 ) ) ( not ( = ?auto_72038 ?auto_72041 ) ) ( not ( = ?auto_72039 ?auto_72041 ) ) ( ON ?auto_72038 ?auto_72039 ) ( ON-TABLE ?auto_72040 ) ( ON ?auto_72041 ?auto_72040 ) ( not ( = ?auto_72040 ?auto_72041 ) ) ( not ( = ?auto_72040 ?auto_72039 ) ) ( not ( = ?auto_72040 ?auto_72038 ) ) ( not ( = ?auto_72034 ?auto_72040 ) ) ( not ( = ?auto_72035 ?auto_72040 ) ) ( not ( = ?auto_72036 ?auto_72040 ) ) ( not ( = ?auto_72037 ?auto_72040 ) ) ( ON ?auto_72037 ?auto_72038 ) ( ON ?auto_72036 ?auto_72037 ) ( CLEAR ?auto_72036 ) ( HOLDING ?auto_72035 ) ( CLEAR ?auto_72034 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72034 ?auto_72035 )
      ( MAKE-6PILE ?auto_72034 ?auto_72035 ?auto_72036 ?auto_72037 ?auto_72038 ?auto_72039 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72042 - BLOCK
      ?auto_72043 - BLOCK
      ?auto_72044 - BLOCK
      ?auto_72045 - BLOCK
      ?auto_72046 - BLOCK
      ?auto_72047 - BLOCK
    )
    :vars
    (
      ?auto_72049 - BLOCK
      ?auto_72048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72042 ) ( not ( = ?auto_72042 ?auto_72043 ) ) ( not ( = ?auto_72042 ?auto_72044 ) ) ( not ( = ?auto_72042 ?auto_72045 ) ) ( not ( = ?auto_72042 ?auto_72046 ) ) ( not ( = ?auto_72042 ?auto_72047 ) ) ( not ( = ?auto_72043 ?auto_72044 ) ) ( not ( = ?auto_72043 ?auto_72045 ) ) ( not ( = ?auto_72043 ?auto_72046 ) ) ( not ( = ?auto_72043 ?auto_72047 ) ) ( not ( = ?auto_72044 ?auto_72045 ) ) ( not ( = ?auto_72044 ?auto_72046 ) ) ( not ( = ?auto_72044 ?auto_72047 ) ) ( not ( = ?auto_72045 ?auto_72046 ) ) ( not ( = ?auto_72045 ?auto_72047 ) ) ( not ( = ?auto_72046 ?auto_72047 ) ) ( ON ?auto_72047 ?auto_72049 ) ( not ( = ?auto_72042 ?auto_72049 ) ) ( not ( = ?auto_72043 ?auto_72049 ) ) ( not ( = ?auto_72044 ?auto_72049 ) ) ( not ( = ?auto_72045 ?auto_72049 ) ) ( not ( = ?auto_72046 ?auto_72049 ) ) ( not ( = ?auto_72047 ?auto_72049 ) ) ( ON ?auto_72046 ?auto_72047 ) ( ON-TABLE ?auto_72048 ) ( ON ?auto_72049 ?auto_72048 ) ( not ( = ?auto_72048 ?auto_72049 ) ) ( not ( = ?auto_72048 ?auto_72047 ) ) ( not ( = ?auto_72048 ?auto_72046 ) ) ( not ( = ?auto_72042 ?auto_72048 ) ) ( not ( = ?auto_72043 ?auto_72048 ) ) ( not ( = ?auto_72044 ?auto_72048 ) ) ( not ( = ?auto_72045 ?auto_72048 ) ) ( ON ?auto_72045 ?auto_72046 ) ( ON ?auto_72044 ?auto_72045 ) ( CLEAR ?auto_72042 ) ( ON ?auto_72043 ?auto_72044 ) ( CLEAR ?auto_72043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72048 ?auto_72049 ?auto_72047 ?auto_72046 ?auto_72045 ?auto_72044 )
      ( MAKE-6PILE ?auto_72042 ?auto_72043 ?auto_72044 ?auto_72045 ?auto_72046 ?auto_72047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72050 - BLOCK
      ?auto_72051 - BLOCK
      ?auto_72052 - BLOCK
      ?auto_72053 - BLOCK
      ?auto_72054 - BLOCK
      ?auto_72055 - BLOCK
    )
    :vars
    (
      ?auto_72057 - BLOCK
      ?auto_72056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72050 ?auto_72051 ) ) ( not ( = ?auto_72050 ?auto_72052 ) ) ( not ( = ?auto_72050 ?auto_72053 ) ) ( not ( = ?auto_72050 ?auto_72054 ) ) ( not ( = ?auto_72050 ?auto_72055 ) ) ( not ( = ?auto_72051 ?auto_72052 ) ) ( not ( = ?auto_72051 ?auto_72053 ) ) ( not ( = ?auto_72051 ?auto_72054 ) ) ( not ( = ?auto_72051 ?auto_72055 ) ) ( not ( = ?auto_72052 ?auto_72053 ) ) ( not ( = ?auto_72052 ?auto_72054 ) ) ( not ( = ?auto_72052 ?auto_72055 ) ) ( not ( = ?auto_72053 ?auto_72054 ) ) ( not ( = ?auto_72053 ?auto_72055 ) ) ( not ( = ?auto_72054 ?auto_72055 ) ) ( ON ?auto_72055 ?auto_72057 ) ( not ( = ?auto_72050 ?auto_72057 ) ) ( not ( = ?auto_72051 ?auto_72057 ) ) ( not ( = ?auto_72052 ?auto_72057 ) ) ( not ( = ?auto_72053 ?auto_72057 ) ) ( not ( = ?auto_72054 ?auto_72057 ) ) ( not ( = ?auto_72055 ?auto_72057 ) ) ( ON ?auto_72054 ?auto_72055 ) ( ON-TABLE ?auto_72056 ) ( ON ?auto_72057 ?auto_72056 ) ( not ( = ?auto_72056 ?auto_72057 ) ) ( not ( = ?auto_72056 ?auto_72055 ) ) ( not ( = ?auto_72056 ?auto_72054 ) ) ( not ( = ?auto_72050 ?auto_72056 ) ) ( not ( = ?auto_72051 ?auto_72056 ) ) ( not ( = ?auto_72052 ?auto_72056 ) ) ( not ( = ?auto_72053 ?auto_72056 ) ) ( ON ?auto_72053 ?auto_72054 ) ( ON ?auto_72052 ?auto_72053 ) ( ON ?auto_72051 ?auto_72052 ) ( CLEAR ?auto_72051 ) ( HOLDING ?auto_72050 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72050 )
      ( MAKE-6PILE ?auto_72050 ?auto_72051 ?auto_72052 ?auto_72053 ?auto_72054 ?auto_72055 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_72058 - BLOCK
      ?auto_72059 - BLOCK
      ?auto_72060 - BLOCK
      ?auto_72061 - BLOCK
      ?auto_72062 - BLOCK
      ?auto_72063 - BLOCK
    )
    :vars
    (
      ?auto_72065 - BLOCK
      ?auto_72064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72058 ?auto_72059 ) ) ( not ( = ?auto_72058 ?auto_72060 ) ) ( not ( = ?auto_72058 ?auto_72061 ) ) ( not ( = ?auto_72058 ?auto_72062 ) ) ( not ( = ?auto_72058 ?auto_72063 ) ) ( not ( = ?auto_72059 ?auto_72060 ) ) ( not ( = ?auto_72059 ?auto_72061 ) ) ( not ( = ?auto_72059 ?auto_72062 ) ) ( not ( = ?auto_72059 ?auto_72063 ) ) ( not ( = ?auto_72060 ?auto_72061 ) ) ( not ( = ?auto_72060 ?auto_72062 ) ) ( not ( = ?auto_72060 ?auto_72063 ) ) ( not ( = ?auto_72061 ?auto_72062 ) ) ( not ( = ?auto_72061 ?auto_72063 ) ) ( not ( = ?auto_72062 ?auto_72063 ) ) ( ON ?auto_72063 ?auto_72065 ) ( not ( = ?auto_72058 ?auto_72065 ) ) ( not ( = ?auto_72059 ?auto_72065 ) ) ( not ( = ?auto_72060 ?auto_72065 ) ) ( not ( = ?auto_72061 ?auto_72065 ) ) ( not ( = ?auto_72062 ?auto_72065 ) ) ( not ( = ?auto_72063 ?auto_72065 ) ) ( ON ?auto_72062 ?auto_72063 ) ( ON-TABLE ?auto_72064 ) ( ON ?auto_72065 ?auto_72064 ) ( not ( = ?auto_72064 ?auto_72065 ) ) ( not ( = ?auto_72064 ?auto_72063 ) ) ( not ( = ?auto_72064 ?auto_72062 ) ) ( not ( = ?auto_72058 ?auto_72064 ) ) ( not ( = ?auto_72059 ?auto_72064 ) ) ( not ( = ?auto_72060 ?auto_72064 ) ) ( not ( = ?auto_72061 ?auto_72064 ) ) ( ON ?auto_72061 ?auto_72062 ) ( ON ?auto_72060 ?auto_72061 ) ( ON ?auto_72059 ?auto_72060 ) ( ON ?auto_72058 ?auto_72059 ) ( CLEAR ?auto_72058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_72064 ?auto_72065 ?auto_72063 ?auto_72062 ?auto_72061 ?auto_72060 ?auto_72059 )
      ( MAKE-6PILE ?auto_72058 ?auto_72059 ?auto_72060 ?auto_72061 ?auto_72062 ?auto_72063 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72067 - BLOCK
    )
    :vars
    (
      ?auto_72068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72068 ?auto_72067 ) ( CLEAR ?auto_72068 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72067 ) ( not ( = ?auto_72067 ?auto_72068 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72068 ?auto_72067 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72069 - BLOCK
    )
    :vars
    (
      ?auto_72070 - BLOCK
      ?auto_72071 - BLOCK
      ?auto_72072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72070 ?auto_72069 ) ( CLEAR ?auto_72070 ) ( ON-TABLE ?auto_72069 ) ( not ( = ?auto_72069 ?auto_72070 ) ) ( HOLDING ?auto_72071 ) ( CLEAR ?auto_72072 ) ( not ( = ?auto_72069 ?auto_72071 ) ) ( not ( = ?auto_72069 ?auto_72072 ) ) ( not ( = ?auto_72070 ?auto_72071 ) ) ( not ( = ?auto_72070 ?auto_72072 ) ) ( not ( = ?auto_72071 ?auto_72072 ) ) )
    :subtasks
    ( ( !STACK ?auto_72071 ?auto_72072 )
      ( MAKE-1PILE ?auto_72069 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72073 - BLOCK
    )
    :vars
    (
      ?auto_72075 - BLOCK
      ?auto_72076 - BLOCK
      ?auto_72074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72075 ?auto_72073 ) ( ON-TABLE ?auto_72073 ) ( not ( = ?auto_72073 ?auto_72075 ) ) ( CLEAR ?auto_72076 ) ( not ( = ?auto_72073 ?auto_72074 ) ) ( not ( = ?auto_72073 ?auto_72076 ) ) ( not ( = ?auto_72075 ?auto_72074 ) ) ( not ( = ?auto_72075 ?auto_72076 ) ) ( not ( = ?auto_72074 ?auto_72076 ) ) ( ON ?auto_72074 ?auto_72075 ) ( CLEAR ?auto_72074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72073 ?auto_72075 )
      ( MAKE-1PILE ?auto_72073 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72077 - BLOCK
    )
    :vars
    (
      ?auto_72079 - BLOCK
      ?auto_72080 - BLOCK
      ?auto_72078 - BLOCK
      ?auto_72081 - BLOCK
      ?auto_72084 - BLOCK
      ?auto_72082 - BLOCK
      ?auto_72083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72079 ?auto_72077 ) ( ON-TABLE ?auto_72077 ) ( not ( = ?auto_72077 ?auto_72079 ) ) ( not ( = ?auto_72077 ?auto_72080 ) ) ( not ( = ?auto_72077 ?auto_72078 ) ) ( not ( = ?auto_72079 ?auto_72080 ) ) ( not ( = ?auto_72079 ?auto_72078 ) ) ( not ( = ?auto_72080 ?auto_72078 ) ) ( ON ?auto_72080 ?auto_72079 ) ( CLEAR ?auto_72080 ) ( HOLDING ?auto_72078 ) ( CLEAR ?auto_72081 ) ( ON-TABLE ?auto_72084 ) ( ON ?auto_72082 ?auto_72084 ) ( ON ?auto_72083 ?auto_72082 ) ( ON ?auto_72081 ?auto_72083 ) ( not ( = ?auto_72084 ?auto_72082 ) ) ( not ( = ?auto_72084 ?auto_72083 ) ) ( not ( = ?auto_72084 ?auto_72081 ) ) ( not ( = ?auto_72084 ?auto_72078 ) ) ( not ( = ?auto_72082 ?auto_72083 ) ) ( not ( = ?auto_72082 ?auto_72081 ) ) ( not ( = ?auto_72082 ?auto_72078 ) ) ( not ( = ?auto_72083 ?auto_72081 ) ) ( not ( = ?auto_72083 ?auto_72078 ) ) ( not ( = ?auto_72081 ?auto_72078 ) ) ( not ( = ?auto_72077 ?auto_72081 ) ) ( not ( = ?auto_72077 ?auto_72084 ) ) ( not ( = ?auto_72077 ?auto_72082 ) ) ( not ( = ?auto_72077 ?auto_72083 ) ) ( not ( = ?auto_72079 ?auto_72081 ) ) ( not ( = ?auto_72079 ?auto_72084 ) ) ( not ( = ?auto_72079 ?auto_72082 ) ) ( not ( = ?auto_72079 ?auto_72083 ) ) ( not ( = ?auto_72080 ?auto_72081 ) ) ( not ( = ?auto_72080 ?auto_72084 ) ) ( not ( = ?auto_72080 ?auto_72082 ) ) ( not ( = ?auto_72080 ?auto_72083 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72084 ?auto_72082 ?auto_72083 ?auto_72081 ?auto_72078 )
      ( MAKE-1PILE ?auto_72077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72085 - BLOCK
    )
    :vars
    (
      ?auto_72089 - BLOCK
      ?auto_72092 - BLOCK
      ?auto_72091 - BLOCK
      ?auto_72086 - BLOCK
      ?auto_72090 - BLOCK
      ?auto_72088 - BLOCK
      ?auto_72087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72089 ?auto_72085 ) ( ON-TABLE ?auto_72085 ) ( not ( = ?auto_72085 ?auto_72089 ) ) ( not ( = ?auto_72085 ?auto_72092 ) ) ( not ( = ?auto_72085 ?auto_72091 ) ) ( not ( = ?auto_72089 ?auto_72092 ) ) ( not ( = ?auto_72089 ?auto_72091 ) ) ( not ( = ?auto_72092 ?auto_72091 ) ) ( ON ?auto_72092 ?auto_72089 ) ( CLEAR ?auto_72086 ) ( ON-TABLE ?auto_72090 ) ( ON ?auto_72088 ?auto_72090 ) ( ON ?auto_72087 ?auto_72088 ) ( ON ?auto_72086 ?auto_72087 ) ( not ( = ?auto_72090 ?auto_72088 ) ) ( not ( = ?auto_72090 ?auto_72087 ) ) ( not ( = ?auto_72090 ?auto_72086 ) ) ( not ( = ?auto_72090 ?auto_72091 ) ) ( not ( = ?auto_72088 ?auto_72087 ) ) ( not ( = ?auto_72088 ?auto_72086 ) ) ( not ( = ?auto_72088 ?auto_72091 ) ) ( not ( = ?auto_72087 ?auto_72086 ) ) ( not ( = ?auto_72087 ?auto_72091 ) ) ( not ( = ?auto_72086 ?auto_72091 ) ) ( not ( = ?auto_72085 ?auto_72086 ) ) ( not ( = ?auto_72085 ?auto_72090 ) ) ( not ( = ?auto_72085 ?auto_72088 ) ) ( not ( = ?auto_72085 ?auto_72087 ) ) ( not ( = ?auto_72089 ?auto_72086 ) ) ( not ( = ?auto_72089 ?auto_72090 ) ) ( not ( = ?auto_72089 ?auto_72088 ) ) ( not ( = ?auto_72089 ?auto_72087 ) ) ( not ( = ?auto_72092 ?auto_72086 ) ) ( not ( = ?auto_72092 ?auto_72090 ) ) ( not ( = ?auto_72092 ?auto_72088 ) ) ( not ( = ?auto_72092 ?auto_72087 ) ) ( ON ?auto_72091 ?auto_72092 ) ( CLEAR ?auto_72091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72085 ?auto_72089 ?auto_72092 )
      ( MAKE-1PILE ?auto_72085 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72093 - BLOCK
    )
    :vars
    (
      ?auto_72098 - BLOCK
      ?auto_72095 - BLOCK
      ?auto_72097 - BLOCK
      ?auto_72094 - BLOCK
      ?auto_72100 - BLOCK
      ?auto_72099 - BLOCK
      ?auto_72096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72098 ?auto_72093 ) ( ON-TABLE ?auto_72093 ) ( not ( = ?auto_72093 ?auto_72098 ) ) ( not ( = ?auto_72093 ?auto_72095 ) ) ( not ( = ?auto_72093 ?auto_72097 ) ) ( not ( = ?auto_72098 ?auto_72095 ) ) ( not ( = ?auto_72098 ?auto_72097 ) ) ( not ( = ?auto_72095 ?auto_72097 ) ) ( ON ?auto_72095 ?auto_72098 ) ( ON-TABLE ?auto_72094 ) ( ON ?auto_72100 ?auto_72094 ) ( ON ?auto_72099 ?auto_72100 ) ( not ( = ?auto_72094 ?auto_72100 ) ) ( not ( = ?auto_72094 ?auto_72099 ) ) ( not ( = ?auto_72094 ?auto_72096 ) ) ( not ( = ?auto_72094 ?auto_72097 ) ) ( not ( = ?auto_72100 ?auto_72099 ) ) ( not ( = ?auto_72100 ?auto_72096 ) ) ( not ( = ?auto_72100 ?auto_72097 ) ) ( not ( = ?auto_72099 ?auto_72096 ) ) ( not ( = ?auto_72099 ?auto_72097 ) ) ( not ( = ?auto_72096 ?auto_72097 ) ) ( not ( = ?auto_72093 ?auto_72096 ) ) ( not ( = ?auto_72093 ?auto_72094 ) ) ( not ( = ?auto_72093 ?auto_72100 ) ) ( not ( = ?auto_72093 ?auto_72099 ) ) ( not ( = ?auto_72098 ?auto_72096 ) ) ( not ( = ?auto_72098 ?auto_72094 ) ) ( not ( = ?auto_72098 ?auto_72100 ) ) ( not ( = ?auto_72098 ?auto_72099 ) ) ( not ( = ?auto_72095 ?auto_72096 ) ) ( not ( = ?auto_72095 ?auto_72094 ) ) ( not ( = ?auto_72095 ?auto_72100 ) ) ( not ( = ?auto_72095 ?auto_72099 ) ) ( ON ?auto_72097 ?auto_72095 ) ( CLEAR ?auto_72097 ) ( HOLDING ?auto_72096 ) ( CLEAR ?auto_72099 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72094 ?auto_72100 ?auto_72099 ?auto_72096 )
      ( MAKE-1PILE ?auto_72093 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72101 - BLOCK
    )
    :vars
    (
      ?auto_72103 - BLOCK
      ?auto_72104 - BLOCK
      ?auto_72106 - BLOCK
      ?auto_72102 - BLOCK
      ?auto_72108 - BLOCK
      ?auto_72105 - BLOCK
      ?auto_72107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72103 ?auto_72101 ) ( ON-TABLE ?auto_72101 ) ( not ( = ?auto_72101 ?auto_72103 ) ) ( not ( = ?auto_72101 ?auto_72104 ) ) ( not ( = ?auto_72101 ?auto_72106 ) ) ( not ( = ?auto_72103 ?auto_72104 ) ) ( not ( = ?auto_72103 ?auto_72106 ) ) ( not ( = ?auto_72104 ?auto_72106 ) ) ( ON ?auto_72104 ?auto_72103 ) ( ON-TABLE ?auto_72102 ) ( ON ?auto_72108 ?auto_72102 ) ( ON ?auto_72105 ?auto_72108 ) ( not ( = ?auto_72102 ?auto_72108 ) ) ( not ( = ?auto_72102 ?auto_72105 ) ) ( not ( = ?auto_72102 ?auto_72107 ) ) ( not ( = ?auto_72102 ?auto_72106 ) ) ( not ( = ?auto_72108 ?auto_72105 ) ) ( not ( = ?auto_72108 ?auto_72107 ) ) ( not ( = ?auto_72108 ?auto_72106 ) ) ( not ( = ?auto_72105 ?auto_72107 ) ) ( not ( = ?auto_72105 ?auto_72106 ) ) ( not ( = ?auto_72107 ?auto_72106 ) ) ( not ( = ?auto_72101 ?auto_72107 ) ) ( not ( = ?auto_72101 ?auto_72102 ) ) ( not ( = ?auto_72101 ?auto_72108 ) ) ( not ( = ?auto_72101 ?auto_72105 ) ) ( not ( = ?auto_72103 ?auto_72107 ) ) ( not ( = ?auto_72103 ?auto_72102 ) ) ( not ( = ?auto_72103 ?auto_72108 ) ) ( not ( = ?auto_72103 ?auto_72105 ) ) ( not ( = ?auto_72104 ?auto_72107 ) ) ( not ( = ?auto_72104 ?auto_72102 ) ) ( not ( = ?auto_72104 ?auto_72108 ) ) ( not ( = ?auto_72104 ?auto_72105 ) ) ( ON ?auto_72106 ?auto_72104 ) ( CLEAR ?auto_72105 ) ( ON ?auto_72107 ?auto_72106 ) ( CLEAR ?auto_72107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72101 ?auto_72103 ?auto_72104 ?auto_72106 )
      ( MAKE-1PILE ?auto_72101 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72109 - BLOCK
    )
    :vars
    (
      ?auto_72114 - BLOCK
      ?auto_72111 - BLOCK
      ?auto_72115 - BLOCK
      ?auto_72116 - BLOCK
      ?auto_72110 - BLOCK
      ?auto_72112 - BLOCK
      ?auto_72113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72114 ?auto_72109 ) ( ON-TABLE ?auto_72109 ) ( not ( = ?auto_72109 ?auto_72114 ) ) ( not ( = ?auto_72109 ?auto_72111 ) ) ( not ( = ?auto_72109 ?auto_72115 ) ) ( not ( = ?auto_72114 ?auto_72111 ) ) ( not ( = ?auto_72114 ?auto_72115 ) ) ( not ( = ?auto_72111 ?auto_72115 ) ) ( ON ?auto_72111 ?auto_72114 ) ( ON-TABLE ?auto_72116 ) ( ON ?auto_72110 ?auto_72116 ) ( not ( = ?auto_72116 ?auto_72110 ) ) ( not ( = ?auto_72116 ?auto_72112 ) ) ( not ( = ?auto_72116 ?auto_72113 ) ) ( not ( = ?auto_72116 ?auto_72115 ) ) ( not ( = ?auto_72110 ?auto_72112 ) ) ( not ( = ?auto_72110 ?auto_72113 ) ) ( not ( = ?auto_72110 ?auto_72115 ) ) ( not ( = ?auto_72112 ?auto_72113 ) ) ( not ( = ?auto_72112 ?auto_72115 ) ) ( not ( = ?auto_72113 ?auto_72115 ) ) ( not ( = ?auto_72109 ?auto_72113 ) ) ( not ( = ?auto_72109 ?auto_72116 ) ) ( not ( = ?auto_72109 ?auto_72110 ) ) ( not ( = ?auto_72109 ?auto_72112 ) ) ( not ( = ?auto_72114 ?auto_72113 ) ) ( not ( = ?auto_72114 ?auto_72116 ) ) ( not ( = ?auto_72114 ?auto_72110 ) ) ( not ( = ?auto_72114 ?auto_72112 ) ) ( not ( = ?auto_72111 ?auto_72113 ) ) ( not ( = ?auto_72111 ?auto_72116 ) ) ( not ( = ?auto_72111 ?auto_72110 ) ) ( not ( = ?auto_72111 ?auto_72112 ) ) ( ON ?auto_72115 ?auto_72111 ) ( ON ?auto_72113 ?auto_72115 ) ( CLEAR ?auto_72113 ) ( HOLDING ?auto_72112 ) ( CLEAR ?auto_72110 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72116 ?auto_72110 ?auto_72112 )
      ( MAKE-1PILE ?auto_72109 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72117 - BLOCK
    )
    :vars
    (
      ?auto_72120 - BLOCK
      ?auto_72121 - BLOCK
      ?auto_72122 - BLOCK
      ?auto_72124 - BLOCK
      ?auto_72123 - BLOCK
      ?auto_72118 - BLOCK
      ?auto_72119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72120 ?auto_72117 ) ( ON-TABLE ?auto_72117 ) ( not ( = ?auto_72117 ?auto_72120 ) ) ( not ( = ?auto_72117 ?auto_72121 ) ) ( not ( = ?auto_72117 ?auto_72122 ) ) ( not ( = ?auto_72120 ?auto_72121 ) ) ( not ( = ?auto_72120 ?auto_72122 ) ) ( not ( = ?auto_72121 ?auto_72122 ) ) ( ON ?auto_72121 ?auto_72120 ) ( ON-TABLE ?auto_72124 ) ( ON ?auto_72123 ?auto_72124 ) ( not ( = ?auto_72124 ?auto_72123 ) ) ( not ( = ?auto_72124 ?auto_72118 ) ) ( not ( = ?auto_72124 ?auto_72119 ) ) ( not ( = ?auto_72124 ?auto_72122 ) ) ( not ( = ?auto_72123 ?auto_72118 ) ) ( not ( = ?auto_72123 ?auto_72119 ) ) ( not ( = ?auto_72123 ?auto_72122 ) ) ( not ( = ?auto_72118 ?auto_72119 ) ) ( not ( = ?auto_72118 ?auto_72122 ) ) ( not ( = ?auto_72119 ?auto_72122 ) ) ( not ( = ?auto_72117 ?auto_72119 ) ) ( not ( = ?auto_72117 ?auto_72124 ) ) ( not ( = ?auto_72117 ?auto_72123 ) ) ( not ( = ?auto_72117 ?auto_72118 ) ) ( not ( = ?auto_72120 ?auto_72119 ) ) ( not ( = ?auto_72120 ?auto_72124 ) ) ( not ( = ?auto_72120 ?auto_72123 ) ) ( not ( = ?auto_72120 ?auto_72118 ) ) ( not ( = ?auto_72121 ?auto_72119 ) ) ( not ( = ?auto_72121 ?auto_72124 ) ) ( not ( = ?auto_72121 ?auto_72123 ) ) ( not ( = ?auto_72121 ?auto_72118 ) ) ( ON ?auto_72122 ?auto_72121 ) ( ON ?auto_72119 ?auto_72122 ) ( CLEAR ?auto_72123 ) ( ON ?auto_72118 ?auto_72119 ) ( CLEAR ?auto_72118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72117 ?auto_72120 ?auto_72121 ?auto_72122 ?auto_72119 )
      ( MAKE-1PILE ?auto_72117 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72125 - BLOCK
    )
    :vars
    (
      ?auto_72128 - BLOCK
      ?auto_72127 - BLOCK
      ?auto_72132 - BLOCK
      ?auto_72130 - BLOCK
      ?auto_72129 - BLOCK
      ?auto_72131 - BLOCK
      ?auto_72126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72128 ?auto_72125 ) ( ON-TABLE ?auto_72125 ) ( not ( = ?auto_72125 ?auto_72128 ) ) ( not ( = ?auto_72125 ?auto_72127 ) ) ( not ( = ?auto_72125 ?auto_72132 ) ) ( not ( = ?auto_72128 ?auto_72127 ) ) ( not ( = ?auto_72128 ?auto_72132 ) ) ( not ( = ?auto_72127 ?auto_72132 ) ) ( ON ?auto_72127 ?auto_72128 ) ( ON-TABLE ?auto_72130 ) ( not ( = ?auto_72130 ?auto_72129 ) ) ( not ( = ?auto_72130 ?auto_72131 ) ) ( not ( = ?auto_72130 ?auto_72126 ) ) ( not ( = ?auto_72130 ?auto_72132 ) ) ( not ( = ?auto_72129 ?auto_72131 ) ) ( not ( = ?auto_72129 ?auto_72126 ) ) ( not ( = ?auto_72129 ?auto_72132 ) ) ( not ( = ?auto_72131 ?auto_72126 ) ) ( not ( = ?auto_72131 ?auto_72132 ) ) ( not ( = ?auto_72126 ?auto_72132 ) ) ( not ( = ?auto_72125 ?auto_72126 ) ) ( not ( = ?auto_72125 ?auto_72130 ) ) ( not ( = ?auto_72125 ?auto_72129 ) ) ( not ( = ?auto_72125 ?auto_72131 ) ) ( not ( = ?auto_72128 ?auto_72126 ) ) ( not ( = ?auto_72128 ?auto_72130 ) ) ( not ( = ?auto_72128 ?auto_72129 ) ) ( not ( = ?auto_72128 ?auto_72131 ) ) ( not ( = ?auto_72127 ?auto_72126 ) ) ( not ( = ?auto_72127 ?auto_72130 ) ) ( not ( = ?auto_72127 ?auto_72129 ) ) ( not ( = ?auto_72127 ?auto_72131 ) ) ( ON ?auto_72132 ?auto_72127 ) ( ON ?auto_72126 ?auto_72132 ) ( ON ?auto_72131 ?auto_72126 ) ( CLEAR ?auto_72131 ) ( HOLDING ?auto_72129 ) ( CLEAR ?auto_72130 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72130 ?auto_72129 )
      ( MAKE-1PILE ?auto_72125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73539 - BLOCK
    )
    :vars
    (
      ?auto_73541 - BLOCK
      ?auto_73545 - BLOCK
      ?auto_73544 - BLOCK
      ?auto_73543 - BLOCK
      ?auto_73540 - BLOCK
      ?auto_73542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73541 ?auto_73539 ) ( ON-TABLE ?auto_73539 ) ( not ( = ?auto_73539 ?auto_73541 ) ) ( not ( = ?auto_73539 ?auto_73545 ) ) ( not ( = ?auto_73539 ?auto_73544 ) ) ( not ( = ?auto_73541 ?auto_73545 ) ) ( not ( = ?auto_73541 ?auto_73544 ) ) ( not ( = ?auto_73545 ?auto_73544 ) ) ( ON ?auto_73545 ?auto_73541 ) ( not ( = ?auto_73543 ?auto_73540 ) ) ( not ( = ?auto_73543 ?auto_73542 ) ) ( not ( = ?auto_73543 ?auto_73544 ) ) ( not ( = ?auto_73540 ?auto_73542 ) ) ( not ( = ?auto_73540 ?auto_73544 ) ) ( not ( = ?auto_73542 ?auto_73544 ) ) ( not ( = ?auto_73539 ?auto_73542 ) ) ( not ( = ?auto_73539 ?auto_73543 ) ) ( not ( = ?auto_73539 ?auto_73540 ) ) ( not ( = ?auto_73541 ?auto_73542 ) ) ( not ( = ?auto_73541 ?auto_73543 ) ) ( not ( = ?auto_73541 ?auto_73540 ) ) ( not ( = ?auto_73545 ?auto_73542 ) ) ( not ( = ?auto_73545 ?auto_73543 ) ) ( not ( = ?auto_73545 ?auto_73540 ) ) ( ON ?auto_73544 ?auto_73545 ) ( ON ?auto_73542 ?auto_73544 ) ( ON ?auto_73540 ?auto_73542 ) ( ON ?auto_73543 ?auto_73540 ) ( CLEAR ?auto_73543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73539 ?auto_73541 ?auto_73545 ?auto_73544 ?auto_73542 ?auto_73540 )
      ( MAKE-1PILE ?auto_73539 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72141 - BLOCK
    )
    :vars
    (
      ?auto_72146 - BLOCK
      ?auto_72145 - BLOCK
      ?auto_72148 - BLOCK
      ?auto_72147 - BLOCK
      ?auto_72142 - BLOCK
      ?auto_72143 - BLOCK
      ?auto_72144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72146 ?auto_72141 ) ( ON-TABLE ?auto_72141 ) ( not ( = ?auto_72141 ?auto_72146 ) ) ( not ( = ?auto_72141 ?auto_72145 ) ) ( not ( = ?auto_72141 ?auto_72148 ) ) ( not ( = ?auto_72146 ?auto_72145 ) ) ( not ( = ?auto_72146 ?auto_72148 ) ) ( not ( = ?auto_72145 ?auto_72148 ) ) ( ON ?auto_72145 ?auto_72146 ) ( not ( = ?auto_72147 ?auto_72142 ) ) ( not ( = ?auto_72147 ?auto_72143 ) ) ( not ( = ?auto_72147 ?auto_72144 ) ) ( not ( = ?auto_72147 ?auto_72148 ) ) ( not ( = ?auto_72142 ?auto_72143 ) ) ( not ( = ?auto_72142 ?auto_72144 ) ) ( not ( = ?auto_72142 ?auto_72148 ) ) ( not ( = ?auto_72143 ?auto_72144 ) ) ( not ( = ?auto_72143 ?auto_72148 ) ) ( not ( = ?auto_72144 ?auto_72148 ) ) ( not ( = ?auto_72141 ?auto_72144 ) ) ( not ( = ?auto_72141 ?auto_72147 ) ) ( not ( = ?auto_72141 ?auto_72142 ) ) ( not ( = ?auto_72141 ?auto_72143 ) ) ( not ( = ?auto_72146 ?auto_72144 ) ) ( not ( = ?auto_72146 ?auto_72147 ) ) ( not ( = ?auto_72146 ?auto_72142 ) ) ( not ( = ?auto_72146 ?auto_72143 ) ) ( not ( = ?auto_72145 ?auto_72144 ) ) ( not ( = ?auto_72145 ?auto_72147 ) ) ( not ( = ?auto_72145 ?auto_72142 ) ) ( not ( = ?auto_72145 ?auto_72143 ) ) ( ON ?auto_72148 ?auto_72145 ) ( ON ?auto_72144 ?auto_72148 ) ( ON ?auto_72143 ?auto_72144 ) ( ON ?auto_72142 ?auto_72143 ) ( CLEAR ?auto_72142 ) ( HOLDING ?auto_72147 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72147 )
      ( MAKE-1PILE ?auto_72141 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72149 - BLOCK
    )
    :vars
    (
      ?auto_72155 - BLOCK
      ?auto_72151 - BLOCK
      ?auto_72152 - BLOCK
      ?auto_72150 - BLOCK
      ?auto_72153 - BLOCK
      ?auto_72156 - BLOCK
      ?auto_72154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72155 ?auto_72149 ) ( ON-TABLE ?auto_72149 ) ( not ( = ?auto_72149 ?auto_72155 ) ) ( not ( = ?auto_72149 ?auto_72151 ) ) ( not ( = ?auto_72149 ?auto_72152 ) ) ( not ( = ?auto_72155 ?auto_72151 ) ) ( not ( = ?auto_72155 ?auto_72152 ) ) ( not ( = ?auto_72151 ?auto_72152 ) ) ( ON ?auto_72151 ?auto_72155 ) ( not ( = ?auto_72150 ?auto_72153 ) ) ( not ( = ?auto_72150 ?auto_72156 ) ) ( not ( = ?auto_72150 ?auto_72154 ) ) ( not ( = ?auto_72150 ?auto_72152 ) ) ( not ( = ?auto_72153 ?auto_72156 ) ) ( not ( = ?auto_72153 ?auto_72154 ) ) ( not ( = ?auto_72153 ?auto_72152 ) ) ( not ( = ?auto_72156 ?auto_72154 ) ) ( not ( = ?auto_72156 ?auto_72152 ) ) ( not ( = ?auto_72154 ?auto_72152 ) ) ( not ( = ?auto_72149 ?auto_72154 ) ) ( not ( = ?auto_72149 ?auto_72150 ) ) ( not ( = ?auto_72149 ?auto_72153 ) ) ( not ( = ?auto_72149 ?auto_72156 ) ) ( not ( = ?auto_72155 ?auto_72154 ) ) ( not ( = ?auto_72155 ?auto_72150 ) ) ( not ( = ?auto_72155 ?auto_72153 ) ) ( not ( = ?auto_72155 ?auto_72156 ) ) ( not ( = ?auto_72151 ?auto_72154 ) ) ( not ( = ?auto_72151 ?auto_72150 ) ) ( not ( = ?auto_72151 ?auto_72153 ) ) ( not ( = ?auto_72151 ?auto_72156 ) ) ( ON ?auto_72152 ?auto_72151 ) ( ON ?auto_72154 ?auto_72152 ) ( ON ?auto_72156 ?auto_72154 ) ( ON ?auto_72153 ?auto_72156 ) ( ON ?auto_72150 ?auto_72153 ) ( CLEAR ?auto_72150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_72149 ?auto_72155 ?auto_72151 ?auto_72152 ?auto_72154 ?auto_72156 ?auto_72153 )
      ( MAKE-1PILE ?auto_72149 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72164 - BLOCK
      ?auto_72165 - BLOCK
      ?auto_72166 - BLOCK
      ?auto_72167 - BLOCK
      ?auto_72168 - BLOCK
      ?auto_72169 - BLOCK
      ?auto_72170 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_72170 ) ( CLEAR ?auto_72169 ) ( ON-TABLE ?auto_72164 ) ( ON ?auto_72165 ?auto_72164 ) ( ON ?auto_72166 ?auto_72165 ) ( ON ?auto_72167 ?auto_72166 ) ( ON ?auto_72168 ?auto_72167 ) ( ON ?auto_72169 ?auto_72168 ) ( not ( = ?auto_72164 ?auto_72165 ) ) ( not ( = ?auto_72164 ?auto_72166 ) ) ( not ( = ?auto_72164 ?auto_72167 ) ) ( not ( = ?auto_72164 ?auto_72168 ) ) ( not ( = ?auto_72164 ?auto_72169 ) ) ( not ( = ?auto_72164 ?auto_72170 ) ) ( not ( = ?auto_72165 ?auto_72166 ) ) ( not ( = ?auto_72165 ?auto_72167 ) ) ( not ( = ?auto_72165 ?auto_72168 ) ) ( not ( = ?auto_72165 ?auto_72169 ) ) ( not ( = ?auto_72165 ?auto_72170 ) ) ( not ( = ?auto_72166 ?auto_72167 ) ) ( not ( = ?auto_72166 ?auto_72168 ) ) ( not ( = ?auto_72166 ?auto_72169 ) ) ( not ( = ?auto_72166 ?auto_72170 ) ) ( not ( = ?auto_72167 ?auto_72168 ) ) ( not ( = ?auto_72167 ?auto_72169 ) ) ( not ( = ?auto_72167 ?auto_72170 ) ) ( not ( = ?auto_72168 ?auto_72169 ) ) ( not ( = ?auto_72168 ?auto_72170 ) ) ( not ( = ?auto_72169 ?auto_72170 ) ) )
    :subtasks
    ( ( !STACK ?auto_72170 ?auto_72169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72171 - BLOCK
      ?auto_72172 - BLOCK
      ?auto_72173 - BLOCK
      ?auto_72174 - BLOCK
      ?auto_72175 - BLOCK
      ?auto_72176 - BLOCK
      ?auto_72177 - BLOCK
    )
    :vars
    (
      ?auto_72178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72176 ) ( ON-TABLE ?auto_72171 ) ( ON ?auto_72172 ?auto_72171 ) ( ON ?auto_72173 ?auto_72172 ) ( ON ?auto_72174 ?auto_72173 ) ( ON ?auto_72175 ?auto_72174 ) ( ON ?auto_72176 ?auto_72175 ) ( not ( = ?auto_72171 ?auto_72172 ) ) ( not ( = ?auto_72171 ?auto_72173 ) ) ( not ( = ?auto_72171 ?auto_72174 ) ) ( not ( = ?auto_72171 ?auto_72175 ) ) ( not ( = ?auto_72171 ?auto_72176 ) ) ( not ( = ?auto_72171 ?auto_72177 ) ) ( not ( = ?auto_72172 ?auto_72173 ) ) ( not ( = ?auto_72172 ?auto_72174 ) ) ( not ( = ?auto_72172 ?auto_72175 ) ) ( not ( = ?auto_72172 ?auto_72176 ) ) ( not ( = ?auto_72172 ?auto_72177 ) ) ( not ( = ?auto_72173 ?auto_72174 ) ) ( not ( = ?auto_72173 ?auto_72175 ) ) ( not ( = ?auto_72173 ?auto_72176 ) ) ( not ( = ?auto_72173 ?auto_72177 ) ) ( not ( = ?auto_72174 ?auto_72175 ) ) ( not ( = ?auto_72174 ?auto_72176 ) ) ( not ( = ?auto_72174 ?auto_72177 ) ) ( not ( = ?auto_72175 ?auto_72176 ) ) ( not ( = ?auto_72175 ?auto_72177 ) ) ( not ( = ?auto_72176 ?auto_72177 ) ) ( ON ?auto_72177 ?auto_72178 ) ( CLEAR ?auto_72177 ) ( HAND-EMPTY ) ( not ( = ?auto_72171 ?auto_72178 ) ) ( not ( = ?auto_72172 ?auto_72178 ) ) ( not ( = ?auto_72173 ?auto_72178 ) ) ( not ( = ?auto_72174 ?auto_72178 ) ) ( not ( = ?auto_72175 ?auto_72178 ) ) ( not ( = ?auto_72176 ?auto_72178 ) ) ( not ( = ?auto_72177 ?auto_72178 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72177 ?auto_72178 )
      ( MAKE-7PILE ?auto_72171 ?auto_72172 ?auto_72173 ?auto_72174 ?auto_72175 ?auto_72176 ?auto_72177 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72179 - BLOCK
      ?auto_72180 - BLOCK
      ?auto_72181 - BLOCK
      ?auto_72182 - BLOCK
      ?auto_72183 - BLOCK
      ?auto_72184 - BLOCK
      ?auto_72185 - BLOCK
    )
    :vars
    (
      ?auto_72186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72179 ) ( ON ?auto_72180 ?auto_72179 ) ( ON ?auto_72181 ?auto_72180 ) ( ON ?auto_72182 ?auto_72181 ) ( ON ?auto_72183 ?auto_72182 ) ( not ( = ?auto_72179 ?auto_72180 ) ) ( not ( = ?auto_72179 ?auto_72181 ) ) ( not ( = ?auto_72179 ?auto_72182 ) ) ( not ( = ?auto_72179 ?auto_72183 ) ) ( not ( = ?auto_72179 ?auto_72184 ) ) ( not ( = ?auto_72179 ?auto_72185 ) ) ( not ( = ?auto_72180 ?auto_72181 ) ) ( not ( = ?auto_72180 ?auto_72182 ) ) ( not ( = ?auto_72180 ?auto_72183 ) ) ( not ( = ?auto_72180 ?auto_72184 ) ) ( not ( = ?auto_72180 ?auto_72185 ) ) ( not ( = ?auto_72181 ?auto_72182 ) ) ( not ( = ?auto_72181 ?auto_72183 ) ) ( not ( = ?auto_72181 ?auto_72184 ) ) ( not ( = ?auto_72181 ?auto_72185 ) ) ( not ( = ?auto_72182 ?auto_72183 ) ) ( not ( = ?auto_72182 ?auto_72184 ) ) ( not ( = ?auto_72182 ?auto_72185 ) ) ( not ( = ?auto_72183 ?auto_72184 ) ) ( not ( = ?auto_72183 ?auto_72185 ) ) ( not ( = ?auto_72184 ?auto_72185 ) ) ( ON ?auto_72185 ?auto_72186 ) ( CLEAR ?auto_72185 ) ( not ( = ?auto_72179 ?auto_72186 ) ) ( not ( = ?auto_72180 ?auto_72186 ) ) ( not ( = ?auto_72181 ?auto_72186 ) ) ( not ( = ?auto_72182 ?auto_72186 ) ) ( not ( = ?auto_72183 ?auto_72186 ) ) ( not ( = ?auto_72184 ?auto_72186 ) ) ( not ( = ?auto_72185 ?auto_72186 ) ) ( HOLDING ?auto_72184 ) ( CLEAR ?auto_72183 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72179 ?auto_72180 ?auto_72181 ?auto_72182 ?auto_72183 ?auto_72184 )
      ( MAKE-7PILE ?auto_72179 ?auto_72180 ?auto_72181 ?auto_72182 ?auto_72183 ?auto_72184 ?auto_72185 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72187 - BLOCK
      ?auto_72188 - BLOCK
      ?auto_72189 - BLOCK
      ?auto_72190 - BLOCK
      ?auto_72191 - BLOCK
      ?auto_72192 - BLOCK
      ?auto_72193 - BLOCK
    )
    :vars
    (
      ?auto_72194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72187 ) ( ON ?auto_72188 ?auto_72187 ) ( ON ?auto_72189 ?auto_72188 ) ( ON ?auto_72190 ?auto_72189 ) ( ON ?auto_72191 ?auto_72190 ) ( not ( = ?auto_72187 ?auto_72188 ) ) ( not ( = ?auto_72187 ?auto_72189 ) ) ( not ( = ?auto_72187 ?auto_72190 ) ) ( not ( = ?auto_72187 ?auto_72191 ) ) ( not ( = ?auto_72187 ?auto_72192 ) ) ( not ( = ?auto_72187 ?auto_72193 ) ) ( not ( = ?auto_72188 ?auto_72189 ) ) ( not ( = ?auto_72188 ?auto_72190 ) ) ( not ( = ?auto_72188 ?auto_72191 ) ) ( not ( = ?auto_72188 ?auto_72192 ) ) ( not ( = ?auto_72188 ?auto_72193 ) ) ( not ( = ?auto_72189 ?auto_72190 ) ) ( not ( = ?auto_72189 ?auto_72191 ) ) ( not ( = ?auto_72189 ?auto_72192 ) ) ( not ( = ?auto_72189 ?auto_72193 ) ) ( not ( = ?auto_72190 ?auto_72191 ) ) ( not ( = ?auto_72190 ?auto_72192 ) ) ( not ( = ?auto_72190 ?auto_72193 ) ) ( not ( = ?auto_72191 ?auto_72192 ) ) ( not ( = ?auto_72191 ?auto_72193 ) ) ( not ( = ?auto_72192 ?auto_72193 ) ) ( ON ?auto_72193 ?auto_72194 ) ( not ( = ?auto_72187 ?auto_72194 ) ) ( not ( = ?auto_72188 ?auto_72194 ) ) ( not ( = ?auto_72189 ?auto_72194 ) ) ( not ( = ?auto_72190 ?auto_72194 ) ) ( not ( = ?auto_72191 ?auto_72194 ) ) ( not ( = ?auto_72192 ?auto_72194 ) ) ( not ( = ?auto_72193 ?auto_72194 ) ) ( CLEAR ?auto_72191 ) ( ON ?auto_72192 ?auto_72193 ) ( CLEAR ?auto_72192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72194 ?auto_72193 )
      ( MAKE-7PILE ?auto_72187 ?auto_72188 ?auto_72189 ?auto_72190 ?auto_72191 ?auto_72192 ?auto_72193 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72195 - BLOCK
      ?auto_72196 - BLOCK
      ?auto_72197 - BLOCK
      ?auto_72198 - BLOCK
      ?auto_72199 - BLOCK
      ?auto_72200 - BLOCK
      ?auto_72201 - BLOCK
    )
    :vars
    (
      ?auto_72202 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72195 ) ( ON ?auto_72196 ?auto_72195 ) ( ON ?auto_72197 ?auto_72196 ) ( ON ?auto_72198 ?auto_72197 ) ( not ( = ?auto_72195 ?auto_72196 ) ) ( not ( = ?auto_72195 ?auto_72197 ) ) ( not ( = ?auto_72195 ?auto_72198 ) ) ( not ( = ?auto_72195 ?auto_72199 ) ) ( not ( = ?auto_72195 ?auto_72200 ) ) ( not ( = ?auto_72195 ?auto_72201 ) ) ( not ( = ?auto_72196 ?auto_72197 ) ) ( not ( = ?auto_72196 ?auto_72198 ) ) ( not ( = ?auto_72196 ?auto_72199 ) ) ( not ( = ?auto_72196 ?auto_72200 ) ) ( not ( = ?auto_72196 ?auto_72201 ) ) ( not ( = ?auto_72197 ?auto_72198 ) ) ( not ( = ?auto_72197 ?auto_72199 ) ) ( not ( = ?auto_72197 ?auto_72200 ) ) ( not ( = ?auto_72197 ?auto_72201 ) ) ( not ( = ?auto_72198 ?auto_72199 ) ) ( not ( = ?auto_72198 ?auto_72200 ) ) ( not ( = ?auto_72198 ?auto_72201 ) ) ( not ( = ?auto_72199 ?auto_72200 ) ) ( not ( = ?auto_72199 ?auto_72201 ) ) ( not ( = ?auto_72200 ?auto_72201 ) ) ( ON ?auto_72201 ?auto_72202 ) ( not ( = ?auto_72195 ?auto_72202 ) ) ( not ( = ?auto_72196 ?auto_72202 ) ) ( not ( = ?auto_72197 ?auto_72202 ) ) ( not ( = ?auto_72198 ?auto_72202 ) ) ( not ( = ?auto_72199 ?auto_72202 ) ) ( not ( = ?auto_72200 ?auto_72202 ) ) ( not ( = ?auto_72201 ?auto_72202 ) ) ( ON ?auto_72200 ?auto_72201 ) ( CLEAR ?auto_72200 ) ( ON-TABLE ?auto_72202 ) ( HOLDING ?auto_72199 ) ( CLEAR ?auto_72198 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72195 ?auto_72196 ?auto_72197 ?auto_72198 ?auto_72199 )
      ( MAKE-7PILE ?auto_72195 ?auto_72196 ?auto_72197 ?auto_72198 ?auto_72199 ?auto_72200 ?auto_72201 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72203 - BLOCK
      ?auto_72204 - BLOCK
      ?auto_72205 - BLOCK
      ?auto_72206 - BLOCK
      ?auto_72207 - BLOCK
      ?auto_72208 - BLOCK
      ?auto_72209 - BLOCK
    )
    :vars
    (
      ?auto_72210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72203 ) ( ON ?auto_72204 ?auto_72203 ) ( ON ?auto_72205 ?auto_72204 ) ( ON ?auto_72206 ?auto_72205 ) ( not ( = ?auto_72203 ?auto_72204 ) ) ( not ( = ?auto_72203 ?auto_72205 ) ) ( not ( = ?auto_72203 ?auto_72206 ) ) ( not ( = ?auto_72203 ?auto_72207 ) ) ( not ( = ?auto_72203 ?auto_72208 ) ) ( not ( = ?auto_72203 ?auto_72209 ) ) ( not ( = ?auto_72204 ?auto_72205 ) ) ( not ( = ?auto_72204 ?auto_72206 ) ) ( not ( = ?auto_72204 ?auto_72207 ) ) ( not ( = ?auto_72204 ?auto_72208 ) ) ( not ( = ?auto_72204 ?auto_72209 ) ) ( not ( = ?auto_72205 ?auto_72206 ) ) ( not ( = ?auto_72205 ?auto_72207 ) ) ( not ( = ?auto_72205 ?auto_72208 ) ) ( not ( = ?auto_72205 ?auto_72209 ) ) ( not ( = ?auto_72206 ?auto_72207 ) ) ( not ( = ?auto_72206 ?auto_72208 ) ) ( not ( = ?auto_72206 ?auto_72209 ) ) ( not ( = ?auto_72207 ?auto_72208 ) ) ( not ( = ?auto_72207 ?auto_72209 ) ) ( not ( = ?auto_72208 ?auto_72209 ) ) ( ON ?auto_72209 ?auto_72210 ) ( not ( = ?auto_72203 ?auto_72210 ) ) ( not ( = ?auto_72204 ?auto_72210 ) ) ( not ( = ?auto_72205 ?auto_72210 ) ) ( not ( = ?auto_72206 ?auto_72210 ) ) ( not ( = ?auto_72207 ?auto_72210 ) ) ( not ( = ?auto_72208 ?auto_72210 ) ) ( not ( = ?auto_72209 ?auto_72210 ) ) ( ON ?auto_72208 ?auto_72209 ) ( ON-TABLE ?auto_72210 ) ( CLEAR ?auto_72206 ) ( ON ?auto_72207 ?auto_72208 ) ( CLEAR ?auto_72207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72210 ?auto_72209 ?auto_72208 )
      ( MAKE-7PILE ?auto_72203 ?auto_72204 ?auto_72205 ?auto_72206 ?auto_72207 ?auto_72208 ?auto_72209 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72211 - BLOCK
      ?auto_72212 - BLOCK
      ?auto_72213 - BLOCK
      ?auto_72214 - BLOCK
      ?auto_72215 - BLOCK
      ?auto_72216 - BLOCK
      ?auto_72217 - BLOCK
    )
    :vars
    (
      ?auto_72218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72211 ) ( ON ?auto_72212 ?auto_72211 ) ( ON ?auto_72213 ?auto_72212 ) ( not ( = ?auto_72211 ?auto_72212 ) ) ( not ( = ?auto_72211 ?auto_72213 ) ) ( not ( = ?auto_72211 ?auto_72214 ) ) ( not ( = ?auto_72211 ?auto_72215 ) ) ( not ( = ?auto_72211 ?auto_72216 ) ) ( not ( = ?auto_72211 ?auto_72217 ) ) ( not ( = ?auto_72212 ?auto_72213 ) ) ( not ( = ?auto_72212 ?auto_72214 ) ) ( not ( = ?auto_72212 ?auto_72215 ) ) ( not ( = ?auto_72212 ?auto_72216 ) ) ( not ( = ?auto_72212 ?auto_72217 ) ) ( not ( = ?auto_72213 ?auto_72214 ) ) ( not ( = ?auto_72213 ?auto_72215 ) ) ( not ( = ?auto_72213 ?auto_72216 ) ) ( not ( = ?auto_72213 ?auto_72217 ) ) ( not ( = ?auto_72214 ?auto_72215 ) ) ( not ( = ?auto_72214 ?auto_72216 ) ) ( not ( = ?auto_72214 ?auto_72217 ) ) ( not ( = ?auto_72215 ?auto_72216 ) ) ( not ( = ?auto_72215 ?auto_72217 ) ) ( not ( = ?auto_72216 ?auto_72217 ) ) ( ON ?auto_72217 ?auto_72218 ) ( not ( = ?auto_72211 ?auto_72218 ) ) ( not ( = ?auto_72212 ?auto_72218 ) ) ( not ( = ?auto_72213 ?auto_72218 ) ) ( not ( = ?auto_72214 ?auto_72218 ) ) ( not ( = ?auto_72215 ?auto_72218 ) ) ( not ( = ?auto_72216 ?auto_72218 ) ) ( not ( = ?auto_72217 ?auto_72218 ) ) ( ON ?auto_72216 ?auto_72217 ) ( ON-TABLE ?auto_72218 ) ( ON ?auto_72215 ?auto_72216 ) ( CLEAR ?auto_72215 ) ( HOLDING ?auto_72214 ) ( CLEAR ?auto_72213 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72211 ?auto_72212 ?auto_72213 ?auto_72214 )
      ( MAKE-7PILE ?auto_72211 ?auto_72212 ?auto_72213 ?auto_72214 ?auto_72215 ?auto_72216 ?auto_72217 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72219 - BLOCK
      ?auto_72220 - BLOCK
      ?auto_72221 - BLOCK
      ?auto_72222 - BLOCK
      ?auto_72223 - BLOCK
      ?auto_72224 - BLOCK
      ?auto_72225 - BLOCK
    )
    :vars
    (
      ?auto_72226 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72219 ) ( ON ?auto_72220 ?auto_72219 ) ( ON ?auto_72221 ?auto_72220 ) ( not ( = ?auto_72219 ?auto_72220 ) ) ( not ( = ?auto_72219 ?auto_72221 ) ) ( not ( = ?auto_72219 ?auto_72222 ) ) ( not ( = ?auto_72219 ?auto_72223 ) ) ( not ( = ?auto_72219 ?auto_72224 ) ) ( not ( = ?auto_72219 ?auto_72225 ) ) ( not ( = ?auto_72220 ?auto_72221 ) ) ( not ( = ?auto_72220 ?auto_72222 ) ) ( not ( = ?auto_72220 ?auto_72223 ) ) ( not ( = ?auto_72220 ?auto_72224 ) ) ( not ( = ?auto_72220 ?auto_72225 ) ) ( not ( = ?auto_72221 ?auto_72222 ) ) ( not ( = ?auto_72221 ?auto_72223 ) ) ( not ( = ?auto_72221 ?auto_72224 ) ) ( not ( = ?auto_72221 ?auto_72225 ) ) ( not ( = ?auto_72222 ?auto_72223 ) ) ( not ( = ?auto_72222 ?auto_72224 ) ) ( not ( = ?auto_72222 ?auto_72225 ) ) ( not ( = ?auto_72223 ?auto_72224 ) ) ( not ( = ?auto_72223 ?auto_72225 ) ) ( not ( = ?auto_72224 ?auto_72225 ) ) ( ON ?auto_72225 ?auto_72226 ) ( not ( = ?auto_72219 ?auto_72226 ) ) ( not ( = ?auto_72220 ?auto_72226 ) ) ( not ( = ?auto_72221 ?auto_72226 ) ) ( not ( = ?auto_72222 ?auto_72226 ) ) ( not ( = ?auto_72223 ?auto_72226 ) ) ( not ( = ?auto_72224 ?auto_72226 ) ) ( not ( = ?auto_72225 ?auto_72226 ) ) ( ON ?auto_72224 ?auto_72225 ) ( ON-TABLE ?auto_72226 ) ( ON ?auto_72223 ?auto_72224 ) ( CLEAR ?auto_72221 ) ( ON ?auto_72222 ?auto_72223 ) ( CLEAR ?auto_72222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72226 ?auto_72225 ?auto_72224 ?auto_72223 )
      ( MAKE-7PILE ?auto_72219 ?auto_72220 ?auto_72221 ?auto_72222 ?auto_72223 ?auto_72224 ?auto_72225 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72227 - BLOCK
      ?auto_72228 - BLOCK
      ?auto_72229 - BLOCK
      ?auto_72230 - BLOCK
      ?auto_72231 - BLOCK
      ?auto_72232 - BLOCK
      ?auto_72233 - BLOCK
    )
    :vars
    (
      ?auto_72234 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72227 ) ( ON ?auto_72228 ?auto_72227 ) ( not ( = ?auto_72227 ?auto_72228 ) ) ( not ( = ?auto_72227 ?auto_72229 ) ) ( not ( = ?auto_72227 ?auto_72230 ) ) ( not ( = ?auto_72227 ?auto_72231 ) ) ( not ( = ?auto_72227 ?auto_72232 ) ) ( not ( = ?auto_72227 ?auto_72233 ) ) ( not ( = ?auto_72228 ?auto_72229 ) ) ( not ( = ?auto_72228 ?auto_72230 ) ) ( not ( = ?auto_72228 ?auto_72231 ) ) ( not ( = ?auto_72228 ?auto_72232 ) ) ( not ( = ?auto_72228 ?auto_72233 ) ) ( not ( = ?auto_72229 ?auto_72230 ) ) ( not ( = ?auto_72229 ?auto_72231 ) ) ( not ( = ?auto_72229 ?auto_72232 ) ) ( not ( = ?auto_72229 ?auto_72233 ) ) ( not ( = ?auto_72230 ?auto_72231 ) ) ( not ( = ?auto_72230 ?auto_72232 ) ) ( not ( = ?auto_72230 ?auto_72233 ) ) ( not ( = ?auto_72231 ?auto_72232 ) ) ( not ( = ?auto_72231 ?auto_72233 ) ) ( not ( = ?auto_72232 ?auto_72233 ) ) ( ON ?auto_72233 ?auto_72234 ) ( not ( = ?auto_72227 ?auto_72234 ) ) ( not ( = ?auto_72228 ?auto_72234 ) ) ( not ( = ?auto_72229 ?auto_72234 ) ) ( not ( = ?auto_72230 ?auto_72234 ) ) ( not ( = ?auto_72231 ?auto_72234 ) ) ( not ( = ?auto_72232 ?auto_72234 ) ) ( not ( = ?auto_72233 ?auto_72234 ) ) ( ON ?auto_72232 ?auto_72233 ) ( ON-TABLE ?auto_72234 ) ( ON ?auto_72231 ?auto_72232 ) ( ON ?auto_72230 ?auto_72231 ) ( CLEAR ?auto_72230 ) ( HOLDING ?auto_72229 ) ( CLEAR ?auto_72228 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72227 ?auto_72228 ?auto_72229 )
      ( MAKE-7PILE ?auto_72227 ?auto_72228 ?auto_72229 ?auto_72230 ?auto_72231 ?auto_72232 ?auto_72233 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72235 - BLOCK
      ?auto_72236 - BLOCK
      ?auto_72237 - BLOCK
      ?auto_72238 - BLOCK
      ?auto_72239 - BLOCK
      ?auto_72240 - BLOCK
      ?auto_72241 - BLOCK
    )
    :vars
    (
      ?auto_72242 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72235 ) ( ON ?auto_72236 ?auto_72235 ) ( not ( = ?auto_72235 ?auto_72236 ) ) ( not ( = ?auto_72235 ?auto_72237 ) ) ( not ( = ?auto_72235 ?auto_72238 ) ) ( not ( = ?auto_72235 ?auto_72239 ) ) ( not ( = ?auto_72235 ?auto_72240 ) ) ( not ( = ?auto_72235 ?auto_72241 ) ) ( not ( = ?auto_72236 ?auto_72237 ) ) ( not ( = ?auto_72236 ?auto_72238 ) ) ( not ( = ?auto_72236 ?auto_72239 ) ) ( not ( = ?auto_72236 ?auto_72240 ) ) ( not ( = ?auto_72236 ?auto_72241 ) ) ( not ( = ?auto_72237 ?auto_72238 ) ) ( not ( = ?auto_72237 ?auto_72239 ) ) ( not ( = ?auto_72237 ?auto_72240 ) ) ( not ( = ?auto_72237 ?auto_72241 ) ) ( not ( = ?auto_72238 ?auto_72239 ) ) ( not ( = ?auto_72238 ?auto_72240 ) ) ( not ( = ?auto_72238 ?auto_72241 ) ) ( not ( = ?auto_72239 ?auto_72240 ) ) ( not ( = ?auto_72239 ?auto_72241 ) ) ( not ( = ?auto_72240 ?auto_72241 ) ) ( ON ?auto_72241 ?auto_72242 ) ( not ( = ?auto_72235 ?auto_72242 ) ) ( not ( = ?auto_72236 ?auto_72242 ) ) ( not ( = ?auto_72237 ?auto_72242 ) ) ( not ( = ?auto_72238 ?auto_72242 ) ) ( not ( = ?auto_72239 ?auto_72242 ) ) ( not ( = ?auto_72240 ?auto_72242 ) ) ( not ( = ?auto_72241 ?auto_72242 ) ) ( ON ?auto_72240 ?auto_72241 ) ( ON-TABLE ?auto_72242 ) ( ON ?auto_72239 ?auto_72240 ) ( ON ?auto_72238 ?auto_72239 ) ( CLEAR ?auto_72236 ) ( ON ?auto_72237 ?auto_72238 ) ( CLEAR ?auto_72237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72242 ?auto_72241 ?auto_72240 ?auto_72239 ?auto_72238 )
      ( MAKE-7PILE ?auto_72235 ?auto_72236 ?auto_72237 ?auto_72238 ?auto_72239 ?auto_72240 ?auto_72241 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72243 - BLOCK
      ?auto_72244 - BLOCK
      ?auto_72245 - BLOCK
      ?auto_72246 - BLOCK
      ?auto_72247 - BLOCK
      ?auto_72248 - BLOCK
      ?auto_72249 - BLOCK
    )
    :vars
    (
      ?auto_72250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72243 ) ( not ( = ?auto_72243 ?auto_72244 ) ) ( not ( = ?auto_72243 ?auto_72245 ) ) ( not ( = ?auto_72243 ?auto_72246 ) ) ( not ( = ?auto_72243 ?auto_72247 ) ) ( not ( = ?auto_72243 ?auto_72248 ) ) ( not ( = ?auto_72243 ?auto_72249 ) ) ( not ( = ?auto_72244 ?auto_72245 ) ) ( not ( = ?auto_72244 ?auto_72246 ) ) ( not ( = ?auto_72244 ?auto_72247 ) ) ( not ( = ?auto_72244 ?auto_72248 ) ) ( not ( = ?auto_72244 ?auto_72249 ) ) ( not ( = ?auto_72245 ?auto_72246 ) ) ( not ( = ?auto_72245 ?auto_72247 ) ) ( not ( = ?auto_72245 ?auto_72248 ) ) ( not ( = ?auto_72245 ?auto_72249 ) ) ( not ( = ?auto_72246 ?auto_72247 ) ) ( not ( = ?auto_72246 ?auto_72248 ) ) ( not ( = ?auto_72246 ?auto_72249 ) ) ( not ( = ?auto_72247 ?auto_72248 ) ) ( not ( = ?auto_72247 ?auto_72249 ) ) ( not ( = ?auto_72248 ?auto_72249 ) ) ( ON ?auto_72249 ?auto_72250 ) ( not ( = ?auto_72243 ?auto_72250 ) ) ( not ( = ?auto_72244 ?auto_72250 ) ) ( not ( = ?auto_72245 ?auto_72250 ) ) ( not ( = ?auto_72246 ?auto_72250 ) ) ( not ( = ?auto_72247 ?auto_72250 ) ) ( not ( = ?auto_72248 ?auto_72250 ) ) ( not ( = ?auto_72249 ?auto_72250 ) ) ( ON ?auto_72248 ?auto_72249 ) ( ON-TABLE ?auto_72250 ) ( ON ?auto_72247 ?auto_72248 ) ( ON ?auto_72246 ?auto_72247 ) ( ON ?auto_72245 ?auto_72246 ) ( CLEAR ?auto_72245 ) ( HOLDING ?auto_72244 ) ( CLEAR ?auto_72243 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72243 ?auto_72244 )
      ( MAKE-7PILE ?auto_72243 ?auto_72244 ?auto_72245 ?auto_72246 ?auto_72247 ?auto_72248 ?auto_72249 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72251 - BLOCK
      ?auto_72252 - BLOCK
      ?auto_72253 - BLOCK
      ?auto_72254 - BLOCK
      ?auto_72255 - BLOCK
      ?auto_72256 - BLOCK
      ?auto_72257 - BLOCK
    )
    :vars
    (
      ?auto_72258 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72251 ) ( not ( = ?auto_72251 ?auto_72252 ) ) ( not ( = ?auto_72251 ?auto_72253 ) ) ( not ( = ?auto_72251 ?auto_72254 ) ) ( not ( = ?auto_72251 ?auto_72255 ) ) ( not ( = ?auto_72251 ?auto_72256 ) ) ( not ( = ?auto_72251 ?auto_72257 ) ) ( not ( = ?auto_72252 ?auto_72253 ) ) ( not ( = ?auto_72252 ?auto_72254 ) ) ( not ( = ?auto_72252 ?auto_72255 ) ) ( not ( = ?auto_72252 ?auto_72256 ) ) ( not ( = ?auto_72252 ?auto_72257 ) ) ( not ( = ?auto_72253 ?auto_72254 ) ) ( not ( = ?auto_72253 ?auto_72255 ) ) ( not ( = ?auto_72253 ?auto_72256 ) ) ( not ( = ?auto_72253 ?auto_72257 ) ) ( not ( = ?auto_72254 ?auto_72255 ) ) ( not ( = ?auto_72254 ?auto_72256 ) ) ( not ( = ?auto_72254 ?auto_72257 ) ) ( not ( = ?auto_72255 ?auto_72256 ) ) ( not ( = ?auto_72255 ?auto_72257 ) ) ( not ( = ?auto_72256 ?auto_72257 ) ) ( ON ?auto_72257 ?auto_72258 ) ( not ( = ?auto_72251 ?auto_72258 ) ) ( not ( = ?auto_72252 ?auto_72258 ) ) ( not ( = ?auto_72253 ?auto_72258 ) ) ( not ( = ?auto_72254 ?auto_72258 ) ) ( not ( = ?auto_72255 ?auto_72258 ) ) ( not ( = ?auto_72256 ?auto_72258 ) ) ( not ( = ?auto_72257 ?auto_72258 ) ) ( ON ?auto_72256 ?auto_72257 ) ( ON-TABLE ?auto_72258 ) ( ON ?auto_72255 ?auto_72256 ) ( ON ?auto_72254 ?auto_72255 ) ( ON ?auto_72253 ?auto_72254 ) ( CLEAR ?auto_72251 ) ( ON ?auto_72252 ?auto_72253 ) ( CLEAR ?auto_72252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72258 ?auto_72257 ?auto_72256 ?auto_72255 ?auto_72254 ?auto_72253 )
      ( MAKE-7PILE ?auto_72251 ?auto_72252 ?auto_72253 ?auto_72254 ?auto_72255 ?auto_72256 ?auto_72257 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72259 - BLOCK
      ?auto_72260 - BLOCK
      ?auto_72261 - BLOCK
      ?auto_72262 - BLOCK
      ?auto_72263 - BLOCK
      ?auto_72264 - BLOCK
      ?auto_72265 - BLOCK
    )
    :vars
    (
      ?auto_72266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72259 ?auto_72260 ) ) ( not ( = ?auto_72259 ?auto_72261 ) ) ( not ( = ?auto_72259 ?auto_72262 ) ) ( not ( = ?auto_72259 ?auto_72263 ) ) ( not ( = ?auto_72259 ?auto_72264 ) ) ( not ( = ?auto_72259 ?auto_72265 ) ) ( not ( = ?auto_72260 ?auto_72261 ) ) ( not ( = ?auto_72260 ?auto_72262 ) ) ( not ( = ?auto_72260 ?auto_72263 ) ) ( not ( = ?auto_72260 ?auto_72264 ) ) ( not ( = ?auto_72260 ?auto_72265 ) ) ( not ( = ?auto_72261 ?auto_72262 ) ) ( not ( = ?auto_72261 ?auto_72263 ) ) ( not ( = ?auto_72261 ?auto_72264 ) ) ( not ( = ?auto_72261 ?auto_72265 ) ) ( not ( = ?auto_72262 ?auto_72263 ) ) ( not ( = ?auto_72262 ?auto_72264 ) ) ( not ( = ?auto_72262 ?auto_72265 ) ) ( not ( = ?auto_72263 ?auto_72264 ) ) ( not ( = ?auto_72263 ?auto_72265 ) ) ( not ( = ?auto_72264 ?auto_72265 ) ) ( ON ?auto_72265 ?auto_72266 ) ( not ( = ?auto_72259 ?auto_72266 ) ) ( not ( = ?auto_72260 ?auto_72266 ) ) ( not ( = ?auto_72261 ?auto_72266 ) ) ( not ( = ?auto_72262 ?auto_72266 ) ) ( not ( = ?auto_72263 ?auto_72266 ) ) ( not ( = ?auto_72264 ?auto_72266 ) ) ( not ( = ?auto_72265 ?auto_72266 ) ) ( ON ?auto_72264 ?auto_72265 ) ( ON-TABLE ?auto_72266 ) ( ON ?auto_72263 ?auto_72264 ) ( ON ?auto_72262 ?auto_72263 ) ( ON ?auto_72261 ?auto_72262 ) ( ON ?auto_72260 ?auto_72261 ) ( CLEAR ?auto_72260 ) ( HOLDING ?auto_72259 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72259 )
      ( MAKE-7PILE ?auto_72259 ?auto_72260 ?auto_72261 ?auto_72262 ?auto_72263 ?auto_72264 ?auto_72265 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_72267 - BLOCK
      ?auto_72268 - BLOCK
      ?auto_72269 - BLOCK
      ?auto_72270 - BLOCK
      ?auto_72271 - BLOCK
      ?auto_72272 - BLOCK
      ?auto_72273 - BLOCK
    )
    :vars
    (
      ?auto_72274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72267 ?auto_72268 ) ) ( not ( = ?auto_72267 ?auto_72269 ) ) ( not ( = ?auto_72267 ?auto_72270 ) ) ( not ( = ?auto_72267 ?auto_72271 ) ) ( not ( = ?auto_72267 ?auto_72272 ) ) ( not ( = ?auto_72267 ?auto_72273 ) ) ( not ( = ?auto_72268 ?auto_72269 ) ) ( not ( = ?auto_72268 ?auto_72270 ) ) ( not ( = ?auto_72268 ?auto_72271 ) ) ( not ( = ?auto_72268 ?auto_72272 ) ) ( not ( = ?auto_72268 ?auto_72273 ) ) ( not ( = ?auto_72269 ?auto_72270 ) ) ( not ( = ?auto_72269 ?auto_72271 ) ) ( not ( = ?auto_72269 ?auto_72272 ) ) ( not ( = ?auto_72269 ?auto_72273 ) ) ( not ( = ?auto_72270 ?auto_72271 ) ) ( not ( = ?auto_72270 ?auto_72272 ) ) ( not ( = ?auto_72270 ?auto_72273 ) ) ( not ( = ?auto_72271 ?auto_72272 ) ) ( not ( = ?auto_72271 ?auto_72273 ) ) ( not ( = ?auto_72272 ?auto_72273 ) ) ( ON ?auto_72273 ?auto_72274 ) ( not ( = ?auto_72267 ?auto_72274 ) ) ( not ( = ?auto_72268 ?auto_72274 ) ) ( not ( = ?auto_72269 ?auto_72274 ) ) ( not ( = ?auto_72270 ?auto_72274 ) ) ( not ( = ?auto_72271 ?auto_72274 ) ) ( not ( = ?auto_72272 ?auto_72274 ) ) ( not ( = ?auto_72273 ?auto_72274 ) ) ( ON ?auto_72272 ?auto_72273 ) ( ON-TABLE ?auto_72274 ) ( ON ?auto_72271 ?auto_72272 ) ( ON ?auto_72270 ?auto_72271 ) ( ON ?auto_72269 ?auto_72270 ) ( ON ?auto_72268 ?auto_72269 ) ( ON ?auto_72267 ?auto_72268 ) ( CLEAR ?auto_72267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_72274 ?auto_72273 ?auto_72272 ?auto_72271 ?auto_72270 ?auto_72269 ?auto_72268 )
      ( MAKE-7PILE ?auto_72267 ?auto_72268 ?auto_72269 ?auto_72270 ?auto_72271 ?auto_72272 ?auto_72273 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72381 - BLOCK
    )
    :vars
    (
      ?auto_72382 - BLOCK
      ?auto_72383 - BLOCK
      ?auto_72384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72381 ?auto_72382 ) ( CLEAR ?auto_72381 ) ( not ( = ?auto_72381 ?auto_72382 ) ) ( HOLDING ?auto_72383 ) ( CLEAR ?auto_72384 ) ( not ( = ?auto_72381 ?auto_72383 ) ) ( not ( = ?auto_72381 ?auto_72384 ) ) ( not ( = ?auto_72382 ?auto_72383 ) ) ( not ( = ?auto_72382 ?auto_72384 ) ) ( not ( = ?auto_72383 ?auto_72384 ) ) )
    :subtasks
    ( ( !STACK ?auto_72383 ?auto_72384 )
      ( MAKE-1PILE ?auto_72381 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72385 - BLOCK
    )
    :vars
    (
      ?auto_72388 - BLOCK
      ?auto_72387 - BLOCK
      ?auto_72386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72385 ?auto_72388 ) ( not ( = ?auto_72385 ?auto_72388 ) ) ( CLEAR ?auto_72387 ) ( not ( = ?auto_72385 ?auto_72386 ) ) ( not ( = ?auto_72385 ?auto_72387 ) ) ( not ( = ?auto_72388 ?auto_72386 ) ) ( not ( = ?auto_72388 ?auto_72387 ) ) ( not ( = ?auto_72386 ?auto_72387 ) ) ( ON ?auto_72386 ?auto_72385 ) ( CLEAR ?auto_72386 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72388 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72388 ?auto_72385 )
      ( MAKE-1PILE ?auto_72385 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72389 - BLOCK
    )
    :vars
    (
      ?auto_72392 - BLOCK
      ?auto_72391 - BLOCK
      ?auto_72390 - BLOCK
      ?auto_72393 - BLOCK
      ?auto_72396 - BLOCK
      ?auto_72394 - BLOCK
      ?auto_72395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72389 ?auto_72392 ) ( not ( = ?auto_72389 ?auto_72392 ) ) ( not ( = ?auto_72389 ?auto_72391 ) ) ( not ( = ?auto_72389 ?auto_72390 ) ) ( not ( = ?auto_72392 ?auto_72391 ) ) ( not ( = ?auto_72392 ?auto_72390 ) ) ( not ( = ?auto_72391 ?auto_72390 ) ) ( ON ?auto_72391 ?auto_72389 ) ( CLEAR ?auto_72391 ) ( ON-TABLE ?auto_72392 ) ( HOLDING ?auto_72390 ) ( CLEAR ?auto_72393 ) ( ON-TABLE ?auto_72396 ) ( ON ?auto_72394 ?auto_72396 ) ( ON ?auto_72395 ?auto_72394 ) ( ON ?auto_72393 ?auto_72395 ) ( not ( = ?auto_72396 ?auto_72394 ) ) ( not ( = ?auto_72396 ?auto_72395 ) ) ( not ( = ?auto_72396 ?auto_72393 ) ) ( not ( = ?auto_72396 ?auto_72390 ) ) ( not ( = ?auto_72394 ?auto_72395 ) ) ( not ( = ?auto_72394 ?auto_72393 ) ) ( not ( = ?auto_72394 ?auto_72390 ) ) ( not ( = ?auto_72395 ?auto_72393 ) ) ( not ( = ?auto_72395 ?auto_72390 ) ) ( not ( = ?auto_72393 ?auto_72390 ) ) ( not ( = ?auto_72389 ?auto_72393 ) ) ( not ( = ?auto_72389 ?auto_72396 ) ) ( not ( = ?auto_72389 ?auto_72394 ) ) ( not ( = ?auto_72389 ?auto_72395 ) ) ( not ( = ?auto_72392 ?auto_72393 ) ) ( not ( = ?auto_72392 ?auto_72396 ) ) ( not ( = ?auto_72392 ?auto_72394 ) ) ( not ( = ?auto_72392 ?auto_72395 ) ) ( not ( = ?auto_72391 ?auto_72393 ) ) ( not ( = ?auto_72391 ?auto_72396 ) ) ( not ( = ?auto_72391 ?auto_72394 ) ) ( not ( = ?auto_72391 ?auto_72395 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72396 ?auto_72394 ?auto_72395 ?auto_72393 ?auto_72390 )
      ( MAKE-1PILE ?auto_72389 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72397 - BLOCK
    )
    :vars
    (
      ?auto_72400 - BLOCK
      ?auto_72403 - BLOCK
      ?auto_72401 - BLOCK
      ?auto_72404 - BLOCK
      ?auto_72398 - BLOCK
      ?auto_72399 - BLOCK
      ?auto_72402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72397 ?auto_72400 ) ( not ( = ?auto_72397 ?auto_72400 ) ) ( not ( = ?auto_72397 ?auto_72403 ) ) ( not ( = ?auto_72397 ?auto_72401 ) ) ( not ( = ?auto_72400 ?auto_72403 ) ) ( not ( = ?auto_72400 ?auto_72401 ) ) ( not ( = ?auto_72403 ?auto_72401 ) ) ( ON ?auto_72403 ?auto_72397 ) ( ON-TABLE ?auto_72400 ) ( CLEAR ?auto_72404 ) ( ON-TABLE ?auto_72398 ) ( ON ?auto_72399 ?auto_72398 ) ( ON ?auto_72402 ?auto_72399 ) ( ON ?auto_72404 ?auto_72402 ) ( not ( = ?auto_72398 ?auto_72399 ) ) ( not ( = ?auto_72398 ?auto_72402 ) ) ( not ( = ?auto_72398 ?auto_72404 ) ) ( not ( = ?auto_72398 ?auto_72401 ) ) ( not ( = ?auto_72399 ?auto_72402 ) ) ( not ( = ?auto_72399 ?auto_72404 ) ) ( not ( = ?auto_72399 ?auto_72401 ) ) ( not ( = ?auto_72402 ?auto_72404 ) ) ( not ( = ?auto_72402 ?auto_72401 ) ) ( not ( = ?auto_72404 ?auto_72401 ) ) ( not ( = ?auto_72397 ?auto_72404 ) ) ( not ( = ?auto_72397 ?auto_72398 ) ) ( not ( = ?auto_72397 ?auto_72399 ) ) ( not ( = ?auto_72397 ?auto_72402 ) ) ( not ( = ?auto_72400 ?auto_72404 ) ) ( not ( = ?auto_72400 ?auto_72398 ) ) ( not ( = ?auto_72400 ?auto_72399 ) ) ( not ( = ?auto_72400 ?auto_72402 ) ) ( not ( = ?auto_72403 ?auto_72404 ) ) ( not ( = ?auto_72403 ?auto_72398 ) ) ( not ( = ?auto_72403 ?auto_72399 ) ) ( not ( = ?auto_72403 ?auto_72402 ) ) ( ON ?auto_72401 ?auto_72403 ) ( CLEAR ?auto_72401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72400 ?auto_72397 ?auto_72403 )
      ( MAKE-1PILE ?auto_72397 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72405 - BLOCK
    )
    :vars
    (
      ?auto_72412 - BLOCK
      ?auto_72411 - BLOCK
      ?auto_72406 - BLOCK
      ?auto_72410 - BLOCK
      ?auto_72409 - BLOCK
      ?auto_72407 - BLOCK
      ?auto_72408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72405 ?auto_72412 ) ( not ( = ?auto_72405 ?auto_72412 ) ) ( not ( = ?auto_72405 ?auto_72411 ) ) ( not ( = ?auto_72405 ?auto_72406 ) ) ( not ( = ?auto_72412 ?auto_72411 ) ) ( not ( = ?auto_72412 ?auto_72406 ) ) ( not ( = ?auto_72411 ?auto_72406 ) ) ( ON ?auto_72411 ?auto_72405 ) ( ON-TABLE ?auto_72412 ) ( ON-TABLE ?auto_72410 ) ( ON ?auto_72409 ?auto_72410 ) ( ON ?auto_72407 ?auto_72409 ) ( not ( = ?auto_72410 ?auto_72409 ) ) ( not ( = ?auto_72410 ?auto_72407 ) ) ( not ( = ?auto_72410 ?auto_72408 ) ) ( not ( = ?auto_72410 ?auto_72406 ) ) ( not ( = ?auto_72409 ?auto_72407 ) ) ( not ( = ?auto_72409 ?auto_72408 ) ) ( not ( = ?auto_72409 ?auto_72406 ) ) ( not ( = ?auto_72407 ?auto_72408 ) ) ( not ( = ?auto_72407 ?auto_72406 ) ) ( not ( = ?auto_72408 ?auto_72406 ) ) ( not ( = ?auto_72405 ?auto_72408 ) ) ( not ( = ?auto_72405 ?auto_72410 ) ) ( not ( = ?auto_72405 ?auto_72409 ) ) ( not ( = ?auto_72405 ?auto_72407 ) ) ( not ( = ?auto_72412 ?auto_72408 ) ) ( not ( = ?auto_72412 ?auto_72410 ) ) ( not ( = ?auto_72412 ?auto_72409 ) ) ( not ( = ?auto_72412 ?auto_72407 ) ) ( not ( = ?auto_72411 ?auto_72408 ) ) ( not ( = ?auto_72411 ?auto_72410 ) ) ( not ( = ?auto_72411 ?auto_72409 ) ) ( not ( = ?auto_72411 ?auto_72407 ) ) ( ON ?auto_72406 ?auto_72411 ) ( CLEAR ?auto_72406 ) ( HOLDING ?auto_72408 ) ( CLEAR ?auto_72407 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72410 ?auto_72409 ?auto_72407 ?auto_72408 )
      ( MAKE-1PILE ?auto_72405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72413 - BLOCK
    )
    :vars
    (
      ?auto_72415 - BLOCK
      ?auto_72419 - BLOCK
      ?auto_72420 - BLOCK
      ?auto_72418 - BLOCK
      ?auto_72416 - BLOCK
      ?auto_72417 - BLOCK
      ?auto_72414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72413 ?auto_72415 ) ( not ( = ?auto_72413 ?auto_72415 ) ) ( not ( = ?auto_72413 ?auto_72419 ) ) ( not ( = ?auto_72413 ?auto_72420 ) ) ( not ( = ?auto_72415 ?auto_72419 ) ) ( not ( = ?auto_72415 ?auto_72420 ) ) ( not ( = ?auto_72419 ?auto_72420 ) ) ( ON ?auto_72419 ?auto_72413 ) ( ON-TABLE ?auto_72415 ) ( ON-TABLE ?auto_72418 ) ( ON ?auto_72416 ?auto_72418 ) ( ON ?auto_72417 ?auto_72416 ) ( not ( = ?auto_72418 ?auto_72416 ) ) ( not ( = ?auto_72418 ?auto_72417 ) ) ( not ( = ?auto_72418 ?auto_72414 ) ) ( not ( = ?auto_72418 ?auto_72420 ) ) ( not ( = ?auto_72416 ?auto_72417 ) ) ( not ( = ?auto_72416 ?auto_72414 ) ) ( not ( = ?auto_72416 ?auto_72420 ) ) ( not ( = ?auto_72417 ?auto_72414 ) ) ( not ( = ?auto_72417 ?auto_72420 ) ) ( not ( = ?auto_72414 ?auto_72420 ) ) ( not ( = ?auto_72413 ?auto_72414 ) ) ( not ( = ?auto_72413 ?auto_72418 ) ) ( not ( = ?auto_72413 ?auto_72416 ) ) ( not ( = ?auto_72413 ?auto_72417 ) ) ( not ( = ?auto_72415 ?auto_72414 ) ) ( not ( = ?auto_72415 ?auto_72418 ) ) ( not ( = ?auto_72415 ?auto_72416 ) ) ( not ( = ?auto_72415 ?auto_72417 ) ) ( not ( = ?auto_72419 ?auto_72414 ) ) ( not ( = ?auto_72419 ?auto_72418 ) ) ( not ( = ?auto_72419 ?auto_72416 ) ) ( not ( = ?auto_72419 ?auto_72417 ) ) ( ON ?auto_72420 ?auto_72419 ) ( CLEAR ?auto_72417 ) ( ON ?auto_72414 ?auto_72420 ) ( CLEAR ?auto_72414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72415 ?auto_72413 ?auto_72419 ?auto_72420 )
      ( MAKE-1PILE ?auto_72413 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72421 - BLOCK
    )
    :vars
    (
      ?auto_72422 - BLOCK
      ?auto_72423 - BLOCK
      ?auto_72426 - BLOCK
      ?auto_72427 - BLOCK
      ?auto_72424 - BLOCK
      ?auto_72428 - BLOCK
      ?auto_72425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72421 ?auto_72422 ) ( not ( = ?auto_72421 ?auto_72422 ) ) ( not ( = ?auto_72421 ?auto_72423 ) ) ( not ( = ?auto_72421 ?auto_72426 ) ) ( not ( = ?auto_72422 ?auto_72423 ) ) ( not ( = ?auto_72422 ?auto_72426 ) ) ( not ( = ?auto_72423 ?auto_72426 ) ) ( ON ?auto_72423 ?auto_72421 ) ( ON-TABLE ?auto_72422 ) ( ON-TABLE ?auto_72427 ) ( ON ?auto_72424 ?auto_72427 ) ( not ( = ?auto_72427 ?auto_72424 ) ) ( not ( = ?auto_72427 ?auto_72428 ) ) ( not ( = ?auto_72427 ?auto_72425 ) ) ( not ( = ?auto_72427 ?auto_72426 ) ) ( not ( = ?auto_72424 ?auto_72428 ) ) ( not ( = ?auto_72424 ?auto_72425 ) ) ( not ( = ?auto_72424 ?auto_72426 ) ) ( not ( = ?auto_72428 ?auto_72425 ) ) ( not ( = ?auto_72428 ?auto_72426 ) ) ( not ( = ?auto_72425 ?auto_72426 ) ) ( not ( = ?auto_72421 ?auto_72425 ) ) ( not ( = ?auto_72421 ?auto_72427 ) ) ( not ( = ?auto_72421 ?auto_72424 ) ) ( not ( = ?auto_72421 ?auto_72428 ) ) ( not ( = ?auto_72422 ?auto_72425 ) ) ( not ( = ?auto_72422 ?auto_72427 ) ) ( not ( = ?auto_72422 ?auto_72424 ) ) ( not ( = ?auto_72422 ?auto_72428 ) ) ( not ( = ?auto_72423 ?auto_72425 ) ) ( not ( = ?auto_72423 ?auto_72427 ) ) ( not ( = ?auto_72423 ?auto_72424 ) ) ( not ( = ?auto_72423 ?auto_72428 ) ) ( ON ?auto_72426 ?auto_72423 ) ( ON ?auto_72425 ?auto_72426 ) ( CLEAR ?auto_72425 ) ( HOLDING ?auto_72428 ) ( CLEAR ?auto_72424 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72427 ?auto_72424 ?auto_72428 )
      ( MAKE-1PILE ?auto_72421 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72429 - BLOCK
    )
    :vars
    (
      ?auto_72430 - BLOCK
      ?auto_72432 - BLOCK
      ?auto_72431 - BLOCK
      ?auto_72436 - BLOCK
      ?auto_72435 - BLOCK
      ?auto_72434 - BLOCK
      ?auto_72433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72429 ?auto_72430 ) ( not ( = ?auto_72429 ?auto_72430 ) ) ( not ( = ?auto_72429 ?auto_72432 ) ) ( not ( = ?auto_72429 ?auto_72431 ) ) ( not ( = ?auto_72430 ?auto_72432 ) ) ( not ( = ?auto_72430 ?auto_72431 ) ) ( not ( = ?auto_72432 ?auto_72431 ) ) ( ON ?auto_72432 ?auto_72429 ) ( ON-TABLE ?auto_72430 ) ( ON-TABLE ?auto_72436 ) ( ON ?auto_72435 ?auto_72436 ) ( not ( = ?auto_72436 ?auto_72435 ) ) ( not ( = ?auto_72436 ?auto_72434 ) ) ( not ( = ?auto_72436 ?auto_72433 ) ) ( not ( = ?auto_72436 ?auto_72431 ) ) ( not ( = ?auto_72435 ?auto_72434 ) ) ( not ( = ?auto_72435 ?auto_72433 ) ) ( not ( = ?auto_72435 ?auto_72431 ) ) ( not ( = ?auto_72434 ?auto_72433 ) ) ( not ( = ?auto_72434 ?auto_72431 ) ) ( not ( = ?auto_72433 ?auto_72431 ) ) ( not ( = ?auto_72429 ?auto_72433 ) ) ( not ( = ?auto_72429 ?auto_72436 ) ) ( not ( = ?auto_72429 ?auto_72435 ) ) ( not ( = ?auto_72429 ?auto_72434 ) ) ( not ( = ?auto_72430 ?auto_72433 ) ) ( not ( = ?auto_72430 ?auto_72436 ) ) ( not ( = ?auto_72430 ?auto_72435 ) ) ( not ( = ?auto_72430 ?auto_72434 ) ) ( not ( = ?auto_72432 ?auto_72433 ) ) ( not ( = ?auto_72432 ?auto_72436 ) ) ( not ( = ?auto_72432 ?auto_72435 ) ) ( not ( = ?auto_72432 ?auto_72434 ) ) ( ON ?auto_72431 ?auto_72432 ) ( ON ?auto_72433 ?auto_72431 ) ( CLEAR ?auto_72435 ) ( ON ?auto_72434 ?auto_72433 ) ( CLEAR ?auto_72434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72430 ?auto_72429 ?auto_72432 ?auto_72431 ?auto_72433 )
      ( MAKE-1PILE ?auto_72429 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72437 - BLOCK
    )
    :vars
    (
      ?auto_72439 - BLOCK
      ?auto_72438 - BLOCK
      ?auto_72444 - BLOCK
      ?auto_72442 - BLOCK
      ?auto_72441 - BLOCK
      ?auto_72440 - BLOCK
      ?auto_72443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72437 ?auto_72439 ) ( not ( = ?auto_72437 ?auto_72439 ) ) ( not ( = ?auto_72437 ?auto_72438 ) ) ( not ( = ?auto_72437 ?auto_72444 ) ) ( not ( = ?auto_72439 ?auto_72438 ) ) ( not ( = ?auto_72439 ?auto_72444 ) ) ( not ( = ?auto_72438 ?auto_72444 ) ) ( ON ?auto_72438 ?auto_72437 ) ( ON-TABLE ?auto_72439 ) ( ON-TABLE ?auto_72442 ) ( not ( = ?auto_72442 ?auto_72441 ) ) ( not ( = ?auto_72442 ?auto_72440 ) ) ( not ( = ?auto_72442 ?auto_72443 ) ) ( not ( = ?auto_72442 ?auto_72444 ) ) ( not ( = ?auto_72441 ?auto_72440 ) ) ( not ( = ?auto_72441 ?auto_72443 ) ) ( not ( = ?auto_72441 ?auto_72444 ) ) ( not ( = ?auto_72440 ?auto_72443 ) ) ( not ( = ?auto_72440 ?auto_72444 ) ) ( not ( = ?auto_72443 ?auto_72444 ) ) ( not ( = ?auto_72437 ?auto_72443 ) ) ( not ( = ?auto_72437 ?auto_72442 ) ) ( not ( = ?auto_72437 ?auto_72441 ) ) ( not ( = ?auto_72437 ?auto_72440 ) ) ( not ( = ?auto_72439 ?auto_72443 ) ) ( not ( = ?auto_72439 ?auto_72442 ) ) ( not ( = ?auto_72439 ?auto_72441 ) ) ( not ( = ?auto_72439 ?auto_72440 ) ) ( not ( = ?auto_72438 ?auto_72443 ) ) ( not ( = ?auto_72438 ?auto_72442 ) ) ( not ( = ?auto_72438 ?auto_72441 ) ) ( not ( = ?auto_72438 ?auto_72440 ) ) ( ON ?auto_72444 ?auto_72438 ) ( ON ?auto_72443 ?auto_72444 ) ( ON ?auto_72440 ?auto_72443 ) ( CLEAR ?auto_72440 ) ( HOLDING ?auto_72441 ) ( CLEAR ?auto_72442 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72442 ?auto_72441 )
      ( MAKE-1PILE ?auto_72437 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72445 - BLOCK
    )
    :vars
    (
      ?auto_72452 - BLOCK
      ?auto_72448 - BLOCK
      ?auto_72451 - BLOCK
      ?auto_72450 - BLOCK
      ?auto_72449 - BLOCK
      ?auto_72447 - BLOCK
      ?auto_72446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72445 ?auto_72452 ) ( not ( = ?auto_72445 ?auto_72452 ) ) ( not ( = ?auto_72445 ?auto_72448 ) ) ( not ( = ?auto_72445 ?auto_72451 ) ) ( not ( = ?auto_72452 ?auto_72448 ) ) ( not ( = ?auto_72452 ?auto_72451 ) ) ( not ( = ?auto_72448 ?auto_72451 ) ) ( ON ?auto_72448 ?auto_72445 ) ( ON-TABLE ?auto_72452 ) ( ON-TABLE ?auto_72450 ) ( not ( = ?auto_72450 ?auto_72449 ) ) ( not ( = ?auto_72450 ?auto_72447 ) ) ( not ( = ?auto_72450 ?auto_72446 ) ) ( not ( = ?auto_72450 ?auto_72451 ) ) ( not ( = ?auto_72449 ?auto_72447 ) ) ( not ( = ?auto_72449 ?auto_72446 ) ) ( not ( = ?auto_72449 ?auto_72451 ) ) ( not ( = ?auto_72447 ?auto_72446 ) ) ( not ( = ?auto_72447 ?auto_72451 ) ) ( not ( = ?auto_72446 ?auto_72451 ) ) ( not ( = ?auto_72445 ?auto_72446 ) ) ( not ( = ?auto_72445 ?auto_72450 ) ) ( not ( = ?auto_72445 ?auto_72449 ) ) ( not ( = ?auto_72445 ?auto_72447 ) ) ( not ( = ?auto_72452 ?auto_72446 ) ) ( not ( = ?auto_72452 ?auto_72450 ) ) ( not ( = ?auto_72452 ?auto_72449 ) ) ( not ( = ?auto_72452 ?auto_72447 ) ) ( not ( = ?auto_72448 ?auto_72446 ) ) ( not ( = ?auto_72448 ?auto_72450 ) ) ( not ( = ?auto_72448 ?auto_72449 ) ) ( not ( = ?auto_72448 ?auto_72447 ) ) ( ON ?auto_72451 ?auto_72448 ) ( ON ?auto_72446 ?auto_72451 ) ( ON ?auto_72447 ?auto_72446 ) ( CLEAR ?auto_72450 ) ( ON ?auto_72449 ?auto_72447 ) ( CLEAR ?auto_72449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72452 ?auto_72445 ?auto_72448 ?auto_72451 ?auto_72446 ?auto_72447 )
      ( MAKE-1PILE ?auto_72445 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72453 - BLOCK
    )
    :vars
    (
      ?auto_72457 - BLOCK
      ?auto_72454 - BLOCK
      ?auto_72458 - BLOCK
      ?auto_72460 - BLOCK
      ?auto_72455 - BLOCK
      ?auto_72456 - BLOCK
      ?auto_72459 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72453 ?auto_72457 ) ( not ( = ?auto_72453 ?auto_72457 ) ) ( not ( = ?auto_72453 ?auto_72454 ) ) ( not ( = ?auto_72453 ?auto_72458 ) ) ( not ( = ?auto_72457 ?auto_72454 ) ) ( not ( = ?auto_72457 ?auto_72458 ) ) ( not ( = ?auto_72454 ?auto_72458 ) ) ( ON ?auto_72454 ?auto_72453 ) ( ON-TABLE ?auto_72457 ) ( not ( = ?auto_72460 ?auto_72455 ) ) ( not ( = ?auto_72460 ?auto_72456 ) ) ( not ( = ?auto_72460 ?auto_72459 ) ) ( not ( = ?auto_72460 ?auto_72458 ) ) ( not ( = ?auto_72455 ?auto_72456 ) ) ( not ( = ?auto_72455 ?auto_72459 ) ) ( not ( = ?auto_72455 ?auto_72458 ) ) ( not ( = ?auto_72456 ?auto_72459 ) ) ( not ( = ?auto_72456 ?auto_72458 ) ) ( not ( = ?auto_72459 ?auto_72458 ) ) ( not ( = ?auto_72453 ?auto_72459 ) ) ( not ( = ?auto_72453 ?auto_72460 ) ) ( not ( = ?auto_72453 ?auto_72455 ) ) ( not ( = ?auto_72453 ?auto_72456 ) ) ( not ( = ?auto_72457 ?auto_72459 ) ) ( not ( = ?auto_72457 ?auto_72460 ) ) ( not ( = ?auto_72457 ?auto_72455 ) ) ( not ( = ?auto_72457 ?auto_72456 ) ) ( not ( = ?auto_72454 ?auto_72459 ) ) ( not ( = ?auto_72454 ?auto_72460 ) ) ( not ( = ?auto_72454 ?auto_72455 ) ) ( not ( = ?auto_72454 ?auto_72456 ) ) ( ON ?auto_72458 ?auto_72454 ) ( ON ?auto_72459 ?auto_72458 ) ( ON ?auto_72456 ?auto_72459 ) ( ON ?auto_72455 ?auto_72456 ) ( CLEAR ?auto_72455 ) ( HOLDING ?auto_72460 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72460 )
      ( MAKE-1PILE ?auto_72453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_72461 - BLOCK
    )
    :vars
    (
      ?auto_72462 - BLOCK
      ?auto_72466 - BLOCK
      ?auto_72465 - BLOCK
      ?auto_72464 - BLOCK
      ?auto_72463 - BLOCK
      ?auto_72467 - BLOCK
      ?auto_72468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72461 ?auto_72462 ) ( not ( = ?auto_72461 ?auto_72462 ) ) ( not ( = ?auto_72461 ?auto_72466 ) ) ( not ( = ?auto_72461 ?auto_72465 ) ) ( not ( = ?auto_72462 ?auto_72466 ) ) ( not ( = ?auto_72462 ?auto_72465 ) ) ( not ( = ?auto_72466 ?auto_72465 ) ) ( ON ?auto_72466 ?auto_72461 ) ( ON-TABLE ?auto_72462 ) ( not ( = ?auto_72464 ?auto_72463 ) ) ( not ( = ?auto_72464 ?auto_72467 ) ) ( not ( = ?auto_72464 ?auto_72468 ) ) ( not ( = ?auto_72464 ?auto_72465 ) ) ( not ( = ?auto_72463 ?auto_72467 ) ) ( not ( = ?auto_72463 ?auto_72468 ) ) ( not ( = ?auto_72463 ?auto_72465 ) ) ( not ( = ?auto_72467 ?auto_72468 ) ) ( not ( = ?auto_72467 ?auto_72465 ) ) ( not ( = ?auto_72468 ?auto_72465 ) ) ( not ( = ?auto_72461 ?auto_72468 ) ) ( not ( = ?auto_72461 ?auto_72464 ) ) ( not ( = ?auto_72461 ?auto_72463 ) ) ( not ( = ?auto_72461 ?auto_72467 ) ) ( not ( = ?auto_72462 ?auto_72468 ) ) ( not ( = ?auto_72462 ?auto_72464 ) ) ( not ( = ?auto_72462 ?auto_72463 ) ) ( not ( = ?auto_72462 ?auto_72467 ) ) ( not ( = ?auto_72466 ?auto_72468 ) ) ( not ( = ?auto_72466 ?auto_72464 ) ) ( not ( = ?auto_72466 ?auto_72463 ) ) ( not ( = ?auto_72466 ?auto_72467 ) ) ( ON ?auto_72465 ?auto_72466 ) ( ON ?auto_72468 ?auto_72465 ) ( ON ?auto_72467 ?auto_72468 ) ( ON ?auto_72463 ?auto_72467 ) ( ON ?auto_72464 ?auto_72463 ) ( CLEAR ?auto_72464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_72462 ?auto_72461 ?auto_72466 ?auto_72465 ?auto_72468 ?auto_72467 ?auto_72463 )
      ( MAKE-1PILE ?auto_72461 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_72480 - BLOCK
      ?auto_72481 - BLOCK
      ?auto_72482 - BLOCK
      ?auto_72483 - BLOCK
      ?auto_72484 - BLOCK
    )
    :vars
    (
      ?auto_72485 - BLOCK
      ?auto_72486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72485 ?auto_72484 ) ( CLEAR ?auto_72485 ) ( ON-TABLE ?auto_72480 ) ( ON ?auto_72481 ?auto_72480 ) ( ON ?auto_72482 ?auto_72481 ) ( ON ?auto_72483 ?auto_72482 ) ( ON ?auto_72484 ?auto_72483 ) ( not ( = ?auto_72480 ?auto_72481 ) ) ( not ( = ?auto_72480 ?auto_72482 ) ) ( not ( = ?auto_72480 ?auto_72483 ) ) ( not ( = ?auto_72480 ?auto_72484 ) ) ( not ( = ?auto_72480 ?auto_72485 ) ) ( not ( = ?auto_72481 ?auto_72482 ) ) ( not ( = ?auto_72481 ?auto_72483 ) ) ( not ( = ?auto_72481 ?auto_72484 ) ) ( not ( = ?auto_72481 ?auto_72485 ) ) ( not ( = ?auto_72482 ?auto_72483 ) ) ( not ( = ?auto_72482 ?auto_72484 ) ) ( not ( = ?auto_72482 ?auto_72485 ) ) ( not ( = ?auto_72483 ?auto_72484 ) ) ( not ( = ?auto_72483 ?auto_72485 ) ) ( not ( = ?auto_72484 ?auto_72485 ) ) ( HOLDING ?auto_72486 ) ( not ( = ?auto_72480 ?auto_72486 ) ) ( not ( = ?auto_72481 ?auto_72486 ) ) ( not ( = ?auto_72482 ?auto_72486 ) ) ( not ( = ?auto_72483 ?auto_72486 ) ) ( not ( = ?auto_72484 ?auto_72486 ) ) ( not ( = ?auto_72485 ?auto_72486 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_72486 )
      ( MAKE-5PILE ?auto_72480 ?auto_72481 ?auto_72482 ?auto_72483 ?auto_72484 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72577 - BLOCK
      ?auto_72578 - BLOCK
    )
    :vars
    (
      ?auto_72579 - BLOCK
      ?auto_72582 - BLOCK
      ?auto_72580 - BLOCK
      ?auto_72583 - BLOCK
      ?auto_72581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72577 ?auto_72578 ) ) ( ON ?auto_72578 ?auto_72579 ) ( not ( = ?auto_72577 ?auto_72579 ) ) ( not ( = ?auto_72578 ?auto_72579 ) ) ( ON ?auto_72577 ?auto_72578 ) ( CLEAR ?auto_72577 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72582 ) ( ON ?auto_72580 ?auto_72582 ) ( ON ?auto_72583 ?auto_72580 ) ( ON ?auto_72581 ?auto_72583 ) ( ON ?auto_72579 ?auto_72581 ) ( not ( = ?auto_72582 ?auto_72580 ) ) ( not ( = ?auto_72582 ?auto_72583 ) ) ( not ( = ?auto_72582 ?auto_72581 ) ) ( not ( = ?auto_72582 ?auto_72579 ) ) ( not ( = ?auto_72582 ?auto_72578 ) ) ( not ( = ?auto_72582 ?auto_72577 ) ) ( not ( = ?auto_72580 ?auto_72583 ) ) ( not ( = ?auto_72580 ?auto_72581 ) ) ( not ( = ?auto_72580 ?auto_72579 ) ) ( not ( = ?auto_72580 ?auto_72578 ) ) ( not ( = ?auto_72580 ?auto_72577 ) ) ( not ( = ?auto_72583 ?auto_72581 ) ) ( not ( = ?auto_72583 ?auto_72579 ) ) ( not ( = ?auto_72583 ?auto_72578 ) ) ( not ( = ?auto_72583 ?auto_72577 ) ) ( not ( = ?auto_72581 ?auto_72579 ) ) ( not ( = ?auto_72581 ?auto_72578 ) ) ( not ( = ?auto_72581 ?auto_72577 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72582 ?auto_72580 ?auto_72583 ?auto_72581 ?auto_72579 ?auto_72578 )
      ( MAKE-2PILE ?auto_72577 ?auto_72578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72586 - BLOCK
      ?auto_72587 - BLOCK
    )
    :vars
    (
      ?auto_72588 - BLOCK
      ?auto_72589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72586 ?auto_72587 ) ) ( ON ?auto_72587 ?auto_72588 ) ( CLEAR ?auto_72587 ) ( not ( = ?auto_72586 ?auto_72588 ) ) ( not ( = ?auto_72587 ?auto_72588 ) ) ( ON ?auto_72586 ?auto_72589 ) ( CLEAR ?auto_72586 ) ( HAND-EMPTY ) ( not ( = ?auto_72586 ?auto_72589 ) ) ( not ( = ?auto_72587 ?auto_72589 ) ) ( not ( = ?auto_72588 ?auto_72589 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72586 ?auto_72589 )
      ( MAKE-2PILE ?auto_72586 ?auto_72587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72590 - BLOCK
      ?auto_72591 - BLOCK
    )
    :vars
    (
      ?auto_72592 - BLOCK
      ?auto_72593 - BLOCK
      ?auto_72597 - BLOCK
      ?auto_72596 - BLOCK
      ?auto_72594 - BLOCK
      ?auto_72595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72590 ?auto_72591 ) ) ( not ( = ?auto_72590 ?auto_72592 ) ) ( not ( = ?auto_72591 ?auto_72592 ) ) ( ON ?auto_72590 ?auto_72593 ) ( CLEAR ?auto_72590 ) ( not ( = ?auto_72590 ?auto_72593 ) ) ( not ( = ?auto_72591 ?auto_72593 ) ) ( not ( = ?auto_72592 ?auto_72593 ) ) ( HOLDING ?auto_72591 ) ( CLEAR ?auto_72592 ) ( ON-TABLE ?auto_72597 ) ( ON ?auto_72596 ?auto_72597 ) ( ON ?auto_72594 ?auto_72596 ) ( ON ?auto_72595 ?auto_72594 ) ( ON ?auto_72592 ?auto_72595 ) ( not ( = ?auto_72597 ?auto_72596 ) ) ( not ( = ?auto_72597 ?auto_72594 ) ) ( not ( = ?auto_72597 ?auto_72595 ) ) ( not ( = ?auto_72597 ?auto_72592 ) ) ( not ( = ?auto_72597 ?auto_72591 ) ) ( not ( = ?auto_72596 ?auto_72594 ) ) ( not ( = ?auto_72596 ?auto_72595 ) ) ( not ( = ?auto_72596 ?auto_72592 ) ) ( not ( = ?auto_72596 ?auto_72591 ) ) ( not ( = ?auto_72594 ?auto_72595 ) ) ( not ( = ?auto_72594 ?auto_72592 ) ) ( not ( = ?auto_72594 ?auto_72591 ) ) ( not ( = ?auto_72595 ?auto_72592 ) ) ( not ( = ?auto_72595 ?auto_72591 ) ) ( not ( = ?auto_72590 ?auto_72597 ) ) ( not ( = ?auto_72590 ?auto_72596 ) ) ( not ( = ?auto_72590 ?auto_72594 ) ) ( not ( = ?auto_72590 ?auto_72595 ) ) ( not ( = ?auto_72593 ?auto_72597 ) ) ( not ( = ?auto_72593 ?auto_72596 ) ) ( not ( = ?auto_72593 ?auto_72594 ) ) ( not ( = ?auto_72593 ?auto_72595 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72597 ?auto_72596 ?auto_72594 ?auto_72595 ?auto_72592 ?auto_72591 )
      ( MAKE-2PILE ?auto_72590 ?auto_72591 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72598 - BLOCK
      ?auto_72599 - BLOCK
    )
    :vars
    (
      ?auto_72603 - BLOCK
      ?auto_72604 - BLOCK
      ?auto_72601 - BLOCK
      ?auto_72602 - BLOCK
      ?auto_72600 - BLOCK
      ?auto_72605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72598 ?auto_72599 ) ) ( not ( = ?auto_72598 ?auto_72603 ) ) ( not ( = ?auto_72599 ?auto_72603 ) ) ( ON ?auto_72598 ?auto_72604 ) ( not ( = ?auto_72598 ?auto_72604 ) ) ( not ( = ?auto_72599 ?auto_72604 ) ) ( not ( = ?auto_72603 ?auto_72604 ) ) ( CLEAR ?auto_72603 ) ( ON-TABLE ?auto_72601 ) ( ON ?auto_72602 ?auto_72601 ) ( ON ?auto_72600 ?auto_72602 ) ( ON ?auto_72605 ?auto_72600 ) ( ON ?auto_72603 ?auto_72605 ) ( not ( = ?auto_72601 ?auto_72602 ) ) ( not ( = ?auto_72601 ?auto_72600 ) ) ( not ( = ?auto_72601 ?auto_72605 ) ) ( not ( = ?auto_72601 ?auto_72603 ) ) ( not ( = ?auto_72601 ?auto_72599 ) ) ( not ( = ?auto_72602 ?auto_72600 ) ) ( not ( = ?auto_72602 ?auto_72605 ) ) ( not ( = ?auto_72602 ?auto_72603 ) ) ( not ( = ?auto_72602 ?auto_72599 ) ) ( not ( = ?auto_72600 ?auto_72605 ) ) ( not ( = ?auto_72600 ?auto_72603 ) ) ( not ( = ?auto_72600 ?auto_72599 ) ) ( not ( = ?auto_72605 ?auto_72603 ) ) ( not ( = ?auto_72605 ?auto_72599 ) ) ( not ( = ?auto_72598 ?auto_72601 ) ) ( not ( = ?auto_72598 ?auto_72602 ) ) ( not ( = ?auto_72598 ?auto_72600 ) ) ( not ( = ?auto_72598 ?auto_72605 ) ) ( not ( = ?auto_72604 ?auto_72601 ) ) ( not ( = ?auto_72604 ?auto_72602 ) ) ( not ( = ?auto_72604 ?auto_72600 ) ) ( not ( = ?auto_72604 ?auto_72605 ) ) ( ON ?auto_72599 ?auto_72598 ) ( CLEAR ?auto_72599 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72604 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72604 ?auto_72598 )
      ( MAKE-2PILE ?auto_72598 ?auto_72599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72606 - BLOCK
      ?auto_72607 - BLOCK
    )
    :vars
    (
      ?auto_72611 - BLOCK
      ?auto_72608 - BLOCK
      ?auto_72613 - BLOCK
      ?auto_72612 - BLOCK
      ?auto_72610 - BLOCK
      ?auto_72609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72606 ?auto_72607 ) ) ( not ( = ?auto_72606 ?auto_72611 ) ) ( not ( = ?auto_72607 ?auto_72611 ) ) ( ON ?auto_72606 ?auto_72608 ) ( not ( = ?auto_72606 ?auto_72608 ) ) ( not ( = ?auto_72607 ?auto_72608 ) ) ( not ( = ?auto_72611 ?auto_72608 ) ) ( ON-TABLE ?auto_72613 ) ( ON ?auto_72612 ?auto_72613 ) ( ON ?auto_72610 ?auto_72612 ) ( ON ?auto_72609 ?auto_72610 ) ( not ( = ?auto_72613 ?auto_72612 ) ) ( not ( = ?auto_72613 ?auto_72610 ) ) ( not ( = ?auto_72613 ?auto_72609 ) ) ( not ( = ?auto_72613 ?auto_72611 ) ) ( not ( = ?auto_72613 ?auto_72607 ) ) ( not ( = ?auto_72612 ?auto_72610 ) ) ( not ( = ?auto_72612 ?auto_72609 ) ) ( not ( = ?auto_72612 ?auto_72611 ) ) ( not ( = ?auto_72612 ?auto_72607 ) ) ( not ( = ?auto_72610 ?auto_72609 ) ) ( not ( = ?auto_72610 ?auto_72611 ) ) ( not ( = ?auto_72610 ?auto_72607 ) ) ( not ( = ?auto_72609 ?auto_72611 ) ) ( not ( = ?auto_72609 ?auto_72607 ) ) ( not ( = ?auto_72606 ?auto_72613 ) ) ( not ( = ?auto_72606 ?auto_72612 ) ) ( not ( = ?auto_72606 ?auto_72610 ) ) ( not ( = ?auto_72606 ?auto_72609 ) ) ( not ( = ?auto_72608 ?auto_72613 ) ) ( not ( = ?auto_72608 ?auto_72612 ) ) ( not ( = ?auto_72608 ?auto_72610 ) ) ( not ( = ?auto_72608 ?auto_72609 ) ) ( ON ?auto_72607 ?auto_72606 ) ( CLEAR ?auto_72607 ) ( ON-TABLE ?auto_72608 ) ( HOLDING ?auto_72611 ) ( CLEAR ?auto_72609 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72613 ?auto_72612 ?auto_72610 ?auto_72609 ?auto_72611 )
      ( MAKE-2PILE ?auto_72606 ?auto_72607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72614 - BLOCK
      ?auto_72615 - BLOCK
    )
    :vars
    (
      ?auto_72616 - BLOCK
      ?auto_72617 - BLOCK
      ?auto_72621 - BLOCK
      ?auto_72618 - BLOCK
      ?auto_72619 - BLOCK
      ?auto_72620 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72614 ?auto_72615 ) ) ( not ( = ?auto_72614 ?auto_72616 ) ) ( not ( = ?auto_72615 ?auto_72616 ) ) ( ON ?auto_72614 ?auto_72617 ) ( not ( = ?auto_72614 ?auto_72617 ) ) ( not ( = ?auto_72615 ?auto_72617 ) ) ( not ( = ?auto_72616 ?auto_72617 ) ) ( ON-TABLE ?auto_72621 ) ( ON ?auto_72618 ?auto_72621 ) ( ON ?auto_72619 ?auto_72618 ) ( ON ?auto_72620 ?auto_72619 ) ( not ( = ?auto_72621 ?auto_72618 ) ) ( not ( = ?auto_72621 ?auto_72619 ) ) ( not ( = ?auto_72621 ?auto_72620 ) ) ( not ( = ?auto_72621 ?auto_72616 ) ) ( not ( = ?auto_72621 ?auto_72615 ) ) ( not ( = ?auto_72618 ?auto_72619 ) ) ( not ( = ?auto_72618 ?auto_72620 ) ) ( not ( = ?auto_72618 ?auto_72616 ) ) ( not ( = ?auto_72618 ?auto_72615 ) ) ( not ( = ?auto_72619 ?auto_72620 ) ) ( not ( = ?auto_72619 ?auto_72616 ) ) ( not ( = ?auto_72619 ?auto_72615 ) ) ( not ( = ?auto_72620 ?auto_72616 ) ) ( not ( = ?auto_72620 ?auto_72615 ) ) ( not ( = ?auto_72614 ?auto_72621 ) ) ( not ( = ?auto_72614 ?auto_72618 ) ) ( not ( = ?auto_72614 ?auto_72619 ) ) ( not ( = ?auto_72614 ?auto_72620 ) ) ( not ( = ?auto_72617 ?auto_72621 ) ) ( not ( = ?auto_72617 ?auto_72618 ) ) ( not ( = ?auto_72617 ?auto_72619 ) ) ( not ( = ?auto_72617 ?auto_72620 ) ) ( ON ?auto_72615 ?auto_72614 ) ( ON-TABLE ?auto_72617 ) ( CLEAR ?auto_72620 ) ( ON ?auto_72616 ?auto_72615 ) ( CLEAR ?auto_72616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72617 ?auto_72614 ?auto_72615 )
      ( MAKE-2PILE ?auto_72614 ?auto_72615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72622 - BLOCK
      ?auto_72623 - BLOCK
    )
    :vars
    (
      ?auto_72629 - BLOCK
      ?auto_72625 - BLOCK
      ?auto_72626 - BLOCK
      ?auto_72628 - BLOCK
      ?auto_72627 - BLOCK
      ?auto_72624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72622 ?auto_72623 ) ) ( not ( = ?auto_72622 ?auto_72629 ) ) ( not ( = ?auto_72623 ?auto_72629 ) ) ( ON ?auto_72622 ?auto_72625 ) ( not ( = ?auto_72622 ?auto_72625 ) ) ( not ( = ?auto_72623 ?auto_72625 ) ) ( not ( = ?auto_72629 ?auto_72625 ) ) ( ON-TABLE ?auto_72626 ) ( ON ?auto_72628 ?auto_72626 ) ( ON ?auto_72627 ?auto_72628 ) ( not ( = ?auto_72626 ?auto_72628 ) ) ( not ( = ?auto_72626 ?auto_72627 ) ) ( not ( = ?auto_72626 ?auto_72624 ) ) ( not ( = ?auto_72626 ?auto_72629 ) ) ( not ( = ?auto_72626 ?auto_72623 ) ) ( not ( = ?auto_72628 ?auto_72627 ) ) ( not ( = ?auto_72628 ?auto_72624 ) ) ( not ( = ?auto_72628 ?auto_72629 ) ) ( not ( = ?auto_72628 ?auto_72623 ) ) ( not ( = ?auto_72627 ?auto_72624 ) ) ( not ( = ?auto_72627 ?auto_72629 ) ) ( not ( = ?auto_72627 ?auto_72623 ) ) ( not ( = ?auto_72624 ?auto_72629 ) ) ( not ( = ?auto_72624 ?auto_72623 ) ) ( not ( = ?auto_72622 ?auto_72626 ) ) ( not ( = ?auto_72622 ?auto_72628 ) ) ( not ( = ?auto_72622 ?auto_72627 ) ) ( not ( = ?auto_72622 ?auto_72624 ) ) ( not ( = ?auto_72625 ?auto_72626 ) ) ( not ( = ?auto_72625 ?auto_72628 ) ) ( not ( = ?auto_72625 ?auto_72627 ) ) ( not ( = ?auto_72625 ?auto_72624 ) ) ( ON ?auto_72623 ?auto_72622 ) ( ON-TABLE ?auto_72625 ) ( ON ?auto_72629 ?auto_72623 ) ( CLEAR ?auto_72629 ) ( HOLDING ?auto_72624 ) ( CLEAR ?auto_72627 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72626 ?auto_72628 ?auto_72627 ?auto_72624 )
      ( MAKE-2PILE ?auto_72622 ?auto_72623 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72630 - BLOCK
      ?auto_72631 - BLOCK
    )
    :vars
    (
      ?auto_72636 - BLOCK
      ?auto_72637 - BLOCK
      ?auto_72634 - BLOCK
      ?auto_72635 - BLOCK
      ?auto_72632 - BLOCK
      ?auto_72633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72630 ?auto_72631 ) ) ( not ( = ?auto_72630 ?auto_72636 ) ) ( not ( = ?auto_72631 ?auto_72636 ) ) ( ON ?auto_72630 ?auto_72637 ) ( not ( = ?auto_72630 ?auto_72637 ) ) ( not ( = ?auto_72631 ?auto_72637 ) ) ( not ( = ?auto_72636 ?auto_72637 ) ) ( ON-TABLE ?auto_72634 ) ( ON ?auto_72635 ?auto_72634 ) ( ON ?auto_72632 ?auto_72635 ) ( not ( = ?auto_72634 ?auto_72635 ) ) ( not ( = ?auto_72634 ?auto_72632 ) ) ( not ( = ?auto_72634 ?auto_72633 ) ) ( not ( = ?auto_72634 ?auto_72636 ) ) ( not ( = ?auto_72634 ?auto_72631 ) ) ( not ( = ?auto_72635 ?auto_72632 ) ) ( not ( = ?auto_72635 ?auto_72633 ) ) ( not ( = ?auto_72635 ?auto_72636 ) ) ( not ( = ?auto_72635 ?auto_72631 ) ) ( not ( = ?auto_72632 ?auto_72633 ) ) ( not ( = ?auto_72632 ?auto_72636 ) ) ( not ( = ?auto_72632 ?auto_72631 ) ) ( not ( = ?auto_72633 ?auto_72636 ) ) ( not ( = ?auto_72633 ?auto_72631 ) ) ( not ( = ?auto_72630 ?auto_72634 ) ) ( not ( = ?auto_72630 ?auto_72635 ) ) ( not ( = ?auto_72630 ?auto_72632 ) ) ( not ( = ?auto_72630 ?auto_72633 ) ) ( not ( = ?auto_72637 ?auto_72634 ) ) ( not ( = ?auto_72637 ?auto_72635 ) ) ( not ( = ?auto_72637 ?auto_72632 ) ) ( not ( = ?auto_72637 ?auto_72633 ) ) ( ON ?auto_72631 ?auto_72630 ) ( ON-TABLE ?auto_72637 ) ( ON ?auto_72636 ?auto_72631 ) ( CLEAR ?auto_72632 ) ( ON ?auto_72633 ?auto_72636 ) ( CLEAR ?auto_72633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72637 ?auto_72630 ?auto_72631 ?auto_72636 )
      ( MAKE-2PILE ?auto_72630 ?auto_72631 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72638 - BLOCK
      ?auto_72639 - BLOCK
    )
    :vars
    (
      ?auto_72645 - BLOCK
      ?auto_72642 - BLOCK
      ?auto_72643 - BLOCK
      ?auto_72640 - BLOCK
      ?auto_72644 - BLOCK
      ?auto_72641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72638 ?auto_72639 ) ) ( not ( = ?auto_72638 ?auto_72645 ) ) ( not ( = ?auto_72639 ?auto_72645 ) ) ( ON ?auto_72638 ?auto_72642 ) ( not ( = ?auto_72638 ?auto_72642 ) ) ( not ( = ?auto_72639 ?auto_72642 ) ) ( not ( = ?auto_72645 ?auto_72642 ) ) ( ON-TABLE ?auto_72643 ) ( ON ?auto_72640 ?auto_72643 ) ( not ( = ?auto_72643 ?auto_72640 ) ) ( not ( = ?auto_72643 ?auto_72644 ) ) ( not ( = ?auto_72643 ?auto_72641 ) ) ( not ( = ?auto_72643 ?auto_72645 ) ) ( not ( = ?auto_72643 ?auto_72639 ) ) ( not ( = ?auto_72640 ?auto_72644 ) ) ( not ( = ?auto_72640 ?auto_72641 ) ) ( not ( = ?auto_72640 ?auto_72645 ) ) ( not ( = ?auto_72640 ?auto_72639 ) ) ( not ( = ?auto_72644 ?auto_72641 ) ) ( not ( = ?auto_72644 ?auto_72645 ) ) ( not ( = ?auto_72644 ?auto_72639 ) ) ( not ( = ?auto_72641 ?auto_72645 ) ) ( not ( = ?auto_72641 ?auto_72639 ) ) ( not ( = ?auto_72638 ?auto_72643 ) ) ( not ( = ?auto_72638 ?auto_72640 ) ) ( not ( = ?auto_72638 ?auto_72644 ) ) ( not ( = ?auto_72638 ?auto_72641 ) ) ( not ( = ?auto_72642 ?auto_72643 ) ) ( not ( = ?auto_72642 ?auto_72640 ) ) ( not ( = ?auto_72642 ?auto_72644 ) ) ( not ( = ?auto_72642 ?auto_72641 ) ) ( ON ?auto_72639 ?auto_72638 ) ( ON-TABLE ?auto_72642 ) ( ON ?auto_72645 ?auto_72639 ) ( ON ?auto_72641 ?auto_72645 ) ( CLEAR ?auto_72641 ) ( HOLDING ?auto_72644 ) ( CLEAR ?auto_72640 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72643 ?auto_72640 ?auto_72644 )
      ( MAKE-2PILE ?auto_72638 ?auto_72639 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72646 - BLOCK
      ?auto_72647 - BLOCK
    )
    :vars
    (
      ?auto_72649 - BLOCK
      ?auto_72648 - BLOCK
      ?auto_72651 - BLOCK
      ?auto_72653 - BLOCK
      ?auto_72652 - BLOCK
      ?auto_72650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72646 ?auto_72647 ) ) ( not ( = ?auto_72646 ?auto_72649 ) ) ( not ( = ?auto_72647 ?auto_72649 ) ) ( ON ?auto_72646 ?auto_72648 ) ( not ( = ?auto_72646 ?auto_72648 ) ) ( not ( = ?auto_72647 ?auto_72648 ) ) ( not ( = ?auto_72649 ?auto_72648 ) ) ( ON-TABLE ?auto_72651 ) ( ON ?auto_72653 ?auto_72651 ) ( not ( = ?auto_72651 ?auto_72653 ) ) ( not ( = ?auto_72651 ?auto_72652 ) ) ( not ( = ?auto_72651 ?auto_72650 ) ) ( not ( = ?auto_72651 ?auto_72649 ) ) ( not ( = ?auto_72651 ?auto_72647 ) ) ( not ( = ?auto_72653 ?auto_72652 ) ) ( not ( = ?auto_72653 ?auto_72650 ) ) ( not ( = ?auto_72653 ?auto_72649 ) ) ( not ( = ?auto_72653 ?auto_72647 ) ) ( not ( = ?auto_72652 ?auto_72650 ) ) ( not ( = ?auto_72652 ?auto_72649 ) ) ( not ( = ?auto_72652 ?auto_72647 ) ) ( not ( = ?auto_72650 ?auto_72649 ) ) ( not ( = ?auto_72650 ?auto_72647 ) ) ( not ( = ?auto_72646 ?auto_72651 ) ) ( not ( = ?auto_72646 ?auto_72653 ) ) ( not ( = ?auto_72646 ?auto_72652 ) ) ( not ( = ?auto_72646 ?auto_72650 ) ) ( not ( = ?auto_72648 ?auto_72651 ) ) ( not ( = ?auto_72648 ?auto_72653 ) ) ( not ( = ?auto_72648 ?auto_72652 ) ) ( not ( = ?auto_72648 ?auto_72650 ) ) ( ON ?auto_72647 ?auto_72646 ) ( ON-TABLE ?auto_72648 ) ( ON ?auto_72649 ?auto_72647 ) ( ON ?auto_72650 ?auto_72649 ) ( CLEAR ?auto_72653 ) ( ON ?auto_72652 ?auto_72650 ) ( CLEAR ?auto_72652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72648 ?auto_72646 ?auto_72647 ?auto_72649 ?auto_72650 )
      ( MAKE-2PILE ?auto_72646 ?auto_72647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72654 - BLOCK
      ?auto_72655 - BLOCK
    )
    :vars
    (
      ?auto_72661 - BLOCK
      ?auto_72660 - BLOCK
      ?auto_72658 - BLOCK
      ?auto_72659 - BLOCK
      ?auto_72656 - BLOCK
      ?auto_72657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72654 ?auto_72655 ) ) ( not ( = ?auto_72654 ?auto_72661 ) ) ( not ( = ?auto_72655 ?auto_72661 ) ) ( ON ?auto_72654 ?auto_72660 ) ( not ( = ?auto_72654 ?auto_72660 ) ) ( not ( = ?auto_72655 ?auto_72660 ) ) ( not ( = ?auto_72661 ?auto_72660 ) ) ( ON-TABLE ?auto_72658 ) ( not ( = ?auto_72658 ?auto_72659 ) ) ( not ( = ?auto_72658 ?auto_72656 ) ) ( not ( = ?auto_72658 ?auto_72657 ) ) ( not ( = ?auto_72658 ?auto_72661 ) ) ( not ( = ?auto_72658 ?auto_72655 ) ) ( not ( = ?auto_72659 ?auto_72656 ) ) ( not ( = ?auto_72659 ?auto_72657 ) ) ( not ( = ?auto_72659 ?auto_72661 ) ) ( not ( = ?auto_72659 ?auto_72655 ) ) ( not ( = ?auto_72656 ?auto_72657 ) ) ( not ( = ?auto_72656 ?auto_72661 ) ) ( not ( = ?auto_72656 ?auto_72655 ) ) ( not ( = ?auto_72657 ?auto_72661 ) ) ( not ( = ?auto_72657 ?auto_72655 ) ) ( not ( = ?auto_72654 ?auto_72658 ) ) ( not ( = ?auto_72654 ?auto_72659 ) ) ( not ( = ?auto_72654 ?auto_72656 ) ) ( not ( = ?auto_72654 ?auto_72657 ) ) ( not ( = ?auto_72660 ?auto_72658 ) ) ( not ( = ?auto_72660 ?auto_72659 ) ) ( not ( = ?auto_72660 ?auto_72656 ) ) ( not ( = ?auto_72660 ?auto_72657 ) ) ( ON ?auto_72655 ?auto_72654 ) ( ON-TABLE ?auto_72660 ) ( ON ?auto_72661 ?auto_72655 ) ( ON ?auto_72657 ?auto_72661 ) ( ON ?auto_72656 ?auto_72657 ) ( CLEAR ?auto_72656 ) ( HOLDING ?auto_72659 ) ( CLEAR ?auto_72658 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72658 ?auto_72659 )
      ( MAKE-2PILE ?auto_72654 ?auto_72655 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72662 - BLOCK
      ?auto_72663 - BLOCK
    )
    :vars
    (
      ?auto_72668 - BLOCK
      ?auto_72667 - BLOCK
      ?auto_72666 - BLOCK
      ?auto_72664 - BLOCK
      ?auto_72665 - BLOCK
      ?auto_72669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72662 ?auto_72663 ) ) ( not ( = ?auto_72662 ?auto_72668 ) ) ( not ( = ?auto_72663 ?auto_72668 ) ) ( ON ?auto_72662 ?auto_72667 ) ( not ( = ?auto_72662 ?auto_72667 ) ) ( not ( = ?auto_72663 ?auto_72667 ) ) ( not ( = ?auto_72668 ?auto_72667 ) ) ( ON-TABLE ?auto_72666 ) ( not ( = ?auto_72666 ?auto_72664 ) ) ( not ( = ?auto_72666 ?auto_72665 ) ) ( not ( = ?auto_72666 ?auto_72669 ) ) ( not ( = ?auto_72666 ?auto_72668 ) ) ( not ( = ?auto_72666 ?auto_72663 ) ) ( not ( = ?auto_72664 ?auto_72665 ) ) ( not ( = ?auto_72664 ?auto_72669 ) ) ( not ( = ?auto_72664 ?auto_72668 ) ) ( not ( = ?auto_72664 ?auto_72663 ) ) ( not ( = ?auto_72665 ?auto_72669 ) ) ( not ( = ?auto_72665 ?auto_72668 ) ) ( not ( = ?auto_72665 ?auto_72663 ) ) ( not ( = ?auto_72669 ?auto_72668 ) ) ( not ( = ?auto_72669 ?auto_72663 ) ) ( not ( = ?auto_72662 ?auto_72666 ) ) ( not ( = ?auto_72662 ?auto_72664 ) ) ( not ( = ?auto_72662 ?auto_72665 ) ) ( not ( = ?auto_72662 ?auto_72669 ) ) ( not ( = ?auto_72667 ?auto_72666 ) ) ( not ( = ?auto_72667 ?auto_72664 ) ) ( not ( = ?auto_72667 ?auto_72665 ) ) ( not ( = ?auto_72667 ?auto_72669 ) ) ( ON ?auto_72663 ?auto_72662 ) ( ON-TABLE ?auto_72667 ) ( ON ?auto_72668 ?auto_72663 ) ( ON ?auto_72669 ?auto_72668 ) ( ON ?auto_72665 ?auto_72669 ) ( CLEAR ?auto_72666 ) ( ON ?auto_72664 ?auto_72665 ) ( CLEAR ?auto_72664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72667 ?auto_72662 ?auto_72663 ?auto_72668 ?auto_72669 ?auto_72665 )
      ( MAKE-2PILE ?auto_72662 ?auto_72663 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72670 - BLOCK
      ?auto_72671 - BLOCK
    )
    :vars
    (
      ?auto_72676 - BLOCK
      ?auto_72675 - BLOCK
      ?auto_72673 - BLOCK
      ?auto_72672 - BLOCK
      ?auto_72674 - BLOCK
      ?auto_72677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72670 ?auto_72671 ) ) ( not ( = ?auto_72670 ?auto_72676 ) ) ( not ( = ?auto_72671 ?auto_72676 ) ) ( ON ?auto_72670 ?auto_72675 ) ( not ( = ?auto_72670 ?auto_72675 ) ) ( not ( = ?auto_72671 ?auto_72675 ) ) ( not ( = ?auto_72676 ?auto_72675 ) ) ( not ( = ?auto_72673 ?auto_72672 ) ) ( not ( = ?auto_72673 ?auto_72674 ) ) ( not ( = ?auto_72673 ?auto_72677 ) ) ( not ( = ?auto_72673 ?auto_72676 ) ) ( not ( = ?auto_72673 ?auto_72671 ) ) ( not ( = ?auto_72672 ?auto_72674 ) ) ( not ( = ?auto_72672 ?auto_72677 ) ) ( not ( = ?auto_72672 ?auto_72676 ) ) ( not ( = ?auto_72672 ?auto_72671 ) ) ( not ( = ?auto_72674 ?auto_72677 ) ) ( not ( = ?auto_72674 ?auto_72676 ) ) ( not ( = ?auto_72674 ?auto_72671 ) ) ( not ( = ?auto_72677 ?auto_72676 ) ) ( not ( = ?auto_72677 ?auto_72671 ) ) ( not ( = ?auto_72670 ?auto_72673 ) ) ( not ( = ?auto_72670 ?auto_72672 ) ) ( not ( = ?auto_72670 ?auto_72674 ) ) ( not ( = ?auto_72670 ?auto_72677 ) ) ( not ( = ?auto_72675 ?auto_72673 ) ) ( not ( = ?auto_72675 ?auto_72672 ) ) ( not ( = ?auto_72675 ?auto_72674 ) ) ( not ( = ?auto_72675 ?auto_72677 ) ) ( ON ?auto_72671 ?auto_72670 ) ( ON-TABLE ?auto_72675 ) ( ON ?auto_72676 ?auto_72671 ) ( ON ?auto_72677 ?auto_72676 ) ( ON ?auto_72674 ?auto_72677 ) ( ON ?auto_72672 ?auto_72674 ) ( CLEAR ?auto_72672 ) ( HOLDING ?auto_72673 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72673 )
      ( MAKE-2PILE ?auto_72670 ?auto_72671 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72678 - BLOCK
      ?auto_72679 - BLOCK
    )
    :vars
    (
      ?auto_72684 - BLOCK
      ?auto_72683 - BLOCK
      ?auto_72682 - BLOCK
      ?auto_72680 - BLOCK
      ?auto_72685 - BLOCK
      ?auto_72681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72678 ?auto_72679 ) ) ( not ( = ?auto_72678 ?auto_72684 ) ) ( not ( = ?auto_72679 ?auto_72684 ) ) ( ON ?auto_72678 ?auto_72683 ) ( not ( = ?auto_72678 ?auto_72683 ) ) ( not ( = ?auto_72679 ?auto_72683 ) ) ( not ( = ?auto_72684 ?auto_72683 ) ) ( not ( = ?auto_72682 ?auto_72680 ) ) ( not ( = ?auto_72682 ?auto_72685 ) ) ( not ( = ?auto_72682 ?auto_72681 ) ) ( not ( = ?auto_72682 ?auto_72684 ) ) ( not ( = ?auto_72682 ?auto_72679 ) ) ( not ( = ?auto_72680 ?auto_72685 ) ) ( not ( = ?auto_72680 ?auto_72681 ) ) ( not ( = ?auto_72680 ?auto_72684 ) ) ( not ( = ?auto_72680 ?auto_72679 ) ) ( not ( = ?auto_72685 ?auto_72681 ) ) ( not ( = ?auto_72685 ?auto_72684 ) ) ( not ( = ?auto_72685 ?auto_72679 ) ) ( not ( = ?auto_72681 ?auto_72684 ) ) ( not ( = ?auto_72681 ?auto_72679 ) ) ( not ( = ?auto_72678 ?auto_72682 ) ) ( not ( = ?auto_72678 ?auto_72680 ) ) ( not ( = ?auto_72678 ?auto_72685 ) ) ( not ( = ?auto_72678 ?auto_72681 ) ) ( not ( = ?auto_72683 ?auto_72682 ) ) ( not ( = ?auto_72683 ?auto_72680 ) ) ( not ( = ?auto_72683 ?auto_72685 ) ) ( not ( = ?auto_72683 ?auto_72681 ) ) ( ON ?auto_72679 ?auto_72678 ) ( ON-TABLE ?auto_72683 ) ( ON ?auto_72684 ?auto_72679 ) ( ON ?auto_72681 ?auto_72684 ) ( ON ?auto_72685 ?auto_72681 ) ( ON ?auto_72680 ?auto_72685 ) ( ON ?auto_72682 ?auto_72680 ) ( CLEAR ?auto_72682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_72683 ?auto_72678 ?auto_72679 ?auto_72684 ?auto_72681 ?auto_72685 ?auto_72680 )
      ( MAKE-2PILE ?auto_72678 ?auto_72679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_72709 - BLOCK
      ?auto_72710 - BLOCK
      ?auto_72711 - BLOCK
      ?auto_72712 - BLOCK
    )
    :vars
    (
      ?auto_72713 - BLOCK
      ?auto_72715 - BLOCK
      ?auto_72714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72713 ?auto_72712 ) ( ON-TABLE ?auto_72709 ) ( ON ?auto_72710 ?auto_72709 ) ( ON ?auto_72711 ?auto_72710 ) ( ON ?auto_72712 ?auto_72711 ) ( not ( = ?auto_72709 ?auto_72710 ) ) ( not ( = ?auto_72709 ?auto_72711 ) ) ( not ( = ?auto_72709 ?auto_72712 ) ) ( not ( = ?auto_72709 ?auto_72713 ) ) ( not ( = ?auto_72710 ?auto_72711 ) ) ( not ( = ?auto_72710 ?auto_72712 ) ) ( not ( = ?auto_72710 ?auto_72713 ) ) ( not ( = ?auto_72711 ?auto_72712 ) ) ( not ( = ?auto_72711 ?auto_72713 ) ) ( not ( = ?auto_72712 ?auto_72713 ) ) ( not ( = ?auto_72709 ?auto_72715 ) ) ( not ( = ?auto_72709 ?auto_72714 ) ) ( not ( = ?auto_72710 ?auto_72715 ) ) ( not ( = ?auto_72710 ?auto_72714 ) ) ( not ( = ?auto_72711 ?auto_72715 ) ) ( not ( = ?auto_72711 ?auto_72714 ) ) ( not ( = ?auto_72712 ?auto_72715 ) ) ( not ( = ?auto_72712 ?auto_72714 ) ) ( not ( = ?auto_72713 ?auto_72715 ) ) ( not ( = ?auto_72713 ?auto_72714 ) ) ( not ( = ?auto_72715 ?auto_72714 ) ) ( ON ?auto_72715 ?auto_72713 ) ( CLEAR ?auto_72715 ) ( HOLDING ?auto_72714 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72714 )
      ( MAKE-4PILE ?auto_72709 ?auto_72710 ?auto_72711 ?auto_72712 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72796 - BLOCK
      ?auto_72797 - BLOCK
      ?auto_72798 - BLOCK
    )
    :vars
    (
      ?auto_72799 - BLOCK
      ?auto_72801 - BLOCK
      ?auto_72800 - BLOCK
      ?auto_72802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_72796 ) ( not ( = ?auto_72796 ?auto_72797 ) ) ( not ( = ?auto_72796 ?auto_72798 ) ) ( not ( = ?auto_72797 ?auto_72798 ) ) ( ON ?auto_72798 ?auto_72799 ) ( not ( = ?auto_72796 ?auto_72799 ) ) ( not ( = ?auto_72797 ?auto_72799 ) ) ( not ( = ?auto_72798 ?auto_72799 ) ) ( CLEAR ?auto_72796 ) ( ON ?auto_72797 ?auto_72798 ) ( CLEAR ?auto_72797 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72801 ) ( ON ?auto_72800 ?auto_72801 ) ( ON ?auto_72802 ?auto_72800 ) ( ON ?auto_72799 ?auto_72802 ) ( not ( = ?auto_72801 ?auto_72800 ) ) ( not ( = ?auto_72801 ?auto_72802 ) ) ( not ( = ?auto_72801 ?auto_72799 ) ) ( not ( = ?auto_72801 ?auto_72798 ) ) ( not ( = ?auto_72801 ?auto_72797 ) ) ( not ( = ?auto_72800 ?auto_72802 ) ) ( not ( = ?auto_72800 ?auto_72799 ) ) ( not ( = ?auto_72800 ?auto_72798 ) ) ( not ( = ?auto_72800 ?auto_72797 ) ) ( not ( = ?auto_72802 ?auto_72799 ) ) ( not ( = ?auto_72802 ?auto_72798 ) ) ( not ( = ?auto_72802 ?auto_72797 ) ) ( not ( = ?auto_72796 ?auto_72801 ) ) ( not ( = ?auto_72796 ?auto_72800 ) ) ( not ( = ?auto_72796 ?auto_72802 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72801 ?auto_72800 ?auto_72802 ?auto_72799 ?auto_72798 )
      ( MAKE-3PILE ?auto_72796 ?auto_72797 ?auto_72798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72803 - BLOCK
      ?auto_72804 - BLOCK
      ?auto_72805 - BLOCK
    )
    :vars
    (
      ?auto_72809 - BLOCK
      ?auto_72807 - BLOCK
      ?auto_72808 - BLOCK
      ?auto_72806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72803 ?auto_72804 ) ) ( not ( = ?auto_72803 ?auto_72805 ) ) ( not ( = ?auto_72804 ?auto_72805 ) ) ( ON ?auto_72805 ?auto_72809 ) ( not ( = ?auto_72803 ?auto_72809 ) ) ( not ( = ?auto_72804 ?auto_72809 ) ) ( not ( = ?auto_72805 ?auto_72809 ) ) ( ON ?auto_72804 ?auto_72805 ) ( CLEAR ?auto_72804 ) ( ON-TABLE ?auto_72807 ) ( ON ?auto_72808 ?auto_72807 ) ( ON ?auto_72806 ?auto_72808 ) ( ON ?auto_72809 ?auto_72806 ) ( not ( = ?auto_72807 ?auto_72808 ) ) ( not ( = ?auto_72807 ?auto_72806 ) ) ( not ( = ?auto_72807 ?auto_72809 ) ) ( not ( = ?auto_72807 ?auto_72805 ) ) ( not ( = ?auto_72807 ?auto_72804 ) ) ( not ( = ?auto_72808 ?auto_72806 ) ) ( not ( = ?auto_72808 ?auto_72809 ) ) ( not ( = ?auto_72808 ?auto_72805 ) ) ( not ( = ?auto_72808 ?auto_72804 ) ) ( not ( = ?auto_72806 ?auto_72809 ) ) ( not ( = ?auto_72806 ?auto_72805 ) ) ( not ( = ?auto_72806 ?auto_72804 ) ) ( not ( = ?auto_72803 ?auto_72807 ) ) ( not ( = ?auto_72803 ?auto_72808 ) ) ( not ( = ?auto_72803 ?auto_72806 ) ) ( HOLDING ?auto_72803 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72803 )
      ( MAKE-3PILE ?auto_72803 ?auto_72804 ?auto_72805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72810 - BLOCK
      ?auto_72811 - BLOCK
      ?auto_72812 - BLOCK
    )
    :vars
    (
      ?auto_72814 - BLOCK
      ?auto_72813 - BLOCK
      ?auto_72816 - BLOCK
      ?auto_72815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72810 ?auto_72811 ) ) ( not ( = ?auto_72810 ?auto_72812 ) ) ( not ( = ?auto_72811 ?auto_72812 ) ) ( ON ?auto_72812 ?auto_72814 ) ( not ( = ?auto_72810 ?auto_72814 ) ) ( not ( = ?auto_72811 ?auto_72814 ) ) ( not ( = ?auto_72812 ?auto_72814 ) ) ( ON ?auto_72811 ?auto_72812 ) ( ON-TABLE ?auto_72813 ) ( ON ?auto_72816 ?auto_72813 ) ( ON ?auto_72815 ?auto_72816 ) ( ON ?auto_72814 ?auto_72815 ) ( not ( = ?auto_72813 ?auto_72816 ) ) ( not ( = ?auto_72813 ?auto_72815 ) ) ( not ( = ?auto_72813 ?auto_72814 ) ) ( not ( = ?auto_72813 ?auto_72812 ) ) ( not ( = ?auto_72813 ?auto_72811 ) ) ( not ( = ?auto_72816 ?auto_72815 ) ) ( not ( = ?auto_72816 ?auto_72814 ) ) ( not ( = ?auto_72816 ?auto_72812 ) ) ( not ( = ?auto_72816 ?auto_72811 ) ) ( not ( = ?auto_72815 ?auto_72814 ) ) ( not ( = ?auto_72815 ?auto_72812 ) ) ( not ( = ?auto_72815 ?auto_72811 ) ) ( not ( = ?auto_72810 ?auto_72813 ) ) ( not ( = ?auto_72810 ?auto_72816 ) ) ( not ( = ?auto_72810 ?auto_72815 ) ) ( ON ?auto_72810 ?auto_72811 ) ( CLEAR ?auto_72810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72813 ?auto_72816 ?auto_72815 ?auto_72814 ?auto_72812 ?auto_72811 )
      ( MAKE-3PILE ?auto_72810 ?auto_72811 ?auto_72812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72820 - BLOCK
      ?auto_72821 - BLOCK
      ?auto_72822 - BLOCK
    )
    :vars
    (
      ?auto_72826 - BLOCK
      ?auto_72825 - BLOCK
      ?auto_72824 - BLOCK
      ?auto_72823 - BLOCK
      ?auto_72827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72820 ?auto_72821 ) ) ( not ( = ?auto_72820 ?auto_72822 ) ) ( not ( = ?auto_72821 ?auto_72822 ) ) ( ON ?auto_72822 ?auto_72826 ) ( not ( = ?auto_72820 ?auto_72826 ) ) ( not ( = ?auto_72821 ?auto_72826 ) ) ( not ( = ?auto_72822 ?auto_72826 ) ) ( ON ?auto_72821 ?auto_72822 ) ( CLEAR ?auto_72821 ) ( ON-TABLE ?auto_72825 ) ( ON ?auto_72824 ?auto_72825 ) ( ON ?auto_72823 ?auto_72824 ) ( ON ?auto_72826 ?auto_72823 ) ( not ( = ?auto_72825 ?auto_72824 ) ) ( not ( = ?auto_72825 ?auto_72823 ) ) ( not ( = ?auto_72825 ?auto_72826 ) ) ( not ( = ?auto_72825 ?auto_72822 ) ) ( not ( = ?auto_72825 ?auto_72821 ) ) ( not ( = ?auto_72824 ?auto_72823 ) ) ( not ( = ?auto_72824 ?auto_72826 ) ) ( not ( = ?auto_72824 ?auto_72822 ) ) ( not ( = ?auto_72824 ?auto_72821 ) ) ( not ( = ?auto_72823 ?auto_72826 ) ) ( not ( = ?auto_72823 ?auto_72822 ) ) ( not ( = ?auto_72823 ?auto_72821 ) ) ( not ( = ?auto_72820 ?auto_72825 ) ) ( not ( = ?auto_72820 ?auto_72824 ) ) ( not ( = ?auto_72820 ?auto_72823 ) ) ( ON ?auto_72820 ?auto_72827 ) ( CLEAR ?auto_72820 ) ( HAND-EMPTY ) ( not ( = ?auto_72820 ?auto_72827 ) ) ( not ( = ?auto_72821 ?auto_72827 ) ) ( not ( = ?auto_72822 ?auto_72827 ) ) ( not ( = ?auto_72826 ?auto_72827 ) ) ( not ( = ?auto_72825 ?auto_72827 ) ) ( not ( = ?auto_72824 ?auto_72827 ) ) ( not ( = ?auto_72823 ?auto_72827 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72820 ?auto_72827 )
      ( MAKE-3PILE ?auto_72820 ?auto_72821 ?auto_72822 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72828 - BLOCK
      ?auto_72829 - BLOCK
      ?auto_72830 - BLOCK
    )
    :vars
    (
      ?auto_72831 - BLOCK
      ?auto_72834 - BLOCK
      ?auto_72832 - BLOCK
      ?auto_72833 - BLOCK
      ?auto_72835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72828 ?auto_72829 ) ) ( not ( = ?auto_72828 ?auto_72830 ) ) ( not ( = ?auto_72829 ?auto_72830 ) ) ( ON ?auto_72830 ?auto_72831 ) ( not ( = ?auto_72828 ?auto_72831 ) ) ( not ( = ?auto_72829 ?auto_72831 ) ) ( not ( = ?auto_72830 ?auto_72831 ) ) ( ON-TABLE ?auto_72834 ) ( ON ?auto_72832 ?auto_72834 ) ( ON ?auto_72833 ?auto_72832 ) ( ON ?auto_72831 ?auto_72833 ) ( not ( = ?auto_72834 ?auto_72832 ) ) ( not ( = ?auto_72834 ?auto_72833 ) ) ( not ( = ?auto_72834 ?auto_72831 ) ) ( not ( = ?auto_72834 ?auto_72830 ) ) ( not ( = ?auto_72834 ?auto_72829 ) ) ( not ( = ?auto_72832 ?auto_72833 ) ) ( not ( = ?auto_72832 ?auto_72831 ) ) ( not ( = ?auto_72832 ?auto_72830 ) ) ( not ( = ?auto_72832 ?auto_72829 ) ) ( not ( = ?auto_72833 ?auto_72831 ) ) ( not ( = ?auto_72833 ?auto_72830 ) ) ( not ( = ?auto_72833 ?auto_72829 ) ) ( not ( = ?auto_72828 ?auto_72834 ) ) ( not ( = ?auto_72828 ?auto_72832 ) ) ( not ( = ?auto_72828 ?auto_72833 ) ) ( ON ?auto_72828 ?auto_72835 ) ( CLEAR ?auto_72828 ) ( not ( = ?auto_72828 ?auto_72835 ) ) ( not ( = ?auto_72829 ?auto_72835 ) ) ( not ( = ?auto_72830 ?auto_72835 ) ) ( not ( = ?auto_72831 ?auto_72835 ) ) ( not ( = ?auto_72834 ?auto_72835 ) ) ( not ( = ?auto_72832 ?auto_72835 ) ) ( not ( = ?auto_72833 ?auto_72835 ) ) ( HOLDING ?auto_72829 ) ( CLEAR ?auto_72830 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72834 ?auto_72832 ?auto_72833 ?auto_72831 ?auto_72830 ?auto_72829 )
      ( MAKE-3PILE ?auto_72828 ?auto_72829 ?auto_72830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72836 - BLOCK
      ?auto_72837 - BLOCK
      ?auto_72838 - BLOCK
    )
    :vars
    (
      ?auto_72843 - BLOCK
      ?auto_72839 - BLOCK
      ?auto_72840 - BLOCK
      ?auto_72842 - BLOCK
      ?auto_72841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72836 ?auto_72837 ) ) ( not ( = ?auto_72836 ?auto_72838 ) ) ( not ( = ?auto_72837 ?auto_72838 ) ) ( ON ?auto_72838 ?auto_72843 ) ( not ( = ?auto_72836 ?auto_72843 ) ) ( not ( = ?auto_72837 ?auto_72843 ) ) ( not ( = ?auto_72838 ?auto_72843 ) ) ( ON-TABLE ?auto_72839 ) ( ON ?auto_72840 ?auto_72839 ) ( ON ?auto_72842 ?auto_72840 ) ( ON ?auto_72843 ?auto_72842 ) ( not ( = ?auto_72839 ?auto_72840 ) ) ( not ( = ?auto_72839 ?auto_72842 ) ) ( not ( = ?auto_72839 ?auto_72843 ) ) ( not ( = ?auto_72839 ?auto_72838 ) ) ( not ( = ?auto_72839 ?auto_72837 ) ) ( not ( = ?auto_72840 ?auto_72842 ) ) ( not ( = ?auto_72840 ?auto_72843 ) ) ( not ( = ?auto_72840 ?auto_72838 ) ) ( not ( = ?auto_72840 ?auto_72837 ) ) ( not ( = ?auto_72842 ?auto_72843 ) ) ( not ( = ?auto_72842 ?auto_72838 ) ) ( not ( = ?auto_72842 ?auto_72837 ) ) ( not ( = ?auto_72836 ?auto_72839 ) ) ( not ( = ?auto_72836 ?auto_72840 ) ) ( not ( = ?auto_72836 ?auto_72842 ) ) ( ON ?auto_72836 ?auto_72841 ) ( not ( = ?auto_72836 ?auto_72841 ) ) ( not ( = ?auto_72837 ?auto_72841 ) ) ( not ( = ?auto_72838 ?auto_72841 ) ) ( not ( = ?auto_72843 ?auto_72841 ) ) ( not ( = ?auto_72839 ?auto_72841 ) ) ( not ( = ?auto_72840 ?auto_72841 ) ) ( not ( = ?auto_72842 ?auto_72841 ) ) ( CLEAR ?auto_72838 ) ( ON ?auto_72837 ?auto_72836 ) ( CLEAR ?auto_72837 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_72841 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72841 ?auto_72836 )
      ( MAKE-3PILE ?auto_72836 ?auto_72837 ?auto_72838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72844 - BLOCK
      ?auto_72845 - BLOCK
      ?auto_72846 - BLOCK
    )
    :vars
    (
      ?auto_72847 - BLOCK
      ?auto_72851 - BLOCK
      ?auto_72850 - BLOCK
      ?auto_72849 - BLOCK
      ?auto_72848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72844 ?auto_72845 ) ) ( not ( = ?auto_72844 ?auto_72846 ) ) ( not ( = ?auto_72845 ?auto_72846 ) ) ( not ( = ?auto_72844 ?auto_72847 ) ) ( not ( = ?auto_72845 ?auto_72847 ) ) ( not ( = ?auto_72846 ?auto_72847 ) ) ( ON-TABLE ?auto_72851 ) ( ON ?auto_72850 ?auto_72851 ) ( ON ?auto_72849 ?auto_72850 ) ( ON ?auto_72847 ?auto_72849 ) ( not ( = ?auto_72851 ?auto_72850 ) ) ( not ( = ?auto_72851 ?auto_72849 ) ) ( not ( = ?auto_72851 ?auto_72847 ) ) ( not ( = ?auto_72851 ?auto_72846 ) ) ( not ( = ?auto_72851 ?auto_72845 ) ) ( not ( = ?auto_72850 ?auto_72849 ) ) ( not ( = ?auto_72850 ?auto_72847 ) ) ( not ( = ?auto_72850 ?auto_72846 ) ) ( not ( = ?auto_72850 ?auto_72845 ) ) ( not ( = ?auto_72849 ?auto_72847 ) ) ( not ( = ?auto_72849 ?auto_72846 ) ) ( not ( = ?auto_72849 ?auto_72845 ) ) ( not ( = ?auto_72844 ?auto_72851 ) ) ( not ( = ?auto_72844 ?auto_72850 ) ) ( not ( = ?auto_72844 ?auto_72849 ) ) ( ON ?auto_72844 ?auto_72848 ) ( not ( = ?auto_72844 ?auto_72848 ) ) ( not ( = ?auto_72845 ?auto_72848 ) ) ( not ( = ?auto_72846 ?auto_72848 ) ) ( not ( = ?auto_72847 ?auto_72848 ) ) ( not ( = ?auto_72851 ?auto_72848 ) ) ( not ( = ?auto_72850 ?auto_72848 ) ) ( not ( = ?auto_72849 ?auto_72848 ) ) ( ON ?auto_72845 ?auto_72844 ) ( CLEAR ?auto_72845 ) ( ON-TABLE ?auto_72848 ) ( HOLDING ?auto_72846 ) ( CLEAR ?auto_72847 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72851 ?auto_72850 ?auto_72849 ?auto_72847 ?auto_72846 )
      ( MAKE-3PILE ?auto_72844 ?auto_72845 ?auto_72846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72852 - BLOCK
      ?auto_72853 - BLOCK
      ?auto_72854 - BLOCK
    )
    :vars
    (
      ?auto_72855 - BLOCK
      ?auto_72859 - BLOCK
      ?auto_72857 - BLOCK
      ?auto_72858 - BLOCK
      ?auto_72856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72852 ?auto_72853 ) ) ( not ( = ?auto_72852 ?auto_72854 ) ) ( not ( = ?auto_72853 ?auto_72854 ) ) ( not ( = ?auto_72852 ?auto_72855 ) ) ( not ( = ?auto_72853 ?auto_72855 ) ) ( not ( = ?auto_72854 ?auto_72855 ) ) ( ON-TABLE ?auto_72859 ) ( ON ?auto_72857 ?auto_72859 ) ( ON ?auto_72858 ?auto_72857 ) ( ON ?auto_72855 ?auto_72858 ) ( not ( = ?auto_72859 ?auto_72857 ) ) ( not ( = ?auto_72859 ?auto_72858 ) ) ( not ( = ?auto_72859 ?auto_72855 ) ) ( not ( = ?auto_72859 ?auto_72854 ) ) ( not ( = ?auto_72859 ?auto_72853 ) ) ( not ( = ?auto_72857 ?auto_72858 ) ) ( not ( = ?auto_72857 ?auto_72855 ) ) ( not ( = ?auto_72857 ?auto_72854 ) ) ( not ( = ?auto_72857 ?auto_72853 ) ) ( not ( = ?auto_72858 ?auto_72855 ) ) ( not ( = ?auto_72858 ?auto_72854 ) ) ( not ( = ?auto_72858 ?auto_72853 ) ) ( not ( = ?auto_72852 ?auto_72859 ) ) ( not ( = ?auto_72852 ?auto_72857 ) ) ( not ( = ?auto_72852 ?auto_72858 ) ) ( ON ?auto_72852 ?auto_72856 ) ( not ( = ?auto_72852 ?auto_72856 ) ) ( not ( = ?auto_72853 ?auto_72856 ) ) ( not ( = ?auto_72854 ?auto_72856 ) ) ( not ( = ?auto_72855 ?auto_72856 ) ) ( not ( = ?auto_72859 ?auto_72856 ) ) ( not ( = ?auto_72857 ?auto_72856 ) ) ( not ( = ?auto_72858 ?auto_72856 ) ) ( ON ?auto_72853 ?auto_72852 ) ( ON-TABLE ?auto_72856 ) ( CLEAR ?auto_72855 ) ( ON ?auto_72854 ?auto_72853 ) ( CLEAR ?auto_72854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72856 ?auto_72852 ?auto_72853 )
      ( MAKE-3PILE ?auto_72852 ?auto_72853 ?auto_72854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72860 - BLOCK
      ?auto_72861 - BLOCK
      ?auto_72862 - BLOCK
    )
    :vars
    (
      ?auto_72864 - BLOCK
      ?auto_72867 - BLOCK
      ?auto_72863 - BLOCK
      ?auto_72866 - BLOCK
      ?auto_72865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72860 ?auto_72861 ) ) ( not ( = ?auto_72860 ?auto_72862 ) ) ( not ( = ?auto_72861 ?auto_72862 ) ) ( not ( = ?auto_72860 ?auto_72864 ) ) ( not ( = ?auto_72861 ?auto_72864 ) ) ( not ( = ?auto_72862 ?auto_72864 ) ) ( ON-TABLE ?auto_72867 ) ( ON ?auto_72863 ?auto_72867 ) ( ON ?auto_72866 ?auto_72863 ) ( not ( = ?auto_72867 ?auto_72863 ) ) ( not ( = ?auto_72867 ?auto_72866 ) ) ( not ( = ?auto_72867 ?auto_72864 ) ) ( not ( = ?auto_72867 ?auto_72862 ) ) ( not ( = ?auto_72867 ?auto_72861 ) ) ( not ( = ?auto_72863 ?auto_72866 ) ) ( not ( = ?auto_72863 ?auto_72864 ) ) ( not ( = ?auto_72863 ?auto_72862 ) ) ( not ( = ?auto_72863 ?auto_72861 ) ) ( not ( = ?auto_72866 ?auto_72864 ) ) ( not ( = ?auto_72866 ?auto_72862 ) ) ( not ( = ?auto_72866 ?auto_72861 ) ) ( not ( = ?auto_72860 ?auto_72867 ) ) ( not ( = ?auto_72860 ?auto_72863 ) ) ( not ( = ?auto_72860 ?auto_72866 ) ) ( ON ?auto_72860 ?auto_72865 ) ( not ( = ?auto_72860 ?auto_72865 ) ) ( not ( = ?auto_72861 ?auto_72865 ) ) ( not ( = ?auto_72862 ?auto_72865 ) ) ( not ( = ?auto_72864 ?auto_72865 ) ) ( not ( = ?auto_72867 ?auto_72865 ) ) ( not ( = ?auto_72863 ?auto_72865 ) ) ( not ( = ?auto_72866 ?auto_72865 ) ) ( ON ?auto_72861 ?auto_72860 ) ( ON-TABLE ?auto_72865 ) ( ON ?auto_72862 ?auto_72861 ) ( CLEAR ?auto_72862 ) ( HOLDING ?auto_72864 ) ( CLEAR ?auto_72866 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72867 ?auto_72863 ?auto_72866 ?auto_72864 )
      ( MAKE-3PILE ?auto_72860 ?auto_72861 ?auto_72862 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72868 - BLOCK
      ?auto_72869 - BLOCK
      ?auto_72870 - BLOCK
    )
    :vars
    (
      ?auto_72875 - BLOCK
      ?auto_72874 - BLOCK
      ?auto_72872 - BLOCK
      ?auto_72873 - BLOCK
      ?auto_72871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72868 ?auto_72869 ) ) ( not ( = ?auto_72868 ?auto_72870 ) ) ( not ( = ?auto_72869 ?auto_72870 ) ) ( not ( = ?auto_72868 ?auto_72875 ) ) ( not ( = ?auto_72869 ?auto_72875 ) ) ( not ( = ?auto_72870 ?auto_72875 ) ) ( ON-TABLE ?auto_72874 ) ( ON ?auto_72872 ?auto_72874 ) ( ON ?auto_72873 ?auto_72872 ) ( not ( = ?auto_72874 ?auto_72872 ) ) ( not ( = ?auto_72874 ?auto_72873 ) ) ( not ( = ?auto_72874 ?auto_72875 ) ) ( not ( = ?auto_72874 ?auto_72870 ) ) ( not ( = ?auto_72874 ?auto_72869 ) ) ( not ( = ?auto_72872 ?auto_72873 ) ) ( not ( = ?auto_72872 ?auto_72875 ) ) ( not ( = ?auto_72872 ?auto_72870 ) ) ( not ( = ?auto_72872 ?auto_72869 ) ) ( not ( = ?auto_72873 ?auto_72875 ) ) ( not ( = ?auto_72873 ?auto_72870 ) ) ( not ( = ?auto_72873 ?auto_72869 ) ) ( not ( = ?auto_72868 ?auto_72874 ) ) ( not ( = ?auto_72868 ?auto_72872 ) ) ( not ( = ?auto_72868 ?auto_72873 ) ) ( ON ?auto_72868 ?auto_72871 ) ( not ( = ?auto_72868 ?auto_72871 ) ) ( not ( = ?auto_72869 ?auto_72871 ) ) ( not ( = ?auto_72870 ?auto_72871 ) ) ( not ( = ?auto_72875 ?auto_72871 ) ) ( not ( = ?auto_72874 ?auto_72871 ) ) ( not ( = ?auto_72872 ?auto_72871 ) ) ( not ( = ?auto_72873 ?auto_72871 ) ) ( ON ?auto_72869 ?auto_72868 ) ( ON-TABLE ?auto_72871 ) ( ON ?auto_72870 ?auto_72869 ) ( CLEAR ?auto_72873 ) ( ON ?auto_72875 ?auto_72870 ) ( CLEAR ?auto_72875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_72871 ?auto_72868 ?auto_72869 ?auto_72870 )
      ( MAKE-3PILE ?auto_72868 ?auto_72869 ?auto_72870 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72876 - BLOCK
      ?auto_72877 - BLOCK
      ?auto_72878 - BLOCK
    )
    :vars
    (
      ?auto_72880 - BLOCK
      ?auto_72881 - BLOCK
      ?auto_72879 - BLOCK
      ?auto_72883 - BLOCK
      ?auto_72882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72876 ?auto_72877 ) ) ( not ( = ?auto_72876 ?auto_72878 ) ) ( not ( = ?auto_72877 ?auto_72878 ) ) ( not ( = ?auto_72876 ?auto_72880 ) ) ( not ( = ?auto_72877 ?auto_72880 ) ) ( not ( = ?auto_72878 ?auto_72880 ) ) ( ON-TABLE ?auto_72881 ) ( ON ?auto_72879 ?auto_72881 ) ( not ( = ?auto_72881 ?auto_72879 ) ) ( not ( = ?auto_72881 ?auto_72883 ) ) ( not ( = ?auto_72881 ?auto_72880 ) ) ( not ( = ?auto_72881 ?auto_72878 ) ) ( not ( = ?auto_72881 ?auto_72877 ) ) ( not ( = ?auto_72879 ?auto_72883 ) ) ( not ( = ?auto_72879 ?auto_72880 ) ) ( not ( = ?auto_72879 ?auto_72878 ) ) ( not ( = ?auto_72879 ?auto_72877 ) ) ( not ( = ?auto_72883 ?auto_72880 ) ) ( not ( = ?auto_72883 ?auto_72878 ) ) ( not ( = ?auto_72883 ?auto_72877 ) ) ( not ( = ?auto_72876 ?auto_72881 ) ) ( not ( = ?auto_72876 ?auto_72879 ) ) ( not ( = ?auto_72876 ?auto_72883 ) ) ( ON ?auto_72876 ?auto_72882 ) ( not ( = ?auto_72876 ?auto_72882 ) ) ( not ( = ?auto_72877 ?auto_72882 ) ) ( not ( = ?auto_72878 ?auto_72882 ) ) ( not ( = ?auto_72880 ?auto_72882 ) ) ( not ( = ?auto_72881 ?auto_72882 ) ) ( not ( = ?auto_72879 ?auto_72882 ) ) ( not ( = ?auto_72883 ?auto_72882 ) ) ( ON ?auto_72877 ?auto_72876 ) ( ON-TABLE ?auto_72882 ) ( ON ?auto_72878 ?auto_72877 ) ( ON ?auto_72880 ?auto_72878 ) ( CLEAR ?auto_72880 ) ( HOLDING ?auto_72883 ) ( CLEAR ?auto_72879 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_72881 ?auto_72879 ?auto_72883 )
      ( MAKE-3PILE ?auto_72876 ?auto_72877 ?auto_72878 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72884 - BLOCK
      ?auto_72885 - BLOCK
      ?auto_72886 - BLOCK
    )
    :vars
    (
      ?auto_72889 - BLOCK
      ?auto_72888 - BLOCK
      ?auto_72887 - BLOCK
      ?auto_72890 - BLOCK
      ?auto_72891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72884 ?auto_72885 ) ) ( not ( = ?auto_72884 ?auto_72886 ) ) ( not ( = ?auto_72885 ?auto_72886 ) ) ( not ( = ?auto_72884 ?auto_72889 ) ) ( not ( = ?auto_72885 ?auto_72889 ) ) ( not ( = ?auto_72886 ?auto_72889 ) ) ( ON-TABLE ?auto_72888 ) ( ON ?auto_72887 ?auto_72888 ) ( not ( = ?auto_72888 ?auto_72887 ) ) ( not ( = ?auto_72888 ?auto_72890 ) ) ( not ( = ?auto_72888 ?auto_72889 ) ) ( not ( = ?auto_72888 ?auto_72886 ) ) ( not ( = ?auto_72888 ?auto_72885 ) ) ( not ( = ?auto_72887 ?auto_72890 ) ) ( not ( = ?auto_72887 ?auto_72889 ) ) ( not ( = ?auto_72887 ?auto_72886 ) ) ( not ( = ?auto_72887 ?auto_72885 ) ) ( not ( = ?auto_72890 ?auto_72889 ) ) ( not ( = ?auto_72890 ?auto_72886 ) ) ( not ( = ?auto_72890 ?auto_72885 ) ) ( not ( = ?auto_72884 ?auto_72888 ) ) ( not ( = ?auto_72884 ?auto_72887 ) ) ( not ( = ?auto_72884 ?auto_72890 ) ) ( ON ?auto_72884 ?auto_72891 ) ( not ( = ?auto_72884 ?auto_72891 ) ) ( not ( = ?auto_72885 ?auto_72891 ) ) ( not ( = ?auto_72886 ?auto_72891 ) ) ( not ( = ?auto_72889 ?auto_72891 ) ) ( not ( = ?auto_72888 ?auto_72891 ) ) ( not ( = ?auto_72887 ?auto_72891 ) ) ( not ( = ?auto_72890 ?auto_72891 ) ) ( ON ?auto_72885 ?auto_72884 ) ( ON-TABLE ?auto_72891 ) ( ON ?auto_72886 ?auto_72885 ) ( ON ?auto_72889 ?auto_72886 ) ( CLEAR ?auto_72887 ) ( ON ?auto_72890 ?auto_72889 ) ( CLEAR ?auto_72890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72891 ?auto_72884 ?auto_72885 ?auto_72886 ?auto_72889 )
      ( MAKE-3PILE ?auto_72884 ?auto_72885 ?auto_72886 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72892 - BLOCK
      ?auto_72893 - BLOCK
      ?auto_72894 - BLOCK
    )
    :vars
    (
      ?auto_72896 - BLOCK
      ?auto_72898 - BLOCK
      ?auto_72897 - BLOCK
      ?auto_72899 - BLOCK
      ?auto_72895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72892 ?auto_72893 ) ) ( not ( = ?auto_72892 ?auto_72894 ) ) ( not ( = ?auto_72893 ?auto_72894 ) ) ( not ( = ?auto_72892 ?auto_72896 ) ) ( not ( = ?auto_72893 ?auto_72896 ) ) ( not ( = ?auto_72894 ?auto_72896 ) ) ( ON-TABLE ?auto_72898 ) ( not ( = ?auto_72898 ?auto_72897 ) ) ( not ( = ?auto_72898 ?auto_72899 ) ) ( not ( = ?auto_72898 ?auto_72896 ) ) ( not ( = ?auto_72898 ?auto_72894 ) ) ( not ( = ?auto_72898 ?auto_72893 ) ) ( not ( = ?auto_72897 ?auto_72899 ) ) ( not ( = ?auto_72897 ?auto_72896 ) ) ( not ( = ?auto_72897 ?auto_72894 ) ) ( not ( = ?auto_72897 ?auto_72893 ) ) ( not ( = ?auto_72899 ?auto_72896 ) ) ( not ( = ?auto_72899 ?auto_72894 ) ) ( not ( = ?auto_72899 ?auto_72893 ) ) ( not ( = ?auto_72892 ?auto_72898 ) ) ( not ( = ?auto_72892 ?auto_72897 ) ) ( not ( = ?auto_72892 ?auto_72899 ) ) ( ON ?auto_72892 ?auto_72895 ) ( not ( = ?auto_72892 ?auto_72895 ) ) ( not ( = ?auto_72893 ?auto_72895 ) ) ( not ( = ?auto_72894 ?auto_72895 ) ) ( not ( = ?auto_72896 ?auto_72895 ) ) ( not ( = ?auto_72898 ?auto_72895 ) ) ( not ( = ?auto_72897 ?auto_72895 ) ) ( not ( = ?auto_72899 ?auto_72895 ) ) ( ON ?auto_72893 ?auto_72892 ) ( ON-TABLE ?auto_72895 ) ( ON ?auto_72894 ?auto_72893 ) ( ON ?auto_72896 ?auto_72894 ) ( ON ?auto_72899 ?auto_72896 ) ( CLEAR ?auto_72899 ) ( HOLDING ?auto_72897 ) ( CLEAR ?auto_72898 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72898 ?auto_72897 )
      ( MAKE-3PILE ?auto_72892 ?auto_72893 ?auto_72894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72900 - BLOCK
      ?auto_72901 - BLOCK
      ?auto_72902 - BLOCK
    )
    :vars
    (
      ?auto_72906 - BLOCK
      ?auto_72904 - BLOCK
      ?auto_72905 - BLOCK
      ?auto_72907 - BLOCK
      ?auto_72903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72900 ?auto_72901 ) ) ( not ( = ?auto_72900 ?auto_72902 ) ) ( not ( = ?auto_72901 ?auto_72902 ) ) ( not ( = ?auto_72900 ?auto_72906 ) ) ( not ( = ?auto_72901 ?auto_72906 ) ) ( not ( = ?auto_72902 ?auto_72906 ) ) ( ON-TABLE ?auto_72904 ) ( not ( = ?auto_72904 ?auto_72905 ) ) ( not ( = ?auto_72904 ?auto_72907 ) ) ( not ( = ?auto_72904 ?auto_72906 ) ) ( not ( = ?auto_72904 ?auto_72902 ) ) ( not ( = ?auto_72904 ?auto_72901 ) ) ( not ( = ?auto_72905 ?auto_72907 ) ) ( not ( = ?auto_72905 ?auto_72906 ) ) ( not ( = ?auto_72905 ?auto_72902 ) ) ( not ( = ?auto_72905 ?auto_72901 ) ) ( not ( = ?auto_72907 ?auto_72906 ) ) ( not ( = ?auto_72907 ?auto_72902 ) ) ( not ( = ?auto_72907 ?auto_72901 ) ) ( not ( = ?auto_72900 ?auto_72904 ) ) ( not ( = ?auto_72900 ?auto_72905 ) ) ( not ( = ?auto_72900 ?auto_72907 ) ) ( ON ?auto_72900 ?auto_72903 ) ( not ( = ?auto_72900 ?auto_72903 ) ) ( not ( = ?auto_72901 ?auto_72903 ) ) ( not ( = ?auto_72902 ?auto_72903 ) ) ( not ( = ?auto_72906 ?auto_72903 ) ) ( not ( = ?auto_72904 ?auto_72903 ) ) ( not ( = ?auto_72905 ?auto_72903 ) ) ( not ( = ?auto_72907 ?auto_72903 ) ) ( ON ?auto_72901 ?auto_72900 ) ( ON-TABLE ?auto_72903 ) ( ON ?auto_72902 ?auto_72901 ) ( ON ?auto_72906 ?auto_72902 ) ( ON ?auto_72907 ?auto_72906 ) ( CLEAR ?auto_72904 ) ( ON ?auto_72905 ?auto_72907 ) ( CLEAR ?auto_72905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72903 ?auto_72900 ?auto_72901 ?auto_72902 ?auto_72906 ?auto_72907 )
      ( MAKE-3PILE ?auto_72900 ?auto_72901 ?auto_72902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72908 - BLOCK
      ?auto_72909 - BLOCK
      ?auto_72910 - BLOCK
    )
    :vars
    (
      ?auto_72914 - BLOCK
      ?auto_72912 - BLOCK
      ?auto_72913 - BLOCK
      ?auto_72915 - BLOCK
      ?auto_72911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72908 ?auto_72909 ) ) ( not ( = ?auto_72908 ?auto_72910 ) ) ( not ( = ?auto_72909 ?auto_72910 ) ) ( not ( = ?auto_72908 ?auto_72914 ) ) ( not ( = ?auto_72909 ?auto_72914 ) ) ( not ( = ?auto_72910 ?auto_72914 ) ) ( not ( = ?auto_72912 ?auto_72913 ) ) ( not ( = ?auto_72912 ?auto_72915 ) ) ( not ( = ?auto_72912 ?auto_72914 ) ) ( not ( = ?auto_72912 ?auto_72910 ) ) ( not ( = ?auto_72912 ?auto_72909 ) ) ( not ( = ?auto_72913 ?auto_72915 ) ) ( not ( = ?auto_72913 ?auto_72914 ) ) ( not ( = ?auto_72913 ?auto_72910 ) ) ( not ( = ?auto_72913 ?auto_72909 ) ) ( not ( = ?auto_72915 ?auto_72914 ) ) ( not ( = ?auto_72915 ?auto_72910 ) ) ( not ( = ?auto_72915 ?auto_72909 ) ) ( not ( = ?auto_72908 ?auto_72912 ) ) ( not ( = ?auto_72908 ?auto_72913 ) ) ( not ( = ?auto_72908 ?auto_72915 ) ) ( ON ?auto_72908 ?auto_72911 ) ( not ( = ?auto_72908 ?auto_72911 ) ) ( not ( = ?auto_72909 ?auto_72911 ) ) ( not ( = ?auto_72910 ?auto_72911 ) ) ( not ( = ?auto_72914 ?auto_72911 ) ) ( not ( = ?auto_72912 ?auto_72911 ) ) ( not ( = ?auto_72913 ?auto_72911 ) ) ( not ( = ?auto_72915 ?auto_72911 ) ) ( ON ?auto_72909 ?auto_72908 ) ( ON-TABLE ?auto_72911 ) ( ON ?auto_72910 ?auto_72909 ) ( ON ?auto_72914 ?auto_72910 ) ( ON ?auto_72915 ?auto_72914 ) ( ON ?auto_72913 ?auto_72915 ) ( CLEAR ?auto_72913 ) ( HOLDING ?auto_72912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72912 )
      ( MAKE-3PILE ?auto_72908 ?auto_72909 ?auto_72910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72916 - BLOCK
      ?auto_72917 - BLOCK
      ?auto_72918 - BLOCK
    )
    :vars
    (
      ?auto_72921 - BLOCK
      ?auto_72923 - BLOCK
      ?auto_72919 - BLOCK
      ?auto_72920 - BLOCK
      ?auto_72922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72916 ?auto_72917 ) ) ( not ( = ?auto_72916 ?auto_72918 ) ) ( not ( = ?auto_72917 ?auto_72918 ) ) ( not ( = ?auto_72916 ?auto_72921 ) ) ( not ( = ?auto_72917 ?auto_72921 ) ) ( not ( = ?auto_72918 ?auto_72921 ) ) ( not ( = ?auto_72923 ?auto_72919 ) ) ( not ( = ?auto_72923 ?auto_72920 ) ) ( not ( = ?auto_72923 ?auto_72921 ) ) ( not ( = ?auto_72923 ?auto_72918 ) ) ( not ( = ?auto_72923 ?auto_72917 ) ) ( not ( = ?auto_72919 ?auto_72920 ) ) ( not ( = ?auto_72919 ?auto_72921 ) ) ( not ( = ?auto_72919 ?auto_72918 ) ) ( not ( = ?auto_72919 ?auto_72917 ) ) ( not ( = ?auto_72920 ?auto_72921 ) ) ( not ( = ?auto_72920 ?auto_72918 ) ) ( not ( = ?auto_72920 ?auto_72917 ) ) ( not ( = ?auto_72916 ?auto_72923 ) ) ( not ( = ?auto_72916 ?auto_72919 ) ) ( not ( = ?auto_72916 ?auto_72920 ) ) ( ON ?auto_72916 ?auto_72922 ) ( not ( = ?auto_72916 ?auto_72922 ) ) ( not ( = ?auto_72917 ?auto_72922 ) ) ( not ( = ?auto_72918 ?auto_72922 ) ) ( not ( = ?auto_72921 ?auto_72922 ) ) ( not ( = ?auto_72923 ?auto_72922 ) ) ( not ( = ?auto_72919 ?auto_72922 ) ) ( not ( = ?auto_72920 ?auto_72922 ) ) ( ON ?auto_72917 ?auto_72916 ) ( ON-TABLE ?auto_72922 ) ( ON ?auto_72918 ?auto_72917 ) ( ON ?auto_72921 ?auto_72918 ) ( ON ?auto_72920 ?auto_72921 ) ( ON ?auto_72919 ?auto_72920 ) ( ON ?auto_72923 ?auto_72919 ) ( CLEAR ?auto_72923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_72922 ?auto_72916 ?auto_72917 ?auto_72918 ?auto_72921 ?auto_72920 ?auto_72919 )
      ( MAKE-3PILE ?auto_72916 ?auto_72917 ?auto_72918 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72943 - BLOCK
      ?auto_72944 - BLOCK
      ?auto_72945 - BLOCK
    )
    :vars
    (
      ?auto_72947 - BLOCK
      ?auto_72946 - BLOCK
      ?auto_72948 - BLOCK
      ?auto_72949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72947 ?auto_72945 ) ( ON-TABLE ?auto_72943 ) ( ON ?auto_72944 ?auto_72943 ) ( ON ?auto_72945 ?auto_72944 ) ( not ( = ?auto_72943 ?auto_72944 ) ) ( not ( = ?auto_72943 ?auto_72945 ) ) ( not ( = ?auto_72943 ?auto_72947 ) ) ( not ( = ?auto_72944 ?auto_72945 ) ) ( not ( = ?auto_72944 ?auto_72947 ) ) ( not ( = ?auto_72945 ?auto_72947 ) ) ( not ( = ?auto_72943 ?auto_72946 ) ) ( not ( = ?auto_72943 ?auto_72948 ) ) ( not ( = ?auto_72944 ?auto_72946 ) ) ( not ( = ?auto_72944 ?auto_72948 ) ) ( not ( = ?auto_72945 ?auto_72946 ) ) ( not ( = ?auto_72945 ?auto_72948 ) ) ( not ( = ?auto_72947 ?auto_72946 ) ) ( not ( = ?auto_72947 ?auto_72948 ) ) ( not ( = ?auto_72946 ?auto_72948 ) ) ( ON ?auto_72946 ?auto_72947 ) ( CLEAR ?auto_72946 ) ( HOLDING ?auto_72948 ) ( CLEAR ?auto_72949 ) ( ON-TABLE ?auto_72949 ) ( not ( = ?auto_72949 ?auto_72948 ) ) ( not ( = ?auto_72943 ?auto_72949 ) ) ( not ( = ?auto_72944 ?auto_72949 ) ) ( not ( = ?auto_72945 ?auto_72949 ) ) ( not ( = ?auto_72947 ?auto_72949 ) ) ( not ( = ?auto_72946 ?auto_72949 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_72949 ?auto_72948 )
      ( MAKE-3PILE ?auto_72943 ?auto_72944 ?auto_72945 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72950 - BLOCK
      ?auto_72951 - BLOCK
      ?auto_72952 - BLOCK
    )
    :vars
    (
      ?auto_72956 - BLOCK
      ?auto_72954 - BLOCK
      ?auto_72955 - BLOCK
      ?auto_72953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72956 ?auto_72952 ) ( ON-TABLE ?auto_72950 ) ( ON ?auto_72951 ?auto_72950 ) ( ON ?auto_72952 ?auto_72951 ) ( not ( = ?auto_72950 ?auto_72951 ) ) ( not ( = ?auto_72950 ?auto_72952 ) ) ( not ( = ?auto_72950 ?auto_72956 ) ) ( not ( = ?auto_72951 ?auto_72952 ) ) ( not ( = ?auto_72951 ?auto_72956 ) ) ( not ( = ?auto_72952 ?auto_72956 ) ) ( not ( = ?auto_72950 ?auto_72954 ) ) ( not ( = ?auto_72950 ?auto_72955 ) ) ( not ( = ?auto_72951 ?auto_72954 ) ) ( not ( = ?auto_72951 ?auto_72955 ) ) ( not ( = ?auto_72952 ?auto_72954 ) ) ( not ( = ?auto_72952 ?auto_72955 ) ) ( not ( = ?auto_72956 ?auto_72954 ) ) ( not ( = ?auto_72956 ?auto_72955 ) ) ( not ( = ?auto_72954 ?auto_72955 ) ) ( ON ?auto_72954 ?auto_72956 ) ( CLEAR ?auto_72953 ) ( ON-TABLE ?auto_72953 ) ( not ( = ?auto_72953 ?auto_72955 ) ) ( not ( = ?auto_72950 ?auto_72953 ) ) ( not ( = ?auto_72951 ?auto_72953 ) ) ( not ( = ?auto_72952 ?auto_72953 ) ) ( not ( = ?auto_72956 ?auto_72953 ) ) ( not ( = ?auto_72954 ?auto_72953 ) ) ( ON ?auto_72955 ?auto_72954 ) ( CLEAR ?auto_72955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_72950 ?auto_72951 ?auto_72952 ?auto_72956 ?auto_72954 )
      ( MAKE-3PILE ?auto_72950 ?auto_72951 ?auto_72952 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72957 - BLOCK
      ?auto_72958 - BLOCK
      ?auto_72959 - BLOCK
    )
    :vars
    (
      ?auto_72961 - BLOCK
      ?auto_72962 - BLOCK
      ?auto_72963 - BLOCK
      ?auto_72960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72961 ?auto_72959 ) ( ON-TABLE ?auto_72957 ) ( ON ?auto_72958 ?auto_72957 ) ( ON ?auto_72959 ?auto_72958 ) ( not ( = ?auto_72957 ?auto_72958 ) ) ( not ( = ?auto_72957 ?auto_72959 ) ) ( not ( = ?auto_72957 ?auto_72961 ) ) ( not ( = ?auto_72958 ?auto_72959 ) ) ( not ( = ?auto_72958 ?auto_72961 ) ) ( not ( = ?auto_72959 ?auto_72961 ) ) ( not ( = ?auto_72957 ?auto_72962 ) ) ( not ( = ?auto_72957 ?auto_72963 ) ) ( not ( = ?auto_72958 ?auto_72962 ) ) ( not ( = ?auto_72958 ?auto_72963 ) ) ( not ( = ?auto_72959 ?auto_72962 ) ) ( not ( = ?auto_72959 ?auto_72963 ) ) ( not ( = ?auto_72961 ?auto_72962 ) ) ( not ( = ?auto_72961 ?auto_72963 ) ) ( not ( = ?auto_72962 ?auto_72963 ) ) ( ON ?auto_72962 ?auto_72961 ) ( not ( = ?auto_72960 ?auto_72963 ) ) ( not ( = ?auto_72957 ?auto_72960 ) ) ( not ( = ?auto_72958 ?auto_72960 ) ) ( not ( = ?auto_72959 ?auto_72960 ) ) ( not ( = ?auto_72961 ?auto_72960 ) ) ( not ( = ?auto_72962 ?auto_72960 ) ) ( ON ?auto_72963 ?auto_72962 ) ( CLEAR ?auto_72963 ) ( HOLDING ?auto_72960 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_72960 )
      ( MAKE-3PILE ?auto_72957 ?auto_72958 ?auto_72959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72974 - BLOCK
      ?auto_72975 - BLOCK
      ?auto_72976 - BLOCK
    )
    :vars
    (
      ?auto_72977 - BLOCK
      ?auto_72979 - BLOCK
      ?auto_72978 - BLOCK
      ?auto_72980 - BLOCK
      ?auto_72981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72977 ?auto_72976 ) ( ON-TABLE ?auto_72974 ) ( ON ?auto_72975 ?auto_72974 ) ( ON ?auto_72976 ?auto_72975 ) ( not ( = ?auto_72974 ?auto_72975 ) ) ( not ( = ?auto_72974 ?auto_72976 ) ) ( not ( = ?auto_72974 ?auto_72977 ) ) ( not ( = ?auto_72975 ?auto_72976 ) ) ( not ( = ?auto_72975 ?auto_72977 ) ) ( not ( = ?auto_72976 ?auto_72977 ) ) ( not ( = ?auto_72974 ?auto_72979 ) ) ( not ( = ?auto_72974 ?auto_72978 ) ) ( not ( = ?auto_72975 ?auto_72979 ) ) ( not ( = ?auto_72975 ?auto_72978 ) ) ( not ( = ?auto_72976 ?auto_72979 ) ) ( not ( = ?auto_72976 ?auto_72978 ) ) ( not ( = ?auto_72977 ?auto_72979 ) ) ( not ( = ?auto_72977 ?auto_72978 ) ) ( not ( = ?auto_72979 ?auto_72978 ) ) ( ON ?auto_72979 ?auto_72977 ) ( not ( = ?auto_72980 ?auto_72978 ) ) ( not ( = ?auto_72974 ?auto_72980 ) ) ( not ( = ?auto_72975 ?auto_72980 ) ) ( not ( = ?auto_72976 ?auto_72980 ) ) ( not ( = ?auto_72977 ?auto_72980 ) ) ( not ( = ?auto_72979 ?auto_72980 ) ) ( ON ?auto_72978 ?auto_72979 ) ( CLEAR ?auto_72978 ) ( ON ?auto_72980 ?auto_72981 ) ( CLEAR ?auto_72980 ) ( HAND-EMPTY ) ( not ( = ?auto_72974 ?auto_72981 ) ) ( not ( = ?auto_72975 ?auto_72981 ) ) ( not ( = ?auto_72976 ?auto_72981 ) ) ( not ( = ?auto_72977 ?auto_72981 ) ) ( not ( = ?auto_72979 ?auto_72981 ) ) ( not ( = ?auto_72978 ?auto_72981 ) ) ( not ( = ?auto_72980 ?auto_72981 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72980 ?auto_72981 )
      ( MAKE-3PILE ?auto_72974 ?auto_72975 ?auto_72976 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_72982 - BLOCK
      ?auto_72983 - BLOCK
      ?auto_72984 - BLOCK
    )
    :vars
    (
      ?auto_72989 - BLOCK
      ?auto_72986 - BLOCK
      ?auto_72987 - BLOCK
      ?auto_72988 - BLOCK
      ?auto_72985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_72989 ?auto_72984 ) ( ON-TABLE ?auto_72982 ) ( ON ?auto_72983 ?auto_72982 ) ( ON ?auto_72984 ?auto_72983 ) ( not ( = ?auto_72982 ?auto_72983 ) ) ( not ( = ?auto_72982 ?auto_72984 ) ) ( not ( = ?auto_72982 ?auto_72989 ) ) ( not ( = ?auto_72983 ?auto_72984 ) ) ( not ( = ?auto_72983 ?auto_72989 ) ) ( not ( = ?auto_72984 ?auto_72989 ) ) ( not ( = ?auto_72982 ?auto_72986 ) ) ( not ( = ?auto_72982 ?auto_72987 ) ) ( not ( = ?auto_72983 ?auto_72986 ) ) ( not ( = ?auto_72983 ?auto_72987 ) ) ( not ( = ?auto_72984 ?auto_72986 ) ) ( not ( = ?auto_72984 ?auto_72987 ) ) ( not ( = ?auto_72989 ?auto_72986 ) ) ( not ( = ?auto_72989 ?auto_72987 ) ) ( not ( = ?auto_72986 ?auto_72987 ) ) ( ON ?auto_72986 ?auto_72989 ) ( not ( = ?auto_72988 ?auto_72987 ) ) ( not ( = ?auto_72982 ?auto_72988 ) ) ( not ( = ?auto_72983 ?auto_72988 ) ) ( not ( = ?auto_72984 ?auto_72988 ) ) ( not ( = ?auto_72989 ?auto_72988 ) ) ( not ( = ?auto_72986 ?auto_72988 ) ) ( ON ?auto_72988 ?auto_72985 ) ( CLEAR ?auto_72988 ) ( not ( = ?auto_72982 ?auto_72985 ) ) ( not ( = ?auto_72983 ?auto_72985 ) ) ( not ( = ?auto_72984 ?auto_72985 ) ) ( not ( = ?auto_72989 ?auto_72985 ) ) ( not ( = ?auto_72986 ?auto_72985 ) ) ( not ( = ?auto_72987 ?auto_72985 ) ) ( not ( = ?auto_72988 ?auto_72985 ) ) ( HOLDING ?auto_72987 ) ( CLEAR ?auto_72986 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_72982 ?auto_72983 ?auto_72984 ?auto_72989 ?auto_72986 ?auto_72987 )
      ( MAKE-3PILE ?auto_72982 ?auto_72983 ?auto_72984 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73044 - BLOCK
      ?auto_73045 - BLOCK
      ?auto_73046 - BLOCK
      ?auto_73047 - BLOCK
    )
    :vars
    (
      ?auto_73048 - BLOCK
      ?auto_73050 - BLOCK
      ?auto_73049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73044 ) ( ON ?auto_73045 ?auto_73044 ) ( not ( = ?auto_73044 ?auto_73045 ) ) ( not ( = ?auto_73044 ?auto_73046 ) ) ( not ( = ?auto_73044 ?auto_73047 ) ) ( not ( = ?auto_73045 ?auto_73046 ) ) ( not ( = ?auto_73045 ?auto_73047 ) ) ( not ( = ?auto_73046 ?auto_73047 ) ) ( ON ?auto_73047 ?auto_73048 ) ( not ( = ?auto_73044 ?auto_73048 ) ) ( not ( = ?auto_73045 ?auto_73048 ) ) ( not ( = ?auto_73046 ?auto_73048 ) ) ( not ( = ?auto_73047 ?auto_73048 ) ) ( CLEAR ?auto_73045 ) ( ON ?auto_73046 ?auto_73047 ) ( CLEAR ?auto_73046 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73050 ) ( ON ?auto_73049 ?auto_73050 ) ( ON ?auto_73048 ?auto_73049 ) ( not ( = ?auto_73050 ?auto_73049 ) ) ( not ( = ?auto_73050 ?auto_73048 ) ) ( not ( = ?auto_73050 ?auto_73047 ) ) ( not ( = ?auto_73050 ?auto_73046 ) ) ( not ( = ?auto_73049 ?auto_73048 ) ) ( not ( = ?auto_73049 ?auto_73047 ) ) ( not ( = ?auto_73049 ?auto_73046 ) ) ( not ( = ?auto_73044 ?auto_73050 ) ) ( not ( = ?auto_73044 ?auto_73049 ) ) ( not ( = ?auto_73045 ?auto_73050 ) ) ( not ( = ?auto_73045 ?auto_73049 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73050 ?auto_73049 ?auto_73048 ?auto_73047 )
      ( MAKE-4PILE ?auto_73044 ?auto_73045 ?auto_73046 ?auto_73047 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73051 - BLOCK
      ?auto_73052 - BLOCK
      ?auto_73053 - BLOCK
      ?auto_73054 - BLOCK
    )
    :vars
    (
      ?auto_73056 - BLOCK
      ?auto_73055 - BLOCK
      ?auto_73057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73051 ) ( not ( = ?auto_73051 ?auto_73052 ) ) ( not ( = ?auto_73051 ?auto_73053 ) ) ( not ( = ?auto_73051 ?auto_73054 ) ) ( not ( = ?auto_73052 ?auto_73053 ) ) ( not ( = ?auto_73052 ?auto_73054 ) ) ( not ( = ?auto_73053 ?auto_73054 ) ) ( ON ?auto_73054 ?auto_73056 ) ( not ( = ?auto_73051 ?auto_73056 ) ) ( not ( = ?auto_73052 ?auto_73056 ) ) ( not ( = ?auto_73053 ?auto_73056 ) ) ( not ( = ?auto_73054 ?auto_73056 ) ) ( ON ?auto_73053 ?auto_73054 ) ( CLEAR ?auto_73053 ) ( ON-TABLE ?auto_73055 ) ( ON ?auto_73057 ?auto_73055 ) ( ON ?auto_73056 ?auto_73057 ) ( not ( = ?auto_73055 ?auto_73057 ) ) ( not ( = ?auto_73055 ?auto_73056 ) ) ( not ( = ?auto_73055 ?auto_73054 ) ) ( not ( = ?auto_73055 ?auto_73053 ) ) ( not ( = ?auto_73057 ?auto_73056 ) ) ( not ( = ?auto_73057 ?auto_73054 ) ) ( not ( = ?auto_73057 ?auto_73053 ) ) ( not ( = ?auto_73051 ?auto_73055 ) ) ( not ( = ?auto_73051 ?auto_73057 ) ) ( not ( = ?auto_73052 ?auto_73055 ) ) ( not ( = ?auto_73052 ?auto_73057 ) ) ( HOLDING ?auto_73052 ) ( CLEAR ?auto_73051 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73051 ?auto_73052 )
      ( MAKE-4PILE ?auto_73051 ?auto_73052 ?auto_73053 ?auto_73054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73058 - BLOCK
      ?auto_73059 - BLOCK
      ?auto_73060 - BLOCK
      ?auto_73061 - BLOCK
    )
    :vars
    (
      ?auto_73063 - BLOCK
      ?auto_73062 - BLOCK
      ?auto_73064 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73058 ) ( not ( = ?auto_73058 ?auto_73059 ) ) ( not ( = ?auto_73058 ?auto_73060 ) ) ( not ( = ?auto_73058 ?auto_73061 ) ) ( not ( = ?auto_73059 ?auto_73060 ) ) ( not ( = ?auto_73059 ?auto_73061 ) ) ( not ( = ?auto_73060 ?auto_73061 ) ) ( ON ?auto_73061 ?auto_73063 ) ( not ( = ?auto_73058 ?auto_73063 ) ) ( not ( = ?auto_73059 ?auto_73063 ) ) ( not ( = ?auto_73060 ?auto_73063 ) ) ( not ( = ?auto_73061 ?auto_73063 ) ) ( ON ?auto_73060 ?auto_73061 ) ( ON-TABLE ?auto_73062 ) ( ON ?auto_73064 ?auto_73062 ) ( ON ?auto_73063 ?auto_73064 ) ( not ( = ?auto_73062 ?auto_73064 ) ) ( not ( = ?auto_73062 ?auto_73063 ) ) ( not ( = ?auto_73062 ?auto_73061 ) ) ( not ( = ?auto_73062 ?auto_73060 ) ) ( not ( = ?auto_73064 ?auto_73063 ) ) ( not ( = ?auto_73064 ?auto_73061 ) ) ( not ( = ?auto_73064 ?auto_73060 ) ) ( not ( = ?auto_73058 ?auto_73062 ) ) ( not ( = ?auto_73058 ?auto_73064 ) ) ( not ( = ?auto_73059 ?auto_73062 ) ) ( not ( = ?auto_73059 ?auto_73064 ) ) ( CLEAR ?auto_73058 ) ( ON ?auto_73059 ?auto_73060 ) ( CLEAR ?auto_73059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73062 ?auto_73064 ?auto_73063 ?auto_73061 ?auto_73060 )
      ( MAKE-4PILE ?auto_73058 ?auto_73059 ?auto_73060 ?auto_73061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73065 - BLOCK
      ?auto_73066 - BLOCK
      ?auto_73067 - BLOCK
      ?auto_73068 - BLOCK
    )
    :vars
    (
      ?auto_73070 - BLOCK
      ?auto_73069 - BLOCK
      ?auto_73071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73065 ?auto_73066 ) ) ( not ( = ?auto_73065 ?auto_73067 ) ) ( not ( = ?auto_73065 ?auto_73068 ) ) ( not ( = ?auto_73066 ?auto_73067 ) ) ( not ( = ?auto_73066 ?auto_73068 ) ) ( not ( = ?auto_73067 ?auto_73068 ) ) ( ON ?auto_73068 ?auto_73070 ) ( not ( = ?auto_73065 ?auto_73070 ) ) ( not ( = ?auto_73066 ?auto_73070 ) ) ( not ( = ?auto_73067 ?auto_73070 ) ) ( not ( = ?auto_73068 ?auto_73070 ) ) ( ON ?auto_73067 ?auto_73068 ) ( ON-TABLE ?auto_73069 ) ( ON ?auto_73071 ?auto_73069 ) ( ON ?auto_73070 ?auto_73071 ) ( not ( = ?auto_73069 ?auto_73071 ) ) ( not ( = ?auto_73069 ?auto_73070 ) ) ( not ( = ?auto_73069 ?auto_73068 ) ) ( not ( = ?auto_73069 ?auto_73067 ) ) ( not ( = ?auto_73071 ?auto_73070 ) ) ( not ( = ?auto_73071 ?auto_73068 ) ) ( not ( = ?auto_73071 ?auto_73067 ) ) ( not ( = ?auto_73065 ?auto_73069 ) ) ( not ( = ?auto_73065 ?auto_73071 ) ) ( not ( = ?auto_73066 ?auto_73069 ) ) ( not ( = ?auto_73066 ?auto_73071 ) ) ( ON ?auto_73066 ?auto_73067 ) ( CLEAR ?auto_73066 ) ( HOLDING ?auto_73065 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73065 )
      ( MAKE-4PILE ?auto_73065 ?auto_73066 ?auto_73067 ?auto_73068 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73072 - BLOCK
      ?auto_73073 - BLOCK
      ?auto_73074 - BLOCK
      ?auto_73075 - BLOCK
    )
    :vars
    (
      ?auto_73077 - BLOCK
      ?auto_73078 - BLOCK
      ?auto_73076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73072 ?auto_73073 ) ) ( not ( = ?auto_73072 ?auto_73074 ) ) ( not ( = ?auto_73072 ?auto_73075 ) ) ( not ( = ?auto_73073 ?auto_73074 ) ) ( not ( = ?auto_73073 ?auto_73075 ) ) ( not ( = ?auto_73074 ?auto_73075 ) ) ( ON ?auto_73075 ?auto_73077 ) ( not ( = ?auto_73072 ?auto_73077 ) ) ( not ( = ?auto_73073 ?auto_73077 ) ) ( not ( = ?auto_73074 ?auto_73077 ) ) ( not ( = ?auto_73075 ?auto_73077 ) ) ( ON ?auto_73074 ?auto_73075 ) ( ON-TABLE ?auto_73078 ) ( ON ?auto_73076 ?auto_73078 ) ( ON ?auto_73077 ?auto_73076 ) ( not ( = ?auto_73078 ?auto_73076 ) ) ( not ( = ?auto_73078 ?auto_73077 ) ) ( not ( = ?auto_73078 ?auto_73075 ) ) ( not ( = ?auto_73078 ?auto_73074 ) ) ( not ( = ?auto_73076 ?auto_73077 ) ) ( not ( = ?auto_73076 ?auto_73075 ) ) ( not ( = ?auto_73076 ?auto_73074 ) ) ( not ( = ?auto_73072 ?auto_73078 ) ) ( not ( = ?auto_73072 ?auto_73076 ) ) ( not ( = ?auto_73073 ?auto_73078 ) ) ( not ( = ?auto_73073 ?auto_73076 ) ) ( ON ?auto_73073 ?auto_73074 ) ( ON ?auto_73072 ?auto_73073 ) ( CLEAR ?auto_73072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73078 ?auto_73076 ?auto_73077 ?auto_73075 ?auto_73074 ?auto_73073 )
      ( MAKE-4PILE ?auto_73072 ?auto_73073 ?auto_73074 ?auto_73075 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73083 - BLOCK
      ?auto_73084 - BLOCK
      ?auto_73085 - BLOCK
      ?auto_73086 - BLOCK
    )
    :vars
    (
      ?auto_73089 - BLOCK
      ?auto_73088 - BLOCK
      ?auto_73087 - BLOCK
      ?auto_73090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73083 ?auto_73084 ) ) ( not ( = ?auto_73083 ?auto_73085 ) ) ( not ( = ?auto_73083 ?auto_73086 ) ) ( not ( = ?auto_73084 ?auto_73085 ) ) ( not ( = ?auto_73084 ?auto_73086 ) ) ( not ( = ?auto_73085 ?auto_73086 ) ) ( ON ?auto_73086 ?auto_73089 ) ( not ( = ?auto_73083 ?auto_73089 ) ) ( not ( = ?auto_73084 ?auto_73089 ) ) ( not ( = ?auto_73085 ?auto_73089 ) ) ( not ( = ?auto_73086 ?auto_73089 ) ) ( ON ?auto_73085 ?auto_73086 ) ( ON-TABLE ?auto_73088 ) ( ON ?auto_73087 ?auto_73088 ) ( ON ?auto_73089 ?auto_73087 ) ( not ( = ?auto_73088 ?auto_73087 ) ) ( not ( = ?auto_73088 ?auto_73089 ) ) ( not ( = ?auto_73088 ?auto_73086 ) ) ( not ( = ?auto_73088 ?auto_73085 ) ) ( not ( = ?auto_73087 ?auto_73089 ) ) ( not ( = ?auto_73087 ?auto_73086 ) ) ( not ( = ?auto_73087 ?auto_73085 ) ) ( not ( = ?auto_73083 ?auto_73088 ) ) ( not ( = ?auto_73083 ?auto_73087 ) ) ( not ( = ?auto_73084 ?auto_73088 ) ) ( not ( = ?auto_73084 ?auto_73087 ) ) ( ON ?auto_73084 ?auto_73085 ) ( CLEAR ?auto_73084 ) ( ON ?auto_73083 ?auto_73090 ) ( CLEAR ?auto_73083 ) ( HAND-EMPTY ) ( not ( = ?auto_73083 ?auto_73090 ) ) ( not ( = ?auto_73084 ?auto_73090 ) ) ( not ( = ?auto_73085 ?auto_73090 ) ) ( not ( = ?auto_73086 ?auto_73090 ) ) ( not ( = ?auto_73089 ?auto_73090 ) ) ( not ( = ?auto_73088 ?auto_73090 ) ) ( not ( = ?auto_73087 ?auto_73090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73083 ?auto_73090 )
      ( MAKE-4PILE ?auto_73083 ?auto_73084 ?auto_73085 ?auto_73086 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73091 - BLOCK
      ?auto_73092 - BLOCK
      ?auto_73093 - BLOCK
      ?auto_73094 - BLOCK
    )
    :vars
    (
      ?auto_73097 - BLOCK
      ?auto_73098 - BLOCK
      ?auto_73096 - BLOCK
      ?auto_73095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73091 ?auto_73092 ) ) ( not ( = ?auto_73091 ?auto_73093 ) ) ( not ( = ?auto_73091 ?auto_73094 ) ) ( not ( = ?auto_73092 ?auto_73093 ) ) ( not ( = ?auto_73092 ?auto_73094 ) ) ( not ( = ?auto_73093 ?auto_73094 ) ) ( ON ?auto_73094 ?auto_73097 ) ( not ( = ?auto_73091 ?auto_73097 ) ) ( not ( = ?auto_73092 ?auto_73097 ) ) ( not ( = ?auto_73093 ?auto_73097 ) ) ( not ( = ?auto_73094 ?auto_73097 ) ) ( ON ?auto_73093 ?auto_73094 ) ( ON-TABLE ?auto_73098 ) ( ON ?auto_73096 ?auto_73098 ) ( ON ?auto_73097 ?auto_73096 ) ( not ( = ?auto_73098 ?auto_73096 ) ) ( not ( = ?auto_73098 ?auto_73097 ) ) ( not ( = ?auto_73098 ?auto_73094 ) ) ( not ( = ?auto_73098 ?auto_73093 ) ) ( not ( = ?auto_73096 ?auto_73097 ) ) ( not ( = ?auto_73096 ?auto_73094 ) ) ( not ( = ?auto_73096 ?auto_73093 ) ) ( not ( = ?auto_73091 ?auto_73098 ) ) ( not ( = ?auto_73091 ?auto_73096 ) ) ( not ( = ?auto_73092 ?auto_73098 ) ) ( not ( = ?auto_73092 ?auto_73096 ) ) ( ON ?auto_73091 ?auto_73095 ) ( CLEAR ?auto_73091 ) ( not ( = ?auto_73091 ?auto_73095 ) ) ( not ( = ?auto_73092 ?auto_73095 ) ) ( not ( = ?auto_73093 ?auto_73095 ) ) ( not ( = ?auto_73094 ?auto_73095 ) ) ( not ( = ?auto_73097 ?auto_73095 ) ) ( not ( = ?auto_73098 ?auto_73095 ) ) ( not ( = ?auto_73096 ?auto_73095 ) ) ( HOLDING ?auto_73092 ) ( CLEAR ?auto_73093 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73098 ?auto_73096 ?auto_73097 ?auto_73094 ?auto_73093 ?auto_73092 )
      ( MAKE-4PILE ?auto_73091 ?auto_73092 ?auto_73093 ?auto_73094 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73099 - BLOCK
      ?auto_73100 - BLOCK
      ?auto_73101 - BLOCK
      ?auto_73102 - BLOCK
    )
    :vars
    (
      ?auto_73105 - BLOCK
      ?auto_73104 - BLOCK
      ?auto_73103 - BLOCK
      ?auto_73106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73099 ?auto_73100 ) ) ( not ( = ?auto_73099 ?auto_73101 ) ) ( not ( = ?auto_73099 ?auto_73102 ) ) ( not ( = ?auto_73100 ?auto_73101 ) ) ( not ( = ?auto_73100 ?auto_73102 ) ) ( not ( = ?auto_73101 ?auto_73102 ) ) ( ON ?auto_73102 ?auto_73105 ) ( not ( = ?auto_73099 ?auto_73105 ) ) ( not ( = ?auto_73100 ?auto_73105 ) ) ( not ( = ?auto_73101 ?auto_73105 ) ) ( not ( = ?auto_73102 ?auto_73105 ) ) ( ON ?auto_73101 ?auto_73102 ) ( ON-TABLE ?auto_73104 ) ( ON ?auto_73103 ?auto_73104 ) ( ON ?auto_73105 ?auto_73103 ) ( not ( = ?auto_73104 ?auto_73103 ) ) ( not ( = ?auto_73104 ?auto_73105 ) ) ( not ( = ?auto_73104 ?auto_73102 ) ) ( not ( = ?auto_73104 ?auto_73101 ) ) ( not ( = ?auto_73103 ?auto_73105 ) ) ( not ( = ?auto_73103 ?auto_73102 ) ) ( not ( = ?auto_73103 ?auto_73101 ) ) ( not ( = ?auto_73099 ?auto_73104 ) ) ( not ( = ?auto_73099 ?auto_73103 ) ) ( not ( = ?auto_73100 ?auto_73104 ) ) ( not ( = ?auto_73100 ?auto_73103 ) ) ( ON ?auto_73099 ?auto_73106 ) ( not ( = ?auto_73099 ?auto_73106 ) ) ( not ( = ?auto_73100 ?auto_73106 ) ) ( not ( = ?auto_73101 ?auto_73106 ) ) ( not ( = ?auto_73102 ?auto_73106 ) ) ( not ( = ?auto_73105 ?auto_73106 ) ) ( not ( = ?auto_73104 ?auto_73106 ) ) ( not ( = ?auto_73103 ?auto_73106 ) ) ( CLEAR ?auto_73101 ) ( ON ?auto_73100 ?auto_73099 ) ( CLEAR ?auto_73100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73106 ?auto_73099 )
      ( MAKE-4PILE ?auto_73099 ?auto_73100 ?auto_73101 ?auto_73102 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73107 - BLOCK
      ?auto_73108 - BLOCK
      ?auto_73109 - BLOCK
      ?auto_73110 - BLOCK
    )
    :vars
    (
      ?auto_73112 - BLOCK
      ?auto_73113 - BLOCK
      ?auto_73114 - BLOCK
      ?auto_73111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73107 ?auto_73108 ) ) ( not ( = ?auto_73107 ?auto_73109 ) ) ( not ( = ?auto_73107 ?auto_73110 ) ) ( not ( = ?auto_73108 ?auto_73109 ) ) ( not ( = ?auto_73108 ?auto_73110 ) ) ( not ( = ?auto_73109 ?auto_73110 ) ) ( ON ?auto_73110 ?auto_73112 ) ( not ( = ?auto_73107 ?auto_73112 ) ) ( not ( = ?auto_73108 ?auto_73112 ) ) ( not ( = ?auto_73109 ?auto_73112 ) ) ( not ( = ?auto_73110 ?auto_73112 ) ) ( ON-TABLE ?auto_73113 ) ( ON ?auto_73114 ?auto_73113 ) ( ON ?auto_73112 ?auto_73114 ) ( not ( = ?auto_73113 ?auto_73114 ) ) ( not ( = ?auto_73113 ?auto_73112 ) ) ( not ( = ?auto_73113 ?auto_73110 ) ) ( not ( = ?auto_73113 ?auto_73109 ) ) ( not ( = ?auto_73114 ?auto_73112 ) ) ( not ( = ?auto_73114 ?auto_73110 ) ) ( not ( = ?auto_73114 ?auto_73109 ) ) ( not ( = ?auto_73107 ?auto_73113 ) ) ( not ( = ?auto_73107 ?auto_73114 ) ) ( not ( = ?auto_73108 ?auto_73113 ) ) ( not ( = ?auto_73108 ?auto_73114 ) ) ( ON ?auto_73107 ?auto_73111 ) ( not ( = ?auto_73107 ?auto_73111 ) ) ( not ( = ?auto_73108 ?auto_73111 ) ) ( not ( = ?auto_73109 ?auto_73111 ) ) ( not ( = ?auto_73110 ?auto_73111 ) ) ( not ( = ?auto_73112 ?auto_73111 ) ) ( not ( = ?auto_73113 ?auto_73111 ) ) ( not ( = ?auto_73114 ?auto_73111 ) ) ( ON ?auto_73108 ?auto_73107 ) ( CLEAR ?auto_73108 ) ( ON-TABLE ?auto_73111 ) ( HOLDING ?auto_73109 ) ( CLEAR ?auto_73110 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73113 ?auto_73114 ?auto_73112 ?auto_73110 ?auto_73109 )
      ( MAKE-4PILE ?auto_73107 ?auto_73108 ?auto_73109 ?auto_73110 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73115 - BLOCK
      ?auto_73116 - BLOCK
      ?auto_73117 - BLOCK
      ?auto_73118 - BLOCK
    )
    :vars
    (
      ?auto_73119 - BLOCK
      ?auto_73121 - BLOCK
      ?auto_73120 - BLOCK
      ?auto_73122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73115 ?auto_73116 ) ) ( not ( = ?auto_73115 ?auto_73117 ) ) ( not ( = ?auto_73115 ?auto_73118 ) ) ( not ( = ?auto_73116 ?auto_73117 ) ) ( not ( = ?auto_73116 ?auto_73118 ) ) ( not ( = ?auto_73117 ?auto_73118 ) ) ( ON ?auto_73118 ?auto_73119 ) ( not ( = ?auto_73115 ?auto_73119 ) ) ( not ( = ?auto_73116 ?auto_73119 ) ) ( not ( = ?auto_73117 ?auto_73119 ) ) ( not ( = ?auto_73118 ?auto_73119 ) ) ( ON-TABLE ?auto_73121 ) ( ON ?auto_73120 ?auto_73121 ) ( ON ?auto_73119 ?auto_73120 ) ( not ( = ?auto_73121 ?auto_73120 ) ) ( not ( = ?auto_73121 ?auto_73119 ) ) ( not ( = ?auto_73121 ?auto_73118 ) ) ( not ( = ?auto_73121 ?auto_73117 ) ) ( not ( = ?auto_73120 ?auto_73119 ) ) ( not ( = ?auto_73120 ?auto_73118 ) ) ( not ( = ?auto_73120 ?auto_73117 ) ) ( not ( = ?auto_73115 ?auto_73121 ) ) ( not ( = ?auto_73115 ?auto_73120 ) ) ( not ( = ?auto_73116 ?auto_73121 ) ) ( not ( = ?auto_73116 ?auto_73120 ) ) ( ON ?auto_73115 ?auto_73122 ) ( not ( = ?auto_73115 ?auto_73122 ) ) ( not ( = ?auto_73116 ?auto_73122 ) ) ( not ( = ?auto_73117 ?auto_73122 ) ) ( not ( = ?auto_73118 ?auto_73122 ) ) ( not ( = ?auto_73119 ?auto_73122 ) ) ( not ( = ?auto_73121 ?auto_73122 ) ) ( not ( = ?auto_73120 ?auto_73122 ) ) ( ON ?auto_73116 ?auto_73115 ) ( ON-TABLE ?auto_73122 ) ( CLEAR ?auto_73118 ) ( ON ?auto_73117 ?auto_73116 ) ( CLEAR ?auto_73117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73122 ?auto_73115 ?auto_73116 )
      ( MAKE-4PILE ?auto_73115 ?auto_73116 ?auto_73117 ?auto_73118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73123 - BLOCK
      ?auto_73124 - BLOCK
      ?auto_73125 - BLOCK
      ?auto_73126 - BLOCK
    )
    :vars
    (
      ?auto_73129 - BLOCK
      ?auto_73127 - BLOCK
      ?auto_73130 - BLOCK
      ?auto_73128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73123 ?auto_73124 ) ) ( not ( = ?auto_73123 ?auto_73125 ) ) ( not ( = ?auto_73123 ?auto_73126 ) ) ( not ( = ?auto_73124 ?auto_73125 ) ) ( not ( = ?auto_73124 ?auto_73126 ) ) ( not ( = ?auto_73125 ?auto_73126 ) ) ( not ( = ?auto_73123 ?auto_73129 ) ) ( not ( = ?auto_73124 ?auto_73129 ) ) ( not ( = ?auto_73125 ?auto_73129 ) ) ( not ( = ?auto_73126 ?auto_73129 ) ) ( ON-TABLE ?auto_73127 ) ( ON ?auto_73130 ?auto_73127 ) ( ON ?auto_73129 ?auto_73130 ) ( not ( = ?auto_73127 ?auto_73130 ) ) ( not ( = ?auto_73127 ?auto_73129 ) ) ( not ( = ?auto_73127 ?auto_73126 ) ) ( not ( = ?auto_73127 ?auto_73125 ) ) ( not ( = ?auto_73130 ?auto_73129 ) ) ( not ( = ?auto_73130 ?auto_73126 ) ) ( not ( = ?auto_73130 ?auto_73125 ) ) ( not ( = ?auto_73123 ?auto_73127 ) ) ( not ( = ?auto_73123 ?auto_73130 ) ) ( not ( = ?auto_73124 ?auto_73127 ) ) ( not ( = ?auto_73124 ?auto_73130 ) ) ( ON ?auto_73123 ?auto_73128 ) ( not ( = ?auto_73123 ?auto_73128 ) ) ( not ( = ?auto_73124 ?auto_73128 ) ) ( not ( = ?auto_73125 ?auto_73128 ) ) ( not ( = ?auto_73126 ?auto_73128 ) ) ( not ( = ?auto_73129 ?auto_73128 ) ) ( not ( = ?auto_73127 ?auto_73128 ) ) ( not ( = ?auto_73130 ?auto_73128 ) ) ( ON ?auto_73124 ?auto_73123 ) ( ON-TABLE ?auto_73128 ) ( ON ?auto_73125 ?auto_73124 ) ( CLEAR ?auto_73125 ) ( HOLDING ?auto_73126 ) ( CLEAR ?auto_73129 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73127 ?auto_73130 ?auto_73129 ?auto_73126 )
      ( MAKE-4PILE ?auto_73123 ?auto_73124 ?auto_73125 ?auto_73126 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73131 - BLOCK
      ?auto_73132 - BLOCK
      ?auto_73133 - BLOCK
      ?auto_73134 - BLOCK
    )
    :vars
    (
      ?auto_73138 - BLOCK
      ?auto_73136 - BLOCK
      ?auto_73135 - BLOCK
      ?auto_73137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73131 ?auto_73132 ) ) ( not ( = ?auto_73131 ?auto_73133 ) ) ( not ( = ?auto_73131 ?auto_73134 ) ) ( not ( = ?auto_73132 ?auto_73133 ) ) ( not ( = ?auto_73132 ?auto_73134 ) ) ( not ( = ?auto_73133 ?auto_73134 ) ) ( not ( = ?auto_73131 ?auto_73138 ) ) ( not ( = ?auto_73132 ?auto_73138 ) ) ( not ( = ?auto_73133 ?auto_73138 ) ) ( not ( = ?auto_73134 ?auto_73138 ) ) ( ON-TABLE ?auto_73136 ) ( ON ?auto_73135 ?auto_73136 ) ( ON ?auto_73138 ?auto_73135 ) ( not ( = ?auto_73136 ?auto_73135 ) ) ( not ( = ?auto_73136 ?auto_73138 ) ) ( not ( = ?auto_73136 ?auto_73134 ) ) ( not ( = ?auto_73136 ?auto_73133 ) ) ( not ( = ?auto_73135 ?auto_73138 ) ) ( not ( = ?auto_73135 ?auto_73134 ) ) ( not ( = ?auto_73135 ?auto_73133 ) ) ( not ( = ?auto_73131 ?auto_73136 ) ) ( not ( = ?auto_73131 ?auto_73135 ) ) ( not ( = ?auto_73132 ?auto_73136 ) ) ( not ( = ?auto_73132 ?auto_73135 ) ) ( ON ?auto_73131 ?auto_73137 ) ( not ( = ?auto_73131 ?auto_73137 ) ) ( not ( = ?auto_73132 ?auto_73137 ) ) ( not ( = ?auto_73133 ?auto_73137 ) ) ( not ( = ?auto_73134 ?auto_73137 ) ) ( not ( = ?auto_73138 ?auto_73137 ) ) ( not ( = ?auto_73136 ?auto_73137 ) ) ( not ( = ?auto_73135 ?auto_73137 ) ) ( ON ?auto_73132 ?auto_73131 ) ( ON-TABLE ?auto_73137 ) ( ON ?auto_73133 ?auto_73132 ) ( CLEAR ?auto_73138 ) ( ON ?auto_73134 ?auto_73133 ) ( CLEAR ?auto_73134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73137 ?auto_73131 ?auto_73132 ?auto_73133 )
      ( MAKE-4PILE ?auto_73131 ?auto_73132 ?auto_73133 ?auto_73134 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73139 - BLOCK
      ?auto_73140 - BLOCK
      ?auto_73141 - BLOCK
      ?auto_73142 - BLOCK
    )
    :vars
    (
      ?auto_73143 - BLOCK
      ?auto_73145 - BLOCK
      ?auto_73146 - BLOCK
      ?auto_73144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73139 ?auto_73140 ) ) ( not ( = ?auto_73139 ?auto_73141 ) ) ( not ( = ?auto_73139 ?auto_73142 ) ) ( not ( = ?auto_73140 ?auto_73141 ) ) ( not ( = ?auto_73140 ?auto_73142 ) ) ( not ( = ?auto_73141 ?auto_73142 ) ) ( not ( = ?auto_73139 ?auto_73143 ) ) ( not ( = ?auto_73140 ?auto_73143 ) ) ( not ( = ?auto_73141 ?auto_73143 ) ) ( not ( = ?auto_73142 ?auto_73143 ) ) ( ON-TABLE ?auto_73145 ) ( ON ?auto_73146 ?auto_73145 ) ( not ( = ?auto_73145 ?auto_73146 ) ) ( not ( = ?auto_73145 ?auto_73143 ) ) ( not ( = ?auto_73145 ?auto_73142 ) ) ( not ( = ?auto_73145 ?auto_73141 ) ) ( not ( = ?auto_73146 ?auto_73143 ) ) ( not ( = ?auto_73146 ?auto_73142 ) ) ( not ( = ?auto_73146 ?auto_73141 ) ) ( not ( = ?auto_73139 ?auto_73145 ) ) ( not ( = ?auto_73139 ?auto_73146 ) ) ( not ( = ?auto_73140 ?auto_73145 ) ) ( not ( = ?auto_73140 ?auto_73146 ) ) ( ON ?auto_73139 ?auto_73144 ) ( not ( = ?auto_73139 ?auto_73144 ) ) ( not ( = ?auto_73140 ?auto_73144 ) ) ( not ( = ?auto_73141 ?auto_73144 ) ) ( not ( = ?auto_73142 ?auto_73144 ) ) ( not ( = ?auto_73143 ?auto_73144 ) ) ( not ( = ?auto_73145 ?auto_73144 ) ) ( not ( = ?auto_73146 ?auto_73144 ) ) ( ON ?auto_73140 ?auto_73139 ) ( ON-TABLE ?auto_73144 ) ( ON ?auto_73141 ?auto_73140 ) ( ON ?auto_73142 ?auto_73141 ) ( CLEAR ?auto_73142 ) ( HOLDING ?auto_73143 ) ( CLEAR ?auto_73146 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73145 ?auto_73146 ?auto_73143 )
      ( MAKE-4PILE ?auto_73139 ?auto_73140 ?auto_73141 ?auto_73142 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73147 - BLOCK
      ?auto_73148 - BLOCK
      ?auto_73149 - BLOCK
      ?auto_73150 - BLOCK
    )
    :vars
    (
      ?auto_73154 - BLOCK
      ?auto_73152 - BLOCK
      ?auto_73153 - BLOCK
      ?auto_73151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73147 ?auto_73148 ) ) ( not ( = ?auto_73147 ?auto_73149 ) ) ( not ( = ?auto_73147 ?auto_73150 ) ) ( not ( = ?auto_73148 ?auto_73149 ) ) ( not ( = ?auto_73148 ?auto_73150 ) ) ( not ( = ?auto_73149 ?auto_73150 ) ) ( not ( = ?auto_73147 ?auto_73154 ) ) ( not ( = ?auto_73148 ?auto_73154 ) ) ( not ( = ?auto_73149 ?auto_73154 ) ) ( not ( = ?auto_73150 ?auto_73154 ) ) ( ON-TABLE ?auto_73152 ) ( ON ?auto_73153 ?auto_73152 ) ( not ( = ?auto_73152 ?auto_73153 ) ) ( not ( = ?auto_73152 ?auto_73154 ) ) ( not ( = ?auto_73152 ?auto_73150 ) ) ( not ( = ?auto_73152 ?auto_73149 ) ) ( not ( = ?auto_73153 ?auto_73154 ) ) ( not ( = ?auto_73153 ?auto_73150 ) ) ( not ( = ?auto_73153 ?auto_73149 ) ) ( not ( = ?auto_73147 ?auto_73152 ) ) ( not ( = ?auto_73147 ?auto_73153 ) ) ( not ( = ?auto_73148 ?auto_73152 ) ) ( not ( = ?auto_73148 ?auto_73153 ) ) ( ON ?auto_73147 ?auto_73151 ) ( not ( = ?auto_73147 ?auto_73151 ) ) ( not ( = ?auto_73148 ?auto_73151 ) ) ( not ( = ?auto_73149 ?auto_73151 ) ) ( not ( = ?auto_73150 ?auto_73151 ) ) ( not ( = ?auto_73154 ?auto_73151 ) ) ( not ( = ?auto_73152 ?auto_73151 ) ) ( not ( = ?auto_73153 ?auto_73151 ) ) ( ON ?auto_73148 ?auto_73147 ) ( ON-TABLE ?auto_73151 ) ( ON ?auto_73149 ?auto_73148 ) ( ON ?auto_73150 ?auto_73149 ) ( CLEAR ?auto_73153 ) ( ON ?auto_73154 ?auto_73150 ) ( CLEAR ?auto_73154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73151 ?auto_73147 ?auto_73148 ?auto_73149 ?auto_73150 )
      ( MAKE-4PILE ?auto_73147 ?auto_73148 ?auto_73149 ?auto_73150 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73155 - BLOCK
      ?auto_73156 - BLOCK
      ?auto_73157 - BLOCK
      ?auto_73158 - BLOCK
    )
    :vars
    (
      ?auto_73161 - BLOCK
      ?auto_73162 - BLOCK
      ?auto_73159 - BLOCK
      ?auto_73160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73155 ?auto_73156 ) ) ( not ( = ?auto_73155 ?auto_73157 ) ) ( not ( = ?auto_73155 ?auto_73158 ) ) ( not ( = ?auto_73156 ?auto_73157 ) ) ( not ( = ?auto_73156 ?auto_73158 ) ) ( not ( = ?auto_73157 ?auto_73158 ) ) ( not ( = ?auto_73155 ?auto_73161 ) ) ( not ( = ?auto_73156 ?auto_73161 ) ) ( not ( = ?auto_73157 ?auto_73161 ) ) ( not ( = ?auto_73158 ?auto_73161 ) ) ( ON-TABLE ?auto_73162 ) ( not ( = ?auto_73162 ?auto_73159 ) ) ( not ( = ?auto_73162 ?auto_73161 ) ) ( not ( = ?auto_73162 ?auto_73158 ) ) ( not ( = ?auto_73162 ?auto_73157 ) ) ( not ( = ?auto_73159 ?auto_73161 ) ) ( not ( = ?auto_73159 ?auto_73158 ) ) ( not ( = ?auto_73159 ?auto_73157 ) ) ( not ( = ?auto_73155 ?auto_73162 ) ) ( not ( = ?auto_73155 ?auto_73159 ) ) ( not ( = ?auto_73156 ?auto_73162 ) ) ( not ( = ?auto_73156 ?auto_73159 ) ) ( ON ?auto_73155 ?auto_73160 ) ( not ( = ?auto_73155 ?auto_73160 ) ) ( not ( = ?auto_73156 ?auto_73160 ) ) ( not ( = ?auto_73157 ?auto_73160 ) ) ( not ( = ?auto_73158 ?auto_73160 ) ) ( not ( = ?auto_73161 ?auto_73160 ) ) ( not ( = ?auto_73162 ?auto_73160 ) ) ( not ( = ?auto_73159 ?auto_73160 ) ) ( ON ?auto_73156 ?auto_73155 ) ( ON-TABLE ?auto_73160 ) ( ON ?auto_73157 ?auto_73156 ) ( ON ?auto_73158 ?auto_73157 ) ( ON ?auto_73161 ?auto_73158 ) ( CLEAR ?auto_73161 ) ( HOLDING ?auto_73159 ) ( CLEAR ?auto_73162 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73162 ?auto_73159 )
      ( MAKE-4PILE ?auto_73155 ?auto_73156 ?auto_73157 ?auto_73158 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73163 - BLOCK
      ?auto_73164 - BLOCK
      ?auto_73165 - BLOCK
      ?auto_73166 - BLOCK
    )
    :vars
    (
      ?auto_73167 - BLOCK
      ?auto_73169 - BLOCK
      ?auto_73170 - BLOCK
      ?auto_73168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73163 ?auto_73164 ) ) ( not ( = ?auto_73163 ?auto_73165 ) ) ( not ( = ?auto_73163 ?auto_73166 ) ) ( not ( = ?auto_73164 ?auto_73165 ) ) ( not ( = ?auto_73164 ?auto_73166 ) ) ( not ( = ?auto_73165 ?auto_73166 ) ) ( not ( = ?auto_73163 ?auto_73167 ) ) ( not ( = ?auto_73164 ?auto_73167 ) ) ( not ( = ?auto_73165 ?auto_73167 ) ) ( not ( = ?auto_73166 ?auto_73167 ) ) ( ON-TABLE ?auto_73169 ) ( not ( = ?auto_73169 ?auto_73170 ) ) ( not ( = ?auto_73169 ?auto_73167 ) ) ( not ( = ?auto_73169 ?auto_73166 ) ) ( not ( = ?auto_73169 ?auto_73165 ) ) ( not ( = ?auto_73170 ?auto_73167 ) ) ( not ( = ?auto_73170 ?auto_73166 ) ) ( not ( = ?auto_73170 ?auto_73165 ) ) ( not ( = ?auto_73163 ?auto_73169 ) ) ( not ( = ?auto_73163 ?auto_73170 ) ) ( not ( = ?auto_73164 ?auto_73169 ) ) ( not ( = ?auto_73164 ?auto_73170 ) ) ( ON ?auto_73163 ?auto_73168 ) ( not ( = ?auto_73163 ?auto_73168 ) ) ( not ( = ?auto_73164 ?auto_73168 ) ) ( not ( = ?auto_73165 ?auto_73168 ) ) ( not ( = ?auto_73166 ?auto_73168 ) ) ( not ( = ?auto_73167 ?auto_73168 ) ) ( not ( = ?auto_73169 ?auto_73168 ) ) ( not ( = ?auto_73170 ?auto_73168 ) ) ( ON ?auto_73164 ?auto_73163 ) ( ON-TABLE ?auto_73168 ) ( ON ?auto_73165 ?auto_73164 ) ( ON ?auto_73166 ?auto_73165 ) ( ON ?auto_73167 ?auto_73166 ) ( CLEAR ?auto_73169 ) ( ON ?auto_73170 ?auto_73167 ) ( CLEAR ?auto_73170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73168 ?auto_73163 ?auto_73164 ?auto_73165 ?auto_73166 ?auto_73167 )
      ( MAKE-4PILE ?auto_73163 ?auto_73164 ?auto_73165 ?auto_73166 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73171 - BLOCK
      ?auto_73172 - BLOCK
      ?auto_73173 - BLOCK
      ?auto_73174 - BLOCK
    )
    :vars
    (
      ?auto_73177 - BLOCK
      ?auto_73175 - BLOCK
      ?auto_73178 - BLOCK
      ?auto_73176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73171 ?auto_73172 ) ) ( not ( = ?auto_73171 ?auto_73173 ) ) ( not ( = ?auto_73171 ?auto_73174 ) ) ( not ( = ?auto_73172 ?auto_73173 ) ) ( not ( = ?auto_73172 ?auto_73174 ) ) ( not ( = ?auto_73173 ?auto_73174 ) ) ( not ( = ?auto_73171 ?auto_73177 ) ) ( not ( = ?auto_73172 ?auto_73177 ) ) ( not ( = ?auto_73173 ?auto_73177 ) ) ( not ( = ?auto_73174 ?auto_73177 ) ) ( not ( = ?auto_73175 ?auto_73178 ) ) ( not ( = ?auto_73175 ?auto_73177 ) ) ( not ( = ?auto_73175 ?auto_73174 ) ) ( not ( = ?auto_73175 ?auto_73173 ) ) ( not ( = ?auto_73178 ?auto_73177 ) ) ( not ( = ?auto_73178 ?auto_73174 ) ) ( not ( = ?auto_73178 ?auto_73173 ) ) ( not ( = ?auto_73171 ?auto_73175 ) ) ( not ( = ?auto_73171 ?auto_73178 ) ) ( not ( = ?auto_73172 ?auto_73175 ) ) ( not ( = ?auto_73172 ?auto_73178 ) ) ( ON ?auto_73171 ?auto_73176 ) ( not ( = ?auto_73171 ?auto_73176 ) ) ( not ( = ?auto_73172 ?auto_73176 ) ) ( not ( = ?auto_73173 ?auto_73176 ) ) ( not ( = ?auto_73174 ?auto_73176 ) ) ( not ( = ?auto_73177 ?auto_73176 ) ) ( not ( = ?auto_73175 ?auto_73176 ) ) ( not ( = ?auto_73178 ?auto_73176 ) ) ( ON ?auto_73172 ?auto_73171 ) ( ON-TABLE ?auto_73176 ) ( ON ?auto_73173 ?auto_73172 ) ( ON ?auto_73174 ?auto_73173 ) ( ON ?auto_73177 ?auto_73174 ) ( ON ?auto_73178 ?auto_73177 ) ( CLEAR ?auto_73178 ) ( HOLDING ?auto_73175 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73175 )
      ( MAKE-4PILE ?auto_73171 ?auto_73172 ?auto_73173 ?auto_73174 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73179 - BLOCK
      ?auto_73180 - BLOCK
      ?auto_73181 - BLOCK
      ?auto_73182 - BLOCK
    )
    :vars
    (
      ?auto_73185 - BLOCK
      ?auto_73183 - BLOCK
      ?auto_73186 - BLOCK
      ?auto_73184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73179 ?auto_73180 ) ) ( not ( = ?auto_73179 ?auto_73181 ) ) ( not ( = ?auto_73179 ?auto_73182 ) ) ( not ( = ?auto_73180 ?auto_73181 ) ) ( not ( = ?auto_73180 ?auto_73182 ) ) ( not ( = ?auto_73181 ?auto_73182 ) ) ( not ( = ?auto_73179 ?auto_73185 ) ) ( not ( = ?auto_73180 ?auto_73185 ) ) ( not ( = ?auto_73181 ?auto_73185 ) ) ( not ( = ?auto_73182 ?auto_73185 ) ) ( not ( = ?auto_73183 ?auto_73186 ) ) ( not ( = ?auto_73183 ?auto_73185 ) ) ( not ( = ?auto_73183 ?auto_73182 ) ) ( not ( = ?auto_73183 ?auto_73181 ) ) ( not ( = ?auto_73186 ?auto_73185 ) ) ( not ( = ?auto_73186 ?auto_73182 ) ) ( not ( = ?auto_73186 ?auto_73181 ) ) ( not ( = ?auto_73179 ?auto_73183 ) ) ( not ( = ?auto_73179 ?auto_73186 ) ) ( not ( = ?auto_73180 ?auto_73183 ) ) ( not ( = ?auto_73180 ?auto_73186 ) ) ( ON ?auto_73179 ?auto_73184 ) ( not ( = ?auto_73179 ?auto_73184 ) ) ( not ( = ?auto_73180 ?auto_73184 ) ) ( not ( = ?auto_73181 ?auto_73184 ) ) ( not ( = ?auto_73182 ?auto_73184 ) ) ( not ( = ?auto_73185 ?auto_73184 ) ) ( not ( = ?auto_73183 ?auto_73184 ) ) ( not ( = ?auto_73186 ?auto_73184 ) ) ( ON ?auto_73180 ?auto_73179 ) ( ON-TABLE ?auto_73184 ) ( ON ?auto_73181 ?auto_73180 ) ( ON ?auto_73182 ?auto_73181 ) ( ON ?auto_73185 ?auto_73182 ) ( ON ?auto_73186 ?auto_73185 ) ( ON ?auto_73183 ?auto_73186 ) ( CLEAR ?auto_73183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_73184 ?auto_73179 ?auto_73180 ?auto_73181 ?auto_73182 ?auto_73185 ?auto_73186 )
      ( MAKE-4PILE ?auto_73179 ?auto_73180 ?auto_73181 ?auto_73182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73202 - BLOCK
      ?auto_73203 - BLOCK
    )
    :vars
    (
      ?auto_73206 - BLOCK
      ?auto_73205 - BLOCK
      ?auto_73204 - BLOCK
      ?auto_73207 - BLOCK
      ?auto_73208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73206 ?auto_73203 ) ( ON-TABLE ?auto_73202 ) ( ON ?auto_73203 ?auto_73202 ) ( not ( = ?auto_73202 ?auto_73203 ) ) ( not ( = ?auto_73202 ?auto_73206 ) ) ( not ( = ?auto_73203 ?auto_73206 ) ) ( not ( = ?auto_73202 ?auto_73205 ) ) ( not ( = ?auto_73202 ?auto_73204 ) ) ( not ( = ?auto_73203 ?auto_73205 ) ) ( not ( = ?auto_73203 ?auto_73204 ) ) ( not ( = ?auto_73206 ?auto_73205 ) ) ( not ( = ?auto_73206 ?auto_73204 ) ) ( not ( = ?auto_73205 ?auto_73204 ) ) ( ON ?auto_73205 ?auto_73206 ) ( CLEAR ?auto_73205 ) ( HOLDING ?auto_73204 ) ( CLEAR ?auto_73207 ) ( ON-TABLE ?auto_73208 ) ( ON ?auto_73207 ?auto_73208 ) ( not ( = ?auto_73208 ?auto_73207 ) ) ( not ( = ?auto_73208 ?auto_73204 ) ) ( not ( = ?auto_73207 ?auto_73204 ) ) ( not ( = ?auto_73202 ?auto_73207 ) ) ( not ( = ?auto_73202 ?auto_73208 ) ) ( not ( = ?auto_73203 ?auto_73207 ) ) ( not ( = ?auto_73203 ?auto_73208 ) ) ( not ( = ?auto_73206 ?auto_73207 ) ) ( not ( = ?auto_73206 ?auto_73208 ) ) ( not ( = ?auto_73205 ?auto_73207 ) ) ( not ( = ?auto_73205 ?auto_73208 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73208 ?auto_73207 ?auto_73204 )
      ( MAKE-2PILE ?auto_73202 ?auto_73203 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73209 - BLOCK
      ?auto_73210 - BLOCK
    )
    :vars
    (
      ?auto_73211 - BLOCK
      ?auto_73214 - BLOCK
      ?auto_73213 - BLOCK
      ?auto_73212 - BLOCK
      ?auto_73215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73211 ?auto_73210 ) ( ON-TABLE ?auto_73209 ) ( ON ?auto_73210 ?auto_73209 ) ( not ( = ?auto_73209 ?auto_73210 ) ) ( not ( = ?auto_73209 ?auto_73211 ) ) ( not ( = ?auto_73210 ?auto_73211 ) ) ( not ( = ?auto_73209 ?auto_73214 ) ) ( not ( = ?auto_73209 ?auto_73213 ) ) ( not ( = ?auto_73210 ?auto_73214 ) ) ( not ( = ?auto_73210 ?auto_73213 ) ) ( not ( = ?auto_73211 ?auto_73214 ) ) ( not ( = ?auto_73211 ?auto_73213 ) ) ( not ( = ?auto_73214 ?auto_73213 ) ) ( ON ?auto_73214 ?auto_73211 ) ( CLEAR ?auto_73212 ) ( ON-TABLE ?auto_73215 ) ( ON ?auto_73212 ?auto_73215 ) ( not ( = ?auto_73215 ?auto_73212 ) ) ( not ( = ?auto_73215 ?auto_73213 ) ) ( not ( = ?auto_73212 ?auto_73213 ) ) ( not ( = ?auto_73209 ?auto_73212 ) ) ( not ( = ?auto_73209 ?auto_73215 ) ) ( not ( = ?auto_73210 ?auto_73212 ) ) ( not ( = ?auto_73210 ?auto_73215 ) ) ( not ( = ?auto_73211 ?auto_73212 ) ) ( not ( = ?auto_73211 ?auto_73215 ) ) ( not ( = ?auto_73214 ?auto_73212 ) ) ( not ( = ?auto_73214 ?auto_73215 ) ) ( ON ?auto_73213 ?auto_73214 ) ( CLEAR ?auto_73213 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73209 ?auto_73210 ?auto_73211 ?auto_73214 )
      ( MAKE-2PILE ?auto_73209 ?auto_73210 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73216 - BLOCK
      ?auto_73217 - BLOCK
    )
    :vars
    (
      ?auto_73221 - BLOCK
      ?auto_73220 - BLOCK
      ?auto_73219 - BLOCK
      ?auto_73218 - BLOCK
      ?auto_73222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73221 ?auto_73217 ) ( ON-TABLE ?auto_73216 ) ( ON ?auto_73217 ?auto_73216 ) ( not ( = ?auto_73216 ?auto_73217 ) ) ( not ( = ?auto_73216 ?auto_73221 ) ) ( not ( = ?auto_73217 ?auto_73221 ) ) ( not ( = ?auto_73216 ?auto_73220 ) ) ( not ( = ?auto_73216 ?auto_73219 ) ) ( not ( = ?auto_73217 ?auto_73220 ) ) ( not ( = ?auto_73217 ?auto_73219 ) ) ( not ( = ?auto_73221 ?auto_73220 ) ) ( not ( = ?auto_73221 ?auto_73219 ) ) ( not ( = ?auto_73220 ?auto_73219 ) ) ( ON ?auto_73220 ?auto_73221 ) ( ON-TABLE ?auto_73218 ) ( not ( = ?auto_73218 ?auto_73222 ) ) ( not ( = ?auto_73218 ?auto_73219 ) ) ( not ( = ?auto_73222 ?auto_73219 ) ) ( not ( = ?auto_73216 ?auto_73222 ) ) ( not ( = ?auto_73216 ?auto_73218 ) ) ( not ( = ?auto_73217 ?auto_73222 ) ) ( not ( = ?auto_73217 ?auto_73218 ) ) ( not ( = ?auto_73221 ?auto_73222 ) ) ( not ( = ?auto_73221 ?auto_73218 ) ) ( not ( = ?auto_73220 ?auto_73222 ) ) ( not ( = ?auto_73220 ?auto_73218 ) ) ( ON ?auto_73219 ?auto_73220 ) ( CLEAR ?auto_73219 ) ( HOLDING ?auto_73222 ) ( CLEAR ?auto_73218 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73218 ?auto_73222 )
      ( MAKE-2PILE ?auto_73216 ?auto_73217 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73223 - BLOCK
      ?auto_73224 - BLOCK
    )
    :vars
    (
      ?auto_73229 - BLOCK
      ?auto_73225 - BLOCK
      ?auto_73227 - BLOCK
      ?auto_73228 - BLOCK
      ?auto_73226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73229 ?auto_73224 ) ( ON-TABLE ?auto_73223 ) ( ON ?auto_73224 ?auto_73223 ) ( not ( = ?auto_73223 ?auto_73224 ) ) ( not ( = ?auto_73223 ?auto_73229 ) ) ( not ( = ?auto_73224 ?auto_73229 ) ) ( not ( = ?auto_73223 ?auto_73225 ) ) ( not ( = ?auto_73223 ?auto_73227 ) ) ( not ( = ?auto_73224 ?auto_73225 ) ) ( not ( = ?auto_73224 ?auto_73227 ) ) ( not ( = ?auto_73229 ?auto_73225 ) ) ( not ( = ?auto_73229 ?auto_73227 ) ) ( not ( = ?auto_73225 ?auto_73227 ) ) ( ON ?auto_73225 ?auto_73229 ) ( ON-TABLE ?auto_73228 ) ( not ( = ?auto_73228 ?auto_73226 ) ) ( not ( = ?auto_73228 ?auto_73227 ) ) ( not ( = ?auto_73226 ?auto_73227 ) ) ( not ( = ?auto_73223 ?auto_73226 ) ) ( not ( = ?auto_73223 ?auto_73228 ) ) ( not ( = ?auto_73224 ?auto_73226 ) ) ( not ( = ?auto_73224 ?auto_73228 ) ) ( not ( = ?auto_73229 ?auto_73226 ) ) ( not ( = ?auto_73229 ?auto_73228 ) ) ( not ( = ?auto_73225 ?auto_73226 ) ) ( not ( = ?auto_73225 ?auto_73228 ) ) ( ON ?auto_73227 ?auto_73225 ) ( CLEAR ?auto_73228 ) ( ON ?auto_73226 ?auto_73227 ) ( CLEAR ?auto_73226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73223 ?auto_73224 ?auto_73229 ?auto_73225 ?auto_73227 )
      ( MAKE-2PILE ?auto_73223 ?auto_73224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73230 - BLOCK
      ?auto_73231 - BLOCK
    )
    :vars
    (
      ?auto_73235 - BLOCK
      ?auto_73233 - BLOCK
      ?auto_73232 - BLOCK
      ?auto_73234 - BLOCK
      ?auto_73236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73235 ?auto_73231 ) ( ON-TABLE ?auto_73230 ) ( ON ?auto_73231 ?auto_73230 ) ( not ( = ?auto_73230 ?auto_73231 ) ) ( not ( = ?auto_73230 ?auto_73235 ) ) ( not ( = ?auto_73231 ?auto_73235 ) ) ( not ( = ?auto_73230 ?auto_73233 ) ) ( not ( = ?auto_73230 ?auto_73232 ) ) ( not ( = ?auto_73231 ?auto_73233 ) ) ( not ( = ?auto_73231 ?auto_73232 ) ) ( not ( = ?auto_73235 ?auto_73233 ) ) ( not ( = ?auto_73235 ?auto_73232 ) ) ( not ( = ?auto_73233 ?auto_73232 ) ) ( ON ?auto_73233 ?auto_73235 ) ( not ( = ?auto_73234 ?auto_73236 ) ) ( not ( = ?auto_73234 ?auto_73232 ) ) ( not ( = ?auto_73236 ?auto_73232 ) ) ( not ( = ?auto_73230 ?auto_73236 ) ) ( not ( = ?auto_73230 ?auto_73234 ) ) ( not ( = ?auto_73231 ?auto_73236 ) ) ( not ( = ?auto_73231 ?auto_73234 ) ) ( not ( = ?auto_73235 ?auto_73236 ) ) ( not ( = ?auto_73235 ?auto_73234 ) ) ( not ( = ?auto_73233 ?auto_73236 ) ) ( not ( = ?auto_73233 ?auto_73234 ) ) ( ON ?auto_73232 ?auto_73233 ) ( ON ?auto_73236 ?auto_73232 ) ( CLEAR ?auto_73236 ) ( HOLDING ?auto_73234 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73234 )
      ( MAKE-2PILE ?auto_73230 ?auto_73231 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73246 - BLOCK
      ?auto_73247 - BLOCK
    )
    :vars
    (
      ?auto_73251 - BLOCK
      ?auto_73248 - BLOCK
      ?auto_73249 - BLOCK
      ?auto_73252 - BLOCK
      ?auto_73250 - BLOCK
      ?auto_73253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73251 ?auto_73247 ) ( ON-TABLE ?auto_73246 ) ( ON ?auto_73247 ?auto_73246 ) ( not ( = ?auto_73246 ?auto_73247 ) ) ( not ( = ?auto_73246 ?auto_73251 ) ) ( not ( = ?auto_73247 ?auto_73251 ) ) ( not ( = ?auto_73246 ?auto_73248 ) ) ( not ( = ?auto_73246 ?auto_73249 ) ) ( not ( = ?auto_73247 ?auto_73248 ) ) ( not ( = ?auto_73247 ?auto_73249 ) ) ( not ( = ?auto_73251 ?auto_73248 ) ) ( not ( = ?auto_73251 ?auto_73249 ) ) ( not ( = ?auto_73248 ?auto_73249 ) ) ( ON ?auto_73248 ?auto_73251 ) ( not ( = ?auto_73252 ?auto_73250 ) ) ( not ( = ?auto_73252 ?auto_73249 ) ) ( not ( = ?auto_73250 ?auto_73249 ) ) ( not ( = ?auto_73246 ?auto_73250 ) ) ( not ( = ?auto_73246 ?auto_73252 ) ) ( not ( = ?auto_73247 ?auto_73250 ) ) ( not ( = ?auto_73247 ?auto_73252 ) ) ( not ( = ?auto_73251 ?auto_73250 ) ) ( not ( = ?auto_73251 ?auto_73252 ) ) ( not ( = ?auto_73248 ?auto_73250 ) ) ( not ( = ?auto_73248 ?auto_73252 ) ) ( ON ?auto_73249 ?auto_73248 ) ( ON ?auto_73250 ?auto_73249 ) ( CLEAR ?auto_73250 ) ( ON ?auto_73252 ?auto_73253 ) ( CLEAR ?auto_73252 ) ( HAND-EMPTY ) ( not ( = ?auto_73246 ?auto_73253 ) ) ( not ( = ?auto_73247 ?auto_73253 ) ) ( not ( = ?auto_73251 ?auto_73253 ) ) ( not ( = ?auto_73248 ?auto_73253 ) ) ( not ( = ?auto_73249 ?auto_73253 ) ) ( not ( = ?auto_73252 ?auto_73253 ) ) ( not ( = ?auto_73250 ?auto_73253 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73252 ?auto_73253 )
      ( MAKE-2PILE ?auto_73246 ?auto_73247 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73254 - BLOCK
      ?auto_73255 - BLOCK
    )
    :vars
    (
      ?auto_73257 - BLOCK
      ?auto_73259 - BLOCK
      ?auto_73260 - BLOCK
      ?auto_73256 - BLOCK
      ?auto_73258 - BLOCK
      ?auto_73261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73257 ?auto_73255 ) ( ON-TABLE ?auto_73254 ) ( ON ?auto_73255 ?auto_73254 ) ( not ( = ?auto_73254 ?auto_73255 ) ) ( not ( = ?auto_73254 ?auto_73257 ) ) ( not ( = ?auto_73255 ?auto_73257 ) ) ( not ( = ?auto_73254 ?auto_73259 ) ) ( not ( = ?auto_73254 ?auto_73260 ) ) ( not ( = ?auto_73255 ?auto_73259 ) ) ( not ( = ?auto_73255 ?auto_73260 ) ) ( not ( = ?auto_73257 ?auto_73259 ) ) ( not ( = ?auto_73257 ?auto_73260 ) ) ( not ( = ?auto_73259 ?auto_73260 ) ) ( ON ?auto_73259 ?auto_73257 ) ( not ( = ?auto_73256 ?auto_73258 ) ) ( not ( = ?auto_73256 ?auto_73260 ) ) ( not ( = ?auto_73258 ?auto_73260 ) ) ( not ( = ?auto_73254 ?auto_73258 ) ) ( not ( = ?auto_73254 ?auto_73256 ) ) ( not ( = ?auto_73255 ?auto_73258 ) ) ( not ( = ?auto_73255 ?auto_73256 ) ) ( not ( = ?auto_73257 ?auto_73258 ) ) ( not ( = ?auto_73257 ?auto_73256 ) ) ( not ( = ?auto_73259 ?auto_73258 ) ) ( not ( = ?auto_73259 ?auto_73256 ) ) ( ON ?auto_73260 ?auto_73259 ) ( ON ?auto_73256 ?auto_73261 ) ( CLEAR ?auto_73256 ) ( not ( = ?auto_73254 ?auto_73261 ) ) ( not ( = ?auto_73255 ?auto_73261 ) ) ( not ( = ?auto_73257 ?auto_73261 ) ) ( not ( = ?auto_73259 ?auto_73261 ) ) ( not ( = ?auto_73260 ?auto_73261 ) ) ( not ( = ?auto_73256 ?auto_73261 ) ) ( not ( = ?auto_73258 ?auto_73261 ) ) ( HOLDING ?auto_73258 ) ( CLEAR ?auto_73260 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73254 ?auto_73255 ?auto_73257 ?auto_73259 ?auto_73260 ?auto_73258 )
      ( MAKE-2PILE ?auto_73254 ?auto_73255 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73262 - BLOCK
      ?auto_73263 - BLOCK
    )
    :vars
    (
      ?auto_73266 - BLOCK
      ?auto_73269 - BLOCK
      ?auto_73265 - BLOCK
      ?auto_73267 - BLOCK
      ?auto_73264 - BLOCK
      ?auto_73268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73266 ?auto_73263 ) ( ON-TABLE ?auto_73262 ) ( ON ?auto_73263 ?auto_73262 ) ( not ( = ?auto_73262 ?auto_73263 ) ) ( not ( = ?auto_73262 ?auto_73266 ) ) ( not ( = ?auto_73263 ?auto_73266 ) ) ( not ( = ?auto_73262 ?auto_73269 ) ) ( not ( = ?auto_73262 ?auto_73265 ) ) ( not ( = ?auto_73263 ?auto_73269 ) ) ( not ( = ?auto_73263 ?auto_73265 ) ) ( not ( = ?auto_73266 ?auto_73269 ) ) ( not ( = ?auto_73266 ?auto_73265 ) ) ( not ( = ?auto_73269 ?auto_73265 ) ) ( ON ?auto_73269 ?auto_73266 ) ( not ( = ?auto_73267 ?auto_73264 ) ) ( not ( = ?auto_73267 ?auto_73265 ) ) ( not ( = ?auto_73264 ?auto_73265 ) ) ( not ( = ?auto_73262 ?auto_73264 ) ) ( not ( = ?auto_73262 ?auto_73267 ) ) ( not ( = ?auto_73263 ?auto_73264 ) ) ( not ( = ?auto_73263 ?auto_73267 ) ) ( not ( = ?auto_73266 ?auto_73264 ) ) ( not ( = ?auto_73266 ?auto_73267 ) ) ( not ( = ?auto_73269 ?auto_73264 ) ) ( not ( = ?auto_73269 ?auto_73267 ) ) ( ON ?auto_73265 ?auto_73269 ) ( ON ?auto_73267 ?auto_73268 ) ( not ( = ?auto_73262 ?auto_73268 ) ) ( not ( = ?auto_73263 ?auto_73268 ) ) ( not ( = ?auto_73266 ?auto_73268 ) ) ( not ( = ?auto_73269 ?auto_73268 ) ) ( not ( = ?auto_73265 ?auto_73268 ) ) ( not ( = ?auto_73267 ?auto_73268 ) ) ( not ( = ?auto_73264 ?auto_73268 ) ) ( CLEAR ?auto_73265 ) ( ON ?auto_73264 ?auto_73267 ) ( CLEAR ?auto_73264 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73268 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73268 ?auto_73267 )
      ( MAKE-2PILE ?auto_73262 ?auto_73263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73270 - BLOCK
      ?auto_73271 - BLOCK
    )
    :vars
    (
      ?auto_73274 - BLOCK
      ?auto_73275 - BLOCK
      ?auto_73277 - BLOCK
      ?auto_73272 - BLOCK
      ?auto_73276 - BLOCK
      ?auto_73273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73274 ?auto_73271 ) ( ON-TABLE ?auto_73270 ) ( ON ?auto_73271 ?auto_73270 ) ( not ( = ?auto_73270 ?auto_73271 ) ) ( not ( = ?auto_73270 ?auto_73274 ) ) ( not ( = ?auto_73271 ?auto_73274 ) ) ( not ( = ?auto_73270 ?auto_73275 ) ) ( not ( = ?auto_73270 ?auto_73277 ) ) ( not ( = ?auto_73271 ?auto_73275 ) ) ( not ( = ?auto_73271 ?auto_73277 ) ) ( not ( = ?auto_73274 ?auto_73275 ) ) ( not ( = ?auto_73274 ?auto_73277 ) ) ( not ( = ?auto_73275 ?auto_73277 ) ) ( ON ?auto_73275 ?auto_73274 ) ( not ( = ?auto_73272 ?auto_73276 ) ) ( not ( = ?auto_73272 ?auto_73277 ) ) ( not ( = ?auto_73276 ?auto_73277 ) ) ( not ( = ?auto_73270 ?auto_73276 ) ) ( not ( = ?auto_73270 ?auto_73272 ) ) ( not ( = ?auto_73271 ?auto_73276 ) ) ( not ( = ?auto_73271 ?auto_73272 ) ) ( not ( = ?auto_73274 ?auto_73276 ) ) ( not ( = ?auto_73274 ?auto_73272 ) ) ( not ( = ?auto_73275 ?auto_73276 ) ) ( not ( = ?auto_73275 ?auto_73272 ) ) ( ON ?auto_73272 ?auto_73273 ) ( not ( = ?auto_73270 ?auto_73273 ) ) ( not ( = ?auto_73271 ?auto_73273 ) ) ( not ( = ?auto_73274 ?auto_73273 ) ) ( not ( = ?auto_73275 ?auto_73273 ) ) ( not ( = ?auto_73277 ?auto_73273 ) ) ( not ( = ?auto_73272 ?auto_73273 ) ) ( not ( = ?auto_73276 ?auto_73273 ) ) ( ON ?auto_73276 ?auto_73272 ) ( CLEAR ?auto_73276 ) ( ON-TABLE ?auto_73273 ) ( HOLDING ?auto_73277 ) ( CLEAR ?auto_73275 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73270 ?auto_73271 ?auto_73274 ?auto_73275 ?auto_73277 )
      ( MAKE-2PILE ?auto_73270 ?auto_73271 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73321 - BLOCK
      ?auto_73322 - BLOCK
      ?auto_73323 - BLOCK
      ?auto_73324 - BLOCK
      ?auto_73325 - BLOCK
    )
    :vars
    (
      ?auto_73326 - BLOCK
      ?auto_73327 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73321 ) ( ON ?auto_73322 ?auto_73321 ) ( ON ?auto_73323 ?auto_73322 ) ( not ( = ?auto_73321 ?auto_73322 ) ) ( not ( = ?auto_73321 ?auto_73323 ) ) ( not ( = ?auto_73321 ?auto_73324 ) ) ( not ( = ?auto_73321 ?auto_73325 ) ) ( not ( = ?auto_73322 ?auto_73323 ) ) ( not ( = ?auto_73322 ?auto_73324 ) ) ( not ( = ?auto_73322 ?auto_73325 ) ) ( not ( = ?auto_73323 ?auto_73324 ) ) ( not ( = ?auto_73323 ?auto_73325 ) ) ( not ( = ?auto_73324 ?auto_73325 ) ) ( ON ?auto_73325 ?auto_73326 ) ( not ( = ?auto_73321 ?auto_73326 ) ) ( not ( = ?auto_73322 ?auto_73326 ) ) ( not ( = ?auto_73323 ?auto_73326 ) ) ( not ( = ?auto_73324 ?auto_73326 ) ) ( not ( = ?auto_73325 ?auto_73326 ) ) ( CLEAR ?auto_73323 ) ( ON ?auto_73324 ?auto_73325 ) ( CLEAR ?auto_73324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73327 ) ( ON ?auto_73326 ?auto_73327 ) ( not ( = ?auto_73327 ?auto_73326 ) ) ( not ( = ?auto_73327 ?auto_73325 ) ) ( not ( = ?auto_73327 ?auto_73324 ) ) ( not ( = ?auto_73321 ?auto_73327 ) ) ( not ( = ?auto_73322 ?auto_73327 ) ) ( not ( = ?auto_73323 ?auto_73327 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73327 ?auto_73326 ?auto_73325 )
      ( MAKE-5PILE ?auto_73321 ?auto_73322 ?auto_73323 ?auto_73324 ?auto_73325 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73328 - BLOCK
      ?auto_73329 - BLOCK
      ?auto_73330 - BLOCK
      ?auto_73331 - BLOCK
      ?auto_73332 - BLOCK
    )
    :vars
    (
      ?auto_73334 - BLOCK
      ?auto_73333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73328 ) ( ON ?auto_73329 ?auto_73328 ) ( not ( = ?auto_73328 ?auto_73329 ) ) ( not ( = ?auto_73328 ?auto_73330 ) ) ( not ( = ?auto_73328 ?auto_73331 ) ) ( not ( = ?auto_73328 ?auto_73332 ) ) ( not ( = ?auto_73329 ?auto_73330 ) ) ( not ( = ?auto_73329 ?auto_73331 ) ) ( not ( = ?auto_73329 ?auto_73332 ) ) ( not ( = ?auto_73330 ?auto_73331 ) ) ( not ( = ?auto_73330 ?auto_73332 ) ) ( not ( = ?auto_73331 ?auto_73332 ) ) ( ON ?auto_73332 ?auto_73334 ) ( not ( = ?auto_73328 ?auto_73334 ) ) ( not ( = ?auto_73329 ?auto_73334 ) ) ( not ( = ?auto_73330 ?auto_73334 ) ) ( not ( = ?auto_73331 ?auto_73334 ) ) ( not ( = ?auto_73332 ?auto_73334 ) ) ( ON ?auto_73331 ?auto_73332 ) ( CLEAR ?auto_73331 ) ( ON-TABLE ?auto_73333 ) ( ON ?auto_73334 ?auto_73333 ) ( not ( = ?auto_73333 ?auto_73334 ) ) ( not ( = ?auto_73333 ?auto_73332 ) ) ( not ( = ?auto_73333 ?auto_73331 ) ) ( not ( = ?auto_73328 ?auto_73333 ) ) ( not ( = ?auto_73329 ?auto_73333 ) ) ( not ( = ?auto_73330 ?auto_73333 ) ) ( HOLDING ?auto_73330 ) ( CLEAR ?auto_73329 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73328 ?auto_73329 ?auto_73330 )
      ( MAKE-5PILE ?auto_73328 ?auto_73329 ?auto_73330 ?auto_73331 ?auto_73332 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73335 - BLOCK
      ?auto_73336 - BLOCK
      ?auto_73337 - BLOCK
      ?auto_73338 - BLOCK
      ?auto_73339 - BLOCK
    )
    :vars
    (
      ?auto_73341 - BLOCK
      ?auto_73340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73335 ) ( ON ?auto_73336 ?auto_73335 ) ( not ( = ?auto_73335 ?auto_73336 ) ) ( not ( = ?auto_73335 ?auto_73337 ) ) ( not ( = ?auto_73335 ?auto_73338 ) ) ( not ( = ?auto_73335 ?auto_73339 ) ) ( not ( = ?auto_73336 ?auto_73337 ) ) ( not ( = ?auto_73336 ?auto_73338 ) ) ( not ( = ?auto_73336 ?auto_73339 ) ) ( not ( = ?auto_73337 ?auto_73338 ) ) ( not ( = ?auto_73337 ?auto_73339 ) ) ( not ( = ?auto_73338 ?auto_73339 ) ) ( ON ?auto_73339 ?auto_73341 ) ( not ( = ?auto_73335 ?auto_73341 ) ) ( not ( = ?auto_73336 ?auto_73341 ) ) ( not ( = ?auto_73337 ?auto_73341 ) ) ( not ( = ?auto_73338 ?auto_73341 ) ) ( not ( = ?auto_73339 ?auto_73341 ) ) ( ON ?auto_73338 ?auto_73339 ) ( ON-TABLE ?auto_73340 ) ( ON ?auto_73341 ?auto_73340 ) ( not ( = ?auto_73340 ?auto_73341 ) ) ( not ( = ?auto_73340 ?auto_73339 ) ) ( not ( = ?auto_73340 ?auto_73338 ) ) ( not ( = ?auto_73335 ?auto_73340 ) ) ( not ( = ?auto_73336 ?auto_73340 ) ) ( not ( = ?auto_73337 ?auto_73340 ) ) ( CLEAR ?auto_73336 ) ( ON ?auto_73337 ?auto_73338 ) ( CLEAR ?auto_73337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73340 ?auto_73341 ?auto_73339 ?auto_73338 )
      ( MAKE-5PILE ?auto_73335 ?auto_73336 ?auto_73337 ?auto_73338 ?auto_73339 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73342 - BLOCK
      ?auto_73343 - BLOCK
      ?auto_73344 - BLOCK
      ?auto_73345 - BLOCK
      ?auto_73346 - BLOCK
    )
    :vars
    (
      ?auto_73348 - BLOCK
      ?auto_73347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73342 ) ( not ( = ?auto_73342 ?auto_73343 ) ) ( not ( = ?auto_73342 ?auto_73344 ) ) ( not ( = ?auto_73342 ?auto_73345 ) ) ( not ( = ?auto_73342 ?auto_73346 ) ) ( not ( = ?auto_73343 ?auto_73344 ) ) ( not ( = ?auto_73343 ?auto_73345 ) ) ( not ( = ?auto_73343 ?auto_73346 ) ) ( not ( = ?auto_73344 ?auto_73345 ) ) ( not ( = ?auto_73344 ?auto_73346 ) ) ( not ( = ?auto_73345 ?auto_73346 ) ) ( ON ?auto_73346 ?auto_73348 ) ( not ( = ?auto_73342 ?auto_73348 ) ) ( not ( = ?auto_73343 ?auto_73348 ) ) ( not ( = ?auto_73344 ?auto_73348 ) ) ( not ( = ?auto_73345 ?auto_73348 ) ) ( not ( = ?auto_73346 ?auto_73348 ) ) ( ON ?auto_73345 ?auto_73346 ) ( ON-TABLE ?auto_73347 ) ( ON ?auto_73348 ?auto_73347 ) ( not ( = ?auto_73347 ?auto_73348 ) ) ( not ( = ?auto_73347 ?auto_73346 ) ) ( not ( = ?auto_73347 ?auto_73345 ) ) ( not ( = ?auto_73342 ?auto_73347 ) ) ( not ( = ?auto_73343 ?auto_73347 ) ) ( not ( = ?auto_73344 ?auto_73347 ) ) ( ON ?auto_73344 ?auto_73345 ) ( CLEAR ?auto_73344 ) ( HOLDING ?auto_73343 ) ( CLEAR ?auto_73342 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73342 ?auto_73343 )
      ( MAKE-5PILE ?auto_73342 ?auto_73343 ?auto_73344 ?auto_73345 ?auto_73346 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73349 - BLOCK
      ?auto_73350 - BLOCK
      ?auto_73351 - BLOCK
      ?auto_73352 - BLOCK
      ?auto_73353 - BLOCK
    )
    :vars
    (
      ?auto_73355 - BLOCK
      ?auto_73354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73349 ) ( not ( = ?auto_73349 ?auto_73350 ) ) ( not ( = ?auto_73349 ?auto_73351 ) ) ( not ( = ?auto_73349 ?auto_73352 ) ) ( not ( = ?auto_73349 ?auto_73353 ) ) ( not ( = ?auto_73350 ?auto_73351 ) ) ( not ( = ?auto_73350 ?auto_73352 ) ) ( not ( = ?auto_73350 ?auto_73353 ) ) ( not ( = ?auto_73351 ?auto_73352 ) ) ( not ( = ?auto_73351 ?auto_73353 ) ) ( not ( = ?auto_73352 ?auto_73353 ) ) ( ON ?auto_73353 ?auto_73355 ) ( not ( = ?auto_73349 ?auto_73355 ) ) ( not ( = ?auto_73350 ?auto_73355 ) ) ( not ( = ?auto_73351 ?auto_73355 ) ) ( not ( = ?auto_73352 ?auto_73355 ) ) ( not ( = ?auto_73353 ?auto_73355 ) ) ( ON ?auto_73352 ?auto_73353 ) ( ON-TABLE ?auto_73354 ) ( ON ?auto_73355 ?auto_73354 ) ( not ( = ?auto_73354 ?auto_73355 ) ) ( not ( = ?auto_73354 ?auto_73353 ) ) ( not ( = ?auto_73354 ?auto_73352 ) ) ( not ( = ?auto_73349 ?auto_73354 ) ) ( not ( = ?auto_73350 ?auto_73354 ) ) ( not ( = ?auto_73351 ?auto_73354 ) ) ( ON ?auto_73351 ?auto_73352 ) ( CLEAR ?auto_73349 ) ( ON ?auto_73350 ?auto_73351 ) ( CLEAR ?auto_73350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73354 ?auto_73355 ?auto_73353 ?auto_73352 ?auto_73351 )
      ( MAKE-5PILE ?auto_73349 ?auto_73350 ?auto_73351 ?auto_73352 ?auto_73353 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73356 - BLOCK
      ?auto_73357 - BLOCK
      ?auto_73358 - BLOCK
      ?auto_73359 - BLOCK
      ?auto_73360 - BLOCK
    )
    :vars
    (
      ?auto_73361 - BLOCK
      ?auto_73362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73356 ?auto_73357 ) ) ( not ( = ?auto_73356 ?auto_73358 ) ) ( not ( = ?auto_73356 ?auto_73359 ) ) ( not ( = ?auto_73356 ?auto_73360 ) ) ( not ( = ?auto_73357 ?auto_73358 ) ) ( not ( = ?auto_73357 ?auto_73359 ) ) ( not ( = ?auto_73357 ?auto_73360 ) ) ( not ( = ?auto_73358 ?auto_73359 ) ) ( not ( = ?auto_73358 ?auto_73360 ) ) ( not ( = ?auto_73359 ?auto_73360 ) ) ( ON ?auto_73360 ?auto_73361 ) ( not ( = ?auto_73356 ?auto_73361 ) ) ( not ( = ?auto_73357 ?auto_73361 ) ) ( not ( = ?auto_73358 ?auto_73361 ) ) ( not ( = ?auto_73359 ?auto_73361 ) ) ( not ( = ?auto_73360 ?auto_73361 ) ) ( ON ?auto_73359 ?auto_73360 ) ( ON-TABLE ?auto_73362 ) ( ON ?auto_73361 ?auto_73362 ) ( not ( = ?auto_73362 ?auto_73361 ) ) ( not ( = ?auto_73362 ?auto_73360 ) ) ( not ( = ?auto_73362 ?auto_73359 ) ) ( not ( = ?auto_73356 ?auto_73362 ) ) ( not ( = ?auto_73357 ?auto_73362 ) ) ( not ( = ?auto_73358 ?auto_73362 ) ) ( ON ?auto_73358 ?auto_73359 ) ( ON ?auto_73357 ?auto_73358 ) ( CLEAR ?auto_73357 ) ( HOLDING ?auto_73356 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73356 )
      ( MAKE-5PILE ?auto_73356 ?auto_73357 ?auto_73358 ?auto_73359 ?auto_73360 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73363 - BLOCK
      ?auto_73364 - BLOCK
      ?auto_73365 - BLOCK
      ?auto_73366 - BLOCK
      ?auto_73367 - BLOCK
    )
    :vars
    (
      ?auto_73369 - BLOCK
      ?auto_73368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73363 ?auto_73364 ) ) ( not ( = ?auto_73363 ?auto_73365 ) ) ( not ( = ?auto_73363 ?auto_73366 ) ) ( not ( = ?auto_73363 ?auto_73367 ) ) ( not ( = ?auto_73364 ?auto_73365 ) ) ( not ( = ?auto_73364 ?auto_73366 ) ) ( not ( = ?auto_73364 ?auto_73367 ) ) ( not ( = ?auto_73365 ?auto_73366 ) ) ( not ( = ?auto_73365 ?auto_73367 ) ) ( not ( = ?auto_73366 ?auto_73367 ) ) ( ON ?auto_73367 ?auto_73369 ) ( not ( = ?auto_73363 ?auto_73369 ) ) ( not ( = ?auto_73364 ?auto_73369 ) ) ( not ( = ?auto_73365 ?auto_73369 ) ) ( not ( = ?auto_73366 ?auto_73369 ) ) ( not ( = ?auto_73367 ?auto_73369 ) ) ( ON ?auto_73366 ?auto_73367 ) ( ON-TABLE ?auto_73368 ) ( ON ?auto_73369 ?auto_73368 ) ( not ( = ?auto_73368 ?auto_73369 ) ) ( not ( = ?auto_73368 ?auto_73367 ) ) ( not ( = ?auto_73368 ?auto_73366 ) ) ( not ( = ?auto_73363 ?auto_73368 ) ) ( not ( = ?auto_73364 ?auto_73368 ) ) ( not ( = ?auto_73365 ?auto_73368 ) ) ( ON ?auto_73365 ?auto_73366 ) ( ON ?auto_73364 ?auto_73365 ) ( ON ?auto_73363 ?auto_73364 ) ( CLEAR ?auto_73363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73368 ?auto_73369 ?auto_73367 ?auto_73366 ?auto_73365 ?auto_73364 )
      ( MAKE-5PILE ?auto_73363 ?auto_73364 ?auto_73365 ?auto_73366 ?auto_73367 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73375 - BLOCK
      ?auto_73376 - BLOCK
      ?auto_73377 - BLOCK
      ?auto_73378 - BLOCK
      ?auto_73379 - BLOCK
    )
    :vars
    (
      ?auto_73381 - BLOCK
      ?auto_73380 - BLOCK
      ?auto_73382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73375 ?auto_73376 ) ) ( not ( = ?auto_73375 ?auto_73377 ) ) ( not ( = ?auto_73375 ?auto_73378 ) ) ( not ( = ?auto_73375 ?auto_73379 ) ) ( not ( = ?auto_73376 ?auto_73377 ) ) ( not ( = ?auto_73376 ?auto_73378 ) ) ( not ( = ?auto_73376 ?auto_73379 ) ) ( not ( = ?auto_73377 ?auto_73378 ) ) ( not ( = ?auto_73377 ?auto_73379 ) ) ( not ( = ?auto_73378 ?auto_73379 ) ) ( ON ?auto_73379 ?auto_73381 ) ( not ( = ?auto_73375 ?auto_73381 ) ) ( not ( = ?auto_73376 ?auto_73381 ) ) ( not ( = ?auto_73377 ?auto_73381 ) ) ( not ( = ?auto_73378 ?auto_73381 ) ) ( not ( = ?auto_73379 ?auto_73381 ) ) ( ON ?auto_73378 ?auto_73379 ) ( ON-TABLE ?auto_73380 ) ( ON ?auto_73381 ?auto_73380 ) ( not ( = ?auto_73380 ?auto_73381 ) ) ( not ( = ?auto_73380 ?auto_73379 ) ) ( not ( = ?auto_73380 ?auto_73378 ) ) ( not ( = ?auto_73375 ?auto_73380 ) ) ( not ( = ?auto_73376 ?auto_73380 ) ) ( not ( = ?auto_73377 ?auto_73380 ) ) ( ON ?auto_73377 ?auto_73378 ) ( ON ?auto_73376 ?auto_73377 ) ( CLEAR ?auto_73376 ) ( ON ?auto_73375 ?auto_73382 ) ( CLEAR ?auto_73375 ) ( HAND-EMPTY ) ( not ( = ?auto_73375 ?auto_73382 ) ) ( not ( = ?auto_73376 ?auto_73382 ) ) ( not ( = ?auto_73377 ?auto_73382 ) ) ( not ( = ?auto_73378 ?auto_73382 ) ) ( not ( = ?auto_73379 ?auto_73382 ) ) ( not ( = ?auto_73381 ?auto_73382 ) ) ( not ( = ?auto_73380 ?auto_73382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73375 ?auto_73382 )
      ( MAKE-5PILE ?auto_73375 ?auto_73376 ?auto_73377 ?auto_73378 ?auto_73379 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73383 - BLOCK
      ?auto_73384 - BLOCK
      ?auto_73385 - BLOCK
      ?auto_73386 - BLOCK
      ?auto_73387 - BLOCK
    )
    :vars
    (
      ?auto_73389 - BLOCK
      ?auto_73390 - BLOCK
      ?auto_73388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73383 ?auto_73384 ) ) ( not ( = ?auto_73383 ?auto_73385 ) ) ( not ( = ?auto_73383 ?auto_73386 ) ) ( not ( = ?auto_73383 ?auto_73387 ) ) ( not ( = ?auto_73384 ?auto_73385 ) ) ( not ( = ?auto_73384 ?auto_73386 ) ) ( not ( = ?auto_73384 ?auto_73387 ) ) ( not ( = ?auto_73385 ?auto_73386 ) ) ( not ( = ?auto_73385 ?auto_73387 ) ) ( not ( = ?auto_73386 ?auto_73387 ) ) ( ON ?auto_73387 ?auto_73389 ) ( not ( = ?auto_73383 ?auto_73389 ) ) ( not ( = ?auto_73384 ?auto_73389 ) ) ( not ( = ?auto_73385 ?auto_73389 ) ) ( not ( = ?auto_73386 ?auto_73389 ) ) ( not ( = ?auto_73387 ?auto_73389 ) ) ( ON ?auto_73386 ?auto_73387 ) ( ON-TABLE ?auto_73390 ) ( ON ?auto_73389 ?auto_73390 ) ( not ( = ?auto_73390 ?auto_73389 ) ) ( not ( = ?auto_73390 ?auto_73387 ) ) ( not ( = ?auto_73390 ?auto_73386 ) ) ( not ( = ?auto_73383 ?auto_73390 ) ) ( not ( = ?auto_73384 ?auto_73390 ) ) ( not ( = ?auto_73385 ?auto_73390 ) ) ( ON ?auto_73385 ?auto_73386 ) ( ON ?auto_73383 ?auto_73388 ) ( CLEAR ?auto_73383 ) ( not ( = ?auto_73383 ?auto_73388 ) ) ( not ( = ?auto_73384 ?auto_73388 ) ) ( not ( = ?auto_73385 ?auto_73388 ) ) ( not ( = ?auto_73386 ?auto_73388 ) ) ( not ( = ?auto_73387 ?auto_73388 ) ) ( not ( = ?auto_73389 ?auto_73388 ) ) ( not ( = ?auto_73390 ?auto_73388 ) ) ( HOLDING ?auto_73384 ) ( CLEAR ?auto_73385 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73390 ?auto_73389 ?auto_73387 ?auto_73386 ?auto_73385 ?auto_73384 )
      ( MAKE-5PILE ?auto_73383 ?auto_73384 ?auto_73385 ?auto_73386 ?auto_73387 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73391 - BLOCK
      ?auto_73392 - BLOCK
      ?auto_73393 - BLOCK
      ?auto_73394 - BLOCK
      ?auto_73395 - BLOCK
    )
    :vars
    (
      ?auto_73396 - BLOCK
      ?auto_73398 - BLOCK
      ?auto_73397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73391 ?auto_73392 ) ) ( not ( = ?auto_73391 ?auto_73393 ) ) ( not ( = ?auto_73391 ?auto_73394 ) ) ( not ( = ?auto_73391 ?auto_73395 ) ) ( not ( = ?auto_73392 ?auto_73393 ) ) ( not ( = ?auto_73392 ?auto_73394 ) ) ( not ( = ?auto_73392 ?auto_73395 ) ) ( not ( = ?auto_73393 ?auto_73394 ) ) ( not ( = ?auto_73393 ?auto_73395 ) ) ( not ( = ?auto_73394 ?auto_73395 ) ) ( ON ?auto_73395 ?auto_73396 ) ( not ( = ?auto_73391 ?auto_73396 ) ) ( not ( = ?auto_73392 ?auto_73396 ) ) ( not ( = ?auto_73393 ?auto_73396 ) ) ( not ( = ?auto_73394 ?auto_73396 ) ) ( not ( = ?auto_73395 ?auto_73396 ) ) ( ON ?auto_73394 ?auto_73395 ) ( ON-TABLE ?auto_73398 ) ( ON ?auto_73396 ?auto_73398 ) ( not ( = ?auto_73398 ?auto_73396 ) ) ( not ( = ?auto_73398 ?auto_73395 ) ) ( not ( = ?auto_73398 ?auto_73394 ) ) ( not ( = ?auto_73391 ?auto_73398 ) ) ( not ( = ?auto_73392 ?auto_73398 ) ) ( not ( = ?auto_73393 ?auto_73398 ) ) ( ON ?auto_73393 ?auto_73394 ) ( ON ?auto_73391 ?auto_73397 ) ( not ( = ?auto_73391 ?auto_73397 ) ) ( not ( = ?auto_73392 ?auto_73397 ) ) ( not ( = ?auto_73393 ?auto_73397 ) ) ( not ( = ?auto_73394 ?auto_73397 ) ) ( not ( = ?auto_73395 ?auto_73397 ) ) ( not ( = ?auto_73396 ?auto_73397 ) ) ( not ( = ?auto_73398 ?auto_73397 ) ) ( CLEAR ?auto_73393 ) ( ON ?auto_73392 ?auto_73391 ) ( CLEAR ?auto_73392 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73397 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73397 ?auto_73391 )
      ( MAKE-5PILE ?auto_73391 ?auto_73392 ?auto_73393 ?auto_73394 ?auto_73395 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73399 - BLOCK
      ?auto_73400 - BLOCK
      ?auto_73401 - BLOCK
      ?auto_73402 - BLOCK
      ?auto_73403 - BLOCK
    )
    :vars
    (
      ?auto_73405 - BLOCK
      ?auto_73404 - BLOCK
      ?auto_73406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73399 ?auto_73400 ) ) ( not ( = ?auto_73399 ?auto_73401 ) ) ( not ( = ?auto_73399 ?auto_73402 ) ) ( not ( = ?auto_73399 ?auto_73403 ) ) ( not ( = ?auto_73400 ?auto_73401 ) ) ( not ( = ?auto_73400 ?auto_73402 ) ) ( not ( = ?auto_73400 ?auto_73403 ) ) ( not ( = ?auto_73401 ?auto_73402 ) ) ( not ( = ?auto_73401 ?auto_73403 ) ) ( not ( = ?auto_73402 ?auto_73403 ) ) ( ON ?auto_73403 ?auto_73405 ) ( not ( = ?auto_73399 ?auto_73405 ) ) ( not ( = ?auto_73400 ?auto_73405 ) ) ( not ( = ?auto_73401 ?auto_73405 ) ) ( not ( = ?auto_73402 ?auto_73405 ) ) ( not ( = ?auto_73403 ?auto_73405 ) ) ( ON ?auto_73402 ?auto_73403 ) ( ON-TABLE ?auto_73404 ) ( ON ?auto_73405 ?auto_73404 ) ( not ( = ?auto_73404 ?auto_73405 ) ) ( not ( = ?auto_73404 ?auto_73403 ) ) ( not ( = ?auto_73404 ?auto_73402 ) ) ( not ( = ?auto_73399 ?auto_73404 ) ) ( not ( = ?auto_73400 ?auto_73404 ) ) ( not ( = ?auto_73401 ?auto_73404 ) ) ( ON ?auto_73399 ?auto_73406 ) ( not ( = ?auto_73399 ?auto_73406 ) ) ( not ( = ?auto_73400 ?auto_73406 ) ) ( not ( = ?auto_73401 ?auto_73406 ) ) ( not ( = ?auto_73402 ?auto_73406 ) ) ( not ( = ?auto_73403 ?auto_73406 ) ) ( not ( = ?auto_73405 ?auto_73406 ) ) ( not ( = ?auto_73404 ?auto_73406 ) ) ( ON ?auto_73400 ?auto_73399 ) ( CLEAR ?auto_73400 ) ( ON-TABLE ?auto_73406 ) ( HOLDING ?auto_73401 ) ( CLEAR ?auto_73402 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73404 ?auto_73405 ?auto_73403 ?auto_73402 ?auto_73401 )
      ( MAKE-5PILE ?auto_73399 ?auto_73400 ?auto_73401 ?auto_73402 ?auto_73403 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73407 - BLOCK
      ?auto_73408 - BLOCK
      ?auto_73409 - BLOCK
      ?auto_73410 - BLOCK
      ?auto_73411 - BLOCK
    )
    :vars
    (
      ?auto_73414 - BLOCK
      ?auto_73412 - BLOCK
      ?auto_73413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73407 ?auto_73408 ) ) ( not ( = ?auto_73407 ?auto_73409 ) ) ( not ( = ?auto_73407 ?auto_73410 ) ) ( not ( = ?auto_73407 ?auto_73411 ) ) ( not ( = ?auto_73408 ?auto_73409 ) ) ( not ( = ?auto_73408 ?auto_73410 ) ) ( not ( = ?auto_73408 ?auto_73411 ) ) ( not ( = ?auto_73409 ?auto_73410 ) ) ( not ( = ?auto_73409 ?auto_73411 ) ) ( not ( = ?auto_73410 ?auto_73411 ) ) ( ON ?auto_73411 ?auto_73414 ) ( not ( = ?auto_73407 ?auto_73414 ) ) ( not ( = ?auto_73408 ?auto_73414 ) ) ( not ( = ?auto_73409 ?auto_73414 ) ) ( not ( = ?auto_73410 ?auto_73414 ) ) ( not ( = ?auto_73411 ?auto_73414 ) ) ( ON ?auto_73410 ?auto_73411 ) ( ON-TABLE ?auto_73412 ) ( ON ?auto_73414 ?auto_73412 ) ( not ( = ?auto_73412 ?auto_73414 ) ) ( not ( = ?auto_73412 ?auto_73411 ) ) ( not ( = ?auto_73412 ?auto_73410 ) ) ( not ( = ?auto_73407 ?auto_73412 ) ) ( not ( = ?auto_73408 ?auto_73412 ) ) ( not ( = ?auto_73409 ?auto_73412 ) ) ( ON ?auto_73407 ?auto_73413 ) ( not ( = ?auto_73407 ?auto_73413 ) ) ( not ( = ?auto_73408 ?auto_73413 ) ) ( not ( = ?auto_73409 ?auto_73413 ) ) ( not ( = ?auto_73410 ?auto_73413 ) ) ( not ( = ?auto_73411 ?auto_73413 ) ) ( not ( = ?auto_73414 ?auto_73413 ) ) ( not ( = ?auto_73412 ?auto_73413 ) ) ( ON ?auto_73408 ?auto_73407 ) ( ON-TABLE ?auto_73413 ) ( CLEAR ?auto_73410 ) ( ON ?auto_73409 ?auto_73408 ) ( CLEAR ?auto_73409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73413 ?auto_73407 ?auto_73408 )
      ( MAKE-5PILE ?auto_73407 ?auto_73408 ?auto_73409 ?auto_73410 ?auto_73411 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73415 - BLOCK
      ?auto_73416 - BLOCK
      ?auto_73417 - BLOCK
      ?auto_73418 - BLOCK
      ?auto_73419 - BLOCK
    )
    :vars
    (
      ?auto_73420 - BLOCK
      ?auto_73421 - BLOCK
      ?auto_73422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73415 ?auto_73416 ) ) ( not ( = ?auto_73415 ?auto_73417 ) ) ( not ( = ?auto_73415 ?auto_73418 ) ) ( not ( = ?auto_73415 ?auto_73419 ) ) ( not ( = ?auto_73416 ?auto_73417 ) ) ( not ( = ?auto_73416 ?auto_73418 ) ) ( not ( = ?auto_73416 ?auto_73419 ) ) ( not ( = ?auto_73417 ?auto_73418 ) ) ( not ( = ?auto_73417 ?auto_73419 ) ) ( not ( = ?auto_73418 ?auto_73419 ) ) ( ON ?auto_73419 ?auto_73420 ) ( not ( = ?auto_73415 ?auto_73420 ) ) ( not ( = ?auto_73416 ?auto_73420 ) ) ( not ( = ?auto_73417 ?auto_73420 ) ) ( not ( = ?auto_73418 ?auto_73420 ) ) ( not ( = ?auto_73419 ?auto_73420 ) ) ( ON-TABLE ?auto_73421 ) ( ON ?auto_73420 ?auto_73421 ) ( not ( = ?auto_73421 ?auto_73420 ) ) ( not ( = ?auto_73421 ?auto_73419 ) ) ( not ( = ?auto_73421 ?auto_73418 ) ) ( not ( = ?auto_73415 ?auto_73421 ) ) ( not ( = ?auto_73416 ?auto_73421 ) ) ( not ( = ?auto_73417 ?auto_73421 ) ) ( ON ?auto_73415 ?auto_73422 ) ( not ( = ?auto_73415 ?auto_73422 ) ) ( not ( = ?auto_73416 ?auto_73422 ) ) ( not ( = ?auto_73417 ?auto_73422 ) ) ( not ( = ?auto_73418 ?auto_73422 ) ) ( not ( = ?auto_73419 ?auto_73422 ) ) ( not ( = ?auto_73420 ?auto_73422 ) ) ( not ( = ?auto_73421 ?auto_73422 ) ) ( ON ?auto_73416 ?auto_73415 ) ( ON-TABLE ?auto_73422 ) ( ON ?auto_73417 ?auto_73416 ) ( CLEAR ?auto_73417 ) ( HOLDING ?auto_73418 ) ( CLEAR ?auto_73419 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73421 ?auto_73420 ?auto_73419 ?auto_73418 )
      ( MAKE-5PILE ?auto_73415 ?auto_73416 ?auto_73417 ?auto_73418 ?auto_73419 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73423 - BLOCK
      ?auto_73424 - BLOCK
      ?auto_73425 - BLOCK
      ?auto_73426 - BLOCK
      ?auto_73427 - BLOCK
    )
    :vars
    (
      ?auto_73429 - BLOCK
      ?auto_73430 - BLOCK
      ?auto_73428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73423 ?auto_73424 ) ) ( not ( = ?auto_73423 ?auto_73425 ) ) ( not ( = ?auto_73423 ?auto_73426 ) ) ( not ( = ?auto_73423 ?auto_73427 ) ) ( not ( = ?auto_73424 ?auto_73425 ) ) ( not ( = ?auto_73424 ?auto_73426 ) ) ( not ( = ?auto_73424 ?auto_73427 ) ) ( not ( = ?auto_73425 ?auto_73426 ) ) ( not ( = ?auto_73425 ?auto_73427 ) ) ( not ( = ?auto_73426 ?auto_73427 ) ) ( ON ?auto_73427 ?auto_73429 ) ( not ( = ?auto_73423 ?auto_73429 ) ) ( not ( = ?auto_73424 ?auto_73429 ) ) ( not ( = ?auto_73425 ?auto_73429 ) ) ( not ( = ?auto_73426 ?auto_73429 ) ) ( not ( = ?auto_73427 ?auto_73429 ) ) ( ON-TABLE ?auto_73430 ) ( ON ?auto_73429 ?auto_73430 ) ( not ( = ?auto_73430 ?auto_73429 ) ) ( not ( = ?auto_73430 ?auto_73427 ) ) ( not ( = ?auto_73430 ?auto_73426 ) ) ( not ( = ?auto_73423 ?auto_73430 ) ) ( not ( = ?auto_73424 ?auto_73430 ) ) ( not ( = ?auto_73425 ?auto_73430 ) ) ( ON ?auto_73423 ?auto_73428 ) ( not ( = ?auto_73423 ?auto_73428 ) ) ( not ( = ?auto_73424 ?auto_73428 ) ) ( not ( = ?auto_73425 ?auto_73428 ) ) ( not ( = ?auto_73426 ?auto_73428 ) ) ( not ( = ?auto_73427 ?auto_73428 ) ) ( not ( = ?auto_73429 ?auto_73428 ) ) ( not ( = ?auto_73430 ?auto_73428 ) ) ( ON ?auto_73424 ?auto_73423 ) ( ON-TABLE ?auto_73428 ) ( ON ?auto_73425 ?auto_73424 ) ( CLEAR ?auto_73427 ) ( ON ?auto_73426 ?auto_73425 ) ( CLEAR ?auto_73426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73428 ?auto_73423 ?auto_73424 ?auto_73425 )
      ( MAKE-5PILE ?auto_73423 ?auto_73424 ?auto_73425 ?auto_73426 ?auto_73427 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73431 - BLOCK
      ?auto_73432 - BLOCK
      ?auto_73433 - BLOCK
      ?auto_73434 - BLOCK
      ?auto_73435 - BLOCK
    )
    :vars
    (
      ?auto_73437 - BLOCK
      ?auto_73438 - BLOCK
      ?auto_73436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73431 ?auto_73432 ) ) ( not ( = ?auto_73431 ?auto_73433 ) ) ( not ( = ?auto_73431 ?auto_73434 ) ) ( not ( = ?auto_73431 ?auto_73435 ) ) ( not ( = ?auto_73432 ?auto_73433 ) ) ( not ( = ?auto_73432 ?auto_73434 ) ) ( not ( = ?auto_73432 ?auto_73435 ) ) ( not ( = ?auto_73433 ?auto_73434 ) ) ( not ( = ?auto_73433 ?auto_73435 ) ) ( not ( = ?auto_73434 ?auto_73435 ) ) ( not ( = ?auto_73431 ?auto_73437 ) ) ( not ( = ?auto_73432 ?auto_73437 ) ) ( not ( = ?auto_73433 ?auto_73437 ) ) ( not ( = ?auto_73434 ?auto_73437 ) ) ( not ( = ?auto_73435 ?auto_73437 ) ) ( ON-TABLE ?auto_73438 ) ( ON ?auto_73437 ?auto_73438 ) ( not ( = ?auto_73438 ?auto_73437 ) ) ( not ( = ?auto_73438 ?auto_73435 ) ) ( not ( = ?auto_73438 ?auto_73434 ) ) ( not ( = ?auto_73431 ?auto_73438 ) ) ( not ( = ?auto_73432 ?auto_73438 ) ) ( not ( = ?auto_73433 ?auto_73438 ) ) ( ON ?auto_73431 ?auto_73436 ) ( not ( = ?auto_73431 ?auto_73436 ) ) ( not ( = ?auto_73432 ?auto_73436 ) ) ( not ( = ?auto_73433 ?auto_73436 ) ) ( not ( = ?auto_73434 ?auto_73436 ) ) ( not ( = ?auto_73435 ?auto_73436 ) ) ( not ( = ?auto_73437 ?auto_73436 ) ) ( not ( = ?auto_73438 ?auto_73436 ) ) ( ON ?auto_73432 ?auto_73431 ) ( ON-TABLE ?auto_73436 ) ( ON ?auto_73433 ?auto_73432 ) ( ON ?auto_73434 ?auto_73433 ) ( CLEAR ?auto_73434 ) ( HOLDING ?auto_73435 ) ( CLEAR ?auto_73437 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73438 ?auto_73437 ?auto_73435 )
      ( MAKE-5PILE ?auto_73431 ?auto_73432 ?auto_73433 ?auto_73434 ?auto_73435 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73439 - BLOCK
      ?auto_73440 - BLOCK
      ?auto_73441 - BLOCK
      ?auto_73442 - BLOCK
      ?auto_73443 - BLOCK
    )
    :vars
    (
      ?auto_73444 - BLOCK
      ?auto_73446 - BLOCK
      ?auto_73445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73439 ?auto_73440 ) ) ( not ( = ?auto_73439 ?auto_73441 ) ) ( not ( = ?auto_73439 ?auto_73442 ) ) ( not ( = ?auto_73439 ?auto_73443 ) ) ( not ( = ?auto_73440 ?auto_73441 ) ) ( not ( = ?auto_73440 ?auto_73442 ) ) ( not ( = ?auto_73440 ?auto_73443 ) ) ( not ( = ?auto_73441 ?auto_73442 ) ) ( not ( = ?auto_73441 ?auto_73443 ) ) ( not ( = ?auto_73442 ?auto_73443 ) ) ( not ( = ?auto_73439 ?auto_73444 ) ) ( not ( = ?auto_73440 ?auto_73444 ) ) ( not ( = ?auto_73441 ?auto_73444 ) ) ( not ( = ?auto_73442 ?auto_73444 ) ) ( not ( = ?auto_73443 ?auto_73444 ) ) ( ON-TABLE ?auto_73446 ) ( ON ?auto_73444 ?auto_73446 ) ( not ( = ?auto_73446 ?auto_73444 ) ) ( not ( = ?auto_73446 ?auto_73443 ) ) ( not ( = ?auto_73446 ?auto_73442 ) ) ( not ( = ?auto_73439 ?auto_73446 ) ) ( not ( = ?auto_73440 ?auto_73446 ) ) ( not ( = ?auto_73441 ?auto_73446 ) ) ( ON ?auto_73439 ?auto_73445 ) ( not ( = ?auto_73439 ?auto_73445 ) ) ( not ( = ?auto_73440 ?auto_73445 ) ) ( not ( = ?auto_73441 ?auto_73445 ) ) ( not ( = ?auto_73442 ?auto_73445 ) ) ( not ( = ?auto_73443 ?auto_73445 ) ) ( not ( = ?auto_73444 ?auto_73445 ) ) ( not ( = ?auto_73446 ?auto_73445 ) ) ( ON ?auto_73440 ?auto_73439 ) ( ON-TABLE ?auto_73445 ) ( ON ?auto_73441 ?auto_73440 ) ( ON ?auto_73442 ?auto_73441 ) ( CLEAR ?auto_73444 ) ( ON ?auto_73443 ?auto_73442 ) ( CLEAR ?auto_73443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73445 ?auto_73439 ?auto_73440 ?auto_73441 ?auto_73442 )
      ( MAKE-5PILE ?auto_73439 ?auto_73440 ?auto_73441 ?auto_73442 ?auto_73443 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73447 - BLOCK
      ?auto_73448 - BLOCK
      ?auto_73449 - BLOCK
      ?auto_73450 - BLOCK
      ?auto_73451 - BLOCK
    )
    :vars
    (
      ?auto_73452 - BLOCK
      ?auto_73453 - BLOCK
      ?auto_73454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73447 ?auto_73448 ) ) ( not ( = ?auto_73447 ?auto_73449 ) ) ( not ( = ?auto_73447 ?auto_73450 ) ) ( not ( = ?auto_73447 ?auto_73451 ) ) ( not ( = ?auto_73448 ?auto_73449 ) ) ( not ( = ?auto_73448 ?auto_73450 ) ) ( not ( = ?auto_73448 ?auto_73451 ) ) ( not ( = ?auto_73449 ?auto_73450 ) ) ( not ( = ?auto_73449 ?auto_73451 ) ) ( not ( = ?auto_73450 ?auto_73451 ) ) ( not ( = ?auto_73447 ?auto_73452 ) ) ( not ( = ?auto_73448 ?auto_73452 ) ) ( not ( = ?auto_73449 ?auto_73452 ) ) ( not ( = ?auto_73450 ?auto_73452 ) ) ( not ( = ?auto_73451 ?auto_73452 ) ) ( ON-TABLE ?auto_73453 ) ( not ( = ?auto_73453 ?auto_73452 ) ) ( not ( = ?auto_73453 ?auto_73451 ) ) ( not ( = ?auto_73453 ?auto_73450 ) ) ( not ( = ?auto_73447 ?auto_73453 ) ) ( not ( = ?auto_73448 ?auto_73453 ) ) ( not ( = ?auto_73449 ?auto_73453 ) ) ( ON ?auto_73447 ?auto_73454 ) ( not ( = ?auto_73447 ?auto_73454 ) ) ( not ( = ?auto_73448 ?auto_73454 ) ) ( not ( = ?auto_73449 ?auto_73454 ) ) ( not ( = ?auto_73450 ?auto_73454 ) ) ( not ( = ?auto_73451 ?auto_73454 ) ) ( not ( = ?auto_73452 ?auto_73454 ) ) ( not ( = ?auto_73453 ?auto_73454 ) ) ( ON ?auto_73448 ?auto_73447 ) ( ON-TABLE ?auto_73454 ) ( ON ?auto_73449 ?auto_73448 ) ( ON ?auto_73450 ?auto_73449 ) ( ON ?auto_73451 ?auto_73450 ) ( CLEAR ?auto_73451 ) ( HOLDING ?auto_73452 ) ( CLEAR ?auto_73453 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73453 ?auto_73452 )
      ( MAKE-5PILE ?auto_73447 ?auto_73448 ?auto_73449 ?auto_73450 ?auto_73451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73455 - BLOCK
      ?auto_73456 - BLOCK
      ?auto_73457 - BLOCK
      ?auto_73458 - BLOCK
      ?auto_73459 - BLOCK
    )
    :vars
    (
      ?auto_73460 - BLOCK
      ?auto_73462 - BLOCK
      ?auto_73461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73455 ?auto_73456 ) ) ( not ( = ?auto_73455 ?auto_73457 ) ) ( not ( = ?auto_73455 ?auto_73458 ) ) ( not ( = ?auto_73455 ?auto_73459 ) ) ( not ( = ?auto_73456 ?auto_73457 ) ) ( not ( = ?auto_73456 ?auto_73458 ) ) ( not ( = ?auto_73456 ?auto_73459 ) ) ( not ( = ?auto_73457 ?auto_73458 ) ) ( not ( = ?auto_73457 ?auto_73459 ) ) ( not ( = ?auto_73458 ?auto_73459 ) ) ( not ( = ?auto_73455 ?auto_73460 ) ) ( not ( = ?auto_73456 ?auto_73460 ) ) ( not ( = ?auto_73457 ?auto_73460 ) ) ( not ( = ?auto_73458 ?auto_73460 ) ) ( not ( = ?auto_73459 ?auto_73460 ) ) ( ON-TABLE ?auto_73462 ) ( not ( = ?auto_73462 ?auto_73460 ) ) ( not ( = ?auto_73462 ?auto_73459 ) ) ( not ( = ?auto_73462 ?auto_73458 ) ) ( not ( = ?auto_73455 ?auto_73462 ) ) ( not ( = ?auto_73456 ?auto_73462 ) ) ( not ( = ?auto_73457 ?auto_73462 ) ) ( ON ?auto_73455 ?auto_73461 ) ( not ( = ?auto_73455 ?auto_73461 ) ) ( not ( = ?auto_73456 ?auto_73461 ) ) ( not ( = ?auto_73457 ?auto_73461 ) ) ( not ( = ?auto_73458 ?auto_73461 ) ) ( not ( = ?auto_73459 ?auto_73461 ) ) ( not ( = ?auto_73460 ?auto_73461 ) ) ( not ( = ?auto_73462 ?auto_73461 ) ) ( ON ?auto_73456 ?auto_73455 ) ( ON-TABLE ?auto_73461 ) ( ON ?auto_73457 ?auto_73456 ) ( ON ?auto_73458 ?auto_73457 ) ( ON ?auto_73459 ?auto_73458 ) ( CLEAR ?auto_73462 ) ( ON ?auto_73460 ?auto_73459 ) ( CLEAR ?auto_73460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73461 ?auto_73455 ?auto_73456 ?auto_73457 ?auto_73458 ?auto_73459 )
      ( MAKE-5PILE ?auto_73455 ?auto_73456 ?auto_73457 ?auto_73458 ?auto_73459 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73463 - BLOCK
      ?auto_73464 - BLOCK
      ?auto_73465 - BLOCK
      ?auto_73466 - BLOCK
      ?auto_73467 - BLOCK
    )
    :vars
    (
      ?auto_73470 - BLOCK
      ?auto_73469 - BLOCK
      ?auto_73468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73463 ?auto_73464 ) ) ( not ( = ?auto_73463 ?auto_73465 ) ) ( not ( = ?auto_73463 ?auto_73466 ) ) ( not ( = ?auto_73463 ?auto_73467 ) ) ( not ( = ?auto_73464 ?auto_73465 ) ) ( not ( = ?auto_73464 ?auto_73466 ) ) ( not ( = ?auto_73464 ?auto_73467 ) ) ( not ( = ?auto_73465 ?auto_73466 ) ) ( not ( = ?auto_73465 ?auto_73467 ) ) ( not ( = ?auto_73466 ?auto_73467 ) ) ( not ( = ?auto_73463 ?auto_73470 ) ) ( not ( = ?auto_73464 ?auto_73470 ) ) ( not ( = ?auto_73465 ?auto_73470 ) ) ( not ( = ?auto_73466 ?auto_73470 ) ) ( not ( = ?auto_73467 ?auto_73470 ) ) ( not ( = ?auto_73469 ?auto_73470 ) ) ( not ( = ?auto_73469 ?auto_73467 ) ) ( not ( = ?auto_73469 ?auto_73466 ) ) ( not ( = ?auto_73463 ?auto_73469 ) ) ( not ( = ?auto_73464 ?auto_73469 ) ) ( not ( = ?auto_73465 ?auto_73469 ) ) ( ON ?auto_73463 ?auto_73468 ) ( not ( = ?auto_73463 ?auto_73468 ) ) ( not ( = ?auto_73464 ?auto_73468 ) ) ( not ( = ?auto_73465 ?auto_73468 ) ) ( not ( = ?auto_73466 ?auto_73468 ) ) ( not ( = ?auto_73467 ?auto_73468 ) ) ( not ( = ?auto_73470 ?auto_73468 ) ) ( not ( = ?auto_73469 ?auto_73468 ) ) ( ON ?auto_73464 ?auto_73463 ) ( ON-TABLE ?auto_73468 ) ( ON ?auto_73465 ?auto_73464 ) ( ON ?auto_73466 ?auto_73465 ) ( ON ?auto_73467 ?auto_73466 ) ( ON ?auto_73470 ?auto_73467 ) ( CLEAR ?auto_73470 ) ( HOLDING ?auto_73469 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73469 )
      ( MAKE-5PILE ?auto_73463 ?auto_73464 ?auto_73465 ?auto_73466 ?auto_73467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73471 - BLOCK
      ?auto_73472 - BLOCK
      ?auto_73473 - BLOCK
      ?auto_73474 - BLOCK
      ?auto_73475 - BLOCK
    )
    :vars
    (
      ?auto_73478 - BLOCK
      ?auto_73477 - BLOCK
      ?auto_73476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73471 ?auto_73472 ) ) ( not ( = ?auto_73471 ?auto_73473 ) ) ( not ( = ?auto_73471 ?auto_73474 ) ) ( not ( = ?auto_73471 ?auto_73475 ) ) ( not ( = ?auto_73472 ?auto_73473 ) ) ( not ( = ?auto_73472 ?auto_73474 ) ) ( not ( = ?auto_73472 ?auto_73475 ) ) ( not ( = ?auto_73473 ?auto_73474 ) ) ( not ( = ?auto_73473 ?auto_73475 ) ) ( not ( = ?auto_73474 ?auto_73475 ) ) ( not ( = ?auto_73471 ?auto_73478 ) ) ( not ( = ?auto_73472 ?auto_73478 ) ) ( not ( = ?auto_73473 ?auto_73478 ) ) ( not ( = ?auto_73474 ?auto_73478 ) ) ( not ( = ?auto_73475 ?auto_73478 ) ) ( not ( = ?auto_73477 ?auto_73478 ) ) ( not ( = ?auto_73477 ?auto_73475 ) ) ( not ( = ?auto_73477 ?auto_73474 ) ) ( not ( = ?auto_73471 ?auto_73477 ) ) ( not ( = ?auto_73472 ?auto_73477 ) ) ( not ( = ?auto_73473 ?auto_73477 ) ) ( ON ?auto_73471 ?auto_73476 ) ( not ( = ?auto_73471 ?auto_73476 ) ) ( not ( = ?auto_73472 ?auto_73476 ) ) ( not ( = ?auto_73473 ?auto_73476 ) ) ( not ( = ?auto_73474 ?auto_73476 ) ) ( not ( = ?auto_73475 ?auto_73476 ) ) ( not ( = ?auto_73478 ?auto_73476 ) ) ( not ( = ?auto_73477 ?auto_73476 ) ) ( ON ?auto_73472 ?auto_73471 ) ( ON-TABLE ?auto_73476 ) ( ON ?auto_73473 ?auto_73472 ) ( ON ?auto_73474 ?auto_73473 ) ( ON ?auto_73475 ?auto_73474 ) ( ON ?auto_73478 ?auto_73475 ) ( ON ?auto_73477 ?auto_73478 ) ( CLEAR ?auto_73477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_73476 ?auto_73471 ?auto_73472 ?auto_73473 ?auto_73474 ?auto_73475 ?auto_73478 )
      ( MAKE-5PILE ?auto_73471 ?auto_73472 ?auto_73473 ?auto_73474 ?auto_73475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73490 - BLOCK
    )
    :vars
    (
      ?auto_73491 - BLOCK
      ?auto_73492 - BLOCK
      ?auto_73493 - BLOCK
      ?auto_73494 - BLOCK
      ?auto_73495 - BLOCK
      ?auto_73496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73491 ?auto_73490 ) ( ON-TABLE ?auto_73490 ) ( not ( = ?auto_73490 ?auto_73491 ) ) ( not ( = ?auto_73490 ?auto_73492 ) ) ( not ( = ?auto_73490 ?auto_73493 ) ) ( not ( = ?auto_73491 ?auto_73492 ) ) ( not ( = ?auto_73491 ?auto_73493 ) ) ( not ( = ?auto_73492 ?auto_73493 ) ) ( ON ?auto_73492 ?auto_73491 ) ( CLEAR ?auto_73492 ) ( HOLDING ?auto_73493 ) ( CLEAR ?auto_73494 ) ( ON-TABLE ?auto_73495 ) ( ON ?auto_73496 ?auto_73495 ) ( ON ?auto_73494 ?auto_73496 ) ( not ( = ?auto_73495 ?auto_73496 ) ) ( not ( = ?auto_73495 ?auto_73494 ) ) ( not ( = ?auto_73495 ?auto_73493 ) ) ( not ( = ?auto_73496 ?auto_73494 ) ) ( not ( = ?auto_73496 ?auto_73493 ) ) ( not ( = ?auto_73494 ?auto_73493 ) ) ( not ( = ?auto_73490 ?auto_73494 ) ) ( not ( = ?auto_73490 ?auto_73495 ) ) ( not ( = ?auto_73490 ?auto_73496 ) ) ( not ( = ?auto_73491 ?auto_73494 ) ) ( not ( = ?auto_73491 ?auto_73495 ) ) ( not ( = ?auto_73491 ?auto_73496 ) ) ( not ( = ?auto_73492 ?auto_73494 ) ) ( not ( = ?auto_73492 ?auto_73495 ) ) ( not ( = ?auto_73492 ?auto_73496 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73495 ?auto_73496 ?auto_73494 ?auto_73493 )
      ( MAKE-1PILE ?auto_73490 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73497 - BLOCK
    )
    :vars
    (
      ?auto_73501 - BLOCK
      ?auto_73502 - BLOCK
      ?auto_73503 - BLOCK
      ?auto_73498 - BLOCK
      ?auto_73499 - BLOCK
      ?auto_73500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73501 ?auto_73497 ) ( ON-TABLE ?auto_73497 ) ( not ( = ?auto_73497 ?auto_73501 ) ) ( not ( = ?auto_73497 ?auto_73502 ) ) ( not ( = ?auto_73497 ?auto_73503 ) ) ( not ( = ?auto_73501 ?auto_73502 ) ) ( not ( = ?auto_73501 ?auto_73503 ) ) ( not ( = ?auto_73502 ?auto_73503 ) ) ( ON ?auto_73502 ?auto_73501 ) ( CLEAR ?auto_73498 ) ( ON-TABLE ?auto_73499 ) ( ON ?auto_73500 ?auto_73499 ) ( ON ?auto_73498 ?auto_73500 ) ( not ( = ?auto_73499 ?auto_73500 ) ) ( not ( = ?auto_73499 ?auto_73498 ) ) ( not ( = ?auto_73499 ?auto_73503 ) ) ( not ( = ?auto_73500 ?auto_73498 ) ) ( not ( = ?auto_73500 ?auto_73503 ) ) ( not ( = ?auto_73498 ?auto_73503 ) ) ( not ( = ?auto_73497 ?auto_73498 ) ) ( not ( = ?auto_73497 ?auto_73499 ) ) ( not ( = ?auto_73497 ?auto_73500 ) ) ( not ( = ?auto_73501 ?auto_73498 ) ) ( not ( = ?auto_73501 ?auto_73499 ) ) ( not ( = ?auto_73501 ?auto_73500 ) ) ( not ( = ?auto_73502 ?auto_73498 ) ) ( not ( = ?auto_73502 ?auto_73499 ) ) ( not ( = ?auto_73502 ?auto_73500 ) ) ( ON ?auto_73503 ?auto_73502 ) ( CLEAR ?auto_73503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73497 ?auto_73501 ?auto_73502 )
      ( MAKE-1PILE ?auto_73497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73504 - BLOCK
    )
    :vars
    (
      ?auto_73505 - BLOCK
      ?auto_73510 - BLOCK
      ?auto_73508 - BLOCK
      ?auto_73506 - BLOCK
      ?auto_73507 - BLOCK
      ?auto_73509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73505 ?auto_73504 ) ( ON-TABLE ?auto_73504 ) ( not ( = ?auto_73504 ?auto_73505 ) ) ( not ( = ?auto_73504 ?auto_73510 ) ) ( not ( = ?auto_73504 ?auto_73508 ) ) ( not ( = ?auto_73505 ?auto_73510 ) ) ( not ( = ?auto_73505 ?auto_73508 ) ) ( not ( = ?auto_73510 ?auto_73508 ) ) ( ON ?auto_73510 ?auto_73505 ) ( ON-TABLE ?auto_73506 ) ( ON ?auto_73507 ?auto_73506 ) ( not ( = ?auto_73506 ?auto_73507 ) ) ( not ( = ?auto_73506 ?auto_73509 ) ) ( not ( = ?auto_73506 ?auto_73508 ) ) ( not ( = ?auto_73507 ?auto_73509 ) ) ( not ( = ?auto_73507 ?auto_73508 ) ) ( not ( = ?auto_73509 ?auto_73508 ) ) ( not ( = ?auto_73504 ?auto_73509 ) ) ( not ( = ?auto_73504 ?auto_73506 ) ) ( not ( = ?auto_73504 ?auto_73507 ) ) ( not ( = ?auto_73505 ?auto_73509 ) ) ( not ( = ?auto_73505 ?auto_73506 ) ) ( not ( = ?auto_73505 ?auto_73507 ) ) ( not ( = ?auto_73510 ?auto_73509 ) ) ( not ( = ?auto_73510 ?auto_73506 ) ) ( not ( = ?auto_73510 ?auto_73507 ) ) ( ON ?auto_73508 ?auto_73510 ) ( CLEAR ?auto_73508 ) ( HOLDING ?auto_73509 ) ( CLEAR ?auto_73507 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73506 ?auto_73507 ?auto_73509 )
      ( MAKE-1PILE ?auto_73504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73511 - BLOCK
    )
    :vars
    (
      ?auto_73512 - BLOCK
      ?auto_73515 - BLOCK
      ?auto_73517 - BLOCK
      ?auto_73514 - BLOCK
      ?auto_73516 - BLOCK
      ?auto_73513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73512 ?auto_73511 ) ( ON-TABLE ?auto_73511 ) ( not ( = ?auto_73511 ?auto_73512 ) ) ( not ( = ?auto_73511 ?auto_73515 ) ) ( not ( = ?auto_73511 ?auto_73517 ) ) ( not ( = ?auto_73512 ?auto_73515 ) ) ( not ( = ?auto_73512 ?auto_73517 ) ) ( not ( = ?auto_73515 ?auto_73517 ) ) ( ON ?auto_73515 ?auto_73512 ) ( ON-TABLE ?auto_73514 ) ( ON ?auto_73516 ?auto_73514 ) ( not ( = ?auto_73514 ?auto_73516 ) ) ( not ( = ?auto_73514 ?auto_73513 ) ) ( not ( = ?auto_73514 ?auto_73517 ) ) ( not ( = ?auto_73516 ?auto_73513 ) ) ( not ( = ?auto_73516 ?auto_73517 ) ) ( not ( = ?auto_73513 ?auto_73517 ) ) ( not ( = ?auto_73511 ?auto_73513 ) ) ( not ( = ?auto_73511 ?auto_73514 ) ) ( not ( = ?auto_73511 ?auto_73516 ) ) ( not ( = ?auto_73512 ?auto_73513 ) ) ( not ( = ?auto_73512 ?auto_73514 ) ) ( not ( = ?auto_73512 ?auto_73516 ) ) ( not ( = ?auto_73515 ?auto_73513 ) ) ( not ( = ?auto_73515 ?auto_73514 ) ) ( not ( = ?auto_73515 ?auto_73516 ) ) ( ON ?auto_73517 ?auto_73515 ) ( CLEAR ?auto_73516 ) ( ON ?auto_73513 ?auto_73517 ) ( CLEAR ?auto_73513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73511 ?auto_73512 ?auto_73515 ?auto_73517 )
      ( MAKE-1PILE ?auto_73511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73518 - BLOCK
    )
    :vars
    (
      ?auto_73519 - BLOCK
      ?auto_73524 - BLOCK
      ?auto_73522 - BLOCK
      ?auto_73523 - BLOCK
      ?auto_73520 - BLOCK
      ?auto_73521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73519 ?auto_73518 ) ( ON-TABLE ?auto_73518 ) ( not ( = ?auto_73518 ?auto_73519 ) ) ( not ( = ?auto_73518 ?auto_73524 ) ) ( not ( = ?auto_73518 ?auto_73522 ) ) ( not ( = ?auto_73519 ?auto_73524 ) ) ( not ( = ?auto_73519 ?auto_73522 ) ) ( not ( = ?auto_73524 ?auto_73522 ) ) ( ON ?auto_73524 ?auto_73519 ) ( ON-TABLE ?auto_73523 ) ( not ( = ?auto_73523 ?auto_73520 ) ) ( not ( = ?auto_73523 ?auto_73521 ) ) ( not ( = ?auto_73523 ?auto_73522 ) ) ( not ( = ?auto_73520 ?auto_73521 ) ) ( not ( = ?auto_73520 ?auto_73522 ) ) ( not ( = ?auto_73521 ?auto_73522 ) ) ( not ( = ?auto_73518 ?auto_73521 ) ) ( not ( = ?auto_73518 ?auto_73523 ) ) ( not ( = ?auto_73518 ?auto_73520 ) ) ( not ( = ?auto_73519 ?auto_73521 ) ) ( not ( = ?auto_73519 ?auto_73523 ) ) ( not ( = ?auto_73519 ?auto_73520 ) ) ( not ( = ?auto_73524 ?auto_73521 ) ) ( not ( = ?auto_73524 ?auto_73523 ) ) ( not ( = ?auto_73524 ?auto_73520 ) ) ( ON ?auto_73522 ?auto_73524 ) ( ON ?auto_73521 ?auto_73522 ) ( CLEAR ?auto_73521 ) ( HOLDING ?auto_73520 ) ( CLEAR ?auto_73523 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73523 ?auto_73520 )
      ( MAKE-1PILE ?auto_73518 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73525 - BLOCK
    )
    :vars
    (
      ?auto_73530 - BLOCK
      ?auto_73526 - BLOCK
      ?auto_73527 - BLOCK
      ?auto_73528 - BLOCK
      ?auto_73531 - BLOCK
      ?auto_73529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73530 ?auto_73525 ) ( ON-TABLE ?auto_73525 ) ( not ( = ?auto_73525 ?auto_73530 ) ) ( not ( = ?auto_73525 ?auto_73526 ) ) ( not ( = ?auto_73525 ?auto_73527 ) ) ( not ( = ?auto_73530 ?auto_73526 ) ) ( not ( = ?auto_73530 ?auto_73527 ) ) ( not ( = ?auto_73526 ?auto_73527 ) ) ( ON ?auto_73526 ?auto_73530 ) ( ON-TABLE ?auto_73528 ) ( not ( = ?auto_73528 ?auto_73531 ) ) ( not ( = ?auto_73528 ?auto_73529 ) ) ( not ( = ?auto_73528 ?auto_73527 ) ) ( not ( = ?auto_73531 ?auto_73529 ) ) ( not ( = ?auto_73531 ?auto_73527 ) ) ( not ( = ?auto_73529 ?auto_73527 ) ) ( not ( = ?auto_73525 ?auto_73529 ) ) ( not ( = ?auto_73525 ?auto_73528 ) ) ( not ( = ?auto_73525 ?auto_73531 ) ) ( not ( = ?auto_73530 ?auto_73529 ) ) ( not ( = ?auto_73530 ?auto_73528 ) ) ( not ( = ?auto_73530 ?auto_73531 ) ) ( not ( = ?auto_73526 ?auto_73529 ) ) ( not ( = ?auto_73526 ?auto_73528 ) ) ( not ( = ?auto_73526 ?auto_73531 ) ) ( ON ?auto_73527 ?auto_73526 ) ( ON ?auto_73529 ?auto_73527 ) ( CLEAR ?auto_73528 ) ( ON ?auto_73531 ?auto_73529 ) ( CLEAR ?auto_73531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73525 ?auto_73530 ?auto_73526 ?auto_73527 ?auto_73529 )
      ( MAKE-1PILE ?auto_73525 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73532 - BLOCK
    )
    :vars
    (
      ?auto_73538 - BLOCK
      ?auto_73537 - BLOCK
      ?auto_73535 - BLOCK
      ?auto_73533 - BLOCK
      ?auto_73536 - BLOCK
      ?auto_73534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73538 ?auto_73532 ) ( ON-TABLE ?auto_73532 ) ( not ( = ?auto_73532 ?auto_73538 ) ) ( not ( = ?auto_73532 ?auto_73537 ) ) ( not ( = ?auto_73532 ?auto_73535 ) ) ( not ( = ?auto_73538 ?auto_73537 ) ) ( not ( = ?auto_73538 ?auto_73535 ) ) ( not ( = ?auto_73537 ?auto_73535 ) ) ( ON ?auto_73537 ?auto_73538 ) ( not ( = ?auto_73533 ?auto_73536 ) ) ( not ( = ?auto_73533 ?auto_73534 ) ) ( not ( = ?auto_73533 ?auto_73535 ) ) ( not ( = ?auto_73536 ?auto_73534 ) ) ( not ( = ?auto_73536 ?auto_73535 ) ) ( not ( = ?auto_73534 ?auto_73535 ) ) ( not ( = ?auto_73532 ?auto_73534 ) ) ( not ( = ?auto_73532 ?auto_73533 ) ) ( not ( = ?auto_73532 ?auto_73536 ) ) ( not ( = ?auto_73538 ?auto_73534 ) ) ( not ( = ?auto_73538 ?auto_73533 ) ) ( not ( = ?auto_73538 ?auto_73536 ) ) ( not ( = ?auto_73537 ?auto_73534 ) ) ( not ( = ?auto_73537 ?auto_73533 ) ) ( not ( = ?auto_73537 ?auto_73536 ) ) ( ON ?auto_73535 ?auto_73537 ) ( ON ?auto_73534 ?auto_73535 ) ( ON ?auto_73536 ?auto_73534 ) ( CLEAR ?auto_73536 ) ( HOLDING ?auto_73533 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73533 )
      ( MAKE-1PILE ?auto_73532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73547 - BLOCK
    )
    :vars
    (
      ?auto_73551 - BLOCK
      ?auto_73552 - BLOCK
      ?auto_73553 - BLOCK
      ?auto_73550 - BLOCK
      ?auto_73548 - BLOCK
      ?auto_73549 - BLOCK
      ?auto_73554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73551 ?auto_73547 ) ( ON-TABLE ?auto_73547 ) ( not ( = ?auto_73547 ?auto_73551 ) ) ( not ( = ?auto_73547 ?auto_73552 ) ) ( not ( = ?auto_73547 ?auto_73553 ) ) ( not ( = ?auto_73551 ?auto_73552 ) ) ( not ( = ?auto_73551 ?auto_73553 ) ) ( not ( = ?auto_73552 ?auto_73553 ) ) ( ON ?auto_73552 ?auto_73551 ) ( not ( = ?auto_73550 ?auto_73548 ) ) ( not ( = ?auto_73550 ?auto_73549 ) ) ( not ( = ?auto_73550 ?auto_73553 ) ) ( not ( = ?auto_73548 ?auto_73549 ) ) ( not ( = ?auto_73548 ?auto_73553 ) ) ( not ( = ?auto_73549 ?auto_73553 ) ) ( not ( = ?auto_73547 ?auto_73549 ) ) ( not ( = ?auto_73547 ?auto_73550 ) ) ( not ( = ?auto_73547 ?auto_73548 ) ) ( not ( = ?auto_73551 ?auto_73549 ) ) ( not ( = ?auto_73551 ?auto_73550 ) ) ( not ( = ?auto_73551 ?auto_73548 ) ) ( not ( = ?auto_73552 ?auto_73549 ) ) ( not ( = ?auto_73552 ?auto_73550 ) ) ( not ( = ?auto_73552 ?auto_73548 ) ) ( ON ?auto_73553 ?auto_73552 ) ( ON ?auto_73549 ?auto_73553 ) ( ON ?auto_73548 ?auto_73549 ) ( CLEAR ?auto_73548 ) ( ON ?auto_73550 ?auto_73554 ) ( CLEAR ?auto_73550 ) ( HAND-EMPTY ) ( not ( = ?auto_73547 ?auto_73554 ) ) ( not ( = ?auto_73551 ?auto_73554 ) ) ( not ( = ?auto_73552 ?auto_73554 ) ) ( not ( = ?auto_73553 ?auto_73554 ) ) ( not ( = ?auto_73550 ?auto_73554 ) ) ( not ( = ?auto_73548 ?auto_73554 ) ) ( not ( = ?auto_73549 ?auto_73554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73550 ?auto_73554 )
      ( MAKE-1PILE ?auto_73547 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73555 - BLOCK
    )
    :vars
    (
      ?auto_73561 - BLOCK
      ?auto_73562 - BLOCK
      ?auto_73560 - BLOCK
      ?auto_73557 - BLOCK
      ?auto_73559 - BLOCK
      ?auto_73558 - BLOCK
      ?auto_73556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73561 ?auto_73555 ) ( ON-TABLE ?auto_73555 ) ( not ( = ?auto_73555 ?auto_73561 ) ) ( not ( = ?auto_73555 ?auto_73562 ) ) ( not ( = ?auto_73555 ?auto_73560 ) ) ( not ( = ?auto_73561 ?auto_73562 ) ) ( not ( = ?auto_73561 ?auto_73560 ) ) ( not ( = ?auto_73562 ?auto_73560 ) ) ( ON ?auto_73562 ?auto_73561 ) ( not ( = ?auto_73557 ?auto_73559 ) ) ( not ( = ?auto_73557 ?auto_73558 ) ) ( not ( = ?auto_73557 ?auto_73560 ) ) ( not ( = ?auto_73559 ?auto_73558 ) ) ( not ( = ?auto_73559 ?auto_73560 ) ) ( not ( = ?auto_73558 ?auto_73560 ) ) ( not ( = ?auto_73555 ?auto_73558 ) ) ( not ( = ?auto_73555 ?auto_73557 ) ) ( not ( = ?auto_73555 ?auto_73559 ) ) ( not ( = ?auto_73561 ?auto_73558 ) ) ( not ( = ?auto_73561 ?auto_73557 ) ) ( not ( = ?auto_73561 ?auto_73559 ) ) ( not ( = ?auto_73562 ?auto_73558 ) ) ( not ( = ?auto_73562 ?auto_73557 ) ) ( not ( = ?auto_73562 ?auto_73559 ) ) ( ON ?auto_73560 ?auto_73562 ) ( ON ?auto_73558 ?auto_73560 ) ( ON ?auto_73557 ?auto_73556 ) ( CLEAR ?auto_73557 ) ( not ( = ?auto_73555 ?auto_73556 ) ) ( not ( = ?auto_73561 ?auto_73556 ) ) ( not ( = ?auto_73562 ?auto_73556 ) ) ( not ( = ?auto_73560 ?auto_73556 ) ) ( not ( = ?auto_73557 ?auto_73556 ) ) ( not ( = ?auto_73559 ?auto_73556 ) ) ( not ( = ?auto_73558 ?auto_73556 ) ) ( HOLDING ?auto_73559 ) ( CLEAR ?auto_73558 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73555 ?auto_73561 ?auto_73562 ?auto_73560 ?auto_73558 ?auto_73559 )
      ( MAKE-1PILE ?auto_73555 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73563 - BLOCK
    )
    :vars
    (
      ?auto_73564 - BLOCK
      ?auto_73570 - BLOCK
      ?auto_73568 - BLOCK
      ?auto_73565 - BLOCK
      ?auto_73569 - BLOCK
      ?auto_73567 - BLOCK
      ?auto_73566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73564 ?auto_73563 ) ( ON-TABLE ?auto_73563 ) ( not ( = ?auto_73563 ?auto_73564 ) ) ( not ( = ?auto_73563 ?auto_73570 ) ) ( not ( = ?auto_73563 ?auto_73568 ) ) ( not ( = ?auto_73564 ?auto_73570 ) ) ( not ( = ?auto_73564 ?auto_73568 ) ) ( not ( = ?auto_73570 ?auto_73568 ) ) ( ON ?auto_73570 ?auto_73564 ) ( not ( = ?auto_73565 ?auto_73569 ) ) ( not ( = ?auto_73565 ?auto_73567 ) ) ( not ( = ?auto_73565 ?auto_73568 ) ) ( not ( = ?auto_73569 ?auto_73567 ) ) ( not ( = ?auto_73569 ?auto_73568 ) ) ( not ( = ?auto_73567 ?auto_73568 ) ) ( not ( = ?auto_73563 ?auto_73567 ) ) ( not ( = ?auto_73563 ?auto_73565 ) ) ( not ( = ?auto_73563 ?auto_73569 ) ) ( not ( = ?auto_73564 ?auto_73567 ) ) ( not ( = ?auto_73564 ?auto_73565 ) ) ( not ( = ?auto_73564 ?auto_73569 ) ) ( not ( = ?auto_73570 ?auto_73567 ) ) ( not ( = ?auto_73570 ?auto_73565 ) ) ( not ( = ?auto_73570 ?auto_73569 ) ) ( ON ?auto_73568 ?auto_73570 ) ( ON ?auto_73567 ?auto_73568 ) ( ON ?auto_73565 ?auto_73566 ) ( not ( = ?auto_73563 ?auto_73566 ) ) ( not ( = ?auto_73564 ?auto_73566 ) ) ( not ( = ?auto_73570 ?auto_73566 ) ) ( not ( = ?auto_73568 ?auto_73566 ) ) ( not ( = ?auto_73565 ?auto_73566 ) ) ( not ( = ?auto_73569 ?auto_73566 ) ) ( not ( = ?auto_73567 ?auto_73566 ) ) ( CLEAR ?auto_73567 ) ( ON ?auto_73569 ?auto_73565 ) ( CLEAR ?auto_73569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73566 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73566 ?auto_73565 )
      ( MAKE-1PILE ?auto_73563 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_73571 - BLOCK
    )
    :vars
    (
      ?auto_73572 - BLOCK
      ?auto_73575 - BLOCK
      ?auto_73577 - BLOCK
      ?auto_73574 - BLOCK
      ?auto_73578 - BLOCK
      ?auto_73576 - BLOCK
      ?auto_73573 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73572 ?auto_73571 ) ( ON-TABLE ?auto_73571 ) ( not ( = ?auto_73571 ?auto_73572 ) ) ( not ( = ?auto_73571 ?auto_73575 ) ) ( not ( = ?auto_73571 ?auto_73577 ) ) ( not ( = ?auto_73572 ?auto_73575 ) ) ( not ( = ?auto_73572 ?auto_73577 ) ) ( not ( = ?auto_73575 ?auto_73577 ) ) ( ON ?auto_73575 ?auto_73572 ) ( not ( = ?auto_73574 ?auto_73578 ) ) ( not ( = ?auto_73574 ?auto_73576 ) ) ( not ( = ?auto_73574 ?auto_73577 ) ) ( not ( = ?auto_73578 ?auto_73576 ) ) ( not ( = ?auto_73578 ?auto_73577 ) ) ( not ( = ?auto_73576 ?auto_73577 ) ) ( not ( = ?auto_73571 ?auto_73576 ) ) ( not ( = ?auto_73571 ?auto_73574 ) ) ( not ( = ?auto_73571 ?auto_73578 ) ) ( not ( = ?auto_73572 ?auto_73576 ) ) ( not ( = ?auto_73572 ?auto_73574 ) ) ( not ( = ?auto_73572 ?auto_73578 ) ) ( not ( = ?auto_73575 ?auto_73576 ) ) ( not ( = ?auto_73575 ?auto_73574 ) ) ( not ( = ?auto_73575 ?auto_73578 ) ) ( ON ?auto_73577 ?auto_73575 ) ( ON ?auto_73574 ?auto_73573 ) ( not ( = ?auto_73571 ?auto_73573 ) ) ( not ( = ?auto_73572 ?auto_73573 ) ) ( not ( = ?auto_73575 ?auto_73573 ) ) ( not ( = ?auto_73577 ?auto_73573 ) ) ( not ( = ?auto_73574 ?auto_73573 ) ) ( not ( = ?auto_73578 ?auto_73573 ) ) ( not ( = ?auto_73576 ?auto_73573 ) ) ( ON ?auto_73578 ?auto_73574 ) ( CLEAR ?auto_73578 ) ( ON-TABLE ?auto_73573 ) ( HOLDING ?auto_73576 ) ( CLEAR ?auto_73577 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73571 ?auto_73572 ?auto_73575 ?auto_73577 ?auto_73576 )
      ( MAKE-1PILE ?auto_73571 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73617 - BLOCK
      ?auto_73618 - BLOCK
      ?auto_73619 - BLOCK
      ?auto_73620 - BLOCK
      ?auto_73621 - BLOCK
      ?auto_73622 - BLOCK
    )
    :vars
    (
      ?auto_73623 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73617 ) ( ON ?auto_73618 ?auto_73617 ) ( ON ?auto_73619 ?auto_73618 ) ( ON ?auto_73620 ?auto_73619 ) ( not ( = ?auto_73617 ?auto_73618 ) ) ( not ( = ?auto_73617 ?auto_73619 ) ) ( not ( = ?auto_73617 ?auto_73620 ) ) ( not ( = ?auto_73617 ?auto_73621 ) ) ( not ( = ?auto_73617 ?auto_73622 ) ) ( not ( = ?auto_73618 ?auto_73619 ) ) ( not ( = ?auto_73618 ?auto_73620 ) ) ( not ( = ?auto_73618 ?auto_73621 ) ) ( not ( = ?auto_73618 ?auto_73622 ) ) ( not ( = ?auto_73619 ?auto_73620 ) ) ( not ( = ?auto_73619 ?auto_73621 ) ) ( not ( = ?auto_73619 ?auto_73622 ) ) ( not ( = ?auto_73620 ?auto_73621 ) ) ( not ( = ?auto_73620 ?auto_73622 ) ) ( not ( = ?auto_73621 ?auto_73622 ) ) ( ON ?auto_73622 ?auto_73623 ) ( not ( = ?auto_73617 ?auto_73623 ) ) ( not ( = ?auto_73618 ?auto_73623 ) ) ( not ( = ?auto_73619 ?auto_73623 ) ) ( not ( = ?auto_73620 ?auto_73623 ) ) ( not ( = ?auto_73621 ?auto_73623 ) ) ( not ( = ?auto_73622 ?auto_73623 ) ) ( CLEAR ?auto_73620 ) ( ON ?auto_73621 ?auto_73622 ) ( CLEAR ?auto_73621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73623 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73623 ?auto_73622 )
      ( MAKE-6PILE ?auto_73617 ?auto_73618 ?auto_73619 ?auto_73620 ?auto_73621 ?auto_73622 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73624 - BLOCK
      ?auto_73625 - BLOCK
      ?auto_73626 - BLOCK
      ?auto_73627 - BLOCK
      ?auto_73628 - BLOCK
      ?auto_73629 - BLOCK
    )
    :vars
    (
      ?auto_73630 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73624 ) ( ON ?auto_73625 ?auto_73624 ) ( ON ?auto_73626 ?auto_73625 ) ( not ( = ?auto_73624 ?auto_73625 ) ) ( not ( = ?auto_73624 ?auto_73626 ) ) ( not ( = ?auto_73624 ?auto_73627 ) ) ( not ( = ?auto_73624 ?auto_73628 ) ) ( not ( = ?auto_73624 ?auto_73629 ) ) ( not ( = ?auto_73625 ?auto_73626 ) ) ( not ( = ?auto_73625 ?auto_73627 ) ) ( not ( = ?auto_73625 ?auto_73628 ) ) ( not ( = ?auto_73625 ?auto_73629 ) ) ( not ( = ?auto_73626 ?auto_73627 ) ) ( not ( = ?auto_73626 ?auto_73628 ) ) ( not ( = ?auto_73626 ?auto_73629 ) ) ( not ( = ?auto_73627 ?auto_73628 ) ) ( not ( = ?auto_73627 ?auto_73629 ) ) ( not ( = ?auto_73628 ?auto_73629 ) ) ( ON ?auto_73629 ?auto_73630 ) ( not ( = ?auto_73624 ?auto_73630 ) ) ( not ( = ?auto_73625 ?auto_73630 ) ) ( not ( = ?auto_73626 ?auto_73630 ) ) ( not ( = ?auto_73627 ?auto_73630 ) ) ( not ( = ?auto_73628 ?auto_73630 ) ) ( not ( = ?auto_73629 ?auto_73630 ) ) ( ON ?auto_73628 ?auto_73629 ) ( CLEAR ?auto_73628 ) ( ON-TABLE ?auto_73630 ) ( HOLDING ?auto_73627 ) ( CLEAR ?auto_73626 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73624 ?auto_73625 ?auto_73626 ?auto_73627 )
      ( MAKE-6PILE ?auto_73624 ?auto_73625 ?auto_73626 ?auto_73627 ?auto_73628 ?auto_73629 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73631 - BLOCK
      ?auto_73632 - BLOCK
      ?auto_73633 - BLOCK
      ?auto_73634 - BLOCK
      ?auto_73635 - BLOCK
      ?auto_73636 - BLOCK
    )
    :vars
    (
      ?auto_73637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73631 ) ( ON ?auto_73632 ?auto_73631 ) ( ON ?auto_73633 ?auto_73632 ) ( not ( = ?auto_73631 ?auto_73632 ) ) ( not ( = ?auto_73631 ?auto_73633 ) ) ( not ( = ?auto_73631 ?auto_73634 ) ) ( not ( = ?auto_73631 ?auto_73635 ) ) ( not ( = ?auto_73631 ?auto_73636 ) ) ( not ( = ?auto_73632 ?auto_73633 ) ) ( not ( = ?auto_73632 ?auto_73634 ) ) ( not ( = ?auto_73632 ?auto_73635 ) ) ( not ( = ?auto_73632 ?auto_73636 ) ) ( not ( = ?auto_73633 ?auto_73634 ) ) ( not ( = ?auto_73633 ?auto_73635 ) ) ( not ( = ?auto_73633 ?auto_73636 ) ) ( not ( = ?auto_73634 ?auto_73635 ) ) ( not ( = ?auto_73634 ?auto_73636 ) ) ( not ( = ?auto_73635 ?auto_73636 ) ) ( ON ?auto_73636 ?auto_73637 ) ( not ( = ?auto_73631 ?auto_73637 ) ) ( not ( = ?auto_73632 ?auto_73637 ) ) ( not ( = ?auto_73633 ?auto_73637 ) ) ( not ( = ?auto_73634 ?auto_73637 ) ) ( not ( = ?auto_73635 ?auto_73637 ) ) ( not ( = ?auto_73636 ?auto_73637 ) ) ( ON ?auto_73635 ?auto_73636 ) ( ON-TABLE ?auto_73637 ) ( CLEAR ?auto_73633 ) ( ON ?auto_73634 ?auto_73635 ) ( CLEAR ?auto_73634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73637 ?auto_73636 ?auto_73635 )
      ( MAKE-6PILE ?auto_73631 ?auto_73632 ?auto_73633 ?auto_73634 ?auto_73635 ?auto_73636 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73638 - BLOCK
      ?auto_73639 - BLOCK
      ?auto_73640 - BLOCK
      ?auto_73641 - BLOCK
      ?auto_73642 - BLOCK
      ?auto_73643 - BLOCK
    )
    :vars
    (
      ?auto_73644 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73638 ) ( ON ?auto_73639 ?auto_73638 ) ( not ( = ?auto_73638 ?auto_73639 ) ) ( not ( = ?auto_73638 ?auto_73640 ) ) ( not ( = ?auto_73638 ?auto_73641 ) ) ( not ( = ?auto_73638 ?auto_73642 ) ) ( not ( = ?auto_73638 ?auto_73643 ) ) ( not ( = ?auto_73639 ?auto_73640 ) ) ( not ( = ?auto_73639 ?auto_73641 ) ) ( not ( = ?auto_73639 ?auto_73642 ) ) ( not ( = ?auto_73639 ?auto_73643 ) ) ( not ( = ?auto_73640 ?auto_73641 ) ) ( not ( = ?auto_73640 ?auto_73642 ) ) ( not ( = ?auto_73640 ?auto_73643 ) ) ( not ( = ?auto_73641 ?auto_73642 ) ) ( not ( = ?auto_73641 ?auto_73643 ) ) ( not ( = ?auto_73642 ?auto_73643 ) ) ( ON ?auto_73643 ?auto_73644 ) ( not ( = ?auto_73638 ?auto_73644 ) ) ( not ( = ?auto_73639 ?auto_73644 ) ) ( not ( = ?auto_73640 ?auto_73644 ) ) ( not ( = ?auto_73641 ?auto_73644 ) ) ( not ( = ?auto_73642 ?auto_73644 ) ) ( not ( = ?auto_73643 ?auto_73644 ) ) ( ON ?auto_73642 ?auto_73643 ) ( ON-TABLE ?auto_73644 ) ( ON ?auto_73641 ?auto_73642 ) ( CLEAR ?auto_73641 ) ( HOLDING ?auto_73640 ) ( CLEAR ?auto_73639 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73638 ?auto_73639 ?auto_73640 )
      ( MAKE-6PILE ?auto_73638 ?auto_73639 ?auto_73640 ?auto_73641 ?auto_73642 ?auto_73643 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73645 - BLOCK
      ?auto_73646 - BLOCK
      ?auto_73647 - BLOCK
      ?auto_73648 - BLOCK
      ?auto_73649 - BLOCK
      ?auto_73650 - BLOCK
    )
    :vars
    (
      ?auto_73651 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73645 ) ( ON ?auto_73646 ?auto_73645 ) ( not ( = ?auto_73645 ?auto_73646 ) ) ( not ( = ?auto_73645 ?auto_73647 ) ) ( not ( = ?auto_73645 ?auto_73648 ) ) ( not ( = ?auto_73645 ?auto_73649 ) ) ( not ( = ?auto_73645 ?auto_73650 ) ) ( not ( = ?auto_73646 ?auto_73647 ) ) ( not ( = ?auto_73646 ?auto_73648 ) ) ( not ( = ?auto_73646 ?auto_73649 ) ) ( not ( = ?auto_73646 ?auto_73650 ) ) ( not ( = ?auto_73647 ?auto_73648 ) ) ( not ( = ?auto_73647 ?auto_73649 ) ) ( not ( = ?auto_73647 ?auto_73650 ) ) ( not ( = ?auto_73648 ?auto_73649 ) ) ( not ( = ?auto_73648 ?auto_73650 ) ) ( not ( = ?auto_73649 ?auto_73650 ) ) ( ON ?auto_73650 ?auto_73651 ) ( not ( = ?auto_73645 ?auto_73651 ) ) ( not ( = ?auto_73646 ?auto_73651 ) ) ( not ( = ?auto_73647 ?auto_73651 ) ) ( not ( = ?auto_73648 ?auto_73651 ) ) ( not ( = ?auto_73649 ?auto_73651 ) ) ( not ( = ?auto_73650 ?auto_73651 ) ) ( ON ?auto_73649 ?auto_73650 ) ( ON-TABLE ?auto_73651 ) ( ON ?auto_73648 ?auto_73649 ) ( CLEAR ?auto_73646 ) ( ON ?auto_73647 ?auto_73648 ) ( CLEAR ?auto_73647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73651 ?auto_73650 ?auto_73649 ?auto_73648 )
      ( MAKE-6PILE ?auto_73645 ?auto_73646 ?auto_73647 ?auto_73648 ?auto_73649 ?auto_73650 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73652 - BLOCK
      ?auto_73653 - BLOCK
      ?auto_73654 - BLOCK
      ?auto_73655 - BLOCK
      ?auto_73656 - BLOCK
      ?auto_73657 - BLOCK
    )
    :vars
    (
      ?auto_73658 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73652 ) ( not ( = ?auto_73652 ?auto_73653 ) ) ( not ( = ?auto_73652 ?auto_73654 ) ) ( not ( = ?auto_73652 ?auto_73655 ) ) ( not ( = ?auto_73652 ?auto_73656 ) ) ( not ( = ?auto_73652 ?auto_73657 ) ) ( not ( = ?auto_73653 ?auto_73654 ) ) ( not ( = ?auto_73653 ?auto_73655 ) ) ( not ( = ?auto_73653 ?auto_73656 ) ) ( not ( = ?auto_73653 ?auto_73657 ) ) ( not ( = ?auto_73654 ?auto_73655 ) ) ( not ( = ?auto_73654 ?auto_73656 ) ) ( not ( = ?auto_73654 ?auto_73657 ) ) ( not ( = ?auto_73655 ?auto_73656 ) ) ( not ( = ?auto_73655 ?auto_73657 ) ) ( not ( = ?auto_73656 ?auto_73657 ) ) ( ON ?auto_73657 ?auto_73658 ) ( not ( = ?auto_73652 ?auto_73658 ) ) ( not ( = ?auto_73653 ?auto_73658 ) ) ( not ( = ?auto_73654 ?auto_73658 ) ) ( not ( = ?auto_73655 ?auto_73658 ) ) ( not ( = ?auto_73656 ?auto_73658 ) ) ( not ( = ?auto_73657 ?auto_73658 ) ) ( ON ?auto_73656 ?auto_73657 ) ( ON-TABLE ?auto_73658 ) ( ON ?auto_73655 ?auto_73656 ) ( ON ?auto_73654 ?auto_73655 ) ( CLEAR ?auto_73654 ) ( HOLDING ?auto_73653 ) ( CLEAR ?auto_73652 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73652 ?auto_73653 )
      ( MAKE-6PILE ?auto_73652 ?auto_73653 ?auto_73654 ?auto_73655 ?auto_73656 ?auto_73657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73659 - BLOCK
      ?auto_73660 - BLOCK
      ?auto_73661 - BLOCK
      ?auto_73662 - BLOCK
      ?auto_73663 - BLOCK
      ?auto_73664 - BLOCK
    )
    :vars
    (
      ?auto_73665 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73659 ) ( not ( = ?auto_73659 ?auto_73660 ) ) ( not ( = ?auto_73659 ?auto_73661 ) ) ( not ( = ?auto_73659 ?auto_73662 ) ) ( not ( = ?auto_73659 ?auto_73663 ) ) ( not ( = ?auto_73659 ?auto_73664 ) ) ( not ( = ?auto_73660 ?auto_73661 ) ) ( not ( = ?auto_73660 ?auto_73662 ) ) ( not ( = ?auto_73660 ?auto_73663 ) ) ( not ( = ?auto_73660 ?auto_73664 ) ) ( not ( = ?auto_73661 ?auto_73662 ) ) ( not ( = ?auto_73661 ?auto_73663 ) ) ( not ( = ?auto_73661 ?auto_73664 ) ) ( not ( = ?auto_73662 ?auto_73663 ) ) ( not ( = ?auto_73662 ?auto_73664 ) ) ( not ( = ?auto_73663 ?auto_73664 ) ) ( ON ?auto_73664 ?auto_73665 ) ( not ( = ?auto_73659 ?auto_73665 ) ) ( not ( = ?auto_73660 ?auto_73665 ) ) ( not ( = ?auto_73661 ?auto_73665 ) ) ( not ( = ?auto_73662 ?auto_73665 ) ) ( not ( = ?auto_73663 ?auto_73665 ) ) ( not ( = ?auto_73664 ?auto_73665 ) ) ( ON ?auto_73663 ?auto_73664 ) ( ON-TABLE ?auto_73665 ) ( ON ?auto_73662 ?auto_73663 ) ( ON ?auto_73661 ?auto_73662 ) ( CLEAR ?auto_73659 ) ( ON ?auto_73660 ?auto_73661 ) ( CLEAR ?auto_73660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73665 ?auto_73664 ?auto_73663 ?auto_73662 ?auto_73661 )
      ( MAKE-6PILE ?auto_73659 ?auto_73660 ?auto_73661 ?auto_73662 ?auto_73663 ?auto_73664 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73666 - BLOCK
      ?auto_73667 - BLOCK
      ?auto_73668 - BLOCK
      ?auto_73669 - BLOCK
      ?auto_73670 - BLOCK
      ?auto_73671 - BLOCK
    )
    :vars
    (
      ?auto_73672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73666 ?auto_73667 ) ) ( not ( = ?auto_73666 ?auto_73668 ) ) ( not ( = ?auto_73666 ?auto_73669 ) ) ( not ( = ?auto_73666 ?auto_73670 ) ) ( not ( = ?auto_73666 ?auto_73671 ) ) ( not ( = ?auto_73667 ?auto_73668 ) ) ( not ( = ?auto_73667 ?auto_73669 ) ) ( not ( = ?auto_73667 ?auto_73670 ) ) ( not ( = ?auto_73667 ?auto_73671 ) ) ( not ( = ?auto_73668 ?auto_73669 ) ) ( not ( = ?auto_73668 ?auto_73670 ) ) ( not ( = ?auto_73668 ?auto_73671 ) ) ( not ( = ?auto_73669 ?auto_73670 ) ) ( not ( = ?auto_73669 ?auto_73671 ) ) ( not ( = ?auto_73670 ?auto_73671 ) ) ( ON ?auto_73671 ?auto_73672 ) ( not ( = ?auto_73666 ?auto_73672 ) ) ( not ( = ?auto_73667 ?auto_73672 ) ) ( not ( = ?auto_73668 ?auto_73672 ) ) ( not ( = ?auto_73669 ?auto_73672 ) ) ( not ( = ?auto_73670 ?auto_73672 ) ) ( not ( = ?auto_73671 ?auto_73672 ) ) ( ON ?auto_73670 ?auto_73671 ) ( ON-TABLE ?auto_73672 ) ( ON ?auto_73669 ?auto_73670 ) ( ON ?auto_73668 ?auto_73669 ) ( ON ?auto_73667 ?auto_73668 ) ( CLEAR ?auto_73667 ) ( HOLDING ?auto_73666 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73666 )
      ( MAKE-6PILE ?auto_73666 ?auto_73667 ?auto_73668 ?auto_73669 ?auto_73670 ?auto_73671 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73673 - BLOCK
      ?auto_73674 - BLOCK
      ?auto_73675 - BLOCK
      ?auto_73676 - BLOCK
      ?auto_73677 - BLOCK
      ?auto_73678 - BLOCK
    )
    :vars
    (
      ?auto_73679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73673 ?auto_73674 ) ) ( not ( = ?auto_73673 ?auto_73675 ) ) ( not ( = ?auto_73673 ?auto_73676 ) ) ( not ( = ?auto_73673 ?auto_73677 ) ) ( not ( = ?auto_73673 ?auto_73678 ) ) ( not ( = ?auto_73674 ?auto_73675 ) ) ( not ( = ?auto_73674 ?auto_73676 ) ) ( not ( = ?auto_73674 ?auto_73677 ) ) ( not ( = ?auto_73674 ?auto_73678 ) ) ( not ( = ?auto_73675 ?auto_73676 ) ) ( not ( = ?auto_73675 ?auto_73677 ) ) ( not ( = ?auto_73675 ?auto_73678 ) ) ( not ( = ?auto_73676 ?auto_73677 ) ) ( not ( = ?auto_73676 ?auto_73678 ) ) ( not ( = ?auto_73677 ?auto_73678 ) ) ( ON ?auto_73678 ?auto_73679 ) ( not ( = ?auto_73673 ?auto_73679 ) ) ( not ( = ?auto_73674 ?auto_73679 ) ) ( not ( = ?auto_73675 ?auto_73679 ) ) ( not ( = ?auto_73676 ?auto_73679 ) ) ( not ( = ?auto_73677 ?auto_73679 ) ) ( not ( = ?auto_73678 ?auto_73679 ) ) ( ON ?auto_73677 ?auto_73678 ) ( ON-TABLE ?auto_73679 ) ( ON ?auto_73676 ?auto_73677 ) ( ON ?auto_73675 ?auto_73676 ) ( ON ?auto_73674 ?auto_73675 ) ( ON ?auto_73673 ?auto_73674 ) ( CLEAR ?auto_73673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73679 ?auto_73678 ?auto_73677 ?auto_73676 ?auto_73675 ?auto_73674 )
      ( MAKE-6PILE ?auto_73673 ?auto_73674 ?auto_73675 ?auto_73676 ?auto_73677 ?auto_73678 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73686 - BLOCK
      ?auto_73687 - BLOCK
      ?auto_73688 - BLOCK
      ?auto_73689 - BLOCK
      ?auto_73690 - BLOCK
      ?auto_73691 - BLOCK
    )
    :vars
    (
      ?auto_73692 - BLOCK
      ?auto_73693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73686 ?auto_73687 ) ) ( not ( = ?auto_73686 ?auto_73688 ) ) ( not ( = ?auto_73686 ?auto_73689 ) ) ( not ( = ?auto_73686 ?auto_73690 ) ) ( not ( = ?auto_73686 ?auto_73691 ) ) ( not ( = ?auto_73687 ?auto_73688 ) ) ( not ( = ?auto_73687 ?auto_73689 ) ) ( not ( = ?auto_73687 ?auto_73690 ) ) ( not ( = ?auto_73687 ?auto_73691 ) ) ( not ( = ?auto_73688 ?auto_73689 ) ) ( not ( = ?auto_73688 ?auto_73690 ) ) ( not ( = ?auto_73688 ?auto_73691 ) ) ( not ( = ?auto_73689 ?auto_73690 ) ) ( not ( = ?auto_73689 ?auto_73691 ) ) ( not ( = ?auto_73690 ?auto_73691 ) ) ( ON ?auto_73691 ?auto_73692 ) ( not ( = ?auto_73686 ?auto_73692 ) ) ( not ( = ?auto_73687 ?auto_73692 ) ) ( not ( = ?auto_73688 ?auto_73692 ) ) ( not ( = ?auto_73689 ?auto_73692 ) ) ( not ( = ?auto_73690 ?auto_73692 ) ) ( not ( = ?auto_73691 ?auto_73692 ) ) ( ON ?auto_73690 ?auto_73691 ) ( ON-TABLE ?auto_73692 ) ( ON ?auto_73689 ?auto_73690 ) ( ON ?auto_73688 ?auto_73689 ) ( ON ?auto_73687 ?auto_73688 ) ( CLEAR ?auto_73687 ) ( ON ?auto_73686 ?auto_73693 ) ( CLEAR ?auto_73686 ) ( HAND-EMPTY ) ( not ( = ?auto_73686 ?auto_73693 ) ) ( not ( = ?auto_73687 ?auto_73693 ) ) ( not ( = ?auto_73688 ?auto_73693 ) ) ( not ( = ?auto_73689 ?auto_73693 ) ) ( not ( = ?auto_73690 ?auto_73693 ) ) ( not ( = ?auto_73691 ?auto_73693 ) ) ( not ( = ?auto_73692 ?auto_73693 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73686 ?auto_73693 )
      ( MAKE-6PILE ?auto_73686 ?auto_73687 ?auto_73688 ?auto_73689 ?auto_73690 ?auto_73691 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73694 - BLOCK
      ?auto_73695 - BLOCK
      ?auto_73696 - BLOCK
      ?auto_73697 - BLOCK
      ?auto_73698 - BLOCK
      ?auto_73699 - BLOCK
    )
    :vars
    (
      ?auto_73701 - BLOCK
      ?auto_73700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73694 ?auto_73695 ) ) ( not ( = ?auto_73694 ?auto_73696 ) ) ( not ( = ?auto_73694 ?auto_73697 ) ) ( not ( = ?auto_73694 ?auto_73698 ) ) ( not ( = ?auto_73694 ?auto_73699 ) ) ( not ( = ?auto_73695 ?auto_73696 ) ) ( not ( = ?auto_73695 ?auto_73697 ) ) ( not ( = ?auto_73695 ?auto_73698 ) ) ( not ( = ?auto_73695 ?auto_73699 ) ) ( not ( = ?auto_73696 ?auto_73697 ) ) ( not ( = ?auto_73696 ?auto_73698 ) ) ( not ( = ?auto_73696 ?auto_73699 ) ) ( not ( = ?auto_73697 ?auto_73698 ) ) ( not ( = ?auto_73697 ?auto_73699 ) ) ( not ( = ?auto_73698 ?auto_73699 ) ) ( ON ?auto_73699 ?auto_73701 ) ( not ( = ?auto_73694 ?auto_73701 ) ) ( not ( = ?auto_73695 ?auto_73701 ) ) ( not ( = ?auto_73696 ?auto_73701 ) ) ( not ( = ?auto_73697 ?auto_73701 ) ) ( not ( = ?auto_73698 ?auto_73701 ) ) ( not ( = ?auto_73699 ?auto_73701 ) ) ( ON ?auto_73698 ?auto_73699 ) ( ON-TABLE ?auto_73701 ) ( ON ?auto_73697 ?auto_73698 ) ( ON ?auto_73696 ?auto_73697 ) ( ON ?auto_73694 ?auto_73700 ) ( CLEAR ?auto_73694 ) ( not ( = ?auto_73694 ?auto_73700 ) ) ( not ( = ?auto_73695 ?auto_73700 ) ) ( not ( = ?auto_73696 ?auto_73700 ) ) ( not ( = ?auto_73697 ?auto_73700 ) ) ( not ( = ?auto_73698 ?auto_73700 ) ) ( not ( = ?auto_73699 ?auto_73700 ) ) ( not ( = ?auto_73701 ?auto_73700 ) ) ( HOLDING ?auto_73695 ) ( CLEAR ?auto_73696 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73701 ?auto_73699 ?auto_73698 ?auto_73697 ?auto_73696 ?auto_73695 )
      ( MAKE-6PILE ?auto_73694 ?auto_73695 ?auto_73696 ?auto_73697 ?auto_73698 ?auto_73699 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73702 - BLOCK
      ?auto_73703 - BLOCK
      ?auto_73704 - BLOCK
      ?auto_73705 - BLOCK
      ?auto_73706 - BLOCK
      ?auto_73707 - BLOCK
    )
    :vars
    (
      ?auto_73709 - BLOCK
      ?auto_73708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73702 ?auto_73703 ) ) ( not ( = ?auto_73702 ?auto_73704 ) ) ( not ( = ?auto_73702 ?auto_73705 ) ) ( not ( = ?auto_73702 ?auto_73706 ) ) ( not ( = ?auto_73702 ?auto_73707 ) ) ( not ( = ?auto_73703 ?auto_73704 ) ) ( not ( = ?auto_73703 ?auto_73705 ) ) ( not ( = ?auto_73703 ?auto_73706 ) ) ( not ( = ?auto_73703 ?auto_73707 ) ) ( not ( = ?auto_73704 ?auto_73705 ) ) ( not ( = ?auto_73704 ?auto_73706 ) ) ( not ( = ?auto_73704 ?auto_73707 ) ) ( not ( = ?auto_73705 ?auto_73706 ) ) ( not ( = ?auto_73705 ?auto_73707 ) ) ( not ( = ?auto_73706 ?auto_73707 ) ) ( ON ?auto_73707 ?auto_73709 ) ( not ( = ?auto_73702 ?auto_73709 ) ) ( not ( = ?auto_73703 ?auto_73709 ) ) ( not ( = ?auto_73704 ?auto_73709 ) ) ( not ( = ?auto_73705 ?auto_73709 ) ) ( not ( = ?auto_73706 ?auto_73709 ) ) ( not ( = ?auto_73707 ?auto_73709 ) ) ( ON ?auto_73706 ?auto_73707 ) ( ON-TABLE ?auto_73709 ) ( ON ?auto_73705 ?auto_73706 ) ( ON ?auto_73704 ?auto_73705 ) ( ON ?auto_73702 ?auto_73708 ) ( not ( = ?auto_73702 ?auto_73708 ) ) ( not ( = ?auto_73703 ?auto_73708 ) ) ( not ( = ?auto_73704 ?auto_73708 ) ) ( not ( = ?auto_73705 ?auto_73708 ) ) ( not ( = ?auto_73706 ?auto_73708 ) ) ( not ( = ?auto_73707 ?auto_73708 ) ) ( not ( = ?auto_73709 ?auto_73708 ) ) ( CLEAR ?auto_73704 ) ( ON ?auto_73703 ?auto_73702 ) ( CLEAR ?auto_73703 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73708 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73708 ?auto_73702 )
      ( MAKE-6PILE ?auto_73702 ?auto_73703 ?auto_73704 ?auto_73705 ?auto_73706 ?auto_73707 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73710 - BLOCK
      ?auto_73711 - BLOCK
      ?auto_73712 - BLOCK
      ?auto_73713 - BLOCK
      ?auto_73714 - BLOCK
      ?auto_73715 - BLOCK
    )
    :vars
    (
      ?auto_73716 - BLOCK
      ?auto_73717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73710 ?auto_73711 ) ) ( not ( = ?auto_73710 ?auto_73712 ) ) ( not ( = ?auto_73710 ?auto_73713 ) ) ( not ( = ?auto_73710 ?auto_73714 ) ) ( not ( = ?auto_73710 ?auto_73715 ) ) ( not ( = ?auto_73711 ?auto_73712 ) ) ( not ( = ?auto_73711 ?auto_73713 ) ) ( not ( = ?auto_73711 ?auto_73714 ) ) ( not ( = ?auto_73711 ?auto_73715 ) ) ( not ( = ?auto_73712 ?auto_73713 ) ) ( not ( = ?auto_73712 ?auto_73714 ) ) ( not ( = ?auto_73712 ?auto_73715 ) ) ( not ( = ?auto_73713 ?auto_73714 ) ) ( not ( = ?auto_73713 ?auto_73715 ) ) ( not ( = ?auto_73714 ?auto_73715 ) ) ( ON ?auto_73715 ?auto_73716 ) ( not ( = ?auto_73710 ?auto_73716 ) ) ( not ( = ?auto_73711 ?auto_73716 ) ) ( not ( = ?auto_73712 ?auto_73716 ) ) ( not ( = ?auto_73713 ?auto_73716 ) ) ( not ( = ?auto_73714 ?auto_73716 ) ) ( not ( = ?auto_73715 ?auto_73716 ) ) ( ON ?auto_73714 ?auto_73715 ) ( ON-TABLE ?auto_73716 ) ( ON ?auto_73713 ?auto_73714 ) ( ON ?auto_73710 ?auto_73717 ) ( not ( = ?auto_73710 ?auto_73717 ) ) ( not ( = ?auto_73711 ?auto_73717 ) ) ( not ( = ?auto_73712 ?auto_73717 ) ) ( not ( = ?auto_73713 ?auto_73717 ) ) ( not ( = ?auto_73714 ?auto_73717 ) ) ( not ( = ?auto_73715 ?auto_73717 ) ) ( not ( = ?auto_73716 ?auto_73717 ) ) ( ON ?auto_73711 ?auto_73710 ) ( CLEAR ?auto_73711 ) ( ON-TABLE ?auto_73717 ) ( HOLDING ?auto_73712 ) ( CLEAR ?auto_73713 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73716 ?auto_73715 ?auto_73714 ?auto_73713 ?auto_73712 )
      ( MAKE-6PILE ?auto_73710 ?auto_73711 ?auto_73712 ?auto_73713 ?auto_73714 ?auto_73715 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73718 - BLOCK
      ?auto_73719 - BLOCK
      ?auto_73720 - BLOCK
      ?auto_73721 - BLOCK
      ?auto_73722 - BLOCK
      ?auto_73723 - BLOCK
    )
    :vars
    (
      ?auto_73725 - BLOCK
      ?auto_73724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73718 ?auto_73719 ) ) ( not ( = ?auto_73718 ?auto_73720 ) ) ( not ( = ?auto_73718 ?auto_73721 ) ) ( not ( = ?auto_73718 ?auto_73722 ) ) ( not ( = ?auto_73718 ?auto_73723 ) ) ( not ( = ?auto_73719 ?auto_73720 ) ) ( not ( = ?auto_73719 ?auto_73721 ) ) ( not ( = ?auto_73719 ?auto_73722 ) ) ( not ( = ?auto_73719 ?auto_73723 ) ) ( not ( = ?auto_73720 ?auto_73721 ) ) ( not ( = ?auto_73720 ?auto_73722 ) ) ( not ( = ?auto_73720 ?auto_73723 ) ) ( not ( = ?auto_73721 ?auto_73722 ) ) ( not ( = ?auto_73721 ?auto_73723 ) ) ( not ( = ?auto_73722 ?auto_73723 ) ) ( ON ?auto_73723 ?auto_73725 ) ( not ( = ?auto_73718 ?auto_73725 ) ) ( not ( = ?auto_73719 ?auto_73725 ) ) ( not ( = ?auto_73720 ?auto_73725 ) ) ( not ( = ?auto_73721 ?auto_73725 ) ) ( not ( = ?auto_73722 ?auto_73725 ) ) ( not ( = ?auto_73723 ?auto_73725 ) ) ( ON ?auto_73722 ?auto_73723 ) ( ON-TABLE ?auto_73725 ) ( ON ?auto_73721 ?auto_73722 ) ( ON ?auto_73718 ?auto_73724 ) ( not ( = ?auto_73718 ?auto_73724 ) ) ( not ( = ?auto_73719 ?auto_73724 ) ) ( not ( = ?auto_73720 ?auto_73724 ) ) ( not ( = ?auto_73721 ?auto_73724 ) ) ( not ( = ?auto_73722 ?auto_73724 ) ) ( not ( = ?auto_73723 ?auto_73724 ) ) ( not ( = ?auto_73725 ?auto_73724 ) ) ( ON ?auto_73719 ?auto_73718 ) ( ON-TABLE ?auto_73724 ) ( CLEAR ?auto_73721 ) ( ON ?auto_73720 ?auto_73719 ) ( CLEAR ?auto_73720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73724 ?auto_73718 ?auto_73719 )
      ( MAKE-6PILE ?auto_73718 ?auto_73719 ?auto_73720 ?auto_73721 ?auto_73722 ?auto_73723 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73726 - BLOCK
      ?auto_73727 - BLOCK
      ?auto_73728 - BLOCK
      ?auto_73729 - BLOCK
      ?auto_73730 - BLOCK
      ?auto_73731 - BLOCK
    )
    :vars
    (
      ?auto_73733 - BLOCK
      ?auto_73732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73726 ?auto_73727 ) ) ( not ( = ?auto_73726 ?auto_73728 ) ) ( not ( = ?auto_73726 ?auto_73729 ) ) ( not ( = ?auto_73726 ?auto_73730 ) ) ( not ( = ?auto_73726 ?auto_73731 ) ) ( not ( = ?auto_73727 ?auto_73728 ) ) ( not ( = ?auto_73727 ?auto_73729 ) ) ( not ( = ?auto_73727 ?auto_73730 ) ) ( not ( = ?auto_73727 ?auto_73731 ) ) ( not ( = ?auto_73728 ?auto_73729 ) ) ( not ( = ?auto_73728 ?auto_73730 ) ) ( not ( = ?auto_73728 ?auto_73731 ) ) ( not ( = ?auto_73729 ?auto_73730 ) ) ( not ( = ?auto_73729 ?auto_73731 ) ) ( not ( = ?auto_73730 ?auto_73731 ) ) ( ON ?auto_73731 ?auto_73733 ) ( not ( = ?auto_73726 ?auto_73733 ) ) ( not ( = ?auto_73727 ?auto_73733 ) ) ( not ( = ?auto_73728 ?auto_73733 ) ) ( not ( = ?auto_73729 ?auto_73733 ) ) ( not ( = ?auto_73730 ?auto_73733 ) ) ( not ( = ?auto_73731 ?auto_73733 ) ) ( ON ?auto_73730 ?auto_73731 ) ( ON-TABLE ?auto_73733 ) ( ON ?auto_73726 ?auto_73732 ) ( not ( = ?auto_73726 ?auto_73732 ) ) ( not ( = ?auto_73727 ?auto_73732 ) ) ( not ( = ?auto_73728 ?auto_73732 ) ) ( not ( = ?auto_73729 ?auto_73732 ) ) ( not ( = ?auto_73730 ?auto_73732 ) ) ( not ( = ?auto_73731 ?auto_73732 ) ) ( not ( = ?auto_73733 ?auto_73732 ) ) ( ON ?auto_73727 ?auto_73726 ) ( ON-TABLE ?auto_73732 ) ( ON ?auto_73728 ?auto_73727 ) ( CLEAR ?auto_73728 ) ( HOLDING ?auto_73729 ) ( CLEAR ?auto_73730 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73733 ?auto_73731 ?auto_73730 ?auto_73729 )
      ( MAKE-6PILE ?auto_73726 ?auto_73727 ?auto_73728 ?auto_73729 ?auto_73730 ?auto_73731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73734 - BLOCK
      ?auto_73735 - BLOCK
      ?auto_73736 - BLOCK
      ?auto_73737 - BLOCK
      ?auto_73738 - BLOCK
      ?auto_73739 - BLOCK
    )
    :vars
    (
      ?auto_73741 - BLOCK
      ?auto_73740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73734 ?auto_73735 ) ) ( not ( = ?auto_73734 ?auto_73736 ) ) ( not ( = ?auto_73734 ?auto_73737 ) ) ( not ( = ?auto_73734 ?auto_73738 ) ) ( not ( = ?auto_73734 ?auto_73739 ) ) ( not ( = ?auto_73735 ?auto_73736 ) ) ( not ( = ?auto_73735 ?auto_73737 ) ) ( not ( = ?auto_73735 ?auto_73738 ) ) ( not ( = ?auto_73735 ?auto_73739 ) ) ( not ( = ?auto_73736 ?auto_73737 ) ) ( not ( = ?auto_73736 ?auto_73738 ) ) ( not ( = ?auto_73736 ?auto_73739 ) ) ( not ( = ?auto_73737 ?auto_73738 ) ) ( not ( = ?auto_73737 ?auto_73739 ) ) ( not ( = ?auto_73738 ?auto_73739 ) ) ( ON ?auto_73739 ?auto_73741 ) ( not ( = ?auto_73734 ?auto_73741 ) ) ( not ( = ?auto_73735 ?auto_73741 ) ) ( not ( = ?auto_73736 ?auto_73741 ) ) ( not ( = ?auto_73737 ?auto_73741 ) ) ( not ( = ?auto_73738 ?auto_73741 ) ) ( not ( = ?auto_73739 ?auto_73741 ) ) ( ON ?auto_73738 ?auto_73739 ) ( ON-TABLE ?auto_73741 ) ( ON ?auto_73734 ?auto_73740 ) ( not ( = ?auto_73734 ?auto_73740 ) ) ( not ( = ?auto_73735 ?auto_73740 ) ) ( not ( = ?auto_73736 ?auto_73740 ) ) ( not ( = ?auto_73737 ?auto_73740 ) ) ( not ( = ?auto_73738 ?auto_73740 ) ) ( not ( = ?auto_73739 ?auto_73740 ) ) ( not ( = ?auto_73741 ?auto_73740 ) ) ( ON ?auto_73735 ?auto_73734 ) ( ON-TABLE ?auto_73740 ) ( ON ?auto_73736 ?auto_73735 ) ( CLEAR ?auto_73738 ) ( ON ?auto_73737 ?auto_73736 ) ( CLEAR ?auto_73737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73740 ?auto_73734 ?auto_73735 ?auto_73736 )
      ( MAKE-6PILE ?auto_73734 ?auto_73735 ?auto_73736 ?auto_73737 ?auto_73738 ?auto_73739 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73742 - BLOCK
      ?auto_73743 - BLOCK
      ?auto_73744 - BLOCK
      ?auto_73745 - BLOCK
      ?auto_73746 - BLOCK
      ?auto_73747 - BLOCK
    )
    :vars
    (
      ?auto_73749 - BLOCK
      ?auto_73748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73742 ?auto_73743 ) ) ( not ( = ?auto_73742 ?auto_73744 ) ) ( not ( = ?auto_73742 ?auto_73745 ) ) ( not ( = ?auto_73742 ?auto_73746 ) ) ( not ( = ?auto_73742 ?auto_73747 ) ) ( not ( = ?auto_73743 ?auto_73744 ) ) ( not ( = ?auto_73743 ?auto_73745 ) ) ( not ( = ?auto_73743 ?auto_73746 ) ) ( not ( = ?auto_73743 ?auto_73747 ) ) ( not ( = ?auto_73744 ?auto_73745 ) ) ( not ( = ?auto_73744 ?auto_73746 ) ) ( not ( = ?auto_73744 ?auto_73747 ) ) ( not ( = ?auto_73745 ?auto_73746 ) ) ( not ( = ?auto_73745 ?auto_73747 ) ) ( not ( = ?auto_73746 ?auto_73747 ) ) ( ON ?auto_73747 ?auto_73749 ) ( not ( = ?auto_73742 ?auto_73749 ) ) ( not ( = ?auto_73743 ?auto_73749 ) ) ( not ( = ?auto_73744 ?auto_73749 ) ) ( not ( = ?auto_73745 ?auto_73749 ) ) ( not ( = ?auto_73746 ?auto_73749 ) ) ( not ( = ?auto_73747 ?auto_73749 ) ) ( ON-TABLE ?auto_73749 ) ( ON ?auto_73742 ?auto_73748 ) ( not ( = ?auto_73742 ?auto_73748 ) ) ( not ( = ?auto_73743 ?auto_73748 ) ) ( not ( = ?auto_73744 ?auto_73748 ) ) ( not ( = ?auto_73745 ?auto_73748 ) ) ( not ( = ?auto_73746 ?auto_73748 ) ) ( not ( = ?auto_73747 ?auto_73748 ) ) ( not ( = ?auto_73749 ?auto_73748 ) ) ( ON ?auto_73743 ?auto_73742 ) ( ON-TABLE ?auto_73748 ) ( ON ?auto_73744 ?auto_73743 ) ( ON ?auto_73745 ?auto_73744 ) ( CLEAR ?auto_73745 ) ( HOLDING ?auto_73746 ) ( CLEAR ?auto_73747 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73749 ?auto_73747 ?auto_73746 )
      ( MAKE-6PILE ?auto_73742 ?auto_73743 ?auto_73744 ?auto_73745 ?auto_73746 ?auto_73747 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73750 - BLOCK
      ?auto_73751 - BLOCK
      ?auto_73752 - BLOCK
      ?auto_73753 - BLOCK
      ?auto_73754 - BLOCK
      ?auto_73755 - BLOCK
    )
    :vars
    (
      ?auto_73756 - BLOCK
      ?auto_73757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73750 ?auto_73751 ) ) ( not ( = ?auto_73750 ?auto_73752 ) ) ( not ( = ?auto_73750 ?auto_73753 ) ) ( not ( = ?auto_73750 ?auto_73754 ) ) ( not ( = ?auto_73750 ?auto_73755 ) ) ( not ( = ?auto_73751 ?auto_73752 ) ) ( not ( = ?auto_73751 ?auto_73753 ) ) ( not ( = ?auto_73751 ?auto_73754 ) ) ( not ( = ?auto_73751 ?auto_73755 ) ) ( not ( = ?auto_73752 ?auto_73753 ) ) ( not ( = ?auto_73752 ?auto_73754 ) ) ( not ( = ?auto_73752 ?auto_73755 ) ) ( not ( = ?auto_73753 ?auto_73754 ) ) ( not ( = ?auto_73753 ?auto_73755 ) ) ( not ( = ?auto_73754 ?auto_73755 ) ) ( ON ?auto_73755 ?auto_73756 ) ( not ( = ?auto_73750 ?auto_73756 ) ) ( not ( = ?auto_73751 ?auto_73756 ) ) ( not ( = ?auto_73752 ?auto_73756 ) ) ( not ( = ?auto_73753 ?auto_73756 ) ) ( not ( = ?auto_73754 ?auto_73756 ) ) ( not ( = ?auto_73755 ?auto_73756 ) ) ( ON-TABLE ?auto_73756 ) ( ON ?auto_73750 ?auto_73757 ) ( not ( = ?auto_73750 ?auto_73757 ) ) ( not ( = ?auto_73751 ?auto_73757 ) ) ( not ( = ?auto_73752 ?auto_73757 ) ) ( not ( = ?auto_73753 ?auto_73757 ) ) ( not ( = ?auto_73754 ?auto_73757 ) ) ( not ( = ?auto_73755 ?auto_73757 ) ) ( not ( = ?auto_73756 ?auto_73757 ) ) ( ON ?auto_73751 ?auto_73750 ) ( ON-TABLE ?auto_73757 ) ( ON ?auto_73752 ?auto_73751 ) ( ON ?auto_73753 ?auto_73752 ) ( CLEAR ?auto_73755 ) ( ON ?auto_73754 ?auto_73753 ) ( CLEAR ?auto_73754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73757 ?auto_73750 ?auto_73751 ?auto_73752 ?auto_73753 )
      ( MAKE-6PILE ?auto_73750 ?auto_73751 ?auto_73752 ?auto_73753 ?auto_73754 ?auto_73755 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73758 - BLOCK
      ?auto_73759 - BLOCK
      ?auto_73760 - BLOCK
      ?auto_73761 - BLOCK
      ?auto_73762 - BLOCK
      ?auto_73763 - BLOCK
    )
    :vars
    (
      ?auto_73764 - BLOCK
      ?auto_73765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73758 ?auto_73759 ) ) ( not ( = ?auto_73758 ?auto_73760 ) ) ( not ( = ?auto_73758 ?auto_73761 ) ) ( not ( = ?auto_73758 ?auto_73762 ) ) ( not ( = ?auto_73758 ?auto_73763 ) ) ( not ( = ?auto_73759 ?auto_73760 ) ) ( not ( = ?auto_73759 ?auto_73761 ) ) ( not ( = ?auto_73759 ?auto_73762 ) ) ( not ( = ?auto_73759 ?auto_73763 ) ) ( not ( = ?auto_73760 ?auto_73761 ) ) ( not ( = ?auto_73760 ?auto_73762 ) ) ( not ( = ?auto_73760 ?auto_73763 ) ) ( not ( = ?auto_73761 ?auto_73762 ) ) ( not ( = ?auto_73761 ?auto_73763 ) ) ( not ( = ?auto_73762 ?auto_73763 ) ) ( not ( = ?auto_73758 ?auto_73764 ) ) ( not ( = ?auto_73759 ?auto_73764 ) ) ( not ( = ?auto_73760 ?auto_73764 ) ) ( not ( = ?auto_73761 ?auto_73764 ) ) ( not ( = ?auto_73762 ?auto_73764 ) ) ( not ( = ?auto_73763 ?auto_73764 ) ) ( ON-TABLE ?auto_73764 ) ( ON ?auto_73758 ?auto_73765 ) ( not ( = ?auto_73758 ?auto_73765 ) ) ( not ( = ?auto_73759 ?auto_73765 ) ) ( not ( = ?auto_73760 ?auto_73765 ) ) ( not ( = ?auto_73761 ?auto_73765 ) ) ( not ( = ?auto_73762 ?auto_73765 ) ) ( not ( = ?auto_73763 ?auto_73765 ) ) ( not ( = ?auto_73764 ?auto_73765 ) ) ( ON ?auto_73759 ?auto_73758 ) ( ON-TABLE ?auto_73765 ) ( ON ?auto_73760 ?auto_73759 ) ( ON ?auto_73761 ?auto_73760 ) ( ON ?auto_73762 ?auto_73761 ) ( CLEAR ?auto_73762 ) ( HOLDING ?auto_73763 ) ( CLEAR ?auto_73764 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73764 ?auto_73763 )
      ( MAKE-6PILE ?auto_73758 ?auto_73759 ?auto_73760 ?auto_73761 ?auto_73762 ?auto_73763 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73766 - BLOCK
      ?auto_73767 - BLOCK
      ?auto_73768 - BLOCK
      ?auto_73769 - BLOCK
      ?auto_73770 - BLOCK
      ?auto_73771 - BLOCK
    )
    :vars
    (
      ?auto_73773 - BLOCK
      ?auto_73772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73766 ?auto_73767 ) ) ( not ( = ?auto_73766 ?auto_73768 ) ) ( not ( = ?auto_73766 ?auto_73769 ) ) ( not ( = ?auto_73766 ?auto_73770 ) ) ( not ( = ?auto_73766 ?auto_73771 ) ) ( not ( = ?auto_73767 ?auto_73768 ) ) ( not ( = ?auto_73767 ?auto_73769 ) ) ( not ( = ?auto_73767 ?auto_73770 ) ) ( not ( = ?auto_73767 ?auto_73771 ) ) ( not ( = ?auto_73768 ?auto_73769 ) ) ( not ( = ?auto_73768 ?auto_73770 ) ) ( not ( = ?auto_73768 ?auto_73771 ) ) ( not ( = ?auto_73769 ?auto_73770 ) ) ( not ( = ?auto_73769 ?auto_73771 ) ) ( not ( = ?auto_73770 ?auto_73771 ) ) ( not ( = ?auto_73766 ?auto_73773 ) ) ( not ( = ?auto_73767 ?auto_73773 ) ) ( not ( = ?auto_73768 ?auto_73773 ) ) ( not ( = ?auto_73769 ?auto_73773 ) ) ( not ( = ?auto_73770 ?auto_73773 ) ) ( not ( = ?auto_73771 ?auto_73773 ) ) ( ON-TABLE ?auto_73773 ) ( ON ?auto_73766 ?auto_73772 ) ( not ( = ?auto_73766 ?auto_73772 ) ) ( not ( = ?auto_73767 ?auto_73772 ) ) ( not ( = ?auto_73768 ?auto_73772 ) ) ( not ( = ?auto_73769 ?auto_73772 ) ) ( not ( = ?auto_73770 ?auto_73772 ) ) ( not ( = ?auto_73771 ?auto_73772 ) ) ( not ( = ?auto_73773 ?auto_73772 ) ) ( ON ?auto_73767 ?auto_73766 ) ( ON-TABLE ?auto_73772 ) ( ON ?auto_73768 ?auto_73767 ) ( ON ?auto_73769 ?auto_73768 ) ( ON ?auto_73770 ?auto_73769 ) ( CLEAR ?auto_73773 ) ( ON ?auto_73771 ?auto_73770 ) ( CLEAR ?auto_73771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73772 ?auto_73766 ?auto_73767 ?auto_73768 ?auto_73769 ?auto_73770 )
      ( MAKE-6PILE ?auto_73766 ?auto_73767 ?auto_73768 ?auto_73769 ?auto_73770 ?auto_73771 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73774 - BLOCK
      ?auto_73775 - BLOCK
      ?auto_73776 - BLOCK
      ?auto_73777 - BLOCK
      ?auto_73778 - BLOCK
      ?auto_73779 - BLOCK
    )
    :vars
    (
      ?auto_73780 - BLOCK
      ?auto_73781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73774 ?auto_73775 ) ) ( not ( = ?auto_73774 ?auto_73776 ) ) ( not ( = ?auto_73774 ?auto_73777 ) ) ( not ( = ?auto_73774 ?auto_73778 ) ) ( not ( = ?auto_73774 ?auto_73779 ) ) ( not ( = ?auto_73775 ?auto_73776 ) ) ( not ( = ?auto_73775 ?auto_73777 ) ) ( not ( = ?auto_73775 ?auto_73778 ) ) ( not ( = ?auto_73775 ?auto_73779 ) ) ( not ( = ?auto_73776 ?auto_73777 ) ) ( not ( = ?auto_73776 ?auto_73778 ) ) ( not ( = ?auto_73776 ?auto_73779 ) ) ( not ( = ?auto_73777 ?auto_73778 ) ) ( not ( = ?auto_73777 ?auto_73779 ) ) ( not ( = ?auto_73778 ?auto_73779 ) ) ( not ( = ?auto_73774 ?auto_73780 ) ) ( not ( = ?auto_73775 ?auto_73780 ) ) ( not ( = ?auto_73776 ?auto_73780 ) ) ( not ( = ?auto_73777 ?auto_73780 ) ) ( not ( = ?auto_73778 ?auto_73780 ) ) ( not ( = ?auto_73779 ?auto_73780 ) ) ( ON ?auto_73774 ?auto_73781 ) ( not ( = ?auto_73774 ?auto_73781 ) ) ( not ( = ?auto_73775 ?auto_73781 ) ) ( not ( = ?auto_73776 ?auto_73781 ) ) ( not ( = ?auto_73777 ?auto_73781 ) ) ( not ( = ?auto_73778 ?auto_73781 ) ) ( not ( = ?auto_73779 ?auto_73781 ) ) ( not ( = ?auto_73780 ?auto_73781 ) ) ( ON ?auto_73775 ?auto_73774 ) ( ON-TABLE ?auto_73781 ) ( ON ?auto_73776 ?auto_73775 ) ( ON ?auto_73777 ?auto_73776 ) ( ON ?auto_73778 ?auto_73777 ) ( ON ?auto_73779 ?auto_73778 ) ( CLEAR ?auto_73779 ) ( HOLDING ?auto_73780 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73780 )
      ( MAKE-6PILE ?auto_73774 ?auto_73775 ?auto_73776 ?auto_73777 ?auto_73778 ?auto_73779 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73782 - BLOCK
      ?auto_73783 - BLOCK
      ?auto_73784 - BLOCK
      ?auto_73785 - BLOCK
      ?auto_73786 - BLOCK
      ?auto_73787 - BLOCK
    )
    :vars
    (
      ?auto_73789 - BLOCK
      ?auto_73788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73782 ?auto_73783 ) ) ( not ( = ?auto_73782 ?auto_73784 ) ) ( not ( = ?auto_73782 ?auto_73785 ) ) ( not ( = ?auto_73782 ?auto_73786 ) ) ( not ( = ?auto_73782 ?auto_73787 ) ) ( not ( = ?auto_73783 ?auto_73784 ) ) ( not ( = ?auto_73783 ?auto_73785 ) ) ( not ( = ?auto_73783 ?auto_73786 ) ) ( not ( = ?auto_73783 ?auto_73787 ) ) ( not ( = ?auto_73784 ?auto_73785 ) ) ( not ( = ?auto_73784 ?auto_73786 ) ) ( not ( = ?auto_73784 ?auto_73787 ) ) ( not ( = ?auto_73785 ?auto_73786 ) ) ( not ( = ?auto_73785 ?auto_73787 ) ) ( not ( = ?auto_73786 ?auto_73787 ) ) ( not ( = ?auto_73782 ?auto_73789 ) ) ( not ( = ?auto_73783 ?auto_73789 ) ) ( not ( = ?auto_73784 ?auto_73789 ) ) ( not ( = ?auto_73785 ?auto_73789 ) ) ( not ( = ?auto_73786 ?auto_73789 ) ) ( not ( = ?auto_73787 ?auto_73789 ) ) ( ON ?auto_73782 ?auto_73788 ) ( not ( = ?auto_73782 ?auto_73788 ) ) ( not ( = ?auto_73783 ?auto_73788 ) ) ( not ( = ?auto_73784 ?auto_73788 ) ) ( not ( = ?auto_73785 ?auto_73788 ) ) ( not ( = ?auto_73786 ?auto_73788 ) ) ( not ( = ?auto_73787 ?auto_73788 ) ) ( not ( = ?auto_73789 ?auto_73788 ) ) ( ON ?auto_73783 ?auto_73782 ) ( ON-TABLE ?auto_73788 ) ( ON ?auto_73784 ?auto_73783 ) ( ON ?auto_73785 ?auto_73784 ) ( ON ?auto_73786 ?auto_73785 ) ( ON ?auto_73787 ?auto_73786 ) ( ON ?auto_73789 ?auto_73787 ) ( CLEAR ?auto_73789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_73788 ?auto_73782 ?auto_73783 ?auto_73784 ?auto_73785 ?auto_73786 ?auto_73787 )
      ( MAKE-6PILE ?auto_73782 ?auto_73783 ?auto_73784 ?auto_73785 ?auto_73786 ?auto_73787 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73804 - BLOCK
      ?auto_73805 - BLOCK
      ?auto_73806 - BLOCK
      ?auto_73807 - BLOCK
      ?auto_73808 - BLOCK
      ?auto_73809 - BLOCK
      ?auto_73810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73809 ) ( ON-TABLE ?auto_73804 ) ( ON ?auto_73805 ?auto_73804 ) ( ON ?auto_73806 ?auto_73805 ) ( ON ?auto_73807 ?auto_73806 ) ( ON ?auto_73808 ?auto_73807 ) ( ON ?auto_73809 ?auto_73808 ) ( not ( = ?auto_73804 ?auto_73805 ) ) ( not ( = ?auto_73804 ?auto_73806 ) ) ( not ( = ?auto_73804 ?auto_73807 ) ) ( not ( = ?auto_73804 ?auto_73808 ) ) ( not ( = ?auto_73804 ?auto_73809 ) ) ( not ( = ?auto_73804 ?auto_73810 ) ) ( not ( = ?auto_73805 ?auto_73806 ) ) ( not ( = ?auto_73805 ?auto_73807 ) ) ( not ( = ?auto_73805 ?auto_73808 ) ) ( not ( = ?auto_73805 ?auto_73809 ) ) ( not ( = ?auto_73805 ?auto_73810 ) ) ( not ( = ?auto_73806 ?auto_73807 ) ) ( not ( = ?auto_73806 ?auto_73808 ) ) ( not ( = ?auto_73806 ?auto_73809 ) ) ( not ( = ?auto_73806 ?auto_73810 ) ) ( not ( = ?auto_73807 ?auto_73808 ) ) ( not ( = ?auto_73807 ?auto_73809 ) ) ( not ( = ?auto_73807 ?auto_73810 ) ) ( not ( = ?auto_73808 ?auto_73809 ) ) ( not ( = ?auto_73808 ?auto_73810 ) ) ( not ( = ?auto_73809 ?auto_73810 ) ) ( ON-TABLE ?auto_73810 ) ( CLEAR ?auto_73810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_73810 )
      ( MAKE-7PILE ?auto_73804 ?auto_73805 ?auto_73806 ?auto_73807 ?auto_73808 ?auto_73809 ?auto_73810 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73811 - BLOCK
      ?auto_73812 - BLOCK
      ?auto_73813 - BLOCK
      ?auto_73814 - BLOCK
      ?auto_73815 - BLOCK
      ?auto_73816 - BLOCK
      ?auto_73817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73811 ) ( ON ?auto_73812 ?auto_73811 ) ( ON ?auto_73813 ?auto_73812 ) ( ON ?auto_73814 ?auto_73813 ) ( ON ?auto_73815 ?auto_73814 ) ( not ( = ?auto_73811 ?auto_73812 ) ) ( not ( = ?auto_73811 ?auto_73813 ) ) ( not ( = ?auto_73811 ?auto_73814 ) ) ( not ( = ?auto_73811 ?auto_73815 ) ) ( not ( = ?auto_73811 ?auto_73816 ) ) ( not ( = ?auto_73811 ?auto_73817 ) ) ( not ( = ?auto_73812 ?auto_73813 ) ) ( not ( = ?auto_73812 ?auto_73814 ) ) ( not ( = ?auto_73812 ?auto_73815 ) ) ( not ( = ?auto_73812 ?auto_73816 ) ) ( not ( = ?auto_73812 ?auto_73817 ) ) ( not ( = ?auto_73813 ?auto_73814 ) ) ( not ( = ?auto_73813 ?auto_73815 ) ) ( not ( = ?auto_73813 ?auto_73816 ) ) ( not ( = ?auto_73813 ?auto_73817 ) ) ( not ( = ?auto_73814 ?auto_73815 ) ) ( not ( = ?auto_73814 ?auto_73816 ) ) ( not ( = ?auto_73814 ?auto_73817 ) ) ( not ( = ?auto_73815 ?auto_73816 ) ) ( not ( = ?auto_73815 ?auto_73817 ) ) ( not ( = ?auto_73816 ?auto_73817 ) ) ( ON-TABLE ?auto_73817 ) ( CLEAR ?auto_73817 ) ( HOLDING ?auto_73816 ) ( CLEAR ?auto_73815 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73811 ?auto_73812 ?auto_73813 ?auto_73814 ?auto_73815 ?auto_73816 )
      ( MAKE-7PILE ?auto_73811 ?auto_73812 ?auto_73813 ?auto_73814 ?auto_73815 ?auto_73816 ?auto_73817 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73818 - BLOCK
      ?auto_73819 - BLOCK
      ?auto_73820 - BLOCK
      ?auto_73821 - BLOCK
      ?auto_73822 - BLOCK
      ?auto_73823 - BLOCK
      ?auto_73824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73818 ) ( ON ?auto_73819 ?auto_73818 ) ( ON ?auto_73820 ?auto_73819 ) ( ON ?auto_73821 ?auto_73820 ) ( ON ?auto_73822 ?auto_73821 ) ( not ( = ?auto_73818 ?auto_73819 ) ) ( not ( = ?auto_73818 ?auto_73820 ) ) ( not ( = ?auto_73818 ?auto_73821 ) ) ( not ( = ?auto_73818 ?auto_73822 ) ) ( not ( = ?auto_73818 ?auto_73823 ) ) ( not ( = ?auto_73818 ?auto_73824 ) ) ( not ( = ?auto_73819 ?auto_73820 ) ) ( not ( = ?auto_73819 ?auto_73821 ) ) ( not ( = ?auto_73819 ?auto_73822 ) ) ( not ( = ?auto_73819 ?auto_73823 ) ) ( not ( = ?auto_73819 ?auto_73824 ) ) ( not ( = ?auto_73820 ?auto_73821 ) ) ( not ( = ?auto_73820 ?auto_73822 ) ) ( not ( = ?auto_73820 ?auto_73823 ) ) ( not ( = ?auto_73820 ?auto_73824 ) ) ( not ( = ?auto_73821 ?auto_73822 ) ) ( not ( = ?auto_73821 ?auto_73823 ) ) ( not ( = ?auto_73821 ?auto_73824 ) ) ( not ( = ?auto_73822 ?auto_73823 ) ) ( not ( = ?auto_73822 ?auto_73824 ) ) ( not ( = ?auto_73823 ?auto_73824 ) ) ( ON-TABLE ?auto_73824 ) ( CLEAR ?auto_73822 ) ( ON ?auto_73823 ?auto_73824 ) ( CLEAR ?auto_73823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73824 )
      ( MAKE-7PILE ?auto_73818 ?auto_73819 ?auto_73820 ?auto_73821 ?auto_73822 ?auto_73823 ?auto_73824 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73825 - BLOCK
      ?auto_73826 - BLOCK
      ?auto_73827 - BLOCK
      ?auto_73828 - BLOCK
      ?auto_73829 - BLOCK
      ?auto_73830 - BLOCK
      ?auto_73831 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73825 ) ( ON ?auto_73826 ?auto_73825 ) ( ON ?auto_73827 ?auto_73826 ) ( ON ?auto_73828 ?auto_73827 ) ( not ( = ?auto_73825 ?auto_73826 ) ) ( not ( = ?auto_73825 ?auto_73827 ) ) ( not ( = ?auto_73825 ?auto_73828 ) ) ( not ( = ?auto_73825 ?auto_73829 ) ) ( not ( = ?auto_73825 ?auto_73830 ) ) ( not ( = ?auto_73825 ?auto_73831 ) ) ( not ( = ?auto_73826 ?auto_73827 ) ) ( not ( = ?auto_73826 ?auto_73828 ) ) ( not ( = ?auto_73826 ?auto_73829 ) ) ( not ( = ?auto_73826 ?auto_73830 ) ) ( not ( = ?auto_73826 ?auto_73831 ) ) ( not ( = ?auto_73827 ?auto_73828 ) ) ( not ( = ?auto_73827 ?auto_73829 ) ) ( not ( = ?auto_73827 ?auto_73830 ) ) ( not ( = ?auto_73827 ?auto_73831 ) ) ( not ( = ?auto_73828 ?auto_73829 ) ) ( not ( = ?auto_73828 ?auto_73830 ) ) ( not ( = ?auto_73828 ?auto_73831 ) ) ( not ( = ?auto_73829 ?auto_73830 ) ) ( not ( = ?auto_73829 ?auto_73831 ) ) ( not ( = ?auto_73830 ?auto_73831 ) ) ( ON-TABLE ?auto_73831 ) ( ON ?auto_73830 ?auto_73831 ) ( CLEAR ?auto_73830 ) ( HOLDING ?auto_73829 ) ( CLEAR ?auto_73828 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73825 ?auto_73826 ?auto_73827 ?auto_73828 ?auto_73829 )
      ( MAKE-7PILE ?auto_73825 ?auto_73826 ?auto_73827 ?auto_73828 ?auto_73829 ?auto_73830 ?auto_73831 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73832 - BLOCK
      ?auto_73833 - BLOCK
      ?auto_73834 - BLOCK
      ?auto_73835 - BLOCK
      ?auto_73836 - BLOCK
      ?auto_73837 - BLOCK
      ?auto_73838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73832 ) ( ON ?auto_73833 ?auto_73832 ) ( ON ?auto_73834 ?auto_73833 ) ( ON ?auto_73835 ?auto_73834 ) ( not ( = ?auto_73832 ?auto_73833 ) ) ( not ( = ?auto_73832 ?auto_73834 ) ) ( not ( = ?auto_73832 ?auto_73835 ) ) ( not ( = ?auto_73832 ?auto_73836 ) ) ( not ( = ?auto_73832 ?auto_73837 ) ) ( not ( = ?auto_73832 ?auto_73838 ) ) ( not ( = ?auto_73833 ?auto_73834 ) ) ( not ( = ?auto_73833 ?auto_73835 ) ) ( not ( = ?auto_73833 ?auto_73836 ) ) ( not ( = ?auto_73833 ?auto_73837 ) ) ( not ( = ?auto_73833 ?auto_73838 ) ) ( not ( = ?auto_73834 ?auto_73835 ) ) ( not ( = ?auto_73834 ?auto_73836 ) ) ( not ( = ?auto_73834 ?auto_73837 ) ) ( not ( = ?auto_73834 ?auto_73838 ) ) ( not ( = ?auto_73835 ?auto_73836 ) ) ( not ( = ?auto_73835 ?auto_73837 ) ) ( not ( = ?auto_73835 ?auto_73838 ) ) ( not ( = ?auto_73836 ?auto_73837 ) ) ( not ( = ?auto_73836 ?auto_73838 ) ) ( not ( = ?auto_73837 ?auto_73838 ) ) ( ON-TABLE ?auto_73838 ) ( ON ?auto_73837 ?auto_73838 ) ( CLEAR ?auto_73835 ) ( ON ?auto_73836 ?auto_73837 ) ( CLEAR ?auto_73836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73838 ?auto_73837 )
      ( MAKE-7PILE ?auto_73832 ?auto_73833 ?auto_73834 ?auto_73835 ?auto_73836 ?auto_73837 ?auto_73838 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73839 - BLOCK
      ?auto_73840 - BLOCK
      ?auto_73841 - BLOCK
      ?auto_73842 - BLOCK
      ?auto_73843 - BLOCK
      ?auto_73844 - BLOCK
      ?auto_73845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73839 ) ( ON ?auto_73840 ?auto_73839 ) ( ON ?auto_73841 ?auto_73840 ) ( not ( = ?auto_73839 ?auto_73840 ) ) ( not ( = ?auto_73839 ?auto_73841 ) ) ( not ( = ?auto_73839 ?auto_73842 ) ) ( not ( = ?auto_73839 ?auto_73843 ) ) ( not ( = ?auto_73839 ?auto_73844 ) ) ( not ( = ?auto_73839 ?auto_73845 ) ) ( not ( = ?auto_73840 ?auto_73841 ) ) ( not ( = ?auto_73840 ?auto_73842 ) ) ( not ( = ?auto_73840 ?auto_73843 ) ) ( not ( = ?auto_73840 ?auto_73844 ) ) ( not ( = ?auto_73840 ?auto_73845 ) ) ( not ( = ?auto_73841 ?auto_73842 ) ) ( not ( = ?auto_73841 ?auto_73843 ) ) ( not ( = ?auto_73841 ?auto_73844 ) ) ( not ( = ?auto_73841 ?auto_73845 ) ) ( not ( = ?auto_73842 ?auto_73843 ) ) ( not ( = ?auto_73842 ?auto_73844 ) ) ( not ( = ?auto_73842 ?auto_73845 ) ) ( not ( = ?auto_73843 ?auto_73844 ) ) ( not ( = ?auto_73843 ?auto_73845 ) ) ( not ( = ?auto_73844 ?auto_73845 ) ) ( ON-TABLE ?auto_73845 ) ( ON ?auto_73844 ?auto_73845 ) ( ON ?auto_73843 ?auto_73844 ) ( CLEAR ?auto_73843 ) ( HOLDING ?auto_73842 ) ( CLEAR ?auto_73841 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73839 ?auto_73840 ?auto_73841 ?auto_73842 )
      ( MAKE-7PILE ?auto_73839 ?auto_73840 ?auto_73841 ?auto_73842 ?auto_73843 ?auto_73844 ?auto_73845 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73846 - BLOCK
      ?auto_73847 - BLOCK
      ?auto_73848 - BLOCK
      ?auto_73849 - BLOCK
      ?auto_73850 - BLOCK
      ?auto_73851 - BLOCK
      ?auto_73852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73846 ) ( ON ?auto_73847 ?auto_73846 ) ( ON ?auto_73848 ?auto_73847 ) ( not ( = ?auto_73846 ?auto_73847 ) ) ( not ( = ?auto_73846 ?auto_73848 ) ) ( not ( = ?auto_73846 ?auto_73849 ) ) ( not ( = ?auto_73846 ?auto_73850 ) ) ( not ( = ?auto_73846 ?auto_73851 ) ) ( not ( = ?auto_73846 ?auto_73852 ) ) ( not ( = ?auto_73847 ?auto_73848 ) ) ( not ( = ?auto_73847 ?auto_73849 ) ) ( not ( = ?auto_73847 ?auto_73850 ) ) ( not ( = ?auto_73847 ?auto_73851 ) ) ( not ( = ?auto_73847 ?auto_73852 ) ) ( not ( = ?auto_73848 ?auto_73849 ) ) ( not ( = ?auto_73848 ?auto_73850 ) ) ( not ( = ?auto_73848 ?auto_73851 ) ) ( not ( = ?auto_73848 ?auto_73852 ) ) ( not ( = ?auto_73849 ?auto_73850 ) ) ( not ( = ?auto_73849 ?auto_73851 ) ) ( not ( = ?auto_73849 ?auto_73852 ) ) ( not ( = ?auto_73850 ?auto_73851 ) ) ( not ( = ?auto_73850 ?auto_73852 ) ) ( not ( = ?auto_73851 ?auto_73852 ) ) ( ON-TABLE ?auto_73852 ) ( ON ?auto_73851 ?auto_73852 ) ( ON ?auto_73850 ?auto_73851 ) ( CLEAR ?auto_73848 ) ( ON ?auto_73849 ?auto_73850 ) ( CLEAR ?auto_73849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73852 ?auto_73851 ?auto_73850 )
      ( MAKE-7PILE ?auto_73846 ?auto_73847 ?auto_73848 ?auto_73849 ?auto_73850 ?auto_73851 ?auto_73852 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73853 - BLOCK
      ?auto_73854 - BLOCK
      ?auto_73855 - BLOCK
      ?auto_73856 - BLOCK
      ?auto_73857 - BLOCK
      ?auto_73858 - BLOCK
      ?auto_73859 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73853 ) ( ON ?auto_73854 ?auto_73853 ) ( not ( = ?auto_73853 ?auto_73854 ) ) ( not ( = ?auto_73853 ?auto_73855 ) ) ( not ( = ?auto_73853 ?auto_73856 ) ) ( not ( = ?auto_73853 ?auto_73857 ) ) ( not ( = ?auto_73853 ?auto_73858 ) ) ( not ( = ?auto_73853 ?auto_73859 ) ) ( not ( = ?auto_73854 ?auto_73855 ) ) ( not ( = ?auto_73854 ?auto_73856 ) ) ( not ( = ?auto_73854 ?auto_73857 ) ) ( not ( = ?auto_73854 ?auto_73858 ) ) ( not ( = ?auto_73854 ?auto_73859 ) ) ( not ( = ?auto_73855 ?auto_73856 ) ) ( not ( = ?auto_73855 ?auto_73857 ) ) ( not ( = ?auto_73855 ?auto_73858 ) ) ( not ( = ?auto_73855 ?auto_73859 ) ) ( not ( = ?auto_73856 ?auto_73857 ) ) ( not ( = ?auto_73856 ?auto_73858 ) ) ( not ( = ?auto_73856 ?auto_73859 ) ) ( not ( = ?auto_73857 ?auto_73858 ) ) ( not ( = ?auto_73857 ?auto_73859 ) ) ( not ( = ?auto_73858 ?auto_73859 ) ) ( ON-TABLE ?auto_73859 ) ( ON ?auto_73858 ?auto_73859 ) ( ON ?auto_73857 ?auto_73858 ) ( ON ?auto_73856 ?auto_73857 ) ( CLEAR ?auto_73856 ) ( HOLDING ?auto_73855 ) ( CLEAR ?auto_73854 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73853 ?auto_73854 ?auto_73855 )
      ( MAKE-7PILE ?auto_73853 ?auto_73854 ?auto_73855 ?auto_73856 ?auto_73857 ?auto_73858 ?auto_73859 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73860 - BLOCK
      ?auto_73861 - BLOCK
      ?auto_73862 - BLOCK
      ?auto_73863 - BLOCK
      ?auto_73864 - BLOCK
      ?auto_73865 - BLOCK
      ?auto_73866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73860 ) ( ON ?auto_73861 ?auto_73860 ) ( not ( = ?auto_73860 ?auto_73861 ) ) ( not ( = ?auto_73860 ?auto_73862 ) ) ( not ( = ?auto_73860 ?auto_73863 ) ) ( not ( = ?auto_73860 ?auto_73864 ) ) ( not ( = ?auto_73860 ?auto_73865 ) ) ( not ( = ?auto_73860 ?auto_73866 ) ) ( not ( = ?auto_73861 ?auto_73862 ) ) ( not ( = ?auto_73861 ?auto_73863 ) ) ( not ( = ?auto_73861 ?auto_73864 ) ) ( not ( = ?auto_73861 ?auto_73865 ) ) ( not ( = ?auto_73861 ?auto_73866 ) ) ( not ( = ?auto_73862 ?auto_73863 ) ) ( not ( = ?auto_73862 ?auto_73864 ) ) ( not ( = ?auto_73862 ?auto_73865 ) ) ( not ( = ?auto_73862 ?auto_73866 ) ) ( not ( = ?auto_73863 ?auto_73864 ) ) ( not ( = ?auto_73863 ?auto_73865 ) ) ( not ( = ?auto_73863 ?auto_73866 ) ) ( not ( = ?auto_73864 ?auto_73865 ) ) ( not ( = ?auto_73864 ?auto_73866 ) ) ( not ( = ?auto_73865 ?auto_73866 ) ) ( ON-TABLE ?auto_73866 ) ( ON ?auto_73865 ?auto_73866 ) ( ON ?auto_73864 ?auto_73865 ) ( ON ?auto_73863 ?auto_73864 ) ( CLEAR ?auto_73861 ) ( ON ?auto_73862 ?auto_73863 ) ( CLEAR ?auto_73862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73866 ?auto_73865 ?auto_73864 ?auto_73863 )
      ( MAKE-7PILE ?auto_73860 ?auto_73861 ?auto_73862 ?auto_73863 ?auto_73864 ?auto_73865 ?auto_73866 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73867 - BLOCK
      ?auto_73868 - BLOCK
      ?auto_73869 - BLOCK
      ?auto_73870 - BLOCK
      ?auto_73871 - BLOCK
      ?auto_73872 - BLOCK
      ?auto_73873 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73867 ) ( not ( = ?auto_73867 ?auto_73868 ) ) ( not ( = ?auto_73867 ?auto_73869 ) ) ( not ( = ?auto_73867 ?auto_73870 ) ) ( not ( = ?auto_73867 ?auto_73871 ) ) ( not ( = ?auto_73867 ?auto_73872 ) ) ( not ( = ?auto_73867 ?auto_73873 ) ) ( not ( = ?auto_73868 ?auto_73869 ) ) ( not ( = ?auto_73868 ?auto_73870 ) ) ( not ( = ?auto_73868 ?auto_73871 ) ) ( not ( = ?auto_73868 ?auto_73872 ) ) ( not ( = ?auto_73868 ?auto_73873 ) ) ( not ( = ?auto_73869 ?auto_73870 ) ) ( not ( = ?auto_73869 ?auto_73871 ) ) ( not ( = ?auto_73869 ?auto_73872 ) ) ( not ( = ?auto_73869 ?auto_73873 ) ) ( not ( = ?auto_73870 ?auto_73871 ) ) ( not ( = ?auto_73870 ?auto_73872 ) ) ( not ( = ?auto_73870 ?auto_73873 ) ) ( not ( = ?auto_73871 ?auto_73872 ) ) ( not ( = ?auto_73871 ?auto_73873 ) ) ( not ( = ?auto_73872 ?auto_73873 ) ) ( ON-TABLE ?auto_73873 ) ( ON ?auto_73872 ?auto_73873 ) ( ON ?auto_73871 ?auto_73872 ) ( ON ?auto_73870 ?auto_73871 ) ( ON ?auto_73869 ?auto_73870 ) ( CLEAR ?auto_73869 ) ( HOLDING ?auto_73868 ) ( CLEAR ?auto_73867 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73867 ?auto_73868 )
      ( MAKE-7PILE ?auto_73867 ?auto_73868 ?auto_73869 ?auto_73870 ?auto_73871 ?auto_73872 ?auto_73873 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73874 - BLOCK
      ?auto_73875 - BLOCK
      ?auto_73876 - BLOCK
      ?auto_73877 - BLOCK
      ?auto_73878 - BLOCK
      ?auto_73879 - BLOCK
      ?auto_73880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_73874 ) ( not ( = ?auto_73874 ?auto_73875 ) ) ( not ( = ?auto_73874 ?auto_73876 ) ) ( not ( = ?auto_73874 ?auto_73877 ) ) ( not ( = ?auto_73874 ?auto_73878 ) ) ( not ( = ?auto_73874 ?auto_73879 ) ) ( not ( = ?auto_73874 ?auto_73880 ) ) ( not ( = ?auto_73875 ?auto_73876 ) ) ( not ( = ?auto_73875 ?auto_73877 ) ) ( not ( = ?auto_73875 ?auto_73878 ) ) ( not ( = ?auto_73875 ?auto_73879 ) ) ( not ( = ?auto_73875 ?auto_73880 ) ) ( not ( = ?auto_73876 ?auto_73877 ) ) ( not ( = ?auto_73876 ?auto_73878 ) ) ( not ( = ?auto_73876 ?auto_73879 ) ) ( not ( = ?auto_73876 ?auto_73880 ) ) ( not ( = ?auto_73877 ?auto_73878 ) ) ( not ( = ?auto_73877 ?auto_73879 ) ) ( not ( = ?auto_73877 ?auto_73880 ) ) ( not ( = ?auto_73878 ?auto_73879 ) ) ( not ( = ?auto_73878 ?auto_73880 ) ) ( not ( = ?auto_73879 ?auto_73880 ) ) ( ON-TABLE ?auto_73880 ) ( ON ?auto_73879 ?auto_73880 ) ( ON ?auto_73878 ?auto_73879 ) ( ON ?auto_73877 ?auto_73878 ) ( ON ?auto_73876 ?auto_73877 ) ( CLEAR ?auto_73874 ) ( ON ?auto_73875 ?auto_73876 ) ( CLEAR ?auto_73875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73880 ?auto_73879 ?auto_73878 ?auto_73877 ?auto_73876 )
      ( MAKE-7PILE ?auto_73874 ?auto_73875 ?auto_73876 ?auto_73877 ?auto_73878 ?auto_73879 ?auto_73880 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73881 - BLOCK
      ?auto_73882 - BLOCK
      ?auto_73883 - BLOCK
      ?auto_73884 - BLOCK
      ?auto_73885 - BLOCK
      ?auto_73886 - BLOCK
      ?auto_73887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73881 ?auto_73882 ) ) ( not ( = ?auto_73881 ?auto_73883 ) ) ( not ( = ?auto_73881 ?auto_73884 ) ) ( not ( = ?auto_73881 ?auto_73885 ) ) ( not ( = ?auto_73881 ?auto_73886 ) ) ( not ( = ?auto_73881 ?auto_73887 ) ) ( not ( = ?auto_73882 ?auto_73883 ) ) ( not ( = ?auto_73882 ?auto_73884 ) ) ( not ( = ?auto_73882 ?auto_73885 ) ) ( not ( = ?auto_73882 ?auto_73886 ) ) ( not ( = ?auto_73882 ?auto_73887 ) ) ( not ( = ?auto_73883 ?auto_73884 ) ) ( not ( = ?auto_73883 ?auto_73885 ) ) ( not ( = ?auto_73883 ?auto_73886 ) ) ( not ( = ?auto_73883 ?auto_73887 ) ) ( not ( = ?auto_73884 ?auto_73885 ) ) ( not ( = ?auto_73884 ?auto_73886 ) ) ( not ( = ?auto_73884 ?auto_73887 ) ) ( not ( = ?auto_73885 ?auto_73886 ) ) ( not ( = ?auto_73885 ?auto_73887 ) ) ( not ( = ?auto_73886 ?auto_73887 ) ) ( ON-TABLE ?auto_73887 ) ( ON ?auto_73886 ?auto_73887 ) ( ON ?auto_73885 ?auto_73886 ) ( ON ?auto_73884 ?auto_73885 ) ( ON ?auto_73883 ?auto_73884 ) ( ON ?auto_73882 ?auto_73883 ) ( CLEAR ?auto_73882 ) ( HOLDING ?auto_73881 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73881 )
      ( MAKE-7PILE ?auto_73881 ?auto_73882 ?auto_73883 ?auto_73884 ?auto_73885 ?auto_73886 ?auto_73887 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73888 - BLOCK
      ?auto_73889 - BLOCK
      ?auto_73890 - BLOCK
      ?auto_73891 - BLOCK
      ?auto_73892 - BLOCK
      ?auto_73893 - BLOCK
      ?auto_73894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73888 ?auto_73889 ) ) ( not ( = ?auto_73888 ?auto_73890 ) ) ( not ( = ?auto_73888 ?auto_73891 ) ) ( not ( = ?auto_73888 ?auto_73892 ) ) ( not ( = ?auto_73888 ?auto_73893 ) ) ( not ( = ?auto_73888 ?auto_73894 ) ) ( not ( = ?auto_73889 ?auto_73890 ) ) ( not ( = ?auto_73889 ?auto_73891 ) ) ( not ( = ?auto_73889 ?auto_73892 ) ) ( not ( = ?auto_73889 ?auto_73893 ) ) ( not ( = ?auto_73889 ?auto_73894 ) ) ( not ( = ?auto_73890 ?auto_73891 ) ) ( not ( = ?auto_73890 ?auto_73892 ) ) ( not ( = ?auto_73890 ?auto_73893 ) ) ( not ( = ?auto_73890 ?auto_73894 ) ) ( not ( = ?auto_73891 ?auto_73892 ) ) ( not ( = ?auto_73891 ?auto_73893 ) ) ( not ( = ?auto_73891 ?auto_73894 ) ) ( not ( = ?auto_73892 ?auto_73893 ) ) ( not ( = ?auto_73892 ?auto_73894 ) ) ( not ( = ?auto_73893 ?auto_73894 ) ) ( ON-TABLE ?auto_73894 ) ( ON ?auto_73893 ?auto_73894 ) ( ON ?auto_73892 ?auto_73893 ) ( ON ?auto_73891 ?auto_73892 ) ( ON ?auto_73890 ?auto_73891 ) ( ON ?auto_73889 ?auto_73890 ) ( ON ?auto_73888 ?auto_73889 ) ( CLEAR ?auto_73888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73894 ?auto_73893 ?auto_73892 ?auto_73891 ?auto_73890 ?auto_73889 )
      ( MAKE-7PILE ?auto_73888 ?auto_73889 ?auto_73890 ?auto_73891 ?auto_73892 ?auto_73893 ?auto_73894 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73902 - BLOCK
      ?auto_73903 - BLOCK
      ?auto_73904 - BLOCK
      ?auto_73905 - BLOCK
      ?auto_73906 - BLOCK
      ?auto_73907 - BLOCK
      ?auto_73908 - BLOCK
    )
    :vars
    (
      ?auto_73909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73902 ?auto_73903 ) ) ( not ( = ?auto_73902 ?auto_73904 ) ) ( not ( = ?auto_73902 ?auto_73905 ) ) ( not ( = ?auto_73902 ?auto_73906 ) ) ( not ( = ?auto_73902 ?auto_73907 ) ) ( not ( = ?auto_73902 ?auto_73908 ) ) ( not ( = ?auto_73903 ?auto_73904 ) ) ( not ( = ?auto_73903 ?auto_73905 ) ) ( not ( = ?auto_73903 ?auto_73906 ) ) ( not ( = ?auto_73903 ?auto_73907 ) ) ( not ( = ?auto_73903 ?auto_73908 ) ) ( not ( = ?auto_73904 ?auto_73905 ) ) ( not ( = ?auto_73904 ?auto_73906 ) ) ( not ( = ?auto_73904 ?auto_73907 ) ) ( not ( = ?auto_73904 ?auto_73908 ) ) ( not ( = ?auto_73905 ?auto_73906 ) ) ( not ( = ?auto_73905 ?auto_73907 ) ) ( not ( = ?auto_73905 ?auto_73908 ) ) ( not ( = ?auto_73906 ?auto_73907 ) ) ( not ( = ?auto_73906 ?auto_73908 ) ) ( not ( = ?auto_73907 ?auto_73908 ) ) ( ON-TABLE ?auto_73908 ) ( ON ?auto_73907 ?auto_73908 ) ( ON ?auto_73906 ?auto_73907 ) ( ON ?auto_73905 ?auto_73906 ) ( ON ?auto_73904 ?auto_73905 ) ( ON ?auto_73903 ?auto_73904 ) ( CLEAR ?auto_73903 ) ( ON ?auto_73902 ?auto_73909 ) ( CLEAR ?auto_73902 ) ( HAND-EMPTY ) ( not ( = ?auto_73902 ?auto_73909 ) ) ( not ( = ?auto_73903 ?auto_73909 ) ) ( not ( = ?auto_73904 ?auto_73909 ) ) ( not ( = ?auto_73905 ?auto_73909 ) ) ( not ( = ?auto_73906 ?auto_73909 ) ) ( not ( = ?auto_73907 ?auto_73909 ) ) ( not ( = ?auto_73908 ?auto_73909 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73902 ?auto_73909 )
      ( MAKE-7PILE ?auto_73902 ?auto_73903 ?auto_73904 ?auto_73905 ?auto_73906 ?auto_73907 ?auto_73908 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73910 - BLOCK
      ?auto_73911 - BLOCK
      ?auto_73912 - BLOCK
      ?auto_73913 - BLOCK
      ?auto_73914 - BLOCK
      ?auto_73915 - BLOCK
      ?auto_73916 - BLOCK
    )
    :vars
    (
      ?auto_73917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73910 ?auto_73911 ) ) ( not ( = ?auto_73910 ?auto_73912 ) ) ( not ( = ?auto_73910 ?auto_73913 ) ) ( not ( = ?auto_73910 ?auto_73914 ) ) ( not ( = ?auto_73910 ?auto_73915 ) ) ( not ( = ?auto_73910 ?auto_73916 ) ) ( not ( = ?auto_73911 ?auto_73912 ) ) ( not ( = ?auto_73911 ?auto_73913 ) ) ( not ( = ?auto_73911 ?auto_73914 ) ) ( not ( = ?auto_73911 ?auto_73915 ) ) ( not ( = ?auto_73911 ?auto_73916 ) ) ( not ( = ?auto_73912 ?auto_73913 ) ) ( not ( = ?auto_73912 ?auto_73914 ) ) ( not ( = ?auto_73912 ?auto_73915 ) ) ( not ( = ?auto_73912 ?auto_73916 ) ) ( not ( = ?auto_73913 ?auto_73914 ) ) ( not ( = ?auto_73913 ?auto_73915 ) ) ( not ( = ?auto_73913 ?auto_73916 ) ) ( not ( = ?auto_73914 ?auto_73915 ) ) ( not ( = ?auto_73914 ?auto_73916 ) ) ( not ( = ?auto_73915 ?auto_73916 ) ) ( ON-TABLE ?auto_73916 ) ( ON ?auto_73915 ?auto_73916 ) ( ON ?auto_73914 ?auto_73915 ) ( ON ?auto_73913 ?auto_73914 ) ( ON ?auto_73912 ?auto_73913 ) ( ON ?auto_73910 ?auto_73917 ) ( CLEAR ?auto_73910 ) ( not ( = ?auto_73910 ?auto_73917 ) ) ( not ( = ?auto_73911 ?auto_73917 ) ) ( not ( = ?auto_73912 ?auto_73917 ) ) ( not ( = ?auto_73913 ?auto_73917 ) ) ( not ( = ?auto_73914 ?auto_73917 ) ) ( not ( = ?auto_73915 ?auto_73917 ) ) ( not ( = ?auto_73916 ?auto_73917 ) ) ( HOLDING ?auto_73911 ) ( CLEAR ?auto_73912 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73916 ?auto_73915 ?auto_73914 ?auto_73913 ?auto_73912 ?auto_73911 )
      ( MAKE-7PILE ?auto_73910 ?auto_73911 ?auto_73912 ?auto_73913 ?auto_73914 ?auto_73915 ?auto_73916 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73918 - BLOCK
      ?auto_73919 - BLOCK
      ?auto_73920 - BLOCK
      ?auto_73921 - BLOCK
      ?auto_73922 - BLOCK
      ?auto_73923 - BLOCK
      ?auto_73924 - BLOCK
    )
    :vars
    (
      ?auto_73925 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73918 ?auto_73919 ) ) ( not ( = ?auto_73918 ?auto_73920 ) ) ( not ( = ?auto_73918 ?auto_73921 ) ) ( not ( = ?auto_73918 ?auto_73922 ) ) ( not ( = ?auto_73918 ?auto_73923 ) ) ( not ( = ?auto_73918 ?auto_73924 ) ) ( not ( = ?auto_73919 ?auto_73920 ) ) ( not ( = ?auto_73919 ?auto_73921 ) ) ( not ( = ?auto_73919 ?auto_73922 ) ) ( not ( = ?auto_73919 ?auto_73923 ) ) ( not ( = ?auto_73919 ?auto_73924 ) ) ( not ( = ?auto_73920 ?auto_73921 ) ) ( not ( = ?auto_73920 ?auto_73922 ) ) ( not ( = ?auto_73920 ?auto_73923 ) ) ( not ( = ?auto_73920 ?auto_73924 ) ) ( not ( = ?auto_73921 ?auto_73922 ) ) ( not ( = ?auto_73921 ?auto_73923 ) ) ( not ( = ?auto_73921 ?auto_73924 ) ) ( not ( = ?auto_73922 ?auto_73923 ) ) ( not ( = ?auto_73922 ?auto_73924 ) ) ( not ( = ?auto_73923 ?auto_73924 ) ) ( ON-TABLE ?auto_73924 ) ( ON ?auto_73923 ?auto_73924 ) ( ON ?auto_73922 ?auto_73923 ) ( ON ?auto_73921 ?auto_73922 ) ( ON ?auto_73920 ?auto_73921 ) ( ON ?auto_73918 ?auto_73925 ) ( not ( = ?auto_73918 ?auto_73925 ) ) ( not ( = ?auto_73919 ?auto_73925 ) ) ( not ( = ?auto_73920 ?auto_73925 ) ) ( not ( = ?auto_73921 ?auto_73925 ) ) ( not ( = ?auto_73922 ?auto_73925 ) ) ( not ( = ?auto_73923 ?auto_73925 ) ) ( not ( = ?auto_73924 ?auto_73925 ) ) ( CLEAR ?auto_73920 ) ( ON ?auto_73919 ?auto_73918 ) ( CLEAR ?auto_73919 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73925 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73925 ?auto_73918 )
      ( MAKE-7PILE ?auto_73918 ?auto_73919 ?auto_73920 ?auto_73921 ?auto_73922 ?auto_73923 ?auto_73924 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73926 - BLOCK
      ?auto_73927 - BLOCK
      ?auto_73928 - BLOCK
      ?auto_73929 - BLOCK
      ?auto_73930 - BLOCK
      ?auto_73931 - BLOCK
      ?auto_73932 - BLOCK
    )
    :vars
    (
      ?auto_73933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73926 ?auto_73927 ) ) ( not ( = ?auto_73926 ?auto_73928 ) ) ( not ( = ?auto_73926 ?auto_73929 ) ) ( not ( = ?auto_73926 ?auto_73930 ) ) ( not ( = ?auto_73926 ?auto_73931 ) ) ( not ( = ?auto_73926 ?auto_73932 ) ) ( not ( = ?auto_73927 ?auto_73928 ) ) ( not ( = ?auto_73927 ?auto_73929 ) ) ( not ( = ?auto_73927 ?auto_73930 ) ) ( not ( = ?auto_73927 ?auto_73931 ) ) ( not ( = ?auto_73927 ?auto_73932 ) ) ( not ( = ?auto_73928 ?auto_73929 ) ) ( not ( = ?auto_73928 ?auto_73930 ) ) ( not ( = ?auto_73928 ?auto_73931 ) ) ( not ( = ?auto_73928 ?auto_73932 ) ) ( not ( = ?auto_73929 ?auto_73930 ) ) ( not ( = ?auto_73929 ?auto_73931 ) ) ( not ( = ?auto_73929 ?auto_73932 ) ) ( not ( = ?auto_73930 ?auto_73931 ) ) ( not ( = ?auto_73930 ?auto_73932 ) ) ( not ( = ?auto_73931 ?auto_73932 ) ) ( ON-TABLE ?auto_73932 ) ( ON ?auto_73931 ?auto_73932 ) ( ON ?auto_73930 ?auto_73931 ) ( ON ?auto_73929 ?auto_73930 ) ( ON ?auto_73926 ?auto_73933 ) ( not ( = ?auto_73926 ?auto_73933 ) ) ( not ( = ?auto_73927 ?auto_73933 ) ) ( not ( = ?auto_73928 ?auto_73933 ) ) ( not ( = ?auto_73929 ?auto_73933 ) ) ( not ( = ?auto_73930 ?auto_73933 ) ) ( not ( = ?auto_73931 ?auto_73933 ) ) ( not ( = ?auto_73932 ?auto_73933 ) ) ( ON ?auto_73927 ?auto_73926 ) ( CLEAR ?auto_73927 ) ( ON-TABLE ?auto_73933 ) ( HOLDING ?auto_73928 ) ( CLEAR ?auto_73929 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73932 ?auto_73931 ?auto_73930 ?auto_73929 ?auto_73928 )
      ( MAKE-7PILE ?auto_73926 ?auto_73927 ?auto_73928 ?auto_73929 ?auto_73930 ?auto_73931 ?auto_73932 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73934 - BLOCK
      ?auto_73935 - BLOCK
      ?auto_73936 - BLOCK
      ?auto_73937 - BLOCK
      ?auto_73938 - BLOCK
      ?auto_73939 - BLOCK
      ?auto_73940 - BLOCK
    )
    :vars
    (
      ?auto_73941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73934 ?auto_73935 ) ) ( not ( = ?auto_73934 ?auto_73936 ) ) ( not ( = ?auto_73934 ?auto_73937 ) ) ( not ( = ?auto_73934 ?auto_73938 ) ) ( not ( = ?auto_73934 ?auto_73939 ) ) ( not ( = ?auto_73934 ?auto_73940 ) ) ( not ( = ?auto_73935 ?auto_73936 ) ) ( not ( = ?auto_73935 ?auto_73937 ) ) ( not ( = ?auto_73935 ?auto_73938 ) ) ( not ( = ?auto_73935 ?auto_73939 ) ) ( not ( = ?auto_73935 ?auto_73940 ) ) ( not ( = ?auto_73936 ?auto_73937 ) ) ( not ( = ?auto_73936 ?auto_73938 ) ) ( not ( = ?auto_73936 ?auto_73939 ) ) ( not ( = ?auto_73936 ?auto_73940 ) ) ( not ( = ?auto_73937 ?auto_73938 ) ) ( not ( = ?auto_73937 ?auto_73939 ) ) ( not ( = ?auto_73937 ?auto_73940 ) ) ( not ( = ?auto_73938 ?auto_73939 ) ) ( not ( = ?auto_73938 ?auto_73940 ) ) ( not ( = ?auto_73939 ?auto_73940 ) ) ( ON-TABLE ?auto_73940 ) ( ON ?auto_73939 ?auto_73940 ) ( ON ?auto_73938 ?auto_73939 ) ( ON ?auto_73937 ?auto_73938 ) ( ON ?auto_73934 ?auto_73941 ) ( not ( = ?auto_73934 ?auto_73941 ) ) ( not ( = ?auto_73935 ?auto_73941 ) ) ( not ( = ?auto_73936 ?auto_73941 ) ) ( not ( = ?auto_73937 ?auto_73941 ) ) ( not ( = ?auto_73938 ?auto_73941 ) ) ( not ( = ?auto_73939 ?auto_73941 ) ) ( not ( = ?auto_73940 ?auto_73941 ) ) ( ON ?auto_73935 ?auto_73934 ) ( ON-TABLE ?auto_73941 ) ( CLEAR ?auto_73937 ) ( ON ?auto_73936 ?auto_73935 ) ( CLEAR ?auto_73936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73941 ?auto_73934 ?auto_73935 )
      ( MAKE-7PILE ?auto_73934 ?auto_73935 ?auto_73936 ?auto_73937 ?auto_73938 ?auto_73939 ?auto_73940 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73942 - BLOCK
      ?auto_73943 - BLOCK
      ?auto_73944 - BLOCK
      ?auto_73945 - BLOCK
      ?auto_73946 - BLOCK
      ?auto_73947 - BLOCK
      ?auto_73948 - BLOCK
    )
    :vars
    (
      ?auto_73949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73942 ?auto_73943 ) ) ( not ( = ?auto_73942 ?auto_73944 ) ) ( not ( = ?auto_73942 ?auto_73945 ) ) ( not ( = ?auto_73942 ?auto_73946 ) ) ( not ( = ?auto_73942 ?auto_73947 ) ) ( not ( = ?auto_73942 ?auto_73948 ) ) ( not ( = ?auto_73943 ?auto_73944 ) ) ( not ( = ?auto_73943 ?auto_73945 ) ) ( not ( = ?auto_73943 ?auto_73946 ) ) ( not ( = ?auto_73943 ?auto_73947 ) ) ( not ( = ?auto_73943 ?auto_73948 ) ) ( not ( = ?auto_73944 ?auto_73945 ) ) ( not ( = ?auto_73944 ?auto_73946 ) ) ( not ( = ?auto_73944 ?auto_73947 ) ) ( not ( = ?auto_73944 ?auto_73948 ) ) ( not ( = ?auto_73945 ?auto_73946 ) ) ( not ( = ?auto_73945 ?auto_73947 ) ) ( not ( = ?auto_73945 ?auto_73948 ) ) ( not ( = ?auto_73946 ?auto_73947 ) ) ( not ( = ?auto_73946 ?auto_73948 ) ) ( not ( = ?auto_73947 ?auto_73948 ) ) ( ON-TABLE ?auto_73948 ) ( ON ?auto_73947 ?auto_73948 ) ( ON ?auto_73946 ?auto_73947 ) ( ON ?auto_73942 ?auto_73949 ) ( not ( = ?auto_73942 ?auto_73949 ) ) ( not ( = ?auto_73943 ?auto_73949 ) ) ( not ( = ?auto_73944 ?auto_73949 ) ) ( not ( = ?auto_73945 ?auto_73949 ) ) ( not ( = ?auto_73946 ?auto_73949 ) ) ( not ( = ?auto_73947 ?auto_73949 ) ) ( not ( = ?auto_73948 ?auto_73949 ) ) ( ON ?auto_73943 ?auto_73942 ) ( ON-TABLE ?auto_73949 ) ( ON ?auto_73944 ?auto_73943 ) ( CLEAR ?auto_73944 ) ( HOLDING ?auto_73945 ) ( CLEAR ?auto_73946 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73948 ?auto_73947 ?auto_73946 ?auto_73945 )
      ( MAKE-7PILE ?auto_73942 ?auto_73943 ?auto_73944 ?auto_73945 ?auto_73946 ?auto_73947 ?auto_73948 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73950 - BLOCK
      ?auto_73951 - BLOCK
      ?auto_73952 - BLOCK
      ?auto_73953 - BLOCK
      ?auto_73954 - BLOCK
      ?auto_73955 - BLOCK
      ?auto_73956 - BLOCK
    )
    :vars
    (
      ?auto_73957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73950 ?auto_73951 ) ) ( not ( = ?auto_73950 ?auto_73952 ) ) ( not ( = ?auto_73950 ?auto_73953 ) ) ( not ( = ?auto_73950 ?auto_73954 ) ) ( not ( = ?auto_73950 ?auto_73955 ) ) ( not ( = ?auto_73950 ?auto_73956 ) ) ( not ( = ?auto_73951 ?auto_73952 ) ) ( not ( = ?auto_73951 ?auto_73953 ) ) ( not ( = ?auto_73951 ?auto_73954 ) ) ( not ( = ?auto_73951 ?auto_73955 ) ) ( not ( = ?auto_73951 ?auto_73956 ) ) ( not ( = ?auto_73952 ?auto_73953 ) ) ( not ( = ?auto_73952 ?auto_73954 ) ) ( not ( = ?auto_73952 ?auto_73955 ) ) ( not ( = ?auto_73952 ?auto_73956 ) ) ( not ( = ?auto_73953 ?auto_73954 ) ) ( not ( = ?auto_73953 ?auto_73955 ) ) ( not ( = ?auto_73953 ?auto_73956 ) ) ( not ( = ?auto_73954 ?auto_73955 ) ) ( not ( = ?auto_73954 ?auto_73956 ) ) ( not ( = ?auto_73955 ?auto_73956 ) ) ( ON-TABLE ?auto_73956 ) ( ON ?auto_73955 ?auto_73956 ) ( ON ?auto_73954 ?auto_73955 ) ( ON ?auto_73950 ?auto_73957 ) ( not ( = ?auto_73950 ?auto_73957 ) ) ( not ( = ?auto_73951 ?auto_73957 ) ) ( not ( = ?auto_73952 ?auto_73957 ) ) ( not ( = ?auto_73953 ?auto_73957 ) ) ( not ( = ?auto_73954 ?auto_73957 ) ) ( not ( = ?auto_73955 ?auto_73957 ) ) ( not ( = ?auto_73956 ?auto_73957 ) ) ( ON ?auto_73951 ?auto_73950 ) ( ON-TABLE ?auto_73957 ) ( ON ?auto_73952 ?auto_73951 ) ( CLEAR ?auto_73954 ) ( ON ?auto_73953 ?auto_73952 ) ( CLEAR ?auto_73953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73957 ?auto_73950 ?auto_73951 ?auto_73952 )
      ( MAKE-7PILE ?auto_73950 ?auto_73951 ?auto_73952 ?auto_73953 ?auto_73954 ?auto_73955 ?auto_73956 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73958 - BLOCK
      ?auto_73959 - BLOCK
      ?auto_73960 - BLOCK
      ?auto_73961 - BLOCK
      ?auto_73962 - BLOCK
      ?auto_73963 - BLOCK
      ?auto_73964 - BLOCK
    )
    :vars
    (
      ?auto_73965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73958 ?auto_73959 ) ) ( not ( = ?auto_73958 ?auto_73960 ) ) ( not ( = ?auto_73958 ?auto_73961 ) ) ( not ( = ?auto_73958 ?auto_73962 ) ) ( not ( = ?auto_73958 ?auto_73963 ) ) ( not ( = ?auto_73958 ?auto_73964 ) ) ( not ( = ?auto_73959 ?auto_73960 ) ) ( not ( = ?auto_73959 ?auto_73961 ) ) ( not ( = ?auto_73959 ?auto_73962 ) ) ( not ( = ?auto_73959 ?auto_73963 ) ) ( not ( = ?auto_73959 ?auto_73964 ) ) ( not ( = ?auto_73960 ?auto_73961 ) ) ( not ( = ?auto_73960 ?auto_73962 ) ) ( not ( = ?auto_73960 ?auto_73963 ) ) ( not ( = ?auto_73960 ?auto_73964 ) ) ( not ( = ?auto_73961 ?auto_73962 ) ) ( not ( = ?auto_73961 ?auto_73963 ) ) ( not ( = ?auto_73961 ?auto_73964 ) ) ( not ( = ?auto_73962 ?auto_73963 ) ) ( not ( = ?auto_73962 ?auto_73964 ) ) ( not ( = ?auto_73963 ?auto_73964 ) ) ( ON-TABLE ?auto_73964 ) ( ON ?auto_73963 ?auto_73964 ) ( ON ?auto_73958 ?auto_73965 ) ( not ( = ?auto_73958 ?auto_73965 ) ) ( not ( = ?auto_73959 ?auto_73965 ) ) ( not ( = ?auto_73960 ?auto_73965 ) ) ( not ( = ?auto_73961 ?auto_73965 ) ) ( not ( = ?auto_73962 ?auto_73965 ) ) ( not ( = ?auto_73963 ?auto_73965 ) ) ( not ( = ?auto_73964 ?auto_73965 ) ) ( ON ?auto_73959 ?auto_73958 ) ( ON-TABLE ?auto_73965 ) ( ON ?auto_73960 ?auto_73959 ) ( ON ?auto_73961 ?auto_73960 ) ( CLEAR ?auto_73961 ) ( HOLDING ?auto_73962 ) ( CLEAR ?auto_73963 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73964 ?auto_73963 ?auto_73962 )
      ( MAKE-7PILE ?auto_73958 ?auto_73959 ?auto_73960 ?auto_73961 ?auto_73962 ?auto_73963 ?auto_73964 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73966 - BLOCK
      ?auto_73967 - BLOCK
      ?auto_73968 - BLOCK
      ?auto_73969 - BLOCK
      ?auto_73970 - BLOCK
      ?auto_73971 - BLOCK
      ?auto_73972 - BLOCK
    )
    :vars
    (
      ?auto_73973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73966 ?auto_73967 ) ) ( not ( = ?auto_73966 ?auto_73968 ) ) ( not ( = ?auto_73966 ?auto_73969 ) ) ( not ( = ?auto_73966 ?auto_73970 ) ) ( not ( = ?auto_73966 ?auto_73971 ) ) ( not ( = ?auto_73966 ?auto_73972 ) ) ( not ( = ?auto_73967 ?auto_73968 ) ) ( not ( = ?auto_73967 ?auto_73969 ) ) ( not ( = ?auto_73967 ?auto_73970 ) ) ( not ( = ?auto_73967 ?auto_73971 ) ) ( not ( = ?auto_73967 ?auto_73972 ) ) ( not ( = ?auto_73968 ?auto_73969 ) ) ( not ( = ?auto_73968 ?auto_73970 ) ) ( not ( = ?auto_73968 ?auto_73971 ) ) ( not ( = ?auto_73968 ?auto_73972 ) ) ( not ( = ?auto_73969 ?auto_73970 ) ) ( not ( = ?auto_73969 ?auto_73971 ) ) ( not ( = ?auto_73969 ?auto_73972 ) ) ( not ( = ?auto_73970 ?auto_73971 ) ) ( not ( = ?auto_73970 ?auto_73972 ) ) ( not ( = ?auto_73971 ?auto_73972 ) ) ( ON-TABLE ?auto_73972 ) ( ON ?auto_73971 ?auto_73972 ) ( ON ?auto_73966 ?auto_73973 ) ( not ( = ?auto_73966 ?auto_73973 ) ) ( not ( = ?auto_73967 ?auto_73973 ) ) ( not ( = ?auto_73968 ?auto_73973 ) ) ( not ( = ?auto_73969 ?auto_73973 ) ) ( not ( = ?auto_73970 ?auto_73973 ) ) ( not ( = ?auto_73971 ?auto_73973 ) ) ( not ( = ?auto_73972 ?auto_73973 ) ) ( ON ?auto_73967 ?auto_73966 ) ( ON-TABLE ?auto_73973 ) ( ON ?auto_73968 ?auto_73967 ) ( ON ?auto_73969 ?auto_73968 ) ( CLEAR ?auto_73971 ) ( ON ?auto_73970 ?auto_73969 ) ( CLEAR ?auto_73970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73973 ?auto_73966 ?auto_73967 ?auto_73968 ?auto_73969 )
      ( MAKE-7PILE ?auto_73966 ?auto_73967 ?auto_73968 ?auto_73969 ?auto_73970 ?auto_73971 ?auto_73972 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73974 - BLOCK
      ?auto_73975 - BLOCK
      ?auto_73976 - BLOCK
      ?auto_73977 - BLOCK
      ?auto_73978 - BLOCK
      ?auto_73979 - BLOCK
      ?auto_73980 - BLOCK
    )
    :vars
    (
      ?auto_73981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73974 ?auto_73975 ) ) ( not ( = ?auto_73974 ?auto_73976 ) ) ( not ( = ?auto_73974 ?auto_73977 ) ) ( not ( = ?auto_73974 ?auto_73978 ) ) ( not ( = ?auto_73974 ?auto_73979 ) ) ( not ( = ?auto_73974 ?auto_73980 ) ) ( not ( = ?auto_73975 ?auto_73976 ) ) ( not ( = ?auto_73975 ?auto_73977 ) ) ( not ( = ?auto_73975 ?auto_73978 ) ) ( not ( = ?auto_73975 ?auto_73979 ) ) ( not ( = ?auto_73975 ?auto_73980 ) ) ( not ( = ?auto_73976 ?auto_73977 ) ) ( not ( = ?auto_73976 ?auto_73978 ) ) ( not ( = ?auto_73976 ?auto_73979 ) ) ( not ( = ?auto_73976 ?auto_73980 ) ) ( not ( = ?auto_73977 ?auto_73978 ) ) ( not ( = ?auto_73977 ?auto_73979 ) ) ( not ( = ?auto_73977 ?auto_73980 ) ) ( not ( = ?auto_73978 ?auto_73979 ) ) ( not ( = ?auto_73978 ?auto_73980 ) ) ( not ( = ?auto_73979 ?auto_73980 ) ) ( ON-TABLE ?auto_73980 ) ( ON ?auto_73974 ?auto_73981 ) ( not ( = ?auto_73974 ?auto_73981 ) ) ( not ( = ?auto_73975 ?auto_73981 ) ) ( not ( = ?auto_73976 ?auto_73981 ) ) ( not ( = ?auto_73977 ?auto_73981 ) ) ( not ( = ?auto_73978 ?auto_73981 ) ) ( not ( = ?auto_73979 ?auto_73981 ) ) ( not ( = ?auto_73980 ?auto_73981 ) ) ( ON ?auto_73975 ?auto_73974 ) ( ON-TABLE ?auto_73981 ) ( ON ?auto_73976 ?auto_73975 ) ( ON ?auto_73977 ?auto_73976 ) ( ON ?auto_73978 ?auto_73977 ) ( CLEAR ?auto_73978 ) ( HOLDING ?auto_73979 ) ( CLEAR ?auto_73980 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73980 ?auto_73979 )
      ( MAKE-7PILE ?auto_73974 ?auto_73975 ?auto_73976 ?auto_73977 ?auto_73978 ?auto_73979 ?auto_73980 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73982 - BLOCK
      ?auto_73983 - BLOCK
      ?auto_73984 - BLOCK
      ?auto_73985 - BLOCK
      ?auto_73986 - BLOCK
      ?auto_73987 - BLOCK
      ?auto_73988 - BLOCK
    )
    :vars
    (
      ?auto_73989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73982 ?auto_73983 ) ) ( not ( = ?auto_73982 ?auto_73984 ) ) ( not ( = ?auto_73982 ?auto_73985 ) ) ( not ( = ?auto_73982 ?auto_73986 ) ) ( not ( = ?auto_73982 ?auto_73987 ) ) ( not ( = ?auto_73982 ?auto_73988 ) ) ( not ( = ?auto_73983 ?auto_73984 ) ) ( not ( = ?auto_73983 ?auto_73985 ) ) ( not ( = ?auto_73983 ?auto_73986 ) ) ( not ( = ?auto_73983 ?auto_73987 ) ) ( not ( = ?auto_73983 ?auto_73988 ) ) ( not ( = ?auto_73984 ?auto_73985 ) ) ( not ( = ?auto_73984 ?auto_73986 ) ) ( not ( = ?auto_73984 ?auto_73987 ) ) ( not ( = ?auto_73984 ?auto_73988 ) ) ( not ( = ?auto_73985 ?auto_73986 ) ) ( not ( = ?auto_73985 ?auto_73987 ) ) ( not ( = ?auto_73985 ?auto_73988 ) ) ( not ( = ?auto_73986 ?auto_73987 ) ) ( not ( = ?auto_73986 ?auto_73988 ) ) ( not ( = ?auto_73987 ?auto_73988 ) ) ( ON-TABLE ?auto_73988 ) ( ON ?auto_73982 ?auto_73989 ) ( not ( = ?auto_73982 ?auto_73989 ) ) ( not ( = ?auto_73983 ?auto_73989 ) ) ( not ( = ?auto_73984 ?auto_73989 ) ) ( not ( = ?auto_73985 ?auto_73989 ) ) ( not ( = ?auto_73986 ?auto_73989 ) ) ( not ( = ?auto_73987 ?auto_73989 ) ) ( not ( = ?auto_73988 ?auto_73989 ) ) ( ON ?auto_73983 ?auto_73982 ) ( ON-TABLE ?auto_73989 ) ( ON ?auto_73984 ?auto_73983 ) ( ON ?auto_73985 ?auto_73984 ) ( ON ?auto_73986 ?auto_73985 ) ( CLEAR ?auto_73988 ) ( ON ?auto_73987 ?auto_73986 ) ( CLEAR ?auto_73987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73989 ?auto_73982 ?auto_73983 ?auto_73984 ?auto_73985 ?auto_73986 )
      ( MAKE-7PILE ?auto_73982 ?auto_73983 ?auto_73984 ?auto_73985 ?auto_73986 ?auto_73987 ?auto_73988 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73990 - BLOCK
      ?auto_73991 - BLOCK
      ?auto_73992 - BLOCK
      ?auto_73993 - BLOCK
      ?auto_73994 - BLOCK
      ?auto_73995 - BLOCK
      ?auto_73996 - BLOCK
    )
    :vars
    (
      ?auto_73997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73990 ?auto_73991 ) ) ( not ( = ?auto_73990 ?auto_73992 ) ) ( not ( = ?auto_73990 ?auto_73993 ) ) ( not ( = ?auto_73990 ?auto_73994 ) ) ( not ( = ?auto_73990 ?auto_73995 ) ) ( not ( = ?auto_73990 ?auto_73996 ) ) ( not ( = ?auto_73991 ?auto_73992 ) ) ( not ( = ?auto_73991 ?auto_73993 ) ) ( not ( = ?auto_73991 ?auto_73994 ) ) ( not ( = ?auto_73991 ?auto_73995 ) ) ( not ( = ?auto_73991 ?auto_73996 ) ) ( not ( = ?auto_73992 ?auto_73993 ) ) ( not ( = ?auto_73992 ?auto_73994 ) ) ( not ( = ?auto_73992 ?auto_73995 ) ) ( not ( = ?auto_73992 ?auto_73996 ) ) ( not ( = ?auto_73993 ?auto_73994 ) ) ( not ( = ?auto_73993 ?auto_73995 ) ) ( not ( = ?auto_73993 ?auto_73996 ) ) ( not ( = ?auto_73994 ?auto_73995 ) ) ( not ( = ?auto_73994 ?auto_73996 ) ) ( not ( = ?auto_73995 ?auto_73996 ) ) ( ON ?auto_73990 ?auto_73997 ) ( not ( = ?auto_73990 ?auto_73997 ) ) ( not ( = ?auto_73991 ?auto_73997 ) ) ( not ( = ?auto_73992 ?auto_73997 ) ) ( not ( = ?auto_73993 ?auto_73997 ) ) ( not ( = ?auto_73994 ?auto_73997 ) ) ( not ( = ?auto_73995 ?auto_73997 ) ) ( not ( = ?auto_73996 ?auto_73997 ) ) ( ON ?auto_73991 ?auto_73990 ) ( ON-TABLE ?auto_73997 ) ( ON ?auto_73992 ?auto_73991 ) ( ON ?auto_73993 ?auto_73992 ) ( ON ?auto_73994 ?auto_73993 ) ( ON ?auto_73995 ?auto_73994 ) ( CLEAR ?auto_73995 ) ( HOLDING ?auto_73996 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73996 )
      ( MAKE-7PILE ?auto_73990 ?auto_73991 ?auto_73992 ?auto_73993 ?auto_73994 ?auto_73995 ?auto_73996 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73998 - BLOCK
      ?auto_73999 - BLOCK
      ?auto_74000 - BLOCK
      ?auto_74001 - BLOCK
      ?auto_74002 - BLOCK
      ?auto_74003 - BLOCK
      ?auto_74004 - BLOCK
    )
    :vars
    (
      ?auto_74005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_73998 ?auto_73999 ) ) ( not ( = ?auto_73998 ?auto_74000 ) ) ( not ( = ?auto_73998 ?auto_74001 ) ) ( not ( = ?auto_73998 ?auto_74002 ) ) ( not ( = ?auto_73998 ?auto_74003 ) ) ( not ( = ?auto_73998 ?auto_74004 ) ) ( not ( = ?auto_73999 ?auto_74000 ) ) ( not ( = ?auto_73999 ?auto_74001 ) ) ( not ( = ?auto_73999 ?auto_74002 ) ) ( not ( = ?auto_73999 ?auto_74003 ) ) ( not ( = ?auto_73999 ?auto_74004 ) ) ( not ( = ?auto_74000 ?auto_74001 ) ) ( not ( = ?auto_74000 ?auto_74002 ) ) ( not ( = ?auto_74000 ?auto_74003 ) ) ( not ( = ?auto_74000 ?auto_74004 ) ) ( not ( = ?auto_74001 ?auto_74002 ) ) ( not ( = ?auto_74001 ?auto_74003 ) ) ( not ( = ?auto_74001 ?auto_74004 ) ) ( not ( = ?auto_74002 ?auto_74003 ) ) ( not ( = ?auto_74002 ?auto_74004 ) ) ( not ( = ?auto_74003 ?auto_74004 ) ) ( ON ?auto_73998 ?auto_74005 ) ( not ( = ?auto_73998 ?auto_74005 ) ) ( not ( = ?auto_73999 ?auto_74005 ) ) ( not ( = ?auto_74000 ?auto_74005 ) ) ( not ( = ?auto_74001 ?auto_74005 ) ) ( not ( = ?auto_74002 ?auto_74005 ) ) ( not ( = ?auto_74003 ?auto_74005 ) ) ( not ( = ?auto_74004 ?auto_74005 ) ) ( ON ?auto_73999 ?auto_73998 ) ( ON-TABLE ?auto_74005 ) ( ON ?auto_74000 ?auto_73999 ) ( ON ?auto_74001 ?auto_74000 ) ( ON ?auto_74002 ?auto_74001 ) ( ON ?auto_74003 ?auto_74002 ) ( ON ?auto_74004 ?auto_74003 ) ( CLEAR ?auto_74004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74005 ?auto_73998 ?auto_73999 ?auto_74000 ?auto_74001 ?auto_74002 ?auto_74003 )
      ( MAKE-7PILE ?auto_73998 ?auto_73999 ?auto_74000 ?auto_74001 ?auto_74002 ?auto_74003 ?auto_74004 ) )
  )

)

