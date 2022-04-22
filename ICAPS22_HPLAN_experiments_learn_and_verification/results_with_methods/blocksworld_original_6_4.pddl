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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_46642 - BLOCK
      ?auto_46643 - BLOCK
      ?auto_46644 - BLOCK
      ?auto_46645 - BLOCK
      ?auto_46646 - BLOCK
      ?auto_46647 - BLOCK
    )
    :vars
    (
      ?auto_46648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46648 ?auto_46647 ) ( CLEAR ?auto_46648 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46642 ) ( ON ?auto_46643 ?auto_46642 ) ( ON ?auto_46644 ?auto_46643 ) ( ON ?auto_46645 ?auto_46644 ) ( ON ?auto_46646 ?auto_46645 ) ( ON ?auto_46647 ?auto_46646 ) ( not ( = ?auto_46642 ?auto_46643 ) ) ( not ( = ?auto_46642 ?auto_46644 ) ) ( not ( = ?auto_46642 ?auto_46645 ) ) ( not ( = ?auto_46642 ?auto_46646 ) ) ( not ( = ?auto_46642 ?auto_46647 ) ) ( not ( = ?auto_46642 ?auto_46648 ) ) ( not ( = ?auto_46643 ?auto_46644 ) ) ( not ( = ?auto_46643 ?auto_46645 ) ) ( not ( = ?auto_46643 ?auto_46646 ) ) ( not ( = ?auto_46643 ?auto_46647 ) ) ( not ( = ?auto_46643 ?auto_46648 ) ) ( not ( = ?auto_46644 ?auto_46645 ) ) ( not ( = ?auto_46644 ?auto_46646 ) ) ( not ( = ?auto_46644 ?auto_46647 ) ) ( not ( = ?auto_46644 ?auto_46648 ) ) ( not ( = ?auto_46645 ?auto_46646 ) ) ( not ( = ?auto_46645 ?auto_46647 ) ) ( not ( = ?auto_46645 ?auto_46648 ) ) ( not ( = ?auto_46646 ?auto_46647 ) ) ( not ( = ?auto_46646 ?auto_46648 ) ) ( not ( = ?auto_46647 ?auto_46648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46648 ?auto_46647 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46650 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_46650 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_46650 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46651 - BLOCK
    )
    :vars
    (
      ?auto_46652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46651 ?auto_46652 ) ( CLEAR ?auto_46651 ) ( HAND-EMPTY ) ( not ( = ?auto_46651 ?auto_46652 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46651 ?auto_46652 )
      ( MAKE-1PILE ?auto_46651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46658 - BLOCK
      ?auto_46659 - BLOCK
      ?auto_46660 - BLOCK
      ?auto_46661 - BLOCK
      ?auto_46662 - BLOCK
    )
    :vars
    (
      ?auto_46663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46663 ?auto_46662 ) ( CLEAR ?auto_46663 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46658 ) ( ON ?auto_46659 ?auto_46658 ) ( ON ?auto_46660 ?auto_46659 ) ( ON ?auto_46661 ?auto_46660 ) ( ON ?auto_46662 ?auto_46661 ) ( not ( = ?auto_46658 ?auto_46659 ) ) ( not ( = ?auto_46658 ?auto_46660 ) ) ( not ( = ?auto_46658 ?auto_46661 ) ) ( not ( = ?auto_46658 ?auto_46662 ) ) ( not ( = ?auto_46658 ?auto_46663 ) ) ( not ( = ?auto_46659 ?auto_46660 ) ) ( not ( = ?auto_46659 ?auto_46661 ) ) ( not ( = ?auto_46659 ?auto_46662 ) ) ( not ( = ?auto_46659 ?auto_46663 ) ) ( not ( = ?auto_46660 ?auto_46661 ) ) ( not ( = ?auto_46660 ?auto_46662 ) ) ( not ( = ?auto_46660 ?auto_46663 ) ) ( not ( = ?auto_46661 ?auto_46662 ) ) ( not ( = ?auto_46661 ?auto_46663 ) ) ( not ( = ?auto_46662 ?auto_46663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46663 ?auto_46662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46664 - BLOCK
      ?auto_46665 - BLOCK
      ?auto_46666 - BLOCK
      ?auto_46667 - BLOCK
      ?auto_46668 - BLOCK
    )
    :vars
    (
      ?auto_46669 - BLOCK
      ?auto_46670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46669 ?auto_46668 ) ( CLEAR ?auto_46669 ) ( ON-TABLE ?auto_46664 ) ( ON ?auto_46665 ?auto_46664 ) ( ON ?auto_46666 ?auto_46665 ) ( ON ?auto_46667 ?auto_46666 ) ( ON ?auto_46668 ?auto_46667 ) ( not ( = ?auto_46664 ?auto_46665 ) ) ( not ( = ?auto_46664 ?auto_46666 ) ) ( not ( = ?auto_46664 ?auto_46667 ) ) ( not ( = ?auto_46664 ?auto_46668 ) ) ( not ( = ?auto_46664 ?auto_46669 ) ) ( not ( = ?auto_46665 ?auto_46666 ) ) ( not ( = ?auto_46665 ?auto_46667 ) ) ( not ( = ?auto_46665 ?auto_46668 ) ) ( not ( = ?auto_46665 ?auto_46669 ) ) ( not ( = ?auto_46666 ?auto_46667 ) ) ( not ( = ?auto_46666 ?auto_46668 ) ) ( not ( = ?auto_46666 ?auto_46669 ) ) ( not ( = ?auto_46667 ?auto_46668 ) ) ( not ( = ?auto_46667 ?auto_46669 ) ) ( not ( = ?auto_46668 ?auto_46669 ) ) ( HOLDING ?auto_46670 ) ( not ( = ?auto_46664 ?auto_46670 ) ) ( not ( = ?auto_46665 ?auto_46670 ) ) ( not ( = ?auto_46666 ?auto_46670 ) ) ( not ( = ?auto_46667 ?auto_46670 ) ) ( not ( = ?auto_46668 ?auto_46670 ) ) ( not ( = ?auto_46669 ?auto_46670 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_46670 )
      ( MAKE-5PILE ?auto_46664 ?auto_46665 ?auto_46666 ?auto_46667 ?auto_46668 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46671 - BLOCK
      ?auto_46672 - BLOCK
      ?auto_46673 - BLOCK
      ?auto_46674 - BLOCK
      ?auto_46675 - BLOCK
    )
    :vars
    (
      ?auto_46676 - BLOCK
      ?auto_46677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46676 ?auto_46675 ) ( ON-TABLE ?auto_46671 ) ( ON ?auto_46672 ?auto_46671 ) ( ON ?auto_46673 ?auto_46672 ) ( ON ?auto_46674 ?auto_46673 ) ( ON ?auto_46675 ?auto_46674 ) ( not ( = ?auto_46671 ?auto_46672 ) ) ( not ( = ?auto_46671 ?auto_46673 ) ) ( not ( = ?auto_46671 ?auto_46674 ) ) ( not ( = ?auto_46671 ?auto_46675 ) ) ( not ( = ?auto_46671 ?auto_46676 ) ) ( not ( = ?auto_46672 ?auto_46673 ) ) ( not ( = ?auto_46672 ?auto_46674 ) ) ( not ( = ?auto_46672 ?auto_46675 ) ) ( not ( = ?auto_46672 ?auto_46676 ) ) ( not ( = ?auto_46673 ?auto_46674 ) ) ( not ( = ?auto_46673 ?auto_46675 ) ) ( not ( = ?auto_46673 ?auto_46676 ) ) ( not ( = ?auto_46674 ?auto_46675 ) ) ( not ( = ?auto_46674 ?auto_46676 ) ) ( not ( = ?auto_46675 ?auto_46676 ) ) ( not ( = ?auto_46671 ?auto_46677 ) ) ( not ( = ?auto_46672 ?auto_46677 ) ) ( not ( = ?auto_46673 ?auto_46677 ) ) ( not ( = ?auto_46674 ?auto_46677 ) ) ( not ( = ?auto_46675 ?auto_46677 ) ) ( not ( = ?auto_46676 ?auto_46677 ) ) ( ON ?auto_46677 ?auto_46676 ) ( CLEAR ?auto_46677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46671 ?auto_46672 ?auto_46673 ?auto_46674 ?auto_46675 ?auto_46676 )
      ( MAKE-5PILE ?auto_46671 ?auto_46672 ?auto_46673 ?auto_46674 ?auto_46675 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46680 - BLOCK
      ?auto_46681 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_46681 ) ( CLEAR ?auto_46680 ) ( ON-TABLE ?auto_46680 ) ( not ( = ?auto_46680 ?auto_46681 ) ) )
    :subtasks
    ( ( !STACK ?auto_46681 ?auto_46680 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46682 - BLOCK
      ?auto_46683 - BLOCK
    )
    :vars
    (
      ?auto_46684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46682 ) ( ON-TABLE ?auto_46682 ) ( not ( = ?auto_46682 ?auto_46683 ) ) ( ON ?auto_46683 ?auto_46684 ) ( CLEAR ?auto_46683 ) ( HAND-EMPTY ) ( not ( = ?auto_46682 ?auto_46684 ) ) ( not ( = ?auto_46683 ?auto_46684 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46683 ?auto_46684 )
      ( MAKE-2PILE ?auto_46682 ?auto_46683 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46685 - BLOCK
      ?auto_46686 - BLOCK
    )
    :vars
    (
      ?auto_46687 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46685 ?auto_46686 ) ) ( ON ?auto_46686 ?auto_46687 ) ( CLEAR ?auto_46686 ) ( not ( = ?auto_46685 ?auto_46687 ) ) ( not ( = ?auto_46686 ?auto_46687 ) ) ( HOLDING ?auto_46685 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46685 )
      ( MAKE-2PILE ?auto_46685 ?auto_46686 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46688 - BLOCK
      ?auto_46689 - BLOCK
    )
    :vars
    (
      ?auto_46690 - BLOCK
      ?auto_46691 - BLOCK
      ?auto_46693 - BLOCK
      ?auto_46692 - BLOCK
      ?auto_46694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46688 ?auto_46689 ) ) ( ON ?auto_46689 ?auto_46690 ) ( not ( = ?auto_46688 ?auto_46690 ) ) ( not ( = ?auto_46689 ?auto_46690 ) ) ( ON ?auto_46688 ?auto_46689 ) ( CLEAR ?auto_46688 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46691 ) ( ON ?auto_46693 ?auto_46691 ) ( ON ?auto_46692 ?auto_46693 ) ( ON ?auto_46694 ?auto_46692 ) ( ON ?auto_46690 ?auto_46694 ) ( not ( = ?auto_46691 ?auto_46693 ) ) ( not ( = ?auto_46691 ?auto_46692 ) ) ( not ( = ?auto_46691 ?auto_46694 ) ) ( not ( = ?auto_46691 ?auto_46690 ) ) ( not ( = ?auto_46691 ?auto_46689 ) ) ( not ( = ?auto_46691 ?auto_46688 ) ) ( not ( = ?auto_46693 ?auto_46692 ) ) ( not ( = ?auto_46693 ?auto_46694 ) ) ( not ( = ?auto_46693 ?auto_46690 ) ) ( not ( = ?auto_46693 ?auto_46689 ) ) ( not ( = ?auto_46693 ?auto_46688 ) ) ( not ( = ?auto_46692 ?auto_46694 ) ) ( not ( = ?auto_46692 ?auto_46690 ) ) ( not ( = ?auto_46692 ?auto_46689 ) ) ( not ( = ?auto_46692 ?auto_46688 ) ) ( not ( = ?auto_46694 ?auto_46690 ) ) ( not ( = ?auto_46694 ?auto_46689 ) ) ( not ( = ?auto_46694 ?auto_46688 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46691 ?auto_46693 ?auto_46692 ?auto_46694 ?auto_46690 ?auto_46689 )
      ( MAKE-2PILE ?auto_46688 ?auto_46689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46699 - BLOCK
      ?auto_46700 - BLOCK
      ?auto_46701 - BLOCK
      ?auto_46702 - BLOCK
    )
    :vars
    (
      ?auto_46703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46703 ?auto_46702 ) ( CLEAR ?auto_46703 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46699 ) ( ON ?auto_46700 ?auto_46699 ) ( ON ?auto_46701 ?auto_46700 ) ( ON ?auto_46702 ?auto_46701 ) ( not ( = ?auto_46699 ?auto_46700 ) ) ( not ( = ?auto_46699 ?auto_46701 ) ) ( not ( = ?auto_46699 ?auto_46702 ) ) ( not ( = ?auto_46699 ?auto_46703 ) ) ( not ( = ?auto_46700 ?auto_46701 ) ) ( not ( = ?auto_46700 ?auto_46702 ) ) ( not ( = ?auto_46700 ?auto_46703 ) ) ( not ( = ?auto_46701 ?auto_46702 ) ) ( not ( = ?auto_46701 ?auto_46703 ) ) ( not ( = ?auto_46702 ?auto_46703 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46703 ?auto_46702 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46704 - BLOCK
      ?auto_46705 - BLOCK
      ?auto_46706 - BLOCK
      ?auto_46707 - BLOCK
    )
    :vars
    (
      ?auto_46708 - BLOCK
      ?auto_46709 - BLOCK
      ?auto_46710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46708 ?auto_46707 ) ( CLEAR ?auto_46708 ) ( ON-TABLE ?auto_46704 ) ( ON ?auto_46705 ?auto_46704 ) ( ON ?auto_46706 ?auto_46705 ) ( ON ?auto_46707 ?auto_46706 ) ( not ( = ?auto_46704 ?auto_46705 ) ) ( not ( = ?auto_46704 ?auto_46706 ) ) ( not ( = ?auto_46704 ?auto_46707 ) ) ( not ( = ?auto_46704 ?auto_46708 ) ) ( not ( = ?auto_46705 ?auto_46706 ) ) ( not ( = ?auto_46705 ?auto_46707 ) ) ( not ( = ?auto_46705 ?auto_46708 ) ) ( not ( = ?auto_46706 ?auto_46707 ) ) ( not ( = ?auto_46706 ?auto_46708 ) ) ( not ( = ?auto_46707 ?auto_46708 ) ) ( HOLDING ?auto_46709 ) ( CLEAR ?auto_46710 ) ( not ( = ?auto_46704 ?auto_46709 ) ) ( not ( = ?auto_46704 ?auto_46710 ) ) ( not ( = ?auto_46705 ?auto_46709 ) ) ( not ( = ?auto_46705 ?auto_46710 ) ) ( not ( = ?auto_46706 ?auto_46709 ) ) ( not ( = ?auto_46706 ?auto_46710 ) ) ( not ( = ?auto_46707 ?auto_46709 ) ) ( not ( = ?auto_46707 ?auto_46710 ) ) ( not ( = ?auto_46708 ?auto_46709 ) ) ( not ( = ?auto_46708 ?auto_46710 ) ) ( not ( = ?auto_46709 ?auto_46710 ) ) )
    :subtasks
    ( ( !STACK ?auto_46709 ?auto_46710 )
      ( MAKE-4PILE ?auto_46704 ?auto_46705 ?auto_46706 ?auto_46707 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46711 - BLOCK
      ?auto_46712 - BLOCK
      ?auto_46713 - BLOCK
      ?auto_46714 - BLOCK
    )
    :vars
    (
      ?auto_46717 - BLOCK
      ?auto_46716 - BLOCK
      ?auto_46715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46717 ?auto_46714 ) ( ON-TABLE ?auto_46711 ) ( ON ?auto_46712 ?auto_46711 ) ( ON ?auto_46713 ?auto_46712 ) ( ON ?auto_46714 ?auto_46713 ) ( not ( = ?auto_46711 ?auto_46712 ) ) ( not ( = ?auto_46711 ?auto_46713 ) ) ( not ( = ?auto_46711 ?auto_46714 ) ) ( not ( = ?auto_46711 ?auto_46717 ) ) ( not ( = ?auto_46712 ?auto_46713 ) ) ( not ( = ?auto_46712 ?auto_46714 ) ) ( not ( = ?auto_46712 ?auto_46717 ) ) ( not ( = ?auto_46713 ?auto_46714 ) ) ( not ( = ?auto_46713 ?auto_46717 ) ) ( not ( = ?auto_46714 ?auto_46717 ) ) ( CLEAR ?auto_46716 ) ( not ( = ?auto_46711 ?auto_46715 ) ) ( not ( = ?auto_46711 ?auto_46716 ) ) ( not ( = ?auto_46712 ?auto_46715 ) ) ( not ( = ?auto_46712 ?auto_46716 ) ) ( not ( = ?auto_46713 ?auto_46715 ) ) ( not ( = ?auto_46713 ?auto_46716 ) ) ( not ( = ?auto_46714 ?auto_46715 ) ) ( not ( = ?auto_46714 ?auto_46716 ) ) ( not ( = ?auto_46717 ?auto_46715 ) ) ( not ( = ?auto_46717 ?auto_46716 ) ) ( not ( = ?auto_46715 ?auto_46716 ) ) ( ON ?auto_46715 ?auto_46717 ) ( CLEAR ?auto_46715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46711 ?auto_46712 ?auto_46713 ?auto_46714 ?auto_46717 )
      ( MAKE-4PILE ?auto_46711 ?auto_46712 ?auto_46713 ?auto_46714 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46718 - BLOCK
      ?auto_46719 - BLOCK
      ?auto_46720 - BLOCK
      ?auto_46721 - BLOCK
    )
    :vars
    (
      ?auto_46722 - BLOCK
      ?auto_46723 - BLOCK
      ?auto_46724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46722 ?auto_46721 ) ( ON-TABLE ?auto_46718 ) ( ON ?auto_46719 ?auto_46718 ) ( ON ?auto_46720 ?auto_46719 ) ( ON ?auto_46721 ?auto_46720 ) ( not ( = ?auto_46718 ?auto_46719 ) ) ( not ( = ?auto_46718 ?auto_46720 ) ) ( not ( = ?auto_46718 ?auto_46721 ) ) ( not ( = ?auto_46718 ?auto_46722 ) ) ( not ( = ?auto_46719 ?auto_46720 ) ) ( not ( = ?auto_46719 ?auto_46721 ) ) ( not ( = ?auto_46719 ?auto_46722 ) ) ( not ( = ?auto_46720 ?auto_46721 ) ) ( not ( = ?auto_46720 ?auto_46722 ) ) ( not ( = ?auto_46721 ?auto_46722 ) ) ( not ( = ?auto_46718 ?auto_46723 ) ) ( not ( = ?auto_46718 ?auto_46724 ) ) ( not ( = ?auto_46719 ?auto_46723 ) ) ( not ( = ?auto_46719 ?auto_46724 ) ) ( not ( = ?auto_46720 ?auto_46723 ) ) ( not ( = ?auto_46720 ?auto_46724 ) ) ( not ( = ?auto_46721 ?auto_46723 ) ) ( not ( = ?auto_46721 ?auto_46724 ) ) ( not ( = ?auto_46722 ?auto_46723 ) ) ( not ( = ?auto_46722 ?auto_46724 ) ) ( not ( = ?auto_46723 ?auto_46724 ) ) ( ON ?auto_46723 ?auto_46722 ) ( CLEAR ?auto_46723 ) ( HOLDING ?auto_46724 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46724 )
      ( MAKE-4PILE ?auto_46718 ?auto_46719 ?auto_46720 ?auto_46721 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46725 - BLOCK
      ?auto_46726 - BLOCK
      ?auto_46727 - BLOCK
      ?auto_46728 - BLOCK
    )
    :vars
    (
      ?auto_46730 - BLOCK
      ?auto_46731 - BLOCK
      ?auto_46729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46730 ?auto_46728 ) ( ON-TABLE ?auto_46725 ) ( ON ?auto_46726 ?auto_46725 ) ( ON ?auto_46727 ?auto_46726 ) ( ON ?auto_46728 ?auto_46727 ) ( not ( = ?auto_46725 ?auto_46726 ) ) ( not ( = ?auto_46725 ?auto_46727 ) ) ( not ( = ?auto_46725 ?auto_46728 ) ) ( not ( = ?auto_46725 ?auto_46730 ) ) ( not ( = ?auto_46726 ?auto_46727 ) ) ( not ( = ?auto_46726 ?auto_46728 ) ) ( not ( = ?auto_46726 ?auto_46730 ) ) ( not ( = ?auto_46727 ?auto_46728 ) ) ( not ( = ?auto_46727 ?auto_46730 ) ) ( not ( = ?auto_46728 ?auto_46730 ) ) ( not ( = ?auto_46725 ?auto_46731 ) ) ( not ( = ?auto_46725 ?auto_46729 ) ) ( not ( = ?auto_46726 ?auto_46731 ) ) ( not ( = ?auto_46726 ?auto_46729 ) ) ( not ( = ?auto_46727 ?auto_46731 ) ) ( not ( = ?auto_46727 ?auto_46729 ) ) ( not ( = ?auto_46728 ?auto_46731 ) ) ( not ( = ?auto_46728 ?auto_46729 ) ) ( not ( = ?auto_46730 ?auto_46731 ) ) ( not ( = ?auto_46730 ?auto_46729 ) ) ( not ( = ?auto_46731 ?auto_46729 ) ) ( ON ?auto_46731 ?auto_46730 ) ( ON ?auto_46729 ?auto_46731 ) ( CLEAR ?auto_46729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46725 ?auto_46726 ?auto_46727 ?auto_46728 ?auto_46730 ?auto_46731 )
      ( MAKE-4PILE ?auto_46725 ?auto_46726 ?auto_46727 ?auto_46728 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46735 - BLOCK
      ?auto_46736 - BLOCK
      ?auto_46737 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_46737 ) ( CLEAR ?auto_46736 ) ( ON-TABLE ?auto_46735 ) ( ON ?auto_46736 ?auto_46735 ) ( not ( = ?auto_46735 ?auto_46736 ) ) ( not ( = ?auto_46735 ?auto_46737 ) ) ( not ( = ?auto_46736 ?auto_46737 ) ) )
    :subtasks
    ( ( !STACK ?auto_46737 ?auto_46736 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46738 - BLOCK
      ?auto_46739 - BLOCK
      ?auto_46740 - BLOCK
    )
    :vars
    (
      ?auto_46741 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46739 ) ( ON-TABLE ?auto_46738 ) ( ON ?auto_46739 ?auto_46738 ) ( not ( = ?auto_46738 ?auto_46739 ) ) ( not ( = ?auto_46738 ?auto_46740 ) ) ( not ( = ?auto_46739 ?auto_46740 ) ) ( ON ?auto_46740 ?auto_46741 ) ( CLEAR ?auto_46740 ) ( HAND-EMPTY ) ( not ( = ?auto_46738 ?auto_46741 ) ) ( not ( = ?auto_46739 ?auto_46741 ) ) ( not ( = ?auto_46740 ?auto_46741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46740 ?auto_46741 )
      ( MAKE-3PILE ?auto_46738 ?auto_46739 ?auto_46740 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46742 - BLOCK
      ?auto_46743 - BLOCK
      ?auto_46744 - BLOCK
    )
    :vars
    (
      ?auto_46745 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46742 ) ( not ( = ?auto_46742 ?auto_46743 ) ) ( not ( = ?auto_46742 ?auto_46744 ) ) ( not ( = ?auto_46743 ?auto_46744 ) ) ( ON ?auto_46744 ?auto_46745 ) ( CLEAR ?auto_46744 ) ( not ( = ?auto_46742 ?auto_46745 ) ) ( not ( = ?auto_46743 ?auto_46745 ) ) ( not ( = ?auto_46744 ?auto_46745 ) ) ( HOLDING ?auto_46743 ) ( CLEAR ?auto_46742 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46742 ?auto_46743 )
      ( MAKE-3PILE ?auto_46742 ?auto_46743 ?auto_46744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46746 - BLOCK
      ?auto_46747 - BLOCK
      ?auto_46748 - BLOCK
    )
    :vars
    (
      ?auto_46749 - BLOCK
      ?auto_46752 - BLOCK
      ?auto_46750 - BLOCK
      ?auto_46751 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46746 ) ( not ( = ?auto_46746 ?auto_46747 ) ) ( not ( = ?auto_46746 ?auto_46748 ) ) ( not ( = ?auto_46747 ?auto_46748 ) ) ( ON ?auto_46748 ?auto_46749 ) ( not ( = ?auto_46746 ?auto_46749 ) ) ( not ( = ?auto_46747 ?auto_46749 ) ) ( not ( = ?auto_46748 ?auto_46749 ) ) ( CLEAR ?auto_46746 ) ( ON ?auto_46747 ?auto_46748 ) ( CLEAR ?auto_46747 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46752 ) ( ON ?auto_46750 ?auto_46752 ) ( ON ?auto_46751 ?auto_46750 ) ( ON ?auto_46749 ?auto_46751 ) ( not ( = ?auto_46752 ?auto_46750 ) ) ( not ( = ?auto_46752 ?auto_46751 ) ) ( not ( = ?auto_46752 ?auto_46749 ) ) ( not ( = ?auto_46752 ?auto_46748 ) ) ( not ( = ?auto_46752 ?auto_46747 ) ) ( not ( = ?auto_46750 ?auto_46751 ) ) ( not ( = ?auto_46750 ?auto_46749 ) ) ( not ( = ?auto_46750 ?auto_46748 ) ) ( not ( = ?auto_46750 ?auto_46747 ) ) ( not ( = ?auto_46751 ?auto_46749 ) ) ( not ( = ?auto_46751 ?auto_46748 ) ) ( not ( = ?auto_46751 ?auto_46747 ) ) ( not ( = ?auto_46746 ?auto_46752 ) ) ( not ( = ?auto_46746 ?auto_46750 ) ) ( not ( = ?auto_46746 ?auto_46751 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46752 ?auto_46750 ?auto_46751 ?auto_46749 ?auto_46748 )
      ( MAKE-3PILE ?auto_46746 ?auto_46747 ?auto_46748 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46753 - BLOCK
      ?auto_46754 - BLOCK
      ?auto_46755 - BLOCK
    )
    :vars
    (
      ?auto_46756 - BLOCK
      ?auto_46758 - BLOCK
      ?auto_46759 - BLOCK
      ?auto_46757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46753 ?auto_46754 ) ) ( not ( = ?auto_46753 ?auto_46755 ) ) ( not ( = ?auto_46754 ?auto_46755 ) ) ( ON ?auto_46755 ?auto_46756 ) ( not ( = ?auto_46753 ?auto_46756 ) ) ( not ( = ?auto_46754 ?auto_46756 ) ) ( not ( = ?auto_46755 ?auto_46756 ) ) ( ON ?auto_46754 ?auto_46755 ) ( CLEAR ?auto_46754 ) ( ON-TABLE ?auto_46758 ) ( ON ?auto_46759 ?auto_46758 ) ( ON ?auto_46757 ?auto_46759 ) ( ON ?auto_46756 ?auto_46757 ) ( not ( = ?auto_46758 ?auto_46759 ) ) ( not ( = ?auto_46758 ?auto_46757 ) ) ( not ( = ?auto_46758 ?auto_46756 ) ) ( not ( = ?auto_46758 ?auto_46755 ) ) ( not ( = ?auto_46758 ?auto_46754 ) ) ( not ( = ?auto_46759 ?auto_46757 ) ) ( not ( = ?auto_46759 ?auto_46756 ) ) ( not ( = ?auto_46759 ?auto_46755 ) ) ( not ( = ?auto_46759 ?auto_46754 ) ) ( not ( = ?auto_46757 ?auto_46756 ) ) ( not ( = ?auto_46757 ?auto_46755 ) ) ( not ( = ?auto_46757 ?auto_46754 ) ) ( not ( = ?auto_46753 ?auto_46758 ) ) ( not ( = ?auto_46753 ?auto_46759 ) ) ( not ( = ?auto_46753 ?auto_46757 ) ) ( HOLDING ?auto_46753 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46753 )
      ( MAKE-3PILE ?auto_46753 ?auto_46754 ?auto_46755 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46760 - BLOCK
      ?auto_46761 - BLOCK
      ?auto_46762 - BLOCK
    )
    :vars
    (
      ?auto_46766 - BLOCK
      ?auto_46765 - BLOCK
      ?auto_46764 - BLOCK
      ?auto_46763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46760 ?auto_46761 ) ) ( not ( = ?auto_46760 ?auto_46762 ) ) ( not ( = ?auto_46761 ?auto_46762 ) ) ( ON ?auto_46762 ?auto_46766 ) ( not ( = ?auto_46760 ?auto_46766 ) ) ( not ( = ?auto_46761 ?auto_46766 ) ) ( not ( = ?auto_46762 ?auto_46766 ) ) ( ON ?auto_46761 ?auto_46762 ) ( ON-TABLE ?auto_46765 ) ( ON ?auto_46764 ?auto_46765 ) ( ON ?auto_46763 ?auto_46764 ) ( ON ?auto_46766 ?auto_46763 ) ( not ( = ?auto_46765 ?auto_46764 ) ) ( not ( = ?auto_46765 ?auto_46763 ) ) ( not ( = ?auto_46765 ?auto_46766 ) ) ( not ( = ?auto_46765 ?auto_46762 ) ) ( not ( = ?auto_46765 ?auto_46761 ) ) ( not ( = ?auto_46764 ?auto_46763 ) ) ( not ( = ?auto_46764 ?auto_46766 ) ) ( not ( = ?auto_46764 ?auto_46762 ) ) ( not ( = ?auto_46764 ?auto_46761 ) ) ( not ( = ?auto_46763 ?auto_46766 ) ) ( not ( = ?auto_46763 ?auto_46762 ) ) ( not ( = ?auto_46763 ?auto_46761 ) ) ( not ( = ?auto_46760 ?auto_46765 ) ) ( not ( = ?auto_46760 ?auto_46764 ) ) ( not ( = ?auto_46760 ?auto_46763 ) ) ( ON ?auto_46760 ?auto_46761 ) ( CLEAR ?auto_46760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46765 ?auto_46764 ?auto_46763 ?auto_46766 ?auto_46762 ?auto_46761 )
      ( MAKE-3PILE ?auto_46760 ?auto_46761 ?auto_46762 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46770 - BLOCK
      ?auto_46771 - BLOCK
      ?auto_46772 - BLOCK
    )
    :vars
    (
      ?auto_46773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46773 ?auto_46772 ) ( CLEAR ?auto_46773 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46770 ) ( ON ?auto_46771 ?auto_46770 ) ( ON ?auto_46772 ?auto_46771 ) ( not ( = ?auto_46770 ?auto_46771 ) ) ( not ( = ?auto_46770 ?auto_46772 ) ) ( not ( = ?auto_46770 ?auto_46773 ) ) ( not ( = ?auto_46771 ?auto_46772 ) ) ( not ( = ?auto_46771 ?auto_46773 ) ) ( not ( = ?auto_46772 ?auto_46773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46773 ?auto_46772 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46774 - BLOCK
      ?auto_46775 - BLOCK
      ?auto_46776 - BLOCK
    )
    :vars
    (
      ?auto_46777 - BLOCK
      ?auto_46778 - BLOCK
      ?auto_46779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46777 ?auto_46776 ) ( CLEAR ?auto_46777 ) ( ON-TABLE ?auto_46774 ) ( ON ?auto_46775 ?auto_46774 ) ( ON ?auto_46776 ?auto_46775 ) ( not ( = ?auto_46774 ?auto_46775 ) ) ( not ( = ?auto_46774 ?auto_46776 ) ) ( not ( = ?auto_46774 ?auto_46777 ) ) ( not ( = ?auto_46775 ?auto_46776 ) ) ( not ( = ?auto_46775 ?auto_46777 ) ) ( not ( = ?auto_46776 ?auto_46777 ) ) ( HOLDING ?auto_46778 ) ( CLEAR ?auto_46779 ) ( not ( = ?auto_46774 ?auto_46778 ) ) ( not ( = ?auto_46774 ?auto_46779 ) ) ( not ( = ?auto_46775 ?auto_46778 ) ) ( not ( = ?auto_46775 ?auto_46779 ) ) ( not ( = ?auto_46776 ?auto_46778 ) ) ( not ( = ?auto_46776 ?auto_46779 ) ) ( not ( = ?auto_46777 ?auto_46778 ) ) ( not ( = ?auto_46777 ?auto_46779 ) ) ( not ( = ?auto_46778 ?auto_46779 ) ) )
    :subtasks
    ( ( !STACK ?auto_46778 ?auto_46779 )
      ( MAKE-3PILE ?auto_46774 ?auto_46775 ?auto_46776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46780 - BLOCK
      ?auto_46781 - BLOCK
      ?auto_46782 - BLOCK
    )
    :vars
    (
      ?auto_46783 - BLOCK
      ?auto_46785 - BLOCK
      ?auto_46784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46783 ?auto_46782 ) ( ON-TABLE ?auto_46780 ) ( ON ?auto_46781 ?auto_46780 ) ( ON ?auto_46782 ?auto_46781 ) ( not ( = ?auto_46780 ?auto_46781 ) ) ( not ( = ?auto_46780 ?auto_46782 ) ) ( not ( = ?auto_46780 ?auto_46783 ) ) ( not ( = ?auto_46781 ?auto_46782 ) ) ( not ( = ?auto_46781 ?auto_46783 ) ) ( not ( = ?auto_46782 ?auto_46783 ) ) ( CLEAR ?auto_46785 ) ( not ( = ?auto_46780 ?auto_46784 ) ) ( not ( = ?auto_46780 ?auto_46785 ) ) ( not ( = ?auto_46781 ?auto_46784 ) ) ( not ( = ?auto_46781 ?auto_46785 ) ) ( not ( = ?auto_46782 ?auto_46784 ) ) ( not ( = ?auto_46782 ?auto_46785 ) ) ( not ( = ?auto_46783 ?auto_46784 ) ) ( not ( = ?auto_46783 ?auto_46785 ) ) ( not ( = ?auto_46784 ?auto_46785 ) ) ( ON ?auto_46784 ?auto_46783 ) ( CLEAR ?auto_46784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46780 ?auto_46781 ?auto_46782 ?auto_46783 )
      ( MAKE-3PILE ?auto_46780 ?auto_46781 ?auto_46782 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46786 - BLOCK
      ?auto_46787 - BLOCK
      ?auto_46788 - BLOCK
    )
    :vars
    (
      ?auto_46790 - BLOCK
      ?auto_46791 - BLOCK
      ?auto_46789 - BLOCK
      ?auto_46792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46790 ?auto_46788 ) ( ON-TABLE ?auto_46786 ) ( ON ?auto_46787 ?auto_46786 ) ( ON ?auto_46788 ?auto_46787 ) ( not ( = ?auto_46786 ?auto_46787 ) ) ( not ( = ?auto_46786 ?auto_46788 ) ) ( not ( = ?auto_46786 ?auto_46790 ) ) ( not ( = ?auto_46787 ?auto_46788 ) ) ( not ( = ?auto_46787 ?auto_46790 ) ) ( not ( = ?auto_46788 ?auto_46790 ) ) ( not ( = ?auto_46786 ?auto_46791 ) ) ( not ( = ?auto_46786 ?auto_46789 ) ) ( not ( = ?auto_46787 ?auto_46791 ) ) ( not ( = ?auto_46787 ?auto_46789 ) ) ( not ( = ?auto_46788 ?auto_46791 ) ) ( not ( = ?auto_46788 ?auto_46789 ) ) ( not ( = ?auto_46790 ?auto_46791 ) ) ( not ( = ?auto_46790 ?auto_46789 ) ) ( not ( = ?auto_46791 ?auto_46789 ) ) ( ON ?auto_46791 ?auto_46790 ) ( CLEAR ?auto_46791 ) ( HOLDING ?auto_46789 ) ( CLEAR ?auto_46792 ) ( ON-TABLE ?auto_46792 ) ( not ( = ?auto_46792 ?auto_46789 ) ) ( not ( = ?auto_46786 ?auto_46792 ) ) ( not ( = ?auto_46787 ?auto_46792 ) ) ( not ( = ?auto_46788 ?auto_46792 ) ) ( not ( = ?auto_46790 ?auto_46792 ) ) ( not ( = ?auto_46791 ?auto_46792 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46792 ?auto_46789 )
      ( MAKE-3PILE ?auto_46786 ?auto_46787 ?auto_46788 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46793 - BLOCK
      ?auto_46794 - BLOCK
      ?auto_46795 - BLOCK
    )
    :vars
    (
      ?auto_46798 - BLOCK
      ?auto_46797 - BLOCK
      ?auto_46796 - BLOCK
      ?auto_46799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46798 ?auto_46795 ) ( ON-TABLE ?auto_46793 ) ( ON ?auto_46794 ?auto_46793 ) ( ON ?auto_46795 ?auto_46794 ) ( not ( = ?auto_46793 ?auto_46794 ) ) ( not ( = ?auto_46793 ?auto_46795 ) ) ( not ( = ?auto_46793 ?auto_46798 ) ) ( not ( = ?auto_46794 ?auto_46795 ) ) ( not ( = ?auto_46794 ?auto_46798 ) ) ( not ( = ?auto_46795 ?auto_46798 ) ) ( not ( = ?auto_46793 ?auto_46797 ) ) ( not ( = ?auto_46793 ?auto_46796 ) ) ( not ( = ?auto_46794 ?auto_46797 ) ) ( not ( = ?auto_46794 ?auto_46796 ) ) ( not ( = ?auto_46795 ?auto_46797 ) ) ( not ( = ?auto_46795 ?auto_46796 ) ) ( not ( = ?auto_46798 ?auto_46797 ) ) ( not ( = ?auto_46798 ?auto_46796 ) ) ( not ( = ?auto_46797 ?auto_46796 ) ) ( ON ?auto_46797 ?auto_46798 ) ( CLEAR ?auto_46799 ) ( ON-TABLE ?auto_46799 ) ( not ( = ?auto_46799 ?auto_46796 ) ) ( not ( = ?auto_46793 ?auto_46799 ) ) ( not ( = ?auto_46794 ?auto_46799 ) ) ( not ( = ?auto_46795 ?auto_46799 ) ) ( not ( = ?auto_46798 ?auto_46799 ) ) ( not ( = ?auto_46797 ?auto_46799 ) ) ( ON ?auto_46796 ?auto_46797 ) ( CLEAR ?auto_46796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46793 ?auto_46794 ?auto_46795 ?auto_46798 ?auto_46797 )
      ( MAKE-3PILE ?auto_46793 ?auto_46794 ?auto_46795 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46800 - BLOCK
      ?auto_46801 - BLOCK
      ?auto_46802 - BLOCK
    )
    :vars
    (
      ?auto_46806 - BLOCK
      ?auto_46803 - BLOCK
      ?auto_46804 - BLOCK
      ?auto_46805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46806 ?auto_46802 ) ( ON-TABLE ?auto_46800 ) ( ON ?auto_46801 ?auto_46800 ) ( ON ?auto_46802 ?auto_46801 ) ( not ( = ?auto_46800 ?auto_46801 ) ) ( not ( = ?auto_46800 ?auto_46802 ) ) ( not ( = ?auto_46800 ?auto_46806 ) ) ( not ( = ?auto_46801 ?auto_46802 ) ) ( not ( = ?auto_46801 ?auto_46806 ) ) ( not ( = ?auto_46802 ?auto_46806 ) ) ( not ( = ?auto_46800 ?auto_46803 ) ) ( not ( = ?auto_46800 ?auto_46804 ) ) ( not ( = ?auto_46801 ?auto_46803 ) ) ( not ( = ?auto_46801 ?auto_46804 ) ) ( not ( = ?auto_46802 ?auto_46803 ) ) ( not ( = ?auto_46802 ?auto_46804 ) ) ( not ( = ?auto_46806 ?auto_46803 ) ) ( not ( = ?auto_46806 ?auto_46804 ) ) ( not ( = ?auto_46803 ?auto_46804 ) ) ( ON ?auto_46803 ?auto_46806 ) ( not ( = ?auto_46805 ?auto_46804 ) ) ( not ( = ?auto_46800 ?auto_46805 ) ) ( not ( = ?auto_46801 ?auto_46805 ) ) ( not ( = ?auto_46802 ?auto_46805 ) ) ( not ( = ?auto_46806 ?auto_46805 ) ) ( not ( = ?auto_46803 ?auto_46805 ) ) ( ON ?auto_46804 ?auto_46803 ) ( CLEAR ?auto_46804 ) ( HOLDING ?auto_46805 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46805 )
      ( MAKE-3PILE ?auto_46800 ?auto_46801 ?auto_46802 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_46807 - BLOCK
      ?auto_46808 - BLOCK
      ?auto_46809 - BLOCK
    )
    :vars
    (
      ?auto_46813 - BLOCK
      ?auto_46810 - BLOCK
      ?auto_46812 - BLOCK
      ?auto_46811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46813 ?auto_46809 ) ( ON-TABLE ?auto_46807 ) ( ON ?auto_46808 ?auto_46807 ) ( ON ?auto_46809 ?auto_46808 ) ( not ( = ?auto_46807 ?auto_46808 ) ) ( not ( = ?auto_46807 ?auto_46809 ) ) ( not ( = ?auto_46807 ?auto_46813 ) ) ( not ( = ?auto_46808 ?auto_46809 ) ) ( not ( = ?auto_46808 ?auto_46813 ) ) ( not ( = ?auto_46809 ?auto_46813 ) ) ( not ( = ?auto_46807 ?auto_46810 ) ) ( not ( = ?auto_46807 ?auto_46812 ) ) ( not ( = ?auto_46808 ?auto_46810 ) ) ( not ( = ?auto_46808 ?auto_46812 ) ) ( not ( = ?auto_46809 ?auto_46810 ) ) ( not ( = ?auto_46809 ?auto_46812 ) ) ( not ( = ?auto_46813 ?auto_46810 ) ) ( not ( = ?auto_46813 ?auto_46812 ) ) ( not ( = ?auto_46810 ?auto_46812 ) ) ( ON ?auto_46810 ?auto_46813 ) ( not ( = ?auto_46811 ?auto_46812 ) ) ( not ( = ?auto_46807 ?auto_46811 ) ) ( not ( = ?auto_46808 ?auto_46811 ) ) ( not ( = ?auto_46809 ?auto_46811 ) ) ( not ( = ?auto_46813 ?auto_46811 ) ) ( not ( = ?auto_46810 ?auto_46811 ) ) ( ON ?auto_46812 ?auto_46810 ) ( ON ?auto_46811 ?auto_46812 ) ( CLEAR ?auto_46811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46807 ?auto_46808 ?auto_46809 ?auto_46813 ?auto_46810 ?auto_46812 )
      ( MAKE-3PILE ?auto_46807 ?auto_46808 ?auto_46809 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46818 - BLOCK
      ?auto_46819 - BLOCK
      ?auto_46820 - BLOCK
      ?auto_46821 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_46821 ) ( CLEAR ?auto_46820 ) ( ON-TABLE ?auto_46818 ) ( ON ?auto_46819 ?auto_46818 ) ( ON ?auto_46820 ?auto_46819 ) ( not ( = ?auto_46818 ?auto_46819 ) ) ( not ( = ?auto_46818 ?auto_46820 ) ) ( not ( = ?auto_46818 ?auto_46821 ) ) ( not ( = ?auto_46819 ?auto_46820 ) ) ( not ( = ?auto_46819 ?auto_46821 ) ) ( not ( = ?auto_46820 ?auto_46821 ) ) )
    :subtasks
    ( ( !STACK ?auto_46821 ?auto_46820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46822 - BLOCK
      ?auto_46823 - BLOCK
      ?auto_46824 - BLOCK
      ?auto_46825 - BLOCK
    )
    :vars
    (
      ?auto_46826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46824 ) ( ON-TABLE ?auto_46822 ) ( ON ?auto_46823 ?auto_46822 ) ( ON ?auto_46824 ?auto_46823 ) ( not ( = ?auto_46822 ?auto_46823 ) ) ( not ( = ?auto_46822 ?auto_46824 ) ) ( not ( = ?auto_46822 ?auto_46825 ) ) ( not ( = ?auto_46823 ?auto_46824 ) ) ( not ( = ?auto_46823 ?auto_46825 ) ) ( not ( = ?auto_46824 ?auto_46825 ) ) ( ON ?auto_46825 ?auto_46826 ) ( CLEAR ?auto_46825 ) ( HAND-EMPTY ) ( not ( = ?auto_46822 ?auto_46826 ) ) ( not ( = ?auto_46823 ?auto_46826 ) ) ( not ( = ?auto_46824 ?auto_46826 ) ) ( not ( = ?auto_46825 ?auto_46826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46825 ?auto_46826 )
      ( MAKE-4PILE ?auto_46822 ?auto_46823 ?auto_46824 ?auto_46825 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46827 - BLOCK
      ?auto_46828 - BLOCK
      ?auto_46829 - BLOCK
      ?auto_46830 - BLOCK
    )
    :vars
    (
      ?auto_46831 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46827 ) ( ON ?auto_46828 ?auto_46827 ) ( not ( = ?auto_46827 ?auto_46828 ) ) ( not ( = ?auto_46827 ?auto_46829 ) ) ( not ( = ?auto_46827 ?auto_46830 ) ) ( not ( = ?auto_46828 ?auto_46829 ) ) ( not ( = ?auto_46828 ?auto_46830 ) ) ( not ( = ?auto_46829 ?auto_46830 ) ) ( ON ?auto_46830 ?auto_46831 ) ( CLEAR ?auto_46830 ) ( not ( = ?auto_46827 ?auto_46831 ) ) ( not ( = ?auto_46828 ?auto_46831 ) ) ( not ( = ?auto_46829 ?auto_46831 ) ) ( not ( = ?auto_46830 ?auto_46831 ) ) ( HOLDING ?auto_46829 ) ( CLEAR ?auto_46828 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46827 ?auto_46828 ?auto_46829 )
      ( MAKE-4PILE ?auto_46827 ?auto_46828 ?auto_46829 ?auto_46830 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46832 - BLOCK
      ?auto_46833 - BLOCK
      ?auto_46834 - BLOCK
      ?auto_46835 - BLOCK
    )
    :vars
    (
      ?auto_46836 - BLOCK
      ?auto_46838 - BLOCK
      ?auto_46837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46832 ) ( ON ?auto_46833 ?auto_46832 ) ( not ( = ?auto_46832 ?auto_46833 ) ) ( not ( = ?auto_46832 ?auto_46834 ) ) ( not ( = ?auto_46832 ?auto_46835 ) ) ( not ( = ?auto_46833 ?auto_46834 ) ) ( not ( = ?auto_46833 ?auto_46835 ) ) ( not ( = ?auto_46834 ?auto_46835 ) ) ( ON ?auto_46835 ?auto_46836 ) ( not ( = ?auto_46832 ?auto_46836 ) ) ( not ( = ?auto_46833 ?auto_46836 ) ) ( not ( = ?auto_46834 ?auto_46836 ) ) ( not ( = ?auto_46835 ?auto_46836 ) ) ( CLEAR ?auto_46833 ) ( ON ?auto_46834 ?auto_46835 ) ( CLEAR ?auto_46834 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46838 ) ( ON ?auto_46837 ?auto_46838 ) ( ON ?auto_46836 ?auto_46837 ) ( not ( = ?auto_46838 ?auto_46837 ) ) ( not ( = ?auto_46838 ?auto_46836 ) ) ( not ( = ?auto_46838 ?auto_46835 ) ) ( not ( = ?auto_46838 ?auto_46834 ) ) ( not ( = ?auto_46837 ?auto_46836 ) ) ( not ( = ?auto_46837 ?auto_46835 ) ) ( not ( = ?auto_46837 ?auto_46834 ) ) ( not ( = ?auto_46832 ?auto_46838 ) ) ( not ( = ?auto_46832 ?auto_46837 ) ) ( not ( = ?auto_46833 ?auto_46838 ) ) ( not ( = ?auto_46833 ?auto_46837 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46838 ?auto_46837 ?auto_46836 ?auto_46835 )
      ( MAKE-4PILE ?auto_46832 ?auto_46833 ?auto_46834 ?auto_46835 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46839 - BLOCK
      ?auto_46840 - BLOCK
      ?auto_46841 - BLOCK
      ?auto_46842 - BLOCK
    )
    :vars
    (
      ?auto_46843 - BLOCK
      ?auto_46844 - BLOCK
      ?auto_46845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46839 ) ( not ( = ?auto_46839 ?auto_46840 ) ) ( not ( = ?auto_46839 ?auto_46841 ) ) ( not ( = ?auto_46839 ?auto_46842 ) ) ( not ( = ?auto_46840 ?auto_46841 ) ) ( not ( = ?auto_46840 ?auto_46842 ) ) ( not ( = ?auto_46841 ?auto_46842 ) ) ( ON ?auto_46842 ?auto_46843 ) ( not ( = ?auto_46839 ?auto_46843 ) ) ( not ( = ?auto_46840 ?auto_46843 ) ) ( not ( = ?auto_46841 ?auto_46843 ) ) ( not ( = ?auto_46842 ?auto_46843 ) ) ( ON ?auto_46841 ?auto_46842 ) ( CLEAR ?auto_46841 ) ( ON-TABLE ?auto_46844 ) ( ON ?auto_46845 ?auto_46844 ) ( ON ?auto_46843 ?auto_46845 ) ( not ( = ?auto_46844 ?auto_46845 ) ) ( not ( = ?auto_46844 ?auto_46843 ) ) ( not ( = ?auto_46844 ?auto_46842 ) ) ( not ( = ?auto_46844 ?auto_46841 ) ) ( not ( = ?auto_46845 ?auto_46843 ) ) ( not ( = ?auto_46845 ?auto_46842 ) ) ( not ( = ?auto_46845 ?auto_46841 ) ) ( not ( = ?auto_46839 ?auto_46844 ) ) ( not ( = ?auto_46839 ?auto_46845 ) ) ( not ( = ?auto_46840 ?auto_46844 ) ) ( not ( = ?auto_46840 ?auto_46845 ) ) ( HOLDING ?auto_46840 ) ( CLEAR ?auto_46839 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46839 ?auto_46840 )
      ( MAKE-4PILE ?auto_46839 ?auto_46840 ?auto_46841 ?auto_46842 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46846 - BLOCK
      ?auto_46847 - BLOCK
      ?auto_46848 - BLOCK
      ?auto_46849 - BLOCK
    )
    :vars
    (
      ?auto_46850 - BLOCK
      ?auto_46851 - BLOCK
      ?auto_46852 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46846 ) ( not ( = ?auto_46846 ?auto_46847 ) ) ( not ( = ?auto_46846 ?auto_46848 ) ) ( not ( = ?auto_46846 ?auto_46849 ) ) ( not ( = ?auto_46847 ?auto_46848 ) ) ( not ( = ?auto_46847 ?auto_46849 ) ) ( not ( = ?auto_46848 ?auto_46849 ) ) ( ON ?auto_46849 ?auto_46850 ) ( not ( = ?auto_46846 ?auto_46850 ) ) ( not ( = ?auto_46847 ?auto_46850 ) ) ( not ( = ?auto_46848 ?auto_46850 ) ) ( not ( = ?auto_46849 ?auto_46850 ) ) ( ON ?auto_46848 ?auto_46849 ) ( ON-TABLE ?auto_46851 ) ( ON ?auto_46852 ?auto_46851 ) ( ON ?auto_46850 ?auto_46852 ) ( not ( = ?auto_46851 ?auto_46852 ) ) ( not ( = ?auto_46851 ?auto_46850 ) ) ( not ( = ?auto_46851 ?auto_46849 ) ) ( not ( = ?auto_46851 ?auto_46848 ) ) ( not ( = ?auto_46852 ?auto_46850 ) ) ( not ( = ?auto_46852 ?auto_46849 ) ) ( not ( = ?auto_46852 ?auto_46848 ) ) ( not ( = ?auto_46846 ?auto_46851 ) ) ( not ( = ?auto_46846 ?auto_46852 ) ) ( not ( = ?auto_46847 ?auto_46851 ) ) ( not ( = ?auto_46847 ?auto_46852 ) ) ( CLEAR ?auto_46846 ) ( ON ?auto_46847 ?auto_46848 ) ( CLEAR ?auto_46847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46851 ?auto_46852 ?auto_46850 ?auto_46849 ?auto_46848 )
      ( MAKE-4PILE ?auto_46846 ?auto_46847 ?auto_46848 ?auto_46849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46853 - BLOCK
      ?auto_46854 - BLOCK
      ?auto_46855 - BLOCK
      ?auto_46856 - BLOCK
    )
    :vars
    (
      ?auto_46857 - BLOCK
      ?auto_46858 - BLOCK
      ?auto_46859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46853 ?auto_46854 ) ) ( not ( = ?auto_46853 ?auto_46855 ) ) ( not ( = ?auto_46853 ?auto_46856 ) ) ( not ( = ?auto_46854 ?auto_46855 ) ) ( not ( = ?auto_46854 ?auto_46856 ) ) ( not ( = ?auto_46855 ?auto_46856 ) ) ( ON ?auto_46856 ?auto_46857 ) ( not ( = ?auto_46853 ?auto_46857 ) ) ( not ( = ?auto_46854 ?auto_46857 ) ) ( not ( = ?auto_46855 ?auto_46857 ) ) ( not ( = ?auto_46856 ?auto_46857 ) ) ( ON ?auto_46855 ?auto_46856 ) ( ON-TABLE ?auto_46858 ) ( ON ?auto_46859 ?auto_46858 ) ( ON ?auto_46857 ?auto_46859 ) ( not ( = ?auto_46858 ?auto_46859 ) ) ( not ( = ?auto_46858 ?auto_46857 ) ) ( not ( = ?auto_46858 ?auto_46856 ) ) ( not ( = ?auto_46858 ?auto_46855 ) ) ( not ( = ?auto_46859 ?auto_46857 ) ) ( not ( = ?auto_46859 ?auto_46856 ) ) ( not ( = ?auto_46859 ?auto_46855 ) ) ( not ( = ?auto_46853 ?auto_46858 ) ) ( not ( = ?auto_46853 ?auto_46859 ) ) ( not ( = ?auto_46854 ?auto_46858 ) ) ( not ( = ?auto_46854 ?auto_46859 ) ) ( ON ?auto_46854 ?auto_46855 ) ( CLEAR ?auto_46854 ) ( HOLDING ?auto_46853 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46853 )
      ( MAKE-4PILE ?auto_46853 ?auto_46854 ?auto_46855 ?auto_46856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_46860 - BLOCK
      ?auto_46861 - BLOCK
      ?auto_46862 - BLOCK
      ?auto_46863 - BLOCK
    )
    :vars
    (
      ?auto_46864 - BLOCK
      ?auto_46865 - BLOCK
      ?auto_46866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46860 ?auto_46861 ) ) ( not ( = ?auto_46860 ?auto_46862 ) ) ( not ( = ?auto_46860 ?auto_46863 ) ) ( not ( = ?auto_46861 ?auto_46862 ) ) ( not ( = ?auto_46861 ?auto_46863 ) ) ( not ( = ?auto_46862 ?auto_46863 ) ) ( ON ?auto_46863 ?auto_46864 ) ( not ( = ?auto_46860 ?auto_46864 ) ) ( not ( = ?auto_46861 ?auto_46864 ) ) ( not ( = ?auto_46862 ?auto_46864 ) ) ( not ( = ?auto_46863 ?auto_46864 ) ) ( ON ?auto_46862 ?auto_46863 ) ( ON-TABLE ?auto_46865 ) ( ON ?auto_46866 ?auto_46865 ) ( ON ?auto_46864 ?auto_46866 ) ( not ( = ?auto_46865 ?auto_46866 ) ) ( not ( = ?auto_46865 ?auto_46864 ) ) ( not ( = ?auto_46865 ?auto_46863 ) ) ( not ( = ?auto_46865 ?auto_46862 ) ) ( not ( = ?auto_46866 ?auto_46864 ) ) ( not ( = ?auto_46866 ?auto_46863 ) ) ( not ( = ?auto_46866 ?auto_46862 ) ) ( not ( = ?auto_46860 ?auto_46865 ) ) ( not ( = ?auto_46860 ?auto_46866 ) ) ( not ( = ?auto_46861 ?auto_46865 ) ) ( not ( = ?auto_46861 ?auto_46866 ) ) ( ON ?auto_46861 ?auto_46862 ) ( ON ?auto_46860 ?auto_46861 ) ( CLEAR ?auto_46860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46865 ?auto_46866 ?auto_46864 ?auto_46863 ?auto_46862 ?auto_46861 )
      ( MAKE-4PILE ?auto_46860 ?auto_46861 ?auto_46862 ?auto_46863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46869 - BLOCK
      ?auto_46870 - BLOCK
    )
    :vars
    (
      ?auto_46871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46871 ?auto_46870 ) ( CLEAR ?auto_46871 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46869 ) ( ON ?auto_46870 ?auto_46869 ) ( not ( = ?auto_46869 ?auto_46870 ) ) ( not ( = ?auto_46869 ?auto_46871 ) ) ( not ( = ?auto_46870 ?auto_46871 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46871 ?auto_46870 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46872 - BLOCK
      ?auto_46873 - BLOCK
    )
    :vars
    (
      ?auto_46874 - BLOCK
      ?auto_46875 - BLOCK
      ?auto_46876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46874 ?auto_46873 ) ( CLEAR ?auto_46874 ) ( ON-TABLE ?auto_46872 ) ( ON ?auto_46873 ?auto_46872 ) ( not ( = ?auto_46872 ?auto_46873 ) ) ( not ( = ?auto_46872 ?auto_46874 ) ) ( not ( = ?auto_46873 ?auto_46874 ) ) ( HOLDING ?auto_46875 ) ( CLEAR ?auto_46876 ) ( not ( = ?auto_46872 ?auto_46875 ) ) ( not ( = ?auto_46872 ?auto_46876 ) ) ( not ( = ?auto_46873 ?auto_46875 ) ) ( not ( = ?auto_46873 ?auto_46876 ) ) ( not ( = ?auto_46874 ?auto_46875 ) ) ( not ( = ?auto_46874 ?auto_46876 ) ) ( not ( = ?auto_46875 ?auto_46876 ) ) )
    :subtasks
    ( ( !STACK ?auto_46875 ?auto_46876 )
      ( MAKE-2PILE ?auto_46872 ?auto_46873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46877 - BLOCK
      ?auto_46878 - BLOCK
    )
    :vars
    (
      ?auto_46879 - BLOCK
      ?auto_46880 - BLOCK
      ?auto_46881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46879 ?auto_46878 ) ( ON-TABLE ?auto_46877 ) ( ON ?auto_46878 ?auto_46877 ) ( not ( = ?auto_46877 ?auto_46878 ) ) ( not ( = ?auto_46877 ?auto_46879 ) ) ( not ( = ?auto_46878 ?auto_46879 ) ) ( CLEAR ?auto_46880 ) ( not ( = ?auto_46877 ?auto_46881 ) ) ( not ( = ?auto_46877 ?auto_46880 ) ) ( not ( = ?auto_46878 ?auto_46881 ) ) ( not ( = ?auto_46878 ?auto_46880 ) ) ( not ( = ?auto_46879 ?auto_46881 ) ) ( not ( = ?auto_46879 ?auto_46880 ) ) ( not ( = ?auto_46881 ?auto_46880 ) ) ( ON ?auto_46881 ?auto_46879 ) ( CLEAR ?auto_46881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46877 ?auto_46878 ?auto_46879 )
      ( MAKE-2PILE ?auto_46877 ?auto_46878 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46882 - BLOCK
      ?auto_46883 - BLOCK
    )
    :vars
    (
      ?auto_46885 - BLOCK
      ?auto_46884 - BLOCK
      ?auto_46886 - BLOCK
      ?auto_46888 - BLOCK
      ?auto_46887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46885 ?auto_46883 ) ( ON-TABLE ?auto_46882 ) ( ON ?auto_46883 ?auto_46882 ) ( not ( = ?auto_46882 ?auto_46883 ) ) ( not ( = ?auto_46882 ?auto_46885 ) ) ( not ( = ?auto_46883 ?auto_46885 ) ) ( not ( = ?auto_46882 ?auto_46884 ) ) ( not ( = ?auto_46882 ?auto_46886 ) ) ( not ( = ?auto_46883 ?auto_46884 ) ) ( not ( = ?auto_46883 ?auto_46886 ) ) ( not ( = ?auto_46885 ?auto_46884 ) ) ( not ( = ?auto_46885 ?auto_46886 ) ) ( not ( = ?auto_46884 ?auto_46886 ) ) ( ON ?auto_46884 ?auto_46885 ) ( CLEAR ?auto_46884 ) ( HOLDING ?auto_46886 ) ( CLEAR ?auto_46888 ) ( ON-TABLE ?auto_46887 ) ( ON ?auto_46888 ?auto_46887 ) ( not ( = ?auto_46887 ?auto_46888 ) ) ( not ( = ?auto_46887 ?auto_46886 ) ) ( not ( = ?auto_46888 ?auto_46886 ) ) ( not ( = ?auto_46882 ?auto_46888 ) ) ( not ( = ?auto_46882 ?auto_46887 ) ) ( not ( = ?auto_46883 ?auto_46888 ) ) ( not ( = ?auto_46883 ?auto_46887 ) ) ( not ( = ?auto_46885 ?auto_46888 ) ) ( not ( = ?auto_46885 ?auto_46887 ) ) ( not ( = ?auto_46884 ?auto_46888 ) ) ( not ( = ?auto_46884 ?auto_46887 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46887 ?auto_46888 ?auto_46886 )
      ( MAKE-2PILE ?auto_46882 ?auto_46883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46889 - BLOCK
      ?auto_46890 - BLOCK
    )
    :vars
    (
      ?auto_46893 - BLOCK
      ?auto_46891 - BLOCK
      ?auto_46895 - BLOCK
      ?auto_46892 - BLOCK
      ?auto_46894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46893 ?auto_46890 ) ( ON-TABLE ?auto_46889 ) ( ON ?auto_46890 ?auto_46889 ) ( not ( = ?auto_46889 ?auto_46890 ) ) ( not ( = ?auto_46889 ?auto_46893 ) ) ( not ( = ?auto_46890 ?auto_46893 ) ) ( not ( = ?auto_46889 ?auto_46891 ) ) ( not ( = ?auto_46889 ?auto_46895 ) ) ( not ( = ?auto_46890 ?auto_46891 ) ) ( not ( = ?auto_46890 ?auto_46895 ) ) ( not ( = ?auto_46893 ?auto_46891 ) ) ( not ( = ?auto_46893 ?auto_46895 ) ) ( not ( = ?auto_46891 ?auto_46895 ) ) ( ON ?auto_46891 ?auto_46893 ) ( CLEAR ?auto_46892 ) ( ON-TABLE ?auto_46894 ) ( ON ?auto_46892 ?auto_46894 ) ( not ( = ?auto_46894 ?auto_46892 ) ) ( not ( = ?auto_46894 ?auto_46895 ) ) ( not ( = ?auto_46892 ?auto_46895 ) ) ( not ( = ?auto_46889 ?auto_46892 ) ) ( not ( = ?auto_46889 ?auto_46894 ) ) ( not ( = ?auto_46890 ?auto_46892 ) ) ( not ( = ?auto_46890 ?auto_46894 ) ) ( not ( = ?auto_46893 ?auto_46892 ) ) ( not ( = ?auto_46893 ?auto_46894 ) ) ( not ( = ?auto_46891 ?auto_46892 ) ) ( not ( = ?auto_46891 ?auto_46894 ) ) ( ON ?auto_46895 ?auto_46891 ) ( CLEAR ?auto_46895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46889 ?auto_46890 ?auto_46893 ?auto_46891 )
      ( MAKE-2PILE ?auto_46889 ?auto_46890 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46896 - BLOCK
      ?auto_46897 - BLOCK
    )
    :vars
    (
      ?auto_46898 - BLOCK
      ?auto_46901 - BLOCK
      ?auto_46899 - BLOCK
      ?auto_46902 - BLOCK
      ?auto_46900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46898 ?auto_46897 ) ( ON-TABLE ?auto_46896 ) ( ON ?auto_46897 ?auto_46896 ) ( not ( = ?auto_46896 ?auto_46897 ) ) ( not ( = ?auto_46896 ?auto_46898 ) ) ( not ( = ?auto_46897 ?auto_46898 ) ) ( not ( = ?auto_46896 ?auto_46901 ) ) ( not ( = ?auto_46896 ?auto_46899 ) ) ( not ( = ?auto_46897 ?auto_46901 ) ) ( not ( = ?auto_46897 ?auto_46899 ) ) ( not ( = ?auto_46898 ?auto_46901 ) ) ( not ( = ?auto_46898 ?auto_46899 ) ) ( not ( = ?auto_46901 ?auto_46899 ) ) ( ON ?auto_46901 ?auto_46898 ) ( ON-TABLE ?auto_46902 ) ( not ( = ?auto_46902 ?auto_46900 ) ) ( not ( = ?auto_46902 ?auto_46899 ) ) ( not ( = ?auto_46900 ?auto_46899 ) ) ( not ( = ?auto_46896 ?auto_46900 ) ) ( not ( = ?auto_46896 ?auto_46902 ) ) ( not ( = ?auto_46897 ?auto_46900 ) ) ( not ( = ?auto_46897 ?auto_46902 ) ) ( not ( = ?auto_46898 ?auto_46900 ) ) ( not ( = ?auto_46898 ?auto_46902 ) ) ( not ( = ?auto_46901 ?auto_46900 ) ) ( not ( = ?auto_46901 ?auto_46902 ) ) ( ON ?auto_46899 ?auto_46901 ) ( CLEAR ?auto_46899 ) ( HOLDING ?auto_46900 ) ( CLEAR ?auto_46902 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46902 ?auto_46900 )
      ( MAKE-2PILE ?auto_46896 ?auto_46897 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46903 - BLOCK
      ?auto_46904 - BLOCK
    )
    :vars
    (
      ?auto_46909 - BLOCK
      ?auto_46906 - BLOCK
      ?auto_46908 - BLOCK
      ?auto_46907 - BLOCK
      ?auto_46905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46909 ?auto_46904 ) ( ON-TABLE ?auto_46903 ) ( ON ?auto_46904 ?auto_46903 ) ( not ( = ?auto_46903 ?auto_46904 ) ) ( not ( = ?auto_46903 ?auto_46909 ) ) ( not ( = ?auto_46904 ?auto_46909 ) ) ( not ( = ?auto_46903 ?auto_46906 ) ) ( not ( = ?auto_46903 ?auto_46908 ) ) ( not ( = ?auto_46904 ?auto_46906 ) ) ( not ( = ?auto_46904 ?auto_46908 ) ) ( not ( = ?auto_46909 ?auto_46906 ) ) ( not ( = ?auto_46909 ?auto_46908 ) ) ( not ( = ?auto_46906 ?auto_46908 ) ) ( ON ?auto_46906 ?auto_46909 ) ( ON-TABLE ?auto_46907 ) ( not ( = ?auto_46907 ?auto_46905 ) ) ( not ( = ?auto_46907 ?auto_46908 ) ) ( not ( = ?auto_46905 ?auto_46908 ) ) ( not ( = ?auto_46903 ?auto_46905 ) ) ( not ( = ?auto_46903 ?auto_46907 ) ) ( not ( = ?auto_46904 ?auto_46905 ) ) ( not ( = ?auto_46904 ?auto_46907 ) ) ( not ( = ?auto_46909 ?auto_46905 ) ) ( not ( = ?auto_46909 ?auto_46907 ) ) ( not ( = ?auto_46906 ?auto_46905 ) ) ( not ( = ?auto_46906 ?auto_46907 ) ) ( ON ?auto_46908 ?auto_46906 ) ( CLEAR ?auto_46907 ) ( ON ?auto_46905 ?auto_46908 ) ( CLEAR ?auto_46905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46903 ?auto_46904 ?auto_46909 ?auto_46906 ?auto_46908 )
      ( MAKE-2PILE ?auto_46903 ?auto_46904 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46910 - BLOCK
      ?auto_46911 - BLOCK
    )
    :vars
    (
      ?auto_46916 - BLOCK
      ?auto_46915 - BLOCK
      ?auto_46913 - BLOCK
      ?auto_46914 - BLOCK
      ?auto_46912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46916 ?auto_46911 ) ( ON-TABLE ?auto_46910 ) ( ON ?auto_46911 ?auto_46910 ) ( not ( = ?auto_46910 ?auto_46911 ) ) ( not ( = ?auto_46910 ?auto_46916 ) ) ( not ( = ?auto_46911 ?auto_46916 ) ) ( not ( = ?auto_46910 ?auto_46915 ) ) ( not ( = ?auto_46910 ?auto_46913 ) ) ( not ( = ?auto_46911 ?auto_46915 ) ) ( not ( = ?auto_46911 ?auto_46913 ) ) ( not ( = ?auto_46916 ?auto_46915 ) ) ( not ( = ?auto_46916 ?auto_46913 ) ) ( not ( = ?auto_46915 ?auto_46913 ) ) ( ON ?auto_46915 ?auto_46916 ) ( not ( = ?auto_46914 ?auto_46912 ) ) ( not ( = ?auto_46914 ?auto_46913 ) ) ( not ( = ?auto_46912 ?auto_46913 ) ) ( not ( = ?auto_46910 ?auto_46912 ) ) ( not ( = ?auto_46910 ?auto_46914 ) ) ( not ( = ?auto_46911 ?auto_46912 ) ) ( not ( = ?auto_46911 ?auto_46914 ) ) ( not ( = ?auto_46916 ?auto_46912 ) ) ( not ( = ?auto_46916 ?auto_46914 ) ) ( not ( = ?auto_46915 ?auto_46912 ) ) ( not ( = ?auto_46915 ?auto_46914 ) ) ( ON ?auto_46913 ?auto_46915 ) ( ON ?auto_46912 ?auto_46913 ) ( CLEAR ?auto_46912 ) ( HOLDING ?auto_46914 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46914 )
      ( MAKE-2PILE ?auto_46910 ?auto_46911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46917 - BLOCK
      ?auto_46918 - BLOCK
    )
    :vars
    (
      ?auto_46921 - BLOCK
      ?auto_46922 - BLOCK
      ?auto_46920 - BLOCK
      ?auto_46923 - BLOCK
      ?auto_46919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46921 ?auto_46918 ) ( ON-TABLE ?auto_46917 ) ( ON ?auto_46918 ?auto_46917 ) ( not ( = ?auto_46917 ?auto_46918 ) ) ( not ( = ?auto_46917 ?auto_46921 ) ) ( not ( = ?auto_46918 ?auto_46921 ) ) ( not ( = ?auto_46917 ?auto_46922 ) ) ( not ( = ?auto_46917 ?auto_46920 ) ) ( not ( = ?auto_46918 ?auto_46922 ) ) ( not ( = ?auto_46918 ?auto_46920 ) ) ( not ( = ?auto_46921 ?auto_46922 ) ) ( not ( = ?auto_46921 ?auto_46920 ) ) ( not ( = ?auto_46922 ?auto_46920 ) ) ( ON ?auto_46922 ?auto_46921 ) ( not ( = ?auto_46923 ?auto_46919 ) ) ( not ( = ?auto_46923 ?auto_46920 ) ) ( not ( = ?auto_46919 ?auto_46920 ) ) ( not ( = ?auto_46917 ?auto_46919 ) ) ( not ( = ?auto_46917 ?auto_46923 ) ) ( not ( = ?auto_46918 ?auto_46919 ) ) ( not ( = ?auto_46918 ?auto_46923 ) ) ( not ( = ?auto_46921 ?auto_46919 ) ) ( not ( = ?auto_46921 ?auto_46923 ) ) ( not ( = ?auto_46922 ?auto_46919 ) ) ( not ( = ?auto_46922 ?auto_46923 ) ) ( ON ?auto_46920 ?auto_46922 ) ( ON ?auto_46919 ?auto_46920 ) ( ON ?auto_46923 ?auto_46919 ) ( CLEAR ?auto_46923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46917 ?auto_46918 ?auto_46921 ?auto_46922 ?auto_46920 ?auto_46919 )
      ( MAKE-2PILE ?auto_46917 ?auto_46918 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46929 - BLOCK
      ?auto_46930 - BLOCK
      ?auto_46931 - BLOCK
      ?auto_46932 - BLOCK
      ?auto_46933 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_46933 ) ( CLEAR ?auto_46932 ) ( ON-TABLE ?auto_46929 ) ( ON ?auto_46930 ?auto_46929 ) ( ON ?auto_46931 ?auto_46930 ) ( ON ?auto_46932 ?auto_46931 ) ( not ( = ?auto_46929 ?auto_46930 ) ) ( not ( = ?auto_46929 ?auto_46931 ) ) ( not ( = ?auto_46929 ?auto_46932 ) ) ( not ( = ?auto_46929 ?auto_46933 ) ) ( not ( = ?auto_46930 ?auto_46931 ) ) ( not ( = ?auto_46930 ?auto_46932 ) ) ( not ( = ?auto_46930 ?auto_46933 ) ) ( not ( = ?auto_46931 ?auto_46932 ) ) ( not ( = ?auto_46931 ?auto_46933 ) ) ( not ( = ?auto_46932 ?auto_46933 ) ) )
    :subtasks
    ( ( !STACK ?auto_46933 ?auto_46932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46934 - BLOCK
      ?auto_46935 - BLOCK
      ?auto_46936 - BLOCK
      ?auto_46937 - BLOCK
      ?auto_46938 - BLOCK
    )
    :vars
    (
      ?auto_46939 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_46937 ) ( ON-TABLE ?auto_46934 ) ( ON ?auto_46935 ?auto_46934 ) ( ON ?auto_46936 ?auto_46935 ) ( ON ?auto_46937 ?auto_46936 ) ( not ( = ?auto_46934 ?auto_46935 ) ) ( not ( = ?auto_46934 ?auto_46936 ) ) ( not ( = ?auto_46934 ?auto_46937 ) ) ( not ( = ?auto_46934 ?auto_46938 ) ) ( not ( = ?auto_46935 ?auto_46936 ) ) ( not ( = ?auto_46935 ?auto_46937 ) ) ( not ( = ?auto_46935 ?auto_46938 ) ) ( not ( = ?auto_46936 ?auto_46937 ) ) ( not ( = ?auto_46936 ?auto_46938 ) ) ( not ( = ?auto_46937 ?auto_46938 ) ) ( ON ?auto_46938 ?auto_46939 ) ( CLEAR ?auto_46938 ) ( HAND-EMPTY ) ( not ( = ?auto_46934 ?auto_46939 ) ) ( not ( = ?auto_46935 ?auto_46939 ) ) ( not ( = ?auto_46936 ?auto_46939 ) ) ( not ( = ?auto_46937 ?auto_46939 ) ) ( not ( = ?auto_46938 ?auto_46939 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46938 ?auto_46939 )
      ( MAKE-5PILE ?auto_46934 ?auto_46935 ?auto_46936 ?auto_46937 ?auto_46938 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46940 - BLOCK
      ?auto_46941 - BLOCK
      ?auto_46942 - BLOCK
      ?auto_46943 - BLOCK
      ?auto_46944 - BLOCK
    )
    :vars
    (
      ?auto_46945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46940 ) ( ON ?auto_46941 ?auto_46940 ) ( ON ?auto_46942 ?auto_46941 ) ( not ( = ?auto_46940 ?auto_46941 ) ) ( not ( = ?auto_46940 ?auto_46942 ) ) ( not ( = ?auto_46940 ?auto_46943 ) ) ( not ( = ?auto_46940 ?auto_46944 ) ) ( not ( = ?auto_46941 ?auto_46942 ) ) ( not ( = ?auto_46941 ?auto_46943 ) ) ( not ( = ?auto_46941 ?auto_46944 ) ) ( not ( = ?auto_46942 ?auto_46943 ) ) ( not ( = ?auto_46942 ?auto_46944 ) ) ( not ( = ?auto_46943 ?auto_46944 ) ) ( ON ?auto_46944 ?auto_46945 ) ( CLEAR ?auto_46944 ) ( not ( = ?auto_46940 ?auto_46945 ) ) ( not ( = ?auto_46941 ?auto_46945 ) ) ( not ( = ?auto_46942 ?auto_46945 ) ) ( not ( = ?auto_46943 ?auto_46945 ) ) ( not ( = ?auto_46944 ?auto_46945 ) ) ( HOLDING ?auto_46943 ) ( CLEAR ?auto_46942 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46940 ?auto_46941 ?auto_46942 ?auto_46943 )
      ( MAKE-5PILE ?auto_46940 ?auto_46941 ?auto_46942 ?auto_46943 ?auto_46944 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46946 - BLOCK
      ?auto_46947 - BLOCK
      ?auto_46948 - BLOCK
      ?auto_46949 - BLOCK
      ?auto_46950 - BLOCK
    )
    :vars
    (
      ?auto_46951 - BLOCK
      ?auto_46952 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46946 ) ( ON ?auto_46947 ?auto_46946 ) ( ON ?auto_46948 ?auto_46947 ) ( not ( = ?auto_46946 ?auto_46947 ) ) ( not ( = ?auto_46946 ?auto_46948 ) ) ( not ( = ?auto_46946 ?auto_46949 ) ) ( not ( = ?auto_46946 ?auto_46950 ) ) ( not ( = ?auto_46947 ?auto_46948 ) ) ( not ( = ?auto_46947 ?auto_46949 ) ) ( not ( = ?auto_46947 ?auto_46950 ) ) ( not ( = ?auto_46948 ?auto_46949 ) ) ( not ( = ?auto_46948 ?auto_46950 ) ) ( not ( = ?auto_46949 ?auto_46950 ) ) ( ON ?auto_46950 ?auto_46951 ) ( not ( = ?auto_46946 ?auto_46951 ) ) ( not ( = ?auto_46947 ?auto_46951 ) ) ( not ( = ?auto_46948 ?auto_46951 ) ) ( not ( = ?auto_46949 ?auto_46951 ) ) ( not ( = ?auto_46950 ?auto_46951 ) ) ( CLEAR ?auto_46948 ) ( ON ?auto_46949 ?auto_46950 ) ( CLEAR ?auto_46949 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46952 ) ( ON ?auto_46951 ?auto_46952 ) ( not ( = ?auto_46952 ?auto_46951 ) ) ( not ( = ?auto_46952 ?auto_46950 ) ) ( not ( = ?auto_46952 ?auto_46949 ) ) ( not ( = ?auto_46946 ?auto_46952 ) ) ( not ( = ?auto_46947 ?auto_46952 ) ) ( not ( = ?auto_46948 ?auto_46952 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46952 ?auto_46951 ?auto_46950 )
      ( MAKE-5PILE ?auto_46946 ?auto_46947 ?auto_46948 ?auto_46949 ?auto_46950 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46953 - BLOCK
      ?auto_46954 - BLOCK
      ?auto_46955 - BLOCK
      ?auto_46956 - BLOCK
      ?auto_46957 - BLOCK
    )
    :vars
    (
      ?auto_46959 - BLOCK
      ?auto_46958 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46953 ) ( ON ?auto_46954 ?auto_46953 ) ( not ( = ?auto_46953 ?auto_46954 ) ) ( not ( = ?auto_46953 ?auto_46955 ) ) ( not ( = ?auto_46953 ?auto_46956 ) ) ( not ( = ?auto_46953 ?auto_46957 ) ) ( not ( = ?auto_46954 ?auto_46955 ) ) ( not ( = ?auto_46954 ?auto_46956 ) ) ( not ( = ?auto_46954 ?auto_46957 ) ) ( not ( = ?auto_46955 ?auto_46956 ) ) ( not ( = ?auto_46955 ?auto_46957 ) ) ( not ( = ?auto_46956 ?auto_46957 ) ) ( ON ?auto_46957 ?auto_46959 ) ( not ( = ?auto_46953 ?auto_46959 ) ) ( not ( = ?auto_46954 ?auto_46959 ) ) ( not ( = ?auto_46955 ?auto_46959 ) ) ( not ( = ?auto_46956 ?auto_46959 ) ) ( not ( = ?auto_46957 ?auto_46959 ) ) ( ON ?auto_46956 ?auto_46957 ) ( CLEAR ?auto_46956 ) ( ON-TABLE ?auto_46958 ) ( ON ?auto_46959 ?auto_46958 ) ( not ( = ?auto_46958 ?auto_46959 ) ) ( not ( = ?auto_46958 ?auto_46957 ) ) ( not ( = ?auto_46958 ?auto_46956 ) ) ( not ( = ?auto_46953 ?auto_46958 ) ) ( not ( = ?auto_46954 ?auto_46958 ) ) ( not ( = ?auto_46955 ?auto_46958 ) ) ( HOLDING ?auto_46955 ) ( CLEAR ?auto_46954 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_46953 ?auto_46954 ?auto_46955 )
      ( MAKE-5PILE ?auto_46953 ?auto_46954 ?auto_46955 ?auto_46956 ?auto_46957 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46960 - BLOCK
      ?auto_46961 - BLOCK
      ?auto_46962 - BLOCK
      ?auto_46963 - BLOCK
      ?auto_46964 - BLOCK
    )
    :vars
    (
      ?auto_46965 - BLOCK
      ?auto_46966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46960 ) ( ON ?auto_46961 ?auto_46960 ) ( not ( = ?auto_46960 ?auto_46961 ) ) ( not ( = ?auto_46960 ?auto_46962 ) ) ( not ( = ?auto_46960 ?auto_46963 ) ) ( not ( = ?auto_46960 ?auto_46964 ) ) ( not ( = ?auto_46961 ?auto_46962 ) ) ( not ( = ?auto_46961 ?auto_46963 ) ) ( not ( = ?auto_46961 ?auto_46964 ) ) ( not ( = ?auto_46962 ?auto_46963 ) ) ( not ( = ?auto_46962 ?auto_46964 ) ) ( not ( = ?auto_46963 ?auto_46964 ) ) ( ON ?auto_46964 ?auto_46965 ) ( not ( = ?auto_46960 ?auto_46965 ) ) ( not ( = ?auto_46961 ?auto_46965 ) ) ( not ( = ?auto_46962 ?auto_46965 ) ) ( not ( = ?auto_46963 ?auto_46965 ) ) ( not ( = ?auto_46964 ?auto_46965 ) ) ( ON ?auto_46963 ?auto_46964 ) ( ON-TABLE ?auto_46966 ) ( ON ?auto_46965 ?auto_46966 ) ( not ( = ?auto_46966 ?auto_46965 ) ) ( not ( = ?auto_46966 ?auto_46964 ) ) ( not ( = ?auto_46966 ?auto_46963 ) ) ( not ( = ?auto_46960 ?auto_46966 ) ) ( not ( = ?auto_46961 ?auto_46966 ) ) ( not ( = ?auto_46962 ?auto_46966 ) ) ( CLEAR ?auto_46961 ) ( ON ?auto_46962 ?auto_46963 ) ( CLEAR ?auto_46962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_46966 ?auto_46965 ?auto_46964 ?auto_46963 )
      ( MAKE-5PILE ?auto_46960 ?auto_46961 ?auto_46962 ?auto_46963 ?auto_46964 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46967 - BLOCK
      ?auto_46968 - BLOCK
      ?auto_46969 - BLOCK
      ?auto_46970 - BLOCK
      ?auto_46971 - BLOCK
    )
    :vars
    (
      ?auto_46973 - BLOCK
      ?auto_46972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46967 ) ( not ( = ?auto_46967 ?auto_46968 ) ) ( not ( = ?auto_46967 ?auto_46969 ) ) ( not ( = ?auto_46967 ?auto_46970 ) ) ( not ( = ?auto_46967 ?auto_46971 ) ) ( not ( = ?auto_46968 ?auto_46969 ) ) ( not ( = ?auto_46968 ?auto_46970 ) ) ( not ( = ?auto_46968 ?auto_46971 ) ) ( not ( = ?auto_46969 ?auto_46970 ) ) ( not ( = ?auto_46969 ?auto_46971 ) ) ( not ( = ?auto_46970 ?auto_46971 ) ) ( ON ?auto_46971 ?auto_46973 ) ( not ( = ?auto_46967 ?auto_46973 ) ) ( not ( = ?auto_46968 ?auto_46973 ) ) ( not ( = ?auto_46969 ?auto_46973 ) ) ( not ( = ?auto_46970 ?auto_46973 ) ) ( not ( = ?auto_46971 ?auto_46973 ) ) ( ON ?auto_46970 ?auto_46971 ) ( ON-TABLE ?auto_46972 ) ( ON ?auto_46973 ?auto_46972 ) ( not ( = ?auto_46972 ?auto_46973 ) ) ( not ( = ?auto_46972 ?auto_46971 ) ) ( not ( = ?auto_46972 ?auto_46970 ) ) ( not ( = ?auto_46967 ?auto_46972 ) ) ( not ( = ?auto_46968 ?auto_46972 ) ) ( not ( = ?auto_46969 ?auto_46972 ) ) ( ON ?auto_46969 ?auto_46970 ) ( CLEAR ?auto_46969 ) ( HOLDING ?auto_46968 ) ( CLEAR ?auto_46967 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_46967 ?auto_46968 )
      ( MAKE-5PILE ?auto_46967 ?auto_46968 ?auto_46969 ?auto_46970 ?auto_46971 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46974 - BLOCK
      ?auto_46975 - BLOCK
      ?auto_46976 - BLOCK
      ?auto_46977 - BLOCK
      ?auto_46978 - BLOCK
    )
    :vars
    (
      ?auto_46979 - BLOCK
      ?auto_46980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_46974 ) ( not ( = ?auto_46974 ?auto_46975 ) ) ( not ( = ?auto_46974 ?auto_46976 ) ) ( not ( = ?auto_46974 ?auto_46977 ) ) ( not ( = ?auto_46974 ?auto_46978 ) ) ( not ( = ?auto_46975 ?auto_46976 ) ) ( not ( = ?auto_46975 ?auto_46977 ) ) ( not ( = ?auto_46975 ?auto_46978 ) ) ( not ( = ?auto_46976 ?auto_46977 ) ) ( not ( = ?auto_46976 ?auto_46978 ) ) ( not ( = ?auto_46977 ?auto_46978 ) ) ( ON ?auto_46978 ?auto_46979 ) ( not ( = ?auto_46974 ?auto_46979 ) ) ( not ( = ?auto_46975 ?auto_46979 ) ) ( not ( = ?auto_46976 ?auto_46979 ) ) ( not ( = ?auto_46977 ?auto_46979 ) ) ( not ( = ?auto_46978 ?auto_46979 ) ) ( ON ?auto_46977 ?auto_46978 ) ( ON-TABLE ?auto_46980 ) ( ON ?auto_46979 ?auto_46980 ) ( not ( = ?auto_46980 ?auto_46979 ) ) ( not ( = ?auto_46980 ?auto_46978 ) ) ( not ( = ?auto_46980 ?auto_46977 ) ) ( not ( = ?auto_46974 ?auto_46980 ) ) ( not ( = ?auto_46975 ?auto_46980 ) ) ( not ( = ?auto_46976 ?auto_46980 ) ) ( ON ?auto_46976 ?auto_46977 ) ( CLEAR ?auto_46974 ) ( ON ?auto_46975 ?auto_46976 ) ( CLEAR ?auto_46975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_46980 ?auto_46979 ?auto_46978 ?auto_46977 ?auto_46976 )
      ( MAKE-5PILE ?auto_46974 ?auto_46975 ?auto_46976 ?auto_46977 ?auto_46978 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46981 - BLOCK
      ?auto_46982 - BLOCK
      ?auto_46983 - BLOCK
      ?auto_46984 - BLOCK
      ?auto_46985 - BLOCK
    )
    :vars
    (
      ?auto_46986 - BLOCK
      ?auto_46987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46981 ?auto_46982 ) ) ( not ( = ?auto_46981 ?auto_46983 ) ) ( not ( = ?auto_46981 ?auto_46984 ) ) ( not ( = ?auto_46981 ?auto_46985 ) ) ( not ( = ?auto_46982 ?auto_46983 ) ) ( not ( = ?auto_46982 ?auto_46984 ) ) ( not ( = ?auto_46982 ?auto_46985 ) ) ( not ( = ?auto_46983 ?auto_46984 ) ) ( not ( = ?auto_46983 ?auto_46985 ) ) ( not ( = ?auto_46984 ?auto_46985 ) ) ( ON ?auto_46985 ?auto_46986 ) ( not ( = ?auto_46981 ?auto_46986 ) ) ( not ( = ?auto_46982 ?auto_46986 ) ) ( not ( = ?auto_46983 ?auto_46986 ) ) ( not ( = ?auto_46984 ?auto_46986 ) ) ( not ( = ?auto_46985 ?auto_46986 ) ) ( ON ?auto_46984 ?auto_46985 ) ( ON-TABLE ?auto_46987 ) ( ON ?auto_46986 ?auto_46987 ) ( not ( = ?auto_46987 ?auto_46986 ) ) ( not ( = ?auto_46987 ?auto_46985 ) ) ( not ( = ?auto_46987 ?auto_46984 ) ) ( not ( = ?auto_46981 ?auto_46987 ) ) ( not ( = ?auto_46982 ?auto_46987 ) ) ( not ( = ?auto_46983 ?auto_46987 ) ) ( ON ?auto_46983 ?auto_46984 ) ( ON ?auto_46982 ?auto_46983 ) ( CLEAR ?auto_46982 ) ( HOLDING ?auto_46981 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46981 )
      ( MAKE-5PILE ?auto_46981 ?auto_46982 ?auto_46983 ?auto_46984 ?auto_46985 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_46988 - BLOCK
      ?auto_46989 - BLOCK
      ?auto_46990 - BLOCK
      ?auto_46991 - BLOCK
      ?auto_46992 - BLOCK
    )
    :vars
    (
      ?auto_46994 - BLOCK
      ?auto_46993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_46988 ?auto_46989 ) ) ( not ( = ?auto_46988 ?auto_46990 ) ) ( not ( = ?auto_46988 ?auto_46991 ) ) ( not ( = ?auto_46988 ?auto_46992 ) ) ( not ( = ?auto_46989 ?auto_46990 ) ) ( not ( = ?auto_46989 ?auto_46991 ) ) ( not ( = ?auto_46989 ?auto_46992 ) ) ( not ( = ?auto_46990 ?auto_46991 ) ) ( not ( = ?auto_46990 ?auto_46992 ) ) ( not ( = ?auto_46991 ?auto_46992 ) ) ( ON ?auto_46992 ?auto_46994 ) ( not ( = ?auto_46988 ?auto_46994 ) ) ( not ( = ?auto_46989 ?auto_46994 ) ) ( not ( = ?auto_46990 ?auto_46994 ) ) ( not ( = ?auto_46991 ?auto_46994 ) ) ( not ( = ?auto_46992 ?auto_46994 ) ) ( ON ?auto_46991 ?auto_46992 ) ( ON-TABLE ?auto_46993 ) ( ON ?auto_46994 ?auto_46993 ) ( not ( = ?auto_46993 ?auto_46994 ) ) ( not ( = ?auto_46993 ?auto_46992 ) ) ( not ( = ?auto_46993 ?auto_46991 ) ) ( not ( = ?auto_46988 ?auto_46993 ) ) ( not ( = ?auto_46989 ?auto_46993 ) ) ( not ( = ?auto_46990 ?auto_46993 ) ) ( ON ?auto_46990 ?auto_46991 ) ( ON ?auto_46989 ?auto_46990 ) ( ON ?auto_46988 ?auto_46989 ) ( CLEAR ?auto_46988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_46993 ?auto_46994 ?auto_46992 ?auto_46991 ?auto_46990 ?auto_46989 )
      ( MAKE-5PILE ?auto_46988 ?auto_46989 ?auto_46990 ?auto_46991 ?auto_46992 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46996 - BLOCK
    )
    :vars
    (
      ?auto_46997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46997 ?auto_46996 ) ( CLEAR ?auto_46997 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_46996 ) ( not ( = ?auto_46996 ?auto_46997 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_46997 ?auto_46996 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46998 - BLOCK
    )
    :vars
    (
      ?auto_46999 - BLOCK
      ?auto_47000 - BLOCK
      ?auto_47001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_46999 ?auto_46998 ) ( CLEAR ?auto_46999 ) ( ON-TABLE ?auto_46998 ) ( not ( = ?auto_46998 ?auto_46999 ) ) ( HOLDING ?auto_47000 ) ( CLEAR ?auto_47001 ) ( not ( = ?auto_46998 ?auto_47000 ) ) ( not ( = ?auto_46998 ?auto_47001 ) ) ( not ( = ?auto_46999 ?auto_47000 ) ) ( not ( = ?auto_46999 ?auto_47001 ) ) ( not ( = ?auto_47000 ?auto_47001 ) ) )
    :subtasks
    ( ( !STACK ?auto_47000 ?auto_47001 )
      ( MAKE-1PILE ?auto_46998 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47002 - BLOCK
    )
    :vars
    (
      ?auto_47004 - BLOCK
      ?auto_47003 - BLOCK
      ?auto_47005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47004 ?auto_47002 ) ( ON-TABLE ?auto_47002 ) ( not ( = ?auto_47002 ?auto_47004 ) ) ( CLEAR ?auto_47003 ) ( not ( = ?auto_47002 ?auto_47005 ) ) ( not ( = ?auto_47002 ?auto_47003 ) ) ( not ( = ?auto_47004 ?auto_47005 ) ) ( not ( = ?auto_47004 ?auto_47003 ) ) ( not ( = ?auto_47005 ?auto_47003 ) ) ( ON ?auto_47005 ?auto_47004 ) ( CLEAR ?auto_47005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47002 ?auto_47004 )
      ( MAKE-1PILE ?auto_47002 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47006 - BLOCK
    )
    :vars
    (
      ?auto_47009 - BLOCK
      ?auto_47007 - BLOCK
      ?auto_47008 - BLOCK
      ?auto_47011 - BLOCK
      ?auto_47010 - BLOCK
      ?auto_47012 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47009 ?auto_47006 ) ( ON-TABLE ?auto_47006 ) ( not ( = ?auto_47006 ?auto_47009 ) ) ( not ( = ?auto_47006 ?auto_47007 ) ) ( not ( = ?auto_47006 ?auto_47008 ) ) ( not ( = ?auto_47009 ?auto_47007 ) ) ( not ( = ?auto_47009 ?auto_47008 ) ) ( not ( = ?auto_47007 ?auto_47008 ) ) ( ON ?auto_47007 ?auto_47009 ) ( CLEAR ?auto_47007 ) ( HOLDING ?auto_47008 ) ( CLEAR ?auto_47011 ) ( ON-TABLE ?auto_47010 ) ( ON ?auto_47012 ?auto_47010 ) ( ON ?auto_47011 ?auto_47012 ) ( not ( = ?auto_47010 ?auto_47012 ) ) ( not ( = ?auto_47010 ?auto_47011 ) ) ( not ( = ?auto_47010 ?auto_47008 ) ) ( not ( = ?auto_47012 ?auto_47011 ) ) ( not ( = ?auto_47012 ?auto_47008 ) ) ( not ( = ?auto_47011 ?auto_47008 ) ) ( not ( = ?auto_47006 ?auto_47011 ) ) ( not ( = ?auto_47006 ?auto_47010 ) ) ( not ( = ?auto_47006 ?auto_47012 ) ) ( not ( = ?auto_47009 ?auto_47011 ) ) ( not ( = ?auto_47009 ?auto_47010 ) ) ( not ( = ?auto_47009 ?auto_47012 ) ) ( not ( = ?auto_47007 ?auto_47011 ) ) ( not ( = ?auto_47007 ?auto_47010 ) ) ( not ( = ?auto_47007 ?auto_47012 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47010 ?auto_47012 ?auto_47011 ?auto_47008 )
      ( MAKE-1PILE ?auto_47006 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47013 - BLOCK
    )
    :vars
    (
      ?auto_47019 - BLOCK
      ?auto_47014 - BLOCK
      ?auto_47018 - BLOCK
      ?auto_47017 - BLOCK
      ?auto_47016 - BLOCK
      ?auto_47015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47019 ?auto_47013 ) ( ON-TABLE ?auto_47013 ) ( not ( = ?auto_47013 ?auto_47019 ) ) ( not ( = ?auto_47013 ?auto_47014 ) ) ( not ( = ?auto_47013 ?auto_47018 ) ) ( not ( = ?auto_47019 ?auto_47014 ) ) ( not ( = ?auto_47019 ?auto_47018 ) ) ( not ( = ?auto_47014 ?auto_47018 ) ) ( ON ?auto_47014 ?auto_47019 ) ( CLEAR ?auto_47017 ) ( ON-TABLE ?auto_47016 ) ( ON ?auto_47015 ?auto_47016 ) ( ON ?auto_47017 ?auto_47015 ) ( not ( = ?auto_47016 ?auto_47015 ) ) ( not ( = ?auto_47016 ?auto_47017 ) ) ( not ( = ?auto_47016 ?auto_47018 ) ) ( not ( = ?auto_47015 ?auto_47017 ) ) ( not ( = ?auto_47015 ?auto_47018 ) ) ( not ( = ?auto_47017 ?auto_47018 ) ) ( not ( = ?auto_47013 ?auto_47017 ) ) ( not ( = ?auto_47013 ?auto_47016 ) ) ( not ( = ?auto_47013 ?auto_47015 ) ) ( not ( = ?auto_47019 ?auto_47017 ) ) ( not ( = ?auto_47019 ?auto_47016 ) ) ( not ( = ?auto_47019 ?auto_47015 ) ) ( not ( = ?auto_47014 ?auto_47017 ) ) ( not ( = ?auto_47014 ?auto_47016 ) ) ( not ( = ?auto_47014 ?auto_47015 ) ) ( ON ?auto_47018 ?auto_47014 ) ( CLEAR ?auto_47018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47013 ?auto_47019 ?auto_47014 )
      ( MAKE-1PILE ?auto_47013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47020 - BLOCK
    )
    :vars
    (
      ?auto_47021 - BLOCK
      ?auto_47025 - BLOCK
      ?auto_47023 - BLOCK
      ?auto_47022 - BLOCK
      ?auto_47024 - BLOCK
      ?auto_47026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47021 ?auto_47020 ) ( ON-TABLE ?auto_47020 ) ( not ( = ?auto_47020 ?auto_47021 ) ) ( not ( = ?auto_47020 ?auto_47025 ) ) ( not ( = ?auto_47020 ?auto_47023 ) ) ( not ( = ?auto_47021 ?auto_47025 ) ) ( not ( = ?auto_47021 ?auto_47023 ) ) ( not ( = ?auto_47025 ?auto_47023 ) ) ( ON ?auto_47025 ?auto_47021 ) ( ON-TABLE ?auto_47022 ) ( ON ?auto_47024 ?auto_47022 ) ( not ( = ?auto_47022 ?auto_47024 ) ) ( not ( = ?auto_47022 ?auto_47026 ) ) ( not ( = ?auto_47022 ?auto_47023 ) ) ( not ( = ?auto_47024 ?auto_47026 ) ) ( not ( = ?auto_47024 ?auto_47023 ) ) ( not ( = ?auto_47026 ?auto_47023 ) ) ( not ( = ?auto_47020 ?auto_47026 ) ) ( not ( = ?auto_47020 ?auto_47022 ) ) ( not ( = ?auto_47020 ?auto_47024 ) ) ( not ( = ?auto_47021 ?auto_47026 ) ) ( not ( = ?auto_47021 ?auto_47022 ) ) ( not ( = ?auto_47021 ?auto_47024 ) ) ( not ( = ?auto_47025 ?auto_47026 ) ) ( not ( = ?auto_47025 ?auto_47022 ) ) ( not ( = ?auto_47025 ?auto_47024 ) ) ( ON ?auto_47023 ?auto_47025 ) ( CLEAR ?auto_47023 ) ( HOLDING ?auto_47026 ) ( CLEAR ?auto_47024 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47022 ?auto_47024 ?auto_47026 )
      ( MAKE-1PILE ?auto_47020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47027 - BLOCK
    )
    :vars
    (
      ?auto_47033 - BLOCK
      ?auto_47031 - BLOCK
      ?auto_47028 - BLOCK
      ?auto_47030 - BLOCK
      ?auto_47029 - BLOCK
      ?auto_47032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47033 ?auto_47027 ) ( ON-TABLE ?auto_47027 ) ( not ( = ?auto_47027 ?auto_47033 ) ) ( not ( = ?auto_47027 ?auto_47031 ) ) ( not ( = ?auto_47027 ?auto_47028 ) ) ( not ( = ?auto_47033 ?auto_47031 ) ) ( not ( = ?auto_47033 ?auto_47028 ) ) ( not ( = ?auto_47031 ?auto_47028 ) ) ( ON ?auto_47031 ?auto_47033 ) ( ON-TABLE ?auto_47030 ) ( ON ?auto_47029 ?auto_47030 ) ( not ( = ?auto_47030 ?auto_47029 ) ) ( not ( = ?auto_47030 ?auto_47032 ) ) ( not ( = ?auto_47030 ?auto_47028 ) ) ( not ( = ?auto_47029 ?auto_47032 ) ) ( not ( = ?auto_47029 ?auto_47028 ) ) ( not ( = ?auto_47032 ?auto_47028 ) ) ( not ( = ?auto_47027 ?auto_47032 ) ) ( not ( = ?auto_47027 ?auto_47030 ) ) ( not ( = ?auto_47027 ?auto_47029 ) ) ( not ( = ?auto_47033 ?auto_47032 ) ) ( not ( = ?auto_47033 ?auto_47030 ) ) ( not ( = ?auto_47033 ?auto_47029 ) ) ( not ( = ?auto_47031 ?auto_47032 ) ) ( not ( = ?auto_47031 ?auto_47030 ) ) ( not ( = ?auto_47031 ?auto_47029 ) ) ( ON ?auto_47028 ?auto_47031 ) ( CLEAR ?auto_47029 ) ( ON ?auto_47032 ?auto_47028 ) ( CLEAR ?auto_47032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47027 ?auto_47033 ?auto_47031 ?auto_47028 )
      ( MAKE-1PILE ?auto_47027 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47034 - BLOCK
    )
    :vars
    (
      ?auto_47040 - BLOCK
      ?auto_47038 - BLOCK
      ?auto_47035 - BLOCK
      ?auto_47039 - BLOCK
      ?auto_47037 - BLOCK
      ?auto_47036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47040 ?auto_47034 ) ( ON-TABLE ?auto_47034 ) ( not ( = ?auto_47034 ?auto_47040 ) ) ( not ( = ?auto_47034 ?auto_47038 ) ) ( not ( = ?auto_47034 ?auto_47035 ) ) ( not ( = ?auto_47040 ?auto_47038 ) ) ( not ( = ?auto_47040 ?auto_47035 ) ) ( not ( = ?auto_47038 ?auto_47035 ) ) ( ON ?auto_47038 ?auto_47040 ) ( ON-TABLE ?auto_47039 ) ( not ( = ?auto_47039 ?auto_47037 ) ) ( not ( = ?auto_47039 ?auto_47036 ) ) ( not ( = ?auto_47039 ?auto_47035 ) ) ( not ( = ?auto_47037 ?auto_47036 ) ) ( not ( = ?auto_47037 ?auto_47035 ) ) ( not ( = ?auto_47036 ?auto_47035 ) ) ( not ( = ?auto_47034 ?auto_47036 ) ) ( not ( = ?auto_47034 ?auto_47039 ) ) ( not ( = ?auto_47034 ?auto_47037 ) ) ( not ( = ?auto_47040 ?auto_47036 ) ) ( not ( = ?auto_47040 ?auto_47039 ) ) ( not ( = ?auto_47040 ?auto_47037 ) ) ( not ( = ?auto_47038 ?auto_47036 ) ) ( not ( = ?auto_47038 ?auto_47039 ) ) ( not ( = ?auto_47038 ?auto_47037 ) ) ( ON ?auto_47035 ?auto_47038 ) ( ON ?auto_47036 ?auto_47035 ) ( CLEAR ?auto_47036 ) ( HOLDING ?auto_47037 ) ( CLEAR ?auto_47039 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47039 ?auto_47037 )
      ( MAKE-1PILE ?auto_47034 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47041 - BLOCK
    )
    :vars
    (
      ?auto_47046 - BLOCK
      ?auto_47043 - BLOCK
      ?auto_47044 - BLOCK
      ?auto_47045 - BLOCK
      ?auto_47047 - BLOCK
      ?auto_47042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47046 ?auto_47041 ) ( ON-TABLE ?auto_47041 ) ( not ( = ?auto_47041 ?auto_47046 ) ) ( not ( = ?auto_47041 ?auto_47043 ) ) ( not ( = ?auto_47041 ?auto_47044 ) ) ( not ( = ?auto_47046 ?auto_47043 ) ) ( not ( = ?auto_47046 ?auto_47044 ) ) ( not ( = ?auto_47043 ?auto_47044 ) ) ( ON ?auto_47043 ?auto_47046 ) ( ON-TABLE ?auto_47045 ) ( not ( = ?auto_47045 ?auto_47047 ) ) ( not ( = ?auto_47045 ?auto_47042 ) ) ( not ( = ?auto_47045 ?auto_47044 ) ) ( not ( = ?auto_47047 ?auto_47042 ) ) ( not ( = ?auto_47047 ?auto_47044 ) ) ( not ( = ?auto_47042 ?auto_47044 ) ) ( not ( = ?auto_47041 ?auto_47042 ) ) ( not ( = ?auto_47041 ?auto_47045 ) ) ( not ( = ?auto_47041 ?auto_47047 ) ) ( not ( = ?auto_47046 ?auto_47042 ) ) ( not ( = ?auto_47046 ?auto_47045 ) ) ( not ( = ?auto_47046 ?auto_47047 ) ) ( not ( = ?auto_47043 ?auto_47042 ) ) ( not ( = ?auto_47043 ?auto_47045 ) ) ( not ( = ?auto_47043 ?auto_47047 ) ) ( ON ?auto_47044 ?auto_47043 ) ( ON ?auto_47042 ?auto_47044 ) ( CLEAR ?auto_47045 ) ( ON ?auto_47047 ?auto_47042 ) ( CLEAR ?auto_47047 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47041 ?auto_47046 ?auto_47043 ?auto_47044 ?auto_47042 )
      ( MAKE-1PILE ?auto_47041 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47048 - BLOCK
    )
    :vars
    (
      ?auto_47051 - BLOCK
      ?auto_47049 - BLOCK
      ?auto_47053 - BLOCK
      ?auto_47054 - BLOCK
      ?auto_47050 - BLOCK
      ?auto_47052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47051 ?auto_47048 ) ( ON-TABLE ?auto_47048 ) ( not ( = ?auto_47048 ?auto_47051 ) ) ( not ( = ?auto_47048 ?auto_47049 ) ) ( not ( = ?auto_47048 ?auto_47053 ) ) ( not ( = ?auto_47051 ?auto_47049 ) ) ( not ( = ?auto_47051 ?auto_47053 ) ) ( not ( = ?auto_47049 ?auto_47053 ) ) ( ON ?auto_47049 ?auto_47051 ) ( not ( = ?auto_47054 ?auto_47050 ) ) ( not ( = ?auto_47054 ?auto_47052 ) ) ( not ( = ?auto_47054 ?auto_47053 ) ) ( not ( = ?auto_47050 ?auto_47052 ) ) ( not ( = ?auto_47050 ?auto_47053 ) ) ( not ( = ?auto_47052 ?auto_47053 ) ) ( not ( = ?auto_47048 ?auto_47052 ) ) ( not ( = ?auto_47048 ?auto_47054 ) ) ( not ( = ?auto_47048 ?auto_47050 ) ) ( not ( = ?auto_47051 ?auto_47052 ) ) ( not ( = ?auto_47051 ?auto_47054 ) ) ( not ( = ?auto_47051 ?auto_47050 ) ) ( not ( = ?auto_47049 ?auto_47052 ) ) ( not ( = ?auto_47049 ?auto_47054 ) ) ( not ( = ?auto_47049 ?auto_47050 ) ) ( ON ?auto_47053 ?auto_47049 ) ( ON ?auto_47052 ?auto_47053 ) ( ON ?auto_47050 ?auto_47052 ) ( CLEAR ?auto_47050 ) ( HOLDING ?auto_47054 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47054 )
      ( MAKE-1PILE ?auto_47048 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47055 - BLOCK
    )
    :vars
    (
      ?auto_47061 - BLOCK
      ?auto_47059 - BLOCK
      ?auto_47060 - BLOCK
      ?auto_47058 - BLOCK
      ?auto_47057 - BLOCK
      ?auto_47056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47061 ?auto_47055 ) ( ON-TABLE ?auto_47055 ) ( not ( = ?auto_47055 ?auto_47061 ) ) ( not ( = ?auto_47055 ?auto_47059 ) ) ( not ( = ?auto_47055 ?auto_47060 ) ) ( not ( = ?auto_47061 ?auto_47059 ) ) ( not ( = ?auto_47061 ?auto_47060 ) ) ( not ( = ?auto_47059 ?auto_47060 ) ) ( ON ?auto_47059 ?auto_47061 ) ( not ( = ?auto_47058 ?auto_47057 ) ) ( not ( = ?auto_47058 ?auto_47056 ) ) ( not ( = ?auto_47058 ?auto_47060 ) ) ( not ( = ?auto_47057 ?auto_47056 ) ) ( not ( = ?auto_47057 ?auto_47060 ) ) ( not ( = ?auto_47056 ?auto_47060 ) ) ( not ( = ?auto_47055 ?auto_47056 ) ) ( not ( = ?auto_47055 ?auto_47058 ) ) ( not ( = ?auto_47055 ?auto_47057 ) ) ( not ( = ?auto_47061 ?auto_47056 ) ) ( not ( = ?auto_47061 ?auto_47058 ) ) ( not ( = ?auto_47061 ?auto_47057 ) ) ( not ( = ?auto_47059 ?auto_47056 ) ) ( not ( = ?auto_47059 ?auto_47058 ) ) ( not ( = ?auto_47059 ?auto_47057 ) ) ( ON ?auto_47060 ?auto_47059 ) ( ON ?auto_47056 ?auto_47060 ) ( ON ?auto_47057 ?auto_47056 ) ( ON ?auto_47058 ?auto_47057 ) ( CLEAR ?auto_47058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47055 ?auto_47061 ?auto_47059 ?auto_47060 ?auto_47056 ?auto_47057 )
      ( MAKE-1PILE ?auto_47055 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47068 - BLOCK
      ?auto_47069 - BLOCK
      ?auto_47070 - BLOCK
      ?auto_47071 - BLOCK
      ?auto_47072 - BLOCK
      ?auto_47073 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47073 ) ( CLEAR ?auto_47072 ) ( ON-TABLE ?auto_47068 ) ( ON ?auto_47069 ?auto_47068 ) ( ON ?auto_47070 ?auto_47069 ) ( ON ?auto_47071 ?auto_47070 ) ( ON ?auto_47072 ?auto_47071 ) ( not ( = ?auto_47068 ?auto_47069 ) ) ( not ( = ?auto_47068 ?auto_47070 ) ) ( not ( = ?auto_47068 ?auto_47071 ) ) ( not ( = ?auto_47068 ?auto_47072 ) ) ( not ( = ?auto_47068 ?auto_47073 ) ) ( not ( = ?auto_47069 ?auto_47070 ) ) ( not ( = ?auto_47069 ?auto_47071 ) ) ( not ( = ?auto_47069 ?auto_47072 ) ) ( not ( = ?auto_47069 ?auto_47073 ) ) ( not ( = ?auto_47070 ?auto_47071 ) ) ( not ( = ?auto_47070 ?auto_47072 ) ) ( not ( = ?auto_47070 ?auto_47073 ) ) ( not ( = ?auto_47071 ?auto_47072 ) ) ( not ( = ?auto_47071 ?auto_47073 ) ) ( not ( = ?auto_47072 ?auto_47073 ) ) )
    :subtasks
    ( ( !STACK ?auto_47073 ?auto_47072 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47074 - BLOCK
      ?auto_47075 - BLOCK
      ?auto_47076 - BLOCK
      ?auto_47077 - BLOCK
      ?auto_47078 - BLOCK
      ?auto_47079 - BLOCK
    )
    :vars
    (
      ?auto_47080 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47078 ) ( ON-TABLE ?auto_47074 ) ( ON ?auto_47075 ?auto_47074 ) ( ON ?auto_47076 ?auto_47075 ) ( ON ?auto_47077 ?auto_47076 ) ( ON ?auto_47078 ?auto_47077 ) ( not ( = ?auto_47074 ?auto_47075 ) ) ( not ( = ?auto_47074 ?auto_47076 ) ) ( not ( = ?auto_47074 ?auto_47077 ) ) ( not ( = ?auto_47074 ?auto_47078 ) ) ( not ( = ?auto_47074 ?auto_47079 ) ) ( not ( = ?auto_47075 ?auto_47076 ) ) ( not ( = ?auto_47075 ?auto_47077 ) ) ( not ( = ?auto_47075 ?auto_47078 ) ) ( not ( = ?auto_47075 ?auto_47079 ) ) ( not ( = ?auto_47076 ?auto_47077 ) ) ( not ( = ?auto_47076 ?auto_47078 ) ) ( not ( = ?auto_47076 ?auto_47079 ) ) ( not ( = ?auto_47077 ?auto_47078 ) ) ( not ( = ?auto_47077 ?auto_47079 ) ) ( not ( = ?auto_47078 ?auto_47079 ) ) ( ON ?auto_47079 ?auto_47080 ) ( CLEAR ?auto_47079 ) ( HAND-EMPTY ) ( not ( = ?auto_47074 ?auto_47080 ) ) ( not ( = ?auto_47075 ?auto_47080 ) ) ( not ( = ?auto_47076 ?auto_47080 ) ) ( not ( = ?auto_47077 ?auto_47080 ) ) ( not ( = ?auto_47078 ?auto_47080 ) ) ( not ( = ?auto_47079 ?auto_47080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47079 ?auto_47080 )
      ( MAKE-6PILE ?auto_47074 ?auto_47075 ?auto_47076 ?auto_47077 ?auto_47078 ?auto_47079 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47081 - BLOCK
      ?auto_47082 - BLOCK
      ?auto_47083 - BLOCK
      ?auto_47084 - BLOCK
      ?auto_47085 - BLOCK
      ?auto_47086 - BLOCK
    )
    :vars
    (
      ?auto_47087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47081 ) ( ON ?auto_47082 ?auto_47081 ) ( ON ?auto_47083 ?auto_47082 ) ( ON ?auto_47084 ?auto_47083 ) ( not ( = ?auto_47081 ?auto_47082 ) ) ( not ( = ?auto_47081 ?auto_47083 ) ) ( not ( = ?auto_47081 ?auto_47084 ) ) ( not ( = ?auto_47081 ?auto_47085 ) ) ( not ( = ?auto_47081 ?auto_47086 ) ) ( not ( = ?auto_47082 ?auto_47083 ) ) ( not ( = ?auto_47082 ?auto_47084 ) ) ( not ( = ?auto_47082 ?auto_47085 ) ) ( not ( = ?auto_47082 ?auto_47086 ) ) ( not ( = ?auto_47083 ?auto_47084 ) ) ( not ( = ?auto_47083 ?auto_47085 ) ) ( not ( = ?auto_47083 ?auto_47086 ) ) ( not ( = ?auto_47084 ?auto_47085 ) ) ( not ( = ?auto_47084 ?auto_47086 ) ) ( not ( = ?auto_47085 ?auto_47086 ) ) ( ON ?auto_47086 ?auto_47087 ) ( CLEAR ?auto_47086 ) ( not ( = ?auto_47081 ?auto_47087 ) ) ( not ( = ?auto_47082 ?auto_47087 ) ) ( not ( = ?auto_47083 ?auto_47087 ) ) ( not ( = ?auto_47084 ?auto_47087 ) ) ( not ( = ?auto_47085 ?auto_47087 ) ) ( not ( = ?auto_47086 ?auto_47087 ) ) ( HOLDING ?auto_47085 ) ( CLEAR ?auto_47084 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47081 ?auto_47082 ?auto_47083 ?auto_47084 ?auto_47085 )
      ( MAKE-6PILE ?auto_47081 ?auto_47082 ?auto_47083 ?auto_47084 ?auto_47085 ?auto_47086 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47088 - BLOCK
      ?auto_47089 - BLOCK
      ?auto_47090 - BLOCK
      ?auto_47091 - BLOCK
      ?auto_47092 - BLOCK
      ?auto_47093 - BLOCK
    )
    :vars
    (
      ?auto_47094 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47088 ) ( ON ?auto_47089 ?auto_47088 ) ( ON ?auto_47090 ?auto_47089 ) ( ON ?auto_47091 ?auto_47090 ) ( not ( = ?auto_47088 ?auto_47089 ) ) ( not ( = ?auto_47088 ?auto_47090 ) ) ( not ( = ?auto_47088 ?auto_47091 ) ) ( not ( = ?auto_47088 ?auto_47092 ) ) ( not ( = ?auto_47088 ?auto_47093 ) ) ( not ( = ?auto_47089 ?auto_47090 ) ) ( not ( = ?auto_47089 ?auto_47091 ) ) ( not ( = ?auto_47089 ?auto_47092 ) ) ( not ( = ?auto_47089 ?auto_47093 ) ) ( not ( = ?auto_47090 ?auto_47091 ) ) ( not ( = ?auto_47090 ?auto_47092 ) ) ( not ( = ?auto_47090 ?auto_47093 ) ) ( not ( = ?auto_47091 ?auto_47092 ) ) ( not ( = ?auto_47091 ?auto_47093 ) ) ( not ( = ?auto_47092 ?auto_47093 ) ) ( ON ?auto_47093 ?auto_47094 ) ( not ( = ?auto_47088 ?auto_47094 ) ) ( not ( = ?auto_47089 ?auto_47094 ) ) ( not ( = ?auto_47090 ?auto_47094 ) ) ( not ( = ?auto_47091 ?auto_47094 ) ) ( not ( = ?auto_47092 ?auto_47094 ) ) ( not ( = ?auto_47093 ?auto_47094 ) ) ( CLEAR ?auto_47091 ) ( ON ?auto_47092 ?auto_47093 ) ( CLEAR ?auto_47092 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47094 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47094 ?auto_47093 )
      ( MAKE-6PILE ?auto_47088 ?auto_47089 ?auto_47090 ?auto_47091 ?auto_47092 ?auto_47093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47095 - BLOCK
      ?auto_47096 - BLOCK
      ?auto_47097 - BLOCK
      ?auto_47098 - BLOCK
      ?auto_47099 - BLOCK
      ?auto_47100 - BLOCK
    )
    :vars
    (
      ?auto_47101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47095 ) ( ON ?auto_47096 ?auto_47095 ) ( ON ?auto_47097 ?auto_47096 ) ( not ( = ?auto_47095 ?auto_47096 ) ) ( not ( = ?auto_47095 ?auto_47097 ) ) ( not ( = ?auto_47095 ?auto_47098 ) ) ( not ( = ?auto_47095 ?auto_47099 ) ) ( not ( = ?auto_47095 ?auto_47100 ) ) ( not ( = ?auto_47096 ?auto_47097 ) ) ( not ( = ?auto_47096 ?auto_47098 ) ) ( not ( = ?auto_47096 ?auto_47099 ) ) ( not ( = ?auto_47096 ?auto_47100 ) ) ( not ( = ?auto_47097 ?auto_47098 ) ) ( not ( = ?auto_47097 ?auto_47099 ) ) ( not ( = ?auto_47097 ?auto_47100 ) ) ( not ( = ?auto_47098 ?auto_47099 ) ) ( not ( = ?auto_47098 ?auto_47100 ) ) ( not ( = ?auto_47099 ?auto_47100 ) ) ( ON ?auto_47100 ?auto_47101 ) ( not ( = ?auto_47095 ?auto_47101 ) ) ( not ( = ?auto_47096 ?auto_47101 ) ) ( not ( = ?auto_47097 ?auto_47101 ) ) ( not ( = ?auto_47098 ?auto_47101 ) ) ( not ( = ?auto_47099 ?auto_47101 ) ) ( not ( = ?auto_47100 ?auto_47101 ) ) ( ON ?auto_47099 ?auto_47100 ) ( CLEAR ?auto_47099 ) ( ON-TABLE ?auto_47101 ) ( HOLDING ?auto_47098 ) ( CLEAR ?auto_47097 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47095 ?auto_47096 ?auto_47097 ?auto_47098 )
      ( MAKE-6PILE ?auto_47095 ?auto_47096 ?auto_47097 ?auto_47098 ?auto_47099 ?auto_47100 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47102 - BLOCK
      ?auto_47103 - BLOCK
      ?auto_47104 - BLOCK
      ?auto_47105 - BLOCK
      ?auto_47106 - BLOCK
      ?auto_47107 - BLOCK
    )
    :vars
    (
      ?auto_47108 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47102 ) ( ON ?auto_47103 ?auto_47102 ) ( ON ?auto_47104 ?auto_47103 ) ( not ( = ?auto_47102 ?auto_47103 ) ) ( not ( = ?auto_47102 ?auto_47104 ) ) ( not ( = ?auto_47102 ?auto_47105 ) ) ( not ( = ?auto_47102 ?auto_47106 ) ) ( not ( = ?auto_47102 ?auto_47107 ) ) ( not ( = ?auto_47103 ?auto_47104 ) ) ( not ( = ?auto_47103 ?auto_47105 ) ) ( not ( = ?auto_47103 ?auto_47106 ) ) ( not ( = ?auto_47103 ?auto_47107 ) ) ( not ( = ?auto_47104 ?auto_47105 ) ) ( not ( = ?auto_47104 ?auto_47106 ) ) ( not ( = ?auto_47104 ?auto_47107 ) ) ( not ( = ?auto_47105 ?auto_47106 ) ) ( not ( = ?auto_47105 ?auto_47107 ) ) ( not ( = ?auto_47106 ?auto_47107 ) ) ( ON ?auto_47107 ?auto_47108 ) ( not ( = ?auto_47102 ?auto_47108 ) ) ( not ( = ?auto_47103 ?auto_47108 ) ) ( not ( = ?auto_47104 ?auto_47108 ) ) ( not ( = ?auto_47105 ?auto_47108 ) ) ( not ( = ?auto_47106 ?auto_47108 ) ) ( not ( = ?auto_47107 ?auto_47108 ) ) ( ON ?auto_47106 ?auto_47107 ) ( ON-TABLE ?auto_47108 ) ( CLEAR ?auto_47104 ) ( ON ?auto_47105 ?auto_47106 ) ( CLEAR ?auto_47105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47108 ?auto_47107 ?auto_47106 )
      ( MAKE-6PILE ?auto_47102 ?auto_47103 ?auto_47104 ?auto_47105 ?auto_47106 ?auto_47107 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47109 - BLOCK
      ?auto_47110 - BLOCK
      ?auto_47111 - BLOCK
      ?auto_47112 - BLOCK
      ?auto_47113 - BLOCK
      ?auto_47114 - BLOCK
    )
    :vars
    (
      ?auto_47115 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47109 ) ( ON ?auto_47110 ?auto_47109 ) ( not ( = ?auto_47109 ?auto_47110 ) ) ( not ( = ?auto_47109 ?auto_47111 ) ) ( not ( = ?auto_47109 ?auto_47112 ) ) ( not ( = ?auto_47109 ?auto_47113 ) ) ( not ( = ?auto_47109 ?auto_47114 ) ) ( not ( = ?auto_47110 ?auto_47111 ) ) ( not ( = ?auto_47110 ?auto_47112 ) ) ( not ( = ?auto_47110 ?auto_47113 ) ) ( not ( = ?auto_47110 ?auto_47114 ) ) ( not ( = ?auto_47111 ?auto_47112 ) ) ( not ( = ?auto_47111 ?auto_47113 ) ) ( not ( = ?auto_47111 ?auto_47114 ) ) ( not ( = ?auto_47112 ?auto_47113 ) ) ( not ( = ?auto_47112 ?auto_47114 ) ) ( not ( = ?auto_47113 ?auto_47114 ) ) ( ON ?auto_47114 ?auto_47115 ) ( not ( = ?auto_47109 ?auto_47115 ) ) ( not ( = ?auto_47110 ?auto_47115 ) ) ( not ( = ?auto_47111 ?auto_47115 ) ) ( not ( = ?auto_47112 ?auto_47115 ) ) ( not ( = ?auto_47113 ?auto_47115 ) ) ( not ( = ?auto_47114 ?auto_47115 ) ) ( ON ?auto_47113 ?auto_47114 ) ( ON-TABLE ?auto_47115 ) ( ON ?auto_47112 ?auto_47113 ) ( CLEAR ?auto_47112 ) ( HOLDING ?auto_47111 ) ( CLEAR ?auto_47110 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47109 ?auto_47110 ?auto_47111 )
      ( MAKE-6PILE ?auto_47109 ?auto_47110 ?auto_47111 ?auto_47112 ?auto_47113 ?auto_47114 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47116 - BLOCK
      ?auto_47117 - BLOCK
      ?auto_47118 - BLOCK
      ?auto_47119 - BLOCK
      ?auto_47120 - BLOCK
      ?auto_47121 - BLOCK
    )
    :vars
    (
      ?auto_47122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47116 ) ( ON ?auto_47117 ?auto_47116 ) ( not ( = ?auto_47116 ?auto_47117 ) ) ( not ( = ?auto_47116 ?auto_47118 ) ) ( not ( = ?auto_47116 ?auto_47119 ) ) ( not ( = ?auto_47116 ?auto_47120 ) ) ( not ( = ?auto_47116 ?auto_47121 ) ) ( not ( = ?auto_47117 ?auto_47118 ) ) ( not ( = ?auto_47117 ?auto_47119 ) ) ( not ( = ?auto_47117 ?auto_47120 ) ) ( not ( = ?auto_47117 ?auto_47121 ) ) ( not ( = ?auto_47118 ?auto_47119 ) ) ( not ( = ?auto_47118 ?auto_47120 ) ) ( not ( = ?auto_47118 ?auto_47121 ) ) ( not ( = ?auto_47119 ?auto_47120 ) ) ( not ( = ?auto_47119 ?auto_47121 ) ) ( not ( = ?auto_47120 ?auto_47121 ) ) ( ON ?auto_47121 ?auto_47122 ) ( not ( = ?auto_47116 ?auto_47122 ) ) ( not ( = ?auto_47117 ?auto_47122 ) ) ( not ( = ?auto_47118 ?auto_47122 ) ) ( not ( = ?auto_47119 ?auto_47122 ) ) ( not ( = ?auto_47120 ?auto_47122 ) ) ( not ( = ?auto_47121 ?auto_47122 ) ) ( ON ?auto_47120 ?auto_47121 ) ( ON-TABLE ?auto_47122 ) ( ON ?auto_47119 ?auto_47120 ) ( CLEAR ?auto_47117 ) ( ON ?auto_47118 ?auto_47119 ) ( CLEAR ?auto_47118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47122 ?auto_47121 ?auto_47120 ?auto_47119 )
      ( MAKE-6PILE ?auto_47116 ?auto_47117 ?auto_47118 ?auto_47119 ?auto_47120 ?auto_47121 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47123 - BLOCK
      ?auto_47124 - BLOCK
      ?auto_47125 - BLOCK
      ?auto_47126 - BLOCK
      ?auto_47127 - BLOCK
      ?auto_47128 - BLOCK
    )
    :vars
    (
      ?auto_47129 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47123 ) ( not ( = ?auto_47123 ?auto_47124 ) ) ( not ( = ?auto_47123 ?auto_47125 ) ) ( not ( = ?auto_47123 ?auto_47126 ) ) ( not ( = ?auto_47123 ?auto_47127 ) ) ( not ( = ?auto_47123 ?auto_47128 ) ) ( not ( = ?auto_47124 ?auto_47125 ) ) ( not ( = ?auto_47124 ?auto_47126 ) ) ( not ( = ?auto_47124 ?auto_47127 ) ) ( not ( = ?auto_47124 ?auto_47128 ) ) ( not ( = ?auto_47125 ?auto_47126 ) ) ( not ( = ?auto_47125 ?auto_47127 ) ) ( not ( = ?auto_47125 ?auto_47128 ) ) ( not ( = ?auto_47126 ?auto_47127 ) ) ( not ( = ?auto_47126 ?auto_47128 ) ) ( not ( = ?auto_47127 ?auto_47128 ) ) ( ON ?auto_47128 ?auto_47129 ) ( not ( = ?auto_47123 ?auto_47129 ) ) ( not ( = ?auto_47124 ?auto_47129 ) ) ( not ( = ?auto_47125 ?auto_47129 ) ) ( not ( = ?auto_47126 ?auto_47129 ) ) ( not ( = ?auto_47127 ?auto_47129 ) ) ( not ( = ?auto_47128 ?auto_47129 ) ) ( ON ?auto_47127 ?auto_47128 ) ( ON-TABLE ?auto_47129 ) ( ON ?auto_47126 ?auto_47127 ) ( ON ?auto_47125 ?auto_47126 ) ( CLEAR ?auto_47125 ) ( HOLDING ?auto_47124 ) ( CLEAR ?auto_47123 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47123 ?auto_47124 )
      ( MAKE-6PILE ?auto_47123 ?auto_47124 ?auto_47125 ?auto_47126 ?auto_47127 ?auto_47128 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47130 - BLOCK
      ?auto_47131 - BLOCK
      ?auto_47132 - BLOCK
      ?auto_47133 - BLOCK
      ?auto_47134 - BLOCK
      ?auto_47135 - BLOCK
    )
    :vars
    (
      ?auto_47136 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47130 ) ( not ( = ?auto_47130 ?auto_47131 ) ) ( not ( = ?auto_47130 ?auto_47132 ) ) ( not ( = ?auto_47130 ?auto_47133 ) ) ( not ( = ?auto_47130 ?auto_47134 ) ) ( not ( = ?auto_47130 ?auto_47135 ) ) ( not ( = ?auto_47131 ?auto_47132 ) ) ( not ( = ?auto_47131 ?auto_47133 ) ) ( not ( = ?auto_47131 ?auto_47134 ) ) ( not ( = ?auto_47131 ?auto_47135 ) ) ( not ( = ?auto_47132 ?auto_47133 ) ) ( not ( = ?auto_47132 ?auto_47134 ) ) ( not ( = ?auto_47132 ?auto_47135 ) ) ( not ( = ?auto_47133 ?auto_47134 ) ) ( not ( = ?auto_47133 ?auto_47135 ) ) ( not ( = ?auto_47134 ?auto_47135 ) ) ( ON ?auto_47135 ?auto_47136 ) ( not ( = ?auto_47130 ?auto_47136 ) ) ( not ( = ?auto_47131 ?auto_47136 ) ) ( not ( = ?auto_47132 ?auto_47136 ) ) ( not ( = ?auto_47133 ?auto_47136 ) ) ( not ( = ?auto_47134 ?auto_47136 ) ) ( not ( = ?auto_47135 ?auto_47136 ) ) ( ON ?auto_47134 ?auto_47135 ) ( ON-TABLE ?auto_47136 ) ( ON ?auto_47133 ?auto_47134 ) ( ON ?auto_47132 ?auto_47133 ) ( CLEAR ?auto_47130 ) ( ON ?auto_47131 ?auto_47132 ) ( CLEAR ?auto_47131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47136 ?auto_47135 ?auto_47134 ?auto_47133 ?auto_47132 )
      ( MAKE-6PILE ?auto_47130 ?auto_47131 ?auto_47132 ?auto_47133 ?auto_47134 ?auto_47135 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47137 - BLOCK
      ?auto_47138 - BLOCK
      ?auto_47139 - BLOCK
      ?auto_47140 - BLOCK
      ?auto_47141 - BLOCK
      ?auto_47142 - BLOCK
    )
    :vars
    (
      ?auto_47143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47137 ?auto_47138 ) ) ( not ( = ?auto_47137 ?auto_47139 ) ) ( not ( = ?auto_47137 ?auto_47140 ) ) ( not ( = ?auto_47137 ?auto_47141 ) ) ( not ( = ?auto_47137 ?auto_47142 ) ) ( not ( = ?auto_47138 ?auto_47139 ) ) ( not ( = ?auto_47138 ?auto_47140 ) ) ( not ( = ?auto_47138 ?auto_47141 ) ) ( not ( = ?auto_47138 ?auto_47142 ) ) ( not ( = ?auto_47139 ?auto_47140 ) ) ( not ( = ?auto_47139 ?auto_47141 ) ) ( not ( = ?auto_47139 ?auto_47142 ) ) ( not ( = ?auto_47140 ?auto_47141 ) ) ( not ( = ?auto_47140 ?auto_47142 ) ) ( not ( = ?auto_47141 ?auto_47142 ) ) ( ON ?auto_47142 ?auto_47143 ) ( not ( = ?auto_47137 ?auto_47143 ) ) ( not ( = ?auto_47138 ?auto_47143 ) ) ( not ( = ?auto_47139 ?auto_47143 ) ) ( not ( = ?auto_47140 ?auto_47143 ) ) ( not ( = ?auto_47141 ?auto_47143 ) ) ( not ( = ?auto_47142 ?auto_47143 ) ) ( ON ?auto_47141 ?auto_47142 ) ( ON-TABLE ?auto_47143 ) ( ON ?auto_47140 ?auto_47141 ) ( ON ?auto_47139 ?auto_47140 ) ( ON ?auto_47138 ?auto_47139 ) ( CLEAR ?auto_47138 ) ( HOLDING ?auto_47137 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47137 )
      ( MAKE-6PILE ?auto_47137 ?auto_47138 ?auto_47139 ?auto_47140 ?auto_47141 ?auto_47142 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_47144 - BLOCK
      ?auto_47145 - BLOCK
      ?auto_47146 - BLOCK
      ?auto_47147 - BLOCK
      ?auto_47148 - BLOCK
      ?auto_47149 - BLOCK
    )
    :vars
    (
      ?auto_47150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47144 ?auto_47145 ) ) ( not ( = ?auto_47144 ?auto_47146 ) ) ( not ( = ?auto_47144 ?auto_47147 ) ) ( not ( = ?auto_47144 ?auto_47148 ) ) ( not ( = ?auto_47144 ?auto_47149 ) ) ( not ( = ?auto_47145 ?auto_47146 ) ) ( not ( = ?auto_47145 ?auto_47147 ) ) ( not ( = ?auto_47145 ?auto_47148 ) ) ( not ( = ?auto_47145 ?auto_47149 ) ) ( not ( = ?auto_47146 ?auto_47147 ) ) ( not ( = ?auto_47146 ?auto_47148 ) ) ( not ( = ?auto_47146 ?auto_47149 ) ) ( not ( = ?auto_47147 ?auto_47148 ) ) ( not ( = ?auto_47147 ?auto_47149 ) ) ( not ( = ?auto_47148 ?auto_47149 ) ) ( ON ?auto_47149 ?auto_47150 ) ( not ( = ?auto_47144 ?auto_47150 ) ) ( not ( = ?auto_47145 ?auto_47150 ) ) ( not ( = ?auto_47146 ?auto_47150 ) ) ( not ( = ?auto_47147 ?auto_47150 ) ) ( not ( = ?auto_47148 ?auto_47150 ) ) ( not ( = ?auto_47149 ?auto_47150 ) ) ( ON ?auto_47148 ?auto_47149 ) ( ON-TABLE ?auto_47150 ) ( ON ?auto_47147 ?auto_47148 ) ( ON ?auto_47146 ?auto_47147 ) ( ON ?auto_47145 ?auto_47146 ) ( ON ?auto_47144 ?auto_47145 ) ( CLEAR ?auto_47144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47150 ?auto_47149 ?auto_47148 ?auto_47147 ?auto_47146 ?auto_47145 )
      ( MAKE-6PILE ?auto_47144 ?auto_47145 ?auto_47146 ?auto_47147 ?auto_47148 ?auto_47149 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47156 - BLOCK
      ?auto_47157 - BLOCK
      ?auto_47158 - BLOCK
      ?auto_47159 - BLOCK
      ?auto_47160 - BLOCK
    )
    :vars
    (
      ?auto_47161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47161 ?auto_47160 ) ( CLEAR ?auto_47161 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47156 ) ( ON ?auto_47157 ?auto_47156 ) ( ON ?auto_47158 ?auto_47157 ) ( ON ?auto_47159 ?auto_47158 ) ( ON ?auto_47160 ?auto_47159 ) ( not ( = ?auto_47156 ?auto_47157 ) ) ( not ( = ?auto_47156 ?auto_47158 ) ) ( not ( = ?auto_47156 ?auto_47159 ) ) ( not ( = ?auto_47156 ?auto_47160 ) ) ( not ( = ?auto_47156 ?auto_47161 ) ) ( not ( = ?auto_47157 ?auto_47158 ) ) ( not ( = ?auto_47157 ?auto_47159 ) ) ( not ( = ?auto_47157 ?auto_47160 ) ) ( not ( = ?auto_47157 ?auto_47161 ) ) ( not ( = ?auto_47158 ?auto_47159 ) ) ( not ( = ?auto_47158 ?auto_47160 ) ) ( not ( = ?auto_47158 ?auto_47161 ) ) ( not ( = ?auto_47159 ?auto_47160 ) ) ( not ( = ?auto_47159 ?auto_47161 ) ) ( not ( = ?auto_47160 ?auto_47161 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47161 ?auto_47160 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47175 - BLOCK
      ?auto_47176 - BLOCK
      ?auto_47177 - BLOCK
      ?auto_47178 - BLOCK
      ?auto_47179 - BLOCK
    )
    :vars
    (
      ?auto_47180 - BLOCK
      ?auto_47181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47175 ) ( ON ?auto_47176 ?auto_47175 ) ( ON ?auto_47177 ?auto_47176 ) ( ON ?auto_47178 ?auto_47177 ) ( not ( = ?auto_47175 ?auto_47176 ) ) ( not ( = ?auto_47175 ?auto_47177 ) ) ( not ( = ?auto_47175 ?auto_47178 ) ) ( not ( = ?auto_47175 ?auto_47179 ) ) ( not ( = ?auto_47175 ?auto_47180 ) ) ( not ( = ?auto_47176 ?auto_47177 ) ) ( not ( = ?auto_47176 ?auto_47178 ) ) ( not ( = ?auto_47176 ?auto_47179 ) ) ( not ( = ?auto_47176 ?auto_47180 ) ) ( not ( = ?auto_47177 ?auto_47178 ) ) ( not ( = ?auto_47177 ?auto_47179 ) ) ( not ( = ?auto_47177 ?auto_47180 ) ) ( not ( = ?auto_47178 ?auto_47179 ) ) ( not ( = ?auto_47178 ?auto_47180 ) ) ( not ( = ?auto_47179 ?auto_47180 ) ) ( ON ?auto_47180 ?auto_47181 ) ( CLEAR ?auto_47180 ) ( not ( = ?auto_47175 ?auto_47181 ) ) ( not ( = ?auto_47176 ?auto_47181 ) ) ( not ( = ?auto_47177 ?auto_47181 ) ) ( not ( = ?auto_47178 ?auto_47181 ) ) ( not ( = ?auto_47179 ?auto_47181 ) ) ( not ( = ?auto_47180 ?auto_47181 ) ) ( HOLDING ?auto_47179 ) ( CLEAR ?auto_47178 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47175 ?auto_47176 ?auto_47177 ?auto_47178 ?auto_47179 ?auto_47180 )
      ( MAKE-5PILE ?auto_47175 ?auto_47176 ?auto_47177 ?auto_47178 ?auto_47179 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47182 - BLOCK
      ?auto_47183 - BLOCK
      ?auto_47184 - BLOCK
      ?auto_47185 - BLOCK
      ?auto_47186 - BLOCK
    )
    :vars
    (
      ?auto_47188 - BLOCK
      ?auto_47187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47182 ) ( ON ?auto_47183 ?auto_47182 ) ( ON ?auto_47184 ?auto_47183 ) ( ON ?auto_47185 ?auto_47184 ) ( not ( = ?auto_47182 ?auto_47183 ) ) ( not ( = ?auto_47182 ?auto_47184 ) ) ( not ( = ?auto_47182 ?auto_47185 ) ) ( not ( = ?auto_47182 ?auto_47186 ) ) ( not ( = ?auto_47182 ?auto_47188 ) ) ( not ( = ?auto_47183 ?auto_47184 ) ) ( not ( = ?auto_47183 ?auto_47185 ) ) ( not ( = ?auto_47183 ?auto_47186 ) ) ( not ( = ?auto_47183 ?auto_47188 ) ) ( not ( = ?auto_47184 ?auto_47185 ) ) ( not ( = ?auto_47184 ?auto_47186 ) ) ( not ( = ?auto_47184 ?auto_47188 ) ) ( not ( = ?auto_47185 ?auto_47186 ) ) ( not ( = ?auto_47185 ?auto_47188 ) ) ( not ( = ?auto_47186 ?auto_47188 ) ) ( ON ?auto_47188 ?auto_47187 ) ( not ( = ?auto_47182 ?auto_47187 ) ) ( not ( = ?auto_47183 ?auto_47187 ) ) ( not ( = ?auto_47184 ?auto_47187 ) ) ( not ( = ?auto_47185 ?auto_47187 ) ) ( not ( = ?auto_47186 ?auto_47187 ) ) ( not ( = ?auto_47188 ?auto_47187 ) ) ( CLEAR ?auto_47185 ) ( ON ?auto_47186 ?auto_47188 ) ( CLEAR ?auto_47186 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47187 ?auto_47188 )
      ( MAKE-5PILE ?auto_47182 ?auto_47183 ?auto_47184 ?auto_47185 ?auto_47186 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47189 - BLOCK
      ?auto_47190 - BLOCK
      ?auto_47191 - BLOCK
      ?auto_47192 - BLOCK
      ?auto_47193 - BLOCK
    )
    :vars
    (
      ?auto_47195 - BLOCK
      ?auto_47194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47189 ) ( ON ?auto_47190 ?auto_47189 ) ( ON ?auto_47191 ?auto_47190 ) ( not ( = ?auto_47189 ?auto_47190 ) ) ( not ( = ?auto_47189 ?auto_47191 ) ) ( not ( = ?auto_47189 ?auto_47192 ) ) ( not ( = ?auto_47189 ?auto_47193 ) ) ( not ( = ?auto_47189 ?auto_47195 ) ) ( not ( = ?auto_47190 ?auto_47191 ) ) ( not ( = ?auto_47190 ?auto_47192 ) ) ( not ( = ?auto_47190 ?auto_47193 ) ) ( not ( = ?auto_47190 ?auto_47195 ) ) ( not ( = ?auto_47191 ?auto_47192 ) ) ( not ( = ?auto_47191 ?auto_47193 ) ) ( not ( = ?auto_47191 ?auto_47195 ) ) ( not ( = ?auto_47192 ?auto_47193 ) ) ( not ( = ?auto_47192 ?auto_47195 ) ) ( not ( = ?auto_47193 ?auto_47195 ) ) ( ON ?auto_47195 ?auto_47194 ) ( not ( = ?auto_47189 ?auto_47194 ) ) ( not ( = ?auto_47190 ?auto_47194 ) ) ( not ( = ?auto_47191 ?auto_47194 ) ) ( not ( = ?auto_47192 ?auto_47194 ) ) ( not ( = ?auto_47193 ?auto_47194 ) ) ( not ( = ?auto_47195 ?auto_47194 ) ) ( ON ?auto_47193 ?auto_47195 ) ( CLEAR ?auto_47193 ) ( ON-TABLE ?auto_47194 ) ( HOLDING ?auto_47192 ) ( CLEAR ?auto_47191 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47189 ?auto_47190 ?auto_47191 ?auto_47192 )
      ( MAKE-5PILE ?auto_47189 ?auto_47190 ?auto_47191 ?auto_47192 ?auto_47193 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47196 - BLOCK
      ?auto_47197 - BLOCK
      ?auto_47198 - BLOCK
      ?auto_47199 - BLOCK
      ?auto_47200 - BLOCK
    )
    :vars
    (
      ?auto_47202 - BLOCK
      ?auto_47201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47196 ) ( ON ?auto_47197 ?auto_47196 ) ( ON ?auto_47198 ?auto_47197 ) ( not ( = ?auto_47196 ?auto_47197 ) ) ( not ( = ?auto_47196 ?auto_47198 ) ) ( not ( = ?auto_47196 ?auto_47199 ) ) ( not ( = ?auto_47196 ?auto_47200 ) ) ( not ( = ?auto_47196 ?auto_47202 ) ) ( not ( = ?auto_47197 ?auto_47198 ) ) ( not ( = ?auto_47197 ?auto_47199 ) ) ( not ( = ?auto_47197 ?auto_47200 ) ) ( not ( = ?auto_47197 ?auto_47202 ) ) ( not ( = ?auto_47198 ?auto_47199 ) ) ( not ( = ?auto_47198 ?auto_47200 ) ) ( not ( = ?auto_47198 ?auto_47202 ) ) ( not ( = ?auto_47199 ?auto_47200 ) ) ( not ( = ?auto_47199 ?auto_47202 ) ) ( not ( = ?auto_47200 ?auto_47202 ) ) ( ON ?auto_47202 ?auto_47201 ) ( not ( = ?auto_47196 ?auto_47201 ) ) ( not ( = ?auto_47197 ?auto_47201 ) ) ( not ( = ?auto_47198 ?auto_47201 ) ) ( not ( = ?auto_47199 ?auto_47201 ) ) ( not ( = ?auto_47200 ?auto_47201 ) ) ( not ( = ?auto_47202 ?auto_47201 ) ) ( ON ?auto_47200 ?auto_47202 ) ( ON-TABLE ?auto_47201 ) ( CLEAR ?auto_47198 ) ( ON ?auto_47199 ?auto_47200 ) ( CLEAR ?auto_47199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47201 ?auto_47202 ?auto_47200 )
      ( MAKE-5PILE ?auto_47196 ?auto_47197 ?auto_47198 ?auto_47199 ?auto_47200 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47203 - BLOCK
      ?auto_47204 - BLOCK
      ?auto_47205 - BLOCK
      ?auto_47206 - BLOCK
      ?auto_47207 - BLOCK
    )
    :vars
    (
      ?auto_47209 - BLOCK
      ?auto_47208 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47203 ) ( ON ?auto_47204 ?auto_47203 ) ( not ( = ?auto_47203 ?auto_47204 ) ) ( not ( = ?auto_47203 ?auto_47205 ) ) ( not ( = ?auto_47203 ?auto_47206 ) ) ( not ( = ?auto_47203 ?auto_47207 ) ) ( not ( = ?auto_47203 ?auto_47209 ) ) ( not ( = ?auto_47204 ?auto_47205 ) ) ( not ( = ?auto_47204 ?auto_47206 ) ) ( not ( = ?auto_47204 ?auto_47207 ) ) ( not ( = ?auto_47204 ?auto_47209 ) ) ( not ( = ?auto_47205 ?auto_47206 ) ) ( not ( = ?auto_47205 ?auto_47207 ) ) ( not ( = ?auto_47205 ?auto_47209 ) ) ( not ( = ?auto_47206 ?auto_47207 ) ) ( not ( = ?auto_47206 ?auto_47209 ) ) ( not ( = ?auto_47207 ?auto_47209 ) ) ( ON ?auto_47209 ?auto_47208 ) ( not ( = ?auto_47203 ?auto_47208 ) ) ( not ( = ?auto_47204 ?auto_47208 ) ) ( not ( = ?auto_47205 ?auto_47208 ) ) ( not ( = ?auto_47206 ?auto_47208 ) ) ( not ( = ?auto_47207 ?auto_47208 ) ) ( not ( = ?auto_47209 ?auto_47208 ) ) ( ON ?auto_47207 ?auto_47209 ) ( ON-TABLE ?auto_47208 ) ( ON ?auto_47206 ?auto_47207 ) ( CLEAR ?auto_47206 ) ( HOLDING ?auto_47205 ) ( CLEAR ?auto_47204 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47203 ?auto_47204 ?auto_47205 )
      ( MAKE-5PILE ?auto_47203 ?auto_47204 ?auto_47205 ?auto_47206 ?auto_47207 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47210 - BLOCK
      ?auto_47211 - BLOCK
      ?auto_47212 - BLOCK
      ?auto_47213 - BLOCK
      ?auto_47214 - BLOCK
    )
    :vars
    (
      ?auto_47215 - BLOCK
      ?auto_47216 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47210 ) ( ON ?auto_47211 ?auto_47210 ) ( not ( = ?auto_47210 ?auto_47211 ) ) ( not ( = ?auto_47210 ?auto_47212 ) ) ( not ( = ?auto_47210 ?auto_47213 ) ) ( not ( = ?auto_47210 ?auto_47214 ) ) ( not ( = ?auto_47210 ?auto_47215 ) ) ( not ( = ?auto_47211 ?auto_47212 ) ) ( not ( = ?auto_47211 ?auto_47213 ) ) ( not ( = ?auto_47211 ?auto_47214 ) ) ( not ( = ?auto_47211 ?auto_47215 ) ) ( not ( = ?auto_47212 ?auto_47213 ) ) ( not ( = ?auto_47212 ?auto_47214 ) ) ( not ( = ?auto_47212 ?auto_47215 ) ) ( not ( = ?auto_47213 ?auto_47214 ) ) ( not ( = ?auto_47213 ?auto_47215 ) ) ( not ( = ?auto_47214 ?auto_47215 ) ) ( ON ?auto_47215 ?auto_47216 ) ( not ( = ?auto_47210 ?auto_47216 ) ) ( not ( = ?auto_47211 ?auto_47216 ) ) ( not ( = ?auto_47212 ?auto_47216 ) ) ( not ( = ?auto_47213 ?auto_47216 ) ) ( not ( = ?auto_47214 ?auto_47216 ) ) ( not ( = ?auto_47215 ?auto_47216 ) ) ( ON ?auto_47214 ?auto_47215 ) ( ON-TABLE ?auto_47216 ) ( ON ?auto_47213 ?auto_47214 ) ( CLEAR ?auto_47211 ) ( ON ?auto_47212 ?auto_47213 ) ( CLEAR ?auto_47212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47216 ?auto_47215 ?auto_47214 ?auto_47213 )
      ( MAKE-5PILE ?auto_47210 ?auto_47211 ?auto_47212 ?auto_47213 ?auto_47214 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47217 - BLOCK
      ?auto_47218 - BLOCK
      ?auto_47219 - BLOCK
      ?auto_47220 - BLOCK
      ?auto_47221 - BLOCK
    )
    :vars
    (
      ?auto_47223 - BLOCK
      ?auto_47222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47217 ) ( not ( = ?auto_47217 ?auto_47218 ) ) ( not ( = ?auto_47217 ?auto_47219 ) ) ( not ( = ?auto_47217 ?auto_47220 ) ) ( not ( = ?auto_47217 ?auto_47221 ) ) ( not ( = ?auto_47217 ?auto_47223 ) ) ( not ( = ?auto_47218 ?auto_47219 ) ) ( not ( = ?auto_47218 ?auto_47220 ) ) ( not ( = ?auto_47218 ?auto_47221 ) ) ( not ( = ?auto_47218 ?auto_47223 ) ) ( not ( = ?auto_47219 ?auto_47220 ) ) ( not ( = ?auto_47219 ?auto_47221 ) ) ( not ( = ?auto_47219 ?auto_47223 ) ) ( not ( = ?auto_47220 ?auto_47221 ) ) ( not ( = ?auto_47220 ?auto_47223 ) ) ( not ( = ?auto_47221 ?auto_47223 ) ) ( ON ?auto_47223 ?auto_47222 ) ( not ( = ?auto_47217 ?auto_47222 ) ) ( not ( = ?auto_47218 ?auto_47222 ) ) ( not ( = ?auto_47219 ?auto_47222 ) ) ( not ( = ?auto_47220 ?auto_47222 ) ) ( not ( = ?auto_47221 ?auto_47222 ) ) ( not ( = ?auto_47223 ?auto_47222 ) ) ( ON ?auto_47221 ?auto_47223 ) ( ON-TABLE ?auto_47222 ) ( ON ?auto_47220 ?auto_47221 ) ( ON ?auto_47219 ?auto_47220 ) ( CLEAR ?auto_47219 ) ( HOLDING ?auto_47218 ) ( CLEAR ?auto_47217 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47217 ?auto_47218 )
      ( MAKE-5PILE ?auto_47217 ?auto_47218 ?auto_47219 ?auto_47220 ?auto_47221 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47224 - BLOCK
      ?auto_47225 - BLOCK
      ?auto_47226 - BLOCK
      ?auto_47227 - BLOCK
      ?auto_47228 - BLOCK
    )
    :vars
    (
      ?auto_47229 - BLOCK
      ?auto_47230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47224 ) ( not ( = ?auto_47224 ?auto_47225 ) ) ( not ( = ?auto_47224 ?auto_47226 ) ) ( not ( = ?auto_47224 ?auto_47227 ) ) ( not ( = ?auto_47224 ?auto_47228 ) ) ( not ( = ?auto_47224 ?auto_47229 ) ) ( not ( = ?auto_47225 ?auto_47226 ) ) ( not ( = ?auto_47225 ?auto_47227 ) ) ( not ( = ?auto_47225 ?auto_47228 ) ) ( not ( = ?auto_47225 ?auto_47229 ) ) ( not ( = ?auto_47226 ?auto_47227 ) ) ( not ( = ?auto_47226 ?auto_47228 ) ) ( not ( = ?auto_47226 ?auto_47229 ) ) ( not ( = ?auto_47227 ?auto_47228 ) ) ( not ( = ?auto_47227 ?auto_47229 ) ) ( not ( = ?auto_47228 ?auto_47229 ) ) ( ON ?auto_47229 ?auto_47230 ) ( not ( = ?auto_47224 ?auto_47230 ) ) ( not ( = ?auto_47225 ?auto_47230 ) ) ( not ( = ?auto_47226 ?auto_47230 ) ) ( not ( = ?auto_47227 ?auto_47230 ) ) ( not ( = ?auto_47228 ?auto_47230 ) ) ( not ( = ?auto_47229 ?auto_47230 ) ) ( ON ?auto_47228 ?auto_47229 ) ( ON-TABLE ?auto_47230 ) ( ON ?auto_47227 ?auto_47228 ) ( ON ?auto_47226 ?auto_47227 ) ( CLEAR ?auto_47224 ) ( ON ?auto_47225 ?auto_47226 ) ( CLEAR ?auto_47225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47230 ?auto_47229 ?auto_47228 ?auto_47227 ?auto_47226 )
      ( MAKE-5PILE ?auto_47224 ?auto_47225 ?auto_47226 ?auto_47227 ?auto_47228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47231 - BLOCK
      ?auto_47232 - BLOCK
      ?auto_47233 - BLOCK
      ?auto_47234 - BLOCK
      ?auto_47235 - BLOCK
    )
    :vars
    (
      ?auto_47236 - BLOCK
      ?auto_47237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47231 ?auto_47232 ) ) ( not ( = ?auto_47231 ?auto_47233 ) ) ( not ( = ?auto_47231 ?auto_47234 ) ) ( not ( = ?auto_47231 ?auto_47235 ) ) ( not ( = ?auto_47231 ?auto_47236 ) ) ( not ( = ?auto_47232 ?auto_47233 ) ) ( not ( = ?auto_47232 ?auto_47234 ) ) ( not ( = ?auto_47232 ?auto_47235 ) ) ( not ( = ?auto_47232 ?auto_47236 ) ) ( not ( = ?auto_47233 ?auto_47234 ) ) ( not ( = ?auto_47233 ?auto_47235 ) ) ( not ( = ?auto_47233 ?auto_47236 ) ) ( not ( = ?auto_47234 ?auto_47235 ) ) ( not ( = ?auto_47234 ?auto_47236 ) ) ( not ( = ?auto_47235 ?auto_47236 ) ) ( ON ?auto_47236 ?auto_47237 ) ( not ( = ?auto_47231 ?auto_47237 ) ) ( not ( = ?auto_47232 ?auto_47237 ) ) ( not ( = ?auto_47233 ?auto_47237 ) ) ( not ( = ?auto_47234 ?auto_47237 ) ) ( not ( = ?auto_47235 ?auto_47237 ) ) ( not ( = ?auto_47236 ?auto_47237 ) ) ( ON ?auto_47235 ?auto_47236 ) ( ON-TABLE ?auto_47237 ) ( ON ?auto_47234 ?auto_47235 ) ( ON ?auto_47233 ?auto_47234 ) ( ON ?auto_47232 ?auto_47233 ) ( CLEAR ?auto_47232 ) ( HOLDING ?auto_47231 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47231 )
      ( MAKE-5PILE ?auto_47231 ?auto_47232 ?auto_47233 ?auto_47234 ?auto_47235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_47238 - BLOCK
      ?auto_47239 - BLOCK
      ?auto_47240 - BLOCK
      ?auto_47241 - BLOCK
      ?auto_47242 - BLOCK
    )
    :vars
    (
      ?auto_47243 - BLOCK
      ?auto_47244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47238 ?auto_47239 ) ) ( not ( = ?auto_47238 ?auto_47240 ) ) ( not ( = ?auto_47238 ?auto_47241 ) ) ( not ( = ?auto_47238 ?auto_47242 ) ) ( not ( = ?auto_47238 ?auto_47243 ) ) ( not ( = ?auto_47239 ?auto_47240 ) ) ( not ( = ?auto_47239 ?auto_47241 ) ) ( not ( = ?auto_47239 ?auto_47242 ) ) ( not ( = ?auto_47239 ?auto_47243 ) ) ( not ( = ?auto_47240 ?auto_47241 ) ) ( not ( = ?auto_47240 ?auto_47242 ) ) ( not ( = ?auto_47240 ?auto_47243 ) ) ( not ( = ?auto_47241 ?auto_47242 ) ) ( not ( = ?auto_47241 ?auto_47243 ) ) ( not ( = ?auto_47242 ?auto_47243 ) ) ( ON ?auto_47243 ?auto_47244 ) ( not ( = ?auto_47238 ?auto_47244 ) ) ( not ( = ?auto_47239 ?auto_47244 ) ) ( not ( = ?auto_47240 ?auto_47244 ) ) ( not ( = ?auto_47241 ?auto_47244 ) ) ( not ( = ?auto_47242 ?auto_47244 ) ) ( not ( = ?auto_47243 ?auto_47244 ) ) ( ON ?auto_47242 ?auto_47243 ) ( ON-TABLE ?auto_47244 ) ( ON ?auto_47241 ?auto_47242 ) ( ON ?auto_47240 ?auto_47241 ) ( ON ?auto_47239 ?auto_47240 ) ( ON ?auto_47238 ?auto_47239 ) ( CLEAR ?auto_47238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47244 ?auto_47243 ?auto_47242 ?auto_47241 ?auto_47240 ?auto_47239 )
      ( MAKE-5PILE ?auto_47238 ?auto_47239 ?auto_47240 ?auto_47241 ?auto_47242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47246 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47246 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_47246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47247 - BLOCK
    )
    :vars
    (
      ?auto_47248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47247 ?auto_47248 ) ( CLEAR ?auto_47247 ) ( HAND-EMPTY ) ( not ( = ?auto_47247 ?auto_47248 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47247 ?auto_47248 )
      ( MAKE-1PILE ?auto_47247 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47249 - BLOCK
    )
    :vars
    (
      ?auto_47250 - BLOCK
      ?auto_47252 - BLOCK
      ?auto_47253 - BLOCK
      ?auto_47251 - BLOCK
      ?auto_47254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47249 ?auto_47250 ) ) ( HOLDING ?auto_47249 ) ( CLEAR ?auto_47250 ) ( ON-TABLE ?auto_47252 ) ( ON ?auto_47253 ?auto_47252 ) ( ON ?auto_47251 ?auto_47253 ) ( ON ?auto_47254 ?auto_47251 ) ( ON ?auto_47250 ?auto_47254 ) ( not ( = ?auto_47252 ?auto_47253 ) ) ( not ( = ?auto_47252 ?auto_47251 ) ) ( not ( = ?auto_47252 ?auto_47254 ) ) ( not ( = ?auto_47252 ?auto_47250 ) ) ( not ( = ?auto_47252 ?auto_47249 ) ) ( not ( = ?auto_47253 ?auto_47251 ) ) ( not ( = ?auto_47253 ?auto_47254 ) ) ( not ( = ?auto_47253 ?auto_47250 ) ) ( not ( = ?auto_47253 ?auto_47249 ) ) ( not ( = ?auto_47251 ?auto_47254 ) ) ( not ( = ?auto_47251 ?auto_47250 ) ) ( not ( = ?auto_47251 ?auto_47249 ) ) ( not ( = ?auto_47254 ?auto_47250 ) ) ( not ( = ?auto_47254 ?auto_47249 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47252 ?auto_47253 ?auto_47251 ?auto_47254 ?auto_47250 ?auto_47249 )
      ( MAKE-1PILE ?auto_47249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47255 - BLOCK
    )
    :vars
    (
      ?auto_47256 - BLOCK
      ?auto_47258 - BLOCK
      ?auto_47257 - BLOCK
      ?auto_47260 - BLOCK
      ?auto_47259 - BLOCK
      ?auto_47261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47255 ?auto_47256 ) ) ( CLEAR ?auto_47256 ) ( ON-TABLE ?auto_47258 ) ( ON ?auto_47257 ?auto_47258 ) ( ON ?auto_47260 ?auto_47257 ) ( ON ?auto_47259 ?auto_47260 ) ( ON ?auto_47256 ?auto_47259 ) ( not ( = ?auto_47258 ?auto_47257 ) ) ( not ( = ?auto_47258 ?auto_47260 ) ) ( not ( = ?auto_47258 ?auto_47259 ) ) ( not ( = ?auto_47258 ?auto_47256 ) ) ( not ( = ?auto_47258 ?auto_47255 ) ) ( not ( = ?auto_47257 ?auto_47260 ) ) ( not ( = ?auto_47257 ?auto_47259 ) ) ( not ( = ?auto_47257 ?auto_47256 ) ) ( not ( = ?auto_47257 ?auto_47255 ) ) ( not ( = ?auto_47260 ?auto_47259 ) ) ( not ( = ?auto_47260 ?auto_47256 ) ) ( not ( = ?auto_47260 ?auto_47255 ) ) ( not ( = ?auto_47259 ?auto_47256 ) ) ( not ( = ?auto_47259 ?auto_47255 ) ) ( ON ?auto_47255 ?auto_47261 ) ( CLEAR ?auto_47255 ) ( HAND-EMPTY ) ( not ( = ?auto_47255 ?auto_47261 ) ) ( not ( = ?auto_47256 ?auto_47261 ) ) ( not ( = ?auto_47258 ?auto_47261 ) ) ( not ( = ?auto_47257 ?auto_47261 ) ) ( not ( = ?auto_47260 ?auto_47261 ) ) ( not ( = ?auto_47259 ?auto_47261 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47255 ?auto_47261 )
      ( MAKE-1PILE ?auto_47255 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47262 - BLOCK
    )
    :vars
    (
      ?auto_47267 - BLOCK
      ?auto_47265 - BLOCK
      ?auto_47264 - BLOCK
      ?auto_47268 - BLOCK
      ?auto_47266 - BLOCK
      ?auto_47263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47262 ?auto_47267 ) ) ( ON-TABLE ?auto_47265 ) ( ON ?auto_47264 ?auto_47265 ) ( ON ?auto_47268 ?auto_47264 ) ( ON ?auto_47266 ?auto_47268 ) ( not ( = ?auto_47265 ?auto_47264 ) ) ( not ( = ?auto_47265 ?auto_47268 ) ) ( not ( = ?auto_47265 ?auto_47266 ) ) ( not ( = ?auto_47265 ?auto_47267 ) ) ( not ( = ?auto_47265 ?auto_47262 ) ) ( not ( = ?auto_47264 ?auto_47268 ) ) ( not ( = ?auto_47264 ?auto_47266 ) ) ( not ( = ?auto_47264 ?auto_47267 ) ) ( not ( = ?auto_47264 ?auto_47262 ) ) ( not ( = ?auto_47268 ?auto_47266 ) ) ( not ( = ?auto_47268 ?auto_47267 ) ) ( not ( = ?auto_47268 ?auto_47262 ) ) ( not ( = ?auto_47266 ?auto_47267 ) ) ( not ( = ?auto_47266 ?auto_47262 ) ) ( ON ?auto_47262 ?auto_47263 ) ( CLEAR ?auto_47262 ) ( not ( = ?auto_47262 ?auto_47263 ) ) ( not ( = ?auto_47267 ?auto_47263 ) ) ( not ( = ?auto_47265 ?auto_47263 ) ) ( not ( = ?auto_47264 ?auto_47263 ) ) ( not ( = ?auto_47268 ?auto_47263 ) ) ( not ( = ?auto_47266 ?auto_47263 ) ) ( HOLDING ?auto_47267 ) ( CLEAR ?auto_47266 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47265 ?auto_47264 ?auto_47268 ?auto_47266 ?auto_47267 )
      ( MAKE-1PILE ?auto_47262 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47269 - BLOCK
    )
    :vars
    (
      ?auto_47273 - BLOCK
      ?auto_47272 - BLOCK
      ?auto_47271 - BLOCK
      ?auto_47270 - BLOCK
      ?auto_47274 - BLOCK
      ?auto_47275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47269 ?auto_47273 ) ) ( ON-TABLE ?auto_47272 ) ( ON ?auto_47271 ?auto_47272 ) ( ON ?auto_47270 ?auto_47271 ) ( ON ?auto_47274 ?auto_47270 ) ( not ( = ?auto_47272 ?auto_47271 ) ) ( not ( = ?auto_47272 ?auto_47270 ) ) ( not ( = ?auto_47272 ?auto_47274 ) ) ( not ( = ?auto_47272 ?auto_47273 ) ) ( not ( = ?auto_47272 ?auto_47269 ) ) ( not ( = ?auto_47271 ?auto_47270 ) ) ( not ( = ?auto_47271 ?auto_47274 ) ) ( not ( = ?auto_47271 ?auto_47273 ) ) ( not ( = ?auto_47271 ?auto_47269 ) ) ( not ( = ?auto_47270 ?auto_47274 ) ) ( not ( = ?auto_47270 ?auto_47273 ) ) ( not ( = ?auto_47270 ?auto_47269 ) ) ( not ( = ?auto_47274 ?auto_47273 ) ) ( not ( = ?auto_47274 ?auto_47269 ) ) ( ON ?auto_47269 ?auto_47275 ) ( not ( = ?auto_47269 ?auto_47275 ) ) ( not ( = ?auto_47273 ?auto_47275 ) ) ( not ( = ?auto_47272 ?auto_47275 ) ) ( not ( = ?auto_47271 ?auto_47275 ) ) ( not ( = ?auto_47270 ?auto_47275 ) ) ( not ( = ?auto_47274 ?auto_47275 ) ) ( CLEAR ?auto_47274 ) ( ON ?auto_47273 ?auto_47269 ) ( CLEAR ?auto_47273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47275 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47275 ?auto_47269 )
      ( MAKE-1PILE ?auto_47269 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47276 - BLOCK
    )
    :vars
    (
      ?auto_47281 - BLOCK
      ?auto_47280 - BLOCK
      ?auto_47279 - BLOCK
      ?auto_47282 - BLOCK
      ?auto_47277 - BLOCK
      ?auto_47278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47276 ?auto_47281 ) ) ( ON-TABLE ?auto_47280 ) ( ON ?auto_47279 ?auto_47280 ) ( ON ?auto_47282 ?auto_47279 ) ( not ( = ?auto_47280 ?auto_47279 ) ) ( not ( = ?auto_47280 ?auto_47282 ) ) ( not ( = ?auto_47280 ?auto_47277 ) ) ( not ( = ?auto_47280 ?auto_47281 ) ) ( not ( = ?auto_47280 ?auto_47276 ) ) ( not ( = ?auto_47279 ?auto_47282 ) ) ( not ( = ?auto_47279 ?auto_47277 ) ) ( not ( = ?auto_47279 ?auto_47281 ) ) ( not ( = ?auto_47279 ?auto_47276 ) ) ( not ( = ?auto_47282 ?auto_47277 ) ) ( not ( = ?auto_47282 ?auto_47281 ) ) ( not ( = ?auto_47282 ?auto_47276 ) ) ( not ( = ?auto_47277 ?auto_47281 ) ) ( not ( = ?auto_47277 ?auto_47276 ) ) ( ON ?auto_47276 ?auto_47278 ) ( not ( = ?auto_47276 ?auto_47278 ) ) ( not ( = ?auto_47281 ?auto_47278 ) ) ( not ( = ?auto_47280 ?auto_47278 ) ) ( not ( = ?auto_47279 ?auto_47278 ) ) ( not ( = ?auto_47282 ?auto_47278 ) ) ( not ( = ?auto_47277 ?auto_47278 ) ) ( ON ?auto_47281 ?auto_47276 ) ( CLEAR ?auto_47281 ) ( ON-TABLE ?auto_47278 ) ( HOLDING ?auto_47277 ) ( CLEAR ?auto_47282 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47280 ?auto_47279 ?auto_47282 ?auto_47277 )
      ( MAKE-1PILE ?auto_47276 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47283 - BLOCK
    )
    :vars
    (
      ?auto_47288 - BLOCK
      ?auto_47287 - BLOCK
      ?auto_47286 - BLOCK
      ?auto_47285 - BLOCK
      ?auto_47289 - BLOCK
      ?auto_47284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47283 ?auto_47288 ) ) ( ON-TABLE ?auto_47287 ) ( ON ?auto_47286 ?auto_47287 ) ( ON ?auto_47285 ?auto_47286 ) ( not ( = ?auto_47287 ?auto_47286 ) ) ( not ( = ?auto_47287 ?auto_47285 ) ) ( not ( = ?auto_47287 ?auto_47289 ) ) ( not ( = ?auto_47287 ?auto_47288 ) ) ( not ( = ?auto_47287 ?auto_47283 ) ) ( not ( = ?auto_47286 ?auto_47285 ) ) ( not ( = ?auto_47286 ?auto_47289 ) ) ( not ( = ?auto_47286 ?auto_47288 ) ) ( not ( = ?auto_47286 ?auto_47283 ) ) ( not ( = ?auto_47285 ?auto_47289 ) ) ( not ( = ?auto_47285 ?auto_47288 ) ) ( not ( = ?auto_47285 ?auto_47283 ) ) ( not ( = ?auto_47289 ?auto_47288 ) ) ( not ( = ?auto_47289 ?auto_47283 ) ) ( ON ?auto_47283 ?auto_47284 ) ( not ( = ?auto_47283 ?auto_47284 ) ) ( not ( = ?auto_47288 ?auto_47284 ) ) ( not ( = ?auto_47287 ?auto_47284 ) ) ( not ( = ?auto_47286 ?auto_47284 ) ) ( not ( = ?auto_47285 ?auto_47284 ) ) ( not ( = ?auto_47289 ?auto_47284 ) ) ( ON ?auto_47288 ?auto_47283 ) ( ON-TABLE ?auto_47284 ) ( CLEAR ?auto_47285 ) ( ON ?auto_47289 ?auto_47288 ) ( CLEAR ?auto_47289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47284 ?auto_47283 ?auto_47288 )
      ( MAKE-1PILE ?auto_47283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47290 - BLOCK
    )
    :vars
    (
      ?auto_47291 - BLOCK
      ?auto_47294 - BLOCK
      ?auto_47293 - BLOCK
      ?auto_47295 - BLOCK
      ?auto_47296 - BLOCK
      ?auto_47292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47290 ?auto_47291 ) ) ( ON-TABLE ?auto_47294 ) ( ON ?auto_47293 ?auto_47294 ) ( not ( = ?auto_47294 ?auto_47293 ) ) ( not ( = ?auto_47294 ?auto_47295 ) ) ( not ( = ?auto_47294 ?auto_47296 ) ) ( not ( = ?auto_47294 ?auto_47291 ) ) ( not ( = ?auto_47294 ?auto_47290 ) ) ( not ( = ?auto_47293 ?auto_47295 ) ) ( not ( = ?auto_47293 ?auto_47296 ) ) ( not ( = ?auto_47293 ?auto_47291 ) ) ( not ( = ?auto_47293 ?auto_47290 ) ) ( not ( = ?auto_47295 ?auto_47296 ) ) ( not ( = ?auto_47295 ?auto_47291 ) ) ( not ( = ?auto_47295 ?auto_47290 ) ) ( not ( = ?auto_47296 ?auto_47291 ) ) ( not ( = ?auto_47296 ?auto_47290 ) ) ( ON ?auto_47290 ?auto_47292 ) ( not ( = ?auto_47290 ?auto_47292 ) ) ( not ( = ?auto_47291 ?auto_47292 ) ) ( not ( = ?auto_47294 ?auto_47292 ) ) ( not ( = ?auto_47293 ?auto_47292 ) ) ( not ( = ?auto_47295 ?auto_47292 ) ) ( not ( = ?auto_47296 ?auto_47292 ) ) ( ON ?auto_47291 ?auto_47290 ) ( ON-TABLE ?auto_47292 ) ( ON ?auto_47296 ?auto_47291 ) ( CLEAR ?auto_47296 ) ( HOLDING ?auto_47295 ) ( CLEAR ?auto_47293 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47294 ?auto_47293 ?auto_47295 )
      ( MAKE-1PILE ?auto_47290 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47297 - BLOCK
    )
    :vars
    (
      ?auto_47298 - BLOCK
      ?auto_47299 - BLOCK
      ?auto_47301 - BLOCK
      ?auto_47300 - BLOCK
      ?auto_47302 - BLOCK
      ?auto_47303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47297 ?auto_47298 ) ) ( ON-TABLE ?auto_47299 ) ( ON ?auto_47301 ?auto_47299 ) ( not ( = ?auto_47299 ?auto_47301 ) ) ( not ( = ?auto_47299 ?auto_47300 ) ) ( not ( = ?auto_47299 ?auto_47302 ) ) ( not ( = ?auto_47299 ?auto_47298 ) ) ( not ( = ?auto_47299 ?auto_47297 ) ) ( not ( = ?auto_47301 ?auto_47300 ) ) ( not ( = ?auto_47301 ?auto_47302 ) ) ( not ( = ?auto_47301 ?auto_47298 ) ) ( not ( = ?auto_47301 ?auto_47297 ) ) ( not ( = ?auto_47300 ?auto_47302 ) ) ( not ( = ?auto_47300 ?auto_47298 ) ) ( not ( = ?auto_47300 ?auto_47297 ) ) ( not ( = ?auto_47302 ?auto_47298 ) ) ( not ( = ?auto_47302 ?auto_47297 ) ) ( ON ?auto_47297 ?auto_47303 ) ( not ( = ?auto_47297 ?auto_47303 ) ) ( not ( = ?auto_47298 ?auto_47303 ) ) ( not ( = ?auto_47299 ?auto_47303 ) ) ( not ( = ?auto_47301 ?auto_47303 ) ) ( not ( = ?auto_47300 ?auto_47303 ) ) ( not ( = ?auto_47302 ?auto_47303 ) ) ( ON ?auto_47298 ?auto_47297 ) ( ON-TABLE ?auto_47303 ) ( ON ?auto_47302 ?auto_47298 ) ( CLEAR ?auto_47301 ) ( ON ?auto_47300 ?auto_47302 ) ( CLEAR ?auto_47300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47303 ?auto_47297 ?auto_47298 ?auto_47302 )
      ( MAKE-1PILE ?auto_47297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47304 - BLOCK
    )
    :vars
    (
      ?auto_47305 - BLOCK
      ?auto_47308 - BLOCK
      ?auto_47310 - BLOCK
      ?auto_47307 - BLOCK
      ?auto_47306 - BLOCK
      ?auto_47309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47304 ?auto_47305 ) ) ( ON-TABLE ?auto_47308 ) ( not ( = ?auto_47308 ?auto_47310 ) ) ( not ( = ?auto_47308 ?auto_47307 ) ) ( not ( = ?auto_47308 ?auto_47306 ) ) ( not ( = ?auto_47308 ?auto_47305 ) ) ( not ( = ?auto_47308 ?auto_47304 ) ) ( not ( = ?auto_47310 ?auto_47307 ) ) ( not ( = ?auto_47310 ?auto_47306 ) ) ( not ( = ?auto_47310 ?auto_47305 ) ) ( not ( = ?auto_47310 ?auto_47304 ) ) ( not ( = ?auto_47307 ?auto_47306 ) ) ( not ( = ?auto_47307 ?auto_47305 ) ) ( not ( = ?auto_47307 ?auto_47304 ) ) ( not ( = ?auto_47306 ?auto_47305 ) ) ( not ( = ?auto_47306 ?auto_47304 ) ) ( ON ?auto_47304 ?auto_47309 ) ( not ( = ?auto_47304 ?auto_47309 ) ) ( not ( = ?auto_47305 ?auto_47309 ) ) ( not ( = ?auto_47308 ?auto_47309 ) ) ( not ( = ?auto_47310 ?auto_47309 ) ) ( not ( = ?auto_47307 ?auto_47309 ) ) ( not ( = ?auto_47306 ?auto_47309 ) ) ( ON ?auto_47305 ?auto_47304 ) ( ON-TABLE ?auto_47309 ) ( ON ?auto_47306 ?auto_47305 ) ( ON ?auto_47307 ?auto_47306 ) ( CLEAR ?auto_47307 ) ( HOLDING ?auto_47310 ) ( CLEAR ?auto_47308 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47308 ?auto_47310 )
      ( MAKE-1PILE ?auto_47304 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47311 - BLOCK
    )
    :vars
    (
      ?auto_47315 - BLOCK
      ?auto_47314 - BLOCK
      ?auto_47317 - BLOCK
      ?auto_47313 - BLOCK
      ?auto_47312 - BLOCK
      ?auto_47316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47311 ?auto_47315 ) ) ( ON-TABLE ?auto_47314 ) ( not ( = ?auto_47314 ?auto_47317 ) ) ( not ( = ?auto_47314 ?auto_47313 ) ) ( not ( = ?auto_47314 ?auto_47312 ) ) ( not ( = ?auto_47314 ?auto_47315 ) ) ( not ( = ?auto_47314 ?auto_47311 ) ) ( not ( = ?auto_47317 ?auto_47313 ) ) ( not ( = ?auto_47317 ?auto_47312 ) ) ( not ( = ?auto_47317 ?auto_47315 ) ) ( not ( = ?auto_47317 ?auto_47311 ) ) ( not ( = ?auto_47313 ?auto_47312 ) ) ( not ( = ?auto_47313 ?auto_47315 ) ) ( not ( = ?auto_47313 ?auto_47311 ) ) ( not ( = ?auto_47312 ?auto_47315 ) ) ( not ( = ?auto_47312 ?auto_47311 ) ) ( ON ?auto_47311 ?auto_47316 ) ( not ( = ?auto_47311 ?auto_47316 ) ) ( not ( = ?auto_47315 ?auto_47316 ) ) ( not ( = ?auto_47314 ?auto_47316 ) ) ( not ( = ?auto_47317 ?auto_47316 ) ) ( not ( = ?auto_47313 ?auto_47316 ) ) ( not ( = ?auto_47312 ?auto_47316 ) ) ( ON ?auto_47315 ?auto_47311 ) ( ON-TABLE ?auto_47316 ) ( ON ?auto_47312 ?auto_47315 ) ( ON ?auto_47313 ?auto_47312 ) ( CLEAR ?auto_47314 ) ( ON ?auto_47317 ?auto_47313 ) ( CLEAR ?auto_47317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47316 ?auto_47311 ?auto_47315 ?auto_47312 ?auto_47313 )
      ( MAKE-1PILE ?auto_47311 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47318 - BLOCK
    )
    :vars
    (
      ?auto_47321 - BLOCK
      ?auto_47323 - BLOCK
      ?auto_47320 - BLOCK
      ?auto_47322 - BLOCK
      ?auto_47319 - BLOCK
      ?auto_47324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47318 ?auto_47321 ) ) ( not ( = ?auto_47323 ?auto_47320 ) ) ( not ( = ?auto_47323 ?auto_47322 ) ) ( not ( = ?auto_47323 ?auto_47319 ) ) ( not ( = ?auto_47323 ?auto_47321 ) ) ( not ( = ?auto_47323 ?auto_47318 ) ) ( not ( = ?auto_47320 ?auto_47322 ) ) ( not ( = ?auto_47320 ?auto_47319 ) ) ( not ( = ?auto_47320 ?auto_47321 ) ) ( not ( = ?auto_47320 ?auto_47318 ) ) ( not ( = ?auto_47322 ?auto_47319 ) ) ( not ( = ?auto_47322 ?auto_47321 ) ) ( not ( = ?auto_47322 ?auto_47318 ) ) ( not ( = ?auto_47319 ?auto_47321 ) ) ( not ( = ?auto_47319 ?auto_47318 ) ) ( ON ?auto_47318 ?auto_47324 ) ( not ( = ?auto_47318 ?auto_47324 ) ) ( not ( = ?auto_47321 ?auto_47324 ) ) ( not ( = ?auto_47323 ?auto_47324 ) ) ( not ( = ?auto_47320 ?auto_47324 ) ) ( not ( = ?auto_47322 ?auto_47324 ) ) ( not ( = ?auto_47319 ?auto_47324 ) ) ( ON ?auto_47321 ?auto_47318 ) ( ON-TABLE ?auto_47324 ) ( ON ?auto_47319 ?auto_47321 ) ( ON ?auto_47322 ?auto_47319 ) ( ON ?auto_47320 ?auto_47322 ) ( CLEAR ?auto_47320 ) ( HOLDING ?auto_47323 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47323 )
      ( MAKE-1PILE ?auto_47318 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47325 - BLOCK
    )
    :vars
    (
      ?auto_47330 - BLOCK
      ?auto_47331 - BLOCK
      ?auto_47327 - BLOCK
      ?auto_47326 - BLOCK
      ?auto_47328 - BLOCK
      ?auto_47329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47325 ?auto_47330 ) ) ( not ( = ?auto_47331 ?auto_47327 ) ) ( not ( = ?auto_47331 ?auto_47326 ) ) ( not ( = ?auto_47331 ?auto_47328 ) ) ( not ( = ?auto_47331 ?auto_47330 ) ) ( not ( = ?auto_47331 ?auto_47325 ) ) ( not ( = ?auto_47327 ?auto_47326 ) ) ( not ( = ?auto_47327 ?auto_47328 ) ) ( not ( = ?auto_47327 ?auto_47330 ) ) ( not ( = ?auto_47327 ?auto_47325 ) ) ( not ( = ?auto_47326 ?auto_47328 ) ) ( not ( = ?auto_47326 ?auto_47330 ) ) ( not ( = ?auto_47326 ?auto_47325 ) ) ( not ( = ?auto_47328 ?auto_47330 ) ) ( not ( = ?auto_47328 ?auto_47325 ) ) ( ON ?auto_47325 ?auto_47329 ) ( not ( = ?auto_47325 ?auto_47329 ) ) ( not ( = ?auto_47330 ?auto_47329 ) ) ( not ( = ?auto_47331 ?auto_47329 ) ) ( not ( = ?auto_47327 ?auto_47329 ) ) ( not ( = ?auto_47326 ?auto_47329 ) ) ( not ( = ?auto_47328 ?auto_47329 ) ) ( ON ?auto_47330 ?auto_47325 ) ( ON-TABLE ?auto_47329 ) ( ON ?auto_47328 ?auto_47330 ) ( ON ?auto_47326 ?auto_47328 ) ( ON ?auto_47327 ?auto_47326 ) ( ON ?auto_47331 ?auto_47327 ) ( CLEAR ?auto_47331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47329 ?auto_47325 ?auto_47330 ?auto_47328 ?auto_47326 ?auto_47327 )
      ( MAKE-1PILE ?auto_47325 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47336 - BLOCK
      ?auto_47337 - BLOCK
      ?auto_47338 - BLOCK
      ?auto_47339 - BLOCK
    )
    :vars
    (
      ?auto_47340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47340 ?auto_47339 ) ( CLEAR ?auto_47340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47336 ) ( ON ?auto_47337 ?auto_47336 ) ( ON ?auto_47338 ?auto_47337 ) ( ON ?auto_47339 ?auto_47338 ) ( not ( = ?auto_47336 ?auto_47337 ) ) ( not ( = ?auto_47336 ?auto_47338 ) ) ( not ( = ?auto_47336 ?auto_47339 ) ) ( not ( = ?auto_47336 ?auto_47340 ) ) ( not ( = ?auto_47337 ?auto_47338 ) ) ( not ( = ?auto_47337 ?auto_47339 ) ) ( not ( = ?auto_47337 ?auto_47340 ) ) ( not ( = ?auto_47338 ?auto_47339 ) ) ( not ( = ?auto_47338 ?auto_47340 ) ) ( not ( = ?auto_47339 ?auto_47340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47340 ?auto_47339 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47341 - BLOCK
      ?auto_47342 - BLOCK
      ?auto_47343 - BLOCK
      ?auto_47344 - BLOCK
    )
    :vars
    (
      ?auto_47345 - BLOCK
      ?auto_47346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47345 ?auto_47344 ) ( CLEAR ?auto_47345 ) ( ON-TABLE ?auto_47341 ) ( ON ?auto_47342 ?auto_47341 ) ( ON ?auto_47343 ?auto_47342 ) ( ON ?auto_47344 ?auto_47343 ) ( not ( = ?auto_47341 ?auto_47342 ) ) ( not ( = ?auto_47341 ?auto_47343 ) ) ( not ( = ?auto_47341 ?auto_47344 ) ) ( not ( = ?auto_47341 ?auto_47345 ) ) ( not ( = ?auto_47342 ?auto_47343 ) ) ( not ( = ?auto_47342 ?auto_47344 ) ) ( not ( = ?auto_47342 ?auto_47345 ) ) ( not ( = ?auto_47343 ?auto_47344 ) ) ( not ( = ?auto_47343 ?auto_47345 ) ) ( not ( = ?auto_47344 ?auto_47345 ) ) ( HOLDING ?auto_47346 ) ( not ( = ?auto_47341 ?auto_47346 ) ) ( not ( = ?auto_47342 ?auto_47346 ) ) ( not ( = ?auto_47343 ?auto_47346 ) ) ( not ( = ?auto_47344 ?auto_47346 ) ) ( not ( = ?auto_47345 ?auto_47346 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_47346 )
      ( MAKE-4PILE ?auto_47341 ?auto_47342 ?auto_47343 ?auto_47344 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47347 - BLOCK
      ?auto_47348 - BLOCK
      ?auto_47349 - BLOCK
      ?auto_47350 - BLOCK
    )
    :vars
    (
      ?auto_47351 - BLOCK
      ?auto_47352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47351 ?auto_47350 ) ( ON-TABLE ?auto_47347 ) ( ON ?auto_47348 ?auto_47347 ) ( ON ?auto_47349 ?auto_47348 ) ( ON ?auto_47350 ?auto_47349 ) ( not ( = ?auto_47347 ?auto_47348 ) ) ( not ( = ?auto_47347 ?auto_47349 ) ) ( not ( = ?auto_47347 ?auto_47350 ) ) ( not ( = ?auto_47347 ?auto_47351 ) ) ( not ( = ?auto_47348 ?auto_47349 ) ) ( not ( = ?auto_47348 ?auto_47350 ) ) ( not ( = ?auto_47348 ?auto_47351 ) ) ( not ( = ?auto_47349 ?auto_47350 ) ) ( not ( = ?auto_47349 ?auto_47351 ) ) ( not ( = ?auto_47350 ?auto_47351 ) ) ( not ( = ?auto_47347 ?auto_47352 ) ) ( not ( = ?auto_47348 ?auto_47352 ) ) ( not ( = ?auto_47349 ?auto_47352 ) ) ( not ( = ?auto_47350 ?auto_47352 ) ) ( not ( = ?auto_47351 ?auto_47352 ) ) ( ON ?auto_47352 ?auto_47351 ) ( CLEAR ?auto_47352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47347 ?auto_47348 ?auto_47349 ?auto_47350 ?auto_47351 )
      ( MAKE-4PILE ?auto_47347 ?auto_47348 ?auto_47349 ?auto_47350 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47353 - BLOCK
      ?auto_47354 - BLOCK
      ?auto_47355 - BLOCK
      ?auto_47356 - BLOCK
    )
    :vars
    (
      ?auto_47357 - BLOCK
      ?auto_47358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47357 ?auto_47356 ) ( ON-TABLE ?auto_47353 ) ( ON ?auto_47354 ?auto_47353 ) ( ON ?auto_47355 ?auto_47354 ) ( ON ?auto_47356 ?auto_47355 ) ( not ( = ?auto_47353 ?auto_47354 ) ) ( not ( = ?auto_47353 ?auto_47355 ) ) ( not ( = ?auto_47353 ?auto_47356 ) ) ( not ( = ?auto_47353 ?auto_47357 ) ) ( not ( = ?auto_47354 ?auto_47355 ) ) ( not ( = ?auto_47354 ?auto_47356 ) ) ( not ( = ?auto_47354 ?auto_47357 ) ) ( not ( = ?auto_47355 ?auto_47356 ) ) ( not ( = ?auto_47355 ?auto_47357 ) ) ( not ( = ?auto_47356 ?auto_47357 ) ) ( not ( = ?auto_47353 ?auto_47358 ) ) ( not ( = ?auto_47354 ?auto_47358 ) ) ( not ( = ?auto_47355 ?auto_47358 ) ) ( not ( = ?auto_47356 ?auto_47358 ) ) ( not ( = ?auto_47357 ?auto_47358 ) ) ( HOLDING ?auto_47358 ) ( CLEAR ?auto_47357 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47353 ?auto_47354 ?auto_47355 ?auto_47356 ?auto_47357 ?auto_47358 )
      ( MAKE-4PILE ?auto_47353 ?auto_47354 ?auto_47355 ?auto_47356 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47359 - BLOCK
      ?auto_47360 - BLOCK
      ?auto_47361 - BLOCK
      ?auto_47362 - BLOCK
    )
    :vars
    (
      ?auto_47363 - BLOCK
      ?auto_47364 - BLOCK
      ?auto_47365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47363 ?auto_47362 ) ( ON-TABLE ?auto_47359 ) ( ON ?auto_47360 ?auto_47359 ) ( ON ?auto_47361 ?auto_47360 ) ( ON ?auto_47362 ?auto_47361 ) ( not ( = ?auto_47359 ?auto_47360 ) ) ( not ( = ?auto_47359 ?auto_47361 ) ) ( not ( = ?auto_47359 ?auto_47362 ) ) ( not ( = ?auto_47359 ?auto_47363 ) ) ( not ( = ?auto_47360 ?auto_47361 ) ) ( not ( = ?auto_47360 ?auto_47362 ) ) ( not ( = ?auto_47360 ?auto_47363 ) ) ( not ( = ?auto_47361 ?auto_47362 ) ) ( not ( = ?auto_47361 ?auto_47363 ) ) ( not ( = ?auto_47362 ?auto_47363 ) ) ( not ( = ?auto_47359 ?auto_47364 ) ) ( not ( = ?auto_47360 ?auto_47364 ) ) ( not ( = ?auto_47361 ?auto_47364 ) ) ( not ( = ?auto_47362 ?auto_47364 ) ) ( not ( = ?auto_47363 ?auto_47364 ) ) ( CLEAR ?auto_47363 ) ( ON ?auto_47364 ?auto_47365 ) ( CLEAR ?auto_47364 ) ( HAND-EMPTY ) ( not ( = ?auto_47359 ?auto_47365 ) ) ( not ( = ?auto_47360 ?auto_47365 ) ) ( not ( = ?auto_47361 ?auto_47365 ) ) ( not ( = ?auto_47362 ?auto_47365 ) ) ( not ( = ?auto_47363 ?auto_47365 ) ) ( not ( = ?auto_47364 ?auto_47365 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47364 ?auto_47365 )
      ( MAKE-4PILE ?auto_47359 ?auto_47360 ?auto_47361 ?auto_47362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47380 - BLOCK
      ?auto_47381 - BLOCK
      ?auto_47382 - BLOCK
      ?auto_47383 - BLOCK
    )
    :vars
    (
      ?auto_47385 - BLOCK
      ?auto_47384 - BLOCK
      ?auto_47386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47380 ) ( ON ?auto_47381 ?auto_47380 ) ( ON ?auto_47382 ?auto_47381 ) ( not ( = ?auto_47380 ?auto_47381 ) ) ( not ( = ?auto_47380 ?auto_47382 ) ) ( not ( = ?auto_47380 ?auto_47383 ) ) ( not ( = ?auto_47380 ?auto_47385 ) ) ( not ( = ?auto_47381 ?auto_47382 ) ) ( not ( = ?auto_47381 ?auto_47383 ) ) ( not ( = ?auto_47381 ?auto_47385 ) ) ( not ( = ?auto_47382 ?auto_47383 ) ) ( not ( = ?auto_47382 ?auto_47385 ) ) ( not ( = ?auto_47383 ?auto_47385 ) ) ( not ( = ?auto_47380 ?auto_47384 ) ) ( not ( = ?auto_47381 ?auto_47384 ) ) ( not ( = ?auto_47382 ?auto_47384 ) ) ( not ( = ?auto_47383 ?auto_47384 ) ) ( not ( = ?auto_47385 ?auto_47384 ) ) ( ON ?auto_47384 ?auto_47386 ) ( not ( = ?auto_47380 ?auto_47386 ) ) ( not ( = ?auto_47381 ?auto_47386 ) ) ( not ( = ?auto_47382 ?auto_47386 ) ) ( not ( = ?auto_47383 ?auto_47386 ) ) ( not ( = ?auto_47385 ?auto_47386 ) ) ( not ( = ?auto_47384 ?auto_47386 ) ) ( ON ?auto_47385 ?auto_47384 ) ( CLEAR ?auto_47385 ) ( HOLDING ?auto_47383 ) ( CLEAR ?auto_47382 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47380 ?auto_47381 ?auto_47382 ?auto_47383 ?auto_47385 )
      ( MAKE-4PILE ?auto_47380 ?auto_47381 ?auto_47382 ?auto_47383 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47387 - BLOCK
      ?auto_47388 - BLOCK
      ?auto_47389 - BLOCK
      ?auto_47390 - BLOCK
    )
    :vars
    (
      ?auto_47393 - BLOCK
      ?auto_47391 - BLOCK
      ?auto_47392 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47387 ) ( ON ?auto_47388 ?auto_47387 ) ( ON ?auto_47389 ?auto_47388 ) ( not ( = ?auto_47387 ?auto_47388 ) ) ( not ( = ?auto_47387 ?auto_47389 ) ) ( not ( = ?auto_47387 ?auto_47390 ) ) ( not ( = ?auto_47387 ?auto_47393 ) ) ( not ( = ?auto_47388 ?auto_47389 ) ) ( not ( = ?auto_47388 ?auto_47390 ) ) ( not ( = ?auto_47388 ?auto_47393 ) ) ( not ( = ?auto_47389 ?auto_47390 ) ) ( not ( = ?auto_47389 ?auto_47393 ) ) ( not ( = ?auto_47390 ?auto_47393 ) ) ( not ( = ?auto_47387 ?auto_47391 ) ) ( not ( = ?auto_47388 ?auto_47391 ) ) ( not ( = ?auto_47389 ?auto_47391 ) ) ( not ( = ?auto_47390 ?auto_47391 ) ) ( not ( = ?auto_47393 ?auto_47391 ) ) ( ON ?auto_47391 ?auto_47392 ) ( not ( = ?auto_47387 ?auto_47392 ) ) ( not ( = ?auto_47388 ?auto_47392 ) ) ( not ( = ?auto_47389 ?auto_47392 ) ) ( not ( = ?auto_47390 ?auto_47392 ) ) ( not ( = ?auto_47393 ?auto_47392 ) ) ( not ( = ?auto_47391 ?auto_47392 ) ) ( ON ?auto_47393 ?auto_47391 ) ( CLEAR ?auto_47389 ) ( ON ?auto_47390 ?auto_47393 ) ( CLEAR ?auto_47390 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47392 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47392 ?auto_47391 ?auto_47393 )
      ( MAKE-4PILE ?auto_47387 ?auto_47388 ?auto_47389 ?auto_47390 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47394 - BLOCK
      ?auto_47395 - BLOCK
      ?auto_47396 - BLOCK
      ?auto_47397 - BLOCK
    )
    :vars
    (
      ?auto_47399 - BLOCK
      ?auto_47398 - BLOCK
      ?auto_47400 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47394 ) ( ON ?auto_47395 ?auto_47394 ) ( not ( = ?auto_47394 ?auto_47395 ) ) ( not ( = ?auto_47394 ?auto_47396 ) ) ( not ( = ?auto_47394 ?auto_47397 ) ) ( not ( = ?auto_47394 ?auto_47399 ) ) ( not ( = ?auto_47395 ?auto_47396 ) ) ( not ( = ?auto_47395 ?auto_47397 ) ) ( not ( = ?auto_47395 ?auto_47399 ) ) ( not ( = ?auto_47396 ?auto_47397 ) ) ( not ( = ?auto_47396 ?auto_47399 ) ) ( not ( = ?auto_47397 ?auto_47399 ) ) ( not ( = ?auto_47394 ?auto_47398 ) ) ( not ( = ?auto_47395 ?auto_47398 ) ) ( not ( = ?auto_47396 ?auto_47398 ) ) ( not ( = ?auto_47397 ?auto_47398 ) ) ( not ( = ?auto_47399 ?auto_47398 ) ) ( ON ?auto_47398 ?auto_47400 ) ( not ( = ?auto_47394 ?auto_47400 ) ) ( not ( = ?auto_47395 ?auto_47400 ) ) ( not ( = ?auto_47396 ?auto_47400 ) ) ( not ( = ?auto_47397 ?auto_47400 ) ) ( not ( = ?auto_47399 ?auto_47400 ) ) ( not ( = ?auto_47398 ?auto_47400 ) ) ( ON ?auto_47399 ?auto_47398 ) ( ON ?auto_47397 ?auto_47399 ) ( CLEAR ?auto_47397 ) ( ON-TABLE ?auto_47400 ) ( HOLDING ?auto_47396 ) ( CLEAR ?auto_47395 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47394 ?auto_47395 ?auto_47396 )
      ( MAKE-4PILE ?auto_47394 ?auto_47395 ?auto_47396 ?auto_47397 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47401 - BLOCK
      ?auto_47402 - BLOCK
      ?auto_47403 - BLOCK
      ?auto_47404 - BLOCK
    )
    :vars
    (
      ?auto_47406 - BLOCK
      ?auto_47405 - BLOCK
      ?auto_47407 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47401 ) ( ON ?auto_47402 ?auto_47401 ) ( not ( = ?auto_47401 ?auto_47402 ) ) ( not ( = ?auto_47401 ?auto_47403 ) ) ( not ( = ?auto_47401 ?auto_47404 ) ) ( not ( = ?auto_47401 ?auto_47406 ) ) ( not ( = ?auto_47402 ?auto_47403 ) ) ( not ( = ?auto_47402 ?auto_47404 ) ) ( not ( = ?auto_47402 ?auto_47406 ) ) ( not ( = ?auto_47403 ?auto_47404 ) ) ( not ( = ?auto_47403 ?auto_47406 ) ) ( not ( = ?auto_47404 ?auto_47406 ) ) ( not ( = ?auto_47401 ?auto_47405 ) ) ( not ( = ?auto_47402 ?auto_47405 ) ) ( not ( = ?auto_47403 ?auto_47405 ) ) ( not ( = ?auto_47404 ?auto_47405 ) ) ( not ( = ?auto_47406 ?auto_47405 ) ) ( ON ?auto_47405 ?auto_47407 ) ( not ( = ?auto_47401 ?auto_47407 ) ) ( not ( = ?auto_47402 ?auto_47407 ) ) ( not ( = ?auto_47403 ?auto_47407 ) ) ( not ( = ?auto_47404 ?auto_47407 ) ) ( not ( = ?auto_47406 ?auto_47407 ) ) ( not ( = ?auto_47405 ?auto_47407 ) ) ( ON ?auto_47406 ?auto_47405 ) ( ON ?auto_47404 ?auto_47406 ) ( ON-TABLE ?auto_47407 ) ( CLEAR ?auto_47402 ) ( ON ?auto_47403 ?auto_47404 ) ( CLEAR ?auto_47403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47407 ?auto_47405 ?auto_47406 ?auto_47404 )
      ( MAKE-4PILE ?auto_47401 ?auto_47402 ?auto_47403 ?auto_47404 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47408 - BLOCK
      ?auto_47409 - BLOCK
      ?auto_47410 - BLOCK
      ?auto_47411 - BLOCK
    )
    :vars
    (
      ?auto_47414 - BLOCK
      ?auto_47412 - BLOCK
      ?auto_47413 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47408 ) ( not ( = ?auto_47408 ?auto_47409 ) ) ( not ( = ?auto_47408 ?auto_47410 ) ) ( not ( = ?auto_47408 ?auto_47411 ) ) ( not ( = ?auto_47408 ?auto_47414 ) ) ( not ( = ?auto_47409 ?auto_47410 ) ) ( not ( = ?auto_47409 ?auto_47411 ) ) ( not ( = ?auto_47409 ?auto_47414 ) ) ( not ( = ?auto_47410 ?auto_47411 ) ) ( not ( = ?auto_47410 ?auto_47414 ) ) ( not ( = ?auto_47411 ?auto_47414 ) ) ( not ( = ?auto_47408 ?auto_47412 ) ) ( not ( = ?auto_47409 ?auto_47412 ) ) ( not ( = ?auto_47410 ?auto_47412 ) ) ( not ( = ?auto_47411 ?auto_47412 ) ) ( not ( = ?auto_47414 ?auto_47412 ) ) ( ON ?auto_47412 ?auto_47413 ) ( not ( = ?auto_47408 ?auto_47413 ) ) ( not ( = ?auto_47409 ?auto_47413 ) ) ( not ( = ?auto_47410 ?auto_47413 ) ) ( not ( = ?auto_47411 ?auto_47413 ) ) ( not ( = ?auto_47414 ?auto_47413 ) ) ( not ( = ?auto_47412 ?auto_47413 ) ) ( ON ?auto_47414 ?auto_47412 ) ( ON ?auto_47411 ?auto_47414 ) ( ON-TABLE ?auto_47413 ) ( ON ?auto_47410 ?auto_47411 ) ( CLEAR ?auto_47410 ) ( HOLDING ?auto_47409 ) ( CLEAR ?auto_47408 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47408 ?auto_47409 )
      ( MAKE-4PILE ?auto_47408 ?auto_47409 ?auto_47410 ?auto_47411 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47415 - BLOCK
      ?auto_47416 - BLOCK
      ?auto_47417 - BLOCK
      ?auto_47418 - BLOCK
    )
    :vars
    (
      ?auto_47420 - BLOCK
      ?auto_47421 - BLOCK
      ?auto_47419 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47415 ) ( not ( = ?auto_47415 ?auto_47416 ) ) ( not ( = ?auto_47415 ?auto_47417 ) ) ( not ( = ?auto_47415 ?auto_47418 ) ) ( not ( = ?auto_47415 ?auto_47420 ) ) ( not ( = ?auto_47416 ?auto_47417 ) ) ( not ( = ?auto_47416 ?auto_47418 ) ) ( not ( = ?auto_47416 ?auto_47420 ) ) ( not ( = ?auto_47417 ?auto_47418 ) ) ( not ( = ?auto_47417 ?auto_47420 ) ) ( not ( = ?auto_47418 ?auto_47420 ) ) ( not ( = ?auto_47415 ?auto_47421 ) ) ( not ( = ?auto_47416 ?auto_47421 ) ) ( not ( = ?auto_47417 ?auto_47421 ) ) ( not ( = ?auto_47418 ?auto_47421 ) ) ( not ( = ?auto_47420 ?auto_47421 ) ) ( ON ?auto_47421 ?auto_47419 ) ( not ( = ?auto_47415 ?auto_47419 ) ) ( not ( = ?auto_47416 ?auto_47419 ) ) ( not ( = ?auto_47417 ?auto_47419 ) ) ( not ( = ?auto_47418 ?auto_47419 ) ) ( not ( = ?auto_47420 ?auto_47419 ) ) ( not ( = ?auto_47421 ?auto_47419 ) ) ( ON ?auto_47420 ?auto_47421 ) ( ON ?auto_47418 ?auto_47420 ) ( ON-TABLE ?auto_47419 ) ( ON ?auto_47417 ?auto_47418 ) ( CLEAR ?auto_47415 ) ( ON ?auto_47416 ?auto_47417 ) ( CLEAR ?auto_47416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47419 ?auto_47421 ?auto_47420 ?auto_47418 ?auto_47417 )
      ( MAKE-4PILE ?auto_47415 ?auto_47416 ?auto_47417 ?auto_47418 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47422 - BLOCK
      ?auto_47423 - BLOCK
      ?auto_47424 - BLOCK
      ?auto_47425 - BLOCK
    )
    :vars
    (
      ?auto_47428 - BLOCK
      ?auto_47427 - BLOCK
      ?auto_47426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47422 ?auto_47423 ) ) ( not ( = ?auto_47422 ?auto_47424 ) ) ( not ( = ?auto_47422 ?auto_47425 ) ) ( not ( = ?auto_47422 ?auto_47428 ) ) ( not ( = ?auto_47423 ?auto_47424 ) ) ( not ( = ?auto_47423 ?auto_47425 ) ) ( not ( = ?auto_47423 ?auto_47428 ) ) ( not ( = ?auto_47424 ?auto_47425 ) ) ( not ( = ?auto_47424 ?auto_47428 ) ) ( not ( = ?auto_47425 ?auto_47428 ) ) ( not ( = ?auto_47422 ?auto_47427 ) ) ( not ( = ?auto_47423 ?auto_47427 ) ) ( not ( = ?auto_47424 ?auto_47427 ) ) ( not ( = ?auto_47425 ?auto_47427 ) ) ( not ( = ?auto_47428 ?auto_47427 ) ) ( ON ?auto_47427 ?auto_47426 ) ( not ( = ?auto_47422 ?auto_47426 ) ) ( not ( = ?auto_47423 ?auto_47426 ) ) ( not ( = ?auto_47424 ?auto_47426 ) ) ( not ( = ?auto_47425 ?auto_47426 ) ) ( not ( = ?auto_47428 ?auto_47426 ) ) ( not ( = ?auto_47427 ?auto_47426 ) ) ( ON ?auto_47428 ?auto_47427 ) ( ON ?auto_47425 ?auto_47428 ) ( ON-TABLE ?auto_47426 ) ( ON ?auto_47424 ?auto_47425 ) ( ON ?auto_47423 ?auto_47424 ) ( CLEAR ?auto_47423 ) ( HOLDING ?auto_47422 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47422 )
      ( MAKE-4PILE ?auto_47422 ?auto_47423 ?auto_47424 ?auto_47425 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47429 - BLOCK
      ?auto_47430 - BLOCK
      ?auto_47431 - BLOCK
      ?auto_47432 - BLOCK
    )
    :vars
    (
      ?auto_47434 - BLOCK
      ?auto_47433 - BLOCK
      ?auto_47435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47429 ?auto_47430 ) ) ( not ( = ?auto_47429 ?auto_47431 ) ) ( not ( = ?auto_47429 ?auto_47432 ) ) ( not ( = ?auto_47429 ?auto_47434 ) ) ( not ( = ?auto_47430 ?auto_47431 ) ) ( not ( = ?auto_47430 ?auto_47432 ) ) ( not ( = ?auto_47430 ?auto_47434 ) ) ( not ( = ?auto_47431 ?auto_47432 ) ) ( not ( = ?auto_47431 ?auto_47434 ) ) ( not ( = ?auto_47432 ?auto_47434 ) ) ( not ( = ?auto_47429 ?auto_47433 ) ) ( not ( = ?auto_47430 ?auto_47433 ) ) ( not ( = ?auto_47431 ?auto_47433 ) ) ( not ( = ?auto_47432 ?auto_47433 ) ) ( not ( = ?auto_47434 ?auto_47433 ) ) ( ON ?auto_47433 ?auto_47435 ) ( not ( = ?auto_47429 ?auto_47435 ) ) ( not ( = ?auto_47430 ?auto_47435 ) ) ( not ( = ?auto_47431 ?auto_47435 ) ) ( not ( = ?auto_47432 ?auto_47435 ) ) ( not ( = ?auto_47434 ?auto_47435 ) ) ( not ( = ?auto_47433 ?auto_47435 ) ) ( ON ?auto_47434 ?auto_47433 ) ( ON ?auto_47432 ?auto_47434 ) ( ON-TABLE ?auto_47435 ) ( ON ?auto_47431 ?auto_47432 ) ( ON ?auto_47430 ?auto_47431 ) ( ON ?auto_47429 ?auto_47430 ) ( CLEAR ?auto_47429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47435 ?auto_47433 ?auto_47434 ?auto_47432 ?auto_47431 ?auto_47430 )
      ( MAKE-4PILE ?auto_47429 ?auto_47430 ?auto_47431 ?auto_47432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47438 - BLOCK
      ?auto_47439 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47439 ) ( CLEAR ?auto_47438 ) ( ON-TABLE ?auto_47438 ) ( not ( = ?auto_47438 ?auto_47439 ) ) )
    :subtasks
    ( ( !STACK ?auto_47439 ?auto_47438 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47440 - BLOCK
      ?auto_47441 - BLOCK
    )
    :vars
    (
      ?auto_47442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47440 ) ( ON-TABLE ?auto_47440 ) ( not ( = ?auto_47440 ?auto_47441 ) ) ( ON ?auto_47441 ?auto_47442 ) ( CLEAR ?auto_47441 ) ( HAND-EMPTY ) ( not ( = ?auto_47440 ?auto_47442 ) ) ( not ( = ?auto_47441 ?auto_47442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47441 ?auto_47442 )
      ( MAKE-2PILE ?auto_47440 ?auto_47441 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47443 - BLOCK
      ?auto_47444 - BLOCK
    )
    :vars
    (
      ?auto_47445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47443 ?auto_47444 ) ) ( ON ?auto_47444 ?auto_47445 ) ( CLEAR ?auto_47444 ) ( not ( = ?auto_47443 ?auto_47445 ) ) ( not ( = ?auto_47444 ?auto_47445 ) ) ( HOLDING ?auto_47443 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47443 )
      ( MAKE-2PILE ?auto_47443 ?auto_47444 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47446 - BLOCK
      ?auto_47447 - BLOCK
    )
    :vars
    (
      ?auto_47448 - BLOCK
      ?auto_47449 - BLOCK
      ?auto_47451 - BLOCK
      ?auto_47450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47446 ?auto_47447 ) ) ( ON ?auto_47447 ?auto_47448 ) ( not ( = ?auto_47446 ?auto_47448 ) ) ( not ( = ?auto_47447 ?auto_47448 ) ) ( ON ?auto_47446 ?auto_47447 ) ( CLEAR ?auto_47446 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47449 ) ( ON ?auto_47451 ?auto_47449 ) ( ON ?auto_47450 ?auto_47451 ) ( ON ?auto_47448 ?auto_47450 ) ( not ( = ?auto_47449 ?auto_47451 ) ) ( not ( = ?auto_47449 ?auto_47450 ) ) ( not ( = ?auto_47449 ?auto_47448 ) ) ( not ( = ?auto_47449 ?auto_47447 ) ) ( not ( = ?auto_47449 ?auto_47446 ) ) ( not ( = ?auto_47451 ?auto_47450 ) ) ( not ( = ?auto_47451 ?auto_47448 ) ) ( not ( = ?auto_47451 ?auto_47447 ) ) ( not ( = ?auto_47451 ?auto_47446 ) ) ( not ( = ?auto_47450 ?auto_47448 ) ) ( not ( = ?auto_47450 ?auto_47447 ) ) ( not ( = ?auto_47450 ?auto_47446 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47449 ?auto_47451 ?auto_47450 ?auto_47448 ?auto_47447 )
      ( MAKE-2PILE ?auto_47446 ?auto_47447 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47452 - BLOCK
      ?auto_47453 - BLOCK
    )
    :vars
    (
      ?auto_47455 - BLOCK
      ?auto_47456 - BLOCK
      ?auto_47457 - BLOCK
      ?auto_47454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47452 ?auto_47453 ) ) ( ON ?auto_47453 ?auto_47455 ) ( not ( = ?auto_47452 ?auto_47455 ) ) ( not ( = ?auto_47453 ?auto_47455 ) ) ( ON-TABLE ?auto_47456 ) ( ON ?auto_47457 ?auto_47456 ) ( ON ?auto_47454 ?auto_47457 ) ( ON ?auto_47455 ?auto_47454 ) ( not ( = ?auto_47456 ?auto_47457 ) ) ( not ( = ?auto_47456 ?auto_47454 ) ) ( not ( = ?auto_47456 ?auto_47455 ) ) ( not ( = ?auto_47456 ?auto_47453 ) ) ( not ( = ?auto_47456 ?auto_47452 ) ) ( not ( = ?auto_47457 ?auto_47454 ) ) ( not ( = ?auto_47457 ?auto_47455 ) ) ( not ( = ?auto_47457 ?auto_47453 ) ) ( not ( = ?auto_47457 ?auto_47452 ) ) ( not ( = ?auto_47454 ?auto_47455 ) ) ( not ( = ?auto_47454 ?auto_47453 ) ) ( not ( = ?auto_47454 ?auto_47452 ) ) ( HOLDING ?auto_47452 ) ( CLEAR ?auto_47453 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47456 ?auto_47457 ?auto_47454 ?auto_47455 ?auto_47453 ?auto_47452 )
      ( MAKE-2PILE ?auto_47452 ?auto_47453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47458 - BLOCK
      ?auto_47459 - BLOCK
    )
    :vars
    (
      ?auto_47461 - BLOCK
      ?auto_47462 - BLOCK
      ?auto_47463 - BLOCK
      ?auto_47460 - BLOCK
      ?auto_47464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47458 ?auto_47459 ) ) ( ON ?auto_47459 ?auto_47461 ) ( not ( = ?auto_47458 ?auto_47461 ) ) ( not ( = ?auto_47459 ?auto_47461 ) ) ( ON-TABLE ?auto_47462 ) ( ON ?auto_47463 ?auto_47462 ) ( ON ?auto_47460 ?auto_47463 ) ( ON ?auto_47461 ?auto_47460 ) ( not ( = ?auto_47462 ?auto_47463 ) ) ( not ( = ?auto_47462 ?auto_47460 ) ) ( not ( = ?auto_47462 ?auto_47461 ) ) ( not ( = ?auto_47462 ?auto_47459 ) ) ( not ( = ?auto_47462 ?auto_47458 ) ) ( not ( = ?auto_47463 ?auto_47460 ) ) ( not ( = ?auto_47463 ?auto_47461 ) ) ( not ( = ?auto_47463 ?auto_47459 ) ) ( not ( = ?auto_47463 ?auto_47458 ) ) ( not ( = ?auto_47460 ?auto_47461 ) ) ( not ( = ?auto_47460 ?auto_47459 ) ) ( not ( = ?auto_47460 ?auto_47458 ) ) ( CLEAR ?auto_47459 ) ( ON ?auto_47458 ?auto_47464 ) ( CLEAR ?auto_47458 ) ( HAND-EMPTY ) ( not ( = ?auto_47458 ?auto_47464 ) ) ( not ( = ?auto_47459 ?auto_47464 ) ) ( not ( = ?auto_47461 ?auto_47464 ) ) ( not ( = ?auto_47462 ?auto_47464 ) ) ( not ( = ?auto_47463 ?auto_47464 ) ) ( not ( = ?auto_47460 ?auto_47464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47458 ?auto_47464 )
      ( MAKE-2PILE ?auto_47458 ?auto_47459 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47465 - BLOCK
      ?auto_47466 - BLOCK
    )
    :vars
    (
      ?auto_47468 - BLOCK
      ?auto_47471 - BLOCK
      ?auto_47467 - BLOCK
      ?auto_47470 - BLOCK
      ?auto_47469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47465 ?auto_47466 ) ) ( not ( = ?auto_47465 ?auto_47468 ) ) ( not ( = ?auto_47466 ?auto_47468 ) ) ( ON-TABLE ?auto_47471 ) ( ON ?auto_47467 ?auto_47471 ) ( ON ?auto_47470 ?auto_47467 ) ( ON ?auto_47468 ?auto_47470 ) ( not ( = ?auto_47471 ?auto_47467 ) ) ( not ( = ?auto_47471 ?auto_47470 ) ) ( not ( = ?auto_47471 ?auto_47468 ) ) ( not ( = ?auto_47471 ?auto_47466 ) ) ( not ( = ?auto_47471 ?auto_47465 ) ) ( not ( = ?auto_47467 ?auto_47470 ) ) ( not ( = ?auto_47467 ?auto_47468 ) ) ( not ( = ?auto_47467 ?auto_47466 ) ) ( not ( = ?auto_47467 ?auto_47465 ) ) ( not ( = ?auto_47470 ?auto_47468 ) ) ( not ( = ?auto_47470 ?auto_47466 ) ) ( not ( = ?auto_47470 ?auto_47465 ) ) ( ON ?auto_47465 ?auto_47469 ) ( CLEAR ?auto_47465 ) ( not ( = ?auto_47465 ?auto_47469 ) ) ( not ( = ?auto_47466 ?auto_47469 ) ) ( not ( = ?auto_47468 ?auto_47469 ) ) ( not ( = ?auto_47471 ?auto_47469 ) ) ( not ( = ?auto_47467 ?auto_47469 ) ) ( not ( = ?auto_47470 ?auto_47469 ) ) ( HOLDING ?auto_47466 ) ( CLEAR ?auto_47468 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47471 ?auto_47467 ?auto_47470 ?auto_47468 ?auto_47466 )
      ( MAKE-2PILE ?auto_47465 ?auto_47466 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47472 - BLOCK
      ?auto_47473 - BLOCK
    )
    :vars
    (
      ?auto_47475 - BLOCK
      ?auto_47474 - BLOCK
      ?auto_47478 - BLOCK
      ?auto_47476 - BLOCK
      ?auto_47477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47472 ?auto_47473 ) ) ( not ( = ?auto_47472 ?auto_47475 ) ) ( not ( = ?auto_47473 ?auto_47475 ) ) ( ON-TABLE ?auto_47474 ) ( ON ?auto_47478 ?auto_47474 ) ( ON ?auto_47476 ?auto_47478 ) ( ON ?auto_47475 ?auto_47476 ) ( not ( = ?auto_47474 ?auto_47478 ) ) ( not ( = ?auto_47474 ?auto_47476 ) ) ( not ( = ?auto_47474 ?auto_47475 ) ) ( not ( = ?auto_47474 ?auto_47473 ) ) ( not ( = ?auto_47474 ?auto_47472 ) ) ( not ( = ?auto_47478 ?auto_47476 ) ) ( not ( = ?auto_47478 ?auto_47475 ) ) ( not ( = ?auto_47478 ?auto_47473 ) ) ( not ( = ?auto_47478 ?auto_47472 ) ) ( not ( = ?auto_47476 ?auto_47475 ) ) ( not ( = ?auto_47476 ?auto_47473 ) ) ( not ( = ?auto_47476 ?auto_47472 ) ) ( ON ?auto_47472 ?auto_47477 ) ( not ( = ?auto_47472 ?auto_47477 ) ) ( not ( = ?auto_47473 ?auto_47477 ) ) ( not ( = ?auto_47475 ?auto_47477 ) ) ( not ( = ?auto_47474 ?auto_47477 ) ) ( not ( = ?auto_47478 ?auto_47477 ) ) ( not ( = ?auto_47476 ?auto_47477 ) ) ( CLEAR ?auto_47475 ) ( ON ?auto_47473 ?auto_47472 ) ( CLEAR ?auto_47473 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47477 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47477 ?auto_47472 )
      ( MAKE-2PILE ?auto_47472 ?auto_47473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47479 - BLOCK
      ?auto_47480 - BLOCK
    )
    :vars
    (
      ?auto_47482 - BLOCK
      ?auto_47483 - BLOCK
      ?auto_47481 - BLOCK
      ?auto_47485 - BLOCK
      ?auto_47484 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47479 ?auto_47480 ) ) ( not ( = ?auto_47479 ?auto_47482 ) ) ( not ( = ?auto_47480 ?auto_47482 ) ) ( ON-TABLE ?auto_47483 ) ( ON ?auto_47481 ?auto_47483 ) ( ON ?auto_47485 ?auto_47481 ) ( not ( = ?auto_47483 ?auto_47481 ) ) ( not ( = ?auto_47483 ?auto_47485 ) ) ( not ( = ?auto_47483 ?auto_47482 ) ) ( not ( = ?auto_47483 ?auto_47480 ) ) ( not ( = ?auto_47483 ?auto_47479 ) ) ( not ( = ?auto_47481 ?auto_47485 ) ) ( not ( = ?auto_47481 ?auto_47482 ) ) ( not ( = ?auto_47481 ?auto_47480 ) ) ( not ( = ?auto_47481 ?auto_47479 ) ) ( not ( = ?auto_47485 ?auto_47482 ) ) ( not ( = ?auto_47485 ?auto_47480 ) ) ( not ( = ?auto_47485 ?auto_47479 ) ) ( ON ?auto_47479 ?auto_47484 ) ( not ( = ?auto_47479 ?auto_47484 ) ) ( not ( = ?auto_47480 ?auto_47484 ) ) ( not ( = ?auto_47482 ?auto_47484 ) ) ( not ( = ?auto_47483 ?auto_47484 ) ) ( not ( = ?auto_47481 ?auto_47484 ) ) ( not ( = ?auto_47485 ?auto_47484 ) ) ( ON ?auto_47480 ?auto_47479 ) ( CLEAR ?auto_47480 ) ( ON-TABLE ?auto_47484 ) ( HOLDING ?auto_47482 ) ( CLEAR ?auto_47485 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47483 ?auto_47481 ?auto_47485 ?auto_47482 )
      ( MAKE-2PILE ?auto_47479 ?auto_47480 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47486 - BLOCK
      ?auto_47487 - BLOCK
    )
    :vars
    (
      ?auto_47491 - BLOCK
      ?auto_47488 - BLOCK
      ?auto_47489 - BLOCK
      ?auto_47492 - BLOCK
      ?auto_47490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47486 ?auto_47487 ) ) ( not ( = ?auto_47486 ?auto_47491 ) ) ( not ( = ?auto_47487 ?auto_47491 ) ) ( ON-TABLE ?auto_47488 ) ( ON ?auto_47489 ?auto_47488 ) ( ON ?auto_47492 ?auto_47489 ) ( not ( = ?auto_47488 ?auto_47489 ) ) ( not ( = ?auto_47488 ?auto_47492 ) ) ( not ( = ?auto_47488 ?auto_47491 ) ) ( not ( = ?auto_47488 ?auto_47487 ) ) ( not ( = ?auto_47488 ?auto_47486 ) ) ( not ( = ?auto_47489 ?auto_47492 ) ) ( not ( = ?auto_47489 ?auto_47491 ) ) ( not ( = ?auto_47489 ?auto_47487 ) ) ( not ( = ?auto_47489 ?auto_47486 ) ) ( not ( = ?auto_47492 ?auto_47491 ) ) ( not ( = ?auto_47492 ?auto_47487 ) ) ( not ( = ?auto_47492 ?auto_47486 ) ) ( ON ?auto_47486 ?auto_47490 ) ( not ( = ?auto_47486 ?auto_47490 ) ) ( not ( = ?auto_47487 ?auto_47490 ) ) ( not ( = ?auto_47491 ?auto_47490 ) ) ( not ( = ?auto_47488 ?auto_47490 ) ) ( not ( = ?auto_47489 ?auto_47490 ) ) ( not ( = ?auto_47492 ?auto_47490 ) ) ( ON ?auto_47487 ?auto_47486 ) ( ON-TABLE ?auto_47490 ) ( CLEAR ?auto_47492 ) ( ON ?auto_47491 ?auto_47487 ) ( CLEAR ?auto_47491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47490 ?auto_47486 ?auto_47487 )
      ( MAKE-2PILE ?auto_47486 ?auto_47487 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47493 - BLOCK
      ?auto_47494 - BLOCK
    )
    :vars
    (
      ?auto_47497 - BLOCK
      ?auto_47498 - BLOCK
      ?auto_47499 - BLOCK
      ?auto_47496 - BLOCK
      ?auto_47495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47493 ?auto_47494 ) ) ( not ( = ?auto_47493 ?auto_47497 ) ) ( not ( = ?auto_47494 ?auto_47497 ) ) ( ON-TABLE ?auto_47498 ) ( ON ?auto_47499 ?auto_47498 ) ( not ( = ?auto_47498 ?auto_47499 ) ) ( not ( = ?auto_47498 ?auto_47496 ) ) ( not ( = ?auto_47498 ?auto_47497 ) ) ( not ( = ?auto_47498 ?auto_47494 ) ) ( not ( = ?auto_47498 ?auto_47493 ) ) ( not ( = ?auto_47499 ?auto_47496 ) ) ( not ( = ?auto_47499 ?auto_47497 ) ) ( not ( = ?auto_47499 ?auto_47494 ) ) ( not ( = ?auto_47499 ?auto_47493 ) ) ( not ( = ?auto_47496 ?auto_47497 ) ) ( not ( = ?auto_47496 ?auto_47494 ) ) ( not ( = ?auto_47496 ?auto_47493 ) ) ( ON ?auto_47493 ?auto_47495 ) ( not ( = ?auto_47493 ?auto_47495 ) ) ( not ( = ?auto_47494 ?auto_47495 ) ) ( not ( = ?auto_47497 ?auto_47495 ) ) ( not ( = ?auto_47498 ?auto_47495 ) ) ( not ( = ?auto_47499 ?auto_47495 ) ) ( not ( = ?auto_47496 ?auto_47495 ) ) ( ON ?auto_47494 ?auto_47493 ) ( ON-TABLE ?auto_47495 ) ( ON ?auto_47497 ?auto_47494 ) ( CLEAR ?auto_47497 ) ( HOLDING ?auto_47496 ) ( CLEAR ?auto_47499 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47498 ?auto_47499 ?auto_47496 )
      ( MAKE-2PILE ?auto_47493 ?auto_47494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47500 - BLOCK
      ?auto_47501 - BLOCK
    )
    :vars
    (
      ?auto_47505 - BLOCK
      ?auto_47506 - BLOCK
      ?auto_47502 - BLOCK
      ?auto_47504 - BLOCK
      ?auto_47503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47500 ?auto_47501 ) ) ( not ( = ?auto_47500 ?auto_47505 ) ) ( not ( = ?auto_47501 ?auto_47505 ) ) ( ON-TABLE ?auto_47506 ) ( ON ?auto_47502 ?auto_47506 ) ( not ( = ?auto_47506 ?auto_47502 ) ) ( not ( = ?auto_47506 ?auto_47504 ) ) ( not ( = ?auto_47506 ?auto_47505 ) ) ( not ( = ?auto_47506 ?auto_47501 ) ) ( not ( = ?auto_47506 ?auto_47500 ) ) ( not ( = ?auto_47502 ?auto_47504 ) ) ( not ( = ?auto_47502 ?auto_47505 ) ) ( not ( = ?auto_47502 ?auto_47501 ) ) ( not ( = ?auto_47502 ?auto_47500 ) ) ( not ( = ?auto_47504 ?auto_47505 ) ) ( not ( = ?auto_47504 ?auto_47501 ) ) ( not ( = ?auto_47504 ?auto_47500 ) ) ( ON ?auto_47500 ?auto_47503 ) ( not ( = ?auto_47500 ?auto_47503 ) ) ( not ( = ?auto_47501 ?auto_47503 ) ) ( not ( = ?auto_47505 ?auto_47503 ) ) ( not ( = ?auto_47506 ?auto_47503 ) ) ( not ( = ?auto_47502 ?auto_47503 ) ) ( not ( = ?auto_47504 ?auto_47503 ) ) ( ON ?auto_47501 ?auto_47500 ) ( ON-TABLE ?auto_47503 ) ( ON ?auto_47505 ?auto_47501 ) ( CLEAR ?auto_47502 ) ( ON ?auto_47504 ?auto_47505 ) ( CLEAR ?auto_47504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47503 ?auto_47500 ?auto_47501 ?auto_47505 )
      ( MAKE-2PILE ?auto_47500 ?auto_47501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47507 - BLOCK
      ?auto_47508 - BLOCK
    )
    :vars
    (
      ?auto_47513 - BLOCK
      ?auto_47512 - BLOCK
      ?auto_47509 - BLOCK
      ?auto_47510 - BLOCK
      ?auto_47511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47507 ?auto_47508 ) ) ( not ( = ?auto_47507 ?auto_47513 ) ) ( not ( = ?auto_47508 ?auto_47513 ) ) ( ON-TABLE ?auto_47512 ) ( not ( = ?auto_47512 ?auto_47509 ) ) ( not ( = ?auto_47512 ?auto_47510 ) ) ( not ( = ?auto_47512 ?auto_47513 ) ) ( not ( = ?auto_47512 ?auto_47508 ) ) ( not ( = ?auto_47512 ?auto_47507 ) ) ( not ( = ?auto_47509 ?auto_47510 ) ) ( not ( = ?auto_47509 ?auto_47513 ) ) ( not ( = ?auto_47509 ?auto_47508 ) ) ( not ( = ?auto_47509 ?auto_47507 ) ) ( not ( = ?auto_47510 ?auto_47513 ) ) ( not ( = ?auto_47510 ?auto_47508 ) ) ( not ( = ?auto_47510 ?auto_47507 ) ) ( ON ?auto_47507 ?auto_47511 ) ( not ( = ?auto_47507 ?auto_47511 ) ) ( not ( = ?auto_47508 ?auto_47511 ) ) ( not ( = ?auto_47513 ?auto_47511 ) ) ( not ( = ?auto_47512 ?auto_47511 ) ) ( not ( = ?auto_47509 ?auto_47511 ) ) ( not ( = ?auto_47510 ?auto_47511 ) ) ( ON ?auto_47508 ?auto_47507 ) ( ON-TABLE ?auto_47511 ) ( ON ?auto_47513 ?auto_47508 ) ( ON ?auto_47510 ?auto_47513 ) ( CLEAR ?auto_47510 ) ( HOLDING ?auto_47509 ) ( CLEAR ?auto_47512 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47512 ?auto_47509 )
      ( MAKE-2PILE ?auto_47507 ?auto_47508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47514 - BLOCK
      ?auto_47515 - BLOCK
    )
    :vars
    (
      ?auto_47518 - BLOCK
      ?auto_47517 - BLOCK
      ?auto_47520 - BLOCK
      ?auto_47516 - BLOCK
      ?auto_47519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47514 ?auto_47515 ) ) ( not ( = ?auto_47514 ?auto_47518 ) ) ( not ( = ?auto_47515 ?auto_47518 ) ) ( ON-TABLE ?auto_47517 ) ( not ( = ?auto_47517 ?auto_47520 ) ) ( not ( = ?auto_47517 ?auto_47516 ) ) ( not ( = ?auto_47517 ?auto_47518 ) ) ( not ( = ?auto_47517 ?auto_47515 ) ) ( not ( = ?auto_47517 ?auto_47514 ) ) ( not ( = ?auto_47520 ?auto_47516 ) ) ( not ( = ?auto_47520 ?auto_47518 ) ) ( not ( = ?auto_47520 ?auto_47515 ) ) ( not ( = ?auto_47520 ?auto_47514 ) ) ( not ( = ?auto_47516 ?auto_47518 ) ) ( not ( = ?auto_47516 ?auto_47515 ) ) ( not ( = ?auto_47516 ?auto_47514 ) ) ( ON ?auto_47514 ?auto_47519 ) ( not ( = ?auto_47514 ?auto_47519 ) ) ( not ( = ?auto_47515 ?auto_47519 ) ) ( not ( = ?auto_47518 ?auto_47519 ) ) ( not ( = ?auto_47517 ?auto_47519 ) ) ( not ( = ?auto_47520 ?auto_47519 ) ) ( not ( = ?auto_47516 ?auto_47519 ) ) ( ON ?auto_47515 ?auto_47514 ) ( ON-TABLE ?auto_47519 ) ( ON ?auto_47518 ?auto_47515 ) ( ON ?auto_47516 ?auto_47518 ) ( CLEAR ?auto_47517 ) ( ON ?auto_47520 ?auto_47516 ) ( CLEAR ?auto_47520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47519 ?auto_47514 ?auto_47515 ?auto_47518 ?auto_47516 )
      ( MAKE-2PILE ?auto_47514 ?auto_47515 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47521 - BLOCK
      ?auto_47522 - BLOCK
    )
    :vars
    (
      ?auto_47527 - BLOCK
      ?auto_47523 - BLOCK
      ?auto_47526 - BLOCK
      ?auto_47524 - BLOCK
      ?auto_47525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47521 ?auto_47522 ) ) ( not ( = ?auto_47521 ?auto_47527 ) ) ( not ( = ?auto_47522 ?auto_47527 ) ) ( not ( = ?auto_47523 ?auto_47526 ) ) ( not ( = ?auto_47523 ?auto_47524 ) ) ( not ( = ?auto_47523 ?auto_47527 ) ) ( not ( = ?auto_47523 ?auto_47522 ) ) ( not ( = ?auto_47523 ?auto_47521 ) ) ( not ( = ?auto_47526 ?auto_47524 ) ) ( not ( = ?auto_47526 ?auto_47527 ) ) ( not ( = ?auto_47526 ?auto_47522 ) ) ( not ( = ?auto_47526 ?auto_47521 ) ) ( not ( = ?auto_47524 ?auto_47527 ) ) ( not ( = ?auto_47524 ?auto_47522 ) ) ( not ( = ?auto_47524 ?auto_47521 ) ) ( ON ?auto_47521 ?auto_47525 ) ( not ( = ?auto_47521 ?auto_47525 ) ) ( not ( = ?auto_47522 ?auto_47525 ) ) ( not ( = ?auto_47527 ?auto_47525 ) ) ( not ( = ?auto_47523 ?auto_47525 ) ) ( not ( = ?auto_47526 ?auto_47525 ) ) ( not ( = ?auto_47524 ?auto_47525 ) ) ( ON ?auto_47522 ?auto_47521 ) ( ON-TABLE ?auto_47525 ) ( ON ?auto_47527 ?auto_47522 ) ( ON ?auto_47524 ?auto_47527 ) ( ON ?auto_47526 ?auto_47524 ) ( CLEAR ?auto_47526 ) ( HOLDING ?auto_47523 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47523 )
      ( MAKE-2PILE ?auto_47521 ?auto_47522 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47528 - BLOCK
      ?auto_47529 - BLOCK
    )
    :vars
    (
      ?auto_47530 - BLOCK
      ?auto_47534 - BLOCK
      ?auto_47533 - BLOCK
      ?auto_47531 - BLOCK
      ?auto_47532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47528 ?auto_47529 ) ) ( not ( = ?auto_47528 ?auto_47530 ) ) ( not ( = ?auto_47529 ?auto_47530 ) ) ( not ( = ?auto_47534 ?auto_47533 ) ) ( not ( = ?auto_47534 ?auto_47531 ) ) ( not ( = ?auto_47534 ?auto_47530 ) ) ( not ( = ?auto_47534 ?auto_47529 ) ) ( not ( = ?auto_47534 ?auto_47528 ) ) ( not ( = ?auto_47533 ?auto_47531 ) ) ( not ( = ?auto_47533 ?auto_47530 ) ) ( not ( = ?auto_47533 ?auto_47529 ) ) ( not ( = ?auto_47533 ?auto_47528 ) ) ( not ( = ?auto_47531 ?auto_47530 ) ) ( not ( = ?auto_47531 ?auto_47529 ) ) ( not ( = ?auto_47531 ?auto_47528 ) ) ( ON ?auto_47528 ?auto_47532 ) ( not ( = ?auto_47528 ?auto_47532 ) ) ( not ( = ?auto_47529 ?auto_47532 ) ) ( not ( = ?auto_47530 ?auto_47532 ) ) ( not ( = ?auto_47534 ?auto_47532 ) ) ( not ( = ?auto_47533 ?auto_47532 ) ) ( not ( = ?auto_47531 ?auto_47532 ) ) ( ON ?auto_47529 ?auto_47528 ) ( ON-TABLE ?auto_47532 ) ( ON ?auto_47530 ?auto_47529 ) ( ON ?auto_47531 ?auto_47530 ) ( ON ?auto_47533 ?auto_47531 ) ( ON ?auto_47534 ?auto_47533 ) ( CLEAR ?auto_47534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47532 ?auto_47528 ?auto_47529 ?auto_47530 ?auto_47531 ?auto_47533 )
      ( MAKE-2PILE ?auto_47528 ?auto_47529 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47538 - BLOCK
      ?auto_47539 - BLOCK
      ?auto_47540 - BLOCK
    )
    :vars
    (
      ?auto_47541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47541 ?auto_47540 ) ( CLEAR ?auto_47541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47538 ) ( ON ?auto_47539 ?auto_47538 ) ( ON ?auto_47540 ?auto_47539 ) ( not ( = ?auto_47538 ?auto_47539 ) ) ( not ( = ?auto_47538 ?auto_47540 ) ) ( not ( = ?auto_47538 ?auto_47541 ) ) ( not ( = ?auto_47539 ?auto_47540 ) ) ( not ( = ?auto_47539 ?auto_47541 ) ) ( not ( = ?auto_47540 ?auto_47541 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47541 ?auto_47540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47542 - BLOCK
      ?auto_47543 - BLOCK
      ?auto_47544 - BLOCK
    )
    :vars
    (
      ?auto_47545 - BLOCK
      ?auto_47546 - BLOCK
      ?auto_47547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47545 ?auto_47544 ) ( CLEAR ?auto_47545 ) ( ON-TABLE ?auto_47542 ) ( ON ?auto_47543 ?auto_47542 ) ( ON ?auto_47544 ?auto_47543 ) ( not ( = ?auto_47542 ?auto_47543 ) ) ( not ( = ?auto_47542 ?auto_47544 ) ) ( not ( = ?auto_47542 ?auto_47545 ) ) ( not ( = ?auto_47543 ?auto_47544 ) ) ( not ( = ?auto_47543 ?auto_47545 ) ) ( not ( = ?auto_47544 ?auto_47545 ) ) ( HOLDING ?auto_47546 ) ( CLEAR ?auto_47547 ) ( not ( = ?auto_47542 ?auto_47546 ) ) ( not ( = ?auto_47542 ?auto_47547 ) ) ( not ( = ?auto_47543 ?auto_47546 ) ) ( not ( = ?auto_47543 ?auto_47547 ) ) ( not ( = ?auto_47544 ?auto_47546 ) ) ( not ( = ?auto_47544 ?auto_47547 ) ) ( not ( = ?auto_47545 ?auto_47546 ) ) ( not ( = ?auto_47545 ?auto_47547 ) ) ( not ( = ?auto_47546 ?auto_47547 ) ) )
    :subtasks
    ( ( !STACK ?auto_47546 ?auto_47547 )
      ( MAKE-3PILE ?auto_47542 ?auto_47543 ?auto_47544 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47548 - BLOCK
      ?auto_47549 - BLOCK
      ?auto_47550 - BLOCK
    )
    :vars
    (
      ?auto_47553 - BLOCK
      ?auto_47551 - BLOCK
      ?auto_47552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47553 ?auto_47550 ) ( ON-TABLE ?auto_47548 ) ( ON ?auto_47549 ?auto_47548 ) ( ON ?auto_47550 ?auto_47549 ) ( not ( = ?auto_47548 ?auto_47549 ) ) ( not ( = ?auto_47548 ?auto_47550 ) ) ( not ( = ?auto_47548 ?auto_47553 ) ) ( not ( = ?auto_47549 ?auto_47550 ) ) ( not ( = ?auto_47549 ?auto_47553 ) ) ( not ( = ?auto_47550 ?auto_47553 ) ) ( CLEAR ?auto_47551 ) ( not ( = ?auto_47548 ?auto_47552 ) ) ( not ( = ?auto_47548 ?auto_47551 ) ) ( not ( = ?auto_47549 ?auto_47552 ) ) ( not ( = ?auto_47549 ?auto_47551 ) ) ( not ( = ?auto_47550 ?auto_47552 ) ) ( not ( = ?auto_47550 ?auto_47551 ) ) ( not ( = ?auto_47553 ?auto_47552 ) ) ( not ( = ?auto_47553 ?auto_47551 ) ) ( not ( = ?auto_47552 ?auto_47551 ) ) ( ON ?auto_47552 ?auto_47553 ) ( CLEAR ?auto_47552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47548 ?auto_47549 ?auto_47550 ?auto_47553 )
      ( MAKE-3PILE ?auto_47548 ?auto_47549 ?auto_47550 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47554 - BLOCK
      ?auto_47555 - BLOCK
      ?auto_47556 - BLOCK
    )
    :vars
    (
      ?auto_47559 - BLOCK
      ?auto_47558 - BLOCK
      ?auto_47557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47559 ?auto_47556 ) ( ON-TABLE ?auto_47554 ) ( ON ?auto_47555 ?auto_47554 ) ( ON ?auto_47556 ?auto_47555 ) ( not ( = ?auto_47554 ?auto_47555 ) ) ( not ( = ?auto_47554 ?auto_47556 ) ) ( not ( = ?auto_47554 ?auto_47559 ) ) ( not ( = ?auto_47555 ?auto_47556 ) ) ( not ( = ?auto_47555 ?auto_47559 ) ) ( not ( = ?auto_47556 ?auto_47559 ) ) ( not ( = ?auto_47554 ?auto_47558 ) ) ( not ( = ?auto_47554 ?auto_47557 ) ) ( not ( = ?auto_47555 ?auto_47558 ) ) ( not ( = ?auto_47555 ?auto_47557 ) ) ( not ( = ?auto_47556 ?auto_47558 ) ) ( not ( = ?auto_47556 ?auto_47557 ) ) ( not ( = ?auto_47559 ?auto_47558 ) ) ( not ( = ?auto_47559 ?auto_47557 ) ) ( not ( = ?auto_47558 ?auto_47557 ) ) ( ON ?auto_47558 ?auto_47559 ) ( CLEAR ?auto_47558 ) ( HOLDING ?auto_47557 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47557 )
      ( MAKE-3PILE ?auto_47554 ?auto_47555 ?auto_47556 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47560 - BLOCK
      ?auto_47561 - BLOCK
      ?auto_47562 - BLOCK
    )
    :vars
    (
      ?auto_47565 - BLOCK
      ?auto_47564 - BLOCK
      ?auto_47563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47565 ?auto_47562 ) ( ON-TABLE ?auto_47560 ) ( ON ?auto_47561 ?auto_47560 ) ( ON ?auto_47562 ?auto_47561 ) ( not ( = ?auto_47560 ?auto_47561 ) ) ( not ( = ?auto_47560 ?auto_47562 ) ) ( not ( = ?auto_47560 ?auto_47565 ) ) ( not ( = ?auto_47561 ?auto_47562 ) ) ( not ( = ?auto_47561 ?auto_47565 ) ) ( not ( = ?auto_47562 ?auto_47565 ) ) ( not ( = ?auto_47560 ?auto_47564 ) ) ( not ( = ?auto_47560 ?auto_47563 ) ) ( not ( = ?auto_47561 ?auto_47564 ) ) ( not ( = ?auto_47561 ?auto_47563 ) ) ( not ( = ?auto_47562 ?auto_47564 ) ) ( not ( = ?auto_47562 ?auto_47563 ) ) ( not ( = ?auto_47565 ?auto_47564 ) ) ( not ( = ?auto_47565 ?auto_47563 ) ) ( not ( = ?auto_47564 ?auto_47563 ) ) ( ON ?auto_47564 ?auto_47565 ) ( ON ?auto_47563 ?auto_47564 ) ( CLEAR ?auto_47563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47560 ?auto_47561 ?auto_47562 ?auto_47565 ?auto_47564 )
      ( MAKE-3PILE ?auto_47560 ?auto_47561 ?auto_47562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47566 - BLOCK
      ?auto_47567 - BLOCK
      ?auto_47568 - BLOCK
    )
    :vars
    (
      ?auto_47570 - BLOCK
      ?auto_47569 - BLOCK
      ?auto_47571 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47570 ?auto_47568 ) ( ON-TABLE ?auto_47566 ) ( ON ?auto_47567 ?auto_47566 ) ( ON ?auto_47568 ?auto_47567 ) ( not ( = ?auto_47566 ?auto_47567 ) ) ( not ( = ?auto_47566 ?auto_47568 ) ) ( not ( = ?auto_47566 ?auto_47570 ) ) ( not ( = ?auto_47567 ?auto_47568 ) ) ( not ( = ?auto_47567 ?auto_47570 ) ) ( not ( = ?auto_47568 ?auto_47570 ) ) ( not ( = ?auto_47566 ?auto_47569 ) ) ( not ( = ?auto_47566 ?auto_47571 ) ) ( not ( = ?auto_47567 ?auto_47569 ) ) ( not ( = ?auto_47567 ?auto_47571 ) ) ( not ( = ?auto_47568 ?auto_47569 ) ) ( not ( = ?auto_47568 ?auto_47571 ) ) ( not ( = ?auto_47570 ?auto_47569 ) ) ( not ( = ?auto_47570 ?auto_47571 ) ) ( not ( = ?auto_47569 ?auto_47571 ) ) ( ON ?auto_47569 ?auto_47570 ) ( HOLDING ?auto_47571 ) ( CLEAR ?auto_47569 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47566 ?auto_47567 ?auto_47568 ?auto_47570 ?auto_47569 ?auto_47571 )
      ( MAKE-3PILE ?auto_47566 ?auto_47567 ?auto_47568 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47572 - BLOCK
      ?auto_47573 - BLOCK
      ?auto_47574 - BLOCK
    )
    :vars
    (
      ?auto_47576 - BLOCK
      ?auto_47577 - BLOCK
      ?auto_47575 - BLOCK
      ?auto_47578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47576 ?auto_47574 ) ( ON-TABLE ?auto_47572 ) ( ON ?auto_47573 ?auto_47572 ) ( ON ?auto_47574 ?auto_47573 ) ( not ( = ?auto_47572 ?auto_47573 ) ) ( not ( = ?auto_47572 ?auto_47574 ) ) ( not ( = ?auto_47572 ?auto_47576 ) ) ( not ( = ?auto_47573 ?auto_47574 ) ) ( not ( = ?auto_47573 ?auto_47576 ) ) ( not ( = ?auto_47574 ?auto_47576 ) ) ( not ( = ?auto_47572 ?auto_47577 ) ) ( not ( = ?auto_47572 ?auto_47575 ) ) ( not ( = ?auto_47573 ?auto_47577 ) ) ( not ( = ?auto_47573 ?auto_47575 ) ) ( not ( = ?auto_47574 ?auto_47577 ) ) ( not ( = ?auto_47574 ?auto_47575 ) ) ( not ( = ?auto_47576 ?auto_47577 ) ) ( not ( = ?auto_47576 ?auto_47575 ) ) ( not ( = ?auto_47577 ?auto_47575 ) ) ( ON ?auto_47577 ?auto_47576 ) ( CLEAR ?auto_47577 ) ( ON ?auto_47575 ?auto_47578 ) ( CLEAR ?auto_47575 ) ( HAND-EMPTY ) ( not ( = ?auto_47572 ?auto_47578 ) ) ( not ( = ?auto_47573 ?auto_47578 ) ) ( not ( = ?auto_47574 ?auto_47578 ) ) ( not ( = ?auto_47576 ?auto_47578 ) ) ( not ( = ?auto_47577 ?auto_47578 ) ) ( not ( = ?auto_47575 ?auto_47578 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47575 ?auto_47578 )
      ( MAKE-3PILE ?auto_47572 ?auto_47573 ?auto_47574 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47579 - BLOCK
      ?auto_47580 - BLOCK
      ?auto_47581 - BLOCK
    )
    :vars
    (
      ?auto_47582 - BLOCK
      ?auto_47585 - BLOCK
      ?auto_47584 - BLOCK
      ?auto_47583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47582 ?auto_47581 ) ( ON-TABLE ?auto_47579 ) ( ON ?auto_47580 ?auto_47579 ) ( ON ?auto_47581 ?auto_47580 ) ( not ( = ?auto_47579 ?auto_47580 ) ) ( not ( = ?auto_47579 ?auto_47581 ) ) ( not ( = ?auto_47579 ?auto_47582 ) ) ( not ( = ?auto_47580 ?auto_47581 ) ) ( not ( = ?auto_47580 ?auto_47582 ) ) ( not ( = ?auto_47581 ?auto_47582 ) ) ( not ( = ?auto_47579 ?auto_47585 ) ) ( not ( = ?auto_47579 ?auto_47584 ) ) ( not ( = ?auto_47580 ?auto_47585 ) ) ( not ( = ?auto_47580 ?auto_47584 ) ) ( not ( = ?auto_47581 ?auto_47585 ) ) ( not ( = ?auto_47581 ?auto_47584 ) ) ( not ( = ?auto_47582 ?auto_47585 ) ) ( not ( = ?auto_47582 ?auto_47584 ) ) ( not ( = ?auto_47585 ?auto_47584 ) ) ( ON ?auto_47584 ?auto_47583 ) ( CLEAR ?auto_47584 ) ( not ( = ?auto_47579 ?auto_47583 ) ) ( not ( = ?auto_47580 ?auto_47583 ) ) ( not ( = ?auto_47581 ?auto_47583 ) ) ( not ( = ?auto_47582 ?auto_47583 ) ) ( not ( = ?auto_47585 ?auto_47583 ) ) ( not ( = ?auto_47584 ?auto_47583 ) ) ( HOLDING ?auto_47585 ) ( CLEAR ?auto_47582 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47579 ?auto_47580 ?auto_47581 ?auto_47582 ?auto_47585 )
      ( MAKE-3PILE ?auto_47579 ?auto_47580 ?auto_47581 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47586 - BLOCK
      ?auto_47587 - BLOCK
      ?auto_47588 - BLOCK
    )
    :vars
    (
      ?auto_47591 - BLOCK
      ?auto_47589 - BLOCK
      ?auto_47590 - BLOCK
      ?auto_47592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47591 ?auto_47588 ) ( ON-TABLE ?auto_47586 ) ( ON ?auto_47587 ?auto_47586 ) ( ON ?auto_47588 ?auto_47587 ) ( not ( = ?auto_47586 ?auto_47587 ) ) ( not ( = ?auto_47586 ?auto_47588 ) ) ( not ( = ?auto_47586 ?auto_47591 ) ) ( not ( = ?auto_47587 ?auto_47588 ) ) ( not ( = ?auto_47587 ?auto_47591 ) ) ( not ( = ?auto_47588 ?auto_47591 ) ) ( not ( = ?auto_47586 ?auto_47589 ) ) ( not ( = ?auto_47586 ?auto_47590 ) ) ( not ( = ?auto_47587 ?auto_47589 ) ) ( not ( = ?auto_47587 ?auto_47590 ) ) ( not ( = ?auto_47588 ?auto_47589 ) ) ( not ( = ?auto_47588 ?auto_47590 ) ) ( not ( = ?auto_47591 ?auto_47589 ) ) ( not ( = ?auto_47591 ?auto_47590 ) ) ( not ( = ?auto_47589 ?auto_47590 ) ) ( ON ?auto_47590 ?auto_47592 ) ( not ( = ?auto_47586 ?auto_47592 ) ) ( not ( = ?auto_47587 ?auto_47592 ) ) ( not ( = ?auto_47588 ?auto_47592 ) ) ( not ( = ?auto_47591 ?auto_47592 ) ) ( not ( = ?auto_47589 ?auto_47592 ) ) ( not ( = ?auto_47590 ?auto_47592 ) ) ( CLEAR ?auto_47591 ) ( ON ?auto_47589 ?auto_47590 ) ( CLEAR ?auto_47589 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47592 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47592 ?auto_47590 )
      ( MAKE-3PILE ?auto_47586 ?auto_47587 ?auto_47588 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47607 - BLOCK
      ?auto_47608 - BLOCK
      ?auto_47609 - BLOCK
    )
    :vars
    (
      ?auto_47610 - BLOCK
      ?auto_47612 - BLOCK
      ?auto_47611 - BLOCK
      ?auto_47613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47607 ) ( ON ?auto_47608 ?auto_47607 ) ( not ( = ?auto_47607 ?auto_47608 ) ) ( not ( = ?auto_47607 ?auto_47609 ) ) ( not ( = ?auto_47607 ?auto_47610 ) ) ( not ( = ?auto_47608 ?auto_47609 ) ) ( not ( = ?auto_47608 ?auto_47610 ) ) ( not ( = ?auto_47609 ?auto_47610 ) ) ( not ( = ?auto_47607 ?auto_47612 ) ) ( not ( = ?auto_47607 ?auto_47611 ) ) ( not ( = ?auto_47608 ?auto_47612 ) ) ( not ( = ?auto_47608 ?auto_47611 ) ) ( not ( = ?auto_47609 ?auto_47612 ) ) ( not ( = ?auto_47609 ?auto_47611 ) ) ( not ( = ?auto_47610 ?auto_47612 ) ) ( not ( = ?auto_47610 ?auto_47611 ) ) ( not ( = ?auto_47612 ?auto_47611 ) ) ( ON ?auto_47611 ?auto_47613 ) ( not ( = ?auto_47607 ?auto_47613 ) ) ( not ( = ?auto_47608 ?auto_47613 ) ) ( not ( = ?auto_47609 ?auto_47613 ) ) ( not ( = ?auto_47610 ?auto_47613 ) ) ( not ( = ?auto_47612 ?auto_47613 ) ) ( not ( = ?auto_47611 ?auto_47613 ) ) ( ON ?auto_47612 ?auto_47611 ) ( ON-TABLE ?auto_47613 ) ( ON ?auto_47610 ?auto_47612 ) ( CLEAR ?auto_47610 ) ( HOLDING ?auto_47609 ) ( CLEAR ?auto_47608 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47607 ?auto_47608 ?auto_47609 ?auto_47610 )
      ( MAKE-3PILE ?auto_47607 ?auto_47608 ?auto_47609 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47614 - BLOCK
      ?auto_47615 - BLOCK
      ?auto_47616 - BLOCK
    )
    :vars
    (
      ?auto_47619 - BLOCK
      ?auto_47617 - BLOCK
      ?auto_47618 - BLOCK
      ?auto_47620 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47614 ) ( ON ?auto_47615 ?auto_47614 ) ( not ( = ?auto_47614 ?auto_47615 ) ) ( not ( = ?auto_47614 ?auto_47616 ) ) ( not ( = ?auto_47614 ?auto_47619 ) ) ( not ( = ?auto_47615 ?auto_47616 ) ) ( not ( = ?auto_47615 ?auto_47619 ) ) ( not ( = ?auto_47616 ?auto_47619 ) ) ( not ( = ?auto_47614 ?auto_47617 ) ) ( not ( = ?auto_47614 ?auto_47618 ) ) ( not ( = ?auto_47615 ?auto_47617 ) ) ( not ( = ?auto_47615 ?auto_47618 ) ) ( not ( = ?auto_47616 ?auto_47617 ) ) ( not ( = ?auto_47616 ?auto_47618 ) ) ( not ( = ?auto_47619 ?auto_47617 ) ) ( not ( = ?auto_47619 ?auto_47618 ) ) ( not ( = ?auto_47617 ?auto_47618 ) ) ( ON ?auto_47618 ?auto_47620 ) ( not ( = ?auto_47614 ?auto_47620 ) ) ( not ( = ?auto_47615 ?auto_47620 ) ) ( not ( = ?auto_47616 ?auto_47620 ) ) ( not ( = ?auto_47619 ?auto_47620 ) ) ( not ( = ?auto_47617 ?auto_47620 ) ) ( not ( = ?auto_47618 ?auto_47620 ) ) ( ON ?auto_47617 ?auto_47618 ) ( ON-TABLE ?auto_47620 ) ( ON ?auto_47619 ?auto_47617 ) ( CLEAR ?auto_47615 ) ( ON ?auto_47616 ?auto_47619 ) ( CLEAR ?auto_47616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47620 ?auto_47618 ?auto_47617 ?auto_47619 )
      ( MAKE-3PILE ?auto_47614 ?auto_47615 ?auto_47616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47621 - BLOCK
      ?auto_47622 - BLOCK
      ?auto_47623 - BLOCK
    )
    :vars
    (
      ?auto_47627 - BLOCK
      ?auto_47626 - BLOCK
      ?auto_47625 - BLOCK
      ?auto_47624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47621 ) ( not ( = ?auto_47621 ?auto_47622 ) ) ( not ( = ?auto_47621 ?auto_47623 ) ) ( not ( = ?auto_47621 ?auto_47627 ) ) ( not ( = ?auto_47622 ?auto_47623 ) ) ( not ( = ?auto_47622 ?auto_47627 ) ) ( not ( = ?auto_47623 ?auto_47627 ) ) ( not ( = ?auto_47621 ?auto_47626 ) ) ( not ( = ?auto_47621 ?auto_47625 ) ) ( not ( = ?auto_47622 ?auto_47626 ) ) ( not ( = ?auto_47622 ?auto_47625 ) ) ( not ( = ?auto_47623 ?auto_47626 ) ) ( not ( = ?auto_47623 ?auto_47625 ) ) ( not ( = ?auto_47627 ?auto_47626 ) ) ( not ( = ?auto_47627 ?auto_47625 ) ) ( not ( = ?auto_47626 ?auto_47625 ) ) ( ON ?auto_47625 ?auto_47624 ) ( not ( = ?auto_47621 ?auto_47624 ) ) ( not ( = ?auto_47622 ?auto_47624 ) ) ( not ( = ?auto_47623 ?auto_47624 ) ) ( not ( = ?auto_47627 ?auto_47624 ) ) ( not ( = ?auto_47626 ?auto_47624 ) ) ( not ( = ?auto_47625 ?auto_47624 ) ) ( ON ?auto_47626 ?auto_47625 ) ( ON-TABLE ?auto_47624 ) ( ON ?auto_47627 ?auto_47626 ) ( ON ?auto_47623 ?auto_47627 ) ( CLEAR ?auto_47623 ) ( HOLDING ?auto_47622 ) ( CLEAR ?auto_47621 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47621 ?auto_47622 )
      ( MAKE-3PILE ?auto_47621 ?auto_47622 ?auto_47623 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47628 - BLOCK
      ?auto_47629 - BLOCK
      ?auto_47630 - BLOCK
    )
    :vars
    (
      ?auto_47633 - BLOCK
      ?auto_47631 - BLOCK
      ?auto_47634 - BLOCK
      ?auto_47632 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47628 ) ( not ( = ?auto_47628 ?auto_47629 ) ) ( not ( = ?auto_47628 ?auto_47630 ) ) ( not ( = ?auto_47628 ?auto_47633 ) ) ( not ( = ?auto_47629 ?auto_47630 ) ) ( not ( = ?auto_47629 ?auto_47633 ) ) ( not ( = ?auto_47630 ?auto_47633 ) ) ( not ( = ?auto_47628 ?auto_47631 ) ) ( not ( = ?auto_47628 ?auto_47634 ) ) ( not ( = ?auto_47629 ?auto_47631 ) ) ( not ( = ?auto_47629 ?auto_47634 ) ) ( not ( = ?auto_47630 ?auto_47631 ) ) ( not ( = ?auto_47630 ?auto_47634 ) ) ( not ( = ?auto_47633 ?auto_47631 ) ) ( not ( = ?auto_47633 ?auto_47634 ) ) ( not ( = ?auto_47631 ?auto_47634 ) ) ( ON ?auto_47634 ?auto_47632 ) ( not ( = ?auto_47628 ?auto_47632 ) ) ( not ( = ?auto_47629 ?auto_47632 ) ) ( not ( = ?auto_47630 ?auto_47632 ) ) ( not ( = ?auto_47633 ?auto_47632 ) ) ( not ( = ?auto_47631 ?auto_47632 ) ) ( not ( = ?auto_47634 ?auto_47632 ) ) ( ON ?auto_47631 ?auto_47634 ) ( ON-TABLE ?auto_47632 ) ( ON ?auto_47633 ?auto_47631 ) ( ON ?auto_47630 ?auto_47633 ) ( CLEAR ?auto_47628 ) ( ON ?auto_47629 ?auto_47630 ) ( CLEAR ?auto_47629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47632 ?auto_47634 ?auto_47631 ?auto_47633 ?auto_47630 )
      ( MAKE-3PILE ?auto_47628 ?auto_47629 ?auto_47630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47635 - BLOCK
      ?auto_47636 - BLOCK
      ?auto_47637 - BLOCK
    )
    :vars
    (
      ?auto_47641 - BLOCK
      ?auto_47639 - BLOCK
      ?auto_47638 - BLOCK
      ?auto_47640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47635 ?auto_47636 ) ) ( not ( = ?auto_47635 ?auto_47637 ) ) ( not ( = ?auto_47635 ?auto_47641 ) ) ( not ( = ?auto_47636 ?auto_47637 ) ) ( not ( = ?auto_47636 ?auto_47641 ) ) ( not ( = ?auto_47637 ?auto_47641 ) ) ( not ( = ?auto_47635 ?auto_47639 ) ) ( not ( = ?auto_47635 ?auto_47638 ) ) ( not ( = ?auto_47636 ?auto_47639 ) ) ( not ( = ?auto_47636 ?auto_47638 ) ) ( not ( = ?auto_47637 ?auto_47639 ) ) ( not ( = ?auto_47637 ?auto_47638 ) ) ( not ( = ?auto_47641 ?auto_47639 ) ) ( not ( = ?auto_47641 ?auto_47638 ) ) ( not ( = ?auto_47639 ?auto_47638 ) ) ( ON ?auto_47638 ?auto_47640 ) ( not ( = ?auto_47635 ?auto_47640 ) ) ( not ( = ?auto_47636 ?auto_47640 ) ) ( not ( = ?auto_47637 ?auto_47640 ) ) ( not ( = ?auto_47641 ?auto_47640 ) ) ( not ( = ?auto_47639 ?auto_47640 ) ) ( not ( = ?auto_47638 ?auto_47640 ) ) ( ON ?auto_47639 ?auto_47638 ) ( ON-TABLE ?auto_47640 ) ( ON ?auto_47641 ?auto_47639 ) ( ON ?auto_47637 ?auto_47641 ) ( ON ?auto_47636 ?auto_47637 ) ( CLEAR ?auto_47636 ) ( HOLDING ?auto_47635 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47635 )
      ( MAKE-3PILE ?auto_47635 ?auto_47636 ?auto_47637 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47642 - BLOCK
      ?auto_47643 - BLOCK
      ?auto_47644 - BLOCK
    )
    :vars
    (
      ?auto_47647 - BLOCK
      ?auto_47645 - BLOCK
      ?auto_47646 - BLOCK
      ?auto_47648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47642 ?auto_47643 ) ) ( not ( = ?auto_47642 ?auto_47644 ) ) ( not ( = ?auto_47642 ?auto_47647 ) ) ( not ( = ?auto_47643 ?auto_47644 ) ) ( not ( = ?auto_47643 ?auto_47647 ) ) ( not ( = ?auto_47644 ?auto_47647 ) ) ( not ( = ?auto_47642 ?auto_47645 ) ) ( not ( = ?auto_47642 ?auto_47646 ) ) ( not ( = ?auto_47643 ?auto_47645 ) ) ( not ( = ?auto_47643 ?auto_47646 ) ) ( not ( = ?auto_47644 ?auto_47645 ) ) ( not ( = ?auto_47644 ?auto_47646 ) ) ( not ( = ?auto_47647 ?auto_47645 ) ) ( not ( = ?auto_47647 ?auto_47646 ) ) ( not ( = ?auto_47645 ?auto_47646 ) ) ( ON ?auto_47646 ?auto_47648 ) ( not ( = ?auto_47642 ?auto_47648 ) ) ( not ( = ?auto_47643 ?auto_47648 ) ) ( not ( = ?auto_47644 ?auto_47648 ) ) ( not ( = ?auto_47647 ?auto_47648 ) ) ( not ( = ?auto_47645 ?auto_47648 ) ) ( not ( = ?auto_47646 ?auto_47648 ) ) ( ON ?auto_47645 ?auto_47646 ) ( ON-TABLE ?auto_47648 ) ( ON ?auto_47647 ?auto_47645 ) ( ON ?auto_47644 ?auto_47647 ) ( ON ?auto_47643 ?auto_47644 ) ( ON ?auto_47642 ?auto_47643 ) ( CLEAR ?auto_47642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47648 ?auto_47646 ?auto_47645 ?auto_47647 ?auto_47644 ?auto_47643 )
      ( MAKE-3PILE ?auto_47642 ?auto_47643 ?auto_47644 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47652 - BLOCK
      ?auto_47653 - BLOCK
      ?auto_47654 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47654 ) ( CLEAR ?auto_47653 ) ( ON-TABLE ?auto_47652 ) ( ON ?auto_47653 ?auto_47652 ) ( not ( = ?auto_47652 ?auto_47653 ) ) ( not ( = ?auto_47652 ?auto_47654 ) ) ( not ( = ?auto_47653 ?auto_47654 ) ) )
    :subtasks
    ( ( !STACK ?auto_47654 ?auto_47653 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47655 - BLOCK
      ?auto_47656 - BLOCK
      ?auto_47657 - BLOCK
    )
    :vars
    (
      ?auto_47658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47656 ) ( ON-TABLE ?auto_47655 ) ( ON ?auto_47656 ?auto_47655 ) ( not ( = ?auto_47655 ?auto_47656 ) ) ( not ( = ?auto_47655 ?auto_47657 ) ) ( not ( = ?auto_47656 ?auto_47657 ) ) ( ON ?auto_47657 ?auto_47658 ) ( CLEAR ?auto_47657 ) ( HAND-EMPTY ) ( not ( = ?auto_47655 ?auto_47658 ) ) ( not ( = ?auto_47656 ?auto_47658 ) ) ( not ( = ?auto_47657 ?auto_47658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47657 ?auto_47658 )
      ( MAKE-3PILE ?auto_47655 ?auto_47656 ?auto_47657 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47659 - BLOCK
      ?auto_47660 - BLOCK
      ?auto_47661 - BLOCK
    )
    :vars
    (
      ?auto_47662 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47659 ) ( not ( = ?auto_47659 ?auto_47660 ) ) ( not ( = ?auto_47659 ?auto_47661 ) ) ( not ( = ?auto_47660 ?auto_47661 ) ) ( ON ?auto_47661 ?auto_47662 ) ( CLEAR ?auto_47661 ) ( not ( = ?auto_47659 ?auto_47662 ) ) ( not ( = ?auto_47660 ?auto_47662 ) ) ( not ( = ?auto_47661 ?auto_47662 ) ) ( HOLDING ?auto_47660 ) ( CLEAR ?auto_47659 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47659 ?auto_47660 )
      ( MAKE-3PILE ?auto_47659 ?auto_47660 ?auto_47661 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47663 - BLOCK
      ?auto_47664 - BLOCK
      ?auto_47665 - BLOCK
    )
    :vars
    (
      ?auto_47666 - BLOCK
      ?auto_47667 - BLOCK
      ?auto_47668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47663 ) ( not ( = ?auto_47663 ?auto_47664 ) ) ( not ( = ?auto_47663 ?auto_47665 ) ) ( not ( = ?auto_47664 ?auto_47665 ) ) ( ON ?auto_47665 ?auto_47666 ) ( not ( = ?auto_47663 ?auto_47666 ) ) ( not ( = ?auto_47664 ?auto_47666 ) ) ( not ( = ?auto_47665 ?auto_47666 ) ) ( CLEAR ?auto_47663 ) ( ON ?auto_47664 ?auto_47665 ) ( CLEAR ?auto_47664 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47667 ) ( ON ?auto_47668 ?auto_47667 ) ( ON ?auto_47666 ?auto_47668 ) ( not ( = ?auto_47667 ?auto_47668 ) ) ( not ( = ?auto_47667 ?auto_47666 ) ) ( not ( = ?auto_47667 ?auto_47665 ) ) ( not ( = ?auto_47667 ?auto_47664 ) ) ( not ( = ?auto_47668 ?auto_47666 ) ) ( not ( = ?auto_47668 ?auto_47665 ) ) ( not ( = ?auto_47668 ?auto_47664 ) ) ( not ( = ?auto_47663 ?auto_47667 ) ) ( not ( = ?auto_47663 ?auto_47668 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47667 ?auto_47668 ?auto_47666 ?auto_47665 )
      ( MAKE-3PILE ?auto_47663 ?auto_47664 ?auto_47665 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47669 - BLOCK
      ?auto_47670 - BLOCK
      ?auto_47671 - BLOCK
    )
    :vars
    (
      ?auto_47674 - BLOCK
      ?auto_47672 - BLOCK
      ?auto_47673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47669 ?auto_47670 ) ) ( not ( = ?auto_47669 ?auto_47671 ) ) ( not ( = ?auto_47670 ?auto_47671 ) ) ( ON ?auto_47671 ?auto_47674 ) ( not ( = ?auto_47669 ?auto_47674 ) ) ( not ( = ?auto_47670 ?auto_47674 ) ) ( not ( = ?auto_47671 ?auto_47674 ) ) ( ON ?auto_47670 ?auto_47671 ) ( CLEAR ?auto_47670 ) ( ON-TABLE ?auto_47672 ) ( ON ?auto_47673 ?auto_47672 ) ( ON ?auto_47674 ?auto_47673 ) ( not ( = ?auto_47672 ?auto_47673 ) ) ( not ( = ?auto_47672 ?auto_47674 ) ) ( not ( = ?auto_47672 ?auto_47671 ) ) ( not ( = ?auto_47672 ?auto_47670 ) ) ( not ( = ?auto_47673 ?auto_47674 ) ) ( not ( = ?auto_47673 ?auto_47671 ) ) ( not ( = ?auto_47673 ?auto_47670 ) ) ( not ( = ?auto_47669 ?auto_47672 ) ) ( not ( = ?auto_47669 ?auto_47673 ) ) ( HOLDING ?auto_47669 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47669 )
      ( MAKE-3PILE ?auto_47669 ?auto_47670 ?auto_47671 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47675 - BLOCK
      ?auto_47676 - BLOCK
      ?auto_47677 - BLOCK
    )
    :vars
    (
      ?auto_47679 - BLOCK
      ?auto_47678 - BLOCK
      ?auto_47680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47675 ?auto_47676 ) ) ( not ( = ?auto_47675 ?auto_47677 ) ) ( not ( = ?auto_47676 ?auto_47677 ) ) ( ON ?auto_47677 ?auto_47679 ) ( not ( = ?auto_47675 ?auto_47679 ) ) ( not ( = ?auto_47676 ?auto_47679 ) ) ( not ( = ?auto_47677 ?auto_47679 ) ) ( ON ?auto_47676 ?auto_47677 ) ( ON-TABLE ?auto_47678 ) ( ON ?auto_47680 ?auto_47678 ) ( ON ?auto_47679 ?auto_47680 ) ( not ( = ?auto_47678 ?auto_47680 ) ) ( not ( = ?auto_47678 ?auto_47679 ) ) ( not ( = ?auto_47678 ?auto_47677 ) ) ( not ( = ?auto_47678 ?auto_47676 ) ) ( not ( = ?auto_47680 ?auto_47679 ) ) ( not ( = ?auto_47680 ?auto_47677 ) ) ( not ( = ?auto_47680 ?auto_47676 ) ) ( not ( = ?auto_47675 ?auto_47678 ) ) ( not ( = ?auto_47675 ?auto_47680 ) ) ( ON ?auto_47675 ?auto_47676 ) ( CLEAR ?auto_47675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47678 ?auto_47680 ?auto_47679 ?auto_47677 ?auto_47676 )
      ( MAKE-3PILE ?auto_47675 ?auto_47676 ?auto_47677 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47681 - BLOCK
      ?auto_47682 - BLOCK
      ?auto_47683 - BLOCK
    )
    :vars
    (
      ?auto_47685 - BLOCK
      ?auto_47684 - BLOCK
      ?auto_47686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47681 ?auto_47682 ) ) ( not ( = ?auto_47681 ?auto_47683 ) ) ( not ( = ?auto_47682 ?auto_47683 ) ) ( ON ?auto_47683 ?auto_47685 ) ( not ( = ?auto_47681 ?auto_47685 ) ) ( not ( = ?auto_47682 ?auto_47685 ) ) ( not ( = ?auto_47683 ?auto_47685 ) ) ( ON ?auto_47682 ?auto_47683 ) ( ON-TABLE ?auto_47684 ) ( ON ?auto_47686 ?auto_47684 ) ( ON ?auto_47685 ?auto_47686 ) ( not ( = ?auto_47684 ?auto_47686 ) ) ( not ( = ?auto_47684 ?auto_47685 ) ) ( not ( = ?auto_47684 ?auto_47683 ) ) ( not ( = ?auto_47684 ?auto_47682 ) ) ( not ( = ?auto_47686 ?auto_47685 ) ) ( not ( = ?auto_47686 ?auto_47683 ) ) ( not ( = ?auto_47686 ?auto_47682 ) ) ( not ( = ?auto_47681 ?auto_47684 ) ) ( not ( = ?auto_47681 ?auto_47686 ) ) ( HOLDING ?auto_47681 ) ( CLEAR ?auto_47682 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47684 ?auto_47686 ?auto_47685 ?auto_47683 ?auto_47682 ?auto_47681 )
      ( MAKE-3PILE ?auto_47681 ?auto_47682 ?auto_47683 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47687 - BLOCK
      ?auto_47688 - BLOCK
      ?auto_47689 - BLOCK
    )
    :vars
    (
      ?auto_47690 - BLOCK
      ?auto_47692 - BLOCK
      ?auto_47691 - BLOCK
      ?auto_47693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47687 ?auto_47688 ) ) ( not ( = ?auto_47687 ?auto_47689 ) ) ( not ( = ?auto_47688 ?auto_47689 ) ) ( ON ?auto_47689 ?auto_47690 ) ( not ( = ?auto_47687 ?auto_47690 ) ) ( not ( = ?auto_47688 ?auto_47690 ) ) ( not ( = ?auto_47689 ?auto_47690 ) ) ( ON ?auto_47688 ?auto_47689 ) ( ON-TABLE ?auto_47692 ) ( ON ?auto_47691 ?auto_47692 ) ( ON ?auto_47690 ?auto_47691 ) ( not ( = ?auto_47692 ?auto_47691 ) ) ( not ( = ?auto_47692 ?auto_47690 ) ) ( not ( = ?auto_47692 ?auto_47689 ) ) ( not ( = ?auto_47692 ?auto_47688 ) ) ( not ( = ?auto_47691 ?auto_47690 ) ) ( not ( = ?auto_47691 ?auto_47689 ) ) ( not ( = ?auto_47691 ?auto_47688 ) ) ( not ( = ?auto_47687 ?auto_47692 ) ) ( not ( = ?auto_47687 ?auto_47691 ) ) ( CLEAR ?auto_47688 ) ( ON ?auto_47687 ?auto_47693 ) ( CLEAR ?auto_47687 ) ( HAND-EMPTY ) ( not ( = ?auto_47687 ?auto_47693 ) ) ( not ( = ?auto_47688 ?auto_47693 ) ) ( not ( = ?auto_47689 ?auto_47693 ) ) ( not ( = ?auto_47690 ?auto_47693 ) ) ( not ( = ?auto_47692 ?auto_47693 ) ) ( not ( = ?auto_47691 ?auto_47693 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47687 ?auto_47693 )
      ( MAKE-3PILE ?auto_47687 ?auto_47688 ?auto_47689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47694 - BLOCK
      ?auto_47695 - BLOCK
      ?auto_47696 - BLOCK
    )
    :vars
    (
      ?auto_47699 - BLOCK
      ?auto_47700 - BLOCK
      ?auto_47698 - BLOCK
      ?auto_47697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47694 ?auto_47695 ) ) ( not ( = ?auto_47694 ?auto_47696 ) ) ( not ( = ?auto_47695 ?auto_47696 ) ) ( ON ?auto_47696 ?auto_47699 ) ( not ( = ?auto_47694 ?auto_47699 ) ) ( not ( = ?auto_47695 ?auto_47699 ) ) ( not ( = ?auto_47696 ?auto_47699 ) ) ( ON-TABLE ?auto_47700 ) ( ON ?auto_47698 ?auto_47700 ) ( ON ?auto_47699 ?auto_47698 ) ( not ( = ?auto_47700 ?auto_47698 ) ) ( not ( = ?auto_47700 ?auto_47699 ) ) ( not ( = ?auto_47700 ?auto_47696 ) ) ( not ( = ?auto_47700 ?auto_47695 ) ) ( not ( = ?auto_47698 ?auto_47699 ) ) ( not ( = ?auto_47698 ?auto_47696 ) ) ( not ( = ?auto_47698 ?auto_47695 ) ) ( not ( = ?auto_47694 ?auto_47700 ) ) ( not ( = ?auto_47694 ?auto_47698 ) ) ( ON ?auto_47694 ?auto_47697 ) ( CLEAR ?auto_47694 ) ( not ( = ?auto_47694 ?auto_47697 ) ) ( not ( = ?auto_47695 ?auto_47697 ) ) ( not ( = ?auto_47696 ?auto_47697 ) ) ( not ( = ?auto_47699 ?auto_47697 ) ) ( not ( = ?auto_47700 ?auto_47697 ) ) ( not ( = ?auto_47698 ?auto_47697 ) ) ( HOLDING ?auto_47695 ) ( CLEAR ?auto_47696 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47700 ?auto_47698 ?auto_47699 ?auto_47696 ?auto_47695 )
      ( MAKE-3PILE ?auto_47694 ?auto_47695 ?auto_47696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47701 - BLOCK
      ?auto_47702 - BLOCK
      ?auto_47703 - BLOCK
    )
    :vars
    (
      ?auto_47704 - BLOCK
      ?auto_47707 - BLOCK
      ?auto_47706 - BLOCK
      ?auto_47705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47701 ?auto_47702 ) ) ( not ( = ?auto_47701 ?auto_47703 ) ) ( not ( = ?auto_47702 ?auto_47703 ) ) ( ON ?auto_47703 ?auto_47704 ) ( not ( = ?auto_47701 ?auto_47704 ) ) ( not ( = ?auto_47702 ?auto_47704 ) ) ( not ( = ?auto_47703 ?auto_47704 ) ) ( ON-TABLE ?auto_47707 ) ( ON ?auto_47706 ?auto_47707 ) ( ON ?auto_47704 ?auto_47706 ) ( not ( = ?auto_47707 ?auto_47706 ) ) ( not ( = ?auto_47707 ?auto_47704 ) ) ( not ( = ?auto_47707 ?auto_47703 ) ) ( not ( = ?auto_47707 ?auto_47702 ) ) ( not ( = ?auto_47706 ?auto_47704 ) ) ( not ( = ?auto_47706 ?auto_47703 ) ) ( not ( = ?auto_47706 ?auto_47702 ) ) ( not ( = ?auto_47701 ?auto_47707 ) ) ( not ( = ?auto_47701 ?auto_47706 ) ) ( ON ?auto_47701 ?auto_47705 ) ( not ( = ?auto_47701 ?auto_47705 ) ) ( not ( = ?auto_47702 ?auto_47705 ) ) ( not ( = ?auto_47703 ?auto_47705 ) ) ( not ( = ?auto_47704 ?auto_47705 ) ) ( not ( = ?auto_47707 ?auto_47705 ) ) ( not ( = ?auto_47706 ?auto_47705 ) ) ( CLEAR ?auto_47703 ) ( ON ?auto_47702 ?auto_47701 ) ( CLEAR ?auto_47702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47705 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47705 ?auto_47701 )
      ( MAKE-3PILE ?auto_47701 ?auto_47702 ?auto_47703 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47708 - BLOCK
      ?auto_47709 - BLOCK
      ?auto_47710 - BLOCK
    )
    :vars
    (
      ?auto_47714 - BLOCK
      ?auto_47713 - BLOCK
      ?auto_47711 - BLOCK
      ?auto_47712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47708 ?auto_47709 ) ) ( not ( = ?auto_47708 ?auto_47710 ) ) ( not ( = ?auto_47709 ?auto_47710 ) ) ( not ( = ?auto_47708 ?auto_47714 ) ) ( not ( = ?auto_47709 ?auto_47714 ) ) ( not ( = ?auto_47710 ?auto_47714 ) ) ( ON-TABLE ?auto_47713 ) ( ON ?auto_47711 ?auto_47713 ) ( ON ?auto_47714 ?auto_47711 ) ( not ( = ?auto_47713 ?auto_47711 ) ) ( not ( = ?auto_47713 ?auto_47714 ) ) ( not ( = ?auto_47713 ?auto_47710 ) ) ( not ( = ?auto_47713 ?auto_47709 ) ) ( not ( = ?auto_47711 ?auto_47714 ) ) ( not ( = ?auto_47711 ?auto_47710 ) ) ( not ( = ?auto_47711 ?auto_47709 ) ) ( not ( = ?auto_47708 ?auto_47713 ) ) ( not ( = ?auto_47708 ?auto_47711 ) ) ( ON ?auto_47708 ?auto_47712 ) ( not ( = ?auto_47708 ?auto_47712 ) ) ( not ( = ?auto_47709 ?auto_47712 ) ) ( not ( = ?auto_47710 ?auto_47712 ) ) ( not ( = ?auto_47714 ?auto_47712 ) ) ( not ( = ?auto_47713 ?auto_47712 ) ) ( not ( = ?auto_47711 ?auto_47712 ) ) ( ON ?auto_47709 ?auto_47708 ) ( CLEAR ?auto_47709 ) ( ON-TABLE ?auto_47712 ) ( HOLDING ?auto_47710 ) ( CLEAR ?auto_47714 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47713 ?auto_47711 ?auto_47714 ?auto_47710 )
      ( MAKE-3PILE ?auto_47708 ?auto_47709 ?auto_47710 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47715 - BLOCK
      ?auto_47716 - BLOCK
      ?auto_47717 - BLOCK
    )
    :vars
    (
      ?auto_47718 - BLOCK
      ?auto_47719 - BLOCK
      ?auto_47720 - BLOCK
      ?auto_47721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47715 ?auto_47716 ) ) ( not ( = ?auto_47715 ?auto_47717 ) ) ( not ( = ?auto_47716 ?auto_47717 ) ) ( not ( = ?auto_47715 ?auto_47718 ) ) ( not ( = ?auto_47716 ?auto_47718 ) ) ( not ( = ?auto_47717 ?auto_47718 ) ) ( ON-TABLE ?auto_47719 ) ( ON ?auto_47720 ?auto_47719 ) ( ON ?auto_47718 ?auto_47720 ) ( not ( = ?auto_47719 ?auto_47720 ) ) ( not ( = ?auto_47719 ?auto_47718 ) ) ( not ( = ?auto_47719 ?auto_47717 ) ) ( not ( = ?auto_47719 ?auto_47716 ) ) ( not ( = ?auto_47720 ?auto_47718 ) ) ( not ( = ?auto_47720 ?auto_47717 ) ) ( not ( = ?auto_47720 ?auto_47716 ) ) ( not ( = ?auto_47715 ?auto_47719 ) ) ( not ( = ?auto_47715 ?auto_47720 ) ) ( ON ?auto_47715 ?auto_47721 ) ( not ( = ?auto_47715 ?auto_47721 ) ) ( not ( = ?auto_47716 ?auto_47721 ) ) ( not ( = ?auto_47717 ?auto_47721 ) ) ( not ( = ?auto_47718 ?auto_47721 ) ) ( not ( = ?auto_47719 ?auto_47721 ) ) ( not ( = ?auto_47720 ?auto_47721 ) ) ( ON ?auto_47716 ?auto_47715 ) ( ON-TABLE ?auto_47721 ) ( CLEAR ?auto_47718 ) ( ON ?auto_47717 ?auto_47716 ) ( CLEAR ?auto_47717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47721 ?auto_47715 ?auto_47716 )
      ( MAKE-3PILE ?auto_47715 ?auto_47716 ?auto_47717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47722 - BLOCK
      ?auto_47723 - BLOCK
      ?auto_47724 - BLOCK
    )
    :vars
    (
      ?auto_47725 - BLOCK
      ?auto_47727 - BLOCK
      ?auto_47726 - BLOCK
      ?auto_47728 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47722 ?auto_47723 ) ) ( not ( = ?auto_47722 ?auto_47724 ) ) ( not ( = ?auto_47723 ?auto_47724 ) ) ( not ( = ?auto_47722 ?auto_47725 ) ) ( not ( = ?auto_47723 ?auto_47725 ) ) ( not ( = ?auto_47724 ?auto_47725 ) ) ( ON-TABLE ?auto_47727 ) ( ON ?auto_47726 ?auto_47727 ) ( not ( = ?auto_47727 ?auto_47726 ) ) ( not ( = ?auto_47727 ?auto_47725 ) ) ( not ( = ?auto_47727 ?auto_47724 ) ) ( not ( = ?auto_47727 ?auto_47723 ) ) ( not ( = ?auto_47726 ?auto_47725 ) ) ( not ( = ?auto_47726 ?auto_47724 ) ) ( not ( = ?auto_47726 ?auto_47723 ) ) ( not ( = ?auto_47722 ?auto_47727 ) ) ( not ( = ?auto_47722 ?auto_47726 ) ) ( ON ?auto_47722 ?auto_47728 ) ( not ( = ?auto_47722 ?auto_47728 ) ) ( not ( = ?auto_47723 ?auto_47728 ) ) ( not ( = ?auto_47724 ?auto_47728 ) ) ( not ( = ?auto_47725 ?auto_47728 ) ) ( not ( = ?auto_47727 ?auto_47728 ) ) ( not ( = ?auto_47726 ?auto_47728 ) ) ( ON ?auto_47723 ?auto_47722 ) ( ON-TABLE ?auto_47728 ) ( ON ?auto_47724 ?auto_47723 ) ( CLEAR ?auto_47724 ) ( HOLDING ?auto_47725 ) ( CLEAR ?auto_47726 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47727 ?auto_47726 ?auto_47725 )
      ( MAKE-3PILE ?auto_47722 ?auto_47723 ?auto_47724 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47729 - BLOCK
      ?auto_47730 - BLOCK
      ?auto_47731 - BLOCK
    )
    :vars
    (
      ?auto_47734 - BLOCK
      ?auto_47735 - BLOCK
      ?auto_47733 - BLOCK
      ?auto_47732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47729 ?auto_47730 ) ) ( not ( = ?auto_47729 ?auto_47731 ) ) ( not ( = ?auto_47730 ?auto_47731 ) ) ( not ( = ?auto_47729 ?auto_47734 ) ) ( not ( = ?auto_47730 ?auto_47734 ) ) ( not ( = ?auto_47731 ?auto_47734 ) ) ( ON-TABLE ?auto_47735 ) ( ON ?auto_47733 ?auto_47735 ) ( not ( = ?auto_47735 ?auto_47733 ) ) ( not ( = ?auto_47735 ?auto_47734 ) ) ( not ( = ?auto_47735 ?auto_47731 ) ) ( not ( = ?auto_47735 ?auto_47730 ) ) ( not ( = ?auto_47733 ?auto_47734 ) ) ( not ( = ?auto_47733 ?auto_47731 ) ) ( not ( = ?auto_47733 ?auto_47730 ) ) ( not ( = ?auto_47729 ?auto_47735 ) ) ( not ( = ?auto_47729 ?auto_47733 ) ) ( ON ?auto_47729 ?auto_47732 ) ( not ( = ?auto_47729 ?auto_47732 ) ) ( not ( = ?auto_47730 ?auto_47732 ) ) ( not ( = ?auto_47731 ?auto_47732 ) ) ( not ( = ?auto_47734 ?auto_47732 ) ) ( not ( = ?auto_47735 ?auto_47732 ) ) ( not ( = ?auto_47733 ?auto_47732 ) ) ( ON ?auto_47730 ?auto_47729 ) ( ON-TABLE ?auto_47732 ) ( ON ?auto_47731 ?auto_47730 ) ( CLEAR ?auto_47733 ) ( ON ?auto_47734 ?auto_47731 ) ( CLEAR ?auto_47734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47732 ?auto_47729 ?auto_47730 ?auto_47731 )
      ( MAKE-3PILE ?auto_47729 ?auto_47730 ?auto_47731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47736 - BLOCK
      ?auto_47737 - BLOCK
      ?auto_47738 - BLOCK
    )
    :vars
    (
      ?auto_47741 - BLOCK
      ?auto_47742 - BLOCK
      ?auto_47740 - BLOCK
      ?auto_47739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47736 ?auto_47737 ) ) ( not ( = ?auto_47736 ?auto_47738 ) ) ( not ( = ?auto_47737 ?auto_47738 ) ) ( not ( = ?auto_47736 ?auto_47741 ) ) ( not ( = ?auto_47737 ?auto_47741 ) ) ( not ( = ?auto_47738 ?auto_47741 ) ) ( ON-TABLE ?auto_47742 ) ( not ( = ?auto_47742 ?auto_47740 ) ) ( not ( = ?auto_47742 ?auto_47741 ) ) ( not ( = ?auto_47742 ?auto_47738 ) ) ( not ( = ?auto_47742 ?auto_47737 ) ) ( not ( = ?auto_47740 ?auto_47741 ) ) ( not ( = ?auto_47740 ?auto_47738 ) ) ( not ( = ?auto_47740 ?auto_47737 ) ) ( not ( = ?auto_47736 ?auto_47742 ) ) ( not ( = ?auto_47736 ?auto_47740 ) ) ( ON ?auto_47736 ?auto_47739 ) ( not ( = ?auto_47736 ?auto_47739 ) ) ( not ( = ?auto_47737 ?auto_47739 ) ) ( not ( = ?auto_47738 ?auto_47739 ) ) ( not ( = ?auto_47741 ?auto_47739 ) ) ( not ( = ?auto_47742 ?auto_47739 ) ) ( not ( = ?auto_47740 ?auto_47739 ) ) ( ON ?auto_47737 ?auto_47736 ) ( ON-TABLE ?auto_47739 ) ( ON ?auto_47738 ?auto_47737 ) ( ON ?auto_47741 ?auto_47738 ) ( CLEAR ?auto_47741 ) ( HOLDING ?auto_47740 ) ( CLEAR ?auto_47742 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47742 ?auto_47740 )
      ( MAKE-3PILE ?auto_47736 ?auto_47737 ?auto_47738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47743 - BLOCK
      ?auto_47744 - BLOCK
      ?auto_47745 - BLOCK
    )
    :vars
    (
      ?auto_47747 - BLOCK
      ?auto_47749 - BLOCK
      ?auto_47748 - BLOCK
      ?auto_47746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47743 ?auto_47744 ) ) ( not ( = ?auto_47743 ?auto_47745 ) ) ( not ( = ?auto_47744 ?auto_47745 ) ) ( not ( = ?auto_47743 ?auto_47747 ) ) ( not ( = ?auto_47744 ?auto_47747 ) ) ( not ( = ?auto_47745 ?auto_47747 ) ) ( ON-TABLE ?auto_47749 ) ( not ( = ?auto_47749 ?auto_47748 ) ) ( not ( = ?auto_47749 ?auto_47747 ) ) ( not ( = ?auto_47749 ?auto_47745 ) ) ( not ( = ?auto_47749 ?auto_47744 ) ) ( not ( = ?auto_47748 ?auto_47747 ) ) ( not ( = ?auto_47748 ?auto_47745 ) ) ( not ( = ?auto_47748 ?auto_47744 ) ) ( not ( = ?auto_47743 ?auto_47749 ) ) ( not ( = ?auto_47743 ?auto_47748 ) ) ( ON ?auto_47743 ?auto_47746 ) ( not ( = ?auto_47743 ?auto_47746 ) ) ( not ( = ?auto_47744 ?auto_47746 ) ) ( not ( = ?auto_47745 ?auto_47746 ) ) ( not ( = ?auto_47747 ?auto_47746 ) ) ( not ( = ?auto_47749 ?auto_47746 ) ) ( not ( = ?auto_47748 ?auto_47746 ) ) ( ON ?auto_47744 ?auto_47743 ) ( ON-TABLE ?auto_47746 ) ( ON ?auto_47745 ?auto_47744 ) ( ON ?auto_47747 ?auto_47745 ) ( CLEAR ?auto_47749 ) ( ON ?auto_47748 ?auto_47747 ) ( CLEAR ?auto_47748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47746 ?auto_47743 ?auto_47744 ?auto_47745 ?auto_47747 )
      ( MAKE-3PILE ?auto_47743 ?auto_47744 ?auto_47745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47750 - BLOCK
      ?auto_47751 - BLOCK
      ?auto_47752 - BLOCK
    )
    :vars
    (
      ?auto_47753 - BLOCK
      ?auto_47756 - BLOCK
      ?auto_47755 - BLOCK
      ?auto_47754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47750 ?auto_47751 ) ) ( not ( = ?auto_47750 ?auto_47752 ) ) ( not ( = ?auto_47751 ?auto_47752 ) ) ( not ( = ?auto_47750 ?auto_47753 ) ) ( not ( = ?auto_47751 ?auto_47753 ) ) ( not ( = ?auto_47752 ?auto_47753 ) ) ( not ( = ?auto_47756 ?auto_47755 ) ) ( not ( = ?auto_47756 ?auto_47753 ) ) ( not ( = ?auto_47756 ?auto_47752 ) ) ( not ( = ?auto_47756 ?auto_47751 ) ) ( not ( = ?auto_47755 ?auto_47753 ) ) ( not ( = ?auto_47755 ?auto_47752 ) ) ( not ( = ?auto_47755 ?auto_47751 ) ) ( not ( = ?auto_47750 ?auto_47756 ) ) ( not ( = ?auto_47750 ?auto_47755 ) ) ( ON ?auto_47750 ?auto_47754 ) ( not ( = ?auto_47750 ?auto_47754 ) ) ( not ( = ?auto_47751 ?auto_47754 ) ) ( not ( = ?auto_47752 ?auto_47754 ) ) ( not ( = ?auto_47753 ?auto_47754 ) ) ( not ( = ?auto_47756 ?auto_47754 ) ) ( not ( = ?auto_47755 ?auto_47754 ) ) ( ON ?auto_47751 ?auto_47750 ) ( ON-TABLE ?auto_47754 ) ( ON ?auto_47752 ?auto_47751 ) ( ON ?auto_47753 ?auto_47752 ) ( ON ?auto_47755 ?auto_47753 ) ( CLEAR ?auto_47755 ) ( HOLDING ?auto_47756 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47756 )
      ( MAKE-3PILE ?auto_47750 ?auto_47751 ?auto_47752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_47757 - BLOCK
      ?auto_47758 - BLOCK
      ?auto_47759 - BLOCK
    )
    :vars
    (
      ?auto_47763 - BLOCK
      ?auto_47761 - BLOCK
      ?auto_47760 - BLOCK
      ?auto_47762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47757 ?auto_47758 ) ) ( not ( = ?auto_47757 ?auto_47759 ) ) ( not ( = ?auto_47758 ?auto_47759 ) ) ( not ( = ?auto_47757 ?auto_47763 ) ) ( not ( = ?auto_47758 ?auto_47763 ) ) ( not ( = ?auto_47759 ?auto_47763 ) ) ( not ( = ?auto_47761 ?auto_47760 ) ) ( not ( = ?auto_47761 ?auto_47763 ) ) ( not ( = ?auto_47761 ?auto_47759 ) ) ( not ( = ?auto_47761 ?auto_47758 ) ) ( not ( = ?auto_47760 ?auto_47763 ) ) ( not ( = ?auto_47760 ?auto_47759 ) ) ( not ( = ?auto_47760 ?auto_47758 ) ) ( not ( = ?auto_47757 ?auto_47761 ) ) ( not ( = ?auto_47757 ?auto_47760 ) ) ( ON ?auto_47757 ?auto_47762 ) ( not ( = ?auto_47757 ?auto_47762 ) ) ( not ( = ?auto_47758 ?auto_47762 ) ) ( not ( = ?auto_47759 ?auto_47762 ) ) ( not ( = ?auto_47763 ?auto_47762 ) ) ( not ( = ?auto_47761 ?auto_47762 ) ) ( not ( = ?auto_47760 ?auto_47762 ) ) ( ON ?auto_47758 ?auto_47757 ) ( ON-TABLE ?auto_47762 ) ( ON ?auto_47759 ?auto_47758 ) ( ON ?auto_47763 ?auto_47759 ) ( ON ?auto_47760 ?auto_47763 ) ( ON ?auto_47761 ?auto_47760 ) ( CLEAR ?auto_47761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47762 ?auto_47757 ?auto_47758 ?auto_47759 ?auto_47763 ?auto_47760 )
      ( MAKE-3PILE ?auto_47757 ?auto_47758 ?auto_47759 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47766 - BLOCK
      ?auto_47767 - BLOCK
    )
    :vars
    (
      ?auto_47768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47768 ?auto_47767 ) ( CLEAR ?auto_47768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47766 ) ( ON ?auto_47767 ?auto_47766 ) ( not ( = ?auto_47766 ?auto_47767 ) ) ( not ( = ?auto_47766 ?auto_47768 ) ) ( not ( = ?auto_47767 ?auto_47768 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47768 ?auto_47767 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47769 - BLOCK
      ?auto_47770 - BLOCK
    )
    :vars
    (
      ?auto_47771 - BLOCK
      ?auto_47772 - BLOCK
      ?auto_47773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47771 ?auto_47770 ) ( CLEAR ?auto_47771 ) ( ON-TABLE ?auto_47769 ) ( ON ?auto_47770 ?auto_47769 ) ( not ( = ?auto_47769 ?auto_47770 ) ) ( not ( = ?auto_47769 ?auto_47771 ) ) ( not ( = ?auto_47770 ?auto_47771 ) ) ( HOLDING ?auto_47772 ) ( CLEAR ?auto_47773 ) ( not ( = ?auto_47769 ?auto_47772 ) ) ( not ( = ?auto_47769 ?auto_47773 ) ) ( not ( = ?auto_47770 ?auto_47772 ) ) ( not ( = ?auto_47770 ?auto_47773 ) ) ( not ( = ?auto_47771 ?auto_47772 ) ) ( not ( = ?auto_47771 ?auto_47773 ) ) ( not ( = ?auto_47772 ?auto_47773 ) ) )
    :subtasks
    ( ( !STACK ?auto_47772 ?auto_47773 )
      ( MAKE-2PILE ?auto_47769 ?auto_47770 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47774 - BLOCK
      ?auto_47775 - BLOCK
    )
    :vars
    (
      ?auto_47778 - BLOCK
      ?auto_47777 - BLOCK
      ?auto_47776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47778 ?auto_47775 ) ( ON-TABLE ?auto_47774 ) ( ON ?auto_47775 ?auto_47774 ) ( not ( = ?auto_47774 ?auto_47775 ) ) ( not ( = ?auto_47774 ?auto_47778 ) ) ( not ( = ?auto_47775 ?auto_47778 ) ) ( CLEAR ?auto_47777 ) ( not ( = ?auto_47774 ?auto_47776 ) ) ( not ( = ?auto_47774 ?auto_47777 ) ) ( not ( = ?auto_47775 ?auto_47776 ) ) ( not ( = ?auto_47775 ?auto_47777 ) ) ( not ( = ?auto_47778 ?auto_47776 ) ) ( not ( = ?auto_47778 ?auto_47777 ) ) ( not ( = ?auto_47776 ?auto_47777 ) ) ( ON ?auto_47776 ?auto_47778 ) ( CLEAR ?auto_47776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47774 ?auto_47775 ?auto_47778 )
      ( MAKE-2PILE ?auto_47774 ?auto_47775 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47779 - BLOCK
      ?auto_47780 - BLOCK
    )
    :vars
    (
      ?auto_47782 - BLOCK
      ?auto_47781 - BLOCK
      ?auto_47783 - BLOCK
      ?auto_47784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47782 ?auto_47780 ) ( ON-TABLE ?auto_47779 ) ( ON ?auto_47780 ?auto_47779 ) ( not ( = ?auto_47779 ?auto_47780 ) ) ( not ( = ?auto_47779 ?auto_47782 ) ) ( not ( = ?auto_47780 ?auto_47782 ) ) ( not ( = ?auto_47779 ?auto_47781 ) ) ( not ( = ?auto_47779 ?auto_47783 ) ) ( not ( = ?auto_47780 ?auto_47781 ) ) ( not ( = ?auto_47780 ?auto_47783 ) ) ( not ( = ?auto_47782 ?auto_47781 ) ) ( not ( = ?auto_47782 ?auto_47783 ) ) ( not ( = ?auto_47781 ?auto_47783 ) ) ( ON ?auto_47781 ?auto_47782 ) ( CLEAR ?auto_47781 ) ( HOLDING ?auto_47783 ) ( CLEAR ?auto_47784 ) ( ON-TABLE ?auto_47784 ) ( not ( = ?auto_47784 ?auto_47783 ) ) ( not ( = ?auto_47779 ?auto_47784 ) ) ( not ( = ?auto_47780 ?auto_47784 ) ) ( not ( = ?auto_47782 ?auto_47784 ) ) ( not ( = ?auto_47781 ?auto_47784 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47784 ?auto_47783 )
      ( MAKE-2PILE ?auto_47779 ?auto_47780 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47785 - BLOCK
      ?auto_47786 - BLOCK
    )
    :vars
    (
      ?auto_47787 - BLOCK
      ?auto_47788 - BLOCK
      ?auto_47789 - BLOCK
      ?auto_47790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47787 ?auto_47786 ) ( ON-TABLE ?auto_47785 ) ( ON ?auto_47786 ?auto_47785 ) ( not ( = ?auto_47785 ?auto_47786 ) ) ( not ( = ?auto_47785 ?auto_47787 ) ) ( not ( = ?auto_47786 ?auto_47787 ) ) ( not ( = ?auto_47785 ?auto_47788 ) ) ( not ( = ?auto_47785 ?auto_47789 ) ) ( not ( = ?auto_47786 ?auto_47788 ) ) ( not ( = ?auto_47786 ?auto_47789 ) ) ( not ( = ?auto_47787 ?auto_47788 ) ) ( not ( = ?auto_47787 ?auto_47789 ) ) ( not ( = ?auto_47788 ?auto_47789 ) ) ( ON ?auto_47788 ?auto_47787 ) ( CLEAR ?auto_47790 ) ( ON-TABLE ?auto_47790 ) ( not ( = ?auto_47790 ?auto_47789 ) ) ( not ( = ?auto_47785 ?auto_47790 ) ) ( not ( = ?auto_47786 ?auto_47790 ) ) ( not ( = ?auto_47787 ?auto_47790 ) ) ( not ( = ?auto_47788 ?auto_47790 ) ) ( ON ?auto_47789 ?auto_47788 ) ( CLEAR ?auto_47789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47785 ?auto_47786 ?auto_47787 ?auto_47788 )
      ( MAKE-2PILE ?auto_47785 ?auto_47786 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47791 - BLOCK
      ?auto_47792 - BLOCK
    )
    :vars
    (
      ?auto_47793 - BLOCK
      ?auto_47796 - BLOCK
      ?auto_47795 - BLOCK
      ?auto_47794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47793 ?auto_47792 ) ( ON-TABLE ?auto_47791 ) ( ON ?auto_47792 ?auto_47791 ) ( not ( = ?auto_47791 ?auto_47792 ) ) ( not ( = ?auto_47791 ?auto_47793 ) ) ( not ( = ?auto_47792 ?auto_47793 ) ) ( not ( = ?auto_47791 ?auto_47796 ) ) ( not ( = ?auto_47791 ?auto_47795 ) ) ( not ( = ?auto_47792 ?auto_47796 ) ) ( not ( = ?auto_47792 ?auto_47795 ) ) ( not ( = ?auto_47793 ?auto_47796 ) ) ( not ( = ?auto_47793 ?auto_47795 ) ) ( not ( = ?auto_47796 ?auto_47795 ) ) ( ON ?auto_47796 ?auto_47793 ) ( not ( = ?auto_47794 ?auto_47795 ) ) ( not ( = ?auto_47791 ?auto_47794 ) ) ( not ( = ?auto_47792 ?auto_47794 ) ) ( not ( = ?auto_47793 ?auto_47794 ) ) ( not ( = ?auto_47796 ?auto_47794 ) ) ( ON ?auto_47795 ?auto_47796 ) ( CLEAR ?auto_47795 ) ( HOLDING ?auto_47794 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47794 )
      ( MAKE-2PILE ?auto_47791 ?auto_47792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47797 - BLOCK
      ?auto_47798 - BLOCK
    )
    :vars
    (
      ?auto_47800 - BLOCK
      ?auto_47799 - BLOCK
      ?auto_47801 - BLOCK
      ?auto_47802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47800 ?auto_47798 ) ( ON-TABLE ?auto_47797 ) ( ON ?auto_47798 ?auto_47797 ) ( not ( = ?auto_47797 ?auto_47798 ) ) ( not ( = ?auto_47797 ?auto_47800 ) ) ( not ( = ?auto_47798 ?auto_47800 ) ) ( not ( = ?auto_47797 ?auto_47799 ) ) ( not ( = ?auto_47797 ?auto_47801 ) ) ( not ( = ?auto_47798 ?auto_47799 ) ) ( not ( = ?auto_47798 ?auto_47801 ) ) ( not ( = ?auto_47800 ?auto_47799 ) ) ( not ( = ?auto_47800 ?auto_47801 ) ) ( not ( = ?auto_47799 ?auto_47801 ) ) ( ON ?auto_47799 ?auto_47800 ) ( not ( = ?auto_47802 ?auto_47801 ) ) ( not ( = ?auto_47797 ?auto_47802 ) ) ( not ( = ?auto_47798 ?auto_47802 ) ) ( not ( = ?auto_47800 ?auto_47802 ) ) ( not ( = ?auto_47799 ?auto_47802 ) ) ( ON ?auto_47801 ?auto_47799 ) ( ON ?auto_47802 ?auto_47801 ) ( CLEAR ?auto_47802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47797 ?auto_47798 ?auto_47800 ?auto_47799 ?auto_47801 )
      ( MAKE-2PILE ?auto_47797 ?auto_47798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47803 - BLOCK
      ?auto_47804 - BLOCK
    )
    :vars
    (
      ?auto_47807 - BLOCK
      ?auto_47808 - BLOCK
      ?auto_47806 - BLOCK
      ?auto_47805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47807 ?auto_47804 ) ( ON-TABLE ?auto_47803 ) ( ON ?auto_47804 ?auto_47803 ) ( not ( = ?auto_47803 ?auto_47804 ) ) ( not ( = ?auto_47803 ?auto_47807 ) ) ( not ( = ?auto_47804 ?auto_47807 ) ) ( not ( = ?auto_47803 ?auto_47808 ) ) ( not ( = ?auto_47803 ?auto_47806 ) ) ( not ( = ?auto_47804 ?auto_47808 ) ) ( not ( = ?auto_47804 ?auto_47806 ) ) ( not ( = ?auto_47807 ?auto_47808 ) ) ( not ( = ?auto_47807 ?auto_47806 ) ) ( not ( = ?auto_47808 ?auto_47806 ) ) ( ON ?auto_47808 ?auto_47807 ) ( not ( = ?auto_47805 ?auto_47806 ) ) ( not ( = ?auto_47803 ?auto_47805 ) ) ( not ( = ?auto_47804 ?auto_47805 ) ) ( not ( = ?auto_47807 ?auto_47805 ) ) ( not ( = ?auto_47808 ?auto_47805 ) ) ( ON ?auto_47806 ?auto_47808 ) ( HOLDING ?auto_47805 ) ( CLEAR ?auto_47806 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47803 ?auto_47804 ?auto_47807 ?auto_47808 ?auto_47806 ?auto_47805 )
      ( MAKE-2PILE ?auto_47803 ?auto_47804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47809 - BLOCK
      ?auto_47810 - BLOCK
    )
    :vars
    (
      ?auto_47813 - BLOCK
      ?auto_47812 - BLOCK
      ?auto_47814 - BLOCK
      ?auto_47811 - BLOCK
      ?auto_47815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47813 ?auto_47810 ) ( ON-TABLE ?auto_47809 ) ( ON ?auto_47810 ?auto_47809 ) ( not ( = ?auto_47809 ?auto_47810 ) ) ( not ( = ?auto_47809 ?auto_47813 ) ) ( not ( = ?auto_47810 ?auto_47813 ) ) ( not ( = ?auto_47809 ?auto_47812 ) ) ( not ( = ?auto_47809 ?auto_47814 ) ) ( not ( = ?auto_47810 ?auto_47812 ) ) ( not ( = ?auto_47810 ?auto_47814 ) ) ( not ( = ?auto_47813 ?auto_47812 ) ) ( not ( = ?auto_47813 ?auto_47814 ) ) ( not ( = ?auto_47812 ?auto_47814 ) ) ( ON ?auto_47812 ?auto_47813 ) ( not ( = ?auto_47811 ?auto_47814 ) ) ( not ( = ?auto_47809 ?auto_47811 ) ) ( not ( = ?auto_47810 ?auto_47811 ) ) ( not ( = ?auto_47813 ?auto_47811 ) ) ( not ( = ?auto_47812 ?auto_47811 ) ) ( ON ?auto_47814 ?auto_47812 ) ( CLEAR ?auto_47814 ) ( ON ?auto_47811 ?auto_47815 ) ( CLEAR ?auto_47811 ) ( HAND-EMPTY ) ( not ( = ?auto_47809 ?auto_47815 ) ) ( not ( = ?auto_47810 ?auto_47815 ) ) ( not ( = ?auto_47813 ?auto_47815 ) ) ( not ( = ?auto_47812 ?auto_47815 ) ) ( not ( = ?auto_47814 ?auto_47815 ) ) ( not ( = ?auto_47811 ?auto_47815 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47811 ?auto_47815 )
      ( MAKE-2PILE ?auto_47809 ?auto_47810 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47816 - BLOCK
      ?auto_47817 - BLOCK
    )
    :vars
    (
      ?auto_47819 - BLOCK
      ?auto_47818 - BLOCK
      ?auto_47822 - BLOCK
      ?auto_47821 - BLOCK
      ?auto_47820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47819 ?auto_47817 ) ( ON-TABLE ?auto_47816 ) ( ON ?auto_47817 ?auto_47816 ) ( not ( = ?auto_47816 ?auto_47817 ) ) ( not ( = ?auto_47816 ?auto_47819 ) ) ( not ( = ?auto_47817 ?auto_47819 ) ) ( not ( = ?auto_47816 ?auto_47818 ) ) ( not ( = ?auto_47816 ?auto_47822 ) ) ( not ( = ?auto_47817 ?auto_47818 ) ) ( not ( = ?auto_47817 ?auto_47822 ) ) ( not ( = ?auto_47819 ?auto_47818 ) ) ( not ( = ?auto_47819 ?auto_47822 ) ) ( not ( = ?auto_47818 ?auto_47822 ) ) ( ON ?auto_47818 ?auto_47819 ) ( not ( = ?auto_47821 ?auto_47822 ) ) ( not ( = ?auto_47816 ?auto_47821 ) ) ( not ( = ?auto_47817 ?auto_47821 ) ) ( not ( = ?auto_47819 ?auto_47821 ) ) ( not ( = ?auto_47818 ?auto_47821 ) ) ( ON ?auto_47821 ?auto_47820 ) ( CLEAR ?auto_47821 ) ( not ( = ?auto_47816 ?auto_47820 ) ) ( not ( = ?auto_47817 ?auto_47820 ) ) ( not ( = ?auto_47819 ?auto_47820 ) ) ( not ( = ?auto_47818 ?auto_47820 ) ) ( not ( = ?auto_47822 ?auto_47820 ) ) ( not ( = ?auto_47821 ?auto_47820 ) ) ( HOLDING ?auto_47822 ) ( CLEAR ?auto_47818 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47816 ?auto_47817 ?auto_47819 ?auto_47818 ?auto_47822 )
      ( MAKE-2PILE ?auto_47816 ?auto_47817 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47823 - BLOCK
      ?auto_47824 - BLOCK
    )
    :vars
    (
      ?auto_47829 - BLOCK
      ?auto_47826 - BLOCK
      ?auto_47828 - BLOCK
      ?auto_47827 - BLOCK
      ?auto_47825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47829 ?auto_47824 ) ( ON-TABLE ?auto_47823 ) ( ON ?auto_47824 ?auto_47823 ) ( not ( = ?auto_47823 ?auto_47824 ) ) ( not ( = ?auto_47823 ?auto_47829 ) ) ( not ( = ?auto_47824 ?auto_47829 ) ) ( not ( = ?auto_47823 ?auto_47826 ) ) ( not ( = ?auto_47823 ?auto_47828 ) ) ( not ( = ?auto_47824 ?auto_47826 ) ) ( not ( = ?auto_47824 ?auto_47828 ) ) ( not ( = ?auto_47829 ?auto_47826 ) ) ( not ( = ?auto_47829 ?auto_47828 ) ) ( not ( = ?auto_47826 ?auto_47828 ) ) ( ON ?auto_47826 ?auto_47829 ) ( not ( = ?auto_47827 ?auto_47828 ) ) ( not ( = ?auto_47823 ?auto_47827 ) ) ( not ( = ?auto_47824 ?auto_47827 ) ) ( not ( = ?auto_47829 ?auto_47827 ) ) ( not ( = ?auto_47826 ?auto_47827 ) ) ( ON ?auto_47827 ?auto_47825 ) ( not ( = ?auto_47823 ?auto_47825 ) ) ( not ( = ?auto_47824 ?auto_47825 ) ) ( not ( = ?auto_47829 ?auto_47825 ) ) ( not ( = ?auto_47826 ?auto_47825 ) ) ( not ( = ?auto_47828 ?auto_47825 ) ) ( not ( = ?auto_47827 ?auto_47825 ) ) ( CLEAR ?auto_47826 ) ( ON ?auto_47828 ?auto_47827 ) ( CLEAR ?auto_47828 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47825 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47825 ?auto_47827 )
      ( MAKE-2PILE ?auto_47823 ?auto_47824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47830 - BLOCK
      ?auto_47831 - BLOCK
    )
    :vars
    (
      ?auto_47834 - BLOCK
      ?auto_47836 - BLOCK
      ?auto_47832 - BLOCK
      ?auto_47833 - BLOCK
      ?auto_47835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47834 ?auto_47831 ) ( ON-TABLE ?auto_47830 ) ( ON ?auto_47831 ?auto_47830 ) ( not ( = ?auto_47830 ?auto_47831 ) ) ( not ( = ?auto_47830 ?auto_47834 ) ) ( not ( = ?auto_47831 ?auto_47834 ) ) ( not ( = ?auto_47830 ?auto_47836 ) ) ( not ( = ?auto_47830 ?auto_47832 ) ) ( not ( = ?auto_47831 ?auto_47836 ) ) ( not ( = ?auto_47831 ?auto_47832 ) ) ( not ( = ?auto_47834 ?auto_47836 ) ) ( not ( = ?auto_47834 ?auto_47832 ) ) ( not ( = ?auto_47836 ?auto_47832 ) ) ( not ( = ?auto_47833 ?auto_47832 ) ) ( not ( = ?auto_47830 ?auto_47833 ) ) ( not ( = ?auto_47831 ?auto_47833 ) ) ( not ( = ?auto_47834 ?auto_47833 ) ) ( not ( = ?auto_47836 ?auto_47833 ) ) ( ON ?auto_47833 ?auto_47835 ) ( not ( = ?auto_47830 ?auto_47835 ) ) ( not ( = ?auto_47831 ?auto_47835 ) ) ( not ( = ?auto_47834 ?auto_47835 ) ) ( not ( = ?auto_47836 ?auto_47835 ) ) ( not ( = ?auto_47832 ?auto_47835 ) ) ( not ( = ?auto_47833 ?auto_47835 ) ) ( ON ?auto_47832 ?auto_47833 ) ( CLEAR ?auto_47832 ) ( ON-TABLE ?auto_47835 ) ( HOLDING ?auto_47836 ) ( CLEAR ?auto_47834 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47830 ?auto_47831 ?auto_47834 ?auto_47836 )
      ( MAKE-2PILE ?auto_47830 ?auto_47831 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47837 - BLOCK
      ?auto_47838 - BLOCK
    )
    :vars
    (
      ?auto_47843 - BLOCK
      ?auto_47839 - BLOCK
      ?auto_47841 - BLOCK
      ?auto_47840 - BLOCK
      ?auto_47842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47843 ?auto_47838 ) ( ON-TABLE ?auto_47837 ) ( ON ?auto_47838 ?auto_47837 ) ( not ( = ?auto_47837 ?auto_47838 ) ) ( not ( = ?auto_47837 ?auto_47843 ) ) ( not ( = ?auto_47838 ?auto_47843 ) ) ( not ( = ?auto_47837 ?auto_47839 ) ) ( not ( = ?auto_47837 ?auto_47841 ) ) ( not ( = ?auto_47838 ?auto_47839 ) ) ( not ( = ?auto_47838 ?auto_47841 ) ) ( not ( = ?auto_47843 ?auto_47839 ) ) ( not ( = ?auto_47843 ?auto_47841 ) ) ( not ( = ?auto_47839 ?auto_47841 ) ) ( not ( = ?auto_47840 ?auto_47841 ) ) ( not ( = ?auto_47837 ?auto_47840 ) ) ( not ( = ?auto_47838 ?auto_47840 ) ) ( not ( = ?auto_47843 ?auto_47840 ) ) ( not ( = ?auto_47839 ?auto_47840 ) ) ( ON ?auto_47840 ?auto_47842 ) ( not ( = ?auto_47837 ?auto_47842 ) ) ( not ( = ?auto_47838 ?auto_47842 ) ) ( not ( = ?auto_47843 ?auto_47842 ) ) ( not ( = ?auto_47839 ?auto_47842 ) ) ( not ( = ?auto_47841 ?auto_47842 ) ) ( not ( = ?auto_47840 ?auto_47842 ) ) ( ON ?auto_47841 ?auto_47840 ) ( ON-TABLE ?auto_47842 ) ( CLEAR ?auto_47843 ) ( ON ?auto_47839 ?auto_47841 ) ( CLEAR ?auto_47839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47842 ?auto_47840 ?auto_47841 )
      ( MAKE-2PILE ?auto_47837 ?auto_47838 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47858 - BLOCK
      ?auto_47859 - BLOCK
    )
    :vars
    (
      ?auto_47861 - BLOCK
      ?auto_47862 - BLOCK
      ?auto_47863 - BLOCK
      ?auto_47864 - BLOCK
      ?auto_47860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47858 ) ( not ( = ?auto_47858 ?auto_47859 ) ) ( not ( = ?auto_47858 ?auto_47861 ) ) ( not ( = ?auto_47859 ?auto_47861 ) ) ( not ( = ?auto_47858 ?auto_47862 ) ) ( not ( = ?auto_47858 ?auto_47863 ) ) ( not ( = ?auto_47859 ?auto_47862 ) ) ( not ( = ?auto_47859 ?auto_47863 ) ) ( not ( = ?auto_47861 ?auto_47862 ) ) ( not ( = ?auto_47861 ?auto_47863 ) ) ( not ( = ?auto_47862 ?auto_47863 ) ) ( not ( = ?auto_47864 ?auto_47863 ) ) ( not ( = ?auto_47858 ?auto_47864 ) ) ( not ( = ?auto_47859 ?auto_47864 ) ) ( not ( = ?auto_47861 ?auto_47864 ) ) ( not ( = ?auto_47862 ?auto_47864 ) ) ( ON ?auto_47864 ?auto_47860 ) ( not ( = ?auto_47858 ?auto_47860 ) ) ( not ( = ?auto_47859 ?auto_47860 ) ) ( not ( = ?auto_47861 ?auto_47860 ) ) ( not ( = ?auto_47862 ?auto_47860 ) ) ( not ( = ?auto_47863 ?auto_47860 ) ) ( not ( = ?auto_47864 ?auto_47860 ) ) ( ON ?auto_47863 ?auto_47864 ) ( ON-TABLE ?auto_47860 ) ( ON ?auto_47862 ?auto_47863 ) ( ON ?auto_47861 ?auto_47862 ) ( CLEAR ?auto_47861 ) ( HOLDING ?auto_47859 ) ( CLEAR ?auto_47858 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47858 ?auto_47859 ?auto_47861 )
      ( MAKE-2PILE ?auto_47858 ?auto_47859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47865 - BLOCK
      ?auto_47866 - BLOCK
    )
    :vars
    (
      ?auto_47870 - BLOCK
      ?auto_47869 - BLOCK
      ?auto_47868 - BLOCK
      ?auto_47867 - BLOCK
      ?auto_47871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47865 ) ( not ( = ?auto_47865 ?auto_47866 ) ) ( not ( = ?auto_47865 ?auto_47870 ) ) ( not ( = ?auto_47866 ?auto_47870 ) ) ( not ( = ?auto_47865 ?auto_47869 ) ) ( not ( = ?auto_47865 ?auto_47868 ) ) ( not ( = ?auto_47866 ?auto_47869 ) ) ( not ( = ?auto_47866 ?auto_47868 ) ) ( not ( = ?auto_47870 ?auto_47869 ) ) ( not ( = ?auto_47870 ?auto_47868 ) ) ( not ( = ?auto_47869 ?auto_47868 ) ) ( not ( = ?auto_47867 ?auto_47868 ) ) ( not ( = ?auto_47865 ?auto_47867 ) ) ( not ( = ?auto_47866 ?auto_47867 ) ) ( not ( = ?auto_47870 ?auto_47867 ) ) ( not ( = ?auto_47869 ?auto_47867 ) ) ( ON ?auto_47867 ?auto_47871 ) ( not ( = ?auto_47865 ?auto_47871 ) ) ( not ( = ?auto_47866 ?auto_47871 ) ) ( not ( = ?auto_47870 ?auto_47871 ) ) ( not ( = ?auto_47869 ?auto_47871 ) ) ( not ( = ?auto_47868 ?auto_47871 ) ) ( not ( = ?auto_47867 ?auto_47871 ) ) ( ON ?auto_47868 ?auto_47867 ) ( ON-TABLE ?auto_47871 ) ( ON ?auto_47869 ?auto_47868 ) ( ON ?auto_47870 ?auto_47869 ) ( CLEAR ?auto_47865 ) ( ON ?auto_47866 ?auto_47870 ) ( CLEAR ?auto_47866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47871 ?auto_47867 ?auto_47868 ?auto_47869 ?auto_47870 )
      ( MAKE-2PILE ?auto_47865 ?auto_47866 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47872 - BLOCK
      ?auto_47873 - BLOCK
    )
    :vars
    (
      ?auto_47875 - BLOCK
      ?auto_47874 - BLOCK
      ?auto_47878 - BLOCK
      ?auto_47877 - BLOCK
      ?auto_47876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47872 ?auto_47873 ) ) ( not ( = ?auto_47872 ?auto_47875 ) ) ( not ( = ?auto_47873 ?auto_47875 ) ) ( not ( = ?auto_47872 ?auto_47874 ) ) ( not ( = ?auto_47872 ?auto_47878 ) ) ( not ( = ?auto_47873 ?auto_47874 ) ) ( not ( = ?auto_47873 ?auto_47878 ) ) ( not ( = ?auto_47875 ?auto_47874 ) ) ( not ( = ?auto_47875 ?auto_47878 ) ) ( not ( = ?auto_47874 ?auto_47878 ) ) ( not ( = ?auto_47877 ?auto_47878 ) ) ( not ( = ?auto_47872 ?auto_47877 ) ) ( not ( = ?auto_47873 ?auto_47877 ) ) ( not ( = ?auto_47875 ?auto_47877 ) ) ( not ( = ?auto_47874 ?auto_47877 ) ) ( ON ?auto_47877 ?auto_47876 ) ( not ( = ?auto_47872 ?auto_47876 ) ) ( not ( = ?auto_47873 ?auto_47876 ) ) ( not ( = ?auto_47875 ?auto_47876 ) ) ( not ( = ?auto_47874 ?auto_47876 ) ) ( not ( = ?auto_47878 ?auto_47876 ) ) ( not ( = ?auto_47877 ?auto_47876 ) ) ( ON ?auto_47878 ?auto_47877 ) ( ON-TABLE ?auto_47876 ) ( ON ?auto_47874 ?auto_47878 ) ( ON ?auto_47875 ?auto_47874 ) ( ON ?auto_47873 ?auto_47875 ) ( CLEAR ?auto_47873 ) ( HOLDING ?auto_47872 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47872 )
      ( MAKE-2PILE ?auto_47872 ?auto_47873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_47879 - BLOCK
      ?auto_47880 - BLOCK
    )
    :vars
    (
      ?auto_47884 - BLOCK
      ?auto_47885 - BLOCK
      ?auto_47882 - BLOCK
      ?auto_47883 - BLOCK
      ?auto_47881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47879 ?auto_47880 ) ) ( not ( = ?auto_47879 ?auto_47884 ) ) ( not ( = ?auto_47880 ?auto_47884 ) ) ( not ( = ?auto_47879 ?auto_47885 ) ) ( not ( = ?auto_47879 ?auto_47882 ) ) ( not ( = ?auto_47880 ?auto_47885 ) ) ( not ( = ?auto_47880 ?auto_47882 ) ) ( not ( = ?auto_47884 ?auto_47885 ) ) ( not ( = ?auto_47884 ?auto_47882 ) ) ( not ( = ?auto_47885 ?auto_47882 ) ) ( not ( = ?auto_47883 ?auto_47882 ) ) ( not ( = ?auto_47879 ?auto_47883 ) ) ( not ( = ?auto_47880 ?auto_47883 ) ) ( not ( = ?auto_47884 ?auto_47883 ) ) ( not ( = ?auto_47885 ?auto_47883 ) ) ( ON ?auto_47883 ?auto_47881 ) ( not ( = ?auto_47879 ?auto_47881 ) ) ( not ( = ?auto_47880 ?auto_47881 ) ) ( not ( = ?auto_47884 ?auto_47881 ) ) ( not ( = ?auto_47885 ?auto_47881 ) ) ( not ( = ?auto_47882 ?auto_47881 ) ) ( not ( = ?auto_47883 ?auto_47881 ) ) ( ON ?auto_47882 ?auto_47883 ) ( ON-TABLE ?auto_47881 ) ( ON ?auto_47885 ?auto_47882 ) ( ON ?auto_47884 ?auto_47885 ) ( ON ?auto_47880 ?auto_47884 ) ( ON ?auto_47879 ?auto_47880 ) ( CLEAR ?auto_47879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47881 ?auto_47883 ?auto_47882 ?auto_47885 ?auto_47884 ?auto_47880 )
      ( MAKE-2PILE ?auto_47879 ?auto_47880 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47890 - BLOCK
      ?auto_47891 - BLOCK
      ?auto_47892 - BLOCK
      ?auto_47893 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_47893 ) ( CLEAR ?auto_47892 ) ( ON-TABLE ?auto_47890 ) ( ON ?auto_47891 ?auto_47890 ) ( ON ?auto_47892 ?auto_47891 ) ( not ( = ?auto_47890 ?auto_47891 ) ) ( not ( = ?auto_47890 ?auto_47892 ) ) ( not ( = ?auto_47890 ?auto_47893 ) ) ( not ( = ?auto_47891 ?auto_47892 ) ) ( not ( = ?auto_47891 ?auto_47893 ) ) ( not ( = ?auto_47892 ?auto_47893 ) ) )
    :subtasks
    ( ( !STACK ?auto_47893 ?auto_47892 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47894 - BLOCK
      ?auto_47895 - BLOCK
      ?auto_47896 - BLOCK
      ?auto_47897 - BLOCK
    )
    :vars
    (
      ?auto_47898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_47896 ) ( ON-TABLE ?auto_47894 ) ( ON ?auto_47895 ?auto_47894 ) ( ON ?auto_47896 ?auto_47895 ) ( not ( = ?auto_47894 ?auto_47895 ) ) ( not ( = ?auto_47894 ?auto_47896 ) ) ( not ( = ?auto_47894 ?auto_47897 ) ) ( not ( = ?auto_47895 ?auto_47896 ) ) ( not ( = ?auto_47895 ?auto_47897 ) ) ( not ( = ?auto_47896 ?auto_47897 ) ) ( ON ?auto_47897 ?auto_47898 ) ( CLEAR ?auto_47897 ) ( HAND-EMPTY ) ( not ( = ?auto_47894 ?auto_47898 ) ) ( not ( = ?auto_47895 ?auto_47898 ) ) ( not ( = ?auto_47896 ?auto_47898 ) ) ( not ( = ?auto_47897 ?auto_47898 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47897 ?auto_47898 )
      ( MAKE-4PILE ?auto_47894 ?auto_47895 ?auto_47896 ?auto_47897 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47899 - BLOCK
      ?auto_47900 - BLOCK
      ?auto_47901 - BLOCK
      ?auto_47902 - BLOCK
    )
    :vars
    (
      ?auto_47903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47899 ) ( ON ?auto_47900 ?auto_47899 ) ( not ( = ?auto_47899 ?auto_47900 ) ) ( not ( = ?auto_47899 ?auto_47901 ) ) ( not ( = ?auto_47899 ?auto_47902 ) ) ( not ( = ?auto_47900 ?auto_47901 ) ) ( not ( = ?auto_47900 ?auto_47902 ) ) ( not ( = ?auto_47901 ?auto_47902 ) ) ( ON ?auto_47902 ?auto_47903 ) ( CLEAR ?auto_47902 ) ( not ( = ?auto_47899 ?auto_47903 ) ) ( not ( = ?auto_47900 ?auto_47903 ) ) ( not ( = ?auto_47901 ?auto_47903 ) ) ( not ( = ?auto_47902 ?auto_47903 ) ) ( HOLDING ?auto_47901 ) ( CLEAR ?auto_47900 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47899 ?auto_47900 ?auto_47901 )
      ( MAKE-4PILE ?auto_47899 ?auto_47900 ?auto_47901 ?auto_47902 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47904 - BLOCK
      ?auto_47905 - BLOCK
      ?auto_47906 - BLOCK
      ?auto_47907 - BLOCK
    )
    :vars
    (
      ?auto_47908 - BLOCK
      ?auto_47909 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47904 ) ( ON ?auto_47905 ?auto_47904 ) ( not ( = ?auto_47904 ?auto_47905 ) ) ( not ( = ?auto_47904 ?auto_47906 ) ) ( not ( = ?auto_47904 ?auto_47907 ) ) ( not ( = ?auto_47905 ?auto_47906 ) ) ( not ( = ?auto_47905 ?auto_47907 ) ) ( not ( = ?auto_47906 ?auto_47907 ) ) ( ON ?auto_47907 ?auto_47908 ) ( not ( = ?auto_47904 ?auto_47908 ) ) ( not ( = ?auto_47905 ?auto_47908 ) ) ( not ( = ?auto_47906 ?auto_47908 ) ) ( not ( = ?auto_47907 ?auto_47908 ) ) ( CLEAR ?auto_47905 ) ( ON ?auto_47906 ?auto_47907 ) ( CLEAR ?auto_47906 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47909 ) ( ON ?auto_47908 ?auto_47909 ) ( not ( = ?auto_47909 ?auto_47908 ) ) ( not ( = ?auto_47909 ?auto_47907 ) ) ( not ( = ?auto_47909 ?auto_47906 ) ) ( not ( = ?auto_47904 ?auto_47909 ) ) ( not ( = ?auto_47905 ?auto_47909 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47909 ?auto_47908 ?auto_47907 )
      ( MAKE-4PILE ?auto_47904 ?auto_47905 ?auto_47906 ?auto_47907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47910 - BLOCK
      ?auto_47911 - BLOCK
      ?auto_47912 - BLOCK
      ?auto_47913 - BLOCK
    )
    :vars
    (
      ?auto_47915 - BLOCK
      ?auto_47914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47910 ) ( not ( = ?auto_47910 ?auto_47911 ) ) ( not ( = ?auto_47910 ?auto_47912 ) ) ( not ( = ?auto_47910 ?auto_47913 ) ) ( not ( = ?auto_47911 ?auto_47912 ) ) ( not ( = ?auto_47911 ?auto_47913 ) ) ( not ( = ?auto_47912 ?auto_47913 ) ) ( ON ?auto_47913 ?auto_47915 ) ( not ( = ?auto_47910 ?auto_47915 ) ) ( not ( = ?auto_47911 ?auto_47915 ) ) ( not ( = ?auto_47912 ?auto_47915 ) ) ( not ( = ?auto_47913 ?auto_47915 ) ) ( ON ?auto_47912 ?auto_47913 ) ( CLEAR ?auto_47912 ) ( ON-TABLE ?auto_47914 ) ( ON ?auto_47915 ?auto_47914 ) ( not ( = ?auto_47914 ?auto_47915 ) ) ( not ( = ?auto_47914 ?auto_47913 ) ) ( not ( = ?auto_47914 ?auto_47912 ) ) ( not ( = ?auto_47910 ?auto_47914 ) ) ( not ( = ?auto_47911 ?auto_47914 ) ) ( HOLDING ?auto_47911 ) ( CLEAR ?auto_47910 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47910 ?auto_47911 )
      ( MAKE-4PILE ?auto_47910 ?auto_47911 ?auto_47912 ?auto_47913 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47916 - BLOCK
      ?auto_47917 - BLOCK
      ?auto_47918 - BLOCK
      ?auto_47919 - BLOCK
    )
    :vars
    (
      ?auto_47920 - BLOCK
      ?auto_47921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_47916 ) ( not ( = ?auto_47916 ?auto_47917 ) ) ( not ( = ?auto_47916 ?auto_47918 ) ) ( not ( = ?auto_47916 ?auto_47919 ) ) ( not ( = ?auto_47917 ?auto_47918 ) ) ( not ( = ?auto_47917 ?auto_47919 ) ) ( not ( = ?auto_47918 ?auto_47919 ) ) ( ON ?auto_47919 ?auto_47920 ) ( not ( = ?auto_47916 ?auto_47920 ) ) ( not ( = ?auto_47917 ?auto_47920 ) ) ( not ( = ?auto_47918 ?auto_47920 ) ) ( not ( = ?auto_47919 ?auto_47920 ) ) ( ON ?auto_47918 ?auto_47919 ) ( ON-TABLE ?auto_47921 ) ( ON ?auto_47920 ?auto_47921 ) ( not ( = ?auto_47921 ?auto_47920 ) ) ( not ( = ?auto_47921 ?auto_47919 ) ) ( not ( = ?auto_47921 ?auto_47918 ) ) ( not ( = ?auto_47916 ?auto_47921 ) ) ( not ( = ?auto_47917 ?auto_47921 ) ) ( CLEAR ?auto_47916 ) ( ON ?auto_47917 ?auto_47918 ) ( CLEAR ?auto_47917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47921 ?auto_47920 ?auto_47919 ?auto_47918 )
      ( MAKE-4PILE ?auto_47916 ?auto_47917 ?auto_47918 ?auto_47919 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47922 - BLOCK
      ?auto_47923 - BLOCK
      ?auto_47924 - BLOCK
      ?auto_47925 - BLOCK
    )
    :vars
    (
      ?auto_47926 - BLOCK
      ?auto_47927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47922 ?auto_47923 ) ) ( not ( = ?auto_47922 ?auto_47924 ) ) ( not ( = ?auto_47922 ?auto_47925 ) ) ( not ( = ?auto_47923 ?auto_47924 ) ) ( not ( = ?auto_47923 ?auto_47925 ) ) ( not ( = ?auto_47924 ?auto_47925 ) ) ( ON ?auto_47925 ?auto_47926 ) ( not ( = ?auto_47922 ?auto_47926 ) ) ( not ( = ?auto_47923 ?auto_47926 ) ) ( not ( = ?auto_47924 ?auto_47926 ) ) ( not ( = ?auto_47925 ?auto_47926 ) ) ( ON ?auto_47924 ?auto_47925 ) ( ON-TABLE ?auto_47927 ) ( ON ?auto_47926 ?auto_47927 ) ( not ( = ?auto_47927 ?auto_47926 ) ) ( not ( = ?auto_47927 ?auto_47925 ) ) ( not ( = ?auto_47927 ?auto_47924 ) ) ( not ( = ?auto_47922 ?auto_47927 ) ) ( not ( = ?auto_47923 ?auto_47927 ) ) ( ON ?auto_47923 ?auto_47924 ) ( CLEAR ?auto_47923 ) ( HOLDING ?auto_47922 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_47922 )
      ( MAKE-4PILE ?auto_47922 ?auto_47923 ?auto_47924 ?auto_47925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47928 - BLOCK
      ?auto_47929 - BLOCK
      ?auto_47930 - BLOCK
      ?auto_47931 - BLOCK
    )
    :vars
    (
      ?auto_47933 - BLOCK
      ?auto_47932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47928 ?auto_47929 ) ) ( not ( = ?auto_47928 ?auto_47930 ) ) ( not ( = ?auto_47928 ?auto_47931 ) ) ( not ( = ?auto_47929 ?auto_47930 ) ) ( not ( = ?auto_47929 ?auto_47931 ) ) ( not ( = ?auto_47930 ?auto_47931 ) ) ( ON ?auto_47931 ?auto_47933 ) ( not ( = ?auto_47928 ?auto_47933 ) ) ( not ( = ?auto_47929 ?auto_47933 ) ) ( not ( = ?auto_47930 ?auto_47933 ) ) ( not ( = ?auto_47931 ?auto_47933 ) ) ( ON ?auto_47930 ?auto_47931 ) ( ON-TABLE ?auto_47932 ) ( ON ?auto_47933 ?auto_47932 ) ( not ( = ?auto_47932 ?auto_47933 ) ) ( not ( = ?auto_47932 ?auto_47931 ) ) ( not ( = ?auto_47932 ?auto_47930 ) ) ( not ( = ?auto_47928 ?auto_47932 ) ) ( not ( = ?auto_47929 ?auto_47932 ) ) ( ON ?auto_47929 ?auto_47930 ) ( ON ?auto_47928 ?auto_47929 ) ( CLEAR ?auto_47928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47932 ?auto_47933 ?auto_47931 ?auto_47930 ?auto_47929 )
      ( MAKE-4PILE ?auto_47928 ?auto_47929 ?auto_47930 ?auto_47931 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47934 - BLOCK
      ?auto_47935 - BLOCK
      ?auto_47936 - BLOCK
      ?auto_47937 - BLOCK
    )
    :vars
    (
      ?auto_47938 - BLOCK
      ?auto_47939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47934 ?auto_47935 ) ) ( not ( = ?auto_47934 ?auto_47936 ) ) ( not ( = ?auto_47934 ?auto_47937 ) ) ( not ( = ?auto_47935 ?auto_47936 ) ) ( not ( = ?auto_47935 ?auto_47937 ) ) ( not ( = ?auto_47936 ?auto_47937 ) ) ( ON ?auto_47937 ?auto_47938 ) ( not ( = ?auto_47934 ?auto_47938 ) ) ( not ( = ?auto_47935 ?auto_47938 ) ) ( not ( = ?auto_47936 ?auto_47938 ) ) ( not ( = ?auto_47937 ?auto_47938 ) ) ( ON ?auto_47936 ?auto_47937 ) ( ON-TABLE ?auto_47939 ) ( ON ?auto_47938 ?auto_47939 ) ( not ( = ?auto_47939 ?auto_47938 ) ) ( not ( = ?auto_47939 ?auto_47937 ) ) ( not ( = ?auto_47939 ?auto_47936 ) ) ( not ( = ?auto_47934 ?auto_47939 ) ) ( not ( = ?auto_47935 ?auto_47939 ) ) ( ON ?auto_47935 ?auto_47936 ) ( HOLDING ?auto_47934 ) ( CLEAR ?auto_47935 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_47939 ?auto_47938 ?auto_47937 ?auto_47936 ?auto_47935 ?auto_47934 )
      ( MAKE-4PILE ?auto_47934 ?auto_47935 ?auto_47936 ?auto_47937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47940 - BLOCK
      ?auto_47941 - BLOCK
      ?auto_47942 - BLOCK
      ?auto_47943 - BLOCK
    )
    :vars
    (
      ?auto_47945 - BLOCK
      ?auto_47944 - BLOCK
      ?auto_47946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47940 ?auto_47941 ) ) ( not ( = ?auto_47940 ?auto_47942 ) ) ( not ( = ?auto_47940 ?auto_47943 ) ) ( not ( = ?auto_47941 ?auto_47942 ) ) ( not ( = ?auto_47941 ?auto_47943 ) ) ( not ( = ?auto_47942 ?auto_47943 ) ) ( ON ?auto_47943 ?auto_47945 ) ( not ( = ?auto_47940 ?auto_47945 ) ) ( not ( = ?auto_47941 ?auto_47945 ) ) ( not ( = ?auto_47942 ?auto_47945 ) ) ( not ( = ?auto_47943 ?auto_47945 ) ) ( ON ?auto_47942 ?auto_47943 ) ( ON-TABLE ?auto_47944 ) ( ON ?auto_47945 ?auto_47944 ) ( not ( = ?auto_47944 ?auto_47945 ) ) ( not ( = ?auto_47944 ?auto_47943 ) ) ( not ( = ?auto_47944 ?auto_47942 ) ) ( not ( = ?auto_47940 ?auto_47944 ) ) ( not ( = ?auto_47941 ?auto_47944 ) ) ( ON ?auto_47941 ?auto_47942 ) ( CLEAR ?auto_47941 ) ( ON ?auto_47940 ?auto_47946 ) ( CLEAR ?auto_47940 ) ( HAND-EMPTY ) ( not ( = ?auto_47940 ?auto_47946 ) ) ( not ( = ?auto_47941 ?auto_47946 ) ) ( not ( = ?auto_47942 ?auto_47946 ) ) ( not ( = ?auto_47943 ?auto_47946 ) ) ( not ( = ?auto_47945 ?auto_47946 ) ) ( not ( = ?auto_47944 ?auto_47946 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47940 ?auto_47946 )
      ( MAKE-4PILE ?auto_47940 ?auto_47941 ?auto_47942 ?auto_47943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47947 - BLOCK
      ?auto_47948 - BLOCK
      ?auto_47949 - BLOCK
      ?auto_47950 - BLOCK
    )
    :vars
    (
      ?auto_47953 - BLOCK
      ?auto_47952 - BLOCK
      ?auto_47951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47947 ?auto_47948 ) ) ( not ( = ?auto_47947 ?auto_47949 ) ) ( not ( = ?auto_47947 ?auto_47950 ) ) ( not ( = ?auto_47948 ?auto_47949 ) ) ( not ( = ?auto_47948 ?auto_47950 ) ) ( not ( = ?auto_47949 ?auto_47950 ) ) ( ON ?auto_47950 ?auto_47953 ) ( not ( = ?auto_47947 ?auto_47953 ) ) ( not ( = ?auto_47948 ?auto_47953 ) ) ( not ( = ?auto_47949 ?auto_47953 ) ) ( not ( = ?auto_47950 ?auto_47953 ) ) ( ON ?auto_47949 ?auto_47950 ) ( ON-TABLE ?auto_47952 ) ( ON ?auto_47953 ?auto_47952 ) ( not ( = ?auto_47952 ?auto_47953 ) ) ( not ( = ?auto_47952 ?auto_47950 ) ) ( not ( = ?auto_47952 ?auto_47949 ) ) ( not ( = ?auto_47947 ?auto_47952 ) ) ( not ( = ?auto_47948 ?auto_47952 ) ) ( ON ?auto_47947 ?auto_47951 ) ( CLEAR ?auto_47947 ) ( not ( = ?auto_47947 ?auto_47951 ) ) ( not ( = ?auto_47948 ?auto_47951 ) ) ( not ( = ?auto_47949 ?auto_47951 ) ) ( not ( = ?auto_47950 ?auto_47951 ) ) ( not ( = ?auto_47953 ?auto_47951 ) ) ( not ( = ?auto_47952 ?auto_47951 ) ) ( HOLDING ?auto_47948 ) ( CLEAR ?auto_47949 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_47952 ?auto_47953 ?auto_47950 ?auto_47949 ?auto_47948 )
      ( MAKE-4PILE ?auto_47947 ?auto_47948 ?auto_47949 ?auto_47950 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47954 - BLOCK
      ?auto_47955 - BLOCK
      ?auto_47956 - BLOCK
      ?auto_47957 - BLOCK
    )
    :vars
    (
      ?auto_47960 - BLOCK
      ?auto_47959 - BLOCK
      ?auto_47958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47954 ?auto_47955 ) ) ( not ( = ?auto_47954 ?auto_47956 ) ) ( not ( = ?auto_47954 ?auto_47957 ) ) ( not ( = ?auto_47955 ?auto_47956 ) ) ( not ( = ?auto_47955 ?auto_47957 ) ) ( not ( = ?auto_47956 ?auto_47957 ) ) ( ON ?auto_47957 ?auto_47960 ) ( not ( = ?auto_47954 ?auto_47960 ) ) ( not ( = ?auto_47955 ?auto_47960 ) ) ( not ( = ?auto_47956 ?auto_47960 ) ) ( not ( = ?auto_47957 ?auto_47960 ) ) ( ON ?auto_47956 ?auto_47957 ) ( ON-TABLE ?auto_47959 ) ( ON ?auto_47960 ?auto_47959 ) ( not ( = ?auto_47959 ?auto_47960 ) ) ( not ( = ?auto_47959 ?auto_47957 ) ) ( not ( = ?auto_47959 ?auto_47956 ) ) ( not ( = ?auto_47954 ?auto_47959 ) ) ( not ( = ?auto_47955 ?auto_47959 ) ) ( ON ?auto_47954 ?auto_47958 ) ( not ( = ?auto_47954 ?auto_47958 ) ) ( not ( = ?auto_47955 ?auto_47958 ) ) ( not ( = ?auto_47956 ?auto_47958 ) ) ( not ( = ?auto_47957 ?auto_47958 ) ) ( not ( = ?auto_47960 ?auto_47958 ) ) ( not ( = ?auto_47959 ?auto_47958 ) ) ( CLEAR ?auto_47956 ) ( ON ?auto_47955 ?auto_47954 ) ( CLEAR ?auto_47955 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_47958 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47958 ?auto_47954 )
      ( MAKE-4PILE ?auto_47954 ?auto_47955 ?auto_47956 ?auto_47957 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47961 - BLOCK
      ?auto_47962 - BLOCK
      ?auto_47963 - BLOCK
      ?auto_47964 - BLOCK
    )
    :vars
    (
      ?auto_47966 - BLOCK
      ?auto_47965 - BLOCK
      ?auto_47967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47961 ?auto_47962 ) ) ( not ( = ?auto_47961 ?auto_47963 ) ) ( not ( = ?auto_47961 ?auto_47964 ) ) ( not ( = ?auto_47962 ?auto_47963 ) ) ( not ( = ?auto_47962 ?auto_47964 ) ) ( not ( = ?auto_47963 ?auto_47964 ) ) ( ON ?auto_47964 ?auto_47966 ) ( not ( = ?auto_47961 ?auto_47966 ) ) ( not ( = ?auto_47962 ?auto_47966 ) ) ( not ( = ?auto_47963 ?auto_47966 ) ) ( not ( = ?auto_47964 ?auto_47966 ) ) ( ON-TABLE ?auto_47965 ) ( ON ?auto_47966 ?auto_47965 ) ( not ( = ?auto_47965 ?auto_47966 ) ) ( not ( = ?auto_47965 ?auto_47964 ) ) ( not ( = ?auto_47965 ?auto_47963 ) ) ( not ( = ?auto_47961 ?auto_47965 ) ) ( not ( = ?auto_47962 ?auto_47965 ) ) ( ON ?auto_47961 ?auto_47967 ) ( not ( = ?auto_47961 ?auto_47967 ) ) ( not ( = ?auto_47962 ?auto_47967 ) ) ( not ( = ?auto_47963 ?auto_47967 ) ) ( not ( = ?auto_47964 ?auto_47967 ) ) ( not ( = ?auto_47966 ?auto_47967 ) ) ( not ( = ?auto_47965 ?auto_47967 ) ) ( ON ?auto_47962 ?auto_47961 ) ( CLEAR ?auto_47962 ) ( ON-TABLE ?auto_47967 ) ( HOLDING ?auto_47963 ) ( CLEAR ?auto_47964 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47965 ?auto_47966 ?auto_47964 ?auto_47963 )
      ( MAKE-4PILE ?auto_47961 ?auto_47962 ?auto_47963 ?auto_47964 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47968 - BLOCK
      ?auto_47969 - BLOCK
      ?auto_47970 - BLOCK
      ?auto_47971 - BLOCK
    )
    :vars
    (
      ?auto_47972 - BLOCK
      ?auto_47973 - BLOCK
      ?auto_47974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47968 ?auto_47969 ) ) ( not ( = ?auto_47968 ?auto_47970 ) ) ( not ( = ?auto_47968 ?auto_47971 ) ) ( not ( = ?auto_47969 ?auto_47970 ) ) ( not ( = ?auto_47969 ?auto_47971 ) ) ( not ( = ?auto_47970 ?auto_47971 ) ) ( ON ?auto_47971 ?auto_47972 ) ( not ( = ?auto_47968 ?auto_47972 ) ) ( not ( = ?auto_47969 ?auto_47972 ) ) ( not ( = ?auto_47970 ?auto_47972 ) ) ( not ( = ?auto_47971 ?auto_47972 ) ) ( ON-TABLE ?auto_47973 ) ( ON ?auto_47972 ?auto_47973 ) ( not ( = ?auto_47973 ?auto_47972 ) ) ( not ( = ?auto_47973 ?auto_47971 ) ) ( not ( = ?auto_47973 ?auto_47970 ) ) ( not ( = ?auto_47968 ?auto_47973 ) ) ( not ( = ?auto_47969 ?auto_47973 ) ) ( ON ?auto_47968 ?auto_47974 ) ( not ( = ?auto_47968 ?auto_47974 ) ) ( not ( = ?auto_47969 ?auto_47974 ) ) ( not ( = ?auto_47970 ?auto_47974 ) ) ( not ( = ?auto_47971 ?auto_47974 ) ) ( not ( = ?auto_47972 ?auto_47974 ) ) ( not ( = ?auto_47973 ?auto_47974 ) ) ( ON ?auto_47969 ?auto_47968 ) ( ON-TABLE ?auto_47974 ) ( CLEAR ?auto_47971 ) ( ON ?auto_47970 ?auto_47969 ) ( CLEAR ?auto_47970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47974 ?auto_47968 ?auto_47969 )
      ( MAKE-4PILE ?auto_47968 ?auto_47969 ?auto_47970 ?auto_47971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47975 - BLOCK
      ?auto_47976 - BLOCK
      ?auto_47977 - BLOCK
      ?auto_47978 - BLOCK
    )
    :vars
    (
      ?auto_47981 - BLOCK
      ?auto_47980 - BLOCK
      ?auto_47979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47975 ?auto_47976 ) ) ( not ( = ?auto_47975 ?auto_47977 ) ) ( not ( = ?auto_47975 ?auto_47978 ) ) ( not ( = ?auto_47976 ?auto_47977 ) ) ( not ( = ?auto_47976 ?auto_47978 ) ) ( not ( = ?auto_47977 ?auto_47978 ) ) ( not ( = ?auto_47975 ?auto_47981 ) ) ( not ( = ?auto_47976 ?auto_47981 ) ) ( not ( = ?auto_47977 ?auto_47981 ) ) ( not ( = ?auto_47978 ?auto_47981 ) ) ( ON-TABLE ?auto_47980 ) ( ON ?auto_47981 ?auto_47980 ) ( not ( = ?auto_47980 ?auto_47981 ) ) ( not ( = ?auto_47980 ?auto_47978 ) ) ( not ( = ?auto_47980 ?auto_47977 ) ) ( not ( = ?auto_47975 ?auto_47980 ) ) ( not ( = ?auto_47976 ?auto_47980 ) ) ( ON ?auto_47975 ?auto_47979 ) ( not ( = ?auto_47975 ?auto_47979 ) ) ( not ( = ?auto_47976 ?auto_47979 ) ) ( not ( = ?auto_47977 ?auto_47979 ) ) ( not ( = ?auto_47978 ?auto_47979 ) ) ( not ( = ?auto_47981 ?auto_47979 ) ) ( not ( = ?auto_47980 ?auto_47979 ) ) ( ON ?auto_47976 ?auto_47975 ) ( ON-TABLE ?auto_47979 ) ( ON ?auto_47977 ?auto_47976 ) ( CLEAR ?auto_47977 ) ( HOLDING ?auto_47978 ) ( CLEAR ?auto_47981 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_47980 ?auto_47981 ?auto_47978 )
      ( MAKE-4PILE ?auto_47975 ?auto_47976 ?auto_47977 ?auto_47978 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47982 - BLOCK
      ?auto_47983 - BLOCK
      ?auto_47984 - BLOCK
      ?auto_47985 - BLOCK
    )
    :vars
    (
      ?auto_47988 - BLOCK
      ?auto_47987 - BLOCK
      ?auto_47986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47982 ?auto_47983 ) ) ( not ( = ?auto_47982 ?auto_47984 ) ) ( not ( = ?auto_47982 ?auto_47985 ) ) ( not ( = ?auto_47983 ?auto_47984 ) ) ( not ( = ?auto_47983 ?auto_47985 ) ) ( not ( = ?auto_47984 ?auto_47985 ) ) ( not ( = ?auto_47982 ?auto_47988 ) ) ( not ( = ?auto_47983 ?auto_47988 ) ) ( not ( = ?auto_47984 ?auto_47988 ) ) ( not ( = ?auto_47985 ?auto_47988 ) ) ( ON-TABLE ?auto_47987 ) ( ON ?auto_47988 ?auto_47987 ) ( not ( = ?auto_47987 ?auto_47988 ) ) ( not ( = ?auto_47987 ?auto_47985 ) ) ( not ( = ?auto_47987 ?auto_47984 ) ) ( not ( = ?auto_47982 ?auto_47987 ) ) ( not ( = ?auto_47983 ?auto_47987 ) ) ( ON ?auto_47982 ?auto_47986 ) ( not ( = ?auto_47982 ?auto_47986 ) ) ( not ( = ?auto_47983 ?auto_47986 ) ) ( not ( = ?auto_47984 ?auto_47986 ) ) ( not ( = ?auto_47985 ?auto_47986 ) ) ( not ( = ?auto_47988 ?auto_47986 ) ) ( not ( = ?auto_47987 ?auto_47986 ) ) ( ON ?auto_47983 ?auto_47982 ) ( ON-TABLE ?auto_47986 ) ( ON ?auto_47984 ?auto_47983 ) ( CLEAR ?auto_47988 ) ( ON ?auto_47985 ?auto_47984 ) ( CLEAR ?auto_47985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_47986 ?auto_47982 ?auto_47983 ?auto_47984 )
      ( MAKE-4PILE ?auto_47982 ?auto_47983 ?auto_47984 ?auto_47985 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47989 - BLOCK
      ?auto_47990 - BLOCK
      ?auto_47991 - BLOCK
      ?auto_47992 - BLOCK
    )
    :vars
    (
      ?auto_47993 - BLOCK
      ?auto_47994 - BLOCK
      ?auto_47995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47989 ?auto_47990 ) ) ( not ( = ?auto_47989 ?auto_47991 ) ) ( not ( = ?auto_47989 ?auto_47992 ) ) ( not ( = ?auto_47990 ?auto_47991 ) ) ( not ( = ?auto_47990 ?auto_47992 ) ) ( not ( = ?auto_47991 ?auto_47992 ) ) ( not ( = ?auto_47989 ?auto_47993 ) ) ( not ( = ?auto_47990 ?auto_47993 ) ) ( not ( = ?auto_47991 ?auto_47993 ) ) ( not ( = ?auto_47992 ?auto_47993 ) ) ( ON-TABLE ?auto_47994 ) ( not ( = ?auto_47994 ?auto_47993 ) ) ( not ( = ?auto_47994 ?auto_47992 ) ) ( not ( = ?auto_47994 ?auto_47991 ) ) ( not ( = ?auto_47989 ?auto_47994 ) ) ( not ( = ?auto_47990 ?auto_47994 ) ) ( ON ?auto_47989 ?auto_47995 ) ( not ( = ?auto_47989 ?auto_47995 ) ) ( not ( = ?auto_47990 ?auto_47995 ) ) ( not ( = ?auto_47991 ?auto_47995 ) ) ( not ( = ?auto_47992 ?auto_47995 ) ) ( not ( = ?auto_47993 ?auto_47995 ) ) ( not ( = ?auto_47994 ?auto_47995 ) ) ( ON ?auto_47990 ?auto_47989 ) ( ON-TABLE ?auto_47995 ) ( ON ?auto_47991 ?auto_47990 ) ( ON ?auto_47992 ?auto_47991 ) ( CLEAR ?auto_47992 ) ( HOLDING ?auto_47993 ) ( CLEAR ?auto_47994 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_47994 ?auto_47993 )
      ( MAKE-4PILE ?auto_47989 ?auto_47990 ?auto_47991 ?auto_47992 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_47996 - BLOCK
      ?auto_47997 - BLOCK
      ?auto_47998 - BLOCK
      ?auto_47999 - BLOCK
    )
    :vars
    (
      ?auto_48001 - BLOCK
      ?auto_48000 - BLOCK
      ?auto_48002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_47996 ?auto_47997 ) ) ( not ( = ?auto_47996 ?auto_47998 ) ) ( not ( = ?auto_47996 ?auto_47999 ) ) ( not ( = ?auto_47997 ?auto_47998 ) ) ( not ( = ?auto_47997 ?auto_47999 ) ) ( not ( = ?auto_47998 ?auto_47999 ) ) ( not ( = ?auto_47996 ?auto_48001 ) ) ( not ( = ?auto_47997 ?auto_48001 ) ) ( not ( = ?auto_47998 ?auto_48001 ) ) ( not ( = ?auto_47999 ?auto_48001 ) ) ( ON-TABLE ?auto_48000 ) ( not ( = ?auto_48000 ?auto_48001 ) ) ( not ( = ?auto_48000 ?auto_47999 ) ) ( not ( = ?auto_48000 ?auto_47998 ) ) ( not ( = ?auto_47996 ?auto_48000 ) ) ( not ( = ?auto_47997 ?auto_48000 ) ) ( ON ?auto_47996 ?auto_48002 ) ( not ( = ?auto_47996 ?auto_48002 ) ) ( not ( = ?auto_47997 ?auto_48002 ) ) ( not ( = ?auto_47998 ?auto_48002 ) ) ( not ( = ?auto_47999 ?auto_48002 ) ) ( not ( = ?auto_48001 ?auto_48002 ) ) ( not ( = ?auto_48000 ?auto_48002 ) ) ( ON ?auto_47997 ?auto_47996 ) ( ON-TABLE ?auto_48002 ) ( ON ?auto_47998 ?auto_47997 ) ( ON ?auto_47999 ?auto_47998 ) ( CLEAR ?auto_48000 ) ( ON ?auto_48001 ?auto_47999 ) ( CLEAR ?auto_48001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48002 ?auto_47996 ?auto_47997 ?auto_47998 ?auto_47999 )
      ( MAKE-4PILE ?auto_47996 ?auto_47997 ?auto_47998 ?auto_47999 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48003 - BLOCK
      ?auto_48004 - BLOCK
      ?auto_48005 - BLOCK
      ?auto_48006 - BLOCK
    )
    :vars
    (
      ?auto_48007 - BLOCK
      ?auto_48009 - BLOCK
      ?auto_48008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48003 ?auto_48004 ) ) ( not ( = ?auto_48003 ?auto_48005 ) ) ( not ( = ?auto_48003 ?auto_48006 ) ) ( not ( = ?auto_48004 ?auto_48005 ) ) ( not ( = ?auto_48004 ?auto_48006 ) ) ( not ( = ?auto_48005 ?auto_48006 ) ) ( not ( = ?auto_48003 ?auto_48007 ) ) ( not ( = ?auto_48004 ?auto_48007 ) ) ( not ( = ?auto_48005 ?auto_48007 ) ) ( not ( = ?auto_48006 ?auto_48007 ) ) ( not ( = ?auto_48009 ?auto_48007 ) ) ( not ( = ?auto_48009 ?auto_48006 ) ) ( not ( = ?auto_48009 ?auto_48005 ) ) ( not ( = ?auto_48003 ?auto_48009 ) ) ( not ( = ?auto_48004 ?auto_48009 ) ) ( ON ?auto_48003 ?auto_48008 ) ( not ( = ?auto_48003 ?auto_48008 ) ) ( not ( = ?auto_48004 ?auto_48008 ) ) ( not ( = ?auto_48005 ?auto_48008 ) ) ( not ( = ?auto_48006 ?auto_48008 ) ) ( not ( = ?auto_48007 ?auto_48008 ) ) ( not ( = ?auto_48009 ?auto_48008 ) ) ( ON ?auto_48004 ?auto_48003 ) ( ON-TABLE ?auto_48008 ) ( ON ?auto_48005 ?auto_48004 ) ( ON ?auto_48006 ?auto_48005 ) ( ON ?auto_48007 ?auto_48006 ) ( CLEAR ?auto_48007 ) ( HOLDING ?auto_48009 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48009 )
      ( MAKE-4PILE ?auto_48003 ?auto_48004 ?auto_48005 ?auto_48006 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_48010 - BLOCK
      ?auto_48011 - BLOCK
      ?auto_48012 - BLOCK
      ?auto_48013 - BLOCK
    )
    :vars
    (
      ?auto_48016 - BLOCK
      ?auto_48015 - BLOCK
      ?auto_48014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48010 ?auto_48011 ) ) ( not ( = ?auto_48010 ?auto_48012 ) ) ( not ( = ?auto_48010 ?auto_48013 ) ) ( not ( = ?auto_48011 ?auto_48012 ) ) ( not ( = ?auto_48011 ?auto_48013 ) ) ( not ( = ?auto_48012 ?auto_48013 ) ) ( not ( = ?auto_48010 ?auto_48016 ) ) ( not ( = ?auto_48011 ?auto_48016 ) ) ( not ( = ?auto_48012 ?auto_48016 ) ) ( not ( = ?auto_48013 ?auto_48016 ) ) ( not ( = ?auto_48015 ?auto_48016 ) ) ( not ( = ?auto_48015 ?auto_48013 ) ) ( not ( = ?auto_48015 ?auto_48012 ) ) ( not ( = ?auto_48010 ?auto_48015 ) ) ( not ( = ?auto_48011 ?auto_48015 ) ) ( ON ?auto_48010 ?auto_48014 ) ( not ( = ?auto_48010 ?auto_48014 ) ) ( not ( = ?auto_48011 ?auto_48014 ) ) ( not ( = ?auto_48012 ?auto_48014 ) ) ( not ( = ?auto_48013 ?auto_48014 ) ) ( not ( = ?auto_48016 ?auto_48014 ) ) ( not ( = ?auto_48015 ?auto_48014 ) ) ( ON ?auto_48011 ?auto_48010 ) ( ON-TABLE ?auto_48014 ) ( ON ?auto_48012 ?auto_48011 ) ( ON ?auto_48013 ?auto_48012 ) ( ON ?auto_48016 ?auto_48013 ) ( ON ?auto_48015 ?auto_48016 ) ( CLEAR ?auto_48015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48014 ?auto_48010 ?auto_48011 ?auto_48012 ?auto_48013 ?auto_48016 )
      ( MAKE-4PILE ?auto_48010 ?auto_48011 ?auto_48012 ?auto_48013 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48018 - BLOCK
    )
    :vars
    (
      ?auto_48019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48019 ?auto_48018 ) ( CLEAR ?auto_48019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48018 ) ( not ( = ?auto_48018 ?auto_48019 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48019 ?auto_48018 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48020 - BLOCK
    )
    :vars
    (
      ?auto_48021 - BLOCK
      ?auto_48022 - BLOCK
      ?auto_48023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48021 ?auto_48020 ) ( CLEAR ?auto_48021 ) ( ON-TABLE ?auto_48020 ) ( not ( = ?auto_48020 ?auto_48021 ) ) ( HOLDING ?auto_48022 ) ( CLEAR ?auto_48023 ) ( not ( = ?auto_48020 ?auto_48022 ) ) ( not ( = ?auto_48020 ?auto_48023 ) ) ( not ( = ?auto_48021 ?auto_48022 ) ) ( not ( = ?auto_48021 ?auto_48023 ) ) ( not ( = ?auto_48022 ?auto_48023 ) ) )
    :subtasks
    ( ( !STACK ?auto_48022 ?auto_48023 )
      ( MAKE-1PILE ?auto_48020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48024 - BLOCK
    )
    :vars
    (
      ?auto_48027 - BLOCK
      ?auto_48025 - BLOCK
      ?auto_48026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48027 ?auto_48024 ) ( ON-TABLE ?auto_48024 ) ( not ( = ?auto_48024 ?auto_48027 ) ) ( CLEAR ?auto_48025 ) ( not ( = ?auto_48024 ?auto_48026 ) ) ( not ( = ?auto_48024 ?auto_48025 ) ) ( not ( = ?auto_48027 ?auto_48026 ) ) ( not ( = ?auto_48027 ?auto_48025 ) ) ( not ( = ?auto_48026 ?auto_48025 ) ) ( ON ?auto_48026 ?auto_48027 ) ( CLEAR ?auto_48026 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48024 ?auto_48027 )
      ( MAKE-1PILE ?auto_48024 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48028 - BLOCK
    )
    :vars
    (
      ?auto_48029 - BLOCK
      ?auto_48030 - BLOCK
      ?auto_48031 - BLOCK
      ?auto_48032 - BLOCK
      ?auto_48033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48029 ?auto_48028 ) ( ON-TABLE ?auto_48028 ) ( not ( = ?auto_48028 ?auto_48029 ) ) ( not ( = ?auto_48028 ?auto_48030 ) ) ( not ( = ?auto_48028 ?auto_48031 ) ) ( not ( = ?auto_48029 ?auto_48030 ) ) ( not ( = ?auto_48029 ?auto_48031 ) ) ( not ( = ?auto_48030 ?auto_48031 ) ) ( ON ?auto_48030 ?auto_48029 ) ( CLEAR ?auto_48030 ) ( HOLDING ?auto_48031 ) ( CLEAR ?auto_48032 ) ( ON-TABLE ?auto_48033 ) ( ON ?auto_48032 ?auto_48033 ) ( not ( = ?auto_48033 ?auto_48032 ) ) ( not ( = ?auto_48033 ?auto_48031 ) ) ( not ( = ?auto_48032 ?auto_48031 ) ) ( not ( = ?auto_48028 ?auto_48032 ) ) ( not ( = ?auto_48028 ?auto_48033 ) ) ( not ( = ?auto_48029 ?auto_48032 ) ) ( not ( = ?auto_48029 ?auto_48033 ) ) ( not ( = ?auto_48030 ?auto_48032 ) ) ( not ( = ?auto_48030 ?auto_48033 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48033 ?auto_48032 ?auto_48031 )
      ( MAKE-1PILE ?auto_48028 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48034 - BLOCK
    )
    :vars
    (
      ?auto_48039 - BLOCK
      ?auto_48038 - BLOCK
      ?auto_48037 - BLOCK
      ?auto_48035 - BLOCK
      ?auto_48036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48039 ?auto_48034 ) ( ON-TABLE ?auto_48034 ) ( not ( = ?auto_48034 ?auto_48039 ) ) ( not ( = ?auto_48034 ?auto_48038 ) ) ( not ( = ?auto_48034 ?auto_48037 ) ) ( not ( = ?auto_48039 ?auto_48038 ) ) ( not ( = ?auto_48039 ?auto_48037 ) ) ( not ( = ?auto_48038 ?auto_48037 ) ) ( ON ?auto_48038 ?auto_48039 ) ( CLEAR ?auto_48035 ) ( ON-TABLE ?auto_48036 ) ( ON ?auto_48035 ?auto_48036 ) ( not ( = ?auto_48036 ?auto_48035 ) ) ( not ( = ?auto_48036 ?auto_48037 ) ) ( not ( = ?auto_48035 ?auto_48037 ) ) ( not ( = ?auto_48034 ?auto_48035 ) ) ( not ( = ?auto_48034 ?auto_48036 ) ) ( not ( = ?auto_48039 ?auto_48035 ) ) ( not ( = ?auto_48039 ?auto_48036 ) ) ( not ( = ?auto_48038 ?auto_48035 ) ) ( not ( = ?auto_48038 ?auto_48036 ) ) ( ON ?auto_48037 ?auto_48038 ) ( CLEAR ?auto_48037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48034 ?auto_48039 ?auto_48038 )
      ( MAKE-1PILE ?auto_48034 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48040 - BLOCK
    )
    :vars
    (
      ?auto_48042 - BLOCK
      ?auto_48044 - BLOCK
      ?auto_48043 - BLOCK
      ?auto_48041 - BLOCK
      ?auto_48045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48042 ?auto_48040 ) ( ON-TABLE ?auto_48040 ) ( not ( = ?auto_48040 ?auto_48042 ) ) ( not ( = ?auto_48040 ?auto_48044 ) ) ( not ( = ?auto_48040 ?auto_48043 ) ) ( not ( = ?auto_48042 ?auto_48044 ) ) ( not ( = ?auto_48042 ?auto_48043 ) ) ( not ( = ?auto_48044 ?auto_48043 ) ) ( ON ?auto_48044 ?auto_48042 ) ( ON-TABLE ?auto_48041 ) ( not ( = ?auto_48041 ?auto_48045 ) ) ( not ( = ?auto_48041 ?auto_48043 ) ) ( not ( = ?auto_48045 ?auto_48043 ) ) ( not ( = ?auto_48040 ?auto_48045 ) ) ( not ( = ?auto_48040 ?auto_48041 ) ) ( not ( = ?auto_48042 ?auto_48045 ) ) ( not ( = ?auto_48042 ?auto_48041 ) ) ( not ( = ?auto_48044 ?auto_48045 ) ) ( not ( = ?auto_48044 ?auto_48041 ) ) ( ON ?auto_48043 ?auto_48044 ) ( CLEAR ?auto_48043 ) ( HOLDING ?auto_48045 ) ( CLEAR ?auto_48041 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48041 ?auto_48045 )
      ( MAKE-1PILE ?auto_48040 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48046 - BLOCK
    )
    :vars
    (
      ?auto_48049 - BLOCK
      ?auto_48050 - BLOCK
      ?auto_48047 - BLOCK
      ?auto_48051 - BLOCK
      ?auto_48048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48049 ?auto_48046 ) ( ON-TABLE ?auto_48046 ) ( not ( = ?auto_48046 ?auto_48049 ) ) ( not ( = ?auto_48046 ?auto_48050 ) ) ( not ( = ?auto_48046 ?auto_48047 ) ) ( not ( = ?auto_48049 ?auto_48050 ) ) ( not ( = ?auto_48049 ?auto_48047 ) ) ( not ( = ?auto_48050 ?auto_48047 ) ) ( ON ?auto_48050 ?auto_48049 ) ( ON-TABLE ?auto_48051 ) ( not ( = ?auto_48051 ?auto_48048 ) ) ( not ( = ?auto_48051 ?auto_48047 ) ) ( not ( = ?auto_48048 ?auto_48047 ) ) ( not ( = ?auto_48046 ?auto_48048 ) ) ( not ( = ?auto_48046 ?auto_48051 ) ) ( not ( = ?auto_48049 ?auto_48048 ) ) ( not ( = ?auto_48049 ?auto_48051 ) ) ( not ( = ?auto_48050 ?auto_48048 ) ) ( not ( = ?auto_48050 ?auto_48051 ) ) ( ON ?auto_48047 ?auto_48050 ) ( CLEAR ?auto_48051 ) ( ON ?auto_48048 ?auto_48047 ) ( CLEAR ?auto_48048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48046 ?auto_48049 ?auto_48050 ?auto_48047 )
      ( MAKE-1PILE ?auto_48046 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48052 - BLOCK
    )
    :vars
    (
      ?auto_48057 - BLOCK
      ?auto_48053 - BLOCK
      ?auto_48056 - BLOCK
      ?auto_48055 - BLOCK
      ?auto_48054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48057 ?auto_48052 ) ( ON-TABLE ?auto_48052 ) ( not ( = ?auto_48052 ?auto_48057 ) ) ( not ( = ?auto_48052 ?auto_48053 ) ) ( not ( = ?auto_48052 ?auto_48056 ) ) ( not ( = ?auto_48057 ?auto_48053 ) ) ( not ( = ?auto_48057 ?auto_48056 ) ) ( not ( = ?auto_48053 ?auto_48056 ) ) ( ON ?auto_48053 ?auto_48057 ) ( not ( = ?auto_48055 ?auto_48054 ) ) ( not ( = ?auto_48055 ?auto_48056 ) ) ( not ( = ?auto_48054 ?auto_48056 ) ) ( not ( = ?auto_48052 ?auto_48054 ) ) ( not ( = ?auto_48052 ?auto_48055 ) ) ( not ( = ?auto_48057 ?auto_48054 ) ) ( not ( = ?auto_48057 ?auto_48055 ) ) ( not ( = ?auto_48053 ?auto_48054 ) ) ( not ( = ?auto_48053 ?auto_48055 ) ) ( ON ?auto_48056 ?auto_48053 ) ( ON ?auto_48054 ?auto_48056 ) ( CLEAR ?auto_48054 ) ( HOLDING ?auto_48055 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48055 )
      ( MAKE-1PILE ?auto_48052 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48058 - BLOCK
    )
    :vars
    (
      ?auto_48062 - BLOCK
      ?auto_48063 - BLOCK
      ?auto_48061 - BLOCK
      ?auto_48059 - BLOCK
      ?auto_48060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48062 ?auto_48058 ) ( ON-TABLE ?auto_48058 ) ( not ( = ?auto_48058 ?auto_48062 ) ) ( not ( = ?auto_48058 ?auto_48063 ) ) ( not ( = ?auto_48058 ?auto_48061 ) ) ( not ( = ?auto_48062 ?auto_48063 ) ) ( not ( = ?auto_48062 ?auto_48061 ) ) ( not ( = ?auto_48063 ?auto_48061 ) ) ( ON ?auto_48063 ?auto_48062 ) ( not ( = ?auto_48059 ?auto_48060 ) ) ( not ( = ?auto_48059 ?auto_48061 ) ) ( not ( = ?auto_48060 ?auto_48061 ) ) ( not ( = ?auto_48058 ?auto_48060 ) ) ( not ( = ?auto_48058 ?auto_48059 ) ) ( not ( = ?auto_48062 ?auto_48060 ) ) ( not ( = ?auto_48062 ?auto_48059 ) ) ( not ( = ?auto_48063 ?auto_48060 ) ) ( not ( = ?auto_48063 ?auto_48059 ) ) ( ON ?auto_48061 ?auto_48063 ) ( ON ?auto_48060 ?auto_48061 ) ( ON ?auto_48059 ?auto_48060 ) ( CLEAR ?auto_48059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48058 ?auto_48062 ?auto_48063 ?auto_48061 ?auto_48060 )
      ( MAKE-1PILE ?auto_48058 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48064 - BLOCK
    )
    :vars
    (
      ?auto_48066 - BLOCK
      ?auto_48067 - BLOCK
      ?auto_48068 - BLOCK
      ?auto_48065 - BLOCK
      ?auto_48069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48066 ?auto_48064 ) ( ON-TABLE ?auto_48064 ) ( not ( = ?auto_48064 ?auto_48066 ) ) ( not ( = ?auto_48064 ?auto_48067 ) ) ( not ( = ?auto_48064 ?auto_48068 ) ) ( not ( = ?auto_48066 ?auto_48067 ) ) ( not ( = ?auto_48066 ?auto_48068 ) ) ( not ( = ?auto_48067 ?auto_48068 ) ) ( ON ?auto_48067 ?auto_48066 ) ( not ( = ?auto_48065 ?auto_48069 ) ) ( not ( = ?auto_48065 ?auto_48068 ) ) ( not ( = ?auto_48069 ?auto_48068 ) ) ( not ( = ?auto_48064 ?auto_48069 ) ) ( not ( = ?auto_48064 ?auto_48065 ) ) ( not ( = ?auto_48066 ?auto_48069 ) ) ( not ( = ?auto_48066 ?auto_48065 ) ) ( not ( = ?auto_48067 ?auto_48069 ) ) ( not ( = ?auto_48067 ?auto_48065 ) ) ( ON ?auto_48068 ?auto_48067 ) ( ON ?auto_48069 ?auto_48068 ) ( HOLDING ?auto_48065 ) ( CLEAR ?auto_48069 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48064 ?auto_48066 ?auto_48067 ?auto_48068 ?auto_48069 ?auto_48065 )
      ( MAKE-1PILE ?auto_48064 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48070 - BLOCK
    )
    :vars
    (
      ?auto_48073 - BLOCK
      ?auto_48072 - BLOCK
      ?auto_48074 - BLOCK
      ?auto_48071 - BLOCK
      ?auto_48075 - BLOCK
      ?auto_48076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48073 ?auto_48070 ) ( ON-TABLE ?auto_48070 ) ( not ( = ?auto_48070 ?auto_48073 ) ) ( not ( = ?auto_48070 ?auto_48072 ) ) ( not ( = ?auto_48070 ?auto_48074 ) ) ( not ( = ?auto_48073 ?auto_48072 ) ) ( not ( = ?auto_48073 ?auto_48074 ) ) ( not ( = ?auto_48072 ?auto_48074 ) ) ( ON ?auto_48072 ?auto_48073 ) ( not ( = ?auto_48071 ?auto_48075 ) ) ( not ( = ?auto_48071 ?auto_48074 ) ) ( not ( = ?auto_48075 ?auto_48074 ) ) ( not ( = ?auto_48070 ?auto_48075 ) ) ( not ( = ?auto_48070 ?auto_48071 ) ) ( not ( = ?auto_48073 ?auto_48075 ) ) ( not ( = ?auto_48073 ?auto_48071 ) ) ( not ( = ?auto_48072 ?auto_48075 ) ) ( not ( = ?auto_48072 ?auto_48071 ) ) ( ON ?auto_48074 ?auto_48072 ) ( ON ?auto_48075 ?auto_48074 ) ( CLEAR ?auto_48075 ) ( ON ?auto_48071 ?auto_48076 ) ( CLEAR ?auto_48071 ) ( HAND-EMPTY ) ( not ( = ?auto_48070 ?auto_48076 ) ) ( not ( = ?auto_48073 ?auto_48076 ) ) ( not ( = ?auto_48072 ?auto_48076 ) ) ( not ( = ?auto_48074 ?auto_48076 ) ) ( not ( = ?auto_48071 ?auto_48076 ) ) ( not ( = ?auto_48075 ?auto_48076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48071 ?auto_48076 )
      ( MAKE-1PILE ?auto_48070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48077 - BLOCK
    )
    :vars
    (
      ?auto_48079 - BLOCK
      ?auto_48080 - BLOCK
      ?auto_48082 - BLOCK
      ?auto_48078 - BLOCK
      ?auto_48083 - BLOCK
      ?auto_48081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48079 ?auto_48077 ) ( ON-TABLE ?auto_48077 ) ( not ( = ?auto_48077 ?auto_48079 ) ) ( not ( = ?auto_48077 ?auto_48080 ) ) ( not ( = ?auto_48077 ?auto_48082 ) ) ( not ( = ?auto_48079 ?auto_48080 ) ) ( not ( = ?auto_48079 ?auto_48082 ) ) ( not ( = ?auto_48080 ?auto_48082 ) ) ( ON ?auto_48080 ?auto_48079 ) ( not ( = ?auto_48078 ?auto_48083 ) ) ( not ( = ?auto_48078 ?auto_48082 ) ) ( not ( = ?auto_48083 ?auto_48082 ) ) ( not ( = ?auto_48077 ?auto_48083 ) ) ( not ( = ?auto_48077 ?auto_48078 ) ) ( not ( = ?auto_48079 ?auto_48083 ) ) ( not ( = ?auto_48079 ?auto_48078 ) ) ( not ( = ?auto_48080 ?auto_48083 ) ) ( not ( = ?auto_48080 ?auto_48078 ) ) ( ON ?auto_48082 ?auto_48080 ) ( ON ?auto_48078 ?auto_48081 ) ( CLEAR ?auto_48078 ) ( not ( = ?auto_48077 ?auto_48081 ) ) ( not ( = ?auto_48079 ?auto_48081 ) ) ( not ( = ?auto_48080 ?auto_48081 ) ) ( not ( = ?auto_48082 ?auto_48081 ) ) ( not ( = ?auto_48078 ?auto_48081 ) ) ( not ( = ?auto_48083 ?auto_48081 ) ) ( HOLDING ?auto_48083 ) ( CLEAR ?auto_48082 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48077 ?auto_48079 ?auto_48080 ?auto_48082 ?auto_48083 )
      ( MAKE-1PILE ?auto_48077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48084 - BLOCK
    )
    :vars
    (
      ?auto_48087 - BLOCK
      ?auto_48086 - BLOCK
      ?auto_48090 - BLOCK
      ?auto_48089 - BLOCK
      ?auto_48085 - BLOCK
      ?auto_48088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48087 ?auto_48084 ) ( ON-TABLE ?auto_48084 ) ( not ( = ?auto_48084 ?auto_48087 ) ) ( not ( = ?auto_48084 ?auto_48086 ) ) ( not ( = ?auto_48084 ?auto_48090 ) ) ( not ( = ?auto_48087 ?auto_48086 ) ) ( not ( = ?auto_48087 ?auto_48090 ) ) ( not ( = ?auto_48086 ?auto_48090 ) ) ( ON ?auto_48086 ?auto_48087 ) ( not ( = ?auto_48089 ?auto_48085 ) ) ( not ( = ?auto_48089 ?auto_48090 ) ) ( not ( = ?auto_48085 ?auto_48090 ) ) ( not ( = ?auto_48084 ?auto_48085 ) ) ( not ( = ?auto_48084 ?auto_48089 ) ) ( not ( = ?auto_48087 ?auto_48085 ) ) ( not ( = ?auto_48087 ?auto_48089 ) ) ( not ( = ?auto_48086 ?auto_48085 ) ) ( not ( = ?auto_48086 ?auto_48089 ) ) ( ON ?auto_48090 ?auto_48086 ) ( ON ?auto_48089 ?auto_48088 ) ( not ( = ?auto_48084 ?auto_48088 ) ) ( not ( = ?auto_48087 ?auto_48088 ) ) ( not ( = ?auto_48086 ?auto_48088 ) ) ( not ( = ?auto_48090 ?auto_48088 ) ) ( not ( = ?auto_48089 ?auto_48088 ) ) ( not ( = ?auto_48085 ?auto_48088 ) ) ( CLEAR ?auto_48090 ) ( ON ?auto_48085 ?auto_48089 ) ( CLEAR ?auto_48085 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48088 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48088 ?auto_48089 )
      ( MAKE-1PILE ?auto_48084 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48091 - BLOCK
    )
    :vars
    (
      ?auto_48093 - BLOCK
      ?auto_48094 - BLOCK
      ?auto_48097 - BLOCK
      ?auto_48092 - BLOCK
      ?auto_48096 - BLOCK
      ?auto_48095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48093 ?auto_48091 ) ( ON-TABLE ?auto_48091 ) ( not ( = ?auto_48091 ?auto_48093 ) ) ( not ( = ?auto_48091 ?auto_48094 ) ) ( not ( = ?auto_48091 ?auto_48097 ) ) ( not ( = ?auto_48093 ?auto_48094 ) ) ( not ( = ?auto_48093 ?auto_48097 ) ) ( not ( = ?auto_48094 ?auto_48097 ) ) ( ON ?auto_48094 ?auto_48093 ) ( not ( = ?auto_48092 ?auto_48096 ) ) ( not ( = ?auto_48092 ?auto_48097 ) ) ( not ( = ?auto_48096 ?auto_48097 ) ) ( not ( = ?auto_48091 ?auto_48096 ) ) ( not ( = ?auto_48091 ?auto_48092 ) ) ( not ( = ?auto_48093 ?auto_48096 ) ) ( not ( = ?auto_48093 ?auto_48092 ) ) ( not ( = ?auto_48094 ?auto_48096 ) ) ( not ( = ?auto_48094 ?auto_48092 ) ) ( ON ?auto_48092 ?auto_48095 ) ( not ( = ?auto_48091 ?auto_48095 ) ) ( not ( = ?auto_48093 ?auto_48095 ) ) ( not ( = ?auto_48094 ?auto_48095 ) ) ( not ( = ?auto_48097 ?auto_48095 ) ) ( not ( = ?auto_48092 ?auto_48095 ) ) ( not ( = ?auto_48096 ?auto_48095 ) ) ( ON ?auto_48096 ?auto_48092 ) ( CLEAR ?auto_48096 ) ( ON-TABLE ?auto_48095 ) ( HOLDING ?auto_48097 ) ( CLEAR ?auto_48094 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48091 ?auto_48093 ?auto_48094 ?auto_48097 )
      ( MAKE-1PILE ?auto_48091 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48098 - BLOCK
    )
    :vars
    (
      ?auto_48099 - BLOCK
      ?auto_48102 - BLOCK
      ?auto_48104 - BLOCK
      ?auto_48101 - BLOCK
      ?auto_48103 - BLOCK
      ?auto_48100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48099 ?auto_48098 ) ( ON-TABLE ?auto_48098 ) ( not ( = ?auto_48098 ?auto_48099 ) ) ( not ( = ?auto_48098 ?auto_48102 ) ) ( not ( = ?auto_48098 ?auto_48104 ) ) ( not ( = ?auto_48099 ?auto_48102 ) ) ( not ( = ?auto_48099 ?auto_48104 ) ) ( not ( = ?auto_48102 ?auto_48104 ) ) ( ON ?auto_48102 ?auto_48099 ) ( not ( = ?auto_48101 ?auto_48103 ) ) ( not ( = ?auto_48101 ?auto_48104 ) ) ( not ( = ?auto_48103 ?auto_48104 ) ) ( not ( = ?auto_48098 ?auto_48103 ) ) ( not ( = ?auto_48098 ?auto_48101 ) ) ( not ( = ?auto_48099 ?auto_48103 ) ) ( not ( = ?auto_48099 ?auto_48101 ) ) ( not ( = ?auto_48102 ?auto_48103 ) ) ( not ( = ?auto_48102 ?auto_48101 ) ) ( ON ?auto_48101 ?auto_48100 ) ( not ( = ?auto_48098 ?auto_48100 ) ) ( not ( = ?auto_48099 ?auto_48100 ) ) ( not ( = ?auto_48102 ?auto_48100 ) ) ( not ( = ?auto_48104 ?auto_48100 ) ) ( not ( = ?auto_48101 ?auto_48100 ) ) ( not ( = ?auto_48103 ?auto_48100 ) ) ( ON ?auto_48103 ?auto_48101 ) ( ON-TABLE ?auto_48100 ) ( CLEAR ?auto_48102 ) ( ON ?auto_48104 ?auto_48103 ) ( CLEAR ?auto_48104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48100 ?auto_48101 ?auto_48103 )
      ( MAKE-1PILE ?auto_48098 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48105 - BLOCK
    )
    :vars
    (
      ?auto_48110 - BLOCK
      ?auto_48108 - BLOCK
      ?auto_48109 - BLOCK
      ?auto_48111 - BLOCK
      ?auto_48106 - BLOCK
      ?auto_48107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48110 ?auto_48105 ) ( ON-TABLE ?auto_48105 ) ( not ( = ?auto_48105 ?auto_48110 ) ) ( not ( = ?auto_48105 ?auto_48108 ) ) ( not ( = ?auto_48105 ?auto_48109 ) ) ( not ( = ?auto_48110 ?auto_48108 ) ) ( not ( = ?auto_48110 ?auto_48109 ) ) ( not ( = ?auto_48108 ?auto_48109 ) ) ( not ( = ?auto_48111 ?auto_48106 ) ) ( not ( = ?auto_48111 ?auto_48109 ) ) ( not ( = ?auto_48106 ?auto_48109 ) ) ( not ( = ?auto_48105 ?auto_48106 ) ) ( not ( = ?auto_48105 ?auto_48111 ) ) ( not ( = ?auto_48110 ?auto_48106 ) ) ( not ( = ?auto_48110 ?auto_48111 ) ) ( not ( = ?auto_48108 ?auto_48106 ) ) ( not ( = ?auto_48108 ?auto_48111 ) ) ( ON ?auto_48111 ?auto_48107 ) ( not ( = ?auto_48105 ?auto_48107 ) ) ( not ( = ?auto_48110 ?auto_48107 ) ) ( not ( = ?auto_48108 ?auto_48107 ) ) ( not ( = ?auto_48109 ?auto_48107 ) ) ( not ( = ?auto_48111 ?auto_48107 ) ) ( not ( = ?auto_48106 ?auto_48107 ) ) ( ON ?auto_48106 ?auto_48111 ) ( ON-TABLE ?auto_48107 ) ( ON ?auto_48109 ?auto_48106 ) ( CLEAR ?auto_48109 ) ( HOLDING ?auto_48108 ) ( CLEAR ?auto_48110 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48105 ?auto_48110 ?auto_48108 )
      ( MAKE-1PILE ?auto_48105 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48112 - BLOCK
    )
    :vars
    (
      ?auto_48118 - BLOCK
      ?auto_48115 - BLOCK
      ?auto_48117 - BLOCK
      ?auto_48114 - BLOCK
      ?auto_48113 - BLOCK
      ?auto_48116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_48118 ?auto_48112 ) ( ON-TABLE ?auto_48112 ) ( not ( = ?auto_48112 ?auto_48118 ) ) ( not ( = ?auto_48112 ?auto_48115 ) ) ( not ( = ?auto_48112 ?auto_48117 ) ) ( not ( = ?auto_48118 ?auto_48115 ) ) ( not ( = ?auto_48118 ?auto_48117 ) ) ( not ( = ?auto_48115 ?auto_48117 ) ) ( not ( = ?auto_48114 ?auto_48113 ) ) ( not ( = ?auto_48114 ?auto_48117 ) ) ( not ( = ?auto_48113 ?auto_48117 ) ) ( not ( = ?auto_48112 ?auto_48113 ) ) ( not ( = ?auto_48112 ?auto_48114 ) ) ( not ( = ?auto_48118 ?auto_48113 ) ) ( not ( = ?auto_48118 ?auto_48114 ) ) ( not ( = ?auto_48115 ?auto_48113 ) ) ( not ( = ?auto_48115 ?auto_48114 ) ) ( ON ?auto_48114 ?auto_48116 ) ( not ( = ?auto_48112 ?auto_48116 ) ) ( not ( = ?auto_48118 ?auto_48116 ) ) ( not ( = ?auto_48115 ?auto_48116 ) ) ( not ( = ?auto_48117 ?auto_48116 ) ) ( not ( = ?auto_48114 ?auto_48116 ) ) ( not ( = ?auto_48113 ?auto_48116 ) ) ( ON ?auto_48113 ?auto_48114 ) ( ON-TABLE ?auto_48116 ) ( ON ?auto_48117 ?auto_48113 ) ( CLEAR ?auto_48118 ) ( ON ?auto_48115 ?auto_48117 ) ( CLEAR ?auto_48115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48116 ?auto_48114 ?auto_48113 ?auto_48117 )
      ( MAKE-1PILE ?auto_48112 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48133 - BLOCK
    )
    :vars
    (
      ?auto_48139 - BLOCK
      ?auto_48137 - BLOCK
      ?auto_48136 - BLOCK
      ?auto_48138 - BLOCK
      ?auto_48135 - BLOCK
      ?auto_48134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48133 ?auto_48139 ) ) ( not ( = ?auto_48133 ?auto_48137 ) ) ( not ( = ?auto_48133 ?auto_48136 ) ) ( not ( = ?auto_48139 ?auto_48137 ) ) ( not ( = ?auto_48139 ?auto_48136 ) ) ( not ( = ?auto_48137 ?auto_48136 ) ) ( not ( = ?auto_48138 ?auto_48135 ) ) ( not ( = ?auto_48138 ?auto_48136 ) ) ( not ( = ?auto_48135 ?auto_48136 ) ) ( not ( = ?auto_48133 ?auto_48135 ) ) ( not ( = ?auto_48133 ?auto_48138 ) ) ( not ( = ?auto_48139 ?auto_48135 ) ) ( not ( = ?auto_48139 ?auto_48138 ) ) ( not ( = ?auto_48137 ?auto_48135 ) ) ( not ( = ?auto_48137 ?auto_48138 ) ) ( ON ?auto_48138 ?auto_48134 ) ( not ( = ?auto_48133 ?auto_48134 ) ) ( not ( = ?auto_48139 ?auto_48134 ) ) ( not ( = ?auto_48137 ?auto_48134 ) ) ( not ( = ?auto_48136 ?auto_48134 ) ) ( not ( = ?auto_48138 ?auto_48134 ) ) ( not ( = ?auto_48135 ?auto_48134 ) ) ( ON ?auto_48135 ?auto_48138 ) ( ON-TABLE ?auto_48134 ) ( ON ?auto_48136 ?auto_48135 ) ( ON ?auto_48137 ?auto_48136 ) ( ON ?auto_48139 ?auto_48137 ) ( CLEAR ?auto_48139 ) ( HOLDING ?auto_48133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48133 ?auto_48139 )
      ( MAKE-1PILE ?auto_48133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_48140 - BLOCK
    )
    :vars
    (
      ?auto_48146 - BLOCK
      ?auto_48145 - BLOCK
      ?auto_48141 - BLOCK
      ?auto_48142 - BLOCK
      ?auto_48144 - BLOCK
      ?auto_48143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48140 ?auto_48146 ) ) ( not ( = ?auto_48140 ?auto_48145 ) ) ( not ( = ?auto_48140 ?auto_48141 ) ) ( not ( = ?auto_48146 ?auto_48145 ) ) ( not ( = ?auto_48146 ?auto_48141 ) ) ( not ( = ?auto_48145 ?auto_48141 ) ) ( not ( = ?auto_48142 ?auto_48144 ) ) ( not ( = ?auto_48142 ?auto_48141 ) ) ( not ( = ?auto_48144 ?auto_48141 ) ) ( not ( = ?auto_48140 ?auto_48144 ) ) ( not ( = ?auto_48140 ?auto_48142 ) ) ( not ( = ?auto_48146 ?auto_48144 ) ) ( not ( = ?auto_48146 ?auto_48142 ) ) ( not ( = ?auto_48145 ?auto_48144 ) ) ( not ( = ?auto_48145 ?auto_48142 ) ) ( ON ?auto_48142 ?auto_48143 ) ( not ( = ?auto_48140 ?auto_48143 ) ) ( not ( = ?auto_48146 ?auto_48143 ) ) ( not ( = ?auto_48145 ?auto_48143 ) ) ( not ( = ?auto_48141 ?auto_48143 ) ) ( not ( = ?auto_48142 ?auto_48143 ) ) ( not ( = ?auto_48144 ?auto_48143 ) ) ( ON ?auto_48144 ?auto_48142 ) ( ON-TABLE ?auto_48143 ) ( ON ?auto_48141 ?auto_48144 ) ( ON ?auto_48145 ?auto_48141 ) ( ON ?auto_48146 ?auto_48145 ) ( ON ?auto_48140 ?auto_48146 ) ( CLEAR ?auto_48140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48143 ?auto_48142 ?auto_48144 ?auto_48141 ?auto_48145 ?auto_48146 )
      ( MAKE-1PILE ?auto_48140 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48152 - BLOCK
      ?auto_48153 - BLOCK
      ?auto_48154 - BLOCK
      ?auto_48155 - BLOCK
      ?auto_48156 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48156 ) ( CLEAR ?auto_48155 ) ( ON-TABLE ?auto_48152 ) ( ON ?auto_48153 ?auto_48152 ) ( ON ?auto_48154 ?auto_48153 ) ( ON ?auto_48155 ?auto_48154 ) ( not ( = ?auto_48152 ?auto_48153 ) ) ( not ( = ?auto_48152 ?auto_48154 ) ) ( not ( = ?auto_48152 ?auto_48155 ) ) ( not ( = ?auto_48152 ?auto_48156 ) ) ( not ( = ?auto_48153 ?auto_48154 ) ) ( not ( = ?auto_48153 ?auto_48155 ) ) ( not ( = ?auto_48153 ?auto_48156 ) ) ( not ( = ?auto_48154 ?auto_48155 ) ) ( not ( = ?auto_48154 ?auto_48156 ) ) ( not ( = ?auto_48155 ?auto_48156 ) ) )
    :subtasks
    ( ( !STACK ?auto_48156 ?auto_48155 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48157 - BLOCK
      ?auto_48158 - BLOCK
      ?auto_48159 - BLOCK
      ?auto_48160 - BLOCK
      ?auto_48161 - BLOCK
    )
    :vars
    (
      ?auto_48162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48160 ) ( ON-TABLE ?auto_48157 ) ( ON ?auto_48158 ?auto_48157 ) ( ON ?auto_48159 ?auto_48158 ) ( ON ?auto_48160 ?auto_48159 ) ( not ( = ?auto_48157 ?auto_48158 ) ) ( not ( = ?auto_48157 ?auto_48159 ) ) ( not ( = ?auto_48157 ?auto_48160 ) ) ( not ( = ?auto_48157 ?auto_48161 ) ) ( not ( = ?auto_48158 ?auto_48159 ) ) ( not ( = ?auto_48158 ?auto_48160 ) ) ( not ( = ?auto_48158 ?auto_48161 ) ) ( not ( = ?auto_48159 ?auto_48160 ) ) ( not ( = ?auto_48159 ?auto_48161 ) ) ( not ( = ?auto_48160 ?auto_48161 ) ) ( ON ?auto_48161 ?auto_48162 ) ( CLEAR ?auto_48161 ) ( HAND-EMPTY ) ( not ( = ?auto_48157 ?auto_48162 ) ) ( not ( = ?auto_48158 ?auto_48162 ) ) ( not ( = ?auto_48159 ?auto_48162 ) ) ( not ( = ?auto_48160 ?auto_48162 ) ) ( not ( = ?auto_48161 ?auto_48162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48161 ?auto_48162 )
      ( MAKE-5PILE ?auto_48157 ?auto_48158 ?auto_48159 ?auto_48160 ?auto_48161 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48163 - BLOCK
      ?auto_48164 - BLOCK
      ?auto_48165 - BLOCK
      ?auto_48166 - BLOCK
      ?auto_48167 - BLOCK
    )
    :vars
    (
      ?auto_48168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48163 ) ( ON ?auto_48164 ?auto_48163 ) ( ON ?auto_48165 ?auto_48164 ) ( not ( = ?auto_48163 ?auto_48164 ) ) ( not ( = ?auto_48163 ?auto_48165 ) ) ( not ( = ?auto_48163 ?auto_48166 ) ) ( not ( = ?auto_48163 ?auto_48167 ) ) ( not ( = ?auto_48164 ?auto_48165 ) ) ( not ( = ?auto_48164 ?auto_48166 ) ) ( not ( = ?auto_48164 ?auto_48167 ) ) ( not ( = ?auto_48165 ?auto_48166 ) ) ( not ( = ?auto_48165 ?auto_48167 ) ) ( not ( = ?auto_48166 ?auto_48167 ) ) ( ON ?auto_48167 ?auto_48168 ) ( CLEAR ?auto_48167 ) ( not ( = ?auto_48163 ?auto_48168 ) ) ( not ( = ?auto_48164 ?auto_48168 ) ) ( not ( = ?auto_48165 ?auto_48168 ) ) ( not ( = ?auto_48166 ?auto_48168 ) ) ( not ( = ?auto_48167 ?auto_48168 ) ) ( HOLDING ?auto_48166 ) ( CLEAR ?auto_48165 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48163 ?auto_48164 ?auto_48165 ?auto_48166 )
      ( MAKE-5PILE ?auto_48163 ?auto_48164 ?auto_48165 ?auto_48166 ?auto_48167 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48169 - BLOCK
      ?auto_48170 - BLOCK
      ?auto_48171 - BLOCK
      ?auto_48172 - BLOCK
      ?auto_48173 - BLOCK
    )
    :vars
    (
      ?auto_48174 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48169 ) ( ON ?auto_48170 ?auto_48169 ) ( ON ?auto_48171 ?auto_48170 ) ( not ( = ?auto_48169 ?auto_48170 ) ) ( not ( = ?auto_48169 ?auto_48171 ) ) ( not ( = ?auto_48169 ?auto_48172 ) ) ( not ( = ?auto_48169 ?auto_48173 ) ) ( not ( = ?auto_48170 ?auto_48171 ) ) ( not ( = ?auto_48170 ?auto_48172 ) ) ( not ( = ?auto_48170 ?auto_48173 ) ) ( not ( = ?auto_48171 ?auto_48172 ) ) ( not ( = ?auto_48171 ?auto_48173 ) ) ( not ( = ?auto_48172 ?auto_48173 ) ) ( ON ?auto_48173 ?auto_48174 ) ( not ( = ?auto_48169 ?auto_48174 ) ) ( not ( = ?auto_48170 ?auto_48174 ) ) ( not ( = ?auto_48171 ?auto_48174 ) ) ( not ( = ?auto_48172 ?auto_48174 ) ) ( not ( = ?auto_48173 ?auto_48174 ) ) ( CLEAR ?auto_48171 ) ( ON ?auto_48172 ?auto_48173 ) ( CLEAR ?auto_48172 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48174 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48174 ?auto_48173 )
      ( MAKE-5PILE ?auto_48169 ?auto_48170 ?auto_48171 ?auto_48172 ?auto_48173 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48175 - BLOCK
      ?auto_48176 - BLOCK
      ?auto_48177 - BLOCK
      ?auto_48178 - BLOCK
      ?auto_48179 - BLOCK
    )
    :vars
    (
      ?auto_48180 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48175 ) ( ON ?auto_48176 ?auto_48175 ) ( not ( = ?auto_48175 ?auto_48176 ) ) ( not ( = ?auto_48175 ?auto_48177 ) ) ( not ( = ?auto_48175 ?auto_48178 ) ) ( not ( = ?auto_48175 ?auto_48179 ) ) ( not ( = ?auto_48176 ?auto_48177 ) ) ( not ( = ?auto_48176 ?auto_48178 ) ) ( not ( = ?auto_48176 ?auto_48179 ) ) ( not ( = ?auto_48177 ?auto_48178 ) ) ( not ( = ?auto_48177 ?auto_48179 ) ) ( not ( = ?auto_48178 ?auto_48179 ) ) ( ON ?auto_48179 ?auto_48180 ) ( not ( = ?auto_48175 ?auto_48180 ) ) ( not ( = ?auto_48176 ?auto_48180 ) ) ( not ( = ?auto_48177 ?auto_48180 ) ) ( not ( = ?auto_48178 ?auto_48180 ) ) ( not ( = ?auto_48179 ?auto_48180 ) ) ( ON ?auto_48178 ?auto_48179 ) ( CLEAR ?auto_48178 ) ( ON-TABLE ?auto_48180 ) ( HOLDING ?auto_48177 ) ( CLEAR ?auto_48176 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48175 ?auto_48176 ?auto_48177 )
      ( MAKE-5PILE ?auto_48175 ?auto_48176 ?auto_48177 ?auto_48178 ?auto_48179 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48181 - BLOCK
      ?auto_48182 - BLOCK
      ?auto_48183 - BLOCK
      ?auto_48184 - BLOCK
      ?auto_48185 - BLOCK
    )
    :vars
    (
      ?auto_48186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48181 ) ( ON ?auto_48182 ?auto_48181 ) ( not ( = ?auto_48181 ?auto_48182 ) ) ( not ( = ?auto_48181 ?auto_48183 ) ) ( not ( = ?auto_48181 ?auto_48184 ) ) ( not ( = ?auto_48181 ?auto_48185 ) ) ( not ( = ?auto_48182 ?auto_48183 ) ) ( not ( = ?auto_48182 ?auto_48184 ) ) ( not ( = ?auto_48182 ?auto_48185 ) ) ( not ( = ?auto_48183 ?auto_48184 ) ) ( not ( = ?auto_48183 ?auto_48185 ) ) ( not ( = ?auto_48184 ?auto_48185 ) ) ( ON ?auto_48185 ?auto_48186 ) ( not ( = ?auto_48181 ?auto_48186 ) ) ( not ( = ?auto_48182 ?auto_48186 ) ) ( not ( = ?auto_48183 ?auto_48186 ) ) ( not ( = ?auto_48184 ?auto_48186 ) ) ( not ( = ?auto_48185 ?auto_48186 ) ) ( ON ?auto_48184 ?auto_48185 ) ( ON-TABLE ?auto_48186 ) ( CLEAR ?auto_48182 ) ( ON ?auto_48183 ?auto_48184 ) ( CLEAR ?auto_48183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48186 ?auto_48185 ?auto_48184 )
      ( MAKE-5PILE ?auto_48181 ?auto_48182 ?auto_48183 ?auto_48184 ?auto_48185 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48187 - BLOCK
      ?auto_48188 - BLOCK
      ?auto_48189 - BLOCK
      ?auto_48190 - BLOCK
      ?auto_48191 - BLOCK
    )
    :vars
    (
      ?auto_48192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48187 ) ( not ( = ?auto_48187 ?auto_48188 ) ) ( not ( = ?auto_48187 ?auto_48189 ) ) ( not ( = ?auto_48187 ?auto_48190 ) ) ( not ( = ?auto_48187 ?auto_48191 ) ) ( not ( = ?auto_48188 ?auto_48189 ) ) ( not ( = ?auto_48188 ?auto_48190 ) ) ( not ( = ?auto_48188 ?auto_48191 ) ) ( not ( = ?auto_48189 ?auto_48190 ) ) ( not ( = ?auto_48189 ?auto_48191 ) ) ( not ( = ?auto_48190 ?auto_48191 ) ) ( ON ?auto_48191 ?auto_48192 ) ( not ( = ?auto_48187 ?auto_48192 ) ) ( not ( = ?auto_48188 ?auto_48192 ) ) ( not ( = ?auto_48189 ?auto_48192 ) ) ( not ( = ?auto_48190 ?auto_48192 ) ) ( not ( = ?auto_48191 ?auto_48192 ) ) ( ON ?auto_48190 ?auto_48191 ) ( ON-TABLE ?auto_48192 ) ( ON ?auto_48189 ?auto_48190 ) ( CLEAR ?auto_48189 ) ( HOLDING ?auto_48188 ) ( CLEAR ?auto_48187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48187 ?auto_48188 )
      ( MAKE-5PILE ?auto_48187 ?auto_48188 ?auto_48189 ?auto_48190 ?auto_48191 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48193 - BLOCK
      ?auto_48194 - BLOCK
      ?auto_48195 - BLOCK
      ?auto_48196 - BLOCK
      ?auto_48197 - BLOCK
    )
    :vars
    (
      ?auto_48198 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48193 ) ( not ( = ?auto_48193 ?auto_48194 ) ) ( not ( = ?auto_48193 ?auto_48195 ) ) ( not ( = ?auto_48193 ?auto_48196 ) ) ( not ( = ?auto_48193 ?auto_48197 ) ) ( not ( = ?auto_48194 ?auto_48195 ) ) ( not ( = ?auto_48194 ?auto_48196 ) ) ( not ( = ?auto_48194 ?auto_48197 ) ) ( not ( = ?auto_48195 ?auto_48196 ) ) ( not ( = ?auto_48195 ?auto_48197 ) ) ( not ( = ?auto_48196 ?auto_48197 ) ) ( ON ?auto_48197 ?auto_48198 ) ( not ( = ?auto_48193 ?auto_48198 ) ) ( not ( = ?auto_48194 ?auto_48198 ) ) ( not ( = ?auto_48195 ?auto_48198 ) ) ( not ( = ?auto_48196 ?auto_48198 ) ) ( not ( = ?auto_48197 ?auto_48198 ) ) ( ON ?auto_48196 ?auto_48197 ) ( ON-TABLE ?auto_48198 ) ( ON ?auto_48195 ?auto_48196 ) ( CLEAR ?auto_48193 ) ( ON ?auto_48194 ?auto_48195 ) ( CLEAR ?auto_48194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48198 ?auto_48197 ?auto_48196 ?auto_48195 )
      ( MAKE-5PILE ?auto_48193 ?auto_48194 ?auto_48195 ?auto_48196 ?auto_48197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48199 - BLOCK
      ?auto_48200 - BLOCK
      ?auto_48201 - BLOCK
      ?auto_48202 - BLOCK
      ?auto_48203 - BLOCK
    )
    :vars
    (
      ?auto_48204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48199 ?auto_48200 ) ) ( not ( = ?auto_48199 ?auto_48201 ) ) ( not ( = ?auto_48199 ?auto_48202 ) ) ( not ( = ?auto_48199 ?auto_48203 ) ) ( not ( = ?auto_48200 ?auto_48201 ) ) ( not ( = ?auto_48200 ?auto_48202 ) ) ( not ( = ?auto_48200 ?auto_48203 ) ) ( not ( = ?auto_48201 ?auto_48202 ) ) ( not ( = ?auto_48201 ?auto_48203 ) ) ( not ( = ?auto_48202 ?auto_48203 ) ) ( ON ?auto_48203 ?auto_48204 ) ( not ( = ?auto_48199 ?auto_48204 ) ) ( not ( = ?auto_48200 ?auto_48204 ) ) ( not ( = ?auto_48201 ?auto_48204 ) ) ( not ( = ?auto_48202 ?auto_48204 ) ) ( not ( = ?auto_48203 ?auto_48204 ) ) ( ON ?auto_48202 ?auto_48203 ) ( ON-TABLE ?auto_48204 ) ( ON ?auto_48201 ?auto_48202 ) ( ON ?auto_48200 ?auto_48201 ) ( CLEAR ?auto_48200 ) ( HOLDING ?auto_48199 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48199 )
      ( MAKE-5PILE ?auto_48199 ?auto_48200 ?auto_48201 ?auto_48202 ?auto_48203 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48205 - BLOCK
      ?auto_48206 - BLOCK
      ?auto_48207 - BLOCK
      ?auto_48208 - BLOCK
      ?auto_48209 - BLOCK
    )
    :vars
    (
      ?auto_48210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48205 ?auto_48206 ) ) ( not ( = ?auto_48205 ?auto_48207 ) ) ( not ( = ?auto_48205 ?auto_48208 ) ) ( not ( = ?auto_48205 ?auto_48209 ) ) ( not ( = ?auto_48206 ?auto_48207 ) ) ( not ( = ?auto_48206 ?auto_48208 ) ) ( not ( = ?auto_48206 ?auto_48209 ) ) ( not ( = ?auto_48207 ?auto_48208 ) ) ( not ( = ?auto_48207 ?auto_48209 ) ) ( not ( = ?auto_48208 ?auto_48209 ) ) ( ON ?auto_48209 ?auto_48210 ) ( not ( = ?auto_48205 ?auto_48210 ) ) ( not ( = ?auto_48206 ?auto_48210 ) ) ( not ( = ?auto_48207 ?auto_48210 ) ) ( not ( = ?auto_48208 ?auto_48210 ) ) ( not ( = ?auto_48209 ?auto_48210 ) ) ( ON ?auto_48208 ?auto_48209 ) ( ON-TABLE ?auto_48210 ) ( ON ?auto_48207 ?auto_48208 ) ( ON ?auto_48206 ?auto_48207 ) ( ON ?auto_48205 ?auto_48206 ) ( CLEAR ?auto_48205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48210 ?auto_48209 ?auto_48208 ?auto_48207 ?auto_48206 )
      ( MAKE-5PILE ?auto_48205 ?auto_48206 ?auto_48207 ?auto_48208 ?auto_48209 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48211 - BLOCK
      ?auto_48212 - BLOCK
      ?auto_48213 - BLOCK
      ?auto_48214 - BLOCK
      ?auto_48215 - BLOCK
    )
    :vars
    (
      ?auto_48216 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48211 ?auto_48212 ) ) ( not ( = ?auto_48211 ?auto_48213 ) ) ( not ( = ?auto_48211 ?auto_48214 ) ) ( not ( = ?auto_48211 ?auto_48215 ) ) ( not ( = ?auto_48212 ?auto_48213 ) ) ( not ( = ?auto_48212 ?auto_48214 ) ) ( not ( = ?auto_48212 ?auto_48215 ) ) ( not ( = ?auto_48213 ?auto_48214 ) ) ( not ( = ?auto_48213 ?auto_48215 ) ) ( not ( = ?auto_48214 ?auto_48215 ) ) ( ON ?auto_48215 ?auto_48216 ) ( not ( = ?auto_48211 ?auto_48216 ) ) ( not ( = ?auto_48212 ?auto_48216 ) ) ( not ( = ?auto_48213 ?auto_48216 ) ) ( not ( = ?auto_48214 ?auto_48216 ) ) ( not ( = ?auto_48215 ?auto_48216 ) ) ( ON ?auto_48214 ?auto_48215 ) ( ON-TABLE ?auto_48216 ) ( ON ?auto_48213 ?auto_48214 ) ( ON ?auto_48212 ?auto_48213 ) ( HOLDING ?auto_48211 ) ( CLEAR ?auto_48212 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48216 ?auto_48215 ?auto_48214 ?auto_48213 ?auto_48212 ?auto_48211 )
      ( MAKE-5PILE ?auto_48211 ?auto_48212 ?auto_48213 ?auto_48214 ?auto_48215 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48217 - BLOCK
      ?auto_48218 - BLOCK
      ?auto_48219 - BLOCK
      ?auto_48220 - BLOCK
      ?auto_48221 - BLOCK
    )
    :vars
    (
      ?auto_48222 - BLOCK
      ?auto_48223 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48217 ?auto_48218 ) ) ( not ( = ?auto_48217 ?auto_48219 ) ) ( not ( = ?auto_48217 ?auto_48220 ) ) ( not ( = ?auto_48217 ?auto_48221 ) ) ( not ( = ?auto_48218 ?auto_48219 ) ) ( not ( = ?auto_48218 ?auto_48220 ) ) ( not ( = ?auto_48218 ?auto_48221 ) ) ( not ( = ?auto_48219 ?auto_48220 ) ) ( not ( = ?auto_48219 ?auto_48221 ) ) ( not ( = ?auto_48220 ?auto_48221 ) ) ( ON ?auto_48221 ?auto_48222 ) ( not ( = ?auto_48217 ?auto_48222 ) ) ( not ( = ?auto_48218 ?auto_48222 ) ) ( not ( = ?auto_48219 ?auto_48222 ) ) ( not ( = ?auto_48220 ?auto_48222 ) ) ( not ( = ?auto_48221 ?auto_48222 ) ) ( ON ?auto_48220 ?auto_48221 ) ( ON-TABLE ?auto_48222 ) ( ON ?auto_48219 ?auto_48220 ) ( ON ?auto_48218 ?auto_48219 ) ( CLEAR ?auto_48218 ) ( ON ?auto_48217 ?auto_48223 ) ( CLEAR ?auto_48217 ) ( HAND-EMPTY ) ( not ( = ?auto_48217 ?auto_48223 ) ) ( not ( = ?auto_48218 ?auto_48223 ) ) ( not ( = ?auto_48219 ?auto_48223 ) ) ( not ( = ?auto_48220 ?auto_48223 ) ) ( not ( = ?auto_48221 ?auto_48223 ) ) ( not ( = ?auto_48222 ?auto_48223 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48217 ?auto_48223 )
      ( MAKE-5PILE ?auto_48217 ?auto_48218 ?auto_48219 ?auto_48220 ?auto_48221 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48224 - BLOCK
      ?auto_48225 - BLOCK
      ?auto_48226 - BLOCK
      ?auto_48227 - BLOCK
      ?auto_48228 - BLOCK
    )
    :vars
    (
      ?auto_48230 - BLOCK
      ?auto_48229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48224 ?auto_48225 ) ) ( not ( = ?auto_48224 ?auto_48226 ) ) ( not ( = ?auto_48224 ?auto_48227 ) ) ( not ( = ?auto_48224 ?auto_48228 ) ) ( not ( = ?auto_48225 ?auto_48226 ) ) ( not ( = ?auto_48225 ?auto_48227 ) ) ( not ( = ?auto_48225 ?auto_48228 ) ) ( not ( = ?auto_48226 ?auto_48227 ) ) ( not ( = ?auto_48226 ?auto_48228 ) ) ( not ( = ?auto_48227 ?auto_48228 ) ) ( ON ?auto_48228 ?auto_48230 ) ( not ( = ?auto_48224 ?auto_48230 ) ) ( not ( = ?auto_48225 ?auto_48230 ) ) ( not ( = ?auto_48226 ?auto_48230 ) ) ( not ( = ?auto_48227 ?auto_48230 ) ) ( not ( = ?auto_48228 ?auto_48230 ) ) ( ON ?auto_48227 ?auto_48228 ) ( ON-TABLE ?auto_48230 ) ( ON ?auto_48226 ?auto_48227 ) ( ON ?auto_48224 ?auto_48229 ) ( CLEAR ?auto_48224 ) ( not ( = ?auto_48224 ?auto_48229 ) ) ( not ( = ?auto_48225 ?auto_48229 ) ) ( not ( = ?auto_48226 ?auto_48229 ) ) ( not ( = ?auto_48227 ?auto_48229 ) ) ( not ( = ?auto_48228 ?auto_48229 ) ) ( not ( = ?auto_48230 ?auto_48229 ) ) ( HOLDING ?auto_48225 ) ( CLEAR ?auto_48226 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48230 ?auto_48228 ?auto_48227 ?auto_48226 ?auto_48225 )
      ( MAKE-5PILE ?auto_48224 ?auto_48225 ?auto_48226 ?auto_48227 ?auto_48228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48231 - BLOCK
      ?auto_48232 - BLOCK
      ?auto_48233 - BLOCK
      ?auto_48234 - BLOCK
      ?auto_48235 - BLOCK
    )
    :vars
    (
      ?auto_48237 - BLOCK
      ?auto_48236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48231 ?auto_48232 ) ) ( not ( = ?auto_48231 ?auto_48233 ) ) ( not ( = ?auto_48231 ?auto_48234 ) ) ( not ( = ?auto_48231 ?auto_48235 ) ) ( not ( = ?auto_48232 ?auto_48233 ) ) ( not ( = ?auto_48232 ?auto_48234 ) ) ( not ( = ?auto_48232 ?auto_48235 ) ) ( not ( = ?auto_48233 ?auto_48234 ) ) ( not ( = ?auto_48233 ?auto_48235 ) ) ( not ( = ?auto_48234 ?auto_48235 ) ) ( ON ?auto_48235 ?auto_48237 ) ( not ( = ?auto_48231 ?auto_48237 ) ) ( not ( = ?auto_48232 ?auto_48237 ) ) ( not ( = ?auto_48233 ?auto_48237 ) ) ( not ( = ?auto_48234 ?auto_48237 ) ) ( not ( = ?auto_48235 ?auto_48237 ) ) ( ON ?auto_48234 ?auto_48235 ) ( ON-TABLE ?auto_48237 ) ( ON ?auto_48233 ?auto_48234 ) ( ON ?auto_48231 ?auto_48236 ) ( not ( = ?auto_48231 ?auto_48236 ) ) ( not ( = ?auto_48232 ?auto_48236 ) ) ( not ( = ?auto_48233 ?auto_48236 ) ) ( not ( = ?auto_48234 ?auto_48236 ) ) ( not ( = ?auto_48235 ?auto_48236 ) ) ( not ( = ?auto_48237 ?auto_48236 ) ) ( CLEAR ?auto_48233 ) ( ON ?auto_48232 ?auto_48231 ) ( CLEAR ?auto_48232 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48236 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48236 ?auto_48231 )
      ( MAKE-5PILE ?auto_48231 ?auto_48232 ?auto_48233 ?auto_48234 ?auto_48235 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48238 - BLOCK
      ?auto_48239 - BLOCK
      ?auto_48240 - BLOCK
      ?auto_48241 - BLOCK
      ?auto_48242 - BLOCK
    )
    :vars
    (
      ?auto_48244 - BLOCK
      ?auto_48243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48238 ?auto_48239 ) ) ( not ( = ?auto_48238 ?auto_48240 ) ) ( not ( = ?auto_48238 ?auto_48241 ) ) ( not ( = ?auto_48238 ?auto_48242 ) ) ( not ( = ?auto_48239 ?auto_48240 ) ) ( not ( = ?auto_48239 ?auto_48241 ) ) ( not ( = ?auto_48239 ?auto_48242 ) ) ( not ( = ?auto_48240 ?auto_48241 ) ) ( not ( = ?auto_48240 ?auto_48242 ) ) ( not ( = ?auto_48241 ?auto_48242 ) ) ( ON ?auto_48242 ?auto_48244 ) ( not ( = ?auto_48238 ?auto_48244 ) ) ( not ( = ?auto_48239 ?auto_48244 ) ) ( not ( = ?auto_48240 ?auto_48244 ) ) ( not ( = ?auto_48241 ?auto_48244 ) ) ( not ( = ?auto_48242 ?auto_48244 ) ) ( ON ?auto_48241 ?auto_48242 ) ( ON-TABLE ?auto_48244 ) ( ON ?auto_48238 ?auto_48243 ) ( not ( = ?auto_48238 ?auto_48243 ) ) ( not ( = ?auto_48239 ?auto_48243 ) ) ( not ( = ?auto_48240 ?auto_48243 ) ) ( not ( = ?auto_48241 ?auto_48243 ) ) ( not ( = ?auto_48242 ?auto_48243 ) ) ( not ( = ?auto_48244 ?auto_48243 ) ) ( ON ?auto_48239 ?auto_48238 ) ( CLEAR ?auto_48239 ) ( ON-TABLE ?auto_48243 ) ( HOLDING ?auto_48240 ) ( CLEAR ?auto_48241 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48244 ?auto_48242 ?auto_48241 ?auto_48240 )
      ( MAKE-5PILE ?auto_48238 ?auto_48239 ?auto_48240 ?auto_48241 ?auto_48242 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48245 - BLOCK
      ?auto_48246 - BLOCK
      ?auto_48247 - BLOCK
      ?auto_48248 - BLOCK
      ?auto_48249 - BLOCK
    )
    :vars
    (
      ?auto_48251 - BLOCK
      ?auto_48250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48245 ?auto_48246 ) ) ( not ( = ?auto_48245 ?auto_48247 ) ) ( not ( = ?auto_48245 ?auto_48248 ) ) ( not ( = ?auto_48245 ?auto_48249 ) ) ( not ( = ?auto_48246 ?auto_48247 ) ) ( not ( = ?auto_48246 ?auto_48248 ) ) ( not ( = ?auto_48246 ?auto_48249 ) ) ( not ( = ?auto_48247 ?auto_48248 ) ) ( not ( = ?auto_48247 ?auto_48249 ) ) ( not ( = ?auto_48248 ?auto_48249 ) ) ( ON ?auto_48249 ?auto_48251 ) ( not ( = ?auto_48245 ?auto_48251 ) ) ( not ( = ?auto_48246 ?auto_48251 ) ) ( not ( = ?auto_48247 ?auto_48251 ) ) ( not ( = ?auto_48248 ?auto_48251 ) ) ( not ( = ?auto_48249 ?auto_48251 ) ) ( ON ?auto_48248 ?auto_48249 ) ( ON-TABLE ?auto_48251 ) ( ON ?auto_48245 ?auto_48250 ) ( not ( = ?auto_48245 ?auto_48250 ) ) ( not ( = ?auto_48246 ?auto_48250 ) ) ( not ( = ?auto_48247 ?auto_48250 ) ) ( not ( = ?auto_48248 ?auto_48250 ) ) ( not ( = ?auto_48249 ?auto_48250 ) ) ( not ( = ?auto_48251 ?auto_48250 ) ) ( ON ?auto_48246 ?auto_48245 ) ( ON-TABLE ?auto_48250 ) ( CLEAR ?auto_48248 ) ( ON ?auto_48247 ?auto_48246 ) ( CLEAR ?auto_48247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48250 ?auto_48245 ?auto_48246 )
      ( MAKE-5PILE ?auto_48245 ?auto_48246 ?auto_48247 ?auto_48248 ?auto_48249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48252 - BLOCK
      ?auto_48253 - BLOCK
      ?auto_48254 - BLOCK
      ?auto_48255 - BLOCK
      ?auto_48256 - BLOCK
    )
    :vars
    (
      ?auto_48258 - BLOCK
      ?auto_48257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48252 ?auto_48253 ) ) ( not ( = ?auto_48252 ?auto_48254 ) ) ( not ( = ?auto_48252 ?auto_48255 ) ) ( not ( = ?auto_48252 ?auto_48256 ) ) ( not ( = ?auto_48253 ?auto_48254 ) ) ( not ( = ?auto_48253 ?auto_48255 ) ) ( not ( = ?auto_48253 ?auto_48256 ) ) ( not ( = ?auto_48254 ?auto_48255 ) ) ( not ( = ?auto_48254 ?auto_48256 ) ) ( not ( = ?auto_48255 ?auto_48256 ) ) ( ON ?auto_48256 ?auto_48258 ) ( not ( = ?auto_48252 ?auto_48258 ) ) ( not ( = ?auto_48253 ?auto_48258 ) ) ( not ( = ?auto_48254 ?auto_48258 ) ) ( not ( = ?auto_48255 ?auto_48258 ) ) ( not ( = ?auto_48256 ?auto_48258 ) ) ( ON-TABLE ?auto_48258 ) ( ON ?auto_48252 ?auto_48257 ) ( not ( = ?auto_48252 ?auto_48257 ) ) ( not ( = ?auto_48253 ?auto_48257 ) ) ( not ( = ?auto_48254 ?auto_48257 ) ) ( not ( = ?auto_48255 ?auto_48257 ) ) ( not ( = ?auto_48256 ?auto_48257 ) ) ( not ( = ?auto_48258 ?auto_48257 ) ) ( ON ?auto_48253 ?auto_48252 ) ( ON-TABLE ?auto_48257 ) ( ON ?auto_48254 ?auto_48253 ) ( CLEAR ?auto_48254 ) ( HOLDING ?auto_48255 ) ( CLEAR ?auto_48256 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48258 ?auto_48256 ?auto_48255 )
      ( MAKE-5PILE ?auto_48252 ?auto_48253 ?auto_48254 ?auto_48255 ?auto_48256 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48259 - BLOCK
      ?auto_48260 - BLOCK
      ?auto_48261 - BLOCK
      ?auto_48262 - BLOCK
      ?auto_48263 - BLOCK
    )
    :vars
    (
      ?auto_48264 - BLOCK
      ?auto_48265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48259 ?auto_48260 ) ) ( not ( = ?auto_48259 ?auto_48261 ) ) ( not ( = ?auto_48259 ?auto_48262 ) ) ( not ( = ?auto_48259 ?auto_48263 ) ) ( not ( = ?auto_48260 ?auto_48261 ) ) ( not ( = ?auto_48260 ?auto_48262 ) ) ( not ( = ?auto_48260 ?auto_48263 ) ) ( not ( = ?auto_48261 ?auto_48262 ) ) ( not ( = ?auto_48261 ?auto_48263 ) ) ( not ( = ?auto_48262 ?auto_48263 ) ) ( ON ?auto_48263 ?auto_48264 ) ( not ( = ?auto_48259 ?auto_48264 ) ) ( not ( = ?auto_48260 ?auto_48264 ) ) ( not ( = ?auto_48261 ?auto_48264 ) ) ( not ( = ?auto_48262 ?auto_48264 ) ) ( not ( = ?auto_48263 ?auto_48264 ) ) ( ON-TABLE ?auto_48264 ) ( ON ?auto_48259 ?auto_48265 ) ( not ( = ?auto_48259 ?auto_48265 ) ) ( not ( = ?auto_48260 ?auto_48265 ) ) ( not ( = ?auto_48261 ?auto_48265 ) ) ( not ( = ?auto_48262 ?auto_48265 ) ) ( not ( = ?auto_48263 ?auto_48265 ) ) ( not ( = ?auto_48264 ?auto_48265 ) ) ( ON ?auto_48260 ?auto_48259 ) ( ON-TABLE ?auto_48265 ) ( ON ?auto_48261 ?auto_48260 ) ( CLEAR ?auto_48263 ) ( ON ?auto_48262 ?auto_48261 ) ( CLEAR ?auto_48262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48265 ?auto_48259 ?auto_48260 ?auto_48261 )
      ( MAKE-5PILE ?auto_48259 ?auto_48260 ?auto_48261 ?auto_48262 ?auto_48263 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48266 - BLOCK
      ?auto_48267 - BLOCK
      ?auto_48268 - BLOCK
      ?auto_48269 - BLOCK
      ?auto_48270 - BLOCK
    )
    :vars
    (
      ?auto_48272 - BLOCK
      ?auto_48271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48266 ?auto_48267 ) ) ( not ( = ?auto_48266 ?auto_48268 ) ) ( not ( = ?auto_48266 ?auto_48269 ) ) ( not ( = ?auto_48266 ?auto_48270 ) ) ( not ( = ?auto_48267 ?auto_48268 ) ) ( not ( = ?auto_48267 ?auto_48269 ) ) ( not ( = ?auto_48267 ?auto_48270 ) ) ( not ( = ?auto_48268 ?auto_48269 ) ) ( not ( = ?auto_48268 ?auto_48270 ) ) ( not ( = ?auto_48269 ?auto_48270 ) ) ( not ( = ?auto_48266 ?auto_48272 ) ) ( not ( = ?auto_48267 ?auto_48272 ) ) ( not ( = ?auto_48268 ?auto_48272 ) ) ( not ( = ?auto_48269 ?auto_48272 ) ) ( not ( = ?auto_48270 ?auto_48272 ) ) ( ON-TABLE ?auto_48272 ) ( ON ?auto_48266 ?auto_48271 ) ( not ( = ?auto_48266 ?auto_48271 ) ) ( not ( = ?auto_48267 ?auto_48271 ) ) ( not ( = ?auto_48268 ?auto_48271 ) ) ( not ( = ?auto_48269 ?auto_48271 ) ) ( not ( = ?auto_48270 ?auto_48271 ) ) ( not ( = ?auto_48272 ?auto_48271 ) ) ( ON ?auto_48267 ?auto_48266 ) ( ON-TABLE ?auto_48271 ) ( ON ?auto_48268 ?auto_48267 ) ( ON ?auto_48269 ?auto_48268 ) ( CLEAR ?auto_48269 ) ( HOLDING ?auto_48270 ) ( CLEAR ?auto_48272 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48272 ?auto_48270 )
      ( MAKE-5PILE ?auto_48266 ?auto_48267 ?auto_48268 ?auto_48269 ?auto_48270 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48273 - BLOCK
      ?auto_48274 - BLOCK
      ?auto_48275 - BLOCK
      ?auto_48276 - BLOCK
      ?auto_48277 - BLOCK
    )
    :vars
    (
      ?auto_48279 - BLOCK
      ?auto_48278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48273 ?auto_48274 ) ) ( not ( = ?auto_48273 ?auto_48275 ) ) ( not ( = ?auto_48273 ?auto_48276 ) ) ( not ( = ?auto_48273 ?auto_48277 ) ) ( not ( = ?auto_48274 ?auto_48275 ) ) ( not ( = ?auto_48274 ?auto_48276 ) ) ( not ( = ?auto_48274 ?auto_48277 ) ) ( not ( = ?auto_48275 ?auto_48276 ) ) ( not ( = ?auto_48275 ?auto_48277 ) ) ( not ( = ?auto_48276 ?auto_48277 ) ) ( not ( = ?auto_48273 ?auto_48279 ) ) ( not ( = ?auto_48274 ?auto_48279 ) ) ( not ( = ?auto_48275 ?auto_48279 ) ) ( not ( = ?auto_48276 ?auto_48279 ) ) ( not ( = ?auto_48277 ?auto_48279 ) ) ( ON-TABLE ?auto_48279 ) ( ON ?auto_48273 ?auto_48278 ) ( not ( = ?auto_48273 ?auto_48278 ) ) ( not ( = ?auto_48274 ?auto_48278 ) ) ( not ( = ?auto_48275 ?auto_48278 ) ) ( not ( = ?auto_48276 ?auto_48278 ) ) ( not ( = ?auto_48277 ?auto_48278 ) ) ( not ( = ?auto_48279 ?auto_48278 ) ) ( ON ?auto_48274 ?auto_48273 ) ( ON-TABLE ?auto_48278 ) ( ON ?auto_48275 ?auto_48274 ) ( ON ?auto_48276 ?auto_48275 ) ( CLEAR ?auto_48279 ) ( ON ?auto_48277 ?auto_48276 ) ( CLEAR ?auto_48277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48278 ?auto_48273 ?auto_48274 ?auto_48275 ?auto_48276 )
      ( MAKE-5PILE ?auto_48273 ?auto_48274 ?auto_48275 ?auto_48276 ?auto_48277 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48280 - BLOCK
      ?auto_48281 - BLOCK
      ?auto_48282 - BLOCK
      ?auto_48283 - BLOCK
      ?auto_48284 - BLOCK
    )
    :vars
    (
      ?auto_48286 - BLOCK
      ?auto_48285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48280 ?auto_48281 ) ) ( not ( = ?auto_48280 ?auto_48282 ) ) ( not ( = ?auto_48280 ?auto_48283 ) ) ( not ( = ?auto_48280 ?auto_48284 ) ) ( not ( = ?auto_48281 ?auto_48282 ) ) ( not ( = ?auto_48281 ?auto_48283 ) ) ( not ( = ?auto_48281 ?auto_48284 ) ) ( not ( = ?auto_48282 ?auto_48283 ) ) ( not ( = ?auto_48282 ?auto_48284 ) ) ( not ( = ?auto_48283 ?auto_48284 ) ) ( not ( = ?auto_48280 ?auto_48286 ) ) ( not ( = ?auto_48281 ?auto_48286 ) ) ( not ( = ?auto_48282 ?auto_48286 ) ) ( not ( = ?auto_48283 ?auto_48286 ) ) ( not ( = ?auto_48284 ?auto_48286 ) ) ( ON ?auto_48280 ?auto_48285 ) ( not ( = ?auto_48280 ?auto_48285 ) ) ( not ( = ?auto_48281 ?auto_48285 ) ) ( not ( = ?auto_48282 ?auto_48285 ) ) ( not ( = ?auto_48283 ?auto_48285 ) ) ( not ( = ?auto_48284 ?auto_48285 ) ) ( not ( = ?auto_48286 ?auto_48285 ) ) ( ON ?auto_48281 ?auto_48280 ) ( ON-TABLE ?auto_48285 ) ( ON ?auto_48282 ?auto_48281 ) ( ON ?auto_48283 ?auto_48282 ) ( ON ?auto_48284 ?auto_48283 ) ( CLEAR ?auto_48284 ) ( HOLDING ?auto_48286 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48286 )
      ( MAKE-5PILE ?auto_48280 ?auto_48281 ?auto_48282 ?auto_48283 ?auto_48284 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_48287 - BLOCK
      ?auto_48288 - BLOCK
      ?auto_48289 - BLOCK
      ?auto_48290 - BLOCK
      ?auto_48291 - BLOCK
    )
    :vars
    (
      ?auto_48293 - BLOCK
      ?auto_48292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48287 ?auto_48288 ) ) ( not ( = ?auto_48287 ?auto_48289 ) ) ( not ( = ?auto_48287 ?auto_48290 ) ) ( not ( = ?auto_48287 ?auto_48291 ) ) ( not ( = ?auto_48288 ?auto_48289 ) ) ( not ( = ?auto_48288 ?auto_48290 ) ) ( not ( = ?auto_48288 ?auto_48291 ) ) ( not ( = ?auto_48289 ?auto_48290 ) ) ( not ( = ?auto_48289 ?auto_48291 ) ) ( not ( = ?auto_48290 ?auto_48291 ) ) ( not ( = ?auto_48287 ?auto_48293 ) ) ( not ( = ?auto_48288 ?auto_48293 ) ) ( not ( = ?auto_48289 ?auto_48293 ) ) ( not ( = ?auto_48290 ?auto_48293 ) ) ( not ( = ?auto_48291 ?auto_48293 ) ) ( ON ?auto_48287 ?auto_48292 ) ( not ( = ?auto_48287 ?auto_48292 ) ) ( not ( = ?auto_48288 ?auto_48292 ) ) ( not ( = ?auto_48289 ?auto_48292 ) ) ( not ( = ?auto_48290 ?auto_48292 ) ) ( not ( = ?auto_48291 ?auto_48292 ) ) ( not ( = ?auto_48293 ?auto_48292 ) ) ( ON ?auto_48288 ?auto_48287 ) ( ON-TABLE ?auto_48292 ) ( ON ?auto_48289 ?auto_48288 ) ( ON ?auto_48290 ?auto_48289 ) ( ON ?auto_48291 ?auto_48290 ) ( ON ?auto_48293 ?auto_48291 ) ( CLEAR ?auto_48293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48292 ?auto_48287 ?auto_48288 ?auto_48289 ?auto_48290 ?auto_48291 )
      ( MAKE-5PILE ?auto_48287 ?auto_48288 ?auto_48289 ?auto_48290 ?auto_48291 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48300 - BLOCK
      ?auto_48301 - BLOCK
      ?auto_48302 - BLOCK
      ?auto_48303 - BLOCK
      ?auto_48304 - BLOCK
      ?auto_48305 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_48305 ) ( CLEAR ?auto_48304 ) ( ON-TABLE ?auto_48300 ) ( ON ?auto_48301 ?auto_48300 ) ( ON ?auto_48302 ?auto_48301 ) ( ON ?auto_48303 ?auto_48302 ) ( ON ?auto_48304 ?auto_48303 ) ( not ( = ?auto_48300 ?auto_48301 ) ) ( not ( = ?auto_48300 ?auto_48302 ) ) ( not ( = ?auto_48300 ?auto_48303 ) ) ( not ( = ?auto_48300 ?auto_48304 ) ) ( not ( = ?auto_48300 ?auto_48305 ) ) ( not ( = ?auto_48301 ?auto_48302 ) ) ( not ( = ?auto_48301 ?auto_48303 ) ) ( not ( = ?auto_48301 ?auto_48304 ) ) ( not ( = ?auto_48301 ?auto_48305 ) ) ( not ( = ?auto_48302 ?auto_48303 ) ) ( not ( = ?auto_48302 ?auto_48304 ) ) ( not ( = ?auto_48302 ?auto_48305 ) ) ( not ( = ?auto_48303 ?auto_48304 ) ) ( not ( = ?auto_48303 ?auto_48305 ) ) ( not ( = ?auto_48304 ?auto_48305 ) ) )
    :subtasks
    ( ( !STACK ?auto_48305 ?auto_48304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48306 - BLOCK
      ?auto_48307 - BLOCK
      ?auto_48308 - BLOCK
      ?auto_48309 - BLOCK
      ?auto_48310 - BLOCK
      ?auto_48311 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_48310 ) ( ON-TABLE ?auto_48306 ) ( ON ?auto_48307 ?auto_48306 ) ( ON ?auto_48308 ?auto_48307 ) ( ON ?auto_48309 ?auto_48308 ) ( ON ?auto_48310 ?auto_48309 ) ( not ( = ?auto_48306 ?auto_48307 ) ) ( not ( = ?auto_48306 ?auto_48308 ) ) ( not ( = ?auto_48306 ?auto_48309 ) ) ( not ( = ?auto_48306 ?auto_48310 ) ) ( not ( = ?auto_48306 ?auto_48311 ) ) ( not ( = ?auto_48307 ?auto_48308 ) ) ( not ( = ?auto_48307 ?auto_48309 ) ) ( not ( = ?auto_48307 ?auto_48310 ) ) ( not ( = ?auto_48307 ?auto_48311 ) ) ( not ( = ?auto_48308 ?auto_48309 ) ) ( not ( = ?auto_48308 ?auto_48310 ) ) ( not ( = ?auto_48308 ?auto_48311 ) ) ( not ( = ?auto_48309 ?auto_48310 ) ) ( not ( = ?auto_48309 ?auto_48311 ) ) ( not ( = ?auto_48310 ?auto_48311 ) ) ( ON-TABLE ?auto_48311 ) ( CLEAR ?auto_48311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_48311 )
      ( MAKE-6PILE ?auto_48306 ?auto_48307 ?auto_48308 ?auto_48309 ?auto_48310 ?auto_48311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48312 - BLOCK
      ?auto_48313 - BLOCK
      ?auto_48314 - BLOCK
      ?auto_48315 - BLOCK
      ?auto_48316 - BLOCK
      ?auto_48317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48312 ) ( ON ?auto_48313 ?auto_48312 ) ( ON ?auto_48314 ?auto_48313 ) ( ON ?auto_48315 ?auto_48314 ) ( not ( = ?auto_48312 ?auto_48313 ) ) ( not ( = ?auto_48312 ?auto_48314 ) ) ( not ( = ?auto_48312 ?auto_48315 ) ) ( not ( = ?auto_48312 ?auto_48316 ) ) ( not ( = ?auto_48312 ?auto_48317 ) ) ( not ( = ?auto_48313 ?auto_48314 ) ) ( not ( = ?auto_48313 ?auto_48315 ) ) ( not ( = ?auto_48313 ?auto_48316 ) ) ( not ( = ?auto_48313 ?auto_48317 ) ) ( not ( = ?auto_48314 ?auto_48315 ) ) ( not ( = ?auto_48314 ?auto_48316 ) ) ( not ( = ?auto_48314 ?auto_48317 ) ) ( not ( = ?auto_48315 ?auto_48316 ) ) ( not ( = ?auto_48315 ?auto_48317 ) ) ( not ( = ?auto_48316 ?auto_48317 ) ) ( ON-TABLE ?auto_48317 ) ( CLEAR ?auto_48317 ) ( HOLDING ?auto_48316 ) ( CLEAR ?auto_48315 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48312 ?auto_48313 ?auto_48314 ?auto_48315 ?auto_48316 )
      ( MAKE-6PILE ?auto_48312 ?auto_48313 ?auto_48314 ?auto_48315 ?auto_48316 ?auto_48317 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48318 - BLOCK
      ?auto_48319 - BLOCK
      ?auto_48320 - BLOCK
      ?auto_48321 - BLOCK
      ?auto_48322 - BLOCK
      ?auto_48323 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48318 ) ( ON ?auto_48319 ?auto_48318 ) ( ON ?auto_48320 ?auto_48319 ) ( ON ?auto_48321 ?auto_48320 ) ( not ( = ?auto_48318 ?auto_48319 ) ) ( not ( = ?auto_48318 ?auto_48320 ) ) ( not ( = ?auto_48318 ?auto_48321 ) ) ( not ( = ?auto_48318 ?auto_48322 ) ) ( not ( = ?auto_48318 ?auto_48323 ) ) ( not ( = ?auto_48319 ?auto_48320 ) ) ( not ( = ?auto_48319 ?auto_48321 ) ) ( not ( = ?auto_48319 ?auto_48322 ) ) ( not ( = ?auto_48319 ?auto_48323 ) ) ( not ( = ?auto_48320 ?auto_48321 ) ) ( not ( = ?auto_48320 ?auto_48322 ) ) ( not ( = ?auto_48320 ?auto_48323 ) ) ( not ( = ?auto_48321 ?auto_48322 ) ) ( not ( = ?auto_48321 ?auto_48323 ) ) ( not ( = ?auto_48322 ?auto_48323 ) ) ( ON-TABLE ?auto_48323 ) ( CLEAR ?auto_48321 ) ( ON ?auto_48322 ?auto_48323 ) ( CLEAR ?auto_48322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48323 )
      ( MAKE-6PILE ?auto_48318 ?auto_48319 ?auto_48320 ?auto_48321 ?auto_48322 ?auto_48323 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48324 - BLOCK
      ?auto_48325 - BLOCK
      ?auto_48326 - BLOCK
      ?auto_48327 - BLOCK
      ?auto_48328 - BLOCK
      ?auto_48329 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48324 ) ( ON ?auto_48325 ?auto_48324 ) ( ON ?auto_48326 ?auto_48325 ) ( not ( = ?auto_48324 ?auto_48325 ) ) ( not ( = ?auto_48324 ?auto_48326 ) ) ( not ( = ?auto_48324 ?auto_48327 ) ) ( not ( = ?auto_48324 ?auto_48328 ) ) ( not ( = ?auto_48324 ?auto_48329 ) ) ( not ( = ?auto_48325 ?auto_48326 ) ) ( not ( = ?auto_48325 ?auto_48327 ) ) ( not ( = ?auto_48325 ?auto_48328 ) ) ( not ( = ?auto_48325 ?auto_48329 ) ) ( not ( = ?auto_48326 ?auto_48327 ) ) ( not ( = ?auto_48326 ?auto_48328 ) ) ( not ( = ?auto_48326 ?auto_48329 ) ) ( not ( = ?auto_48327 ?auto_48328 ) ) ( not ( = ?auto_48327 ?auto_48329 ) ) ( not ( = ?auto_48328 ?auto_48329 ) ) ( ON-TABLE ?auto_48329 ) ( ON ?auto_48328 ?auto_48329 ) ( CLEAR ?auto_48328 ) ( HOLDING ?auto_48327 ) ( CLEAR ?auto_48326 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48324 ?auto_48325 ?auto_48326 ?auto_48327 )
      ( MAKE-6PILE ?auto_48324 ?auto_48325 ?auto_48326 ?auto_48327 ?auto_48328 ?auto_48329 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48330 - BLOCK
      ?auto_48331 - BLOCK
      ?auto_48332 - BLOCK
      ?auto_48333 - BLOCK
      ?auto_48334 - BLOCK
      ?auto_48335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48330 ) ( ON ?auto_48331 ?auto_48330 ) ( ON ?auto_48332 ?auto_48331 ) ( not ( = ?auto_48330 ?auto_48331 ) ) ( not ( = ?auto_48330 ?auto_48332 ) ) ( not ( = ?auto_48330 ?auto_48333 ) ) ( not ( = ?auto_48330 ?auto_48334 ) ) ( not ( = ?auto_48330 ?auto_48335 ) ) ( not ( = ?auto_48331 ?auto_48332 ) ) ( not ( = ?auto_48331 ?auto_48333 ) ) ( not ( = ?auto_48331 ?auto_48334 ) ) ( not ( = ?auto_48331 ?auto_48335 ) ) ( not ( = ?auto_48332 ?auto_48333 ) ) ( not ( = ?auto_48332 ?auto_48334 ) ) ( not ( = ?auto_48332 ?auto_48335 ) ) ( not ( = ?auto_48333 ?auto_48334 ) ) ( not ( = ?auto_48333 ?auto_48335 ) ) ( not ( = ?auto_48334 ?auto_48335 ) ) ( ON-TABLE ?auto_48335 ) ( ON ?auto_48334 ?auto_48335 ) ( CLEAR ?auto_48332 ) ( ON ?auto_48333 ?auto_48334 ) ( CLEAR ?auto_48333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48335 ?auto_48334 )
      ( MAKE-6PILE ?auto_48330 ?auto_48331 ?auto_48332 ?auto_48333 ?auto_48334 ?auto_48335 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48336 - BLOCK
      ?auto_48337 - BLOCK
      ?auto_48338 - BLOCK
      ?auto_48339 - BLOCK
      ?auto_48340 - BLOCK
      ?auto_48341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48336 ) ( ON ?auto_48337 ?auto_48336 ) ( not ( = ?auto_48336 ?auto_48337 ) ) ( not ( = ?auto_48336 ?auto_48338 ) ) ( not ( = ?auto_48336 ?auto_48339 ) ) ( not ( = ?auto_48336 ?auto_48340 ) ) ( not ( = ?auto_48336 ?auto_48341 ) ) ( not ( = ?auto_48337 ?auto_48338 ) ) ( not ( = ?auto_48337 ?auto_48339 ) ) ( not ( = ?auto_48337 ?auto_48340 ) ) ( not ( = ?auto_48337 ?auto_48341 ) ) ( not ( = ?auto_48338 ?auto_48339 ) ) ( not ( = ?auto_48338 ?auto_48340 ) ) ( not ( = ?auto_48338 ?auto_48341 ) ) ( not ( = ?auto_48339 ?auto_48340 ) ) ( not ( = ?auto_48339 ?auto_48341 ) ) ( not ( = ?auto_48340 ?auto_48341 ) ) ( ON-TABLE ?auto_48341 ) ( ON ?auto_48340 ?auto_48341 ) ( ON ?auto_48339 ?auto_48340 ) ( CLEAR ?auto_48339 ) ( HOLDING ?auto_48338 ) ( CLEAR ?auto_48337 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48336 ?auto_48337 ?auto_48338 )
      ( MAKE-6PILE ?auto_48336 ?auto_48337 ?auto_48338 ?auto_48339 ?auto_48340 ?auto_48341 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48342 - BLOCK
      ?auto_48343 - BLOCK
      ?auto_48344 - BLOCK
      ?auto_48345 - BLOCK
      ?auto_48346 - BLOCK
      ?auto_48347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48342 ) ( ON ?auto_48343 ?auto_48342 ) ( not ( = ?auto_48342 ?auto_48343 ) ) ( not ( = ?auto_48342 ?auto_48344 ) ) ( not ( = ?auto_48342 ?auto_48345 ) ) ( not ( = ?auto_48342 ?auto_48346 ) ) ( not ( = ?auto_48342 ?auto_48347 ) ) ( not ( = ?auto_48343 ?auto_48344 ) ) ( not ( = ?auto_48343 ?auto_48345 ) ) ( not ( = ?auto_48343 ?auto_48346 ) ) ( not ( = ?auto_48343 ?auto_48347 ) ) ( not ( = ?auto_48344 ?auto_48345 ) ) ( not ( = ?auto_48344 ?auto_48346 ) ) ( not ( = ?auto_48344 ?auto_48347 ) ) ( not ( = ?auto_48345 ?auto_48346 ) ) ( not ( = ?auto_48345 ?auto_48347 ) ) ( not ( = ?auto_48346 ?auto_48347 ) ) ( ON-TABLE ?auto_48347 ) ( ON ?auto_48346 ?auto_48347 ) ( ON ?auto_48345 ?auto_48346 ) ( CLEAR ?auto_48343 ) ( ON ?auto_48344 ?auto_48345 ) ( CLEAR ?auto_48344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48347 ?auto_48346 ?auto_48345 )
      ( MAKE-6PILE ?auto_48342 ?auto_48343 ?auto_48344 ?auto_48345 ?auto_48346 ?auto_48347 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48348 - BLOCK
      ?auto_48349 - BLOCK
      ?auto_48350 - BLOCK
      ?auto_48351 - BLOCK
      ?auto_48352 - BLOCK
      ?auto_48353 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48348 ) ( not ( = ?auto_48348 ?auto_48349 ) ) ( not ( = ?auto_48348 ?auto_48350 ) ) ( not ( = ?auto_48348 ?auto_48351 ) ) ( not ( = ?auto_48348 ?auto_48352 ) ) ( not ( = ?auto_48348 ?auto_48353 ) ) ( not ( = ?auto_48349 ?auto_48350 ) ) ( not ( = ?auto_48349 ?auto_48351 ) ) ( not ( = ?auto_48349 ?auto_48352 ) ) ( not ( = ?auto_48349 ?auto_48353 ) ) ( not ( = ?auto_48350 ?auto_48351 ) ) ( not ( = ?auto_48350 ?auto_48352 ) ) ( not ( = ?auto_48350 ?auto_48353 ) ) ( not ( = ?auto_48351 ?auto_48352 ) ) ( not ( = ?auto_48351 ?auto_48353 ) ) ( not ( = ?auto_48352 ?auto_48353 ) ) ( ON-TABLE ?auto_48353 ) ( ON ?auto_48352 ?auto_48353 ) ( ON ?auto_48351 ?auto_48352 ) ( ON ?auto_48350 ?auto_48351 ) ( CLEAR ?auto_48350 ) ( HOLDING ?auto_48349 ) ( CLEAR ?auto_48348 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48348 ?auto_48349 )
      ( MAKE-6PILE ?auto_48348 ?auto_48349 ?auto_48350 ?auto_48351 ?auto_48352 ?auto_48353 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48354 - BLOCK
      ?auto_48355 - BLOCK
      ?auto_48356 - BLOCK
      ?auto_48357 - BLOCK
      ?auto_48358 - BLOCK
      ?auto_48359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_48354 ) ( not ( = ?auto_48354 ?auto_48355 ) ) ( not ( = ?auto_48354 ?auto_48356 ) ) ( not ( = ?auto_48354 ?auto_48357 ) ) ( not ( = ?auto_48354 ?auto_48358 ) ) ( not ( = ?auto_48354 ?auto_48359 ) ) ( not ( = ?auto_48355 ?auto_48356 ) ) ( not ( = ?auto_48355 ?auto_48357 ) ) ( not ( = ?auto_48355 ?auto_48358 ) ) ( not ( = ?auto_48355 ?auto_48359 ) ) ( not ( = ?auto_48356 ?auto_48357 ) ) ( not ( = ?auto_48356 ?auto_48358 ) ) ( not ( = ?auto_48356 ?auto_48359 ) ) ( not ( = ?auto_48357 ?auto_48358 ) ) ( not ( = ?auto_48357 ?auto_48359 ) ) ( not ( = ?auto_48358 ?auto_48359 ) ) ( ON-TABLE ?auto_48359 ) ( ON ?auto_48358 ?auto_48359 ) ( ON ?auto_48357 ?auto_48358 ) ( ON ?auto_48356 ?auto_48357 ) ( CLEAR ?auto_48354 ) ( ON ?auto_48355 ?auto_48356 ) ( CLEAR ?auto_48355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48359 ?auto_48358 ?auto_48357 ?auto_48356 )
      ( MAKE-6PILE ?auto_48354 ?auto_48355 ?auto_48356 ?auto_48357 ?auto_48358 ?auto_48359 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48360 - BLOCK
      ?auto_48361 - BLOCK
      ?auto_48362 - BLOCK
      ?auto_48363 - BLOCK
      ?auto_48364 - BLOCK
      ?auto_48365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48360 ?auto_48361 ) ) ( not ( = ?auto_48360 ?auto_48362 ) ) ( not ( = ?auto_48360 ?auto_48363 ) ) ( not ( = ?auto_48360 ?auto_48364 ) ) ( not ( = ?auto_48360 ?auto_48365 ) ) ( not ( = ?auto_48361 ?auto_48362 ) ) ( not ( = ?auto_48361 ?auto_48363 ) ) ( not ( = ?auto_48361 ?auto_48364 ) ) ( not ( = ?auto_48361 ?auto_48365 ) ) ( not ( = ?auto_48362 ?auto_48363 ) ) ( not ( = ?auto_48362 ?auto_48364 ) ) ( not ( = ?auto_48362 ?auto_48365 ) ) ( not ( = ?auto_48363 ?auto_48364 ) ) ( not ( = ?auto_48363 ?auto_48365 ) ) ( not ( = ?auto_48364 ?auto_48365 ) ) ( ON-TABLE ?auto_48365 ) ( ON ?auto_48364 ?auto_48365 ) ( ON ?auto_48363 ?auto_48364 ) ( ON ?auto_48362 ?auto_48363 ) ( ON ?auto_48361 ?auto_48362 ) ( CLEAR ?auto_48361 ) ( HOLDING ?auto_48360 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48360 )
      ( MAKE-6PILE ?auto_48360 ?auto_48361 ?auto_48362 ?auto_48363 ?auto_48364 ?auto_48365 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48366 - BLOCK
      ?auto_48367 - BLOCK
      ?auto_48368 - BLOCK
      ?auto_48369 - BLOCK
      ?auto_48370 - BLOCK
      ?auto_48371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48366 ?auto_48367 ) ) ( not ( = ?auto_48366 ?auto_48368 ) ) ( not ( = ?auto_48366 ?auto_48369 ) ) ( not ( = ?auto_48366 ?auto_48370 ) ) ( not ( = ?auto_48366 ?auto_48371 ) ) ( not ( = ?auto_48367 ?auto_48368 ) ) ( not ( = ?auto_48367 ?auto_48369 ) ) ( not ( = ?auto_48367 ?auto_48370 ) ) ( not ( = ?auto_48367 ?auto_48371 ) ) ( not ( = ?auto_48368 ?auto_48369 ) ) ( not ( = ?auto_48368 ?auto_48370 ) ) ( not ( = ?auto_48368 ?auto_48371 ) ) ( not ( = ?auto_48369 ?auto_48370 ) ) ( not ( = ?auto_48369 ?auto_48371 ) ) ( not ( = ?auto_48370 ?auto_48371 ) ) ( ON-TABLE ?auto_48371 ) ( ON ?auto_48370 ?auto_48371 ) ( ON ?auto_48369 ?auto_48370 ) ( ON ?auto_48368 ?auto_48369 ) ( ON ?auto_48367 ?auto_48368 ) ( ON ?auto_48366 ?auto_48367 ) ( CLEAR ?auto_48366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48371 ?auto_48370 ?auto_48369 ?auto_48368 ?auto_48367 )
      ( MAKE-6PILE ?auto_48366 ?auto_48367 ?auto_48368 ?auto_48369 ?auto_48370 ?auto_48371 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48372 - BLOCK
      ?auto_48373 - BLOCK
      ?auto_48374 - BLOCK
      ?auto_48375 - BLOCK
      ?auto_48376 - BLOCK
      ?auto_48377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48372 ?auto_48373 ) ) ( not ( = ?auto_48372 ?auto_48374 ) ) ( not ( = ?auto_48372 ?auto_48375 ) ) ( not ( = ?auto_48372 ?auto_48376 ) ) ( not ( = ?auto_48372 ?auto_48377 ) ) ( not ( = ?auto_48373 ?auto_48374 ) ) ( not ( = ?auto_48373 ?auto_48375 ) ) ( not ( = ?auto_48373 ?auto_48376 ) ) ( not ( = ?auto_48373 ?auto_48377 ) ) ( not ( = ?auto_48374 ?auto_48375 ) ) ( not ( = ?auto_48374 ?auto_48376 ) ) ( not ( = ?auto_48374 ?auto_48377 ) ) ( not ( = ?auto_48375 ?auto_48376 ) ) ( not ( = ?auto_48375 ?auto_48377 ) ) ( not ( = ?auto_48376 ?auto_48377 ) ) ( ON-TABLE ?auto_48377 ) ( ON ?auto_48376 ?auto_48377 ) ( ON ?auto_48375 ?auto_48376 ) ( ON ?auto_48374 ?auto_48375 ) ( ON ?auto_48373 ?auto_48374 ) ( HOLDING ?auto_48372 ) ( CLEAR ?auto_48373 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48377 ?auto_48376 ?auto_48375 ?auto_48374 ?auto_48373 ?auto_48372 )
      ( MAKE-6PILE ?auto_48372 ?auto_48373 ?auto_48374 ?auto_48375 ?auto_48376 ?auto_48377 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48378 - BLOCK
      ?auto_48379 - BLOCK
      ?auto_48380 - BLOCK
      ?auto_48381 - BLOCK
      ?auto_48382 - BLOCK
      ?auto_48383 - BLOCK
    )
    :vars
    (
      ?auto_48384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48378 ?auto_48379 ) ) ( not ( = ?auto_48378 ?auto_48380 ) ) ( not ( = ?auto_48378 ?auto_48381 ) ) ( not ( = ?auto_48378 ?auto_48382 ) ) ( not ( = ?auto_48378 ?auto_48383 ) ) ( not ( = ?auto_48379 ?auto_48380 ) ) ( not ( = ?auto_48379 ?auto_48381 ) ) ( not ( = ?auto_48379 ?auto_48382 ) ) ( not ( = ?auto_48379 ?auto_48383 ) ) ( not ( = ?auto_48380 ?auto_48381 ) ) ( not ( = ?auto_48380 ?auto_48382 ) ) ( not ( = ?auto_48380 ?auto_48383 ) ) ( not ( = ?auto_48381 ?auto_48382 ) ) ( not ( = ?auto_48381 ?auto_48383 ) ) ( not ( = ?auto_48382 ?auto_48383 ) ) ( ON-TABLE ?auto_48383 ) ( ON ?auto_48382 ?auto_48383 ) ( ON ?auto_48381 ?auto_48382 ) ( ON ?auto_48380 ?auto_48381 ) ( ON ?auto_48379 ?auto_48380 ) ( CLEAR ?auto_48379 ) ( ON ?auto_48378 ?auto_48384 ) ( CLEAR ?auto_48378 ) ( HAND-EMPTY ) ( not ( = ?auto_48378 ?auto_48384 ) ) ( not ( = ?auto_48379 ?auto_48384 ) ) ( not ( = ?auto_48380 ?auto_48384 ) ) ( not ( = ?auto_48381 ?auto_48384 ) ) ( not ( = ?auto_48382 ?auto_48384 ) ) ( not ( = ?auto_48383 ?auto_48384 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_48378 ?auto_48384 )
      ( MAKE-6PILE ?auto_48378 ?auto_48379 ?auto_48380 ?auto_48381 ?auto_48382 ?auto_48383 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48385 - BLOCK
      ?auto_48386 - BLOCK
      ?auto_48387 - BLOCK
      ?auto_48388 - BLOCK
      ?auto_48389 - BLOCK
      ?auto_48390 - BLOCK
    )
    :vars
    (
      ?auto_48391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48385 ?auto_48386 ) ) ( not ( = ?auto_48385 ?auto_48387 ) ) ( not ( = ?auto_48385 ?auto_48388 ) ) ( not ( = ?auto_48385 ?auto_48389 ) ) ( not ( = ?auto_48385 ?auto_48390 ) ) ( not ( = ?auto_48386 ?auto_48387 ) ) ( not ( = ?auto_48386 ?auto_48388 ) ) ( not ( = ?auto_48386 ?auto_48389 ) ) ( not ( = ?auto_48386 ?auto_48390 ) ) ( not ( = ?auto_48387 ?auto_48388 ) ) ( not ( = ?auto_48387 ?auto_48389 ) ) ( not ( = ?auto_48387 ?auto_48390 ) ) ( not ( = ?auto_48388 ?auto_48389 ) ) ( not ( = ?auto_48388 ?auto_48390 ) ) ( not ( = ?auto_48389 ?auto_48390 ) ) ( ON-TABLE ?auto_48390 ) ( ON ?auto_48389 ?auto_48390 ) ( ON ?auto_48388 ?auto_48389 ) ( ON ?auto_48387 ?auto_48388 ) ( ON ?auto_48385 ?auto_48391 ) ( CLEAR ?auto_48385 ) ( not ( = ?auto_48385 ?auto_48391 ) ) ( not ( = ?auto_48386 ?auto_48391 ) ) ( not ( = ?auto_48387 ?auto_48391 ) ) ( not ( = ?auto_48388 ?auto_48391 ) ) ( not ( = ?auto_48389 ?auto_48391 ) ) ( not ( = ?auto_48390 ?auto_48391 ) ) ( HOLDING ?auto_48386 ) ( CLEAR ?auto_48387 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48390 ?auto_48389 ?auto_48388 ?auto_48387 ?auto_48386 )
      ( MAKE-6PILE ?auto_48385 ?auto_48386 ?auto_48387 ?auto_48388 ?auto_48389 ?auto_48390 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48392 - BLOCK
      ?auto_48393 - BLOCK
      ?auto_48394 - BLOCK
      ?auto_48395 - BLOCK
      ?auto_48396 - BLOCK
      ?auto_48397 - BLOCK
    )
    :vars
    (
      ?auto_48398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48392 ?auto_48393 ) ) ( not ( = ?auto_48392 ?auto_48394 ) ) ( not ( = ?auto_48392 ?auto_48395 ) ) ( not ( = ?auto_48392 ?auto_48396 ) ) ( not ( = ?auto_48392 ?auto_48397 ) ) ( not ( = ?auto_48393 ?auto_48394 ) ) ( not ( = ?auto_48393 ?auto_48395 ) ) ( not ( = ?auto_48393 ?auto_48396 ) ) ( not ( = ?auto_48393 ?auto_48397 ) ) ( not ( = ?auto_48394 ?auto_48395 ) ) ( not ( = ?auto_48394 ?auto_48396 ) ) ( not ( = ?auto_48394 ?auto_48397 ) ) ( not ( = ?auto_48395 ?auto_48396 ) ) ( not ( = ?auto_48395 ?auto_48397 ) ) ( not ( = ?auto_48396 ?auto_48397 ) ) ( ON-TABLE ?auto_48397 ) ( ON ?auto_48396 ?auto_48397 ) ( ON ?auto_48395 ?auto_48396 ) ( ON ?auto_48394 ?auto_48395 ) ( ON ?auto_48392 ?auto_48398 ) ( not ( = ?auto_48392 ?auto_48398 ) ) ( not ( = ?auto_48393 ?auto_48398 ) ) ( not ( = ?auto_48394 ?auto_48398 ) ) ( not ( = ?auto_48395 ?auto_48398 ) ) ( not ( = ?auto_48396 ?auto_48398 ) ) ( not ( = ?auto_48397 ?auto_48398 ) ) ( CLEAR ?auto_48394 ) ( ON ?auto_48393 ?auto_48392 ) ( CLEAR ?auto_48393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_48398 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48398 ?auto_48392 )
      ( MAKE-6PILE ?auto_48392 ?auto_48393 ?auto_48394 ?auto_48395 ?auto_48396 ?auto_48397 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48399 - BLOCK
      ?auto_48400 - BLOCK
      ?auto_48401 - BLOCK
      ?auto_48402 - BLOCK
      ?auto_48403 - BLOCK
      ?auto_48404 - BLOCK
    )
    :vars
    (
      ?auto_48405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48399 ?auto_48400 ) ) ( not ( = ?auto_48399 ?auto_48401 ) ) ( not ( = ?auto_48399 ?auto_48402 ) ) ( not ( = ?auto_48399 ?auto_48403 ) ) ( not ( = ?auto_48399 ?auto_48404 ) ) ( not ( = ?auto_48400 ?auto_48401 ) ) ( not ( = ?auto_48400 ?auto_48402 ) ) ( not ( = ?auto_48400 ?auto_48403 ) ) ( not ( = ?auto_48400 ?auto_48404 ) ) ( not ( = ?auto_48401 ?auto_48402 ) ) ( not ( = ?auto_48401 ?auto_48403 ) ) ( not ( = ?auto_48401 ?auto_48404 ) ) ( not ( = ?auto_48402 ?auto_48403 ) ) ( not ( = ?auto_48402 ?auto_48404 ) ) ( not ( = ?auto_48403 ?auto_48404 ) ) ( ON-TABLE ?auto_48404 ) ( ON ?auto_48403 ?auto_48404 ) ( ON ?auto_48402 ?auto_48403 ) ( ON ?auto_48399 ?auto_48405 ) ( not ( = ?auto_48399 ?auto_48405 ) ) ( not ( = ?auto_48400 ?auto_48405 ) ) ( not ( = ?auto_48401 ?auto_48405 ) ) ( not ( = ?auto_48402 ?auto_48405 ) ) ( not ( = ?auto_48403 ?auto_48405 ) ) ( not ( = ?auto_48404 ?auto_48405 ) ) ( ON ?auto_48400 ?auto_48399 ) ( CLEAR ?auto_48400 ) ( ON-TABLE ?auto_48405 ) ( HOLDING ?auto_48401 ) ( CLEAR ?auto_48402 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48404 ?auto_48403 ?auto_48402 ?auto_48401 )
      ( MAKE-6PILE ?auto_48399 ?auto_48400 ?auto_48401 ?auto_48402 ?auto_48403 ?auto_48404 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48406 - BLOCK
      ?auto_48407 - BLOCK
      ?auto_48408 - BLOCK
      ?auto_48409 - BLOCK
      ?auto_48410 - BLOCK
      ?auto_48411 - BLOCK
    )
    :vars
    (
      ?auto_48412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48406 ?auto_48407 ) ) ( not ( = ?auto_48406 ?auto_48408 ) ) ( not ( = ?auto_48406 ?auto_48409 ) ) ( not ( = ?auto_48406 ?auto_48410 ) ) ( not ( = ?auto_48406 ?auto_48411 ) ) ( not ( = ?auto_48407 ?auto_48408 ) ) ( not ( = ?auto_48407 ?auto_48409 ) ) ( not ( = ?auto_48407 ?auto_48410 ) ) ( not ( = ?auto_48407 ?auto_48411 ) ) ( not ( = ?auto_48408 ?auto_48409 ) ) ( not ( = ?auto_48408 ?auto_48410 ) ) ( not ( = ?auto_48408 ?auto_48411 ) ) ( not ( = ?auto_48409 ?auto_48410 ) ) ( not ( = ?auto_48409 ?auto_48411 ) ) ( not ( = ?auto_48410 ?auto_48411 ) ) ( ON-TABLE ?auto_48411 ) ( ON ?auto_48410 ?auto_48411 ) ( ON ?auto_48409 ?auto_48410 ) ( ON ?auto_48406 ?auto_48412 ) ( not ( = ?auto_48406 ?auto_48412 ) ) ( not ( = ?auto_48407 ?auto_48412 ) ) ( not ( = ?auto_48408 ?auto_48412 ) ) ( not ( = ?auto_48409 ?auto_48412 ) ) ( not ( = ?auto_48410 ?auto_48412 ) ) ( not ( = ?auto_48411 ?auto_48412 ) ) ( ON ?auto_48407 ?auto_48406 ) ( ON-TABLE ?auto_48412 ) ( CLEAR ?auto_48409 ) ( ON ?auto_48408 ?auto_48407 ) ( CLEAR ?auto_48408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48412 ?auto_48406 ?auto_48407 )
      ( MAKE-6PILE ?auto_48406 ?auto_48407 ?auto_48408 ?auto_48409 ?auto_48410 ?auto_48411 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48413 - BLOCK
      ?auto_48414 - BLOCK
      ?auto_48415 - BLOCK
      ?auto_48416 - BLOCK
      ?auto_48417 - BLOCK
      ?auto_48418 - BLOCK
    )
    :vars
    (
      ?auto_48419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48413 ?auto_48414 ) ) ( not ( = ?auto_48413 ?auto_48415 ) ) ( not ( = ?auto_48413 ?auto_48416 ) ) ( not ( = ?auto_48413 ?auto_48417 ) ) ( not ( = ?auto_48413 ?auto_48418 ) ) ( not ( = ?auto_48414 ?auto_48415 ) ) ( not ( = ?auto_48414 ?auto_48416 ) ) ( not ( = ?auto_48414 ?auto_48417 ) ) ( not ( = ?auto_48414 ?auto_48418 ) ) ( not ( = ?auto_48415 ?auto_48416 ) ) ( not ( = ?auto_48415 ?auto_48417 ) ) ( not ( = ?auto_48415 ?auto_48418 ) ) ( not ( = ?auto_48416 ?auto_48417 ) ) ( not ( = ?auto_48416 ?auto_48418 ) ) ( not ( = ?auto_48417 ?auto_48418 ) ) ( ON-TABLE ?auto_48418 ) ( ON ?auto_48417 ?auto_48418 ) ( ON ?auto_48413 ?auto_48419 ) ( not ( = ?auto_48413 ?auto_48419 ) ) ( not ( = ?auto_48414 ?auto_48419 ) ) ( not ( = ?auto_48415 ?auto_48419 ) ) ( not ( = ?auto_48416 ?auto_48419 ) ) ( not ( = ?auto_48417 ?auto_48419 ) ) ( not ( = ?auto_48418 ?auto_48419 ) ) ( ON ?auto_48414 ?auto_48413 ) ( ON-TABLE ?auto_48419 ) ( ON ?auto_48415 ?auto_48414 ) ( CLEAR ?auto_48415 ) ( HOLDING ?auto_48416 ) ( CLEAR ?auto_48417 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_48418 ?auto_48417 ?auto_48416 )
      ( MAKE-6PILE ?auto_48413 ?auto_48414 ?auto_48415 ?auto_48416 ?auto_48417 ?auto_48418 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48420 - BLOCK
      ?auto_48421 - BLOCK
      ?auto_48422 - BLOCK
      ?auto_48423 - BLOCK
      ?auto_48424 - BLOCK
      ?auto_48425 - BLOCK
    )
    :vars
    (
      ?auto_48426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48420 ?auto_48421 ) ) ( not ( = ?auto_48420 ?auto_48422 ) ) ( not ( = ?auto_48420 ?auto_48423 ) ) ( not ( = ?auto_48420 ?auto_48424 ) ) ( not ( = ?auto_48420 ?auto_48425 ) ) ( not ( = ?auto_48421 ?auto_48422 ) ) ( not ( = ?auto_48421 ?auto_48423 ) ) ( not ( = ?auto_48421 ?auto_48424 ) ) ( not ( = ?auto_48421 ?auto_48425 ) ) ( not ( = ?auto_48422 ?auto_48423 ) ) ( not ( = ?auto_48422 ?auto_48424 ) ) ( not ( = ?auto_48422 ?auto_48425 ) ) ( not ( = ?auto_48423 ?auto_48424 ) ) ( not ( = ?auto_48423 ?auto_48425 ) ) ( not ( = ?auto_48424 ?auto_48425 ) ) ( ON-TABLE ?auto_48425 ) ( ON ?auto_48424 ?auto_48425 ) ( ON ?auto_48420 ?auto_48426 ) ( not ( = ?auto_48420 ?auto_48426 ) ) ( not ( = ?auto_48421 ?auto_48426 ) ) ( not ( = ?auto_48422 ?auto_48426 ) ) ( not ( = ?auto_48423 ?auto_48426 ) ) ( not ( = ?auto_48424 ?auto_48426 ) ) ( not ( = ?auto_48425 ?auto_48426 ) ) ( ON ?auto_48421 ?auto_48420 ) ( ON-TABLE ?auto_48426 ) ( ON ?auto_48422 ?auto_48421 ) ( CLEAR ?auto_48424 ) ( ON ?auto_48423 ?auto_48422 ) ( CLEAR ?auto_48423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_48426 ?auto_48420 ?auto_48421 ?auto_48422 )
      ( MAKE-6PILE ?auto_48420 ?auto_48421 ?auto_48422 ?auto_48423 ?auto_48424 ?auto_48425 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48427 - BLOCK
      ?auto_48428 - BLOCK
      ?auto_48429 - BLOCK
      ?auto_48430 - BLOCK
      ?auto_48431 - BLOCK
      ?auto_48432 - BLOCK
    )
    :vars
    (
      ?auto_48433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48427 ?auto_48428 ) ) ( not ( = ?auto_48427 ?auto_48429 ) ) ( not ( = ?auto_48427 ?auto_48430 ) ) ( not ( = ?auto_48427 ?auto_48431 ) ) ( not ( = ?auto_48427 ?auto_48432 ) ) ( not ( = ?auto_48428 ?auto_48429 ) ) ( not ( = ?auto_48428 ?auto_48430 ) ) ( not ( = ?auto_48428 ?auto_48431 ) ) ( not ( = ?auto_48428 ?auto_48432 ) ) ( not ( = ?auto_48429 ?auto_48430 ) ) ( not ( = ?auto_48429 ?auto_48431 ) ) ( not ( = ?auto_48429 ?auto_48432 ) ) ( not ( = ?auto_48430 ?auto_48431 ) ) ( not ( = ?auto_48430 ?auto_48432 ) ) ( not ( = ?auto_48431 ?auto_48432 ) ) ( ON-TABLE ?auto_48432 ) ( ON ?auto_48427 ?auto_48433 ) ( not ( = ?auto_48427 ?auto_48433 ) ) ( not ( = ?auto_48428 ?auto_48433 ) ) ( not ( = ?auto_48429 ?auto_48433 ) ) ( not ( = ?auto_48430 ?auto_48433 ) ) ( not ( = ?auto_48431 ?auto_48433 ) ) ( not ( = ?auto_48432 ?auto_48433 ) ) ( ON ?auto_48428 ?auto_48427 ) ( ON-TABLE ?auto_48433 ) ( ON ?auto_48429 ?auto_48428 ) ( ON ?auto_48430 ?auto_48429 ) ( CLEAR ?auto_48430 ) ( HOLDING ?auto_48431 ) ( CLEAR ?auto_48432 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_48432 ?auto_48431 )
      ( MAKE-6PILE ?auto_48427 ?auto_48428 ?auto_48429 ?auto_48430 ?auto_48431 ?auto_48432 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48434 - BLOCK
      ?auto_48435 - BLOCK
      ?auto_48436 - BLOCK
      ?auto_48437 - BLOCK
      ?auto_48438 - BLOCK
      ?auto_48439 - BLOCK
    )
    :vars
    (
      ?auto_48440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48434 ?auto_48435 ) ) ( not ( = ?auto_48434 ?auto_48436 ) ) ( not ( = ?auto_48434 ?auto_48437 ) ) ( not ( = ?auto_48434 ?auto_48438 ) ) ( not ( = ?auto_48434 ?auto_48439 ) ) ( not ( = ?auto_48435 ?auto_48436 ) ) ( not ( = ?auto_48435 ?auto_48437 ) ) ( not ( = ?auto_48435 ?auto_48438 ) ) ( not ( = ?auto_48435 ?auto_48439 ) ) ( not ( = ?auto_48436 ?auto_48437 ) ) ( not ( = ?auto_48436 ?auto_48438 ) ) ( not ( = ?auto_48436 ?auto_48439 ) ) ( not ( = ?auto_48437 ?auto_48438 ) ) ( not ( = ?auto_48437 ?auto_48439 ) ) ( not ( = ?auto_48438 ?auto_48439 ) ) ( ON-TABLE ?auto_48439 ) ( ON ?auto_48434 ?auto_48440 ) ( not ( = ?auto_48434 ?auto_48440 ) ) ( not ( = ?auto_48435 ?auto_48440 ) ) ( not ( = ?auto_48436 ?auto_48440 ) ) ( not ( = ?auto_48437 ?auto_48440 ) ) ( not ( = ?auto_48438 ?auto_48440 ) ) ( not ( = ?auto_48439 ?auto_48440 ) ) ( ON ?auto_48435 ?auto_48434 ) ( ON-TABLE ?auto_48440 ) ( ON ?auto_48436 ?auto_48435 ) ( ON ?auto_48437 ?auto_48436 ) ( CLEAR ?auto_48439 ) ( ON ?auto_48438 ?auto_48437 ) ( CLEAR ?auto_48438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_48440 ?auto_48434 ?auto_48435 ?auto_48436 ?auto_48437 )
      ( MAKE-6PILE ?auto_48434 ?auto_48435 ?auto_48436 ?auto_48437 ?auto_48438 ?auto_48439 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48441 - BLOCK
      ?auto_48442 - BLOCK
      ?auto_48443 - BLOCK
      ?auto_48444 - BLOCK
      ?auto_48445 - BLOCK
      ?auto_48446 - BLOCK
    )
    :vars
    (
      ?auto_48447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48441 ?auto_48442 ) ) ( not ( = ?auto_48441 ?auto_48443 ) ) ( not ( = ?auto_48441 ?auto_48444 ) ) ( not ( = ?auto_48441 ?auto_48445 ) ) ( not ( = ?auto_48441 ?auto_48446 ) ) ( not ( = ?auto_48442 ?auto_48443 ) ) ( not ( = ?auto_48442 ?auto_48444 ) ) ( not ( = ?auto_48442 ?auto_48445 ) ) ( not ( = ?auto_48442 ?auto_48446 ) ) ( not ( = ?auto_48443 ?auto_48444 ) ) ( not ( = ?auto_48443 ?auto_48445 ) ) ( not ( = ?auto_48443 ?auto_48446 ) ) ( not ( = ?auto_48444 ?auto_48445 ) ) ( not ( = ?auto_48444 ?auto_48446 ) ) ( not ( = ?auto_48445 ?auto_48446 ) ) ( ON ?auto_48441 ?auto_48447 ) ( not ( = ?auto_48441 ?auto_48447 ) ) ( not ( = ?auto_48442 ?auto_48447 ) ) ( not ( = ?auto_48443 ?auto_48447 ) ) ( not ( = ?auto_48444 ?auto_48447 ) ) ( not ( = ?auto_48445 ?auto_48447 ) ) ( not ( = ?auto_48446 ?auto_48447 ) ) ( ON ?auto_48442 ?auto_48441 ) ( ON-TABLE ?auto_48447 ) ( ON ?auto_48443 ?auto_48442 ) ( ON ?auto_48444 ?auto_48443 ) ( ON ?auto_48445 ?auto_48444 ) ( CLEAR ?auto_48445 ) ( HOLDING ?auto_48446 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_48446 )
      ( MAKE-6PILE ?auto_48441 ?auto_48442 ?auto_48443 ?auto_48444 ?auto_48445 ?auto_48446 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_48448 - BLOCK
      ?auto_48449 - BLOCK
      ?auto_48450 - BLOCK
      ?auto_48451 - BLOCK
      ?auto_48452 - BLOCK
      ?auto_48453 - BLOCK
    )
    :vars
    (
      ?auto_48454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_48448 ?auto_48449 ) ) ( not ( = ?auto_48448 ?auto_48450 ) ) ( not ( = ?auto_48448 ?auto_48451 ) ) ( not ( = ?auto_48448 ?auto_48452 ) ) ( not ( = ?auto_48448 ?auto_48453 ) ) ( not ( = ?auto_48449 ?auto_48450 ) ) ( not ( = ?auto_48449 ?auto_48451 ) ) ( not ( = ?auto_48449 ?auto_48452 ) ) ( not ( = ?auto_48449 ?auto_48453 ) ) ( not ( = ?auto_48450 ?auto_48451 ) ) ( not ( = ?auto_48450 ?auto_48452 ) ) ( not ( = ?auto_48450 ?auto_48453 ) ) ( not ( = ?auto_48451 ?auto_48452 ) ) ( not ( = ?auto_48451 ?auto_48453 ) ) ( not ( = ?auto_48452 ?auto_48453 ) ) ( ON ?auto_48448 ?auto_48454 ) ( not ( = ?auto_48448 ?auto_48454 ) ) ( not ( = ?auto_48449 ?auto_48454 ) ) ( not ( = ?auto_48450 ?auto_48454 ) ) ( not ( = ?auto_48451 ?auto_48454 ) ) ( not ( = ?auto_48452 ?auto_48454 ) ) ( not ( = ?auto_48453 ?auto_48454 ) ) ( ON ?auto_48449 ?auto_48448 ) ( ON-TABLE ?auto_48454 ) ( ON ?auto_48450 ?auto_48449 ) ( ON ?auto_48451 ?auto_48450 ) ( ON ?auto_48452 ?auto_48451 ) ( ON ?auto_48453 ?auto_48452 ) ( CLEAR ?auto_48453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_48454 ?auto_48448 ?auto_48449 ?auto_48450 ?auto_48451 ?auto_48452 )
      ( MAKE-6PILE ?auto_48448 ?auto_48449 ?auto_48450 ?auto_48451 ?auto_48452 ?auto_48453 ) )
  )

)

