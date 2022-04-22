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
      ?auto_53681 - BLOCK
    )
    :vars
    (
      ?auto_53682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53681 ?auto_53682 ) ( CLEAR ?auto_53681 ) ( HAND-EMPTY ) ( not ( = ?auto_53681 ?auto_53682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53681 ?auto_53682 )
      ( !PUTDOWN ?auto_53681 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_53684 - BLOCK
    )
    :vars
    (
      ?auto_53685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53684 ?auto_53685 ) ( CLEAR ?auto_53684 ) ( HAND-EMPTY ) ( not ( = ?auto_53684 ?auto_53685 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53684 ?auto_53685 )
      ( !PUTDOWN ?auto_53684 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53688 - BLOCK
      ?auto_53689 - BLOCK
    )
    :vars
    (
      ?auto_53690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53688 ) ( ON ?auto_53689 ?auto_53690 ) ( CLEAR ?auto_53689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53688 ) ( not ( = ?auto_53688 ?auto_53689 ) ) ( not ( = ?auto_53688 ?auto_53690 ) ) ( not ( = ?auto_53689 ?auto_53690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53689 ?auto_53690 )
      ( !STACK ?auto_53689 ?auto_53688 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53693 - BLOCK
      ?auto_53694 - BLOCK
    )
    :vars
    (
      ?auto_53695 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53693 ) ( ON ?auto_53694 ?auto_53695 ) ( CLEAR ?auto_53694 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53693 ) ( not ( = ?auto_53693 ?auto_53694 ) ) ( not ( = ?auto_53693 ?auto_53695 ) ) ( not ( = ?auto_53694 ?auto_53695 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53694 ?auto_53695 )
      ( !STACK ?auto_53694 ?auto_53693 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53698 - BLOCK
      ?auto_53699 - BLOCK
    )
    :vars
    (
      ?auto_53700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53699 ?auto_53700 ) ( not ( = ?auto_53698 ?auto_53699 ) ) ( not ( = ?auto_53698 ?auto_53700 ) ) ( not ( = ?auto_53699 ?auto_53700 ) ) ( ON ?auto_53698 ?auto_53699 ) ( CLEAR ?auto_53698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53698 )
      ( MAKE-2PILE ?auto_53698 ?auto_53699 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_53703 - BLOCK
      ?auto_53704 - BLOCK
    )
    :vars
    (
      ?auto_53705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53704 ?auto_53705 ) ( not ( = ?auto_53703 ?auto_53704 ) ) ( not ( = ?auto_53703 ?auto_53705 ) ) ( not ( = ?auto_53704 ?auto_53705 ) ) ( ON ?auto_53703 ?auto_53704 ) ( CLEAR ?auto_53703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53703 )
      ( MAKE-2PILE ?auto_53703 ?auto_53704 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53709 - BLOCK
      ?auto_53710 - BLOCK
      ?auto_53711 - BLOCK
    )
    :vars
    (
      ?auto_53712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53710 ) ( ON ?auto_53711 ?auto_53712 ) ( CLEAR ?auto_53711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53709 ) ( ON ?auto_53710 ?auto_53709 ) ( not ( = ?auto_53709 ?auto_53710 ) ) ( not ( = ?auto_53709 ?auto_53711 ) ) ( not ( = ?auto_53709 ?auto_53712 ) ) ( not ( = ?auto_53710 ?auto_53711 ) ) ( not ( = ?auto_53710 ?auto_53712 ) ) ( not ( = ?auto_53711 ?auto_53712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53711 ?auto_53712 )
      ( !STACK ?auto_53711 ?auto_53710 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53716 - BLOCK
      ?auto_53717 - BLOCK
      ?auto_53718 - BLOCK
    )
    :vars
    (
      ?auto_53719 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53717 ) ( ON ?auto_53718 ?auto_53719 ) ( CLEAR ?auto_53718 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53716 ) ( ON ?auto_53717 ?auto_53716 ) ( not ( = ?auto_53716 ?auto_53717 ) ) ( not ( = ?auto_53716 ?auto_53718 ) ) ( not ( = ?auto_53716 ?auto_53719 ) ) ( not ( = ?auto_53717 ?auto_53718 ) ) ( not ( = ?auto_53717 ?auto_53719 ) ) ( not ( = ?auto_53718 ?auto_53719 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53718 ?auto_53719 )
      ( !STACK ?auto_53718 ?auto_53717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53723 - BLOCK
      ?auto_53724 - BLOCK
      ?auto_53725 - BLOCK
    )
    :vars
    (
      ?auto_53726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53725 ?auto_53726 ) ( ON-TABLE ?auto_53723 ) ( not ( = ?auto_53723 ?auto_53724 ) ) ( not ( = ?auto_53723 ?auto_53725 ) ) ( not ( = ?auto_53723 ?auto_53726 ) ) ( not ( = ?auto_53724 ?auto_53725 ) ) ( not ( = ?auto_53724 ?auto_53726 ) ) ( not ( = ?auto_53725 ?auto_53726 ) ) ( CLEAR ?auto_53723 ) ( ON ?auto_53724 ?auto_53725 ) ( CLEAR ?auto_53724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53723 ?auto_53724 )
      ( MAKE-3PILE ?auto_53723 ?auto_53724 ?auto_53725 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53730 - BLOCK
      ?auto_53731 - BLOCK
      ?auto_53732 - BLOCK
    )
    :vars
    (
      ?auto_53733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53732 ?auto_53733 ) ( ON-TABLE ?auto_53730 ) ( not ( = ?auto_53730 ?auto_53731 ) ) ( not ( = ?auto_53730 ?auto_53732 ) ) ( not ( = ?auto_53730 ?auto_53733 ) ) ( not ( = ?auto_53731 ?auto_53732 ) ) ( not ( = ?auto_53731 ?auto_53733 ) ) ( not ( = ?auto_53732 ?auto_53733 ) ) ( CLEAR ?auto_53730 ) ( ON ?auto_53731 ?auto_53732 ) ( CLEAR ?auto_53731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53730 ?auto_53731 )
      ( MAKE-3PILE ?auto_53730 ?auto_53731 ?auto_53732 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53737 - BLOCK
      ?auto_53738 - BLOCK
      ?auto_53739 - BLOCK
    )
    :vars
    (
      ?auto_53740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53739 ?auto_53740 ) ( not ( = ?auto_53737 ?auto_53738 ) ) ( not ( = ?auto_53737 ?auto_53739 ) ) ( not ( = ?auto_53737 ?auto_53740 ) ) ( not ( = ?auto_53738 ?auto_53739 ) ) ( not ( = ?auto_53738 ?auto_53740 ) ) ( not ( = ?auto_53739 ?auto_53740 ) ) ( ON ?auto_53738 ?auto_53739 ) ( ON ?auto_53737 ?auto_53738 ) ( CLEAR ?auto_53737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53737 )
      ( MAKE-3PILE ?auto_53737 ?auto_53738 ?auto_53739 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_53744 - BLOCK
      ?auto_53745 - BLOCK
      ?auto_53746 - BLOCK
    )
    :vars
    (
      ?auto_53747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53746 ?auto_53747 ) ( not ( = ?auto_53744 ?auto_53745 ) ) ( not ( = ?auto_53744 ?auto_53746 ) ) ( not ( = ?auto_53744 ?auto_53747 ) ) ( not ( = ?auto_53745 ?auto_53746 ) ) ( not ( = ?auto_53745 ?auto_53747 ) ) ( not ( = ?auto_53746 ?auto_53747 ) ) ( ON ?auto_53745 ?auto_53746 ) ( ON ?auto_53744 ?auto_53745 ) ( CLEAR ?auto_53744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53744 )
      ( MAKE-3PILE ?auto_53744 ?auto_53745 ?auto_53746 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53752 - BLOCK
      ?auto_53753 - BLOCK
      ?auto_53754 - BLOCK
      ?auto_53755 - BLOCK
    )
    :vars
    (
      ?auto_53756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53754 ) ( ON ?auto_53755 ?auto_53756 ) ( CLEAR ?auto_53755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53752 ) ( ON ?auto_53753 ?auto_53752 ) ( ON ?auto_53754 ?auto_53753 ) ( not ( = ?auto_53752 ?auto_53753 ) ) ( not ( = ?auto_53752 ?auto_53754 ) ) ( not ( = ?auto_53752 ?auto_53755 ) ) ( not ( = ?auto_53752 ?auto_53756 ) ) ( not ( = ?auto_53753 ?auto_53754 ) ) ( not ( = ?auto_53753 ?auto_53755 ) ) ( not ( = ?auto_53753 ?auto_53756 ) ) ( not ( = ?auto_53754 ?auto_53755 ) ) ( not ( = ?auto_53754 ?auto_53756 ) ) ( not ( = ?auto_53755 ?auto_53756 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53755 ?auto_53756 )
      ( !STACK ?auto_53755 ?auto_53754 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53761 - BLOCK
      ?auto_53762 - BLOCK
      ?auto_53763 - BLOCK
      ?auto_53764 - BLOCK
    )
    :vars
    (
      ?auto_53765 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53763 ) ( ON ?auto_53764 ?auto_53765 ) ( CLEAR ?auto_53764 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53761 ) ( ON ?auto_53762 ?auto_53761 ) ( ON ?auto_53763 ?auto_53762 ) ( not ( = ?auto_53761 ?auto_53762 ) ) ( not ( = ?auto_53761 ?auto_53763 ) ) ( not ( = ?auto_53761 ?auto_53764 ) ) ( not ( = ?auto_53761 ?auto_53765 ) ) ( not ( = ?auto_53762 ?auto_53763 ) ) ( not ( = ?auto_53762 ?auto_53764 ) ) ( not ( = ?auto_53762 ?auto_53765 ) ) ( not ( = ?auto_53763 ?auto_53764 ) ) ( not ( = ?auto_53763 ?auto_53765 ) ) ( not ( = ?auto_53764 ?auto_53765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53764 ?auto_53765 )
      ( !STACK ?auto_53764 ?auto_53763 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53770 - BLOCK
      ?auto_53771 - BLOCK
      ?auto_53772 - BLOCK
      ?auto_53773 - BLOCK
    )
    :vars
    (
      ?auto_53774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53773 ?auto_53774 ) ( ON-TABLE ?auto_53770 ) ( ON ?auto_53771 ?auto_53770 ) ( not ( = ?auto_53770 ?auto_53771 ) ) ( not ( = ?auto_53770 ?auto_53772 ) ) ( not ( = ?auto_53770 ?auto_53773 ) ) ( not ( = ?auto_53770 ?auto_53774 ) ) ( not ( = ?auto_53771 ?auto_53772 ) ) ( not ( = ?auto_53771 ?auto_53773 ) ) ( not ( = ?auto_53771 ?auto_53774 ) ) ( not ( = ?auto_53772 ?auto_53773 ) ) ( not ( = ?auto_53772 ?auto_53774 ) ) ( not ( = ?auto_53773 ?auto_53774 ) ) ( CLEAR ?auto_53771 ) ( ON ?auto_53772 ?auto_53773 ) ( CLEAR ?auto_53772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53770 ?auto_53771 ?auto_53772 )
      ( MAKE-4PILE ?auto_53770 ?auto_53771 ?auto_53772 ?auto_53773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53779 - BLOCK
      ?auto_53780 - BLOCK
      ?auto_53781 - BLOCK
      ?auto_53782 - BLOCK
    )
    :vars
    (
      ?auto_53783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53782 ?auto_53783 ) ( ON-TABLE ?auto_53779 ) ( ON ?auto_53780 ?auto_53779 ) ( not ( = ?auto_53779 ?auto_53780 ) ) ( not ( = ?auto_53779 ?auto_53781 ) ) ( not ( = ?auto_53779 ?auto_53782 ) ) ( not ( = ?auto_53779 ?auto_53783 ) ) ( not ( = ?auto_53780 ?auto_53781 ) ) ( not ( = ?auto_53780 ?auto_53782 ) ) ( not ( = ?auto_53780 ?auto_53783 ) ) ( not ( = ?auto_53781 ?auto_53782 ) ) ( not ( = ?auto_53781 ?auto_53783 ) ) ( not ( = ?auto_53782 ?auto_53783 ) ) ( CLEAR ?auto_53780 ) ( ON ?auto_53781 ?auto_53782 ) ( CLEAR ?auto_53781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53779 ?auto_53780 ?auto_53781 )
      ( MAKE-4PILE ?auto_53779 ?auto_53780 ?auto_53781 ?auto_53782 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53788 - BLOCK
      ?auto_53789 - BLOCK
      ?auto_53790 - BLOCK
      ?auto_53791 - BLOCK
    )
    :vars
    (
      ?auto_53792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53791 ?auto_53792 ) ( ON-TABLE ?auto_53788 ) ( not ( = ?auto_53788 ?auto_53789 ) ) ( not ( = ?auto_53788 ?auto_53790 ) ) ( not ( = ?auto_53788 ?auto_53791 ) ) ( not ( = ?auto_53788 ?auto_53792 ) ) ( not ( = ?auto_53789 ?auto_53790 ) ) ( not ( = ?auto_53789 ?auto_53791 ) ) ( not ( = ?auto_53789 ?auto_53792 ) ) ( not ( = ?auto_53790 ?auto_53791 ) ) ( not ( = ?auto_53790 ?auto_53792 ) ) ( not ( = ?auto_53791 ?auto_53792 ) ) ( ON ?auto_53790 ?auto_53791 ) ( CLEAR ?auto_53788 ) ( ON ?auto_53789 ?auto_53790 ) ( CLEAR ?auto_53789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53788 ?auto_53789 )
      ( MAKE-4PILE ?auto_53788 ?auto_53789 ?auto_53790 ?auto_53791 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53797 - BLOCK
      ?auto_53798 - BLOCK
      ?auto_53799 - BLOCK
      ?auto_53800 - BLOCK
    )
    :vars
    (
      ?auto_53801 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53800 ?auto_53801 ) ( ON-TABLE ?auto_53797 ) ( not ( = ?auto_53797 ?auto_53798 ) ) ( not ( = ?auto_53797 ?auto_53799 ) ) ( not ( = ?auto_53797 ?auto_53800 ) ) ( not ( = ?auto_53797 ?auto_53801 ) ) ( not ( = ?auto_53798 ?auto_53799 ) ) ( not ( = ?auto_53798 ?auto_53800 ) ) ( not ( = ?auto_53798 ?auto_53801 ) ) ( not ( = ?auto_53799 ?auto_53800 ) ) ( not ( = ?auto_53799 ?auto_53801 ) ) ( not ( = ?auto_53800 ?auto_53801 ) ) ( ON ?auto_53799 ?auto_53800 ) ( CLEAR ?auto_53797 ) ( ON ?auto_53798 ?auto_53799 ) ( CLEAR ?auto_53798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53797 ?auto_53798 )
      ( MAKE-4PILE ?auto_53797 ?auto_53798 ?auto_53799 ?auto_53800 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53806 - BLOCK
      ?auto_53807 - BLOCK
      ?auto_53808 - BLOCK
      ?auto_53809 - BLOCK
    )
    :vars
    (
      ?auto_53810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53809 ?auto_53810 ) ( not ( = ?auto_53806 ?auto_53807 ) ) ( not ( = ?auto_53806 ?auto_53808 ) ) ( not ( = ?auto_53806 ?auto_53809 ) ) ( not ( = ?auto_53806 ?auto_53810 ) ) ( not ( = ?auto_53807 ?auto_53808 ) ) ( not ( = ?auto_53807 ?auto_53809 ) ) ( not ( = ?auto_53807 ?auto_53810 ) ) ( not ( = ?auto_53808 ?auto_53809 ) ) ( not ( = ?auto_53808 ?auto_53810 ) ) ( not ( = ?auto_53809 ?auto_53810 ) ) ( ON ?auto_53808 ?auto_53809 ) ( ON ?auto_53807 ?auto_53808 ) ( ON ?auto_53806 ?auto_53807 ) ( CLEAR ?auto_53806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53806 )
      ( MAKE-4PILE ?auto_53806 ?auto_53807 ?auto_53808 ?auto_53809 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_53815 - BLOCK
      ?auto_53816 - BLOCK
      ?auto_53817 - BLOCK
      ?auto_53818 - BLOCK
    )
    :vars
    (
      ?auto_53819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53818 ?auto_53819 ) ( not ( = ?auto_53815 ?auto_53816 ) ) ( not ( = ?auto_53815 ?auto_53817 ) ) ( not ( = ?auto_53815 ?auto_53818 ) ) ( not ( = ?auto_53815 ?auto_53819 ) ) ( not ( = ?auto_53816 ?auto_53817 ) ) ( not ( = ?auto_53816 ?auto_53818 ) ) ( not ( = ?auto_53816 ?auto_53819 ) ) ( not ( = ?auto_53817 ?auto_53818 ) ) ( not ( = ?auto_53817 ?auto_53819 ) ) ( not ( = ?auto_53818 ?auto_53819 ) ) ( ON ?auto_53817 ?auto_53818 ) ( ON ?auto_53816 ?auto_53817 ) ( ON ?auto_53815 ?auto_53816 ) ( CLEAR ?auto_53815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53815 )
      ( MAKE-4PILE ?auto_53815 ?auto_53816 ?auto_53817 ?auto_53818 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53825 - BLOCK
      ?auto_53826 - BLOCK
      ?auto_53827 - BLOCK
      ?auto_53828 - BLOCK
      ?auto_53829 - BLOCK
    )
    :vars
    (
      ?auto_53830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53828 ) ( ON ?auto_53829 ?auto_53830 ) ( CLEAR ?auto_53829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53825 ) ( ON ?auto_53826 ?auto_53825 ) ( ON ?auto_53827 ?auto_53826 ) ( ON ?auto_53828 ?auto_53827 ) ( not ( = ?auto_53825 ?auto_53826 ) ) ( not ( = ?auto_53825 ?auto_53827 ) ) ( not ( = ?auto_53825 ?auto_53828 ) ) ( not ( = ?auto_53825 ?auto_53829 ) ) ( not ( = ?auto_53825 ?auto_53830 ) ) ( not ( = ?auto_53826 ?auto_53827 ) ) ( not ( = ?auto_53826 ?auto_53828 ) ) ( not ( = ?auto_53826 ?auto_53829 ) ) ( not ( = ?auto_53826 ?auto_53830 ) ) ( not ( = ?auto_53827 ?auto_53828 ) ) ( not ( = ?auto_53827 ?auto_53829 ) ) ( not ( = ?auto_53827 ?auto_53830 ) ) ( not ( = ?auto_53828 ?auto_53829 ) ) ( not ( = ?auto_53828 ?auto_53830 ) ) ( not ( = ?auto_53829 ?auto_53830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53829 ?auto_53830 )
      ( !STACK ?auto_53829 ?auto_53828 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53836 - BLOCK
      ?auto_53837 - BLOCK
      ?auto_53838 - BLOCK
      ?auto_53839 - BLOCK
      ?auto_53840 - BLOCK
    )
    :vars
    (
      ?auto_53841 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53839 ) ( ON ?auto_53840 ?auto_53841 ) ( CLEAR ?auto_53840 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53836 ) ( ON ?auto_53837 ?auto_53836 ) ( ON ?auto_53838 ?auto_53837 ) ( ON ?auto_53839 ?auto_53838 ) ( not ( = ?auto_53836 ?auto_53837 ) ) ( not ( = ?auto_53836 ?auto_53838 ) ) ( not ( = ?auto_53836 ?auto_53839 ) ) ( not ( = ?auto_53836 ?auto_53840 ) ) ( not ( = ?auto_53836 ?auto_53841 ) ) ( not ( = ?auto_53837 ?auto_53838 ) ) ( not ( = ?auto_53837 ?auto_53839 ) ) ( not ( = ?auto_53837 ?auto_53840 ) ) ( not ( = ?auto_53837 ?auto_53841 ) ) ( not ( = ?auto_53838 ?auto_53839 ) ) ( not ( = ?auto_53838 ?auto_53840 ) ) ( not ( = ?auto_53838 ?auto_53841 ) ) ( not ( = ?auto_53839 ?auto_53840 ) ) ( not ( = ?auto_53839 ?auto_53841 ) ) ( not ( = ?auto_53840 ?auto_53841 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53840 ?auto_53841 )
      ( !STACK ?auto_53840 ?auto_53839 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53847 - BLOCK
      ?auto_53848 - BLOCK
      ?auto_53849 - BLOCK
      ?auto_53850 - BLOCK
      ?auto_53851 - BLOCK
    )
    :vars
    (
      ?auto_53852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53851 ?auto_53852 ) ( ON-TABLE ?auto_53847 ) ( ON ?auto_53848 ?auto_53847 ) ( ON ?auto_53849 ?auto_53848 ) ( not ( = ?auto_53847 ?auto_53848 ) ) ( not ( = ?auto_53847 ?auto_53849 ) ) ( not ( = ?auto_53847 ?auto_53850 ) ) ( not ( = ?auto_53847 ?auto_53851 ) ) ( not ( = ?auto_53847 ?auto_53852 ) ) ( not ( = ?auto_53848 ?auto_53849 ) ) ( not ( = ?auto_53848 ?auto_53850 ) ) ( not ( = ?auto_53848 ?auto_53851 ) ) ( not ( = ?auto_53848 ?auto_53852 ) ) ( not ( = ?auto_53849 ?auto_53850 ) ) ( not ( = ?auto_53849 ?auto_53851 ) ) ( not ( = ?auto_53849 ?auto_53852 ) ) ( not ( = ?auto_53850 ?auto_53851 ) ) ( not ( = ?auto_53850 ?auto_53852 ) ) ( not ( = ?auto_53851 ?auto_53852 ) ) ( CLEAR ?auto_53849 ) ( ON ?auto_53850 ?auto_53851 ) ( CLEAR ?auto_53850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53847 ?auto_53848 ?auto_53849 ?auto_53850 )
      ( MAKE-5PILE ?auto_53847 ?auto_53848 ?auto_53849 ?auto_53850 ?auto_53851 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53858 - BLOCK
      ?auto_53859 - BLOCK
      ?auto_53860 - BLOCK
      ?auto_53861 - BLOCK
      ?auto_53862 - BLOCK
    )
    :vars
    (
      ?auto_53863 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53862 ?auto_53863 ) ( ON-TABLE ?auto_53858 ) ( ON ?auto_53859 ?auto_53858 ) ( ON ?auto_53860 ?auto_53859 ) ( not ( = ?auto_53858 ?auto_53859 ) ) ( not ( = ?auto_53858 ?auto_53860 ) ) ( not ( = ?auto_53858 ?auto_53861 ) ) ( not ( = ?auto_53858 ?auto_53862 ) ) ( not ( = ?auto_53858 ?auto_53863 ) ) ( not ( = ?auto_53859 ?auto_53860 ) ) ( not ( = ?auto_53859 ?auto_53861 ) ) ( not ( = ?auto_53859 ?auto_53862 ) ) ( not ( = ?auto_53859 ?auto_53863 ) ) ( not ( = ?auto_53860 ?auto_53861 ) ) ( not ( = ?auto_53860 ?auto_53862 ) ) ( not ( = ?auto_53860 ?auto_53863 ) ) ( not ( = ?auto_53861 ?auto_53862 ) ) ( not ( = ?auto_53861 ?auto_53863 ) ) ( not ( = ?auto_53862 ?auto_53863 ) ) ( CLEAR ?auto_53860 ) ( ON ?auto_53861 ?auto_53862 ) ( CLEAR ?auto_53861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53858 ?auto_53859 ?auto_53860 ?auto_53861 )
      ( MAKE-5PILE ?auto_53858 ?auto_53859 ?auto_53860 ?auto_53861 ?auto_53862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53869 - BLOCK
      ?auto_53870 - BLOCK
      ?auto_53871 - BLOCK
      ?auto_53872 - BLOCK
      ?auto_53873 - BLOCK
    )
    :vars
    (
      ?auto_53874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53873 ?auto_53874 ) ( ON-TABLE ?auto_53869 ) ( ON ?auto_53870 ?auto_53869 ) ( not ( = ?auto_53869 ?auto_53870 ) ) ( not ( = ?auto_53869 ?auto_53871 ) ) ( not ( = ?auto_53869 ?auto_53872 ) ) ( not ( = ?auto_53869 ?auto_53873 ) ) ( not ( = ?auto_53869 ?auto_53874 ) ) ( not ( = ?auto_53870 ?auto_53871 ) ) ( not ( = ?auto_53870 ?auto_53872 ) ) ( not ( = ?auto_53870 ?auto_53873 ) ) ( not ( = ?auto_53870 ?auto_53874 ) ) ( not ( = ?auto_53871 ?auto_53872 ) ) ( not ( = ?auto_53871 ?auto_53873 ) ) ( not ( = ?auto_53871 ?auto_53874 ) ) ( not ( = ?auto_53872 ?auto_53873 ) ) ( not ( = ?auto_53872 ?auto_53874 ) ) ( not ( = ?auto_53873 ?auto_53874 ) ) ( ON ?auto_53872 ?auto_53873 ) ( CLEAR ?auto_53870 ) ( ON ?auto_53871 ?auto_53872 ) ( CLEAR ?auto_53871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53869 ?auto_53870 ?auto_53871 )
      ( MAKE-5PILE ?auto_53869 ?auto_53870 ?auto_53871 ?auto_53872 ?auto_53873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53880 - BLOCK
      ?auto_53881 - BLOCK
      ?auto_53882 - BLOCK
      ?auto_53883 - BLOCK
      ?auto_53884 - BLOCK
    )
    :vars
    (
      ?auto_53885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53884 ?auto_53885 ) ( ON-TABLE ?auto_53880 ) ( ON ?auto_53881 ?auto_53880 ) ( not ( = ?auto_53880 ?auto_53881 ) ) ( not ( = ?auto_53880 ?auto_53882 ) ) ( not ( = ?auto_53880 ?auto_53883 ) ) ( not ( = ?auto_53880 ?auto_53884 ) ) ( not ( = ?auto_53880 ?auto_53885 ) ) ( not ( = ?auto_53881 ?auto_53882 ) ) ( not ( = ?auto_53881 ?auto_53883 ) ) ( not ( = ?auto_53881 ?auto_53884 ) ) ( not ( = ?auto_53881 ?auto_53885 ) ) ( not ( = ?auto_53882 ?auto_53883 ) ) ( not ( = ?auto_53882 ?auto_53884 ) ) ( not ( = ?auto_53882 ?auto_53885 ) ) ( not ( = ?auto_53883 ?auto_53884 ) ) ( not ( = ?auto_53883 ?auto_53885 ) ) ( not ( = ?auto_53884 ?auto_53885 ) ) ( ON ?auto_53883 ?auto_53884 ) ( CLEAR ?auto_53881 ) ( ON ?auto_53882 ?auto_53883 ) ( CLEAR ?auto_53882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_53880 ?auto_53881 ?auto_53882 )
      ( MAKE-5PILE ?auto_53880 ?auto_53881 ?auto_53882 ?auto_53883 ?auto_53884 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53891 - BLOCK
      ?auto_53892 - BLOCK
      ?auto_53893 - BLOCK
      ?auto_53894 - BLOCK
      ?auto_53895 - BLOCK
    )
    :vars
    (
      ?auto_53896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53895 ?auto_53896 ) ( ON-TABLE ?auto_53891 ) ( not ( = ?auto_53891 ?auto_53892 ) ) ( not ( = ?auto_53891 ?auto_53893 ) ) ( not ( = ?auto_53891 ?auto_53894 ) ) ( not ( = ?auto_53891 ?auto_53895 ) ) ( not ( = ?auto_53891 ?auto_53896 ) ) ( not ( = ?auto_53892 ?auto_53893 ) ) ( not ( = ?auto_53892 ?auto_53894 ) ) ( not ( = ?auto_53892 ?auto_53895 ) ) ( not ( = ?auto_53892 ?auto_53896 ) ) ( not ( = ?auto_53893 ?auto_53894 ) ) ( not ( = ?auto_53893 ?auto_53895 ) ) ( not ( = ?auto_53893 ?auto_53896 ) ) ( not ( = ?auto_53894 ?auto_53895 ) ) ( not ( = ?auto_53894 ?auto_53896 ) ) ( not ( = ?auto_53895 ?auto_53896 ) ) ( ON ?auto_53894 ?auto_53895 ) ( ON ?auto_53893 ?auto_53894 ) ( CLEAR ?auto_53891 ) ( ON ?auto_53892 ?auto_53893 ) ( CLEAR ?auto_53892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53891 ?auto_53892 )
      ( MAKE-5PILE ?auto_53891 ?auto_53892 ?auto_53893 ?auto_53894 ?auto_53895 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53902 - BLOCK
      ?auto_53903 - BLOCK
      ?auto_53904 - BLOCK
      ?auto_53905 - BLOCK
      ?auto_53906 - BLOCK
    )
    :vars
    (
      ?auto_53907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53906 ?auto_53907 ) ( ON-TABLE ?auto_53902 ) ( not ( = ?auto_53902 ?auto_53903 ) ) ( not ( = ?auto_53902 ?auto_53904 ) ) ( not ( = ?auto_53902 ?auto_53905 ) ) ( not ( = ?auto_53902 ?auto_53906 ) ) ( not ( = ?auto_53902 ?auto_53907 ) ) ( not ( = ?auto_53903 ?auto_53904 ) ) ( not ( = ?auto_53903 ?auto_53905 ) ) ( not ( = ?auto_53903 ?auto_53906 ) ) ( not ( = ?auto_53903 ?auto_53907 ) ) ( not ( = ?auto_53904 ?auto_53905 ) ) ( not ( = ?auto_53904 ?auto_53906 ) ) ( not ( = ?auto_53904 ?auto_53907 ) ) ( not ( = ?auto_53905 ?auto_53906 ) ) ( not ( = ?auto_53905 ?auto_53907 ) ) ( not ( = ?auto_53906 ?auto_53907 ) ) ( ON ?auto_53905 ?auto_53906 ) ( ON ?auto_53904 ?auto_53905 ) ( CLEAR ?auto_53902 ) ( ON ?auto_53903 ?auto_53904 ) ( CLEAR ?auto_53903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_53902 ?auto_53903 )
      ( MAKE-5PILE ?auto_53902 ?auto_53903 ?auto_53904 ?auto_53905 ?auto_53906 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53913 - BLOCK
      ?auto_53914 - BLOCK
      ?auto_53915 - BLOCK
      ?auto_53916 - BLOCK
      ?auto_53917 - BLOCK
    )
    :vars
    (
      ?auto_53918 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53917 ?auto_53918 ) ( not ( = ?auto_53913 ?auto_53914 ) ) ( not ( = ?auto_53913 ?auto_53915 ) ) ( not ( = ?auto_53913 ?auto_53916 ) ) ( not ( = ?auto_53913 ?auto_53917 ) ) ( not ( = ?auto_53913 ?auto_53918 ) ) ( not ( = ?auto_53914 ?auto_53915 ) ) ( not ( = ?auto_53914 ?auto_53916 ) ) ( not ( = ?auto_53914 ?auto_53917 ) ) ( not ( = ?auto_53914 ?auto_53918 ) ) ( not ( = ?auto_53915 ?auto_53916 ) ) ( not ( = ?auto_53915 ?auto_53917 ) ) ( not ( = ?auto_53915 ?auto_53918 ) ) ( not ( = ?auto_53916 ?auto_53917 ) ) ( not ( = ?auto_53916 ?auto_53918 ) ) ( not ( = ?auto_53917 ?auto_53918 ) ) ( ON ?auto_53916 ?auto_53917 ) ( ON ?auto_53915 ?auto_53916 ) ( ON ?auto_53914 ?auto_53915 ) ( ON ?auto_53913 ?auto_53914 ) ( CLEAR ?auto_53913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53913 )
      ( MAKE-5PILE ?auto_53913 ?auto_53914 ?auto_53915 ?auto_53916 ?auto_53917 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_53924 - BLOCK
      ?auto_53925 - BLOCK
      ?auto_53926 - BLOCK
      ?auto_53927 - BLOCK
      ?auto_53928 - BLOCK
    )
    :vars
    (
      ?auto_53929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53928 ?auto_53929 ) ( not ( = ?auto_53924 ?auto_53925 ) ) ( not ( = ?auto_53924 ?auto_53926 ) ) ( not ( = ?auto_53924 ?auto_53927 ) ) ( not ( = ?auto_53924 ?auto_53928 ) ) ( not ( = ?auto_53924 ?auto_53929 ) ) ( not ( = ?auto_53925 ?auto_53926 ) ) ( not ( = ?auto_53925 ?auto_53927 ) ) ( not ( = ?auto_53925 ?auto_53928 ) ) ( not ( = ?auto_53925 ?auto_53929 ) ) ( not ( = ?auto_53926 ?auto_53927 ) ) ( not ( = ?auto_53926 ?auto_53928 ) ) ( not ( = ?auto_53926 ?auto_53929 ) ) ( not ( = ?auto_53927 ?auto_53928 ) ) ( not ( = ?auto_53927 ?auto_53929 ) ) ( not ( = ?auto_53928 ?auto_53929 ) ) ( ON ?auto_53927 ?auto_53928 ) ( ON ?auto_53926 ?auto_53927 ) ( ON ?auto_53925 ?auto_53926 ) ( ON ?auto_53924 ?auto_53925 ) ( CLEAR ?auto_53924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_53924 )
      ( MAKE-5PILE ?auto_53924 ?auto_53925 ?auto_53926 ?auto_53927 ?auto_53928 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53936 - BLOCK
      ?auto_53937 - BLOCK
      ?auto_53938 - BLOCK
      ?auto_53939 - BLOCK
      ?auto_53940 - BLOCK
      ?auto_53941 - BLOCK
    )
    :vars
    (
      ?auto_53942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53940 ) ( ON ?auto_53941 ?auto_53942 ) ( CLEAR ?auto_53941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53936 ) ( ON ?auto_53937 ?auto_53936 ) ( ON ?auto_53938 ?auto_53937 ) ( ON ?auto_53939 ?auto_53938 ) ( ON ?auto_53940 ?auto_53939 ) ( not ( = ?auto_53936 ?auto_53937 ) ) ( not ( = ?auto_53936 ?auto_53938 ) ) ( not ( = ?auto_53936 ?auto_53939 ) ) ( not ( = ?auto_53936 ?auto_53940 ) ) ( not ( = ?auto_53936 ?auto_53941 ) ) ( not ( = ?auto_53936 ?auto_53942 ) ) ( not ( = ?auto_53937 ?auto_53938 ) ) ( not ( = ?auto_53937 ?auto_53939 ) ) ( not ( = ?auto_53937 ?auto_53940 ) ) ( not ( = ?auto_53937 ?auto_53941 ) ) ( not ( = ?auto_53937 ?auto_53942 ) ) ( not ( = ?auto_53938 ?auto_53939 ) ) ( not ( = ?auto_53938 ?auto_53940 ) ) ( not ( = ?auto_53938 ?auto_53941 ) ) ( not ( = ?auto_53938 ?auto_53942 ) ) ( not ( = ?auto_53939 ?auto_53940 ) ) ( not ( = ?auto_53939 ?auto_53941 ) ) ( not ( = ?auto_53939 ?auto_53942 ) ) ( not ( = ?auto_53940 ?auto_53941 ) ) ( not ( = ?auto_53940 ?auto_53942 ) ) ( not ( = ?auto_53941 ?auto_53942 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53941 ?auto_53942 )
      ( !STACK ?auto_53941 ?auto_53940 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53949 - BLOCK
      ?auto_53950 - BLOCK
      ?auto_53951 - BLOCK
      ?auto_53952 - BLOCK
      ?auto_53953 - BLOCK
      ?auto_53954 - BLOCK
    )
    :vars
    (
      ?auto_53955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_53953 ) ( ON ?auto_53954 ?auto_53955 ) ( CLEAR ?auto_53954 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_53949 ) ( ON ?auto_53950 ?auto_53949 ) ( ON ?auto_53951 ?auto_53950 ) ( ON ?auto_53952 ?auto_53951 ) ( ON ?auto_53953 ?auto_53952 ) ( not ( = ?auto_53949 ?auto_53950 ) ) ( not ( = ?auto_53949 ?auto_53951 ) ) ( not ( = ?auto_53949 ?auto_53952 ) ) ( not ( = ?auto_53949 ?auto_53953 ) ) ( not ( = ?auto_53949 ?auto_53954 ) ) ( not ( = ?auto_53949 ?auto_53955 ) ) ( not ( = ?auto_53950 ?auto_53951 ) ) ( not ( = ?auto_53950 ?auto_53952 ) ) ( not ( = ?auto_53950 ?auto_53953 ) ) ( not ( = ?auto_53950 ?auto_53954 ) ) ( not ( = ?auto_53950 ?auto_53955 ) ) ( not ( = ?auto_53951 ?auto_53952 ) ) ( not ( = ?auto_53951 ?auto_53953 ) ) ( not ( = ?auto_53951 ?auto_53954 ) ) ( not ( = ?auto_53951 ?auto_53955 ) ) ( not ( = ?auto_53952 ?auto_53953 ) ) ( not ( = ?auto_53952 ?auto_53954 ) ) ( not ( = ?auto_53952 ?auto_53955 ) ) ( not ( = ?auto_53953 ?auto_53954 ) ) ( not ( = ?auto_53953 ?auto_53955 ) ) ( not ( = ?auto_53954 ?auto_53955 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_53954 ?auto_53955 )
      ( !STACK ?auto_53954 ?auto_53953 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53962 - BLOCK
      ?auto_53963 - BLOCK
      ?auto_53964 - BLOCK
      ?auto_53965 - BLOCK
      ?auto_53966 - BLOCK
      ?auto_53967 - BLOCK
    )
    :vars
    (
      ?auto_53968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53967 ?auto_53968 ) ( ON-TABLE ?auto_53962 ) ( ON ?auto_53963 ?auto_53962 ) ( ON ?auto_53964 ?auto_53963 ) ( ON ?auto_53965 ?auto_53964 ) ( not ( = ?auto_53962 ?auto_53963 ) ) ( not ( = ?auto_53962 ?auto_53964 ) ) ( not ( = ?auto_53962 ?auto_53965 ) ) ( not ( = ?auto_53962 ?auto_53966 ) ) ( not ( = ?auto_53962 ?auto_53967 ) ) ( not ( = ?auto_53962 ?auto_53968 ) ) ( not ( = ?auto_53963 ?auto_53964 ) ) ( not ( = ?auto_53963 ?auto_53965 ) ) ( not ( = ?auto_53963 ?auto_53966 ) ) ( not ( = ?auto_53963 ?auto_53967 ) ) ( not ( = ?auto_53963 ?auto_53968 ) ) ( not ( = ?auto_53964 ?auto_53965 ) ) ( not ( = ?auto_53964 ?auto_53966 ) ) ( not ( = ?auto_53964 ?auto_53967 ) ) ( not ( = ?auto_53964 ?auto_53968 ) ) ( not ( = ?auto_53965 ?auto_53966 ) ) ( not ( = ?auto_53965 ?auto_53967 ) ) ( not ( = ?auto_53965 ?auto_53968 ) ) ( not ( = ?auto_53966 ?auto_53967 ) ) ( not ( = ?auto_53966 ?auto_53968 ) ) ( not ( = ?auto_53967 ?auto_53968 ) ) ( CLEAR ?auto_53965 ) ( ON ?auto_53966 ?auto_53967 ) ( CLEAR ?auto_53966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53962 ?auto_53963 ?auto_53964 ?auto_53965 ?auto_53966 )
      ( MAKE-6PILE ?auto_53962 ?auto_53963 ?auto_53964 ?auto_53965 ?auto_53966 ?auto_53967 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53975 - BLOCK
      ?auto_53976 - BLOCK
      ?auto_53977 - BLOCK
      ?auto_53978 - BLOCK
      ?auto_53979 - BLOCK
      ?auto_53980 - BLOCK
    )
    :vars
    (
      ?auto_53981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53980 ?auto_53981 ) ( ON-TABLE ?auto_53975 ) ( ON ?auto_53976 ?auto_53975 ) ( ON ?auto_53977 ?auto_53976 ) ( ON ?auto_53978 ?auto_53977 ) ( not ( = ?auto_53975 ?auto_53976 ) ) ( not ( = ?auto_53975 ?auto_53977 ) ) ( not ( = ?auto_53975 ?auto_53978 ) ) ( not ( = ?auto_53975 ?auto_53979 ) ) ( not ( = ?auto_53975 ?auto_53980 ) ) ( not ( = ?auto_53975 ?auto_53981 ) ) ( not ( = ?auto_53976 ?auto_53977 ) ) ( not ( = ?auto_53976 ?auto_53978 ) ) ( not ( = ?auto_53976 ?auto_53979 ) ) ( not ( = ?auto_53976 ?auto_53980 ) ) ( not ( = ?auto_53976 ?auto_53981 ) ) ( not ( = ?auto_53977 ?auto_53978 ) ) ( not ( = ?auto_53977 ?auto_53979 ) ) ( not ( = ?auto_53977 ?auto_53980 ) ) ( not ( = ?auto_53977 ?auto_53981 ) ) ( not ( = ?auto_53978 ?auto_53979 ) ) ( not ( = ?auto_53978 ?auto_53980 ) ) ( not ( = ?auto_53978 ?auto_53981 ) ) ( not ( = ?auto_53979 ?auto_53980 ) ) ( not ( = ?auto_53979 ?auto_53981 ) ) ( not ( = ?auto_53980 ?auto_53981 ) ) ( CLEAR ?auto_53978 ) ( ON ?auto_53979 ?auto_53980 ) ( CLEAR ?auto_53979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_53975 ?auto_53976 ?auto_53977 ?auto_53978 ?auto_53979 )
      ( MAKE-6PILE ?auto_53975 ?auto_53976 ?auto_53977 ?auto_53978 ?auto_53979 ?auto_53980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_53988 - BLOCK
      ?auto_53989 - BLOCK
      ?auto_53990 - BLOCK
      ?auto_53991 - BLOCK
      ?auto_53992 - BLOCK
      ?auto_53993 - BLOCK
    )
    :vars
    (
      ?auto_53994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_53993 ?auto_53994 ) ( ON-TABLE ?auto_53988 ) ( ON ?auto_53989 ?auto_53988 ) ( ON ?auto_53990 ?auto_53989 ) ( not ( = ?auto_53988 ?auto_53989 ) ) ( not ( = ?auto_53988 ?auto_53990 ) ) ( not ( = ?auto_53988 ?auto_53991 ) ) ( not ( = ?auto_53988 ?auto_53992 ) ) ( not ( = ?auto_53988 ?auto_53993 ) ) ( not ( = ?auto_53988 ?auto_53994 ) ) ( not ( = ?auto_53989 ?auto_53990 ) ) ( not ( = ?auto_53989 ?auto_53991 ) ) ( not ( = ?auto_53989 ?auto_53992 ) ) ( not ( = ?auto_53989 ?auto_53993 ) ) ( not ( = ?auto_53989 ?auto_53994 ) ) ( not ( = ?auto_53990 ?auto_53991 ) ) ( not ( = ?auto_53990 ?auto_53992 ) ) ( not ( = ?auto_53990 ?auto_53993 ) ) ( not ( = ?auto_53990 ?auto_53994 ) ) ( not ( = ?auto_53991 ?auto_53992 ) ) ( not ( = ?auto_53991 ?auto_53993 ) ) ( not ( = ?auto_53991 ?auto_53994 ) ) ( not ( = ?auto_53992 ?auto_53993 ) ) ( not ( = ?auto_53992 ?auto_53994 ) ) ( not ( = ?auto_53993 ?auto_53994 ) ) ( ON ?auto_53992 ?auto_53993 ) ( CLEAR ?auto_53990 ) ( ON ?auto_53991 ?auto_53992 ) ( CLEAR ?auto_53991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_53988 ?auto_53989 ?auto_53990 ?auto_53991 )
      ( MAKE-6PILE ?auto_53988 ?auto_53989 ?auto_53990 ?auto_53991 ?auto_53992 ?auto_53993 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54001 - BLOCK
      ?auto_54002 - BLOCK
      ?auto_54003 - BLOCK
      ?auto_54004 - BLOCK
      ?auto_54005 - BLOCK
      ?auto_54006 - BLOCK
    )
    :vars
    (
      ?auto_54007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54006 ?auto_54007 ) ( ON-TABLE ?auto_54001 ) ( ON ?auto_54002 ?auto_54001 ) ( ON ?auto_54003 ?auto_54002 ) ( not ( = ?auto_54001 ?auto_54002 ) ) ( not ( = ?auto_54001 ?auto_54003 ) ) ( not ( = ?auto_54001 ?auto_54004 ) ) ( not ( = ?auto_54001 ?auto_54005 ) ) ( not ( = ?auto_54001 ?auto_54006 ) ) ( not ( = ?auto_54001 ?auto_54007 ) ) ( not ( = ?auto_54002 ?auto_54003 ) ) ( not ( = ?auto_54002 ?auto_54004 ) ) ( not ( = ?auto_54002 ?auto_54005 ) ) ( not ( = ?auto_54002 ?auto_54006 ) ) ( not ( = ?auto_54002 ?auto_54007 ) ) ( not ( = ?auto_54003 ?auto_54004 ) ) ( not ( = ?auto_54003 ?auto_54005 ) ) ( not ( = ?auto_54003 ?auto_54006 ) ) ( not ( = ?auto_54003 ?auto_54007 ) ) ( not ( = ?auto_54004 ?auto_54005 ) ) ( not ( = ?auto_54004 ?auto_54006 ) ) ( not ( = ?auto_54004 ?auto_54007 ) ) ( not ( = ?auto_54005 ?auto_54006 ) ) ( not ( = ?auto_54005 ?auto_54007 ) ) ( not ( = ?auto_54006 ?auto_54007 ) ) ( ON ?auto_54005 ?auto_54006 ) ( CLEAR ?auto_54003 ) ( ON ?auto_54004 ?auto_54005 ) ( CLEAR ?auto_54004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54001 ?auto_54002 ?auto_54003 ?auto_54004 )
      ( MAKE-6PILE ?auto_54001 ?auto_54002 ?auto_54003 ?auto_54004 ?auto_54005 ?auto_54006 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54014 - BLOCK
      ?auto_54015 - BLOCK
      ?auto_54016 - BLOCK
      ?auto_54017 - BLOCK
      ?auto_54018 - BLOCK
      ?auto_54019 - BLOCK
    )
    :vars
    (
      ?auto_54020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54019 ?auto_54020 ) ( ON-TABLE ?auto_54014 ) ( ON ?auto_54015 ?auto_54014 ) ( not ( = ?auto_54014 ?auto_54015 ) ) ( not ( = ?auto_54014 ?auto_54016 ) ) ( not ( = ?auto_54014 ?auto_54017 ) ) ( not ( = ?auto_54014 ?auto_54018 ) ) ( not ( = ?auto_54014 ?auto_54019 ) ) ( not ( = ?auto_54014 ?auto_54020 ) ) ( not ( = ?auto_54015 ?auto_54016 ) ) ( not ( = ?auto_54015 ?auto_54017 ) ) ( not ( = ?auto_54015 ?auto_54018 ) ) ( not ( = ?auto_54015 ?auto_54019 ) ) ( not ( = ?auto_54015 ?auto_54020 ) ) ( not ( = ?auto_54016 ?auto_54017 ) ) ( not ( = ?auto_54016 ?auto_54018 ) ) ( not ( = ?auto_54016 ?auto_54019 ) ) ( not ( = ?auto_54016 ?auto_54020 ) ) ( not ( = ?auto_54017 ?auto_54018 ) ) ( not ( = ?auto_54017 ?auto_54019 ) ) ( not ( = ?auto_54017 ?auto_54020 ) ) ( not ( = ?auto_54018 ?auto_54019 ) ) ( not ( = ?auto_54018 ?auto_54020 ) ) ( not ( = ?auto_54019 ?auto_54020 ) ) ( ON ?auto_54018 ?auto_54019 ) ( ON ?auto_54017 ?auto_54018 ) ( CLEAR ?auto_54015 ) ( ON ?auto_54016 ?auto_54017 ) ( CLEAR ?auto_54016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54014 ?auto_54015 ?auto_54016 )
      ( MAKE-6PILE ?auto_54014 ?auto_54015 ?auto_54016 ?auto_54017 ?auto_54018 ?auto_54019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54027 - BLOCK
      ?auto_54028 - BLOCK
      ?auto_54029 - BLOCK
      ?auto_54030 - BLOCK
      ?auto_54031 - BLOCK
      ?auto_54032 - BLOCK
    )
    :vars
    (
      ?auto_54033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54032 ?auto_54033 ) ( ON-TABLE ?auto_54027 ) ( ON ?auto_54028 ?auto_54027 ) ( not ( = ?auto_54027 ?auto_54028 ) ) ( not ( = ?auto_54027 ?auto_54029 ) ) ( not ( = ?auto_54027 ?auto_54030 ) ) ( not ( = ?auto_54027 ?auto_54031 ) ) ( not ( = ?auto_54027 ?auto_54032 ) ) ( not ( = ?auto_54027 ?auto_54033 ) ) ( not ( = ?auto_54028 ?auto_54029 ) ) ( not ( = ?auto_54028 ?auto_54030 ) ) ( not ( = ?auto_54028 ?auto_54031 ) ) ( not ( = ?auto_54028 ?auto_54032 ) ) ( not ( = ?auto_54028 ?auto_54033 ) ) ( not ( = ?auto_54029 ?auto_54030 ) ) ( not ( = ?auto_54029 ?auto_54031 ) ) ( not ( = ?auto_54029 ?auto_54032 ) ) ( not ( = ?auto_54029 ?auto_54033 ) ) ( not ( = ?auto_54030 ?auto_54031 ) ) ( not ( = ?auto_54030 ?auto_54032 ) ) ( not ( = ?auto_54030 ?auto_54033 ) ) ( not ( = ?auto_54031 ?auto_54032 ) ) ( not ( = ?auto_54031 ?auto_54033 ) ) ( not ( = ?auto_54032 ?auto_54033 ) ) ( ON ?auto_54031 ?auto_54032 ) ( ON ?auto_54030 ?auto_54031 ) ( CLEAR ?auto_54028 ) ( ON ?auto_54029 ?auto_54030 ) ( CLEAR ?auto_54029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54027 ?auto_54028 ?auto_54029 )
      ( MAKE-6PILE ?auto_54027 ?auto_54028 ?auto_54029 ?auto_54030 ?auto_54031 ?auto_54032 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54040 - BLOCK
      ?auto_54041 - BLOCK
      ?auto_54042 - BLOCK
      ?auto_54043 - BLOCK
      ?auto_54044 - BLOCK
      ?auto_54045 - BLOCK
    )
    :vars
    (
      ?auto_54046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54045 ?auto_54046 ) ( ON-TABLE ?auto_54040 ) ( not ( = ?auto_54040 ?auto_54041 ) ) ( not ( = ?auto_54040 ?auto_54042 ) ) ( not ( = ?auto_54040 ?auto_54043 ) ) ( not ( = ?auto_54040 ?auto_54044 ) ) ( not ( = ?auto_54040 ?auto_54045 ) ) ( not ( = ?auto_54040 ?auto_54046 ) ) ( not ( = ?auto_54041 ?auto_54042 ) ) ( not ( = ?auto_54041 ?auto_54043 ) ) ( not ( = ?auto_54041 ?auto_54044 ) ) ( not ( = ?auto_54041 ?auto_54045 ) ) ( not ( = ?auto_54041 ?auto_54046 ) ) ( not ( = ?auto_54042 ?auto_54043 ) ) ( not ( = ?auto_54042 ?auto_54044 ) ) ( not ( = ?auto_54042 ?auto_54045 ) ) ( not ( = ?auto_54042 ?auto_54046 ) ) ( not ( = ?auto_54043 ?auto_54044 ) ) ( not ( = ?auto_54043 ?auto_54045 ) ) ( not ( = ?auto_54043 ?auto_54046 ) ) ( not ( = ?auto_54044 ?auto_54045 ) ) ( not ( = ?auto_54044 ?auto_54046 ) ) ( not ( = ?auto_54045 ?auto_54046 ) ) ( ON ?auto_54044 ?auto_54045 ) ( ON ?auto_54043 ?auto_54044 ) ( ON ?auto_54042 ?auto_54043 ) ( CLEAR ?auto_54040 ) ( ON ?auto_54041 ?auto_54042 ) ( CLEAR ?auto_54041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54040 ?auto_54041 )
      ( MAKE-6PILE ?auto_54040 ?auto_54041 ?auto_54042 ?auto_54043 ?auto_54044 ?auto_54045 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54053 - BLOCK
      ?auto_54054 - BLOCK
      ?auto_54055 - BLOCK
      ?auto_54056 - BLOCK
      ?auto_54057 - BLOCK
      ?auto_54058 - BLOCK
    )
    :vars
    (
      ?auto_54059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54058 ?auto_54059 ) ( ON-TABLE ?auto_54053 ) ( not ( = ?auto_54053 ?auto_54054 ) ) ( not ( = ?auto_54053 ?auto_54055 ) ) ( not ( = ?auto_54053 ?auto_54056 ) ) ( not ( = ?auto_54053 ?auto_54057 ) ) ( not ( = ?auto_54053 ?auto_54058 ) ) ( not ( = ?auto_54053 ?auto_54059 ) ) ( not ( = ?auto_54054 ?auto_54055 ) ) ( not ( = ?auto_54054 ?auto_54056 ) ) ( not ( = ?auto_54054 ?auto_54057 ) ) ( not ( = ?auto_54054 ?auto_54058 ) ) ( not ( = ?auto_54054 ?auto_54059 ) ) ( not ( = ?auto_54055 ?auto_54056 ) ) ( not ( = ?auto_54055 ?auto_54057 ) ) ( not ( = ?auto_54055 ?auto_54058 ) ) ( not ( = ?auto_54055 ?auto_54059 ) ) ( not ( = ?auto_54056 ?auto_54057 ) ) ( not ( = ?auto_54056 ?auto_54058 ) ) ( not ( = ?auto_54056 ?auto_54059 ) ) ( not ( = ?auto_54057 ?auto_54058 ) ) ( not ( = ?auto_54057 ?auto_54059 ) ) ( not ( = ?auto_54058 ?auto_54059 ) ) ( ON ?auto_54057 ?auto_54058 ) ( ON ?auto_54056 ?auto_54057 ) ( ON ?auto_54055 ?auto_54056 ) ( CLEAR ?auto_54053 ) ( ON ?auto_54054 ?auto_54055 ) ( CLEAR ?auto_54054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54053 ?auto_54054 )
      ( MAKE-6PILE ?auto_54053 ?auto_54054 ?auto_54055 ?auto_54056 ?auto_54057 ?auto_54058 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54066 - BLOCK
      ?auto_54067 - BLOCK
      ?auto_54068 - BLOCK
      ?auto_54069 - BLOCK
      ?auto_54070 - BLOCK
      ?auto_54071 - BLOCK
    )
    :vars
    (
      ?auto_54072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54071 ?auto_54072 ) ( not ( = ?auto_54066 ?auto_54067 ) ) ( not ( = ?auto_54066 ?auto_54068 ) ) ( not ( = ?auto_54066 ?auto_54069 ) ) ( not ( = ?auto_54066 ?auto_54070 ) ) ( not ( = ?auto_54066 ?auto_54071 ) ) ( not ( = ?auto_54066 ?auto_54072 ) ) ( not ( = ?auto_54067 ?auto_54068 ) ) ( not ( = ?auto_54067 ?auto_54069 ) ) ( not ( = ?auto_54067 ?auto_54070 ) ) ( not ( = ?auto_54067 ?auto_54071 ) ) ( not ( = ?auto_54067 ?auto_54072 ) ) ( not ( = ?auto_54068 ?auto_54069 ) ) ( not ( = ?auto_54068 ?auto_54070 ) ) ( not ( = ?auto_54068 ?auto_54071 ) ) ( not ( = ?auto_54068 ?auto_54072 ) ) ( not ( = ?auto_54069 ?auto_54070 ) ) ( not ( = ?auto_54069 ?auto_54071 ) ) ( not ( = ?auto_54069 ?auto_54072 ) ) ( not ( = ?auto_54070 ?auto_54071 ) ) ( not ( = ?auto_54070 ?auto_54072 ) ) ( not ( = ?auto_54071 ?auto_54072 ) ) ( ON ?auto_54070 ?auto_54071 ) ( ON ?auto_54069 ?auto_54070 ) ( ON ?auto_54068 ?auto_54069 ) ( ON ?auto_54067 ?auto_54068 ) ( ON ?auto_54066 ?auto_54067 ) ( CLEAR ?auto_54066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54066 )
      ( MAKE-6PILE ?auto_54066 ?auto_54067 ?auto_54068 ?auto_54069 ?auto_54070 ?auto_54071 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_54079 - BLOCK
      ?auto_54080 - BLOCK
      ?auto_54081 - BLOCK
      ?auto_54082 - BLOCK
      ?auto_54083 - BLOCK
      ?auto_54084 - BLOCK
    )
    :vars
    (
      ?auto_54085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54084 ?auto_54085 ) ( not ( = ?auto_54079 ?auto_54080 ) ) ( not ( = ?auto_54079 ?auto_54081 ) ) ( not ( = ?auto_54079 ?auto_54082 ) ) ( not ( = ?auto_54079 ?auto_54083 ) ) ( not ( = ?auto_54079 ?auto_54084 ) ) ( not ( = ?auto_54079 ?auto_54085 ) ) ( not ( = ?auto_54080 ?auto_54081 ) ) ( not ( = ?auto_54080 ?auto_54082 ) ) ( not ( = ?auto_54080 ?auto_54083 ) ) ( not ( = ?auto_54080 ?auto_54084 ) ) ( not ( = ?auto_54080 ?auto_54085 ) ) ( not ( = ?auto_54081 ?auto_54082 ) ) ( not ( = ?auto_54081 ?auto_54083 ) ) ( not ( = ?auto_54081 ?auto_54084 ) ) ( not ( = ?auto_54081 ?auto_54085 ) ) ( not ( = ?auto_54082 ?auto_54083 ) ) ( not ( = ?auto_54082 ?auto_54084 ) ) ( not ( = ?auto_54082 ?auto_54085 ) ) ( not ( = ?auto_54083 ?auto_54084 ) ) ( not ( = ?auto_54083 ?auto_54085 ) ) ( not ( = ?auto_54084 ?auto_54085 ) ) ( ON ?auto_54083 ?auto_54084 ) ( ON ?auto_54082 ?auto_54083 ) ( ON ?auto_54081 ?auto_54082 ) ( ON ?auto_54080 ?auto_54081 ) ( ON ?auto_54079 ?auto_54080 ) ( CLEAR ?auto_54079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54079 )
      ( MAKE-6PILE ?auto_54079 ?auto_54080 ?auto_54081 ?auto_54082 ?auto_54083 ?auto_54084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54093 - BLOCK
      ?auto_54094 - BLOCK
      ?auto_54095 - BLOCK
      ?auto_54096 - BLOCK
      ?auto_54097 - BLOCK
      ?auto_54098 - BLOCK
      ?auto_54099 - BLOCK
    )
    :vars
    (
      ?auto_54100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54098 ) ( ON ?auto_54099 ?auto_54100 ) ( CLEAR ?auto_54099 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54093 ) ( ON ?auto_54094 ?auto_54093 ) ( ON ?auto_54095 ?auto_54094 ) ( ON ?auto_54096 ?auto_54095 ) ( ON ?auto_54097 ?auto_54096 ) ( ON ?auto_54098 ?auto_54097 ) ( not ( = ?auto_54093 ?auto_54094 ) ) ( not ( = ?auto_54093 ?auto_54095 ) ) ( not ( = ?auto_54093 ?auto_54096 ) ) ( not ( = ?auto_54093 ?auto_54097 ) ) ( not ( = ?auto_54093 ?auto_54098 ) ) ( not ( = ?auto_54093 ?auto_54099 ) ) ( not ( = ?auto_54093 ?auto_54100 ) ) ( not ( = ?auto_54094 ?auto_54095 ) ) ( not ( = ?auto_54094 ?auto_54096 ) ) ( not ( = ?auto_54094 ?auto_54097 ) ) ( not ( = ?auto_54094 ?auto_54098 ) ) ( not ( = ?auto_54094 ?auto_54099 ) ) ( not ( = ?auto_54094 ?auto_54100 ) ) ( not ( = ?auto_54095 ?auto_54096 ) ) ( not ( = ?auto_54095 ?auto_54097 ) ) ( not ( = ?auto_54095 ?auto_54098 ) ) ( not ( = ?auto_54095 ?auto_54099 ) ) ( not ( = ?auto_54095 ?auto_54100 ) ) ( not ( = ?auto_54096 ?auto_54097 ) ) ( not ( = ?auto_54096 ?auto_54098 ) ) ( not ( = ?auto_54096 ?auto_54099 ) ) ( not ( = ?auto_54096 ?auto_54100 ) ) ( not ( = ?auto_54097 ?auto_54098 ) ) ( not ( = ?auto_54097 ?auto_54099 ) ) ( not ( = ?auto_54097 ?auto_54100 ) ) ( not ( = ?auto_54098 ?auto_54099 ) ) ( not ( = ?auto_54098 ?auto_54100 ) ) ( not ( = ?auto_54099 ?auto_54100 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54099 ?auto_54100 )
      ( !STACK ?auto_54099 ?auto_54098 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54108 - BLOCK
      ?auto_54109 - BLOCK
      ?auto_54110 - BLOCK
      ?auto_54111 - BLOCK
      ?auto_54112 - BLOCK
      ?auto_54113 - BLOCK
      ?auto_54114 - BLOCK
    )
    :vars
    (
      ?auto_54115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54113 ) ( ON ?auto_54114 ?auto_54115 ) ( CLEAR ?auto_54114 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54108 ) ( ON ?auto_54109 ?auto_54108 ) ( ON ?auto_54110 ?auto_54109 ) ( ON ?auto_54111 ?auto_54110 ) ( ON ?auto_54112 ?auto_54111 ) ( ON ?auto_54113 ?auto_54112 ) ( not ( = ?auto_54108 ?auto_54109 ) ) ( not ( = ?auto_54108 ?auto_54110 ) ) ( not ( = ?auto_54108 ?auto_54111 ) ) ( not ( = ?auto_54108 ?auto_54112 ) ) ( not ( = ?auto_54108 ?auto_54113 ) ) ( not ( = ?auto_54108 ?auto_54114 ) ) ( not ( = ?auto_54108 ?auto_54115 ) ) ( not ( = ?auto_54109 ?auto_54110 ) ) ( not ( = ?auto_54109 ?auto_54111 ) ) ( not ( = ?auto_54109 ?auto_54112 ) ) ( not ( = ?auto_54109 ?auto_54113 ) ) ( not ( = ?auto_54109 ?auto_54114 ) ) ( not ( = ?auto_54109 ?auto_54115 ) ) ( not ( = ?auto_54110 ?auto_54111 ) ) ( not ( = ?auto_54110 ?auto_54112 ) ) ( not ( = ?auto_54110 ?auto_54113 ) ) ( not ( = ?auto_54110 ?auto_54114 ) ) ( not ( = ?auto_54110 ?auto_54115 ) ) ( not ( = ?auto_54111 ?auto_54112 ) ) ( not ( = ?auto_54111 ?auto_54113 ) ) ( not ( = ?auto_54111 ?auto_54114 ) ) ( not ( = ?auto_54111 ?auto_54115 ) ) ( not ( = ?auto_54112 ?auto_54113 ) ) ( not ( = ?auto_54112 ?auto_54114 ) ) ( not ( = ?auto_54112 ?auto_54115 ) ) ( not ( = ?auto_54113 ?auto_54114 ) ) ( not ( = ?auto_54113 ?auto_54115 ) ) ( not ( = ?auto_54114 ?auto_54115 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54114 ?auto_54115 )
      ( !STACK ?auto_54114 ?auto_54113 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54123 - BLOCK
      ?auto_54124 - BLOCK
      ?auto_54125 - BLOCK
      ?auto_54126 - BLOCK
      ?auto_54127 - BLOCK
      ?auto_54128 - BLOCK
      ?auto_54129 - BLOCK
    )
    :vars
    (
      ?auto_54130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54129 ?auto_54130 ) ( ON-TABLE ?auto_54123 ) ( ON ?auto_54124 ?auto_54123 ) ( ON ?auto_54125 ?auto_54124 ) ( ON ?auto_54126 ?auto_54125 ) ( ON ?auto_54127 ?auto_54126 ) ( not ( = ?auto_54123 ?auto_54124 ) ) ( not ( = ?auto_54123 ?auto_54125 ) ) ( not ( = ?auto_54123 ?auto_54126 ) ) ( not ( = ?auto_54123 ?auto_54127 ) ) ( not ( = ?auto_54123 ?auto_54128 ) ) ( not ( = ?auto_54123 ?auto_54129 ) ) ( not ( = ?auto_54123 ?auto_54130 ) ) ( not ( = ?auto_54124 ?auto_54125 ) ) ( not ( = ?auto_54124 ?auto_54126 ) ) ( not ( = ?auto_54124 ?auto_54127 ) ) ( not ( = ?auto_54124 ?auto_54128 ) ) ( not ( = ?auto_54124 ?auto_54129 ) ) ( not ( = ?auto_54124 ?auto_54130 ) ) ( not ( = ?auto_54125 ?auto_54126 ) ) ( not ( = ?auto_54125 ?auto_54127 ) ) ( not ( = ?auto_54125 ?auto_54128 ) ) ( not ( = ?auto_54125 ?auto_54129 ) ) ( not ( = ?auto_54125 ?auto_54130 ) ) ( not ( = ?auto_54126 ?auto_54127 ) ) ( not ( = ?auto_54126 ?auto_54128 ) ) ( not ( = ?auto_54126 ?auto_54129 ) ) ( not ( = ?auto_54126 ?auto_54130 ) ) ( not ( = ?auto_54127 ?auto_54128 ) ) ( not ( = ?auto_54127 ?auto_54129 ) ) ( not ( = ?auto_54127 ?auto_54130 ) ) ( not ( = ?auto_54128 ?auto_54129 ) ) ( not ( = ?auto_54128 ?auto_54130 ) ) ( not ( = ?auto_54129 ?auto_54130 ) ) ( CLEAR ?auto_54127 ) ( ON ?auto_54128 ?auto_54129 ) ( CLEAR ?auto_54128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54123 ?auto_54124 ?auto_54125 ?auto_54126 ?auto_54127 ?auto_54128 )
      ( MAKE-7PILE ?auto_54123 ?auto_54124 ?auto_54125 ?auto_54126 ?auto_54127 ?auto_54128 ?auto_54129 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54138 - BLOCK
      ?auto_54139 - BLOCK
      ?auto_54140 - BLOCK
      ?auto_54141 - BLOCK
      ?auto_54142 - BLOCK
      ?auto_54143 - BLOCK
      ?auto_54144 - BLOCK
    )
    :vars
    (
      ?auto_54145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54144 ?auto_54145 ) ( ON-TABLE ?auto_54138 ) ( ON ?auto_54139 ?auto_54138 ) ( ON ?auto_54140 ?auto_54139 ) ( ON ?auto_54141 ?auto_54140 ) ( ON ?auto_54142 ?auto_54141 ) ( not ( = ?auto_54138 ?auto_54139 ) ) ( not ( = ?auto_54138 ?auto_54140 ) ) ( not ( = ?auto_54138 ?auto_54141 ) ) ( not ( = ?auto_54138 ?auto_54142 ) ) ( not ( = ?auto_54138 ?auto_54143 ) ) ( not ( = ?auto_54138 ?auto_54144 ) ) ( not ( = ?auto_54138 ?auto_54145 ) ) ( not ( = ?auto_54139 ?auto_54140 ) ) ( not ( = ?auto_54139 ?auto_54141 ) ) ( not ( = ?auto_54139 ?auto_54142 ) ) ( not ( = ?auto_54139 ?auto_54143 ) ) ( not ( = ?auto_54139 ?auto_54144 ) ) ( not ( = ?auto_54139 ?auto_54145 ) ) ( not ( = ?auto_54140 ?auto_54141 ) ) ( not ( = ?auto_54140 ?auto_54142 ) ) ( not ( = ?auto_54140 ?auto_54143 ) ) ( not ( = ?auto_54140 ?auto_54144 ) ) ( not ( = ?auto_54140 ?auto_54145 ) ) ( not ( = ?auto_54141 ?auto_54142 ) ) ( not ( = ?auto_54141 ?auto_54143 ) ) ( not ( = ?auto_54141 ?auto_54144 ) ) ( not ( = ?auto_54141 ?auto_54145 ) ) ( not ( = ?auto_54142 ?auto_54143 ) ) ( not ( = ?auto_54142 ?auto_54144 ) ) ( not ( = ?auto_54142 ?auto_54145 ) ) ( not ( = ?auto_54143 ?auto_54144 ) ) ( not ( = ?auto_54143 ?auto_54145 ) ) ( not ( = ?auto_54144 ?auto_54145 ) ) ( CLEAR ?auto_54142 ) ( ON ?auto_54143 ?auto_54144 ) ( CLEAR ?auto_54143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54138 ?auto_54139 ?auto_54140 ?auto_54141 ?auto_54142 ?auto_54143 )
      ( MAKE-7PILE ?auto_54138 ?auto_54139 ?auto_54140 ?auto_54141 ?auto_54142 ?auto_54143 ?auto_54144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54153 - BLOCK
      ?auto_54154 - BLOCK
      ?auto_54155 - BLOCK
      ?auto_54156 - BLOCK
      ?auto_54157 - BLOCK
      ?auto_54158 - BLOCK
      ?auto_54159 - BLOCK
    )
    :vars
    (
      ?auto_54160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54159 ?auto_54160 ) ( ON-TABLE ?auto_54153 ) ( ON ?auto_54154 ?auto_54153 ) ( ON ?auto_54155 ?auto_54154 ) ( ON ?auto_54156 ?auto_54155 ) ( not ( = ?auto_54153 ?auto_54154 ) ) ( not ( = ?auto_54153 ?auto_54155 ) ) ( not ( = ?auto_54153 ?auto_54156 ) ) ( not ( = ?auto_54153 ?auto_54157 ) ) ( not ( = ?auto_54153 ?auto_54158 ) ) ( not ( = ?auto_54153 ?auto_54159 ) ) ( not ( = ?auto_54153 ?auto_54160 ) ) ( not ( = ?auto_54154 ?auto_54155 ) ) ( not ( = ?auto_54154 ?auto_54156 ) ) ( not ( = ?auto_54154 ?auto_54157 ) ) ( not ( = ?auto_54154 ?auto_54158 ) ) ( not ( = ?auto_54154 ?auto_54159 ) ) ( not ( = ?auto_54154 ?auto_54160 ) ) ( not ( = ?auto_54155 ?auto_54156 ) ) ( not ( = ?auto_54155 ?auto_54157 ) ) ( not ( = ?auto_54155 ?auto_54158 ) ) ( not ( = ?auto_54155 ?auto_54159 ) ) ( not ( = ?auto_54155 ?auto_54160 ) ) ( not ( = ?auto_54156 ?auto_54157 ) ) ( not ( = ?auto_54156 ?auto_54158 ) ) ( not ( = ?auto_54156 ?auto_54159 ) ) ( not ( = ?auto_54156 ?auto_54160 ) ) ( not ( = ?auto_54157 ?auto_54158 ) ) ( not ( = ?auto_54157 ?auto_54159 ) ) ( not ( = ?auto_54157 ?auto_54160 ) ) ( not ( = ?auto_54158 ?auto_54159 ) ) ( not ( = ?auto_54158 ?auto_54160 ) ) ( not ( = ?auto_54159 ?auto_54160 ) ) ( ON ?auto_54158 ?auto_54159 ) ( CLEAR ?auto_54156 ) ( ON ?auto_54157 ?auto_54158 ) ( CLEAR ?auto_54157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54153 ?auto_54154 ?auto_54155 ?auto_54156 ?auto_54157 )
      ( MAKE-7PILE ?auto_54153 ?auto_54154 ?auto_54155 ?auto_54156 ?auto_54157 ?auto_54158 ?auto_54159 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54168 - BLOCK
      ?auto_54169 - BLOCK
      ?auto_54170 - BLOCK
      ?auto_54171 - BLOCK
      ?auto_54172 - BLOCK
      ?auto_54173 - BLOCK
      ?auto_54174 - BLOCK
    )
    :vars
    (
      ?auto_54175 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54174 ?auto_54175 ) ( ON-TABLE ?auto_54168 ) ( ON ?auto_54169 ?auto_54168 ) ( ON ?auto_54170 ?auto_54169 ) ( ON ?auto_54171 ?auto_54170 ) ( not ( = ?auto_54168 ?auto_54169 ) ) ( not ( = ?auto_54168 ?auto_54170 ) ) ( not ( = ?auto_54168 ?auto_54171 ) ) ( not ( = ?auto_54168 ?auto_54172 ) ) ( not ( = ?auto_54168 ?auto_54173 ) ) ( not ( = ?auto_54168 ?auto_54174 ) ) ( not ( = ?auto_54168 ?auto_54175 ) ) ( not ( = ?auto_54169 ?auto_54170 ) ) ( not ( = ?auto_54169 ?auto_54171 ) ) ( not ( = ?auto_54169 ?auto_54172 ) ) ( not ( = ?auto_54169 ?auto_54173 ) ) ( not ( = ?auto_54169 ?auto_54174 ) ) ( not ( = ?auto_54169 ?auto_54175 ) ) ( not ( = ?auto_54170 ?auto_54171 ) ) ( not ( = ?auto_54170 ?auto_54172 ) ) ( not ( = ?auto_54170 ?auto_54173 ) ) ( not ( = ?auto_54170 ?auto_54174 ) ) ( not ( = ?auto_54170 ?auto_54175 ) ) ( not ( = ?auto_54171 ?auto_54172 ) ) ( not ( = ?auto_54171 ?auto_54173 ) ) ( not ( = ?auto_54171 ?auto_54174 ) ) ( not ( = ?auto_54171 ?auto_54175 ) ) ( not ( = ?auto_54172 ?auto_54173 ) ) ( not ( = ?auto_54172 ?auto_54174 ) ) ( not ( = ?auto_54172 ?auto_54175 ) ) ( not ( = ?auto_54173 ?auto_54174 ) ) ( not ( = ?auto_54173 ?auto_54175 ) ) ( not ( = ?auto_54174 ?auto_54175 ) ) ( ON ?auto_54173 ?auto_54174 ) ( CLEAR ?auto_54171 ) ( ON ?auto_54172 ?auto_54173 ) ( CLEAR ?auto_54172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54168 ?auto_54169 ?auto_54170 ?auto_54171 ?auto_54172 )
      ( MAKE-7PILE ?auto_54168 ?auto_54169 ?auto_54170 ?auto_54171 ?auto_54172 ?auto_54173 ?auto_54174 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54183 - BLOCK
      ?auto_54184 - BLOCK
      ?auto_54185 - BLOCK
      ?auto_54186 - BLOCK
      ?auto_54187 - BLOCK
      ?auto_54188 - BLOCK
      ?auto_54189 - BLOCK
    )
    :vars
    (
      ?auto_54190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54189 ?auto_54190 ) ( ON-TABLE ?auto_54183 ) ( ON ?auto_54184 ?auto_54183 ) ( ON ?auto_54185 ?auto_54184 ) ( not ( = ?auto_54183 ?auto_54184 ) ) ( not ( = ?auto_54183 ?auto_54185 ) ) ( not ( = ?auto_54183 ?auto_54186 ) ) ( not ( = ?auto_54183 ?auto_54187 ) ) ( not ( = ?auto_54183 ?auto_54188 ) ) ( not ( = ?auto_54183 ?auto_54189 ) ) ( not ( = ?auto_54183 ?auto_54190 ) ) ( not ( = ?auto_54184 ?auto_54185 ) ) ( not ( = ?auto_54184 ?auto_54186 ) ) ( not ( = ?auto_54184 ?auto_54187 ) ) ( not ( = ?auto_54184 ?auto_54188 ) ) ( not ( = ?auto_54184 ?auto_54189 ) ) ( not ( = ?auto_54184 ?auto_54190 ) ) ( not ( = ?auto_54185 ?auto_54186 ) ) ( not ( = ?auto_54185 ?auto_54187 ) ) ( not ( = ?auto_54185 ?auto_54188 ) ) ( not ( = ?auto_54185 ?auto_54189 ) ) ( not ( = ?auto_54185 ?auto_54190 ) ) ( not ( = ?auto_54186 ?auto_54187 ) ) ( not ( = ?auto_54186 ?auto_54188 ) ) ( not ( = ?auto_54186 ?auto_54189 ) ) ( not ( = ?auto_54186 ?auto_54190 ) ) ( not ( = ?auto_54187 ?auto_54188 ) ) ( not ( = ?auto_54187 ?auto_54189 ) ) ( not ( = ?auto_54187 ?auto_54190 ) ) ( not ( = ?auto_54188 ?auto_54189 ) ) ( not ( = ?auto_54188 ?auto_54190 ) ) ( not ( = ?auto_54189 ?auto_54190 ) ) ( ON ?auto_54188 ?auto_54189 ) ( ON ?auto_54187 ?auto_54188 ) ( CLEAR ?auto_54185 ) ( ON ?auto_54186 ?auto_54187 ) ( CLEAR ?auto_54186 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54183 ?auto_54184 ?auto_54185 ?auto_54186 )
      ( MAKE-7PILE ?auto_54183 ?auto_54184 ?auto_54185 ?auto_54186 ?auto_54187 ?auto_54188 ?auto_54189 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54198 - BLOCK
      ?auto_54199 - BLOCK
      ?auto_54200 - BLOCK
      ?auto_54201 - BLOCK
      ?auto_54202 - BLOCK
      ?auto_54203 - BLOCK
      ?auto_54204 - BLOCK
    )
    :vars
    (
      ?auto_54205 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54204 ?auto_54205 ) ( ON-TABLE ?auto_54198 ) ( ON ?auto_54199 ?auto_54198 ) ( ON ?auto_54200 ?auto_54199 ) ( not ( = ?auto_54198 ?auto_54199 ) ) ( not ( = ?auto_54198 ?auto_54200 ) ) ( not ( = ?auto_54198 ?auto_54201 ) ) ( not ( = ?auto_54198 ?auto_54202 ) ) ( not ( = ?auto_54198 ?auto_54203 ) ) ( not ( = ?auto_54198 ?auto_54204 ) ) ( not ( = ?auto_54198 ?auto_54205 ) ) ( not ( = ?auto_54199 ?auto_54200 ) ) ( not ( = ?auto_54199 ?auto_54201 ) ) ( not ( = ?auto_54199 ?auto_54202 ) ) ( not ( = ?auto_54199 ?auto_54203 ) ) ( not ( = ?auto_54199 ?auto_54204 ) ) ( not ( = ?auto_54199 ?auto_54205 ) ) ( not ( = ?auto_54200 ?auto_54201 ) ) ( not ( = ?auto_54200 ?auto_54202 ) ) ( not ( = ?auto_54200 ?auto_54203 ) ) ( not ( = ?auto_54200 ?auto_54204 ) ) ( not ( = ?auto_54200 ?auto_54205 ) ) ( not ( = ?auto_54201 ?auto_54202 ) ) ( not ( = ?auto_54201 ?auto_54203 ) ) ( not ( = ?auto_54201 ?auto_54204 ) ) ( not ( = ?auto_54201 ?auto_54205 ) ) ( not ( = ?auto_54202 ?auto_54203 ) ) ( not ( = ?auto_54202 ?auto_54204 ) ) ( not ( = ?auto_54202 ?auto_54205 ) ) ( not ( = ?auto_54203 ?auto_54204 ) ) ( not ( = ?auto_54203 ?auto_54205 ) ) ( not ( = ?auto_54204 ?auto_54205 ) ) ( ON ?auto_54203 ?auto_54204 ) ( ON ?auto_54202 ?auto_54203 ) ( CLEAR ?auto_54200 ) ( ON ?auto_54201 ?auto_54202 ) ( CLEAR ?auto_54201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54198 ?auto_54199 ?auto_54200 ?auto_54201 )
      ( MAKE-7PILE ?auto_54198 ?auto_54199 ?auto_54200 ?auto_54201 ?auto_54202 ?auto_54203 ?auto_54204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54213 - BLOCK
      ?auto_54214 - BLOCK
      ?auto_54215 - BLOCK
      ?auto_54216 - BLOCK
      ?auto_54217 - BLOCK
      ?auto_54218 - BLOCK
      ?auto_54219 - BLOCK
    )
    :vars
    (
      ?auto_54220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54219 ?auto_54220 ) ( ON-TABLE ?auto_54213 ) ( ON ?auto_54214 ?auto_54213 ) ( not ( = ?auto_54213 ?auto_54214 ) ) ( not ( = ?auto_54213 ?auto_54215 ) ) ( not ( = ?auto_54213 ?auto_54216 ) ) ( not ( = ?auto_54213 ?auto_54217 ) ) ( not ( = ?auto_54213 ?auto_54218 ) ) ( not ( = ?auto_54213 ?auto_54219 ) ) ( not ( = ?auto_54213 ?auto_54220 ) ) ( not ( = ?auto_54214 ?auto_54215 ) ) ( not ( = ?auto_54214 ?auto_54216 ) ) ( not ( = ?auto_54214 ?auto_54217 ) ) ( not ( = ?auto_54214 ?auto_54218 ) ) ( not ( = ?auto_54214 ?auto_54219 ) ) ( not ( = ?auto_54214 ?auto_54220 ) ) ( not ( = ?auto_54215 ?auto_54216 ) ) ( not ( = ?auto_54215 ?auto_54217 ) ) ( not ( = ?auto_54215 ?auto_54218 ) ) ( not ( = ?auto_54215 ?auto_54219 ) ) ( not ( = ?auto_54215 ?auto_54220 ) ) ( not ( = ?auto_54216 ?auto_54217 ) ) ( not ( = ?auto_54216 ?auto_54218 ) ) ( not ( = ?auto_54216 ?auto_54219 ) ) ( not ( = ?auto_54216 ?auto_54220 ) ) ( not ( = ?auto_54217 ?auto_54218 ) ) ( not ( = ?auto_54217 ?auto_54219 ) ) ( not ( = ?auto_54217 ?auto_54220 ) ) ( not ( = ?auto_54218 ?auto_54219 ) ) ( not ( = ?auto_54218 ?auto_54220 ) ) ( not ( = ?auto_54219 ?auto_54220 ) ) ( ON ?auto_54218 ?auto_54219 ) ( ON ?auto_54217 ?auto_54218 ) ( ON ?auto_54216 ?auto_54217 ) ( CLEAR ?auto_54214 ) ( ON ?auto_54215 ?auto_54216 ) ( CLEAR ?auto_54215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54213 ?auto_54214 ?auto_54215 )
      ( MAKE-7PILE ?auto_54213 ?auto_54214 ?auto_54215 ?auto_54216 ?auto_54217 ?auto_54218 ?auto_54219 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54228 - BLOCK
      ?auto_54229 - BLOCK
      ?auto_54230 - BLOCK
      ?auto_54231 - BLOCK
      ?auto_54232 - BLOCK
      ?auto_54233 - BLOCK
      ?auto_54234 - BLOCK
    )
    :vars
    (
      ?auto_54235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54234 ?auto_54235 ) ( ON-TABLE ?auto_54228 ) ( ON ?auto_54229 ?auto_54228 ) ( not ( = ?auto_54228 ?auto_54229 ) ) ( not ( = ?auto_54228 ?auto_54230 ) ) ( not ( = ?auto_54228 ?auto_54231 ) ) ( not ( = ?auto_54228 ?auto_54232 ) ) ( not ( = ?auto_54228 ?auto_54233 ) ) ( not ( = ?auto_54228 ?auto_54234 ) ) ( not ( = ?auto_54228 ?auto_54235 ) ) ( not ( = ?auto_54229 ?auto_54230 ) ) ( not ( = ?auto_54229 ?auto_54231 ) ) ( not ( = ?auto_54229 ?auto_54232 ) ) ( not ( = ?auto_54229 ?auto_54233 ) ) ( not ( = ?auto_54229 ?auto_54234 ) ) ( not ( = ?auto_54229 ?auto_54235 ) ) ( not ( = ?auto_54230 ?auto_54231 ) ) ( not ( = ?auto_54230 ?auto_54232 ) ) ( not ( = ?auto_54230 ?auto_54233 ) ) ( not ( = ?auto_54230 ?auto_54234 ) ) ( not ( = ?auto_54230 ?auto_54235 ) ) ( not ( = ?auto_54231 ?auto_54232 ) ) ( not ( = ?auto_54231 ?auto_54233 ) ) ( not ( = ?auto_54231 ?auto_54234 ) ) ( not ( = ?auto_54231 ?auto_54235 ) ) ( not ( = ?auto_54232 ?auto_54233 ) ) ( not ( = ?auto_54232 ?auto_54234 ) ) ( not ( = ?auto_54232 ?auto_54235 ) ) ( not ( = ?auto_54233 ?auto_54234 ) ) ( not ( = ?auto_54233 ?auto_54235 ) ) ( not ( = ?auto_54234 ?auto_54235 ) ) ( ON ?auto_54233 ?auto_54234 ) ( ON ?auto_54232 ?auto_54233 ) ( ON ?auto_54231 ?auto_54232 ) ( CLEAR ?auto_54229 ) ( ON ?auto_54230 ?auto_54231 ) ( CLEAR ?auto_54230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54228 ?auto_54229 ?auto_54230 )
      ( MAKE-7PILE ?auto_54228 ?auto_54229 ?auto_54230 ?auto_54231 ?auto_54232 ?auto_54233 ?auto_54234 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54243 - BLOCK
      ?auto_54244 - BLOCK
      ?auto_54245 - BLOCK
      ?auto_54246 - BLOCK
      ?auto_54247 - BLOCK
      ?auto_54248 - BLOCK
      ?auto_54249 - BLOCK
    )
    :vars
    (
      ?auto_54250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54249 ?auto_54250 ) ( ON-TABLE ?auto_54243 ) ( not ( = ?auto_54243 ?auto_54244 ) ) ( not ( = ?auto_54243 ?auto_54245 ) ) ( not ( = ?auto_54243 ?auto_54246 ) ) ( not ( = ?auto_54243 ?auto_54247 ) ) ( not ( = ?auto_54243 ?auto_54248 ) ) ( not ( = ?auto_54243 ?auto_54249 ) ) ( not ( = ?auto_54243 ?auto_54250 ) ) ( not ( = ?auto_54244 ?auto_54245 ) ) ( not ( = ?auto_54244 ?auto_54246 ) ) ( not ( = ?auto_54244 ?auto_54247 ) ) ( not ( = ?auto_54244 ?auto_54248 ) ) ( not ( = ?auto_54244 ?auto_54249 ) ) ( not ( = ?auto_54244 ?auto_54250 ) ) ( not ( = ?auto_54245 ?auto_54246 ) ) ( not ( = ?auto_54245 ?auto_54247 ) ) ( not ( = ?auto_54245 ?auto_54248 ) ) ( not ( = ?auto_54245 ?auto_54249 ) ) ( not ( = ?auto_54245 ?auto_54250 ) ) ( not ( = ?auto_54246 ?auto_54247 ) ) ( not ( = ?auto_54246 ?auto_54248 ) ) ( not ( = ?auto_54246 ?auto_54249 ) ) ( not ( = ?auto_54246 ?auto_54250 ) ) ( not ( = ?auto_54247 ?auto_54248 ) ) ( not ( = ?auto_54247 ?auto_54249 ) ) ( not ( = ?auto_54247 ?auto_54250 ) ) ( not ( = ?auto_54248 ?auto_54249 ) ) ( not ( = ?auto_54248 ?auto_54250 ) ) ( not ( = ?auto_54249 ?auto_54250 ) ) ( ON ?auto_54248 ?auto_54249 ) ( ON ?auto_54247 ?auto_54248 ) ( ON ?auto_54246 ?auto_54247 ) ( ON ?auto_54245 ?auto_54246 ) ( CLEAR ?auto_54243 ) ( ON ?auto_54244 ?auto_54245 ) ( CLEAR ?auto_54244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54243 ?auto_54244 )
      ( MAKE-7PILE ?auto_54243 ?auto_54244 ?auto_54245 ?auto_54246 ?auto_54247 ?auto_54248 ?auto_54249 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54258 - BLOCK
      ?auto_54259 - BLOCK
      ?auto_54260 - BLOCK
      ?auto_54261 - BLOCK
      ?auto_54262 - BLOCK
      ?auto_54263 - BLOCK
      ?auto_54264 - BLOCK
    )
    :vars
    (
      ?auto_54265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54264 ?auto_54265 ) ( ON-TABLE ?auto_54258 ) ( not ( = ?auto_54258 ?auto_54259 ) ) ( not ( = ?auto_54258 ?auto_54260 ) ) ( not ( = ?auto_54258 ?auto_54261 ) ) ( not ( = ?auto_54258 ?auto_54262 ) ) ( not ( = ?auto_54258 ?auto_54263 ) ) ( not ( = ?auto_54258 ?auto_54264 ) ) ( not ( = ?auto_54258 ?auto_54265 ) ) ( not ( = ?auto_54259 ?auto_54260 ) ) ( not ( = ?auto_54259 ?auto_54261 ) ) ( not ( = ?auto_54259 ?auto_54262 ) ) ( not ( = ?auto_54259 ?auto_54263 ) ) ( not ( = ?auto_54259 ?auto_54264 ) ) ( not ( = ?auto_54259 ?auto_54265 ) ) ( not ( = ?auto_54260 ?auto_54261 ) ) ( not ( = ?auto_54260 ?auto_54262 ) ) ( not ( = ?auto_54260 ?auto_54263 ) ) ( not ( = ?auto_54260 ?auto_54264 ) ) ( not ( = ?auto_54260 ?auto_54265 ) ) ( not ( = ?auto_54261 ?auto_54262 ) ) ( not ( = ?auto_54261 ?auto_54263 ) ) ( not ( = ?auto_54261 ?auto_54264 ) ) ( not ( = ?auto_54261 ?auto_54265 ) ) ( not ( = ?auto_54262 ?auto_54263 ) ) ( not ( = ?auto_54262 ?auto_54264 ) ) ( not ( = ?auto_54262 ?auto_54265 ) ) ( not ( = ?auto_54263 ?auto_54264 ) ) ( not ( = ?auto_54263 ?auto_54265 ) ) ( not ( = ?auto_54264 ?auto_54265 ) ) ( ON ?auto_54263 ?auto_54264 ) ( ON ?auto_54262 ?auto_54263 ) ( ON ?auto_54261 ?auto_54262 ) ( ON ?auto_54260 ?auto_54261 ) ( CLEAR ?auto_54258 ) ( ON ?auto_54259 ?auto_54260 ) ( CLEAR ?auto_54259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54258 ?auto_54259 )
      ( MAKE-7PILE ?auto_54258 ?auto_54259 ?auto_54260 ?auto_54261 ?auto_54262 ?auto_54263 ?auto_54264 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54273 - BLOCK
      ?auto_54274 - BLOCK
      ?auto_54275 - BLOCK
      ?auto_54276 - BLOCK
      ?auto_54277 - BLOCK
      ?auto_54278 - BLOCK
      ?auto_54279 - BLOCK
    )
    :vars
    (
      ?auto_54280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54279 ?auto_54280 ) ( not ( = ?auto_54273 ?auto_54274 ) ) ( not ( = ?auto_54273 ?auto_54275 ) ) ( not ( = ?auto_54273 ?auto_54276 ) ) ( not ( = ?auto_54273 ?auto_54277 ) ) ( not ( = ?auto_54273 ?auto_54278 ) ) ( not ( = ?auto_54273 ?auto_54279 ) ) ( not ( = ?auto_54273 ?auto_54280 ) ) ( not ( = ?auto_54274 ?auto_54275 ) ) ( not ( = ?auto_54274 ?auto_54276 ) ) ( not ( = ?auto_54274 ?auto_54277 ) ) ( not ( = ?auto_54274 ?auto_54278 ) ) ( not ( = ?auto_54274 ?auto_54279 ) ) ( not ( = ?auto_54274 ?auto_54280 ) ) ( not ( = ?auto_54275 ?auto_54276 ) ) ( not ( = ?auto_54275 ?auto_54277 ) ) ( not ( = ?auto_54275 ?auto_54278 ) ) ( not ( = ?auto_54275 ?auto_54279 ) ) ( not ( = ?auto_54275 ?auto_54280 ) ) ( not ( = ?auto_54276 ?auto_54277 ) ) ( not ( = ?auto_54276 ?auto_54278 ) ) ( not ( = ?auto_54276 ?auto_54279 ) ) ( not ( = ?auto_54276 ?auto_54280 ) ) ( not ( = ?auto_54277 ?auto_54278 ) ) ( not ( = ?auto_54277 ?auto_54279 ) ) ( not ( = ?auto_54277 ?auto_54280 ) ) ( not ( = ?auto_54278 ?auto_54279 ) ) ( not ( = ?auto_54278 ?auto_54280 ) ) ( not ( = ?auto_54279 ?auto_54280 ) ) ( ON ?auto_54278 ?auto_54279 ) ( ON ?auto_54277 ?auto_54278 ) ( ON ?auto_54276 ?auto_54277 ) ( ON ?auto_54275 ?auto_54276 ) ( ON ?auto_54274 ?auto_54275 ) ( ON ?auto_54273 ?auto_54274 ) ( CLEAR ?auto_54273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54273 )
      ( MAKE-7PILE ?auto_54273 ?auto_54274 ?auto_54275 ?auto_54276 ?auto_54277 ?auto_54278 ?auto_54279 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_54288 - BLOCK
      ?auto_54289 - BLOCK
      ?auto_54290 - BLOCK
      ?auto_54291 - BLOCK
      ?auto_54292 - BLOCK
      ?auto_54293 - BLOCK
      ?auto_54294 - BLOCK
    )
    :vars
    (
      ?auto_54295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54294 ?auto_54295 ) ( not ( = ?auto_54288 ?auto_54289 ) ) ( not ( = ?auto_54288 ?auto_54290 ) ) ( not ( = ?auto_54288 ?auto_54291 ) ) ( not ( = ?auto_54288 ?auto_54292 ) ) ( not ( = ?auto_54288 ?auto_54293 ) ) ( not ( = ?auto_54288 ?auto_54294 ) ) ( not ( = ?auto_54288 ?auto_54295 ) ) ( not ( = ?auto_54289 ?auto_54290 ) ) ( not ( = ?auto_54289 ?auto_54291 ) ) ( not ( = ?auto_54289 ?auto_54292 ) ) ( not ( = ?auto_54289 ?auto_54293 ) ) ( not ( = ?auto_54289 ?auto_54294 ) ) ( not ( = ?auto_54289 ?auto_54295 ) ) ( not ( = ?auto_54290 ?auto_54291 ) ) ( not ( = ?auto_54290 ?auto_54292 ) ) ( not ( = ?auto_54290 ?auto_54293 ) ) ( not ( = ?auto_54290 ?auto_54294 ) ) ( not ( = ?auto_54290 ?auto_54295 ) ) ( not ( = ?auto_54291 ?auto_54292 ) ) ( not ( = ?auto_54291 ?auto_54293 ) ) ( not ( = ?auto_54291 ?auto_54294 ) ) ( not ( = ?auto_54291 ?auto_54295 ) ) ( not ( = ?auto_54292 ?auto_54293 ) ) ( not ( = ?auto_54292 ?auto_54294 ) ) ( not ( = ?auto_54292 ?auto_54295 ) ) ( not ( = ?auto_54293 ?auto_54294 ) ) ( not ( = ?auto_54293 ?auto_54295 ) ) ( not ( = ?auto_54294 ?auto_54295 ) ) ( ON ?auto_54293 ?auto_54294 ) ( ON ?auto_54292 ?auto_54293 ) ( ON ?auto_54291 ?auto_54292 ) ( ON ?auto_54290 ?auto_54291 ) ( ON ?auto_54289 ?auto_54290 ) ( ON ?auto_54288 ?auto_54289 ) ( CLEAR ?auto_54288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54288 )
      ( MAKE-7PILE ?auto_54288 ?auto_54289 ?auto_54290 ?auto_54291 ?auto_54292 ?auto_54293 ?auto_54294 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54304 - BLOCK
      ?auto_54305 - BLOCK
      ?auto_54306 - BLOCK
      ?auto_54307 - BLOCK
      ?auto_54308 - BLOCK
      ?auto_54309 - BLOCK
      ?auto_54310 - BLOCK
      ?auto_54311 - BLOCK
    )
    :vars
    (
      ?auto_54312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54310 ) ( ON ?auto_54311 ?auto_54312 ) ( CLEAR ?auto_54311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54304 ) ( ON ?auto_54305 ?auto_54304 ) ( ON ?auto_54306 ?auto_54305 ) ( ON ?auto_54307 ?auto_54306 ) ( ON ?auto_54308 ?auto_54307 ) ( ON ?auto_54309 ?auto_54308 ) ( ON ?auto_54310 ?auto_54309 ) ( not ( = ?auto_54304 ?auto_54305 ) ) ( not ( = ?auto_54304 ?auto_54306 ) ) ( not ( = ?auto_54304 ?auto_54307 ) ) ( not ( = ?auto_54304 ?auto_54308 ) ) ( not ( = ?auto_54304 ?auto_54309 ) ) ( not ( = ?auto_54304 ?auto_54310 ) ) ( not ( = ?auto_54304 ?auto_54311 ) ) ( not ( = ?auto_54304 ?auto_54312 ) ) ( not ( = ?auto_54305 ?auto_54306 ) ) ( not ( = ?auto_54305 ?auto_54307 ) ) ( not ( = ?auto_54305 ?auto_54308 ) ) ( not ( = ?auto_54305 ?auto_54309 ) ) ( not ( = ?auto_54305 ?auto_54310 ) ) ( not ( = ?auto_54305 ?auto_54311 ) ) ( not ( = ?auto_54305 ?auto_54312 ) ) ( not ( = ?auto_54306 ?auto_54307 ) ) ( not ( = ?auto_54306 ?auto_54308 ) ) ( not ( = ?auto_54306 ?auto_54309 ) ) ( not ( = ?auto_54306 ?auto_54310 ) ) ( not ( = ?auto_54306 ?auto_54311 ) ) ( not ( = ?auto_54306 ?auto_54312 ) ) ( not ( = ?auto_54307 ?auto_54308 ) ) ( not ( = ?auto_54307 ?auto_54309 ) ) ( not ( = ?auto_54307 ?auto_54310 ) ) ( not ( = ?auto_54307 ?auto_54311 ) ) ( not ( = ?auto_54307 ?auto_54312 ) ) ( not ( = ?auto_54308 ?auto_54309 ) ) ( not ( = ?auto_54308 ?auto_54310 ) ) ( not ( = ?auto_54308 ?auto_54311 ) ) ( not ( = ?auto_54308 ?auto_54312 ) ) ( not ( = ?auto_54309 ?auto_54310 ) ) ( not ( = ?auto_54309 ?auto_54311 ) ) ( not ( = ?auto_54309 ?auto_54312 ) ) ( not ( = ?auto_54310 ?auto_54311 ) ) ( not ( = ?auto_54310 ?auto_54312 ) ) ( not ( = ?auto_54311 ?auto_54312 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54311 ?auto_54312 )
      ( !STACK ?auto_54311 ?auto_54310 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54321 - BLOCK
      ?auto_54322 - BLOCK
      ?auto_54323 - BLOCK
      ?auto_54324 - BLOCK
      ?auto_54325 - BLOCK
      ?auto_54326 - BLOCK
      ?auto_54327 - BLOCK
      ?auto_54328 - BLOCK
    )
    :vars
    (
      ?auto_54329 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54327 ) ( ON ?auto_54328 ?auto_54329 ) ( CLEAR ?auto_54328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54321 ) ( ON ?auto_54322 ?auto_54321 ) ( ON ?auto_54323 ?auto_54322 ) ( ON ?auto_54324 ?auto_54323 ) ( ON ?auto_54325 ?auto_54324 ) ( ON ?auto_54326 ?auto_54325 ) ( ON ?auto_54327 ?auto_54326 ) ( not ( = ?auto_54321 ?auto_54322 ) ) ( not ( = ?auto_54321 ?auto_54323 ) ) ( not ( = ?auto_54321 ?auto_54324 ) ) ( not ( = ?auto_54321 ?auto_54325 ) ) ( not ( = ?auto_54321 ?auto_54326 ) ) ( not ( = ?auto_54321 ?auto_54327 ) ) ( not ( = ?auto_54321 ?auto_54328 ) ) ( not ( = ?auto_54321 ?auto_54329 ) ) ( not ( = ?auto_54322 ?auto_54323 ) ) ( not ( = ?auto_54322 ?auto_54324 ) ) ( not ( = ?auto_54322 ?auto_54325 ) ) ( not ( = ?auto_54322 ?auto_54326 ) ) ( not ( = ?auto_54322 ?auto_54327 ) ) ( not ( = ?auto_54322 ?auto_54328 ) ) ( not ( = ?auto_54322 ?auto_54329 ) ) ( not ( = ?auto_54323 ?auto_54324 ) ) ( not ( = ?auto_54323 ?auto_54325 ) ) ( not ( = ?auto_54323 ?auto_54326 ) ) ( not ( = ?auto_54323 ?auto_54327 ) ) ( not ( = ?auto_54323 ?auto_54328 ) ) ( not ( = ?auto_54323 ?auto_54329 ) ) ( not ( = ?auto_54324 ?auto_54325 ) ) ( not ( = ?auto_54324 ?auto_54326 ) ) ( not ( = ?auto_54324 ?auto_54327 ) ) ( not ( = ?auto_54324 ?auto_54328 ) ) ( not ( = ?auto_54324 ?auto_54329 ) ) ( not ( = ?auto_54325 ?auto_54326 ) ) ( not ( = ?auto_54325 ?auto_54327 ) ) ( not ( = ?auto_54325 ?auto_54328 ) ) ( not ( = ?auto_54325 ?auto_54329 ) ) ( not ( = ?auto_54326 ?auto_54327 ) ) ( not ( = ?auto_54326 ?auto_54328 ) ) ( not ( = ?auto_54326 ?auto_54329 ) ) ( not ( = ?auto_54327 ?auto_54328 ) ) ( not ( = ?auto_54327 ?auto_54329 ) ) ( not ( = ?auto_54328 ?auto_54329 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54328 ?auto_54329 )
      ( !STACK ?auto_54328 ?auto_54327 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54338 - BLOCK
      ?auto_54339 - BLOCK
      ?auto_54340 - BLOCK
      ?auto_54341 - BLOCK
      ?auto_54342 - BLOCK
      ?auto_54343 - BLOCK
      ?auto_54344 - BLOCK
      ?auto_54345 - BLOCK
    )
    :vars
    (
      ?auto_54346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54345 ?auto_54346 ) ( ON-TABLE ?auto_54338 ) ( ON ?auto_54339 ?auto_54338 ) ( ON ?auto_54340 ?auto_54339 ) ( ON ?auto_54341 ?auto_54340 ) ( ON ?auto_54342 ?auto_54341 ) ( ON ?auto_54343 ?auto_54342 ) ( not ( = ?auto_54338 ?auto_54339 ) ) ( not ( = ?auto_54338 ?auto_54340 ) ) ( not ( = ?auto_54338 ?auto_54341 ) ) ( not ( = ?auto_54338 ?auto_54342 ) ) ( not ( = ?auto_54338 ?auto_54343 ) ) ( not ( = ?auto_54338 ?auto_54344 ) ) ( not ( = ?auto_54338 ?auto_54345 ) ) ( not ( = ?auto_54338 ?auto_54346 ) ) ( not ( = ?auto_54339 ?auto_54340 ) ) ( not ( = ?auto_54339 ?auto_54341 ) ) ( not ( = ?auto_54339 ?auto_54342 ) ) ( not ( = ?auto_54339 ?auto_54343 ) ) ( not ( = ?auto_54339 ?auto_54344 ) ) ( not ( = ?auto_54339 ?auto_54345 ) ) ( not ( = ?auto_54339 ?auto_54346 ) ) ( not ( = ?auto_54340 ?auto_54341 ) ) ( not ( = ?auto_54340 ?auto_54342 ) ) ( not ( = ?auto_54340 ?auto_54343 ) ) ( not ( = ?auto_54340 ?auto_54344 ) ) ( not ( = ?auto_54340 ?auto_54345 ) ) ( not ( = ?auto_54340 ?auto_54346 ) ) ( not ( = ?auto_54341 ?auto_54342 ) ) ( not ( = ?auto_54341 ?auto_54343 ) ) ( not ( = ?auto_54341 ?auto_54344 ) ) ( not ( = ?auto_54341 ?auto_54345 ) ) ( not ( = ?auto_54341 ?auto_54346 ) ) ( not ( = ?auto_54342 ?auto_54343 ) ) ( not ( = ?auto_54342 ?auto_54344 ) ) ( not ( = ?auto_54342 ?auto_54345 ) ) ( not ( = ?auto_54342 ?auto_54346 ) ) ( not ( = ?auto_54343 ?auto_54344 ) ) ( not ( = ?auto_54343 ?auto_54345 ) ) ( not ( = ?auto_54343 ?auto_54346 ) ) ( not ( = ?auto_54344 ?auto_54345 ) ) ( not ( = ?auto_54344 ?auto_54346 ) ) ( not ( = ?auto_54345 ?auto_54346 ) ) ( CLEAR ?auto_54343 ) ( ON ?auto_54344 ?auto_54345 ) ( CLEAR ?auto_54344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_54338 ?auto_54339 ?auto_54340 ?auto_54341 ?auto_54342 ?auto_54343 ?auto_54344 )
      ( MAKE-8PILE ?auto_54338 ?auto_54339 ?auto_54340 ?auto_54341 ?auto_54342 ?auto_54343 ?auto_54344 ?auto_54345 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54355 - BLOCK
      ?auto_54356 - BLOCK
      ?auto_54357 - BLOCK
      ?auto_54358 - BLOCK
      ?auto_54359 - BLOCK
      ?auto_54360 - BLOCK
      ?auto_54361 - BLOCK
      ?auto_54362 - BLOCK
    )
    :vars
    (
      ?auto_54363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54362 ?auto_54363 ) ( ON-TABLE ?auto_54355 ) ( ON ?auto_54356 ?auto_54355 ) ( ON ?auto_54357 ?auto_54356 ) ( ON ?auto_54358 ?auto_54357 ) ( ON ?auto_54359 ?auto_54358 ) ( ON ?auto_54360 ?auto_54359 ) ( not ( = ?auto_54355 ?auto_54356 ) ) ( not ( = ?auto_54355 ?auto_54357 ) ) ( not ( = ?auto_54355 ?auto_54358 ) ) ( not ( = ?auto_54355 ?auto_54359 ) ) ( not ( = ?auto_54355 ?auto_54360 ) ) ( not ( = ?auto_54355 ?auto_54361 ) ) ( not ( = ?auto_54355 ?auto_54362 ) ) ( not ( = ?auto_54355 ?auto_54363 ) ) ( not ( = ?auto_54356 ?auto_54357 ) ) ( not ( = ?auto_54356 ?auto_54358 ) ) ( not ( = ?auto_54356 ?auto_54359 ) ) ( not ( = ?auto_54356 ?auto_54360 ) ) ( not ( = ?auto_54356 ?auto_54361 ) ) ( not ( = ?auto_54356 ?auto_54362 ) ) ( not ( = ?auto_54356 ?auto_54363 ) ) ( not ( = ?auto_54357 ?auto_54358 ) ) ( not ( = ?auto_54357 ?auto_54359 ) ) ( not ( = ?auto_54357 ?auto_54360 ) ) ( not ( = ?auto_54357 ?auto_54361 ) ) ( not ( = ?auto_54357 ?auto_54362 ) ) ( not ( = ?auto_54357 ?auto_54363 ) ) ( not ( = ?auto_54358 ?auto_54359 ) ) ( not ( = ?auto_54358 ?auto_54360 ) ) ( not ( = ?auto_54358 ?auto_54361 ) ) ( not ( = ?auto_54358 ?auto_54362 ) ) ( not ( = ?auto_54358 ?auto_54363 ) ) ( not ( = ?auto_54359 ?auto_54360 ) ) ( not ( = ?auto_54359 ?auto_54361 ) ) ( not ( = ?auto_54359 ?auto_54362 ) ) ( not ( = ?auto_54359 ?auto_54363 ) ) ( not ( = ?auto_54360 ?auto_54361 ) ) ( not ( = ?auto_54360 ?auto_54362 ) ) ( not ( = ?auto_54360 ?auto_54363 ) ) ( not ( = ?auto_54361 ?auto_54362 ) ) ( not ( = ?auto_54361 ?auto_54363 ) ) ( not ( = ?auto_54362 ?auto_54363 ) ) ( CLEAR ?auto_54360 ) ( ON ?auto_54361 ?auto_54362 ) ( CLEAR ?auto_54361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_54355 ?auto_54356 ?auto_54357 ?auto_54358 ?auto_54359 ?auto_54360 ?auto_54361 )
      ( MAKE-8PILE ?auto_54355 ?auto_54356 ?auto_54357 ?auto_54358 ?auto_54359 ?auto_54360 ?auto_54361 ?auto_54362 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54372 - BLOCK
      ?auto_54373 - BLOCK
      ?auto_54374 - BLOCK
      ?auto_54375 - BLOCK
      ?auto_54376 - BLOCK
      ?auto_54377 - BLOCK
      ?auto_54378 - BLOCK
      ?auto_54379 - BLOCK
    )
    :vars
    (
      ?auto_54380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54379 ?auto_54380 ) ( ON-TABLE ?auto_54372 ) ( ON ?auto_54373 ?auto_54372 ) ( ON ?auto_54374 ?auto_54373 ) ( ON ?auto_54375 ?auto_54374 ) ( ON ?auto_54376 ?auto_54375 ) ( not ( = ?auto_54372 ?auto_54373 ) ) ( not ( = ?auto_54372 ?auto_54374 ) ) ( not ( = ?auto_54372 ?auto_54375 ) ) ( not ( = ?auto_54372 ?auto_54376 ) ) ( not ( = ?auto_54372 ?auto_54377 ) ) ( not ( = ?auto_54372 ?auto_54378 ) ) ( not ( = ?auto_54372 ?auto_54379 ) ) ( not ( = ?auto_54372 ?auto_54380 ) ) ( not ( = ?auto_54373 ?auto_54374 ) ) ( not ( = ?auto_54373 ?auto_54375 ) ) ( not ( = ?auto_54373 ?auto_54376 ) ) ( not ( = ?auto_54373 ?auto_54377 ) ) ( not ( = ?auto_54373 ?auto_54378 ) ) ( not ( = ?auto_54373 ?auto_54379 ) ) ( not ( = ?auto_54373 ?auto_54380 ) ) ( not ( = ?auto_54374 ?auto_54375 ) ) ( not ( = ?auto_54374 ?auto_54376 ) ) ( not ( = ?auto_54374 ?auto_54377 ) ) ( not ( = ?auto_54374 ?auto_54378 ) ) ( not ( = ?auto_54374 ?auto_54379 ) ) ( not ( = ?auto_54374 ?auto_54380 ) ) ( not ( = ?auto_54375 ?auto_54376 ) ) ( not ( = ?auto_54375 ?auto_54377 ) ) ( not ( = ?auto_54375 ?auto_54378 ) ) ( not ( = ?auto_54375 ?auto_54379 ) ) ( not ( = ?auto_54375 ?auto_54380 ) ) ( not ( = ?auto_54376 ?auto_54377 ) ) ( not ( = ?auto_54376 ?auto_54378 ) ) ( not ( = ?auto_54376 ?auto_54379 ) ) ( not ( = ?auto_54376 ?auto_54380 ) ) ( not ( = ?auto_54377 ?auto_54378 ) ) ( not ( = ?auto_54377 ?auto_54379 ) ) ( not ( = ?auto_54377 ?auto_54380 ) ) ( not ( = ?auto_54378 ?auto_54379 ) ) ( not ( = ?auto_54378 ?auto_54380 ) ) ( not ( = ?auto_54379 ?auto_54380 ) ) ( ON ?auto_54378 ?auto_54379 ) ( CLEAR ?auto_54376 ) ( ON ?auto_54377 ?auto_54378 ) ( CLEAR ?auto_54377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54372 ?auto_54373 ?auto_54374 ?auto_54375 ?auto_54376 ?auto_54377 )
      ( MAKE-8PILE ?auto_54372 ?auto_54373 ?auto_54374 ?auto_54375 ?auto_54376 ?auto_54377 ?auto_54378 ?auto_54379 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54389 - BLOCK
      ?auto_54390 - BLOCK
      ?auto_54391 - BLOCK
      ?auto_54392 - BLOCK
      ?auto_54393 - BLOCK
      ?auto_54394 - BLOCK
      ?auto_54395 - BLOCK
      ?auto_54396 - BLOCK
    )
    :vars
    (
      ?auto_54397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54396 ?auto_54397 ) ( ON-TABLE ?auto_54389 ) ( ON ?auto_54390 ?auto_54389 ) ( ON ?auto_54391 ?auto_54390 ) ( ON ?auto_54392 ?auto_54391 ) ( ON ?auto_54393 ?auto_54392 ) ( not ( = ?auto_54389 ?auto_54390 ) ) ( not ( = ?auto_54389 ?auto_54391 ) ) ( not ( = ?auto_54389 ?auto_54392 ) ) ( not ( = ?auto_54389 ?auto_54393 ) ) ( not ( = ?auto_54389 ?auto_54394 ) ) ( not ( = ?auto_54389 ?auto_54395 ) ) ( not ( = ?auto_54389 ?auto_54396 ) ) ( not ( = ?auto_54389 ?auto_54397 ) ) ( not ( = ?auto_54390 ?auto_54391 ) ) ( not ( = ?auto_54390 ?auto_54392 ) ) ( not ( = ?auto_54390 ?auto_54393 ) ) ( not ( = ?auto_54390 ?auto_54394 ) ) ( not ( = ?auto_54390 ?auto_54395 ) ) ( not ( = ?auto_54390 ?auto_54396 ) ) ( not ( = ?auto_54390 ?auto_54397 ) ) ( not ( = ?auto_54391 ?auto_54392 ) ) ( not ( = ?auto_54391 ?auto_54393 ) ) ( not ( = ?auto_54391 ?auto_54394 ) ) ( not ( = ?auto_54391 ?auto_54395 ) ) ( not ( = ?auto_54391 ?auto_54396 ) ) ( not ( = ?auto_54391 ?auto_54397 ) ) ( not ( = ?auto_54392 ?auto_54393 ) ) ( not ( = ?auto_54392 ?auto_54394 ) ) ( not ( = ?auto_54392 ?auto_54395 ) ) ( not ( = ?auto_54392 ?auto_54396 ) ) ( not ( = ?auto_54392 ?auto_54397 ) ) ( not ( = ?auto_54393 ?auto_54394 ) ) ( not ( = ?auto_54393 ?auto_54395 ) ) ( not ( = ?auto_54393 ?auto_54396 ) ) ( not ( = ?auto_54393 ?auto_54397 ) ) ( not ( = ?auto_54394 ?auto_54395 ) ) ( not ( = ?auto_54394 ?auto_54396 ) ) ( not ( = ?auto_54394 ?auto_54397 ) ) ( not ( = ?auto_54395 ?auto_54396 ) ) ( not ( = ?auto_54395 ?auto_54397 ) ) ( not ( = ?auto_54396 ?auto_54397 ) ) ( ON ?auto_54395 ?auto_54396 ) ( CLEAR ?auto_54393 ) ( ON ?auto_54394 ?auto_54395 ) ( CLEAR ?auto_54394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54389 ?auto_54390 ?auto_54391 ?auto_54392 ?auto_54393 ?auto_54394 )
      ( MAKE-8PILE ?auto_54389 ?auto_54390 ?auto_54391 ?auto_54392 ?auto_54393 ?auto_54394 ?auto_54395 ?auto_54396 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54406 - BLOCK
      ?auto_54407 - BLOCK
      ?auto_54408 - BLOCK
      ?auto_54409 - BLOCK
      ?auto_54410 - BLOCK
      ?auto_54411 - BLOCK
      ?auto_54412 - BLOCK
      ?auto_54413 - BLOCK
    )
    :vars
    (
      ?auto_54414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54413 ?auto_54414 ) ( ON-TABLE ?auto_54406 ) ( ON ?auto_54407 ?auto_54406 ) ( ON ?auto_54408 ?auto_54407 ) ( ON ?auto_54409 ?auto_54408 ) ( not ( = ?auto_54406 ?auto_54407 ) ) ( not ( = ?auto_54406 ?auto_54408 ) ) ( not ( = ?auto_54406 ?auto_54409 ) ) ( not ( = ?auto_54406 ?auto_54410 ) ) ( not ( = ?auto_54406 ?auto_54411 ) ) ( not ( = ?auto_54406 ?auto_54412 ) ) ( not ( = ?auto_54406 ?auto_54413 ) ) ( not ( = ?auto_54406 ?auto_54414 ) ) ( not ( = ?auto_54407 ?auto_54408 ) ) ( not ( = ?auto_54407 ?auto_54409 ) ) ( not ( = ?auto_54407 ?auto_54410 ) ) ( not ( = ?auto_54407 ?auto_54411 ) ) ( not ( = ?auto_54407 ?auto_54412 ) ) ( not ( = ?auto_54407 ?auto_54413 ) ) ( not ( = ?auto_54407 ?auto_54414 ) ) ( not ( = ?auto_54408 ?auto_54409 ) ) ( not ( = ?auto_54408 ?auto_54410 ) ) ( not ( = ?auto_54408 ?auto_54411 ) ) ( not ( = ?auto_54408 ?auto_54412 ) ) ( not ( = ?auto_54408 ?auto_54413 ) ) ( not ( = ?auto_54408 ?auto_54414 ) ) ( not ( = ?auto_54409 ?auto_54410 ) ) ( not ( = ?auto_54409 ?auto_54411 ) ) ( not ( = ?auto_54409 ?auto_54412 ) ) ( not ( = ?auto_54409 ?auto_54413 ) ) ( not ( = ?auto_54409 ?auto_54414 ) ) ( not ( = ?auto_54410 ?auto_54411 ) ) ( not ( = ?auto_54410 ?auto_54412 ) ) ( not ( = ?auto_54410 ?auto_54413 ) ) ( not ( = ?auto_54410 ?auto_54414 ) ) ( not ( = ?auto_54411 ?auto_54412 ) ) ( not ( = ?auto_54411 ?auto_54413 ) ) ( not ( = ?auto_54411 ?auto_54414 ) ) ( not ( = ?auto_54412 ?auto_54413 ) ) ( not ( = ?auto_54412 ?auto_54414 ) ) ( not ( = ?auto_54413 ?auto_54414 ) ) ( ON ?auto_54412 ?auto_54413 ) ( ON ?auto_54411 ?auto_54412 ) ( CLEAR ?auto_54409 ) ( ON ?auto_54410 ?auto_54411 ) ( CLEAR ?auto_54410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54406 ?auto_54407 ?auto_54408 ?auto_54409 ?auto_54410 )
      ( MAKE-8PILE ?auto_54406 ?auto_54407 ?auto_54408 ?auto_54409 ?auto_54410 ?auto_54411 ?auto_54412 ?auto_54413 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54423 - BLOCK
      ?auto_54424 - BLOCK
      ?auto_54425 - BLOCK
      ?auto_54426 - BLOCK
      ?auto_54427 - BLOCK
      ?auto_54428 - BLOCK
      ?auto_54429 - BLOCK
      ?auto_54430 - BLOCK
    )
    :vars
    (
      ?auto_54431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54430 ?auto_54431 ) ( ON-TABLE ?auto_54423 ) ( ON ?auto_54424 ?auto_54423 ) ( ON ?auto_54425 ?auto_54424 ) ( ON ?auto_54426 ?auto_54425 ) ( not ( = ?auto_54423 ?auto_54424 ) ) ( not ( = ?auto_54423 ?auto_54425 ) ) ( not ( = ?auto_54423 ?auto_54426 ) ) ( not ( = ?auto_54423 ?auto_54427 ) ) ( not ( = ?auto_54423 ?auto_54428 ) ) ( not ( = ?auto_54423 ?auto_54429 ) ) ( not ( = ?auto_54423 ?auto_54430 ) ) ( not ( = ?auto_54423 ?auto_54431 ) ) ( not ( = ?auto_54424 ?auto_54425 ) ) ( not ( = ?auto_54424 ?auto_54426 ) ) ( not ( = ?auto_54424 ?auto_54427 ) ) ( not ( = ?auto_54424 ?auto_54428 ) ) ( not ( = ?auto_54424 ?auto_54429 ) ) ( not ( = ?auto_54424 ?auto_54430 ) ) ( not ( = ?auto_54424 ?auto_54431 ) ) ( not ( = ?auto_54425 ?auto_54426 ) ) ( not ( = ?auto_54425 ?auto_54427 ) ) ( not ( = ?auto_54425 ?auto_54428 ) ) ( not ( = ?auto_54425 ?auto_54429 ) ) ( not ( = ?auto_54425 ?auto_54430 ) ) ( not ( = ?auto_54425 ?auto_54431 ) ) ( not ( = ?auto_54426 ?auto_54427 ) ) ( not ( = ?auto_54426 ?auto_54428 ) ) ( not ( = ?auto_54426 ?auto_54429 ) ) ( not ( = ?auto_54426 ?auto_54430 ) ) ( not ( = ?auto_54426 ?auto_54431 ) ) ( not ( = ?auto_54427 ?auto_54428 ) ) ( not ( = ?auto_54427 ?auto_54429 ) ) ( not ( = ?auto_54427 ?auto_54430 ) ) ( not ( = ?auto_54427 ?auto_54431 ) ) ( not ( = ?auto_54428 ?auto_54429 ) ) ( not ( = ?auto_54428 ?auto_54430 ) ) ( not ( = ?auto_54428 ?auto_54431 ) ) ( not ( = ?auto_54429 ?auto_54430 ) ) ( not ( = ?auto_54429 ?auto_54431 ) ) ( not ( = ?auto_54430 ?auto_54431 ) ) ( ON ?auto_54429 ?auto_54430 ) ( ON ?auto_54428 ?auto_54429 ) ( CLEAR ?auto_54426 ) ( ON ?auto_54427 ?auto_54428 ) ( CLEAR ?auto_54427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54423 ?auto_54424 ?auto_54425 ?auto_54426 ?auto_54427 )
      ( MAKE-8PILE ?auto_54423 ?auto_54424 ?auto_54425 ?auto_54426 ?auto_54427 ?auto_54428 ?auto_54429 ?auto_54430 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54440 - BLOCK
      ?auto_54441 - BLOCK
      ?auto_54442 - BLOCK
      ?auto_54443 - BLOCK
      ?auto_54444 - BLOCK
      ?auto_54445 - BLOCK
      ?auto_54446 - BLOCK
      ?auto_54447 - BLOCK
    )
    :vars
    (
      ?auto_54448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54447 ?auto_54448 ) ( ON-TABLE ?auto_54440 ) ( ON ?auto_54441 ?auto_54440 ) ( ON ?auto_54442 ?auto_54441 ) ( not ( = ?auto_54440 ?auto_54441 ) ) ( not ( = ?auto_54440 ?auto_54442 ) ) ( not ( = ?auto_54440 ?auto_54443 ) ) ( not ( = ?auto_54440 ?auto_54444 ) ) ( not ( = ?auto_54440 ?auto_54445 ) ) ( not ( = ?auto_54440 ?auto_54446 ) ) ( not ( = ?auto_54440 ?auto_54447 ) ) ( not ( = ?auto_54440 ?auto_54448 ) ) ( not ( = ?auto_54441 ?auto_54442 ) ) ( not ( = ?auto_54441 ?auto_54443 ) ) ( not ( = ?auto_54441 ?auto_54444 ) ) ( not ( = ?auto_54441 ?auto_54445 ) ) ( not ( = ?auto_54441 ?auto_54446 ) ) ( not ( = ?auto_54441 ?auto_54447 ) ) ( not ( = ?auto_54441 ?auto_54448 ) ) ( not ( = ?auto_54442 ?auto_54443 ) ) ( not ( = ?auto_54442 ?auto_54444 ) ) ( not ( = ?auto_54442 ?auto_54445 ) ) ( not ( = ?auto_54442 ?auto_54446 ) ) ( not ( = ?auto_54442 ?auto_54447 ) ) ( not ( = ?auto_54442 ?auto_54448 ) ) ( not ( = ?auto_54443 ?auto_54444 ) ) ( not ( = ?auto_54443 ?auto_54445 ) ) ( not ( = ?auto_54443 ?auto_54446 ) ) ( not ( = ?auto_54443 ?auto_54447 ) ) ( not ( = ?auto_54443 ?auto_54448 ) ) ( not ( = ?auto_54444 ?auto_54445 ) ) ( not ( = ?auto_54444 ?auto_54446 ) ) ( not ( = ?auto_54444 ?auto_54447 ) ) ( not ( = ?auto_54444 ?auto_54448 ) ) ( not ( = ?auto_54445 ?auto_54446 ) ) ( not ( = ?auto_54445 ?auto_54447 ) ) ( not ( = ?auto_54445 ?auto_54448 ) ) ( not ( = ?auto_54446 ?auto_54447 ) ) ( not ( = ?auto_54446 ?auto_54448 ) ) ( not ( = ?auto_54447 ?auto_54448 ) ) ( ON ?auto_54446 ?auto_54447 ) ( ON ?auto_54445 ?auto_54446 ) ( ON ?auto_54444 ?auto_54445 ) ( CLEAR ?auto_54442 ) ( ON ?auto_54443 ?auto_54444 ) ( CLEAR ?auto_54443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54440 ?auto_54441 ?auto_54442 ?auto_54443 )
      ( MAKE-8PILE ?auto_54440 ?auto_54441 ?auto_54442 ?auto_54443 ?auto_54444 ?auto_54445 ?auto_54446 ?auto_54447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54457 - BLOCK
      ?auto_54458 - BLOCK
      ?auto_54459 - BLOCK
      ?auto_54460 - BLOCK
      ?auto_54461 - BLOCK
      ?auto_54462 - BLOCK
      ?auto_54463 - BLOCK
      ?auto_54464 - BLOCK
    )
    :vars
    (
      ?auto_54465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54464 ?auto_54465 ) ( ON-TABLE ?auto_54457 ) ( ON ?auto_54458 ?auto_54457 ) ( ON ?auto_54459 ?auto_54458 ) ( not ( = ?auto_54457 ?auto_54458 ) ) ( not ( = ?auto_54457 ?auto_54459 ) ) ( not ( = ?auto_54457 ?auto_54460 ) ) ( not ( = ?auto_54457 ?auto_54461 ) ) ( not ( = ?auto_54457 ?auto_54462 ) ) ( not ( = ?auto_54457 ?auto_54463 ) ) ( not ( = ?auto_54457 ?auto_54464 ) ) ( not ( = ?auto_54457 ?auto_54465 ) ) ( not ( = ?auto_54458 ?auto_54459 ) ) ( not ( = ?auto_54458 ?auto_54460 ) ) ( not ( = ?auto_54458 ?auto_54461 ) ) ( not ( = ?auto_54458 ?auto_54462 ) ) ( not ( = ?auto_54458 ?auto_54463 ) ) ( not ( = ?auto_54458 ?auto_54464 ) ) ( not ( = ?auto_54458 ?auto_54465 ) ) ( not ( = ?auto_54459 ?auto_54460 ) ) ( not ( = ?auto_54459 ?auto_54461 ) ) ( not ( = ?auto_54459 ?auto_54462 ) ) ( not ( = ?auto_54459 ?auto_54463 ) ) ( not ( = ?auto_54459 ?auto_54464 ) ) ( not ( = ?auto_54459 ?auto_54465 ) ) ( not ( = ?auto_54460 ?auto_54461 ) ) ( not ( = ?auto_54460 ?auto_54462 ) ) ( not ( = ?auto_54460 ?auto_54463 ) ) ( not ( = ?auto_54460 ?auto_54464 ) ) ( not ( = ?auto_54460 ?auto_54465 ) ) ( not ( = ?auto_54461 ?auto_54462 ) ) ( not ( = ?auto_54461 ?auto_54463 ) ) ( not ( = ?auto_54461 ?auto_54464 ) ) ( not ( = ?auto_54461 ?auto_54465 ) ) ( not ( = ?auto_54462 ?auto_54463 ) ) ( not ( = ?auto_54462 ?auto_54464 ) ) ( not ( = ?auto_54462 ?auto_54465 ) ) ( not ( = ?auto_54463 ?auto_54464 ) ) ( not ( = ?auto_54463 ?auto_54465 ) ) ( not ( = ?auto_54464 ?auto_54465 ) ) ( ON ?auto_54463 ?auto_54464 ) ( ON ?auto_54462 ?auto_54463 ) ( ON ?auto_54461 ?auto_54462 ) ( CLEAR ?auto_54459 ) ( ON ?auto_54460 ?auto_54461 ) ( CLEAR ?auto_54460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54457 ?auto_54458 ?auto_54459 ?auto_54460 )
      ( MAKE-8PILE ?auto_54457 ?auto_54458 ?auto_54459 ?auto_54460 ?auto_54461 ?auto_54462 ?auto_54463 ?auto_54464 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54474 - BLOCK
      ?auto_54475 - BLOCK
      ?auto_54476 - BLOCK
      ?auto_54477 - BLOCK
      ?auto_54478 - BLOCK
      ?auto_54479 - BLOCK
      ?auto_54480 - BLOCK
      ?auto_54481 - BLOCK
    )
    :vars
    (
      ?auto_54482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54481 ?auto_54482 ) ( ON-TABLE ?auto_54474 ) ( ON ?auto_54475 ?auto_54474 ) ( not ( = ?auto_54474 ?auto_54475 ) ) ( not ( = ?auto_54474 ?auto_54476 ) ) ( not ( = ?auto_54474 ?auto_54477 ) ) ( not ( = ?auto_54474 ?auto_54478 ) ) ( not ( = ?auto_54474 ?auto_54479 ) ) ( not ( = ?auto_54474 ?auto_54480 ) ) ( not ( = ?auto_54474 ?auto_54481 ) ) ( not ( = ?auto_54474 ?auto_54482 ) ) ( not ( = ?auto_54475 ?auto_54476 ) ) ( not ( = ?auto_54475 ?auto_54477 ) ) ( not ( = ?auto_54475 ?auto_54478 ) ) ( not ( = ?auto_54475 ?auto_54479 ) ) ( not ( = ?auto_54475 ?auto_54480 ) ) ( not ( = ?auto_54475 ?auto_54481 ) ) ( not ( = ?auto_54475 ?auto_54482 ) ) ( not ( = ?auto_54476 ?auto_54477 ) ) ( not ( = ?auto_54476 ?auto_54478 ) ) ( not ( = ?auto_54476 ?auto_54479 ) ) ( not ( = ?auto_54476 ?auto_54480 ) ) ( not ( = ?auto_54476 ?auto_54481 ) ) ( not ( = ?auto_54476 ?auto_54482 ) ) ( not ( = ?auto_54477 ?auto_54478 ) ) ( not ( = ?auto_54477 ?auto_54479 ) ) ( not ( = ?auto_54477 ?auto_54480 ) ) ( not ( = ?auto_54477 ?auto_54481 ) ) ( not ( = ?auto_54477 ?auto_54482 ) ) ( not ( = ?auto_54478 ?auto_54479 ) ) ( not ( = ?auto_54478 ?auto_54480 ) ) ( not ( = ?auto_54478 ?auto_54481 ) ) ( not ( = ?auto_54478 ?auto_54482 ) ) ( not ( = ?auto_54479 ?auto_54480 ) ) ( not ( = ?auto_54479 ?auto_54481 ) ) ( not ( = ?auto_54479 ?auto_54482 ) ) ( not ( = ?auto_54480 ?auto_54481 ) ) ( not ( = ?auto_54480 ?auto_54482 ) ) ( not ( = ?auto_54481 ?auto_54482 ) ) ( ON ?auto_54480 ?auto_54481 ) ( ON ?auto_54479 ?auto_54480 ) ( ON ?auto_54478 ?auto_54479 ) ( ON ?auto_54477 ?auto_54478 ) ( CLEAR ?auto_54475 ) ( ON ?auto_54476 ?auto_54477 ) ( CLEAR ?auto_54476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54474 ?auto_54475 ?auto_54476 )
      ( MAKE-8PILE ?auto_54474 ?auto_54475 ?auto_54476 ?auto_54477 ?auto_54478 ?auto_54479 ?auto_54480 ?auto_54481 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54491 - BLOCK
      ?auto_54492 - BLOCK
      ?auto_54493 - BLOCK
      ?auto_54494 - BLOCK
      ?auto_54495 - BLOCK
      ?auto_54496 - BLOCK
      ?auto_54497 - BLOCK
      ?auto_54498 - BLOCK
    )
    :vars
    (
      ?auto_54499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54498 ?auto_54499 ) ( ON-TABLE ?auto_54491 ) ( ON ?auto_54492 ?auto_54491 ) ( not ( = ?auto_54491 ?auto_54492 ) ) ( not ( = ?auto_54491 ?auto_54493 ) ) ( not ( = ?auto_54491 ?auto_54494 ) ) ( not ( = ?auto_54491 ?auto_54495 ) ) ( not ( = ?auto_54491 ?auto_54496 ) ) ( not ( = ?auto_54491 ?auto_54497 ) ) ( not ( = ?auto_54491 ?auto_54498 ) ) ( not ( = ?auto_54491 ?auto_54499 ) ) ( not ( = ?auto_54492 ?auto_54493 ) ) ( not ( = ?auto_54492 ?auto_54494 ) ) ( not ( = ?auto_54492 ?auto_54495 ) ) ( not ( = ?auto_54492 ?auto_54496 ) ) ( not ( = ?auto_54492 ?auto_54497 ) ) ( not ( = ?auto_54492 ?auto_54498 ) ) ( not ( = ?auto_54492 ?auto_54499 ) ) ( not ( = ?auto_54493 ?auto_54494 ) ) ( not ( = ?auto_54493 ?auto_54495 ) ) ( not ( = ?auto_54493 ?auto_54496 ) ) ( not ( = ?auto_54493 ?auto_54497 ) ) ( not ( = ?auto_54493 ?auto_54498 ) ) ( not ( = ?auto_54493 ?auto_54499 ) ) ( not ( = ?auto_54494 ?auto_54495 ) ) ( not ( = ?auto_54494 ?auto_54496 ) ) ( not ( = ?auto_54494 ?auto_54497 ) ) ( not ( = ?auto_54494 ?auto_54498 ) ) ( not ( = ?auto_54494 ?auto_54499 ) ) ( not ( = ?auto_54495 ?auto_54496 ) ) ( not ( = ?auto_54495 ?auto_54497 ) ) ( not ( = ?auto_54495 ?auto_54498 ) ) ( not ( = ?auto_54495 ?auto_54499 ) ) ( not ( = ?auto_54496 ?auto_54497 ) ) ( not ( = ?auto_54496 ?auto_54498 ) ) ( not ( = ?auto_54496 ?auto_54499 ) ) ( not ( = ?auto_54497 ?auto_54498 ) ) ( not ( = ?auto_54497 ?auto_54499 ) ) ( not ( = ?auto_54498 ?auto_54499 ) ) ( ON ?auto_54497 ?auto_54498 ) ( ON ?auto_54496 ?auto_54497 ) ( ON ?auto_54495 ?auto_54496 ) ( ON ?auto_54494 ?auto_54495 ) ( CLEAR ?auto_54492 ) ( ON ?auto_54493 ?auto_54494 ) ( CLEAR ?auto_54493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54491 ?auto_54492 ?auto_54493 )
      ( MAKE-8PILE ?auto_54491 ?auto_54492 ?auto_54493 ?auto_54494 ?auto_54495 ?auto_54496 ?auto_54497 ?auto_54498 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54508 - BLOCK
      ?auto_54509 - BLOCK
      ?auto_54510 - BLOCK
      ?auto_54511 - BLOCK
      ?auto_54512 - BLOCK
      ?auto_54513 - BLOCK
      ?auto_54514 - BLOCK
      ?auto_54515 - BLOCK
    )
    :vars
    (
      ?auto_54516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54515 ?auto_54516 ) ( ON-TABLE ?auto_54508 ) ( not ( = ?auto_54508 ?auto_54509 ) ) ( not ( = ?auto_54508 ?auto_54510 ) ) ( not ( = ?auto_54508 ?auto_54511 ) ) ( not ( = ?auto_54508 ?auto_54512 ) ) ( not ( = ?auto_54508 ?auto_54513 ) ) ( not ( = ?auto_54508 ?auto_54514 ) ) ( not ( = ?auto_54508 ?auto_54515 ) ) ( not ( = ?auto_54508 ?auto_54516 ) ) ( not ( = ?auto_54509 ?auto_54510 ) ) ( not ( = ?auto_54509 ?auto_54511 ) ) ( not ( = ?auto_54509 ?auto_54512 ) ) ( not ( = ?auto_54509 ?auto_54513 ) ) ( not ( = ?auto_54509 ?auto_54514 ) ) ( not ( = ?auto_54509 ?auto_54515 ) ) ( not ( = ?auto_54509 ?auto_54516 ) ) ( not ( = ?auto_54510 ?auto_54511 ) ) ( not ( = ?auto_54510 ?auto_54512 ) ) ( not ( = ?auto_54510 ?auto_54513 ) ) ( not ( = ?auto_54510 ?auto_54514 ) ) ( not ( = ?auto_54510 ?auto_54515 ) ) ( not ( = ?auto_54510 ?auto_54516 ) ) ( not ( = ?auto_54511 ?auto_54512 ) ) ( not ( = ?auto_54511 ?auto_54513 ) ) ( not ( = ?auto_54511 ?auto_54514 ) ) ( not ( = ?auto_54511 ?auto_54515 ) ) ( not ( = ?auto_54511 ?auto_54516 ) ) ( not ( = ?auto_54512 ?auto_54513 ) ) ( not ( = ?auto_54512 ?auto_54514 ) ) ( not ( = ?auto_54512 ?auto_54515 ) ) ( not ( = ?auto_54512 ?auto_54516 ) ) ( not ( = ?auto_54513 ?auto_54514 ) ) ( not ( = ?auto_54513 ?auto_54515 ) ) ( not ( = ?auto_54513 ?auto_54516 ) ) ( not ( = ?auto_54514 ?auto_54515 ) ) ( not ( = ?auto_54514 ?auto_54516 ) ) ( not ( = ?auto_54515 ?auto_54516 ) ) ( ON ?auto_54514 ?auto_54515 ) ( ON ?auto_54513 ?auto_54514 ) ( ON ?auto_54512 ?auto_54513 ) ( ON ?auto_54511 ?auto_54512 ) ( ON ?auto_54510 ?auto_54511 ) ( CLEAR ?auto_54508 ) ( ON ?auto_54509 ?auto_54510 ) ( CLEAR ?auto_54509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54508 ?auto_54509 )
      ( MAKE-8PILE ?auto_54508 ?auto_54509 ?auto_54510 ?auto_54511 ?auto_54512 ?auto_54513 ?auto_54514 ?auto_54515 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54525 - BLOCK
      ?auto_54526 - BLOCK
      ?auto_54527 - BLOCK
      ?auto_54528 - BLOCK
      ?auto_54529 - BLOCK
      ?auto_54530 - BLOCK
      ?auto_54531 - BLOCK
      ?auto_54532 - BLOCK
    )
    :vars
    (
      ?auto_54533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54532 ?auto_54533 ) ( ON-TABLE ?auto_54525 ) ( not ( = ?auto_54525 ?auto_54526 ) ) ( not ( = ?auto_54525 ?auto_54527 ) ) ( not ( = ?auto_54525 ?auto_54528 ) ) ( not ( = ?auto_54525 ?auto_54529 ) ) ( not ( = ?auto_54525 ?auto_54530 ) ) ( not ( = ?auto_54525 ?auto_54531 ) ) ( not ( = ?auto_54525 ?auto_54532 ) ) ( not ( = ?auto_54525 ?auto_54533 ) ) ( not ( = ?auto_54526 ?auto_54527 ) ) ( not ( = ?auto_54526 ?auto_54528 ) ) ( not ( = ?auto_54526 ?auto_54529 ) ) ( not ( = ?auto_54526 ?auto_54530 ) ) ( not ( = ?auto_54526 ?auto_54531 ) ) ( not ( = ?auto_54526 ?auto_54532 ) ) ( not ( = ?auto_54526 ?auto_54533 ) ) ( not ( = ?auto_54527 ?auto_54528 ) ) ( not ( = ?auto_54527 ?auto_54529 ) ) ( not ( = ?auto_54527 ?auto_54530 ) ) ( not ( = ?auto_54527 ?auto_54531 ) ) ( not ( = ?auto_54527 ?auto_54532 ) ) ( not ( = ?auto_54527 ?auto_54533 ) ) ( not ( = ?auto_54528 ?auto_54529 ) ) ( not ( = ?auto_54528 ?auto_54530 ) ) ( not ( = ?auto_54528 ?auto_54531 ) ) ( not ( = ?auto_54528 ?auto_54532 ) ) ( not ( = ?auto_54528 ?auto_54533 ) ) ( not ( = ?auto_54529 ?auto_54530 ) ) ( not ( = ?auto_54529 ?auto_54531 ) ) ( not ( = ?auto_54529 ?auto_54532 ) ) ( not ( = ?auto_54529 ?auto_54533 ) ) ( not ( = ?auto_54530 ?auto_54531 ) ) ( not ( = ?auto_54530 ?auto_54532 ) ) ( not ( = ?auto_54530 ?auto_54533 ) ) ( not ( = ?auto_54531 ?auto_54532 ) ) ( not ( = ?auto_54531 ?auto_54533 ) ) ( not ( = ?auto_54532 ?auto_54533 ) ) ( ON ?auto_54531 ?auto_54532 ) ( ON ?auto_54530 ?auto_54531 ) ( ON ?auto_54529 ?auto_54530 ) ( ON ?auto_54528 ?auto_54529 ) ( ON ?auto_54527 ?auto_54528 ) ( CLEAR ?auto_54525 ) ( ON ?auto_54526 ?auto_54527 ) ( CLEAR ?auto_54526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54525 ?auto_54526 )
      ( MAKE-8PILE ?auto_54525 ?auto_54526 ?auto_54527 ?auto_54528 ?auto_54529 ?auto_54530 ?auto_54531 ?auto_54532 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54542 - BLOCK
      ?auto_54543 - BLOCK
      ?auto_54544 - BLOCK
      ?auto_54545 - BLOCK
      ?auto_54546 - BLOCK
      ?auto_54547 - BLOCK
      ?auto_54548 - BLOCK
      ?auto_54549 - BLOCK
    )
    :vars
    (
      ?auto_54550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54549 ?auto_54550 ) ( not ( = ?auto_54542 ?auto_54543 ) ) ( not ( = ?auto_54542 ?auto_54544 ) ) ( not ( = ?auto_54542 ?auto_54545 ) ) ( not ( = ?auto_54542 ?auto_54546 ) ) ( not ( = ?auto_54542 ?auto_54547 ) ) ( not ( = ?auto_54542 ?auto_54548 ) ) ( not ( = ?auto_54542 ?auto_54549 ) ) ( not ( = ?auto_54542 ?auto_54550 ) ) ( not ( = ?auto_54543 ?auto_54544 ) ) ( not ( = ?auto_54543 ?auto_54545 ) ) ( not ( = ?auto_54543 ?auto_54546 ) ) ( not ( = ?auto_54543 ?auto_54547 ) ) ( not ( = ?auto_54543 ?auto_54548 ) ) ( not ( = ?auto_54543 ?auto_54549 ) ) ( not ( = ?auto_54543 ?auto_54550 ) ) ( not ( = ?auto_54544 ?auto_54545 ) ) ( not ( = ?auto_54544 ?auto_54546 ) ) ( not ( = ?auto_54544 ?auto_54547 ) ) ( not ( = ?auto_54544 ?auto_54548 ) ) ( not ( = ?auto_54544 ?auto_54549 ) ) ( not ( = ?auto_54544 ?auto_54550 ) ) ( not ( = ?auto_54545 ?auto_54546 ) ) ( not ( = ?auto_54545 ?auto_54547 ) ) ( not ( = ?auto_54545 ?auto_54548 ) ) ( not ( = ?auto_54545 ?auto_54549 ) ) ( not ( = ?auto_54545 ?auto_54550 ) ) ( not ( = ?auto_54546 ?auto_54547 ) ) ( not ( = ?auto_54546 ?auto_54548 ) ) ( not ( = ?auto_54546 ?auto_54549 ) ) ( not ( = ?auto_54546 ?auto_54550 ) ) ( not ( = ?auto_54547 ?auto_54548 ) ) ( not ( = ?auto_54547 ?auto_54549 ) ) ( not ( = ?auto_54547 ?auto_54550 ) ) ( not ( = ?auto_54548 ?auto_54549 ) ) ( not ( = ?auto_54548 ?auto_54550 ) ) ( not ( = ?auto_54549 ?auto_54550 ) ) ( ON ?auto_54548 ?auto_54549 ) ( ON ?auto_54547 ?auto_54548 ) ( ON ?auto_54546 ?auto_54547 ) ( ON ?auto_54545 ?auto_54546 ) ( ON ?auto_54544 ?auto_54545 ) ( ON ?auto_54543 ?auto_54544 ) ( ON ?auto_54542 ?auto_54543 ) ( CLEAR ?auto_54542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54542 )
      ( MAKE-8PILE ?auto_54542 ?auto_54543 ?auto_54544 ?auto_54545 ?auto_54546 ?auto_54547 ?auto_54548 ?auto_54549 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_54559 - BLOCK
      ?auto_54560 - BLOCK
      ?auto_54561 - BLOCK
      ?auto_54562 - BLOCK
      ?auto_54563 - BLOCK
      ?auto_54564 - BLOCK
      ?auto_54565 - BLOCK
      ?auto_54566 - BLOCK
    )
    :vars
    (
      ?auto_54567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54566 ?auto_54567 ) ( not ( = ?auto_54559 ?auto_54560 ) ) ( not ( = ?auto_54559 ?auto_54561 ) ) ( not ( = ?auto_54559 ?auto_54562 ) ) ( not ( = ?auto_54559 ?auto_54563 ) ) ( not ( = ?auto_54559 ?auto_54564 ) ) ( not ( = ?auto_54559 ?auto_54565 ) ) ( not ( = ?auto_54559 ?auto_54566 ) ) ( not ( = ?auto_54559 ?auto_54567 ) ) ( not ( = ?auto_54560 ?auto_54561 ) ) ( not ( = ?auto_54560 ?auto_54562 ) ) ( not ( = ?auto_54560 ?auto_54563 ) ) ( not ( = ?auto_54560 ?auto_54564 ) ) ( not ( = ?auto_54560 ?auto_54565 ) ) ( not ( = ?auto_54560 ?auto_54566 ) ) ( not ( = ?auto_54560 ?auto_54567 ) ) ( not ( = ?auto_54561 ?auto_54562 ) ) ( not ( = ?auto_54561 ?auto_54563 ) ) ( not ( = ?auto_54561 ?auto_54564 ) ) ( not ( = ?auto_54561 ?auto_54565 ) ) ( not ( = ?auto_54561 ?auto_54566 ) ) ( not ( = ?auto_54561 ?auto_54567 ) ) ( not ( = ?auto_54562 ?auto_54563 ) ) ( not ( = ?auto_54562 ?auto_54564 ) ) ( not ( = ?auto_54562 ?auto_54565 ) ) ( not ( = ?auto_54562 ?auto_54566 ) ) ( not ( = ?auto_54562 ?auto_54567 ) ) ( not ( = ?auto_54563 ?auto_54564 ) ) ( not ( = ?auto_54563 ?auto_54565 ) ) ( not ( = ?auto_54563 ?auto_54566 ) ) ( not ( = ?auto_54563 ?auto_54567 ) ) ( not ( = ?auto_54564 ?auto_54565 ) ) ( not ( = ?auto_54564 ?auto_54566 ) ) ( not ( = ?auto_54564 ?auto_54567 ) ) ( not ( = ?auto_54565 ?auto_54566 ) ) ( not ( = ?auto_54565 ?auto_54567 ) ) ( not ( = ?auto_54566 ?auto_54567 ) ) ( ON ?auto_54565 ?auto_54566 ) ( ON ?auto_54564 ?auto_54565 ) ( ON ?auto_54563 ?auto_54564 ) ( ON ?auto_54562 ?auto_54563 ) ( ON ?auto_54561 ?auto_54562 ) ( ON ?auto_54560 ?auto_54561 ) ( ON ?auto_54559 ?auto_54560 ) ( CLEAR ?auto_54559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54559 )
      ( MAKE-8PILE ?auto_54559 ?auto_54560 ?auto_54561 ?auto_54562 ?auto_54563 ?auto_54564 ?auto_54565 ?auto_54566 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54577 - BLOCK
      ?auto_54578 - BLOCK
      ?auto_54579 - BLOCK
      ?auto_54580 - BLOCK
      ?auto_54581 - BLOCK
      ?auto_54582 - BLOCK
      ?auto_54583 - BLOCK
      ?auto_54584 - BLOCK
      ?auto_54585 - BLOCK
    )
    :vars
    (
      ?auto_54586 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54584 ) ( ON ?auto_54585 ?auto_54586 ) ( CLEAR ?auto_54585 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54577 ) ( ON ?auto_54578 ?auto_54577 ) ( ON ?auto_54579 ?auto_54578 ) ( ON ?auto_54580 ?auto_54579 ) ( ON ?auto_54581 ?auto_54580 ) ( ON ?auto_54582 ?auto_54581 ) ( ON ?auto_54583 ?auto_54582 ) ( ON ?auto_54584 ?auto_54583 ) ( not ( = ?auto_54577 ?auto_54578 ) ) ( not ( = ?auto_54577 ?auto_54579 ) ) ( not ( = ?auto_54577 ?auto_54580 ) ) ( not ( = ?auto_54577 ?auto_54581 ) ) ( not ( = ?auto_54577 ?auto_54582 ) ) ( not ( = ?auto_54577 ?auto_54583 ) ) ( not ( = ?auto_54577 ?auto_54584 ) ) ( not ( = ?auto_54577 ?auto_54585 ) ) ( not ( = ?auto_54577 ?auto_54586 ) ) ( not ( = ?auto_54578 ?auto_54579 ) ) ( not ( = ?auto_54578 ?auto_54580 ) ) ( not ( = ?auto_54578 ?auto_54581 ) ) ( not ( = ?auto_54578 ?auto_54582 ) ) ( not ( = ?auto_54578 ?auto_54583 ) ) ( not ( = ?auto_54578 ?auto_54584 ) ) ( not ( = ?auto_54578 ?auto_54585 ) ) ( not ( = ?auto_54578 ?auto_54586 ) ) ( not ( = ?auto_54579 ?auto_54580 ) ) ( not ( = ?auto_54579 ?auto_54581 ) ) ( not ( = ?auto_54579 ?auto_54582 ) ) ( not ( = ?auto_54579 ?auto_54583 ) ) ( not ( = ?auto_54579 ?auto_54584 ) ) ( not ( = ?auto_54579 ?auto_54585 ) ) ( not ( = ?auto_54579 ?auto_54586 ) ) ( not ( = ?auto_54580 ?auto_54581 ) ) ( not ( = ?auto_54580 ?auto_54582 ) ) ( not ( = ?auto_54580 ?auto_54583 ) ) ( not ( = ?auto_54580 ?auto_54584 ) ) ( not ( = ?auto_54580 ?auto_54585 ) ) ( not ( = ?auto_54580 ?auto_54586 ) ) ( not ( = ?auto_54581 ?auto_54582 ) ) ( not ( = ?auto_54581 ?auto_54583 ) ) ( not ( = ?auto_54581 ?auto_54584 ) ) ( not ( = ?auto_54581 ?auto_54585 ) ) ( not ( = ?auto_54581 ?auto_54586 ) ) ( not ( = ?auto_54582 ?auto_54583 ) ) ( not ( = ?auto_54582 ?auto_54584 ) ) ( not ( = ?auto_54582 ?auto_54585 ) ) ( not ( = ?auto_54582 ?auto_54586 ) ) ( not ( = ?auto_54583 ?auto_54584 ) ) ( not ( = ?auto_54583 ?auto_54585 ) ) ( not ( = ?auto_54583 ?auto_54586 ) ) ( not ( = ?auto_54584 ?auto_54585 ) ) ( not ( = ?auto_54584 ?auto_54586 ) ) ( not ( = ?auto_54585 ?auto_54586 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_54585 ?auto_54586 )
      ( !STACK ?auto_54585 ?auto_54584 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54596 - BLOCK
      ?auto_54597 - BLOCK
      ?auto_54598 - BLOCK
      ?auto_54599 - BLOCK
      ?auto_54600 - BLOCK
      ?auto_54601 - BLOCK
      ?auto_54602 - BLOCK
      ?auto_54603 - BLOCK
      ?auto_54604 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_54603 ) ( ON-TABLE ?auto_54604 ) ( CLEAR ?auto_54604 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_54596 ) ( ON ?auto_54597 ?auto_54596 ) ( ON ?auto_54598 ?auto_54597 ) ( ON ?auto_54599 ?auto_54598 ) ( ON ?auto_54600 ?auto_54599 ) ( ON ?auto_54601 ?auto_54600 ) ( ON ?auto_54602 ?auto_54601 ) ( ON ?auto_54603 ?auto_54602 ) ( not ( = ?auto_54596 ?auto_54597 ) ) ( not ( = ?auto_54596 ?auto_54598 ) ) ( not ( = ?auto_54596 ?auto_54599 ) ) ( not ( = ?auto_54596 ?auto_54600 ) ) ( not ( = ?auto_54596 ?auto_54601 ) ) ( not ( = ?auto_54596 ?auto_54602 ) ) ( not ( = ?auto_54596 ?auto_54603 ) ) ( not ( = ?auto_54596 ?auto_54604 ) ) ( not ( = ?auto_54597 ?auto_54598 ) ) ( not ( = ?auto_54597 ?auto_54599 ) ) ( not ( = ?auto_54597 ?auto_54600 ) ) ( not ( = ?auto_54597 ?auto_54601 ) ) ( not ( = ?auto_54597 ?auto_54602 ) ) ( not ( = ?auto_54597 ?auto_54603 ) ) ( not ( = ?auto_54597 ?auto_54604 ) ) ( not ( = ?auto_54598 ?auto_54599 ) ) ( not ( = ?auto_54598 ?auto_54600 ) ) ( not ( = ?auto_54598 ?auto_54601 ) ) ( not ( = ?auto_54598 ?auto_54602 ) ) ( not ( = ?auto_54598 ?auto_54603 ) ) ( not ( = ?auto_54598 ?auto_54604 ) ) ( not ( = ?auto_54599 ?auto_54600 ) ) ( not ( = ?auto_54599 ?auto_54601 ) ) ( not ( = ?auto_54599 ?auto_54602 ) ) ( not ( = ?auto_54599 ?auto_54603 ) ) ( not ( = ?auto_54599 ?auto_54604 ) ) ( not ( = ?auto_54600 ?auto_54601 ) ) ( not ( = ?auto_54600 ?auto_54602 ) ) ( not ( = ?auto_54600 ?auto_54603 ) ) ( not ( = ?auto_54600 ?auto_54604 ) ) ( not ( = ?auto_54601 ?auto_54602 ) ) ( not ( = ?auto_54601 ?auto_54603 ) ) ( not ( = ?auto_54601 ?auto_54604 ) ) ( not ( = ?auto_54602 ?auto_54603 ) ) ( not ( = ?auto_54602 ?auto_54604 ) ) ( not ( = ?auto_54603 ?auto_54604 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_54604 )
      ( !STACK ?auto_54604 ?auto_54603 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54614 - BLOCK
      ?auto_54615 - BLOCK
      ?auto_54616 - BLOCK
      ?auto_54617 - BLOCK
      ?auto_54618 - BLOCK
      ?auto_54619 - BLOCK
      ?auto_54620 - BLOCK
      ?auto_54621 - BLOCK
      ?auto_54622 - BLOCK
    )
    :vars
    (
      ?auto_54623 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54622 ?auto_54623 ) ( ON-TABLE ?auto_54614 ) ( ON ?auto_54615 ?auto_54614 ) ( ON ?auto_54616 ?auto_54615 ) ( ON ?auto_54617 ?auto_54616 ) ( ON ?auto_54618 ?auto_54617 ) ( ON ?auto_54619 ?auto_54618 ) ( ON ?auto_54620 ?auto_54619 ) ( not ( = ?auto_54614 ?auto_54615 ) ) ( not ( = ?auto_54614 ?auto_54616 ) ) ( not ( = ?auto_54614 ?auto_54617 ) ) ( not ( = ?auto_54614 ?auto_54618 ) ) ( not ( = ?auto_54614 ?auto_54619 ) ) ( not ( = ?auto_54614 ?auto_54620 ) ) ( not ( = ?auto_54614 ?auto_54621 ) ) ( not ( = ?auto_54614 ?auto_54622 ) ) ( not ( = ?auto_54614 ?auto_54623 ) ) ( not ( = ?auto_54615 ?auto_54616 ) ) ( not ( = ?auto_54615 ?auto_54617 ) ) ( not ( = ?auto_54615 ?auto_54618 ) ) ( not ( = ?auto_54615 ?auto_54619 ) ) ( not ( = ?auto_54615 ?auto_54620 ) ) ( not ( = ?auto_54615 ?auto_54621 ) ) ( not ( = ?auto_54615 ?auto_54622 ) ) ( not ( = ?auto_54615 ?auto_54623 ) ) ( not ( = ?auto_54616 ?auto_54617 ) ) ( not ( = ?auto_54616 ?auto_54618 ) ) ( not ( = ?auto_54616 ?auto_54619 ) ) ( not ( = ?auto_54616 ?auto_54620 ) ) ( not ( = ?auto_54616 ?auto_54621 ) ) ( not ( = ?auto_54616 ?auto_54622 ) ) ( not ( = ?auto_54616 ?auto_54623 ) ) ( not ( = ?auto_54617 ?auto_54618 ) ) ( not ( = ?auto_54617 ?auto_54619 ) ) ( not ( = ?auto_54617 ?auto_54620 ) ) ( not ( = ?auto_54617 ?auto_54621 ) ) ( not ( = ?auto_54617 ?auto_54622 ) ) ( not ( = ?auto_54617 ?auto_54623 ) ) ( not ( = ?auto_54618 ?auto_54619 ) ) ( not ( = ?auto_54618 ?auto_54620 ) ) ( not ( = ?auto_54618 ?auto_54621 ) ) ( not ( = ?auto_54618 ?auto_54622 ) ) ( not ( = ?auto_54618 ?auto_54623 ) ) ( not ( = ?auto_54619 ?auto_54620 ) ) ( not ( = ?auto_54619 ?auto_54621 ) ) ( not ( = ?auto_54619 ?auto_54622 ) ) ( not ( = ?auto_54619 ?auto_54623 ) ) ( not ( = ?auto_54620 ?auto_54621 ) ) ( not ( = ?auto_54620 ?auto_54622 ) ) ( not ( = ?auto_54620 ?auto_54623 ) ) ( not ( = ?auto_54621 ?auto_54622 ) ) ( not ( = ?auto_54621 ?auto_54623 ) ) ( not ( = ?auto_54622 ?auto_54623 ) ) ( CLEAR ?auto_54620 ) ( ON ?auto_54621 ?auto_54622 ) ( CLEAR ?auto_54621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_54614 ?auto_54615 ?auto_54616 ?auto_54617 ?auto_54618 ?auto_54619 ?auto_54620 ?auto_54621 )
      ( MAKE-9PILE ?auto_54614 ?auto_54615 ?auto_54616 ?auto_54617 ?auto_54618 ?auto_54619 ?auto_54620 ?auto_54621 ?auto_54622 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54633 - BLOCK
      ?auto_54634 - BLOCK
      ?auto_54635 - BLOCK
      ?auto_54636 - BLOCK
      ?auto_54637 - BLOCK
      ?auto_54638 - BLOCK
      ?auto_54639 - BLOCK
      ?auto_54640 - BLOCK
      ?auto_54641 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54641 ) ( ON-TABLE ?auto_54633 ) ( ON ?auto_54634 ?auto_54633 ) ( ON ?auto_54635 ?auto_54634 ) ( ON ?auto_54636 ?auto_54635 ) ( ON ?auto_54637 ?auto_54636 ) ( ON ?auto_54638 ?auto_54637 ) ( ON ?auto_54639 ?auto_54638 ) ( not ( = ?auto_54633 ?auto_54634 ) ) ( not ( = ?auto_54633 ?auto_54635 ) ) ( not ( = ?auto_54633 ?auto_54636 ) ) ( not ( = ?auto_54633 ?auto_54637 ) ) ( not ( = ?auto_54633 ?auto_54638 ) ) ( not ( = ?auto_54633 ?auto_54639 ) ) ( not ( = ?auto_54633 ?auto_54640 ) ) ( not ( = ?auto_54633 ?auto_54641 ) ) ( not ( = ?auto_54634 ?auto_54635 ) ) ( not ( = ?auto_54634 ?auto_54636 ) ) ( not ( = ?auto_54634 ?auto_54637 ) ) ( not ( = ?auto_54634 ?auto_54638 ) ) ( not ( = ?auto_54634 ?auto_54639 ) ) ( not ( = ?auto_54634 ?auto_54640 ) ) ( not ( = ?auto_54634 ?auto_54641 ) ) ( not ( = ?auto_54635 ?auto_54636 ) ) ( not ( = ?auto_54635 ?auto_54637 ) ) ( not ( = ?auto_54635 ?auto_54638 ) ) ( not ( = ?auto_54635 ?auto_54639 ) ) ( not ( = ?auto_54635 ?auto_54640 ) ) ( not ( = ?auto_54635 ?auto_54641 ) ) ( not ( = ?auto_54636 ?auto_54637 ) ) ( not ( = ?auto_54636 ?auto_54638 ) ) ( not ( = ?auto_54636 ?auto_54639 ) ) ( not ( = ?auto_54636 ?auto_54640 ) ) ( not ( = ?auto_54636 ?auto_54641 ) ) ( not ( = ?auto_54637 ?auto_54638 ) ) ( not ( = ?auto_54637 ?auto_54639 ) ) ( not ( = ?auto_54637 ?auto_54640 ) ) ( not ( = ?auto_54637 ?auto_54641 ) ) ( not ( = ?auto_54638 ?auto_54639 ) ) ( not ( = ?auto_54638 ?auto_54640 ) ) ( not ( = ?auto_54638 ?auto_54641 ) ) ( not ( = ?auto_54639 ?auto_54640 ) ) ( not ( = ?auto_54639 ?auto_54641 ) ) ( not ( = ?auto_54640 ?auto_54641 ) ) ( CLEAR ?auto_54639 ) ( ON ?auto_54640 ?auto_54641 ) ( CLEAR ?auto_54640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_54633 ?auto_54634 ?auto_54635 ?auto_54636 ?auto_54637 ?auto_54638 ?auto_54639 ?auto_54640 )
      ( MAKE-9PILE ?auto_54633 ?auto_54634 ?auto_54635 ?auto_54636 ?auto_54637 ?auto_54638 ?auto_54639 ?auto_54640 ?auto_54641 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54651 - BLOCK
      ?auto_54652 - BLOCK
      ?auto_54653 - BLOCK
      ?auto_54654 - BLOCK
      ?auto_54655 - BLOCK
      ?auto_54656 - BLOCK
      ?auto_54657 - BLOCK
      ?auto_54658 - BLOCK
      ?auto_54659 - BLOCK
    )
    :vars
    (
      ?auto_54660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54659 ?auto_54660 ) ( ON-TABLE ?auto_54651 ) ( ON ?auto_54652 ?auto_54651 ) ( ON ?auto_54653 ?auto_54652 ) ( ON ?auto_54654 ?auto_54653 ) ( ON ?auto_54655 ?auto_54654 ) ( ON ?auto_54656 ?auto_54655 ) ( not ( = ?auto_54651 ?auto_54652 ) ) ( not ( = ?auto_54651 ?auto_54653 ) ) ( not ( = ?auto_54651 ?auto_54654 ) ) ( not ( = ?auto_54651 ?auto_54655 ) ) ( not ( = ?auto_54651 ?auto_54656 ) ) ( not ( = ?auto_54651 ?auto_54657 ) ) ( not ( = ?auto_54651 ?auto_54658 ) ) ( not ( = ?auto_54651 ?auto_54659 ) ) ( not ( = ?auto_54651 ?auto_54660 ) ) ( not ( = ?auto_54652 ?auto_54653 ) ) ( not ( = ?auto_54652 ?auto_54654 ) ) ( not ( = ?auto_54652 ?auto_54655 ) ) ( not ( = ?auto_54652 ?auto_54656 ) ) ( not ( = ?auto_54652 ?auto_54657 ) ) ( not ( = ?auto_54652 ?auto_54658 ) ) ( not ( = ?auto_54652 ?auto_54659 ) ) ( not ( = ?auto_54652 ?auto_54660 ) ) ( not ( = ?auto_54653 ?auto_54654 ) ) ( not ( = ?auto_54653 ?auto_54655 ) ) ( not ( = ?auto_54653 ?auto_54656 ) ) ( not ( = ?auto_54653 ?auto_54657 ) ) ( not ( = ?auto_54653 ?auto_54658 ) ) ( not ( = ?auto_54653 ?auto_54659 ) ) ( not ( = ?auto_54653 ?auto_54660 ) ) ( not ( = ?auto_54654 ?auto_54655 ) ) ( not ( = ?auto_54654 ?auto_54656 ) ) ( not ( = ?auto_54654 ?auto_54657 ) ) ( not ( = ?auto_54654 ?auto_54658 ) ) ( not ( = ?auto_54654 ?auto_54659 ) ) ( not ( = ?auto_54654 ?auto_54660 ) ) ( not ( = ?auto_54655 ?auto_54656 ) ) ( not ( = ?auto_54655 ?auto_54657 ) ) ( not ( = ?auto_54655 ?auto_54658 ) ) ( not ( = ?auto_54655 ?auto_54659 ) ) ( not ( = ?auto_54655 ?auto_54660 ) ) ( not ( = ?auto_54656 ?auto_54657 ) ) ( not ( = ?auto_54656 ?auto_54658 ) ) ( not ( = ?auto_54656 ?auto_54659 ) ) ( not ( = ?auto_54656 ?auto_54660 ) ) ( not ( = ?auto_54657 ?auto_54658 ) ) ( not ( = ?auto_54657 ?auto_54659 ) ) ( not ( = ?auto_54657 ?auto_54660 ) ) ( not ( = ?auto_54658 ?auto_54659 ) ) ( not ( = ?auto_54658 ?auto_54660 ) ) ( not ( = ?auto_54659 ?auto_54660 ) ) ( ON ?auto_54658 ?auto_54659 ) ( CLEAR ?auto_54656 ) ( ON ?auto_54657 ?auto_54658 ) ( CLEAR ?auto_54657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_54651 ?auto_54652 ?auto_54653 ?auto_54654 ?auto_54655 ?auto_54656 ?auto_54657 )
      ( MAKE-9PILE ?auto_54651 ?auto_54652 ?auto_54653 ?auto_54654 ?auto_54655 ?auto_54656 ?auto_54657 ?auto_54658 ?auto_54659 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54670 - BLOCK
      ?auto_54671 - BLOCK
      ?auto_54672 - BLOCK
      ?auto_54673 - BLOCK
      ?auto_54674 - BLOCK
      ?auto_54675 - BLOCK
      ?auto_54676 - BLOCK
      ?auto_54677 - BLOCK
      ?auto_54678 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54678 ) ( ON-TABLE ?auto_54670 ) ( ON ?auto_54671 ?auto_54670 ) ( ON ?auto_54672 ?auto_54671 ) ( ON ?auto_54673 ?auto_54672 ) ( ON ?auto_54674 ?auto_54673 ) ( ON ?auto_54675 ?auto_54674 ) ( not ( = ?auto_54670 ?auto_54671 ) ) ( not ( = ?auto_54670 ?auto_54672 ) ) ( not ( = ?auto_54670 ?auto_54673 ) ) ( not ( = ?auto_54670 ?auto_54674 ) ) ( not ( = ?auto_54670 ?auto_54675 ) ) ( not ( = ?auto_54670 ?auto_54676 ) ) ( not ( = ?auto_54670 ?auto_54677 ) ) ( not ( = ?auto_54670 ?auto_54678 ) ) ( not ( = ?auto_54671 ?auto_54672 ) ) ( not ( = ?auto_54671 ?auto_54673 ) ) ( not ( = ?auto_54671 ?auto_54674 ) ) ( not ( = ?auto_54671 ?auto_54675 ) ) ( not ( = ?auto_54671 ?auto_54676 ) ) ( not ( = ?auto_54671 ?auto_54677 ) ) ( not ( = ?auto_54671 ?auto_54678 ) ) ( not ( = ?auto_54672 ?auto_54673 ) ) ( not ( = ?auto_54672 ?auto_54674 ) ) ( not ( = ?auto_54672 ?auto_54675 ) ) ( not ( = ?auto_54672 ?auto_54676 ) ) ( not ( = ?auto_54672 ?auto_54677 ) ) ( not ( = ?auto_54672 ?auto_54678 ) ) ( not ( = ?auto_54673 ?auto_54674 ) ) ( not ( = ?auto_54673 ?auto_54675 ) ) ( not ( = ?auto_54673 ?auto_54676 ) ) ( not ( = ?auto_54673 ?auto_54677 ) ) ( not ( = ?auto_54673 ?auto_54678 ) ) ( not ( = ?auto_54674 ?auto_54675 ) ) ( not ( = ?auto_54674 ?auto_54676 ) ) ( not ( = ?auto_54674 ?auto_54677 ) ) ( not ( = ?auto_54674 ?auto_54678 ) ) ( not ( = ?auto_54675 ?auto_54676 ) ) ( not ( = ?auto_54675 ?auto_54677 ) ) ( not ( = ?auto_54675 ?auto_54678 ) ) ( not ( = ?auto_54676 ?auto_54677 ) ) ( not ( = ?auto_54676 ?auto_54678 ) ) ( not ( = ?auto_54677 ?auto_54678 ) ) ( ON ?auto_54677 ?auto_54678 ) ( CLEAR ?auto_54675 ) ( ON ?auto_54676 ?auto_54677 ) ( CLEAR ?auto_54676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_54670 ?auto_54671 ?auto_54672 ?auto_54673 ?auto_54674 ?auto_54675 ?auto_54676 )
      ( MAKE-9PILE ?auto_54670 ?auto_54671 ?auto_54672 ?auto_54673 ?auto_54674 ?auto_54675 ?auto_54676 ?auto_54677 ?auto_54678 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54688 - BLOCK
      ?auto_54689 - BLOCK
      ?auto_54690 - BLOCK
      ?auto_54691 - BLOCK
      ?auto_54692 - BLOCK
      ?auto_54693 - BLOCK
      ?auto_54694 - BLOCK
      ?auto_54695 - BLOCK
      ?auto_54696 - BLOCK
    )
    :vars
    (
      ?auto_54697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54696 ?auto_54697 ) ( ON-TABLE ?auto_54688 ) ( ON ?auto_54689 ?auto_54688 ) ( ON ?auto_54690 ?auto_54689 ) ( ON ?auto_54691 ?auto_54690 ) ( ON ?auto_54692 ?auto_54691 ) ( not ( = ?auto_54688 ?auto_54689 ) ) ( not ( = ?auto_54688 ?auto_54690 ) ) ( not ( = ?auto_54688 ?auto_54691 ) ) ( not ( = ?auto_54688 ?auto_54692 ) ) ( not ( = ?auto_54688 ?auto_54693 ) ) ( not ( = ?auto_54688 ?auto_54694 ) ) ( not ( = ?auto_54688 ?auto_54695 ) ) ( not ( = ?auto_54688 ?auto_54696 ) ) ( not ( = ?auto_54688 ?auto_54697 ) ) ( not ( = ?auto_54689 ?auto_54690 ) ) ( not ( = ?auto_54689 ?auto_54691 ) ) ( not ( = ?auto_54689 ?auto_54692 ) ) ( not ( = ?auto_54689 ?auto_54693 ) ) ( not ( = ?auto_54689 ?auto_54694 ) ) ( not ( = ?auto_54689 ?auto_54695 ) ) ( not ( = ?auto_54689 ?auto_54696 ) ) ( not ( = ?auto_54689 ?auto_54697 ) ) ( not ( = ?auto_54690 ?auto_54691 ) ) ( not ( = ?auto_54690 ?auto_54692 ) ) ( not ( = ?auto_54690 ?auto_54693 ) ) ( not ( = ?auto_54690 ?auto_54694 ) ) ( not ( = ?auto_54690 ?auto_54695 ) ) ( not ( = ?auto_54690 ?auto_54696 ) ) ( not ( = ?auto_54690 ?auto_54697 ) ) ( not ( = ?auto_54691 ?auto_54692 ) ) ( not ( = ?auto_54691 ?auto_54693 ) ) ( not ( = ?auto_54691 ?auto_54694 ) ) ( not ( = ?auto_54691 ?auto_54695 ) ) ( not ( = ?auto_54691 ?auto_54696 ) ) ( not ( = ?auto_54691 ?auto_54697 ) ) ( not ( = ?auto_54692 ?auto_54693 ) ) ( not ( = ?auto_54692 ?auto_54694 ) ) ( not ( = ?auto_54692 ?auto_54695 ) ) ( not ( = ?auto_54692 ?auto_54696 ) ) ( not ( = ?auto_54692 ?auto_54697 ) ) ( not ( = ?auto_54693 ?auto_54694 ) ) ( not ( = ?auto_54693 ?auto_54695 ) ) ( not ( = ?auto_54693 ?auto_54696 ) ) ( not ( = ?auto_54693 ?auto_54697 ) ) ( not ( = ?auto_54694 ?auto_54695 ) ) ( not ( = ?auto_54694 ?auto_54696 ) ) ( not ( = ?auto_54694 ?auto_54697 ) ) ( not ( = ?auto_54695 ?auto_54696 ) ) ( not ( = ?auto_54695 ?auto_54697 ) ) ( not ( = ?auto_54696 ?auto_54697 ) ) ( ON ?auto_54695 ?auto_54696 ) ( ON ?auto_54694 ?auto_54695 ) ( CLEAR ?auto_54692 ) ( ON ?auto_54693 ?auto_54694 ) ( CLEAR ?auto_54693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54688 ?auto_54689 ?auto_54690 ?auto_54691 ?auto_54692 ?auto_54693 )
      ( MAKE-9PILE ?auto_54688 ?auto_54689 ?auto_54690 ?auto_54691 ?auto_54692 ?auto_54693 ?auto_54694 ?auto_54695 ?auto_54696 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54707 - BLOCK
      ?auto_54708 - BLOCK
      ?auto_54709 - BLOCK
      ?auto_54710 - BLOCK
      ?auto_54711 - BLOCK
      ?auto_54712 - BLOCK
      ?auto_54713 - BLOCK
      ?auto_54714 - BLOCK
      ?auto_54715 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54715 ) ( ON-TABLE ?auto_54707 ) ( ON ?auto_54708 ?auto_54707 ) ( ON ?auto_54709 ?auto_54708 ) ( ON ?auto_54710 ?auto_54709 ) ( ON ?auto_54711 ?auto_54710 ) ( not ( = ?auto_54707 ?auto_54708 ) ) ( not ( = ?auto_54707 ?auto_54709 ) ) ( not ( = ?auto_54707 ?auto_54710 ) ) ( not ( = ?auto_54707 ?auto_54711 ) ) ( not ( = ?auto_54707 ?auto_54712 ) ) ( not ( = ?auto_54707 ?auto_54713 ) ) ( not ( = ?auto_54707 ?auto_54714 ) ) ( not ( = ?auto_54707 ?auto_54715 ) ) ( not ( = ?auto_54708 ?auto_54709 ) ) ( not ( = ?auto_54708 ?auto_54710 ) ) ( not ( = ?auto_54708 ?auto_54711 ) ) ( not ( = ?auto_54708 ?auto_54712 ) ) ( not ( = ?auto_54708 ?auto_54713 ) ) ( not ( = ?auto_54708 ?auto_54714 ) ) ( not ( = ?auto_54708 ?auto_54715 ) ) ( not ( = ?auto_54709 ?auto_54710 ) ) ( not ( = ?auto_54709 ?auto_54711 ) ) ( not ( = ?auto_54709 ?auto_54712 ) ) ( not ( = ?auto_54709 ?auto_54713 ) ) ( not ( = ?auto_54709 ?auto_54714 ) ) ( not ( = ?auto_54709 ?auto_54715 ) ) ( not ( = ?auto_54710 ?auto_54711 ) ) ( not ( = ?auto_54710 ?auto_54712 ) ) ( not ( = ?auto_54710 ?auto_54713 ) ) ( not ( = ?auto_54710 ?auto_54714 ) ) ( not ( = ?auto_54710 ?auto_54715 ) ) ( not ( = ?auto_54711 ?auto_54712 ) ) ( not ( = ?auto_54711 ?auto_54713 ) ) ( not ( = ?auto_54711 ?auto_54714 ) ) ( not ( = ?auto_54711 ?auto_54715 ) ) ( not ( = ?auto_54712 ?auto_54713 ) ) ( not ( = ?auto_54712 ?auto_54714 ) ) ( not ( = ?auto_54712 ?auto_54715 ) ) ( not ( = ?auto_54713 ?auto_54714 ) ) ( not ( = ?auto_54713 ?auto_54715 ) ) ( not ( = ?auto_54714 ?auto_54715 ) ) ( ON ?auto_54714 ?auto_54715 ) ( ON ?auto_54713 ?auto_54714 ) ( CLEAR ?auto_54711 ) ( ON ?auto_54712 ?auto_54713 ) ( CLEAR ?auto_54712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_54707 ?auto_54708 ?auto_54709 ?auto_54710 ?auto_54711 ?auto_54712 )
      ( MAKE-9PILE ?auto_54707 ?auto_54708 ?auto_54709 ?auto_54710 ?auto_54711 ?auto_54712 ?auto_54713 ?auto_54714 ?auto_54715 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54725 - BLOCK
      ?auto_54726 - BLOCK
      ?auto_54727 - BLOCK
      ?auto_54728 - BLOCK
      ?auto_54729 - BLOCK
      ?auto_54730 - BLOCK
      ?auto_54731 - BLOCK
      ?auto_54732 - BLOCK
      ?auto_54733 - BLOCK
    )
    :vars
    (
      ?auto_54734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54733 ?auto_54734 ) ( ON-TABLE ?auto_54725 ) ( ON ?auto_54726 ?auto_54725 ) ( ON ?auto_54727 ?auto_54726 ) ( ON ?auto_54728 ?auto_54727 ) ( not ( = ?auto_54725 ?auto_54726 ) ) ( not ( = ?auto_54725 ?auto_54727 ) ) ( not ( = ?auto_54725 ?auto_54728 ) ) ( not ( = ?auto_54725 ?auto_54729 ) ) ( not ( = ?auto_54725 ?auto_54730 ) ) ( not ( = ?auto_54725 ?auto_54731 ) ) ( not ( = ?auto_54725 ?auto_54732 ) ) ( not ( = ?auto_54725 ?auto_54733 ) ) ( not ( = ?auto_54725 ?auto_54734 ) ) ( not ( = ?auto_54726 ?auto_54727 ) ) ( not ( = ?auto_54726 ?auto_54728 ) ) ( not ( = ?auto_54726 ?auto_54729 ) ) ( not ( = ?auto_54726 ?auto_54730 ) ) ( not ( = ?auto_54726 ?auto_54731 ) ) ( not ( = ?auto_54726 ?auto_54732 ) ) ( not ( = ?auto_54726 ?auto_54733 ) ) ( not ( = ?auto_54726 ?auto_54734 ) ) ( not ( = ?auto_54727 ?auto_54728 ) ) ( not ( = ?auto_54727 ?auto_54729 ) ) ( not ( = ?auto_54727 ?auto_54730 ) ) ( not ( = ?auto_54727 ?auto_54731 ) ) ( not ( = ?auto_54727 ?auto_54732 ) ) ( not ( = ?auto_54727 ?auto_54733 ) ) ( not ( = ?auto_54727 ?auto_54734 ) ) ( not ( = ?auto_54728 ?auto_54729 ) ) ( not ( = ?auto_54728 ?auto_54730 ) ) ( not ( = ?auto_54728 ?auto_54731 ) ) ( not ( = ?auto_54728 ?auto_54732 ) ) ( not ( = ?auto_54728 ?auto_54733 ) ) ( not ( = ?auto_54728 ?auto_54734 ) ) ( not ( = ?auto_54729 ?auto_54730 ) ) ( not ( = ?auto_54729 ?auto_54731 ) ) ( not ( = ?auto_54729 ?auto_54732 ) ) ( not ( = ?auto_54729 ?auto_54733 ) ) ( not ( = ?auto_54729 ?auto_54734 ) ) ( not ( = ?auto_54730 ?auto_54731 ) ) ( not ( = ?auto_54730 ?auto_54732 ) ) ( not ( = ?auto_54730 ?auto_54733 ) ) ( not ( = ?auto_54730 ?auto_54734 ) ) ( not ( = ?auto_54731 ?auto_54732 ) ) ( not ( = ?auto_54731 ?auto_54733 ) ) ( not ( = ?auto_54731 ?auto_54734 ) ) ( not ( = ?auto_54732 ?auto_54733 ) ) ( not ( = ?auto_54732 ?auto_54734 ) ) ( not ( = ?auto_54733 ?auto_54734 ) ) ( ON ?auto_54732 ?auto_54733 ) ( ON ?auto_54731 ?auto_54732 ) ( ON ?auto_54730 ?auto_54731 ) ( CLEAR ?auto_54728 ) ( ON ?auto_54729 ?auto_54730 ) ( CLEAR ?auto_54729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54725 ?auto_54726 ?auto_54727 ?auto_54728 ?auto_54729 )
      ( MAKE-9PILE ?auto_54725 ?auto_54726 ?auto_54727 ?auto_54728 ?auto_54729 ?auto_54730 ?auto_54731 ?auto_54732 ?auto_54733 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54744 - BLOCK
      ?auto_54745 - BLOCK
      ?auto_54746 - BLOCK
      ?auto_54747 - BLOCK
      ?auto_54748 - BLOCK
      ?auto_54749 - BLOCK
      ?auto_54750 - BLOCK
      ?auto_54751 - BLOCK
      ?auto_54752 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54752 ) ( ON-TABLE ?auto_54744 ) ( ON ?auto_54745 ?auto_54744 ) ( ON ?auto_54746 ?auto_54745 ) ( ON ?auto_54747 ?auto_54746 ) ( not ( = ?auto_54744 ?auto_54745 ) ) ( not ( = ?auto_54744 ?auto_54746 ) ) ( not ( = ?auto_54744 ?auto_54747 ) ) ( not ( = ?auto_54744 ?auto_54748 ) ) ( not ( = ?auto_54744 ?auto_54749 ) ) ( not ( = ?auto_54744 ?auto_54750 ) ) ( not ( = ?auto_54744 ?auto_54751 ) ) ( not ( = ?auto_54744 ?auto_54752 ) ) ( not ( = ?auto_54745 ?auto_54746 ) ) ( not ( = ?auto_54745 ?auto_54747 ) ) ( not ( = ?auto_54745 ?auto_54748 ) ) ( not ( = ?auto_54745 ?auto_54749 ) ) ( not ( = ?auto_54745 ?auto_54750 ) ) ( not ( = ?auto_54745 ?auto_54751 ) ) ( not ( = ?auto_54745 ?auto_54752 ) ) ( not ( = ?auto_54746 ?auto_54747 ) ) ( not ( = ?auto_54746 ?auto_54748 ) ) ( not ( = ?auto_54746 ?auto_54749 ) ) ( not ( = ?auto_54746 ?auto_54750 ) ) ( not ( = ?auto_54746 ?auto_54751 ) ) ( not ( = ?auto_54746 ?auto_54752 ) ) ( not ( = ?auto_54747 ?auto_54748 ) ) ( not ( = ?auto_54747 ?auto_54749 ) ) ( not ( = ?auto_54747 ?auto_54750 ) ) ( not ( = ?auto_54747 ?auto_54751 ) ) ( not ( = ?auto_54747 ?auto_54752 ) ) ( not ( = ?auto_54748 ?auto_54749 ) ) ( not ( = ?auto_54748 ?auto_54750 ) ) ( not ( = ?auto_54748 ?auto_54751 ) ) ( not ( = ?auto_54748 ?auto_54752 ) ) ( not ( = ?auto_54749 ?auto_54750 ) ) ( not ( = ?auto_54749 ?auto_54751 ) ) ( not ( = ?auto_54749 ?auto_54752 ) ) ( not ( = ?auto_54750 ?auto_54751 ) ) ( not ( = ?auto_54750 ?auto_54752 ) ) ( not ( = ?auto_54751 ?auto_54752 ) ) ( ON ?auto_54751 ?auto_54752 ) ( ON ?auto_54750 ?auto_54751 ) ( ON ?auto_54749 ?auto_54750 ) ( CLEAR ?auto_54747 ) ( ON ?auto_54748 ?auto_54749 ) ( CLEAR ?auto_54748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_54744 ?auto_54745 ?auto_54746 ?auto_54747 ?auto_54748 )
      ( MAKE-9PILE ?auto_54744 ?auto_54745 ?auto_54746 ?auto_54747 ?auto_54748 ?auto_54749 ?auto_54750 ?auto_54751 ?auto_54752 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54762 - BLOCK
      ?auto_54763 - BLOCK
      ?auto_54764 - BLOCK
      ?auto_54765 - BLOCK
      ?auto_54766 - BLOCK
      ?auto_54767 - BLOCK
      ?auto_54768 - BLOCK
      ?auto_54769 - BLOCK
      ?auto_54770 - BLOCK
    )
    :vars
    (
      ?auto_54771 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54770 ?auto_54771 ) ( ON-TABLE ?auto_54762 ) ( ON ?auto_54763 ?auto_54762 ) ( ON ?auto_54764 ?auto_54763 ) ( not ( = ?auto_54762 ?auto_54763 ) ) ( not ( = ?auto_54762 ?auto_54764 ) ) ( not ( = ?auto_54762 ?auto_54765 ) ) ( not ( = ?auto_54762 ?auto_54766 ) ) ( not ( = ?auto_54762 ?auto_54767 ) ) ( not ( = ?auto_54762 ?auto_54768 ) ) ( not ( = ?auto_54762 ?auto_54769 ) ) ( not ( = ?auto_54762 ?auto_54770 ) ) ( not ( = ?auto_54762 ?auto_54771 ) ) ( not ( = ?auto_54763 ?auto_54764 ) ) ( not ( = ?auto_54763 ?auto_54765 ) ) ( not ( = ?auto_54763 ?auto_54766 ) ) ( not ( = ?auto_54763 ?auto_54767 ) ) ( not ( = ?auto_54763 ?auto_54768 ) ) ( not ( = ?auto_54763 ?auto_54769 ) ) ( not ( = ?auto_54763 ?auto_54770 ) ) ( not ( = ?auto_54763 ?auto_54771 ) ) ( not ( = ?auto_54764 ?auto_54765 ) ) ( not ( = ?auto_54764 ?auto_54766 ) ) ( not ( = ?auto_54764 ?auto_54767 ) ) ( not ( = ?auto_54764 ?auto_54768 ) ) ( not ( = ?auto_54764 ?auto_54769 ) ) ( not ( = ?auto_54764 ?auto_54770 ) ) ( not ( = ?auto_54764 ?auto_54771 ) ) ( not ( = ?auto_54765 ?auto_54766 ) ) ( not ( = ?auto_54765 ?auto_54767 ) ) ( not ( = ?auto_54765 ?auto_54768 ) ) ( not ( = ?auto_54765 ?auto_54769 ) ) ( not ( = ?auto_54765 ?auto_54770 ) ) ( not ( = ?auto_54765 ?auto_54771 ) ) ( not ( = ?auto_54766 ?auto_54767 ) ) ( not ( = ?auto_54766 ?auto_54768 ) ) ( not ( = ?auto_54766 ?auto_54769 ) ) ( not ( = ?auto_54766 ?auto_54770 ) ) ( not ( = ?auto_54766 ?auto_54771 ) ) ( not ( = ?auto_54767 ?auto_54768 ) ) ( not ( = ?auto_54767 ?auto_54769 ) ) ( not ( = ?auto_54767 ?auto_54770 ) ) ( not ( = ?auto_54767 ?auto_54771 ) ) ( not ( = ?auto_54768 ?auto_54769 ) ) ( not ( = ?auto_54768 ?auto_54770 ) ) ( not ( = ?auto_54768 ?auto_54771 ) ) ( not ( = ?auto_54769 ?auto_54770 ) ) ( not ( = ?auto_54769 ?auto_54771 ) ) ( not ( = ?auto_54770 ?auto_54771 ) ) ( ON ?auto_54769 ?auto_54770 ) ( ON ?auto_54768 ?auto_54769 ) ( ON ?auto_54767 ?auto_54768 ) ( ON ?auto_54766 ?auto_54767 ) ( CLEAR ?auto_54764 ) ( ON ?auto_54765 ?auto_54766 ) ( CLEAR ?auto_54765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54762 ?auto_54763 ?auto_54764 ?auto_54765 )
      ( MAKE-9PILE ?auto_54762 ?auto_54763 ?auto_54764 ?auto_54765 ?auto_54766 ?auto_54767 ?auto_54768 ?auto_54769 ?auto_54770 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54781 - BLOCK
      ?auto_54782 - BLOCK
      ?auto_54783 - BLOCK
      ?auto_54784 - BLOCK
      ?auto_54785 - BLOCK
      ?auto_54786 - BLOCK
      ?auto_54787 - BLOCK
      ?auto_54788 - BLOCK
      ?auto_54789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54789 ) ( ON-TABLE ?auto_54781 ) ( ON ?auto_54782 ?auto_54781 ) ( ON ?auto_54783 ?auto_54782 ) ( not ( = ?auto_54781 ?auto_54782 ) ) ( not ( = ?auto_54781 ?auto_54783 ) ) ( not ( = ?auto_54781 ?auto_54784 ) ) ( not ( = ?auto_54781 ?auto_54785 ) ) ( not ( = ?auto_54781 ?auto_54786 ) ) ( not ( = ?auto_54781 ?auto_54787 ) ) ( not ( = ?auto_54781 ?auto_54788 ) ) ( not ( = ?auto_54781 ?auto_54789 ) ) ( not ( = ?auto_54782 ?auto_54783 ) ) ( not ( = ?auto_54782 ?auto_54784 ) ) ( not ( = ?auto_54782 ?auto_54785 ) ) ( not ( = ?auto_54782 ?auto_54786 ) ) ( not ( = ?auto_54782 ?auto_54787 ) ) ( not ( = ?auto_54782 ?auto_54788 ) ) ( not ( = ?auto_54782 ?auto_54789 ) ) ( not ( = ?auto_54783 ?auto_54784 ) ) ( not ( = ?auto_54783 ?auto_54785 ) ) ( not ( = ?auto_54783 ?auto_54786 ) ) ( not ( = ?auto_54783 ?auto_54787 ) ) ( not ( = ?auto_54783 ?auto_54788 ) ) ( not ( = ?auto_54783 ?auto_54789 ) ) ( not ( = ?auto_54784 ?auto_54785 ) ) ( not ( = ?auto_54784 ?auto_54786 ) ) ( not ( = ?auto_54784 ?auto_54787 ) ) ( not ( = ?auto_54784 ?auto_54788 ) ) ( not ( = ?auto_54784 ?auto_54789 ) ) ( not ( = ?auto_54785 ?auto_54786 ) ) ( not ( = ?auto_54785 ?auto_54787 ) ) ( not ( = ?auto_54785 ?auto_54788 ) ) ( not ( = ?auto_54785 ?auto_54789 ) ) ( not ( = ?auto_54786 ?auto_54787 ) ) ( not ( = ?auto_54786 ?auto_54788 ) ) ( not ( = ?auto_54786 ?auto_54789 ) ) ( not ( = ?auto_54787 ?auto_54788 ) ) ( not ( = ?auto_54787 ?auto_54789 ) ) ( not ( = ?auto_54788 ?auto_54789 ) ) ( ON ?auto_54788 ?auto_54789 ) ( ON ?auto_54787 ?auto_54788 ) ( ON ?auto_54786 ?auto_54787 ) ( ON ?auto_54785 ?auto_54786 ) ( CLEAR ?auto_54783 ) ( ON ?auto_54784 ?auto_54785 ) ( CLEAR ?auto_54784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_54781 ?auto_54782 ?auto_54783 ?auto_54784 )
      ( MAKE-9PILE ?auto_54781 ?auto_54782 ?auto_54783 ?auto_54784 ?auto_54785 ?auto_54786 ?auto_54787 ?auto_54788 ?auto_54789 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54799 - BLOCK
      ?auto_54800 - BLOCK
      ?auto_54801 - BLOCK
      ?auto_54802 - BLOCK
      ?auto_54803 - BLOCK
      ?auto_54804 - BLOCK
      ?auto_54805 - BLOCK
      ?auto_54806 - BLOCK
      ?auto_54807 - BLOCK
    )
    :vars
    (
      ?auto_54808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54807 ?auto_54808 ) ( ON-TABLE ?auto_54799 ) ( ON ?auto_54800 ?auto_54799 ) ( not ( = ?auto_54799 ?auto_54800 ) ) ( not ( = ?auto_54799 ?auto_54801 ) ) ( not ( = ?auto_54799 ?auto_54802 ) ) ( not ( = ?auto_54799 ?auto_54803 ) ) ( not ( = ?auto_54799 ?auto_54804 ) ) ( not ( = ?auto_54799 ?auto_54805 ) ) ( not ( = ?auto_54799 ?auto_54806 ) ) ( not ( = ?auto_54799 ?auto_54807 ) ) ( not ( = ?auto_54799 ?auto_54808 ) ) ( not ( = ?auto_54800 ?auto_54801 ) ) ( not ( = ?auto_54800 ?auto_54802 ) ) ( not ( = ?auto_54800 ?auto_54803 ) ) ( not ( = ?auto_54800 ?auto_54804 ) ) ( not ( = ?auto_54800 ?auto_54805 ) ) ( not ( = ?auto_54800 ?auto_54806 ) ) ( not ( = ?auto_54800 ?auto_54807 ) ) ( not ( = ?auto_54800 ?auto_54808 ) ) ( not ( = ?auto_54801 ?auto_54802 ) ) ( not ( = ?auto_54801 ?auto_54803 ) ) ( not ( = ?auto_54801 ?auto_54804 ) ) ( not ( = ?auto_54801 ?auto_54805 ) ) ( not ( = ?auto_54801 ?auto_54806 ) ) ( not ( = ?auto_54801 ?auto_54807 ) ) ( not ( = ?auto_54801 ?auto_54808 ) ) ( not ( = ?auto_54802 ?auto_54803 ) ) ( not ( = ?auto_54802 ?auto_54804 ) ) ( not ( = ?auto_54802 ?auto_54805 ) ) ( not ( = ?auto_54802 ?auto_54806 ) ) ( not ( = ?auto_54802 ?auto_54807 ) ) ( not ( = ?auto_54802 ?auto_54808 ) ) ( not ( = ?auto_54803 ?auto_54804 ) ) ( not ( = ?auto_54803 ?auto_54805 ) ) ( not ( = ?auto_54803 ?auto_54806 ) ) ( not ( = ?auto_54803 ?auto_54807 ) ) ( not ( = ?auto_54803 ?auto_54808 ) ) ( not ( = ?auto_54804 ?auto_54805 ) ) ( not ( = ?auto_54804 ?auto_54806 ) ) ( not ( = ?auto_54804 ?auto_54807 ) ) ( not ( = ?auto_54804 ?auto_54808 ) ) ( not ( = ?auto_54805 ?auto_54806 ) ) ( not ( = ?auto_54805 ?auto_54807 ) ) ( not ( = ?auto_54805 ?auto_54808 ) ) ( not ( = ?auto_54806 ?auto_54807 ) ) ( not ( = ?auto_54806 ?auto_54808 ) ) ( not ( = ?auto_54807 ?auto_54808 ) ) ( ON ?auto_54806 ?auto_54807 ) ( ON ?auto_54805 ?auto_54806 ) ( ON ?auto_54804 ?auto_54805 ) ( ON ?auto_54803 ?auto_54804 ) ( ON ?auto_54802 ?auto_54803 ) ( CLEAR ?auto_54800 ) ( ON ?auto_54801 ?auto_54802 ) ( CLEAR ?auto_54801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54799 ?auto_54800 ?auto_54801 )
      ( MAKE-9PILE ?auto_54799 ?auto_54800 ?auto_54801 ?auto_54802 ?auto_54803 ?auto_54804 ?auto_54805 ?auto_54806 ?auto_54807 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54818 - BLOCK
      ?auto_54819 - BLOCK
      ?auto_54820 - BLOCK
      ?auto_54821 - BLOCK
      ?auto_54822 - BLOCK
      ?auto_54823 - BLOCK
      ?auto_54824 - BLOCK
      ?auto_54825 - BLOCK
      ?auto_54826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54826 ) ( ON-TABLE ?auto_54818 ) ( ON ?auto_54819 ?auto_54818 ) ( not ( = ?auto_54818 ?auto_54819 ) ) ( not ( = ?auto_54818 ?auto_54820 ) ) ( not ( = ?auto_54818 ?auto_54821 ) ) ( not ( = ?auto_54818 ?auto_54822 ) ) ( not ( = ?auto_54818 ?auto_54823 ) ) ( not ( = ?auto_54818 ?auto_54824 ) ) ( not ( = ?auto_54818 ?auto_54825 ) ) ( not ( = ?auto_54818 ?auto_54826 ) ) ( not ( = ?auto_54819 ?auto_54820 ) ) ( not ( = ?auto_54819 ?auto_54821 ) ) ( not ( = ?auto_54819 ?auto_54822 ) ) ( not ( = ?auto_54819 ?auto_54823 ) ) ( not ( = ?auto_54819 ?auto_54824 ) ) ( not ( = ?auto_54819 ?auto_54825 ) ) ( not ( = ?auto_54819 ?auto_54826 ) ) ( not ( = ?auto_54820 ?auto_54821 ) ) ( not ( = ?auto_54820 ?auto_54822 ) ) ( not ( = ?auto_54820 ?auto_54823 ) ) ( not ( = ?auto_54820 ?auto_54824 ) ) ( not ( = ?auto_54820 ?auto_54825 ) ) ( not ( = ?auto_54820 ?auto_54826 ) ) ( not ( = ?auto_54821 ?auto_54822 ) ) ( not ( = ?auto_54821 ?auto_54823 ) ) ( not ( = ?auto_54821 ?auto_54824 ) ) ( not ( = ?auto_54821 ?auto_54825 ) ) ( not ( = ?auto_54821 ?auto_54826 ) ) ( not ( = ?auto_54822 ?auto_54823 ) ) ( not ( = ?auto_54822 ?auto_54824 ) ) ( not ( = ?auto_54822 ?auto_54825 ) ) ( not ( = ?auto_54822 ?auto_54826 ) ) ( not ( = ?auto_54823 ?auto_54824 ) ) ( not ( = ?auto_54823 ?auto_54825 ) ) ( not ( = ?auto_54823 ?auto_54826 ) ) ( not ( = ?auto_54824 ?auto_54825 ) ) ( not ( = ?auto_54824 ?auto_54826 ) ) ( not ( = ?auto_54825 ?auto_54826 ) ) ( ON ?auto_54825 ?auto_54826 ) ( ON ?auto_54824 ?auto_54825 ) ( ON ?auto_54823 ?auto_54824 ) ( ON ?auto_54822 ?auto_54823 ) ( ON ?auto_54821 ?auto_54822 ) ( CLEAR ?auto_54819 ) ( ON ?auto_54820 ?auto_54821 ) ( CLEAR ?auto_54820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_54818 ?auto_54819 ?auto_54820 )
      ( MAKE-9PILE ?auto_54818 ?auto_54819 ?auto_54820 ?auto_54821 ?auto_54822 ?auto_54823 ?auto_54824 ?auto_54825 ?auto_54826 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54836 - BLOCK
      ?auto_54837 - BLOCK
      ?auto_54838 - BLOCK
      ?auto_54839 - BLOCK
      ?auto_54840 - BLOCK
      ?auto_54841 - BLOCK
      ?auto_54842 - BLOCK
      ?auto_54843 - BLOCK
      ?auto_54844 - BLOCK
    )
    :vars
    (
      ?auto_54845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54844 ?auto_54845 ) ( ON-TABLE ?auto_54836 ) ( not ( = ?auto_54836 ?auto_54837 ) ) ( not ( = ?auto_54836 ?auto_54838 ) ) ( not ( = ?auto_54836 ?auto_54839 ) ) ( not ( = ?auto_54836 ?auto_54840 ) ) ( not ( = ?auto_54836 ?auto_54841 ) ) ( not ( = ?auto_54836 ?auto_54842 ) ) ( not ( = ?auto_54836 ?auto_54843 ) ) ( not ( = ?auto_54836 ?auto_54844 ) ) ( not ( = ?auto_54836 ?auto_54845 ) ) ( not ( = ?auto_54837 ?auto_54838 ) ) ( not ( = ?auto_54837 ?auto_54839 ) ) ( not ( = ?auto_54837 ?auto_54840 ) ) ( not ( = ?auto_54837 ?auto_54841 ) ) ( not ( = ?auto_54837 ?auto_54842 ) ) ( not ( = ?auto_54837 ?auto_54843 ) ) ( not ( = ?auto_54837 ?auto_54844 ) ) ( not ( = ?auto_54837 ?auto_54845 ) ) ( not ( = ?auto_54838 ?auto_54839 ) ) ( not ( = ?auto_54838 ?auto_54840 ) ) ( not ( = ?auto_54838 ?auto_54841 ) ) ( not ( = ?auto_54838 ?auto_54842 ) ) ( not ( = ?auto_54838 ?auto_54843 ) ) ( not ( = ?auto_54838 ?auto_54844 ) ) ( not ( = ?auto_54838 ?auto_54845 ) ) ( not ( = ?auto_54839 ?auto_54840 ) ) ( not ( = ?auto_54839 ?auto_54841 ) ) ( not ( = ?auto_54839 ?auto_54842 ) ) ( not ( = ?auto_54839 ?auto_54843 ) ) ( not ( = ?auto_54839 ?auto_54844 ) ) ( not ( = ?auto_54839 ?auto_54845 ) ) ( not ( = ?auto_54840 ?auto_54841 ) ) ( not ( = ?auto_54840 ?auto_54842 ) ) ( not ( = ?auto_54840 ?auto_54843 ) ) ( not ( = ?auto_54840 ?auto_54844 ) ) ( not ( = ?auto_54840 ?auto_54845 ) ) ( not ( = ?auto_54841 ?auto_54842 ) ) ( not ( = ?auto_54841 ?auto_54843 ) ) ( not ( = ?auto_54841 ?auto_54844 ) ) ( not ( = ?auto_54841 ?auto_54845 ) ) ( not ( = ?auto_54842 ?auto_54843 ) ) ( not ( = ?auto_54842 ?auto_54844 ) ) ( not ( = ?auto_54842 ?auto_54845 ) ) ( not ( = ?auto_54843 ?auto_54844 ) ) ( not ( = ?auto_54843 ?auto_54845 ) ) ( not ( = ?auto_54844 ?auto_54845 ) ) ( ON ?auto_54843 ?auto_54844 ) ( ON ?auto_54842 ?auto_54843 ) ( ON ?auto_54841 ?auto_54842 ) ( ON ?auto_54840 ?auto_54841 ) ( ON ?auto_54839 ?auto_54840 ) ( ON ?auto_54838 ?auto_54839 ) ( CLEAR ?auto_54836 ) ( ON ?auto_54837 ?auto_54838 ) ( CLEAR ?auto_54837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54836 ?auto_54837 )
      ( MAKE-9PILE ?auto_54836 ?auto_54837 ?auto_54838 ?auto_54839 ?auto_54840 ?auto_54841 ?auto_54842 ?auto_54843 ?auto_54844 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54855 - BLOCK
      ?auto_54856 - BLOCK
      ?auto_54857 - BLOCK
      ?auto_54858 - BLOCK
      ?auto_54859 - BLOCK
      ?auto_54860 - BLOCK
      ?auto_54861 - BLOCK
      ?auto_54862 - BLOCK
      ?auto_54863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54863 ) ( ON-TABLE ?auto_54855 ) ( not ( = ?auto_54855 ?auto_54856 ) ) ( not ( = ?auto_54855 ?auto_54857 ) ) ( not ( = ?auto_54855 ?auto_54858 ) ) ( not ( = ?auto_54855 ?auto_54859 ) ) ( not ( = ?auto_54855 ?auto_54860 ) ) ( not ( = ?auto_54855 ?auto_54861 ) ) ( not ( = ?auto_54855 ?auto_54862 ) ) ( not ( = ?auto_54855 ?auto_54863 ) ) ( not ( = ?auto_54856 ?auto_54857 ) ) ( not ( = ?auto_54856 ?auto_54858 ) ) ( not ( = ?auto_54856 ?auto_54859 ) ) ( not ( = ?auto_54856 ?auto_54860 ) ) ( not ( = ?auto_54856 ?auto_54861 ) ) ( not ( = ?auto_54856 ?auto_54862 ) ) ( not ( = ?auto_54856 ?auto_54863 ) ) ( not ( = ?auto_54857 ?auto_54858 ) ) ( not ( = ?auto_54857 ?auto_54859 ) ) ( not ( = ?auto_54857 ?auto_54860 ) ) ( not ( = ?auto_54857 ?auto_54861 ) ) ( not ( = ?auto_54857 ?auto_54862 ) ) ( not ( = ?auto_54857 ?auto_54863 ) ) ( not ( = ?auto_54858 ?auto_54859 ) ) ( not ( = ?auto_54858 ?auto_54860 ) ) ( not ( = ?auto_54858 ?auto_54861 ) ) ( not ( = ?auto_54858 ?auto_54862 ) ) ( not ( = ?auto_54858 ?auto_54863 ) ) ( not ( = ?auto_54859 ?auto_54860 ) ) ( not ( = ?auto_54859 ?auto_54861 ) ) ( not ( = ?auto_54859 ?auto_54862 ) ) ( not ( = ?auto_54859 ?auto_54863 ) ) ( not ( = ?auto_54860 ?auto_54861 ) ) ( not ( = ?auto_54860 ?auto_54862 ) ) ( not ( = ?auto_54860 ?auto_54863 ) ) ( not ( = ?auto_54861 ?auto_54862 ) ) ( not ( = ?auto_54861 ?auto_54863 ) ) ( not ( = ?auto_54862 ?auto_54863 ) ) ( ON ?auto_54862 ?auto_54863 ) ( ON ?auto_54861 ?auto_54862 ) ( ON ?auto_54860 ?auto_54861 ) ( ON ?auto_54859 ?auto_54860 ) ( ON ?auto_54858 ?auto_54859 ) ( ON ?auto_54857 ?auto_54858 ) ( CLEAR ?auto_54855 ) ( ON ?auto_54856 ?auto_54857 ) ( CLEAR ?auto_54856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_54855 ?auto_54856 )
      ( MAKE-9PILE ?auto_54855 ?auto_54856 ?auto_54857 ?auto_54858 ?auto_54859 ?auto_54860 ?auto_54861 ?auto_54862 ?auto_54863 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54873 - BLOCK
      ?auto_54874 - BLOCK
      ?auto_54875 - BLOCK
      ?auto_54876 - BLOCK
      ?auto_54877 - BLOCK
      ?auto_54878 - BLOCK
      ?auto_54879 - BLOCK
      ?auto_54880 - BLOCK
      ?auto_54881 - BLOCK
    )
    :vars
    (
      ?auto_54882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_54881 ?auto_54882 ) ( not ( = ?auto_54873 ?auto_54874 ) ) ( not ( = ?auto_54873 ?auto_54875 ) ) ( not ( = ?auto_54873 ?auto_54876 ) ) ( not ( = ?auto_54873 ?auto_54877 ) ) ( not ( = ?auto_54873 ?auto_54878 ) ) ( not ( = ?auto_54873 ?auto_54879 ) ) ( not ( = ?auto_54873 ?auto_54880 ) ) ( not ( = ?auto_54873 ?auto_54881 ) ) ( not ( = ?auto_54873 ?auto_54882 ) ) ( not ( = ?auto_54874 ?auto_54875 ) ) ( not ( = ?auto_54874 ?auto_54876 ) ) ( not ( = ?auto_54874 ?auto_54877 ) ) ( not ( = ?auto_54874 ?auto_54878 ) ) ( not ( = ?auto_54874 ?auto_54879 ) ) ( not ( = ?auto_54874 ?auto_54880 ) ) ( not ( = ?auto_54874 ?auto_54881 ) ) ( not ( = ?auto_54874 ?auto_54882 ) ) ( not ( = ?auto_54875 ?auto_54876 ) ) ( not ( = ?auto_54875 ?auto_54877 ) ) ( not ( = ?auto_54875 ?auto_54878 ) ) ( not ( = ?auto_54875 ?auto_54879 ) ) ( not ( = ?auto_54875 ?auto_54880 ) ) ( not ( = ?auto_54875 ?auto_54881 ) ) ( not ( = ?auto_54875 ?auto_54882 ) ) ( not ( = ?auto_54876 ?auto_54877 ) ) ( not ( = ?auto_54876 ?auto_54878 ) ) ( not ( = ?auto_54876 ?auto_54879 ) ) ( not ( = ?auto_54876 ?auto_54880 ) ) ( not ( = ?auto_54876 ?auto_54881 ) ) ( not ( = ?auto_54876 ?auto_54882 ) ) ( not ( = ?auto_54877 ?auto_54878 ) ) ( not ( = ?auto_54877 ?auto_54879 ) ) ( not ( = ?auto_54877 ?auto_54880 ) ) ( not ( = ?auto_54877 ?auto_54881 ) ) ( not ( = ?auto_54877 ?auto_54882 ) ) ( not ( = ?auto_54878 ?auto_54879 ) ) ( not ( = ?auto_54878 ?auto_54880 ) ) ( not ( = ?auto_54878 ?auto_54881 ) ) ( not ( = ?auto_54878 ?auto_54882 ) ) ( not ( = ?auto_54879 ?auto_54880 ) ) ( not ( = ?auto_54879 ?auto_54881 ) ) ( not ( = ?auto_54879 ?auto_54882 ) ) ( not ( = ?auto_54880 ?auto_54881 ) ) ( not ( = ?auto_54880 ?auto_54882 ) ) ( not ( = ?auto_54881 ?auto_54882 ) ) ( ON ?auto_54880 ?auto_54881 ) ( ON ?auto_54879 ?auto_54880 ) ( ON ?auto_54878 ?auto_54879 ) ( ON ?auto_54877 ?auto_54878 ) ( ON ?auto_54876 ?auto_54877 ) ( ON ?auto_54875 ?auto_54876 ) ( ON ?auto_54874 ?auto_54875 ) ( ON ?auto_54873 ?auto_54874 ) ( CLEAR ?auto_54873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54873 )
      ( MAKE-9PILE ?auto_54873 ?auto_54874 ?auto_54875 ?auto_54876 ?auto_54877 ?auto_54878 ?auto_54879 ?auto_54880 ?auto_54881 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54892 - BLOCK
      ?auto_54893 - BLOCK
      ?auto_54894 - BLOCK
      ?auto_54895 - BLOCK
      ?auto_54896 - BLOCK
      ?auto_54897 - BLOCK
      ?auto_54898 - BLOCK
      ?auto_54899 - BLOCK
      ?auto_54900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_54900 ) ( not ( = ?auto_54892 ?auto_54893 ) ) ( not ( = ?auto_54892 ?auto_54894 ) ) ( not ( = ?auto_54892 ?auto_54895 ) ) ( not ( = ?auto_54892 ?auto_54896 ) ) ( not ( = ?auto_54892 ?auto_54897 ) ) ( not ( = ?auto_54892 ?auto_54898 ) ) ( not ( = ?auto_54892 ?auto_54899 ) ) ( not ( = ?auto_54892 ?auto_54900 ) ) ( not ( = ?auto_54893 ?auto_54894 ) ) ( not ( = ?auto_54893 ?auto_54895 ) ) ( not ( = ?auto_54893 ?auto_54896 ) ) ( not ( = ?auto_54893 ?auto_54897 ) ) ( not ( = ?auto_54893 ?auto_54898 ) ) ( not ( = ?auto_54893 ?auto_54899 ) ) ( not ( = ?auto_54893 ?auto_54900 ) ) ( not ( = ?auto_54894 ?auto_54895 ) ) ( not ( = ?auto_54894 ?auto_54896 ) ) ( not ( = ?auto_54894 ?auto_54897 ) ) ( not ( = ?auto_54894 ?auto_54898 ) ) ( not ( = ?auto_54894 ?auto_54899 ) ) ( not ( = ?auto_54894 ?auto_54900 ) ) ( not ( = ?auto_54895 ?auto_54896 ) ) ( not ( = ?auto_54895 ?auto_54897 ) ) ( not ( = ?auto_54895 ?auto_54898 ) ) ( not ( = ?auto_54895 ?auto_54899 ) ) ( not ( = ?auto_54895 ?auto_54900 ) ) ( not ( = ?auto_54896 ?auto_54897 ) ) ( not ( = ?auto_54896 ?auto_54898 ) ) ( not ( = ?auto_54896 ?auto_54899 ) ) ( not ( = ?auto_54896 ?auto_54900 ) ) ( not ( = ?auto_54897 ?auto_54898 ) ) ( not ( = ?auto_54897 ?auto_54899 ) ) ( not ( = ?auto_54897 ?auto_54900 ) ) ( not ( = ?auto_54898 ?auto_54899 ) ) ( not ( = ?auto_54898 ?auto_54900 ) ) ( not ( = ?auto_54899 ?auto_54900 ) ) ( ON ?auto_54899 ?auto_54900 ) ( ON ?auto_54898 ?auto_54899 ) ( ON ?auto_54897 ?auto_54898 ) ( ON ?auto_54896 ?auto_54897 ) ( ON ?auto_54895 ?auto_54896 ) ( ON ?auto_54894 ?auto_54895 ) ( ON ?auto_54893 ?auto_54894 ) ( ON ?auto_54892 ?auto_54893 ) ( CLEAR ?auto_54892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_54892 )
      ( MAKE-9PILE ?auto_54892 ?auto_54893 ?auto_54894 ?auto_54895 ?auto_54896 ?auto_54897 ?auto_54898 ?auto_54899 ?auto_54900 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_54910 - BLOCK
      ?auto_54911 - BLOCK
      ?auto_54912 - BLOCK
      ?auto_54913 - BLOCK
      ?auto_54914 - BLOCK
      ?auto_54915 - BLOCK
      ?auto_54916 - BLOCK
      ?auto_54917 - BLOCK
      ?auto_54918 - BLOCK
    )
    :vars
    (
      ?auto_54919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54910 ?auto_54911 ) ) ( not ( = ?auto_54910 ?auto_54912 ) ) ( not ( = ?auto_54910 ?auto_54913 ) ) ( not ( = ?auto_54910 ?auto_54914 ) ) ( not ( = ?auto_54910 ?auto_54915 ) ) ( not ( = ?auto_54910 ?auto_54916 ) ) ( not ( = ?auto_54910 ?auto_54917 ) ) ( not ( = ?auto_54910 ?auto_54918 ) ) ( not ( = ?auto_54911 ?auto_54912 ) ) ( not ( = ?auto_54911 ?auto_54913 ) ) ( not ( = ?auto_54911 ?auto_54914 ) ) ( not ( = ?auto_54911 ?auto_54915 ) ) ( not ( = ?auto_54911 ?auto_54916 ) ) ( not ( = ?auto_54911 ?auto_54917 ) ) ( not ( = ?auto_54911 ?auto_54918 ) ) ( not ( = ?auto_54912 ?auto_54913 ) ) ( not ( = ?auto_54912 ?auto_54914 ) ) ( not ( = ?auto_54912 ?auto_54915 ) ) ( not ( = ?auto_54912 ?auto_54916 ) ) ( not ( = ?auto_54912 ?auto_54917 ) ) ( not ( = ?auto_54912 ?auto_54918 ) ) ( not ( = ?auto_54913 ?auto_54914 ) ) ( not ( = ?auto_54913 ?auto_54915 ) ) ( not ( = ?auto_54913 ?auto_54916 ) ) ( not ( = ?auto_54913 ?auto_54917 ) ) ( not ( = ?auto_54913 ?auto_54918 ) ) ( not ( = ?auto_54914 ?auto_54915 ) ) ( not ( = ?auto_54914 ?auto_54916 ) ) ( not ( = ?auto_54914 ?auto_54917 ) ) ( not ( = ?auto_54914 ?auto_54918 ) ) ( not ( = ?auto_54915 ?auto_54916 ) ) ( not ( = ?auto_54915 ?auto_54917 ) ) ( not ( = ?auto_54915 ?auto_54918 ) ) ( not ( = ?auto_54916 ?auto_54917 ) ) ( not ( = ?auto_54916 ?auto_54918 ) ) ( not ( = ?auto_54917 ?auto_54918 ) ) ( ON ?auto_54910 ?auto_54919 ) ( not ( = ?auto_54918 ?auto_54919 ) ) ( not ( = ?auto_54917 ?auto_54919 ) ) ( not ( = ?auto_54916 ?auto_54919 ) ) ( not ( = ?auto_54915 ?auto_54919 ) ) ( not ( = ?auto_54914 ?auto_54919 ) ) ( not ( = ?auto_54913 ?auto_54919 ) ) ( not ( = ?auto_54912 ?auto_54919 ) ) ( not ( = ?auto_54911 ?auto_54919 ) ) ( not ( = ?auto_54910 ?auto_54919 ) ) ( ON ?auto_54911 ?auto_54910 ) ( ON ?auto_54912 ?auto_54911 ) ( ON ?auto_54913 ?auto_54912 ) ( ON ?auto_54914 ?auto_54913 ) ( ON ?auto_54915 ?auto_54914 ) ( ON ?auto_54916 ?auto_54915 ) ( ON ?auto_54917 ?auto_54916 ) ( ON ?auto_54918 ?auto_54917 ) ( CLEAR ?auto_54918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_54918 ?auto_54917 ?auto_54916 ?auto_54915 ?auto_54914 ?auto_54913 ?auto_54912 ?auto_54911 ?auto_54910 )
      ( MAKE-9PILE ?auto_54910 ?auto_54911 ?auto_54912 ?auto_54913 ?auto_54914 ?auto_54915 ?auto_54916 ?auto_54917 ?auto_54918 ) )
  )

)

