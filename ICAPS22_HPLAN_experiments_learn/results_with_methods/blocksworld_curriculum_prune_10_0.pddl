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
      ?auto_73521 - BLOCK
    )
    :vars
    (
      ?auto_73522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73521 ?auto_73522 ) ( CLEAR ?auto_73521 ) ( HAND-EMPTY ) ( not ( = ?auto_73521 ?auto_73522 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73521 ?auto_73522 )
      ( !PUTDOWN ?auto_73521 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73528 - BLOCK
      ?auto_73529 - BLOCK
    )
    :vars
    (
      ?auto_73530 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73528 ) ( ON ?auto_73529 ?auto_73530 ) ( CLEAR ?auto_73529 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73528 ) ( not ( = ?auto_73528 ?auto_73529 ) ) ( not ( = ?auto_73528 ?auto_73530 ) ) ( not ( = ?auto_73529 ?auto_73530 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73529 ?auto_73530 )
      ( !STACK ?auto_73529 ?auto_73528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_73538 - BLOCK
      ?auto_73539 - BLOCK
    )
    :vars
    (
      ?auto_73540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73539 ?auto_73540 ) ( not ( = ?auto_73538 ?auto_73539 ) ) ( not ( = ?auto_73538 ?auto_73540 ) ) ( not ( = ?auto_73539 ?auto_73540 ) ) ( ON ?auto_73538 ?auto_73539 ) ( CLEAR ?auto_73538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73538 )
      ( MAKE-2PILE ?auto_73538 ?auto_73539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73549 - BLOCK
      ?auto_73550 - BLOCK
      ?auto_73551 - BLOCK
    )
    :vars
    (
      ?auto_73552 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73550 ) ( ON ?auto_73551 ?auto_73552 ) ( CLEAR ?auto_73551 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73549 ) ( ON ?auto_73550 ?auto_73549 ) ( not ( = ?auto_73549 ?auto_73550 ) ) ( not ( = ?auto_73549 ?auto_73551 ) ) ( not ( = ?auto_73549 ?auto_73552 ) ) ( not ( = ?auto_73550 ?auto_73551 ) ) ( not ( = ?auto_73550 ?auto_73552 ) ) ( not ( = ?auto_73551 ?auto_73552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73551 ?auto_73552 )
      ( !STACK ?auto_73551 ?auto_73550 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73563 - BLOCK
      ?auto_73564 - BLOCK
      ?auto_73565 - BLOCK
    )
    :vars
    (
      ?auto_73566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73565 ?auto_73566 ) ( ON-TABLE ?auto_73563 ) ( not ( = ?auto_73563 ?auto_73564 ) ) ( not ( = ?auto_73563 ?auto_73565 ) ) ( not ( = ?auto_73563 ?auto_73566 ) ) ( not ( = ?auto_73564 ?auto_73565 ) ) ( not ( = ?auto_73564 ?auto_73566 ) ) ( not ( = ?auto_73565 ?auto_73566 ) ) ( CLEAR ?auto_73563 ) ( ON ?auto_73564 ?auto_73565 ) ( CLEAR ?auto_73564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73563 ?auto_73564 )
      ( MAKE-3PILE ?auto_73563 ?auto_73564 ?auto_73565 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_73577 - BLOCK
      ?auto_73578 - BLOCK
      ?auto_73579 - BLOCK
    )
    :vars
    (
      ?auto_73580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73579 ?auto_73580 ) ( not ( = ?auto_73577 ?auto_73578 ) ) ( not ( = ?auto_73577 ?auto_73579 ) ) ( not ( = ?auto_73577 ?auto_73580 ) ) ( not ( = ?auto_73578 ?auto_73579 ) ) ( not ( = ?auto_73578 ?auto_73580 ) ) ( not ( = ?auto_73579 ?auto_73580 ) ) ( ON ?auto_73578 ?auto_73579 ) ( ON ?auto_73577 ?auto_73578 ) ( CLEAR ?auto_73577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73577 )
      ( MAKE-3PILE ?auto_73577 ?auto_73578 ?auto_73579 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73592 - BLOCK
      ?auto_73593 - BLOCK
      ?auto_73594 - BLOCK
      ?auto_73595 - BLOCK
    )
    :vars
    (
      ?auto_73596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73594 ) ( ON ?auto_73595 ?auto_73596 ) ( CLEAR ?auto_73595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73592 ) ( ON ?auto_73593 ?auto_73592 ) ( ON ?auto_73594 ?auto_73593 ) ( not ( = ?auto_73592 ?auto_73593 ) ) ( not ( = ?auto_73592 ?auto_73594 ) ) ( not ( = ?auto_73592 ?auto_73595 ) ) ( not ( = ?auto_73592 ?auto_73596 ) ) ( not ( = ?auto_73593 ?auto_73594 ) ) ( not ( = ?auto_73593 ?auto_73595 ) ) ( not ( = ?auto_73593 ?auto_73596 ) ) ( not ( = ?auto_73594 ?auto_73595 ) ) ( not ( = ?auto_73594 ?auto_73596 ) ) ( not ( = ?auto_73595 ?auto_73596 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73595 ?auto_73596 )
      ( !STACK ?auto_73595 ?auto_73594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73610 - BLOCK
      ?auto_73611 - BLOCK
      ?auto_73612 - BLOCK
      ?auto_73613 - BLOCK
    )
    :vars
    (
      ?auto_73614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73613 ?auto_73614 ) ( ON-TABLE ?auto_73610 ) ( ON ?auto_73611 ?auto_73610 ) ( not ( = ?auto_73610 ?auto_73611 ) ) ( not ( = ?auto_73610 ?auto_73612 ) ) ( not ( = ?auto_73610 ?auto_73613 ) ) ( not ( = ?auto_73610 ?auto_73614 ) ) ( not ( = ?auto_73611 ?auto_73612 ) ) ( not ( = ?auto_73611 ?auto_73613 ) ) ( not ( = ?auto_73611 ?auto_73614 ) ) ( not ( = ?auto_73612 ?auto_73613 ) ) ( not ( = ?auto_73612 ?auto_73614 ) ) ( not ( = ?auto_73613 ?auto_73614 ) ) ( CLEAR ?auto_73611 ) ( ON ?auto_73612 ?auto_73613 ) ( CLEAR ?auto_73612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73610 ?auto_73611 ?auto_73612 )
      ( MAKE-4PILE ?auto_73610 ?auto_73611 ?auto_73612 ?auto_73613 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73628 - BLOCK
      ?auto_73629 - BLOCK
      ?auto_73630 - BLOCK
      ?auto_73631 - BLOCK
    )
    :vars
    (
      ?auto_73632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73631 ?auto_73632 ) ( ON-TABLE ?auto_73628 ) ( not ( = ?auto_73628 ?auto_73629 ) ) ( not ( = ?auto_73628 ?auto_73630 ) ) ( not ( = ?auto_73628 ?auto_73631 ) ) ( not ( = ?auto_73628 ?auto_73632 ) ) ( not ( = ?auto_73629 ?auto_73630 ) ) ( not ( = ?auto_73629 ?auto_73631 ) ) ( not ( = ?auto_73629 ?auto_73632 ) ) ( not ( = ?auto_73630 ?auto_73631 ) ) ( not ( = ?auto_73630 ?auto_73632 ) ) ( not ( = ?auto_73631 ?auto_73632 ) ) ( ON ?auto_73630 ?auto_73631 ) ( CLEAR ?auto_73628 ) ( ON ?auto_73629 ?auto_73630 ) ( CLEAR ?auto_73629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73628 ?auto_73629 )
      ( MAKE-4PILE ?auto_73628 ?auto_73629 ?auto_73630 ?auto_73631 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_73646 - BLOCK
      ?auto_73647 - BLOCK
      ?auto_73648 - BLOCK
      ?auto_73649 - BLOCK
    )
    :vars
    (
      ?auto_73650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73649 ?auto_73650 ) ( not ( = ?auto_73646 ?auto_73647 ) ) ( not ( = ?auto_73646 ?auto_73648 ) ) ( not ( = ?auto_73646 ?auto_73649 ) ) ( not ( = ?auto_73646 ?auto_73650 ) ) ( not ( = ?auto_73647 ?auto_73648 ) ) ( not ( = ?auto_73647 ?auto_73649 ) ) ( not ( = ?auto_73647 ?auto_73650 ) ) ( not ( = ?auto_73648 ?auto_73649 ) ) ( not ( = ?auto_73648 ?auto_73650 ) ) ( not ( = ?auto_73649 ?auto_73650 ) ) ( ON ?auto_73648 ?auto_73649 ) ( ON ?auto_73647 ?auto_73648 ) ( ON ?auto_73646 ?auto_73647 ) ( CLEAR ?auto_73646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73646 )
      ( MAKE-4PILE ?auto_73646 ?auto_73647 ?auto_73648 ?auto_73649 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73665 - BLOCK
      ?auto_73666 - BLOCK
      ?auto_73667 - BLOCK
      ?auto_73668 - BLOCK
      ?auto_73669 - BLOCK
    )
    :vars
    (
      ?auto_73670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73668 ) ( ON ?auto_73669 ?auto_73670 ) ( CLEAR ?auto_73669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73665 ) ( ON ?auto_73666 ?auto_73665 ) ( ON ?auto_73667 ?auto_73666 ) ( ON ?auto_73668 ?auto_73667 ) ( not ( = ?auto_73665 ?auto_73666 ) ) ( not ( = ?auto_73665 ?auto_73667 ) ) ( not ( = ?auto_73665 ?auto_73668 ) ) ( not ( = ?auto_73665 ?auto_73669 ) ) ( not ( = ?auto_73665 ?auto_73670 ) ) ( not ( = ?auto_73666 ?auto_73667 ) ) ( not ( = ?auto_73666 ?auto_73668 ) ) ( not ( = ?auto_73666 ?auto_73669 ) ) ( not ( = ?auto_73666 ?auto_73670 ) ) ( not ( = ?auto_73667 ?auto_73668 ) ) ( not ( = ?auto_73667 ?auto_73669 ) ) ( not ( = ?auto_73667 ?auto_73670 ) ) ( not ( = ?auto_73668 ?auto_73669 ) ) ( not ( = ?auto_73668 ?auto_73670 ) ) ( not ( = ?auto_73669 ?auto_73670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73669 ?auto_73670 )
      ( !STACK ?auto_73669 ?auto_73668 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73687 - BLOCK
      ?auto_73688 - BLOCK
      ?auto_73689 - BLOCK
      ?auto_73690 - BLOCK
      ?auto_73691 - BLOCK
    )
    :vars
    (
      ?auto_73692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73691 ?auto_73692 ) ( ON-TABLE ?auto_73687 ) ( ON ?auto_73688 ?auto_73687 ) ( ON ?auto_73689 ?auto_73688 ) ( not ( = ?auto_73687 ?auto_73688 ) ) ( not ( = ?auto_73687 ?auto_73689 ) ) ( not ( = ?auto_73687 ?auto_73690 ) ) ( not ( = ?auto_73687 ?auto_73691 ) ) ( not ( = ?auto_73687 ?auto_73692 ) ) ( not ( = ?auto_73688 ?auto_73689 ) ) ( not ( = ?auto_73688 ?auto_73690 ) ) ( not ( = ?auto_73688 ?auto_73691 ) ) ( not ( = ?auto_73688 ?auto_73692 ) ) ( not ( = ?auto_73689 ?auto_73690 ) ) ( not ( = ?auto_73689 ?auto_73691 ) ) ( not ( = ?auto_73689 ?auto_73692 ) ) ( not ( = ?auto_73690 ?auto_73691 ) ) ( not ( = ?auto_73690 ?auto_73692 ) ) ( not ( = ?auto_73691 ?auto_73692 ) ) ( CLEAR ?auto_73689 ) ( ON ?auto_73690 ?auto_73691 ) ( CLEAR ?auto_73690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73687 ?auto_73688 ?auto_73689 ?auto_73690 )
      ( MAKE-5PILE ?auto_73687 ?auto_73688 ?auto_73689 ?auto_73690 ?auto_73691 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73709 - BLOCK
      ?auto_73710 - BLOCK
      ?auto_73711 - BLOCK
      ?auto_73712 - BLOCK
      ?auto_73713 - BLOCK
    )
    :vars
    (
      ?auto_73714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73713 ?auto_73714 ) ( ON-TABLE ?auto_73709 ) ( ON ?auto_73710 ?auto_73709 ) ( not ( = ?auto_73709 ?auto_73710 ) ) ( not ( = ?auto_73709 ?auto_73711 ) ) ( not ( = ?auto_73709 ?auto_73712 ) ) ( not ( = ?auto_73709 ?auto_73713 ) ) ( not ( = ?auto_73709 ?auto_73714 ) ) ( not ( = ?auto_73710 ?auto_73711 ) ) ( not ( = ?auto_73710 ?auto_73712 ) ) ( not ( = ?auto_73710 ?auto_73713 ) ) ( not ( = ?auto_73710 ?auto_73714 ) ) ( not ( = ?auto_73711 ?auto_73712 ) ) ( not ( = ?auto_73711 ?auto_73713 ) ) ( not ( = ?auto_73711 ?auto_73714 ) ) ( not ( = ?auto_73712 ?auto_73713 ) ) ( not ( = ?auto_73712 ?auto_73714 ) ) ( not ( = ?auto_73713 ?auto_73714 ) ) ( ON ?auto_73712 ?auto_73713 ) ( CLEAR ?auto_73710 ) ( ON ?auto_73711 ?auto_73712 ) ( CLEAR ?auto_73711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73709 ?auto_73710 ?auto_73711 )
      ( MAKE-5PILE ?auto_73709 ?auto_73710 ?auto_73711 ?auto_73712 ?auto_73713 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73731 - BLOCK
      ?auto_73732 - BLOCK
      ?auto_73733 - BLOCK
      ?auto_73734 - BLOCK
      ?auto_73735 - BLOCK
    )
    :vars
    (
      ?auto_73736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73735 ?auto_73736 ) ( ON-TABLE ?auto_73731 ) ( not ( = ?auto_73731 ?auto_73732 ) ) ( not ( = ?auto_73731 ?auto_73733 ) ) ( not ( = ?auto_73731 ?auto_73734 ) ) ( not ( = ?auto_73731 ?auto_73735 ) ) ( not ( = ?auto_73731 ?auto_73736 ) ) ( not ( = ?auto_73732 ?auto_73733 ) ) ( not ( = ?auto_73732 ?auto_73734 ) ) ( not ( = ?auto_73732 ?auto_73735 ) ) ( not ( = ?auto_73732 ?auto_73736 ) ) ( not ( = ?auto_73733 ?auto_73734 ) ) ( not ( = ?auto_73733 ?auto_73735 ) ) ( not ( = ?auto_73733 ?auto_73736 ) ) ( not ( = ?auto_73734 ?auto_73735 ) ) ( not ( = ?auto_73734 ?auto_73736 ) ) ( not ( = ?auto_73735 ?auto_73736 ) ) ( ON ?auto_73734 ?auto_73735 ) ( ON ?auto_73733 ?auto_73734 ) ( CLEAR ?auto_73731 ) ( ON ?auto_73732 ?auto_73733 ) ( CLEAR ?auto_73732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73731 ?auto_73732 )
      ( MAKE-5PILE ?auto_73731 ?auto_73732 ?auto_73733 ?auto_73734 ?auto_73735 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_73753 - BLOCK
      ?auto_73754 - BLOCK
      ?auto_73755 - BLOCK
      ?auto_73756 - BLOCK
      ?auto_73757 - BLOCK
    )
    :vars
    (
      ?auto_73758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73757 ?auto_73758 ) ( not ( = ?auto_73753 ?auto_73754 ) ) ( not ( = ?auto_73753 ?auto_73755 ) ) ( not ( = ?auto_73753 ?auto_73756 ) ) ( not ( = ?auto_73753 ?auto_73757 ) ) ( not ( = ?auto_73753 ?auto_73758 ) ) ( not ( = ?auto_73754 ?auto_73755 ) ) ( not ( = ?auto_73754 ?auto_73756 ) ) ( not ( = ?auto_73754 ?auto_73757 ) ) ( not ( = ?auto_73754 ?auto_73758 ) ) ( not ( = ?auto_73755 ?auto_73756 ) ) ( not ( = ?auto_73755 ?auto_73757 ) ) ( not ( = ?auto_73755 ?auto_73758 ) ) ( not ( = ?auto_73756 ?auto_73757 ) ) ( not ( = ?auto_73756 ?auto_73758 ) ) ( not ( = ?auto_73757 ?auto_73758 ) ) ( ON ?auto_73756 ?auto_73757 ) ( ON ?auto_73755 ?auto_73756 ) ( ON ?auto_73754 ?auto_73755 ) ( ON ?auto_73753 ?auto_73754 ) ( CLEAR ?auto_73753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73753 )
      ( MAKE-5PILE ?auto_73753 ?auto_73754 ?auto_73755 ?auto_73756 ?auto_73757 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73776 - BLOCK
      ?auto_73777 - BLOCK
      ?auto_73778 - BLOCK
      ?auto_73779 - BLOCK
      ?auto_73780 - BLOCK
      ?auto_73781 - BLOCK
    )
    :vars
    (
      ?auto_73782 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73780 ) ( ON ?auto_73781 ?auto_73782 ) ( CLEAR ?auto_73781 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73776 ) ( ON ?auto_73777 ?auto_73776 ) ( ON ?auto_73778 ?auto_73777 ) ( ON ?auto_73779 ?auto_73778 ) ( ON ?auto_73780 ?auto_73779 ) ( not ( = ?auto_73776 ?auto_73777 ) ) ( not ( = ?auto_73776 ?auto_73778 ) ) ( not ( = ?auto_73776 ?auto_73779 ) ) ( not ( = ?auto_73776 ?auto_73780 ) ) ( not ( = ?auto_73776 ?auto_73781 ) ) ( not ( = ?auto_73776 ?auto_73782 ) ) ( not ( = ?auto_73777 ?auto_73778 ) ) ( not ( = ?auto_73777 ?auto_73779 ) ) ( not ( = ?auto_73777 ?auto_73780 ) ) ( not ( = ?auto_73777 ?auto_73781 ) ) ( not ( = ?auto_73777 ?auto_73782 ) ) ( not ( = ?auto_73778 ?auto_73779 ) ) ( not ( = ?auto_73778 ?auto_73780 ) ) ( not ( = ?auto_73778 ?auto_73781 ) ) ( not ( = ?auto_73778 ?auto_73782 ) ) ( not ( = ?auto_73779 ?auto_73780 ) ) ( not ( = ?auto_73779 ?auto_73781 ) ) ( not ( = ?auto_73779 ?auto_73782 ) ) ( not ( = ?auto_73780 ?auto_73781 ) ) ( not ( = ?auto_73780 ?auto_73782 ) ) ( not ( = ?auto_73781 ?auto_73782 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73781 ?auto_73782 )
      ( !STACK ?auto_73781 ?auto_73780 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73802 - BLOCK
      ?auto_73803 - BLOCK
      ?auto_73804 - BLOCK
      ?auto_73805 - BLOCK
      ?auto_73806 - BLOCK
      ?auto_73807 - BLOCK
    )
    :vars
    (
      ?auto_73808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73807 ?auto_73808 ) ( ON-TABLE ?auto_73802 ) ( ON ?auto_73803 ?auto_73802 ) ( ON ?auto_73804 ?auto_73803 ) ( ON ?auto_73805 ?auto_73804 ) ( not ( = ?auto_73802 ?auto_73803 ) ) ( not ( = ?auto_73802 ?auto_73804 ) ) ( not ( = ?auto_73802 ?auto_73805 ) ) ( not ( = ?auto_73802 ?auto_73806 ) ) ( not ( = ?auto_73802 ?auto_73807 ) ) ( not ( = ?auto_73802 ?auto_73808 ) ) ( not ( = ?auto_73803 ?auto_73804 ) ) ( not ( = ?auto_73803 ?auto_73805 ) ) ( not ( = ?auto_73803 ?auto_73806 ) ) ( not ( = ?auto_73803 ?auto_73807 ) ) ( not ( = ?auto_73803 ?auto_73808 ) ) ( not ( = ?auto_73804 ?auto_73805 ) ) ( not ( = ?auto_73804 ?auto_73806 ) ) ( not ( = ?auto_73804 ?auto_73807 ) ) ( not ( = ?auto_73804 ?auto_73808 ) ) ( not ( = ?auto_73805 ?auto_73806 ) ) ( not ( = ?auto_73805 ?auto_73807 ) ) ( not ( = ?auto_73805 ?auto_73808 ) ) ( not ( = ?auto_73806 ?auto_73807 ) ) ( not ( = ?auto_73806 ?auto_73808 ) ) ( not ( = ?auto_73807 ?auto_73808 ) ) ( CLEAR ?auto_73805 ) ( ON ?auto_73806 ?auto_73807 ) ( CLEAR ?auto_73806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73802 ?auto_73803 ?auto_73804 ?auto_73805 ?auto_73806 )
      ( MAKE-6PILE ?auto_73802 ?auto_73803 ?auto_73804 ?auto_73805 ?auto_73806 ?auto_73807 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73828 - BLOCK
      ?auto_73829 - BLOCK
      ?auto_73830 - BLOCK
      ?auto_73831 - BLOCK
      ?auto_73832 - BLOCK
      ?auto_73833 - BLOCK
    )
    :vars
    (
      ?auto_73834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73833 ?auto_73834 ) ( ON-TABLE ?auto_73828 ) ( ON ?auto_73829 ?auto_73828 ) ( ON ?auto_73830 ?auto_73829 ) ( not ( = ?auto_73828 ?auto_73829 ) ) ( not ( = ?auto_73828 ?auto_73830 ) ) ( not ( = ?auto_73828 ?auto_73831 ) ) ( not ( = ?auto_73828 ?auto_73832 ) ) ( not ( = ?auto_73828 ?auto_73833 ) ) ( not ( = ?auto_73828 ?auto_73834 ) ) ( not ( = ?auto_73829 ?auto_73830 ) ) ( not ( = ?auto_73829 ?auto_73831 ) ) ( not ( = ?auto_73829 ?auto_73832 ) ) ( not ( = ?auto_73829 ?auto_73833 ) ) ( not ( = ?auto_73829 ?auto_73834 ) ) ( not ( = ?auto_73830 ?auto_73831 ) ) ( not ( = ?auto_73830 ?auto_73832 ) ) ( not ( = ?auto_73830 ?auto_73833 ) ) ( not ( = ?auto_73830 ?auto_73834 ) ) ( not ( = ?auto_73831 ?auto_73832 ) ) ( not ( = ?auto_73831 ?auto_73833 ) ) ( not ( = ?auto_73831 ?auto_73834 ) ) ( not ( = ?auto_73832 ?auto_73833 ) ) ( not ( = ?auto_73832 ?auto_73834 ) ) ( not ( = ?auto_73833 ?auto_73834 ) ) ( ON ?auto_73832 ?auto_73833 ) ( CLEAR ?auto_73830 ) ( ON ?auto_73831 ?auto_73832 ) ( CLEAR ?auto_73831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_73828 ?auto_73829 ?auto_73830 ?auto_73831 )
      ( MAKE-6PILE ?auto_73828 ?auto_73829 ?auto_73830 ?auto_73831 ?auto_73832 ?auto_73833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73854 - BLOCK
      ?auto_73855 - BLOCK
      ?auto_73856 - BLOCK
      ?auto_73857 - BLOCK
      ?auto_73858 - BLOCK
      ?auto_73859 - BLOCK
    )
    :vars
    (
      ?auto_73860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73859 ?auto_73860 ) ( ON-TABLE ?auto_73854 ) ( ON ?auto_73855 ?auto_73854 ) ( not ( = ?auto_73854 ?auto_73855 ) ) ( not ( = ?auto_73854 ?auto_73856 ) ) ( not ( = ?auto_73854 ?auto_73857 ) ) ( not ( = ?auto_73854 ?auto_73858 ) ) ( not ( = ?auto_73854 ?auto_73859 ) ) ( not ( = ?auto_73854 ?auto_73860 ) ) ( not ( = ?auto_73855 ?auto_73856 ) ) ( not ( = ?auto_73855 ?auto_73857 ) ) ( not ( = ?auto_73855 ?auto_73858 ) ) ( not ( = ?auto_73855 ?auto_73859 ) ) ( not ( = ?auto_73855 ?auto_73860 ) ) ( not ( = ?auto_73856 ?auto_73857 ) ) ( not ( = ?auto_73856 ?auto_73858 ) ) ( not ( = ?auto_73856 ?auto_73859 ) ) ( not ( = ?auto_73856 ?auto_73860 ) ) ( not ( = ?auto_73857 ?auto_73858 ) ) ( not ( = ?auto_73857 ?auto_73859 ) ) ( not ( = ?auto_73857 ?auto_73860 ) ) ( not ( = ?auto_73858 ?auto_73859 ) ) ( not ( = ?auto_73858 ?auto_73860 ) ) ( not ( = ?auto_73859 ?auto_73860 ) ) ( ON ?auto_73858 ?auto_73859 ) ( ON ?auto_73857 ?auto_73858 ) ( CLEAR ?auto_73855 ) ( ON ?auto_73856 ?auto_73857 ) ( CLEAR ?auto_73856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_73854 ?auto_73855 ?auto_73856 )
      ( MAKE-6PILE ?auto_73854 ?auto_73855 ?auto_73856 ?auto_73857 ?auto_73858 ?auto_73859 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73880 - BLOCK
      ?auto_73881 - BLOCK
      ?auto_73882 - BLOCK
      ?auto_73883 - BLOCK
      ?auto_73884 - BLOCK
      ?auto_73885 - BLOCK
    )
    :vars
    (
      ?auto_73886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73885 ?auto_73886 ) ( ON-TABLE ?auto_73880 ) ( not ( = ?auto_73880 ?auto_73881 ) ) ( not ( = ?auto_73880 ?auto_73882 ) ) ( not ( = ?auto_73880 ?auto_73883 ) ) ( not ( = ?auto_73880 ?auto_73884 ) ) ( not ( = ?auto_73880 ?auto_73885 ) ) ( not ( = ?auto_73880 ?auto_73886 ) ) ( not ( = ?auto_73881 ?auto_73882 ) ) ( not ( = ?auto_73881 ?auto_73883 ) ) ( not ( = ?auto_73881 ?auto_73884 ) ) ( not ( = ?auto_73881 ?auto_73885 ) ) ( not ( = ?auto_73881 ?auto_73886 ) ) ( not ( = ?auto_73882 ?auto_73883 ) ) ( not ( = ?auto_73882 ?auto_73884 ) ) ( not ( = ?auto_73882 ?auto_73885 ) ) ( not ( = ?auto_73882 ?auto_73886 ) ) ( not ( = ?auto_73883 ?auto_73884 ) ) ( not ( = ?auto_73883 ?auto_73885 ) ) ( not ( = ?auto_73883 ?auto_73886 ) ) ( not ( = ?auto_73884 ?auto_73885 ) ) ( not ( = ?auto_73884 ?auto_73886 ) ) ( not ( = ?auto_73885 ?auto_73886 ) ) ( ON ?auto_73884 ?auto_73885 ) ( ON ?auto_73883 ?auto_73884 ) ( ON ?auto_73882 ?auto_73883 ) ( CLEAR ?auto_73880 ) ( ON ?auto_73881 ?auto_73882 ) ( CLEAR ?auto_73881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73880 ?auto_73881 )
      ( MAKE-6PILE ?auto_73880 ?auto_73881 ?auto_73882 ?auto_73883 ?auto_73884 ?auto_73885 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_73906 - BLOCK
      ?auto_73907 - BLOCK
      ?auto_73908 - BLOCK
      ?auto_73909 - BLOCK
      ?auto_73910 - BLOCK
      ?auto_73911 - BLOCK
    )
    :vars
    (
      ?auto_73912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73911 ?auto_73912 ) ( not ( = ?auto_73906 ?auto_73907 ) ) ( not ( = ?auto_73906 ?auto_73908 ) ) ( not ( = ?auto_73906 ?auto_73909 ) ) ( not ( = ?auto_73906 ?auto_73910 ) ) ( not ( = ?auto_73906 ?auto_73911 ) ) ( not ( = ?auto_73906 ?auto_73912 ) ) ( not ( = ?auto_73907 ?auto_73908 ) ) ( not ( = ?auto_73907 ?auto_73909 ) ) ( not ( = ?auto_73907 ?auto_73910 ) ) ( not ( = ?auto_73907 ?auto_73911 ) ) ( not ( = ?auto_73907 ?auto_73912 ) ) ( not ( = ?auto_73908 ?auto_73909 ) ) ( not ( = ?auto_73908 ?auto_73910 ) ) ( not ( = ?auto_73908 ?auto_73911 ) ) ( not ( = ?auto_73908 ?auto_73912 ) ) ( not ( = ?auto_73909 ?auto_73910 ) ) ( not ( = ?auto_73909 ?auto_73911 ) ) ( not ( = ?auto_73909 ?auto_73912 ) ) ( not ( = ?auto_73910 ?auto_73911 ) ) ( not ( = ?auto_73910 ?auto_73912 ) ) ( not ( = ?auto_73911 ?auto_73912 ) ) ( ON ?auto_73910 ?auto_73911 ) ( ON ?auto_73909 ?auto_73910 ) ( ON ?auto_73908 ?auto_73909 ) ( ON ?auto_73907 ?auto_73908 ) ( ON ?auto_73906 ?auto_73907 ) ( CLEAR ?auto_73906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_73906 )
      ( MAKE-6PILE ?auto_73906 ?auto_73907 ?auto_73908 ?auto_73909 ?auto_73910 ?auto_73911 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73933 - BLOCK
      ?auto_73934 - BLOCK
      ?auto_73935 - BLOCK
      ?auto_73936 - BLOCK
      ?auto_73937 - BLOCK
      ?auto_73938 - BLOCK
      ?auto_73939 - BLOCK
    )
    :vars
    (
      ?auto_73940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_73938 ) ( ON ?auto_73939 ?auto_73940 ) ( CLEAR ?auto_73939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73933 ) ( ON ?auto_73934 ?auto_73933 ) ( ON ?auto_73935 ?auto_73934 ) ( ON ?auto_73936 ?auto_73935 ) ( ON ?auto_73937 ?auto_73936 ) ( ON ?auto_73938 ?auto_73937 ) ( not ( = ?auto_73933 ?auto_73934 ) ) ( not ( = ?auto_73933 ?auto_73935 ) ) ( not ( = ?auto_73933 ?auto_73936 ) ) ( not ( = ?auto_73933 ?auto_73937 ) ) ( not ( = ?auto_73933 ?auto_73938 ) ) ( not ( = ?auto_73933 ?auto_73939 ) ) ( not ( = ?auto_73933 ?auto_73940 ) ) ( not ( = ?auto_73934 ?auto_73935 ) ) ( not ( = ?auto_73934 ?auto_73936 ) ) ( not ( = ?auto_73934 ?auto_73937 ) ) ( not ( = ?auto_73934 ?auto_73938 ) ) ( not ( = ?auto_73934 ?auto_73939 ) ) ( not ( = ?auto_73934 ?auto_73940 ) ) ( not ( = ?auto_73935 ?auto_73936 ) ) ( not ( = ?auto_73935 ?auto_73937 ) ) ( not ( = ?auto_73935 ?auto_73938 ) ) ( not ( = ?auto_73935 ?auto_73939 ) ) ( not ( = ?auto_73935 ?auto_73940 ) ) ( not ( = ?auto_73936 ?auto_73937 ) ) ( not ( = ?auto_73936 ?auto_73938 ) ) ( not ( = ?auto_73936 ?auto_73939 ) ) ( not ( = ?auto_73936 ?auto_73940 ) ) ( not ( = ?auto_73937 ?auto_73938 ) ) ( not ( = ?auto_73937 ?auto_73939 ) ) ( not ( = ?auto_73937 ?auto_73940 ) ) ( not ( = ?auto_73938 ?auto_73939 ) ) ( not ( = ?auto_73938 ?auto_73940 ) ) ( not ( = ?auto_73939 ?auto_73940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_73939 ?auto_73940 )
      ( !STACK ?auto_73939 ?auto_73938 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73963 - BLOCK
      ?auto_73964 - BLOCK
      ?auto_73965 - BLOCK
      ?auto_73966 - BLOCK
      ?auto_73967 - BLOCK
      ?auto_73968 - BLOCK
      ?auto_73969 - BLOCK
    )
    :vars
    (
      ?auto_73970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73969 ?auto_73970 ) ( ON-TABLE ?auto_73963 ) ( ON ?auto_73964 ?auto_73963 ) ( ON ?auto_73965 ?auto_73964 ) ( ON ?auto_73966 ?auto_73965 ) ( ON ?auto_73967 ?auto_73966 ) ( not ( = ?auto_73963 ?auto_73964 ) ) ( not ( = ?auto_73963 ?auto_73965 ) ) ( not ( = ?auto_73963 ?auto_73966 ) ) ( not ( = ?auto_73963 ?auto_73967 ) ) ( not ( = ?auto_73963 ?auto_73968 ) ) ( not ( = ?auto_73963 ?auto_73969 ) ) ( not ( = ?auto_73963 ?auto_73970 ) ) ( not ( = ?auto_73964 ?auto_73965 ) ) ( not ( = ?auto_73964 ?auto_73966 ) ) ( not ( = ?auto_73964 ?auto_73967 ) ) ( not ( = ?auto_73964 ?auto_73968 ) ) ( not ( = ?auto_73964 ?auto_73969 ) ) ( not ( = ?auto_73964 ?auto_73970 ) ) ( not ( = ?auto_73965 ?auto_73966 ) ) ( not ( = ?auto_73965 ?auto_73967 ) ) ( not ( = ?auto_73965 ?auto_73968 ) ) ( not ( = ?auto_73965 ?auto_73969 ) ) ( not ( = ?auto_73965 ?auto_73970 ) ) ( not ( = ?auto_73966 ?auto_73967 ) ) ( not ( = ?auto_73966 ?auto_73968 ) ) ( not ( = ?auto_73966 ?auto_73969 ) ) ( not ( = ?auto_73966 ?auto_73970 ) ) ( not ( = ?auto_73967 ?auto_73968 ) ) ( not ( = ?auto_73967 ?auto_73969 ) ) ( not ( = ?auto_73967 ?auto_73970 ) ) ( not ( = ?auto_73968 ?auto_73969 ) ) ( not ( = ?auto_73968 ?auto_73970 ) ) ( not ( = ?auto_73969 ?auto_73970 ) ) ( CLEAR ?auto_73967 ) ( ON ?auto_73968 ?auto_73969 ) ( CLEAR ?auto_73968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_73963 ?auto_73964 ?auto_73965 ?auto_73966 ?auto_73967 ?auto_73968 )
      ( MAKE-7PILE ?auto_73963 ?auto_73964 ?auto_73965 ?auto_73966 ?auto_73967 ?auto_73968 ?auto_73969 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_73993 - BLOCK
      ?auto_73994 - BLOCK
      ?auto_73995 - BLOCK
      ?auto_73996 - BLOCK
      ?auto_73997 - BLOCK
      ?auto_73998 - BLOCK
      ?auto_73999 - BLOCK
    )
    :vars
    (
      ?auto_74000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_73999 ?auto_74000 ) ( ON-TABLE ?auto_73993 ) ( ON ?auto_73994 ?auto_73993 ) ( ON ?auto_73995 ?auto_73994 ) ( ON ?auto_73996 ?auto_73995 ) ( not ( = ?auto_73993 ?auto_73994 ) ) ( not ( = ?auto_73993 ?auto_73995 ) ) ( not ( = ?auto_73993 ?auto_73996 ) ) ( not ( = ?auto_73993 ?auto_73997 ) ) ( not ( = ?auto_73993 ?auto_73998 ) ) ( not ( = ?auto_73993 ?auto_73999 ) ) ( not ( = ?auto_73993 ?auto_74000 ) ) ( not ( = ?auto_73994 ?auto_73995 ) ) ( not ( = ?auto_73994 ?auto_73996 ) ) ( not ( = ?auto_73994 ?auto_73997 ) ) ( not ( = ?auto_73994 ?auto_73998 ) ) ( not ( = ?auto_73994 ?auto_73999 ) ) ( not ( = ?auto_73994 ?auto_74000 ) ) ( not ( = ?auto_73995 ?auto_73996 ) ) ( not ( = ?auto_73995 ?auto_73997 ) ) ( not ( = ?auto_73995 ?auto_73998 ) ) ( not ( = ?auto_73995 ?auto_73999 ) ) ( not ( = ?auto_73995 ?auto_74000 ) ) ( not ( = ?auto_73996 ?auto_73997 ) ) ( not ( = ?auto_73996 ?auto_73998 ) ) ( not ( = ?auto_73996 ?auto_73999 ) ) ( not ( = ?auto_73996 ?auto_74000 ) ) ( not ( = ?auto_73997 ?auto_73998 ) ) ( not ( = ?auto_73997 ?auto_73999 ) ) ( not ( = ?auto_73997 ?auto_74000 ) ) ( not ( = ?auto_73998 ?auto_73999 ) ) ( not ( = ?auto_73998 ?auto_74000 ) ) ( not ( = ?auto_73999 ?auto_74000 ) ) ( ON ?auto_73998 ?auto_73999 ) ( CLEAR ?auto_73996 ) ( ON ?auto_73997 ?auto_73998 ) ( CLEAR ?auto_73997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_73993 ?auto_73994 ?auto_73995 ?auto_73996 ?auto_73997 )
      ( MAKE-7PILE ?auto_73993 ?auto_73994 ?auto_73995 ?auto_73996 ?auto_73997 ?auto_73998 ?auto_73999 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74023 - BLOCK
      ?auto_74024 - BLOCK
      ?auto_74025 - BLOCK
      ?auto_74026 - BLOCK
      ?auto_74027 - BLOCK
      ?auto_74028 - BLOCK
      ?auto_74029 - BLOCK
    )
    :vars
    (
      ?auto_74030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74029 ?auto_74030 ) ( ON-TABLE ?auto_74023 ) ( ON ?auto_74024 ?auto_74023 ) ( ON ?auto_74025 ?auto_74024 ) ( not ( = ?auto_74023 ?auto_74024 ) ) ( not ( = ?auto_74023 ?auto_74025 ) ) ( not ( = ?auto_74023 ?auto_74026 ) ) ( not ( = ?auto_74023 ?auto_74027 ) ) ( not ( = ?auto_74023 ?auto_74028 ) ) ( not ( = ?auto_74023 ?auto_74029 ) ) ( not ( = ?auto_74023 ?auto_74030 ) ) ( not ( = ?auto_74024 ?auto_74025 ) ) ( not ( = ?auto_74024 ?auto_74026 ) ) ( not ( = ?auto_74024 ?auto_74027 ) ) ( not ( = ?auto_74024 ?auto_74028 ) ) ( not ( = ?auto_74024 ?auto_74029 ) ) ( not ( = ?auto_74024 ?auto_74030 ) ) ( not ( = ?auto_74025 ?auto_74026 ) ) ( not ( = ?auto_74025 ?auto_74027 ) ) ( not ( = ?auto_74025 ?auto_74028 ) ) ( not ( = ?auto_74025 ?auto_74029 ) ) ( not ( = ?auto_74025 ?auto_74030 ) ) ( not ( = ?auto_74026 ?auto_74027 ) ) ( not ( = ?auto_74026 ?auto_74028 ) ) ( not ( = ?auto_74026 ?auto_74029 ) ) ( not ( = ?auto_74026 ?auto_74030 ) ) ( not ( = ?auto_74027 ?auto_74028 ) ) ( not ( = ?auto_74027 ?auto_74029 ) ) ( not ( = ?auto_74027 ?auto_74030 ) ) ( not ( = ?auto_74028 ?auto_74029 ) ) ( not ( = ?auto_74028 ?auto_74030 ) ) ( not ( = ?auto_74029 ?auto_74030 ) ) ( ON ?auto_74028 ?auto_74029 ) ( ON ?auto_74027 ?auto_74028 ) ( CLEAR ?auto_74025 ) ( ON ?auto_74026 ?auto_74027 ) ( CLEAR ?auto_74026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74023 ?auto_74024 ?auto_74025 ?auto_74026 )
      ( MAKE-7PILE ?auto_74023 ?auto_74024 ?auto_74025 ?auto_74026 ?auto_74027 ?auto_74028 ?auto_74029 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74053 - BLOCK
      ?auto_74054 - BLOCK
      ?auto_74055 - BLOCK
      ?auto_74056 - BLOCK
      ?auto_74057 - BLOCK
      ?auto_74058 - BLOCK
      ?auto_74059 - BLOCK
    )
    :vars
    (
      ?auto_74060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74059 ?auto_74060 ) ( ON-TABLE ?auto_74053 ) ( ON ?auto_74054 ?auto_74053 ) ( not ( = ?auto_74053 ?auto_74054 ) ) ( not ( = ?auto_74053 ?auto_74055 ) ) ( not ( = ?auto_74053 ?auto_74056 ) ) ( not ( = ?auto_74053 ?auto_74057 ) ) ( not ( = ?auto_74053 ?auto_74058 ) ) ( not ( = ?auto_74053 ?auto_74059 ) ) ( not ( = ?auto_74053 ?auto_74060 ) ) ( not ( = ?auto_74054 ?auto_74055 ) ) ( not ( = ?auto_74054 ?auto_74056 ) ) ( not ( = ?auto_74054 ?auto_74057 ) ) ( not ( = ?auto_74054 ?auto_74058 ) ) ( not ( = ?auto_74054 ?auto_74059 ) ) ( not ( = ?auto_74054 ?auto_74060 ) ) ( not ( = ?auto_74055 ?auto_74056 ) ) ( not ( = ?auto_74055 ?auto_74057 ) ) ( not ( = ?auto_74055 ?auto_74058 ) ) ( not ( = ?auto_74055 ?auto_74059 ) ) ( not ( = ?auto_74055 ?auto_74060 ) ) ( not ( = ?auto_74056 ?auto_74057 ) ) ( not ( = ?auto_74056 ?auto_74058 ) ) ( not ( = ?auto_74056 ?auto_74059 ) ) ( not ( = ?auto_74056 ?auto_74060 ) ) ( not ( = ?auto_74057 ?auto_74058 ) ) ( not ( = ?auto_74057 ?auto_74059 ) ) ( not ( = ?auto_74057 ?auto_74060 ) ) ( not ( = ?auto_74058 ?auto_74059 ) ) ( not ( = ?auto_74058 ?auto_74060 ) ) ( not ( = ?auto_74059 ?auto_74060 ) ) ( ON ?auto_74058 ?auto_74059 ) ( ON ?auto_74057 ?auto_74058 ) ( ON ?auto_74056 ?auto_74057 ) ( CLEAR ?auto_74054 ) ( ON ?auto_74055 ?auto_74056 ) ( CLEAR ?auto_74055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74053 ?auto_74054 ?auto_74055 )
      ( MAKE-7PILE ?auto_74053 ?auto_74054 ?auto_74055 ?auto_74056 ?auto_74057 ?auto_74058 ?auto_74059 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74083 - BLOCK
      ?auto_74084 - BLOCK
      ?auto_74085 - BLOCK
      ?auto_74086 - BLOCK
      ?auto_74087 - BLOCK
      ?auto_74088 - BLOCK
      ?auto_74089 - BLOCK
    )
    :vars
    (
      ?auto_74090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74089 ?auto_74090 ) ( ON-TABLE ?auto_74083 ) ( not ( = ?auto_74083 ?auto_74084 ) ) ( not ( = ?auto_74083 ?auto_74085 ) ) ( not ( = ?auto_74083 ?auto_74086 ) ) ( not ( = ?auto_74083 ?auto_74087 ) ) ( not ( = ?auto_74083 ?auto_74088 ) ) ( not ( = ?auto_74083 ?auto_74089 ) ) ( not ( = ?auto_74083 ?auto_74090 ) ) ( not ( = ?auto_74084 ?auto_74085 ) ) ( not ( = ?auto_74084 ?auto_74086 ) ) ( not ( = ?auto_74084 ?auto_74087 ) ) ( not ( = ?auto_74084 ?auto_74088 ) ) ( not ( = ?auto_74084 ?auto_74089 ) ) ( not ( = ?auto_74084 ?auto_74090 ) ) ( not ( = ?auto_74085 ?auto_74086 ) ) ( not ( = ?auto_74085 ?auto_74087 ) ) ( not ( = ?auto_74085 ?auto_74088 ) ) ( not ( = ?auto_74085 ?auto_74089 ) ) ( not ( = ?auto_74085 ?auto_74090 ) ) ( not ( = ?auto_74086 ?auto_74087 ) ) ( not ( = ?auto_74086 ?auto_74088 ) ) ( not ( = ?auto_74086 ?auto_74089 ) ) ( not ( = ?auto_74086 ?auto_74090 ) ) ( not ( = ?auto_74087 ?auto_74088 ) ) ( not ( = ?auto_74087 ?auto_74089 ) ) ( not ( = ?auto_74087 ?auto_74090 ) ) ( not ( = ?auto_74088 ?auto_74089 ) ) ( not ( = ?auto_74088 ?auto_74090 ) ) ( not ( = ?auto_74089 ?auto_74090 ) ) ( ON ?auto_74088 ?auto_74089 ) ( ON ?auto_74087 ?auto_74088 ) ( ON ?auto_74086 ?auto_74087 ) ( ON ?auto_74085 ?auto_74086 ) ( CLEAR ?auto_74083 ) ( ON ?auto_74084 ?auto_74085 ) ( CLEAR ?auto_74084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74083 ?auto_74084 )
      ( MAKE-7PILE ?auto_74083 ?auto_74084 ?auto_74085 ?auto_74086 ?auto_74087 ?auto_74088 ?auto_74089 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_74113 - BLOCK
      ?auto_74114 - BLOCK
      ?auto_74115 - BLOCK
      ?auto_74116 - BLOCK
      ?auto_74117 - BLOCK
      ?auto_74118 - BLOCK
      ?auto_74119 - BLOCK
    )
    :vars
    (
      ?auto_74120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74119 ?auto_74120 ) ( not ( = ?auto_74113 ?auto_74114 ) ) ( not ( = ?auto_74113 ?auto_74115 ) ) ( not ( = ?auto_74113 ?auto_74116 ) ) ( not ( = ?auto_74113 ?auto_74117 ) ) ( not ( = ?auto_74113 ?auto_74118 ) ) ( not ( = ?auto_74113 ?auto_74119 ) ) ( not ( = ?auto_74113 ?auto_74120 ) ) ( not ( = ?auto_74114 ?auto_74115 ) ) ( not ( = ?auto_74114 ?auto_74116 ) ) ( not ( = ?auto_74114 ?auto_74117 ) ) ( not ( = ?auto_74114 ?auto_74118 ) ) ( not ( = ?auto_74114 ?auto_74119 ) ) ( not ( = ?auto_74114 ?auto_74120 ) ) ( not ( = ?auto_74115 ?auto_74116 ) ) ( not ( = ?auto_74115 ?auto_74117 ) ) ( not ( = ?auto_74115 ?auto_74118 ) ) ( not ( = ?auto_74115 ?auto_74119 ) ) ( not ( = ?auto_74115 ?auto_74120 ) ) ( not ( = ?auto_74116 ?auto_74117 ) ) ( not ( = ?auto_74116 ?auto_74118 ) ) ( not ( = ?auto_74116 ?auto_74119 ) ) ( not ( = ?auto_74116 ?auto_74120 ) ) ( not ( = ?auto_74117 ?auto_74118 ) ) ( not ( = ?auto_74117 ?auto_74119 ) ) ( not ( = ?auto_74117 ?auto_74120 ) ) ( not ( = ?auto_74118 ?auto_74119 ) ) ( not ( = ?auto_74118 ?auto_74120 ) ) ( not ( = ?auto_74119 ?auto_74120 ) ) ( ON ?auto_74118 ?auto_74119 ) ( ON ?auto_74117 ?auto_74118 ) ( ON ?auto_74116 ?auto_74117 ) ( ON ?auto_74115 ?auto_74116 ) ( ON ?auto_74114 ?auto_74115 ) ( ON ?auto_74113 ?auto_74114 ) ( CLEAR ?auto_74113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74113 )
      ( MAKE-7PILE ?auto_74113 ?auto_74114 ?auto_74115 ?auto_74116 ?auto_74117 ?auto_74118 ?auto_74119 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_74144 - BLOCK
      ?auto_74145 - BLOCK
      ?auto_74146 - BLOCK
      ?auto_74147 - BLOCK
      ?auto_74148 - BLOCK
      ?auto_74149 - BLOCK
      ?auto_74150 - BLOCK
      ?auto_74151 - BLOCK
    )
    :vars
    (
      ?auto_74152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74150 ) ( ON ?auto_74151 ?auto_74152 ) ( CLEAR ?auto_74151 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74144 ) ( ON ?auto_74145 ?auto_74144 ) ( ON ?auto_74146 ?auto_74145 ) ( ON ?auto_74147 ?auto_74146 ) ( ON ?auto_74148 ?auto_74147 ) ( ON ?auto_74149 ?auto_74148 ) ( ON ?auto_74150 ?auto_74149 ) ( not ( = ?auto_74144 ?auto_74145 ) ) ( not ( = ?auto_74144 ?auto_74146 ) ) ( not ( = ?auto_74144 ?auto_74147 ) ) ( not ( = ?auto_74144 ?auto_74148 ) ) ( not ( = ?auto_74144 ?auto_74149 ) ) ( not ( = ?auto_74144 ?auto_74150 ) ) ( not ( = ?auto_74144 ?auto_74151 ) ) ( not ( = ?auto_74144 ?auto_74152 ) ) ( not ( = ?auto_74145 ?auto_74146 ) ) ( not ( = ?auto_74145 ?auto_74147 ) ) ( not ( = ?auto_74145 ?auto_74148 ) ) ( not ( = ?auto_74145 ?auto_74149 ) ) ( not ( = ?auto_74145 ?auto_74150 ) ) ( not ( = ?auto_74145 ?auto_74151 ) ) ( not ( = ?auto_74145 ?auto_74152 ) ) ( not ( = ?auto_74146 ?auto_74147 ) ) ( not ( = ?auto_74146 ?auto_74148 ) ) ( not ( = ?auto_74146 ?auto_74149 ) ) ( not ( = ?auto_74146 ?auto_74150 ) ) ( not ( = ?auto_74146 ?auto_74151 ) ) ( not ( = ?auto_74146 ?auto_74152 ) ) ( not ( = ?auto_74147 ?auto_74148 ) ) ( not ( = ?auto_74147 ?auto_74149 ) ) ( not ( = ?auto_74147 ?auto_74150 ) ) ( not ( = ?auto_74147 ?auto_74151 ) ) ( not ( = ?auto_74147 ?auto_74152 ) ) ( not ( = ?auto_74148 ?auto_74149 ) ) ( not ( = ?auto_74148 ?auto_74150 ) ) ( not ( = ?auto_74148 ?auto_74151 ) ) ( not ( = ?auto_74148 ?auto_74152 ) ) ( not ( = ?auto_74149 ?auto_74150 ) ) ( not ( = ?auto_74149 ?auto_74151 ) ) ( not ( = ?auto_74149 ?auto_74152 ) ) ( not ( = ?auto_74150 ?auto_74151 ) ) ( not ( = ?auto_74150 ?auto_74152 ) ) ( not ( = ?auto_74151 ?auto_74152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74151 ?auto_74152 )
      ( !STACK ?auto_74151 ?auto_74150 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_74178 - BLOCK
      ?auto_74179 - BLOCK
      ?auto_74180 - BLOCK
      ?auto_74181 - BLOCK
      ?auto_74182 - BLOCK
      ?auto_74183 - BLOCK
      ?auto_74184 - BLOCK
      ?auto_74185 - BLOCK
    )
    :vars
    (
      ?auto_74186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74185 ?auto_74186 ) ( ON-TABLE ?auto_74178 ) ( ON ?auto_74179 ?auto_74178 ) ( ON ?auto_74180 ?auto_74179 ) ( ON ?auto_74181 ?auto_74180 ) ( ON ?auto_74182 ?auto_74181 ) ( ON ?auto_74183 ?auto_74182 ) ( not ( = ?auto_74178 ?auto_74179 ) ) ( not ( = ?auto_74178 ?auto_74180 ) ) ( not ( = ?auto_74178 ?auto_74181 ) ) ( not ( = ?auto_74178 ?auto_74182 ) ) ( not ( = ?auto_74178 ?auto_74183 ) ) ( not ( = ?auto_74178 ?auto_74184 ) ) ( not ( = ?auto_74178 ?auto_74185 ) ) ( not ( = ?auto_74178 ?auto_74186 ) ) ( not ( = ?auto_74179 ?auto_74180 ) ) ( not ( = ?auto_74179 ?auto_74181 ) ) ( not ( = ?auto_74179 ?auto_74182 ) ) ( not ( = ?auto_74179 ?auto_74183 ) ) ( not ( = ?auto_74179 ?auto_74184 ) ) ( not ( = ?auto_74179 ?auto_74185 ) ) ( not ( = ?auto_74179 ?auto_74186 ) ) ( not ( = ?auto_74180 ?auto_74181 ) ) ( not ( = ?auto_74180 ?auto_74182 ) ) ( not ( = ?auto_74180 ?auto_74183 ) ) ( not ( = ?auto_74180 ?auto_74184 ) ) ( not ( = ?auto_74180 ?auto_74185 ) ) ( not ( = ?auto_74180 ?auto_74186 ) ) ( not ( = ?auto_74181 ?auto_74182 ) ) ( not ( = ?auto_74181 ?auto_74183 ) ) ( not ( = ?auto_74181 ?auto_74184 ) ) ( not ( = ?auto_74181 ?auto_74185 ) ) ( not ( = ?auto_74181 ?auto_74186 ) ) ( not ( = ?auto_74182 ?auto_74183 ) ) ( not ( = ?auto_74182 ?auto_74184 ) ) ( not ( = ?auto_74182 ?auto_74185 ) ) ( not ( = ?auto_74182 ?auto_74186 ) ) ( not ( = ?auto_74183 ?auto_74184 ) ) ( not ( = ?auto_74183 ?auto_74185 ) ) ( not ( = ?auto_74183 ?auto_74186 ) ) ( not ( = ?auto_74184 ?auto_74185 ) ) ( not ( = ?auto_74184 ?auto_74186 ) ) ( not ( = ?auto_74185 ?auto_74186 ) ) ( CLEAR ?auto_74183 ) ( ON ?auto_74184 ?auto_74185 ) ( CLEAR ?auto_74184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74178 ?auto_74179 ?auto_74180 ?auto_74181 ?auto_74182 ?auto_74183 ?auto_74184 )
      ( MAKE-8PILE ?auto_74178 ?auto_74179 ?auto_74180 ?auto_74181 ?auto_74182 ?auto_74183 ?auto_74184 ?auto_74185 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_74212 - BLOCK
      ?auto_74213 - BLOCK
      ?auto_74214 - BLOCK
      ?auto_74215 - BLOCK
      ?auto_74216 - BLOCK
      ?auto_74217 - BLOCK
      ?auto_74218 - BLOCK
      ?auto_74219 - BLOCK
    )
    :vars
    (
      ?auto_74220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74219 ?auto_74220 ) ( ON-TABLE ?auto_74212 ) ( ON ?auto_74213 ?auto_74212 ) ( ON ?auto_74214 ?auto_74213 ) ( ON ?auto_74215 ?auto_74214 ) ( ON ?auto_74216 ?auto_74215 ) ( not ( = ?auto_74212 ?auto_74213 ) ) ( not ( = ?auto_74212 ?auto_74214 ) ) ( not ( = ?auto_74212 ?auto_74215 ) ) ( not ( = ?auto_74212 ?auto_74216 ) ) ( not ( = ?auto_74212 ?auto_74217 ) ) ( not ( = ?auto_74212 ?auto_74218 ) ) ( not ( = ?auto_74212 ?auto_74219 ) ) ( not ( = ?auto_74212 ?auto_74220 ) ) ( not ( = ?auto_74213 ?auto_74214 ) ) ( not ( = ?auto_74213 ?auto_74215 ) ) ( not ( = ?auto_74213 ?auto_74216 ) ) ( not ( = ?auto_74213 ?auto_74217 ) ) ( not ( = ?auto_74213 ?auto_74218 ) ) ( not ( = ?auto_74213 ?auto_74219 ) ) ( not ( = ?auto_74213 ?auto_74220 ) ) ( not ( = ?auto_74214 ?auto_74215 ) ) ( not ( = ?auto_74214 ?auto_74216 ) ) ( not ( = ?auto_74214 ?auto_74217 ) ) ( not ( = ?auto_74214 ?auto_74218 ) ) ( not ( = ?auto_74214 ?auto_74219 ) ) ( not ( = ?auto_74214 ?auto_74220 ) ) ( not ( = ?auto_74215 ?auto_74216 ) ) ( not ( = ?auto_74215 ?auto_74217 ) ) ( not ( = ?auto_74215 ?auto_74218 ) ) ( not ( = ?auto_74215 ?auto_74219 ) ) ( not ( = ?auto_74215 ?auto_74220 ) ) ( not ( = ?auto_74216 ?auto_74217 ) ) ( not ( = ?auto_74216 ?auto_74218 ) ) ( not ( = ?auto_74216 ?auto_74219 ) ) ( not ( = ?auto_74216 ?auto_74220 ) ) ( not ( = ?auto_74217 ?auto_74218 ) ) ( not ( = ?auto_74217 ?auto_74219 ) ) ( not ( = ?auto_74217 ?auto_74220 ) ) ( not ( = ?auto_74218 ?auto_74219 ) ) ( not ( = ?auto_74218 ?auto_74220 ) ) ( not ( = ?auto_74219 ?auto_74220 ) ) ( ON ?auto_74218 ?auto_74219 ) ( CLEAR ?auto_74216 ) ( ON ?auto_74217 ?auto_74218 ) ( CLEAR ?auto_74217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74212 ?auto_74213 ?auto_74214 ?auto_74215 ?auto_74216 ?auto_74217 )
      ( MAKE-8PILE ?auto_74212 ?auto_74213 ?auto_74214 ?auto_74215 ?auto_74216 ?auto_74217 ?auto_74218 ?auto_74219 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_74246 - BLOCK
      ?auto_74247 - BLOCK
      ?auto_74248 - BLOCK
      ?auto_74249 - BLOCK
      ?auto_74250 - BLOCK
      ?auto_74251 - BLOCK
      ?auto_74252 - BLOCK
      ?auto_74253 - BLOCK
    )
    :vars
    (
      ?auto_74254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74253 ?auto_74254 ) ( ON-TABLE ?auto_74246 ) ( ON ?auto_74247 ?auto_74246 ) ( ON ?auto_74248 ?auto_74247 ) ( ON ?auto_74249 ?auto_74248 ) ( not ( = ?auto_74246 ?auto_74247 ) ) ( not ( = ?auto_74246 ?auto_74248 ) ) ( not ( = ?auto_74246 ?auto_74249 ) ) ( not ( = ?auto_74246 ?auto_74250 ) ) ( not ( = ?auto_74246 ?auto_74251 ) ) ( not ( = ?auto_74246 ?auto_74252 ) ) ( not ( = ?auto_74246 ?auto_74253 ) ) ( not ( = ?auto_74246 ?auto_74254 ) ) ( not ( = ?auto_74247 ?auto_74248 ) ) ( not ( = ?auto_74247 ?auto_74249 ) ) ( not ( = ?auto_74247 ?auto_74250 ) ) ( not ( = ?auto_74247 ?auto_74251 ) ) ( not ( = ?auto_74247 ?auto_74252 ) ) ( not ( = ?auto_74247 ?auto_74253 ) ) ( not ( = ?auto_74247 ?auto_74254 ) ) ( not ( = ?auto_74248 ?auto_74249 ) ) ( not ( = ?auto_74248 ?auto_74250 ) ) ( not ( = ?auto_74248 ?auto_74251 ) ) ( not ( = ?auto_74248 ?auto_74252 ) ) ( not ( = ?auto_74248 ?auto_74253 ) ) ( not ( = ?auto_74248 ?auto_74254 ) ) ( not ( = ?auto_74249 ?auto_74250 ) ) ( not ( = ?auto_74249 ?auto_74251 ) ) ( not ( = ?auto_74249 ?auto_74252 ) ) ( not ( = ?auto_74249 ?auto_74253 ) ) ( not ( = ?auto_74249 ?auto_74254 ) ) ( not ( = ?auto_74250 ?auto_74251 ) ) ( not ( = ?auto_74250 ?auto_74252 ) ) ( not ( = ?auto_74250 ?auto_74253 ) ) ( not ( = ?auto_74250 ?auto_74254 ) ) ( not ( = ?auto_74251 ?auto_74252 ) ) ( not ( = ?auto_74251 ?auto_74253 ) ) ( not ( = ?auto_74251 ?auto_74254 ) ) ( not ( = ?auto_74252 ?auto_74253 ) ) ( not ( = ?auto_74252 ?auto_74254 ) ) ( not ( = ?auto_74253 ?auto_74254 ) ) ( ON ?auto_74252 ?auto_74253 ) ( ON ?auto_74251 ?auto_74252 ) ( CLEAR ?auto_74249 ) ( ON ?auto_74250 ?auto_74251 ) ( CLEAR ?auto_74250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74246 ?auto_74247 ?auto_74248 ?auto_74249 ?auto_74250 )
      ( MAKE-8PILE ?auto_74246 ?auto_74247 ?auto_74248 ?auto_74249 ?auto_74250 ?auto_74251 ?auto_74252 ?auto_74253 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_74280 - BLOCK
      ?auto_74281 - BLOCK
      ?auto_74282 - BLOCK
      ?auto_74283 - BLOCK
      ?auto_74284 - BLOCK
      ?auto_74285 - BLOCK
      ?auto_74286 - BLOCK
      ?auto_74287 - BLOCK
    )
    :vars
    (
      ?auto_74288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74287 ?auto_74288 ) ( ON-TABLE ?auto_74280 ) ( ON ?auto_74281 ?auto_74280 ) ( ON ?auto_74282 ?auto_74281 ) ( not ( = ?auto_74280 ?auto_74281 ) ) ( not ( = ?auto_74280 ?auto_74282 ) ) ( not ( = ?auto_74280 ?auto_74283 ) ) ( not ( = ?auto_74280 ?auto_74284 ) ) ( not ( = ?auto_74280 ?auto_74285 ) ) ( not ( = ?auto_74280 ?auto_74286 ) ) ( not ( = ?auto_74280 ?auto_74287 ) ) ( not ( = ?auto_74280 ?auto_74288 ) ) ( not ( = ?auto_74281 ?auto_74282 ) ) ( not ( = ?auto_74281 ?auto_74283 ) ) ( not ( = ?auto_74281 ?auto_74284 ) ) ( not ( = ?auto_74281 ?auto_74285 ) ) ( not ( = ?auto_74281 ?auto_74286 ) ) ( not ( = ?auto_74281 ?auto_74287 ) ) ( not ( = ?auto_74281 ?auto_74288 ) ) ( not ( = ?auto_74282 ?auto_74283 ) ) ( not ( = ?auto_74282 ?auto_74284 ) ) ( not ( = ?auto_74282 ?auto_74285 ) ) ( not ( = ?auto_74282 ?auto_74286 ) ) ( not ( = ?auto_74282 ?auto_74287 ) ) ( not ( = ?auto_74282 ?auto_74288 ) ) ( not ( = ?auto_74283 ?auto_74284 ) ) ( not ( = ?auto_74283 ?auto_74285 ) ) ( not ( = ?auto_74283 ?auto_74286 ) ) ( not ( = ?auto_74283 ?auto_74287 ) ) ( not ( = ?auto_74283 ?auto_74288 ) ) ( not ( = ?auto_74284 ?auto_74285 ) ) ( not ( = ?auto_74284 ?auto_74286 ) ) ( not ( = ?auto_74284 ?auto_74287 ) ) ( not ( = ?auto_74284 ?auto_74288 ) ) ( not ( = ?auto_74285 ?auto_74286 ) ) ( not ( = ?auto_74285 ?auto_74287 ) ) ( not ( = ?auto_74285 ?auto_74288 ) ) ( not ( = ?auto_74286 ?auto_74287 ) ) ( not ( = ?auto_74286 ?auto_74288 ) ) ( not ( = ?auto_74287 ?auto_74288 ) ) ( ON ?auto_74286 ?auto_74287 ) ( ON ?auto_74285 ?auto_74286 ) ( ON ?auto_74284 ?auto_74285 ) ( CLEAR ?auto_74282 ) ( ON ?auto_74283 ?auto_74284 ) ( CLEAR ?auto_74283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74280 ?auto_74281 ?auto_74282 ?auto_74283 )
      ( MAKE-8PILE ?auto_74280 ?auto_74281 ?auto_74282 ?auto_74283 ?auto_74284 ?auto_74285 ?auto_74286 ?auto_74287 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_74314 - BLOCK
      ?auto_74315 - BLOCK
      ?auto_74316 - BLOCK
      ?auto_74317 - BLOCK
      ?auto_74318 - BLOCK
      ?auto_74319 - BLOCK
      ?auto_74320 - BLOCK
      ?auto_74321 - BLOCK
    )
    :vars
    (
      ?auto_74322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74321 ?auto_74322 ) ( ON-TABLE ?auto_74314 ) ( ON ?auto_74315 ?auto_74314 ) ( not ( = ?auto_74314 ?auto_74315 ) ) ( not ( = ?auto_74314 ?auto_74316 ) ) ( not ( = ?auto_74314 ?auto_74317 ) ) ( not ( = ?auto_74314 ?auto_74318 ) ) ( not ( = ?auto_74314 ?auto_74319 ) ) ( not ( = ?auto_74314 ?auto_74320 ) ) ( not ( = ?auto_74314 ?auto_74321 ) ) ( not ( = ?auto_74314 ?auto_74322 ) ) ( not ( = ?auto_74315 ?auto_74316 ) ) ( not ( = ?auto_74315 ?auto_74317 ) ) ( not ( = ?auto_74315 ?auto_74318 ) ) ( not ( = ?auto_74315 ?auto_74319 ) ) ( not ( = ?auto_74315 ?auto_74320 ) ) ( not ( = ?auto_74315 ?auto_74321 ) ) ( not ( = ?auto_74315 ?auto_74322 ) ) ( not ( = ?auto_74316 ?auto_74317 ) ) ( not ( = ?auto_74316 ?auto_74318 ) ) ( not ( = ?auto_74316 ?auto_74319 ) ) ( not ( = ?auto_74316 ?auto_74320 ) ) ( not ( = ?auto_74316 ?auto_74321 ) ) ( not ( = ?auto_74316 ?auto_74322 ) ) ( not ( = ?auto_74317 ?auto_74318 ) ) ( not ( = ?auto_74317 ?auto_74319 ) ) ( not ( = ?auto_74317 ?auto_74320 ) ) ( not ( = ?auto_74317 ?auto_74321 ) ) ( not ( = ?auto_74317 ?auto_74322 ) ) ( not ( = ?auto_74318 ?auto_74319 ) ) ( not ( = ?auto_74318 ?auto_74320 ) ) ( not ( = ?auto_74318 ?auto_74321 ) ) ( not ( = ?auto_74318 ?auto_74322 ) ) ( not ( = ?auto_74319 ?auto_74320 ) ) ( not ( = ?auto_74319 ?auto_74321 ) ) ( not ( = ?auto_74319 ?auto_74322 ) ) ( not ( = ?auto_74320 ?auto_74321 ) ) ( not ( = ?auto_74320 ?auto_74322 ) ) ( not ( = ?auto_74321 ?auto_74322 ) ) ( ON ?auto_74320 ?auto_74321 ) ( ON ?auto_74319 ?auto_74320 ) ( ON ?auto_74318 ?auto_74319 ) ( ON ?auto_74317 ?auto_74318 ) ( CLEAR ?auto_74315 ) ( ON ?auto_74316 ?auto_74317 ) ( CLEAR ?auto_74316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74314 ?auto_74315 ?auto_74316 )
      ( MAKE-8PILE ?auto_74314 ?auto_74315 ?auto_74316 ?auto_74317 ?auto_74318 ?auto_74319 ?auto_74320 ?auto_74321 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_74348 - BLOCK
      ?auto_74349 - BLOCK
      ?auto_74350 - BLOCK
      ?auto_74351 - BLOCK
      ?auto_74352 - BLOCK
      ?auto_74353 - BLOCK
      ?auto_74354 - BLOCK
      ?auto_74355 - BLOCK
    )
    :vars
    (
      ?auto_74356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74355 ?auto_74356 ) ( ON-TABLE ?auto_74348 ) ( not ( = ?auto_74348 ?auto_74349 ) ) ( not ( = ?auto_74348 ?auto_74350 ) ) ( not ( = ?auto_74348 ?auto_74351 ) ) ( not ( = ?auto_74348 ?auto_74352 ) ) ( not ( = ?auto_74348 ?auto_74353 ) ) ( not ( = ?auto_74348 ?auto_74354 ) ) ( not ( = ?auto_74348 ?auto_74355 ) ) ( not ( = ?auto_74348 ?auto_74356 ) ) ( not ( = ?auto_74349 ?auto_74350 ) ) ( not ( = ?auto_74349 ?auto_74351 ) ) ( not ( = ?auto_74349 ?auto_74352 ) ) ( not ( = ?auto_74349 ?auto_74353 ) ) ( not ( = ?auto_74349 ?auto_74354 ) ) ( not ( = ?auto_74349 ?auto_74355 ) ) ( not ( = ?auto_74349 ?auto_74356 ) ) ( not ( = ?auto_74350 ?auto_74351 ) ) ( not ( = ?auto_74350 ?auto_74352 ) ) ( not ( = ?auto_74350 ?auto_74353 ) ) ( not ( = ?auto_74350 ?auto_74354 ) ) ( not ( = ?auto_74350 ?auto_74355 ) ) ( not ( = ?auto_74350 ?auto_74356 ) ) ( not ( = ?auto_74351 ?auto_74352 ) ) ( not ( = ?auto_74351 ?auto_74353 ) ) ( not ( = ?auto_74351 ?auto_74354 ) ) ( not ( = ?auto_74351 ?auto_74355 ) ) ( not ( = ?auto_74351 ?auto_74356 ) ) ( not ( = ?auto_74352 ?auto_74353 ) ) ( not ( = ?auto_74352 ?auto_74354 ) ) ( not ( = ?auto_74352 ?auto_74355 ) ) ( not ( = ?auto_74352 ?auto_74356 ) ) ( not ( = ?auto_74353 ?auto_74354 ) ) ( not ( = ?auto_74353 ?auto_74355 ) ) ( not ( = ?auto_74353 ?auto_74356 ) ) ( not ( = ?auto_74354 ?auto_74355 ) ) ( not ( = ?auto_74354 ?auto_74356 ) ) ( not ( = ?auto_74355 ?auto_74356 ) ) ( ON ?auto_74354 ?auto_74355 ) ( ON ?auto_74353 ?auto_74354 ) ( ON ?auto_74352 ?auto_74353 ) ( ON ?auto_74351 ?auto_74352 ) ( ON ?auto_74350 ?auto_74351 ) ( CLEAR ?auto_74348 ) ( ON ?auto_74349 ?auto_74350 ) ( CLEAR ?auto_74349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74348 ?auto_74349 )
      ( MAKE-8PILE ?auto_74348 ?auto_74349 ?auto_74350 ?auto_74351 ?auto_74352 ?auto_74353 ?auto_74354 ?auto_74355 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_74382 - BLOCK
      ?auto_74383 - BLOCK
      ?auto_74384 - BLOCK
      ?auto_74385 - BLOCK
      ?auto_74386 - BLOCK
      ?auto_74387 - BLOCK
      ?auto_74388 - BLOCK
      ?auto_74389 - BLOCK
    )
    :vars
    (
      ?auto_74390 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74389 ?auto_74390 ) ( not ( = ?auto_74382 ?auto_74383 ) ) ( not ( = ?auto_74382 ?auto_74384 ) ) ( not ( = ?auto_74382 ?auto_74385 ) ) ( not ( = ?auto_74382 ?auto_74386 ) ) ( not ( = ?auto_74382 ?auto_74387 ) ) ( not ( = ?auto_74382 ?auto_74388 ) ) ( not ( = ?auto_74382 ?auto_74389 ) ) ( not ( = ?auto_74382 ?auto_74390 ) ) ( not ( = ?auto_74383 ?auto_74384 ) ) ( not ( = ?auto_74383 ?auto_74385 ) ) ( not ( = ?auto_74383 ?auto_74386 ) ) ( not ( = ?auto_74383 ?auto_74387 ) ) ( not ( = ?auto_74383 ?auto_74388 ) ) ( not ( = ?auto_74383 ?auto_74389 ) ) ( not ( = ?auto_74383 ?auto_74390 ) ) ( not ( = ?auto_74384 ?auto_74385 ) ) ( not ( = ?auto_74384 ?auto_74386 ) ) ( not ( = ?auto_74384 ?auto_74387 ) ) ( not ( = ?auto_74384 ?auto_74388 ) ) ( not ( = ?auto_74384 ?auto_74389 ) ) ( not ( = ?auto_74384 ?auto_74390 ) ) ( not ( = ?auto_74385 ?auto_74386 ) ) ( not ( = ?auto_74385 ?auto_74387 ) ) ( not ( = ?auto_74385 ?auto_74388 ) ) ( not ( = ?auto_74385 ?auto_74389 ) ) ( not ( = ?auto_74385 ?auto_74390 ) ) ( not ( = ?auto_74386 ?auto_74387 ) ) ( not ( = ?auto_74386 ?auto_74388 ) ) ( not ( = ?auto_74386 ?auto_74389 ) ) ( not ( = ?auto_74386 ?auto_74390 ) ) ( not ( = ?auto_74387 ?auto_74388 ) ) ( not ( = ?auto_74387 ?auto_74389 ) ) ( not ( = ?auto_74387 ?auto_74390 ) ) ( not ( = ?auto_74388 ?auto_74389 ) ) ( not ( = ?auto_74388 ?auto_74390 ) ) ( not ( = ?auto_74389 ?auto_74390 ) ) ( ON ?auto_74388 ?auto_74389 ) ( ON ?auto_74387 ?auto_74388 ) ( ON ?auto_74386 ?auto_74387 ) ( ON ?auto_74385 ?auto_74386 ) ( ON ?auto_74384 ?auto_74385 ) ( ON ?auto_74383 ?auto_74384 ) ( ON ?auto_74382 ?auto_74383 ) ( CLEAR ?auto_74382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74382 )
      ( MAKE-8PILE ?auto_74382 ?auto_74383 ?auto_74384 ?auto_74385 ?auto_74386 ?auto_74387 ?auto_74388 ?auto_74389 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_74417 - BLOCK
      ?auto_74418 - BLOCK
      ?auto_74419 - BLOCK
      ?auto_74420 - BLOCK
      ?auto_74421 - BLOCK
      ?auto_74422 - BLOCK
      ?auto_74423 - BLOCK
      ?auto_74424 - BLOCK
      ?auto_74425 - BLOCK
    )
    :vars
    (
      ?auto_74426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74424 ) ( ON ?auto_74425 ?auto_74426 ) ( CLEAR ?auto_74425 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74417 ) ( ON ?auto_74418 ?auto_74417 ) ( ON ?auto_74419 ?auto_74418 ) ( ON ?auto_74420 ?auto_74419 ) ( ON ?auto_74421 ?auto_74420 ) ( ON ?auto_74422 ?auto_74421 ) ( ON ?auto_74423 ?auto_74422 ) ( ON ?auto_74424 ?auto_74423 ) ( not ( = ?auto_74417 ?auto_74418 ) ) ( not ( = ?auto_74417 ?auto_74419 ) ) ( not ( = ?auto_74417 ?auto_74420 ) ) ( not ( = ?auto_74417 ?auto_74421 ) ) ( not ( = ?auto_74417 ?auto_74422 ) ) ( not ( = ?auto_74417 ?auto_74423 ) ) ( not ( = ?auto_74417 ?auto_74424 ) ) ( not ( = ?auto_74417 ?auto_74425 ) ) ( not ( = ?auto_74417 ?auto_74426 ) ) ( not ( = ?auto_74418 ?auto_74419 ) ) ( not ( = ?auto_74418 ?auto_74420 ) ) ( not ( = ?auto_74418 ?auto_74421 ) ) ( not ( = ?auto_74418 ?auto_74422 ) ) ( not ( = ?auto_74418 ?auto_74423 ) ) ( not ( = ?auto_74418 ?auto_74424 ) ) ( not ( = ?auto_74418 ?auto_74425 ) ) ( not ( = ?auto_74418 ?auto_74426 ) ) ( not ( = ?auto_74419 ?auto_74420 ) ) ( not ( = ?auto_74419 ?auto_74421 ) ) ( not ( = ?auto_74419 ?auto_74422 ) ) ( not ( = ?auto_74419 ?auto_74423 ) ) ( not ( = ?auto_74419 ?auto_74424 ) ) ( not ( = ?auto_74419 ?auto_74425 ) ) ( not ( = ?auto_74419 ?auto_74426 ) ) ( not ( = ?auto_74420 ?auto_74421 ) ) ( not ( = ?auto_74420 ?auto_74422 ) ) ( not ( = ?auto_74420 ?auto_74423 ) ) ( not ( = ?auto_74420 ?auto_74424 ) ) ( not ( = ?auto_74420 ?auto_74425 ) ) ( not ( = ?auto_74420 ?auto_74426 ) ) ( not ( = ?auto_74421 ?auto_74422 ) ) ( not ( = ?auto_74421 ?auto_74423 ) ) ( not ( = ?auto_74421 ?auto_74424 ) ) ( not ( = ?auto_74421 ?auto_74425 ) ) ( not ( = ?auto_74421 ?auto_74426 ) ) ( not ( = ?auto_74422 ?auto_74423 ) ) ( not ( = ?auto_74422 ?auto_74424 ) ) ( not ( = ?auto_74422 ?auto_74425 ) ) ( not ( = ?auto_74422 ?auto_74426 ) ) ( not ( = ?auto_74423 ?auto_74424 ) ) ( not ( = ?auto_74423 ?auto_74425 ) ) ( not ( = ?auto_74423 ?auto_74426 ) ) ( not ( = ?auto_74424 ?auto_74425 ) ) ( not ( = ?auto_74424 ?auto_74426 ) ) ( not ( = ?auto_74425 ?auto_74426 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74425 ?auto_74426 )
      ( !STACK ?auto_74425 ?auto_74424 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_74455 - BLOCK
      ?auto_74456 - BLOCK
      ?auto_74457 - BLOCK
      ?auto_74458 - BLOCK
      ?auto_74459 - BLOCK
      ?auto_74460 - BLOCK
      ?auto_74461 - BLOCK
      ?auto_74462 - BLOCK
      ?auto_74463 - BLOCK
    )
    :vars
    (
      ?auto_74464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74463 ?auto_74464 ) ( ON-TABLE ?auto_74455 ) ( ON ?auto_74456 ?auto_74455 ) ( ON ?auto_74457 ?auto_74456 ) ( ON ?auto_74458 ?auto_74457 ) ( ON ?auto_74459 ?auto_74458 ) ( ON ?auto_74460 ?auto_74459 ) ( ON ?auto_74461 ?auto_74460 ) ( not ( = ?auto_74455 ?auto_74456 ) ) ( not ( = ?auto_74455 ?auto_74457 ) ) ( not ( = ?auto_74455 ?auto_74458 ) ) ( not ( = ?auto_74455 ?auto_74459 ) ) ( not ( = ?auto_74455 ?auto_74460 ) ) ( not ( = ?auto_74455 ?auto_74461 ) ) ( not ( = ?auto_74455 ?auto_74462 ) ) ( not ( = ?auto_74455 ?auto_74463 ) ) ( not ( = ?auto_74455 ?auto_74464 ) ) ( not ( = ?auto_74456 ?auto_74457 ) ) ( not ( = ?auto_74456 ?auto_74458 ) ) ( not ( = ?auto_74456 ?auto_74459 ) ) ( not ( = ?auto_74456 ?auto_74460 ) ) ( not ( = ?auto_74456 ?auto_74461 ) ) ( not ( = ?auto_74456 ?auto_74462 ) ) ( not ( = ?auto_74456 ?auto_74463 ) ) ( not ( = ?auto_74456 ?auto_74464 ) ) ( not ( = ?auto_74457 ?auto_74458 ) ) ( not ( = ?auto_74457 ?auto_74459 ) ) ( not ( = ?auto_74457 ?auto_74460 ) ) ( not ( = ?auto_74457 ?auto_74461 ) ) ( not ( = ?auto_74457 ?auto_74462 ) ) ( not ( = ?auto_74457 ?auto_74463 ) ) ( not ( = ?auto_74457 ?auto_74464 ) ) ( not ( = ?auto_74458 ?auto_74459 ) ) ( not ( = ?auto_74458 ?auto_74460 ) ) ( not ( = ?auto_74458 ?auto_74461 ) ) ( not ( = ?auto_74458 ?auto_74462 ) ) ( not ( = ?auto_74458 ?auto_74463 ) ) ( not ( = ?auto_74458 ?auto_74464 ) ) ( not ( = ?auto_74459 ?auto_74460 ) ) ( not ( = ?auto_74459 ?auto_74461 ) ) ( not ( = ?auto_74459 ?auto_74462 ) ) ( not ( = ?auto_74459 ?auto_74463 ) ) ( not ( = ?auto_74459 ?auto_74464 ) ) ( not ( = ?auto_74460 ?auto_74461 ) ) ( not ( = ?auto_74460 ?auto_74462 ) ) ( not ( = ?auto_74460 ?auto_74463 ) ) ( not ( = ?auto_74460 ?auto_74464 ) ) ( not ( = ?auto_74461 ?auto_74462 ) ) ( not ( = ?auto_74461 ?auto_74463 ) ) ( not ( = ?auto_74461 ?auto_74464 ) ) ( not ( = ?auto_74462 ?auto_74463 ) ) ( not ( = ?auto_74462 ?auto_74464 ) ) ( not ( = ?auto_74463 ?auto_74464 ) ) ( CLEAR ?auto_74461 ) ( ON ?auto_74462 ?auto_74463 ) ( CLEAR ?auto_74462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_74455 ?auto_74456 ?auto_74457 ?auto_74458 ?auto_74459 ?auto_74460 ?auto_74461 ?auto_74462 )
      ( MAKE-9PILE ?auto_74455 ?auto_74456 ?auto_74457 ?auto_74458 ?auto_74459 ?auto_74460 ?auto_74461 ?auto_74462 ?auto_74463 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_74493 - BLOCK
      ?auto_74494 - BLOCK
      ?auto_74495 - BLOCK
      ?auto_74496 - BLOCK
      ?auto_74497 - BLOCK
      ?auto_74498 - BLOCK
      ?auto_74499 - BLOCK
      ?auto_74500 - BLOCK
      ?auto_74501 - BLOCK
    )
    :vars
    (
      ?auto_74502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74501 ?auto_74502 ) ( ON-TABLE ?auto_74493 ) ( ON ?auto_74494 ?auto_74493 ) ( ON ?auto_74495 ?auto_74494 ) ( ON ?auto_74496 ?auto_74495 ) ( ON ?auto_74497 ?auto_74496 ) ( ON ?auto_74498 ?auto_74497 ) ( not ( = ?auto_74493 ?auto_74494 ) ) ( not ( = ?auto_74493 ?auto_74495 ) ) ( not ( = ?auto_74493 ?auto_74496 ) ) ( not ( = ?auto_74493 ?auto_74497 ) ) ( not ( = ?auto_74493 ?auto_74498 ) ) ( not ( = ?auto_74493 ?auto_74499 ) ) ( not ( = ?auto_74493 ?auto_74500 ) ) ( not ( = ?auto_74493 ?auto_74501 ) ) ( not ( = ?auto_74493 ?auto_74502 ) ) ( not ( = ?auto_74494 ?auto_74495 ) ) ( not ( = ?auto_74494 ?auto_74496 ) ) ( not ( = ?auto_74494 ?auto_74497 ) ) ( not ( = ?auto_74494 ?auto_74498 ) ) ( not ( = ?auto_74494 ?auto_74499 ) ) ( not ( = ?auto_74494 ?auto_74500 ) ) ( not ( = ?auto_74494 ?auto_74501 ) ) ( not ( = ?auto_74494 ?auto_74502 ) ) ( not ( = ?auto_74495 ?auto_74496 ) ) ( not ( = ?auto_74495 ?auto_74497 ) ) ( not ( = ?auto_74495 ?auto_74498 ) ) ( not ( = ?auto_74495 ?auto_74499 ) ) ( not ( = ?auto_74495 ?auto_74500 ) ) ( not ( = ?auto_74495 ?auto_74501 ) ) ( not ( = ?auto_74495 ?auto_74502 ) ) ( not ( = ?auto_74496 ?auto_74497 ) ) ( not ( = ?auto_74496 ?auto_74498 ) ) ( not ( = ?auto_74496 ?auto_74499 ) ) ( not ( = ?auto_74496 ?auto_74500 ) ) ( not ( = ?auto_74496 ?auto_74501 ) ) ( not ( = ?auto_74496 ?auto_74502 ) ) ( not ( = ?auto_74497 ?auto_74498 ) ) ( not ( = ?auto_74497 ?auto_74499 ) ) ( not ( = ?auto_74497 ?auto_74500 ) ) ( not ( = ?auto_74497 ?auto_74501 ) ) ( not ( = ?auto_74497 ?auto_74502 ) ) ( not ( = ?auto_74498 ?auto_74499 ) ) ( not ( = ?auto_74498 ?auto_74500 ) ) ( not ( = ?auto_74498 ?auto_74501 ) ) ( not ( = ?auto_74498 ?auto_74502 ) ) ( not ( = ?auto_74499 ?auto_74500 ) ) ( not ( = ?auto_74499 ?auto_74501 ) ) ( not ( = ?auto_74499 ?auto_74502 ) ) ( not ( = ?auto_74500 ?auto_74501 ) ) ( not ( = ?auto_74500 ?auto_74502 ) ) ( not ( = ?auto_74501 ?auto_74502 ) ) ( ON ?auto_74500 ?auto_74501 ) ( CLEAR ?auto_74498 ) ( ON ?auto_74499 ?auto_74500 ) ( CLEAR ?auto_74499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74493 ?auto_74494 ?auto_74495 ?auto_74496 ?auto_74497 ?auto_74498 ?auto_74499 )
      ( MAKE-9PILE ?auto_74493 ?auto_74494 ?auto_74495 ?auto_74496 ?auto_74497 ?auto_74498 ?auto_74499 ?auto_74500 ?auto_74501 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_74531 - BLOCK
      ?auto_74532 - BLOCK
      ?auto_74533 - BLOCK
      ?auto_74534 - BLOCK
      ?auto_74535 - BLOCK
      ?auto_74536 - BLOCK
      ?auto_74537 - BLOCK
      ?auto_74538 - BLOCK
      ?auto_74539 - BLOCK
    )
    :vars
    (
      ?auto_74540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74539 ?auto_74540 ) ( ON-TABLE ?auto_74531 ) ( ON ?auto_74532 ?auto_74531 ) ( ON ?auto_74533 ?auto_74532 ) ( ON ?auto_74534 ?auto_74533 ) ( ON ?auto_74535 ?auto_74534 ) ( not ( = ?auto_74531 ?auto_74532 ) ) ( not ( = ?auto_74531 ?auto_74533 ) ) ( not ( = ?auto_74531 ?auto_74534 ) ) ( not ( = ?auto_74531 ?auto_74535 ) ) ( not ( = ?auto_74531 ?auto_74536 ) ) ( not ( = ?auto_74531 ?auto_74537 ) ) ( not ( = ?auto_74531 ?auto_74538 ) ) ( not ( = ?auto_74531 ?auto_74539 ) ) ( not ( = ?auto_74531 ?auto_74540 ) ) ( not ( = ?auto_74532 ?auto_74533 ) ) ( not ( = ?auto_74532 ?auto_74534 ) ) ( not ( = ?auto_74532 ?auto_74535 ) ) ( not ( = ?auto_74532 ?auto_74536 ) ) ( not ( = ?auto_74532 ?auto_74537 ) ) ( not ( = ?auto_74532 ?auto_74538 ) ) ( not ( = ?auto_74532 ?auto_74539 ) ) ( not ( = ?auto_74532 ?auto_74540 ) ) ( not ( = ?auto_74533 ?auto_74534 ) ) ( not ( = ?auto_74533 ?auto_74535 ) ) ( not ( = ?auto_74533 ?auto_74536 ) ) ( not ( = ?auto_74533 ?auto_74537 ) ) ( not ( = ?auto_74533 ?auto_74538 ) ) ( not ( = ?auto_74533 ?auto_74539 ) ) ( not ( = ?auto_74533 ?auto_74540 ) ) ( not ( = ?auto_74534 ?auto_74535 ) ) ( not ( = ?auto_74534 ?auto_74536 ) ) ( not ( = ?auto_74534 ?auto_74537 ) ) ( not ( = ?auto_74534 ?auto_74538 ) ) ( not ( = ?auto_74534 ?auto_74539 ) ) ( not ( = ?auto_74534 ?auto_74540 ) ) ( not ( = ?auto_74535 ?auto_74536 ) ) ( not ( = ?auto_74535 ?auto_74537 ) ) ( not ( = ?auto_74535 ?auto_74538 ) ) ( not ( = ?auto_74535 ?auto_74539 ) ) ( not ( = ?auto_74535 ?auto_74540 ) ) ( not ( = ?auto_74536 ?auto_74537 ) ) ( not ( = ?auto_74536 ?auto_74538 ) ) ( not ( = ?auto_74536 ?auto_74539 ) ) ( not ( = ?auto_74536 ?auto_74540 ) ) ( not ( = ?auto_74537 ?auto_74538 ) ) ( not ( = ?auto_74537 ?auto_74539 ) ) ( not ( = ?auto_74537 ?auto_74540 ) ) ( not ( = ?auto_74538 ?auto_74539 ) ) ( not ( = ?auto_74538 ?auto_74540 ) ) ( not ( = ?auto_74539 ?auto_74540 ) ) ( ON ?auto_74538 ?auto_74539 ) ( ON ?auto_74537 ?auto_74538 ) ( CLEAR ?auto_74535 ) ( ON ?auto_74536 ?auto_74537 ) ( CLEAR ?auto_74536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74531 ?auto_74532 ?auto_74533 ?auto_74534 ?auto_74535 ?auto_74536 )
      ( MAKE-9PILE ?auto_74531 ?auto_74532 ?auto_74533 ?auto_74534 ?auto_74535 ?auto_74536 ?auto_74537 ?auto_74538 ?auto_74539 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_74569 - BLOCK
      ?auto_74570 - BLOCK
      ?auto_74571 - BLOCK
      ?auto_74572 - BLOCK
      ?auto_74573 - BLOCK
      ?auto_74574 - BLOCK
      ?auto_74575 - BLOCK
      ?auto_74576 - BLOCK
      ?auto_74577 - BLOCK
    )
    :vars
    (
      ?auto_74578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74577 ?auto_74578 ) ( ON-TABLE ?auto_74569 ) ( ON ?auto_74570 ?auto_74569 ) ( ON ?auto_74571 ?auto_74570 ) ( ON ?auto_74572 ?auto_74571 ) ( not ( = ?auto_74569 ?auto_74570 ) ) ( not ( = ?auto_74569 ?auto_74571 ) ) ( not ( = ?auto_74569 ?auto_74572 ) ) ( not ( = ?auto_74569 ?auto_74573 ) ) ( not ( = ?auto_74569 ?auto_74574 ) ) ( not ( = ?auto_74569 ?auto_74575 ) ) ( not ( = ?auto_74569 ?auto_74576 ) ) ( not ( = ?auto_74569 ?auto_74577 ) ) ( not ( = ?auto_74569 ?auto_74578 ) ) ( not ( = ?auto_74570 ?auto_74571 ) ) ( not ( = ?auto_74570 ?auto_74572 ) ) ( not ( = ?auto_74570 ?auto_74573 ) ) ( not ( = ?auto_74570 ?auto_74574 ) ) ( not ( = ?auto_74570 ?auto_74575 ) ) ( not ( = ?auto_74570 ?auto_74576 ) ) ( not ( = ?auto_74570 ?auto_74577 ) ) ( not ( = ?auto_74570 ?auto_74578 ) ) ( not ( = ?auto_74571 ?auto_74572 ) ) ( not ( = ?auto_74571 ?auto_74573 ) ) ( not ( = ?auto_74571 ?auto_74574 ) ) ( not ( = ?auto_74571 ?auto_74575 ) ) ( not ( = ?auto_74571 ?auto_74576 ) ) ( not ( = ?auto_74571 ?auto_74577 ) ) ( not ( = ?auto_74571 ?auto_74578 ) ) ( not ( = ?auto_74572 ?auto_74573 ) ) ( not ( = ?auto_74572 ?auto_74574 ) ) ( not ( = ?auto_74572 ?auto_74575 ) ) ( not ( = ?auto_74572 ?auto_74576 ) ) ( not ( = ?auto_74572 ?auto_74577 ) ) ( not ( = ?auto_74572 ?auto_74578 ) ) ( not ( = ?auto_74573 ?auto_74574 ) ) ( not ( = ?auto_74573 ?auto_74575 ) ) ( not ( = ?auto_74573 ?auto_74576 ) ) ( not ( = ?auto_74573 ?auto_74577 ) ) ( not ( = ?auto_74573 ?auto_74578 ) ) ( not ( = ?auto_74574 ?auto_74575 ) ) ( not ( = ?auto_74574 ?auto_74576 ) ) ( not ( = ?auto_74574 ?auto_74577 ) ) ( not ( = ?auto_74574 ?auto_74578 ) ) ( not ( = ?auto_74575 ?auto_74576 ) ) ( not ( = ?auto_74575 ?auto_74577 ) ) ( not ( = ?auto_74575 ?auto_74578 ) ) ( not ( = ?auto_74576 ?auto_74577 ) ) ( not ( = ?auto_74576 ?auto_74578 ) ) ( not ( = ?auto_74577 ?auto_74578 ) ) ( ON ?auto_74576 ?auto_74577 ) ( ON ?auto_74575 ?auto_74576 ) ( ON ?auto_74574 ?auto_74575 ) ( CLEAR ?auto_74572 ) ( ON ?auto_74573 ?auto_74574 ) ( CLEAR ?auto_74573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74569 ?auto_74570 ?auto_74571 ?auto_74572 ?auto_74573 )
      ( MAKE-9PILE ?auto_74569 ?auto_74570 ?auto_74571 ?auto_74572 ?auto_74573 ?auto_74574 ?auto_74575 ?auto_74576 ?auto_74577 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_74607 - BLOCK
      ?auto_74608 - BLOCK
      ?auto_74609 - BLOCK
      ?auto_74610 - BLOCK
      ?auto_74611 - BLOCK
      ?auto_74612 - BLOCK
      ?auto_74613 - BLOCK
      ?auto_74614 - BLOCK
      ?auto_74615 - BLOCK
    )
    :vars
    (
      ?auto_74616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74615 ?auto_74616 ) ( ON-TABLE ?auto_74607 ) ( ON ?auto_74608 ?auto_74607 ) ( ON ?auto_74609 ?auto_74608 ) ( not ( = ?auto_74607 ?auto_74608 ) ) ( not ( = ?auto_74607 ?auto_74609 ) ) ( not ( = ?auto_74607 ?auto_74610 ) ) ( not ( = ?auto_74607 ?auto_74611 ) ) ( not ( = ?auto_74607 ?auto_74612 ) ) ( not ( = ?auto_74607 ?auto_74613 ) ) ( not ( = ?auto_74607 ?auto_74614 ) ) ( not ( = ?auto_74607 ?auto_74615 ) ) ( not ( = ?auto_74607 ?auto_74616 ) ) ( not ( = ?auto_74608 ?auto_74609 ) ) ( not ( = ?auto_74608 ?auto_74610 ) ) ( not ( = ?auto_74608 ?auto_74611 ) ) ( not ( = ?auto_74608 ?auto_74612 ) ) ( not ( = ?auto_74608 ?auto_74613 ) ) ( not ( = ?auto_74608 ?auto_74614 ) ) ( not ( = ?auto_74608 ?auto_74615 ) ) ( not ( = ?auto_74608 ?auto_74616 ) ) ( not ( = ?auto_74609 ?auto_74610 ) ) ( not ( = ?auto_74609 ?auto_74611 ) ) ( not ( = ?auto_74609 ?auto_74612 ) ) ( not ( = ?auto_74609 ?auto_74613 ) ) ( not ( = ?auto_74609 ?auto_74614 ) ) ( not ( = ?auto_74609 ?auto_74615 ) ) ( not ( = ?auto_74609 ?auto_74616 ) ) ( not ( = ?auto_74610 ?auto_74611 ) ) ( not ( = ?auto_74610 ?auto_74612 ) ) ( not ( = ?auto_74610 ?auto_74613 ) ) ( not ( = ?auto_74610 ?auto_74614 ) ) ( not ( = ?auto_74610 ?auto_74615 ) ) ( not ( = ?auto_74610 ?auto_74616 ) ) ( not ( = ?auto_74611 ?auto_74612 ) ) ( not ( = ?auto_74611 ?auto_74613 ) ) ( not ( = ?auto_74611 ?auto_74614 ) ) ( not ( = ?auto_74611 ?auto_74615 ) ) ( not ( = ?auto_74611 ?auto_74616 ) ) ( not ( = ?auto_74612 ?auto_74613 ) ) ( not ( = ?auto_74612 ?auto_74614 ) ) ( not ( = ?auto_74612 ?auto_74615 ) ) ( not ( = ?auto_74612 ?auto_74616 ) ) ( not ( = ?auto_74613 ?auto_74614 ) ) ( not ( = ?auto_74613 ?auto_74615 ) ) ( not ( = ?auto_74613 ?auto_74616 ) ) ( not ( = ?auto_74614 ?auto_74615 ) ) ( not ( = ?auto_74614 ?auto_74616 ) ) ( not ( = ?auto_74615 ?auto_74616 ) ) ( ON ?auto_74614 ?auto_74615 ) ( ON ?auto_74613 ?auto_74614 ) ( ON ?auto_74612 ?auto_74613 ) ( ON ?auto_74611 ?auto_74612 ) ( CLEAR ?auto_74609 ) ( ON ?auto_74610 ?auto_74611 ) ( CLEAR ?auto_74610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_74607 ?auto_74608 ?auto_74609 ?auto_74610 )
      ( MAKE-9PILE ?auto_74607 ?auto_74608 ?auto_74609 ?auto_74610 ?auto_74611 ?auto_74612 ?auto_74613 ?auto_74614 ?auto_74615 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_74645 - BLOCK
      ?auto_74646 - BLOCK
      ?auto_74647 - BLOCK
      ?auto_74648 - BLOCK
      ?auto_74649 - BLOCK
      ?auto_74650 - BLOCK
      ?auto_74651 - BLOCK
      ?auto_74652 - BLOCK
      ?auto_74653 - BLOCK
    )
    :vars
    (
      ?auto_74654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74653 ?auto_74654 ) ( ON-TABLE ?auto_74645 ) ( ON ?auto_74646 ?auto_74645 ) ( not ( = ?auto_74645 ?auto_74646 ) ) ( not ( = ?auto_74645 ?auto_74647 ) ) ( not ( = ?auto_74645 ?auto_74648 ) ) ( not ( = ?auto_74645 ?auto_74649 ) ) ( not ( = ?auto_74645 ?auto_74650 ) ) ( not ( = ?auto_74645 ?auto_74651 ) ) ( not ( = ?auto_74645 ?auto_74652 ) ) ( not ( = ?auto_74645 ?auto_74653 ) ) ( not ( = ?auto_74645 ?auto_74654 ) ) ( not ( = ?auto_74646 ?auto_74647 ) ) ( not ( = ?auto_74646 ?auto_74648 ) ) ( not ( = ?auto_74646 ?auto_74649 ) ) ( not ( = ?auto_74646 ?auto_74650 ) ) ( not ( = ?auto_74646 ?auto_74651 ) ) ( not ( = ?auto_74646 ?auto_74652 ) ) ( not ( = ?auto_74646 ?auto_74653 ) ) ( not ( = ?auto_74646 ?auto_74654 ) ) ( not ( = ?auto_74647 ?auto_74648 ) ) ( not ( = ?auto_74647 ?auto_74649 ) ) ( not ( = ?auto_74647 ?auto_74650 ) ) ( not ( = ?auto_74647 ?auto_74651 ) ) ( not ( = ?auto_74647 ?auto_74652 ) ) ( not ( = ?auto_74647 ?auto_74653 ) ) ( not ( = ?auto_74647 ?auto_74654 ) ) ( not ( = ?auto_74648 ?auto_74649 ) ) ( not ( = ?auto_74648 ?auto_74650 ) ) ( not ( = ?auto_74648 ?auto_74651 ) ) ( not ( = ?auto_74648 ?auto_74652 ) ) ( not ( = ?auto_74648 ?auto_74653 ) ) ( not ( = ?auto_74648 ?auto_74654 ) ) ( not ( = ?auto_74649 ?auto_74650 ) ) ( not ( = ?auto_74649 ?auto_74651 ) ) ( not ( = ?auto_74649 ?auto_74652 ) ) ( not ( = ?auto_74649 ?auto_74653 ) ) ( not ( = ?auto_74649 ?auto_74654 ) ) ( not ( = ?auto_74650 ?auto_74651 ) ) ( not ( = ?auto_74650 ?auto_74652 ) ) ( not ( = ?auto_74650 ?auto_74653 ) ) ( not ( = ?auto_74650 ?auto_74654 ) ) ( not ( = ?auto_74651 ?auto_74652 ) ) ( not ( = ?auto_74651 ?auto_74653 ) ) ( not ( = ?auto_74651 ?auto_74654 ) ) ( not ( = ?auto_74652 ?auto_74653 ) ) ( not ( = ?auto_74652 ?auto_74654 ) ) ( not ( = ?auto_74653 ?auto_74654 ) ) ( ON ?auto_74652 ?auto_74653 ) ( ON ?auto_74651 ?auto_74652 ) ( ON ?auto_74650 ?auto_74651 ) ( ON ?auto_74649 ?auto_74650 ) ( ON ?auto_74648 ?auto_74649 ) ( CLEAR ?auto_74646 ) ( ON ?auto_74647 ?auto_74648 ) ( CLEAR ?auto_74647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_74645 ?auto_74646 ?auto_74647 )
      ( MAKE-9PILE ?auto_74645 ?auto_74646 ?auto_74647 ?auto_74648 ?auto_74649 ?auto_74650 ?auto_74651 ?auto_74652 ?auto_74653 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_74683 - BLOCK
      ?auto_74684 - BLOCK
      ?auto_74685 - BLOCK
      ?auto_74686 - BLOCK
      ?auto_74687 - BLOCK
      ?auto_74688 - BLOCK
      ?auto_74689 - BLOCK
      ?auto_74690 - BLOCK
      ?auto_74691 - BLOCK
    )
    :vars
    (
      ?auto_74692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74691 ?auto_74692 ) ( ON-TABLE ?auto_74683 ) ( not ( = ?auto_74683 ?auto_74684 ) ) ( not ( = ?auto_74683 ?auto_74685 ) ) ( not ( = ?auto_74683 ?auto_74686 ) ) ( not ( = ?auto_74683 ?auto_74687 ) ) ( not ( = ?auto_74683 ?auto_74688 ) ) ( not ( = ?auto_74683 ?auto_74689 ) ) ( not ( = ?auto_74683 ?auto_74690 ) ) ( not ( = ?auto_74683 ?auto_74691 ) ) ( not ( = ?auto_74683 ?auto_74692 ) ) ( not ( = ?auto_74684 ?auto_74685 ) ) ( not ( = ?auto_74684 ?auto_74686 ) ) ( not ( = ?auto_74684 ?auto_74687 ) ) ( not ( = ?auto_74684 ?auto_74688 ) ) ( not ( = ?auto_74684 ?auto_74689 ) ) ( not ( = ?auto_74684 ?auto_74690 ) ) ( not ( = ?auto_74684 ?auto_74691 ) ) ( not ( = ?auto_74684 ?auto_74692 ) ) ( not ( = ?auto_74685 ?auto_74686 ) ) ( not ( = ?auto_74685 ?auto_74687 ) ) ( not ( = ?auto_74685 ?auto_74688 ) ) ( not ( = ?auto_74685 ?auto_74689 ) ) ( not ( = ?auto_74685 ?auto_74690 ) ) ( not ( = ?auto_74685 ?auto_74691 ) ) ( not ( = ?auto_74685 ?auto_74692 ) ) ( not ( = ?auto_74686 ?auto_74687 ) ) ( not ( = ?auto_74686 ?auto_74688 ) ) ( not ( = ?auto_74686 ?auto_74689 ) ) ( not ( = ?auto_74686 ?auto_74690 ) ) ( not ( = ?auto_74686 ?auto_74691 ) ) ( not ( = ?auto_74686 ?auto_74692 ) ) ( not ( = ?auto_74687 ?auto_74688 ) ) ( not ( = ?auto_74687 ?auto_74689 ) ) ( not ( = ?auto_74687 ?auto_74690 ) ) ( not ( = ?auto_74687 ?auto_74691 ) ) ( not ( = ?auto_74687 ?auto_74692 ) ) ( not ( = ?auto_74688 ?auto_74689 ) ) ( not ( = ?auto_74688 ?auto_74690 ) ) ( not ( = ?auto_74688 ?auto_74691 ) ) ( not ( = ?auto_74688 ?auto_74692 ) ) ( not ( = ?auto_74689 ?auto_74690 ) ) ( not ( = ?auto_74689 ?auto_74691 ) ) ( not ( = ?auto_74689 ?auto_74692 ) ) ( not ( = ?auto_74690 ?auto_74691 ) ) ( not ( = ?auto_74690 ?auto_74692 ) ) ( not ( = ?auto_74691 ?auto_74692 ) ) ( ON ?auto_74690 ?auto_74691 ) ( ON ?auto_74689 ?auto_74690 ) ( ON ?auto_74688 ?auto_74689 ) ( ON ?auto_74687 ?auto_74688 ) ( ON ?auto_74686 ?auto_74687 ) ( ON ?auto_74685 ?auto_74686 ) ( CLEAR ?auto_74683 ) ( ON ?auto_74684 ?auto_74685 ) ( CLEAR ?auto_74684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_74683 ?auto_74684 )
      ( MAKE-9PILE ?auto_74683 ?auto_74684 ?auto_74685 ?auto_74686 ?auto_74687 ?auto_74688 ?auto_74689 ?auto_74690 ?auto_74691 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_74721 - BLOCK
      ?auto_74722 - BLOCK
      ?auto_74723 - BLOCK
      ?auto_74724 - BLOCK
      ?auto_74725 - BLOCK
      ?auto_74726 - BLOCK
      ?auto_74727 - BLOCK
      ?auto_74728 - BLOCK
      ?auto_74729 - BLOCK
    )
    :vars
    (
      ?auto_74730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74729 ?auto_74730 ) ( not ( = ?auto_74721 ?auto_74722 ) ) ( not ( = ?auto_74721 ?auto_74723 ) ) ( not ( = ?auto_74721 ?auto_74724 ) ) ( not ( = ?auto_74721 ?auto_74725 ) ) ( not ( = ?auto_74721 ?auto_74726 ) ) ( not ( = ?auto_74721 ?auto_74727 ) ) ( not ( = ?auto_74721 ?auto_74728 ) ) ( not ( = ?auto_74721 ?auto_74729 ) ) ( not ( = ?auto_74721 ?auto_74730 ) ) ( not ( = ?auto_74722 ?auto_74723 ) ) ( not ( = ?auto_74722 ?auto_74724 ) ) ( not ( = ?auto_74722 ?auto_74725 ) ) ( not ( = ?auto_74722 ?auto_74726 ) ) ( not ( = ?auto_74722 ?auto_74727 ) ) ( not ( = ?auto_74722 ?auto_74728 ) ) ( not ( = ?auto_74722 ?auto_74729 ) ) ( not ( = ?auto_74722 ?auto_74730 ) ) ( not ( = ?auto_74723 ?auto_74724 ) ) ( not ( = ?auto_74723 ?auto_74725 ) ) ( not ( = ?auto_74723 ?auto_74726 ) ) ( not ( = ?auto_74723 ?auto_74727 ) ) ( not ( = ?auto_74723 ?auto_74728 ) ) ( not ( = ?auto_74723 ?auto_74729 ) ) ( not ( = ?auto_74723 ?auto_74730 ) ) ( not ( = ?auto_74724 ?auto_74725 ) ) ( not ( = ?auto_74724 ?auto_74726 ) ) ( not ( = ?auto_74724 ?auto_74727 ) ) ( not ( = ?auto_74724 ?auto_74728 ) ) ( not ( = ?auto_74724 ?auto_74729 ) ) ( not ( = ?auto_74724 ?auto_74730 ) ) ( not ( = ?auto_74725 ?auto_74726 ) ) ( not ( = ?auto_74725 ?auto_74727 ) ) ( not ( = ?auto_74725 ?auto_74728 ) ) ( not ( = ?auto_74725 ?auto_74729 ) ) ( not ( = ?auto_74725 ?auto_74730 ) ) ( not ( = ?auto_74726 ?auto_74727 ) ) ( not ( = ?auto_74726 ?auto_74728 ) ) ( not ( = ?auto_74726 ?auto_74729 ) ) ( not ( = ?auto_74726 ?auto_74730 ) ) ( not ( = ?auto_74727 ?auto_74728 ) ) ( not ( = ?auto_74727 ?auto_74729 ) ) ( not ( = ?auto_74727 ?auto_74730 ) ) ( not ( = ?auto_74728 ?auto_74729 ) ) ( not ( = ?auto_74728 ?auto_74730 ) ) ( not ( = ?auto_74729 ?auto_74730 ) ) ( ON ?auto_74728 ?auto_74729 ) ( ON ?auto_74727 ?auto_74728 ) ( ON ?auto_74726 ?auto_74727 ) ( ON ?auto_74725 ?auto_74726 ) ( ON ?auto_74724 ?auto_74725 ) ( ON ?auto_74723 ?auto_74724 ) ( ON ?auto_74722 ?auto_74723 ) ( ON ?auto_74721 ?auto_74722 ) ( CLEAR ?auto_74721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_74721 )
      ( MAKE-9PILE ?auto_74721 ?auto_74722 ?auto_74723 ?auto_74724 ?auto_74725 ?auto_74726 ?auto_74727 ?auto_74728 ?auto_74729 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74760 - BLOCK
      ?auto_74761 - BLOCK
      ?auto_74762 - BLOCK
      ?auto_74763 - BLOCK
      ?auto_74764 - BLOCK
      ?auto_74765 - BLOCK
      ?auto_74766 - BLOCK
      ?auto_74767 - BLOCK
      ?auto_74768 - BLOCK
      ?auto_74769 - BLOCK
    )
    :vars
    (
      ?auto_74770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74768 ) ( ON ?auto_74769 ?auto_74770 ) ( CLEAR ?auto_74769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74760 ) ( ON ?auto_74761 ?auto_74760 ) ( ON ?auto_74762 ?auto_74761 ) ( ON ?auto_74763 ?auto_74762 ) ( ON ?auto_74764 ?auto_74763 ) ( ON ?auto_74765 ?auto_74764 ) ( ON ?auto_74766 ?auto_74765 ) ( ON ?auto_74767 ?auto_74766 ) ( ON ?auto_74768 ?auto_74767 ) ( not ( = ?auto_74760 ?auto_74761 ) ) ( not ( = ?auto_74760 ?auto_74762 ) ) ( not ( = ?auto_74760 ?auto_74763 ) ) ( not ( = ?auto_74760 ?auto_74764 ) ) ( not ( = ?auto_74760 ?auto_74765 ) ) ( not ( = ?auto_74760 ?auto_74766 ) ) ( not ( = ?auto_74760 ?auto_74767 ) ) ( not ( = ?auto_74760 ?auto_74768 ) ) ( not ( = ?auto_74760 ?auto_74769 ) ) ( not ( = ?auto_74760 ?auto_74770 ) ) ( not ( = ?auto_74761 ?auto_74762 ) ) ( not ( = ?auto_74761 ?auto_74763 ) ) ( not ( = ?auto_74761 ?auto_74764 ) ) ( not ( = ?auto_74761 ?auto_74765 ) ) ( not ( = ?auto_74761 ?auto_74766 ) ) ( not ( = ?auto_74761 ?auto_74767 ) ) ( not ( = ?auto_74761 ?auto_74768 ) ) ( not ( = ?auto_74761 ?auto_74769 ) ) ( not ( = ?auto_74761 ?auto_74770 ) ) ( not ( = ?auto_74762 ?auto_74763 ) ) ( not ( = ?auto_74762 ?auto_74764 ) ) ( not ( = ?auto_74762 ?auto_74765 ) ) ( not ( = ?auto_74762 ?auto_74766 ) ) ( not ( = ?auto_74762 ?auto_74767 ) ) ( not ( = ?auto_74762 ?auto_74768 ) ) ( not ( = ?auto_74762 ?auto_74769 ) ) ( not ( = ?auto_74762 ?auto_74770 ) ) ( not ( = ?auto_74763 ?auto_74764 ) ) ( not ( = ?auto_74763 ?auto_74765 ) ) ( not ( = ?auto_74763 ?auto_74766 ) ) ( not ( = ?auto_74763 ?auto_74767 ) ) ( not ( = ?auto_74763 ?auto_74768 ) ) ( not ( = ?auto_74763 ?auto_74769 ) ) ( not ( = ?auto_74763 ?auto_74770 ) ) ( not ( = ?auto_74764 ?auto_74765 ) ) ( not ( = ?auto_74764 ?auto_74766 ) ) ( not ( = ?auto_74764 ?auto_74767 ) ) ( not ( = ?auto_74764 ?auto_74768 ) ) ( not ( = ?auto_74764 ?auto_74769 ) ) ( not ( = ?auto_74764 ?auto_74770 ) ) ( not ( = ?auto_74765 ?auto_74766 ) ) ( not ( = ?auto_74765 ?auto_74767 ) ) ( not ( = ?auto_74765 ?auto_74768 ) ) ( not ( = ?auto_74765 ?auto_74769 ) ) ( not ( = ?auto_74765 ?auto_74770 ) ) ( not ( = ?auto_74766 ?auto_74767 ) ) ( not ( = ?auto_74766 ?auto_74768 ) ) ( not ( = ?auto_74766 ?auto_74769 ) ) ( not ( = ?auto_74766 ?auto_74770 ) ) ( not ( = ?auto_74767 ?auto_74768 ) ) ( not ( = ?auto_74767 ?auto_74769 ) ) ( not ( = ?auto_74767 ?auto_74770 ) ) ( not ( = ?auto_74768 ?auto_74769 ) ) ( not ( = ?auto_74768 ?auto_74770 ) ) ( not ( = ?auto_74769 ?auto_74770 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_74769 ?auto_74770 )
      ( !STACK ?auto_74769 ?auto_74768 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74781 - BLOCK
      ?auto_74782 - BLOCK
      ?auto_74783 - BLOCK
      ?auto_74784 - BLOCK
      ?auto_74785 - BLOCK
      ?auto_74786 - BLOCK
      ?auto_74787 - BLOCK
      ?auto_74788 - BLOCK
      ?auto_74789 - BLOCK
      ?auto_74790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_74789 ) ( ON-TABLE ?auto_74790 ) ( CLEAR ?auto_74790 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_74781 ) ( ON ?auto_74782 ?auto_74781 ) ( ON ?auto_74783 ?auto_74782 ) ( ON ?auto_74784 ?auto_74783 ) ( ON ?auto_74785 ?auto_74784 ) ( ON ?auto_74786 ?auto_74785 ) ( ON ?auto_74787 ?auto_74786 ) ( ON ?auto_74788 ?auto_74787 ) ( ON ?auto_74789 ?auto_74788 ) ( not ( = ?auto_74781 ?auto_74782 ) ) ( not ( = ?auto_74781 ?auto_74783 ) ) ( not ( = ?auto_74781 ?auto_74784 ) ) ( not ( = ?auto_74781 ?auto_74785 ) ) ( not ( = ?auto_74781 ?auto_74786 ) ) ( not ( = ?auto_74781 ?auto_74787 ) ) ( not ( = ?auto_74781 ?auto_74788 ) ) ( not ( = ?auto_74781 ?auto_74789 ) ) ( not ( = ?auto_74781 ?auto_74790 ) ) ( not ( = ?auto_74782 ?auto_74783 ) ) ( not ( = ?auto_74782 ?auto_74784 ) ) ( not ( = ?auto_74782 ?auto_74785 ) ) ( not ( = ?auto_74782 ?auto_74786 ) ) ( not ( = ?auto_74782 ?auto_74787 ) ) ( not ( = ?auto_74782 ?auto_74788 ) ) ( not ( = ?auto_74782 ?auto_74789 ) ) ( not ( = ?auto_74782 ?auto_74790 ) ) ( not ( = ?auto_74783 ?auto_74784 ) ) ( not ( = ?auto_74783 ?auto_74785 ) ) ( not ( = ?auto_74783 ?auto_74786 ) ) ( not ( = ?auto_74783 ?auto_74787 ) ) ( not ( = ?auto_74783 ?auto_74788 ) ) ( not ( = ?auto_74783 ?auto_74789 ) ) ( not ( = ?auto_74783 ?auto_74790 ) ) ( not ( = ?auto_74784 ?auto_74785 ) ) ( not ( = ?auto_74784 ?auto_74786 ) ) ( not ( = ?auto_74784 ?auto_74787 ) ) ( not ( = ?auto_74784 ?auto_74788 ) ) ( not ( = ?auto_74784 ?auto_74789 ) ) ( not ( = ?auto_74784 ?auto_74790 ) ) ( not ( = ?auto_74785 ?auto_74786 ) ) ( not ( = ?auto_74785 ?auto_74787 ) ) ( not ( = ?auto_74785 ?auto_74788 ) ) ( not ( = ?auto_74785 ?auto_74789 ) ) ( not ( = ?auto_74785 ?auto_74790 ) ) ( not ( = ?auto_74786 ?auto_74787 ) ) ( not ( = ?auto_74786 ?auto_74788 ) ) ( not ( = ?auto_74786 ?auto_74789 ) ) ( not ( = ?auto_74786 ?auto_74790 ) ) ( not ( = ?auto_74787 ?auto_74788 ) ) ( not ( = ?auto_74787 ?auto_74789 ) ) ( not ( = ?auto_74787 ?auto_74790 ) ) ( not ( = ?auto_74788 ?auto_74789 ) ) ( not ( = ?auto_74788 ?auto_74790 ) ) ( not ( = ?auto_74789 ?auto_74790 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_74790 )
      ( !STACK ?auto_74790 ?auto_74789 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74801 - BLOCK
      ?auto_74802 - BLOCK
      ?auto_74803 - BLOCK
      ?auto_74804 - BLOCK
      ?auto_74805 - BLOCK
      ?auto_74806 - BLOCK
      ?auto_74807 - BLOCK
      ?auto_74808 - BLOCK
      ?auto_74809 - BLOCK
      ?auto_74810 - BLOCK
    )
    :vars
    (
      ?auto_74811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74810 ?auto_74811 ) ( ON-TABLE ?auto_74801 ) ( ON ?auto_74802 ?auto_74801 ) ( ON ?auto_74803 ?auto_74802 ) ( ON ?auto_74804 ?auto_74803 ) ( ON ?auto_74805 ?auto_74804 ) ( ON ?auto_74806 ?auto_74805 ) ( ON ?auto_74807 ?auto_74806 ) ( ON ?auto_74808 ?auto_74807 ) ( not ( = ?auto_74801 ?auto_74802 ) ) ( not ( = ?auto_74801 ?auto_74803 ) ) ( not ( = ?auto_74801 ?auto_74804 ) ) ( not ( = ?auto_74801 ?auto_74805 ) ) ( not ( = ?auto_74801 ?auto_74806 ) ) ( not ( = ?auto_74801 ?auto_74807 ) ) ( not ( = ?auto_74801 ?auto_74808 ) ) ( not ( = ?auto_74801 ?auto_74809 ) ) ( not ( = ?auto_74801 ?auto_74810 ) ) ( not ( = ?auto_74801 ?auto_74811 ) ) ( not ( = ?auto_74802 ?auto_74803 ) ) ( not ( = ?auto_74802 ?auto_74804 ) ) ( not ( = ?auto_74802 ?auto_74805 ) ) ( not ( = ?auto_74802 ?auto_74806 ) ) ( not ( = ?auto_74802 ?auto_74807 ) ) ( not ( = ?auto_74802 ?auto_74808 ) ) ( not ( = ?auto_74802 ?auto_74809 ) ) ( not ( = ?auto_74802 ?auto_74810 ) ) ( not ( = ?auto_74802 ?auto_74811 ) ) ( not ( = ?auto_74803 ?auto_74804 ) ) ( not ( = ?auto_74803 ?auto_74805 ) ) ( not ( = ?auto_74803 ?auto_74806 ) ) ( not ( = ?auto_74803 ?auto_74807 ) ) ( not ( = ?auto_74803 ?auto_74808 ) ) ( not ( = ?auto_74803 ?auto_74809 ) ) ( not ( = ?auto_74803 ?auto_74810 ) ) ( not ( = ?auto_74803 ?auto_74811 ) ) ( not ( = ?auto_74804 ?auto_74805 ) ) ( not ( = ?auto_74804 ?auto_74806 ) ) ( not ( = ?auto_74804 ?auto_74807 ) ) ( not ( = ?auto_74804 ?auto_74808 ) ) ( not ( = ?auto_74804 ?auto_74809 ) ) ( not ( = ?auto_74804 ?auto_74810 ) ) ( not ( = ?auto_74804 ?auto_74811 ) ) ( not ( = ?auto_74805 ?auto_74806 ) ) ( not ( = ?auto_74805 ?auto_74807 ) ) ( not ( = ?auto_74805 ?auto_74808 ) ) ( not ( = ?auto_74805 ?auto_74809 ) ) ( not ( = ?auto_74805 ?auto_74810 ) ) ( not ( = ?auto_74805 ?auto_74811 ) ) ( not ( = ?auto_74806 ?auto_74807 ) ) ( not ( = ?auto_74806 ?auto_74808 ) ) ( not ( = ?auto_74806 ?auto_74809 ) ) ( not ( = ?auto_74806 ?auto_74810 ) ) ( not ( = ?auto_74806 ?auto_74811 ) ) ( not ( = ?auto_74807 ?auto_74808 ) ) ( not ( = ?auto_74807 ?auto_74809 ) ) ( not ( = ?auto_74807 ?auto_74810 ) ) ( not ( = ?auto_74807 ?auto_74811 ) ) ( not ( = ?auto_74808 ?auto_74809 ) ) ( not ( = ?auto_74808 ?auto_74810 ) ) ( not ( = ?auto_74808 ?auto_74811 ) ) ( not ( = ?auto_74809 ?auto_74810 ) ) ( not ( = ?auto_74809 ?auto_74811 ) ) ( not ( = ?auto_74810 ?auto_74811 ) ) ( CLEAR ?auto_74808 ) ( ON ?auto_74809 ?auto_74810 ) ( CLEAR ?auto_74809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_74801 ?auto_74802 ?auto_74803 ?auto_74804 ?auto_74805 ?auto_74806 ?auto_74807 ?auto_74808 ?auto_74809 )
      ( MAKE-10PILE ?auto_74801 ?auto_74802 ?auto_74803 ?auto_74804 ?auto_74805 ?auto_74806 ?auto_74807 ?auto_74808 ?auto_74809 ?auto_74810 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74822 - BLOCK
      ?auto_74823 - BLOCK
      ?auto_74824 - BLOCK
      ?auto_74825 - BLOCK
      ?auto_74826 - BLOCK
      ?auto_74827 - BLOCK
      ?auto_74828 - BLOCK
      ?auto_74829 - BLOCK
      ?auto_74830 - BLOCK
      ?auto_74831 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74831 ) ( ON-TABLE ?auto_74822 ) ( ON ?auto_74823 ?auto_74822 ) ( ON ?auto_74824 ?auto_74823 ) ( ON ?auto_74825 ?auto_74824 ) ( ON ?auto_74826 ?auto_74825 ) ( ON ?auto_74827 ?auto_74826 ) ( ON ?auto_74828 ?auto_74827 ) ( ON ?auto_74829 ?auto_74828 ) ( not ( = ?auto_74822 ?auto_74823 ) ) ( not ( = ?auto_74822 ?auto_74824 ) ) ( not ( = ?auto_74822 ?auto_74825 ) ) ( not ( = ?auto_74822 ?auto_74826 ) ) ( not ( = ?auto_74822 ?auto_74827 ) ) ( not ( = ?auto_74822 ?auto_74828 ) ) ( not ( = ?auto_74822 ?auto_74829 ) ) ( not ( = ?auto_74822 ?auto_74830 ) ) ( not ( = ?auto_74822 ?auto_74831 ) ) ( not ( = ?auto_74823 ?auto_74824 ) ) ( not ( = ?auto_74823 ?auto_74825 ) ) ( not ( = ?auto_74823 ?auto_74826 ) ) ( not ( = ?auto_74823 ?auto_74827 ) ) ( not ( = ?auto_74823 ?auto_74828 ) ) ( not ( = ?auto_74823 ?auto_74829 ) ) ( not ( = ?auto_74823 ?auto_74830 ) ) ( not ( = ?auto_74823 ?auto_74831 ) ) ( not ( = ?auto_74824 ?auto_74825 ) ) ( not ( = ?auto_74824 ?auto_74826 ) ) ( not ( = ?auto_74824 ?auto_74827 ) ) ( not ( = ?auto_74824 ?auto_74828 ) ) ( not ( = ?auto_74824 ?auto_74829 ) ) ( not ( = ?auto_74824 ?auto_74830 ) ) ( not ( = ?auto_74824 ?auto_74831 ) ) ( not ( = ?auto_74825 ?auto_74826 ) ) ( not ( = ?auto_74825 ?auto_74827 ) ) ( not ( = ?auto_74825 ?auto_74828 ) ) ( not ( = ?auto_74825 ?auto_74829 ) ) ( not ( = ?auto_74825 ?auto_74830 ) ) ( not ( = ?auto_74825 ?auto_74831 ) ) ( not ( = ?auto_74826 ?auto_74827 ) ) ( not ( = ?auto_74826 ?auto_74828 ) ) ( not ( = ?auto_74826 ?auto_74829 ) ) ( not ( = ?auto_74826 ?auto_74830 ) ) ( not ( = ?auto_74826 ?auto_74831 ) ) ( not ( = ?auto_74827 ?auto_74828 ) ) ( not ( = ?auto_74827 ?auto_74829 ) ) ( not ( = ?auto_74827 ?auto_74830 ) ) ( not ( = ?auto_74827 ?auto_74831 ) ) ( not ( = ?auto_74828 ?auto_74829 ) ) ( not ( = ?auto_74828 ?auto_74830 ) ) ( not ( = ?auto_74828 ?auto_74831 ) ) ( not ( = ?auto_74829 ?auto_74830 ) ) ( not ( = ?auto_74829 ?auto_74831 ) ) ( not ( = ?auto_74830 ?auto_74831 ) ) ( CLEAR ?auto_74829 ) ( ON ?auto_74830 ?auto_74831 ) ( CLEAR ?auto_74830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_74822 ?auto_74823 ?auto_74824 ?auto_74825 ?auto_74826 ?auto_74827 ?auto_74828 ?auto_74829 ?auto_74830 )
      ( MAKE-10PILE ?auto_74822 ?auto_74823 ?auto_74824 ?auto_74825 ?auto_74826 ?auto_74827 ?auto_74828 ?auto_74829 ?auto_74830 ?auto_74831 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74842 - BLOCK
      ?auto_74843 - BLOCK
      ?auto_74844 - BLOCK
      ?auto_74845 - BLOCK
      ?auto_74846 - BLOCK
      ?auto_74847 - BLOCK
      ?auto_74848 - BLOCK
      ?auto_74849 - BLOCK
      ?auto_74850 - BLOCK
      ?auto_74851 - BLOCK
    )
    :vars
    (
      ?auto_74852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74851 ?auto_74852 ) ( ON-TABLE ?auto_74842 ) ( ON ?auto_74843 ?auto_74842 ) ( ON ?auto_74844 ?auto_74843 ) ( ON ?auto_74845 ?auto_74844 ) ( ON ?auto_74846 ?auto_74845 ) ( ON ?auto_74847 ?auto_74846 ) ( ON ?auto_74848 ?auto_74847 ) ( not ( = ?auto_74842 ?auto_74843 ) ) ( not ( = ?auto_74842 ?auto_74844 ) ) ( not ( = ?auto_74842 ?auto_74845 ) ) ( not ( = ?auto_74842 ?auto_74846 ) ) ( not ( = ?auto_74842 ?auto_74847 ) ) ( not ( = ?auto_74842 ?auto_74848 ) ) ( not ( = ?auto_74842 ?auto_74849 ) ) ( not ( = ?auto_74842 ?auto_74850 ) ) ( not ( = ?auto_74842 ?auto_74851 ) ) ( not ( = ?auto_74842 ?auto_74852 ) ) ( not ( = ?auto_74843 ?auto_74844 ) ) ( not ( = ?auto_74843 ?auto_74845 ) ) ( not ( = ?auto_74843 ?auto_74846 ) ) ( not ( = ?auto_74843 ?auto_74847 ) ) ( not ( = ?auto_74843 ?auto_74848 ) ) ( not ( = ?auto_74843 ?auto_74849 ) ) ( not ( = ?auto_74843 ?auto_74850 ) ) ( not ( = ?auto_74843 ?auto_74851 ) ) ( not ( = ?auto_74843 ?auto_74852 ) ) ( not ( = ?auto_74844 ?auto_74845 ) ) ( not ( = ?auto_74844 ?auto_74846 ) ) ( not ( = ?auto_74844 ?auto_74847 ) ) ( not ( = ?auto_74844 ?auto_74848 ) ) ( not ( = ?auto_74844 ?auto_74849 ) ) ( not ( = ?auto_74844 ?auto_74850 ) ) ( not ( = ?auto_74844 ?auto_74851 ) ) ( not ( = ?auto_74844 ?auto_74852 ) ) ( not ( = ?auto_74845 ?auto_74846 ) ) ( not ( = ?auto_74845 ?auto_74847 ) ) ( not ( = ?auto_74845 ?auto_74848 ) ) ( not ( = ?auto_74845 ?auto_74849 ) ) ( not ( = ?auto_74845 ?auto_74850 ) ) ( not ( = ?auto_74845 ?auto_74851 ) ) ( not ( = ?auto_74845 ?auto_74852 ) ) ( not ( = ?auto_74846 ?auto_74847 ) ) ( not ( = ?auto_74846 ?auto_74848 ) ) ( not ( = ?auto_74846 ?auto_74849 ) ) ( not ( = ?auto_74846 ?auto_74850 ) ) ( not ( = ?auto_74846 ?auto_74851 ) ) ( not ( = ?auto_74846 ?auto_74852 ) ) ( not ( = ?auto_74847 ?auto_74848 ) ) ( not ( = ?auto_74847 ?auto_74849 ) ) ( not ( = ?auto_74847 ?auto_74850 ) ) ( not ( = ?auto_74847 ?auto_74851 ) ) ( not ( = ?auto_74847 ?auto_74852 ) ) ( not ( = ?auto_74848 ?auto_74849 ) ) ( not ( = ?auto_74848 ?auto_74850 ) ) ( not ( = ?auto_74848 ?auto_74851 ) ) ( not ( = ?auto_74848 ?auto_74852 ) ) ( not ( = ?auto_74849 ?auto_74850 ) ) ( not ( = ?auto_74849 ?auto_74851 ) ) ( not ( = ?auto_74849 ?auto_74852 ) ) ( not ( = ?auto_74850 ?auto_74851 ) ) ( not ( = ?auto_74850 ?auto_74852 ) ) ( not ( = ?auto_74851 ?auto_74852 ) ) ( ON ?auto_74850 ?auto_74851 ) ( CLEAR ?auto_74848 ) ( ON ?auto_74849 ?auto_74850 ) ( CLEAR ?auto_74849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_74842 ?auto_74843 ?auto_74844 ?auto_74845 ?auto_74846 ?auto_74847 ?auto_74848 ?auto_74849 )
      ( MAKE-10PILE ?auto_74842 ?auto_74843 ?auto_74844 ?auto_74845 ?auto_74846 ?auto_74847 ?auto_74848 ?auto_74849 ?auto_74850 ?auto_74851 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74863 - BLOCK
      ?auto_74864 - BLOCK
      ?auto_74865 - BLOCK
      ?auto_74866 - BLOCK
      ?auto_74867 - BLOCK
      ?auto_74868 - BLOCK
      ?auto_74869 - BLOCK
      ?auto_74870 - BLOCK
      ?auto_74871 - BLOCK
      ?auto_74872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74872 ) ( ON-TABLE ?auto_74863 ) ( ON ?auto_74864 ?auto_74863 ) ( ON ?auto_74865 ?auto_74864 ) ( ON ?auto_74866 ?auto_74865 ) ( ON ?auto_74867 ?auto_74866 ) ( ON ?auto_74868 ?auto_74867 ) ( ON ?auto_74869 ?auto_74868 ) ( not ( = ?auto_74863 ?auto_74864 ) ) ( not ( = ?auto_74863 ?auto_74865 ) ) ( not ( = ?auto_74863 ?auto_74866 ) ) ( not ( = ?auto_74863 ?auto_74867 ) ) ( not ( = ?auto_74863 ?auto_74868 ) ) ( not ( = ?auto_74863 ?auto_74869 ) ) ( not ( = ?auto_74863 ?auto_74870 ) ) ( not ( = ?auto_74863 ?auto_74871 ) ) ( not ( = ?auto_74863 ?auto_74872 ) ) ( not ( = ?auto_74864 ?auto_74865 ) ) ( not ( = ?auto_74864 ?auto_74866 ) ) ( not ( = ?auto_74864 ?auto_74867 ) ) ( not ( = ?auto_74864 ?auto_74868 ) ) ( not ( = ?auto_74864 ?auto_74869 ) ) ( not ( = ?auto_74864 ?auto_74870 ) ) ( not ( = ?auto_74864 ?auto_74871 ) ) ( not ( = ?auto_74864 ?auto_74872 ) ) ( not ( = ?auto_74865 ?auto_74866 ) ) ( not ( = ?auto_74865 ?auto_74867 ) ) ( not ( = ?auto_74865 ?auto_74868 ) ) ( not ( = ?auto_74865 ?auto_74869 ) ) ( not ( = ?auto_74865 ?auto_74870 ) ) ( not ( = ?auto_74865 ?auto_74871 ) ) ( not ( = ?auto_74865 ?auto_74872 ) ) ( not ( = ?auto_74866 ?auto_74867 ) ) ( not ( = ?auto_74866 ?auto_74868 ) ) ( not ( = ?auto_74866 ?auto_74869 ) ) ( not ( = ?auto_74866 ?auto_74870 ) ) ( not ( = ?auto_74866 ?auto_74871 ) ) ( not ( = ?auto_74866 ?auto_74872 ) ) ( not ( = ?auto_74867 ?auto_74868 ) ) ( not ( = ?auto_74867 ?auto_74869 ) ) ( not ( = ?auto_74867 ?auto_74870 ) ) ( not ( = ?auto_74867 ?auto_74871 ) ) ( not ( = ?auto_74867 ?auto_74872 ) ) ( not ( = ?auto_74868 ?auto_74869 ) ) ( not ( = ?auto_74868 ?auto_74870 ) ) ( not ( = ?auto_74868 ?auto_74871 ) ) ( not ( = ?auto_74868 ?auto_74872 ) ) ( not ( = ?auto_74869 ?auto_74870 ) ) ( not ( = ?auto_74869 ?auto_74871 ) ) ( not ( = ?auto_74869 ?auto_74872 ) ) ( not ( = ?auto_74870 ?auto_74871 ) ) ( not ( = ?auto_74870 ?auto_74872 ) ) ( not ( = ?auto_74871 ?auto_74872 ) ) ( ON ?auto_74871 ?auto_74872 ) ( CLEAR ?auto_74869 ) ( ON ?auto_74870 ?auto_74871 ) ( CLEAR ?auto_74870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_74863 ?auto_74864 ?auto_74865 ?auto_74866 ?auto_74867 ?auto_74868 ?auto_74869 ?auto_74870 )
      ( MAKE-10PILE ?auto_74863 ?auto_74864 ?auto_74865 ?auto_74866 ?auto_74867 ?auto_74868 ?auto_74869 ?auto_74870 ?auto_74871 ?auto_74872 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74883 - BLOCK
      ?auto_74884 - BLOCK
      ?auto_74885 - BLOCK
      ?auto_74886 - BLOCK
      ?auto_74887 - BLOCK
      ?auto_74888 - BLOCK
      ?auto_74889 - BLOCK
      ?auto_74890 - BLOCK
      ?auto_74891 - BLOCK
      ?auto_74892 - BLOCK
    )
    :vars
    (
      ?auto_74893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74892 ?auto_74893 ) ( ON-TABLE ?auto_74883 ) ( ON ?auto_74884 ?auto_74883 ) ( ON ?auto_74885 ?auto_74884 ) ( ON ?auto_74886 ?auto_74885 ) ( ON ?auto_74887 ?auto_74886 ) ( ON ?auto_74888 ?auto_74887 ) ( not ( = ?auto_74883 ?auto_74884 ) ) ( not ( = ?auto_74883 ?auto_74885 ) ) ( not ( = ?auto_74883 ?auto_74886 ) ) ( not ( = ?auto_74883 ?auto_74887 ) ) ( not ( = ?auto_74883 ?auto_74888 ) ) ( not ( = ?auto_74883 ?auto_74889 ) ) ( not ( = ?auto_74883 ?auto_74890 ) ) ( not ( = ?auto_74883 ?auto_74891 ) ) ( not ( = ?auto_74883 ?auto_74892 ) ) ( not ( = ?auto_74883 ?auto_74893 ) ) ( not ( = ?auto_74884 ?auto_74885 ) ) ( not ( = ?auto_74884 ?auto_74886 ) ) ( not ( = ?auto_74884 ?auto_74887 ) ) ( not ( = ?auto_74884 ?auto_74888 ) ) ( not ( = ?auto_74884 ?auto_74889 ) ) ( not ( = ?auto_74884 ?auto_74890 ) ) ( not ( = ?auto_74884 ?auto_74891 ) ) ( not ( = ?auto_74884 ?auto_74892 ) ) ( not ( = ?auto_74884 ?auto_74893 ) ) ( not ( = ?auto_74885 ?auto_74886 ) ) ( not ( = ?auto_74885 ?auto_74887 ) ) ( not ( = ?auto_74885 ?auto_74888 ) ) ( not ( = ?auto_74885 ?auto_74889 ) ) ( not ( = ?auto_74885 ?auto_74890 ) ) ( not ( = ?auto_74885 ?auto_74891 ) ) ( not ( = ?auto_74885 ?auto_74892 ) ) ( not ( = ?auto_74885 ?auto_74893 ) ) ( not ( = ?auto_74886 ?auto_74887 ) ) ( not ( = ?auto_74886 ?auto_74888 ) ) ( not ( = ?auto_74886 ?auto_74889 ) ) ( not ( = ?auto_74886 ?auto_74890 ) ) ( not ( = ?auto_74886 ?auto_74891 ) ) ( not ( = ?auto_74886 ?auto_74892 ) ) ( not ( = ?auto_74886 ?auto_74893 ) ) ( not ( = ?auto_74887 ?auto_74888 ) ) ( not ( = ?auto_74887 ?auto_74889 ) ) ( not ( = ?auto_74887 ?auto_74890 ) ) ( not ( = ?auto_74887 ?auto_74891 ) ) ( not ( = ?auto_74887 ?auto_74892 ) ) ( not ( = ?auto_74887 ?auto_74893 ) ) ( not ( = ?auto_74888 ?auto_74889 ) ) ( not ( = ?auto_74888 ?auto_74890 ) ) ( not ( = ?auto_74888 ?auto_74891 ) ) ( not ( = ?auto_74888 ?auto_74892 ) ) ( not ( = ?auto_74888 ?auto_74893 ) ) ( not ( = ?auto_74889 ?auto_74890 ) ) ( not ( = ?auto_74889 ?auto_74891 ) ) ( not ( = ?auto_74889 ?auto_74892 ) ) ( not ( = ?auto_74889 ?auto_74893 ) ) ( not ( = ?auto_74890 ?auto_74891 ) ) ( not ( = ?auto_74890 ?auto_74892 ) ) ( not ( = ?auto_74890 ?auto_74893 ) ) ( not ( = ?auto_74891 ?auto_74892 ) ) ( not ( = ?auto_74891 ?auto_74893 ) ) ( not ( = ?auto_74892 ?auto_74893 ) ) ( ON ?auto_74891 ?auto_74892 ) ( ON ?auto_74890 ?auto_74891 ) ( CLEAR ?auto_74888 ) ( ON ?auto_74889 ?auto_74890 ) ( CLEAR ?auto_74889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74883 ?auto_74884 ?auto_74885 ?auto_74886 ?auto_74887 ?auto_74888 ?auto_74889 )
      ( MAKE-10PILE ?auto_74883 ?auto_74884 ?auto_74885 ?auto_74886 ?auto_74887 ?auto_74888 ?auto_74889 ?auto_74890 ?auto_74891 ?auto_74892 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74904 - BLOCK
      ?auto_74905 - BLOCK
      ?auto_74906 - BLOCK
      ?auto_74907 - BLOCK
      ?auto_74908 - BLOCK
      ?auto_74909 - BLOCK
      ?auto_74910 - BLOCK
      ?auto_74911 - BLOCK
      ?auto_74912 - BLOCK
      ?auto_74913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74913 ) ( ON-TABLE ?auto_74904 ) ( ON ?auto_74905 ?auto_74904 ) ( ON ?auto_74906 ?auto_74905 ) ( ON ?auto_74907 ?auto_74906 ) ( ON ?auto_74908 ?auto_74907 ) ( ON ?auto_74909 ?auto_74908 ) ( not ( = ?auto_74904 ?auto_74905 ) ) ( not ( = ?auto_74904 ?auto_74906 ) ) ( not ( = ?auto_74904 ?auto_74907 ) ) ( not ( = ?auto_74904 ?auto_74908 ) ) ( not ( = ?auto_74904 ?auto_74909 ) ) ( not ( = ?auto_74904 ?auto_74910 ) ) ( not ( = ?auto_74904 ?auto_74911 ) ) ( not ( = ?auto_74904 ?auto_74912 ) ) ( not ( = ?auto_74904 ?auto_74913 ) ) ( not ( = ?auto_74905 ?auto_74906 ) ) ( not ( = ?auto_74905 ?auto_74907 ) ) ( not ( = ?auto_74905 ?auto_74908 ) ) ( not ( = ?auto_74905 ?auto_74909 ) ) ( not ( = ?auto_74905 ?auto_74910 ) ) ( not ( = ?auto_74905 ?auto_74911 ) ) ( not ( = ?auto_74905 ?auto_74912 ) ) ( not ( = ?auto_74905 ?auto_74913 ) ) ( not ( = ?auto_74906 ?auto_74907 ) ) ( not ( = ?auto_74906 ?auto_74908 ) ) ( not ( = ?auto_74906 ?auto_74909 ) ) ( not ( = ?auto_74906 ?auto_74910 ) ) ( not ( = ?auto_74906 ?auto_74911 ) ) ( not ( = ?auto_74906 ?auto_74912 ) ) ( not ( = ?auto_74906 ?auto_74913 ) ) ( not ( = ?auto_74907 ?auto_74908 ) ) ( not ( = ?auto_74907 ?auto_74909 ) ) ( not ( = ?auto_74907 ?auto_74910 ) ) ( not ( = ?auto_74907 ?auto_74911 ) ) ( not ( = ?auto_74907 ?auto_74912 ) ) ( not ( = ?auto_74907 ?auto_74913 ) ) ( not ( = ?auto_74908 ?auto_74909 ) ) ( not ( = ?auto_74908 ?auto_74910 ) ) ( not ( = ?auto_74908 ?auto_74911 ) ) ( not ( = ?auto_74908 ?auto_74912 ) ) ( not ( = ?auto_74908 ?auto_74913 ) ) ( not ( = ?auto_74909 ?auto_74910 ) ) ( not ( = ?auto_74909 ?auto_74911 ) ) ( not ( = ?auto_74909 ?auto_74912 ) ) ( not ( = ?auto_74909 ?auto_74913 ) ) ( not ( = ?auto_74910 ?auto_74911 ) ) ( not ( = ?auto_74910 ?auto_74912 ) ) ( not ( = ?auto_74910 ?auto_74913 ) ) ( not ( = ?auto_74911 ?auto_74912 ) ) ( not ( = ?auto_74911 ?auto_74913 ) ) ( not ( = ?auto_74912 ?auto_74913 ) ) ( ON ?auto_74912 ?auto_74913 ) ( ON ?auto_74911 ?auto_74912 ) ( CLEAR ?auto_74909 ) ( ON ?auto_74910 ?auto_74911 ) ( CLEAR ?auto_74910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_74904 ?auto_74905 ?auto_74906 ?auto_74907 ?auto_74908 ?auto_74909 ?auto_74910 )
      ( MAKE-10PILE ?auto_74904 ?auto_74905 ?auto_74906 ?auto_74907 ?auto_74908 ?auto_74909 ?auto_74910 ?auto_74911 ?auto_74912 ?auto_74913 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74924 - BLOCK
      ?auto_74925 - BLOCK
      ?auto_74926 - BLOCK
      ?auto_74927 - BLOCK
      ?auto_74928 - BLOCK
      ?auto_74929 - BLOCK
      ?auto_74930 - BLOCK
      ?auto_74931 - BLOCK
      ?auto_74932 - BLOCK
      ?auto_74933 - BLOCK
    )
    :vars
    (
      ?auto_74934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74933 ?auto_74934 ) ( ON-TABLE ?auto_74924 ) ( ON ?auto_74925 ?auto_74924 ) ( ON ?auto_74926 ?auto_74925 ) ( ON ?auto_74927 ?auto_74926 ) ( ON ?auto_74928 ?auto_74927 ) ( not ( = ?auto_74924 ?auto_74925 ) ) ( not ( = ?auto_74924 ?auto_74926 ) ) ( not ( = ?auto_74924 ?auto_74927 ) ) ( not ( = ?auto_74924 ?auto_74928 ) ) ( not ( = ?auto_74924 ?auto_74929 ) ) ( not ( = ?auto_74924 ?auto_74930 ) ) ( not ( = ?auto_74924 ?auto_74931 ) ) ( not ( = ?auto_74924 ?auto_74932 ) ) ( not ( = ?auto_74924 ?auto_74933 ) ) ( not ( = ?auto_74924 ?auto_74934 ) ) ( not ( = ?auto_74925 ?auto_74926 ) ) ( not ( = ?auto_74925 ?auto_74927 ) ) ( not ( = ?auto_74925 ?auto_74928 ) ) ( not ( = ?auto_74925 ?auto_74929 ) ) ( not ( = ?auto_74925 ?auto_74930 ) ) ( not ( = ?auto_74925 ?auto_74931 ) ) ( not ( = ?auto_74925 ?auto_74932 ) ) ( not ( = ?auto_74925 ?auto_74933 ) ) ( not ( = ?auto_74925 ?auto_74934 ) ) ( not ( = ?auto_74926 ?auto_74927 ) ) ( not ( = ?auto_74926 ?auto_74928 ) ) ( not ( = ?auto_74926 ?auto_74929 ) ) ( not ( = ?auto_74926 ?auto_74930 ) ) ( not ( = ?auto_74926 ?auto_74931 ) ) ( not ( = ?auto_74926 ?auto_74932 ) ) ( not ( = ?auto_74926 ?auto_74933 ) ) ( not ( = ?auto_74926 ?auto_74934 ) ) ( not ( = ?auto_74927 ?auto_74928 ) ) ( not ( = ?auto_74927 ?auto_74929 ) ) ( not ( = ?auto_74927 ?auto_74930 ) ) ( not ( = ?auto_74927 ?auto_74931 ) ) ( not ( = ?auto_74927 ?auto_74932 ) ) ( not ( = ?auto_74927 ?auto_74933 ) ) ( not ( = ?auto_74927 ?auto_74934 ) ) ( not ( = ?auto_74928 ?auto_74929 ) ) ( not ( = ?auto_74928 ?auto_74930 ) ) ( not ( = ?auto_74928 ?auto_74931 ) ) ( not ( = ?auto_74928 ?auto_74932 ) ) ( not ( = ?auto_74928 ?auto_74933 ) ) ( not ( = ?auto_74928 ?auto_74934 ) ) ( not ( = ?auto_74929 ?auto_74930 ) ) ( not ( = ?auto_74929 ?auto_74931 ) ) ( not ( = ?auto_74929 ?auto_74932 ) ) ( not ( = ?auto_74929 ?auto_74933 ) ) ( not ( = ?auto_74929 ?auto_74934 ) ) ( not ( = ?auto_74930 ?auto_74931 ) ) ( not ( = ?auto_74930 ?auto_74932 ) ) ( not ( = ?auto_74930 ?auto_74933 ) ) ( not ( = ?auto_74930 ?auto_74934 ) ) ( not ( = ?auto_74931 ?auto_74932 ) ) ( not ( = ?auto_74931 ?auto_74933 ) ) ( not ( = ?auto_74931 ?auto_74934 ) ) ( not ( = ?auto_74932 ?auto_74933 ) ) ( not ( = ?auto_74932 ?auto_74934 ) ) ( not ( = ?auto_74933 ?auto_74934 ) ) ( ON ?auto_74932 ?auto_74933 ) ( ON ?auto_74931 ?auto_74932 ) ( ON ?auto_74930 ?auto_74931 ) ( CLEAR ?auto_74928 ) ( ON ?auto_74929 ?auto_74930 ) ( CLEAR ?auto_74929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74924 ?auto_74925 ?auto_74926 ?auto_74927 ?auto_74928 ?auto_74929 )
      ( MAKE-10PILE ?auto_74924 ?auto_74925 ?auto_74926 ?auto_74927 ?auto_74928 ?auto_74929 ?auto_74930 ?auto_74931 ?auto_74932 ?auto_74933 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74945 - BLOCK
      ?auto_74946 - BLOCK
      ?auto_74947 - BLOCK
      ?auto_74948 - BLOCK
      ?auto_74949 - BLOCK
      ?auto_74950 - BLOCK
      ?auto_74951 - BLOCK
      ?auto_74952 - BLOCK
      ?auto_74953 - BLOCK
      ?auto_74954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74954 ) ( ON-TABLE ?auto_74945 ) ( ON ?auto_74946 ?auto_74945 ) ( ON ?auto_74947 ?auto_74946 ) ( ON ?auto_74948 ?auto_74947 ) ( ON ?auto_74949 ?auto_74948 ) ( not ( = ?auto_74945 ?auto_74946 ) ) ( not ( = ?auto_74945 ?auto_74947 ) ) ( not ( = ?auto_74945 ?auto_74948 ) ) ( not ( = ?auto_74945 ?auto_74949 ) ) ( not ( = ?auto_74945 ?auto_74950 ) ) ( not ( = ?auto_74945 ?auto_74951 ) ) ( not ( = ?auto_74945 ?auto_74952 ) ) ( not ( = ?auto_74945 ?auto_74953 ) ) ( not ( = ?auto_74945 ?auto_74954 ) ) ( not ( = ?auto_74946 ?auto_74947 ) ) ( not ( = ?auto_74946 ?auto_74948 ) ) ( not ( = ?auto_74946 ?auto_74949 ) ) ( not ( = ?auto_74946 ?auto_74950 ) ) ( not ( = ?auto_74946 ?auto_74951 ) ) ( not ( = ?auto_74946 ?auto_74952 ) ) ( not ( = ?auto_74946 ?auto_74953 ) ) ( not ( = ?auto_74946 ?auto_74954 ) ) ( not ( = ?auto_74947 ?auto_74948 ) ) ( not ( = ?auto_74947 ?auto_74949 ) ) ( not ( = ?auto_74947 ?auto_74950 ) ) ( not ( = ?auto_74947 ?auto_74951 ) ) ( not ( = ?auto_74947 ?auto_74952 ) ) ( not ( = ?auto_74947 ?auto_74953 ) ) ( not ( = ?auto_74947 ?auto_74954 ) ) ( not ( = ?auto_74948 ?auto_74949 ) ) ( not ( = ?auto_74948 ?auto_74950 ) ) ( not ( = ?auto_74948 ?auto_74951 ) ) ( not ( = ?auto_74948 ?auto_74952 ) ) ( not ( = ?auto_74948 ?auto_74953 ) ) ( not ( = ?auto_74948 ?auto_74954 ) ) ( not ( = ?auto_74949 ?auto_74950 ) ) ( not ( = ?auto_74949 ?auto_74951 ) ) ( not ( = ?auto_74949 ?auto_74952 ) ) ( not ( = ?auto_74949 ?auto_74953 ) ) ( not ( = ?auto_74949 ?auto_74954 ) ) ( not ( = ?auto_74950 ?auto_74951 ) ) ( not ( = ?auto_74950 ?auto_74952 ) ) ( not ( = ?auto_74950 ?auto_74953 ) ) ( not ( = ?auto_74950 ?auto_74954 ) ) ( not ( = ?auto_74951 ?auto_74952 ) ) ( not ( = ?auto_74951 ?auto_74953 ) ) ( not ( = ?auto_74951 ?auto_74954 ) ) ( not ( = ?auto_74952 ?auto_74953 ) ) ( not ( = ?auto_74952 ?auto_74954 ) ) ( not ( = ?auto_74953 ?auto_74954 ) ) ( ON ?auto_74953 ?auto_74954 ) ( ON ?auto_74952 ?auto_74953 ) ( ON ?auto_74951 ?auto_74952 ) ( CLEAR ?auto_74949 ) ( ON ?auto_74950 ?auto_74951 ) ( CLEAR ?auto_74950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_74945 ?auto_74946 ?auto_74947 ?auto_74948 ?auto_74949 ?auto_74950 )
      ( MAKE-10PILE ?auto_74945 ?auto_74946 ?auto_74947 ?auto_74948 ?auto_74949 ?auto_74950 ?auto_74951 ?auto_74952 ?auto_74953 ?auto_74954 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74965 - BLOCK
      ?auto_74966 - BLOCK
      ?auto_74967 - BLOCK
      ?auto_74968 - BLOCK
      ?auto_74969 - BLOCK
      ?auto_74970 - BLOCK
      ?auto_74971 - BLOCK
      ?auto_74972 - BLOCK
      ?auto_74973 - BLOCK
      ?auto_74974 - BLOCK
    )
    :vars
    (
      ?auto_74975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_74974 ?auto_74975 ) ( ON-TABLE ?auto_74965 ) ( ON ?auto_74966 ?auto_74965 ) ( ON ?auto_74967 ?auto_74966 ) ( ON ?auto_74968 ?auto_74967 ) ( not ( = ?auto_74965 ?auto_74966 ) ) ( not ( = ?auto_74965 ?auto_74967 ) ) ( not ( = ?auto_74965 ?auto_74968 ) ) ( not ( = ?auto_74965 ?auto_74969 ) ) ( not ( = ?auto_74965 ?auto_74970 ) ) ( not ( = ?auto_74965 ?auto_74971 ) ) ( not ( = ?auto_74965 ?auto_74972 ) ) ( not ( = ?auto_74965 ?auto_74973 ) ) ( not ( = ?auto_74965 ?auto_74974 ) ) ( not ( = ?auto_74965 ?auto_74975 ) ) ( not ( = ?auto_74966 ?auto_74967 ) ) ( not ( = ?auto_74966 ?auto_74968 ) ) ( not ( = ?auto_74966 ?auto_74969 ) ) ( not ( = ?auto_74966 ?auto_74970 ) ) ( not ( = ?auto_74966 ?auto_74971 ) ) ( not ( = ?auto_74966 ?auto_74972 ) ) ( not ( = ?auto_74966 ?auto_74973 ) ) ( not ( = ?auto_74966 ?auto_74974 ) ) ( not ( = ?auto_74966 ?auto_74975 ) ) ( not ( = ?auto_74967 ?auto_74968 ) ) ( not ( = ?auto_74967 ?auto_74969 ) ) ( not ( = ?auto_74967 ?auto_74970 ) ) ( not ( = ?auto_74967 ?auto_74971 ) ) ( not ( = ?auto_74967 ?auto_74972 ) ) ( not ( = ?auto_74967 ?auto_74973 ) ) ( not ( = ?auto_74967 ?auto_74974 ) ) ( not ( = ?auto_74967 ?auto_74975 ) ) ( not ( = ?auto_74968 ?auto_74969 ) ) ( not ( = ?auto_74968 ?auto_74970 ) ) ( not ( = ?auto_74968 ?auto_74971 ) ) ( not ( = ?auto_74968 ?auto_74972 ) ) ( not ( = ?auto_74968 ?auto_74973 ) ) ( not ( = ?auto_74968 ?auto_74974 ) ) ( not ( = ?auto_74968 ?auto_74975 ) ) ( not ( = ?auto_74969 ?auto_74970 ) ) ( not ( = ?auto_74969 ?auto_74971 ) ) ( not ( = ?auto_74969 ?auto_74972 ) ) ( not ( = ?auto_74969 ?auto_74973 ) ) ( not ( = ?auto_74969 ?auto_74974 ) ) ( not ( = ?auto_74969 ?auto_74975 ) ) ( not ( = ?auto_74970 ?auto_74971 ) ) ( not ( = ?auto_74970 ?auto_74972 ) ) ( not ( = ?auto_74970 ?auto_74973 ) ) ( not ( = ?auto_74970 ?auto_74974 ) ) ( not ( = ?auto_74970 ?auto_74975 ) ) ( not ( = ?auto_74971 ?auto_74972 ) ) ( not ( = ?auto_74971 ?auto_74973 ) ) ( not ( = ?auto_74971 ?auto_74974 ) ) ( not ( = ?auto_74971 ?auto_74975 ) ) ( not ( = ?auto_74972 ?auto_74973 ) ) ( not ( = ?auto_74972 ?auto_74974 ) ) ( not ( = ?auto_74972 ?auto_74975 ) ) ( not ( = ?auto_74973 ?auto_74974 ) ) ( not ( = ?auto_74973 ?auto_74975 ) ) ( not ( = ?auto_74974 ?auto_74975 ) ) ( ON ?auto_74973 ?auto_74974 ) ( ON ?auto_74972 ?auto_74973 ) ( ON ?auto_74971 ?auto_74972 ) ( ON ?auto_74970 ?auto_74971 ) ( CLEAR ?auto_74968 ) ( ON ?auto_74969 ?auto_74970 ) ( CLEAR ?auto_74969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74965 ?auto_74966 ?auto_74967 ?auto_74968 ?auto_74969 )
      ( MAKE-10PILE ?auto_74965 ?auto_74966 ?auto_74967 ?auto_74968 ?auto_74969 ?auto_74970 ?auto_74971 ?auto_74972 ?auto_74973 ?auto_74974 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_74986 - BLOCK
      ?auto_74987 - BLOCK
      ?auto_74988 - BLOCK
      ?auto_74989 - BLOCK
      ?auto_74990 - BLOCK
      ?auto_74991 - BLOCK
      ?auto_74992 - BLOCK
      ?auto_74993 - BLOCK
      ?auto_74994 - BLOCK
      ?auto_74995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_74995 ) ( ON-TABLE ?auto_74986 ) ( ON ?auto_74987 ?auto_74986 ) ( ON ?auto_74988 ?auto_74987 ) ( ON ?auto_74989 ?auto_74988 ) ( not ( = ?auto_74986 ?auto_74987 ) ) ( not ( = ?auto_74986 ?auto_74988 ) ) ( not ( = ?auto_74986 ?auto_74989 ) ) ( not ( = ?auto_74986 ?auto_74990 ) ) ( not ( = ?auto_74986 ?auto_74991 ) ) ( not ( = ?auto_74986 ?auto_74992 ) ) ( not ( = ?auto_74986 ?auto_74993 ) ) ( not ( = ?auto_74986 ?auto_74994 ) ) ( not ( = ?auto_74986 ?auto_74995 ) ) ( not ( = ?auto_74987 ?auto_74988 ) ) ( not ( = ?auto_74987 ?auto_74989 ) ) ( not ( = ?auto_74987 ?auto_74990 ) ) ( not ( = ?auto_74987 ?auto_74991 ) ) ( not ( = ?auto_74987 ?auto_74992 ) ) ( not ( = ?auto_74987 ?auto_74993 ) ) ( not ( = ?auto_74987 ?auto_74994 ) ) ( not ( = ?auto_74987 ?auto_74995 ) ) ( not ( = ?auto_74988 ?auto_74989 ) ) ( not ( = ?auto_74988 ?auto_74990 ) ) ( not ( = ?auto_74988 ?auto_74991 ) ) ( not ( = ?auto_74988 ?auto_74992 ) ) ( not ( = ?auto_74988 ?auto_74993 ) ) ( not ( = ?auto_74988 ?auto_74994 ) ) ( not ( = ?auto_74988 ?auto_74995 ) ) ( not ( = ?auto_74989 ?auto_74990 ) ) ( not ( = ?auto_74989 ?auto_74991 ) ) ( not ( = ?auto_74989 ?auto_74992 ) ) ( not ( = ?auto_74989 ?auto_74993 ) ) ( not ( = ?auto_74989 ?auto_74994 ) ) ( not ( = ?auto_74989 ?auto_74995 ) ) ( not ( = ?auto_74990 ?auto_74991 ) ) ( not ( = ?auto_74990 ?auto_74992 ) ) ( not ( = ?auto_74990 ?auto_74993 ) ) ( not ( = ?auto_74990 ?auto_74994 ) ) ( not ( = ?auto_74990 ?auto_74995 ) ) ( not ( = ?auto_74991 ?auto_74992 ) ) ( not ( = ?auto_74991 ?auto_74993 ) ) ( not ( = ?auto_74991 ?auto_74994 ) ) ( not ( = ?auto_74991 ?auto_74995 ) ) ( not ( = ?auto_74992 ?auto_74993 ) ) ( not ( = ?auto_74992 ?auto_74994 ) ) ( not ( = ?auto_74992 ?auto_74995 ) ) ( not ( = ?auto_74993 ?auto_74994 ) ) ( not ( = ?auto_74993 ?auto_74995 ) ) ( not ( = ?auto_74994 ?auto_74995 ) ) ( ON ?auto_74994 ?auto_74995 ) ( ON ?auto_74993 ?auto_74994 ) ( ON ?auto_74992 ?auto_74993 ) ( ON ?auto_74991 ?auto_74992 ) ( CLEAR ?auto_74989 ) ( ON ?auto_74990 ?auto_74991 ) ( CLEAR ?auto_74990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_74986 ?auto_74987 ?auto_74988 ?auto_74989 ?auto_74990 )
      ( MAKE-10PILE ?auto_74986 ?auto_74987 ?auto_74988 ?auto_74989 ?auto_74990 ?auto_74991 ?auto_74992 ?auto_74993 ?auto_74994 ?auto_74995 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_75006 - BLOCK
      ?auto_75007 - BLOCK
      ?auto_75008 - BLOCK
      ?auto_75009 - BLOCK
      ?auto_75010 - BLOCK
      ?auto_75011 - BLOCK
      ?auto_75012 - BLOCK
      ?auto_75013 - BLOCK
      ?auto_75014 - BLOCK
      ?auto_75015 - BLOCK
    )
    :vars
    (
      ?auto_75016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75015 ?auto_75016 ) ( ON-TABLE ?auto_75006 ) ( ON ?auto_75007 ?auto_75006 ) ( ON ?auto_75008 ?auto_75007 ) ( not ( = ?auto_75006 ?auto_75007 ) ) ( not ( = ?auto_75006 ?auto_75008 ) ) ( not ( = ?auto_75006 ?auto_75009 ) ) ( not ( = ?auto_75006 ?auto_75010 ) ) ( not ( = ?auto_75006 ?auto_75011 ) ) ( not ( = ?auto_75006 ?auto_75012 ) ) ( not ( = ?auto_75006 ?auto_75013 ) ) ( not ( = ?auto_75006 ?auto_75014 ) ) ( not ( = ?auto_75006 ?auto_75015 ) ) ( not ( = ?auto_75006 ?auto_75016 ) ) ( not ( = ?auto_75007 ?auto_75008 ) ) ( not ( = ?auto_75007 ?auto_75009 ) ) ( not ( = ?auto_75007 ?auto_75010 ) ) ( not ( = ?auto_75007 ?auto_75011 ) ) ( not ( = ?auto_75007 ?auto_75012 ) ) ( not ( = ?auto_75007 ?auto_75013 ) ) ( not ( = ?auto_75007 ?auto_75014 ) ) ( not ( = ?auto_75007 ?auto_75015 ) ) ( not ( = ?auto_75007 ?auto_75016 ) ) ( not ( = ?auto_75008 ?auto_75009 ) ) ( not ( = ?auto_75008 ?auto_75010 ) ) ( not ( = ?auto_75008 ?auto_75011 ) ) ( not ( = ?auto_75008 ?auto_75012 ) ) ( not ( = ?auto_75008 ?auto_75013 ) ) ( not ( = ?auto_75008 ?auto_75014 ) ) ( not ( = ?auto_75008 ?auto_75015 ) ) ( not ( = ?auto_75008 ?auto_75016 ) ) ( not ( = ?auto_75009 ?auto_75010 ) ) ( not ( = ?auto_75009 ?auto_75011 ) ) ( not ( = ?auto_75009 ?auto_75012 ) ) ( not ( = ?auto_75009 ?auto_75013 ) ) ( not ( = ?auto_75009 ?auto_75014 ) ) ( not ( = ?auto_75009 ?auto_75015 ) ) ( not ( = ?auto_75009 ?auto_75016 ) ) ( not ( = ?auto_75010 ?auto_75011 ) ) ( not ( = ?auto_75010 ?auto_75012 ) ) ( not ( = ?auto_75010 ?auto_75013 ) ) ( not ( = ?auto_75010 ?auto_75014 ) ) ( not ( = ?auto_75010 ?auto_75015 ) ) ( not ( = ?auto_75010 ?auto_75016 ) ) ( not ( = ?auto_75011 ?auto_75012 ) ) ( not ( = ?auto_75011 ?auto_75013 ) ) ( not ( = ?auto_75011 ?auto_75014 ) ) ( not ( = ?auto_75011 ?auto_75015 ) ) ( not ( = ?auto_75011 ?auto_75016 ) ) ( not ( = ?auto_75012 ?auto_75013 ) ) ( not ( = ?auto_75012 ?auto_75014 ) ) ( not ( = ?auto_75012 ?auto_75015 ) ) ( not ( = ?auto_75012 ?auto_75016 ) ) ( not ( = ?auto_75013 ?auto_75014 ) ) ( not ( = ?auto_75013 ?auto_75015 ) ) ( not ( = ?auto_75013 ?auto_75016 ) ) ( not ( = ?auto_75014 ?auto_75015 ) ) ( not ( = ?auto_75014 ?auto_75016 ) ) ( not ( = ?auto_75015 ?auto_75016 ) ) ( ON ?auto_75014 ?auto_75015 ) ( ON ?auto_75013 ?auto_75014 ) ( ON ?auto_75012 ?auto_75013 ) ( ON ?auto_75011 ?auto_75012 ) ( ON ?auto_75010 ?auto_75011 ) ( CLEAR ?auto_75008 ) ( ON ?auto_75009 ?auto_75010 ) ( CLEAR ?auto_75009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75006 ?auto_75007 ?auto_75008 ?auto_75009 )
      ( MAKE-10PILE ?auto_75006 ?auto_75007 ?auto_75008 ?auto_75009 ?auto_75010 ?auto_75011 ?auto_75012 ?auto_75013 ?auto_75014 ?auto_75015 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_75027 - BLOCK
      ?auto_75028 - BLOCK
      ?auto_75029 - BLOCK
      ?auto_75030 - BLOCK
      ?auto_75031 - BLOCK
      ?auto_75032 - BLOCK
      ?auto_75033 - BLOCK
      ?auto_75034 - BLOCK
      ?auto_75035 - BLOCK
      ?auto_75036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75036 ) ( ON-TABLE ?auto_75027 ) ( ON ?auto_75028 ?auto_75027 ) ( ON ?auto_75029 ?auto_75028 ) ( not ( = ?auto_75027 ?auto_75028 ) ) ( not ( = ?auto_75027 ?auto_75029 ) ) ( not ( = ?auto_75027 ?auto_75030 ) ) ( not ( = ?auto_75027 ?auto_75031 ) ) ( not ( = ?auto_75027 ?auto_75032 ) ) ( not ( = ?auto_75027 ?auto_75033 ) ) ( not ( = ?auto_75027 ?auto_75034 ) ) ( not ( = ?auto_75027 ?auto_75035 ) ) ( not ( = ?auto_75027 ?auto_75036 ) ) ( not ( = ?auto_75028 ?auto_75029 ) ) ( not ( = ?auto_75028 ?auto_75030 ) ) ( not ( = ?auto_75028 ?auto_75031 ) ) ( not ( = ?auto_75028 ?auto_75032 ) ) ( not ( = ?auto_75028 ?auto_75033 ) ) ( not ( = ?auto_75028 ?auto_75034 ) ) ( not ( = ?auto_75028 ?auto_75035 ) ) ( not ( = ?auto_75028 ?auto_75036 ) ) ( not ( = ?auto_75029 ?auto_75030 ) ) ( not ( = ?auto_75029 ?auto_75031 ) ) ( not ( = ?auto_75029 ?auto_75032 ) ) ( not ( = ?auto_75029 ?auto_75033 ) ) ( not ( = ?auto_75029 ?auto_75034 ) ) ( not ( = ?auto_75029 ?auto_75035 ) ) ( not ( = ?auto_75029 ?auto_75036 ) ) ( not ( = ?auto_75030 ?auto_75031 ) ) ( not ( = ?auto_75030 ?auto_75032 ) ) ( not ( = ?auto_75030 ?auto_75033 ) ) ( not ( = ?auto_75030 ?auto_75034 ) ) ( not ( = ?auto_75030 ?auto_75035 ) ) ( not ( = ?auto_75030 ?auto_75036 ) ) ( not ( = ?auto_75031 ?auto_75032 ) ) ( not ( = ?auto_75031 ?auto_75033 ) ) ( not ( = ?auto_75031 ?auto_75034 ) ) ( not ( = ?auto_75031 ?auto_75035 ) ) ( not ( = ?auto_75031 ?auto_75036 ) ) ( not ( = ?auto_75032 ?auto_75033 ) ) ( not ( = ?auto_75032 ?auto_75034 ) ) ( not ( = ?auto_75032 ?auto_75035 ) ) ( not ( = ?auto_75032 ?auto_75036 ) ) ( not ( = ?auto_75033 ?auto_75034 ) ) ( not ( = ?auto_75033 ?auto_75035 ) ) ( not ( = ?auto_75033 ?auto_75036 ) ) ( not ( = ?auto_75034 ?auto_75035 ) ) ( not ( = ?auto_75034 ?auto_75036 ) ) ( not ( = ?auto_75035 ?auto_75036 ) ) ( ON ?auto_75035 ?auto_75036 ) ( ON ?auto_75034 ?auto_75035 ) ( ON ?auto_75033 ?auto_75034 ) ( ON ?auto_75032 ?auto_75033 ) ( ON ?auto_75031 ?auto_75032 ) ( CLEAR ?auto_75029 ) ( ON ?auto_75030 ?auto_75031 ) ( CLEAR ?auto_75030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_75027 ?auto_75028 ?auto_75029 ?auto_75030 )
      ( MAKE-10PILE ?auto_75027 ?auto_75028 ?auto_75029 ?auto_75030 ?auto_75031 ?auto_75032 ?auto_75033 ?auto_75034 ?auto_75035 ?auto_75036 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_75047 - BLOCK
      ?auto_75048 - BLOCK
      ?auto_75049 - BLOCK
      ?auto_75050 - BLOCK
      ?auto_75051 - BLOCK
      ?auto_75052 - BLOCK
      ?auto_75053 - BLOCK
      ?auto_75054 - BLOCK
      ?auto_75055 - BLOCK
      ?auto_75056 - BLOCK
    )
    :vars
    (
      ?auto_75057 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75056 ?auto_75057 ) ( ON-TABLE ?auto_75047 ) ( ON ?auto_75048 ?auto_75047 ) ( not ( = ?auto_75047 ?auto_75048 ) ) ( not ( = ?auto_75047 ?auto_75049 ) ) ( not ( = ?auto_75047 ?auto_75050 ) ) ( not ( = ?auto_75047 ?auto_75051 ) ) ( not ( = ?auto_75047 ?auto_75052 ) ) ( not ( = ?auto_75047 ?auto_75053 ) ) ( not ( = ?auto_75047 ?auto_75054 ) ) ( not ( = ?auto_75047 ?auto_75055 ) ) ( not ( = ?auto_75047 ?auto_75056 ) ) ( not ( = ?auto_75047 ?auto_75057 ) ) ( not ( = ?auto_75048 ?auto_75049 ) ) ( not ( = ?auto_75048 ?auto_75050 ) ) ( not ( = ?auto_75048 ?auto_75051 ) ) ( not ( = ?auto_75048 ?auto_75052 ) ) ( not ( = ?auto_75048 ?auto_75053 ) ) ( not ( = ?auto_75048 ?auto_75054 ) ) ( not ( = ?auto_75048 ?auto_75055 ) ) ( not ( = ?auto_75048 ?auto_75056 ) ) ( not ( = ?auto_75048 ?auto_75057 ) ) ( not ( = ?auto_75049 ?auto_75050 ) ) ( not ( = ?auto_75049 ?auto_75051 ) ) ( not ( = ?auto_75049 ?auto_75052 ) ) ( not ( = ?auto_75049 ?auto_75053 ) ) ( not ( = ?auto_75049 ?auto_75054 ) ) ( not ( = ?auto_75049 ?auto_75055 ) ) ( not ( = ?auto_75049 ?auto_75056 ) ) ( not ( = ?auto_75049 ?auto_75057 ) ) ( not ( = ?auto_75050 ?auto_75051 ) ) ( not ( = ?auto_75050 ?auto_75052 ) ) ( not ( = ?auto_75050 ?auto_75053 ) ) ( not ( = ?auto_75050 ?auto_75054 ) ) ( not ( = ?auto_75050 ?auto_75055 ) ) ( not ( = ?auto_75050 ?auto_75056 ) ) ( not ( = ?auto_75050 ?auto_75057 ) ) ( not ( = ?auto_75051 ?auto_75052 ) ) ( not ( = ?auto_75051 ?auto_75053 ) ) ( not ( = ?auto_75051 ?auto_75054 ) ) ( not ( = ?auto_75051 ?auto_75055 ) ) ( not ( = ?auto_75051 ?auto_75056 ) ) ( not ( = ?auto_75051 ?auto_75057 ) ) ( not ( = ?auto_75052 ?auto_75053 ) ) ( not ( = ?auto_75052 ?auto_75054 ) ) ( not ( = ?auto_75052 ?auto_75055 ) ) ( not ( = ?auto_75052 ?auto_75056 ) ) ( not ( = ?auto_75052 ?auto_75057 ) ) ( not ( = ?auto_75053 ?auto_75054 ) ) ( not ( = ?auto_75053 ?auto_75055 ) ) ( not ( = ?auto_75053 ?auto_75056 ) ) ( not ( = ?auto_75053 ?auto_75057 ) ) ( not ( = ?auto_75054 ?auto_75055 ) ) ( not ( = ?auto_75054 ?auto_75056 ) ) ( not ( = ?auto_75054 ?auto_75057 ) ) ( not ( = ?auto_75055 ?auto_75056 ) ) ( not ( = ?auto_75055 ?auto_75057 ) ) ( not ( = ?auto_75056 ?auto_75057 ) ) ( ON ?auto_75055 ?auto_75056 ) ( ON ?auto_75054 ?auto_75055 ) ( ON ?auto_75053 ?auto_75054 ) ( ON ?auto_75052 ?auto_75053 ) ( ON ?auto_75051 ?auto_75052 ) ( ON ?auto_75050 ?auto_75051 ) ( CLEAR ?auto_75048 ) ( ON ?auto_75049 ?auto_75050 ) ( CLEAR ?auto_75049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75047 ?auto_75048 ?auto_75049 )
      ( MAKE-10PILE ?auto_75047 ?auto_75048 ?auto_75049 ?auto_75050 ?auto_75051 ?auto_75052 ?auto_75053 ?auto_75054 ?auto_75055 ?auto_75056 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_75068 - BLOCK
      ?auto_75069 - BLOCK
      ?auto_75070 - BLOCK
      ?auto_75071 - BLOCK
      ?auto_75072 - BLOCK
      ?auto_75073 - BLOCK
      ?auto_75074 - BLOCK
      ?auto_75075 - BLOCK
      ?auto_75076 - BLOCK
      ?auto_75077 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75077 ) ( ON-TABLE ?auto_75068 ) ( ON ?auto_75069 ?auto_75068 ) ( not ( = ?auto_75068 ?auto_75069 ) ) ( not ( = ?auto_75068 ?auto_75070 ) ) ( not ( = ?auto_75068 ?auto_75071 ) ) ( not ( = ?auto_75068 ?auto_75072 ) ) ( not ( = ?auto_75068 ?auto_75073 ) ) ( not ( = ?auto_75068 ?auto_75074 ) ) ( not ( = ?auto_75068 ?auto_75075 ) ) ( not ( = ?auto_75068 ?auto_75076 ) ) ( not ( = ?auto_75068 ?auto_75077 ) ) ( not ( = ?auto_75069 ?auto_75070 ) ) ( not ( = ?auto_75069 ?auto_75071 ) ) ( not ( = ?auto_75069 ?auto_75072 ) ) ( not ( = ?auto_75069 ?auto_75073 ) ) ( not ( = ?auto_75069 ?auto_75074 ) ) ( not ( = ?auto_75069 ?auto_75075 ) ) ( not ( = ?auto_75069 ?auto_75076 ) ) ( not ( = ?auto_75069 ?auto_75077 ) ) ( not ( = ?auto_75070 ?auto_75071 ) ) ( not ( = ?auto_75070 ?auto_75072 ) ) ( not ( = ?auto_75070 ?auto_75073 ) ) ( not ( = ?auto_75070 ?auto_75074 ) ) ( not ( = ?auto_75070 ?auto_75075 ) ) ( not ( = ?auto_75070 ?auto_75076 ) ) ( not ( = ?auto_75070 ?auto_75077 ) ) ( not ( = ?auto_75071 ?auto_75072 ) ) ( not ( = ?auto_75071 ?auto_75073 ) ) ( not ( = ?auto_75071 ?auto_75074 ) ) ( not ( = ?auto_75071 ?auto_75075 ) ) ( not ( = ?auto_75071 ?auto_75076 ) ) ( not ( = ?auto_75071 ?auto_75077 ) ) ( not ( = ?auto_75072 ?auto_75073 ) ) ( not ( = ?auto_75072 ?auto_75074 ) ) ( not ( = ?auto_75072 ?auto_75075 ) ) ( not ( = ?auto_75072 ?auto_75076 ) ) ( not ( = ?auto_75072 ?auto_75077 ) ) ( not ( = ?auto_75073 ?auto_75074 ) ) ( not ( = ?auto_75073 ?auto_75075 ) ) ( not ( = ?auto_75073 ?auto_75076 ) ) ( not ( = ?auto_75073 ?auto_75077 ) ) ( not ( = ?auto_75074 ?auto_75075 ) ) ( not ( = ?auto_75074 ?auto_75076 ) ) ( not ( = ?auto_75074 ?auto_75077 ) ) ( not ( = ?auto_75075 ?auto_75076 ) ) ( not ( = ?auto_75075 ?auto_75077 ) ) ( not ( = ?auto_75076 ?auto_75077 ) ) ( ON ?auto_75076 ?auto_75077 ) ( ON ?auto_75075 ?auto_75076 ) ( ON ?auto_75074 ?auto_75075 ) ( ON ?auto_75073 ?auto_75074 ) ( ON ?auto_75072 ?auto_75073 ) ( ON ?auto_75071 ?auto_75072 ) ( CLEAR ?auto_75069 ) ( ON ?auto_75070 ?auto_75071 ) ( CLEAR ?auto_75070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_75068 ?auto_75069 ?auto_75070 )
      ( MAKE-10PILE ?auto_75068 ?auto_75069 ?auto_75070 ?auto_75071 ?auto_75072 ?auto_75073 ?auto_75074 ?auto_75075 ?auto_75076 ?auto_75077 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_75088 - BLOCK
      ?auto_75089 - BLOCK
      ?auto_75090 - BLOCK
      ?auto_75091 - BLOCK
      ?auto_75092 - BLOCK
      ?auto_75093 - BLOCK
      ?auto_75094 - BLOCK
      ?auto_75095 - BLOCK
      ?auto_75096 - BLOCK
      ?auto_75097 - BLOCK
    )
    :vars
    (
      ?auto_75098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75097 ?auto_75098 ) ( ON-TABLE ?auto_75088 ) ( not ( = ?auto_75088 ?auto_75089 ) ) ( not ( = ?auto_75088 ?auto_75090 ) ) ( not ( = ?auto_75088 ?auto_75091 ) ) ( not ( = ?auto_75088 ?auto_75092 ) ) ( not ( = ?auto_75088 ?auto_75093 ) ) ( not ( = ?auto_75088 ?auto_75094 ) ) ( not ( = ?auto_75088 ?auto_75095 ) ) ( not ( = ?auto_75088 ?auto_75096 ) ) ( not ( = ?auto_75088 ?auto_75097 ) ) ( not ( = ?auto_75088 ?auto_75098 ) ) ( not ( = ?auto_75089 ?auto_75090 ) ) ( not ( = ?auto_75089 ?auto_75091 ) ) ( not ( = ?auto_75089 ?auto_75092 ) ) ( not ( = ?auto_75089 ?auto_75093 ) ) ( not ( = ?auto_75089 ?auto_75094 ) ) ( not ( = ?auto_75089 ?auto_75095 ) ) ( not ( = ?auto_75089 ?auto_75096 ) ) ( not ( = ?auto_75089 ?auto_75097 ) ) ( not ( = ?auto_75089 ?auto_75098 ) ) ( not ( = ?auto_75090 ?auto_75091 ) ) ( not ( = ?auto_75090 ?auto_75092 ) ) ( not ( = ?auto_75090 ?auto_75093 ) ) ( not ( = ?auto_75090 ?auto_75094 ) ) ( not ( = ?auto_75090 ?auto_75095 ) ) ( not ( = ?auto_75090 ?auto_75096 ) ) ( not ( = ?auto_75090 ?auto_75097 ) ) ( not ( = ?auto_75090 ?auto_75098 ) ) ( not ( = ?auto_75091 ?auto_75092 ) ) ( not ( = ?auto_75091 ?auto_75093 ) ) ( not ( = ?auto_75091 ?auto_75094 ) ) ( not ( = ?auto_75091 ?auto_75095 ) ) ( not ( = ?auto_75091 ?auto_75096 ) ) ( not ( = ?auto_75091 ?auto_75097 ) ) ( not ( = ?auto_75091 ?auto_75098 ) ) ( not ( = ?auto_75092 ?auto_75093 ) ) ( not ( = ?auto_75092 ?auto_75094 ) ) ( not ( = ?auto_75092 ?auto_75095 ) ) ( not ( = ?auto_75092 ?auto_75096 ) ) ( not ( = ?auto_75092 ?auto_75097 ) ) ( not ( = ?auto_75092 ?auto_75098 ) ) ( not ( = ?auto_75093 ?auto_75094 ) ) ( not ( = ?auto_75093 ?auto_75095 ) ) ( not ( = ?auto_75093 ?auto_75096 ) ) ( not ( = ?auto_75093 ?auto_75097 ) ) ( not ( = ?auto_75093 ?auto_75098 ) ) ( not ( = ?auto_75094 ?auto_75095 ) ) ( not ( = ?auto_75094 ?auto_75096 ) ) ( not ( = ?auto_75094 ?auto_75097 ) ) ( not ( = ?auto_75094 ?auto_75098 ) ) ( not ( = ?auto_75095 ?auto_75096 ) ) ( not ( = ?auto_75095 ?auto_75097 ) ) ( not ( = ?auto_75095 ?auto_75098 ) ) ( not ( = ?auto_75096 ?auto_75097 ) ) ( not ( = ?auto_75096 ?auto_75098 ) ) ( not ( = ?auto_75097 ?auto_75098 ) ) ( ON ?auto_75096 ?auto_75097 ) ( ON ?auto_75095 ?auto_75096 ) ( ON ?auto_75094 ?auto_75095 ) ( ON ?auto_75093 ?auto_75094 ) ( ON ?auto_75092 ?auto_75093 ) ( ON ?auto_75091 ?auto_75092 ) ( ON ?auto_75090 ?auto_75091 ) ( CLEAR ?auto_75088 ) ( ON ?auto_75089 ?auto_75090 ) ( CLEAR ?auto_75089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75088 ?auto_75089 )
      ( MAKE-10PILE ?auto_75088 ?auto_75089 ?auto_75090 ?auto_75091 ?auto_75092 ?auto_75093 ?auto_75094 ?auto_75095 ?auto_75096 ?auto_75097 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_75109 - BLOCK
      ?auto_75110 - BLOCK
      ?auto_75111 - BLOCK
      ?auto_75112 - BLOCK
      ?auto_75113 - BLOCK
      ?auto_75114 - BLOCK
      ?auto_75115 - BLOCK
      ?auto_75116 - BLOCK
      ?auto_75117 - BLOCK
      ?auto_75118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75118 ) ( ON-TABLE ?auto_75109 ) ( not ( = ?auto_75109 ?auto_75110 ) ) ( not ( = ?auto_75109 ?auto_75111 ) ) ( not ( = ?auto_75109 ?auto_75112 ) ) ( not ( = ?auto_75109 ?auto_75113 ) ) ( not ( = ?auto_75109 ?auto_75114 ) ) ( not ( = ?auto_75109 ?auto_75115 ) ) ( not ( = ?auto_75109 ?auto_75116 ) ) ( not ( = ?auto_75109 ?auto_75117 ) ) ( not ( = ?auto_75109 ?auto_75118 ) ) ( not ( = ?auto_75110 ?auto_75111 ) ) ( not ( = ?auto_75110 ?auto_75112 ) ) ( not ( = ?auto_75110 ?auto_75113 ) ) ( not ( = ?auto_75110 ?auto_75114 ) ) ( not ( = ?auto_75110 ?auto_75115 ) ) ( not ( = ?auto_75110 ?auto_75116 ) ) ( not ( = ?auto_75110 ?auto_75117 ) ) ( not ( = ?auto_75110 ?auto_75118 ) ) ( not ( = ?auto_75111 ?auto_75112 ) ) ( not ( = ?auto_75111 ?auto_75113 ) ) ( not ( = ?auto_75111 ?auto_75114 ) ) ( not ( = ?auto_75111 ?auto_75115 ) ) ( not ( = ?auto_75111 ?auto_75116 ) ) ( not ( = ?auto_75111 ?auto_75117 ) ) ( not ( = ?auto_75111 ?auto_75118 ) ) ( not ( = ?auto_75112 ?auto_75113 ) ) ( not ( = ?auto_75112 ?auto_75114 ) ) ( not ( = ?auto_75112 ?auto_75115 ) ) ( not ( = ?auto_75112 ?auto_75116 ) ) ( not ( = ?auto_75112 ?auto_75117 ) ) ( not ( = ?auto_75112 ?auto_75118 ) ) ( not ( = ?auto_75113 ?auto_75114 ) ) ( not ( = ?auto_75113 ?auto_75115 ) ) ( not ( = ?auto_75113 ?auto_75116 ) ) ( not ( = ?auto_75113 ?auto_75117 ) ) ( not ( = ?auto_75113 ?auto_75118 ) ) ( not ( = ?auto_75114 ?auto_75115 ) ) ( not ( = ?auto_75114 ?auto_75116 ) ) ( not ( = ?auto_75114 ?auto_75117 ) ) ( not ( = ?auto_75114 ?auto_75118 ) ) ( not ( = ?auto_75115 ?auto_75116 ) ) ( not ( = ?auto_75115 ?auto_75117 ) ) ( not ( = ?auto_75115 ?auto_75118 ) ) ( not ( = ?auto_75116 ?auto_75117 ) ) ( not ( = ?auto_75116 ?auto_75118 ) ) ( not ( = ?auto_75117 ?auto_75118 ) ) ( ON ?auto_75117 ?auto_75118 ) ( ON ?auto_75116 ?auto_75117 ) ( ON ?auto_75115 ?auto_75116 ) ( ON ?auto_75114 ?auto_75115 ) ( ON ?auto_75113 ?auto_75114 ) ( ON ?auto_75112 ?auto_75113 ) ( ON ?auto_75111 ?auto_75112 ) ( CLEAR ?auto_75109 ) ( ON ?auto_75110 ?auto_75111 ) ( CLEAR ?auto_75110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_75109 ?auto_75110 )
      ( MAKE-10PILE ?auto_75109 ?auto_75110 ?auto_75111 ?auto_75112 ?auto_75113 ?auto_75114 ?auto_75115 ?auto_75116 ?auto_75117 ?auto_75118 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_75129 - BLOCK
      ?auto_75130 - BLOCK
      ?auto_75131 - BLOCK
      ?auto_75132 - BLOCK
      ?auto_75133 - BLOCK
      ?auto_75134 - BLOCK
      ?auto_75135 - BLOCK
      ?auto_75136 - BLOCK
      ?auto_75137 - BLOCK
      ?auto_75138 - BLOCK
    )
    :vars
    (
      ?auto_75139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_75138 ?auto_75139 ) ( not ( = ?auto_75129 ?auto_75130 ) ) ( not ( = ?auto_75129 ?auto_75131 ) ) ( not ( = ?auto_75129 ?auto_75132 ) ) ( not ( = ?auto_75129 ?auto_75133 ) ) ( not ( = ?auto_75129 ?auto_75134 ) ) ( not ( = ?auto_75129 ?auto_75135 ) ) ( not ( = ?auto_75129 ?auto_75136 ) ) ( not ( = ?auto_75129 ?auto_75137 ) ) ( not ( = ?auto_75129 ?auto_75138 ) ) ( not ( = ?auto_75129 ?auto_75139 ) ) ( not ( = ?auto_75130 ?auto_75131 ) ) ( not ( = ?auto_75130 ?auto_75132 ) ) ( not ( = ?auto_75130 ?auto_75133 ) ) ( not ( = ?auto_75130 ?auto_75134 ) ) ( not ( = ?auto_75130 ?auto_75135 ) ) ( not ( = ?auto_75130 ?auto_75136 ) ) ( not ( = ?auto_75130 ?auto_75137 ) ) ( not ( = ?auto_75130 ?auto_75138 ) ) ( not ( = ?auto_75130 ?auto_75139 ) ) ( not ( = ?auto_75131 ?auto_75132 ) ) ( not ( = ?auto_75131 ?auto_75133 ) ) ( not ( = ?auto_75131 ?auto_75134 ) ) ( not ( = ?auto_75131 ?auto_75135 ) ) ( not ( = ?auto_75131 ?auto_75136 ) ) ( not ( = ?auto_75131 ?auto_75137 ) ) ( not ( = ?auto_75131 ?auto_75138 ) ) ( not ( = ?auto_75131 ?auto_75139 ) ) ( not ( = ?auto_75132 ?auto_75133 ) ) ( not ( = ?auto_75132 ?auto_75134 ) ) ( not ( = ?auto_75132 ?auto_75135 ) ) ( not ( = ?auto_75132 ?auto_75136 ) ) ( not ( = ?auto_75132 ?auto_75137 ) ) ( not ( = ?auto_75132 ?auto_75138 ) ) ( not ( = ?auto_75132 ?auto_75139 ) ) ( not ( = ?auto_75133 ?auto_75134 ) ) ( not ( = ?auto_75133 ?auto_75135 ) ) ( not ( = ?auto_75133 ?auto_75136 ) ) ( not ( = ?auto_75133 ?auto_75137 ) ) ( not ( = ?auto_75133 ?auto_75138 ) ) ( not ( = ?auto_75133 ?auto_75139 ) ) ( not ( = ?auto_75134 ?auto_75135 ) ) ( not ( = ?auto_75134 ?auto_75136 ) ) ( not ( = ?auto_75134 ?auto_75137 ) ) ( not ( = ?auto_75134 ?auto_75138 ) ) ( not ( = ?auto_75134 ?auto_75139 ) ) ( not ( = ?auto_75135 ?auto_75136 ) ) ( not ( = ?auto_75135 ?auto_75137 ) ) ( not ( = ?auto_75135 ?auto_75138 ) ) ( not ( = ?auto_75135 ?auto_75139 ) ) ( not ( = ?auto_75136 ?auto_75137 ) ) ( not ( = ?auto_75136 ?auto_75138 ) ) ( not ( = ?auto_75136 ?auto_75139 ) ) ( not ( = ?auto_75137 ?auto_75138 ) ) ( not ( = ?auto_75137 ?auto_75139 ) ) ( not ( = ?auto_75138 ?auto_75139 ) ) ( ON ?auto_75137 ?auto_75138 ) ( ON ?auto_75136 ?auto_75137 ) ( ON ?auto_75135 ?auto_75136 ) ( ON ?auto_75134 ?auto_75135 ) ( ON ?auto_75133 ?auto_75134 ) ( ON ?auto_75132 ?auto_75133 ) ( ON ?auto_75131 ?auto_75132 ) ( ON ?auto_75130 ?auto_75131 ) ( ON ?auto_75129 ?auto_75130 ) ( CLEAR ?auto_75129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75129 )
      ( MAKE-10PILE ?auto_75129 ?auto_75130 ?auto_75131 ?auto_75132 ?auto_75133 ?auto_75134 ?auto_75135 ?auto_75136 ?auto_75137 ?auto_75138 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_75150 - BLOCK
      ?auto_75151 - BLOCK
      ?auto_75152 - BLOCK
      ?auto_75153 - BLOCK
      ?auto_75154 - BLOCK
      ?auto_75155 - BLOCK
      ?auto_75156 - BLOCK
      ?auto_75157 - BLOCK
      ?auto_75158 - BLOCK
      ?auto_75159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_75159 ) ( not ( = ?auto_75150 ?auto_75151 ) ) ( not ( = ?auto_75150 ?auto_75152 ) ) ( not ( = ?auto_75150 ?auto_75153 ) ) ( not ( = ?auto_75150 ?auto_75154 ) ) ( not ( = ?auto_75150 ?auto_75155 ) ) ( not ( = ?auto_75150 ?auto_75156 ) ) ( not ( = ?auto_75150 ?auto_75157 ) ) ( not ( = ?auto_75150 ?auto_75158 ) ) ( not ( = ?auto_75150 ?auto_75159 ) ) ( not ( = ?auto_75151 ?auto_75152 ) ) ( not ( = ?auto_75151 ?auto_75153 ) ) ( not ( = ?auto_75151 ?auto_75154 ) ) ( not ( = ?auto_75151 ?auto_75155 ) ) ( not ( = ?auto_75151 ?auto_75156 ) ) ( not ( = ?auto_75151 ?auto_75157 ) ) ( not ( = ?auto_75151 ?auto_75158 ) ) ( not ( = ?auto_75151 ?auto_75159 ) ) ( not ( = ?auto_75152 ?auto_75153 ) ) ( not ( = ?auto_75152 ?auto_75154 ) ) ( not ( = ?auto_75152 ?auto_75155 ) ) ( not ( = ?auto_75152 ?auto_75156 ) ) ( not ( = ?auto_75152 ?auto_75157 ) ) ( not ( = ?auto_75152 ?auto_75158 ) ) ( not ( = ?auto_75152 ?auto_75159 ) ) ( not ( = ?auto_75153 ?auto_75154 ) ) ( not ( = ?auto_75153 ?auto_75155 ) ) ( not ( = ?auto_75153 ?auto_75156 ) ) ( not ( = ?auto_75153 ?auto_75157 ) ) ( not ( = ?auto_75153 ?auto_75158 ) ) ( not ( = ?auto_75153 ?auto_75159 ) ) ( not ( = ?auto_75154 ?auto_75155 ) ) ( not ( = ?auto_75154 ?auto_75156 ) ) ( not ( = ?auto_75154 ?auto_75157 ) ) ( not ( = ?auto_75154 ?auto_75158 ) ) ( not ( = ?auto_75154 ?auto_75159 ) ) ( not ( = ?auto_75155 ?auto_75156 ) ) ( not ( = ?auto_75155 ?auto_75157 ) ) ( not ( = ?auto_75155 ?auto_75158 ) ) ( not ( = ?auto_75155 ?auto_75159 ) ) ( not ( = ?auto_75156 ?auto_75157 ) ) ( not ( = ?auto_75156 ?auto_75158 ) ) ( not ( = ?auto_75156 ?auto_75159 ) ) ( not ( = ?auto_75157 ?auto_75158 ) ) ( not ( = ?auto_75157 ?auto_75159 ) ) ( not ( = ?auto_75158 ?auto_75159 ) ) ( ON ?auto_75158 ?auto_75159 ) ( ON ?auto_75157 ?auto_75158 ) ( ON ?auto_75156 ?auto_75157 ) ( ON ?auto_75155 ?auto_75156 ) ( ON ?auto_75154 ?auto_75155 ) ( ON ?auto_75153 ?auto_75154 ) ( ON ?auto_75152 ?auto_75153 ) ( ON ?auto_75151 ?auto_75152 ) ( ON ?auto_75150 ?auto_75151 ) ( CLEAR ?auto_75150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75150 )
      ( MAKE-10PILE ?auto_75150 ?auto_75151 ?auto_75152 ?auto_75153 ?auto_75154 ?auto_75155 ?auto_75156 ?auto_75157 ?auto_75158 ?auto_75159 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_75170 - BLOCK
      ?auto_75171 - BLOCK
      ?auto_75172 - BLOCK
      ?auto_75173 - BLOCK
      ?auto_75174 - BLOCK
      ?auto_75175 - BLOCK
      ?auto_75176 - BLOCK
      ?auto_75177 - BLOCK
      ?auto_75178 - BLOCK
      ?auto_75179 - BLOCK
    )
    :vars
    (
      ?auto_75180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_75170 ?auto_75171 ) ) ( not ( = ?auto_75170 ?auto_75172 ) ) ( not ( = ?auto_75170 ?auto_75173 ) ) ( not ( = ?auto_75170 ?auto_75174 ) ) ( not ( = ?auto_75170 ?auto_75175 ) ) ( not ( = ?auto_75170 ?auto_75176 ) ) ( not ( = ?auto_75170 ?auto_75177 ) ) ( not ( = ?auto_75170 ?auto_75178 ) ) ( not ( = ?auto_75170 ?auto_75179 ) ) ( not ( = ?auto_75171 ?auto_75172 ) ) ( not ( = ?auto_75171 ?auto_75173 ) ) ( not ( = ?auto_75171 ?auto_75174 ) ) ( not ( = ?auto_75171 ?auto_75175 ) ) ( not ( = ?auto_75171 ?auto_75176 ) ) ( not ( = ?auto_75171 ?auto_75177 ) ) ( not ( = ?auto_75171 ?auto_75178 ) ) ( not ( = ?auto_75171 ?auto_75179 ) ) ( not ( = ?auto_75172 ?auto_75173 ) ) ( not ( = ?auto_75172 ?auto_75174 ) ) ( not ( = ?auto_75172 ?auto_75175 ) ) ( not ( = ?auto_75172 ?auto_75176 ) ) ( not ( = ?auto_75172 ?auto_75177 ) ) ( not ( = ?auto_75172 ?auto_75178 ) ) ( not ( = ?auto_75172 ?auto_75179 ) ) ( not ( = ?auto_75173 ?auto_75174 ) ) ( not ( = ?auto_75173 ?auto_75175 ) ) ( not ( = ?auto_75173 ?auto_75176 ) ) ( not ( = ?auto_75173 ?auto_75177 ) ) ( not ( = ?auto_75173 ?auto_75178 ) ) ( not ( = ?auto_75173 ?auto_75179 ) ) ( not ( = ?auto_75174 ?auto_75175 ) ) ( not ( = ?auto_75174 ?auto_75176 ) ) ( not ( = ?auto_75174 ?auto_75177 ) ) ( not ( = ?auto_75174 ?auto_75178 ) ) ( not ( = ?auto_75174 ?auto_75179 ) ) ( not ( = ?auto_75175 ?auto_75176 ) ) ( not ( = ?auto_75175 ?auto_75177 ) ) ( not ( = ?auto_75175 ?auto_75178 ) ) ( not ( = ?auto_75175 ?auto_75179 ) ) ( not ( = ?auto_75176 ?auto_75177 ) ) ( not ( = ?auto_75176 ?auto_75178 ) ) ( not ( = ?auto_75176 ?auto_75179 ) ) ( not ( = ?auto_75177 ?auto_75178 ) ) ( not ( = ?auto_75177 ?auto_75179 ) ) ( not ( = ?auto_75178 ?auto_75179 ) ) ( ON ?auto_75170 ?auto_75180 ) ( not ( = ?auto_75179 ?auto_75180 ) ) ( not ( = ?auto_75178 ?auto_75180 ) ) ( not ( = ?auto_75177 ?auto_75180 ) ) ( not ( = ?auto_75176 ?auto_75180 ) ) ( not ( = ?auto_75175 ?auto_75180 ) ) ( not ( = ?auto_75174 ?auto_75180 ) ) ( not ( = ?auto_75173 ?auto_75180 ) ) ( not ( = ?auto_75172 ?auto_75180 ) ) ( not ( = ?auto_75171 ?auto_75180 ) ) ( not ( = ?auto_75170 ?auto_75180 ) ) ( ON ?auto_75171 ?auto_75170 ) ( ON ?auto_75172 ?auto_75171 ) ( ON ?auto_75173 ?auto_75172 ) ( ON ?auto_75174 ?auto_75173 ) ( ON ?auto_75175 ?auto_75174 ) ( ON ?auto_75176 ?auto_75175 ) ( ON ?auto_75177 ?auto_75176 ) ( ON ?auto_75178 ?auto_75177 ) ( ON ?auto_75179 ?auto_75178 ) ( CLEAR ?auto_75179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_75179 ?auto_75178 ?auto_75177 ?auto_75176 ?auto_75175 ?auto_75174 ?auto_75173 ?auto_75172 ?auto_75171 ?auto_75170 )
      ( MAKE-10PILE ?auto_75170 ?auto_75171 ?auto_75172 ?auto_75173 ?auto_75174 ?auto_75175 ?auto_75176 ?auto_75177 ?auto_75178 ?auto_75179 ) )
  )

)

