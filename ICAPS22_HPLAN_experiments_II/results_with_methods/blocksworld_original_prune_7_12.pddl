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
      ?auto_96711 - BLOCK
      ?auto_96712 - BLOCK
      ?auto_96713 - BLOCK
      ?auto_96714 - BLOCK
      ?auto_96715 - BLOCK
      ?auto_96716 - BLOCK
      ?auto_96717 - BLOCK
    )
    :vars
    (
      ?auto_96718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96718 ?auto_96717 ) ( CLEAR ?auto_96718 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96711 ) ( ON ?auto_96712 ?auto_96711 ) ( ON ?auto_96713 ?auto_96712 ) ( ON ?auto_96714 ?auto_96713 ) ( ON ?auto_96715 ?auto_96714 ) ( ON ?auto_96716 ?auto_96715 ) ( ON ?auto_96717 ?auto_96716 ) ( not ( = ?auto_96711 ?auto_96712 ) ) ( not ( = ?auto_96711 ?auto_96713 ) ) ( not ( = ?auto_96711 ?auto_96714 ) ) ( not ( = ?auto_96711 ?auto_96715 ) ) ( not ( = ?auto_96711 ?auto_96716 ) ) ( not ( = ?auto_96711 ?auto_96717 ) ) ( not ( = ?auto_96711 ?auto_96718 ) ) ( not ( = ?auto_96712 ?auto_96713 ) ) ( not ( = ?auto_96712 ?auto_96714 ) ) ( not ( = ?auto_96712 ?auto_96715 ) ) ( not ( = ?auto_96712 ?auto_96716 ) ) ( not ( = ?auto_96712 ?auto_96717 ) ) ( not ( = ?auto_96712 ?auto_96718 ) ) ( not ( = ?auto_96713 ?auto_96714 ) ) ( not ( = ?auto_96713 ?auto_96715 ) ) ( not ( = ?auto_96713 ?auto_96716 ) ) ( not ( = ?auto_96713 ?auto_96717 ) ) ( not ( = ?auto_96713 ?auto_96718 ) ) ( not ( = ?auto_96714 ?auto_96715 ) ) ( not ( = ?auto_96714 ?auto_96716 ) ) ( not ( = ?auto_96714 ?auto_96717 ) ) ( not ( = ?auto_96714 ?auto_96718 ) ) ( not ( = ?auto_96715 ?auto_96716 ) ) ( not ( = ?auto_96715 ?auto_96717 ) ) ( not ( = ?auto_96715 ?auto_96718 ) ) ( not ( = ?auto_96716 ?auto_96717 ) ) ( not ( = ?auto_96716 ?auto_96718 ) ) ( not ( = ?auto_96717 ?auto_96718 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96718 ?auto_96717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96720 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_96720 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_96720 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_96721 - BLOCK
    )
    :vars
    (
      ?auto_96722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96721 ?auto_96722 ) ( CLEAR ?auto_96721 ) ( HAND-EMPTY ) ( not ( = ?auto_96721 ?auto_96722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96721 ?auto_96722 )
      ( MAKE-1PILE ?auto_96721 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96729 - BLOCK
      ?auto_96730 - BLOCK
      ?auto_96731 - BLOCK
      ?auto_96732 - BLOCK
      ?auto_96733 - BLOCK
      ?auto_96734 - BLOCK
    )
    :vars
    (
      ?auto_96735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96735 ?auto_96734 ) ( CLEAR ?auto_96735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96729 ) ( ON ?auto_96730 ?auto_96729 ) ( ON ?auto_96731 ?auto_96730 ) ( ON ?auto_96732 ?auto_96731 ) ( ON ?auto_96733 ?auto_96732 ) ( ON ?auto_96734 ?auto_96733 ) ( not ( = ?auto_96729 ?auto_96730 ) ) ( not ( = ?auto_96729 ?auto_96731 ) ) ( not ( = ?auto_96729 ?auto_96732 ) ) ( not ( = ?auto_96729 ?auto_96733 ) ) ( not ( = ?auto_96729 ?auto_96734 ) ) ( not ( = ?auto_96729 ?auto_96735 ) ) ( not ( = ?auto_96730 ?auto_96731 ) ) ( not ( = ?auto_96730 ?auto_96732 ) ) ( not ( = ?auto_96730 ?auto_96733 ) ) ( not ( = ?auto_96730 ?auto_96734 ) ) ( not ( = ?auto_96730 ?auto_96735 ) ) ( not ( = ?auto_96731 ?auto_96732 ) ) ( not ( = ?auto_96731 ?auto_96733 ) ) ( not ( = ?auto_96731 ?auto_96734 ) ) ( not ( = ?auto_96731 ?auto_96735 ) ) ( not ( = ?auto_96732 ?auto_96733 ) ) ( not ( = ?auto_96732 ?auto_96734 ) ) ( not ( = ?auto_96732 ?auto_96735 ) ) ( not ( = ?auto_96733 ?auto_96734 ) ) ( not ( = ?auto_96733 ?auto_96735 ) ) ( not ( = ?auto_96734 ?auto_96735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96735 ?auto_96734 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96736 - BLOCK
      ?auto_96737 - BLOCK
      ?auto_96738 - BLOCK
      ?auto_96739 - BLOCK
      ?auto_96740 - BLOCK
      ?auto_96741 - BLOCK
    )
    :vars
    (
      ?auto_96742 - BLOCK
      ?auto_96743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96742 ?auto_96741 ) ( CLEAR ?auto_96742 ) ( ON-TABLE ?auto_96736 ) ( ON ?auto_96737 ?auto_96736 ) ( ON ?auto_96738 ?auto_96737 ) ( ON ?auto_96739 ?auto_96738 ) ( ON ?auto_96740 ?auto_96739 ) ( ON ?auto_96741 ?auto_96740 ) ( not ( = ?auto_96736 ?auto_96737 ) ) ( not ( = ?auto_96736 ?auto_96738 ) ) ( not ( = ?auto_96736 ?auto_96739 ) ) ( not ( = ?auto_96736 ?auto_96740 ) ) ( not ( = ?auto_96736 ?auto_96741 ) ) ( not ( = ?auto_96736 ?auto_96742 ) ) ( not ( = ?auto_96737 ?auto_96738 ) ) ( not ( = ?auto_96737 ?auto_96739 ) ) ( not ( = ?auto_96737 ?auto_96740 ) ) ( not ( = ?auto_96737 ?auto_96741 ) ) ( not ( = ?auto_96737 ?auto_96742 ) ) ( not ( = ?auto_96738 ?auto_96739 ) ) ( not ( = ?auto_96738 ?auto_96740 ) ) ( not ( = ?auto_96738 ?auto_96741 ) ) ( not ( = ?auto_96738 ?auto_96742 ) ) ( not ( = ?auto_96739 ?auto_96740 ) ) ( not ( = ?auto_96739 ?auto_96741 ) ) ( not ( = ?auto_96739 ?auto_96742 ) ) ( not ( = ?auto_96740 ?auto_96741 ) ) ( not ( = ?auto_96740 ?auto_96742 ) ) ( not ( = ?auto_96741 ?auto_96742 ) ) ( HOLDING ?auto_96743 ) ( not ( = ?auto_96736 ?auto_96743 ) ) ( not ( = ?auto_96737 ?auto_96743 ) ) ( not ( = ?auto_96738 ?auto_96743 ) ) ( not ( = ?auto_96739 ?auto_96743 ) ) ( not ( = ?auto_96740 ?auto_96743 ) ) ( not ( = ?auto_96741 ?auto_96743 ) ) ( not ( = ?auto_96742 ?auto_96743 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_96743 )
      ( MAKE-6PILE ?auto_96736 ?auto_96737 ?auto_96738 ?auto_96739 ?auto_96740 ?auto_96741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_96744 - BLOCK
      ?auto_96745 - BLOCK
      ?auto_96746 - BLOCK
      ?auto_96747 - BLOCK
      ?auto_96748 - BLOCK
      ?auto_96749 - BLOCK
    )
    :vars
    (
      ?auto_96750 - BLOCK
      ?auto_96751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96750 ?auto_96749 ) ( ON-TABLE ?auto_96744 ) ( ON ?auto_96745 ?auto_96744 ) ( ON ?auto_96746 ?auto_96745 ) ( ON ?auto_96747 ?auto_96746 ) ( ON ?auto_96748 ?auto_96747 ) ( ON ?auto_96749 ?auto_96748 ) ( not ( = ?auto_96744 ?auto_96745 ) ) ( not ( = ?auto_96744 ?auto_96746 ) ) ( not ( = ?auto_96744 ?auto_96747 ) ) ( not ( = ?auto_96744 ?auto_96748 ) ) ( not ( = ?auto_96744 ?auto_96749 ) ) ( not ( = ?auto_96744 ?auto_96750 ) ) ( not ( = ?auto_96745 ?auto_96746 ) ) ( not ( = ?auto_96745 ?auto_96747 ) ) ( not ( = ?auto_96745 ?auto_96748 ) ) ( not ( = ?auto_96745 ?auto_96749 ) ) ( not ( = ?auto_96745 ?auto_96750 ) ) ( not ( = ?auto_96746 ?auto_96747 ) ) ( not ( = ?auto_96746 ?auto_96748 ) ) ( not ( = ?auto_96746 ?auto_96749 ) ) ( not ( = ?auto_96746 ?auto_96750 ) ) ( not ( = ?auto_96747 ?auto_96748 ) ) ( not ( = ?auto_96747 ?auto_96749 ) ) ( not ( = ?auto_96747 ?auto_96750 ) ) ( not ( = ?auto_96748 ?auto_96749 ) ) ( not ( = ?auto_96748 ?auto_96750 ) ) ( not ( = ?auto_96749 ?auto_96750 ) ) ( not ( = ?auto_96744 ?auto_96751 ) ) ( not ( = ?auto_96745 ?auto_96751 ) ) ( not ( = ?auto_96746 ?auto_96751 ) ) ( not ( = ?auto_96747 ?auto_96751 ) ) ( not ( = ?auto_96748 ?auto_96751 ) ) ( not ( = ?auto_96749 ?auto_96751 ) ) ( not ( = ?auto_96750 ?auto_96751 ) ) ( ON ?auto_96751 ?auto_96750 ) ( CLEAR ?auto_96751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96744 ?auto_96745 ?auto_96746 ?auto_96747 ?auto_96748 ?auto_96749 ?auto_96750 )
      ( MAKE-6PILE ?auto_96744 ?auto_96745 ?auto_96746 ?auto_96747 ?auto_96748 ?auto_96749 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96754 - BLOCK
      ?auto_96755 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_96755 ) ( CLEAR ?auto_96754 ) ( ON-TABLE ?auto_96754 ) ( not ( = ?auto_96754 ?auto_96755 ) ) )
    :subtasks
    ( ( !STACK ?auto_96755 ?auto_96754 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96756 - BLOCK
      ?auto_96757 - BLOCK
    )
    :vars
    (
      ?auto_96758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96756 ) ( ON-TABLE ?auto_96756 ) ( not ( = ?auto_96756 ?auto_96757 ) ) ( ON ?auto_96757 ?auto_96758 ) ( CLEAR ?auto_96757 ) ( HAND-EMPTY ) ( not ( = ?auto_96756 ?auto_96758 ) ) ( not ( = ?auto_96757 ?auto_96758 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96757 ?auto_96758 )
      ( MAKE-2PILE ?auto_96756 ?auto_96757 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96759 - BLOCK
      ?auto_96760 - BLOCK
    )
    :vars
    (
      ?auto_96761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96759 ?auto_96760 ) ) ( ON ?auto_96760 ?auto_96761 ) ( CLEAR ?auto_96760 ) ( not ( = ?auto_96759 ?auto_96761 ) ) ( not ( = ?auto_96760 ?auto_96761 ) ) ( HOLDING ?auto_96759 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96759 )
      ( MAKE-2PILE ?auto_96759 ?auto_96760 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_96762 - BLOCK
      ?auto_96763 - BLOCK
    )
    :vars
    (
      ?auto_96764 - BLOCK
      ?auto_96769 - BLOCK
      ?auto_96768 - BLOCK
      ?auto_96767 - BLOCK
      ?auto_96766 - BLOCK
      ?auto_96765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96762 ?auto_96763 ) ) ( ON ?auto_96763 ?auto_96764 ) ( not ( = ?auto_96762 ?auto_96764 ) ) ( not ( = ?auto_96763 ?auto_96764 ) ) ( ON ?auto_96762 ?auto_96763 ) ( CLEAR ?auto_96762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96769 ) ( ON ?auto_96768 ?auto_96769 ) ( ON ?auto_96767 ?auto_96768 ) ( ON ?auto_96766 ?auto_96767 ) ( ON ?auto_96765 ?auto_96766 ) ( ON ?auto_96764 ?auto_96765 ) ( not ( = ?auto_96769 ?auto_96768 ) ) ( not ( = ?auto_96769 ?auto_96767 ) ) ( not ( = ?auto_96769 ?auto_96766 ) ) ( not ( = ?auto_96769 ?auto_96765 ) ) ( not ( = ?auto_96769 ?auto_96764 ) ) ( not ( = ?auto_96769 ?auto_96763 ) ) ( not ( = ?auto_96769 ?auto_96762 ) ) ( not ( = ?auto_96768 ?auto_96767 ) ) ( not ( = ?auto_96768 ?auto_96766 ) ) ( not ( = ?auto_96768 ?auto_96765 ) ) ( not ( = ?auto_96768 ?auto_96764 ) ) ( not ( = ?auto_96768 ?auto_96763 ) ) ( not ( = ?auto_96768 ?auto_96762 ) ) ( not ( = ?auto_96767 ?auto_96766 ) ) ( not ( = ?auto_96767 ?auto_96765 ) ) ( not ( = ?auto_96767 ?auto_96764 ) ) ( not ( = ?auto_96767 ?auto_96763 ) ) ( not ( = ?auto_96767 ?auto_96762 ) ) ( not ( = ?auto_96766 ?auto_96765 ) ) ( not ( = ?auto_96766 ?auto_96764 ) ) ( not ( = ?auto_96766 ?auto_96763 ) ) ( not ( = ?auto_96766 ?auto_96762 ) ) ( not ( = ?auto_96765 ?auto_96764 ) ) ( not ( = ?auto_96765 ?auto_96763 ) ) ( not ( = ?auto_96765 ?auto_96762 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96769 ?auto_96768 ?auto_96767 ?auto_96766 ?auto_96765 ?auto_96764 ?auto_96763 )
      ( MAKE-2PILE ?auto_96762 ?auto_96763 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96775 - BLOCK
      ?auto_96776 - BLOCK
      ?auto_96777 - BLOCK
      ?auto_96778 - BLOCK
      ?auto_96779 - BLOCK
    )
    :vars
    (
      ?auto_96780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96780 ?auto_96779 ) ( CLEAR ?auto_96780 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96775 ) ( ON ?auto_96776 ?auto_96775 ) ( ON ?auto_96777 ?auto_96776 ) ( ON ?auto_96778 ?auto_96777 ) ( ON ?auto_96779 ?auto_96778 ) ( not ( = ?auto_96775 ?auto_96776 ) ) ( not ( = ?auto_96775 ?auto_96777 ) ) ( not ( = ?auto_96775 ?auto_96778 ) ) ( not ( = ?auto_96775 ?auto_96779 ) ) ( not ( = ?auto_96775 ?auto_96780 ) ) ( not ( = ?auto_96776 ?auto_96777 ) ) ( not ( = ?auto_96776 ?auto_96778 ) ) ( not ( = ?auto_96776 ?auto_96779 ) ) ( not ( = ?auto_96776 ?auto_96780 ) ) ( not ( = ?auto_96777 ?auto_96778 ) ) ( not ( = ?auto_96777 ?auto_96779 ) ) ( not ( = ?auto_96777 ?auto_96780 ) ) ( not ( = ?auto_96778 ?auto_96779 ) ) ( not ( = ?auto_96778 ?auto_96780 ) ) ( not ( = ?auto_96779 ?auto_96780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96780 ?auto_96779 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96781 - BLOCK
      ?auto_96782 - BLOCK
      ?auto_96783 - BLOCK
      ?auto_96784 - BLOCK
      ?auto_96785 - BLOCK
    )
    :vars
    (
      ?auto_96786 - BLOCK
      ?auto_96787 - BLOCK
      ?auto_96788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96786 ?auto_96785 ) ( CLEAR ?auto_96786 ) ( ON-TABLE ?auto_96781 ) ( ON ?auto_96782 ?auto_96781 ) ( ON ?auto_96783 ?auto_96782 ) ( ON ?auto_96784 ?auto_96783 ) ( ON ?auto_96785 ?auto_96784 ) ( not ( = ?auto_96781 ?auto_96782 ) ) ( not ( = ?auto_96781 ?auto_96783 ) ) ( not ( = ?auto_96781 ?auto_96784 ) ) ( not ( = ?auto_96781 ?auto_96785 ) ) ( not ( = ?auto_96781 ?auto_96786 ) ) ( not ( = ?auto_96782 ?auto_96783 ) ) ( not ( = ?auto_96782 ?auto_96784 ) ) ( not ( = ?auto_96782 ?auto_96785 ) ) ( not ( = ?auto_96782 ?auto_96786 ) ) ( not ( = ?auto_96783 ?auto_96784 ) ) ( not ( = ?auto_96783 ?auto_96785 ) ) ( not ( = ?auto_96783 ?auto_96786 ) ) ( not ( = ?auto_96784 ?auto_96785 ) ) ( not ( = ?auto_96784 ?auto_96786 ) ) ( not ( = ?auto_96785 ?auto_96786 ) ) ( HOLDING ?auto_96787 ) ( CLEAR ?auto_96788 ) ( not ( = ?auto_96781 ?auto_96787 ) ) ( not ( = ?auto_96781 ?auto_96788 ) ) ( not ( = ?auto_96782 ?auto_96787 ) ) ( not ( = ?auto_96782 ?auto_96788 ) ) ( not ( = ?auto_96783 ?auto_96787 ) ) ( not ( = ?auto_96783 ?auto_96788 ) ) ( not ( = ?auto_96784 ?auto_96787 ) ) ( not ( = ?auto_96784 ?auto_96788 ) ) ( not ( = ?auto_96785 ?auto_96787 ) ) ( not ( = ?auto_96785 ?auto_96788 ) ) ( not ( = ?auto_96786 ?auto_96787 ) ) ( not ( = ?auto_96786 ?auto_96788 ) ) ( not ( = ?auto_96787 ?auto_96788 ) ) )
    :subtasks
    ( ( !STACK ?auto_96787 ?auto_96788 )
      ( MAKE-5PILE ?auto_96781 ?auto_96782 ?auto_96783 ?auto_96784 ?auto_96785 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97707 - BLOCK
      ?auto_97708 - BLOCK
      ?auto_97709 - BLOCK
      ?auto_97710 - BLOCK
      ?auto_97711 - BLOCK
    )
    :vars
    (
      ?auto_97712 - BLOCK
      ?auto_97713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97712 ?auto_97711 ) ( ON-TABLE ?auto_97707 ) ( ON ?auto_97708 ?auto_97707 ) ( ON ?auto_97709 ?auto_97708 ) ( ON ?auto_97710 ?auto_97709 ) ( ON ?auto_97711 ?auto_97710 ) ( not ( = ?auto_97707 ?auto_97708 ) ) ( not ( = ?auto_97707 ?auto_97709 ) ) ( not ( = ?auto_97707 ?auto_97710 ) ) ( not ( = ?auto_97707 ?auto_97711 ) ) ( not ( = ?auto_97707 ?auto_97712 ) ) ( not ( = ?auto_97708 ?auto_97709 ) ) ( not ( = ?auto_97708 ?auto_97710 ) ) ( not ( = ?auto_97708 ?auto_97711 ) ) ( not ( = ?auto_97708 ?auto_97712 ) ) ( not ( = ?auto_97709 ?auto_97710 ) ) ( not ( = ?auto_97709 ?auto_97711 ) ) ( not ( = ?auto_97709 ?auto_97712 ) ) ( not ( = ?auto_97710 ?auto_97711 ) ) ( not ( = ?auto_97710 ?auto_97712 ) ) ( not ( = ?auto_97711 ?auto_97712 ) ) ( not ( = ?auto_97707 ?auto_97713 ) ) ( not ( = ?auto_97708 ?auto_97713 ) ) ( not ( = ?auto_97709 ?auto_97713 ) ) ( not ( = ?auto_97710 ?auto_97713 ) ) ( not ( = ?auto_97711 ?auto_97713 ) ) ( not ( = ?auto_97712 ?auto_97713 ) ) ( ON ?auto_97713 ?auto_97712 ) ( CLEAR ?auto_97713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97707 ?auto_97708 ?auto_97709 ?auto_97710 ?auto_97711 ?auto_97712 )
      ( MAKE-5PILE ?auto_97707 ?auto_97708 ?auto_97709 ?auto_97710 ?auto_97711 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96797 - BLOCK
      ?auto_96798 - BLOCK
      ?auto_96799 - BLOCK
      ?auto_96800 - BLOCK
      ?auto_96801 - BLOCK
    )
    :vars
    (
      ?auto_96802 - BLOCK
      ?auto_96804 - BLOCK
      ?auto_96803 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96802 ?auto_96801 ) ( ON-TABLE ?auto_96797 ) ( ON ?auto_96798 ?auto_96797 ) ( ON ?auto_96799 ?auto_96798 ) ( ON ?auto_96800 ?auto_96799 ) ( ON ?auto_96801 ?auto_96800 ) ( not ( = ?auto_96797 ?auto_96798 ) ) ( not ( = ?auto_96797 ?auto_96799 ) ) ( not ( = ?auto_96797 ?auto_96800 ) ) ( not ( = ?auto_96797 ?auto_96801 ) ) ( not ( = ?auto_96797 ?auto_96802 ) ) ( not ( = ?auto_96798 ?auto_96799 ) ) ( not ( = ?auto_96798 ?auto_96800 ) ) ( not ( = ?auto_96798 ?auto_96801 ) ) ( not ( = ?auto_96798 ?auto_96802 ) ) ( not ( = ?auto_96799 ?auto_96800 ) ) ( not ( = ?auto_96799 ?auto_96801 ) ) ( not ( = ?auto_96799 ?auto_96802 ) ) ( not ( = ?auto_96800 ?auto_96801 ) ) ( not ( = ?auto_96800 ?auto_96802 ) ) ( not ( = ?auto_96801 ?auto_96802 ) ) ( not ( = ?auto_96797 ?auto_96804 ) ) ( not ( = ?auto_96797 ?auto_96803 ) ) ( not ( = ?auto_96798 ?auto_96804 ) ) ( not ( = ?auto_96798 ?auto_96803 ) ) ( not ( = ?auto_96799 ?auto_96804 ) ) ( not ( = ?auto_96799 ?auto_96803 ) ) ( not ( = ?auto_96800 ?auto_96804 ) ) ( not ( = ?auto_96800 ?auto_96803 ) ) ( not ( = ?auto_96801 ?auto_96804 ) ) ( not ( = ?auto_96801 ?auto_96803 ) ) ( not ( = ?auto_96802 ?auto_96804 ) ) ( not ( = ?auto_96802 ?auto_96803 ) ) ( not ( = ?auto_96804 ?auto_96803 ) ) ( ON ?auto_96804 ?auto_96802 ) ( CLEAR ?auto_96804 ) ( HOLDING ?auto_96803 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96803 )
      ( MAKE-5PILE ?auto_96797 ?auto_96798 ?auto_96799 ?auto_96800 ?auto_96801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_96805 - BLOCK
      ?auto_96806 - BLOCK
      ?auto_96807 - BLOCK
      ?auto_96808 - BLOCK
      ?auto_96809 - BLOCK
    )
    :vars
    (
      ?auto_96810 - BLOCK
      ?auto_96812 - BLOCK
      ?auto_96811 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96810 ?auto_96809 ) ( ON-TABLE ?auto_96805 ) ( ON ?auto_96806 ?auto_96805 ) ( ON ?auto_96807 ?auto_96806 ) ( ON ?auto_96808 ?auto_96807 ) ( ON ?auto_96809 ?auto_96808 ) ( not ( = ?auto_96805 ?auto_96806 ) ) ( not ( = ?auto_96805 ?auto_96807 ) ) ( not ( = ?auto_96805 ?auto_96808 ) ) ( not ( = ?auto_96805 ?auto_96809 ) ) ( not ( = ?auto_96805 ?auto_96810 ) ) ( not ( = ?auto_96806 ?auto_96807 ) ) ( not ( = ?auto_96806 ?auto_96808 ) ) ( not ( = ?auto_96806 ?auto_96809 ) ) ( not ( = ?auto_96806 ?auto_96810 ) ) ( not ( = ?auto_96807 ?auto_96808 ) ) ( not ( = ?auto_96807 ?auto_96809 ) ) ( not ( = ?auto_96807 ?auto_96810 ) ) ( not ( = ?auto_96808 ?auto_96809 ) ) ( not ( = ?auto_96808 ?auto_96810 ) ) ( not ( = ?auto_96809 ?auto_96810 ) ) ( not ( = ?auto_96805 ?auto_96812 ) ) ( not ( = ?auto_96805 ?auto_96811 ) ) ( not ( = ?auto_96806 ?auto_96812 ) ) ( not ( = ?auto_96806 ?auto_96811 ) ) ( not ( = ?auto_96807 ?auto_96812 ) ) ( not ( = ?auto_96807 ?auto_96811 ) ) ( not ( = ?auto_96808 ?auto_96812 ) ) ( not ( = ?auto_96808 ?auto_96811 ) ) ( not ( = ?auto_96809 ?auto_96812 ) ) ( not ( = ?auto_96809 ?auto_96811 ) ) ( not ( = ?auto_96810 ?auto_96812 ) ) ( not ( = ?auto_96810 ?auto_96811 ) ) ( not ( = ?auto_96812 ?auto_96811 ) ) ( ON ?auto_96812 ?auto_96810 ) ( ON ?auto_96811 ?auto_96812 ) ( CLEAR ?auto_96811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96805 ?auto_96806 ?auto_96807 ?auto_96808 ?auto_96809 ?auto_96810 ?auto_96812 )
      ( MAKE-5PILE ?auto_96805 ?auto_96806 ?auto_96807 ?auto_96808 ?auto_96809 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96816 - BLOCK
      ?auto_96817 - BLOCK
      ?auto_96818 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_96818 ) ( CLEAR ?auto_96817 ) ( ON-TABLE ?auto_96816 ) ( ON ?auto_96817 ?auto_96816 ) ( not ( = ?auto_96816 ?auto_96817 ) ) ( not ( = ?auto_96816 ?auto_96818 ) ) ( not ( = ?auto_96817 ?auto_96818 ) ) )
    :subtasks
    ( ( !STACK ?auto_96818 ?auto_96817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96819 - BLOCK
      ?auto_96820 - BLOCK
      ?auto_96821 - BLOCK
    )
    :vars
    (
      ?auto_96822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96820 ) ( ON-TABLE ?auto_96819 ) ( ON ?auto_96820 ?auto_96819 ) ( not ( = ?auto_96819 ?auto_96820 ) ) ( not ( = ?auto_96819 ?auto_96821 ) ) ( not ( = ?auto_96820 ?auto_96821 ) ) ( ON ?auto_96821 ?auto_96822 ) ( CLEAR ?auto_96821 ) ( HAND-EMPTY ) ( not ( = ?auto_96819 ?auto_96822 ) ) ( not ( = ?auto_96820 ?auto_96822 ) ) ( not ( = ?auto_96821 ?auto_96822 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96821 ?auto_96822 )
      ( MAKE-3PILE ?auto_96819 ?auto_96820 ?auto_96821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96823 - BLOCK
      ?auto_96824 - BLOCK
      ?auto_96825 - BLOCK
    )
    :vars
    (
      ?auto_96826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96823 ) ( not ( = ?auto_96823 ?auto_96824 ) ) ( not ( = ?auto_96823 ?auto_96825 ) ) ( not ( = ?auto_96824 ?auto_96825 ) ) ( ON ?auto_96825 ?auto_96826 ) ( CLEAR ?auto_96825 ) ( not ( = ?auto_96823 ?auto_96826 ) ) ( not ( = ?auto_96824 ?auto_96826 ) ) ( not ( = ?auto_96825 ?auto_96826 ) ) ( HOLDING ?auto_96824 ) ( CLEAR ?auto_96823 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96823 ?auto_96824 )
      ( MAKE-3PILE ?auto_96823 ?auto_96824 ?auto_96825 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96827 - BLOCK
      ?auto_96828 - BLOCK
      ?auto_96829 - BLOCK
    )
    :vars
    (
      ?auto_96830 - BLOCK
      ?auto_96834 - BLOCK
      ?auto_96831 - BLOCK
      ?auto_96833 - BLOCK
      ?auto_96832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96827 ) ( not ( = ?auto_96827 ?auto_96828 ) ) ( not ( = ?auto_96827 ?auto_96829 ) ) ( not ( = ?auto_96828 ?auto_96829 ) ) ( ON ?auto_96829 ?auto_96830 ) ( not ( = ?auto_96827 ?auto_96830 ) ) ( not ( = ?auto_96828 ?auto_96830 ) ) ( not ( = ?auto_96829 ?auto_96830 ) ) ( CLEAR ?auto_96827 ) ( ON ?auto_96828 ?auto_96829 ) ( CLEAR ?auto_96828 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96834 ) ( ON ?auto_96831 ?auto_96834 ) ( ON ?auto_96833 ?auto_96831 ) ( ON ?auto_96832 ?auto_96833 ) ( ON ?auto_96830 ?auto_96832 ) ( not ( = ?auto_96834 ?auto_96831 ) ) ( not ( = ?auto_96834 ?auto_96833 ) ) ( not ( = ?auto_96834 ?auto_96832 ) ) ( not ( = ?auto_96834 ?auto_96830 ) ) ( not ( = ?auto_96834 ?auto_96829 ) ) ( not ( = ?auto_96834 ?auto_96828 ) ) ( not ( = ?auto_96831 ?auto_96833 ) ) ( not ( = ?auto_96831 ?auto_96832 ) ) ( not ( = ?auto_96831 ?auto_96830 ) ) ( not ( = ?auto_96831 ?auto_96829 ) ) ( not ( = ?auto_96831 ?auto_96828 ) ) ( not ( = ?auto_96833 ?auto_96832 ) ) ( not ( = ?auto_96833 ?auto_96830 ) ) ( not ( = ?auto_96833 ?auto_96829 ) ) ( not ( = ?auto_96833 ?auto_96828 ) ) ( not ( = ?auto_96832 ?auto_96830 ) ) ( not ( = ?auto_96832 ?auto_96829 ) ) ( not ( = ?auto_96832 ?auto_96828 ) ) ( not ( = ?auto_96827 ?auto_96834 ) ) ( not ( = ?auto_96827 ?auto_96831 ) ) ( not ( = ?auto_96827 ?auto_96833 ) ) ( not ( = ?auto_96827 ?auto_96832 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96834 ?auto_96831 ?auto_96833 ?auto_96832 ?auto_96830 ?auto_96829 )
      ( MAKE-3PILE ?auto_96827 ?auto_96828 ?auto_96829 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96835 - BLOCK
      ?auto_96836 - BLOCK
      ?auto_96837 - BLOCK
    )
    :vars
    (
      ?auto_96839 - BLOCK
      ?auto_96838 - BLOCK
      ?auto_96841 - BLOCK
      ?auto_96840 - BLOCK
      ?auto_96842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96835 ?auto_96836 ) ) ( not ( = ?auto_96835 ?auto_96837 ) ) ( not ( = ?auto_96836 ?auto_96837 ) ) ( ON ?auto_96837 ?auto_96839 ) ( not ( = ?auto_96835 ?auto_96839 ) ) ( not ( = ?auto_96836 ?auto_96839 ) ) ( not ( = ?auto_96837 ?auto_96839 ) ) ( ON ?auto_96836 ?auto_96837 ) ( CLEAR ?auto_96836 ) ( ON-TABLE ?auto_96838 ) ( ON ?auto_96841 ?auto_96838 ) ( ON ?auto_96840 ?auto_96841 ) ( ON ?auto_96842 ?auto_96840 ) ( ON ?auto_96839 ?auto_96842 ) ( not ( = ?auto_96838 ?auto_96841 ) ) ( not ( = ?auto_96838 ?auto_96840 ) ) ( not ( = ?auto_96838 ?auto_96842 ) ) ( not ( = ?auto_96838 ?auto_96839 ) ) ( not ( = ?auto_96838 ?auto_96837 ) ) ( not ( = ?auto_96838 ?auto_96836 ) ) ( not ( = ?auto_96841 ?auto_96840 ) ) ( not ( = ?auto_96841 ?auto_96842 ) ) ( not ( = ?auto_96841 ?auto_96839 ) ) ( not ( = ?auto_96841 ?auto_96837 ) ) ( not ( = ?auto_96841 ?auto_96836 ) ) ( not ( = ?auto_96840 ?auto_96842 ) ) ( not ( = ?auto_96840 ?auto_96839 ) ) ( not ( = ?auto_96840 ?auto_96837 ) ) ( not ( = ?auto_96840 ?auto_96836 ) ) ( not ( = ?auto_96842 ?auto_96839 ) ) ( not ( = ?auto_96842 ?auto_96837 ) ) ( not ( = ?auto_96842 ?auto_96836 ) ) ( not ( = ?auto_96835 ?auto_96838 ) ) ( not ( = ?auto_96835 ?auto_96841 ) ) ( not ( = ?auto_96835 ?auto_96840 ) ) ( not ( = ?auto_96835 ?auto_96842 ) ) ( HOLDING ?auto_96835 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96835 )
      ( MAKE-3PILE ?auto_96835 ?auto_96836 ?auto_96837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96843 - BLOCK
      ?auto_96844 - BLOCK
      ?auto_96845 - BLOCK
    )
    :vars
    (
      ?auto_96848 - BLOCK
      ?auto_96847 - BLOCK
      ?auto_96849 - BLOCK
      ?auto_96846 - BLOCK
      ?auto_96850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96843 ?auto_96844 ) ) ( not ( = ?auto_96843 ?auto_96845 ) ) ( not ( = ?auto_96844 ?auto_96845 ) ) ( ON ?auto_96845 ?auto_96848 ) ( not ( = ?auto_96843 ?auto_96848 ) ) ( not ( = ?auto_96844 ?auto_96848 ) ) ( not ( = ?auto_96845 ?auto_96848 ) ) ( ON ?auto_96844 ?auto_96845 ) ( ON-TABLE ?auto_96847 ) ( ON ?auto_96849 ?auto_96847 ) ( ON ?auto_96846 ?auto_96849 ) ( ON ?auto_96850 ?auto_96846 ) ( ON ?auto_96848 ?auto_96850 ) ( not ( = ?auto_96847 ?auto_96849 ) ) ( not ( = ?auto_96847 ?auto_96846 ) ) ( not ( = ?auto_96847 ?auto_96850 ) ) ( not ( = ?auto_96847 ?auto_96848 ) ) ( not ( = ?auto_96847 ?auto_96845 ) ) ( not ( = ?auto_96847 ?auto_96844 ) ) ( not ( = ?auto_96849 ?auto_96846 ) ) ( not ( = ?auto_96849 ?auto_96850 ) ) ( not ( = ?auto_96849 ?auto_96848 ) ) ( not ( = ?auto_96849 ?auto_96845 ) ) ( not ( = ?auto_96849 ?auto_96844 ) ) ( not ( = ?auto_96846 ?auto_96850 ) ) ( not ( = ?auto_96846 ?auto_96848 ) ) ( not ( = ?auto_96846 ?auto_96845 ) ) ( not ( = ?auto_96846 ?auto_96844 ) ) ( not ( = ?auto_96850 ?auto_96848 ) ) ( not ( = ?auto_96850 ?auto_96845 ) ) ( not ( = ?auto_96850 ?auto_96844 ) ) ( not ( = ?auto_96843 ?auto_96847 ) ) ( not ( = ?auto_96843 ?auto_96849 ) ) ( not ( = ?auto_96843 ?auto_96846 ) ) ( not ( = ?auto_96843 ?auto_96850 ) ) ( ON ?auto_96843 ?auto_96844 ) ( CLEAR ?auto_96843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96847 ?auto_96849 ?auto_96846 ?auto_96850 ?auto_96848 ?auto_96845 ?auto_96844 )
      ( MAKE-3PILE ?auto_96843 ?auto_96844 ?auto_96845 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96855 - BLOCK
      ?auto_96856 - BLOCK
      ?auto_96857 - BLOCK
      ?auto_96858 - BLOCK
    )
    :vars
    (
      ?auto_96859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96859 ?auto_96858 ) ( CLEAR ?auto_96859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96855 ) ( ON ?auto_96856 ?auto_96855 ) ( ON ?auto_96857 ?auto_96856 ) ( ON ?auto_96858 ?auto_96857 ) ( not ( = ?auto_96855 ?auto_96856 ) ) ( not ( = ?auto_96855 ?auto_96857 ) ) ( not ( = ?auto_96855 ?auto_96858 ) ) ( not ( = ?auto_96855 ?auto_96859 ) ) ( not ( = ?auto_96856 ?auto_96857 ) ) ( not ( = ?auto_96856 ?auto_96858 ) ) ( not ( = ?auto_96856 ?auto_96859 ) ) ( not ( = ?auto_96857 ?auto_96858 ) ) ( not ( = ?auto_96857 ?auto_96859 ) ) ( not ( = ?auto_96858 ?auto_96859 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96859 ?auto_96858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96860 - BLOCK
      ?auto_96861 - BLOCK
      ?auto_96862 - BLOCK
      ?auto_96863 - BLOCK
    )
    :vars
    (
      ?auto_96864 - BLOCK
      ?auto_96865 - BLOCK
      ?auto_96866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96864 ?auto_96863 ) ( CLEAR ?auto_96864 ) ( ON-TABLE ?auto_96860 ) ( ON ?auto_96861 ?auto_96860 ) ( ON ?auto_96862 ?auto_96861 ) ( ON ?auto_96863 ?auto_96862 ) ( not ( = ?auto_96860 ?auto_96861 ) ) ( not ( = ?auto_96860 ?auto_96862 ) ) ( not ( = ?auto_96860 ?auto_96863 ) ) ( not ( = ?auto_96860 ?auto_96864 ) ) ( not ( = ?auto_96861 ?auto_96862 ) ) ( not ( = ?auto_96861 ?auto_96863 ) ) ( not ( = ?auto_96861 ?auto_96864 ) ) ( not ( = ?auto_96862 ?auto_96863 ) ) ( not ( = ?auto_96862 ?auto_96864 ) ) ( not ( = ?auto_96863 ?auto_96864 ) ) ( HOLDING ?auto_96865 ) ( CLEAR ?auto_96866 ) ( not ( = ?auto_96860 ?auto_96865 ) ) ( not ( = ?auto_96860 ?auto_96866 ) ) ( not ( = ?auto_96861 ?auto_96865 ) ) ( not ( = ?auto_96861 ?auto_96866 ) ) ( not ( = ?auto_96862 ?auto_96865 ) ) ( not ( = ?auto_96862 ?auto_96866 ) ) ( not ( = ?auto_96863 ?auto_96865 ) ) ( not ( = ?auto_96863 ?auto_96866 ) ) ( not ( = ?auto_96864 ?auto_96865 ) ) ( not ( = ?auto_96864 ?auto_96866 ) ) ( not ( = ?auto_96865 ?auto_96866 ) ) )
    :subtasks
    ( ( !STACK ?auto_96865 ?auto_96866 )
      ( MAKE-4PILE ?auto_96860 ?auto_96861 ?auto_96862 ?auto_96863 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96867 - BLOCK
      ?auto_96868 - BLOCK
      ?auto_96869 - BLOCK
      ?auto_96870 - BLOCK
    )
    :vars
    (
      ?auto_96871 - BLOCK
      ?auto_96873 - BLOCK
      ?auto_96872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96871 ?auto_96870 ) ( ON-TABLE ?auto_96867 ) ( ON ?auto_96868 ?auto_96867 ) ( ON ?auto_96869 ?auto_96868 ) ( ON ?auto_96870 ?auto_96869 ) ( not ( = ?auto_96867 ?auto_96868 ) ) ( not ( = ?auto_96867 ?auto_96869 ) ) ( not ( = ?auto_96867 ?auto_96870 ) ) ( not ( = ?auto_96867 ?auto_96871 ) ) ( not ( = ?auto_96868 ?auto_96869 ) ) ( not ( = ?auto_96868 ?auto_96870 ) ) ( not ( = ?auto_96868 ?auto_96871 ) ) ( not ( = ?auto_96869 ?auto_96870 ) ) ( not ( = ?auto_96869 ?auto_96871 ) ) ( not ( = ?auto_96870 ?auto_96871 ) ) ( CLEAR ?auto_96873 ) ( not ( = ?auto_96867 ?auto_96872 ) ) ( not ( = ?auto_96867 ?auto_96873 ) ) ( not ( = ?auto_96868 ?auto_96872 ) ) ( not ( = ?auto_96868 ?auto_96873 ) ) ( not ( = ?auto_96869 ?auto_96872 ) ) ( not ( = ?auto_96869 ?auto_96873 ) ) ( not ( = ?auto_96870 ?auto_96872 ) ) ( not ( = ?auto_96870 ?auto_96873 ) ) ( not ( = ?auto_96871 ?auto_96872 ) ) ( not ( = ?auto_96871 ?auto_96873 ) ) ( not ( = ?auto_96872 ?auto_96873 ) ) ( ON ?auto_96872 ?auto_96871 ) ( CLEAR ?auto_96872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96867 ?auto_96868 ?auto_96869 ?auto_96870 ?auto_96871 )
      ( MAKE-4PILE ?auto_96867 ?auto_96868 ?auto_96869 ?auto_96870 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96874 - BLOCK
      ?auto_96875 - BLOCK
      ?auto_96876 - BLOCK
      ?auto_96877 - BLOCK
    )
    :vars
    (
      ?auto_96878 - BLOCK
      ?auto_96880 - BLOCK
      ?auto_96879 - BLOCK
      ?auto_96881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96878 ?auto_96877 ) ( ON-TABLE ?auto_96874 ) ( ON ?auto_96875 ?auto_96874 ) ( ON ?auto_96876 ?auto_96875 ) ( ON ?auto_96877 ?auto_96876 ) ( not ( = ?auto_96874 ?auto_96875 ) ) ( not ( = ?auto_96874 ?auto_96876 ) ) ( not ( = ?auto_96874 ?auto_96877 ) ) ( not ( = ?auto_96874 ?auto_96878 ) ) ( not ( = ?auto_96875 ?auto_96876 ) ) ( not ( = ?auto_96875 ?auto_96877 ) ) ( not ( = ?auto_96875 ?auto_96878 ) ) ( not ( = ?auto_96876 ?auto_96877 ) ) ( not ( = ?auto_96876 ?auto_96878 ) ) ( not ( = ?auto_96877 ?auto_96878 ) ) ( not ( = ?auto_96874 ?auto_96880 ) ) ( not ( = ?auto_96874 ?auto_96879 ) ) ( not ( = ?auto_96875 ?auto_96880 ) ) ( not ( = ?auto_96875 ?auto_96879 ) ) ( not ( = ?auto_96876 ?auto_96880 ) ) ( not ( = ?auto_96876 ?auto_96879 ) ) ( not ( = ?auto_96877 ?auto_96880 ) ) ( not ( = ?auto_96877 ?auto_96879 ) ) ( not ( = ?auto_96878 ?auto_96880 ) ) ( not ( = ?auto_96878 ?auto_96879 ) ) ( not ( = ?auto_96880 ?auto_96879 ) ) ( ON ?auto_96880 ?auto_96878 ) ( CLEAR ?auto_96880 ) ( HOLDING ?auto_96879 ) ( CLEAR ?auto_96881 ) ( ON-TABLE ?auto_96881 ) ( not ( = ?auto_96881 ?auto_96879 ) ) ( not ( = ?auto_96874 ?auto_96881 ) ) ( not ( = ?auto_96875 ?auto_96881 ) ) ( not ( = ?auto_96876 ?auto_96881 ) ) ( not ( = ?auto_96877 ?auto_96881 ) ) ( not ( = ?auto_96878 ?auto_96881 ) ) ( not ( = ?auto_96880 ?auto_96881 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96881 ?auto_96879 )
      ( MAKE-4PILE ?auto_96874 ?auto_96875 ?auto_96876 ?auto_96877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97936 - BLOCK
      ?auto_97937 - BLOCK
      ?auto_97938 - BLOCK
      ?auto_97939 - BLOCK
    )
    :vars
    (
      ?auto_97940 - BLOCK
      ?auto_97941 - BLOCK
      ?auto_97942 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97940 ?auto_97939 ) ( ON-TABLE ?auto_97936 ) ( ON ?auto_97937 ?auto_97936 ) ( ON ?auto_97938 ?auto_97937 ) ( ON ?auto_97939 ?auto_97938 ) ( not ( = ?auto_97936 ?auto_97937 ) ) ( not ( = ?auto_97936 ?auto_97938 ) ) ( not ( = ?auto_97936 ?auto_97939 ) ) ( not ( = ?auto_97936 ?auto_97940 ) ) ( not ( = ?auto_97937 ?auto_97938 ) ) ( not ( = ?auto_97937 ?auto_97939 ) ) ( not ( = ?auto_97937 ?auto_97940 ) ) ( not ( = ?auto_97938 ?auto_97939 ) ) ( not ( = ?auto_97938 ?auto_97940 ) ) ( not ( = ?auto_97939 ?auto_97940 ) ) ( not ( = ?auto_97936 ?auto_97941 ) ) ( not ( = ?auto_97936 ?auto_97942 ) ) ( not ( = ?auto_97937 ?auto_97941 ) ) ( not ( = ?auto_97937 ?auto_97942 ) ) ( not ( = ?auto_97938 ?auto_97941 ) ) ( not ( = ?auto_97938 ?auto_97942 ) ) ( not ( = ?auto_97939 ?auto_97941 ) ) ( not ( = ?auto_97939 ?auto_97942 ) ) ( not ( = ?auto_97940 ?auto_97941 ) ) ( not ( = ?auto_97940 ?auto_97942 ) ) ( not ( = ?auto_97941 ?auto_97942 ) ) ( ON ?auto_97941 ?auto_97940 ) ( ON ?auto_97942 ?auto_97941 ) ( CLEAR ?auto_97942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97936 ?auto_97937 ?auto_97938 ?auto_97939 ?auto_97940 ?auto_97941 )
      ( MAKE-4PILE ?auto_97936 ?auto_97937 ?auto_97938 ?auto_97939 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96890 - BLOCK
      ?auto_96891 - BLOCK
      ?auto_96892 - BLOCK
      ?auto_96893 - BLOCK
    )
    :vars
    (
      ?auto_96897 - BLOCK
      ?auto_96894 - BLOCK
      ?auto_96895 - BLOCK
      ?auto_96896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96897 ?auto_96893 ) ( ON-TABLE ?auto_96890 ) ( ON ?auto_96891 ?auto_96890 ) ( ON ?auto_96892 ?auto_96891 ) ( ON ?auto_96893 ?auto_96892 ) ( not ( = ?auto_96890 ?auto_96891 ) ) ( not ( = ?auto_96890 ?auto_96892 ) ) ( not ( = ?auto_96890 ?auto_96893 ) ) ( not ( = ?auto_96890 ?auto_96897 ) ) ( not ( = ?auto_96891 ?auto_96892 ) ) ( not ( = ?auto_96891 ?auto_96893 ) ) ( not ( = ?auto_96891 ?auto_96897 ) ) ( not ( = ?auto_96892 ?auto_96893 ) ) ( not ( = ?auto_96892 ?auto_96897 ) ) ( not ( = ?auto_96893 ?auto_96897 ) ) ( not ( = ?auto_96890 ?auto_96894 ) ) ( not ( = ?auto_96890 ?auto_96895 ) ) ( not ( = ?auto_96891 ?auto_96894 ) ) ( not ( = ?auto_96891 ?auto_96895 ) ) ( not ( = ?auto_96892 ?auto_96894 ) ) ( not ( = ?auto_96892 ?auto_96895 ) ) ( not ( = ?auto_96893 ?auto_96894 ) ) ( not ( = ?auto_96893 ?auto_96895 ) ) ( not ( = ?auto_96897 ?auto_96894 ) ) ( not ( = ?auto_96897 ?auto_96895 ) ) ( not ( = ?auto_96894 ?auto_96895 ) ) ( ON ?auto_96894 ?auto_96897 ) ( not ( = ?auto_96896 ?auto_96895 ) ) ( not ( = ?auto_96890 ?auto_96896 ) ) ( not ( = ?auto_96891 ?auto_96896 ) ) ( not ( = ?auto_96892 ?auto_96896 ) ) ( not ( = ?auto_96893 ?auto_96896 ) ) ( not ( = ?auto_96897 ?auto_96896 ) ) ( not ( = ?auto_96894 ?auto_96896 ) ) ( ON ?auto_96895 ?auto_96894 ) ( CLEAR ?auto_96895 ) ( HOLDING ?auto_96896 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96896 )
      ( MAKE-4PILE ?auto_96890 ?auto_96891 ?auto_96892 ?auto_96893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96898 - BLOCK
      ?auto_96899 - BLOCK
      ?auto_96900 - BLOCK
      ?auto_96901 - BLOCK
    )
    :vars
    (
      ?auto_96902 - BLOCK
      ?auto_96905 - BLOCK
      ?auto_96903 - BLOCK
      ?auto_96904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96902 ?auto_96901 ) ( ON-TABLE ?auto_96898 ) ( ON ?auto_96899 ?auto_96898 ) ( ON ?auto_96900 ?auto_96899 ) ( ON ?auto_96901 ?auto_96900 ) ( not ( = ?auto_96898 ?auto_96899 ) ) ( not ( = ?auto_96898 ?auto_96900 ) ) ( not ( = ?auto_96898 ?auto_96901 ) ) ( not ( = ?auto_96898 ?auto_96902 ) ) ( not ( = ?auto_96899 ?auto_96900 ) ) ( not ( = ?auto_96899 ?auto_96901 ) ) ( not ( = ?auto_96899 ?auto_96902 ) ) ( not ( = ?auto_96900 ?auto_96901 ) ) ( not ( = ?auto_96900 ?auto_96902 ) ) ( not ( = ?auto_96901 ?auto_96902 ) ) ( not ( = ?auto_96898 ?auto_96905 ) ) ( not ( = ?auto_96898 ?auto_96903 ) ) ( not ( = ?auto_96899 ?auto_96905 ) ) ( not ( = ?auto_96899 ?auto_96903 ) ) ( not ( = ?auto_96900 ?auto_96905 ) ) ( not ( = ?auto_96900 ?auto_96903 ) ) ( not ( = ?auto_96901 ?auto_96905 ) ) ( not ( = ?auto_96901 ?auto_96903 ) ) ( not ( = ?auto_96902 ?auto_96905 ) ) ( not ( = ?auto_96902 ?auto_96903 ) ) ( not ( = ?auto_96905 ?auto_96903 ) ) ( ON ?auto_96905 ?auto_96902 ) ( not ( = ?auto_96904 ?auto_96903 ) ) ( not ( = ?auto_96898 ?auto_96904 ) ) ( not ( = ?auto_96899 ?auto_96904 ) ) ( not ( = ?auto_96900 ?auto_96904 ) ) ( not ( = ?auto_96901 ?auto_96904 ) ) ( not ( = ?auto_96902 ?auto_96904 ) ) ( not ( = ?auto_96905 ?auto_96904 ) ) ( ON ?auto_96903 ?auto_96905 ) ( ON ?auto_96904 ?auto_96903 ) ( CLEAR ?auto_96904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96898 ?auto_96899 ?auto_96900 ?auto_96901 ?auto_96902 ?auto_96905 ?auto_96903 )
      ( MAKE-4PILE ?auto_96898 ?auto_96899 ?auto_96900 ?auto_96901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96910 - BLOCK
      ?auto_96911 - BLOCK
      ?auto_96912 - BLOCK
      ?auto_96913 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_96913 ) ( CLEAR ?auto_96912 ) ( ON-TABLE ?auto_96910 ) ( ON ?auto_96911 ?auto_96910 ) ( ON ?auto_96912 ?auto_96911 ) ( not ( = ?auto_96910 ?auto_96911 ) ) ( not ( = ?auto_96910 ?auto_96912 ) ) ( not ( = ?auto_96910 ?auto_96913 ) ) ( not ( = ?auto_96911 ?auto_96912 ) ) ( not ( = ?auto_96911 ?auto_96913 ) ) ( not ( = ?auto_96912 ?auto_96913 ) ) )
    :subtasks
    ( ( !STACK ?auto_96913 ?auto_96912 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96914 - BLOCK
      ?auto_96915 - BLOCK
      ?auto_96916 - BLOCK
      ?auto_96917 - BLOCK
    )
    :vars
    (
      ?auto_96918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_96916 ) ( ON-TABLE ?auto_96914 ) ( ON ?auto_96915 ?auto_96914 ) ( ON ?auto_96916 ?auto_96915 ) ( not ( = ?auto_96914 ?auto_96915 ) ) ( not ( = ?auto_96914 ?auto_96916 ) ) ( not ( = ?auto_96914 ?auto_96917 ) ) ( not ( = ?auto_96915 ?auto_96916 ) ) ( not ( = ?auto_96915 ?auto_96917 ) ) ( not ( = ?auto_96916 ?auto_96917 ) ) ( ON ?auto_96917 ?auto_96918 ) ( CLEAR ?auto_96917 ) ( HAND-EMPTY ) ( not ( = ?auto_96914 ?auto_96918 ) ) ( not ( = ?auto_96915 ?auto_96918 ) ) ( not ( = ?auto_96916 ?auto_96918 ) ) ( not ( = ?auto_96917 ?auto_96918 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96917 ?auto_96918 )
      ( MAKE-4PILE ?auto_96914 ?auto_96915 ?auto_96916 ?auto_96917 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96919 - BLOCK
      ?auto_96920 - BLOCK
      ?auto_96921 - BLOCK
      ?auto_96922 - BLOCK
    )
    :vars
    (
      ?auto_96923 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96919 ) ( ON ?auto_96920 ?auto_96919 ) ( not ( = ?auto_96919 ?auto_96920 ) ) ( not ( = ?auto_96919 ?auto_96921 ) ) ( not ( = ?auto_96919 ?auto_96922 ) ) ( not ( = ?auto_96920 ?auto_96921 ) ) ( not ( = ?auto_96920 ?auto_96922 ) ) ( not ( = ?auto_96921 ?auto_96922 ) ) ( ON ?auto_96922 ?auto_96923 ) ( CLEAR ?auto_96922 ) ( not ( = ?auto_96919 ?auto_96923 ) ) ( not ( = ?auto_96920 ?auto_96923 ) ) ( not ( = ?auto_96921 ?auto_96923 ) ) ( not ( = ?auto_96922 ?auto_96923 ) ) ( HOLDING ?auto_96921 ) ( CLEAR ?auto_96920 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96919 ?auto_96920 ?auto_96921 )
      ( MAKE-4PILE ?auto_96919 ?auto_96920 ?auto_96921 ?auto_96922 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96924 - BLOCK
      ?auto_96925 - BLOCK
      ?auto_96926 - BLOCK
      ?auto_96927 - BLOCK
    )
    :vars
    (
      ?auto_96928 - BLOCK
      ?auto_96929 - BLOCK
      ?auto_96930 - BLOCK
      ?auto_96931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96924 ) ( ON ?auto_96925 ?auto_96924 ) ( not ( = ?auto_96924 ?auto_96925 ) ) ( not ( = ?auto_96924 ?auto_96926 ) ) ( not ( = ?auto_96924 ?auto_96927 ) ) ( not ( = ?auto_96925 ?auto_96926 ) ) ( not ( = ?auto_96925 ?auto_96927 ) ) ( not ( = ?auto_96926 ?auto_96927 ) ) ( ON ?auto_96927 ?auto_96928 ) ( not ( = ?auto_96924 ?auto_96928 ) ) ( not ( = ?auto_96925 ?auto_96928 ) ) ( not ( = ?auto_96926 ?auto_96928 ) ) ( not ( = ?auto_96927 ?auto_96928 ) ) ( CLEAR ?auto_96925 ) ( ON ?auto_96926 ?auto_96927 ) ( CLEAR ?auto_96926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96929 ) ( ON ?auto_96930 ?auto_96929 ) ( ON ?auto_96931 ?auto_96930 ) ( ON ?auto_96928 ?auto_96931 ) ( not ( = ?auto_96929 ?auto_96930 ) ) ( not ( = ?auto_96929 ?auto_96931 ) ) ( not ( = ?auto_96929 ?auto_96928 ) ) ( not ( = ?auto_96929 ?auto_96927 ) ) ( not ( = ?auto_96929 ?auto_96926 ) ) ( not ( = ?auto_96930 ?auto_96931 ) ) ( not ( = ?auto_96930 ?auto_96928 ) ) ( not ( = ?auto_96930 ?auto_96927 ) ) ( not ( = ?auto_96930 ?auto_96926 ) ) ( not ( = ?auto_96931 ?auto_96928 ) ) ( not ( = ?auto_96931 ?auto_96927 ) ) ( not ( = ?auto_96931 ?auto_96926 ) ) ( not ( = ?auto_96924 ?auto_96929 ) ) ( not ( = ?auto_96924 ?auto_96930 ) ) ( not ( = ?auto_96924 ?auto_96931 ) ) ( not ( = ?auto_96925 ?auto_96929 ) ) ( not ( = ?auto_96925 ?auto_96930 ) ) ( not ( = ?auto_96925 ?auto_96931 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96929 ?auto_96930 ?auto_96931 ?auto_96928 ?auto_96927 )
      ( MAKE-4PILE ?auto_96924 ?auto_96925 ?auto_96926 ?auto_96927 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96932 - BLOCK
      ?auto_96933 - BLOCK
      ?auto_96934 - BLOCK
      ?auto_96935 - BLOCK
    )
    :vars
    (
      ?auto_96937 - BLOCK
      ?auto_96939 - BLOCK
      ?auto_96938 - BLOCK
      ?auto_96936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96932 ) ( not ( = ?auto_96932 ?auto_96933 ) ) ( not ( = ?auto_96932 ?auto_96934 ) ) ( not ( = ?auto_96932 ?auto_96935 ) ) ( not ( = ?auto_96933 ?auto_96934 ) ) ( not ( = ?auto_96933 ?auto_96935 ) ) ( not ( = ?auto_96934 ?auto_96935 ) ) ( ON ?auto_96935 ?auto_96937 ) ( not ( = ?auto_96932 ?auto_96937 ) ) ( not ( = ?auto_96933 ?auto_96937 ) ) ( not ( = ?auto_96934 ?auto_96937 ) ) ( not ( = ?auto_96935 ?auto_96937 ) ) ( ON ?auto_96934 ?auto_96935 ) ( CLEAR ?auto_96934 ) ( ON-TABLE ?auto_96939 ) ( ON ?auto_96938 ?auto_96939 ) ( ON ?auto_96936 ?auto_96938 ) ( ON ?auto_96937 ?auto_96936 ) ( not ( = ?auto_96939 ?auto_96938 ) ) ( not ( = ?auto_96939 ?auto_96936 ) ) ( not ( = ?auto_96939 ?auto_96937 ) ) ( not ( = ?auto_96939 ?auto_96935 ) ) ( not ( = ?auto_96939 ?auto_96934 ) ) ( not ( = ?auto_96938 ?auto_96936 ) ) ( not ( = ?auto_96938 ?auto_96937 ) ) ( not ( = ?auto_96938 ?auto_96935 ) ) ( not ( = ?auto_96938 ?auto_96934 ) ) ( not ( = ?auto_96936 ?auto_96937 ) ) ( not ( = ?auto_96936 ?auto_96935 ) ) ( not ( = ?auto_96936 ?auto_96934 ) ) ( not ( = ?auto_96932 ?auto_96939 ) ) ( not ( = ?auto_96932 ?auto_96938 ) ) ( not ( = ?auto_96932 ?auto_96936 ) ) ( not ( = ?auto_96933 ?auto_96939 ) ) ( not ( = ?auto_96933 ?auto_96938 ) ) ( not ( = ?auto_96933 ?auto_96936 ) ) ( HOLDING ?auto_96933 ) ( CLEAR ?auto_96932 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_96932 ?auto_96933 )
      ( MAKE-4PILE ?auto_96932 ?auto_96933 ?auto_96934 ?auto_96935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96940 - BLOCK
      ?auto_96941 - BLOCK
      ?auto_96942 - BLOCK
      ?auto_96943 - BLOCK
    )
    :vars
    (
      ?auto_96946 - BLOCK
      ?auto_96945 - BLOCK
      ?auto_96947 - BLOCK
      ?auto_96944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_96940 ) ( not ( = ?auto_96940 ?auto_96941 ) ) ( not ( = ?auto_96940 ?auto_96942 ) ) ( not ( = ?auto_96940 ?auto_96943 ) ) ( not ( = ?auto_96941 ?auto_96942 ) ) ( not ( = ?auto_96941 ?auto_96943 ) ) ( not ( = ?auto_96942 ?auto_96943 ) ) ( ON ?auto_96943 ?auto_96946 ) ( not ( = ?auto_96940 ?auto_96946 ) ) ( not ( = ?auto_96941 ?auto_96946 ) ) ( not ( = ?auto_96942 ?auto_96946 ) ) ( not ( = ?auto_96943 ?auto_96946 ) ) ( ON ?auto_96942 ?auto_96943 ) ( ON-TABLE ?auto_96945 ) ( ON ?auto_96947 ?auto_96945 ) ( ON ?auto_96944 ?auto_96947 ) ( ON ?auto_96946 ?auto_96944 ) ( not ( = ?auto_96945 ?auto_96947 ) ) ( not ( = ?auto_96945 ?auto_96944 ) ) ( not ( = ?auto_96945 ?auto_96946 ) ) ( not ( = ?auto_96945 ?auto_96943 ) ) ( not ( = ?auto_96945 ?auto_96942 ) ) ( not ( = ?auto_96947 ?auto_96944 ) ) ( not ( = ?auto_96947 ?auto_96946 ) ) ( not ( = ?auto_96947 ?auto_96943 ) ) ( not ( = ?auto_96947 ?auto_96942 ) ) ( not ( = ?auto_96944 ?auto_96946 ) ) ( not ( = ?auto_96944 ?auto_96943 ) ) ( not ( = ?auto_96944 ?auto_96942 ) ) ( not ( = ?auto_96940 ?auto_96945 ) ) ( not ( = ?auto_96940 ?auto_96947 ) ) ( not ( = ?auto_96940 ?auto_96944 ) ) ( not ( = ?auto_96941 ?auto_96945 ) ) ( not ( = ?auto_96941 ?auto_96947 ) ) ( not ( = ?auto_96941 ?auto_96944 ) ) ( CLEAR ?auto_96940 ) ( ON ?auto_96941 ?auto_96942 ) ( CLEAR ?auto_96941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_96945 ?auto_96947 ?auto_96944 ?auto_96946 ?auto_96943 ?auto_96942 )
      ( MAKE-4PILE ?auto_96940 ?auto_96941 ?auto_96942 ?auto_96943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96948 - BLOCK
      ?auto_96949 - BLOCK
      ?auto_96950 - BLOCK
      ?auto_96951 - BLOCK
    )
    :vars
    (
      ?auto_96953 - BLOCK
      ?auto_96954 - BLOCK
      ?auto_96955 - BLOCK
      ?auto_96952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96948 ?auto_96949 ) ) ( not ( = ?auto_96948 ?auto_96950 ) ) ( not ( = ?auto_96948 ?auto_96951 ) ) ( not ( = ?auto_96949 ?auto_96950 ) ) ( not ( = ?auto_96949 ?auto_96951 ) ) ( not ( = ?auto_96950 ?auto_96951 ) ) ( ON ?auto_96951 ?auto_96953 ) ( not ( = ?auto_96948 ?auto_96953 ) ) ( not ( = ?auto_96949 ?auto_96953 ) ) ( not ( = ?auto_96950 ?auto_96953 ) ) ( not ( = ?auto_96951 ?auto_96953 ) ) ( ON ?auto_96950 ?auto_96951 ) ( ON-TABLE ?auto_96954 ) ( ON ?auto_96955 ?auto_96954 ) ( ON ?auto_96952 ?auto_96955 ) ( ON ?auto_96953 ?auto_96952 ) ( not ( = ?auto_96954 ?auto_96955 ) ) ( not ( = ?auto_96954 ?auto_96952 ) ) ( not ( = ?auto_96954 ?auto_96953 ) ) ( not ( = ?auto_96954 ?auto_96951 ) ) ( not ( = ?auto_96954 ?auto_96950 ) ) ( not ( = ?auto_96955 ?auto_96952 ) ) ( not ( = ?auto_96955 ?auto_96953 ) ) ( not ( = ?auto_96955 ?auto_96951 ) ) ( not ( = ?auto_96955 ?auto_96950 ) ) ( not ( = ?auto_96952 ?auto_96953 ) ) ( not ( = ?auto_96952 ?auto_96951 ) ) ( not ( = ?auto_96952 ?auto_96950 ) ) ( not ( = ?auto_96948 ?auto_96954 ) ) ( not ( = ?auto_96948 ?auto_96955 ) ) ( not ( = ?auto_96948 ?auto_96952 ) ) ( not ( = ?auto_96949 ?auto_96954 ) ) ( not ( = ?auto_96949 ?auto_96955 ) ) ( not ( = ?auto_96949 ?auto_96952 ) ) ( ON ?auto_96949 ?auto_96950 ) ( CLEAR ?auto_96949 ) ( HOLDING ?auto_96948 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_96948 )
      ( MAKE-4PILE ?auto_96948 ?auto_96949 ?auto_96950 ?auto_96951 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_96956 - BLOCK
      ?auto_96957 - BLOCK
      ?auto_96958 - BLOCK
      ?auto_96959 - BLOCK
    )
    :vars
    (
      ?auto_96963 - BLOCK
      ?auto_96960 - BLOCK
      ?auto_96962 - BLOCK
      ?auto_96961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_96956 ?auto_96957 ) ) ( not ( = ?auto_96956 ?auto_96958 ) ) ( not ( = ?auto_96956 ?auto_96959 ) ) ( not ( = ?auto_96957 ?auto_96958 ) ) ( not ( = ?auto_96957 ?auto_96959 ) ) ( not ( = ?auto_96958 ?auto_96959 ) ) ( ON ?auto_96959 ?auto_96963 ) ( not ( = ?auto_96956 ?auto_96963 ) ) ( not ( = ?auto_96957 ?auto_96963 ) ) ( not ( = ?auto_96958 ?auto_96963 ) ) ( not ( = ?auto_96959 ?auto_96963 ) ) ( ON ?auto_96958 ?auto_96959 ) ( ON-TABLE ?auto_96960 ) ( ON ?auto_96962 ?auto_96960 ) ( ON ?auto_96961 ?auto_96962 ) ( ON ?auto_96963 ?auto_96961 ) ( not ( = ?auto_96960 ?auto_96962 ) ) ( not ( = ?auto_96960 ?auto_96961 ) ) ( not ( = ?auto_96960 ?auto_96963 ) ) ( not ( = ?auto_96960 ?auto_96959 ) ) ( not ( = ?auto_96960 ?auto_96958 ) ) ( not ( = ?auto_96962 ?auto_96961 ) ) ( not ( = ?auto_96962 ?auto_96963 ) ) ( not ( = ?auto_96962 ?auto_96959 ) ) ( not ( = ?auto_96962 ?auto_96958 ) ) ( not ( = ?auto_96961 ?auto_96963 ) ) ( not ( = ?auto_96961 ?auto_96959 ) ) ( not ( = ?auto_96961 ?auto_96958 ) ) ( not ( = ?auto_96956 ?auto_96960 ) ) ( not ( = ?auto_96956 ?auto_96962 ) ) ( not ( = ?auto_96956 ?auto_96961 ) ) ( not ( = ?auto_96957 ?auto_96960 ) ) ( not ( = ?auto_96957 ?auto_96962 ) ) ( not ( = ?auto_96957 ?auto_96961 ) ) ( ON ?auto_96957 ?auto_96958 ) ( ON ?auto_96956 ?auto_96957 ) ( CLEAR ?auto_96956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_96960 ?auto_96962 ?auto_96961 ?auto_96963 ?auto_96959 ?auto_96958 ?auto_96957 )
      ( MAKE-4PILE ?auto_96956 ?auto_96957 ?auto_96958 ?auto_96959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96967 - BLOCK
      ?auto_96968 - BLOCK
      ?auto_96969 - BLOCK
    )
    :vars
    (
      ?auto_96970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96970 ?auto_96969 ) ( CLEAR ?auto_96970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_96967 ) ( ON ?auto_96968 ?auto_96967 ) ( ON ?auto_96969 ?auto_96968 ) ( not ( = ?auto_96967 ?auto_96968 ) ) ( not ( = ?auto_96967 ?auto_96969 ) ) ( not ( = ?auto_96967 ?auto_96970 ) ) ( not ( = ?auto_96968 ?auto_96969 ) ) ( not ( = ?auto_96968 ?auto_96970 ) ) ( not ( = ?auto_96969 ?auto_96970 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96970 ?auto_96969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96971 - BLOCK
      ?auto_96972 - BLOCK
      ?auto_96973 - BLOCK
    )
    :vars
    (
      ?auto_96974 - BLOCK
      ?auto_96975 - BLOCK
      ?auto_96976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96974 ?auto_96973 ) ( CLEAR ?auto_96974 ) ( ON-TABLE ?auto_96971 ) ( ON ?auto_96972 ?auto_96971 ) ( ON ?auto_96973 ?auto_96972 ) ( not ( = ?auto_96971 ?auto_96972 ) ) ( not ( = ?auto_96971 ?auto_96973 ) ) ( not ( = ?auto_96971 ?auto_96974 ) ) ( not ( = ?auto_96972 ?auto_96973 ) ) ( not ( = ?auto_96972 ?auto_96974 ) ) ( not ( = ?auto_96973 ?auto_96974 ) ) ( HOLDING ?auto_96975 ) ( CLEAR ?auto_96976 ) ( not ( = ?auto_96971 ?auto_96975 ) ) ( not ( = ?auto_96971 ?auto_96976 ) ) ( not ( = ?auto_96972 ?auto_96975 ) ) ( not ( = ?auto_96972 ?auto_96976 ) ) ( not ( = ?auto_96973 ?auto_96975 ) ) ( not ( = ?auto_96973 ?auto_96976 ) ) ( not ( = ?auto_96974 ?auto_96975 ) ) ( not ( = ?auto_96974 ?auto_96976 ) ) ( not ( = ?auto_96975 ?auto_96976 ) ) )
    :subtasks
    ( ( !STACK ?auto_96975 ?auto_96976 )
      ( MAKE-3PILE ?auto_96971 ?auto_96972 ?auto_96973 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96977 - BLOCK
      ?auto_96978 - BLOCK
      ?auto_96979 - BLOCK
    )
    :vars
    (
      ?auto_96980 - BLOCK
      ?auto_96982 - BLOCK
      ?auto_96981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96980 ?auto_96979 ) ( ON-TABLE ?auto_96977 ) ( ON ?auto_96978 ?auto_96977 ) ( ON ?auto_96979 ?auto_96978 ) ( not ( = ?auto_96977 ?auto_96978 ) ) ( not ( = ?auto_96977 ?auto_96979 ) ) ( not ( = ?auto_96977 ?auto_96980 ) ) ( not ( = ?auto_96978 ?auto_96979 ) ) ( not ( = ?auto_96978 ?auto_96980 ) ) ( not ( = ?auto_96979 ?auto_96980 ) ) ( CLEAR ?auto_96982 ) ( not ( = ?auto_96977 ?auto_96981 ) ) ( not ( = ?auto_96977 ?auto_96982 ) ) ( not ( = ?auto_96978 ?auto_96981 ) ) ( not ( = ?auto_96978 ?auto_96982 ) ) ( not ( = ?auto_96979 ?auto_96981 ) ) ( not ( = ?auto_96979 ?auto_96982 ) ) ( not ( = ?auto_96980 ?auto_96981 ) ) ( not ( = ?auto_96980 ?auto_96982 ) ) ( not ( = ?auto_96981 ?auto_96982 ) ) ( ON ?auto_96981 ?auto_96980 ) ( CLEAR ?auto_96981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_96977 ?auto_96978 ?auto_96979 ?auto_96980 )
      ( MAKE-3PILE ?auto_96977 ?auto_96978 ?auto_96979 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96983 - BLOCK
      ?auto_96984 - BLOCK
      ?auto_96985 - BLOCK
    )
    :vars
    (
      ?auto_96986 - BLOCK
      ?auto_96987 - BLOCK
      ?auto_96988 - BLOCK
      ?auto_96989 - BLOCK
      ?auto_96990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96986 ?auto_96985 ) ( ON-TABLE ?auto_96983 ) ( ON ?auto_96984 ?auto_96983 ) ( ON ?auto_96985 ?auto_96984 ) ( not ( = ?auto_96983 ?auto_96984 ) ) ( not ( = ?auto_96983 ?auto_96985 ) ) ( not ( = ?auto_96983 ?auto_96986 ) ) ( not ( = ?auto_96984 ?auto_96985 ) ) ( not ( = ?auto_96984 ?auto_96986 ) ) ( not ( = ?auto_96985 ?auto_96986 ) ) ( not ( = ?auto_96983 ?auto_96987 ) ) ( not ( = ?auto_96983 ?auto_96988 ) ) ( not ( = ?auto_96984 ?auto_96987 ) ) ( not ( = ?auto_96984 ?auto_96988 ) ) ( not ( = ?auto_96985 ?auto_96987 ) ) ( not ( = ?auto_96985 ?auto_96988 ) ) ( not ( = ?auto_96986 ?auto_96987 ) ) ( not ( = ?auto_96986 ?auto_96988 ) ) ( not ( = ?auto_96987 ?auto_96988 ) ) ( ON ?auto_96987 ?auto_96986 ) ( CLEAR ?auto_96987 ) ( HOLDING ?auto_96988 ) ( CLEAR ?auto_96989 ) ( ON-TABLE ?auto_96990 ) ( ON ?auto_96989 ?auto_96990 ) ( not ( = ?auto_96990 ?auto_96989 ) ) ( not ( = ?auto_96990 ?auto_96988 ) ) ( not ( = ?auto_96989 ?auto_96988 ) ) ( not ( = ?auto_96983 ?auto_96989 ) ) ( not ( = ?auto_96983 ?auto_96990 ) ) ( not ( = ?auto_96984 ?auto_96989 ) ) ( not ( = ?auto_96984 ?auto_96990 ) ) ( not ( = ?auto_96985 ?auto_96989 ) ) ( not ( = ?auto_96985 ?auto_96990 ) ) ( not ( = ?auto_96986 ?auto_96989 ) ) ( not ( = ?auto_96986 ?auto_96990 ) ) ( not ( = ?auto_96987 ?auto_96989 ) ) ( not ( = ?auto_96987 ?auto_96990 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_96990 ?auto_96989 ?auto_96988 )
      ( MAKE-3PILE ?auto_96983 ?auto_96984 ?auto_96985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96991 - BLOCK
      ?auto_96992 - BLOCK
      ?auto_96993 - BLOCK
    )
    :vars
    (
      ?auto_96998 - BLOCK
      ?auto_96997 - BLOCK
      ?auto_96996 - BLOCK
      ?auto_96994 - BLOCK
      ?auto_96995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_96998 ?auto_96993 ) ( ON-TABLE ?auto_96991 ) ( ON ?auto_96992 ?auto_96991 ) ( ON ?auto_96993 ?auto_96992 ) ( not ( = ?auto_96991 ?auto_96992 ) ) ( not ( = ?auto_96991 ?auto_96993 ) ) ( not ( = ?auto_96991 ?auto_96998 ) ) ( not ( = ?auto_96992 ?auto_96993 ) ) ( not ( = ?auto_96992 ?auto_96998 ) ) ( not ( = ?auto_96993 ?auto_96998 ) ) ( not ( = ?auto_96991 ?auto_96997 ) ) ( not ( = ?auto_96991 ?auto_96996 ) ) ( not ( = ?auto_96992 ?auto_96997 ) ) ( not ( = ?auto_96992 ?auto_96996 ) ) ( not ( = ?auto_96993 ?auto_96997 ) ) ( not ( = ?auto_96993 ?auto_96996 ) ) ( not ( = ?auto_96998 ?auto_96997 ) ) ( not ( = ?auto_96998 ?auto_96996 ) ) ( not ( = ?auto_96997 ?auto_96996 ) ) ( ON ?auto_96997 ?auto_96998 ) ( CLEAR ?auto_96994 ) ( ON-TABLE ?auto_96995 ) ( ON ?auto_96994 ?auto_96995 ) ( not ( = ?auto_96995 ?auto_96994 ) ) ( not ( = ?auto_96995 ?auto_96996 ) ) ( not ( = ?auto_96994 ?auto_96996 ) ) ( not ( = ?auto_96991 ?auto_96994 ) ) ( not ( = ?auto_96991 ?auto_96995 ) ) ( not ( = ?auto_96992 ?auto_96994 ) ) ( not ( = ?auto_96992 ?auto_96995 ) ) ( not ( = ?auto_96993 ?auto_96994 ) ) ( not ( = ?auto_96993 ?auto_96995 ) ) ( not ( = ?auto_96998 ?auto_96994 ) ) ( not ( = ?auto_96998 ?auto_96995 ) ) ( not ( = ?auto_96997 ?auto_96994 ) ) ( not ( = ?auto_96997 ?auto_96995 ) ) ( ON ?auto_96996 ?auto_96997 ) ( CLEAR ?auto_96996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_96991 ?auto_96992 ?auto_96993 ?auto_96998 ?auto_96997 )
      ( MAKE-3PILE ?auto_96991 ?auto_96992 ?auto_96993 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_96999 - BLOCK
      ?auto_97000 - BLOCK
      ?auto_97001 - BLOCK
    )
    :vars
    (
      ?auto_97005 - BLOCK
      ?auto_97004 - BLOCK
      ?auto_97003 - BLOCK
      ?auto_97006 - BLOCK
      ?auto_97002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97005 ?auto_97001 ) ( ON-TABLE ?auto_96999 ) ( ON ?auto_97000 ?auto_96999 ) ( ON ?auto_97001 ?auto_97000 ) ( not ( = ?auto_96999 ?auto_97000 ) ) ( not ( = ?auto_96999 ?auto_97001 ) ) ( not ( = ?auto_96999 ?auto_97005 ) ) ( not ( = ?auto_97000 ?auto_97001 ) ) ( not ( = ?auto_97000 ?auto_97005 ) ) ( not ( = ?auto_97001 ?auto_97005 ) ) ( not ( = ?auto_96999 ?auto_97004 ) ) ( not ( = ?auto_96999 ?auto_97003 ) ) ( not ( = ?auto_97000 ?auto_97004 ) ) ( not ( = ?auto_97000 ?auto_97003 ) ) ( not ( = ?auto_97001 ?auto_97004 ) ) ( not ( = ?auto_97001 ?auto_97003 ) ) ( not ( = ?auto_97005 ?auto_97004 ) ) ( not ( = ?auto_97005 ?auto_97003 ) ) ( not ( = ?auto_97004 ?auto_97003 ) ) ( ON ?auto_97004 ?auto_97005 ) ( ON-TABLE ?auto_97006 ) ( not ( = ?auto_97006 ?auto_97002 ) ) ( not ( = ?auto_97006 ?auto_97003 ) ) ( not ( = ?auto_97002 ?auto_97003 ) ) ( not ( = ?auto_96999 ?auto_97002 ) ) ( not ( = ?auto_96999 ?auto_97006 ) ) ( not ( = ?auto_97000 ?auto_97002 ) ) ( not ( = ?auto_97000 ?auto_97006 ) ) ( not ( = ?auto_97001 ?auto_97002 ) ) ( not ( = ?auto_97001 ?auto_97006 ) ) ( not ( = ?auto_97005 ?auto_97002 ) ) ( not ( = ?auto_97005 ?auto_97006 ) ) ( not ( = ?auto_97004 ?auto_97002 ) ) ( not ( = ?auto_97004 ?auto_97006 ) ) ( ON ?auto_97003 ?auto_97004 ) ( CLEAR ?auto_97003 ) ( HOLDING ?auto_97002 ) ( CLEAR ?auto_97006 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97006 ?auto_97002 )
      ( MAKE-3PILE ?auto_96999 ?auto_97000 ?auto_97001 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98184 - BLOCK
      ?auto_98185 - BLOCK
      ?auto_98186 - BLOCK
    )
    :vars
    (
      ?auto_98189 - BLOCK
      ?auto_98190 - BLOCK
      ?auto_98188 - BLOCK
      ?auto_98187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98189 ?auto_98186 ) ( ON-TABLE ?auto_98184 ) ( ON ?auto_98185 ?auto_98184 ) ( ON ?auto_98186 ?auto_98185 ) ( not ( = ?auto_98184 ?auto_98185 ) ) ( not ( = ?auto_98184 ?auto_98186 ) ) ( not ( = ?auto_98184 ?auto_98189 ) ) ( not ( = ?auto_98185 ?auto_98186 ) ) ( not ( = ?auto_98185 ?auto_98189 ) ) ( not ( = ?auto_98186 ?auto_98189 ) ) ( not ( = ?auto_98184 ?auto_98190 ) ) ( not ( = ?auto_98184 ?auto_98188 ) ) ( not ( = ?auto_98185 ?auto_98190 ) ) ( not ( = ?auto_98185 ?auto_98188 ) ) ( not ( = ?auto_98186 ?auto_98190 ) ) ( not ( = ?auto_98186 ?auto_98188 ) ) ( not ( = ?auto_98189 ?auto_98190 ) ) ( not ( = ?auto_98189 ?auto_98188 ) ) ( not ( = ?auto_98190 ?auto_98188 ) ) ( ON ?auto_98190 ?auto_98189 ) ( not ( = ?auto_98187 ?auto_98188 ) ) ( not ( = ?auto_98184 ?auto_98187 ) ) ( not ( = ?auto_98185 ?auto_98187 ) ) ( not ( = ?auto_98186 ?auto_98187 ) ) ( not ( = ?auto_98189 ?auto_98187 ) ) ( not ( = ?auto_98190 ?auto_98187 ) ) ( ON ?auto_98188 ?auto_98190 ) ( ON ?auto_98187 ?auto_98188 ) ( CLEAR ?auto_98187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98184 ?auto_98185 ?auto_98186 ?auto_98189 ?auto_98190 ?auto_98188 )
      ( MAKE-3PILE ?auto_98184 ?auto_98185 ?auto_98186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97015 - BLOCK
      ?auto_97016 - BLOCK
      ?auto_97017 - BLOCK
    )
    :vars
    (
      ?auto_97019 - BLOCK
      ?auto_97021 - BLOCK
      ?auto_97020 - BLOCK
      ?auto_97018 - BLOCK
      ?auto_97022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97019 ?auto_97017 ) ( ON-TABLE ?auto_97015 ) ( ON ?auto_97016 ?auto_97015 ) ( ON ?auto_97017 ?auto_97016 ) ( not ( = ?auto_97015 ?auto_97016 ) ) ( not ( = ?auto_97015 ?auto_97017 ) ) ( not ( = ?auto_97015 ?auto_97019 ) ) ( not ( = ?auto_97016 ?auto_97017 ) ) ( not ( = ?auto_97016 ?auto_97019 ) ) ( not ( = ?auto_97017 ?auto_97019 ) ) ( not ( = ?auto_97015 ?auto_97021 ) ) ( not ( = ?auto_97015 ?auto_97020 ) ) ( not ( = ?auto_97016 ?auto_97021 ) ) ( not ( = ?auto_97016 ?auto_97020 ) ) ( not ( = ?auto_97017 ?auto_97021 ) ) ( not ( = ?auto_97017 ?auto_97020 ) ) ( not ( = ?auto_97019 ?auto_97021 ) ) ( not ( = ?auto_97019 ?auto_97020 ) ) ( not ( = ?auto_97021 ?auto_97020 ) ) ( ON ?auto_97021 ?auto_97019 ) ( not ( = ?auto_97018 ?auto_97022 ) ) ( not ( = ?auto_97018 ?auto_97020 ) ) ( not ( = ?auto_97022 ?auto_97020 ) ) ( not ( = ?auto_97015 ?auto_97022 ) ) ( not ( = ?auto_97015 ?auto_97018 ) ) ( not ( = ?auto_97016 ?auto_97022 ) ) ( not ( = ?auto_97016 ?auto_97018 ) ) ( not ( = ?auto_97017 ?auto_97022 ) ) ( not ( = ?auto_97017 ?auto_97018 ) ) ( not ( = ?auto_97019 ?auto_97022 ) ) ( not ( = ?auto_97019 ?auto_97018 ) ) ( not ( = ?auto_97021 ?auto_97022 ) ) ( not ( = ?auto_97021 ?auto_97018 ) ) ( ON ?auto_97020 ?auto_97021 ) ( ON ?auto_97022 ?auto_97020 ) ( CLEAR ?auto_97022 ) ( HOLDING ?auto_97018 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97018 )
      ( MAKE-3PILE ?auto_97015 ?auto_97016 ?auto_97017 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_97023 - BLOCK
      ?auto_97024 - BLOCK
      ?auto_97025 - BLOCK
    )
    :vars
    (
      ?auto_97026 - BLOCK
      ?auto_97030 - BLOCK
      ?auto_97028 - BLOCK
      ?auto_97027 - BLOCK
      ?auto_97029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97026 ?auto_97025 ) ( ON-TABLE ?auto_97023 ) ( ON ?auto_97024 ?auto_97023 ) ( ON ?auto_97025 ?auto_97024 ) ( not ( = ?auto_97023 ?auto_97024 ) ) ( not ( = ?auto_97023 ?auto_97025 ) ) ( not ( = ?auto_97023 ?auto_97026 ) ) ( not ( = ?auto_97024 ?auto_97025 ) ) ( not ( = ?auto_97024 ?auto_97026 ) ) ( not ( = ?auto_97025 ?auto_97026 ) ) ( not ( = ?auto_97023 ?auto_97030 ) ) ( not ( = ?auto_97023 ?auto_97028 ) ) ( not ( = ?auto_97024 ?auto_97030 ) ) ( not ( = ?auto_97024 ?auto_97028 ) ) ( not ( = ?auto_97025 ?auto_97030 ) ) ( not ( = ?auto_97025 ?auto_97028 ) ) ( not ( = ?auto_97026 ?auto_97030 ) ) ( not ( = ?auto_97026 ?auto_97028 ) ) ( not ( = ?auto_97030 ?auto_97028 ) ) ( ON ?auto_97030 ?auto_97026 ) ( not ( = ?auto_97027 ?auto_97029 ) ) ( not ( = ?auto_97027 ?auto_97028 ) ) ( not ( = ?auto_97029 ?auto_97028 ) ) ( not ( = ?auto_97023 ?auto_97029 ) ) ( not ( = ?auto_97023 ?auto_97027 ) ) ( not ( = ?auto_97024 ?auto_97029 ) ) ( not ( = ?auto_97024 ?auto_97027 ) ) ( not ( = ?auto_97025 ?auto_97029 ) ) ( not ( = ?auto_97025 ?auto_97027 ) ) ( not ( = ?auto_97026 ?auto_97029 ) ) ( not ( = ?auto_97026 ?auto_97027 ) ) ( not ( = ?auto_97030 ?auto_97029 ) ) ( not ( = ?auto_97030 ?auto_97027 ) ) ( ON ?auto_97028 ?auto_97030 ) ( ON ?auto_97029 ?auto_97028 ) ( ON ?auto_97027 ?auto_97029 ) ( CLEAR ?auto_97027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97023 ?auto_97024 ?auto_97025 ?auto_97026 ?auto_97030 ?auto_97028 ?auto_97029 )
      ( MAKE-3PILE ?auto_97023 ?auto_97024 ?auto_97025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97036 - BLOCK
      ?auto_97037 - BLOCK
      ?auto_97038 - BLOCK
      ?auto_97039 - BLOCK
      ?auto_97040 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_97040 ) ( CLEAR ?auto_97039 ) ( ON-TABLE ?auto_97036 ) ( ON ?auto_97037 ?auto_97036 ) ( ON ?auto_97038 ?auto_97037 ) ( ON ?auto_97039 ?auto_97038 ) ( not ( = ?auto_97036 ?auto_97037 ) ) ( not ( = ?auto_97036 ?auto_97038 ) ) ( not ( = ?auto_97036 ?auto_97039 ) ) ( not ( = ?auto_97036 ?auto_97040 ) ) ( not ( = ?auto_97037 ?auto_97038 ) ) ( not ( = ?auto_97037 ?auto_97039 ) ) ( not ( = ?auto_97037 ?auto_97040 ) ) ( not ( = ?auto_97038 ?auto_97039 ) ) ( not ( = ?auto_97038 ?auto_97040 ) ) ( not ( = ?auto_97039 ?auto_97040 ) ) )
    :subtasks
    ( ( !STACK ?auto_97040 ?auto_97039 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97041 - BLOCK
      ?auto_97042 - BLOCK
      ?auto_97043 - BLOCK
      ?auto_97044 - BLOCK
      ?auto_97045 - BLOCK
    )
    :vars
    (
      ?auto_97046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_97044 ) ( ON-TABLE ?auto_97041 ) ( ON ?auto_97042 ?auto_97041 ) ( ON ?auto_97043 ?auto_97042 ) ( ON ?auto_97044 ?auto_97043 ) ( not ( = ?auto_97041 ?auto_97042 ) ) ( not ( = ?auto_97041 ?auto_97043 ) ) ( not ( = ?auto_97041 ?auto_97044 ) ) ( not ( = ?auto_97041 ?auto_97045 ) ) ( not ( = ?auto_97042 ?auto_97043 ) ) ( not ( = ?auto_97042 ?auto_97044 ) ) ( not ( = ?auto_97042 ?auto_97045 ) ) ( not ( = ?auto_97043 ?auto_97044 ) ) ( not ( = ?auto_97043 ?auto_97045 ) ) ( not ( = ?auto_97044 ?auto_97045 ) ) ( ON ?auto_97045 ?auto_97046 ) ( CLEAR ?auto_97045 ) ( HAND-EMPTY ) ( not ( = ?auto_97041 ?auto_97046 ) ) ( not ( = ?auto_97042 ?auto_97046 ) ) ( not ( = ?auto_97043 ?auto_97046 ) ) ( not ( = ?auto_97044 ?auto_97046 ) ) ( not ( = ?auto_97045 ?auto_97046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97045 ?auto_97046 )
      ( MAKE-5PILE ?auto_97041 ?auto_97042 ?auto_97043 ?auto_97044 ?auto_97045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97047 - BLOCK
      ?auto_97048 - BLOCK
      ?auto_97049 - BLOCK
      ?auto_97050 - BLOCK
      ?auto_97051 - BLOCK
    )
    :vars
    (
      ?auto_97052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97047 ) ( ON ?auto_97048 ?auto_97047 ) ( ON ?auto_97049 ?auto_97048 ) ( not ( = ?auto_97047 ?auto_97048 ) ) ( not ( = ?auto_97047 ?auto_97049 ) ) ( not ( = ?auto_97047 ?auto_97050 ) ) ( not ( = ?auto_97047 ?auto_97051 ) ) ( not ( = ?auto_97048 ?auto_97049 ) ) ( not ( = ?auto_97048 ?auto_97050 ) ) ( not ( = ?auto_97048 ?auto_97051 ) ) ( not ( = ?auto_97049 ?auto_97050 ) ) ( not ( = ?auto_97049 ?auto_97051 ) ) ( not ( = ?auto_97050 ?auto_97051 ) ) ( ON ?auto_97051 ?auto_97052 ) ( CLEAR ?auto_97051 ) ( not ( = ?auto_97047 ?auto_97052 ) ) ( not ( = ?auto_97048 ?auto_97052 ) ) ( not ( = ?auto_97049 ?auto_97052 ) ) ( not ( = ?auto_97050 ?auto_97052 ) ) ( not ( = ?auto_97051 ?auto_97052 ) ) ( HOLDING ?auto_97050 ) ( CLEAR ?auto_97049 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97047 ?auto_97048 ?auto_97049 ?auto_97050 )
      ( MAKE-5PILE ?auto_97047 ?auto_97048 ?auto_97049 ?auto_97050 ?auto_97051 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97053 - BLOCK
      ?auto_97054 - BLOCK
      ?auto_97055 - BLOCK
      ?auto_97056 - BLOCK
      ?auto_97057 - BLOCK
    )
    :vars
    (
      ?auto_97058 - BLOCK
      ?auto_97060 - BLOCK
      ?auto_97059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97053 ) ( ON ?auto_97054 ?auto_97053 ) ( ON ?auto_97055 ?auto_97054 ) ( not ( = ?auto_97053 ?auto_97054 ) ) ( not ( = ?auto_97053 ?auto_97055 ) ) ( not ( = ?auto_97053 ?auto_97056 ) ) ( not ( = ?auto_97053 ?auto_97057 ) ) ( not ( = ?auto_97054 ?auto_97055 ) ) ( not ( = ?auto_97054 ?auto_97056 ) ) ( not ( = ?auto_97054 ?auto_97057 ) ) ( not ( = ?auto_97055 ?auto_97056 ) ) ( not ( = ?auto_97055 ?auto_97057 ) ) ( not ( = ?auto_97056 ?auto_97057 ) ) ( ON ?auto_97057 ?auto_97058 ) ( not ( = ?auto_97053 ?auto_97058 ) ) ( not ( = ?auto_97054 ?auto_97058 ) ) ( not ( = ?auto_97055 ?auto_97058 ) ) ( not ( = ?auto_97056 ?auto_97058 ) ) ( not ( = ?auto_97057 ?auto_97058 ) ) ( CLEAR ?auto_97055 ) ( ON ?auto_97056 ?auto_97057 ) ( CLEAR ?auto_97056 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97060 ) ( ON ?auto_97059 ?auto_97060 ) ( ON ?auto_97058 ?auto_97059 ) ( not ( = ?auto_97060 ?auto_97059 ) ) ( not ( = ?auto_97060 ?auto_97058 ) ) ( not ( = ?auto_97060 ?auto_97057 ) ) ( not ( = ?auto_97060 ?auto_97056 ) ) ( not ( = ?auto_97059 ?auto_97058 ) ) ( not ( = ?auto_97059 ?auto_97057 ) ) ( not ( = ?auto_97059 ?auto_97056 ) ) ( not ( = ?auto_97053 ?auto_97060 ) ) ( not ( = ?auto_97053 ?auto_97059 ) ) ( not ( = ?auto_97054 ?auto_97060 ) ) ( not ( = ?auto_97054 ?auto_97059 ) ) ( not ( = ?auto_97055 ?auto_97060 ) ) ( not ( = ?auto_97055 ?auto_97059 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97060 ?auto_97059 ?auto_97058 ?auto_97057 )
      ( MAKE-5PILE ?auto_97053 ?auto_97054 ?auto_97055 ?auto_97056 ?auto_97057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97061 - BLOCK
      ?auto_97062 - BLOCK
      ?auto_97063 - BLOCK
      ?auto_97064 - BLOCK
      ?auto_97065 - BLOCK
    )
    :vars
    (
      ?auto_97067 - BLOCK
      ?auto_97066 - BLOCK
      ?auto_97068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97061 ) ( ON ?auto_97062 ?auto_97061 ) ( not ( = ?auto_97061 ?auto_97062 ) ) ( not ( = ?auto_97061 ?auto_97063 ) ) ( not ( = ?auto_97061 ?auto_97064 ) ) ( not ( = ?auto_97061 ?auto_97065 ) ) ( not ( = ?auto_97062 ?auto_97063 ) ) ( not ( = ?auto_97062 ?auto_97064 ) ) ( not ( = ?auto_97062 ?auto_97065 ) ) ( not ( = ?auto_97063 ?auto_97064 ) ) ( not ( = ?auto_97063 ?auto_97065 ) ) ( not ( = ?auto_97064 ?auto_97065 ) ) ( ON ?auto_97065 ?auto_97067 ) ( not ( = ?auto_97061 ?auto_97067 ) ) ( not ( = ?auto_97062 ?auto_97067 ) ) ( not ( = ?auto_97063 ?auto_97067 ) ) ( not ( = ?auto_97064 ?auto_97067 ) ) ( not ( = ?auto_97065 ?auto_97067 ) ) ( ON ?auto_97064 ?auto_97065 ) ( CLEAR ?auto_97064 ) ( ON-TABLE ?auto_97066 ) ( ON ?auto_97068 ?auto_97066 ) ( ON ?auto_97067 ?auto_97068 ) ( not ( = ?auto_97066 ?auto_97068 ) ) ( not ( = ?auto_97066 ?auto_97067 ) ) ( not ( = ?auto_97066 ?auto_97065 ) ) ( not ( = ?auto_97066 ?auto_97064 ) ) ( not ( = ?auto_97068 ?auto_97067 ) ) ( not ( = ?auto_97068 ?auto_97065 ) ) ( not ( = ?auto_97068 ?auto_97064 ) ) ( not ( = ?auto_97061 ?auto_97066 ) ) ( not ( = ?auto_97061 ?auto_97068 ) ) ( not ( = ?auto_97062 ?auto_97066 ) ) ( not ( = ?auto_97062 ?auto_97068 ) ) ( not ( = ?auto_97063 ?auto_97066 ) ) ( not ( = ?auto_97063 ?auto_97068 ) ) ( HOLDING ?auto_97063 ) ( CLEAR ?auto_97062 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97061 ?auto_97062 ?auto_97063 )
      ( MAKE-5PILE ?auto_97061 ?auto_97062 ?auto_97063 ?auto_97064 ?auto_97065 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97069 - BLOCK
      ?auto_97070 - BLOCK
      ?auto_97071 - BLOCK
      ?auto_97072 - BLOCK
      ?auto_97073 - BLOCK
    )
    :vars
    (
      ?auto_97076 - BLOCK
      ?auto_97075 - BLOCK
      ?auto_97074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97069 ) ( ON ?auto_97070 ?auto_97069 ) ( not ( = ?auto_97069 ?auto_97070 ) ) ( not ( = ?auto_97069 ?auto_97071 ) ) ( not ( = ?auto_97069 ?auto_97072 ) ) ( not ( = ?auto_97069 ?auto_97073 ) ) ( not ( = ?auto_97070 ?auto_97071 ) ) ( not ( = ?auto_97070 ?auto_97072 ) ) ( not ( = ?auto_97070 ?auto_97073 ) ) ( not ( = ?auto_97071 ?auto_97072 ) ) ( not ( = ?auto_97071 ?auto_97073 ) ) ( not ( = ?auto_97072 ?auto_97073 ) ) ( ON ?auto_97073 ?auto_97076 ) ( not ( = ?auto_97069 ?auto_97076 ) ) ( not ( = ?auto_97070 ?auto_97076 ) ) ( not ( = ?auto_97071 ?auto_97076 ) ) ( not ( = ?auto_97072 ?auto_97076 ) ) ( not ( = ?auto_97073 ?auto_97076 ) ) ( ON ?auto_97072 ?auto_97073 ) ( ON-TABLE ?auto_97075 ) ( ON ?auto_97074 ?auto_97075 ) ( ON ?auto_97076 ?auto_97074 ) ( not ( = ?auto_97075 ?auto_97074 ) ) ( not ( = ?auto_97075 ?auto_97076 ) ) ( not ( = ?auto_97075 ?auto_97073 ) ) ( not ( = ?auto_97075 ?auto_97072 ) ) ( not ( = ?auto_97074 ?auto_97076 ) ) ( not ( = ?auto_97074 ?auto_97073 ) ) ( not ( = ?auto_97074 ?auto_97072 ) ) ( not ( = ?auto_97069 ?auto_97075 ) ) ( not ( = ?auto_97069 ?auto_97074 ) ) ( not ( = ?auto_97070 ?auto_97075 ) ) ( not ( = ?auto_97070 ?auto_97074 ) ) ( not ( = ?auto_97071 ?auto_97075 ) ) ( not ( = ?auto_97071 ?auto_97074 ) ) ( CLEAR ?auto_97070 ) ( ON ?auto_97071 ?auto_97072 ) ( CLEAR ?auto_97071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97075 ?auto_97074 ?auto_97076 ?auto_97073 ?auto_97072 )
      ( MAKE-5PILE ?auto_97069 ?auto_97070 ?auto_97071 ?auto_97072 ?auto_97073 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97077 - BLOCK
      ?auto_97078 - BLOCK
      ?auto_97079 - BLOCK
      ?auto_97080 - BLOCK
      ?auto_97081 - BLOCK
    )
    :vars
    (
      ?auto_97084 - BLOCK
      ?auto_97082 - BLOCK
      ?auto_97083 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97077 ) ( not ( = ?auto_97077 ?auto_97078 ) ) ( not ( = ?auto_97077 ?auto_97079 ) ) ( not ( = ?auto_97077 ?auto_97080 ) ) ( not ( = ?auto_97077 ?auto_97081 ) ) ( not ( = ?auto_97078 ?auto_97079 ) ) ( not ( = ?auto_97078 ?auto_97080 ) ) ( not ( = ?auto_97078 ?auto_97081 ) ) ( not ( = ?auto_97079 ?auto_97080 ) ) ( not ( = ?auto_97079 ?auto_97081 ) ) ( not ( = ?auto_97080 ?auto_97081 ) ) ( ON ?auto_97081 ?auto_97084 ) ( not ( = ?auto_97077 ?auto_97084 ) ) ( not ( = ?auto_97078 ?auto_97084 ) ) ( not ( = ?auto_97079 ?auto_97084 ) ) ( not ( = ?auto_97080 ?auto_97084 ) ) ( not ( = ?auto_97081 ?auto_97084 ) ) ( ON ?auto_97080 ?auto_97081 ) ( ON-TABLE ?auto_97082 ) ( ON ?auto_97083 ?auto_97082 ) ( ON ?auto_97084 ?auto_97083 ) ( not ( = ?auto_97082 ?auto_97083 ) ) ( not ( = ?auto_97082 ?auto_97084 ) ) ( not ( = ?auto_97082 ?auto_97081 ) ) ( not ( = ?auto_97082 ?auto_97080 ) ) ( not ( = ?auto_97083 ?auto_97084 ) ) ( not ( = ?auto_97083 ?auto_97081 ) ) ( not ( = ?auto_97083 ?auto_97080 ) ) ( not ( = ?auto_97077 ?auto_97082 ) ) ( not ( = ?auto_97077 ?auto_97083 ) ) ( not ( = ?auto_97078 ?auto_97082 ) ) ( not ( = ?auto_97078 ?auto_97083 ) ) ( not ( = ?auto_97079 ?auto_97082 ) ) ( not ( = ?auto_97079 ?auto_97083 ) ) ( ON ?auto_97079 ?auto_97080 ) ( CLEAR ?auto_97079 ) ( HOLDING ?auto_97078 ) ( CLEAR ?auto_97077 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97077 ?auto_97078 )
      ( MAKE-5PILE ?auto_97077 ?auto_97078 ?auto_97079 ?auto_97080 ?auto_97081 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97085 - BLOCK
      ?auto_97086 - BLOCK
      ?auto_97087 - BLOCK
      ?auto_97088 - BLOCK
      ?auto_97089 - BLOCK
    )
    :vars
    (
      ?auto_97091 - BLOCK
      ?auto_97090 - BLOCK
      ?auto_97092 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97085 ) ( not ( = ?auto_97085 ?auto_97086 ) ) ( not ( = ?auto_97085 ?auto_97087 ) ) ( not ( = ?auto_97085 ?auto_97088 ) ) ( not ( = ?auto_97085 ?auto_97089 ) ) ( not ( = ?auto_97086 ?auto_97087 ) ) ( not ( = ?auto_97086 ?auto_97088 ) ) ( not ( = ?auto_97086 ?auto_97089 ) ) ( not ( = ?auto_97087 ?auto_97088 ) ) ( not ( = ?auto_97087 ?auto_97089 ) ) ( not ( = ?auto_97088 ?auto_97089 ) ) ( ON ?auto_97089 ?auto_97091 ) ( not ( = ?auto_97085 ?auto_97091 ) ) ( not ( = ?auto_97086 ?auto_97091 ) ) ( not ( = ?auto_97087 ?auto_97091 ) ) ( not ( = ?auto_97088 ?auto_97091 ) ) ( not ( = ?auto_97089 ?auto_97091 ) ) ( ON ?auto_97088 ?auto_97089 ) ( ON-TABLE ?auto_97090 ) ( ON ?auto_97092 ?auto_97090 ) ( ON ?auto_97091 ?auto_97092 ) ( not ( = ?auto_97090 ?auto_97092 ) ) ( not ( = ?auto_97090 ?auto_97091 ) ) ( not ( = ?auto_97090 ?auto_97089 ) ) ( not ( = ?auto_97090 ?auto_97088 ) ) ( not ( = ?auto_97092 ?auto_97091 ) ) ( not ( = ?auto_97092 ?auto_97089 ) ) ( not ( = ?auto_97092 ?auto_97088 ) ) ( not ( = ?auto_97085 ?auto_97090 ) ) ( not ( = ?auto_97085 ?auto_97092 ) ) ( not ( = ?auto_97086 ?auto_97090 ) ) ( not ( = ?auto_97086 ?auto_97092 ) ) ( not ( = ?auto_97087 ?auto_97090 ) ) ( not ( = ?auto_97087 ?auto_97092 ) ) ( ON ?auto_97087 ?auto_97088 ) ( CLEAR ?auto_97085 ) ( ON ?auto_97086 ?auto_97087 ) ( CLEAR ?auto_97086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97090 ?auto_97092 ?auto_97091 ?auto_97089 ?auto_97088 ?auto_97087 )
      ( MAKE-5PILE ?auto_97085 ?auto_97086 ?auto_97087 ?auto_97088 ?auto_97089 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97093 - BLOCK
      ?auto_97094 - BLOCK
      ?auto_97095 - BLOCK
      ?auto_97096 - BLOCK
      ?auto_97097 - BLOCK
    )
    :vars
    (
      ?auto_97098 - BLOCK
      ?auto_97099 - BLOCK
      ?auto_97100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97093 ?auto_97094 ) ) ( not ( = ?auto_97093 ?auto_97095 ) ) ( not ( = ?auto_97093 ?auto_97096 ) ) ( not ( = ?auto_97093 ?auto_97097 ) ) ( not ( = ?auto_97094 ?auto_97095 ) ) ( not ( = ?auto_97094 ?auto_97096 ) ) ( not ( = ?auto_97094 ?auto_97097 ) ) ( not ( = ?auto_97095 ?auto_97096 ) ) ( not ( = ?auto_97095 ?auto_97097 ) ) ( not ( = ?auto_97096 ?auto_97097 ) ) ( ON ?auto_97097 ?auto_97098 ) ( not ( = ?auto_97093 ?auto_97098 ) ) ( not ( = ?auto_97094 ?auto_97098 ) ) ( not ( = ?auto_97095 ?auto_97098 ) ) ( not ( = ?auto_97096 ?auto_97098 ) ) ( not ( = ?auto_97097 ?auto_97098 ) ) ( ON ?auto_97096 ?auto_97097 ) ( ON-TABLE ?auto_97099 ) ( ON ?auto_97100 ?auto_97099 ) ( ON ?auto_97098 ?auto_97100 ) ( not ( = ?auto_97099 ?auto_97100 ) ) ( not ( = ?auto_97099 ?auto_97098 ) ) ( not ( = ?auto_97099 ?auto_97097 ) ) ( not ( = ?auto_97099 ?auto_97096 ) ) ( not ( = ?auto_97100 ?auto_97098 ) ) ( not ( = ?auto_97100 ?auto_97097 ) ) ( not ( = ?auto_97100 ?auto_97096 ) ) ( not ( = ?auto_97093 ?auto_97099 ) ) ( not ( = ?auto_97093 ?auto_97100 ) ) ( not ( = ?auto_97094 ?auto_97099 ) ) ( not ( = ?auto_97094 ?auto_97100 ) ) ( not ( = ?auto_97095 ?auto_97099 ) ) ( not ( = ?auto_97095 ?auto_97100 ) ) ( ON ?auto_97095 ?auto_97096 ) ( ON ?auto_97094 ?auto_97095 ) ( CLEAR ?auto_97094 ) ( HOLDING ?auto_97093 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97093 )
      ( MAKE-5PILE ?auto_97093 ?auto_97094 ?auto_97095 ?auto_97096 ?auto_97097 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97101 - BLOCK
      ?auto_97102 - BLOCK
      ?auto_97103 - BLOCK
      ?auto_97104 - BLOCK
      ?auto_97105 - BLOCK
    )
    :vars
    (
      ?auto_97108 - BLOCK
      ?auto_97107 - BLOCK
      ?auto_97106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97101 ?auto_97102 ) ) ( not ( = ?auto_97101 ?auto_97103 ) ) ( not ( = ?auto_97101 ?auto_97104 ) ) ( not ( = ?auto_97101 ?auto_97105 ) ) ( not ( = ?auto_97102 ?auto_97103 ) ) ( not ( = ?auto_97102 ?auto_97104 ) ) ( not ( = ?auto_97102 ?auto_97105 ) ) ( not ( = ?auto_97103 ?auto_97104 ) ) ( not ( = ?auto_97103 ?auto_97105 ) ) ( not ( = ?auto_97104 ?auto_97105 ) ) ( ON ?auto_97105 ?auto_97108 ) ( not ( = ?auto_97101 ?auto_97108 ) ) ( not ( = ?auto_97102 ?auto_97108 ) ) ( not ( = ?auto_97103 ?auto_97108 ) ) ( not ( = ?auto_97104 ?auto_97108 ) ) ( not ( = ?auto_97105 ?auto_97108 ) ) ( ON ?auto_97104 ?auto_97105 ) ( ON-TABLE ?auto_97107 ) ( ON ?auto_97106 ?auto_97107 ) ( ON ?auto_97108 ?auto_97106 ) ( not ( = ?auto_97107 ?auto_97106 ) ) ( not ( = ?auto_97107 ?auto_97108 ) ) ( not ( = ?auto_97107 ?auto_97105 ) ) ( not ( = ?auto_97107 ?auto_97104 ) ) ( not ( = ?auto_97106 ?auto_97108 ) ) ( not ( = ?auto_97106 ?auto_97105 ) ) ( not ( = ?auto_97106 ?auto_97104 ) ) ( not ( = ?auto_97101 ?auto_97107 ) ) ( not ( = ?auto_97101 ?auto_97106 ) ) ( not ( = ?auto_97102 ?auto_97107 ) ) ( not ( = ?auto_97102 ?auto_97106 ) ) ( not ( = ?auto_97103 ?auto_97107 ) ) ( not ( = ?auto_97103 ?auto_97106 ) ) ( ON ?auto_97103 ?auto_97104 ) ( ON ?auto_97102 ?auto_97103 ) ( ON ?auto_97101 ?auto_97102 ) ( CLEAR ?auto_97101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97107 ?auto_97106 ?auto_97108 ?auto_97105 ?auto_97104 ?auto_97103 ?auto_97102 )
      ( MAKE-5PILE ?auto_97101 ?auto_97102 ?auto_97103 ?auto_97104 ?auto_97105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97111 - BLOCK
      ?auto_97112 - BLOCK
    )
    :vars
    (
      ?auto_97113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97113 ?auto_97112 ) ( CLEAR ?auto_97113 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97111 ) ( ON ?auto_97112 ?auto_97111 ) ( not ( = ?auto_97111 ?auto_97112 ) ) ( not ( = ?auto_97111 ?auto_97113 ) ) ( not ( = ?auto_97112 ?auto_97113 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97113 ?auto_97112 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97114 - BLOCK
      ?auto_97115 - BLOCK
    )
    :vars
    (
      ?auto_97116 - BLOCK
      ?auto_97117 - BLOCK
      ?auto_97118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97116 ?auto_97115 ) ( CLEAR ?auto_97116 ) ( ON-TABLE ?auto_97114 ) ( ON ?auto_97115 ?auto_97114 ) ( not ( = ?auto_97114 ?auto_97115 ) ) ( not ( = ?auto_97114 ?auto_97116 ) ) ( not ( = ?auto_97115 ?auto_97116 ) ) ( HOLDING ?auto_97117 ) ( CLEAR ?auto_97118 ) ( not ( = ?auto_97114 ?auto_97117 ) ) ( not ( = ?auto_97114 ?auto_97118 ) ) ( not ( = ?auto_97115 ?auto_97117 ) ) ( not ( = ?auto_97115 ?auto_97118 ) ) ( not ( = ?auto_97116 ?auto_97117 ) ) ( not ( = ?auto_97116 ?auto_97118 ) ) ( not ( = ?auto_97117 ?auto_97118 ) ) )
    :subtasks
    ( ( !STACK ?auto_97117 ?auto_97118 )
      ( MAKE-2PILE ?auto_97114 ?auto_97115 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97119 - BLOCK
      ?auto_97120 - BLOCK
    )
    :vars
    (
      ?auto_97121 - BLOCK
      ?auto_97122 - BLOCK
      ?auto_97123 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97121 ?auto_97120 ) ( ON-TABLE ?auto_97119 ) ( ON ?auto_97120 ?auto_97119 ) ( not ( = ?auto_97119 ?auto_97120 ) ) ( not ( = ?auto_97119 ?auto_97121 ) ) ( not ( = ?auto_97120 ?auto_97121 ) ) ( CLEAR ?auto_97122 ) ( not ( = ?auto_97119 ?auto_97123 ) ) ( not ( = ?auto_97119 ?auto_97122 ) ) ( not ( = ?auto_97120 ?auto_97123 ) ) ( not ( = ?auto_97120 ?auto_97122 ) ) ( not ( = ?auto_97121 ?auto_97123 ) ) ( not ( = ?auto_97121 ?auto_97122 ) ) ( not ( = ?auto_97123 ?auto_97122 ) ) ( ON ?auto_97123 ?auto_97121 ) ( CLEAR ?auto_97123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97119 ?auto_97120 ?auto_97121 )
      ( MAKE-2PILE ?auto_97119 ?auto_97120 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97124 - BLOCK
      ?auto_97125 - BLOCK
    )
    :vars
    (
      ?auto_97127 - BLOCK
      ?auto_97126 - BLOCK
      ?auto_97128 - BLOCK
      ?auto_97131 - BLOCK
      ?auto_97130 - BLOCK
      ?auto_97129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97127 ?auto_97125 ) ( ON-TABLE ?auto_97124 ) ( ON ?auto_97125 ?auto_97124 ) ( not ( = ?auto_97124 ?auto_97125 ) ) ( not ( = ?auto_97124 ?auto_97127 ) ) ( not ( = ?auto_97125 ?auto_97127 ) ) ( not ( = ?auto_97124 ?auto_97126 ) ) ( not ( = ?auto_97124 ?auto_97128 ) ) ( not ( = ?auto_97125 ?auto_97126 ) ) ( not ( = ?auto_97125 ?auto_97128 ) ) ( not ( = ?auto_97127 ?auto_97126 ) ) ( not ( = ?auto_97127 ?auto_97128 ) ) ( not ( = ?auto_97126 ?auto_97128 ) ) ( ON ?auto_97126 ?auto_97127 ) ( CLEAR ?auto_97126 ) ( HOLDING ?auto_97128 ) ( CLEAR ?auto_97131 ) ( ON-TABLE ?auto_97130 ) ( ON ?auto_97129 ?auto_97130 ) ( ON ?auto_97131 ?auto_97129 ) ( not ( = ?auto_97130 ?auto_97129 ) ) ( not ( = ?auto_97130 ?auto_97131 ) ) ( not ( = ?auto_97130 ?auto_97128 ) ) ( not ( = ?auto_97129 ?auto_97131 ) ) ( not ( = ?auto_97129 ?auto_97128 ) ) ( not ( = ?auto_97131 ?auto_97128 ) ) ( not ( = ?auto_97124 ?auto_97131 ) ) ( not ( = ?auto_97124 ?auto_97130 ) ) ( not ( = ?auto_97124 ?auto_97129 ) ) ( not ( = ?auto_97125 ?auto_97131 ) ) ( not ( = ?auto_97125 ?auto_97130 ) ) ( not ( = ?auto_97125 ?auto_97129 ) ) ( not ( = ?auto_97127 ?auto_97131 ) ) ( not ( = ?auto_97127 ?auto_97130 ) ) ( not ( = ?auto_97127 ?auto_97129 ) ) ( not ( = ?auto_97126 ?auto_97131 ) ) ( not ( = ?auto_97126 ?auto_97130 ) ) ( not ( = ?auto_97126 ?auto_97129 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97130 ?auto_97129 ?auto_97131 ?auto_97128 )
      ( MAKE-2PILE ?auto_97124 ?auto_97125 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97132 - BLOCK
      ?auto_97133 - BLOCK
    )
    :vars
    (
      ?auto_97138 - BLOCK
      ?auto_97135 - BLOCK
      ?auto_97139 - BLOCK
      ?auto_97137 - BLOCK
      ?auto_97136 - BLOCK
      ?auto_97134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97138 ?auto_97133 ) ( ON-TABLE ?auto_97132 ) ( ON ?auto_97133 ?auto_97132 ) ( not ( = ?auto_97132 ?auto_97133 ) ) ( not ( = ?auto_97132 ?auto_97138 ) ) ( not ( = ?auto_97133 ?auto_97138 ) ) ( not ( = ?auto_97132 ?auto_97135 ) ) ( not ( = ?auto_97132 ?auto_97139 ) ) ( not ( = ?auto_97133 ?auto_97135 ) ) ( not ( = ?auto_97133 ?auto_97139 ) ) ( not ( = ?auto_97138 ?auto_97135 ) ) ( not ( = ?auto_97138 ?auto_97139 ) ) ( not ( = ?auto_97135 ?auto_97139 ) ) ( ON ?auto_97135 ?auto_97138 ) ( CLEAR ?auto_97137 ) ( ON-TABLE ?auto_97136 ) ( ON ?auto_97134 ?auto_97136 ) ( ON ?auto_97137 ?auto_97134 ) ( not ( = ?auto_97136 ?auto_97134 ) ) ( not ( = ?auto_97136 ?auto_97137 ) ) ( not ( = ?auto_97136 ?auto_97139 ) ) ( not ( = ?auto_97134 ?auto_97137 ) ) ( not ( = ?auto_97134 ?auto_97139 ) ) ( not ( = ?auto_97137 ?auto_97139 ) ) ( not ( = ?auto_97132 ?auto_97137 ) ) ( not ( = ?auto_97132 ?auto_97136 ) ) ( not ( = ?auto_97132 ?auto_97134 ) ) ( not ( = ?auto_97133 ?auto_97137 ) ) ( not ( = ?auto_97133 ?auto_97136 ) ) ( not ( = ?auto_97133 ?auto_97134 ) ) ( not ( = ?auto_97138 ?auto_97137 ) ) ( not ( = ?auto_97138 ?auto_97136 ) ) ( not ( = ?auto_97138 ?auto_97134 ) ) ( not ( = ?auto_97135 ?auto_97137 ) ) ( not ( = ?auto_97135 ?auto_97136 ) ) ( not ( = ?auto_97135 ?auto_97134 ) ) ( ON ?auto_97139 ?auto_97135 ) ( CLEAR ?auto_97139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97132 ?auto_97133 ?auto_97138 ?auto_97135 )
      ( MAKE-2PILE ?auto_97132 ?auto_97133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97140 - BLOCK
      ?auto_97141 - BLOCK
    )
    :vars
    (
      ?auto_97145 - BLOCK
      ?auto_97146 - BLOCK
      ?auto_97147 - BLOCK
      ?auto_97144 - BLOCK
      ?auto_97143 - BLOCK
      ?auto_97142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97145 ?auto_97141 ) ( ON-TABLE ?auto_97140 ) ( ON ?auto_97141 ?auto_97140 ) ( not ( = ?auto_97140 ?auto_97141 ) ) ( not ( = ?auto_97140 ?auto_97145 ) ) ( not ( = ?auto_97141 ?auto_97145 ) ) ( not ( = ?auto_97140 ?auto_97146 ) ) ( not ( = ?auto_97140 ?auto_97147 ) ) ( not ( = ?auto_97141 ?auto_97146 ) ) ( not ( = ?auto_97141 ?auto_97147 ) ) ( not ( = ?auto_97145 ?auto_97146 ) ) ( not ( = ?auto_97145 ?auto_97147 ) ) ( not ( = ?auto_97146 ?auto_97147 ) ) ( ON ?auto_97146 ?auto_97145 ) ( ON-TABLE ?auto_97144 ) ( ON ?auto_97143 ?auto_97144 ) ( not ( = ?auto_97144 ?auto_97143 ) ) ( not ( = ?auto_97144 ?auto_97142 ) ) ( not ( = ?auto_97144 ?auto_97147 ) ) ( not ( = ?auto_97143 ?auto_97142 ) ) ( not ( = ?auto_97143 ?auto_97147 ) ) ( not ( = ?auto_97142 ?auto_97147 ) ) ( not ( = ?auto_97140 ?auto_97142 ) ) ( not ( = ?auto_97140 ?auto_97144 ) ) ( not ( = ?auto_97140 ?auto_97143 ) ) ( not ( = ?auto_97141 ?auto_97142 ) ) ( not ( = ?auto_97141 ?auto_97144 ) ) ( not ( = ?auto_97141 ?auto_97143 ) ) ( not ( = ?auto_97145 ?auto_97142 ) ) ( not ( = ?auto_97145 ?auto_97144 ) ) ( not ( = ?auto_97145 ?auto_97143 ) ) ( not ( = ?auto_97146 ?auto_97142 ) ) ( not ( = ?auto_97146 ?auto_97144 ) ) ( not ( = ?auto_97146 ?auto_97143 ) ) ( ON ?auto_97147 ?auto_97146 ) ( CLEAR ?auto_97147 ) ( HOLDING ?auto_97142 ) ( CLEAR ?auto_97143 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97144 ?auto_97143 ?auto_97142 )
      ( MAKE-2PILE ?auto_97140 ?auto_97141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97148 - BLOCK
      ?auto_97149 - BLOCK
    )
    :vars
    (
      ?auto_97151 - BLOCK
      ?auto_97150 - BLOCK
      ?auto_97152 - BLOCK
      ?auto_97153 - BLOCK
      ?auto_97154 - BLOCK
      ?auto_97155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97151 ?auto_97149 ) ( ON-TABLE ?auto_97148 ) ( ON ?auto_97149 ?auto_97148 ) ( not ( = ?auto_97148 ?auto_97149 ) ) ( not ( = ?auto_97148 ?auto_97151 ) ) ( not ( = ?auto_97149 ?auto_97151 ) ) ( not ( = ?auto_97148 ?auto_97150 ) ) ( not ( = ?auto_97148 ?auto_97152 ) ) ( not ( = ?auto_97149 ?auto_97150 ) ) ( not ( = ?auto_97149 ?auto_97152 ) ) ( not ( = ?auto_97151 ?auto_97150 ) ) ( not ( = ?auto_97151 ?auto_97152 ) ) ( not ( = ?auto_97150 ?auto_97152 ) ) ( ON ?auto_97150 ?auto_97151 ) ( ON-TABLE ?auto_97153 ) ( ON ?auto_97154 ?auto_97153 ) ( not ( = ?auto_97153 ?auto_97154 ) ) ( not ( = ?auto_97153 ?auto_97155 ) ) ( not ( = ?auto_97153 ?auto_97152 ) ) ( not ( = ?auto_97154 ?auto_97155 ) ) ( not ( = ?auto_97154 ?auto_97152 ) ) ( not ( = ?auto_97155 ?auto_97152 ) ) ( not ( = ?auto_97148 ?auto_97155 ) ) ( not ( = ?auto_97148 ?auto_97153 ) ) ( not ( = ?auto_97148 ?auto_97154 ) ) ( not ( = ?auto_97149 ?auto_97155 ) ) ( not ( = ?auto_97149 ?auto_97153 ) ) ( not ( = ?auto_97149 ?auto_97154 ) ) ( not ( = ?auto_97151 ?auto_97155 ) ) ( not ( = ?auto_97151 ?auto_97153 ) ) ( not ( = ?auto_97151 ?auto_97154 ) ) ( not ( = ?auto_97150 ?auto_97155 ) ) ( not ( = ?auto_97150 ?auto_97153 ) ) ( not ( = ?auto_97150 ?auto_97154 ) ) ( ON ?auto_97152 ?auto_97150 ) ( CLEAR ?auto_97154 ) ( ON ?auto_97155 ?auto_97152 ) ( CLEAR ?auto_97155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97148 ?auto_97149 ?auto_97151 ?auto_97150 ?auto_97152 )
      ( MAKE-2PILE ?auto_97148 ?auto_97149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97156 - BLOCK
      ?auto_97157 - BLOCK
    )
    :vars
    (
      ?auto_97159 - BLOCK
      ?auto_97158 - BLOCK
      ?auto_97162 - BLOCK
      ?auto_97160 - BLOCK
      ?auto_97161 - BLOCK
      ?auto_97163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97159 ?auto_97157 ) ( ON-TABLE ?auto_97156 ) ( ON ?auto_97157 ?auto_97156 ) ( not ( = ?auto_97156 ?auto_97157 ) ) ( not ( = ?auto_97156 ?auto_97159 ) ) ( not ( = ?auto_97157 ?auto_97159 ) ) ( not ( = ?auto_97156 ?auto_97158 ) ) ( not ( = ?auto_97156 ?auto_97162 ) ) ( not ( = ?auto_97157 ?auto_97158 ) ) ( not ( = ?auto_97157 ?auto_97162 ) ) ( not ( = ?auto_97159 ?auto_97158 ) ) ( not ( = ?auto_97159 ?auto_97162 ) ) ( not ( = ?auto_97158 ?auto_97162 ) ) ( ON ?auto_97158 ?auto_97159 ) ( ON-TABLE ?auto_97160 ) ( not ( = ?auto_97160 ?auto_97161 ) ) ( not ( = ?auto_97160 ?auto_97163 ) ) ( not ( = ?auto_97160 ?auto_97162 ) ) ( not ( = ?auto_97161 ?auto_97163 ) ) ( not ( = ?auto_97161 ?auto_97162 ) ) ( not ( = ?auto_97163 ?auto_97162 ) ) ( not ( = ?auto_97156 ?auto_97163 ) ) ( not ( = ?auto_97156 ?auto_97160 ) ) ( not ( = ?auto_97156 ?auto_97161 ) ) ( not ( = ?auto_97157 ?auto_97163 ) ) ( not ( = ?auto_97157 ?auto_97160 ) ) ( not ( = ?auto_97157 ?auto_97161 ) ) ( not ( = ?auto_97159 ?auto_97163 ) ) ( not ( = ?auto_97159 ?auto_97160 ) ) ( not ( = ?auto_97159 ?auto_97161 ) ) ( not ( = ?auto_97158 ?auto_97163 ) ) ( not ( = ?auto_97158 ?auto_97160 ) ) ( not ( = ?auto_97158 ?auto_97161 ) ) ( ON ?auto_97162 ?auto_97158 ) ( ON ?auto_97163 ?auto_97162 ) ( CLEAR ?auto_97163 ) ( HOLDING ?auto_97161 ) ( CLEAR ?auto_97160 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97160 ?auto_97161 )
      ( MAKE-2PILE ?auto_97156 ?auto_97157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98457 - BLOCK
      ?auto_98458 - BLOCK
    )
    :vars
    (
      ?auto_98462 - BLOCK
      ?auto_98461 - BLOCK
      ?auto_98459 - BLOCK
      ?auto_98463 - BLOCK
      ?auto_98460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98462 ?auto_98458 ) ( ON-TABLE ?auto_98457 ) ( ON ?auto_98458 ?auto_98457 ) ( not ( = ?auto_98457 ?auto_98458 ) ) ( not ( = ?auto_98457 ?auto_98462 ) ) ( not ( = ?auto_98458 ?auto_98462 ) ) ( not ( = ?auto_98457 ?auto_98461 ) ) ( not ( = ?auto_98457 ?auto_98459 ) ) ( not ( = ?auto_98458 ?auto_98461 ) ) ( not ( = ?auto_98458 ?auto_98459 ) ) ( not ( = ?auto_98462 ?auto_98461 ) ) ( not ( = ?auto_98462 ?auto_98459 ) ) ( not ( = ?auto_98461 ?auto_98459 ) ) ( ON ?auto_98461 ?auto_98462 ) ( not ( = ?auto_98463 ?auto_98460 ) ) ( not ( = ?auto_98463 ?auto_98459 ) ) ( not ( = ?auto_98460 ?auto_98459 ) ) ( not ( = ?auto_98457 ?auto_98460 ) ) ( not ( = ?auto_98457 ?auto_98463 ) ) ( not ( = ?auto_98458 ?auto_98460 ) ) ( not ( = ?auto_98458 ?auto_98463 ) ) ( not ( = ?auto_98462 ?auto_98460 ) ) ( not ( = ?auto_98462 ?auto_98463 ) ) ( not ( = ?auto_98461 ?auto_98460 ) ) ( not ( = ?auto_98461 ?auto_98463 ) ) ( ON ?auto_98459 ?auto_98461 ) ( ON ?auto_98460 ?auto_98459 ) ( ON ?auto_98463 ?auto_98460 ) ( CLEAR ?auto_98463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98457 ?auto_98458 ?auto_98462 ?auto_98461 ?auto_98459 ?auto_98460 )
      ( MAKE-2PILE ?auto_98457 ?auto_98458 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97172 - BLOCK
      ?auto_97173 - BLOCK
    )
    :vars
    (
      ?auto_97174 - BLOCK
      ?auto_97178 - BLOCK
      ?auto_97176 - BLOCK
      ?auto_97177 - BLOCK
      ?auto_97179 - BLOCK
      ?auto_97175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97174 ?auto_97173 ) ( ON-TABLE ?auto_97172 ) ( ON ?auto_97173 ?auto_97172 ) ( not ( = ?auto_97172 ?auto_97173 ) ) ( not ( = ?auto_97172 ?auto_97174 ) ) ( not ( = ?auto_97173 ?auto_97174 ) ) ( not ( = ?auto_97172 ?auto_97178 ) ) ( not ( = ?auto_97172 ?auto_97176 ) ) ( not ( = ?auto_97173 ?auto_97178 ) ) ( not ( = ?auto_97173 ?auto_97176 ) ) ( not ( = ?auto_97174 ?auto_97178 ) ) ( not ( = ?auto_97174 ?auto_97176 ) ) ( not ( = ?auto_97178 ?auto_97176 ) ) ( ON ?auto_97178 ?auto_97174 ) ( not ( = ?auto_97177 ?auto_97179 ) ) ( not ( = ?auto_97177 ?auto_97175 ) ) ( not ( = ?auto_97177 ?auto_97176 ) ) ( not ( = ?auto_97179 ?auto_97175 ) ) ( not ( = ?auto_97179 ?auto_97176 ) ) ( not ( = ?auto_97175 ?auto_97176 ) ) ( not ( = ?auto_97172 ?auto_97175 ) ) ( not ( = ?auto_97172 ?auto_97177 ) ) ( not ( = ?auto_97172 ?auto_97179 ) ) ( not ( = ?auto_97173 ?auto_97175 ) ) ( not ( = ?auto_97173 ?auto_97177 ) ) ( not ( = ?auto_97173 ?auto_97179 ) ) ( not ( = ?auto_97174 ?auto_97175 ) ) ( not ( = ?auto_97174 ?auto_97177 ) ) ( not ( = ?auto_97174 ?auto_97179 ) ) ( not ( = ?auto_97178 ?auto_97175 ) ) ( not ( = ?auto_97178 ?auto_97177 ) ) ( not ( = ?auto_97178 ?auto_97179 ) ) ( ON ?auto_97176 ?auto_97178 ) ( ON ?auto_97175 ?auto_97176 ) ( ON ?auto_97179 ?auto_97175 ) ( CLEAR ?auto_97179 ) ( HOLDING ?auto_97177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97177 )
      ( MAKE-2PILE ?auto_97172 ?auto_97173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97180 - BLOCK
      ?auto_97181 - BLOCK
    )
    :vars
    (
      ?auto_97187 - BLOCK
      ?auto_97186 - BLOCK
      ?auto_97185 - BLOCK
      ?auto_97183 - BLOCK
      ?auto_97182 - BLOCK
      ?auto_97184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97187 ?auto_97181 ) ( ON-TABLE ?auto_97180 ) ( ON ?auto_97181 ?auto_97180 ) ( not ( = ?auto_97180 ?auto_97181 ) ) ( not ( = ?auto_97180 ?auto_97187 ) ) ( not ( = ?auto_97181 ?auto_97187 ) ) ( not ( = ?auto_97180 ?auto_97186 ) ) ( not ( = ?auto_97180 ?auto_97185 ) ) ( not ( = ?auto_97181 ?auto_97186 ) ) ( not ( = ?auto_97181 ?auto_97185 ) ) ( not ( = ?auto_97187 ?auto_97186 ) ) ( not ( = ?auto_97187 ?auto_97185 ) ) ( not ( = ?auto_97186 ?auto_97185 ) ) ( ON ?auto_97186 ?auto_97187 ) ( not ( = ?auto_97183 ?auto_97182 ) ) ( not ( = ?auto_97183 ?auto_97184 ) ) ( not ( = ?auto_97183 ?auto_97185 ) ) ( not ( = ?auto_97182 ?auto_97184 ) ) ( not ( = ?auto_97182 ?auto_97185 ) ) ( not ( = ?auto_97184 ?auto_97185 ) ) ( not ( = ?auto_97180 ?auto_97184 ) ) ( not ( = ?auto_97180 ?auto_97183 ) ) ( not ( = ?auto_97180 ?auto_97182 ) ) ( not ( = ?auto_97181 ?auto_97184 ) ) ( not ( = ?auto_97181 ?auto_97183 ) ) ( not ( = ?auto_97181 ?auto_97182 ) ) ( not ( = ?auto_97187 ?auto_97184 ) ) ( not ( = ?auto_97187 ?auto_97183 ) ) ( not ( = ?auto_97187 ?auto_97182 ) ) ( not ( = ?auto_97186 ?auto_97184 ) ) ( not ( = ?auto_97186 ?auto_97183 ) ) ( not ( = ?auto_97186 ?auto_97182 ) ) ( ON ?auto_97185 ?auto_97186 ) ( ON ?auto_97184 ?auto_97185 ) ( ON ?auto_97182 ?auto_97184 ) ( ON ?auto_97183 ?auto_97182 ) ( CLEAR ?auto_97183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97180 ?auto_97181 ?auto_97187 ?auto_97186 ?auto_97185 ?auto_97184 ?auto_97182 )
      ( MAKE-2PILE ?auto_97180 ?auto_97181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97194 - BLOCK
      ?auto_97195 - BLOCK
      ?auto_97196 - BLOCK
      ?auto_97197 - BLOCK
      ?auto_97198 - BLOCK
      ?auto_97199 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_97199 ) ( CLEAR ?auto_97198 ) ( ON-TABLE ?auto_97194 ) ( ON ?auto_97195 ?auto_97194 ) ( ON ?auto_97196 ?auto_97195 ) ( ON ?auto_97197 ?auto_97196 ) ( ON ?auto_97198 ?auto_97197 ) ( not ( = ?auto_97194 ?auto_97195 ) ) ( not ( = ?auto_97194 ?auto_97196 ) ) ( not ( = ?auto_97194 ?auto_97197 ) ) ( not ( = ?auto_97194 ?auto_97198 ) ) ( not ( = ?auto_97194 ?auto_97199 ) ) ( not ( = ?auto_97195 ?auto_97196 ) ) ( not ( = ?auto_97195 ?auto_97197 ) ) ( not ( = ?auto_97195 ?auto_97198 ) ) ( not ( = ?auto_97195 ?auto_97199 ) ) ( not ( = ?auto_97196 ?auto_97197 ) ) ( not ( = ?auto_97196 ?auto_97198 ) ) ( not ( = ?auto_97196 ?auto_97199 ) ) ( not ( = ?auto_97197 ?auto_97198 ) ) ( not ( = ?auto_97197 ?auto_97199 ) ) ( not ( = ?auto_97198 ?auto_97199 ) ) )
    :subtasks
    ( ( !STACK ?auto_97199 ?auto_97198 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97200 - BLOCK
      ?auto_97201 - BLOCK
      ?auto_97202 - BLOCK
      ?auto_97203 - BLOCK
      ?auto_97204 - BLOCK
      ?auto_97205 - BLOCK
    )
    :vars
    (
      ?auto_97206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_97204 ) ( ON-TABLE ?auto_97200 ) ( ON ?auto_97201 ?auto_97200 ) ( ON ?auto_97202 ?auto_97201 ) ( ON ?auto_97203 ?auto_97202 ) ( ON ?auto_97204 ?auto_97203 ) ( not ( = ?auto_97200 ?auto_97201 ) ) ( not ( = ?auto_97200 ?auto_97202 ) ) ( not ( = ?auto_97200 ?auto_97203 ) ) ( not ( = ?auto_97200 ?auto_97204 ) ) ( not ( = ?auto_97200 ?auto_97205 ) ) ( not ( = ?auto_97201 ?auto_97202 ) ) ( not ( = ?auto_97201 ?auto_97203 ) ) ( not ( = ?auto_97201 ?auto_97204 ) ) ( not ( = ?auto_97201 ?auto_97205 ) ) ( not ( = ?auto_97202 ?auto_97203 ) ) ( not ( = ?auto_97202 ?auto_97204 ) ) ( not ( = ?auto_97202 ?auto_97205 ) ) ( not ( = ?auto_97203 ?auto_97204 ) ) ( not ( = ?auto_97203 ?auto_97205 ) ) ( not ( = ?auto_97204 ?auto_97205 ) ) ( ON ?auto_97205 ?auto_97206 ) ( CLEAR ?auto_97205 ) ( HAND-EMPTY ) ( not ( = ?auto_97200 ?auto_97206 ) ) ( not ( = ?auto_97201 ?auto_97206 ) ) ( not ( = ?auto_97202 ?auto_97206 ) ) ( not ( = ?auto_97203 ?auto_97206 ) ) ( not ( = ?auto_97204 ?auto_97206 ) ) ( not ( = ?auto_97205 ?auto_97206 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97205 ?auto_97206 )
      ( MAKE-6PILE ?auto_97200 ?auto_97201 ?auto_97202 ?auto_97203 ?auto_97204 ?auto_97205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97207 - BLOCK
      ?auto_97208 - BLOCK
      ?auto_97209 - BLOCK
      ?auto_97210 - BLOCK
      ?auto_97211 - BLOCK
      ?auto_97212 - BLOCK
    )
    :vars
    (
      ?auto_97213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97207 ) ( ON ?auto_97208 ?auto_97207 ) ( ON ?auto_97209 ?auto_97208 ) ( ON ?auto_97210 ?auto_97209 ) ( not ( = ?auto_97207 ?auto_97208 ) ) ( not ( = ?auto_97207 ?auto_97209 ) ) ( not ( = ?auto_97207 ?auto_97210 ) ) ( not ( = ?auto_97207 ?auto_97211 ) ) ( not ( = ?auto_97207 ?auto_97212 ) ) ( not ( = ?auto_97208 ?auto_97209 ) ) ( not ( = ?auto_97208 ?auto_97210 ) ) ( not ( = ?auto_97208 ?auto_97211 ) ) ( not ( = ?auto_97208 ?auto_97212 ) ) ( not ( = ?auto_97209 ?auto_97210 ) ) ( not ( = ?auto_97209 ?auto_97211 ) ) ( not ( = ?auto_97209 ?auto_97212 ) ) ( not ( = ?auto_97210 ?auto_97211 ) ) ( not ( = ?auto_97210 ?auto_97212 ) ) ( not ( = ?auto_97211 ?auto_97212 ) ) ( ON ?auto_97212 ?auto_97213 ) ( CLEAR ?auto_97212 ) ( not ( = ?auto_97207 ?auto_97213 ) ) ( not ( = ?auto_97208 ?auto_97213 ) ) ( not ( = ?auto_97209 ?auto_97213 ) ) ( not ( = ?auto_97210 ?auto_97213 ) ) ( not ( = ?auto_97211 ?auto_97213 ) ) ( not ( = ?auto_97212 ?auto_97213 ) ) ( HOLDING ?auto_97211 ) ( CLEAR ?auto_97210 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97207 ?auto_97208 ?auto_97209 ?auto_97210 ?auto_97211 )
      ( MAKE-6PILE ?auto_97207 ?auto_97208 ?auto_97209 ?auto_97210 ?auto_97211 ?auto_97212 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97214 - BLOCK
      ?auto_97215 - BLOCK
      ?auto_97216 - BLOCK
      ?auto_97217 - BLOCK
      ?auto_97218 - BLOCK
      ?auto_97219 - BLOCK
    )
    :vars
    (
      ?auto_97220 - BLOCK
      ?auto_97221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97214 ) ( ON ?auto_97215 ?auto_97214 ) ( ON ?auto_97216 ?auto_97215 ) ( ON ?auto_97217 ?auto_97216 ) ( not ( = ?auto_97214 ?auto_97215 ) ) ( not ( = ?auto_97214 ?auto_97216 ) ) ( not ( = ?auto_97214 ?auto_97217 ) ) ( not ( = ?auto_97214 ?auto_97218 ) ) ( not ( = ?auto_97214 ?auto_97219 ) ) ( not ( = ?auto_97215 ?auto_97216 ) ) ( not ( = ?auto_97215 ?auto_97217 ) ) ( not ( = ?auto_97215 ?auto_97218 ) ) ( not ( = ?auto_97215 ?auto_97219 ) ) ( not ( = ?auto_97216 ?auto_97217 ) ) ( not ( = ?auto_97216 ?auto_97218 ) ) ( not ( = ?auto_97216 ?auto_97219 ) ) ( not ( = ?auto_97217 ?auto_97218 ) ) ( not ( = ?auto_97217 ?auto_97219 ) ) ( not ( = ?auto_97218 ?auto_97219 ) ) ( ON ?auto_97219 ?auto_97220 ) ( not ( = ?auto_97214 ?auto_97220 ) ) ( not ( = ?auto_97215 ?auto_97220 ) ) ( not ( = ?auto_97216 ?auto_97220 ) ) ( not ( = ?auto_97217 ?auto_97220 ) ) ( not ( = ?auto_97218 ?auto_97220 ) ) ( not ( = ?auto_97219 ?auto_97220 ) ) ( CLEAR ?auto_97217 ) ( ON ?auto_97218 ?auto_97219 ) ( CLEAR ?auto_97218 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97221 ) ( ON ?auto_97220 ?auto_97221 ) ( not ( = ?auto_97221 ?auto_97220 ) ) ( not ( = ?auto_97221 ?auto_97219 ) ) ( not ( = ?auto_97221 ?auto_97218 ) ) ( not ( = ?auto_97214 ?auto_97221 ) ) ( not ( = ?auto_97215 ?auto_97221 ) ) ( not ( = ?auto_97216 ?auto_97221 ) ) ( not ( = ?auto_97217 ?auto_97221 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97221 ?auto_97220 ?auto_97219 )
      ( MAKE-6PILE ?auto_97214 ?auto_97215 ?auto_97216 ?auto_97217 ?auto_97218 ?auto_97219 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97222 - BLOCK
      ?auto_97223 - BLOCK
      ?auto_97224 - BLOCK
      ?auto_97225 - BLOCK
      ?auto_97226 - BLOCK
      ?auto_97227 - BLOCK
    )
    :vars
    (
      ?auto_97229 - BLOCK
      ?auto_97228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97222 ) ( ON ?auto_97223 ?auto_97222 ) ( ON ?auto_97224 ?auto_97223 ) ( not ( = ?auto_97222 ?auto_97223 ) ) ( not ( = ?auto_97222 ?auto_97224 ) ) ( not ( = ?auto_97222 ?auto_97225 ) ) ( not ( = ?auto_97222 ?auto_97226 ) ) ( not ( = ?auto_97222 ?auto_97227 ) ) ( not ( = ?auto_97223 ?auto_97224 ) ) ( not ( = ?auto_97223 ?auto_97225 ) ) ( not ( = ?auto_97223 ?auto_97226 ) ) ( not ( = ?auto_97223 ?auto_97227 ) ) ( not ( = ?auto_97224 ?auto_97225 ) ) ( not ( = ?auto_97224 ?auto_97226 ) ) ( not ( = ?auto_97224 ?auto_97227 ) ) ( not ( = ?auto_97225 ?auto_97226 ) ) ( not ( = ?auto_97225 ?auto_97227 ) ) ( not ( = ?auto_97226 ?auto_97227 ) ) ( ON ?auto_97227 ?auto_97229 ) ( not ( = ?auto_97222 ?auto_97229 ) ) ( not ( = ?auto_97223 ?auto_97229 ) ) ( not ( = ?auto_97224 ?auto_97229 ) ) ( not ( = ?auto_97225 ?auto_97229 ) ) ( not ( = ?auto_97226 ?auto_97229 ) ) ( not ( = ?auto_97227 ?auto_97229 ) ) ( ON ?auto_97226 ?auto_97227 ) ( CLEAR ?auto_97226 ) ( ON-TABLE ?auto_97228 ) ( ON ?auto_97229 ?auto_97228 ) ( not ( = ?auto_97228 ?auto_97229 ) ) ( not ( = ?auto_97228 ?auto_97227 ) ) ( not ( = ?auto_97228 ?auto_97226 ) ) ( not ( = ?auto_97222 ?auto_97228 ) ) ( not ( = ?auto_97223 ?auto_97228 ) ) ( not ( = ?auto_97224 ?auto_97228 ) ) ( not ( = ?auto_97225 ?auto_97228 ) ) ( HOLDING ?auto_97225 ) ( CLEAR ?auto_97224 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97222 ?auto_97223 ?auto_97224 ?auto_97225 )
      ( MAKE-6PILE ?auto_97222 ?auto_97223 ?auto_97224 ?auto_97225 ?auto_97226 ?auto_97227 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97230 - BLOCK
      ?auto_97231 - BLOCK
      ?auto_97232 - BLOCK
      ?auto_97233 - BLOCK
      ?auto_97234 - BLOCK
      ?auto_97235 - BLOCK
    )
    :vars
    (
      ?auto_97236 - BLOCK
      ?auto_97237 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97230 ) ( ON ?auto_97231 ?auto_97230 ) ( ON ?auto_97232 ?auto_97231 ) ( not ( = ?auto_97230 ?auto_97231 ) ) ( not ( = ?auto_97230 ?auto_97232 ) ) ( not ( = ?auto_97230 ?auto_97233 ) ) ( not ( = ?auto_97230 ?auto_97234 ) ) ( not ( = ?auto_97230 ?auto_97235 ) ) ( not ( = ?auto_97231 ?auto_97232 ) ) ( not ( = ?auto_97231 ?auto_97233 ) ) ( not ( = ?auto_97231 ?auto_97234 ) ) ( not ( = ?auto_97231 ?auto_97235 ) ) ( not ( = ?auto_97232 ?auto_97233 ) ) ( not ( = ?auto_97232 ?auto_97234 ) ) ( not ( = ?auto_97232 ?auto_97235 ) ) ( not ( = ?auto_97233 ?auto_97234 ) ) ( not ( = ?auto_97233 ?auto_97235 ) ) ( not ( = ?auto_97234 ?auto_97235 ) ) ( ON ?auto_97235 ?auto_97236 ) ( not ( = ?auto_97230 ?auto_97236 ) ) ( not ( = ?auto_97231 ?auto_97236 ) ) ( not ( = ?auto_97232 ?auto_97236 ) ) ( not ( = ?auto_97233 ?auto_97236 ) ) ( not ( = ?auto_97234 ?auto_97236 ) ) ( not ( = ?auto_97235 ?auto_97236 ) ) ( ON ?auto_97234 ?auto_97235 ) ( ON-TABLE ?auto_97237 ) ( ON ?auto_97236 ?auto_97237 ) ( not ( = ?auto_97237 ?auto_97236 ) ) ( not ( = ?auto_97237 ?auto_97235 ) ) ( not ( = ?auto_97237 ?auto_97234 ) ) ( not ( = ?auto_97230 ?auto_97237 ) ) ( not ( = ?auto_97231 ?auto_97237 ) ) ( not ( = ?auto_97232 ?auto_97237 ) ) ( not ( = ?auto_97233 ?auto_97237 ) ) ( CLEAR ?auto_97232 ) ( ON ?auto_97233 ?auto_97234 ) ( CLEAR ?auto_97233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97237 ?auto_97236 ?auto_97235 ?auto_97234 )
      ( MAKE-6PILE ?auto_97230 ?auto_97231 ?auto_97232 ?auto_97233 ?auto_97234 ?auto_97235 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97238 - BLOCK
      ?auto_97239 - BLOCK
      ?auto_97240 - BLOCK
      ?auto_97241 - BLOCK
      ?auto_97242 - BLOCK
      ?auto_97243 - BLOCK
    )
    :vars
    (
      ?auto_97244 - BLOCK
      ?auto_97245 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97238 ) ( ON ?auto_97239 ?auto_97238 ) ( not ( = ?auto_97238 ?auto_97239 ) ) ( not ( = ?auto_97238 ?auto_97240 ) ) ( not ( = ?auto_97238 ?auto_97241 ) ) ( not ( = ?auto_97238 ?auto_97242 ) ) ( not ( = ?auto_97238 ?auto_97243 ) ) ( not ( = ?auto_97239 ?auto_97240 ) ) ( not ( = ?auto_97239 ?auto_97241 ) ) ( not ( = ?auto_97239 ?auto_97242 ) ) ( not ( = ?auto_97239 ?auto_97243 ) ) ( not ( = ?auto_97240 ?auto_97241 ) ) ( not ( = ?auto_97240 ?auto_97242 ) ) ( not ( = ?auto_97240 ?auto_97243 ) ) ( not ( = ?auto_97241 ?auto_97242 ) ) ( not ( = ?auto_97241 ?auto_97243 ) ) ( not ( = ?auto_97242 ?auto_97243 ) ) ( ON ?auto_97243 ?auto_97244 ) ( not ( = ?auto_97238 ?auto_97244 ) ) ( not ( = ?auto_97239 ?auto_97244 ) ) ( not ( = ?auto_97240 ?auto_97244 ) ) ( not ( = ?auto_97241 ?auto_97244 ) ) ( not ( = ?auto_97242 ?auto_97244 ) ) ( not ( = ?auto_97243 ?auto_97244 ) ) ( ON ?auto_97242 ?auto_97243 ) ( ON-TABLE ?auto_97245 ) ( ON ?auto_97244 ?auto_97245 ) ( not ( = ?auto_97245 ?auto_97244 ) ) ( not ( = ?auto_97245 ?auto_97243 ) ) ( not ( = ?auto_97245 ?auto_97242 ) ) ( not ( = ?auto_97238 ?auto_97245 ) ) ( not ( = ?auto_97239 ?auto_97245 ) ) ( not ( = ?auto_97240 ?auto_97245 ) ) ( not ( = ?auto_97241 ?auto_97245 ) ) ( ON ?auto_97241 ?auto_97242 ) ( CLEAR ?auto_97241 ) ( HOLDING ?auto_97240 ) ( CLEAR ?auto_97239 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97238 ?auto_97239 ?auto_97240 )
      ( MAKE-6PILE ?auto_97238 ?auto_97239 ?auto_97240 ?auto_97241 ?auto_97242 ?auto_97243 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97246 - BLOCK
      ?auto_97247 - BLOCK
      ?auto_97248 - BLOCK
      ?auto_97249 - BLOCK
      ?auto_97250 - BLOCK
      ?auto_97251 - BLOCK
    )
    :vars
    (
      ?auto_97253 - BLOCK
      ?auto_97252 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97246 ) ( ON ?auto_97247 ?auto_97246 ) ( not ( = ?auto_97246 ?auto_97247 ) ) ( not ( = ?auto_97246 ?auto_97248 ) ) ( not ( = ?auto_97246 ?auto_97249 ) ) ( not ( = ?auto_97246 ?auto_97250 ) ) ( not ( = ?auto_97246 ?auto_97251 ) ) ( not ( = ?auto_97247 ?auto_97248 ) ) ( not ( = ?auto_97247 ?auto_97249 ) ) ( not ( = ?auto_97247 ?auto_97250 ) ) ( not ( = ?auto_97247 ?auto_97251 ) ) ( not ( = ?auto_97248 ?auto_97249 ) ) ( not ( = ?auto_97248 ?auto_97250 ) ) ( not ( = ?auto_97248 ?auto_97251 ) ) ( not ( = ?auto_97249 ?auto_97250 ) ) ( not ( = ?auto_97249 ?auto_97251 ) ) ( not ( = ?auto_97250 ?auto_97251 ) ) ( ON ?auto_97251 ?auto_97253 ) ( not ( = ?auto_97246 ?auto_97253 ) ) ( not ( = ?auto_97247 ?auto_97253 ) ) ( not ( = ?auto_97248 ?auto_97253 ) ) ( not ( = ?auto_97249 ?auto_97253 ) ) ( not ( = ?auto_97250 ?auto_97253 ) ) ( not ( = ?auto_97251 ?auto_97253 ) ) ( ON ?auto_97250 ?auto_97251 ) ( ON-TABLE ?auto_97252 ) ( ON ?auto_97253 ?auto_97252 ) ( not ( = ?auto_97252 ?auto_97253 ) ) ( not ( = ?auto_97252 ?auto_97251 ) ) ( not ( = ?auto_97252 ?auto_97250 ) ) ( not ( = ?auto_97246 ?auto_97252 ) ) ( not ( = ?auto_97247 ?auto_97252 ) ) ( not ( = ?auto_97248 ?auto_97252 ) ) ( not ( = ?auto_97249 ?auto_97252 ) ) ( ON ?auto_97249 ?auto_97250 ) ( CLEAR ?auto_97247 ) ( ON ?auto_97248 ?auto_97249 ) ( CLEAR ?auto_97248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97252 ?auto_97253 ?auto_97251 ?auto_97250 ?auto_97249 )
      ( MAKE-6PILE ?auto_97246 ?auto_97247 ?auto_97248 ?auto_97249 ?auto_97250 ?auto_97251 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97254 - BLOCK
      ?auto_97255 - BLOCK
      ?auto_97256 - BLOCK
      ?auto_97257 - BLOCK
      ?auto_97258 - BLOCK
      ?auto_97259 - BLOCK
    )
    :vars
    (
      ?auto_97261 - BLOCK
      ?auto_97260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97254 ) ( not ( = ?auto_97254 ?auto_97255 ) ) ( not ( = ?auto_97254 ?auto_97256 ) ) ( not ( = ?auto_97254 ?auto_97257 ) ) ( not ( = ?auto_97254 ?auto_97258 ) ) ( not ( = ?auto_97254 ?auto_97259 ) ) ( not ( = ?auto_97255 ?auto_97256 ) ) ( not ( = ?auto_97255 ?auto_97257 ) ) ( not ( = ?auto_97255 ?auto_97258 ) ) ( not ( = ?auto_97255 ?auto_97259 ) ) ( not ( = ?auto_97256 ?auto_97257 ) ) ( not ( = ?auto_97256 ?auto_97258 ) ) ( not ( = ?auto_97256 ?auto_97259 ) ) ( not ( = ?auto_97257 ?auto_97258 ) ) ( not ( = ?auto_97257 ?auto_97259 ) ) ( not ( = ?auto_97258 ?auto_97259 ) ) ( ON ?auto_97259 ?auto_97261 ) ( not ( = ?auto_97254 ?auto_97261 ) ) ( not ( = ?auto_97255 ?auto_97261 ) ) ( not ( = ?auto_97256 ?auto_97261 ) ) ( not ( = ?auto_97257 ?auto_97261 ) ) ( not ( = ?auto_97258 ?auto_97261 ) ) ( not ( = ?auto_97259 ?auto_97261 ) ) ( ON ?auto_97258 ?auto_97259 ) ( ON-TABLE ?auto_97260 ) ( ON ?auto_97261 ?auto_97260 ) ( not ( = ?auto_97260 ?auto_97261 ) ) ( not ( = ?auto_97260 ?auto_97259 ) ) ( not ( = ?auto_97260 ?auto_97258 ) ) ( not ( = ?auto_97254 ?auto_97260 ) ) ( not ( = ?auto_97255 ?auto_97260 ) ) ( not ( = ?auto_97256 ?auto_97260 ) ) ( not ( = ?auto_97257 ?auto_97260 ) ) ( ON ?auto_97257 ?auto_97258 ) ( ON ?auto_97256 ?auto_97257 ) ( CLEAR ?auto_97256 ) ( HOLDING ?auto_97255 ) ( CLEAR ?auto_97254 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97254 ?auto_97255 )
      ( MAKE-6PILE ?auto_97254 ?auto_97255 ?auto_97256 ?auto_97257 ?auto_97258 ?auto_97259 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97262 - BLOCK
      ?auto_97263 - BLOCK
      ?auto_97264 - BLOCK
      ?auto_97265 - BLOCK
      ?auto_97266 - BLOCK
      ?auto_97267 - BLOCK
    )
    :vars
    (
      ?auto_97269 - BLOCK
      ?auto_97268 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97262 ) ( not ( = ?auto_97262 ?auto_97263 ) ) ( not ( = ?auto_97262 ?auto_97264 ) ) ( not ( = ?auto_97262 ?auto_97265 ) ) ( not ( = ?auto_97262 ?auto_97266 ) ) ( not ( = ?auto_97262 ?auto_97267 ) ) ( not ( = ?auto_97263 ?auto_97264 ) ) ( not ( = ?auto_97263 ?auto_97265 ) ) ( not ( = ?auto_97263 ?auto_97266 ) ) ( not ( = ?auto_97263 ?auto_97267 ) ) ( not ( = ?auto_97264 ?auto_97265 ) ) ( not ( = ?auto_97264 ?auto_97266 ) ) ( not ( = ?auto_97264 ?auto_97267 ) ) ( not ( = ?auto_97265 ?auto_97266 ) ) ( not ( = ?auto_97265 ?auto_97267 ) ) ( not ( = ?auto_97266 ?auto_97267 ) ) ( ON ?auto_97267 ?auto_97269 ) ( not ( = ?auto_97262 ?auto_97269 ) ) ( not ( = ?auto_97263 ?auto_97269 ) ) ( not ( = ?auto_97264 ?auto_97269 ) ) ( not ( = ?auto_97265 ?auto_97269 ) ) ( not ( = ?auto_97266 ?auto_97269 ) ) ( not ( = ?auto_97267 ?auto_97269 ) ) ( ON ?auto_97266 ?auto_97267 ) ( ON-TABLE ?auto_97268 ) ( ON ?auto_97269 ?auto_97268 ) ( not ( = ?auto_97268 ?auto_97269 ) ) ( not ( = ?auto_97268 ?auto_97267 ) ) ( not ( = ?auto_97268 ?auto_97266 ) ) ( not ( = ?auto_97262 ?auto_97268 ) ) ( not ( = ?auto_97263 ?auto_97268 ) ) ( not ( = ?auto_97264 ?auto_97268 ) ) ( not ( = ?auto_97265 ?auto_97268 ) ) ( ON ?auto_97265 ?auto_97266 ) ( ON ?auto_97264 ?auto_97265 ) ( CLEAR ?auto_97262 ) ( ON ?auto_97263 ?auto_97264 ) ( CLEAR ?auto_97263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97268 ?auto_97269 ?auto_97267 ?auto_97266 ?auto_97265 ?auto_97264 )
      ( MAKE-6PILE ?auto_97262 ?auto_97263 ?auto_97264 ?auto_97265 ?auto_97266 ?auto_97267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97270 - BLOCK
      ?auto_97271 - BLOCK
      ?auto_97272 - BLOCK
      ?auto_97273 - BLOCK
      ?auto_97274 - BLOCK
      ?auto_97275 - BLOCK
    )
    :vars
    (
      ?auto_97276 - BLOCK
      ?auto_97277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97270 ?auto_97271 ) ) ( not ( = ?auto_97270 ?auto_97272 ) ) ( not ( = ?auto_97270 ?auto_97273 ) ) ( not ( = ?auto_97270 ?auto_97274 ) ) ( not ( = ?auto_97270 ?auto_97275 ) ) ( not ( = ?auto_97271 ?auto_97272 ) ) ( not ( = ?auto_97271 ?auto_97273 ) ) ( not ( = ?auto_97271 ?auto_97274 ) ) ( not ( = ?auto_97271 ?auto_97275 ) ) ( not ( = ?auto_97272 ?auto_97273 ) ) ( not ( = ?auto_97272 ?auto_97274 ) ) ( not ( = ?auto_97272 ?auto_97275 ) ) ( not ( = ?auto_97273 ?auto_97274 ) ) ( not ( = ?auto_97273 ?auto_97275 ) ) ( not ( = ?auto_97274 ?auto_97275 ) ) ( ON ?auto_97275 ?auto_97276 ) ( not ( = ?auto_97270 ?auto_97276 ) ) ( not ( = ?auto_97271 ?auto_97276 ) ) ( not ( = ?auto_97272 ?auto_97276 ) ) ( not ( = ?auto_97273 ?auto_97276 ) ) ( not ( = ?auto_97274 ?auto_97276 ) ) ( not ( = ?auto_97275 ?auto_97276 ) ) ( ON ?auto_97274 ?auto_97275 ) ( ON-TABLE ?auto_97277 ) ( ON ?auto_97276 ?auto_97277 ) ( not ( = ?auto_97277 ?auto_97276 ) ) ( not ( = ?auto_97277 ?auto_97275 ) ) ( not ( = ?auto_97277 ?auto_97274 ) ) ( not ( = ?auto_97270 ?auto_97277 ) ) ( not ( = ?auto_97271 ?auto_97277 ) ) ( not ( = ?auto_97272 ?auto_97277 ) ) ( not ( = ?auto_97273 ?auto_97277 ) ) ( ON ?auto_97273 ?auto_97274 ) ( ON ?auto_97272 ?auto_97273 ) ( ON ?auto_97271 ?auto_97272 ) ( CLEAR ?auto_97271 ) ( HOLDING ?auto_97270 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97270 )
      ( MAKE-6PILE ?auto_97270 ?auto_97271 ?auto_97272 ?auto_97273 ?auto_97274 ?auto_97275 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_97278 - BLOCK
      ?auto_97279 - BLOCK
      ?auto_97280 - BLOCK
      ?auto_97281 - BLOCK
      ?auto_97282 - BLOCK
      ?auto_97283 - BLOCK
    )
    :vars
    (
      ?auto_97284 - BLOCK
      ?auto_97285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97278 ?auto_97279 ) ) ( not ( = ?auto_97278 ?auto_97280 ) ) ( not ( = ?auto_97278 ?auto_97281 ) ) ( not ( = ?auto_97278 ?auto_97282 ) ) ( not ( = ?auto_97278 ?auto_97283 ) ) ( not ( = ?auto_97279 ?auto_97280 ) ) ( not ( = ?auto_97279 ?auto_97281 ) ) ( not ( = ?auto_97279 ?auto_97282 ) ) ( not ( = ?auto_97279 ?auto_97283 ) ) ( not ( = ?auto_97280 ?auto_97281 ) ) ( not ( = ?auto_97280 ?auto_97282 ) ) ( not ( = ?auto_97280 ?auto_97283 ) ) ( not ( = ?auto_97281 ?auto_97282 ) ) ( not ( = ?auto_97281 ?auto_97283 ) ) ( not ( = ?auto_97282 ?auto_97283 ) ) ( ON ?auto_97283 ?auto_97284 ) ( not ( = ?auto_97278 ?auto_97284 ) ) ( not ( = ?auto_97279 ?auto_97284 ) ) ( not ( = ?auto_97280 ?auto_97284 ) ) ( not ( = ?auto_97281 ?auto_97284 ) ) ( not ( = ?auto_97282 ?auto_97284 ) ) ( not ( = ?auto_97283 ?auto_97284 ) ) ( ON ?auto_97282 ?auto_97283 ) ( ON-TABLE ?auto_97285 ) ( ON ?auto_97284 ?auto_97285 ) ( not ( = ?auto_97285 ?auto_97284 ) ) ( not ( = ?auto_97285 ?auto_97283 ) ) ( not ( = ?auto_97285 ?auto_97282 ) ) ( not ( = ?auto_97278 ?auto_97285 ) ) ( not ( = ?auto_97279 ?auto_97285 ) ) ( not ( = ?auto_97280 ?auto_97285 ) ) ( not ( = ?auto_97281 ?auto_97285 ) ) ( ON ?auto_97281 ?auto_97282 ) ( ON ?auto_97280 ?auto_97281 ) ( ON ?auto_97279 ?auto_97280 ) ( ON ?auto_97278 ?auto_97279 ) ( CLEAR ?auto_97278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97285 ?auto_97284 ?auto_97283 ?auto_97282 ?auto_97281 ?auto_97280 ?auto_97279 )
      ( MAKE-6PILE ?auto_97278 ?auto_97279 ?auto_97280 ?auto_97281 ?auto_97282 ?auto_97283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97287 - BLOCK
    )
    :vars
    (
      ?auto_97288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97288 ?auto_97287 ) ( CLEAR ?auto_97288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97287 ) ( not ( = ?auto_97287 ?auto_97288 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97288 ?auto_97287 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97289 - BLOCK
    )
    :vars
    (
      ?auto_97290 - BLOCK
      ?auto_97291 - BLOCK
      ?auto_97292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97290 ?auto_97289 ) ( CLEAR ?auto_97290 ) ( ON-TABLE ?auto_97289 ) ( not ( = ?auto_97289 ?auto_97290 ) ) ( HOLDING ?auto_97291 ) ( CLEAR ?auto_97292 ) ( not ( = ?auto_97289 ?auto_97291 ) ) ( not ( = ?auto_97289 ?auto_97292 ) ) ( not ( = ?auto_97290 ?auto_97291 ) ) ( not ( = ?auto_97290 ?auto_97292 ) ) ( not ( = ?auto_97291 ?auto_97292 ) ) )
    :subtasks
    ( ( !STACK ?auto_97291 ?auto_97292 )
      ( MAKE-1PILE ?auto_97289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97293 - BLOCK
    )
    :vars
    (
      ?auto_97296 - BLOCK
      ?auto_97295 - BLOCK
      ?auto_97294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97296 ?auto_97293 ) ( ON-TABLE ?auto_97293 ) ( not ( = ?auto_97293 ?auto_97296 ) ) ( CLEAR ?auto_97295 ) ( not ( = ?auto_97293 ?auto_97294 ) ) ( not ( = ?auto_97293 ?auto_97295 ) ) ( not ( = ?auto_97296 ?auto_97294 ) ) ( not ( = ?auto_97296 ?auto_97295 ) ) ( not ( = ?auto_97294 ?auto_97295 ) ) ( ON ?auto_97294 ?auto_97296 ) ( CLEAR ?auto_97294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97293 ?auto_97296 )
      ( MAKE-1PILE ?auto_97293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97297 - BLOCK
    )
    :vars
    (
      ?auto_97299 - BLOCK
      ?auto_97300 - BLOCK
      ?auto_97298 - BLOCK
      ?auto_97301 - BLOCK
      ?auto_97304 - BLOCK
      ?auto_97302 - BLOCK
      ?auto_97303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97299 ?auto_97297 ) ( ON-TABLE ?auto_97297 ) ( not ( = ?auto_97297 ?auto_97299 ) ) ( not ( = ?auto_97297 ?auto_97300 ) ) ( not ( = ?auto_97297 ?auto_97298 ) ) ( not ( = ?auto_97299 ?auto_97300 ) ) ( not ( = ?auto_97299 ?auto_97298 ) ) ( not ( = ?auto_97300 ?auto_97298 ) ) ( ON ?auto_97300 ?auto_97299 ) ( CLEAR ?auto_97300 ) ( HOLDING ?auto_97298 ) ( CLEAR ?auto_97301 ) ( ON-TABLE ?auto_97304 ) ( ON ?auto_97302 ?auto_97304 ) ( ON ?auto_97303 ?auto_97302 ) ( ON ?auto_97301 ?auto_97303 ) ( not ( = ?auto_97304 ?auto_97302 ) ) ( not ( = ?auto_97304 ?auto_97303 ) ) ( not ( = ?auto_97304 ?auto_97301 ) ) ( not ( = ?auto_97304 ?auto_97298 ) ) ( not ( = ?auto_97302 ?auto_97303 ) ) ( not ( = ?auto_97302 ?auto_97301 ) ) ( not ( = ?auto_97302 ?auto_97298 ) ) ( not ( = ?auto_97303 ?auto_97301 ) ) ( not ( = ?auto_97303 ?auto_97298 ) ) ( not ( = ?auto_97301 ?auto_97298 ) ) ( not ( = ?auto_97297 ?auto_97301 ) ) ( not ( = ?auto_97297 ?auto_97304 ) ) ( not ( = ?auto_97297 ?auto_97302 ) ) ( not ( = ?auto_97297 ?auto_97303 ) ) ( not ( = ?auto_97299 ?auto_97301 ) ) ( not ( = ?auto_97299 ?auto_97304 ) ) ( not ( = ?auto_97299 ?auto_97302 ) ) ( not ( = ?auto_97299 ?auto_97303 ) ) ( not ( = ?auto_97300 ?auto_97301 ) ) ( not ( = ?auto_97300 ?auto_97304 ) ) ( not ( = ?auto_97300 ?auto_97302 ) ) ( not ( = ?auto_97300 ?auto_97303 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97304 ?auto_97302 ?auto_97303 ?auto_97301 ?auto_97298 )
      ( MAKE-1PILE ?auto_97297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97305 - BLOCK
    )
    :vars
    (
      ?auto_97311 - BLOCK
      ?auto_97309 - BLOCK
      ?auto_97306 - BLOCK
      ?auto_97307 - BLOCK
      ?auto_97308 - BLOCK
      ?auto_97310 - BLOCK
      ?auto_97312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97311 ?auto_97305 ) ( ON-TABLE ?auto_97305 ) ( not ( = ?auto_97305 ?auto_97311 ) ) ( not ( = ?auto_97305 ?auto_97309 ) ) ( not ( = ?auto_97305 ?auto_97306 ) ) ( not ( = ?auto_97311 ?auto_97309 ) ) ( not ( = ?auto_97311 ?auto_97306 ) ) ( not ( = ?auto_97309 ?auto_97306 ) ) ( ON ?auto_97309 ?auto_97311 ) ( CLEAR ?auto_97307 ) ( ON-TABLE ?auto_97308 ) ( ON ?auto_97310 ?auto_97308 ) ( ON ?auto_97312 ?auto_97310 ) ( ON ?auto_97307 ?auto_97312 ) ( not ( = ?auto_97308 ?auto_97310 ) ) ( not ( = ?auto_97308 ?auto_97312 ) ) ( not ( = ?auto_97308 ?auto_97307 ) ) ( not ( = ?auto_97308 ?auto_97306 ) ) ( not ( = ?auto_97310 ?auto_97312 ) ) ( not ( = ?auto_97310 ?auto_97307 ) ) ( not ( = ?auto_97310 ?auto_97306 ) ) ( not ( = ?auto_97312 ?auto_97307 ) ) ( not ( = ?auto_97312 ?auto_97306 ) ) ( not ( = ?auto_97307 ?auto_97306 ) ) ( not ( = ?auto_97305 ?auto_97307 ) ) ( not ( = ?auto_97305 ?auto_97308 ) ) ( not ( = ?auto_97305 ?auto_97310 ) ) ( not ( = ?auto_97305 ?auto_97312 ) ) ( not ( = ?auto_97311 ?auto_97307 ) ) ( not ( = ?auto_97311 ?auto_97308 ) ) ( not ( = ?auto_97311 ?auto_97310 ) ) ( not ( = ?auto_97311 ?auto_97312 ) ) ( not ( = ?auto_97309 ?auto_97307 ) ) ( not ( = ?auto_97309 ?auto_97308 ) ) ( not ( = ?auto_97309 ?auto_97310 ) ) ( not ( = ?auto_97309 ?auto_97312 ) ) ( ON ?auto_97306 ?auto_97309 ) ( CLEAR ?auto_97306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97305 ?auto_97311 ?auto_97309 )
      ( MAKE-1PILE ?auto_97305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97313 - BLOCK
    )
    :vars
    (
      ?auto_97317 - BLOCK
      ?auto_97315 - BLOCK
      ?auto_97314 - BLOCK
      ?auto_97316 - BLOCK
      ?auto_97318 - BLOCK
      ?auto_97320 - BLOCK
      ?auto_97319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97317 ?auto_97313 ) ( ON-TABLE ?auto_97313 ) ( not ( = ?auto_97313 ?auto_97317 ) ) ( not ( = ?auto_97313 ?auto_97315 ) ) ( not ( = ?auto_97313 ?auto_97314 ) ) ( not ( = ?auto_97317 ?auto_97315 ) ) ( not ( = ?auto_97317 ?auto_97314 ) ) ( not ( = ?auto_97315 ?auto_97314 ) ) ( ON ?auto_97315 ?auto_97317 ) ( ON-TABLE ?auto_97316 ) ( ON ?auto_97318 ?auto_97316 ) ( ON ?auto_97320 ?auto_97318 ) ( not ( = ?auto_97316 ?auto_97318 ) ) ( not ( = ?auto_97316 ?auto_97320 ) ) ( not ( = ?auto_97316 ?auto_97319 ) ) ( not ( = ?auto_97316 ?auto_97314 ) ) ( not ( = ?auto_97318 ?auto_97320 ) ) ( not ( = ?auto_97318 ?auto_97319 ) ) ( not ( = ?auto_97318 ?auto_97314 ) ) ( not ( = ?auto_97320 ?auto_97319 ) ) ( not ( = ?auto_97320 ?auto_97314 ) ) ( not ( = ?auto_97319 ?auto_97314 ) ) ( not ( = ?auto_97313 ?auto_97319 ) ) ( not ( = ?auto_97313 ?auto_97316 ) ) ( not ( = ?auto_97313 ?auto_97318 ) ) ( not ( = ?auto_97313 ?auto_97320 ) ) ( not ( = ?auto_97317 ?auto_97319 ) ) ( not ( = ?auto_97317 ?auto_97316 ) ) ( not ( = ?auto_97317 ?auto_97318 ) ) ( not ( = ?auto_97317 ?auto_97320 ) ) ( not ( = ?auto_97315 ?auto_97319 ) ) ( not ( = ?auto_97315 ?auto_97316 ) ) ( not ( = ?auto_97315 ?auto_97318 ) ) ( not ( = ?auto_97315 ?auto_97320 ) ) ( ON ?auto_97314 ?auto_97315 ) ( CLEAR ?auto_97314 ) ( HOLDING ?auto_97319 ) ( CLEAR ?auto_97320 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97316 ?auto_97318 ?auto_97320 ?auto_97319 )
      ( MAKE-1PILE ?auto_97313 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97321 - BLOCK
    )
    :vars
    (
      ?auto_97326 - BLOCK
      ?auto_97325 - BLOCK
      ?auto_97328 - BLOCK
      ?auto_97324 - BLOCK
      ?auto_97322 - BLOCK
      ?auto_97327 - BLOCK
      ?auto_97323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97326 ?auto_97321 ) ( ON-TABLE ?auto_97321 ) ( not ( = ?auto_97321 ?auto_97326 ) ) ( not ( = ?auto_97321 ?auto_97325 ) ) ( not ( = ?auto_97321 ?auto_97328 ) ) ( not ( = ?auto_97326 ?auto_97325 ) ) ( not ( = ?auto_97326 ?auto_97328 ) ) ( not ( = ?auto_97325 ?auto_97328 ) ) ( ON ?auto_97325 ?auto_97326 ) ( ON-TABLE ?auto_97324 ) ( ON ?auto_97322 ?auto_97324 ) ( ON ?auto_97327 ?auto_97322 ) ( not ( = ?auto_97324 ?auto_97322 ) ) ( not ( = ?auto_97324 ?auto_97327 ) ) ( not ( = ?auto_97324 ?auto_97323 ) ) ( not ( = ?auto_97324 ?auto_97328 ) ) ( not ( = ?auto_97322 ?auto_97327 ) ) ( not ( = ?auto_97322 ?auto_97323 ) ) ( not ( = ?auto_97322 ?auto_97328 ) ) ( not ( = ?auto_97327 ?auto_97323 ) ) ( not ( = ?auto_97327 ?auto_97328 ) ) ( not ( = ?auto_97323 ?auto_97328 ) ) ( not ( = ?auto_97321 ?auto_97323 ) ) ( not ( = ?auto_97321 ?auto_97324 ) ) ( not ( = ?auto_97321 ?auto_97322 ) ) ( not ( = ?auto_97321 ?auto_97327 ) ) ( not ( = ?auto_97326 ?auto_97323 ) ) ( not ( = ?auto_97326 ?auto_97324 ) ) ( not ( = ?auto_97326 ?auto_97322 ) ) ( not ( = ?auto_97326 ?auto_97327 ) ) ( not ( = ?auto_97325 ?auto_97323 ) ) ( not ( = ?auto_97325 ?auto_97324 ) ) ( not ( = ?auto_97325 ?auto_97322 ) ) ( not ( = ?auto_97325 ?auto_97327 ) ) ( ON ?auto_97328 ?auto_97325 ) ( CLEAR ?auto_97327 ) ( ON ?auto_97323 ?auto_97328 ) ( CLEAR ?auto_97323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97321 ?auto_97326 ?auto_97325 ?auto_97328 )
      ( MAKE-1PILE ?auto_97321 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97329 - BLOCK
    )
    :vars
    (
      ?auto_97335 - BLOCK
      ?auto_97330 - BLOCK
      ?auto_97331 - BLOCK
      ?auto_97332 - BLOCK
      ?auto_97336 - BLOCK
      ?auto_97333 - BLOCK
      ?auto_97334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97335 ?auto_97329 ) ( ON-TABLE ?auto_97329 ) ( not ( = ?auto_97329 ?auto_97335 ) ) ( not ( = ?auto_97329 ?auto_97330 ) ) ( not ( = ?auto_97329 ?auto_97331 ) ) ( not ( = ?auto_97335 ?auto_97330 ) ) ( not ( = ?auto_97335 ?auto_97331 ) ) ( not ( = ?auto_97330 ?auto_97331 ) ) ( ON ?auto_97330 ?auto_97335 ) ( ON-TABLE ?auto_97332 ) ( ON ?auto_97336 ?auto_97332 ) ( not ( = ?auto_97332 ?auto_97336 ) ) ( not ( = ?auto_97332 ?auto_97333 ) ) ( not ( = ?auto_97332 ?auto_97334 ) ) ( not ( = ?auto_97332 ?auto_97331 ) ) ( not ( = ?auto_97336 ?auto_97333 ) ) ( not ( = ?auto_97336 ?auto_97334 ) ) ( not ( = ?auto_97336 ?auto_97331 ) ) ( not ( = ?auto_97333 ?auto_97334 ) ) ( not ( = ?auto_97333 ?auto_97331 ) ) ( not ( = ?auto_97334 ?auto_97331 ) ) ( not ( = ?auto_97329 ?auto_97334 ) ) ( not ( = ?auto_97329 ?auto_97332 ) ) ( not ( = ?auto_97329 ?auto_97336 ) ) ( not ( = ?auto_97329 ?auto_97333 ) ) ( not ( = ?auto_97335 ?auto_97334 ) ) ( not ( = ?auto_97335 ?auto_97332 ) ) ( not ( = ?auto_97335 ?auto_97336 ) ) ( not ( = ?auto_97335 ?auto_97333 ) ) ( not ( = ?auto_97330 ?auto_97334 ) ) ( not ( = ?auto_97330 ?auto_97332 ) ) ( not ( = ?auto_97330 ?auto_97336 ) ) ( not ( = ?auto_97330 ?auto_97333 ) ) ( ON ?auto_97331 ?auto_97330 ) ( ON ?auto_97334 ?auto_97331 ) ( CLEAR ?auto_97334 ) ( HOLDING ?auto_97333 ) ( CLEAR ?auto_97336 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97332 ?auto_97336 ?auto_97333 )
      ( MAKE-1PILE ?auto_97329 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97337 - BLOCK
    )
    :vars
    (
      ?auto_97342 - BLOCK
      ?auto_97339 - BLOCK
      ?auto_97341 - BLOCK
      ?auto_97344 - BLOCK
      ?auto_97340 - BLOCK
      ?auto_97338 - BLOCK
      ?auto_97343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97342 ?auto_97337 ) ( ON-TABLE ?auto_97337 ) ( not ( = ?auto_97337 ?auto_97342 ) ) ( not ( = ?auto_97337 ?auto_97339 ) ) ( not ( = ?auto_97337 ?auto_97341 ) ) ( not ( = ?auto_97342 ?auto_97339 ) ) ( not ( = ?auto_97342 ?auto_97341 ) ) ( not ( = ?auto_97339 ?auto_97341 ) ) ( ON ?auto_97339 ?auto_97342 ) ( ON-TABLE ?auto_97344 ) ( ON ?auto_97340 ?auto_97344 ) ( not ( = ?auto_97344 ?auto_97340 ) ) ( not ( = ?auto_97344 ?auto_97338 ) ) ( not ( = ?auto_97344 ?auto_97343 ) ) ( not ( = ?auto_97344 ?auto_97341 ) ) ( not ( = ?auto_97340 ?auto_97338 ) ) ( not ( = ?auto_97340 ?auto_97343 ) ) ( not ( = ?auto_97340 ?auto_97341 ) ) ( not ( = ?auto_97338 ?auto_97343 ) ) ( not ( = ?auto_97338 ?auto_97341 ) ) ( not ( = ?auto_97343 ?auto_97341 ) ) ( not ( = ?auto_97337 ?auto_97343 ) ) ( not ( = ?auto_97337 ?auto_97344 ) ) ( not ( = ?auto_97337 ?auto_97340 ) ) ( not ( = ?auto_97337 ?auto_97338 ) ) ( not ( = ?auto_97342 ?auto_97343 ) ) ( not ( = ?auto_97342 ?auto_97344 ) ) ( not ( = ?auto_97342 ?auto_97340 ) ) ( not ( = ?auto_97342 ?auto_97338 ) ) ( not ( = ?auto_97339 ?auto_97343 ) ) ( not ( = ?auto_97339 ?auto_97344 ) ) ( not ( = ?auto_97339 ?auto_97340 ) ) ( not ( = ?auto_97339 ?auto_97338 ) ) ( ON ?auto_97341 ?auto_97339 ) ( ON ?auto_97343 ?auto_97341 ) ( CLEAR ?auto_97340 ) ( ON ?auto_97338 ?auto_97343 ) ( CLEAR ?auto_97338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97337 ?auto_97342 ?auto_97339 ?auto_97341 ?auto_97343 )
      ( MAKE-1PILE ?auto_97337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97345 - BLOCK
    )
    :vars
    (
      ?auto_97352 - BLOCK
      ?auto_97347 - BLOCK
      ?auto_97346 - BLOCK
      ?auto_97349 - BLOCK
      ?auto_97351 - BLOCK
      ?auto_97350 - BLOCK
      ?auto_97348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97352 ?auto_97345 ) ( ON-TABLE ?auto_97345 ) ( not ( = ?auto_97345 ?auto_97352 ) ) ( not ( = ?auto_97345 ?auto_97347 ) ) ( not ( = ?auto_97345 ?auto_97346 ) ) ( not ( = ?auto_97352 ?auto_97347 ) ) ( not ( = ?auto_97352 ?auto_97346 ) ) ( not ( = ?auto_97347 ?auto_97346 ) ) ( ON ?auto_97347 ?auto_97352 ) ( ON-TABLE ?auto_97349 ) ( not ( = ?auto_97349 ?auto_97351 ) ) ( not ( = ?auto_97349 ?auto_97350 ) ) ( not ( = ?auto_97349 ?auto_97348 ) ) ( not ( = ?auto_97349 ?auto_97346 ) ) ( not ( = ?auto_97351 ?auto_97350 ) ) ( not ( = ?auto_97351 ?auto_97348 ) ) ( not ( = ?auto_97351 ?auto_97346 ) ) ( not ( = ?auto_97350 ?auto_97348 ) ) ( not ( = ?auto_97350 ?auto_97346 ) ) ( not ( = ?auto_97348 ?auto_97346 ) ) ( not ( = ?auto_97345 ?auto_97348 ) ) ( not ( = ?auto_97345 ?auto_97349 ) ) ( not ( = ?auto_97345 ?auto_97351 ) ) ( not ( = ?auto_97345 ?auto_97350 ) ) ( not ( = ?auto_97352 ?auto_97348 ) ) ( not ( = ?auto_97352 ?auto_97349 ) ) ( not ( = ?auto_97352 ?auto_97351 ) ) ( not ( = ?auto_97352 ?auto_97350 ) ) ( not ( = ?auto_97347 ?auto_97348 ) ) ( not ( = ?auto_97347 ?auto_97349 ) ) ( not ( = ?auto_97347 ?auto_97351 ) ) ( not ( = ?auto_97347 ?auto_97350 ) ) ( ON ?auto_97346 ?auto_97347 ) ( ON ?auto_97348 ?auto_97346 ) ( ON ?auto_97350 ?auto_97348 ) ( CLEAR ?auto_97350 ) ( HOLDING ?auto_97351 ) ( CLEAR ?auto_97349 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97349 ?auto_97351 )
      ( MAKE-1PILE ?auto_97345 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98759 - BLOCK
    )
    :vars
    (
      ?auto_98760 - BLOCK
      ?auto_98762 - BLOCK
      ?auto_98764 - BLOCK
      ?auto_98765 - BLOCK
      ?auto_98761 - BLOCK
      ?auto_98763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98760 ?auto_98759 ) ( ON-TABLE ?auto_98759 ) ( not ( = ?auto_98759 ?auto_98760 ) ) ( not ( = ?auto_98759 ?auto_98762 ) ) ( not ( = ?auto_98759 ?auto_98764 ) ) ( not ( = ?auto_98760 ?auto_98762 ) ) ( not ( = ?auto_98760 ?auto_98764 ) ) ( not ( = ?auto_98762 ?auto_98764 ) ) ( ON ?auto_98762 ?auto_98760 ) ( not ( = ?auto_98765 ?auto_98761 ) ) ( not ( = ?auto_98765 ?auto_98763 ) ) ( not ( = ?auto_98765 ?auto_98764 ) ) ( not ( = ?auto_98761 ?auto_98763 ) ) ( not ( = ?auto_98761 ?auto_98764 ) ) ( not ( = ?auto_98763 ?auto_98764 ) ) ( not ( = ?auto_98759 ?auto_98763 ) ) ( not ( = ?auto_98759 ?auto_98765 ) ) ( not ( = ?auto_98759 ?auto_98761 ) ) ( not ( = ?auto_98760 ?auto_98763 ) ) ( not ( = ?auto_98760 ?auto_98765 ) ) ( not ( = ?auto_98760 ?auto_98761 ) ) ( not ( = ?auto_98762 ?auto_98763 ) ) ( not ( = ?auto_98762 ?auto_98765 ) ) ( not ( = ?auto_98762 ?auto_98761 ) ) ( ON ?auto_98764 ?auto_98762 ) ( ON ?auto_98763 ?auto_98764 ) ( ON ?auto_98761 ?auto_98763 ) ( ON ?auto_98765 ?auto_98761 ) ( CLEAR ?auto_98765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98759 ?auto_98760 ?auto_98762 ?auto_98764 ?auto_98763 ?auto_98761 )
      ( MAKE-1PILE ?auto_98759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97361 - BLOCK
    )
    :vars
    (
      ?auto_97362 - BLOCK
      ?auto_97367 - BLOCK
      ?auto_97368 - BLOCK
      ?auto_97363 - BLOCK
      ?auto_97366 - BLOCK
      ?auto_97365 - BLOCK
      ?auto_97364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97362 ?auto_97361 ) ( ON-TABLE ?auto_97361 ) ( not ( = ?auto_97361 ?auto_97362 ) ) ( not ( = ?auto_97361 ?auto_97367 ) ) ( not ( = ?auto_97361 ?auto_97368 ) ) ( not ( = ?auto_97362 ?auto_97367 ) ) ( not ( = ?auto_97362 ?auto_97368 ) ) ( not ( = ?auto_97367 ?auto_97368 ) ) ( ON ?auto_97367 ?auto_97362 ) ( not ( = ?auto_97363 ?auto_97366 ) ) ( not ( = ?auto_97363 ?auto_97365 ) ) ( not ( = ?auto_97363 ?auto_97364 ) ) ( not ( = ?auto_97363 ?auto_97368 ) ) ( not ( = ?auto_97366 ?auto_97365 ) ) ( not ( = ?auto_97366 ?auto_97364 ) ) ( not ( = ?auto_97366 ?auto_97368 ) ) ( not ( = ?auto_97365 ?auto_97364 ) ) ( not ( = ?auto_97365 ?auto_97368 ) ) ( not ( = ?auto_97364 ?auto_97368 ) ) ( not ( = ?auto_97361 ?auto_97364 ) ) ( not ( = ?auto_97361 ?auto_97363 ) ) ( not ( = ?auto_97361 ?auto_97366 ) ) ( not ( = ?auto_97361 ?auto_97365 ) ) ( not ( = ?auto_97362 ?auto_97364 ) ) ( not ( = ?auto_97362 ?auto_97363 ) ) ( not ( = ?auto_97362 ?auto_97366 ) ) ( not ( = ?auto_97362 ?auto_97365 ) ) ( not ( = ?auto_97367 ?auto_97364 ) ) ( not ( = ?auto_97367 ?auto_97363 ) ) ( not ( = ?auto_97367 ?auto_97366 ) ) ( not ( = ?auto_97367 ?auto_97365 ) ) ( ON ?auto_97368 ?auto_97367 ) ( ON ?auto_97364 ?auto_97368 ) ( ON ?auto_97365 ?auto_97364 ) ( ON ?auto_97366 ?auto_97365 ) ( CLEAR ?auto_97366 ) ( HOLDING ?auto_97363 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97363 )
      ( MAKE-1PILE ?auto_97361 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97369 - BLOCK
    )
    :vars
    (
      ?auto_97370 - BLOCK
      ?auto_97372 - BLOCK
      ?auto_97373 - BLOCK
      ?auto_97375 - BLOCK
      ?auto_97371 - BLOCK
      ?auto_97376 - BLOCK
      ?auto_97374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97370 ?auto_97369 ) ( ON-TABLE ?auto_97369 ) ( not ( = ?auto_97369 ?auto_97370 ) ) ( not ( = ?auto_97369 ?auto_97372 ) ) ( not ( = ?auto_97369 ?auto_97373 ) ) ( not ( = ?auto_97370 ?auto_97372 ) ) ( not ( = ?auto_97370 ?auto_97373 ) ) ( not ( = ?auto_97372 ?auto_97373 ) ) ( ON ?auto_97372 ?auto_97370 ) ( not ( = ?auto_97375 ?auto_97371 ) ) ( not ( = ?auto_97375 ?auto_97376 ) ) ( not ( = ?auto_97375 ?auto_97374 ) ) ( not ( = ?auto_97375 ?auto_97373 ) ) ( not ( = ?auto_97371 ?auto_97376 ) ) ( not ( = ?auto_97371 ?auto_97374 ) ) ( not ( = ?auto_97371 ?auto_97373 ) ) ( not ( = ?auto_97376 ?auto_97374 ) ) ( not ( = ?auto_97376 ?auto_97373 ) ) ( not ( = ?auto_97374 ?auto_97373 ) ) ( not ( = ?auto_97369 ?auto_97374 ) ) ( not ( = ?auto_97369 ?auto_97375 ) ) ( not ( = ?auto_97369 ?auto_97371 ) ) ( not ( = ?auto_97369 ?auto_97376 ) ) ( not ( = ?auto_97370 ?auto_97374 ) ) ( not ( = ?auto_97370 ?auto_97375 ) ) ( not ( = ?auto_97370 ?auto_97371 ) ) ( not ( = ?auto_97370 ?auto_97376 ) ) ( not ( = ?auto_97372 ?auto_97374 ) ) ( not ( = ?auto_97372 ?auto_97375 ) ) ( not ( = ?auto_97372 ?auto_97371 ) ) ( not ( = ?auto_97372 ?auto_97376 ) ) ( ON ?auto_97373 ?auto_97372 ) ( ON ?auto_97374 ?auto_97373 ) ( ON ?auto_97376 ?auto_97374 ) ( ON ?auto_97371 ?auto_97376 ) ( ON ?auto_97375 ?auto_97371 ) ( CLEAR ?auto_97375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97369 ?auto_97370 ?auto_97372 ?auto_97373 ?auto_97374 ?auto_97376 ?auto_97371 )
      ( MAKE-1PILE ?auto_97369 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97384 - BLOCK
      ?auto_97385 - BLOCK
      ?auto_97386 - BLOCK
      ?auto_97387 - BLOCK
      ?auto_97388 - BLOCK
      ?auto_97389 - BLOCK
      ?auto_97390 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_97390 ) ( CLEAR ?auto_97389 ) ( ON-TABLE ?auto_97384 ) ( ON ?auto_97385 ?auto_97384 ) ( ON ?auto_97386 ?auto_97385 ) ( ON ?auto_97387 ?auto_97386 ) ( ON ?auto_97388 ?auto_97387 ) ( ON ?auto_97389 ?auto_97388 ) ( not ( = ?auto_97384 ?auto_97385 ) ) ( not ( = ?auto_97384 ?auto_97386 ) ) ( not ( = ?auto_97384 ?auto_97387 ) ) ( not ( = ?auto_97384 ?auto_97388 ) ) ( not ( = ?auto_97384 ?auto_97389 ) ) ( not ( = ?auto_97384 ?auto_97390 ) ) ( not ( = ?auto_97385 ?auto_97386 ) ) ( not ( = ?auto_97385 ?auto_97387 ) ) ( not ( = ?auto_97385 ?auto_97388 ) ) ( not ( = ?auto_97385 ?auto_97389 ) ) ( not ( = ?auto_97385 ?auto_97390 ) ) ( not ( = ?auto_97386 ?auto_97387 ) ) ( not ( = ?auto_97386 ?auto_97388 ) ) ( not ( = ?auto_97386 ?auto_97389 ) ) ( not ( = ?auto_97386 ?auto_97390 ) ) ( not ( = ?auto_97387 ?auto_97388 ) ) ( not ( = ?auto_97387 ?auto_97389 ) ) ( not ( = ?auto_97387 ?auto_97390 ) ) ( not ( = ?auto_97388 ?auto_97389 ) ) ( not ( = ?auto_97388 ?auto_97390 ) ) ( not ( = ?auto_97389 ?auto_97390 ) ) )
    :subtasks
    ( ( !STACK ?auto_97390 ?auto_97389 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97391 - BLOCK
      ?auto_97392 - BLOCK
      ?auto_97393 - BLOCK
      ?auto_97394 - BLOCK
      ?auto_97395 - BLOCK
      ?auto_97396 - BLOCK
      ?auto_97397 - BLOCK
    )
    :vars
    (
      ?auto_97398 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_97396 ) ( ON-TABLE ?auto_97391 ) ( ON ?auto_97392 ?auto_97391 ) ( ON ?auto_97393 ?auto_97392 ) ( ON ?auto_97394 ?auto_97393 ) ( ON ?auto_97395 ?auto_97394 ) ( ON ?auto_97396 ?auto_97395 ) ( not ( = ?auto_97391 ?auto_97392 ) ) ( not ( = ?auto_97391 ?auto_97393 ) ) ( not ( = ?auto_97391 ?auto_97394 ) ) ( not ( = ?auto_97391 ?auto_97395 ) ) ( not ( = ?auto_97391 ?auto_97396 ) ) ( not ( = ?auto_97391 ?auto_97397 ) ) ( not ( = ?auto_97392 ?auto_97393 ) ) ( not ( = ?auto_97392 ?auto_97394 ) ) ( not ( = ?auto_97392 ?auto_97395 ) ) ( not ( = ?auto_97392 ?auto_97396 ) ) ( not ( = ?auto_97392 ?auto_97397 ) ) ( not ( = ?auto_97393 ?auto_97394 ) ) ( not ( = ?auto_97393 ?auto_97395 ) ) ( not ( = ?auto_97393 ?auto_97396 ) ) ( not ( = ?auto_97393 ?auto_97397 ) ) ( not ( = ?auto_97394 ?auto_97395 ) ) ( not ( = ?auto_97394 ?auto_97396 ) ) ( not ( = ?auto_97394 ?auto_97397 ) ) ( not ( = ?auto_97395 ?auto_97396 ) ) ( not ( = ?auto_97395 ?auto_97397 ) ) ( not ( = ?auto_97396 ?auto_97397 ) ) ( ON ?auto_97397 ?auto_97398 ) ( CLEAR ?auto_97397 ) ( HAND-EMPTY ) ( not ( = ?auto_97391 ?auto_97398 ) ) ( not ( = ?auto_97392 ?auto_97398 ) ) ( not ( = ?auto_97393 ?auto_97398 ) ) ( not ( = ?auto_97394 ?auto_97398 ) ) ( not ( = ?auto_97395 ?auto_97398 ) ) ( not ( = ?auto_97396 ?auto_97398 ) ) ( not ( = ?auto_97397 ?auto_97398 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97397 ?auto_97398 )
      ( MAKE-7PILE ?auto_97391 ?auto_97392 ?auto_97393 ?auto_97394 ?auto_97395 ?auto_97396 ?auto_97397 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97399 - BLOCK
      ?auto_97400 - BLOCK
      ?auto_97401 - BLOCK
      ?auto_97402 - BLOCK
      ?auto_97403 - BLOCK
      ?auto_97404 - BLOCK
      ?auto_97405 - BLOCK
    )
    :vars
    (
      ?auto_97406 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97399 ) ( ON ?auto_97400 ?auto_97399 ) ( ON ?auto_97401 ?auto_97400 ) ( ON ?auto_97402 ?auto_97401 ) ( ON ?auto_97403 ?auto_97402 ) ( not ( = ?auto_97399 ?auto_97400 ) ) ( not ( = ?auto_97399 ?auto_97401 ) ) ( not ( = ?auto_97399 ?auto_97402 ) ) ( not ( = ?auto_97399 ?auto_97403 ) ) ( not ( = ?auto_97399 ?auto_97404 ) ) ( not ( = ?auto_97399 ?auto_97405 ) ) ( not ( = ?auto_97400 ?auto_97401 ) ) ( not ( = ?auto_97400 ?auto_97402 ) ) ( not ( = ?auto_97400 ?auto_97403 ) ) ( not ( = ?auto_97400 ?auto_97404 ) ) ( not ( = ?auto_97400 ?auto_97405 ) ) ( not ( = ?auto_97401 ?auto_97402 ) ) ( not ( = ?auto_97401 ?auto_97403 ) ) ( not ( = ?auto_97401 ?auto_97404 ) ) ( not ( = ?auto_97401 ?auto_97405 ) ) ( not ( = ?auto_97402 ?auto_97403 ) ) ( not ( = ?auto_97402 ?auto_97404 ) ) ( not ( = ?auto_97402 ?auto_97405 ) ) ( not ( = ?auto_97403 ?auto_97404 ) ) ( not ( = ?auto_97403 ?auto_97405 ) ) ( not ( = ?auto_97404 ?auto_97405 ) ) ( ON ?auto_97405 ?auto_97406 ) ( CLEAR ?auto_97405 ) ( not ( = ?auto_97399 ?auto_97406 ) ) ( not ( = ?auto_97400 ?auto_97406 ) ) ( not ( = ?auto_97401 ?auto_97406 ) ) ( not ( = ?auto_97402 ?auto_97406 ) ) ( not ( = ?auto_97403 ?auto_97406 ) ) ( not ( = ?auto_97404 ?auto_97406 ) ) ( not ( = ?auto_97405 ?auto_97406 ) ) ( HOLDING ?auto_97404 ) ( CLEAR ?auto_97403 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97399 ?auto_97400 ?auto_97401 ?auto_97402 ?auto_97403 ?auto_97404 )
      ( MAKE-7PILE ?auto_97399 ?auto_97400 ?auto_97401 ?auto_97402 ?auto_97403 ?auto_97404 ?auto_97405 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97407 - BLOCK
      ?auto_97408 - BLOCK
      ?auto_97409 - BLOCK
      ?auto_97410 - BLOCK
      ?auto_97411 - BLOCK
      ?auto_97412 - BLOCK
      ?auto_97413 - BLOCK
    )
    :vars
    (
      ?auto_97414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97407 ) ( ON ?auto_97408 ?auto_97407 ) ( ON ?auto_97409 ?auto_97408 ) ( ON ?auto_97410 ?auto_97409 ) ( ON ?auto_97411 ?auto_97410 ) ( not ( = ?auto_97407 ?auto_97408 ) ) ( not ( = ?auto_97407 ?auto_97409 ) ) ( not ( = ?auto_97407 ?auto_97410 ) ) ( not ( = ?auto_97407 ?auto_97411 ) ) ( not ( = ?auto_97407 ?auto_97412 ) ) ( not ( = ?auto_97407 ?auto_97413 ) ) ( not ( = ?auto_97408 ?auto_97409 ) ) ( not ( = ?auto_97408 ?auto_97410 ) ) ( not ( = ?auto_97408 ?auto_97411 ) ) ( not ( = ?auto_97408 ?auto_97412 ) ) ( not ( = ?auto_97408 ?auto_97413 ) ) ( not ( = ?auto_97409 ?auto_97410 ) ) ( not ( = ?auto_97409 ?auto_97411 ) ) ( not ( = ?auto_97409 ?auto_97412 ) ) ( not ( = ?auto_97409 ?auto_97413 ) ) ( not ( = ?auto_97410 ?auto_97411 ) ) ( not ( = ?auto_97410 ?auto_97412 ) ) ( not ( = ?auto_97410 ?auto_97413 ) ) ( not ( = ?auto_97411 ?auto_97412 ) ) ( not ( = ?auto_97411 ?auto_97413 ) ) ( not ( = ?auto_97412 ?auto_97413 ) ) ( ON ?auto_97413 ?auto_97414 ) ( not ( = ?auto_97407 ?auto_97414 ) ) ( not ( = ?auto_97408 ?auto_97414 ) ) ( not ( = ?auto_97409 ?auto_97414 ) ) ( not ( = ?auto_97410 ?auto_97414 ) ) ( not ( = ?auto_97411 ?auto_97414 ) ) ( not ( = ?auto_97412 ?auto_97414 ) ) ( not ( = ?auto_97413 ?auto_97414 ) ) ( CLEAR ?auto_97411 ) ( ON ?auto_97412 ?auto_97413 ) ( CLEAR ?auto_97412 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97414 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97414 ?auto_97413 )
      ( MAKE-7PILE ?auto_97407 ?auto_97408 ?auto_97409 ?auto_97410 ?auto_97411 ?auto_97412 ?auto_97413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97415 - BLOCK
      ?auto_97416 - BLOCK
      ?auto_97417 - BLOCK
      ?auto_97418 - BLOCK
      ?auto_97419 - BLOCK
      ?auto_97420 - BLOCK
      ?auto_97421 - BLOCK
    )
    :vars
    (
      ?auto_97422 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97415 ) ( ON ?auto_97416 ?auto_97415 ) ( ON ?auto_97417 ?auto_97416 ) ( ON ?auto_97418 ?auto_97417 ) ( not ( = ?auto_97415 ?auto_97416 ) ) ( not ( = ?auto_97415 ?auto_97417 ) ) ( not ( = ?auto_97415 ?auto_97418 ) ) ( not ( = ?auto_97415 ?auto_97419 ) ) ( not ( = ?auto_97415 ?auto_97420 ) ) ( not ( = ?auto_97415 ?auto_97421 ) ) ( not ( = ?auto_97416 ?auto_97417 ) ) ( not ( = ?auto_97416 ?auto_97418 ) ) ( not ( = ?auto_97416 ?auto_97419 ) ) ( not ( = ?auto_97416 ?auto_97420 ) ) ( not ( = ?auto_97416 ?auto_97421 ) ) ( not ( = ?auto_97417 ?auto_97418 ) ) ( not ( = ?auto_97417 ?auto_97419 ) ) ( not ( = ?auto_97417 ?auto_97420 ) ) ( not ( = ?auto_97417 ?auto_97421 ) ) ( not ( = ?auto_97418 ?auto_97419 ) ) ( not ( = ?auto_97418 ?auto_97420 ) ) ( not ( = ?auto_97418 ?auto_97421 ) ) ( not ( = ?auto_97419 ?auto_97420 ) ) ( not ( = ?auto_97419 ?auto_97421 ) ) ( not ( = ?auto_97420 ?auto_97421 ) ) ( ON ?auto_97421 ?auto_97422 ) ( not ( = ?auto_97415 ?auto_97422 ) ) ( not ( = ?auto_97416 ?auto_97422 ) ) ( not ( = ?auto_97417 ?auto_97422 ) ) ( not ( = ?auto_97418 ?auto_97422 ) ) ( not ( = ?auto_97419 ?auto_97422 ) ) ( not ( = ?auto_97420 ?auto_97422 ) ) ( not ( = ?auto_97421 ?auto_97422 ) ) ( ON ?auto_97420 ?auto_97421 ) ( CLEAR ?auto_97420 ) ( ON-TABLE ?auto_97422 ) ( HOLDING ?auto_97419 ) ( CLEAR ?auto_97418 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97415 ?auto_97416 ?auto_97417 ?auto_97418 ?auto_97419 )
      ( MAKE-7PILE ?auto_97415 ?auto_97416 ?auto_97417 ?auto_97418 ?auto_97419 ?auto_97420 ?auto_97421 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97423 - BLOCK
      ?auto_97424 - BLOCK
      ?auto_97425 - BLOCK
      ?auto_97426 - BLOCK
      ?auto_97427 - BLOCK
      ?auto_97428 - BLOCK
      ?auto_97429 - BLOCK
    )
    :vars
    (
      ?auto_97430 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97423 ) ( ON ?auto_97424 ?auto_97423 ) ( ON ?auto_97425 ?auto_97424 ) ( ON ?auto_97426 ?auto_97425 ) ( not ( = ?auto_97423 ?auto_97424 ) ) ( not ( = ?auto_97423 ?auto_97425 ) ) ( not ( = ?auto_97423 ?auto_97426 ) ) ( not ( = ?auto_97423 ?auto_97427 ) ) ( not ( = ?auto_97423 ?auto_97428 ) ) ( not ( = ?auto_97423 ?auto_97429 ) ) ( not ( = ?auto_97424 ?auto_97425 ) ) ( not ( = ?auto_97424 ?auto_97426 ) ) ( not ( = ?auto_97424 ?auto_97427 ) ) ( not ( = ?auto_97424 ?auto_97428 ) ) ( not ( = ?auto_97424 ?auto_97429 ) ) ( not ( = ?auto_97425 ?auto_97426 ) ) ( not ( = ?auto_97425 ?auto_97427 ) ) ( not ( = ?auto_97425 ?auto_97428 ) ) ( not ( = ?auto_97425 ?auto_97429 ) ) ( not ( = ?auto_97426 ?auto_97427 ) ) ( not ( = ?auto_97426 ?auto_97428 ) ) ( not ( = ?auto_97426 ?auto_97429 ) ) ( not ( = ?auto_97427 ?auto_97428 ) ) ( not ( = ?auto_97427 ?auto_97429 ) ) ( not ( = ?auto_97428 ?auto_97429 ) ) ( ON ?auto_97429 ?auto_97430 ) ( not ( = ?auto_97423 ?auto_97430 ) ) ( not ( = ?auto_97424 ?auto_97430 ) ) ( not ( = ?auto_97425 ?auto_97430 ) ) ( not ( = ?auto_97426 ?auto_97430 ) ) ( not ( = ?auto_97427 ?auto_97430 ) ) ( not ( = ?auto_97428 ?auto_97430 ) ) ( not ( = ?auto_97429 ?auto_97430 ) ) ( ON ?auto_97428 ?auto_97429 ) ( ON-TABLE ?auto_97430 ) ( CLEAR ?auto_97426 ) ( ON ?auto_97427 ?auto_97428 ) ( CLEAR ?auto_97427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97430 ?auto_97429 ?auto_97428 )
      ( MAKE-7PILE ?auto_97423 ?auto_97424 ?auto_97425 ?auto_97426 ?auto_97427 ?auto_97428 ?auto_97429 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97431 - BLOCK
      ?auto_97432 - BLOCK
      ?auto_97433 - BLOCK
      ?auto_97434 - BLOCK
      ?auto_97435 - BLOCK
      ?auto_97436 - BLOCK
      ?auto_97437 - BLOCK
    )
    :vars
    (
      ?auto_97438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97431 ) ( ON ?auto_97432 ?auto_97431 ) ( ON ?auto_97433 ?auto_97432 ) ( not ( = ?auto_97431 ?auto_97432 ) ) ( not ( = ?auto_97431 ?auto_97433 ) ) ( not ( = ?auto_97431 ?auto_97434 ) ) ( not ( = ?auto_97431 ?auto_97435 ) ) ( not ( = ?auto_97431 ?auto_97436 ) ) ( not ( = ?auto_97431 ?auto_97437 ) ) ( not ( = ?auto_97432 ?auto_97433 ) ) ( not ( = ?auto_97432 ?auto_97434 ) ) ( not ( = ?auto_97432 ?auto_97435 ) ) ( not ( = ?auto_97432 ?auto_97436 ) ) ( not ( = ?auto_97432 ?auto_97437 ) ) ( not ( = ?auto_97433 ?auto_97434 ) ) ( not ( = ?auto_97433 ?auto_97435 ) ) ( not ( = ?auto_97433 ?auto_97436 ) ) ( not ( = ?auto_97433 ?auto_97437 ) ) ( not ( = ?auto_97434 ?auto_97435 ) ) ( not ( = ?auto_97434 ?auto_97436 ) ) ( not ( = ?auto_97434 ?auto_97437 ) ) ( not ( = ?auto_97435 ?auto_97436 ) ) ( not ( = ?auto_97435 ?auto_97437 ) ) ( not ( = ?auto_97436 ?auto_97437 ) ) ( ON ?auto_97437 ?auto_97438 ) ( not ( = ?auto_97431 ?auto_97438 ) ) ( not ( = ?auto_97432 ?auto_97438 ) ) ( not ( = ?auto_97433 ?auto_97438 ) ) ( not ( = ?auto_97434 ?auto_97438 ) ) ( not ( = ?auto_97435 ?auto_97438 ) ) ( not ( = ?auto_97436 ?auto_97438 ) ) ( not ( = ?auto_97437 ?auto_97438 ) ) ( ON ?auto_97436 ?auto_97437 ) ( ON-TABLE ?auto_97438 ) ( ON ?auto_97435 ?auto_97436 ) ( CLEAR ?auto_97435 ) ( HOLDING ?auto_97434 ) ( CLEAR ?auto_97433 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97431 ?auto_97432 ?auto_97433 ?auto_97434 )
      ( MAKE-7PILE ?auto_97431 ?auto_97432 ?auto_97433 ?auto_97434 ?auto_97435 ?auto_97436 ?auto_97437 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97439 - BLOCK
      ?auto_97440 - BLOCK
      ?auto_97441 - BLOCK
      ?auto_97442 - BLOCK
      ?auto_97443 - BLOCK
      ?auto_97444 - BLOCK
      ?auto_97445 - BLOCK
    )
    :vars
    (
      ?auto_97446 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97439 ) ( ON ?auto_97440 ?auto_97439 ) ( ON ?auto_97441 ?auto_97440 ) ( not ( = ?auto_97439 ?auto_97440 ) ) ( not ( = ?auto_97439 ?auto_97441 ) ) ( not ( = ?auto_97439 ?auto_97442 ) ) ( not ( = ?auto_97439 ?auto_97443 ) ) ( not ( = ?auto_97439 ?auto_97444 ) ) ( not ( = ?auto_97439 ?auto_97445 ) ) ( not ( = ?auto_97440 ?auto_97441 ) ) ( not ( = ?auto_97440 ?auto_97442 ) ) ( not ( = ?auto_97440 ?auto_97443 ) ) ( not ( = ?auto_97440 ?auto_97444 ) ) ( not ( = ?auto_97440 ?auto_97445 ) ) ( not ( = ?auto_97441 ?auto_97442 ) ) ( not ( = ?auto_97441 ?auto_97443 ) ) ( not ( = ?auto_97441 ?auto_97444 ) ) ( not ( = ?auto_97441 ?auto_97445 ) ) ( not ( = ?auto_97442 ?auto_97443 ) ) ( not ( = ?auto_97442 ?auto_97444 ) ) ( not ( = ?auto_97442 ?auto_97445 ) ) ( not ( = ?auto_97443 ?auto_97444 ) ) ( not ( = ?auto_97443 ?auto_97445 ) ) ( not ( = ?auto_97444 ?auto_97445 ) ) ( ON ?auto_97445 ?auto_97446 ) ( not ( = ?auto_97439 ?auto_97446 ) ) ( not ( = ?auto_97440 ?auto_97446 ) ) ( not ( = ?auto_97441 ?auto_97446 ) ) ( not ( = ?auto_97442 ?auto_97446 ) ) ( not ( = ?auto_97443 ?auto_97446 ) ) ( not ( = ?auto_97444 ?auto_97446 ) ) ( not ( = ?auto_97445 ?auto_97446 ) ) ( ON ?auto_97444 ?auto_97445 ) ( ON-TABLE ?auto_97446 ) ( ON ?auto_97443 ?auto_97444 ) ( CLEAR ?auto_97441 ) ( ON ?auto_97442 ?auto_97443 ) ( CLEAR ?auto_97442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97446 ?auto_97445 ?auto_97444 ?auto_97443 )
      ( MAKE-7PILE ?auto_97439 ?auto_97440 ?auto_97441 ?auto_97442 ?auto_97443 ?auto_97444 ?auto_97445 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97447 - BLOCK
      ?auto_97448 - BLOCK
      ?auto_97449 - BLOCK
      ?auto_97450 - BLOCK
      ?auto_97451 - BLOCK
      ?auto_97452 - BLOCK
      ?auto_97453 - BLOCK
    )
    :vars
    (
      ?auto_97454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97447 ) ( ON ?auto_97448 ?auto_97447 ) ( not ( = ?auto_97447 ?auto_97448 ) ) ( not ( = ?auto_97447 ?auto_97449 ) ) ( not ( = ?auto_97447 ?auto_97450 ) ) ( not ( = ?auto_97447 ?auto_97451 ) ) ( not ( = ?auto_97447 ?auto_97452 ) ) ( not ( = ?auto_97447 ?auto_97453 ) ) ( not ( = ?auto_97448 ?auto_97449 ) ) ( not ( = ?auto_97448 ?auto_97450 ) ) ( not ( = ?auto_97448 ?auto_97451 ) ) ( not ( = ?auto_97448 ?auto_97452 ) ) ( not ( = ?auto_97448 ?auto_97453 ) ) ( not ( = ?auto_97449 ?auto_97450 ) ) ( not ( = ?auto_97449 ?auto_97451 ) ) ( not ( = ?auto_97449 ?auto_97452 ) ) ( not ( = ?auto_97449 ?auto_97453 ) ) ( not ( = ?auto_97450 ?auto_97451 ) ) ( not ( = ?auto_97450 ?auto_97452 ) ) ( not ( = ?auto_97450 ?auto_97453 ) ) ( not ( = ?auto_97451 ?auto_97452 ) ) ( not ( = ?auto_97451 ?auto_97453 ) ) ( not ( = ?auto_97452 ?auto_97453 ) ) ( ON ?auto_97453 ?auto_97454 ) ( not ( = ?auto_97447 ?auto_97454 ) ) ( not ( = ?auto_97448 ?auto_97454 ) ) ( not ( = ?auto_97449 ?auto_97454 ) ) ( not ( = ?auto_97450 ?auto_97454 ) ) ( not ( = ?auto_97451 ?auto_97454 ) ) ( not ( = ?auto_97452 ?auto_97454 ) ) ( not ( = ?auto_97453 ?auto_97454 ) ) ( ON ?auto_97452 ?auto_97453 ) ( ON-TABLE ?auto_97454 ) ( ON ?auto_97451 ?auto_97452 ) ( ON ?auto_97450 ?auto_97451 ) ( CLEAR ?auto_97450 ) ( HOLDING ?auto_97449 ) ( CLEAR ?auto_97448 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97447 ?auto_97448 ?auto_97449 )
      ( MAKE-7PILE ?auto_97447 ?auto_97448 ?auto_97449 ?auto_97450 ?auto_97451 ?auto_97452 ?auto_97453 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97455 - BLOCK
      ?auto_97456 - BLOCK
      ?auto_97457 - BLOCK
      ?auto_97458 - BLOCK
      ?auto_97459 - BLOCK
      ?auto_97460 - BLOCK
      ?auto_97461 - BLOCK
    )
    :vars
    (
      ?auto_97462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97455 ) ( ON ?auto_97456 ?auto_97455 ) ( not ( = ?auto_97455 ?auto_97456 ) ) ( not ( = ?auto_97455 ?auto_97457 ) ) ( not ( = ?auto_97455 ?auto_97458 ) ) ( not ( = ?auto_97455 ?auto_97459 ) ) ( not ( = ?auto_97455 ?auto_97460 ) ) ( not ( = ?auto_97455 ?auto_97461 ) ) ( not ( = ?auto_97456 ?auto_97457 ) ) ( not ( = ?auto_97456 ?auto_97458 ) ) ( not ( = ?auto_97456 ?auto_97459 ) ) ( not ( = ?auto_97456 ?auto_97460 ) ) ( not ( = ?auto_97456 ?auto_97461 ) ) ( not ( = ?auto_97457 ?auto_97458 ) ) ( not ( = ?auto_97457 ?auto_97459 ) ) ( not ( = ?auto_97457 ?auto_97460 ) ) ( not ( = ?auto_97457 ?auto_97461 ) ) ( not ( = ?auto_97458 ?auto_97459 ) ) ( not ( = ?auto_97458 ?auto_97460 ) ) ( not ( = ?auto_97458 ?auto_97461 ) ) ( not ( = ?auto_97459 ?auto_97460 ) ) ( not ( = ?auto_97459 ?auto_97461 ) ) ( not ( = ?auto_97460 ?auto_97461 ) ) ( ON ?auto_97461 ?auto_97462 ) ( not ( = ?auto_97455 ?auto_97462 ) ) ( not ( = ?auto_97456 ?auto_97462 ) ) ( not ( = ?auto_97457 ?auto_97462 ) ) ( not ( = ?auto_97458 ?auto_97462 ) ) ( not ( = ?auto_97459 ?auto_97462 ) ) ( not ( = ?auto_97460 ?auto_97462 ) ) ( not ( = ?auto_97461 ?auto_97462 ) ) ( ON ?auto_97460 ?auto_97461 ) ( ON-TABLE ?auto_97462 ) ( ON ?auto_97459 ?auto_97460 ) ( ON ?auto_97458 ?auto_97459 ) ( CLEAR ?auto_97456 ) ( ON ?auto_97457 ?auto_97458 ) ( CLEAR ?auto_97457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97462 ?auto_97461 ?auto_97460 ?auto_97459 ?auto_97458 )
      ( MAKE-7PILE ?auto_97455 ?auto_97456 ?auto_97457 ?auto_97458 ?auto_97459 ?auto_97460 ?auto_97461 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97463 - BLOCK
      ?auto_97464 - BLOCK
      ?auto_97465 - BLOCK
      ?auto_97466 - BLOCK
      ?auto_97467 - BLOCK
      ?auto_97468 - BLOCK
      ?auto_97469 - BLOCK
    )
    :vars
    (
      ?auto_97470 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97463 ) ( not ( = ?auto_97463 ?auto_97464 ) ) ( not ( = ?auto_97463 ?auto_97465 ) ) ( not ( = ?auto_97463 ?auto_97466 ) ) ( not ( = ?auto_97463 ?auto_97467 ) ) ( not ( = ?auto_97463 ?auto_97468 ) ) ( not ( = ?auto_97463 ?auto_97469 ) ) ( not ( = ?auto_97464 ?auto_97465 ) ) ( not ( = ?auto_97464 ?auto_97466 ) ) ( not ( = ?auto_97464 ?auto_97467 ) ) ( not ( = ?auto_97464 ?auto_97468 ) ) ( not ( = ?auto_97464 ?auto_97469 ) ) ( not ( = ?auto_97465 ?auto_97466 ) ) ( not ( = ?auto_97465 ?auto_97467 ) ) ( not ( = ?auto_97465 ?auto_97468 ) ) ( not ( = ?auto_97465 ?auto_97469 ) ) ( not ( = ?auto_97466 ?auto_97467 ) ) ( not ( = ?auto_97466 ?auto_97468 ) ) ( not ( = ?auto_97466 ?auto_97469 ) ) ( not ( = ?auto_97467 ?auto_97468 ) ) ( not ( = ?auto_97467 ?auto_97469 ) ) ( not ( = ?auto_97468 ?auto_97469 ) ) ( ON ?auto_97469 ?auto_97470 ) ( not ( = ?auto_97463 ?auto_97470 ) ) ( not ( = ?auto_97464 ?auto_97470 ) ) ( not ( = ?auto_97465 ?auto_97470 ) ) ( not ( = ?auto_97466 ?auto_97470 ) ) ( not ( = ?auto_97467 ?auto_97470 ) ) ( not ( = ?auto_97468 ?auto_97470 ) ) ( not ( = ?auto_97469 ?auto_97470 ) ) ( ON ?auto_97468 ?auto_97469 ) ( ON-TABLE ?auto_97470 ) ( ON ?auto_97467 ?auto_97468 ) ( ON ?auto_97466 ?auto_97467 ) ( ON ?auto_97465 ?auto_97466 ) ( CLEAR ?auto_97465 ) ( HOLDING ?auto_97464 ) ( CLEAR ?auto_97463 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97463 ?auto_97464 )
      ( MAKE-7PILE ?auto_97463 ?auto_97464 ?auto_97465 ?auto_97466 ?auto_97467 ?auto_97468 ?auto_97469 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97471 - BLOCK
      ?auto_97472 - BLOCK
      ?auto_97473 - BLOCK
      ?auto_97474 - BLOCK
      ?auto_97475 - BLOCK
      ?auto_97476 - BLOCK
      ?auto_97477 - BLOCK
    )
    :vars
    (
      ?auto_97478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97471 ) ( not ( = ?auto_97471 ?auto_97472 ) ) ( not ( = ?auto_97471 ?auto_97473 ) ) ( not ( = ?auto_97471 ?auto_97474 ) ) ( not ( = ?auto_97471 ?auto_97475 ) ) ( not ( = ?auto_97471 ?auto_97476 ) ) ( not ( = ?auto_97471 ?auto_97477 ) ) ( not ( = ?auto_97472 ?auto_97473 ) ) ( not ( = ?auto_97472 ?auto_97474 ) ) ( not ( = ?auto_97472 ?auto_97475 ) ) ( not ( = ?auto_97472 ?auto_97476 ) ) ( not ( = ?auto_97472 ?auto_97477 ) ) ( not ( = ?auto_97473 ?auto_97474 ) ) ( not ( = ?auto_97473 ?auto_97475 ) ) ( not ( = ?auto_97473 ?auto_97476 ) ) ( not ( = ?auto_97473 ?auto_97477 ) ) ( not ( = ?auto_97474 ?auto_97475 ) ) ( not ( = ?auto_97474 ?auto_97476 ) ) ( not ( = ?auto_97474 ?auto_97477 ) ) ( not ( = ?auto_97475 ?auto_97476 ) ) ( not ( = ?auto_97475 ?auto_97477 ) ) ( not ( = ?auto_97476 ?auto_97477 ) ) ( ON ?auto_97477 ?auto_97478 ) ( not ( = ?auto_97471 ?auto_97478 ) ) ( not ( = ?auto_97472 ?auto_97478 ) ) ( not ( = ?auto_97473 ?auto_97478 ) ) ( not ( = ?auto_97474 ?auto_97478 ) ) ( not ( = ?auto_97475 ?auto_97478 ) ) ( not ( = ?auto_97476 ?auto_97478 ) ) ( not ( = ?auto_97477 ?auto_97478 ) ) ( ON ?auto_97476 ?auto_97477 ) ( ON-TABLE ?auto_97478 ) ( ON ?auto_97475 ?auto_97476 ) ( ON ?auto_97474 ?auto_97475 ) ( ON ?auto_97473 ?auto_97474 ) ( CLEAR ?auto_97471 ) ( ON ?auto_97472 ?auto_97473 ) ( CLEAR ?auto_97472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97478 ?auto_97477 ?auto_97476 ?auto_97475 ?auto_97474 ?auto_97473 )
      ( MAKE-7PILE ?auto_97471 ?auto_97472 ?auto_97473 ?auto_97474 ?auto_97475 ?auto_97476 ?auto_97477 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97479 - BLOCK
      ?auto_97480 - BLOCK
      ?auto_97481 - BLOCK
      ?auto_97482 - BLOCK
      ?auto_97483 - BLOCK
      ?auto_97484 - BLOCK
      ?auto_97485 - BLOCK
    )
    :vars
    (
      ?auto_97486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97479 ?auto_97480 ) ) ( not ( = ?auto_97479 ?auto_97481 ) ) ( not ( = ?auto_97479 ?auto_97482 ) ) ( not ( = ?auto_97479 ?auto_97483 ) ) ( not ( = ?auto_97479 ?auto_97484 ) ) ( not ( = ?auto_97479 ?auto_97485 ) ) ( not ( = ?auto_97480 ?auto_97481 ) ) ( not ( = ?auto_97480 ?auto_97482 ) ) ( not ( = ?auto_97480 ?auto_97483 ) ) ( not ( = ?auto_97480 ?auto_97484 ) ) ( not ( = ?auto_97480 ?auto_97485 ) ) ( not ( = ?auto_97481 ?auto_97482 ) ) ( not ( = ?auto_97481 ?auto_97483 ) ) ( not ( = ?auto_97481 ?auto_97484 ) ) ( not ( = ?auto_97481 ?auto_97485 ) ) ( not ( = ?auto_97482 ?auto_97483 ) ) ( not ( = ?auto_97482 ?auto_97484 ) ) ( not ( = ?auto_97482 ?auto_97485 ) ) ( not ( = ?auto_97483 ?auto_97484 ) ) ( not ( = ?auto_97483 ?auto_97485 ) ) ( not ( = ?auto_97484 ?auto_97485 ) ) ( ON ?auto_97485 ?auto_97486 ) ( not ( = ?auto_97479 ?auto_97486 ) ) ( not ( = ?auto_97480 ?auto_97486 ) ) ( not ( = ?auto_97481 ?auto_97486 ) ) ( not ( = ?auto_97482 ?auto_97486 ) ) ( not ( = ?auto_97483 ?auto_97486 ) ) ( not ( = ?auto_97484 ?auto_97486 ) ) ( not ( = ?auto_97485 ?auto_97486 ) ) ( ON ?auto_97484 ?auto_97485 ) ( ON-TABLE ?auto_97486 ) ( ON ?auto_97483 ?auto_97484 ) ( ON ?auto_97482 ?auto_97483 ) ( ON ?auto_97481 ?auto_97482 ) ( ON ?auto_97480 ?auto_97481 ) ( CLEAR ?auto_97480 ) ( HOLDING ?auto_97479 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97479 )
      ( MAKE-7PILE ?auto_97479 ?auto_97480 ?auto_97481 ?auto_97482 ?auto_97483 ?auto_97484 ?auto_97485 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_97487 - BLOCK
      ?auto_97488 - BLOCK
      ?auto_97489 - BLOCK
      ?auto_97490 - BLOCK
      ?auto_97491 - BLOCK
      ?auto_97492 - BLOCK
      ?auto_97493 - BLOCK
    )
    :vars
    (
      ?auto_97494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97487 ?auto_97488 ) ) ( not ( = ?auto_97487 ?auto_97489 ) ) ( not ( = ?auto_97487 ?auto_97490 ) ) ( not ( = ?auto_97487 ?auto_97491 ) ) ( not ( = ?auto_97487 ?auto_97492 ) ) ( not ( = ?auto_97487 ?auto_97493 ) ) ( not ( = ?auto_97488 ?auto_97489 ) ) ( not ( = ?auto_97488 ?auto_97490 ) ) ( not ( = ?auto_97488 ?auto_97491 ) ) ( not ( = ?auto_97488 ?auto_97492 ) ) ( not ( = ?auto_97488 ?auto_97493 ) ) ( not ( = ?auto_97489 ?auto_97490 ) ) ( not ( = ?auto_97489 ?auto_97491 ) ) ( not ( = ?auto_97489 ?auto_97492 ) ) ( not ( = ?auto_97489 ?auto_97493 ) ) ( not ( = ?auto_97490 ?auto_97491 ) ) ( not ( = ?auto_97490 ?auto_97492 ) ) ( not ( = ?auto_97490 ?auto_97493 ) ) ( not ( = ?auto_97491 ?auto_97492 ) ) ( not ( = ?auto_97491 ?auto_97493 ) ) ( not ( = ?auto_97492 ?auto_97493 ) ) ( ON ?auto_97493 ?auto_97494 ) ( not ( = ?auto_97487 ?auto_97494 ) ) ( not ( = ?auto_97488 ?auto_97494 ) ) ( not ( = ?auto_97489 ?auto_97494 ) ) ( not ( = ?auto_97490 ?auto_97494 ) ) ( not ( = ?auto_97491 ?auto_97494 ) ) ( not ( = ?auto_97492 ?auto_97494 ) ) ( not ( = ?auto_97493 ?auto_97494 ) ) ( ON ?auto_97492 ?auto_97493 ) ( ON-TABLE ?auto_97494 ) ( ON ?auto_97491 ?auto_97492 ) ( ON ?auto_97490 ?auto_97491 ) ( ON ?auto_97489 ?auto_97490 ) ( ON ?auto_97488 ?auto_97489 ) ( ON ?auto_97487 ?auto_97488 ) ( CLEAR ?auto_97487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97494 ?auto_97493 ?auto_97492 ?auto_97491 ?auto_97490 ?auto_97489 ?auto_97488 )
      ( MAKE-7PILE ?auto_97487 ?auto_97488 ?auto_97489 ?auto_97490 ?auto_97491 ?auto_97492 ?auto_97493 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97601 - BLOCK
    )
    :vars
    (
      ?auto_97602 - BLOCK
      ?auto_97603 - BLOCK
      ?auto_97604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97601 ?auto_97602 ) ( CLEAR ?auto_97601 ) ( not ( = ?auto_97601 ?auto_97602 ) ) ( HOLDING ?auto_97603 ) ( CLEAR ?auto_97604 ) ( not ( = ?auto_97601 ?auto_97603 ) ) ( not ( = ?auto_97601 ?auto_97604 ) ) ( not ( = ?auto_97602 ?auto_97603 ) ) ( not ( = ?auto_97602 ?auto_97604 ) ) ( not ( = ?auto_97603 ?auto_97604 ) ) )
    :subtasks
    ( ( !STACK ?auto_97603 ?auto_97604 )
      ( MAKE-1PILE ?auto_97601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97605 - BLOCK
    )
    :vars
    (
      ?auto_97606 - BLOCK
      ?auto_97607 - BLOCK
      ?auto_97608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97605 ?auto_97606 ) ( not ( = ?auto_97605 ?auto_97606 ) ) ( CLEAR ?auto_97607 ) ( not ( = ?auto_97605 ?auto_97608 ) ) ( not ( = ?auto_97605 ?auto_97607 ) ) ( not ( = ?auto_97606 ?auto_97608 ) ) ( not ( = ?auto_97606 ?auto_97607 ) ) ( not ( = ?auto_97608 ?auto_97607 ) ) ( ON ?auto_97608 ?auto_97605 ) ( CLEAR ?auto_97608 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97606 ?auto_97605 )
      ( MAKE-1PILE ?auto_97605 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97609 - BLOCK
    )
    :vars
    (
      ?auto_97610 - BLOCK
      ?auto_97611 - BLOCK
      ?auto_97612 - BLOCK
      ?auto_97613 - BLOCK
      ?auto_97616 - BLOCK
      ?auto_97614 - BLOCK
      ?auto_97615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97609 ?auto_97610 ) ( not ( = ?auto_97609 ?auto_97610 ) ) ( not ( = ?auto_97609 ?auto_97611 ) ) ( not ( = ?auto_97609 ?auto_97612 ) ) ( not ( = ?auto_97610 ?auto_97611 ) ) ( not ( = ?auto_97610 ?auto_97612 ) ) ( not ( = ?auto_97611 ?auto_97612 ) ) ( ON ?auto_97611 ?auto_97609 ) ( CLEAR ?auto_97611 ) ( ON-TABLE ?auto_97610 ) ( HOLDING ?auto_97612 ) ( CLEAR ?auto_97613 ) ( ON-TABLE ?auto_97616 ) ( ON ?auto_97614 ?auto_97616 ) ( ON ?auto_97615 ?auto_97614 ) ( ON ?auto_97613 ?auto_97615 ) ( not ( = ?auto_97616 ?auto_97614 ) ) ( not ( = ?auto_97616 ?auto_97615 ) ) ( not ( = ?auto_97616 ?auto_97613 ) ) ( not ( = ?auto_97616 ?auto_97612 ) ) ( not ( = ?auto_97614 ?auto_97615 ) ) ( not ( = ?auto_97614 ?auto_97613 ) ) ( not ( = ?auto_97614 ?auto_97612 ) ) ( not ( = ?auto_97615 ?auto_97613 ) ) ( not ( = ?auto_97615 ?auto_97612 ) ) ( not ( = ?auto_97613 ?auto_97612 ) ) ( not ( = ?auto_97609 ?auto_97613 ) ) ( not ( = ?auto_97609 ?auto_97616 ) ) ( not ( = ?auto_97609 ?auto_97614 ) ) ( not ( = ?auto_97609 ?auto_97615 ) ) ( not ( = ?auto_97610 ?auto_97613 ) ) ( not ( = ?auto_97610 ?auto_97616 ) ) ( not ( = ?auto_97610 ?auto_97614 ) ) ( not ( = ?auto_97610 ?auto_97615 ) ) ( not ( = ?auto_97611 ?auto_97613 ) ) ( not ( = ?auto_97611 ?auto_97616 ) ) ( not ( = ?auto_97611 ?auto_97614 ) ) ( not ( = ?auto_97611 ?auto_97615 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97616 ?auto_97614 ?auto_97615 ?auto_97613 ?auto_97612 )
      ( MAKE-1PILE ?auto_97609 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97617 - BLOCK
    )
    :vars
    (
      ?auto_97618 - BLOCK
      ?auto_97624 - BLOCK
      ?auto_97622 - BLOCK
      ?auto_97620 - BLOCK
      ?auto_97623 - BLOCK
      ?auto_97621 - BLOCK
      ?auto_97619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97617 ?auto_97618 ) ( not ( = ?auto_97617 ?auto_97618 ) ) ( not ( = ?auto_97617 ?auto_97624 ) ) ( not ( = ?auto_97617 ?auto_97622 ) ) ( not ( = ?auto_97618 ?auto_97624 ) ) ( not ( = ?auto_97618 ?auto_97622 ) ) ( not ( = ?auto_97624 ?auto_97622 ) ) ( ON ?auto_97624 ?auto_97617 ) ( ON-TABLE ?auto_97618 ) ( CLEAR ?auto_97620 ) ( ON-TABLE ?auto_97623 ) ( ON ?auto_97621 ?auto_97623 ) ( ON ?auto_97619 ?auto_97621 ) ( ON ?auto_97620 ?auto_97619 ) ( not ( = ?auto_97623 ?auto_97621 ) ) ( not ( = ?auto_97623 ?auto_97619 ) ) ( not ( = ?auto_97623 ?auto_97620 ) ) ( not ( = ?auto_97623 ?auto_97622 ) ) ( not ( = ?auto_97621 ?auto_97619 ) ) ( not ( = ?auto_97621 ?auto_97620 ) ) ( not ( = ?auto_97621 ?auto_97622 ) ) ( not ( = ?auto_97619 ?auto_97620 ) ) ( not ( = ?auto_97619 ?auto_97622 ) ) ( not ( = ?auto_97620 ?auto_97622 ) ) ( not ( = ?auto_97617 ?auto_97620 ) ) ( not ( = ?auto_97617 ?auto_97623 ) ) ( not ( = ?auto_97617 ?auto_97621 ) ) ( not ( = ?auto_97617 ?auto_97619 ) ) ( not ( = ?auto_97618 ?auto_97620 ) ) ( not ( = ?auto_97618 ?auto_97623 ) ) ( not ( = ?auto_97618 ?auto_97621 ) ) ( not ( = ?auto_97618 ?auto_97619 ) ) ( not ( = ?auto_97624 ?auto_97620 ) ) ( not ( = ?auto_97624 ?auto_97623 ) ) ( not ( = ?auto_97624 ?auto_97621 ) ) ( not ( = ?auto_97624 ?auto_97619 ) ) ( ON ?auto_97622 ?auto_97624 ) ( CLEAR ?auto_97622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97618 ?auto_97617 ?auto_97624 )
      ( MAKE-1PILE ?auto_97617 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97625 - BLOCK
    )
    :vars
    (
      ?auto_97626 - BLOCK
      ?auto_97630 - BLOCK
      ?auto_97628 - BLOCK
      ?auto_97629 - BLOCK
      ?auto_97631 - BLOCK
      ?auto_97632 - BLOCK
      ?auto_97627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97625 ?auto_97626 ) ( not ( = ?auto_97625 ?auto_97626 ) ) ( not ( = ?auto_97625 ?auto_97630 ) ) ( not ( = ?auto_97625 ?auto_97628 ) ) ( not ( = ?auto_97626 ?auto_97630 ) ) ( not ( = ?auto_97626 ?auto_97628 ) ) ( not ( = ?auto_97630 ?auto_97628 ) ) ( ON ?auto_97630 ?auto_97625 ) ( ON-TABLE ?auto_97626 ) ( ON-TABLE ?auto_97629 ) ( ON ?auto_97631 ?auto_97629 ) ( ON ?auto_97632 ?auto_97631 ) ( not ( = ?auto_97629 ?auto_97631 ) ) ( not ( = ?auto_97629 ?auto_97632 ) ) ( not ( = ?auto_97629 ?auto_97627 ) ) ( not ( = ?auto_97629 ?auto_97628 ) ) ( not ( = ?auto_97631 ?auto_97632 ) ) ( not ( = ?auto_97631 ?auto_97627 ) ) ( not ( = ?auto_97631 ?auto_97628 ) ) ( not ( = ?auto_97632 ?auto_97627 ) ) ( not ( = ?auto_97632 ?auto_97628 ) ) ( not ( = ?auto_97627 ?auto_97628 ) ) ( not ( = ?auto_97625 ?auto_97627 ) ) ( not ( = ?auto_97625 ?auto_97629 ) ) ( not ( = ?auto_97625 ?auto_97631 ) ) ( not ( = ?auto_97625 ?auto_97632 ) ) ( not ( = ?auto_97626 ?auto_97627 ) ) ( not ( = ?auto_97626 ?auto_97629 ) ) ( not ( = ?auto_97626 ?auto_97631 ) ) ( not ( = ?auto_97626 ?auto_97632 ) ) ( not ( = ?auto_97630 ?auto_97627 ) ) ( not ( = ?auto_97630 ?auto_97629 ) ) ( not ( = ?auto_97630 ?auto_97631 ) ) ( not ( = ?auto_97630 ?auto_97632 ) ) ( ON ?auto_97628 ?auto_97630 ) ( CLEAR ?auto_97628 ) ( HOLDING ?auto_97627 ) ( CLEAR ?auto_97632 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97629 ?auto_97631 ?auto_97632 ?auto_97627 )
      ( MAKE-1PILE ?auto_97625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97633 - BLOCK
    )
    :vars
    (
      ?auto_97636 - BLOCK
      ?auto_97634 - BLOCK
      ?auto_97637 - BLOCK
      ?auto_97640 - BLOCK
      ?auto_97639 - BLOCK
      ?auto_97638 - BLOCK
      ?auto_97635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97633 ?auto_97636 ) ( not ( = ?auto_97633 ?auto_97636 ) ) ( not ( = ?auto_97633 ?auto_97634 ) ) ( not ( = ?auto_97633 ?auto_97637 ) ) ( not ( = ?auto_97636 ?auto_97634 ) ) ( not ( = ?auto_97636 ?auto_97637 ) ) ( not ( = ?auto_97634 ?auto_97637 ) ) ( ON ?auto_97634 ?auto_97633 ) ( ON-TABLE ?auto_97636 ) ( ON-TABLE ?auto_97640 ) ( ON ?auto_97639 ?auto_97640 ) ( ON ?auto_97638 ?auto_97639 ) ( not ( = ?auto_97640 ?auto_97639 ) ) ( not ( = ?auto_97640 ?auto_97638 ) ) ( not ( = ?auto_97640 ?auto_97635 ) ) ( not ( = ?auto_97640 ?auto_97637 ) ) ( not ( = ?auto_97639 ?auto_97638 ) ) ( not ( = ?auto_97639 ?auto_97635 ) ) ( not ( = ?auto_97639 ?auto_97637 ) ) ( not ( = ?auto_97638 ?auto_97635 ) ) ( not ( = ?auto_97638 ?auto_97637 ) ) ( not ( = ?auto_97635 ?auto_97637 ) ) ( not ( = ?auto_97633 ?auto_97635 ) ) ( not ( = ?auto_97633 ?auto_97640 ) ) ( not ( = ?auto_97633 ?auto_97639 ) ) ( not ( = ?auto_97633 ?auto_97638 ) ) ( not ( = ?auto_97636 ?auto_97635 ) ) ( not ( = ?auto_97636 ?auto_97640 ) ) ( not ( = ?auto_97636 ?auto_97639 ) ) ( not ( = ?auto_97636 ?auto_97638 ) ) ( not ( = ?auto_97634 ?auto_97635 ) ) ( not ( = ?auto_97634 ?auto_97640 ) ) ( not ( = ?auto_97634 ?auto_97639 ) ) ( not ( = ?auto_97634 ?auto_97638 ) ) ( ON ?auto_97637 ?auto_97634 ) ( CLEAR ?auto_97638 ) ( ON ?auto_97635 ?auto_97637 ) ( CLEAR ?auto_97635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97636 ?auto_97633 ?auto_97634 ?auto_97637 )
      ( MAKE-1PILE ?auto_97633 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97641 - BLOCK
    )
    :vars
    (
      ?auto_97645 - BLOCK
      ?auto_97647 - BLOCK
      ?auto_97642 - BLOCK
      ?auto_97646 - BLOCK
      ?auto_97648 - BLOCK
      ?auto_97643 - BLOCK
      ?auto_97644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97641 ?auto_97645 ) ( not ( = ?auto_97641 ?auto_97645 ) ) ( not ( = ?auto_97641 ?auto_97647 ) ) ( not ( = ?auto_97641 ?auto_97642 ) ) ( not ( = ?auto_97645 ?auto_97647 ) ) ( not ( = ?auto_97645 ?auto_97642 ) ) ( not ( = ?auto_97647 ?auto_97642 ) ) ( ON ?auto_97647 ?auto_97641 ) ( ON-TABLE ?auto_97645 ) ( ON-TABLE ?auto_97646 ) ( ON ?auto_97648 ?auto_97646 ) ( not ( = ?auto_97646 ?auto_97648 ) ) ( not ( = ?auto_97646 ?auto_97643 ) ) ( not ( = ?auto_97646 ?auto_97644 ) ) ( not ( = ?auto_97646 ?auto_97642 ) ) ( not ( = ?auto_97648 ?auto_97643 ) ) ( not ( = ?auto_97648 ?auto_97644 ) ) ( not ( = ?auto_97648 ?auto_97642 ) ) ( not ( = ?auto_97643 ?auto_97644 ) ) ( not ( = ?auto_97643 ?auto_97642 ) ) ( not ( = ?auto_97644 ?auto_97642 ) ) ( not ( = ?auto_97641 ?auto_97644 ) ) ( not ( = ?auto_97641 ?auto_97646 ) ) ( not ( = ?auto_97641 ?auto_97648 ) ) ( not ( = ?auto_97641 ?auto_97643 ) ) ( not ( = ?auto_97645 ?auto_97644 ) ) ( not ( = ?auto_97645 ?auto_97646 ) ) ( not ( = ?auto_97645 ?auto_97648 ) ) ( not ( = ?auto_97645 ?auto_97643 ) ) ( not ( = ?auto_97647 ?auto_97644 ) ) ( not ( = ?auto_97647 ?auto_97646 ) ) ( not ( = ?auto_97647 ?auto_97648 ) ) ( not ( = ?auto_97647 ?auto_97643 ) ) ( ON ?auto_97642 ?auto_97647 ) ( ON ?auto_97644 ?auto_97642 ) ( CLEAR ?auto_97644 ) ( HOLDING ?auto_97643 ) ( CLEAR ?auto_97648 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97646 ?auto_97648 ?auto_97643 )
      ( MAKE-1PILE ?auto_97641 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97649 - BLOCK
    )
    :vars
    (
      ?auto_97650 - BLOCK
      ?auto_97656 - BLOCK
      ?auto_97655 - BLOCK
      ?auto_97653 - BLOCK
      ?auto_97652 - BLOCK
      ?auto_97651 - BLOCK
      ?auto_97654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97649 ?auto_97650 ) ( not ( = ?auto_97649 ?auto_97650 ) ) ( not ( = ?auto_97649 ?auto_97656 ) ) ( not ( = ?auto_97649 ?auto_97655 ) ) ( not ( = ?auto_97650 ?auto_97656 ) ) ( not ( = ?auto_97650 ?auto_97655 ) ) ( not ( = ?auto_97656 ?auto_97655 ) ) ( ON ?auto_97656 ?auto_97649 ) ( ON-TABLE ?auto_97650 ) ( ON-TABLE ?auto_97653 ) ( ON ?auto_97652 ?auto_97653 ) ( not ( = ?auto_97653 ?auto_97652 ) ) ( not ( = ?auto_97653 ?auto_97651 ) ) ( not ( = ?auto_97653 ?auto_97654 ) ) ( not ( = ?auto_97653 ?auto_97655 ) ) ( not ( = ?auto_97652 ?auto_97651 ) ) ( not ( = ?auto_97652 ?auto_97654 ) ) ( not ( = ?auto_97652 ?auto_97655 ) ) ( not ( = ?auto_97651 ?auto_97654 ) ) ( not ( = ?auto_97651 ?auto_97655 ) ) ( not ( = ?auto_97654 ?auto_97655 ) ) ( not ( = ?auto_97649 ?auto_97654 ) ) ( not ( = ?auto_97649 ?auto_97653 ) ) ( not ( = ?auto_97649 ?auto_97652 ) ) ( not ( = ?auto_97649 ?auto_97651 ) ) ( not ( = ?auto_97650 ?auto_97654 ) ) ( not ( = ?auto_97650 ?auto_97653 ) ) ( not ( = ?auto_97650 ?auto_97652 ) ) ( not ( = ?auto_97650 ?auto_97651 ) ) ( not ( = ?auto_97656 ?auto_97654 ) ) ( not ( = ?auto_97656 ?auto_97653 ) ) ( not ( = ?auto_97656 ?auto_97652 ) ) ( not ( = ?auto_97656 ?auto_97651 ) ) ( ON ?auto_97655 ?auto_97656 ) ( ON ?auto_97654 ?auto_97655 ) ( CLEAR ?auto_97652 ) ( ON ?auto_97651 ?auto_97654 ) ( CLEAR ?auto_97651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97650 ?auto_97649 ?auto_97656 ?auto_97655 ?auto_97654 )
      ( MAKE-1PILE ?auto_97649 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97657 - BLOCK
    )
    :vars
    (
      ?auto_97661 - BLOCK
      ?auto_97662 - BLOCK
      ?auto_97660 - BLOCK
      ?auto_97659 - BLOCK
      ?auto_97663 - BLOCK
      ?auto_97664 - BLOCK
      ?auto_97658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97657 ?auto_97661 ) ( not ( = ?auto_97657 ?auto_97661 ) ) ( not ( = ?auto_97657 ?auto_97662 ) ) ( not ( = ?auto_97657 ?auto_97660 ) ) ( not ( = ?auto_97661 ?auto_97662 ) ) ( not ( = ?auto_97661 ?auto_97660 ) ) ( not ( = ?auto_97662 ?auto_97660 ) ) ( ON ?auto_97662 ?auto_97657 ) ( ON-TABLE ?auto_97661 ) ( ON-TABLE ?auto_97659 ) ( not ( = ?auto_97659 ?auto_97663 ) ) ( not ( = ?auto_97659 ?auto_97664 ) ) ( not ( = ?auto_97659 ?auto_97658 ) ) ( not ( = ?auto_97659 ?auto_97660 ) ) ( not ( = ?auto_97663 ?auto_97664 ) ) ( not ( = ?auto_97663 ?auto_97658 ) ) ( not ( = ?auto_97663 ?auto_97660 ) ) ( not ( = ?auto_97664 ?auto_97658 ) ) ( not ( = ?auto_97664 ?auto_97660 ) ) ( not ( = ?auto_97658 ?auto_97660 ) ) ( not ( = ?auto_97657 ?auto_97658 ) ) ( not ( = ?auto_97657 ?auto_97659 ) ) ( not ( = ?auto_97657 ?auto_97663 ) ) ( not ( = ?auto_97657 ?auto_97664 ) ) ( not ( = ?auto_97661 ?auto_97658 ) ) ( not ( = ?auto_97661 ?auto_97659 ) ) ( not ( = ?auto_97661 ?auto_97663 ) ) ( not ( = ?auto_97661 ?auto_97664 ) ) ( not ( = ?auto_97662 ?auto_97658 ) ) ( not ( = ?auto_97662 ?auto_97659 ) ) ( not ( = ?auto_97662 ?auto_97663 ) ) ( not ( = ?auto_97662 ?auto_97664 ) ) ( ON ?auto_97660 ?auto_97662 ) ( ON ?auto_97658 ?auto_97660 ) ( ON ?auto_97664 ?auto_97658 ) ( CLEAR ?auto_97664 ) ( HOLDING ?auto_97663 ) ( CLEAR ?auto_97659 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97659 ?auto_97663 )
      ( MAKE-1PILE ?auto_97657 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97665 - BLOCK
    )
    :vars
    (
      ?auto_97669 - BLOCK
      ?auto_97671 - BLOCK
      ?auto_97672 - BLOCK
      ?auto_97670 - BLOCK
      ?auto_97668 - BLOCK
      ?auto_97666 - BLOCK
      ?auto_97667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97665 ?auto_97669 ) ( not ( = ?auto_97665 ?auto_97669 ) ) ( not ( = ?auto_97665 ?auto_97671 ) ) ( not ( = ?auto_97665 ?auto_97672 ) ) ( not ( = ?auto_97669 ?auto_97671 ) ) ( not ( = ?auto_97669 ?auto_97672 ) ) ( not ( = ?auto_97671 ?auto_97672 ) ) ( ON ?auto_97671 ?auto_97665 ) ( ON-TABLE ?auto_97669 ) ( ON-TABLE ?auto_97670 ) ( not ( = ?auto_97670 ?auto_97668 ) ) ( not ( = ?auto_97670 ?auto_97666 ) ) ( not ( = ?auto_97670 ?auto_97667 ) ) ( not ( = ?auto_97670 ?auto_97672 ) ) ( not ( = ?auto_97668 ?auto_97666 ) ) ( not ( = ?auto_97668 ?auto_97667 ) ) ( not ( = ?auto_97668 ?auto_97672 ) ) ( not ( = ?auto_97666 ?auto_97667 ) ) ( not ( = ?auto_97666 ?auto_97672 ) ) ( not ( = ?auto_97667 ?auto_97672 ) ) ( not ( = ?auto_97665 ?auto_97667 ) ) ( not ( = ?auto_97665 ?auto_97670 ) ) ( not ( = ?auto_97665 ?auto_97668 ) ) ( not ( = ?auto_97665 ?auto_97666 ) ) ( not ( = ?auto_97669 ?auto_97667 ) ) ( not ( = ?auto_97669 ?auto_97670 ) ) ( not ( = ?auto_97669 ?auto_97668 ) ) ( not ( = ?auto_97669 ?auto_97666 ) ) ( not ( = ?auto_97671 ?auto_97667 ) ) ( not ( = ?auto_97671 ?auto_97670 ) ) ( not ( = ?auto_97671 ?auto_97668 ) ) ( not ( = ?auto_97671 ?auto_97666 ) ) ( ON ?auto_97672 ?auto_97671 ) ( ON ?auto_97667 ?auto_97672 ) ( ON ?auto_97666 ?auto_97667 ) ( CLEAR ?auto_97670 ) ( ON ?auto_97668 ?auto_97666 ) ( CLEAR ?auto_97668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97669 ?auto_97665 ?auto_97671 ?auto_97672 ?auto_97667 ?auto_97666 )
      ( MAKE-1PILE ?auto_97665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97673 - BLOCK
    )
    :vars
    (
      ?auto_97679 - BLOCK
      ?auto_97680 - BLOCK
      ?auto_97676 - BLOCK
      ?auto_97674 - BLOCK
      ?auto_97677 - BLOCK
      ?auto_97678 - BLOCK
      ?auto_97675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97673 ?auto_97679 ) ( not ( = ?auto_97673 ?auto_97679 ) ) ( not ( = ?auto_97673 ?auto_97680 ) ) ( not ( = ?auto_97673 ?auto_97676 ) ) ( not ( = ?auto_97679 ?auto_97680 ) ) ( not ( = ?auto_97679 ?auto_97676 ) ) ( not ( = ?auto_97680 ?auto_97676 ) ) ( ON ?auto_97680 ?auto_97673 ) ( ON-TABLE ?auto_97679 ) ( not ( = ?auto_97674 ?auto_97677 ) ) ( not ( = ?auto_97674 ?auto_97678 ) ) ( not ( = ?auto_97674 ?auto_97675 ) ) ( not ( = ?auto_97674 ?auto_97676 ) ) ( not ( = ?auto_97677 ?auto_97678 ) ) ( not ( = ?auto_97677 ?auto_97675 ) ) ( not ( = ?auto_97677 ?auto_97676 ) ) ( not ( = ?auto_97678 ?auto_97675 ) ) ( not ( = ?auto_97678 ?auto_97676 ) ) ( not ( = ?auto_97675 ?auto_97676 ) ) ( not ( = ?auto_97673 ?auto_97675 ) ) ( not ( = ?auto_97673 ?auto_97674 ) ) ( not ( = ?auto_97673 ?auto_97677 ) ) ( not ( = ?auto_97673 ?auto_97678 ) ) ( not ( = ?auto_97679 ?auto_97675 ) ) ( not ( = ?auto_97679 ?auto_97674 ) ) ( not ( = ?auto_97679 ?auto_97677 ) ) ( not ( = ?auto_97679 ?auto_97678 ) ) ( not ( = ?auto_97680 ?auto_97675 ) ) ( not ( = ?auto_97680 ?auto_97674 ) ) ( not ( = ?auto_97680 ?auto_97677 ) ) ( not ( = ?auto_97680 ?auto_97678 ) ) ( ON ?auto_97676 ?auto_97680 ) ( ON ?auto_97675 ?auto_97676 ) ( ON ?auto_97678 ?auto_97675 ) ( ON ?auto_97677 ?auto_97678 ) ( CLEAR ?auto_97677 ) ( HOLDING ?auto_97674 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97674 )
      ( MAKE-1PILE ?auto_97673 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_97681 - BLOCK
    )
    :vars
    (
      ?auto_97684 - BLOCK
      ?auto_97682 - BLOCK
      ?auto_97685 - BLOCK
      ?auto_97687 - BLOCK
      ?auto_97688 - BLOCK
      ?auto_97686 - BLOCK
      ?auto_97683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97681 ?auto_97684 ) ( not ( = ?auto_97681 ?auto_97684 ) ) ( not ( = ?auto_97681 ?auto_97682 ) ) ( not ( = ?auto_97681 ?auto_97685 ) ) ( not ( = ?auto_97684 ?auto_97682 ) ) ( not ( = ?auto_97684 ?auto_97685 ) ) ( not ( = ?auto_97682 ?auto_97685 ) ) ( ON ?auto_97682 ?auto_97681 ) ( ON-TABLE ?auto_97684 ) ( not ( = ?auto_97687 ?auto_97688 ) ) ( not ( = ?auto_97687 ?auto_97686 ) ) ( not ( = ?auto_97687 ?auto_97683 ) ) ( not ( = ?auto_97687 ?auto_97685 ) ) ( not ( = ?auto_97688 ?auto_97686 ) ) ( not ( = ?auto_97688 ?auto_97683 ) ) ( not ( = ?auto_97688 ?auto_97685 ) ) ( not ( = ?auto_97686 ?auto_97683 ) ) ( not ( = ?auto_97686 ?auto_97685 ) ) ( not ( = ?auto_97683 ?auto_97685 ) ) ( not ( = ?auto_97681 ?auto_97683 ) ) ( not ( = ?auto_97681 ?auto_97687 ) ) ( not ( = ?auto_97681 ?auto_97688 ) ) ( not ( = ?auto_97681 ?auto_97686 ) ) ( not ( = ?auto_97684 ?auto_97683 ) ) ( not ( = ?auto_97684 ?auto_97687 ) ) ( not ( = ?auto_97684 ?auto_97688 ) ) ( not ( = ?auto_97684 ?auto_97686 ) ) ( not ( = ?auto_97682 ?auto_97683 ) ) ( not ( = ?auto_97682 ?auto_97687 ) ) ( not ( = ?auto_97682 ?auto_97688 ) ) ( not ( = ?auto_97682 ?auto_97686 ) ) ( ON ?auto_97685 ?auto_97682 ) ( ON ?auto_97683 ?auto_97685 ) ( ON ?auto_97686 ?auto_97683 ) ( ON ?auto_97688 ?auto_97686 ) ( ON ?auto_97687 ?auto_97688 ) ( CLEAR ?auto_97687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97684 ?auto_97681 ?auto_97682 ?auto_97685 ?auto_97683 ?auto_97686 ?auto_97688 )
      ( MAKE-1PILE ?auto_97681 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_97700 - BLOCK
      ?auto_97701 - BLOCK
      ?auto_97702 - BLOCK
      ?auto_97703 - BLOCK
      ?auto_97704 - BLOCK
    )
    :vars
    (
      ?auto_97705 - BLOCK
      ?auto_97706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97705 ?auto_97704 ) ( CLEAR ?auto_97705 ) ( ON-TABLE ?auto_97700 ) ( ON ?auto_97701 ?auto_97700 ) ( ON ?auto_97702 ?auto_97701 ) ( ON ?auto_97703 ?auto_97702 ) ( ON ?auto_97704 ?auto_97703 ) ( not ( = ?auto_97700 ?auto_97701 ) ) ( not ( = ?auto_97700 ?auto_97702 ) ) ( not ( = ?auto_97700 ?auto_97703 ) ) ( not ( = ?auto_97700 ?auto_97704 ) ) ( not ( = ?auto_97700 ?auto_97705 ) ) ( not ( = ?auto_97701 ?auto_97702 ) ) ( not ( = ?auto_97701 ?auto_97703 ) ) ( not ( = ?auto_97701 ?auto_97704 ) ) ( not ( = ?auto_97701 ?auto_97705 ) ) ( not ( = ?auto_97702 ?auto_97703 ) ) ( not ( = ?auto_97702 ?auto_97704 ) ) ( not ( = ?auto_97702 ?auto_97705 ) ) ( not ( = ?auto_97703 ?auto_97704 ) ) ( not ( = ?auto_97703 ?auto_97705 ) ) ( not ( = ?auto_97704 ?auto_97705 ) ) ( HOLDING ?auto_97706 ) ( not ( = ?auto_97700 ?auto_97706 ) ) ( not ( = ?auto_97701 ?auto_97706 ) ) ( not ( = ?auto_97702 ?auto_97706 ) ) ( not ( = ?auto_97703 ?auto_97706 ) ) ( not ( = ?auto_97704 ?auto_97706 ) ) ( not ( = ?auto_97705 ?auto_97706 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_97706 )
      ( MAKE-5PILE ?auto_97700 ?auto_97701 ?auto_97702 ?auto_97703 ?auto_97704 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97797 - BLOCK
      ?auto_97798 - BLOCK
    )
    :vars
    (
      ?auto_97799 - BLOCK
      ?auto_97801 - BLOCK
      ?auto_97802 - BLOCK
      ?auto_97800 - BLOCK
      ?auto_97803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97797 ?auto_97798 ) ) ( ON ?auto_97798 ?auto_97799 ) ( not ( = ?auto_97797 ?auto_97799 ) ) ( not ( = ?auto_97798 ?auto_97799 ) ) ( ON ?auto_97797 ?auto_97798 ) ( CLEAR ?auto_97797 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97801 ) ( ON ?auto_97802 ?auto_97801 ) ( ON ?auto_97800 ?auto_97802 ) ( ON ?auto_97803 ?auto_97800 ) ( ON ?auto_97799 ?auto_97803 ) ( not ( = ?auto_97801 ?auto_97802 ) ) ( not ( = ?auto_97801 ?auto_97800 ) ) ( not ( = ?auto_97801 ?auto_97803 ) ) ( not ( = ?auto_97801 ?auto_97799 ) ) ( not ( = ?auto_97801 ?auto_97798 ) ) ( not ( = ?auto_97801 ?auto_97797 ) ) ( not ( = ?auto_97802 ?auto_97800 ) ) ( not ( = ?auto_97802 ?auto_97803 ) ) ( not ( = ?auto_97802 ?auto_97799 ) ) ( not ( = ?auto_97802 ?auto_97798 ) ) ( not ( = ?auto_97802 ?auto_97797 ) ) ( not ( = ?auto_97800 ?auto_97803 ) ) ( not ( = ?auto_97800 ?auto_97799 ) ) ( not ( = ?auto_97800 ?auto_97798 ) ) ( not ( = ?auto_97800 ?auto_97797 ) ) ( not ( = ?auto_97803 ?auto_97799 ) ) ( not ( = ?auto_97803 ?auto_97798 ) ) ( not ( = ?auto_97803 ?auto_97797 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97801 ?auto_97802 ?auto_97800 ?auto_97803 ?auto_97799 ?auto_97798 )
      ( MAKE-2PILE ?auto_97797 ?auto_97798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97806 - BLOCK
      ?auto_97807 - BLOCK
    )
    :vars
    (
      ?auto_97808 - BLOCK
      ?auto_97809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97806 ?auto_97807 ) ) ( ON ?auto_97807 ?auto_97808 ) ( CLEAR ?auto_97807 ) ( not ( = ?auto_97806 ?auto_97808 ) ) ( not ( = ?auto_97807 ?auto_97808 ) ) ( ON ?auto_97806 ?auto_97809 ) ( CLEAR ?auto_97806 ) ( HAND-EMPTY ) ( not ( = ?auto_97806 ?auto_97809 ) ) ( not ( = ?auto_97807 ?auto_97809 ) ) ( not ( = ?auto_97808 ?auto_97809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_97806 ?auto_97809 )
      ( MAKE-2PILE ?auto_97806 ?auto_97807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97810 - BLOCK
      ?auto_97811 - BLOCK
    )
    :vars
    (
      ?auto_97813 - BLOCK
      ?auto_97812 - BLOCK
      ?auto_97816 - BLOCK
      ?auto_97815 - BLOCK
      ?auto_97814 - BLOCK
      ?auto_97817 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97810 ?auto_97811 ) ) ( not ( = ?auto_97810 ?auto_97813 ) ) ( not ( = ?auto_97811 ?auto_97813 ) ) ( ON ?auto_97810 ?auto_97812 ) ( CLEAR ?auto_97810 ) ( not ( = ?auto_97810 ?auto_97812 ) ) ( not ( = ?auto_97811 ?auto_97812 ) ) ( not ( = ?auto_97813 ?auto_97812 ) ) ( HOLDING ?auto_97811 ) ( CLEAR ?auto_97813 ) ( ON-TABLE ?auto_97816 ) ( ON ?auto_97815 ?auto_97816 ) ( ON ?auto_97814 ?auto_97815 ) ( ON ?auto_97817 ?auto_97814 ) ( ON ?auto_97813 ?auto_97817 ) ( not ( = ?auto_97816 ?auto_97815 ) ) ( not ( = ?auto_97816 ?auto_97814 ) ) ( not ( = ?auto_97816 ?auto_97817 ) ) ( not ( = ?auto_97816 ?auto_97813 ) ) ( not ( = ?auto_97816 ?auto_97811 ) ) ( not ( = ?auto_97815 ?auto_97814 ) ) ( not ( = ?auto_97815 ?auto_97817 ) ) ( not ( = ?auto_97815 ?auto_97813 ) ) ( not ( = ?auto_97815 ?auto_97811 ) ) ( not ( = ?auto_97814 ?auto_97817 ) ) ( not ( = ?auto_97814 ?auto_97813 ) ) ( not ( = ?auto_97814 ?auto_97811 ) ) ( not ( = ?auto_97817 ?auto_97813 ) ) ( not ( = ?auto_97817 ?auto_97811 ) ) ( not ( = ?auto_97810 ?auto_97816 ) ) ( not ( = ?auto_97810 ?auto_97815 ) ) ( not ( = ?auto_97810 ?auto_97814 ) ) ( not ( = ?auto_97810 ?auto_97817 ) ) ( not ( = ?auto_97812 ?auto_97816 ) ) ( not ( = ?auto_97812 ?auto_97815 ) ) ( not ( = ?auto_97812 ?auto_97814 ) ) ( not ( = ?auto_97812 ?auto_97817 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97816 ?auto_97815 ?auto_97814 ?auto_97817 ?auto_97813 ?auto_97811 )
      ( MAKE-2PILE ?auto_97810 ?auto_97811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97818 - BLOCK
      ?auto_97819 - BLOCK
    )
    :vars
    (
      ?auto_97821 - BLOCK
      ?auto_97822 - BLOCK
      ?auto_97825 - BLOCK
      ?auto_97823 - BLOCK
      ?auto_97820 - BLOCK
      ?auto_97824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97818 ?auto_97819 ) ) ( not ( = ?auto_97818 ?auto_97821 ) ) ( not ( = ?auto_97819 ?auto_97821 ) ) ( ON ?auto_97818 ?auto_97822 ) ( not ( = ?auto_97818 ?auto_97822 ) ) ( not ( = ?auto_97819 ?auto_97822 ) ) ( not ( = ?auto_97821 ?auto_97822 ) ) ( CLEAR ?auto_97821 ) ( ON-TABLE ?auto_97825 ) ( ON ?auto_97823 ?auto_97825 ) ( ON ?auto_97820 ?auto_97823 ) ( ON ?auto_97824 ?auto_97820 ) ( ON ?auto_97821 ?auto_97824 ) ( not ( = ?auto_97825 ?auto_97823 ) ) ( not ( = ?auto_97825 ?auto_97820 ) ) ( not ( = ?auto_97825 ?auto_97824 ) ) ( not ( = ?auto_97825 ?auto_97821 ) ) ( not ( = ?auto_97825 ?auto_97819 ) ) ( not ( = ?auto_97823 ?auto_97820 ) ) ( not ( = ?auto_97823 ?auto_97824 ) ) ( not ( = ?auto_97823 ?auto_97821 ) ) ( not ( = ?auto_97823 ?auto_97819 ) ) ( not ( = ?auto_97820 ?auto_97824 ) ) ( not ( = ?auto_97820 ?auto_97821 ) ) ( not ( = ?auto_97820 ?auto_97819 ) ) ( not ( = ?auto_97824 ?auto_97821 ) ) ( not ( = ?auto_97824 ?auto_97819 ) ) ( not ( = ?auto_97818 ?auto_97825 ) ) ( not ( = ?auto_97818 ?auto_97823 ) ) ( not ( = ?auto_97818 ?auto_97820 ) ) ( not ( = ?auto_97818 ?auto_97824 ) ) ( not ( = ?auto_97822 ?auto_97825 ) ) ( not ( = ?auto_97822 ?auto_97823 ) ) ( not ( = ?auto_97822 ?auto_97820 ) ) ( not ( = ?auto_97822 ?auto_97824 ) ) ( ON ?auto_97819 ?auto_97818 ) ( CLEAR ?auto_97819 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_97822 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97822 ?auto_97818 )
      ( MAKE-2PILE ?auto_97818 ?auto_97819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97826 - BLOCK
      ?auto_97827 - BLOCK
    )
    :vars
    (
      ?auto_97831 - BLOCK
      ?auto_97830 - BLOCK
      ?auto_97828 - BLOCK
      ?auto_97833 - BLOCK
      ?auto_97829 - BLOCK
      ?auto_97832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97826 ?auto_97827 ) ) ( not ( = ?auto_97826 ?auto_97831 ) ) ( not ( = ?auto_97827 ?auto_97831 ) ) ( ON ?auto_97826 ?auto_97830 ) ( not ( = ?auto_97826 ?auto_97830 ) ) ( not ( = ?auto_97827 ?auto_97830 ) ) ( not ( = ?auto_97831 ?auto_97830 ) ) ( ON-TABLE ?auto_97828 ) ( ON ?auto_97833 ?auto_97828 ) ( ON ?auto_97829 ?auto_97833 ) ( ON ?auto_97832 ?auto_97829 ) ( not ( = ?auto_97828 ?auto_97833 ) ) ( not ( = ?auto_97828 ?auto_97829 ) ) ( not ( = ?auto_97828 ?auto_97832 ) ) ( not ( = ?auto_97828 ?auto_97831 ) ) ( not ( = ?auto_97828 ?auto_97827 ) ) ( not ( = ?auto_97833 ?auto_97829 ) ) ( not ( = ?auto_97833 ?auto_97832 ) ) ( not ( = ?auto_97833 ?auto_97831 ) ) ( not ( = ?auto_97833 ?auto_97827 ) ) ( not ( = ?auto_97829 ?auto_97832 ) ) ( not ( = ?auto_97829 ?auto_97831 ) ) ( not ( = ?auto_97829 ?auto_97827 ) ) ( not ( = ?auto_97832 ?auto_97831 ) ) ( not ( = ?auto_97832 ?auto_97827 ) ) ( not ( = ?auto_97826 ?auto_97828 ) ) ( not ( = ?auto_97826 ?auto_97833 ) ) ( not ( = ?auto_97826 ?auto_97829 ) ) ( not ( = ?auto_97826 ?auto_97832 ) ) ( not ( = ?auto_97830 ?auto_97828 ) ) ( not ( = ?auto_97830 ?auto_97833 ) ) ( not ( = ?auto_97830 ?auto_97829 ) ) ( not ( = ?auto_97830 ?auto_97832 ) ) ( ON ?auto_97827 ?auto_97826 ) ( CLEAR ?auto_97827 ) ( ON-TABLE ?auto_97830 ) ( HOLDING ?auto_97831 ) ( CLEAR ?auto_97832 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97828 ?auto_97833 ?auto_97829 ?auto_97832 ?auto_97831 )
      ( MAKE-2PILE ?auto_97826 ?auto_97827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97834 - BLOCK
      ?auto_97835 - BLOCK
    )
    :vars
    (
      ?auto_97838 - BLOCK
      ?auto_97840 - BLOCK
      ?auto_97836 - BLOCK
      ?auto_97837 - BLOCK
      ?auto_97841 - BLOCK
      ?auto_97839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97834 ?auto_97835 ) ) ( not ( = ?auto_97834 ?auto_97838 ) ) ( not ( = ?auto_97835 ?auto_97838 ) ) ( ON ?auto_97834 ?auto_97840 ) ( not ( = ?auto_97834 ?auto_97840 ) ) ( not ( = ?auto_97835 ?auto_97840 ) ) ( not ( = ?auto_97838 ?auto_97840 ) ) ( ON-TABLE ?auto_97836 ) ( ON ?auto_97837 ?auto_97836 ) ( ON ?auto_97841 ?auto_97837 ) ( ON ?auto_97839 ?auto_97841 ) ( not ( = ?auto_97836 ?auto_97837 ) ) ( not ( = ?auto_97836 ?auto_97841 ) ) ( not ( = ?auto_97836 ?auto_97839 ) ) ( not ( = ?auto_97836 ?auto_97838 ) ) ( not ( = ?auto_97836 ?auto_97835 ) ) ( not ( = ?auto_97837 ?auto_97841 ) ) ( not ( = ?auto_97837 ?auto_97839 ) ) ( not ( = ?auto_97837 ?auto_97838 ) ) ( not ( = ?auto_97837 ?auto_97835 ) ) ( not ( = ?auto_97841 ?auto_97839 ) ) ( not ( = ?auto_97841 ?auto_97838 ) ) ( not ( = ?auto_97841 ?auto_97835 ) ) ( not ( = ?auto_97839 ?auto_97838 ) ) ( not ( = ?auto_97839 ?auto_97835 ) ) ( not ( = ?auto_97834 ?auto_97836 ) ) ( not ( = ?auto_97834 ?auto_97837 ) ) ( not ( = ?auto_97834 ?auto_97841 ) ) ( not ( = ?auto_97834 ?auto_97839 ) ) ( not ( = ?auto_97840 ?auto_97836 ) ) ( not ( = ?auto_97840 ?auto_97837 ) ) ( not ( = ?auto_97840 ?auto_97841 ) ) ( not ( = ?auto_97840 ?auto_97839 ) ) ( ON ?auto_97835 ?auto_97834 ) ( ON-TABLE ?auto_97840 ) ( CLEAR ?auto_97839 ) ( ON ?auto_97838 ?auto_97835 ) ( CLEAR ?auto_97838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97840 ?auto_97834 ?auto_97835 )
      ( MAKE-2PILE ?auto_97834 ?auto_97835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97842 - BLOCK
      ?auto_97843 - BLOCK
    )
    :vars
    (
      ?auto_97845 - BLOCK
      ?auto_97847 - BLOCK
      ?auto_97849 - BLOCK
      ?auto_97844 - BLOCK
      ?auto_97848 - BLOCK
      ?auto_97846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97842 ?auto_97843 ) ) ( not ( = ?auto_97842 ?auto_97845 ) ) ( not ( = ?auto_97843 ?auto_97845 ) ) ( ON ?auto_97842 ?auto_97847 ) ( not ( = ?auto_97842 ?auto_97847 ) ) ( not ( = ?auto_97843 ?auto_97847 ) ) ( not ( = ?auto_97845 ?auto_97847 ) ) ( ON-TABLE ?auto_97849 ) ( ON ?auto_97844 ?auto_97849 ) ( ON ?auto_97848 ?auto_97844 ) ( not ( = ?auto_97849 ?auto_97844 ) ) ( not ( = ?auto_97849 ?auto_97848 ) ) ( not ( = ?auto_97849 ?auto_97846 ) ) ( not ( = ?auto_97849 ?auto_97845 ) ) ( not ( = ?auto_97849 ?auto_97843 ) ) ( not ( = ?auto_97844 ?auto_97848 ) ) ( not ( = ?auto_97844 ?auto_97846 ) ) ( not ( = ?auto_97844 ?auto_97845 ) ) ( not ( = ?auto_97844 ?auto_97843 ) ) ( not ( = ?auto_97848 ?auto_97846 ) ) ( not ( = ?auto_97848 ?auto_97845 ) ) ( not ( = ?auto_97848 ?auto_97843 ) ) ( not ( = ?auto_97846 ?auto_97845 ) ) ( not ( = ?auto_97846 ?auto_97843 ) ) ( not ( = ?auto_97842 ?auto_97849 ) ) ( not ( = ?auto_97842 ?auto_97844 ) ) ( not ( = ?auto_97842 ?auto_97848 ) ) ( not ( = ?auto_97842 ?auto_97846 ) ) ( not ( = ?auto_97847 ?auto_97849 ) ) ( not ( = ?auto_97847 ?auto_97844 ) ) ( not ( = ?auto_97847 ?auto_97848 ) ) ( not ( = ?auto_97847 ?auto_97846 ) ) ( ON ?auto_97843 ?auto_97842 ) ( ON-TABLE ?auto_97847 ) ( ON ?auto_97845 ?auto_97843 ) ( CLEAR ?auto_97845 ) ( HOLDING ?auto_97846 ) ( CLEAR ?auto_97848 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97849 ?auto_97844 ?auto_97848 ?auto_97846 )
      ( MAKE-2PILE ?auto_97842 ?auto_97843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97850 - BLOCK
      ?auto_97851 - BLOCK
    )
    :vars
    (
      ?auto_97857 - BLOCK
      ?auto_97856 - BLOCK
      ?auto_97853 - BLOCK
      ?auto_97852 - BLOCK
      ?auto_97854 - BLOCK
      ?auto_97855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97850 ?auto_97851 ) ) ( not ( = ?auto_97850 ?auto_97857 ) ) ( not ( = ?auto_97851 ?auto_97857 ) ) ( ON ?auto_97850 ?auto_97856 ) ( not ( = ?auto_97850 ?auto_97856 ) ) ( not ( = ?auto_97851 ?auto_97856 ) ) ( not ( = ?auto_97857 ?auto_97856 ) ) ( ON-TABLE ?auto_97853 ) ( ON ?auto_97852 ?auto_97853 ) ( ON ?auto_97854 ?auto_97852 ) ( not ( = ?auto_97853 ?auto_97852 ) ) ( not ( = ?auto_97853 ?auto_97854 ) ) ( not ( = ?auto_97853 ?auto_97855 ) ) ( not ( = ?auto_97853 ?auto_97857 ) ) ( not ( = ?auto_97853 ?auto_97851 ) ) ( not ( = ?auto_97852 ?auto_97854 ) ) ( not ( = ?auto_97852 ?auto_97855 ) ) ( not ( = ?auto_97852 ?auto_97857 ) ) ( not ( = ?auto_97852 ?auto_97851 ) ) ( not ( = ?auto_97854 ?auto_97855 ) ) ( not ( = ?auto_97854 ?auto_97857 ) ) ( not ( = ?auto_97854 ?auto_97851 ) ) ( not ( = ?auto_97855 ?auto_97857 ) ) ( not ( = ?auto_97855 ?auto_97851 ) ) ( not ( = ?auto_97850 ?auto_97853 ) ) ( not ( = ?auto_97850 ?auto_97852 ) ) ( not ( = ?auto_97850 ?auto_97854 ) ) ( not ( = ?auto_97850 ?auto_97855 ) ) ( not ( = ?auto_97856 ?auto_97853 ) ) ( not ( = ?auto_97856 ?auto_97852 ) ) ( not ( = ?auto_97856 ?auto_97854 ) ) ( not ( = ?auto_97856 ?auto_97855 ) ) ( ON ?auto_97851 ?auto_97850 ) ( ON-TABLE ?auto_97856 ) ( ON ?auto_97857 ?auto_97851 ) ( CLEAR ?auto_97854 ) ( ON ?auto_97855 ?auto_97857 ) ( CLEAR ?auto_97855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_97856 ?auto_97850 ?auto_97851 ?auto_97857 )
      ( MAKE-2PILE ?auto_97850 ?auto_97851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97858 - BLOCK
      ?auto_97859 - BLOCK
    )
    :vars
    (
      ?auto_97861 - BLOCK
      ?auto_97860 - BLOCK
      ?auto_97864 - BLOCK
      ?auto_97865 - BLOCK
      ?auto_97863 - BLOCK
      ?auto_97862 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97858 ?auto_97859 ) ) ( not ( = ?auto_97858 ?auto_97861 ) ) ( not ( = ?auto_97859 ?auto_97861 ) ) ( ON ?auto_97858 ?auto_97860 ) ( not ( = ?auto_97858 ?auto_97860 ) ) ( not ( = ?auto_97859 ?auto_97860 ) ) ( not ( = ?auto_97861 ?auto_97860 ) ) ( ON-TABLE ?auto_97864 ) ( ON ?auto_97865 ?auto_97864 ) ( not ( = ?auto_97864 ?auto_97865 ) ) ( not ( = ?auto_97864 ?auto_97863 ) ) ( not ( = ?auto_97864 ?auto_97862 ) ) ( not ( = ?auto_97864 ?auto_97861 ) ) ( not ( = ?auto_97864 ?auto_97859 ) ) ( not ( = ?auto_97865 ?auto_97863 ) ) ( not ( = ?auto_97865 ?auto_97862 ) ) ( not ( = ?auto_97865 ?auto_97861 ) ) ( not ( = ?auto_97865 ?auto_97859 ) ) ( not ( = ?auto_97863 ?auto_97862 ) ) ( not ( = ?auto_97863 ?auto_97861 ) ) ( not ( = ?auto_97863 ?auto_97859 ) ) ( not ( = ?auto_97862 ?auto_97861 ) ) ( not ( = ?auto_97862 ?auto_97859 ) ) ( not ( = ?auto_97858 ?auto_97864 ) ) ( not ( = ?auto_97858 ?auto_97865 ) ) ( not ( = ?auto_97858 ?auto_97863 ) ) ( not ( = ?auto_97858 ?auto_97862 ) ) ( not ( = ?auto_97860 ?auto_97864 ) ) ( not ( = ?auto_97860 ?auto_97865 ) ) ( not ( = ?auto_97860 ?auto_97863 ) ) ( not ( = ?auto_97860 ?auto_97862 ) ) ( ON ?auto_97859 ?auto_97858 ) ( ON-TABLE ?auto_97860 ) ( ON ?auto_97861 ?auto_97859 ) ( ON ?auto_97862 ?auto_97861 ) ( CLEAR ?auto_97862 ) ( HOLDING ?auto_97863 ) ( CLEAR ?auto_97865 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_97864 ?auto_97865 ?auto_97863 )
      ( MAKE-2PILE ?auto_97858 ?auto_97859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97866 - BLOCK
      ?auto_97867 - BLOCK
    )
    :vars
    (
      ?auto_97872 - BLOCK
      ?auto_97871 - BLOCK
      ?auto_97869 - BLOCK
      ?auto_97870 - BLOCK
      ?auto_97868 - BLOCK
      ?auto_97873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97866 ?auto_97867 ) ) ( not ( = ?auto_97866 ?auto_97872 ) ) ( not ( = ?auto_97867 ?auto_97872 ) ) ( ON ?auto_97866 ?auto_97871 ) ( not ( = ?auto_97866 ?auto_97871 ) ) ( not ( = ?auto_97867 ?auto_97871 ) ) ( not ( = ?auto_97872 ?auto_97871 ) ) ( ON-TABLE ?auto_97869 ) ( ON ?auto_97870 ?auto_97869 ) ( not ( = ?auto_97869 ?auto_97870 ) ) ( not ( = ?auto_97869 ?auto_97868 ) ) ( not ( = ?auto_97869 ?auto_97873 ) ) ( not ( = ?auto_97869 ?auto_97872 ) ) ( not ( = ?auto_97869 ?auto_97867 ) ) ( not ( = ?auto_97870 ?auto_97868 ) ) ( not ( = ?auto_97870 ?auto_97873 ) ) ( not ( = ?auto_97870 ?auto_97872 ) ) ( not ( = ?auto_97870 ?auto_97867 ) ) ( not ( = ?auto_97868 ?auto_97873 ) ) ( not ( = ?auto_97868 ?auto_97872 ) ) ( not ( = ?auto_97868 ?auto_97867 ) ) ( not ( = ?auto_97873 ?auto_97872 ) ) ( not ( = ?auto_97873 ?auto_97867 ) ) ( not ( = ?auto_97866 ?auto_97869 ) ) ( not ( = ?auto_97866 ?auto_97870 ) ) ( not ( = ?auto_97866 ?auto_97868 ) ) ( not ( = ?auto_97866 ?auto_97873 ) ) ( not ( = ?auto_97871 ?auto_97869 ) ) ( not ( = ?auto_97871 ?auto_97870 ) ) ( not ( = ?auto_97871 ?auto_97868 ) ) ( not ( = ?auto_97871 ?auto_97873 ) ) ( ON ?auto_97867 ?auto_97866 ) ( ON-TABLE ?auto_97871 ) ( ON ?auto_97872 ?auto_97867 ) ( ON ?auto_97873 ?auto_97872 ) ( CLEAR ?auto_97870 ) ( ON ?auto_97868 ?auto_97873 ) ( CLEAR ?auto_97868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_97871 ?auto_97866 ?auto_97867 ?auto_97872 ?auto_97873 )
      ( MAKE-2PILE ?auto_97866 ?auto_97867 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97874 - BLOCK
      ?auto_97875 - BLOCK
    )
    :vars
    (
      ?auto_97877 - BLOCK
      ?auto_97878 - BLOCK
      ?auto_97880 - BLOCK
      ?auto_97876 - BLOCK
      ?auto_97881 - BLOCK
      ?auto_97879 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97874 ?auto_97875 ) ) ( not ( = ?auto_97874 ?auto_97877 ) ) ( not ( = ?auto_97875 ?auto_97877 ) ) ( ON ?auto_97874 ?auto_97878 ) ( not ( = ?auto_97874 ?auto_97878 ) ) ( not ( = ?auto_97875 ?auto_97878 ) ) ( not ( = ?auto_97877 ?auto_97878 ) ) ( ON-TABLE ?auto_97880 ) ( not ( = ?auto_97880 ?auto_97876 ) ) ( not ( = ?auto_97880 ?auto_97881 ) ) ( not ( = ?auto_97880 ?auto_97879 ) ) ( not ( = ?auto_97880 ?auto_97877 ) ) ( not ( = ?auto_97880 ?auto_97875 ) ) ( not ( = ?auto_97876 ?auto_97881 ) ) ( not ( = ?auto_97876 ?auto_97879 ) ) ( not ( = ?auto_97876 ?auto_97877 ) ) ( not ( = ?auto_97876 ?auto_97875 ) ) ( not ( = ?auto_97881 ?auto_97879 ) ) ( not ( = ?auto_97881 ?auto_97877 ) ) ( not ( = ?auto_97881 ?auto_97875 ) ) ( not ( = ?auto_97879 ?auto_97877 ) ) ( not ( = ?auto_97879 ?auto_97875 ) ) ( not ( = ?auto_97874 ?auto_97880 ) ) ( not ( = ?auto_97874 ?auto_97876 ) ) ( not ( = ?auto_97874 ?auto_97881 ) ) ( not ( = ?auto_97874 ?auto_97879 ) ) ( not ( = ?auto_97878 ?auto_97880 ) ) ( not ( = ?auto_97878 ?auto_97876 ) ) ( not ( = ?auto_97878 ?auto_97881 ) ) ( not ( = ?auto_97878 ?auto_97879 ) ) ( ON ?auto_97875 ?auto_97874 ) ( ON-TABLE ?auto_97878 ) ( ON ?auto_97877 ?auto_97875 ) ( ON ?auto_97879 ?auto_97877 ) ( ON ?auto_97881 ?auto_97879 ) ( CLEAR ?auto_97881 ) ( HOLDING ?auto_97876 ) ( CLEAR ?auto_97880 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_97880 ?auto_97876 )
      ( MAKE-2PILE ?auto_97874 ?auto_97875 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97882 - BLOCK
      ?auto_97883 - BLOCK
    )
    :vars
    (
      ?auto_97886 - BLOCK
      ?auto_97888 - BLOCK
      ?auto_97885 - BLOCK
      ?auto_97887 - BLOCK
      ?auto_97884 - BLOCK
      ?auto_97889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97882 ?auto_97883 ) ) ( not ( = ?auto_97882 ?auto_97886 ) ) ( not ( = ?auto_97883 ?auto_97886 ) ) ( ON ?auto_97882 ?auto_97888 ) ( not ( = ?auto_97882 ?auto_97888 ) ) ( not ( = ?auto_97883 ?auto_97888 ) ) ( not ( = ?auto_97886 ?auto_97888 ) ) ( ON-TABLE ?auto_97885 ) ( not ( = ?auto_97885 ?auto_97887 ) ) ( not ( = ?auto_97885 ?auto_97884 ) ) ( not ( = ?auto_97885 ?auto_97889 ) ) ( not ( = ?auto_97885 ?auto_97886 ) ) ( not ( = ?auto_97885 ?auto_97883 ) ) ( not ( = ?auto_97887 ?auto_97884 ) ) ( not ( = ?auto_97887 ?auto_97889 ) ) ( not ( = ?auto_97887 ?auto_97886 ) ) ( not ( = ?auto_97887 ?auto_97883 ) ) ( not ( = ?auto_97884 ?auto_97889 ) ) ( not ( = ?auto_97884 ?auto_97886 ) ) ( not ( = ?auto_97884 ?auto_97883 ) ) ( not ( = ?auto_97889 ?auto_97886 ) ) ( not ( = ?auto_97889 ?auto_97883 ) ) ( not ( = ?auto_97882 ?auto_97885 ) ) ( not ( = ?auto_97882 ?auto_97887 ) ) ( not ( = ?auto_97882 ?auto_97884 ) ) ( not ( = ?auto_97882 ?auto_97889 ) ) ( not ( = ?auto_97888 ?auto_97885 ) ) ( not ( = ?auto_97888 ?auto_97887 ) ) ( not ( = ?auto_97888 ?auto_97884 ) ) ( not ( = ?auto_97888 ?auto_97889 ) ) ( ON ?auto_97883 ?auto_97882 ) ( ON-TABLE ?auto_97888 ) ( ON ?auto_97886 ?auto_97883 ) ( ON ?auto_97889 ?auto_97886 ) ( ON ?auto_97884 ?auto_97889 ) ( CLEAR ?auto_97885 ) ( ON ?auto_97887 ?auto_97884 ) ( CLEAR ?auto_97887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_97888 ?auto_97882 ?auto_97883 ?auto_97886 ?auto_97889 ?auto_97884 )
      ( MAKE-2PILE ?auto_97882 ?auto_97883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97890 - BLOCK
      ?auto_97891 - BLOCK
    )
    :vars
    (
      ?auto_97893 - BLOCK
      ?auto_97895 - BLOCK
      ?auto_97896 - BLOCK
      ?auto_97894 - BLOCK
      ?auto_97892 - BLOCK
      ?auto_97897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97890 ?auto_97891 ) ) ( not ( = ?auto_97890 ?auto_97893 ) ) ( not ( = ?auto_97891 ?auto_97893 ) ) ( ON ?auto_97890 ?auto_97895 ) ( not ( = ?auto_97890 ?auto_97895 ) ) ( not ( = ?auto_97891 ?auto_97895 ) ) ( not ( = ?auto_97893 ?auto_97895 ) ) ( not ( = ?auto_97896 ?auto_97894 ) ) ( not ( = ?auto_97896 ?auto_97892 ) ) ( not ( = ?auto_97896 ?auto_97897 ) ) ( not ( = ?auto_97896 ?auto_97893 ) ) ( not ( = ?auto_97896 ?auto_97891 ) ) ( not ( = ?auto_97894 ?auto_97892 ) ) ( not ( = ?auto_97894 ?auto_97897 ) ) ( not ( = ?auto_97894 ?auto_97893 ) ) ( not ( = ?auto_97894 ?auto_97891 ) ) ( not ( = ?auto_97892 ?auto_97897 ) ) ( not ( = ?auto_97892 ?auto_97893 ) ) ( not ( = ?auto_97892 ?auto_97891 ) ) ( not ( = ?auto_97897 ?auto_97893 ) ) ( not ( = ?auto_97897 ?auto_97891 ) ) ( not ( = ?auto_97890 ?auto_97896 ) ) ( not ( = ?auto_97890 ?auto_97894 ) ) ( not ( = ?auto_97890 ?auto_97892 ) ) ( not ( = ?auto_97890 ?auto_97897 ) ) ( not ( = ?auto_97895 ?auto_97896 ) ) ( not ( = ?auto_97895 ?auto_97894 ) ) ( not ( = ?auto_97895 ?auto_97892 ) ) ( not ( = ?auto_97895 ?auto_97897 ) ) ( ON ?auto_97891 ?auto_97890 ) ( ON-TABLE ?auto_97895 ) ( ON ?auto_97893 ?auto_97891 ) ( ON ?auto_97897 ?auto_97893 ) ( ON ?auto_97892 ?auto_97897 ) ( ON ?auto_97894 ?auto_97892 ) ( CLEAR ?auto_97894 ) ( HOLDING ?auto_97896 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97896 )
      ( MAKE-2PILE ?auto_97890 ?auto_97891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_97898 - BLOCK
      ?auto_97899 - BLOCK
    )
    :vars
    (
      ?auto_97903 - BLOCK
      ?auto_97905 - BLOCK
      ?auto_97901 - BLOCK
      ?auto_97900 - BLOCK
      ?auto_97902 - BLOCK
      ?auto_97904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_97898 ?auto_97899 ) ) ( not ( = ?auto_97898 ?auto_97903 ) ) ( not ( = ?auto_97899 ?auto_97903 ) ) ( ON ?auto_97898 ?auto_97905 ) ( not ( = ?auto_97898 ?auto_97905 ) ) ( not ( = ?auto_97899 ?auto_97905 ) ) ( not ( = ?auto_97903 ?auto_97905 ) ) ( not ( = ?auto_97901 ?auto_97900 ) ) ( not ( = ?auto_97901 ?auto_97902 ) ) ( not ( = ?auto_97901 ?auto_97904 ) ) ( not ( = ?auto_97901 ?auto_97903 ) ) ( not ( = ?auto_97901 ?auto_97899 ) ) ( not ( = ?auto_97900 ?auto_97902 ) ) ( not ( = ?auto_97900 ?auto_97904 ) ) ( not ( = ?auto_97900 ?auto_97903 ) ) ( not ( = ?auto_97900 ?auto_97899 ) ) ( not ( = ?auto_97902 ?auto_97904 ) ) ( not ( = ?auto_97902 ?auto_97903 ) ) ( not ( = ?auto_97902 ?auto_97899 ) ) ( not ( = ?auto_97904 ?auto_97903 ) ) ( not ( = ?auto_97904 ?auto_97899 ) ) ( not ( = ?auto_97898 ?auto_97901 ) ) ( not ( = ?auto_97898 ?auto_97900 ) ) ( not ( = ?auto_97898 ?auto_97902 ) ) ( not ( = ?auto_97898 ?auto_97904 ) ) ( not ( = ?auto_97905 ?auto_97901 ) ) ( not ( = ?auto_97905 ?auto_97900 ) ) ( not ( = ?auto_97905 ?auto_97902 ) ) ( not ( = ?auto_97905 ?auto_97904 ) ) ( ON ?auto_97899 ?auto_97898 ) ( ON-TABLE ?auto_97905 ) ( ON ?auto_97903 ?auto_97899 ) ( ON ?auto_97904 ?auto_97903 ) ( ON ?auto_97902 ?auto_97904 ) ( ON ?auto_97900 ?auto_97902 ) ( ON ?auto_97901 ?auto_97900 ) ( CLEAR ?auto_97901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_97905 ?auto_97898 ?auto_97899 ?auto_97903 ?auto_97904 ?auto_97902 ?auto_97900 )
      ( MAKE-2PILE ?auto_97898 ?auto_97899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_97929 - BLOCK
      ?auto_97930 - BLOCK
      ?auto_97931 - BLOCK
      ?auto_97932 - BLOCK
    )
    :vars
    (
      ?auto_97935 - BLOCK
      ?auto_97933 - BLOCK
      ?auto_97934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_97935 ?auto_97932 ) ( ON-TABLE ?auto_97929 ) ( ON ?auto_97930 ?auto_97929 ) ( ON ?auto_97931 ?auto_97930 ) ( ON ?auto_97932 ?auto_97931 ) ( not ( = ?auto_97929 ?auto_97930 ) ) ( not ( = ?auto_97929 ?auto_97931 ) ) ( not ( = ?auto_97929 ?auto_97932 ) ) ( not ( = ?auto_97929 ?auto_97935 ) ) ( not ( = ?auto_97930 ?auto_97931 ) ) ( not ( = ?auto_97930 ?auto_97932 ) ) ( not ( = ?auto_97930 ?auto_97935 ) ) ( not ( = ?auto_97931 ?auto_97932 ) ) ( not ( = ?auto_97931 ?auto_97935 ) ) ( not ( = ?auto_97932 ?auto_97935 ) ) ( not ( = ?auto_97929 ?auto_97933 ) ) ( not ( = ?auto_97929 ?auto_97934 ) ) ( not ( = ?auto_97930 ?auto_97933 ) ) ( not ( = ?auto_97930 ?auto_97934 ) ) ( not ( = ?auto_97931 ?auto_97933 ) ) ( not ( = ?auto_97931 ?auto_97934 ) ) ( not ( = ?auto_97932 ?auto_97933 ) ) ( not ( = ?auto_97932 ?auto_97934 ) ) ( not ( = ?auto_97935 ?auto_97933 ) ) ( not ( = ?auto_97935 ?auto_97934 ) ) ( not ( = ?auto_97933 ?auto_97934 ) ) ( ON ?auto_97933 ?auto_97935 ) ( CLEAR ?auto_97933 ) ( HOLDING ?auto_97934 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_97934 )
      ( MAKE-4PILE ?auto_97929 ?auto_97930 ?auto_97931 ?auto_97932 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98016 - BLOCK
      ?auto_98017 - BLOCK
      ?auto_98018 - BLOCK
    )
    :vars
    (
      ?auto_98019 - BLOCK
      ?auto_98021 - BLOCK
      ?auto_98020 - BLOCK
      ?auto_98022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98016 ) ( not ( = ?auto_98016 ?auto_98017 ) ) ( not ( = ?auto_98016 ?auto_98018 ) ) ( not ( = ?auto_98017 ?auto_98018 ) ) ( ON ?auto_98018 ?auto_98019 ) ( not ( = ?auto_98016 ?auto_98019 ) ) ( not ( = ?auto_98017 ?auto_98019 ) ) ( not ( = ?auto_98018 ?auto_98019 ) ) ( CLEAR ?auto_98016 ) ( ON ?auto_98017 ?auto_98018 ) ( CLEAR ?auto_98017 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98021 ) ( ON ?auto_98020 ?auto_98021 ) ( ON ?auto_98022 ?auto_98020 ) ( ON ?auto_98019 ?auto_98022 ) ( not ( = ?auto_98021 ?auto_98020 ) ) ( not ( = ?auto_98021 ?auto_98022 ) ) ( not ( = ?auto_98021 ?auto_98019 ) ) ( not ( = ?auto_98021 ?auto_98018 ) ) ( not ( = ?auto_98021 ?auto_98017 ) ) ( not ( = ?auto_98020 ?auto_98022 ) ) ( not ( = ?auto_98020 ?auto_98019 ) ) ( not ( = ?auto_98020 ?auto_98018 ) ) ( not ( = ?auto_98020 ?auto_98017 ) ) ( not ( = ?auto_98022 ?auto_98019 ) ) ( not ( = ?auto_98022 ?auto_98018 ) ) ( not ( = ?auto_98022 ?auto_98017 ) ) ( not ( = ?auto_98016 ?auto_98021 ) ) ( not ( = ?auto_98016 ?auto_98020 ) ) ( not ( = ?auto_98016 ?auto_98022 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98021 ?auto_98020 ?auto_98022 ?auto_98019 ?auto_98018 )
      ( MAKE-3PILE ?auto_98016 ?auto_98017 ?auto_98018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98023 - BLOCK
      ?auto_98024 - BLOCK
      ?auto_98025 - BLOCK
    )
    :vars
    (
      ?auto_98027 - BLOCK
      ?auto_98029 - BLOCK
      ?auto_98028 - BLOCK
      ?auto_98026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98023 ?auto_98024 ) ) ( not ( = ?auto_98023 ?auto_98025 ) ) ( not ( = ?auto_98024 ?auto_98025 ) ) ( ON ?auto_98025 ?auto_98027 ) ( not ( = ?auto_98023 ?auto_98027 ) ) ( not ( = ?auto_98024 ?auto_98027 ) ) ( not ( = ?auto_98025 ?auto_98027 ) ) ( ON ?auto_98024 ?auto_98025 ) ( CLEAR ?auto_98024 ) ( ON-TABLE ?auto_98029 ) ( ON ?auto_98028 ?auto_98029 ) ( ON ?auto_98026 ?auto_98028 ) ( ON ?auto_98027 ?auto_98026 ) ( not ( = ?auto_98029 ?auto_98028 ) ) ( not ( = ?auto_98029 ?auto_98026 ) ) ( not ( = ?auto_98029 ?auto_98027 ) ) ( not ( = ?auto_98029 ?auto_98025 ) ) ( not ( = ?auto_98029 ?auto_98024 ) ) ( not ( = ?auto_98028 ?auto_98026 ) ) ( not ( = ?auto_98028 ?auto_98027 ) ) ( not ( = ?auto_98028 ?auto_98025 ) ) ( not ( = ?auto_98028 ?auto_98024 ) ) ( not ( = ?auto_98026 ?auto_98027 ) ) ( not ( = ?auto_98026 ?auto_98025 ) ) ( not ( = ?auto_98026 ?auto_98024 ) ) ( not ( = ?auto_98023 ?auto_98029 ) ) ( not ( = ?auto_98023 ?auto_98028 ) ) ( not ( = ?auto_98023 ?auto_98026 ) ) ( HOLDING ?auto_98023 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98023 )
      ( MAKE-3PILE ?auto_98023 ?auto_98024 ?auto_98025 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98030 - BLOCK
      ?auto_98031 - BLOCK
      ?auto_98032 - BLOCK
    )
    :vars
    (
      ?auto_98035 - BLOCK
      ?auto_98036 - BLOCK
      ?auto_98033 - BLOCK
      ?auto_98034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98030 ?auto_98031 ) ) ( not ( = ?auto_98030 ?auto_98032 ) ) ( not ( = ?auto_98031 ?auto_98032 ) ) ( ON ?auto_98032 ?auto_98035 ) ( not ( = ?auto_98030 ?auto_98035 ) ) ( not ( = ?auto_98031 ?auto_98035 ) ) ( not ( = ?auto_98032 ?auto_98035 ) ) ( ON ?auto_98031 ?auto_98032 ) ( ON-TABLE ?auto_98036 ) ( ON ?auto_98033 ?auto_98036 ) ( ON ?auto_98034 ?auto_98033 ) ( ON ?auto_98035 ?auto_98034 ) ( not ( = ?auto_98036 ?auto_98033 ) ) ( not ( = ?auto_98036 ?auto_98034 ) ) ( not ( = ?auto_98036 ?auto_98035 ) ) ( not ( = ?auto_98036 ?auto_98032 ) ) ( not ( = ?auto_98036 ?auto_98031 ) ) ( not ( = ?auto_98033 ?auto_98034 ) ) ( not ( = ?auto_98033 ?auto_98035 ) ) ( not ( = ?auto_98033 ?auto_98032 ) ) ( not ( = ?auto_98033 ?auto_98031 ) ) ( not ( = ?auto_98034 ?auto_98035 ) ) ( not ( = ?auto_98034 ?auto_98032 ) ) ( not ( = ?auto_98034 ?auto_98031 ) ) ( not ( = ?auto_98030 ?auto_98036 ) ) ( not ( = ?auto_98030 ?auto_98033 ) ) ( not ( = ?auto_98030 ?auto_98034 ) ) ( ON ?auto_98030 ?auto_98031 ) ( CLEAR ?auto_98030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98036 ?auto_98033 ?auto_98034 ?auto_98035 ?auto_98032 ?auto_98031 )
      ( MAKE-3PILE ?auto_98030 ?auto_98031 ?auto_98032 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98040 - BLOCK
      ?auto_98041 - BLOCK
      ?auto_98042 - BLOCK
    )
    :vars
    (
      ?auto_98044 - BLOCK
      ?auto_98043 - BLOCK
      ?auto_98045 - BLOCK
      ?auto_98046 - BLOCK
      ?auto_98047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98040 ?auto_98041 ) ) ( not ( = ?auto_98040 ?auto_98042 ) ) ( not ( = ?auto_98041 ?auto_98042 ) ) ( ON ?auto_98042 ?auto_98044 ) ( not ( = ?auto_98040 ?auto_98044 ) ) ( not ( = ?auto_98041 ?auto_98044 ) ) ( not ( = ?auto_98042 ?auto_98044 ) ) ( ON ?auto_98041 ?auto_98042 ) ( CLEAR ?auto_98041 ) ( ON-TABLE ?auto_98043 ) ( ON ?auto_98045 ?auto_98043 ) ( ON ?auto_98046 ?auto_98045 ) ( ON ?auto_98044 ?auto_98046 ) ( not ( = ?auto_98043 ?auto_98045 ) ) ( not ( = ?auto_98043 ?auto_98046 ) ) ( not ( = ?auto_98043 ?auto_98044 ) ) ( not ( = ?auto_98043 ?auto_98042 ) ) ( not ( = ?auto_98043 ?auto_98041 ) ) ( not ( = ?auto_98045 ?auto_98046 ) ) ( not ( = ?auto_98045 ?auto_98044 ) ) ( not ( = ?auto_98045 ?auto_98042 ) ) ( not ( = ?auto_98045 ?auto_98041 ) ) ( not ( = ?auto_98046 ?auto_98044 ) ) ( not ( = ?auto_98046 ?auto_98042 ) ) ( not ( = ?auto_98046 ?auto_98041 ) ) ( not ( = ?auto_98040 ?auto_98043 ) ) ( not ( = ?auto_98040 ?auto_98045 ) ) ( not ( = ?auto_98040 ?auto_98046 ) ) ( ON ?auto_98040 ?auto_98047 ) ( CLEAR ?auto_98040 ) ( HAND-EMPTY ) ( not ( = ?auto_98040 ?auto_98047 ) ) ( not ( = ?auto_98041 ?auto_98047 ) ) ( not ( = ?auto_98042 ?auto_98047 ) ) ( not ( = ?auto_98044 ?auto_98047 ) ) ( not ( = ?auto_98043 ?auto_98047 ) ) ( not ( = ?auto_98045 ?auto_98047 ) ) ( not ( = ?auto_98046 ?auto_98047 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98040 ?auto_98047 )
      ( MAKE-3PILE ?auto_98040 ?auto_98041 ?auto_98042 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98048 - BLOCK
      ?auto_98049 - BLOCK
      ?auto_98050 - BLOCK
    )
    :vars
    (
      ?auto_98053 - BLOCK
      ?auto_98055 - BLOCK
      ?auto_98051 - BLOCK
      ?auto_98052 - BLOCK
      ?auto_98054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98048 ?auto_98049 ) ) ( not ( = ?auto_98048 ?auto_98050 ) ) ( not ( = ?auto_98049 ?auto_98050 ) ) ( ON ?auto_98050 ?auto_98053 ) ( not ( = ?auto_98048 ?auto_98053 ) ) ( not ( = ?auto_98049 ?auto_98053 ) ) ( not ( = ?auto_98050 ?auto_98053 ) ) ( ON-TABLE ?auto_98055 ) ( ON ?auto_98051 ?auto_98055 ) ( ON ?auto_98052 ?auto_98051 ) ( ON ?auto_98053 ?auto_98052 ) ( not ( = ?auto_98055 ?auto_98051 ) ) ( not ( = ?auto_98055 ?auto_98052 ) ) ( not ( = ?auto_98055 ?auto_98053 ) ) ( not ( = ?auto_98055 ?auto_98050 ) ) ( not ( = ?auto_98055 ?auto_98049 ) ) ( not ( = ?auto_98051 ?auto_98052 ) ) ( not ( = ?auto_98051 ?auto_98053 ) ) ( not ( = ?auto_98051 ?auto_98050 ) ) ( not ( = ?auto_98051 ?auto_98049 ) ) ( not ( = ?auto_98052 ?auto_98053 ) ) ( not ( = ?auto_98052 ?auto_98050 ) ) ( not ( = ?auto_98052 ?auto_98049 ) ) ( not ( = ?auto_98048 ?auto_98055 ) ) ( not ( = ?auto_98048 ?auto_98051 ) ) ( not ( = ?auto_98048 ?auto_98052 ) ) ( ON ?auto_98048 ?auto_98054 ) ( CLEAR ?auto_98048 ) ( not ( = ?auto_98048 ?auto_98054 ) ) ( not ( = ?auto_98049 ?auto_98054 ) ) ( not ( = ?auto_98050 ?auto_98054 ) ) ( not ( = ?auto_98053 ?auto_98054 ) ) ( not ( = ?auto_98055 ?auto_98054 ) ) ( not ( = ?auto_98051 ?auto_98054 ) ) ( not ( = ?auto_98052 ?auto_98054 ) ) ( HOLDING ?auto_98049 ) ( CLEAR ?auto_98050 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98055 ?auto_98051 ?auto_98052 ?auto_98053 ?auto_98050 ?auto_98049 )
      ( MAKE-3PILE ?auto_98048 ?auto_98049 ?auto_98050 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98056 - BLOCK
      ?auto_98057 - BLOCK
      ?auto_98058 - BLOCK
    )
    :vars
    (
      ?auto_98063 - BLOCK
      ?auto_98062 - BLOCK
      ?auto_98061 - BLOCK
      ?auto_98060 - BLOCK
      ?auto_98059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98056 ?auto_98057 ) ) ( not ( = ?auto_98056 ?auto_98058 ) ) ( not ( = ?auto_98057 ?auto_98058 ) ) ( ON ?auto_98058 ?auto_98063 ) ( not ( = ?auto_98056 ?auto_98063 ) ) ( not ( = ?auto_98057 ?auto_98063 ) ) ( not ( = ?auto_98058 ?auto_98063 ) ) ( ON-TABLE ?auto_98062 ) ( ON ?auto_98061 ?auto_98062 ) ( ON ?auto_98060 ?auto_98061 ) ( ON ?auto_98063 ?auto_98060 ) ( not ( = ?auto_98062 ?auto_98061 ) ) ( not ( = ?auto_98062 ?auto_98060 ) ) ( not ( = ?auto_98062 ?auto_98063 ) ) ( not ( = ?auto_98062 ?auto_98058 ) ) ( not ( = ?auto_98062 ?auto_98057 ) ) ( not ( = ?auto_98061 ?auto_98060 ) ) ( not ( = ?auto_98061 ?auto_98063 ) ) ( not ( = ?auto_98061 ?auto_98058 ) ) ( not ( = ?auto_98061 ?auto_98057 ) ) ( not ( = ?auto_98060 ?auto_98063 ) ) ( not ( = ?auto_98060 ?auto_98058 ) ) ( not ( = ?auto_98060 ?auto_98057 ) ) ( not ( = ?auto_98056 ?auto_98062 ) ) ( not ( = ?auto_98056 ?auto_98061 ) ) ( not ( = ?auto_98056 ?auto_98060 ) ) ( ON ?auto_98056 ?auto_98059 ) ( not ( = ?auto_98056 ?auto_98059 ) ) ( not ( = ?auto_98057 ?auto_98059 ) ) ( not ( = ?auto_98058 ?auto_98059 ) ) ( not ( = ?auto_98063 ?auto_98059 ) ) ( not ( = ?auto_98062 ?auto_98059 ) ) ( not ( = ?auto_98061 ?auto_98059 ) ) ( not ( = ?auto_98060 ?auto_98059 ) ) ( CLEAR ?auto_98058 ) ( ON ?auto_98057 ?auto_98056 ) ( CLEAR ?auto_98057 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98059 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98059 ?auto_98056 )
      ( MAKE-3PILE ?auto_98056 ?auto_98057 ?auto_98058 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98064 - BLOCK
      ?auto_98065 - BLOCK
      ?auto_98066 - BLOCK
    )
    :vars
    (
      ?auto_98070 - BLOCK
      ?auto_98071 - BLOCK
      ?auto_98068 - BLOCK
      ?auto_98067 - BLOCK
      ?auto_98069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98064 ?auto_98065 ) ) ( not ( = ?auto_98064 ?auto_98066 ) ) ( not ( = ?auto_98065 ?auto_98066 ) ) ( not ( = ?auto_98064 ?auto_98070 ) ) ( not ( = ?auto_98065 ?auto_98070 ) ) ( not ( = ?auto_98066 ?auto_98070 ) ) ( ON-TABLE ?auto_98071 ) ( ON ?auto_98068 ?auto_98071 ) ( ON ?auto_98067 ?auto_98068 ) ( ON ?auto_98070 ?auto_98067 ) ( not ( = ?auto_98071 ?auto_98068 ) ) ( not ( = ?auto_98071 ?auto_98067 ) ) ( not ( = ?auto_98071 ?auto_98070 ) ) ( not ( = ?auto_98071 ?auto_98066 ) ) ( not ( = ?auto_98071 ?auto_98065 ) ) ( not ( = ?auto_98068 ?auto_98067 ) ) ( not ( = ?auto_98068 ?auto_98070 ) ) ( not ( = ?auto_98068 ?auto_98066 ) ) ( not ( = ?auto_98068 ?auto_98065 ) ) ( not ( = ?auto_98067 ?auto_98070 ) ) ( not ( = ?auto_98067 ?auto_98066 ) ) ( not ( = ?auto_98067 ?auto_98065 ) ) ( not ( = ?auto_98064 ?auto_98071 ) ) ( not ( = ?auto_98064 ?auto_98068 ) ) ( not ( = ?auto_98064 ?auto_98067 ) ) ( ON ?auto_98064 ?auto_98069 ) ( not ( = ?auto_98064 ?auto_98069 ) ) ( not ( = ?auto_98065 ?auto_98069 ) ) ( not ( = ?auto_98066 ?auto_98069 ) ) ( not ( = ?auto_98070 ?auto_98069 ) ) ( not ( = ?auto_98071 ?auto_98069 ) ) ( not ( = ?auto_98068 ?auto_98069 ) ) ( not ( = ?auto_98067 ?auto_98069 ) ) ( ON ?auto_98065 ?auto_98064 ) ( CLEAR ?auto_98065 ) ( ON-TABLE ?auto_98069 ) ( HOLDING ?auto_98066 ) ( CLEAR ?auto_98070 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98071 ?auto_98068 ?auto_98067 ?auto_98070 ?auto_98066 )
      ( MAKE-3PILE ?auto_98064 ?auto_98065 ?auto_98066 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98072 - BLOCK
      ?auto_98073 - BLOCK
      ?auto_98074 - BLOCK
    )
    :vars
    (
      ?auto_98075 - BLOCK
      ?auto_98079 - BLOCK
      ?auto_98078 - BLOCK
      ?auto_98077 - BLOCK
      ?auto_98076 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98072 ?auto_98073 ) ) ( not ( = ?auto_98072 ?auto_98074 ) ) ( not ( = ?auto_98073 ?auto_98074 ) ) ( not ( = ?auto_98072 ?auto_98075 ) ) ( not ( = ?auto_98073 ?auto_98075 ) ) ( not ( = ?auto_98074 ?auto_98075 ) ) ( ON-TABLE ?auto_98079 ) ( ON ?auto_98078 ?auto_98079 ) ( ON ?auto_98077 ?auto_98078 ) ( ON ?auto_98075 ?auto_98077 ) ( not ( = ?auto_98079 ?auto_98078 ) ) ( not ( = ?auto_98079 ?auto_98077 ) ) ( not ( = ?auto_98079 ?auto_98075 ) ) ( not ( = ?auto_98079 ?auto_98074 ) ) ( not ( = ?auto_98079 ?auto_98073 ) ) ( not ( = ?auto_98078 ?auto_98077 ) ) ( not ( = ?auto_98078 ?auto_98075 ) ) ( not ( = ?auto_98078 ?auto_98074 ) ) ( not ( = ?auto_98078 ?auto_98073 ) ) ( not ( = ?auto_98077 ?auto_98075 ) ) ( not ( = ?auto_98077 ?auto_98074 ) ) ( not ( = ?auto_98077 ?auto_98073 ) ) ( not ( = ?auto_98072 ?auto_98079 ) ) ( not ( = ?auto_98072 ?auto_98078 ) ) ( not ( = ?auto_98072 ?auto_98077 ) ) ( ON ?auto_98072 ?auto_98076 ) ( not ( = ?auto_98072 ?auto_98076 ) ) ( not ( = ?auto_98073 ?auto_98076 ) ) ( not ( = ?auto_98074 ?auto_98076 ) ) ( not ( = ?auto_98075 ?auto_98076 ) ) ( not ( = ?auto_98079 ?auto_98076 ) ) ( not ( = ?auto_98078 ?auto_98076 ) ) ( not ( = ?auto_98077 ?auto_98076 ) ) ( ON ?auto_98073 ?auto_98072 ) ( ON-TABLE ?auto_98076 ) ( CLEAR ?auto_98075 ) ( ON ?auto_98074 ?auto_98073 ) ( CLEAR ?auto_98074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98076 ?auto_98072 ?auto_98073 )
      ( MAKE-3PILE ?auto_98072 ?auto_98073 ?auto_98074 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98080 - BLOCK
      ?auto_98081 - BLOCK
      ?auto_98082 - BLOCK
    )
    :vars
    (
      ?auto_98084 - BLOCK
      ?auto_98086 - BLOCK
      ?auto_98083 - BLOCK
      ?auto_98087 - BLOCK
      ?auto_98085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98080 ?auto_98081 ) ) ( not ( = ?auto_98080 ?auto_98082 ) ) ( not ( = ?auto_98081 ?auto_98082 ) ) ( not ( = ?auto_98080 ?auto_98084 ) ) ( not ( = ?auto_98081 ?auto_98084 ) ) ( not ( = ?auto_98082 ?auto_98084 ) ) ( ON-TABLE ?auto_98086 ) ( ON ?auto_98083 ?auto_98086 ) ( ON ?auto_98087 ?auto_98083 ) ( not ( = ?auto_98086 ?auto_98083 ) ) ( not ( = ?auto_98086 ?auto_98087 ) ) ( not ( = ?auto_98086 ?auto_98084 ) ) ( not ( = ?auto_98086 ?auto_98082 ) ) ( not ( = ?auto_98086 ?auto_98081 ) ) ( not ( = ?auto_98083 ?auto_98087 ) ) ( not ( = ?auto_98083 ?auto_98084 ) ) ( not ( = ?auto_98083 ?auto_98082 ) ) ( not ( = ?auto_98083 ?auto_98081 ) ) ( not ( = ?auto_98087 ?auto_98084 ) ) ( not ( = ?auto_98087 ?auto_98082 ) ) ( not ( = ?auto_98087 ?auto_98081 ) ) ( not ( = ?auto_98080 ?auto_98086 ) ) ( not ( = ?auto_98080 ?auto_98083 ) ) ( not ( = ?auto_98080 ?auto_98087 ) ) ( ON ?auto_98080 ?auto_98085 ) ( not ( = ?auto_98080 ?auto_98085 ) ) ( not ( = ?auto_98081 ?auto_98085 ) ) ( not ( = ?auto_98082 ?auto_98085 ) ) ( not ( = ?auto_98084 ?auto_98085 ) ) ( not ( = ?auto_98086 ?auto_98085 ) ) ( not ( = ?auto_98083 ?auto_98085 ) ) ( not ( = ?auto_98087 ?auto_98085 ) ) ( ON ?auto_98081 ?auto_98080 ) ( ON-TABLE ?auto_98085 ) ( ON ?auto_98082 ?auto_98081 ) ( CLEAR ?auto_98082 ) ( HOLDING ?auto_98084 ) ( CLEAR ?auto_98087 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98086 ?auto_98083 ?auto_98087 ?auto_98084 )
      ( MAKE-3PILE ?auto_98080 ?auto_98081 ?auto_98082 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98088 - BLOCK
      ?auto_98089 - BLOCK
      ?auto_98090 - BLOCK
    )
    :vars
    (
      ?auto_98091 - BLOCK
      ?auto_98094 - BLOCK
      ?auto_98095 - BLOCK
      ?auto_98092 - BLOCK
      ?auto_98093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98088 ?auto_98089 ) ) ( not ( = ?auto_98088 ?auto_98090 ) ) ( not ( = ?auto_98089 ?auto_98090 ) ) ( not ( = ?auto_98088 ?auto_98091 ) ) ( not ( = ?auto_98089 ?auto_98091 ) ) ( not ( = ?auto_98090 ?auto_98091 ) ) ( ON-TABLE ?auto_98094 ) ( ON ?auto_98095 ?auto_98094 ) ( ON ?auto_98092 ?auto_98095 ) ( not ( = ?auto_98094 ?auto_98095 ) ) ( not ( = ?auto_98094 ?auto_98092 ) ) ( not ( = ?auto_98094 ?auto_98091 ) ) ( not ( = ?auto_98094 ?auto_98090 ) ) ( not ( = ?auto_98094 ?auto_98089 ) ) ( not ( = ?auto_98095 ?auto_98092 ) ) ( not ( = ?auto_98095 ?auto_98091 ) ) ( not ( = ?auto_98095 ?auto_98090 ) ) ( not ( = ?auto_98095 ?auto_98089 ) ) ( not ( = ?auto_98092 ?auto_98091 ) ) ( not ( = ?auto_98092 ?auto_98090 ) ) ( not ( = ?auto_98092 ?auto_98089 ) ) ( not ( = ?auto_98088 ?auto_98094 ) ) ( not ( = ?auto_98088 ?auto_98095 ) ) ( not ( = ?auto_98088 ?auto_98092 ) ) ( ON ?auto_98088 ?auto_98093 ) ( not ( = ?auto_98088 ?auto_98093 ) ) ( not ( = ?auto_98089 ?auto_98093 ) ) ( not ( = ?auto_98090 ?auto_98093 ) ) ( not ( = ?auto_98091 ?auto_98093 ) ) ( not ( = ?auto_98094 ?auto_98093 ) ) ( not ( = ?auto_98095 ?auto_98093 ) ) ( not ( = ?auto_98092 ?auto_98093 ) ) ( ON ?auto_98089 ?auto_98088 ) ( ON-TABLE ?auto_98093 ) ( ON ?auto_98090 ?auto_98089 ) ( CLEAR ?auto_98092 ) ( ON ?auto_98091 ?auto_98090 ) ( CLEAR ?auto_98091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98093 ?auto_98088 ?auto_98089 ?auto_98090 )
      ( MAKE-3PILE ?auto_98088 ?auto_98089 ?auto_98090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98096 - BLOCK
      ?auto_98097 - BLOCK
      ?auto_98098 - BLOCK
    )
    :vars
    (
      ?auto_98100 - BLOCK
      ?auto_98102 - BLOCK
      ?auto_98099 - BLOCK
      ?auto_98101 - BLOCK
      ?auto_98103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98096 ?auto_98097 ) ) ( not ( = ?auto_98096 ?auto_98098 ) ) ( not ( = ?auto_98097 ?auto_98098 ) ) ( not ( = ?auto_98096 ?auto_98100 ) ) ( not ( = ?auto_98097 ?auto_98100 ) ) ( not ( = ?auto_98098 ?auto_98100 ) ) ( ON-TABLE ?auto_98102 ) ( ON ?auto_98099 ?auto_98102 ) ( not ( = ?auto_98102 ?auto_98099 ) ) ( not ( = ?auto_98102 ?auto_98101 ) ) ( not ( = ?auto_98102 ?auto_98100 ) ) ( not ( = ?auto_98102 ?auto_98098 ) ) ( not ( = ?auto_98102 ?auto_98097 ) ) ( not ( = ?auto_98099 ?auto_98101 ) ) ( not ( = ?auto_98099 ?auto_98100 ) ) ( not ( = ?auto_98099 ?auto_98098 ) ) ( not ( = ?auto_98099 ?auto_98097 ) ) ( not ( = ?auto_98101 ?auto_98100 ) ) ( not ( = ?auto_98101 ?auto_98098 ) ) ( not ( = ?auto_98101 ?auto_98097 ) ) ( not ( = ?auto_98096 ?auto_98102 ) ) ( not ( = ?auto_98096 ?auto_98099 ) ) ( not ( = ?auto_98096 ?auto_98101 ) ) ( ON ?auto_98096 ?auto_98103 ) ( not ( = ?auto_98096 ?auto_98103 ) ) ( not ( = ?auto_98097 ?auto_98103 ) ) ( not ( = ?auto_98098 ?auto_98103 ) ) ( not ( = ?auto_98100 ?auto_98103 ) ) ( not ( = ?auto_98102 ?auto_98103 ) ) ( not ( = ?auto_98099 ?auto_98103 ) ) ( not ( = ?auto_98101 ?auto_98103 ) ) ( ON ?auto_98097 ?auto_98096 ) ( ON-TABLE ?auto_98103 ) ( ON ?auto_98098 ?auto_98097 ) ( ON ?auto_98100 ?auto_98098 ) ( CLEAR ?auto_98100 ) ( HOLDING ?auto_98101 ) ( CLEAR ?auto_98099 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98102 ?auto_98099 ?auto_98101 )
      ( MAKE-3PILE ?auto_98096 ?auto_98097 ?auto_98098 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98104 - BLOCK
      ?auto_98105 - BLOCK
      ?auto_98106 - BLOCK
    )
    :vars
    (
      ?auto_98109 - BLOCK
      ?auto_98107 - BLOCK
      ?auto_98111 - BLOCK
      ?auto_98110 - BLOCK
      ?auto_98108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98104 ?auto_98105 ) ) ( not ( = ?auto_98104 ?auto_98106 ) ) ( not ( = ?auto_98105 ?auto_98106 ) ) ( not ( = ?auto_98104 ?auto_98109 ) ) ( not ( = ?auto_98105 ?auto_98109 ) ) ( not ( = ?auto_98106 ?auto_98109 ) ) ( ON-TABLE ?auto_98107 ) ( ON ?auto_98111 ?auto_98107 ) ( not ( = ?auto_98107 ?auto_98111 ) ) ( not ( = ?auto_98107 ?auto_98110 ) ) ( not ( = ?auto_98107 ?auto_98109 ) ) ( not ( = ?auto_98107 ?auto_98106 ) ) ( not ( = ?auto_98107 ?auto_98105 ) ) ( not ( = ?auto_98111 ?auto_98110 ) ) ( not ( = ?auto_98111 ?auto_98109 ) ) ( not ( = ?auto_98111 ?auto_98106 ) ) ( not ( = ?auto_98111 ?auto_98105 ) ) ( not ( = ?auto_98110 ?auto_98109 ) ) ( not ( = ?auto_98110 ?auto_98106 ) ) ( not ( = ?auto_98110 ?auto_98105 ) ) ( not ( = ?auto_98104 ?auto_98107 ) ) ( not ( = ?auto_98104 ?auto_98111 ) ) ( not ( = ?auto_98104 ?auto_98110 ) ) ( ON ?auto_98104 ?auto_98108 ) ( not ( = ?auto_98104 ?auto_98108 ) ) ( not ( = ?auto_98105 ?auto_98108 ) ) ( not ( = ?auto_98106 ?auto_98108 ) ) ( not ( = ?auto_98109 ?auto_98108 ) ) ( not ( = ?auto_98107 ?auto_98108 ) ) ( not ( = ?auto_98111 ?auto_98108 ) ) ( not ( = ?auto_98110 ?auto_98108 ) ) ( ON ?auto_98105 ?auto_98104 ) ( ON-TABLE ?auto_98108 ) ( ON ?auto_98106 ?auto_98105 ) ( ON ?auto_98109 ?auto_98106 ) ( CLEAR ?auto_98111 ) ( ON ?auto_98110 ?auto_98109 ) ( CLEAR ?auto_98110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98108 ?auto_98104 ?auto_98105 ?auto_98106 ?auto_98109 )
      ( MAKE-3PILE ?auto_98104 ?auto_98105 ?auto_98106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98112 - BLOCK
      ?auto_98113 - BLOCK
      ?auto_98114 - BLOCK
    )
    :vars
    (
      ?auto_98115 - BLOCK
      ?auto_98117 - BLOCK
      ?auto_98118 - BLOCK
      ?auto_98119 - BLOCK
      ?auto_98116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98112 ?auto_98113 ) ) ( not ( = ?auto_98112 ?auto_98114 ) ) ( not ( = ?auto_98113 ?auto_98114 ) ) ( not ( = ?auto_98112 ?auto_98115 ) ) ( not ( = ?auto_98113 ?auto_98115 ) ) ( not ( = ?auto_98114 ?auto_98115 ) ) ( ON-TABLE ?auto_98117 ) ( not ( = ?auto_98117 ?auto_98118 ) ) ( not ( = ?auto_98117 ?auto_98119 ) ) ( not ( = ?auto_98117 ?auto_98115 ) ) ( not ( = ?auto_98117 ?auto_98114 ) ) ( not ( = ?auto_98117 ?auto_98113 ) ) ( not ( = ?auto_98118 ?auto_98119 ) ) ( not ( = ?auto_98118 ?auto_98115 ) ) ( not ( = ?auto_98118 ?auto_98114 ) ) ( not ( = ?auto_98118 ?auto_98113 ) ) ( not ( = ?auto_98119 ?auto_98115 ) ) ( not ( = ?auto_98119 ?auto_98114 ) ) ( not ( = ?auto_98119 ?auto_98113 ) ) ( not ( = ?auto_98112 ?auto_98117 ) ) ( not ( = ?auto_98112 ?auto_98118 ) ) ( not ( = ?auto_98112 ?auto_98119 ) ) ( ON ?auto_98112 ?auto_98116 ) ( not ( = ?auto_98112 ?auto_98116 ) ) ( not ( = ?auto_98113 ?auto_98116 ) ) ( not ( = ?auto_98114 ?auto_98116 ) ) ( not ( = ?auto_98115 ?auto_98116 ) ) ( not ( = ?auto_98117 ?auto_98116 ) ) ( not ( = ?auto_98118 ?auto_98116 ) ) ( not ( = ?auto_98119 ?auto_98116 ) ) ( ON ?auto_98113 ?auto_98112 ) ( ON-TABLE ?auto_98116 ) ( ON ?auto_98114 ?auto_98113 ) ( ON ?auto_98115 ?auto_98114 ) ( ON ?auto_98119 ?auto_98115 ) ( CLEAR ?auto_98119 ) ( HOLDING ?auto_98118 ) ( CLEAR ?auto_98117 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98117 ?auto_98118 )
      ( MAKE-3PILE ?auto_98112 ?auto_98113 ?auto_98114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98120 - BLOCK
      ?auto_98121 - BLOCK
      ?auto_98122 - BLOCK
    )
    :vars
    (
      ?auto_98123 - BLOCK
      ?auto_98126 - BLOCK
      ?auto_98127 - BLOCK
      ?auto_98124 - BLOCK
      ?auto_98125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98120 ?auto_98121 ) ) ( not ( = ?auto_98120 ?auto_98122 ) ) ( not ( = ?auto_98121 ?auto_98122 ) ) ( not ( = ?auto_98120 ?auto_98123 ) ) ( not ( = ?auto_98121 ?auto_98123 ) ) ( not ( = ?auto_98122 ?auto_98123 ) ) ( ON-TABLE ?auto_98126 ) ( not ( = ?auto_98126 ?auto_98127 ) ) ( not ( = ?auto_98126 ?auto_98124 ) ) ( not ( = ?auto_98126 ?auto_98123 ) ) ( not ( = ?auto_98126 ?auto_98122 ) ) ( not ( = ?auto_98126 ?auto_98121 ) ) ( not ( = ?auto_98127 ?auto_98124 ) ) ( not ( = ?auto_98127 ?auto_98123 ) ) ( not ( = ?auto_98127 ?auto_98122 ) ) ( not ( = ?auto_98127 ?auto_98121 ) ) ( not ( = ?auto_98124 ?auto_98123 ) ) ( not ( = ?auto_98124 ?auto_98122 ) ) ( not ( = ?auto_98124 ?auto_98121 ) ) ( not ( = ?auto_98120 ?auto_98126 ) ) ( not ( = ?auto_98120 ?auto_98127 ) ) ( not ( = ?auto_98120 ?auto_98124 ) ) ( ON ?auto_98120 ?auto_98125 ) ( not ( = ?auto_98120 ?auto_98125 ) ) ( not ( = ?auto_98121 ?auto_98125 ) ) ( not ( = ?auto_98122 ?auto_98125 ) ) ( not ( = ?auto_98123 ?auto_98125 ) ) ( not ( = ?auto_98126 ?auto_98125 ) ) ( not ( = ?auto_98127 ?auto_98125 ) ) ( not ( = ?auto_98124 ?auto_98125 ) ) ( ON ?auto_98121 ?auto_98120 ) ( ON-TABLE ?auto_98125 ) ( ON ?auto_98122 ?auto_98121 ) ( ON ?auto_98123 ?auto_98122 ) ( ON ?auto_98124 ?auto_98123 ) ( CLEAR ?auto_98126 ) ( ON ?auto_98127 ?auto_98124 ) ( CLEAR ?auto_98127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98125 ?auto_98120 ?auto_98121 ?auto_98122 ?auto_98123 ?auto_98124 )
      ( MAKE-3PILE ?auto_98120 ?auto_98121 ?auto_98122 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98128 - BLOCK
      ?auto_98129 - BLOCK
      ?auto_98130 - BLOCK
    )
    :vars
    (
      ?auto_98133 - BLOCK
      ?auto_98135 - BLOCK
      ?auto_98134 - BLOCK
      ?auto_98131 - BLOCK
      ?auto_98132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98128 ?auto_98129 ) ) ( not ( = ?auto_98128 ?auto_98130 ) ) ( not ( = ?auto_98129 ?auto_98130 ) ) ( not ( = ?auto_98128 ?auto_98133 ) ) ( not ( = ?auto_98129 ?auto_98133 ) ) ( not ( = ?auto_98130 ?auto_98133 ) ) ( not ( = ?auto_98135 ?auto_98134 ) ) ( not ( = ?auto_98135 ?auto_98131 ) ) ( not ( = ?auto_98135 ?auto_98133 ) ) ( not ( = ?auto_98135 ?auto_98130 ) ) ( not ( = ?auto_98135 ?auto_98129 ) ) ( not ( = ?auto_98134 ?auto_98131 ) ) ( not ( = ?auto_98134 ?auto_98133 ) ) ( not ( = ?auto_98134 ?auto_98130 ) ) ( not ( = ?auto_98134 ?auto_98129 ) ) ( not ( = ?auto_98131 ?auto_98133 ) ) ( not ( = ?auto_98131 ?auto_98130 ) ) ( not ( = ?auto_98131 ?auto_98129 ) ) ( not ( = ?auto_98128 ?auto_98135 ) ) ( not ( = ?auto_98128 ?auto_98134 ) ) ( not ( = ?auto_98128 ?auto_98131 ) ) ( ON ?auto_98128 ?auto_98132 ) ( not ( = ?auto_98128 ?auto_98132 ) ) ( not ( = ?auto_98129 ?auto_98132 ) ) ( not ( = ?auto_98130 ?auto_98132 ) ) ( not ( = ?auto_98133 ?auto_98132 ) ) ( not ( = ?auto_98135 ?auto_98132 ) ) ( not ( = ?auto_98134 ?auto_98132 ) ) ( not ( = ?auto_98131 ?auto_98132 ) ) ( ON ?auto_98129 ?auto_98128 ) ( ON-TABLE ?auto_98132 ) ( ON ?auto_98130 ?auto_98129 ) ( ON ?auto_98133 ?auto_98130 ) ( ON ?auto_98131 ?auto_98133 ) ( ON ?auto_98134 ?auto_98131 ) ( CLEAR ?auto_98134 ) ( HOLDING ?auto_98135 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98135 )
      ( MAKE-3PILE ?auto_98128 ?auto_98129 ?auto_98130 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98136 - BLOCK
      ?auto_98137 - BLOCK
      ?auto_98138 - BLOCK
    )
    :vars
    (
      ?auto_98141 - BLOCK
      ?auto_98142 - BLOCK
      ?auto_98140 - BLOCK
      ?auto_98139 - BLOCK
      ?auto_98143 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98136 ?auto_98137 ) ) ( not ( = ?auto_98136 ?auto_98138 ) ) ( not ( = ?auto_98137 ?auto_98138 ) ) ( not ( = ?auto_98136 ?auto_98141 ) ) ( not ( = ?auto_98137 ?auto_98141 ) ) ( not ( = ?auto_98138 ?auto_98141 ) ) ( not ( = ?auto_98142 ?auto_98140 ) ) ( not ( = ?auto_98142 ?auto_98139 ) ) ( not ( = ?auto_98142 ?auto_98141 ) ) ( not ( = ?auto_98142 ?auto_98138 ) ) ( not ( = ?auto_98142 ?auto_98137 ) ) ( not ( = ?auto_98140 ?auto_98139 ) ) ( not ( = ?auto_98140 ?auto_98141 ) ) ( not ( = ?auto_98140 ?auto_98138 ) ) ( not ( = ?auto_98140 ?auto_98137 ) ) ( not ( = ?auto_98139 ?auto_98141 ) ) ( not ( = ?auto_98139 ?auto_98138 ) ) ( not ( = ?auto_98139 ?auto_98137 ) ) ( not ( = ?auto_98136 ?auto_98142 ) ) ( not ( = ?auto_98136 ?auto_98140 ) ) ( not ( = ?auto_98136 ?auto_98139 ) ) ( ON ?auto_98136 ?auto_98143 ) ( not ( = ?auto_98136 ?auto_98143 ) ) ( not ( = ?auto_98137 ?auto_98143 ) ) ( not ( = ?auto_98138 ?auto_98143 ) ) ( not ( = ?auto_98141 ?auto_98143 ) ) ( not ( = ?auto_98142 ?auto_98143 ) ) ( not ( = ?auto_98140 ?auto_98143 ) ) ( not ( = ?auto_98139 ?auto_98143 ) ) ( ON ?auto_98137 ?auto_98136 ) ( ON-TABLE ?auto_98143 ) ( ON ?auto_98138 ?auto_98137 ) ( ON ?auto_98141 ?auto_98138 ) ( ON ?auto_98139 ?auto_98141 ) ( ON ?auto_98140 ?auto_98139 ) ( ON ?auto_98142 ?auto_98140 ) ( CLEAR ?auto_98142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98143 ?auto_98136 ?auto_98137 ?auto_98138 ?auto_98141 ?auto_98139 ?auto_98140 )
      ( MAKE-3PILE ?auto_98136 ?auto_98137 ?auto_98138 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98163 - BLOCK
      ?auto_98164 - BLOCK
      ?auto_98165 - BLOCK
    )
    :vars
    (
      ?auto_98168 - BLOCK
      ?auto_98166 - BLOCK
      ?auto_98167 - BLOCK
      ?auto_98169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98168 ?auto_98165 ) ( ON-TABLE ?auto_98163 ) ( ON ?auto_98164 ?auto_98163 ) ( ON ?auto_98165 ?auto_98164 ) ( not ( = ?auto_98163 ?auto_98164 ) ) ( not ( = ?auto_98163 ?auto_98165 ) ) ( not ( = ?auto_98163 ?auto_98168 ) ) ( not ( = ?auto_98164 ?auto_98165 ) ) ( not ( = ?auto_98164 ?auto_98168 ) ) ( not ( = ?auto_98165 ?auto_98168 ) ) ( not ( = ?auto_98163 ?auto_98166 ) ) ( not ( = ?auto_98163 ?auto_98167 ) ) ( not ( = ?auto_98164 ?auto_98166 ) ) ( not ( = ?auto_98164 ?auto_98167 ) ) ( not ( = ?auto_98165 ?auto_98166 ) ) ( not ( = ?auto_98165 ?auto_98167 ) ) ( not ( = ?auto_98168 ?auto_98166 ) ) ( not ( = ?auto_98168 ?auto_98167 ) ) ( not ( = ?auto_98166 ?auto_98167 ) ) ( ON ?auto_98166 ?auto_98168 ) ( CLEAR ?auto_98166 ) ( HOLDING ?auto_98167 ) ( CLEAR ?auto_98169 ) ( ON-TABLE ?auto_98169 ) ( not ( = ?auto_98169 ?auto_98167 ) ) ( not ( = ?auto_98163 ?auto_98169 ) ) ( not ( = ?auto_98164 ?auto_98169 ) ) ( not ( = ?auto_98165 ?auto_98169 ) ) ( not ( = ?auto_98168 ?auto_98169 ) ) ( not ( = ?auto_98166 ?auto_98169 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98169 ?auto_98167 )
      ( MAKE-3PILE ?auto_98163 ?auto_98164 ?auto_98165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98170 - BLOCK
      ?auto_98171 - BLOCK
      ?auto_98172 - BLOCK
    )
    :vars
    (
      ?auto_98175 - BLOCK
      ?auto_98176 - BLOCK
      ?auto_98173 - BLOCK
      ?auto_98174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98175 ?auto_98172 ) ( ON-TABLE ?auto_98170 ) ( ON ?auto_98171 ?auto_98170 ) ( ON ?auto_98172 ?auto_98171 ) ( not ( = ?auto_98170 ?auto_98171 ) ) ( not ( = ?auto_98170 ?auto_98172 ) ) ( not ( = ?auto_98170 ?auto_98175 ) ) ( not ( = ?auto_98171 ?auto_98172 ) ) ( not ( = ?auto_98171 ?auto_98175 ) ) ( not ( = ?auto_98172 ?auto_98175 ) ) ( not ( = ?auto_98170 ?auto_98176 ) ) ( not ( = ?auto_98170 ?auto_98173 ) ) ( not ( = ?auto_98171 ?auto_98176 ) ) ( not ( = ?auto_98171 ?auto_98173 ) ) ( not ( = ?auto_98172 ?auto_98176 ) ) ( not ( = ?auto_98172 ?auto_98173 ) ) ( not ( = ?auto_98175 ?auto_98176 ) ) ( not ( = ?auto_98175 ?auto_98173 ) ) ( not ( = ?auto_98176 ?auto_98173 ) ) ( ON ?auto_98176 ?auto_98175 ) ( CLEAR ?auto_98174 ) ( ON-TABLE ?auto_98174 ) ( not ( = ?auto_98174 ?auto_98173 ) ) ( not ( = ?auto_98170 ?auto_98174 ) ) ( not ( = ?auto_98171 ?auto_98174 ) ) ( not ( = ?auto_98172 ?auto_98174 ) ) ( not ( = ?auto_98175 ?auto_98174 ) ) ( not ( = ?auto_98176 ?auto_98174 ) ) ( ON ?auto_98173 ?auto_98176 ) ( CLEAR ?auto_98173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98170 ?auto_98171 ?auto_98172 ?auto_98175 ?auto_98176 )
      ( MAKE-3PILE ?auto_98170 ?auto_98171 ?auto_98172 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98177 - BLOCK
      ?auto_98178 - BLOCK
      ?auto_98179 - BLOCK
    )
    :vars
    (
      ?auto_98180 - BLOCK
      ?auto_98183 - BLOCK
      ?auto_98181 - BLOCK
      ?auto_98182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98180 ?auto_98179 ) ( ON-TABLE ?auto_98177 ) ( ON ?auto_98178 ?auto_98177 ) ( ON ?auto_98179 ?auto_98178 ) ( not ( = ?auto_98177 ?auto_98178 ) ) ( not ( = ?auto_98177 ?auto_98179 ) ) ( not ( = ?auto_98177 ?auto_98180 ) ) ( not ( = ?auto_98178 ?auto_98179 ) ) ( not ( = ?auto_98178 ?auto_98180 ) ) ( not ( = ?auto_98179 ?auto_98180 ) ) ( not ( = ?auto_98177 ?auto_98183 ) ) ( not ( = ?auto_98177 ?auto_98181 ) ) ( not ( = ?auto_98178 ?auto_98183 ) ) ( not ( = ?auto_98178 ?auto_98181 ) ) ( not ( = ?auto_98179 ?auto_98183 ) ) ( not ( = ?auto_98179 ?auto_98181 ) ) ( not ( = ?auto_98180 ?auto_98183 ) ) ( not ( = ?auto_98180 ?auto_98181 ) ) ( not ( = ?auto_98183 ?auto_98181 ) ) ( ON ?auto_98183 ?auto_98180 ) ( not ( = ?auto_98182 ?auto_98181 ) ) ( not ( = ?auto_98177 ?auto_98182 ) ) ( not ( = ?auto_98178 ?auto_98182 ) ) ( not ( = ?auto_98179 ?auto_98182 ) ) ( not ( = ?auto_98180 ?auto_98182 ) ) ( not ( = ?auto_98183 ?auto_98182 ) ) ( ON ?auto_98181 ?auto_98183 ) ( CLEAR ?auto_98181 ) ( HOLDING ?auto_98182 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98182 )
      ( MAKE-3PILE ?auto_98177 ?auto_98178 ?auto_98179 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98194 - BLOCK
      ?auto_98195 - BLOCK
      ?auto_98196 - BLOCK
    )
    :vars
    (
      ?auto_98199 - BLOCK
      ?auto_98200 - BLOCK
      ?auto_98198 - BLOCK
      ?auto_98197 - BLOCK
      ?auto_98201 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98199 ?auto_98196 ) ( ON-TABLE ?auto_98194 ) ( ON ?auto_98195 ?auto_98194 ) ( ON ?auto_98196 ?auto_98195 ) ( not ( = ?auto_98194 ?auto_98195 ) ) ( not ( = ?auto_98194 ?auto_98196 ) ) ( not ( = ?auto_98194 ?auto_98199 ) ) ( not ( = ?auto_98195 ?auto_98196 ) ) ( not ( = ?auto_98195 ?auto_98199 ) ) ( not ( = ?auto_98196 ?auto_98199 ) ) ( not ( = ?auto_98194 ?auto_98200 ) ) ( not ( = ?auto_98194 ?auto_98198 ) ) ( not ( = ?auto_98195 ?auto_98200 ) ) ( not ( = ?auto_98195 ?auto_98198 ) ) ( not ( = ?auto_98196 ?auto_98200 ) ) ( not ( = ?auto_98196 ?auto_98198 ) ) ( not ( = ?auto_98199 ?auto_98200 ) ) ( not ( = ?auto_98199 ?auto_98198 ) ) ( not ( = ?auto_98200 ?auto_98198 ) ) ( ON ?auto_98200 ?auto_98199 ) ( not ( = ?auto_98197 ?auto_98198 ) ) ( not ( = ?auto_98194 ?auto_98197 ) ) ( not ( = ?auto_98195 ?auto_98197 ) ) ( not ( = ?auto_98196 ?auto_98197 ) ) ( not ( = ?auto_98199 ?auto_98197 ) ) ( not ( = ?auto_98200 ?auto_98197 ) ) ( ON ?auto_98198 ?auto_98200 ) ( CLEAR ?auto_98198 ) ( ON ?auto_98197 ?auto_98201 ) ( CLEAR ?auto_98197 ) ( HAND-EMPTY ) ( not ( = ?auto_98194 ?auto_98201 ) ) ( not ( = ?auto_98195 ?auto_98201 ) ) ( not ( = ?auto_98196 ?auto_98201 ) ) ( not ( = ?auto_98199 ?auto_98201 ) ) ( not ( = ?auto_98200 ?auto_98201 ) ) ( not ( = ?auto_98198 ?auto_98201 ) ) ( not ( = ?auto_98197 ?auto_98201 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98197 ?auto_98201 )
      ( MAKE-3PILE ?auto_98194 ?auto_98195 ?auto_98196 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_98202 - BLOCK
      ?auto_98203 - BLOCK
      ?auto_98204 - BLOCK
    )
    :vars
    (
      ?auto_98207 - BLOCK
      ?auto_98208 - BLOCK
      ?auto_98206 - BLOCK
      ?auto_98205 - BLOCK
      ?auto_98209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98207 ?auto_98204 ) ( ON-TABLE ?auto_98202 ) ( ON ?auto_98203 ?auto_98202 ) ( ON ?auto_98204 ?auto_98203 ) ( not ( = ?auto_98202 ?auto_98203 ) ) ( not ( = ?auto_98202 ?auto_98204 ) ) ( not ( = ?auto_98202 ?auto_98207 ) ) ( not ( = ?auto_98203 ?auto_98204 ) ) ( not ( = ?auto_98203 ?auto_98207 ) ) ( not ( = ?auto_98204 ?auto_98207 ) ) ( not ( = ?auto_98202 ?auto_98208 ) ) ( not ( = ?auto_98202 ?auto_98206 ) ) ( not ( = ?auto_98203 ?auto_98208 ) ) ( not ( = ?auto_98203 ?auto_98206 ) ) ( not ( = ?auto_98204 ?auto_98208 ) ) ( not ( = ?auto_98204 ?auto_98206 ) ) ( not ( = ?auto_98207 ?auto_98208 ) ) ( not ( = ?auto_98207 ?auto_98206 ) ) ( not ( = ?auto_98208 ?auto_98206 ) ) ( ON ?auto_98208 ?auto_98207 ) ( not ( = ?auto_98205 ?auto_98206 ) ) ( not ( = ?auto_98202 ?auto_98205 ) ) ( not ( = ?auto_98203 ?auto_98205 ) ) ( not ( = ?auto_98204 ?auto_98205 ) ) ( not ( = ?auto_98207 ?auto_98205 ) ) ( not ( = ?auto_98208 ?auto_98205 ) ) ( ON ?auto_98205 ?auto_98209 ) ( CLEAR ?auto_98205 ) ( not ( = ?auto_98202 ?auto_98209 ) ) ( not ( = ?auto_98203 ?auto_98209 ) ) ( not ( = ?auto_98204 ?auto_98209 ) ) ( not ( = ?auto_98207 ?auto_98209 ) ) ( not ( = ?auto_98208 ?auto_98209 ) ) ( not ( = ?auto_98206 ?auto_98209 ) ) ( not ( = ?auto_98205 ?auto_98209 ) ) ( HOLDING ?auto_98206 ) ( CLEAR ?auto_98208 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98202 ?auto_98203 ?auto_98204 ?auto_98207 ?auto_98208 ?auto_98206 )
      ( MAKE-3PILE ?auto_98202 ?auto_98203 ?auto_98204 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98264 - BLOCK
      ?auto_98265 - BLOCK
      ?auto_98266 - BLOCK
      ?auto_98267 - BLOCK
    )
    :vars
    (
      ?auto_98268 - BLOCK
      ?auto_98270 - BLOCK
      ?auto_98269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98264 ) ( ON ?auto_98265 ?auto_98264 ) ( not ( = ?auto_98264 ?auto_98265 ) ) ( not ( = ?auto_98264 ?auto_98266 ) ) ( not ( = ?auto_98264 ?auto_98267 ) ) ( not ( = ?auto_98265 ?auto_98266 ) ) ( not ( = ?auto_98265 ?auto_98267 ) ) ( not ( = ?auto_98266 ?auto_98267 ) ) ( ON ?auto_98267 ?auto_98268 ) ( not ( = ?auto_98264 ?auto_98268 ) ) ( not ( = ?auto_98265 ?auto_98268 ) ) ( not ( = ?auto_98266 ?auto_98268 ) ) ( not ( = ?auto_98267 ?auto_98268 ) ) ( CLEAR ?auto_98265 ) ( ON ?auto_98266 ?auto_98267 ) ( CLEAR ?auto_98266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98270 ) ( ON ?auto_98269 ?auto_98270 ) ( ON ?auto_98268 ?auto_98269 ) ( not ( = ?auto_98270 ?auto_98269 ) ) ( not ( = ?auto_98270 ?auto_98268 ) ) ( not ( = ?auto_98270 ?auto_98267 ) ) ( not ( = ?auto_98270 ?auto_98266 ) ) ( not ( = ?auto_98269 ?auto_98268 ) ) ( not ( = ?auto_98269 ?auto_98267 ) ) ( not ( = ?auto_98269 ?auto_98266 ) ) ( not ( = ?auto_98264 ?auto_98270 ) ) ( not ( = ?auto_98264 ?auto_98269 ) ) ( not ( = ?auto_98265 ?auto_98270 ) ) ( not ( = ?auto_98265 ?auto_98269 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98270 ?auto_98269 ?auto_98268 ?auto_98267 )
      ( MAKE-4PILE ?auto_98264 ?auto_98265 ?auto_98266 ?auto_98267 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98271 - BLOCK
      ?auto_98272 - BLOCK
      ?auto_98273 - BLOCK
      ?auto_98274 - BLOCK
    )
    :vars
    (
      ?auto_98277 - BLOCK
      ?auto_98275 - BLOCK
      ?auto_98276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98271 ) ( not ( = ?auto_98271 ?auto_98272 ) ) ( not ( = ?auto_98271 ?auto_98273 ) ) ( not ( = ?auto_98271 ?auto_98274 ) ) ( not ( = ?auto_98272 ?auto_98273 ) ) ( not ( = ?auto_98272 ?auto_98274 ) ) ( not ( = ?auto_98273 ?auto_98274 ) ) ( ON ?auto_98274 ?auto_98277 ) ( not ( = ?auto_98271 ?auto_98277 ) ) ( not ( = ?auto_98272 ?auto_98277 ) ) ( not ( = ?auto_98273 ?auto_98277 ) ) ( not ( = ?auto_98274 ?auto_98277 ) ) ( ON ?auto_98273 ?auto_98274 ) ( CLEAR ?auto_98273 ) ( ON-TABLE ?auto_98275 ) ( ON ?auto_98276 ?auto_98275 ) ( ON ?auto_98277 ?auto_98276 ) ( not ( = ?auto_98275 ?auto_98276 ) ) ( not ( = ?auto_98275 ?auto_98277 ) ) ( not ( = ?auto_98275 ?auto_98274 ) ) ( not ( = ?auto_98275 ?auto_98273 ) ) ( not ( = ?auto_98276 ?auto_98277 ) ) ( not ( = ?auto_98276 ?auto_98274 ) ) ( not ( = ?auto_98276 ?auto_98273 ) ) ( not ( = ?auto_98271 ?auto_98275 ) ) ( not ( = ?auto_98271 ?auto_98276 ) ) ( not ( = ?auto_98272 ?auto_98275 ) ) ( not ( = ?auto_98272 ?auto_98276 ) ) ( HOLDING ?auto_98272 ) ( CLEAR ?auto_98271 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98271 ?auto_98272 )
      ( MAKE-4PILE ?auto_98271 ?auto_98272 ?auto_98273 ?auto_98274 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98278 - BLOCK
      ?auto_98279 - BLOCK
      ?auto_98280 - BLOCK
      ?auto_98281 - BLOCK
    )
    :vars
    (
      ?auto_98282 - BLOCK
      ?auto_98284 - BLOCK
      ?auto_98283 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98278 ) ( not ( = ?auto_98278 ?auto_98279 ) ) ( not ( = ?auto_98278 ?auto_98280 ) ) ( not ( = ?auto_98278 ?auto_98281 ) ) ( not ( = ?auto_98279 ?auto_98280 ) ) ( not ( = ?auto_98279 ?auto_98281 ) ) ( not ( = ?auto_98280 ?auto_98281 ) ) ( ON ?auto_98281 ?auto_98282 ) ( not ( = ?auto_98278 ?auto_98282 ) ) ( not ( = ?auto_98279 ?auto_98282 ) ) ( not ( = ?auto_98280 ?auto_98282 ) ) ( not ( = ?auto_98281 ?auto_98282 ) ) ( ON ?auto_98280 ?auto_98281 ) ( ON-TABLE ?auto_98284 ) ( ON ?auto_98283 ?auto_98284 ) ( ON ?auto_98282 ?auto_98283 ) ( not ( = ?auto_98284 ?auto_98283 ) ) ( not ( = ?auto_98284 ?auto_98282 ) ) ( not ( = ?auto_98284 ?auto_98281 ) ) ( not ( = ?auto_98284 ?auto_98280 ) ) ( not ( = ?auto_98283 ?auto_98282 ) ) ( not ( = ?auto_98283 ?auto_98281 ) ) ( not ( = ?auto_98283 ?auto_98280 ) ) ( not ( = ?auto_98278 ?auto_98284 ) ) ( not ( = ?auto_98278 ?auto_98283 ) ) ( not ( = ?auto_98279 ?auto_98284 ) ) ( not ( = ?auto_98279 ?auto_98283 ) ) ( CLEAR ?auto_98278 ) ( ON ?auto_98279 ?auto_98280 ) ( CLEAR ?auto_98279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98284 ?auto_98283 ?auto_98282 ?auto_98281 ?auto_98280 )
      ( MAKE-4PILE ?auto_98278 ?auto_98279 ?auto_98280 ?auto_98281 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98285 - BLOCK
      ?auto_98286 - BLOCK
      ?auto_98287 - BLOCK
      ?auto_98288 - BLOCK
    )
    :vars
    (
      ?auto_98290 - BLOCK
      ?auto_98289 - BLOCK
      ?auto_98291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98285 ?auto_98286 ) ) ( not ( = ?auto_98285 ?auto_98287 ) ) ( not ( = ?auto_98285 ?auto_98288 ) ) ( not ( = ?auto_98286 ?auto_98287 ) ) ( not ( = ?auto_98286 ?auto_98288 ) ) ( not ( = ?auto_98287 ?auto_98288 ) ) ( ON ?auto_98288 ?auto_98290 ) ( not ( = ?auto_98285 ?auto_98290 ) ) ( not ( = ?auto_98286 ?auto_98290 ) ) ( not ( = ?auto_98287 ?auto_98290 ) ) ( not ( = ?auto_98288 ?auto_98290 ) ) ( ON ?auto_98287 ?auto_98288 ) ( ON-TABLE ?auto_98289 ) ( ON ?auto_98291 ?auto_98289 ) ( ON ?auto_98290 ?auto_98291 ) ( not ( = ?auto_98289 ?auto_98291 ) ) ( not ( = ?auto_98289 ?auto_98290 ) ) ( not ( = ?auto_98289 ?auto_98288 ) ) ( not ( = ?auto_98289 ?auto_98287 ) ) ( not ( = ?auto_98291 ?auto_98290 ) ) ( not ( = ?auto_98291 ?auto_98288 ) ) ( not ( = ?auto_98291 ?auto_98287 ) ) ( not ( = ?auto_98285 ?auto_98289 ) ) ( not ( = ?auto_98285 ?auto_98291 ) ) ( not ( = ?auto_98286 ?auto_98289 ) ) ( not ( = ?auto_98286 ?auto_98291 ) ) ( ON ?auto_98286 ?auto_98287 ) ( CLEAR ?auto_98286 ) ( HOLDING ?auto_98285 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98285 )
      ( MAKE-4PILE ?auto_98285 ?auto_98286 ?auto_98287 ?auto_98288 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98292 - BLOCK
      ?auto_98293 - BLOCK
      ?auto_98294 - BLOCK
      ?auto_98295 - BLOCK
    )
    :vars
    (
      ?auto_98297 - BLOCK
      ?auto_98296 - BLOCK
      ?auto_98298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98292 ?auto_98293 ) ) ( not ( = ?auto_98292 ?auto_98294 ) ) ( not ( = ?auto_98292 ?auto_98295 ) ) ( not ( = ?auto_98293 ?auto_98294 ) ) ( not ( = ?auto_98293 ?auto_98295 ) ) ( not ( = ?auto_98294 ?auto_98295 ) ) ( ON ?auto_98295 ?auto_98297 ) ( not ( = ?auto_98292 ?auto_98297 ) ) ( not ( = ?auto_98293 ?auto_98297 ) ) ( not ( = ?auto_98294 ?auto_98297 ) ) ( not ( = ?auto_98295 ?auto_98297 ) ) ( ON ?auto_98294 ?auto_98295 ) ( ON-TABLE ?auto_98296 ) ( ON ?auto_98298 ?auto_98296 ) ( ON ?auto_98297 ?auto_98298 ) ( not ( = ?auto_98296 ?auto_98298 ) ) ( not ( = ?auto_98296 ?auto_98297 ) ) ( not ( = ?auto_98296 ?auto_98295 ) ) ( not ( = ?auto_98296 ?auto_98294 ) ) ( not ( = ?auto_98298 ?auto_98297 ) ) ( not ( = ?auto_98298 ?auto_98295 ) ) ( not ( = ?auto_98298 ?auto_98294 ) ) ( not ( = ?auto_98292 ?auto_98296 ) ) ( not ( = ?auto_98292 ?auto_98298 ) ) ( not ( = ?auto_98293 ?auto_98296 ) ) ( not ( = ?auto_98293 ?auto_98298 ) ) ( ON ?auto_98293 ?auto_98294 ) ( ON ?auto_98292 ?auto_98293 ) ( CLEAR ?auto_98292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98296 ?auto_98298 ?auto_98297 ?auto_98295 ?auto_98294 ?auto_98293 )
      ( MAKE-4PILE ?auto_98292 ?auto_98293 ?auto_98294 ?auto_98295 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98303 - BLOCK
      ?auto_98304 - BLOCK
      ?auto_98305 - BLOCK
      ?auto_98306 - BLOCK
    )
    :vars
    (
      ?auto_98309 - BLOCK
      ?auto_98308 - BLOCK
      ?auto_98307 - BLOCK
      ?auto_98310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98303 ?auto_98304 ) ) ( not ( = ?auto_98303 ?auto_98305 ) ) ( not ( = ?auto_98303 ?auto_98306 ) ) ( not ( = ?auto_98304 ?auto_98305 ) ) ( not ( = ?auto_98304 ?auto_98306 ) ) ( not ( = ?auto_98305 ?auto_98306 ) ) ( ON ?auto_98306 ?auto_98309 ) ( not ( = ?auto_98303 ?auto_98309 ) ) ( not ( = ?auto_98304 ?auto_98309 ) ) ( not ( = ?auto_98305 ?auto_98309 ) ) ( not ( = ?auto_98306 ?auto_98309 ) ) ( ON ?auto_98305 ?auto_98306 ) ( ON-TABLE ?auto_98308 ) ( ON ?auto_98307 ?auto_98308 ) ( ON ?auto_98309 ?auto_98307 ) ( not ( = ?auto_98308 ?auto_98307 ) ) ( not ( = ?auto_98308 ?auto_98309 ) ) ( not ( = ?auto_98308 ?auto_98306 ) ) ( not ( = ?auto_98308 ?auto_98305 ) ) ( not ( = ?auto_98307 ?auto_98309 ) ) ( not ( = ?auto_98307 ?auto_98306 ) ) ( not ( = ?auto_98307 ?auto_98305 ) ) ( not ( = ?auto_98303 ?auto_98308 ) ) ( not ( = ?auto_98303 ?auto_98307 ) ) ( not ( = ?auto_98304 ?auto_98308 ) ) ( not ( = ?auto_98304 ?auto_98307 ) ) ( ON ?auto_98304 ?auto_98305 ) ( CLEAR ?auto_98304 ) ( ON ?auto_98303 ?auto_98310 ) ( CLEAR ?auto_98303 ) ( HAND-EMPTY ) ( not ( = ?auto_98303 ?auto_98310 ) ) ( not ( = ?auto_98304 ?auto_98310 ) ) ( not ( = ?auto_98305 ?auto_98310 ) ) ( not ( = ?auto_98306 ?auto_98310 ) ) ( not ( = ?auto_98309 ?auto_98310 ) ) ( not ( = ?auto_98308 ?auto_98310 ) ) ( not ( = ?auto_98307 ?auto_98310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98303 ?auto_98310 )
      ( MAKE-4PILE ?auto_98303 ?auto_98304 ?auto_98305 ?auto_98306 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98311 - BLOCK
      ?auto_98312 - BLOCK
      ?auto_98313 - BLOCK
      ?auto_98314 - BLOCK
    )
    :vars
    (
      ?auto_98317 - BLOCK
      ?auto_98318 - BLOCK
      ?auto_98316 - BLOCK
      ?auto_98315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98311 ?auto_98312 ) ) ( not ( = ?auto_98311 ?auto_98313 ) ) ( not ( = ?auto_98311 ?auto_98314 ) ) ( not ( = ?auto_98312 ?auto_98313 ) ) ( not ( = ?auto_98312 ?auto_98314 ) ) ( not ( = ?auto_98313 ?auto_98314 ) ) ( ON ?auto_98314 ?auto_98317 ) ( not ( = ?auto_98311 ?auto_98317 ) ) ( not ( = ?auto_98312 ?auto_98317 ) ) ( not ( = ?auto_98313 ?auto_98317 ) ) ( not ( = ?auto_98314 ?auto_98317 ) ) ( ON ?auto_98313 ?auto_98314 ) ( ON-TABLE ?auto_98318 ) ( ON ?auto_98316 ?auto_98318 ) ( ON ?auto_98317 ?auto_98316 ) ( not ( = ?auto_98318 ?auto_98316 ) ) ( not ( = ?auto_98318 ?auto_98317 ) ) ( not ( = ?auto_98318 ?auto_98314 ) ) ( not ( = ?auto_98318 ?auto_98313 ) ) ( not ( = ?auto_98316 ?auto_98317 ) ) ( not ( = ?auto_98316 ?auto_98314 ) ) ( not ( = ?auto_98316 ?auto_98313 ) ) ( not ( = ?auto_98311 ?auto_98318 ) ) ( not ( = ?auto_98311 ?auto_98316 ) ) ( not ( = ?auto_98312 ?auto_98318 ) ) ( not ( = ?auto_98312 ?auto_98316 ) ) ( ON ?auto_98311 ?auto_98315 ) ( CLEAR ?auto_98311 ) ( not ( = ?auto_98311 ?auto_98315 ) ) ( not ( = ?auto_98312 ?auto_98315 ) ) ( not ( = ?auto_98313 ?auto_98315 ) ) ( not ( = ?auto_98314 ?auto_98315 ) ) ( not ( = ?auto_98317 ?auto_98315 ) ) ( not ( = ?auto_98318 ?auto_98315 ) ) ( not ( = ?auto_98316 ?auto_98315 ) ) ( HOLDING ?auto_98312 ) ( CLEAR ?auto_98313 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98318 ?auto_98316 ?auto_98317 ?auto_98314 ?auto_98313 ?auto_98312 )
      ( MAKE-4PILE ?auto_98311 ?auto_98312 ?auto_98313 ?auto_98314 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98319 - BLOCK
      ?auto_98320 - BLOCK
      ?auto_98321 - BLOCK
      ?auto_98322 - BLOCK
    )
    :vars
    (
      ?auto_98325 - BLOCK
      ?auto_98326 - BLOCK
      ?auto_98324 - BLOCK
      ?auto_98323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98319 ?auto_98320 ) ) ( not ( = ?auto_98319 ?auto_98321 ) ) ( not ( = ?auto_98319 ?auto_98322 ) ) ( not ( = ?auto_98320 ?auto_98321 ) ) ( not ( = ?auto_98320 ?auto_98322 ) ) ( not ( = ?auto_98321 ?auto_98322 ) ) ( ON ?auto_98322 ?auto_98325 ) ( not ( = ?auto_98319 ?auto_98325 ) ) ( not ( = ?auto_98320 ?auto_98325 ) ) ( not ( = ?auto_98321 ?auto_98325 ) ) ( not ( = ?auto_98322 ?auto_98325 ) ) ( ON ?auto_98321 ?auto_98322 ) ( ON-TABLE ?auto_98326 ) ( ON ?auto_98324 ?auto_98326 ) ( ON ?auto_98325 ?auto_98324 ) ( not ( = ?auto_98326 ?auto_98324 ) ) ( not ( = ?auto_98326 ?auto_98325 ) ) ( not ( = ?auto_98326 ?auto_98322 ) ) ( not ( = ?auto_98326 ?auto_98321 ) ) ( not ( = ?auto_98324 ?auto_98325 ) ) ( not ( = ?auto_98324 ?auto_98322 ) ) ( not ( = ?auto_98324 ?auto_98321 ) ) ( not ( = ?auto_98319 ?auto_98326 ) ) ( not ( = ?auto_98319 ?auto_98324 ) ) ( not ( = ?auto_98320 ?auto_98326 ) ) ( not ( = ?auto_98320 ?auto_98324 ) ) ( ON ?auto_98319 ?auto_98323 ) ( not ( = ?auto_98319 ?auto_98323 ) ) ( not ( = ?auto_98320 ?auto_98323 ) ) ( not ( = ?auto_98321 ?auto_98323 ) ) ( not ( = ?auto_98322 ?auto_98323 ) ) ( not ( = ?auto_98325 ?auto_98323 ) ) ( not ( = ?auto_98326 ?auto_98323 ) ) ( not ( = ?auto_98324 ?auto_98323 ) ) ( CLEAR ?auto_98321 ) ( ON ?auto_98320 ?auto_98319 ) ( CLEAR ?auto_98320 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98323 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98323 ?auto_98319 )
      ( MAKE-4PILE ?auto_98319 ?auto_98320 ?auto_98321 ?auto_98322 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98327 - BLOCK
      ?auto_98328 - BLOCK
      ?auto_98329 - BLOCK
      ?auto_98330 - BLOCK
    )
    :vars
    (
      ?auto_98332 - BLOCK
      ?auto_98333 - BLOCK
      ?auto_98334 - BLOCK
      ?auto_98331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98327 ?auto_98328 ) ) ( not ( = ?auto_98327 ?auto_98329 ) ) ( not ( = ?auto_98327 ?auto_98330 ) ) ( not ( = ?auto_98328 ?auto_98329 ) ) ( not ( = ?auto_98328 ?auto_98330 ) ) ( not ( = ?auto_98329 ?auto_98330 ) ) ( ON ?auto_98330 ?auto_98332 ) ( not ( = ?auto_98327 ?auto_98332 ) ) ( not ( = ?auto_98328 ?auto_98332 ) ) ( not ( = ?auto_98329 ?auto_98332 ) ) ( not ( = ?auto_98330 ?auto_98332 ) ) ( ON-TABLE ?auto_98333 ) ( ON ?auto_98334 ?auto_98333 ) ( ON ?auto_98332 ?auto_98334 ) ( not ( = ?auto_98333 ?auto_98334 ) ) ( not ( = ?auto_98333 ?auto_98332 ) ) ( not ( = ?auto_98333 ?auto_98330 ) ) ( not ( = ?auto_98333 ?auto_98329 ) ) ( not ( = ?auto_98334 ?auto_98332 ) ) ( not ( = ?auto_98334 ?auto_98330 ) ) ( not ( = ?auto_98334 ?auto_98329 ) ) ( not ( = ?auto_98327 ?auto_98333 ) ) ( not ( = ?auto_98327 ?auto_98334 ) ) ( not ( = ?auto_98328 ?auto_98333 ) ) ( not ( = ?auto_98328 ?auto_98334 ) ) ( ON ?auto_98327 ?auto_98331 ) ( not ( = ?auto_98327 ?auto_98331 ) ) ( not ( = ?auto_98328 ?auto_98331 ) ) ( not ( = ?auto_98329 ?auto_98331 ) ) ( not ( = ?auto_98330 ?auto_98331 ) ) ( not ( = ?auto_98332 ?auto_98331 ) ) ( not ( = ?auto_98333 ?auto_98331 ) ) ( not ( = ?auto_98334 ?auto_98331 ) ) ( ON ?auto_98328 ?auto_98327 ) ( CLEAR ?auto_98328 ) ( ON-TABLE ?auto_98331 ) ( HOLDING ?auto_98329 ) ( CLEAR ?auto_98330 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98333 ?auto_98334 ?auto_98332 ?auto_98330 ?auto_98329 )
      ( MAKE-4PILE ?auto_98327 ?auto_98328 ?auto_98329 ?auto_98330 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98335 - BLOCK
      ?auto_98336 - BLOCK
      ?auto_98337 - BLOCK
      ?auto_98338 - BLOCK
    )
    :vars
    (
      ?auto_98340 - BLOCK
      ?auto_98339 - BLOCK
      ?auto_98341 - BLOCK
      ?auto_98342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98335 ?auto_98336 ) ) ( not ( = ?auto_98335 ?auto_98337 ) ) ( not ( = ?auto_98335 ?auto_98338 ) ) ( not ( = ?auto_98336 ?auto_98337 ) ) ( not ( = ?auto_98336 ?auto_98338 ) ) ( not ( = ?auto_98337 ?auto_98338 ) ) ( ON ?auto_98338 ?auto_98340 ) ( not ( = ?auto_98335 ?auto_98340 ) ) ( not ( = ?auto_98336 ?auto_98340 ) ) ( not ( = ?auto_98337 ?auto_98340 ) ) ( not ( = ?auto_98338 ?auto_98340 ) ) ( ON-TABLE ?auto_98339 ) ( ON ?auto_98341 ?auto_98339 ) ( ON ?auto_98340 ?auto_98341 ) ( not ( = ?auto_98339 ?auto_98341 ) ) ( not ( = ?auto_98339 ?auto_98340 ) ) ( not ( = ?auto_98339 ?auto_98338 ) ) ( not ( = ?auto_98339 ?auto_98337 ) ) ( not ( = ?auto_98341 ?auto_98340 ) ) ( not ( = ?auto_98341 ?auto_98338 ) ) ( not ( = ?auto_98341 ?auto_98337 ) ) ( not ( = ?auto_98335 ?auto_98339 ) ) ( not ( = ?auto_98335 ?auto_98341 ) ) ( not ( = ?auto_98336 ?auto_98339 ) ) ( not ( = ?auto_98336 ?auto_98341 ) ) ( ON ?auto_98335 ?auto_98342 ) ( not ( = ?auto_98335 ?auto_98342 ) ) ( not ( = ?auto_98336 ?auto_98342 ) ) ( not ( = ?auto_98337 ?auto_98342 ) ) ( not ( = ?auto_98338 ?auto_98342 ) ) ( not ( = ?auto_98340 ?auto_98342 ) ) ( not ( = ?auto_98339 ?auto_98342 ) ) ( not ( = ?auto_98341 ?auto_98342 ) ) ( ON ?auto_98336 ?auto_98335 ) ( ON-TABLE ?auto_98342 ) ( CLEAR ?auto_98338 ) ( ON ?auto_98337 ?auto_98336 ) ( CLEAR ?auto_98337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98342 ?auto_98335 ?auto_98336 )
      ( MAKE-4PILE ?auto_98335 ?auto_98336 ?auto_98337 ?auto_98338 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98343 - BLOCK
      ?auto_98344 - BLOCK
      ?auto_98345 - BLOCK
      ?auto_98346 - BLOCK
    )
    :vars
    (
      ?auto_98349 - BLOCK
      ?auto_98347 - BLOCK
      ?auto_98350 - BLOCK
      ?auto_98348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98343 ?auto_98344 ) ) ( not ( = ?auto_98343 ?auto_98345 ) ) ( not ( = ?auto_98343 ?auto_98346 ) ) ( not ( = ?auto_98344 ?auto_98345 ) ) ( not ( = ?auto_98344 ?auto_98346 ) ) ( not ( = ?auto_98345 ?auto_98346 ) ) ( not ( = ?auto_98343 ?auto_98349 ) ) ( not ( = ?auto_98344 ?auto_98349 ) ) ( not ( = ?auto_98345 ?auto_98349 ) ) ( not ( = ?auto_98346 ?auto_98349 ) ) ( ON-TABLE ?auto_98347 ) ( ON ?auto_98350 ?auto_98347 ) ( ON ?auto_98349 ?auto_98350 ) ( not ( = ?auto_98347 ?auto_98350 ) ) ( not ( = ?auto_98347 ?auto_98349 ) ) ( not ( = ?auto_98347 ?auto_98346 ) ) ( not ( = ?auto_98347 ?auto_98345 ) ) ( not ( = ?auto_98350 ?auto_98349 ) ) ( not ( = ?auto_98350 ?auto_98346 ) ) ( not ( = ?auto_98350 ?auto_98345 ) ) ( not ( = ?auto_98343 ?auto_98347 ) ) ( not ( = ?auto_98343 ?auto_98350 ) ) ( not ( = ?auto_98344 ?auto_98347 ) ) ( not ( = ?auto_98344 ?auto_98350 ) ) ( ON ?auto_98343 ?auto_98348 ) ( not ( = ?auto_98343 ?auto_98348 ) ) ( not ( = ?auto_98344 ?auto_98348 ) ) ( not ( = ?auto_98345 ?auto_98348 ) ) ( not ( = ?auto_98346 ?auto_98348 ) ) ( not ( = ?auto_98349 ?auto_98348 ) ) ( not ( = ?auto_98347 ?auto_98348 ) ) ( not ( = ?auto_98350 ?auto_98348 ) ) ( ON ?auto_98344 ?auto_98343 ) ( ON-TABLE ?auto_98348 ) ( ON ?auto_98345 ?auto_98344 ) ( CLEAR ?auto_98345 ) ( HOLDING ?auto_98346 ) ( CLEAR ?auto_98349 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98347 ?auto_98350 ?auto_98349 ?auto_98346 )
      ( MAKE-4PILE ?auto_98343 ?auto_98344 ?auto_98345 ?auto_98346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98351 - BLOCK
      ?auto_98352 - BLOCK
      ?auto_98353 - BLOCK
      ?auto_98354 - BLOCK
    )
    :vars
    (
      ?auto_98357 - BLOCK
      ?auto_98356 - BLOCK
      ?auto_98358 - BLOCK
      ?auto_98355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98351 ?auto_98352 ) ) ( not ( = ?auto_98351 ?auto_98353 ) ) ( not ( = ?auto_98351 ?auto_98354 ) ) ( not ( = ?auto_98352 ?auto_98353 ) ) ( not ( = ?auto_98352 ?auto_98354 ) ) ( not ( = ?auto_98353 ?auto_98354 ) ) ( not ( = ?auto_98351 ?auto_98357 ) ) ( not ( = ?auto_98352 ?auto_98357 ) ) ( not ( = ?auto_98353 ?auto_98357 ) ) ( not ( = ?auto_98354 ?auto_98357 ) ) ( ON-TABLE ?auto_98356 ) ( ON ?auto_98358 ?auto_98356 ) ( ON ?auto_98357 ?auto_98358 ) ( not ( = ?auto_98356 ?auto_98358 ) ) ( not ( = ?auto_98356 ?auto_98357 ) ) ( not ( = ?auto_98356 ?auto_98354 ) ) ( not ( = ?auto_98356 ?auto_98353 ) ) ( not ( = ?auto_98358 ?auto_98357 ) ) ( not ( = ?auto_98358 ?auto_98354 ) ) ( not ( = ?auto_98358 ?auto_98353 ) ) ( not ( = ?auto_98351 ?auto_98356 ) ) ( not ( = ?auto_98351 ?auto_98358 ) ) ( not ( = ?auto_98352 ?auto_98356 ) ) ( not ( = ?auto_98352 ?auto_98358 ) ) ( ON ?auto_98351 ?auto_98355 ) ( not ( = ?auto_98351 ?auto_98355 ) ) ( not ( = ?auto_98352 ?auto_98355 ) ) ( not ( = ?auto_98353 ?auto_98355 ) ) ( not ( = ?auto_98354 ?auto_98355 ) ) ( not ( = ?auto_98357 ?auto_98355 ) ) ( not ( = ?auto_98356 ?auto_98355 ) ) ( not ( = ?auto_98358 ?auto_98355 ) ) ( ON ?auto_98352 ?auto_98351 ) ( ON-TABLE ?auto_98355 ) ( ON ?auto_98353 ?auto_98352 ) ( CLEAR ?auto_98357 ) ( ON ?auto_98354 ?auto_98353 ) ( CLEAR ?auto_98354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98355 ?auto_98351 ?auto_98352 ?auto_98353 )
      ( MAKE-4PILE ?auto_98351 ?auto_98352 ?auto_98353 ?auto_98354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98359 - BLOCK
      ?auto_98360 - BLOCK
      ?auto_98361 - BLOCK
      ?auto_98362 - BLOCK
    )
    :vars
    (
      ?auto_98366 - BLOCK
      ?auto_98363 - BLOCK
      ?auto_98365 - BLOCK
      ?auto_98364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98359 ?auto_98360 ) ) ( not ( = ?auto_98359 ?auto_98361 ) ) ( not ( = ?auto_98359 ?auto_98362 ) ) ( not ( = ?auto_98360 ?auto_98361 ) ) ( not ( = ?auto_98360 ?auto_98362 ) ) ( not ( = ?auto_98361 ?auto_98362 ) ) ( not ( = ?auto_98359 ?auto_98366 ) ) ( not ( = ?auto_98360 ?auto_98366 ) ) ( not ( = ?auto_98361 ?auto_98366 ) ) ( not ( = ?auto_98362 ?auto_98366 ) ) ( ON-TABLE ?auto_98363 ) ( ON ?auto_98365 ?auto_98363 ) ( not ( = ?auto_98363 ?auto_98365 ) ) ( not ( = ?auto_98363 ?auto_98366 ) ) ( not ( = ?auto_98363 ?auto_98362 ) ) ( not ( = ?auto_98363 ?auto_98361 ) ) ( not ( = ?auto_98365 ?auto_98366 ) ) ( not ( = ?auto_98365 ?auto_98362 ) ) ( not ( = ?auto_98365 ?auto_98361 ) ) ( not ( = ?auto_98359 ?auto_98363 ) ) ( not ( = ?auto_98359 ?auto_98365 ) ) ( not ( = ?auto_98360 ?auto_98363 ) ) ( not ( = ?auto_98360 ?auto_98365 ) ) ( ON ?auto_98359 ?auto_98364 ) ( not ( = ?auto_98359 ?auto_98364 ) ) ( not ( = ?auto_98360 ?auto_98364 ) ) ( not ( = ?auto_98361 ?auto_98364 ) ) ( not ( = ?auto_98362 ?auto_98364 ) ) ( not ( = ?auto_98366 ?auto_98364 ) ) ( not ( = ?auto_98363 ?auto_98364 ) ) ( not ( = ?auto_98365 ?auto_98364 ) ) ( ON ?auto_98360 ?auto_98359 ) ( ON-TABLE ?auto_98364 ) ( ON ?auto_98361 ?auto_98360 ) ( ON ?auto_98362 ?auto_98361 ) ( CLEAR ?auto_98362 ) ( HOLDING ?auto_98366 ) ( CLEAR ?auto_98365 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98363 ?auto_98365 ?auto_98366 )
      ( MAKE-4PILE ?auto_98359 ?auto_98360 ?auto_98361 ?auto_98362 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98367 - BLOCK
      ?auto_98368 - BLOCK
      ?auto_98369 - BLOCK
      ?auto_98370 - BLOCK
    )
    :vars
    (
      ?auto_98371 - BLOCK
      ?auto_98372 - BLOCK
      ?auto_98374 - BLOCK
      ?auto_98373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98367 ?auto_98368 ) ) ( not ( = ?auto_98367 ?auto_98369 ) ) ( not ( = ?auto_98367 ?auto_98370 ) ) ( not ( = ?auto_98368 ?auto_98369 ) ) ( not ( = ?auto_98368 ?auto_98370 ) ) ( not ( = ?auto_98369 ?auto_98370 ) ) ( not ( = ?auto_98367 ?auto_98371 ) ) ( not ( = ?auto_98368 ?auto_98371 ) ) ( not ( = ?auto_98369 ?auto_98371 ) ) ( not ( = ?auto_98370 ?auto_98371 ) ) ( ON-TABLE ?auto_98372 ) ( ON ?auto_98374 ?auto_98372 ) ( not ( = ?auto_98372 ?auto_98374 ) ) ( not ( = ?auto_98372 ?auto_98371 ) ) ( not ( = ?auto_98372 ?auto_98370 ) ) ( not ( = ?auto_98372 ?auto_98369 ) ) ( not ( = ?auto_98374 ?auto_98371 ) ) ( not ( = ?auto_98374 ?auto_98370 ) ) ( not ( = ?auto_98374 ?auto_98369 ) ) ( not ( = ?auto_98367 ?auto_98372 ) ) ( not ( = ?auto_98367 ?auto_98374 ) ) ( not ( = ?auto_98368 ?auto_98372 ) ) ( not ( = ?auto_98368 ?auto_98374 ) ) ( ON ?auto_98367 ?auto_98373 ) ( not ( = ?auto_98367 ?auto_98373 ) ) ( not ( = ?auto_98368 ?auto_98373 ) ) ( not ( = ?auto_98369 ?auto_98373 ) ) ( not ( = ?auto_98370 ?auto_98373 ) ) ( not ( = ?auto_98371 ?auto_98373 ) ) ( not ( = ?auto_98372 ?auto_98373 ) ) ( not ( = ?auto_98374 ?auto_98373 ) ) ( ON ?auto_98368 ?auto_98367 ) ( ON-TABLE ?auto_98373 ) ( ON ?auto_98369 ?auto_98368 ) ( ON ?auto_98370 ?auto_98369 ) ( CLEAR ?auto_98374 ) ( ON ?auto_98371 ?auto_98370 ) ( CLEAR ?auto_98371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98373 ?auto_98367 ?auto_98368 ?auto_98369 ?auto_98370 )
      ( MAKE-4PILE ?auto_98367 ?auto_98368 ?auto_98369 ?auto_98370 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98375 - BLOCK
      ?auto_98376 - BLOCK
      ?auto_98377 - BLOCK
      ?auto_98378 - BLOCK
    )
    :vars
    (
      ?auto_98382 - BLOCK
      ?auto_98381 - BLOCK
      ?auto_98379 - BLOCK
      ?auto_98380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98375 ?auto_98376 ) ) ( not ( = ?auto_98375 ?auto_98377 ) ) ( not ( = ?auto_98375 ?auto_98378 ) ) ( not ( = ?auto_98376 ?auto_98377 ) ) ( not ( = ?auto_98376 ?auto_98378 ) ) ( not ( = ?auto_98377 ?auto_98378 ) ) ( not ( = ?auto_98375 ?auto_98382 ) ) ( not ( = ?auto_98376 ?auto_98382 ) ) ( not ( = ?auto_98377 ?auto_98382 ) ) ( not ( = ?auto_98378 ?auto_98382 ) ) ( ON-TABLE ?auto_98381 ) ( not ( = ?auto_98381 ?auto_98379 ) ) ( not ( = ?auto_98381 ?auto_98382 ) ) ( not ( = ?auto_98381 ?auto_98378 ) ) ( not ( = ?auto_98381 ?auto_98377 ) ) ( not ( = ?auto_98379 ?auto_98382 ) ) ( not ( = ?auto_98379 ?auto_98378 ) ) ( not ( = ?auto_98379 ?auto_98377 ) ) ( not ( = ?auto_98375 ?auto_98381 ) ) ( not ( = ?auto_98375 ?auto_98379 ) ) ( not ( = ?auto_98376 ?auto_98381 ) ) ( not ( = ?auto_98376 ?auto_98379 ) ) ( ON ?auto_98375 ?auto_98380 ) ( not ( = ?auto_98375 ?auto_98380 ) ) ( not ( = ?auto_98376 ?auto_98380 ) ) ( not ( = ?auto_98377 ?auto_98380 ) ) ( not ( = ?auto_98378 ?auto_98380 ) ) ( not ( = ?auto_98382 ?auto_98380 ) ) ( not ( = ?auto_98381 ?auto_98380 ) ) ( not ( = ?auto_98379 ?auto_98380 ) ) ( ON ?auto_98376 ?auto_98375 ) ( ON-TABLE ?auto_98380 ) ( ON ?auto_98377 ?auto_98376 ) ( ON ?auto_98378 ?auto_98377 ) ( ON ?auto_98382 ?auto_98378 ) ( CLEAR ?auto_98382 ) ( HOLDING ?auto_98379 ) ( CLEAR ?auto_98381 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98381 ?auto_98379 )
      ( MAKE-4PILE ?auto_98375 ?auto_98376 ?auto_98377 ?auto_98378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98383 - BLOCK
      ?auto_98384 - BLOCK
      ?auto_98385 - BLOCK
      ?auto_98386 - BLOCK
    )
    :vars
    (
      ?auto_98388 - BLOCK
      ?auto_98390 - BLOCK
      ?auto_98389 - BLOCK
      ?auto_98387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98383 ?auto_98384 ) ) ( not ( = ?auto_98383 ?auto_98385 ) ) ( not ( = ?auto_98383 ?auto_98386 ) ) ( not ( = ?auto_98384 ?auto_98385 ) ) ( not ( = ?auto_98384 ?auto_98386 ) ) ( not ( = ?auto_98385 ?auto_98386 ) ) ( not ( = ?auto_98383 ?auto_98388 ) ) ( not ( = ?auto_98384 ?auto_98388 ) ) ( not ( = ?auto_98385 ?auto_98388 ) ) ( not ( = ?auto_98386 ?auto_98388 ) ) ( ON-TABLE ?auto_98390 ) ( not ( = ?auto_98390 ?auto_98389 ) ) ( not ( = ?auto_98390 ?auto_98388 ) ) ( not ( = ?auto_98390 ?auto_98386 ) ) ( not ( = ?auto_98390 ?auto_98385 ) ) ( not ( = ?auto_98389 ?auto_98388 ) ) ( not ( = ?auto_98389 ?auto_98386 ) ) ( not ( = ?auto_98389 ?auto_98385 ) ) ( not ( = ?auto_98383 ?auto_98390 ) ) ( not ( = ?auto_98383 ?auto_98389 ) ) ( not ( = ?auto_98384 ?auto_98390 ) ) ( not ( = ?auto_98384 ?auto_98389 ) ) ( ON ?auto_98383 ?auto_98387 ) ( not ( = ?auto_98383 ?auto_98387 ) ) ( not ( = ?auto_98384 ?auto_98387 ) ) ( not ( = ?auto_98385 ?auto_98387 ) ) ( not ( = ?auto_98386 ?auto_98387 ) ) ( not ( = ?auto_98388 ?auto_98387 ) ) ( not ( = ?auto_98390 ?auto_98387 ) ) ( not ( = ?auto_98389 ?auto_98387 ) ) ( ON ?auto_98384 ?auto_98383 ) ( ON-TABLE ?auto_98387 ) ( ON ?auto_98385 ?auto_98384 ) ( ON ?auto_98386 ?auto_98385 ) ( ON ?auto_98388 ?auto_98386 ) ( CLEAR ?auto_98390 ) ( ON ?auto_98389 ?auto_98388 ) ( CLEAR ?auto_98389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98387 ?auto_98383 ?auto_98384 ?auto_98385 ?auto_98386 ?auto_98388 )
      ( MAKE-4PILE ?auto_98383 ?auto_98384 ?auto_98385 ?auto_98386 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98391 - BLOCK
      ?auto_98392 - BLOCK
      ?auto_98393 - BLOCK
      ?auto_98394 - BLOCK
    )
    :vars
    (
      ?auto_98396 - BLOCK
      ?auto_98398 - BLOCK
      ?auto_98397 - BLOCK
      ?auto_98395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98391 ?auto_98392 ) ) ( not ( = ?auto_98391 ?auto_98393 ) ) ( not ( = ?auto_98391 ?auto_98394 ) ) ( not ( = ?auto_98392 ?auto_98393 ) ) ( not ( = ?auto_98392 ?auto_98394 ) ) ( not ( = ?auto_98393 ?auto_98394 ) ) ( not ( = ?auto_98391 ?auto_98396 ) ) ( not ( = ?auto_98392 ?auto_98396 ) ) ( not ( = ?auto_98393 ?auto_98396 ) ) ( not ( = ?auto_98394 ?auto_98396 ) ) ( not ( = ?auto_98398 ?auto_98397 ) ) ( not ( = ?auto_98398 ?auto_98396 ) ) ( not ( = ?auto_98398 ?auto_98394 ) ) ( not ( = ?auto_98398 ?auto_98393 ) ) ( not ( = ?auto_98397 ?auto_98396 ) ) ( not ( = ?auto_98397 ?auto_98394 ) ) ( not ( = ?auto_98397 ?auto_98393 ) ) ( not ( = ?auto_98391 ?auto_98398 ) ) ( not ( = ?auto_98391 ?auto_98397 ) ) ( not ( = ?auto_98392 ?auto_98398 ) ) ( not ( = ?auto_98392 ?auto_98397 ) ) ( ON ?auto_98391 ?auto_98395 ) ( not ( = ?auto_98391 ?auto_98395 ) ) ( not ( = ?auto_98392 ?auto_98395 ) ) ( not ( = ?auto_98393 ?auto_98395 ) ) ( not ( = ?auto_98394 ?auto_98395 ) ) ( not ( = ?auto_98396 ?auto_98395 ) ) ( not ( = ?auto_98398 ?auto_98395 ) ) ( not ( = ?auto_98397 ?auto_98395 ) ) ( ON ?auto_98392 ?auto_98391 ) ( ON-TABLE ?auto_98395 ) ( ON ?auto_98393 ?auto_98392 ) ( ON ?auto_98394 ?auto_98393 ) ( ON ?auto_98396 ?auto_98394 ) ( ON ?auto_98397 ?auto_98396 ) ( CLEAR ?auto_98397 ) ( HOLDING ?auto_98398 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98398 )
      ( MAKE-4PILE ?auto_98391 ?auto_98392 ?auto_98393 ?auto_98394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_98399 - BLOCK
      ?auto_98400 - BLOCK
      ?auto_98401 - BLOCK
      ?auto_98402 - BLOCK
    )
    :vars
    (
      ?auto_98405 - BLOCK
      ?auto_98404 - BLOCK
      ?auto_98406 - BLOCK
      ?auto_98403 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98399 ?auto_98400 ) ) ( not ( = ?auto_98399 ?auto_98401 ) ) ( not ( = ?auto_98399 ?auto_98402 ) ) ( not ( = ?auto_98400 ?auto_98401 ) ) ( not ( = ?auto_98400 ?auto_98402 ) ) ( not ( = ?auto_98401 ?auto_98402 ) ) ( not ( = ?auto_98399 ?auto_98405 ) ) ( not ( = ?auto_98400 ?auto_98405 ) ) ( not ( = ?auto_98401 ?auto_98405 ) ) ( not ( = ?auto_98402 ?auto_98405 ) ) ( not ( = ?auto_98404 ?auto_98406 ) ) ( not ( = ?auto_98404 ?auto_98405 ) ) ( not ( = ?auto_98404 ?auto_98402 ) ) ( not ( = ?auto_98404 ?auto_98401 ) ) ( not ( = ?auto_98406 ?auto_98405 ) ) ( not ( = ?auto_98406 ?auto_98402 ) ) ( not ( = ?auto_98406 ?auto_98401 ) ) ( not ( = ?auto_98399 ?auto_98404 ) ) ( not ( = ?auto_98399 ?auto_98406 ) ) ( not ( = ?auto_98400 ?auto_98404 ) ) ( not ( = ?auto_98400 ?auto_98406 ) ) ( ON ?auto_98399 ?auto_98403 ) ( not ( = ?auto_98399 ?auto_98403 ) ) ( not ( = ?auto_98400 ?auto_98403 ) ) ( not ( = ?auto_98401 ?auto_98403 ) ) ( not ( = ?auto_98402 ?auto_98403 ) ) ( not ( = ?auto_98405 ?auto_98403 ) ) ( not ( = ?auto_98404 ?auto_98403 ) ) ( not ( = ?auto_98406 ?auto_98403 ) ) ( ON ?auto_98400 ?auto_98399 ) ( ON-TABLE ?auto_98403 ) ( ON ?auto_98401 ?auto_98400 ) ( ON ?auto_98402 ?auto_98401 ) ( ON ?auto_98405 ?auto_98402 ) ( ON ?auto_98406 ?auto_98405 ) ( ON ?auto_98404 ?auto_98406 ) ( CLEAR ?auto_98404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98403 ?auto_98399 ?auto_98400 ?auto_98401 ?auto_98402 ?auto_98405 ?auto_98406 )
      ( MAKE-4PILE ?auto_98399 ?auto_98400 ?auto_98401 ?auto_98402 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98422 - BLOCK
      ?auto_98423 - BLOCK
    )
    :vars
    (
      ?auto_98425 - BLOCK
      ?auto_98424 - BLOCK
      ?auto_98426 - BLOCK
      ?auto_98428 - BLOCK
      ?auto_98427 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98425 ?auto_98423 ) ( ON-TABLE ?auto_98422 ) ( ON ?auto_98423 ?auto_98422 ) ( not ( = ?auto_98422 ?auto_98423 ) ) ( not ( = ?auto_98422 ?auto_98425 ) ) ( not ( = ?auto_98423 ?auto_98425 ) ) ( not ( = ?auto_98422 ?auto_98424 ) ) ( not ( = ?auto_98422 ?auto_98426 ) ) ( not ( = ?auto_98423 ?auto_98424 ) ) ( not ( = ?auto_98423 ?auto_98426 ) ) ( not ( = ?auto_98425 ?auto_98424 ) ) ( not ( = ?auto_98425 ?auto_98426 ) ) ( not ( = ?auto_98424 ?auto_98426 ) ) ( ON ?auto_98424 ?auto_98425 ) ( CLEAR ?auto_98424 ) ( HOLDING ?auto_98426 ) ( CLEAR ?auto_98428 ) ( ON-TABLE ?auto_98427 ) ( ON ?auto_98428 ?auto_98427 ) ( not ( = ?auto_98427 ?auto_98428 ) ) ( not ( = ?auto_98427 ?auto_98426 ) ) ( not ( = ?auto_98428 ?auto_98426 ) ) ( not ( = ?auto_98422 ?auto_98428 ) ) ( not ( = ?auto_98422 ?auto_98427 ) ) ( not ( = ?auto_98423 ?auto_98428 ) ) ( not ( = ?auto_98423 ?auto_98427 ) ) ( not ( = ?auto_98425 ?auto_98428 ) ) ( not ( = ?auto_98425 ?auto_98427 ) ) ( not ( = ?auto_98424 ?auto_98428 ) ) ( not ( = ?auto_98424 ?auto_98427 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98427 ?auto_98428 ?auto_98426 )
      ( MAKE-2PILE ?auto_98422 ?auto_98423 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98429 - BLOCK
      ?auto_98430 - BLOCK
    )
    :vars
    (
      ?auto_98433 - BLOCK
      ?auto_98431 - BLOCK
      ?auto_98432 - BLOCK
      ?auto_98434 - BLOCK
      ?auto_98435 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98433 ?auto_98430 ) ( ON-TABLE ?auto_98429 ) ( ON ?auto_98430 ?auto_98429 ) ( not ( = ?auto_98429 ?auto_98430 ) ) ( not ( = ?auto_98429 ?auto_98433 ) ) ( not ( = ?auto_98430 ?auto_98433 ) ) ( not ( = ?auto_98429 ?auto_98431 ) ) ( not ( = ?auto_98429 ?auto_98432 ) ) ( not ( = ?auto_98430 ?auto_98431 ) ) ( not ( = ?auto_98430 ?auto_98432 ) ) ( not ( = ?auto_98433 ?auto_98431 ) ) ( not ( = ?auto_98433 ?auto_98432 ) ) ( not ( = ?auto_98431 ?auto_98432 ) ) ( ON ?auto_98431 ?auto_98433 ) ( CLEAR ?auto_98434 ) ( ON-TABLE ?auto_98435 ) ( ON ?auto_98434 ?auto_98435 ) ( not ( = ?auto_98435 ?auto_98434 ) ) ( not ( = ?auto_98435 ?auto_98432 ) ) ( not ( = ?auto_98434 ?auto_98432 ) ) ( not ( = ?auto_98429 ?auto_98434 ) ) ( not ( = ?auto_98429 ?auto_98435 ) ) ( not ( = ?auto_98430 ?auto_98434 ) ) ( not ( = ?auto_98430 ?auto_98435 ) ) ( not ( = ?auto_98433 ?auto_98434 ) ) ( not ( = ?auto_98433 ?auto_98435 ) ) ( not ( = ?auto_98431 ?auto_98434 ) ) ( not ( = ?auto_98431 ?auto_98435 ) ) ( ON ?auto_98432 ?auto_98431 ) ( CLEAR ?auto_98432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98429 ?auto_98430 ?auto_98433 ?auto_98431 )
      ( MAKE-2PILE ?auto_98429 ?auto_98430 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98436 - BLOCK
      ?auto_98437 - BLOCK
    )
    :vars
    (
      ?auto_98441 - BLOCK
      ?auto_98439 - BLOCK
      ?auto_98440 - BLOCK
      ?auto_98438 - BLOCK
      ?auto_98442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98441 ?auto_98437 ) ( ON-TABLE ?auto_98436 ) ( ON ?auto_98437 ?auto_98436 ) ( not ( = ?auto_98436 ?auto_98437 ) ) ( not ( = ?auto_98436 ?auto_98441 ) ) ( not ( = ?auto_98437 ?auto_98441 ) ) ( not ( = ?auto_98436 ?auto_98439 ) ) ( not ( = ?auto_98436 ?auto_98440 ) ) ( not ( = ?auto_98437 ?auto_98439 ) ) ( not ( = ?auto_98437 ?auto_98440 ) ) ( not ( = ?auto_98441 ?auto_98439 ) ) ( not ( = ?auto_98441 ?auto_98440 ) ) ( not ( = ?auto_98439 ?auto_98440 ) ) ( ON ?auto_98439 ?auto_98441 ) ( ON-TABLE ?auto_98438 ) ( not ( = ?auto_98438 ?auto_98442 ) ) ( not ( = ?auto_98438 ?auto_98440 ) ) ( not ( = ?auto_98442 ?auto_98440 ) ) ( not ( = ?auto_98436 ?auto_98442 ) ) ( not ( = ?auto_98436 ?auto_98438 ) ) ( not ( = ?auto_98437 ?auto_98442 ) ) ( not ( = ?auto_98437 ?auto_98438 ) ) ( not ( = ?auto_98441 ?auto_98442 ) ) ( not ( = ?auto_98441 ?auto_98438 ) ) ( not ( = ?auto_98439 ?auto_98442 ) ) ( not ( = ?auto_98439 ?auto_98438 ) ) ( ON ?auto_98440 ?auto_98439 ) ( CLEAR ?auto_98440 ) ( HOLDING ?auto_98442 ) ( CLEAR ?auto_98438 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98438 ?auto_98442 )
      ( MAKE-2PILE ?auto_98436 ?auto_98437 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98443 - BLOCK
      ?auto_98444 - BLOCK
    )
    :vars
    (
      ?auto_98448 - BLOCK
      ?auto_98446 - BLOCK
      ?auto_98447 - BLOCK
      ?auto_98449 - BLOCK
      ?auto_98445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98448 ?auto_98444 ) ( ON-TABLE ?auto_98443 ) ( ON ?auto_98444 ?auto_98443 ) ( not ( = ?auto_98443 ?auto_98444 ) ) ( not ( = ?auto_98443 ?auto_98448 ) ) ( not ( = ?auto_98444 ?auto_98448 ) ) ( not ( = ?auto_98443 ?auto_98446 ) ) ( not ( = ?auto_98443 ?auto_98447 ) ) ( not ( = ?auto_98444 ?auto_98446 ) ) ( not ( = ?auto_98444 ?auto_98447 ) ) ( not ( = ?auto_98448 ?auto_98446 ) ) ( not ( = ?auto_98448 ?auto_98447 ) ) ( not ( = ?auto_98446 ?auto_98447 ) ) ( ON ?auto_98446 ?auto_98448 ) ( ON-TABLE ?auto_98449 ) ( not ( = ?auto_98449 ?auto_98445 ) ) ( not ( = ?auto_98449 ?auto_98447 ) ) ( not ( = ?auto_98445 ?auto_98447 ) ) ( not ( = ?auto_98443 ?auto_98445 ) ) ( not ( = ?auto_98443 ?auto_98449 ) ) ( not ( = ?auto_98444 ?auto_98445 ) ) ( not ( = ?auto_98444 ?auto_98449 ) ) ( not ( = ?auto_98448 ?auto_98445 ) ) ( not ( = ?auto_98448 ?auto_98449 ) ) ( not ( = ?auto_98446 ?auto_98445 ) ) ( not ( = ?auto_98446 ?auto_98449 ) ) ( ON ?auto_98447 ?auto_98446 ) ( CLEAR ?auto_98449 ) ( ON ?auto_98445 ?auto_98447 ) ( CLEAR ?auto_98445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98443 ?auto_98444 ?auto_98448 ?auto_98446 ?auto_98447 )
      ( MAKE-2PILE ?auto_98443 ?auto_98444 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98450 - BLOCK
      ?auto_98451 - BLOCK
    )
    :vars
    (
      ?auto_98456 - BLOCK
      ?auto_98455 - BLOCK
      ?auto_98452 - BLOCK
      ?auto_98453 - BLOCK
      ?auto_98454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98456 ?auto_98451 ) ( ON-TABLE ?auto_98450 ) ( ON ?auto_98451 ?auto_98450 ) ( not ( = ?auto_98450 ?auto_98451 ) ) ( not ( = ?auto_98450 ?auto_98456 ) ) ( not ( = ?auto_98451 ?auto_98456 ) ) ( not ( = ?auto_98450 ?auto_98455 ) ) ( not ( = ?auto_98450 ?auto_98452 ) ) ( not ( = ?auto_98451 ?auto_98455 ) ) ( not ( = ?auto_98451 ?auto_98452 ) ) ( not ( = ?auto_98456 ?auto_98455 ) ) ( not ( = ?auto_98456 ?auto_98452 ) ) ( not ( = ?auto_98455 ?auto_98452 ) ) ( ON ?auto_98455 ?auto_98456 ) ( not ( = ?auto_98453 ?auto_98454 ) ) ( not ( = ?auto_98453 ?auto_98452 ) ) ( not ( = ?auto_98454 ?auto_98452 ) ) ( not ( = ?auto_98450 ?auto_98454 ) ) ( not ( = ?auto_98450 ?auto_98453 ) ) ( not ( = ?auto_98451 ?auto_98454 ) ) ( not ( = ?auto_98451 ?auto_98453 ) ) ( not ( = ?auto_98456 ?auto_98454 ) ) ( not ( = ?auto_98456 ?auto_98453 ) ) ( not ( = ?auto_98455 ?auto_98454 ) ) ( not ( = ?auto_98455 ?auto_98453 ) ) ( ON ?auto_98452 ?auto_98455 ) ( ON ?auto_98454 ?auto_98452 ) ( CLEAR ?auto_98454 ) ( HOLDING ?auto_98453 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98453 )
      ( MAKE-2PILE ?auto_98450 ?auto_98451 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98466 - BLOCK
      ?auto_98467 - BLOCK
    )
    :vars
    (
      ?auto_98472 - BLOCK
      ?auto_98471 - BLOCK
      ?auto_98469 - BLOCK
      ?auto_98468 - BLOCK
      ?auto_98470 - BLOCK
      ?auto_98473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98472 ?auto_98467 ) ( ON-TABLE ?auto_98466 ) ( ON ?auto_98467 ?auto_98466 ) ( not ( = ?auto_98466 ?auto_98467 ) ) ( not ( = ?auto_98466 ?auto_98472 ) ) ( not ( = ?auto_98467 ?auto_98472 ) ) ( not ( = ?auto_98466 ?auto_98471 ) ) ( not ( = ?auto_98466 ?auto_98469 ) ) ( not ( = ?auto_98467 ?auto_98471 ) ) ( not ( = ?auto_98467 ?auto_98469 ) ) ( not ( = ?auto_98472 ?auto_98471 ) ) ( not ( = ?auto_98472 ?auto_98469 ) ) ( not ( = ?auto_98471 ?auto_98469 ) ) ( ON ?auto_98471 ?auto_98472 ) ( not ( = ?auto_98468 ?auto_98470 ) ) ( not ( = ?auto_98468 ?auto_98469 ) ) ( not ( = ?auto_98470 ?auto_98469 ) ) ( not ( = ?auto_98466 ?auto_98470 ) ) ( not ( = ?auto_98466 ?auto_98468 ) ) ( not ( = ?auto_98467 ?auto_98470 ) ) ( not ( = ?auto_98467 ?auto_98468 ) ) ( not ( = ?auto_98472 ?auto_98470 ) ) ( not ( = ?auto_98472 ?auto_98468 ) ) ( not ( = ?auto_98471 ?auto_98470 ) ) ( not ( = ?auto_98471 ?auto_98468 ) ) ( ON ?auto_98469 ?auto_98471 ) ( ON ?auto_98470 ?auto_98469 ) ( CLEAR ?auto_98470 ) ( ON ?auto_98468 ?auto_98473 ) ( CLEAR ?auto_98468 ) ( HAND-EMPTY ) ( not ( = ?auto_98466 ?auto_98473 ) ) ( not ( = ?auto_98467 ?auto_98473 ) ) ( not ( = ?auto_98472 ?auto_98473 ) ) ( not ( = ?auto_98471 ?auto_98473 ) ) ( not ( = ?auto_98469 ?auto_98473 ) ) ( not ( = ?auto_98468 ?auto_98473 ) ) ( not ( = ?auto_98470 ?auto_98473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98468 ?auto_98473 )
      ( MAKE-2PILE ?auto_98466 ?auto_98467 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98474 - BLOCK
      ?auto_98475 - BLOCK
    )
    :vars
    (
      ?auto_98476 - BLOCK
      ?auto_98481 - BLOCK
      ?auto_98478 - BLOCK
      ?auto_98479 - BLOCK
      ?auto_98477 - BLOCK
      ?auto_98480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98476 ?auto_98475 ) ( ON-TABLE ?auto_98474 ) ( ON ?auto_98475 ?auto_98474 ) ( not ( = ?auto_98474 ?auto_98475 ) ) ( not ( = ?auto_98474 ?auto_98476 ) ) ( not ( = ?auto_98475 ?auto_98476 ) ) ( not ( = ?auto_98474 ?auto_98481 ) ) ( not ( = ?auto_98474 ?auto_98478 ) ) ( not ( = ?auto_98475 ?auto_98481 ) ) ( not ( = ?auto_98475 ?auto_98478 ) ) ( not ( = ?auto_98476 ?auto_98481 ) ) ( not ( = ?auto_98476 ?auto_98478 ) ) ( not ( = ?auto_98481 ?auto_98478 ) ) ( ON ?auto_98481 ?auto_98476 ) ( not ( = ?auto_98479 ?auto_98477 ) ) ( not ( = ?auto_98479 ?auto_98478 ) ) ( not ( = ?auto_98477 ?auto_98478 ) ) ( not ( = ?auto_98474 ?auto_98477 ) ) ( not ( = ?auto_98474 ?auto_98479 ) ) ( not ( = ?auto_98475 ?auto_98477 ) ) ( not ( = ?auto_98475 ?auto_98479 ) ) ( not ( = ?auto_98476 ?auto_98477 ) ) ( not ( = ?auto_98476 ?auto_98479 ) ) ( not ( = ?auto_98481 ?auto_98477 ) ) ( not ( = ?auto_98481 ?auto_98479 ) ) ( ON ?auto_98478 ?auto_98481 ) ( ON ?auto_98479 ?auto_98480 ) ( CLEAR ?auto_98479 ) ( not ( = ?auto_98474 ?auto_98480 ) ) ( not ( = ?auto_98475 ?auto_98480 ) ) ( not ( = ?auto_98476 ?auto_98480 ) ) ( not ( = ?auto_98481 ?auto_98480 ) ) ( not ( = ?auto_98478 ?auto_98480 ) ) ( not ( = ?auto_98479 ?auto_98480 ) ) ( not ( = ?auto_98477 ?auto_98480 ) ) ( HOLDING ?auto_98477 ) ( CLEAR ?auto_98478 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98474 ?auto_98475 ?auto_98476 ?auto_98481 ?auto_98478 ?auto_98477 )
      ( MAKE-2PILE ?auto_98474 ?auto_98475 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98482 - BLOCK
      ?auto_98483 - BLOCK
    )
    :vars
    (
      ?auto_98487 - BLOCK
      ?auto_98488 - BLOCK
      ?auto_98484 - BLOCK
      ?auto_98489 - BLOCK
      ?auto_98486 - BLOCK
      ?auto_98485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98487 ?auto_98483 ) ( ON-TABLE ?auto_98482 ) ( ON ?auto_98483 ?auto_98482 ) ( not ( = ?auto_98482 ?auto_98483 ) ) ( not ( = ?auto_98482 ?auto_98487 ) ) ( not ( = ?auto_98483 ?auto_98487 ) ) ( not ( = ?auto_98482 ?auto_98488 ) ) ( not ( = ?auto_98482 ?auto_98484 ) ) ( not ( = ?auto_98483 ?auto_98488 ) ) ( not ( = ?auto_98483 ?auto_98484 ) ) ( not ( = ?auto_98487 ?auto_98488 ) ) ( not ( = ?auto_98487 ?auto_98484 ) ) ( not ( = ?auto_98488 ?auto_98484 ) ) ( ON ?auto_98488 ?auto_98487 ) ( not ( = ?auto_98489 ?auto_98486 ) ) ( not ( = ?auto_98489 ?auto_98484 ) ) ( not ( = ?auto_98486 ?auto_98484 ) ) ( not ( = ?auto_98482 ?auto_98486 ) ) ( not ( = ?auto_98482 ?auto_98489 ) ) ( not ( = ?auto_98483 ?auto_98486 ) ) ( not ( = ?auto_98483 ?auto_98489 ) ) ( not ( = ?auto_98487 ?auto_98486 ) ) ( not ( = ?auto_98487 ?auto_98489 ) ) ( not ( = ?auto_98488 ?auto_98486 ) ) ( not ( = ?auto_98488 ?auto_98489 ) ) ( ON ?auto_98484 ?auto_98488 ) ( ON ?auto_98489 ?auto_98485 ) ( not ( = ?auto_98482 ?auto_98485 ) ) ( not ( = ?auto_98483 ?auto_98485 ) ) ( not ( = ?auto_98487 ?auto_98485 ) ) ( not ( = ?auto_98488 ?auto_98485 ) ) ( not ( = ?auto_98484 ?auto_98485 ) ) ( not ( = ?auto_98489 ?auto_98485 ) ) ( not ( = ?auto_98486 ?auto_98485 ) ) ( CLEAR ?auto_98484 ) ( ON ?auto_98486 ?auto_98489 ) ( CLEAR ?auto_98486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98485 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98485 ?auto_98489 )
      ( MAKE-2PILE ?auto_98482 ?auto_98483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_98490 - BLOCK
      ?auto_98491 - BLOCK
    )
    :vars
    (
      ?auto_98495 - BLOCK
      ?auto_98494 - BLOCK
      ?auto_98493 - BLOCK
      ?auto_98492 - BLOCK
      ?auto_98497 - BLOCK
      ?auto_98496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98495 ?auto_98491 ) ( ON-TABLE ?auto_98490 ) ( ON ?auto_98491 ?auto_98490 ) ( not ( = ?auto_98490 ?auto_98491 ) ) ( not ( = ?auto_98490 ?auto_98495 ) ) ( not ( = ?auto_98491 ?auto_98495 ) ) ( not ( = ?auto_98490 ?auto_98494 ) ) ( not ( = ?auto_98490 ?auto_98493 ) ) ( not ( = ?auto_98491 ?auto_98494 ) ) ( not ( = ?auto_98491 ?auto_98493 ) ) ( not ( = ?auto_98495 ?auto_98494 ) ) ( not ( = ?auto_98495 ?auto_98493 ) ) ( not ( = ?auto_98494 ?auto_98493 ) ) ( ON ?auto_98494 ?auto_98495 ) ( not ( = ?auto_98492 ?auto_98497 ) ) ( not ( = ?auto_98492 ?auto_98493 ) ) ( not ( = ?auto_98497 ?auto_98493 ) ) ( not ( = ?auto_98490 ?auto_98497 ) ) ( not ( = ?auto_98490 ?auto_98492 ) ) ( not ( = ?auto_98491 ?auto_98497 ) ) ( not ( = ?auto_98491 ?auto_98492 ) ) ( not ( = ?auto_98495 ?auto_98497 ) ) ( not ( = ?auto_98495 ?auto_98492 ) ) ( not ( = ?auto_98494 ?auto_98497 ) ) ( not ( = ?auto_98494 ?auto_98492 ) ) ( ON ?auto_98492 ?auto_98496 ) ( not ( = ?auto_98490 ?auto_98496 ) ) ( not ( = ?auto_98491 ?auto_98496 ) ) ( not ( = ?auto_98495 ?auto_98496 ) ) ( not ( = ?auto_98494 ?auto_98496 ) ) ( not ( = ?auto_98493 ?auto_98496 ) ) ( not ( = ?auto_98492 ?auto_98496 ) ) ( not ( = ?auto_98497 ?auto_98496 ) ) ( ON ?auto_98497 ?auto_98492 ) ( CLEAR ?auto_98497 ) ( ON-TABLE ?auto_98496 ) ( HOLDING ?auto_98493 ) ( CLEAR ?auto_98494 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98490 ?auto_98491 ?auto_98495 ?auto_98494 ?auto_98493 )
      ( MAKE-2PILE ?auto_98490 ?auto_98491 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98541 - BLOCK
      ?auto_98542 - BLOCK
      ?auto_98543 - BLOCK
      ?auto_98544 - BLOCK
      ?auto_98545 - BLOCK
    )
    :vars
    (
      ?auto_98546 - BLOCK
      ?auto_98547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98541 ) ( ON ?auto_98542 ?auto_98541 ) ( ON ?auto_98543 ?auto_98542 ) ( not ( = ?auto_98541 ?auto_98542 ) ) ( not ( = ?auto_98541 ?auto_98543 ) ) ( not ( = ?auto_98541 ?auto_98544 ) ) ( not ( = ?auto_98541 ?auto_98545 ) ) ( not ( = ?auto_98542 ?auto_98543 ) ) ( not ( = ?auto_98542 ?auto_98544 ) ) ( not ( = ?auto_98542 ?auto_98545 ) ) ( not ( = ?auto_98543 ?auto_98544 ) ) ( not ( = ?auto_98543 ?auto_98545 ) ) ( not ( = ?auto_98544 ?auto_98545 ) ) ( ON ?auto_98545 ?auto_98546 ) ( not ( = ?auto_98541 ?auto_98546 ) ) ( not ( = ?auto_98542 ?auto_98546 ) ) ( not ( = ?auto_98543 ?auto_98546 ) ) ( not ( = ?auto_98544 ?auto_98546 ) ) ( not ( = ?auto_98545 ?auto_98546 ) ) ( CLEAR ?auto_98543 ) ( ON ?auto_98544 ?auto_98545 ) ( CLEAR ?auto_98544 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98547 ) ( ON ?auto_98546 ?auto_98547 ) ( not ( = ?auto_98547 ?auto_98546 ) ) ( not ( = ?auto_98547 ?auto_98545 ) ) ( not ( = ?auto_98547 ?auto_98544 ) ) ( not ( = ?auto_98541 ?auto_98547 ) ) ( not ( = ?auto_98542 ?auto_98547 ) ) ( not ( = ?auto_98543 ?auto_98547 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98547 ?auto_98546 ?auto_98545 )
      ( MAKE-5PILE ?auto_98541 ?auto_98542 ?auto_98543 ?auto_98544 ?auto_98545 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98548 - BLOCK
      ?auto_98549 - BLOCK
      ?auto_98550 - BLOCK
      ?auto_98551 - BLOCK
      ?auto_98552 - BLOCK
    )
    :vars
    (
      ?auto_98554 - BLOCK
      ?auto_98553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98548 ) ( ON ?auto_98549 ?auto_98548 ) ( not ( = ?auto_98548 ?auto_98549 ) ) ( not ( = ?auto_98548 ?auto_98550 ) ) ( not ( = ?auto_98548 ?auto_98551 ) ) ( not ( = ?auto_98548 ?auto_98552 ) ) ( not ( = ?auto_98549 ?auto_98550 ) ) ( not ( = ?auto_98549 ?auto_98551 ) ) ( not ( = ?auto_98549 ?auto_98552 ) ) ( not ( = ?auto_98550 ?auto_98551 ) ) ( not ( = ?auto_98550 ?auto_98552 ) ) ( not ( = ?auto_98551 ?auto_98552 ) ) ( ON ?auto_98552 ?auto_98554 ) ( not ( = ?auto_98548 ?auto_98554 ) ) ( not ( = ?auto_98549 ?auto_98554 ) ) ( not ( = ?auto_98550 ?auto_98554 ) ) ( not ( = ?auto_98551 ?auto_98554 ) ) ( not ( = ?auto_98552 ?auto_98554 ) ) ( ON ?auto_98551 ?auto_98552 ) ( CLEAR ?auto_98551 ) ( ON-TABLE ?auto_98553 ) ( ON ?auto_98554 ?auto_98553 ) ( not ( = ?auto_98553 ?auto_98554 ) ) ( not ( = ?auto_98553 ?auto_98552 ) ) ( not ( = ?auto_98553 ?auto_98551 ) ) ( not ( = ?auto_98548 ?auto_98553 ) ) ( not ( = ?auto_98549 ?auto_98553 ) ) ( not ( = ?auto_98550 ?auto_98553 ) ) ( HOLDING ?auto_98550 ) ( CLEAR ?auto_98549 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98548 ?auto_98549 ?auto_98550 )
      ( MAKE-5PILE ?auto_98548 ?auto_98549 ?auto_98550 ?auto_98551 ?auto_98552 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98555 - BLOCK
      ?auto_98556 - BLOCK
      ?auto_98557 - BLOCK
      ?auto_98558 - BLOCK
      ?auto_98559 - BLOCK
    )
    :vars
    (
      ?auto_98560 - BLOCK
      ?auto_98561 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98555 ) ( ON ?auto_98556 ?auto_98555 ) ( not ( = ?auto_98555 ?auto_98556 ) ) ( not ( = ?auto_98555 ?auto_98557 ) ) ( not ( = ?auto_98555 ?auto_98558 ) ) ( not ( = ?auto_98555 ?auto_98559 ) ) ( not ( = ?auto_98556 ?auto_98557 ) ) ( not ( = ?auto_98556 ?auto_98558 ) ) ( not ( = ?auto_98556 ?auto_98559 ) ) ( not ( = ?auto_98557 ?auto_98558 ) ) ( not ( = ?auto_98557 ?auto_98559 ) ) ( not ( = ?auto_98558 ?auto_98559 ) ) ( ON ?auto_98559 ?auto_98560 ) ( not ( = ?auto_98555 ?auto_98560 ) ) ( not ( = ?auto_98556 ?auto_98560 ) ) ( not ( = ?auto_98557 ?auto_98560 ) ) ( not ( = ?auto_98558 ?auto_98560 ) ) ( not ( = ?auto_98559 ?auto_98560 ) ) ( ON ?auto_98558 ?auto_98559 ) ( ON-TABLE ?auto_98561 ) ( ON ?auto_98560 ?auto_98561 ) ( not ( = ?auto_98561 ?auto_98560 ) ) ( not ( = ?auto_98561 ?auto_98559 ) ) ( not ( = ?auto_98561 ?auto_98558 ) ) ( not ( = ?auto_98555 ?auto_98561 ) ) ( not ( = ?auto_98556 ?auto_98561 ) ) ( not ( = ?auto_98557 ?auto_98561 ) ) ( CLEAR ?auto_98556 ) ( ON ?auto_98557 ?auto_98558 ) ( CLEAR ?auto_98557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98561 ?auto_98560 ?auto_98559 ?auto_98558 )
      ( MAKE-5PILE ?auto_98555 ?auto_98556 ?auto_98557 ?auto_98558 ?auto_98559 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98562 - BLOCK
      ?auto_98563 - BLOCK
      ?auto_98564 - BLOCK
      ?auto_98565 - BLOCK
      ?auto_98566 - BLOCK
    )
    :vars
    (
      ?auto_98567 - BLOCK
      ?auto_98568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98562 ) ( not ( = ?auto_98562 ?auto_98563 ) ) ( not ( = ?auto_98562 ?auto_98564 ) ) ( not ( = ?auto_98562 ?auto_98565 ) ) ( not ( = ?auto_98562 ?auto_98566 ) ) ( not ( = ?auto_98563 ?auto_98564 ) ) ( not ( = ?auto_98563 ?auto_98565 ) ) ( not ( = ?auto_98563 ?auto_98566 ) ) ( not ( = ?auto_98564 ?auto_98565 ) ) ( not ( = ?auto_98564 ?auto_98566 ) ) ( not ( = ?auto_98565 ?auto_98566 ) ) ( ON ?auto_98566 ?auto_98567 ) ( not ( = ?auto_98562 ?auto_98567 ) ) ( not ( = ?auto_98563 ?auto_98567 ) ) ( not ( = ?auto_98564 ?auto_98567 ) ) ( not ( = ?auto_98565 ?auto_98567 ) ) ( not ( = ?auto_98566 ?auto_98567 ) ) ( ON ?auto_98565 ?auto_98566 ) ( ON-TABLE ?auto_98568 ) ( ON ?auto_98567 ?auto_98568 ) ( not ( = ?auto_98568 ?auto_98567 ) ) ( not ( = ?auto_98568 ?auto_98566 ) ) ( not ( = ?auto_98568 ?auto_98565 ) ) ( not ( = ?auto_98562 ?auto_98568 ) ) ( not ( = ?auto_98563 ?auto_98568 ) ) ( not ( = ?auto_98564 ?auto_98568 ) ) ( ON ?auto_98564 ?auto_98565 ) ( CLEAR ?auto_98564 ) ( HOLDING ?auto_98563 ) ( CLEAR ?auto_98562 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98562 ?auto_98563 )
      ( MAKE-5PILE ?auto_98562 ?auto_98563 ?auto_98564 ?auto_98565 ?auto_98566 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98569 - BLOCK
      ?auto_98570 - BLOCK
      ?auto_98571 - BLOCK
      ?auto_98572 - BLOCK
      ?auto_98573 - BLOCK
    )
    :vars
    (
      ?auto_98574 - BLOCK
      ?auto_98575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98569 ) ( not ( = ?auto_98569 ?auto_98570 ) ) ( not ( = ?auto_98569 ?auto_98571 ) ) ( not ( = ?auto_98569 ?auto_98572 ) ) ( not ( = ?auto_98569 ?auto_98573 ) ) ( not ( = ?auto_98570 ?auto_98571 ) ) ( not ( = ?auto_98570 ?auto_98572 ) ) ( not ( = ?auto_98570 ?auto_98573 ) ) ( not ( = ?auto_98571 ?auto_98572 ) ) ( not ( = ?auto_98571 ?auto_98573 ) ) ( not ( = ?auto_98572 ?auto_98573 ) ) ( ON ?auto_98573 ?auto_98574 ) ( not ( = ?auto_98569 ?auto_98574 ) ) ( not ( = ?auto_98570 ?auto_98574 ) ) ( not ( = ?auto_98571 ?auto_98574 ) ) ( not ( = ?auto_98572 ?auto_98574 ) ) ( not ( = ?auto_98573 ?auto_98574 ) ) ( ON ?auto_98572 ?auto_98573 ) ( ON-TABLE ?auto_98575 ) ( ON ?auto_98574 ?auto_98575 ) ( not ( = ?auto_98575 ?auto_98574 ) ) ( not ( = ?auto_98575 ?auto_98573 ) ) ( not ( = ?auto_98575 ?auto_98572 ) ) ( not ( = ?auto_98569 ?auto_98575 ) ) ( not ( = ?auto_98570 ?auto_98575 ) ) ( not ( = ?auto_98571 ?auto_98575 ) ) ( ON ?auto_98571 ?auto_98572 ) ( CLEAR ?auto_98569 ) ( ON ?auto_98570 ?auto_98571 ) ( CLEAR ?auto_98570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98575 ?auto_98574 ?auto_98573 ?auto_98572 ?auto_98571 )
      ( MAKE-5PILE ?auto_98569 ?auto_98570 ?auto_98571 ?auto_98572 ?auto_98573 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98576 - BLOCK
      ?auto_98577 - BLOCK
      ?auto_98578 - BLOCK
      ?auto_98579 - BLOCK
      ?auto_98580 - BLOCK
    )
    :vars
    (
      ?auto_98582 - BLOCK
      ?auto_98581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98576 ?auto_98577 ) ) ( not ( = ?auto_98576 ?auto_98578 ) ) ( not ( = ?auto_98576 ?auto_98579 ) ) ( not ( = ?auto_98576 ?auto_98580 ) ) ( not ( = ?auto_98577 ?auto_98578 ) ) ( not ( = ?auto_98577 ?auto_98579 ) ) ( not ( = ?auto_98577 ?auto_98580 ) ) ( not ( = ?auto_98578 ?auto_98579 ) ) ( not ( = ?auto_98578 ?auto_98580 ) ) ( not ( = ?auto_98579 ?auto_98580 ) ) ( ON ?auto_98580 ?auto_98582 ) ( not ( = ?auto_98576 ?auto_98582 ) ) ( not ( = ?auto_98577 ?auto_98582 ) ) ( not ( = ?auto_98578 ?auto_98582 ) ) ( not ( = ?auto_98579 ?auto_98582 ) ) ( not ( = ?auto_98580 ?auto_98582 ) ) ( ON ?auto_98579 ?auto_98580 ) ( ON-TABLE ?auto_98581 ) ( ON ?auto_98582 ?auto_98581 ) ( not ( = ?auto_98581 ?auto_98582 ) ) ( not ( = ?auto_98581 ?auto_98580 ) ) ( not ( = ?auto_98581 ?auto_98579 ) ) ( not ( = ?auto_98576 ?auto_98581 ) ) ( not ( = ?auto_98577 ?auto_98581 ) ) ( not ( = ?auto_98578 ?auto_98581 ) ) ( ON ?auto_98578 ?auto_98579 ) ( ON ?auto_98577 ?auto_98578 ) ( CLEAR ?auto_98577 ) ( HOLDING ?auto_98576 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98576 )
      ( MAKE-5PILE ?auto_98576 ?auto_98577 ?auto_98578 ?auto_98579 ?auto_98580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98583 - BLOCK
      ?auto_98584 - BLOCK
      ?auto_98585 - BLOCK
      ?auto_98586 - BLOCK
      ?auto_98587 - BLOCK
    )
    :vars
    (
      ?auto_98588 - BLOCK
      ?auto_98589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98583 ?auto_98584 ) ) ( not ( = ?auto_98583 ?auto_98585 ) ) ( not ( = ?auto_98583 ?auto_98586 ) ) ( not ( = ?auto_98583 ?auto_98587 ) ) ( not ( = ?auto_98584 ?auto_98585 ) ) ( not ( = ?auto_98584 ?auto_98586 ) ) ( not ( = ?auto_98584 ?auto_98587 ) ) ( not ( = ?auto_98585 ?auto_98586 ) ) ( not ( = ?auto_98585 ?auto_98587 ) ) ( not ( = ?auto_98586 ?auto_98587 ) ) ( ON ?auto_98587 ?auto_98588 ) ( not ( = ?auto_98583 ?auto_98588 ) ) ( not ( = ?auto_98584 ?auto_98588 ) ) ( not ( = ?auto_98585 ?auto_98588 ) ) ( not ( = ?auto_98586 ?auto_98588 ) ) ( not ( = ?auto_98587 ?auto_98588 ) ) ( ON ?auto_98586 ?auto_98587 ) ( ON-TABLE ?auto_98589 ) ( ON ?auto_98588 ?auto_98589 ) ( not ( = ?auto_98589 ?auto_98588 ) ) ( not ( = ?auto_98589 ?auto_98587 ) ) ( not ( = ?auto_98589 ?auto_98586 ) ) ( not ( = ?auto_98583 ?auto_98589 ) ) ( not ( = ?auto_98584 ?auto_98589 ) ) ( not ( = ?auto_98585 ?auto_98589 ) ) ( ON ?auto_98585 ?auto_98586 ) ( ON ?auto_98584 ?auto_98585 ) ( ON ?auto_98583 ?auto_98584 ) ( CLEAR ?auto_98583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98589 ?auto_98588 ?auto_98587 ?auto_98586 ?auto_98585 ?auto_98584 )
      ( MAKE-5PILE ?auto_98583 ?auto_98584 ?auto_98585 ?auto_98586 ?auto_98587 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98595 - BLOCK
      ?auto_98596 - BLOCK
      ?auto_98597 - BLOCK
      ?auto_98598 - BLOCK
      ?auto_98599 - BLOCK
    )
    :vars
    (
      ?auto_98600 - BLOCK
      ?auto_98601 - BLOCK
      ?auto_98602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98595 ?auto_98596 ) ) ( not ( = ?auto_98595 ?auto_98597 ) ) ( not ( = ?auto_98595 ?auto_98598 ) ) ( not ( = ?auto_98595 ?auto_98599 ) ) ( not ( = ?auto_98596 ?auto_98597 ) ) ( not ( = ?auto_98596 ?auto_98598 ) ) ( not ( = ?auto_98596 ?auto_98599 ) ) ( not ( = ?auto_98597 ?auto_98598 ) ) ( not ( = ?auto_98597 ?auto_98599 ) ) ( not ( = ?auto_98598 ?auto_98599 ) ) ( ON ?auto_98599 ?auto_98600 ) ( not ( = ?auto_98595 ?auto_98600 ) ) ( not ( = ?auto_98596 ?auto_98600 ) ) ( not ( = ?auto_98597 ?auto_98600 ) ) ( not ( = ?auto_98598 ?auto_98600 ) ) ( not ( = ?auto_98599 ?auto_98600 ) ) ( ON ?auto_98598 ?auto_98599 ) ( ON-TABLE ?auto_98601 ) ( ON ?auto_98600 ?auto_98601 ) ( not ( = ?auto_98601 ?auto_98600 ) ) ( not ( = ?auto_98601 ?auto_98599 ) ) ( not ( = ?auto_98601 ?auto_98598 ) ) ( not ( = ?auto_98595 ?auto_98601 ) ) ( not ( = ?auto_98596 ?auto_98601 ) ) ( not ( = ?auto_98597 ?auto_98601 ) ) ( ON ?auto_98597 ?auto_98598 ) ( ON ?auto_98596 ?auto_98597 ) ( CLEAR ?auto_98596 ) ( ON ?auto_98595 ?auto_98602 ) ( CLEAR ?auto_98595 ) ( HAND-EMPTY ) ( not ( = ?auto_98595 ?auto_98602 ) ) ( not ( = ?auto_98596 ?auto_98602 ) ) ( not ( = ?auto_98597 ?auto_98602 ) ) ( not ( = ?auto_98598 ?auto_98602 ) ) ( not ( = ?auto_98599 ?auto_98602 ) ) ( not ( = ?auto_98600 ?auto_98602 ) ) ( not ( = ?auto_98601 ?auto_98602 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98595 ?auto_98602 )
      ( MAKE-5PILE ?auto_98595 ?auto_98596 ?auto_98597 ?auto_98598 ?auto_98599 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98603 - BLOCK
      ?auto_98604 - BLOCK
      ?auto_98605 - BLOCK
      ?auto_98606 - BLOCK
      ?auto_98607 - BLOCK
    )
    :vars
    (
      ?auto_98610 - BLOCK
      ?auto_98609 - BLOCK
      ?auto_98608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98603 ?auto_98604 ) ) ( not ( = ?auto_98603 ?auto_98605 ) ) ( not ( = ?auto_98603 ?auto_98606 ) ) ( not ( = ?auto_98603 ?auto_98607 ) ) ( not ( = ?auto_98604 ?auto_98605 ) ) ( not ( = ?auto_98604 ?auto_98606 ) ) ( not ( = ?auto_98604 ?auto_98607 ) ) ( not ( = ?auto_98605 ?auto_98606 ) ) ( not ( = ?auto_98605 ?auto_98607 ) ) ( not ( = ?auto_98606 ?auto_98607 ) ) ( ON ?auto_98607 ?auto_98610 ) ( not ( = ?auto_98603 ?auto_98610 ) ) ( not ( = ?auto_98604 ?auto_98610 ) ) ( not ( = ?auto_98605 ?auto_98610 ) ) ( not ( = ?auto_98606 ?auto_98610 ) ) ( not ( = ?auto_98607 ?auto_98610 ) ) ( ON ?auto_98606 ?auto_98607 ) ( ON-TABLE ?auto_98609 ) ( ON ?auto_98610 ?auto_98609 ) ( not ( = ?auto_98609 ?auto_98610 ) ) ( not ( = ?auto_98609 ?auto_98607 ) ) ( not ( = ?auto_98609 ?auto_98606 ) ) ( not ( = ?auto_98603 ?auto_98609 ) ) ( not ( = ?auto_98604 ?auto_98609 ) ) ( not ( = ?auto_98605 ?auto_98609 ) ) ( ON ?auto_98605 ?auto_98606 ) ( ON ?auto_98603 ?auto_98608 ) ( CLEAR ?auto_98603 ) ( not ( = ?auto_98603 ?auto_98608 ) ) ( not ( = ?auto_98604 ?auto_98608 ) ) ( not ( = ?auto_98605 ?auto_98608 ) ) ( not ( = ?auto_98606 ?auto_98608 ) ) ( not ( = ?auto_98607 ?auto_98608 ) ) ( not ( = ?auto_98610 ?auto_98608 ) ) ( not ( = ?auto_98609 ?auto_98608 ) ) ( HOLDING ?auto_98604 ) ( CLEAR ?auto_98605 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98609 ?auto_98610 ?auto_98607 ?auto_98606 ?auto_98605 ?auto_98604 )
      ( MAKE-5PILE ?auto_98603 ?auto_98604 ?auto_98605 ?auto_98606 ?auto_98607 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98611 - BLOCK
      ?auto_98612 - BLOCK
      ?auto_98613 - BLOCK
      ?auto_98614 - BLOCK
      ?auto_98615 - BLOCK
    )
    :vars
    (
      ?auto_98618 - BLOCK
      ?auto_98616 - BLOCK
      ?auto_98617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98611 ?auto_98612 ) ) ( not ( = ?auto_98611 ?auto_98613 ) ) ( not ( = ?auto_98611 ?auto_98614 ) ) ( not ( = ?auto_98611 ?auto_98615 ) ) ( not ( = ?auto_98612 ?auto_98613 ) ) ( not ( = ?auto_98612 ?auto_98614 ) ) ( not ( = ?auto_98612 ?auto_98615 ) ) ( not ( = ?auto_98613 ?auto_98614 ) ) ( not ( = ?auto_98613 ?auto_98615 ) ) ( not ( = ?auto_98614 ?auto_98615 ) ) ( ON ?auto_98615 ?auto_98618 ) ( not ( = ?auto_98611 ?auto_98618 ) ) ( not ( = ?auto_98612 ?auto_98618 ) ) ( not ( = ?auto_98613 ?auto_98618 ) ) ( not ( = ?auto_98614 ?auto_98618 ) ) ( not ( = ?auto_98615 ?auto_98618 ) ) ( ON ?auto_98614 ?auto_98615 ) ( ON-TABLE ?auto_98616 ) ( ON ?auto_98618 ?auto_98616 ) ( not ( = ?auto_98616 ?auto_98618 ) ) ( not ( = ?auto_98616 ?auto_98615 ) ) ( not ( = ?auto_98616 ?auto_98614 ) ) ( not ( = ?auto_98611 ?auto_98616 ) ) ( not ( = ?auto_98612 ?auto_98616 ) ) ( not ( = ?auto_98613 ?auto_98616 ) ) ( ON ?auto_98613 ?auto_98614 ) ( ON ?auto_98611 ?auto_98617 ) ( not ( = ?auto_98611 ?auto_98617 ) ) ( not ( = ?auto_98612 ?auto_98617 ) ) ( not ( = ?auto_98613 ?auto_98617 ) ) ( not ( = ?auto_98614 ?auto_98617 ) ) ( not ( = ?auto_98615 ?auto_98617 ) ) ( not ( = ?auto_98618 ?auto_98617 ) ) ( not ( = ?auto_98616 ?auto_98617 ) ) ( CLEAR ?auto_98613 ) ( ON ?auto_98612 ?auto_98611 ) ( CLEAR ?auto_98612 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98617 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98617 ?auto_98611 )
      ( MAKE-5PILE ?auto_98611 ?auto_98612 ?auto_98613 ?auto_98614 ?auto_98615 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98619 - BLOCK
      ?auto_98620 - BLOCK
      ?auto_98621 - BLOCK
      ?auto_98622 - BLOCK
      ?auto_98623 - BLOCK
    )
    :vars
    (
      ?auto_98624 - BLOCK
      ?auto_98625 - BLOCK
      ?auto_98626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98619 ?auto_98620 ) ) ( not ( = ?auto_98619 ?auto_98621 ) ) ( not ( = ?auto_98619 ?auto_98622 ) ) ( not ( = ?auto_98619 ?auto_98623 ) ) ( not ( = ?auto_98620 ?auto_98621 ) ) ( not ( = ?auto_98620 ?auto_98622 ) ) ( not ( = ?auto_98620 ?auto_98623 ) ) ( not ( = ?auto_98621 ?auto_98622 ) ) ( not ( = ?auto_98621 ?auto_98623 ) ) ( not ( = ?auto_98622 ?auto_98623 ) ) ( ON ?auto_98623 ?auto_98624 ) ( not ( = ?auto_98619 ?auto_98624 ) ) ( not ( = ?auto_98620 ?auto_98624 ) ) ( not ( = ?auto_98621 ?auto_98624 ) ) ( not ( = ?auto_98622 ?auto_98624 ) ) ( not ( = ?auto_98623 ?auto_98624 ) ) ( ON ?auto_98622 ?auto_98623 ) ( ON-TABLE ?auto_98625 ) ( ON ?auto_98624 ?auto_98625 ) ( not ( = ?auto_98625 ?auto_98624 ) ) ( not ( = ?auto_98625 ?auto_98623 ) ) ( not ( = ?auto_98625 ?auto_98622 ) ) ( not ( = ?auto_98619 ?auto_98625 ) ) ( not ( = ?auto_98620 ?auto_98625 ) ) ( not ( = ?auto_98621 ?auto_98625 ) ) ( ON ?auto_98619 ?auto_98626 ) ( not ( = ?auto_98619 ?auto_98626 ) ) ( not ( = ?auto_98620 ?auto_98626 ) ) ( not ( = ?auto_98621 ?auto_98626 ) ) ( not ( = ?auto_98622 ?auto_98626 ) ) ( not ( = ?auto_98623 ?auto_98626 ) ) ( not ( = ?auto_98624 ?auto_98626 ) ) ( not ( = ?auto_98625 ?auto_98626 ) ) ( ON ?auto_98620 ?auto_98619 ) ( CLEAR ?auto_98620 ) ( ON-TABLE ?auto_98626 ) ( HOLDING ?auto_98621 ) ( CLEAR ?auto_98622 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98625 ?auto_98624 ?auto_98623 ?auto_98622 ?auto_98621 )
      ( MAKE-5PILE ?auto_98619 ?auto_98620 ?auto_98621 ?auto_98622 ?auto_98623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98627 - BLOCK
      ?auto_98628 - BLOCK
      ?auto_98629 - BLOCK
      ?auto_98630 - BLOCK
      ?auto_98631 - BLOCK
    )
    :vars
    (
      ?auto_98632 - BLOCK
      ?auto_98634 - BLOCK
      ?auto_98633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98627 ?auto_98628 ) ) ( not ( = ?auto_98627 ?auto_98629 ) ) ( not ( = ?auto_98627 ?auto_98630 ) ) ( not ( = ?auto_98627 ?auto_98631 ) ) ( not ( = ?auto_98628 ?auto_98629 ) ) ( not ( = ?auto_98628 ?auto_98630 ) ) ( not ( = ?auto_98628 ?auto_98631 ) ) ( not ( = ?auto_98629 ?auto_98630 ) ) ( not ( = ?auto_98629 ?auto_98631 ) ) ( not ( = ?auto_98630 ?auto_98631 ) ) ( ON ?auto_98631 ?auto_98632 ) ( not ( = ?auto_98627 ?auto_98632 ) ) ( not ( = ?auto_98628 ?auto_98632 ) ) ( not ( = ?auto_98629 ?auto_98632 ) ) ( not ( = ?auto_98630 ?auto_98632 ) ) ( not ( = ?auto_98631 ?auto_98632 ) ) ( ON ?auto_98630 ?auto_98631 ) ( ON-TABLE ?auto_98634 ) ( ON ?auto_98632 ?auto_98634 ) ( not ( = ?auto_98634 ?auto_98632 ) ) ( not ( = ?auto_98634 ?auto_98631 ) ) ( not ( = ?auto_98634 ?auto_98630 ) ) ( not ( = ?auto_98627 ?auto_98634 ) ) ( not ( = ?auto_98628 ?auto_98634 ) ) ( not ( = ?auto_98629 ?auto_98634 ) ) ( ON ?auto_98627 ?auto_98633 ) ( not ( = ?auto_98627 ?auto_98633 ) ) ( not ( = ?auto_98628 ?auto_98633 ) ) ( not ( = ?auto_98629 ?auto_98633 ) ) ( not ( = ?auto_98630 ?auto_98633 ) ) ( not ( = ?auto_98631 ?auto_98633 ) ) ( not ( = ?auto_98632 ?auto_98633 ) ) ( not ( = ?auto_98634 ?auto_98633 ) ) ( ON ?auto_98628 ?auto_98627 ) ( ON-TABLE ?auto_98633 ) ( CLEAR ?auto_98630 ) ( ON ?auto_98629 ?auto_98628 ) ( CLEAR ?auto_98629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98633 ?auto_98627 ?auto_98628 )
      ( MAKE-5PILE ?auto_98627 ?auto_98628 ?auto_98629 ?auto_98630 ?auto_98631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98635 - BLOCK
      ?auto_98636 - BLOCK
      ?auto_98637 - BLOCK
      ?auto_98638 - BLOCK
      ?auto_98639 - BLOCK
    )
    :vars
    (
      ?auto_98641 - BLOCK
      ?auto_98640 - BLOCK
      ?auto_98642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98635 ?auto_98636 ) ) ( not ( = ?auto_98635 ?auto_98637 ) ) ( not ( = ?auto_98635 ?auto_98638 ) ) ( not ( = ?auto_98635 ?auto_98639 ) ) ( not ( = ?auto_98636 ?auto_98637 ) ) ( not ( = ?auto_98636 ?auto_98638 ) ) ( not ( = ?auto_98636 ?auto_98639 ) ) ( not ( = ?auto_98637 ?auto_98638 ) ) ( not ( = ?auto_98637 ?auto_98639 ) ) ( not ( = ?auto_98638 ?auto_98639 ) ) ( ON ?auto_98639 ?auto_98641 ) ( not ( = ?auto_98635 ?auto_98641 ) ) ( not ( = ?auto_98636 ?auto_98641 ) ) ( not ( = ?auto_98637 ?auto_98641 ) ) ( not ( = ?auto_98638 ?auto_98641 ) ) ( not ( = ?auto_98639 ?auto_98641 ) ) ( ON-TABLE ?auto_98640 ) ( ON ?auto_98641 ?auto_98640 ) ( not ( = ?auto_98640 ?auto_98641 ) ) ( not ( = ?auto_98640 ?auto_98639 ) ) ( not ( = ?auto_98640 ?auto_98638 ) ) ( not ( = ?auto_98635 ?auto_98640 ) ) ( not ( = ?auto_98636 ?auto_98640 ) ) ( not ( = ?auto_98637 ?auto_98640 ) ) ( ON ?auto_98635 ?auto_98642 ) ( not ( = ?auto_98635 ?auto_98642 ) ) ( not ( = ?auto_98636 ?auto_98642 ) ) ( not ( = ?auto_98637 ?auto_98642 ) ) ( not ( = ?auto_98638 ?auto_98642 ) ) ( not ( = ?auto_98639 ?auto_98642 ) ) ( not ( = ?auto_98641 ?auto_98642 ) ) ( not ( = ?auto_98640 ?auto_98642 ) ) ( ON ?auto_98636 ?auto_98635 ) ( ON-TABLE ?auto_98642 ) ( ON ?auto_98637 ?auto_98636 ) ( CLEAR ?auto_98637 ) ( HOLDING ?auto_98638 ) ( CLEAR ?auto_98639 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98640 ?auto_98641 ?auto_98639 ?auto_98638 )
      ( MAKE-5PILE ?auto_98635 ?auto_98636 ?auto_98637 ?auto_98638 ?auto_98639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98643 - BLOCK
      ?auto_98644 - BLOCK
      ?auto_98645 - BLOCK
      ?auto_98646 - BLOCK
      ?auto_98647 - BLOCK
    )
    :vars
    (
      ?auto_98650 - BLOCK
      ?auto_98649 - BLOCK
      ?auto_98648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98643 ?auto_98644 ) ) ( not ( = ?auto_98643 ?auto_98645 ) ) ( not ( = ?auto_98643 ?auto_98646 ) ) ( not ( = ?auto_98643 ?auto_98647 ) ) ( not ( = ?auto_98644 ?auto_98645 ) ) ( not ( = ?auto_98644 ?auto_98646 ) ) ( not ( = ?auto_98644 ?auto_98647 ) ) ( not ( = ?auto_98645 ?auto_98646 ) ) ( not ( = ?auto_98645 ?auto_98647 ) ) ( not ( = ?auto_98646 ?auto_98647 ) ) ( ON ?auto_98647 ?auto_98650 ) ( not ( = ?auto_98643 ?auto_98650 ) ) ( not ( = ?auto_98644 ?auto_98650 ) ) ( not ( = ?auto_98645 ?auto_98650 ) ) ( not ( = ?auto_98646 ?auto_98650 ) ) ( not ( = ?auto_98647 ?auto_98650 ) ) ( ON-TABLE ?auto_98649 ) ( ON ?auto_98650 ?auto_98649 ) ( not ( = ?auto_98649 ?auto_98650 ) ) ( not ( = ?auto_98649 ?auto_98647 ) ) ( not ( = ?auto_98649 ?auto_98646 ) ) ( not ( = ?auto_98643 ?auto_98649 ) ) ( not ( = ?auto_98644 ?auto_98649 ) ) ( not ( = ?auto_98645 ?auto_98649 ) ) ( ON ?auto_98643 ?auto_98648 ) ( not ( = ?auto_98643 ?auto_98648 ) ) ( not ( = ?auto_98644 ?auto_98648 ) ) ( not ( = ?auto_98645 ?auto_98648 ) ) ( not ( = ?auto_98646 ?auto_98648 ) ) ( not ( = ?auto_98647 ?auto_98648 ) ) ( not ( = ?auto_98650 ?auto_98648 ) ) ( not ( = ?auto_98649 ?auto_98648 ) ) ( ON ?auto_98644 ?auto_98643 ) ( ON-TABLE ?auto_98648 ) ( ON ?auto_98645 ?auto_98644 ) ( CLEAR ?auto_98647 ) ( ON ?auto_98646 ?auto_98645 ) ( CLEAR ?auto_98646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98648 ?auto_98643 ?auto_98644 ?auto_98645 )
      ( MAKE-5PILE ?auto_98643 ?auto_98644 ?auto_98645 ?auto_98646 ?auto_98647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98651 - BLOCK
      ?auto_98652 - BLOCK
      ?auto_98653 - BLOCK
      ?auto_98654 - BLOCK
      ?auto_98655 - BLOCK
    )
    :vars
    (
      ?auto_98658 - BLOCK
      ?auto_98657 - BLOCK
      ?auto_98656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98651 ?auto_98652 ) ) ( not ( = ?auto_98651 ?auto_98653 ) ) ( not ( = ?auto_98651 ?auto_98654 ) ) ( not ( = ?auto_98651 ?auto_98655 ) ) ( not ( = ?auto_98652 ?auto_98653 ) ) ( not ( = ?auto_98652 ?auto_98654 ) ) ( not ( = ?auto_98652 ?auto_98655 ) ) ( not ( = ?auto_98653 ?auto_98654 ) ) ( not ( = ?auto_98653 ?auto_98655 ) ) ( not ( = ?auto_98654 ?auto_98655 ) ) ( not ( = ?auto_98651 ?auto_98658 ) ) ( not ( = ?auto_98652 ?auto_98658 ) ) ( not ( = ?auto_98653 ?auto_98658 ) ) ( not ( = ?auto_98654 ?auto_98658 ) ) ( not ( = ?auto_98655 ?auto_98658 ) ) ( ON-TABLE ?auto_98657 ) ( ON ?auto_98658 ?auto_98657 ) ( not ( = ?auto_98657 ?auto_98658 ) ) ( not ( = ?auto_98657 ?auto_98655 ) ) ( not ( = ?auto_98657 ?auto_98654 ) ) ( not ( = ?auto_98651 ?auto_98657 ) ) ( not ( = ?auto_98652 ?auto_98657 ) ) ( not ( = ?auto_98653 ?auto_98657 ) ) ( ON ?auto_98651 ?auto_98656 ) ( not ( = ?auto_98651 ?auto_98656 ) ) ( not ( = ?auto_98652 ?auto_98656 ) ) ( not ( = ?auto_98653 ?auto_98656 ) ) ( not ( = ?auto_98654 ?auto_98656 ) ) ( not ( = ?auto_98655 ?auto_98656 ) ) ( not ( = ?auto_98658 ?auto_98656 ) ) ( not ( = ?auto_98657 ?auto_98656 ) ) ( ON ?auto_98652 ?auto_98651 ) ( ON-TABLE ?auto_98656 ) ( ON ?auto_98653 ?auto_98652 ) ( ON ?auto_98654 ?auto_98653 ) ( CLEAR ?auto_98654 ) ( HOLDING ?auto_98655 ) ( CLEAR ?auto_98658 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98657 ?auto_98658 ?auto_98655 )
      ( MAKE-5PILE ?auto_98651 ?auto_98652 ?auto_98653 ?auto_98654 ?auto_98655 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98659 - BLOCK
      ?auto_98660 - BLOCK
      ?auto_98661 - BLOCK
      ?auto_98662 - BLOCK
      ?auto_98663 - BLOCK
    )
    :vars
    (
      ?auto_98666 - BLOCK
      ?auto_98664 - BLOCK
      ?auto_98665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98659 ?auto_98660 ) ) ( not ( = ?auto_98659 ?auto_98661 ) ) ( not ( = ?auto_98659 ?auto_98662 ) ) ( not ( = ?auto_98659 ?auto_98663 ) ) ( not ( = ?auto_98660 ?auto_98661 ) ) ( not ( = ?auto_98660 ?auto_98662 ) ) ( not ( = ?auto_98660 ?auto_98663 ) ) ( not ( = ?auto_98661 ?auto_98662 ) ) ( not ( = ?auto_98661 ?auto_98663 ) ) ( not ( = ?auto_98662 ?auto_98663 ) ) ( not ( = ?auto_98659 ?auto_98666 ) ) ( not ( = ?auto_98660 ?auto_98666 ) ) ( not ( = ?auto_98661 ?auto_98666 ) ) ( not ( = ?auto_98662 ?auto_98666 ) ) ( not ( = ?auto_98663 ?auto_98666 ) ) ( ON-TABLE ?auto_98664 ) ( ON ?auto_98666 ?auto_98664 ) ( not ( = ?auto_98664 ?auto_98666 ) ) ( not ( = ?auto_98664 ?auto_98663 ) ) ( not ( = ?auto_98664 ?auto_98662 ) ) ( not ( = ?auto_98659 ?auto_98664 ) ) ( not ( = ?auto_98660 ?auto_98664 ) ) ( not ( = ?auto_98661 ?auto_98664 ) ) ( ON ?auto_98659 ?auto_98665 ) ( not ( = ?auto_98659 ?auto_98665 ) ) ( not ( = ?auto_98660 ?auto_98665 ) ) ( not ( = ?auto_98661 ?auto_98665 ) ) ( not ( = ?auto_98662 ?auto_98665 ) ) ( not ( = ?auto_98663 ?auto_98665 ) ) ( not ( = ?auto_98666 ?auto_98665 ) ) ( not ( = ?auto_98664 ?auto_98665 ) ) ( ON ?auto_98660 ?auto_98659 ) ( ON-TABLE ?auto_98665 ) ( ON ?auto_98661 ?auto_98660 ) ( ON ?auto_98662 ?auto_98661 ) ( CLEAR ?auto_98666 ) ( ON ?auto_98663 ?auto_98662 ) ( CLEAR ?auto_98663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98665 ?auto_98659 ?auto_98660 ?auto_98661 ?auto_98662 )
      ( MAKE-5PILE ?auto_98659 ?auto_98660 ?auto_98661 ?auto_98662 ?auto_98663 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98667 - BLOCK
      ?auto_98668 - BLOCK
      ?auto_98669 - BLOCK
      ?auto_98670 - BLOCK
      ?auto_98671 - BLOCK
    )
    :vars
    (
      ?auto_98673 - BLOCK
      ?auto_98672 - BLOCK
      ?auto_98674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98667 ?auto_98668 ) ) ( not ( = ?auto_98667 ?auto_98669 ) ) ( not ( = ?auto_98667 ?auto_98670 ) ) ( not ( = ?auto_98667 ?auto_98671 ) ) ( not ( = ?auto_98668 ?auto_98669 ) ) ( not ( = ?auto_98668 ?auto_98670 ) ) ( not ( = ?auto_98668 ?auto_98671 ) ) ( not ( = ?auto_98669 ?auto_98670 ) ) ( not ( = ?auto_98669 ?auto_98671 ) ) ( not ( = ?auto_98670 ?auto_98671 ) ) ( not ( = ?auto_98667 ?auto_98673 ) ) ( not ( = ?auto_98668 ?auto_98673 ) ) ( not ( = ?auto_98669 ?auto_98673 ) ) ( not ( = ?auto_98670 ?auto_98673 ) ) ( not ( = ?auto_98671 ?auto_98673 ) ) ( ON-TABLE ?auto_98672 ) ( not ( = ?auto_98672 ?auto_98673 ) ) ( not ( = ?auto_98672 ?auto_98671 ) ) ( not ( = ?auto_98672 ?auto_98670 ) ) ( not ( = ?auto_98667 ?auto_98672 ) ) ( not ( = ?auto_98668 ?auto_98672 ) ) ( not ( = ?auto_98669 ?auto_98672 ) ) ( ON ?auto_98667 ?auto_98674 ) ( not ( = ?auto_98667 ?auto_98674 ) ) ( not ( = ?auto_98668 ?auto_98674 ) ) ( not ( = ?auto_98669 ?auto_98674 ) ) ( not ( = ?auto_98670 ?auto_98674 ) ) ( not ( = ?auto_98671 ?auto_98674 ) ) ( not ( = ?auto_98673 ?auto_98674 ) ) ( not ( = ?auto_98672 ?auto_98674 ) ) ( ON ?auto_98668 ?auto_98667 ) ( ON-TABLE ?auto_98674 ) ( ON ?auto_98669 ?auto_98668 ) ( ON ?auto_98670 ?auto_98669 ) ( ON ?auto_98671 ?auto_98670 ) ( CLEAR ?auto_98671 ) ( HOLDING ?auto_98673 ) ( CLEAR ?auto_98672 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98672 ?auto_98673 )
      ( MAKE-5PILE ?auto_98667 ?auto_98668 ?auto_98669 ?auto_98670 ?auto_98671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98675 - BLOCK
      ?auto_98676 - BLOCK
      ?auto_98677 - BLOCK
      ?auto_98678 - BLOCK
      ?auto_98679 - BLOCK
    )
    :vars
    (
      ?auto_98682 - BLOCK
      ?auto_98680 - BLOCK
      ?auto_98681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98675 ?auto_98676 ) ) ( not ( = ?auto_98675 ?auto_98677 ) ) ( not ( = ?auto_98675 ?auto_98678 ) ) ( not ( = ?auto_98675 ?auto_98679 ) ) ( not ( = ?auto_98676 ?auto_98677 ) ) ( not ( = ?auto_98676 ?auto_98678 ) ) ( not ( = ?auto_98676 ?auto_98679 ) ) ( not ( = ?auto_98677 ?auto_98678 ) ) ( not ( = ?auto_98677 ?auto_98679 ) ) ( not ( = ?auto_98678 ?auto_98679 ) ) ( not ( = ?auto_98675 ?auto_98682 ) ) ( not ( = ?auto_98676 ?auto_98682 ) ) ( not ( = ?auto_98677 ?auto_98682 ) ) ( not ( = ?auto_98678 ?auto_98682 ) ) ( not ( = ?auto_98679 ?auto_98682 ) ) ( ON-TABLE ?auto_98680 ) ( not ( = ?auto_98680 ?auto_98682 ) ) ( not ( = ?auto_98680 ?auto_98679 ) ) ( not ( = ?auto_98680 ?auto_98678 ) ) ( not ( = ?auto_98675 ?auto_98680 ) ) ( not ( = ?auto_98676 ?auto_98680 ) ) ( not ( = ?auto_98677 ?auto_98680 ) ) ( ON ?auto_98675 ?auto_98681 ) ( not ( = ?auto_98675 ?auto_98681 ) ) ( not ( = ?auto_98676 ?auto_98681 ) ) ( not ( = ?auto_98677 ?auto_98681 ) ) ( not ( = ?auto_98678 ?auto_98681 ) ) ( not ( = ?auto_98679 ?auto_98681 ) ) ( not ( = ?auto_98682 ?auto_98681 ) ) ( not ( = ?auto_98680 ?auto_98681 ) ) ( ON ?auto_98676 ?auto_98675 ) ( ON-TABLE ?auto_98681 ) ( ON ?auto_98677 ?auto_98676 ) ( ON ?auto_98678 ?auto_98677 ) ( ON ?auto_98679 ?auto_98678 ) ( CLEAR ?auto_98680 ) ( ON ?auto_98682 ?auto_98679 ) ( CLEAR ?auto_98682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98681 ?auto_98675 ?auto_98676 ?auto_98677 ?auto_98678 ?auto_98679 )
      ( MAKE-5PILE ?auto_98675 ?auto_98676 ?auto_98677 ?auto_98678 ?auto_98679 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98683 - BLOCK
      ?auto_98684 - BLOCK
      ?auto_98685 - BLOCK
      ?auto_98686 - BLOCK
      ?auto_98687 - BLOCK
    )
    :vars
    (
      ?auto_98689 - BLOCK
      ?auto_98690 - BLOCK
      ?auto_98688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98683 ?auto_98684 ) ) ( not ( = ?auto_98683 ?auto_98685 ) ) ( not ( = ?auto_98683 ?auto_98686 ) ) ( not ( = ?auto_98683 ?auto_98687 ) ) ( not ( = ?auto_98684 ?auto_98685 ) ) ( not ( = ?auto_98684 ?auto_98686 ) ) ( not ( = ?auto_98684 ?auto_98687 ) ) ( not ( = ?auto_98685 ?auto_98686 ) ) ( not ( = ?auto_98685 ?auto_98687 ) ) ( not ( = ?auto_98686 ?auto_98687 ) ) ( not ( = ?auto_98683 ?auto_98689 ) ) ( not ( = ?auto_98684 ?auto_98689 ) ) ( not ( = ?auto_98685 ?auto_98689 ) ) ( not ( = ?auto_98686 ?auto_98689 ) ) ( not ( = ?auto_98687 ?auto_98689 ) ) ( not ( = ?auto_98690 ?auto_98689 ) ) ( not ( = ?auto_98690 ?auto_98687 ) ) ( not ( = ?auto_98690 ?auto_98686 ) ) ( not ( = ?auto_98683 ?auto_98690 ) ) ( not ( = ?auto_98684 ?auto_98690 ) ) ( not ( = ?auto_98685 ?auto_98690 ) ) ( ON ?auto_98683 ?auto_98688 ) ( not ( = ?auto_98683 ?auto_98688 ) ) ( not ( = ?auto_98684 ?auto_98688 ) ) ( not ( = ?auto_98685 ?auto_98688 ) ) ( not ( = ?auto_98686 ?auto_98688 ) ) ( not ( = ?auto_98687 ?auto_98688 ) ) ( not ( = ?auto_98689 ?auto_98688 ) ) ( not ( = ?auto_98690 ?auto_98688 ) ) ( ON ?auto_98684 ?auto_98683 ) ( ON-TABLE ?auto_98688 ) ( ON ?auto_98685 ?auto_98684 ) ( ON ?auto_98686 ?auto_98685 ) ( ON ?auto_98687 ?auto_98686 ) ( ON ?auto_98689 ?auto_98687 ) ( CLEAR ?auto_98689 ) ( HOLDING ?auto_98690 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98690 )
      ( MAKE-5PILE ?auto_98683 ?auto_98684 ?auto_98685 ?auto_98686 ?auto_98687 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_98691 - BLOCK
      ?auto_98692 - BLOCK
      ?auto_98693 - BLOCK
      ?auto_98694 - BLOCK
      ?auto_98695 - BLOCK
    )
    :vars
    (
      ?auto_98697 - BLOCK
      ?auto_98698 - BLOCK
      ?auto_98696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98691 ?auto_98692 ) ) ( not ( = ?auto_98691 ?auto_98693 ) ) ( not ( = ?auto_98691 ?auto_98694 ) ) ( not ( = ?auto_98691 ?auto_98695 ) ) ( not ( = ?auto_98692 ?auto_98693 ) ) ( not ( = ?auto_98692 ?auto_98694 ) ) ( not ( = ?auto_98692 ?auto_98695 ) ) ( not ( = ?auto_98693 ?auto_98694 ) ) ( not ( = ?auto_98693 ?auto_98695 ) ) ( not ( = ?auto_98694 ?auto_98695 ) ) ( not ( = ?auto_98691 ?auto_98697 ) ) ( not ( = ?auto_98692 ?auto_98697 ) ) ( not ( = ?auto_98693 ?auto_98697 ) ) ( not ( = ?auto_98694 ?auto_98697 ) ) ( not ( = ?auto_98695 ?auto_98697 ) ) ( not ( = ?auto_98698 ?auto_98697 ) ) ( not ( = ?auto_98698 ?auto_98695 ) ) ( not ( = ?auto_98698 ?auto_98694 ) ) ( not ( = ?auto_98691 ?auto_98698 ) ) ( not ( = ?auto_98692 ?auto_98698 ) ) ( not ( = ?auto_98693 ?auto_98698 ) ) ( ON ?auto_98691 ?auto_98696 ) ( not ( = ?auto_98691 ?auto_98696 ) ) ( not ( = ?auto_98692 ?auto_98696 ) ) ( not ( = ?auto_98693 ?auto_98696 ) ) ( not ( = ?auto_98694 ?auto_98696 ) ) ( not ( = ?auto_98695 ?auto_98696 ) ) ( not ( = ?auto_98697 ?auto_98696 ) ) ( not ( = ?auto_98698 ?auto_98696 ) ) ( ON ?auto_98692 ?auto_98691 ) ( ON-TABLE ?auto_98696 ) ( ON ?auto_98693 ?auto_98692 ) ( ON ?auto_98694 ?auto_98693 ) ( ON ?auto_98695 ?auto_98694 ) ( ON ?auto_98697 ?auto_98695 ) ( ON ?auto_98698 ?auto_98697 ) ( CLEAR ?auto_98698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_98696 ?auto_98691 ?auto_98692 ?auto_98693 ?auto_98694 ?auto_98695 ?auto_98697 )
      ( MAKE-5PILE ?auto_98691 ?auto_98692 ?auto_98693 ?auto_98694 ?auto_98695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98710 - BLOCK
    )
    :vars
    (
      ?auto_98713 - BLOCK
      ?auto_98712 - BLOCK
      ?auto_98711 - BLOCK
      ?auto_98714 - BLOCK
      ?auto_98715 - BLOCK
      ?auto_98716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98713 ?auto_98710 ) ( ON-TABLE ?auto_98710 ) ( not ( = ?auto_98710 ?auto_98713 ) ) ( not ( = ?auto_98710 ?auto_98712 ) ) ( not ( = ?auto_98710 ?auto_98711 ) ) ( not ( = ?auto_98713 ?auto_98712 ) ) ( not ( = ?auto_98713 ?auto_98711 ) ) ( not ( = ?auto_98712 ?auto_98711 ) ) ( ON ?auto_98712 ?auto_98713 ) ( CLEAR ?auto_98712 ) ( HOLDING ?auto_98711 ) ( CLEAR ?auto_98714 ) ( ON-TABLE ?auto_98715 ) ( ON ?auto_98716 ?auto_98715 ) ( ON ?auto_98714 ?auto_98716 ) ( not ( = ?auto_98715 ?auto_98716 ) ) ( not ( = ?auto_98715 ?auto_98714 ) ) ( not ( = ?auto_98715 ?auto_98711 ) ) ( not ( = ?auto_98716 ?auto_98714 ) ) ( not ( = ?auto_98716 ?auto_98711 ) ) ( not ( = ?auto_98714 ?auto_98711 ) ) ( not ( = ?auto_98710 ?auto_98714 ) ) ( not ( = ?auto_98710 ?auto_98715 ) ) ( not ( = ?auto_98710 ?auto_98716 ) ) ( not ( = ?auto_98713 ?auto_98714 ) ) ( not ( = ?auto_98713 ?auto_98715 ) ) ( not ( = ?auto_98713 ?auto_98716 ) ) ( not ( = ?auto_98712 ?auto_98714 ) ) ( not ( = ?auto_98712 ?auto_98715 ) ) ( not ( = ?auto_98712 ?auto_98716 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98715 ?auto_98716 ?auto_98714 ?auto_98711 )
      ( MAKE-1PILE ?auto_98710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98717 - BLOCK
    )
    :vars
    (
      ?auto_98723 - BLOCK
      ?auto_98722 - BLOCK
      ?auto_98721 - BLOCK
      ?auto_98719 - BLOCK
      ?auto_98720 - BLOCK
      ?auto_98718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98723 ?auto_98717 ) ( ON-TABLE ?auto_98717 ) ( not ( = ?auto_98717 ?auto_98723 ) ) ( not ( = ?auto_98717 ?auto_98722 ) ) ( not ( = ?auto_98717 ?auto_98721 ) ) ( not ( = ?auto_98723 ?auto_98722 ) ) ( not ( = ?auto_98723 ?auto_98721 ) ) ( not ( = ?auto_98722 ?auto_98721 ) ) ( ON ?auto_98722 ?auto_98723 ) ( CLEAR ?auto_98719 ) ( ON-TABLE ?auto_98720 ) ( ON ?auto_98718 ?auto_98720 ) ( ON ?auto_98719 ?auto_98718 ) ( not ( = ?auto_98720 ?auto_98718 ) ) ( not ( = ?auto_98720 ?auto_98719 ) ) ( not ( = ?auto_98720 ?auto_98721 ) ) ( not ( = ?auto_98718 ?auto_98719 ) ) ( not ( = ?auto_98718 ?auto_98721 ) ) ( not ( = ?auto_98719 ?auto_98721 ) ) ( not ( = ?auto_98717 ?auto_98719 ) ) ( not ( = ?auto_98717 ?auto_98720 ) ) ( not ( = ?auto_98717 ?auto_98718 ) ) ( not ( = ?auto_98723 ?auto_98719 ) ) ( not ( = ?auto_98723 ?auto_98720 ) ) ( not ( = ?auto_98723 ?auto_98718 ) ) ( not ( = ?auto_98722 ?auto_98719 ) ) ( not ( = ?auto_98722 ?auto_98720 ) ) ( not ( = ?auto_98722 ?auto_98718 ) ) ( ON ?auto_98721 ?auto_98722 ) ( CLEAR ?auto_98721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98717 ?auto_98723 ?auto_98722 )
      ( MAKE-1PILE ?auto_98717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98724 - BLOCK
    )
    :vars
    (
      ?auto_98728 - BLOCK
      ?auto_98730 - BLOCK
      ?auto_98727 - BLOCK
      ?auto_98725 - BLOCK
      ?auto_98729 - BLOCK
      ?auto_98726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98728 ?auto_98724 ) ( ON-TABLE ?auto_98724 ) ( not ( = ?auto_98724 ?auto_98728 ) ) ( not ( = ?auto_98724 ?auto_98730 ) ) ( not ( = ?auto_98724 ?auto_98727 ) ) ( not ( = ?auto_98728 ?auto_98730 ) ) ( not ( = ?auto_98728 ?auto_98727 ) ) ( not ( = ?auto_98730 ?auto_98727 ) ) ( ON ?auto_98730 ?auto_98728 ) ( ON-TABLE ?auto_98725 ) ( ON ?auto_98729 ?auto_98725 ) ( not ( = ?auto_98725 ?auto_98729 ) ) ( not ( = ?auto_98725 ?auto_98726 ) ) ( not ( = ?auto_98725 ?auto_98727 ) ) ( not ( = ?auto_98729 ?auto_98726 ) ) ( not ( = ?auto_98729 ?auto_98727 ) ) ( not ( = ?auto_98726 ?auto_98727 ) ) ( not ( = ?auto_98724 ?auto_98726 ) ) ( not ( = ?auto_98724 ?auto_98725 ) ) ( not ( = ?auto_98724 ?auto_98729 ) ) ( not ( = ?auto_98728 ?auto_98726 ) ) ( not ( = ?auto_98728 ?auto_98725 ) ) ( not ( = ?auto_98728 ?auto_98729 ) ) ( not ( = ?auto_98730 ?auto_98726 ) ) ( not ( = ?auto_98730 ?auto_98725 ) ) ( not ( = ?auto_98730 ?auto_98729 ) ) ( ON ?auto_98727 ?auto_98730 ) ( CLEAR ?auto_98727 ) ( HOLDING ?auto_98726 ) ( CLEAR ?auto_98729 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98725 ?auto_98729 ?auto_98726 )
      ( MAKE-1PILE ?auto_98724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98731 - BLOCK
    )
    :vars
    (
      ?auto_98736 - BLOCK
      ?auto_98735 - BLOCK
      ?auto_98732 - BLOCK
      ?auto_98733 - BLOCK
      ?auto_98734 - BLOCK
      ?auto_98737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98736 ?auto_98731 ) ( ON-TABLE ?auto_98731 ) ( not ( = ?auto_98731 ?auto_98736 ) ) ( not ( = ?auto_98731 ?auto_98735 ) ) ( not ( = ?auto_98731 ?auto_98732 ) ) ( not ( = ?auto_98736 ?auto_98735 ) ) ( not ( = ?auto_98736 ?auto_98732 ) ) ( not ( = ?auto_98735 ?auto_98732 ) ) ( ON ?auto_98735 ?auto_98736 ) ( ON-TABLE ?auto_98733 ) ( ON ?auto_98734 ?auto_98733 ) ( not ( = ?auto_98733 ?auto_98734 ) ) ( not ( = ?auto_98733 ?auto_98737 ) ) ( not ( = ?auto_98733 ?auto_98732 ) ) ( not ( = ?auto_98734 ?auto_98737 ) ) ( not ( = ?auto_98734 ?auto_98732 ) ) ( not ( = ?auto_98737 ?auto_98732 ) ) ( not ( = ?auto_98731 ?auto_98737 ) ) ( not ( = ?auto_98731 ?auto_98733 ) ) ( not ( = ?auto_98731 ?auto_98734 ) ) ( not ( = ?auto_98736 ?auto_98737 ) ) ( not ( = ?auto_98736 ?auto_98733 ) ) ( not ( = ?auto_98736 ?auto_98734 ) ) ( not ( = ?auto_98735 ?auto_98737 ) ) ( not ( = ?auto_98735 ?auto_98733 ) ) ( not ( = ?auto_98735 ?auto_98734 ) ) ( ON ?auto_98732 ?auto_98735 ) ( CLEAR ?auto_98734 ) ( ON ?auto_98737 ?auto_98732 ) ( CLEAR ?auto_98737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98731 ?auto_98736 ?auto_98735 ?auto_98732 )
      ( MAKE-1PILE ?auto_98731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98738 - BLOCK
    )
    :vars
    (
      ?auto_98741 - BLOCK
      ?auto_98743 - BLOCK
      ?auto_98744 - BLOCK
      ?auto_98742 - BLOCK
      ?auto_98740 - BLOCK
      ?auto_98739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98741 ?auto_98738 ) ( ON-TABLE ?auto_98738 ) ( not ( = ?auto_98738 ?auto_98741 ) ) ( not ( = ?auto_98738 ?auto_98743 ) ) ( not ( = ?auto_98738 ?auto_98744 ) ) ( not ( = ?auto_98741 ?auto_98743 ) ) ( not ( = ?auto_98741 ?auto_98744 ) ) ( not ( = ?auto_98743 ?auto_98744 ) ) ( ON ?auto_98743 ?auto_98741 ) ( ON-TABLE ?auto_98742 ) ( not ( = ?auto_98742 ?auto_98740 ) ) ( not ( = ?auto_98742 ?auto_98739 ) ) ( not ( = ?auto_98742 ?auto_98744 ) ) ( not ( = ?auto_98740 ?auto_98739 ) ) ( not ( = ?auto_98740 ?auto_98744 ) ) ( not ( = ?auto_98739 ?auto_98744 ) ) ( not ( = ?auto_98738 ?auto_98739 ) ) ( not ( = ?auto_98738 ?auto_98742 ) ) ( not ( = ?auto_98738 ?auto_98740 ) ) ( not ( = ?auto_98741 ?auto_98739 ) ) ( not ( = ?auto_98741 ?auto_98742 ) ) ( not ( = ?auto_98741 ?auto_98740 ) ) ( not ( = ?auto_98743 ?auto_98739 ) ) ( not ( = ?auto_98743 ?auto_98742 ) ) ( not ( = ?auto_98743 ?auto_98740 ) ) ( ON ?auto_98744 ?auto_98743 ) ( ON ?auto_98739 ?auto_98744 ) ( CLEAR ?auto_98739 ) ( HOLDING ?auto_98740 ) ( CLEAR ?auto_98742 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98742 ?auto_98740 )
      ( MAKE-1PILE ?auto_98738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98745 - BLOCK
    )
    :vars
    (
      ?auto_98750 - BLOCK
      ?auto_98746 - BLOCK
      ?auto_98748 - BLOCK
      ?auto_98749 - BLOCK
      ?auto_98751 - BLOCK
      ?auto_98747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98750 ?auto_98745 ) ( ON-TABLE ?auto_98745 ) ( not ( = ?auto_98745 ?auto_98750 ) ) ( not ( = ?auto_98745 ?auto_98746 ) ) ( not ( = ?auto_98745 ?auto_98748 ) ) ( not ( = ?auto_98750 ?auto_98746 ) ) ( not ( = ?auto_98750 ?auto_98748 ) ) ( not ( = ?auto_98746 ?auto_98748 ) ) ( ON ?auto_98746 ?auto_98750 ) ( ON-TABLE ?auto_98749 ) ( not ( = ?auto_98749 ?auto_98751 ) ) ( not ( = ?auto_98749 ?auto_98747 ) ) ( not ( = ?auto_98749 ?auto_98748 ) ) ( not ( = ?auto_98751 ?auto_98747 ) ) ( not ( = ?auto_98751 ?auto_98748 ) ) ( not ( = ?auto_98747 ?auto_98748 ) ) ( not ( = ?auto_98745 ?auto_98747 ) ) ( not ( = ?auto_98745 ?auto_98749 ) ) ( not ( = ?auto_98745 ?auto_98751 ) ) ( not ( = ?auto_98750 ?auto_98747 ) ) ( not ( = ?auto_98750 ?auto_98749 ) ) ( not ( = ?auto_98750 ?auto_98751 ) ) ( not ( = ?auto_98746 ?auto_98747 ) ) ( not ( = ?auto_98746 ?auto_98749 ) ) ( not ( = ?auto_98746 ?auto_98751 ) ) ( ON ?auto_98748 ?auto_98746 ) ( ON ?auto_98747 ?auto_98748 ) ( CLEAR ?auto_98749 ) ( ON ?auto_98751 ?auto_98747 ) ( CLEAR ?auto_98751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98745 ?auto_98750 ?auto_98746 ?auto_98748 ?auto_98747 )
      ( MAKE-1PILE ?auto_98745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98752 - BLOCK
    )
    :vars
    (
      ?auto_98756 - BLOCK
      ?auto_98757 - BLOCK
      ?auto_98753 - BLOCK
      ?auto_98758 - BLOCK
      ?auto_98755 - BLOCK
      ?auto_98754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98756 ?auto_98752 ) ( ON-TABLE ?auto_98752 ) ( not ( = ?auto_98752 ?auto_98756 ) ) ( not ( = ?auto_98752 ?auto_98757 ) ) ( not ( = ?auto_98752 ?auto_98753 ) ) ( not ( = ?auto_98756 ?auto_98757 ) ) ( not ( = ?auto_98756 ?auto_98753 ) ) ( not ( = ?auto_98757 ?auto_98753 ) ) ( ON ?auto_98757 ?auto_98756 ) ( not ( = ?auto_98758 ?auto_98755 ) ) ( not ( = ?auto_98758 ?auto_98754 ) ) ( not ( = ?auto_98758 ?auto_98753 ) ) ( not ( = ?auto_98755 ?auto_98754 ) ) ( not ( = ?auto_98755 ?auto_98753 ) ) ( not ( = ?auto_98754 ?auto_98753 ) ) ( not ( = ?auto_98752 ?auto_98754 ) ) ( not ( = ?auto_98752 ?auto_98758 ) ) ( not ( = ?auto_98752 ?auto_98755 ) ) ( not ( = ?auto_98756 ?auto_98754 ) ) ( not ( = ?auto_98756 ?auto_98758 ) ) ( not ( = ?auto_98756 ?auto_98755 ) ) ( not ( = ?auto_98757 ?auto_98754 ) ) ( not ( = ?auto_98757 ?auto_98758 ) ) ( not ( = ?auto_98757 ?auto_98755 ) ) ( ON ?auto_98753 ?auto_98757 ) ( ON ?auto_98754 ?auto_98753 ) ( ON ?auto_98755 ?auto_98754 ) ( CLEAR ?auto_98755 ) ( HOLDING ?auto_98758 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98758 )
      ( MAKE-1PILE ?auto_98752 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98767 - BLOCK
    )
    :vars
    (
      ?auto_98769 - BLOCK
      ?auto_98770 - BLOCK
      ?auto_98773 - BLOCK
      ?auto_98772 - BLOCK
      ?auto_98768 - BLOCK
      ?auto_98771 - BLOCK
      ?auto_98774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98769 ?auto_98767 ) ( ON-TABLE ?auto_98767 ) ( not ( = ?auto_98767 ?auto_98769 ) ) ( not ( = ?auto_98767 ?auto_98770 ) ) ( not ( = ?auto_98767 ?auto_98773 ) ) ( not ( = ?auto_98769 ?auto_98770 ) ) ( not ( = ?auto_98769 ?auto_98773 ) ) ( not ( = ?auto_98770 ?auto_98773 ) ) ( ON ?auto_98770 ?auto_98769 ) ( not ( = ?auto_98772 ?auto_98768 ) ) ( not ( = ?auto_98772 ?auto_98771 ) ) ( not ( = ?auto_98772 ?auto_98773 ) ) ( not ( = ?auto_98768 ?auto_98771 ) ) ( not ( = ?auto_98768 ?auto_98773 ) ) ( not ( = ?auto_98771 ?auto_98773 ) ) ( not ( = ?auto_98767 ?auto_98771 ) ) ( not ( = ?auto_98767 ?auto_98772 ) ) ( not ( = ?auto_98767 ?auto_98768 ) ) ( not ( = ?auto_98769 ?auto_98771 ) ) ( not ( = ?auto_98769 ?auto_98772 ) ) ( not ( = ?auto_98769 ?auto_98768 ) ) ( not ( = ?auto_98770 ?auto_98771 ) ) ( not ( = ?auto_98770 ?auto_98772 ) ) ( not ( = ?auto_98770 ?auto_98768 ) ) ( ON ?auto_98773 ?auto_98770 ) ( ON ?auto_98771 ?auto_98773 ) ( ON ?auto_98768 ?auto_98771 ) ( CLEAR ?auto_98768 ) ( ON ?auto_98772 ?auto_98774 ) ( CLEAR ?auto_98772 ) ( HAND-EMPTY ) ( not ( = ?auto_98767 ?auto_98774 ) ) ( not ( = ?auto_98769 ?auto_98774 ) ) ( not ( = ?auto_98770 ?auto_98774 ) ) ( not ( = ?auto_98773 ?auto_98774 ) ) ( not ( = ?auto_98772 ?auto_98774 ) ) ( not ( = ?auto_98768 ?auto_98774 ) ) ( not ( = ?auto_98771 ?auto_98774 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98772 ?auto_98774 )
      ( MAKE-1PILE ?auto_98767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98775 - BLOCK
    )
    :vars
    (
      ?auto_98779 - BLOCK
      ?auto_98777 - BLOCK
      ?auto_98782 - BLOCK
      ?auto_98778 - BLOCK
      ?auto_98780 - BLOCK
      ?auto_98781 - BLOCK
      ?auto_98776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98779 ?auto_98775 ) ( ON-TABLE ?auto_98775 ) ( not ( = ?auto_98775 ?auto_98779 ) ) ( not ( = ?auto_98775 ?auto_98777 ) ) ( not ( = ?auto_98775 ?auto_98782 ) ) ( not ( = ?auto_98779 ?auto_98777 ) ) ( not ( = ?auto_98779 ?auto_98782 ) ) ( not ( = ?auto_98777 ?auto_98782 ) ) ( ON ?auto_98777 ?auto_98779 ) ( not ( = ?auto_98778 ?auto_98780 ) ) ( not ( = ?auto_98778 ?auto_98781 ) ) ( not ( = ?auto_98778 ?auto_98782 ) ) ( not ( = ?auto_98780 ?auto_98781 ) ) ( not ( = ?auto_98780 ?auto_98782 ) ) ( not ( = ?auto_98781 ?auto_98782 ) ) ( not ( = ?auto_98775 ?auto_98781 ) ) ( not ( = ?auto_98775 ?auto_98778 ) ) ( not ( = ?auto_98775 ?auto_98780 ) ) ( not ( = ?auto_98779 ?auto_98781 ) ) ( not ( = ?auto_98779 ?auto_98778 ) ) ( not ( = ?auto_98779 ?auto_98780 ) ) ( not ( = ?auto_98777 ?auto_98781 ) ) ( not ( = ?auto_98777 ?auto_98778 ) ) ( not ( = ?auto_98777 ?auto_98780 ) ) ( ON ?auto_98782 ?auto_98777 ) ( ON ?auto_98781 ?auto_98782 ) ( ON ?auto_98778 ?auto_98776 ) ( CLEAR ?auto_98778 ) ( not ( = ?auto_98775 ?auto_98776 ) ) ( not ( = ?auto_98779 ?auto_98776 ) ) ( not ( = ?auto_98777 ?auto_98776 ) ) ( not ( = ?auto_98782 ?auto_98776 ) ) ( not ( = ?auto_98778 ?auto_98776 ) ) ( not ( = ?auto_98780 ?auto_98776 ) ) ( not ( = ?auto_98781 ?auto_98776 ) ) ( HOLDING ?auto_98780 ) ( CLEAR ?auto_98781 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98775 ?auto_98779 ?auto_98777 ?auto_98782 ?auto_98781 ?auto_98780 )
      ( MAKE-1PILE ?auto_98775 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98783 - BLOCK
    )
    :vars
    (
      ?auto_98789 - BLOCK
      ?auto_98786 - BLOCK
      ?auto_98790 - BLOCK
      ?auto_98787 - BLOCK
      ?auto_98788 - BLOCK
      ?auto_98784 - BLOCK
      ?auto_98785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98789 ?auto_98783 ) ( ON-TABLE ?auto_98783 ) ( not ( = ?auto_98783 ?auto_98789 ) ) ( not ( = ?auto_98783 ?auto_98786 ) ) ( not ( = ?auto_98783 ?auto_98790 ) ) ( not ( = ?auto_98789 ?auto_98786 ) ) ( not ( = ?auto_98789 ?auto_98790 ) ) ( not ( = ?auto_98786 ?auto_98790 ) ) ( ON ?auto_98786 ?auto_98789 ) ( not ( = ?auto_98787 ?auto_98788 ) ) ( not ( = ?auto_98787 ?auto_98784 ) ) ( not ( = ?auto_98787 ?auto_98790 ) ) ( not ( = ?auto_98788 ?auto_98784 ) ) ( not ( = ?auto_98788 ?auto_98790 ) ) ( not ( = ?auto_98784 ?auto_98790 ) ) ( not ( = ?auto_98783 ?auto_98784 ) ) ( not ( = ?auto_98783 ?auto_98787 ) ) ( not ( = ?auto_98783 ?auto_98788 ) ) ( not ( = ?auto_98789 ?auto_98784 ) ) ( not ( = ?auto_98789 ?auto_98787 ) ) ( not ( = ?auto_98789 ?auto_98788 ) ) ( not ( = ?auto_98786 ?auto_98784 ) ) ( not ( = ?auto_98786 ?auto_98787 ) ) ( not ( = ?auto_98786 ?auto_98788 ) ) ( ON ?auto_98790 ?auto_98786 ) ( ON ?auto_98784 ?auto_98790 ) ( ON ?auto_98787 ?auto_98785 ) ( not ( = ?auto_98783 ?auto_98785 ) ) ( not ( = ?auto_98789 ?auto_98785 ) ) ( not ( = ?auto_98786 ?auto_98785 ) ) ( not ( = ?auto_98790 ?auto_98785 ) ) ( not ( = ?auto_98787 ?auto_98785 ) ) ( not ( = ?auto_98788 ?auto_98785 ) ) ( not ( = ?auto_98784 ?auto_98785 ) ) ( CLEAR ?auto_98784 ) ( ON ?auto_98788 ?auto_98787 ) ( CLEAR ?auto_98788 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98785 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98785 ?auto_98787 )
      ( MAKE-1PILE ?auto_98783 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_98791 - BLOCK
    )
    :vars
    (
      ?auto_98797 - BLOCK
      ?auto_98792 - BLOCK
      ?auto_98794 - BLOCK
      ?auto_98795 - BLOCK
      ?auto_98798 - BLOCK
      ?auto_98796 - BLOCK
      ?auto_98793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_98797 ?auto_98791 ) ( ON-TABLE ?auto_98791 ) ( not ( = ?auto_98791 ?auto_98797 ) ) ( not ( = ?auto_98791 ?auto_98792 ) ) ( not ( = ?auto_98791 ?auto_98794 ) ) ( not ( = ?auto_98797 ?auto_98792 ) ) ( not ( = ?auto_98797 ?auto_98794 ) ) ( not ( = ?auto_98792 ?auto_98794 ) ) ( ON ?auto_98792 ?auto_98797 ) ( not ( = ?auto_98795 ?auto_98798 ) ) ( not ( = ?auto_98795 ?auto_98796 ) ) ( not ( = ?auto_98795 ?auto_98794 ) ) ( not ( = ?auto_98798 ?auto_98796 ) ) ( not ( = ?auto_98798 ?auto_98794 ) ) ( not ( = ?auto_98796 ?auto_98794 ) ) ( not ( = ?auto_98791 ?auto_98796 ) ) ( not ( = ?auto_98791 ?auto_98795 ) ) ( not ( = ?auto_98791 ?auto_98798 ) ) ( not ( = ?auto_98797 ?auto_98796 ) ) ( not ( = ?auto_98797 ?auto_98795 ) ) ( not ( = ?auto_98797 ?auto_98798 ) ) ( not ( = ?auto_98792 ?auto_98796 ) ) ( not ( = ?auto_98792 ?auto_98795 ) ) ( not ( = ?auto_98792 ?auto_98798 ) ) ( ON ?auto_98794 ?auto_98792 ) ( ON ?auto_98795 ?auto_98793 ) ( not ( = ?auto_98791 ?auto_98793 ) ) ( not ( = ?auto_98797 ?auto_98793 ) ) ( not ( = ?auto_98792 ?auto_98793 ) ) ( not ( = ?auto_98794 ?auto_98793 ) ) ( not ( = ?auto_98795 ?auto_98793 ) ) ( not ( = ?auto_98798 ?auto_98793 ) ) ( not ( = ?auto_98796 ?auto_98793 ) ) ( ON ?auto_98798 ?auto_98795 ) ( CLEAR ?auto_98798 ) ( ON-TABLE ?auto_98793 ) ( HOLDING ?auto_98796 ) ( CLEAR ?auto_98794 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98791 ?auto_98797 ?auto_98792 ?auto_98794 ?auto_98796 )
      ( MAKE-1PILE ?auto_98791 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98837 - BLOCK
      ?auto_98838 - BLOCK
      ?auto_98839 - BLOCK
      ?auto_98840 - BLOCK
      ?auto_98841 - BLOCK
      ?auto_98842 - BLOCK
    )
    :vars
    (
      ?auto_98843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98837 ) ( ON ?auto_98838 ?auto_98837 ) ( ON ?auto_98839 ?auto_98838 ) ( ON ?auto_98840 ?auto_98839 ) ( not ( = ?auto_98837 ?auto_98838 ) ) ( not ( = ?auto_98837 ?auto_98839 ) ) ( not ( = ?auto_98837 ?auto_98840 ) ) ( not ( = ?auto_98837 ?auto_98841 ) ) ( not ( = ?auto_98837 ?auto_98842 ) ) ( not ( = ?auto_98838 ?auto_98839 ) ) ( not ( = ?auto_98838 ?auto_98840 ) ) ( not ( = ?auto_98838 ?auto_98841 ) ) ( not ( = ?auto_98838 ?auto_98842 ) ) ( not ( = ?auto_98839 ?auto_98840 ) ) ( not ( = ?auto_98839 ?auto_98841 ) ) ( not ( = ?auto_98839 ?auto_98842 ) ) ( not ( = ?auto_98840 ?auto_98841 ) ) ( not ( = ?auto_98840 ?auto_98842 ) ) ( not ( = ?auto_98841 ?auto_98842 ) ) ( ON ?auto_98842 ?auto_98843 ) ( not ( = ?auto_98837 ?auto_98843 ) ) ( not ( = ?auto_98838 ?auto_98843 ) ) ( not ( = ?auto_98839 ?auto_98843 ) ) ( not ( = ?auto_98840 ?auto_98843 ) ) ( not ( = ?auto_98841 ?auto_98843 ) ) ( not ( = ?auto_98842 ?auto_98843 ) ) ( CLEAR ?auto_98840 ) ( ON ?auto_98841 ?auto_98842 ) ( CLEAR ?auto_98841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98843 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98843 ?auto_98842 )
      ( MAKE-6PILE ?auto_98837 ?auto_98838 ?auto_98839 ?auto_98840 ?auto_98841 ?auto_98842 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98844 - BLOCK
      ?auto_98845 - BLOCK
      ?auto_98846 - BLOCK
      ?auto_98847 - BLOCK
      ?auto_98848 - BLOCK
      ?auto_98849 - BLOCK
    )
    :vars
    (
      ?auto_98850 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98844 ) ( ON ?auto_98845 ?auto_98844 ) ( ON ?auto_98846 ?auto_98845 ) ( not ( = ?auto_98844 ?auto_98845 ) ) ( not ( = ?auto_98844 ?auto_98846 ) ) ( not ( = ?auto_98844 ?auto_98847 ) ) ( not ( = ?auto_98844 ?auto_98848 ) ) ( not ( = ?auto_98844 ?auto_98849 ) ) ( not ( = ?auto_98845 ?auto_98846 ) ) ( not ( = ?auto_98845 ?auto_98847 ) ) ( not ( = ?auto_98845 ?auto_98848 ) ) ( not ( = ?auto_98845 ?auto_98849 ) ) ( not ( = ?auto_98846 ?auto_98847 ) ) ( not ( = ?auto_98846 ?auto_98848 ) ) ( not ( = ?auto_98846 ?auto_98849 ) ) ( not ( = ?auto_98847 ?auto_98848 ) ) ( not ( = ?auto_98847 ?auto_98849 ) ) ( not ( = ?auto_98848 ?auto_98849 ) ) ( ON ?auto_98849 ?auto_98850 ) ( not ( = ?auto_98844 ?auto_98850 ) ) ( not ( = ?auto_98845 ?auto_98850 ) ) ( not ( = ?auto_98846 ?auto_98850 ) ) ( not ( = ?auto_98847 ?auto_98850 ) ) ( not ( = ?auto_98848 ?auto_98850 ) ) ( not ( = ?auto_98849 ?auto_98850 ) ) ( ON ?auto_98848 ?auto_98849 ) ( CLEAR ?auto_98848 ) ( ON-TABLE ?auto_98850 ) ( HOLDING ?auto_98847 ) ( CLEAR ?auto_98846 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98844 ?auto_98845 ?auto_98846 ?auto_98847 )
      ( MAKE-6PILE ?auto_98844 ?auto_98845 ?auto_98846 ?auto_98847 ?auto_98848 ?auto_98849 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98851 - BLOCK
      ?auto_98852 - BLOCK
      ?auto_98853 - BLOCK
      ?auto_98854 - BLOCK
      ?auto_98855 - BLOCK
      ?auto_98856 - BLOCK
    )
    :vars
    (
      ?auto_98857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98851 ) ( ON ?auto_98852 ?auto_98851 ) ( ON ?auto_98853 ?auto_98852 ) ( not ( = ?auto_98851 ?auto_98852 ) ) ( not ( = ?auto_98851 ?auto_98853 ) ) ( not ( = ?auto_98851 ?auto_98854 ) ) ( not ( = ?auto_98851 ?auto_98855 ) ) ( not ( = ?auto_98851 ?auto_98856 ) ) ( not ( = ?auto_98852 ?auto_98853 ) ) ( not ( = ?auto_98852 ?auto_98854 ) ) ( not ( = ?auto_98852 ?auto_98855 ) ) ( not ( = ?auto_98852 ?auto_98856 ) ) ( not ( = ?auto_98853 ?auto_98854 ) ) ( not ( = ?auto_98853 ?auto_98855 ) ) ( not ( = ?auto_98853 ?auto_98856 ) ) ( not ( = ?auto_98854 ?auto_98855 ) ) ( not ( = ?auto_98854 ?auto_98856 ) ) ( not ( = ?auto_98855 ?auto_98856 ) ) ( ON ?auto_98856 ?auto_98857 ) ( not ( = ?auto_98851 ?auto_98857 ) ) ( not ( = ?auto_98852 ?auto_98857 ) ) ( not ( = ?auto_98853 ?auto_98857 ) ) ( not ( = ?auto_98854 ?auto_98857 ) ) ( not ( = ?auto_98855 ?auto_98857 ) ) ( not ( = ?auto_98856 ?auto_98857 ) ) ( ON ?auto_98855 ?auto_98856 ) ( ON-TABLE ?auto_98857 ) ( CLEAR ?auto_98853 ) ( ON ?auto_98854 ?auto_98855 ) ( CLEAR ?auto_98854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98857 ?auto_98856 ?auto_98855 )
      ( MAKE-6PILE ?auto_98851 ?auto_98852 ?auto_98853 ?auto_98854 ?auto_98855 ?auto_98856 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98858 - BLOCK
      ?auto_98859 - BLOCK
      ?auto_98860 - BLOCK
      ?auto_98861 - BLOCK
      ?auto_98862 - BLOCK
      ?auto_98863 - BLOCK
    )
    :vars
    (
      ?auto_98864 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98858 ) ( ON ?auto_98859 ?auto_98858 ) ( not ( = ?auto_98858 ?auto_98859 ) ) ( not ( = ?auto_98858 ?auto_98860 ) ) ( not ( = ?auto_98858 ?auto_98861 ) ) ( not ( = ?auto_98858 ?auto_98862 ) ) ( not ( = ?auto_98858 ?auto_98863 ) ) ( not ( = ?auto_98859 ?auto_98860 ) ) ( not ( = ?auto_98859 ?auto_98861 ) ) ( not ( = ?auto_98859 ?auto_98862 ) ) ( not ( = ?auto_98859 ?auto_98863 ) ) ( not ( = ?auto_98860 ?auto_98861 ) ) ( not ( = ?auto_98860 ?auto_98862 ) ) ( not ( = ?auto_98860 ?auto_98863 ) ) ( not ( = ?auto_98861 ?auto_98862 ) ) ( not ( = ?auto_98861 ?auto_98863 ) ) ( not ( = ?auto_98862 ?auto_98863 ) ) ( ON ?auto_98863 ?auto_98864 ) ( not ( = ?auto_98858 ?auto_98864 ) ) ( not ( = ?auto_98859 ?auto_98864 ) ) ( not ( = ?auto_98860 ?auto_98864 ) ) ( not ( = ?auto_98861 ?auto_98864 ) ) ( not ( = ?auto_98862 ?auto_98864 ) ) ( not ( = ?auto_98863 ?auto_98864 ) ) ( ON ?auto_98862 ?auto_98863 ) ( ON-TABLE ?auto_98864 ) ( ON ?auto_98861 ?auto_98862 ) ( CLEAR ?auto_98861 ) ( HOLDING ?auto_98860 ) ( CLEAR ?auto_98859 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98858 ?auto_98859 ?auto_98860 )
      ( MAKE-6PILE ?auto_98858 ?auto_98859 ?auto_98860 ?auto_98861 ?auto_98862 ?auto_98863 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98865 - BLOCK
      ?auto_98866 - BLOCK
      ?auto_98867 - BLOCK
      ?auto_98868 - BLOCK
      ?auto_98869 - BLOCK
      ?auto_98870 - BLOCK
    )
    :vars
    (
      ?auto_98871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98865 ) ( ON ?auto_98866 ?auto_98865 ) ( not ( = ?auto_98865 ?auto_98866 ) ) ( not ( = ?auto_98865 ?auto_98867 ) ) ( not ( = ?auto_98865 ?auto_98868 ) ) ( not ( = ?auto_98865 ?auto_98869 ) ) ( not ( = ?auto_98865 ?auto_98870 ) ) ( not ( = ?auto_98866 ?auto_98867 ) ) ( not ( = ?auto_98866 ?auto_98868 ) ) ( not ( = ?auto_98866 ?auto_98869 ) ) ( not ( = ?auto_98866 ?auto_98870 ) ) ( not ( = ?auto_98867 ?auto_98868 ) ) ( not ( = ?auto_98867 ?auto_98869 ) ) ( not ( = ?auto_98867 ?auto_98870 ) ) ( not ( = ?auto_98868 ?auto_98869 ) ) ( not ( = ?auto_98868 ?auto_98870 ) ) ( not ( = ?auto_98869 ?auto_98870 ) ) ( ON ?auto_98870 ?auto_98871 ) ( not ( = ?auto_98865 ?auto_98871 ) ) ( not ( = ?auto_98866 ?auto_98871 ) ) ( not ( = ?auto_98867 ?auto_98871 ) ) ( not ( = ?auto_98868 ?auto_98871 ) ) ( not ( = ?auto_98869 ?auto_98871 ) ) ( not ( = ?auto_98870 ?auto_98871 ) ) ( ON ?auto_98869 ?auto_98870 ) ( ON-TABLE ?auto_98871 ) ( ON ?auto_98868 ?auto_98869 ) ( CLEAR ?auto_98866 ) ( ON ?auto_98867 ?auto_98868 ) ( CLEAR ?auto_98867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98871 ?auto_98870 ?auto_98869 ?auto_98868 )
      ( MAKE-6PILE ?auto_98865 ?auto_98866 ?auto_98867 ?auto_98868 ?auto_98869 ?auto_98870 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98872 - BLOCK
      ?auto_98873 - BLOCK
      ?auto_98874 - BLOCK
      ?auto_98875 - BLOCK
      ?auto_98876 - BLOCK
      ?auto_98877 - BLOCK
    )
    :vars
    (
      ?auto_98878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98872 ) ( not ( = ?auto_98872 ?auto_98873 ) ) ( not ( = ?auto_98872 ?auto_98874 ) ) ( not ( = ?auto_98872 ?auto_98875 ) ) ( not ( = ?auto_98872 ?auto_98876 ) ) ( not ( = ?auto_98872 ?auto_98877 ) ) ( not ( = ?auto_98873 ?auto_98874 ) ) ( not ( = ?auto_98873 ?auto_98875 ) ) ( not ( = ?auto_98873 ?auto_98876 ) ) ( not ( = ?auto_98873 ?auto_98877 ) ) ( not ( = ?auto_98874 ?auto_98875 ) ) ( not ( = ?auto_98874 ?auto_98876 ) ) ( not ( = ?auto_98874 ?auto_98877 ) ) ( not ( = ?auto_98875 ?auto_98876 ) ) ( not ( = ?auto_98875 ?auto_98877 ) ) ( not ( = ?auto_98876 ?auto_98877 ) ) ( ON ?auto_98877 ?auto_98878 ) ( not ( = ?auto_98872 ?auto_98878 ) ) ( not ( = ?auto_98873 ?auto_98878 ) ) ( not ( = ?auto_98874 ?auto_98878 ) ) ( not ( = ?auto_98875 ?auto_98878 ) ) ( not ( = ?auto_98876 ?auto_98878 ) ) ( not ( = ?auto_98877 ?auto_98878 ) ) ( ON ?auto_98876 ?auto_98877 ) ( ON-TABLE ?auto_98878 ) ( ON ?auto_98875 ?auto_98876 ) ( ON ?auto_98874 ?auto_98875 ) ( CLEAR ?auto_98874 ) ( HOLDING ?auto_98873 ) ( CLEAR ?auto_98872 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98872 ?auto_98873 )
      ( MAKE-6PILE ?auto_98872 ?auto_98873 ?auto_98874 ?auto_98875 ?auto_98876 ?auto_98877 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98879 - BLOCK
      ?auto_98880 - BLOCK
      ?auto_98881 - BLOCK
      ?auto_98882 - BLOCK
      ?auto_98883 - BLOCK
      ?auto_98884 - BLOCK
    )
    :vars
    (
      ?auto_98885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_98879 ) ( not ( = ?auto_98879 ?auto_98880 ) ) ( not ( = ?auto_98879 ?auto_98881 ) ) ( not ( = ?auto_98879 ?auto_98882 ) ) ( not ( = ?auto_98879 ?auto_98883 ) ) ( not ( = ?auto_98879 ?auto_98884 ) ) ( not ( = ?auto_98880 ?auto_98881 ) ) ( not ( = ?auto_98880 ?auto_98882 ) ) ( not ( = ?auto_98880 ?auto_98883 ) ) ( not ( = ?auto_98880 ?auto_98884 ) ) ( not ( = ?auto_98881 ?auto_98882 ) ) ( not ( = ?auto_98881 ?auto_98883 ) ) ( not ( = ?auto_98881 ?auto_98884 ) ) ( not ( = ?auto_98882 ?auto_98883 ) ) ( not ( = ?auto_98882 ?auto_98884 ) ) ( not ( = ?auto_98883 ?auto_98884 ) ) ( ON ?auto_98884 ?auto_98885 ) ( not ( = ?auto_98879 ?auto_98885 ) ) ( not ( = ?auto_98880 ?auto_98885 ) ) ( not ( = ?auto_98881 ?auto_98885 ) ) ( not ( = ?auto_98882 ?auto_98885 ) ) ( not ( = ?auto_98883 ?auto_98885 ) ) ( not ( = ?auto_98884 ?auto_98885 ) ) ( ON ?auto_98883 ?auto_98884 ) ( ON-TABLE ?auto_98885 ) ( ON ?auto_98882 ?auto_98883 ) ( ON ?auto_98881 ?auto_98882 ) ( CLEAR ?auto_98879 ) ( ON ?auto_98880 ?auto_98881 ) ( CLEAR ?auto_98880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98885 ?auto_98884 ?auto_98883 ?auto_98882 ?auto_98881 )
      ( MAKE-6PILE ?auto_98879 ?auto_98880 ?auto_98881 ?auto_98882 ?auto_98883 ?auto_98884 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98886 - BLOCK
      ?auto_98887 - BLOCK
      ?auto_98888 - BLOCK
      ?auto_98889 - BLOCK
      ?auto_98890 - BLOCK
      ?auto_98891 - BLOCK
    )
    :vars
    (
      ?auto_98892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98886 ?auto_98887 ) ) ( not ( = ?auto_98886 ?auto_98888 ) ) ( not ( = ?auto_98886 ?auto_98889 ) ) ( not ( = ?auto_98886 ?auto_98890 ) ) ( not ( = ?auto_98886 ?auto_98891 ) ) ( not ( = ?auto_98887 ?auto_98888 ) ) ( not ( = ?auto_98887 ?auto_98889 ) ) ( not ( = ?auto_98887 ?auto_98890 ) ) ( not ( = ?auto_98887 ?auto_98891 ) ) ( not ( = ?auto_98888 ?auto_98889 ) ) ( not ( = ?auto_98888 ?auto_98890 ) ) ( not ( = ?auto_98888 ?auto_98891 ) ) ( not ( = ?auto_98889 ?auto_98890 ) ) ( not ( = ?auto_98889 ?auto_98891 ) ) ( not ( = ?auto_98890 ?auto_98891 ) ) ( ON ?auto_98891 ?auto_98892 ) ( not ( = ?auto_98886 ?auto_98892 ) ) ( not ( = ?auto_98887 ?auto_98892 ) ) ( not ( = ?auto_98888 ?auto_98892 ) ) ( not ( = ?auto_98889 ?auto_98892 ) ) ( not ( = ?auto_98890 ?auto_98892 ) ) ( not ( = ?auto_98891 ?auto_98892 ) ) ( ON ?auto_98890 ?auto_98891 ) ( ON-TABLE ?auto_98892 ) ( ON ?auto_98889 ?auto_98890 ) ( ON ?auto_98888 ?auto_98889 ) ( ON ?auto_98887 ?auto_98888 ) ( CLEAR ?auto_98887 ) ( HOLDING ?auto_98886 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_98886 )
      ( MAKE-6PILE ?auto_98886 ?auto_98887 ?auto_98888 ?auto_98889 ?auto_98890 ?auto_98891 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98893 - BLOCK
      ?auto_98894 - BLOCK
      ?auto_98895 - BLOCK
      ?auto_98896 - BLOCK
      ?auto_98897 - BLOCK
      ?auto_98898 - BLOCK
    )
    :vars
    (
      ?auto_98899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98893 ?auto_98894 ) ) ( not ( = ?auto_98893 ?auto_98895 ) ) ( not ( = ?auto_98893 ?auto_98896 ) ) ( not ( = ?auto_98893 ?auto_98897 ) ) ( not ( = ?auto_98893 ?auto_98898 ) ) ( not ( = ?auto_98894 ?auto_98895 ) ) ( not ( = ?auto_98894 ?auto_98896 ) ) ( not ( = ?auto_98894 ?auto_98897 ) ) ( not ( = ?auto_98894 ?auto_98898 ) ) ( not ( = ?auto_98895 ?auto_98896 ) ) ( not ( = ?auto_98895 ?auto_98897 ) ) ( not ( = ?auto_98895 ?auto_98898 ) ) ( not ( = ?auto_98896 ?auto_98897 ) ) ( not ( = ?auto_98896 ?auto_98898 ) ) ( not ( = ?auto_98897 ?auto_98898 ) ) ( ON ?auto_98898 ?auto_98899 ) ( not ( = ?auto_98893 ?auto_98899 ) ) ( not ( = ?auto_98894 ?auto_98899 ) ) ( not ( = ?auto_98895 ?auto_98899 ) ) ( not ( = ?auto_98896 ?auto_98899 ) ) ( not ( = ?auto_98897 ?auto_98899 ) ) ( not ( = ?auto_98898 ?auto_98899 ) ) ( ON ?auto_98897 ?auto_98898 ) ( ON-TABLE ?auto_98899 ) ( ON ?auto_98896 ?auto_98897 ) ( ON ?auto_98895 ?auto_98896 ) ( ON ?auto_98894 ?auto_98895 ) ( ON ?auto_98893 ?auto_98894 ) ( CLEAR ?auto_98893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98899 ?auto_98898 ?auto_98897 ?auto_98896 ?auto_98895 ?auto_98894 )
      ( MAKE-6PILE ?auto_98893 ?auto_98894 ?auto_98895 ?auto_98896 ?auto_98897 ?auto_98898 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98906 - BLOCK
      ?auto_98907 - BLOCK
      ?auto_98908 - BLOCK
      ?auto_98909 - BLOCK
      ?auto_98910 - BLOCK
      ?auto_98911 - BLOCK
    )
    :vars
    (
      ?auto_98912 - BLOCK
      ?auto_98913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98906 ?auto_98907 ) ) ( not ( = ?auto_98906 ?auto_98908 ) ) ( not ( = ?auto_98906 ?auto_98909 ) ) ( not ( = ?auto_98906 ?auto_98910 ) ) ( not ( = ?auto_98906 ?auto_98911 ) ) ( not ( = ?auto_98907 ?auto_98908 ) ) ( not ( = ?auto_98907 ?auto_98909 ) ) ( not ( = ?auto_98907 ?auto_98910 ) ) ( not ( = ?auto_98907 ?auto_98911 ) ) ( not ( = ?auto_98908 ?auto_98909 ) ) ( not ( = ?auto_98908 ?auto_98910 ) ) ( not ( = ?auto_98908 ?auto_98911 ) ) ( not ( = ?auto_98909 ?auto_98910 ) ) ( not ( = ?auto_98909 ?auto_98911 ) ) ( not ( = ?auto_98910 ?auto_98911 ) ) ( ON ?auto_98911 ?auto_98912 ) ( not ( = ?auto_98906 ?auto_98912 ) ) ( not ( = ?auto_98907 ?auto_98912 ) ) ( not ( = ?auto_98908 ?auto_98912 ) ) ( not ( = ?auto_98909 ?auto_98912 ) ) ( not ( = ?auto_98910 ?auto_98912 ) ) ( not ( = ?auto_98911 ?auto_98912 ) ) ( ON ?auto_98910 ?auto_98911 ) ( ON-TABLE ?auto_98912 ) ( ON ?auto_98909 ?auto_98910 ) ( ON ?auto_98908 ?auto_98909 ) ( ON ?auto_98907 ?auto_98908 ) ( CLEAR ?auto_98907 ) ( ON ?auto_98906 ?auto_98913 ) ( CLEAR ?auto_98906 ) ( HAND-EMPTY ) ( not ( = ?auto_98906 ?auto_98913 ) ) ( not ( = ?auto_98907 ?auto_98913 ) ) ( not ( = ?auto_98908 ?auto_98913 ) ) ( not ( = ?auto_98909 ?auto_98913 ) ) ( not ( = ?auto_98910 ?auto_98913 ) ) ( not ( = ?auto_98911 ?auto_98913 ) ) ( not ( = ?auto_98912 ?auto_98913 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_98906 ?auto_98913 )
      ( MAKE-6PILE ?auto_98906 ?auto_98907 ?auto_98908 ?auto_98909 ?auto_98910 ?auto_98911 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98914 - BLOCK
      ?auto_98915 - BLOCK
      ?auto_98916 - BLOCK
      ?auto_98917 - BLOCK
      ?auto_98918 - BLOCK
      ?auto_98919 - BLOCK
    )
    :vars
    (
      ?auto_98921 - BLOCK
      ?auto_98920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98914 ?auto_98915 ) ) ( not ( = ?auto_98914 ?auto_98916 ) ) ( not ( = ?auto_98914 ?auto_98917 ) ) ( not ( = ?auto_98914 ?auto_98918 ) ) ( not ( = ?auto_98914 ?auto_98919 ) ) ( not ( = ?auto_98915 ?auto_98916 ) ) ( not ( = ?auto_98915 ?auto_98917 ) ) ( not ( = ?auto_98915 ?auto_98918 ) ) ( not ( = ?auto_98915 ?auto_98919 ) ) ( not ( = ?auto_98916 ?auto_98917 ) ) ( not ( = ?auto_98916 ?auto_98918 ) ) ( not ( = ?auto_98916 ?auto_98919 ) ) ( not ( = ?auto_98917 ?auto_98918 ) ) ( not ( = ?auto_98917 ?auto_98919 ) ) ( not ( = ?auto_98918 ?auto_98919 ) ) ( ON ?auto_98919 ?auto_98921 ) ( not ( = ?auto_98914 ?auto_98921 ) ) ( not ( = ?auto_98915 ?auto_98921 ) ) ( not ( = ?auto_98916 ?auto_98921 ) ) ( not ( = ?auto_98917 ?auto_98921 ) ) ( not ( = ?auto_98918 ?auto_98921 ) ) ( not ( = ?auto_98919 ?auto_98921 ) ) ( ON ?auto_98918 ?auto_98919 ) ( ON-TABLE ?auto_98921 ) ( ON ?auto_98917 ?auto_98918 ) ( ON ?auto_98916 ?auto_98917 ) ( ON ?auto_98914 ?auto_98920 ) ( CLEAR ?auto_98914 ) ( not ( = ?auto_98914 ?auto_98920 ) ) ( not ( = ?auto_98915 ?auto_98920 ) ) ( not ( = ?auto_98916 ?auto_98920 ) ) ( not ( = ?auto_98917 ?auto_98920 ) ) ( not ( = ?auto_98918 ?auto_98920 ) ) ( not ( = ?auto_98919 ?auto_98920 ) ) ( not ( = ?auto_98921 ?auto_98920 ) ) ( HOLDING ?auto_98915 ) ( CLEAR ?auto_98916 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98921 ?auto_98919 ?auto_98918 ?auto_98917 ?auto_98916 ?auto_98915 )
      ( MAKE-6PILE ?auto_98914 ?auto_98915 ?auto_98916 ?auto_98917 ?auto_98918 ?auto_98919 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98922 - BLOCK
      ?auto_98923 - BLOCK
      ?auto_98924 - BLOCK
      ?auto_98925 - BLOCK
      ?auto_98926 - BLOCK
      ?auto_98927 - BLOCK
    )
    :vars
    (
      ?auto_98929 - BLOCK
      ?auto_98928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98922 ?auto_98923 ) ) ( not ( = ?auto_98922 ?auto_98924 ) ) ( not ( = ?auto_98922 ?auto_98925 ) ) ( not ( = ?auto_98922 ?auto_98926 ) ) ( not ( = ?auto_98922 ?auto_98927 ) ) ( not ( = ?auto_98923 ?auto_98924 ) ) ( not ( = ?auto_98923 ?auto_98925 ) ) ( not ( = ?auto_98923 ?auto_98926 ) ) ( not ( = ?auto_98923 ?auto_98927 ) ) ( not ( = ?auto_98924 ?auto_98925 ) ) ( not ( = ?auto_98924 ?auto_98926 ) ) ( not ( = ?auto_98924 ?auto_98927 ) ) ( not ( = ?auto_98925 ?auto_98926 ) ) ( not ( = ?auto_98925 ?auto_98927 ) ) ( not ( = ?auto_98926 ?auto_98927 ) ) ( ON ?auto_98927 ?auto_98929 ) ( not ( = ?auto_98922 ?auto_98929 ) ) ( not ( = ?auto_98923 ?auto_98929 ) ) ( not ( = ?auto_98924 ?auto_98929 ) ) ( not ( = ?auto_98925 ?auto_98929 ) ) ( not ( = ?auto_98926 ?auto_98929 ) ) ( not ( = ?auto_98927 ?auto_98929 ) ) ( ON ?auto_98926 ?auto_98927 ) ( ON-TABLE ?auto_98929 ) ( ON ?auto_98925 ?auto_98926 ) ( ON ?auto_98924 ?auto_98925 ) ( ON ?auto_98922 ?auto_98928 ) ( not ( = ?auto_98922 ?auto_98928 ) ) ( not ( = ?auto_98923 ?auto_98928 ) ) ( not ( = ?auto_98924 ?auto_98928 ) ) ( not ( = ?auto_98925 ?auto_98928 ) ) ( not ( = ?auto_98926 ?auto_98928 ) ) ( not ( = ?auto_98927 ?auto_98928 ) ) ( not ( = ?auto_98929 ?auto_98928 ) ) ( CLEAR ?auto_98924 ) ( ON ?auto_98923 ?auto_98922 ) ( CLEAR ?auto_98923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_98928 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98928 ?auto_98922 )
      ( MAKE-6PILE ?auto_98922 ?auto_98923 ?auto_98924 ?auto_98925 ?auto_98926 ?auto_98927 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98930 - BLOCK
      ?auto_98931 - BLOCK
      ?auto_98932 - BLOCK
      ?auto_98933 - BLOCK
      ?auto_98934 - BLOCK
      ?auto_98935 - BLOCK
    )
    :vars
    (
      ?auto_98936 - BLOCK
      ?auto_98937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98930 ?auto_98931 ) ) ( not ( = ?auto_98930 ?auto_98932 ) ) ( not ( = ?auto_98930 ?auto_98933 ) ) ( not ( = ?auto_98930 ?auto_98934 ) ) ( not ( = ?auto_98930 ?auto_98935 ) ) ( not ( = ?auto_98931 ?auto_98932 ) ) ( not ( = ?auto_98931 ?auto_98933 ) ) ( not ( = ?auto_98931 ?auto_98934 ) ) ( not ( = ?auto_98931 ?auto_98935 ) ) ( not ( = ?auto_98932 ?auto_98933 ) ) ( not ( = ?auto_98932 ?auto_98934 ) ) ( not ( = ?auto_98932 ?auto_98935 ) ) ( not ( = ?auto_98933 ?auto_98934 ) ) ( not ( = ?auto_98933 ?auto_98935 ) ) ( not ( = ?auto_98934 ?auto_98935 ) ) ( ON ?auto_98935 ?auto_98936 ) ( not ( = ?auto_98930 ?auto_98936 ) ) ( not ( = ?auto_98931 ?auto_98936 ) ) ( not ( = ?auto_98932 ?auto_98936 ) ) ( not ( = ?auto_98933 ?auto_98936 ) ) ( not ( = ?auto_98934 ?auto_98936 ) ) ( not ( = ?auto_98935 ?auto_98936 ) ) ( ON ?auto_98934 ?auto_98935 ) ( ON-TABLE ?auto_98936 ) ( ON ?auto_98933 ?auto_98934 ) ( ON ?auto_98930 ?auto_98937 ) ( not ( = ?auto_98930 ?auto_98937 ) ) ( not ( = ?auto_98931 ?auto_98937 ) ) ( not ( = ?auto_98932 ?auto_98937 ) ) ( not ( = ?auto_98933 ?auto_98937 ) ) ( not ( = ?auto_98934 ?auto_98937 ) ) ( not ( = ?auto_98935 ?auto_98937 ) ) ( not ( = ?auto_98936 ?auto_98937 ) ) ( ON ?auto_98931 ?auto_98930 ) ( CLEAR ?auto_98931 ) ( ON-TABLE ?auto_98937 ) ( HOLDING ?auto_98932 ) ( CLEAR ?auto_98933 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98936 ?auto_98935 ?auto_98934 ?auto_98933 ?auto_98932 )
      ( MAKE-6PILE ?auto_98930 ?auto_98931 ?auto_98932 ?auto_98933 ?auto_98934 ?auto_98935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98938 - BLOCK
      ?auto_98939 - BLOCK
      ?auto_98940 - BLOCK
      ?auto_98941 - BLOCK
      ?auto_98942 - BLOCK
      ?auto_98943 - BLOCK
    )
    :vars
    (
      ?auto_98945 - BLOCK
      ?auto_98944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98938 ?auto_98939 ) ) ( not ( = ?auto_98938 ?auto_98940 ) ) ( not ( = ?auto_98938 ?auto_98941 ) ) ( not ( = ?auto_98938 ?auto_98942 ) ) ( not ( = ?auto_98938 ?auto_98943 ) ) ( not ( = ?auto_98939 ?auto_98940 ) ) ( not ( = ?auto_98939 ?auto_98941 ) ) ( not ( = ?auto_98939 ?auto_98942 ) ) ( not ( = ?auto_98939 ?auto_98943 ) ) ( not ( = ?auto_98940 ?auto_98941 ) ) ( not ( = ?auto_98940 ?auto_98942 ) ) ( not ( = ?auto_98940 ?auto_98943 ) ) ( not ( = ?auto_98941 ?auto_98942 ) ) ( not ( = ?auto_98941 ?auto_98943 ) ) ( not ( = ?auto_98942 ?auto_98943 ) ) ( ON ?auto_98943 ?auto_98945 ) ( not ( = ?auto_98938 ?auto_98945 ) ) ( not ( = ?auto_98939 ?auto_98945 ) ) ( not ( = ?auto_98940 ?auto_98945 ) ) ( not ( = ?auto_98941 ?auto_98945 ) ) ( not ( = ?auto_98942 ?auto_98945 ) ) ( not ( = ?auto_98943 ?auto_98945 ) ) ( ON ?auto_98942 ?auto_98943 ) ( ON-TABLE ?auto_98945 ) ( ON ?auto_98941 ?auto_98942 ) ( ON ?auto_98938 ?auto_98944 ) ( not ( = ?auto_98938 ?auto_98944 ) ) ( not ( = ?auto_98939 ?auto_98944 ) ) ( not ( = ?auto_98940 ?auto_98944 ) ) ( not ( = ?auto_98941 ?auto_98944 ) ) ( not ( = ?auto_98942 ?auto_98944 ) ) ( not ( = ?auto_98943 ?auto_98944 ) ) ( not ( = ?auto_98945 ?auto_98944 ) ) ( ON ?auto_98939 ?auto_98938 ) ( ON-TABLE ?auto_98944 ) ( CLEAR ?auto_98941 ) ( ON ?auto_98940 ?auto_98939 ) ( CLEAR ?auto_98940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98944 ?auto_98938 ?auto_98939 )
      ( MAKE-6PILE ?auto_98938 ?auto_98939 ?auto_98940 ?auto_98941 ?auto_98942 ?auto_98943 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98946 - BLOCK
      ?auto_98947 - BLOCK
      ?auto_98948 - BLOCK
      ?auto_98949 - BLOCK
      ?auto_98950 - BLOCK
      ?auto_98951 - BLOCK
    )
    :vars
    (
      ?auto_98953 - BLOCK
      ?auto_98952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98946 ?auto_98947 ) ) ( not ( = ?auto_98946 ?auto_98948 ) ) ( not ( = ?auto_98946 ?auto_98949 ) ) ( not ( = ?auto_98946 ?auto_98950 ) ) ( not ( = ?auto_98946 ?auto_98951 ) ) ( not ( = ?auto_98947 ?auto_98948 ) ) ( not ( = ?auto_98947 ?auto_98949 ) ) ( not ( = ?auto_98947 ?auto_98950 ) ) ( not ( = ?auto_98947 ?auto_98951 ) ) ( not ( = ?auto_98948 ?auto_98949 ) ) ( not ( = ?auto_98948 ?auto_98950 ) ) ( not ( = ?auto_98948 ?auto_98951 ) ) ( not ( = ?auto_98949 ?auto_98950 ) ) ( not ( = ?auto_98949 ?auto_98951 ) ) ( not ( = ?auto_98950 ?auto_98951 ) ) ( ON ?auto_98951 ?auto_98953 ) ( not ( = ?auto_98946 ?auto_98953 ) ) ( not ( = ?auto_98947 ?auto_98953 ) ) ( not ( = ?auto_98948 ?auto_98953 ) ) ( not ( = ?auto_98949 ?auto_98953 ) ) ( not ( = ?auto_98950 ?auto_98953 ) ) ( not ( = ?auto_98951 ?auto_98953 ) ) ( ON ?auto_98950 ?auto_98951 ) ( ON-TABLE ?auto_98953 ) ( ON ?auto_98946 ?auto_98952 ) ( not ( = ?auto_98946 ?auto_98952 ) ) ( not ( = ?auto_98947 ?auto_98952 ) ) ( not ( = ?auto_98948 ?auto_98952 ) ) ( not ( = ?auto_98949 ?auto_98952 ) ) ( not ( = ?auto_98950 ?auto_98952 ) ) ( not ( = ?auto_98951 ?auto_98952 ) ) ( not ( = ?auto_98953 ?auto_98952 ) ) ( ON ?auto_98947 ?auto_98946 ) ( ON-TABLE ?auto_98952 ) ( ON ?auto_98948 ?auto_98947 ) ( CLEAR ?auto_98948 ) ( HOLDING ?auto_98949 ) ( CLEAR ?auto_98950 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98953 ?auto_98951 ?auto_98950 ?auto_98949 )
      ( MAKE-6PILE ?auto_98946 ?auto_98947 ?auto_98948 ?auto_98949 ?auto_98950 ?auto_98951 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98954 - BLOCK
      ?auto_98955 - BLOCK
      ?auto_98956 - BLOCK
      ?auto_98957 - BLOCK
      ?auto_98958 - BLOCK
      ?auto_98959 - BLOCK
    )
    :vars
    (
      ?auto_98961 - BLOCK
      ?auto_98960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98954 ?auto_98955 ) ) ( not ( = ?auto_98954 ?auto_98956 ) ) ( not ( = ?auto_98954 ?auto_98957 ) ) ( not ( = ?auto_98954 ?auto_98958 ) ) ( not ( = ?auto_98954 ?auto_98959 ) ) ( not ( = ?auto_98955 ?auto_98956 ) ) ( not ( = ?auto_98955 ?auto_98957 ) ) ( not ( = ?auto_98955 ?auto_98958 ) ) ( not ( = ?auto_98955 ?auto_98959 ) ) ( not ( = ?auto_98956 ?auto_98957 ) ) ( not ( = ?auto_98956 ?auto_98958 ) ) ( not ( = ?auto_98956 ?auto_98959 ) ) ( not ( = ?auto_98957 ?auto_98958 ) ) ( not ( = ?auto_98957 ?auto_98959 ) ) ( not ( = ?auto_98958 ?auto_98959 ) ) ( ON ?auto_98959 ?auto_98961 ) ( not ( = ?auto_98954 ?auto_98961 ) ) ( not ( = ?auto_98955 ?auto_98961 ) ) ( not ( = ?auto_98956 ?auto_98961 ) ) ( not ( = ?auto_98957 ?auto_98961 ) ) ( not ( = ?auto_98958 ?auto_98961 ) ) ( not ( = ?auto_98959 ?auto_98961 ) ) ( ON ?auto_98958 ?auto_98959 ) ( ON-TABLE ?auto_98961 ) ( ON ?auto_98954 ?auto_98960 ) ( not ( = ?auto_98954 ?auto_98960 ) ) ( not ( = ?auto_98955 ?auto_98960 ) ) ( not ( = ?auto_98956 ?auto_98960 ) ) ( not ( = ?auto_98957 ?auto_98960 ) ) ( not ( = ?auto_98958 ?auto_98960 ) ) ( not ( = ?auto_98959 ?auto_98960 ) ) ( not ( = ?auto_98961 ?auto_98960 ) ) ( ON ?auto_98955 ?auto_98954 ) ( ON-TABLE ?auto_98960 ) ( ON ?auto_98956 ?auto_98955 ) ( CLEAR ?auto_98958 ) ( ON ?auto_98957 ?auto_98956 ) ( CLEAR ?auto_98957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_98960 ?auto_98954 ?auto_98955 ?auto_98956 )
      ( MAKE-6PILE ?auto_98954 ?auto_98955 ?auto_98956 ?auto_98957 ?auto_98958 ?auto_98959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98962 - BLOCK
      ?auto_98963 - BLOCK
      ?auto_98964 - BLOCK
      ?auto_98965 - BLOCK
      ?auto_98966 - BLOCK
      ?auto_98967 - BLOCK
    )
    :vars
    (
      ?auto_98969 - BLOCK
      ?auto_98968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98962 ?auto_98963 ) ) ( not ( = ?auto_98962 ?auto_98964 ) ) ( not ( = ?auto_98962 ?auto_98965 ) ) ( not ( = ?auto_98962 ?auto_98966 ) ) ( not ( = ?auto_98962 ?auto_98967 ) ) ( not ( = ?auto_98963 ?auto_98964 ) ) ( not ( = ?auto_98963 ?auto_98965 ) ) ( not ( = ?auto_98963 ?auto_98966 ) ) ( not ( = ?auto_98963 ?auto_98967 ) ) ( not ( = ?auto_98964 ?auto_98965 ) ) ( not ( = ?auto_98964 ?auto_98966 ) ) ( not ( = ?auto_98964 ?auto_98967 ) ) ( not ( = ?auto_98965 ?auto_98966 ) ) ( not ( = ?auto_98965 ?auto_98967 ) ) ( not ( = ?auto_98966 ?auto_98967 ) ) ( ON ?auto_98967 ?auto_98969 ) ( not ( = ?auto_98962 ?auto_98969 ) ) ( not ( = ?auto_98963 ?auto_98969 ) ) ( not ( = ?auto_98964 ?auto_98969 ) ) ( not ( = ?auto_98965 ?auto_98969 ) ) ( not ( = ?auto_98966 ?auto_98969 ) ) ( not ( = ?auto_98967 ?auto_98969 ) ) ( ON-TABLE ?auto_98969 ) ( ON ?auto_98962 ?auto_98968 ) ( not ( = ?auto_98962 ?auto_98968 ) ) ( not ( = ?auto_98963 ?auto_98968 ) ) ( not ( = ?auto_98964 ?auto_98968 ) ) ( not ( = ?auto_98965 ?auto_98968 ) ) ( not ( = ?auto_98966 ?auto_98968 ) ) ( not ( = ?auto_98967 ?auto_98968 ) ) ( not ( = ?auto_98969 ?auto_98968 ) ) ( ON ?auto_98963 ?auto_98962 ) ( ON-TABLE ?auto_98968 ) ( ON ?auto_98964 ?auto_98963 ) ( ON ?auto_98965 ?auto_98964 ) ( CLEAR ?auto_98965 ) ( HOLDING ?auto_98966 ) ( CLEAR ?auto_98967 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_98969 ?auto_98967 ?auto_98966 )
      ( MAKE-6PILE ?auto_98962 ?auto_98963 ?auto_98964 ?auto_98965 ?auto_98966 ?auto_98967 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98970 - BLOCK
      ?auto_98971 - BLOCK
      ?auto_98972 - BLOCK
      ?auto_98973 - BLOCK
      ?auto_98974 - BLOCK
      ?auto_98975 - BLOCK
    )
    :vars
    (
      ?auto_98976 - BLOCK
      ?auto_98977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98970 ?auto_98971 ) ) ( not ( = ?auto_98970 ?auto_98972 ) ) ( not ( = ?auto_98970 ?auto_98973 ) ) ( not ( = ?auto_98970 ?auto_98974 ) ) ( not ( = ?auto_98970 ?auto_98975 ) ) ( not ( = ?auto_98971 ?auto_98972 ) ) ( not ( = ?auto_98971 ?auto_98973 ) ) ( not ( = ?auto_98971 ?auto_98974 ) ) ( not ( = ?auto_98971 ?auto_98975 ) ) ( not ( = ?auto_98972 ?auto_98973 ) ) ( not ( = ?auto_98972 ?auto_98974 ) ) ( not ( = ?auto_98972 ?auto_98975 ) ) ( not ( = ?auto_98973 ?auto_98974 ) ) ( not ( = ?auto_98973 ?auto_98975 ) ) ( not ( = ?auto_98974 ?auto_98975 ) ) ( ON ?auto_98975 ?auto_98976 ) ( not ( = ?auto_98970 ?auto_98976 ) ) ( not ( = ?auto_98971 ?auto_98976 ) ) ( not ( = ?auto_98972 ?auto_98976 ) ) ( not ( = ?auto_98973 ?auto_98976 ) ) ( not ( = ?auto_98974 ?auto_98976 ) ) ( not ( = ?auto_98975 ?auto_98976 ) ) ( ON-TABLE ?auto_98976 ) ( ON ?auto_98970 ?auto_98977 ) ( not ( = ?auto_98970 ?auto_98977 ) ) ( not ( = ?auto_98971 ?auto_98977 ) ) ( not ( = ?auto_98972 ?auto_98977 ) ) ( not ( = ?auto_98973 ?auto_98977 ) ) ( not ( = ?auto_98974 ?auto_98977 ) ) ( not ( = ?auto_98975 ?auto_98977 ) ) ( not ( = ?auto_98976 ?auto_98977 ) ) ( ON ?auto_98971 ?auto_98970 ) ( ON-TABLE ?auto_98977 ) ( ON ?auto_98972 ?auto_98971 ) ( ON ?auto_98973 ?auto_98972 ) ( CLEAR ?auto_98975 ) ( ON ?auto_98974 ?auto_98973 ) ( CLEAR ?auto_98974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_98977 ?auto_98970 ?auto_98971 ?auto_98972 ?auto_98973 )
      ( MAKE-6PILE ?auto_98970 ?auto_98971 ?auto_98972 ?auto_98973 ?auto_98974 ?auto_98975 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98978 - BLOCK
      ?auto_98979 - BLOCK
      ?auto_98980 - BLOCK
      ?auto_98981 - BLOCK
      ?auto_98982 - BLOCK
      ?auto_98983 - BLOCK
    )
    :vars
    (
      ?auto_98984 - BLOCK
      ?auto_98985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98978 ?auto_98979 ) ) ( not ( = ?auto_98978 ?auto_98980 ) ) ( not ( = ?auto_98978 ?auto_98981 ) ) ( not ( = ?auto_98978 ?auto_98982 ) ) ( not ( = ?auto_98978 ?auto_98983 ) ) ( not ( = ?auto_98979 ?auto_98980 ) ) ( not ( = ?auto_98979 ?auto_98981 ) ) ( not ( = ?auto_98979 ?auto_98982 ) ) ( not ( = ?auto_98979 ?auto_98983 ) ) ( not ( = ?auto_98980 ?auto_98981 ) ) ( not ( = ?auto_98980 ?auto_98982 ) ) ( not ( = ?auto_98980 ?auto_98983 ) ) ( not ( = ?auto_98981 ?auto_98982 ) ) ( not ( = ?auto_98981 ?auto_98983 ) ) ( not ( = ?auto_98982 ?auto_98983 ) ) ( not ( = ?auto_98978 ?auto_98984 ) ) ( not ( = ?auto_98979 ?auto_98984 ) ) ( not ( = ?auto_98980 ?auto_98984 ) ) ( not ( = ?auto_98981 ?auto_98984 ) ) ( not ( = ?auto_98982 ?auto_98984 ) ) ( not ( = ?auto_98983 ?auto_98984 ) ) ( ON-TABLE ?auto_98984 ) ( ON ?auto_98978 ?auto_98985 ) ( not ( = ?auto_98978 ?auto_98985 ) ) ( not ( = ?auto_98979 ?auto_98985 ) ) ( not ( = ?auto_98980 ?auto_98985 ) ) ( not ( = ?auto_98981 ?auto_98985 ) ) ( not ( = ?auto_98982 ?auto_98985 ) ) ( not ( = ?auto_98983 ?auto_98985 ) ) ( not ( = ?auto_98984 ?auto_98985 ) ) ( ON ?auto_98979 ?auto_98978 ) ( ON-TABLE ?auto_98985 ) ( ON ?auto_98980 ?auto_98979 ) ( ON ?auto_98981 ?auto_98980 ) ( ON ?auto_98982 ?auto_98981 ) ( CLEAR ?auto_98982 ) ( HOLDING ?auto_98983 ) ( CLEAR ?auto_98984 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_98984 ?auto_98983 )
      ( MAKE-6PILE ?auto_98978 ?auto_98979 ?auto_98980 ?auto_98981 ?auto_98982 ?auto_98983 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98986 - BLOCK
      ?auto_98987 - BLOCK
      ?auto_98988 - BLOCK
      ?auto_98989 - BLOCK
      ?auto_98990 - BLOCK
      ?auto_98991 - BLOCK
    )
    :vars
    (
      ?auto_98993 - BLOCK
      ?auto_98992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98986 ?auto_98987 ) ) ( not ( = ?auto_98986 ?auto_98988 ) ) ( not ( = ?auto_98986 ?auto_98989 ) ) ( not ( = ?auto_98986 ?auto_98990 ) ) ( not ( = ?auto_98986 ?auto_98991 ) ) ( not ( = ?auto_98987 ?auto_98988 ) ) ( not ( = ?auto_98987 ?auto_98989 ) ) ( not ( = ?auto_98987 ?auto_98990 ) ) ( not ( = ?auto_98987 ?auto_98991 ) ) ( not ( = ?auto_98988 ?auto_98989 ) ) ( not ( = ?auto_98988 ?auto_98990 ) ) ( not ( = ?auto_98988 ?auto_98991 ) ) ( not ( = ?auto_98989 ?auto_98990 ) ) ( not ( = ?auto_98989 ?auto_98991 ) ) ( not ( = ?auto_98990 ?auto_98991 ) ) ( not ( = ?auto_98986 ?auto_98993 ) ) ( not ( = ?auto_98987 ?auto_98993 ) ) ( not ( = ?auto_98988 ?auto_98993 ) ) ( not ( = ?auto_98989 ?auto_98993 ) ) ( not ( = ?auto_98990 ?auto_98993 ) ) ( not ( = ?auto_98991 ?auto_98993 ) ) ( ON-TABLE ?auto_98993 ) ( ON ?auto_98986 ?auto_98992 ) ( not ( = ?auto_98986 ?auto_98992 ) ) ( not ( = ?auto_98987 ?auto_98992 ) ) ( not ( = ?auto_98988 ?auto_98992 ) ) ( not ( = ?auto_98989 ?auto_98992 ) ) ( not ( = ?auto_98990 ?auto_98992 ) ) ( not ( = ?auto_98991 ?auto_98992 ) ) ( not ( = ?auto_98993 ?auto_98992 ) ) ( ON ?auto_98987 ?auto_98986 ) ( ON-TABLE ?auto_98992 ) ( ON ?auto_98988 ?auto_98987 ) ( ON ?auto_98989 ?auto_98988 ) ( ON ?auto_98990 ?auto_98989 ) ( CLEAR ?auto_98993 ) ( ON ?auto_98991 ?auto_98990 ) ( CLEAR ?auto_98991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_98992 ?auto_98986 ?auto_98987 ?auto_98988 ?auto_98989 ?auto_98990 )
      ( MAKE-6PILE ?auto_98986 ?auto_98987 ?auto_98988 ?auto_98989 ?auto_98990 ?auto_98991 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_98994 - BLOCK
      ?auto_98995 - BLOCK
      ?auto_98996 - BLOCK
      ?auto_98997 - BLOCK
      ?auto_98998 - BLOCK
      ?auto_98999 - BLOCK
    )
    :vars
    (
      ?auto_99000 - BLOCK
      ?auto_99001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_98994 ?auto_98995 ) ) ( not ( = ?auto_98994 ?auto_98996 ) ) ( not ( = ?auto_98994 ?auto_98997 ) ) ( not ( = ?auto_98994 ?auto_98998 ) ) ( not ( = ?auto_98994 ?auto_98999 ) ) ( not ( = ?auto_98995 ?auto_98996 ) ) ( not ( = ?auto_98995 ?auto_98997 ) ) ( not ( = ?auto_98995 ?auto_98998 ) ) ( not ( = ?auto_98995 ?auto_98999 ) ) ( not ( = ?auto_98996 ?auto_98997 ) ) ( not ( = ?auto_98996 ?auto_98998 ) ) ( not ( = ?auto_98996 ?auto_98999 ) ) ( not ( = ?auto_98997 ?auto_98998 ) ) ( not ( = ?auto_98997 ?auto_98999 ) ) ( not ( = ?auto_98998 ?auto_98999 ) ) ( not ( = ?auto_98994 ?auto_99000 ) ) ( not ( = ?auto_98995 ?auto_99000 ) ) ( not ( = ?auto_98996 ?auto_99000 ) ) ( not ( = ?auto_98997 ?auto_99000 ) ) ( not ( = ?auto_98998 ?auto_99000 ) ) ( not ( = ?auto_98999 ?auto_99000 ) ) ( ON ?auto_98994 ?auto_99001 ) ( not ( = ?auto_98994 ?auto_99001 ) ) ( not ( = ?auto_98995 ?auto_99001 ) ) ( not ( = ?auto_98996 ?auto_99001 ) ) ( not ( = ?auto_98997 ?auto_99001 ) ) ( not ( = ?auto_98998 ?auto_99001 ) ) ( not ( = ?auto_98999 ?auto_99001 ) ) ( not ( = ?auto_99000 ?auto_99001 ) ) ( ON ?auto_98995 ?auto_98994 ) ( ON-TABLE ?auto_99001 ) ( ON ?auto_98996 ?auto_98995 ) ( ON ?auto_98997 ?auto_98996 ) ( ON ?auto_98998 ?auto_98997 ) ( ON ?auto_98999 ?auto_98998 ) ( CLEAR ?auto_98999 ) ( HOLDING ?auto_99000 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99000 )
      ( MAKE-6PILE ?auto_98994 ?auto_98995 ?auto_98996 ?auto_98997 ?auto_98998 ?auto_98999 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_99002 - BLOCK
      ?auto_99003 - BLOCK
      ?auto_99004 - BLOCK
      ?auto_99005 - BLOCK
      ?auto_99006 - BLOCK
      ?auto_99007 - BLOCK
    )
    :vars
    (
      ?auto_99009 - BLOCK
      ?auto_99008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99002 ?auto_99003 ) ) ( not ( = ?auto_99002 ?auto_99004 ) ) ( not ( = ?auto_99002 ?auto_99005 ) ) ( not ( = ?auto_99002 ?auto_99006 ) ) ( not ( = ?auto_99002 ?auto_99007 ) ) ( not ( = ?auto_99003 ?auto_99004 ) ) ( not ( = ?auto_99003 ?auto_99005 ) ) ( not ( = ?auto_99003 ?auto_99006 ) ) ( not ( = ?auto_99003 ?auto_99007 ) ) ( not ( = ?auto_99004 ?auto_99005 ) ) ( not ( = ?auto_99004 ?auto_99006 ) ) ( not ( = ?auto_99004 ?auto_99007 ) ) ( not ( = ?auto_99005 ?auto_99006 ) ) ( not ( = ?auto_99005 ?auto_99007 ) ) ( not ( = ?auto_99006 ?auto_99007 ) ) ( not ( = ?auto_99002 ?auto_99009 ) ) ( not ( = ?auto_99003 ?auto_99009 ) ) ( not ( = ?auto_99004 ?auto_99009 ) ) ( not ( = ?auto_99005 ?auto_99009 ) ) ( not ( = ?auto_99006 ?auto_99009 ) ) ( not ( = ?auto_99007 ?auto_99009 ) ) ( ON ?auto_99002 ?auto_99008 ) ( not ( = ?auto_99002 ?auto_99008 ) ) ( not ( = ?auto_99003 ?auto_99008 ) ) ( not ( = ?auto_99004 ?auto_99008 ) ) ( not ( = ?auto_99005 ?auto_99008 ) ) ( not ( = ?auto_99006 ?auto_99008 ) ) ( not ( = ?auto_99007 ?auto_99008 ) ) ( not ( = ?auto_99009 ?auto_99008 ) ) ( ON ?auto_99003 ?auto_99002 ) ( ON-TABLE ?auto_99008 ) ( ON ?auto_99004 ?auto_99003 ) ( ON ?auto_99005 ?auto_99004 ) ( ON ?auto_99006 ?auto_99005 ) ( ON ?auto_99007 ?auto_99006 ) ( ON ?auto_99009 ?auto_99007 ) ( CLEAR ?auto_99009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99008 ?auto_99002 ?auto_99003 ?auto_99004 ?auto_99005 ?auto_99006 ?auto_99007 )
      ( MAKE-6PILE ?auto_99002 ?auto_99003 ?auto_99004 ?auto_99005 ?auto_99006 ?auto_99007 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99024 - BLOCK
      ?auto_99025 - BLOCK
      ?auto_99026 - BLOCK
      ?auto_99027 - BLOCK
      ?auto_99028 - BLOCK
      ?auto_99029 - BLOCK
      ?auto_99030 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_99029 ) ( ON-TABLE ?auto_99024 ) ( ON ?auto_99025 ?auto_99024 ) ( ON ?auto_99026 ?auto_99025 ) ( ON ?auto_99027 ?auto_99026 ) ( ON ?auto_99028 ?auto_99027 ) ( ON ?auto_99029 ?auto_99028 ) ( not ( = ?auto_99024 ?auto_99025 ) ) ( not ( = ?auto_99024 ?auto_99026 ) ) ( not ( = ?auto_99024 ?auto_99027 ) ) ( not ( = ?auto_99024 ?auto_99028 ) ) ( not ( = ?auto_99024 ?auto_99029 ) ) ( not ( = ?auto_99024 ?auto_99030 ) ) ( not ( = ?auto_99025 ?auto_99026 ) ) ( not ( = ?auto_99025 ?auto_99027 ) ) ( not ( = ?auto_99025 ?auto_99028 ) ) ( not ( = ?auto_99025 ?auto_99029 ) ) ( not ( = ?auto_99025 ?auto_99030 ) ) ( not ( = ?auto_99026 ?auto_99027 ) ) ( not ( = ?auto_99026 ?auto_99028 ) ) ( not ( = ?auto_99026 ?auto_99029 ) ) ( not ( = ?auto_99026 ?auto_99030 ) ) ( not ( = ?auto_99027 ?auto_99028 ) ) ( not ( = ?auto_99027 ?auto_99029 ) ) ( not ( = ?auto_99027 ?auto_99030 ) ) ( not ( = ?auto_99028 ?auto_99029 ) ) ( not ( = ?auto_99028 ?auto_99030 ) ) ( not ( = ?auto_99029 ?auto_99030 ) ) ( ON-TABLE ?auto_99030 ) ( CLEAR ?auto_99030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_99030 )
      ( MAKE-7PILE ?auto_99024 ?auto_99025 ?auto_99026 ?auto_99027 ?auto_99028 ?auto_99029 ?auto_99030 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99031 - BLOCK
      ?auto_99032 - BLOCK
      ?auto_99033 - BLOCK
      ?auto_99034 - BLOCK
      ?auto_99035 - BLOCK
      ?auto_99036 - BLOCK
      ?auto_99037 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99031 ) ( ON ?auto_99032 ?auto_99031 ) ( ON ?auto_99033 ?auto_99032 ) ( ON ?auto_99034 ?auto_99033 ) ( ON ?auto_99035 ?auto_99034 ) ( not ( = ?auto_99031 ?auto_99032 ) ) ( not ( = ?auto_99031 ?auto_99033 ) ) ( not ( = ?auto_99031 ?auto_99034 ) ) ( not ( = ?auto_99031 ?auto_99035 ) ) ( not ( = ?auto_99031 ?auto_99036 ) ) ( not ( = ?auto_99031 ?auto_99037 ) ) ( not ( = ?auto_99032 ?auto_99033 ) ) ( not ( = ?auto_99032 ?auto_99034 ) ) ( not ( = ?auto_99032 ?auto_99035 ) ) ( not ( = ?auto_99032 ?auto_99036 ) ) ( not ( = ?auto_99032 ?auto_99037 ) ) ( not ( = ?auto_99033 ?auto_99034 ) ) ( not ( = ?auto_99033 ?auto_99035 ) ) ( not ( = ?auto_99033 ?auto_99036 ) ) ( not ( = ?auto_99033 ?auto_99037 ) ) ( not ( = ?auto_99034 ?auto_99035 ) ) ( not ( = ?auto_99034 ?auto_99036 ) ) ( not ( = ?auto_99034 ?auto_99037 ) ) ( not ( = ?auto_99035 ?auto_99036 ) ) ( not ( = ?auto_99035 ?auto_99037 ) ) ( not ( = ?auto_99036 ?auto_99037 ) ) ( ON-TABLE ?auto_99037 ) ( CLEAR ?auto_99037 ) ( HOLDING ?auto_99036 ) ( CLEAR ?auto_99035 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99031 ?auto_99032 ?auto_99033 ?auto_99034 ?auto_99035 ?auto_99036 )
      ( MAKE-7PILE ?auto_99031 ?auto_99032 ?auto_99033 ?auto_99034 ?auto_99035 ?auto_99036 ?auto_99037 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99038 - BLOCK
      ?auto_99039 - BLOCK
      ?auto_99040 - BLOCK
      ?auto_99041 - BLOCK
      ?auto_99042 - BLOCK
      ?auto_99043 - BLOCK
      ?auto_99044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99038 ) ( ON ?auto_99039 ?auto_99038 ) ( ON ?auto_99040 ?auto_99039 ) ( ON ?auto_99041 ?auto_99040 ) ( ON ?auto_99042 ?auto_99041 ) ( not ( = ?auto_99038 ?auto_99039 ) ) ( not ( = ?auto_99038 ?auto_99040 ) ) ( not ( = ?auto_99038 ?auto_99041 ) ) ( not ( = ?auto_99038 ?auto_99042 ) ) ( not ( = ?auto_99038 ?auto_99043 ) ) ( not ( = ?auto_99038 ?auto_99044 ) ) ( not ( = ?auto_99039 ?auto_99040 ) ) ( not ( = ?auto_99039 ?auto_99041 ) ) ( not ( = ?auto_99039 ?auto_99042 ) ) ( not ( = ?auto_99039 ?auto_99043 ) ) ( not ( = ?auto_99039 ?auto_99044 ) ) ( not ( = ?auto_99040 ?auto_99041 ) ) ( not ( = ?auto_99040 ?auto_99042 ) ) ( not ( = ?auto_99040 ?auto_99043 ) ) ( not ( = ?auto_99040 ?auto_99044 ) ) ( not ( = ?auto_99041 ?auto_99042 ) ) ( not ( = ?auto_99041 ?auto_99043 ) ) ( not ( = ?auto_99041 ?auto_99044 ) ) ( not ( = ?auto_99042 ?auto_99043 ) ) ( not ( = ?auto_99042 ?auto_99044 ) ) ( not ( = ?auto_99043 ?auto_99044 ) ) ( ON-TABLE ?auto_99044 ) ( CLEAR ?auto_99042 ) ( ON ?auto_99043 ?auto_99044 ) ( CLEAR ?auto_99043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99044 )
      ( MAKE-7PILE ?auto_99038 ?auto_99039 ?auto_99040 ?auto_99041 ?auto_99042 ?auto_99043 ?auto_99044 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99045 - BLOCK
      ?auto_99046 - BLOCK
      ?auto_99047 - BLOCK
      ?auto_99048 - BLOCK
      ?auto_99049 - BLOCK
      ?auto_99050 - BLOCK
      ?auto_99051 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99045 ) ( ON ?auto_99046 ?auto_99045 ) ( ON ?auto_99047 ?auto_99046 ) ( ON ?auto_99048 ?auto_99047 ) ( not ( = ?auto_99045 ?auto_99046 ) ) ( not ( = ?auto_99045 ?auto_99047 ) ) ( not ( = ?auto_99045 ?auto_99048 ) ) ( not ( = ?auto_99045 ?auto_99049 ) ) ( not ( = ?auto_99045 ?auto_99050 ) ) ( not ( = ?auto_99045 ?auto_99051 ) ) ( not ( = ?auto_99046 ?auto_99047 ) ) ( not ( = ?auto_99046 ?auto_99048 ) ) ( not ( = ?auto_99046 ?auto_99049 ) ) ( not ( = ?auto_99046 ?auto_99050 ) ) ( not ( = ?auto_99046 ?auto_99051 ) ) ( not ( = ?auto_99047 ?auto_99048 ) ) ( not ( = ?auto_99047 ?auto_99049 ) ) ( not ( = ?auto_99047 ?auto_99050 ) ) ( not ( = ?auto_99047 ?auto_99051 ) ) ( not ( = ?auto_99048 ?auto_99049 ) ) ( not ( = ?auto_99048 ?auto_99050 ) ) ( not ( = ?auto_99048 ?auto_99051 ) ) ( not ( = ?auto_99049 ?auto_99050 ) ) ( not ( = ?auto_99049 ?auto_99051 ) ) ( not ( = ?auto_99050 ?auto_99051 ) ) ( ON-TABLE ?auto_99051 ) ( ON ?auto_99050 ?auto_99051 ) ( CLEAR ?auto_99050 ) ( HOLDING ?auto_99049 ) ( CLEAR ?auto_99048 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99045 ?auto_99046 ?auto_99047 ?auto_99048 ?auto_99049 )
      ( MAKE-7PILE ?auto_99045 ?auto_99046 ?auto_99047 ?auto_99048 ?auto_99049 ?auto_99050 ?auto_99051 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99052 - BLOCK
      ?auto_99053 - BLOCK
      ?auto_99054 - BLOCK
      ?auto_99055 - BLOCK
      ?auto_99056 - BLOCK
      ?auto_99057 - BLOCK
      ?auto_99058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99052 ) ( ON ?auto_99053 ?auto_99052 ) ( ON ?auto_99054 ?auto_99053 ) ( ON ?auto_99055 ?auto_99054 ) ( not ( = ?auto_99052 ?auto_99053 ) ) ( not ( = ?auto_99052 ?auto_99054 ) ) ( not ( = ?auto_99052 ?auto_99055 ) ) ( not ( = ?auto_99052 ?auto_99056 ) ) ( not ( = ?auto_99052 ?auto_99057 ) ) ( not ( = ?auto_99052 ?auto_99058 ) ) ( not ( = ?auto_99053 ?auto_99054 ) ) ( not ( = ?auto_99053 ?auto_99055 ) ) ( not ( = ?auto_99053 ?auto_99056 ) ) ( not ( = ?auto_99053 ?auto_99057 ) ) ( not ( = ?auto_99053 ?auto_99058 ) ) ( not ( = ?auto_99054 ?auto_99055 ) ) ( not ( = ?auto_99054 ?auto_99056 ) ) ( not ( = ?auto_99054 ?auto_99057 ) ) ( not ( = ?auto_99054 ?auto_99058 ) ) ( not ( = ?auto_99055 ?auto_99056 ) ) ( not ( = ?auto_99055 ?auto_99057 ) ) ( not ( = ?auto_99055 ?auto_99058 ) ) ( not ( = ?auto_99056 ?auto_99057 ) ) ( not ( = ?auto_99056 ?auto_99058 ) ) ( not ( = ?auto_99057 ?auto_99058 ) ) ( ON-TABLE ?auto_99058 ) ( ON ?auto_99057 ?auto_99058 ) ( CLEAR ?auto_99055 ) ( ON ?auto_99056 ?auto_99057 ) ( CLEAR ?auto_99056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99058 ?auto_99057 )
      ( MAKE-7PILE ?auto_99052 ?auto_99053 ?auto_99054 ?auto_99055 ?auto_99056 ?auto_99057 ?auto_99058 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99059 - BLOCK
      ?auto_99060 - BLOCK
      ?auto_99061 - BLOCK
      ?auto_99062 - BLOCK
      ?auto_99063 - BLOCK
      ?auto_99064 - BLOCK
      ?auto_99065 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99059 ) ( ON ?auto_99060 ?auto_99059 ) ( ON ?auto_99061 ?auto_99060 ) ( not ( = ?auto_99059 ?auto_99060 ) ) ( not ( = ?auto_99059 ?auto_99061 ) ) ( not ( = ?auto_99059 ?auto_99062 ) ) ( not ( = ?auto_99059 ?auto_99063 ) ) ( not ( = ?auto_99059 ?auto_99064 ) ) ( not ( = ?auto_99059 ?auto_99065 ) ) ( not ( = ?auto_99060 ?auto_99061 ) ) ( not ( = ?auto_99060 ?auto_99062 ) ) ( not ( = ?auto_99060 ?auto_99063 ) ) ( not ( = ?auto_99060 ?auto_99064 ) ) ( not ( = ?auto_99060 ?auto_99065 ) ) ( not ( = ?auto_99061 ?auto_99062 ) ) ( not ( = ?auto_99061 ?auto_99063 ) ) ( not ( = ?auto_99061 ?auto_99064 ) ) ( not ( = ?auto_99061 ?auto_99065 ) ) ( not ( = ?auto_99062 ?auto_99063 ) ) ( not ( = ?auto_99062 ?auto_99064 ) ) ( not ( = ?auto_99062 ?auto_99065 ) ) ( not ( = ?auto_99063 ?auto_99064 ) ) ( not ( = ?auto_99063 ?auto_99065 ) ) ( not ( = ?auto_99064 ?auto_99065 ) ) ( ON-TABLE ?auto_99065 ) ( ON ?auto_99064 ?auto_99065 ) ( ON ?auto_99063 ?auto_99064 ) ( CLEAR ?auto_99063 ) ( HOLDING ?auto_99062 ) ( CLEAR ?auto_99061 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99059 ?auto_99060 ?auto_99061 ?auto_99062 )
      ( MAKE-7PILE ?auto_99059 ?auto_99060 ?auto_99061 ?auto_99062 ?auto_99063 ?auto_99064 ?auto_99065 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99066 - BLOCK
      ?auto_99067 - BLOCK
      ?auto_99068 - BLOCK
      ?auto_99069 - BLOCK
      ?auto_99070 - BLOCK
      ?auto_99071 - BLOCK
      ?auto_99072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99066 ) ( ON ?auto_99067 ?auto_99066 ) ( ON ?auto_99068 ?auto_99067 ) ( not ( = ?auto_99066 ?auto_99067 ) ) ( not ( = ?auto_99066 ?auto_99068 ) ) ( not ( = ?auto_99066 ?auto_99069 ) ) ( not ( = ?auto_99066 ?auto_99070 ) ) ( not ( = ?auto_99066 ?auto_99071 ) ) ( not ( = ?auto_99066 ?auto_99072 ) ) ( not ( = ?auto_99067 ?auto_99068 ) ) ( not ( = ?auto_99067 ?auto_99069 ) ) ( not ( = ?auto_99067 ?auto_99070 ) ) ( not ( = ?auto_99067 ?auto_99071 ) ) ( not ( = ?auto_99067 ?auto_99072 ) ) ( not ( = ?auto_99068 ?auto_99069 ) ) ( not ( = ?auto_99068 ?auto_99070 ) ) ( not ( = ?auto_99068 ?auto_99071 ) ) ( not ( = ?auto_99068 ?auto_99072 ) ) ( not ( = ?auto_99069 ?auto_99070 ) ) ( not ( = ?auto_99069 ?auto_99071 ) ) ( not ( = ?auto_99069 ?auto_99072 ) ) ( not ( = ?auto_99070 ?auto_99071 ) ) ( not ( = ?auto_99070 ?auto_99072 ) ) ( not ( = ?auto_99071 ?auto_99072 ) ) ( ON-TABLE ?auto_99072 ) ( ON ?auto_99071 ?auto_99072 ) ( ON ?auto_99070 ?auto_99071 ) ( CLEAR ?auto_99068 ) ( ON ?auto_99069 ?auto_99070 ) ( CLEAR ?auto_99069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99072 ?auto_99071 ?auto_99070 )
      ( MAKE-7PILE ?auto_99066 ?auto_99067 ?auto_99068 ?auto_99069 ?auto_99070 ?auto_99071 ?auto_99072 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99073 - BLOCK
      ?auto_99074 - BLOCK
      ?auto_99075 - BLOCK
      ?auto_99076 - BLOCK
      ?auto_99077 - BLOCK
      ?auto_99078 - BLOCK
      ?auto_99079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99073 ) ( ON ?auto_99074 ?auto_99073 ) ( not ( = ?auto_99073 ?auto_99074 ) ) ( not ( = ?auto_99073 ?auto_99075 ) ) ( not ( = ?auto_99073 ?auto_99076 ) ) ( not ( = ?auto_99073 ?auto_99077 ) ) ( not ( = ?auto_99073 ?auto_99078 ) ) ( not ( = ?auto_99073 ?auto_99079 ) ) ( not ( = ?auto_99074 ?auto_99075 ) ) ( not ( = ?auto_99074 ?auto_99076 ) ) ( not ( = ?auto_99074 ?auto_99077 ) ) ( not ( = ?auto_99074 ?auto_99078 ) ) ( not ( = ?auto_99074 ?auto_99079 ) ) ( not ( = ?auto_99075 ?auto_99076 ) ) ( not ( = ?auto_99075 ?auto_99077 ) ) ( not ( = ?auto_99075 ?auto_99078 ) ) ( not ( = ?auto_99075 ?auto_99079 ) ) ( not ( = ?auto_99076 ?auto_99077 ) ) ( not ( = ?auto_99076 ?auto_99078 ) ) ( not ( = ?auto_99076 ?auto_99079 ) ) ( not ( = ?auto_99077 ?auto_99078 ) ) ( not ( = ?auto_99077 ?auto_99079 ) ) ( not ( = ?auto_99078 ?auto_99079 ) ) ( ON-TABLE ?auto_99079 ) ( ON ?auto_99078 ?auto_99079 ) ( ON ?auto_99077 ?auto_99078 ) ( ON ?auto_99076 ?auto_99077 ) ( CLEAR ?auto_99076 ) ( HOLDING ?auto_99075 ) ( CLEAR ?auto_99074 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99073 ?auto_99074 ?auto_99075 )
      ( MAKE-7PILE ?auto_99073 ?auto_99074 ?auto_99075 ?auto_99076 ?auto_99077 ?auto_99078 ?auto_99079 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99080 - BLOCK
      ?auto_99081 - BLOCK
      ?auto_99082 - BLOCK
      ?auto_99083 - BLOCK
      ?auto_99084 - BLOCK
      ?auto_99085 - BLOCK
      ?auto_99086 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99080 ) ( ON ?auto_99081 ?auto_99080 ) ( not ( = ?auto_99080 ?auto_99081 ) ) ( not ( = ?auto_99080 ?auto_99082 ) ) ( not ( = ?auto_99080 ?auto_99083 ) ) ( not ( = ?auto_99080 ?auto_99084 ) ) ( not ( = ?auto_99080 ?auto_99085 ) ) ( not ( = ?auto_99080 ?auto_99086 ) ) ( not ( = ?auto_99081 ?auto_99082 ) ) ( not ( = ?auto_99081 ?auto_99083 ) ) ( not ( = ?auto_99081 ?auto_99084 ) ) ( not ( = ?auto_99081 ?auto_99085 ) ) ( not ( = ?auto_99081 ?auto_99086 ) ) ( not ( = ?auto_99082 ?auto_99083 ) ) ( not ( = ?auto_99082 ?auto_99084 ) ) ( not ( = ?auto_99082 ?auto_99085 ) ) ( not ( = ?auto_99082 ?auto_99086 ) ) ( not ( = ?auto_99083 ?auto_99084 ) ) ( not ( = ?auto_99083 ?auto_99085 ) ) ( not ( = ?auto_99083 ?auto_99086 ) ) ( not ( = ?auto_99084 ?auto_99085 ) ) ( not ( = ?auto_99084 ?auto_99086 ) ) ( not ( = ?auto_99085 ?auto_99086 ) ) ( ON-TABLE ?auto_99086 ) ( ON ?auto_99085 ?auto_99086 ) ( ON ?auto_99084 ?auto_99085 ) ( ON ?auto_99083 ?auto_99084 ) ( CLEAR ?auto_99081 ) ( ON ?auto_99082 ?auto_99083 ) ( CLEAR ?auto_99082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99086 ?auto_99085 ?auto_99084 ?auto_99083 )
      ( MAKE-7PILE ?auto_99080 ?auto_99081 ?auto_99082 ?auto_99083 ?auto_99084 ?auto_99085 ?auto_99086 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99087 - BLOCK
      ?auto_99088 - BLOCK
      ?auto_99089 - BLOCK
      ?auto_99090 - BLOCK
      ?auto_99091 - BLOCK
      ?auto_99092 - BLOCK
      ?auto_99093 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99087 ) ( not ( = ?auto_99087 ?auto_99088 ) ) ( not ( = ?auto_99087 ?auto_99089 ) ) ( not ( = ?auto_99087 ?auto_99090 ) ) ( not ( = ?auto_99087 ?auto_99091 ) ) ( not ( = ?auto_99087 ?auto_99092 ) ) ( not ( = ?auto_99087 ?auto_99093 ) ) ( not ( = ?auto_99088 ?auto_99089 ) ) ( not ( = ?auto_99088 ?auto_99090 ) ) ( not ( = ?auto_99088 ?auto_99091 ) ) ( not ( = ?auto_99088 ?auto_99092 ) ) ( not ( = ?auto_99088 ?auto_99093 ) ) ( not ( = ?auto_99089 ?auto_99090 ) ) ( not ( = ?auto_99089 ?auto_99091 ) ) ( not ( = ?auto_99089 ?auto_99092 ) ) ( not ( = ?auto_99089 ?auto_99093 ) ) ( not ( = ?auto_99090 ?auto_99091 ) ) ( not ( = ?auto_99090 ?auto_99092 ) ) ( not ( = ?auto_99090 ?auto_99093 ) ) ( not ( = ?auto_99091 ?auto_99092 ) ) ( not ( = ?auto_99091 ?auto_99093 ) ) ( not ( = ?auto_99092 ?auto_99093 ) ) ( ON-TABLE ?auto_99093 ) ( ON ?auto_99092 ?auto_99093 ) ( ON ?auto_99091 ?auto_99092 ) ( ON ?auto_99090 ?auto_99091 ) ( ON ?auto_99089 ?auto_99090 ) ( CLEAR ?auto_99089 ) ( HOLDING ?auto_99088 ) ( CLEAR ?auto_99087 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99087 ?auto_99088 )
      ( MAKE-7PILE ?auto_99087 ?auto_99088 ?auto_99089 ?auto_99090 ?auto_99091 ?auto_99092 ?auto_99093 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99094 - BLOCK
      ?auto_99095 - BLOCK
      ?auto_99096 - BLOCK
      ?auto_99097 - BLOCK
      ?auto_99098 - BLOCK
      ?auto_99099 - BLOCK
      ?auto_99100 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_99094 ) ( not ( = ?auto_99094 ?auto_99095 ) ) ( not ( = ?auto_99094 ?auto_99096 ) ) ( not ( = ?auto_99094 ?auto_99097 ) ) ( not ( = ?auto_99094 ?auto_99098 ) ) ( not ( = ?auto_99094 ?auto_99099 ) ) ( not ( = ?auto_99094 ?auto_99100 ) ) ( not ( = ?auto_99095 ?auto_99096 ) ) ( not ( = ?auto_99095 ?auto_99097 ) ) ( not ( = ?auto_99095 ?auto_99098 ) ) ( not ( = ?auto_99095 ?auto_99099 ) ) ( not ( = ?auto_99095 ?auto_99100 ) ) ( not ( = ?auto_99096 ?auto_99097 ) ) ( not ( = ?auto_99096 ?auto_99098 ) ) ( not ( = ?auto_99096 ?auto_99099 ) ) ( not ( = ?auto_99096 ?auto_99100 ) ) ( not ( = ?auto_99097 ?auto_99098 ) ) ( not ( = ?auto_99097 ?auto_99099 ) ) ( not ( = ?auto_99097 ?auto_99100 ) ) ( not ( = ?auto_99098 ?auto_99099 ) ) ( not ( = ?auto_99098 ?auto_99100 ) ) ( not ( = ?auto_99099 ?auto_99100 ) ) ( ON-TABLE ?auto_99100 ) ( ON ?auto_99099 ?auto_99100 ) ( ON ?auto_99098 ?auto_99099 ) ( ON ?auto_99097 ?auto_99098 ) ( ON ?auto_99096 ?auto_99097 ) ( CLEAR ?auto_99094 ) ( ON ?auto_99095 ?auto_99096 ) ( CLEAR ?auto_99095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99100 ?auto_99099 ?auto_99098 ?auto_99097 ?auto_99096 )
      ( MAKE-7PILE ?auto_99094 ?auto_99095 ?auto_99096 ?auto_99097 ?auto_99098 ?auto_99099 ?auto_99100 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99101 - BLOCK
      ?auto_99102 - BLOCK
      ?auto_99103 - BLOCK
      ?auto_99104 - BLOCK
      ?auto_99105 - BLOCK
      ?auto_99106 - BLOCK
      ?auto_99107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99101 ?auto_99102 ) ) ( not ( = ?auto_99101 ?auto_99103 ) ) ( not ( = ?auto_99101 ?auto_99104 ) ) ( not ( = ?auto_99101 ?auto_99105 ) ) ( not ( = ?auto_99101 ?auto_99106 ) ) ( not ( = ?auto_99101 ?auto_99107 ) ) ( not ( = ?auto_99102 ?auto_99103 ) ) ( not ( = ?auto_99102 ?auto_99104 ) ) ( not ( = ?auto_99102 ?auto_99105 ) ) ( not ( = ?auto_99102 ?auto_99106 ) ) ( not ( = ?auto_99102 ?auto_99107 ) ) ( not ( = ?auto_99103 ?auto_99104 ) ) ( not ( = ?auto_99103 ?auto_99105 ) ) ( not ( = ?auto_99103 ?auto_99106 ) ) ( not ( = ?auto_99103 ?auto_99107 ) ) ( not ( = ?auto_99104 ?auto_99105 ) ) ( not ( = ?auto_99104 ?auto_99106 ) ) ( not ( = ?auto_99104 ?auto_99107 ) ) ( not ( = ?auto_99105 ?auto_99106 ) ) ( not ( = ?auto_99105 ?auto_99107 ) ) ( not ( = ?auto_99106 ?auto_99107 ) ) ( ON-TABLE ?auto_99107 ) ( ON ?auto_99106 ?auto_99107 ) ( ON ?auto_99105 ?auto_99106 ) ( ON ?auto_99104 ?auto_99105 ) ( ON ?auto_99103 ?auto_99104 ) ( ON ?auto_99102 ?auto_99103 ) ( CLEAR ?auto_99102 ) ( HOLDING ?auto_99101 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99101 )
      ( MAKE-7PILE ?auto_99101 ?auto_99102 ?auto_99103 ?auto_99104 ?auto_99105 ?auto_99106 ?auto_99107 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99108 - BLOCK
      ?auto_99109 - BLOCK
      ?auto_99110 - BLOCK
      ?auto_99111 - BLOCK
      ?auto_99112 - BLOCK
      ?auto_99113 - BLOCK
      ?auto_99114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99108 ?auto_99109 ) ) ( not ( = ?auto_99108 ?auto_99110 ) ) ( not ( = ?auto_99108 ?auto_99111 ) ) ( not ( = ?auto_99108 ?auto_99112 ) ) ( not ( = ?auto_99108 ?auto_99113 ) ) ( not ( = ?auto_99108 ?auto_99114 ) ) ( not ( = ?auto_99109 ?auto_99110 ) ) ( not ( = ?auto_99109 ?auto_99111 ) ) ( not ( = ?auto_99109 ?auto_99112 ) ) ( not ( = ?auto_99109 ?auto_99113 ) ) ( not ( = ?auto_99109 ?auto_99114 ) ) ( not ( = ?auto_99110 ?auto_99111 ) ) ( not ( = ?auto_99110 ?auto_99112 ) ) ( not ( = ?auto_99110 ?auto_99113 ) ) ( not ( = ?auto_99110 ?auto_99114 ) ) ( not ( = ?auto_99111 ?auto_99112 ) ) ( not ( = ?auto_99111 ?auto_99113 ) ) ( not ( = ?auto_99111 ?auto_99114 ) ) ( not ( = ?auto_99112 ?auto_99113 ) ) ( not ( = ?auto_99112 ?auto_99114 ) ) ( not ( = ?auto_99113 ?auto_99114 ) ) ( ON-TABLE ?auto_99114 ) ( ON ?auto_99113 ?auto_99114 ) ( ON ?auto_99112 ?auto_99113 ) ( ON ?auto_99111 ?auto_99112 ) ( ON ?auto_99110 ?auto_99111 ) ( ON ?auto_99109 ?auto_99110 ) ( ON ?auto_99108 ?auto_99109 ) ( CLEAR ?auto_99108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99114 ?auto_99113 ?auto_99112 ?auto_99111 ?auto_99110 ?auto_99109 )
      ( MAKE-7PILE ?auto_99108 ?auto_99109 ?auto_99110 ?auto_99111 ?auto_99112 ?auto_99113 ?auto_99114 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99122 - BLOCK
      ?auto_99123 - BLOCK
      ?auto_99124 - BLOCK
      ?auto_99125 - BLOCK
      ?auto_99126 - BLOCK
      ?auto_99127 - BLOCK
      ?auto_99128 - BLOCK
    )
    :vars
    (
      ?auto_99129 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99122 ?auto_99123 ) ) ( not ( = ?auto_99122 ?auto_99124 ) ) ( not ( = ?auto_99122 ?auto_99125 ) ) ( not ( = ?auto_99122 ?auto_99126 ) ) ( not ( = ?auto_99122 ?auto_99127 ) ) ( not ( = ?auto_99122 ?auto_99128 ) ) ( not ( = ?auto_99123 ?auto_99124 ) ) ( not ( = ?auto_99123 ?auto_99125 ) ) ( not ( = ?auto_99123 ?auto_99126 ) ) ( not ( = ?auto_99123 ?auto_99127 ) ) ( not ( = ?auto_99123 ?auto_99128 ) ) ( not ( = ?auto_99124 ?auto_99125 ) ) ( not ( = ?auto_99124 ?auto_99126 ) ) ( not ( = ?auto_99124 ?auto_99127 ) ) ( not ( = ?auto_99124 ?auto_99128 ) ) ( not ( = ?auto_99125 ?auto_99126 ) ) ( not ( = ?auto_99125 ?auto_99127 ) ) ( not ( = ?auto_99125 ?auto_99128 ) ) ( not ( = ?auto_99126 ?auto_99127 ) ) ( not ( = ?auto_99126 ?auto_99128 ) ) ( not ( = ?auto_99127 ?auto_99128 ) ) ( ON-TABLE ?auto_99128 ) ( ON ?auto_99127 ?auto_99128 ) ( ON ?auto_99126 ?auto_99127 ) ( ON ?auto_99125 ?auto_99126 ) ( ON ?auto_99124 ?auto_99125 ) ( ON ?auto_99123 ?auto_99124 ) ( CLEAR ?auto_99123 ) ( ON ?auto_99122 ?auto_99129 ) ( CLEAR ?auto_99122 ) ( HAND-EMPTY ) ( not ( = ?auto_99122 ?auto_99129 ) ) ( not ( = ?auto_99123 ?auto_99129 ) ) ( not ( = ?auto_99124 ?auto_99129 ) ) ( not ( = ?auto_99125 ?auto_99129 ) ) ( not ( = ?auto_99126 ?auto_99129 ) ) ( not ( = ?auto_99127 ?auto_99129 ) ) ( not ( = ?auto_99128 ?auto_99129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_99122 ?auto_99129 )
      ( MAKE-7PILE ?auto_99122 ?auto_99123 ?auto_99124 ?auto_99125 ?auto_99126 ?auto_99127 ?auto_99128 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99130 - BLOCK
      ?auto_99131 - BLOCK
      ?auto_99132 - BLOCK
      ?auto_99133 - BLOCK
      ?auto_99134 - BLOCK
      ?auto_99135 - BLOCK
      ?auto_99136 - BLOCK
    )
    :vars
    (
      ?auto_99137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99130 ?auto_99131 ) ) ( not ( = ?auto_99130 ?auto_99132 ) ) ( not ( = ?auto_99130 ?auto_99133 ) ) ( not ( = ?auto_99130 ?auto_99134 ) ) ( not ( = ?auto_99130 ?auto_99135 ) ) ( not ( = ?auto_99130 ?auto_99136 ) ) ( not ( = ?auto_99131 ?auto_99132 ) ) ( not ( = ?auto_99131 ?auto_99133 ) ) ( not ( = ?auto_99131 ?auto_99134 ) ) ( not ( = ?auto_99131 ?auto_99135 ) ) ( not ( = ?auto_99131 ?auto_99136 ) ) ( not ( = ?auto_99132 ?auto_99133 ) ) ( not ( = ?auto_99132 ?auto_99134 ) ) ( not ( = ?auto_99132 ?auto_99135 ) ) ( not ( = ?auto_99132 ?auto_99136 ) ) ( not ( = ?auto_99133 ?auto_99134 ) ) ( not ( = ?auto_99133 ?auto_99135 ) ) ( not ( = ?auto_99133 ?auto_99136 ) ) ( not ( = ?auto_99134 ?auto_99135 ) ) ( not ( = ?auto_99134 ?auto_99136 ) ) ( not ( = ?auto_99135 ?auto_99136 ) ) ( ON-TABLE ?auto_99136 ) ( ON ?auto_99135 ?auto_99136 ) ( ON ?auto_99134 ?auto_99135 ) ( ON ?auto_99133 ?auto_99134 ) ( ON ?auto_99132 ?auto_99133 ) ( ON ?auto_99130 ?auto_99137 ) ( CLEAR ?auto_99130 ) ( not ( = ?auto_99130 ?auto_99137 ) ) ( not ( = ?auto_99131 ?auto_99137 ) ) ( not ( = ?auto_99132 ?auto_99137 ) ) ( not ( = ?auto_99133 ?auto_99137 ) ) ( not ( = ?auto_99134 ?auto_99137 ) ) ( not ( = ?auto_99135 ?auto_99137 ) ) ( not ( = ?auto_99136 ?auto_99137 ) ) ( HOLDING ?auto_99131 ) ( CLEAR ?auto_99132 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99136 ?auto_99135 ?auto_99134 ?auto_99133 ?auto_99132 ?auto_99131 )
      ( MAKE-7PILE ?auto_99130 ?auto_99131 ?auto_99132 ?auto_99133 ?auto_99134 ?auto_99135 ?auto_99136 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99138 - BLOCK
      ?auto_99139 - BLOCK
      ?auto_99140 - BLOCK
      ?auto_99141 - BLOCK
      ?auto_99142 - BLOCK
      ?auto_99143 - BLOCK
      ?auto_99144 - BLOCK
    )
    :vars
    (
      ?auto_99145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99138 ?auto_99139 ) ) ( not ( = ?auto_99138 ?auto_99140 ) ) ( not ( = ?auto_99138 ?auto_99141 ) ) ( not ( = ?auto_99138 ?auto_99142 ) ) ( not ( = ?auto_99138 ?auto_99143 ) ) ( not ( = ?auto_99138 ?auto_99144 ) ) ( not ( = ?auto_99139 ?auto_99140 ) ) ( not ( = ?auto_99139 ?auto_99141 ) ) ( not ( = ?auto_99139 ?auto_99142 ) ) ( not ( = ?auto_99139 ?auto_99143 ) ) ( not ( = ?auto_99139 ?auto_99144 ) ) ( not ( = ?auto_99140 ?auto_99141 ) ) ( not ( = ?auto_99140 ?auto_99142 ) ) ( not ( = ?auto_99140 ?auto_99143 ) ) ( not ( = ?auto_99140 ?auto_99144 ) ) ( not ( = ?auto_99141 ?auto_99142 ) ) ( not ( = ?auto_99141 ?auto_99143 ) ) ( not ( = ?auto_99141 ?auto_99144 ) ) ( not ( = ?auto_99142 ?auto_99143 ) ) ( not ( = ?auto_99142 ?auto_99144 ) ) ( not ( = ?auto_99143 ?auto_99144 ) ) ( ON-TABLE ?auto_99144 ) ( ON ?auto_99143 ?auto_99144 ) ( ON ?auto_99142 ?auto_99143 ) ( ON ?auto_99141 ?auto_99142 ) ( ON ?auto_99140 ?auto_99141 ) ( ON ?auto_99138 ?auto_99145 ) ( not ( = ?auto_99138 ?auto_99145 ) ) ( not ( = ?auto_99139 ?auto_99145 ) ) ( not ( = ?auto_99140 ?auto_99145 ) ) ( not ( = ?auto_99141 ?auto_99145 ) ) ( not ( = ?auto_99142 ?auto_99145 ) ) ( not ( = ?auto_99143 ?auto_99145 ) ) ( not ( = ?auto_99144 ?auto_99145 ) ) ( CLEAR ?auto_99140 ) ( ON ?auto_99139 ?auto_99138 ) ( CLEAR ?auto_99139 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_99145 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99145 ?auto_99138 )
      ( MAKE-7PILE ?auto_99138 ?auto_99139 ?auto_99140 ?auto_99141 ?auto_99142 ?auto_99143 ?auto_99144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99146 - BLOCK
      ?auto_99147 - BLOCK
      ?auto_99148 - BLOCK
      ?auto_99149 - BLOCK
      ?auto_99150 - BLOCK
      ?auto_99151 - BLOCK
      ?auto_99152 - BLOCK
    )
    :vars
    (
      ?auto_99153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99146 ?auto_99147 ) ) ( not ( = ?auto_99146 ?auto_99148 ) ) ( not ( = ?auto_99146 ?auto_99149 ) ) ( not ( = ?auto_99146 ?auto_99150 ) ) ( not ( = ?auto_99146 ?auto_99151 ) ) ( not ( = ?auto_99146 ?auto_99152 ) ) ( not ( = ?auto_99147 ?auto_99148 ) ) ( not ( = ?auto_99147 ?auto_99149 ) ) ( not ( = ?auto_99147 ?auto_99150 ) ) ( not ( = ?auto_99147 ?auto_99151 ) ) ( not ( = ?auto_99147 ?auto_99152 ) ) ( not ( = ?auto_99148 ?auto_99149 ) ) ( not ( = ?auto_99148 ?auto_99150 ) ) ( not ( = ?auto_99148 ?auto_99151 ) ) ( not ( = ?auto_99148 ?auto_99152 ) ) ( not ( = ?auto_99149 ?auto_99150 ) ) ( not ( = ?auto_99149 ?auto_99151 ) ) ( not ( = ?auto_99149 ?auto_99152 ) ) ( not ( = ?auto_99150 ?auto_99151 ) ) ( not ( = ?auto_99150 ?auto_99152 ) ) ( not ( = ?auto_99151 ?auto_99152 ) ) ( ON-TABLE ?auto_99152 ) ( ON ?auto_99151 ?auto_99152 ) ( ON ?auto_99150 ?auto_99151 ) ( ON ?auto_99149 ?auto_99150 ) ( ON ?auto_99146 ?auto_99153 ) ( not ( = ?auto_99146 ?auto_99153 ) ) ( not ( = ?auto_99147 ?auto_99153 ) ) ( not ( = ?auto_99148 ?auto_99153 ) ) ( not ( = ?auto_99149 ?auto_99153 ) ) ( not ( = ?auto_99150 ?auto_99153 ) ) ( not ( = ?auto_99151 ?auto_99153 ) ) ( not ( = ?auto_99152 ?auto_99153 ) ) ( ON ?auto_99147 ?auto_99146 ) ( CLEAR ?auto_99147 ) ( ON-TABLE ?auto_99153 ) ( HOLDING ?auto_99148 ) ( CLEAR ?auto_99149 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99152 ?auto_99151 ?auto_99150 ?auto_99149 ?auto_99148 )
      ( MAKE-7PILE ?auto_99146 ?auto_99147 ?auto_99148 ?auto_99149 ?auto_99150 ?auto_99151 ?auto_99152 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99154 - BLOCK
      ?auto_99155 - BLOCK
      ?auto_99156 - BLOCK
      ?auto_99157 - BLOCK
      ?auto_99158 - BLOCK
      ?auto_99159 - BLOCK
      ?auto_99160 - BLOCK
    )
    :vars
    (
      ?auto_99161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99154 ?auto_99155 ) ) ( not ( = ?auto_99154 ?auto_99156 ) ) ( not ( = ?auto_99154 ?auto_99157 ) ) ( not ( = ?auto_99154 ?auto_99158 ) ) ( not ( = ?auto_99154 ?auto_99159 ) ) ( not ( = ?auto_99154 ?auto_99160 ) ) ( not ( = ?auto_99155 ?auto_99156 ) ) ( not ( = ?auto_99155 ?auto_99157 ) ) ( not ( = ?auto_99155 ?auto_99158 ) ) ( not ( = ?auto_99155 ?auto_99159 ) ) ( not ( = ?auto_99155 ?auto_99160 ) ) ( not ( = ?auto_99156 ?auto_99157 ) ) ( not ( = ?auto_99156 ?auto_99158 ) ) ( not ( = ?auto_99156 ?auto_99159 ) ) ( not ( = ?auto_99156 ?auto_99160 ) ) ( not ( = ?auto_99157 ?auto_99158 ) ) ( not ( = ?auto_99157 ?auto_99159 ) ) ( not ( = ?auto_99157 ?auto_99160 ) ) ( not ( = ?auto_99158 ?auto_99159 ) ) ( not ( = ?auto_99158 ?auto_99160 ) ) ( not ( = ?auto_99159 ?auto_99160 ) ) ( ON-TABLE ?auto_99160 ) ( ON ?auto_99159 ?auto_99160 ) ( ON ?auto_99158 ?auto_99159 ) ( ON ?auto_99157 ?auto_99158 ) ( ON ?auto_99154 ?auto_99161 ) ( not ( = ?auto_99154 ?auto_99161 ) ) ( not ( = ?auto_99155 ?auto_99161 ) ) ( not ( = ?auto_99156 ?auto_99161 ) ) ( not ( = ?auto_99157 ?auto_99161 ) ) ( not ( = ?auto_99158 ?auto_99161 ) ) ( not ( = ?auto_99159 ?auto_99161 ) ) ( not ( = ?auto_99160 ?auto_99161 ) ) ( ON ?auto_99155 ?auto_99154 ) ( ON-TABLE ?auto_99161 ) ( CLEAR ?auto_99157 ) ( ON ?auto_99156 ?auto_99155 ) ( CLEAR ?auto_99156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99161 ?auto_99154 ?auto_99155 )
      ( MAKE-7PILE ?auto_99154 ?auto_99155 ?auto_99156 ?auto_99157 ?auto_99158 ?auto_99159 ?auto_99160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99162 - BLOCK
      ?auto_99163 - BLOCK
      ?auto_99164 - BLOCK
      ?auto_99165 - BLOCK
      ?auto_99166 - BLOCK
      ?auto_99167 - BLOCK
      ?auto_99168 - BLOCK
    )
    :vars
    (
      ?auto_99169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99162 ?auto_99163 ) ) ( not ( = ?auto_99162 ?auto_99164 ) ) ( not ( = ?auto_99162 ?auto_99165 ) ) ( not ( = ?auto_99162 ?auto_99166 ) ) ( not ( = ?auto_99162 ?auto_99167 ) ) ( not ( = ?auto_99162 ?auto_99168 ) ) ( not ( = ?auto_99163 ?auto_99164 ) ) ( not ( = ?auto_99163 ?auto_99165 ) ) ( not ( = ?auto_99163 ?auto_99166 ) ) ( not ( = ?auto_99163 ?auto_99167 ) ) ( not ( = ?auto_99163 ?auto_99168 ) ) ( not ( = ?auto_99164 ?auto_99165 ) ) ( not ( = ?auto_99164 ?auto_99166 ) ) ( not ( = ?auto_99164 ?auto_99167 ) ) ( not ( = ?auto_99164 ?auto_99168 ) ) ( not ( = ?auto_99165 ?auto_99166 ) ) ( not ( = ?auto_99165 ?auto_99167 ) ) ( not ( = ?auto_99165 ?auto_99168 ) ) ( not ( = ?auto_99166 ?auto_99167 ) ) ( not ( = ?auto_99166 ?auto_99168 ) ) ( not ( = ?auto_99167 ?auto_99168 ) ) ( ON-TABLE ?auto_99168 ) ( ON ?auto_99167 ?auto_99168 ) ( ON ?auto_99166 ?auto_99167 ) ( ON ?auto_99162 ?auto_99169 ) ( not ( = ?auto_99162 ?auto_99169 ) ) ( not ( = ?auto_99163 ?auto_99169 ) ) ( not ( = ?auto_99164 ?auto_99169 ) ) ( not ( = ?auto_99165 ?auto_99169 ) ) ( not ( = ?auto_99166 ?auto_99169 ) ) ( not ( = ?auto_99167 ?auto_99169 ) ) ( not ( = ?auto_99168 ?auto_99169 ) ) ( ON ?auto_99163 ?auto_99162 ) ( ON-TABLE ?auto_99169 ) ( ON ?auto_99164 ?auto_99163 ) ( CLEAR ?auto_99164 ) ( HOLDING ?auto_99165 ) ( CLEAR ?auto_99166 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99168 ?auto_99167 ?auto_99166 ?auto_99165 )
      ( MAKE-7PILE ?auto_99162 ?auto_99163 ?auto_99164 ?auto_99165 ?auto_99166 ?auto_99167 ?auto_99168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99170 - BLOCK
      ?auto_99171 - BLOCK
      ?auto_99172 - BLOCK
      ?auto_99173 - BLOCK
      ?auto_99174 - BLOCK
      ?auto_99175 - BLOCK
      ?auto_99176 - BLOCK
    )
    :vars
    (
      ?auto_99177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99170 ?auto_99171 ) ) ( not ( = ?auto_99170 ?auto_99172 ) ) ( not ( = ?auto_99170 ?auto_99173 ) ) ( not ( = ?auto_99170 ?auto_99174 ) ) ( not ( = ?auto_99170 ?auto_99175 ) ) ( not ( = ?auto_99170 ?auto_99176 ) ) ( not ( = ?auto_99171 ?auto_99172 ) ) ( not ( = ?auto_99171 ?auto_99173 ) ) ( not ( = ?auto_99171 ?auto_99174 ) ) ( not ( = ?auto_99171 ?auto_99175 ) ) ( not ( = ?auto_99171 ?auto_99176 ) ) ( not ( = ?auto_99172 ?auto_99173 ) ) ( not ( = ?auto_99172 ?auto_99174 ) ) ( not ( = ?auto_99172 ?auto_99175 ) ) ( not ( = ?auto_99172 ?auto_99176 ) ) ( not ( = ?auto_99173 ?auto_99174 ) ) ( not ( = ?auto_99173 ?auto_99175 ) ) ( not ( = ?auto_99173 ?auto_99176 ) ) ( not ( = ?auto_99174 ?auto_99175 ) ) ( not ( = ?auto_99174 ?auto_99176 ) ) ( not ( = ?auto_99175 ?auto_99176 ) ) ( ON-TABLE ?auto_99176 ) ( ON ?auto_99175 ?auto_99176 ) ( ON ?auto_99174 ?auto_99175 ) ( ON ?auto_99170 ?auto_99177 ) ( not ( = ?auto_99170 ?auto_99177 ) ) ( not ( = ?auto_99171 ?auto_99177 ) ) ( not ( = ?auto_99172 ?auto_99177 ) ) ( not ( = ?auto_99173 ?auto_99177 ) ) ( not ( = ?auto_99174 ?auto_99177 ) ) ( not ( = ?auto_99175 ?auto_99177 ) ) ( not ( = ?auto_99176 ?auto_99177 ) ) ( ON ?auto_99171 ?auto_99170 ) ( ON-TABLE ?auto_99177 ) ( ON ?auto_99172 ?auto_99171 ) ( CLEAR ?auto_99174 ) ( ON ?auto_99173 ?auto_99172 ) ( CLEAR ?auto_99173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_99177 ?auto_99170 ?auto_99171 ?auto_99172 )
      ( MAKE-7PILE ?auto_99170 ?auto_99171 ?auto_99172 ?auto_99173 ?auto_99174 ?auto_99175 ?auto_99176 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99178 - BLOCK
      ?auto_99179 - BLOCK
      ?auto_99180 - BLOCK
      ?auto_99181 - BLOCK
      ?auto_99182 - BLOCK
      ?auto_99183 - BLOCK
      ?auto_99184 - BLOCK
    )
    :vars
    (
      ?auto_99185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99178 ?auto_99179 ) ) ( not ( = ?auto_99178 ?auto_99180 ) ) ( not ( = ?auto_99178 ?auto_99181 ) ) ( not ( = ?auto_99178 ?auto_99182 ) ) ( not ( = ?auto_99178 ?auto_99183 ) ) ( not ( = ?auto_99178 ?auto_99184 ) ) ( not ( = ?auto_99179 ?auto_99180 ) ) ( not ( = ?auto_99179 ?auto_99181 ) ) ( not ( = ?auto_99179 ?auto_99182 ) ) ( not ( = ?auto_99179 ?auto_99183 ) ) ( not ( = ?auto_99179 ?auto_99184 ) ) ( not ( = ?auto_99180 ?auto_99181 ) ) ( not ( = ?auto_99180 ?auto_99182 ) ) ( not ( = ?auto_99180 ?auto_99183 ) ) ( not ( = ?auto_99180 ?auto_99184 ) ) ( not ( = ?auto_99181 ?auto_99182 ) ) ( not ( = ?auto_99181 ?auto_99183 ) ) ( not ( = ?auto_99181 ?auto_99184 ) ) ( not ( = ?auto_99182 ?auto_99183 ) ) ( not ( = ?auto_99182 ?auto_99184 ) ) ( not ( = ?auto_99183 ?auto_99184 ) ) ( ON-TABLE ?auto_99184 ) ( ON ?auto_99183 ?auto_99184 ) ( ON ?auto_99178 ?auto_99185 ) ( not ( = ?auto_99178 ?auto_99185 ) ) ( not ( = ?auto_99179 ?auto_99185 ) ) ( not ( = ?auto_99180 ?auto_99185 ) ) ( not ( = ?auto_99181 ?auto_99185 ) ) ( not ( = ?auto_99182 ?auto_99185 ) ) ( not ( = ?auto_99183 ?auto_99185 ) ) ( not ( = ?auto_99184 ?auto_99185 ) ) ( ON ?auto_99179 ?auto_99178 ) ( ON-TABLE ?auto_99185 ) ( ON ?auto_99180 ?auto_99179 ) ( ON ?auto_99181 ?auto_99180 ) ( CLEAR ?auto_99181 ) ( HOLDING ?auto_99182 ) ( CLEAR ?auto_99183 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_99184 ?auto_99183 ?auto_99182 )
      ( MAKE-7PILE ?auto_99178 ?auto_99179 ?auto_99180 ?auto_99181 ?auto_99182 ?auto_99183 ?auto_99184 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99186 - BLOCK
      ?auto_99187 - BLOCK
      ?auto_99188 - BLOCK
      ?auto_99189 - BLOCK
      ?auto_99190 - BLOCK
      ?auto_99191 - BLOCK
      ?auto_99192 - BLOCK
    )
    :vars
    (
      ?auto_99193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99186 ?auto_99187 ) ) ( not ( = ?auto_99186 ?auto_99188 ) ) ( not ( = ?auto_99186 ?auto_99189 ) ) ( not ( = ?auto_99186 ?auto_99190 ) ) ( not ( = ?auto_99186 ?auto_99191 ) ) ( not ( = ?auto_99186 ?auto_99192 ) ) ( not ( = ?auto_99187 ?auto_99188 ) ) ( not ( = ?auto_99187 ?auto_99189 ) ) ( not ( = ?auto_99187 ?auto_99190 ) ) ( not ( = ?auto_99187 ?auto_99191 ) ) ( not ( = ?auto_99187 ?auto_99192 ) ) ( not ( = ?auto_99188 ?auto_99189 ) ) ( not ( = ?auto_99188 ?auto_99190 ) ) ( not ( = ?auto_99188 ?auto_99191 ) ) ( not ( = ?auto_99188 ?auto_99192 ) ) ( not ( = ?auto_99189 ?auto_99190 ) ) ( not ( = ?auto_99189 ?auto_99191 ) ) ( not ( = ?auto_99189 ?auto_99192 ) ) ( not ( = ?auto_99190 ?auto_99191 ) ) ( not ( = ?auto_99190 ?auto_99192 ) ) ( not ( = ?auto_99191 ?auto_99192 ) ) ( ON-TABLE ?auto_99192 ) ( ON ?auto_99191 ?auto_99192 ) ( ON ?auto_99186 ?auto_99193 ) ( not ( = ?auto_99186 ?auto_99193 ) ) ( not ( = ?auto_99187 ?auto_99193 ) ) ( not ( = ?auto_99188 ?auto_99193 ) ) ( not ( = ?auto_99189 ?auto_99193 ) ) ( not ( = ?auto_99190 ?auto_99193 ) ) ( not ( = ?auto_99191 ?auto_99193 ) ) ( not ( = ?auto_99192 ?auto_99193 ) ) ( ON ?auto_99187 ?auto_99186 ) ( ON-TABLE ?auto_99193 ) ( ON ?auto_99188 ?auto_99187 ) ( ON ?auto_99189 ?auto_99188 ) ( CLEAR ?auto_99191 ) ( ON ?auto_99190 ?auto_99189 ) ( CLEAR ?auto_99190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_99193 ?auto_99186 ?auto_99187 ?auto_99188 ?auto_99189 )
      ( MAKE-7PILE ?auto_99186 ?auto_99187 ?auto_99188 ?auto_99189 ?auto_99190 ?auto_99191 ?auto_99192 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99194 - BLOCK
      ?auto_99195 - BLOCK
      ?auto_99196 - BLOCK
      ?auto_99197 - BLOCK
      ?auto_99198 - BLOCK
      ?auto_99199 - BLOCK
      ?auto_99200 - BLOCK
    )
    :vars
    (
      ?auto_99201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99194 ?auto_99195 ) ) ( not ( = ?auto_99194 ?auto_99196 ) ) ( not ( = ?auto_99194 ?auto_99197 ) ) ( not ( = ?auto_99194 ?auto_99198 ) ) ( not ( = ?auto_99194 ?auto_99199 ) ) ( not ( = ?auto_99194 ?auto_99200 ) ) ( not ( = ?auto_99195 ?auto_99196 ) ) ( not ( = ?auto_99195 ?auto_99197 ) ) ( not ( = ?auto_99195 ?auto_99198 ) ) ( not ( = ?auto_99195 ?auto_99199 ) ) ( not ( = ?auto_99195 ?auto_99200 ) ) ( not ( = ?auto_99196 ?auto_99197 ) ) ( not ( = ?auto_99196 ?auto_99198 ) ) ( not ( = ?auto_99196 ?auto_99199 ) ) ( not ( = ?auto_99196 ?auto_99200 ) ) ( not ( = ?auto_99197 ?auto_99198 ) ) ( not ( = ?auto_99197 ?auto_99199 ) ) ( not ( = ?auto_99197 ?auto_99200 ) ) ( not ( = ?auto_99198 ?auto_99199 ) ) ( not ( = ?auto_99198 ?auto_99200 ) ) ( not ( = ?auto_99199 ?auto_99200 ) ) ( ON-TABLE ?auto_99200 ) ( ON ?auto_99194 ?auto_99201 ) ( not ( = ?auto_99194 ?auto_99201 ) ) ( not ( = ?auto_99195 ?auto_99201 ) ) ( not ( = ?auto_99196 ?auto_99201 ) ) ( not ( = ?auto_99197 ?auto_99201 ) ) ( not ( = ?auto_99198 ?auto_99201 ) ) ( not ( = ?auto_99199 ?auto_99201 ) ) ( not ( = ?auto_99200 ?auto_99201 ) ) ( ON ?auto_99195 ?auto_99194 ) ( ON-TABLE ?auto_99201 ) ( ON ?auto_99196 ?auto_99195 ) ( ON ?auto_99197 ?auto_99196 ) ( ON ?auto_99198 ?auto_99197 ) ( CLEAR ?auto_99198 ) ( HOLDING ?auto_99199 ) ( CLEAR ?auto_99200 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_99200 ?auto_99199 )
      ( MAKE-7PILE ?auto_99194 ?auto_99195 ?auto_99196 ?auto_99197 ?auto_99198 ?auto_99199 ?auto_99200 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99202 - BLOCK
      ?auto_99203 - BLOCK
      ?auto_99204 - BLOCK
      ?auto_99205 - BLOCK
      ?auto_99206 - BLOCK
      ?auto_99207 - BLOCK
      ?auto_99208 - BLOCK
    )
    :vars
    (
      ?auto_99209 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99202 ?auto_99203 ) ) ( not ( = ?auto_99202 ?auto_99204 ) ) ( not ( = ?auto_99202 ?auto_99205 ) ) ( not ( = ?auto_99202 ?auto_99206 ) ) ( not ( = ?auto_99202 ?auto_99207 ) ) ( not ( = ?auto_99202 ?auto_99208 ) ) ( not ( = ?auto_99203 ?auto_99204 ) ) ( not ( = ?auto_99203 ?auto_99205 ) ) ( not ( = ?auto_99203 ?auto_99206 ) ) ( not ( = ?auto_99203 ?auto_99207 ) ) ( not ( = ?auto_99203 ?auto_99208 ) ) ( not ( = ?auto_99204 ?auto_99205 ) ) ( not ( = ?auto_99204 ?auto_99206 ) ) ( not ( = ?auto_99204 ?auto_99207 ) ) ( not ( = ?auto_99204 ?auto_99208 ) ) ( not ( = ?auto_99205 ?auto_99206 ) ) ( not ( = ?auto_99205 ?auto_99207 ) ) ( not ( = ?auto_99205 ?auto_99208 ) ) ( not ( = ?auto_99206 ?auto_99207 ) ) ( not ( = ?auto_99206 ?auto_99208 ) ) ( not ( = ?auto_99207 ?auto_99208 ) ) ( ON-TABLE ?auto_99208 ) ( ON ?auto_99202 ?auto_99209 ) ( not ( = ?auto_99202 ?auto_99209 ) ) ( not ( = ?auto_99203 ?auto_99209 ) ) ( not ( = ?auto_99204 ?auto_99209 ) ) ( not ( = ?auto_99205 ?auto_99209 ) ) ( not ( = ?auto_99206 ?auto_99209 ) ) ( not ( = ?auto_99207 ?auto_99209 ) ) ( not ( = ?auto_99208 ?auto_99209 ) ) ( ON ?auto_99203 ?auto_99202 ) ( ON-TABLE ?auto_99209 ) ( ON ?auto_99204 ?auto_99203 ) ( ON ?auto_99205 ?auto_99204 ) ( ON ?auto_99206 ?auto_99205 ) ( CLEAR ?auto_99208 ) ( ON ?auto_99207 ?auto_99206 ) ( CLEAR ?auto_99207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_99209 ?auto_99202 ?auto_99203 ?auto_99204 ?auto_99205 ?auto_99206 )
      ( MAKE-7PILE ?auto_99202 ?auto_99203 ?auto_99204 ?auto_99205 ?auto_99206 ?auto_99207 ?auto_99208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99210 - BLOCK
      ?auto_99211 - BLOCK
      ?auto_99212 - BLOCK
      ?auto_99213 - BLOCK
      ?auto_99214 - BLOCK
      ?auto_99215 - BLOCK
      ?auto_99216 - BLOCK
    )
    :vars
    (
      ?auto_99217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99210 ?auto_99211 ) ) ( not ( = ?auto_99210 ?auto_99212 ) ) ( not ( = ?auto_99210 ?auto_99213 ) ) ( not ( = ?auto_99210 ?auto_99214 ) ) ( not ( = ?auto_99210 ?auto_99215 ) ) ( not ( = ?auto_99210 ?auto_99216 ) ) ( not ( = ?auto_99211 ?auto_99212 ) ) ( not ( = ?auto_99211 ?auto_99213 ) ) ( not ( = ?auto_99211 ?auto_99214 ) ) ( not ( = ?auto_99211 ?auto_99215 ) ) ( not ( = ?auto_99211 ?auto_99216 ) ) ( not ( = ?auto_99212 ?auto_99213 ) ) ( not ( = ?auto_99212 ?auto_99214 ) ) ( not ( = ?auto_99212 ?auto_99215 ) ) ( not ( = ?auto_99212 ?auto_99216 ) ) ( not ( = ?auto_99213 ?auto_99214 ) ) ( not ( = ?auto_99213 ?auto_99215 ) ) ( not ( = ?auto_99213 ?auto_99216 ) ) ( not ( = ?auto_99214 ?auto_99215 ) ) ( not ( = ?auto_99214 ?auto_99216 ) ) ( not ( = ?auto_99215 ?auto_99216 ) ) ( ON ?auto_99210 ?auto_99217 ) ( not ( = ?auto_99210 ?auto_99217 ) ) ( not ( = ?auto_99211 ?auto_99217 ) ) ( not ( = ?auto_99212 ?auto_99217 ) ) ( not ( = ?auto_99213 ?auto_99217 ) ) ( not ( = ?auto_99214 ?auto_99217 ) ) ( not ( = ?auto_99215 ?auto_99217 ) ) ( not ( = ?auto_99216 ?auto_99217 ) ) ( ON ?auto_99211 ?auto_99210 ) ( ON-TABLE ?auto_99217 ) ( ON ?auto_99212 ?auto_99211 ) ( ON ?auto_99213 ?auto_99212 ) ( ON ?auto_99214 ?auto_99213 ) ( ON ?auto_99215 ?auto_99214 ) ( CLEAR ?auto_99215 ) ( HOLDING ?auto_99216 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_99216 )
      ( MAKE-7PILE ?auto_99210 ?auto_99211 ?auto_99212 ?auto_99213 ?auto_99214 ?auto_99215 ?auto_99216 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_99218 - BLOCK
      ?auto_99219 - BLOCK
      ?auto_99220 - BLOCK
      ?auto_99221 - BLOCK
      ?auto_99222 - BLOCK
      ?auto_99223 - BLOCK
      ?auto_99224 - BLOCK
    )
    :vars
    (
      ?auto_99225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_99218 ?auto_99219 ) ) ( not ( = ?auto_99218 ?auto_99220 ) ) ( not ( = ?auto_99218 ?auto_99221 ) ) ( not ( = ?auto_99218 ?auto_99222 ) ) ( not ( = ?auto_99218 ?auto_99223 ) ) ( not ( = ?auto_99218 ?auto_99224 ) ) ( not ( = ?auto_99219 ?auto_99220 ) ) ( not ( = ?auto_99219 ?auto_99221 ) ) ( not ( = ?auto_99219 ?auto_99222 ) ) ( not ( = ?auto_99219 ?auto_99223 ) ) ( not ( = ?auto_99219 ?auto_99224 ) ) ( not ( = ?auto_99220 ?auto_99221 ) ) ( not ( = ?auto_99220 ?auto_99222 ) ) ( not ( = ?auto_99220 ?auto_99223 ) ) ( not ( = ?auto_99220 ?auto_99224 ) ) ( not ( = ?auto_99221 ?auto_99222 ) ) ( not ( = ?auto_99221 ?auto_99223 ) ) ( not ( = ?auto_99221 ?auto_99224 ) ) ( not ( = ?auto_99222 ?auto_99223 ) ) ( not ( = ?auto_99222 ?auto_99224 ) ) ( not ( = ?auto_99223 ?auto_99224 ) ) ( ON ?auto_99218 ?auto_99225 ) ( not ( = ?auto_99218 ?auto_99225 ) ) ( not ( = ?auto_99219 ?auto_99225 ) ) ( not ( = ?auto_99220 ?auto_99225 ) ) ( not ( = ?auto_99221 ?auto_99225 ) ) ( not ( = ?auto_99222 ?auto_99225 ) ) ( not ( = ?auto_99223 ?auto_99225 ) ) ( not ( = ?auto_99224 ?auto_99225 ) ) ( ON ?auto_99219 ?auto_99218 ) ( ON-TABLE ?auto_99225 ) ( ON ?auto_99220 ?auto_99219 ) ( ON ?auto_99221 ?auto_99220 ) ( ON ?auto_99222 ?auto_99221 ) ( ON ?auto_99223 ?auto_99222 ) ( ON ?auto_99224 ?auto_99223 ) ( CLEAR ?auto_99224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_99225 ?auto_99218 ?auto_99219 ?auto_99220 ?auto_99221 ?auto_99222 ?auto_99223 )
      ( MAKE-7PILE ?auto_99218 ?auto_99219 ?auto_99220 ?auto_99221 ?auto_99222 ?auto_99223 ?auto_99224 ) )
  )

)

