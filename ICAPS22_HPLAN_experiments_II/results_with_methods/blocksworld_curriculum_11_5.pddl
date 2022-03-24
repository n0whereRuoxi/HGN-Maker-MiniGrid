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
      ?auto_117581 - BLOCK
    )
    :vars
    (
      ?auto_117582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117581 ?auto_117582 ) ( CLEAR ?auto_117581 ) ( HAND-EMPTY ) ( not ( = ?auto_117581 ?auto_117582 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117581 ?auto_117582 )
      ( !PUTDOWN ?auto_117581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_117584 - BLOCK
    )
    :vars
    (
      ?auto_117585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117584 ?auto_117585 ) ( CLEAR ?auto_117584 ) ( HAND-EMPTY ) ( not ( = ?auto_117584 ?auto_117585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117584 ?auto_117585 )
      ( !PUTDOWN ?auto_117584 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117588 - BLOCK
      ?auto_117589 - BLOCK
    )
    :vars
    (
      ?auto_117590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117588 ) ( ON ?auto_117589 ?auto_117590 ) ( CLEAR ?auto_117589 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117588 ) ( not ( = ?auto_117588 ?auto_117589 ) ) ( not ( = ?auto_117588 ?auto_117590 ) ) ( not ( = ?auto_117589 ?auto_117590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117589 ?auto_117590 )
      ( !STACK ?auto_117589 ?auto_117588 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117593 - BLOCK
      ?auto_117594 - BLOCK
    )
    :vars
    (
      ?auto_117595 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117593 ) ( ON ?auto_117594 ?auto_117595 ) ( CLEAR ?auto_117594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117593 ) ( not ( = ?auto_117593 ?auto_117594 ) ) ( not ( = ?auto_117593 ?auto_117595 ) ) ( not ( = ?auto_117594 ?auto_117595 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117594 ?auto_117595 )
      ( !STACK ?auto_117594 ?auto_117593 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117598 - BLOCK
      ?auto_117599 - BLOCK
    )
    :vars
    (
      ?auto_117600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117599 ?auto_117600 ) ( not ( = ?auto_117598 ?auto_117599 ) ) ( not ( = ?auto_117598 ?auto_117600 ) ) ( not ( = ?auto_117599 ?auto_117600 ) ) ( ON ?auto_117598 ?auto_117599 ) ( CLEAR ?auto_117598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117598 )
      ( MAKE-2PILE ?auto_117598 ?auto_117599 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_117603 - BLOCK
      ?auto_117604 - BLOCK
    )
    :vars
    (
      ?auto_117605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117604 ?auto_117605 ) ( not ( = ?auto_117603 ?auto_117604 ) ) ( not ( = ?auto_117603 ?auto_117605 ) ) ( not ( = ?auto_117604 ?auto_117605 ) ) ( ON ?auto_117603 ?auto_117604 ) ( CLEAR ?auto_117603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117603 )
      ( MAKE-2PILE ?auto_117603 ?auto_117604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117609 - BLOCK
      ?auto_117610 - BLOCK
      ?auto_117611 - BLOCK
    )
    :vars
    (
      ?auto_117612 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117610 ) ( ON ?auto_117611 ?auto_117612 ) ( CLEAR ?auto_117611 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117609 ) ( ON ?auto_117610 ?auto_117609 ) ( not ( = ?auto_117609 ?auto_117610 ) ) ( not ( = ?auto_117609 ?auto_117611 ) ) ( not ( = ?auto_117609 ?auto_117612 ) ) ( not ( = ?auto_117610 ?auto_117611 ) ) ( not ( = ?auto_117610 ?auto_117612 ) ) ( not ( = ?auto_117611 ?auto_117612 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117611 ?auto_117612 )
      ( !STACK ?auto_117611 ?auto_117610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117616 - BLOCK
      ?auto_117617 - BLOCK
      ?auto_117618 - BLOCK
    )
    :vars
    (
      ?auto_117619 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117617 ) ( ON ?auto_117618 ?auto_117619 ) ( CLEAR ?auto_117618 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117616 ) ( ON ?auto_117617 ?auto_117616 ) ( not ( = ?auto_117616 ?auto_117617 ) ) ( not ( = ?auto_117616 ?auto_117618 ) ) ( not ( = ?auto_117616 ?auto_117619 ) ) ( not ( = ?auto_117617 ?auto_117618 ) ) ( not ( = ?auto_117617 ?auto_117619 ) ) ( not ( = ?auto_117618 ?auto_117619 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117618 ?auto_117619 )
      ( !STACK ?auto_117618 ?auto_117617 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117623 - BLOCK
      ?auto_117624 - BLOCK
      ?auto_117625 - BLOCK
    )
    :vars
    (
      ?auto_117626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117625 ?auto_117626 ) ( ON-TABLE ?auto_117623 ) ( not ( = ?auto_117623 ?auto_117624 ) ) ( not ( = ?auto_117623 ?auto_117625 ) ) ( not ( = ?auto_117623 ?auto_117626 ) ) ( not ( = ?auto_117624 ?auto_117625 ) ) ( not ( = ?auto_117624 ?auto_117626 ) ) ( not ( = ?auto_117625 ?auto_117626 ) ) ( CLEAR ?auto_117623 ) ( ON ?auto_117624 ?auto_117625 ) ( CLEAR ?auto_117624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117623 ?auto_117624 )
      ( MAKE-3PILE ?auto_117623 ?auto_117624 ?auto_117625 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117630 - BLOCK
      ?auto_117631 - BLOCK
      ?auto_117632 - BLOCK
    )
    :vars
    (
      ?auto_117633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117632 ?auto_117633 ) ( ON-TABLE ?auto_117630 ) ( not ( = ?auto_117630 ?auto_117631 ) ) ( not ( = ?auto_117630 ?auto_117632 ) ) ( not ( = ?auto_117630 ?auto_117633 ) ) ( not ( = ?auto_117631 ?auto_117632 ) ) ( not ( = ?auto_117631 ?auto_117633 ) ) ( not ( = ?auto_117632 ?auto_117633 ) ) ( CLEAR ?auto_117630 ) ( ON ?auto_117631 ?auto_117632 ) ( CLEAR ?auto_117631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117630 ?auto_117631 )
      ( MAKE-3PILE ?auto_117630 ?auto_117631 ?auto_117632 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117637 - BLOCK
      ?auto_117638 - BLOCK
      ?auto_117639 - BLOCK
    )
    :vars
    (
      ?auto_117640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117639 ?auto_117640 ) ( not ( = ?auto_117637 ?auto_117638 ) ) ( not ( = ?auto_117637 ?auto_117639 ) ) ( not ( = ?auto_117637 ?auto_117640 ) ) ( not ( = ?auto_117638 ?auto_117639 ) ) ( not ( = ?auto_117638 ?auto_117640 ) ) ( not ( = ?auto_117639 ?auto_117640 ) ) ( ON ?auto_117638 ?auto_117639 ) ( ON ?auto_117637 ?auto_117638 ) ( CLEAR ?auto_117637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117637 )
      ( MAKE-3PILE ?auto_117637 ?auto_117638 ?auto_117639 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_117644 - BLOCK
      ?auto_117645 - BLOCK
      ?auto_117646 - BLOCK
    )
    :vars
    (
      ?auto_117647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117646 ?auto_117647 ) ( not ( = ?auto_117644 ?auto_117645 ) ) ( not ( = ?auto_117644 ?auto_117646 ) ) ( not ( = ?auto_117644 ?auto_117647 ) ) ( not ( = ?auto_117645 ?auto_117646 ) ) ( not ( = ?auto_117645 ?auto_117647 ) ) ( not ( = ?auto_117646 ?auto_117647 ) ) ( ON ?auto_117645 ?auto_117646 ) ( ON ?auto_117644 ?auto_117645 ) ( CLEAR ?auto_117644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117644 )
      ( MAKE-3PILE ?auto_117644 ?auto_117645 ?auto_117646 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117652 - BLOCK
      ?auto_117653 - BLOCK
      ?auto_117654 - BLOCK
      ?auto_117655 - BLOCK
    )
    :vars
    (
      ?auto_117656 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117654 ) ( ON ?auto_117655 ?auto_117656 ) ( CLEAR ?auto_117655 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117652 ) ( ON ?auto_117653 ?auto_117652 ) ( ON ?auto_117654 ?auto_117653 ) ( not ( = ?auto_117652 ?auto_117653 ) ) ( not ( = ?auto_117652 ?auto_117654 ) ) ( not ( = ?auto_117652 ?auto_117655 ) ) ( not ( = ?auto_117652 ?auto_117656 ) ) ( not ( = ?auto_117653 ?auto_117654 ) ) ( not ( = ?auto_117653 ?auto_117655 ) ) ( not ( = ?auto_117653 ?auto_117656 ) ) ( not ( = ?auto_117654 ?auto_117655 ) ) ( not ( = ?auto_117654 ?auto_117656 ) ) ( not ( = ?auto_117655 ?auto_117656 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117655 ?auto_117656 )
      ( !STACK ?auto_117655 ?auto_117654 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117661 - BLOCK
      ?auto_117662 - BLOCK
      ?auto_117663 - BLOCK
      ?auto_117664 - BLOCK
    )
    :vars
    (
      ?auto_117665 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117663 ) ( ON ?auto_117664 ?auto_117665 ) ( CLEAR ?auto_117664 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117661 ) ( ON ?auto_117662 ?auto_117661 ) ( ON ?auto_117663 ?auto_117662 ) ( not ( = ?auto_117661 ?auto_117662 ) ) ( not ( = ?auto_117661 ?auto_117663 ) ) ( not ( = ?auto_117661 ?auto_117664 ) ) ( not ( = ?auto_117661 ?auto_117665 ) ) ( not ( = ?auto_117662 ?auto_117663 ) ) ( not ( = ?auto_117662 ?auto_117664 ) ) ( not ( = ?auto_117662 ?auto_117665 ) ) ( not ( = ?auto_117663 ?auto_117664 ) ) ( not ( = ?auto_117663 ?auto_117665 ) ) ( not ( = ?auto_117664 ?auto_117665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117664 ?auto_117665 )
      ( !STACK ?auto_117664 ?auto_117663 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117670 - BLOCK
      ?auto_117671 - BLOCK
      ?auto_117672 - BLOCK
      ?auto_117673 - BLOCK
    )
    :vars
    (
      ?auto_117674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117673 ?auto_117674 ) ( ON-TABLE ?auto_117670 ) ( ON ?auto_117671 ?auto_117670 ) ( not ( = ?auto_117670 ?auto_117671 ) ) ( not ( = ?auto_117670 ?auto_117672 ) ) ( not ( = ?auto_117670 ?auto_117673 ) ) ( not ( = ?auto_117670 ?auto_117674 ) ) ( not ( = ?auto_117671 ?auto_117672 ) ) ( not ( = ?auto_117671 ?auto_117673 ) ) ( not ( = ?auto_117671 ?auto_117674 ) ) ( not ( = ?auto_117672 ?auto_117673 ) ) ( not ( = ?auto_117672 ?auto_117674 ) ) ( not ( = ?auto_117673 ?auto_117674 ) ) ( CLEAR ?auto_117671 ) ( ON ?auto_117672 ?auto_117673 ) ( CLEAR ?auto_117672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117670 ?auto_117671 ?auto_117672 )
      ( MAKE-4PILE ?auto_117670 ?auto_117671 ?auto_117672 ?auto_117673 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117679 - BLOCK
      ?auto_117680 - BLOCK
      ?auto_117681 - BLOCK
      ?auto_117682 - BLOCK
    )
    :vars
    (
      ?auto_117683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117682 ?auto_117683 ) ( ON-TABLE ?auto_117679 ) ( ON ?auto_117680 ?auto_117679 ) ( not ( = ?auto_117679 ?auto_117680 ) ) ( not ( = ?auto_117679 ?auto_117681 ) ) ( not ( = ?auto_117679 ?auto_117682 ) ) ( not ( = ?auto_117679 ?auto_117683 ) ) ( not ( = ?auto_117680 ?auto_117681 ) ) ( not ( = ?auto_117680 ?auto_117682 ) ) ( not ( = ?auto_117680 ?auto_117683 ) ) ( not ( = ?auto_117681 ?auto_117682 ) ) ( not ( = ?auto_117681 ?auto_117683 ) ) ( not ( = ?auto_117682 ?auto_117683 ) ) ( CLEAR ?auto_117680 ) ( ON ?auto_117681 ?auto_117682 ) ( CLEAR ?auto_117681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117679 ?auto_117680 ?auto_117681 )
      ( MAKE-4PILE ?auto_117679 ?auto_117680 ?auto_117681 ?auto_117682 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117688 - BLOCK
      ?auto_117689 - BLOCK
      ?auto_117690 - BLOCK
      ?auto_117691 - BLOCK
    )
    :vars
    (
      ?auto_117692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117691 ?auto_117692 ) ( ON-TABLE ?auto_117688 ) ( not ( = ?auto_117688 ?auto_117689 ) ) ( not ( = ?auto_117688 ?auto_117690 ) ) ( not ( = ?auto_117688 ?auto_117691 ) ) ( not ( = ?auto_117688 ?auto_117692 ) ) ( not ( = ?auto_117689 ?auto_117690 ) ) ( not ( = ?auto_117689 ?auto_117691 ) ) ( not ( = ?auto_117689 ?auto_117692 ) ) ( not ( = ?auto_117690 ?auto_117691 ) ) ( not ( = ?auto_117690 ?auto_117692 ) ) ( not ( = ?auto_117691 ?auto_117692 ) ) ( ON ?auto_117690 ?auto_117691 ) ( CLEAR ?auto_117688 ) ( ON ?auto_117689 ?auto_117690 ) ( CLEAR ?auto_117689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117688 ?auto_117689 )
      ( MAKE-4PILE ?auto_117688 ?auto_117689 ?auto_117690 ?auto_117691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117697 - BLOCK
      ?auto_117698 - BLOCK
      ?auto_117699 - BLOCK
      ?auto_117700 - BLOCK
    )
    :vars
    (
      ?auto_117701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117700 ?auto_117701 ) ( ON-TABLE ?auto_117697 ) ( not ( = ?auto_117697 ?auto_117698 ) ) ( not ( = ?auto_117697 ?auto_117699 ) ) ( not ( = ?auto_117697 ?auto_117700 ) ) ( not ( = ?auto_117697 ?auto_117701 ) ) ( not ( = ?auto_117698 ?auto_117699 ) ) ( not ( = ?auto_117698 ?auto_117700 ) ) ( not ( = ?auto_117698 ?auto_117701 ) ) ( not ( = ?auto_117699 ?auto_117700 ) ) ( not ( = ?auto_117699 ?auto_117701 ) ) ( not ( = ?auto_117700 ?auto_117701 ) ) ( ON ?auto_117699 ?auto_117700 ) ( CLEAR ?auto_117697 ) ( ON ?auto_117698 ?auto_117699 ) ( CLEAR ?auto_117698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117697 ?auto_117698 )
      ( MAKE-4PILE ?auto_117697 ?auto_117698 ?auto_117699 ?auto_117700 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117706 - BLOCK
      ?auto_117707 - BLOCK
      ?auto_117708 - BLOCK
      ?auto_117709 - BLOCK
    )
    :vars
    (
      ?auto_117710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117709 ?auto_117710 ) ( not ( = ?auto_117706 ?auto_117707 ) ) ( not ( = ?auto_117706 ?auto_117708 ) ) ( not ( = ?auto_117706 ?auto_117709 ) ) ( not ( = ?auto_117706 ?auto_117710 ) ) ( not ( = ?auto_117707 ?auto_117708 ) ) ( not ( = ?auto_117707 ?auto_117709 ) ) ( not ( = ?auto_117707 ?auto_117710 ) ) ( not ( = ?auto_117708 ?auto_117709 ) ) ( not ( = ?auto_117708 ?auto_117710 ) ) ( not ( = ?auto_117709 ?auto_117710 ) ) ( ON ?auto_117708 ?auto_117709 ) ( ON ?auto_117707 ?auto_117708 ) ( ON ?auto_117706 ?auto_117707 ) ( CLEAR ?auto_117706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117706 )
      ( MAKE-4PILE ?auto_117706 ?auto_117707 ?auto_117708 ?auto_117709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_117715 - BLOCK
      ?auto_117716 - BLOCK
      ?auto_117717 - BLOCK
      ?auto_117718 - BLOCK
    )
    :vars
    (
      ?auto_117719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117718 ?auto_117719 ) ( not ( = ?auto_117715 ?auto_117716 ) ) ( not ( = ?auto_117715 ?auto_117717 ) ) ( not ( = ?auto_117715 ?auto_117718 ) ) ( not ( = ?auto_117715 ?auto_117719 ) ) ( not ( = ?auto_117716 ?auto_117717 ) ) ( not ( = ?auto_117716 ?auto_117718 ) ) ( not ( = ?auto_117716 ?auto_117719 ) ) ( not ( = ?auto_117717 ?auto_117718 ) ) ( not ( = ?auto_117717 ?auto_117719 ) ) ( not ( = ?auto_117718 ?auto_117719 ) ) ( ON ?auto_117717 ?auto_117718 ) ( ON ?auto_117716 ?auto_117717 ) ( ON ?auto_117715 ?auto_117716 ) ( CLEAR ?auto_117715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117715 )
      ( MAKE-4PILE ?auto_117715 ?auto_117716 ?auto_117717 ?auto_117718 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117725 - BLOCK
      ?auto_117726 - BLOCK
      ?auto_117727 - BLOCK
      ?auto_117728 - BLOCK
      ?auto_117729 - BLOCK
    )
    :vars
    (
      ?auto_117730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117728 ) ( ON ?auto_117729 ?auto_117730 ) ( CLEAR ?auto_117729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117725 ) ( ON ?auto_117726 ?auto_117725 ) ( ON ?auto_117727 ?auto_117726 ) ( ON ?auto_117728 ?auto_117727 ) ( not ( = ?auto_117725 ?auto_117726 ) ) ( not ( = ?auto_117725 ?auto_117727 ) ) ( not ( = ?auto_117725 ?auto_117728 ) ) ( not ( = ?auto_117725 ?auto_117729 ) ) ( not ( = ?auto_117725 ?auto_117730 ) ) ( not ( = ?auto_117726 ?auto_117727 ) ) ( not ( = ?auto_117726 ?auto_117728 ) ) ( not ( = ?auto_117726 ?auto_117729 ) ) ( not ( = ?auto_117726 ?auto_117730 ) ) ( not ( = ?auto_117727 ?auto_117728 ) ) ( not ( = ?auto_117727 ?auto_117729 ) ) ( not ( = ?auto_117727 ?auto_117730 ) ) ( not ( = ?auto_117728 ?auto_117729 ) ) ( not ( = ?auto_117728 ?auto_117730 ) ) ( not ( = ?auto_117729 ?auto_117730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117729 ?auto_117730 )
      ( !STACK ?auto_117729 ?auto_117728 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117736 - BLOCK
      ?auto_117737 - BLOCK
      ?auto_117738 - BLOCK
      ?auto_117739 - BLOCK
      ?auto_117740 - BLOCK
    )
    :vars
    (
      ?auto_117741 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117739 ) ( ON ?auto_117740 ?auto_117741 ) ( CLEAR ?auto_117740 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117736 ) ( ON ?auto_117737 ?auto_117736 ) ( ON ?auto_117738 ?auto_117737 ) ( ON ?auto_117739 ?auto_117738 ) ( not ( = ?auto_117736 ?auto_117737 ) ) ( not ( = ?auto_117736 ?auto_117738 ) ) ( not ( = ?auto_117736 ?auto_117739 ) ) ( not ( = ?auto_117736 ?auto_117740 ) ) ( not ( = ?auto_117736 ?auto_117741 ) ) ( not ( = ?auto_117737 ?auto_117738 ) ) ( not ( = ?auto_117737 ?auto_117739 ) ) ( not ( = ?auto_117737 ?auto_117740 ) ) ( not ( = ?auto_117737 ?auto_117741 ) ) ( not ( = ?auto_117738 ?auto_117739 ) ) ( not ( = ?auto_117738 ?auto_117740 ) ) ( not ( = ?auto_117738 ?auto_117741 ) ) ( not ( = ?auto_117739 ?auto_117740 ) ) ( not ( = ?auto_117739 ?auto_117741 ) ) ( not ( = ?auto_117740 ?auto_117741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117740 ?auto_117741 )
      ( !STACK ?auto_117740 ?auto_117739 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117747 - BLOCK
      ?auto_117748 - BLOCK
      ?auto_117749 - BLOCK
      ?auto_117750 - BLOCK
      ?auto_117751 - BLOCK
    )
    :vars
    (
      ?auto_117752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117751 ?auto_117752 ) ( ON-TABLE ?auto_117747 ) ( ON ?auto_117748 ?auto_117747 ) ( ON ?auto_117749 ?auto_117748 ) ( not ( = ?auto_117747 ?auto_117748 ) ) ( not ( = ?auto_117747 ?auto_117749 ) ) ( not ( = ?auto_117747 ?auto_117750 ) ) ( not ( = ?auto_117747 ?auto_117751 ) ) ( not ( = ?auto_117747 ?auto_117752 ) ) ( not ( = ?auto_117748 ?auto_117749 ) ) ( not ( = ?auto_117748 ?auto_117750 ) ) ( not ( = ?auto_117748 ?auto_117751 ) ) ( not ( = ?auto_117748 ?auto_117752 ) ) ( not ( = ?auto_117749 ?auto_117750 ) ) ( not ( = ?auto_117749 ?auto_117751 ) ) ( not ( = ?auto_117749 ?auto_117752 ) ) ( not ( = ?auto_117750 ?auto_117751 ) ) ( not ( = ?auto_117750 ?auto_117752 ) ) ( not ( = ?auto_117751 ?auto_117752 ) ) ( CLEAR ?auto_117749 ) ( ON ?auto_117750 ?auto_117751 ) ( CLEAR ?auto_117750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117747 ?auto_117748 ?auto_117749 ?auto_117750 )
      ( MAKE-5PILE ?auto_117747 ?auto_117748 ?auto_117749 ?auto_117750 ?auto_117751 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117758 - BLOCK
      ?auto_117759 - BLOCK
      ?auto_117760 - BLOCK
      ?auto_117761 - BLOCK
      ?auto_117762 - BLOCK
    )
    :vars
    (
      ?auto_117763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117762 ?auto_117763 ) ( ON-TABLE ?auto_117758 ) ( ON ?auto_117759 ?auto_117758 ) ( ON ?auto_117760 ?auto_117759 ) ( not ( = ?auto_117758 ?auto_117759 ) ) ( not ( = ?auto_117758 ?auto_117760 ) ) ( not ( = ?auto_117758 ?auto_117761 ) ) ( not ( = ?auto_117758 ?auto_117762 ) ) ( not ( = ?auto_117758 ?auto_117763 ) ) ( not ( = ?auto_117759 ?auto_117760 ) ) ( not ( = ?auto_117759 ?auto_117761 ) ) ( not ( = ?auto_117759 ?auto_117762 ) ) ( not ( = ?auto_117759 ?auto_117763 ) ) ( not ( = ?auto_117760 ?auto_117761 ) ) ( not ( = ?auto_117760 ?auto_117762 ) ) ( not ( = ?auto_117760 ?auto_117763 ) ) ( not ( = ?auto_117761 ?auto_117762 ) ) ( not ( = ?auto_117761 ?auto_117763 ) ) ( not ( = ?auto_117762 ?auto_117763 ) ) ( CLEAR ?auto_117760 ) ( ON ?auto_117761 ?auto_117762 ) ( CLEAR ?auto_117761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117758 ?auto_117759 ?auto_117760 ?auto_117761 )
      ( MAKE-5PILE ?auto_117758 ?auto_117759 ?auto_117760 ?auto_117761 ?auto_117762 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117769 - BLOCK
      ?auto_117770 - BLOCK
      ?auto_117771 - BLOCK
      ?auto_117772 - BLOCK
      ?auto_117773 - BLOCK
    )
    :vars
    (
      ?auto_117774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117773 ?auto_117774 ) ( ON-TABLE ?auto_117769 ) ( ON ?auto_117770 ?auto_117769 ) ( not ( = ?auto_117769 ?auto_117770 ) ) ( not ( = ?auto_117769 ?auto_117771 ) ) ( not ( = ?auto_117769 ?auto_117772 ) ) ( not ( = ?auto_117769 ?auto_117773 ) ) ( not ( = ?auto_117769 ?auto_117774 ) ) ( not ( = ?auto_117770 ?auto_117771 ) ) ( not ( = ?auto_117770 ?auto_117772 ) ) ( not ( = ?auto_117770 ?auto_117773 ) ) ( not ( = ?auto_117770 ?auto_117774 ) ) ( not ( = ?auto_117771 ?auto_117772 ) ) ( not ( = ?auto_117771 ?auto_117773 ) ) ( not ( = ?auto_117771 ?auto_117774 ) ) ( not ( = ?auto_117772 ?auto_117773 ) ) ( not ( = ?auto_117772 ?auto_117774 ) ) ( not ( = ?auto_117773 ?auto_117774 ) ) ( ON ?auto_117772 ?auto_117773 ) ( CLEAR ?auto_117770 ) ( ON ?auto_117771 ?auto_117772 ) ( CLEAR ?auto_117771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117769 ?auto_117770 ?auto_117771 )
      ( MAKE-5PILE ?auto_117769 ?auto_117770 ?auto_117771 ?auto_117772 ?auto_117773 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117780 - BLOCK
      ?auto_117781 - BLOCK
      ?auto_117782 - BLOCK
      ?auto_117783 - BLOCK
      ?auto_117784 - BLOCK
    )
    :vars
    (
      ?auto_117785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117784 ?auto_117785 ) ( ON-TABLE ?auto_117780 ) ( ON ?auto_117781 ?auto_117780 ) ( not ( = ?auto_117780 ?auto_117781 ) ) ( not ( = ?auto_117780 ?auto_117782 ) ) ( not ( = ?auto_117780 ?auto_117783 ) ) ( not ( = ?auto_117780 ?auto_117784 ) ) ( not ( = ?auto_117780 ?auto_117785 ) ) ( not ( = ?auto_117781 ?auto_117782 ) ) ( not ( = ?auto_117781 ?auto_117783 ) ) ( not ( = ?auto_117781 ?auto_117784 ) ) ( not ( = ?auto_117781 ?auto_117785 ) ) ( not ( = ?auto_117782 ?auto_117783 ) ) ( not ( = ?auto_117782 ?auto_117784 ) ) ( not ( = ?auto_117782 ?auto_117785 ) ) ( not ( = ?auto_117783 ?auto_117784 ) ) ( not ( = ?auto_117783 ?auto_117785 ) ) ( not ( = ?auto_117784 ?auto_117785 ) ) ( ON ?auto_117783 ?auto_117784 ) ( CLEAR ?auto_117781 ) ( ON ?auto_117782 ?auto_117783 ) ( CLEAR ?auto_117782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117780 ?auto_117781 ?auto_117782 )
      ( MAKE-5PILE ?auto_117780 ?auto_117781 ?auto_117782 ?auto_117783 ?auto_117784 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117791 - BLOCK
      ?auto_117792 - BLOCK
      ?auto_117793 - BLOCK
      ?auto_117794 - BLOCK
      ?auto_117795 - BLOCK
    )
    :vars
    (
      ?auto_117796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117795 ?auto_117796 ) ( ON-TABLE ?auto_117791 ) ( not ( = ?auto_117791 ?auto_117792 ) ) ( not ( = ?auto_117791 ?auto_117793 ) ) ( not ( = ?auto_117791 ?auto_117794 ) ) ( not ( = ?auto_117791 ?auto_117795 ) ) ( not ( = ?auto_117791 ?auto_117796 ) ) ( not ( = ?auto_117792 ?auto_117793 ) ) ( not ( = ?auto_117792 ?auto_117794 ) ) ( not ( = ?auto_117792 ?auto_117795 ) ) ( not ( = ?auto_117792 ?auto_117796 ) ) ( not ( = ?auto_117793 ?auto_117794 ) ) ( not ( = ?auto_117793 ?auto_117795 ) ) ( not ( = ?auto_117793 ?auto_117796 ) ) ( not ( = ?auto_117794 ?auto_117795 ) ) ( not ( = ?auto_117794 ?auto_117796 ) ) ( not ( = ?auto_117795 ?auto_117796 ) ) ( ON ?auto_117794 ?auto_117795 ) ( ON ?auto_117793 ?auto_117794 ) ( CLEAR ?auto_117791 ) ( ON ?auto_117792 ?auto_117793 ) ( CLEAR ?auto_117792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117791 ?auto_117792 )
      ( MAKE-5PILE ?auto_117791 ?auto_117792 ?auto_117793 ?auto_117794 ?auto_117795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117802 - BLOCK
      ?auto_117803 - BLOCK
      ?auto_117804 - BLOCK
      ?auto_117805 - BLOCK
      ?auto_117806 - BLOCK
    )
    :vars
    (
      ?auto_117807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117806 ?auto_117807 ) ( ON-TABLE ?auto_117802 ) ( not ( = ?auto_117802 ?auto_117803 ) ) ( not ( = ?auto_117802 ?auto_117804 ) ) ( not ( = ?auto_117802 ?auto_117805 ) ) ( not ( = ?auto_117802 ?auto_117806 ) ) ( not ( = ?auto_117802 ?auto_117807 ) ) ( not ( = ?auto_117803 ?auto_117804 ) ) ( not ( = ?auto_117803 ?auto_117805 ) ) ( not ( = ?auto_117803 ?auto_117806 ) ) ( not ( = ?auto_117803 ?auto_117807 ) ) ( not ( = ?auto_117804 ?auto_117805 ) ) ( not ( = ?auto_117804 ?auto_117806 ) ) ( not ( = ?auto_117804 ?auto_117807 ) ) ( not ( = ?auto_117805 ?auto_117806 ) ) ( not ( = ?auto_117805 ?auto_117807 ) ) ( not ( = ?auto_117806 ?auto_117807 ) ) ( ON ?auto_117805 ?auto_117806 ) ( ON ?auto_117804 ?auto_117805 ) ( CLEAR ?auto_117802 ) ( ON ?auto_117803 ?auto_117804 ) ( CLEAR ?auto_117803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117802 ?auto_117803 )
      ( MAKE-5PILE ?auto_117802 ?auto_117803 ?auto_117804 ?auto_117805 ?auto_117806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117813 - BLOCK
      ?auto_117814 - BLOCK
      ?auto_117815 - BLOCK
      ?auto_117816 - BLOCK
      ?auto_117817 - BLOCK
    )
    :vars
    (
      ?auto_117818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117817 ?auto_117818 ) ( not ( = ?auto_117813 ?auto_117814 ) ) ( not ( = ?auto_117813 ?auto_117815 ) ) ( not ( = ?auto_117813 ?auto_117816 ) ) ( not ( = ?auto_117813 ?auto_117817 ) ) ( not ( = ?auto_117813 ?auto_117818 ) ) ( not ( = ?auto_117814 ?auto_117815 ) ) ( not ( = ?auto_117814 ?auto_117816 ) ) ( not ( = ?auto_117814 ?auto_117817 ) ) ( not ( = ?auto_117814 ?auto_117818 ) ) ( not ( = ?auto_117815 ?auto_117816 ) ) ( not ( = ?auto_117815 ?auto_117817 ) ) ( not ( = ?auto_117815 ?auto_117818 ) ) ( not ( = ?auto_117816 ?auto_117817 ) ) ( not ( = ?auto_117816 ?auto_117818 ) ) ( not ( = ?auto_117817 ?auto_117818 ) ) ( ON ?auto_117816 ?auto_117817 ) ( ON ?auto_117815 ?auto_117816 ) ( ON ?auto_117814 ?auto_117815 ) ( ON ?auto_117813 ?auto_117814 ) ( CLEAR ?auto_117813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117813 )
      ( MAKE-5PILE ?auto_117813 ?auto_117814 ?auto_117815 ?auto_117816 ?auto_117817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_117824 - BLOCK
      ?auto_117825 - BLOCK
      ?auto_117826 - BLOCK
      ?auto_117827 - BLOCK
      ?auto_117828 - BLOCK
    )
    :vars
    (
      ?auto_117829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117828 ?auto_117829 ) ( not ( = ?auto_117824 ?auto_117825 ) ) ( not ( = ?auto_117824 ?auto_117826 ) ) ( not ( = ?auto_117824 ?auto_117827 ) ) ( not ( = ?auto_117824 ?auto_117828 ) ) ( not ( = ?auto_117824 ?auto_117829 ) ) ( not ( = ?auto_117825 ?auto_117826 ) ) ( not ( = ?auto_117825 ?auto_117827 ) ) ( not ( = ?auto_117825 ?auto_117828 ) ) ( not ( = ?auto_117825 ?auto_117829 ) ) ( not ( = ?auto_117826 ?auto_117827 ) ) ( not ( = ?auto_117826 ?auto_117828 ) ) ( not ( = ?auto_117826 ?auto_117829 ) ) ( not ( = ?auto_117827 ?auto_117828 ) ) ( not ( = ?auto_117827 ?auto_117829 ) ) ( not ( = ?auto_117828 ?auto_117829 ) ) ( ON ?auto_117827 ?auto_117828 ) ( ON ?auto_117826 ?auto_117827 ) ( ON ?auto_117825 ?auto_117826 ) ( ON ?auto_117824 ?auto_117825 ) ( CLEAR ?auto_117824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117824 )
      ( MAKE-5PILE ?auto_117824 ?auto_117825 ?auto_117826 ?auto_117827 ?auto_117828 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117836 - BLOCK
      ?auto_117837 - BLOCK
      ?auto_117838 - BLOCK
      ?auto_117839 - BLOCK
      ?auto_117840 - BLOCK
      ?auto_117841 - BLOCK
    )
    :vars
    (
      ?auto_117842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117840 ) ( ON ?auto_117841 ?auto_117842 ) ( CLEAR ?auto_117841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117836 ) ( ON ?auto_117837 ?auto_117836 ) ( ON ?auto_117838 ?auto_117837 ) ( ON ?auto_117839 ?auto_117838 ) ( ON ?auto_117840 ?auto_117839 ) ( not ( = ?auto_117836 ?auto_117837 ) ) ( not ( = ?auto_117836 ?auto_117838 ) ) ( not ( = ?auto_117836 ?auto_117839 ) ) ( not ( = ?auto_117836 ?auto_117840 ) ) ( not ( = ?auto_117836 ?auto_117841 ) ) ( not ( = ?auto_117836 ?auto_117842 ) ) ( not ( = ?auto_117837 ?auto_117838 ) ) ( not ( = ?auto_117837 ?auto_117839 ) ) ( not ( = ?auto_117837 ?auto_117840 ) ) ( not ( = ?auto_117837 ?auto_117841 ) ) ( not ( = ?auto_117837 ?auto_117842 ) ) ( not ( = ?auto_117838 ?auto_117839 ) ) ( not ( = ?auto_117838 ?auto_117840 ) ) ( not ( = ?auto_117838 ?auto_117841 ) ) ( not ( = ?auto_117838 ?auto_117842 ) ) ( not ( = ?auto_117839 ?auto_117840 ) ) ( not ( = ?auto_117839 ?auto_117841 ) ) ( not ( = ?auto_117839 ?auto_117842 ) ) ( not ( = ?auto_117840 ?auto_117841 ) ) ( not ( = ?auto_117840 ?auto_117842 ) ) ( not ( = ?auto_117841 ?auto_117842 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117841 ?auto_117842 )
      ( !STACK ?auto_117841 ?auto_117840 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117849 - BLOCK
      ?auto_117850 - BLOCK
      ?auto_117851 - BLOCK
      ?auto_117852 - BLOCK
      ?auto_117853 - BLOCK
      ?auto_117854 - BLOCK
    )
    :vars
    (
      ?auto_117855 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117853 ) ( ON ?auto_117854 ?auto_117855 ) ( CLEAR ?auto_117854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117849 ) ( ON ?auto_117850 ?auto_117849 ) ( ON ?auto_117851 ?auto_117850 ) ( ON ?auto_117852 ?auto_117851 ) ( ON ?auto_117853 ?auto_117852 ) ( not ( = ?auto_117849 ?auto_117850 ) ) ( not ( = ?auto_117849 ?auto_117851 ) ) ( not ( = ?auto_117849 ?auto_117852 ) ) ( not ( = ?auto_117849 ?auto_117853 ) ) ( not ( = ?auto_117849 ?auto_117854 ) ) ( not ( = ?auto_117849 ?auto_117855 ) ) ( not ( = ?auto_117850 ?auto_117851 ) ) ( not ( = ?auto_117850 ?auto_117852 ) ) ( not ( = ?auto_117850 ?auto_117853 ) ) ( not ( = ?auto_117850 ?auto_117854 ) ) ( not ( = ?auto_117850 ?auto_117855 ) ) ( not ( = ?auto_117851 ?auto_117852 ) ) ( not ( = ?auto_117851 ?auto_117853 ) ) ( not ( = ?auto_117851 ?auto_117854 ) ) ( not ( = ?auto_117851 ?auto_117855 ) ) ( not ( = ?auto_117852 ?auto_117853 ) ) ( not ( = ?auto_117852 ?auto_117854 ) ) ( not ( = ?auto_117852 ?auto_117855 ) ) ( not ( = ?auto_117853 ?auto_117854 ) ) ( not ( = ?auto_117853 ?auto_117855 ) ) ( not ( = ?auto_117854 ?auto_117855 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117854 ?auto_117855 )
      ( !STACK ?auto_117854 ?auto_117853 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117862 - BLOCK
      ?auto_117863 - BLOCK
      ?auto_117864 - BLOCK
      ?auto_117865 - BLOCK
      ?auto_117866 - BLOCK
      ?auto_117867 - BLOCK
    )
    :vars
    (
      ?auto_117868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117867 ?auto_117868 ) ( ON-TABLE ?auto_117862 ) ( ON ?auto_117863 ?auto_117862 ) ( ON ?auto_117864 ?auto_117863 ) ( ON ?auto_117865 ?auto_117864 ) ( not ( = ?auto_117862 ?auto_117863 ) ) ( not ( = ?auto_117862 ?auto_117864 ) ) ( not ( = ?auto_117862 ?auto_117865 ) ) ( not ( = ?auto_117862 ?auto_117866 ) ) ( not ( = ?auto_117862 ?auto_117867 ) ) ( not ( = ?auto_117862 ?auto_117868 ) ) ( not ( = ?auto_117863 ?auto_117864 ) ) ( not ( = ?auto_117863 ?auto_117865 ) ) ( not ( = ?auto_117863 ?auto_117866 ) ) ( not ( = ?auto_117863 ?auto_117867 ) ) ( not ( = ?auto_117863 ?auto_117868 ) ) ( not ( = ?auto_117864 ?auto_117865 ) ) ( not ( = ?auto_117864 ?auto_117866 ) ) ( not ( = ?auto_117864 ?auto_117867 ) ) ( not ( = ?auto_117864 ?auto_117868 ) ) ( not ( = ?auto_117865 ?auto_117866 ) ) ( not ( = ?auto_117865 ?auto_117867 ) ) ( not ( = ?auto_117865 ?auto_117868 ) ) ( not ( = ?auto_117866 ?auto_117867 ) ) ( not ( = ?auto_117866 ?auto_117868 ) ) ( not ( = ?auto_117867 ?auto_117868 ) ) ( CLEAR ?auto_117865 ) ( ON ?auto_117866 ?auto_117867 ) ( CLEAR ?auto_117866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117862 ?auto_117863 ?auto_117864 ?auto_117865 ?auto_117866 )
      ( MAKE-6PILE ?auto_117862 ?auto_117863 ?auto_117864 ?auto_117865 ?auto_117866 ?auto_117867 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117875 - BLOCK
      ?auto_117876 - BLOCK
      ?auto_117877 - BLOCK
      ?auto_117878 - BLOCK
      ?auto_117879 - BLOCK
      ?auto_117880 - BLOCK
    )
    :vars
    (
      ?auto_117881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117880 ?auto_117881 ) ( ON-TABLE ?auto_117875 ) ( ON ?auto_117876 ?auto_117875 ) ( ON ?auto_117877 ?auto_117876 ) ( ON ?auto_117878 ?auto_117877 ) ( not ( = ?auto_117875 ?auto_117876 ) ) ( not ( = ?auto_117875 ?auto_117877 ) ) ( not ( = ?auto_117875 ?auto_117878 ) ) ( not ( = ?auto_117875 ?auto_117879 ) ) ( not ( = ?auto_117875 ?auto_117880 ) ) ( not ( = ?auto_117875 ?auto_117881 ) ) ( not ( = ?auto_117876 ?auto_117877 ) ) ( not ( = ?auto_117876 ?auto_117878 ) ) ( not ( = ?auto_117876 ?auto_117879 ) ) ( not ( = ?auto_117876 ?auto_117880 ) ) ( not ( = ?auto_117876 ?auto_117881 ) ) ( not ( = ?auto_117877 ?auto_117878 ) ) ( not ( = ?auto_117877 ?auto_117879 ) ) ( not ( = ?auto_117877 ?auto_117880 ) ) ( not ( = ?auto_117877 ?auto_117881 ) ) ( not ( = ?auto_117878 ?auto_117879 ) ) ( not ( = ?auto_117878 ?auto_117880 ) ) ( not ( = ?auto_117878 ?auto_117881 ) ) ( not ( = ?auto_117879 ?auto_117880 ) ) ( not ( = ?auto_117879 ?auto_117881 ) ) ( not ( = ?auto_117880 ?auto_117881 ) ) ( CLEAR ?auto_117878 ) ( ON ?auto_117879 ?auto_117880 ) ( CLEAR ?auto_117879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_117875 ?auto_117876 ?auto_117877 ?auto_117878 ?auto_117879 )
      ( MAKE-6PILE ?auto_117875 ?auto_117876 ?auto_117877 ?auto_117878 ?auto_117879 ?auto_117880 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117888 - BLOCK
      ?auto_117889 - BLOCK
      ?auto_117890 - BLOCK
      ?auto_117891 - BLOCK
      ?auto_117892 - BLOCK
      ?auto_117893 - BLOCK
    )
    :vars
    (
      ?auto_117894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117893 ?auto_117894 ) ( ON-TABLE ?auto_117888 ) ( ON ?auto_117889 ?auto_117888 ) ( ON ?auto_117890 ?auto_117889 ) ( not ( = ?auto_117888 ?auto_117889 ) ) ( not ( = ?auto_117888 ?auto_117890 ) ) ( not ( = ?auto_117888 ?auto_117891 ) ) ( not ( = ?auto_117888 ?auto_117892 ) ) ( not ( = ?auto_117888 ?auto_117893 ) ) ( not ( = ?auto_117888 ?auto_117894 ) ) ( not ( = ?auto_117889 ?auto_117890 ) ) ( not ( = ?auto_117889 ?auto_117891 ) ) ( not ( = ?auto_117889 ?auto_117892 ) ) ( not ( = ?auto_117889 ?auto_117893 ) ) ( not ( = ?auto_117889 ?auto_117894 ) ) ( not ( = ?auto_117890 ?auto_117891 ) ) ( not ( = ?auto_117890 ?auto_117892 ) ) ( not ( = ?auto_117890 ?auto_117893 ) ) ( not ( = ?auto_117890 ?auto_117894 ) ) ( not ( = ?auto_117891 ?auto_117892 ) ) ( not ( = ?auto_117891 ?auto_117893 ) ) ( not ( = ?auto_117891 ?auto_117894 ) ) ( not ( = ?auto_117892 ?auto_117893 ) ) ( not ( = ?auto_117892 ?auto_117894 ) ) ( not ( = ?auto_117893 ?auto_117894 ) ) ( ON ?auto_117892 ?auto_117893 ) ( CLEAR ?auto_117890 ) ( ON ?auto_117891 ?auto_117892 ) ( CLEAR ?auto_117891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117888 ?auto_117889 ?auto_117890 ?auto_117891 )
      ( MAKE-6PILE ?auto_117888 ?auto_117889 ?auto_117890 ?auto_117891 ?auto_117892 ?auto_117893 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117901 - BLOCK
      ?auto_117902 - BLOCK
      ?auto_117903 - BLOCK
      ?auto_117904 - BLOCK
      ?auto_117905 - BLOCK
      ?auto_117906 - BLOCK
    )
    :vars
    (
      ?auto_117907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117906 ?auto_117907 ) ( ON-TABLE ?auto_117901 ) ( ON ?auto_117902 ?auto_117901 ) ( ON ?auto_117903 ?auto_117902 ) ( not ( = ?auto_117901 ?auto_117902 ) ) ( not ( = ?auto_117901 ?auto_117903 ) ) ( not ( = ?auto_117901 ?auto_117904 ) ) ( not ( = ?auto_117901 ?auto_117905 ) ) ( not ( = ?auto_117901 ?auto_117906 ) ) ( not ( = ?auto_117901 ?auto_117907 ) ) ( not ( = ?auto_117902 ?auto_117903 ) ) ( not ( = ?auto_117902 ?auto_117904 ) ) ( not ( = ?auto_117902 ?auto_117905 ) ) ( not ( = ?auto_117902 ?auto_117906 ) ) ( not ( = ?auto_117902 ?auto_117907 ) ) ( not ( = ?auto_117903 ?auto_117904 ) ) ( not ( = ?auto_117903 ?auto_117905 ) ) ( not ( = ?auto_117903 ?auto_117906 ) ) ( not ( = ?auto_117903 ?auto_117907 ) ) ( not ( = ?auto_117904 ?auto_117905 ) ) ( not ( = ?auto_117904 ?auto_117906 ) ) ( not ( = ?auto_117904 ?auto_117907 ) ) ( not ( = ?auto_117905 ?auto_117906 ) ) ( not ( = ?auto_117905 ?auto_117907 ) ) ( not ( = ?auto_117906 ?auto_117907 ) ) ( ON ?auto_117905 ?auto_117906 ) ( CLEAR ?auto_117903 ) ( ON ?auto_117904 ?auto_117905 ) ( CLEAR ?auto_117904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_117901 ?auto_117902 ?auto_117903 ?auto_117904 )
      ( MAKE-6PILE ?auto_117901 ?auto_117902 ?auto_117903 ?auto_117904 ?auto_117905 ?auto_117906 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117914 - BLOCK
      ?auto_117915 - BLOCK
      ?auto_117916 - BLOCK
      ?auto_117917 - BLOCK
      ?auto_117918 - BLOCK
      ?auto_117919 - BLOCK
    )
    :vars
    (
      ?auto_117920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117919 ?auto_117920 ) ( ON-TABLE ?auto_117914 ) ( ON ?auto_117915 ?auto_117914 ) ( not ( = ?auto_117914 ?auto_117915 ) ) ( not ( = ?auto_117914 ?auto_117916 ) ) ( not ( = ?auto_117914 ?auto_117917 ) ) ( not ( = ?auto_117914 ?auto_117918 ) ) ( not ( = ?auto_117914 ?auto_117919 ) ) ( not ( = ?auto_117914 ?auto_117920 ) ) ( not ( = ?auto_117915 ?auto_117916 ) ) ( not ( = ?auto_117915 ?auto_117917 ) ) ( not ( = ?auto_117915 ?auto_117918 ) ) ( not ( = ?auto_117915 ?auto_117919 ) ) ( not ( = ?auto_117915 ?auto_117920 ) ) ( not ( = ?auto_117916 ?auto_117917 ) ) ( not ( = ?auto_117916 ?auto_117918 ) ) ( not ( = ?auto_117916 ?auto_117919 ) ) ( not ( = ?auto_117916 ?auto_117920 ) ) ( not ( = ?auto_117917 ?auto_117918 ) ) ( not ( = ?auto_117917 ?auto_117919 ) ) ( not ( = ?auto_117917 ?auto_117920 ) ) ( not ( = ?auto_117918 ?auto_117919 ) ) ( not ( = ?auto_117918 ?auto_117920 ) ) ( not ( = ?auto_117919 ?auto_117920 ) ) ( ON ?auto_117918 ?auto_117919 ) ( ON ?auto_117917 ?auto_117918 ) ( CLEAR ?auto_117915 ) ( ON ?auto_117916 ?auto_117917 ) ( CLEAR ?auto_117916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117914 ?auto_117915 ?auto_117916 )
      ( MAKE-6PILE ?auto_117914 ?auto_117915 ?auto_117916 ?auto_117917 ?auto_117918 ?auto_117919 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117927 - BLOCK
      ?auto_117928 - BLOCK
      ?auto_117929 - BLOCK
      ?auto_117930 - BLOCK
      ?auto_117931 - BLOCK
      ?auto_117932 - BLOCK
    )
    :vars
    (
      ?auto_117933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117932 ?auto_117933 ) ( ON-TABLE ?auto_117927 ) ( ON ?auto_117928 ?auto_117927 ) ( not ( = ?auto_117927 ?auto_117928 ) ) ( not ( = ?auto_117927 ?auto_117929 ) ) ( not ( = ?auto_117927 ?auto_117930 ) ) ( not ( = ?auto_117927 ?auto_117931 ) ) ( not ( = ?auto_117927 ?auto_117932 ) ) ( not ( = ?auto_117927 ?auto_117933 ) ) ( not ( = ?auto_117928 ?auto_117929 ) ) ( not ( = ?auto_117928 ?auto_117930 ) ) ( not ( = ?auto_117928 ?auto_117931 ) ) ( not ( = ?auto_117928 ?auto_117932 ) ) ( not ( = ?auto_117928 ?auto_117933 ) ) ( not ( = ?auto_117929 ?auto_117930 ) ) ( not ( = ?auto_117929 ?auto_117931 ) ) ( not ( = ?auto_117929 ?auto_117932 ) ) ( not ( = ?auto_117929 ?auto_117933 ) ) ( not ( = ?auto_117930 ?auto_117931 ) ) ( not ( = ?auto_117930 ?auto_117932 ) ) ( not ( = ?auto_117930 ?auto_117933 ) ) ( not ( = ?auto_117931 ?auto_117932 ) ) ( not ( = ?auto_117931 ?auto_117933 ) ) ( not ( = ?auto_117932 ?auto_117933 ) ) ( ON ?auto_117931 ?auto_117932 ) ( ON ?auto_117930 ?auto_117931 ) ( CLEAR ?auto_117928 ) ( ON ?auto_117929 ?auto_117930 ) ( CLEAR ?auto_117929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_117927 ?auto_117928 ?auto_117929 )
      ( MAKE-6PILE ?auto_117927 ?auto_117928 ?auto_117929 ?auto_117930 ?auto_117931 ?auto_117932 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117940 - BLOCK
      ?auto_117941 - BLOCK
      ?auto_117942 - BLOCK
      ?auto_117943 - BLOCK
      ?auto_117944 - BLOCK
      ?auto_117945 - BLOCK
    )
    :vars
    (
      ?auto_117946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117945 ?auto_117946 ) ( ON-TABLE ?auto_117940 ) ( not ( = ?auto_117940 ?auto_117941 ) ) ( not ( = ?auto_117940 ?auto_117942 ) ) ( not ( = ?auto_117940 ?auto_117943 ) ) ( not ( = ?auto_117940 ?auto_117944 ) ) ( not ( = ?auto_117940 ?auto_117945 ) ) ( not ( = ?auto_117940 ?auto_117946 ) ) ( not ( = ?auto_117941 ?auto_117942 ) ) ( not ( = ?auto_117941 ?auto_117943 ) ) ( not ( = ?auto_117941 ?auto_117944 ) ) ( not ( = ?auto_117941 ?auto_117945 ) ) ( not ( = ?auto_117941 ?auto_117946 ) ) ( not ( = ?auto_117942 ?auto_117943 ) ) ( not ( = ?auto_117942 ?auto_117944 ) ) ( not ( = ?auto_117942 ?auto_117945 ) ) ( not ( = ?auto_117942 ?auto_117946 ) ) ( not ( = ?auto_117943 ?auto_117944 ) ) ( not ( = ?auto_117943 ?auto_117945 ) ) ( not ( = ?auto_117943 ?auto_117946 ) ) ( not ( = ?auto_117944 ?auto_117945 ) ) ( not ( = ?auto_117944 ?auto_117946 ) ) ( not ( = ?auto_117945 ?auto_117946 ) ) ( ON ?auto_117944 ?auto_117945 ) ( ON ?auto_117943 ?auto_117944 ) ( ON ?auto_117942 ?auto_117943 ) ( CLEAR ?auto_117940 ) ( ON ?auto_117941 ?auto_117942 ) ( CLEAR ?auto_117941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117940 ?auto_117941 )
      ( MAKE-6PILE ?auto_117940 ?auto_117941 ?auto_117942 ?auto_117943 ?auto_117944 ?auto_117945 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117953 - BLOCK
      ?auto_117954 - BLOCK
      ?auto_117955 - BLOCK
      ?auto_117956 - BLOCK
      ?auto_117957 - BLOCK
      ?auto_117958 - BLOCK
    )
    :vars
    (
      ?auto_117959 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117958 ?auto_117959 ) ( ON-TABLE ?auto_117953 ) ( not ( = ?auto_117953 ?auto_117954 ) ) ( not ( = ?auto_117953 ?auto_117955 ) ) ( not ( = ?auto_117953 ?auto_117956 ) ) ( not ( = ?auto_117953 ?auto_117957 ) ) ( not ( = ?auto_117953 ?auto_117958 ) ) ( not ( = ?auto_117953 ?auto_117959 ) ) ( not ( = ?auto_117954 ?auto_117955 ) ) ( not ( = ?auto_117954 ?auto_117956 ) ) ( not ( = ?auto_117954 ?auto_117957 ) ) ( not ( = ?auto_117954 ?auto_117958 ) ) ( not ( = ?auto_117954 ?auto_117959 ) ) ( not ( = ?auto_117955 ?auto_117956 ) ) ( not ( = ?auto_117955 ?auto_117957 ) ) ( not ( = ?auto_117955 ?auto_117958 ) ) ( not ( = ?auto_117955 ?auto_117959 ) ) ( not ( = ?auto_117956 ?auto_117957 ) ) ( not ( = ?auto_117956 ?auto_117958 ) ) ( not ( = ?auto_117956 ?auto_117959 ) ) ( not ( = ?auto_117957 ?auto_117958 ) ) ( not ( = ?auto_117957 ?auto_117959 ) ) ( not ( = ?auto_117958 ?auto_117959 ) ) ( ON ?auto_117957 ?auto_117958 ) ( ON ?auto_117956 ?auto_117957 ) ( ON ?auto_117955 ?auto_117956 ) ( CLEAR ?auto_117953 ) ( ON ?auto_117954 ?auto_117955 ) ( CLEAR ?auto_117954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_117953 ?auto_117954 )
      ( MAKE-6PILE ?auto_117953 ?auto_117954 ?auto_117955 ?auto_117956 ?auto_117957 ?auto_117958 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117966 - BLOCK
      ?auto_117967 - BLOCK
      ?auto_117968 - BLOCK
      ?auto_117969 - BLOCK
      ?auto_117970 - BLOCK
      ?auto_117971 - BLOCK
    )
    :vars
    (
      ?auto_117972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117971 ?auto_117972 ) ( not ( = ?auto_117966 ?auto_117967 ) ) ( not ( = ?auto_117966 ?auto_117968 ) ) ( not ( = ?auto_117966 ?auto_117969 ) ) ( not ( = ?auto_117966 ?auto_117970 ) ) ( not ( = ?auto_117966 ?auto_117971 ) ) ( not ( = ?auto_117966 ?auto_117972 ) ) ( not ( = ?auto_117967 ?auto_117968 ) ) ( not ( = ?auto_117967 ?auto_117969 ) ) ( not ( = ?auto_117967 ?auto_117970 ) ) ( not ( = ?auto_117967 ?auto_117971 ) ) ( not ( = ?auto_117967 ?auto_117972 ) ) ( not ( = ?auto_117968 ?auto_117969 ) ) ( not ( = ?auto_117968 ?auto_117970 ) ) ( not ( = ?auto_117968 ?auto_117971 ) ) ( not ( = ?auto_117968 ?auto_117972 ) ) ( not ( = ?auto_117969 ?auto_117970 ) ) ( not ( = ?auto_117969 ?auto_117971 ) ) ( not ( = ?auto_117969 ?auto_117972 ) ) ( not ( = ?auto_117970 ?auto_117971 ) ) ( not ( = ?auto_117970 ?auto_117972 ) ) ( not ( = ?auto_117971 ?auto_117972 ) ) ( ON ?auto_117970 ?auto_117971 ) ( ON ?auto_117969 ?auto_117970 ) ( ON ?auto_117968 ?auto_117969 ) ( ON ?auto_117967 ?auto_117968 ) ( ON ?auto_117966 ?auto_117967 ) ( CLEAR ?auto_117966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117966 )
      ( MAKE-6PILE ?auto_117966 ?auto_117967 ?auto_117968 ?auto_117969 ?auto_117970 ?auto_117971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_117979 - BLOCK
      ?auto_117980 - BLOCK
      ?auto_117981 - BLOCK
      ?auto_117982 - BLOCK
      ?auto_117983 - BLOCK
      ?auto_117984 - BLOCK
    )
    :vars
    (
      ?auto_117985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117984 ?auto_117985 ) ( not ( = ?auto_117979 ?auto_117980 ) ) ( not ( = ?auto_117979 ?auto_117981 ) ) ( not ( = ?auto_117979 ?auto_117982 ) ) ( not ( = ?auto_117979 ?auto_117983 ) ) ( not ( = ?auto_117979 ?auto_117984 ) ) ( not ( = ?auto_117979 ?auto_117985 ) ) ( not ( = ?auto_117980 ?auto_117981 ) ) ( not ( = ?auto_117980 ?auto_117982 ) ) ( not ( = ?auto_117980 ?auto_117983 ) ) ( not ( = ?auto_117980 ?auto_117984 ) ) ( not ( = ?auto_117980 ?auto_117985 ) ) ( not ( = ?auto_117981 ?auto_117982 ) ) ( not ( = ?auto_117981 ?auto_117983 ) ) ( not ( = ?auto_117981 ?auto_117984 ) ) ( not ( = ?auto_117981 ?auto_117985 ) ) ( not ( = ?auto_117982 ?auto_117983 ) ) ( not ( = ?auto_117982 ?auto_117984 ) ) ( not ( = ?auto_117982 ?auto_117985 ) ) ( not ( = ?auto_117983 ?auto_117984 ) ) ( not ( = ?auto_117983 ?auto_117985 ) ) ( not ( = ?auto_117984 ?auto_117985 ) ) ( ON ?auto_117983 ?auto_117984 ) ( ON ?auto_117982 ?auto_117983 ) ( ON ?auto_117981 ?auto_117982 ) ( ON ?auto_117980 ?auto_117981 ) ( ON ?auto_117979 ?auto_117980 ) ( CLEAR ?auto_117979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_117979 )
      ( MAKE-6PILE ?auto_117979 ?auto_117980 ?auto_117981 ?auto_117982 ?auto_117983 ?auto_117984 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_117993 - BLOCK
      ?auto_117994 - BLOCK
      ?auto_117995 - BLOCK
      ?auto_117996 - BLOCK
      ?auto_117997 - BLOCK
      ?auto_117998 - BLOCK
      ?auto_117999 - BLOCK
    )
    :vars
    (
      ?auto_118000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_117998 ) ( ON ?auto_117999 ?auto_118000 ) ( CLEAR ?auto_117999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_117993 ) ( ON ?auto_117994 ?auto_117993 ) ( ON ?auto_117995 ?auto_117994 ) ( ON ?auto_117996 ?auto_117995 ) ( ON ?auto_117997 ?auto_117996 ) ( ON ?auto_117998 ?auto_117997 ) ( not ( = ?auto_117993 ?auto_117994 ) ) ( not ( = ?auto_117993 ?auto_117995 ) ) ( not ( = ?auto_117993 ?auto_117996 ) ) ( not ( = ?auto_117993 ?auto_117997 ) ) ( not ( = ?auto_117993 ?auto_117998 ) ) ( not ( = ?auto_117993 ?auto_117999 ) ) ( not ( = ?auto_117993 ?auto_118000 ) ) ( not ( = ?auto_117994 ?auto_117995 ) ) ( not ( = ?auto_117994 ?auto_117996 ) ) ( not ( = ?auto_117994 ?auto_117997 ) ) ( not ( = ?auto_117994 ?auto_117998 ) ) ( not ( = ?auto_117994 ?auto_117999 ) ) ( not ( = ?auto_117994 ?auto_118000 ) ) ( not ( = ?auto_117995 ?auto_117996 ) ) ( not ( = ?auto_117995 ?auto_117997 ) ) ( not ( = ?auto_117995 ?auto_117998 ) ) ( not ( = ?auto_117995 ?auto_117999 ) ) ( not ( = ?auto_117995 ?auto_118000 ) ) ( not ( = ?auto_117996 ?auto_117997 ) ) ( not ( = ?auto_117996 ?auto_117998 ) ) ( not ( = ?auto_117996 ?auto_117999 ) ) ( not ( = ?auto_117996 ?auto_118000 ) ) ( not ( = ?auto_117997 ?auto_117998 ) ) ( not ( = ?auto_117997 ?auto_117999 ) ) ( not ( = ?auto_117997 ?auto_118000 ) ) ( not ( = ?auto_117998 ?auto_117999 ) ) ( not ( = ?auto_117998 ?auto_118000 ) ) ( not ( = ?auto_117999 ?auto_118000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_117999 ?auto_118000 )
      ( !STACK ?auto_117999 ?auto_117998 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118008 - BLOCK
      ?auto_118009 - BLOCK
      ?auto_118010 - BLOCK
      ?auto_118011 - BLOCK
      ?auto_118012 - BLOCK
      ?auto_118013 - BLOCK
      ?auto_118014 - BLOCK
    )
    :vars
    (
      ?auto_118015 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118013 ) ( ON ?auto_118014 ?auto_118015 ) ( CLEAR ?auto_118014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118008 ) ( ON ?auto_118009 ?auto_118008 ) ( ON ?auto_118010 ?auto_118009 ) ( ON ?auto_118011 ?auto_118010 ) ( ON ?auto_118012 ?auto_118011 ) ( ON ?auto_118013 ?auto_118012 ) ( not ( = ?auto_118008 ?auto_118009 ) ) ( not ( = ?auto_118008 ?auto_118010 ) ) ( not ( = ?auto_118008 ?auto_118011 ) ) ( not ( = ?auto_118008 ?auto_118012 ) ) ( not ( = ?auto_118008 ?auto_118013 ) ) ( not ( = ?auto_118008 ?auto_118014 ) ) ( not ( = ?auto_118008 ?auto_118015 ) ) ( not ( = ?auto_118009 ?auto_118010 ) ) ( not ( = ?auto_118009 ?auto_118011 ) ) ( not ( = ?auto_118009 ?auto_118012 ) ) ( not ( = ?auto_118009 ?auto_118013 ) ) ( not ( = ?auto_118009 ?auto_118014 ) ) ( not ( = ?auto_118009 ?auto_118015 ) ) ( not ( = ?auto_118010 ?auto_118011 ) ) ( not ( = ?auto_118010 ?auto_118012 ) ) ( not ( = ?auto_118010 ?auto_118013 ) ) ( not ( = ?auto_118010 ?auto_118014 ) ) ( not ( = ?auto_118010 ?auto_118015 ) ) ( not ( = ?auto_118011 ?auto_118012 ) ) ( not ( = ?auto_118011 ?auto_118013 ) ) ( not ( = ?auto_118011 ?auto_118014 ) ) ( not ( = ?auto_118011 ?auto_118015 ) ) ( not ( = ?auto_118012 ?auto_118013 ) ) ( not ( = ?auto_118012 ?auto_118014 ) ) ( not ( = ?auto_118012 ?auto_118015 ) ) ( not ( = ?auto_118013 ?auto_118014 ) ) ( not ( = ?auto_118013 ?auto_118015 ) ) ( not ( = ?auto_118014 ?auto_118015 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118014 ?auto_118015 )
      ( !STACK ?auto_118014 ?auto_118013 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118023 - BLOCK
      ?auto_118024 - BLOCK
      ?auto_118025 - BLOCK
      ?auto_118026 - BLOCK
      ?auto_118027 - BLOCK
      ?auto_118028 - BLOCK
      ?auto_118029 - BLOCK
    )
    :vars
    (
      ?auto_118030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118029 ?auto_118030 ) ( ON-TABLE ?auto_118023 ) ( ON ?auto_118024 ?auto_118023 ) ( ON ?auto_118025 ?auto_118024 ) ( ON ?auto_118026 ?auto_118025 ) ( ON ?auto_118027 ?auto_118026 ) ( not ( = ?auto_118023 ?auto_118024 ) ) ( not ( = ?auto_118023 ?auto_118025 ) ) ( not ( = ?auto_118023 ?auto_118026 ) ) ( not ( = ?auto_118023 ?auto_118027 ) ) ( not ( = ?auto_118023 ?auto_118028 ) ) ( not ( = ?auto_118023 ?auto_118029 ) ) ( not ( = ?auto_118023 ?auto_118030 ) ) ( not ( = ?auto_118024 ?auto_118025 ) ) ( not ( = ?auto_118024 ?auto_118026 ) ) ( not ( = ?auto_118024 ?auto_118027 ) ) ( not ( = ?auto_118024 ?auto_118028 ) ) ( not ( = ?auto_118024 ?auto_118029 ) ) ( not ( = ?auto_118024 ?auto_118030 ) ) ( not ( = ?auto_118025 ?auto_118026 ) ) ( not ( = ?auto_118025 ?auto_118027 ) ) ( not ( = ?auto_118025 ?auto_118028 ) ) ( not ( = ?auto_118025 ?auto_118029 ) ) ( not ( = ?auto_118025 ?auto_118030 ) ) ( not ( = ?auto_118026 ?auto_118027 ) ) ( not ( = ?auto_118026 ?auto_118028 ) ) ( not ( = ?auto_118026 ?auto_118029 ) ) ( not ( = ?auto_118026 ?auto_118030 ) ) ( not ( = ?auto_118027 ?auto_118028 ) ) ( not ( = ?auto_118027 ?auto_118029 ) ) ( not ( = ?auto_118027 ?auto_118030 ) ) ( not ( = ?auto_118028 ?auto_118029 ) ) ( not ( = ?auto_118028 ?auto_118030 ) ) ( not ( = ?auto_118029 ?auto_118030 ) ) ( CLEAR ?auto_118027 ) ( ON ?auto_118028 ?auto_118029 ) ( CLEAR ?auto_118028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118023 ?auto_118024 ?auto_118025 ?auto_118026 ?auto_118027 ?auto_118028 )
      ( MAKE-7PILE ?auto_118023 ?auto_118024 ?auto_118025 ?auto_118026 ?auto_118027 ?auto_118028 ?auto_118029 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118038 - BLOCK
      ?auto_118039 - BLOCK
      ?auto_118040 - BLOCK
      ?auto_118041 - BLOCK
      ?auto_118042 - BLOCK
      ?auto_118043 - BLOCK
      ?auto_118044 - BLOCK
    )
    :vars
    (
      ?auto_118045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118044 ?auto_118045 ) ( ON-TABLE ?auto_118038 ) ( ON ?auto_118039 ?auto_118038 ) ( ON ?auto_118040 ?auto_118039 ) ( ON ?auto_118041 ?auto_118040 ) ( ON ?auto_118042 ?auto_118041 ) ( not ( = ?auto_118038 ?auto_118039 ) ) ( not ( = ?auto_118038 ?auto_118040 ) ) ( not ( = ?auto_118038 ?auto_118041 ) ) ( not ( = ?auto_118038 ?auto_118042 ) ) ( not ( = ?auto_118038 ?auto_118043 ) ) ( not ( = ?auto_118038 ?auto_118044 ) ) ( not ( = ?auto_118038 ?auto_118045 ) ) ( not ( = ?auto_118039 ?auto_118040 ) ) ( not ( = ?auto_118039 ?auto_118041 ) ) ( not ( = ?auto_118039 ?auto_118042 ) ) ( not ( = ?auto_118039 ?auto_118043 ) ) ( not ( = ?auto_118039 ?auto_118044 ) ) ( not ( = ?auto_118039 ?auto_118045 ) ) ( not ( = ?auto_118040 ?auto_118041 ) ) ( not ( = ?auto_118040 ?auto_118042 ) ) ( not ( = ?auto_118040 ?auto_118043 ) ) ( not ( = ?auto_118040 ?auto_118044 ) ) ( not ( = ?auto_118040 ?auto_118045 ) ) ( not ( = ?auto_118041 ?auto_118042 ) ) ( not ( = ?auto_118041 ?auto_118043 ) ) ( not ( = ?auto_118041 ?auto_118044 ) ) ( not ( = ?auto_118041 ?auto_118045 ) ) ( not ( = ?auto_118042 ?auto_118043 ) ) ( not ( = ?auto_118042 ?auto_118044 ) ) ( not ( = ?auto_118042 ?auto_118045 ) ) ( not ( = ?auto_118043 ?auto_118044 ) ) ( not ( = ?auto_118043 ?auto_118045 ) ) ( not ( = ?auto_118044 ?auto_118045 ) ) ( CLEAR ?auto_118042 ) ( ON ?auto_118043 ?auto_118044 ) ( CLEAR ?auto_118043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118038 ?auto_118039 ?auto_118040 ?auto_118041 ?auto_118042 ?auto_118043 )
      ( MAKE-7PILE ?auto_118038 ?auto_118039 ?auto_118040 ?auto_118041 ?auto_118042 ?auto_118043 ?auto_118044 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118053 - BLOCK
      ?auto_118054 - BLOCK
      ?auto_118055 - BLOCK
      ?auto_118056 - BLOCK
      ?auto_118057 - BLOCK
      ?auto_118058 - BLOCK
      ?auto_118059 - BLOCK
    )
    :vars
    (
      ?auto_118060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118059 ?auto_118060 ) ( ON-TABLE ?auto_118053 ) ( ON ?auto_118054 ?auto_118053 ) ( ON ?auto_118055 ?auto_118054 ) ( ON ?auto_118056 ?auto_118055 ) ( not ( = ?auto_118053 ?auto_118054 ) ) ( not ( = ?auto_118053 ?auto_118055 ) ) ( not ( = ?auto_118053 ?auto_118056 ) ) ( not ( = ?auto_118053 ?auto_118057 ) ) ( not ( = ?auto_118053 ?auto_118058 ) ) ( not ( = ?auto_118053 ?auto_118059 ) ) ( not ( = ?auto_118053 ?auto_118060 ) ) ( not ( = ?auto_118054 ?auto_118055 ) ) ( not ( = ?auto_118054 ?auto_118056 ) ) ( not ( = ?auto_118054 ?auto_118057 ) ) ( not ( = ?auto_118054 ?auto_118058 ) ) ( not ( = ?auto_118054 ?auto_118059 ) ) ( not ( = ?auto_118054 ?auto_118060 ) ) ( not ( = ?auto_118055 ?auto_118056 ) ) ( not ( = ?auto_118055 ?auto_118057 ) ) ( not ( = ?auto_118055 ?auto_118058 ) ) ( not ( = ?auto_118055 ?auto_118059 ) ) ( not ( = ?auto_118055 ?auto_118060 ) ) ( not ( = ?auto_118056 ?auto_118057 ) ) ( not ( = ?auto_118056 ?auto_118058 ) ) ( not ( = ?auto_118056 ?auto_118059 ) ) ( not ( = ?auto_118056 ?auto_118060 ) ) ( not ( = ?auto_118057 ?auto_118058 ) ) ( not ( = ?auto_118057 ?auto_118059 ) ) ( not ( = ?auto_118057 ?auto_118060 ) ) ( not ( = ?auto_118058 ?auto_118059 ) ) ( not ( = ?auto_118058 ?auto_118060 ) ) ( not ( = ?auto_118059 ?auto_118060 ) ) ( ON ?auto_118058 ?auto_118059 ) ( CLEAR ?auto_118056 ) ( ON ?auto_118057 ?auto_118058 ) ( CLEAR ?auto_118057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118053 ?auto_118054 ?auto_118055 ?auto_118056 ?auto_118057 )
      ( MAKE-7PILE ?auto_118053 ?auto_118054 ?auto_118055 ?auto_118056 ?auto_118057 ?auto_118058 ?auto_118059 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118068 - BLOCK
      ?auto_118069 - BLOCK
      ?auto_118070 - BLOCK
      ?auto_118071 - BLOCK
      ?auto_118072 - BLOCK
      ?auto_118073 - BLOCK
      ?auto_118074 - BLOCK
    )
    :vars
    (
      ?auto_118075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118074 ?auto_118075 ) ( ON-TABLE ?auto_118068 ) ( ON ?auto_118069 ?auto_118068 ) ( ON ?auto_118070 ?auto_118069 ) ( ON ?auto_118071 ?auto_118070 ) ( not ( = ?auto_118068 ?auto_118069 ) ) ( not ( = ?auto_118068 ?auto_118070 ) ) ( not ( = ?auto_118068 ?auto_118071 ) ) ( not ( = ?auto_118068 ?auto_118072 ) ) ( not ( = ?auto_118068 ?auto_118073 ) ) ( not ( = ?auto_118068 ?auto_118074 ) ) ( not ( = ?auto_118068 ?auto_118075 ) ) ( not ( = ?auto_118069 ?auto_118070 ) ) ( not ( = ?auto_118069 ?auto_118071 ) ) ( not ( = ?auto_118069 ?auto_118072 ) ) ( not ( = ?auto_118069 ?auto_118073 ) ) ( not ( = ?auto_118069 ?auto_118074 ) ) ( not ( = ?auto_118069 ?auto_118075 ) ) ( not ( = ?auto_118070 ?auto_118071 ) ) ( not ( = ?auto_118070 ?auto_118072 ) ) ( not ( = ?auto_118070 ?auto_118073 ) ) ( not ( = ?auto_118070 ?auto_118074 ) ) ( not ( = ?auto_118070 ?auto_118075 ) ) ( not ( = ?auto_118071 ?auto_118072 ) ) ( not ( = ?auto_118071 ?auto_118073 ) ) ( not ( = ?auto_118071 ?auto_118074 ) ) ( not ( = ?auto_118071 ?auto_118075 ) ) ( not ( = ?auto_118072 ?auto_118073 ) ) ( not ( = ?auto_118072 ?auto_118074 ) ) ( not ( = ?auto_118072 ?auto_118075 ) ) ( not ( = ?auto_118073 ?auto_118074 ) ) ( not ( = ?auto_118073 ?auto_118075 ) ) ( not ( = ?auto_118074 ?auto_118075 ) ) ( ON ?auto_118073 ?auto_118074 ) ( CLEAR ?auto_118071 ) ( ON ?auto_118072 ?auto_118073 ) ( CLEAR ?auto_118072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118068 ?auto_118069 ?auto_118070 ?auto_118071 ?auto_118072 )
      ( MAKE-7PILE ?auto_118068 ?auto_118069 ?auto_118070 ?auto_118071 ?auto_118072 ?auto_118073 ?auto_118074 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118083 - BLOCK
      ?auto_118084 - BLOCK
      ?auto_118085 - BLOCK
      ?auto_118086 - BLOCK
      ?auto_118087 - BLOCK
      ?auto_118088 - BLOCK
      ?auto_118089 - BLOCK
    )
    :vars
    (
      ?auto_118090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118089 ?auto_118090 ) ( ON-TABLE ?auto_118083 ) ( ON ?auto_118084 ?auto_118083 ) ( ON ?auto_118085 ?auto_118084 ) ( not ( = ?auto_118083 ?auto_118084 ) ) ( not ( = ?auto_118083 ?auto_118085 ) ) ( not ( = ?auto_118083 ?auto_118086 ) ) ( not ( = ?auto_118083 ?auto_118087 ) ) ( not ( = ?auto_118083 ?auto_118088 ) ) ( not ( = ?auto_118083 ?auto_118089 ) ) ( not ( = ?auto_118083 ?auto_118090 ) ) ( not ( = ?auto_118084 ?auto_118085 ) ) ( not ( = ?auto_118084 ?auto_118086 ) ) ( not ( = ?auto_118084 ?auto_118087 ) ) ( not ( = ?auto_118084 ?auto_118088 ) ) ( not ( = ?auto_118084 ?auto_118089 ) ) ( not ( = ?auto_118084 ?auto_118090 ) ) ( not ( = ?auto_118085 ?auto_118086 ) ) ( not ( = ?auto_118085 ?auto_118087 ) ) ( not ( = ?auto_118085 ?auto_118088 ) ) ( not ( = ?auto_118085 ?auto_118089 ) ) ( not ( = ?auto_118085 ?auto_118090 ) ) ( not ( = ?auto_118086 ?auto_118087 ) ) ( not ( = ?auto_118086 ?auto_118088 ) ) ( not ( = ?auto_118086 ?auto_118089 ) ) ( not ( = ?auto_118086 ?auto_118090 ) ) ( not ( = ?auto_118087 ?auto_118088 ) ) ( not ( = ?auto_118087 ?auto_118089 ) ) ( not ( = ?auto_118087 ?auto_118090 ) ) ( not ( = ?auto_118088 ?auto_118089 ) ) ( not ( = ?auto_118088 ?auto_118090 ) ) ( not ( = ?auto_118089 ?auto_118090 ) ) ( ON ?auto_118088 ?auto_118089 ) ( ON ?auto_118087 ?auto_118088 ) ( CLEAR ?auto_118085 ) ( ON ?auto_118086 ?auto_118087 ) ( CLEAR ?auto_118086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118083 ?auto_118084 ?auto_118085 ?auto_118086 )
      ( MAKE-7PILE ?auto_118083 ?auto_118084 ?auto_118085 ?auto_118086 ?auto_118087 ?auto_118088 ?auto_118089 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118098 - BLOCK
      ?auto_118099 - BLOCK
      ?auto_118100 - BLOCK
      ?auto_118101 - BLOCK
      ?auto_118102 - BLOCK
      ?auto_118103 - BLOCK
      ?auto_118104 - BLOCK
    )
    :vars
    (
      ?auto_118105 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118104 ?auto_118105 ) ( ON-TABLE ?auto_118098 ) ( ON ?auto_118099 ?auto_118098 ) ( ON ?auto_118100 ?auto_118099 ) ( not ( = ?auto_118098 ?auto_118099 ) ) ( not ( = ?auto_118098 ?auto_118100 ) ) ( not ( = ?auto_118098 ?auto_118101 ) ) ( not ( = ?auto_118098 ?auto_118102 ) ) ( not ( = ?auto_118098 ?auto_118103 ) ) ( not ( = ?auto_118098 ?auto_118104 ) ) ( not ( = ?auto_118098 ?auto_118105 ) ) ( not ( = ?auto_118099 ?auto_118100 ) ) ( not ( = ?auto_118099 ?auto_118101 ) ) ( not ( = ?auto_118099 ?auto_118102 ) ) ( not ( = ?auto_118099 ?auto_118103 ) ) ( not ( = ?auto_118099 ?auto_118104 ) ) ( not ( = ?auto_118099 ?auto_118105 ) ) ( not ( = ?auto_118100 ?auto_118101 ) ) ( not ( = ?auto_118100 ?auto_118102 ) ) ( not ( = ?auto_118100 ?auto_118103 ) ) ( not ( = ?auto_118100 ?auto_118104 ) ) ( not ( = ?auto_118100 ?auto_118105 ) ) ( not ( = ?auto_118101 ?auto_118102 ) ) ( not ( = ?auto_118101 ?auto_118103 ) ) ( not ( = ?auto_118101 ?auto_118104 ) ) ( not ( = ?auto_118101 ?auto_118105 ) ) ( not ( = ?auto_118102 ?auto_118103 ) ) ( not ( = ?auto_118102 ?auto_118104 ) ) ( not ( = ?auto_118102 ?auto_118105 ) ) ( not ( = ?auto_118103 ?auto_118104 ) ) ( not ( = ?auto_118103 ?auto_118105 ) ) ( not ( = ?auto_118104 ?auto_118105 ) ) ( ON ?auto_118103 ?auto_118104 ) ( ON ?auto_118102 ?auto_118103 ) ( CLEAR ?auto_118100 ) ( ON ?auto_118101 ?auto_118102 ) ( CLEAR ?auto_118101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118098 ?auto_118099 ?auto_118100 ?auto_118101 )
      ( MAKE-7PILE ?auto_118098 ?auto_118099 ?auto_118100 ?auto_118101 ?auto_118102 ?auto_118103 ?auto_118104 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118113 - BLOCK
      ?auto_118114 - BLOCK
      ?auto_118115 - BLOCK
      ?auto_118116 - BLOCK
      ?auto_118117 - BLOCK
      ?auto_118118 - BLOCK
      ?auto_118119 - BLOCK
    )
    :vars
    (
      ?auto_118120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118119 ?auto_118120 ) ( ON-TABLE ?auto_118113 ) ( ON ?auto_118114 ?auto_118113 ) ( not ( = ?auto_118113 ?auto_118114 ) ) ( not ( = ?auto_118113 ?auto_118115 ) ) ( not ( = ?auto_118113 ?auto_118116 ) ) ( not ( = ?auto_118113 ?auto_118117 ) ) ( not ( = ?auto_118113 ?auto_118118 ) ) ( not ( = ?auto_118113 ?auto_118119 ) ) ( not ( = ?auto_118113 ?auto_118120 ) ) ( not ( = ?auto_118114 ?auto_118115 ) ) ( not ( = ?auto_118114 ?auto_118116 ) ) ( not ( = ?auto_118114 ?auto_118117 ) ) ( not ( = ?auto_118114 ?auto_118118 ) ) ( not ( = ?auto_118114 ?auto_118119 ) ) ( not ( = ?auto_118114 ?auto_118120 ) ) ( not ( = ?auto_118115 ?auto_118116 ) ) ( not ( = ?auto_118115 ?auto_118117 ) ) ( not ( = ?auto_118115 ?auto_118118 ) ) ( not ( = ?auto_118115 ?auto_118119 ) ) ( not ( = ?auto_118115 ?auto_118120 ) ) ( not ( = ?auto_118116 ?auto_118117 ) ) ( not ( = ?auto_118116 ?auto_118118 ) ) ( not ( = ?auto_118116 ?auto_118119 ) ) ( not ( = ?auto_118116 ?auto_118120 ) ) ( not ( = ?auto_118117 ?auto_118118 ) ) ( not ( = ?auto_118117 ?auto_118119 ) ) ( not ( = ?auto_118117 ?auto_118120 ) ) ( not ( = ?auto_118118 ?auto_118119 ) ) ( not ( = ?auto_118118 ?auto_118120 ) ) ( not ( = ?auto_118119 ?auto_118120 ) ) ( ON ?auto_118118 ?auto_118119 ) ( ON ?auto_118117 ?auto_118118 ) ( ON ?auto_118116 ?auto_118117 ) ( CLEAR ?auto_118114 ) ( ON ?auto_118115 ?auto_118116 ) ( CLEAR ?auto_118115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118113 ?auto_118114 ?auto_118115 )
      ( MAKE-7PILE ?auto_118113 ?auto_118114 ?auto_118115 ?auto_118116 ?auto_118117 ?auto_118118 ?auto_118119 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118128 - BLOCK
      ?auto_118129 - BLOCK
      ?auto_118130 - BLOCK
      ?auto_118131 - BLOCK
      ?auto_118132 - BLOCK
      ?auto_118133 - BLOCK
      ?auto_118134 - BLOCK
    )
    :vars
    (
      ?auto_118135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118134 ?auto_118135 ) ( ON-TABLE ?auto_118128 ) ( ON ?auto_118129 ?auto_118128 ) ( not ( = ?auto_118128 ?auto_118129 ) ) ( not ( = ?auto_118128 ?auto_118130 ) ) ( not ( = ?auto_118128 ?auto_118131 ) ) ( not ( = ?auto_118128 ?auto_118132 ) ) ( not ( = ?auto_118128 ?auto_118133 ) ) ( not ( = ?auto_118128 ?auto_118134 ) ) ( not ( = ?auto_118128 ?auto_118135 ) ) ( not ( = ?auto_118129 ?auto_118130 ) ) ( not ( = ?auto_118129 ?auto_118131 ) ) ( not ( = ?auto_118129 ?auto_118132 ) ) ( not ( = ?auto_118129 ?auto_118133 ) ) ( not ( = ?auto_118129 ?auto_118134 ) ) ( not ( = ?auto_118129 ?auto_118135 ) ) ( not ( = ?auto_118130 ?auto_118131 ) ) ( not ( = ?auto_118130 ?auto_118132 ) ) ( not ( = ?auto_118130 ?auto_118133 ) ) ( not ( = ?auto_118130 ?auto_118134 ) ) ( not ( = ?auto_118130 ?auto_118135 ) ) ( not ( = ?auto_118131 ?auto_118132 ) ) ( not ( = ?auto_118131 ?auto_118133 ) ) ( not ( = ?auto_118131 ?auto_118134 ) ) ( not ( = ?auto_118131 ?auto_118135 ) ) ( not ( = ?auto_118132 ?auto_118133 ) ) ( not ( = ?auto_118132 ?auto_118134 ) ) ( not ( = ?auto_118132 ?auto_118135 ) ) ( not ( = ?auto_118133 ?auto_118134 ) ) ( not ( = ?auto_118133 ?auto_118135 ) ) ( not ( = ?auto_118134 ?auto_118135 ) ) ( ON ?auto_118133 ?auto_118134 ) ( ON ?auto_118132 ?auto_118133 ) ( ON ?auto_118131 ?auto_118132 ) ( CLEAR ?auto_118129 ) ( ON ?auto_118130 ?auto_118131 ) ( CLEAR ?auto_118130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118128 ?auto_118129 ?auto_118130 )
      ( MAKE-7PILE ?auto_118128 ?auto_118129 ?auto_118130 ?auto_118131 ?auto_118132 ?auto_118133 ?auto_118134 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118143 - BLOCK
      ?auto_118144 - BLOCK
      ?auto_118145 - BLOCK
      ?auto_118146 - BLOCK
      ?auto_118147 - BLOCK
      ?auto_118148 - BLOCK
      ?auto_118149 - BLOCK
    )
    :vars
    (
      ?auto_118150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118149 ?auto_118150 ) ( ON-TABLE ?auto_118143 ) ( not ( = ?auto_118143 ?auto_118144 ) ) ( not ( = ?auto_118143 ?auto_118145 ) ) ( not ( = ?auto_118143 ?auto_118146 ) ) ( not ( = ?auto_118143 ?auto_118147 ) ) ( not ( = ?auto_118143 ?auto_118148 ) ) ( not ( = ?auto_118143 ?auto_118149 ) ) ( not ( = ?auto_118143 ?auto_118150 ) ) ( not ( = ?auto_118144 ?auto_118145 ) ) ( not ( = ?auto_118144 ?auto_118146 ) ) ( not ( = ?auto_118144 ?auto_118147 ) ) ( not ( = ?auto_118144 ?auto_118148 ) ) ( not ( = ?auto_118144 ?auto_118149 ) ) ( not ( = ?auto_118144 ?auto_118150 ) ) ( not ( = ?auto_118145 ?auto_118146 ) ) ( not ( = ?auto_118145 ?auto_118147 ) ) ( not ( = ?auto_118145 ?auto_118148 ) ) ( not ( = ?auto_118145 ?auto_118149 ) ) ( not ( = ?auto_118145 ?auto_118150 ) ) ( not ( = ?auto_118146 ?auto_118147 ) ) ( not ( = ?auto_118146 ?auto_118148 ) ) ( not ( = ?auto_118146 ?auto_118149 ) ) ( not ( = ?auto_118146 ?auto_118150 ) ) ( not ( = ?auto_118147 ?auto_118148 ) ) ( not ( = ?auto_118147 ?auto_118149 ) ) ( not ( = ?auto_118147 ?auto_118150 ) ) ( not ( = ?auto_118148 ?auto_118149 ) ) ( not ( = ?auto_118148 ?auto_118150 ) ) ( not ( = ?auto_118149 ?auto_118150 ) ) ( ON ?auto_118148 ?auto_118149 ) ( ON ?auto_118147 ?auto_118148 ) ( ON ?auto_118146 ?auto_118147 ) ( ON ?auto_118145 ?auto_118146 ) ( CLEAR ?auto_118143 ) ( ON ?auto_118144 ?auto_118145 ) ( CLEAR ?auto_118144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118143 ?auto_118144 )
      ( MAKE-7PILE ?auto_118143 ?auto_118144 ?auto_118145 ?auto_118146 ?auto_118147 ?auto_118148 ?auto_118149 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118158 - BLOCK
      ?auto_118159 - BLOCK
      ?auto_118160 - BLOCK
      ?auto_118161 - BLOCK
      ?auto_118162 - BLOCK
      ?auto_118163 - BLOCK
      ?auto_118164 - BLOCK
    )
    :vars
    (
      ?auto_118165 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118164 ?auto_118165 ) ( ON-TABLE ?auto_118158 ) ( not ( = ?auto_118158 ?auto_118159 ) ) ( not ( = ?auto_118158 ?auto_118160 ) ) ( not ( = ?auto_118158 ?auto_118161 ) ) ( not ( = ?auto_118158 ?auto_118162 ) ) ( not ( = ?auto_118158 ?auto_118163 ) ) ( not ( = ?auto_118158 ?auto_118164 ) ) ( not ( = ?auto_118158 ?auto_118165 ) ) ( not ( = ?auto_118159 ?auto_118160 ) ) ( not ( = ?auto_118159 ?auto_118161 ) ) ( not ( = ?auto_118159 ?auto_118162 ) ) ( not ( = ?auto_118159 ?auto_118163 ) ) ( not ( = ?auto_118159 ?auto_118164 ) ) ( not ( = ?auto_118159 ?auto_118165 ) ) ( not ( = ?auto_118160 ?auto_118161 ) ) ( not ( = ?auto_118160 ?auto_118162 ) ) ( not ( = ?auto_118160 ?auto_118163 ) ) ( not ( = ?auto_118160 ?auto_118164 ) ) ( not ( = ?auto_118160 ?auto_118165 ) ) ( not ( = ?auto_118161 ?auto_118162 ) ) ( not ( = ?auto_118161 ?auto_118163 ) ) ( not ( = ?auto_118161 ?auto_118164 ) ) ( not ( = ?auto_118161 ?auto_118165 ) ) ( not ( = ?auto_118162 ?auto_118163 ) ) ( not ( = ?auto_118162 ?auto_118164 ) ) ( not ( = ?auto_118162 ?auto_118165 ) ) ( not ( = ?auto_118163 ?auto_118164 ) ) ( not ( = ?auto_118163 ?auto_118165 ) ) ( not ( = ?auto_118164 ?auto_118165 ) ) ( ON ?auto_118163 ?auto_118164 ) ( ON ?auto_118162 ?auto_118163 ) ( ON ?auto_118161 ?auto_118162 ) ( ON ?auto_118160 ?auto_118161 ) ( CLEAR ?auto_118158 ) ( ON ?auto_118159 ?auto_118160 ) ( CLEAR ?auto_118159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118158 ?auto_118159 )
      ( MAKE-7PILE ?auto_118158 ?auto_118159 ?auto_118160 ?auto_118161 ?auto_118162 ?auto_118163 ?auto_118164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118173 - BLOCK
      ?auto_118174 - BLOCK
      ?auto_118175 - BLOCK
      ?auto_118176 - BLOCK
      ?auto_118177 - BLOCK
      ?auto_118178 - BLOCK
      ?auto_118179 - BLOCK
    )
    :vars
    (
      ?auto_118180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118179 ?auto_118180 ) ( not ( = ?auto_118173 ?auto_118174 ) ) ( not ( = ?auto_118173 ?auto_118175 ) ) ( not ( = ?auto_118173 ?auto_118176 ) ) ( not ( = ?auto_118173 ?auto_118177 ) ) ( not ( = ?auto_118173 ?auto_118178 ) ) ( not ( = ?auto_118173 ?auto_118179 ) ) ( not ( = ?auto_118173 ?auto_118180 ) ) ( not ( = ?auto_118174 ?auto_118175 ) ) ( not ( = ?auto_118174 ?auto_118176 ) ) ( not ( = ?auto_118174 ?auto_118177 ) ) ( not ( = ?auto_118174 ?auto_118178 ) ) ( not ( = ?auto_118174 ?auto_118179 ) ) ( not ( = ?auto_118174 ?auto_118180 ) ) ( not ( = ?auto_118175 ?auto_118176 ) ) ( not ( = ?auto_118175 ?auto_118177 ) ) ( not ( = ?auto_118175 ?auto_118178 ) ) ( not ( = ?auto_118175 ?auto_118179 ) ) ( not ( = ?auto_118175 ?auto_118180 ) ) ( not ( = ?auto_118176 ?auto_118177 ) ) ( not ( = ?auto_118176 ?auto_118178 ) ) ( not ( = ?auto_118176 ?auto_118179 ) ) ( not ( = ?auto_118176 ?auto_118180 ) ) ( not ( = ?auto_118177 ?auto_118178 ) ) ( not ( = ?auto_118177 ?auto_118179 ) ) ( not ( = ?auto_118177 ?auto_118180 ) ) ( not ( = ?auto_118178 ?auto_118179 ) ) ( not ( = ?auto_118178 ?auto_118180 ) ) ( not ( = ?auto_118179 ?auto_118180 ) ) ( ON ?auto_118178 ?auto_118179 ) ( ON ?auto_118177 ?auto_118178 ) ( ON ?auto_118176 ?auto_118177 ) ( ON ?auto_118175 ?auto_118176 ) ( ON ?auto_118174 ?auto_118175 ) ( ON ?auto_118173 ?auto_118174 ) ( CLEAR ?auto_118173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118173 )
      ( MAKE-7PILE ?auto_118173 ?auto_118174 ?auto_118175 ?auto_118176 ?auto_118177 ?auto_118178 ?auto_118179 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_118188 - BLOCK
      ?auto_118189 - BLOCK
      ?auto_118190 - BLOCK
      ?auto_118191 - BLOCK
      ?auto_118192 - BLOCK
      ?auto_118193 - BLOCK
      ?auto_118194 - BLOCK
    )
    :vars
    (
      ?auto_118195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118194 ?auto_118195 ) ( not ( = ?auto_118188 ?auto_118189 ) ) ( not ( = ?auto_118188 ?auto_118190 ) ) ( not ( = ?auto_118188 ?auto_118191 ) ) ( not ( = ?auto_118188 ?auto_118192 ) ) ( not ( = ?auto_118188 ?auto_118193 ) ) ( not ( = ?auto_118188 ?auto_118194 ) ) ( not ( = ?auto_118188 ?auto_118195 ) ) ( not ( = ?auto_118189 ?auto_118190 ) ) ( not ( = ?auto_118189 ?auto_118191 ) ) ( not ( = ?auto_118189 ?auto_118192 ) ) ( not ( = ?auto_118189 ?auto_118193 ) ) ( not ( = ?auto_118189 ?auto_118194 ) ) ( not ( = ?auto_118189 ?auto_118195 ) ) ( not ( = ?auto_118190 ?auto_118191 ) ) ( not ( = ?auto_118190 ?auto_118192 ) ) ( not ( = ?auto_118190 ?auto_118193 ) ) ( not ( = ?auto_118190 ?auto_118194 ) ) ( not ( = ?auto_118190 ?auto_118195 ) ) ( not ( = ?auto_118191 ?auto_118192 ) ) ( not ( = ?auto_118191 ?auto_118193 ) ) ( not ( = ?auto_118191 ?auto_118194 ) ) ( not ( = ?auto_118191 ?auto_118195 ) ) ( not ( = ?auto_118192 ?auto_118193 ) ) ( not ( = ?auto_118192 ?auto_118194 ) ) ( not ( = ?auto_118192 ?auto_118195 ) ) ( not ( = ?auto_118193 ?auto_118194 ) ) ( not ( = ?auto_118193 ?auto_118195 ) ) ( not ( = ?auto_118194 ?auto_118195 ) ) ( ON ?auto_118193 ?auto_118194 ) ( ON ?auto_118192 ?auto_118193 ) ( ON ?auto_118191 ?auto_118192 ) ( ON ?auto_118190 ?auto_118191 ) ( ON ?auto_118189 ?auto_118190 ) ( ON ?auto_118188 ?auto_118189 ) ( CLEAR ?auto_118188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118188 )
      ( MAKE-7PILE ?auto_118188 ?auto_118189 ?auto_118190 ?auto_118191 ?auto_118192 ?auto_118193 ?auto_118194 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118204 - BLOCK
      ?auto_118205 - BLOCK
      ?auto_118206 - BLOCK
      ?auto_118207 - BLOCK
      ?auto_118208 - BLOCK
      ?auto_118209 - BLOCK
      ?auto_118210 - BLOCK
      ?auto_118211 - BLOCK
    )
    :vars
    (
      ?auto_118212 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118210 ) ( ON ?auto_118211 ?auto_118212 ) ( CLEAR ?auto_118211 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118204 ) ( ON ?auto_118205 ?auto_118204 ) ( ON ?auto_118206 ?auto_118205 ) ( ON ?auto_118207 ?auto_118206 ) ( ON ?auto_118208 ?auto_118207 ) ( ON ?auto_118209 ?auto_118208 ) ( ON ?auto_118210 ?auto_118209 ) ( not ( = ?auto_118204 ?auto_118205 ) ) ( not ( = ?auto_118204 ?auto_118206 ) ) ( not ( = ?auto_118204 ?auto_118207 ) ) ( not ( = ?auto_118204 ?auto_118208 ) ) ( not ( = ?auto_118204 ?auto_118209 ) ) ( not ( = ?auto_118204 ?auto_118210 ) ) ( not ( = ?auto_118204 ?auto_118211 ) ) ( not ( = ?auto_118204 ?auto_118212 ) ) ( not ( = ?auto_118205 ?auto_118206 ) ) ( not ( = ?auto_118205 ?auto_118207 ) ) ( not ( = ?auto_118205 ?auto_118208 ) ) ( not ( = ?auto_118205 ?auto_118209 ) ) ( not ( = ?auto_118205 ?auto_118210 ) ) ( not ( = ?auto_118205 ?auto_118211 ) ) ( not ( = ?auto_118205 ?auto_118212 ) ) ( not ( = ?auto_118206 ?auto_118207 ) ) ( not ( = ?auto_118206 ?auto_118208 ) ) ( not ( = ?auto_118206 ?auto_118209 ) ) ( not ( = ?auto_118206 ?auto_118210 ) ) ( not ( = ?auto_118206 ?auto_118211 ) ) ( not ( = ?auto_118206 ?auto_118212 ) ) ( not ( = ?auto_118207 ?auto_118208 ) ) ( not ( = ?auto_118207 ?auto_118209 ) ) ( not ( = ?auto_118207 ?auto_118210 ) ) ( not ( = ?auto_118207 ?auto_118211 ) ) ( not ( = ?auto_118207 ?auto_118212 ) ) ( not ( = ?auto_118208 ?auto_118209 ) ) ( not ( = ?auto_118208 ?auto_118210 ) ) ( not ( = ?auto_118208 ?auto_118211 ) ) ( not ( = ?auto_118208 ?auto_118212 ) ) ( not ( = ?auto_118209 ?auto_118210 ) ) ( not ( = ?auto_118209 ?auto_118211 ) ) ( not ( = ?auto_118209 ?auto_118212 ) ) ( not ( = ?auto_118210 ?auto_118211 ) ) ( not ( = ?auto_118210 ?auto_118212 ) ) ( not ( = ?auto_118211 ?auto_118212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118211 ?auto_118212 )
      ( !STACK ?auto_118211 ?auto_118210 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118221 - BLOCK
      ?auto_118222 - BLOCK
      ?auto_118223 - BLOCK
      ?auto_118224 - BLOCK
      ?auto_118225 - BLOCK
      ?auto_118226 - BLOCK
      ?auto_118227 - BLOCK
      ?auto_118228 - BLOCK
    )
    :vars
    (
      ?auto_118229 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118227 ) ( ON ?auto_118228 ?auto_118229 ) ( CLEAR ?auto_118228 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118221 ) ( ON ?auto_118222 ?auto_118221 ) ( ON ?auto_118223 ?auto_118222 ) ( ON ?auto_118224 ?auto_118223 ) ( ON ?auto_118225 ?auto_118224 ) ( ON ?auto_118226 ?auto_118225 ) ( ON ?auto_118227 ?auto_118226 ) ( not ( = ?auto_118221 ?auto_118222 ) ) ( not ( = ?auto_118221 ?auto_118223 ) ) ( not ( = ?auto_118221 ?auto_118224 ) ) ( not ( = ?auto_118221 ?auto_118225 ) ) ( not ( = ?auto_118221 ?auto_118226 ) ) ( not ( = ?auto_118221 ?auto_118227 ) ) ( not ( = ?auto_118221 ?auto_118228 ) ) ( not ( = ?auto_118221 ?auto_118229 ) ) ( not ( = ?auto_118222 ?auto_118223 ) ) ( not ( = ?auto_118222 ?auto_118224 ) ) ( not ( = ?auto_118222 ?auto_118225 ) ) ( not ( = ?auto_118222 ?auto_118226 ) ) ( not ( = ?auto_118222 ?auto_118227 ) ) ( not ( = ?auto_118222 ?auto_118228 ) ) ( not ( = ?auto_118222 ?auto_118229 ) ) ( not ( = ?auto_118223 ?auto_118224 ) ) ( not ( = ?auto_118223 ?auto_118225 ) ) ( not ( = ?auto_118223 ?auto_118226 ) ) ( not ( = ?auto_118223 ?auto_118227 ) ) ( not ( = ?auto_118223 ?auto_118228 ) ) ( not ( = ?auto_118223 ?auto_118229 ) ) ( not ( = ?auto_118224 ?auto_118225 ) ) ( not ( = ?auto_118224 ?auto_118226 ) ) ( not ( = ?auto_118224 ?auto_118227 ) ) ( not ( = ?auto_118224 ?auto_118228 ) ) ( not ( = ?auto_118224 ?auto_118229 ) ) ( not ( = ?auto_118225 ?auto_118226 ) ) ( not ( = ?auto_118225 ?auto_118227 ) ) ( not ( = ?auto_118225 ?auto_118228 ) ) ( not ( = ?auto_118225 ?auto_118229 ) ) ( not ( = ?auto_118226 ?auto_118227 ) ) ( not ( = ?auto_118226 ?auto_118228 ) ) ( not ( = ?auto_118226 ?auto_118229 ) ) ( not ( = ?auto_118227 ?auto_118228 ) ) ( not ( = ?auto_118227 ?auto_118229 ) ) ( not ( = ?auto_118228 ?auto_118229 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118228 ?auto_118229 )
      ( !STACK ?auto_118228 ?auto_118227 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118238 - BLOCK
      ?auto_118239 - BLOCK
      ?auto_118240 - BLOCK
      ?auto_118241 - BLOCK
      ?auto_118242 - BLOCK
      ?auto_118243 - BLOCK
      ?auto_118244 - BLOCK
      ?auto_118245 - BLOCK
    )
    :vars
    (
      ?auto_118246 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118245 ?auto_118246 ) ( ON-TABLE ?auto_118238 ) ( ON ?auto_118239 ?auto_118238 ) ( ON ?auto_118240 ?auto_118239 ) ( ON ?auto_118241 ?auto_118240 ) ( ON ?auto_118242 ?auto_118241 ) ( ON ?auto_118243 ?auto_118242 ) ( not ( = ?auto_118238 ?auto_118239 ) ) ( not ( = ?auto_118238 ?auto_118240 ) ) ( not ( = ?auto_118238 ?auto_118241 ) ) ( not ( = ?auto_118238 ?auto_118242 ) ) ( not ( = ?auto_118238 ?auto_118243 ) ) ( not ( = ?auto_118238 ?auto_118244 ) ) ( not ( = ?auto_118238 ?auto_118245 ) ) ( not ( = ?auto_118238 ?auto_118246 ) ) ( not ( = ?auto_118239 ?auto_118240 ) ) ( not ( = ?auto_118239 ?auto_118241 ) ) ( not ( = ?auto_118239 ?auto_118242 ) ) ( not ( = ?auto_118239 ?auto_118243 ) ) ( not ( = ?auto_118239 ?auto_118244 ) ) ( not ( = ?auto_118239 ?auto_118245 ) ) ( not ( = ?auto_118239 ?auto_118246 ) ) ( not ( = ?auto_118240 ?auto_118241 ) ) ( not ( = ?auto_118240 ?auto_118242 ) ) ( not ( = ?auto_118240 ?auto_118243 ) ) ( not ( = ?auto_118240 ?auto_118244 ) ) ( not ( = ?auto_118240 ?auto_118245 ) ) ( not ( = ?auto_118240 ?auto_118246 ) ) ( not ( = ?auto_118241 ?auto_118242 ) ) ( not ( = ?auto_118241 ?auto_118243 ) ) ( not ( = ?auto_118241 ?auto_118244 ) ) ( not ( = ?auto_118241 ?auto_118245 ) ) ( not ( = ?auto_118241 ?auto_118246 ) ) ( not ( = ?auto_118242 ?auto_118243 ) ) ( not ( = ?auto_118242 ?auto_118244 ) ) ( not ( = ?auto_118242 ?auto_118245 ) ) ( not ( = ?auto_118242 ?auto_118246 ) ) ( not ( = ?auto_118243 ?auto_118244 ) ) ( not ( = ?auto_118243 ?auto_118245 ) ) ( not ( = ?auto_118243 ?auto_118246 ) ) ( not ( = ?auto_118244 ?auto_118245 ) ) ( not ( = ?auto_118244 ?auto_118246 ) ) ( not ( = ?auto_118245 ?auto_118246 ) ) ( CLEAR ?auto_118243 ) ( ON ?auto_118244 ?auto_118245 ) ( CLEAR ?auto_118244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118238 ?auto_118239 ?auto_118240 ?auto_118241 ?auto_118242 ?auto_118243 ?auto_118244 )
      ( MAKE-8PILE ?auto_118238 ?auto_118239 ?auto_118240 ?auto_118241 ?auto_118242 ?auto_118243 ?auto_118244 ?auto_118245 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118255 - BLOCK
      ?auto_118256 - BLOCK
      ?auto_118257 - BLOCK
      ?auto_118258 - BLOCK
      ?auto_118259 - BLOCK
      ?auto_118260 - BLOCK
      ?auto_118261 - BLOCK
      ?auto_118262 - BLOCK
    )
    :vars
    (
      ?auto_118263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118262 ?auto_118263 ) ( ON-TABLE ?auto_118255 ) ( ON ?auto_118256 ?auto_118255 ) ( ON ?auto_118257 ?auto_118256 ) ( ON ?auto_118258 ?auto_118257 ) ( ON ?auto_118259 ?auto_118258 ) ( ON ?auto_118260 ?auto_118259 ) ( not ( = ?auto_118255 ?auto_118256 ) ) ( not ( = ?auto_118255 ?auto_118257 ) ) ( not ( = ?auto_118255 ?auto_118258 ) ) ( not ( = ?auto_118255 ?auto_118259 ) ) ( not ( = ?auto_118255 ?auto_118260 ) ) ( not ( = ?auto_118255 ?auto_118261 ) ) ( not ( = ?auto_118255 ?auto_118262 ) ) ( not ( = ?auto_118255 ?auto_118263 ) ) ( not ( = ?auto_118256 ?auto_118257 ) ) ( not ( = ?auto_118256 ?auto_118258 ) ) ( not ( = ?auto_118256 ?auto_118259 ) ) ( not ( = ?auto_118256 ?auto_118260 ) ) ( not ( = ?auto_118256 ?auto_118261 ) ) ( not ( = ?auto_118256 ?auto_118262 ) ) ( not ( = ?auto_118256 ?auto_118263 ) ) ( not ( = ?auto_118257 ?auto_118258 ) ) ( not ( = ?auto_118257 ?auto_118259 ) ) ( not ( = ?auto_118257 ?auto_118260 ) ) ( not ( = ?auto_118257 ?auto_118261 ) ) ( not ( = ?auto_118257 ?auto_118262 ) ) ( not ( = ?auto_118257 ?auto_118263 ) ) ( not ( = ?auto_118258 ?auto_118259 ) ) ( not ( = ?auto_118258 ?auto_118260 ) ) ( not ( = ?auto_118258 ?auto_118261 ) ) ( not ( = ?auto_118258 ?auto_118262 ) ) ( not ( = ?auto_118258 ?auto_118263 ) ) ( not ( = ?auto_118259 ?auto_118260 ) ) ( not ( = ?auto_118259 ?auto_118261 ) ) ( not ( = ?auto_118259 ?auto_118262 ) ) ( not ( = ?auto_118259 ?auto_118263 ) ) ( not ( = ?auto_118260 ?auto_118261 ) ) ( not ( = ?auto_118260 ?auto_118262 ) ) ( not ( = ?auto_118260 ?auto_118263 ) ) ( not ( = ?auto_118261 ?auto_118262 ) ) ( not ( = ?auto_118261 ?auto_118263 ) ) ( not ( = ?auto_118262 ?auto_118263 ) ) ( CLEAR ?auto_118260 ) ( ON ?auto_118261 ?auto_118262 ) ( CLEAR ?auto_118261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118255 ?auto_118256 ?auto_118257 ?auto_118258 ?auto_118259 ?auto_118260 ?auto_118261 )
      ( MAKE-8PILE ?auto_118255 ?auto_118256 ?auto_118257 ?auto_118258 ?auto_118259 ?auto_118260 ?auto_118261 ?auto_118262 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118272 - BLOCK
      ?auto_118273 - BLOCK
      ?auto_118274 - BLOCK
      ?auto_118275 - BLOCK
      ?auto_118276 - BLOCK
      ?auto_118277 - BLOCK
      ?auto_118278 - BLOCK
      ?auto_118279 - BLOCK
    )
    :vars
    (
      ?auto_118280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118279 ?auto_118280 ) ( ON-TABLE ?auto_118272 ) ( ON ?auto_118273 ?auto_118272 ) ( ON ?auto_118274 ?auto_118273 ) ( ON ?auto_118275 ?auto_118274 ) ( ON ?auto_118276 ?auto_118275 ) ( not ( = ?auto_118272 ?auto_118273 ) ) ( not ( = ?auto_118272 ?auto_118274 ) ) ( not ( = ?auto_118272 ?auto_118275 ) ) ( not ( = ?auto_118272 ?auto_118276 ) ) ( not ( = ?auto_118272 ?auto_118277 ) ) ( not ( = ?auto_118272 ?auto_118278 ) ) ( not ( = ?auto_118272 ?auto_118279 ) ) ( not ( = ?auto_118272 ?auto_118280 ) ) ( not ( = ?auto_118273 ?auto_118274 ) ) ( not ( = ?auto_118273 ?auto_118275 ) ) ( not ( = ?auto_118273 ?auto_118276 ) ) ( not ( = ?auto_118273 ?auto_118277 ) ) ( not ( = ?auto_118273 ?auto_118278 ) ) ( not ( = ?auto_118273 ?auto_118279 ) ) ( not ( = ?auto_118273 ?auto_118280 ) ) ( not ( = ?auto_118274 ?auto_118275 ) ) ( not ( = ?auto_118274 ?auto_118276 ) ) ( not ( = ?auto_118274 ?auto_118277 ) ) ( not ( = ?auto_118274 ?auto_118278 ) ) ( not ( = ?auto_118274 ?auto_118279 ) ) ( not ( = ?auto_118274 ?auto_118280 ) ) ( not ( = ?auto_118275 ?auto_118276 ) ) ( not ( = ?auto_118275 ?auto_118277 ) ) ( not ( = ?auto_118275 ?auto_118278 ) ) ( not ( = ?auto_118275 ?auto_118279 ) ) ( not ( = ?auto_118275 ?auto_118280 ) ) ( not ( = ?auto_118276 ?auto_118277 ) ) ( not ( = ?auto_118276 ?auto_118278 ) ) ( not ( = ?auto_118276 ?auto_118279 ) ) ( not ( = ?auto_118276 ?auto_118280 ) ) ( not ( = ?auto_118277 ?auto_118278 ) ) ( not ( = ?auto_118277 ?auto_118279 ) ) ( not ( = ?auto_118277 ?auto_118280 ) ) ( not ( = ?auto_118278 ?auto_118279 ) ) ( not ( = ?auto_118278 ?auto_118280 ) ) ( not ( = ?auto_118279 ?auto_118280 ) ) ( ON ?auto_118278 ?auto_118279 ) ( CLEAR ?auto_118276 ) ( ON ?auto_118277 ?auto_118278 ) ( CLEAR ?auto_118277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118272 ?auto_118273 ?auto_118274 ?auto_118275 ?auto_118276 ?auto_118277 )
      ( MAKE-8PILE ?auto_118272 ?auto_118273 ?auto_118274 ?auto_118275 ?auto_118276 ?auto_118277 ?auto_118278 ?auto_118279 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118289 - BLOCK
      ?auto_118290 - BLOCK
      ?auto_118291 - BLOCK
      ?auto_118292 - BLOCK
      ?auto_118293 - BLOCK
      ?auto_118294 - BLOCK
      ?auto_118295 - BLOCK
      ?auto_118296 - BLOCK
    )
    :vars
    (
      ?auto_118297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118296 ?auto_118297 ) ( ON-TABLE ?auto_118289 ) ( ON ?auto_118290 ?auto_118289 ) ( ON ?auto_118291 ?auto_118290 ) ( ON ?auto_118292 ?auto_118291 ) ( ON ?auto_118293 ?auto_118292 ) ( not ( = ?auto_118289 ?auto_118290 ) ) ( not ( = ?auto_118289 ?auto_118291 ) ) ( not ( = ?auto_118289 ?auto_118292 ) ) ( not ( = ?auto_118289 ?auto_118293 ) ) ( not ( = ?auto_118289 ?auto_118294 ) ) ( not ( = ?auto_118289 ?auto_118295 ) ) ( not ( = ?auto_118289 ?auto_118296 ) ) ( not ( = ?auto_118289 ?auto_118297 ) ) ( not ( = ?auto_118290 ?auto_118291 ) ) ( not ( = ?auto_118290 ?auto_118292 ) ) ( not ( = ?auto_118290 ?auto_118293 ) ) ( not ( = ?auto_118290 ?auto_118294 ) ) ( not ( = ?auto_118290 ?auto_118295 ) ) ( not ( = ?auto_118290 ?auto_118296 ) ) ( not ( = ?auto_118290 ?auto_118297 ) ) ( not ( = ?auto_118291 ?auto_118292 ) ) ( not ( = ?auto_118291 ?auto_118293 ) ) ( not ( = ?auto_118291 ?auto_118294 ) ) ( not ( = ?auto_118291 ?auto_118295 ) ) ( not ( = ?auto_118291 ?auto_118296 ) ) ( not ( = ?auto_118291 ?auto_118297 ) ) ( not ( = ?auto_118292 ?auto_118293 ) ) ( not ( = ?auto_118292 ?auto_118294 ) ) ( not ( = ?auto_118292 ?auto_118295 ) ) ( not ( = ?auto_118292 ?auto_118296 ) ) ( not ( = ?auto_118292 ?auto_118297 ) ) ( not ( = ?auto_118293 ?auto_118294 ) ) ( not ( = ?auto_118293 ?auto_118295 ) ) ( not ( = ?auto_118293 ?auto_118296 ) ) ( not ( = ?auto_118293 ?auto_118297 ) ) ( not ( = ?auto_118294 ?auto_118295 ) ) ( not ( = ?auto_118294 ?auto_118296 ) ) ( not ( = ?auto_118294 ?auto_118297 ) ) ( not ( = ?auto_118295 ?auto_118296 ) ) ( not ( = ?auto_118295 ?auto_118297 ) ) ( not ( = ?auto_118296 ?auto_118297 ) ) ( ON ?auto_118295 ?auto_118296 ) ( CLEAR ?auto_118293 ) ( ON ?auto_118294 ?auto_118295 ) ( CLEAR ?auto_118294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118289 ?auto_118290 ?auto_118291 ?auto_118292 ?auto_118293 ?auto_118294 )
      ( MAKE-8PILE ?auto_118289 ?auto_118290 ?auto_118291 ?auto_118292 ?auto_118293 ?auto_118294 ?auto_118295 ?auto_118296 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118306 - BLOCK
      ?auto_118307 - BLOCK
      ?auto_118308 - BLOCK
      ?auto_118309 - BLOCK
      ?auto_118310 - BLOCK
      ?auto_118311 - BLOCK
      ?auto_118312 - BLOCK
      ?auto_118313 - BLOCK
    )
    :vars
    (
      ?auto_118314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118313 ?auto_118314 ) ( ON-TABLE ?auto_118306 ) ( ON ?auto_118307 ?auto_118306 ) ( ON ?auto_118308 ?auto_118307 ) ( ON ?auto_118309 ?auto_118308 ) ( not ( = ?auto_118306 ?auto_118307 ) ) ( not ( = ?auto_118306 ?auto_118308 ) ) ( not ( = ?auto_118306 ?auto_118309 ) ) ( not ( = ?auto_118306 ?auto_118310 ) ) ( not ( = ?auto_118306 ?auto_118311 ) ) ( not ( = ?auto_118306 ?auto_118312 ) ) ( not ( = ?auto_118306 ?auto_118313 ) ) ( not ( = ?auto_118306 ?auto_118314 ) ) ( not ( = ?auto_118307 ?auto_118308 ) ) ( not ( = ?auto_118307 ?auto_118309 ) ) ( not ( = ?auto_118307 ?auto_118310 ) ) ( not ( = ?auto_118307 ?auto_118311 ) ) ( not ( = ?auto_118307 ?auto_118312 ) ) ( not ( = ?auto_118307 ?auto_118313 ) ) ( not ( = ?auto_118307 ?auto_118314 ) ) ( not ( = ?auto_118308 ?auto_118309 ) ) ( not ( = ?auto_118308 ?auto_118310 ) ) ( not ( = ?auto_118308 ?auto_118311 ) ) ( not ( = ?auto_118308 ?auto_118312 ) ) ( not ( = ?auto_118308 ?auto_118313 ) ) ( not ( = ?auto_118308 ?auto_118314 ) ) ( not ( = ?auto_118309 ?auto_118310 ) ) ( not ( = ?auto_118309 ?auto_118311 ) ) ( not ( = ?auto_118309 ?auto_118312 ) ) ( not ( = ?auto_118309 ?auto_118313 ) ) ( not ( = ?auto_118309 ?auto_118314 ) ) ( not ( = ?auto_118310 ?auto_118311 ) ) ( not ( = ?auto_118310 ?auto_118312 ) ) ( not ( = ?auto_118310 ?auto_118313 ) ) ( not ( = ?auto_118310 ?auto_118314 ) ) ( not ( = ?auto_118311 ?auto_118312 ) ) ( not ( = ?auto_118311 ?auto_118313 ) ) ( not ( = ?auto_118311 ?auto_118314 ) ) ( not ( = ?auto_118312 ?auto_118313 ) ) ( not ( = ?auto_118312 ?auto_118314 ) ) ( not ( = ?auto_118313 ?auto_118314 ) ) ( ON ?auto_118312 ?auto_118313 ) ( ON ?auto_118311 ?auto_118312 ) ( CLEAR ?auto_118309 ) ( ON ?auto_118310 ?auto_118311 ) ( CLEAR ?auto_118310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118306 ?auto_118307 ?auto_118308 ?auto_118309 ?auto_118310 )
      ( MAKE-8PILE ?auto_118306 ?auto_118307 ?auto_118308 ?auto_118309 ?auto_118310 ?auto_118311 ?auto_118312 ?auto_118313 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118323 - BLOCK
      ?auto_118324 - BLOCK
      ?auto_118325 - BLOCK
      ?auto_118326 - BLOCK
      ?auto_118327 - BLOCK
      ?auto_118328 - BLOCK
      ?auto_118329 - BLOCK
      ?auto_118330 - BLOCK
    )
    :vars
    (
      ?auto_118331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118330 ?auto_118331 ) ( ON-TABLE ?auto_118323 ) ( ON ?auto_118324 ?auto_118323 ) ( ON ?auto_118325 ?auto_118324 ) ( ON ?auto_118326 ?auto_118325 ) ( not ( = ?auto_118323 ?auto_118324 ) ) ( not ( = ?auto_118323 ?auto_118325 ) ) ( not ( = ?auto_118323 ?auto_118326 ) ) ( not ( = ?auto_118323 ?auto_118327 ) ) ( not ( = ?auto_118323 ?auto_118328 ) ) ( not ( = ?auto_118323 ?auto_118329 ) ) ( not ( = ?auto_118323 ?auto_118330 ) ) ( not ( = ?auto_118323 ?auto_118331 ) ) ( not ( = ?auto_118324 ?auto_118325 ) ) ( not ( = ?auto_118324 ?auto_118326 ) ) ( not ( = ?auto_118324 ?auto_118327 ) ) ( not ( = ?auto_118324 ?auto_118328 ) ) ( not ( = ?auto_118324 ?auto_118329 ) ) ( not ( = ?auto_118324 ?auto_118330 ) ) ( not ( = ?auto_118324 ?auto_118331 ) ) ( not ( = ?auto_118325 ?auto_118326 ) ) ( not ( = ?auto_118325 ?auto_118327 ) ) ( not ( = ?auto_118325 ?auto_118328 ) ) ( not ( = ?auto_118325 ?auto_118329 ) ) ( not ( = ?auto_118325 ?auto_118330 ) ) ( not ( = ?auto_118325 ?auto_118331 ) ) ( not ( = ?auto_118326 ?auto_118327 ) ) ( not ( = ?auto_118326 ?auto_118328 ) ) ( not ( = ?auto_118326 ?auto_118329 ) ) ( not ( = ?auto_118326 ?auto_118330 ) ) ( not ( = ?auto_118326 ?auto_118331 ) ) ( not ( = ?auto_118327 ?auto_118328 ) ) ( not ( = ?auto_118327 ?auto_118329 ) ) ( not ( = ?auto_118327 ?auto_118330 ) ) ( not ( = ?auto_118327 ?auto_118331 ) ) ( not ( = ?auto_118328 ?auto_118329 ) ) ( not ( = ?auto_118328 ?auto_118330 ) ) ( not ( = ?auto_118328 ?auto_118331 ) ) ( not ( = ?auto_118329 ?auto_118330 ) ) ( not ( = ?auto_118329 ?auto_118331 ) ) ( not ( = ?auto_118330 ?auto_118331 ) ) ( ON ?auto_118329 ?auto_118330 ) ( ON ?auto_118328 ?auto_118329 ) ( CLEAR ?auto_118326 ) ( ON ?auto_118327 ?auto_118328 ) ( CLEAR ?auto_118327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118323 ?auto_118324 ?auto_118325 ?auto_118326 ?auto_118327 )
      ( MAKE-8PILE ?auto_118323 ?auto_118324 ?auto_118325 ?auto_118326 ?auto_118327 ?auto_118328 ?auto_118329 ?auto_118330 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118340 - BLOCK
      ?auto_118341 - BLOCK
      ?auto_118342 - BLOCK
      ?auto_118343 - BLOCK
      ?auto_118344 - BLOCK
      ?auto_118345 - BLOCK
      ?auto_118346 - BLOCK
      ?auto_118347 - BLOCK
    )
    :vars
    (
      ?auto_118348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118347 ?auto_118348 ) ( ON-TABLE ?auto_118340 ) ( ON ?auto_118341 ?auto_118340 ) ( ON ?auto_118342 ?auto_118341 ) ( not ( = ?auto_118340 ?auto_118341 ) ) ( not ( = ?auto_118340 ?auto_118342 ) ) ( not ( = ?auto_118340 ?auto_118343 ) ) ( not ( = ?auto_118340 ?auto_118344 ) ) ( not ( = ?auto_118340 ?auto_118345 ) ) ( not ( = ?auto_118340 ?auto_118346 ) ) ( not ( = ?auto_118340 ?auto_118347 ) ) ( not ( = ?auto_118340 ?auto_118348 ) ) ( not ( = ?auto_118341 ?auto_118342 ) ) ( not ( = ?auto_118341 ?auto_118343 ) ) ( not ( = ?auto_118341 ?auto_118344 ) ) ( not ( = ?auto_118341 ?auto_118345 ) ) ( not ( = ?auto_118341 ?auto_118346 ) ) ( not ( = ?auto_118341 ?auto_118347 ) ) ( not ( = ?auto_118341 ?auto_118348 ) ) ( not ( = ?auto_118342 ?auto_118343 ) ) ( not ( = ?auto_118342 ?auto_118344 ) ) ( not ( = ?auto_118342 ?auto_118345 ) ) ( not ( = ?auto_118342 ?auto_118346 ) ) ( not ( = ?auto_118342 ?auto_118347 ) ) ( not ( = ?auto_118342 ?auto_118348 ) ) ( not ( = ?auto_118343 ?auto_118344 ) ) ( not ( = ?auto_118343 ?auto_118345 ) ) ( not ( = ?auto_118343 ?auto_118346 ) ) ( not ( = ?auto_118343 ?auto_118347 ) ) ( not ( = ?auto_118343 ?auto_118348 ) ) ( not ( = ?auto_118344 ?auto_118345 ) ) ( not ( = ?auto_118344 ?auto_118346 ) ) ( not ( = ?auto_118344 ?auto_118347 ) ) ( not ( = ?auto_118344 ?auto_118348 ) ) ( not ( = ?auto_118345 ?auto_118346 ) ) ( not ( = ?auto_118345 ?auto_118347 ) ) ( not ( = ?auto_118345 ?auto_118348 ) ) ( not ( = ?auto_118346 ?auto_118347 ) ) ( not ( = ?auto_118346 ?auto_118348 ) ) ( not ( = ?auto_118347 ?auto_118348 ) ) ( ON ?auto_118346 ?auto_118347 ) ( ON ?auto_118345 ?auto_118346 ) ( ON ?auto_118344 ?auto_118345 ) ( CLEAR ?auto_118342 ) ( ON ?auto_118343 ?auto_118344 ) ( CLEAR ?auto_118343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118340 ?auto_118341 ?auto_118342 ?auto_118343 )
      ( MAKE-8PILE ?auto_118340 ?auto_118341 ?auto_118342 ?auto_118343 ?auto_118344 ?auto_118345 ?auto_118346 ?auto_118347 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118357 - BLOCK
      ?auto_118358 - BLOCK
      ?auto_118359 - BLOCK
      ?auto_118360 - BLOCK
      ?auto_118361 - BLOCK
      ?auto_118362 - BLOCK
      ?auto_118363 - BLOCK
      ?auto_118364 - BLOCK
    )
    :vars
    (
      ?auto_118365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118364 ?auto_118365 ) ( ON-TABLE ?auto_118357 ) ( ON ?auto_118358 ?auto_118357 ) ( ON ?auto_118359 ?auto_118358 ) ( not ( = ?auto_118357 ?auto_118358 ) ) ( not ( = ?auto_118357 ?auto_118359 ) ) ( not ( = ?auto_118357 ?auto_118360 ) ) ( not ( = ?auto_118357 ?auto_118361 ) ) ( not ( = ?auto_118357 ?auto_118362 ) ) ( not ( = ?auto_118357 ?auto_118363 ) ) ( not ( = ?auto_118357 ?auto_118364 ) ) ( not ( = ?auto_118357 ?auto_118365 ) ) ( not ( = ?auto_118358 ?auto_118359 ) ) ( not ( = ?auto_118358 ?auto_118360 ) ) ( not ( = ?auto_118358 ?auto_118361 ) ) ( not ( = ?auto_118358 ?auto_118362 ) ) ( not ( = ?auto_118358 ?auto_118363 ) ) ( not ( = ?auto_118358 ?auto_118364 ) ) ( not ( = ?auto_118358 ?auto_118365 ) ) ( not ( = ?auto_118359 ?auto_118360 ) ) ( not ( = ?auto_118359 ?auto_118361 ) ) ( not ( = ?auto_118359 ?auto_118362 ) ) ( not ( = ?auto_118359 ?auto_118363 ) ) ( not ( = ?auto_118359 ?auto_118364 ) ) ( not ( = ?auto_118359 ?auto_118365 ) ) ( not ( = ?auto_118360 ?auto_118361 ) ) ( not ( = ?auto_118360 ?auto_118362 ) ) ( not ( = ?auto_118360 ?auto_118363 ) ) ( not ( = ?auto_118360 ?auto_118364 ) ) ( not ( = ?auto_118360 ?auto_118365 ) ) ( not ( = ?auto_118361 ?auto_118362 ) ) ( not ( = ?auto_118361 ?auto_118363 ) ) ( not ( = ?auto_118361 ?auto_118364 ) ) ( not ( = ?auto_118361 ?auto_118365 ) ) ( not ( = ?auto_118362 ?auto_118363 ) ) ( not ( = ?auto_118362 ?auto_118364 ) ) ( not ( = ?auto_118362 ?auto_118365 ) ) ( not ( = ?auto_118363 ?auto_118364 ) ) ( not ( = ?auto_118363 ?auto_118365 ) ) ( not ( = ?auto_118364 ?auto_118365 ) ) ( ON ?auto_118363 ?auto_118364 ) ( ON ?auto_118362 ?auto_118363 ) ( ON ?auto_118361 ?auto_118362 ) ( CLEAR ?auto_118359 ) ( ON ?auto_118360 ?auto_118361 ) ( CLEAR ?auto_118360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118357 ?auto_118358 ?auto_118359 ?auto_118360 )
      ( MAKE-8PILE ?auto_118357 ?auto_118358 ?auto_118359 ?auto_118360 ?auto_118361 ?auto_118362 ?auto_118363 ?auto_118364 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118374 - BLOCK
      ?auto_118375 - BLOCK
      ?auto_118376 - BLOCK
      ?auto_118377 - BLOCK
      ?auto_118378 - BLOCK
      ?auto_118379 - BLOCK
      ?auto_118380 - BLOCK
      ?auto_118381 - BLOCK
    )
    :vars
    (
      ?auto_118382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118381 ?auto_118382 ) ( ON-TABLE ?auto_118374 ) ( ON ?auto_118375 ?auto_118374 ) ( not ( = ?auto_118374 ?auto_118375 ) ) ( not ( = ?auto_118374 ?auto_118376 ) ) ( not ( = ?auto_118374 ?auto_118377 ) ) ( not ( = ?auto_118374 ?auto_118378 ) ) ( not ( = ?auto_118374 ?auto_118379 ) ) ( not ( = ?auto_118374 ?auto_118380 ) ) ( not ( = ?auto_118374 ?auto_118381 ) ) ( not ( = ?auto_118374 ?auto_118382 ) ) ( not ( = ?auto_118375 ?auto_118376 ) ) ( not ( = ?auto_118375 ?auto_118377 ) ) ( not ( = ?auto_118375 ?auto_118378 ) ) ( not ( = ?auto_118375 ?auto_118379 ) ) ( not ( = ?auto_118375 ?auto_118380 ) ) ( not ( = ?auto_118375 ?auto_118381 ) ) ( not ( = ?auto_118375 ?auto_118382 ) ) ( not ( = ?auto_118376 ?auto_118377 ) ) ( not ( = ?auto_118376 ?auto_118378 ) ) ( not ( = ?auto_118376 ?auto_118379 ) ) ( not ( = ?auto_118376 ?auto_118380 ) ) ( not ( = ?auto_118376 ?auto_118381 ) ) ( not ( = ?auto_118376 ?auto_118382 ) ) ( not ( = ?auto_118377 ?auto_118378 ) ) ( not ( = ?auto_118377 ?auto_118379 ) ) ( not ( = ?auto_118377 ?auto_118380 ) ) ( not ( = ?auto_118377 ?auto_118381 ) ) ( not ( = ?auto_118377 ?auto_118382 ) ) ( not ( = ?auto_118378 ?auto_118379 ) ) ( not ( = ?auto_118378 ?auto_118380 ) ) ( not ( = ?auto_118378 ?auto_118381 ) ) ( not ( = ?auto_118378 ?auto_118382 ) ) ( not ( = ?auto_118379 ?auto_118380 ) ) ( not ( = ?auto_118379 ?auto_118381 ) ) ( not ( = ?auto_118379 ?auto_118382 ) ) ( not ( = ?auto_118380 ?auto_118381 ) ) ( not ( = ?auto_118380 ?auto_118382 ) ) ( not ( = ?auto_118381 ?auto_118382 ) ) ( ON ?auto_118380 ?auto_118381 ) ( ON ?auto_118379 ?auto_118380 ) ( ON ?auto_118378 ?auto_118379 ) ( ON ?auto_118377 ?auto_118378 ) ( CLEAR ?auto_118375 ) ( ON ?auto_118376 ?auto_118377 ) ( CLEAR ?auto_118376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118374 ?auto_118375 ?auto_118376 )
      ( MAKE-8PILE ?auto_118374 ?auto_118375 ?auto_118376 ?auto_118377 ?auto_118378 ?auto_118379 ?auto_118380 ?auto_118381 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118391 - BLOCK
      ?auto_118392 - BLOCK
      ?auto_118393 - BLOCK
      ?auto_118394 - BLOCK
      ?auto_118395 - BLOCK
      ?auto_118396 - BLOCK
      ?auto_118397 - BLOCK
      ?auto_118398 - BLOCK
    )
    :vars
    (
      ?auto_118399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118398 ?auto_118399 ) ( ON-TABLE ?auto_118391 ) ( ON ?auto_118392 ?auto_118391 ) ( not ( = ?auto_118391 ?auto_118392 ) ) ( not ( = ?auto_118391 ?auto_118393 ) ) ( not ( = ?auto_118391 ?auto_118394 ) ) ( not ( = ?auto_118391 ?auto_118395 ) ) ( not ( = ?auto_118391 ?auto_118396 ) ) ( not ( = ?auto_118391 ?auto_118397 ) ) ( not ( = ?auto_118391 ?auto_118398 ) ) ( not ( = ?auto_118391 ?auto_118399 ) ) ( not ( = ?auto_118392 ?auto_118393 ) ) ( not ( = ?auto_118392 ?auto_118394 ) ) ( not ( = ?auto_118392 ?auto_118395 ) ) ( not ( = ?auto_118392 ?auto_118396 ) ) ( not ( = ?auto_118392 ?auto_118397 ) ) ( not ( = ?auto_118392 ?auto_118398 ) ) ( not ( = ?auto_118392 ?auto_118399 ) ) ( not ( = ?auto_118393 ?auto_118394 ) ) ( not ( = ?auto_118393 ?auto_118395 ) ) ( not ( = ?auto_118393 ?auto_118396 ) ) ( not ( = ?auto_118393 ?auto_118397 ) ) ( not ( = ?auto_118393 ?auto_118398 ) ) ( not ( = ?auto_118393 ?auto_118399 ) ) ( not ( = ?auto_118394 ?auto_118395 ) ) ( not ( = ?auto_118394 ?auto_118396 ) ) ( not ( = ?auto_118394 ?auto_118397 ) ) ( not ( = ?auto_118394 ?auto_118398 ) ) ( not ( = ?auto_118394 ?auto_118399 ) ) ( not ( = ?auto_118395 ?auto_118396 ) ) ( not ( = ?auto_118395 ?auto_118397 ) ) ( not ( = ?auto_118395 ?auto_118398 ) ) ( not ( = ?auto_118395 ?auto_118399 ) ) ( not ( = ?auto_118396 ?auto_118397 ) ) ( not ( = ?auto_118396 ?auto_118398 ) ) ( not ( = ?auto_118396 ?auto_118399 ) ) ( not ( = ?auto_118397 ?auto_118398 ) ) ( not ( = ?auto_118397 ?auto_118399 ) ) ( not ( = ?auto_118398 ?auto_118399 ) ) ( ON ?auto_118397 ?auto_118398 ) ( ON ?auto_118396 ?auto_118397 ) ( ON ?auto_118395 ?auto_118396 ) ( ON ?auto_118394 ?auto_118395 ) ( CLEAR ?auto_118392 ) ( ON ?auto_118393 ?auto_118394 ) ( CLEAR ?auto_118393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118391 ?auto_118392 ?auto_118393 )
      ( MAKE-8PILE ?auto_118391 ?auto_118392 ?auto_118393 ?auto_118394 ?auto_118395 ?auto_118396 ?auto_118397 ?auto_118398 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118408 - BLOCK
      ?auto_118409 - BLOCK
      ?auto_118410 - BLOCK
      ?auto_118411 - BLOCK
      ?auto_118412 - BLOCK
      ?auto_118413 - BLOCK
      ?auto_118414 - BLOCK
      ?auto_118415 - BLOCK
    )
    :vars
    (
      ?auto_118416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118415 ?auto_118416 ) ( ON-TABLE ?auto_118408 ) ( not ( = ?auto_118408 ?auto_118409 ) ) ( not ( = ?auto_118408 ?auto_118410 ) ) ( not ( = ?auto_118408 ?auto_118411 ) ) ( not ( = ?auto_118408 ?auto_118412 ) ) ( not ( = ?auto_118408 ?auto_118413 ) ) ( not ( = ?auto_118408 ?auto_118414 ) ) ( not ( = ?auto_118408 ?auto_118415 ) ) ( not ( = ?auto_118408 ?auto_118416 ) ) ( not ( = ?auto_118409 ?auto_118410 ) ) ( not ( = ?auto_118409 ?auto_118411 ) ) ( not ( = ?auto_118409 ?auto_118412 ) ) ( not ( = ?auto_118409 ?auto_118413 ) ) ( not ( = ?auto_118409 ?auto_118414 ) ) ( not ( = ?auto_118409 ?auto_118415 ) ) ( not ( = ?auto_118409 ?auto_118416 ) ) ( not ( = ?auto_118410 ?auto_118411 ) ) ( not ( = ?auto_118410 ?auto_118412 ) ) ( not ( = ?auto_118410 ?auto_118413 ) ) ( not ( = ?auto_118410 ?auto_118414 ) ) ( not ( = ?auto_118410 ?auto_118415 ) ) ( not ( = ?auto_118410 ?auto_118416 ) ) ( not ( = ?auto_118411 ?auto_118412 ) ) ( not ( = ?auto_118411 ?auto_118413 ) ) ( not ( = ?auto_118411 ?auto_118414 ) ) ( not ( = ?auto_118411 ?auto_118415 ) ) ( not ( = ?auto_118411 ?auto_118416 ) ) ( not ( = ?auto_118412 ?auto_118413 ) ) ( not ( = ?auto_118412 ?auto_118414 ) ) ( not ( = ?auto_118412 ?auto_118415 ) ) ( not ( = ?auto_118412 ?auto_118416 ) ) ( not ( = ?auto_118413 ?auto_118414 ) ) ( not ( = ?auto_118413 ?auto_118415 ) ) ( not ( = ?auto_118413 ?auto_118416 ) ) ( not ( = ?auto_118414 ?auto_118415 ) ) ( not ( = ?auto_118414 ?auto_118416 ) ) ( not ( = ?auto_118415 ?auto_118416 ) ) ( ON ?auto_118414 ?auto_118415 ) ( ON ?auto_118413 ?auto_118414 ) ( ON ?auto_118412 ?auto_118413 ) ( ON ?auto_118411 ?auto_118412 ) ( ON ?auto_118410 ?auto_118411 ) ( CLEAR ?auto_118408 ) ( ON ?auto_118409 ?auto_118410 ) ( CLEAR ?auto_118409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118408 ?auto_118409 )
      ( MAKE-8PILE ?auto_118408 ?auto_118409 ?auto_118410 ?auto_118411 ?auto_118412 ?auto_118413 ?auto_118414 ?auto_118415 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118425 - BLOCK
      ?auto_118426 - BLOCK
      ?auto_118427 - BLOCK
      ?auto_118428 - BLOCK
      ?auto_118429 - BLOCK
      ?auto_118430 - BLOCK
      ?auto_118431 - BLOCK
      ?auto_118432 - BLOCK
    )
    :vars
    (
      ?auto_118433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118432 ?auto_118433 ) ( ON-TABLE ?auto_118425 ) ( not ( = ?auto_118425 ?auto_118426 ) ) ( not ( = ?auto_118425 ?auto_118427 ) ) ( not ( = ?auto_118425 ?auto_118428 ) ) ( not ( = ?auto_118425 ?auto_118429 ) ) ( not ( = ?auto_118425 ?auto_118430 ) ) ( not ( = ?auto_118425 ?auto_118431 ) ) ( not ( = ?auto_118425 ?auto_118432 ) ) ( not ( = ?auto_118425 ?auto_118433 ) ) ( not ( = ?auto_118426 ?auto_118427 ) ) ( not ( = ?auto_118426 ?auto_118428 ) ) ( not ( = ?auto_118426 ?auto_118429 ) ) ( not ( = ?auto_118426 ?auto_118430 ) ) ( not ( = ?auto_118426 ?auto_118431 ) ) ( not ( = ?auto_118426 ?auto_118432 ) ) ( not ( = ?auto_118426 ?auto_118433 ) ) ( not ( = ?auto_118427 ?auto_118428 ) ) ( not ( = ?auto_118427 ?auto_118429 ) ) ( not ( = ?auto_118427 ?auto_118430 ) ) ( not ( = ?auto_118427 ?auto_118431 ) ) ( not ( = ?auto_118427 ?auto_118432 ) ) ( not ( = ?auto_118427 ?auto_118433 ) ) ( not ( = ?auto_118428 ?auto_118429 ) ) ( not ( = ?auto_118428 ?auto_118430 ) ) ( not ( = ?auto_118428 ?auto_118431 ) ) ( not ( = ?auto_118428 ?auto_118432 ) ) ( not ( = ?auto_118428 ?auto_118433 ) ) ( not ( = ?auto_118429 ?auto_118430 ) ) ( not ( = ?auto_118429 ?auto_118431 ) ) ( not ( = ?auto_118429 ?auto_118432 ) ) ( not ( = ?auto_118429 ?auto_118433 ) ) ( not ( = ?auto_118430 ?auto_118431 ) ) ( not ( = ?auto_118430 ?auto_118432 ) ) ( not ( = ?auto_118430 ?auto_118433 ) ) ( not ( = ?auto_118431 ?auto_118432 ) ) ( not ( = ?auto_118431 ?auto_118433 ) ) ( not ( = ?auto_118432 ?auto_118433 ) ) ( ON ?auto_118431 ?auto_118432 ) ( ON ?auto_118430 ?auto_118431 ) ( ON ?auto_118429 ?auto_118430 ) ( ON ?auto_118428 ?auto_118429 ) ( ON ?auto_118427 ?auto_118428 ) ( CLEAR ?auto_118425 ) ( ON ?auto_118426 ?auto_118427 ) ( CLEAR ?auto_118426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118425 ?auto_118426 )
      ( MAKE-8PILE ?auto_118425 ?auto_118426 ?auto_118427 ?auto_118428 ?auto_118429 ?auto_118430 ?auto_118431 ?auto_118432 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118442 - BLOCK
      ?auto_118443 - BLOCK
      ?auto_118444 - BLOCK
      ?auto_118445 - BLOCK
      ?auto_118446 - BLOCK
      ?auto_118447 - BLOCK
      ?auto_118448 - BLOCK
      ?auto_118449 - BLOCK
    )
    :vars
    (
      ?auto_118450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118449 ?auto_118450 ) ( not ( = ?auto_118442 ?auto_118443 ) ) ( not ( = ?auto_118442 ?auto_118444 ) ) ( not ( = ?auto_118442 ?auto_118445 ) ) ( not ( = ?auto_118442 ?auto_118446 ) ) ( not ( = ?auto_118442 ?auto_118447 ) ) ( not ( = ?auto_118442 ?auto_118448 ) ) ( not ( = ?auto_118442 ?auto_118449 ) ) ( not ( = ?auto_118442 ?auto_118450 ) ) ( not ( = ?auto_118443 ?auto_118444 ) ) ( not ( = ?auto_118443 ?auto_118445 ) ) ( not ( = ?auto_118443 ?auto_118446 ) ) ( not ( = ?auto_118443 ?auto_118447 ) ) ( not ( = ?auto_118443 ?auto_118448 ) ) ( not ( = ?auto_118443 ?auto_118449 ) ) ( not ( = ?auto_118443 ?auto_118450 ) ) ( not ( = ?auto_118444 ?auto_118445 ) ) ( not ( = ?auto_118444 ?auto_118446 ) ) ( not ( = ?auto_118444 ?auto_118447 ) ) ( not ( = ?auto_118444 ?auto_118448 ) ) ( not ( = ?auto_118444 ?auto_118449 ) ) ( not ( = ?auto_118444 ?auto_118450 ) ) ( not ( = ?auto_118445 ?auto_118446 ) ) ( not ( = ?auto_118445 ?auto_118447 ) ) ( not ( = ?auto_118445 ?auto_118448 ) ) ( not ( = ?auto_118445 ?auto_118449 ) ) ( not ( = ?auto_118445 ?auto_118450 ) ) ( not ( = ?auto_118446 ?auto_118447 ) ) ( not ( = ?auto_118446 ?auto_118448 ) ) ( not ( = ?auto_118446 ?auto_118449 ) ) ( not ( = ?auto_118446 ?auto_118450 ) ) ( not ( = ?auto_118447 ?auto_118448 ) ) ( not ( = ?auto_118447 ?auto_118449 ) ) ( not ( = ?auto_118447 ?auto_118450 ) ) ( not ( = ?auto_118448 ?auto_118449 ) ) ( not ( = ?auto_118448 ?auto_118450 ) ) ( not ( = ?auto_118449 ?auto_118450 ) ) ( ON ?auto_118448 ?auto_118449 ) ( ON ?auto_118447 ?auto_118448 ) ( ON ?auto_118446 ?auto_118447 ) ( ON ?auto_118445 ?auto_118446 ) ( ON ?auto_118444 ?auto_118445 ) ( ON ?auto_118443 ?auto_118444 ) ( ON ?auto_118442 ?auto_118443 ) ( CLEAR ?auto_118442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118442 )
      ( MAKE-8PILE ?auto_118442 ?auto_118443 ?auto_118444 ?auto_118445 ?auto_118446 ?auto_118447 ?auto_118448 ?auto_118449 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_118459 - BLOCK
      ?auto_118460 - BLOCK
      ?auto_118461 - BLOCK
      ?auto_118462 - BLOCK
      ?auto_118463 - BLOCK
      ?auto_118464 - BLOCK
      ?auto_118465 - BLOCK
      ?auto_118466 - BLOCK
    )
    :vars
    (
      ?auto_118467 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118466 ?auto_118467 ) ( not ( = ?auto_118459 ?auto_118460 ) ) ( not ( = ?auto_118459 ?auto_118461 ) ) ( not ( = ?auto_118459 ?auto_118462 ) ) ( not ( = ?auto_118459 ?auto_118463 ) ) ( not ( = ?auto_118459 ?auto_118464 ) ) ( not ( = ?auto_118459 ?auto_118465 ) ) ( not ( = ?auto_118459 ?auto_118466 ) ) ( not ( = ?auto_118459 ?auto_118467 ) ) ( not ( = ?auto_118460 ?auto_118461 ) ) ( not ( = ?auto_118460 ?auto_118462 ) ) ( not ( = ?auto_118460 ?auto_118463 ) ) ( not ( = ?auto_118460 ?auto_118464 ) ) ( not ( = ?auto_118460 ?auto_118465 ) ) ( not ( = ?auto_118460 ?auto_118466 ) ) ( not ( = ?auto_118460 ?auto_118467 ) ) ( not ( = ?auto_118461 ?auto_118462 ) ) ( not ( = ?auto_118461 ?auto_118463 ) ) ( not ( = ?auto_118461 ?auto_118464 ) ) ( not ( = ?auto_118461 ?auto_118465 ) ) ( not ( = ?auto_118461 ?auto_118466 ) ) ( not ( = ?auto_118461 ?auto_118467 ) ) ( not ( = ?auto_118462 ?auto_118463 ) ) ( not ( = ?auto_118462 ?auto_118464 ) ) ( not ( = ?auto_118462 ?auto_118465 ) ) ( not ( = ?auto_118462 ?auto_118466 ) ) ( not ( = ?auto_118462 ?auto_118467 ) ) ( not ( = ?auto_118463 ?auto_118464 ) ) ( not ( = ?auto_118463 ?auto_118465 ) ) ( not ( = ?auto_118463 ?auto_118466 ) ) ( not ( = ?auto_118463 ?auto_118467 ) ) ( not ( = ?auto_118464 ?auto_118465 ) ) ( not ( = ?auto_118464 ?auto_118466 ) ) ( not ( = ?auto_118464 ?auto_118467 ) ) ( not ( = ?auto_118465 ?auto_118466 ) ) ( not ( = ?auto_118465 ?auto_118467 ) ) ( not ( = ?auto_118466 ?auto_118467 ) ) ( ON ?auto_118465 ?auto_118466 ) ( ON ?auto_118464 ?auto_118465 ) ( ON ?auto_118463 ?auto_118464 ) ( ON ?auto_118462 ?auto_118463 ) ( ON ?auto_118461 ?auto_118462 ) ( ON ?auto_118460 ?auto_118461 ) ( ON ?auto_118459 ?auto_118460 ) ( CLEAR ?auto_118459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118459 )
      ( MAKE-8PILE ?auto_118459 ?auto_118460 ?auto_118461 ?auto_118462 ?auto_118463 ?auto_118464 ?auto_118465 ?auto_118466 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118477 - BLOCK
      ?auto_118478 - BLOCK
      ?auto_118479 - BLOCK
      ?auto_118480 - BLOCK
      ?auto_118481 - BLOCK
      ?auto_118482 - BLOCK
      ?auto_118483 - BLOCK
      ?auto_118484 - BLOCK
      ?auto_118485 - BLOCK
    )
    :vars
    (
      ?auto_118486 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118484 ) ( ON ?auto_118485 ?auto_118486 ) ( CLEAR ?auto_118485 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118477 ) ( ON ?auto_118478 ?auto_118477 ) ( ON ?auto_118479 ?auto_118478 ) ( ON ?auto_118480 ?auto_118479 ) ( ON ?auto_118481 ?auto_118480 ) ( ON ?auto_118482 ?auto_118481 ) ( ON ?auto_118483 ?auto_118482 ) ( ON ?auto_118484 ?auto_118483 ) ( not ( = ?auto_118477 ?auto_118478 ) ) ( not ( = ?auto_118477 ?auto_118479 ) ) ( not ( = ?auto_118477 ?auto_118480 ) ) ( not ( = ?auto_118477 ?auto_118481 ) ) ( not ( = ?auto_118477 ?auto_118482 ) ) ( not ( = ?auto_118477 ?auto_118483 ) ) ( not ( = ?auto_118477 ?auto_118484 ) ) ( not ( = ?auto_118477 ?auto_118485 ) ) ( not ( = ?auto_118477 ?auto_118486 ) ) ( not ( = ?auto_118478 ?auto_118479 ) ) ( not ( = ?auto_118478 ?auto_118480 ) ) ( not ( = ?auto_118478 ?auto_118481 ) ) ( not ( = ?auto_118478 ?auto_118482 ) ) ( not ( = ?auto_118478 ?auto_118483 ) ) ( not ( = ?auto_118478 ?auto_118484 ) ) ( not ( = ?auto_118478 ?auto_118485 ) ) ( not ( = ?auto_118478 ?auto_118486 ) ) ( not ( = ?auto_118479 ?auto_118480 ) ) ( not ( = ?auto_118479 ?auto_118481 ) ) ( not ( = ?auto_118479 ?auto_118482 ) ) ( not ( = ?auto_118479 ?auto_118483 ) ) ( not ( = ?auto_118479 ?auto_118484 ) ) ( not ( = ?auto_118479 ?auto_118485 ) ) ( not ( = ?auto_118479 ?auto_118486 ) ) ( not ( = ?auto_118480 ?auto_118481 ) ) ( not ( = ?auto_118480 ?auto_118482 ) ) ( not ( = ?auto_118480 ?auto_118483 ) ) ( not ( = ?auto_118480 ?auto_118484 ) ) ( not ( = ?auto_118480 ?auto_118485 ) ) ( not ( = ?auto_118480 ?auto_118486 ) ) ( not ( = ?auto_118481 ?auto_118482 ) ) ( not ( = ?auto_118481 ?auto_118483 ) ) ( not ( = ?auto_118481 ?auto_118484 ) ) ( not ( = ?auto_118481 ?auto_118485 ) ) ( not ( = ?auto_118481 ?auto_118486 ) ) ( not ( = ?auto_118482 ?auto_118483 ) ) ( not ( = ?auto_118482 ?auto_118484 ) ) ( not ( = ?auto_118482 ?auto_118485 ) ) ( not ( = ?auto_118482 ?auto_118486 ) ) ( not ( = ?auto_118483 ?auto_118484 ) ) ( not ( = ?auto_118483 ?auto_118485 ) ) ( not ( = ?auto_118483 ?auto_118486 ) ) ( not ( = ?auto_118484 ?auto_118485 ) ) ( not ( = ?auto_118484 ?auto_118486 ) ) ( not ( = ?auto_118485 ?auto_118486 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118485 ?auto_118486 )
      ( !STACK ?auto_118485 ?auto_118484 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118496 - BLOCK
      ?auto_118497 - BLOCK
      ?auto_118498 - BLOCK
      ?auto_118499 - BLOCK
      ?auto_118500 - BLOCK
      ?auto_118501 - BLOCK
      ?auto_118502 - BLOCK
      ?auto_118503 - BLOCK
      ?auto_118504 - BLOCK
    )
    :vars
    (
      ?auto_118505 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118503 ) ( ON ?auto_118504 ?auto_118505 ) ( CLEAR ?auto_118504 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118496 ) ( ON ?auto_118497 ?auto_118496 ) ( ON ?auto_118498 ?auto_118497 ) ( ON ?auto_118499 ?auto_118498 ) ( ON ?auto_118500 ?auto_118499 ) ( ON ?auto_118501 ?auto_118500 ) ( ON ?auto_118502 ?auto_118501 ) ( ON ?auto_118503 ?auto_118502 ) ( not ( = ?auto_118496 ?auto_118497 ) ) ( not ( = ?auto_118496 ?auto_118498 ) ) ( not ( = ?auto_118496 ?auto_118499 ) ) ( not ( = ?auto_118496 ?auto_118500 ) ) ( not ( = ?auto_118496 ?auto_118501 ) ) ( not ( = ?auto_118496 ?auto_118502 ) ) ( not ( = ?auto_118496 ?auto_118503 ) ) ( not ( = ?auto_118496 ?auto_118504 ) ) ( not ( = ?auto_118496 ?auto_118505 ) ) ( not ( = ?auto_118497 ?auto_118498 ) ) ( not ( = ?auto_118497 ?auto_118499 ) ) ( not ( = ?auto_118497 ?auto_118500 ) ) ( not ( = ?auto_118497 ?auto_118501 ) ) ( not ( = ?auto_118497 ?auto_118502 ) ) ( not ( = ?auto_118497 ?auto_118503 ) ) ( not ( = ?auto_118497 ?auto_118504 ) ) ( not ( = ?auto_118497 ?auto_118505 ) ) ( not ( = ?auto_118498 ?auto_118499 ) ) ( not ( = ?auto_118498 ?auto_118500 ) ) ( not ( = ?auto_118498 ?auto_118501 ) ) ( not ( = ?auto_118498 ?auto_118502 ) ) ( not ( = ?auto_118498 ?auto_118503 ) ) ( not ( = ?auto_118498 ?auto_118504 ) ) ( not ( = ?auto_118498 ?auto_118505 ) ) ( not ( = ?auto_118499 ?auto_118500 ) ) ( not ( = ?auto_118499 ?auto_118501 ) ) ( not ( = ?auto_118499 ?auto_118502 ) ) ( not ( = ?auto_118499 ?auto_118503 ) ) ( not ( = ?auto_118499 ?auto_118504 ) ) ( not ( = ?auto_118499 ?auto_118505 ) ) ( not ( = ?auto_118500 ?auto_118501 ) ) ( not ( = ?auto_118500 ?auto_118502 ) ) ( not ( = ?auto_118500 ?auto_118503 ) ) ( not ( = ?auto_118500 ?auto_118504 ) ) ( not ( = ?auto_118500 ?auto_118505 ) ) ( not ( = ?auto_118501 ?auto_118502 ) ) ( not ( = ?auto_118501 ?auto_118503 ) ) ( not ( = ?auto_118501 ?auto_118504 ) ) ( not ( = ?auto_118501 ?auto_118505 ) ) ( not ( = ?auto_118502 ?auto_118503 ) ) ( not ( = ?auto_118502 ?auto_118504 ) ) ( not ( = ?auto_118502 ?auto_118505 ) ) ( not ( = ?auto_118503 ?auto_118504 ) ) ( not ( = ?auto_118503 ?auto_118505 ) ) ( not ( = ?auto_118504 ?auto_118505 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118504 ?auto_118505 )
      ( !STACK ?auto_118504 ?auto_118503 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118515 - BLOCK
      ?auto_118516 - BLOCK
      ?auto_118517 - BLOCK
      ?auto_118518 - BLOCK
      ?auto_118519 - BLOCK
      ?auto_118520 - BLOCK
      ?auto_118521 - BLOCK
      ?auto_118522 - BLOCK
      ?auto_118523 - BLOCK
    )
    :vars
    (
      ?auto_118524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118523 ?auto_118524 ) ( ON-TABLE ?auto_118515 ) ( ON ?auto_118516 ?auto_118515 ) ( ON ?auto_118517 ?auto_118516 ) ( ON ?auto_118518 ?auto_118517 ) ( ON ?auto_118519 ?auto_118518 ) ( ON ?auto_118520 ?auto_118519 ) ( ON ?auto_118521 ?auto_118520 ) ( not ( = ?auto_118515 ?auto_118516 ) ) ( not ( = ?auto_118515 ?auto_118517 ) ) ( not ( = ?auto_118515 ?auto_118518 ) ) ( not ( = ?auto_118515 ?auto_118519 ) ) ( not ( = ?auto_118515 ?auto_118520 ) ) ( not ( = ?auto_118515 ?auto_118521 ) ) ( not ( = ?auto_118515 ?auto_118522 ) ) ( not ( = ?auto_118515 ?auto_118523 ) ) ( not ( = ?auto_118515 ?auto_118524 ) ) ( not ( = ?auto_118516 ?auto_118517 ) ) ( not ( = ?auto_118516 ?auto_118518 ) ) ( not ( = ?auto_118516 ?auto_118519 ) ) ( not ( = ?auto_118516 ?auto_118520 ) ) ( not ( = ?auto_118516 ?auto_118521 ) ) ( not ( = ?auto_118516 ?auto_118522 ) ) ( not ( = ?auto_118516 ?auto_118523 ) ) ( not ( = ?auto_118516 ?auto_118524 ) ) ( not ( = ?auto_118517 ?auto_118518 ) ) ( not ( = ?auto_118517 ?auto_118519 ) ) ( not ( = ?auto_118517 ?auto_118520 ) ) ( not ( = ?auto_118517 ?auto_118521 ) ) ( not ( = ?auto_118517 ?auto_118522 ) ) ( not ( = ?auto_118517 ?auto_118523 ) ) ( not ( = ?auto_118517 ?auto_118524 ) ) ( not ( = ?auto_118518 ?auto_118519 ) ) ( not ( = ?auto_118518 ?auto_118520 ) ) ( not ( = ?auto_118518 ?auto_118521 ) ) ( not ( = ?auto_118518 ?auto_118522 ) ) ( not ( = ?auto_118518 ?auto_118523 ) ) ( not ( = ?auto_118518 ?auto_118524 ) ) ( not ( = ?auto_118519 ?auto_118520 ) ) ( not ( = ?auto_118519 ?auto_118521 ) ) ( not ( = ?auto_118519 ?auto_118522 ) ) ( not ( = ?auto_118519 ?auto_118523 ) ) ( not ( = ?auto_118519 ?auto_118524 ) ) ( not ( = ?auto_118520 ?auto_118521 ) ) ( not ( = ?auto_118520 ?auto_118522 ) ) ( not ( = ?auto_118520 ?auto_118523 ) ) ( not ( = ?auto_118520 ?auto_118524 ) ) ( not ( = ?auto_118521 ?auto_118522 ) ) ( not ( = ?auto_118521 ?auto_118523 ) ) ( not ( = ?auto_118521 ?auto_118524 ) ) ( not ( = ?auto_118522 ?auto_118523 ) ) ( not ( = ?auto_118522 ?auto_118524 ) ) ( not ( = ?auto_118523 ?auto_118524 ) ) ( CLEAR ?auto_118521 ) ( ON ?auto_118522 ?auto_118523 ) ( CLEAR ?auto_118522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_118515 ?auto_118516 ?auto_118517 ?auto_118518 ?auto_118519 ?auto_118520 ?auto_118521 ?auto_118522 )
      ( MAKE-9PILE ?auto_118515 ?auto_118516 ?auto_118517 ?auto_118518 ?auto_118519 ?auto_118520 ?auto_118521 ?auto_118522 ?auto_118523 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118534 - BLOCK
      ?auto_118535 - BLOCK
      ?auto_118536 - BLOCK
      ?auto_118537 - BLOCK
      ?auto_118538 - BLOCK
      ?auto_118539 - BLOCK
      ?auto_118540 - BLOCK
      ?auto_118541 - BLOCK
      ?auto_118542 - BLOCK
    )
    :vars
    (
      ?auto_118543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118542 ?auto_118543 ) ( ON-TABLE ?auto_118534 ) ( ON ?auto_118535 ?auto_118534 ) ( ON ?auto_118536 ?auto_118535 ) ( ON ?auto_118537 ?auto_118536 ) ( ON ?auto_118538 ?auto_118537 ) ( ON ?auto_118539 ?auto_118538 ) ( ON ?auto_118540 ?auto_118539 ) ( not ( = ?auto_118534 ?auto_118535 ) ) ( not ( = ?auto_118534 ?auto_118536 ) ) ( not ( = ?auto_118534 ?auto_118537 ) ) ( not ( = ?auto_118534 ?auto_118538 ) ) ( not ( = ?auto_118534 ?auto_118539 ) ) ( not ( = ?auto_118534 ?auto_118540 ) ) ( not ( = ?auto_118534 ?auto_118541 ) ) ( not ( = ?auto_118534 ?auto_118542 ) ) ( not ( = ?auto_118534 ?auto_118543 ) ) ( not ( = ?auto_118535 ?auto_118536 ) ) ( not ( = ?auto_118535 ?auto_118537 ) ) ( not ( = ?auto_118535 ?auto_118538 ) ) ( not ( = ?auto_118535 ?auto_118539 ) ) ( not ( = ?auto_118535 ?auto_118540 ) ) ( not ( = ?auto_118535 ?auto_118541 ) ) ( not ( = ?auto_118535 ?auto_118542 ) ) ( not ( = ?auto_118535 ?auto_118543 ) ) ( not ( = ?auto_118536 ?auto_118537 ) ) ( not ( = ?auto_118536 ?auto_118538 ) ) ( not ( = ?auto_118536 ?auto_118539 ) ) ( not ( = ?auto_118536 ?auto_118540 ) ) ( not ( = ?auto_118536 ?auto_118541 ) ) ( not ( = ?auto_118536 ?auto_118542 ) ) ( not ( = ?auto_118536 ?auto_118543 ) ) ( not ( = ?auto_118537 ?auto_118538 ) ) ( not ( = ?auto_118537 ?auto_118539 ) ) ( not ( = ?auto_118537 ?auto_118540 ) ) ( not ( = ?auto_118537 ?auto_118541 ) ) ( not ( = ?auto_118537 ?auto_118542 ) ) ( not ( = ?auto_118537 ?auto_118543 ) ) ( not ( = ?auto_118538 ?auto_118539 ) ) ( not ( = ?auto_118538 ?auto_118540 ) ) ( not ( = ?auto_118538 ?auto_118541 ) ) ( not ( = ?auto_118538 ?auto_118542 ) ) ( not ( = ?auto_118538 ?auto_118543 ) ) ( not ( = ?auto_118539 ?auto_118540 ) ) ( not ( = ?auto_118539 ?auto_118541 ) ) ( not ( = ?auto_118539 ?auto_118542 ) ) ( not ( = ?auto_118539 ?auto_118543 ) ) ( not ( = ?auto_118540 ?auto_118541 ) ) ( not ( = ?auto_118540 ?auto_118542 ) ) ( not ( = ?auto_118540 ?auto_118543 ) ) ( not ( = ?auto_118541 ?auto_118542 ) ) ( not ( = ?auto_118541 ?auto_118543 ) ) ( not ( = ?auto_118542 ?auto_118543 ) ) ( CLEAR ?auto_118540 ) ( ON ?auto_118541 ?auto_118542 ) ( CLEAR ?auto_118541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_118534 ?auto_118535 ?auto_118536 ?auto_118537 ?auto_118538 ?auto_118539 ?auto_118540 ?auto_118541 )
      ( MAKE-9PILE ?auto_118534 ?auto_118535 ?auto_118536 ?auto_118537 ?auto_118538 ?auto_118539 ?auto_118540 ?auto_118541 ?auto_118542 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118553 - BLOCK
      ?auto_118554 - BLOCK
      ?auto_118555 - BLOCK
      ?auto_118556 - BLOCK
      ?auto_118557 - BLOCK
      ?auto_118558 - BLOCK
      ?auto_118559 - BLOCK
      ?auto_118560 - BLOCK
      ?auto_118561 - BLOCK
    )
    :vars
    (
      ?auto_118562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118561 ?auto_118562 ) ( ON-TABLE ?auto_118553 ) ( ON ?auto_118554 ?auto_118553 ) ( ON ?auto_118555 ?auto_118554 ) ( ON ?auto_118556 ?auto_118555 ) ( ON ?auto_118557 ?auto_118556 ) ( ON ?auto_118558 ?auto_118557 ) ( not ( = ?auto_118553 ?auto_118554 ) ) ( not ( = ?auto_118553 ?auto_118555 ) ) ( not ( = ?auto_118553 ?auto_118556 ) ) ( not ( = ?auto_118553 ?auto_118557 ) ) ( not ( = ?auto_118553 ?auto_118558 ) ) ( not ( = ?auto_118553 ?auto_118559 ) ) ( not ( = ?auto_118553 ?auto_118560 ) ) ( not ( = ?auto_118553 ?auto_118561 ) ) ( not ( = ?auto_118553 ?auto_118562 ) ) ( not ( = ?auto_118554 ?auto_118555 ) ) ( not ( = ?auto_118554 ?auto_118556 ) ) ( not ( = ?auto_118554 ?auto_118557 ) ) ( not ( = ?auto_118554 ?auto_118558 ) ) ( not ( = ?auto_118554 ?auto_118559 ) ) ( not ( = ?auto_118554 ?auto_118560 ) ) ( not ( = ?auto_118554 ?auto_118561 ) ) ( not ( = ?auto_118554 ?auto_118562 ) ) ( not ( = ?auto_118555 ?auto_118556 ) ) ( not ( = ?auto_118555 ?auto_118557 ) ) ( not ( = ?auto_118555 ?auto_118558 ) ) ( not ( = ?auto_118555 ?auto_118559 ) ) ( not ( = ?auto_118555 ?auto_118560 ) ) ( not ( = ?auto_118555 ?auto_118561 ) ) ( not ( = ?auto_118555 ?auto_118562 ) ) ( not ( = ?auto_118556 ?auto_118557 ) ) ( not ( = ?auto_118556 ?auto_118558 ) ) ( not ( = ?auto_118556 ?auto_118559 ) ) ( not ( = ?auto_118556 ?auto_118560 ) ) ( not ( = ?auto_118556 ?auto_118561 ) ) ( not ( = ?auto_118556 ?auto_118562 ) ) ( not ( = ?auto_118557 ?auto_118558 ) ) ( not ( = ?auto_118557 ?auto_118559 ) ) ( not ( = ?auto_118557 ?auto_118560 ) ) ( not ( = ?auto_118557 ?auto_118561 ) ) ( not ( = ?auto_118557 ?auto_118562 ) ) ( not ( = ?auto_118558 ?auto_118559 ) ) ( not ( = ?auto_118558 ?auto_118560 ) ) ( not ( = ?auto_118558 ?auto_118561 ) ) ( not ( = ?auto_118558 ?auto_118562 ) ) ( not ( = ?auto_118559 ?auto_118560 ) ) ( not ( = ?auto_118559 ?auto_118561 ) ) ( not ( = ?auto_118559 ?auto_118562 ) ) ( not ( = ?auto_118560 ?auto_118561 ) ) ( not ( = ?auto_118560 ?auto_118562 ) ) ( not ( = ?auto_118561 ?auto_118562 ) ) ( ON ?auto_118560 ?auto_118561 ) ( CLEAR ?auto_118558 ) ( ON ?auto_118559 ?auto_118560 ) ( CLEAR ?auto_118559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118553 ?auto_118554 ?auto_118555 ?auto_118556 ?auto_118557 ?auto_118558 ?auto_118559 )
      ( MAKE-9PILE ?auto_118553 ?auto_118554 ?auto_118555 ?auto_118556 ?auto_118557 ?auto_118558 ?auto_118559 ?auto_118560 ?auto_118561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118572 - BLOCK
      ?auto_118573 - BLOCK
      ?auto_118574 - BLOCK
      ?auto_118575 - BLOCK
      ?auto_118576 - BLOCK
      ?auto_118577 - BLOCK
      ?auto_118578 - BLOCK
      ?auto_118579 - BLOCK
      ?auto_118580 - BLOCK
    )
    :vars
    (
      ?auto_118581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118580 ?auto_118581 ) ( ON-TABLE ?auto_118572 ) ( ON ?auto_118573 ?auto_118572 ) ( ON ?auto_118574 ?auto_118573 ) ( ON ?auto_118575 ?auto_118574 ) ( ON ?auto_118576 ?auto_118575 ) ( ON ?auto_118577 ?auto_118576 ) ( not ( = ?auto_118572 ?auto_118573 ) ) ( not ( = ?auto_118572 ?auto_118574 ) ) ( not ( = ?auto_118572 ?auto_118575 ) ) ( not ( = ?auto_118572 ?auto_118576 ) ) ( not ( = ?auto_118572 ?auto_118577 ) ) ( not ( = ?auto_118572 ?auto_118578 ) ) ( not ( = ?auto_118572 ?auto_118579 ) ) ( not ( = ?auto_118572 ?auto_118580 ) ) ( not ( = ?auto_118572 ?auto_118581 ) ) ( not ( = ?auto_118573 ?auto_118574 ) ) ( not ( = ?auto_118573 ?auto_118575 ) ) ( not ( = ?auto_118573 ?auto_118576 ) ) ( not ( = ?auto_118573 ?auto_118577 ) ) ( not ( = ?auto_118573 ?auto_118578 ) ) ( not ( = ?auto_118573 ?auto_118579 ) ) ( not ( = ?auto_118573 ?auto_118580 ) ) ( not ( = ?auto_118573 ?auto_118581 ) ) ( not ( = ?auto_118574 ?auto_118575 ) ) ( not ( = ?auto_118574 ?auto_118576 ) ) ( not ( = ?auto_118574 ?auto_118577 ) ) ( not ( = ?auto_118574 ?auto_118578 ) ) ( not ( = ?auto_118574 ?auto_118579 ) ) ( not ( = ?auto_118574 ?auto_118580 ) ) ( not ( = ?auto_118574 ?auto_118581 ) ) ( not ( = ?auto_118575 ?auto_118576 ) ) ( not ( = ?auto_118575 ?auto_118577 ) ) ( not ( = ?auto_118575 ?auto_118578 ) ) ( not ( = ?auto_118575 ?auto_118579 ) ) ( not ( = ?auto_118575 ?auto_118580 ) ) ( not ( = ?auto_118575 ?auto_118581 ) ) ( not ( = ?auto_118576 ?auto_118577 ) ) ( not ( = ?auto_118576 ?auto_118578 ) ) ( not ( = ?auto_118576 ?auto_118579 ) ) ( not ( = ?auto_118576 ?auto_118580 ) ) ( not ( = ?auto_118576 ?auto_118581 ) ) ( not ( = ?auto_118577 ?auto_118578 ) ) ( not ( = ?auto_118577 ?auto_118579 ) ) ( not ( = ?auto_118577 ?auto_118580 ) ) ( not ( = ?auto_118577 ?auto_118581 ) ) ( not ( = ?auto_118578 ?auto_118579 ) ) ( not ( = ?auto_118578 ?auto_118580 ) ) ( not ( = ?auto_118578 ?auto_118581 ) ) ( not ( = ?auto_118579 ?auto_118580 ) ) ( not ( = ?auto_118579 ?auto_118581 ) ) ( not ( = ?auto_118580 ?auto_118581 ) ) ( ON ?auto_118579 ?auto_118580 ) ( CLEAR ?auto_118577 ) ( ON ?auto_118578 ?auto_118579 ) ( CLEAR ?auto_118578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118572 ?auto_118573 ?auto_118574 ?auto_118575 ?auto_118576 ?auto_118577 ?auto_118578 )
      ( MAKE-9PILE ?auto_118572 ?auto_118573 ?auto_118574 ?auto_118575 ?auto_118576 ?auto_118577 ?auto_118578 ?auto_118579 ?auto_118580 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118591 - BLOCK
      ?auto_118592 - BLOCK
      ?auto_118593 - BLOCK
      ?auto_118594 - BLOCK
      ?auto_118595 - BLOCK
      ?auto_118596 - BLOCK
      ?auto_118597 - BLOCK
      ?auto_118598 - BLOCK
      ?auto_118599 - BLOCK
    )
    :vars
    (
      ?auto_118600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118599 ?auto_118600 ) ( ON-TABLE ?auto_118591 ) ( ON ?auto_118592 ?auto_118591 ) ( ON ?auto_118593 ?auto_118592 ) ( ON ?auto_118594 ?auto_118593 ) ( ON ?auto_118595 ?auto_118594 ) ( not ( = ?auto_118591 ?auto_118592 ) ) ( not ( = ?auto_118591 ?auto_118593 ) ) ( not ( = ?auto_118591 ?auto_118594 ) ) ( not ( = ?auto_118591 ?auto_118595 ) ) ( not ( = ?auto_118591 ?auto_118596 ) ) ( not ( = ?auto_118591 ?auto_118597 ) ) ( not ( = ?auto_118591 ?auto_118598 ) ) ( not ( = ?auto_118591 ?auto_118599 ) ) ( not ( = ?auto_118591 ?auto_118600 ) ) ( not ( = ?auto_118592 ?auto_118593 ) ) ( not ( = ?auto_118592 ?auto_118594 ) ) ( not ( = ?auto_118592 ?auto_118595 ) ) ( not ( = ?auto_118592 ?auto_118596 ) ) ( not ( = ?auto_118592 ?auto_118597 ) ) ( not ( = ?auto_118592 ?auto_118598 ) ) ( not ( = ?auto_118592 ?auto_118599 ) ) ( not ( = ?auto_118592 ?auto_118600 ) ) ( not ( = ?auto_118593 ?auto_118594 ) ) ( not ( = ?auto_118593 ?auto_118595 ) ) ( not ( = ?auto_118593 ?auto_118596 ) ) ( not ( = ?auto_118593 ?auto_118597 ) ) ( not ( = ?auto_118593 ?auto_118598 ) ) ( not ( = ?auto_118593 ?auto_118599 ) ) ( not ( = ?auto_118593 ?auto_118600 ) ) ( not ( = ?auto_118594 ?auto_118595 ) ) ( not ( = ?auto_118594 ?auto_118596 ) ) ( not ( = ?auto_118594 ?auto_118597 ) ) ( not ( = ?auto_118594 ?auto_118598 ) ) ( not ( = ?auto_118594 ?auto_118599 ) ) ( not ( = ?auto_118594 ?auto_118600 ) ) ( not ( = ?auto_118595 ?auto_118596 ) ) ( not ( = ?auto_118595 ?auto_118597 ) ) ( not ( = ?auto_118595 ?auto_118598 ) ) ( not ( = ?auto_118595 ?auto_118599 ) ) ( not ( = ?auto_118595 ?auto_118600 ) ) ( not ( = ?auto_118596 ?auto_118597 ) ) ( not ( = ?auto_118596 ?auto_118598 ) ) ( not ( = ?auto_118596 ?auto_118599 ) ) ( not ( = ?auto_118596 ?auto_118600 ) ) ( not ( = ?auto_118597 ?auto_118598 ) ) ( not ( = ?auto_118597 ?auto_118599 ) ) ( not ( = ?auto_118597 ?auto_118600 ) ) ( not ( = ?auto_118598 ?auto_118599 ) ) ( not ( = ?auto_118598 ?auto_118600 ) ) ( not ( = ?auto_118599 ?auto_118600 ) ) ( ON ?auto_118598 ?auto_118599 ) ( ON ?auto_118597 ?auto_118598 ) ( CLEAR ?auto_118595 ) ( ON ?auto_118596 ?auto_118597 ) ( CLEAR ?auto_118596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118591 ?auto_118592 ?auto_118593 ?auto_118594 ?auto_118595 ?auto_118596 )
      ( MAKE-9PILE ?auto_118591 ?auto_118592 ?auto_118593 ?auto_118594 ?auto_118595 ?auto_118596 ?auto_118597 ?auto_118598 ?auto_118599 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118610 - BLOCK
      ?auto_118611 - BLOCK
      ?auto_118612 - BLOCK
      ?auto_118613 - BLOCK
      ?auto_118614 - BLOCK
      ?auto_118615 - BLOCK
      ?auto_118616 - BLOCK
      ?auto_118617 - BLOCK
      ?auto_118618 - BLOCK
    )
    :vars
    (
      ?auto_118619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118618 ?auto_118619 ) ( ON-TABLE ?auto_118610 ) ( ON ?auto_118611 ?auto_118610 ) ( ON ?auto_118612 ?auto_118611 ) ( ON ?auto_118613 ?auto_118612 ) ( ON ?auto_118614 ?auto_118613 ) ( not ( = ?auto_118610 ?auto_118611 ) ) ( not ( = ?auto_118610 ?auto_118612 ) ) ( not ( = ?auto_118610 ?auto_118613 ) ) ( not ( = ?auto_118610 ?auto_118614 ) ) ( not ( = ?auto_118610 ?auto_118615 ) ) ( not ( = ?auto_118610 ?auto_118616 ) ) ( not ( = ?auto_118610 ?auto_118617 ) ) ( not ( = ?auto_118610 ?auto_118618 ) ) ( not ( = ?auto_118610 ?auto_118619 ) ) ( not ( = ?auto_118611 ?auto_118612 ) ) ( not ( = ?auto_118611 ?auto_118613 ) ) ( not ( = ?auto_118611 ?auto_118614 ) ) ( not ( = ?auto_118611 ?auto_118615 ) ) ( not ( = ?auto_118611 ?auto_118616 ) ) ( not ( = ?auto_118611 ?auto_118617 ) ) ( not ( = ?auto_118611 ?auto_118618 ) ) ( not ( = ?auto_118611 ?auto_118619 ) ) ( not ( = ?auto_118612 ?auto_118613 ) ) ( not ( = ?auto_118612 ?auto_118614 ) ) ( not ( = ?auto_118612 ?auto_118615 ) ) ( not ( = ?auto_118612 ?auto_118616 ) ) ( not ( = ?auto_118612 ?auto_118617 ) ) ( not ( = ?auto_118612 ?auto_118618 ) ) ( not ( = ?auto_118612 ?auto_118619 ) ) ( not ( = ?auto_118613 ?auto_118614 ) ) ( not ( = ?auto_118613 ?auto_118615 ) ) ( not ( = ?auto_118613 ?auto_118616 ) ) ( not ( = ?auto_118613 ?auto_118617 ) ) ( not ( = ?auto_118613 ?auto_118618 ) ) ( not ( = ?auto_118613 ?auto_118619 ) ) ( not ( = ?auto_118614 ?auto_118615 ) ) ( not ( = ?auto_118614 ?auto_118616 ) ) ( not ( = ?auto_118614 ?auto_118617 ) ) ( not ( = ?auto_118614 ?auto_118618 ) ) ( not ( = ?auto_118614 ?auto_118619 ) ) ( not ( = ?auto_118615 ?auto_118616 ) ) ( not ( = ?auto_118615 ?auto_118617 ) ) ( not ( = ?auto_118615 ?auto_118618 ) ) ( not ( = ?auto_118615 ?auto_118619 ) ) ( not ( = ?auto_118616 ?auto_118617 ) ) ( not ( = ?auto_118616 ?auto_118618 ) ) ( not ( = ?auto_118616 ?auto_118619 ) ) ( not ( = ?auto_118617 ?auto_118618 ) ) ( not ( = ?auto_118617 ?auto_118619 ) ) ( not ( = ?auto_118618 ?auto_118619 ) ) ( ON ?auto_118617 ?auto_118618 ) ( ON ?auto_118616 ?auto_118617 ) ( CLEAR ?auto_118614 ) ( ON ?auto_118615 ?auto_118616 ) ( CLEAR ?auto_118615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118610 ?auto_118611 ?auto_118612 ?auto_118613 ?auto_118614 ?auto_118615 )
      ( MAKE-9PILE ?auto_118610 ?auto_118611 ?auto_118612 ?auto_118613 ?auto_118614 ?auto_118615 ?auto_118616 ?auto_118617 ?auto_118618 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118629 - BLOCK
      ?auto_118630 - BLOCK
      ?auto_118631 - BLOCK
      ?auto_118632 - BLOCK
      ?auto_118633 - BLOCK
      ?auto_118634 - BLOCK
      ?auto_118635 - BLOCK
      ?auto_118636 - BLOCK
      ?auto_118637 - BLOCK
    )
    :vars
    (
      ?auto_118638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118637 ?auto_118638 ) ( ON-TABLE ?auto_118629 ) ( ON ?auto_118630 ?auto_118629 ) ( ON ?auto_118631 ?auto_118630 ) ( ON ?auto_118632 ?auto_118631 ) ( not ( = ?auto_118629 ?auto_118630 ) ) ( not ( = ?auto_118629 ?auto_118631 ) ) ( not ( = ?auto_118629 ?auto_118632 ) ) ( not ( = ?auto_118629 ?auto_118633 ) ) ( not ( = ?auto_118629 ?auto_118634 ) ) ( not ( = ?auto_118629 ?auto_118635 ) ) ( not ( = ?auto_118629 ?auto_118636 ) ) ( not ( = ?auto_118629 ?auto_118637 ) ) ( not ( = ?auto_118629 ?auto_118638 ) ) ( not ( = ?auto_118630 ?auto_118631 ) ) ( not ( = ?auto_118630 ?auto_118632 ) ) ( not ( = ?auto_118630 ?auto_118633 ) ) ( not ( = ?auto_118630 ?auto_118634 ) ) ( not ( = ?auto_118630 ?auto_118635 ) ) ( not ( = ?auto_118630 ?auto_118636 ) ) ( not ( = ?auto_118630 ?auto_118637 ) ) ( not ( = ?auto_118630 ?auto_118638 ) ) ( not ( = ?auto_118631 ?auto_118632 ) ) ( not ( = ?auto_118631 ?auto_118633 ) ) ( not ( = ?auto_118631 ?auto_118634 ) ) ( not ( = ?auto_118631 ?auto_118635 ) ) ( not ( = ?auto_118631 ?auto_118636 ) ) ( not ( = ?auto_118631 ?auto_118637 ) ) ( not ( = ?auto_118631 ?auto_118638 ) ) ( not ( = ?auto_118632 ?auto_118633 ) ) ( not ( = ?auto_118632 ?auto_118634 ) ) ( not ( = ?auto_118632 ?auto_118635 ) ) ( not ( = ?auto_118632 ?auto_118636 ) ) ( not ( = ?auto_118632 ?auto_118637 ) ) ( not ( = ?auto_118632 ?auto_118638 ) ) ( not ( = ?auto_118633 ?auto_118634 ) ) ( not ( = ?auto_118633 ?auto_118635 ) ) ( not ( = ?auto_118633 ?auto_118636 ) ) ( not ( = ?auto_118633 ?auto_118637 ) ) ( not ( = ?auto_118633 ?auto_118638 ) ) ( not ( = ?auto_118634 ?auto_118635 ) ) ( not ( = ?auto_118634 ?auto_118636 ) ) ( not ( = ?auto_118634 ?auto_118637 ) ) ( not ( = ?auto_118634 ?auto_118638 ) ) ( not ( = ?auto_118635 ?auto_118636 ) ) ( not ( = ?auto_118635 ?auto_118637 ) ) ( not ( = ?auto_118635 ?auto_118638 ) ) ( not ( = ?auto_118636 ?auto_118637 ) ) ( not ( = ?auto_118636 ?auto_118638 ) ) ( not ( = ?auto_118637 ?auto_118638 ) ) ( ON ?auto_118636 ?auto_118637 ) ( ON ?auto_118635 ?auto_118636 ) ( ON ?auto_118634 ?auto_118635 ) ( CLEAR ?auto_118632 ) ( ON ?auto_118633 ?auto_118634 ) ( CLEAR ?auto_118633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118629 ?auto_118630 ?auto_118631 ?auto_118632 ?auto_118633 )
      ( MAKE-9PILE ?auto_118629 ?auto_118630 ?auto_118631 ?auto_118632 ?auto_118633 ?auto_118634 ?auto_118635 ?auto_118636 ?auto_118637 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118648 - BLOCK
      ?auto_118649 - BLOCK
      ?auto_118650 - BLOCK
      ?auto_118651 - BLOCK
      ?auto_118652 - BLOCK
      ?auto_118653 - BLOCK
      ?auto_118654 - BLOCK
      ?auto_118655 - BLOCK
      ?auto_118656 - BLOCK
    )
    :vars
    (
      ?auto_118657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118656 ?auto_118657 ) ( ON-TABLE ?auto_118648 ) ( ON ?auto_118649 ?auto_118648 ) ( ON ?auto_118650 ?auto_118649 ) ( ON ?auto_118651 ?auto_118650 ) ( not ( = ?auto_118648 ?auto_118649 ) ) ( not ( = ?auto_118648 ?auto_118650 ) ) ( not ( = ?auto_118648 ?auto_118651 ) ) ( not ( = ?auto_118648 ?auto_118652 ) ) ( not ( = ?auto_118648 ?auto_118653 ) ) ( not ( = ?auto_118648 ?auto_118654 ) ) ( not ( = ?auto_118648 ?auto_118655 ) ) ( not ( = ?auto_118648 ?auto_118656 ) ) ( not ( = ?auto_118648 ?auto_118657 ) ) ( not ( = ?auto_118649 ?auto_118650 ) ) ( not ( = ?auto_118649 ?auto_118651 ) ) ( not ( = ?auto_118649 ?auto_118652 ) ) ( not ( = ?auto_118649 ?auto_118653 ) ) ( not ( = ?auto_118649 ?auto_118654 ) ) ( not ( = ?auto_118649 ?auto_118655 ) ) ( not ( = ?auto_118649 ?auto_118656 ) ) ( not ( = ?auto_118649 ?auto_118657 ) ) ( not ( = ?auto_118650 ?auto_118651 ) ) ( not ( = ?auto_118650 ?auto_118652 ) ) ( not ( = ?auto_118650 ?auto_118653 ) ) ( not ( = ?auto_118650 ?auto_118654 ) ) ( not ( = ?auto_118650 ?auto_118655 ) ) ( not ( = ?auto_118650 ?auto_118656 ) ) ( not ( = ?auto_118650 ?auto_118657 ) ) ( not ( = ?auto_118651 ?auto_118652 ) ) ( not ( = ?auto_118651 ?auto_118653 ) ) ( not ( = ?auto_118651 ?auto_118654 ) ) ( not ( = ?auto_118651 ?auto_118655 ) ) ( not ( = ?auto_118651 ?auto_118656 ) ) ( not ( = ?auto_118651 ?auto_118657 ) ) ( not ( = ?auto_118652 ?auto_118653 ) ) ( not ( = ?auto_118652 ?auto_118654 ) ) ( not ( = ?auto_118652 ?auto_118655 ) ) ( not ( = ?auto_118652 ?auto_118656 ) ) ( not ( = ?auto_118652 ?auto_118657 ) ) ( not ( = ?auto_118653 ?auto_118654 ) ) ( not ( = ?auto_118653 ?auto_118655 ) ) ( not ( = ?auto_118653 ?auto_118656 ) ) ( not ( = ?auto_118653 ?auto_118657 ) ) ( not ( = ?auto_118654 ?auto_118655 ) ) ( not ( = ?auto_118654 ?auto_118656 ) ) ( not ( = ?auto_118654 ?auto_118657 ) ) ( not ( = ?auto_118655 ?auto_118656 ) ) ( not ( = ?auto_118655 ?auto_118657 ) ) ( not ( = ?auto_118656 ?auto_118657 ) ) ( ON ?auto_118655 ?auto_118656 ) ( ON ?auto_118654 ?auto_118655 ) ( ON ?auto_118653 ?auto_118654 ) ( CLEAR ?auto_118651 ) ( ON ?auto_118652 ?auto_118653 ) ( CLEAR ?auto_118652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_118648 ?auto_118649 ?auto_118650 ?auto_118651 ?auto_118652 )
      ( MAKE-9PILE ?auto_118648 ?auto_118649 ?auto_118650 ?auto_118651 ?auto_118652 ?auto_118653 ?auto_118654 ?auto_118655 ?auto_118656 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118667 - BLOCK
      ?auto_118668 - BLOCK
      ?auto_118669 - BLOCK
      ?auto_118670 - BLOCK
      ?auto_118671 - BLOCK
      ?auto_118672 - BLOCK
      ?auto_118673 - BLOCK
      ?auto_118674 - BLOCK
      ?auto_118675 - BLOCK
    )
    :vars
    (
      ?auto_118676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118675 ?auto_118676 ) ( ON-TABLE ?auto_118667 ) ( ON ?auto_118668 ?auto_118667 ) ( ON ?auto_118669 ?auto_118668 ) ( not ( = ?auto_118667 ?auto_118668 ) ) ( not ( = ?auto_118667 ?auto_118669 ) ) ( not ( = ?auto_118667 ?auto_118670 ) ) ( not ( = ?auto_118667 ?auto_118671 ) ) ( not ( = ?auto_118667 ?auto_118672 ) ) ( not ( = ?auto_118667 ?auto_118673 ) ) ( not ( = ?auto_118667 ?auto_118674 ) ) ( not ( = ?auto_118667 ?auto_118675 ) ) ( not ( = ?auto_118667 ?auto_118676 ) ) ( not ( = ?auto_118668 ?auto_118669 ) ) ( not ( = ?auto_118668 ?auto_118670 ) ) ( not ( = ?auto_118668 ?auto_118671 ) ) ( not ( = ?auto_118668 ?auto_118672 ) ) ( not ( = ?auto_118668 ?auto_118673 ) ) ( not ( = ?auto_118668 ?auto_118674 ) ) ( not ( = ?auto_118668 ?auto_118675 ) ) ( not ( = ?auto_118668 ?auto_118676 ) ) ( not ( = ?auto_118669 ?auto_118670 ) ) ( not ( = ?auto_118669 ?auto_118671 ) ) ( not ( = ?auto_118669 ?auto_118672 ) ) ( not ( = ?auto_118669 ?auto_118673 ) ) ( not ( = ?auto_118669 ?auto_118674 ) ) ( not ( = ?auto_118669 ?auto_118675 ) ) ( not ( = ?auto_118669 ?auto_118676 ) ) ( not ( = ?auto_118670 ?auto_118671 ) ) ( not ( = ?auto_118670 ?auto_118672 ) ) ( not ( = ?auto_118670 ?auto_118673 ) ) ( not ( = ?auto_118670 ?auto_118674 ) ) ( not ( = ?auto_118670 ?auto_118675 ) ) ( not ( = ?auto_118670 ?auto_118676 ) ) ( not ( = ?auto_118671 ?auto_118672 ) ) ( not ( = ?auto_118671 ?auto_118673 ) ) ( not ( = ?auto_118671 ?auto_118674 ) ) ( not ( = ?auto_118671 ?auto_118675 ) ) ( not ( = ?auto_118671 ?auto_118676 ) ) ( not ( = ?auto_118672 ?auto_118673 ) ) ( not ( = ?auto_118672 ?auto_118674 ) ) ( not ( = ?auto_118672 ?auto_118675 ) ) ( not ( = ?auto_118672 ?auto_118676 ) ) ( not ( = ?auto_118673 ?auto_118674 ) ) ( not ( = ?auto_118673 ?auto_118675 ) ) ( not ( = ?auto_118673 ?auto_118676 ) ) ( not ( = ?auto_118674 ?auto_118675 ) ) ( not ( = ?auto_118674 ?auto_118676 ) ) ( not ( = ?auto_118675 ?auto_118676 ) ) ( ON ?auto_118674 ?auto_118675 ) ( ON ?auto_118673 ?auto_118674 ) ( ON ?auto_118672 ?auto_118673 ) ( ON ?auto_118671 ?auto_118672 ) ( CLEAR ?auto_118669 ) ( ON ?auto_118670 ?auto_118671 ) ( CLEAR ?auto_118670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118667 ?auto_118668 ?auto_118669 ?auto_118670 )
      ( MAKE-9PILE ?auto_118667 ?auto_118668 ?auto_118669 ?auto_118670 ?auto_118671 ?auto_118672 ?auto_118673 ?auto_118674 ?auto_118675 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118686 - BLOCK
      ?auto_118687 - BLOCK
      ?auto_118688 - BLOCK
      ?auto_118689 - BLOCK
      ?auto_118690 - BLOCK
      ?auto_118691 - BLOCK
      ?auto_118692 - BLOCK
      ?auto_118693 - BLOCK
      ?auto_118694 - BLOCK
    )
    :vars
    (
      ?auto_118695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118694 ?auto_118695 ) ( ON-TABLE ?auto_118686 ) ( ON ?auto_118687 ?auto_118686 ) ( ON ?auto_118688 ?auto_118687 ) ( not ( = ?auto_118686 ?auto_118687 ) ) ( not ( = ?auto_118686 ?auto_118688 ) ) ( not ( = ?auto_118686 ?auto_118689 ) ) ( not ( = ?auto_118686 ?auto_118690 ) ) ( not ( = ?auto_118686 ?auto_118691 ) ) ( not ( = ?auto_118686 ?auto_118692 ) ) ( not ( = ?auto_118686 ?auto_118693 ) ) ( not ( = ?auto_118686 ?auto_118694 ) ) ( not ( = ?auto_118686 ?auto_118695 ) ) ( not ( = ?auto_118687 ?auto_118688 ) ) ( not ( = ?auto_118687 ?auto_118689 ) ) ( not ( = ?auto_118687 ?auto_118690 ) ) ( not ( = ?auto_118687 ?auto_118691 ) ) ( not ( = ?auto_118687 ?auto_118692 ) ) ( not ( = ?auto_118687 ?auto_118693 ) ) ( not ( = ?auto_118687 ?auto_118694 ) ) ( not ( = ?auto_118687 ?auto_118695 ) ) ( not ( = ?auto_118688 ?auto_118689 ) ) ( not ( = ?auto_118688 ?auto_118690 ) ) ( not ( = ?auto_118688 ?auto_118691 ) ) ( not ( = ?auto_118688 ?auto_118692 ) ) ( not ( = ?auto_118688 ?auto_118693 ) ) ( not ( = ?auto_118688 ?auto_118694 ) ) ( not ( = ?auto_118688 ?auto_118695 ) ) ( not ( = ?auto_118689 ?auto_118690 ) ) ( not ( = ?auto_118689 ?auto_118691 ) ) ( not ( = ?auto_118689 ?auto_118692 ) ) ( not ( = ?auto_118689 ?auto_118693 ) ) ( not ( = ?auto_118689 ?auto_118694 ) ) ( not ( = ?auto_118689 ?auto_118695 ) ) ( not ( = ?auto_118690 ?auto_118691 ) ) ( not ( = ?auto_118690 ?auto_118692 ) ) ( not ( = ?auto_118690 ?auto_118693 ) ) ( not ( = ?auto_118690 ?auto_118694 ) ) ( not ( = ?auto_118690 ?auto_118695 ) ) ( not ( = ?auto_118691 ?auto_118692 ) ) ( not ( = ?auto_118691 ?auto_118693 ) ) ( not ( = ?auto_118691 ?auto_118694 ) ) ( not ( = ?auto_118691 ?auto_118695 ) ) ( not ( = ?auto_118692 ?auto_118693 ) ) ( not ( = ?auto_118692 ?auto_118694 ) ) ( not ( = ?auto_118692 ?auto_118695 ) ) ( not ( = ?auto_118693 ?auto_118694 ) ) ( not ( = ?auto_118693 ?auto_118695 ) ) ( not ( = ?auto_118694 ?auto_118695 ) ) ( ON ?auto_118693 ?auto_118694 ) ( ON ?auto_118692 ?auto_118693 ) ( ON ?auto_118691 ?auto_118692 ) ( ON ?auto_118690 ?auto_118691 ) ( CLEAR ?auto_118688 ) ( ON ?auto_118689 ?auto_118690 ) ( CLEAR ?auto_118689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_118686 ?auto_118687 ?auto_118688 ?auto_118689 )
      ( MAKE-9PILE ?auto_118686 ?auto_118687 ?auto_118688 ?auto_118689 ?auto_118690 ?auto_118691 ?auto_118692 ?auto_118693 ?auto_118694 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118705 - BLOCK
      ?auto_118706 - BLOCK
      ?auto_118707 - BLOCK
      ?auto_118708 - BLOCK
      ?auto_118709 - BLOCK
      ?auto_118710 - BLOCK
      ?auto_118711 - BLOCK
      ?auto_118712 - BLOCK
      ?auto_118713 - BLOCK
    )
    :vars
    (
      ?auto_118714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118713 ?auto_118714 ) ( ON-TABLE ?auto_118705 ) ( ON ?auto_118706 ?auto_118705 ) ( not ( = ?auto_118705 ?auto_118706 ) ) ( not ( = ?auto_118705 ?auto_118707 ) ) ( not ( = ?auto_118705 ?auto_118708 ) ) ( not ( = ?auto_118705 ?auto_118709 ) ) ( not ( = ?auto_118705 ?auto_118710 ) ) ( not ( = ?auto_118705 ?auto_118711 ) ) ( not ( = ?auto_118705 ?auto_118712 ) ) ( not ( = ?auto_118705 ?auto_118713 ) ) ( not ( = ?auto_118705 ?auto_118714 ) ) ( not ( = ?auto_118706 ?auto_118707 ) ) ( not ( = ?auto_118706 ?auto_118708 ) ) ( not ( = ?auto_118706 ?auto_118709 ) ) ( not ( = ?auto_118706 ?auto_118710 ) ) ( not ( = ?auto_118706 ?auto_118711 ) ) ( not ( = ?auto_118706 ?auto_118712 ) ) ( not ( = ?auto_118706 ?auto_118713 ) ) ( not ( = ?auto_118706 ?auto_118714 ) ) ( not ( = ?auto_118707 ?auto_118708 ) ) ( not ( = ?auto_118707 ?auto_118709 ) ) ( not ( = ?auto_118707 ?auto_118710 ) ) ( not ( = ?auto_118707 ?auto_118711 ) ) ( not ( = ?auto_118707 ?auto_118712 ) ) ( not ( = ?auto_118707 ?auto_118713 ) ) ( not ( = ?auto_118707 ?auto_118714 ) ) ( not ( = ?auto_118708 ?auto_118709 ) ) ( not ( = ?auto_118708 ?auto_118710 ) ) ( not ( = ?auto_118708 ?auto_118711 ) ) ( not ( = ?auto_118708 ?auto_118712 ) ) ( not ( = ?auto_118708 ?auto_118713 ) ) ( not ( = ?auto_118708 ?auto_118714 ) ) ( not ( = ?auto_118709 ?auto_118710 ) ) ( not ( = ?auto_118709 ?auto_118711 ) ) ( not ( = ?auto_118709 ?auto_118712 ) ) ( not ( = ?auto_118709 ?auto_118713 ) ) ( not ( = ?auto_118709 ?auto_118714 ) ) ( not ( = ?auto_118710 ?auto_118711 ) ) ( not ( = ?auto_118710 ?auto_118712 ) ) ( not ( = ?auto_118710 ?auto_118713 ) ) ( not ( = ?auto_118710 ?auto_118714 ) ) ( not ( = ?auto_118711 ?auto_118712 ) ) ( not ( = ?auto_118711 ?auto_118713 ) ) ( not ( = ?auto_118711 ?auto_118714 ) ) ( not ( = ?auto_118712 ?auto_118713 ) ) ( not ( = ?auto_118712 ?auto_118714 ) ) ( not ( = ?auto_118713 ?auto_118714 ) ) ( ON ?auto_118712 ?auto_118713 ) ( ON ?auto_118711 ?auto_118712 ) ( ON ?auto_118710 ?auto_118711 ) ( ON ?auto_118709 ?auto_118710 ) ( ON ?auto_118708 ?auto_118709 ) ( CLEAR ?auto_118706 ) ( ON ?auto_118707 ?auto_118708 ) ( CLEAR ?auto_118707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118705 ?auto_118706 ?auto_118707 )
      ( MAKE-9PILE ?auto_118705 ?auto_118706 ?auto_118707 ?auto_118708 ?auto_118709 ?auto_118710 ?auto_118711 ?auto_118712 ?auto_118713 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118724 - BLOCK
      ?auto_118725 - BLOCK
      ?auto_118726 - BLOCK
      ?auto_118727 - BLOCK
      ?auto_118728 - BLOCK
      ?auto_118729 - BLOCK
      ?auto_118730 - BLOCK
      ?auto_118731 - BLOCK
      ?auto_118732 - BLOCK
    )
    :vars
    (
      ?auto_118733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118732 ?auto_118733 ) ( ON-TABLE ?auto_118724 ) ( ON ?auto_118725 ?auto_118724 ) ( not ( = ?auto_118724 ?auto_118725 ) ) ( not ( = ?auto_118724 ?auto_118726 ) ) ( not ( = ?auto_118724 ?auto_118727 ) ) ( not ( = ?auto_118724 ?auto_118728 ) ) ( not ( = ?auto_118724 ?auto_118729 ) ) ( not ( = ?auto_118724 ?auto_118730 ) ) ( not ( = ?auto_118724 ?auto_118731 ) ) ( not ( = ?auto_118724 ?auto_118732 ) ) ( not ( = ?auto_118724 ?auto_118733 ) ) ( not ( = ?auto_118725 ?auto_118726 ) ) ( not ( = ?auto_118725 ?auto_118727 ) ) ( not ( = ?auto_118725 ?auto_118728 ) ) ( not ( = ?auto_118725 ?auto_118729 ) ) ( not ( = ?auto_118725 ?auto_118730 ) ) ( not ( = ?auto_118725 ?auto_118731 ) ) ( not ( = ?auto_118725 ?auto_118732 ) ) ( not ( = ?auto_118725 ?auto_118733 ) ) ( not ( = ?auto_118726 ?auto_118727 ) ) ( not ( = ?auto_118726 ?auto_118728 ) ) ( not ( = ?auto_118726 ?auto_118729 ) ) ( not ( = ?auto_118726 ?auto_118730 ) ) ( not ( = ?auto_118726 ?auto_118731 ) ) ( not ( = ?auto_118726 ?auto_118732 ) ) ( not ( = ?auto_118726 ?auto_118733 ) ) ( not ( = ?auto_118727 ?auto_118728 ) ) ( not ( = ?auto_118727 ?auto_118729 ) ) ( not ( = ?auto_118727 ?auto_118730 ) ) ( not ( = ?auto_118727 ?auto_118731 ) ) ( not ( = ?auto_118727 ?auto_118732 ) ) ( not ( = ?auto_118727 ?auto_118733 ) ) ( not ( = ?auto_118728 ?auto_118729 ) ) ( not ( = ?auto_118728 ?auto_118730 ) ) ( not ( = ?auto_118728 ?auto_118731 ) ) ( not ( = ?auto_118728 ?auto_118732 ) ) ( not ( = ?auto_118728 ?auto_118733 ) ) ( not ( = ?auto_118729 ?auto_118730 ) ) ( not ( = ?auto_118729 ?auto_118731 ) ) ( not ( = ?auto_118729 ?auto_118732 ) ) ( not ( = ?auto_118729 ?auto_118733 ) ) ( not ( = ?auto_118730 ?auto_118731 ) ) ( not ( = ?auto_118730 ?auto_118732 ) ) ( not ( = ?auto_118730 ?auto_118733 ) ) ( not ( = ?auto_118731 ?auto_118732 ) ) ( not ( = ?auto_118731 ?auto_118733 ) ) ( not ( = ?auto_118732 ?auto_118733 ) ) ( ON ?auto_118731 ?auto_118732 ) ( ON ?auto_118730 ?auto_118731 ) ( ON ?auto_118729 ?auto_118730 ) ( ON ?auto_118728 ?auto_118729 ) ( ON ?auto_118727 ?auto_118728 ) ( CLEAR ?auto_118725 ) ( ON ?auto_118726 ?auto_118727 ) ( CLEAR ?auto_118726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_118724 ?auto_118725 ?auto_118726 )
      ( MAKE-9PILE ?auto_118724 ?auto_118725 ?auto_118726 ?auto_118727 ?auto_118728 ?auto_118729 ?auto_118730 ?auto_118731 ?auto_118732 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118743 - BLOCK
      ?auto_118744 - BLOCK
      ?auto_118745 - BLOCK
      ?auto_118746 - BLOCK
      ?auto_118747 - BLOCK
      ?auto_118748 - BLOCK
      ?auto_118749 - BLOCK
      ?auto_118750 - BLOCK
      ?auto_118751 - BLOCK
    )
    :vars
    (
      ?auto_118752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118751 ?auto_118752 ) ( ON-TABLE ?auto_118743 ) ( not ( = ?auto_118743 ?auto_118744 ) ) ( not ( = ?auto_118743 ?auto_118745 ) ) ( not ( = ?auto_118743 ?auto_118746 ) ) ( not ( = ?auto_118743 ?auto_118747 ) ) ( not ( = ?auto_118743 ?auto_118748 ) ) ( not ( = ?auto_118743 ?auto_118749 ) ) ( not ( = ?auto_118743 ?auto_118750 ) ) ( not ( = ?auto_118743 ?auto_118751 ) ) ( not ( = ?auto_118743 ?auto_118752 ) ) ( not ( = ?auto_118744 ?auto_118745 ) ) ( not ( = ?auto_118744 ?auto_118746 ) ) ( not ( = ?auto_118744 ?auto_118747 ) ) ( not ( = ?auto_118744 ?auto_118748 ) ) ( not ( = ?auto_118744 ?auto_118749 ) ) ( not ( = ?auto_118744 ?auto_118750 ) ) ( not ( = ?auto_118744 ?auto_118751 ) ) ( not ( = ?auto_118744 ?auto_118752 ) ) ( not ( = ?auto_118745 ?auto_118746 ) ) ( not ( = ?auto_118745 ?auto_118747 ) ) ( not ( = ?auto_118745 ?auto_118748 ) ) ( not ( = ?auto_118745 ?auto_118749 ) ) ( not ( = ?auto_118745 ?auto_118750 ) ) ( not ( = ?auto_118745 ?auto_118751 ) ) ( not ( = ?auto_118745 ?auto_118752 ) ) ( not ( = ?auto_118746 ?auto_118747 ) ) ( not ( = ?auto_118746 ?auto_118748 ) ) ( not ( = ?auto_118746 ?auto_118749 ) ) ( not ( = ?auto_118746 ?auto_118750 ) ) ( not ( = ?auto_118746 ?auto_118751 ) ) ( not ( = ?auto_118746 ?auto_118752 ) ) ( not ( = ?auto_118747 ?auto_118748 ) ) ( not ( = ?auto_118747 ?auto_118749 ) ) ( not ( = ?auto_118747 ?auto_118750 ) ) ( not ( = ?auto_118747 ?auto_118751 ) ) ( not ( = ?auto_118747 ?auto_118752 ) ) ( not ( = ?auto_118748 ?auto_118749 ) ) ( not ( = ?auto_118748 ?auto_118750 ) ) ( not ( = ?auto_118748 ?auto_118751 ) ) ( not ( = ?auto_118748 ?auto_118752 ) ) ( not ( = ?auto_118749 ?auto_118750 ) ) ( not ( = ?auto_118749 ?auto_118751 ) ) ( not ( = ?auto_118749 ?auto_118752 ) ) ( not ( = ?auto_118750 ?auto_118751 ) ) ( not ( = ?auto_118750 ?auto_118752 ) ) ( not ( = ?auto_118751 ?auto_118752 ) ) ( ON ?auto_118750 ?auto_118751 ) ( ON ?auto_118749 ?auto_118750 ) ( ON ?auto_118748 ?auto_118749 ) ( ON ?auto_118747 ?auto_118748 ) ( ON ?auto_118746 ?auto_118747 ) ( ON ?auto_118745 ?auto_118746 ) ( CLEAR ?auto_118743 ) ( ON ?auto_118744 ?auto_118745 ) ( CLEAR ?auto_118744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118743 ?auto_118744 )
      ( MAKE-9PILE ?auto_118743 ?auto_118744 ?auto_118745 ?auto_118746 ?auto_118747 ?auto_118748 ?auto_118749 ?auto_118750 ?auto_118751 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118762 - BLOCK
      ?auto_118763 - BLOCK
      ?auto_118764 - BLOCK
      ?auto_118765 - BLOCK
      ?auto_118766 - BLOCK
      ?auto_118767 - BLOCK
      ?auto_118768 - BLOCK
      ?auto_118769 - BLOCK
      ?auto_118770 - BLOCK
    )
    :vars
    (
      ?auto_118771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118770 ?auto_118771 ) ( ON-TABLE ?auto_118762 ) ( not ( = ?auto_118762 ?auto_118763 ) ) ( not ( = ?auto_118762 ?auto_118764 ) ) ( not ( = ?auto_118762 ?auto_118765 ) ) ( not ( = ?auto_118762 ?auto_118766 ) ) ( not ( = ?auto_118762 ?auto_118767 ) ) ( not ( = ?auto_118762 ?auto_118768 ) ) ( not ( = ?auto_118762 ?auto_118769 ) ) ( not ( = ?auto_118762 ?auto_118770 ) ) ( not ( = ?auto_118762 ?auto_118771 ) ) ( not ( = ?auto_118763 ?auto_118764 ) ) ( not ( = ?auto_118763 ?auto_118765 ) ) ( not ( = ?auto_118763 ?auto_118766 ) ) ( not ( = ?auto_118763 ?auto_118767 ) ) ( not ( = ?auto_118763 ?auto_118768 ) ) ( not ( = ?auto_118763 ?auto_118769 ) ) ( not ( = ?auto_118763 ?auto_118770 ) ) ( not ( = ?auto_118763 ?auto_118771 ) ) ( not ( = ?auto_118764 ?auto_118765 ) ) ( not ( = ?auto_118764 ?auto_118766 ) ) ( not ( = ?auto_118764 ?auto_118767 ) ) ( not ( = ?auto_118764 ?auto_118768 ) ) ( not ( = ?auto_118764 ?auto_118769 ) ) ( not ( = ?auto_118764 ?auto_118770 ) ) ( not ( = ?auto_118764 ?auto_118771 ) ) ( not ( = ?auto_118765 ?auto_118766 ) ) ( not ( = ?auto_118765 ?auto_118767 ) ) ( not ( = ?auto_118765 ?auto_118768 ) ) ( not ( = ?auto_118765 ?auto_118769 ) ) ( not ( = ?auto_118765 ?auto_118770 ) ) ( not ( = ?auto_118765 ?auto_118771 ) ) ( not ( = ?auto_118766 ?auto_118767 ) ) ( not ( = ?auto_118766 ?auto_118768 ) ) ( not ( = ?auto_118766 ?auto_118769 ) ) ( not ( = ?auto_118766 ?auto_118770 ) ) ( not ( = ?auto_118766 ?auto_118771 ) ) ( not ( = ?auto_118767 ?auto_118768 ) ) ( not ( = ?auto_118767 ?auto_118769 ) ) ( not ( = ?auto_118767 ?auto_118770 ) ) ( not ( = ?auto_118767 ?auto_118771 ) ) ( not ( = ?auto_118768 ?auto_118769 ) ) ( not ( = ?auto_118768 ?auto_118770 ) ) ( not ( = ?auto_118768 ?auto_118771 ) ) ( not ( = ?auto_118769 ?auto_118770 ) ) ( not ( = ?auto_118769 ?auto_118771 ) ) ( not ( = ?auto_118770 ?auto_118771 ) ) ( ON ?auto_118769 ?auto_118770 ) ( ON ?auto_118768 ?auto_118769 ) ( ON ?auto_118767 ?auto_118768 ) ( ON ?auto_118766 ?auto_118767 ) ( ON ?auto_118765 ?auto_118766 ) ( ON ?auto_118764 ?auto_118765 ) ( CLEAR ?auto_118762 ) ( ON ?auto_118763 ?auto_118764 ) ( CLEAR ?auto_118763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_118762 ?auto_118763 )
      ( MAKE-9PILE ?auto_118762 ?auto_118763 ?auto_118764 ?auto_118765 ?auto_118766 ?auto_118767 ?auto_118768 ?auto_118769 ?auto_118770 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118781 - BLOCK
      ?auto_118782 - BLOCK
      ?auto_118783 - BLOCK
      ?auto_118784 - BLOCK
      ?auto_118785 - BLOCK
      ?auto_118786 - BLOCK
      ?auto_118787 - BLOCK
      ?auto_118788 - BLOCK
      ?auto_118789 - BLOCK
    )
    :vars
    (
      ?auto_118790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118789 ?auto_118790 ) ( not ( = ?auto_118781 ?auto_118782 ) ) ( not ( = ?auto_118781 ?auto_118783 ) ) ( not ( = ?auto_118781 ?auto_118784 ) ) ( not ( = ?auto_118781 ?auto_118785 ) ) ( not ( = ?auto_118781 ?auto_118786 ) ) ( not ( = ?auto_118781 ?auto_118787 ) ) ( not ( = ?auto_118781 ?auto_118788 ) ) ( not ( = ?auto_118781 ?auto_118789 ) ) ( not ( = ?auto_118781 ?auto_118790 ) ) ( not ( = ?auto_118782 ?auto_118783 ) ) ( not ( = ?auto_118782 ?auto_118784 ) ) ( not ( = ?auto_118782 ?auto_118785 ) ) ( not ( = ?auto_118782 ?auto_118786 ) ) ( not ( = ?auto_118782 ?auto_118787 ) ) ( not ( = ?auto_118782 ?auto_118788 ) ) ( not ( = ?auto_118782 ?auto_118789 ) ) ( not ( = ?auto_118782 ?auto_118790 ) ) ( not ( = ?auto_118783 ?auto_118784 ) ) ( not ( = ?auto_118783 ?auto_118785 ) ) ( not ( = ?auto_118783 ?auto_118786 ) ) ( not ( = ?auto_118783 ?auto_118787 ) ) ( not ( = ?auto_118783 ?auto_118788 ) ) ( not ( = ?auto_118783 ?auto_118789 ) ) ( not ( = ?auto_118783 ?auto_118790 ) ) ( not ( = ?auto_118784 ?auto_118785 ) ) ( not ( = ?auto_118784 ?auto_118786 ) ) ( not ( = ?auto_118784 ?auto_118787 ) ) ( not ( = ?auto_118784 ?auto_118788 ) ) ( not ( = ?auto_118784 ?auto_118789 ) ) ( not ( = ?auto_118784 ?auto_118790 ) ) ( not ( = ?auto_118785 ?auto_118786 ) ) ( not ( = ?auto_118785 ?auto_118787 ) ) ( not ( = ?auto_118785 ?auto_118788 ) ) ( not ( = ?auto_118785 ?auto_118789 ) ) ( not ( = ?auto_118785 ?auto_118790 ) ) ( not ( = ?auto_118786 ?auto_118787 ) ) ( not ( = ?auto_118786 ?auto_118788 ) ) ( not ( = ?auto_118786 ?auto_118789 ) ) ( not ( = ?auto_118786 ?auto_118790 ) ) ( not ( = ?auto_118787 ?auto_118788 ) ) ( not ( = ?auto_118787 ?auto_118789 ) ) ( not ( = ?auto_118787 ?auto_118790 ) ) ( not ( = ?auto_118788 ?auto_118789 ) ) ( not ( = ?auto_118788 ?auto_118790 ) ) ( not ( = ?auto_118789 ?auto_118790 ) ) ( ON ?auto_118788 ?auto_118789 ) ( ON ?auto_118787 ?auto_118788 ) ( ON ?auto_118786 ?auto_118787 ) ( ON ?auto_118785 ?auto_118786 ) ( ON ?auto_118784 ?auto_118785 ) ( ON ?auto_118783 ?auto_118784 ) ( ON ?auto_118782 ?auto_118783 ) ( ON ?auto_118781 ?auto_118782 ) ( CLEAR ?auto_118781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118781 )
      ( MAKE-9PILE ?auto_118781 ?auto_118782 ?auto_118783 ?auto_118784 ?auto_118785 ?auto_118786 ?auto_118787 ?auto_118788 ?auto_118789 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_118800 - BLOCK
      ?auto_118801 - BLOCK
      ?auto_118802 - BLOCK
      ?auto_118803 - BLOCK
      ?auto_118804 - BLOCK
      ?auto_118805 - BLOCK
      ?auto_118806 - BLOCK
      ?auto_118807 - BLOCK
      ?auto_118808 - BLOCK
    )
    :vars
    (
      ?auto_118809 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118808 ?auto_118809 ) ( not ( = ?auto_118800 ?auto_118801 ) ) ( not ( = ?auto_118800 ?auto_118802 ) ) ( not ( = ?auto_118800 ?auto_118803 ) ) ( not ( = ?auto_118800 ?auto_118804 ) ) ( not ( = ?auto_118800 ?auto_118805 ) ) ( not ( = ?auto_118800 ?auto_118806 ) ) ( not ( = ?auto_118800 ?auto_118807 ) ) ( not ( = ?auto_118800 ?auto_118808 ) ) ( not ( = ?auto_118800 ?auto_118809 ) ) ( not ( = ?auto_118801 ?auto_118802 ) ) ( not ( = ?auto_118801 ?auto_118803 ) ) ( not ( = ?auto_118801 ?auto_118804 ) ) ( not ( = ?auto_118801 ?auto_118805 ) ) ( not ( = ?auto_118801 ?auto_118806 ) ) ( not ( = ?auto_118801 ?auto_118807 ) ) ( not ( = ?auto_118801 ?auto_118808 ) ) ( not ( = ?auto_118801 ?auto_118809 ) ) ( not ( = ?auto_118802 ?auto_118803 ) ) ( not ( = ?auto_118802 ?auto_118804 ) ) ( not ( = ?auto_118802 ?auto_118805 ) ) ( not ( = ?auto_118802 ?auto_118806 ) ) ( not ( = ?auto_118802 ?auto_118807 ) ) ( not ( = ?auto_118802 ?auto_118808 ) ) ( not ( = ?auto_118802 ?auto_118809 ) ) ( not ( = ?auto_118803 ?auto_118804 ) ) ( not ( = ?auto_118803 ?auto_118805 ) ) ( not ( = ?auto_118803 ?auto_118806 ) ) ( not ( = ?auto_118803 ?auto_118807 ) ) ( not ( = ?auto_118803 ?auto_118808 ) ) ( not ( = ?auto_118803 ?auto_118809 ) ) ( not ( = ?auto_118804 ?auto_118805 ) ) ( not ( = ?auto_118804 ?auto_118806 ) ) ( not ( = ?auto_118804 ?auto_118807 ) ) ( not ( = ?auto_118804 ?auto_118808 ) ) ( not ( = ?auto_118804 ?auto_118809 ) ) ( not ( = ?auto_118805 ?auto_118806 ) ) ( not ( = ?auto_118805 ?auto_118807 ) ) ( not ( = ?auto_118805 ?auto_118808 ) ) ( not ( = ?auto_118805 ?auto_118809 ) ) ( not ( = ?auto_118806 ?auto_118807 ) ) ( not ( = ?auto_118806 ?auto_118808 ) ) ( not ( = ?auto_118806 ?auto_118809 ) ) ( not ( = ?auto_118807 ?auto_118808 ) ) ( not ( = ?auto_118807 ?auto_118809 ) ) ( not ( = ?auto_118808 ?auto_118809 ) ) ( ON ?auto_118807 ?auto_118808 ) ( ON ?auto_118806 ?auto_118807 ) ( ON ?auto_118805 ?auto_118806 ) ( ON ?auto_118804 ?auto_118805 ) ( ON ?auto_118803 ?auto_118804 ) ( ON ?auto_118802 ?auto_118803 ) ( ON ?auto_118801 ?auto_118802 ) ( ON ?auto_118800 ?auto_118801 ) ( CLEAR ?auto_118800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_118800 )
      ( MAKE-9PILE ?auto_118800 ?auto_118801 ?auto_118802 ?auto_118803 ?auto_118804 ?auto_118805 ?auto_118806 ?auto_118807 ?auto_118808 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_118820 - BLOCK
      ?auto_118821 - BLOCK
      ?auto_118822 - BLOCK
      ?auto_118823 - BLOCK
      ?auto_118824 - BLOCK
      ?auto_118825 - BLOCK
      ?auto_118826 - BLOCK
      ?auto_118827 - BLOCK
      ?auto_118828 - BLOCK
      ?auto_118829 - BLOCK
    )
    :vars
    (
      ?auto_118830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118828 ) ( ON ?auto_118829 ?auto_118830 ) ( CLEAR ?auto_118829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118820 ) ( ON ?auto_118821 ?auto_118820 ) ( ON ?auto_118822 ?auto_118821 ) ( ON ?auto_118823 ?auto_118822 ) ( ON ?auto_118824 ?auto_118823 ) ( ON ?auto_118825 ?auto_118824 ) ( ON ?auto_118826 ?auto_118825 ) ( ON ?auto_118827 ?auto_118826 ) ( ON ?auto_118828 ?auto_118827 ) ( not ( = ?auto_118820 ?auto_118821 ) ) ( not ( = ?auto_118820 ?auto_118822 ) ) ( not ( = ?auto_118820 ?auto_118823 ) ) ( not ( = ?auto_118820 ?auto_118824 ) ) ( not ( = ?auto_118820 ?auto_118825 ) ) ( not ( = ?auto_118820 ?auto_118826 ) ) ( not ( = ?auto_118820 ?auto_118827 ) ) ( not ( = ?auto_118820 ?auto_118828 ) ) ( not ( = ?auto_118820 ?auto_118829 ) ) ( not ( = ?auto_118820 ?auto_118830 ) ) ( not ( = ?auto_118821 ?auto_118822 ) ) ( not ( = ?auto_118821 ?auto_118823 ) ) ( not ( = ?auto_118821 ?auto_118824 ) ) ( not ( = ?auto_118821 ?auto_118825 ) ) ( not ( = ?auto_118821 ?auto_118826 ) ) ( not ( = ?auto_118821 ?auto_118827 ) ) ( not ( = ?auto_118821 ?auto_118828 ) ) ( not ( = ?auto_118821 ?auto_118829 ) ) ( not ( = ?auto_118821 ?auto_118830 ) ) ( not ( = ?auto_118822 ?auto_118823 ) ) ( not ( = ?auto_118822 ?auto_118824 ) ) ( not ( = ?auto_118822 ?auto_118825 ) ) ( not ( = ?auto_118822 ?auto_118826 ) ) ( not ( = ?auto_118822 ?auto_118827 ) ) ( not ( = ?auto_118822 ?auto_118828 ) ) ( not ( = ?auto_118822 ?auto_118829 ) ) ( not ( = ?auto_118822 ?auto_118830 ) ) ( not ( = ?auto_118823 ?auto_118824 ) ) ( not ( = ?auto_118823 ?auto_118825 ) ) ( not ( = ?auto_118823 ?auto_118826 ) ) ( not ( = ?auto_118823 ?auto_118827 ) ) ( not ( = ?auto_118823 ?auto_118828 ) ) ( not ( = ?auto_118823 ?auto_118829 ) ) ( not ( = ?auto_118823 ?auto_118830 ) ) ( not ( = ?auto_118824 ?auto_118825 ) ) ( not ( = ?auto_118824 ?auto_118826 ) ) ( not ( = ?auto_118824 ?auto_118827 ) ) ( not ( = ?auto_118824 ?auto_118828 ) ) ( not ( = ?auto_118824 ?auto_118829 ) ) ( not ( = ?auto_118824 ?auto_118830 ) ) ( not ( = ?auto_118825 ?auto_118826 ) ) ( not ( = ?auto_118825 ?auto_118827 ) ) ( not ( = ?auto_118825 ?auto_118828 ) ) ( not ( = ?auto_118825 ?auto_118829 ) ) ( not ( = ?auto_118825 ?auto_118830 ) ) ( not ( = ?auto_118826 ?auto_118827 ) ) ( not ( = ?auto_118826 ?auto_118828 ) ) ( not ( = ?auto_118826 ?auto_118829 ) ) ( not ( = ?auto_118826 ?auto_118830 ) ) ( not ( = ?auto_118827 ?auto_118828 ) ) ( not ( = ?auto_118827 ?auto_118829 ) ) ( not ( = ?auto_118827 ?auto_118830 ) ) ( not ( = ?auto_118828 ?auto_118829 ) ) ( not ( = ?auto_118828 ?auto_118830 ) ) ( not ( = ?auto_118829 ?auto_118830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118829 ?auto_118830 )
      ( !STACK ?auto_118829 ?auto_118828 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_118841 - BLOCK
      ?auto_118842 - BLOCK
      ?auto_118843 - BLOCK
      ?auto_118844 - BLOCK
      ?auto_118845 - BLOCK
      ?auto_118846 - BLOCK
      ?auto_118847 - BLOCK
      ?auto_118848 - BLOCK
      ?auto_118849 - BLOCK
      ?auto_118850 - BLOCK
    )
    :vars
    (
      ?auto_118851 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_118849 ) ( ON ?auto_118850 ?auto_118851 ) ( CLEAR ?auto_118850 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_118841 ) ( ON ?auto_118842 ?auto_118841 ) ( ON ?auto_118843 ?auto_118842 ) ( ON ?auto_118844 ?auto_118843 ) ( ON ?auto_118845 ?auto_118844 ) ( ON ?auto_118846 ?auto_118845 ) ( ON ?auto_118847 ?auto_118846 ) ( ON ?auto_118848 ?auto_118847 ) ( ON ?auto_118849 ?auto_118848 ) ( not ( = ?auto_118841 ?auto_118842 ) ) ( not ( = ?auto_118841 ?auto_118843 ) ) ( not ( = ?auto_118841 ?auto_118844 ) ) ( not ( = ?auto_118841 ?auto_118845 ) ) ( not ( = ?auto_118841 ?auto_118846 ) ) ( not ( = ?auto_118841 ?auto_118847 ) ) ( not ( = ?auto_118841 ?auto_118848 ) ) ( not ( = ?auto_118841 ?auto_118849 ) ) ( not ( = ?auto_118841 ?auto_118850 ) ) ( not ( = ?auto_118841 ?auto_118851 ) ) ( not ( = ?auto_118842 ?auto_118843 ) ) ( not ( = ?auto_118842 ?auto_118844 ) ) ( not ( = ?auto_118842 ?auto_118845 ) ) ( not ( = ?auto_118842 ?auto_118846 ) ) ( not ( = ?auto_118842 ?auto_118847 ) ) ( not ( = ?auto_118842 ?auto_118848 ) ) ( not ( = ?auto_118842 ?auto_118849 ) ) ( not ( = ?auto_118842 ?auto_118850 ) ) ( not ( = ?auto_118842 ?auto_118851 ) ) ( not ( = ?auto_118843 ?auto_118844 ) ) ( not ( = ?auto_118843 ?auto_118845 ) ) ( not ( = ?auto_118843 ?auto_118846 ) ) ( not ( = ?auto_118843 ?auto_118847 ) ) ( not ( = ?auto_118843 ?auto_118848 ) ) ( not ( = ?auto_118843 ?auto_118849 ) ) ( not ( = ?auto_118843 ?auto_118850 ) ) ( not ( = ?auto_118843 ?auto_118851 ) ) ( not ( = ?auto_118844 ?auto_118845 ) ) ( not ( = ?auto_118844 ?auto_118846 ) ) ( not ( = ?auto_118844 ?auto_118847 ) ) ( not ( = ?auto_118844 ?auto_118848 ) ) ( not ( = ?auto_118844 ?auto_118849 ) ) ( not ( = ?auto_118844 ?auto_118850 ) ) ( not ( = ?auto_118844 ?auto_118851 ) ) ( not ( = ?auto_118845 ?auto_118846 ) ) ( not ( = ?auto_118845 ?auto_118847 ) ) ( not ( = ?auto_118845 ?auto_118848 ) ) ( not ( = ?auto_118845 ?auto_118849 ) ) ( not ( = ?auto_118845 ?auto_118850 ) ) ( not ( = ?auto_118845 ?auto_118851 ) ) ( not ( = ?auto_118846 ?auto_118847 ) ) ( not ( = ?auto_118846 ?auto_118848 ) ) ( not ( = ?auto_118846 ?auto_118849 ) ) ( not ( = ?auto_118846 ?auto_118850 ) ) ( not ( = ?auto_118846 ?auto_118851 ) ) ( not ( = ?auto_118847 ?auto_118848 ) ) ( not ( = ?auto_118847 ?auto_118849 ) ) ( not ( = ?auto_118847 ?auto_118850 ) ) ( not ( = ?auto_118847 ?auto_118851 ) ) ( not ( = ?auto_118848 ?auto_118849 ) ) ( not ( = ?auto_118848 ?auto_118850 ) ) ( not ( = ?auto_118848 ?auto_118851 ) ) ( not ( = ?auto_118849 ?auto_118850 ) ) ( not ( = ?auto_118849 ?auto_118851 ) ) ( not ( = ?auto_118850 ?auto_118851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_118850 ?auto_118851 )
      ( !STACK ?auto_118850 ?auto_118849 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_118862 - BLOCK
      ?auto_118863 - BLOCK
      ?auto_118864 - BLOCK
      ?auto_118865 - BLOCK
      ?auto_118866 - BLOCK
      ?auto_118867 - BLOCK
      ?auto_118868 - BLOCK
      ?auto_118869 - BLOCK
      ?auto_118870 - BLOCK
      ?auto_118871 - BLOCK
    )
    :vars
    (
      ?auto_118872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118871 ?auto_118872 ) ( ON-TABLE ?auto_118862 ) ( ON ?auto_118863 ?auto_118862 ) ( ON ?auto_118864 ?auto_118863 ) ( ON ?auto_118865 ?auto_118864 ) ( ON ?auto_118866 ?auto_118865 ) ( ON ?auto_118867 ?auto_118866 ) ( ON ?auto_118868 ?auto_118867 ) ( ON ?auto_118869 ?auto_118868 ) ( not ( = ?auto_118862 ?auto_118863 ) ) ( not ( = ?auto_118862 ?auto_118864 ) ) ( not ( = ?auto_118862 ?auto_118865 ) ) ( not ( = ?auto_118862 ?auto_118866 ) ) ( not ( = ?auto_118862 ?auto_118867 ) ) ( not ( = ?auto_118862 ?auto_118868 ) ) ( not ( = ?auto_118862 ?auto_118869 ) ) ( not ( = ?auto_118862 ?auto_118870 ) ) ( not ( = ?auto_118862 ?auto_118871 ) ) ( not ( = ?auto_118862 ?auto_118872 ) ) ( not ( = ?auto_118863 ?auto_118864 ) ) ( not ( = ?auto_118863 ?auto_118865 ) ) ( not ( = ?auto_118863 ?auto_118866 ) ) ( not ( = ?auto_118863 ?auto_118867 ) ) ( not ( = ?auto_118863 ?auto_118868 ) ) ( not ( = ?auto_118863 ?auto_118869 ) ) ( not ( = ?auto_118863 ?auto_118870 ) ) ( not ( = ?auto_118863 ?auto_118871 ) ) ( not ( = ?auto_118863 ?auto_118872 ) ) ( not ( = ?auto_118864 ?auto_118865 ) ) ( not ( = ?auto_118864 ?auto_118866 ) ) ( not ( = ?auto_118864 ?auto_118867 ) ) ( not ( = ?auto_118864 ?auto_118868 ) ) ( not ( = ?auto_118864 ?auto_118869 ) ) ( not ( = ?auto_118864 ?auto_118870 ) ) ( not ( = ?auto_118864 ?auto_118871 ) ) ( not ( = ?auto_118864 ?auto_118872 ) ) ( not ( = ?auto_118865 ?auto_118866 ) ) ( not ( = ?auto_118865 ?auto_118867 ) ) ( not ( = ?auto_118865 ?auto_118868 ) ) ( not ( = ?auto_118865 ?auto_118869 ) ) ( not ( = ?auto_118865 ?auto_118870 ) ) ( not ( = ?auto_118865 ?auto_118871 ) ) ( not ( = ?auto_118865 ?auto_118872 ) ) ( not ( = ?auto_118866 ?auto_118867 ) ) ( not ( = ?auto_118866 ?auto_118868 ) ) ( not ( = ?auto_118866 ?auto_118869 ) ) ( not ( = ?auto_118866 ?auto_118870 ) ) ( not ( = ?auto_118866 ?auto_118871 ) ) ( not ( = ?auto_118866 ?auto_118872 ) ) ( not ( = ?auto_118867 ?auto_118868 ) ) ( not ( = ?auto_118867 ?auto_118869 ) ) ( not ( = ?auto_118867 ?auto_118870 ) ) ( not ( = ?auto_118867 ?auto_118871 ) ) ( not ( = ?auto_118867 ?auto_118872 ) ) ( not ( = ?auto_118868 ?auto_118869 ) ) ( not ( = ?auto_118868 ?auto_118870 ) ) ( not ( = ?auto_118868 ?auto_118871 ) ) ( not ( = ?auto_118868 ?auto_118872 ) ) ( not ( = ?auto_118869 ?auto_118870 ) ) ( not ( = ?auto_118869 ?auto_118871 ) ) ( not ( = ?auto_118869 ?auto_118872 ) ) ( not ( = ?auto_118870 ?auto_118871 ) ) ( not ( = ?auto_118870 ?auto_118872 ) ) ( not ( = ?auto_118871 ?auto_118872 ) ) ( CLEAR ?auto_118869 ) ( ON ?auto_118870 ?auto_118871 ) ( CLEAR ?auto_118870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_118862 ?auto_118863 ?auto_118864 ?auto_118865 ?auto_118866 ?auto_118867 ?auto_118868 ?auto_118869 ?auto_118870 )
      ( MAKE-10PILE ?auto_118862 ?auto_118863 ?auto_118864 ?auto_118865 ?auto_118866 ?auto_118867 ?auto_118868 ?auto_118869 ?auto_118870 ?auto_118871 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_118883 - BLOCK
      ?auto_118884 - BLOCK
      ?auto_118885 - BLOCK
      ?auto_118886 - BLOCK
      ?auto_118887 - BLOCK
      ?auto_118888 - BLOCK
      ?auto_118889 - BLOCK
      ?auto_118890 - BLOCK
      ?auto_118891 - BLOCK
      ?auto_118892 - BLOCK
    )
    :vars
    (
      ?auto_118893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118892 ?auto_118893 ) ( ON-TABLE ?auto_118883 ) ( ON ?auto_118884 ?auto_118883 ) ( ON ?auto_118885 ?auto_118884 ) ( ON ?auto_118886 ?auto_118885 ) ( ON ?auto_118887 ?auto_118886 ) ( ON ?auto_118888 ?auto_118887 ) ( ON ?auto_118889 ?auto_118888 ) ( ON ?auto_118890 ?auto_118889 ) ( not ( = ?auto_118883 ?auto_118884 ) ) ( not ( = ?auto_118883 ?auto_118885 ) ) ( not ( = ?auto_118883 ?auto_118886 ) ) ( not ( = ?auto_118883 ?auto_118887 ) ) ( not ( = ?auto_118883 ?auto_118888 ) ) ( not ( = ?auto_118883 ?auto_118889 ) ) ( not ( = ?auto_118883 ?auto_118890 ) ) ( not ( = ?auto_118883 ?auto_118891 ) ) ( not ( = ?auto_118883 ?auto_118892 ) ) ( not ( = ?auto_118883 ?auto_118893 ) ) ( not ( = ?auto_118884 ?auto_118885 ) ) ( not ( = ?auto_118884 ?auto_118886 ) ) ( not ( = ?auto_118884 ?auto_118887 ) ) ( not ( = ?auto_118884 ?auto_118888 ) ) ( not ( = ?auto_118884 ?auto_118889 ) ) ( not ( = ?auto_118884 ?auto_118890 ) ) ( not ( = ?auto_118884 ?auto_118891 ) ) ( not ( = ?auto_118884 ?auto_118892 ) ) ( not ( = ?auto_118884 ?auto_118893 ) ) ( not ( = ?auto_118885 ?auto_118886 ) ) ( not ( = ?auto_118885 ?auto_118887 ) ) ( not ( = ?auto_118885 ?auto_118888 ) ) ( not ( = ?auto_118885 ?auto_118889 ) ) ( not ( = ?auto_118885 ?auto_118890 ) ) ( not ( = ?auto_118885 ?auto_118891 ) ) ( not ( = ?auto_118885 ?auto_118892 ) ) ( not ( = ?auto_118885 ?auto_118893 ) ) ( not ( = ?auto_118886 ?auto_118887 ) ) ( not ( = ?auto_118886 ?auto_118888 ) ) ( not ( = ?auto_118886 ?auto_118889 ) ) ( not ( = ?auto_118886 ?auto_118890 ) ) ( not ( = ?auto_118886 ?auto_118891 ) ) ( not ( = ?auto_118886 ?auto_118892 ) ) ( not ( = ?auto_118886 ?auto_118893 ) ) ( not ( = ?auto_118887 ?auto_118888 ) ) ( not ( = ?auto_118887 ?auto_118889 ) ) ( not ( = ?auto_118887 ?auto_118890 ) ) ( not ( = ?auto_118887 ?auto_118891 ) ) ( not ( = ?auto_118887 ?auto_118892 ) ) ( not ( = ?auto_118887 ?auto_118893 ) ) ( not ( = ?auto_118888 ?auto_118889 ) ) ( not ( = ?auto_118888 ?auto_118890 ) ) ( not ( = ?auto_118888 ?auto_118891 ) ) ( not ( = ?auto_118888 ?auto_118892 ) ) ( not ( = ?auto_118888 ?auto_118893 ) ) ( not ( = ?auto_118889 ?auto_118890 ) ) ( not ( = ?auto_118889 ?auto_118891 ) ) ( not ( = ?auto_118889 ?auto_118892 ) ) ( not ( = ?auto_118889 ?auto_118893 ) ) ( not ( = ?auto_118890 ?auto_118891 ) ) ( not ( = ?auto_118890 ?auto_118892 ) ) ( not ( = ?auto_118890 ?auto_118893 ) ) ( not ( = ?auto_118891 ?auto_118892 ) ) ( not ( = ?auto_118891 ?auto_118893 ) ) ( not ( = ?auto_118892 ?auto_118893 ) ) ( CLEAR ?auto_118890 ) ( ON ?auto_118891 ?auto_118892 ) ( CLEAR ?auto_118891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_118883 ?auto_118884 ?auto_118885 ?auto_118886 ?auto_118887 ?auto_118888 ?auto_118889 ?auto_118890 ?auto_118891 )
      ( MAKE-10PILE ?auto_118883 ?auto_118884 ?auto_118885 ?auto_118886 ?auto_118887 ?auto_118888 ?auto_118889 ?auto_118890 ?auto_118891 ?auto_118892 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_118904 - BLOCK
      ?auto_118905 - BLOCK
      ?auto_118906 - BLOCK
      ?auto_118907 - BLOCK
      ?auto_118908 - BLOCK
      ?auto_118909 - BLOCK
      ?auto_118910 - BLOCK
      ?auto_118911 - BLOCK
      ?auto_118912 - BLOCK
      ?auto_118913 - BLOCK
    )
    :vars
    (
      ?auto_118914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118913 ?auto_118914 ) ( ON-TABLE ?auto_118904 ) ( ON ?auto_118905 ?auto_118904 ) ( ON ?auto_118906 ?auto_118905 ) ( ON ?auto_118907 ?auto_118906 ) ( ON ?auto_118908 ?auto_118907 ) ( ON ?auto_118909 ?auto_118908 ) ( ON ?auto_118910 ?auto_118909 ) ( not ( = ?auto_118904 ?auto_118905 ) ) ( not ( = ?auto_118904 ?auto_118906 ) ) ( not ( = ?auto_118904 ?auto_118907 ) ) ( not ( = ?auto_118904 ?auto_118908 ) ) ( not ( = ?auto_118904 ?auto_118909 ) ) ( not ( = ?auto_118904 ?auto_118910 ) ) ( not ( = ?auto_118904 ?auto_118911 ) ) ( not ( = ?auto_118904 ?auto_118912 ) ) ( not ( = ?auto_118904 ?auto_118913 ) ) ( not ( = ?auto_118904 ?auto_118914 ) ) ( not ( = ?auto_118905 ?auto_118906 ) ) ( not ( = ?auto_118905 ?auto_118907 ) ) ( not ( = ?auto_118905 ?auto_118908 ) ) ( not ( = ?auto_118905 ?auto_118909 ) ) ( not ( = ?auto_118905 ?auto_118910 ) ) ( not ( = ?auto_118905 ?auto_118911 ) ) ( not ( = ?auto_118905 ?auto_118912 ) ) ( not ( = ?auto_118905 ?auto_118913 ) ) ( not ( = ?auto_118905 ?auto_118914 ) ) ( not ( = ?auto_118906 ?auto_118907 ) ) ( not ( = ?auto_118906 ?auto_118908 ) ) ( not ( = ?auto_118906 ?auto_118909 ) ) ( not ( = ?auto_118906 ?auto_118910 ) ) ( not ( = ?auto_118906 ?auto_118911 ) ) ( not ( = ?auto_118906 ?auto_118912 ) ) ( not ( = ?auto_118906 ?auto_118913 ) ) ( not ( = ?auto_118906 ?auto_118914 ) ) ( not ( = ?auto_118907 ?auto_118908 ) ) ( not ( = ?auto_118907 ?auto_118909 ) ) ( not ( = ?auto_118907 ?auto_118910 ) ) ( not ( = ?auto_118907 ?auto_118911 ) ) ( not ( = ?auto_118907 ?auto_118912 ) ) ( not ( = ?auto_118907 ?auto_118913 ) ) ( not ( = ?auto_118907 ?auto_118914 ) ) ( not ( = ?auto_118908 ?auto_118909 ) ) ( not ( = ?auto_118908 ?auto_118910 ) ) ( not ( = ?auto_118908 ?auto_118911 ) ) ( not ( = ?auto_118908 ?auto_118912 ) ) ( not ( = ?auto_118908 ?auto_118913 ) ) ( not ( = ?auto_118908 ?auto_118914 ) ) ( not ( = ?auto_118909 ?auto_118910 ) ) ( not ( = ?auto_118909 ?auto_118911 ) ) ( not ( = ?auto_118909 ?auto_118912 ) ) ( not ( = ?auto_118909 ?auto_118913 ) ) ( not ( = ?auto_118909 ?auto_118914 ) ) ( not ( = ?auto_118910 ?auto_118911 ) ) ( not ( = ?auto_118910 ?auto_118912 ) ) ( not ( = ?auto_118910 ?auto_118913 ) ) ( not ( = ?auto_118910 ?auto_118914 ) ) ( not ( = ?auto_118911 ?auto_118912 ) ) ( not ( = ?auto_118911 ?auto_118913 ) ) ( not ( = ?auto_118911 ?auto_118914 ) ) ( not ( = ?auto_118912 ?auto_118913 ) ) ( not ( = ?auto_118912 ?auto_118914 ) ) ( not ( = ?auto_118913 ?auto_118914 ) ) ( ON ?auto_118912 ?auto_118913 ) ( CLEAR ?auto_118910 ) ( ON ?auto_118911 ?auto_118912 ) ( CLEAR ?auto_118911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_118904 ?auto_118905 ?auto_118906 ?auto_118907 ?auto_118908 ?auto_118909 ?auto_118910 ?auto_118911 )
      ( MAKE-10PILE ?auto_118904 ?auto_118905 ?auto_118906 ?auto_118907 ?auto_118908 ?auto_118909 ?auto_118910 ?auto_118911 ?auto_118912 ?auto_118913 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_118925 - BLOCK
      ?auto_118926 - BLOCK
      ?auto_118927 - BLOCK
      ?auto_118928 - BLOCK
      ?auto_118929 - BLOCK
      ?auto_118930 - BLOCK
      ?auto_118931 - BLOCK
      ?auto_118932 - BLOCK
      ?auto_118933 - BLOCK
      ?auto_118934 - BLOCK
    )
    :vars
    (
      ?auto_118935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118934 ?auto_118935 ) ( ON-TABLE ?auto_118925 ) ( ON ?auto_118926 ?auto_118925 ) ( ON ?auto_118927 ?auto_118926 ) ( ON ?auto_118928 ?auto_118927 ) ( ON ?auto_118929 ?auto_118928 ) ( ON ?auto_118930 ?auto_118929 ) ( ON ?auto_118931 ?auto_118930 ) ( not ( = ?auto_118925 ?auto_118926 ) ) ( not ( = ?auto_118925 ?auto_118927 ) ) ( not ( = ?auto_118925 ?auto_118928 ) ) ( not ( = ?auto_118925 ?auto_118929 ) ) ( not ( = ?auto_118925 ?auto_118930 ) ) ( not ( = ?auto_118925 ?auto_118931 ) ) ( not ( = ?auto_118925 ?auto_118932 ) ) ( not ( = ?auto_118925 ?auto_118933 ) ) ( not ( = ?auto_118925 ?auto_118934 ) ) ( not ( = ?auto_118925 ?auto_118935 ) ) ( not ( = ?auto_118926 ?auto_118927 ) ) ( not ( = ?auto_118926 ?auto_118928 ) ) ( not ( = ?auto_118926 ?auto_118929 ) ) ( not ( = ?auto_118926 ?auto_118930 ) ) ( not ( = ?auto_118926 ?auto_118931 ) ) ( not ( = ?auto_118926 ?auto_118932 ) ) ( not ( = ?auto_118926 ?auto_118933 ) ) ( not ( = ?auto_118926 ?auto_118934 ) ) ( not ( = ?auto_118926 ?auto_118935 ) ) ( not ( = ?auto_118927 ?auto_118928 ) ) ( not ( = ?auto_118927 ?auto_118929 ) ) ( not ( = ?auto_118927 ?auto_118930 ) ) ( not ( = ?auto_118927 ?auto_118931 ) ) ( not ( = ?auto_118927 ?auto_118932 ) ) ( not ( = ?auto_118927 ?auto_118933 ) ) ( not ( = ?auto_118927 ?auto_118934 ) ) ( not ( = ?auto_118927 ?auto_118935 ) ) ( not ( = ?auto_118928 ?auto_118929 ) ) ( not ( = ?auto_118928 ?auto_118930 ) ) ( not ( = ?auto_118928 ?auto_118931 ) ) ( not ( = ?auto_118928 ?auto_118932 ) ) ( not ( = ?auto_118928 ?auto_118933 ) ) ( not ( = ?auto_118928 ?auto_118934 ) ) ( not ( = ?auto_118928 ?auto_118935 ) ) ( not ( = ?auto_118929 ?auto_118930 ) ) ( not ( = ?auto_118929 ?auto_118931 ) ) ( not ( = ?auto_118929 ?auto_118932 ) ) ( not ( = ?auto_118929 ?auto_118933 ) ) ( not ( = ?auto_118929 ?auto_118934 ) ) ( not ( = ?auto_118929 ?auto_118935 ) ) ( not ( = ?auto_118930 ?auto_118931 ) ) ( not ( = ?auto_118930 ?auto_118932 ) ) ( not ( = ?auto_118930 ?auto_118933 ) ) ( not ( = ?auto_118930 ?auto_118934 ) ) ( not ( = ?auto_118930 ?auto_118935 ) ) ( not ( = ?auto_118931 ?auto_118932 ) ) ( not ( = ?auto_118931 ?auto_118933 ) ) ( not ( = ?auto_118931 ?auto_118934 ) ) ( not ( = ?auto_118931 ?auto_118935 ) ) ( not ( = ?auto_118932 ?auto_118933 ) ) ( not ( = ?auto_118932 ?auto_118934 ) ) ( not ( = ?auto_118932 ?auto_118935 ) ) ( not ( = ?auto_118933 ?auto_118934 ) ) ( not ( = ?auto_118933 ?auto_118935 ) ) ( not ( = ?auto_118934 ?auto_118935 ) ) ( ON ?auto_118933 ?auto_118934 ) ( CLEAR ?auto_118931 ) ( ON ?auto_118932 ?auto_118933 ) ( CLEAR ?auto_118932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_118925 ?auto_118926 ?auto_118927 ?auto_118928 ?auto_118929 ?auto_118930 ?auto_118931 ?auto_118932 )
      ( MAKE-10PILE ?auto_118925 ?auto_118926 ?auto_118927 ?auto_118928 ?auto_118929 ?auto_118930 ?auto_118931 ?auto_118932 ?auto_118933 ?auto_118934 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_118946 - BLOCK
      ?auto_118947 - BLOCK
      ?auto_118948 - BLOCK
      ?auto_118949 - BLOCK
      ?auto_118950 - BLOCK
      ?auto_118951 - BLOCK
      ?auto_118952 - BLOCK
      ?auto_118953 - BLOCK
      ?auto_118954 - BLOCK
      ?auto_118955 - BLOCK
    )
    :vars
    (
      ?auto_118956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118955 ?auto_118956 ) ( ON-TABLE ?auto_118946 ) ( ON ?auto_118947 ?auto_118946 ) ( ON ?auto_118948 ?auto_118947 ) ( ON ?auto_118949 ?auto_118948 ) ( ON ?auto_118950 ?auto_118949 ) ( ON ?auto_118951 ?auto_118950 ) ( not ( = ?auto_118946 ?auto_118947 ) ) ( not ( = ?auto_118946 ?auto_118948 ) ) ( not ( = ?auto_118946 ?auto_118949 ) ) ( not ( = ?auto_118946 ?auto_118950 ) ) ( not ( = ?auto_118946 ?auto_118951 ) ) ( not ( = ?auto_118946 ?auto_118952 ) ) ( not ( = ?auto_118946 ?auto_118953 ) ) ( not ( = ?auto_118946 ?auto_118954 ) ) ( not ( = ?auto_118946 ?auto_118955 ) ) ( not ( = ?auto_118946 ?auto_118956 ) ) ( not ( = ?auto_118947 ?auto_118948 ) ) ( not ( = ?auto_118947 ?auto_118949 ) ) ( not ( = ?auto_118947 ?auto_118950 ) ) ( not ( = ?auto_118947 ?auto_118951 ) ) ( not ( = ?auto_118947 ?auto_118952 ) ) ( not ( = ?auto_118947 ?auto_118953 ) ) ( not ( = ?auto_118947 ?auto_118954 ) ) ( not ( = ?auto_118947 ?auto_118955 ) ) ( not ( = ?auto_118947 ?auto_118956 ) ) ( not ( = ?auto_118948 ?auto_118949 ) ) ( not ( = ?auto_118948 ?auto_118950 ) ) ( not ( = ?auto_118948 ?auto_118951 ) ) ( not ( = ?auto_118948 ?auto_118952 ) ) ( not ( = ?auto_118948 ?auto_118953 ) ) ( not ( = ?auto_118948 ?auto_118954 ) ) ( not ( = ?auto_118948 ?auto_118955 ) ) ( not ( = ?auto_118948 ?auto_118956 ) ) ( not ( = ?auto_118949 ?auto_118950 ) ) ( not ( = ?auto_118949 ?auto_118951 ) ) ( not ( = ?auto_118949 ?auto_118952 ) ) ( not ( = ?auto_118949 ?auto_118953 ) ) ( not ( = ?auto_118949 ?auto_118954 ) ) ( not ( = ?auto_118949 ?auto_118955 ) ) ( not ( = ?auto_118949 ?auto_118956 ) ) ( not ( = ?auto_118950 ?auto_118951 ) ) ( not ( = ?auto_118950 ?auto_118952 ) ) ( not ( = ?auto_118950 ?auto_118953 ) ) ( not ( = ?auto_118950 ?auto_118954 ) ) ( not ( = ?auto_118950 ?auto_118955 ) ) ( not ( = ?auto_118950 ?auto_118956 ) ) ( not ( = ?auto_118951 ?auto_118952 ) ) ( not ( = ?auto_118951 ?auto_118953 ) ) ( not ( = ?auto_118951 ?auto_118954 ) ) ( not ( = ?auto_118951 ?auto_118955 ) ) ( not ( = ?auto_118951 ?auto_118956 ) ) ( not ( = ?auto_118952 ?auto_118953 ) ) ( not ( = ?auto_118952 ?auto_118954 ) ) ( not ( = ?auto_118952 ?auto_118955 ) ) ( not ( = ?auto_118952 ?auto_118956 ) ) ( not ( = ?auto_118953 ?auto_118954 ) ) ( not ( = ?auto_118953 ?auto_118955 ) ) ( not ( = ?auto_118953 ?auto_118956 ) ) ( not ( = ?auto_118954 ?auto_118955 ) ) ( not ( = ?auto_118954 ?auto_118956 ) ) ( not ( = ?auto_118955 ?auto_118956 ) ) ( ON ?auto_118954 ?auto_118955 ) ( ON ?auto_118953 ?auto_118954 ) ( CLEAR ?auto_118951 ) ( ON ?auto_118952 ?auto_118953 ) ( CLEAR ?auto_118952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118946 ?auto_118947 ?auto_118948 ?auto_118949 ?auto_118950 ?auto_118951 ?auto_118952 )
      ( MAKE-10PILE ?auto_118946 ?auto_118947 ?auto_118948 ?auto_118949 ?auto_118950 ?auto_118951 ?auto_118952 ?auto_118953 ?auto_118954 ?auto_118955 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_118967 - BLOCK
      ?auto_118968 - BLOCK
      ?auto_118969 - BLOCK
      ?auto_118970 - BLOCK
      ?auto_118971 - BLOCK
      ?auto_118972 - BLOCK
      ?auto_118973 - BLOCK
      ?auto_118974 - BLOCK
      ?auto_118975 - BLOCK
      ?auto_118976 - BLOCK
    )
    :vars
    (
      ?auto_118977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118976 ?auto_118977 ) ( ON-TABLE ?auto_118967 ) ( ON ?auto_118968 ?auto_118967 ) ( ON ?auto_118969 ?auto_118968 ) ( ON ?auto_118970 ?auto_118969 ) ( ON ?auto_118971 ?auto_118970 ) ( ON ?auto_118972 ?auto_118971 ) ( not ( = ?auto_118967 ?auto_118968 ) ) ( not ( = ?auto_118967 ?auto_118969 ) ) ( not ( = ?auto_118967 ?auto_118970 ) ) ( not ( = ?auto_118967 ?auto_118971 ) ) ( not ( = ?auto_118967 ?auto_118972 ) ) ( not ( = ?auto_118967 ?auto_118973 ) ) ( not ( = ?auto_118967 ?auto_118974 ) ) ( not ( = ?auto_118967 ?auto_118975 ) ) ( not ( = ?auto_118967 ?auto_118976 ) ) ( not ( = ?auto_118967 ?auto_118977 ) ) ( not ( = ?auto_118968 ?auto_118969 ) ) ( not ( = ?auto_118968 ?auto_118970 ) ) ( not ( = ?auto_118968 ?auto_118971 ) ) ( not ( = ?auto_118968 ?auto_118972 ) ) ( not ( = ?auto_118968 ?auto_118973 ) ) ( not ( = ?auto_118968 ?auto_118974 ) ) ( not ( = ?auto_118968 ?auto_118975 ) ) ( not ( = ?auto_118968 ?auto_118976 ) ) ( not ( = ?auto_118968 ?auto_118977 ) ) ( not ( = ?auto_118969 ?auto_118970 ) ) ( not ( = ?auto_118969 ?auto_118971 ) ) ( not ( = ?auto_118969 ?auto_118972 ) ) ( not ( = ?auto_118969 ?auto_118973 ) ) ( not ( = ?auto_118969 ?auto_118974 ) ) ( not ( = ?auto_118969 ?auto_118975 ) ) ( not ( = ?auto_118969 ?auto_118976 ) ) ( not ( = ?auto_118969 ?auto_118977 ) ) ( not ( = ?auto_118970 ?auto_118971 ) ) ( not ( = ?auto_118970 ?auto_118972 ) ) ( not ( = ?auto_118970 ?auto_118973 ) ) ( not ( = ?auto_118970 ?auto_118974 ) ) ( not ( = ?auto_118970 ?auto_118975 ) ) ( not ( = ?auto_118970 ?auto_118976 ) ) ( not ( = ?auto_118970 ?auto_118977 ) ) ( not ( = ?auto_118971 ?auto_118972 ) ) ( not ( = ?auto_118971 ?auto_118973 ) ) ( not ( = ?auto_118971 ?auto_118974 ) ) ( not ( = ?auto_118971 ?auto_118975 ) ) ( not ( = ?auto_118971 ?auto_118976 ) ) ( not ( = ?auto_118971 ?auto_118977 ) ) ( not ( = ?auto_118972 ?auto_118973 ) ) ( not ( = ?auto_118972 ?auto_118974 ) ) ( not ( = ?auto_118972 ?auto_118975 ) ) ( not ( = ?auto_118972 ?auto_118976 ) ) ( not ( = ?auto_118972 ?auto_118977 ) ) ( not ( = ?auto_118973 ?auto_118974 ) ) ( not ( = ?auto_118973 ?auto_118975 ) ) ( not ( = ?auto_118973 ?auto_118976 ) ) ( not ( = ?auto_118973 ?auto_118977 ) ) ( not ( = ?auto_118974 ?auto_118975 ) ) ( not ( = ?auto_118974 ?auto_118976 ) ) ( not ( = ?auto_118974 ?auto_118977 ) ) ( not ( = ?auto_118975 ?auto_118976 ) ) ( not ( = ?auto_118975 ?auto_118977 ) ) ( not ( = ?auto_118976 ?auto_118977 ) ) ( ON ?auto_118975 ?auto_118976 ) ( ON ?auto_118974 ?auto_118975 ) ( CLEAR ?auto_118972 ) ( ON ?auto_118973 ?auto_118974 ) ( CLEAR ?auto_118973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_118967 ?auto_118968 ?auto_118969 ?auto_118970 ?auto_118971 ?auto_118972 ?auto_118973 )
      ( MAKE-10PILE ?auto_118967 ?auto_118968 ?auto_118969 ?auto_118970 ?auto_118971 ?auto_118972 ?auto_118973 ?auto_118974 ?auto_118975 ?auto_118976 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_118988 - BLOCK
      ?auto_118989 - BLOCK
      ?auto_118990 - BLOCK
      ?auto_118991 - BLOCK
      ?auto_118992 - BLOCK
      ?auto_118993 - BLOCK
      ?auto_118994 - BLOCK
      ?auto_118995 - BLOCK
      ?auto_118996 - BLOCK
      ?auto_118997 - BLOCK
    )
    :vars
    (
      ?auto_118998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_118997 ?auto_118998 ) ( ON-TABLE ?auto_118988 ) ( ON ?auto_118989 ?auto_118988 ) ( ON ?auto_118990 ?auto_118989 ) ( ON ?auto_118991 ?auto_118990 ) ( ON ?auto_118992 ?auto_118991 ) ( not ( = ?auto_118988 ?auto_118989 ) ) ( not ( = ?auto_118988 ?auto_118990 ) ) ( not ( = ?auto_118988 ?auto_118991 ) ) ( not ( = ?auto_118988 ?auto_118992 ) ) ( not ( = ?auto_118988 ?auto_118993 ) ) ( not ( = ?auto_118988 ?auto_118994 ) ) ( not ( = ?auto_118988 ?auto_118995 ) ) ( not ( = ?auto_118988 ?auto_118996 ) ) ( not ( = ?auto_118988 ?auto_118997 ) ) ( not ( = ?auto_118988 ?auto_118998 ) ) ( not ( = ?auto_118989 ?auto_118990 ) ) ( not ( = ?auto_118989 ?auto_118991 ) ) ( not ( = ?auto_118989 ?auto_118992 ) ) ( not ( = ?auto_118989 ?auto_118993 ) ) ( not ( = ?auto_118989 ?auto_118994 ) ) ( not ( = ?auto_118989 ?auto_118995 ) ) ( not ( = ?auto_118989 ?auto_118996 ) ) ( not ( = ?auto_118989 ?auto_118997 ) ) ( not ( = ?auto_118989 ?auto_118998 ) ) ( not ( = ?auto_118990 ?auto_118991 ) ) ( not ( = ?auto_118990 ?auto_118992 ) ) ( not ( = ?auto_118990 ?auto_118993 ) ) ( not ( = ?auto_118990 ?auto_118994 ) ) ( not ( = ?auto_118990 ?auto_118995 ) ) ( not ( = ?auto_118990 ?auto_118996 ) ) ( not ( = ?auto_118990 ?auto_118997 ) ) ( not ( = ?auto_118990 ?auto_118998 ) ) ( not ( = ?auto_118991 ?auto_118992 ) ) ( not ( = ?auto_118991 ?auto_118993 ) ) ( not ( = ?auto_118991 ?auto_118994 ) ) ( not ( = ?auto_118991 ?auto_118995 ) ) ( not ( = ?auto_118991 ?auto_118996 ) ) ( not ( = ?auto_118991 ?auto_118997 ) ) ( not ( = ?auto_118991 ?auto_118998 ) ) ( not ( = ?auto_118992 ?auto_118993 ) ) ( not ( = ?auto_118992 ?auto_118994 ) ) ( not ( = ?auto_118992 ?auto_118995 ) ) ( not ( = ?auto_118992 ?auto_118996 ) ) ( not ( = ?auto_118992 ?auto_118997 ) ) ( not ( = ?auto_118992 ?auto_118998 ) ) ( not ( = ?auto_118993 ?auto_118994 ) ) ( not ( = ?auto_118993 ?auto_118995 ) ) ( not ( = ?auto_118993 ?auto_118996 ) ) ( not ( = ?auto_118993 ?auto_118997 ) ) ( not ( = ?auto_118993 ?auto_118998 ) ) ( not ( = ?auto_118994 ?auto_118995 ) ) ( not ( = ?auto_118994 ?auto_118996 ) ) ( not ( = ?auto_118994 ?auto_118997 ) ) ( not ( = ?auto_118994 ?auto_118998 ) ) ( not ( = ?auto_118995 ?auto_118996 ) ) ( not ( = ?auto_118995 ?auto_118997 ) ) ( not ( = ?auto_118995 ?auto_118998 ) ) ( not ( = ?auto_118996 ?auto_118997 ) ) ( not ( = ?auto_118996 ?auto_118998 ) ) ( not ( = ?auto_118997 ?auto_118998 ) ) ( ON ?auto_118996 ?auto_118997 ) ( ON ?auto_118995 ?auto_118996 ) ( ON ?auto_118994 ?auto_118995 ) ( CLEAR ?auto_118992 ) ( ON ?auto_118993 ?auto_118994 ) ( CLEAR ?auto_118993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_118988 ?auto_118989 ?auto_118990 ?auto_118991 ?auto_118992 ?auto_118993 )
      ( MAKE-10PILE ?auto_118988 ?auto_118989 ?auto_118990 ?auto_118991 ?auto_118992 ?auto_118993 ?auto_118994 ?auto_118995 ?auto_118996 ?auto_118997 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119009 - BLOCK
      ?auto_119010 - BLOCK
      ?auto_119011 - BLOCK
      ?auto_119012 - BLOCK
      ?auto_119013 - BLOCK
      ?auto_119014 - BLOCK
      ?auto_119015 - BLOCK
      ?auto_119016 - BLOCK
      ?auto_119017 - BLOCK
      ?auto_119018 - BLOCK
    )
    :vars
    (
      ?auto_119019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119018 ?auto_119019 ) ( ON-TABLE ?auto_119009 ) ( ON ?auto_119010 ?auto_119009 ) ( ON ?auto_119011 ?auto_119010 ) ( ON ?auto_119012 ?auto_119011 ) ( ON ?auto_119013 ?auto_119012 ) ( not ( = ?auto_119009 ?auto_119010 ) ) ( not ( = ?auto_119009 ?auto_119011 ) ) ( not ( = ?auto_119009 ?auto_119012 ) ) ( not ( = ?auto_119009 ?auto_119013 ) ) ( not ( = ?auto_119009 ?auto_119014 ) ) ( not ( = ?auto_119009 ?auto_119015 ) ) ( not ( = ?auto_119009 ?auto_119016 ) ) ( not ( = ?auto_119009 ?auto_119017 ) ) ( not ( = ?auto_119009 ?auto_119018 ) ) ( not ( = ?auto_119009 ?auto_119019 ) ) ( not ( = ?auto_119010 ?auto_119011 ) ) ( not ( = ?auto_119010 ?auto_119012 ) ) ( not ( = ?auto_119010 ?auto_119013 ) ) ( not ( = ?auto_119010 ?auto_119014 ) ) ( not ( = ?auto_119010 ?auto_119015 ) ) ( not ( = ?auto_119010 ?auto_119016 ) ) ( not ( = ?auto_119010 ?auto_119017 ) ) ( not ( = ?auto_119010 ?auto_119018 ) ) ( not ( = ?auto_119010 ?auto_119019 ) ) ( not ( = ?auto_119011 ?auto_119012 ) ) ( not ( = ?auto_119011 ?auto_119013 ) ) ( not ( = ?auto_119011 ?auto_119014 ) ) ( not ( = ?auto_119011 ?auto_119015 ) ) ( not ( = ?auto_119011 ?auto_119016 ) ) ( not ( = ?auto_119011 ?auto_119017 ) ) ( not ( = ?auto_119011 ?auto_119018 ) ) ( not ( = ?auto_119011 ?auto_119019 ) ) ( not ( = ?auto_119012 ?auto_119013 ) ) ( not ( = ?auto_119012 ?auto_119014 ) ) ( not ( = ?auto_119012 ?auto_119015 ) ) ( not ( = ?auto_119012 ?auto_119016 ) ) ( not ( = ?auto_119012 ?auto_119017 ) ) ( not ( = ?auto_119012 ?auto_119018 ) ) ( not ( = ?auto_119012 ?auto_119019 ) ) ( not ( = ?auto_119013 ?auto_119014 ) ) ( not ( = ?auto_119013 ?auto_119015 ) ) ( not ( = ?auto_119013 ?auto_119016 ) ) ( not ( = ?auto_119013 ?auto_119017 ) ) ( not ( = ?auto_119013 ?auto_119018 ) ) ( not ( = ?auto_119013 ?auto_119019 ) ) ( not ( = ?auto_119014 ?auto_119015 ) ) ( not ( = ?auto_119014 ?auto_119016 ) ) ( not ( = ?auto_119014 ?auto_119017 ) ) ( not ( = ?auto_119014 ?auto_119018 ) ) ( not ( = ?auto_119014 ?auto_119019 ) ) ( not ( = ?auto_119015 ?auto_119016 ) ) ( not ( = ?auto_119015 ?auto_119017 ) ) ( not ( = ?auto_119015 ?auto_119018 ) ) ( not ( = ?auto_119015 ?auto_119019 ) ) ( not ( = ?auto_119016 ?auto_119017 ) ) ( not ( = ?auto_119016 ?auto_119018 ) ) ( not ( = ?auto_119016 ?auto_119019 ) ) ( not ( = ?auto_119017 ?auto_119018 ) ) ( not ( = ?auto_119017 ?auto_119019 ) ) ( not ( = ?auto_119018 ?auto_119019 ) ) ( ON ?auto_119017 ?auto_119018 ) ( ON ?auto_119016 ?auto_119017 ) ( ON ?auto_119015 ?auto_119016 ) ( CLEAR ?auto_119013 ) ( ON ?auto_119014 ?auto_119015 ) ( CLEAR ?auto_119014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119009 ?auto_119010 ?auto_119011 ?auto_119012 ?auto_119013 ?auto_119014 )
      ( MAKE-10PILE ?auto_119009 ?auto_119010 ?auto_119011 ?auto_119012 ?auto_119013 ?auto_119014 ?auto_119015 ?auto_119016 ?auto_119017 ?auto_119018 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119030 - BLOCK
      ?auto_119031 - BLOCK
      ?auto_119032 - BLOCK
      ?auto_119033 - BLOCK
      ?auto_119034 - BLOCK
      ?auto_119035 - BLOCK
      ?auto_119036 - BLOCK
      ?auto_119037 - BLOCK
      ?auto_119038 - BLOCK
      ?auto_119039 - BLOCK
    )
    :vars
    (
      ?auto_119040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119039 ?auto_119040 ) ( ON-TABLE ?auto_119030 ) ( ON ?auto_119031 ?auto_119030 ) ( ON ?auto_119032 ?auto_119031 ) ( ON ?auto_119033 ?auto_119032 ) ( not ( = ?auto_119030 ?auto_119031 ) ) ( not ( = ?auto_119030 ?auto_119032 ) ) ( not ( = ?auto_119030 ?auto_119033 ) ) ( not ( = ?auto_119030 ?auto_119034 ) ) ( not ( = ?auto_119030 ?auto_119035 ) ) ( not ( = ?auto_119030 ?auto_119036 ) ) ( not ( = ?auto_119030 ?auto_119037 ) ) ( not ( = ?auto_119030 ?auto_119038 ) ) ( not ( = ?auto_119030 ?auto_119039 ) ) ( not ( = ?auto_119030 ?auto_119040 ) ) ( not ( = ?auto_119031 ?auto_119032 ) ) ( not ( = ?auto_119031 ?auto_119033 ) ) ( not ( = ?auto_119031 ?auto_119034 ) ) ( not ( = ?auto_119031 ?auto_119035 ) ) ( not ( = ?auto_119031 ?auto_119036 ) ) ( not ( = ?auto_119031 ?auto_119037 ) ) ( not ( = ?auto_119031 ?auto_119038 ) ) ( not ( = ?auto_119031 ?auto_119039 ) ) ( not ( = ?auto_119031 ?auto_119040 ) ) ( not ( = ?auto_119032 ?auto_119033 ) ) ( not ( = ?auto_119032 ?auto_119034 ) ) ( not ( = ?auto_119032 ?auto_119035 ) ) ( not ( = ?auto_119032 ?auto_119036 ) ) ( not ( = ?auto_119032 ?auto_119037 ) ) ( not ( = ?auto_119032 ?auto_119038 ) ) ( not ( = ?auto_119032 ?auto_119039 ) ) ( not ( = ?auto_119032 ?auto_119040 ) ) ( not ( = ?auto_119033 ?auto_119034 ) ) ( not ( = ?auto_119033 ?auto_119035 ) ) ( not ( = ?auto_119033 ?auto_119036 ) ) ( not ( = ?auto_119033 ?auto_119037 ) ) ( not ( = ?auto_119033 ?auto_119038 ) ) ( not ( = ?auto_119033 ?auto_119039 ) ) ( not ( = ?auto_119033 ?auto_119040 ) ) ( not ( = ?auto_119034 ?auto_119035 ) ) ( not ( = ?auto_119034 ?auto_119036 ) ) ( not ( = ?auto_119034 ?auto_119037 ) ) ( not ( = ?auto_119034 ?auto_119038 ) ) ( not ( = ?auto_119034 ?auto_119039 ) ) ( not ( = ?auto_119034 ?auto_119040 ) ) ( not ( = ?auto_119035 ?auto_119036 ) ) ( not ( = ?auto_119035 ?auto_119037 ) ) ( not ( = ?auto_119035 ?auto_119038 ) ) ( not ( = ?auto_119035 ?auto_119039 ) ) ( not ( = ?auto_119035 ?auto_119040 ) ) ( not ( = ?auto_119036 ?auto_119037 ) ) ( not ( = ?auto_119036 ?auto_119038 ) ) ( not ( = ?auto_119036 ?auto_119039 ) ) ( not ( = ?auto_119036 ?auto_119040 ) ) ( not ( = ?auto_119037 ?auto_119038 ) ) ( not ( = ?auto_119037 ?auto_119039 ) ) ( not ( = ?auto_119037 ?auto_119040 ) ) ( not ( = ?auto_119038 ?auto_119039 ) ) ( not ( = ?auto_119038 ?auto_119040 ) ) ( not ( = ?auto_119039 ?auto_119040 ) ) ( ON ?auto_119038 ?auto_119039 ) ( ON ?auto_119037 ?auto_119038 ) ( ON ?auto_119036 ?auto_119037 ) ( ON ?auto_119035 ?auto_119036 ) ( CLEAR ?auto_119033 ) ( ON ?auto_119034 ?auto_119035 ) ( CLEAR ?auto_119034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119030 ?auto_119031 ?auto_119032 ?auto_119033 ?auto_119034 )
      ( MAKE-10PILE ?auto_119030 ?auto_119031 ?auto_119032 ?auto_119033 ?auto_119034 ?auto_119035 ?auto_119036 ?auto_119037 ?auto_119038 ?auto_119039 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119051 - BLOCK
      ?auto_119052 - BLOCK
      ?auto_119053 - BLOCK
      ?auto_119054 - BLOCK
      ?auto_119055 - BLOCK
      ?auto_119056 - BLOCK
      ?auto_119057 - BLOCK
      ?auto_119058 - BLOCK
      ?auto_119059 - BLOCK
      ?auto_119060 - BLOCK
    )
    :vars
    (
      ?auto_119061 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119060 ?auto_119061 ) ( ON-TABLE ?auto_119051 ) ( ON ?auto_119052 ?auto_119051 ) ( ON ?auto_119053 ?auto_119052 ) ( ON ?auto_119054 ?auto_119053 ) ( not ( = ?auto_119051 ?auto_119052 ) ) ( not ( = ?auto_119051 ?auto_119053 ) ) ( not ( = ?auto_119051 ?auto_119054 ) ) ( not ( = ?auto_119051 ?auto_119055 ) ) ( not ( = ?auto_119051 ?auto_119056 ) ) ( not ( = ?auto_119051 ?auto_119057 ) ) ( not ( = ?auto_119051 ?auto_119058 ) ) ( not ( = ?auto_119051 ?auto_119059 ) ) ( not ( = ?auto_119051 ?auto_119060 ) ) ( not ( = ?auto_119051 ?auto_119061 ) ) ( not ( = ?auto_119052 ?auto_119053 ) ) ( not ( = ?auto_119052 ?auto_119054 ) ) ( not ( = ?auto_119052 ?auto_119055 ) ) ( not ( = ?auto_119052 ?auto_119056 ) ) ( not ( = ?auto_119052 ?auto_119057 ) ) ( not ( = ?auto_119052 ?auto_119058 ) ) ( not ( = ?auto_119052 ?auto_119059 ) ) ( not ( = ?auto_119052 ?auto_119060 ) ) ( not ( = ?auto_119052 ?auto_119061 ) ) ( not ( = ?auto_119053 ?auto_119054 ) ) ( not ( = ?auto_119053 ?auto_119055 ) ) ( not ( = ?auto_119053 ?auto_119056 ) ) ( not ( = ?auto_119053 ?auto_119057 ) ) ( not ( = ?auto_119053 ?auto_119058 ) ) ( not ( = ?auto_119053 ?auto_119059 ) ) ( not ( = ?auto_119053 ?auto_119060 ) ) ( not ( = ?auto_119053 ?auto_119061 ) ) ( not ( = ?auto_119054 ?auto_119055 ) ) ( not ( = ?auto_119054 ?auto_119056 ) ) ( not ( = ?auto_119054 ?auto_119057 ) ) ( not ( = ?auto_119054 ?auto_119058 ) ) ( not ( = ?auto_119054 ?auto_119059 ) ) ( not ( = ?auto_119054 ?auto_119060 ) ) ( not ( = ?auto_119054 ?auto_119061 ) ) ( not ( = ?auto_119055 ?auto_119056 ) ) ( not ( = ?auto_119055 ?auto_119057 ) ) ( not ( = ?auto_119055 ?auto_119058 ) ) ( not ( = ?auto_119055 ?auto_119059 ) ) ( not ( = ?auto_119055 ?auto_119060 ) ) ( not ( = ?auto_119055 ?auto_119061 ) ) ( not ( = ?auto_119056 ?auto_119057 ) ) ( not ( = ?auto_119056 ?auto_119058 ) ) ( not ( = ?auto_119056 ?auto_119059 ) ) ( not ( = ?auto_119056 ?auto_119060 ) ) ( not ( = ?auto_119056 ?auto_119061 ) ) ( not ( = ?auto_119057 ?auto_119058 ) ) ( not ( = ?auto_119057 ?auto_119059 ) ) ( not ( = ?auto_119057 ?auto_119060 ) ) ( not ( = ?auto_119057 ?auto_119061 ) ) ( not ( = ?auto_119058 ?auto_119059 ) ) ( not ( = ?auto_119058 ?auto_119060 ) ) ( not ( = ?auto_119058 ?auto_119061 ) ) ( not ( = ?auto_119059 ?auto_119060 ) ) ( not ( = ?auto_119059 ?auto_119061 ) ) ( not ( = ?auto_119060 ?auto_119061 ) ) ( ON ?auto_119059 ?auto_119060 ) ( ON ?auto_119058 ?auto_119059 ) ( ON ?auto_119057 ?auto_119058 ) ( ON ?auto_119056 ?auto_119057 ) ( CLEAR ?auto_119054 ) ( ON ?auto_119055 ?auto_119056 ) ( CLEAR ?auto_119055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119051 ?auto_119052 ?auto_119053 ?auto_119054 ?auto_119055 )
      ( MAKE-10PILE ?auto_119051 ?auto_119052 ?auto_119053 ?auto_119054 ?auto_119055 ?auto_119056 ?auto_119057 ?auto_119058 ?auto_119059 ?auto_119060 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119072 - BLOCK
      ?auto_119073 - BLOCK
      ?auto_119074 - BLOCK
      ?auto_119075 - BLOCK
      ?auto_119076 - BLOCK
      ?auto_119077 - BLOCK
      ?auto_119078 - BLOCK
      ?auto_119079 - BLOCK
      ?auto_119080 - BLOCK
      ?auto_119081 - BLOCK
    )
    :vars
    (
      ?auto_119082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119081 ?auto_119082 ) ( ON-TABLE ?auto_119072 ) ( ON ?auto_119073 ?auto_119072 ) ( ON ?auto_119074 ?auto_119073 ) ( not ( = ?auto_119072 ?auto_119073 ) ) ( not ( = ?auto_119072 ?auto_119074 ) ) ( not ( = ?auto_119072 ?auto_119075 ) ) ( not ( = ?auto_119072 ?auto_119076 ) ) ( not ( = ?auto_119072 ?auto_119077 ) ) ( not ( = ?auto_119072 ?auto_119078 ) ) ( not ( = ?auto_119072 ?auto_119079 ) ) ( not ( = ?auto_119072 ?auto_119080 ) ) ( not ( = ?auto_119072 ?auto_119081 ) ) ( not ( = ?auto_119072 ?auto_119082 ) ) ( not ( = ?auto_119073 ?auto_119074 ) ) ( not ( = ?auto_119073 ?auto_119075 ) ) ( not ( = ?auto_119073 ?auto_119076 ) ) ( not ( = ?auto_119073 ?auto_119077 ) ) ( not ( = ?auto_119073 ?auto_119078 ) ) ( not ( = ?auto_119073 ?auto_119079 ) ) ( not ( = ?auto_119073 ?auto_119080 ) ) ( not ( = ?auto_119073 ?auto_119081 ) ) ( not ( = ?auto_119073 ?auto_119082 ) ) ( not ( = ?auto_119074 ?auto_119075 ) ) ( not ( = ?auto_119074 ?auto_119076 ) ) ( not ( = ?auto_119074 ?auto_119077 ) ) ( not ( = ?auto_119074 ?auto_119078 ) ) ( not ( = ?auto_119074 ?auto_119079 ) ) ( not ( = ?auto_119074 ?auto_119080 ) ) ( not ( = ?auto_119074 ?auto_119081 ) ) ( not ( = ?auto_119074 ?auto_119082 ) ) ( not ( = ?auto_119075 ?auto_119076 ) ) ( not ( = ?auto_119075 ?auto_119077 ) ) ( not ( = ?auto_119075 ?auto_119078 ) ) ( not ( = ?auto_119075 ?auto_119079 ) ) ( not ( = ?auto_119075 ?auto_119080 ) ) ( not ( = ?auto_119075 ?auto_119081 ) ) ( not ( = ?auto_119075 ?auto_119082 ) ) ( not ( = ?auto_119076 ?auto_119077 ) ) ( not ( = ?auto_119076 ?auto_119078 ) ) ( not ( = ?auto_119076 ?auto_119079 ) ) ( not ( = ?auto_119076 ?auto_119080 ) ) ( not ( = ?auto_119076 ?auto_119081 ) ) ( not ( = ?auto_119076 ?auto_119082 ) ) ( not ( = ?auto_119077 ?auto_119078 ) ) ( not ( = ?auto_119077 ?auto_119079 ) ) ( not ( = ?auto_119077 ?auto_119080 ) ) ( not ( = ?auto_119077 ?auto_119081 ) ) ( not ( = ?auto_119077 ?auto_119082 ) ) ( not ( = ?auto_119078 ?auto_119079 ) ) ( not ( = ?auto_119078 ?auto_119080 ) ) ( not ( = ?auto_119078 ?auto_119081 ) ) ( not ( = ?auto_119078 ?auto_119082 ) ) ( not ( = ?auto_119079 ?auto_119080 ) ) ( not ( = ?auto_119079 ?auto_119081 ) ) ( not ( = ?auto_119079 ?auto_119082 ) ) ( not ( = ?auto_119080 ?auto_119081 ) ) ( not ( = ?auto_119080 ?auto_119082 ) ) ( not ( = ?auto_119081 ?auto_119082 ) ) ( ON ?auto_119080 ?auto_119081 ) ( ON ?auto_119079 ?auto_119080 ) ( ON ?auto_119078 ?auto_119079 ) ( ON ?auto_119077 ?auto_119078 ) ( ON ?auto_119076 ?auto_119077 ) ( CLEAR ?auto_119074 ) ( ON ?auto_119075 ?auto_119076 ) ( CLEAR ?auto_119075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119072 ?auto_119073 ?auto_119074 ?auto_119075 )
      ( MAKE-10PILE ?auto_119072 ?auto_119073 ?auto_119074 ?auto_119075 ?auto_119076 ?auto_119077 ?auto_119078 ?auto_119079 ?auto_119080 ?auto_119081 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119093 - BLOCK
      ?auto_119094 - BLOCK
      ?auto_119095 - BLOCK
      ?auto_119096 - BLOCK
      ?auto_119097 - BLOCK
      ?auto_119098 - BLOCK
      ?auto_119099 - BLOCK
      ?auto_119100 - BLOCK
      ?auto_119101 - BLOCK
      ?auto_119102 - BLOCK
    )
    :vars
    (
      ?auto_119103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119102 ?auto_119103 ) ( ON-TABLE ?auto_119093 ) ( ON ?auto_119094 ?auto_119093 ) ( ON ?auto_119095 ?auto_119094 ) ( not ( = ?auto_119093 ?auto_119094 ) ) ( not ( = ?auto_119093 ?auto_119095 ) ) ( not ( = ?auto_119093 ?auto_119096 ) ) ( not ( = ?auto_119093 ?auto_119097 ) ) ( not ( = ?auto_119093 ?auto_119098 ) ) ( not ( = ?auto_119093 ?auto_119099 ) ) ( not ( = ?auto_119093 ?auto_119100 ) ) ( not ( = ?auto_119093 ?auto_119101 ) ) ( not ( = ?auto_119093 ?auto_119102 ) ) ( not ( = ?auto_119093 ?auto_119103 ) ) ( not ( = ?auto_119094 ?auto_119095 ) ) ( not ( = ?auto_119094 ?auto_119096 ) ) ( not ( = ?auto_119094 ?auto_119097 ) ) ( not ( = ?auto_119094 ?auto_119098 ) ) ( not ( = ?auto_119094 ?auto_119099 ) ) ( not ( = ?auto_119094 ?auto_119100 ) ) ( not ( = ?auto_119094 ?auto_119101 ) ) ( not ( = ?auto_119094 ?auto_119102 ) ) ( not ( = ?auto_119094 ?auto_119103 ) ) ( not ( = ?auto_119095 ?auto_119096 ) ) ( not ( = ?auto_119095 ?auto_119097 ) ) ( not ( = ?auto_119095 ?auto_119098 ) ) ( not ( = ?auto_119095 ?auto_119099 ) ) ( not ( = ?auto_119095 ?auto_119100 ) ) ( not ( = ?auto_119095 ?auto_119101 ) ) ( not ( = ?auto_119095 ?auto_119102 ) ) ( not ( = ?auto_119095 ?auto_119103 ) ) ( not ( = ?auto_119096 ?auto_119097 ) ) ( not ( = ?auto_119096 ?auto_119098 ) ) ( not ( = ?auto_119096 ?auto_119099 ) ) ( not ( = ?auto_119096 ?auto_119100 ) ) ( not ( = ?auto_119096 ?auto_119101 ) ) ( not ( = ?auto_119096 ?auto_119102 ) ) ( not ( = ?auto_119096 ?auto_119103 ) ) ( not ( = ?auto_119097 ?auto_119098 ) ) ( not ( = ?auto_119097 ?auto_119099 ) ) ( not ( = ?auto_119097 ?auto_119100 ) ) ( not ( = ?auto_119097 ?auto_119101 ) ) ( not ( = ?auto_119097 ?auto_119102 ) ) ( not ( = ?auto_119097 ?auto_119103 ) ) ( not ( = ?auto_119098 ?auto_119099 ) ) ( not ( = ?auto_119098 ?auto_119100 ) ) ( not ( = ?auto_119098 ?auto_119101 ) ) ( not ( = ?auto_119098 ?auto_119102 ) ) ( not ( = ?auto_119098 ?auto_119103 ) ) ( not ( = ?auto_119099 ?auto_119100 ) ) ( not ( = ?auto_119099 ?auto_119101 ) ) ( not ( = ?auto_119099 ?auto_119102 ) ) ( not ( = ?auto_119099 ?auto_119103 ) ) ( not ( = ?auto_119100 ?auto_119101 ) ) ( not ( = ?auto_119100 ?auto_119102 ) ) ( not ( = ?auto_119100 ?auto_119103 ) ) ( not ( = ?auto_119101 ?auto_119102 ) ) ( not ( = ?auto_119101 ?auto_119103 ) ) ( not ( = ?auto_119102 ?auto_119103 ) ) ( ON ?auto_119101 ?auto_119102 ) ( ON ?auto_119100 ?auto_119101 ) ( ON ?auto_119099 ?auto_119100 ) ( ON ?auto_119098 ?auto_119099 ) ( ON ?auto_119097 ?auto_119098 ) ( CLEAR ?auto_119095 ) ( ON ?auto_119096 ?auto_119097 ) ( CLEAR ?auto_119096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119093 ?auto_119094 ?auto_119095 ?auto_119096 )
      ( MAKE-10PILE ?auto_119093 ?auto_119094 ?auto_119095 ?auto_119096 ?auto_119097 ?auto_119098 ?auto_119099 ?auto_119100 ?auto_119101 ?auto_119102 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119114 - BLOCK
      ?auto_119115 - BLOCK
      ?auto_119116 - BLOCK
      ?auto_119117 - BLOCK
      ?auto_119118 - BLOCK
      ?auto_119119 - BLOCK
      ?auto_119120 - BLOCK
      ?auto_119121 - BLOCK
      ?auto_119122 - BLOCK
      ?auto_119123 - BLOCK
    )
    :vars
    (
      ?auto_119124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119123 ?auto_119124 ) ( ON-TABLE ?auto_119114 ) ( ON ?auto_119115 ?auto_119114 ) ( not ( = ?auto_119114 ?auto_119115 ) ) ( not ( = ?auto_119114 ?auto_119116 ) ) ( not ( = ?auto_119114 ?auto_119117 ) ) ( not ( = ?auto_119114 ?auto_119118 ) ) ( not ( = ?auto_119114 ?auto_119119 ) ) ( not ( = ?auto_119114 ?auto_119120 ) ) ( not ( = ?auto_119114 ?auto_119121 ) ) ( not ( = ?auto_119114 ?auto_119122 ) ) ( not ( = ?auto_119114 ?auto_119123 ) ) ( not ( = ?auto_119114 ?auto_119124 ) ) ( not ( = ?auto_119115 ?auto_119116 ) ) ( not ( = ?auto_119115 ?auto_119117 ) ) ( not ( = ?auto_119115 ?auto_119118 ) ) ( not ( = ?auto_119115 ?auto_119119 ) ) ( not ( = ?auto_119115 ?auto_119120 ) ) ( not ( = ?auto_119115 ?auto_119121 ) ) ( not ( = ?auto_119115 ?auto_119122 ) ) ( not ( = ?auto_119115 ?auto_119123 ) ) ( not ( = ?auto_119115 ?auto_119124 ) ) ( not ( = ?auto_119116 ?auto_119117 ) ) ( not ( = ?auto_119116 ?auto_119118 ) ) ( not ( = ?auto_119116 ?auto_119119 ) ) ( not ( = ?auto_119116 ?auto_119120 ) ) ( not ( = ?auto_119116 ?auto_119121 ) ) ( not ( = ?auto_119116 ?auto_119122 ) ) ( not ( = ?auto_119116 ?auto_119123 ) ) ( not ( = ?auto_119116 ?auto_119124 ) ) ( not ( = ?auto_119117 ?auto_119118 ) ) ( not ( = ?auto_119117 ?auto_119119 ) ) ( not ( = ?auto_119117 ?auto_119120 ) ) ( not ( = ?auto_119117 ?auto_119121 ) ) ( not ( = ?auto_119117 ?auto_119122 ) ) ( not ( = ?auto_119117 ?auto_119123 ) ) ( not ( = ?auto_119117 ?auto_119124 ) ) ( not ( = ?auto_119118 ?auto_119119 ) ) ( not ( = ?auto_119118 ?auto_119120 ) ) ( not ( = ?auto_119118 ?auto_119121 ) ) ( not ( = ?auto_119118 ?auto_119122 ) ) ( not ( = ?auto_119118 ?auto_119123 ) ) ( not ( = ?auto_119118 ?auto_119124 ) ) ( not ( = ?auto_119119 ?auto_119120 ) ) ( not ( = ?auto_119119 ?auto_119121 ) ) ( not ( = ?auto_119119 ?auto_119122 ) ) ( not ( = ?auto_119119 ?auto_119123 ) ) ( not ( = ?auto_119119 ?auto_119124 ) ) ( not ( = ?auto_119120 ?auto_119121 ) ) ( not ( = ?auto_119120 ?auto_119122 ) ) ( not ( = ?auto_119120 ?auto_119123 ) ) ( not ( = ?auto_119120 ?auto_119124 ) ) ( not ( = ?auto_119121 ?auto_119122 ) ) ( not ( = ?auto_119121 ?auto_119123 ) ) ( not ( = ?auto_119121 ?auto_119124 ) ) ( not ( = ?auto_119122 ?auto_119123 ) ) ( not ( = ?auto_119122 ?auto_119124 ) ) ( not ( = ?auto_119123 ?auto_119124 ) ) ( ON ?auto_119122 ?auto_119123 ) ( ON ?auto_119121 ?auto_119122 ) ( ON ?auto_119120 ?auto_119121 ) ( ON ?auto_119119 ?auto_119120 ) ( ON ?auto_119118 ?auto_119119 ) ( ON ?auto_119117 ?auto_119118 ) ( CLEAR ?auto_119115 ) ( ON ?auto_119116 ?auto_119117 ) ( CLEAR ?auto_119116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119114 ?auto_119115 ?auto_119116 )
      ( MAKE-10PILE ?auto_119114 ?auto_119115 ?auto_119116 ?auto_119117 ?auto_119118 ?auto_119119 ?auto_119120 ?auto_119121 ?auto_119122 ?auto_119123 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119135 - BLOCK
      ?auto_119136 - BLOCK
      ?auto_119137 - BLOCK
      ?auto_119138 - BLOCK
      ?auto_119139 - BLOCK
      ?auto_119140 - BLOCK
      ?auto_119141 - BLOCK
      ?auto_119142 - BLOCK
      ?auto_119143 - BLOCK
      ?auto_119144 - BLOCK
    )
    :vars
    (
      ?auto_119145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119144 ?auto_119145 ) ( ON-TABLE ?auto_119135 ) ( ON ?auto_119136 ?auto_119135 ) ( not ( = ?auto_119135 ?auto_119136 ) ) ( not ( = ?auto_119135 ?auto_119137 ) ) ( not ( = ?auto_119135 ?auto_119138 ) ) ( not ( = ?auto_119135 ?auto_119139 ) ) ( not ( = ?auto_119135 ?auto_119140 ) ) ( not ( = ?auto_119135 ?auto_119141 ) ) ( not ( = ?auto_119135 ?auto_119142 ) ) ( not ( = ?auto_119135 ?auto_119143 ) ) ( not ( = ?auto_119135 ?auto_119144 ) ) ( not ( = ?auto_119135 ?auto_119145 ) ) ( not ( = ?auto_119136 ?auto_119137 ) ) ( not ( = ?auto_119136 ?auto_119138 ) ) ( not ( = ?auto_119136 ?auto_119139 ) ) ( not ( = ?auto_119136 ?auto_119140 ) ) ( not ( = ?auto_119136 ?auto_119141 ) ) ( not ( = ?auto_119136 ?auto_119142 ) ) ( not ( = ?auto_119136 ?auto_119143 ) ) ( not ( = ?auto_119136 ?auto_119144 ) ) ( not ( = ?auto_119136 ?auto_119145 ) ) ( not ( = ?auto_119137 ?auto_119138 ) ) ( not ( = ?auto_119137 ?auto_119139 ) ) ( not ( = ?auto_119137 ?auto_119140 ) ) ( not ( = ?auto_119137 ?auto_119141 ) ) ( not ( = ?auto_119137 ?auto_119142 ) ) ( not ( = ?auto_119137 ?auto_119143 ) ) ( not ( = ?auto_119137 ?auto_119144 ) ) ( not ( = ?auto_119137 ?auto_119145 ) ) ( not ( = ?auto_119138 ?auto_119139 ) ) ( not ( = ?auto_119138 ?auto_119140 ) ) ( not ( = ?auto_119138 ?auto_119141 ) ) ( not ( = ?auto_119138 ?auto_119142 ) ) ( not ( = ?auto_119138 ?auto_119143 ) ) ( not ( = ?auto_119138 ?auto_119144 ) ) ( not ( = ?auto_119138 ?auto_119145 ) ) ( not ( = ?auto_119139 ?auto_119140 ) ) ( not ( = ?auto_119139 ?auto_119141 ) ) ( not ( = ?auto_119139 ?auto_119142 ) ) ( not ( = ?auto_119139 ?auto_119143 ) ) ( not ( = ?auto_119139 ?auto_119144 ) ) ( not ( = ?auto_119139 ?auto_119145 ) ) ( not ( = ?auto_119140 ?auto_119141 ) ) ( not ( = ?auto_119140 ?auto_119142 ) ) ( not ( = ?auto_119140 ?auto_119143 ) ) ( not ( = ?auto_119140 ?auto_119144 ) ) ( not ( = ?auto_119140 ?auto_119145 ) ) ( not ( = ?auto_119141 ?auto_119142 ) ) ( not ( = ?auto_119141 ?auto_119143 ) ) ( not ( = ?auto_119141 ?auto_119144 ) ) ( not ( = ?auto_119141 ?auto_119145 ) ) ( not ( = ?auto_119142 ?auto_119143 ) ) ( not ( = ?auto_119142 ?auto_119144 ) ) ( not ( = ?auto_119142 ?auto_119145 ) ) ( not ( = ?auto_119143 ?auto_119144 ) ) ( not ( = ?auto_119143 ?auto_119145 ) ) ( not ( = ?auto_119144 ?auto_119145 ) ) ( ON ?auto_119143 ?auto_119144 ) ( ON ?auto_119142 ?auto_119143 ) ( ON ?auto_119141 ?auto_119142 ) ( ON ?auto_119140 ?auto_119141 ) ( ON ?auto_119139 ?auto_119140 ) ( ON ?auto_119138 ?auto_119139 ) ( CLEAR ?auto_119136 ) ( ON ?auto_119137 ?auto_119138 ) ( CLEAR ?auto_119137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119135 ?auto_119136 ?auto_119137 )
      ( MAKE-10PILE ?auto_119135 ?auto_119136 ?auto_119137 ?auto_119138 ?auto_119139 ?auto_119140 ?auto_119141 ?auto_119142 ?auto_119143 ?auto_119144 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119156 - BLOCK
      ?auto_119157 - BLOCK
      ?auto_119158 - BLOCK
      ?auto_119159 - BLOCK
      ?auto_119160 - BLOCK
      ?auto_119161 - BLOCK
      ?auto_119162 - BLOCK
      ?auto_119163 - BLOCK
      ?auto_119164 - BLOCK
      ?auto_119165 - BLOCK
    )
    :vars
    (
      ?auto_119166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119165 ?auto_119166 ) ( ON-TABLE ?auto_119156 ) ( not ( = ?auto_119156 ?auto_119157 ) ) ( not ( = ?auto_119156 ?auto_119158 ) ) ( not ( = ?auto_119156 ?auto_119159 ) ) ( not ( = ?auto_119156 ?auto_119160 ) ) ( not ( = ?auto_119156 ?auto_119161 ) ) ( not ( = ?auto_119156 ?auto_119162 ) ) ( not ( = ?auto_119156 ?auto_119163 ) ) ( not ( = ?auto_119156 ?auto_119164 ) ) ( not ( = ?auto_119156 ?auto_119165 ) ) ( not ( = ?auto_119156 ?auto_119166 ) ) ( not ( = ?auto_119157 ?auto_119158 ) ) ( not ( = ?auto_119157 ?auto_119159 ) ) ( not ( = ?auto_119157 ?auto_119160 ) ) ( not ( = ?auto_119157 ?auto_119161 ) ) ( not ( = ?auto_119157 ?auto_119162 ) ) ( not ( = ?auto_119157 ?auto_119163 ) ) ( not ( = ?auto_119157 ?auto_119164 ) ) ( not ( = ?auto_119157 ?auto_119165 ) ) ( not ( = ?auto_119157 ?auto_119166 ) ) ( not ( = ?auto_119158 ?auto_119159 ) ) ( not ( = ?auto_119158 ?auto_119160 ) ) ( not ( = ?auto_119158 ?auto_119161 ) ) ( not ( = ?auto_119158 ?auto_119162 ) ) ( not ( = ?auto_119158 ?auto_119163 ) ) ( not ( = ?auto_119158 ?auto_119164 ) ) ( not ( = ?auto_119158 ?auto_119165 ) ) ( not ( = ?auto_119158 ?auto_119166 ) ) ( not ( = ?auto_119159 ?auto_119160 ) ) ( not ( = ?auto_119159 ?auto_119161 ) ) ( not ( = ?auto_119159 ?auto_119162 ) ) ( not ( = ?auto_119159 ?auto_119163 ) ) ( not ( = ?auto_119159 ?auto_119164 ) ) ( not ( = ?auto_119159 ?auto_119165 ) ) ( not ( = ?auto_119159 ?auto_119166 ) ) ( not ( = ?auto_119160 ?auto_119161 ) ) ( not ( = ?auto_119160 ?auto_119162 ) ) ( not ( = ?auto_119160 ?auto_119163 ) ) ( not ( = ?auto_119160 ?auto_119164 ) ) ( not ( = ?auto_119160 ?auto_119165 ) ) ( not ( = ?auto_119160 ?auto_119166 ) ) ( not ( = ?auto_119161 ?auto_119162 ) ) ( not ( = ?auto_119161 ?auto_119163 ) ) ( not ( = ?auto_119161 ?auto_119164 ) ) ( not ( = ?auto_119161 ?auto_119165 ) ) ( not ( = ?auto_119161 ?auto_119166 ) ) ( not ( = ?auto_119162 ?auto_119163 ) ) ( not ( = ?auto_119162 ?auto_119164 ) ) ( not ( = ?auto_119162 ?auto_119165 ) ) ( not ( = ?auto_119162 ?auto_119166 ) ) ( not ( = ?auto_119163 ?auto_119164 ) ) ( not ( = ?auto_119163 ?auto_119165 ) ) ( not ( = ?auto_119163 ?auto_119166 ) ) ( not ( = ?auto_119164 ?auto_119165 ) ) ( not ( = ?auto_119164 ?auto_119166 ) ) ( not ( = ?auto_119165 ?auto_119166 ) ) ( ON ?auto_119164 ?auto_119165 ) ( ON ?auto_119163 ?auto_119164 ) ( ON ?auto_119162 ?auto_119163 ) ( ON ?auto_119161 ?auto_119162 ) ( ON ?auto_119160 ?auto_119161 ) ( ON ?auto_119159 ?auto_119160 ) ( ON ?auto_119158 ?auto_119159 ) ( CLEAR ?auto_119156 ) ( ON ?auto_119157 ?auto_119158 ) ( CLEAR ?auto_119157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119156 ?auto_119157 )
      ( MAKE-10PILE ?auto_119156 ?auto_119157 ?auto_119158 ?auto_119159 ?auto_119160 ?auto_119161 ?auto_119162 ?auto_119163 ?auto_119164 ?auto_119165 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119177 - BLOCK
      ?auto_119178 - BLOCK
      ?auto_119179 - BLOCK
      ?auto_119180 - BLOCK
      ?auto_119181 - BLOCK
      ?auto_119182 - BLOCK
      ?auto_119183 - BLOCK
      ?auto_119184 - BLOCK
      ?auto_119185 - BLOCK
      ?auto_119186 - BLOCK
    )
    :vars
    (
      ?auto_119187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119186 ?auto_119187 ) ( ON-TABLE ?auto_119177 ) ( not ( = ?auto_119177 ?auto_119178 ) ) ( not ( = ?auto_119177 ?auto_119179 ) ) ( not ( = ?auto_119177 ?auto_119180 ) ) ( not ( = ?auto_119177 ?auto_119181 ) ) ( not ( = ?auto_119177 ?auto_119182 ) ) ( not ( = ?auto_119177 ?auto_119183 ) ) ( not ( = ?auto_119177 ?auto_119184 ) ) ( not ( = ?auto_119177 ?auto_119185 ) ) ( not ( = ?auto_119177 ?auto_119186 ) ) ( not ( = ?auto_119177 ?auto_119187 ) ) ( not ( = ?auto_119178 ?auto_119179 ) ) ( not ( = ?auto_119178 ?auto_119180 ) ) ( not ( = ?auto_119178 ?auto_119181 ) ) ( not ( = ?auto_119178 ?auto_119182 ) ) ( not ( = ?auto_119178 ?auto_119183 ) ) ( not ( = ?auto_119178 ?auto_119184 ) ) ( not ( = ?auto_119178 ?auto_119185 ) ) ( not ( = ?auto_119178 ?auto_119186 ) ) ( not ( = ?auto_119178 ?auto_119187 ) ) ( not ( = ?auto_119179 ?auto_119180 ) ) ( not ( = ?auto_119179 ?auto_119181 ) ) ( not ( = ?auto_119179 ?auto_119182 ) ) ( not ( = ?auto_119179 ?auto_119183 ) ) ( not ( = ?auto_119179 ?auto_119184 ) ) ( not ( = ?auto_119179 ?auto_119185 ) ) ( not ( = ?auto_119179 ?auto_119186 ) ) ( not ( = ?auto_119179 ?auto_119187 ) ) ( not ( = ?auto_119180 ?auto_119181 ) ) ( not ( = ?auto_119180 ?auto_119182 ) ) ( not ( = ?auto_119180 ?auto_119183 ) ) ( not ( = ?auto_119180 ?auto_119184 ) ) ( not ( = ?auto_119180 ?auto_119185 ) ) ( not ( = ?auto_119180 ?auto_119186 ) ) ( not ( = ?auto_119180 ?auto_119187 ) ) ( not ( = ?auto_119181 ?auto_119182 ) ) ( not ( = ?auto_119181 ?auto_119183 ) ) ( not ( = ?auto_119181 ?auto_119184 ) ) ( not ( = ?auto_119181 ?auto_119185 ) ) ( not ( = ?auto_119181 ?auto_119186 ) ) ( not ( = ?auto_119181 ?auto_119187 ) ) ( not ( = ?auto_119182 ?auto_119183 ) ) ( not ( = ?auto_119182 ?auto_119184 ) ) ( not ( = ?auto_119182 ?auto_119185 ) ) ( not ( = ?auto_119182 ?auto_119186 ) ) ( not ( = ?auto_119182 ?auto_119187 ) ) ( not ( = ?auto_119183 ?auto_119184 ) ) ( not ( = ?auto_119183 ?auto_119185 ) ) ( not ( = ?auto_119183 ?auto_119186 ) ) ( not ( = ?auto_119183 ?auto_119187 ) ) ( not ( = ?auto_119184 ?auto_119185 ) ) ( not ( = ?auto_119184 ?auto_119186 ) ) ( not ( = ?auto_119184 ?auto_119187 ) ) ( not ( = ?auto_119185 ?auto_119186 ) ) ( not ( = ?auto_119185 ?auto_119187 ) ) ( not ( = ?auto_119186 ?auto_119187 ) ) ( ON ?auto_119185 ?auto_119186 ) ( ON ?auto_119184 ?auto_119185 ) ( ON ?auto_119183 ?auto_119184 ) ( ON ?auto_119182 ?auto_119183 ) ( ON ?auto_119181 ?auto_119182 ) ( ON ?auto_119180 ?auto_119181 ) ( ON ?auto_119179 ?auto_119180 ) ( CLEAR ?auto_119177 ) ( ON ?auto_119178 ?auto_119179 ) ( CLEAR ?auto_119178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119177 ?auto_119178 )
      ( MAKE-10PILE ?auto_119177 ?auto_119178 ?auto_119179 ?auto_119180 ?auto_119181 ?auto_119182 ?auto_119183 ?auto_119184 ?auto_119185 ?auto_119186 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119198 - BLOCK
      ?auto_119199 - BLOCK
      ?auto_119200 - BLOCK
      ?auto_119201 - BLOCK
      ?auto_119202 - BLOCK
      ?auto_119203 - BLOCK
      ?auto_119204 - BLOCK
      ?auto_119205 - BLOCK
      ?auto_119206 - BLOCK
      ?auto_119207 - BLOCK
    )
    :vars
    (
      ?auto_119208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119207 ?auto_119208 ) ( not ( = ?auto_119198 ?auto_119199 ) ) ( not ( = ?auto_119198 ?auto_119200 ) ) ( not ( = ?auto_119198 ?auto_119201 ) ) ( not ( = ?auto_119198 ?auto_119202 ) ) ( not ( = ?auto_119198 ?auto_119203 ) ) ( not ( = ?auto_119198 ?auto_119204 ) ) ( not ( = ?auto_119198 ?auto_119205 ) ) ( not ( = ?auto_119198 ?auto_119206 ) ) ( not ( = ?auto_119198 ?auto_119207 ) ) ( not ( = ?auto_119198 ?auto_119208 ) ) ( not ( = ?auto_119199 ?auto_119200 ) ) ( not ( = ?auto_119199 ?auto_119201 ) ) ( not ( = ?auto_119199 ?auto_119202 ) ) ( not ( = ?auto_119199 ?auto_119203 ) ) ( not ( = ?auto_119199 ?auto_119204 ) ) ( not ( = ?auto_119199 ?auto_119205 ) ) ( not ( = ?auto_119199 ?auto_119206 ) ) ( not ( = ?auto_119199 ?auto_119207 ) ) ( not ( = ?auto_119199 ?auto_119208 ) ) ( not ( = ?auto_119200 ?auto_119201 ) ) ( not ( = ?auto_119200 ?auto_119202 ) ) ( not ( = ?auto_119200 ?auto_119203 ) ) ( not ( = ?auto_119200 ?auto_119204 ) ) ( not ( = ?auto_119200 ?auto_119205 ) ) ( not ( = ?auto_119200 ?auto_119206 ) ) ( not ( = ?auto_119200 ?auto_119207 ) ) ( not ( = ?auto_119200 ?auto_119208 ) ) ( not ( = ?auto_119201 ?auto_119202 ) ) ( not ( = ?auto_119201 ?auto_119203 ) ) ( not ( = ?auto_119201 ?auto_119204 ) ) ( not ( = ?auto_119201 ?auto_119205 ) ) ( not ( = ?auto_119201 ?auto_119206 ) ) ( not ( = ?auto_119201 ?auto_119207 ) ) ( not ( = ?auto_119201 ?auto_119208 ) ) ( not ( = ?auto_119202 ?auto_119203 ) ) ( not ( = ?auto_119202 ?auto_119204 ) ) ( not ( = ?auto_119202 ?auto_119205 ) ) ( not ( = ?auto_119202 ?auto_119206 ) ) ( not ( = ?auto_119202 ?auto_119207 ) ) ( not ( = ?auto_119202 ?auto_119208 ) ) ( not ( = ?auto_119203 ?auto_119204 ) ) ( not ( = ?auto_119203 ?auto_119205 ) ) ( not ( = ?auto_119203 ?auto_119206 ) ) ( not ( = ?auto_119203 ?auto_119207 ) ) ( not ( = ?auto_119203 ?auto_119208 ) ) ( not ( = ?auto_119204 ?auto_119205 ) ) ( not ( = ?auto_119204 ?auto_119206 ) ) ( not ( = ?auto_119204 ?auto_119207 ) ) ( not ( = ?auto_119204 ?auto_119208 ) ) ( not ( = ?auto_119205 ?auto_119206 ) ) ( not ( = ?auto_119205 ?auto_119207 ) ) ( not ( = ?auto_119205 ?auto_119208 ) ) ( not ( = ?auto_119206 ?auto_119207 ) ) ( not ( = ?auto_119206 ?auto_119208 ) ) ( not ( = ?auto_119207 ?auto_119208 ) ) ( ON ?auto_119206 ?auto_119207 ) ( ON ?auto_119205 ?auto_119206 ) ( ON ?auto_119204 ?auto_119205 ) ( ON ?auto_119203 ?auto_119204 ) ( ON ?auto_119202 ?auto_119203 ) ( ON ?auto_119201 ?auto_119202 ) ( ON ?auto_119200 ?auto_119201 ) ( ON ?auto_119199 ?auto_119200 ) ( ON ?auto_119198 ?auto_119199 ) ( CLEAR ?auto_119198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119198 )
      ( MAKE-10PILE ?auto_119198 ?auto_119199 ?auto_119200 ?auto_119201 ?auto_119202 ?auto_119203 ?auto_119204 ?auto_119205 ?auto_119206 ?auto_119207 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_119219 - BLOCK
      ?auto_119220 - BLOCK
      ?auto_119221 - BLOCK
      ?auto_119222 - BLOCK
      ?auto_119223 - BLOCK
      ?auto_119224 - BLOCK
      ?auto_119225 - BLOCK
      ?auto_119226 - BLOCK
      ?auto_119227 - BLOCK
      ?auto_119228 - BLOCK
    )
    :vars
    (
      ?auto_119229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119228 ?auto_119229 ) ( not ( = ?auto_119219 ?auto_119220 ) ) ( not ( = ?auto_119219 ?auto_119221 ) ) ( not ( = ?auto_119219 ?auto_119222 ) ) ( not ( = ?auto_119219 ?auto_119223 ) ) ( not ( = ?auto_119219 ?auto_119224 ) ) ( not ( = ?auto_119219 ?auto_119225 ) ) ( not ( = ?auto_119219 ?auto_119226 ) ) ( not ( = ?auto_119219 ?auto_119227 ) ) ( not ( = ?auto_119219 ?auto_119228 ) ) ( not ( = ?auto_119219 ?auto_119229 ) ) ( not ( = ?auto_119220 ?auto_119221 ) ) ( not ( = ?auto_119220 ?auto_119222 ) ) ( not ( = ?auto_119220 ?auto_119223 ) ) ( not ( = ?auto_119220 ?auto_119224 ) ) ( not ( = ?auto_119220 ?auto_119225 ) ) ( not ( = ?auto_119220 ?auto_119226 ) ) ( not ( = ?auto_119220 ?auto_119227 ) ) ( not ( = ?auto_119220 ?auto_119228 ) ) ( not ( = ?auto_119220 ?auto_119229 ) ) ( not ( = ?auto_119221 ?auto_119222 ) ) ( not ( = ?auto_119221 ?auto_119223 ) ) ( not ( = ?auto_119221 ?auto_119224 ) ) ( not ( = ?auto_119221 ?auto_119225 ) ) ( not ( = ?auto_119221 ?auto_119226 ) ) ( not ( = ?auto_119221 ?auto_119227 ) ) ( not ( = ?auto_119221 ?auto_119228 ) ) ( not ( = ?auto_119221 ?auto_119229 ) ) ( not ( = ?auto_119222 ?auto_119223 ) ) ( not ( = ?auto_119222 ?auto_119224 ) ) ( not ( = ?auto_119222 ?auto_119225 ) ) ( not ( = ?auto_119222 ?auto_119226 ) ) ( not ( = ?auto_119222 ?auto_119227 ) ) ( not ( = ?auto_119222 ?auto_119228 ) ) ( not ( = ?auto_119222 ?auto_119229 ) ) ( not ( = ?auto_119223 ?auto_119224 ) ) ( not ( = ?auto_119223 ?auto_119225 ) ) ( not ( = ?auto_119223 ?auto_119226 ) ) ( not ( = ?auto_119223 ?auto_119227 ) ) ( not ( = ?auto_119223 ?auto_119228 ) ) ( not ( = ?auto_119223 ?auto_119229 ) ) ( not ( = ?auto_119224 ?auto_119225 ) ) ( not ( = ?auto_119224 ?auto_119226 ) ) ( not ( = ?auto_119224 ?auto_119227 ) ) ( not ( = ?auto_119224 ?auto_119228 ) ) ( not ( = ?auto_119224 ?auto_119229 ) ) ( not ( = ?auto_119225 ?auto_119226 ) ) ( not ( = ?auto_119225 ?auto_119227 ) ) ( not ( = ?auto_119225 ?auto_119228 ) ) ( not ( = ?auto_119225 ?auto_119229 ) ) ( not ( = ?auto_119226 ?auto_119227 ) ) ( not ( = ?auto_119226 ?auto_119228 ) ) ( not ( = ?auto_119226 ?auto_119229 ) ) ( not ( = ?auto_119227 ?auto_119228 ) ) ( not ( = ?auto_119227 ?auto_119229 ) ) ( not ( = ?auto_119228 ?auto_119229 ) ) ( ON ?auto_119227 ?auto_119228 ) ( ON ?auto_119226 ?auto_119227 ) ( ON ?auto_119225 ?auto_119226 ) ( ON ?auto_119224 ?auto_119225 ) ( ON ?auto_119223 ?auto_119224 ) ( ON ?auto_119222 ?auto_119223 ) ( ON ?auto_119221 ?auto_119222 ) ( ON ?auto_119220 ?auto_119221 ) ( ON ?auto_119219 ?auto_119220 ) ( CLEAR ?auto_119219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119219 )
      ( MAKE-10PILE ?auto_119219 ?auto_119220 ?auto_119221 ?auto_119222 ?auto_119223 ?auto_119224 ?auto_119225 ?auto_119226 ?auto_119227 ?auto_119228 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119241 - BLOCK
      ?auto_119242 - BLOCK
      ?auto_119243 - BLOCK
      ?auto_119244 - BLOCK
      ?auto_119245 - BLOCK
      ?auto_119246 - BLOCK
      ?auto_119247 - BLOCK
      ?auto_119248 - BLOCK
      ?auto_119249 - BLOCK
      ?auto_119250 - BLOCK
      ?auto_119251 - BLOCK
    )
    :vars
    (
      ?auto_119252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_119250 ) ( ON ?auto_119251 ?auto_119252 ) ( CLEAR ?auto_119251 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119241 ) ( ON ?auto_119242 ?auto_119241 ) ( ON ?auto_119243 ?auto_119242 ) ( ON ?auto_119244 ?auto_119243 ) ( ON ?auto_119245 ?auto_119244 ) ( ON ?auto_119246 ?auto_119245 ) ( ON ?auto_119247 ?auto_119246 ) ( ON ?auto_119248 ?auto_119247 ) ( ON ?auto_119249 ?auto_119248 ) ( ON ?auto_119250 ?auto_119249 ) ( not ( = ?auto_119241 ?auto_119242 ) ) ( not ( = ?auto_119241 ?auto_119243 ) ) ( not ( = ?auto_119241 ?auto_119244 ) ) ( not ( = ?auto_119241 ?auto_119245 ) ) ( not ( = ?auto_119241 ?auto_119246 ) ) ( not ( = ?auto_119241 ?auto_119247 ) ) ( not ( = ?auto_119241 ?auto_119248 ) ) ( not ( = ?auto_119241 ?auto_119249 ) ) ( not ( = ?auto_119241 ?auto_119250 ) ) ( not ( = ?auto_119241 ?auto_119251 ) ) ( not ( = ?auto_119241 ?auto_119252 ) ) ( not ( = ?auto_119242 ?auto_119243 ) ) ( not ( = ?auto_119242 ?auto_119244 ) ) ( not ( = ?auto_119242 ?auto_119245 ) ) ( not ( = ?auto_119242 ?auto_119246 ) ) ( not ( = ?auto_119242 ?auto_119247 ) ) ( not ( = ?auto_119242 ?auto_119248 ) ) ( not ( = ?auto_119242 ?auto_119249 ) ) ( not ( = ?auto_119242 ?auto_119250 ) ) ( not ( = ?auto_119242 ?auto_119251 ) ) ( not ( = ?auto_119242 ?auto_119252 ) ) ( not ( = ?auto_119243 ?auto_119244 ) ) ( not ( = ?auto_119243 ?auto_119245 ) ) ( not ( = ?auto_119243 ?auto_119246 ) ) ( not ( = ?auto_119243 ?auto_119247 ) ) ( not ( = ?auto_119243 ?auto_119248 ) ) ( not ( = ?auto_119243 ?auto_119249 ) ) ( not ( = ?auto_119243 ?auto_119250 ) ) ( not ( = ?auto_119243 ?auto_119251 ) ) ( not ( = ?auto_119243 ?auto_119252 ) ) ( not ( = ?auto_119244 ?auto_119245 ) ) ( not ( = ?auto_119244 ?auto_119246 ) ) ( not ( = ?auto_119244 ?auto_119247 ) ) ( not ( = ?auto_119244 ?auto_119248 ) ) ( not ( = ?auto_119244 ?auto_119249 ) ) ( not ( = ?auto_119244 ?auto_119250 ) ) ( not ( = ?auto_119244 ?auto_119251 ) ) ( not ( = ?auto_119244 ?auto_119252 ) ) ( not ( = ?auto_119245 ?auto_119246 ) ) ( not ( = ?auto_119245 ?auto_119247 ) ) ( not ( = ?auto_119245 ?auto_119248 ) ) ( not ( = ?auto_119245 ?auto_119249 ) ) ( not ( = ?auto_119245 ?auto_119250 ) ) ( not ( = ?auto_119245 ?auto_119251 ) ) ( not ( = ?auto_119245 ?auto_119252 ) ) ( not ( = ?auto_119246 ?auto_119247 ) ) ( not ( = ?auto_119246 ?auto_119248 ) ) ( not ( = ?auto_119246 ?auto_119249 ) ) ( not ( = ?auto_119246 ?auto_119250 ) ) ( not ( = ?auto_119246 ?auto_119251 ) ) ( not ( = ?auto_119246 ?auto_119252 ) ) ( not ( = ?auto_119247 ?auto_119248 ) ) ( not ( = ?auto_119247 ?auto_119249 ) ) ( not ( = ?auto_119247 ?auto_119250 ) ) ( not ( = ?auto_119247 ?auto_119251 ) ) ( not ( = ?auto_119247 ?auto_119252 ) ) ( not ( = ?auto_119248 ?auto_119249 ) ) ( not ( = ?auto_119248 ?auto_119250 ) ) ( not ( = ?auto_119248 ?auto_119251 ) ) ( not ( = ?auto_119248 ?auto_119252 ) ) ( not ( = ?auto_119249 ?auto_119250 ) ) ( not ( = ?auto_119249 ?auto_119251 ) ) ( not ( = ?auto_119249 ?auto_119252 ) ) ( not ( = ?auto_119250 ?auto_119251 ) ) ( not ( = ?auto_119250 ?auto_119252 ) ) ( not ( = ?auto_119251 ?auto_119252 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_119251 ?auto_119252 )
      ( !STACK ?auto_119251 ?auto_119250 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119264 - BLOCK
      ?auto_119265 - BLOCK
      ?auto_119266 - BLOCK
      ?auto_119267 - BLOCK
      ?auto_119268 - BLOCK
      ?auto_119269 - BLOCK
      ?auto_119270 - BLOCK
      ?auto_119271 - BLOCK
      ?auto_119272 - BLOCK
      ?auto_119273 - BLOCK
      ?auto_119274 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_119273 ) ( ON-TABLE ?auto_119274 ) ( CLEAR ?auto_119274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_119264 ) ( ON ?auto_119265 ?auto_119264 ) ( ON ?auto_119266 ?auto_119265 ) ( ON ?auto_119267 ?auto_119266 ) ( ON ?auto_119268 ?auto_119267 ) ( ON ?auto_119269 ?auto_119268 ) ( ON ?auto_119270 ?auto_119269 ) ( ON ?auto_119271 ?auto_119270 ) ( ON ?auto_119272 ?auto_119271 ) ( ON ?auto_119273 ?auto_119272 ) ( not ( = ?auto_119264 ?auto_119265 ) ) ( not ( = ?auto_119264 ?auto_119266 ) ) ( not ( = ?auto_119264 ?auto_119267 ) ) ( not ( = ?auto_119264 ?auto_119268 ) ) ( not ( = ?auto_119264 ?auto_119269 ) ) ( not ( = ?auto_119264 ?auto_119270 ) ) ( not ( = ?auto_119264 ?auto_119271 ) ) ( not ( = ?auto_119264 ?auto_119272 ) ) ( not ( = ?auto_119264 ?auto_119273 ) ) ( not ( = ?auto_119264 ?auto_119274 ) ) ( not ( = ?auto_119265 ?auto_119266 ) ) ( not ( = ?auto_119265 ?auto_119267 ) ) ( not ( = ?auto_119265 ?auto_119268 ) ) ( not ( = ?auto_119265 ?auto_119269 ) ) ( not ( = ?auto_119265 ?auto_119270 ) ) ( not ( = ?auto_119265 ?auto_119271 ) ) ( not ( = ?auto_119265 ?auto_119272 ) ) ( not ( = ?auto_119265 ?auto_119273 ) ) ( not ( = ?auto_119265 ?auto_119274 ) ) ( not ( = ?auto_119266 ?auto_119267 ) ) ( not ( = ?auto_119266 ?auto_119268 ) ) ( not ( = ?auto_119266 ?auto_119269 ) ) ( not ( = ?auto_119266 ?auto_119270 ) ) ( not ( = ?auto_119266 ?auto_119271 ) ) ( not ( = ?auto_119266 ?auto_119272 ) ) ( not ( = ?auto_119266 ?auto_119273 ) ) ( not ( = ?auto_119266 ?auto_119274 ) ) ( not ( = ?auto_119267 ?auto_119268 ) ) ( not ( = ?auto_119267 ?auto_119269 ) ) ( not ( = ?auto_119267 ?auto_119270 ) ) ( not ( = ?auto_119267 ?auto_119271 ) ) ( not ( = ?auto_119267 ?auto_119272 ) ) ( not ( = ?auto_119267 ?auto_119273 ) ) ( not ( = ?auto_119267 ?auto_119274 ) ) ( not ( = ?auto_119268 ?auto_119269 ) ) ( not ( = ?auto_119268 ?auto_119270 ) ) ( not ( = ?auto_119268 ?auto_119271 ) ) ( not ( = ?auto_119268 ?auto_119272 ) ) ( not ( = ?auto_119268 ?auto_119273 ) ) ( not ( = ?auto_119268 ?auto_119274 ) ) ( not ( = ?auto_119269 ?auto_119270 ) ) ( not ( = ?auto_119269 ?auto_119271 ) ) ( not ( = ?auto_119269 ?auto_119272 ) ) ( not ( = ?auto_119269 ?auto_119273 ) ) ( not ( = ?auto_119269 ?auto_119274 ) ) ( not ( = ?auto_119270 ?auto_119271 ) ) ( not ( = ?auto_119270 ?auto_119272 ) ) ( not ( = ?auto_119270 ?auto_119273 ) ) ( not ( = ?auto_119270 ?auto_119274 ) ) ( not ( = ?auto_119271 ?auto_119272 ) ) ( not ( = ?auto_119271 ?auto_119273 ) ) ( not ( = ?auto_119271 ?auto_119274 ) ) ( not ( = ?auto_119272 ?auto_119273 ) ) ( not ( = ?auto_119272 ?auto_119274 ) ) ( not ( = ?auto_119273 ?auto_119274 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_119274 )
      ( !STACK ?auto_119274 ?auto_119273 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119286 - BLOCK
      ?auto_119287 - BLOCK
      ?auto_119288 - BLOCK
      ?auto_119289 - BLOCK
      ?auto_119290 - BLOCK
      ?auto_119291 - BLOCK
      ?auto_119292 - BLOCK
      ?auto_119293 - BLOCK
      ?auto_119294 - BLOCK
      ?auto_119295 - BLOCK
      ?auto_119296 - BLOCK
    )
    :vars
    (
      ?auto_119297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119296 ?auto_119297 ) ( ON-TABLE ?auto_119286 ) ( ON ?auto_119287 ?auto_119286 ) ( ON ?auto_119288 ?auto_119287 ) ( ON ?auto_119289 ?auto_119288 ) ( ON ?auto_119290 ?auto_119289 ) ( ON ?auto_119291 ?auto_119290 ) ( ON ?auto_119292 ?auto_119291 ) ( ON ?auto_119293 ?auto_119292 ) ( ON ?auto_119294 ?auto_119293 ) ( not ( = ?auto_119286 ?auto_119287 ) ) ( not ( = ?auto_119286 ?auto_119288 ) ) ( not ( = ?auto_119286 ?auto_119289 ) ) ( not ( = ?auto_119286 ?auto_119290 ) ) ( not ( = ?auto_119286 ?auto_119291 ) ) ( not ( = ?auto_119286 ?auto_119292 ) ) ( not ( = ?auto_119286 ?auto_119293 ) ) ( not ( = ?auto_119286 ?auto_119294 ) ) ( not ( = ?auto_119286 ?auto_119295 ) ) ( not ( = ?auto_119286 ?auto_119296 ) ) ( not ( = ?auto_119286 ?auto_119297 ) ) ( not ( = ?auto_119287 ?auto_119288 ) ) ( not ( = ?auto_119287 ?auto_119289 ) ) ( not ( = ?auto_119287 ?auto_119290 ) ) ( not ( = ?auto_119287 ?auto_119291 ) ) ( not ( = ?auto_119287 ?auto_119292 ) ) ( not ( = ?auto_119287 ?auto_119293 ) ) ( not ( = ?auto_119287 ?auto_119294 ) ) ( not ( = ?auto_119287 ?auto_119295 ) ) ( not ( = ?auto_119287 ?auto_119296 ) ) ( not ( = ?auto_119287 ?auto_119297 ) ) ( not ( = ?auto_119288 ?auto_119289 ) ) ( not ( = ?auto_119288 ?auto_119290 ) ) ( not ( = ?auto_119288 ?auto_119291 ) ) ( not ( = ?auto_119288 ?auto_119292 ) ) ( not ( = ?auto_119288 ?auto_119293 ) ) ( not ( = ?auto_119288 ?auto_119294 ) ) ( not ( = ?auto_119288 ?auto_119295 ) ) ( not ( = ?auto_119288 ?auto_119296 ) ) ( not ( = ?auto_119288 ?auto_119297 ) ) ( not ( = ?auto_119289 ?auto_119290 ) ) ( not ( = ?auto_119289 ?auto_119291 ) ) ( not ( = ?auto_119289 ?auto_119292 ) ) ( not ( = ?auto_119289 ?auto_119293 ) ) ( not ( = ?auto_119289 ?auto_119294 ) ) ( not ( = ?auto_119289 ?auto_119295 ) ) ( not ( = ?auto_119289 ?auto_119296 ) ) ( not ( = ?auto_119289 ?auto_119297 ) ) ( not ( = ?auto_119290 ?auto_119291 ) ) ( not ( = ?auto_119290 ?auto_119292 ) ) ( not ( = ?auto_119290 ?auto_119293 ) ) ( not ( = ?auto_119290 ?auto_119294 ) ) ( not ( = ?auto_119290 ?auto_119295 ) ) ( not ( = ?auto_119290 ?auto_119296 ) ) ( not ( = ?auto_119290 ?auto_119297 ) ) ( not ( = ?auto_119291 ?auto_119292 ) ) ( not ( = ?auto_119291 ?auto_119293 ) ) ( not ( = ?auto_119291 ?auto_119294 ) ) ( not ( = ?auto_119291 ?auto_119295 ) ) ( not ( = ?auto_119291 ?auto_119296 ) ) ( not ( = ?auto_119291 ?auto_119297 ) ) ( not ( = ?auto_119292 ?auto_119293 ) ) ( not ( = ?auto_119292 ?auto_119294 ) ) ( not ( = ?auto_119292 ?auto_119295 ) ) ( not ( = ?auto_119292 ?auto_119296 ) ) ( not ( = ?auto_119292 ?auto_119297 ) ) ( not ( = ?auto_119293 ?auto_119294 ) ) ( not ( = ?auto_119293 ?auto_119295 ) ) ( not ( = ?auto_119293 ?auto_119296 ) ) ( not ( = ?auto_119293 ?auto_119297 ) ) ( not ( = ?auto_119294 ?auto_119295 ) ) ( not ( = ?auto_119294 ?auto_119296 ) ) ( not ( = ?auto_119294 ?auto_119297 ) ) ( not ( = ?auto_119295 ?auto_119296 ) ) ( not ( = ?auto_119295 ?auto_119297 ) ) ( not ( = ?auto_119296 ?auto_119297 ) ) ( CLEAR ?auto_119294 ) ( ON ?auto_119295 ?auto_119296 ) ( CLEAR ?auto_119295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_119286 ?auto_119287 ?auto_119288 ?auto_119289 ?auto_119290 ?auto_119291 ?auto_119292 ?auto_119293 ?auto_119294 ?auto_119295 )
      ( MAKE-11PILE ?auto_119286 ?auto_119287 ?auto_119288 ?auto_119289 ?auto_119290 ?auto_119291 ?auto_119292 ?auto_119293 ?auto_119294 ?auto_119295 ?auto_119296 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119309 - BLOCK
      ?auto_119310 - BLOCK
      ?auto_119311 - BLOCK
      ?auto_119312 - BLOCK
      ?auto_119313 - BLOCK
      ?auto_119314 - BLOCK
      ?auto_119315 - BLOCK
      ?auto_119316 - BLOCK
      ?auto_119317 - BLOCK
      ?auto_119318 - BLOCK
      ?auto_119319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119319 ) ( ON-TABLE ?auto_119309 ) ( ON ?auto_119310 ?auto_119309 ) ( ON ?auto_119311 ?auto_119310 ) ( ON ?auto_119312 ?auto_119311 ) ( ON ?auto_119313 ?auto_119312 ) ( ON ?auto_119314 ?auto_119313 ) ( ON ?auto_119315 ?auto_119314 ) ( ON ?auto_119316 ?auto_119315 ) ( ON ?auto_119317 ?auto_119316 ) ( not ( = ?auto_119309 ?auto_119310 ) ) ( not ( = ?auto_119309 ?auto_119311 ) ) ( not ( = ?auto_119309 ?auto_119312 ) ) ( not ( = ?auto_119309 ?auto_119313 ) ) ( not ( = ?auto_119309 ?auto_119314 ) ) ( not ( = ?auto_119309 ?auto_119315 ) ) ( not ( = ?auto_119309 ?auto_119316 ) ) ( not ( = ?auto_119309 ?auto_119317 ) ) ( not ( = ?auto_119309 ?auto_119318 ) ) ( not ( = ?auto_119309 ?auto_119319 ) ) ( not ( = ?auto_119310 ?auto_119311 ) ) ( not ( = ?auto_119310 ?auto_119312 ) ) ( not ( = ?auto_119310 ?auto_119313 ) ) ( not ( = ?auto_119310 ?auto_119314 ) ) ( not ( = ?auto_119310 ?auto_119315 ) ) ( not ( = ?auto_119310 ?auto_119316 ) ) ( not ( = ?auto_119310 ?auto_119317 ) ) ( not ( = ?auto_119310 ?auto_119318 ) ) ( not ( = ?auto_119310 ?auto_119319 ) ) ( not ( = ?auto_119311 ?auto_119312 ) ) ( not ( = ?auto_119311 ?auto_119313 ) ) ( not ( = ?auto_119311 ?auto_119314 ) ) ( not ( = ?auto_119311 ?auto_119315 ) ) ( not ( = ?auto_119311 ?auto_119316 ) ) ( not ( = ?auto_119311 ?auto_119317 ) ) ( not ( = ?auto_119311 ?auto_119318 ) ) ( not ( = ?auto_119311 ?auto_119319 ) ) ( not ( = ?auto_119312 ?auto_119313 ) ) ( not ( = ?auto_119312 ?auto_119314 ) ) ( not ( = ?auto_119312 ?auto_119315 ) ) ( not ( = ?auto_119312 ?auto_119316 ) ) ( not ( = ?auto_119312 ?auto_119317 ) ) ( not ( = ?auto_119312 ?auto_119318 ) ) ( not ( = ?auto_119312 ?auto_119319 ) ) ( not ( = ?auto_119313 ?auto_119314 ) ) ( not ( = ?auto_119313 ?auto_119315 ) ) ( not ( = ?auto_119313 ?auto_119316 ) ) ( not ( = ?auto_119313 ?auto_119317 ) ) ( not ( = ?auto_119313 ?auto_119318 ) ) ( not ( = ?auto_119313 ?auto_119319 ) ) ( not ( = ?auto_119314 ?auto_119315 ) ) ( not ( = ?auto_119314 ?auto_119316 ) ) ( not ( = ?auto_119314 ?auto_119317 ) ) ( not ( = ?auto_119314 ?auto_119318 ) ) ( not ( = ?auto_119314 ?auto_119319 ) ) ( not ( = ?auto_119315 ?auto_119316 ) ) ( not ( = ?auto_119315 ?auto_119317 ) ) ( not ( = ?auto_119315 ?auto_119318 ) ) ( not ( = ?auto_119315 ?auto_119319 ) ) ( not ( = ?auto_119316 ?auto_119317 ) ) ( not ( = ?auto_119316 ?auto_119318 ) ) ( not ( = ?auto_119316 ?auto_119319 ) ) ( not ( = ?auto_119317 ?auto_119318 ) ) ( not ( = ?auto_119317 ?auto_119319 ) ) ( not ( = ?auto_119318 ?auto_119319 ) ) ( CLEAR ?auto_119317 ) ( ON ?auto_119318 ?auto_119319 ) ( CLEAR ?auto_119318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_119309 ?auto_119310 ?auto_119311 ?auto_119312 ?auto_119313 ?auto_119314 ?auto_119315 ?auto_119316 ?auto_119317 ?auto_119318 )
      ( MAKE-11PILE ?auto_119309 ?auto_119310 ?auto_119311 ?auto_119312 ?auto_119313 ?auto_119314 ?auto_119315 ?auto_119316 ?auto_119317 ?auto_119318 ?auto_119319 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119331 - BLOCK
      ?auto_119332 - BLOCK
      ?auto_119333 - BLOCK
      ?auto_119334 - BLOCK
      ?auto_119335 - BLOCK
      ?auto_119336 - BLOCK
      ?auto_119337 - BLOCK
      ?auto_119338 - BLOCK
      ?auto_119339 - BLOCK
      ?auto_119340 - BLOCK
      ?auto_119341 - BLOCK
    )
    :vars
    (
      ?auto_119342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119341 ?auto_119342 ) ( ON-TABLE ?auto_119331 ) ( ON ?auto_119332 ?auto_119331 ) ( ON ?auto_119333 ?auto_119332 ) ( ON ?auto_119334 ?auto_119333 ) ( ON ?auto_119335 ?auto_119334 ) ( ON ?auto_119336 ?auto_119335 ) ( ON ?auto_119337 ?auto_119336 ) ( ON ?auto_119338 ?auto_119337 ) ( not ( = ?auto_119331 ?auto_119332 ) ) ( not ( = ?auto_119331 ?auto_119333 ) ) ( not ( = ?auto_119331 ?auto_119334 ) ) ( not ( = ?auto_119331 ?auto_119335 ) ) ( not ( = ?auto_119331 ?auto_119336 ) ) ( not ( = ?auto_119331 ?auto_119337 ) ) ( not ( = ?auto_119331 ?auto_119338 ) ) ( not ( = ?auto_119331 ?auto_119339 ) ) ( not ( = ?auto_119331 ?auto_119340 ) ) ( not ( = ?auto_119331 ?auto_119341 ) ) ( not ( = ?auto_119331 ?auto_119342 ) ) ( not ( = ?auto_119332 ?auto_119333 ) ) ( not ( = ?auto_119332 ?auto_119334 ) ) ( not ( = ?auto_119332 ?auto_119335 ) ) ( not ( = ?auto_119332 ?auto_119336 ) ) ( not ( = ?auto_119332 ?auto_119337 ) ) ( not ( = ?auto_119332 ?auto_119338 ) ) ( not ( = ?auto_119332 ?auto_119339 ) ) ( not ( = ?auto_119332 ?auto_119340 ) ) ( not ( = ?auto_119332 ?auto_119341 ) ) ( not ( = ?auto_119332 ?auto_119342 ) ) ( not ( = ?auto_119333 ?auto_119334 ) ) ( not ( = ?auto_119333 ?auto_119335 ) ) ( not ( = ?auto_119333 ?auto_119336 ) ) ( not ( = ?auto_119333 ?auto_119337 ) ) ( not ( = ?auto_119333 ?auto_119338 ) ) ( not ( = ?auto_119333 ?auto_119339 ) ) ( not ( = ?auto_119333 ?auto_119340 ) ) ( not ( = ?auto_119333 ?auto_119341 ) ) ( not ( = ?auto_119333 ?auto_119342 ) ) ( not ( = ?auto_119334 ?auto_119335 ) ) ( not ( = ?auto_119334 ?auto_119336 ) ) ( not ( = ?auto_119334 ?auto_119337 ) ) ( not ( = ?auto_119334 ?auto_119338 ) ) ( not ( = ?auto_119334 ?auto_119339 ) ) ( not ( = ?auto_119334 ?auto_119340 ) ) ( not ( = ?auto_119334 ?auto_119341 ) ) ( not ( = ?auto_119334 ?auto_119342 ) ) ( not ( = ?auto_119335 ?auto_119336 ) ) ( not ( = ?auto_119335 ?auto_119337 ) ) ( not ( = ?auto_119335 ?auto_119338 ) ) ( not ( = ?auto_119335 ?auto_119339 ) ) ( not ( = ?auto_119335 ?auto_119340 ) ) ( not ( = ?auto_119335 ?auto_119341 ) ) ( not ( = ?auto_119335 ?auto_119342 ) ) ( not ( = ?auto_119336 ?auto_119337 ) ) ( not ( = ?auto_119336 ?auto_119338 ) ) ( not ( = ?auto_119336 ?auto_119339 ) ) ( not ( = ?auto_119336 ?auto_119340 ) ) ( not ( = ?auto_119336 ?auto_119341 ) ) ( not ( = ?auto_119336 ?auto_119342 ) ) ( not ( = ?auto_119337 ?auto_119338 ) ) ( not ( = ?auto_119337 ?auto_119339 ) ) ( not ( = ?auto_119337 ?auto_119340 ) ) ( not ( = ?auto_119337 ?auto_119341 ) ) ( not ( = ?auto_119337 ?auto_119342 ) ) ( not ( = ?auto_119338 ?auto_119339 ) ) ( not ( = ?auto_119338 ?auto_119340 ) ) ( not ( = ?auto_119338 ?auto_119341 ) ) ( not ( = ?auto_119338 ?auto_119342 ) ) ( not ( = ?auto_119339 ?auto_119340 ) ) ( not ( = ?auto_119339 ?auto_119341 ) ) ( not ( = ?auto_119339 ?auto_119342 ) ) ( not ( = ?auto_119340 ?auto_119341 ) ) ( not ( = ?auto_119340 ?auto_119342 ) ) ( not ( = ?auto_119341 ?auto_119342 ) ) ( ON ?auto_119340 ?auto_119341 ) ( CLEAR ?auto_119338 ) ( ON ?auto_119339 ?auto_119340 ) ( CLEAR ?auto_119339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_119331 ?auto_119332 ?auto_119333 ?auto_119334 ?auto_119335 ?auto_119336 ?auto_119337 ?auto_119338 ?auto_119339 )
      ( MAKE-11PILE ?auto_119331 ?auto_119332 ?auto_119333 ?auto_119334 ?auto_119335 ?auto_119336 ?auto_119337 ?auto_119338 ?auto_119339 ?auto_119340 ?auto_119341 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119354 - BLOCK
      ?auto_119355 - BLOCK
      ?auto_119356 - BLOCK
      ?auto_119357 - BLOCK
      ?auto_119358 - BLOCK
      ?auto_119359 - BLOCK
      ?auto_119360 - BLOCK
      ?auto_119361 - BLOCK
      ?auto_119362 - BLOCK
      ?auto_119363 - BLOCK
      ?auto_119364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119364 ) ( ON-TABLE ?auto_119354 ) ( ON ?auto_119355 ?auto_119354 ) ( ON ?auto_119356 ?auto_119355 ) ( ON ?auto_119357 ?auto_119356 ) ( ON ?auto_119358 ?auto_119357 ) ( ON ?auto_119359 ?auto_119358 ) ( ON ?auto_119360 ?auto_119359 ) ( ON ?auto_119361 ?auto_119360 ) ( not ( = ?auto_119354 ?auto_119355 ) ) ( not ( = ?auto_119354 ?auto_119356 ) ) ( not ( = ?auto_119354 ?auto_119357 ) ) ( not ( = ?auto_119354 ?auto_119358 ) ) ( not ( = ?auto_119354 ?auto_119359 ) ) ( not ( = ?auto_119354 ?auto_119360 ) ) ( not ( = ?auto_119354 ?auto_119361 ) ) ( not ( = ?auto_119354 ?auto_119362 ) ) ( not ( = ?auto_119354 ?auto_119363 ) ) ( not ( = ?auto_119354 ?auto_119364 ) ) ( not ( = ?auto_119355 ?auto_119356 ) ) ( not ( = ?auto_119355 ?auto_119357 ) ) ( not ( = ?auto_119355 ?auto_119358 ) ) ( not ( = ?auto_119355 ?auto_119359 ) ) ( not ( = ?auto_119355 ?auto_119360 ) ) ( not ( = ?auto_119355 ?auto_119361 ) ) ( not ( = ?auto_119355 ?auto_119362 ) ) ( not ( = ?auto_119355 ?auto_119363 ) ) ( not ( = ?auto_119355 ?auto_119364 ) ) ( not ( = ?auto_119356 ?auto_119357 ) ) ( not ( = ?auto_119356 ?auto_119358 ) ) ( not ( = ?auto_119356 ?auto_119359 ) ) ( not ( = ?auto_119356 ?auto_119360 ) ) ( not ( = ?auto_119356 ?auto_119361 ) ) ( not ( = ?auto_119356 ?auto_119362 ) ) ( not ( = ?auto_119356 ?auto_119363 ) ) ( not ( = ?auto_119356 ?auto_119364 ) ) ( not ( = ?auto_119357 ?auto_119358 ) ) ( not ( = ?auto_119357 ?auto_119359 ) ) ( not ( = ?auto_119357 ?auto_119360 ) ) ( not ( = ?auto_119357 ?auto_119361 ) ) ( not ( = ?auto_119357 ?auto_119362 ) ) ( not ( = ?auto_119357 ?auto_119363 ) ) ( not ( = ?auto_119357 ?auto_119364 ) ) ( not ( = ?auto_119358 ?auto_119359 ) ) ( not ( = ?auto_119358 ?auto_119360 ) ) ( not ( = ?auto_119358 ?auto_119361 ) ) ( not ( = ?auto_119358 ?auto_119362 ) ) ( not ( = ?auto_119358 ?auto_119363 ) ) ( not ( = ?auto_119358 ?auto_119364 ) ) ( not ( = ?auto_119359 ?auto_119360 ) ) ( not ( = ?auto_119359 ?auto_119361 ) ) ( not ( = ?auto_119359 ?auto_119362 ) ) ( not ( = ?auto_119359 ?auto_119363 ) ) ( not ( = ?auto_119359 ?auto_119364 ) ) ( not ( = ?auto_119360 ?auto_119361 ) ) ( not ( = ?auto_119360 ?auto_119362 ) ) ( not ( = ?auto_119360 ?auto_119363 ) ) ( not ( = ?auto_119360 ?auto_119364 ) ) ( not ( = ?auto_119361 ?auto_119362 ) ) ( not ( = ?auto_119361 ?auto_119363 ) ) ( not ( = ?auto_119361 ?auto_119364 ) ) ( not ( = ?auto_119362 ?auto_119363 ) ) ( not ( = ?auto_119362 ?auto_119364 ) ) ( not ( = ?auto_119363 ?auto_119364 ) ) ( ON ?auto_119363 ?auto_119364 ) ( CLEAR ?auto_119361 ) ( ON ?auto_119362 ?auto_119363 ) ( CLEAR ?auto_119362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_119354 ?auto_119355 ?auto_119356 ?auto_119357 ?auto_119358 ?auto_119359 ?auto_119360 ?auto_119361 ?auto_119362 )
      ( MAKE-11PILE ?auto_119354 ?auto_119355 ?auto_119356 ?auto_119357 ?auto_119358 ?auto_119359 ?auto_119360 ?auto_119361 ?auto_119362 ?auto_119363 ?auto_119364 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119376 - BLOCK
      ?auto_119377 - BLOCK
      ?auto_119378 - BLOCK
      ?auto_119379 - BLOCK
      ?auto_119380 - BLOCK
      ?auto_119381 - BLOCK
      ?auto_119382 - BLOCK
      ?auto_119383 - BLOCK
      ?auto_119384 - BLOCK
      ?auto_119385 - BLOCK
      ?auto_119386 - BLOCK
    )
    :vars
    (
      ?auto_119387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119386 ?auto_119387 ) ( ON-TABLE ?auto_119376 ) ( ON ?auto_119377 ?auto_119376 ) ( ON ?auto_119378 ?auto_119377 ) ( ON ?auto_119379 ?auto_119378 ) ( ON ?auto_119380 ?auto_119379 ) ( ON ?auto_119381 ?auto_119380 ) ( ON ?auto_119382 ?auto_119381 ) ( not ( = ?auto_119376 ?auto_119377 ) ) ( not ( = ?auto_119376 ?auto_119378 ) ) ( not ( = ?auto_119376 ?auto_119379 ) ) ( not ( = ?auto_119376 ?auto_119380 ) ) ( not ( = ?auto_119376 ?auto_119381 ) ) ( not ( = ?auto_119376 ?auto_119382 ) ) ( not ( = ?auto_119376 ?auto_119383 ) ) ( not ( = ?auto_119376 ?auto_119384 ) ) ( not ( = ?auto_119376 ?auto_119385 ) ) ( not ( = ?auto_119376 ?auto_119386 ) ) ( not ( = ?auto_119376 ?auto_119387 ) ) ( not ( = ?auto_119377 ?auto_119378 ) ) ( not ( = ?auto_119377 ?auto_119379 ) ) ( not ( = ?auto_119377 ?auto_119380 ) ) ( not ( = ?auto_119377 ?auto_119381 ) ) ( not ( = ?auto_119377 ?auto_119382 ) ) ( not ( = ?auto_119377 ?auto_119383 ) ) ( not ( = ?auto_119377 ?auto_119384 ) ) ( not ( = ?auto_119377 ?auto_119385 ) ) ( not ( = ?auto_119377 ?auto_119386 ) ) ( not ( = ?auto_119377 ?auto_119387 ) ) ( not ( = ?auto_119378 ?auto_119379 ) ) ( not ( = ?auto_119378 ?auto_119380 ) ) ( not ( = ?auto_119378 ?auto_119381 ) ) ( not ( = ?auto_119378 ?auto_119382 ) ) ( not ( = ?auto_119378 ?auto_119383 ) ) ( not ( = ?auto_119378 ?auto_119384 ) ) ( not ( = ?auto_119378 ?auto_119385 ) ) ( not ( = ?auto_119378 ?auto_119386 ) ) ( not ( = ?auto_119378 ?auto_119387 ) ) ( not ( = ?auto_119379 ?auto_119380 ) ) ( not ( = ?auto_119379 ?auto_119381 ) ) ( not ( = ?auto_119379 ?auto_119382 ) ) ( not ( = ?auto_119379 ?auto_119383 ) ) ( not ( = ?auto_119379 ?auto_119384 ) ) ( not ( = ?auto_119379 ?auto_119385 ) ) ( not ( = ?auto_119379 ?auto_119386 ) ) ( not ( = ?auto_119379 ?auto_119387 ) ) ( not ( = ?auto_119380 ?auto_119381 ) ) ( not ( = ?auto_119380 ?auto_119382 ) ) ( not ( = ?auto_119380 ?auto_119383 ) ) ( not ( = ?auto_119380 ?auto_119384 ) ) ( not ( = ?auto_119380 ?auto_119385 ) ) ( not ( = ?auto_119380 ?auto_119386 ) ) ( not ( = ?auto_119380 ?auto_119387 ) ) ( not ( = ?auto_119381 ?auto_119382 ) ) ( not ( = ?auto_119381 ?auto_119383 ) ) ( not ( = ?auto_119381 ?auto_119384 ) ) ( not ( = ?auto_119381 ?auto_119385 ) ) ( not ( = ?auto_119381 ?auto_119386 ) ) ( not ( = ?auto_119381 ?auto_119387 ) ) ( not ( = ?auto_119382 ?auto_119383 ) ) ( not ( = ?auto_119382 ?auto_119384 ) ) ( not ( = ?auto_119382 ?auto_119385 ) ) ( not ( = ?auto_119382 ?auto_119386 ) ) ( not ( = ?auto_119382 ?auto_119387 ) ) ( not ( = ?auto_119383 ?auto_119384 ) ) ( not ( = ?auto_119383 ?auto_119385 ) ) ( not ( = ?auto_119383 ?auto_119386 ) ) ( not ( = ?auto_119383 ?auto_119387 ) ) ( not ( = ?auto_119384 ?auto_119385 ) ) ( not ( = ?auto_119384 ?auto_119386 ) ) ( not ( = ?auto_119384 ?auto_119387 ) ) ( not ( = ?auto_119385 ?auto_119386 ) ) ( not ( = ?auto_119385 ?auto_119387 ) ) ( not ( = ?auto_119386 ?auto_119387 ) ) ( ON ?auto_119385 ?auto_119386 ) ( ON ?auto_119384 ?auto_119385 ) ( CLEAR ?auto_119382 ) ( ON ?auto_119383 ?auto_119384 ) ( CLEAR ?auto_119383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_119376 ?auto_119377 ?auto_119378 ?auto_119379 ?auto_119380 ?auto_119381 ?auto_119382 ?auto_119383 )
      ( MAKE-11PILE ?auto_119376 ?auto_119377 ?auto_119378 ?auto_119379 ?auto_119380 ?auto_119381 ?auto_119382 ?auto_119383 ?auto_119384 ?auto_119385 ?auto_119386 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119399 - BLOCK
      ?auto_119400 - BLOCK
      ?auto_119401 - BLOCK
      ?auto_119402 - BLOCK
      ?auto_119403 - BLOCK
      ?auto_119404 - BLOCK
      ?auto_119405 - BLOCK
      ?auto_119406 - BLOCK
      ?auto_119407 - BLOCK
      ?auto_119408 - BLOCK
      ?auto_119409 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119409 ) ( ON-TABLE ?auto_119399 ) ( ON ?auto_119400 ?auto_119399 ) ( ON ?auto_119401 ?auto_119400 ) ( ON ?auto_119402 ?auto_119401 ) ( ON ?auto_119403 ?auto_119402 ) ( ON ?auto_119404 ?auto_119403 ) ( ON ?auto_119405 ?auto_119404 ) ( not ( = ?auto_119399 ?auto_119400 ) ) ( not ( = ?auto_119399 ?auto_119401 ) ) ( not ( = ?auto_119399 ?auto_119402 ) ) ( not ( = ?auto_119399 ?auto_119403 ) ) ( not ( = ?auto_119399 ?auto_119404 ) ) ( not ( = ?auto_119399 ?auto_119405 ) ) ( not ( = ?auto_119399 ?auto_119406 ) ) ( not ( = ?auto_119399 ?auto_119407 ) ) ( not ( = ?auto_119399 ?auto_119408 ) ) ( not ( = ?auto_119399 ?auto_119409 ) ) ( not ( = ?auto_119400 ?auto_119401 ) ) ( not ( = ?auto_119400 ?auto_119402 ) ) ( not ( = ?auto_119400 ?auto_119403 ) ) ( not ( = ?auto_119400 ?auto_119404 ) ) ( not ( = ?auto_119400 ?auto_119405 ) ) ( not ( = ?auto_119400 ?auto_119406 ) ) ( not ( = ?auto_119400 ?auto_119407 ) ) ( not ( = ?auto_119400 ?auto_119408 ) ) ( not ( = ?auto_119400 ?auto_119409 ) ) ( not ( = ?auto_119401 ?auto_119402 ) ) ( not ( = ?auto_119401 ?auto_119403 ) ) ( not ( = ?auto_119401 ?auto_119404 ) ) ( not ( = ?auto_119401 ?auto_119405 ) ) ( not ( = ?auto_119401 ?auto_119406 ) ) ( not ( = ?auto_119401 ?auto_119407 ) ) ( not ( = ?auto_119401 ?auto_119408 ) ) ( not ( = ?auto_119401 ?auto_119409 ) ) ( not ( = ?auto_119402 ?auto_119403 ) ) ( not ( = ?auto_119402 ?auto_119404 ) ) ( not ( = ?auto_119402 ?auto_119405 ) ) ( not ( = ?auto_119402 ?auto_119406 ) ) ( not ( = ?auto_119402 ?auto_119407 ) ) ( not ( = ?auto_119402 ?auto_119408 ) ) ( not ( = ?auto_119402 ?auto_119409 ) ) ( not ( = ?auto_119403 ?auto_119404 ) ) ( not ( = ?auto_119403 ?auto_119405 ) ) ( not ( = ?auto_119403 ?auto_119406 ) ) ( not ( = ?auto_119403 ?auto_119407 ) ) ( not ( = ?auto_119403 ?auto_119408 ) ) ( not ( = ?auto_119403 ?auto_119409 ) ) ( not ( = ?auto_119404 ?auto_119405 ) ) ( not ( = ?auto_119404 ?auto_119406 ) ) ( not ( = ?auto_119404 ?auto_119407 ) ) ( not ( = ?auto_119404 ?auto_119408 ) ) ( not ( = ?auto_119404 ?auto_119409 ) ) ( not ( = ?auto_119405 ?auto_119406 ) ) ( not ( = ?auto_119405 ?auto_119407 ) ) ( not ( = ?auto_119405 ?auto_119408 ) ) ( not ( = ?auto_119405 ?auto_119409 ) ) ( not ( = ?auto_119406 ?auto_119407 ) ) ( not ( = ?auto_119406 ?auto_119408 ) ) ( not ( = ?auto_119406 ?auto_119409 ) ) ( not ( = ?auto_119407 ?auto_119408 ) ) ( not ( = ?auto_119407 ?auto_119409 ) ) ( not ( = ?auto_119408 ?auto_119409 ) ) ( ON ?auto_119408 ?auto_119409 ) ( ON ?auto_119407 ?auto_119408 ) ( CLEAR ?auto_119405 ) ( ON ?auto_119406 ?auto_119407 ) ( CLEAR ?auto_119406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_119399 ?auto_119400 ?auto_119401 ?auto_119402 ?auto_119403 ?auto_119404 ?auto_119405 ?auto_119406 )
      ( MAKE-11PILE ?auto_119399 ?auto_119400 ?auto_119401 ?auto_119402 ?auto_119403 ?auto_119404 ?auto_119405 ?auto_119406 ?auto_119407 ?auto_119408 ?auto_119409 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119421 - BLOCK
      ?auto_119422 - BLOCK
      ?auto_119423 - BLOCK
      ?auto_119424 - BLOCK
      ?auto_119425 - BLOCK
      ?auto_119426 - BLOCK
      ?auto_119427 - BLOCK
      ?auto_119428 - BLOCK
      ?auto_119429 - BLOCK
      ?auto_119430 - BLOCK
      ?auto_119431 - BLOCK
    )
    :vars
    (
      ?auto_119432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119431 ?auto_119432 ) ( ON-TABLE ?auto_119421 ) ( ON ?auto_119422 ?auto_119421 ) ( ON ?auto_119423 ?auto_119422 ) ( ON ?auto_119424 ?auto_119423 ) ( ON ?auto_119425 ?auto_119424 ) ( ON ?auto_119426 ?auto_119425 ) ( not ( = ?auto_119421 ?auto_119422 ) ) ( not ( = ?auto_119421 ?auto_119423 ) ) ( not ( = ?auto_119421 ?auto_119424 ) ) ( not ( = ?auto_119421 ?auto_119425 ) ) ( not ( = ?auto_119421 ?auto_119426 ) ) ( not ( = ?auto_119421 ?auto_119427 ) ) ( not ( = ?auto_119421 ?auto_119428 ) ) ( not ( = ?auto_119421 ?auto_119429 ) ) ( not ( = ?auto_119421 ?auto_119430 ) ) ( not ( = ?auto_119421 ?auto_119431 ) ) ( not ( = ?auto_119421 ?auto_119432 ) ) ( not ( = ?auto_119422 ?auto_119423 ) ) ( not ( = ?auto_119422 ?auto_119424 ) ) ( not ( = ?auto_119422 ?auto_119425 ) ) ( not ( = ?auto_119422 ?auto_119426 ) ) ( not ( = ?auto_119422 ?auto_119427 ) ) ( not ( = ?auto_119422 ?auto_119428 ) ) ( not ( = ?auto_119422 ?auto_119429 ) ) ( not ( = ?auto_119422 ?auto_119430 ) ) ( not ( = ?auto_119422 ?auto_119431 ) ) ( not ( = ?auto_119422 ?auto_119432 ) ) ( not ( = ?auto_119423 ?auto_119424 ) ) ( not ( = ?auto_119423 ?auto_119425 ) ) ( not ( = ?auto_119423 ?auto_119426 ) ) ( not ( = ?auto_119423 ?auto_119427 ) ) ( not ( = ?auto_119423 ?auto_119428 ) ) ( not ( = ?auto_119423 ?auto_119429 ) ) ( not ( = ?auto_119423 ?auto_119430 ) ) ( not ( = ?auto_119423 ?auto_119431 ) ) ( not ( = ?auto_119423 ?auto_119432 ) ) ( not ( = ?auto_119424 ?auto_119425 ) ) ( not ( = ?auto_119424 ?auto_119426 ) ) ( not ( = ?auto_119424 ?auto_119427 ) ) ( not ( = ?auto_119424 ?auto_119428 ) ) ( not ( = ?auto_119424 ?auto_119429 ) ) ( not ( = ?auto_119424 ?auto_119430 ) ) ( not ( = ?auto_119424 ?auto_119431 ) ) ( not ( = ?auto_119424 ?auto_119432 ) ) ( not ( = ?auto_119425 ?auto_119426 ) ) ( not ( = ?auto_119425 ?auto_119427 ) ) ( not ( = ?auto_119425 ?auto_119428 ) ) ( not ( = ?auto_119425 ?auto_119429 ) ) ( not ( = ?auto_119425 ?auto_119430 ) ) ( not ( = ?auto_119425 ?auto_119431 ) ) ( not ( = ?auto_119425 ?auto_119432 ) ) ( not ( = ?auto_119426 ?auto_119427 ) ) ( not ( = ?auto_119426 ?auto_119428 ) ) ( not ( = ?auto_119426 ?auto_119429 ) ) ( not ( = ?auto_119426 ?auto_119430 ) ) ( not ( = ?auto_119426 ?auto_119431 ) ) ( not ( = ?auto_119426 ?auto_119432 ) ) ( not ( = ?auto_119427 ?auto_119428 ) ) ( not ( = ?auto_119427 ?auto_119429 ) ) ( not ( = ?auto_119427 ?auto_119430 ) ) ( not ( = ?auto_119427 ?auto_119431 ) ) ( not ( = ?auto_119427 ?auto_119432 ) ) ( not ( = ?auto_119428 ?auto_119429 ) ) ( not ( = ?auto_119428 ?auto_119430 ) ) ( not ( = ?auto_119428 ?auto_119431 ) ) ( not ( = ?auto_119428 ?auto_119432 ) ) ( not ( = ?auto_119429 ?auto_119430 ) ) ( not ( = ?auto_119429 ?auto_119431 ) ) ( not ( = ?auto_119429 ?auto_119432 ) ) ( not ( = ?auto_119430 ?auto_119431 ) ) ( not ( = ?auto_119430 ?auto_119432 ) ) ( not ( = ?auto_119431 ?auto_119432 ) ) ( ON ?auto_119430 ?auto_119431 ) ( ON ?auto_119429 ?auto_119430 ) ( ON ?auto_119428 ?auto_119429 ) ( CLEAR ?auto_119426 ) ( ON ?auto_119427 ?auto_119428 ) ( CLEAR ?auto_119427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119421 ?auto_119422 ?auto_119423 ?auto_119424 ?auto_119425 ?auto_119426 ?auto_119427 )
      ( MAKE-11PILE ?auto_119421 ?auto_119422 ?auto_119423 ?auto_119424 ?auto_119425 ?auto_119426 ?auto_119427 ?auto_119428 ?auto_119429 ?auto_119430 ?auto_119431 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119444 - BLOCK
      ?auto_119445 - BLOCK
      ?auto_119446 - BLOCK
      ?auto_119447 - BLOCK
      ?auto_119448 - BLOCK
      ?auto_119449 - BLOCK
      ?auto_119450 - BLOCK
      ?auto_119451 - BLOCK
      ?auto_119452 - BLOCK
      ?auto_119453 - BLOCK
      ?auto_119454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119454 ) ( ON-TABLE ?auto_119444 ) ( ON ?auto_119445 ?auto_119444 ) ( ON ?auto_119446 ?auto_119445 ) ( ON ?auto_119447 ?auto_119446 ) ( ON ?auto_119448 ?auto_119447 ) ( ON ?auto_119449 ?auto_119448 ) ( not ( = ?auto_119444 ?auto_119445 ) ) ( not ( = ?auto_119444 ?auto_119446 ) ) ( not ( = ?auto_119444 ?auto_119447 ) ) ( not ( = ?auto_119444 ?auto_119448 ) ) ( not ( = ?auto_119444 ?auto_119449 ) ) ( not ( = ?auto_119444 ?auto_119450 ) ) ( not ( = ?auto_119444 ?auto_119451 ) ) ( not ( = ?auto_119444 ?auto_119452 ) ) ( not ( = ?auto_119444 ?auto_119453 ) ) ( not ( = ?auto_119444 ?auto_119454 ) ) ( not ( = ?auto_119445 ?auto_119446 ) ) ( not ( = ?auto_119445 ?auto_119447 ) ) ( not ( = ?auto_119445 ?auto_119448 ) ) ( not ( = ?auto_119445 ?auto_119449 ) ) ( not ( = ?auto_119445 ?auto_119450 ) ) ( not ( = ?auto_119445 ?auto_119451 ) ) ( not ( = ?auto_119445 ?auto_119452 ) ) ( not ( = ?auto_119445 ?auto_119453 ) ) ( not ( = ?auto_119445 ?auto_119454 ) ) ( not ( = ?auto_119446 ?auto_119447 ) ) ( not ( = ?auto_119446 ?auto_119448 ) ) ( not ( = ?auto_119446 ?auto_119449 ) ) ( not ( = ?auto_119446 ?auto_119450 ) ) ( not ( = ?auto_119446 ?auto_119451 ) ) ( not ( = ?auto_119446 ?auto_119452 ) ) ( not ( = ?auto_119446 ?auto_119453 ) ) ( not ( = ?auto_119446 ?auto_119454 ) ) ( not ( = ?auto_119447 ?auto_119448 ) ) ( not ( = ?auto_119447 ?auto_119449 ) ) ( not ( = ?auto_119447 ?auto_119450 ) ) ( not ( = ?auto_119447 ?auto_119451 ) ) ( not ( = ?auto_119447 ?auto_119452 ) ) ( not ( = ?auto_119447 ?auto_119453 ) ) ( not ( = ?auto_119447 ?auto_119454 ) ) ( not ( = ?auto_119448 ?auto_119449 ) ) ( not ( = ?auto_119448 ?auto_119450 ) ) ( not ( = ?auto_119448 ?auto_119451 ) ) ( not ( = ?auto_119448 ?auto_119452 ) ) ( not ( = ?auto_119448 ?auto_119453 ) ) ( not ( = ?auto_119448 ?auto_119454 ) ) ( not ( = ?auto_119449 ?auto_119450 ) ) ( not ( = ?auto_119449 ?auto_119451 ) ) ( not ( = ?auto_119449 ?auto_119452 ) ) ( not ( = ?auto_119449 ?auto_119453 ) ) ( not ( = ?auto_119449 ?auto_119454 ) ) ( not ( = ?auto_119450 ?auto_119451 ) ) ( not ( = ?auto_119450 ?auto_119452 ) ) ( not ( = ?auto_119450 ?auto_119453 ) ) ( not ( = ?auto_119450 ?auto_119454 ) ) ( not ( = ?auto_119451 ?auto_119452 ) ) ( not ( = ?auto_119451 ?auto_119453 ) ) ( not ( = ?auto_119451 ?auto_119454 ) ) ( not ( = ?auto_119452 ?auto_119453 ) ) ( not ( = ?auto_119452 ?auto_119454 ) ) ( not ( = ?auto_119453 ?auto_119454 ) ) ( ON ?auto_119453 ?auto_119454 ) ( ON ?auto_119452 ?auto_119453 ) ( ON ?auto_119451 ?auto_119452 ) ( CLEAR ?auto_119449 ) ( ON ?auto_119450 ?auto_119451 ) ( CLEAR ?auto_119450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_119444 ?auto_119445 ?auto_119446 ?auto_119447 ?auto_119448 ?auto_119449 ?auto_119450 )
      ( MAKE-11PILE ?auto_119444 ?auto_119445 ?auto_119446 ?auto_119447 ?auto_119448 ?auto_119449 ?auto_119450 ?auto_119451 ?auto_119452 ?auto_119453 ?auto_119454 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119466 - BLOCK
      ?auto_119467 - BLOCK
      ?auto_119468 - BLOCK
      ?auto_119469 - BLOCK
      ?auto_119470 - BLOCK
      ?auto_119471 - BLOCK
      ?auto_119472 - BLOCK
      ?auto_119473 - BLOCK
      ?auto_119474 - BLOCK
      ?auto_119475 - BLOCK
      ?auto_119476 - BLOCK
    )
    :vars
    (
      ?auto_119477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119476 ?auto_119477 ) ( ON-TABLE ?auto_119466 ) ( ON ?auto_119467 ?auto_119466 ) ( ON ?auto_119468 ?auto_119467 ) ( ON ?auto_119469 ?auto_119468 ) ( ON ?auto_119470 ?auto_119469 ) ( not ( = ?auto_119466 ?auto_119467 ) ) ( not ( = ?auto_119466 ?auto_119468 ) ) ( not ( = ?auto_119466 ?auto_119469 ) ) ( not ( = ?auto_119466 ?auto_119470 ) ) ( not ( = ?auto_119466 ?auto_119471 ) ) ( not ( = ?auto_119466 ?auto_119472 ) ) ( not ( = ?auto_119466 ?auto_119473 ) ) ( not ( = ?auto_119466 ?auto_119474 ) ) ( not ( = ?auto_119466 ?auto_119475 ) ) ( not ( = ?auto_119466 ?auto_119476 ) ) ( not ( = ?auto_119466 ?auto_119477 ) ) ( not ( = ?auto_119467 ?auto_119468 ) ) ( not ( = ?auto_119467 ?auto_119469 ) ) ( not ( = ?auto_119467 ?auto_119470 ) ) ( not ( = ?auto_119467 ?auto_119471 ) ) ( not ( = ?auto_119467 ?auto_119472 ) ) ( not ( = ?auto_119467 ?auto_119473 ) ) ( not ( = ?auto_119467 ?auto_119474 ) ) ( not ( = ?auto_119467 ?auto_119475 ) ) ( not ( = ?auto_119467 ?auto_119476 ) ) ( not ( = ?auto_119467 ?auto_119477 ) ) ( not ( = ?auto_119468 ?auto_119469 ) ) ( not ( = ?auto_119468 ?auto_119470 ) ) ( not ( = ?auto_119468 ?auto_119471 ) ) ( not ( = ?auto_119468 ?auto_119472 ) ) ( not ( = ?auto_119468 ?auto_119473 ) ) ( not ( = ?auto_119468 ?auto_119474 ) ) ( not ( = ?auto_119468 ?auto_119475 ) ) ( not ( = ?auto_119468 ?auto_119476 ) ) ( not ( = ?auto_119468 ?auto_119477 ) ) ( not ( = ?auto_119469 ?auto_119470 ) ) ( not ( = ?auto_119469 ?auto_119471 ) ) ( not ( = ?auto_119469 ?auto_119472 ) ) ( not ( = ?auto_119469 ?auto_119473 ) ) ( not ( = ?auto_119469 ?auto_119474 ) ) ( not ( = ?auto_119469 ?auto_119475 ) ) ( not ( = ?auto_119469 ?auto_119476 ) ) ( not ( = ?auto_119469 ?auto_119477 ) ) ( not ( = ?auto_119470 ?auto_119471 ) ) ( not ( = ?auto_119470 ?auto_119472 ) ) ( not ( = ?auto_119470 ?auto_119473 ) ) ( not ( = ?auto_119470 ?auto_119474 ) ) ( not ( = ?auto_119470 ?auto_119475 ) ) ( not ( = ?auto_119470 ?auto_119476 ) ) ( not ( = ?auto_119470 ?auto_119477 ) ) ( not ( = ?auto_119471 ?auto_119472 ) ) ( not ( = ?auto_119471 ?auto_119473 ) ) ( not ( = ?auto_119471 ?auto_119474 ) ) ( not ( = ?auto_119471 ?auto_119475 ) ) ( not ( = ?auto_119471 ?auto_119476 ) ) ( not ( = ?auto_119471 ?auto_119477 ) ) ( not ( = ?auto_119472 ?auto_119473 ) ) ( not ( = ?auto_119472 ?auto_119474 ) ) ( not ( = ?auto_119472 ?auto_119475 ) ) ( not ( = ?auto_119472 ?auto_119476 ) ) ( not ( = ?auto_119472 ?auto_119477 ) ) ( not ( = ?auto_119473 ?auto_119474 ) ) ( not ( = ?auto_119473 ?auto_119475 ) ) ( not ( = ?auto_119473 ?auto_119476 ) ) ( not ( = ?auto_119473 ?auto_119477 ) ) ( not ( = ?auto_119474 ?auto_119475 ) ) ( not ( = ?auto_119474 ?auto_119476 ) ) ( not ( = ?auto_119474 ?auto_119477 ) ) ( not ( = ?auto_119475 ?auto_119476 ) ) ( not ( = ?auto_119475 ?auto_119477 ) ) ( not ( = ?auto_119476 ?auto_119477 ) ) ( ON ?auto_119475 ?auto_119476 ) ( ON ?auto_119474 ?auto_119475 ) ( ON ?auto_119473 ?auto_119474 ) ( ON ?auto_119472 ?auto_119473 ) ( CLEAR ?auto_119470 ) ( ON ?auto_119471 ?auto_119472 ) ( CLEAR ?auto_119471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119466 ?auto_119467 ?auto_119468 ?auto_119469 ?auto_119470 ?auto_119471 )
      ( MAKE-11PILE ?auto_119466 ?auto_119467 ?auto_119468 ?auto_119469 ?auto_119470 ?auto_119471 ?auto_119472 ?auto_119473 ?auto_119474 ?auto_119475 ?auto_119476 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119489 - BLOCK
      ?auto_119490 - BLOCK
      ?auto_119491 - BLOCK
      ?auto_119492 - BLOCK
      ?auto_119493 - BLOCK
      ?auto_119494 - BLOCK
      ?auto_119495 - BLOCK
      ?auto_119496 - BLOCK
      ?auto_119497 - BLOCK
      ?auto_119498 - BLOCK
      ?auto_119499 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119499 ) ( ON-TABLE ?auto_119489 ) ( ON ?auto_119490 ?auto_119489 ) ( ON ?auto_119491 ?auto_119490 ) ( ON ?auto_119492 ?auto_119491 ) ( ON ?auto_119493 ?auto_119492 ) ( not ( = ?auto_119489 ?auto_119490 ) ) ( not ( = ?auto_119489 ?auto_119491 ) ) ( not ( = ?auto_119489 ?auto_119492 ) ) ( not ( = ?auto_119489 ?auto_119493 ) ) ( not ( = ?auto_119489 ?auto_119494 ) ) ( not ( = ?auto_119489 ?auto_119495 ) ) ( not ( = ?auto_119489 ?auto_119496 ) ) ( not ( = ?auto_119489 ?auto_119497 ) ) ( not ( = ?auto_119489 ?auto_119498 ) ) ( not ( = ?auto_119489 ?auto_119499 ) ) ( not ( = ?auto_119490 ?auto_119491 ) ) ( not ( = ?auto_119490 ?auto_119492 ) ) ( not ( = ?auto_119490 ?auto_119493 ) ) ( not ( = ?auto_119490 ?auto_119494 ) ) ( not ( = ?auto_119490 ?auto_119495 ) ) ( not ( = ?auto_119490 ?auto_119496 ) ) ( not ( = ?auto_119490 ?auto_119497 ) ) ( not ( = ?auto_119490 ?auto_119498 ) ) ( not ( = ?auto_119490 ?auto_119499 ) ) ( not ( = ?auto_119491 ?auto_119492 ) ) ( not ( = ?auto_119491 ?auto_119493 ) ) ( not ( = ?auto_119491 ?auto_119494 ) ) ( not ( = ?auto_119491 ?auto_119495 ) ) ( not ( = ?auto_119491 ?auto_119496 ) ) ( not ( = ?auto_119491 ?auto_119497 ) ) ( not ( = ?auto_119491 ?auto_119498 ) ) ( not ( = ?auto_119491 ?auto_119499 ) ) ( not ( = ?auto_119492 ?auto_119493 ) ) ( not ( = ?auto_119492 ?auto_119494 ) ) ( not ( = ?auto_119492 ?auto_119495 ) ) ( not ( = ?auto_119492 ?auto_119496 ) ) ( not ( = ?auto_119492 ?auto_119497 ) ) ( not ( = ?auto_119492 ?auto_119498 ) ) ( not ( = ?auto_119492 ?auto_119499 ) ) ( not ( = ?auto_119493 ?auto_119494 ) ) ( not ( = ?auto_119493 ?auto_119495 ) ) ( not ( = ?auto_119493 ?auto_119496 ) ) ( not ( = ?auto_119493 ?auto_119497 ) ) ( not ( = ?auto_119493 ?auto_119498 ) ) ( not ( = ?auto_119493 ?auto_119499 ) ) ( not ( = ?auto_119494 ?auto_119495 ) ) ( not ( = ?auto_119494 ?auto_119496 ) ) ( not ( = ?auto_119494 ?auto_119497 ) ) ( not ( = ?auto_119494 ?auto_119498 ) ) ( not ( = ?auto_119494 ?auto_119499 ) ) ( not ( = ?auto_119495 ?auto_119496 ) ) ( not ( = ?auto_119495 ?auto_119497 ) ) ( not ( = ?auto_119495 ?auto_119498 ) ) ( not ( = ?auto_119495 ?auto_119499 ) ) ( not ( = ?auto_119496 ?auto_119497 ) ) ( not ( = ?auto_119496 ?auto_119498 ) ) ( not ( = ?auto_119496 ?auto_119499 ) ) ( not ( = ?auto_119497 ?auto_119498 ) ) ( not ( = ?auto_119497 ?auto_119499 ) ) ( not ( = ?auto_119498 ?auto_119499 ) ) ( ON ?auto_119498 ?auto_119499 ) ( ON ?auto_119497 ?auto_119498 ) ( ON ?auto_119496 ?auto_119497 ) ( ON ?auto_119495 ?auto_119496 ) ( CLEAR ?auto_119493 ) ( ON ?auto_119494 ?auto_119495 ) ( CLEAR ?auto_119494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_119489 ?auto_119490 ?auto_119491 ?auto_119492 ?auto_119493 ?auto_119494 )
      ( MAKE-11PILE ?auto_119489 ?auto_119490 ?auto_119491 ?auto_119492 ?auto_119493 ?auto_119494 ?auto_119495 ?auto_119496 ?auto_119497 ?auto_119498 ?auto_119499 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119511 - BLOCK
      ?auto_119512 - BLOCK
      ?auto_119513 - BLOCK
      ?auto_119514 - BLOCK
      ?auto_119515 - BLOCK
      ?auto_119516 - BLOCK
      ?auto_119517 - BLOCK
      ?auto_119518 - BLOCK
      ?auto_119519 - BLOCK
      ?auto_119520 - BLOCK
      ?auto_119521 - BLOCK
    )
    :vars
    (
      ?auto_119522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119521 ?auto_119522 ) ( ON-TABLE ?auto_119511 ) ( ON ?auto_119512 ?auto_119511 ) ( ON ?auto_119513 ?auto_119512 ) ( ON ?auto_119514 ?auto_119513 ) ( not ( = ?auto_119511 ?auto_119512 ) ) ( not ( = ?auto_119511 ?auto_119513 ) ) ( not ( = ?auto_119511 ?auto_119514 ) ) ( not ( = ?auto_119511 ?auto_119515 ) ) ( not ( = ?auto_119511 ?auto_119516 ) ) ( not ( = ?auto_119511 ?auto_119517 ) ) ( not ( = ?auto_119511 ?auto_119518 ) ) ( not ( = ?auto_119511 ?auto_119519 ) ) ( not ( = ?auto_119511 ?auto_119520 ) ) ( not ( = ?auto_119511 ?auto_119521 ) ) ( not ( = ?auto_119511 ?auto_119522 ) ) ( not ( = ?auto_119512 ?auto_119513 ) ) ( not ( = ?auto_119512 ?auto_119514 ) ) ( not ( = ?auto_119512 ?auto_119515 ) ) ( not ( = ?auto_119512 ?auto_119516 ) ) ( not ( = ?auto_119512 ?auto_119517 ) ) ( not ( = ?auto_119512 ?auto_119518 ) ) ( not ( = ?auto_119512 ?auto_119519 ) ) ( not ( = ?auto_119512 ?auto_119520 ) ) ( not ( = ?auto_119512 ?auto_119521 ) ) ( not ( = ?auto_119512 ?auto_119522 ) ) ( not ( = ?auto_119513 ?auto_119514 ) ) ( not ( = ?auto_119513 ?auto_119515 ) ) ( not ( = ?auto_119513 ?auto_119516 ) ) ( not ( = ?auto_119513 ?auto_119517 ) ) ( not ( = ?auto_119513 ?auto_119518 ) ) ( not ( = ?auto_119513 ?auto_119519 ) ) ( not ( = ?auto_119513 ?auto_119520 ) ) ( not ( = ?auto_119513 ?auto_119521 ) ) ( not ( = ?auto_119513 ?auto_119522 ) ) ( not ( = ?auto_119514 ?auto_119515 ) ) ( not ( = ?auto_119514 ?auto_119516 ) ) ( not ( = ?auto_119514 ?auto_119517 ) ) ( not ( = ?auto_119514 ?auto_119518 ) ) ( not ( = ?auto_119514 ?auto_119519 ) ) ( not ( = ?auto_119514 ?auto_119520 ) ) ( not ( = ?auto_119514 ?auto_119521 ) ) ( not ( = ?auto_119514 ?auto_119522 ) ) ( not ( = ?auto_119515 ?auto_119516 ) ) ( not ( = ?auto_119515 ?auto_119517 ) ) ( not ( = ?auto_119515 ?auto_119518 ) ) ( not ( = ?auto_119515 ?auto_119519 ) ) ( not ( = ?auto_119515 ?auto_119520 ) ) ( not ( = ?auto_119515 ?auto_119521 ) ) ( not ( = ?auto_119515 ?auto_119522 ) ) ( not ( = ?auto_119516 ?auto_119517 ) ) ( not ( = ?auto_119516 ?auto_119518 ) ) ( not ( = ?auto_119516 ?auto_119519 ) ) ( not ( = ?auto_119516 ?auto_119520 ) ) ( not ( = ?auto_119516 ?auto_119521 ) ) ( not ( = ?auto_119516 ?auto_119522 ) ) ( not ( = ?auto_119517 ?auto_119518 ) ) ( not ( = ?auto_119517 ?auto_119519 ) ) ( not ( = ?auto_119517 ?auto_119520 ) ) ( not ( = ?auto_119517 ?auto_119521 ) ) ( not ( = ?auto_119517 ?auto_119522 ) ) ( not ( = ?auto_119518 ?auto_119519 ) ) ( not ( = ?auto_119518 ?auto_119520 ) ) ( not ( = ?auto_119518 ?auto_119521 ) ) ( not ( = ?auto_119518 ?auto_119522 ) ) ( not ( = ?auto_119519 ?auto_119520 ) ) ( not ( = ?auto_119519 ?auto_119521 ) ) ( not ( = ?auto_119519 ?auto_119522 ) ) ( not ( = ?auto_119520 ?auto_119521 ) ) ( not ( = ?auto_119520 ?auto_119522 ) ) ( not ( = ?auto_119521 ?auto_119522 ) ) ( ON ?auto_119520 ?auto_119521 ) ( ON ?auto_119519 ?auto_119520 ) ( ON ?auto_119518 ?auto_119519 ) ( ON ?auto_119517 ?auto_119518 ) ( ON ?auto_119516 ?auto_119517 ) ( CLEAR ?auto_119514 ) ( ON ?auto_119515 ?auto_119516 ) ( CLEAR ?auto_119515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119511 ?auto_119512 ?auto_119513 ?auto_119514 ?auto_119515 )
      ( MAKE-11PILE ?auto_119511 ?auto_119512 ?auto_119513 ?auto_119514 ?auto_119515 ?auto_119516 ?auto_119517 ?auto_119518 ?auto_119519 ?auto_119520 ?auto_119521 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119534 - BLOCK
      ?auto_119535 - BLOCK
      ?auto_119536 - BLOCK
      ?auto_119537 - BLOCK
      ?auto_119538 - BLOCK
      ?auto_119539 - BLOCK
      ?auto_119540 - BLOCK
      ?auto_119541 - BLOCK
      ?auto_119542 - BLOCK
      ?auto_119543 - BLOCK
      ?auto_119544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119544 ) ( ON-TABLE ?auto_119534 ) ( ON ?auto_119535 ?auto_119534 ) ( ON ?auto_119536 ?auto_119535 ) ( ON ?auto_119537 ?auto_119536 ) ( not ( = ?auto_119534 ?auto_119535 ) ) ( not ( = ?auto_119534 ?auto_119536 ) ) ( not ( = ?auto_119534 ?auto_119537 ) ) ( not ( = ?auto_119534 ?auto_119538 ) ) ( not ( = ?auto_119534 ?auto_119539 ) ) ( not ( = ?auto_119534 ?auto_119540 ) ) ( not ( = ?auto_119534 ?auto_119541 ) ) ( not ( = ?auto_119534 ?auto_119542 ) ) ( not ( = ?auto_119534 ?auto_119543 ) ) ( not ( = ?auto_119534 ?auto_119544 ) ) ( not ( = ?auto_119535 ?auto_119536 ) ) ( not ( = ?auto_119535 ?auto_119537 ) ) ( not ( = ?auto_119535 ?auto_119538 ) ) ( not ( = ?auto_119535 ?auto_119539 ) ) ( not ( = ?auto_119535 ?auto_119540 ) ) ( not ( = ?auto_119535 ?auto_119541 ) ) ( not ( = ?auto_119535 ?auto_119542 ) ) ( not ( = ?auto_119535 ?auto_119543 ) ) ( not ( = ?auto_119535 ?auto_119544 ) ) ( not ( = ?auto_119536 ?auto_119537 ) ) ( not ( = ?auto_119536 ?auto_119538 ) ) ( not ( = ?auto_119536 ?auto_119539 ) ) ( not ( = ?auto_119536 ?auto_119540 ) ) ( not ( = ?auto_119536 ?auto_119541 ) ) ( not ( = ?auto_119536 ?auto_119542 ) ) ( not ( = ?auto_119536 ?auto_119543 ) ) ( not ( = ?auto_119536 ?auto_119544 ) ) ( not ( = ?auto_119537 ?auto_119538 ) ) ( not ( = ?auto_119537 ?auto_119539 ) ) ( not ( = ?auto_119537 ?auto_119540 ) ) ( not ( = ?auto_119537 ?auto_119541 ) ) ( not ( = ?auto_119537 ?auto_119542 ) ) ( not ( = ?auto_119537 ?auto_119543 ) ) ( not ( = ?auto_119537 ?auto_119544 ) ) ( not ( = ?auto_119538 ?auto_119539 ) ) ( not ( = ?auto_119538 ?auto_119540 ) ) ( not ( = ?auto_119538 ?auto_119541 ) ) ( not ( = ?auto_119538 ?auto_119542 ) ) ( not ( = ?auto_119538 ?auto_119543 ) ) ( not ( = ?auto_119538 ?auto_119544 ) ) ( not ( = ?auto_119539 ?auto_119540 ) ) ( not ( = ?auto_119539 ?auto_119541 ) ) ( not ( = ?auto_119539 ?auto_119542 ) ) ( not ( = ?auto_119539 ?auto_119543 ) ) ( not ( = ?auto_119539 ?auto_119544 ) ) ( not ( = ?auto_119540 ?auto_119541 ) ) ( not ( = ?auto_119540 ?auto_119542 ) ) ( not ( = ?auto_119540 ?auto_119543 ) ) ( not ( = ?auto_119540 ?auto_119544 ) ) ( not ( = ?auto_119541 ?auto_119542 ) ) ( not ( = ?auto_119541 ?auto_119543 ) ) ( not ( = ?auto_119541 ?auto_119544 ) ) ( not ( = ?auto_119542 ?auto_119543 ) ) ( not ( = ?auto_119542 ?auto_119544 ) ) ( not ( = ?auto_119543 ?auto_119544 ) ) ( ON ?auto_119543 ?auto_119544 ) ( ON ?auto_119542 ?auto_119543 ) ( ON ?auto_119541 ?auto_119542 ) ( ON ?auto_119540 ?auto_119541 ) ( ON ?auto_119539 ?auto_119540 ) ( CLEAR ?auto_119537 ) ( ON ?auto_119538 ?auto_119539 ) ( CLEAR ?auto_119538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_119534 ?auto_119535 ?auto_119536 ?auto_119537 ?auto_119538 )
      ( MAKE-11PILE ?auto_119534 ?auto_119535 ?auto_119536 ?auto_119537 ?auto_119538 ?auto_119539 ?auto_119540 ?auto_119541 ?auto_119542 ?auto_119543 ?auto_119544 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119556 - BLOCK
      ?auto_119557 - BLOCK
      ?auto_119558 - BLOCK
      ?auto_119559 - BLOCK
      ?auto_119560 - BLOCK
      ?auto_119561 - BLOCK
      ?auto_119562 - BLOCK
      ?auto_119563 - BLOCK
      ?auto_119564 - BLOCK
      ?auto_119565 - BLOCK
      ?auto_119566 - BLOCK
    )
    :vars
    (
      ?auto_119567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119566 ?auto_119567 ) ( ON-TABLE ?auto_119556 ) ( ON ?auto_119557 ?auto_119556 ) ( ON ?auto_119558 ?auto_119557 ) ( not ( = ?auto_119556 ?auto_119557 ) ) ( not ( = ?auto_119556 ?auto_119558 ) ) ( not ( = ?auto_119556 ?auto_119559 ) ) ( not ( = ?auto_119556 ?auto_119560 ) ) ( not ( = ?auto_119556 ?auto_119561 ) ) ( not ( = ?auto_119556 ?auto_119562 ) ) ( not ( = ?auto_119556 ?auto_119563 ) ) ( not ( = ?auto_119556 ?auto_119564 ) ) ( not ( = ?auto_119556 ?auto_119565 ) ) ( not ( = ?auto_119556 ?auto_119566 ) ) ( not ( = ?auto_119556 ?auto_119567 ) ) ( not ( = ?auto_119557 ?auto_119558 ) ) ( not ( = ?auto_119557 ?auto_119559 ) ) ( not ( = ?auto_119557 ?auto_119560 ) ) ( not ( = ?auto_119557 ?auto_119561 ) ) ( not ( = ?auto_119557 ?auto_119562 ) ) ( not ( = ?auto_119557 ?auto_119563 ) ) ( not ( = ?auto_119557 ?auto_119564 ) ) ( not ( = ?auto_119557 ?auto_119565 ) ) ( not ( = ?auto_119557 ?auto_119566 ) ) ( not ( = ?auto_119557 ?auto_119567 ) ) ( not ( = ?auto_119558 ?auto_119559 ) ) ( not ( = ?auto_119558 ?auto_119560 ) ) ( not ( = ?auto_119558 ?auto_119561 ) ) ( not ( = ?auto_119558 ?auto_119562 ) ) ( not ( = ?auto_119558 ?auto_119563 ) ) ( not ( = ?auto_119558 ?auto_119564 ) ) ( not ( = ?auto_119558 ?auto_119565 ) ) ( not ( = ?auto_119558 ?auto_119566 ) ) ( not ( = ?auto_119558 ?auto_119567 ) ) ( not ( = ?auto_119559 ?auto_119560 ) ) ( not ( = ?auto_119559 ?auto_119561 ) ) ( not ( = ?auto_119559 ?auto_119562 ) ) ( not ( = ?auto_119559 ?auto_119563 ) ) ( not ( = ?auto_119559 ?auto_119564 ) ) ( not ( = ?auto_119559 ?auto_119565 ) ) ( not ( = ?auto_119559 ?auto_119566 ) ) ( not ( = ?auto_119559 ?auto_119567 ) ) ( not ( = ?auto_119560 ?auto_119561 ) ) ( not ( = ?auto_119560 ?auto_119562 ) ) ( not ( = ?auto_119560 ?auto_119563 ) ) ( not ( = ?auto_119560 ?auto_119564 ) ) ( not ( = ?auto_119560 ?auto_119565 ) ) ( not ( = ?auto_119560 ?auto_119566 ) ) ( not ( = ?auto_119560 ?auto_119567 ) ) ( not ( = ?auto_119561 ?auto_119562 ) ) ( not ( = ?auto_119561 ?auto_119563 ) ) ( not ( = ?auto_119561 ?auto_119564 ) ) ( not ( = ?auto_119561 ?auto_119565 ) ) ( not ( = ?auto_119561 ?auto_119566 ) ) ( not ( = ?auto_119561 ?auto_119567 ) ) ( not ( = ?auto_119562 ?auto_119563 ) ) ( not ( = ?auto_119562 ?auto_119564 ) ) ( not ( = ?auto_119562 ?auto_119565 ) ) ( not ( = ?auto_119562 ?auto_119566 ) ) ( not ( = ?auto_119562 ?auto_119567 ) ) ( not ( = ?auto_119563 ?auto_119564 ) ) ( not ( = ?auto_119563 ?auto_119565 ) ) ( not ( = ?auto_119563 ?auto_119566 ) ) ( not ( = ?auto_119563 ?auto_119567 ) ) ( not ( = ?auto_119564 ?auto_119565 ) ) ( not ( = ?auto_119564 ?auto_119566 ) ) ( not ( = ?auto_119564 ?auto_119567 ) ) ( not ( = ?auto_119565 ?auto_119566 ) ) ( not ( = ?auto_119565 ?auto_119567 ) ) ( not ( = ?auto_119566 ?auto_119567 ) ) ( ON ?auto_119565 ?auto_119566 ) ( ON ?auto_119564 ?auto_119565 ) ( ON ?auto_119563 ?auto_119564 ) ( ON ?auto_119562 ?auto_119563 ) ( ON ?auto_119561 ?auto_119562 ) ( ON ?auto_119560 ?auto_119561 ) ( CLEAR ?auto_119558 ) ( ON ?auto_119559 ?auto_119560 ) ( CLEAR ?auto_119559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119556 ?auto_119557 ?auto_119558 ?auto_119559 )
      ( MAKE-11PILE ?auto_119556 ?auto_119557 ?auto_119558 ?auto_119559 ?auto_119560 ?auto_119561 ?auto_119562 ?auto_119563 ?auto_119564 ?auto_119565 ?auto_119566 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119579 - BLOCK
      ?auto_119580 - BLOCK
      ?auto_119581 - BLOCK
      ?auto_119582 - BLOCK
      ?auto_119583 - BLOCK
      ?auto_119584 - BLOCK
      ?auto_119585 - BLOCK
      ?auto_119586 - BLOCK
      ?auto_119587 - BLOCK
      ?auto_119588 - BLOCK
      ?auto_119589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119589 ) ( ON-TABLE ?auto_119579 ) ( ON ?auto_119580 ?auto_119579 ) ( ON ?auto_119581 ?auto_119580 ) ( not ( = ?auto_119579 ?auto_119580 ) ) ( not ( = ?auto_119579 ?auto_119581 ) ) ( not ( = ?auto_119579 ?auto_119582 ) ) ( not ( = ?auto_119579 ?auto_119583 ) ) ( not ( = ?auto_119579 ?auto_119584 ) ) ( not ( = ?auto_119579 ?auto_119585 ) ) ( not ( = ?auto_119579 ?auto_119586 ) ) ( not ( = ?auto_119579 ?auto_119587 ) ) ( not ( = ?auto_119579 ?auto_119588 ) ) ( not ( = ?auto_119579 ?auto_119589 ) ) ( not ( = ?auto_119580 ?auto_119581 ) ) ( not ( = ?auto_119580 ?auto_119582 ) ) ( not ( = ?auto_119580 ?auto_119583 ) ) ( not ( = ?auto_119580 ?auto_119584 ) ) ( not ( = ?auto_119580 ?auto_119585 ) ) ( not ( = ?auto_119580 ?auto_119586 ) ) ( not ( = ?auto_119580 ?auto_119587 ) ) ( not ( = ?auto_119580 ?auto_119588 ) ) ( not ( = ?auto_119580 ?auto_119589 ) ) ( not ( = ?auto_119581 ?auto_119582 ) ) ( not ( = ?auto_119581 ?auto_119583 ) ) ( not ( = ?auto_119581 ?auto_119584 ) ) ( not ( = ?auto_119581 ?auto_119585 ) ) ( not ( = ?auto_119581 ?auto_119586 ) ) ( not ( = ?auto_119581 ?auto_119587 ) ) ( not ( = ?auto_119581 ?auto_119588 ) ) ( not ( = ?auto_119581 ?auto_119589 ) ) ( not ( = ?auto_119582 ?auto_119583 ) ) ( not ( = ?auto_119582 ?auto_119584 ) ) ( not ( = ?auto_119582 ?auto_119585 ) ) ( not ( = ?auto_119582 ?auto_119586 ) ) ( not ( = ?auto_119582 ?auto_119587 ) ) ( not ( = ?auto_119582 ?auto_119588 ) ) ( not ( = ?auto_119582 ?auto_119589 ) ) ( not ( = ?auto_119583 ?auto_119584 ) ) ( not ( = ?auto_119583 ?auto_119585 ) ) ( not ( = ?auto_119583 ?auto_119586 ) ) ( not ( = ?auto_119583 ?auto_119587 ) ) ( not ( = ?auto_119583 ?auto_119588 ) ) ( not ( = ?auto_119583 ?auto_119589 ) ) ( not ( = ?auto_119584 ?auto_119585 ) ) ( not ( = ?auto_119584 ?auto_119586 ) ) ( not ( = ?auto_119584 ?auto_119587 ) ) ( not ( = ?auto_119584 ?auto_119588 ) ) ( not ( = ?auto_119584 ?auto_119589 ) ) ( not ( = ?auto_119585 ?auto_119586 ) ) ( not ( = ?auto_119585 ?auto_119587 ) ) ( not ( = ?auto_119585 ?auto_119588 ) ) ( not ( = ?auto_119585 ?auto_119589 ) ) ( not ( = ?auto_119586 ?auto_119587 ) ) ( not ( = ?auto_119586 ?auto_119588 ) ) ( not ( = ?auto_119586 ?auto_119589 ) ) ( not ( = ?auto_119587 ?auto_119588 ) ) ( not ( = ?auto_119587 ?auto_119589 ) ) ( not ( = ?auto_119588 ?auto_119589 ) ) ( ON ?auto_119588 ?auto_119589 ) ( ON ?auto_119587 ?auto_119588 ) ( ON ?auto_119586 ?auto_119587 ) ( ON ?auto_119585 ?auto_119586 ) ( ON ?auto_119584 ?auto_119585 ) ( ON ?auto_119583 ?auto_119584 ) ( CLEAR ?auto_119581 ) ( ON ?auto_119582 ?auto_119583 ) ( CLEAR ?auto_119582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_119579 ?auto_119580 ?auto_119581 ?auto_119582 )
      ( MAKE-11PILE ?auto_119579 ?auto_119580 ?auto_119581 ?auto_119582 ?auto_119583 ?auto_119584 ?auto_119585 ?auto_119586 ?auto_119587 ?auto_119588 ?auto_119589 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119601 - BLOCK
      ?auto_119602 - BLOCK
      ?auto_119603 - BLOCK
      ?auto_119604 - BLOCK
      ?auto_119605 - BLOCK
      ?auto_119606 - BLOCK
      ?auto_119607 - BLOCK
      ?auto_119608 - BLOCK
      ?auto_119609 - BLOCK
      ?auto_119610 - BLOCK
      ?auto_119611 - BLOCK
    )
    :vars
    (
      ?auto_119612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119611 ?auto_119612 ) ( ON-TABLE ?auto_119601 ) ( ON ?auto_119602 ?auto_119601 ) ( not ( = ?auto_119601 ?auto_119602 ) ) ( not ( = ?auto_119601 ?auto_119603 ) ) ( not ( = ?auto_119601 ?auto_119604 ) ) ( not ( = ?auto_119601 ?auto_119605 ) ) ( not ( = ?auto_119601 ?auto_119606 ) ) ( not ( = ?auto_119601 ?auto_119607 ) ) ( not ( = ?auto_119601 ?auto_119608 ) ) ( not ( = ?auto_119601 ?auto_119609 ) ) ( not ( = ?auto_119601 ?auto_119610 ) ) ( not ( = ?auto_119601 ?auto_119611 ) ) ( not ( = ?auto_119601 ?auto_119612 ) ) ( not ( = ?auto_119602 ?auto_119603 ) ) ( not ( = ?auto_119602 ?auto_119604 ) ) ( not ( = ?auto_119602 ?auto_119605 ) ) ( not ( = ?auto_119602 ?auto_119606 ) ) ( not ( = ?auto_119602 ?auto_119607 ) ) ( not ( = ?auto_119602 ?auto_119608 ) ) ( not ( = ?auto_119602 ?auto_119609 ) ) ( not ( = ?auto_119602 ?auto_119610 ) ) ( not ( = ?auto_119602 ?auto_119611 ) ) ( not ( = ?auto_119602 ?auto_119612 ) ) ( not ( = ?auto_119603 ?auto_119604 ) ) ( not ( = ?auto_119603 ?auto_119605 ) ) ( not ( = ?auto_119603 ?auto_119606 ) ) ( not ( = ?auto_119603 ?auto_119607 ) ) ( not ( = ?auto_119603 ?auto_119608 ) ) ( not ( = ?auto_119603 ?auto_119609 ) ) ( not ( = ?auto_119603 ?auto_119610 ) ) ( not ( = ?auto_119603 ?auto_119611 ) ) ( not ( = ?auto_119603 ?auto_119612 ) ) ( not ( = ?auto_119604 ?auto_119605 ) ) ( not ( = ?auto_119604 ?auto_119606 ) ) ( not ( = ?auto_119604 ?auto_119607 ) ) ( not ( = ?auto_119604 ?auto_119608 ) ) ( not ( = ?auto_119604 ?auto_119609 ) ) ( not ( = ?auto_119604 ?auto_119610 ) ) ( not ( = ?auto_119604 ?auto_119611 ) ) ( not ( = ?auto_119604 ?auto_119612 ) ) ( not ( = ?auto_119605 ?auto_119606 ) ) ( not ( = ?auto_119605 ?auto_119607 ) ) ( not ( = ?auto_119605 ?auto_119608 ) ) ( not ( = ?auto_119605 ?auto_119609 ) ) ( not ( = ?auto_119605 ?auto_119610 ) ) ( not ( = ?auto_119605 ?auto_119611 ) ) ( not ( = ?auto_119605 ?auto_119612 ) ) ( not ( = ?auto_119606 ?auto_119607 ) ) ( not ( = ?auto_119606 ?auto_119608 ) ) ( not ( = ?auto_119606 ?auto_119609 ) ) ( not ( = ?auto_119606 ?auto_119610 ) ) ( not ( = ?auto_119606 ?auto_119611 ) ) ( not ( = ?auto_119606 ?auto_119612 ) ) ( not ( = ?auto_119607 ?auto_119608 ) ) ( not ( = ?auto_119607 ?auto_119609 ) ) ( not ( = ?auto_119607 ?auto_119610 ) ) ( not ( = ?auto_119607 ?auto_119611 ) ) ( not ( = ?auto_119607 ?auto_119612 ) ) ( not ( = ?auto_119608 ?auto_119609 ) ) ( not ( = ?auto_119608 ?auto_119610 ) ) ( not ( = ?auto_119608 ?auto_119611 ) ) ( not ( = ?auto_119608 ?auto_119612 ) ) ( not ( = ?auto_119609 ?auto_119610 ) ) ( not ( = ?auto_119609 ?auto_119611 ) ) ( not ( = ?auto_119609 ?auto_119612 ) ) ( not ( = ?auto_119610 ?auto_119611 ) ) ( not ( = ?auto_119610 ?auto_119612 ) ) ( not ( = ?auto_119611 ?auto_119612 ) ) ( ON ?auto_119610 ?auto_119611 ) ( ON ?auto_119609 ?auto_119610 ) ( ON ?auto_119608 ?auto_119609 ) ( ON ?auto_119607 ?auto_119608 ) ( ON ?auto_119606 ?auto_119607 ) ( ON ?auto_119605 ?auto_119606 ) ( ON ?auto_119604 ?auto_119605 ) ( CLEAR ?auto_119602 ) ( ON ?auto_119603 ?auto_119604 ) ( CLEAR ?auto_119603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119601 ?auto_119602 ?auto_119603 )
      ( MAKE-11PILE ?auto_119601 ?auto_119602 ?auto_119603 ?auto_119604 ?auto_119605 ?auto_119606 ?auto_119607 ?auto_119608 ?auto_119609 ?auto_119610 ?auto_119611 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119624 - BLOCK
      ?auto_119625 - BLOCK
      ?auto_119626 - BLOCK
      ?auto_119627 - BLOCK
      ?auto_119628 - BLOCK
      ?auto_119629 - BLOCK
      ?auto_119630 - BLOCK
      ?auto_119631 - BLOCK
      ?auto_119632 - BLOCK
      ?auto_119633 - BLOCK
      ?auto_119634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119634 ) ( ON-TABLE ?auto_119624 ) ( ON ?auto_119625 ?auto_119624 ) ( not ( = ?auto_119624 ?auto_119625 ) ) ( not ( = ?auto_119624 ?auto_119626 ) ) ( not ( = ?auto_119624 ?auto_119627 ) ) ( not ( = ?auto_119624 ?auto_119628 ) ) ( not ( = ?auto_119624 ?auto_119629 ) ) ( not ( = ?auto_119624 ?auto_119630 ) ) ( not ( = ?auto_119624 ?auto_119631 ) ) ( not ( = ?auto_119624 ?auto_119632 ) ) ( not ( = ?auto_119624 ?auto_119633 ) ) ( not ( = ?auto_119624 ?auto_119634 ) ) ( not ( = ?auto_119625 ?auto_119626 ) ) ( not ( = ?auto_119625 ?auto_119627 ) ) ( not ( = ?auto_119625 ?auto_119628 ) ) ( not ( = ?auto_119625 ?auto_119629 ) ) ( not ( = ?auto_119625 ?auto_119630 ) ) ( not ( = ?auto_119625 ?auto_119631 ) ) ( not ( = ?auto_119625 ?auto_119632 ) ) ( not ( = ?auto_119625 ?auto_119633 ) ) ( not ( = ?auto_119625 ?auto_119634 ) ) ( not ( = ?auto_119626 ?auto_119627 ) ) ( not ( = ?auto_119626 ?auto_119628 ) ) ( not ( = ?auto_119626 ?auto_119629 ) ) ( not ( = ?auto_119626 ?auto_119630 ) ) ( not ( = ?auto_119626 ?auto_119631 ) ) ( not ( = ?auto_119626 ?auto_119632 ) ) ( not ( = ?auto_119626 ?auto_119633 ) ) ( not ( = ?auto_119626 ?auto_119634 ) ) ( not ( = ?auto_119627 ?auto_119628 ) ) ( not ( = ?auto_119627 ?auto_119629 ) ) ( not ( = ?auto_119627 ?auto_119630 ) ) ( not ( = ?auto_119627 ?auto_119631 ) ) ( not ( = ?auto_119627 ?auto_119632 ) ) ( not ( = ?auto_119627 ?auto_119633 ) ) ( not ( = ?auto_119627 ?auto_119634 ) ) ( not ( = ?auto_119628 ?auto_119629 ) ) ( not ( = ?auto_119628 ?auto_119630 ) ) ( not ( = ?auto_119628 ?auto_119631 ) ) ( not ( = ?auto_119628 ?auto_119632 ) ) ( not ( = ?auto_119628 ?auto_119633 ) ) ( not ( = ?auto_119628 ?auto_119634 ) ) ( not ( = ?auto_119629 ?auto_119630 ) ) ( not ( = ?auto_119629 ?auto_119631 ) ) ( not ( = ?auto_119629 ?auto_119632 ) ) ( not ( = ?auto_119629 ?auto_119633 ) ) ( not ( = ?auto_119629 ?auto_119634 ) ) ( not ( = ?auto_119630 ?auto_119631 ) ) ( not ( = ?auto_119630 ?auto_119632 ) ) ( not ( = ?auto_119630 ?auto_119633 ) ) ( not ( = ?auto_119630 ?auto_119634 ) ) ( not ( = ?auto_119631 ?auto_119632 ) ) ( not ( = ?auto_119631 ?auto_119633 ) ) ( not ( = ?auto_119631 ?auto_119634 ) ) ( not ( = ?auto_119632 ?auto_119633 ) ) ( not ( = ?auto_119632 ?auto_119634 ) ) ( not ( = ?auto_119633 ?auto_119634 ) ) ( ON ?auto_119633 ?auto_119634 ) ( ON ?auto_119632 ?auto_119633 ) ( ON ?auto_119631 ?auto_119632 ) ( ON ?auto_119630 ?auto_119631 ) ( ON ?auto_119629 ?auto_119630 ) ( ON ?auto_119628 ?auto_119629 ) ( ON ?auto_119627 ?auto_119628 ) ( CLEAR ?auto_119625 ) ( ON ?auto_119626 ?auto_119627 ) ( CLEAR ?auto_119626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_119624 ?auto_119625 ?auto_119626 )
      ( MAKE-11PILE ?auto_119624 ?auto_119625 ?auto_119626 ?auto_119627 ?auto_119628 ?auto_119629 ?auto_119630 ?auto_119631 ?auto_119632 ?auto_119633 ?auto_119634 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119646 - BLOCK
      ?auto_119647 - BLOCK
      ?auto_119648 - BLOCK
      ?auto_119649 - BLOCK
      ?auto_119650 - BLOCK
      ?auto_119651 - BLOCK
      ?auto_119652 - BLOCK
      ?auto_119653 - BLOCK
      ?auto_119654 - BLOCK
      ?auto_119655 - BLOCK
      ?auto_119656 - BLOCK
    )
    :vars
    (
      ?auto_119657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119656 ?auto_119657 ) ( ON-TABLE ?auto_119646 ) ( not ( = ?auto_119646 ?auto_119647 ) ) ( not ( = ?auto_119646 ?auto_119648 ) ) ( not ( = ?auto_119646 ?auto_119649 ) ) ( not ( = ?auto_119646 ?auto_119650 ) ) ( not ( = ?auto_119646 ?auto_119651 ) ) ( not ( = ?auto_119646 ?auto_119652 ) ) ( not ( = ?auto_119646 ?auto_119653 ) ) ( not ( = ?auto_119646 ?auto_119654 ) ) ( not ( = ?auto_119646 ?auto_119655 ) ) ( not ( = ?auto_119646 ?auto_119656 ) ) ( not ( = ?auto_119646 ?auto_119657 ) ) ( not ( = ?auto_119647 ?auto_119648 ) ) ( not ( = ?auto_119647 ?auto_119649 ) ) ( not ( = ?auto_119647 ?auto_119650 ) ) ( not ( = ?auto_119647 ?auto_119651 ) ) ( not ( = ?auto_119647 ?auto_119652 ) ) ( not ( = ?auto_119647 ?auto_119653 ) ) ( not ( = ?auto_119647 ?auto_119654 ) ) ( not ( = ?auto_119647 ?auto_119655 ) ) ( not ( = ?auto_119647 ?auto_119656 ) ) ( not ( = ?auto_119647 ?auto_119657 ) ) ( not ( = ?auto_119648 ?auto_119649 ) ) ( not ( = ?auto_119648 ?auto_119650 ) ) ( not ( = ?auto_119648 ?auto_119651 ) ) ( not ( = ?auto_119648 ?auto_119652 ) ) ( not ( = ?auto_119648 ?auto_119653 ) ) ( not ( = ?auto_119648 ?auto_119654 ) ) ( not ( = ?auto_119648 ?auto_119655 ) ) ( not ( = ?auto_119648 ?auto_119656 ) ) ( not ( = ?auto_119648 ?auto_119657 ) ) ( not ( = ?auto_119649 ?auto_119650 ) ) ( not ( = ?auto_119649 ?auto_119651 ) ) ( not ( = ?auto_119649 ?auto_119652 ) ) ( not ( = ?auto_119649 ?auto_119653 ) ) ( not ( = ?auto_119649 ?auto_119654 ) ) ( not ( = ?auto_119649 ?auto_119655 ) ) ( not ( = ?auto_119649 ?auto_119656 ) ) ( not ( = ?auto_119649 ?auto_119657 ) ) ( not ( = ?auto_119650 ?auto_119651 ) ) ( not ( = ?auto_119650 ?auto_119652 ) ) ( not ( = ?auto_119650 ?auto_119653 ) ) ( not ( = ?auto_119650 ?auto_119654 ) ) ( not ( = ?auto_119650 ?auto_119655 ) ) ( not ( = ?auto_119650 ?auto_119656 ) ) ( not ( = ?auto_119650 ?auto_119657 ) ) ( not ( = ?auto_119651 ?auto_119652 ) ) ( not ( = ?auto_119651 ?auto_119653 ) ) ( not ( = ?auto_119651 ?auto_119654 ) ) ( not ( = ?auto_119651 ?auto_119655 ) ) ( not ( = ?auto_119651 ?auto_119656 ) ) ( not ( = ?auto_119651 ?auto_119657 ) ) ( not ( = ?auto_119652 ?auto_119653 ) ) ( not ( = ?auto_119652 ?auto_119654 ) ) ( not ( = ?auto_119652 ?auto_119655 ) ) ( not ( = ?auto_119652 ?auto_119656 ) ) ( not ( = ?auto_119652 ?auto_119657 ) ) ( not ( = ?auto_119653 ?auto_119654 ) ) ( not ( = ?auto_119653 ?auto_119655 ) ) ( not ( = ?auto_119653 ?auto_119656 ) ) ( not ( = ?auto_119653 ?auto_119657 ) ) ( not ( = ?auto_119654 ?auto_119655 ) ) ( not ( = ?auto_119654 ?auto_119656 ) ) ( not ( = ?auto_119654 ?auto_119657 ) ) ( not ( = ?auto_119655 ?auto_119656 ) ) ( not ( = ?auto_119655 ?auto_119657 ) ) ( not ( = ?auto_119656 ?auto_119657 ) ) ( ON ?auto_119655 ?auto_119656 ) ( ON ?auto_119654 ?auto_119655 ) ( ON ?auto_119653 ?auto_119654 ) ( ON ?auto_119652 ?auto_119653 ) ( ON ?auto_119651 ?auto_119652 ) ( ON ?auto_119650 ?auto_119651 ) ( ON ?auto_119649 ?auto_119650 ) ( ON ?auto_119648 ?auto_119649 ) ( CLEAR ?auto_119646 ) ( ON ?auto_119647 ?auto_119648 ) ( CLEAR ?auto_119647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119646 ?auto_119647 )
      ( MAKE-11PILE ?auto_119646 ?auto_119647 ?auto_119648 ?auto_119649 ?auto_119650 ?auto_119651 ?auto_119652 ?auto_119653 ?auto_119654 ?auto_119655 ?auto_119656 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119669 - BLOCK
      ?auto_119670 - BLOCK
      ?auto_119671 - BLOCK
      ?auto_119672 - BLOCK
      ?auto_119673 - BLOCK
      ?auto_119674 - BLOCK
      ?auto_119675 - BLOCK
      ?auto_119676 - BLOCK
      ?auto_119677 - BLOCK
      ?auto_119678 - BLOCK
      ?auto_119679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119679 ) ( ON-TABLE ?auto_119669 ) ( not ( = ?auto_119669 ?auto_119670 ) ) ( not ( = ?auto_119669 ?auto_119671 ) ) ( not ( = ?auto_119669 ?auto_119672 ) ) ( not ( = ?auto_119669 ?auto_119673 ) ) ( not ( = ?auto_119669 ?auto_119674 ) ) ( not ( = ?auto_119669 ?auto_119675 ) ) ( not ( = ?auto_119669 ?auto_119676 ) ) ( not ( = ?auto_119669 ?auto_119677 ) ) ( not ( = ?auto_119669 ?auto_119678 ) ) ( not ( = ?auto_119669 ?auto_119679 ) ) ( not ( = ?auto_119670 ?auto_119671 ) ) ( not ( = ?auto_119670 ?auto_119672 ) ) ( not ( = ?auto_119670 ?auto_119673 ) ) ( not ( = ?auto_119670 ?auto_119674 ) ) ( not ( = ?auto_119670 ?auto_119675 ) ) ( not ( = ?auto_119670 ?auto_119676 ) ) ( not ( = ?auto_119670 ?auto_119677 ) ) ( not ( = ?auto_119670 ?auto_119678 ) ) ( not ( = ?auto_119670 ?auto_119679 ) ) ( not ( = ?auto_119671 ?auto_119672 ) ) ( not ( = ?auto_119671 ?auto_119673 ) ) ( not ( = ?auto_119671 ?auto_119674 ) ) ( not ( = ?auto_119671 ?auto_119675 ) ) ( not ( = ?auto_119671 ?auto_119676 ) ) ( not ( = ?auto_119671 ?auto_119677 ) ) ( not ( = ?auto_119671 ?auto_119678 ) ) ( not ( = ?auto_119671 ?auto_119679 ) ) ( not ( = ?auto_119672 ?auto_119673 ) ) ( not ( = ?auto_119672 ?auto_119674 ) ) ( not ( = ?auto_119672 ?auto_119675 ) ) ( not ( = ?auto_119672 ?auto_119676 ) ) ( not ( = ?auto_119672 ?auto_119677 ) ) ( not ( = ?auto_119672 ?auto_119678 ) ) ( not ( = ?auto_119672 ?auto_119679 ) ) ( not ( = ?auto_119673 ?auto_119674 ) ) ( not ( = ?auto_119673 ?auto_119675 ) ) ( not ( = ?auto_119673 ?auto_119676 ) ) ( not ( = ?auto_119673 ?auto_119677 ) ) ( not ( = ?auto_119673 ?auto_119678 ) ) ( not ( = ?auto_119673 ?auto_119679 ) ) ( not ( = ?auto_119674 ?auto_119675 ) ) ( not ( = ?auto_119674 ?auto_119676 ) ) ( not ( = ?auto_119674 ?auto_119677 ) ) ( not ( = ?auto_119674 ?auto_119678 ) ) ( not ( = ?auto_119674 ?auto_119679 ) ) ( not ( = ?auto_119675 ?auto_119676 ) ) ( not ( = ?auto_119675 ?auto_119677 ) ) ( not ( = ?auto_119675 ?auto_119678 ) ) ( not ( = ?auto_119675 ?auto_119679 ) ) ( not ( = ?auto_119676 ?auto_119677 ) ) ( not ( = ?auto_119676 ?auto_119678 ) ) ( not ( = ?auto_119676 ?auto_119679 ) ) ( not ( = ?auto_119677 ?auto_119678 ) ) ( not ( = ?auto_119677 ?auto_119679 ) ) ( not ( = ?auto_119678 ?auto_119679 ) ) ( ON ?auto_119678 ?auto_119679 ) ( ON ?auto_119677 ?auto_119678 ) ( ON ?auto_119676 ?auto_119677 ) ( ON ?auto_119675 ?auto_119676 ) ( ON ?auto_119674 ?auto_119675 ) ( ON ?auto_119673 ?auto_119674 ) ( ON ?auto_119672 ?auto_119673 ) ( ON ?auto_119671 ?auto_119672 ) ( CLEAR ?auto_119669 ) ( ON ?auto_119670 ?auto_119671 ) ( CLEAR ?auto_119670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_119669 ?auto_119670 )
      ( MAKE-11PILE ?auto_119669 ?auto_119670 ?auto_119671 ?auto_119672 ?auto_119673 ?auto_119674 ?auto_119675 ?auto_119676 ?auto_119677 ?auto_119678 ?auto_119679 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119691 - BLOCK
      ?auto_119692 - BLOCK
      ?auto_119693 - BLOCK
      ?auto_119694 - BLOCK
      ?auto_119695 - BLOCK
      ?auto_119696 - BLOCK
      ?auto_119697 - BLOCK
      ?auto_119698 - BLOCK
      ?auto_119699 - BLOCK
      ?auto_119700 - BLOCK
      ?auto_119701 - BLOCK
    )
    :vars
    (
      ?auto_119702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_119701 ?auto_119702 ) ( not ( = ?auto_119691 ?auto_119692 ) ) ( not ( = ?auto_119691 ?auto_119693 ) ) ( not ( = ?auto_119691 ?auto_119694 ) ) ( not ( = ?auto_119691 ?auto_119695 ) ) ( not ( = ?auto_119691 ?auto_119696 ) ) ( not ( = ?auto_119691 ?auto_119697 ) ) ( not ( = ?auto_119691 ?auto_119698 ) ) ( not ( = ?auto_119691 ?auto_119699 ) ) ( not ( = ?auto_119691 ?auto_119700 ) ) ( not ( = ?auto_119691 ?auto_119701 ) ) ( not ( = ?auto_119691 ?auto_119702 ) ) ( not ( = ?auto_119692 ?auto_119693 ) ) ( not ( = ?auto_119692 ?auto_119694 ) ) ( not ( = ?auto_119692 ?auto_119695 ) ) ( not ( = ?auto_119692 ?auto_119696 ) ) ( not ( = ?auto_119692 ?auto_119697 ) ) ( not ( = ?auto_119692 ?auto_119698 ) ) ( not ( = ?auto_119692 ?auto_119699 ) ) ( not ( = ?auto_119692 ?auto_119700 ) ) ( not ( = ?auto_119692 ?auto_119701 ) ) ( not ( = ?auto_119692 ?auto_119702 ) ) ( not ( = ?auto_119693 ?auto_119694 ) ) ( not ( = ?auto_119693 ?auto_119695 ) ) ( not ( = ?auto_119693 ?auto_119696 ) ) ( not ( = ?auto_119693 ?auto_119697 ) ) ( not ( = ?auto_119693 ?auto_119698 ) ) ( not ( = ?auto_119693 ?auto_119699 ) ) ( not ( = ?auto_119693 ?auto_119700 ) ) ( not ( = ?auto_119693 ?auto_119701 ) ) ( not ( = ?auto_119693 ?auto_119702 ) ) ( not ( = ?auto_119694 ?auto_119695 ) ) ( not ( = ?auto_119694 ?auto_119696 ) ) ( not ( = ?auto_119694 ?auto_119697 ) ) ( not ( = ?auto_119694 ?auto_119698 ) ) ( not ( = ?auto_119694 ?auto_119699 ) ) ( not ( = ?auto_119694 ?auto_119700 ) ) ( not ( = ?auto_119694 ?auto_119701 ) ) ( not ( = ?auto_119694 ?auto_119702 ) ) ( not ( = ?auto_119695 ?auto_119696 ) ) ( not ( = ?auto_119695 ?auto_119697 ) ) ( not ( = ?auto_119695 ?auto_119698 ) ) ( not ( = ?auto_119695 ?auto_119699 ) ) ( not ( = ?auto_119695 ?auto_119700 ) ) ( not ( = ?auto_119695 ?auto_119701 ) ) ( not ( = ?auto_119695 ?auto_119702 ) ) ( not ( = ?auto_119696 ?auto_119697 ) ) ( not ( = ?auto_119696 ?auto_119698 ) ) ( not ( = ?auto_119696 ?auto_119699 ) ) ( not ( = ?auto_119696 ?auto_119700 ) ) ( not ( = ?auto_119696 ?auto_119701 ) ) ( not ( = ?auto_119696 ?auto_119702 ) ) ( not ( = ?auto_119697 ?auto_119698 ) ) ( not ( = ?auto_119697 ?auto_119699 ) ) ( not ( = ?auto_119697 ?auto_119700 ) ) ( not ( = ?auto_119697 ?auto_119701 ) ) ( not ( = ?auto_119697 ?auto_119702 ) ) ( not ( = ?auto_119698 ?auto_119699 ) ) ( not ( = ?auto_119698 ?auto_119700 ) ) ( not ( = ?auto_119698 ?auto_119701 ) ) ( not ( = ?auto_119698 ?auto_119702 ) ) ( not ( = ?auto_119699 ?auto_119700 ) ) ( not ( = ?auto_119699 ?auto_119701 ) ) ( not ( = ?auto_119699 ?auto_119702 ) ) ( not ( = ?auto_119700 ?auto_119701 ) ) ( not ( = ?auto_119700 ?auto_119702 ) ) ( not ( = ?auto_119701 ?auto_119702 ) ) ( ON ?auto_119700 ?auto_119701 ) ( ON ?auto_119699 ?auto_119700 ) ( ON ?auto_119698 ?auto_119699 ) ( ON ?auto_119697 ?auto_119698 ) ( ON ?auto_119696 ?auto_119697 ) ( ON ?auto_119695 ?auto_119696 ) ( ON ?auto_119694 ?auto_119695 ) ( ON ?auto_119693 ?auto_119694 ) ( ON ?auto_119692 ?auto_119693 ) ( ON ?auto_119691 ?auto_119692 ) ( CLEAR ?auto_119691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119691 )
      ( MAKE-11PILE ?auto_119691 ?auto_119692 ?auto_119693 ?auto_119694 ?auto_119695 ?auto_119696 ?auto_119697 ?auto_119698 ?auto_119699 ?auto_119700 ?auto_119701 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119714 - BLOCK
      ?auto_119715 - BLOCK
      ?auto_119716 - BLOCK
      ?auto_119717 - BLOCK
      ?auto_119718 - BLOCK
      ?auto_119719 - BLOCK
      ?auto_119720 - BLOCK
      ?auto_119721 - BLOCK
      ?auto_119722 - BLOCK
      ?auto_119723 - BLOCK
      ?auto_119724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_119724 ) ( not ( = ?auto_119714 ?auto_119715 ) ) ( not ( = ?auto_119714 ?auto_119716 ) ) ( not ( = ?auto_119714 ?auto_119717 ) ) ( not ( = ?auto_119714 ?auto_119718 ) ) ( not ( = ?auto_119714 ?auto_119719 ) ) ( not ( = ?auto_119714 ?auto_119720 ) ) ( not ( = ?auto_119714 ?auto_119721 ) ) ( not ( = ?auto_119714 ?auto_119722 ) ) ( not ( = ?auto_119714 ?auto_119723 ) ) ( not ( = ?auto_119714 ?auto_119724 ) ) ( not ( = ?auto_119715 ?auto_119716 ) ) ( not ( = ?auto_119715 ?auto_119717 ) ) ( not ( = ?auto_119715 ?auto_119718 ) ) ( not ( = ?auto_119715 ?auto_119719 ) ) ( not ( = ?auto_119715 ?auto_119720 ) ) ( not ( = ?auto_119715 ?auto_119721 ) ) ( not ( = ?auto_119715 ?auto_119722 ) ) ( not ( = ?auto_119715 ?auto_119723 ) ) ( not ( = ?auto_119715 ?auto_119724 ) ) ( not ( = ?auto_119716 ?auto_119717 ) ) ( not ( = ?auto_119716 ?auto_119718 ) ) ( not ( = ?auto_119716 ?auto_119719 ) ) ( not ( = ?auto_119716 ?auto_119720 ) ) ( not ( = ?auto_119716 ?auto_119721 ) ) ( not ( = ?auto_119716 ?auto_119722 ) ) ( not ( = ?auto_119716 ?auto_119723 ) ) ( not ( = ?auto_119716 ?auto_119724 ) ) ( not ( = ?auto_119717 ?auto_119718 ) ) ( not ( = ?auto_119717 ?auto_119719 ) ) ( not ( = ?auto_119717 ?auto_119720 ) ) ( not ( = ?auto_119717 ?auto_119721 ) ) ( not ( = ?auto_119717 ?auto_119722 ) ) ( not ( = ?auto_119717 ?auto_119723 ) ) ( not ( = ?auto_119717 ?auto_119724 ) ) ( not ( = ?auto_119718 ?auto_119719 ) ) ( not ( = ?auto_119718 ?auto_119720 ) ) ( not ( = ?auto_119718 ?auto_119721 ) ) ( not ( = ?auto_119718 ?auto_119722 ) ) ( not ( = ?auto_119718 ?auto_119723 ) ) ( not ( = ?auto_119718 ?auto_119724 ) ) ( not ( = ?auto_119719 ?auto_119720 ) ) ( not ( = ?auto_119719 ?auto_119721 ) ) ( not ( = ?auto_119719 ?auto_119722 ) ) ( not ( = ?auto_119719 ?auto_119723 ) ) ( not ( = ?auto_119719 ?auto_119724 ) ) ( not ( = ?auto_119720 ?auto_119721 ) ) ( not ( = ?auto_119720 ?auto_119722 ) ) ( not ( = ?auto_119720 ?auto_119723 ) ) ( not ( = ?auto_119720 ?auto_119724 ) ) ( not ( = ?auto_119721 ?auto_119722 ) ) ( not ( = ?auto_119721 ?auto_119723 ) ) ( not ( = ?auto_119721 ?auto_119724 ) ) ( not ( = ?auto_119722 ?auto_119723 ) ) ( not ( = ?auto_119722 ?auto_119724 ) ) ( not ( = ?auto_119723 ?auto_119724 ) ) ( ON ?auto_119723 ?auto_119724 ) ( ON ?auto_119722 ?auto_119723 ) ( ON ?auto_119721 ?auto_119722 ) ( ON ?auto_119720 ?auto_119721 ) ( ON ?auto_119719 ?auto_119720 ) ( ON ?auto_119718 ?auto_119719 ) ( ON ?auto_119717 ?auto_119718 ) ( ON ?auto_119716 ?auto_119717 ) ( ON ?auto_119715 ?auto_119716 ) ( ON ?auto_119714 ?auto_119715 ) ( CLEAR ?auto_119714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_119714 )
      ( MAKE-11PILE ?auto_119714 ?auto_119715 ?auto_119716 ?auto_119717 ?auto_119718 ?auto_119719 ?auto_119720 ?auto_119721 ?auto_119722 ?auto_119723 ?auto_119724 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_119736 - BLOCK
      ?auto_119737 - BLOCK
      ?auto_119738 - BLOCK
      ?auto_119739 - BLOCK
      ?auto_119740 - BLOCK
      ?auto_119741 - BLOCK
      ?auto_119742 - BLOCK
      ?auto_119743 - BLOCK
      ?auto_119744 - BLOCK
      ?auto_119745 - BLOCK
      ?auto_119746 - BLOCK
    )
    :vars
    (
      ?auto_119747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_119736 ?auto_119737 ) ) ( not ( = ?auto_119736 ?auto_119738 ) ) ( not ( = ?auto_119736 ?auto_119739 ) ) ( not ( = ?auto_119736 ?auto_119740 ) ) ( not ( = ?auto_119736 ?auto_119741 ) ) ( not ( = ?auto_119736 ?auto_119742 ) ) ( not ( = ?auto_119736 ?auto_119743 ) ) ( not ( = ?auto_119736 ?auto_119744 ) ) ( not ( = ?auto_119736 ?auto_119745 ) ) ( not ( = ?auto_119736 ?auto_119746 ) ) ( not ( = ?auto_119737 ?auto_119738 ) ) ( not ( = ?auto_119737 ?auto_119739 ) ) ( not ( = ?auto_119737 ?auto_119740 ) ) ( not ( = ?auto_119737 ?auto_119741 ) ) ( not ( = ?auto_119737 ?auto_119742 ) ) ( not ( = ?auto_119737 ?auto_119743 ) ) ( not ( = ?auto_119737 ?auto_119744 ) ) ( not ( = ?auto_119737 ?auto_119745 ) ) ( not ( = ?auto_119737 ?auto_119746 ) ) ( not ( = ?auto_119738 ?auto_119739 ) ) ( not ( = ?auto_119738 ?auto_119740 ) ) ( not ( = ?auto_119738 ?auto_119741 ) ) ( not ( = ?auto_119738 ?auto_119742 ) ) ( not ( = ?auto_119738 ?auto_119743 ) ) ( not ( = ?auto_119738 ?auto_119744 ) ) ( not ( = ?auto_119738 ?auto_119745 ) ) ( not ( = ?auto_119738 ?auto_119746 ) ) ( not ( = ?auto_119739 ?auto_119740 ) ) ( not ( = ?auto_119739 ?auto_119741 ) ) ( not ( = ?auto_119739 ?auto_119742 ) ) ( not ( = ?auto_119739 ?auto_119743 ) ) ( not ( = ?auto_119739 ?auto_119744 ) ) ( not ( = ?auto_119739 ?auto_119745 ) ) ( not ( = ?auto_119739 ?auto_119746 ) ) ( not ( = ?auto_119740 ?auto_119741 ) ) ( not ( = ?auto_119740 ?auto_119742 ) ) ( not ( = ?auto_119740 ?auto_119743 ) ) ( not ( = ?auto_119740 ?auto_119744 ) ) ( not ( = ?auto_119740 ?auto_119745 ) ) ( not ( = ?auto_119740 ?auto_119746 ) ) ( not ( = ?auto_119741 ?auto_119742 ) ) ( not ( = ?auto_119741 ?auto_119743 ) ) ( not ( = ?auto_119741 ?auto_119744 ) ) ( not ( = ?auto_119741 ?auto_119745 ) ) ( not ( = ?auto_119741 ?auto_119746 ) ) ( not ( = ?auto_119742 ?auto_119743 ) ) ( not ( = ?auto_119742 ?auto_119744 ) ) ( not ( = ?auto_119742 ?auto_119745 ) ) ( not ( = ?auto_119742 ?auto_119746 ) ) ( not ( = ?auto_119743 ?auto_119744 ) ) ( not ( = ?auto_119743 ?auto_119745 ) ) ( not ( = ?auto_119743 ?auto_119746 ) ) ( not ( = ?auto_119744 ?auto_119745 ) ) ( not ( = ?auto_119744 ?auto_119746 ) ) ( not ( = ?auto_119745 ?auto_119746 ) ) ( ON ?auto_119736 ?auto_119747 ) ( not ( = ?auto_119746 ?auto_119747 ) ) ( not ( = ?auto_119745 ?auto_119747 ) ) ( not ( = ?auto_119744 ?auto_119747 ) ) ( not ( = ?auto_119743 ?auto_119747 ) ) ( not ( = ?auto_119742 ?auto_119747 ) ) ( not ( = ?auto_119741 ?auto_119747 ) ) ( not ( = ?auto_119740 ?auto_119747 ) ) ( not ( = ?auto_119739 ?auto_119747 ) ) ( not ( = ?auto_119738 ?auto_119747 ) ) ( not ( = ?auto_119737 ?auto_119747 ) ) ( not ( = ?auto_119736 ?auto_119747 ) ) ( ON ?auto_119737 ?auto_119736 ) ( ON ?auto_119738 ?auto_119737 ) ( ON ?auto_119739 ?auto_119738 ) ( ON ?auto_119740 ?auto_119739 ) ( ON ?auto_119741 ?auto_119740 ) ( ON ?auto_119742 ?auto_119741 ) ( ON ?auto_119743 ?auto_119742 ) ( ON ?auto_119744 ?auto_119743 ) ( ON ?auto_119745 ?auto_119744 ) ( ON ?auto_119746 ?auto_119745 ) ( CLEAR ?auto_119746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_119746 ?auto_119745 ?auto_119744 ?auto_119743 ?auto_119742 ?auto_119741 ?auto_119740 ?auto_119739 ?auto_119738 ?auto_119737 ?auto_119736 )
      ( MAKE-11PILE ?auto_119736 ?auto_119737 ?auto_119738 ?auto_119739 ?auto_119740 ?auto_119741 ?auto_119742 ?auto_119743 ?auto_119744 ?auto_119745 ?auto_119746 ) )
  )

)

