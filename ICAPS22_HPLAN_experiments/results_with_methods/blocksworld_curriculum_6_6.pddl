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
      ?auto_12519 - BLOCK
    )
    :vars
    (
      ?auto_12520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12519 ?auto_12520 ) ( CLEAR ?auto_12519 ) ( HAND-EMPTY ) ( not ( = ?auto_12519 ?auto_12520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12519 ?auto_12520 )
      ( !PUTDOWN ?auto_12519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12522 - BLOCK
    )
    :vars
    (
      ?auto_12523 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12522 ?auto_12523 ) ( CLEAR ?auto_12522 ) ( HAND-EMPTY ) ( not ( = ?auto_12522 ?auto_12523 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12522 ?auto_12523 )
      ( !PUTDOWN ?auto_12522 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12526 - BLOCK
      ?auto_12527 - BLOCK
    )
    :vars
    (
      ?auto_12528 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12526 ) ( ON ?auto_12527 ?auto_12528 ) ( CLEAR ?auto_12527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12526 ) ( not ( = ?auto_12526 ?auto_12527 ) ) ( not ( = ?auto_12526 ?auto_12528 ) ) ( not ( = ?auto_12527 ?auto_12528 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12527 ?auto_12528 )
      ( !STACK ?auto_12527 ?auto_12526 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12531 - BLOCK
      ?auto_12532 - BLOCK
    )
    :vars
    (
      ?auto_12533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12531 ) ( ON ?auto_12532 ?auto_12533 ) ( CLEAR ?auto_12532 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12531 ) ( not ( = ?auto_12531 ?auto_12532 ) ) ( not ( = ?auto_12531 ?auto_12533 ) ) ( not ( = ?auto_12532 ?auto_12533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12532 ?auto_12533 )
      ( !STACK ?auto_12532 ?auto_12531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12536 - BLOCK
      ?auto_12537 - BLOCK
    )
    :vars
    (
      ?auto_12538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12537 ?auto_12538 ) ( not ( = ?auto_12536 ?auto_12537 ) ) ( not ( = ?auto_12536 ?auto_12538 ) ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( ON ?auto_12536 ?auto_12537 ) ( CLEAR ?auto_12536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12536 )
      ( MAKE-2PILE ?auto_12536 ?auto_12537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_12541 - BLOCK
      ?auto_12542 - BLOCK
    )
    :vars
    (
      ?auto_12543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12542 ?auto_12543 ) ( not ( = ?auto_12541 ?auto_12542 ) ) ( not ( = ?auto_12541 ?auto_12543 ) ) ( not ( = ?auto_12542 ?auto_12543 ) ) ( ON ?auto_12541 ?auto_12542 ) ( CLEAR ?auto_12541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12541 )
      ( MAKE-2PILE ?auto_12541 ?auto_12542 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12547 - BLOCK
      ?auto_12548 - BLOCK
      ?auto_12549 - BLOCK
    )
    :vars
    (
      ?auto_12550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12548 ) ( ON ?auto_12549 ?auto_12550 ) ( CLEAR ?auto_12549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12547 ) ( ON ?auto_12548 ?auto_12547 ) ( not ( = ?auto_12547 ?auto_12548 ) ) ( not ( = ?auto_12547 ?auto_12549 ) ) ( not ( = ?auto_12547 ?auto_12550 ) ) ( not ( = ?auto_12548 ?auto_12549 ) ) ( not ( = ?auto_12548 ?auto_12550 ) ) ( not ( = ?auto_12549 ?auto_12550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12549 ?auto_12550 )
      ( !STACK ?auto_12549 ?auto_12548 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12554 - BLOCK
      ?auto_12555 - BLOCK
      ?auto_12556 - BLOCK
    )
    :vars
    (
      ?auto_12557 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12555 ) ( ON ?auto_12556 ?auto_12557 ) ( CLEAR ?auto_12556 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12554 ) ( ON ?auto_12555 ?auto_12554 ) ( not ( = ?auto_12554 ?auto_12555 ) ) ( not ( = ?auto_12554 ?auto_12556 ) ) ( not ( = ?auto_12554 ?auto_12557 ) ) ( not ( = ?auto_12555 ?auto_12556 ) ) ( not ( = ?auto_12555 ?auto_12557 ) ) ( not ( = ?auto_12556 ?auto_12557 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12556 ?auto_12557 )
      ( !STACK ?auto_12556 ?auto_12555 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12561 - BLOCK
      ?auto_12562 - BLOCK
      ?auto_12563 - BLOCK
    )
    :vars
    (
      ?auto_12564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12563 ?auto_12564 ) ( ON-TABLE ?auto_12561 ) ( not ( = ?auto_12561 ?auto_12562 ) ) ( not ( = ?auto_12561 ?auto_12563 ) ) ( not ( = ?auto_12561 ?auto_12564 ) ) ( not ( = ?auto_12562 ?auto_12563 ) ) ( not ( = ?auto_12562 ?auto_12564 ) ) ( not ( = ?auto_12563 ?auto_12564 ) ) ( CLEAR ?auto_12561 ) ( ON ?auto_12562 ?auto_12563 ) ( CLEAR ?auto_12562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12561 ?auto_12562 )
      ( MAKE-3PILE ?auto_12561 ?auto_12562 ?auto_12563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12568 - BLOCK
      ?auto_12569 - BLOCK
      ?auto_12570 - BLOCK
    )
    :vars
    (
      ?auto_12571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12570 ?auto_12571 ) ( ON-TABLE ?auto_12568 ) ( not ( = ?auto_12568 ?auto_12569 ) ) ( not ( = ?auto_12568 ?auto_12570 ) ) ( not ( = ?auto_12568 ?auto_12571 ) ) ( not ( = ?auto_12569 ?auto_12570 ) ) ( not ( = ?auto_12569 ?auto_12571 ) ) ( not ( = ?auto_12570 ?auto_12571 ) ) ( CLEAR ?auto_12568 ) ( ON ?auto_12569 ?auto_12570 ) ( CLEAR ?auto_12569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12568 ?auto_12569 )
      ( MAKE-3PILE ?auto_12568 ?auto_12569 ?auto_12570 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12575 - BLOCK
      ?auto_12576 - BLOCK
      ?auto_12577 - BLOCK
    )
    :vars
    (
      ?auto_12578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12577 ?auto_12578 ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( not ( = ?auto_12575 ?auto_12577 ) ) ( not ( = ?auto_12575 ?auto_12578 ) ) ( not ( = ?auto_12576 ?auto_12577 ) ) ( not ( = ?auto_12576 ?auto_12578 ) ) ( not ( = ?auto_12577 ?auto_12578 ) ) ( ON ?auto_12576 ?auto_12577 ) ( ON ?auto_12575 ?auto_12576 ) ( CLEAR ?auto_12575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12575 )
      ( MAKE-3PILE ?auto_12575 ?auto_12576 ?auto_12577 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_12582 - BLOCK
      ?auto_12583 - BLOCK
      ?auto_12584 - BLOCK
    )
    :vars
    (
      ?auto_12585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12584 ?auto_12585 ) ( not ( = ?auto_12582 ?auto_12583 ) ) ( not ( = ?auto_12582 ?auto_12584 ) ) ( not ( = ?auto_12582 ?auto_12585 ) ) ( not ( = ?auto_12583 ?auto_12584 ) ) ( not ( = ?auto_12583 ?auto_12585 ) ) ( not ( = ?auto_12584 ?auto_12585 ) ) ( ON ?auto_12583 ?auto_12584 ) ( ON ?auto_12582 ?auto_12583 ) ( CLEAR ?auto_12582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12582 )
      ( MAKE-3PILE ?auto_12582 ?auto_12583 ?auto_12584 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12590 - BLOCK
      ?auto_12591 - BLOCK
      ?auto_12592 - BLOCK
      ?auto_12593 - BLOCK
    )
    :vars
    (
      ?auto_12594 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12592 ) ( ON ?auto_12593 ?auto_12594 ) ( CLEAR ?auto_12593 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12590 ) ( ON ?auto_12591 ?auto_12590 ) ( ON ?auto_12592 ?auto_12591 ) ( not ( = ?auto_12590 ?auto_12591 ) ) ( not ( = ?auto_12590 ?auto_12592 ) ) ( not ( = ?auto_12590 ?auto_12593 ) ) ( not ( = ?auto_12590 ?auto_12594 ) ) ( not ( = ?auto_12591 ?auto_12592 ) ) ( not ( = ?auto_12591 ?auto_12593 ) ) ( not ( = ?auto_12591 ?auto_12594 ) ) ( not ( = ?auto_12592 ?auto_12593 ) ) ( not ( = ?auto_12592 ?auto_12594 ) ) ( not ( = ?auto_12593 ?auto_12594 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12593 ?auto_12594 )
      ( !STACK ?auto_12593 ?auto_12592 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12599 - BLOCK
      ?auto_12600 - BLOCK
      ?auto_12601 - BLOCK
      ?auto_12602 - BLOCK
    )
    :vars
    (
      ?auto_12603 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12601 ) ( ON ?auto_12602 ?auto_12603 ) ( CLEAR ?auto_12602 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12599 ) ( ON ?auto_12600 ?auto_12599 ) ( ON ?auto_12601 ?auto_12600 ) ( not ( = ?auto_12599 ?auto_12600 ) ) ( not ( = ?auto_12599 ?auto_12601 ) ) ( not ( = ?auto_12599 ?auto_12602 ) ) ( not ( = ?auto_12599 ?auto_12603 ) ) ( not ( = ?auto_12600 ?auto_12601 ) ) ( not ( = ?auto_12600 ?auto_12602 ) ) ( not ( = ?auto_12600 ?auto_12603 ) ) ( not ( = ?auto_12601 ?auto_12602 ) ) ( not ( = ?auto_12601 ?auto_12603 ) ) ( not ( = ?auto_12602 ?auto_12603 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12602 ?auto_12603 )
      ( !STACK ?auto_12602 ?auto_12601 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12608 - BLOCK
      ?auto_12609 - BLOCK
      ?auto_12610 - BLOCK
      ?auto_12611 - BLOCK
    )
    :vars
    (
      ?auto_12612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12611 ?auto_12612 ) ( ON-TABLE ?auto_12608 ) ( ON ?auto_12609 ?auto_12608 ) ( not ( = ?auto_12608 ?auto_12609 ) ) ( not ( = ?auto_12608 ?auto_12610 ) ) ( not ( = ?auto_12608 ?auto_12611 ) ) ( not ( = ?auto_12608 ?auto_12612 ) ) ( not ( = ?auto_12609 ?auto_12610 ) ) ( not ( = ?auto_12609 ?auto_12611 ) ) ( not ( = ?auto_12609 ?auto_12612 ) ) ( not ( = ?auto_12610 ?auto_12611 ) ) ( not ( = ?auto_12610 ?auto_12612 ) ) ( not ( = ?auto_12611 ?auto_12612 ) ) ( CLEAR ?auto_12609 ) ( ON ?auto_12610 ?auto_12611 ) ( CLEAR ?auto_12610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12608 ?auto_12609 ?auto_12610 )
      ( MAKE-4PILE ?auto_12608 ?auto_12609 ?auto_12610 ?auto_12611 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12617 - BLOCK
      ?auto_12618 - BLOCK
      ?auto_12619 - BLOCK
      ?auto_12620 - BLOCK
    )
    :vars
    (
      ?auto_12621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12620 ?auto_12621 ) ( ON-TABLE ?auto_12617 ) ( ON ?auto_12618 ?auto_12617 ) ( not ( = ?auto_12617 ?auto_12618 ) ) ( not ( = ?auto_12617 ?auto_12619 ) ) ( not ( = ?auto_12617 ?auto_12620 ) ) ( not ( = ?auto_12617 ?auto_12621 ) ) ( not ( = ?auto_12618 ?auto_12619 ) ) ( not ( = ?auto_12618 ?auto_12620 ) ) ( not ( = ?auto_12618 ?auto_12621 ) ) ( not ( = ?auto_12619 ?auto_12620 ) ) ( not ( = ?auto_12619 ?auto_12621 ) ) ( not ( = ?auto_12620 ?auto_12621 ) ) ( CLEAR ?auto_12618 ) ( ON ?auto_12619 ?auto_12620 ) ( CLEAR ?auto_12619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12617 ?auto_12618 ?auto_12619 )
      ( MAKE-4PILE ?auto_12617 ?auto_12618 ?auto_12619 ?auto_12620 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12626 - BLOCK
      ?auto_12627 - BLOCK
      ?auto_12628 - BLOCK
      ?auto_12629 - BLOCK
    )
    :vars
    (
      ?auto_12630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12629 ?auto_12630 ) ( ON-TABLE ?auto_12626 ) ( not ( = ?auto_12626 ?auto_12627 ) ) ( not ( = ?auto_12626 ?auto_12628 ) ) ( not ( = ?auto_12626 ?auto_12629 ) ) ( not ( = ?auto_12626 ?auto_12630 ) ) ( not ( = ?auto_12627 ?auto_12628 ) ) ( not ( = ?auto_12627 ?auto_12629 ) ) ( not ( = ?auto_12627 ?auto_12630 ) ) ( not ( = ?auto_12628 ?auto_12629 ) ) ( not ( = ?auto_12628 ?auto_12630 ) ) ( not ( = ?auto_12629 ?auto_12630 ) ) ( ON ?auto_12628 ?auto_12629 ) ( CLEAR ?auto_12626 ) ( ON ?auto_12627 ?auto_12628 ) ( CLEAR ?auto_12627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12626 ?auto_12627 )
      ( MAKE-4PILE ?auto_12626 ?auto_12627 ?auto_12628 ?auto_12629 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12635 - BLOCK
      ?auto_12636 - BLOCK
      ?auto_12637 - BLOCK
      ?auto_12638 - BLOCK
    )
    :vars
    (
      ?auto_12639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12638 ?auto_12639 ) ( ON-TABLE ?auto_12635 ) ( not ( = ?auto_12635 ?auto_12636 ) ) ( not ( = ?auto_12635 ?auto_12637 ) ) ( not ( = ?auto_12635 ?auto_12638 ) ) ( not ( = ?auto_12635 ?auto_12639 ) ) ( not ( = ?auto_12636 ?auto_12637 ) ) ( not ( = ?auto_12636 ?auto_12638 ) ) ( not ( = ?auto_12636 ?auto_12639 ) ) ( not ( = ?auto_12637 ?auto_12638 ) ) ( not ( = ?auto_12637 ?auto_12639 ) ) ( not ( = ?auto_12638 ?auto_12639 ) ) ( ON ?auto_12637 ?auto_12638 ) ( CLEAR ?auto_12635 ) ( ON ?auto_12636 ?auto_12637 ) ( CLEAR ?auto_12636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12635 ?auto_12636 )
      ( MAKE-4PILE ?auto_12635 ?auto_12636 ?auto_12637 ?auto_12638 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12644 - BLOCK
      ?auto_12645 - BLOCK
      ?auto_12646 - BLOCK
      ?auto_12647 - BLOCK
    )
    :vars
    (
      ?auto_12648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12647 ?auto_12648 ) ( not ( = ?auto_12644 ?auto_12645 ) ) ( not ( = ?auto_12644 ?auto_12646 ) ) ( not ( = ?auto_12644 ?auto_12647 ) ) ( not ( = ?auto_12644 ?auto_12648 ) ) ( not ( = ?auto_12645 ?auto_12646 ) ) ( not ( = ?auto_12645 ?auto_12647 ) ) ( not ( = ?auto_12645 ?auto_12648 ) ) ( not ( = ?auto_12646 ?auto_12647 ) ) ( not ( = ?auto_12646 ?auto_12648 ) ) ( not ( = ?auto_12647 ?auto_12648 ) ) ( ON ?auto_12646 ?auto_12647 ) ( ON ?auto_12645 ?auto_12646 ) ( ON ?auto_12644 ?auto_12645 ) ( CLEAR ?auto_12644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12644 )
      ( MAKE-4PILE ?auto_12644 ?auto_12645 ?auto_12646 ?auto_12647 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_12653 - BLOCK
      ?auto_12654 - BLOCK
      ?auto_12655 - BLOCK
      ?auto_12656 - BLOCK
    )
    :vars
    (
      ?auto_12657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12656 ?auto_12657 ) ( not ( = ?auto_12653 ?auto_12654 ) ) ( not ( = ?auto_12653 ?auto_12655 ) ) ( not ( = ?auto_12653 ?auto_12656 ) ) ( not ( = ?auto_12653 ?auto_12657 ) ) ( not ( = ?auto_12654 ?auto_12655 ) ) ( not ( = ?auto_12654 ?auto_12656 ) ) ( not ( = ?auto_12654 ?auto_12657 ) ) ( not ( = ?auto_12655 ?auto_12656 ) ) ( not ( = ?auto_12655 ?auto_12657 ) ) ( not ( = ?auto_12656 ?auto_12657 ) ) ( ON ?auto_12655 ?auto_12656 ) ( ON ?auto_12654 ?auto_12655 ) ( ON ?auto_12653 ?auto_12654 ) ( CLEAR ?auto_12653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12653 )
      ( MAKE-4PILE ?auto_12653 ?auto_12654 ?auto_12655 ?auto_12656 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12663 - BLOCK
      ?auto_12664 - BLOCK
      ?auto_12665 - BLOCK
      ?auto_12666 - BLOCK
      ?auto_12667 - BLOCK
    )
    :vars
    (
      ?auto_12668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12666 ) ( ON ?auto_12667 ?auto_12668 ) ( CLEAR ?auto_12667 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12663 ) ( ON ?auto_12664 ?auto_12663 ) ( ON ?auto_12665 ?auto_12664 ) ( ON ?auto_12666 ?auto_12665 ) ( not ( = ?auto_12663 ?auto_12664 ) ) ( not ( = ?auto_12663 ?auto_12665 ) ) ( not ( = ?auto_12663 ?auto_12666 ) ) ( not ( = ?auto_12663 ?auto_12667 ) ) ( not ( = ?auto_12663 ?auto_12668 ) ) ( not ( = ?auto_12664 ?auto_12665 ) ) ( not ( = ?auto_12664 ?auto_12666 ) ) ( not ( = ?auto_12664 ?auto_12667 ) ) ( not ( = ?auto_12664 ?auto_12668 ) ) ( not ( = ?auto_12665 ?auto_12666 ) ) ( not ( = ?auto_12665 ?auto_12667 ) ) ( not ( = ?auto_12665 ?auto_12668 ) ) ( not ( = ?auto_12666 ?auto_12667 ) ) ( not ( = ?auto_12666 ?auto_12668 ) ) ( not ( = ?auto_12667 ?auto_12668 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12667 ?auto_12668 )
      ( !STACK ?auto_12667 ?auto_12666 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12674 - BLOCK
      ?auto_12675 - BLOCK
      ?auto_12676 - BLOCK
      ?auto_12677 - BLOCK
      ?auto_12678 - BLOCK
    )
    :vars
    (
      ?auto_12679 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12677 ) ( ON ?auto_12678 ?auto_12679 ) ( CLEAR ?auto_12678 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12674 ) ( ON ?auto_12675 ?auto_12674 ) ( ON ?auto_12676 ?auto_12675 ) ( ON ?auto_12677 ?auto_12676 ) ( not ( = ?auto_12674 ?auto_12675 ) ) ( not ( = ?auto_12674 ?auto_12676 ) ) ( not ( = ?auto_12674 ?auto_12677 ) ) ( not ( = ?auto_12674 ?auto_12678 ) ) ( not ( = ?auto_12674 ?auto_12679 ) ) ( not ( = ?auto_12675 ?auto_12676 ) ) ( not ( = ?auto_12675 ?auto_12677 ) ) ( not ( = ?auto_12675 ?auto_12678 ) ) ( not ( = ?auto_12675 ?auto_12679 ) ) ( not ( = ?auto_12676 ?auto_12677 ) ) ( not ( = ?auto_12676 ?auto_12678 ) ) ( not ( = ?auto_12676 ?auto_12679 ) ) ( not ( = ?auto_12677 ?auto_12678 ) ) ( not ( = ?auto_12677 ?auto_12679 ) ) ( not ( = ?auto_12678 ?auto_12679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12678 ?auto_12679 )
      ( !STACK ?auto_12678 ?auto_12677 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12685 - BLOCK
      ?auto_12686 - BLOCK
      ?auto_12687 - BLOCK
      ?auto_12688 - BLOCK
      ?auto_12689 - BLOCK
    )
    :vars
    (
      ?auto_12690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12689 ?auto_12690 ) ( ON-TABLE ?auto_12685 ) ( ON ?auto_12686 ?auto_12685 ) ( ON ?auto_12687 ?auto_12686 ) ( not ( = ?auto_12685 ?auto_12686 ) ) ( not ( = ?auto_12685 ?auto_12687 ) ) ( not ( = ?auto_12685 ?auto_12688 ) ) ( not ( = ?auto_12685 ?auto_12689 ) ) ( not ( = ?auto_12685 ?auto_12690 ) ) ( not ( = ?auto_12686 ?auto_12687 ) ) ( not ( = ?auto_12686 ?auto_12688 ) ) ( not ( = ?auto_12686 ?auto_12689 ) ) ( not ( = ?auto_12686 ?auto_12690 ) ) ( not ( = ?auto_12687 ?auto_12688 ) ) ( not ( = ?auto_12687 ?auto_12689 ) ) ( not ( = ?auto_12687 ?auto_12690 ) ) ( not ( = ?auto_12688 ?auto_12689 ) ) ( not ( = ?auto_12688 ?auto_12690 ) ) ( not ( = ?auto_12689 ?auto_12690 ) ) ( CLEAR ?auto_12687 ) ( ON ?auto_12688 ?auto_12689 ) ( CLEAR ?auto_12688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12685 ?auto_12686 ?auto_12687 ?auto_12688 )
      ( MAKE-5PILE ?auto_12685 ?auto_12686 ?auto_12687 ?auto_12688 ?auto_12689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12696 - BLOCK
      ?auto_12697 - BLOCK
      ?auto_12698 - BLOCK
      ?auto_12699 - BLOCK
      ?auto_12700 - BLOCK
    )
    :vars
    (
      ?auto_12701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12700 ?auto_12701 ) ( ON-TABLE ?auto_12696 ) ( ON ?auto_12697 ?auto_12696 ) ( ON ?auto_12698 ?auto_12697 ) ( not ( = ?auto_12696 ?auto_12697 ) ) ( not ( = ?auto_12696 ?auto_12698 ) ) ( not ( = ?auto_12696 ?auto_12699 ) ) ( not ( = ?auto_12696 ?auto_12700 ) ) ( not ( = ?auto_12696 ?auto_12701 ) ) ( not ( = ?auto_12697 ?auto_12698 ) ) ( not ( = ?auto_12697 ?auto_12699 ) ) ( not ( = ?auto_12697 ?auto_12700 ) ) ( not ( = ?auto_12697 ?auto_12701 ) ) ( not ( = ?auto_12698 ?auto_12699 ) ) ( not ( = ?auto_12698 ?auto_12700 ) ) ( not ( = ?auto_12698 ?auto_12701 ) ) ( not ( = ?auto_12699 ?auto_12700 ) ) ( not ( = ?auto_12699 ?auto_12701 ) ) ( not ( = ?auto_12700 ?auto_12701 ) ) ( CLEAR ?auto_12698 ) ( ON ?auto_12699 ?auto_12700 ) ( CLEAR ?auto_12699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12696 ?auto_12697 ?auto_12698 ?auto_12699 )
      ( MAKE-5PILE ?auto_12696 ?auto_12697 ?auto_12698 ?auto_12699 ?auto_12700 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12707 - BLOCK
      ?auto_12708 - BLOCK
      ?auto_12709 - BLOCK
      ?auto_12710 - BLOCK
      ?auto_12711 - BLOCK
    )
    :vars
    (
      ?auto_12712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12711 ?auto_12712 ) ( ON-TABLE ?auto_12707 ) ( ON ?auto_12708 ?auto_12707 ) ( not ( = ?auto_12707 ?auto_12708 ) ) ( not ( = ?auto_12707 ?auto_12709 ) ) ( not ( = ?auto_12707 ?auto_12710 ) ) ( not ( = ?auto_12707 ?auto_12711 ) ) ( not ( = ?auto_12707 ?auto_12712 ) ) ( not ( = ?auto_12708 ?auto_12709 ) ) ( not ( = ?auto_12708 ?auto_12710 ) ) ( not ( = ?auto_12708 ?auto_12711 ) ) ( not ( = ?auto_12708 ?auto_12712 ) ) ( not ( = ?auto_12709 ?auto_12710 ) ) ( not ( = ?auto_12709 ?auto_12711 ) ) ( not ( = ?auto_12709 ?auto_12712 ) ) ( not ( = ?auto_12710 ?auto_12711 ) ) ( not ( = ?auto_12710 ?auto_12712 ) ) ( not ( = ?auto_12711 ?auto_12712 ) ) ( ON ?auto_12710 ?auto_12711 ) ( CLEAR ?auto_12708 ) ( ON ?auto_12709 ?auto_12710 ) ( CLEAR ?auto_12709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12707 ?auto_12708 ?auto_12709 )
      ( MAKE-5PILE ?auto_12707 ?auto_12708 ?auto_12709 ?auto_12710 ?auto_12711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12718 - BLOCK
      ?auto_12719 - BLOCK
      ?auto_12720 - BLOCK
      ?auto_12721 - BLOCK
      ?auto_12722 - BLOCK
    )
    :vars
    (
      ?auto_12723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12722 ?auto_12723 ) ( ON-TABLE ?auto_12718 ) ( ON ?auto_12719 ?auto_12718 ) ( not ( = ?auto_12718 ?auto_12719 ) ) ( not ( = ?auto_12718 ?auto_12720 ) ) ( not ( = ?auto_12718 ?auto_12721 ) ) ( not ( = ?auto_12718 ?auto_12722 ) ) ( not ( = ?auto_12718 ?auto_12723 ) ) ( not ( = ?auto_12719 ?auto_12720 ) ) ( not ( = ?auto_12719 ?auto_12721 ) ) ( not ( = ?auto_12719 ?auto_12722 ) ) ( not ( = ?auto_12719 ?auto_12723 ) ) ( not ( = ?auto_12720 ?auto_12721 ) ) ( not ( = ?auto_12720 ?auto_12722 ) ) ( not ( = ?auto_12720 ?auto_12723 ) ) ( not ( = ?auto_12721 ?auto_12722 ) ) ( not ( = ?auto_12721 ?auto_12723 ) ) ( not ( = ?auto_12722 ?auto_12723 ) ) ( ON ?auto_12721 ?auto_12722 ) ( CLEAR ?auto_12719 ) ( ON ?auto_12720 ?auto_12721 ) ( CLEAR ?auto_12720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12718 ?auto_12719 ?auto_12720 )
      ( MAKE-5PILE ?auto_12718 ?auto_12719 ?auto_12720 ?auto_12721 ?auto_12722 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12729 - BLOCK
      ?auto_12730 - BLOCK
      ?auto_12731 - BLOCK
      ?auto_12732 - BLOCK
      ?auto_12733 - BLOCK
    )
    :vars
    (
      ?auto_12734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12733 ?auto_12734 ) ( ON-TABLE ?auto_12729 ) ( not ( = ?auto_12729 ?auto_12730 ) ) ( not ( = ?auto_12729 ?auto_12731 ) ) ( not ( = ?auto_12729 ?auto_12732 ) ) ( not ( = ?auto_12729 ?auto_12733 ) ) ( not ( = ?auto_12729 ?auto_12734 ) ) ( not ( = ?auto_12730 ?auto_12731 ) ) ( not ( = ?auto_12730 ?auto_12732 ) ) ( not ( = ?auto_12730 ?auto_12733 ) ) ( not ( = ?auto_12730 ?auto_12734 ) ) ( not ( = ?auto_12731 ?auto_12732 ) ) ( not ( = ?auto_12731 ?auto_12733 ) ) ( not ( = ?auto_12731 ?auto_12734 ) ) ( not ( = ?auto_12732 ?auto_12733 ) ) ( not ( = ?auto_12732 ?auto_12734 ) ) ( not ( = ?auto_12733 ?auto_12734 ) ) ( ON ?auto_12732 ?auto_12733 ) ( ON ?auto_12731 ?auto_12732 ) ( CLEAR ?auto_12729 ) ( ON ?auto_12730 ?auto_12731 ) ( CLEAR ?auto_12730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12729 ?auto_12730 )
      ( MAKE-5PILE ?auto_12729 ?auto_12730 ?auto_12731 ?auto_12732 ?auto_12733 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12740 - BLOCK
      ?auto_12741 - BLOCK
      ?auto_12742 - BLOCK
      ?auto_12743 - BLOCK
      ?auto_12744 - BLOCK
    )
    :vars
    (
      ?auto_12745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12744 ?auto_12745 ) ( ON-TABLE ?auto_12740 ) ( not ( = ?auto_12740 ?auto_12741 ) ) ( not ( = ?auto_12740 ?auto_12742 ) ) ( not ( = ?auto_12740 ?auto_12743 ) ) ( not ( = ?auto_12740 ?auto_12744 ) ) ( not ( = ?auto_12740 ?auto_12745 ) ) ( not ( = ?auto_12741 ?auto_12742 ) ) ( not ( = ?auto_12741 ?auto_12743 ) ) ( not ( = ?auto_12741 ?auto_12744 ) ) ( not ( = ?auto_12741 ?auto_12745 ) ) ( not ( = ?auto_12742 ?auto_12743 ) ) ( not ( = ?auto_12742 ?auto_12744 ) ) ( not ( = ?auto_12742 ?auto_12745 ) ) ( not ( = ?auto_12743 ?auto_12744 ) ) ( not ( = ?auto_12743 ?auto_12745 ) ) ( not ( = ?auto_12744 ?auto_12745 ) ) ( ON ?auto_12743 ?auto_12744 ) ( ON ?auto_12742 ?auto_12743 ) ( CLEAR ?auto_12740 ) ( ON ?auto_12741 ?auto_12742 ) ( CLEAR ?auto_12741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12740 ?auto_12741 )
      ( MAKE-5PILE ?auto_12740 ?auto_12741 ?auto_12742 ?auto_12743 ?auto_12744 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12751 - BLOCK
      ?auto_12752 - BLOCK
      ?auto_12753 - BLOCK
      ?auto_12754 - BLOCK
      ?auto_12755 - BLOCK
    )
    :vars
    (
      ?auto_12756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12755 ?auto_12756 ) ( not ( = ?auto_12751 ?auto_12752 ) ) ( not ( = ?auto_12751 ?auto_12753 ) ) ( not ( = ?auto_12751 ?auto_12754 ) ) ( not ( = ?auto_12751 ?auto_12755 ) ) ( not ( = ?auto_12751 ?auto_12756 ) ) ( not ( = ?auto_12752 ?auto_12753 ) ) ( not ( = ?auto_12752 ?auto_12754 ) ) ( not ( = ?auto_12752 ?auto_12755 ) ) ( not ( = ?auto_12752 ?auto_12756 ) ) ( not ( = ?auto_12753 ?auto_12754 ) ) ( not ( = ?auto_12753 ?auto_12755 ) ) ( not ( = ?auto_12753 ?auto_12756 ) ) ( not ( = ?auto_12754 ?auto_12755 ) ) ( not ( = ?auto_12754 ?auto_12756 ) ) ( not ( = ?auto_12755 ?auto_12756 ) ) ( ON ?auto_12754 ?auto_12755 ) ( ON ?auto_12753 ?auto_12754 ) ( ON ?auto_12752 ?auto_12753 ) ( ON ?auto_12751 ?auto_12752 ) ( CLEAR ?auto_12751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12751 )
      ( MAKE-5PILE ?auto_12751 ?auto_12752 ?auto_12753 ?auto_12754 ?auto_12755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_12762 - BLOCK
      ?auto_12763 - BLOCK
      ?auto_12764 - BLOCK
      ?auto_12765 - BLOCK
      ?auto_12766 - BLOCK
    )
    :vars
    (
      ?auto_12767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12766 ?auto_12767 ) ( not ( = ?auto_12762 ?auto_12763 ) ) ( not ( = ?auto_12762 ?auto_12764 ) ) ( not ( = ?auto_12762 ?auto_12765 ) ) ( not ( = ?auto_12762 ?auto_12766 ) ) ( not ( = ?auto_12762 ?auto_12767 ) ) ( not ( = ?auto_12763 ?auto_12764 ) ) ( not ( = ?auto_12763 ?auto_12765 ) ) ( not ( = ?auto_12763 ?auto_12766 ) ) ( not ( = ?auto_12763 ?auto_12767 ) ) ( not ( = ?auto_12764 ?auto_12765 ) ) ( not ( = ?auto_12764 ?auto_12766 ) ) ( not ( = ?auto_12764 ?auto_12767 ) ) ( not ( = ?auto_12765 ?auto_12766 ) ) ( not ( = ?auto_12765 ?auto_12767 ) ) ( not ( = ?auto_12766 ?auto_12767 ) ) ( ON ?auto_12765 ?auto_12766 ) ( ON ?auto_12764 ?auto_12765 ) ( ON ?auto_12763 ?auto_12764 ) ( ON ?auto_12762 ?auto_12763 ) ( CLEAR ?auto_12762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12762 )
      ( MAKE-5PILE ?auto_12762 ?auto_12763 ?auto_12764 ?auto_12765 ?auto_12766 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12774 - BLOCK
      ?auto_12775 - BLOCK
      ?auto_12776 - BLOCK
      ?auto_12777 - BLOCK
      ?auto_12778 - BLOCK
      ?auto_12779 - BLOCK
    )
    :vars
    (
      ?auto_12780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12778 ) ( ON ?auto_12779 ?auto_12780 ) ( CLEAR ?auto_12779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12774 ) ( ON ?auto_12775 ?auto_12774 ) ( ON ?auto_12776 ?auto_12775 ) ( ON ?auto_12777 ?auto_12776 ) ( ON ?auto_12778 ?auto_12777 ) ( not ( = ?auto_12774 ?auto_12775 ) ) ( not ( = ?auto_12774 ?auto_12776 ) ) ( not ( = ?auto_12774 ?auto_12777 ) ) ( not ( = ?auto_12774 ?auto_12778 ) ) ( not ( = ?auto_12774 ?auto_12779 ) ) ( not ( = ?auto_12774 ?auto_12780 ) ) ( not ( = ?auto_12775 ?auto_12776 ) ) ( not ( = ?auto_12775 ?auto_12777 ) ) ( not ( = ?auto_12775 ?auto_12778 ) ) ( not ( = ?auto_12775 ?auto_12779 ) ) ( not ( = ?auto_12775 ?auto_12780 ) ) ( not ( = ?auto_12776 ?auto_12777 ) ) ( not ( = ?auto_12776 ?auto_12778 ) ) ( not ( = ?auto_12776 ?auto_12779 ) ) ( not ( = ?auto_12776 ?auto_12780 ) ) ( not ( = ?auto_12777 ?auto_12778 ) ) ( not ( = ?auto_12777 ?auto_12779 ) ) ( not ( = ?auto_12777 ?auto_12780 ) ) ( not ( = ?auto_12778 ?auto_12779 ) ) ( not ( = ?auto_12778 ?auto_12780 ) ) ( not ( = ?auto_12779 ?auto_12780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_12779 ?auto_12780 )
      ( !STACK ?auto_12779 ?auto_12778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12787 - BLOCK
      ?auto_12788 - BLOCK
      ?auto_12789 - BLOCK
      ?auto_12790 - BLOCK
      ?auto_12791 - BLOCK
      ?auto_12792 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_12791 ) ( ON-TABLE ?auto_12792 ) ( CLEAR ?auto_12792 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_12787 ) ( ON ?auto_12788 ?auto_12787 ) ( ON ?auto_12789 ?auto_12788 ) ( ON ?auto_12790 ?auto_12789 ) ( ON ?auto_12791 ?auto_12790 ) ( not ( = ?auto_12787 ?auto_12788 ) ) ( not ( = ?auto_12787 ?auto_12789 ) ) ( not ( = ?auto_12787 ?auto_12790 ) ) ( not ( = ?auto_12787 ?auto_12791 ) ) ( not ( = ?auto_12787 ?auto_12792 ) ) ( not ( = ?auto_12788 ?auto_12789 ) ) ( not ( = ?auto_12788 ?auto_12790 ) ) ( not ( = ?auto_12788 ?auto_12791 ) ) ( not ( = ?auto_12788 ?auto_12792 ) ) ( not ( = ?auto_12789 ?auto_12790 ) ) ( not ( = ?auto_12789 ?auto_12791 ) ) ( not ( = ?auto_12789 ?auto_12792 ) ) ( not ( = ?auto_12790 ?auto_12791 ) ) ( not ( = ?auto_12790 ?auto_12792 ) ) ( not ( = ?auto_12791 ?auto_12792 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_12792 )
      ( !STACK ?auto_12792 ?auto_12791 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12799 - BLOCK
      ?auto_12800 - BLOCK
      ?auto_12801 - BLOCK
      ?auto_12802 - BLOCK
      ?auto_12803 - BLOCK
      ?auto_12804 - BLOCK
    )
    :vars
    (
      ?auto_12805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12804 ?auto_12805 ) ( ON-TABLE ?auto_12799 ) ( ON ?auto_12800 ?auto_12799 ) ( ON ?auto_12801 ?auto_12800 ) ( ON ?auto_12802 ?auto_12801 ) ( not ( = ?auto_12799 ?auto_12800 ) ) ( not ( = ?auto_12799 ?auto_12801 ) ) ( not ( = ?auto_12799 ?auto_12802 ) ) ( not ( = ?auto_12799 ?auto_12803 ) ) ( not ( = ?auto_12799 ?auto_12804 ) ) ( not ( = ?auto_12799 ?auto_12805 ) ) ( not ( = ?auto_12800 ?auto_12801 ) ) ( not ( = ?auto_12800 ?auto_12802 ) ) ( not ( = ?auto_12800 ?auto_12803 ) ) ( not ( = ?auto_12800 ?auto_12804 ) ) ( not ( = ?auto_12800 ?auto_12805 ) ) ( not ( = ?auto_12801 ?auto_12802 ) ) ( not ( = ?auto_12801 ?auto_12803 ) ) ( not ( = ?auto_12801 ?auto_12804 ) ) ( not ( = ?auto_12801 ?auto_12805 ) ) ( not ( = ?auto_12802 ?auto_12803 ) ) ( not ( = ?auto_12802 ?auto_12804 ) ) ( not ( = ?auto_12802 ?auto_12805 ) ) ( not ( = ?auto_12803 ?auto_12804 ) ) ( not ( = ?auto_12803 ?auto_12805 ) ) ( not ( = ?auto_12804 ?auto_12805 ) ) ( CLEAR ?auto_12802 ) ( ON ?auto_12803 ?auto_12804 ) ( CLEAR ?auto_12803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_12799 ?auto_12800 ?auto_12801 ?auto_12802 ?auto_12803 )
      ( MAKE-6PILE ?auto_12799 ?auto_12800 ?auto_12801 ?auto_12802 ?auto_12803 ?auto_12804 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12812 - BLOCK
      ?auto_12813 - BLOCK
      ?auto_12814 - BLOCK
      ?auto_12815 - BLOCK
      ?auto_12816 - BLOCK
      ?auto_12817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12817 ) ( ON-TABLE ?auto_12812 ) ( ON ?auto_12813 ?auto_12812 ) ( ON ?auto_12814 ?auto_12813 ) ( ON ?auto_12815 ?auto_12814 ) ( not ( = ?auto_12812 ?auto_12813 ) ) ( not ( = ?auto_12812 ?auto_12814 ) ) ( not ( = ?auto_12812 ?auto_12815 ) ) ( not ( = ?auto_12812 ?auto_12816 ) ) ( not ( = ?auto_12812 ?auto_12817 ) ) ( not ( = ?auto_12813 ?auto_12814 ) ) ( not ( = ?auto_12813 ?auto_12815 ) ) ( not ( = ?auto_12813 ?auto_12816 ) ) ( not ( = ?auto_12813 ?auto_12817 ) ) ( not ( = ?auto_12814 ?auto_12815 ) ) ( not ( = ?auto_12814 ?auto_12816 ) ) ( not ( = ?auto_12814 ?auto_12817 ) ) ( not ( = ?auto_12815 ?auto_12816 ) ) ( not ( = ?auto_12815 ?auto_12817 ) ) ( not ( = ?auto_12816 ?auto_12817 ) ) ( CLEAR ?auto_12815 ) ( ON ?auto_12816 ?auto_12817 ) ( CLEAR ?auto_12816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_12812 ?auto_12813 ?auto_12814 ?auto_12815 ?auto_12816 )
      ( MAKE-6PILE ?auto_12812 ?auto_12813 ?auto_12814 ?auto_12815 ?auto_12816 ?auto_12817 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12824 - BLOCK
      ?auto_12825 - BLOCK
      ?auto_12826 - BLOCK
      ?auto_12827 - BLOCK
      ?auto_12828 - BLOCK
      ?auto_12829 - BLOCK
    )
    :vars
    (
      ?auto_12830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12829 ?auto_12830 ) ( ON-TABLE ?auto_12824 ) ( ON ?auto_12825 ?auto_12824 ) ( ON ?auto_12826 ?auto_12825 ) ( not ( = ?auto_12824 ?auto_12825 ) ) ( not ( = ?auto_12824 ?auto_12826 ) ) ( not ( = ?auto_12824 ?auto_12827 ) ) ( not ( = ?auto_12824 ?auto_12828 ) ) ( not ( = ?auto_12824 ?auto_12829 ) ) ( not ( = ?auto_12824 ?auto_12830 ) ) ( not ( = ?auto_12825 ?auto_12826 ) ) ( not ( = ?auto_12825 ?auto_12827 ) ) ( not ( = ?auto_12825 ?auto_12828 ) ) ( not ( = ?auto_12825 ?auto_12829 ) ) ( not ( = ?auto_12825 ?auto_12830 ) ) ( not ( = ?auto_12826 ?auto_12827 ) ) ( not ( = ?auto_12826 ?auto_12828 ) ) ( not ( = ?auto_12826 ?auto_12829 ) ) ( not ( = ?auto_12826 ?auto_12830 ) ) ( not ( = ?auto_12827 ?auto_12828 ) ) ( not ( = ?auto_12827 ?auto_12829 ) ) ( not ( = ?auto_12827 ?auto_12830 ) ) ( not ( = ?auto_12828 ?auto_12829 ) ) ( not ( = ?auto_12828 ?auto_12830 ) ) ( not ( = ?auto_12829 ?auto_12830 ) ) ( ON ?auto_12828 ?auto_12829 ) ( CLEAR ?auto_12826 ) ( ON ?auto_12827 ?auto_12828 ) ( CLEAR ?auto_12827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12824 ?auto_12825 ?auto_12826 ?auto_12827 )
      ( MAKE-6PILE ?auto_12824 ?auto_12825 ?auto_12826 ?auto_12827 ?auto_12828 ?auto_12829 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12837 - BLOCK
      ?auto_12838 - BLOCK
      ?auto_12839 - BLOCK
      ?auto_12840 - BLOCK
      ?auto_12841 - BLOCK
      ?auto_12842 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12842 ) ( ON-TABLE ?auto_12837 ) ( ON ?auto_12838 ?auto_12837 ) ( ON ?auto_12839 ?auto_12838 ) ( not ( = ?auto_12837 ?auto_12838 ) ) ( not ( = ?auto_12837 ?auto_12839 ) ) ( not ( = ?auto_12837 ?auto_12840 ) ) ( not ( = ?auto_12837 ?auto_12841 ) ) ( not ( = ?auto_12837 ?auto_12842 ) ) ( not ( = ?auto_12838 ?auto_12839 ) ) ( not ( = ?auto_12838 ?auto_12840 ) ) ( not ( = ?auto_12838 ?auto_12841 ) ) ( not ( = ?auto_12838 ?auto_12842 ) ) ( not ( = ?auto_12839 ?auto_12840 ) ) ( not ( = ?auto_12839 ?auto_12841 ) ) ( not ( = ?auto_12839 ?auto_12842 ) ) ( not ( = ?auto_12840 ?auto_12841 ) ) ( not ( = ?auto_12840 ?auto_12842 ) ) ( not ( = ?auto_12841 ?auto_12842 ) ) ( ON ?auto_12841 ?auto_12842 ) ( CLEAR ?auto_12839 ) ( ON ?auto_12840 ?auto_12841 ) ( CLEAR ?auto_12840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_12837 ?auto_12838 ?auto_12839 ?auto_12840 )
      ( MAKE-6PILE ?auto_12837 ?auto_12838 ?auto_12839 ?auto_12840 ?auto_12841 ?auto_12842 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12849 - BLOCK
      ?auto_12850 - BLOCK
      ?auto_12851 - BLOCK
      ?auto_12852 - BLOCK
      ?auto_12853 - BLOCK
      ?auto_12854 - BLOCK
    )
    :vars
    (
      ?auto_12855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12854 ?auto_12855 ) ( ON-TABLE ?auto_12849 ) ( ON ?auto_12850 ?auto_12849 ) ( not ( = ?auto_12849 ?auto_12850 ) ) ( not ( = ?auto_12849 ?auto_12851 ) ) ( not ( = ?auto_12849 ?auto_12852 ) ) ( not ( = ?auto_12849 ?auto_12853 ) ) ( not ( = ?auto_12849 ?auto_12854 ) ) ( not ( = ?auto_12849 ?auto_12855 ) ) ( not ( = ?auto_12850 ?auto_12851 ) ) ( not ( = ?auto_12850 ?auto_12852 ) ) ( not ( = ?auto_12850 ?auto_12853 ) ) ( not ( = ?auto_12850 ?auto_12854 ) ) ( not ( = ?auto_12850 ?auto_12855 ) ) ( not ( = ?auto_12851 ?auto_12852 ) ) ( not ( = ?auto_12851 ?auto_12853 ) ) ( not ( = ?auto_12851 ?auto_12854 ) ) ( not ( = ?auto_12851 ?auto_12855 ) ) ( not ( = ?auto_12852 ?auto_12853 ) ) ( not ( = ?auto_12852 ?auto_12854 ) ) ( not ( = ?auto_12852 ?auto_12855 ) ) ( not ( = ?auto_12853 ?auto_12854 ) ) ( not ( = ?auto_12853 ?auto_12855 ) ) ( not ( = ?auto_12854 ?auto_12855 ) ) ( ON ?auto_12853 ?auto_12854 ) ( ON ?auto_12852 ?auto_12853 ) ( CLEAR ?auto_12850 ) ( ON ?auto_12851 ?auto_12852 ) ( CLEAR ?auto_12851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12849 ?auto_12850 ?auto_12851 )
      ( MAKE-6PILE ?auto_12849 ?auto_12850 ?auto_12851 ?auto_12852 ?auto_12853 ?auto_12854 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12862 - BLOCK
      ?auto_12863 - BLOCK
      ?auto_12864 - BLOCK
      ?auto_12865 - BLOCK
      ?auto_12866 - BLOCK
      ?auto_12867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12867 ) ( ON-TABLE ?auto_12862 ) ( ON ?auto_12863 ?auto_12862 ) ( not ( = ?auto_12862 ?auto_12863 ) ) ( not ( = ?auto_12862 ?auto_12864 ) ) ( not ( = ?auto_12862 ?auto_12865 ) ) ( not ( = ?auto_12862 ?auto_12866 ) ) ( not ( = ?auto_12862 ?auto_12867 ) ) ( not ( = ?auto_12863 ?auto_12864 ) ) ( not ( = ?auto_12863 ?auto_12865 ) ) ( not ( = ?auto_12863 ?auto_12866 ) ) ( not ( = ?auto_12863 ?auto_12867 ) ) ( not ( = ?auto_12864 ?auto_12865 ) ) ( not ( = ?auto_12864 ?auto_12866 ) ) ( not ( = ?auto_12864 ?auto_12867 ) ) ( not ( = ?auto_12865 ?auto_12866 ) ) ( not ( = ?auto_12865 ?auto_12867 ) ) ( not ( = ?auto_12866 ?auto_12867 ) ) ( ON ?auto_12866 ?auto_12867 ) ( ON ?auto_12865 ?auto_12866 ) ( CLEAR ?auto_12863 ) ( ON ?auto_12864 ?auto_12865 ) ( CLEAR ?auto_12864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_12862 ?auto_12863 ?auto_12864 )
      ( MAKE-6PILE ?auto_12862 ?auto_12863 ?auto_12864 ?auto_12865 ?auto_12866 ?auto_12867 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12874 - BLOCK
      ?auto_12875 - BLOCK
      ?auto_12876 - BLOCK
      ?auto_12877 - BLOCK
      ?auto_12878 - BLOCK
      ?auto_12879 - BLOCK
    )
    :vars
    (
      ?auto_12880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12879 ?auto_12880 ) ( ON-TABLE ?auto_12874 ) ( not ( = ?auto_12874 ?auto_12875 ) ) ( not ( = ?auto_12874 ?auto_12876 ) ) ( not ( = ?auto_12874 ?auto_12877 ) ) ( not ( = ?auto_12874 ?auto_12878 ) ) ( not ( = ?auto_12874 ?auto_12879 ) ) ( not ( = ?auto_12874 ?auto_12880 ) ) ( not ( = ?auto_12875 ?auto_12876 ) ) ( not ( = ?auto_12875 ?auto_12877 ) ) ( not ( = ?auto_12875 ?auto_12878 ) ) ( not ( = ?auto_12875 ?auto_12879 ) ) ( not ( = ?auto_12875 ?auto_12880 ) ) ( not ( = ?auto_12876 ?auto_12877 ) ) ( not ( = ?auto_12876 ?auto_12878 ) ) ( not ( = ?auto_12876 ?auto_12879 ) ) ( not ( = ?auto_12876 ?auto_12880 ) ) ( not ( = ?auto_12877 ?auto_12878 ) ) ( not ( = ?auto_12877 ?auto_12879 ) ) ( not ( = ?auto_12877 ?auto_12880 ) ) ( not ( = ?auto_12878 ?auto_12879 ) ) ( not ( = ?auto_12878 ?auto_12880 ) ) ( not ( = ?auto_12879 ?auto_12880 ) ) ( ON ?auto_12878 ?auto_12879 ) ( ON ?auto_12877 ?auto_12878 ) ( ON ?auto_12876 ?auto_12877 ) ( CLEAR ?auto_12874 ) ( ON ?auto_12875 ?auto_12876 ) ( CLEAR ?auto_12875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12874 ?auto_12875 )
      ( MAKE-6PILE ?auto_12874 ?auto_12875 ?auto_12876 ?auto_12877 ?auto_12878 ?auto_12879 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12887 - BLOCK
      ?auto_12888 - BLOCK
      ?auto_12889 - BLOCK
      ?auto_12890 - BLOCK
      ?auto_12891 - BLOCK
      ?auto_12892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12892 ) ( ON-TABLE ?auto_12887 ) ( not ( = ?auto_12887 ?auto_12888 ) ) ( not ( = ?auto_12887 ?auto_12889 ) ) ( not ( = ?auto_12887 ?auto_12890 ) ) ( not ( = ?auto_12887 ?auto_12891 ) ) ( not ( = ?auto_12887 ?auto_12892 ) ) ( not ( = ?auto_12888 ?auto_12889 ) ) ( not ( = ?auto_12888 ?auto_12890 ) ) ( not ( = ?auto_12888 ?auto_12891 ) ) ( not ( = ?auto_12888 ?auto_12892 ) ) ( not ( = ?auto_12889 ?auto_12890 ) ) ( not ( = ?auto_12889 ?auto_12891 ) ) ( not ( = ?auto_12889 ?auto_12892 ) ) ( not ( = ?auto_12890 ?auto_12891 ) ) ( not ( = ?auto_12890 ?auto_12892 ) ) ( not ( = ?auto_12891 ?auto_12892 ) ) ( ON ?auto_12891 ?auto_12892 ) ( ON ?auto_12890 ?auto_12891 ) ( ON ?auto_12889 ?auto_12890 ) ( CLEAR ?auto_12887 ) ( ON ?auto_12888 ?auto_12889 ) ( CLEAR ?auto_12888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_12887 ?auto_12888 )
      ( MAKE-6PILE ?auto_12887 ?auto_12888 ?auto_12889 ?auto_12890 ?auto_12891 ?auto_12892 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12899 - BLOCK
      ?auto_12900 - BLOCK
      ?auto_12901 - BLOCK
      ?auto_12902 - BLOCK
      ?auto_12903 - BLOCK
      ?auto_12904 - BLOCK
    )
    :vars
    (
      ?auto_12905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_12904 ?auto_12905 ) ( not ( = ?auto_12899 ?auto_12900 ) ) ( not ( = ?auto_12899 ?auto_12901 ) ) ( not ( = ?auto_12899 ?auto_12902 ) ) ( not ( = ?auto_12899 ?auto_12903 ) ) ( not ( = ?auto_12899 ?auto_12904 ) ) ( not ( = ?auto_12899 ?auto_12905 ) ) ( not ( = ?auto_12900 ?auto_12901 ) ) ( not ( = ?auto_12900 ?auto_12902 ) ) ( not ( = ?auto_12900 ?auto_12903 ) ) ( not ( = ?auto_12900 ?auto_12904 ) ) ( not ( = ?auto_12900 ?auto_12905 ) ) ( not ( = ?auto_12901 ?auto_12902 ) ) ( not ( = ?auto_12901 ?auto_12903 ) ) ( not ( = ?auto_12901 ?auto_12904 ) ) ( not ( = ?auto_12901 ?auto_12905 ) ) ( not ( = ?auto_12902 ?auto_12903 ) ) ( not ( = ?auto_12902 ?auto_12904 ) ) ( not ( = ?auto_12902 ?auto_12905 ) ) ( not ( = ?auto_12903 ?auto_12904 ) ) ( not ( = ?auto_12903 ?auto_12905 ) ) ( not ( = ?auto_12904 ?auto_12905 ) ) ( ON ?auto_12903 ?auto_12904 ) ( ON ?auto_12902 ?auto_12903 ) ( ON ?auto_12901 ?auto_12902 ) ( ON ?auto_12900 ?auto_12901 ) ( ON ?auto_12899 ?auto_12900 ) ( CLEAR ?auto_12899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12899 )
      ( MAKE-6PILE ?auto_12899 ?auto_12900 ?auto_12901 ?auto_12902 ?auto_12903 ?auto_12904 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12912 - BLOCK
      ?auto_12913 - BLOCK
      ?auto_12914 - BLOCK
      ?auto_12915 - BLOCK
      ?auto_12916 - BLOCK
      ?auto_12917 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_12917 ) ( not ( = ?auto_12912 ?auto_12913 ) ) ( not ( = ?auto_12912 ?auto_12914 ) ) ( not ( = ?auto_12912 ?auto_12915 ) ) ( not ( = ?auto_12912 ?auto_12916 ) ) ( not ( = ?auto_12912 ?auto_12917 ) ) ( not ( = ?auto_12913 ?auto_12914 ) ) ( not ( = ?auto_12913 ?auto_12915 ) ) ( not ( = ?auto_12913 ?auto_12916 ) ) ( not ( = ?auto_12913 ?auto_12917 ) ) ( not ( = ?auto_12914 ?auto_12915 ) ) ( not ( = ?auto_12914 ?auto_12916 ) ) ( not ( = ?auto_12914 ?auto_12917 ) ) ( not ( = ?auto_12915 ?auto_12916 ) ) ( not ( = ?auto_12915 ?auto_12917 ) ) ( not ( = ?auto_12916 ?auto_12917 ) ) ( ON ?auto_12916 ?auto_12917 ) ( ON ?auto_12915 ?auto_12916 ) ( ON ?auto_12914 ?auto_12915 ) ( ON ?auto_12913 ?auto_12914 ) ( ON ?auto_12912 ?auto_12913 ) ( CLEAR ?auto_12912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_12912 )
      ( MAKE-6PILE ?auto_12912 ?auto_12913 ?auto_12914 ?auto_12915 ?auto_12916 ?auto_12917 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_12924 - BLOCK
      ?auto_12925 - BLOCK
      ?auto_12926 - BLOCK
      ?auto_12927 - BLOCK
      ?auto_12928 - BLOCK
      ?auto_12929 - BLOCK
    )
    :vars
    (
      ?auto_12930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_12924 ?auto_12925 ) ) ( not ( = ?auto_12924 ?auto_12926 ) ) ( not ( = ?auto_12924 ?auto_12927 ) ) ( not ( = ?auto_12924 ?auto_12928 ) ) ( not ( = ?auto_12924 ?auto_12929 ) ) ( not ( = ?auto_12925 ?auto_12926 ) ) ( not ( = ?auto_12925 ?auto_12927 ) ) ( not ( = ?auto_12925 ?auto_12928 ) ) ( not ( = ?auto_12925 ?auto_12929 ) ) ( not ( = ?auto_12926 ?auto_12927 ) ) ( not ( = ?auto_12926 ?auto_12928 ) ) ( not ( = ?auto_12926 ?auto_12929 ) ) ( not ( = ?auto_12927 ?auto_12928 ) ) ( not ( = ?auto_12927 ?auto_12929 ) ) ( not ( = ?auto_12928 ?auto_12929 ) ) ( ON ?auto_12924 ?auto_12930 ) ( not ( = ?auto_12929 ?auto_12930 ) ) ( not ( = ?auto_12928 ?auto_12930 ) ) ( not ( = ?auto_12927 ?auto_12930 ) ) ( not ( = ?auto_12926 ?auto_12930 ) ) ( not ( = ?auto_12925 ?auto_12930 ) ) ( not ( = ?auto_12924 ?auto_12930 ) ) ( ON ?auto_12925 ?auto_12924 ) ( ON ?auto_12926 ?auto_12925 ) ( ON ?auto_12927 ?auto_12926 ) ( ON ?auto_12928 ?auto_12927 ) ( ON ?auto_12929 ?auto_12928 ) ( CLEAR ?auto_12929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_12929 ?auto_12928 ?auto_12927 ?auto_12926 ?auto_12925 ?auto_12924 )
      ( MAKE-6PILE ?auto_12924 ?auto_12925 ?auto_12926 ?auto_12927 ?auto_12928 ?auto_12929 ) )
  )

)

