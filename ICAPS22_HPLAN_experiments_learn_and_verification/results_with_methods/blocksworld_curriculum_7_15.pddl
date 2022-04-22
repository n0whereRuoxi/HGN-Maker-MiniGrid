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
      ?auto_27661 - BLOCK
    )
    :vars
    (
      ?auto_27662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27661 ?auto_27662 ) ( CLEAR ?auto_27661 ) ( HAND-EMPTY ) ( not ( = ?auto_27661 ?auto_27662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27661 ?auto_27662 )
      ( !PUTDOWN ?auto_27661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27664 - BLOCK
    )
    :vars
    (
      ?auto_27665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27664 ?auto_27665 ) ( CLEAR ?auto_27664 ) ( HAND-EMPTY ) ( not ( = ?auto_27664 ?auto_27665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27664 ?auto_27665 )
      ( !PUTDOWN ?auto_27664 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27668 - BLOCK
      ?auto_27669 - BLOCK
    )
    :vars
    (
      ?auto_27670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27668 ) ( ON ?auto_27669 ?auto_27670 ) ( CLEAR ?auto_27669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27668 ) ( not ( = ?auto_27668 ?auto_27669 ) ) ( not ( = ?auto_27668 ?auto_27670 ) ) ( not ( = ?auto_27669 ?auto_27670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27669 ?auto_27670 )
      ( !STACK ?auto_27669 ?auto_27668 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27673 - BLOCK
      ?auto_27674 - BLOCK
    )
    :vars
    (
      ?auto_27675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27673 ) ( ON ?auto_27674 ?auto_27675 ) ( CLEAR ?auto_27674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27673 ) ( not ( = ?auto_27673 ?auto_27674 ) ) ( not ( = ?auto_27673 ?auto_27675 ) ) ( not ( = ?auto_27674 ?auto_27675 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27674 ?auto_27675 )
      ( !STACK ?auto_27674 ?auto_27673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27678 - BLOCK
      ?auto_27679 - BLOCK
    )
    :vars
    (
      ?auto_27680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27679 ?auto_27680 ) ( not ( = ?auto_27678 ?auto_27679 ) ) ( not ( = ?auto_27678 ?auto_27680 ) ) ( not ( = ?auto_27679 ?auto_27680 ) ) ( ON ?auto_27678 ?auto_27679 ) ( CLEAR ?auto_27678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27678 )
      ( MAKE-2PILE ?auto_27678 ?auto_27679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27683 - BLOCK
      ?auto_27684 - BLOCK
    )
    :vars
    (
      ?auto_27685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27684 ?auto_27685 ) ( not ( = ?auto_27683 ?auto_27684 ) ) ( not ( = ?auto_27683 ?auto_27685 ) ) ( not ( = ?auto_27684 ?auto_27685 ) ) ( ON ?auto_27683 ?auto_27684 ) ( CLEAR ?auto_27683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27683 )
      ( MAKE-2PILE ?auto_27683 ?auto_27684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27689 - BLOCK
      ?auto_27690 - BLOCK
      ?auto_27691 - BLOCK
    )
    :vars
    (
      ?auto_27692 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27690 ) ( ON ?auto_27691 ?auto_27692 ) ( CLEAR ?auto_27691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27689 ) ( ON ?auto_27690 ?auto_27689 ) ( not ( = ?auto_27689 ?auto_27690 ) ) ( not ( = ?auto_27689 ?auto_27691 ) ) ( not ( = ?auto_27689 ?auto_27692 ) ) ( not ( = ?auto_27690 ?auto_27691 ) ) ( not ( = ?auto_27690 ?auto_27692 ) ) ( not ( = ?auto_27691 ?auto_27692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27691 ?auto_27692 )
      ( !STACK ?auto_27691 ?auto_27690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27696 - BLOCK
      ?auto_27697 - BLOCK
      ?auto_27698 - BLOCK
    )
    :vars
    (
      ?auto_27699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27697 ) ( ON ?auto_27698 ?auto_27699 ) ( CLEAR ?auto_27698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27696 ) ( ON ?auto_27697 ?auto_27696 ) ( not ( = ?auto_27696 ?auto_27697 ) ) ( not ( = ?auto_27696 ?auto_27698 ) ) ( not ( = ?auto_27696 ?auto_27699 ) ) ( not ( = ?auto_27697 ?auto_27698 ) ) ( not ( = ?auto_27697 ?auto_27699 ) ) ( not ( = ?auto_27698 ?auto_27699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27698 ?auto_27699 )
      ( !STACK ?auto_27698 ?auto_27697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27703 - BLOCK
      ?auto_27704 - BLOCK
      ?auto_27705 - BLOCK
    )
    :vars
    (
      ?auto_27706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27705 ?auto_27706 ) ( ON-TABLE ?auto_27703 ) ( not ( = ?auto_27703 ?auto_27704 ) ) ( not ( = ?auto_27703 ?auto_27705 ) ) ( not ( = ?auto_27703 ?auto_27706 ) ) ( not ( = ?auto_27704 ?auto_27705 ) ) ( not ( = ?auto_27704 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( CLEAR ?auto_27703 ) ( ON ?auto_27704 ?auto_27705 ) ( CLEAR ?auto_27704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27703 ?auto_27704 )
      ( MAKE-3PILE ?auto_27703 ?auto_27704 ?auto_27705 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27710 - BLOCK
      ?auto_27711 - BLOCK
      ?auto_27712 - BLOCK
    )
    :vars
    (
      ?auto_27713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27712 ?auto_27713 ) ( ON-TABLE ?auto_27710 ) ( not ( = ?auto_27710 ?auto_27711 ) ) ( not ( = ?auto_27710 ?auto_27712 ) ) ( not ( = ?auto_27710 ?auto_27713 ) ) ( not ( = ?auto_27711 ?auto_27712 ) ) ( not ( = ?auto_27711 ?auto_27713 ) ) ( not ( = ?auto_27712 ?auto_27713 ) ) ( CLEAR ?auto_27710 ) ( ON ?auto_27711 ?auto_27712 ) ( CLEAR ?auto_27711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27710 ?auto_27711 )
      ( MAKE-3PILE ?auto_27710 ?auto_27711 ?auto_27712 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27717 - BLOCK
      ?auto_27718 - BLOCK
      ?auto_27719 - BLOCK
    )
    :vars
    (
      ?auto_27720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27719 ?auto_27720 ) ( not ( = ?auto_27717 ?auto_27718 ) ) ( not ( = ?auto_27717 ?auto_27719 ) ) ( not ( = ?auto_27717 ?auto_27720 ) ) ( not ( = ?auto_27718 ?auto_27719 ) ) ( not ( = ?auto_27718 ?auto_27720 ) ) ( not ( = ?auto_27719 ?auto_27720 ) ) ( ON ?auto_27718 ?auto_27719 ) ( ON ?auto_27717 ?auto_27718 ) ( CLEAR ?auto_27717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27717 )
      ( MAKE-3PILE ?auto_27717 ?auto_27718 ?auto_27719 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27724 - BLOCK
      ?auto_27725 - BLOCK
      ?auto_27726 - BLOCK
    )
    :vars
    (
      ?auto_27727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27726 ?auto_27727 ) ( not ( = ?auto_27724 ?auto_27725 ) ) ( not ( = ?auto_27724 ?auto_27726 ) ) ( not ( = ?auto_27724 ?auto_27727 ) ) ( not ( = ?auto_27725 ?auto_27726 ) ) ( not ( = ?auto_27725 ?auto_27727 ) ) ( not ( = ?auto_27726 ?auto_27727 ) ) ( ON ?auto_27725 ?auto_27726 ) ( ON ?auto_27724 ?auto_27725 ) ( CLEAR ?auto_27724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27724 )
      ( MAKE-3PILE ?auto_27724 ?auto_27725 ?auto_27726 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27732 - BLOCK
      ?auto_27733 - BLOCK
      ?auto_27734 - BLOCK
      ?auto_27735 - BLOCK
    )
    :vars
    (
      ?auto_27736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27734 ) ( ON ?auto_27735 ?auto_27736 ) ( CLEAR ?auto_27735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27732 ) ( ON ?auto_27733 ?auto_27732 ) ( ON ?auto_27734 ?auto_27733 ) ( not ( = ?auto_27732 ?auto_27733 ) ) ( not ( = ?auto_27732 ?auto_27734 ) ) ( not ( = ?auto_27732 ?auto_27735 ) ) ( not ( = ?auto_27732 ?auto_27736 ) ) ( not ( = ?auto_27733 ?auto_27734 ) ) ( not ( = ?auto_27733 ?auto_27735 ) ) ( not ( = ?auto_27733 ?auto_27736 ) ) ( not ( = ?auto_27734 ?auto_27735 ) ) ( not ( = ?auto_27734 ?auto_27736 ) ) ( not ( = ?auto_27735 ?auto_27736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27735 ?auto_27736 )
      ( !STACK ?auto_27735 ?auto_27734 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27741 - BLOCK
      ?auto_27742 - BLOCK
      ?auto_27743 - BLOCK
      ?auto_27744 - BLOCK
    )
    :vars
    (
      ?auto_27745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27743 ) ( ON ?auto_27744 ?auto_27745 ) ( CLEAR ?auto_27744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27741 ) ( ON ?auto_27742 ?auto_27741 ) ( ON ?auto_27743 ?auto_27742 ) ( not ( = ?auto_27741 ?auto_27742 ) ) ( not ( = ?auto_27741 ?auto_27743 ) ) ( not ( = ?auto_27741 ?auto_27744 ) ) ( not ( = ?auto_27741 ?auto_27745 ) ) ( not ( = ?auto_27742 ?auto_27743 ) ) ( not ( = ?auto_27742 ?auto_27744 ) ) ( not ( = ?auto_27742 ?auto_27745 ) ) ( not ( = ?auto_27743 ?auto_27744 ) ) ( not ( = ?auto_27743 ?auto_27745 ) ) ( not ( = ?auto_27744 ?auto_27745 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27744 ?auto_27745 )
      ( !STACK ?auto_27744 ?auto_27743 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27750 - BLOCK
      ?auto_27751 - BLOCK
      ?auto_27752 - BLOCK
      ?auto_27753 - BLOCK
    )
    :vars
    (
      ?auto_27754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27753 ?auto_27754 ) ( ON-TABLE ?auto_27750 ) ( ON ?auto_27751 ?auto_27750 ) ( not ( = ?auto_27750 ?auto_27751 ) ) ( not ( = ?auto_27750 ?auto_27752 ) ) ( not ( = ?auto_27750 ?auto_27753 ) ) ( not ( = ?auto_27750 ?auto_27754 ) ) ( not ( = ?auto_27751 ?auto_27752 ) ) ( not ( = ?auto_27751 ?auto_27753 ) ) ( not ( = ?auto_27751 ?auto_27754 ) ) ( not ( = ?auto_27752 ?auto_27753 ) ) ( not ( = ?auto_27752 ?auto_27754 ) ) ( not ( = ?auto_27753 ?auto_27754 ) ) ( CLEAR ?auto_27751 ) ( ON ?auto_27752 ?auto_27753 ) ( CLEAR ?auto_27752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27750 ?auto_27751 ?auto_27752 )
      ( MAKE-4PILE ?auto_27750 ?auto_27751 ?auto_27752 ?auto_27753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27759 - BLOCK
      ?auto_27760 - BLOCK
      ?auto_27761 - BLOCK
      ?auto_27762 - BLOCK
    )
    :vars
    (
      ?auto_27763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27762 ?auto_27763 ) ( ON-TABLE ?auto_27759 ) ( ON ?auto_27760 ?auto_27759 ) ( not ( = ?auto_27759 ?auto_27760 ) ) ( not ( = ?auto_27759 ?auto_27761 ) ) ( not ( = ?auto_27759 ?auto_27762 ) ) ( not ( = ?auto_27759 ?auto_27763 ) ) ( not ( = ?auto_27760 ?auto_27761 ) ) ( not ( = ?auto_27760 ?auto_27762 ) ) ( not ( = ?auto_27760 ?auto_27763 ) ) ( not ( = ?auto_27761 ?auto_27762 ) ) ( not ( = ?auto_27761 ?auto_27763 ) ) ( not ( = ?auto_27762 ?auto_27763 ) ) ( CLEAR ?auto_27760 ) ( ON ?auto_27761 ?auto_27762 ) ( CLEAR ?auto_27761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27759 ?auto_27760 ?auto_27761 )
      ( MAKE-4PILE ?auto_27759 ?auto_27760 ?auto_27761 ?auto_27762 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27768 - BLOCK
      ?auto_27769 - BLOCK
      ?auto_27770 - BLOCK
      ?auto_27771 - BLOCK
    )
    :vars
    (
      ?auto_27772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27771 ?auto_27772 ) ( ON-TABLE ?auto_27768 ) ( not ( = ?auto_27768 ?auto_27769 ) ) ( not ( = ?auto_27768 ?auto_27770 ) ) ( not ( = ?auto_27768 ?auto_27771 ) ) ( not ( = ?auto_27768 ?auto_27772 ) ) ( not ( = ?auto_27769 ?auto_27770 ) ) ( not ( = ?auto_27769 ?auto_27771 ) ) ( not ( = ?auto_27769 ?auto_27772 ) ) ( not ( = ?auto_27770 ?auto_27771 ) ) ( not ( = ?auto_27770 ?auto_27772 ) ) ( not ( = ?auto_27771 ?auto_27772 ) ) ( ON ?auto_27770 ?auto_27771 ) ( CLEAR ?auto_27768 ) ( ON ?auto_27769 ?auto_27770 ) ( CLEAR ?auto_27769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27768 ?auto_27769 )
      ( MAKE-4PILE ?auto_27768 ?auto_27769 ?auto_27770 ?auto_27771 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27777 - BLOCK
      ?auto_27778 - BLOCK
      ?auto_27779 - BLOCK
      ?auto_27780 - BLOCK
    )
    :vars
    (
      ?auto_27781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27780 ?auto_27781 ) ( ON-TABLE ?auto_27777 ) ( not ( = ?auto_27777 ?auto_27778 ) ) ( not ( = ?auto_27777 ?auto_27779 ) ) ( not ( = ?auto_27777 ?auto_27780 ) ) ( not ( = ?auto_27777 ?auto_27781 ) ) ( not ( = ?auto_27778 ?auto_27779 ) ) ( not ( = ?auto_27778 ?auto_27780 ) ) ( not ( = ?auto_27778 ?auto_27781 ) ) ( not ( = ?auto_27779 ?auto_27780 ) ) ( not ( = ?auto_27779 ?auto_27781 ) ) ( not ( = ?auto_27780 ?auto_27781 ) ) ( ON ?auto_27779 ?auto_27780 ) ( CLEAR ?auto_27777 ) ( ON ?auto_27778 ?auto_27779 ) ( CLEAR ?auto_27778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27777 ?auto_27778 )
      ( MAKE-4PILE ?auto_27777 ?auto_27778 ?auto_27779 ?auto_27780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27786 - BLOCK
      ?auto_27787 - BLOCK
      ?auto_27788 - BLOCK
      ?auto_27789 - BLOCK
    )
    :vars
    (
      ?auto_27790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27789 ?auto_27790 ) ( not ( = ?auto_27786 ?auto_27787 ) ) ( not ( = ?auto_27786 ?auto_27788 ) ) ( not ( = ?auto_27786 ?auto_27789 ) ) ( not ( = ?auto_27786 ?auto_27790 ) ) ( not ( = ?auto_27787 ?auto_27788 ) ) ( not ( = ?auto_27787 ?auto_27789 ) ) ( not ( = ?auto_27787 ?auto_27790 ) ) ( not ( = ?auto_27788 ?auto_27789 ) ) ( not ( = ?auto_27788 ?auto_27790 ) ) ( not ( = ?auto_27789 ?auto_27790 ) ) ( ON ?auto_27788 ?auto_27789 ) ( ON ?auto_27787 ?auto_27788 ) ( ON ?auto_27786 ?auto_27787 ) ( CLEAR ?auto_27786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27786 )
      ( MAKE-4PILE ?auto_27786 ?auto_27787 ?auto_27788 ?auto_27789 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27795 - BLOCK
      ?auto_27796 - BLOCK
      ?auto_27797 - BLOCK
      ?auto_27798 - BLOCK
    )
    :vars
    (
      ?auto_27799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27798 ?auto_27799 ) ( not ( = ?auto_27795 ?auto_27796 ) ) ( not ( = ?auto_27795 ?auto_27797 ) ) ( not ( = ?auto_27795 ?auto_27798 ) ) ( not ( = ?auto_27795 ?auto_27799 ) ) ( not ( = ?auto_27796 ?auto_27797 ) ) ( not ( = ?auto_27796 ?auto_27798 ) ) ( not ( = ?auto_27796 ?auto_27799 ) ) ( not ( = ?auto_27797 ?auto_27798 ) ) ( not ( = ?auto_27797 ?auto_27799 ) ) ( not ( = ?auto_27798 ?auto_27799 ) ) ( ON ?auto_27797 ?auto_27798 ) ( ON ?auto_27796 ?auto_27797 ) ( ON ?auto_27795 ?auto_27796 ) ( CLEAR ?auto_27795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27795 )
      ( MAKE-4PILE ?auto_27795 ?auto_27796 ?auto_27797 ?auto_27798 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27805 - BLOCK
      ?auto_27806 - BLOCK
      ?auto_27807 - BLOCK
      ?auto_27808 - BLOCK
      ?auto_27809 - BLOCK
    )
    :vars
    (
      ?auto_27810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27808 ) ( ON ?auto_27809 ?auto_27810 ) ( CLEAR ?auto_27809 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27805 ) ( ON ?auto_27806 ?auto_27805 ) ( ON ?auto_27807 ?auto_27806 ) ( ON ?auto_27808 ?auto_27807 ) ( not ( = ?auto_27805 ?auto_27806 ) ) ( not ( = ?auto_27805 ?auto_27807 ) ) ( not ( = ?auto_27805 ?auto_27808 ) ) ( not ( = ?auto_27805 ?auto_27809 ) ) ( not ( = ?auto_27805 ?auto_27810 ) ) ( not ( = ?auto_27806 ?auto_27807 ) ) ( not ( = ?auto_27806 ?auto_27808 ) ) ( not ( = ?auto_27806 ?auto_27809 ) ) ( not ( = ?auto_27806 ?auto_27810 ) ) ( not ( = ?auto_27807 ?auto_27808 ) ) ( not ( = ?auto_27807 ?auto_27809 ) ) ( not ( = ?auto_27807 ?auto_27810 ) ) ( not ( = ?auto_27808 ?auto_27809 ) ) ( not ( = ?auto_27808 ?auto_27810 ) ) ( not ( = ?auto_27809 ?auto_27810 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27809 ?auto_27810 )
      ( !STACK ?auto_27809 ?auto_27808 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27816 - BLOCK
      ?auto_27817 - BLOCK
      ?auto_27818 - BLOCK
      ?auto_27819 - BLOCK
      ?auto_27820 - BLOCK
    )
    :vars
    (
      ?auto_27821 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27819 ) ( ON ?auto_27820 ?auto_27821 ) ( CLEAR ?auto_27820 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27816 ) ( ON ?auto_27817 ?auto_27816 ) ( ON ?auto_27818 ?auto_27817 ) ( ON ?auto_27819 ?auto_27818 ) ( not ( = ?auto_27816 ?auto_27817 ) ) ( not ( = ?auto_27816 ?auto_27818 ) ) ( not ( = ?auto_27816 ?auto_27819 ) ) ( not ( = ?auto_27816 ?auto_27820 ) ) ( not ( = ?auto_27816 ?auto_27821 ) ) ( not ( = ?auto_27817 ?auto_27818 ) ) ( not ( = ?auto_27817 ?auto_27819 ) ) ( not ( = ?auto_27817 ?auto_27820 ) ) ( not ( = ?auto_27817 ?auto_27821 ) ) ( not ( = ?auto_27818 ?auto_27819 ) ) ( not ( = ?auto_27818 ?auto_27820 ) ) ( not ( = ?auto_27818 ?auto_27821 ) ) ( not ( = ?auto_27819 ?auto_27820 ) ) ( not ( = ?auto_27819 ?auto_27821 ) ) ( not ( = ?auto_27820 ?auto_27821 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27820 ?auto_27821 )
      ( !STACK ?auto_27820 ?auto_27819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27827 - BLOCK
      ?auto_27828 - BLOCK
      ?auto_27829 - BLOCK
      ?auto_27830 - BLOCK
      ?auto_27831 - BLOCK
    )
    :vars
    (
      ?auto_27832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27831 ?auto_27832 ) ( ON-TABLE ?auto_27827 ) ( ON ?auto_27828 ?auto_27827 ) ( ON ?auto_27829 ?auto_27828 ) ( not ( = ?auto_27827 ?auto_27828 ) ) ( not ( = ?auto_27827 ?auto_27829 ) ) ( not ( = ?auto_27827 ?auto_27830 ) ) ( not ( = ?auto_27827 ?auto_27831 ) ) ( not ( = ?auto_27827 ?auto_27832 ) ) ( not ( = ?auto_27828 ?auto_27829 ) ) ( not ( = ?auto_27828 ?auto_27830 ) ) ( not ( = ?auto_27828 ?auto_27831 ) ) ( not ( = ?auto_27828 ?auto_27832 ) ) ( not ( = ?auto_27829 ?auto_27830 ) ) ( not ( = ?auto_27829 ?auto_27831 ) ) ( not ( = ?auto_27829 ?auto_27832 ) ) ( not ( = ?auto_27830 ?auto_27831 ) ) ( not ( = ?auto_27830 ?auto_27832 ) ) ( not ( = ?auto_27831 ?auto_27832 ) ) ( CLEAR ?auto_27829 ) ( ON ?auto_27830 ?auto_27831 ) ( CLEAR ?auto_27830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27827 ?auto_27828 ?auto_27829 ?auto_27830 )
      ( MAKE-5PILE ?auto_27827 ?auto_27828 ?auto_27829 ?auto_27830 ?auto_27831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27838 - BLOCK
      ?auto_27839 - BLOCK
      ?auto_27840 - BLOCK
      ?auto_27841 - BLOCK
      ?auto_27842 - BLOCK
    )
    :vars
    (
      ?auto_27843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27842 ?auto_27843 ) ( ON-TABLE ?auto_27838 ) ( ON ?auto_27839 ?auto_27838 ) ( ON ?auto_27840 ?auto_27839 ) ( not ( = ?auto_27838 ?auto_27839 ) ) ( not ( = ?auto_27838 ?auto_27840 ) ) ( not ( = ?auto_27838 ?auto_27841 ) ) ( not ( = ?auto_27838 ?auto_27842 ) ) ( not ( = ?auto_27838 ?auto_27843 ) ) ( not ( = ?auto_27839 ?auto_27840 ) ) ( not ( = ?auto_27839 ?auto_27841 ) ) ( not ( = ?auto_27839 ?auto_27842 ) ) ( not ( = ?auto_27839 ?auto_27843 ) ) ( not ( = ?auto_27840 ?auto_27841 ) ) ( not ( = ?auto_27840 ?auto_27842 ) ) ( not ( = ?auto_27840 ?auto_27843 ) ) ( not ( = ?auto_27841 ?auto_27842 ) ) ( not ( = ?auto_27841 ?auto_27843 ) ) ( not ( = ?auto_27842 ?auto_27843 ) ) ( CLEAR ?auto_27840 ) ( ON ?auto_27841 ?auto_27842 ) ( CLEAR ?auto_27841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27838 ?auto_27839 ?auto_27840 ?auto_27841 )
      ( MAKE-5PILE ?auto_27838 ?auto_27839 ?auto_27840 ?auto_27841 ?auto_27842 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27849 - BLOCK
      ?auto_27850 - BLOCK
      ?auto_27851 - BLOCK
      ?auto_27852 - BLOCK
      ?auto_27853 - BLOCK
    )
    :vars
    (
      ?auto_27854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27853 ?auto_27854 ) ( ON-TABLE ?auto_27849 ) ( ON ?auto_27850 ?auto_27849 ) ( not ( = ?auto_27849 ?auto_27850 ) ) ( not ( = ?auto_27849 ?auto_27851 ) ) ( not ( = ?auto_27849 ?auto_27852 ) ) ( not ( = ?auto_27849 ?auto_27853 ) ) ( not ( = ?auto_27849 ?auto_27854 ) ) ( not ( = ?auto_27850 ?auto_27851 ) ) ( not ( = ?auto_27850 ?auto_27852 ) ) ( not ( = ?auto_27850 ?auto_27853 ) ) ( not ( = ?auto_27850 ?auto_27854 ) ) ( not ( = ?auto_27851 ?auto_27852 ) ) ( not ( = ?auto_27851 ?auto_27853 ) ) ( not ( = ?auto_27851 ?auto_27854 ) ) ( not ( = ?auto_27852 ?auto_27853 ) ) ( not ( = ?auto_27852 ?auto_27854 ) ) ( not ( = ?auto_27853 ?auto_27854 ) ) ( ON ?auto_27852 ?auto_27853 ) ( CLEAR ?auto_27850 ) ( ON ?auto_27851 ?auto_27852 ) ( CLEAR ?auto_27851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27849 ?auto_27850 ?auto_27851 )
      ( MAKE-5PILE ?auto_27849 ?auto_27850 ?auto_27851 ?auto_27852 ?auto_27853 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27860 - BLOCK
      ?auto_27861 - BLOCK
      ?auto_27862 - BLOCK
      ?auto_27863 - BLOCK
      ?auto_27864 - BLOCK
    )
    :vars
    (
      ?auto_27865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27864 ?auto_27865 ) ( ON-TABLE ?auto_27860 ) ( ON ?auto_27861 ?auto_27860 ) ( not ( = ?auto_27860 ?auto_27861 ) ) ( not ( = ?auto_27860 ?auto_27862 ) ) ( not ( = ?auto_27860 ?auto_27863 ) ) ( not ( = ?auto_27860 ?auto_27864 ) ) ( not ( = ?auto_27860 ?auto_27865 ) ) ( not ( = ?auto_27861 ?auto_27862 ) ) ( not ( = ?auto_27861 ?auto_27863 ) ) ( not ( = ?auto_27861 ?auto_27864 ) ) ( not ( = ?auto_27861 ?auto_27865 ) ) ( not ( = ?auto_27862 ?auto_27863 ) ) ( not ( = ?auto_27862 ?auto_27864 ) ) ( not ( = ?auto_27862 ?auto_27865 ) ) ( not ( = ?auto_27863 ?auto_27864 ) ) ( not ( = ?auto_27863 ?auto_27865 ) ) ( not ( = ?auto_27864 ?auto_27865 ) ) ( ON ?auto_27863 ?auto_27864 ) ( CLEAR ?auto_27861 ) ( ON ?auto_27862 ?auto_27863 ) ( CLEAR ?auto_27862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27860 ?auto_27861 ?auto_27862 )
      ( MAKE-5PILE ?auto_27860 ?auto_27861 ?auto_27862 ?auto_27863 ?auto_27864 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27871 - BLOCK
      ?auto_27872 - BLOCK
      ?auto_27873 - BLOCK
      ?auto_27874 - BLOCK
      ?auto_27875 - BLOCK
    )
    :vars
    (
      ?auto_27876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27875 ?auto_27876 ) ( ON-TABLE ?auto_27871 ) ( not ( = ?auto_27871 ?auto_27872 ) ) ( not ( = ?auto_27871 ?auto_27873 ) ) ( not ( = ?auto_27871 ?auto_27874 ) ) ( not ( = ?auto_27871 ?auto_27875 ) ) ( not ( = ?auto_27871 ?auto_27876 ) ) ( not ( = ?auto_27872 ?auto_27873 ) ) ( not ( = ?auto_27872 ?auto_27874 ) ) ( not ( = ?auto_27872 ?auto_27875 ) ) ( not ( = ?auto_27872 ?auto_27876 ) ) ( not ( = ?auto_27873 ?auto_27874 ) ) ( not ( = ?auto_27873 ?auto_27875 ) ) ( not ( = ?auto_27873 ?auto_27876 ) ) ( not ( = ?auto_27874 ?auto_27875 ) ) ( not ( = ?auto_27874 ?auto_27876 ) ) ( not ( = ?auto_27875 ?auto_27876 ) ) ( ON ?auto_27874 ?auto_27875 ) ( ON ?auto_27873 ?auto_27874 ) ( CLEAR ?auto_27871 ) ( ON ?auto_27872 ?auto_27873 ) ( CLEAR ?auto_27872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27871 ?auto_27872 )
      ( MAKE-5PILE ?auto_27871 ?auto_27872 ?auto_27873 ?auto_27874 ?auto_27875 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27882 - BLOCK
      ?auto_27883 - BLOCK
      ?auto_27884 - BLOCK
      ?auto_27885 - BLOCK
      ?auto_27886 - BLOCK
    )
    :vars
    (
      ?auto_27887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27886 ?auto_27887 ) ( ON-TABLE ?auto_27882 ) ( not ( = ?auto_27882 ?auto_27883 ) ) ( not ( = ?auto_27882 ?auto_27884 ) ) ( not ( = ?auto_27882 ?auto_27885 ) ) ( not ( = ?auto_27882 ?auto_27886 ) ) ( not ( = ?auto_27882 ?auto_27887 ) ) ( not ( = ?auto_27883 ?auto_27884 ) ) ( not ( = ?auto_27883 ?auto_27885 ) ) ( not ( = ?auto_27883 ?auto_27886 ) ) ( not ( = ?auto_27883 ?auto_27887 ) ) ( not ( = ?auto_27884 ?auto_27885 ) ) ( not ( = ?auto_27884 ?auto_27886 ) ) ( not ( = ?auto_27884 ?auto_27887 ) ) ( not ( = ?auto_27885 ?auto_27886 ) ) ( not ( = ?auto_27885 ?auto_27887 ) ) ( not ( = ?auto_27886 ?auto_27887 ) ) ( ON ?auto_27885 ?auto_27886 ) ( ON ?auto_27884 ?auto_27885 ) ( CLEAR ?auto_27882 ) ( ON ?auto_27883 ?auto_27884 ) ( CLEAR ?auto_27883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27882 ?auto_27883 )
      ( MAKE-5PILE ?auto_27882 ?auto_27883 ?auto_27884 ?auto_27885 ?auto_27886 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27893 - BLOCK
      ?auto_27894 - BLOCK
      ?auto_27895 - BLOCK
      ?auto_27896 - BLOCK
      ?auto_27897 - BLOCK
    )
    :vars
    (
      ?auto_27898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27897 ?auto_27898 ) ( not ( = ?auto_27893 ?auto_27894 ) ) ( not ( = ?auto_27893 ?auto_27895 ) ) ( not ( = ?auto_27893 ?auto_27896 ) ) ( not ( = ?auto_27893 ?auto_27897 ) ) ( not ( = ?auto_27893 ?auto_27898 ) ) ( not ( = ?auto_27894 ?auto_27895 ) ) ( not ( = ?auto_27894 ?auto_27896 ) ) ( not ( = ?auto_27894 ?auto_27897 ) ) ( not ( = ?auto_27894 ?auto_27898 ) ) ( not ( = ?auto_27895 ?auto_27896 ) ) ( not ( = ?auto_27895 ?auto_27897 ) ) ( not ( = ?auto_27895 ?auto_27898 ) ) ( not ( = ?auto_27896 ?auto_27897 ) ) ( not ( = ?auto_27896 ?auto_27898 ) ) ( not ( = ?auto_27897 ?auto_27898 ) ) ( ON ?auto_27896 ?auto_27897 ) ( ON ?auto_27895 ?auto_27896 ) ( ON ?auto_27894 ?auto_27895 ) ( ON ?auto_27893 ?auto_27894 ) ( CLEAR ?auto_27893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27893 )
      ( MAKE-5PILE ?auto_27893 ?auto_27894 ?auto_27895 ?auto_27896 ?auto_27897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27904 - BLOCK
      ?auto_27905 - BLOCK
      ?auto_27906 - BLOCK
      ?auto_27907 - BLOCK
      ?auto_27908 - BLOCK
    )
    :vars
    (
      ?auto_27909 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27908 ?auto_27909 ) ( not ( = ?auto_27904 ?auto_27905 ) ) ( not ( = ?auto_27904 ?auto_27906 ) ) ( not ( = ?auto_27904 ?auto_27907 ) ) ( not ( = ?auto_27904 ?auto_27908 ) ) ( not ( = ?auto_27904 ?auto_27909 ) ) ( not ( = ?auto_27905 ?auto_27906 ) ) ( not ( = ?auto_27905 ?auto_27907 ) ) ( not ( = ?auto_27905 ?auto_27908 ) ) ( not ( = ?auto_27905 ?auto_27909 ) ) ( not ( = ?auto_27906 ?auto_27907 ) ) ( not ( = ?auto_27906 ?auto_27908 ) ) ( not ( = ?auto_27906 ?auto_27909 ) ) ( not ( = ?auto_27907 ?auto_27908 ) ) ( not ( = ?auto_27907 ?auto_27909 ) ) ( not ( = ?auto_27908 ?auto_27909 ) ) ( ON ?auto_27907 ?auto_27908 ) ( ON ?auto_27906 ?auto_27907 ) ( ON ?auto_27905 ?auto_27906 ) ( ON ?auto_27904 ?auto_27905 ) ( CLEAR ?auto_27904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27904 )
      ( MAKE-5PILE ?auto_27904 ?auto_27905 ?auto_27906 ?auto_27907 ?auto_27908 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27916 - BLOCK
      ?auto_27917 - BLOCK
      ?auto_27918 - BLOCK
      ?auto_27919 - BLOCK
      ?auto_27920 - BLOCK
      ?auto_27921 - BLOCK
    )
    :vars
    (
      ?auto_27922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27920 ) ( ON ?auto_27921 ?auto_27922 ) ( CLEAR ?auto_27921 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27916 ) ( ON ?auto_27917 ?auto_27916 ) ( ON ?auto_27918 ?auto_27917 ) ( ON ?auto_27919 ?auto_27918 ) ( ON ?auto_27920 ?auto_27919 ) ( not ( = ?auto_27916 ?auto_27917 ) ) ( not ( = ?auto_27916 ?auto_27918 ) ) ( not ( = ?auto_27916 ?auto_27919 ) ) ( not ( = ?auto_27916 ?auto_27920 ) ) ( not ( = ?auto_27916 ?auto_27921 ) ) ( not ( = ?auto_27916 ?auto_27922 ) ) ( not ( = ?auto_27917 ?auto_27918 ) ) ( not ( = ?auto_27917 ?auto_27919 ) ) ( not ( = ?auto_27917 ?auto_27920 ) ) ( not ( = ?auto_27917 ?auto_27921 ) ) ( not ( = ?auto_27917 ?auto_27922 ) ) ( not ( = ?auto_27918 ?auto_27919 ) ) ( not ( = ?auto_27918 ?auto_27920 ) ) ( not ( = ?auto_27918 ?auto_27921 ) ) ( not ( = ?auto_27918 ?auto_27922 ) ) ( not ( = ?auto_27919 ?auto_27920 ) ) ( not ( = ?auto_27919 ?auto_27921 ) ) ( not ( = ?auto_27919 ?auto_27922 ) ) ( not ( = ?auto_27920 ?auto_27921 ) ) ( not ( = ?auto_27920 ?auto_27922 ) ) ( not ( = ?auto_27921 ?auto_27922 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27921 ?auto_27922 )
      ( !STACK ?auto_27921 ?auto_27920 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27929 - BLOCK
      ?auto_27930 - BLOCK
      ?auto_27931 - BLOCK
      ?auto_27932 - BLOCK
      ?auto_27933 - BLOCK
      ?auto_27934 - BLOCK
    )
    :vars
    (
      ?auto_27935 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27933 ) ( ON ?auto_27934 ?auto_27935 ) ( CLEAR ?auto_27934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27929 ) ( ON ?auto_27930 ?auto_27929 ) ( ON ?auto_27931 ?auto_27930 ) ( ON ?auto_27932 ?auto_27931 ) ( ON ?auto_27933 ?auto_27932 ) ( not ( = ?auto_27929 ?auto_27930 ) ) ( not ( = ?auto_27929 ?auto_27931 ) ) ( not ( = ?auto_27929 ?auto_27932 ) ) ( not ( = ?auto_27929 ?auto_27933 ) ) ( not ( = ?auto_27929 ?auto_27934 ) ) ( not ( = ?auto_27929 ?auto_27935 ) ) ( not ( = ?auto_27930 ?auto_27931 ) ) ( not ( = ?auto_27930 ?auto_27932 ) ) ( not ( = ?auto_27930 ?auto_27933 ) ) ( not ( = ?auto_27930 ?auto_27934 ) ) ( not ( = ?auto_27930 ?auto_27935 ) ) ( not ( = ?auto_27931 ?auto_27932 ) ) ( not ( = ?auto_27931 ?auto_27933 ) ) ( not ( = ?auto_27931 ?auto_27934 ) ) ( not ( = ?auto_27931 ?auto_27935 ) ) ( not ( = ?auto_27932 ?auto_27933 ) ) ( not ( = ?auto_27932 ?auto_27934 ) ) ( not ( = ?auto_27932 ?auto_27935 ) ) ( not ( = ?auto_27933 ?auto_27934 ) ) ( not ( = ?auto_27933 ?auto_27935 ) ) ( not ( = ?auto_27934 ?auto_27935 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27934 ?auto_27935 )
      ( !STACK ?auto_27934 ?auto_27933 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27942 - BLOCK
      ?auto_27943 - BLOCK
      ?auto_27944 - BLOCK
      ?auto_27945 - BLOCK
      ?auto_27946 - BLOCK
      ?auto_27947 - BLOCK
    )
    :vars
    (
      ?auto_27948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27947 ?auto_27948 ) ( ON-TABLE ?auto_27942 ) ( ON ?auto_27943 ?auto_27942 ) ( ON ?auto_27944 ?auto_27943 ) ( ON ?auto_27945 ?auto_27944 ) ( not ( = ?auto_27942 ?auto_27943 ) ) ( not ( = ?auto_27942 ?auto_27944 ) ) ( not ( = ?auto_27942 ?auto_27945 ) ) ( not ( = ?auto_27942 ?auto_27946 ) ) ( not ( = ?auto_27942 ?auto_27947 ) ) ( not ( = ?auto_27942 ?auto_27948 ) ) ( not ( = ?auto_27943 ?auto_27944 ) ) ( not ( = ?auto_27943 ?auto_27945 ) ) ( not ( = ?auto_27943 ?auto_27946 ) ) ( not ( = ?auto_27943 ?auto_27947 ) ) ( not ( = ?auto_27943 ?auto_27948 ) ) ( not ( = ?auto_27944 ?auto_27945 ) ) ( not ( = ?auto_27944 ?auto_27946 ) ) ( not ( = ?auto_27944 ?auto_27947 ) ) ( not ( = ?auto_27944 ?auto_27948 ) ) ( not ( = ?auto_27945 ?auto_27946 ) ) ( not ( = ?auto_27945 ?auto_27947 ) ) ( not ( = ?auto_27945 ?auto_27948 ) ) ( not ( = ?auto_27946 ?auto_27947 ) ) ( not ( = ?auto_27946 ?auto_27948 ) ) ( not ( = ?auto_27947 ?auto_27948 ) ) ( CLEAR ?auto_27945 ) ( ON ?auto_27946 ?auto_27947 ) ( CLEAR ?auto_27946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27942 ?auto_27943 ?auto_27944 ?auto_27945 ?auto_27946 )
      ( MAKE-6PILE ?auto_27942 ?auto_27943 ?auto_27944 ?auto_27945 ?auto_27946 ?auto_27947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27955 - BLOCK
      ?auto_27956 - BLOCK
      ?auto_27957 - BLOCK
      ?auto_27958 - BLOCK
      ?auto_27959 - BLOCK
      ?auto_27960 - BLOCK
    )
    :vars
    (
      ?auto_27961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27960 ?auto_27961 ) ( ON-TABLE ?auto_27955 ) ( ON ?auto_27956 ?auto_27955 ) ( ON ?auto_27957 ?auto_27956 ) ( ON ?auto_27958 ?auto_27957 ) ( not ( = ?auto_27955 ?auto_27956 ) ) ( not ( = ?auto_27955 ?auto_27957 ) ) ( not ( = ?auto_27955 ?auto_27958 ) ) ( not ( = ?auto_27955 ?auto_27959 ) ) ( not ( = ?auto_27955 ?auto_27960 ) ) ( not ( = ?auto_27955 ?auto_27961 ) ) ( not ( = ?auto_27956 ?auto_27957 ) ) ( not ( = ?auto_27956 ?auto_27958 ) ) ( not ( = ?auto_27956 ?auto_27959 ) ) ( not ( = ?auto_27956 ?auto_27960 ) ) ( not ( = ?auto_27956 ?auto_27961 ) ) ( not ( = ?auto_27957 ?auto_27958 ) ) ( not ( = ?auto_27957 ?auto_27959 ) ) ( not ( = ?auto_27957 ?auto_27960 ) ) ( not ( = ?auto_27957 ?auto_27961 ) ) ( not ( = ?auto_27958 ?auto_27959 ) ) ( not ( = ?auto_27958 ?auto_27960 ) ) ( not ( = ?auto_27958 ?auto_27961 ) ) ( not ( = ?auto_27959 ?auto_27960 ) ) ( not ( = ?auto_27959 ?auto_27961 ) ) ( not ( = ?auto_27960 ?auto_27961 ) ) ( CLEAR ?auto_27958 ) ( ON ?auto_27959 ?auto_27960 ) ( CLEAR ?auto_27959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27955 ?auto_27956 ?auto_27957 ?auto_27958 ?auto_27959 )
      ( MAKE-6PILE ?auto_27955 ?auto_27956 ?auto_27957 ?auto_27958 ?auto_27959 ?auto_27960 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27968 - BLOCK
      ?auto_27969 - BLOCK
      ?auto_27970 - BLOCK
      ?auto_27971 - BLOCK
      ?auto_27972 - BLOCK
      ?auto_27973 - BLOCK
    )
    :vars
    (
      ?auto_27974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27973 ?auto_27974 ) ( ON-TABLE ?auto_27968 ) ( ON ?auto_27969 ?auto_27968 ) ( ON ?auto_27970 ?auto_27969 ) ( not ( = ?auto_27968 ?auto_27969 ) ) ( not ( = ?auto_27968 ?auto_27970 ) ) ( not ( = ?auto_27968 ?auto_27971 ) ) ( not ( = ?auto_27968 ?auto_27972 ) ) ( not ( = ?auto_27968 ?auto_27973 ) ) ( not ( = ?auto_27968 ?auto_27974 ) ) ( not ( = ?auto_27969 ?auto_27970 ) ) ( not ( = ?auto_27969 ?auto_27971 ) ) ( not ( = ?auto_27969 ?auto_27972 ) ) ( not ( = ?auto_27969 ?auto_27973 ) ) ( not ( = ?auto_27969 ?auto_27974 ) ) ( not ( = ?auto_27970 ?auto_27971 ) ) ( not ( = ?auto_27970 ?auto_27972 ) ) ( not ( = ?auto_27970 ?auto_27973 ) ) ( not ( = ?auto_27970 ?auto_27974 ) ) ( not ( = ?auto_27971 ?auto_27972 ) ) ( not ( = ?auto_27971 ?auto_27973 ) ) ( not ( = ?auto_27971 ?auto_27974 ) ) ( not ( = ?auto_27972 ?auto_27973 ) ) ( not ( = ?auto_27972 ?auto_27974 ) ) ( not ( = ?auto_27973 ?auto_27974 ) ) ( ON ?auto_27972 ?auto_27973 ) ( CLEAR ?auto_27970 ) ( ON ?auto_27971 ?auto_27972 ) ( CLEAR ?auto_27971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27968 ?auto_27969 ?auto_27970 ?auto_27971 )
      ( MAKE-6PILE ?auto_27968 ?auto_27969 ?auto_27970 ?auto_27971 ?auto_27972 ?auto_27973 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27981 - BLOCK
      ?auto_27982 - BLOCK
      ?auto_27983 - BLOCK
      ?auto_27984 - BLOCK
      ?auto_27985 - BLOCK
      ?auto_27986 - BLOCK
    )
    :vars
    (
      ?auto_27987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27986 ?auto_27987 ) ( ON-TABLE ?auto_27981 ) ( ON ?auto_27982 ?auto_27981 ) ( ON ?auto_27983 ?auto_27982 ) ( not ( = ?auto_27981 ?auto_27982 ) ) ( not ( = ?auto_27981 ?auto_27983 ) ) ( not ( = ?auto_27981 ?auto_27984 ) ) ( not ( = ?auto_27981 ?auto_27985 ) ) ( not ( = ?auto_27981 ?auto_27986 ) ) ( not ( = ?auto_27981 ?auto_27987 ) ) ( not ( = ?auto_27982 ?auto_27983 ) ) ( not ( = ?auto_27982 ?auto_27984 ) ) ( not ( = ?auto_27982 ?auto_27985 ) ) ( not ( = ?auto_27982 ?auto_27986 ) ) ( not ( = ?auto_27982 ?auto_27987 ) ) ( not ( = ?auto_27983 ?auto_27984 ) ) ( not ( = ?auto_27983 ?auto_27985 ) ) ( not ( = ?auto_27983 ?auto_27986 ) ) ( not ( = ?auto_27983 ?auto_27987 ) ) ( not ( = ?auto_27984 ?auto_27985 ) ) ( not ( = ?auto_27984 ?auto_27986 ) ) ( not ( = ?auto_27984 ?auto_27987 ) ) ( not ( = ?auto_27985 ?auto_27986 ) ) ( not ( = ?auto_27985 ?auto_27987 ) ) ( not ( = ?auto_27986 ?auto_27987 ) ) ( ON ?auto_27985 ?auto_27986 ) ( CLEAR ?auto_27983 ) ( ON ?auto_27984 ?auto_27985 ) ( CLEAR ?auto_27984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27981 ?auto_27982 ?auto_27983 ?auto_27984 )
      ( MAKE-6PILE ?auto_27981 ?auto_27982 ?auto_27983 ?auto_27984 ?auto_27985 ?auto_27986 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_27994 - BLOCK
      ?auto_27995 - BLOCK
      ?auto_27996 - BLOCK
      ?auto_27997 - BLOCK
      ?auto_27998 - BLOCK
      ?auto_27999 - BLOCK
    )
    :vars
    (
      ?auto_28000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27999 ?auto_28000 ) ( ON-TABLE ?auto_27994 ) ( ON ?auto_27995 ?auto_27994 ) ( not ( = ?auto_27994 ?auto_27995 ) ) ( not ( = ?auto_27994 ?auto_27996 ) ) ( not ( = ?auto_27994 ?auto_27997 ) ) ( not ( = ?auto_27994 ?auto_27998 ) ) ( not ( = ?auto_27994 ?auto_27999 ) ) ( not ( = ?auto_27994 ?auto_28000 ) ) ( not ( = ?auto_27995 ?auto_27996 ) ) ( not ( = ?auto_27995 ?auto_27997 ) ) ( not ( = ?auto_27995 ?auto_27998 ) ) ( not ( = ?auto_27995 ?auto_27999 ) ) ( not ( = ?auto_27995 ?auto_28000 ) ) ( not ( = ?auto_27996 ?auto_27997 ) ) ( not ( = ?auto_27996 ?auto_27998 ) ) ( not ( = ?auto_27996 ?auto_27999 ) ) ( not ( = ?auto_27996 ?auto_28000 ) ) ( not ( = ?auto_27997 ?auto_27998 ) ) ( not ( = ?auto_27997 ?auto_27999 ) ) ( not ( = ?auto_27997 ?auto_28000 ) ) ( not ( = ?auto_27998 ?auto_27999 ) ) ( not ( = ?auto_27998 ?auto_28000 ) ) ( not ( = ?auto_27999 ?auto_28000 ) ) ( ON ?auto_27998 ?auto_27999 ) ( ON ?auto_27997 ?auto_27998 ) ( CLEAR ?auto_27995 ) ( ON ?auto_27996 ?auto_27997 ) ( CLEAR ?auto_27996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27994 ?auto_27995 ?auto_27996 )
      ( MAKE-6PILE ?auto_27994 ?auto_27995 ?auto_27996 ?auto_27997 ?auto_27998 ?auto_27999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28007 - BLOCK
      ?auto_28008 - BLOCK
      ?auto_28009 - BLOCK
      ?auto_28010 - BLOCK
      ?auto_28011 - BLOCK
      ?auto_28012 - BLOCK
    )
    :vars
    (
      ?auto_28013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28012 ?auto_28013 ) ( ON-TABLE ?auto_28007 ) ( ON ?auto_28008 ?auto_28007 ) ( not ( = ?auto_28007 ?auto_28008 ) ) ( not ( = ?auto_28007 ?auto_28009 ) ) ( not ( = ?auto_28007 ?auto_28010 ) ) ( not ( = ?auto_28007 ?auto_28011 ) ) ( not ( = ?auto_28007 ?auto_28012 ) ) ( not ( = ?auto_28007 ?auto_28013 ) ) ( not ( = ?auto_28008 ?auto_28009 ) ) ( not ( = ?auto_28008 ?auto_28010 ) ) ( not ( = ?auto_28008 ?auto_28011 ) ) ( not ( = ?auto_28008 ?auto_28012 ) ) ( not ( = ?auto_28008 ?auto_28013 ) ) ( not ( = ?auto_28009 ?auto_28010 ) ) ( not ( = ?auto_28009 ?auto_28011 ) ) ( not ( = ?auto_28009 ?auto_28012 ) ) ( not ( = ?auto_28009 ?auto_28013 ) ) ( not ( = ?auto_28010 ?auto_28011 ) ) ( not ( = ?auto_28010 ?auto_28012 ) ) ( not ( = ?auto_28010 ?auto_28013 ) ) ( not ( = ?auto_28011 ?auto_28012 ) ) ( not ( = ?auto_28011 ?auto_28013 ) ) ( not ( = ?auto_28012 ?auto_28013 ) ) ( ON ?auto_28011 ?auto_28012 ) ( ON ?auto_28010 ?auto_28011 ) ( CLEAR ?auto_28008 ) ( ON ?auto_28009 ?auto_28010 ) ( CLEAR ?auto_28009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28007 ?auto_28008 ?auto_28009 )
      ( MAKE-6PILE ?auto_28007 ?auto_28008 ?auto_28009 ?auto_28010 ?auto_28011 ?auto_28012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28020 - BLOCK
      ?auto_28021 - BLOCK
      ?auto_28022 - BLOCK
      ?auto_28023 - BLOCK
      ?auto_28024 - BLOCK
      ?auto_28025 - BLOCK
    )
    :vars
    (
      ?auto_28026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28025 ?auto_28026 ) ( ON-TABLE ?auto_28020 ) ( not ( = ?auto_28020 ?auto_28021 ) ) ( not ( = ?auto_28020 ?auto_28022 ) ) ( not ( = ?auto_28020 ?auto_28023 ) ) ( not ( = ?auto_28020 ?auto_28024 ) ) ( not ( = ?auto_28020 ?auto_28025 ) ) ( not ( = ?auto_28020 ?auto_28026 ) ) ( not ( = ?auto_28021 ?auto_28022 ) ) ( not ( = ?auto_28021 ?auto_28023 ) ) ( not ( = ?auto_28021 ?auto_28024 ) ) ( not ( = ?auto_28021 ?auto_28025 ) ) ( not ( = ?auto_28021 ?auto_28026 ) ) ( not ( = ?auto_28022 ?auto_28023 ) ) ( not ( = ?auto_28022 ?auto_28024 ) ) ( not ( = ?auto_28022 ?auto_28025 ) ) ( not ( = ?auto_28022 ?auto_28026 ) ) ( not ( = ?auto_28023 ?auto_28024 ) ) ( not ( = ?auto_28023 ?auto_28025 ) ) ( not ( = ?auto_28023 ?auto_28026 ) ) ( not ( = ?auto_28024 ?auto_28025 ) ) ( not ( = ?auto_28024 ?auto_28026 ) ) ( not ( = ?auto_28025 ?auto_28026 ) ) ( ON ?auto_28024 ?auto_28025 ) ( ON ?auto_28023 ?auto_28024 ) ( ON ?auto_28022 ?auto_28023 ) ( CLEAR ?auto_28020 ) ( ON ?auto_28021 ?auto_28022 ) ( CLEAR ?auto_28021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28020 ?auto_28021 )
      ( MAKE-6PILE ?auto_28020 ?auto_28021 ?auto_28022 ?auto_28023 ?auto_28024 ?auto_28025 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28033 - BLOCK
      ?auto_28034 - BLOCK
      ?auto_28035 - BLOCK
      ?auto_28036 - BLOCK
      ?auto_28037 - BLOCK
      ?auto_28038 - BLOCK
    )
    :vars
    (
      ?auto_28039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28038 ?auto_28039 ) ( ON-TABLE ?auto_28033 ) ( not ( = ?auto_28033 ?auto_28034 ) ) ( not ( = ?auto_28033 ?auto_28035 ) ) ( not ( = ?auto_28033 ?auto_28036 ) ) ( not ( = ?auto_28033 ?auto_28037 ) ) ( not ( = ?auto_28033 ?auto_28038 ) ) ( not ( = ?auto_28033 ?auto_28039 ) ) ( not ( = ?auto_28034 ?auto_28035 ) ) ( not ( = ?auto_28034 ?auto_28036 ) ) ( not ( = ?auto_28034 ?auto_28037 ) ) ( not ( = ?auto_28034 ?auto_28038 ) ) ( not ( = ?auto_28034 ?auto_28039 ) ) ( not ( = ?auto_28035 ?auto_28036 ) ) ( not ( = ?auto_28035 ?auto_28037 ) ) ( not ( = ?auto_28035 ?auto_28038 ) ) ( not ( = ?auto_28035 ?auto_28039 ) ) ( not ( = ?auto_28036 ?auto_28037 ) ) ( not ( = ?auto_28036 ?auto_28038 ) ) ( not ( = ?auto_28036 ?auto_28039 ) ) ( not ( = ?auto_28037 ?auto_28038 ) ) ( not ( = ?auto_28037 ?auto_28039 ) ) ( not ( = ?auto_28038 ?auto_28039 ) ) ( ON ?auto_28037 ?auto_28038 ) ( ON ?auto_28036 ?auto_28037 ) ( ON ?auto_28035 ?auto_28036 ) ( CLEAR ?auto_28033 ) ( ON ?auto_28034 ?auto_28035 ) ( CLEAR ?auto_28034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28033 ?auto_28034 )
      ( MAKE-6PILE ?auto_28033 ?auto_28034 ?auto_28035 ?auto_28036 ?auto_28037 ?auto_28038 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28046 - BLOCK
      ?auto_28047 - BLOCK
      ?auto_28048 - BLOCK
      ?auto_28049 - BLOCK
      ?auto_28050 - BLOCK
      ?auto_28051 - BLOCK
    )
    :vars
    (
      ?auto_28052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28051 ?auto_28052 ) ( not ( = ?auto_28046 ?auto_28047 ) ) ( not ( = ?auto_28046 ?auto_28048 ) ) ( not ( = ?auto_28046 ?auto_28049 ) ) ( not ( = ?auto_28046 ?auto_28050 ) ) ( not ( = ?auto_28046 ?auto_28051 ) ) ( not ( = ?auto_28046 ?auto_28052 ) ) ( not ( = ?auto_28047 ?auto_28048 ) ) ( not ( = ?auto_28047 ?auto_28049 ) ) ( not ( = ?auto_28047 ?auto_28050 ) ) ( not ( = ?auto_28047 ?auto_28051 ) ) ( not ( = ?auto_28047 ?auto_28052 ) ) ( not ( = ?auto_28048 ?auto_28049 ) ) ( not ( = ?auto_28048 ?auto_28050 ) ) ( not ( = ?auto_28048 ?auto_28051 ) ) ( not ( = ?auto_28048 ?auto_28052 ) ) ( not ( = ?auto_28049 ?auto_28050 ) ) ( not ( = ?auto_28049 ?auto_28051 ) ) ( not ( = ?auto_28049 ?auto_28052 ) ) ( not ( = ?auto_28050 ?auto_28051 ) ) ( not ( = ?auto_28050 ?auto_28052 ) ) ( not ( = ?auto_28051 ?auto_28052 ) ) ( ON ?auto_28050 ?auto_28051 ) ( ON ?auto_28049 ?auto_28050 ) ( ON ?auto_28048 ?auto_28049 ) ( ON ?auto_28047 ?auto_28048 ) ( ON ?auto_28046 ?auto_28047 ) ( CLEAR ?auto_28046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28046 )
      ( MAKE-6PILE ?auto_28046 ?auto_28047 ?auto_28048 ?auto_28049 ?auto_28050 ?auto_28051 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_28059 - BLOCK
      ?auto_28060 - BLOCK
      ?auto_28061 - BLOCK
      ?auto_28062 - BLOCK
      ?auto_28063 - BLOCK
      ?auto_28064 - BLOCK
    )
    :vars
    (
      ?auto_28065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28064 ?auto_28065 ) ( not ( = ?auto_28059 ?auto_28060 ) ) ( not ( = ?auto_28059 ?auto_28061 ) ) ( not ( = ?auto_28059 ?auto_28062 ) ) ( not ( = ?auto_28059 ?auto_28063 ) ) ( not ( = ?auto_28059 ?auto_28064 ) ) ( not ( = ?auto_28059 ?auto_28065 ) ) ( not ( = ?auto_28060 ?auto_28061 ) ) ( not ( = ?auto_28060 ?auto_28062 ) ) ( not ( = ?auto_28060 ?auto_28063 ) ) ( not ( = ?auto_28060 ?auto_28064 ) ) ( not ( = ?auto_28060 ?auto_28065 ) ) ( not ( = ?auto_28061 ?auto_28062 ) ) ( not ( = ?auto_28061 ?auto_28063 ) ) ( not ( = ?auto_28061 ?auto_28064 ) ) ( not ( = ?auto_28061 ?auto_28065 ) ) ( not ( = ?auto_28062 ?auto_28063 ) ) ( not ( = ?auto_28062 ?auto_28064 ) ) ( not ( = ?auto_28062 ?auto_28065 ) ) ( not ( = ?auto_28063 ?auto_28064 ) ) ( not ( = ?auto_28063 ?auto_28065 ) ) ( not ( = ?auto_28064 ?auto_28065 ) ) ( ON ?auto_28063 ?auto_28064 ) ( ON ?auto_28062 ?auto_28063 ) ( ON ?auto_28061 ?auto_28062 ) ( ON ?auto_28060 ?auto_28061 ) ( ON ?auto_28059 ?auto_28060 ) ( CLEAR ?auto_28059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28059 )
      ( MAKE-6PILE ?auto_28059 ?auto_28060 ?auto_28061 ?auto_28062 ?auto_28063 ?auto_28064 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28073 - BLOCK
      ?auto_28074 - BLOCK
      ?auto_28075 - BLOCK
      ?auto_28076 - BLOCK
      ?auto_28077 - BLOCK
      ?auto_28078 - BLOCK
      ?auto_28079 - BLOCK
    )
    :vars
    (
      ?auto_28080 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28078 ) ( ON ?auto_28079 ?auto_28080 ) ( CLEAR ?auto_28079 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28073 ) ( ON ?auto_28074 ?auto_28073 ) ( ON ?auto_28075 ?auto_28074 ) ( ON ?auto_28076 ?auto_28075 ) ( ON ?auto_28077 ?auto_28076 ) ( ON ?auto_28078 ?auto_28077 ) ( not ( = ?auto_28073 ?auto_28074 ) ) ( not ( = ?auto_28073 ?auto_28075 ) ) ( not ( = ?auto_28073 ?auto_28076 ) ) ( not ( = ?auto_28073 ?auto_28077 ) ) ( not ( = ?auto_28073 ?auto_28078 ) ) ( not ( = ?auto_28073 ?auto_28079 ) ) ( not ( = ?auto_28073 ?auto_28080 ) ) ( not ( = ?auto_28074 ?auto_28075 ) ) ( not ( = ?auto_28074 ?auto_28076 ) ) ( not ( = ?auto_28074 ?auto_28077 ) ) ( not ( = ?auto_28074 ?auto_28078 ) ) ( not ( = ?auto_28074 ?auto_28079 ) ) ( not ( = ?auto_28074 ?auto_28080 ) ) ( not ( = ?auto_28075 ?auto_28076 ) ) ( not ( = ?auto_28075 ?auto_28077 ) ) ( not ( = ?auto_28075 ?auto_28078 ) ) ( not ( = ?auto_28075 ?auto_28079 ) ) ( not ( = ?auto_28075 ?auto_28080 ) ) ( not ( = ?auto_28076 ?auto_28077 ) ) ( not ( = ?auto_28076 ?auto_28078 ) ) ( not ( = ?auto_28076 ?auto_28079 ) ) ( not ( = ?auto_28076 ?auto_28080 ) ) ( not ( = ?auto_28077 ?auto_28078 ) ) ( not ( = ?auto_28077 ?auto_28079 ) ) ( not ( = ?auto_28077 ?auto_28080 ) ) ( not ( = ?auto_28078 ?auto_28079 ) ) ( not ( = ?auto_28078 ?auto_28080 ) ) ( not ( = ?auto_28079 ?auto_28080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_28079 ?auto_28080 )
      ( !STACK ?auto_28079 ?auto_28078 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28088 - BLOCK
      ?auto_28089 - BLOCK
      ?auto_28090 - BLOCK
      ?auto_28091 - BLOCK
      ?auto_28092 - BLOCK
      ?auto_28093 - BLOCK
      ?auto_28094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_28093 ) ( ON-TABLE ?auto_28094 ) ( CLEAR ?auto_28094 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_28088 ) ( ON ?auto_28089 ?auto_28088 ) ( ON ?auto_28090 ?auto_28089 ) ( ON ?auto_28091 ?auto_28090 ) ( ON ?auto_28092 ?auto_28091 ) ( ON ?auto_28093 ?auto_28092 ) ( not ( = ?auto_28088 ?auto_28089 ) ) ( not ( = ?auto_28088 ?auto_28090 ) ) ( not ( = ?auto_28088 ?auto_28091 ) ) ( not ( = ?auto_28088 ?auto_28092 ) ) ( not ( = ?auto_28088 ?auto_28093 ) ) ( not ( = ?auto_28088 ?auto_28094 ) ) ( not ( = ?auto_28089 ?auto_28090 ) ) ( not ( = ?auto_28089 ?auto_28091 ) ) ( not ( = ?auto_28089 ?auto_28092 ) ) ( not ( = ?auto_28089 ?auto_28093 ) ) ( not ( = ?auto_28089 ?auto_28094 ) ) ( not ( = ?auto_28090 ?auto_28091 ) ) ( not ( = ?auto_28090 ?auto_28092 ) ) ( not ( = ?auto_28090 ?auto_28093 ) ) ( not ( = ?auto_28090 ?auto_28094 ) ) ( not ( = ?auto_28091 ?auto_28092 ) ) ( not ( = ?auto_28091 ?auto_28093 ) ) ( not ( = ?auto_28091 ?auto_28094 ) ) ( not ( = ?auto_28092 ?auto_28093 ) ) ( not ( = ?auto_28092 ?auto_28094 ) ) ( not ( = ?auto_28093 ?auto_28094 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_28094 )
      ( !STACK ?auto_28094 ?auto_28093 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28102 - BLOCK
      ?auto_28103 - BLOCK
      ?auto_28104 - BLOCK
      ?auto_28105 - BLOCK
      ?auto_28106 - BLOCK
      ?auto_28107 - BLOCK
      ?auto_28108 - BLOCK
    )
    :vars
    (
      ?auto_28109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28108 ?auto_28109 ) ( ON-TABLE ?auto_28102 ) ( ON ?auto_28103 ?auto_28102 ) ( ON ?auto_28104 ?auto_28103 ) ( ON ?auto_28105 ?auto_28104 ) ( ON ?auto_28106 ?auto_28105 ) ( not ( = ?auto_28102 ?auto_28103 ) ) ( not ( = ?auto_28102 ?auto_28104 ) ) ( not ( = ?auto_28102 ?auto_28105 ) ) ( not ( = ?auto_28102 ?auto_28106 ) ) ( not ( = ?auto_28102 ?auto_28107 ) ) ( not ( = ?auto_28102 ?auto_28108 ) ) ( not ( = ?auto_28102 ?auto_28109 ) ) ( not ( = ?auto_28103 ?auto_28104 ) ) ( not ( = ?auto_28103 ?auto_28105 ) ) ( not ( = ?auto_28103 ?auto_28106 ) ) ( not ( = ?auto_28103 ?auto_28107 ) ) ( not ( = ?auto_28103 ?auto_28108 ) ) ( not ( = ?auto_28103 ?auto_28109 ) ) ( not ( = ?auto_28104 ?auto_28105 ) ) ( not ( = ?auto_28104 ?auto_28106 ) ) ( not ( = ?auto_28104 ?auto_28107 ) ) ( not ( = ?auto_28104 ?auto_28108 ) ) ( not ( = ?auto_28104 ?auto_28109 ) ) ( not ( = ?auto_28105 ?auto_28106 ) ) ( not ( = ?auto_28105 ?auto_28107 ) ) ( not ( = ?auto_28105 ?auto_28108 ) ) ( not ( = ?auto_28105 ?auto_28109 ) ) ( not ( = ?auto_28106 ?auto_28107 ) ) ( not ( = ?auto_28106 ?auto_28108 ) ) ( not ( = ?auto_28106 ?auto_28109 ) ) ( not ( = ?auto_28107 ?auto_28108 ) ) ( not ( = ?auto_28107 ?auto_28109 ) ) ( not ( = ?auto_28108 ?auto_28109 ) ) ( CLEAR ?auto_28106 ) ( ON ?auto_28107 ?auto_28108 ) ( CLEAR ?auto_28107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_28102 ?auto_28103 ?auto_28104 ?auto_28105 ?auto_28106 ?auto_28107 )
      ( MAKE-7PILE ?auto_28102 ?auto_28103 ?auto_28104 ?auto_28105 ?auto_28106 ?auto_28107 ?auto_28108 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28117 - BLOCK
      ?auto_28118 - BLOCK
      ?auto_28119 - BLOCK
      ?auto_28120 - BLOCK
      ?auto_28121 - BLOCK
      ?auto_28122 - BLOCK
      ?auto_28123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28123 ) ( ON-TABLE ?auto_28117 ) ( ON ?auto_28118 ?auto_28117 ) ( ON ?auto_28119 ?auto_28118 ) ( ON ?auto_28120 ?auto_28119 ) ( ON ?auto_28121 ?auto_28120 ) ( not ( = ?auto_28117 ?auto_28118 ) ) ( not ( = ?auto_28117 ?auto_28119 ) ) ( not ( = ?auto_28117 ?auto_28120 ) ) ( not ( = ?auto_28117 ?auto_28121 ) ) ( not ( = ?auto_28117 ?auto_28122 ) ) ( not ( = ?auto_28117 ?auto_28123 ) ) ( not ( = ?auto_28118 ?auto_28119 ) ) ( not ( = ?auto_28118 ?auto_28120 ) ) ( not ( = ?auto_28118 ?auto_28121 ) ) ( not ( = ?auto_28118 ?auto_28122 ) ) ( not ( = ?auto_28118 ?auto_28123 ) ) ( not ( = ?auto_28119 ?auto_28120 ) ) ( not ( = ?auto_28119 ?auto_28121 ) ) ( not ( = ?auto_28119 ?auto_28122 ) ) ( not ( = ?auto_28119 ?auto_28123 ) ) ( not ( = ?auto_28120 ?auto_28121 ) ) ( not ( = ?auto_28120 ?auto_28122 ) ) ( not ( = ?auto_28120 ?auto_28123 ) ) ( not ( = ?auto_28121 ?auto_28122 ) ) ( not ( = ?auto_28121 ?auto_28123 ) ) ( not ( = ?auto_28122 ?auto_28123 ) ) ( CLEAR ?auto_28121 ) ( ON ?auto_28122 ?auto_28123 ) ( CLEAR ?auto_28122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_28117 ?auto_28118 ?auto_28119 ?auto_28120 ?auto_28121 ?auto_28122 )
      ( MAKE-7PILE ?auto_28117 ?auto_28118 ?auto_28119 ?auto_28120 ?auto_28121 ?auto_28122 ?auto_28123 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28131 - BLOCK
      ?auto_28132 - BLOCK
      ?auto_28133 - BLOCK
      ?auto_28134 - BLOCK
      ?auto_28135 - BLOCK
      ?auto_28136 - BLOCK
      ?auto_28137 - BLOCK
    )
    :vars
    (
      ?auto_28138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28137 ?auto_28138 ) ( ON-TABLE ?auto_28131 ) ( ON ?auto_28132 ?auto_28131 ) ( ON ?auto_28133 ?auto_28132 ) ( ON ?auto_28134 ?auto_28133 ) ( not ( = ?auto_28131 ?auto_28132 ) ) ( not ( = ?auto_28131 ?auto_28133 ) ) ( not ( = ?auto_28131 ?auto_28134 ) ) ( not ( = ?auto_28131 ?auto_28135 ) ) ( not ( = ?auto_28131 ?auto_28136 ) ) ( not ( = ?auto_28131 ?auto_28137 ) ) ( not ( = ?auto_28131 ?auto_28138 ) ) ( not ( = ?auto_28132 ?auto_28133 ) ) ( not ( = ?auto_28132 ?auto_28134 ) ) ( not ( = ?auto_28132 ?auto_28135 ) ) ( not ( = ?auto_28132 ?auto_28136 ) ) ( not ( = ?auto_28132 ?auto_28137 ) ) ( not ( = ?auto_28132 ?auto_28138 ) ) ( not ( = ?auto_28133 ?auto_28134 ) ) ( not ( = ?auto_28133 ?auto_28135 ) ) ( not ( = ?auto_28133 ?auto_28136 ) ) ( not ( = ?auto_28133 ?auto_28137 ) ) ( not ( = ?auto_28133 ?auto_28138 ) ) ( not ( = ?auto_28134 ?auto_28135 ) ) ( not ( = ?auto_28134 ?auto_28136 ) ) ( not ( = ?auto_28134 ?auto_28137 ) ) ( not ( = ?auto_28134 ?auto_28138 ) ) ( not ( = ?auto_28135 ?auto_28136 ) ) ( not ( = ?auto_28135 ?auto_28137 ) ) ( not ( = ?auto_28135 ?auto_28138 ) ) ( not ( = ?auto_28136 ?auto_28137 ) ) ( not ( = ?auto_28136 ?auto_28138 ) ) ( not ( = ?auto_28137 ?auto_28138 ) ) ( ON ?auto_28136 ?auto_28137 ) ( CLEAR ?auto_28134 ) ( ON ?auto_28135 ?auto_28136 ) ( CLEAR ?auto_28135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28131 ?auto_28132 ?auto_28133 ?auto_28134 ?auto_28135 )
      ( MAKE-7PILE ?auto_28131 ?auto_28132 ?auto_28133 ?auto_28134 ?auto_28135 ?auto_28136 ?auto_28137 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28146 - BLOCK
      ?auto_28147 - BLOCK
      ?auto_28148 - BLOCK
      ?auto_28149 - BLOCK
      ?auto_28150 - BLOCK
      ?auto_28151 - BLOCK
      ?auto_28152 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28152 ) ( ON-TABLE ?auto_28146 ) ( ON ?auto_28147 ?auto_28146 ) ( ON ?auto_28148 ?auto_28147 ) ( ON ?auto_28149 ?auto_28148 ) ( not ( = ?auto_28146 ?auto_28147 ) ) ( not ( = ?auto_28146 ?auto_28148 ) ) ( not ( = ?auto_28146 ?auto_28149 ) ) ( not ( = ?auto_28146 ?auto_28150 ) ) ( not ( = ?auto_28146 ?auto_28151 ) ) ( not ( = ?auto_28146 ?auto_28152 ) ) ( not ( = ?auto_28147 ?auto_28148 ) ) ( not ( = ?auto_28147 ?auto_28149 ) ) ( not ( = ?auto_28147 ?auto_28150 ) ) ( not ( = ?auto_28147 ?auto_28151 ) ) ( not ( = ?auto_28147 ?auto_28152 ) ) ( not ( = ?auto_28148 ?auto_28149 ) ) ( not ( = ?auto_28148 ?auto_28150 ) ) ( not ( = ?auto_28148 ?auto_28151 ) ) ( not ( = ?auto_28148 ?auto_28152 ) ) ( not ( = ?auto_28149 ?auto_28150 ) ) ( not ( = ?auto_28149 ?auto_28151 ) ) ( not ( = ?auto_28149 ?auto_28152 ) ) ( not ( = ?auto_28150 ?auto_28151 ) ) ( not ( = ?auto_28150 ?auto_28152 ) ) ( not ( = ?auto_28151 ?auto_28152 ) ) ( ON ?auto_28151 ?auto_28152 ) ( CLEAR ?auto_28149 ) ( ON ?auto_28150 ?auto_28151 ) ( CLEAR ?auto_28150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_28146 ?auto_28147 ?auto_28148 ?auto_28149 ?auto_28150 )
      ( MAKE-7PILE ?auto_28146 ?auto_28147 ?auto_28148 ?auto_28149 ?auto_28150 ?auto_28151 ?auto_28152 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28160 - BLOCK
      ?auto_28161 - BLOCK
      ?auto_28162 - BLOCK
      ?auto_28163 - BLOCK
      ?auto_28164 - BLOCK
      ?auto_28165 - BLOCK
      ?auto_28166 - BLOCK
    )
    :vars
    (
      ?auto_28167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28166 ?auto_28167 ) ( ON-TABLE ?auto_28160 ) ( ON ?auto_28161 ?auto_28160 ) ( ON ?auto_28162 ?auto_28161 ) ( not ( = ?auto_28160 ?auto_28161 ) ) ( not ( = ?auto_28160 ?auto_28162 ) ) ( not ( = ?auto_28160 ?auto_28163 ) ) ( not ( = ?auto_28160 ?auto_28164 ) ) ( not ( = ?auto_28160 ?auto_28165 ) ) ( not ( = ?auto_28160 ?auto_28166 ) ) ( not ( = ?auto_28160 ?auto_28167 ) ) ( not ( = ?auto_28161 ?auto_28162 ) ) ( not ( = ?auto_28161 ?auto_28163 ) ) ( not ( = ?auto_28161 ?auto_28164 ) ) ( not ( = ?auto_28161 ?auto_28165 ) ) ( not ( = ?auto_28161 ?auto_28166 ) ) ( not ( = ?auto_28161 ?auto_28167 ) ) ( not ( = ?auto_28162 ?auto_28163 ) ) ( not ( = ?auto_28162 ?auto_28164 ) ) ( not ( = ?auto_28162 ?auto_28165 ) ) ( not ( = ?auto_28162 ?auto_28166 ) ) ( not ( = ?auto_28162 ?auto_28167 ) ) ( not ( = ?auto_28163 ?auto_28164 ) ) ( not ( = ?auto_28163 ?auto_28165 ) ) ( not ( = ?auto_28163 ?auto_28166 ) ) ( not ( = ?auto_28163 ?auto_28167 ) ) ( not ( = ?auto_28164 ?auto_28165 ) ) ( not ( = ?auto_28164 ?auto_28166 ) ) ( not ( = ?auto_28164 ?auto_28167 ) ) ( not ( = ?auto_28165 ?auto_28166 ) ) ( not ( = ?auto_28165 ?auto_28167 ) ) ( not ( = ?auto_28166 ?auto_28167 ) ) ( ON ?auto_28165 ?auto_28166 ) ( ON ?auto_28164 ?auto_28165 ) ( CLEAR ?auto_28162 ) ( ON ?auto_28163 ?auto_28164 ) ( CLEAR ?auto_28163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28160 ?auto_28161 ?auto_28162 ?auto_28163 )
      ( MAKE-7PILE ?auto_28160 ?auto_28161 ?auto_28162 ?auto_28163 ?auto_28164 ?auto_28165 ?auto_28166 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28175 - BLOCK
      ?auto_28176 - BLOCK
      ?auto_28177 - BLOCK
      ?auto_28178 - BLOCK
      ?auto_28179 - BLOCK
      ?auto_28180 - BLOCK
      ?auto_28181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28181 ) ( ON-TABLE ?auto_28175 ) ( ON ?auto_28176 ?auto_28175 ) ( ON ?auto_28177 ?auto_28176 ) ( not ( = ?auto_28175 ?auto_28176 ) ) ( not ( = ?auto_28175 ?auto_28177 ) ) ( not ( = ?auto_28175 ?auto_28178 ) ) ( not ( = ?auto_28175 ?auto_28179 ) ) ( not ( = ?auto_28175 ?auto_28180 ) ) ( not ( = ?auto_28175 ?auto_28181 ) ) ( not ( = ?auto_28176 ?auto_28177 ) ) ( not ( = ?auto_28176 ?auto_28178 ) ) ( not ( = ?auto_28176 ?auto_28179 ) ) ( not ( = ?auto_28176 ?auto_28180 ) ) ( not ( = ?auto_28176 ?auto_28181 ) ) ( not ( = ?auto_28177 ?auto_28178 ) ) ( not ( = ?auto_28177 ?auto_28179 ) ) ( not ( = ?auto_28177 ?auto_28180 ) ) ( not ( = ?auto_28177 ?auto_28181 ) ) ( not ( = ?auto_28178 ?auto_28179 ) ) ( not ( = ?auto_28178 ?auto_28180 ) ) ( not ( = ?auto_28178 ?auto_28181 ) ) ( not ( = ?auto_28179 ?auto_28180 ) ) ( not ( = ?auto_28179 ?auto_28181 ) ) ( not ( = ?auto_28180 ?auto_28181 ) ) ( ON ?auto_28180 ?auto_28181 ) ( ON ?auto_28179 ?auto_28180 ) ( CLEAR ?auto_28177 ) ( ON ?auto_28178 ?auto_28179 ) ( CLEAR ?auto_28178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_28175 ?auto_28176 ?auto_28177 ?auto_28178 )
      ( MAKE-7PILE ?auto_28175 ?auto_28176 ?auto_28177 ?auto_28178 ?auto_28179 ?auto_28180 ?auto_28181 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28189 - BLOCK
      ?auto_28190 - BLOCK
      ?auto_28191 - BLOCK
      ?auto_28192 - BLOCK
      ?auto_28193 - BLOCK
      ?auto_28194 - BLOCK
      ?auto_28195 - BLOCK
    )
    :vars
    (
      ?auto_28196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28195 ?auto_28196 ) ( ON-TABLE ?auto_28189 ) ( ON ?auto_28190 ?auto_28189 ) ( not ( = ?auto_28189 ?auto_28190 ) ) ( not ( = ?auto_28189 ?auto_28191 ) ) ( not ( = ?auto_28189 ?auto_28192 ) ) ( not ( = ?auto_28189 ?auto_28193 ) ) ( not ( = ?auto_28189 ?auto_28194 ) ) ( not ( = ?auto_28189 ?auto_28195 ) ) ( not ( = ?auto_28189 ?auto_28196 ) ) ( not ( = ?auto_28190 ?auto_28191 ) ) ( not ( = ?auto_28190 ?auto_28192 ) ) ( not ( = ?auto_28190 ?auto_28193 ) ) ( not ( = ?auto_28190 ?auto_28194 ) ) ( not ( = ?auto_28190 ?auto_28195 ) ) ( not ( = ?auto_28190 ?auto_28196 ) ) ( not ( = ?auto_28191 ?auto_28192 ) ) ( not ( = ?auto_28191 ?auto_28193 ) ) ( not ( = ?auto_28191 ?auto_28194 ) ) ( not ( = ?auto_28191 ?auto_28195 ) ) ( not ( = ?auto_28191 ?auto_28196 ) ) ( not ( = ?auto_28192 ?auto_28193 ) ) ( not ( = ?auto_28192 ?auto_28194 ) ) ( not ( = ?auto_28192 ?auto_28195 ) ) ( not ( = ?auto_28192 ?auto_28196 ) ) ( not ( = ?auto_28193 ?auto_28194 ) ) ( not ( = ?auto_28193 ?auto_28195 ) ) ( not ( = ?auto_28193 ?auto_28196 ) ) ( not ( = ?auto_28194 ?auto_28195 ) ) ( not ( = ?auto_28194 ?auto_28196 ) ) ( not ( = ?auto_28195 ?auto_28196 ) ) ( ON ?auto_28194 ?auto_28195 ) ( ON ?auto_28193 ?auto_28194 ) ( ON ?auto_28192 ?auto_28193 ) ( CLEAR ?auto_28190 ) ( ON ?auto_28191 ?auto_28192 ) ( CLEAR ?auto_28191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28189 ?auto_28190 ?auto_28191 )
      ( MAKE-7PILE ?auto_28189 ?auto_28190 ?auto_28191 ?auto_28192 ?auto_28193 ?auto_28194 ?auto_28195 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28204 - BLOCK
      ?auto_28205 - BLOCK
      ?auto_28206 - BLOCK
      ?auto_28207 - BLOCK
      ?auto_28208 - BLOCK
      ?auto_28209 - BLOCK
      ?auto_28210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28210 ) ( ON-TABLE ?auto_28204 ) ( ON ?auto_28205 ?auto_28204 ) ( not ( = ?auto_28204 ?auto_28205 ) ) ( not ( = ?auto_28204 ?auto_28206 ) ) ( not ( = ?auto_28204 ?auto_28207 ) ) ( not ( = ?auto_28204 ?auto_28208 ) ) ( not ( = ?auto_28204 ?auto_28209 ) ) ( not ( = ?auto_28204 ?auto_28210 ) ) ( not ( = ?auto_28205 ?auto_28206 ) ) ( not ( = ?auto_28205 ?auto_28207 ) ) ( not ( = ?auto_28205 ?auto_28208 ) ) ( not ( = ?auto_28205 ?auto_28209 ) ) ( not ( = ?auto_28205 ?auto_28210 ) ) ( not ( = ?auto_28206 ?auto_28207 ) ) ( not ( = ?auto_28206 ?auto_28208 ) ) ( not ( = ?auto_28206 ?auto_28209 ) ) ( not ( = ?auto_28206 ?auto_28210 ) ) ( not ( = ?auto_28207 ?auto_28208 ) ) ( not ( = ?auto_28207 ?auto_28209 ) ) ( not ( = ?auto_28207 ?auto_28210 ) ) ( not ( = ?auto_28208 ?auto_28209 ) ) ( not ( = ?auto_28208 ?auto_28210 ) ) ( not ( = ?auto_28209 ?auto_28210 ) ) ( ON ?auto_28209 ?auto_28210 ) ( ON ?auto_28208 ?auto_28209 ) ( ON ?auto_28207 ?auto_28208 ) ( CLEAR ?auto_28205 ) ( ON ?auto_28206 ?auto_28207 ) ( CLEAR ?auto_28206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_28204 ?auto_28205 ?auto_28206 )
      ( MAKE-7PILE ?auto_28204 ?auto_28205 ?auto_28206 ?auto_28207 ?auto_28208 ?auto_28209 ?auto_28210 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28218 - BLOCK
      ?auto_28219 - BLOCK
      ?auto_28220 - BLOCK
      ?auto_28221 - BLOCK
      ?auto_28222 - BLOCK
      ?auto_28223 - BLOCK
      ?auto_28224 - BLOCK
    )
    :vars
    (
      ?auto_28225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28224 ?auto_28225 ) ( ON-TABLE ?auto_28218 ) ( not ( = ?auto_28218 ?auto_28219 ) ) ( not ( = ?auto_28218 ?auto_28220 ) ) ( not ( = ?auto_28218 ?auto_28221 ) ) ( not ( = ?auto_28218 ?auto_28222 ) ) ( not ( = ?auto_28218 ?auto_28223 ) ) ( not ( = ?auto_28218 ?auto_28224 ) ) ( not ( = ?auto_28218 ?auto_28225 ) ) ( not ( = ?auto_28219 ?auto_28220 ) ) ( not ( = ?auto_28219 ?auto_28221 ) ) ( not ( = ?auto_28219 ?auto_28222 ) ) ( not ( = ?auto_28219 ?auto_28223 ) ) ( not ( = ?auto_28219 ?auto_28224 ) ) ( not ( = ?auto_28219 ?auto_28225 ) ) ( not ( = ?auto_28220 ?auto_28221 ) ) ( not ( = ?auto_28220 ?auto_28222 ) ) ( not ( = ?auto_28220 ?auto_28223 ) ) ( not ( = ?auto_28220 ?auto_28224 ) ) ( not ( = ?auto_28220 ?auto_28225 ) ) ( not ( = ?auto_28221 ?auto_28222 ) ) ( not ( = ?auto_28221 ?auto_28223 ) ) ( not ( = ?auto_28221 ?auto_28224 ) ) ( not ( = ?auto_28221 ?auto_28225 ) ) ( not ( = ?auto_28222 ?auto_28223 ) ) ( not ( = ?auto_28222 ?auto_28224 ) ) ( not ( = ?auto_28222 ?auto_28225 ) ) ( not ( = ?auto_28223 ?auto_28224 ) ) ( not ( = ?auto_28223 ?auto_28225 ) ) ( not ( = ?auto_28224 ?auto_28225 ) ) ( ON ?auto_28223 ?auto_28224 ) ( ON ?auto_28222 ?auto_28223 ) ( ON ?auto_28221 ?auto_28222 ) ( ON ?auto_28220 ?auto_28221 ) ( CLEAR ?auto_28218 ) ( ON ?auto_28219 ?auto_28220 ) ( CLEAR ?auto_28219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28218 ?auto_28219 )
      ( MAKE-7PILE ?auto_28218 ?auto_28219 ?auto_28220 ?auto_28221 ?auto_28222 ?auto_28223 ?auto_28224 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28233 - BLOCK
      ?auto_28234 - BLOCK
      ?auto_28235 - BLOCK
      ?auto_28236 - BLOCK
      ?auto_28237 - BLOCK
      ?auto_28238 - BLOCK
      ?auto_28239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28239 ) ( ON-TABLE ?auto_28233 ) ( not ( = ?auto_28233 ?auto_28234 ) ) ( not ( = ?auto_28233 ?auto_28235 ) ) ( not ( = ?auto_28233 ?auto_28236 ) ) ( not ( = ?auto_28233 ?auto_28237 ) ) ( not ( = ?auto_28233 ?auto_28238 ) ) ( not ( = ?auto_28233 ?auto_28239 ) ) ( not ( = ?auto_28234 ?auto_28235 ) ) ( not ( = ?auto_28234 ?auto_28236 ) ) ( not ( = ?auto_28234 ?auto_28237 ) ) ( not ( = ?auto_28234 ?auto_28238 ) ) ( not ( = ?auto_28234 ?auto_28239 ) ) ( not ( = ?auto_28235 ?auto_28236 ) ) ( not ( = ?auto_28235 ?auto_28237 ) ) ( not ( = ?auto_28235 ?auto_28238 ) ) ( not ( = ?auto_28235 ?auto_28239 ) ) ( not ( = ?auto_28236 ?auto_28237 ) ) ( not ( = ?auto_28236 ?auto_28238 ) ) ( not ( = ?auto_28236 ?auto_28239 ) ) ( not ( = ?auto_28237 ?auto_28238 ) ) ( not ( = ?auto_28237 ?auto_28239 ) ) ( not ( = ?auto_28238 ?auto_28239 ) ) ( ON ?auto_28238 ?auto_28239 ) ( ON ?auto_28237 ?auto_28238 ) ( ON ?auto_28236 ?auto_28237 ) ( ON ?auto_28235 ?auto_28236 ) ( CLEAR ?auto_28233 ) ( ON ?auto_28234 ?auto_28235 ) ( CLEAR ?auto_28234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_28233 ?auto_28234 )
      ( MAKE-7PILE ?auto_28233 ?auto_28234 ?auto_28235 ?auto_28236 ?auto_28237 ?auto_28238 ?auto_28239 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28247 - BLOCK
      ?auto_28248 - BLOCK
      ?auto_28249 - BLOCK
      ?auto_28250 - BLOCK
      ?auto_28251 - BLOCK
      ?auto_28252 - BLOCK
      ?auto_28253 - BLOCK
    )
    :vars
    (
      ?auto_28254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_28253 ?auto_28254 ) ( not ( = ?auto_28247 ?auto_28248 ) ) ( not ( = ?auto_28247 ?auto_28249 ) ) ( not ( = ?auto_28247 ?auto_28250 ) ) ( not ( = ?auto_28247 ?auto_28251 ) ) ( not ( = ?auto_28247 ?auto_28252 ) ) ( not ( = ?auto_28247 ?auto_28253 ) ) ( not ( = ?auto_28247 ?auto_28254 ) ) ( not ( = ?auto_28248 ?auto_28249 ) ) ( not ( = ?auto_28248 ?auto_28250 ) ) ( not ( = ?auto_28248 ?auto_28251 ) ) ( not ( = ?auto_28248 ?auto_28252 ) ) ( not ( = ?auto_28248 ?auto_28253 ) ) ( not ( = ?auto_28248 ?auto_28254 ) ) ( not ( = ?auto_28249 ?auto_28250 ) ) ( not ( = ?auto_28249 ?auto_28251 ) ) ( not ( = ?auto_28249 ?auto_28252 ) ) ( not ( = ?auto_28249 ?auto_28253 ) ) ( not ( = ?auto_28249 ?auto_28254 ) ) ( not ( = ?auto_28250 ?auto_28251 ) ) ( not ( = ?auto_28250 ?auto_28252 ) ) ( not ( = ?auto_28250 ?auto_28253 ) ) ( not ( = ?auto_28250 ?auto_28254 ) ) ( not ( = ?auto_28251 ?auto_28252 ) ) ( not ( = ?auto_28251 ?auto_28253 ) ) ( not ( = ?auto_28251 ?auto_28254 ) ) ( not ( = ?auto_28252 ?auto_28253 ) ) ( not ( = ?auto_28252 ?auto_28254 ) ) ( not ( = ?auto_28253 ?auto_28254 ) ) ( ON ?auto_28252 ?auto_28253 ) ( ON ?auto_28251 ?auto_28252 ) ( ON ?auto_28250 ?auto_28251 ) ( ON ?auto_28249 ?auto_28250 ) ( ON ?auto_28248 ?auto_28249 ) ( ON ?auto_28247 ?auto_28248 ) ( CLEAR ?auto_28247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28247 )
      ( MAKE-7PILE ?auto_28247 ?auto_28248 ?auto_28249 ?auto_28250 ?auto_28251 ?auto_28252 ?auto_28253 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28262 - BLOCK
      ?auto_28263 - BLOCK
      ?auto_28264 - BLOCK
      ?auto_28265 - BLOCK
      ?auto_28266 - BLOCK
      ?auto_28267 - BLOCK
      ?auto_28268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_28268 ) ( not ( = ?auto_28262 ?auto_28263 ) ) ( not ( = ?auto_28262 ?auto_28264 ) ) ( not ( = ?auto_28262 ?auto_28265 ) ) ( not ( = ?auto_28262 ?auto_28266 ) ) ( not ( = ?auto_28262 ?auto_28267 ) ) ( not ( = ?auto_28262 ?auto_28268 ) ) ( not ( = ?auto_28263 ?auto_28264 ) ) ( not ( = ?auto_28263 ?auto_28265 ) ) ( not ( = ?auto_28263 ?auto_28266 ) ) ( not ( = ?auto_28263 ?auto_28267 ) ) ( not ( = ?auto_28263 ?auto_28268 ) ) ( not ( = ?auto_28264 ?auto_28265 ) ) ( not ( = ?auto_28264 ?auto_28266 ) ) ( not ( = ?auto_28264 ?auto_28267 ) ) ( not ( = ?auto_28264 ?auto_28268 ) ) ( not ( = ?auto_28265 ?auto_28266 ) ) ( not ( = ?auto_28265 ?auto_28267 ) ) ( not ( = ?auto_28265 ?auto_28268 ) ) ( not ( = ?auto_28266 ?auto_28267 ) ) ( not ( = ?auto_28266 ?auto_28268 ) ) ( not ( = ?auto_28267 ?auto_28268 ) ) ( ON ?auto_28267 ?auto_28268 ) ( ON ?auto_28266 ?auto_28267 ) ( ON ?auto_28265 ?auto_28266 ) ( ON ?auto_28264 ?auto_28265 ) ( ON ?auto_28263 ?auto_28264 ) ( ON ?auto_28262 ?auto_28263 ) ( CLEAR ?auto_28262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_28262 )
      ( MAKE-7PILE ?auto_28262 ?auto_28263 ?auto_28264 ?auto_28265 ?auto_28266 ?auto_28267 ?auto_28268 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_28276 - BLOCK
      ?auto_28277 - BLOCK
      ?auto_28278 - BLOCK
      ?auto_28279 - BLOCK
      ?auto_28280 - BLOCK
      ?auto_28281 - BLOCK
      ?auto_28282 - BLOCK
    )
    :vars
    (
      ?auto_28283 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28276 ?auto_28277 ) ) ( not ( = ?auto_28276 ?auto_28278 ) ) ( not ( = ?auto_28276 ?auto_28279 ) ) ( not ( = ?auto_28276 ?auto_28280 ) ) ( not ( = ?auto_28276 ?auto_28281 ) ) ( not ( = ?auto_28276 ?auto_28282 ) ) ( not ( = ?auto_28277 ?auto_28278 ) ) ( not ( = ?auto_28277 ?auto_28279 ) ) ( not ( = ?auto_28277 ?auto_28280 ) ) ( not ( = ?auto_28277 ?auto_28281 ) ) ( not ( = ?auto_28277 ?auto_28282 ) ) ( not ( = ?auto_28278 ?auto_28279 ) ) ( not ( = ?auto_28278 ?auto_28280 ) ) ( not ( = ?auto_28278 ?auto_28281 ) ) ( not ( = ?auto_28278 ?auto_28282 ) ) ( not ( = ?auto_28279 ?auto_28280 ) ) ( not ( = ?auto_28279 ?auto_28281 ) ) ( not ( = ?auto_28279 ?auto_28282 ) ) ( not ( = ?auto_28280 ?auto_28281 ) ) ( not ( = ?auto_28280 ?auto_28282 ) ) ( not ( = ?auto_28281 ?auto_28282 ) ) ( ON ?auto_28276 ?auto_28283 ) ( not ( = ?auto_28282 ?auto_28283 ) ) ( not ( = ?auto_28281 ?auto_28283 ) ) ( not ( = ?auto_28280 ?auto_28283 ) ) ( not ( = ?auto_28279 ?auto_28283 ) ) ( not ( = ?auto_28278 ?auto_28283 ) ) ( not ( = ?auto_28277 ?auto_28283 ) ) ( not ( = ?auto_28276 ?auto_28283 ) ) ( ON ?auto_28277 ?auto_28276 ) ( ON ?auto_28278 ?auto_28277 ) ( ON ?auto_28279 ?auto_28278 ) ( ON ?auto_28280 ?auto_28279 ) ( ON ?auto_28281 ?auto_28280 ) ( ON ?auto_28282 ?auto_28281 ) ( CLEAR ?auto_28282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_28282 ?auto_28281 ?auto_28280 ?auto_28279 ?auto_28278 ?auto_28277 ?auto_28276 )
      ( MAKE-7PILE ?auto_28276 ?auto_28277 ?auto_28278 ?auto_28279 ?auto_28280 ?auto_28281 ?auto_28282 ) )
  )

)

