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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15664 - BLOCK
      ?auto_15665 - BLOCK
      ?auto_15666 - BLOCK
      ?auto_15667 - BLOCK
    )
    :vars
    (
      ?auto_15668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15668 ?auto_15667 ) ( CLEAR ?auto_15668 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15664 ) ( ON ?auto_15665 ?auto_15664 ) ( ON ?auto_15666 ?auto_15665 ) ( ON ?auto_15667 ?auto_15666 ) ( not ( = ?auto_15664 ?auto_15665 ) ) ( not ( = ?auto_15664 ?auto_15666 ) ) ( not ( = ?auto_15664 ?auto_15667 ) ) ( not ( = ?auto_15664 ?auto_15668 ) ) ( not ( = ?auto_15665 ?auto_15666 ) ) ( not ( = ?auto_15665 ?auto_15667 ) ) ( not ( = ?auto_15665 ?auto_15668 ) ) ( not ( = ?auto_15666 ?auto_15667 ) ) ( not ( = ?auto_15666 ?auto_15668 ) ) ( not ( = ?auto_15667 ?auto_15668 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15668 ?auto_15667 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15670 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15670 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15670 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15671 - BLOCK
    )
    :vars
    (
      ?auto_15672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15671 ?auto_15672 ) ( CLEAR ?auto_15671 ) ( HAND-EMPTY ) ( not ( = ?auto_15671 ?auto_15672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15671 ?auto_15672 )
      ( MAKE-1PILE ?auto_15671 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15676 - BLOCK
      ?auto_15677 - BLOCK
      ?auto_15678 - BLOCK
    )
    :vars
    (
      ?auto_15679 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15679 ?auto_15678 ) ( CLEAR ?auto_15679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15676 ) ( ON ?auto_15677 ?auto_15676 ) ( ON ?auto_15678 ?auto_15677 ) ( not ( = ?auto_15676 ?auto_15677 ) ) ( not ( = ?auto_15676 ?auto_15678 ) ) ( not ( = ?auto_15676 ?auto_15679 ) ) ( not ( = ?auto_15677 ?auto_15678 ) ) ( not ( = ?auto_15677 ?auto_15679 ) ) ( not ( = ?auto_15678 ?auto_15679 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15679 ?auto_15678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15680 - BLOCK
      ?auto_15681 - BLOCK
      ?auto_15682 - BLOCK
    )
    :vars
    (
      ?auto_15683 - BLOCK
      ?auto_15684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15683 ?auto_15682 ) ( CLEAR ?auto_15683 ) ( ON-TABLE ?auto_15680 ) ( ON ?auto_15681 ?auto_15680 ) ( ON ?auto_15682 ?auto_15681 ) ( not ( = ?auto_15680 ?auto_15681 ) ) ( not ( = ?auto_15680 ?auto_15682 ) ) ( not ( = ?auto_15680 ?auto_15683 ) ) ( not ( = ?auto_15681 ?auto_15682 ) ) ( not ( = ?auto_15681 ?auto_15683 ) ) ( not ( = ?auto_15682 ?auto_15683 ) ) ( HOLDING ?auto_15684 ) ( not ( = ?auto_15680 ?auto_15684 ) ) ( not ( = ?auto_15681 ?auto_15684 ) ) ( not ( = ?auto_15682 ?auto_15684 ) ) ( not ( = ?auto_15683 ?auto_15684 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15684 )
      ( MAKE-3PILE ?auto_15680 ?auto_15681 ?auto_15682 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15685 - BLOCK
      ?auto_15686 - BLOCK
      ?auto_15687 - BLOCK
    )
    :vars
    (
      ?auto_15689 - BLOCK
      ?auto_15688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15689 ?auto_15687 ) ( ON-TABLE ?auto_15685 ) ( ON ?auto_15686 ?auto_15685 ) ( ON ?auto_15687 ?auto_15686 ) ( not ( = ?auto_15685 ?auto_15686 ) ) ( not ( = ?auto_15685 ?auto_15687 ) ) ( not ( = ?auto_15685 ?auto_15689 ) ) ( not ( = ?auto_15686 ?auto_15687 ) ) ( not ( = ?auto_15686 ?auto_15689 ) ) ( not ( = ?auto_15687 ?auto_15689 ) ) ( not ( = ?auto_15685 ?auto_15688 ) ) ( not ( = ?auto_15686 ?auto_15688 ) ) ( not ( = ?auto_15687 ?auto_15688 ) ) ( not ( = ?auto_15689 ?auto_15688 ) ) ( ON ?auto_15688 ?auto_15689 ) ( CLEAR ?auto_15688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15685 ?auto_15686 ?auto_15687 ?auto_15689 )
      ( MAKE-3PILE ?auto_15685 ?auto_15686 ?auto_15687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15692 - BLOCK
      ?auto_15693 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15693 ) ( CLEAR ?auto_15692 ) ( ON-TABLE ?auto_15692 ) ( not ( = ?auto_15692 ?auto_15693 ) ) )
    :subtasks
    ( ( !STACK ?auto_15693 ?auto_15692 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15694 - BLOCK
      ?auto_15695 - BLOCK
    )
    :vars
    (
      ?auto_15696 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15694 ) ( ON-TABLE ?auto_15694 ) ( not ( = ?auto_15694 ?auto_15695 ) ) ( ON ?auto_15695 ?auto_15696 ) ( CLEAR ?auto_15695 ) ( HAND-EMPTY ) ( not ( = ?auto_15694 ?auto_15696 ) ) ( not ( = ?auto_15695 ?auto_15696 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15695 ?auto_15696 )
      ( MAKE-2PILE ?auto_15694 ?auto_15695 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15697 - BLOCK
      ?auto_15698 - BLOCK
    )
    :vars
    (
      ?auto_15699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15697 ?auto_15698 ) ) ( ON ?auto_15698 ?auto_15699 ) ( CLEAR ?auto_15698 ) ( not ( = ?auto_15697 ?auto_15699 ) ) ( not ( = ?auto_15698 ?auto_15699 ) ) ( HOLDING ?auto_15697 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15697 )
      ( MAKE-2PILE ?auto_15697 ?auto_15698 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15700 - BLOCK
      ?auto_15701 - BLOCK
    )
    :vars
    (
      ?auto_15702 - BLOCK
      ?auto_15704 - BLOCK
      ?auto_15703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15700 ?auto_15701 ) ) ( ON ?auto_15701 ?auto_15702 ) ( not ( = ?auto_15700 ?auto_15702 ) ) ( not ( = ?auto_15701 ?auto_15702 ) ) ( ON ?auto_15700 ?auto_15701 ) ( CLEAR ?auto_15700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15704 ) ( ON ?auto_15703 ?auto_15704 ) ( ON ?auto_15702 ?auto_15703 ) ( not ( = ?auto_15704 ?auto_15703 ) ) ( not ( = ?auto_15704 ?auto_15702 ) ) ( not ( = ?auto_15704 ?auto_15701 ) ) ( not ( = ?auto_15704 ?auto_15700 ) ) ( not ( = ?auto_15703 ?auto_15702 ) ) ( not ( = ?auto_15703 ?auto_15701 ) ) ( not ( = ?auto_15703 ?auto_15700 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15704 ?auto_15703 ?auto_15702 ?auto_15701 )
      ( MAKE-2PILE ?auto_15700 ?auto_15701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15707 - BLOCK
      ?auto_15708 - BLOCK
    )
    :vars
    (
      ?auto_15709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15709 ?auto_15708 ) ( CLEAR ?auto_15709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15707 ) ( ON ?auto_15708 ?auto_15707 ) ( not ( = ?auto_15707 ?auto_15708 ) ) ( not ( = ?auto_15707 ?auto_15709 ) ) ( not ( = ?auto_15708 ?auto_15709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15709 ?auto_15708 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15710 - BLOCK
      ?auto_15711 - BLOCK
    )
    :vars
    (
      ?auto_15712 - BLOCK
      ?auto_15713 - BLOCK
      ?auto_15714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15712 ?auto_15711 ) ( CLEAR ?auto_15712 ) ( ON-TABLE ?auto_15710 ) ( ON ?auto_15711 ?auto_15710 ) ( not ( = ?auto_15710 ?auto_15711 ) ) ( not ( = ?auto_15710 ?auto_15712 ) ) ( not ( = ?auto_15711 ?auto_15712 ) ) ( HOLDING ?auto_15713 ) ( CLEAR ?auto_15714 ) ( not ( = ?auto_15710 ?auto_15713 ) ) ( not ( = ?auto_15710 ?auto_15714 ) ) ( not ( = ?auto_15711 ?auto_15713 ) ) ( not ( = ?auto_15711 ?auto_15714 ) ) ( not ( = ?auto_15712 ?auto_15713 ) ) ( not ( = ?auto_15712 ?auto_15714 ) ) ( not ( = ?auto_15713 ?auto_15714 ) ) )
    :subtasks
    ( ( !STACK ?auto_15713 ?auto_15714 )
      ( MAKE-2PILE ?auto_15710 ?auto_15711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15715 - BLOCK
      ?auto_15716 - BLOCK
    )
    :vars
    (
      ?auto_15719 - BLOCK
      ?auto_15718 - BLOCK
      ?auto_15717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15719 ?auto_15716 ) ( ON-TABLE ?auto_15715 ) ( ON ?auto_15716 ?auto_15715 ) ( not ( = ?auto_15715 ?auto_15716 ) ) ( not ( = ?auto_15715 ?auto_15719 ) ) ( not ( = ?auto_15716 ?auto_15719 ) ) ( CLEAR ?auto_15718 ) ( not ( = ?auto_15715 ?auto_15717 ) ) ( not ( = ?auto_15715 ?auto_15718 ) ) ( not ( = ?auto_15716 ?auto_15717 ) ) ( not ( = ?auto_15716 ?auto_15718 ) ) ( not ( = ?auto_15719 ?auto_15717 ) ) ( not ( = ?auto_15719 ?auto_15718 ) ) ( not ( = ?auto_15717 ?auto_15718 ) ) ( ON ?auto_15717 ?auto_15719 ) ( CLEAR ?auto_15717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15715 ?auto_15716 ?auto_15719 )
      ( MAKE-2PILE ?auto_15715 ?auto_15716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15720 - BLOCK
      ?auto_15721 - BLOCK
    )
    :vars
    (
      ?auto_15722 - BLOCK
      ?auto_15723 - BLOCK
      ?auto_15724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15722 ?auto_15721 ) ( ON-TABLE ?auto_15720 ) ( ON ?auto_15721 ?auto_15720 ) ( not ( = ?auto_15720 ?auto_15721 ) ) ( not ( = ?auto_15720 ?auto_15722 ) ) ( not ( = ?auto_15721 ?auto_15722 ) ) ( not ( = ?auto_15720 ?auto_15723 ) ) ( not ( = ?auto_15720 ?auto_15724 ) ) ( not ( = ?auto_15721 ?auto_15723 ) ) ( not ( = ?auto_15721 ?auto_15724 ) ) ( not ( = ?auto_15722 ?auto_15723 ) ) ( not ( = ?auto_15722 ?auto_15724 ) ) ( not ( = ?auto_15723 ?auto_15724 ) ) ( ON ?auto_15723 ?auto_15722 ) ( CLEAR ?auto_15723 ) ( HOLDING ?auto_15724 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15724 )
      ( MAKE-2PILE ?auto_15720 ?auto_15721 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15725 - BLOCK
      ?auto_15726 - BLOCK
    )
    :vars
    (
      ?auto_15728 - BLOCK
      ?auto_15727 - BLOCK
      ?auto_15729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15728 ?auto_15726 ) ( ON-TABLE ?auto_15725 ) ( ON ?auto_15726 ?auto_15725 ) ( not ( = ?auto_15725 ?auto_15726 ) ) ( not ( = ?auto_15725 ?auto_15728 ) ) ( not ( = ?auto_15726 ?auto_15728 ) ) ( not ( = ?auto_15725 ?auto_15727 ) ) ( not ( = ?auto_15725 ?auto_15729 ) ) ( not ( = ?auto_15726 ?auto_15727 ) ) ( not ( = ?auto_15726 ?auto_15729 ) ) ( not ( = ?auto_15728 ?auto_15727 ) ) ( not ( = ?auto_15728 ?auto_15729 ) ) ( not ( = ?auto_15727 ?auto_15729 ) ) ( ON ?auto_15727 ?auto_15728 ) ( ON ?auto_15729 ?auto_15727 ) ( CLEAR ?auto_15729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15725 ?auto_15726 ?auto_15728 ?auto_15727 )
      ( MAKE-2PILE ?auto_15725 ?auto_15726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15733 - BLOCK
      ?auto_15734 - BLOCK
      ?auto_15735 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15735 ) ( CLEAR ?auto_15734 ) ( ON-TABLE ?auto_15733 ) ( ON ?auto_15734 ?auto_15733 ) ( not ( = ?auto_15733 ?auto_15734 ) ) ( not ( = ?auto_15733 ?auto_15735 ) ) ( not ( = ?auto_15734 ?auto_15735 ) ) )
    :subtasks
    ( ( !STACK ?auto_15735 ?auto_15734 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15736 - BLOCK
      ?auto_15737 - BLOCK
      ?auto_15738 - BLOCK
    )
    :vars
    (
      ?auto_15739 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15737 ) ( ON-TABLE ?auto_15736 ) ( ON ?auto_15737 ?auto_15736 ) ( not ( = ?auto_15736 ?auto_15737 ) ) ( not ( = ?auto_15736 ?auto_15738 ) ) ( not ( = ?auto_15737 ?auto_15738 ) ) ( ON ?auto_15738 ?auto_15739 ) ( CLEAR ?auto_15738 ) ( HAND-EMPTY ) ( not ( = ?auto_15736 ?auto_15739 ) ) ( not ( = ?auto_15737 ?auto_15739 ) ) ( not ( = ?auto_15738 ?auto_15739 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15738 ?auto_15739 )
      ( MAKE-3PILE ?auto_15736 ?auto_15737 ?auto_15738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15740 - BLOCK
      ?auto_15741 - BLOCK
      ?auto_15742 - BLOCK
    )
    :vars
    (
      ?auto_15743 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15740 ) ( not ( = ?auto_15740 ?auto_15741 ) ) ( not ( = ?auto_15740 ?auto_15742 ) ) ( not ( = ?auto_15741 ?auto_15742 ) ) ( ON ?auto_15742 ?auto_15743 ) ( CLEAR ?auto_15742 ) ( not ( = ?auto_15740 ?auto_15743 ) ) ( not ( = ?auto_15741 ?auto_15743 ) ) ( not ( = ?auto_15742 ?auto_15743 ) ) ( HOLDING ?auto_15741 ) ( CLEAR ?auto_15740 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15740 ?auto_15741 )
      ( MAKE-3PILE ?auto_15740 ?auto_15741 ?auto_15742 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15744 - BLOCK
      ?auto_15745 - BLOCK
      ?auto_15746 - BLOCK
    )
    :vars
    (
      ?auto_15747 - BLOCK
      ?auto_15748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15744 ) ( not ( = ?auto_15744 ?auto_15745 ) ) ( not ( = ?auto_15744 ?auto_15746 ) ) ( not ( = ?auto_15745 ?auto_15746 ) ) ( ON ?auto_15746 ?auto_15747 ) ( not ( = ?auto_15744 ?auto_15747 ) ) ( not ( = ?auto_15745 ?auto_15747 ) ) ( not ( = ?auto_15746 ?auto_15747 ) ) ( CLEAR ?auto_15744 ) ( ON ?auto_15745 ?auto_15746 ) ( CLEAR ?auto_15745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15748 ) ( ON ?auto_15747 ?auto_15748 ) ( not ( = ?auto_15748 ?auto_15747 ) ) ( not ( = ?auto_15748 ?auto_15746 ) ) ( not ( = ?auto_15748 ?auto_15745 ) ) ( not ( = ?auto_15744 ?auto_15748 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15748 ?auto_15747 ?auto_15746 )
      ( MAKE-3PILE ?auto_15744 ?auto_15745 ?auto_15746 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15749 - BLOCK
      ?auto_15750 - BLOCK
      ?auto_15751 - BLOCK
    )
    :vars
    (
      ?auto_15752 - BLOCK
      ?auto_15753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15749 ?auto_15750 ) ) ( not ( = ?auto_15749 ?auto_15751 ) ) ( not ( = ?auto_15750 ?auto_15751 ) ) ( ON ?auto_15751 ?auto_15752 ) ( not ( = ?auto_15749 ?auto_15752 ) ) ( not ( = ?auto_15750 ?auto_15752 ) ) ( not ( = ?auto_15751 ?auto_15752 ) ) ( ON ?auto_15750 ?auto_15751 ) ( CLEAR ?auto_15750 ) ( ON-TABLE ?auto_15753 ) ( ON ?auto_15752 ?auto_15753 ) ( not ( = ?auto_15753 ?auto_15752 ) ) ( not ( = ?auto_15753 ?auto_15751 ) ) ( not ( = ?auto_15753 ?auto_15750 ) ) ( not ( = ?auto_15749 ?auto_15753 ) ) ( HOLDING ?auto_15749 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15749 )
      ( MAKE-3PILE ?auto_15749 ?auto_15750 ?auto_15751 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15754 - BLOCK
      ?auto_15755 - BLOCK
      ?auto_15756 - BLOCK
    )
    :vars
    (
      ?auto_15758 - BLOCK
      ?auto_15757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15754 ?auto_15755 ) ) ( not ( = ?auto_15754 ?auto_15756 ) ) ( not ( = ?auto_15755 ?auto_15756 ) ) ( ON ?auto_15756 ?auto_15758 ) ( not ( = ?auto_15754 ?auto_15758 ) ) ( not ( = ?auto_15755 ?auto_15758 ) ) ( not ( = ?auto_15756 ?auto_15758 ) ) ( ON ?auto_15755 ?auto_15756 ) ( ON-TABLE ?auto_15757 ) ( ON ?auto_15758 ?auto_15757 ) ( not ( = ?auto_15757 ?auto_15758 ) ) ( not ( = ?auto_15757 ?auto_15756 ) ) ( not ( = ?auto_15757 ?auto_15755 ) ) ( not ( = ?auto_15754 ?auto_15757 ) ) ( ON ?auto_15754 ?auto_15755 ) ( CLEAR ?auto_15754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15757 ?auto_15758 ?auto_15756 ?auto_15755 )
      ( MAKE-3PILE ?auto_15754 ?auto_15755 ?auto_15756 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15760 - BLOCK
    )
    :vars
    (
      ?auto_15761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15761 ?auto_15760 ) ( CLEAR ?auto_15761 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15760 ) ( not ( = ?auto_15760 ?auto_15761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15761 ?auto_15760 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15762 - BLOCK
    )
    :vars
    (
      ?auto_15763 - BLOCK
      ?auto_15764 - BLOCK
      ?auto_15765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15763 ?auto_15762 ) ( CLEAR ?auto_15763 ) ( ON-TABLE ?auto_15762 ) ( not ( = ?auto_15762 ?auto_15763 ) ) ( HOLDING ?auto_15764 ) ( CLEAR ?auto_15765 ) ( not ( = ?auto_15762 ?auto_15764 ) ) ( not ( = ?auto_15762 ?auto_15765 ) ) ( not ( = ?auto_15763 ?auto_15764 ) ) ( not ( = ?auto_15763 ?auto_15765 ) ) ( not ( = ?auto_15764 ?auto_15765 ) ) )
    :subtasks
    ( ( !STACK ?auto_15764 ?auto_15765 )
      ( MAKE-1PILE ?auto_15762 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15766 - BLOCK
    )
    :vars
    (
      ?auto_15769 - BLOCK
      ?auto_15768 - BLOCK
      ?auto_15767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15769 ?auto_15766 ) ( ON-TABLE ?auto_15766 ) ( not ( = ?auto_15766 ?auto_15769 ) ) ( CLEAR ?auto_15768 ) ( not ( = ?auto_15766 ?auto_15767 ) ) ( not ( = ?auto_15766 ?auto_15768 ) ) ( not ( = ?auto_15769 ?auto_15767 ) ) ( not ( = ?auto_15769 ?auto_15768 ) ) ( not ( = ?auto_15767 ?auto_15768 ) ) ( ON ?auto_15767 ?auto_15769 ) ( CLEAR ?auto_15767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15766 ?auto_15769 )
      ( MAKE-1PILE ?auto_15766 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15770 - BLOCK
    )
    :vars
    (
      ?auto_15772 - BLOCK
      ?auto_15773 - BLOCK
      ?auto_15771 - BLOCK
      ?auto_15774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15772 ?auto_15770 ) ( ON-TABLE ?auto_15770 ) ( not ( = ?auto_15770 ?auto_15772 ) ) ( not ( = ?auto_15770 ?auto_15773 ) ) ( not ( = ?auto_15770 ?auto_15771 ) ) ( not ( = ?auto_15772 ?auto_15773 ) ) ( not ( = ?auto_15772 ?auto_15771 ) ) ( not ( = ?auto_15773 ?auto_15771 ) ) ( ON ?auto_15773 ?auto_15772 ) ( CLEAR ?auto_15773 ) ( HOLDING ?auto_15771 ) ( CLEAR ?auto_15774 ) ( ON-TABLE ?auto_15774 ) ( not ( = ?auto_15774 ?auto_15771 ) ) ( not ( = ?auto_15770 ?auto_15774 ) ) ( not ( = ?auto_15772 ?auto_15774 ) ) ( not ( = ?auto_15773 ?auto_15774 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15774 ?auto_15771 )
      ( MAKE-1PILE ?auto_15770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15775 - BLOCK
    )
    :vars
    (
      ?auto_15778 - BLOCK
      ?auto_15777 - BLOCK
      ?auto_15779 - BLOCK
      ?auto_15776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15778 ?auto_15775 ) ( ON-TABLE ?auto_15775 ) ( not ( = ?auto_15775 ?auto_15778 ) ) ( not ( = ?auto_15775 ?auto_15777 ) ) ( not ( = ?auto_15775 ?auto_15779 ) ) ( not ( = ?auto_15778 ?auto_15777 ) ) ( not ( = ?auto_15778 ?auto_15779 ) ) ( not ( = ?auto_15777 ?auto_15779 ) ) ( ON ?auto_15777 ?auto_15778 ) ( CLEAR ?auto_15776 ) ( ON-TABLE ?auto_15776 ) ( not ( = ?auto_15776 ?auto_15779 ) ) ( not ( = ?auto_15775 ?auto_15776 ) ) ( not ( = ?auto_15778 ?auto_15776 ) ) ( not ( = ?auto_15777 ?auto_15776 ) ) ( ON ?auto_15779 ?auto_15777 ) ( CLEAR ?auto_15779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15775 ?auto_15778 ?auto_15777 )
      ( MAKE-1PILE ?auto_15775 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15780 - BLOCK
    )
    :vars
    (
      ?auto_15784 - BLOCK
      ?auto_15782 - BLOCK
      ?auto_15781 - BLOCK
      ?auto_15783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15784 ?auto_15780 ) ( ON-TABLE ?auto_15780 ) ( not ( = ?auto_15780 ?auto_15784 ) ) ( not ( = ?auto_15780 ?auto_15782 ) ) ( not ( = ?auto_15780 ?auto_15781 ) ) ( not ( = ?auto_15784 ?auto_15782 ) ) ( not ( = ?auto_15784 ?auto_15781 ) ) ( not ( = ?auto_15782 ?auto_15781 ) ) ( ON ?auto_15782 ?auto_15784 ) ( not ( = ?auto_15783 ?auto_15781 ) ) ( not ( = ?auto_15780 ?auto_15783 ) ) ( not ( = ?auto_15784 ?auto_15783 ) ) ( not ( = ?auto_15782 ?auto_15783 ) ) ( ON ?auto_15781 ?auto_15782 ) ( CLEAR ?auto_15781 ) ( HOLDING ?auto_15783 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15783 )
      ( MAKE-1PILE ?auto_15780 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15785 - BLOCK
    )
    :vars
    (
      ?auto_15786 - BLOCK
      ?auto_15789 - BLOCK
      ?auto_15787 - BLOCK
      ?auto_15788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15786 ?auto_15785 ) ( ON-TABLE ?auto_15785 ) ( not ( = ?auto_15785 ?auto_15786 ) ) ( not ( = ?auto_15785 ?auto_15789 ) ) ( not ( = ?auto_15785 ?auto_15787 ) ) ( not ( = ?auto_15786 ?auto_15789 ) ) ( not ( = ?auto_15786 ?auto_15787 ) ) ( not ( = ?auto_15789 ?auto_15787 ) ) ( ON ?auto_15789 ?auto_15786 ) ( not ( = ?auto_15788 ?auto_15787 ) ) ( not ( = ?auto_15785 ?auto_15788 ) ) ( not ( = ?auto_15786 ?auto_15788 ) ) ( not ( = ?auto_15789 ?auto_15788 ) ) ( ON ?auto_15787 ?auto_15789 ) ( ON ?auto_15788 ?auto_15787 ) ( CLEAR ?auto_15788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15785 ?auto_15786 ?auto_15789 ?auto_15787 )
      ( MAKE-1PILE ?auto_15785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15794 - BLOCK
      ?auto_15795 - BLOCK
      ?auto_15796 - BLOCK
      ?auto_15797 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15797 ) ( CLEAR ?auto_15796 ) ( ON-TABLE ?auto_15794 ) ( ON ?auto_15795 ?auto_15794 ) ( ON ?auto_15796 ?auto_15795 ) ( not ( = ?auto_15794 ?auto_15795 ) ) ( not ( = ?auto_15794 ?auto_15796 ) ) ( not ( = ?auto_15794 ?auto_15797 ) ) ( not ( = ?auto_15795 ?auto_15796 ) ) ( not ( = ?auto_15795 ?auto_15797 ) ) ( not ( = ?auto_15796 ?auto_15797 ) ) )
    :subtasks
    ( ( !STACK ?auto_15797 ?auto_15796 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15798 - BLOCK
      ?auto_15799 - BLOCK
      ?auto_15800 - BLOCK
      ?auto_15801 - BLOCK
    )
    :vars
    (
      ?auto_15802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15800 ) ( ON-TABLE ?auto_15798 ) ( ON ?auto_15799 ?auto_15798 ) ( ON ?auto_15800 ?auto_15799 ) ( not ( = ?auto_15798 ?auto_15799 ) ) ( not ( = ?auto_15798 ?auto_15800 ) ) ( not ( = ?auto_15798 ?auto_15801 ) ) ( not ( = ?auto_15799 ?auto_15800 ) ) ( not ( = ?auto_15799 ?auto_15801 ) ) ( not ( = ?auto_15800 ?auto_15801 ) ) ( ON ?auto_15801 ?auto_15802 ) ( CLEAR ?auto_15801 ) ( HAND-EMPTY ) ( not ( = ?auto_15798 ?auto_15802 ) ) ( not ( = ?auto_15799 ?auto_15802 ) ) ( not ( = ?auto_15800 ?auto_15802 ) ) ( not ( = ?auto_15801 ?auto_15802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15801 ?auto_15802 )
      ( MAKE-4PILE ?auto_15798 ?auto_15799 ?auto_15800 ?auto_15801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15803 - BLOCK
      ?auto_15804 - BLOCK
      ?auto_15805 - BLOCK
      ?auto_15806 - BLOCK
    )
    :vars
    (
      ?auto_15807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15803 ) ( ON ?auto_15804 ?auto_15803 ) ( not ( = ?auto_15803 ?auto_15804 ) ) ( not ( = ?auto_15803 ?auto_15805 ) ) ( not ( = ?auto_15803 ?auto_15806 ) ) ( not ( = ?auto_15804 ?auto_15805 ) ) ( not ( = ?auto_15804 ?auto_15806 ) ) ( not ( = ?auto_15805 ?auto_15806 ) ) ( ON ?auto_15806 ?auto_15807 ) ( CLEAR ?auto_15806 ) ( not ( = ?auto_15803 ?auto_15807 ) ) ( not ( = ?auto_15804 ?auto_15807 ) ) ( not ( = ?auto_15805 ?auto_15807 ) ) ( not ( = ?auto_15806 ?auto_15807 ) ) ( HOLDING ?auto_15805 ) ( CLEAR ?auto_15804 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15803 ?auto_15804 ?auto_15805 )
      ( MAKE-4PILE ?auto_15803 ?auto_15804 ?auto_15805 ?auto_15806 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15808 - BLOCK
      ?auto_15809 - BLOCK
      ?auto_15810 - BLOCK
      ?auto_15811 - BLOCK
    )
    :vars
    (
      ?auto_15812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15808 ) ( ON ?auto_15809 ?auto_15808 ) ( not ( = ?auto_15808 ?auto_15809 ) ) ( not ( = ?auto_15808 ?auto_15810 ) ) ( not ( = ?auto_15808 ?auto_15811 ) ) ( not ( = ?auto_15809 ?auto_15810 ) ) ( not ( = ?auto_15809 ?auto_15811 ) ) ( not ( = ?auto_15810 ?auto_15811 ) ) ( ON ?auto_15811 ?auto_15812 ) ( not ( = ?auto_15808 ?auto_15812 ) ) ( not ( = ?auto_15809 ?auto_15812 ) ) ( not ( = ?auto_15810 ?auto_15812 ) ) ( not ( = ?auto_15811 ?auto_15812 ) ) ( CLEAR ?auto_15809 ) ( ON ?auto_15810 ?auto_15811 ) ( CLEAR ?auto_15810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15812 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15812 ?auto_15811 )
      ( MAKE-4PILE ?auto_15808 ?auto_15809 ?auto_15810 ?auto_15811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15813 - BLOCK
      ?auto_15814 - BLOCK
      ?auto_15815 - BLOCK
      ?auto_15816 - BLOCK
    )
    :vars
    (
      ?auto_15817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15813 ) ( not ( = ?auto_15813 ?auto_15814 ) ) ( not ( = ?auto_15813 ?auto_15815 ) ) ( not ( = ?auto_15813 ?auto_15816 ) ) ( not ( = ?auto_15814 ?auto_15815 ) ) ( not ( = ?auto_15814 ?auto_15816 ) ) ( not ( = ?auto_15815 ?auto_15816 ) ) ( ON ?auto_15816 ?auto_15817 ) ( not ( = ?auto_15813 ?auto_15817 ) ) ( not ( = ?auto_15814 ?auto_15817 ) ) ( not ( = ?auto_15815 ?auto_15817 ) ) ( not ( = ?auto_15816 ?auto_15817 ) ) ( ON ?auto_15815 ?auto_15816 ) ( CLEAR ?auto_15815 ) ( ON-TABLE ?auto_15817 ) ( HOLDING ?auto_15814 ) ( CLEAR ?auto_15813 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15813 ?auto_15814 )
      ( MAKE-4PILE ?auto_15813 ?auto_15814 ?auto_15815 ?auto_15816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15818 - BLOCK
      ?auto_15819 - BLOCK
      ?auto_15820 - BLOCK
      ?auto_15821 - BLOCK
    )
    :vars
    (
      ?auto_15822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15818 ) ( not ( = ?auto_15818 ?auto_15819 ) ) ( not ( = ?auto_15818 ?auto_15820 ) ) ( not ( = ?auto_15818 ?auto_15821 ) ) ( not ( = ?auto_15819 ?auto_15820 ) ) ( not ( = ?auto_15819 ?auto_15821 ) ) ( not ( = ?auto_15820 ?auto_15821 ) ) ( ON ?auto_15821 ?auto_15822 ) ( not ( = ?auto_15818 ?auto_15822 ) ) ( not ( = ?auto_15819 ?auto_15822 ) ) ( not ( = ?auto_15820 ?auto_15822 ) ) ( not ( = ?auto_15821 ?auto_15822 ) ) ( ON ?auto_15820 ?auto_15821 ) ( ON-TABLE ?auto_15822 ) ( CLEAR ?auto_15818 ) ( ON ?auto_15819 ?auto_15820 ) ( CLEAR ?auto_15819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15822 ?auto_15821 ?auto_15820 )
      ( MAKE-4PILE ?auto_15818 ?auto_15819 ?auto_15820 ?auto_15821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15823 - BLOCK
      ?auto_15824 - BLOCK
      ?auto_15825 - BLOCK
      ?auto_15826 - BLOCK
    )
    :vars
    (
      ?auto_15827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15823 ?auto_15824 ) ) ( not ( = ?auto_15823 ?auto_15825 ) ) ( not ( = ?auto_15823 ?auto_15826 ) ) ( not ( = ?auto_15824 ?auto_15825 ) ) ( not ( = ?auto_15824 ?auto_15826 ) ) ( not ( = ?auto_15825 ?auto_15826 ) ) ( ON ?auto_15826 ?auto_15827 ) ( not ( = ?auto_15823 ?auto_15827 ) ) ( not ( = ?auto_15824 ?auto_15827 ) ) ( not ( = ?auto_15825 ?auto_15827 ) ) ( not ( = ?auto_15826 ?auto_15827 ) ) ( ON ?auto_15825 ?auto_15826 ) ( ON-TABLE ?auto_15827 ) ( ON ?auto_15824 ?auto_15825 ) ( CLEAR ?auto_15824 ) ( HOLDING ?auto_15823 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15823 )
      ( MAKE-4PILE ?auto_15823 ?auto_15824 ?auto_15825 ?auto_15826 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15828 - BLOCK
      ?auto_15829 - BLOCK
      ?auto_15830 - BLOCK
      ?auto_15831 - BLOCK
    )
    :vars
    (
      ?auto_15832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15828 ?auto_15829 ) ) ( not ( = ?auto_15828 ?auto_15830 ) ) ( not ( = ?auto_15828 ?auto_15831 ) ) ( not ( = ?auto_15829 ?auto_15830 ) ) ( not ( = ?auto_15829 ?auto_15831 ) ) ( not ( = ?auto_15830 ?auto_15831 ) ) ( ON ?auto_15831 ?auto_15832 ) ( not ( = ?auto_15828 ?auto_15832 ) ) ( not ( = ?auto_15829 ?auto_15832 ) ) ( not ( = ?auto_15830 ?auto_15832 ) ) ( not ( = ?auto_15831 ?auto_15832 ) ) ( ON ?auto_15830 ?auto_15831 ) ( ON-TABLE ?auto_15832 ) ( ON ?auto_15829 ?auto_15830 ) ( ON ?auto_15828 ?auto_15829 ) ( CLEAR ?auto_15828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15832 ?auto_15831 ?auto_15830 ?auto_15829 )
      ( MAKE-4PILE ?auto_15828 ?auto_15829 ?auto_15830 ?auto_15831 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15836 - BLOCK
      ?auto_15837 - BLOCK
      ?auto_15838 - BLOCK
    )
    :vars
    (
      ?auto_15839 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15839 ?auto_15838 ) ( CLEAR ?auto_15839 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15836 ) ( ON ?auto_15837 ?auto_15836 ) ( ON ?auto_15838 ?auto_15837 ) ( not ( = ?auto_15836 ?auto_15837 ) ) ( not ( = ?auto_15836 ?auto_15838 ) ) ( not ( = ?auto_15836 ?auto_15839 ) ) ( not ( = ?auto_15837 ?auto_15838 ) ) ( not ( = ?auto_15837 ?auto_15839 ) ) ( not ( = ?auto_15838 ?auto_15839 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15839 ?auto_15838 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15849 - BLOCK
      ?auto_15850 - BLOCK
      ?auto_15851 - BLOCK
    )
    :vars
    (
      ?auto_15852 - BLOCK
      ?auto_15853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15849 ) ( ON ?auto_15850 ?auto_15849 ) ( not ( = ?auto_15849 ?auto_15850 ) ) ( not ( = ?auto_15849 ?auto_15851 ) ) ( not ( = ?auto_15849 ?auto_15852 ) ) ( not ( = ?auto_15850 ?auto_15851 ) ) ( not ( = ?auto_15850 ?auto_15852 ) ) ( not ( = ?auto_15851 ?auto_15852 ) ) ( ON ?auto_15852 ?auto_15853 ) ( CLEAR ?auto_15852 ) ( not ( = ?auto_15849 ?auto_15853 ) ) ( not ( = ?auto_15850 ?auto_15853 ) ) ( not ( = ?auto_15851 ?auto_15853 ) ) ( not ( = ?auto_15852 ?auto_15853 ) ) ( HOLDING ?auto_15851 ) ( CLEAR ?auto_15850 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15849 ?auto_15850 ?auto_15851 ?auto_15852 )
      ( MAKE-3PILE ?auto_15849 ?auto_15850 ?auto_15851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15854 - BLOCK
      ?auto_15855 - BLOCK
      ?auto_15856 - BLOCK
    )
    :vars
    (
      ?auto_15857 - BLOCK
      ?auto_15858 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15854 ) ( ON ?auto_15855 ?auto_15854 ) ( not ( = ?auto_15854 ?auto_15855 ) ) ( not ( = ?auto_15854 ?auto_15856 ) ) ( not ( = ?auto_15854 ?auto_15857 ) ) ( not ( = ?auto_15855 ?auto_15856 ) ) ( not ( = ?auto_15855 ?auto_15857 ) ) ( not ( = ?auto_15856 ?auto_15857 ) ) ( ON ?auto_15857 ?auto_15858 ) ( not ( = ?auto_15854 ?auto_15858 ) ) ( not ( = ?auto_15855 ?auto_15858 ) ) ( not ( = ?auto_15856 ?auto_15858 ) ) ( not ( = ?auto_15857 ?auto_15858 ) ) ( CLEAR ?auto_15855 ) ( ON ?auto_15856 ?auto_15857 ) ( CLEAR ?auto_15856 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15858 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15858 ?auto_15857 )
      ( MAKE-3PILE ?auto_15854 ?auto_15855 ?auto_15856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15859 - BLOCK
      ?auto_15860 - BLOCK
      ?auto_15861 - BLOCK
    )
    :vars
    (
      ?auto_15862 - BLOCK
      ?auto_15863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15859 ) ( not ( = ?auto_15859 ?auto_15860 ) ) ( not ( = ?auto_15859 ?auto_15861 ) ) ( not ( = ?auto_15859 ?auto_15862 ) ) ( not ( = ?auto_15860 ?auto_15861 ) ) ( not ( = ?auto_15860 ?auto_15862 ) ) ( not ( = ?auto_15861 ?auto_15862 ) ) ( ON ?auto_15862 ?auto_15863 ) ( not ( = ?auto_15859 ?auto_15863 ) ) ( not ( = ?auto_15860 ?auto_15863 ) ) ( not ( = ?auto_15861 ?auto_15863 ) ) ( not ( = ?auto_15862 ?auto_15863 ) ) ( ON ?auto_15861 ?auto_15862 ) ( CLEAR ?auto_15861 ) ( ON-TABLE ?auto_15863 ) ( HOLDING ?auto_15860 ) ( CLEAR ?auto_15859 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15859 ?auto_15860 )
      ( MAKE-3PILE ?auto_15859 ?auto_15860 ?auto_15861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15864 - BLOCK
      ?auto_15865 - BLOCK
      ?auto_15866 - BLOCK
    )
    :vars
    (
      ?auto_15867 - BLOCK
      ?auto_15868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15864 ) ( not ( = ?auto_15864 ?auto_15865 ) ) ( not ( = ?auto_15864 ?auto_15866 ) ) ( not ( = ?auto_15864 ?auto_15867 ) ) ( not ( = ?auto_15865 ?auto_15866 ) ) ( not ( = ?auto_15865 ?auto_15867 ) ) ( not ( = ?auto_15866 ?auto_15867 ) ) ( ON ?auto_15867 ?auto_15868 ) ( not ( = ?auto_15864 ?auto_15868 ) ) ( not ( = ?auto_15865 ?auto_15868 ) ) ( not ( = ?auto_15866 ?auto_15868 ) ) ( not ( = ?auto_15867 ?auto_15868 ) ) ( ON ?auto_15866 ?auto_15867 ) ( ON-TABLE ?auto_15868 ) ( CLEAR ?auto_15864 ) ( ON ?auto_15865 ?auto_15866 ) ( CLEAR ?auto_15865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15868 ?auto_15867 ?auto_15866 )
      ( MAKE-3PILE ?auto_15864 ?auto_15865 ?auto_15866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15869 - BLOCK
      ?auto_15870 - BLOCK
      ?auto_15871 - BLOCK
    )
    :vars
    (
      ?auto_15872 - BLOCK
      ?auto_15873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15869 ?auto_15870 ) ) ( not ( = ?auto_15869 ?auto_15871 ) ) ( not ( = ?auto_15869 ?auto_15872 ) ) ( not ( = ?auto_15870 ?auto_15871 ) ) ( not ( = ?auto_15870 ?auto_15872 ) ) ( not ( = ?auto_15871 ?auto_15872 ) ) ( ON ?auto_15872 ?auto_15873 ) ( not ( = ?auto_15869 ?auto_15873 ) ) ( not ( = ?auto_15870 ?auto_15873 ) ) ( not ( = ?auto_15871 ?auto_15873 ) ) ( not ( = ?auto_15872 ?auto_15873 ) ) ( ON ?auto_15871 ?auto_15872 ) ( ON-TABLE ?auto_15873 ) ( ON ?auto_15870 ?auto_15871 ) ( CLEAR ?auto_15870 ) ( HOLDING ?auto_15869 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15869 )
      ( MAKE-3PILE ?auto_15869 ?auto_15870 ?auto_15871 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15874 - BLOCK
      ?auto_15875 - BLOCK
      ?auto_15876 - BLOCK
    )
    :vars
    (
      ?auto_15878 - BLOCK
      ?auto_15877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15874 ?auto_15875 ) ) ( not ( = ?auto_15874 ?auto_15876 ) ) ( not ( = ?auto_15874 ?auto_15878 ) ) ( not ( = ?auto_15875 ?auto_15876 ) ) ( not ( = ?auto_15875 ?auto_15878 ) ) ( not ( = ?auto_15876 ?auto_15878 ) ) ( ON ?auto_15878 ?auto_15877 ) ( not ( = ?auto_15874 ?auto_15877 ) ) ( not ( = ?auto_15875 ?auto_15877 ) ) ( not ( = ?auto_15876 ?auto_15877 ) ) ( not ( = ?auto_15878 ?auto_15877 ) ) ( ON ?auto_15876 ?auto_15878 ) ( ON-TABLE ?auto_15877 ) ( ON ?auto_15875 ?auto_15876 ) ( ON ?auto_15874 ?auto_15875 ) ( CLEAR ?auto_15874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15877 ?auto_15878 ?auto_15876 ?auto_15875 )
      ( MAKE-3PILE ?auto_15874 ?auto_15875 ?auto_15876 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15880 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15880 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15880 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15881 - BLOCK
    )
    :vars
    (
      ?auto_15882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15881 ?auto_15882 ) ( CLEAR ?auto_15881 ) ( HAND-EMPTY ) ( not ( = ?auto_15881 ?auto_15882 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15881 ?auto_15882 )
      ( MAKE-1PILE ?auto_15881 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15883 - BLOCK
    )
    :vars
    (
      ?auto_15884 - BLOCK
      ?auto_15886 - BLOCK
      ?auto_15885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15883 ?auto_15884 ) ) ( HOLDING ?auto_15883 ) ( CLEAR ?auto_15884 ) ( ON-TABLE ?auto_15886 ) ( ON ?auto_15885 ?auto_15886 ) ( ON ?auto_15884 ?auto_15885 ) ( not ( = ?auto_15886 ?auto_15885 ) ) ( not ( = ?auto_15886 ?auto_15884 ) ) ( not ( = ?auto_15886 ?auto_15883 ) ) ( not ( = ?auto_15885 ?auto_15884 ) ) ( not ( = ?auto_15885 ?auto_15883 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15886 ?auto_15885 ?auto_15884 ?auto_15883 )
      ( MAKE-1PILE ?auto_15883 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15887 - BLOCK
    )
    :vars
    (
      ?auto_15888 - BLOCK
      ?auto_15890 - BLOCK
      ?auto_15889 - BLOCK
      ?auto_15891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15887 ?auto_15888 ) ) ( CLEAR ?auto_15888 ) ( ON-TABLE ?auto_15890 ) ( ON ?auto_15889 ?auto_15890 ) ( ON ?auto_15888 ?auto_15889 ) ( not ( = ?auto_15890 ?auto_15889 ) ) ( not ( = ?auto_15890 ?auto_15888 ) ) ( not ( = ?auto_15890 ?auto_15887 ) ) ( not ( = ?auto_15889 ?auto_15888 ) ) ( not ( = ?auto_15889 ?auto_15887 ) ) ( ON ?auto_15887 ?auto_15891 ) ( CLEAR ?auto_15887 ) ( HAND-EMPTY ) ( not ( = ?auto_15887 ?auto_15891 ) ) ( not ( = ?auto_15888 ?auto_15891 ) ) ( not ( = ?auto_15890 ?auto_15891 ) ) ( not ( = ?auto_15889 ?auto_15891 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15887 ?auto_15891 )
      ( MAKE-1PILE ?auto_15887 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15892 - BLOCK
    )
    :vars
    (
      ?auto_15896 - BLOCK
      ?auto_15895 - BLOCK
      ?auto_15893 - BLOCK
      ?auto_15894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15892 ?auto_15896 ) ) ( ON-TABLE ?auto_15895 ) ( ON ?auto_15893 ?auto_15895 ) ( not ( = ?auto_15895 ?auto_15893 ) ) ( not ( = ?auto_15895 ?auto_15896 ) ) ( not ( = ?auto_15895 ?auto_15892 ) ) ( not ( = ?auto_15893 ?auto_15896 ) ) ( not ( = ?auto_15893 ?auto_15892 ) ) ( ON ?auto_15892 ?auto_15894 ) ( CLEAR ?auto_15892 ) ( not ( = ?auto_15892 ?auto_15894 ) ) ( not ( = ?auto_15896 ?auto_15894 ) ) ( not ( = ?auto_15895 ?auto_15894 ) ) ( not ( = ?auto_15893 ?auto_15894 ) ) ( HOLDING ?auto_15896 ) ( CLEAR ?auto_15893 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15895 ?auto_15893 ?auto_15896 )
      ( MAKE-1PILE ?auto_15892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15897 - BLOCK
    )
    :vars
    (
      ?auto_15901 - BLOCK
      ?auto_15899 - BLOCK
      ?auto_15898 - BLOCK
      ?auto_15900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15897 ?auto_15901 ) ) ( ON-TABLE ?auto_15899 ) ( ON ?auto_15898 ?auto_15899 ) ( not ( = ?auto_15899 ?auto_15898 ) ) ( not ( = ?auto_15899 ?auto_15901 ) ) ( not ( = ?auto_15899 ?auto_15897 ) ) ( not ( = ?auto_15898 ?auto_15901 ) ) ( not ( = ?auto_15898 ?auto_15897 ) ) ( ON ?auto_15897 ?auto_15900 ) ( not ( = ?auto_15897 ?auto_15900 ) ) ( not ( = ?auto_15901 ?auto_15900 ) ) ( not ( = ?auto_15899 ?auto_15900 ) ) ( not ( = ?auto_15898 ?auto_15900 ) ) ( CLEAR ?auto_15898 ) ( ON ?auto_15901 ?auto_15897 ) ( CLEAR ?auto_15901 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15900 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15900 ?auto_15897 )
      ( MAKE-1PILE ?auto_15897 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15902 - BLOCK
    )
    :vars
    (
      ?auto_15903 - BLOCK
      ?auto_15906 - BLOCK
      ?auto_15904 - BLOCK
      ?auto_15905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15902 ?auto_15903 ) ) ( ON-TABLE ?auto_15906 ) ( not ( = ?auto_15906 ?auto_15904 ) ) ( not ( = ?auto_15906 ?auto_15903 ) ) ( not ( = ?auto_15906 ?auto_15902 ) ) ( not ( = ?auto_15904 ?auto_15903 ) ) ( not ( = ?auto_15904 ?auto_15902 ) ) ( ON ?auto_15902 ?auto_15905 ) ( not ( = ?auto_15902 ?auto_15905 ) ) ( not ( = ?auto_15903 ?auto_15905 ) ) ( not ( = ?auto_15906 ?auto_15905 ) ) ( not ( = ?auto_15904 ?auto_15905 ) ) ( ON ?auto_15903 ?auto_15902 ) ( CLEAR ?auto_15903 ) ( ON-TABLE ?auto_15905 ) ( HOLDING ?auto_15904 ) ( CLEAR ?auto_15906 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15906 ?auto_15904 )
      ( MAKE-1PILE ?auto_15902 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15907 - BLOCK
    )
    :vars
    (
      ?auto_15908 - BLOCK
      ?auto_15909 - BLOCK
      ?auto_15910 - BLOCK
      ?auto_15911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15907 ?auto_15908 ) ) ( ON-TABLE ?auto_15909 ) ( not ( = ?auto_15909 ?auto_15910 ) ) ( not ( = ?auto_15909 ?auto_15908 ) ) ( not ( = ?auto_15909 ?auto_15907 ) ) ( not ( = ?auto_15910 ?auto_15908 ) ) ( not ( = ?auto_15910 ?auto_15907 ) ) ( ON ?auto_15907 ?auto_15911 ) ( not ( = ?auto_15907 ?auto_15911 ) ) ( not ( = ?auto_15908 ?auto_15911 ) ) ( not ( = ?auto_15909 ?auto_15911 ) ) ( not ( = ?auto_15910 ?auto_15911 ) ) ( ON ?auto_15908 ?auto_15907 ) ( ON-TABLE ?auto_15911 ) ( CLEAR ?auto_15909 ) ( ON ?auto_15910 ?auto_15908 ) ( CLEAR ?auto_15910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15911 ?auto_15907 ?auto_15908 )
      ( MAKE-1PILE ?auto_15907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15912 - BLOCK
    )
    :vars
    (
      ?auto_15916 - BLOCK
      ?auto_15913 - BLOCK
      ?auto_15915 - BLOCK
      ?auto_15914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15912 ?auto_15916 ) ) ( not ( = ?auto_15913 ?auto_15915 ) ) ( not ( = ?auto_15913 ?auto_15916 ) ) ( not ( = ?auto_15913 ?auto_15912 ) ) ( not ( = ?auto_15915 ?auto_15916 ) ) ( not ( = ?auto_15915 ?auto_15912 ) ) ( ON ?auto_15912 ?auto_15914 ) ( not ( = ?auto_15912 ?auto_15914 ) ) ( not ( = ?auto_15916 ?auto_15914 ) ) ( not ( = ?auto_15913 ?auto_15914 ) ) ( not ( = ?auto_15915 ?auto_15914 ) ) ( ON ?auto_15916 ?auto_15912 ) ( ON-TABLE ?auto_15914 ) ( ON ?auto_15915 ?auto_15916 ) ( CLEAR ?auto_15915 ) ( HOLDING ?auto_15913 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15913 )
      ( MAKE-1PILE ?auto_15912 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15917 - BLOCK
    )
    :vars
    (
      ?auto_15918 - BLOCK
      ?auto_15919 - BLOCK
      ?auto_15921 - BLOCK
      ?auto_15920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15917 ?auto_15918 ) ) ( not ( = ?auto_15919 ?auto_15921 ) ) ( not ( = ?auto_15919 ?auto_15918 ) ) ( not ( = ?auto_15919 ?auto_15917 ) ) ( not ( = ?auto_15921 ?auto_15918 ) ) ( not ( = ?auto_15921 ?auto_15917 ) ) ( ON ?auto_15917 ?auto_15920 ) ( not ( = ?auto_15917 ?auto_15920 ) ) ( not ( = ?auto_15918 ?auto_15920 ) ) ( not ( = ?auto_15919 ?auto_15920 ) ) ( not ( = ?auto_15921 ?auto_15920 ) ) ( ON ?auto_15918 ?auto_15917 ) ( ON-TABLE ?auto_15920 ) ( ON ?auto_15921 ?auto_15918 ) ( ON ?auto_15919 ?auto_15921 ) ( CLEAR ?auto_15919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15920 ?auto_15917 ?auto_15918 ?auto_15921 )
      ( MAKE-1PILE ?auto_15917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15924 - BLOCK
      ?auto_15925 - BLOCK
    )
    :vars
    (
      ?auto_15926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15926 ?auto_15925 ) ( CLEAR ?auto_15926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15924 ) ( ON ?auto_15925 ?auto_15924 ) ( not ( = ?auto_15924 ?auto_15925 ) ) ( not ( = ?auto_15924 ?auto_15926 ) ) ( not ( = ?auto_15925 ?auto_15926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15926 ?auto_15925 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15927 - BLOCK
      ?auto_15928 - BLOCK
    )
    :vars
    (
      ?auto_15929 - BLOCK
      ?auto_15930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15929 ?auto_15928 ) ( CLEAR ?auto_15929 ) ( ON-TABLE ?auto_15927 ) ( ON ?auto_15928 ?auto_15927 ) ( not ( = ?auto_15927 ?auto_15928 ) ) ( not ( = ?auto_15927 ?auto_15929 ) ) ( not ( = ?auto_15928 ?auto_15929 ) ) ( HOLDING ?auto_15930 ) ( not ( = ?auto_15927 ?auto_15930 ) ) ( not ( = ?auto_15928 ?auto_15930 ) ) ( not ( = ?auto_15929 ?auto_15930 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15930 )
      ( MAKE-2PILE ?auto_15927 ?auto_15928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15931 - BLOCK
      ?auto_15932 - BLOCK
    )
    :vars
    (
      ?auto_15934 - BLOCK
      ?auto_15933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15934 ?auto_15932 ) ( ON-TABLE ?auto_15931 ) ( ON ?auto_15932 ?auto_15931 ) ( not ( = ?auto_15931 ?auto_15932 ) ) ( not ( = ?auto_15931 ?auto_15934 ) ) ( not ( = ?auto_15932 ?auto_15934 ) ) ( not ( = ?auto_15931 ?auto_15933 ) ) ( not ( = ?auto_15932 ?auto_15933 ) ) ( not ( = ?auto_15934 ?auto_15933 ) ) ( ON ?auto_15933 ?auto_15934 ) ( CLEAR ?auto_15933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15931 ?auto_15932 ?auto_15934 )
      ( MAKE-2PILE ?auto_15931 ?auto_15932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15935 - BLOCK
      ?auto_15936 - BLOCK
    )
    :vars
    (
      ?auto_15938 - BLOCK
      ?auto_15937 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15938 ?auto_15936 ) ( ON-TABLE ?auto_15935 ) ( ON ?auto_15936 ?auto_15935 ) ( not ( = ?auto_15935 ?auto_15936 ) ) ( not ( = ?auto_15935 ?auto_15938 ) ) ( not ( = ?auto_15936 ?auto_15938 ) ) ( not ( = ?auto_15935 ?auto_15937 ) ) ( not ( = ?auto_15936 ?auto_15937 ) ) ( not ( = ?auto_15938 ?auto_15937 ) ) ( HOLDING ?auto_15937 ) ( CLEAR ?auto_15938 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15935 ?auto_15936 ?auto_15938 ?auto_15937 )
      ( MAKE-2PILE ?auto_15935 ?auto_15936 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15939 - BLOCK
      ?auto_15940 - BLOCK
    )
    :vars
    (
      ?auto_15942 - BLOCK
      ?auto_15941 - BLOCK
      ?auto_15943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15942 ?auto_15940 ) ( ON-TABLE ?auto_15939 ) ( ON ?auto_15940 ?auto_15939 ) ( not ( = ?auto_15939 ?auto_15940 ) ) ( not ( = ?auto_15939 ?auto_15942 ) ) ( not ( = ?auto_15940 ?auto_15942 ) ) ( not ( = ?auto_15939 ?auto_15941 ) ) ( not ( = ?auto_15940 ?auto_15941 ) ) ( not ( = ?auto_15942 ?auto_15941 ) ) ( CLEAR ?auto_15942 ) ( ON ?auto_15941 ?auto_15943 ) ( CLEAR ?auto_15941 ) ( HAND-EMPTY ) ( not ( = ?auto_15939 ?auto_15943 ) ) ( not ( = ?auto_15940 ?auto_15943 ) ) ( not ( = ?auto_15942 ?auto_15943 ) ) ( not ( = ?auto_15941 ?auto_15943 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15941 ?auto_15943 )
      ( MAKE-2PILE ?auto_15939 ?auto_15940 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15954 - BLOCK
      ?auto_15955 - BLOCK
    )
    :vars
    (
      ?auto_15958 - BLOCK
      ?auto_15957 - BLOCK
      ?auto_15956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15954 ) ( not ( = ?auto_15954 ?auto_15955 ) ) ( not ( = ?auto_15954 ?auto_15958 ) ) ( not ( = ?auto_15955 ?auto_15958 ) ) ( not ( = ?auto_15954 ?auto_15957 ) ) ( not ( = ?auto_15955 ?auto_15957 ) ) ( not ( = ?auto_15958 ?auto_15957 ) ) ( ON ?auto_15957 ?auto_15956 ) ( not ( = ?auto_15954 ?auto_15956 ) ) ( not ( = ?auto_15955 ?auto_15956 ) ) ( not ( = ?auto_15958 ?auto_15956 ) ) ( not ( = ?auto_15957 ?auto_15956 ) ) ( ON ?auto_15958 ?auto_15957 ) ( CLEAR ?auto_15958 ) ( HOLDING ?auto_15955 ) ( CLEAR ?auto_15954 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15954 ?auto_15955 ?auto_15958 )
      ( MAKE-2PILE ?auto_15954 ?auto_15955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15959 - BLOCK
      ?auto_15960 - BLOCK
    )
    :vars
    (
      ?auto_15962 - BLOCK
      ?auto_15963 - BLOCK
      ?auto_15961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15959 ) ( not ( = ?auto_15959 ?auto_15960 ) ) ( not ( = ?auto_15959 ?auto_15962 ) ) ( not ( = ?auto_15960 ?auto_15962 ) ) ( not ( = ?auto_15959 ?auto_15963 ) ) ( not ( = ?auto_15960 ?auto_15963 ) ) ( not ( = ?auto_15962 ?auto_15963 ) ) ( ON ?auto_15963 ?auto_15961 ) ( not ( = ?auto_15959 ?auto_15961 ) ) ( not ( = ?auto_15960 ?auto_15961 ) ) ( not ( = ?auto_15962 ?auto_15961 ) ) ( not ( = ?auto_15963 ?auto_15961 ) ) ( ON ?auto_15962 ?auto_15963 ) ( CLEAR ?auto_15959 ) ( ON ?auto_15960 ?auto_15962 ) ( CLEAR ?auto_15960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15961 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15961 ?auto_15963 ?auto_15962 )
      ( MAKE-2PILE ?auto_15959 ?auto_15960 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15964 - BLOCK
      ?auto_15965 - BLOCK
    )
    :vars
    (
      ?auto_15967 - BLOCK
      ?auto_15966 - BLOCK
      ?auto_15968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15964 ?auto_15965 ) ) ( not ( = ?auto_15964 ?auto_15967 ) ) ( not ( = ?auto_15965 ?auto_15967 ) ) ( not ( = ?auto_15964 ?auto_15966 ) ) ( not ( = ?auto_15965 ?auto_15966 ) ) ( not ( = ?auto_15967 ?auto_15966 ) ) ( ON ?auto_15966 ?auto_15968 ) ( not ( = ?auto_15964 ?auto_15968 ) ) ( not ( = ?auto_15965 ?auto_15968 ) ) ( not ( = ?auto_15967 ?auto_15968 ) ) ( not ( = ?auto_15966 ?auto_15968 ) ) ( ON ?auto_15967 ?auto_15966 ) ( ON ?auto_15965 ?auto_15967 ) ( CLEAR ?auto_15965 ) ( ON-TABLE ?auto_15968 ) ( HOLDING ?auto_15964 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15964 )
      ( MAKE-2PILE ?auto_15964 ?auto_15965 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15969 - BLOCK
      ?auto_15970 - BLOCK
    )
    :vars
    (
      ?auto_15973 - BLOCK
      ?auto_15972 - BLOCK
      ?auto_15971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15969 ?auto_15970 ) ) ( not ( = ?auto_15969 ?auto_15973 ) ) ( not ( = ?auto_15970 ?auto_15973 ) ) ( not ( = ?auto_15969 ?auto_15972 ) ) ( not ( = ?auto_15970 ?auto_15972 ) ) ( not ( = ?auto_15973 ?auto_15972 ) ) ( ON ?auto_15972 ?auto_15971 ) ( not ( = ?auto_15969 ?auto_15971 ) ) ( not ( = ?auto_15970 ?auto_15971 ) ) ( not ( = ?auto_15973 ?auto_15971 ) ) ( not ( = ?auto_15972 ?auto_15971 ) ) ( ON ?auto_15973 ?auto_15972 ) ( ON ?auto_15970 ?auto_15973 ) ( ON-TABLE ?auto_15971 ) ( ON ?auto_15969 ?auto_15970 ) ( CLEAR ?auto_15969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15971 ?auto_15972 ?auto_15973 ?auto_15970 )
      ( MAKE-2PILE ?auto_15969 ?auto_15970 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15976 - BLOCK
      ?auto_15977 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15977 ) ( CLEAR ?auto_15976 ) ( ON-TABLE ?auto_15976 ) ( not ( = ?auto_15976 ?auto_15977 ) ) )
    :subtasks
    ( ( !STACK ?auto_15977 ?auto_15976 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15978 - BLOCK
      ?auto_15979 - BLOCK
    )
    :vars
    (
      ?auto_15980 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15978 ) ( ON-TABLE ?auto_15978 ) ( not ( = ?auto_15978 ?auto_15979 ) ) ( ON ?auto_15979 ?auto_15980 ) ( CLEAR ?auto_15979 ) ( HAND-EMPTY ) ( not ( = ?auto_15978 ?auto_15980 ) ) ( not ( = ?auto_15979 ?auto_15980 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15979 ?auto_15980 )
      ( MAKE-2PILE ?auto_15978 ?auto_15979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15981 - BLOCK
      ?auto_15982 - BLOCK
    )
    :vars
    (
      ?auto_15983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15981 ?auto_15982 ) ) ( ON ?auto_15982 ?auto_15983 ) ( CLEAR ?auto_15982 ) ( not ( = ?auto_15981 ?auto_15983 ) ) ( not ( = ?auto_15982 ?auto_15983 ) ) ( HOLDING ?auto_15981 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15981 )
      ( MAKE-2PILE ?auto_15981 ?auto_15982 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15984 - BLOCK
      ?auto_15985 - BLOCK
    )
    :vars
    (
      ?auto_15986 - BLOCK
      ?auto_15987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15984 ?auto_15985 ) ) ( ON ?auto_15985 ?auto_15986 ) ( not ( = ?auto_15984 ?auto_15986 ) ) ( not ( = ?auto_15985 ?auto_15986 ) ) ( ON ?auto_15984 ?auto_15985 ) ( CLEAR ?auto_15984 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15987 ) ( ON ?auto_15986 ?auto_15987 ) ( not ( = ?auto_15987 ?auto_15986 ) ) ( not ( = ?auto_15987 ?auto_15985 ) ) ( not ( = ?auto_15987 ?auto_15984 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15987 ?auto_15986 ?auto_15985 )
      ( MAKE-2PILE ?auto_15984 ?auto_15985 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15988 - BLOCK
      ?auto_15989 - BLOCK
    )
    :vars
    (
      ?auto_15990 - BLOCK
      ?auto_15991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15988 ?auto_15989 ) ) ( ON ?auto_15989 ?auto_15990 ) ( not ( = ?auto_15988 ?auto_15990 ) ) ( not ( = ?auto_15989 ?auto_15990 ) ) ( ON-TABLE ?auto_15991 ) ( ON ?auto_15990 ?auto_15991 ) ( not ( = ?auto_15991 ?auto_15990 ) ) ( not ( = ?auto_15991 ?auto_15989 ) ) ( not ( = ?auto_15991 ?auto_15988 ) ) ( HOLDING ?auto_15988 ) ( CLEAR ?auto_15989 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15991 ?auto_15990 ?auto_15989 ?auto_15988 )
      ( MAKE-2PILE ?auto_15988 ?auto_15989 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15992 - BLOCK
      ?auto_15993 - BLOCK
    )
    :vars
    (
      ?auto_15994 - BLOCK
      ?auto_15995 - BLOCK
      ?auto_15996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15992 ?auto_15993 ) ) ( ON ?auto_15993 ?auto_15994 ) ( not ( = ?auto_15992 ?auto_15994 ) ) ( not ( = ?auto_15993 ?auto_15994 ) ) ( ON-TABLE ?auto_15995 ) ( ON ?auto_15994 ?auto_15995 ) ( not ( = ?auto_15995 ?auto_15994 ) ) ( not ( = ?auto_15995 ?auto_15993 ) ) ( not ( = ?auto_15995 ?auto_15992 ) ) ( CLEAR ?auto_15993 ) ( ON ?auto_15992 ?auto_15996 ) ( CLEAR ?auto_15992 ) ( HAND-EMPTY ) ( not ( = ?auto_15992 ?auto_15996 ) ) ( not ( = ?auto_15993 ?auto_15996 ) ) ( not ( = ?auto_15994 ?auto_15996 ) ) ( not ( = ?auto_15995 ?auto_15996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15992 ?auto_15996 )
      ( MAKE-2PILE ?auto_15992 ?auto_15993 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15997 - BLOCK
      ?auto_15998 - BLOCK
    )
    :vars
    (
      ?auto_15999 - BLOCK
      ?auto_16000 - BLOCK
      ?auto_16001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15997 ?auto_15998 ) ) ( not ( = ?auto_15997 ?auto_15999 ) ) ( not ( = ?auto_15998 ?auto_15999 ) ) ( ON-TABLE ?auto_16000 ) ( ON ?auto_15999 ?auto_16000 ) ( not ( = ?auto_16000 ?auto_15999 ) ) ( not ( = ?auto_16000 ?auto_15998 ) ) ( not ( = ?auto_16000 ?auto_15997 ) ) ( ON ?auto_15997 ?auto_16001 ) ( CLEAR ?auto_15997 ) ( not ( = ?auto_15997 ?auto_16001 ) ) ( not ( = ?auto_15998 ?auto_16001 ) ) ( not ( = ?auto_15999 ?auto_16001 ) ) ( not ( = ?auto_16000 ?auto_16001 ) ) ( HOLDING ?auto_15998 ) ( CLEAR ?auto_15999 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16000 ?auto_15999 ?auto_15998 )
      ( MAKE-2PILE ?auto_15997 ?auto_15998 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16002 - BLOCK
      ?auto_16003 - BLOCK
    )
    :vars
    (
      ?auto_16005 - BLOCK
      ?auto_16004 - BLOCK
      ?auto_16006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16002 ?auto_16003 ) ) ( not ( = ?auto_16002 ?auto_16005 ) ) ( not ( = ?auto_16003 ?auto_16005 ) ) ( ON-TABLE ?auto_16004 ) ( ON ?auto_16005 ?auto_16004 ) ( not ( = ?auto_16004 ?auto_16005 ) ) ( not ( = ?auto_16004 ?auto_16003 ) ) ( not ( = ?auto_16004 ?auto_16002 ) ) ( ON ?auto_16002 ?auto_16006 ) ( not ( = ?auto_16002 ?auto_16006 ) ) ( not ( = ?auto_16003 ?auto_16006 ) ) ( not ( = ?auto_16005 ?auto_16006 ) ) ( not ( = ?auto_16004 ?auto_16006 ) ) ( CLEAR ?auto_16005 ) ( ON ?auto_16003 ?auto_16002 ) ( CLEAR ?auto_16003 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16006 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16006 ?auto_16002 )
      ( MAKE-2PILE ?auto_16002 ?auto_16003 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16007 - BLOCK
      ?auto_16008 - BLOCK
    )
    :vars
    (
      ?auto_16011 - BLOCK
      ?auto_16009 - BLOCK
      ?auto_16010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16007 ?auto_16008 ) ) ( not ( = ?auto_16007 ?auto_16011 ) ) ( not ( = ?auto_16008 ?auto_16011 ) ) ( ON-TABLE ?auto_16009 ) ( not ( = ?auto_16009 ?auto_16011 ) ) ( not ( = ?auto_16009 ?auto_16008 ) ) ( not ( = ?auto_16009 ?auto_16007 ) ) ( ON ?auto_16007 ?auto_16010 ) ( not ( = ?auto_16007 ?auto_16010 ) ) ( not ( = ?auto_16008 ?auto_16010 ) ) ( not ( = ?auto_16011 ?auto_16010 ) ) ( not ( = ?auto_16009 ?auto_16010 ) ) ( ON ?auto_16008 ?auto_16007 ) ( CLEAR ?auto_16008 ) ( ON-TABLE ?auto_16010 ) ( HOLDING ?auto_16011 ) ( CLEAR ?auto_16009 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16009 ?auto_16011 )
      ( MAKE-2PILE ?auto_16007 ?auto_16008 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16012 - BLOCK
      ?auto_16013 - BLOCK
    )
    :vars
    (
      ?auto_16014 - BLOCK
      ?auto_16016 - BLOCK
      ?auto_16015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16012 ?auto_16013 ) ) ( not ( = ?auto_16012 ?auto_16014 ) ) ( not ( = ?auto_16013 ?auto_16014 ) ) ( ON-TABLE ?auto_16016 ) ( not ( = ?auto_16016 ?auto_16014 ) ) ( not ( = ?auto_16016 ?auto_16013 ) ) ( not ( = ?auto_16016 ?auto_16012 ) ) ( ON ?auto_16012 ?auto_16015 ) ( not ( = ?auto_16012 ?auto_16015 ) ) ( not ( = ?auto_16013 ?auto_16015 ) ) ( not ( = ?auto_16014 ?auto_16015 ) ) ( not ( = ?auto_16016 ?auto_16015 ) ) ( ON ?auto_16013 ?auto_16012 ) ( ON-TABLE ?auto_16015 ) ( CLEAR ?auto_16016 ) ( ON ?auto_16014 ?auto_16013 ) ( CLEAR ?auto_16014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16015 ?auto_16012 ?auto_16013 )
      ( MAKE-2PILE ?auto_16012 ?auto_16013 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16017 - BLOCK
      ?auto_16018 - BLOCK
    )
    :vars
    (
      ?auto_16020 - BLOCK
      ?auto_16021 - BLOCK
      ?auto_16019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16017 ?auto_16018 ) ) ( not ( = ?auto_16017 ?auto_16020 ) ) ( not ( = ?auto_16018 ?auto_16020 ) ) ( not ( = ?auto_16021 ?auto_16020 ) ) ( not ( = ?auto_16021 ?auto_16018 ) ) ( not ( = ?auto_16021 ?auto_16017 ) ) ( ON ?auto_16017 ?auto_16019 ) ( not ( = ?auto_16017 ?auto_16019 ) ) ( not ( = ?auto_16018 ?auto_16019 ) ) ( not ( = ?auto_16020 ?auto_16019 ) ) ( not ( = ?auto_16021 ?auto_16019 ) ) ( ON ?auto_16018 ?auto_16017 ) ( ON-TABLE ?auto_16019 ) ( ON ?auto_16020 ?auto_16018 ) ( CLEAR ?auto_16020 ) ( HOLDING ?auto_16021 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16021 )
      ( MAKE-2PILE ?auto_16017 ?auto_16018 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16022 - BLOCK
      ?auto_16023 - BLOCK
    )
    :vars
    (
      ?auto_16026 - BLOCK
      ?auto_16024 - BLOCK
      ?auto_16025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16022 ?auto_16023 ) ) ( not ( = ?auto_16022 ?auto_16026 ) ) ( not ( = ?auto_16023 ?auto_16026 ) ) ( not ( = ?auto_16024 ?auto_16026 ) ) ( not ( = ?auto_16024 ?auto_16023 ) ) ( not ( = ?auto_16024 ?auto_16022 ) ) ( ON ?auto_16022 ?auto_16025 ) ( not ( = ?auto_16022 ?auto_16025 ) ) ( not ( = ?auto_16023 ?auto_16025 ) ) ( not ( = ?auto_16026 ?auto_16025 ) ) ( not ( = ?auto_16024 ?auto_16025 ) ) ( ON ?auto_16023 ?auto_16022 ) ( ON-TABLE ?auto_16025 ) ( ON ?auto_16026 ?auto_16023 ) ( ON ?auto_16024 ?auto_16026 ) ( CLEAR ?auto_16024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16025 ?auto_16022 ?auto_16023 ?auto_16026 )
      ( MAKE-2PILE ?auto_16022 ?auto_16023 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16028 - BLOCK
    )
    :vars
    (
      ?auto_16029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16029 ?auto_16028 ) ( CLEAR ?auto_16029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16028 ) ( not ( = ?auto_16028 ?auto_16029 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16029 ?auto_16028 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16030 - BLOCK
    )
    :vars
    (
      ?auto_16031 - BLOCK
      ?auto_16032 - BLOCK
      ?auto_16033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16031 ?auto_16030 ) ( CLEAR ?auto_16031 ) ( ON-TABLE ?auto_16030 ) ( not ( = ?auto_16030 ?auto_16031 ) ) ( HOLDING ?auto_16032 ) ( CLEAR ?auto_16033 ) ( not ( = ?auto_16030 ?auto_16032 ) ) ( not ( = ?auto_16030 ?auto_16033 ) ) ( not ( = ?auto_16031 ?auto_16032 ) ) ( not ( = ?auto_16031 ?auto_16033 ) ) ( not ( = ?auto_16032 ?auto_16033 ) ) )
    :subtasks
    ( ( !STACK ?auto_16032 ?auto_16033 )
      ( MAKE-1PILE ?auto_16030 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16034 - BLOCK
    )
    :vars
    (
      ?auto_16036 - BLOCK
      ?auto_16035 - BLOCK
      ?auto_16037 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16036 ?auto_16034 ) ( ON-TABLE ?auto_16034 ) ( not ( = ?auto_16034 ?auto_16036 ) ) ( CLEAR ?auto_16035 ) ( not ( = ?auto_16034 ?auto_16037 ) ) ( not ( = ?auto_16034 ?auto_16035 ) ) ( not ( = ?auto_16036 ?auto_16037 ) ) ( not ( = ?auto_16036 ?auto_16035 ) ) ( not ( = ?auto_16037 ?auto_16035 ) ) ( ON ?auto_16037 ?auto_16036 ) ( CLEAR ?auto_16037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16034 ?auto_16036 )
      ( MAKE-1PILE ?auto_16034 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16038 - BLOCK
    )
    :vars
    (
      ?auto_16039 - BLOCK
      ?auto_16040 - BLOCK
      ?auto_16041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16039 ?auto_16038 ) ( ON-TABLE ?auto_16038 ) ( not ( = ?auto_16038 ?auto_16039 ) ) ( not ( = ?auto_16038 ?auto_16040 ) ) ( not ( = ?auto_16038 ?auto_16041 ) ) ( not ( = ?auto_16039 ?auto_16040 ) ) ( not ( = ?auto_16039 ?auto_16041 ) ) ( not ( = ?auto_16040 ?auto_16041 ) ) ( ON ?auto_16040 ?auto_16039 ) ( CLEAR ?auto_16040 ) ( HOLDING ?auto_16041 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16041 )
      ( MAKE-1PILE ?auto_16038 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16042 - BLOCK
    )
    :vars
    (
      ?auto_16044 - BLOCK
      ?auto_16045 - BLOCK
      ?auto_16043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16044 ?auto_16042 ) ( ON-TABLE ?auto_16042 ) ( not ( = ?auto_16042 ?auto_16044 ) ) ( not ( = ?auto_16042 ?auto_16045 ) ) ( not ( = ?auto_16042 ?auto_16043 ) ) ( not ( = ?auto_16044 ?auto_16045 ) ) ( not ( = ?auto_16044 ?auto_16043 ) ) ( not ( = ?auto_16045 ?auto_16043 ) ) ( ON ?auto_16045 ?auto_16044 ) ( ON ?auto_16043 ?auto_16045 ) ( CLEAR ?auto_16043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16042 ?auto_16044 ?auto_16045 )
      ( MAKE-1PILE ?auto_16042 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16046 - BLOCK
    )
    :vars
    (
      ?auto_16047 - BLOCK
      ?auto_16048 - BLOCK
      ?auto_16049 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16047 ?auto_16046 ) ( ON-TABLE ?auto_16046 ) ( not ( = ?auto_16046 ?auto_16047 ) ) ( not ( = ?auto_16046 ?auto_16048 ) ) ( not ( = ?auto_16046 ?auto_16049 ) ) ( not ( = ?auto_16047 ?auto_16048 ) ) ( not ( = ?auto_16047 ?auto_16049 ) ) ( not ( = ?auto_16048 ?auto_16049 ) ) ( ON ?auto_16048 ?auto_16047 ) ( HOLDING ?auto_16049 ) ( CLEAR ?auto_16048 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16046 ?auto_16047 ?auto_16048 ?auto_16049 )
      ( MAKE-1PILE ?auto_16046 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16050 - BLOCK
    )
    :vars
    (
      ?auto_16053 - BLOCK
      ?auto_16051 - BLOCK
      ?auto_16052 - BLOCK
      ?auto_16054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16053 ?auto_16050 ) ( ON-TABLE ?auto_16050 ) ( not ( = ?auto_16050 ?auto_16053 ) ) ( not ( = ?auto_16050 ?auto_16051 ) ) ( not ( = ?auto_16050 ?auto_16052 ) ) ( not ( = ?auto_16053 ?auto_16051 ) ) ( not ( = ?auto_16053 ?auto_16052 ) ) ( not ( = ?auto_16051 ?auto_16052 ) ) ( ON ?auto_16051 ?auto_16053 ) ( CLEAR ?auto_16051 ) ( ON ?auto_16052 ?auto_16054 ) ( CLEAR ?auto_16052 ) ( HAND-EMPTY ) ( not ( = ?auto_16050 ?auto_16054 ) ) ( not ( = ?auto_16053 ?auto_16054 ) ) ( not ( = ?auto_16051 ?auto_16054 ) ) ( not ( = ?auto_16052 ?auto_16054 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16052 ?auto_16054 )
      ( MAKE-1PILE ?auto_16050 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16055 - BLOCK
    )
    :vars
    (
      ?auto_16059 - BLOCK
      ?auto_16057 - BLOCK
      ?auto_16058 - BLOCK
      ?auto_16056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16059 ?auto_16055 ) ( ON-TABLE ?auto_16055 ) ( not ( = ?auto_16055 ?auto_16059 ) ) ( not ( = ?auto_16055 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( not ( = ?auto_16059 ?auto_16057 ) ) ( not ( = ?auto_16059 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16058 ) ) ( ON ?auto_16058 ?auto_16056 ) ( CLEAR ?auto_16058 ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( not ( = ?auto_16059 ?auto_16056 ) ) ( not ( = ?auto_16057 ?auto_16056 ) ) ( not ( = ?auto_16058 ?auto_16056 ) ) ( HOLDING ?auto_16057 ) ( CLEAR ?auto_16059 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16055 ?auto_16059 ?auto_16057 )
      ( MAKE-1PILE ?auto_16055 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16060 - BLOCK
    )
    :vars
    (
      ?auto_16064 - BLOCK
      ?auto_16062 - BLOCK
      ?auto_16061 - BLOCK
      ?auto_16063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16064 ?auto_16060 ) ( ON-TABLE ?auto_16060 ) ( not ( = ?auto_16060 ?auto_16064 ) ) ( not ( = ?auto_16060 ?auto_16062 ) ) ( not ( = ?auto_16060 ?auto_16061 ) ) ( not ( = ?auto_16064 ?auto_16062 ) ) ( not ( = ?auto_16064 ?auto_16061 ) ) ( not ( = ?auto_16062 ?auto_16061 ) ) ( ON ?auto_16061 ?auto_16063 ) ( not ( = ?auto_16060 ?auto_16063 ) ) ( not ( = ?auto_16064 ?auto_16063 ) ) ( not ( = ?auto_16062 ?auto_16063 ) ) ( not ( = ?auto_16061 ?auto_16063 ) ) ( CLEAR ?auto_16064 ) ( ON ?auto_16062 ?auto_16061 ) ( CLEAR ?auto_16062 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16063 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16063 ?auto_16061 )
      ( MAKE-1PILE ?auto_16060 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16075 - BLOCK
    )
    :vars
    (
      ?auto_16078 - BLOCK
      ?auto_16079 - BLOCK
      ?auto_16077 - BLOCK
      ?auto_16076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16075 ?auto_16078 ) ) ( not ( = ?auto_16075 ?auto_16079 ) ) ( not ( = ?auto_16075 ?auto_16077 ) ) ( not ( = ?auto_16078 ?auto_16079 ) ) ( not ( = ?auto_16078 ?auto_16077 ) ) ( not ( = ?auto_16079 ?auto_16077 ) ) ( ON ?auto_16077 ?auto_16076 ) ( not ( = ?auto_16075 ?auto_16076 ) ) ( not ( = ?auto_16078 ?auto_16076 ) ) ( not ( = ?auto_16079 ?auto_16076 ) ) ( not ( = ?auto_16077 ?auto_16076 ) ) ( ON ?auto_16079 ?auto_16077 ) ( ON-TABLE ?auto_16076 ) ( ON ?auto_16078 ?auto_16079 ) ( CLEAR ?auto_16078 ) ( HOLDING ?auto_16075 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16075 ?auto_16078 )
      ( MAKE-1PILE ?auto_16075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16080 - BLOCK
    )
    :vars
    (
      ?auto_16082 - BLOCK
      ?auto_16083 - BLOCK
      ?auto_16084 - BLOCK
      ?auto_16081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16080 ?auto_16082 ) ) ( not ( = ?auto_16080 ?auto_16083 ) ) ( not ( = ?auto_16080 ?auto_16084 ) ) ( not ( = ?auto_16082 ?auto_16083 ) ) ( not ( = ?auto_16082 ?auto_16084 ) ) ( not ( = ?auto_16083 ?auto_16084 ) ) ( ON ?auto_16084 ?auto_16081 ) ( not ( = ?auto_16080 ?auto_16081 ) ) ( not ( = ?auto_16082 ?auto_16081 ) ) ( not ( = ?auto_16083 ?auto_16081 ) ) ( not ( = ?auto_16084 ?auto_16081 ) ) ( ON ?auto_16083 ?auto_16084 ) ( ON-TABLE ?auto_16081 ) ( ON ?auto_16082 ?auto_16083 ) ( ON ?auto_16080 ?auto_16082 ) ( CLEAR ?auto_16080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16081 ?auto_16084 ?auto_16083 ?auto_16082 )
      ( MAKE-1PILE ?auto_16080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16088 - BLOCK
      ?auto_16089 - BLOCK
      ?auto_16090 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16090 ) ( CLEAR ?auto_16089 ) ( ON-TABLE ?auto_16088 ) ( ON ?auto_16089 ?auto_16088 ) ( not ( = ?auto_16088 ?auto_16089 ) ) ( not ( = ?auto_16088 ?auto_16090 ) ) ( not ( = ?auto_16089 ?auto_16090 ) ) )
    :subtasks
    ( ( !STACK ?auto_16090 ?auto_16089 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16091 - BLOCK
      ?auto_16092 - BLOCK
      ?auto_16093 - BLOCK
    )
    :vars
    (
      ?auto_16094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16092 ) ( ON-TABLE ?auto_16091 ) ( ON ?auto_16092 ?auto_16091 ) ( not ( = ?auto_16091 ?auto_16092 ) ) ( not ( = ?auto_16091 ?auto_16093 ) ) ( not ( = ?auto_16092 ?auto_16093 ) ) ( ON ?auto_16093 ?auto_16094 ) ( CLEAR ?auto_16093 ) ( HAND-EMPTY ) ( not ( = ?auto_16091 ?auto_16094 ) ) ( not ( = ?auto_16092 ?auto_16094 ) ) ( not ( = ?auto_16093 ?auto_16094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16093 ?auto_16094 )
      ( MAKE-3PILE ?auto_16091 ?auto_16092 ?auto_16093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16095 - BLOCK
      ?auto_16096 - BLOCK
      ?auto_16097 - BLOCK
    )
    :vars
    (
      ?auto_16098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16095 ) ( not ( = ?auto_16095 ?auto_16096 ) ) ( not ( = ?auto_16095 ?auto_16097 ) ) ( not ( = ?auto_16096 ?auto_16097 ) ) ( ON ?auto_16097 ?auto_16098 ) ( CLEAR ?auto_16097 ) ( not ( = ?auto_16095 ?auto_16098 ) ) ( not ( = ?auto_16096 ?auto_16098 ) ) ( not ( = ?auto_16097 ?auto_16098 ) ) ( HOLDING ?auto_16096 ) ( CLEAR ?auto_16095 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16095 ?auto_16096 )
      ( MAKE-3PILE ?auto_16095 ?auto_16096 ?auto_16097 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16099 - BLOCK
      ?auto_16100 - BLOCK
      ?auto_16101 - BLOCK
    )
    :vars
    (
      ?auto_16102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16099 ) ( not ( = ?auto_16099 ?auto_16100 ) ) ( not ( = ?auto_16099 ?auto_16101 ) ) ( not ( = ?auto_16100 ?auto_16101 ) ) ( ON ?auto_16101 ?auto_16102 ) ( not ( = ?auto_16099 ?auto_16102 ) ) ( not ( = ?auto_16100 ?auto_16102 ) ) ( not ( = ?auto_16101 ?auto_16102 ) ) ( CLEAR ?auto_16099 ) ( ON ?auto_16100 ?auto_16101 ) ( CLEAR ?auto_16100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16102 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16102 ?auto_16101 )
      ( MAKE-3PILE ?auto_16099 ?auto_16100 ?auto_16101 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16103 - BLOCK
      ?auto_16104 - BLOCK
      ?auto_16105 - BLOCK
    )
    :vars
    (
      ?auto_16106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16103 ?auto_16104 ) ) ( not ( = ?auto_16103 ?auto_16105 ) ) ( not ( = ?auto_16104 ?auto_16105 ) ) ( ON ?auto_16105 ?auto_16106 ) ( not ( = ?auto_16103 ?auto_16106 ) ) ( not ( = ?auto_16104 ?auto_16106 ) ) ( not ( = ?auto_16105 ?auto_16106 ) ) ( ON ?auto_16104 ?auto_16105 ) ( CLEAR ?auto_16104 ) ( ON-TABLE ?auto_16106 ) ( HOLDING ?auto_16103 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16103 )
      ( MAKE-3PILE ?auto_16103 ?auto_16104 ?auto_16105 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16107 - BLOCK
      ?auto_16108 - BLOCK
      ?auto_16109 - BLOCK
    )
    :vars
    (
      ?auto_16110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16107 ?auto_16108 ) ) ( not ( = ?auto_16107 ?auto_16109 ) ) ( not ( = ?auto_16108 ?auto_16109 ) ) ( ON ?auto_16109 ?auto_16110 ) ( not ( = ?auto_16107 ?auto_16110 ) ) ( not ( = ?auto_16108 ?auto_16110 ) ) ( not ( = ?auto_16109 ?auto_16110 ) ) ( ON ?auto_16108 ?auto_16109 ) ( ON-TABLE ?auto_16110 ) ( ON ?auto_16107 ?auto_16108 ) ( CLEAR ?auto_16107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16110 ?auto_16109 ?auto_16108 )
      ( MAKE-3PILE ?auto_16107 ?auto_16108 ?auto_16109 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16111 - BLOCK
      ?auto_16112 - BLOCK
      ?auto_16113 - BLOCK
    )
    :vars
    (
      ?auto_16114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16111 ?auto_16112 ) ) ( not ( = ?auto_16111 ?auto_16113 ) ) ( not ( = ?auto_16112 ?auto_16113 ) ) ( ON ?auto_16113 ?auto_16114 ) ( not ( = ?auto_16111 ?auto_16114 ) ) ( not ( = ?auto_16112 ?auto_16114 ) ) ( not ( = ?auto_16113 ?auto_16114 ) ) ( ON ?auto_16112 ?auto_16113 ) ( ON-TABLE ?auto_16114 ) ( HOLDING ?auto_16111 ) ( CLEAR ?auto_16112 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16114 ?auto_16113 ?auto_16112 ?auto_16111 )
      ( MAKE-3PILE ?auto_16111 ?auto_16112 ?auto_16113 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16115 - BLOCK
      ?auto_16116 - BLOCK
      ?auto_16117 - BLOCK
    )
    :vars
    (
      ?auto_16118 - BLOCK
      ?auto_16119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16115 ?auto_16116 ) ) ( not ( = ?auto_16115 ?auto_16117 ) ) ( not ( = ?auto_16116 ?auto_16117 ) ) ( ON ?auto_16117 ?auto_16118 ) ( not ( = ?auto_16115 ?auto_16118 ) ) ( not ( = ?auto_16116 ?auto_16118 ) ) ( not ( = ?auto_16117 ?auto_16118 ) ) ( ON ?auto_16116 ?auto_16117 ) ( ON-TABLE ?auto_16118 ) ( CLEAR ?auto_16116 ) ( ON ?auto_16115 ?auto_16119 ) ( CLEAR ?auto_16115 ) ( HAND-EMPTY ) ( not ( = ?auto_16115 ?auto_16119 ) ) ( not ( = ?auto_16116 ?auto_16119 ) ) ( not ( = ?auto_16117 ?auto_16119 ) ) ( not ( = ?auto_16118 ?auto_16119 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16115 ?auto_16119 )
      ( MAKE-3PILE ?auto_16115 ?auto_16116 ?auto_16117 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16120 - BLOCK
      ?auto_16121 - BLOCK
      ?auto_16122 - BLOCK
    )
    :vars
    (
      ?auto_16124 - BLOCK
      ?auto_16123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16120 ?auto_16121 ) ) ( not ( = ?auto_16120 ?auto_16122 ) ) ( not ( = ?auto_16121 ?auto_16122 ) ) ( ON ?auto_16122 ?auto_16124 ) ( not ( = ?auto_16120 ?auto_16124 ) ) ( not ( = ?auto_16121 ?auto_16124 ) ) ( not ( = ?auto_16122 ?auto_16124 ) ) ( ON-TABLE ?auto_16124 ) ( ON ?auto_16120 ?auto_16123 ) ( CLEAR ?auto_16120 ) ( not ( = ?auto_16120 ?auto_16123 ) ) ( not ( = ?auto_16121 ?auto_16123 ) ) ( not ( = ?auto_16122 ?auto_16123 ) ) ( not ( = ?auto_16124 ?auto_16123 ) ) ( HOLDING ?auto_16121 ) ( CLEAR ?auto_16122 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16124 ?auto_16122 ?auto_16121 )
      ( MAKE-3PILE ?auto_16120 ?auto_16121 ?auto_16122 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16125 - BLOCK
      ?auto_16126 - BLOCK
      ?auto_16127 - BLOCK
    )
    :vars
    (
      ?auto_16128 - BLOCK
      ?auto_16129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16125 ?auto_16126 ) ) ( not ( = ?auto_16125 ?auto_16127 ) ) ( not ( = ?auto_16126 ?auto_16127 ) ) ( ON ?auto_16127 ?auto_16128 ) ( not ( = ?auto_16125 ?auto_16128 ) ) ( not ( = ?auto_16126 ?auto_16128 ) ) ( not ( = ?auto_16127 ?auto_16128 ) ) ( ON-TABLE ?auto_16128 ) ( ON ?auto_16125 ?auto_16129 ) ( not ( = ?auto_16125 ?auto_16129 ) ) ( not ( = ?auto_16126 ?auto_16129 ) ) ( not ( = ?auto_16127 ?auto_16129 ) ) ( not ( = ?auto_16128 ?auto_16129 ) ) ( CLEAR ?auto_16127 ) ( ON ?auto_16126 ?auto_16125 ) ( CLEAR ?auto_16126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16129 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16129 ?auto_16125 )
      ( MAKE-3PILE ?auto_16125 ?auto_16126 ?auto_16127 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16130 - BLOCK
      ?auto_16131 - BLOCK
      ?auto_16132 - BLOCK
    )
    :vars
    (
      ?auto_16133 - BLOCK
      ?auto_16134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16130 ?auto_16131 ) ) ( not ( = ?auto_16130 ?auto_16132 ) ) ( not ( = ?auto_16131 ?auto_16132 ) ) ( not ( = ?auto_16130 ?auto_16133 ) ) ( not ( = ?auto_16131 ?auto_16133 ) ) ( not ( = ?auto_16132 ?auto_16133 ) ) ( ON-TABLE ?auto_16133 ) ( ON ?auto_16130 ?auto_16134 ) ( not ( = ?auto_16130 ?auto_16134 ) ) ( not ( = ?auto_16131 ?auto_16134 ) ) ( not ( = ?auto_16132 ?auto_16134 ) ) ( not ( = ?auto_16133 ?auto_16134 ) ) ( ON ?auto_16131 ?auto_16130 ) ( CLEAR ?auto_16131 ) ( ON-TABLE ?auto_16134 ) ( HOLDING ?auto_16132 ) ( CLEAR ?auto_16133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16133 ?auto_16132 )
      ( MAKE-3PILE ?auto_16130 ?auto_16131 ?auto_16132 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16135 - BLOCK
      ?auto_16136 - BLOCK
      ?auto_16137 - BLOCK
    )
    :vars
    (
      ?auto_16139 - BLOCK
      ?auto_16138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16135 ?auto_16136 ) ) ( not ( = ?auto_16135 ?auto_16137 ) ) ( not ( = ?auto_16136 ?auto_16137 ) ) ( not ( = ?auto_16135 ?auto_16139 ) ) ( not ( = ?auto_16136 ?auto_16139 ) ) ( not ( = ?auto_16137 ?auto_16139 ) ) ( ON-TABLE ?auto_16139 ) ( ON ?auto_16135 ?auto_16138 ) ( not ( = ?auto_16135 ?auto_16138 ) ) ( not ( = ?auto_16136 ?auto_16138 ) ) ( not ( = ?auto_16137 ?auto_16138 ) ) ( not ( = ?auto_16139 ?auto_16138 ) ) ( ON ?auto_16136 ?auto_16135 ) ( ON-TABLE ?auto_16138 ) ( CLEAR ?auto_16139 ) ( ON ?auto_16137 ?auto_16136 ) ( CLEAR ?auto_16137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16138 ?auto_16135 ?auto_16136 )
      ( MAKE-3PILE ?auto_16135 ?auto_16136 ?auto_16137 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16140 - BLOCK
      ?auto_16141 - BLOCK
      ?auto_16142 - BLOCK
    )
    :vars
    (
      ?auto_16143 - BLOCK
      ?auto_16144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16140 ?auto_16141 ) ) ( not ( = ?auto_16140 ?auto_16142 ) ) ( not ( = ?auto_16141 ?auto_16142 ) ) ( not ( = ?auto_16140 ?auto_16143 ) ) ( not ( = ?auto_16141 ?auto_16143 ) ) ( not ( = ?auto_16142 ?auto_16143 ) ) ( ON ?auto_16140 ?auto_16144 ) ( not ( = ?auto_16140 ?auto_16144 ) ) ( not ( = ?auto_16141 ?auto_16144 ) ) ( not ( = ?auto_16142 ?auto_16144 ) ) ( not ( = ?auto_16143 ?auto_16144 ) ) ( ON ?auto_16141 ?auto_16140 ) ( ON-TABLE ?auto_16144 ) ( ON ?auto_16142 ?auto_16141 ) ( CLEAR ?auto_16142 ) ( HOLDING ?auto_16143 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16143 )
      ( MAKE-3PILE ?auto_16140 ?auto_16141 ?auto_16142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16145 - BLOCK
      ?auto_16146 - BLOCK
      ?auto_16147 - BLOCK
    )
    :vars
    (
      ?auto_16149 - BLOCK
      ?auto_16148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16145 ?auto_16146 ) ) ( not ( = ?auto_16145 ?auto_16147 ) ) ( not ( = ?auto_16146 ?auto_16147 ) ) ( not ( = ?auto_16145 ?auto_16149 ) ) ( not ( = ?auto_16146 ?auto_16149 ) ) ( not ( = ?auto_16147 ?auto_16149 ) ) ( ON ?auto_16145 ?auto_16148 ) ( not ( = ?auto_16145 ?auto_16148 ) ) ( not ( = ?auto_16146 ?auto_16148 ) ) ( not ( = ?auto_16147 ?auto_16148 ) ) ( not ( = ?auto_16149 ?auto_16148 ) ) ( ON ?auto_16146 ?auto_16145 ) ( ON-TABLE ?auto_16148 ) ( ON ?auto_16147 ?auto_16146 ) ( ON ?auto_16149 ?auto_16147 ) ( CLEAR ?auto_16149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16148 ?auto_16145 ?auto_16146 ?auto_16147 )
      ( MAKE-3PILE ?auto_16145 ?auto_16146 ?auto_16147 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16154 - BLOCK
      ?auto_16155 - BLOCK
      ?auto_16156 - BLOCK
      ?auto_16157 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16157 ) ( CLEAR ?auto_16156 ) ( ON-TABLE ?auto_16154 ) ( ON ?auto_16155 ?auto_16154 ) ( ON ?auto_16156 ?auto_16155 ) ( not ( = ?auto_16154 ?auto_16155 ) ) ( not ( = ?auto_16154 ?auto_16156 ) ) ( not ( = ?auto_16154 ?auto_16157 ) ) ( not ( = ?auto_16155 ?auto_16156 ) ) ( not ( = ?auto_16155 ?auto_16157 ) ) ( not ( = ?auto_16156 ?auto_16157 ) ) )
    :subtasks
    ( ( !STACK ?auto_16157 ?auto_16156 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16158 - BLOCK
      ?auto_16159 - BLOCK
      ?auto_16160 - BLOCK
      ?auto_16161 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16160 ) ( ON-TABLE ?auto_16158 ) ( ON ?auto_16159 ?auto_16158 ) ( ON ?auto_16160 ?auto_16159 ) ( not ( = ?auto_16158 ?auto_16159 ) ) ( not ( = ?auto_16158 ?auto_16160 ) ) ( not ( = ?auto_16158 ?auto_16161 ) ) ( not ( = ?auto_16159 ?auto_16160 ) ) ( not ( = ?auto_16159 ?auto_16161 ) ) ( not ( = ?auto_16160 ?auto_16161 ) ) ( ON-TABLE ?auto_16161 ) ( CLEAR ?auto_16161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_16161 )
      ( MAKE-4PILE ?auto_16158 ?auto_16159 ?auto_16160 ?auto_16161 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16162 - BLOCK
      ?auto_16163 - BLOCK
      ?auto_16164 - BLOCK
      ?auto_16165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16162 ) ( ON ?auto_16163 ?auto_16162 ) ( not ( = ?auto_16162 ?auto_16163 ) ) ( not ( = ?auto_16162 ?auto_16164 ) ) ( not ( = ?auto_16162 ?auto_16165 ) ) ( not ( = ?auto_16163 ?auto_16164 ) ) ( not ( = ?auto_16163 ?auto_16165 ) ) ( not ( = ?auto_16164 ?auto_16165 ) ) ( ON-TABLE ?auto_16165 ) ( CLEAR ?auto_16165 ) ( HOLDING ?auto_16164 ) ( CLEAR ?auto_16163 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16162 ?auto_16163 ?auto_16164 )
      ( MAKE-4PILE ?auto_16162 ?auto_16163 ?auto_16164 ?auto_16165 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16166 - BLOCK
      ?auto_16167 - BLOCK
      ?auto_16168 - BLOCK
      ?auto_16169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16166 ) ( ON ?auto_16167 ?auto_16166 ) ( not ( = ?auto_16166 ?auto_16167 ) ) ( not ( = ?auto_16166 ?auto_16168 ) ) ( not ( = ?auto_16166 ?auto_16169 ) ) ( not ( = ?auto_16167 ?auto_16168 ) ) ( not ( = ?auto_16167 ?auto_16169 ) ) ( not ( = ?auto_16168 ?auto_16169 ) ) ( ON-TABLE ?auto_16169 ) ( CLEAR ?auto_16167 ) ( ON ?auto_16168 ?auto_16169 ) ( CLEAR ?auto_16168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16169 )
      ( MAKE-4PILE ?auto_16166 ?auto_16167 ?auto_16168 ?auto_16169 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16170 - BLOCK
      ?auto_16171 - BLOCK
      ?auto_16172 - BLOCK
      ?auto_16173 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16170 ) ( not ( = ?auto_16170 ?auto_16171 ) ) ( not ( = ?auto_16170 ?auto_16172 ) ) ( not ( = ?auto_16170 ?auto_16173 ) ) ( not ( = ?auto_16171 ?auto_16172 ) ) ( not ( = ?auto_16171 ?auto_16173 ) ) ( not ( = ?auto_16172 ?auto_16173 ) ) ( ON-TABLE ?auto_16173 ) ( ON ?auto_16172 ?auto_16173 ) ( CLEAR ?auto_16172 ) ( HOLDING ?auto_16171 ) ( CLEAR ?auto_16170 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16170 ?auto_16171 )
      ( MAKE-4PILE ?auto_16170 ?auto_16171 ?auto_16172 ?auto_16173 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16174 - BLOCK
      ?auto_16175 - BLOCK
      ?auto_16176 - BLOCK
      ?auto_16177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16174 ) ( not ( = ?auto_16174 ?auto_16175 ) ) ( not ( = ?auto_16174 ?auto_16176 ) ) ( not ( = ?auto_16174 ?auto_16177 ) ) ( not ( = ?auto_16175 ?auto_16176 ) ) ( not ( = ?auto_16175 ?auto_16177 ) ) ( not ( = ?auto_16176 ?auto_16177 ) ) ( ON-TABLE ?auto_16177 ) ( ON ?auto_16176 ?auto_16177 ) ( CLEAR ?auto_16174 ) ( ON ?auto_16175 ?auto_16176 ) ( CLEAR ?auto_16175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16177 ?auto_16176 )
      ( MAKE-4PILE ?auto_16174 ?auto_16175 ?auto_16176 ?auto_16177 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16178 - BLOCK
      ?auto_16179 - BLOCK
      ?auto_16180 - BLOCK
      ?auto_16181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16178 ?auto_16179 ) ) ( not ( = ?auto_16178 ?auto_16180 ) ) ( not ( = ?auto_16178 ?auto_16181 ) ) ( not ( = ?auto_16179 ?auto_16180 ) ) ( not ( = ?auto_16179 ?auto_16181 ) ) ( not ( = ?auto_16180 ?auto_16181 ) ) ( ON-TABLE ?auto_16181 ) ( ON ?auto_16180 ?auto_16181 ) ( ON ?auto_16179 ?auto_16180 ) ( CLEAR ?auto_16179 ) ( HOLDING ?auto_16178 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16178 )
      ( MAKE-4PILE ?auto_16178 ?auto_16179 ?auto_16180 ?auto_16181 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16182 - BLOCK
      ?auto_16183 - BLOCK
      ?auto_16184 - BLOCK
      ?auto_16185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16182 ?auto_16183 ) ) ( not ( = ?auto_16182 ?auto_16184 ) ) ( not ( = ?auto_16182 ?auto_16185 ) ) ( not ( = ?auto_16183 ?auto_16184 ) ) ( not ( = ?auto_16183 ?auto_16185 ) ) ( not ( = ?auto_16184 ?auto_16185 ) ) ( ON-TABLE ?auto_16185 ) ( ON ?auto_16184 ?auto_16185 ) ( ON ?auto_16183 ?auto_16184 ) ( ON ?auto_16182 ?auto_16183 ) ( CLEAR ?auto_16182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16185 ?auto_16184 ?auto_16183 )
      ( MAKE-4PILE ?auto_16182 ?auto_16183 ?auto_16184 ?auto_16185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16186 - BLOCK
      ?auto_16187 - BLOCK
      ?auto_16188 - BLOCK
      ?auto_16189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16186 ?auto_16187 ) ) ( not ( = ?auto_16186 ?auto_16188 ) ) ( not ( = ?auto_16186 ?auto_16189 ) ) ( not ( = ?auto_16187 ?auto_16188 ) ) ( not ( = ?auto_16187 ?auto_16189 ) ) ( not ( = ?auto_16188 ?auto_16189 ) ) ( ON-TABLE ?auto_16189 ) ( ON ?auto_16188 ?auto_16189 ) ( ON ?auto_16187 ?auto_16188 ) ( HOLDING ?auto_16186 ) ( CLEAR ?auto_16187 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16189 ?auto_16188 ?auto_16187 ?auto_16186 )
      ( MAKE-4PILE ?auto_16186 ?auto_16187 ?auto_16188 ?auto_16189 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16190 - BLOCK
      ?auto_16191 - BLOCK
      ?auto_16192 - BLOCK
      ?auto_16193 - BLOCK
    )
    :vars
    (
      ?auto_16194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16190 ?auto_16191 ) ) ( not ( = ?auto_16190 ?auto_16192 ) ) ( not ( = ?auto_16190 ?auto_16193 ) ) ( not ( = ?auto_16191 ?auto_16192 ) ) ( not ( = ?auto_16191 ?auto_16193 ) ) ( not ( = ?auto_16192 ?auto_16193 ) ) ( ON-TABLE ?auto_16193 ) ( ON ?auto_16192 ?auto_16193 ) ( ON ?auto_16191 ?auto_16192 ) ( CLEAR ?auto_16191 ) ( ON ?auto_16190 ?auto_16194 ) ( CLEAR ?auto_16190 ) ( HAND-EMPTY ) ( not ( = ?auto_16190 ?auto_16194 ) ) ( not ( = ?auto_16191 ?auto_16194 ) ) ( not ( = ?auto_16192 ?auto_16194 ) ) ( not ( = ?auto_16193 ?auto_16194 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16190 ?auto_16194 )
      ( MAKE-4PILE ?auto_16190 ?auto_16191 ?auto_16192 ?auto_16193 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16195 - BLOCK
      ?auto_16196 - BLOCK
      ?auto_16197 - BLOCK
      ?auto_16198 - BLOCK
    )
    :vars
    (
      ?auto_16199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16195 ?auto_16196 ) ) ( not ( = ?auto_16195 ?auto_16197 ) ) ( not ( = ?auto_16195 ?auto_16198 ) ) ( not ( = ?auto_16196 ?auto_16197 ) ) ( not ( = ?auto_16196 ?auto_16198 ) ) ( not ( = ?auto_16197 ?auto_16198 ) ) ( ON-TABLE ?auto_16198 ) ( ON ?auto_16197 ?auto_16198 ) ( ON ?auto_16195 ?auto_16199 ) ( CLEAR ?auto_16195 ) ( not ( = ?auto_16195 ?auto_16199 ) ) ( not ( = ?auto_16196 ?auto_16199 ) ) ( not ( = ?auto_16197 ?auto_16199 ) ) ( not ( = ?auto_16198 ?auto_16199 ) ) ( HOLDING ?auto_16196 ) ( CLEAR ?auto_16197 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16198 ?auto_16197 ?auto_16196 )
      ( MAKE-4PILE ?auto_16195 ?auto_16196 ?auto_16197 ?auto_16198 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16200 - BLOCK
      ?auto_16201 - BLOCK
      ?auto_16202 - BLOCK
      ?auto_16203 - BLOCK
    )
    :vars
    (
      ?auto_16204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16200 ?auto_16201 ) ) ( not ( = ?auto_16200 ?auto_16202 ) ) ( not ( = ?auto_16200 ?auto_16203 ) ) ( not ( = ?auto_16201 ?auto_16202 ) ) ( not ( = ?auto_16201 ?auto_16203 ) ) ( not ( = ?auto_16202 ?auto_16203 ) ) ( ON-TABLE ?auto_16203 ) ( ON ?auto_16202 ?auto_16203 ) ( ON ?auto_16200 ?auto_16204 ) ( not ( = ?auto_16200 ?auto_16204 ) ) ( not ( = ?auto_16201 ?auto_16204 ) ) ( not ( = ?auto_16202 ?auto_16204 ) ) ( not ( = ?auto_16203 ?auto_16204 ) ) ( CLEAR ?auto_16202 ) ( ON ?auto_16201 ?auto_16200 ) ( CLEAR ?auto_16201 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16204 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16204 ?auto_16200 )
      ( MAKE-4PILE ?auto_16200 ?auto_16201 ?auto_16202 ?auto_16203 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16205 - BLOCK
      ?auto_16206 - BLOCK
      ?auto_16207 - BLOCK
      ?auto_16208 - BLOCK
    )
    :vars
    (
      ?auto_16209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16205 ?auto_16206 ) ) ( not ( = ?auto_16205 ?auto_16207 ) ) ( not ( = ?auto_16205 ?auto_16208 ) ) ( not ( = ?auto_16206 ?auto_16207 ) ) ( not ( = ?auto_16206 ?auto_16208 ) ) ( not ( = ?auto_16207 ?auto_16208 ) ) ( ON-TABLE ?auto_16208 ) ( ON ?auto_16205 ?auto_16209 ) ( not ( = ?auto_16205 ?auto_16209 ) ) ( not ( = ?auto_16206 ?auto_16209 ) ) ( not ( = ?auto_16207 ?auto_16209 ) ) ( not ( = ?auto_16208 ?auto_16209 ) ) ( ON ?auto_16206 ?auto_16205 ) ( CLEAR ?auto_16206 ) ( ON-TABLE ?auto_16209 ) ( HOLDING ?auto_16207 ) ( CLEAR ?auto_16208 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16208 ?auto_16207 )
      ( MAKE-4PILE ?auto_16205 ?auto_16206 ?auto_16207 ?auto_16208 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16210 - BLOCK
      ?auto_16211 - BLOCK
      ?auto_16212 - BLOCK
      ?auto_16213 - BLOCK
    )
    :vars
    (
      ?auto_16214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16210 ?auto_16211 ) ) ( not ( = ?auto_16210 ?auto_16212 ) ) ( not ( = ?auto_16210 ?auto_16213 ) ) ( not ( = ?auto_16211 ?auto_16212 ) ) ( not ( = ?auto_16211 ?auto_16213 ) ) ( not ( = ?auto_16212 ?auto_16213 ) ) ( ON-TABLE ?auto_16213 ) ( ON ?auto_16210 ?auto_16214 ) ( not ( = ?auto_16210 ?auto_16214 ) ) ( not ( = ?auto_16211 ?auto_16214 ) ) ( not ( = ?auto_16212 ?auto_16214 ) ) ( not ( = ?auto_16213 ?auto_16214 ) ) ( ON ?auto_16211 ?auto_16210 ) ( ON-TABLE ?auto_16214 ) ( CLEAR ?auto_16213 ) ( ON ?auto_16212 ?auto_16211 ) ( CLEAR ?auto_16212 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16214 ?auto_16210 ?auto_16211 )
      ( MAKE-4PILE ?auto_16210 ?auto_16211 ?auto_16212 ?auto_16213 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16215 - BLOCK
      ?auto_16216 - BLOCK
      ?auto_16217 - BLOCK
      ?auto_16218 - BLOCK
    )
    :vars
    (
      ?auto_16219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16215 ?auto_16216 ) ) ( not ( = ?auto_16215 ?auto_16217 ) ) ( not ( = ?auto_16215 ?auto_16218 ) ) ( not ( = ?auto_16216 ?auto_16217 ) ) ( not ( = ?auto_16216 ?auto_16218 ) ) ( not ( = ?auto_16217 ?auto_16218 ) ) ( ON ?auto_16215 ?auto_16219 ) ( not ( = ?auto_16215 ?auto_16219 ) ) ( not ( = ?auto_16216 ?auto_16219 ) ) ( not ( = ?auto_16217 ?auto_16219 ) ) ( not ( = ?auto_16218 ?auto_16219 ) ) ( ON ?auto_16216 ?auto_16215 ) ( ON-TABLE ?auto_16219 ) ( ON ?auto_16217 ?auto_16216 ) ( CLEAR ?auto_16217 ) ( HOLDING ?auto_16218 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16218 )
      ( MAKE-4PILE ?auto_16215 ?auto_16216 ?auto_16217 ?auto_16218 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16220 - BLOCK
      ?auto_16221 - BLOCK
      ?auto_16222 - BLOCK
      ?auto_16223 - BLOCK
    )
    :vars
    (
      ?auto_16224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16220 ?auto_16221 ) ) ( not ( = ?auto_16220 ?auto_16222 ) ) ( not ( = ?auto_16220 ?auto_16223 ) ) ( not ( = ?auto_16221 ?auto_16222 ) ) ( not ( = ?auto_16221 ?auto_16223 ) ) ( not ( = ?auto_16222 ?auto_16223 ) ) ( ON ?auto_16220 ?auto_16224 ) ( not ( = ?auto_16220 ?auto_16224 ) ) ( not ( = ?auto_16221 ?auto_16224 ) ) ( not ( = ?auto_16222 ?auto_16224 ) ) ( not ( = ?auto_16223 ?auto_16224 ) ) ( ON ?auto_16221 ?auto_16220 ) ( ON-TABLE ?auto_16224 ) ( ON ?auto_16222 ?auto_16221 ) ( ON ?auto_16223 ?auto_16222 ) ( CLEAR ?auto_16223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16224 ?auto_16220 ?auto_16221 ?auto_16222 )
      ( MAKE-4PILE ?auto_16220 ?auto_16221 ?auto_16222 ?auto_16223 ) )
  )

)

