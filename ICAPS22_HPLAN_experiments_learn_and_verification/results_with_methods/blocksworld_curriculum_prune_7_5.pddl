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
      ?auto_21421 - BLOCK
    )
    :vars
    (
      ?auto_21422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21421 ?auto_21422 ) ( CLEAR ?auto_21421 ) ( HAND-EMPTY ) ( not ( = ?auto_21421 ?auto_21422 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21421 ?auto_21422 )
      ( !PUTDOWN ?auto_21421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21428 - BLOCK
      ?auto_21429 - BLOCK
    )
    :vars
    (
      ?auto_21430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21428 ) ( ON ?auto_21429 ?auto_21430 ) ( CLEAR ?auto_21429 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21428 ) ( not ( = ?auto_21428 ?auto_21429 ) ) ( not ( = ?auto_21428 ?auto_21430 ) ) ( not ( = ?auto_21429 ?auto_21430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21429 ?auto_21430 )
      ( !STACK ?auto_21429 ?auto_21428 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_21438 - BLOCK
      ?auto_21439 - BLOCK
    )
    :vars
    (
      ?auto_21440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21439 ?auto_21440 ) ( not ( = ?auto_21438 ?auto_21439 ) ) ( not ( = ?auto_21438 ?auto_21440 ) ) ( not ( = ?auto_21439 ?auto_21440 ) ) ( ON ?auto_21438 ?auto_21439 ) ( CLEAR ?auto_21438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21438 )
      ( MAKE-2PILE ?auto_21438 ?auto_21439 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21449 - BLOCK
      ?auto_21450 - BLOCK
      ?auto_21451 - BLOCK
    )
    :vars
    (
      ?auto_21452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21450 ) ( ON ?auto_21451 ?auto_21452 ) ( CLEAR ?auto_21451 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21449 ) ( ON ?auto_21450 ?auto_21449 ) ( not ( = ?auto_21449 ?auto_21450 ) ) ( not ( = ?auto_21449 ?auto_21451 ) ) ( not ( = ?auto_21449 ?auto_21452 ) ) ( not ( = ?auto_21450 ?auto_21451 ) ) ( not ( = ?auto_21450 ?auto_21452 ) ) ( not ( = ?auto_21451 ?auto_21452 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21451 ?auto_21452 )
      ( !STACK ?auto_21451 ?auto_21450 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21463 - BLOCK
      ?auto_21464 - BLOCK
      ?auto_21465 - BLOCK
    )
    :vars
    (
      ?auto_21466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21465 ?auto_21466 ) ( ON-TABLE ?auto_21463 ) ( not ( = ?auto_21463 ?auto_21464 ) ) ( not ( = ?auto_21463 ?auto_21465 ) ) ( not ( = ?auto_21463 ?auto_21466 ) ) ( not ( = ?auto_21464 ?auto_21465 ) ) ( not ( = ?auto_21464 ?auto_21466 ) ) ( not ( = ?auto_21465 ?auto_21466 ) ) ( CLEAR ?auto_21463 ) ( ON ?auto_21464 ?auto_21465 ) ( CLEAR ?auto_21464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21463 ?auto_21464 )
      ( MAKE-3PILE ?auto_21463 ?auto_21464 ?auto_21465 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_21477 - BLOCK
      ?auto_21478 - BLOCK
      ?auto_21479 - BLOCK
    )
    :vars
    (
      ?auto_21480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21479 ?auto_21480 ) ( not ( = ?auto_21477 ?auto_21478 ) ) ( not ( = ?auto_21477 ?auto_21479 ) ) ( not ( = ?auto_21477 ?auto_21480 ) ) ( not ( = ?auto_21478 ?auto_21479 ) ) ( not ( = ?auto_21478 ?auto_21480 ) ) ( not ( = ?auto_21479 ?auto_21480 ) ) ( ON ?auto_21478 ?auto_21479 ) ( ON ?auto_21477 ?auto_21478 ) ( CLEAR ?auto_21477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21477 )
      ( MAKE-3PILE ?auto_21477 ?auto_21478 ?auto_21479 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21492 - BLOCK
      ?auto_21493 - BLOCK
      ?auto_21494 - BLOCK
      ?auto_21495 - BLOCK
    )
    :vars
    (
      ?auto_21496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21494 ) ( ON ?auto_21495 ?auto_21496 ) ( CLEAR ?auto_21495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21492 ) ( ON ?auto_21493 ?auto_21492 ) ( ON ?auto_21494 ?auto_21493 ) ( not ( = ?auto_21492 ?auto_21493 ) ) ( not ( = ?auto_21492 ?auto_21494 ) ) ( not ( = ?auto_21492 ?auto_21495 ) ) ( not ( = ?auto_21492 ?auto_21496 ) ) ( not ( = ?auto_21493 ?auto_21494 ) ) ( not ( = ?auto_21493 ?auto_21495 ) ) ( not ( = ?auto_21493 ?auto_21496 ) ) ( not ( = ?auto_21494 ?auto_21495 ) ) ( not ( = ?auto_21494 ?auto_21496 ) ) ( not ( = ?auto_21495 ?auto_21496 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21495 ?auto_21496 )
      ( !STACK ?auto_21495 ?auto_21494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21510 - BLOCK
      ?auto_21511 - BLOCK
      ?auto_21512 - BLOCK
      ?auto_21513 - BLOCK
    )
    :vars
    (
      ?auto_21514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21513 ?auto_21514 ) ( ON-TABLE ?auto_21510 ) ( ON ?auto_21511 ?auto_21510 ) ( not ( = ?auto_21510 ?auto_21511 ) ) ( not ( = ?auto_21510 ?auto_21512 ) ) ( not ( = ?auto_21510 ?auto_21513 ) ) ( not ( = ?auto_21510 ?auto_21514 ) ) ( not ( = ?auto_21511 ?auto_21512 ) ) ( not ( = ?auto_21511 ?auto_21513 ) ) ( not ( = ?auto_21511 ?auto_21514 ) ) ( not ( = ?auto_21512 ?auto_21513 ) ) ( not ( = ?auto_21512 ?auto_21514 ) ) ( not ( = ?auto_21513 ?auto_21514 ) ) ( CLEAR ?auto_21511 ) ( ON ?auto_21512 ?auto_21513 ) ( CLEAR ?auto_21512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21510 ?auto_21511 ?auto_21512 )
      ( MAKE-4PILE ?auto_21510 ?auto_21511 ?auto_21512 ?auto_21513 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21528 - BLOCK
      ?auto_21529 - BLOCK
      ?auto_21530 - BLOCK
      ?auto_21531 - BLOCK
    )
    :vars
    (
      ?auto_21532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21531 ?auto_21532 ) ( ON-TABLE ?auto_21528 ) ( not ( = ?auto_21528 ?auto_21529 ) ) ( not ( = ?auto_21528 ?auto_21530 ) ) ( not ( = ?auto_21528 ?auto_21531 ) ) ( not ( = ?auto_21528 ?auto_21532 ) ) ( not ( = ?auto_21529 ?auto_21530 ) ) ( not ( = ?auto_21529 ?auto_21531 ) ) ( not ( = ?auto_21529 ?auto_21532 ) ) ( not ( = ?auto_21530 ?auto_21531 ) ) ( not ( = ?auto_21530 ?auto_21532 ) ) ( not ( = ?auto_21531 ?auto_21532 ) ) ( ON ?auto_21530 ?auto_21531 ) ( CLEAR ?auto_21528 ) ( ON ?auto_21529 ?auto_21530 ) ( CLEAR ?auto_21529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21528 ?auto_21529 )
      ( MAKE-4PILE ?auto_21528 ?auto_21529 ?auto_21530 ?auto_21531 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_21546 - BLOCK
      ?auto_21547 - BLOCK
      ?auto_21548 - BLOCK
      ?auto_21549 - BLOCK
    )
    :vars
    (
      ?auto_21550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21549 ?auto_21550 ) ( not ( = ?auto_21546 ?auto_21547 ) ) ( not ( = ?auto_21546 ?auto_21548 ) ) ( not ( = ?auto_21546 ?auto_21549 ) ) ( not ( = ?auto_21546 ?auto_21550 ) ) ( not ( = ?auto_21547 ?auto_21548 ) ) ( not ( = ?auto_21547 ?auto_21549 ) ) ( not ( = ?auto_21547 ?auto_21550 ) ) ( not ( = ?auto_21548 ?auto_21549 ) ) ( not ( = ?auto_21548 ?auto_21550 ) ) ( not ( = ?auto_21549 ?auto_21550 ) ) ( ON ?auto_21548 ?auto_21549 ) ( ON ?auto_21547 ?auto_21548 ) ( ON ?auto_21546 ?auto_21547 ) ( CLEAR ?auto_21546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21546 )
      ( MAKE-4PILE ?auto_21546 ?auto_21547 ?auto_21548 ?auto_21549 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21565 - BLOCK
      ?auto_21566 - BLOCK
      ?auto_21567 - BLOCK
      ?auto_21568 - BLOCK
      ?auto_21569 - BLOCK
    )
    :vars
    (
      ?auto_21570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21568 ) ( ON ?auto_21569 ?auto_21570 ) ( CLEAR ?auto_21569 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21565 ) ( ON ?auto_21566 ?auto_21565 ) ( ON ?auto_21567 ?auto_21566 ) ( ON ?auto_21568 ?auto_21567 ) ( not ( = ?auto_21565 ?auto_21566 ) ) ( not ( = ?auto_21565 ?auto_21567 ) ) ( not ( = ?auto_21565 ?auto_21568 ) ) ( not ( = ?auto_21565 ?auto_21569 ) ) ( not ( = ?auto_21565 ?auto_21570 ) ) ( not ( = ?auto_21566 ?auto_21567 ) ) ( not ( = ?auto_21566 ?auto_21568 ) ) ( not ( = ?auto_21566 ?auto_21569 ) ) ( not ( = ?auto_21566 ?auto_21570 ) ) ( not ( = ?auto_21567 ?auto_21568 ) ) ( not ( = ?auto_21567 ?auto_21569 ) ) ( not ( = ?auto_21567 ?auto_21570 ) ) ( not ( = ?auto_21568 ?auto_21569 ) ) ( not ( = ?auto_21568 ?auto_21570 ) ) ( not ( = ?auto_21569 ?auto_21570 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21569 ?auto_21570 )
      ( !STACK ?auto_21569 ?auto_21568 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21587 - BLOCK
      ?auto_21588 - BLOCK
      ?auto_21589 - BLOCK
      ?auto_21590 - BLOCK
      ?auto_21591 - BLOCK
    )
    :vars
    (
      ?auto_21592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21591 ?auto_21592 ) ( ON-TABLE ?auto_21587 ) ( ON ?auto_21588 ?auto_21587 ) ( ON ?auto_21589 ?auto_21588 ) ( not ( = ?auto_21587 ?auto_21588 ) ) ( not ( = ?auto_21587 ?auto_21589 ) ) ( not ( = ?auto_21587 ?auto_21590 ) ) ( not ( = ?auto_21587 ?auto_21591 ) ) ( not ( = ?auto_21587 ?auto_21592 ) ) ( not ( = ?auto_21588 ?auto_21589 ) ) ( not ( = ?auto_21588 ?auto_21590 ) ) ( not ( = ?auto_21588 ?auto_21591 ) ) ( not ( = ?auto_21588 ?auto_21592 ) ) ( not ( = ?auto_21589 ?auto_21590 ) ) ( not ( = ?auto_21589 ?auto_21591 ) ) ( not ( = ?auto_21589 ?auto_21592 ) ) ( not ( = ?auto_21590 ?auto_21591 ) ) ( not ( = ?auto_21590 ?auto_21592 ) ) ( not ( = ?auto_21591 ?auto_21592 ) ) ( CLEAR ?auto_21589 ) ( ON ?auto_21590 ?auto_21591 ) ( CLEAR ?auto_21590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21587 ?auto_21588 ?auto_21589 ?auto_21590 )
      ( MAKE-5PILE ?auto_21587 ?auto_21588 ?auto_21589 ?auto_21590 ?auto_21591 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21609 - BLOCK
      ?auto_21610 - BLOCK
      ?auto_21611 - BLOCK
      ?auto_21612 - BLOCK
      ?auto_21613 - BLOCK
    )
    :vars
    (
      ?auto_21614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21613 ?auto_21614 ) ( ON-TABLE ?auto_21609 ) ( ON ?auto_21610 ?auto_21609 ) ( not ( = ?auto_21609 ?auto_21610 ) ) ( not ( = ?auto_21609 ?auto_21611 ) ) ( not ( = ?auto_21609 ?auto_21612 ) ) ( not ( = ?auto_21609 ?auto_21613 ) ) ( not ( = ?auto_21609 ?auto_21614 ) ) ( not ( = ?auto_21610 ?auto_21611 ) ) ( not ( = ?auto_21610 ?auto_21612 ) ) ( not ( = ?auto_21610 ?auto_21613 ) ) ( not ( = ?auto_21610 ?auto_21614 ) ) ( not ( = ?auto_21611 ?auto_21612 ) ) ( not ( = ?auto_21611 ?auto_21613 ) ) ( not ( = ?auto_21611 ?auto_21614 ) ) ( not ( = ?auto_21612 ?auto_21613 ) ) ( not ( = ?auto_21612 ?auto_21614 ) ) ( not ( = ?auto_21613 ?auto_21614 ) ) ( ON ?auto_21612 ?auto_21613 ) ( CLEAR ?auto_21610 ) ( ON ?auto_21611 ?auto_21612 ) ( CLEAR ?auto_21611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21609 ?auto_21610 ?auto_21611 )
      ( MAKE-5PILE ?auto_21609 ?auto_21610 ?auto_21611 ?auto_21612 ?auto_21613 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21631 - BLOCK
      ?auto_21632 - BLOCK
      ?auto_21633 - BLOCK
      ?auto_21634 - BLOCK
      ?auto_21635 - BLOCK
    )
    :vars
    (
      ?auto_21636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21635 ?auto_21636 ) ( ON-TABLE ?auto_21631 ) ( not ( = ?auto_21631 ?auto_21632 ) ) ( not ( = ?auto_21631 ?auto_21633 ) ) ( not ( = ?auto_21631 ?auto_21634 ) ) ( not ( = ?auto_21631 ?auto_21635 ) ) ( not ( = ?auto_21631 ?auto_21636 ) ) ( not ( = ?auto_21632 ?auto_21633 ) ) ( not ( = ?auto_21632 ?auto_21634 ) ) ( not ( = ?auto_21632 ?auto_21635 ) ) ( not ( = ?auto_21632 ?auto_21636 ) ) ( not ( = ?auto_21633 ?auto_21634 ) ) ( not ( = ?auto_21633 ?auto_21635 ) ) ( not ( = ?auto_21633 ?auto_21636 ) ) ( not ( = ?auto_21634 ?auto_21635 ) ) ( not ( = ?auto_21634 ?auto_21636 ) ) ( not ( = ?auto_21635 ?auto_21636 ) ) ( ON ?auto_21634 ?auto_21635 ) ( ON ?auto_21633 ?auto_21634 ) ( CLEAR ?auto_21631 ) ( ON ?auto_21632 ?auto_21633 ) ( CLEAR ?auto_21632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21631 ?auto_21632 )
      ( MAKE-5PILE ?auto_21631 ?auto_21632 ?auto_21633 ?auto_21634 ?auto_21635 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_21653 - BLOCK
      ?auto_21654 - BLOCK
      ?auto_21655 - BLOCK
      ?auto_21656 - BLOCK
      ?auto_21657 - BLOCK
    )
    :vars
    (
      ?auto_21658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21657 ?auto_21658 ) ( not ( = ?auto_21653 ?auto_21654 ) ) ( not ( = ?auto_21653 ?auto_21655 ) ) ( not ( = ?auto_21653 ?auto_21656 ) ) ( not ( = ?auto_21653 ?auto_21657 ) ) ( not ( = ?auto_21653 ?auto_21658 ) ) ( not ( = ?auto_21654 ?auto_21655 ) ) ( not ( = ?auto_21654 ?auto_21656 ) ) ( not ( = ?auto_21654 ?auto_21657 ) ) ( not ( = ?auto_21654 ?auto_21658 ) ) ( not ( = ?auto_21655 ?auto_21656 ) ) ( not ( = ?auto_21655 ?auto_21657 ) ) ( not ( = ?auto_21655 ?auto_21658 ) ) ( not ( = ?auto_21656 ?auto_21657 ) ) ( not ( = ?auto_21656 ?auto_21658 ) ) ( not ( = ?auto_21657 ?auto_21658 ) ) ( ON ?auto_21656 ?auto_21657 ) ( ON ?auto_21655 ?auto_21656 ) ( ON ?auto_21654 ?auto_21655 ) ( ON ?auto_21653 ?auto_21654 ) ( CLEAR ?auto_21653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21653 )
      ( MAKE-5PILE ?auto_21653 ?auto_21654 ?auto_21655 ?auto_21656 ?auto_21657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21676 - BLOCK
      ?auto_21677 - BLOCK
      ?auto_21678 - BLOCK
      ?auto_21679 - BLOCK
      ?auto_21680 - BLOCK
      ?auto_21681 - BLOCK
    )
    :vars
    (
      ?auto_21682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21680 ) ( ON ?auto_21681 ?auto_21682 ) ( CLEAR ?auto_21681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21676 ) ( ON ?auto_21677 ?auto_21676 ) ( ON ?auto_21678 ?auto_21677 ) ( ON ?auto_21679 ?auto_21678 ) ( ON ?auto_21680 ?auto_21679 ) ( not ( = ?auto_21676 ?auto_21677 ) ) ( not ( = ?auto_21676 ?auto_21678 ) ) ( not ( = ?auto_21676 ?auto_21679 ) ) ( not ( = ?auto_21676 ?auto_21680 ) ) ( not ( = ?auto_21676 ?auto_21681 ) ) ( not ( = ?auto_21676 ?auto_21682 ) ) ( not ( = ?auto_21677 ?auto_21678 ) ) ( not ( = ?auto_21677 ?auto_21679 ) ) ( not ( = ?auto_21677 ?auto_21680 ) ) ( not ( = ?auto_21677 ?auto_21681 ) ) ( not ( = ?auto_21677 ?auto_21682 ) ) ( not ( = ?auto_21678 ?auto_21679 ) ) ( not ( = ?auto_21678 ?auto_21680 ) ) ( not ( = ?auto_21678 ?auto_21681 ) ) ( not ( = ?auto_21678 ?auto_21682 ) ) ( not ( = ?auto_21679 ?auto_21680 ) ) ( not ( = ?auto_21679 ?auto_21681 ) ) ( not ( = ?auto_21679 ?auto_21682 ) ) ( not ( = ?auto_21680 ?auto_21681 ) ) ( not ( = ?auto_21680 ?auto_21682 ) ) ( not ( = ?auto_21681 ?auto_21682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21681 ?auto_21682 )
      ( !STACK ?auto_21681 ?auto_21680 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21702 - BLOCK
      ?auto_21703 - BLOCK
      ?auto_21704 - BLOCK
      ?auto_21705 - BLOCK
      ?auto_21706 - BLOCK
      ?auto_21707 - BLOCK
    )
    :vars
    (
      ?auto_21708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21707 ?auto_21708 ) ( ON-TABLE ?auto_21702 ) ( ON ?auto_21703 ?auto_21702 ) ( ON ?auto_21704 ?auto_21703 ) ( ON ?auto_21705 ?auto_21704 ) ( not ( = ?auto_21702 ?auto_21703 ) ) ( not ( = ?auto_21702 ?auto_21704 ) ) ( not ( = ?auto_21702 ?auto_21705 ) ) ( not ( = ?auto_21702 ?auto_21706 ) ) ( not ( = ?auto_21702 ?auto_21707 ) ) ( not ( = ?auto_21702 ?auto_21708 ) ) ( not ( = ?auto_21703 ?auto_21704 ) ) ( not ( = ?auto_21703 ?auto_21705 ) ) ( not ( = ?auto_21703 ?auto_21706 ) ) ( not ( = ?auto_21703 ?auto_21707 ) ) ( not ( = ?auto_21703 ?auto_21708 ) ) ( not ( = ?auto_21704 ?auto_21705 ) ) ( not ( = ?auto_21704 ?auto_21706 ) ) ( not ( = ?auto_21704 ?auto_21707 ) ) ( not ( = ?auto_21704 ?auto_21708 ) ) ( not ( = ?auto_21705 ?auto_21706 ) ) ( not ( = ?auto_21705 ?auto_21707 ) ) ( not ( = ?auto_21705 ?auto_21708 ) ) ( not ( = ?auto_21706 ?auto_21707 ) ) ( not ( = ?auto_21706 ?auto_21708 ) ) ( not ( = ?auto_21707 ?auto_21708 ) ) ( CLEAR ?auto_21705 ) ( ON ?auto_21706 ?auto_21707 ) ( CLEAR ?auto_21706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21702 ?auto_21703 ?auto_21704 ?auto_21705 ?auto_21706 )
      ( MAKE-6PILE ?auto_21702 ?auto_21703 ?auto_21704 ?auto_21705 ?auto_21706 ?auto_21707 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21728 - BLOCK
      ?auto_21729 - BLOCK
      ?auto_21730 - BLOCK
      ?auto_21731 - BLOCK
      ?auto_21732 - BLOCK
      ?auto_21733 - BLOCK
    )
    :vars
    (
      ?auto_21734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21733 ?auto_21734 ) ( ON-TABLE ?auto_21728 ) ( ON ?auto_21729 ?auto_21728 ) ( ON ?auto_21730 ?auto_21729 ) ( not ( = ?auto_21728 ?auto_21729 ) ) ( not ( = ?auto_21728 ?auto_21730 ) ) ( not ( = ?auto_21728 ?auto_21731 ) ) ( not ( = ?auto_21728 ?auto_21732 ) ) ( not ( = ?auto_21728 ?auto_21733 ) ) ( not ( = ?auto_21728 ?auto_21734 ) ) ( not ( = ?auto_21729 ?auto_21730 ) ) ( not ( = ?auto_21729 ?auto_21731 ) ) ( not ( = ?auto_21729 ?auto_21732 ) ) ( not ( = ?auto_21729 ?auto_21733 ) ) ( not ( = ?auto_21729 ?auto_21734 ) ) ( not ( = ?auto_21730 ?auto_21731 ) ) ( not ( = ?auto_21730 ?auto_21732 ) ) ( not ( = ?auto_21730 ?auto_21733 ) ) ( not ( = ?auto_21730 ?auto_21734 ) ) ( not ( = ?auto_21731 ?auto_21732 ) ) ( not ( = ?auto_21731 ?auto_21733 ) ) ( not ( = ?auto_21731 ?auto_21734 ) ) ( not ( = ?auto_21732 ?auto_21733 ) ) ( not ( = ?auto_21732 ?auto_21734 ) ) ( not ( = ?auto_21733 ?auto_21734 ) ) ( ON ?auto_21732 ?auto_21733 ) ( CLEAR ?auto_21730 ) ( ON ?auto_21731 ?auto_21732 ) ( CLEAR ?auto_21731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21728 ?auto_21729 ?auto_21730 ?auto_21731 )
      ( MAKE-6PILE ?auto_21728 ?auto_21729 ?auto_21730 ?auto_21731 ?auto_21732 ?auto_21733 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21754 - BLOCK
      ?auto_21755 - BLOCK
      ?auto_21756 - BLOCK
      ?auto_21757 - BLOCK
      ?auto_21758 - BLOCK
      ?auto_21759 - BLOCK
    )
    :vars
    (
      ?auto_21760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21759 ?auto_21760 ) ( ON-TABLE ?auto_21754 ) ( ON ?auto_21755 ?auto_21754 ) ( not ( = ?auto_21754 ?auto_21755 ) ) ( not ( = ?auto_21754 ?auto_21756 ) ) ( not ( = ?auto_21754 ?auto_21757 ) ) ( not ( = ?auto_21754 ?auto_21758 ) ) ( not ( = ?auto_21754 ?auto_21759 ) ) ( not ( = ?auto_21754 ?auto_21760 ) ) ( not ( = ?auto_21755 ?auto_21756 ) ) ( not ( = ?auto_21755 ?auto_21757 ) ) ( not ( = ?auto_21755 ?auto_21758 ) ) ( not ( = ?auto_21755 ?auto_21759 ) ) ( not ( = ?auto_21755 ?auto_21760 ) ) ( not ( = ?auto_21756 ?auto_21757 ) ) ( not ( = ?auto_21756 ?auto_21758 ) ) ( not ( = ?auto_21756 ?auto_21759 ) ) ( not ( = ?auto_21756 ?auto_21760 ) ) ( not ( = ?auto_21757 ?auto_21758 ) ) ( not ( = ?auto_21757 ?auto_21759 ) ) ( not ( = ?auto_21757 ?auto_21760 ) ) ( not ( = ?auto_21758 ?auto_21759 ) ) ( not ( = ?auto_21758 ?auto_21760 ) ) ( not ( = ?auto_21759 ?auto_21760 ) ) ( ON ?auto_21758 ?auto_21759 ) ( ON ?auto_21757 ?auto_21758 ) ( CLEAR ?auto_21755 ) ( ON ?auto_21756 ?auto_21757 ) ( CLEAR ?auto_21756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21754 ?auto_21755 ?auto_21756 )
      ( MAKE-6PILE ?auto_21754 ?auto_21755 ?auto_21756 ?auto_21757 ?auto_21758 ?auto_21759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21780 - BLOCK
      ?auto_21781 - BLOCK
      ?auto_21782 - BLOCK
      ?auto_21783 - BLOCK
      ?auto_21784 - BLOCK
      ?auto_21785 - BLOCK
    )
    :vars
    (
      ?auto_21786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21785 ?auto_21786 ) ( ON-TABLE ?auto_21780 ) ( not ( = ?auto_21780 ?auto_21781 ) ) ( not ( = ?auto_21780 ?auto_21782 ) ) ( not ( = ?auto_21780 ?auto_21783 ) ) ( not ( = ?auto_21780 ?auto_21784 ) ) ( not ( = ?auto_21780 ?auto_21785 ) ) ( not ( = ?auto_21780 ?auto_21786 ) ) ( not ( = ?auto_21781 ?auto_21782 ) ) ( not ( = ?auto_21781 ?auto_21783 ) ) ( not ( = ?auto_21781 ?auto_21784 ) ) ( not ( = ?auto_21781 ?auto_21785 ) ) ( not ( = ?auto_21781 ?auto_21786 ) ) ( not ( = ?auto_21782 ?auto_21783 ) ) ( not ( = ?auto_21782 ?auto_21784 ) ) ( not ( = ?auto_21782 ?auto_21785 ) ) ( not ( = ?auto_21782 ?auto_21786 ) ) ( not ( = ?auto_21783 ?auto_21784 ) ) ( not ( = ?auto_21783 ?auto_21785 ) ) ( not ( = ?auto_21783 ?auto_21786 ) ) ( not ( = ?auto_21784 ?auto_21785 ) ) ( not ( = ?auto_21784 ?auto_21786 ) ) ( not ( = ?auto_21785 ?auto_21786 ) ) ( ON ?auto_21784 ?auto_21785 ) ( ON ?auto_21783 ?auto_21784 ) ( ON ?auto_21782 ?auto_21783 ) ( CLEAR ?auto_21780 ) ( ON ?auto_21781 ?auto_21782 ) ( CLEAR ?auto_21781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21780 ?auto_21781 )
      ( MAKE-6PILE ?auto_21780 ?auto_21781 ?auto_21782 ?auto_21783 ?auto_21784 ?auto_21785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_21806 - BLOCK
      ?auto_21807 - BLOCK
      ?auto_21808 - BLOCK
      ?auto_21809 - BLOCK
      ?auto_21810 - BLOCK
      ?auto_21811 - BLOCK
    )
    :vars
    (
      ?auto_21812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21811 ?auto_21812 ) ( not ( = ?auto_21806 ?auto_21807 ) ) ( not ( = ?auto_21806 ?auto_21808 ) ) ( not ( = ?auto_21806 ?auto_21809 ) ) ( not ( = ?auto_21806 ?auto_21810 ) ) ( not ( = ?auto_21806 ?auto_21811 ) ) ( not ( = ?auto_21806 ?auto_21812 ) ) ( not ( = ?auto_21807 ?auto_21808 ) ) ( not ( = ?auto_21807 ?auto_21809 ) ) ( not ( = ?auto_21807 ?auto_21810 ) ) ( not ( = ?auto_21807 ?auto_21811 ) ) ( not ( = ?auto_21807 ?auto_21812 ) ) ( not ( = ?auto_21808 ?auto_21809 ) ) ( not ( = ?auto_21808 ?auto_21810 ) ) ( not ( = ?auto_21808 ?auto_21811 ) ) ( not ( = ?auto_21808 ?auto_21812 ) ) ( not ( = ?auto_21809 ?auto_21810 ) ) ( not ( = ?auto_21809 ?auto_21811 ) ) ( not ( = ?auto_21809 ?auto_21812 ) ) ( not ( = ?auto_21810 ?auto_21811 ) ) ( not ( = ?auto_21810 ?auto_21812 ) ) ( not ( = ?auto_21811 ?auto_21812 ) ) ( ON ?auto_21810 ?auto_21811 ) ( ON ?auto_21809 ?auto_21810 ) ( ON ?auto_21808 ?auto_21809 ) ( ON ?auto_21807 ?auto_21808 ) ( ON ?auto_21806 ?auto_21807 ) ( CLEAR ?auto_21806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_21806 )
      ( MAKE-6PILE ?auto_21806 ?auto_21807 ?auto_21808 ?auto_21809 ?auto_21810 ?auto_21811 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21833 - BLOCK
      ?auto_21834 - BLOCK
      ?auto_21835 - BLOCK
      ?auto_21836 - BLOCK
      ?auto_21837 - BLOCK
      ?auto_21838 - BLOCK
      ?auto_21839 - BLOCK
    )
    :vars
    (
      ?auto_21840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21838 ) ( ON ?auto_21839 ?auto_21840 ) ( CLEAR ?auto_21839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21833 ) ( ON ?auto_21834 ?auto_21833 ) ( ON ?auto_21835 ?auto_21834 ) ( ON ?auto_21836 ?auto_21835 ) ( ON ?auto_21837 ?auto_21836 ) ( ON ?auto_21838 ?auto_21837 ) ( not ( = ?auto_21833 ?auto_21834 ) ) ( not ( = ?auto_21833 ?auto_21835 ) ) ( not ( = ?auto_21833 ?auto_21836 ) ) ( not ( = ?auto_21833 ?auto_21837 ) ) ( not ( = ?auto_21833 ?auto_21838 ) ) ( not ( = ?auto_21833 ?auto_21839 ) ) ( not ( = ?auto_21833 ?auto_21840 ) ) ( not ( = ?auto_21834 ?auto_21835 ) ) ( not ( = ?auto_21834 ?auto_21836 ) ) ( not ( = ?auto_21834 ?auto_21837 ) ) ( not ( = ?auto_21834 ?auto_21838 ) ) ( not ( = ?auto_21834 ?auto_21839 ) ) ( not ( = ?auto_21834 ?auto_21840 ) ) ( not ( = ?auto_21835 ?auto_21836 ) ) ( not ( = ?auto_21835 ?auto_21837 ) ) ( not ( = ?auto_21835 ?auto_21838 ) ) ( not ( = ?auto_21835 ?auto_21839 ) ) ( not ( = ?auto_21835 ?auto_21840 ) ) ( not ( = ?auto_21836 ?auto_21837 ) ) ( not ( = ?auto_21836 ?auto_21838 ) ) ( not ( = ?auto_21836 ?auto_21839 ) ) ( not ( = ?auto_21836 ?auto_21840 ) ) ( not ( = ?auto_21837 ?auto_21838 ) ) ( not ( = ?auto_21837 ?auto_21839 ) ) ( not ( = ?auto_21837 ?auto_21840 ) ) ( not ( = ?auto_21838 ?auto_21839 ) ) ( not ( = ?auto_21838 ?auto_21840 ) ) ( not ( = ?auto_21839 ?auto_21840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_21839 ?auto_21840 )
      ( !STACK ?auto_21839 ?auto_21838 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21848 - BLOCK
      ?auto_21849 - BLOCK
      ?auto_21850 - BLOCK
      ?auto_21851 - BLOCK
      ?auto_21852 - BLOCK
      ?auto_21853 - BLOCK
      ?auto_21854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_21853 ) ( ON-TABLE ?auto_21854 ) ( CLEAR ?auto_21854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_21848 ) ( ON ?auto_21849 ?auto_21848 ) ( ON ?auto_21850 ?auto_21849 ) ( ON ?auto_21851 ?auto_21850 ) ( ON ?auto_21852 ?auto_21851 ) ( ON ?auto_21853 ?auto_21852 ) ( not ( = ?auto_21848 ?auto_21849 ) ) ( not ( = ?auto_21848 ?auto_21850 ) ) ( not ( = ?auto_21848 ?auto_21851 ) ) ( not ( = ?auto_21848 ?auto_21852 ) ) ( not ( = ?auto_21848 ?auto_21853 ) ) ( not ( = ?auto_21848 ?auto_21854 ) ) ( not ( = ?auto_21849 ?auto_21850 ) ) ( not ( = ?auto_21849 ?auto_21851 ) ) ( not ( = ?auto_21849 ?auto_21852 ) ) ( not ( = ?auto_21849 ?auto_21853 ) ) ( not ( = ?auto_21849 ?auto_21854 ) ) ( not ( = ?auto_21850 ?auto_21851 ) ) ( not ( = ?auto_21850 ?auto_21852 ) ) ( not ( = ?auto_21850 ?auto_21853 ) ) ( not ( = ?auto_21850 ?auto_21854 ) ) ( not ( = ?auto_21851 ?auto_21852 ) ) ( not ( = ?auto_21851 ?auto_21853 ) ) ( not ( = ?auto_21851 ?auto_21854 ) ) ( not ( = ?auto_21852 ?auto_21853 ) ) ( not ( = ?auto_21852 ?auto_21854 ) ) ( not ( = ?auto_21853 ?auto_21854 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_21854 )
      ( !STACK ?auto_21854 ?auto_21853 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21862 - BLOCK
      ?auto_21863 - BLOCK
      ?auto_21864 - BLOCK
      ?auto_21865 - BLOCK
      ?auto_21866 - BLOCK
      ?auto_21867 - BLOCK
      ?auto_21868 - BLOCK
    )
    :vars
    (
      ?auto_21869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21868 ?auto_21869 ) ( ON-TABLE ?auto_21862 ) ( ON ?auto_21863 ?auto_21862 ) ( ON ?auto_21864 ?auto_21863 ) ( ON ?auto_21865 ?auto_21864 ) ( ON ?auto_21866 ?auto_21865 ) ( not ( = ?auto_21862 ?auto_21863 ) ) ( not ( = ?auto_21862 ?auto_21864 ) ) ( not ( = ?auto_21862 ?auto_21865 ) ) ( not ( = ?auto_21862 ?auto_21866 ) ) ( not ( = ?auto_21862 ?auto_21867 ) ) ( not ( = ?auto_21862 ?auto_21868 ) ) ( not ( = ?auto_21862 ?auto_21869 ) ) ( not ( = ?auto_21863 ?auto_21864 ) ) ( not ( = ?auto_21863 ?auto_21865 ) ) ( not ( = ?auto_21863 ?auto_21866 ) ) ( not ( = ?auto_21863 ?auto_21867 ) ) ( not ( = ?auto_21863 ?auto_21868 ) ) ( not ( = ?auto_21863 ?auto_21869 ) ) ( not ( = ?auto_21864 ?auto_21865 ) ) ( not ( = ?auto_21864 ?auto_21866 ) ) ( not ( = ?auto_21864 ?auto_21867 ) ) ( not ( = ?auto_21864 ?auto_21868 ) ) ( not ( = ?auto_21864 ?auto_21869 ) ) ( not ( = ?auto_21865 ?auto_21866 ) ) ( not ( = ?auto_21865 ?auto_21867 ) ) ( not ( = ?auto_21865 ?auto_21868 ) ) ( not ( = ?auto_21865 ?auto_21869 ) ) ( not ( = ?auto_21866 ?auto_21867 ) ) ( not ( = ?auto_21866 ?auto_21868 ) ) ( not ( = ?auto_21866 ?auto_21869 ) ) ( not ( = ?auto_21867 ?auto_21868 ) ) ( not ( = ?auto_21867 ?auto_21869 ) ) ( not ( = ?auto_21868 ?auto_21869 ) ) ( CLEAR ?auto_21866 ) ( ON ?auto_21867 ?auto_21868 ) ( CLEAR ?auto_21867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_21862 ?auto_21863 ?auto_21864 ?auto_21865 ?auto_21866 ?auto_21867 )
      ( MAKE-7PILE ?auto_21862 ?auto_21863 ?auto_21864 ?auto_21865 ?auto_21866 ?auto_21867 ?auto_21868 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21877 - BLOCK
      ?auto_21878 - BLOCK
      ?auto_21879 - BLOCK
      ?auto_21880 - BLOCK
      ?auto_21881 - BLOCK
      ?auto_21882 - BLOCK
      ?auto_21883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21883 ) ( ON-TABLE ?auto_21877 ) ( ON ?auto_21878 ?auto_21877 ) ( ON ?auto_21879 ?auto_21878 ) ( ON ?auto_21880 ?auto_21879 ) ( ON ?auto_21881 ?auto_21880 ) ( not ( = ?auto_21877 ?auto_21878 ) ) ( not ( = ?auto_21877 ?auto_21879 ) ) ( not ( = ?auto_21877 ?auto_21880 ) ) ( not ( = ?auto_21877 ?auto_21881 ) ) ( not ( = ?auto_21877 ?auto_21882 ) ) ( not ( = ?auto_21877 ?auto_21883 ) ) ( not ( = ?auto_21878 ?auto_21879 ) ) ( not ( = ?auto_21878 ?auto_21880 ) ) ( not ( = ?auto_21878 ?auto_21881 ) ) ( not ( = ?auto_21878 ?auto_21882 ) ) ( not ( = ?auto_21878 ?auto_21883 ) ) ( not ( = ?auto_21879 ?auto_21880 ) ) ( not ( = ?auto_21879 ?auto_21881 ) ) ( not ( = ?auto_21879 ?auto_21882 ) ) ( not ( = ?auto_21879 ?auto_21883 ) ) ( not ( = ?auto_21880 ?auto_21881 ) ) ( not ( = ?auto_21880 ?auto_21882 ) ) ( not ( = ?auto_21880 ?auto_21883 ) ) ( not ( = ?auto_21881 ?auto_21882 ) ) ( not ( = ?auto_21881 ?auto_21883 ) ) ( not ( = ?auto_21882 ?auto_21883 ) ) ( CLEAR ?auto_21881 ) ( ON ?auto_21882 ?auto_21883 ) ( CLEAR ?auto_21882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_21877 ?auto_21878 ?auto_21879 ?auto_21880 ?auto_21881 ?auto_21882 )
      ( MAKE-7PILE ?auto_21877 ?auto_21878 ?auto_21879 ?auto_21880 ?auto_21881 ?auto_21882 ?auto_21883 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21891 - BLOCK
      ?auto_21892 - BLOCK
      ?auto_21893 - BLOCK
      ?auto_21894 - BLOCK
      ?auto_21895 - BLOCK
      ?auto_21896 - BLOCK
      ?auto_21897 - BLOCK
    )
    :vars
    (
      ?auto_21898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21897 ?auto_21898 ) ( ON-TABLE ?auto_21891 ) ( ON ?auto_21892 ?auto_21891 ) ( ON ?auto_21893 ?auto_21892 ) ( ON ?auto_21894 ?auto_21893 ) ( not ( = ?auto_21891 ?auto_21892 ) ) ( not ( = ?auto_21891 ?auto_21893 ) ) ( not ( = ?auto_21891 ?auto_21894 ) ) ( not ( = ?auto_21891 ?auto_21895 ) ) ( not ( = ?auto_21891 ?auto_21896 ) ) ( not ( = ?auto_21891 ?auto_21897 ) ) ( not ( = ?auto_21891 ?auto_21898 ) ) ( not ( = ?auto_21892 ?auto_21893 ) ) ( not ( = ?auto_21892 ?auto_21894 ) ) ( not ( = ?auto_21892 ?auto_21895 ) ) ( not ( = ?auto_21892 ?auto_21896 ) ) ( not ( = ?auto_21892 ?auto_21897 ) ) ( not ( = ?auto_21892 ?auto_21898 ) ) ( not ( = ?auto_21893 ?auto_21894 ) ) ( not ( = ?auto_21893 ?auto_21895 ) ) ( not ( = ?auto_21893 ?auto_21896 ) ) ( not ( = ?auto_21893 ?auto_21897 ) ) ( not ( = ?auto_21893 ?auto_21898 ) ) ( not ( = ?auto_21894 ?auto_21895 ) ) ( not ( = ?auto_21894 ?auto_21896 ) ) ( not ( = ?auto_21894 ?auto_21897 ) ) ( not ( = ?auto_21894 ?auto_21898 ) ) ( not ( = ?auto_21895 ?auto_21896 ) ) ( not ( = ?auto_21895 ?auto_21897 ) ) ( not ( = ?auto_21895 ?auto_21898 ) ) ( not ( = ?auto_21896 ?auto_21897 ) ) ( not ( = ?auto_21896 ?auto_21898 ) ) ( not ( = ?auto_21897 ?auto_21898 ) ) ( ON ?auto_21896 ?auto_21897 ) ( CLEAR ?auto_21894 ) ( ON ?auto_21895 ?auto_21896 ) ( CLEAR ?auto_21895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21891 ?auto_21892 ?auto_21893 ?auto_21894 ?auto_21895 )
      ( MAKE-7PILE ?auto_21891 ?auto_21892 ?auto_21893 ?auto_21894 ?auto_21895 ?auto_21896 ?auto_21897 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21906 - BLOCK
      ?auto_21907 - BLOCK
      ?auto_21908 - BLOCK
      ?auto_21909 - BLOCK
      ?auto_21910 - BLOCK
      ?auto_21911 - BLOCK
      ?auto_21912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21912 ) ( ON-TABLE ?auto_21906 ) ( ON ?auto_21907 ?auto_21906 ) ( ON ?auto_21908 ?auto_21907 ) ( ON ?auto_21909 ?auto_21908 ) ( not ( = ?auto_21906 ?auto_21907 ) ) ( not ( = ?auto_21906 ?auto_21908 ) ) ( not ( = ?auto_21906 ?auto_21909 ) ) ( not ( = ?auto_21906 ?auto_21910 ) ) ( not ( = ?auto_21906 ?auto_21911 ) ) ( not ( = ?auto_21906 ?auto_21912 ) ) ( not ( = ?auto_21907 ?auto_21908 ) ) ( not ( = ?auto_21907 ?auto_21909 ) ) ( not ( = ?auto_21907 ?auto_21910 ) ) ( not ( = ?auto_21907 ?auto_21911 ) ) ( not ( = ?auto_21907 ?auto_21912 ) ) ( not ( = ?auto_21908 ?auto_21909 ) ) ( not ( = ?auto_21908 ?auto_21910 ) ) ( not ( = ?auto_21908 ?auto_21911 ) ) ( not ( = ?auto_21908 ?auto_21912 ) ) ( not ( = ?auto_21909 ?auto_21910 ) ) ( not ( = ?auto_21909 ?auto_21911 ) ) ( not ( = ?auto_21909 ?auto_21912 ) ) ( not ( = ?auto_21910 ?auto_21911 ) ) ( not ( = ?auto_21910 ?auto_21912 ) ) ( not ( = ?auto_21911 ?auto_21912 ) ) ( ON ?auto_21911 ?auto_21912 ) ( CLEAR ?auto_21909 ) ( ON ?auto_21910 ?auto_21911 ) ( CLEAR ?auto_21910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_21906 ?auto_21907 ?auto_21908 ?auto_21909 ?auto_21910 )
      ( MAKE-7PILE ?auto_21906 ?auto_21907 ?auto_21908 ?auto_21909 ?auto_21910 ?auto_21911 ?auto_21912 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21920 - BLOCK
      ?auto_21921 - BLOCK
      ?auto_21922 - BLOCK
      ?auto_21923 - BLOCK
      ?auto_21924 - BLOCK
      ?auto_21925 - BLOCK
      ?auto_21926 - BLOCK
    )
    :vars
    (
      ?auto_21927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21926 ?auto_21927 ) ( ON-TABLE ?auto_21920 ) ( ON ?auto_21921 ?auto_21920 ) ( ON ?auto_21922 ?auto_21921 ) ( not ( = ?auto_21920 ?auto_21921 ) ) ( not ( = ?auto_21920 ?auto_21922 ) ) ( not ( = ?auto_21920 ?auto_21923 ) ) ( not ( = ?auto_21920 ?auto_21924 ) ) ( not ( = ?auto_21920 ?auto_21925 ) ) ( not ( = ?auto_21920 ?auto_21926 ) ) ( not ( = ?auto_21920 ?auto_21927 ) ) ( not ( = ?auto_21921 ?auto_21922 ) ) ( not ( = ?auto_21921 ?auto_21923 ) ) ( not ( = ?auto_21921 ?auto_21924 ) ) ( not ( = ?auto_21921 ?auto_21925 ) ) ( not ( = ?auto_21921 ?auto_21926 ) ) ( not ( = ?auto_21921 ?auto_21927 ) ) ( not ( = ?auto_21922 ?auto_21923 ) ) ( not ( = ?auto_21922 ?auto_21924 ) ) ( not ( = ?auto_21922 ?auto_21925 ) ) ( not ( = ?auto_21922 ?auto_21926 ) ) ( not ( = ?auto_21922 ?auto_21927 ) ) ( not ( = ?auto_21923 ?auto_21924 ) ) ( not ( = ?auto_21923 ?auto_21925 ) ) ( not ( = ?auto_21923 ?auto_21926 ) ) ( not ( = ?auto_21923 ?auto_21927 ) ) ( not ( = ?auto_21924 ?auto_21925 ) ) ( not ( = ?auto_21924 ?auto_21926 ) ) ( not ( = ?auto_21924 ?auto_21927 ) ) ( not ( = ?auto_21925 ?auto_21926 ) ) ( not ( = ?auto_21925 ?auto_21927 ) ) ( not ( = ?auto_21926 ?auto_21927 ) ) ( ON ?auto_21925 ?auto_21926 ) ( ON ?auto_21924 ?auto_21925 ) ( CLEAR ?auto_21922 ) ( ON ?auto_21923 ?auto_21924 ) ( CLEAR ?auto_21923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21920 ?auto_21921 ?auto_21922 ?auto_21923 )
      ( MAKE-7PILE ?auto_21920 ?auto_21921 ?auto_21922 ?auto_21923 ?auto_21924 ?auto_21925 ?auto_21926 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21935 - BLOCK
      ?auto_21936 - BLOCK
      ?auto_21937 - BLOCK
      ?auto_21938 - BLOCK
      ?auto_21939 - BLOCK
      ?auto_21940 - BLOCK
      ?auto_21941 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21941 ) ( ON-TABLE ?auto_21935 ) ( ON ?auto_21936 ?auto_21935 ) ( ON ?auto_21937 ?auto_21936 ) ( not ( = ?auto_21935 ?auto_21936 ) ) ( not ( = ?auto_21935 ?auto_21937 ) ) ( not ( = ?auto_21935 ?auto_21938 ) ) ( not ( = ?auto_21935 ?auto_21939 ) ) ( not ( = ?auto_21935 ?auto_21940 ) ) ( not ( = ?auto_21935 ?auto_21941 ) ) ( not ( = ?auto_21936 ?auto_21937 ) ) ( not ( = ?auto_21936 ?auto_21938 ) ) ( not ( = ?auto_21936 ?auto_21939 ) ) ( not ( = ?auto_21936 ?auto_21940 ) ) ( not ( = ?auto_21936 ?auto_21941 ) ) ( not ( = ?auto_21937 ?auto_21938 ) ) ( not ( = ?auto_21937 ?auto_21939 ) ) ( not ( = ?auto_21937 ?auto_21940 ) ) ( not ( = ?auto_21937 ?auto_21941 ) ) ( not ( = ?auto_21938 ?auto_21939 ) ) ( not ( = ?auto_21938 ?auto_21940 ) ) ( not ( = ?auto_21938 ?auto_21941 ) ) ( not ( = ?auto_21939 ?auto_21940 ) ) ( not ( = ?auto_21939 ?auto_21941 ) ) ( not ( = ?auto_21940 ?auto_21941 ) ) ( ON ?auto_21940 ?auto_21941 ) ( ON ?auto_21939 ?auto_21940 ) ( CLEAR ?auto_21937 ) ( ON ?auto_21938 ?auto_21939 ) ( CLEAR ?auto_21938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_21935 ?auto_21936 ?auto_21937 ?auto_21938 )
      ( MAKE-7PILE ?auto_21935 ?auto_21936 ?auto_21937 ?auto_21938 ?auto_21939 ?auto_21940 ?auto_21941 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21949 - BLOCK
      ?auto_21950 - BLOCK
      ?auto_21951 - BLOCK
      ?auto_21952 - BLOCK
      ?auto_21953 - BLOCK
      ?auto_21954 - BLOCK
      ?auto_21955 - BLOCK
    )
    :vars
    (
      ?auto_21956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21955 ?auto_21956 ) ( ON-TABLE ?auto_21949 ) ( ON ?auto_21950 ?auto_21949 ) ( not ( = ?auto_21949 ?auto_21950 ) ) ( not ( = ?auto_21949 ?auto_21951 ) ) ( not ( = ?auto_21949 ?auto_21952 ) ) ( not ( = ?auto_21949 ?auto_21953 ) ) ( not ( = ?auto_21949 ?auto_21954 ) ) ( not ( = ?auto_21949 ?auto_21955 ) ) ( not ( = ?auto_21949 ?auto_21956 ) ) ( not ( = ?auto_21950 ?auto_21951 ) ) ( not ( = ?auto_21950 ?auto_21952 ) ) ( not ( = ?auto_21950 ?auto_21953 ) ) ( not ( = ?auto_21950 ?auto_21954 ) ) ( not ( = ?auto_21950 ?auto_21955 ) ) ( not ( = ?auto_21950 ?auto_21956 ) ) ( not ( = ?auto_21951 ?auto_21952 ) ) ( not ( = ?auto_21951 ?auto_21953 ) ) ( not ( = ?auto_21951 ?auto_21954 ) ) ( not ( = ?auto_21951 ?auto_21955 ) ) ( not ( = ?auto_21951 ?auto_21956 ) ) ( not ( = ?auto_21952 ?auto_21953 ) ) ( not ( = ?auto_21952 ?auto_21954 ) ) ( not ( = ?auto_21952 ?auto_21955 ) ) ( not ( = ?auto_21952 ?auto_21956 ) ) ( not ( = ?auto_21953 ?auto_21954 ) ) ( not ( = ?auto_21953 ?auto_21955 ) ) ( not ( = ?auto_21953 ?auto_21956 ) ) ( not ( = ?auto_21954 ?auto_21955 ) ) ( not ( = ?auto_21954 ?auto_21956 ) ) ( not ( = ?auto_21955 ?auto_21956 ) ) ( ON ?auto_21954 ?auto_21955 ) ( ON ?auto_21953 ?auto_21954 ) ( ON ?auto_21952 ?auto_21953 ) ( CLEAR ?auto_21950 ) ( ON ?auto_21951 ?auto_21952 ) ( CLEAR ?auto_21951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21949 ?auto_21950 ?auto_21951 )
      ( MAKE-7PILE ?auto_21949 ?auto_21950 ?auto_21951 ?auto_21952 ?auto_21953 ?auto_21954 ?auto_21955 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21964 - BLOCK
      ?auto_21965 - BLOCK
      ?auto_21966 - BLOCK
      ?auto_21967 - BLOCK
      ?auto_21968 - BLOCK
      ?auto_21969 - BLOCK
      ?auto_21970 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21970 ) ( ON-TABLE ?auto_21964 ) ( ON ?auto_21965 ?auto_21964 ) ( not ( = ?auto_21964 ?auto_21965 ) ) ( not ( = ?auto_21964 ?auto_21966 ) ) ( not ( = ?auto_21964 ?auto_21967 ) ) ( not ( = ?auto_21964 ?auto_21968 ) ) ( not ( = ?auto_21964 ?auto_21969 ) ) ( not ( = ?auto_21964 ?auto_21970 ) ) ( not ( = ?auto_21965 ?auto_21966 ) ) ( not ( = ?auto_21965 ?auto_21967 ) ) ( not ( = ?auto_21965 ?auto_21968 ) ) ( not ( = ?auto_21965 ?auto_21969 ) ) ( not ( = ?auto_21965 ?auto_21970 ) ) ( not ( = ?auto_21966 ?auto_21967 ) ) ( not ( = ?auto_21966 ?auto_21968 ) ) ( not ( = ?auto_21966 ?auto_21969 ) ) ( not ( = ?auto_21966 ?auto_21970 ) ) ( not ( = ?auto_21967 ?auto_21968 ) ) ( not ( = ?auto_21967 ?auto_21969 ) ) ( not ( = ?auto_21967 ?auto_21970 ) ) ( not ( = ?auto_21968 ?auto_21969 ) ) ( not ( = ?auto_21968 ?auto_21970 ) ) ( not ( = ?auto_21969 ?auto_21970 ) ) ( ON ?auto_21969 ?auto_21970 ) ( ON ?auto_21968 ?auto_21969 ) ( ON ?auto_21967 ?auto_21968 ) ( CLEAR ?auto_21965 ) ( ON ?auto_21966 ?auto_21967 ) ( CLEAR ?auto_21966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_21964 ?auto_21965 ?auto_21966 )
      ( MAKE-7PILE ?auto_21964 ?auto_21965 ?auto_21966 ?auto_21967 ?auto_21968 ?auto_21969 ?auto_21970 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21978 - BLOCK
      ?auto_21979 - BLOCK
      ?auto_21980 - BLOCK
      ?auto_21981 - BLOCK
      ?auto_21982 - BLOCK
      ?auto_21983 - BLOCK
      ?auto_21984 - BLOCK
    )
    :vars
    (
      ?auto_21985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_21984 ?auto_21985 ) ( ON-TABLE ?auto_21978 ) ( not ( = ?auto_21978 ?auto_21979 ) ) ( not ( = ?auto_21978 ?auto_21980 ) ) ( not ( = ?auto_21978 ?auto_21981 ) ) ( not ( = ?auto_21978 ?auto_21982 ) ) ( not ( = ?auto_21978 ?auto_21983 ) ) ( not ( = ?auto_21978 ?auto_21984 ) ) ( not ( = ?auto_21978 ?auto_21985 ) ) ( not ( = ?auto_21979 ?auto_21980 ) ) ( not ( = ?auto_21979 ?auto_21981 ) ) ( not ( = ?auto_21979 ?auto_21982 ) ) ( not ( = ?auto_21979 ?auto_21983 ) ) ( not ( = ?auto_21979 ?auto_21984 ) ) ( not ( = ?auto_21979 ?auto_21985 ) ) ( not ( = ?auto_21980 ?auto_21981 ) ) ( not ( = ?auto_21980 ?auto_21982 ) ) ( not ( = ?auto_21980 ?auto_21983 ) ) ( not ( = ?auto_21980 ?auto_21984 ) ) ( not ( = ?auto_21980 ?auto_21985 ) ) ( not ( = ?auto_21981 ?auto_21982 ) ) ( not ( = ?auto_21981 ?auto_21983 ) ) ( not ( = ?auto_21981 ?auto_21984 ) ) ( not ( = ?auto_21981 ?auto_21985 ) ) ( not ( = ?auto_21982 ?auto_21983 ) ) ( not ( = ?auto_21982 ?auto_21984 ) ) ( not ( = ?auto_21982 ?auto_21985 ) ) ( not ( = ?auto_21983 ?auto_21984 ) ) ( not ( = ?auto_21983 ?auto_21985 ) ) ( not ( = ?auto_21984 ?auto_21985 ) ) ( ON ?auto_21983 ?auto_21984 ) ( ON ?auto_21982 ?auto_21983 ) ( ON ?auto_21981 ?auto_21982 ) ( ON ?auto_21980 ?auto_21981 ) ( CLEAR ?auto_21978 ) ( ON ?auto_21979 ?auto_21980 ) ( CLEAR ?auto_21979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21978 ?auto_21979 )
      ( MAKE-7PILE ?auto_21978 ?auto_21979 ?auto_21980 ?auto_21981 ?auto_21982 ?auto_21983 ?auto_21984 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_21993 - BLOCK
      ?auto_21994 - BLOCK
      ?auto_21995 - BLOCK
      ?auto_21996 - BLOCK
      ?auto_21997 - BLOCK
      ?auto_21998 - BLOCK
      ?auto_21999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_21999 ) ( ON-TABLE ?auto_21993 ) ( not ( = ?auto_21993 ?auto_21994 ) ) ( not ( = ?auto_21993 ?auto_21995 ) ) ( not ( = ?auto_21993 ?auto_21996 ) ) ( not ( = ?auto_21993 ?auto_21997 ) ) ( not ( = ?auto_21993 ?auto_21998 ) ) ( not ( = ?auto_21993 ?auto_21999 ) ) ( not ( = ?auto_21994 ?auto_21995 ) ) ( not ( = ?auto_21994 ?auto_21996 ) ) ( not ( = ?auto_21994 ?auto_21997 ) ) ( not ( = ?auto_21994 ?auto_21998 ) ) ( not ( = ?auto_21994 ?auto_21999 ) ) ( not ( = ?auto_21995 ?auto_21996 ) ) ( not ( = ?auto_21995 ?auto_21997 ) ) ( not ( = ?auto_21995 ?auto_21998 ) ) ( not ( = ?auto_21995 ?auto_21999 ) ) ( not ( = ?auto_21996 ?auto_21997 ) ) ( not ( = ?auto_21996 ?auto_21998 ) ) ( not ( = ?auto_21996 ?auto_21999 ) ) ( not ( = ?auto_21997 ?auto_21998 ) ) ( not ( = ?auto_21997 ?auto_21999 ) ) ( not ( = ?auto_21998 ?auto_21999 ) ) ( ON ?auto_21998 ?auto_21999 ) ( ON ?auto_21997 ?auto_21998 ) ( ON ?auto_21996 ?auto_21997 ) ( ON ?auto_21995 ?auto_21996 ) ( CLEAR ?auto_21993 ) ( ON ?auto_21994 ?auto_21995 ) ( CLEAR ?auto_21994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_21993 ?auto_21994 )
      ( MAKE-7PILE ?auto_21993 ?auto_21994 ?auto_21995 ?auto_21996 ?auto_21997 ?auto_21998 ?auto_21999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22007 - BLOCK
      ?auto_22008 - BLOCK
      ?auto_22009 - BLOCK
      ?auto_22010 - BLOCK
      ?auto_22011 - BLOCK
      ?auto_22012 - BLOCK
      ?auto_22013 - BLOCK
    )
    :vars
    (
      ?auto_22014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_22013 ?auto_22014 ) ( not ( = ?auto_22007 ?auto_22008 ) ) ( not ( = ?auto_22007 ?auto_22009 ) ) ( not ( = ?auto_22007 ?auto_22010 ) ) ( not ( = ?auto_22007 ?auto_22011 ) ) ( not ( = ?auto_22007 ?auto_22012 ) ) ( not ( = ?auto_22007 ?auto_22013 ) ) ( not ( = ?auto_22007 ?auto_22014 ) ) ( not ( = ?auto_22008 ?auto_22009 ) ) ( not ( = ?auto_22008 ?auto_22010 ) ) ( not ( = ?auto_22008 ?auto_22011 ) ) ( not ( = ?auto_22008 ?auto_22012 ) ) ( not ( = ?auto_22008 ?auto_22013 ) ) ( not ( = ?auto_22008 ?auto_22014 ) ) ( not ( = ?auto_22009 ?auto_22010 ) ) ( not ( = ?auto_22009 ?auto_22011 ) ) ( not ( = ?auto_22009 ?auto_22012 ) ) ( not ( = ?auto_22009 ?auto_22013 ) ) ( not ( = ?auto_22009 ?auto_22014 ) ) ( not ( = ?auto_22010 ?auto_22011 ) ) ( not ( = ?auto_22010 ?auto_22012 ) ) ( not ( = ?auto_22010 ?auto_22013 ) ) ( not ( = ?auto_22010 ?auto_22014 ) ) ( not ( = ?auto_22011 ?auto_22012 ) ) ( not ( = ?auto_22011 ?auto_22013 ) ) ( not ( = ?auto_22011 ?auto_22014 ) ) ( not ( = ?auto_22012 ?auto_22013 ) ) ( not ( = ?auto_22012 ?auto_22014 ) ) ( not ( = ?auto_22013 ?auto_22014 ) ) ( ON ?auto_22012 ?auto_22013 ) ( ON ?auto_22011 ?auto_22012 ) ( ON ?auto_22010 ?auto_22011 ) ( ON ?auto_22009 ?auto_22010 ) ( ON ?auto_22008 ?auto_22009 ) ( ON ?auto_22007 ?auto_22008 ) ( CLEAR ?auto_22007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22007 )
      ( MAKE-7PILE ?auto_22007 ?auto_22008 ?auto_22009 ?auto_22010 ?auto_22011 ?auto_22012 ?auto_22013 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22022 - BLOCK
      ?auto_22023 - BLOCK
      ?auto_22024 - BLOCK
      ?auto_22025 - BLOCK
      ?auto_22026 - BLOCK
      ?auto_22027 - BLOCK
      ?auto_22028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_22028 ) ( not ( = ?auto_22022 ?auto_22023 ) ) ( not ( = ?auto_22022 ?auto_22024 ) ) ( not ( = ?auto_22022 ?auto_22025 ) ) ( not ( = ?auto_22022 ?auto_22026 ) ) ( not ( = ?auto_22022 ?auto_22027 ) ) ( not ( = ?auto_22022 ?auto_22028 ) ) ( not ( = ?auto_22023 ?auto_22024 ) ) ( not ( = ?auto_22023 ?auto_22025 ) ) ( not ( = ?auto_22023 ?auto_22026 ) ) ( not ( = ?auto_22023 ?auto_22027 ) ) ( not ( = ?auto_22023 ?auto_22028 ) ) ( not ( = ?auto_22024 ?auto_22025 ) ) ( not ( = ?auto_22024 ?auto_22026 ) ) ( not ( = ?auto_22024 ?auto_22027 ) ) ( not ( = ?auto_22024 ?auto_22028 ) ) ( not ( = ?auto_22025 ?auto_22026 ) ) ( not ( = ?auto_22025 ?auto_22027 ) ) ( not ( = ?auto_22025 ?auto_22028 ) ) ( not ( = ?auto_22026 ?auto_22027 ) ) ( not ( = ?auto_22026 ?auto_22028 ) ) ( not ( = ?auto_22027 ?auto_22028 ) ) ( ON ?auto_22027 ?auto_22028 ) ( ON ?auto_22026 ?auto_22027 ) ( ON ?auto_22025 ?auto_22026 ) ( ON ?auto_22024 ?auto_22025 ) ( ON ?auto_22023 ?auto_22024 ) ( ON ?auto_22022 ?auto_22023 ) ( CLEAR ?auto_22022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22022 )
      ( MAKE-7PILE ?auto_22022 ?auto_22023 ?auto_22024 ?auto_22025 ?auto_22026 ?auto_22027 ?auto_22028 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_22036 - BLOCK
      ?auto_22037 - BLOCK
      ?auto_22038 - BLOCK
      ?auto_22039 - BLOCK
      ?auto_22040 - BLOCK
      ?auto_22041 - BLOCK
      ?auto_22042 - BLOCK
    )
    :vars
    (
      ?auto_22043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_22036 ?auto_22037 ) ) ( not ( = ?auto_22036 ?auto_22038 ) ) ( not ( = ?auto_22036 ?auto_22039 ) ) ( not ( = ?auto_22036 ?auto_22040 ) ) ( not ( = ?auto_22036 ?auto_22041 ) ) ( not ( = ?auto_22036 ?auto_22042 ) ) ( not ( = ?auto_22037 ?auto_22038 ) ) ( not ( = ?auto_22037 ?auto_22039 ) ) ( not ( = ?auto_22037 ?auto_22040 ) ) ( not ( = ?auto_22037 ?auto_22041 ) ) ( not ( = ?auto_22037 ?auto_22042 ) ) ( not ( = ?auto_22038 ?auto_22039 ) ) ( not ( = ?auto_22038 ?auto_22040 ) ) ( not ( = ?auto_22038 ?auto_22041 ) ) ( not ( = ?auto_22038 ?auto_22042 ) ) ( not ( = ?auto_22039 ?auto_22040 ) ) ( not ( = ?auto_22039 ?auto_22041 ) ) ( not ( = ?auto_22039 ?auto_22042 ) ) ( not ( = ?auto_22040 ?auto_22041 ) ) ( not ( = ?auto_22040 ?auto_22042 ) ) ( not ( = ?auto_22041 ?auto_22042 ) ) ( ON ?auto_22036 ?auto_22043 ) ( not ( = ?auto_22042 ?auto_22043 ) ) ( not ( = ?auto_22041 ?auto_22043 ) ) ( not ( = ?auto_22040 ?auto_22043 ) ) ( not ( = ?auto_22039 ?auto_22043 ) ) ( not ( = ?auto_22038 ?auto_22043 ) ) ( not ( = ?auto_22037 ?auto_22043 ) ) ( not ( = ?auto_22036 ?auto_22043 ) ) ( ON ?auto_22037 ?auto_22036 ) ( ON ?auto_22038 ?auto_22037 ) ( ON ?auto_22039 ?auto_22038 ) ( ON ?auto_22040 ?auto_22039 ) ( ON ?auto_22041 ?auto_22040 ) ( ON ?auto_22042 ?auto_22041 ) ( CLEAR ?auto_22042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_22042 ?auto_22041 ?auto_22040 ?auto_22039 ?auto_22038 ?auto_22037 ?auto_22036 )
      ( MAKE-7PILE ?auto_22036 ?auto_22037 ?auto_22038 ?auto_22039 ?auto_22040 ?auto_22041 ?auto_22042 ) )
  )

)

